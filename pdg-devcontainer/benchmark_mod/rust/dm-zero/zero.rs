// SPDX-License-Identifier: GPL-2.0

//! Device-mapper target that returns zeroes on read operations.
//! 
//! This module implements a simple dm-zero target in Rust for Linux kernel.

use kernel::prelude::*;
use core::ffi::{c_char, c_int, c_void};
use core::ptr;

module! {
    type: DmZero,
    name: "dm_zero_rust",
    authors: ["faisal"],
    description: "Device-mapper target that returns zeroes on read",
    license: "GPL",
}

struct DmZero;

impl kernel::Module for DmZero {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("Loading dm-zero-rust module\n");
        
        // Debug: print the target structure address and name pointer
        unsafe {
            pr_info!("ZERO_TARGET addr: {:p}\n", &raw mut ZERO_TARGET);
            pr_info!("ZERO_TARGET.name: {:p}\n", (*ptr::addr_of_mut!(ZERO_TARGET)).name);
        }
        
        let ret = unsafe { dm_register_target(&raw mut ZERO_TARGET) };
        if ret < 0 {
            pr_err!("Failed to register dm-zero target: {}\n", ret);
            return Err(Error::from_errno(ret));
        }
        pr_info!("dm-zero-rust module loaded successfully\n");
        Ok(DmZero)
    }
}

impl Drop for DmZero {
    fn drop(&mut self) {
        pr_info!("Unloading dm-zero-rust module\n");
        unsafe {
            dm_unregister_target(&raw mut ZERO_TARGET);
        }
        pr_info!("dm-zero-rust module unloaded\n");
    }
}

/// Device-mapper target structure for interfacing with the kernel.
#[repr(C)]
pub struct dm_target {
    error: *const c_char,
    num_discard_bios: u32,
    // Add other fields as needed
}

/// Bio (block I/O) structure for handling I/O operations.
#[repr(C)]
pub struct bio {
    bi_opf: u32,
    bi_iter: bio_iter,
    // Simplified - real bio structure is much larger
}

/// Bio iterator structure.
#[repr(C)]
pub struct bio_iter {
    bi_sector: u64,
    bi_size: u32,
    bi_idx: u32,
    bi_bvec_done: u32,
}

extern "C" {
    fn dm_register_target(target: *mut target_type) -> c_int;
    fn dm_unregister_target(target: *mut target_type);
    fn bio_endio(bio: *mut bio);
}

/// Extract the operation type from bio flags.
fn bio_op(bio: *const bio) -> u32 {
    unsafe { (*bio).bi_opf & 0xff }
}

/// Fill bio with zeros (simplified implementation).
fn zero_fill_bio(_bio: *mut bio) {
    // In a real implementation, this would zero out the bio's data pages
    // For now, we'll just mark it as handled
}

const REQ_OP_READ: u32 = 0;
const REQ_OP_WRITE: u32 = 1;
const REQ_RAHEAD: u32 = 1 << 18;

const DM_MAPIO_SUBMITTED: c_int = 0;
const EINVAL: c_int = 22;
const EIO: c_int = 5;

#[no_mangle]
extern "C" fn zero_ctr(ti: *mut dm_target, argc: u32, _argv: *mut *mut c_char) -> c_int {
    if argc != 0 {
        unsafe {
            (*ti).error = b"No arguments required\0".as_ptr() as *const c_char;
        }
        return -EINVAL;
    }
    unsafe {
        (*ti).num_discard_bios = 1;
    }
    0
}

#[no_mangle]
extern "C" fn zero_dtr(_ti: *mut dm_target) {
    // Destructor - nothing to clean up for this simple target
}

#[no_mangle]
extern "C" fn zero_map(_ti: *mut dm_target, bio: *mut bio) -> c_int {
    let op = bio_op(bio);
    match op {
        REQ_OP_READ => {
            unsafe {
                if (*bio).bi_opf & REQ_RAHEAD != 0 {
                    return -EIO;
                }
                zero_fill_bio(bio);
            }
        }
        REQ_OP_WRITE => {
            // Accept writes but do nothing (data is discarded)
        }
        _ => return -EIO,
    }
    unsafe {
        bio_endio(bio);
    }
    DM_MAPIO_SUBMITTED
}

#[no_mangle]
extern "C" fn zero_status(_ti: *mut dm_target, _status_type: c_int, result: *mut c_char, maxlen: usize) {
    let msg = b"zero\0";
    unsafe {
        let len = core::cmp::min(msg.len() - 1, maxlen - 1); // Leave room for null terminator
        if len > 0 {
            ptr::copy_nonoverlapping(msg.as_ptr(), result as *mut u8, len);
            *result.add(len) = 0; // Ensure null termination
        }
    }
}

/// Target type structure defining the dm-zero target operations.
#[repr(C)]
pub struct target_type {
    name: *const c_char,
    version: [u32; 3],
    module: *mut c_void,
    ctr: extern "C" fn(*mut dm_target, u32, *mut *mut c_char) -> c_int,
    dtr: extern "C" fn(*mut dm_target),
    map: extern "C" fn(*mut dm_target, *mut bio) -> c_int,
    status: extern "C" fn(*mut dm_target, c_int, *mut c_char, usize),
    // Add other required fields if needed
}

unsafe impl Sync for target_type {}

// Static string for the target name
static TARGET_NAME: &[u8] = b"zero\0";

#[no_mangle]
static mut ZERO_TARGET: target_type = target_type {
    name: TARGET_NAME.as_ptr() as *const c_char,
    version: [1, 1, 0],
    module: ptr::null_mut(),
    ctr: zero_ctr,
    dtr: zero_dtr,
    map: zero_map,
    status: zero_status,
};