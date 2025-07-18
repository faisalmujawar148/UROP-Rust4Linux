// SPDX-License-Identifier: GPL-2.0
// WIP: Rust translation of C99 "zero" target for Device-Mapper
// Based on original C implementation; needs completion

#![no_std]
#![feature(alloc_error_handler)]

use kernel::prelude::*;
use kernel::bindings;

module! {
    type: DmZero,
    name: b"dm_zero",
    author: b"faisalm",
    description: b"WIP: zero target returning zeros",
    license: b"GPL-2.0",
}

/// Holds any state for the zero target (currently none)
struct DmZero;

/// validates params
extern "C" fn zero_ctr(
    ti: *mut bindings::dm_target,
    argc: u32,
    argv: *mut *mut c_char,
) -> i32 {
    let ti = unsafe { &mut *ti };

    // Expect no args
    if argc != 0 {
        // TODO: copy error string into ti.error buffer
        // unsafe { c_str!("No arguments required").copy_to(ti.error.as_mut_ptr()); }
        return -bindings::EINVAL;
    }

    // Silently drop discard requests
    ti.num_discard_bios = 1;
    0
}

/// Maps each bio: reads return zeros, writes are dropped
extern "C" fn zero_map(
    _ti: *mut bindings::dm_target,
    bio: *mut bindings::bio,
) -> i32 {
    let b = unsafe { &mut *bio };
    let op = unsafe { bindings::bio_op(b) };

    match op {
        bindings::REQ_OP_READ => {
            // Drop readahead
            if (b.bi_opf & bindings::REQ_RAHEAD) != 0 {
                return -bindings::EIO;
            }
            unsafe { bindings::zero_fill_bio(b) };
        }
        bindings::REQ_OP_WRITE => {
            // Drop writes
        }
        _ => return -bindings::EIO,
    }

    unsafe { bindings::bio_endio(b) };
    bindings::DM_MAPIO_SUBMITTED as i32
}

impl KernelModule for DmZero {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        // Build descriptor
        let mut target = bindings::target_type {
            name: b"zero ".as_ptr() as *const _,
            version: [0, 1, 0],
            module: bindings::THIS_MODULE,
            ctr: Some(zero_ctr),
            map: Some(zero_map),
            ..Default::default()
        };

        // Register
        let ret = unsafe { bindings::dm_register_target(&mut target) };
        if ret < 0 {
            pr_err!("dm_register_target failed: {}", ret);
            return Err(Error::from_kernel_errno(ret));
        }

        pr_info!("dm_zero registered");
        Ok(DmZero)
    }
}

impl Drop for DmZero {
    fn drop(&mut self) {
        // Unregister on unload
        unsafe { bindings::dm_unregister_target(b"zero ".as_ptr() as *const _) };
        pr_info!("dm_zero unregistered");
    }
}

// TODO: implement alloc_error_handler and error-string copying

