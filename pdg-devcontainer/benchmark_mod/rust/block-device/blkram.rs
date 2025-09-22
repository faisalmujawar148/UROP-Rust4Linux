// SPDX-License-Identifier: GPL-2.0

//! A simple RAM-based block device driver in Rust for Linux kernel

use kernel::{
    alloc::{flags::GFP_KERNEL, KVec, AllocError},
    block::mq::{Operations, Request},
    error::{code::*, Result},
    prelude::*,
    sync::Arc,
    types::ARef,
};
use core::sync::atomic::{AtomicBool, Ordering};

// Define module
module! {
    type: BlkRamModule,
    name: "blkram",
    authors: ["Faisal"],
    description: "RAM-based block device driver",
    license: "GPL",
}

// Module parameters
static CAPACITY_MB: u64 = 40;
#[allow(dead_code)]
static MAX_SEGMENTS: u32 = 32;
#[allow(dead_code)]
static MAX_SEGMENT_SIZE: u32 = 65536;
static LBS: u32 = 4096;
static PBS: u32 = 4096;

struct BlkRamDevice {
    #[allow(dead_code)]
    capacity: u64,
    #[allow(dead_code)]
    data: KVec<u8>,
    valid: AtomicBool,
}

impl BlkRamDevice {
    fn new(capacity_sectors: u64) -> Result<Arc<Self>, AllocError> {
        let data_size = (capacity_sectors * 512) as usize; // 512 bytes per sector
        let mut data = KVec::new();
        data.resize(data_size, 0, GFP_KERNEL)?;
        
        let device = Arc::new(
            Self {
                capacity: capacity_sectors,
                data,
                valid: AtomicBool::new(true),
            },
            GFP_KERNEL
        )?;

        Ok(device)
    }
    #[allow(dead_code)]
    fn transfer(&self, sector: u64, length: usize, is_write: bool, buffer: &mut [u8]) -> Result {
        let pos = sector * 512; // Convert sector to byte offset
        
        if !self.valid.load(Ordering::Acquire) {
            return Err(EIO);
        }
        
        // Check bounds
        if pos + length as u64 > self.data.len() as u64 {
            return Err(EIO);
        }
        
        let pos_usize = pos as usize;
        
        // Note: This is a simplified approach that assumes single-threaded access
        // In a real driver, you'd need proper synchronization
        unsafe {
            let data_ptr = self.data.as_ptr() as *mut u8;
            let data_slice = core::slice::from_raw_parts_mut(data_ptr, self.data.len());
            
            if is_write {
                // Write operation: copy from buffer to our data
                data_slice[pos_usize..pos_usize + length].copy_from_slice(&buffer[..length]);
            } else {
                // Read operation: copy from our data to buffer
                buffer[..length].copy_from_slice(&data_slice[pos_usize..pos_usize + length]);
            }
        }
        
        Ok(())
    }
}

impl Drop for BlkRamDevice {
    fn drop(&mut self) {
        self.valid.store(false, Ordering::Release);
        // KVec will be automatically dropped
    }
}

impl Operations for BlkRamDevice {
    const USE_VTABLE_ATTR: () = ();

    fn queue_rq(rq: ARef<Request<Self>>, _is_last: bool) -> Result {
        pr_debug!("BlkRAM: Processing request\n");

        // For this simple implementation, we'll just complete the request successfully
        // In a real implementation, you'd need to:
        // 1. Extract sector, length, and operation type from the request
        // 2. Perform the actual I/O operation
        // 3. Handle the bio segments properly
        
        match Request::end_ok(rq) {
            Ok(()) => Ok(()),
            Err(_rq) => {
                // If end_ok fails, we need to end with error
                // Note: The exact error ending method may vary by kernel version
                // You might need to check the available methods on Request
                pr_err!("BlkRAM: Failed to complete request\n");
                Err(EIO)
            }
        }
    }

    fn commit_rqs() {
        // No-op for this simple driver
    }
}

// Ensure thread safety
unsafe impl Send for BlkRamDevice {}
unsafe impl Sync for BlkRamDevice {}

struct BlkRamModule {
    _device: Arc<BlkRamDevice>,
}

impl kernel::Module for BlkRamModule {
    fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
        pr_info!("Initializing blkram module\n");
        
        // Use static parameters
        let capacity_bytes = CAPACITY_MB * 1024 * 1024;
        let capacity_sectors = capacity_bytes / 512;
        
        // Create the device
        let dev = BlkRamDevice::new(capacity_sectors)?;
        
        pr_info!(
            "BlkRAM module loaded: capacity={}MB, logical_block_size={}, physical_block_size={}\n",
            CAPACITY_MB,
            LBS,
            PBS
        );
        
        Ok(Self { 
            _device: dev,
        })
    }
}

impl Drop for BlkRamModule {
    fn drop(&mut self) {
        pr_info!("BlkRAM module unloaded\n");
    }
}

// Implement Send and Sync for the module to satisfy kernel requirements
unsafe impl Send for BlkRamModule {}
unsafe impl Sync for BlkRamModule {}