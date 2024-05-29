// #include "memlayout.h"
#include "core.h"
// #include "registers.h"
// #include "cortex_a72.h"
        // qemu -kernel loads the kernel at 0x40000000
        // and causes each CPU to jump there.
        // kernel.ld causes the following code to
        // be placed at 0x40000000.
.section ".text"
//.global _entry
.global _boot_start
.global primary_cpu_init

_boot_start:
        // set up a stack for C.
        // stack0 is declared in start.c,
        // with a 4096-byte stack per CPU.
        // sp = stack0 + ((cpuid+1) * 4096)
        // cpuid = mpidr_el1 & 0xff
        // save r0 for cores 1-3, r0 arg field passed by ROM
        // r0 is a function pointer for secondary cpus

        // mov x4, 	x0

        mrs	x0, 	spsr_el1    /* Enter EL1 (Exception Level 1) */
        bic	x0, 	x0, #0x1f
        MOV     x1,     #0xC5
        ORR     x0,     x0, x1
        msr	spsr_el1,	x0                


        /* set NSACR, both Secure and Non-secure access are allowed to NEON */
        MRS     X1,     CPACR_EL1
        ORR     X1,     X1, #(0X3 << 20)
        MSR     CPACR_EL1, X1
        ISB

        // clear some registers
        msr     elr_el1, XZR

        ldr     x0, =stacks_top
        mov     x1, #MODE_STACK_SIZE

         // get cpu id, and subtract the offset from the stacks base address
        mrs     x2,     mpidr_el1
        and     x2,     x2, #0x3
        mov     x5,     x2
        mul     x3,     x2, x1
        sub     x0,     x0, x3
        
        MOV     X2,     #ARM_MODE_EL1_h | DIS_INT  
        MSR     SPSR_EL1, X2
        mov     sp,     x0
        SUB     x0,     x0,x1

            // check cpu id - cpu0 is primary cpu
        cmp     x5, 	#0
        beq     primary_cpu_init
        bl      bootmain     // for secondary cpus, jump to argument function pointer passed in by ROM

        bl      .

primary_cpu_init:
   	/* init .bss */
         /* clear the .bss section (zero init) */
        ldr     x1,	=boot_start_addr
        ldr     x2,	=boot_end_addr
        mov     x3,	#0
        1:  
        cmp     x1,	x2
        stp     x3,     x3, [x1], #16
        b.lt     1b        

        // branch to c library entry point 
        mov     x0,		#0 // argc
        mov     x1,		#0 // argv
        mov     x2,		#0 // env

	bl bootmain

	.end
