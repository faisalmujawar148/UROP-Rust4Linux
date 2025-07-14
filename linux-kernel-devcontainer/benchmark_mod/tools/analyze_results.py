#!/usr/bin/env python3

import os
import re
import json
from pathlib import Path

def parse_dd_output(content):
    """Parse dd command output to extract performance metrics"""
    lines = content.strip().split('\n')
    for line in lines:
        if 'bytes' in line and 'copied' in line:
            # Extract transfer rate
            match = re.search(r'(\d+(?:\.\d+)?)\s+([kKmMgG]?B/s)', line)
            if match:
                rate = float(match.group(1))
                unit = match.group(2)
                return rate, unit
    return None, None

def analyze_benchmark_results(results_dir):
    """Analyze benchmark results and generate comparison"""
    results_path = Path(results_dir)
    
    if not results_path.exists():
        print(f"Results directory {results_dir} does not exist")
        return
    
    analysis = {
        'c_driver': {},
        'rust_driver': {},
        'comparison': {}
    }
    
    # Parse C driver results
    for file_path in results_path.glob('c_*'):
        with open(file_path, 'r') as f:
            content = f.read()
            
        if 'write' in file_path.name:
            rate, unit = parse_dd_output(content)
            analysis['c_driver']['write_rate'] = f"{rate} {unit}" if rate else "N/A"
        elif 'read' in file_path.name:
            rate, unit = parse_dd_output(content)
            analysis['c_driver']['read_rate'] = f"{rate} {unit}" if rate else "N/A"
    
    # Parse Rust driver results
    for file_path in results_path.glob('rust_*'):
        with open(file_path, 'r') as f:
            content = f.read()
            
        if 'write' in file_path.name:
            rate, unit = parse_dd_output(content)
            analysis['rust_driver']['write_rate'] = f"{rate} {unit}" if rate else "N/A"
        elif 'read' in file_path.name:
            rate, unit = parse_dd_output(content)
            analysis['rust_driver']['read_rate'] = f"{rate} {unit}" if rate else "N/A"
    
    # Generate comparison report
    print("=" * 50)
    print("KERNEL DRIVER BENCHMARK RESULTS")
    print("=" * 50)
    print(f"C Driver Performance:")
    print(f"  Write Rate: {analysis['c_driver'].get('write_rate', 'N/A')}")
    print(f"  Read Rate: {analysis['c_driver'].get('read_rate', 'N/A')}")
    print()
    print(f"Rust Driver Performance:")
    print(f"  Write Rate: {analysis['rust_driver'].get('write_rate', 'N/A')}")
    print(f"  Read Rate: {analysis['rust_driver'].get('read_rate', 'N/A')}")
    print()
    
    # Save analysis as JSON
    with open(results_path / 'analysis.json', 'w') as f:
        json.dump(analysis, f, indent=2)
    
    print(f"Detailed analysis saved to {results_path}/analysis.json")

if __name__ == "__main__":
    analyze_benchmark_results("/workspaces/linux-kernel-devcontainer/benchmark_mod/results")
