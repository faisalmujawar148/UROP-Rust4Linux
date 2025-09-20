// SPDX-License-Identifier: GPL-2.0

//! Rust out-of-tree sample with benchmark

use kernel::prelude::*;
use kernel::{pr_info};
use kernel::time::Instant;

module! {
    type: RustOutOfTree,
    name: "rust_out_of_tree",
    authors: ["The Rust for Linux folks"],
    description: "Rust out-of-tree sample with KVec and init-time benchmark",
    license: "GPL v2",
}

struct RustOutOfTree {
    numbers: KVec<i32>,
}

impl kernel::Module for RustOutOfTree {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("Rust out-of-tree sample (init)\n");

        // Benchmark pushing into KVec
        let mut numbers = KVec::new();
        let iterations = 10_000;
        let start = Instant::now();
        for i in 0..iterations {
            numbers.push(i as i32, GFP_KERNEL)?;
        }
        let duration = Instant::now() - start;
        let delta_ns = duration.as_nanos();
        pr_info!("Benchmark: pushed {} entries in {} ns\n", iterations, delta_ns);

        Ok(RustOutOfTree { numbers })
    }
}

impl Drop for RustOutOfTree {
    fn drop(&mut self) {
        pr_info!("Module drop, vector length: {}\n", self.numbers.len());
        pr_info!("Rust out-of-tree sample (exit)\n");
    }
}
