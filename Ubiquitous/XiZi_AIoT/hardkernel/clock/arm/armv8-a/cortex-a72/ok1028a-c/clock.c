#include "actracer.h"
#include "core.h"
#include "cortex_a72.h"
#include "generic_timer.h"
#include "memlayout.h"

#include "clock_common_op.h"

// armv8 generic timer driver

#define CNTV_CTL_ENABLE (1 << 0)
#define CNTV_CTL_IMASK (1 << 1)
#define CNTV_CTL_ISTATUS (1 << 2)

static void enable_timer(void);
static void disable_timer(void);
static void reload_timer(void);

static void enable_timer()
{
    uint64_t c = r_cntv_ctl_el0();
    c |= CNTV_CTL_ENABLE;
    c &= ~CNTV_CTL_IMASK;
    w_cntv_ctl_el0(c);
}

static void disable_timer()
{
    uint64_t c = r_cntv_ctl_el0();
    c &= ~CNTV_CTL_ENABLE;
    c |= CNTV_CTL_IMASK;
    w_cntv_ctl_el0(c);
}

static void arch_timer_interrupt_enable()
{
    uint64_t c = r_cntv_ctl_el0();
    if (c &= CNTV_CTL_IMASK) {
        c |= ~CNTV_CTL_IMASK;
        w_cntv_ctl_el0(c);
    }
}

static void arch_timer_interrupt_disable()
{
    uint64_t c = r_cntv_ctl_el0();
    if (!(c &= CNTV_CTL_IMASK)) {
        c |= CNTV_CTL_IMASK;
        w_cntv_ctl_el0(c);
    }
}

static void reload_timer()
{
    // interval 100ms
    uint64_t interval = 100000;
    uint64_t interval_clk = interval * (r_cntfrq_el0() / 1000000);

    w_cntv_tval_el0(interval_clk);
}

void delay(uint32_t cycles)
{
    uint64_t start = r_cntvct_el0();

    while ((r_cntvct_el0() - start) < cycles)
        __asm__ volatile("yield" ::: "memory");
}

void _sys_clock_init()
{
    arch_timer_interrupt_disable();
    disable_timer();
    reload_timer();
    enable_timer();
    arch_timer_interrupt_enable();
}

static uint32_t _get_clock_int()
{
    return 0;
}

static uint64_t _get_tick()
{
    return 0;
}

static uint64_t _get_second()
{
    return 0;
}

static bool _is_timer_expired()
{
    return true;
}

static void _clear_clock_intr()
{
    disable_timer();
    reload_timer();
    enable_timer();
}

static struct XiziClockDriver hardkernel_clock_driver = {
    .sys_clock_init = _sys_clock_init,
    .get_clock_int = _get_clock_int,
    .get_tick = _get_tick,
    .get_second = _get_second,
    .is_timer_expired = _is_timer_expired,
    .clear_clock_intr = _clear_clock_intr,
};

struct XiziClockDriver* hardkernel_clock_init(struct TraceTag* hardkernel_tag)
{
    hardkernel_clock_driver.sys_clock_init();
    return &hardkernel_clock_driver;
}