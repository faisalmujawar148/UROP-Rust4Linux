/*
 * Simple Block Driver - "ramblock"
 * Based on the classic RAM disk example
 * 
 * This driver creates a simple block device in RAM:
 * - Fixed size (16MB)
 * - Supports read/write operations
 * - Uses a simple request queue
 * - Can be formatted and mounted like any block device
 */

 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/fs.h>
 #include <linux/errno.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/genhd.h>
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/bio.h>
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Example");
 MODULE_DESCRIPTION("Simple RAM block driver");
 MODULE_VERSION("1.0");
 
 #define RAMBLOCK_MINORS 1
 #define RAMBLOCK_SECTOR_SIZE 512
 #define RAMBLOCK_SECTORS (16 * 1024 * 1024 / RAMBLOCK_SECTOR_SIZE)  // 16MB
 #define RAMBLOCK_SIZE (RAMBLOCK_SECTORS * RAMBLOCK_SECTOR_SIZE)
 
 static int ramblock_major = 0;
 static struct ramblock_device {
     int size;                       /* Device size in sectors */
     u8 *data;                      /* The data array */
     spinlock_t lock;               /* For mutual exclusion */
     struct request_queue *queue;   /* The device request queue */
     struct gendisk *gd;           /* The gendisk structure */
     struct blk_mq_tag_set tag_set; /* Tag set for blk-mq */
 } ramblock_dev;
 
 static void ramblock_transfer(struct ramblock_device *dev, unsigned long sector,
                              unsigned long nsect, char *buffer, int write)
 {
     unsigned long offset = sector * RAMBLOCK_SECTOR_SIZE;
     unsigned long nbytes = nsect * RAMBLOCK_SECTOR_SIZE;
 
     if ((offset + nbytes) > dev->size) {
         printk(KERN_NOTICE "ramblock: Beyond-end write (%ld %ld)\n", offset, nbytes);
         return;
     }
 
     if (write) {
         memcpy(dev->data + offset, buffer, nbytes);
     } else {
         memcpy(buffer, dev->data + offset, nbytes);
     }
 }
 
 static blk_status_t ramblock_queue_rq(struct blk_mq_hw_ctx *hctx,
                                      const struct blk_mq_queue_data *bd)
 {
     struct request *req = bd->rq;
     struct ramblock_device *dev = req->rq_disk->private_data;
     struct bio_vec bvec;
     struct req_iterator iter;
     loff_t pos = blk_rq_pos(req) << 9; /* Convert to byte offset */
     loff_t dev_size = (loff_t)(dev->size);
 
     blk_mq_start_request(req);
 
     if (pos >= dev_size) {
         printk(KERN_ERR "ramblock: Request past end of device\n");
         blk_mq_end_request(req, BLK_STS_IOERR);
         return BLK_STS_OK;
     }
 
     rq_for_each_segment(bvec, req, iter) {
         size_t len = bvec.bv_len;
         void *buf = page_address(bvec.bv_page) + bvec.bv_offset;
 
         if (pos + len > dev_size)
             len = dev_size - pos;
 
         spin_lock(&dev->lock);
         if (rq_data_dir(req) == WRITE) {
             memcpy(dev->data + pos, buf, len);
         } else {
             memcpy(buf, dev->data + pos, len);
         }
         spin_unlock(&dev->lock);
 
         pos += len;
     }
 
     blk_mq_end_request(req, BLK_STS_OK);
     return BLK_STS_OK;
 }
 
 static const struct blk_mq_ops ramblock_mq_ops = {
     .queue_rq = ramblock_queue_rq,
 };
 
 static const struct block_device_operations ramblock_ops = {
     .owner = THIS_MODULE,
 };
 
 static int __init ramblock_init(void)
 {
     int ret;
 
     printk(KERN_INFO "ramblock: Loading module\n");
 
     /* Get a range of minor numbers (starting with 0) to work with */
     ramblock_major = register_blkdev(0, "ramblock");
     if (ramblock_major < 0) {
         printk(KERN_WARNING "ramblock: unable to get major number\n");
         return -EBUSY;
     }
 
     /* Initialize the device */
     memset(&ramblock_dev, 0, sizeof(struct ramblock_device));
     ramblock_dev.size = RAMBLOCK_SIZE;
     ramblock_dev.data = vmalloc(ramblock_dev.size);
     if (ramblock_dev.data == NULL) {
         printk(KERN_WARNING "ramblock: vmalloc failure.\n");
         unregister_blkdev(ramblock_major, "ramblock");
         return -ENOMEM;
     }
     spin_lock_init(&ramblock_dev.lock);
 
     /* Initialize tag set */
     ramblock_dev.tag_set.ops = &ramblock_mq_ops;
     ramblock_dev.tag_set.nr_hw_queues = 1;
     ramblock_dev.tag_set.queue_depth = 128;
     ramblock_dev.tag_set.numa_node = NUMA_NO_NODE;
     ramblock_dev.tag_set.cmd_size = 0;
     ramblock_dev.tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
     ramblock_dev.tag_set.driver_data = &ramblock_dev;
 
     ret = blk_mq_alloc_tag_set(&ramblock_dev.tag_set);
     if (ret) {
         printk(KERN_WARNING "ramblock: Failed to allocate tag set\n");
         vfree(ramblock_dev.data);
         unregister_blkdev(ramblock_major, "ramblock");
         return ret;
     }
 
     /* Allocate the request queue */
     ramblock_dev.queue = blk_mq_init_queue(&ramblock_dev.tag_set);
     if (IS_ERR(ramblock_dev.queue)) {
         printk(KERN_WARNING "ramblock: Failed to allocate request queue\n");
         blk_mq_free_tag_set(&ramblock_dev.tag_set);
         vfree(ramblock_dev.data);
         unregister_blkdev(ramblock_major, "ramblock");
         return PTR_ERR(ramblock_dev.queue);
     }
 
     /* Get a gendisk structure */
     ramblock_dev.gd = blk_alloc_disk(NUMA_NO_NODE);
     if (!ramblock_dev.gd) {
         printk(KERN_WARNING "ramblock: alloc_disk failure\n");
         blk_cleanup_queue(ramblock_dev.queue);
         blk_mq_free_tag_set(&ramblock_dev.tag_set);
         vfree(ramblock_dev.data);
         unregister_blkdev(ramblock_major, "ramblock");
         return -ENOMEM;
     }
 
     ramblock_dev.gd->major = ramblock_major;
     ramblock_dev.gd->first_minor = 0;
     ramblock_dev.gd->minors = RAMBLOCK_MINORS;
     ramblock_dev.gd->fops = &ramblock_ops;
     ramblock_dev.gd->queue = ramblock_dev.queue;
     ramblock_dev.gd->private_data = &ramblock_dev;
     snprintf(ramblock_dev.gd->disk_name, 32, "ramblock");
     set_capacity(ramblock_dev.gd, RAMBLOCK_SECTORS);
 
     /* Tell the kernel about us */
     add_disk(ramblock_dev.gd);
 
     printk(KERN_INFO "ramblock: Module loaded. Device size: %d KB\n", 
            RAMBLOCK_SIZE / 1024);
     return 0;
 }
 
 static void __exit ramblock_exit(void)
 {
     printk(KERN_INFO "ramblock: Unloading module\n");
 
     del_gendisk(ramblock_dev.gd);
     put_disk(ramblock_dev.gd);
     blk_cleanup_queue(ramblock_dev.queue);
     blk_mq_free_tag_set(&ramblock_dev.tag_set);
     vfree(ramblock_dev.data);
     unregister_blkdev(ramblock_major, "ramblock");
 
     printk(KERN_INFO "ramblock: Module unloaded\n");
 }
 
 module_init(ramblock_init);
 module_exit(ramblock_exit);