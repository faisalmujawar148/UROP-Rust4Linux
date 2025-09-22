#ifndef BENCHMARK_COMMON_H
#define BENCHMARK_COMMON_H

#include <linux/kernel.h>
#include <linux/time.h>
#include <linux/ktime.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/uaccess.h>

struct benchmark_stats {
    u64 total_operations;
    u64 total_time_ns;
    u64 min_time_ns;
    u64 max_time_ns;
    u64 avg_time_ns;
};

static inline void benchmark_start(ktime_t *start_time) {
    *start_time = ktime_get();
}

static inline u64 benchmark_end(ktime_t start_time) {
    return ktime_to_ns(ktime_sub(ktime_get(), start_time));
}

static inline void benchmark_update_stats(struct benchmark_stats *stats, u64 time_ns) {
    stats->total_operations++;
    stats->total_time_ns += time_ns;
    
    if (stats->min_time_ns == 0 || time_ns < stats->min_time_ns)
        stats->min_time_ns = time_ns;
    
    if (time_ns > stats->max_time_ns)
        stats->max_time_ns = time_ns;
    
    stats->avg_time_ns = stats->total_time_ns / stats->total_operations;
}

#include <linux/limits.h> // for ULLONG_MAX

static inline void benchmark_init_stats(struct benchmark_stats *s) {
    s->total_operations = 0;
    s->total_time_ns = 0;
    s->min_time_ns = ULLONG_MAX;
    s->max_time_ns = 0;
    s->avg_time_ns = 0;
}

static inline void benchmark_update_stats(struct benchmark_stats *s, u64 time_ns) {
    s->total_operations++;
    s->total_time_ns += time_ns;
    if (time_ns < s->min_time_ns)
        s->min_time_ns = time_ns;
    if (time_ns > s->max_time_ns)
        s->max_time_ns = time_ns;
    /* running average to limit intermediate overflows (simple numerically stable approach) */
    if (s->total_operations == 1)
        s->avg_time_ns = time_ns;
    else
        s->avg_time_ns = ((s->avg_time_ns * (s->total_operations - 1)) + time_ns) / s->total_operations;
}


#endif
