extern void _svcall(uintptr_t* contex);

x_base __attribute__((naked)) DisableLocalInterrupt()
{

}

void __attribute__((naked)) EnableLocalInterrupt(x_base level)
{

}

int32 ArchEnableHwIrq(uint32_t irq_num)
{

    return EOK;
}

int32 ArchDisableHwIrq(uint32_t irq_num)
{
    return EOK;
}

extern  void KTaskOsAssignAfterIrq(void *context);

void IsrEntry()
{
    uint32_t ipsr;

    // __asm__ volatile("MRS %0, IPSR" : "=r"(ipsr));

    isrManager.done->incCounter();
    isrManager.done->handleIrq(ipsr);
    KTaskOsAssignAfterIrq(NONE);
    isrManager.done->decCounter();
    
}

uintptr_t *Svcall(unsigned int ipsr,  uintptr_t* contex )
{
#ifdef TASK_ISOLATION
    _svcall(contex);
#endif
    return contex;
}