/* SPDX-License-Identifier: GPL-2.0 */

/*
 * C out-of-tree sample with benchmark
 */

 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/ktime.h>
 
 #define ITERATIONS 10000
 
 static int *numbers;
 static size_t num_len;
 
 static int __init c_out_of_tree_init(void)
 {
     ktime_t start, end;
     s64 delta_ns;
     size_t i;
 
     pr_info("Rust out-of-tree sample (init)\n");
 
     /* Allocate array */
     numbers = kmalloc_array(ITERATIONS, sizeof(int), GFP_KERNEL);
     if (!numbers) {
         pr_err("Failed to allocate numbers array\n");
         return -ENOMEM;
     }
 
     start = ktime_get();
     for (i = 0; i < ITERATIONS; ++i) {
         numbers[i] = i;
     }
     end = ktime_get();
 
     delta_ns = ktime_to_ns(ktime_sub(end, start));
     pr_info("Benchmark: pushed %d entries in %lld ns\n", ITERATIONS, (long long)delta_ns);
 
     num_len = ITERATIONS;
     return 0;
 }
 
 static void __exit c_out_of_tree_exit(void)
 {
     pr_info("Module exit, vector length: %zu\n", num_len);
     pr_info("Rust out-of-tree sample (exit)\n");
     kfree(numbers);
 }
 
 module_init(c_out_of_tree_init);
 module_exit(c_out_of_tree_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Faisal");
 MODULE_DESCRIPTION("Rust out-of-tree sample with C version benchmark");
 