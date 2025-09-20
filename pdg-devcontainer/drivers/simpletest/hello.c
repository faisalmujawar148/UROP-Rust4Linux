// SPDX-License-Identifier: GPL
// simple Hello World kernel module in C with timing

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/ktime.h>

static u64 init_time;

static int __init hello_init(void)
{
    u64 start = ktime_get_ns();

    pr_info("hello world\n");

    u64 end = ktime_get_ns();
    init_time = end - start;
    pr_info("Init took: %llu ns\n", init_time);

    return 0;
}

static void __exit hello_exit(void)
{
    u64 start = ktime_get_ns();

    pr_info("byebye\n");
    pr_info("Previous init took: %llu ns\n", init_time);

    u64 end = ktime_get_ns();
    pr_info("Cleanup took: %llu ns\n", end - start);
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("FM");
MODULE_DESCRIPTION("simple Hello World kernel module with timing");

