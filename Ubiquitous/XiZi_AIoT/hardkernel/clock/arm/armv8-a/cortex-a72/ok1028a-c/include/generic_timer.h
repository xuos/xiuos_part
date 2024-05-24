// armv8 generic timer
static inline uint64_t
r_cntv_ctl_el0()
{
    uint64_t x;
    asm volatile("mrs %0, cntv_ctl_el0" : "=r"(x));
    return x;
}

static inline void
w_cntv_ctl_el0(uint64_t x)
{
    asm volatile("msr cntv_ctl_el0, %0" : : "r"(x));
}

static inline uint64_t
r_cntv_tval_el0()
{
    uint64_t x;
    asm volatile("mrs %0, cntv_tval_el0" : "=r"(x));
    return x;
}

static inline void
w_cntv_tval_el0(uint64_t x)
{
    asm volatile("msr cntv_tval_el0, %0" : : "r"(x));
}

static inline uint64_t
r_cntvct_el0()
{
    uint64_t x;
    asm volatile("mrs %0, cntvct_el0" : "=r"(x));
    return x;
}

static inline uint64_t
r_cntfrq_el0()
{
    uint64_t x;
    asm volatile("mrs %0, cntfrq_el0" : "=r"(x));
    return x;
}