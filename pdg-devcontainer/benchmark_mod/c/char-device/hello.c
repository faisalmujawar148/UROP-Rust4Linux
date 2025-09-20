/*
 * Simple Character Driver - "hello"
 * Based on the classic kernel programming example
 * 
 * This driver creates /dev/hello that:
 * - Returns "Hello, World!\n" on read
 * - Accepts writes but ignores them
 * - Supports open/close
 */

 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 
 #define DEVICE_NAME "hello"
 #define CLASS_NAME "hello_class"
 #define BUFFER_SIZE 1024
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Example");
 MODULE_DESCRIPTION("Simple character driver");
 MODULE_VERSION("1.0");
 
 static int major_number;
 static struct class* hello_class = NULL;
 static struct device* hello_device = NULL;
 static struct cdev hello_cdev;
 
 static char message[BUFFER_SIZE] = "Hello, World!\n";
 static int message_len = 14;
 
 // Function prototypes
 static int hello_open(struct inode *inode, struct file *file);
 static int hello_release(struct inode *inode, struct file *file);
 static ssize_t hello_read(struct file *file, char __user *buffer, size_t len, loff_t *offset);
 static ssize_t hello_write(struct file *file, const char __user *buffer, size_t len, loff_t *offset);
 
 // File operations structure
 static struct file_operations hello_fops = {
     .owner = THIS_MODULE,
     .open = hello_open,
     .release = hello_release,
     .read = hello_read,
     .write = hello_write,
 };
 
 static int hello_open(struct inode *inode, struct file *file)
 {
     printk(KERN_INFO "hello: Device opened\n");
     return 0;
 }
 
 static int hello_release(struct inode *inode, struct file *file)
 {
     printk(KERN_INFO "hello: Device closed\n");
     return 0;
 }
 
 static ssize_t hello_read(struct file *file, char __user *buffer, size_t len, loff_t *offset)
 {
     int bytes_to_read;
     int bytes_read = 0;
     
     // Check if we're at the end
     if (*offset >= message_len)
         return 0;
     
     // Calculate how many bytes to read
     bytes_to_read = min((int)len, message_len - (int)*offset);
     
     // Copy data to user space
     if (copy_to_user(buffer, message + *offset, bytes_to_read)) {
         return -EFAULT;
     }
     
     *offset += bytes_to_read;
     bytes_read = bytes_to_read;
     
     printk(KERN_INFO "hello: Read %d bytes\n", bytes_read);
     return bytes_read;
 }
 
 static ssize_t hello_write(struct file *file, const char __user *buffer, size_t len, loff_t *offset)
 {
     printk(KERN_INFO "hello: Write operation with %zu bytes (ignored)\n", len);
     return len; // Pretend we wrote everything
 }
 
 static int __init hello_init(void)
 {
     dev_t dev_num;
     int result;
     
     printk(KERN_INFO "hello: Loading module\n");
     
     // Allocate major number dynamically
     result = alloc_chrdev_region(&dev_num, 0, 1, DEVICE_NAME);
     if (result < 0) {
         printk(KERN_ALERT "hello: Failed to allocate major number\n");
         return result;
     }
     major_number = MAJOR(dev_num);
     printk(KERN_INFO "hello: Registered with major number %d\n", major_number);
     
     // Initialize and add character device
     cdev_init(&hello_cdev, &hello_fops);
     hello_cdev.owner = THIS_MODULE;
     
     result = cdev_add(&hello_cdev, dev_num, 1);
     if (result < 0) {
         unregister_chrdev_region(dev_num, 1);
         printk(KERN_ALERT "hello: Failed to add character device\n");
         return result;
     }
     
     // Create device class
     hello_class = class_create(CLASS_NAME);
     if (IS_ERR(hello_class)) {
         cdev_del(&hello_cdev);
         unregister_chrdev_region(dev_num, 1);
         printk(KERN_ALERT "hello: Failed to create device class\n");
         return PTR_ERR(hello_class);
     }
     
     // Create device
     hello_device = device_create(hello_class, NULL, dev_num, NULL, DEVICE_NAME);
     if (IS_ERR(hello_device)) {
         class_destroy(hello_class);
         cdev_del(&hello_cdev);
         unregister_chrdev_region(dev_num, 1);
         printk(KERN_ALERT "hello: Failed to create device\n");
         return PTR_ERR(hello_device);
     }
     
     printk(KERN_INFO "hello: Module loaded successfully. Device created at /dev/%s\n", DEVICE_NAME);
     return 0;
 }
 
 static void __exit hello_exit(void)
 {
     dev_t dev_num = MKDEV(major_number, 0);
     
     printk(KERN_INFO "hello: Unloading module\n");
     
     // Clean up in reverse order
     device_destroy(hello_class, dev_num);
     class_destroy(hello_class);
     cdev_del(&hello_cdev);
     unregister_chrdev_region(dev_num, 1);
     
     printk(KERN_INFO "hello: Module unloaded\n");
 }
 
 module_init(hello_init);
 module_exit(hello_exit);