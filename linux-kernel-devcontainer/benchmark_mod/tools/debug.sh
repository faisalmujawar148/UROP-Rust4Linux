#!/bin/bash

# Debug script to diagnose the benchmark script issues

echo "=== Debugging run_benchmark.sh ==="
echo "Current working directory: $(pwd)"
echo "Script location: $0"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "SCRIPT_DIR=$SCRIPT_DIR"

# Calculate project root (assuming script is in benchmark_mod/tools/)
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
echo "PROJECT_ROOT=$PROJECT_ROOT"

# Set module paths
C_MOD="$PROJECT_ROOT/benchmark_mod/c/simpletest"
RUST_MOD="$PROJECT_ROOT/benchmark_mod/rust/simpletest"

echo "C_MOD=$C_MOD"
echo "RUST_MOD=$RUST_MOD"

# Check if paths exist
echo ""
echo "=== Path Verification ==="
echo "C module path exists: $([ -d "$C_MOD" ] && echo "YES" || echo "NO")"
echo "RUST module path exists: $([ -d "$RUST_MOD" ] && echo "YES" || echo "NO")"

# List contents if paths exist
if [ -d "$C_MOD" ]; then
    echo "C module contents:"
    ls -la "$C_MOD"
fi

if [ -d "$RUST_MOD" ]; then
    echo "RUST module contents:"
    ls -la "$RUST_MOD"
fi

# Check the actual run_benchmark.sh file
BENCHMARK_SCRIPT="$PROJECT_ROOT/benchmark_mod/tools/run_benchmark.sh"
echo ""
echo "=== Benchmark Script Analysis ==="
echo "Benchmark script path: $BENCHMARK_SCRIPT"
echo "Benchmark script exists: $([ -f "$BENCHMARK_SCRIPT" ] && echo "YES" || echo "NO")"

if [ -f "$BENCHMARK_SCRIPT" ]; then
    echo "First 10 lines of run_benchmark.sh:"
    head -10 "$BENCHMARK_SCRIPT"
    echo ""
    echo "Line 7 specifically:"
    sed -n '7p' "$BENCHMARK_SCRIPT"
    echo ""
    echo "Lines around line 7:"
    sed -n '5,9p' "$BENCHMARK_SCRIPT"
fi