// SPDX-License-Identifier: GPL-2.0
#![allow(dead_code)]
#![allow(missing_docs)]

use kernel::prelude::*;
use kernel::{ThisModule};
use kernel::bindings;

/// The module struct
struct HelloModule;

impl HelloModule {
    /// Read callback
    unsafe extern "C" fn read(
        _file: *mut bindings::file,
        _buf: *mut c_void,
        count: usize,
        _ppos: *mut bindings::loff_t,
    ) -> isize {
        count as isize
    }

    /// Write callback
    unsafe extern "C" fn write(
        _file: *mut bindings::file,
        _buf: *const c_void,
        count: usize,
        _ppos: *mut bindings::loff_t,
    ) -> isize {
        count as isize
    }
}

/// Implement `Module` for initialization
impl kernel::Module for HelloModule {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("hello_raw: module loaded\n");
        Ok(HelloModule)
    }
}

impl Drop for HelloModule {
    fn drop(&mut self) {
        pr_info!("hello_raw: module unloaded\n");
    }
}

// Register the module
module! {
    type: HelloModule,
    name: "hello_raw",
    authors: ["Faisal"],
    description: "Simple Rust char device",
    license: "GPL",
}
