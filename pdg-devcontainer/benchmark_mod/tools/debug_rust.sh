#!/bin/bash

PROJECT_ROOT="/workspaces/linux-kernel-devcontainer"
C_MOD="$PROJECT_ROOT/benchmark_mod/c/simpletest"
RUST_MOD="$PROJECT_ROOT/benchmark_mod/rust/simpletest"

echo "=== Checking Makefiles ==="
echo ""

echo "=== C Module Makefile ==="
echo "Location: $C_MOD/Makefile"
if [ -f "$C_MOD/Makefile" ]; then
    cat "$C_MOD/Makefile"
else
    echo "C Makefile not found"
fi
echo ""

echo "=== Rust Module Makefile ==="
echo "Location: $RUST_MOD/Makefile"
if [ -f "$RUST_MOD/Makefile" ]; then
    cat "$RUST_MOD/Makefile"
else
    echo "Rust Makefile not found"
fi
echo ""

echo "=== Testing Manual Build Commands ==="
echo ""

echo "--- C Module Build Test ---"
cd "$C_MOD"
echo "Current directory: $(pwd)"
echo "Running: make KDIR=$PROJECT_ROOT"
make KDIR="$PROJECT_ROOT" 2>&1 | head -20
echo ""

echo "--- Rust Module Build Test ---"
cd "$RUST_MOD"
echo "Current directory: $(pwd)"
echo "Running: make KDIR=$PROJECT_ROOT"
make KDIR="$PROJECT_ROOT" 2>&1 | head -20
echo ""

echo "=== Checking if files are built ==="
echo "C module files:"
ls -la "$C_MOD"/*.ko 2>/dev/null || echo "No .ko files found"
echo ""
echo "Rust module files:"
ls -la "$RUST_MOD"/*.ko 2>/dev/null || echo "No .ko files found"