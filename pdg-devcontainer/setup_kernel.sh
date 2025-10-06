
#!/bin/bash
set -e

KERNEL_DIR="linux-rust"

echo "=== Kernel Configuration for Rust Block Device Driver ==="
echo ""

# Change to kernel directory
cd "$KERNEL_DIR"

echo "Step 1: Cleaning kernel build..."
make mrproper

echo ""
echo "Step 2: Initial configuration..."
make LLVM=19 LLVM_IAS=1 defconfig

echo ""
echo "Step 3: Enabling Rust support..."
scripts/config --enable RUST
scripts/config --enable RUST_IS_AVAILABLE
scripts/config --enable RUST_DEBUG_ASSERTIONS

echo ""
echo "Step 4: Enabling block device support..."
# Core block layer support
scripts/config --enable BLOCK
scripts/config --enable BLK_DEV

# Block device drivers
scripts/config --module BLK_DEV_LOOP
scripts/config --module BLK_DEV_RAM
scripts/config --set-val BLK_DEV_RAM_COUNT 16
scripts/config --set-val BLK_DEV_RAM_SIZE 65536

# Multi-queue block layer
scripts/config --enable BLK_MQ_VIRTIO
scripts/config --enable BLK_CGROUP
scripts/config --enable BLK_DEBUG_FS

# Additional block features
scripts/config --enable BLK_DEV_INTEGRITY
scripts/config --enable BLK_DEV_THROTTLING

echo ""
echo "Step 5: Enabling module support..."
scripts/config --enable MODULES
scripts/config --enable MODULE_UNLOAD
scripts/config --enable MODULE_FORCE_UNLOAD
scripts/config --enable MODVERSIONS

echo ""
echo "Step 6: Enabling debugging support (optional but helpful)..."
scripts/config --enable DEBUG_KERNEL
scripts/config --enable DEBUG_INFO
scripts/config --enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
scripts/config --enable FRAME_POINTER

echo ""
echo "Step 7: Applying configuration..."
make LLVM=19 LLVM_IAS=1 olddefconfig

echo ""
echo "=== Verifying Configuration ==="
echo ""
echo "Rust support:"
grep -E "CONFIG_RUST|CONFIG_RUST_IS_AVAILABLE" .config | grep -v "^#"

echo ""
echo "Block device support:"
grep -E "CONFIG_BLOCK|CONFIG_BLK_DEV" .config | grep -v "^#" | head -10

echo ""
echo "Module support:"
grep -E "CONFIG_MODULES|CONFIG_MODULE_" .config | grep -v "^#" | head -5

echo ""
echo "=== Configuration Complete ==="
echo ""
echo "Now building kernel with LLVM 19..."
echo "This will take 10-30 minutes depending on your CPU..."
echo ""

# Get CPU count
NPROC=$(nproc)
echo "Building with $NPROC parallel jobs..."
echo ""

# Build the kernel
make LLVM=19 LLVM_IAS=1 -j$NPROC

echo ""
echo "=== Verifying Rust Components Were Built ==="
echo ""
if [ -f "rust/libkernel.rlib" ] || [ -f "rust/kernel.o" ]; then
    echo "✓ Kernel Rust components built successfully!"
    ls -lh rust/*.{o,rlib} 2>/dev/null | head -10
else
    echo "✗ WARNING: Rust components may not have been built!"
    ls -la rust/
fi


#!/usr/bin/env bash
set -euo pipefail
KDIR="linux-rust"

cd "$KDIR"

echo "Cleaning..."
make mrproper

echo "Configuring defconfig..."
make LLVM=19 LLVM_IAS=1 defconfig

echo "Enabling Rust in kernel config..."
scripts/config --enable RUST
scripts/config --enable RUST_IS_AVAILABLE
scripts/config --enable RUST_DEBUG_ASSERTIONS

echo "Applying config..."
make LLVM=19 LLVM_IAS=1 olddefconfig

echo "Check rustc exists..."
if ! command -v rustc >/dev/null; then
  echo "rustc not found. Install the required Rust toolchain (likely nightly) and retry."
  exit 1
fi
echo "rustc: $(rustc --version)"

echo "Building kernel (watching for rust-related errors)..."
# smaller parallelism lets you see first errors quickly; increase later when happy
make LLVM=19 LLVM_IAS=1 -j2 2>&1 | tee ../kernel-build.log

echo "Searching build log for rust errors..."
if grep -i "error: " ../kernel-build.log | grep -i "rust"; then
  echo "Rust compilation errors detected in kernel build. Inspect ../kernel-build.log"
  exit 1
fi

echo "Verifying rust artifacts..."
if [ -f "rust/libkernel.rlib" ] || [ -f "rust/kernel.o" ]; then
  echo "✓ Kernel Rust components built successfully!"
else
  echo "✗ Kernel Rust components not found after build. Inspect ../kernel-build.log"
  exit 1
fi


echo ""
echo "=== Build Complete ==="
echo ""
echo "You can now build your Rust block device module:"
echo "  cd benchmark_mod/rust/block-device"
echo "  make clean"
echo "  make"
echo ""

