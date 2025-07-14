// SPDX-License-Identifier: GPL
// simple Hello World kernel module in Rust

#![no_std]
#![feature(allocator_api)]

use kernel::prelude::*;

module! {
    type: HelloRust,
    name: b"hello_rust",
    author: b"FM",
    description: b"simple Hello World kernel module",
    license: b"GPL",
}

struct HelloRust;

impl KernelModule for HelloRust {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("hello world");
        Ok(HelloRust)
    }
}

impl Drop for HelloRust {
    fn drop(&mut self) {
        pr_info!("byebye");
    }
}

