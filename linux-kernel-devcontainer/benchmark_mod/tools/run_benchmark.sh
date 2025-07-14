#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

KDIR="$PROJECT_ROOT"
C_MOD="$PROJECT_ROOT/benchmark_mod/c/simpletest"
RUST_MOD="$PROJECT_ROOT/benchmark_mod/rust/simpletest"
ITERATIONS=1
RESULTS_DIR="$PROJECT_ROOT/benchmark_mod/results"

mkdir -p "$RESULTS_DIR"

echo "=== Kernel Module Benchmark ==="
echo "Project Root: $PROJECT_ROOT"
echo "Kernel Directory: $KDIR"
echo "C Module: $C_MOD"
echo "Rust Module: $RUST_MOD"
echo "Iterations: $ITERATIONS"
echo "Results Directory: $RESULTS_DIR"
echo ""

benchmark_module() {
    local module_dir="$1"
    local module_name="$2"
    local output_file="$RESULTS_DIR/${module_name}_benchmark.txt"
    
    echo "=== Benchmarking $module_name module ==="
    echo "Module directory: $module_dir"
    
    if [ ! -d "$module_dir" ]; then
        echo "ERROR: Module directory $module_dir does not exist"
        return 1
    fi
    
    cd "$module_dir"
    
    echo "Cleaning previous builds..."
    make clean KDIR="$KDIR" 2>/dev/null || true
    
    echo "Building $module_name module..."
    echo "Build times for $module_name:" > "$output_file"
    
    for i in $(seq 1 $ITERATIONS); do
        echo "  Iteration $i/$ITERATIONS"
        
        make clean KDIR="$KDIR" 2>/dev/null || true
        
        start_time=$(date +%s.%N)
        if make KDIR="$KDIR" > /dev/null 2>&1; then
            end_time=$(date +%s.%N)
            build_time=$(echo "$end_time - $start_time" | bc -l)
            echo "Iteration $i: ${build_time}s" >> "$output_file"
            echo "    Build time: ${build_time}s"
        else
            echo "    Build FAILED"
            echo "Iteration $i: FAILED" >> "$output_file"
        fi
    done
    
    echo "Results saved to: $output_file"
    echo ""
}

if ! command -v bc &> /dev/null; then
    echo "Installing bc for floating point arithmetic..."
    apt-get update && apt-get install -y bc
fi

if [ -d "$C_MOD" ]; then
    benchmark_module "$C_MOD" "c"
else
    echo "ERROR: C module directory not found: $C_MOD"
fi

if [ -d "$RUST_MOD" ]; then
    benchmark_module "$RUST_MOD" "rust"
else
    echo "ERROR: Rust module directory not found: $RUST_MOD"
fi

cd "$PROJECT_ROOT"

echo "=== Benchmark Complete ==="
echo "Results are available in: $RESULTS_DIR"
echo ""
echo "To analyze results, run:"
echo "python3 benchmark_mod/tools/analyze_results.py"