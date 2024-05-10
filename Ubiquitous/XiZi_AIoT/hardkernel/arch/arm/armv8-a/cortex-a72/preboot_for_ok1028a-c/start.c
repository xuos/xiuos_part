#include "core.h"
#include "cortex_a72.h"
#include "memlayout.h"

void _entry();
void main();
extern char end[];

// entry.S needs one stack per CPU.
__attribute__((aligned(16))) char stack0[4096 * NR_CPU];

// entry.S jumps here in supervisor mode (EL1) on stack0.
// in qemu-system-aarch64, default EL (Exeception Level) is 1.
void start()
{
    main();
}

__attribute__((aligned(PGSIZE))) uint64_t l1entrypgt[512];
__attribute__((aligned(PGSIZE))) uint64_t l2entrypgt[512];
__attribute__((aligned(PGSIZE))) uint64_t l1kpgt[512];
__attribute__((aligned(PGSIZE))) uint64_t l2kpgt[512];