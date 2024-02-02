
XiZi-imx6q-sabrelite.elf:     file format elf32-littlearm


Disassembly of section .start_sec:

10004000 <_boot_start>:

	.global primary_cpu_init
_boot_start:
    @ save r0 for cores 1-3, r0 arg field passed by ROM
    @ r0 is a function pointer for secondary cpus
    mov r4, 	r0
10004000:	e1a04000 	mov	r4, r0

	mrs	r0, 	cpsr        /*Enter SVC mode*/
10004004:	e10f0000 	mrs	r0, CPSR
	bic	r0, 	r0, #0x1f
10004008:	e3c0001f 	bic	r0, r0, #31
	orr	r0, 	r0, #0xd3
1000400c:	e38000d3 	orr	r0, r0, #211	; 0xd3
	msr	cpsr,	r0
10004010:	e129f000 	msr	CPSR_fc, r0

	bl CpuInitCrit
10004014:	eb000027 	bl	100040b8 <CpuInitCrit>

	/* set NSACR, both Secure and Non-secure access are allowed to NEON */
	MRC 	p15, 0, r0, c1, c1, 2
10004018:	ee110f51 	mrc	15, 0, r0, cr1, cr1, {2}
	ORR 	r0, r0, #(0x3<<10) @ enable fpu/neon
1000401c:	e3800b03 	orr	r0, r0, #3072	; 0xc00
	MCR 	p15, 0, r0, c1, c1, 2
10004020:	ee010f51 	mcr	15, 0, r0, cr1, cr1, {2}
	/* Set the CPACR for access to CP10 and CP11*/
	LDR 	r0, =0xF00000
10004024:	e3a0060f 	mov	r0, #15728640	; 0xf00000
	MCR 	p15, 0, r0, c1, c0, 2
10004028:	ee010f50 	mcr	15, 0, r0, cr1, cr0, {2}
	/* Set the FPEXC EN bit to enable the FPU */
	MOV 	r3, #0x40000000 
1000402c:	e3a03101 	mov	r3, #1073741824	; 0x40000000
	@VMSR FPEXC, r3
	MCR 	p10, 7, r3, c8, c0, 0
10004030:	eee83a10 	vmsr	fpexc, r3

	mrc 	p15, 0, r0, c1, c0, 0
10004034:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
	bic 	r0,  r0, #(0x1<<1) @clear A bit of SCTLR 
10004038:	e3c00002 	bic	r0, r0, #2
	mcr 	p15, 0, r0, c1, c0, 0
1000403c:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}

    @ clear some registers
    mov     r11, #0
10004040:	e3a0b000 	mov	fp, #0
    mov     r12, #0
10004044:	e3a0c000 	mov	ip, #0
    mov     lr, #0
10004048:	e3a0e000 	mov	lr, #0
    
    ldr		r0, 	=stacks_top  @ symbol defined in linker file
1000404c:	e59f0058 	ldr	r0, [pc, #88]	; 100040ac <primary_cpu_init+0x28>
    mov		r1, 	#MODE_STACK_SIZE
10004050:	e3a01901 	mov	r1, #16384	; 0x4000

    @ get cpu id, and subtract the offset from the stacks base address
    mrc     p15, 	0, r2, c0, c0, 5  @ read multiprocessor affinity register
10004054:	ee102fb0 	mrc	15, 0, r2, cr0, cr0, {5}
    and     r2, 	r2, #3        @ mask off, leaving CPU ID field
10004058:	e2022003 	and	r2, r2, #3
    mov     r5, 	r2		      @ save cpu id for later
1000405c:	e1a05002 	mov	r5, r2
    mul     r3, 	r2, r1
10004060:	e0030192 	mul	r3, r2, r1
    sub     r0, 	r0, r3
10004064:	e0400003 	sub	r0, r0, r3
           
    msr     CPSR_c, #ARM_MODE_SVC | I_BIT | F_BIT
10004068:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    mov     sp, 	r0
1000406c:	e1a0d000 	mov	sp, r0
    sub     r0, 	r0, r1 
10004070:	e0400001 	sub	r0, r0, r1
    
    @ check cpu id - cpu0 is primary cpu
    cmp     r5, 	#0
10004074:	e3550000 	cmp	r5, #0
    beq     primary_cpu_init
10004078:	0a000001 	beq	10004084 <primary_cpu_init>
    bx      r4     @ for secondary cpus, jump to argument function pointer passed in by ROM
1000407c:	e12fff14 	bx	r4
    
    @ control should not return from the secondary cpu entry point
    b       .
10004080:	eafffffe 	b	10004080 <_boot_start+0x80>

10004084 <primary_cpu_init>:

primary_cpu_init:
   	/* init .bss */
    /* clear the .bss section (zero init) */
    ldr     r1,		=boot_start_addr
10004084:	e59f1024 	ldr	r1, [pc, #36]	; 100040b0 <primary_cpu_init+0x2c>
    ldr     r2,		=boot_end_addr
10004088:	e59f2024 	ldr	r2, [pc, #36]	; 100040b4 <primary_cpu_init+0x30>
    mov     r3,		#0
1000408c:	e3a03000 	mov	r3, #0
1:  cmp     r1,		r2
10004090:	e1510002 	cmp	r1, r2
    stmltia r1!,	{r3}
10004094:	b8a10008 	stmialt	r1!, {r3}
    blt     1b
10004098:	bafffffc 	blt	10004090 <primary_cpu_init+0xc>
    
    @ branch to c library entry point 
    mov     r0,		#0 @ argc
1000409c:	e3a00000 	mov	r0, #0
    mov     r1,		#0 @ argv
100040a0:	e3a01000 	mov	r1, #0
    mov     r2,		#0 @ env
100040a4:	e3a02000 	mov	r2, #0
    
	bl bootmain
100040a8:	eb0000c0 	bl	100043b0 <bootmain>
    ldr		r0, 	=stacks_top  @ symbol defined in linker file
100040ac:	10010000 	.word	0x10010000
    ldr     r1,		=boot_start_addr
100040b0:	10004410 	.word	0x10004410
    ldr     r2,		=boot_end_addr
100040b4:	10010000 	.word	0x10010000

100040b8 <CpuInitCrit>:
.global CpuInitCrit
CpuInitCrit:
	/*
	 * Invalidate L1 I/D
	 */
	mov	r0, #0			@ set up for MCR
100040b8:	e3a00000 	mov	r0, #0
	mcr	p15, 0, r0, c8, c7, 0	@ invalidate TLBs
100040bc:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
	mcr	p15, 0, r0, c7, c5, 0	@ invalidate icache
100040c0:	ee070f15 	mcr	15, 0, r0, cr7, cr5, {0}

	/*
	 * disable MMU stuff and caches
	 */
	mrc	p15, 0, r0, c1, c0, 0
100040c4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
	bic	r0, r0, #0x00002000	@ clear bits 13 (--V-)
100040c8:	e3c00a02 	bic	r0, r0, #8192	; 0x2000
	bic	r0, r0, #0x00000007	@ clear bits 2:0 (-CAM)
100040cc:	e3c00007 	bic	r0, r0, #7
	orr	r0, r0, #0x00000002	@ set bit 1 (--A-) Align
100040d0:	e3800002 	orr	r0, r0, #2
	orr	r0, r0, #0x00000800	@ set bit 12 (Z---) BTB
100040d4:	e3800b02 	orr	r0, r0, #2048	; 0x800
	mcr	p15, 0, r0, c1, c0, 0
100040d8:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
	 * Jump to board specific initialization...
	 * The Mask ROM will have already initialized
	 * basic memory. Go here to bump up clock rate and handle
	 * wake up conditions.
	 */
	mov	ip, lr			@ persevere link reg across call
100040dc:	e1a0c00e 	mov	ip, lr
	bl	lowlevel_init		@ go setup pll,mux,memory
100040e0:	eb000001 	bl	100040ec <lowlevel_init>
	mov	lr, ip			@ restore link
100040e4:	e1a0e00c 	mov	lr, ip
	mov	pc, lr			@ back to my caller
100040e8:	e1a0f00e 	mov	pc, lr

100040ec <lowlevel_init>:
.section ".text.init", "x"

.globl lowlevel_init
lowlevel_init:

	inv_dcache
100040ec:	e3a00000 	mov	r0, #0
100040f0:	ee400f10 	mcr	15, 2, r0, cr0, cr0, {0}
100040f4:	ee300f10 	mrc	15, 1, r0, cr0, cr0, {0}
100040f8:	e1a006c0 	asr	r0, r0, #13
100040fc:	e59f30e0 	ldr	r3, [pc, #224]	; 100041e4 <CCM_BASE_ADDR_W+0x4>
10004100:	e0000003 	and	r0, r0, r3
10004104:	e350007f 	cmp	r0, #127	; 0x7f
10004108:	03a06a01 	moveq	r6, #4096	; 0x1000
1000410c:	0a000002 	beq	1000411c <size_done>
10004110:	e35000ff 	cmp	r0, #255	; 0xff
10004114:	03a06a02 	moveq	r6, #8192	; 0x2000
10004118:	13a06901 	movne	r6, #16384	; 0x4000

1000411c <size_done>:
1000411c:	e3a02000 	mov	r2, #0
10004120:	e3a03101 	mov	r3, #1073741824	; 0x40000000
10004124:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
10004128:	e3a05103 	mov	r5, #-1073741824	; 0xc0000000

1000412c <d_inv_loop>:
1000412c:	ee072f56 	mcr	15, 0, r2, cr7, cr6, {2}
10004130:	ee073f56 	mcr	15, 0, r3, cr7, cr6, {2}
10004134:	ee074f56 	mcr	15, 0, r4, cr7, cr6, {2}
10004138:	ee075f56 	mcr	15, 0, r5, cr7, cr6, {2}
1000413c:	e2822020 	add	r2, r2, #32
10004140:	e2833020 	add	r3, r3, #32
10004144:	e2844020 	add	r4, r4, #32
10004148:	e2855020 	add	r5, r5, #32
1000414c:	e1520006 	cmp	r2, r6
10004150:	1afffff5 	bne	1000412c <d_inv_loop>

	init_l2cc
10004154:	e59f108c 	ldr	r1, [pc, #140]	; 100041e8 <CCM_BASE_ADDR_W+0x8>
10004158:	e3a00000 	mov	r0, #0
1000415c:	e5810100 	str	r0, [r1, #256]	; 0x100

	init_aips
10004160:	e59f0084 	ldr	r0, [pc, #132]	; 100041ec <CCM_BASE_ADDR_W+0xc>
10004164:	e59f1084 	ldr	r1, [pc, #132]	; 100041f0 <CCM_BASE_ADDR_W+0x10>
10004168:	e5801000 	str	r1, [r0]
1000416c:	e5801004 	str	r1, [r0, #4]
10004170:	e3a01000 	mov	r1, #0
10004174:	e5801040 	str	r1, [r0, #64]	; 0x40
10004178:	e5801044 	str	r1, [r0, #68]	; 0x44
1000417c:	e5801048 	str	r1, [r0, #72]	; 0x48
10004180:	e580104c 	str	r1, [r0, #76]	; 0x4c
10004184:	e5801050 	str	r1, [r0, #80]	; 0x50
10004188:	e59f0064 	ldr	r0, [pc, #100]	; 100041f4 <CCM_BASE_ADDR_W+0x14>
1000418c:	e59f105c 	ldr	r1, [pc, #92]	; 100041f0 <CCM_BASE_ADDR_W+0x10>
10004190:	e5801000 	str	r1, [r0]
10004194:	e5801004 	str	r1, [r0, #4]
10004198:	e3a01000 	mov	r1, #0
1000419c:	e5801040 	str	r1, [r0, #64]	; 0x40
100041a0:	e5801044 	str	r1, [r0, #68]	; 0x44
100041a4:	e5801048 	str	r1, [r0, #72]	; 0x48
100041a8:	e580104c 	str	r1, [r0, #76]	; 0x4c
100041ac:	e5801050 	str	r1, [r0, #80]	; 0x50

	init_clock
100041b0:	e3e01000 	mvn	r1, #0
100041b4:	e59f0024 	ldr	r0, [pc, #36]	; 100041e0 <CCM_BASE_ADDR_W>
100041b8:	e5801068 	str	r1, [r0, #104]	; 0x68
100041bc:	e580106c 	str	r1, [r0, #108]	; 0x6c
100041c0:	e5801070 	str	r1, [r0, #112]	; 0x70
100041c4:	e5801074 	str	r1, [r0, #116]	; 0x74
100041c8:	e5801078 	str	r1, [r0, #120]	; 0x78
100041cc:	e580107c 	str	r1, [r0, #124]	; 0x7c
100041d0:	e5801080 	str	r1, [r0, #128]	; 0x80
100041d4:	e5801084 	str	r1, [r0, #132]	; 0x84

	mov pc, lr
100041d8:	e1a0f00e 	mov	pc, lr

100041dc <ANATOP_BASE_ADDR_W>:
100041dc:	020c8000 	.word	0x020c8000

100041e0 <CCM_BASE_ADDR_W>:
100041e0:	020c4000 	.word	0x020c4000
	inv_dcache
100041e4:	00000fff 	.word	0x00000fff
	init_l2cc
100041e8:	00a02000 	.word	0x00a02000
	init_aips
100041ec:	0207c000 	.word	0x0207c000
100041f0:	77777777 	.word	0x77777777
100041f4:	0217c000 	.word	0x0217c000

100041f8 <build_boot_pgdir>:
#define L1_SECT_DEV ((0b010) << 12)
#define L1_SECT_AP0 (1 << 10)
uint32_t boot_pgdir[NR_PDE_ENTRIES] __attribute__((aligned(0x4000))) = { 0 };

static void build_boot_pgdir()
{
100041f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
100041fc:	e28db000 	add	fp, sp, #0
10004200:	e24dd024 	sub	sp, sp, #36	; 0x24
    // dev mem
    uint32_t dev_mem_end_idx = (DEV_PHYMEM_BASE + DEV_MEM_SZ) >> LEVEL3_PDE_SHIFT;
10004204:	e3a03c01 	mov	r3, #256	; 0x100
10004208:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (uint32_t i = DEV_PHYMEM_BASE >> LEVEL3_PDE_SHIFT; i < dev_mem_end_idx; i++) {
1000420c:	e3a03000 	mov	r3, #0
10004210:	e50b3008 	str	r3, [fp, #-8]
10004214:	ea000015 	b	10004270 <build_boot_pgdir+0x78>
        boot_pgdir[i] = (i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_DEV | L1_SECT_AP0;
10004218:	e51b3008 	ldr	r3, [fp, #-8]
1000421c:	e1a03a03 	lsl	r3, r3, #20
10004220:	e3833b09 	orr	r3, r3, #9216	; 0x2400
10004224:	e3833002 	orr	r3, r3, #2
10004228:	e3082000 	movw	r2, #32768	; 0x8000
1000422c:	e3412000 	movt	r2, #4096	; 0x1000
10004230:	e51b1008 	ldr	r1, [fp, #-8]
10004234:	e7823101 	str	r3, [r2, r1, lsl #2]
        boot_pgdir[MMIO_P2V_WO(i << LEVEL3_PDE_SHIFT) >> LEVEL3_PDE_SHIFT] = (i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_DEV | L1_SECT_AP0;
10004238:	e51b3008 	ldr	r3, [fp, #-8]
1000423c:	e1a03a03 	lsl	r3, r3, #20
10004240:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
10004244:	e1a01a23 	lsr	r1, r3, #20
10004248:	e51b3008 	ldr	r3, [fp, #-8]
1000424c:	e1a03a03 	lsl	r3, r3, #20
10004250:	e3833b09 	orr	r3, r3, #9216	; 0x2400
10004254:	e3833002 	orr	r3, r3, #2
10004258:	e3082000 	movw	r2, #32768	; 0x8000
1000425c:	e3412000 	movt	r2, #4096	; 0x1000
10004260:	e7823101 	str	r3, [r2, r1, lsl #2]
    for (uint32_t i = DEV_PHYMEM_BASE >> LEVEL3_PDE_SHIFT; i < dev_mem_end_idx; i++) {
10004264:	e51b3008 	ldr	r3, [fp, #-8]
10004268:	e2833001 	add	r3, r3, #1
1000426c:	e50b3008 	str	r3, [fp, #-8]
10004270:	e51b2008 	ldr	r2, [fp, #-8]
10004274:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
10004278:	e1520003 	cmp	r2, r3
1000427c:	3affffe5 	bcc	10004218 <build_boot_pgdir+0x20>
    }

    // identical mem
    uint32_t idn_mem_start_idx = PHY_MEM_BASE >> LEVEL3_PDE_SHIFT;
10004280:	e3a03c01 	mov	r3, #256	; 0x100
10004284:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    uint32_t idn_mem_end_idx = PHY_MEM_STOP >> LEVEL3_PDE_SHIFT;
10004288:	e3a03c05 	mov	r3, #1280	; 0x500
1000428c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    for (uint32_t i = idn_mem_start_idx; i < idn_mem_end_idx; i++) {
10004290:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
10004294:	e50b300c 	str	r3, [fp, #-12]
10004298:	ea00000a 	b	100042c8 <build_boot_pgdir+0xd0>
        boot_pgdir[i] = i << LEVEL3_PDE_SHIFT | L1_TYPE_SEC | L1_SECT_AP0;
1000429c:	e51b300c 	ldr	r3, [fp, #-12]
100042a0:	e1a03a03 	lsl	r3, r3, #20
100042a4:	e3833b01 	orr	r3, r3, #1024	; 0x400
100042a8:	e3833002 	orr	r3, r3, #2
100042ac:	e3082000 	movw	r2, #32768	; 0x8000
100042b0:	e3412000 	movt	r2, #4096	; 0x1000
100042b4:	e51b100c 	ldr	r1, [fp, #-12]
100042b8:	e7823101 	str	r3, [r2, r1, lsl #2]
    for (uint32_t i = idn_mem_start_idx; i < idn_mem_end_idx; i++) {
100042bc:	e51b300c 	ldr	r3, [fp, #-12]
100042c0:	e2833001 	add	r3, r3, #1
100042c4:	e50b300c 	str	r3, [fp, #-12]
100042c8:	e51b200c 	ldr	r2, [fp, #-12]
100042cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
100042d0:	e1520003 	cmp	r2, r3
100042d4:	3afffff0 	bcc	1000429c <build_boot_pgdir+0xa4>
    }

    // kern mem
    uint32_t kern_mem_start_idx = KERN_MEM_BASE >> LEVEL3_PDE_SHIFT;
100042d8:	e3a03c09 	mov	r3, #2304	; 0x900
100042dc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    uint32_t kern_mem_end_idx = (KERN_MEM_BASE + (PHY_MEM_STOP - PHY_MEM_BASE)) >> LEVEL3_PDE_SHIFT;
100042e0:	e3a03c0d 	mov	r3, #3328	; 0xd00
100042e4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    for (uint32_t i = kern_mem_start_idx; i < kern_mem_end_idx; i++) {
100042e8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
100042ec:	e50b3010 	str	r3, [fp, #-16]
100042f0:	ea00000b 	b	10004324 <build_boot_pgdir+0x12c>
        boot_pgdir[i] = V2P(i << LEVEL3_PDE_SHIFT) | L1_TYPE_SEC | L1_SECT_AP0;
100042f4:	e51b3010 	ldr	r3, [fp, #-16]
100042f8:	e1a03a03 	lsl	r3, r3, #20
100042fc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
10004300:	e3833b01 	orr	r3, r3, #1024	; 0x400
10004304:	e3833002 	orr	r3, r3, #2
10004308:	e3082000 	movw	r2, #32768	; 0x8000
1000430c:	e3412000 	movt	r2, #4096	; 0x1000
10004310:	e51b1010 	ldr	r1, [fp, #-16]
10004314:	e7823101 	str	r3, [r2, r1, lsl #2]
    for (uint32_t i = kern_mem_start_idx; i < kern_mem_end_idx; i++) {
10004318:	e51b3010 	ldr	r3, [fp, #-16]
1000431c:	e2833001 	add	r3, r3, #1
10004320:	e50b3010 	str	r3, [fp, #-16]
10004324:	e51b2010 	ldr	r2, [fp, #-16]
10004328:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
1000432c:	e1520003 	cmp	r2, r3
10004330:	3affffef 	bcc	100042f4 <build_boot_pgdir+0xfc>
    }
}
10004334:	e320f000 	nop	{0}
10004338:	e28bd000 	add	sp, fp, #0
1000433c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
10004340:	e12fff1e 	bx	lr

10004344 <load_boot_pgdir>:

static void load_boot_pgdir()
{
10004344:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
10004348:	e28db000 	add	fp, sp, #0
1000434c:	e24dd00c 	sub	sp, sp, #12
    uint32_t val;

    DACR_W(0x55555555); // set domain access control as client
10004350:	e3053555 	movw	r3, #21845	; 0x5555
10004354:	e3453555 	movt	r3, #21845	; 0x5555
10004358:	ee033f10 	mcr	15, 0, r3, cr3, cr0, {0}
    TTBCR_W(0x0);
1000435c:	e3a03000 	mov	r3, #0
10004360:	ee023f50 	mcr	15, 0, r3, cr2, cr0, {2}
    TTBR0_W((uint32_t)boot_pgdir);
10004364:	e3083000 	movw	r3, #32768	; 0x8000
10004368:	e3413000 	movt	r3, #4096	; 0x1000
1000436c:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}

    // Enable paging using read/modify/write
    SCTLR_R(val);
10004370:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
10004374:	e50b3008 	str	r3, [fp, #-8]
    val |= 0x3805; // Enable MMU, cache, write buffer, high vector tbl. Disable subpage.
10004378:	e51b3008 	ldr	r3, [fp, #-8]
1000437c:	e3833b0e 	orr	r3, r3, #14336	; 0x3800
10004380:	e3833005 	orr	r3, r3, #5
10004384:	e50b3008 	str	r3, [fp, #-8]
    SCTLR_W(val);
10004388:	e51b3008 	ldr	r3, [fp, #-8]
1000438c:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}

    // flush all TLB
    DSB();
10004390:	f57ff04f 	dsb	sy
    CLEARTLB(0);
10004394:	e3a03000 	mov	r3, #0
10004398:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}
    ISB();
1000439c:	f57ff06f 	isb	sy
}
100043a0:	e320f000 	nop	{0}
100043a4:	e28bd000 	add	sp, fp, #0
100043a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
100043ac:	e12fff1e 	bx	lr

100043b0 <bootmain>:

extern void main(void);
void bootmain()
{
100043b0:	e92d4800 	push	{fp, lr}
100043b4:	e28db004 	add	fp, sp, #4
    build_boot_pgdir();
100043b8:	ebffff8e 	bl	100041f8 <build_boot_pgdir>
    load_boot_pgdir();
100043bc:	ebffffe0 	bl	10004344 <load_boot_pgdir>
    __asm__ __volatile__("add sp, sp, %0" ::"r"(KERN_MEM_BASE - PHY_MEM_BASE));
100043c0:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
100043c4:	e08dd003 	add	sp, sp, r3
    memset(&kernel_data_begin, 0x00, (uint32_t)kernel_data_end - (uint32_t)kernel_data_begin);
100043c8:	e3052000 	movw	r2, #20480	; 0x5000
100043cc:	e349209a 	movt	r2, #37018	; 0x909a
100043d0:	e30a37e8 	movw	r3, #42984	; 0xa7e8
100043d4:	e3493015 	movt	r3, #36885	; 0x9015
100043d8:	e0423003 	sub	r3, r2, r3
100043dc:	e1a02003 	mov	r2, r3
100043e0:	e3a01000 	mov	r1, #0
100043e4:	e30a07e8 	movw	r0, #42984	; 0xa7e8
100043e8:	e3490015 	movt	r0, #36885	; 0x9015
100043ec:	eb000005 	bl	10004408 <__memset_from_arm>
    main();
100043f0:	eb000002 	bl	10004400 <__main_veneer>
100043f4:	e320f000 	nop	{0}
100043f8:	e8bd8800 	pop	{fp, pc}
100043fc:	00000000 	andeq	r0, r0, r0

10004400 <__main_veneer>:
10004400:	e51ff004 	ldr	pc, [pc, #-4]	; 10004404 <__main_veneer+0x4>
10004404:	90020228 	.word	0x90020228

10004408 <__memset_from_arm>:
10004408:	e51ff004 	ldr	pc, [pc, #-4]	; 1000440c <__memset_from_arm+0x4>
1000440c:	90020975 	.word	0x90020975

10004410 <boot_start_addr>:
	...

10008000 <boot_pgdir>:
	...

Disassembly of section .text:

90010000 <_vector_jumper>:
	.section	.vectors, "ax"
	.globl		_vector_jumper

/* These will be relocated to VECTOR_BASE. */
_vector_jumper:
	ldr		pc, .LOCATION_resethandler			/* 0x00: Reset */
90010000:	e59ff018 	ldr	pc, [pc, #24]	; 90010020 <_vector_start>
	ldr		pc, .LOCATION_undefinedhandler		/* 0x04: Undefined instruction */
90010004:	e59ff018 	ldr	pc, [pc, #24]	; 90010024 <_vector_start+0x4>
	ldr		pc, .LOCATION_svchandler			/* 0x08: Software interrupt */
90010008:	e59ff018 	ldr	pc, [pc, #24]	; 90010028 <_vector_start+0x8>
	ldr		pc, .LOCATION_prefetchaborthandler	/* 0x0c: Prefetch abort */
9001000c:	e59ff018 	ldr	pc, [pc, #24]	; 9001002c <_vector_start+0xc>
	ldr		pc, .LOCATION_dataaborthandler		/* 0x10: Data abort */
90010010:	e59ff018 	ldr	pc, [pc, #24]	; 90010030 <_vector_start+0x10>
	ldr		pc, .LOCATION_addrexcptnhandler		/* 0x14: Address exception (reserved) */
90010014:	e59ff018 	ldr	pc, [pc, #24]	; 90010034 <_vector_start+0x14>
	ldr		pc, .LOCATION_irqhandler			/* 0x18: IRQ */
90010018:	e59ff018 	ldr	pc, [pc, #24]	; 90010038 <_vector_start+0x18>
	ldr		pc, .LOCATION_fiqhandler			/* 0x1c: FIQ */
9001001c:	e59ff018 	ldr	pc, [pc, #24]	; 9001003c <_vector_start+0x1c>

90010020 <_vector_start>:
90010020:	10004000 	.word	0x10004000
90010024:	10004000 	.word	0x10004000
90010028:	10004000 	.word	0x10004000
9001002c:	10004000 	.word	0x10004000
90010030:	10004000 	.word	0x10004000
90010034:	10004000 	.word	0x10004000
90010038:	10004000 	.word	0x10004000
9001003c:	10004000 	.word	0x10004000

90010040 <_vector_end>:
	...

90011000 <__arm_set_fast_math>:
90011000:	eef1 3a10 	vmrs	r3, fpscr
90011004:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
90011008:	eee1 3a10 	vmsr	fpscr, r3
9001100c:	4770      	bx	lr
9001100e:	bf00      	nop

90011010 <__do_global_dtors_aux>:
90011010:	b510      	push	{r4, lr}
90011012:	f64a 0400 	movw	r4, #43008	; 0xa800
90011016:	f2c9 0415 	movt	r4, #36885	; 0x9015
9001101a:	7823      	ldrb	r3, [r4, #0]
9001101c:	b963      	cbnz	r3, 90011038 <__do_global_dtors_aux+0x28>
9001101e:	f240 0300 	movw	r3, #0
90011022:	f2c0 0300 	movt	r3, #0
90011026:	b12b      	cbz	r3, 90011034 <__do_global_dtors_aux+0x24>
90011028:	f640 50e4 	movw	r0, #3556	; 0xde4
9001102c:	f2c9 0002 	movt	r0, #36866	; 0x9002
90011030:	f3af 8000 	nop.w
90011034:	2301      	movs	r3, #1
90011036:	7023      	strb	r3, [r4, #0]
90011038:	bd10      	pop	{r4, pc}
9001103a:	bf00      	nop

9001103c <frame_dummy>:
9001103c:	f240 0300 	movw	r3, #0
90011040:	f2c0 0300 	movt	r3, #0
90011044:	b18b      	cbz	r3, 9001106a <frame_dummy+0x2e>
90011046:	b510      	push	{r4, lr}
90011048:	f64a 0104 	movw	r1, #43012	; 0xa804
9001104c:	f640 50e4 	movw	r0, #3556	; 0xde4
90011050:	f2c9 0115 	movt	r1, #36885	; 0x9015
90011054:	f2c9 0002 	movt	r0, #36866	; 0x9002
90011058:	f3af 8000 	nop.w
9001105c:	f24a 70f4 	movw	r0, #42996	; 0xa7f4
90011060:	f2c9 0015 	movt	r0, #36885	; 0x9015
90011064:	6803      	ldr	r3, [r0, #0]
90011066:	b93b      	cbnz	r3, 90011078 <frame_dummy+0x3c>
90011068:	bd10      	pop	{r4, pc}
9001106a:	f24a 70f4 	movw	r0, #42996	; 0xa7f4
9001106e:	f2c9 0015 	movt	r0, #36885	; 0x9015
90011072:	6803      	ldr	r3, [r0, #0]
90011074:	b94b      	cbnz	r3, 9001108a <frame_dummy+0x4e>
90011076:	4770      	bx	lr
90011078:	f240 0300 	movw	r3, #0
9001107c:	f2c0 0300 	movt	r3, #0
90011080:	2b00      	cmp	r3, #0
90011082:	d0f1      	beq.n	90011068 <frame_dummy+0x2c>
90011084:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
90011088:	4718      	bx	r3
9001108a:	f240 0300 	movw	r3, #0
9001108e:	f2c0 0300 	movt	r3, #0
90011092:	2b00      	cmp	r3, #0
90011094:	d0ef      	beq.n	90011076 <frame_dummy+0x3a>
90011096:	4718      	bx	r3

90011098 <_mainCRTStartup>:
90011098:	4b15      	ldr	r3, [pc, #84]	; (900110f0 <_mainCRTStartup+0x58>)
9001109a:	2b00      	cmp	r3, #0
9001109c:	bf08      	it	eq
9001109e:	4b13      	ldreq	r3, [pc, #76]	; (900110ec <_mainCRTStartup+0x54>)
900110a0:	469d      	mov	sp, r3
900110a2:	f5a3 3a80 	sub.w	sl, r3, #65536	; 0x10000
900110a6:	2100      	movs	r1, #0
900110a8:	468b      	mov	fp, r1
900110aa:	460f      	mov	r7, r1
900110ac:	4813      	ldr	r0, [pc, #76]	; (900110fc <_mainCRTStartup+0x64>)
900110ae:	4a14      	ldr	r2, [pc, #80]	; (90011100 <_mainCRTStartup+0x68>)
900110b0:	1a12      	subs	r2, r2, r0
900110b2:	f00f fc5f 	bl	90020974 <memset>
900110b6:	4b0f      	ldr	r3, [pc, #60]	; (900110f4 <_mainCRTStartup+0x5c>)
900110b8:	2b00      	cmp	r3, #0
900110ba:	d000      	beq.n	900110be <_mainCRTStartup+0x26>
900110bc:	4798      	blx	r3
900110be:	4b0e      	ldr	r3, [pc, #56]	; (900110f8 <_mainCRTStartup+0x60>)
900110c0:	2b00      	cmp	r3, #0
900110c2:	d000      	beq.n	900110c6 <_mainCRTStartup+0x2e>
900110c4:	4798      	blx	r3
900110c6:	2000      	movs	r0, #0
900110c8:	2100      	movs	r1, #0
900110ca:	0004      	movs	r4, r0
900110cc:	000d      	movs	r5, r1
900110ce:	480d      	ldr	r0, [pc, #52]	; (90011104 <_mainCRTStartup+0x6c>)
900110d0:	2800      	cmp	r0, #0
900110d2:	d002      	beq.n	900110da <_mainCRTStartup+0x42>
900110d4:	480c      	ldr	r0, [pc, #48]	; (90011108 <_mainCRTStartup+0x70>)
900110d6:	f00f fddb 	bl	90020c90 <atexit>
900110da:	f00f fb3f 	bl	9002075c <__libc_init_array>
900110de:	0020      	movs	r0, r4
900110e0:	0029      	movs	r1, r5
900110e2:	f00f e8a2 	blx	90020228 <main>
900110e6:	f00f fb29 	bl	9002073c <exit>
900110ea:	bf00      	nop
900110ec:	00080000 	.word	0x00080000
	...
900110fc:	9015a800 	.word	0x9015a800
90011100:	909a4e69 	.word	0x909a4e69
90011104:	90020c91 	.word	0x90020c91
90011108:	90020c9d 	.word	0x90020c9d

9001110c <arm_set_interrupt_state>:
 * bool arm_set_interrupt_state(bool enable)
 */
    .global arm_set_interrupt_state
    .func arm_set_interrupt_state
arm_set_interrupt_state:
    mrs             r2,CPSR            @ read CPSR (Current Program Status Register)
9001110c:	e10f2000 	mrs	r2, CPSR
    teq     r0,#0
90011110:	e3300000 	teq	r0, #0
    bicne   r1,r2,#0xc0        @ disable IRQ and FIQ
90011114:	13c210c0 	bicne	r1, r2, #192	; 0xc0
    orreq   r1,r2,#0xc0        @ enable IRQ and FIQ
90011118:	038210c0 	orreq	r1, r2, #192	; 0xc0
    msr     CPSR_c,r1
9001111c:	e121f001 	msr	CPSR_c, r1
    tst     r2,#0x80
90011120:	e3120080 	tst	r2, #128	; 0x80
    movne   r0,#0
90011124:	13a00000 	movne	r0, #0
    moveq   r0,#1
90011128:	03a00001 	moveq	r0, #1
    bx      lr
9001112c:	e12fff1e 	bx	lr

90011130 <cpu_get_current>:
  .global cpu_get_current
  @ int cpu_get_current(void)@
  @ get current CPU ID
  .func cpu_get_current
cpu_get_current: 
    mrc   p15, 0, r0, c0, c0, 5
90011130:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
    and   r0, r0, #3
90011134:	e2000003 	and	r0, r0, #3
	BX	  lr
90011138:	e12fff1e 	bx	lr

9001113c <enable_neon_fpu>:

  .global enable_neon_fpu
  .func enable_neon_fpu
enable_neon_fpu:
	/* set NSACR, both Secure and Non-secure access are allowed to NEON */
	MRC p15, 0, r0, c1, c1, 2
9001113c:	ee110f51 	mrc	15, 0, r0, cr1, cr1, {2}
	ORR r0, r0, #(0x3<<10) @ enable fpu/neon
90011140:	e3800b03 	orr	r0, r0, #3072	; 0xc00
	MCR p15, 0, r0, c1, c1, 2
90011144:	ee010f51 	mcr	15, 0, r0, cr1, cr1, {2}
	/* Set the CPACR for access to CP10 and CP11*/
	LDR r0, =0xF00000
90011148:	e3a0060f 	mov	r0, #15728640	; 0xf00000
	MCR p15, 0, r0, c1, c0, 2
9001114c:	ee010f50 	mcr	15, 0, r0, cr1, cr0, {2}
	/* Set the FPEXC EN bit to enable the FPU */
	MOV r3, #0x40000000 
90011150:	e3a03101 	mov	r3, #1073741824	; 0x40000000
	@VMSR FPEXC, r3
	MCR p10, 7, r3, c8, c0, 0
90011154:	eee83a10 	vmsr	fpexc, r3

90011158 <disable_strict_align_check>:
disable_strict_align_check:
  	/*Ray's note: disable strict alignment fault checking.
 	without disabling this, data abort will happen when accessing
	the BPB structure of file system since it is packed.*/
    
  	push	{r0, lr}
90011158:	e92d4001 	push	{r0, lr}
	
	mrc p15, 0, r0, c1, c0, 0
9001115c:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
	bic r0, r0, #(0x1<<1) @clear A bit of SCTLR 
90011160:	e3c00002 	bic	r0, r0, #2
	mcr p15, 0, r0, c1, c0, 0
90011164:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}

    pop {r0, pc}
90011168:	e8bd8001 	pop	{r0, pc}

9001116c <disable_L1_cache>:
  .endfunc

  .global disable_L1_cache
  .func disable_L1_cache
disable_L1_cache:
    push	{r0-r6, lr}
9001116c:	e92d407f 	push	{r0, r1, r2, r3, r4, r5, r6, lr}

	mrc p15, 0, r0, c1, c0, 0
90011170:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
	bic r0, r0, #(0x1<<12) 
90011174:	e3c00a01 	bic	r0, r0, #4096	; 0x1000
	bic r0, r0, #(0x1<<11) 
90011178:	e3c00b02 	bic	r0, r0, #2048	; 0x800
	bic r0, r0, #(0x1<<2) 
9001117c:	e3c00004 	bic	r0, r0, #4
	bic r0, r0, #(0x1<<0) 
90011180:	e3c00001 	bic	r0, r0, #1
	mcr p15, 0, r0, c1, c0, 0
90011184:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}

    pop {r0-r6, pc}
90011188:	e8bd807f 	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

9001118c <get_arm_private_peripheral_base>:
  @ uint32_t get_arm_private_peripheral_base(void)@
  .func get_arm_private_peripheral_base
get_arm_private_peripheral_base: 

  @ Get base address of private perpherial space
  mrc     p15, 4, r0, c15, c0, 0  @ Read periph base address
9001118c:	ee9f0f10 	mrc	15, 4, r0, cr15, cr0, {0}
  @ mov r0, #0x00A00000
  bx      lr
90011190:	e12fff1e 	bx	lr

90011194 <arm_unified_tlb_invalidate>:

  .global arm_unified_tlb_invalidate
  @ void arm_unified_tlb_invalidate(void)@
  .func arm_unified_tlb_invalidate
arm_unified_tlb_invalidate:
  mov     r0, #1
90011194:	e3a00001 	mov	r0, #1
  mcr     p15, 0, r0, c8, c7, 0                 @ TLBIALL - Invalidate entire unified TLB
90011198:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
  dsb
9001119c:	f57ff04f 	dsb	sy
  bx      lr
900111a0:	e12fff1e 	bx	lr

900111a4 <arm_unified_tlb_invalidate_is>:

  .global arm_unified_tlb_invalidate_is
  @ void arm_unified_tlb_invalidate_is(void)@
  .func arm_unified_tlb_invalidate_is
arm_unified_tlb_invalidate_is:
  mov     r0, #1
900111a4:	e3a00001 	mov	r0, #1
  mcr     p15, 0, r0, c8, c3, 0                 @ TLBIALLIS - Invalidate entire unified TLB Inner Shareable
900111a8:	ee080f13 	mcr	15, 0, r0, cr8, cr3, {0}
  dsb
900111ac:	f57ff04f 	dsb	sy
  bx      lr
900111b0:	e12fff1e 	bx	lr

900111b4 <arm_branch_prediction_enable>:

  .global arm_branch_prediction_enable
  @ void arm_branch_prediction_enable(void)
  .func arm_branch_prediction_enable
arm_branch_prediction_enable:
  mrc     p15, 0, r0, c1, c0, 0                 @ Read SCTLR
900111b4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
  orr     r0, r0, #(1 << 11)                    @ Set the Z bit (bit 11)
900111b8:	e3800b02 	orr	r0, r0, #2048	; 0x800
  mcr     p15, 0,r0, c1, c0, 0                  @ Write SCTLR
900111bc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
  bx      lr
900111c0:	e12fff1e 	bx	lr

900111c4 <arm_branch_prediction_disable>:

  .global arm_branch_prediction_disable
  @ void arm_branch_prediction_disable(void)
  .func arm_branch_prediction_disable
arm_branch_prediction_disable:
  mrc     p15, 0, r0, c1, c0, 0                 @ Read SCTLR
900111c4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
  bic     r0, r0, #(1 << 11)                    @ Clear the Z bit (bit 11)
900111c8:	e3c00b02 	bic	r0, r0, #2048	; 0x800
  mcr     p15, 0,r0, c1, c0, 0                  @ Write SCTLR
900111cc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
  bx      lr
900111d0:	e12fff1e 	bx	lr

900111d4 <arm_branch_target_cache_invalidate>:
  
  .global arm_branch_target_cache_invalidate
  @ void arm_branch_target_cache_invalidate(void)
  .func arm_branch_target_cache_invalidate
arm_branch_target_cache_invalidate:
  mov     r0, #0
900111d4:	e3a00000 	mov	r0, #0
  mcr     p15, 0, r0, c7, c5, 6                 @ BPIALL - Invalidate entire branch predictor array
900111d8:	ee070fd5 	mcr	15, 0, r0, cr7, cr5, {6}
  bx      lr
900111dc:	e12fff1e 	bx	lr

900111e0 <arm_branch_target_cache_invalidate_is>:

  .global arm_branch_target_cache_invalidate_is
  @ void arm_branch_target_cache_invalidate_is(void)
  .func arm_branch_target_cache_invalidate_is
arm_branch_target_cache_invalidate_is:
  mov     r0, #0
900111e0:	e3a00000 	mov	r0, #0
  mcr     p15, 0, r0, c7, c1, 6                 @ BPIALLIS - Invalidate entire branch predictor array Inner Shareable
900111e4:	ee070fd1 	mcr	15, 0, r0, cr7, cr1, {6}
  bx      lr
900111e8:	e12fff1e 	bx	lr

900111ec <scu_enable>:
  @ Enables the SCU
  .func scu_enable
scu_enable:

  @ mrc     p15, 4, r0, c15, c0, 0  @ Read periph base address
  mov r0, #0x00A00000
900111ec:	e3a0060a 	mov	r0, #10485760	; 0xa00000

  ldr     r1, [r0, #0x0]          @ Read the SCU Control Register
900111f0:	e5901000 	ldr	r1, [r0]
  orr     r1, r1, #0x1            @ Set bit 0 (The Enable bit)
900111f4:	e3811001 	orr	r1, r1, #1
  str     r1, [r0, #0x0]          @ Write back modifed value
900111f8:	e5801000 	str	r1, [r0]

  bx      lr
900111fc:	e12fff1e 	bx	lr

90011200 <scu_join_smp>:
  .func scu_join_smp
scu_join_smp:

  @ SMP status is controlled by bit 6 of the CP15 Aux Ctrl Reg

  mrc     p15, 0, r0, c1, c0, 1   @ Read ACTLR
90011200:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
  orr     r0, r0, #0x040          @ Set bit 6
90011204:	e3800040 	orr	r0, r0, #64	; 0x40
  mcr     p15, 0, r0, c1, c0, 1   @ Write ACTLR
90011208:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}

  bx      lr
9001120c:	e12fff1e 	bx	lr

90011210 <scu_leave_smp>:
  .func scu_leave_smp
scu_leave_smp:

  @ SMP status is controlled by bit 6 of the CP15 Aux Ctrl Reg

  mrc     p15, 0, r0, c1, c0, 1   @ Read ACTLR
90011210:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
  bic     r0, r0, #0x040          @ Clear bit 6
90011214:	e3c00040 	bic	r0, r0, #64	; 0x40
  mcr     p15, 0, r0, c1, c0, 1   @ Write ACTLR
90011218:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}

  bx      lr
9001121c:	e12fff1e 	bx	lr

90011220 <scu_get_cpus_in_smp>:
  @ etc...
  .func scu_get_cpus_in_smp
scu_get_cpus_in_smp:

  @ mrc     p15, 4, r0, c15, c0, 0  @ Read periph base address
  mov r0, #0x00A00000
90011220:	e3a0060a 	mov	r0, #10485760	; 0xa00000

  ldr     r0, [r0, #0x004]        @ Read SCU Configuration register
90011224:	e5900004 	ldr	r0, [r0, #4]
  mov     r0, r0, lsr #4          @ Bits 7:4 gives the cores in SMP mode, shift then mask
90011228:	e1a00220 	lsr	r0, r0, #4
  and     r0, r0, #0x0F
9001122c:	e200000f 	and	r0, r0, #15

  bx      lr
90011230:	e12fff1e 	bx	lr

90011234 <scu_enable_maintenance_broadcast>:
  @ Enable the broadcasting of cache & TLB maintenance operations
  @ When enabled AND in SMP, broadcast all "inner sharable"
  @ cache and TLM maintenance operations to other SMP cores
  .func scu_enable_maintenance_broadcast
scu_enable_maintenance_broadcast:
  mrc     p15, 0, r0, c1, c0, 1   @ Read Aux Ctrl register
90011234:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
  orr     r0, r0, #0x01           @ Set the FW bit (bit 0)
90011238:	e3800001 	orr	r0, r0, #1
  mcr     p15, 0, r0, c1, c0, 1   @ Write Aux Ctrl register
9001123c:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}

  bx      lr
90011240:	e12fff1e 	bx	lr

90011244 <scu_disable_maintenance_broadcast>:
  .global scu_disable_maintenance_broadcast
  @ void scu_disable_maintenance_broadcast(void)
  @ Disable the broadcasting of cache & TLB maintenance operations
  .func scu_disable_maintenance_broadcast
scu_disable_maintenance_broadcast:
  mrc     p15, 0, r0, c1, c0, 1   @ Read Aux Ctrl register
90011244:	ee110f30 	mrc	15, 0, r0, cr1, cr0, {1}
  bic     r0, r0, #0x01           @ Clear the FW bit (bit 0)
90011248:	e3c00001 	bic	r0, r0, #1
  mcr     p15, 0, r0, c1, c0, 1   @ Write Aux Ctrl register
9001124c:	ee010f30 	mcr	15, 0, r0, cr1, cr0, {1}

  bx      lr
90011250:	e12fff1e 	bx	lr

90011254 <scu_secure_invalidate>:
  @ - Invalidate L1 caches
  @ - Invalidate SCU copy of TAG RAMs
  @ - Join SMP
  .func scu_secure_invalidate
scu_secure_invalidate:
  and     r0, r0, #0x03           @ Mask off unused bits of CPU ID
90011254:	e2000003 	and	r0, r0, #3
  mov     r0, r0, lsl #2          @ Convert into bit offset (four bits per core)
90011258:	e1a00100 	lsl	r0, r0, #2
  
  and     r1, r1, #0x0F           @ Mask off unused bits of ways
9001125c:	e201100f 	and	r1, r1, #15
  mov     r1, r1, lsl r0          @ Shift ways into the correct CPU field
90011260:	e1a01011 	lsl	r1, r1, r0

  mrc     p15, 4, r2, c15, c0, 0  @ Read periph base address
90011264:	ee9f2f10 	mrc	15, 4, r2, cr15, cr0, {0}

  str     r1, [r2, #0x0C]         @ Write to SCU Invalidate All in Secure State
90011268:	e582100c 	str	r1, [r2, #12]
  
  bx      lr
9001126c:	e12fff1e 	bx	lr

90011270 <context_switch>:
*************************************************/
.global context_switch

context_switch:
	# store original context to stack
	str lr, [r13, #-4]!
90011270:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
	str r12, [r13, #-4]!
90011274:	e52dc004 	push	{ip}		; (str ip, [sp, #-4]!)
	str r11, [r13, #-4]!
90011278:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
	str r10, [r13, #-4]!
9001127c:	e52da004 	push	{sl}		; (str sl, [sp, #-4]!)
	str r9, [r13, #-4]!
90011280:	e52d9004 	push	{r9}		; (str r9, [sp, #-4]!)
	str r8, [r13, #-4]!
90011284:	e52d8004 	push	{r8}		; (str r8, [sp, #-4]!)
	str r7, [r13, #-4]!
90011288:	e52d7004 	push	{r7}		; (str r7, [sp, #-4]!)
	str r6, [r13, #-4]!
9001128c:	e52d6004 	push	{r6}		; (str r6, [sp, #-4]!)
	str r5, [r13, #-4]!
90011290:	e52d5004 	push	{r5}		; (str r5, [sp, #-4]!)
	str r4, [r13, #-4]!
90011294:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)

	# switch the stack
	str     r13, 	[r0]          	// save current sp to the old PCB (**old)
90011298:	e580d000 	str	sp, [r0]
	mov     r13, 	r1            	// load the next stack
9001129c:	e1a0d001 	mov	sp, r1

	# restore context from stack
	ldr r4, [r13], #4
900112a0:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
	ldr r5, [r13], #4
900112a4:	e49d5004 	pop	{r5}		; (ldr r5, [sp], #4)
	ldr r6, [r13], #4
900112a8:	e49d6004 	pop	{r6}		; (ldr r6, [sp], #4)
	ldr r7, [r13], #4
900112ac:	e49d7004 	pop	{r7}		; (ldr r7, [sp], #4)
	ldr r8, [r13], #4
900112b0:	e49d8004 	pop	{r8}		; (ldr r8, [sp], #4)
	ldr r9, [r13], #4
900112b4:	e49d9004 	pop	{r9}		; (ldr r9, [sp], #4)
	ldr r10, [r13], #4
900112b8:	e49da004 	pop	{sl}		; (ldr sl, [sp], #4)
	ldr r11, [r13], #4
900112bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
	ldr r12, [r13], #4
900112c0:	e49dc004 	pop	{ip}		; (ldr ip, [sp], #4)
	ldr lr, [r13], #4
900112c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)

	# return to the caller
	bx      lr
900112c8:	e12fff1e 	bx	lr

900112cc <ccm_init>:
////////////////////////////////////////////////////////////////////////////////
// Code
////////////////////////////////////////////////////////////////////////////////

void ccm_init(void)
{
900112cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900112d0:	e28db000 	add	fp, sp, #0
900112d4:	e24dd034 	sub	sp, sp, #52	; 0x34
900112d8:	e3a03902 	mov	r3, #32768	; 0x8000
900112dc:	e340320c 	movt	r3, #524	; 0x20c
900112e0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
#ifndef __ASSEMBLER__
typedef uintptr_t mmio_reg_t;
__attribute__((unused, always_inline)) static inline uintptr_t MMIO_P2V(uintptr_t paddr)
{
    /// @todo use dtb rather than just mapping.
    return (DEV_VRTMEM_BASE - DEV_PHYMEM_BASE) + paddr;
900112e4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
900112e8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    // ETHNET
    HW_CCM_ANALOG_PLL_ENET_CLR(BM_CCM_ANALOG_PLL_ENET_POWERDOWN);
900112ec:	e28330e8 	add	r3, r3, #232	; 0xe8
900112f0:	e1a02003 	mov	r2, r3
900112f4:	e3a03a01 	mov	r3, #4096	; 0x1000
900112f8:	e5823000 	str	r3, [r2]
900112fc:	e3a03902 	mov	r3, #32768	; 0x8000
90011300:	e340320c 	movt	r3, #524	; 0x20c
90011304:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
90011308:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001130c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_ANALOG_PLL_ENET_SET(BM_CCM_ANALOG_PLL_ENET_ENABLE);
90011310:	e28330e4 	add	r3, r3, #228	; 0xe4
90011314:	e1a02003 	mov	r2, r3
90011318:	e3a03a02 	mov	r3, #8192	; 0x2000
9001131c:	e5823000 	str	r3, [r2]
90011320:	e3a03902 	mov	r3, #32768	; 0x8000
90011324:	e340320c 	movt	r3, #524	; 0x20c
90011328:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
9001132c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90011330:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_ANALOG_PLL_ENET_CLR(BM_CCM_ANALOG_PLL_ENET_BYPASS);
90011334:	e28330e8 	add	r3, r3, #232	; 0xe8
90011338:	e1a02003 	mov	r2, r3
9001133c:	e3a03801 	mov	r3, #65536	; 0x10000
90011340:	e5823000 	str	r3, [r2]
90011344:	e3a03902 	mov	r3, #32768	; 0x8000
90011348:	e340320c 	movt	r3, #524	; 0x20c
9001134c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
90011350:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90011354:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
#if !defined(CHIP_MX6SL)
    HW_CCM_ANALOG_PLL_ENET.B.DIV_SELECT = 0x3;
90011358:	e28330e0 	add	r3, r3, #224	; 0xe0
9001135c:	e1a02003 	mov	r2, r3
90011360:	e5923000 	ldr	r3, [r2]
90011364:	e3833003 	orr	r3, r3, #3
90011368:	e5823000 	str	r3, [r2]
9001136c:	e3a03901 	mov	r3, #16384	; 0x4000
90011370:	e340320c 	movt	r3, #524	; 0x20c
90011374:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90011378:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001137c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
#else
    HW_CCM_ANALOG_PLL_ENET.B.DIV_SELECT = 0x1;
#endif

    // Ungate clocks that are not enabled in a driver - need to be updated
    HW_CCM_CCGR0_WR(0xffffffff);
90011380:	e2833068 	add	r3, r3, #104	; 0x68
90011384:	e1a02003 	mov	r2, r3
90011388:	e3e03000 	mvn	r3, #0
9001138c:	e5823000 	str	r3, [r2]
90011390:	e3a03901 	mov	r3, #16384	; 0x4000
90011394:	e340320c 	movt	r3, #524	; 0x20c
90011398:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
9001139c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900113a0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR1_WR(0xFFCF0FFF); // EPIT, ESAI, GPT enabled by driver
900113a4:	e283306c 	add	r3, r3, #108	; 0x6c
900113a8:	e1a02003 	mov	r2, r3
900113ac:	e3003fff 	movw	r3, #4095	; 0xfff
900113b0:	e34f3fcf 	movt	r3, #65487	; 0xffcf
900113b4:	e5823000 	str	r3, [r2]
900113b8:	e3a03901 	mov	r3, #16384	; 0x4000
900113bc:	e340320c 	movt	r3, #524	; 0x20c
900113c0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
900113c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900113c8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR2_WR(0xFFFFF03F); // I2C enabled by driver
900113cc:	e2833070 	add	r3, r3, #112	; 0x70
900113d0:	e1a02003 	mov	r2, r3
900113d4:	e3e03d3f 	mvn	r3, #4032	; 0xfc0
900113d8:	e5823000 	str	r3, [r2]
900113dc:	e3a03901 	mov	r3, #16384	; 0x4000
900113e0:	e340320c 	movt	r3, #524	; 0x20c
900113e4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
900113e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900113ec:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR3_WR(0xffffffff);
900113f0:	e2833074 	add	r3, r3, #116	; 0x74
900113f4:	e1a02003 	mov	r2, r3
900113f8:	e3e03000 	mvn	r3, #0
900113fc:	e5823000 	str	r3, [r2]
90011400:	e3a03901 	mov	r3, #16384	; 0x4000
90011404:	e340320c 	movt	r3, #524	; 0x20c
90011408:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001140c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90011410:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR4_WR(0x00FFFF03); // GPMI, Perfmon enabled by driver
90011414:	e2833078 	add	r3, r3, #120	; 0x78
90011418:	e1a02003 	mov	r2, r3
9001141c:	e30f3f03 	movw	r3, #65283	; 0xff03
90011420:	e34030ff 	movt	r3, #255	; 0xff
90011424:	e5823000 	str	r3, [r2]
90011428:	e3a03901 	mov	r3, #16384	; 0x4000
9001142c:	e340320c 	movt	r3, #524	; 0x20c
90011430:	e50b3010 	str	r3, [fp, #-16]
90011434:	e51b3010 	ldr	r3, [fp, #-16]
90011438:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR5_WR(0xF0FFFFCF); // UART, SATA enabled by driver
9001143c:	e283307c 	add	r3, r3, #124	; 0x7c
90011440:	e1a02003 	mov	r2, r3
90011444:	e30f3fcf 	movw	r3, #65487	; 0xffcf
90011448:	e34f30ff 	movt	r3, #61695	; 0xf0ff
9001144c:	e5823000 	str	r3, [r2]
90011450:	e3a03901 	mov	r3, #16384	; 0x4000
90011454:	e340320c 	movt	r3, #524	; 0x20c
90011458:	e50b300c 	str	r3, [fp, #-12]
9001145c:	e51b300c 	ldr	r3, [fp, #-12]
90011460:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_CCM_CCGR6_WR(0xffffffff);
90011464:	e2833080 	add	r3, r3, #128	; 0x80
90011468:	e1a02003 	mov	r2, r3
9001146c:	e3e03000 	mvn	r3, #0
90011470:	e5823000 	str	r3, [r2]
90011474:	e3a03901 	mov	r3, #16384	; 0x4000
90011478:	e340320c 	movt	r3, #524	; 0x20c
9001147c:	e50b3008 	str	r3, [fp, #-8]
90011480:	e51b3008 	ldr	r3, [fp, #-8]
90011484:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
     * pre_periph_clk_sel is by default at 0, so the selected output
     * of PLL2 is the main output at 528MHz.
     * => by default, ahb_podf divides by 4 => AHB_CLK@132MHz.
     * => by default, ipg_podf divides by 2 => IPG_CLK@66MHz.
     */
    HW_CCM_CBCDR.U = BF_CCM_CBCDR_AHB_PODF(3)
90011488:	e2833014 	add	r3, r3, #20
9001148c:	e1a02003 	mov	r2, r3
90011490:	e3a03c0d 	mov	r3, #3328	; 0xd00
90011494:	e3403001 	movt	r3, #1
90011498:	e5823000 	str	r3, [r2]
    //     HW_CCM_CSCDR1.U =

    /* Mask all interrupt sources that could wake up the processor when in
       a low power mode. A source is individually masked/unmasked when the
       interrupt is enabled/disabled by the GIC/interrupt driver. */
    HW_GPC_IMR1_WR(0xFFFFFFFF);
9001149c:	e30c3008 	movw	r3, #49160	; 0xc008
900114a0:	e340320d 	movt	r3, #525	; 0x20d
900114a4:	e3e02000 	mvn	r2, #0
900114a8:	e5832000 	str	r2, [r3]
    HW_GPC_IMR2_WR(0xFFFFFFFF);
900114ac:	e30c300c 	movw	r3, #49164	; 0xc00c
900114b0:	e340320d 	movt	r3, #525	; 0x20d
900114b4:	e3e02000 	mvn	r2, #0
900114b8:	e5832000 	str	r2, [r3]
    HW_GPC_IMR3_WR(0xFFFFFFFF);
900114bc:	e30c3010 	movw	r3, #49168	; 0xc010
900114c0:	e340320d 	movt	r3, #525	; 0x20d
900114c4:	e3e02000 	mvn	r2, #0
900114c8:	e5832000 	str	r2, [r3]
    HW_GPC_IMR4_WR(0xFFFFFFFF);
900114cc:	e30c3014 	movw	r3, #49172	; 0xc014
900114d0:	e340320d 	movt	r3, #525	; 0x20d
900114d4:	e3e02000 	mvn	r2, #0
900114d8:	e5832000 	str	r2, [r3]
}
900114dc:	e320f000 	nop	{0}
900114e0:	e28bd000 	add	sp, fp, #0
900114e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900114e8:	e12fff1e 	bx	lr

900114ec <get_main_clock>:

uint32_t get_main_clock(main_clocks_t clock)
{
900114ec:	e92d4800 	push	{fp, lr}
900114f0:	e28db004 	add	fp, sp, #4
900114f4:	e24dd038 	sub	sp, sp, #56	; 0x38
900114f8:	e1a03000 	mov	r3, r0
900114fc:	e54b3035 	strb	r3, [fp, #-53]	; 0xffffffcb
    uint32_t ret_val = 0;
90011500:	e3a03000 	mov	r3, #0
90011504:	e50b3008 	str	r3, [fp, #-8]
90011508:	e3a03901 	mov	r3, #16384	; 0x4000
9001150c:	e340320c 	movt	r3, #524	; 0x20c
90011510:	e50b3010 	str	r3, [fp, #-16]
90011514:	e51b3010 	ldr	r3, [fp, #-16]
90011518:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t pre_periph_clk_sel = HW_CCM_CBCMR.B.PRE_PERIPH_CLK_SEL;
9001151c:	e2833018 	add	r3, r3, #24
90011520:	e5933000 	ldr	r3, [r3]
90011524:	e7e13953 	ubfx	r3, r3, #18, #2
90011528:	e6ef3073 	uxtb	r3, r3
9001152c:	e50b300c 	str	r3, [fp, #-12]

    switch (clock) {
90011530:	e55b3035 	ldrb	r3, [fp, #-53]	; 0xffffffcb
90011534:	e3530006 	cmp	r3, #6
90011538:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
9001153c:	ea0000af 	b	90011800 <get_main_clock+0x314>
90011540:	9001155c 	.word	0x9001155c
90011544:	9001156c 	.word	0x9001156c
90011548:	900115bc 	.word	0x900115bc
9001154c:	9001160c 	.word	0x9001160c
90011550:	9001165c 	.word	0x9001165c
90011554:	900116e8 	.word	0x900116e8
90011558:	900117b0 	.word	0x900117b0
    case CPU_CLK:
        ret_val = PLL1_OUTPUT;
9001155c:	e3a03cf6 	mov	r3, #62976	; 0xf600
90011560:	e3423f34 	movt	r3, #12084	; 0x2f34
90011564:	e50b3008 	str	r3, [fp, #-8]
        break;
90011568:	ea0000a5 	b	90011804 <get_main_clock+0x318>
#if !defined(CHIP_MX6SL)
    case AXI_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.AXI_PODF + 1);
9001156c:	e3003df4 	movw	r3, #3572	; 0xdf4
90011570:	e3493002 	movt	r3, #36866	; 0x9002
90011574:	e51b200c 	ldr	r2, [fp, #-12]
90011578:	e7932102 	ldr	r2, [r3, r2, lsl #2]
9001157c:	e3a03901 	mov	r3, #16384	; 0x4000
90011580:	e340320c 	movt	r3, #524	; 0x20c
90011584:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90011588:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001158c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011590:	e2833014 	add	r3, r3, #20
90011594:	e5933000 	ldr	r3, [r3]
90011598:	e7e23853 	ubfx	r3, r3, #16, #3
9001159c:	e6ef3073 	uxtb	r3, r3
900115a0:	e2833001 	add	r3, r3, #1
900115a4:	e1a01003 	mov	r1, r3
900115a8:	e1a00002 	mov	r0, r2
900115ac:	fa003bbb 	blx	900204a0 <__udivsi3>
900115b0:	e1a03000 	mov	r3, r0
900115b4:	e50b3008 	str	r3, [fp, #-8]
        break;
900115b8:	ea000091 	b	90011804 <get_main_clock+0x318>
    case MMDC_CH0_AXI_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.MMDC_CH0_AXI_PODF + 1);
900115bc:	e3003df4 	movw	r3, #3572	; 0xdf4
900115c0:	e3493002 	movt	r3, #36866	; 0x9002
900115c4:	e51b200c 	ldr	r2, [fp, #-12]
900115c8:	e7932102 	ldr	r2, [r3, r2, lsl #2]
900115cc:	e3a03901 	mov	r3, #16384	; 0x4000
900115d0:	e340320c 	movt	r3, #524	; 0x20c
900115d4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
900115d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900115dc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900115e0:	e2833014 	add	r3, r3, #20
900115e4:	e5933000 	ldr	r3, [r3]
900115e8:	e7e239d3 	ubfx	r3, r3, #19, #3
900115ec:	e6ef3073 	uxtb	r3, r3
900115f0:	e2833001 	add	r3, r3, #1
900115f4:	e1a01003 	mov	r1, r3
900115f8:	e1a00002 	mov	r0, r2
900115fc:	fa003ba7 	blx	900204a0 <__udivsi3>
90011600:	e1a03000 	mov	r3, r0
90011604:	e50b3008 	str	r3, [fp, #-8]
        break;
90011608:	ea00007d 	b	90011804 <get_main_clock+0x318>
#endif
    case AHB_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.AHB_PODF + 1);
9001160c:	e3003df4 	movw	r3, #3572	; 0xdf4
90011610:	e3493002 	movt	r3, #36866	; 0x9002
90011614:	e51b200c 	ldr	r2, [fp, #-12]
90011618:	e7932102 	ldr	r2, [r3, r2, lsl #2]
9001161c:	e3a03901 	mov	r3, #16384	; 0x4000
90011620:	e340320c 	movt	r3, #524	; 0x20c
90011624:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90011628:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001162c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011630:	e2833014 	add	r3, r3, #20
90011634:	e5933000 	ldr	r3, [r3]
90011638:	e7e23553 	ubfx	r3, r3, #10, #3
9001163c:	e6ef3073 	uxtb	r3, r3
90011640:	e2833001 	add	r3, r3, #1
90011644:	e1a01003 	mov	r1, r3
90011648:	e1a00002 	mov	r0, r2
9001164c:	fa003b93 	blx	900204a0 <__udivsi3>
90011650:	e1a03000 	mov	r3, r0
90011654:	e50b3008 	str	r3, [fp, #-8]
        break;
90011658:	ea000069 	b	90011804 <get_main_clock+0x318>
    case IPG_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.AHB_PODF + 1) / (HW_CCM_CBCDR.B.IPG_PODF + 1);
9001165c:	e3003df4 	movw	r3, #3572	; 0xdf4
90011660:	e3493002 	movt	r3, #36866	; 0x9002
90011664:	e51b200c 	ldr	r2, [fp, #-12]
90011668:	e7932102 	ldr	r2, [r3, r2, lsl #2]
9001166c:	e3a03901 	mov	r3, #16384	; 0x4000
90011670:	e340320c 	movt	r3, #524	; 0x20c
90011674:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90011678:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001167c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011680:	e2833014 	add	r3, r3, #20
90011684:	e5933000 	ldr	r3, [r3]
90011688:	e7e23553 	ubfx	r3, r3, #10, #3
9001168c:	e6ef3073 	uxtb	r3, r3
90011690:	e2833001 	add	r3, r3, #1
90011694:	e1a01003 	mov	r1, r3
90011698:	e1a00002 	mov	r0, r2
9001169c:	fa003b7f 	blx	900204a0 <__udivsi3>
900116a0:	e1a03000 	mov	r3, r0
900116a4:	e1a02003 	mov	r2, r3
900116a8:	e3a03901 	mov	r3, #16384	; 0x4000
900116ac:	e340320c 	movt	r3, #524	; 0x20c
900116b0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
900116b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900116b8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900116bc:	e2833014 	add	r3, r3, #20
900116c0:	e5933000 	ldr	r3, [r3]
900116c4:	e7e13453 	ubfx	r3, r3, #8, #2
900116c8:	e6ef3073 	uxtb	r3, r3
900116cc:	e2833001 	add	r3, r3, #1
900116d0:	e1a01003 	mov	r1, r3
900116d4:	e1a00002 	mov	r0, r2
900116d8:	fa003b70 	blx	900204a0 <__udivsi3>
900116dc:	e1a03000 	mov	r3, r0
900116e0:	e50b3008 	str	r3, [fp, #-8]
        break;
900116e4:	ea000046 	b	90011804 <get_main_clock+0x318>
    case IPG_PER_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.AHB_PODF + 1) / (HW_CCM_CBCDR.B.IPG_PODF + 1) / (HW_CCM_CSCMR1.B.PERCLK_PODF + 1);
900116e8:	e3003df4 	movw	r3, #3572	; 0xdf4
900116ec:	e3493002 	movt	r3, #36866	; 0x9002
900116f0:	e51b200c 	ldr	r2, [fp, #-12]
900116f4:	e7932102 	ldr	r2, [r3, r2, lsl #2]
900116f8:	e3a03901 	mov	r3, #16384	; 0x4000
900116fc:	e340320c 	movt	r3, #524	; 0x20c
90011700:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
90011704:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90011708:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001170c:	e2833014 	add	r3, r3, #20
90011710:	e5933000 	ldr	r3, [r3]
90011714:	e7e23553 	ubfx	r3, r3, #10, #3
90011718:	e6ef3073 	uxtb	r3, r3
9001171c:	e2833001 	add	r3, r3, #1
90011720:	e1a01003 	mov	r1, r3
90011724:	e1a00002 	mov	r0, r2
90011728:	fa003b5c 	blx	900204a0 <__udivsi3>
9001172c:	e1a03000 	mov	r3, r0
90011730:	e1a02003 	mov	r2, r3
90011734:	e3a03901 	mov	r3, #16384	; 0x4000
90011738:	e340320c 	movt	r3, #524	; 0x20c
9001173c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
90011740:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90011744:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011748:	e2833014 	add	r3, r3, #20
9001174c:	e5933000 	ldr	r3, [r3]
90011750:	e7e13453 	ubfx	r3, r3, #8, #2
90011754:	e6ef3073 	uxtb	r3, r3
90011758:	e2833001 	add	r3, r3, #1
9001175c:	e1a01003 	mov	r1, r3
90011760:	e1a00002 	mov	r0, r2
90011764:	fa003b4d 	blx	900204a0 <__udivsi3>
90011768:	e1a03000 	mov	r3, r0
9001176c:	e1a02003 	mov	r2, r3
90011770:	e3a03901 	mov	r3, #16384	; 0x4000
90011774:	e340320c 	movt	r3, #524	; 0x20c
90011778:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
9001177c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90011780:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011784:	e283301c 	add	r3, r3, #28
90011788:	e5933000 	ldr	r3, [r3]
9001178c:	e7e53053 	ubfx	r3, r3, #0, #6
90011790:	e6ef3073 	uxtb	r3, r3
90011794:	e2833001 	add	r3, r3, #1
90011798:	e1a01003 	mov	r1, r3
9001179c:	e1a00002 	mov	r0, r2
900117a0:	fa003b3e 	blx	900204a0 <__udivsi3>
900117a4:	e1a03000 	mov	r3, r0
900117a8:	e50b3008 	str	r3, [fp, #-8]
        break;
900117ac:	ea000014 	b	90011804 <get_main_clock+0x318>
#if !defined(CHIP_MX6SL)
    case MMDC_CH1_AXI_CLK:
        ret_val = PLL2_OUTPUT[pre_periph_clk_sel] / (HW_CCM_CBCDR.B.MMDC_CH1_AXI_PODF + 1);
900117b0:	e3003df4 	movw	r3, #3572	; 0xdf4
900117b4:	e3493002 	movt	r3, #36866	; 0x9002
900117b8:	e51b200c 	ldr	r2, [fp, #-12]
900117bc:	e7932102 	ldr	r2, [r3, r2, lsl #2]
900117c0:	e3a03901 	mov	r3, #16384	; 0x4000
900117c4:	e340320c 	movt	r3, #524	; 0x20c
900117c8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
900117cc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
900117d0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900117d4:	e2833014 	add	r3, r3, #20
900117d8:	e5933000 	ldr	r3, [r3]
900117dc:	e7e231d3 	ubfx	r3, r3, #3, #3
900117e0:	e6ef3073 	uxtb	r3, r3
900117e4:	e2833001 	add	r3, r3, #1
900117e8:	e1a01003 	mov	r1, r3
900117ec:	e1a00002 	mov	r0, r2
900117f0:	fa003b2a 	blx	900204a0 <__udivsi3>
900117f4:	e1a03000 	mov	r3, r0
900117f8:	e50b3008 	str	r3, [fp, #-8]
        break;
900117fc:	ea000000 	b	90011804 <get_main_clock+0x318>
#endif
    default:
        break;
90011800:	e320f000 	nop	{0}
    }

    return ret_val;
90011804:	e51b3008 	ldr	r3, [fp, #-8]
}
90011808:	e1a00003 	mov	r0, r3
9001180c:	e24bd004 	sub	sp, fp, #4
90011810:	e8bd8800 	pop	{fp, pc}

90011814 <get_peri_clock>:

uint32_t get_peri_clock(peri_clocks_t clock)
{
90011814:	e92d4800 	push	{fp, lr}
90011818:	e28db004 	add	fp, sp, #4
9001181c:	e24dd020 	sub	sp, sp, #32
90011820:	e1a03000 	mov	r3, r0
90011824:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    uint32_t ret_val = 0;
90011828:	e3a03000 	mov	r3, #0
9001182c:	e50b3008 	str	r3, [fp, #-8]

    switch (clock) {
90011830:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
90011834:	e353000d 	cmp	r3, #13
90011838:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
9001183c:	ea00006a 	b	900119ec <get_peri_clock+0x1d8>
90011840:	90011878 	.word	0x90011878
90011844:	90011878 	.word	0x90011878
90011848:	90011878 	.word	0x90011878
9001184c:	90011878 	.word	0x90011878
90011850:	900119ec 	.word	0x900119ec
90011854:	900119ec 	.word	0x900119ec
90011858:	900119ec 	.word	0x900119ec
9001185c:	900119ec 	.word	0x900119ec
90011860:	900119ec 	.word	0x900119ec
90011864:	9001191c 	.word	0x9001191c
90011868:	900119ec 	.word	0x900119ec
9001186c:	900119ec 	.word	0x900119ec
90011870:	900118d0 	.word	0x900118d0
90011874:	900119a0 	.word	0x900119a0
    case UART1_MODULE_CLK:
    case UART2_MODULE_CLK:
    case UART3_MODULE_CLK:
    case UART4_MODULE_CLK:
        // UART source clock is a fixed PLL3 / 6
        ret_val = PLL3_OUTPUT[0] / 6 / (HW_CCM_CSCDR1.B.UART_CLK_PODF + 1);
90011878:	e3a02b0e 	mov	r2, #14336	; 0x3800
9001187c:	e3412c9c 	movt	r2, #7324	; 0x1c9c
90011880:	e30a3aab 	movw	r3, #43691	; 0xaaab
90011884:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
90011888:	e0832392 	umull	r2, r3, r2, r3
9001188c:	e1a02123 	lsr	r2, r3, #2
90011890:	e3a03901 	mov	r3, #16384	; 0x4000
90011894:	e340320c 	movt	r3, #524	; 0x20c
90011898:	e50b300c 	str	r3, [fp, #-12]
9001189c:	e51b300c 	ldr	r3, [fp, #-12]
900118a0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900118a4:	e2833024 	add	r3, r3, #36	; 0x24
900118a8:	e5933000 	ldr	r3, [r3]
900118ac:	e7e53053 	ubfx	r3, r3, #0, #6
900118b0:	e6ef3073 	uxtb	r3, r3
900118b4:	e2833001 	add	r3, r3, #1
900118b8:	e1a01003 	mov	r1, r3
900118bc:	e1a00002 	mov	r0, r2
900118c0:	fa003af6 	blx	900204a0 <__udivsi3>
900118c4:	e1a03000 	mov	r3, r0
900118c8:	e50b3008 	str	r3, [fp, #-8]
        break;
900118cc:	ea000047 	b	900119f0 <get_peri_clock+0x1dc>

    // eCSPI clock:
    //     PLL3(480) -> /8 -> CSCDR2[ECSPI_CLK_PODF]
    case SPI_CLK:
        ret_val = PLL3_OUTPUT[0] / 8 / (HW_CCM_CSCDR2.B.ECSPI_CLK_PODF + 1);
900118d0:	e3a03b0e 	mov	r3, #14336	; 0x3800
900118d4:	e3413c9c 	movt	r3, #7324	; 0x1c9c
900118d8:	e1a021a3 	lsr	r2, r3, #3
900118dc:	e3a03901 	mov	r3, #16384	; 0x4000
900118e0:	e340320c 	movt	r3, #524	; 0x20c
900118e4:	e50b3010 	str	r3, [fp, #-16]
900118e8:	e51b3010 	ldr	r3, [fp, #-16]
900118ec:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900118f0:	e2833038 	add	r3, r3, #56	; 0x38
900118f4:	e5933000 	ldr	r3, [r3]
900118f8:	e7e539d3 	ubfx	r3, r3, #19, #6
900118fc:	e6ef3073 	uxtb	r3, r3
90011900:	e2833001 	add	r3, r3, #1
90011904:	e1a01003 	mov	r1, r3
90011908:	e1a00002 	mov	r0, r2
9001190c:	fa003ae3 	blx	900204a0 <__udivsi3>
90011910:	e1a03000 	mov	r3, r0
90011914:	e50b3008 	str	r3, [fp, #-8]
        break;
90011918:	ea000034 	b	900119f0 <get_peri_clock+0x1dc>

#if !defined(CHIP_MX6SL)
    case RAWNAND_CLK:
        ret_val = PLL3_OUTPUT[0] / (HW_CCM_CS2CDR.B.ENFC_CLK_PRED + 1) / (HW_CCM_CS2CDR.B.ENFC_CLK_PODF + 1);
9001191c:	e3a02b0e 	mov	r2, #14336	; 0x3800
90011920:	e3412c9c 	movt	r2, #7324	; 0x1c9c
90011924:	e3a03901 	mov	r3, #16384	; 0x4000
90011928:	e340320c 	movt	r3, #524	; 0x20c
9001192c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90011930:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90011934:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011938:	e283302c 	add	r3, r3, #44	; 0x2c
9001193c:	e5933000 	ldr	r3, [r3]
90011940:	e7e23953 	ubfx	r3, r3, #18, #3
90011944:	e6ef3073 	uxtb	r3, r3
90011948:	e2833001 	add	r3, r3, #1
9001194c:	e1a01003 	mov	r1, r3
90011950:	e1a00002 	mov	r0, r2
90011954:	fa003ad1 	blx	900204a0 <__udivsi3>
90011958:	e1a03000 	mov	r3, r0
9001195c:	e1a02003 	mov	r2, r3
90011960:	e3a03901 	mov	r3, #16384	; 0x4000
90011964:	e340320c 	movt	r3, #524	; 0x20c
90011968:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001196c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90011970:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90011974:	e283302c 	add	r3, r3, #44	; 0x2c
90011978:	e5933000 	ldr	r3, [r3]
9001197c:	e7e53ad3 	ubfx	r3, r3, #21, #6
90011980:	e6ef3073 	uxtb	r3, r3
90011984:	e2833001 	add	r3, r3, #1
90011988:	e1a01003 	mov	r1, r3
9001198c:	e1a00002 	mov	r0, r2
90011990:	fa003ac2 	blx	900204a0 <__udivsi3>
90011994:	e1a03000 	mov	r3, r0
90011998:	e50b3008 	str	r3, [fp, #-8]
        break;
9001199c:	ea000013 	b	900119f0 <get_peri_clock+0x1dc>

    case CAN_CLK:
        // For i.mx6dq/sdl CAN source clock is a fixed PLL3 / 8
        ret_val = PLL3_OUTPUT[0] / 8 / (HW_CCM_CSCMR2.B.CAN_CLK_PODF + 1);
900119a0:	e3a03b0e 	mov	r3, #14336	; 0x3800
900119a4:	e3413c9c 	movt	r3, #7324	; 0x1c9c
900119a8:	e1a021a3 	lsr	r2, r3, #3
900119ac:	e3a03901 	mov	r3, #16384	; 0x4000
900119b0:	e340320c 	movt	r3, #524	; 0x20c
900119b4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
900119b8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900119bc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900119c0:	e2833020 	add	r3, r3, #32
900119c4:	e5933000 	ldr	r3, [r3]
900119c8:	e7e53153 	ubfx	r3, r3, #2, #6
900119cc:	e6ef3073 	uxtb	r3, r3
900119d0:	e2833001 	add	r3, r3, #1
900119d4:	e1a01003 	mov	r1, r3
900119d8:	e1a00002 	mov	r0, r2
900119dc:	fa003aaf 	blx	900204a0 <__udivsi3>
900119e0:	e1a03000 	mov	r3, r0
900119e4:	e50b3008 	str	r3, [fp, #-8]
        break;
900119e8:	ea000000 	b	900119f0 <get_peri_clock+0x1dc>
#endif

    default:
        break;
900119ec:	e320f000 	nop	{0}
    }

    return ret_val;
900119f0:	e51b3008 	ldr	r3, [fp, #-8]
}
900119f4:	e1a00003 	mov	r0, r3
900119f8:	e24bd004 	sub	sp, fp, #4
900119fc:	e8bd8800 	pop	{fp, pc}

90011a00 <ccm_ccgr_config>:
 * @param   ccm_ccgrx Address of the clock gating register: CCM_CCGR1,...
 * @param   cgx_offset Offset of the clock gating field: CG(x).
 * @param   gating_mode Clock gating mode: CLOCK_ON or CLOCK_OFF.
 */
void ccm_ccgr_config(uint32_t ccm_ccgrx, uint32_t cgx_offset, uint32_t gating_mode)
{
90011a00:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011a04:	e28db000 	add	fp, sp, #0
90011a08:	e24dd014 	sub	sp, sp, #20
90011a0c:	e50b0008 	str	r0, [fp, #-8]
90011a10:	e50b100c 	str	r1, [fp, #-12]
90011a14:	e50b2010 	str	r2, [fp, #-16]
    if (gating_mode == CLOCK_ON) {
90011a18:	e51b3010 	ldr	r3, [fp, #-16]
90011a1c:	e3530003 	cmp	r3, #3
90011a20:	1a000006 	bne	90011a40 <ccm_ccgr_config+0x40>
        *(volatile uint32_t*)(ccm_ccgrx) |= cgx_offset;
90011a24:	e51b3008 	ldr	r3, [fp, #-8]
90011a28:	e51b2008 	ldr	r2, [fp, #-8]
90011a2c:	e5921000 	ldr	r1, [r2]
90011a30:	e51b200c 	ldr	r2, [fp, #-12]
90011a34:	e1812002 	orr	r2, r1, r2
90011a38:	e5832000 	str	r2, [r3]
    } else {
        *(volatile uint32_t*)(ccm_ccgrx) &= ~cgx_offset;
    }
}
90011a3c:	ea000006 	b	90011a5c <ccm_ccgr_config+0x5c>
        *(volatile uint32_t*)(ccm_ccgrx) &= ~cgx_offset;
90011a40:	e51b3008 	ldr	r3, [fp, #-8]
90011a44:	e51b2008 	ldr	r2, [fp, #-8]
90011a48:	e5921000 	ldr	r1, [r2]
90011a4c:	e51b200c 	ldr	r2, [fp, #-12]
90011a50:	e1e02002 	mvn	r2, r2
90011a54:	e0022001 	and	r2, r2, r1
90011a58:	e5832000 	str	r2, [r3]
}
90011a5c:	e320f000 	nop	{0}
90011a60:	e28bd000 	add	sp, fp, #0
90011a64:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011a68:	e12fff1e 	bx	lr

90011a6c <clock_gating_config>:

void clock_gating_config(uint32_t base_address, uint32_t gating_mode)
{
90011a6c:	e92d4800 	push	{fp, lr}
90011a70:	e28db004 	add	fp, sp, #4
90011a74:	e24dd018 	sub	sp, sp, #24
90011a78:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90011a7c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    uint32_t ccm_ccgrx = 0;
90011a80:	e3a03000 	mov	r3, #0
90011a84:	e50b3008 	str	r3, [fp, #-8]
    uint32_t cgx_offset = 0;
90011a88:	e3a03000 	mov	r3, #0
90011a8c:	e50b300c 	str	r3, [fp, #-12]

    switch (base_address) {
90011a90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90011a94:	e3a02902 	mov	r2, #32768	; 0x8000
90011a98:	e340221e 	movt	r2, #542	; 0x21e
90011a9c:	e1530002 	cmp	r3, r2
90011aa0:	0a000019 	beq	90011b0c <clock_gating_config+0xa0>
90011aa4:	e3a02902 	mov	r2, #32768	; 0x8000
90011aa8:	e340221e 	movt	r2, #542	; 0x21e
90011aac:	e1530002 	cmp	r3, r2
90011ab0:	8a000008 	bhi	90011ad8 <clock_gating_config+0x6c>
90011ab4:	e3a02000 	mov	r2, #0
90011ab8:	e3402202 	movt	r2, #514	; 0x202
90011abc:	e1530002 	cmp	r3, r2
90011ac0:	0a000011 	beq	90011b0c <clock_gating_config+0xa0>
90011ac4:	e3a02902 	mov	r2, #32768	; 0x8000
90011ac8:	e3402209 	movt	r2, #521	; 0x209
90011acc:	e1530002 	cmp	r3, r2
90011ad0:	0a000017 	beq	90011b34 <clock_gating_config+0xc8>
    case GPT_BASE_ADDR:
        ccm_ccgrx = HW_CCM_CCGR1_ADDR;
        cgx_offset = CG(10);
        break;
    default:
        break;
90011ad4:	ea000020 	b	90011b5c <clock_gating_config+0xf0>
    switch (base_address) {
90011ad8:	e3a02000 	mov	r2, #0
90011adc:	e340221f 	movt	r2, #543	; 0x21f
90011ae0:	e1530002 	cmp	r3, r2
90011ae4:	0a000008 	beq	90011b0c <clock_gating_config+0xa0>
90011ae8:	e3a02901 	mov	r2, #16384	; 0x4000
90011aec:	e340221f 	movt	r2, #543	; 0x21f
90011af0:	e1530002 	cmp	r3, r2
90011af4:	0a000004 	beq	90011b0c <clock_gating_config+0xa0>
90011af8:	e3a02903 	mov	r2, #49152	; 0xc000
90011afc:	e340221e 	movt	r2, #542	; 0x21e
90011b00:	e1530002 	cmp	r3, r2
90011b04:	0a000000 	beq	90011b0c <clock_gating_config+0xa0>
        break;
90011b08:	ea000013 	b	90011b5c <clock_gating_config+0xf0>
90011b0c:	e3a03901 	mov	r3, #16384	; 0x4000
90011b10:	e340320c 	movt	r3, #524	; 0x20c
90011b14:	e50b3010 	str	r3, [fp, #-16]
90011b18:	e51b3010 	ldr	r3, [fp, #-16]
90011b1c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        ccm_ccgrx = HW_CCM_CCGR5_ADDR;
90011b20:	e283307c 	add	r3, r3, #124	; 0x7c
90011b24:	e50b3008 	str	r3, [fp, #-8]
        cgx_offset = CG(13) | CG(12);
90011b28:	e3a0340f 	mov	r3, #251658240	; 0xf000000
90011b2c:	e50b300c 	str	r3, [fp, #-12]
        break;
90011b30:	ea000009 	b	90011b5c <clock_gating_config+0xf0>
90011b34:	e3a03901 	mov	r3, #16384	; 0x4000
90011b38:	e340320c 	movt	r3, #524	; 0x20c
90011b3c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90011b40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90011b44:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        ccm_ccgrx = HW_CCM_CCGR1_ADDR;
90011b48:	e283306c 	add	r3, r3, #108	; 0x6c
90011b4c:	e50b3008 	str	r3, [fp, #-8]
        cgx_offset = CG(10);
90011b50:	e3a03603 	mov	r3, #3145728	; 0x300000
90011b54:	e50b300c 	str	r3, [fp, #-12]
        break;
90011b58:	e320f000 	nop	{0}
    }

    // apply changes only if a valid address was found
    if (ccm_ccgrx != 0) {
90011b5c:	e51b3008 	ldr	r3, [fp, #-8]
90011b60:	e3530000 	cmp	r3, #0
90011b64:	0a000003 	beq	90011b78 <clock_gating_config+0x10c>
        ccm_ccgr_config(ccm_ccgrx, cgx_offset, gating_mode);
90011b68:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90011b6c:	e51b100c 	ldr	r1, [fp, #-12]
90011b70:	e51b0008 	ldr	r0, [fp, #-8]
90011b74:	ebffffa1 	bl	90011a00 <ccm_ccgr_config>
    }
}
90011b78:	e320f000 	nop	{0}
90011b7c:	e24bd004 	sub	sp, fp, #4
90011b80:	e8bd8800 	pop	{fp, pc}

90011b84 <ccm_set_lpm_wakeup_source>:

void ccm_set_lpm_wakeup_source(uint32_t irq_id, bool doEnable)
{
90011b84:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011b88:	e28db000 	add	fp, sp, #0
90011b8c:	e24dd01c 	sub	sp, sp, #28
90011b90:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90011b94:	e1a03001 	mov	r3, r1
90011b98:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
    uint32_t reg_offset = 0;
90011b9c:	e3a03000 	mov	r3, #0
90011ba0:	e50b3008 	str	r3, [fp, #-8]
    uint32_t bit_offset = 0;
90011ba4:	e3a03000 	mov	r3, #0
90011ba8:	e50b300c 	str	r3, [fp, #-12]
    uint32_t gpc_imr = 0;
90011bac:	e3a03000 	mov	r3, #0
90011bb0:	e50b3010 	str	r3, [fp, #-16]

    // calculate the offset of the register handling that interrupt ID
    // ID starts at 32, so for instance ID=89 is handled by IMR2 because
    // the integer part of the division is reg_offset = 2
    reg_offset = (irq_id / 32);
90011bb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90011bb8:	e1a032a3 	lsr	r3, r3, #5
90011bbc:	e50b3008 	str	r3, [fp, #-8]
    // and the rest of the previous division is used to calculate the bit
    // offset in the register, so for ID=89 this is bit_offset = 25
    bit_offset = irq_id - 32 * reg_offset;
90011bc0:	e51b3008 	ldr	r3, [fp, #-8]
90011bc4:	e1a03283 	lsl	r3, r3, #5
90011bc8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90011bcc:	e0423003 	sub	r3, r2, r3
90011bd0:	e50b300c 	str	r3, [fp, #-12]

    // get the current value of the corresponding GPC_IMRx register
    gpc_imr = *((volatile uint32_t*)(HW_GPC_IMR1_ADDR + (reg_offset - 1) * 4));
90011bd4:	e51b2008 	ldr	r2, [fp, #-8]
90011bd8:	e3073001 	movw	r3, #28673	; 0x7001
90011bdc:	e3403083 	movt	r3, #131	; 0x83
90011be0:	e0823003 	add	r3, r2, r3
90011be4:	e1a03103 	lsl	r3, r3, #2
90011be8:	e5933000 	ldr	r3, [r3]
90011bec:	e50b3010 	str	r3, [fp, #-16]

    if (doEnable) {
90011bf0:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
90011bf4:	e3530000 	cmp	r3, #0
90011bf8:	0a000010 	beq	90011c40 <ccm_set_lpm_wakeup_source+0xbc>
        // clear the corresponding bit to unmask the interrupt source
        gpc_imr &= ~(1 << bit_offset);
90011bfc:	e3a02001 	mov	r2, #1
90011c00:	e51b300c 	ldr	r3, [fp, #-12]
90011c04:	e1a03312 	lsl	r3, r2, r3
90011c08:	e1e03003 	mvn	r3, r3
90011c0c:	e1a02003 	mov	r2, r3
90011c10:	e51b3010 	ldr	r3, [fp, #-16]
90011c14:	e0033002 	and	r3, r3, r2
90011c18:	e50b3010 	str	r3, [fp, #-16]
        // write the new mask
        *((volatile uint32_t*)(HW_GPC_IMR1_ADDR + (reg_offset - 1) * 4)) = (gpc_imr);
90011c1c:	e51b2008 	ldr	r2, [fp, #-8]
90011c20:	e3073001 	movw	r3, #28673	; 0x7001
90011c24:	e3403083 	movt	r3, #131	; 0x83
90011c28:	e0823003 	add	r3, r2, r3
90011c2c:	e1a03103 	lsl	r3, r3, #2
90011c30:	e1a02003 	mov	r2, r3
90011c34:	e51b3010 	ldr	r3, [fp, #-16]
90011c38:	e5823000 	str	r3, [r2]
        // set the corresponding bit to mask the interrupt source
        gpc_imr |= (1 << bit_offset);
        // write the new mask
        *((volatile uint32_t*)(HW_GPC_IMR1_ADDR + (reg_offset - 1) * 4)) = (gpc_imr);
    }
}
90011c3c:	ea00000e 	b	90011c7c <ccm_set_lpm_wakeup_source+0xf8>
        gpc_imr |= (1 << bit_offset);
90011c40:	e3a02001 	mov	r2, #1
90011c44:	e51b300c 	ldr	r3, [fp, #-12]
90011c48:	e1a03312 	lsl	r3, r2, r3
90011c4c:	e1a02003 	mov	r2, r3
90011c50:	e51b3010 	ldr	r3, [fp, #-16]
90011c54:	e1833002 	orr	r3, r3, r2
90011c58:	e50b3010 	str	r3, [fp, #-16]
        *((volatile uint32_t*)(HW_GPC_IMR1_ADDR + (reg_offset - 1) * 4)) = (gpc_imr);
90011c5c:	e51b2008 	ldr	r2, [fp, #-8]
90011c60:	e3073001 	movw	r3, #28673	; 0x7001
90011c64:	e3403083 	movt	r3, #131	; 0x83
90011c68:	e0823003 	add	r3, r2, r3
90011c6c:	e1a03103 	lsl	r3, r3, #2
90011c70:	e1a02003 	mov	r2, r3
90011c74:	e51b3010 	ldr	r3, [fp, #-16]
90011c78:	e5823000 	str	r3, [r2]
}
90011c7c:	e320f000 	nop	{0}
90011c80:	e28bd000 	add	sp, fp, #0
90011c84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011c88:	e12fff1e 	bx	lr

90011c8c <ccm_enter_low_power>:

void ccm_enter_low_power(lp_modes_t lp_mode)
{
90011c8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011c90:	e28db000 	add	fp, sp, #0
90011c94:	e24dd014 	sub	sp, sp, #20
90011c98:	e1a03000 	mov	r3, r0
90011c9c:	e54b300d 	strb	r3, [fp, #-13]
    uint32_t ccm_clpcr = 0;
90011ca0:	e3a03000 	mov	r3, #0
90011ca4:	e50b3008 	str	r3, [fp, #-8]
    // set disable core clock in wait - set disable oscillator in stop
    ccm_clpcr =
#if !defined(CHIP_MX6SL)
        BM_CCM_CLPCR_BYPASS_MMDC_CH1_LPM_HS |
#endif
        BM_CCM_CLPCR_SBYOS | BM_CCM_CLPCR_ARM_CLK_DIS_ON_LPM | lp_mode;
90011ca8:	e55b300d 	ldrb	r3, [fp, #-13]
90011cac:	e3833602 	orr	r3, r3, #2097152	; 0x200000
90011cb0:	e3833060 	orr	r3, r3, #96	; 0x60
    ccm_clpcr =
90011cb4:	e50b3008 	str	r3, [fp, #-8]

    if (lp_mode == STOP_MODE) {
90011cb8:	e55b300d 	ldrb	r3, [fp, #-13]
90011cbc:	e3530002 	cmp	r3, #2
90011cc0:	1a000002 	bne	90011cd0 <ccm_enter_low_power+0x44>
        // enable peripherals well-biased
        ccm_clpcr |= BM_CCM_CLPCR_WB_PER_AT_LPM;
90011cc4:	e51b3008 	ldr	r3, [fp, #-8]
90011cc8:	e3833801 	orr	r3, r3, #65536	; 0x10000
90011ccc:	e50b3008 	str	r3, [fp, #-8]
90011cd0:	e3a03901 	mov	r3, #16384	; 0x4000
90011cd4:	e340320c 	movt	r3, #524	; 0x20c
90011cd8:	e50b300c 	str	r3, [fp, #-12]
90011cdc:	e51b300c 	ldr	r3, [fp, #-12]
90011ce0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    }

    HW_CCM_CLPCR_WR(ccm_clpcr);
90011ce4:	e2833054 	add	r3, r3, #84	; 0x54
90011ce8:	e1a02003 	mov	r2, r3
90011cec:	e51b3008 	ldr	r3, [fp, #-8]
90011cf0:	e5823000 	str	r3, [r2]

    __asm(
90011cf4:	f57ff04f 	dsb	sy
90011cf8:	e320f003 	wfi
90011cfc:	f57ff06f 	isb	sy
        // wait for interrupt instruction
        "wfi;"
        // instruction synchronization barrier (flush the pipe-line)
        "isb;");

    return;
90011d00:	e320f000 	nop	{0}
}
90011d04:	e28bd000 	add	sp, fp, #0
90011d08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011d0c:	e12fff1e 	bx	lr

90011d10 <ipu_hsp_clk_config>:
 * @brief Configure ipu 1 and 2 hsp clk to default 264MHz
 *
 * ipu_hsp_clk is derived from mmdc_ch0 divided by 2.
 */
void ipu_hsp_clk_config(void)
{
90011d10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011d14:	e28db000 	add	fp, sp, #0
90011d18:	e24dd00c 	sub	sp, sp, #12
90011d1c:	e3a03901 	mov	r3, #16384	; 0x4000
90011d20:	e340320c 	movt	r3, #524	; 0x20c
90011d24:	e50b3008 	str	r3, [fp, #-8]
90011d28:	e51b3008 	ldr	r3, [fp, #-8]
90011d2c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    // clk_sel from mmdc_ch0, podf=1
    HW_CCM_CSCDR3_WR(BF_CCM_CSCDR3_IPU1_HSP_CLK_SEL(0)
90011d30:	e283303c 	add	r3, r3, #60	; 0x3c
90011d34:	e1a02003 	mov	r2, r3
90011d38:	e3a03b42 	mov	r3, #67584	; 0x10800
90011d3c:	e5823000 	str	r3, [r2]
#if CHIP_MX6DQ
        | BF_CCM_CSCDR3_IPU2_HSP_CLK_SEL(0)
        | BF_CCM_CSCDR3_IPU2_HSP_PODF(1)
#endif // CHIP_MX6DQ
    );
}
90011d40:	e320f000 	nop	{0}
90011d44:	e28bd000 	add	sp, fp, #0
90011d48:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011d4c:	e12fff1e 	bx	lr

90011d50 <_sys_clock_init>:

#include "clock_common_op.h"
#include "irq_numbers.h"

static void _sys_clock_init()
{
90011d50:	e92d4800 	push	{fp, lr}
90011d54:	e28db004 	add	fp, sp, #4
90011d58:	e24dd008 	sub	sp, sp, #8
    uint32_t freq = get_main_clock(IPG_CLK);
90011d5c:	e3a00004 	mov	r0, #4
90011d60:	ebfffde1 	bl	900114ec <get_main_clock>
90011d64:	e50b0008 	str	r0, [fp, #-8]
    gpt_init(CLKSRC_IPG_CLK, freq / 1000000, RESTART_MODE, WAIT_MODE_EN | STOP_MODE_EN);
90011d68:	e51b2008 	ldr	r2, [fp, #-8]
90011d6c:	e30d3e83 	movw	r3, #56963	; 0xde83
90011d70:	e344331b 	movt	r3, #17179	; 0x431b
90011d74:	e0832392 	umull	r2, r3, r2, r3
90011d78:	e1a01923 	lsr	r1, r3, #18
90011d7c:	e3a03003 	mov	r3, #3
90011d80:	e3a02000 	mov	r2, #0
90011d84:	e3a00001 	mov	r0, #1
90011d88:	eb00018a 	bl	900123b8 <gpt_init>
    gpt_set_compare_event(kGPTOutputCompare1, OUTPUT_CMP_DISABLE, 1000);
90011d8c:	e3a02ffa 	mov	r2, #1000	; 0x3e8
90011d90:	e3a01000 	mov	r1, #0
90011d94:	e3a00001 	mov	r0, #1
90011d98:	eb0000ea 	bl	90012148 <gpt_set_compare_event>
    gpt_counter_enable(kGPTOutputCompare1);
90011d9c:	e3a00001 	mov	r0, #1
90011da0:	eb000169 	bl	9001234c <gpt_counter_enable>
}
90011da4:	e320f000 	nop	{0}
90011da8:	e24bd004 	sub	sp, fp, #4
90011dac:	e8bd8800 	pop	{fp, pc}

90011db0 <_get_clock_int>:

static uint32_t _get_clock_int()
{
90011db0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011db4:	e28db000 	add	fp, sp, #0
    return IMX_INT_GPT;
90011db8:	e3a03057 	mov	r3, #87	; 0x57
}
90011dbc:	e1a00003 	mov	r0, r3
90011dc0:	e28bd000 	add	sp, fp, #0
90011dc4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011dc8:	e12fff1e 	bx	lr

90011dcc <_get_tick>:

static uint64_t _get_tick()
{
90011dcc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011dd0:	e28db000 	add	fp, sp, #0
    return 0;
90011dd4:	e3a02000 	mov	r2, #0
90011dd8:	e3a03000 	mov	r3, #0
}
90011ddc:	e1a00002 	mov	r0, r2
90011de0:	e1a01003 	mov	r1, r3
90011de4:	e28bd000 	add	sp, fp, #0
90011de8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011dec:	e12fff1e 	bx	lr

90011df0 <_get_second>:

static uint64_t _get_second()
{
90011df0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011df4:	e28db000 	add	fp, sp, #0
    return 0;
90011df8:	e3a02000 	mov	r2, #0
90011dfc:	e3a03000 	mov	r3, #0
}
90011e00:	e1a00002 	mov	r0, r2
90011e04:	e1a01003 	mov	r1, r3
90011e08:	e28bd000 	add	sp, fp, #0
90011e0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011e10:	e12fff1e 	bx	lr

90011e14 <_clear_clock_intr>:

static void _clear_clock_intr()
{
90011e14:	e92d4800 	push	{fp, lr}
90011e18:	e28db004 	add	fp, sp, #4
    gpt_get_compare_event(kGPTOutputCompare1);
90011e1c:	e3a00001 	mov	r0, #1
90011e20:	eb0000a5 	bl	900120bc <gpt_get_compare_event>
}
90011e24:	e320f000 	nop	{0}
90011e28:	e8bd8800 	pop	{fp, pc}

90011e2c <hardkernel_clock_init>:
    .get_second = _get_second,
    .clear_clock_intr = _clear_clock_intr,
};

struct XiziClockDriver* hardkernel_clock_init(struct TraceTag* hardkernel_tag)
{
90011e2c:	e92d4800 	push	{fp, lr}
90011e30:	e28db004 	add	fp, sp, #4
90011e34:	e24dd008 	sub	sp, sp, #8
90011e38:	e50b0008 	str	r0, [fp, #-8]
    hardkernel_clock_driver.sys_clock_init();
90011e3c:	e3033024 	movw	r3, #12324	; 0x3024
90011e40:	e3493002 	movt	r3, #36866	; 0x9002
90011e44:	e5933000 	ldr	r3, [r3]
90011e48:	e12fff33 	blx	r3
    return &hardkernel_clock_driver;
90011e4c:	e3033024 	movw	r3, #12324	; 0x3024
90011e50:	e3493002 	movt	r3, #36866	; 0x9002
90011e54:	e1a00003 	mov	r0, r3
90011e58:	e24bd004 	sub	sp, fp, #4
90011e5c:	e8bd8800 	pop	{fp, pc}

90011e60 <gpt_clear_all_events>:
////////////////////////////////////////////////////////////////////////////////
// Code
////////////////////////////////////////////////////////////////////////////////

static inline void gpt_clear_all_events(void)
{
90011e60:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011e64:	e28db000 	add	fp, sp, #0
90011e68:	e24dd00c 	sub	sp, sp, #12
90011e6c:	e3a03902 	mov	r3, #32768	; 0x8000
90011e70:	e3403209 	movt	r3, #521	; 0x209
90011e74:	e50b3008 	str	r3, [fp, #-8]
90011e78:	e51b3008 	ldr	r3, [fp, #-8]
90011e7c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    HW_GPT_SR_WR(kGPTAllEvents);
90011e80:	e2833008 	add	r3, r3, #8
90011e84:	e1a02003 	mov	r2, r3
90011e88:	e3a0303f 	mov	r3, #63	; 0x3f
90011e8c:	e5823000 	str	r3, [r2]
}
90011e90:	e320f000 	nop	{0}
90011e94:	e28bd000 	add	sp, fp, #0
90011e98:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011e9c:	e12fff1e 	bx	lr

90011ea0 <gpt_get_rollover_event>:

uint32_t gpt_get_rollover_event(void)
{
90011ea0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011ea4:	e28db000 	add	fp, sp, #0
90011ea8:	e24dd00c 	sub	sp, sp, #12
90011eac:	e3a03902 	mov	r3, #32768	; 0x8000
90011eb0:	e3403209 	movt	r3, #521	; 0x209
90011eb4:	e50b3008 	str	r3, [fp, #-8]
90011eb8:	e51b3008 	ldr	r3, [fp, #-8]
90011ebc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    // clear it if found set
    if (HW_GPT_SR.B.ROV) {
90011ec0:	e2833008 	add	r3, r3, #8
90011ec4:	e5933000 	ldr	r3, [r3]
90011ec8:	e7e032d3 	ubfx	r3, r3, #5, #1
90011ecc:	e6ef3073 	uxtb	r3, r3
90011ed0:	e3530000 	cmp	r3, #0
90011ed4:	0a00000a 	beq	90011f04 <gpt_get_rollover_event+0x64>
90011ed8:	e3a03902 	mov	r3, #32768	; 0x8000
90011edc:	e3403209 	movt	r3, #521	; 0x209
90011ee0:	e50b300c 	str	r3, [fp, #-12]
90011ee4:	e51b300c 	ldr	r3, [fp, #-12]
90011ee8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_SR_WR(BM_GPT_SR_ROV);
90011eec:	e2833008 	add	r3, r3, #8
90011ef0:	e1a02003 	mov	r2, r3
90011ef4:	e3a03020 	mov	r3, #32
90011ef8:	e5823000 	str	r3, [r2]
        return kGPTRollover;
90011efc:	e3a03020 	mov	r3, #32
90011f00:	ea000000 	b	90011f08 <gpt_get_rollover_event+0x68>
    }

    // return the read value before the bit was cleared
    return 0;
90011f04:	e3a03000 	mov	r3, #0
}
90011f08:	e1a00003 	mov	r0, r3
90011f0c:	e28bd000 	add	sp, fp, #0
90011f10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90011f14:	e12fff1e 	bx	lr

90011f18 <gpt_get_capture_event>:

uint32_t gpt_get_capture_event(uint8_t flag, uint32_t* capture_val)
{
90011f18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90011f1c:	e28db000 	add	fp, sp, #0
90011f20:	e24dd024 	sub	sp, sp, #36	; 0x24
90011f24:	e1a03000 	mov	r3, r0
90011f28:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
90011f2c:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
    // get the capture status bit
    flag &= kGPTInputCapture1 | kGPTInputCapture2;
90011f30:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
90011f34:	e2033018 	and	r3, r3, #24
90011f38:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
90011f3c:	e3a03902 	mov	r3, #32768	; 0x8000
90011f40:	e3403209 	movt	r3, #521	; 0x209
90011f44:	e50b300c 	str	r3, [fp, #-12]
90011f48:	e51b300c 	ldr	r3, [fp, #-12]
90011f4c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t status_register = HW_GPT_SR_RD() & flag;
90011f50:	e2833008 	add	r3, r3, #8
90011f54:	e5932000 	ldr	r2, [r3]
90011f58:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
90011f5c:	e0033002 	and	r3, r3, r2
90011f60:	e50b3008 	str	r3, [fp, #-8]

    // Read the captured timer value.
    if (capture_val) {
90011f64:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90011f68:	e3530000 	cmp	r3, #0
90011f6c:	0a000018 	beq	90011fd4 <gpt_get_capture_event+0xbc>
        if (status_register == kGPTInputCapture1) {
90011f70:	e51b3008 	ldr	r3, [fp, #-8]
90011f74:	e3530008 	cmp	r3, #8
90011f78:	1a000009 	bne	90011fa4 <gpt_get_capture_event+0x8c>
90011f7c:	e3a03902 	mov	r3, #32768	; 0x8000
90011f80:	e3403209 	movt	r3, #521	; 0x209
90011f84:	e50b3010 	str	r3, [fp, #-16]
90011f88:	e51b3010 	ldr	r3, [fp, #-16]
90011f8c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            *(uint32_t*)capture_val = HW_GPT_ICR1.B.CAPT;
90011f90:	e283301c 	add	r3, r3, #28
90011f94:	e5932000 	ldr	r2, [r3]
90011f98:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90011f9c:	e5832000 	str	r2, [r3]
90011fa0:	ea00000b 	b	90011fd4 <gpt_get_capture_event+0xbc>
        } else if (status_register == kGPTInputCapture2) {
90011fa4:	e51b3008 	ldr	r3, [fp, #-8]
90011fa8:	e3530010 	cmp	r3, #16
90011fac:	1a000008 	bne	90011fd4 <gpt_get_capture_event+0xbc>
90011fb0:	e3a03902 	mov	r3, #32768	; 0x8000
90011fb4:	e3403209 	movt	r3, #521	; 0x209
90011fb8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90011fbc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90011fc0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            *(uint32_t*)capture_val = HW_GPT_ICR2.B.CAPT;
90011fc4:	e2833020 	add	r3, r3, #32
90011fc8:	e5932000 	ldr	r2, [r3]
90011fcc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90011fd0:	e5832000 	str	r2, [r3]
90011fd4:	e3a03902 	mov	r3, #32768	; 0x8000
90011fd8:	e3403209 	movt	r3, #521	; 0x209
90011fdc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90011fe0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90011fe4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        }
    }

    // Clear the flag.
    HW_GPT_SR_WR(status_register);
90011fe8:	e2833008 	add	r3, r3, #8
90011fec:	e1a02003 	mov	r2, r3
90011ff0:	e51b3008 	ldr	r3, [fp, #-8]
90011ff4:	e5823000 	str	r3, [r2]

    // return the read value before the bit was cleared
    return status_register;
90011ff8:	e51b3008 	ldr	r3, [fp, #-8]
}
90011ffc:	e1a00003 	mov	r0, r3
90012000:	e28bd000 	add	sp, fp, #0
90012004:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012008:	e12fff1e 	bx	lr

9001200c <gpt_set_capture_event>:

void gpt_set_capture_event(uint8_t cap_input, uint8_t cap_input_mode)
{
9001200c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012010:	e28db000 	add	fp, sp, #0
90012014:	e24dd014 	sub	sp, sp, #20
90012018:	e1a03000 	mov	r3, r0
9001201c:	e1a02001 	mov	r2, r1
90012020:	e54b300d 	strb	r3, [fp, #-13]
90012024:	e1a03002 	mov	r3, r2
90012028:	e54b300e 	strb	r3, [fp, #-14]
    // set the new input mode
    switch (cap_input) {
9001202c:	e55b300d 	ldrb	r3, [fp, #-13]
90012030:	e3530008 	cmp	r3, #8
90012034:	0a000002 	beq	90012044 <gpt_set_capture_event+0x38>
90012038:	e3530010 	cmp	r3, #16
9001203c:	0a00000d 	beq	90012078 <gpt_set_capture_event+0x6c>

    case kGPTInputCapture2:
        HW_GPT_CR.B.IM2 = cap_input_mode;
        break;
    }
}
90012040:	ea000019 	b	900120ac <gpt_set_capture_event+0xa0>
90012044:	e3a03902 	mov	r3, #32768	; 0x8000
90012048:	e3403209 	movt	r3, #521	; 0x209
9001204c:	e50b3008 	str	r3, [fp, #-8]
90012050:	e51b3008 	ldr	r3, [fp, #-8]
90012054:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_CR.B.IM1 = cap_input_mode;
90012058:	e1a02003 	mov	r2, r3
9001205c:	e55b300e 	ldrb	r3, [fp, #-14]
90012060:	e2033003 	and	r3, r3, #3
90012064:	e6ef1073 	uxtb	r1, r3
90012068:	e5923000 	ldr	r3, [r2]
9001206c:	e7d13811 	bfi	r3, r1, #16, #2
90012070:	e5823000 	str	r3, [r2]
        break;
90012074:	ea00000c 	b	900120ac <gpt_set_capture_event+0xa0>
90012078:	e3a03902 	mov	r3, #32768	; 0x8000
9001207c:	e3403209 	movt	r3, #521	; 0x209
90012080:	e50b300c 	str	r3, [fp, #-12]
90012084:	e51b300c 	ldr	r3, [fp, #-12]
90012088:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_CR.B.IM2 = cap_input_mode;
9001208c:	e1a02003 	mov	r2, r3
90012090:	e55b300e 	ldrb	r3, [fp, #-14]
90012094:	e2033003 	and	r3, r3, #3
90012098:	e6ef1073 	uxtb	r1, r3
9001209c:	e5923000 	ldr	r3, [r2]
900120a0:	e7d33911 	bfi	r3, r1, #18, #2
900120a4:	e5823000 	str	r3, [r2]
        break;
900120a8:	e320f000 	nop	{0}
}
900120ac:	e320f000 	nop	{0}
900120b0:	e28bd000 	add	sp, fp, #0
900120b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900120b8:	e12fff1e 	bx	lr

900120bc <gpt_get_compare_event>:

uint32_t gpt_get_compare_event(uint8_t flag)
{
900120bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900120c0:	e28db000 	add	fp, sp, #0
900120c4:	e24dd01c 	sub	sp, sp, #28
900120c8:	e1a03000 	mov	r3, r0
900120cc:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    // get the active compare flags
    flag &= kGPTOutputCompare1 | kGPTOutputCompare2 | kGPTOutputCompare3;
900120d0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
900120d4:	e2033007 	and	r3, r3, #7
900120d8:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
900120dc:	e3a03902 	mov	r3, #32768	; 0x8000
900120e0:	e3403209 	movt	r3, #521	; 0x209
900120e4:	e50b300c 	str	r3, [fp, #-12]
900120e8:	e51b300c 	ldr	r3, [fp, #-12]
900120ec:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t status_register = HW_GPT_SR_RD() & flag;
900120f0:	e2833008 	add	r3, r3, #8
900120f4:	e5932000 	ldr	r2, [r3]
900120f8:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
900120fc:	e0033002 	and	r3, r3, r2
90012100:	e50b3008 	str	r3, [fp, #-8]

    // clear flags which are active
    if (status_register) {
90012104:	e51b3008 	ldr	r3, [fp, #-8]
90012108:	e3530000 	cmp	r3, #0
9001210c:	0a000008 	beq	90012134 <gpt_get_compare_event+0x78>
90012110:	e3a03902 	mov	r3, #32768	; 0x8000
90012114:	e3403209 	movt	r3, #521	; 0x209
90012118:	e50b3010 	str	r3, [fp, #-16]
9001211c:	e51b3010 	ldr	r3, [fp, #-16]
90012120:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_SR_WR(status_register);
90012124:	e2833008 	add	r3, r3, #8
90012128:	e1a02003 	mov	r2, r3
9001212c:	e51b3008 	ldr	r3, [fp, #-8]
90012130:	e5823000 	str	r3, [r2]
    }

    // return the read value before the flags were cleared
    return status_register;
90012134:	e51b3008 	ldr	r3, [fp, #-8]
}
90012138:	e1a00003 	mov	r0, r3
9001213c:	e28bd000 	add	sp, fp, #0
90012140:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012144:	e12fff1e 	bx	lr

90012148 <gpt_set_compare_event>:

void gpt_set_compare_event(uint8_t cmp_output, uint8_t cmp_output_mode, uint32_t cmp_value)
{
90012148:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
9001214c:	e28db000 	add	fp, sp, #0
90012150:	e24dd034 	sub	sp, sp, #52	; 0x34
90012154:	e1a03000 	mov	r3, r0
90012158:	e50b2034 	str	r2, [fp, #-52]	; 0xffffffcc
9001215c:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
90012160:	e1a03001 	mov	r3, r1
90012164:	e54b302e 	strb	r3, [fp, #-46]	; 0xffffffd2
    // set the value to compare with
    switch (cmp_output) {
90012168:	e55b302d 	ldrb	r3, [fp, #-45]	; 0xffffffd3
9001216c:	e3530002 	cmp	r3, #2
90012170:	0a000020 	beq	900121f8 <gpt_set_compare_event+0xb0>
90012174:	e3530004 	cmp	r3, #4
90012178:	0a00003a 	beq	90012268 <gpt_set_compare_event+0x120>
9001217c:	e3530001 	cmp	r3, #1
90012180:	0a000000 	beq	90012188 <gpt_set_compare_event+0x40>
    case kGPTOutputCompare3:
        BW_GPT_CR_OM3(cmp_output_mode);
        HW_GPT_OCR3_WR(cmp_value);
        break;
    }
}
90012184:	ea000053 	b	900122d8 <gpt_set_compare_event+0x190>
90012188:	e3a03902 	mov	r3, #32768	; 0x8000
9001218c:	e3403209 	movt	r3, #521	; 0x209
90012190:	e50b3010 	str	r3, [fp, #-16]
90012194:	e51b3010 	ldr	r3, [fp, #-16]
90012198:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        BW_GPT_CR_OM1(cmp_output_mode);
9001219c:	e1a01003 	mov	r1, r3
900121a0:	e3a03902 	mov	r3, #32768	; 0x8000
900121a4:	e3403209 	movt	r3, #521	; 0x209
900121a8:	e50b300c 	str	r3, [fp, #-12]
900121ac:	e51b300c 	ldr	r3, [fp, #-12]
900121b0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900121b4:	e5933000 	ldr	r3, [r3]
900121b8:	e3c32607 	bic	r2, r3, #7340032	; 0x700000
900121bc:	e55b302e 	ldrb	r3, [fp, #-46]	; 0xffffffd2
900121c0:	e1a03a03 	lsl	r3, r3, #20
900121c4:	e2033607 	and	r3, r3, #7340032	; 0x700000
900121c8:	e1823003 	orr	r3, r2, r3
900121cc:	e5813000 	str	r3, [r1]
900121d0:	e3a03902 	mov	r3, #32768	; 0x8000
900121d4:	e3403209 	movt	r3, #521	; 0x209
900121d8:	e50b3008 	str	r3, [fp, #-8]
900121dc:	e51b3008 	ldr	r3, [fp, #-8]
900121e0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_OCR1_WR(cmp_value);
900121e4:	e2833010 	add	r3, r3, #16
900121e8:	e1a02003 	mov	r2, r3
900121ec:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
900121f0:	e5823000 	str	r3, [r2]
        break;
900121f4:	ea000037 	b	900122d8 <gpt_set_compare_event+0x190>
900121f8:	e3a03902 	mov	r3, #32768	; 0x8000
900121fc:	e3403209 	movt	r3, #521	; 0x209
90012200:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90012204:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90012208:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        BW_GPT_CR_OM2(cmp_output_mode);
9001220c:	e1a01003 	mov	r1, r3
90012210:	e3a03902 	mov	r3, #32768	; 0x8000
90012214:	e3403209 	movt	r3, #521	; 0x209
90012218:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001221c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012220:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90012224:	e5933000 	ldr	r3, [r3]
90012228:	e3c3250e 	bic	r2, r3, #58720256	; 0x3800000
9001222c:	e55b302e 	ldrb	r3, [fp, #-46]	; 0xffffffd2
90012230:	e1a03b83 	lsl	r3, r3, #23
90012234:	e203350e 	and	r3, r3, #58720256	; 0x3800000
90012238:	e1823003 	orr	r3, r2, r3
9001223c:	e5813000 	str	r3, [r1]
90012240:	e3a03902 	mov	r3, #32768	; 0x8000
90012244:	e3403209 	movt	r3, #521	; 0x209
90012248:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001224c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012250:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_OCR2_WR(cmp_value);
90012254:	e2833014 	add	r3, r3, #20
90012258:	e1a02003 	mov	r2, r3
9001225c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
90012260:	e5823000 	str	r3, [r2]
        break;
90012264:	ea00001b 	b	900122d8 <gpt_set_compare_event+0x190>
90012268:	e3a03902 	mov	r3, #32768	; 0x8000
9001226c:	e3403209 	movt	r3, #521	; 0x209
90012270:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
90012274:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90012278:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        BW_GPT_CR_OM3(cmp_output_mode);
9001227c:	e1a01003 	mov	r1, r3
90012280:	e3a03902 	mov	r3, #32768	; 0x8000
90012284:	e3403209 	movt	r3, #521	; 0x209
90012288:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001228c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90012290:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90012294:	e5933000 	ldr	r3, [r3]
90012298:	e3c32307 	bic	r2, r3, #469762048	; 0x1c000000
9001229c:	e55b302e 	ldrb	r3, [fp, #-46]	; 0xffffffd2
900122a0:	e1a03d03 	lsl	r3, r3, #26
900122a4:	e2033307 	and	r3, r3, #469762048	; 0x1c000000
900122a8:	e1823003 	orr	r3, r2, r3
900122ac:	e5813000 	str	r3, [r1]
900122b0:	e3a03902 	mov	r3, #32768	; 0x8000
900122b4:	e3403209 	movt	r3, #521	; 0x209
900122b8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
900122bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900122c0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        HW_GPT_OCR3_WR(cmp_value);
900122c4:	e2833018 	add	r3, r3, #24
900122c8:	e1a02003 	mov	r2, r3
900122cc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
900122d0:	e5823000 	str	r3, [r2]
        break;
900122d4:	e320f000 	nop	{0}
}
900122d8:	e320f000 	nop	{0}
900122dc:	e28bd000 	add	sp, fp, #0
900122e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900122e4:	e12fff1e 	bx	lr

900122e8 <gpt_counter_disable>:

void gpt_counter_disable(void)
{
900122e8:	e92d4800 	push	{fp, lr}
900122ec:	e28db004 	add	fp, sp, #4
900122f0:	e24dd008 	sub	sp, sp, #8
900122f4:	e3a03902 	mov	r3, #32768	; 0x8000
900122f8:	e3403209 	movt	r3, #521	; 0x209
900122fc:	e50b300c 	str	r3, [fp, #-12]
90012300:	e51b300c 	ldr	r3, [fp, #-12]
90012304:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    // disable the counter
    HW_GPT_CR.B.EN = 0;
90012308:	e1a02003 	mov	r2, r3
9001230c:	e5923000 	ldr	r3, [r2]
90012310:	e7c0301f 	bfc	r3, #0, #1
90012314:	e5823000 	str	r3, [r2]
90012318:	e3a03902 	mov	r3, #32768	; 0x8000
9001231c:	e3403209 	movt	r3, #521	; 0x209
90012320:	e50b3008 	str	r3, [fp, #-8]
90012324:	e51b3008 	ldr	r3, [fp, #-8]
90012328:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // ensure to leave the counter in a proper state by disabling the interrupt sources
    HW_GPT_IR_WR(0);
9001232c:	e283300c 	add	r3, r3, #12
90012330:	e1a02003 	mov	r2, r3
90012334:	e3a03000 	mov	r3, #0
90012338:	e5823000 	str	r3, [r2]

    // and by clearing possible remaining events
    gpt_clear_all_events();
9001233c:	ebfffec7 	bl	90011e60 <gpt_clear_all_events>
}
90012340:	e320f000 	nop	{0}
90012344:	e24bd004 	sub	sp, fp, #4
90012348:	e8bd8800 	pop	{fp, pc}

9001234c <gpt_counter_enable>:

void gpt_counter_enable(uint32_t irq_mode)
{
9001234c:	e92d4800 	push	{fp, lr}
90012350:	e28db004 	add	fp, sp, #4
90012354:	e24dd010 	sub	sp, sp, #16
90012358:	e50b0010 	str	r0, [fp, #-16]
    // ensure to start the counter in a proper state by clearing possible remaining events
    gpt_clear_all_events();
9001235c:	ebfffebf 	bl	90011e60 <gpt_clear_all_events>
90012360:	e3a03902 	mov	r3, #32768	; 0x8000
90012364:	e3403209 	movt	r3, #521	; 0x209
90012368:	e50b300c 	str	r3, [fp, #-12]
9001236c:	e51b300c 	ldr	r3, [fp, #-12]
90012370:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // enable the interrupts or clear the register for polling
    HW_GPT_IR_WR(irq_mode & kGPTAllEvents);
90012374:	e283300c 	add	r3, r3, #12
90012378:	e1a02003 	mov	r2, r3
9001237c:	e51b3010 	ldr	r3, [fp, #-16]
90012380:	e203303f 	and	r3, r3, #63	; 0x3f
90012384:	e5823000 	str	r3, [r2]
90012388:	e3a03902 	mov	r3, #32768	; 0x8000
9001238c:	e3403209 	movt	r3, #521	; 0x209
90012390:	e50b3008 	str	r3, [fp, #-8]
90012394:	e51b3008 	ldr	r3, [fp, #-8]
90012398:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // finally, enable the counter
    HW_GPT_CR.B.EN = 1;
9001239c:	e1a02003 	mov	r2, r3
900123a0:	e5923000 	ldr	r3, [r2]
900123a4:	e3833001 	orr	r3, r3, #1
900123a8:	e5823000 	str	r3, [r2]
}
900123ac:	e320f000 	nop	{0}
900123b0:	e24bd004 	sub	sp, fp, #4
900123b4:	e8bd8800 	pop	{fp, pc}

900123b8 <gpt_init>:

void gpt_init(uint32_t clock_src, uint32_t prescaler, uint32_t counter_mode, uint32_t low_power_mode)
{
900123b8:	e92d4800 	push	{fp, lr}
900123bc:	e28db004 	add	fp, sp, #4
900123c0:	e24dd028 	sub	sp, sp, #40	; 0x28
900123c4:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
900123c8:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
900123cc:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
900123d0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    uint32_t control_reg_tmp = 0;
900123d4:	e3a03000 	mov	r3, #0
900123d8:	e50b3008 	str	r3, [fp, #-8]

    // enable the source clocks to the GPT port
    clock_gating_config(GPT_BASE_ADDR, CLOCK_ON);
900123dc:	e3a01003 	mov	r1, #3
900123e0:	e3a00902 	mov	r0, #32768	; 0x8000
900123e4:	e3400209 	movt	r0, #521	; 0x209
900123e8:	ebfffd9f 	bl	90011a6c <clock_gating_config>
900123ec:	e3a03902 	mov	r3, #32768	; 0x8000
900123f0:	e3403209 	movt	r3, #521	; 0x209
900123f4:	e50b300c 	str	r3, [fp, #-12]
900123f8:	e51b300c 	ldr	r3, [fp, #-12]
900123fc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // start with a known state by disabling and reseting the module
    HW_GPT_CR_WR(BM_GPT_CR_SWR);
90012400:	e1a02003 	mov	r2, r3
90012404:	e3a03902 	mov	r3, #32768	; 0x8000
90012408:	e5823000 	str	r3, [r2]

    // wait for the reset to complete
    while (HW_GPT_CR.B.SWR != 0)
9001240c:	e320f000 	nop	{0}
90012410:	e3a03902 	mov	r3, #32768	; 0x8000
90012414:	e3403209 	movt	r3, #521	; 0x209
90012418:	e50b3010 	str	r3, [fp, #-16]
9001241c:	e51b3010 	ldr	r3, [fp, #-16]
90012420:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90012424:	e5933000 	ldr	r3, [r3]
90012428:	e7e037d3 	ubfx	r3, r3, #15, #1
9001242c:	e6ef3073 	uxtb	r3, r3
90012430:	e3530000 	cmp	r3, #0
90012434:	1afffff5 	bne	90012410 <gpt_init+0x58>
        ;

    // set the reference source clock for the counter
    if (clock_src == CLKSRC_CKIL) {
90012438:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001243c:	e3530003 	cmp	r3, #3
90012440:	1a000002 	bne	90012450 <gpt_init+0x98>
        // CKIL source is 0x4 for GPT but 0x3 for EPIT
        clock_src++;
90012444:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012448:	e2833001 	add	r3, r3, #1
9001244c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    }
    control_reg_tmp |= BF_GPT_CR_CLKSRC(clock_src);
90012450:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012454:	e1a03303 	lsl	r3, r3, #6
90012458:	e2033d07 	and	r3, r3, #448	; 0x1c0
9001245c:	e51b2008 	ldr	r2, [fp, #-8]
90012460:	e1823003 	orr	r3, r2, r3
90012464:	e50b3008 	str	r3, [fp, #-8]
90012468:	e3a03902 	mov	r3, #32768	; 0x8000
9001246c:	e3403209 	movt	r3, #521	; 0x209
90012470:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90012474:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012478:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // the prescaler can be changed at any time, and
    // this affects the output clock immediately
    HW_GPT_PR_WR(BF_GPT_PR_PRESCALER(prescaler - 1));
9001247c:	e2833004 	add	r3, r3, #4
90012480:	e1a02003 	mov	r2, r3
90012484:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90012488:	e2433001 	sub	r3, r3, #1
9001248c:	e7eb3053 	ubfx	r3, r3, #0, #12
90012490:	e5823000 	str	r3, [r2]

    // set the counter mode
    control_reg_tmp |= BF_GPT_CR_FRR(counter_mode);
90012494:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90012498:	e1a03483 	lsl	r3, r3, #9
9001249c:	e2033c02 	and	r3, r3, #512	; 0x200
900124a0:	e51b2008 	ldr	r2, [fp, #-8]
900124a4:	e1823003 	orr	r3, r2, r3
900124a8:	e50b3008 	str	r3, [fp, #-8]

    // set behavior for low power mode
    if (low_power_mode & WAIT_MODE_EN) {
900124ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
900124b0:	e2033001 	and	r3, r3, #1
900124b4:	e3530000 	cmp	r3, #0
900124b8:	0a000002 	beq	900124c8 <gpt_init+0x110>
        control_reg_tmp |= BM_GPT_CR_WAITEN;
900124bc:	e51b3008 	ldr	r3, [fp, #-8]
900124c0:	e3833008 	orr	r3, r3, #8
900124c4:	e50b3008 	str	r3, [fp, #-8]
    }
    if (low_power_mode & STOP_MODE_EN) {
900124c8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
900124cc:	e2033002 	and	r3, r3, #2
900124d0:	e3530000 	cmp	r3, #0
900124d4:	0a000002 	beq	900124e4 <gpt_init+0x12c>
        control_reg_tmp |= BM_GPT_CR_STOPEN;
900124d8:	e51b3008 	ldr	r3, [fp, #-8]
900124dc:	e3833020 	orr	r3, r3, #32
900124e0:	e50b3008 	str	r3, [fp, #-8]
    }

    // specify from where the counter starts to count when enabled
    // this code makes it start from 0
    control_reg_tmp |= BM_GPT_CR_ENMOD;
900124e4:	e51b3008 	ldr	r3, [fp, #-8]
900124e8:	e3833002 	orr	r3, r3, #2
900124ec:	e50b3008 	str	r3, [fp, #-8]
900124f0:	e3a03902 	mov	r3, #32768	; 0x8000
900124f4:	e3403209 	movt	r3, #521	; 0x209
900124f8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
900124fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012500:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    // finally write the control register
    HW_GPT_CR_WR(control_reg_tmp);
90012504:	e1a02003 	mov	r2, r3
90012508:	e51b3008 	ldr	r3, [fp, #-8]
9001250c:	e5823000 	str	r3, [r2]
}
90012510:	e320f000 	nop	{0}
90012514:	e24bd004 	sub	sp, fp, #4
90012518:	e8bd8800 	pop	{fp, pc}

9001251c <load_pgdir_critical>:

// extern struct MmuCommonDone mmu_common_done;
static struct MmuDriverRightGroup right_group;

void load_pgdir_critical(uintptr_t pgdir_paddr, struct TraceTag* intr_driver_tag)
{
9001251c:	e92d4800 	push	{fp, lr}
90012520:	e28db004 	add	fp, sp, #4
90012524:	e24dd018 	sub	sp, sp, #24
90012528:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
9001252c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4

    /* get cache driver */
    struct ICacheDone* p_icache_done = AchieveResource(&right_group.icache_driver_tag);
90012530:	e30a081c 	movw	r0, #43036	; 0xa81c
90012534:	e3490015 	movt	r0, #36885	; 0x9015
90012538:	eb0016e7 	bl	900180dc <AchieveResource>
9001253c:	e50b0008 	str	r0, [fp, #-8]
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
90012540:	e59f005c 	ldr	r0, [pc, #92]	; 900125a4 <load_pgdir_critical+0x88>
90012544:	eb0016e4 	bl	900180dc <AchieveResource>
90012548:	e50b000c 	str	r0, [fp, #-12]

    /* get intr driver */
    struct XiziTrapDriver* p_intr_driver = AchieveResource(intr_driver_tag);
9001254c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
90012550:	eb0016e1 	bl	900180dc <AchieveResource>
90012554:	e50b0010 	str	r0, [fp, #-16]

    p_intr_driver->cpu_irq_disable();
90012558:	e51b3010 	ldr	r3, [fp, #-16]
9001255c:	e5933298 	ldr	r3, [r3, #664]	; 0x298
90012560:	e12fff33 	blx	r3
    TTBR0_W((uint32_t)pgdir_paddr);
90012564:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012568:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}
    CLEARTLB(0);
9001256c:	e3a03000 	mov	r3, #0
90012570:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}
    p_icache_done->invalidateall();
90012574:	e51b3008 	ldr	r3, [fp, #-8]
90012578:	e593300c 	ldr	r3, [r3, #12]
9001257c:	e12fff33 	blx	r3
    p_dcache_done->flushall();
90012580:	e51b300c 	ldr	r3, [fp, #-12]
90012584:	e5933018 	ldr	r3, [r3, #24]
90012588:	e12fff33 	blx	r3
    p_intr_driver->cpu_irq_enable();
9001258c:	e51b3010 	ldr	r3, [fp, #-16]
90012590:	e5933294 	ldr	r3, [r3, #660]	; 0x294
90012594:	e12fff33 	blx	r3
}
90012598:	e320f000 	nop	{0}
9001259c:	e24bd004 	sub	sp, fp, #4
900125a0:	e8bd8800 	pop	{fp, pc}
900125a4:	9015a824 	.word	0x9015a824

900125a8 <load_pgdir>:

void load_pgdir(uintptr_t pgdir_paddr)
{
900125a8:	e92d4800 	push	{fp, lr}
900125ac:	e28db004 	add	fp, sp, #4
900125b0:	e24dd010 	sub	sp, sp, #16
900125b4:	e50b0010 	str	r0, [fp, #-16]
    /* get cache driver */
    struct ICacheDone* p_icache_done = AchieveResource(&right_group.icache_driver_tag);
900125b8:	e30a081c 	movw	r0, #43036	; 0xa81c
900125bc:	e3490015 	movt	r0, #36885	; 0x9015
900125c0:	eb0016c5 	bl	900180dc <AchieveResource>
900125c4:	e50b0008 	str	r0, [fp, #-8]
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
900125c8:	e59f0038 	ldr	r0, [pc, #56]	; 90012608 <load_pgdir+0x60>
900125cc:	eb0016c2 	bl	900180dc <AchieveResource>
900125d0:	e50b000c 	str	r0, [fp, #-12]

    TTBR0_W((uint32_t)pgdir_paddr);
900125d4:	e51b3010 	ldr	r3, [fp, #-16]
900125d8:	ee023f10 	mcr	15, 0, r3, cr2, cr0, {0}
    CLEARTLB(0);
900125dc:	e3a03000 	mov	r3, #0
900125e0:	ee083f17 	mcr	15, 0, r3, cr8, cr7, {0}
    p_icache_done->invalidateall();
900125e4:	e51b3008 	ldr	r3, [fp, #-8]
900125e8:	e593300c 	ldr	r3, [r3, #12]
900125ec:	e12fff33 	blx	r3
    p_dcache_done->flushall();
900125f0:	e51b300c 	ldr	r3, [fp, #-12]
900125f4:	e5933018 	ldr	r3, [r3, #24]
900125f8:	e12fff33 	blx	r3
}
900125fc:	e320f000 	nop	{0}
90012600:	e24bd004 	sub	sp, fp, #4
90012604:	e8bd8800 	pop	{fp, pc}
90012608:	9015a824 	.word	0x9015a824

9001260c <tlb_flush_range>:
{
    __asm__ volatile("mcr p15, 0, %0, c8, c7, 1" ::"r"(va) :);
}

static void tlb_flush_range(uintptr_t vstart, int len)
{
9001260c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012610:	e28db000 	add	fp, sp, #0
90012614:	e24dd01c 	sub	sp, sp, #28
90012618:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
9001261c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    uintptr_t vaddr = vstart;
90012620:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012624:	e50b3008 	str	r3, [fp, #-8]
    uintptr_t vend = vaddr + len;
90012628:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001262c:	e51b2008 	ldr	r2, [fp, #-8]
90012630:	e0823003 	add	r3, r2, r3
90012634:	e50b300c 	str	r3, [fp, #-12]
    for (; vaddr <= vend; vaddr += PAGE_SIZE) {
90012638:	ea000006 	b	90012658 <tlb_flush_range+0x4c>
9001263c:	e51b3008 	ldr	r3, [fp, #-8]
90012640:	e50b3010 	str	r3, [fp, #-16]
    __asm__ volatile("mcr p15, 0, %0, c8, c7, 1" ::"r"(va) :);
90012644:	e51b3010 	ldr	r3, [fp, #-16]
90012648:	ee083f37 	mcr	15, 0, r3, cr8, cr7, {1}
    for (; vaddr <= vend; vaddr += PAGE_SIZE) {
9001264c:	e51b3008 	ldr	r3, [fp, #-8]
90012650:	e2833a01 	add	r3, r3, #4096	; 0x1000
90012654:	e50b3008 	str	r3, [fp, #-8]
90012658:	e51b2008 	ldr	r2, [fp, #-8]
9001265c:	e51b300c 	ldr	r3, [fp, #-12]
90012660:	e1520003 	cmp	r2, r3
90012664:	9afffff4 	bls	9001263c <tlb_flush_range+0x30>
        _tlb_flush(vaddr);
    }
}
90012668:	e320f000 	nop	{0}
9001266c:	e28bd000 	add	sp, fp, #0
90012670:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012674:	e12fff1e 	bx	lr

90012678 <hardkernel_mmu_init>:
    .LoadPgdir = load_pgdir,
    .TlbFlush = tlb_flush_range,
};

struct MmuCommonDone* hardkernel_mmu_init(struct TraceTag* hardkernel_tag, char* icache_name, char* dcache_name)
{
90012678:	e92d4800 	push	{fp, lr}
9001267c:	e28db004 	add	fp, sp, #4
90012680:	e24dd010 	sub	sp, sp, #16
90012684:	e50b0008 	str	r0, [fp, #-8]
90012688:	e50b100c 	str	r1, [fp, #-12]
9001268c:	e50b2010 	str	r2, [fp, #-16]
    /* init right group for mmu driver */
    AchieveResourceTag(&right_group.icache_driver_tag, hardkernel_tag, icache_name);
90012690:	e51b200c 	ldr	r2, [fp, #-12]
90012694:	e51b1008 	ldr	r1, [fp, #-8]
90012698:	e30a081c 	movw	r0, #43036	; 0xa81c
9001269c:	e3490015 	movt	r0, #36885	; 0x9015
900126a0:	eb00167a 	bl	90018090 <AchieveResourceTag>
    AchieveResourceTag(&right_group.dcache_driver_tag, hardkernel_tag, dcache_name);
900126a4:	e51b2010 	ldr	r2, [fp, #-16]
900126a8:	e51b1008 	ldr	r1, [fp, #-8]
900126ac:	e59f0014 	ldr	r0, [pc, #20]	; 900126c8 <hardkernel_mmu_init+0x50>
900126b0:	eb001676 	bl	90018090 <AchieveResourceTag>

    return &mmu_common_done;
900126b4:	e3033038 	movw	r3, #12344	; 0x3038
900126b8:	e3493002 	movt	r3, #36866	; 0x9002
900126bc:	e1a00003 	mov	r0, r3
900126c0:	e24bd004 	sub	sp, fp, #4
900126c4:	e8bd8800 	pop	{fp, pc}
900126c8:	9015a824 	.word	0x9015a824

900126cc <GetDevPteAttr>:
*************************************************/
#include "mmu.h"
#include "mmu_common.h"

void GetDevPteAttr(uintptr_t* attr)
{
900126cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900126d0:	e28db000 	add	fp, sp, #0
900126d4:	e24dd00c 	sub	sp, sp, #12
900126d8:	e50b0008 	str	r0, [fp, #-8]
    static char init = 0;
    static PageTblEntry dev_pte_attr;
    if (init == 0) {
900126dc:	e30a3834 	movw	r3, #43060	; 0xa834
900126e0:	e3493015 	movt	r3, #36885	; 0x9015
900126e4:	e5d33000 	ldrb	r3, [r3]
900126e8:	e3530000 	cmp	r3, #0
900126ec:	1a000013 	bne	90012740 <GetDevPteAttr+0x74>
        init = 1;
900126f0:	e30a3834 	movw	r3, #43060	; 0xa834
900126f4:	e3493015 	movt	r3, #36885	; 0x9015
900126f8:	e3a02001 	mov	r2, #1
900126fc:	e5c32000 	strb	r2, [r3]

        dev_pte_attr.entry = 0;
90012700:	e30a3838 	movw	r3, #43064	; 0xa838
90012704:	e3493015 	movt	r3, #36885	; 0x9015
90012708:	e3a02000 	mov	r2, #0
9001270c:	e5832000 	str	r2, [r3]
        dev_pte_attr.desc_type = PAGE_4K;
90012710:	e30a3838 	movw	r3, #43064	; 0xa838
90012714:	e3493015 	movt	r3, #36885	; 0x9015
90012718:	e5d32000 	ldrb	r2, [r3]
9001271c:	e3a01002 	mov	r1, #2
90012720:	e7c12011 	bfi	r2, r1, #0, #2
90012724:	e5c32000 	strb	r2, [r3]
        dev_pte_attr.AP1_0 = AccessPermission_KernelOnly;
90012728:	e30a3838 	movw	r3, #43064	; 0xa838
9001272c:	e3493015 	movt	r3, #36885	; 0x9015
90012730:	e5d32000 	ldrb	r2, [r3]
90012734:	e3a01001 	mov	r1, #1
90012738:	e7c52211 	bfi	r2, r1, #4, #2
9001273c:	e5c32000 	strb	r2, [r3]
    }
    *attr = dev_pte_attr.entry;
90012740:	e30a3838 	movw	r3, #43064	; 0xa838
90012744:	e3493015 	movt	r3, #36885	; 0x9015
90012748:	e5932000 	ldr	r2, [r3]
9001274c:	e51b3008 	ldr	r3, [fp, #-8]
90012750:	e5832000 	str	r2, [r3]
}
90012754:	e320f000 	nop	{0}
90012758:	e28bd000 	add	sp, fp, #0
9001275c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012760:	e12fff1e 	bx	lr

90012764 <GetUsrPteAttr>:

void GetUsrPteAttr(uintptr_t* attr)
{
90012764:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012768:	e28db000 	add	fp, sp, #0
9001276c:	e24dd00c 	sub	sp, sp, #12
90012770:	e50b0008 	str	r0, [fp, #-8]
    static char init = 0;
    static PageTblEntry usr_pte_attr;
    if (init == 0) {
90012774:	e30a383c 	movw	r3, #43068	; 0xa83c
90012778:	e3493015 	movt	r3, #36885	; 0x9015
9001277c:	e5d33000 	ldrb	r3, [r3]
90012780:	e3530000 	cmp	r3, #0
90012784:	1a00001c 	bne	900127fc <GetUsrPteAttr+0x98>
        init = 1;
90012788:	e30a383c 	movw	r3, #43068	; 0xa83c
9001278c:	e3493015 	movt	r3, #36885	; 0x9015
90012790:	e3a02001 	mov	r2, #1
90012794:	e5c32000 	strb	r2, [r3]

        usr_pte_attr.entry = 0;
90012798:	e30a3840 	movw	r3, #43072	; 0xa840
9001279c:	e3493015 	movt	r3, #36885	; 0x9015
900127a0:	e3a02000 	mov	r2, #0
900127a4:	e5832000 	str	r2, [r3]
        usr_pte_attr.desc_type = PAGE_4K;
900127a8:	e30a3840 	movw	r3, #43072	; 0xa840
900127ac:	e3493015 	movt	r3, #36885	; 0x9015
900127b0:	e5d32000 	ldrb	r2, [r3]
900127b4:	e3a01002 	mov	r1, #2
900127b8:	e7c12011 	bfi	r2, r1, #0, #2
900127bc:	e5c32000 	strb	r2, [r3]
        usr_pte_attr.B = 1;
900127c0:	e30a3840 	movw	r3, #43072	; 0xa840
900127c4:	e3493015 	movt	r3, #36885	; 0x9015
900127c8:	e5d32000 	ldrb	r2, [r3]
900127cc:	e3822004 	orr	r2, r2, #4
900127d0:	e5c32000 	strb	r2, [r3]
        usr_pte_attr.C = 1;
900127d4:	e30a3840 	movw	r3, #43072	; 0xa840
900127d8:	e3493015 	movt	r3, #36885	; 0x9015
900127dc:	e5d32000 	ldrb	r2, [r3]
900127e0:	e3822008 	orr	r2, r2, #8
900127e4:	e5c32000 	strb	r2, [r3]
        usr_pte_attr.AP1_0 = AccessPermission_KernelUser;
900127e8:	e30a3840 	movw	r3, #43072	; 0xa840
900127ec:	e3493015 	movt	r3, #36885	; 0x9015
900127f0:	e5d32000 	ldrb	r2, [r3]
900127f4:	e3822030 	orr	r2, r2, #48	; 0x30
900127f8:	e5c32000 	strb	r2, [r3]
    }
    *attr = usr_pte_attr.entry;
900127fc:	e30a3840 	movw	r3, #43072	; 0xa840
90012800:	e3493015 	movt	r3, #36885	; 0x9015
90012804:	e5932000 	ldr	r2, [r3]
90012808:	e51b3008 	ldr	r3, [fp, #-8]
9001280c:	e5832000 	str	r2, [r3]
}
90012810:	e320f000 	nop	{0}
90012814:	e28bd000 	add	sp, fp, #0
90012818:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001281c:	e12fff1e 	bx	lr

90012820 <GetUsrDevPteAttr>:

void GetUsrDevPteAttr(uintptr_t* attr)
{
90012820:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012824:	e28db000 	add	fp, sp, #0
90012828:	e24dd00c 	sub	sp, sp, #12
9001282c:	e50b0008 	str	r0, [fp, #-8]
    static char init = 0;
    static PageTblEntry usr_pte_attr;
    if (init == 0) {
90012830:	e30a3844 	movw	r3, #43076	; 0xa844
90012834:	e3493015 	movt	r3, #36885	; 0x9015
90012838:	e5d33000 	ldrb	r3, [r3]
9001283c:	e3530000 	cmp	r3, #0
90012840:	1a000012 	bne	90012890 <GetUsrDevPteAttr+0x70>
        init = 1;
90012844:	e30a3844 	movw	r3, #43076	; 0xa844
90012848:	e3493015 	movt	r3, #36885	; 0x9015
9001284c:	e3a02001 	mov	r2, #1
90012850:	e5c32000 	strb	r2, [r3]

        usr_pte_attr.entry = 0;
90012854:	e30a3848 	movw	r3, #43080	; 0xa848
90012858:	e3493015 	movt	r3, #36885	; 0x9015
9001285c:	e3a02000 	mov	r2, #0
90012860:	e5832000 	str	r2, [r3]
        usr_pte_attr.desc_type = PAGE_4K;
90012864:	e30a3848 	movw	r3, #43080	; 0xa848
90012868:	e3493015 	movt	r3, #36885	; 0x9015
9001286c:	e5d32000 	ldrb	r2, [r3]
90012870:	e3a01002 	mov	r1, #2
90012874:	e7c12011 	bfi	r2, r1, #0, #2
90012878:	e5c32000 	strb	r2, [r3]
        usr_pte_attr.AP1_0 = AccessPermission_KernelUser;
9001287c:	e30a3848 	movw	r3, #43080	; 0xa848
90012880:	e3493015 	movt	r3, #36885	; 0x9015
90012884:	e5d32000 	ldrb	r2, [r3]
90012888:	e3822030 	orr	r2, r2, #48	; 0x30
9001288c:	e5c32000 	strb	r2, [r3]
    }
    *attr = usr_pte_attr.entry;
90012890:	e30a3848 	movw	r3, #43080	; 0xa848
90012894:	e3493015 	movt	r3, #36885	; 0x9015
90012898:	e5932000 	ldr	r2, [r3]
9001289c:	e51b3008 	ldr	r3, [fp, #-8]
900128a0:	e5832000 	str	r2, [r3]
}
900128a4:	e320f000 	nop	{0}
900128a8:	e28bd000 	add	sp, fp, #0
900128ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900128b0:	e12fff1e 	bx	lr

900128b4 <GetKernPteAttr>:

void GetKernPteAttr(uintptr_t* attr)
{
900128b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900128b8:	e28db000 	add	fp, sp, #0
900128bc:	e24dd00c 	sub	sp, sp, #12
900128c0:	e50b0008 	str	r0, [fp, #-8]
    static char init = 0;
    static PageTblEntry kern_pte_attr;
    if (init == 0) {
900128c4:	e30a384c 	movw	r3, #43084	; 0xa84c
900128c8:	e3493015 	movt	r3, #36885	; 0x9015
900128cc:	e5d33000 	ldrb	r3, [r3]
900128d0:	e3530000 	cmp	r3, #0
900128d4:	1a00001d 	bne	90012950 <GetKernPteAttr+0x9c>
        init = 1;
900128d8:	e30a384c 	movw	r3, #43084	; 0xa84c
900128dc:	e3493015 	movt	r3, #36885	; 0x9015
900128e0:	e3a02001 	mov	r2, #1
900128e4:	e5c32000 	strb	r2, [r3]

        kern_pte_attr.entry = 0;
900128e8:	e30a3850 	movw	r3, #43088	; 0xa850
900128ec:	e3493015 	movt	r3, #36885	; 0x9015
900128f0:	e3a02000 	mov	r2, #0
900128f4:	e5832000 	str	r2, [r3]
        kern_pte_attr.desc_type = PAGE_4K;
900128f8:	e30a3850 	movw	r3, #43088	; 0xa850
900128fc:	e3493015 	movt	r3, #36885	; 0x9015
90012900:	e5d32000 	ldrb	r2, [r3]
90012904:	e3a01002 	mov	r1, #2
90012908:	e7c12011 	bfi	r2, r1, #0, #2
9001290c:	e5c32000 	strb	r2, [r3]
        kern_pte_attr.B = 1;
90012910:	e30a3850 	movw	r3, #43088	; 0xa850
90012914:	e3493015 	movt	r3, #36885	; 0x9015
90012918:	e5d32000 	ldrb	r2, [r3]
9001291c:	e3822004 	orr	r2, r2, #4
90012920:	e5c32000 	strb	r2, [r3]
        kern_pte_attr.C = 1;
90012924:	e30a3850 	movw	r3, #43088	; 0xa850
90012928:	e3493015 	movt	r3, #36885	; 0x9015
9001292c:	e5d32000 	ldrb	r2, [r3]
90012930:	e3822008 	orr	r2, r2, #8
90012934:	e5c32000 	strb	r2, [r3]
        kern_pte_attr.AP1_0 = AccessPermission_KernelOnly;
90012938:	e30a3850 	movw	r3, #43088	; 0xa850
9001293c:	e3493015 	movt	r3, #36885	; 0x9015
90012940:	e5d32000 	ldrb	r2, [r3]
90012944:	e3a01001 	mov	r1, #1
90012948:	e7c52211 	bfi	r2, r1, #4, #2
9001294c:	e5c32000 	strb	r2, [r3]
    }
    *attr = kern_pte_attr.entry;
90012950:	e30a3850 	movw	r3, #43088	; 0xa850
90012954:	e3493015 	movt	r3, #36885	; 0x9015
90012958:	e5932000 	ldr	r2, [r3]
9001295c:	e51b3008 	ldr	r3, [fp, #-8]
90012960:	e5832000 	str	r2, [r3]
}
90012964:	e320f000 	nop	{0}
90012968:	e28bd000 	add	sp, fp, #0
9001296c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012970:	e12fff1e 	bx	lr

90012974 <GetPdeAttr>:

void GetPdeAttr(uintptr_t* attr)
{
90012974:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012978:	e28db000 	add	fp, sp, #0
9001297c:	e24dd00c 	sub	sp, sp, #12
90012980:	e50b0008 	str	r0, [fp, #-8]
    *attr = PAGE_DIR_COARSE;
90012984:	e51b3008 	ldr	r3, [fp, #-8]
90012988:	e3a02001 	mov	r2, #1
9001298c:	e5832000 	str	r2, [r3]
90012990:	e320f000 	nop	{0}
90012994:	e28bd000 	add	sp, fp, #0
90012998:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001299c:	e12fff1e 	bx	lr

900129a0 <gic_get_gicd>:
#include "gicv2_registers.h"

static inline gicd_t* gic_get_gicd(void);

static inline gicd_t* gic_get_gicd(void)
{
900129a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900129a4:	e28db000 	add	fp, sp, #0
900129a8:	e24dd00c 	sub	sp, sp, #12
900129ac:	e3a0360a 	mov	r3, #10485760	; 0xa00000
900129b0:	e50b300c 	str	r3, [fp, #-12]
900129b4:	e51b300c 	ldr	r3, [fp, #-12]
900129b8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t base = get_arm_private_peripheral_base() + kGICDBaseOffset;
900129bc:	e2833a01 	add	r3, r3, #4096	; 0x1000
900129c0:	e50b3008 	str	r3, [fp, #-8]
    return (gicd_t*)base;
900129c4:	e51b3008 	ldr	r3, [fp, #-8]
}
900129c8:	e1a00003 	mov	r0, r3
900129cc:	e28bd000 	add	sp, fp, #0
900129d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900129d4:	e12fff1e 	bx	lr

900129d8 <gic_enable>:

void gic_enable(bool enableIt)
{
900129d8:	e92d4800 	push	{fp, lr}
900129dc:	e28db004 	add	fp, sp, #4
900129e0:	e24dd010 	sub	sp, sp, #16
900129e4:	e1a03000 	mov	r3, r0
900129e8:	e54b300d 	strb	r3, [fp, #-13]
    gicd_t* gicd = gic_get_gicd();
900129ec:	ebffffeb 	bl	900129a0 <gic_get_gicd>
900129f0:	e50b0008 	str	r0, [fp, #-8]

    if (enableIt) {
900129f4:	e55b300d 	ldrb	r3, [fp, #-13]
900129f8:	e3530000 	cmp	r3, #0
900129fc:	0a000005 	beq	90012a18 <gic_enable+0x40>
        // Enable both secure and non-secure.
        gicd->CTLR |= kBM_GICD_CTLR_EnableGrp0 | kBM_GICD_CTLR_EnableGrp1;
90012a00:	e51b3008 	ldr	r3, [fp, #-8]
90012a04:	e5933000 	ldr	r3, [r3]
90012a08:	e3832003 	orr	r2, r3, #3
90012a0c:	e51b3008 	ldr	r3, [fp, #-8]
90012a10:	e5832000 	str	r2, [r3]
    } else {
        // Clear the enable bits.
        gicd->CTLR &= ~(kBM_GICD_CTLR_EnableGrp0 | kBM_GICD_CTLR_EnableGrp1);
    }
}
90012a14:	ea000004 	b	90012a2c <gic_enable+0x54>
        gicd->CTLR &= ~(kBM_GICD_CTLR_EnableGrp0 | kBM_GICD_CTLR_EnableGrp1);
90012a18:	e51b3008 	ldr	r3, [fp, #-8]
90012a1c:	e5933000 	ldr	r3, [r3]
90012a20:	e3c32003 	bic	r2, r3, #3
90012a24:	e51b3008 	ldr	r3, [fp, #-8]
90012a28:	e5832000 	str	r2, [r3]
}
90012a2c:	e320f000 	nop	{0}
90012a30:	e24bd004 	sub	sp, fp, #4
90012a34:	e8bd8800 	pop	{fp, pc}

90012a38 <gic_set_irq_security>:

void gic_set_irq_security(uint32_t irqID, bool isSecure)
{
90012a38:	e92d4800 	push	{fp, lr}
90012a3c:	e28db004 	add	fp, sp, #4
90012a40:	e24dd028 	sub	sp, sp, #40	; 0x28
90012a44:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
90012a48:	e1a03001 	mov	r3, r1
90012a4c:	e54b3029 	strb	r3, [fp, #-41]	; 0xffffffd7
    gicd_t* gicd = gic_get_gicd();
90012a50:	ebffffd2 	bl	900129a0 <gic_get_gicd>
90012a54:	e50b000c 	str	r0, [fp, #-12]
90012a58:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90012a5c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    return MMIO_P2V(0x00A00000);
}

__attribute__((__always_inline__)) static inline uint32_t irq_get_register_offset(uint32_t irqID)
{
    return irqID / 32;
90012a60:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012a64:	e1a032a3 	lsr	r3, r3, #5

    uint32_t reg = irq_get_register_offset(irqID);
90012a68:	e50b3010 	str	r3, [fp, #-16]
90012a6c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90012a70:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90012a74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012a78:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
}

__attribute__((__always_inline__)) static inline uint32_t irq_get_bit_offset(uint32_t irqID)
{
    return irqID & 0x1f;
90012a7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90012a80:	e203301f 	and	r3, r3, #31
}

__attribute__((__always_inline__)) static inline uint32_t irq_get_bit_mask(uint32_t irqID)
{
    return 1 << irq_get_bit_offset(irqID);
90012a84:	e3a02001 	mov	r2, #1
90012a88:	e1a03312 	lsl	r3, r2, r3
    uint32_t mask = irq_get_bit_mask(irqID);
90012a8c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    uint32_t value = gicd->IGROUPRn[reg];
90012a90:	e51b300c 	ldr	r3, [fp, #-12]
90012a94:	e51b2010 	ldr	r2, [fp, #-16]
90012a98:	e2822020 	add	r2, r2, #32
90012a9c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90012aa0:	e50b3008 	str	r3, [fp, #-8]
    if (!isSecure) {
90012aa4:	e55b3029 	ldrb	r3, [fp, #-41]	; 0xffffffd7
90012aa8:	e2233001 	eor	r3, r3, #1
90012aac:	e6ef3073 	uxtb	r3, r3
90012ab0:	e3530000 	cmp	r3, #0
90012ab4:	0a000005 	beq	90012ad0 <gic_set_irq_security+0x98>
        value &= ~mask;
90012ab8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012abc:	e1e03003 	mvn	r3, r3
90012ac0:	e51b2008 	ldr	r2, [fp, #-8]
90012ac4:	e0033002 	and	r3, r3, r2
90012ac8:	e50b3008 	str	r3, [fp, #-8]
90012acc:	ea000003 	b	90012ae0 <gic_set_irq_security+0xa8>
    } else {
        value |= mask;
90012ad0:	e51b2008 	ldr	r2, [fp, #-8]
90012ad4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012ad8:	e1823003 	orr	r3, r2, r3
90012adc:	e50b3008 	str	r3, [fp, #-8]
    }
    gicd->IGROUPRn[reg] = value;
90012ae0:	e51b300c 	ldr	r3, [fp, #-12]
90012ae4:	e51b2010 	ldr	r2, [fp, #-16]
90012ae8:	e2822020 	add	r2, r2, #32
90012aec:	e51b1008 	ldr	r1, [fp, #-8]
90012af0:	e7831102 	str	r1, [r3, r2, lsl #2]
}
90012af4:	e320f000 	nop	{0}
90012af8:	e24bd004 	sub	sp, fp, #4
90012afc:	e8bd8800 	pop	{fp, pc}

90012b00 <gic_enable_irq>:

void gic_enable_irq(uint32_t irqID, bool isEnabled)
{
90012b00:	e92d4800 	push	{fp, lr}
90012b04:	e28db004 	add	fp, sp, #4
90012b08:	e24dd020 	sub	sp, sp, #32
90012b0c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90012b10:	e1a03001 	mov	r3, r1
90012b14:	e54b3021 	strb	r3, [fp, #-33]	; 0xffffffdf
    gicd_t* gicd = gic_get_gicd();
90012b18:	ebffffa0 	bl	900129a0 <gic_get_gicd>
90012b1c:	e50b0008 	str	r0, [fp, #-8]
90012b20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012b24:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    return irqID / 32;
90012b28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90012b2c:	e1a032a3 	lsr	r3, r3, #5

    uint32_t reg = irq_get_register_offset(irqID);
90012b30:	e50b300c 	str	r3, [fp, #-12]
90012b34:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012b38:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90012b3c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012b40:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return irqID & 0x1f;
90012b44:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012b48:	e203301f 	and	r3, r3, #31
    return 1 << irq_get_bit_offset(irqID);
90012b4c:	e3a02001 	mov	r2, #1
90012b50:	e1a03312 	lsl	r3, r2, r3
    uint32_t mask = irq_get_bit_mask(irqID);
90012b54:	e50b3010 	str	r3, [fp, #-16]

    // Select set-enable or clear-enable register based on enable flag.
    if (isEnabled) {
90012b58:	e55b3021 	ldrb	r3, [fp, #-33]	; 0xffffffdf
90012b5c:	e3530000 	cmp	r3, #0
90012b60:	0a000005 	beq	90012b7c <gic_enable_irq+0x7c>
        gicd->ISENABLERn[reg] = mask;
90012b64:	e51b3008 	ldr	r3, [fp, #-8]
90012b68:	e51b200c 	ldr	r2, [fp, #-12]
90012b6c:	e2822040 	add	r2, r2, #64	; 0x40
90012b70:	e51b1010 	ldr	r1, [fp, #-16]
90012b74:	e7831102 	str	r1, [r3, r2, lsl #2]
    } else {
        gicd->ICENABLERn[reg] = mask;
    }
}
90012b78:	ea000004 	b	90012b90 <gic_enable_irq+0x90>
        gicd->ICENABLERn[reg] = mask;
90012b7c:	e51b3008 	ldr	r3, [fp, #-8]
90012b80:	e51b200c 	ldr	r2, [fp, #-12]
90012b84:	e2822060 	add	r2, r2, #96	; 0x60
90012b88:	e51b1010 	ldr	r1, [fp, #-16]
90012b8c:	e7831102 	str	r1, [r3, r2, lsl #2]
}
90012b90:	e320f000 	nop	{0}
90012b94:	e24bd004 	sub	sp, fp, #4
90012b98:	e8bd8800 	pop	{fp, pc}

90012b9c <gic_set_irq_priority>:

void gic_set_irq_priority(uint32_t ID, uint32_t priority)
{
90012b9c:	e92d4800 	push	{fp, lr}
90012ba0:	e28db004 	add	fp, sp, #4
90012ba4:	e24dd010 	sub	sp, sp, #16
90012ba8:	e50b0010 	str	r0, [fp, #-16]
90012bac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    gicd_t* gicd = gic_get_gicd();
90012bb0:	ebffff7a 	bl	900129a0 <gic_get_gicd>
90012bb4:	e50b0008 	str	r0, [fp, #-8]

    // Update the priority register. The priority registers are byte accessible, and the register
    // struct has the priority registers as a byte array, so we can just index directly by the
    // interrupt ID.
    gicd->IPRIORITYRn[ID] = priority & 0xff;
90012bb8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012bbc:	e6ef1073 	uxtb	r1, r3
90012bc0:	e51b2008 	ldr	r2, [fp, #-8]
90012bc4:	e51b3010 	ldr	r3, [fp, #-16]
90012bc8:	e0823003 	add	r3, r2, r3
90012bcc:	e2833b01 	add	r3, r3, #1024	; 0x400
90012bd0:	e1a02001 	mov	r2, r1
90012bd4:	e5c32000 	strb	r2, [r3]
}
90012bd8:	e320f000 	nop	{0}
90012bdc:	e24bd004 	sub	sp, fp, #4
90012be0:	e8bd8800 	pop	{fp, pc}

90012be4 <gic_set_cpu_target>:

void gic_set_cpu_target(uint32_t irqID, unsigned cpuNumber, bool enableIt)
{
90012be4:	e92d4800 	push	{fp, lr}
90012be8:	e28db004 	add	fp, sp, #4
90012bec:	e24dd018 	sub	sp, sp, #24
90012bf0:	e50b0010 	str	r0, [fp, #-16]
90012bf4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90012bf8:	e1a03002 	mov	r3, r2
90012bfc:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    // Make sure the CPU number is valid.
    // assert(cpuNumber <= 7);

    gicd_t* gicd = gic_get_gicd();
90012c00:	ebffff66 	bl	900129a0 <gic_get_gicd>
90012c04:	e50b0008 	str	r0, [fp, #-8]
    uint8_t cpuMask = 1 << cpuNumber;
90012c08:	e3a02001 	mov	r2, #1
90012c0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012c10:	e1a03312 	lsl	r3, r2, r3
90012c14:	e54b3009 	strb	r3, [fp, #-9]

    // Like the priority registers, the target registers are byte accessible, and the register
    // struct has the them as a byte array, so we can just index directly by the
    // interrupt ID.
    if (enableIt) {
90012c18:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
90012c1c:	e3530000 	cmp	r3, #0
90012c20:	0a00000f 	beq	90012c64 <gic_set_cpu_target+0x80>
        gicd->ITARGETSRn[irqID] |= (cpuMask & 0xff);
90012c24:	e51b2008 	ldr	r2, [fp, #-8]
90012c28:	e51b3010 	ldr	r3, [fp, #-16]
90012c2c:	e0823003 	add	r3, r2, r3
90012c30:	e2833b02 	add	r3, r3, #2048	; 0x800
90012c34:	e5d33000 	ldrb	r3, [r3]
90012c38:	e6ef2073 	uxtb	r2, r3
90012c3c:	e55b3009 	ldrb	r3, [fp, #-9]
90012c40:	e1823003 	orr	r3, r2, r3
90012c44:	e6ef1073 	uxtb	r1, r3
90012c48:	e51b2008 	ldr	r2, [fp, #-8]
90012c4c:	e51b3010 	ldr	r3, [fp, #-16]
90012c50:	e0823003 	add	r3, r2, r3
90012c54:	e2833b02 	add	r3, r3, #2048	; 0x800
90012c58:	e1a02001 	mov	r2, r1
90012c5c:	e5c32000 	strb	r2, [r3]
    } else {
        gicd->ITARGETSRn[irqID] &= ~(cpuMask & 0xff);
    }
}
90012c60:	ea000012 	b	90012cb0 <gic_set_cpu_target+0xcc>
        gicd->ITARGETSRn[irqID] &= ~(cpuMask & 0xff);
90012c64:	e51b2008 	ldr	r2, [fp, #-8]
90012c68:	e51b3010 	ldr	r3, [fp, #-16]
90012c6c:	e0823003 	add	r3, r2, r3
90012c70:	e2833b02 	add	r3, r3, #2048	; 0x800
90012c74:	e5d33000 	ldrb	r3, [r3]
90012c78:	e6ef3073 	uxtb	r3, r3
90012c7c:	e6af2073 	sxtb	r2, r3
90012c80:	e15b30d9 	ldrsb	r3, [fp, #-9]
90012c84:	e1e03003 	mvn	r3, r3
90012c88:	e6af3073 	sxtb	r3, r3
90012c8c:	e0033002 	and	r3, r3, r2
90012c90:	e6af3073 	sxtb	r3, r3
90012c94:	e6ef1073 	uxtb	r1, r3
90012c98:	e51b2008 	ldr	r2, [fp, #-8]
90012c9c:	e51b3010 	ldr	r3, [fp, #-16]
90012ca0:	e0823003 	add	r3, r2, r3
90012ca4:	e2833b02 	add	r3, r3, #2048	; 0x800
90012ca8:	e1a02001 	mov	r2, r1
90012cac:	e5c32000 	strb	r2, [r3]
}
90012cb0:	e320f000 	nop	{0}
90012cb4:	e24bd004 	sub	sp, fp, #4
90012cb8:	e8bd8800 	pop	{fp, pc}

90012cbc <gic_send_sgi>:

void gic_send_sgi(uint32_t irqID, uint32_t target_list, uint32_t filter_list)
{
90012cbc:	e92d4800 	push	{fp, lr}
90012cc0:	e28db004 	add	fp, sp, #4
90012cc4:	e24dd018 	sub	sp, sp, #24
90012cc8:	e50b0010 	str	r0, [fp, #-16]
90012ccc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90012cd0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    gicd_t* gicd = gic_get_gicd();
90012cd4:	ebffff31 	bl	900129a0 <gic_get_gicd>
90012cd8:	e50b0008 	str	r0, [fp, #-8]

    gicd->SGIR = (filter_list << kBP_GICD_SGIR_TargetListFilter)
90012cdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90012ce0:	e1a02c03 	lsl	r2, r3, #24
        | (target_list << kBP_GICD_SGIR_CPUTargetList)
90012ce4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90012ce8:	e1a03803 	lsl	r3, r3, #16
90012cec:	e1822003 	orr	r2, r2, r3
        | (irqID & 0xf);
90012cf0:	e51b3010 	ldr	r3, [fp, #-16]
90012cf4:	e203300f 	and	r3, r3, #15
90012cf8:	e1822003 	orr	r2, r2, r3
    gicd->SGIR = (filter_list << kBP_GICD_SGIR_TargetListFilter)
90012cfc:	e51b3008 	ldr	r3, [fp, #-8]
90012d00:	e5832f00 	str	r2, [r3, #3840]	; 0xf00
}
90012d04:	e320f000 	nop	{0}
90012d08:	e24bd004 	sub	sp, fp, #4
90012d0c:	e8bd8800 	pop	{fp, pc}

90012d10 <gic_init>:

void gic_init(void)
{
90012d10:	e92d4800 	push	{fp, lr}
90012d14:	e28db004 	add	fp, sp, #4
90012d18:	e24dd010 	sub	sp, sp, #16
    gicd_t* gicd = gic_get_gicd();
90012d1c:	ebffff1f 	bl	900129a0 <gic_get_gicd>
90012d20:	e50b0010 	str	r0, [fp, #-16]

    // First disable the distributor.
    gic_enable(false);
90012d24:	e3a00000 	mov	r0, #0
90012d28:	ebffff2a 	bl	900129d8 <gic_enable>

    for (uint32_t i = 0; i < 8; i++) {
90012d2c:	e3a03000 	mov	r3, #0
90012d30:	e50b3008 	str	r3, [fp, #-8]
90012d34:	ea000007 	b	90012d58 <gic_init+0x48>
        gicd->IGROUPRn[i] = 0;
90012d38:	e51b3010 	ldr	r3, [fp, #-16]
90012d3c:	e51b2008 	ldr	r2, [fp, #-8]
90012d40:	e2822020 	add	r2, r2, #32
90012d44:	e3a01000 	mov	r1, #0
90012d48:	e7831102 	str	r1, [r3, r2, lsl #2]
    for (uint32_t i = 0; i < 8; i++) {
90012d4c:	e51b3008 	ldr	r3, [fp, #-8]
90012d50:	e2833001 	add	r3, r3, #1
90012d54:	e50b3008 	str	r3, [fp, #-8]
90012d58:	e51b3008 	ldr	r3, [fp, #-8]
90012d5c:	e3530007 	cmp	r3, #7
90012d60:	9afffff4 	bls	90012d38 <gic_init+0x28>
    }

    for (uint32_t i = 0; i < 255; i++) {
90012d64:	e3a03000 	mov	r3, #0
90012d68:	e50b300c 	str	r3, [fp, #-12]
90012d6c:	ea000012 	b	90012dbc <gic_init+0xac>
        *(uint32_t*)(&gicd->IPRIORITYRn[i * sizeof(uint32_t)]) = (uint32_t)0x80808080;
90012d70:	e51b300c 	ldr	r3, [fp, #-12]
90012d74:	e1a03103 	lsl	r3, r3, #2
90012d78:	e2833b01 	add	r3, r3, #1024	; 0x400
90012d7c:	e51b2010 	ldr	r2, [fp, #-16]
90012d80:	e0822003 	add	r2, r2, r3
90012d84:	e3083080 	movw	r3, #32896	; 0x8080
90012d88:	e3483080 	movt	r3, #32896	; 0x8080
90012d8c:	e5823000 	str	r3, [r2]
        *(uint32_t*)(&gicd->ITARGETSRn[i * sizeof(uint32_t)]) = (uint32_t)0x01010101;
90012d90:	e51b300c 	ldr	r3, [fp, #-12]
90012d94:	e1a03103 	lsl	r3, r3, #2
90012d98:	e2833b02 	add	r3, r3, #2048	; 0x800
90012d9c:	e51b2010 	ldr	r2, [fp, #-16]
90012da0:	e0822003 	add	r2, r2, r3
90012da4:	e3003101 	movw	r3, #257	; 0x101
90012da8:	e3403101 	movt	r3, #257	; 0x101
90012dac:	e5823000 	str	r3, [r2]
    for (uint32_t i = 0; i < 255; i++) {
90012db0:	e51b300c 	ldr	r3, [fp, #-12]
90012db4:	e2833001 	add	r3, r3, #1
90012db8:	e50b300c 	str	r3, [fp, #-12]
90012dbc:	e51b300c 	ldr	r3, [fp, #-12]
90012dc0:	e35300fe 	cmp	r3, #254	; 0xfe
90012dc4:	9affffe9 	bls	90012d70 <gic_init+0x60>
    }

    // Init the GIC CPU interface.
    gic_init_cpu();
90012dc8:	eb00004d 	bl	90012f04 <gic_init_cpu>

    // Now enable the distributor.
    gic_enable(true);
90012dcc:	e3a00001 	mov	r0, #1
90012dd0:	ebffff00 	bl	900129d8 <gic_enable>
}
90012dd4:	e320f000 	nop	{0}
90012dd8:	e24bd004 	sub	sp, fp, #4
90012ddc:	e8bd8800 	pop	{fp, pc}

90012de0 <gic_get_gicc>:
*************************************************/
#include "gicv2_common_opa.h"
#include "gicv2_registers.h"

static inline gicc_t* gic_get_gicc(void)
{
90012de0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90012de4:	e28db000 	add	fp, sp, #0
90012de8:	e24dd00c 	sub	sp, sp, #12
90012dec:	e3a0360a 	mov	r3, #10485760	; 0xa00000
90012df0:	e50b300c 	str	r3, [fp, #-12]
90012df4:	e51b300c 	ldr	r3, [fp, #-12]
90012df8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t base = get_arm_private_peripheral_base() + kGICCBaseOffset;
90012dfc:	e2833c01 	add	r3, r3, #256	; 0x100
90012e00:	e50b3008 	str	r3, [fp, #-8]
    return (gicc_t*)base;
90012e04:	e51b3008 	ldr	r3, [fp, #-8]
}
90012e08:	e1a00003 	mov	r0, r3
90012e0c:	e28bd000 	add	sp, fp, #0
90012e10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90012e14:	e12fff1e 	bx	lr

90012e18 <gic_cpu_enable>:

void gic_cpu_enable(bool enableIt)
{
90012e18:	e92d4800 	push	{fp, lr}
90012e1c:	e28db004 	add	fp, sp, #4
90012e20:	e24dd010 	sub	sp, sp, #16
90012e24:	e1a03000 	mov	r3, r0
90012e28:	e54b300d 	strb	r3, [fp, #-13]
    gicc_t* gicc = gic_get_gicc();
90012e2c:	ebffffeb 	bl	90012de0 <gic_get_gicc>
90012e30:	e50b0008 	str	r0, [fp, #-8]

    if (enableIt) {
90012e34:	e55b300d 	ldrb	r3, [fp, #-13]
90012e38:	e3530000 	cmp	r3, #0
90012e3c:	0a000005 	beq	90012e58 <gic_cpu_enable+0x40>
        gicc->CTLR |= kBM_GICC_CTLR_EnableS | kBM_GICC_CTLR_EnableNS;
90012e40:	e51b3008 	ldr	r3, [fp, #-8]
90012e44:	e5933000 	ldr	r3, [r3]
90012e48:	e3832003 	orr	r2, r3, #3
90012e4c:	e51b3008 	ldr	r3, [fp, #-8]
90012e50:	e5832000 	str	r2, [r3]
    } else {
        gicc->CTLR &= ~(kBM_GICC_CTLR_EnableS | kBM_GICC_CTLR_EnableNS);
    }
}
90012e54:	ea000004 	b	90012e6c <gic_cpu_enable+0x54>
        gicc->CTLR &= ~(kBM_GICC_CTLR_EnableS | kBM_GICC_CTLR_EnableNS);
90012e58:	e51b3008 	ldr	r3, [fp, #-8]
90012e5c:	e5933000 	ldr	r3, [r3]
90012e60:	e3c32003 	bic	r2, r3, #3
90012e64:	e51b3008 	ldr	r3, [fp, #-8]
90012e68:	e5832000 	str	r2, [r3]
}
90012e6c:	e320f000 	nop	{0}
90012e70:	e24bd004 	sub	sp, fp, #4
90012e74:	e8bd8800 	pop	{fp, pc}

90012e78 <gic_set_cpu_priority_mask>:

void gic_set_cpu_priority_mask(uint32_t priority)
{
90012e78:	e92d4800 	push	{fp, lr}
90012e7c:	e28db004 	add	fp, sp, #4
90012e80:	e24dd010 	sub	sp, sp, #16
90012e84:	e50b0010 	str	r0, [fp, #-16]
    gicc_t* gicc = gic_get_gicc();
90012e88:	ebffffd4 	bl	90012de0 <gic_get_gicc>
90012e8c:	e50b0008 	str	r0, [fp, #-8]
    gicc->PMR = priority & 0xff;
90012e90:	e51b3010 	ldr	r3, [fp, #-16]
90012e94:	e6ef2073 	uxtb	r2, r3
90012e98:	e51b3008 	ldr	r3, [fp, #-8]
90012e9c:	e5832004 	str	r2, [r3, #4]
}
90012ea0:	e320f000 	nop	{0}
90012ea4:	e24bd004 	sub	sp, fp, #4
90012ea8:	e8bd8800 	pop	{fp, pc}

90012eac <gic_read_irq_ack>:

inline uint32_t gic_read_irq_ack(void)
{
90012eac:	e92d4800 	push	{fp, lr}
90012eb0:	e28db004 	add	fp, sp, #4
90012eb4:	e24dd008 	sub	sp, sp, #8
    gicc_t* gicc = gic_get_gicc();
90012eb8:	ebffffc8 	bl	90012de0 <gic_get_gicc>
90012ebc:	e50b0008 	str	r0, [fp, #-8]
    return gicc->IAR;
90012ec0:	e51b3008 	ldr	r3, [fp, #-8]
90012ec4:	e593300c 	ldr	r3, [r3, #12]
}
90012ec8:	e1a00003 	mov	r0, r3
90012ecc:	e24bd004 	sub	sp, fp, #4
90012ed0:	e8bd8800 	pop	{fp, pc}

90012ed4 <gic_write_end_of_irq>:

void gic_write_end_of_irq(uint32_t irqID)
{
90012ed4:	e92d4800 	push	{fp, lr}
90012ed8:	e28db004 	add	fp, sp, #4
90012edc:	e24dd010 	sub	sp, sp, #16
90012ee0:	e50b0010 	str	r0, [fp, #-16]
    gicc_t* gicc = gic_get_gicc();
90012ee4:	ebffffbd 	bl	90012de0 <gic_get_gicc>
90012ee8:	e50b0008 	str	r0, [fp, #-8]
    gicc->EOIR = irqID;
90012eec:	e51b3008 	ldr	r3, [fp, #-8]
90012ef0:	e51b2010 	ldr	r2, [fp, #-16]
90012ef4:	e5832010 	str	r2, [r3, #16]
}
90012ef8:	e320f000 	nop	{0}
90012efc:	e24bd004 	sub	sp, fp, #4
90012f00:	e8bd8800 	pop	{fp, pc}

90012f04 <gic_init_cpu>:

void gic_init_cpu(void)
{
90012f04:	e92d4800 	push	{fp, lr}
90012f08:	e28db004 	add	fp, sp, #4
90012f0c:	e24dd008 	sub	sp, sp, #8
    // Init the GIC CPU interface.
    gic_set_cpu_priority_mask(0xff);
90012f10:	e3a000ff 	mov	r0, #255	; 0xff
90012f14:	ebffffd7 	bl	90012e78 <gic_set_cpu_priority_mask>

    // Disable preemption.
    gicc_t* gicc = gic_get_gicc();
90012f18:	ebffffb0 	bl	90012de0 <gic_get_gicc>
90012f1c:	e50b0008 	str	r0, [fp, #-8]
    gicc->BPR = 7;
90012f20:	e51b3008 	ldr	r3, [fp, #-8]
90012f24:	e3a02007 	mov	r2, #7
90012f28:	e5832008 	str	r2, [r3, #8]

    // Enable signaling the CPU.
    gic_cpu_enable(true);
90012f2c:	e3a00001 	mov	r0, #1
90012f30:	ebffffb8 	bl	90012e18 <gic_cpu_enable>
90012f34:	e320f000 	nop	{0}
90012f38:	e24bd004 	sub	sp, fp, #4
90012f3c:	e8bd8800 	pop	{fp, pc}

90012f40 <panic>:
extern void trap_undefined_instruction(void);

static struct XiziTrapDriver xizi_trap_driver;

void panic(char* s)
{
90012f40:	e92d4800 	push	{fp, lr}
90012f44:	e28db004 	add	fp, sp, #4
90012f48:	e24dd008 	sub	sp, sp, #8
90012f4c:	e50b0008 	str	r0, [fp, #-8]
    xizi_trap_driver.cpu_irq_disable();
90012f50:	e3033058 	movw	r3, #12376	; 0x3058
90012f54:	e3493002 	movt	r3, #36866	; 0x9002
90012f58:	e5933298 	ldr	r3, [r3, #664]	; 0x298
90012f5c:	e12fff33 	blx	r3
    KPrintf("panic: %s\n", s);
90012f60:	e51b1008 	ldr	r1, [fp, #-8]
90012f64:	e3000e24 	movw	r0, #3620	; 0xe24
90012f68:	e3490002 	movt	r0, #36866	; 0x9002
90012f6c:	eb000901 	bl	90015378 <KPrintf>
    for (;;)
90012f70:	eafffffe 	b	90012f70 <panic+0x30>

90012f74 <init_cpu_mode_stacks>:
extern uint32_t _vector_jumper;
extern uint32_t _vector_start;
extern uint32_t _vector_end;

void init_cpu_mode_stacks(int cpu_id)
{
90012f74:	e92d4800 	push	{fp, lr}
90012f78:	e28db004 	add	fp, sp, #4
90012f7c:	e24dd020 	sub	sp, sp, #32
90012f80:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    uint32_t modes[] = { ARM_MODE_FIQ, ARM_MODE_IRQ, ARM_MODE_ABT, ARM_MODE_UND };
90012f84:	e3003e30 	movw	r3, #3632	; 0xe30
90012f88:	e3493002 	movt	r3, #36866	; 0x9002
90012f8c:	e24bc018 	sub	ip, fp, #24
90012f90:	e893000f 	ldm	r3, {r0, r1, r2, r3}
90012f94:	e88c000f 	stm	ip, {r0, r1, r2, r3}
    // initialize the stacks for different mode
    for (int i = 0; i < sizeof(modes) / sizeof(uint32_t); i++) {
90012f98:	e3a03000 	mov	r3, #0
90012f9c:	e50b3008 	str	r3, [fp, #-8]
90012fa0:	ea00001d 	b	9001301c <init_cpu_mode_stacks+0xa8>
        memset(mode_stack_pages[cpu_id][i], 0, MODE_STACK_SIZE);
90012fa4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012fa8:	e1a02103 	lsl	r2, r3, #2
90012fac:	e51b3008 	ldr	r3, [fp, #-8]
90012fb0:	e0823003 	add	r3, r2, r3
90012fb4:	e1a02703 	lsl	r2, r3, #14
90012fb8:	e30a3854 	movw	r3, #43092	; 0xa854
90012fbc:	e3493015 	movt	r3, #36885	; 0x9015
90012fc0:	e0823003 	add	r3, r2, r3
90012fc4:	e3a02901 	mov	r2, #16384	; 0x4000
90012fc8:	e3a01000 	mov	r1, #0
90012fcc:	e1a00003 	mov	r0, r3
90012fd0:	fa003667 	blx	90020974 <memset>
        init_stack(modes[i], (uint32_t)mode_stack_pages[cpu_id][i]);
90012fd4:	e51b3008 	ldr	r3, [fp, #-8]
90012fd8:	e1a03103 	lsl	r3, r3, #2
90012fdc:	e24b2004 	sub	r2, fp, #4
90012fe0:	e0823003 	add	r3, r2, r3
90012fe4:	e5130014 	ldr	r0, [r3, #-20]	; 0xffffffec
90012fe8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90012fec:	e1a02103 	lsl	r2, r3, #2
90012ff0:	e51b3008 	ldr	r3, [fp, #-8]
90012ff4:	e0823003 	add	r3, r2, r3
90012ff8:	e1a02703 	lsl	r2, r3, #14
90012ffc:	e30a3854 	movw	r3, #43092	; 0xa854
90013000:	e3493015 	movt	r3, #36885	; 0x9015
90013004:	e0823003 	add	r3, r2, r3
90013008:	e1a01003 	mov	r1, r3
9001300c:	eb00043d 	bl	90014108 <init_stack>
    for (int i = 0; i < sizeof(modes) / sizeof(uint32_t); i++) {
90013010:	e51b3008 	ldr	r3, [fp, #-8]
90013014:	e2833001 	add	r3, r3, #1
90013018:	e50b3008 	str	r3, [fp, #-8]
9001301c:	e51b3008 	ldr	r3, [fp, #-8]
90013020:	e3530003 	cmp	r3, #3
90013024:	9affffde 	bls	90012fa4 <init_cpu_mode_stacks+0x30>
    }
}
90013028:	e320f000 	nop	{0}
9001302c:	e24bd004 	sub	sp, fp, #4
90013030:	e8bd8800 	pop	{fp, pc}

90013034 <handle_reserved>:

void handle_reserved(void)
{
90013034:	e92d4800 	push	{fp, lr}
90013038:	e28db004 	add	fp, sp, #4
    // unimplemented trap handler
    LOG("Unimplemented Reserved\n");
9001303c:	e3001e7c 	movw	r1, #3708	; 0xe7c
90013040:	e3491002 	movt	r1, #36866	; 0x9002
90013044:	e3000e40 	movw	r0, #3648	; 0xe40
90013048:	e3490002 	movt	r0, #36866	; 0x9002
9001304c:	eb0008c9 	bl	90015378 <KPrintf>
90013050:	e3000e4c 	movw	r0, #3660	; 0xe4c
90013054:	e3490002 	movt	r0, #36866	; 0x9002
90013058:	eb0008c6 	bl	90015378 <KPrintf>
    panic("");
9001305c:	e3000e64 	movw	r0, #3684	; 0xe64
90013060:	e3490002 	movt	r0, #36866	; 0x9002
90013064:	ebffffb5 	bl	90012f40 <panic>
}
90013068:	e320f000 	nop	{0}
9001306c:	e8bd8800 	pop	{fp, pc}

90013070 <handle_fiq>:

void handle_fiq(void)
{
90013070:	e92d4800 	push	{fp, lr}
90013074:	e28db004 	add	fp, sp, #4
    LOG("Unimplemented FIQ\n");
90013078:	e3001e8c 	movw	r1, #3724	; 0xe8c
9001307c:	e3491002 	movt	r1, #36866	; 0x9002
90013080:	e3000e40 	movw	r0, #3648	; 0xe40
90013084:	e3490002 	movt	r0, #36866	; 0x9002
90013088:	eb0008ba 	bl	90015378 <KPrintf>
9001308c:	e3000e68 	movw	r0, #3688	; 0xe68
90013090:	e3490002 	movt	r0, #36866	; 0x9002
90013094:	eb0008b7 	bl	90015378 <KPrintf>
    panic("");
90013098:	e3000e64 	movw	r0, #3684	; 0xe64
9001309c:	e3490002 	movt	r0, #36866	; 0x9002
900130a0:	ebffffa6 	bl	90012f40 <panic>
}
900130a4:	e320f000 	nop	{0}
900130a8:	e8bd8800 	pop	{fp, pc}

900130ac <_sys_irq_init>:

static void _sys_irq_init()
{
900130ac:	e92d4800 	push	{fp, lr}
900130b0:	e28db004 	add	fp, sp, #4
900130b4:	e24dd008 	sub	sp, sp, #8
    /* load exception vectors */
    volatile uint32_t* vector_base = &_vector_start;
900130b8:	e3003020 	movw	r3, #32
900130bc:	e3493001 	movt	r3, #36865	; 0x9001
900130c0:	e50b3008 	str	r3, [fp, #-8]

    // Set Interrupt handler start address
    vector_base[1] = (uint32_t)trap_undefined_instruction; // Undefined Instruction
900130c4:	e51b3008 	ldr	r3, [fp, #-8]
900130c8:	e2832004 	add	r2, r3, #4
900130cc:	e30430b0 	movw	r3, #16560	; 0x40b0
900130d0:	e3493001 	movt	r3, #36865	; 0x9001
900130d4:	e5823000 	str	r3, [r2]
    vector_base[2] = (uint32_t)user_trap_swi_enter; // Software Interrupt
900130d8:	e51b3008 	ldr	r3, [fp, #-8]
900130dc:	e2832008 	add	r2, r3, #8
900130e0:	e3033eb4 	movw	r3, #16052	; 0x3eb4
900130e4:	e3493001 	movt	r3, #36865	; 0x9001
900130e8:	e5823000 	str	r3, [r2]
    vector_base[3] = (uint32_t)trap_iabort; // Prefetch Abort
900130ec:	e51b3008 	ldr	r3, [fp, #-8]
900130f0:	e283200c 	add	r2, r3, #12
900130f4:	e3043054 	movw	r3, #16468	; 0x4054
900130f8:	e3493001 	movt	r3, #36865	; 0x9001
900130fc:	e5823000 	str	r3, [r2]
    vector_base[4] = (uint32_t)trap_dabort; // Data Abort
90013100:	e51b3008 	ldr	r3, [fp, #-8]
90013104:	e2832010 	add	r2, r3, #16
90013108:	e3033ff8 	movw	r3, #16376	; 0x3ff8
9001310c:	e3493001 	movt	r3, #36865	; 0x9001
90013110:	e5823000 	str	r3, [r2]
    vector_base[5] = (uint32_t)handle_reserved; // Reserved
90013114:	e51b3008 	ldr	r3, [fp, #-8]
90013118:	e2832014 	add	r2, r3, #20
9001311c:	e3033034 	movw	r3, #12340	; 0x3034
90013120:	e3493001 	movt	r3, #36865	; 0x9001
90013124:	e5823000 	str	r3, [r2]
    vector_base[6] = (uint32_t)trap_irq_enter; // IRQ
90013128:	e51b3008 	ldr	r3, [fp, #-8]
9001312c:	e2832018 	add	r2, r3, #24
90013130:	e3033f10 	movw	r3, #16144	; 0x3f10
90013134:	e3493001 	movt	r3, #36865	; 0x9001
90013138:	e5823000 	str	r3, [r2]
    vector_base[7] = (uint32_t)handle_fiq; // FIQ
9001313c:	e51b3008 	ldr	r3, [fp, #-8]
90013140:	e283201c 	add	r2, r3, #28
90013144:	e3033070 	movw	r3, #12400	; 0x3070
90013148:	e3493001 	movt	r3, #36865	; 0x9001
9001314c:	e5823000 	str	r3, [r2]

    init_cpu_mode_stacks(0);
90013150:	e3a00000 	mov	r0, #0
90013154:	ebffff86 	bl	90012f74 <init_cpu_mode_stacks>

    /* active hardware irq responser */
    gic_init();
90013158:	ebfffeec 	bl	90012d10 <gic_init>
    xizi_trap_driver.switch_hw_irqtbl((uint32_t*)&_vector_jumper);
9001315c:	e3033058 	movw	r3, #12376	; 0x3058
90013160:	e3493002 	movt	r3, #36866	; 0x9002
90013164:	e59332a4 	ldr	r3, [r3, #676]	; 0x2a4
90013168:	e3000000 	movw	r0, #0
9001316c:	e3490001 	movt	r0, #36865	; 0x9001
90013170:	e12fff33 	blx	r3
}
90013174:	e320f000 	nop	{0}
90013178:	e24bd004 	sub	sp, fp, #4
9001317c:	e8bd8800 	pop	{fp, pc}

90013180 <_cpu_irq_enable>:

static void _cpu_irq_enable(void)
{
90013180:	e92d4800 	push	{fp, lr}
90013184:	e28db004 	add	fp, sp, #4
    arm_set_interrupt_state(true);
90013188:	e3a00001 	mov	r0, #1
9001318c:	ebfff7de 	bl	9001110c <arm_set_interrupt_state>
}
90013190:	e320f000 	nop	{0}
90013194:	e8bd8800 	pop	{fp, pc}

90013198 <_cpu_irq_disable>:

static void _cpu_irq_disable(void)
{
90013198:	e92d4800 	push	{fp, lr}
9001319c:	e28db004 	add	fp, sp, #4
    arm_set_interrupt_state(false);
900131a0:	e3a00000 	mov	r0, #0
900131a4:	ebfff7d8 	bl	9001110c <arm_set_interrupt_state>
}
900131a8:	e320f000 	nop	{0}
900131ac:	e8bd8800 	pop	{fp, pc}

900131b0 <_single_irq_enable>:

static void _single_irq_enable(int irq, int cpu, int prio)
{
900131b0:	e92d4800 	push	{fp, lr}
900131b4:	e28db004 	add	fp, sp, #4
900131b8:	e24dd010 	sub	sp, sp, #16
900131bc:	e50b0008 	str	r0, [fp, #-8]
900131c0:	e50b100c 	str	r1, [fp, #-12]
900131c4:	e50b2010 	str	r2, [fp, #-16]
    gic_set_irq_priority(irq, prio);
900131c8:	e51b3008 	ldr	r3, [fp, #-8]
900131cc:	e51b2010 	ldr	r2, [fp, #-16]
900131d0:	e1a01002 	mov	r1, r2
900131d4:	e1a00003 	mov	r0, r3
900131d8:	ebfffe6f 	bl	90012b9c <gic_set_irq_priority>
    gic_set_irq_security(irq, false); // set IRQ as non-secure
900131dc:	e51b3008 	ldr	r3, [fp, #-8]
900131e0:	e3a01000 	mov	r1, #0
900131e4:	e1a00003 	mov	r0, r3
900131e8:	ebfffe12 	bl	90012a38 <gic_set_irq_security>
    gic_set_cpu_target(irq, cpu, true);
900131ec:	e51b3008 	ldr	r3, [fp, #-8]
900131f0:	e51b100c 	ldr	r1, [fp, #-12]
900131f4:	e3a02001 	mov	r2, #1
900131f8:	e1a00003 	mov	r0, r3
900131fc:	ebfffe78 	bl	90012be4 <gic_set_cpu_target>
    gic_enable_irq(irq, true);
90013200:	e51b3008 	ldr	r3, [fp, #-8]
90013204:	e3a01001 	mov	r1, #1
90013208:	e1a00003 	mov	r0, r3
9001320c:	ebfffe3b 	bl	90012b00 <gic_enable_irq>
}
90013210:	e320f000 	nop	{0}
90013214:	e24bd004 	sub	sp, fp, #4
90013218:	e8bd8800 	pop	{fp, pc}

9001321c <_single_irq_disable>:

static void _single_irq_disable(int irq, int cpu)
{
9001321c:	e92d4800 	push	{fp, lr}
90013220:	e28db004 	add	fp, sp, #4
90013224:	e24dd008 	sub	sp, sp, #8
90013228:	e50b0008 	str	r0, [fp, #-8]
9001322c:	e50b100c 	str	r1, [fp, #-12]
    gic_enable_irq(irq, false);
90013230:	e51b3008 	ldr	r3, [fp, #-8]
90013234:	e3a01000 	mov	r1, #0
90013238:	e1a00003 	mov	r0, r3
9001323c:	ebfffe2f 	bl	90012b00 <gic_enable_irq>
    gic_set_cpu_target(irq, cpu, false);
90013240:	e51b3008 	ldr	r3, [fp, #-8]
90013244:	e51b100c 	ldr	r1, [fp, #-12]
90013248:	e3a02000 	mov	r2, #0
9001324c:	e1a00003 	mov	r0, r3
90013250:	ebfffe63 	bl	90012be4 <gic_set_cpu_target>
}
90013254:	e320f000 	nop	{0}
90013258:	e24bd004 	sub	sp, fp, #4
9001325c:	e8bd8800 	pop	{fp, pc}

90013260 <_switch_hw_irqtbl>:

#define VBAR
static inline uint32_t* _switch_hw_irqtbl(uint32_t* new_tbl_base)
{
90013260:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90013264:	e28db000 	add	fp, sp, #0
90013268:	e24dd014 	sub	sp, sp, #20
9001326c:	e50b0010 	str	r0, [fp, #-16]
    // get old irq table base addr
    uint32_t old_tbl_base = 0;
90013270:	e3a03000 	mov	r3, #0
90013274:	e50b3008 	str	r3, [fp, #-8]
    _ARM_MRC(15, 0, old_tbl_base, 12, 0, 0);
90013278:	ee1c3f10 	mrc	15, 0, r3, cr12, cr0, {0}
9001327c:	e50b3008 	str	r3, [fp, #-8]

    // set new irq table base addr
    _ARM_MCR(15, 0, new_tbl_base, 12, 0, 0);
90013280:	e51b3010 	ldr	r3, [fp, #-16]
90013284:	ee0c3f10 	mcr	15, 0, r3, cr12, cr0, {0}

    // set sctlr to use VBAR
    uint32_t sctlr = 0;
90013288:	e3a03000 	mov	r3, #0
9001328c:	e50b300c 	str	r3, [fp, #-12]
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
90013290:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
90013294:	e50b300c 	str	r3, [fp, #-12]
    sctlr &= ~(1 << 13);
90013298:	e51b300c 	ldr	r3, [fp, #-12]
9001329c:	e3c33a02 	bic	r3, r3, #8192	; 0x2000
900132a0:	e50b300c 	str	r3, [fp, #-12]
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);
900132a4:	e51b300c 	ldr	r3, [fp, #-12]
900132a8:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}

    return (uint32_t*)old_tbl_base;
900132ac:	e51b3008 	ldr	r3, [fp, #-8]
}
900132b0:	e1a00003 	mov	r0, r3
900132b4:	e28bd000 	add	sp, fp, #0
900132b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900132bc:	e12fff1e 	bx	lr

900132c0 <_bind_irq_handler>:

static void _bind_irq_handler(int irq, irq_handler_t handler)
{
900132c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900132c4:	e28db000 	add	fp, sp, #0
900132c8:	e24dd00c 	sub	sp, sp, #12
900132cc:	e50b0008 	str	r0, [fp, #-8]
900132d0:	e50b100c 	str	r1, [fp, #-12]
    xizi_trap_driver.sw_irqtbl[irq].handler = handler;
900132d4:	e3033058 	movw	r3, #12376	; 0x3058
900132d8:	e3493002 	movt	r3, #36866	; 0x9002
900132dc:	e51b2008 	ldr	r2, [fp, #-8]
900132e0:	e51b100c 	ldr	r1, [fp, #-12]
900132e4:	e7831102 	str	r1, [r3, r2, lsl #2]
}
900132e8:	e320f000 	nop	{0}
900132ec:	e28bd000 	add	sp, fp, #0
900132f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900132f4:	e12fff1e 	bx	lr

900132f8 <_send_sgi>:

static bool _send_sgi(uint32_t irq, uint32_t bitmask, enum SgiFilterType type)
{
900132f8:	e92d4800 	push	{fp, lr}
900132fc:	e28db004 	add	fp, sp, #4
90013300:	e24dd018 	sub	sp, sp, #24
90013304:	e50b0010 	str	r0, [fp, #-16]
90013308:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001330c:	e1a03002 	mov	r3, r2
90013310:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    if (bitmask > (1 << NR_CPU) - 1) {
90013314:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90013318:	e353000f 	cmp	r3, #15
9001331c:	9a000001 	bls	90013328 <_send_sgi+0x30>
        return false;
90013320:	e3a03000 	mov	r3, #0
90013324:	ea000014 	b	9001337c <_send_sgi+0x84>
    }

    enum _gicd_sgi_filter sgi_filter;
    switch (type) {
90013328:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
9001332c:	e3530000 	cmp	r3, #0
90013330:	0a000002 	beq	90013340 <_send_sgi+0x48>
90013334:	e3530001 	cmp	r3, #1
90013338:	0a000003 	beq	9001334c <_send_sgi+0x54>
9001333c:	ea000005 	b	90013358 <_send_sgi+0x60>
    case SgiFilter_TargetList:
        sgi_filter = kGicSgiFilter_UseTargetList;
90013340:	e3a03000 	mov	r3, #0
90013344:	e54b3005 	strb	r3, [fp, #-5]
        break;
90013348:	ea000005 	b	90013364 <_send_sgi+0x6c>
    case SgiFilter_AllOtherCPUs:
        sgi_filter = kGicSgiFilter_AllOtherCPUs;
9001334c:	e3a03001 	mov	r3, #1
90013350:	e54b3005 	strb	r3, [fp, #-5]
        break;
90013354:	ea000002 	b	90013364 <_send_sgi+0x6c>
    default:
        sgi_filter = kGicSgiFilter_OnlyThisCPU;
90013358:	e3a03002 	mov	r3, #2
9001335c:	e54b3005 	strb	r3, [fp, #-5]
        break;
90013360:	e320f000 	nop	{0}
    }
    gic_send_sgi(irq, bitmask, sgi_filter);
90013364:	e55b3005 	ldrb	r3, [fp, #-5]
90013368:	e1a02003 	mov	r2, r3
9001336c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90013370:	e51b0010 	ldr	r0, [fp, #-16]
90013374:	ebfffe50 	bl	90012cbc <gic_send_sgi>

    return true;
90013378:	e3a03001 	mov	r3, #1
}
9001337c:	e1a00003 	mov	r0, r3
90013380:	e24bd004 	sub	sp, fp, #4
90013384:	e8bd8800 	pop	{fp, pc}

90013388 <_hw_before_irq>:

static uint32_t _hw_before_irq()
{
90013388:	e92d4800 	push	{fp, lr}
9001338c:	e28db004 	add	fp, sp, #4
90013390:	e24dd008 	sub	sp, sp, #8

    uint32_t vectNum = gic_read_irq_ack();
90013394:	ebfffec4 	bl	90012eac <gic_read_irq_ack>
90013398:	e50b0008 	str	r0, [fp, #-8]
    if (vectNum & 0x200) {
9001339c:	e51b3008 	ldr	r3, [fp, #-8]
900133a0:	e2033c02 	and	r3, r3, #512	; 0x200
900133a4:	e3530000 	cmp	r3, #0
900133a8:	0a000003 	beq	900133bc <_hw_before_irq+0x34>
        gic_write_end_of_irq(vectNum);
900133ac:	e51b0008 	ldr	r0, [fp, #-8]
900133b0:	ebfffec7 	bl	90012ed4 <gic_write_end_of_irq>
        return 0;
900133b4:	e3a03000 	mov	r3, #0
900133b8:	ea000000 	b	900133c0 <_hw_before_irq+0x38>
    }
    return vectNum;
900133bc:	e51b3008 	ldr	r3, [fp, #-8]
}
900133c0:	e1a00003 	mov	r0, r3
900133c4:	e24bd004 	sub	sp, fp, #4
900133c8:	e8bd8800 	pop	{fp, pc}

900133cc <_hw_cur_int_num>:

static uint32_t _hw_cur_int_num(uint32_t int_info)
{
900133cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900133d0:	e28db000 	add	fp, sp, #0
900133d4:	e24dd00c 	sub	sp, sp, #12
900133d8:	e50b0008 	str	r0, [fp, #-8]
    return int_info & 0x1FF;
900133dc:	e51b3008 	ldr	r3, [fp, #-8]
900133e0:	e7e83053 	ubfx	r3, r3, #0, #9
}
900133e4:	e1a00003 	mov	r0, r3
900133e8:	e28bd000 	add	sp, fp, #0
900133ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900133f0:	e12fff1e 	bx	lr

900133f4 <_hw_cur_int_cpu>:

static uint32_t _hw_cur_int_cpu(uint32_t int_info)
{
900133f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900133f8:	e28db000 	add	fp, sp, #0
900133fc:	e24dd00c 	sub	sp, sp, #12
90013400:	e50b0008 	str	r0, [fp, #-8]
    return (int_info >> 10) & 0x7;
90013404:	e51b3008 	ldr	r3, [fp, #-8]
90013408:	e1a03523 	lsr	r3, r3, #10
9001340c:	e2033007 	and	r3, r3, #7
}
90013410:	e1a00003 	mov	r0, r3
90013414:	e28bd000 	add	sp, fp, #0
90013418:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001341c:	e12fff1e 	bx	lr

90013420 <_hw_after_irq>:

static void _hw_after_irq(uint32_t int_info)
{
90013420:	e92d4800 	push	{fp, lr}
90013424:	e28db004 	add	fp, sp, #4
90013428:	e24dd008 	sub	sp, sp, #8
9001342c:	e50b0008 	str	r0, [fp, #-8]
    gic_write_end_of_irq(int_info);
90013430:	e51b0008 	ldr	r0, [fp, #-8]
90013434:	ebfffea6 	bl	90012ed4 <gic_write_end_of_irq>
}
90013438:	e320f000 	nop	{0}
9001343c:	e24bd004 	sub	sp, fp, #4
90013440:	e8bd8800 	pop	{fp, pc}

90013444 <_is_interruptable>:

static int _is_interruptable(void)
{
90013444:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90013448:	e28db000 	add	fp, sp, #0
9001344c:	e24dd00c 	sub	sp, sp, #12
    uint32_t val;

    __asm__ __volatile__(
90013450:	e10f3000 	mrs	r3, CPSR
90013454:	e50b3008 	str	r3, [fp, #-8]
        "mrs %0, cpsr"
        : "=r"(val)
        :
        :);

    return !(val & DIS_INT);
90013458:	e51b3008 	ldr	r3, [fp, #-8]
9001345c:	e2033080 	and	r3, r3, #128	; 0x80
90013460:	e3530000 	cmp	r3, #0
90013464:	03a03001 	moveq	r3, #1
90013468:	13a03000 	movne	r3, #0
9001346c:	e6ef3073 	uxtb	r3, r3
}
90013470:	e1a00003 	mov	r0, r3
90013474:	e28bd000 	add	sp, fp, #0
90013478:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001347c:	e12fff1e 	bx	lr

90013480 <hardkernel_intr_init>:
    .hw_cur_int_cpu = _hw_cur_int_cpu,
    .hw_after_irq = _hw_after_irq,
};

struct XiziTrapDriver* hardkernel_intr_init(struct TraceTag* hardkernel_tag)
{
90013480:	e92d4800 	push	{fp, lr}
90013484:	e28db004 	add	fp, sp, #4
90013488:	e24dd008 	sub	sp, sp, #8
9001348c:	e50b0008 	str	r0, [fp, #-8]
    xizi_trap_driver.sys_irq_init();
90013490:	e3033058 	movw	r3, #12376	; 0x3058
90013494:	e3493002 	movt	r3, #36866	; 0x9002
90013498:	e5933290 	ldr	r3, [r3, #656]	; 0x290
9001349c:	e12fff33 	blx	r3
    xizi_trap_driver.cpu_irq_enable();
900134a0:	e3033058 	movw	r3, #12376	; 0x3058
900134a4:	e3493002 	movt	r3, #36866	; 0x9002
900134a8:	e5933294 	ldr	r3, [r3, #660]	; 0x294
900134ac:	e12fff33 	blx	r3
    return &xizi_trap_driver;
900134b0:	e3033058 	movw	r3, #12376	; 0x3058
900134b4:	e3493002 	movt	r3, #36866	; 0x9002
900134b8:	e1a00003 	mov	r0, r3
900134bc:	e24bd004 	sub	sp, fp, #4
900134c0:	e8bd8800 	pop	{fp, pc}

900134c4 <cur_cpuid>:
};

struct XiziTrapDriver* hardkernel_intr_init(struct TraceTag* hardkernel_tag);

static inline int cur_cpuid(void)
{
900134c4:	e92d4800 	push	{fp, lr}
900134c8:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
900134cc:	ebfff717 	bl	90011130 <cpu_get_current>
900134d0:	e1a03000 	mov	r3, r0
}
900134d4:	e1a00003 	mov	r0, r3
900134d8:	e8bd8800 	pop	{fp, pc}

900134dc <cur_cpu>:
};

extern struct CPU global_cpus[NR_CPU];

static inline struct CPU* cur_cpu(void)
{
900134dc:	e92d4800 	push	{fp, lr}
900134e0:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
900134e4:	ebfffff6 	bl	900134c4 <cur_cpuid>
900134e8:	e1a02000 	mov	r2, r0
900134ec:	e1a03002 	mov	r3, r2
900134f0:	e1a03083 	lsl	r3, r3, #1
900134f4:	e0833002 	add	r3, r3, r2
900134f8:	e1a03103 	lsl	r3, r3, #2
900134fc:	e304256c 	movw	r2, #17772	; 0x456c
90013500:	e349209a 	movt	r2, #37018	; 0x909a
90013504:	e0833002 	add	r3, r3, r2
90013508:	e1a00003 	mov	r0, r3
9001350c:	e8bd8800 	pop	{fp, pc}

90013510 <dump_tf>:
    else
        KPrintf("reason: unknown???\n");
}

void dump_tf(struct trapframe* tf)
{
90013510:	e92d4800 	push	{fp, lr}
90013514:	e28db004 	add	fp, sp, #4
90013518:	e24dd008 	sub	sp, sp, #8
9001351c:	e50b0008 	str	r0, [fp, #-8]
    KPrintf("lr_svc:  0x%x\n", tf->lr_svc);
90013520:	e51b3008 	ldr	r3, [fp, #-8]
90013524:	e5933008 	ldr	r3, [r3, #8]
90013528:	e1a01003 	mov	r1, r3
9001352c:	e3000e98 	movw	r0, #3736	; 0xe98
90013530:	e3490002 	movt	r0, #36866	; 0x9002
90013534:	eb00078f 	bl	90015378 <KPrintf>
    KPrintf("   spsr: 0x%x\n", tf->spsr);
90013538:	e51b3008 	ldr	r3, [fp, #-8]
9001353c:	e593300c 	ldr	r3, [r3, #12]
90013540:	e1a01003 	mov	r1, r3
90013544:	e3000ea8 	movw	r0, #3752	; 0xea8
90013548:	e3490002 	movt	r0, #36866	; 0x9002
9001354c:	eb000789 	bl	90015378 <KPrintf>
    KPrintf("     r0: 0x%x\n", tf->r0);
90013550:	e51b3008 	ldr	r3, [fp, #-8]
90013554:	e5933010 	ldr	r3, [r3, #16]
90013558:	e1a01003 	mov	r1, r3
9001355c:	e3000eb8 	movw	r0, #3768	; 0xeb8
90013560:	e3490002 	movt	r0, #36866	; 0x9002
90013564:	eb000783 	bl	90015378 <KPrintf>
    KPrintf("     r1: 0x%x\n", tf->r1);
90013568:	e51b3008 	ldr	r3, [fp, #-8]
9001356c:	e5933014 	ldr	r3, [r3, #20]
90013570:	e1a01003 	mov	r1, r3
90013574:	e3000ec8 	movw	r0, #3784	; 0xec8
90013578:	e3490002 	movt	r0, #36866	; 0x9002
9001357c:	eb00077d 	bl	90015378 <KPrintf>
    KPrintf("     r2: 0x%x\n", tf->r2);
90013580:	e51b3008 	ldr	r3, [fp, #-8]
90013584:	e5933018 	ldr	r3, [r3, #24]
90013588:	e1a01003 	mov	r1, r3
9001358c:	e3000ed8 	movw	r0, #3800	; 0xed8
90013590:	e3490002 	movt	r0, #36866	; 0x9002
90013594:	eb000777 	bl	90015378 <KPrintf>
    KPrintf("     r3: 0x%x\n", tf->r3);
90013598:	e51b3008 	ldr	r3, [fp, #-8]
9001359c:	e593301c 	ldr	r3, [r3, #28]
900135a0:	e1a01003 	mov	r1, r3
900135a4:	e3000ee8 	movw	r0, #3816	; 0xee8
900135a8:	e3490002 	movt	r0, #36866	; 0x9002
900135ac:	eb000771 	bl	90015378 <KPrintf>
    KPrintf("     r4: 0x%x\n", tf->r4);
900135b0:	e51b3008 	ldr	r3, [fp, #-8]
900135b4:	e5933020 	ldr	r3, [r3, #32]
900135b8:	e1a01003 	mov	r1, r3
900135bc:	e3000ef8 	movw	r0, #3832	; 0xef8
900135c0:	e3490002 	movt	r0, #36866	; 0x9002
900135c4:	eb00076b 	bl	90015378 <KPrintf>
    KPrintf("     r5: 0x%x\n", tf->r5);
900135c8:	e51b3008 	ldr	r3, [fp, #-8]
900135cc:	e5933024 	ldr	r3, [r3, #36]	; 0x24
900135d0:	e1a01003 	mov	r1, r3
900135d4:	e3000f08 	movw	r0, #3848	; 0xf08
900135d8:	e3490002 	movt	r0, #36866	; 0x9002
900135dc:	eb000765 	bl	90015378 <KPrintf>
    KPrintf("     r6: 0x%x\n", tf->r6);
900135e0:	e51b3008 	ldr	r3, [fp, #-8]
900135e4:	e5933028 	ldr	r3, [r3, #40]	; 0x28
900135e8:	e1a01003 	mov	r1, r3
900135ec:	e3000f18 	movw	r0, #3864	; 0xf18
900135f0:	e3490002 	movt	r0, #36866	; 0x9002
900135f4:	eb00075f 	bl	90015378 <KPrintf>
    KPrintf("     r7: 0x%x\n", tf->r7);
900135f8:	e51b3008 	ldr	r3, [fp, #-8]
900135fc:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
90013600:	e1a01003 	mov	r1, r3
90013604:	e3000f28 	movw	r0, #3880	; 0xf28
90013608:	e3490002 	movt	r0, #36866	; 0x9002
9001360c:	eb000759 	bl	90015378 <KPrintf>
    KPrintf("     r8: 0x%x\n", tf->r8);
90013610:	e51b3008 	ldr	r3, [fp, #-8]
90013614:	e5933030 	ldr	r3, [r3, #48]	; 0x30
90013618:	e1a01003 	mov	r1, r3
9001361c:	e3000f38 	movw	r0, #3896	; 0xf38
90013620:	e3490002 	movt	r0, #36866	; 0x9002
90013624:	eb000753 	bl	90015378 <KPrintf>
    KPrintf("     r9: 0x%x\n", tf->r9);
90013628:	e51b3008 	ldr	r3, [fp, #-8]
9001362c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
90013630:	e1a01003 	mov	r1, r3
90013634:	e3000f48 	movw	r0, #3912	; 0xf48
90013638:	e3490002 	movt	r0, #36866	; 0x9002
9001363c:	eb00074d 	bl	90015378 <KPrintf>
    KPrintf("    r10: 0x%x\n", tf->r10);
90013640:	e51b3008 	ldr	r3, [fp, #-8]
90013644:	e5933038 	ldr	r3, [r3, #56]	; 0x38
90013648:	e1a01003 	mov	r1, r3
9001364c:	e3000f58 	movw	r0, #3928	; 0xf58
90013650:	e3490002 	movt	r0, #36866	; 0x9002
90013654:	eb000747 	bl	90015378 <KPrintf>
    KPrintf("    r11: 0x%x\n", tf->r11);
90013658:	e51b3008 	ldr	r3, [fp, #-8]
9001365c:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
90013660:	e1a01003 	mov	r1, r3
90013664:	e3000f68 	movw	r0, #3944	; 0xf68
90013668:	e3490002 	movt	r0, #36866	; 0x9002
9001366c:	eb000741 	bl	90015378 <KPrintf>
    KPrintf("    r12: 0x%x\n", tf->r12);
90013670:	e51b3008 	ldr	r3, [fp, #-8]
90013674:	e5933040 	ldr	r3, [r3, #64]	; 0x40
90013678:	e1a01003 	mov	r1, r3
9001367c:	e3000f78 	movw	r0, #3960	; 0xf78
90013680:	e3490002 	movt	r0, #36866	; 0x9002
90013684:	eb00073b 	bl	90015378 <KPrintf>
    KPrintf("     pc: 0x%x\n", tf->pc);
90013688:	e51b3008 	ldr	r3, [fp, #-8]
9001368c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
90013690:	e1a01003 	mov	r1, r3
90013694:	e3000f88 	movw	r0, #3976	; 0xf88
90013698:	e3490002 	movt	r0, #36866	; 0x9002
9001369c:	eb000735 	bl	90015378 <KPrintf>
}
900136a0:	e320f000 	nop	{0}
900136a4:	e24bd004 	sub	sp, fp, #4
900136a8:	e8bd8800 	pop	{fp, pc}

900136ac <handle_undefined_instruction>:

void handle_undefined_instruction(struct trapframe* tf)
{
900136ac:	e92d4800 	push	{fp, lr}
900136b0:	e28db004 	add	fp, sp, #4
900136b4:	e24dd008 	sub	sp, sp, #8
900136b8:	e50b0008 	str	r0, [fp, #-8]
    // unimplemented trap handler
    KPrintf("undefined instruction at %x\n", tf->pc);
900136bc:	e51b3008 	ldr	r3, [fp, #-8]
900136c0:	e5933044 	ldr	r3, [r3, #68]	; 0x44
900136c4:	e1a01003 	mov	r1, r3
900136c8:	e3000f98 	movw	r0, #3992	; 0xf98
900136cc:	e3490002 	movt	r0, #36866	; 0x9002
900136d0:	eb000728 	bl	90015378 <KPrintf>
    panic("");
900136d4:	e3000fb8 	movw	r0, #4024	; 0xfb8
900136d8:	e3490002 	movt	r0, #36866	; 0x9002
900136dc:	ebfffe17 	bl	90012f40 <panic>
}
900136e0:	e320f000 	nop	{0}
900136e4:	e24bd004 	sub	sp, fp, #4
900136e8:	e8bd8800 	pop	{fp, pc}

900136ec <dabort_handler>:

void dabort_handler(struct trapframe* r)
{
900136ec:	e92d4810 	push	{r4, fp, lr}
900136f0:	e28db008 	add	fp, sp, #8
900136f4:	e24dd01c 	sub	sp, sp, #28
900136f8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    uint32_t dfs, dfa;

    __asm__ __volatile__("mrc p15, 0, %0, c5, c0, 0" : "=r"(dfs)::);
900136fc:	ee153f10 	mrc	15, 0, r3, cr5, cr0, {0}
90013700:	e50b3010 	str	r3, [fp, #-16]
    __asm__ __volatile__("mrc p15, 0, %0, c6, c0, 0" : "=r"(dfa)::);
90013704:	ee163f10 	mrc	15, 0, r3, cr6, cr0, {0}
90013708:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    if (r->pc < KERN_MEM_BASE) { // Exception occured in User space: exit
9001370c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90013710:	e5933044 	ldr	r3, [r3, #68]	; 0x44
90013714:	e3730217 	cmn	r3, #1879048193	; 0x70000001
90013718:	8a00005d 	bhi	90013894 <dabort_handler+0x1a8>
        ERROR("dabort in user space: %s\n", cur_cpu()->task->name);
9001371c:	e3a02066 	mov	r2, #102	; 0x66
90013720:	e3011160 	movw	r1, #4448	; 0x1160
90013724:	e3491002 	movt	r1, #36866	; 0x9002
90013728:	e3000fbc 	movw	r0, #4028	; 0xfbc
9001372c:	e3490002 	movt	r0, #36866	; 0x9002
90013730:	eb000710 	bl	90015378 <KPrintf>
90013734:	ebffff68 	bl	900134dc <cur_cpu>
90013738:	e1a03000 	mov	r3, r0
9001373c:	e5933004 	ldr	r3, [r3, #4]
90013740:	e2833094 	add	r3, r3, #148	; 0x94
90013744:	e1a01003 	mov	r1, r3
90013748:	e3000fcc 	movw	r0, #4044	; 0xfcc
9001374c:	e3490002 	movt	r0, #36866	; 0x9002
90013750:	eb000708 	bl	90015378 <KPrintf>
        LOG("program counter: 0x%x(%s) caused\n", r->pc, cur_cpu()->task);
90013754:	e3011160 	movw	r1, #4448	; 0x1160
90013758:	e3491002 	movt	r1, #36866	; 0x9002
9001375c:	e3000fe8 	movw	r0, #4072	; 0xfe8
90013760:	e3490002 	movt	r0, #36866	; 0x9002
90013764:	eb000703 	bl	90015378 <KPrintf>
90013768:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001376c:	e5934044 	ldr	r4, [r3, #68]	; 0x44
90013770:	ebffff59 	bl	900134dc <cur_cpu>
90013774:	e1a03000 	mov	r3, r0
90013778:	e5933004 	ldr	r3, [r3, #4]
9001377c:	e1a02003 	mov	r2, r3
90013780:	e1a01004 	mov	r1, r4
90013784:	e3000ff4 	movw	r0, #4084	; 0xff4
90013788:	e3490002 	movt	r0, #36866	; 0x9002
9001378c:	eb0006f9 	bl	90015378 <KPrintf>
        LOG("data abort at 0x%x, status 0x%x\n", dfa, dfs);
90013790:	e3011160 	movw	r1, #4448	; 0x1160
90013794:	e3491002 	movt	r1, #36866	; 0x9002
90013798:	e3000fe8 	movw	r0, #4072	; 0xfe8
9001379c:	e3490002 	movt	r0, #36866	; 0x9002
900137a0:	eb0006f4 	bl	90015378 <KPrintf>
900137a4:	e51b2010 	ldr	r2, [fp, #-16]
900137a8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
900137ac:	e3010018 	movw	r0, #4120	; 0x1018
900137b0:	e3490002 	movt	r0, #36866	; 0x9002
900137b4:	eb0006ef 	bl	90015378 <KPrintf>
900137b8:	e51b3010 	ldr	r3, [fp, #-16]
900137bc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    if ((fault_status & 0xd) == 0x1) // Alignment failure
900137c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900137c4:	e203300d 	and	r3, r3, #13
900137c8:	e3530001 	cmp	r3, #1
900137cc:	1a000003 	bne	900137e0 <dabort_handler+0xf4>
        KPrintf("reason: alignment\n");
900137d0:	e301003c 	movw	r0, #4156	; 0x103c
900137d4:	e3490002 	movt	r0, #36866	; 0x9002
900137d8:	eb0006e6 	bl	90015378 <KPrintf>
900137dc:	ea00002a 	b	9001388c <dabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x5) // External abort "on translation"
900137e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900137e4:	e203300d 	and	r3, r3, #13
900137e8:	e3530005 	cmp	r3, #5
900137ec:	1a000003 	bne	90013800 <dabort_handler+0x114>
        KPrintf("reason: ext. abort on trnslt.\n");
900137f0:	e3010050 	movw	r0, #4176	; 0x1050
900137f4:	e3490002 	movt	r0, #36866	; 0x9002
900137f8:	eb0006de 	bl	90015378 <KPrintf>
900137fc:	ea000022 	b	9001388c <dabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x5) // Translation
90013800:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013804:	e203300d 	and	r3, r3, #13
90013808:	e3530005 	cmp	r3, #5
9001380c:	1a000003 	bne	90013820 <dabort_handler+0x134>
        KPrintf("reason: sect. translation\n");
90013810:	e3010070 	movw	r0, #4208	; 0x1070
90013814:	e3490002 	movt	r0, #36866	; 0x9002
90013818:	eb0006d6 	bl	90015378 <KPrintf>
9001381c:	ea00001a 	b	9001388c <dabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x9) // Domain
90013820:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013824:	e203300d 	and	r3, r3, #13
90013828:	e3530009 	cmp	r3, #9
9001382c:	1a000003 	bne	90013840 <dabort_handler+0x154>
        KPrintf("reason: sect. domain\n");
90013830:	e301008c 	movw	r0, #4236	; 0x108c
90013834:	e3490002 	movt	r0, #36866	; 0x9002
90013838:	eb0006ce 	bl	90015378 <KPrintf>
9001383c:	ea000012 	b	9001388c <dabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0xd) // Permission
90013840:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013844:	e203300d 	and	r3, r3, #13
90013848:	e353000d 	cmp	r3, #13
9001384c:	1a000003 	bne	90013860 <dabort_handler+0x174>
        KPrintf("reason: sect. permission\n");
90013850:	e30100a4 	movw	r0, #4260	; 0x10a4
90013854:	e3490002 	movt	r0, #36866	; 0x9002
90013858:	eb0006c6 	bl	90015378 <KPrintf>
9001385c:	ea00000a 	b	9001388c <dabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x8) // External abort
90013860:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013864:	e203300d 	and	r3, r3, #13
90013868:	e3530008 	cmp	r3, #8
9001386c:	1a000003 	bne	90013880 <dabort_handler+0x194>
        KPrintf("reason: ext. abort\n");
90013870:	e30100c0 	movw	r0, #4288	; 0x10c0
90013874:	e3490002 	movt	r0, #36866	; 0x9002
90013878:	eb0006be 	bl	90015378 <KPrintf>
9001387c:	ea000002 	b	9001388c <dabort_handler+0x1a0>
        KPrintf("reason: unknown???\n");
90013880:	e30100d4 	movw	r0, #4308	; 0x10d4
90013884:	e3490002 	movt	r0, #36866	; 0x9002
90013888:	eb0006ba 	bl	90015378 <KPrintf>
        _abort_reason(dfs);
        dump_tf(r);
9001388c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90013890:	ebffff1e 	bl	90013510 <dump_tf>
    }
    if (cur_cpu()->task != NULL) {
90013894:	ebffff10 	bl	900134dc <cur_cpu>
90013898:	e1a03000 	mov	r3, r0
9001389c:	e5933004 	ldr	r3, [r3, #4]
900138a0:	e3530000 	cmp	r3, #0
900138a4:	0a000001 	beq	900138b0 <dabort_handler+0x1c4>
        sys_exit();
900138a8:	eb002cc3 	bl	9001ebbc <sys_exit>
        LOG("data abort at 0x%x, status 0x%x\n", dfa, dfs);
        _abort_reason(dfs);
        dump_tf(r);
        panic("data abort exception\n");
    }
}
900138ac:	ea000052 	b	900139fc <dabort_handler+0x310>
        LOG("program counter: 0x%x(%s) caused\n", r->pc, cur_cpu()->task);
900138b0:	e3011160 	movw	r1, #4448	; 0x1160
900138b4:	e3491002 	movt	r1, #36866	; 0x9002
900138b8:	e3000fe8 	movw	r0, #4072	; 0xfe8
900138bc:	e3490002 	movt	r0, #36866	; 0x9002
900138c0:	eb0006ac 	bl	90015378 <KPrintf>
900138c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900138c8:	e5934044 	ldr	r4, [r3, #68]	; 0x44
900138cc:	ebffff02 	bl	900134dc <cur_cpu>
900138d0:	e1a03000 	mov	r3, r0
900138d4:	e5933004 	ldr	r3, [r3, #4]
900138d8:	e1a02003 	mov	r2, r3
900138dc:	e1a01004 	mov	r1, r4
900138e0:	e3000ff4 	movw	r0, #4084	; 0xff4
900138e4:	e3490002 	movt	r0, #36866	; 0x9002
900138e8:	eb0006a2 	bl	90015378 <KPrintf>
        LOG("data abort at 0x%x, status 0x%x\n", dfa, dfs);
900138ec:	e3011160 	movw	r1, #4448	; 0x1160
900138f0:	e3491002 	movt	r1, #36866	; 0x9002
900138f4:	e3000fe8 	movw	r0, #4072	; 0xfe8
900138f8:	e3490002 	movt	r0, #36866	; 0x9002
900138fc:	eb00069d 	bl	90015378 <KPrintf>
90013900:	e51b2010 	ldr	r2, [fp, #-16]
90013904:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90013908:	e3010018 	movw	r0, #4120	; 0x1018
9001390c:	e3490002 	movt	r0, #36866	; 0x9002
90013910:	eb000698 	bl	90015378 <KPrintf>
90013914:	e51b3010 	ldr	r3, [fp, #-16]
90013918:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if ((fault_status & 0xd) == 0x1) // Alignment failure
9001391c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013920:	e203300d 	and	r3, r3, #13
90013924:	e3530001 	cmp	r3, #1
90013928:	1a000003 	bne	9001393c <dabort_handler+0x250>
        KPrintf("reason: alignment\n");
9001392c:	e301003c 	movw	r0, #4156	; 0x103c
90013930:	e3490002 	movt	r0, #36866	; 0x9002
90013934:	eb00068f 	bl	90015378 <KPrintf>
90013938:	ea00002a 	b	900139e8 <dabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x5) // External abort "on translation"
9001393c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013940:	e203300d 	and	r3, r3, #13
90013944:	e3530005 	cmp	r3, #5
90013948:	1a000003 	bne	9001395c <dabort_handler+0x270>
        KPrintf("reason: ext. abort on trnslt.\n");
9001394c:	e3010050 	movw	r0, #4176	; 0x1050
90013950:	e3490002 	movt	r0, #36866	; 0x9002
90013954:	eb000687 	bl	90015378 <KPrintf>
90013958:	ea000022 	b	900139e8 <dabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x5) // Translation
9001395c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013960:	e203300d 	and	r3, r3, #13
90013964:	e3530005 	cmp	r3, #5
90013968:	1a000003 	bne	9001397c <dabort_handler+0x290>
        KPrintf("reason: sect. translation\n");
9001396c:	e3010070 	movw	r0, #4208	; 0x1070
90013970:	e3490002 	movt	r0, #36866	; 0x9002
90013974:	eb00067f 	bl	90015378 <KPrintf>
90013978:	ea00001a 	b	900139e8 <dabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x9) // Domain
9001397c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013980:	e203300d 	and	r3, r3, #13
90013984:	e3530009 	cmp	r3, #9
90013988:	1a000003 	bne	9001399c <dabort_handler+0x2b0>
        KPrintf("reason: sect. domain\n");
9001398c:	e301008c 	movw	r0, #4236	; 0x108c
90013990:	e3490002 	movt	r0, #36866	; 0x9002
90013994:	eb000677 	bl	90015378 <KPrintf>
90013998:	ea000012 	b	900139e8 <dabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0xd) // Permission
9001399c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900139a0:	e203300d 	and	r3, r3, #13
900139a4:	e353000d 	cmp	r3, #13
900139a8:	1a000003 	bne	900139bc <dabort_handler+0x2d0>
        KPrintf("reason: sect. permission\n");
900139ac:	e30100a4 	movw	r0, #4260	; 0x10a4
900139b0:	e3490002 	movt	r0, #36866	; 0x9002
900139b4:	eb00066f 	bl	90015378 <KPrintf>
900139b8:	ea00000a 	b	900139e8 <dabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x8) // External abort
900139bc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900139c0:	e203300d 	and	r3, r3, #13
900139c4:	e3530008 	cmp	r3, #8
900139c8:	1a000003 	bne	900139dc <dabort_handler+0x2f0>
        KPrintf("reason: ext. abort\n");
900139cc:	e30100c0 	movw	r0, #4288	; 0x10c0
900139d0:	e3490002 	movt	r0, #36866	; 0x9002
900139d4:	eb000667 	bl	90015378 <KPrintf>
900139d8:	ea000002 	b	900139e8 <dabort_handler+0x2fc>
        KPrintf("reason: unknown???\n");
900139dc:	e30100d4 	movw	r0, #4308	; 0x10d4
900139e0:	e3490002 	movt	r0, #36866	; 0x9002
900139e4:	eb000663 	bl	90015378 <KPrintf>
        dump_tf(r);
900139e8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
900139ec:	ebfffec7 	bl	90013510 <dump_tf>
        panic("data abort exception\n");
900139f0:	e30100e8 	movw	r0, #4328	; 0x10e8
900139f4:	e3490002 	movt	r0, #36866	; 0x9002
900139f8:	ebfffd50 	bl	90012f40 <panic>
}
900139fc:	e320f000 	nop	{0}
90013a00:	e24bd008 	sub	sp, fp, #8
90013a04:	e8bd8810 	pop	{r4, fp, pc}

90013a08 <iabort_handler>:

void iabort_handler(struct trapframe* r)
{
90013a08:	e92d4810 	push	{r4, fp, lr}
90013a0c:	e28db008 	add	fp, sp, #8
90013a10:	e24dd01c 	sub	sp, sp, #28
90013a14:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    uint32_t ifs, ifa;

    __asm__ __volatile__("mrc p15, 0, %0, c5, c0, 1" : "=r"(ifs)::);
90013a18:	ee153f30 	mrc	15, 0, r3, cr5, cr0, {1}
90013a1c:	e50b3010 	str	r3, [fp, #-16]
    __asm__ __volatile__("mrc p15, 0, %0, c6, c0, 2" : "=r"(ifa)::);
90013a20:	ee163f50 	mrc	15, 0, r3, cr6, cr0, {2}
90013a24:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    if (r->pc < KERN_MEM_BASE) { // Exception occured in User space: exit
90013a28:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90013a2c:	e5933044 	ldr	r3, [r3, #68]	; 0x44
90013a30:	e3730217 	cmn	r3, #1879048193	; 0x70000001
90013a34:	8a00005d 	bhi	90013bb0 <iabort_handler+0x1a8>
        ERROR("iabort in user space: %s\n", cur_cpu()->task->name);
90013a38:	e3a0207f 	mov	r2, #127	; 0x7f
90013a3c:	e3011170 	movw	r1, #4464	; 0x1170
90013a40:	e3491002 	movt	r1, #36866	; 0x9002
90013a44:	e3000fbc 	movw	r0, #4028	; 0xfbc
90013a48:	e3490002 	movt	r0, #36866	; 0x9002
90013a4c:	eb000649 	bl	90015378 <KPrintf>
90013a50:	ebfffea1 	bl	900134dc <cur_cpu>
90013a54:	e1a03000 	mov	r3, r0
90013a58:	e5933004 	ldr	r3, [r3, #4]
90013a5c:	e2833094 	add	r3, r3, #148	; 0x94
90013a60:	e1a01003 	mov	r1, r3
90013a64:	e3010100 	movw	r0, #4352	; 0x1100
90013a68:	e3490002 	movt	r0, #36866	; 0x9002
90013a6c:	eb000641 	bl	90015378 <KPrintf>
        LOG("program counter: 0x%x(%s) caused\n", r->pc, cur_cpu()->task);
90013a70:	e3011170 	movw	r1, #4464	; 0x1170
90013a74:	e3491002 	movt	r1, #36866	; 0x9002
90013a78:	e3000fe8 	movw	r0, #4072	; 0xfe8
90013a7c:	e3490002 	movt	r0, #36866	; 0x9002
90013a80:	eb00063c 	bl	90015378 <KPrintf>
90013a84:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90013a88:	e5934044 	ldr	r4, [r3, #68]	; 0x44
90013a8c:	ebfffe92 	bl	900134dc <cur_cpu>
90013a90:	e1a03000 	mov	r3, r0
90013a94:	e5933004 	ldr	r3, [r3, #4]
90013a98:	e1a02003 	mov	r2, r3
90013a9c:	e1a01004 	mov	r1, r4
90013aa0:	e3000ff4 	movw	r0, #4084	; 0xff4
90013aa4:	e3490002 	movt	r0, #36866	; 0x9002
90013aa8:	eb000632 	bl	90015378 <KPrintf>
        LOG("prefetch abort at 0x%x, status 0x%x\n", ifa, ifs);
90013aac:	e3011170 	movw	r1, #4464	; 0x1170
90013ab0:	e3491002 	movt	r1, #36866	; 0x9002
90013ab4:	e3000fe8 	movw	r0, #4072	; 0xfe8
90013ab8:	e3490002 	movt	r0, #36866	; 0x9002
90013abc:	eb00062d 	bl	90015378 <KPrintf>
90013ac0:	e51b2010 	ldr	r2, [fp, #-16]
90013ac4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90013ac8:	e301011c 	movw	r0, #4380	; 0x111c
90013acc:	e3490002 	movt	r0, #36866	; 0x9002
90013ad0:	eb000628 	bl	90015378 <KPrintf>
90013ad4:	e51b3010 	ldr	r3, [fp, #-16]
90013ad8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    if ((fault_status & 0xd) == 0x1) // Alignment failure
90013adc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013ae0:	e203300d 	and	r3, r3, #13
90013ae4:	e3530001 	cmp	r3, #1
90013ae8:	1a000003 	bne	90013afc <iabort_handler+0xf4>
        KPrintf("reason: alignment\n");
90013aec:	e301003c 	movw	r0, #4156	; 0x103c
90013af0:	e3490002 	movt	r0, #36866	; 0x9002
90013af4:	eb00061f 	bl	90015378 <KPrintf>
90013af8:	ea00002a 	b	90013ba8 <iabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x5) // External abort "on translation"
90013afc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013b00:	e203300d 	and	r3, r3, #13
90013b04:	e3530005 	cmp	r3, #5
90013b08:	1a000003 	bne	90013b1c <iabort_handler+0x114>
        KPrintf("reason: ext. abort on trnslt.\n");
90013b0c:	e3010050 	movw	r0, #4176	; 0x1050
90013b10:	e3490002 	movt	r0, #36866	; 0x9002
90013b14:	eb000617 	bl	90015378 <KPrintf>
90013b18:	ea000022 	b	90013ba8 <iabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x5) // Translation
90013b1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013b20:	e203300d 	and	r3, r3, #13
90013b24:	e3530005 	cmp	r3, #5
90013b28:	1a000003 	bne	90013b3c <iabort_handler+0x134>
        KPrintf("reason: sect. translation\n");
90013b2c:	e3010070 	movw	r0, #4208	; 0x1070
90013b30:	e3490002 	movt	r0, #36866	; 0x9002
90013b34:	eb00060f 	bl	90015378 <KPrintf>
90013b38:	ea00001a 	b	90013ba8 <iabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x9) // Domain
90013b3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013b40:	e203300d 	and	r3, r3, #13
90013b44:	e3530009 	cmp	r3, #9
90013b48:	1a000003 	bne	90013b5c <iabort_handler+0x154>
        KPrintf("reason: sect. domain\n");
90013b4c:	e301008c 	movw	r0, #4236	; 0x108c
90013b50:	e3490002 	movt	r0, #36866	; 0x9002
90013b54:	eb000607 	bl	90015378 <KPrintf>
90013b58:	ea000012 	b	90013ba8 <iabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0xd) // Permission
90013b5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013b60:	e203300d 	and	r3, r3, #13
90013b64:	e353000d 	cmp	r3, #13
90013b68:	1a000003 	bne	90013b7c <iabort_handler+0x174>
        KPrintf("reason: sect. permission\n");
90013b6c:	e30100a4 	movw	r0, #4260	; 0x10a4
90013b70:	e3490002 	movt	r0, #36866	; 0x9002
90013b74:	eb0005ff 	bl	90015378 <KPrintf>
90013b78:	ea00000a 	b	90013ba8 <iabort_handler+0x1a0>
    else if ((fault_status & 0xd) == 0x8) // External abort
90013b7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90013b80:	e203300d 	and	r3, r3, #13
90013b84:	e3530008 	cmp	r3, #8
90013b88:	1a000003 	bne	90013b9c <iabort_handler+0x194>
        KPrintf("reason: ext. abort\n");
90013b8c:	e30100c0 	movw	r0, #4288	; 0x10c0
90013b90:	e3490002 	movt	r0, #36866	; 0x9002
90013b94:	eb0005f7 	bl	90015378 <KPrintf>
90013b98:	ea000002 	b	90013ba8 <iabort_handler+0x1a0>
        KPrintf("reason: unknown???\n");
90013b9c:	e30100d4 	movw	r0, #4308	; 0x10d4
90013ba0:	e3490002 	movt	r0, #36866	; 0x9002
90013ba4:	eb0005f3 	bl	90015378 <KPrintf>
        _abort_reason(ifs);
        dump_tf(r);
90013ba8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90013bac:	ebfffe57 	bl	90013510 <dump_tf>
    }
    if (cur_cpu()->task != NULL) {
90013bb0:	ebfffe49 	bl	900134dc <cur_cpu>
90013bb4:	e1a03000 	mov	r3, r0
90013bb8:	e5933004 	ldr	r3, [r3, #4]
90013bbc:	e3530000 	cmp	r3, #0
90013bc0:	0a000001 	beq	90013bcc <iabort_handler+0x1c4>
        sys_exit();
90013bc4:	eb002bfc 	bl	9001ebbc <sys_exit>
        LOG("prefetch abort at 0x%x, status 0x%x\n", ifa, ifs);
        _abort_reason(ifs);
        dump_tf(r);
        panic("prefetch abort exception\n");
    }
}
90013bc8:	ea000052 	b	90013d18 <iabort_handler+0x310>
        LOG("program counter: 0x%x(%s) caused\n", r->pc, cur_cpu()->task);
90013bcc:	e3011170 	movw	r1, #4464	; 0x1170
90013bd0:	e3491002 	movt	r1, #36866	; 0x9002
90013bd4:	e3000fe8 	movw	r0, #4072	; 0xfe8
90013bd8:	e3490002 	movt	r0, #36866	; 0x9002
90013bdc:	eb0005e5 	bl	90015378 <KPrintf>
90013be0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90013be4:	e5934044 	ldr	r4, [r3, #68]	; 0x44
90013be8:	ebfffe3b 	bl	900134dc <cur_cpu>
90013bec:	e1a03000 	mov	r3, r0
90013bf0:	e5933004 	ldr	r3, [r3, #4]
90013bf4:	e1a02003 	mov	r2, r3
90013bf8:	e1a01004 	mov	r1, r4
90013bfc:	e3000ff4 	movw	r0, #4084	; 0xff4
90013c00:	e3490002 	movt	r0, #36866	; 0x9002
90013c04:	eb0005db 	bl	90015378 <KPrintf>
        LOG("prefetch abort at 0x%x, status 0x%x\n", ifa, ifs);
90013c08:	e3011170 	movw	r1, #4464	; 0x1170
90013c0c:	e3491002 	movt	r1, #36866	; 0x9002
90013c10:	e3000fe8 	movw	r0, #4072	; 0xfe8
90013c14:	e3490002 	movt	r0, #36866	; 0x9002
90013c18:	eb0005d6 	bl	90015378 <KPrintf>
90013c1c:	e51b2010 	ldr	r2, [fp, #-16]
90013c20:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90013c24:	e301011c 	movw	r0, #4380	; 0x111c
90013c28:	e3490002 	movt	r0, #36866	; 0x9002
90013c2c:	eb0005d1 	bl	90015378 <KPrintf>
90013c30:	e51b3010 	ldr	r3, [fp, #-16]
90013c34:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if ((fault_status & 0xd) == 0x1) // Alignment failure
90013c38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013c3c:	e203300d 	and	r3, r3, #13
90013c40:	e3530001 	cmp	r3, #1
90013c44:	1a000003 	bne	90013c58 <iabort_handler+0x250>
        KPrintf("reason: alignment\n");
90013c48:	e301003c 	movw	r0, #4156	; 0x103c
90013c4c:	e3490002 	movt	r0, #36866	; 0x9002
90013c50:	eb0005c8 	bl	90015378 <KPrintf>
90013c54:	ea00002a 	b	90013d04 <iabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x5) // External abort "on translation"
90013c58:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013c5c:	e203300d 	and	r3, r3, #13
90013c60:	e3530005 	cmp	r3, #5
90013c64:	1a000003 	bne	90013c78 <iabort_handler+0x270>
        KPrintf("reason: ext. abort on trnslt.\n");
90013c68:	e3010050 	movw	r0, #4176	; 0x1050
90013c6c:	e3490002 	movt	r0, #36866	; 0x9002
90013c70:	eb0005c0 	bl	90015378 <KPrintf>
90013c74:	ea000022 	b	90013d04 <iabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x5) // Translation
90013c78:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013c7c:	e203300d 	and	r3, r3, #13
90013c80:	e3530005 	cmp	r3, #5
90013c84:	1a000003 	bne	90013c98 <iabort_handler+0x290>
        KPrintf("reason: sect. translation\n");
90013c88:	e3010070 	movw	r0, #4208	; 0x1070
90013c8c:	e3490002 	movt	r0, #36866	; 0x9002
90013c90:	eb0005b8 	bl	90015378 <KPrintf>
90013c94:	ea00001a 	b	90013d04 <iabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x9) // Domain
90013c98:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013c9c:	e203300d 	and	r3, r3, #13
90013ca0:	e3530009 	cmp	r3, #9
90013ca4:	1a000003 	bne	90013cb8 <iabort_handler+0x2b0>
        KPrintf("reason: sect. domain\n");
90013ca8:	e301008c 	movw	r0, #4236	; 0x108c
90013cac:	e3490002 	movt	r0, #36866	; 0x9002
90013cb0:	eb0005b0 	bl	90015378 <KPrintf>
90013cb4:	ea000012 	b	90013d04 <iabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0xd) // Permission
90013cb8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013cbc:	e203300d 	and	r3, r3, #13
90013cc0:	e353000d 	cmp	r3, #13
90013cc4:	1a000003 	bne	90013cd8 <iabort_handler+0x2d0>
        KPrintf("reason: sect. permission\n");
90013cc8:	e30100a4 	movw	r0, #4260	; 0x10a4
90013ccc:	e3490002 	movt	r0, #36866	; 0x9002
90013cd0:	eb0005a8 	bl	90015378 <KPrintf>
90013cd4:	ea00000a 	b	90013d04 <iabort_handler+0x2fc>
    else if ((fault_status & 0xd) == 0x8) // External abort
90013cd8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90013cdc:	e203300d 	and	r3, r3, #13
90013ce0:	e3530008 	cmp	r3, #8
90013ce4:	1a000003 	bne	90013cf8 <iabort_handler+0x2f0>
        KPrintf("reason: ext. abort\n");
90013ce8:	e30100c0 	movw	r0, #4288	; 0x10c0
90013cec:	e3490002 	movt	r0, #36866	; 0x9002
90013cf0:	eb0005a0 	bl	90015378 <KPrintf>
90013cf4:	ea000002 	b	90013d04 <iabort_handler+0x2fc>
        KPrintf("reason: unknown???\n");
90013cf8:	e30100d4 	movw	r0, #4308	; 0x10d4
90013cfc:	e3490002 	movt	r0, #36866	; 0x9002
90013d00:	eb00059c 	bl	90015378 <KPrintf>
        dump_tf(r);
90013d04:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90013d08:	ebfffe00 	bl	90013510 <dump_tf>
        panic("prefetch abort exception\n");
90013d0c:	e3010144 	movw	r0, #4420	; 0x1144
90013d10:	e3490002 	movt	r0, #36866	; 0x9002
90013d14:	ebfffc89 	bl	90012f40 <panic>
}
90013d18:	e320f000 	nop	{0}
90013d1c:	e24bd008 	sub	sp, fp, #8
90013d20:	e8bd8810 	pop	{r4, fp, pc}

90013d24 <module_spinlock_use_intr_init>:

#include "assert.h"
#include "spinlock.h"

bool module_spinlock_use_intr_init(void)
{
90013d24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90013d28:	e28db000 	add	fp, sp, #0
    return true;
90013d2c:	e3a03001 	mov	r3, #1
}
90013d30:	e1a00003 	mov	r0, r3
90013d34:	e28bd000 	add	sp, fp, #0
90013d38:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90013d3c:	e12fff1e 	bx	lr

90013d40 <spinlock_init>:
    SPINLOCK_LOCK_NOWAIT = 0,
    SPINLOCK_LOCK_WAITFOREVER = 0xFFFFFFFF,
};

void spinlock_init(struct spinlock* lock, char* name)
{
90013d40:	e92d4800 	push	{fp, lr}
90013d44:	e28db004 	add	fp, sp, #4
90013d48:	e24dd008 	sub	sp, sp, #8
90013d4c:	e50b0008 	str	r0, [fp, #-8]
90013d50:	e50b100c 	str	r1, [fp, #-12]
    lock->owner_cpu = SPINLOCK_STATE_UNLOCK;
90013d54:	e51b3008 	ldr	r3, [fp, #-8]
90013d58:	e3a020ff 	mov	r2, #255	; 0xff
90013d5c:	e5832000 	str	r2, [r3]
    strncpy(lock->name, name, 24);
90013d60:	e51b3008 	ldr	r3, [fp, #-8]
90013d64:	e2833004 	add	r3, r3, #4
90013d68:	e3a02018 	mov	r2, #24
90013d6c:	e51b100c 	ldr	r1, [fp, #-12]
90013d70:	e1a00003 	mov	r0, r3
90013d74:	fa003365 	blx	90020b10 <strncpy>
}
90013d78:	e320f000 	nop	{0}
90013d7c:	e24bd004 	sub	sp, fp, #4
90013d80:	e8bd8800 	pop	{fp, pc}

90013d84 <spinlock_lock>:

extern int _spinlock_lock(struct spinlock* lock, uint32_t timeout);
void spinlock_lock(struct spinlock* lock)
{
90013d84:	e92d4800 	push	{fp, lr}
90013d88:	e28db004 	add	fp, sp, #4
90013d8c:	e24dd008 	sub	sp, sp, #8
90013d90:	e50b0008 	str	r0, [fp, #-8]
    if (lock->owner_cpu != SPINLOCK_STATE_UNLOCK) {
90013d94:	e51b3008 	ldr	r3, [fp, #-8]
90013d98:	e5933000 	ldr	r3, [r3]
90013d9c:	e35300ff 	cmp	r3, #255	; 0xff
90013da0:	0a000010 	beq	90013de8 <spinlock_lock+0x64>
        ERROR("spinlock %s lock double locked by core %d\n", lock->name, lock->owner_cpu);
90013da4:	e3a0202f 	mov	r2, #47	; 0x2f
90013da8:	e301120c 	movw	r1, #4620	; 0x120c
90013dac:	e3491002 	movt	r1, #36866	; 0x9002
90013db0:	e3010180 	movw	r0, #4480	; 0x1180
90013db4:	e3490002 	movt	r0, #36866	; 0x9002
90013db8:	eb00056e 	bl	90015378 <KPrintf>
90013dbc:	e51b3008 	ldr	r3, [fp, #-8]
90013dc0:	e2831004 	add	r1, r3, #4
90013dc4:	e51b3008 	ldr	r3, [fp, #-8]
90013dc8:	e5933000 	ldr	r3, [r3]
90013dcc:	e1a02003 	mov	r2, r3
90013dd0:	e3010190 	movw	r0, #4496	; 0x1190
90013dd4:	e3490002 	movt	r0, #36866	; 0x9002
90013dd8:	eb000566 	bl	90015378 <KPrintf>
        panic("");
90013ddc:	e30101bc 	movw	r0, #4540	; 0x11bc
90013de0:	e3490002 	movt	r0, #36866	; 0x9002
90013de4:	ebfffc55 	bl	90012f40 <panic>
    }
    assert(_spinlock_lock(lock, SPINLOCK_LOCK_WAITFOREVER) == 0);
90013de8:	e3e01000 	mvn	r1, #0
90013dec:	e51b0008 	ldr	r0, [fp, #-8]
90013df0:	eb0000cd 	bl	9001412c <_spinlock_lock>
90013df4:	e1a03000 	mov	r3, r0
90013df8:	e3530000 	cmp	r3, #0
90013dfc:	0a00000d 	beq	90013e38 <spinlock_lock+0xb4>
90013e00:	e3a02032 	mov	r2, #50	; 0x32
90013e04:	e301120c 	movw	r1, #4620	; 0x120c
90013e08:	e3491002 	movt	r1, #36866	; 0x9002
90013e0c:	e3010180 	movw	r0, #4480	; 0x1180
90013e10:	e3490002 	movt	r0, #36866	; 0x9002
90013e14:	eb000557 	bl	90015378 <KPrintf>
90013e18:	e30111c0 	movw	r1, #4544	; 0x11c0
90013e1c:	e3491002 	movt	r1, #36866	; 0x9002
90013e20:	e30101f8 	movw	r0, #4600	; 0x11f8
90013e24:	e3490002 	movt	r0, #36866	; 0x9002
90013e28:	eb000552 	bl	90015378 <KPrintf>
90013e2c:	e3010208 	movw	r0, #4616	; 0x1208
90013e30:	e3490002 	movt	r0, #36866	; 0x9002
90013e34:	ebfffc41 	bl	90012f40 <panic>
}
90013e38:	e320f000 	nop	{0}
90013e3c:	e24bd004 	sub	sp, fp, #4
90013e40:	e8bd8800 	pop	{fp, pc}

90013e44 <spinlock_unlock>:

void _spinlock_unlock(struct spinlock* lock);
void spinlock_unlock(struct spinlock* lock)
{
90013e44:	e92d4800 	push	{fp, lr}
90013e48:	e28db004 	add	fp, sp, #4
90013e4c:	e24dd008 	sub	sp, sp, #8
90013e50:	e50b0008 	str	r0, [fp, #-8]
    _spinlock_unlock(lock);
90013e54:	e51b0008 	ldr	r0, [fp, #-8]
90013e58:	eb0000bf 	bl	9001415c <_spinlock_unlock>
90013e5c:	e320f000 	nop	{0}
90013e60:	e24bd004 	sub	sp, fp, #4
90013e64:	e8bd8800 	pop	{fp, pc}

90013e68 <trap_return>:
.globl trap_undefined_instruction
.globl init_stack

trap_return:
	# restore context from trapframe
	ldm 	r13, 	{sp, lr}^ 
90013e68:	e8dd6000 	ldm	sp, {sp, lr}^
	add     r13, 	r13, #8
90013e6c:	e28dd008 	add	sp, sp, #8
	ldmfd   r13!, 	{r14}         	
90013e70:	e8bd4000 	ldmfd	sp!, {lr}
	ldmfd   r13!, 	{r2}          	
90013e74:	e8bd0004 	ldmfd	sp!, {r2}
	msr     spsr_cxsf, r2
90013e78:	e16ff002 	msr	SPSR_fsxc, r2
	ldr 	r0, [r13], #4
90013e7c:	e49d0004 	pop	{r0}		; (ldr r0, [sp], #4)
	ldr 	r1, [r13], #4
90013e80:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
	ldr 	r2, [r13], #4
90013e84:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
	ldr 	r3, [r13], #4
90013e88:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
	ldr 	r4, [r13], #4
90013e8c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
	ldr 	r5, [r13], #4
90013e90:	e49d5004 	pop	{r5}		; (ldr r5, [sp], #4)
	ldr 	r6, [r13], #4
90013e94:	e49d6004 	pop	{r6}		; (ldr r6, [sp], #4)
	ldr 	r7, [r13], #4
90013e98:	e49d7004 	pop	{r7}		; (ldr r7, [sp], #4)
	ldr 	r8, [r13], #4
90013e9c:	e49d8004 	pop	{r8}		; (ldr r8, [sp], #4)
	ldr 	r9, [r13], #4
90013ea0:	e49d9004 	pop	{r9}		; (ldr r9, [sp], #4)
	ldr 	r10, [r13], #4
90013ea4:	e49da004 	pop	{sl}		; (ldr sl, [sp], #4)
	ldr 	r11, [r13], #4
90013ea8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
	ldr 	r12, [r13], #4
90013eac:	e49dc004 	pop	{ip}		; (ldr ip, [sp], #4)
	ldm 	r13!, {pc}^
90013eb0:	e8fd8000 	ldm	sp!, {pc}^

90013eb4 <user_trap_swi_enter>:

user_trap_swi_enter:
    # save trapframe to swi stack
    sub 	sp, sp, #56     
90013eb4:	e24dd038 	sub	sp, sp, #56	; 0x38
	str 	r14, [sp, #52]  
90013eb8:	e58de034 	str	lr, [sp, #52]	; 0x34
	str 	r12, [sp, #48] 
90013ebc:	e58dc030 	str	ip, [sp, #48]	; 0x30
	str 	r11, [sp, #44] 
90013ec0:	e58db02c 	str	fp, [sp, #44]	; 0x2c
	str 	r10, [sp, #40]
90013ec4:	e58da028 	str	sl, [sp, #40]	; 0x28
	str 	r9, [sp, #36] 
90013ec8:	e58d9024 	str	r9, [sp, #36]	; 0x24
	str 	r8, [sp, #32]  
90013ecc:	e58d8020 	str	r8, [sp, #32]
	str 	r7, [sp, #28]  
90013ed0:	e58d701c 	str	r7, [sp, #28]
	str 	r6, [sp, #24] 
90013ed4:	e58d6018 	str	r6, [sp, #24]
	str 	r5, [sp, #20] 
90013ed8:	e58d5014 	str	r5, [sp, #20]
	str 	r4, [sp, #16]
90013edc:	e58d4010 	str	r4, [sp, #16]
	str 	r3, [sp, #12]
90013ee0:	e58d300c 	str	r3, [sp, #12]
	str 	r2, [sp, #8]
90013ee4:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [sp, #4]
90013ee8:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [sp]
90013eec:	e58d0000 	str	r0, [sp]

	mrs     r2, 	spsr            
90013ef0:	e14f2000 	mrs	r2, SPSR
	stmfd   r13!, 	{r2}       
90013ef4:	e92d0004 	stmfd	sp!, {r2}
	stmfd   r13!, 	{r14}         	
90013ef8:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^    
90013efc:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
90013f00:	e24dd008 	sub	sp, sp, #8

    # call syscall handler
	mov     r0, 	r13    			
90013f04:	e1a0000d 	mov	r0, sp
    bl		software_irq_dispatch
90013f08:	eb001d4e 	bl	9001b448 <software_irq_dispatch>
	b		trap_return
90013f0c:	eaffffd5 	b	90013e68 <trap_return>

90013f10 <trap_irq_enter>:

trap_irq_enter:
	# save context in irq stack
	sub     r14, 	r14, #4
90013f10:	e24ee004 	sub	lr, lr, #4
	sub 	sp, sp, #16   
90013f14:	e24dd010 	sub	sp, sp, #16
	str 	r14, [sp, #12]
90013f18:	e58de00c 	str	lr, [sp, #12]
	str 	r2, [sp, #8]
90013f1c:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [sp, #4] 
90013f20:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [sp] 
90013f24:	e58d0000 	str	r0, [sp]

	mrs     r1, 	spsr
90013f28:	e14f1000 	mrs	r1, SPSR
	mov     r0, 	r13          	// irq stack stop
90013f2c:	e1a0000d 	mov	r0, sp
	add     r13,	r13, #16    	// reset IRQ stack
90013f30:	e28dd010 	add	sp, sp, #16

	# switch to the SVC mode
	mrs     r2, 	cpsr
90013f34:	e10f2000 	mrs	r2, CPSR
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
90013f38:	e3c2201f 	bic	r2, r2, #31
	orr     r2, 	r2, #ARM_MODE_SVC
90013f3c:	e3822013 	orr	r2, r2, #19
	msr     cpsr_cxsf, r2
90013f40:	e12ff002 	msr	CPSR_fsxc, r2

	# build the trap frame
	ldr     r2, 	[r0, #12]
90013f44:	e590200c 	ldr	r2, [r0, #12]
	stmfd   r13!, 	{r2}
90013f48:	e92d0004 	stmfd	sp!, {r2}
	sub 	r13, r13, #40   
90013f4c:	e24dd028 	sub	sp, sp, #40	; 0x28
	str 	r12, [r13, #36] 
90013f50:	e58dc024 	str	ip, [sp, #36]	; 0x24
	str 	r11, [r13, #32]
90013f54:	e58db020 	str	fp, [sp, #32]
	str 	r10, [r13, #28]
90013f58:	e58da01c 	str	sl, [sp, #28]
	str 	r9, [r13, #24]
90013f5c:	e58d9018 	str	r9, [sp, #24]
	str 	r8, [r13, #20]
90013f60:	e58d8014 	str	r8, [sp, #20]
	str 	r7, [r13, #16]
90013f64:	e58d7010 	str	r7, [sp, #16]
	str 	r6, [r13, #12]
90013f68:	e58d600c 	str	r6, [sp, #12]
	str 	r5, [r13, #8]
90013f6c:	e58d5008 	str	r5, [sp, #8]
	str 	r4, [r13, #4]
90013f70:	e58d4004 	str	r4, [sp, #4]
	str 	r3, [r13] 
90013f74:	e58d3000 	str	r3, [sp]

	ldmfd   r0, 	{r3-r5}     	
90013f78:	e8900038 	ldm	r0, {r3, r4, r5}
	stmfd   r13!, 	{r3-r5}
90013f7c:	e92d0038 	push	{r3, r4, r5}
	stmfd   r13!, 	{r1}  
90013f80:	e92d0002 	stmfd	sp!, {r1}
	stmfd   r13!, 	{lr} 
90013f84:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^ 
90013f88:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
90013f8c:	e24dd008 	sub	sp, sp, #8

	mov     r0, 	r13           	// trapframe as parameters
90013f90:	e1a0000d 	mov	r0, sp
	bl      intr_irq_dispatch
90013f94:	eb001c06 	bl	9001afb4 <intr_irq_dispatch>
	b   	trap_return
90013f98:	eaffffb2 	b	90013e68 <trap_return>

90013f9c <trap_reset_enter>:

trap_reset_enter:
	mov     r14, 	#0 
90013f9c:	e3a0e000 	mov	lr, #0
	sub 	r13, r13, #56
90013fa0:	e24dd038 	sub	sp, sp, #56	; 0x38
	str 	r14, [r13, #52]
90013fa4:	e58de034 	str	lr, [sp, #52]	; 0x34
	str 	r12, [r13, #48]
90013fa8:	e58dc030 	str	ip, [sp, #48]	; 0x30
	str 	r11, [r13, #44]
90013fac:	e58db02c 	str	fp, [sp, #44]	; 0x2c
	str 	r10, [r13, #40]
90013fb0:	e58da028 	str	sl, [sp, #40]	; 0x28
	str 	r9, [r13, #36]
90013fb4:	e58d9024 	str	r9, [sp, #36]	; 0x24
	str 	r8, [r13, #32]
90013fb8:	e58d8020 	str	r8, [sp, #32]
	str 	r7, [r13, #28]
90013fbc:	e58d701c 	str	r7, [sp, #28]
	str 	r6, [r13, #24]
90013fc0:	e58d6018 	str	r6, [sp, #24]
	str 	r5, [r13, #20]
90013fc4:	e58d5014 	str	r5, [sp, #20]
	str 	r4, [r13, #16]
90013fc8:	e58d4010 	str	r4, [sp, #16]
	str 	r3, [r13, #12]
90013fcc:	e58d300c 	str	r3, [sp, #12]
	str 	r2, [r13, #8]
90013fd0:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [r13, #4]
90013fd4:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [r13]
90013fd8:	e58d0000 	str	r0, [sp]

	mrs     r2, 	spsr       
90013fdc:	e14f2000 	mrs	r2, SPSR
	stmfd   r13!, 	{r2}       	
90013fe0:	e92d0004 	stmfd	sp!, {r2}
	stmfd   r13!, 	{r14}      
90013fe4:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^  
90013fe8:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
90013fec:	e24dd008 	sub	sp, sp, #8
	mov     r0, 	r13
90013ff0:	e1a0000d 	mov	r0, sp
	bl      _vector_jumper
90013ff4:	ebfff001 	bl	90010000 <_vector_jumper>

90013ff8 <trap_dabort>:

trap_dabort:
	sub     r14, 	r14, #8
90013ff8:	e24ee008 	sub	lr, lr, #8
	sub 	r13, r13, #56
90013ffc:	e24dd038 	sub	sp, sp, #56	; 0x38
	str 	r14, [r13, #52]
90014000:	e58de034 	str	lr, [sp, #52]	; 0x34
	str 	r12, [r13, #48]
90014004:	e58dc030 	str	ip, [sp, #48]	; 0x30
	str 	r11, [r13, #44]
90014008:	e58db02c 	str	fp, [sp, #44]	; 0x2c
	str 	r10, [r13, #40]
9001400c:	e58da028 	str	sl, [sp, #40]	; 0x28
	str 	r9, [r13, #36]
90014010:	e58d9024 	str	r9, [sp, #36]	; 0x24
	str 	r8, [r13, #32]
90014014:	e58d8020 	str	r8, [sp, #32]
	str 	r7, [r13, #28]
90014018:	e58d701c 	str	r7, [sp, #28]
	str 	r6, [r13, #24]
9001401c:	e58d6018 	str	r6, [sp, #24]
	str 	r5, [r13, #20]
90014020:	e58d5014 	str	r5, [sp, #20]
	str 	r4, [r13, #16]
90014024:	e58d4010 	str	r4, [sp, #16]
	str 	r3, [r13, #12]
90014028:	e58d300c 	str	r3, [sp, #12]
	str 	r2, [r13, #8]
9001402c:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [r13, #4]
90014030:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [r13]
90014034:	e58d0000 	str	r0, [sp]

	mrs     r2, 	spsr 
90014038:	e14f2000 	mrs	r2, SPSR
	stmfd   r13!, 	{r2}     
9001403c:	e92d0004 	stmfd	sp!, {r2}
	stmfd   r13!, 	{r14} 
90014040:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^ 
90014044:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
90014048:	e24dd008 	sub	sp, sp, #8
	mov     r0, 	r13
9001404c:	e1a0000d 	mov	r0, sp
	bl      dabort_handler
90014050:	ebfffda5 	bl	900136ec <dabort_handler>

90014054 <trap_iabort>:

trap_iabort:
	sub     r14, 	r14, #4
90014054:	e24ee004 	sub	lr, lr, #4
	sub 	r13, r13, #56
90014058:	e24dd038 	sub	sp, sp, #56	; 0x38
	str 	r14, [r13, #52]
9001405c:	e58de034 	str	lr, [sp, #52]	; 0x34
	str 	r12, [r13, #48]
90014060:	e58dc030 	str	ip, [sp, #48]	; 0x30
	str 	r11, [r13, #44]
90014064:	e58db02c 	str	fp, [sp, #44]	; 0x2c
	str 	r10, [r13, #40]
90014068:	e58da028 	str	sl, [sp, #40]	; 0x28
	str 	r9, [r13, #36]
9001406c:	e58d9024 	str	r9, [sp, #36]	; 0x24
	str 	r8, [r13, #32]
90014070:	e58d8020 	str	r8, [sp, #32]
	str 	r7, [r13, #28]
90014074:	e58d701c 	str	r7, [sp, #28]
	str 	r6, [r13, #24]
90014078:	e58d6018 	str	r6, [sp, #24]
	str 	r5, [r13, #20]
9001407c:	e58d5014 	str	r5, [sp, #20]
	str 	r4, [r13, #16]
90014080:	e58d4010 	str	r4, [sp, #16]
	str 	r3, [r13, #12]
90014084:	e58d300c 	str	r3, [sp, #12]
	str 	r2, [r13, #8]
90014088:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [r13, #4]
9001408c:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [r13]
90014090:	e58d0000 	str	r0, [sp]

	mrs     r2, 	spsr
90014094:	e14f2000 	mrs	r2, SPSR
	stmfd   r13!, 	{r2}
90014098:	e92d0004 	stmfd	sp!, {r2}
	stmfd   r13!, 	{r14}
9001409c:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^
900140a0:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
900140a4:	e24dd008 	sub	sp, sp, #8
	mov     r0, 	r13 
900140a8:	e1a0000d 	mov	r0, sp
	bl      iabort_handler
900140ac:	ebfffe55 	bl	90013a08 <iabort_handler>

900140b0 <trap_undefined_instruction>:

trap_undefined_instruction:
	sub 	r13, r13, #56
900140b0:	e24dd038 	sub	sp, sp, #56	; 0x38
	str 	r14, [r13, #52]
900140b4:	e58de034 	str	lr, [sp, #52]	; 0x34
	str 	r12, [r13, #48]
900140b8:	e58dc030 	str	ip, [sp, #48]	; 0x30
	str 	r11, [r13, #44]
900140bc:	e58db02c 	str	fp, [sp, #44]	; 0x2c
	str 	r10, [r13, #40]
900140c0:	e58da028 	str	sl, [sp, #40]	; 0x28
	str 	r9, [r13, #36]
900140c4:	e58d9024 	str	r9, [sp, #36]	; 0x24
	str 	r8, [r13, #32]
900140c8:	e58d8020 	str	r8, [sp, #32]
	str 	r7, [r13, #28]
900140cc:	e58d701c 	str	r7, [sp, #28]
	str 	r6, [r13, #24]
900140d0:	e58d6018 	str	r6, [sp, #24]
	str 	r5, [r13, #20]
900140d4:	e58d5014 	str	r5, [sp, #20]
	str 	r4, [r13, #16]
900140d8:	e58d4010 	str	r4, [sp, #16]
	str 	r3, [r13, #12]
900140dc:	e58d300c 	str	r3, [sp, #12]
	str 	r2, [r13, #8]
900140e0:	e58d2008 	str	r2, [sp, #8]
	str 	r1, [r13, #4]
900140e4:	e58d1004 	str	r1, [sp, #4]
	str 	r0, [r13]
900140e8:	e58d0000 	str	r0, [sp]

	mrs     r2, 	spsr 
900140ec:	e14f2000 	mrs	r2, SPSR
	stmfd   r13!, 	{r2}
900140f0:	e92d0004 	stmfd	sp!, {r2}
	stmfd   r13!, 	{r14}
900140f4:	e92d4000 	stmfd	sp!, {lr}
	stmfd   r13, 	{sp, lr}^
900140f8:	e94d6000 	stmdb	sp, {sp, lr}^
	sub     r13, 	r13, #8
900140fc:	e24dd008 	sub	sp, sp, #8
	mov     r0, 	r13
90014100:	e1a0000d 	mov	r0, sp
	bl      handle_undefined_instruction
90014104:	ebfffd68 	bl	900136ac <handle_undefined_instruction>

90014108 <init_stack>:


init_stack:
	# set the stack for Other mode
	mrs     r2, 	cpsr
90014108:	e10f2000 	mrs	r2, CPSR
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
9001410c:	e3c2201f 	bic	r2, r2, #31
	orr     r2, 	r2, r0
90014110:	e1822000 	orr	r2, r2, r0
	msr     cpsr_cxsf, r2
90014114:	e12ff002 	msr	CPSR_fsxc, r2

	# switch back to the SVC mode
	mov     sp, 	r1
90014118:	e1a0d001 	mov	sp, r1
	bic     r2, 	r2, #ARM_CPSR_MODE_MASK
9001411c:	e3c2201f 	bic	r2, r2, #31
	orr     r2, 	r2, #ARM_MODE_SVC
90014120:	e3822013 	orr	r2, r2, #19
	msr     cpsr_cxsf, r2
90014124:	e12ff002 	msr	CPSR_fsxc, r2
90014128:	e12fff1e 	bx	lr

9001412c <_spinlock_lock>:
// int spinlock_lock(spinlock_t * lock, uint32_t timeout)
    .global _spinlock_lock
    .func _spinlock_lock
_spinlock_lock:

    ldrex   r1, [r0]                // check if the spinlock is currently unlocked
9001412c:	e1901f9f 	ldrex	r1, [r0]
    cmp     r1, #UNLOCKED
90014130:	e35100ff 	cmp	r1, #255	; 0xff
    
    wfene                           // wait for an event signal
90014134:	1320f002 	wfene
    bne     _spinlock_lock
90014138:	1afffffb 	bne	9001412c <_spinlock_lock>
    
    mrc     p15, 0, r1, c0, c0, 5   // get our CPU ID
9001413c:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
    and     r1, r1, #3
90014140:	e2011003 	and	r1, r1, #3
    strex   r2, r1, [r0]            // attempt to grab lock by writing CPU number into spinlock
90014144:	e1802f91 	strex	r2, r1, [r0]
    cmp     r2, #0                  // check if the write was successful
90014148:	e3520000 	cmp	r2, #0
    bne     _spinlock_lock           // if the write failed, start over
9001414c:	1afffff6 	bne	9001412c <_spinlock_lock>
    
    dmb                             // Ensure that accesses to shared resource have completed
90014150:	f57ff05f 	dmb	sy
    
    mov     r0, #0
90014154:	e3a00000 	mov	r0, #0
    bx      lr                      // return to caller
90014158:	e12fff1e 	bx	lr

9001415c <_spinlock_unlock>:
// void spinlock_unlock(spinlock_t * lock)
    .global _spinlock_unlock
    .func _spinlock_unlock
_spinlock_unlock:

    mrc     p15, 0, r1, c0, c0, 5   // get our CPU ID
9001415c:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
    and     r1, r1, #3
90014160:	e2011003 	and	r1, r1, #3
    
    ldr     r2, [r0]                // read lock field of spinlock
90014164:	e5902000 	ldr	r2, [r0]
    cmp     r1, r2                  // compare lock field with our CPU ID
90014168:	e1510002 	cmp	r1, r2
    movne   r0, #1                  // doesn't match, so exit with failure
9001416c:	13a00001 	movne	r0, #1
    bxne    lr
90014170:	112fff1e 	bxne	lr
    
    dmb                             // Ensure that accesses to shared resource have completed
90014174:	f57ff05f 	dmb	sy
    
    mov     r1, #UNLOCKED           // load unlocked value
90014178:	e3a010ff 	mov	r1, #255	; 0xff
    str     r1, [r0]                // write into lock field of spinlock
9001417c:	e5801000 	str	r1, [r0]
    
    dsb                             // Ensure that no instructions following the barrier execute until
90014180:	f57ff04f 	dsb	sy
                                    // all memory accesses prior to the barrier have completed.
    
    sev                             // send event to wake up other cores waiting on spinlock
90014184:	e320f004 	sev
    
    mov     r0, #0                  // return success
90014188:	e3a00000 	mov	r0, #0
    bx      lr
9001418c:	e12fff1e 	bx	lr

90014190 <UartInitGpio>:
#include "imx_uart.h"

#include "uart_common_ope.h"

static void UartInitGpio(void)
{
90014190:	e92d4800 	push	{fp, lr}
90014194:	e28db004 	add	fp, sp, #4
	/* UART1 TXD */
	mxc_iomux_v3_setup_pad(MX6Q_PAD_SD3_DAT6__UART1_TXD);
90014198:	e28f1030 	add	r1, pc, #48	; 0x30
9001419c:	e1c100d0 	ldrd	r0, [r1]
900141a0:	eb000397 	bl	90015004 <mxc_iomux_v3_setup_pad>

	/* UART1 RXD */
	mxc_iomux_v3_setup_pad(MX6Q_PAD_SD3_DAT7__UART1_RXD);
900141a4:	e28f102c 	add	r1, pc, #44	; 0x2c
900141a8:	e1c100d0 	ldrd	r0, [r1]
900141ac:	eb000394 	bl	90015004 <mxc_iomux_v3_setup_pad>

	/* UART2 TXD */
	mxc_iomux_v3_setup_pad(MX6Q_PAD_EIM_D26__UART2_TXD);
900141b0:	e28f1028 	add	r1, pc, #40	; 0x28
900141b4:	e1c100d0 	ldrd	r0, [r1]
900141b8:	eb000391 	bl	90015004 <mxc_iomux_v3_setup_pad>

	/* UART2 RXD */
	mxc_iomux_v3_setup_pad(MX6Q_PAD_EIM_D27__UART2_RXD);
900141bc:	e28f1024 	add	r1, pc, #36	; 0x24
900141c0:	e1c100d0 	ldrd	r0, [r1]
900141c4:	eb00038e 	bl	90015004 <mxc_iomux_v3_setup_pad>
}
900141c8:	e320f000 	nop	{0}
900141cc:	e8bd8800 	pop	{fp, pc}
900141d0:	006942ac 	.word	0x006942ac
900141d4:	03616210 	.word	0x03616210
900141d8:	206902a8 	.word	0x206902a8
900141dc:	23616219 	.word	0x23616219
900141e0:	003d00bc 	.word	0x003d00bc
900141e4:	03616240 	.word	0x03616240
900141e8:	283d40c0 	.word	0x283d40c0
900141ec:	13616249 	.word	0x13616249

900141f0 <GetUartClk>:

static uint32_t GetUartClk(void)
{
900141f0:	e92d4800 	push	{fp, lr}
900141f4:	e28db004 	add	fp, sp, #4
900141f8:	e24dd018 	sub	sp, sp, #24
    uint32_t freq = 80000000, reg, podf;
900141fc:	e3a03b2d 	mov	r3, #46080	; 0xb400
90014200:	e34034c4 	movt	r3, #1220	; 0x4c4
90014204:	e50b3008 	str	r3, [fp, #-8]
90014208:	e3043024 	movw	r3, #16420	; 0x4024
9001420c:	e340320c 	movt	r3, #524	; 0x20c
90014210:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90014214:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90014218:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001421c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90014220:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    *(volatile mmio_reg_t*)(MMIO_P2V(paddr)) = (value);
}

__attribute__((unused, always_inline)) static inline mmio_reg_t mmio_read(uintptr_t paddr)
{
    return *(volatile mmio_reg_t*)(MMIO_P2V(paddr));
90014224:	e5933000 	ldr	r3, [r3]

    reg = mmio_read(MXC_CCM_CSCDR1);
90014228:	e50b300c 	str	r3, [fp, #-12]
    podf = (reg & MXC_CCM_CSCDR1_UART_CLK_PODF_MASK) >> MXC_CCM_CSCDR1_UART_CLK_PODF_OFFSET;
9001422c:	e51b300c 	ldr	r3, [fp, #-12]
90014230:	e203303f 	and	r3, r3, #63	; 0x3f
90014234:	e50b3010 	str	r3, [fp, #-16]
    freq /= (podf + 1);
90014238:	e51b3010 	ldr	r3, [fp, #-16]
9001423c:	e2833001 	add	r3, r3, #1
90014240:	e1a01003 	mov	r1, r3
90014244:	e51b0008 	ldr	r0, [fp, #-8]
90014248:	fa003094 	blx	900204a0 <__udivsi3>
9001424c:	e1a03000 	mov	r3, r0
90014250:	e50b3008 	str	r3, [fp, #-8]

    return freq;
90014254:	e51b3008 	ldr	r3, [fp, #-8]
}
90014258:	e1a00003 	mov	r0, r3
9001425c:	e24bd004 	sub	sp, fp, #4
90014260:	e8bd8800 	pop	{fp, pc}

90014264 <UartInitRegsInstance>:

static void UartInitRegsInstance(uint32_t instance, uint32_t uart_baud_rate)
{
90014264:	e92d4810 	push	{r4, fp, lr}
90014268:	e28db008 	add	fp, sp, #8
9001426c:	e24dd044 	sub	sp, sp, #68	; 0x44
90014270:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
90014274:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    uint32_t uart_clk;

    HW_UART_UCR1_WR(instance, 0);
90014278:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001427c:	e3530001 	cmp	r3, #1
90014280:	0a000019 	beq	900142ec <UartInitRegsInstance+0x88>
90014284:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014288:	e3530002 	cmp	r3, #2
9001428c:	0a000013 	beq	900142e0 <UartInitRegsInstance+0x7c>
90014290:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014294:	e3530003 	cmp	r3, #3
90014298:	0a00000d 	beq	900142d4 <UartInitRegsInstance+0x70>
9001429c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900142a0:	e3530004 	cmp	r3, #4
900142a4:	0a000007 	beq	900142c8 <UartInitRegsInstance+0x64>
900142a8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900142ac:	e3530005 	cmp	r3, #5
900142b0:	1a000002 	bne	900142c0 <UartInitRegsInstance+0x5c>
900142b4:	e3a03901 	mov	r3, #16384	; 0x4000
900142b8:	e340321f 	movt	r3, #543	; 0x21f
900142bc:	ea00000c 	b	900142f4 <UartInitRegsInstance+0x90>
900142c0:	e3a0360d 	mov	r3, #13631488	; 0xd00000
900142c4:	ea00000a 	b	900142f4 <UartInitRegsInstance+0x90>
900142c8:	e3a03000 	mov	r3, #0
900142cc:	e340321f 	movt	r3, #543	; 0x21f
900142d0:	ea000007 	b	900142f4 <UartInitRegsInstance+0x90>
900142d4:	e3a03903 	mov	r3, #49152	; 0xc000
900142d8:	e340321e 	movt	r3, #542	; 0x21e
900142dc:	ea000004 	b	900142f4 <UartInitRegsInstance+0x90>
900142e0:	e3a03902 	mov	r3, #32768	; 0x8000
900142e4:	e340321e 	movt	r3, #542	; 0x21e
900142e8:	ea000001 	b	900142f4 <UartInitRegsInstance+0x90>
900142ec:	e3a03000 	mov	r3, #0
900142f0:	e3403202 	movt	r3, #514	; 0x202
900142f4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (DEV_VRTMEM_BASE - DEV_PHYMEM_BASE) + paddr;
900142f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900142fc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014300:	e2833080 	add	r3, r3, #128	; 0x80
90014304:	e1a02003 	mov	r2, r3
90014308:	e3a03000 	mov	r3, #0
9001430c:	e5823000 	str	r3, [r2]
    HW_UART_UCR2_WR(instance, 0);
90014310:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014314:	e3530001 	cmp	r3, #1
90014318:	0a000019 	beq	90014384 <UartInitRegsInstance+0x120>
9001431c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014320:	e3530002 	cmp	r3, #2
90014324:	0a000013 	beq	90014378 <UartInitRegsInstance+0x114>
90014328:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001432c:	e3530003 	cmp	r3, #3
90014330:	0a00000d 	beq	9001436c <UartInitRegsInstance+0x108>
90014334:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014338:	e3530004 	cmp	r3, #4
9001433c:	0a000007 	beq	90014360 <UartInitRegsInstance+0xfc>
90014340:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014344:	e3530005 	cmp	r3, #5
90014348:	1a000002 	bne	90014358 <UartInitRegsInstance+0xf4>
9001434c:	e3a03901 	mov	r3, #16384	; 0x4000
90014350:	e340321f 	movt	r3, #543	; 0x21f
90014354:	ea00000c 	b	9001438c <UartInitRegsInstance+0x128>
90014358:	e3a0360d 	mov	r3, #13631488	; 0xd00000
9001435c:	ea00000a 	b	9001438c <UartInitRegsInstance+0x128>
90014360:	e3a03000 	mov	r3, #0
90014364:	e340321f 	movt	r3, #543	; 0x21f
90014368:	ea000007 	b	9001438c <UartInitRegsInstance+0x128>
9001436c:	e3a03903 	mov	r3, #49152	; 0xc000
90014370:	e340321e 	movt	r3, #542	; 0x21e
90014374:	ea000004 	b	9001438c <UartInitRegsInstance+0x128>
90014378:	e3a03902 	mov	r3, #32768	; 0x8000
9001437c:	e340321e 	movt	r3, #542	; 0x21e
90014380:	ea000001 	b	9001438c <UartInitRegsInstance+0x128>
90014384:	e3a03000 	mov	r3, #0
90014388:	e3403202 	movt	r3, #514	; 0x202
9001438c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90014390:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90014394:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014398:	e2833084 	add	r3, r3, #132	; 0x84
9001439c:	e1a02003 	mov	r2, r3
900143a0:	e3a03000 	mov	r3, #0
900143a4:	e5823000 	str	r3, [r2]

    while (!(HW_UART_UCR2(instance).B.SRST))
900143a8:	e320f000 	nop	{0}
900143ac:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900143b0:	e3530001 	cmp	r3, #1
900143b4:	0a000019 	beq	90014420 <UartInitRegsInstance+0x1bc>
900143b8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900143bc:	e3530002 	cmp	r3, #2
900143c0:	0a000013 	beq	90014414 <UartInitRegsInstance+0x1b0>
900143c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900143c8:	e3530003 	cmp	r3, #3
900143cc:	0a00000d 	beq	90014408 <UartInitRegsInstance+0x1a4>
900143d0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900143d4:	e3530004 	cmp	r3, #4
900143d8:	0a000007 	beq	900143fc <UartInitRegsInstance+0x198>
900143dc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900143e0:	e3530005 	cmp	r3, #5
900143e4:	1a000002 	bne	900143f4 <UartInitRegsInstance+0x190>
900143e8:	e3a03901 	mov	r3, #16384	; 0x4000
900143ec:	e340321f 	movt	r3, #543	; 0x21f
900143f0:	ea00000c 	b	90014428 <UartInitRegsInstance+0x1c4>
900143f4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
900143f8:	ea00000a 	b	90014428 <UartInitRegsInstance+0x1c4>
900143fc:	e3a03000 	mov	r3, #0
90014400:	e340321f 	movt	r3, #543	; 0x21f
90014404:	ea000007 	b	90014428 <UartInitRegsInstance+0x1c4>
90014408:	e3a03903 	mov	r3, #49152	; 0xc000
9001440c:	e340321e 	movt	r3, #542	; 0x21e
90014410:	ea000004 	b	90014428 <UartInitRegsInstance+0x1c4>
90014414:	e3a03902 	mov	r3, #32768	; 0x8000
90014418:	e340321e 	movt	r3, #542	; 0x21e
9001441c:	ea000001 	b	90014428 <UartInitRegsInstance+0x1c4>
90014420:	e3a03000 	mov	r3, #0
90014424:	e3403202 	movt	r3, #514	; 0x202
90014428:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001442c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90014430:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014434:	e2833084 	add	r3, r3, #132	; 0x84
90014438:	e5933000 	ldr	r3, [r3]
9001443c:	e7e03053 	ubfx	r3, r3, #0, #1
90014440:	e6ef3073 	uxtb	r3, r3
90014444:	e3530000 	cmp	r3, #0
90014448:	0affffd7 	beq	900143ac <UartInitRegsInstance+0x148>
        ;

    HW_UART_UCR3_WR(instance, 0x0704);
9001444c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014450:	e3530001 	cmp	r3, #1
90014454:	0a000019 	beq	900144c0 <UartInitRegsInstance+0x25c>
90014458:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001445c:	e3530002 	cmp	r3, #2
90014460:	0a000013 	beq	900144b4 <UartInitRegsInstance+0x250>
90014464:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014468:	e3530003 	cmp	r3, #3
9001446c:	0a00000d 	beq	900144a8 <UartInitRegsInstance+0x244>
90014470:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014474:	e3530004 	cmp	r3, #4
90014478:	0a000007 	beq	9001449c <UartInitRegsInstance+0x238>
9001447c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014480:	e3530005 	cmp	r3, #5
90014484:	1a000002 	bne	90014494 <UartInitRegsInstance+0x230>
90014488:	e3a03901 	mov	r3, #16384	; 0x4000
9001448c:	e340321f 	movt	r3, #543	; 0x21f
90014490:	ea00000c 	b	900144c8 <UartInitRegsInstance+0x264>
90014494:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014498:	ea00000a 	b	900144c8 <UartInitRegsInstance+0x264>
9001449c:	e3a03000 	mov	r3, #0
900144a0:	e340321f 	movt	r3, #543	; 0x21f
900144a4:	ea000007 	b	900144c8 <UartInitRegsInstance+0x264>
900144a8:	e3a03903 	mov	r3, #49152	; 0xc000
900144ac:	e340321e 	movt	r3, #542	; 0x21e
900144b0:	ea000004 	b	900144c8 <UartInitRegsInstance+0x264>
900144b4:	e3a03902 	mov	r3, #32768	; 0x8000
900144b8:	e340321e 	movt	r3, #542	; 0x21e
900144bc:	ea000001 	b	900144c8 <UartInitRegsInstance+0x264>
900144c0:	e3a03000 	mov	r3, #0
900144c4:	e3403202 	movt	r3, #514	; 0x202
900144c8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
900144cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900144d0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900144d4:	e2833088 	add	r3, r3, #136	; 0x88
900144d8:	e1a02003 	mov	r2, r3
900144dc:	e3003704 	movw	r3, #1796	; 0x704
900144e0:	e5823000 	str	r3, [r2]
    HW_UART_UCR4_WR(instance, 0x8000);
900144e4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900144e8:	e3530001 	cmp	r3, #1
900144ec:	0a000019 	beq	90014558 <UartInitRegsInstance+0x2f4>
900144f0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900144f4:	e3530002 	cmp	r3, #2
900144f8:	0a000013 	beq	9001454c <UartInitRegsInstance+0x2e8>
900144fc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014500:	e3530003 	cmp	r3, #3
90014504:	0a00000d 	beq	90014540 <UartInitRegsInstance+0x2dc>
90014508:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001450c:	e3530004 	cmp	r3, #4
90014510:	0a000007 	beq	90014534 <UartInitRegsInstance+0x2d0>
90014514:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014518:	e3530005 	cmp	r3, #5
9001451c:	1a000002 	bne	9001452c <UartInitRegsInstance+0x2c8>
90014520:	e3a03901 	mov	r3, #16384	; 0x4000
90014524:	e340321f 	movt	r3, #543	; 0x21f
90014528:	ea00000c 	b	90014560 <UartInitRegsInstance+0x2fc>
9001452c:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014530:	ea00000a 	b	90014560 <UartInitRegsInstance+0x2fc>
90014534:	e3a03000 	mov	r3, #0
90014538:	e340321f 	movt	r3, #543	; 0x21f
9001453c:	ea000007 	b	90014560 <UartInitRegsInstance+0x2fc>
90014540:	e3a03903 	mov	r3, #49152	; 0xc000
90014544:	e340321e 	movt	r3, #542	; 0x21e
90014548:	ea000004 	b	90014560 <UartInitRegsInstance+0x2fc>
9001454c:	e3a03902 	mov	r3, #32768	; 0x8000
90014550:	e340321e 	movt	r3, #542	; 0x21e
90014554:	ea000001 	b	90014560 <UartInitRegsInstance+0x2fc>
90014558:	e3a03000 	mov	r3, #0
9001455c:	e3403202 	movt	r3, #514	; 0x202
90014560:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90014564:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90014568:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001456c:	e283308c 	add	r3, r3, #140	; 0x8c
90014570:	e1a02003 	mov	r2, r3
90014574:	e3a03902 	mov	r3, #32768	; 0x8000
90014578:	e5823000 	str	r3, [r2]
    HW_UART_UESC_WR(instance, 0x002B);
9001457c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014580:	e3530001 	cmp	r3, #1
90014584:	0a000019 	beq	900145f0 <UartInitRegsInstance+0x38c>
90014588:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001458c:	e3530002 	cmp	r3, #2
90014590:	0a000013 	beq	900145e4 <UartInitRegsInstance+0x380>
90014594:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014598:	e3530003 	cmp	r3, #3
9001459c:	0a00000d 	beq	900145d8 <UartInitRegsInstance+0x374>
900145a0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900145a4:	e3530004 	cmp	r3, #4
900145a8:	0a000007 	beq	900145cc <UartInitRegsInstance+0x368>
900145ac:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900145b0:	e3530005 	cmp	r3, #5
900145b4:	1a000002 	bne	900145c4 <UartInitRegsInstance+0x360>
900145b8:	e3a03901 	mov	r3, #16384	; 0x4000
900145bc:	e340321f 	movt	r3, #543	; 0x21f
900145c0:	ea00000c 	b	900145f8 <UartInitRegsInstance+0x394>
900145c4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
900145c8:	ea00000a 	b	900145f8 <UartInitRegsInstance+0x394>
900145cc:	e3a03000 	mov	r3, #0
900145d0:	e340321f 	movt	r3, #543	; 0x21f
900145d4:	ea000007 	b	900145f8 <UartInitRegsInstance+0x394>
900145d8:	e3a03903 	mov	r3, #49152	; 0xc000
900145dc:	e340321e 	movt	r3, #542	; 0x21e
900145e0:	ea000004 	b	900145f8 <UartInitRegsInstance+0x394>
900145e4:	e3a03902 	mov	r3, #32768	; 0x8000
900145e8:	e340321e 	movt	r3, #542	; 0x21e
900145ec:	ea000001 	b	900145f8 <UartInitRegsInstance+0x394>
900145f0:	e3a03000 	mov	r3, #0
900145f4:	e3403202 	movt	r3, #514	; 0x202
900145f8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
900145fc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90014600:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014604:	e283309c 	add	r3, r3, #156	; 0x9c
90014608:	e1a02003 	mov	r2, r3
9001460c:	e3a0302b 	mov	r3, #43	; 0x2b
90014610:	e5823000 	str	r3, [r2]
    HW_UART_UTIM_WR(instance, 0);
90014614:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014618:	e3530001 	cmp	r3, #1
9001461c:	0a000019 	beq	90014688 <UartInitRegsInstance+0x424>
90014620:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014624:	e3530002 	cmp	r3, #2
90014628:	0a000013 	beq	9001467c <UartInitRegsInstance+0x418>
9001462c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014630:	e3530003 	cmp	r3, #3
90014634:	0a00000d 	beq	90014670 <UartInitRegsInstance+0x40c>
90014638:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001463c:	e3530004 	cmp	r3, #4
90014640:	0a000007 	beq	90014664 <UartInitRegsInstance+0x400>
90014644:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014648:	e3530005 	cmp	r3, #5
9001464c:	1a000002 	bne	9001465c <UartInitRegsInstance+0x3f8>
90014650:	e3a03901 	mov	r3, #16384	; 0x4000
90014654:	e340321f 	movt	r3, #543	; 0x21f
90014658:	ea00000c 	b	90014690 <UartInitRegsInstance+0x42c>
9001465c:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014660:	ea00000a 	b	90014690 <UartInitRegsInstance+0x42c>
90014664:	e3a03000 	mov	r3, #0
90014668:	e340321f 	movt	r3, #543	; 0x21f
9001466c:	ea000007 	b	90014690 <UartInitRegsInstance+0x42c>
90014670:	e3a03903 	mov	r3, #49152	; 0xc000
90014674:	e340321e 	movt	r3, #542	; 0x21e
90014678:	ea000004 	b	90014690 <UartInitRegsInstance+0x42c>
9001467c:	e3a03902 	mov	r3, #32768	; 0x8000
90014680:	e340321e 	movt	r3, #542	; 0x21e
90014684:	ea000001 	b	90014690 <UartInitRegsInstance+0x42c>
90014688:	e3a03000 	mov	r3, #0
9001468c:	e3403202 	movt	r3, #514	; 0x202
90014690:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
90014694:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90014698:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001469c:	e28330a0 	add	r3, r3, #160	; 0xa0
900146a0:	e1a02003 	mov	r2, r3
900146a4:	e3a03000 	mov	r3, #0
900146a8:	e5823000 	str	r3, [r2]
    HW_UART_UTS_WR(instance, 0);
900146ac:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900146b0:	e3530001 	cmp	r3, #1
900146b4:	0a000019 	beq	90014720 <UartInitRegsInstance+0x4bc>
900146b8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900146bc:	e3530002 	cmp	r3, #2
900146c0:	0a000013 	beq	90014714 <UartInitRegsInstance+0x4b0>
900146c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900146c8:	e3530003 	cmp	r3, #3
900146cc:	0a00000d 	beq	90014708 <UartInitRegsInstance+0x4a4>
900146d0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900146d4:	e3530004 	cmp	r3, #4
900146d8:	0a000007 	beq	900146fc <UartInitRegsInstance+0x498>
900146dc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900146e0:	e3530005 	cmp	r3, #5
900146e4:	1a000002 	bne	900146f4 <UartInitRegsInstance+0x490>
900146e8:	e3a03901 	mov	r3, #16384	; 0x4000
900146ec:	e340321f 	movt	r3, #543	; 0x21f
900146f0:	ea00000c 	b	90014728 <UartInitRegsInstance+0x4c4>
900146f4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
900146f8:	ea00000a 	b	90014728 <UartInitRegsInstance+0x4c4>
900146fc:	e3a03000 	mov	r3, #0
90014700:	e340321f 	movt	r3, #543	; 0x21f
90014704:	ea000007 	b	90014728 <UartInitRegsInstance+0x4c4>
90014708:	e3a03903 	mov	r3, #49152	; 0xc000
9001470c:	e340321e 	movt	r3, #542	; 0x21e
90014710:	ea000004 	b	90014728 <UartInitRegsInstance+0x4c4>
90014714:	e3a03902 	mov	r3, #32768	; 0x8000
90014718:	e340321e 	movt	r3, #542	; 0x21e
9001471c:	ea000001 	b	90014728 <UartInitRegsInstance+0x4c4>
90014720:	e3a03000 	mov	r3, #0
90014724:	e3403202 	movt	r3, #514	; 0x202
90014728:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
9001472c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90014730:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014734:	e28330b4 	add	r3, r3, #180	; 0xb4
90014738:	e1a02003 	mov	r2, r3
9001473c:	e3a03000 	mov	r3, #0
90014740:	e5823000 	str	r3, [r2]

    uart_clk = GetUartClk();
90014744:	ebfffea9 	bl	900141f0 <GetUartClk>
90014748:	e50b0010 	str	r0, [fp, #-16]

    HW_UART_UFCR_WR(instance, 4 << 7);
9001474c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014750:	e3530001 	cmp	r3, #1
90014754:	0a000019 	beq	900147c0 <UartInitRegsInstance+0x55c>
90014758:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001475c:	e3530002 	cmp	r3, #2
90014760:	0a000013 	beq	900147b4 <UartInitRegsInstance+0x550>
90014764:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014768:	e3530003 	cmp	r3, #3
9001476c:	0a00000d 	beq	900147a8 <UartInitRegsInstance+0x544>
90014770:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014774:	e3530004 	cmp	r3, #4
90014778:	0a000007 	beq	9001479c <UartInitRegsInstance+0x538>
9001477c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014780:	e3530005 	cmp	r3, #5
90014784:	1a000002 	bne	90014794 <UartInitRegsInstance+0x530>
90014788:	e3a03901 	mov	r3, #16384	; 0x4000
9001478c:	e340321f 	movt	r3, #543	; 0x21f
90014790:	ea00000c 	b	900147c8 <UartInitRegsInstance+0x564>
90014794:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014798:	ea00000a 	b	900147c8 <UartInitRegsInstance+0x564>
9001479c:	e3a03000 	mov	r3, #0
900147a0:	e340321f 	movt	r3, #543	; 0x21f
900147a4:	ea000007 	b	900147c8 <UartInitRegsInstance+0x564>
900147a8:	e3a03903 	mov	r3, #49152	; 0xc000
900147ac:	e340321e 	movt	r3, #542	; 0x21e
900147b0:	ea000004 	b	900147c8 <UartInitRegsInstance+0x564>
900147b4:	e3a03902 	mov	r3, #32768	; 0x8000
900147b8:	e340321e 	movt	r3, #542	; 0x21e
900147bc:	ea000001 	b	900147c8 <UartInitRegsInstance+0x564>
900147c0:	e3a03000 	mov	r3, #0
900147c4:	e3403202 	movt	r3, #514	; 0x202
900147c8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
900147cc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
900147d0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900147d4:	e2833090 	add	r3, r3, #144	; 0x90
900147d8:	e1a02003 	mov	r2, r3
900147dc:	e3a03c02 	mov	r3, #512	; 0x200
900147e0:	e5823000 	str	r3, [r2]
    HW_UART_UBIR_WR(instance, 0x0F);
900147e4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900147e8:	e3530001 	cmp	r3, #1
900147ec:	0a000019 	beq	90014858 <UartInitRegsInstance+0x5f4>
900147f0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900147f4:	e3530002 	cmp	r3, #2
900147f8:	0a000013 	beq	9001484c <UartInitRegsInstance+0x5e8>
900147fc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014800:	e3530003 	cmp	r3, #3
90014804:	0a00000d 	beq	90014840 <UartInitRegsInstance+0x5dc>
90014808:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001480c:	e3530004 	cmp	r3, #4
90014810:	0a000007 	beq	90014834 <UartInitRegsInstance+0x5d0>
90014814:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014818:	e3530005 	cmp	r3, #5
9001481c:	1a000002 	bne	9001482c <UartInitRegsInstance+0x5c8>
90014820:	e3a03901 	mov	r3, #16384	; 0x4000
90014824:	e340321f 	movt	r3, #543	; 0x21f
90014828:	ea00000c 	b	90014860 <UartInitRegsInstance+0x5fc>
9001482c:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014830:	ea00000a 	b	90014860 <UartInitRegsInstance+0x5fc>
90014834:	e3a03000 	mov	r3, #0
90014838:	e340321f 	movt	r3, #543	; 0x21f
9001483c:	ea000007 	b	90014860 <UartInitRegsInstance+0x5fc>
90014840:	e3a03903 	mov	r3, #49152	; 0xc000
90014844:	e340321e 	movt	r3, #542	; 0x21e
90014848:	ea000004 	b	90014860 <UartInitRegsInstance+0x5fc>
9001484c:	e3a03902 	mov	r3, #32768	; 0x8000
90014850:	e340321e 	movt	r3, #542	; 0x21e
90014854:	ea000001 	b	90014860 <UartInitRegsInstance+0x5fc>
90014858:	e3a03000 	mov	r3, #0
9001485c:	e3403202 	movt	r3, #514	; 0x202
90014860:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
90014864:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90014868:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001486c:	e28330a4 	add	r3, r3, #164	; 0xa4
90014870:	e1a02003 	mov	r2, r3
90014874:	e3a0300f 	mov	r3, #15
90014878:	e5823000 	str	r3, [r2]
    HW_UART_UBMR_WR(instance, uart_clk / (2 * uart_baud_rate));
9001487c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014880:	e3530001 	cmp	r3, #1
90014884:	0a000019 	beq	900148f0 <UartInitRegsInstance+0x68c>
90014888:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001488c:	e3530002 	cmp	r3, #2
90014890:	0a000013 	beq	900148e4 <UartInitRegsInstance+0x680>
90014894:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014898:	e3530003 	cmp	r3, #3
9001489c:	0a00000d 	beq	900148d8 <UartInitRegsInstance+0x674>
900148a0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900148a4:	e3530004 	cmp	r3, #4
900148a8:	0a000007 	beq	900148cc <UartInitRegsInstance+0x668>
900148ac:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900148b0:	e3530005 	cmp	r3, #5
900148b4:	1a000002 	bne	900148c4 <UartInitRegsInstance+0x660>
900148b8:	e3a03901 	mov	r3, #16384	; 0x4000
900148bc:	e340321f 	movt	r3, #543	; 0x21f
900148c0:	ea00000c 	b	900148f8 <UartInitRegsInstance+0x694>
900148c4:	e3a0360d 	mov	r3, #13631488	; 0xd00000
900148c8:	ea00000a 	b	900148f8 <UartInitRegsInstance+0x694>
900148cc:	e3a03000 	mov	r3, #0
900148d0:	e340321f 	movt	r3, #543	; 0x21f
900148d4:	ea000007 	b	900148f8 <UartInitRegsInstance+0x694>
900148d8:	e3a03903 	mov	r3, #49152	; 0xc000
900148dc:	e340321e 	movt	r3, #542	; 0x21e
900148e0:	ea000004 	b	900148f8 <UartInitRegsInstance+0x694>
900148e4:	e3a03902 	mov	r3, #32768	; 0x8000
900148e8:	e340321e 	movt	r3, #542	; 0x21e
900148ec:	ea000001 	b	900148f8 <UartInitRegsInstance+0x694>
900148f0:	e3a03000 	mov	r3, #0
900148f4:	e3403202 	movt	r3, #514	; 0x202
900148f8:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
900148fc:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
90014900:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014904:	e28330a8 	add	r3, r3, #168	; 0xa8
90014908:	e1a04003 	mov	r4, r3
9001490c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
90014910:	e1a03083 	lsl	r3, r3, #1
90014914:	e1a01003 	mov	r1, r3
90014918:	e51b0010 	ldr	r0, [fp, #-16]
9001491c:	fa002edf 	blx	900204a0 <__udivsi3>
90014920:	e1a03000 	mov	r3, r0
90014924:	e5843000 	str	r3, [r4]

    HW_UART_UCR2_WR(instance, BM_UART_UCR2_WS | BM_UART_UCR2_IRTS | BM_UART_UCR2_RXEN | BM_UART_UCR2_TXEN | BM_UART_UCR2_SRST);
90014928:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001492c:	e3530001 	cmp	r3, #1
90014930:	0a000019 	beq	9001499c <UartInitRegsInstance+0x738>
90014934:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014938:	e3530002 	cmp	r3, #2
9001493c:	0a000013 	beq	90014990 <UartInitRegsInstance+0x72c>
90014940:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014944:	e3530003 	cmp	r3, #3
90014948:	0a00000d 	beq	90014984 <UartInitRegsInstance+0x720>
9001494c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90014950:	e3530004 	cmp	r3, #4
90014954:	0a000007 	beq	90014978 <UartInitRegsInstance+0x714>
90014958:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001495c:	e3530005 	cmp	r3, #5
90014960:	1a000002 	bne	90014970 <UartInitRegsInstance+0x70c>
90014964:	e3a03901 	mov	r3, #16384	; 0x4000
90014968:	e340321f 	movt	r3, #543	; 0x21f
9001496c:	ea00000c 	b	900149a4 <UartInitRegsInstance+0x740>
90014970:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014974:	ea00000a 	b	900149a4 <UartInitRegsInstance+0x740>
90014978:	e3a03000 	mov	r3, #0
9001497c:	e340321f 	movt	r3, #543	; 0x21f
90014980:	ea000007 	b	900149a4 <UartInitRegsInstance+0x740>
90014984:	e3a03903 	mov	r3, #49152	; 0xc000
90014988:	e340321e 	movt	r3, #542	; 0x21e
9001498c:	ea000004 	b	900149a4 <UartInitRegsInstance+0x740>
90014990:	e3a03902 	mov	r3, #32768	; 0x8000
90014994:	e340321e 	movt	r3, #542	; 0x21e
90014998:	ea000001 	b	900149a4 <UartInitRegsInstance+0x740>
9001499c:	e3a03000 	mov	r3, #0
900149a0:	e3403202 	movt	r3, #514	; 0x202
900149a4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
900149a8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
900149ac:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900149b0:	e2833084 	add	r3, r3, #132	; 0x84
900149b4:	e1a02003 	mov	r2, r3
900149b8:	e3043027 	movw	r3, #16423	; 0x4027
900149bc:	e5823000 	str	r3, [r2]
    HW_UART_UCR1_WR(instance, 1);
900149c0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900149c4:	e3530001 	cmp	r3, #1
900149c8:	0a000019 	beq	90014a34 <UartInitRegsInstance+0x7d0>
900149cc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900149d0:	e3530002 	cmp	r3, #2
900149d4:	0a000013 	beq	90014a28 <UartInitRegsInstance+0x7c4>
900149d8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900149dc:	e3530003 	cmp	r3, #3
900149e0:	0a00000d 	beq	90014a1c <UartInitRegsInstance+0x7b8>
900149e4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900149e8:	e3530004 	cmp	r3, #4
900149ec:	0a000007 	beq	90014a10 <UartInitRegsInstance+0x7ac>
900149f0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
900149f4:	e3530005 	cmp	r3, #5
900149f8:	1a000002 	bne	90014a08 <UartInitRegsInstance+0x7a4>
900149fc:	e3a03901 	mov	r3, #16384	; 0x4000
90014a00:	e340321f 	movt	r3, #543	; 0x21f
90014a04:	ea00000c 	b	90014a3c <UartInitRegsInstance+0x7d8>
90014a08:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014a0c:	ea00000a 	b	90014a3c <UartInitRegsInstance+0x7d8>
90014a10:	e3a03000 	mov	r3, #0
90014a14:	e340321f 	movt	r3, #543	; 0x21f
90014a18:	ea000007 	b	90014a3c <UartInitRegsInstance+0x7d8>
90014a1c:	e3a03903 	mov	r3, #49152	; 0xc000
90014a20:	e340321e 	movt	r3, #542	; 0x21e
90014a24:	ea000004 	b	90014a3c <UartInitRegsInstance+0x7d8>
90014a28:	e3a03902 	mov	r3, #32768	; 0x8000
90014a2c:	e340321e 	movt	r3, #542	; 0x21e
90014a30:	ea000001 	b	90014a3c <UartInitRegsInstance+0x7d8>
90014a34:	e3a03000 	mov	r3, #0
90014a38:	e3403202 	movt	r3, #514	; 0x202
90014a3c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
90014a40:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
90014a44:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014a48:	e2833080 	add	r3, r3, #128	; 0x80
90014a4c:	e1a02003 	mov	r2, r3
90014a50:	e3a03001 	mov	r3, #1
90014a54:	e5823000 	str	r3, [r2]
}
90014a58:	e320f000 	nop	{0}
90014a5c:	e24bd008 	sub	sp, fp, #8
90014a60:	e8bd8810 	pop	{r4, fp, pc}

90014a64 <UartInitInstance>:
{
    return UART_IRQS(instance);
}

static inline void UartInitInstance(uint32_t instance)
{
90014a64:	e92d4800 	push	{fp, lr}
90014a68:	e28db004 	add	fp, sp, #4
90014a6c:	e24dd008 	sub	sp, sp, #8
90014a70:	e50b0008 	str	r0, [fp, #-8]
    static char init = 0;
    if (init == 0) {
90014a74:	e30a3854 	movw	r3, #43092	; 0xa854
90014a78:	e3493019 	movt	r3, #36889	; 0x9019
90014a7c:	e5d33000 	ldrb	r3, [r3]
90014a80:	e3530000 	cmp	r3, #0
90014a84:	1a000003 	bne	90014a98 <UartInitInstance+0x34>
        mxc_iomux_v3_init((void*)IOMUXC_BASE_ADDR);
90014a88:	e3a00000 	mov	r0, #0
90014a8c:	e340020e 	movt	r0, #526	; 0x20e
90014a90:	eb00014f 	bl	90014fd4 <mxc_iomux_v3_init>
        UartInitGpio();
90014a94:	ebfffdbd 	bl	90014190 <UartInitGpio>
    }
    init = 1;
90014a98:	e30a3854 	movw	r3, #43092	; 0xa854
90014a9c:	e3493019 	movt	r3, #36889	; 0x9019
90014aa0:	e3a02001 	mov	r2, #1
90014aa4:	e5c32000 	strb	r2, [r3]
    UartInitRegsInstance(instance, UART_BAUD_RATE);
90014aa8:	e3a01cc2 	mov	r1, #49664	; 0xc200
90014aac:	e3401001 	movt	r1, #1
90014ab0:	e51b0008 	ldr	r0, [fp, #-8]
90014ab4:	ebfffdea 	bl	90014264 <UartInitRegsInstance>
}
90014ab8:	e320f000 	nop	{0}
90014abc:	e24bd004 	sub	sp, fp, #4
90014ac0:	e8bd8800 	pop	{fp, pc}

90014ac4 <UartPutChar>:

static void UartPutChar(uint8_t ch)
{
90014ac4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90014ac8:	e28db000 	add	fp, sp, #0
90014acc:	e24dd024 	sub	sp, sp, #36	; 0x24
90014ad0:	e1a03000 	mov	r3, r0
90014ad4:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3
90014ad8:	e3a03002 	mov	r3, #2
90014adc:	e50b3008 	str	r3, [fp, #-8]
90014ae0:	e24b301d 	sub	r3, fp, #29
90014ae4:	e50b300c 	str	r3, [fp, #-12]
    while (HW_UART_UTS(instance).B.TXFULL)
90014ae8:	e51b3008 	ldr	r3, [fp, #-8]
90014aec:	e3530001 	cmp	r3, #1
90014af0:	0a000019 	beq	90014b5c <UartPutChar+0x98>
90014af4:	e51b3008 	ldr	r3, [fp, #-8]
90014af8:	e3530002 	cmp	r3, #2
90014afc:	0a000013 	beq	90014b50 <UartPutChar+0x8c>
90014b00:	e51b3008 	ldr	r3, [fp, #-8]
90014b04:	e3530003 	cmp	r3, #3
90014b08:	0a00000d 	beq	90014b44 <UartPutChar+0x80>
90014b0c:	e51b3008 	ldr	r3, [fp, #-8]
90014b10:	e3530004 	cmp	r3, #4
90014b14:	0a000007 	beq	90014b38 <UartPutChar+0x74>
90014b18:	e51b3008 	ldr	r3, [fp, #-8]
90014b1c:	e3530005 	cmp	r3, #5
90014b20:	1a000002 	bne	90014b30 <UartPutChar+0x6c>
90014b24:	e3a03901 	mov	r3, #16384	; 0x4000
90014b28:	e340321f 	movt	r3, #543	; 0x21f
90014b2c:	ea00000c 	b	90014b64 <UartPutChar+0xa0>
90014b30:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014b34:	ea00000a 	b	90014b64 <UartPutChar+0xa0>
90014b38:	e3a03000 	mov	r3, #0
90014b3c:	e340321f 	movt	r3, #543	; 0x21f
90014b40:	ea000007 	b	90014b64 <UartPutChar+0xa0>
90014b44:	e3a03903 	mov	r3, #49152	; 0xc000
90014b48:	e340321e 	movt	r3, #542	; 0x21e
90014b4c:	ea000004 	b	90014b64 <UartPutChar+0xa0>
90014b50:	e3a03902 	mov	r3, #32768	; 0x8000
90014b54:	e340321e 	movt	r3, #542	; 0x21e
90014b58:	ea000001 	b	90014b64 <UartPutChar+0xa0>
90014b5c:	e3a03000 	mov	r3, #0
90014b60:	e3403202 	movt	r3, #514	; 0x202
90014b64:	e50b3010 	str	r3, [fp, #-16]
90014b68:	e51b3010 	ldr	r3, [fp, #-16]
90014b6c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014b70:	e28330b4 	add	r3, r3, #180	; 0xb4
90014b74:	e5933000 	ldr	r3, [r3]
90014b78:	e7e03253 	ubfx	r3, r3, #4, #1
90014b7c:	e6ef3073 	uxtb	r3, r3
90014b80:	e3530000 	cmp	r3, #0
90014b84:	1affffd7 	bne	90014ae8 <UartPutChar+0x24>
    if ((char)*ch == '\n') {
90014b88:	e51b300c 	ldr	r3, [fp, #-12]
90014b8c:	e5d33000 	ldrb	r3, [r3]
90014b90:	e353000a 	cmp	r3, #10
90014b94:	1a00004d 	bne	90014cd0 <UartPutChar+0x20c>
        HW_UART_UTXD_WR(instance, '\r');
90014b98:	e51b3008 	ldr	r3, [fp, #-8]
90014b9c:	e3530001 	cmp	r3, #1
90014ba0:	0a000019 	beq	90014c0c <UartPutChar+0x148>
90014ba4:	e51b3008 	ldr	r3, [fp, #-8]
90014ba8:	e3530002 	cmp	r3, #2
90014bac:	0a000013 	beq	90014c00 <UartPutChar+0x13c>
90014bb0:	e51b3008 	ldr	r3, [fp, #-8]
90014bb4:	e3530003 	cmp	r3, #3
90014bb8:	0a00000d 	beq	90014bf4 <UartPutChar+0x130>
90014bbc:	e51b3008 	ldr	r3, [fp, #-8]
90014bc0:	e3530004 	cmp	r3, #4
90014bc4:	0a000007 	beq	90014be8 <UartPutChar+0x124>
90014bc8:	e51b3008 	ldr	r3, [fp, #-8]
90014bcc:	e3530005 	cmp	r3, #5
90014bd0:	1a000002 	bne	90014be0 <UartPutChar+0x11c>
90014bd4:	e3a03901 	mov	r3, #16384	; 0x4000
90014bd8:	e340321f 	movt	r3, #543	; 0x21f
90014bdc:	ea00000c 	b	90014c14 <UartPutChar+0x150>
90014be0:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014be4:	ea00000a 	b	90014c14 <UartPutChar+0x150>
90014be8:	e3a03000 	mov	r3, #0
90014bec:	e340321f 	movt	r3, #543	; 0x21f
90014bf0:	ea000007 	b	90014c14 <UartPutChar+0x150>
90014bf4:	e3a03903 	mov	r3, #49152	; 0xc000
90014bf8:	e340321e 	movt	r3, #542	; 0x21e
90014bfc:	ea000004 	b	90014c14 <UartPutChar+0x150>
90014c00:	e3a03902 	mov	r3, #32768	; 0x8000
90014c04:	e340321e 	movt	r3, #542	; 0x21e
90014c08:	ea000001 	b	90014c14 <UartPutChar+0x150>
90014c0c:	e3a03000 	mov	r3, #0
90014c10:	e3403202 	movt	r3, #514	; 0x202
90014c14:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90014c18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90014c1c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014c20:	e2833040 	add	r3, r3, #64	; 0x40
90014c24:	e1a02003 	mov	r2, r3
90014c28:	e3a0300d 	mov	r3, #13
90014c2c:	e5823000 	str	r3, [r2]
        while (HW_UART_UTS(instance).B.TXFULL)
90014c30:	e51b3008 	ldr	r3, [fp, #-8]
90014c34:	e3530001 	cmp	r3, #1
90014c38:	0a000019 	beq	90014ca4 <UartPutChar+0x1e0>
90014c3c:	e51b3008 	ldr	r3, [fp, #-8]
90014c40:	e3530002 	cmp	r3, #2
90014c44:	0a000013 	beq	90014c98 <UartPutChar+0x1d4>
90014c48:	e51b3008 	ldr	r3, [fp, #-8]
90014c4c:	e3530003 	cmp	r3, #3
90014c50:	0a00000d 	beq	90014c8c <UartPutChar+0x1c8>
90014c54:	e51b3008 	ldr	r3, [fp, #-8]
90014c58:	e3530004 	cmp	r3, #4
90014c5c:	0a000007 	beq	90014c80 <UartPutChar+0x1bc>
90014c60:	e51b3008 	ldr	r3, [fp, #-8]
90014c64:	e3530005 	cmp	r3, #5
90014c68:	1a000002 	bne	90014c78 <UartPutChar+0x1b4>
90014c6c:	e3a03901 	mov	r3, #16384	; 0x4000
90014c70:	e340321f 	movt	r3, #543	; 0x21f
90014c74:	ea00000c 	b	90014cac <UartPutChar+0x1e8>
90014c78:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014c7c:	ea00000a 	b	90014cac <UartPutChar+0x1e8>
90014c80:	e3a03000 	mov	r3, #0
90014c84:	e340321f 	movt	r3, #543	; 0x21f
90014c88:	ea000007 	b	90014cac <UartPutChar+0x1e8>
90014c8c:	e3a03903 	mov	r3, #49152	; 0xc000
90014c90:	e340321e 	movt	r3, #542	; 0x21e
90014c94:	ea000004 	b	90014cac <UartPutChar+0x1e8>
90014c98:	e3a03902 	mov	r3, #32768	; 0x8000
90014c9c:	e340321e 	movt	r3, #542	; 0x21e
90014ca0:	ea000001 	b	90014cac <UartPutChar+0x1e8>
90014ca4:	e3a03000 	mov	r3, #0
90014ca8:	e3403202 	movt	r3, #514	; 0x202
90014cac:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90014cb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90014cb4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014cb8:	e28330b4 	add	r3, r3, #180	; 0xb4
90014cbc:	e5933000 	ldr	r3, [r3]
90014cc0:	e7e03253 	ubfx	r3, r3, #4, #1
90014cc4:	e6ef3073 	uxtb	r3, r3
90014cc8:	e3530000 	cmp	r3, #0
90014ccc:	1affffd7 	bne	90014c30 <UartPutChar+0x16c>
    HW_UART_UTXD_WR(instance, *ch);
90014cd0:	e51b3008 	ldr	r3, [fp, #-8]
90014cd4:	e3530001 	cmp	r3, #1
90014cd8:	0a000019 	beq	90014d44 <UartPutChar+0x280>
90014cdc:	e51b3008 	ldr	r3, [fp, #-8]
90014ce0:	e3530002 	cmp	r3, #2
90014ce4:	0a000013 	beq	90014d38 <UartPutChar+0x274>
90014ce8:	e51b3008 	ldr	r3, [fp, #-8]
90014cec:	e3530003 	cmp	r3, #3
90014cf0:	0a00000d 	beq	90014d2c <UartPutChar+0x268>
90014cf4:	e51b3008 	ldr	r3, [fp, #-8]
90014cf8:	e3530004 	cmp	r3, #4
90014cfc:	0a000007 	beq	90014d20 <UartPutChar+0x25c>
90014d00:	e51b3008 	ldr	r3, [fp, #-8]
90014d04:	e3530005 	cmp	r3, #5
90014d08:	1a000002 	bne	90014d18 <UartPutChar+0x254>
90014d0c:	e3a03901 	mov	r3, #16384	; 0x4000
90014d10:	e340321f 	movt	r3, #543	; 0x21f
90014d14:	ea00000c 	b	90014d4c <UartPutChar+0x288>
90014d18:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014d1c:	ea00000a 	b	90014d4c <UartPutChar+0x288>
90014d20:	e3a03000 	mov	r3, #0
90014d24:	e340321f 	movt	r3, #543	; 0x21f
90014d28:	ea000007 	b	90014d4c <UartPutChar+0x288>
90014d2c:	e3a03903 	mov	r3, #49152	; 0xc000
90014d30:	e340321e 	movt	r3, #542	; 0x21e
90014d34:	ea000004 	b	90014d4c <UartPutChar+0x288>
90014d38:	e3a03902 	mov	r3, #32768	; 0x8000
90014d3c:	e340321e 	movt	r3, #542	; 0x21e
90014d40:	ea000001 	b	90014d4c <UartPutChar+0x288>
90014d44:	e3a03000 	mov	r3, #0
90014d48:	e3403202 	movt	r3, #514	; 0x202
90014d4c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90014d50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90014d54:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014d58:	e2833040 	add	r3, r3, #64	; 0x40
90014d5c:	e1a02003 	mov	r2, r3
90014d60:	e51b300c 	ldr	r3, [fp, #-12]
90014d64:	e5d33000 	ldrb	r3, [r3]
90014d68:	e5823000 	str	r3, [r2]
    UartPutCharInstance(IMX6Q_UART_INSTANCE, &ch);
}
90014d6c:	e320f000 	nop	{0}
90014d70:	e28bd000 	add	sp, fp, #0
90014d74:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90014d78:	e12fff1e 	bx	lr

90014d7c <UartGetChar>:

static uint8_t UartGetChar()
{
90014d7c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90014d80:	e28db000 	add	fp, sp, #0
90014d84:	e24dd014 	sub	sp, sp, #20
90014d88:	e3a03002 	mov	r3, #2
90014d8c:	e50b3008 	str	r3, [fp, #-8]
    if (!(HW_UART_USR2(instance).B.RDR))
90014d90:	e51b3008 	ldr	r3, [fp, #-8]
90014d94:	e3530001 	cmp	r3, #1
90014d98:	0a000019 	beq	90014e04 <UartGetChar+0x88>
90014d9c:	e51b3008 	ldr	r3, [fp, #-8]
90014da0:	e3530002 	cmp	r3, #2
90014da4:	0a000013 	beq	90014df8 <UartGetChar+0x7c>
90014da8:	e51b3008 	ldr	r3, [fp, #-8]
90014dac:	e3530003 	cmp	r3, #3
90014db0:	0a00000d 	beq	90014dec <UartGetChar+0x70>
90014db4:	e51b3008 	ldr	r3, [fp, #-8]
90014db8:	e3530004 	cmp	r3, #4
90014dbc:	0a000007 	beq	90014de0 <UartGetChar+0x64>
90014dc0:	e51b3008 	ldr	r3, [fp, #-8]
90014dc4:	e3530005 	cmp	r3, #5
90014dc8:	1a000002 	bne	90014dd8 <UartGetChar+0x5c>
90014dcc:	e3a03901 	mov	r3, #16384	; 0x4000
90014dd0:	e340321f 	movt	r3, #543	; 0x21f
90014dd4:	ea00000c 	b	90014e0c <UartGetChar+0x90>
90014dd8:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014ddc:	ea00000a 	b	90014e0c <UartGetChar+0x90>
90014de0:	e3a03000 	mov	r3, #0
90014de4:	e340321f 	movt	r3, #543	; 0x21f
90014de8:	ea000007 	b	90014e0c <UartGetChar+0x90>
90014dec:	e3a03903 	mov	r3, #49152	; 0xc000
90014df0:	e340321e 	movt	r3, #542	; 0x21e
90014df4:	ea000004 	b	90014e0c <UartGetChar+0x90>
90014df8:	e3a03902 	mov	r3, #32768	; 0x8000
90014dfc:	e340321e 	movt	r3, #542	; 0x21e
90014e00:	ea000001 	b	90014e0c <UartGetChar+0x90>
90014e04:	e3a03000 	mov	r3, #0
90014e08:	e3403202 	movt	r3, #514	; 0x202
90014e0c:	e50b300c 	str	r3, [fp, #-12]
90014e10:	e51b300c 	ldr	r3, [fp, #-12]
90014e14:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014e18:	e2833098 	add	r3, r3, #152	; 0x98
90014e1c:	e5933000 	ldr	r3, [r3]
90014e20:	e7e03053 	ubfx	r3, r3, #0, #1
90014e24:	e6ef3073 	uxtb	r3, r3
90014e28:	e3530000 	cmp	r3, #0
90014e2c:	1a000001 	bne	90014e38 <UartGetChar+0xbc>
        return 0xFF;
90014e30:	e3a030ff 	mov	r3, #255	; 0xff
90014e34:	ea00002b 	b	90014ee8 <UartGetChar+0x16c>
    read_data = HW_UART_URXD_RD(instance); 
90014e38:	e51b3008 	ldr	r3, [fp, #-8]
90014e3c:	e3530001 	cmp	r3, #1
90014e40:	0a000019 	beq	90014eac <UartGetChar+0x130>
90014e44:	e51b3008 	ldr	r3, [fp, #-8]
90014e48:	e3530002 	cmp	r3, #2
90014e4c:	0a000013 	beq	90014ea0 <UartGetChar+0x124>
90014e50:	e51b3008 	ldr	r3, [fp, #-8]
90014e54:	e3530003 	cmp	r3, #3
90014e58:	0a00000d 	beq	90014e94 <UartGetChar+0x118>
90014e5c:	e51b3008 	ldr	r3, [fp, #-8]
90014e60:	e3530004 	cmp	r3, #4
90014e64:	0a000007 	beq	90014e88 <UartGetChar+0x10c>
90014e68:	e51b3008 	ldr	r3, [fp, #-8]
90014e6c:	e3530005 	cmp	r3, #5
90014e70:	1a000002 	bne	90014e80 <UartGetChar+0x104>
90014e74:	e3a03901 	mov	r3, #16384	; 0x4000
90014e78:	e340321f 	movt	r3, #543	; 0x21f
90014e7c:	ea00000c 	b	90014eb4 <UartGetChar+0x138>
90014e80:	e3a0360d 	mov	r3, #13631488	; 0xd00000
90014e84:	ea00000a 	b	90014eb4 <UartGetChar+0x138>
90014e88:	e3a03000 	mov	r3, #0
90014e8c:	e340321f 	movt	r3, #543	; 0x21f
90014e90:	ea000007 	b	90014eb4 <UartGetChar+0x138>
90014e94:	e3a03903 	mov	r3, #49152	; 0xc000
90014e98:	e340321e 	movt	r3, #542	; 0x21e
90014e9c:	ea000004 	b	90014eb4 <UartGetChar+0x138>
90014ea0:	e3a03902 	mov	r3, #32768	; 0x8000
90014ea4:	e340321e 	movt	r3, #542	; 0x21e
90014ea8:	ea000001 	b	90014eb4 <UartGetChar+0x138>
90014eac:	e3a03000 	mov	r3, #0
90014eb0:	e3403202 	movt	r3, #514	; 0x202
90014eb4:	e50b3010 	str	r3, [fp, #-16]
90014eb8:	e51b3010 	ldr	r3, [fp, #-16]
90014ebc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90014ec0:	e5933000 	ldr	r3, [r3]
90014ec4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (read_data & 0x7C00)
90014ec8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90014ecc:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
90014ed0:	e3530000 	cmp	r3, #0
90014ed4:	0a000001 	beq	90014ee0 <UartGetChar+0x164>
        return 0xFF;
90014ed8:	e3a030ff 	mov	r3, #255	; 0xff
90014edc:	ea000001 	b	90014ee8 <UartGetChar+0x16c>
    return (uint8_t) read_data;
90014ee0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90014ee4:	e6ef3073 	uxtb	r3, r3
    return UartGetCharInstance(IMX6Q_UART_INSTANCE);
}
90014ee8:	e1a00003 	mov	r0, r3
90014eec:	e28bd000 	add	sp, fp, #0
90014ef0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90014ef4:	e12fff1e 	bx	lr

90014ef8 <UartInit>:

static void UartInit()
{
90014ef8:	e92d4800 	push	{fp, lr}
90014efc:	e28db004 	add	fp, sp, #4
    UartInitInstance(IMX6Q_UART_INSTANCE);
90014f00:	e3a00002 	mov	r0, #2
90014f04:	ebfffed6 	bl	90014a64 <UartInitInstance>
}
90014f08:	e320f000 	nop	{0}
90014f0c:	e8bd8800 	pop	{fp, pc}

90014f10 <UartGetIrqnum>:

static uint32_t UartGetIrqnum()
{
90014f10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90014f14:	e28db000 	add	fp, sp, #0
90014f18:	e24dd00c 	sub	sp, sp, #12
90014f1c:	e3a03002 	mov	r3, #2
90014f20:	e50b3008 	str	r3, [fp, #-8]
    return UART_IRQS(instance);
90014f24:	e51b3008 	ldr	r3, [fp, #-8]
90014f28:	e3530001 	cmp	r3, #1
90014f2c:	0a000015 	beq	90014f88 <UartGetIrqnum+0x78>
90014f30:	e51b3008 	ldr	r3, [fp, #-8]
90014f34:	e3530002 	cmp	r3, #2
90014f38:	0a000010 	beq	90014f80 <UartGetIrqnum+0x70>
90014f3c:	e51b3008 	ldr	r3, [fp, #-8]
90014f40:	e3530003 	cmp	r3, #3
90014f44:	0a00000b 	beq	90014f78 <UartGetIrqnum+0x68>
90014f48:	e51b3008 	ldr	r3, [fp, #-8]
90014f4c:	e3530004 	cmp	r3, #4
90014f50:	0a000006 	beq	90014f70 <UartGetIrqnum+0x60>
90014f54:	e51b3008 	ldr	r3, [fp, #-8]
90014f58:	e3530005 	cmp	r3, #5
90014f5c:	1a000001 	bne	90014f68 <UartGetIrqnum+0x58>
90014f60:	e3a0303e 	mov	r3, #62	; 0x3e
90014f64:	ea000009 	b	90014f90 <UartGetIrqnum+0x80>
90014f68:	e3e03000 	mvn	r3, #0
90014f6c:	ea000007 	b	90014f90 <UartGetIrqnum+0x80>
90014f70:	e3a0303d 	mov	r3, #61	; 0x3d
90014f74:	ea000005 	b	90014f90 <UartGetIrqnum+0x80>
90014f78:	e3a0303c 	mov	r3, #60	; 0x3c
90014f7c:	ea000003 	b	90014f90 <UartGetIrqnum+0x80>
90014f80:	e3a0303b 	mov	r3, #59	; 0x3b
    return UartGetIrqnumInstance(IMX6Q_UART_INSTANCE);
90014f84:	ea000001 	b	90014f90 <UartGetIrqnum+0x80>
    return UART_IRQS(instance);
90014f88:	e3a0303a 	mov	r3, #58	; 0x3a
    return UartGetIrqnumInstance(IMX6Q_UART_INSTANCE);
90014f8c:	eaffffff 	b	90014f90 <UartGetIrqnum+0x80>
}
90014f90:	e1a00003 	mov	r0, r3
90014f94:	e28bd000 	add	sp, fp, #0
90014f98:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90014f9c:	e12fff1e 	bx	lr

90014fa0 <hardkernel_uart_init>:
    .putc = UartPutChar,
    .getc = UartGetChar,
};

struct XiziSerialDriver* hardkernel_uart_init(struct TraceTag* hardkernel_tag)
{
90014fa0:	e92d4800 	push	{fp, lr}
90014fa4:	e28db004 	add	fp, sp, #4
90014fa8:	e24dd008 	sub	sp, sp, #8
90014fac:	e50b0008 	str	r0, [fp, #-8]
    hardkernel_serial_driver.sys_serial_init();
90014fb0:	e303331c 	movw	r3, #13084	; 0x331c
90014fb4:	e3493002 	movt	r3, #36866	; 0x9002
90014fb8:	e5933000 	ldr	r3, [r3]
90014fbc:	e12fff33 	blx	r3
    return &hardkernel_serial_driver;
90014fc0:	e303331c 	movw	r3, #13084	; 0x331c
90014fc4:	e3493002 	movt	r3, #36866	; 0x9002
90014fc8:	e1a00003 	mov	r0, r3
90014fcc:	e24bd004 	sub	sp, fp, #4
90014fd0:	e8bd8800 	pop	{fp, pc}

90014fd4 <mxc_iomux_v3_init>:
#include "mmio_access.h"

static void* base;

void mxc_iomux_v3_init(void* iomux_v3_base)
{
90014fd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90014fd8:	e28db000 	add	fp, sp, #0
90014fdc:	e24dd00c 	sub	sp, sp, #12
90014fe0:	e50b0008 	str	r0, [fp, #-8]
    base = iomux_v3_base;
90014fe4:	e30a3858 	movw	r3, #43096	; 0xa858
90014fe8:	e3493019 	movt	r3, #36889	; 0x9019
90014fec:	e51b2008 	ldr	r2, [fp, #-8]
90014ff0:	e5832000 	str	r2, [r3]
}
90014ff4:	e320f000 	nop	{0}
90014ff8:	e28bd000 	add	sp, fp, #0
90014ffc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015000:	e12fff1e 	bx	lr

90015004 <mxc_iomux_v3_setup_pad>:

/*
 * configures a single pad in the iomuxer
 */
int mxc_iomux_v3_setup_pad(iomux_v3_cfg_t pad)
{
90015004:	e92d0bf0 	push	{r4, r5, r6, r7, r8, r9, fp}
90015008:	e28db018 	add	fp, sp, #24
9001500c:	e24dd054 	sub	sp, sp, #84	; 0x54
90015010:	e14b06f4 	strd	r0, [fp, #-100]	; 0xffffff9c
    uint32_t mux_ctrl_ofs = (pad & MUX_CTRL_OFS_MASK) >> MUX_CTRL_OFS_SHIFT;
90015014:	e51b1064 	ldr	r1, [fp, #-100]	; 0xffffff9c
90015018:	e7eb1051 	ubfx	r1, r1, #0, #12
9001501c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uint32_t mux_mode = (pad & MUX_MODE_MASK) >> MUX_MODE_SHIFT;
90015020:	e14b06d4 	ldrd	r0, [fp, #-100]	; 0xffffff9c
90015024:	e1a01221 	lsr	r1, r1, #4
90015028:	e50b106c 	str	r1, [fp, #-108]	; 0xffffff94
9001502c:	e3a01000 	mov	r1, #0
90015030:	e50b1068 	str	r1, [fp, #-104]	; 0xffffff98
90015034:	e51b106c 	ldr	r1, [fp, #-108]	; 0xffffff94
90015038:	e201101f 	and	r1, r1, #31
9001503c:	e50b1028 	str	r1, [fp, #-40]	; 0xffffffd8
    uint32_t sel_input_ofs = (pad & MUX_SEL_INPUT_OFS_MASK) >> MUX_SEL_INPUT_OFS_SHIFT;
90015040:	e14b06d4 	ldrd	r0, [fp, #-100]	; 0xffffff9c
90015044:	e1a04c20 	lsr	r4, r0, #24
90015048:	e1844401 	orr	r4, r4, r1, lsl #8
9001504c:	e1a05c21 	lsr	r5, r1, #24
90015050:	e1a01004 	mov	r1, r4
90015054:	e7eb1051 	ubfx	r1, r1, #0, #12
90015058:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    uint32_t sel_input = (pad & MUX_SEL_INPUT_MASK) >> MUX_SEL_INPUT_SHIFT;
9001505c:	e14b06d4 	ldrd	r0, [fp, #-100]	; 0xffffff9c
90015060:	e1a08e21 	lsr	r8, r1, #28
90015064:	e3a09000 	mov	r9, #0
90015068:	e1a01008 	mov	r1, r8
9001506c:	e50b1030 	str	r1, [fp, #-48]	; 0xffffffd0
    uint32_t pad_ctrl_ofs = (pad & MUX_PAD_CTRL_OFS_MASK) >> MUX_PAD_CTRL_OFS_SHIFT;
90015070:	e14b06d4 	ldrd	r0, [fp, #-100]	; 0xffffff9c
90015074:	e1a02620 	lsr	r2, r0, #12
90015078:	e1822a01 	orr	r2, r2, r1, lsl #20
9001507c:	e1a03621 	lsr	r3, r1, #12
90015080:	e1a03002 	mov	r3, r2
90015084:	e7eb3053 	ubfx	r3, r3, #0, #12
90015088:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    uint32_t pad_ctrl = (pad & MUX_PAD_CTRL_MASK) >> MUX_PAD_CTRL_SHIFT;
9001508c:	e14b26d4 	ldrd	r2, [fp, #-100]	; 0xffffff9c
90015090:	e1a064a3 	lsr	r6, r3, #9
90015094:	e3a07000 	mov	r7, #0
90015098:	e1a03006 	mov	r3, r6
9001509c:	e7f23053 	ubfx	r3, r3, #0, #19
900150a0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

    if (mux_ctrl_ofs)
900150a4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900150a8:	e3530000 	cmp	r3, #0
900150ac:	0a00000e 	beq	900150ec <mxc_iomux_v3_setup_pad+0xe8>
        mmio_write((uintptr_t)(base + mux_ctrl_ofs), (uintptr_t)(mux_mode));
900150b0:	e30a3858 	movw	r3, #43096	; 0xa858
900150b4:	e3493019 	movt	r3, #36889	; 0x9019
900150b8:	e5932000 	ldr	r2, [r3]
900150bc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900150c0:	e0823003 	add	r3, r2, r3
900150c4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
900150c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
900150cc:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
900150d0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
900150d4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
900150d8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
900150dc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    *(volatile mmio_reg_t*)(MMIO_P2V(paddr)) = (value);
900150e0:	e1a02003 	mov	r2, r3
900150e4:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
900150e8:	e5823000 	str	r3, [r2]

    if (sel_input_ofs)
900150ec:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
900150f0:	e3530000 	cmp	r3, #0
900150f4:	0a00000e 	beq	90015134 <mxc_iomux_v3_setup_pad+0x130>
        mmio_write((uintptr_t)(base + sel_input_ofs), (uintptr_t)(sel_input));
900150f8:	e30a3858 	movw	r3, #43096	; 0xa858
900150fc:	e3493019 	movt	r3, #36889	; 0x9019
90015100:	e5932000 	ldr	r2, [r3]
90015104:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90015108:	e0823003 	add	r3, r2, r3
9001510c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
90015110:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90015114:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
90015118:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
9001511c:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    return (DEV_VRTMEM_BASE - DEV_PHYMEM_BASE) + paddr;
90015120:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
90015124:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    *(volatile mmio_reg_t*)(MMIO_P2V(paddr)) = (value);
90015128:	e1a02003 	mov	r2, r3
9001512c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
90015130:	e5823000 	str	r3, [r2]

    if (!(pad_ctrl & NO_PAD_CTRL) && pad_ctrl_ofs) {
90015134:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015138:	e2033802 	and	r3, r3, #131072	; 0x20000
9001513c:	e3530000 	cmp	r3, #0
90015140:	1a00001b 	bne	900151b4 <mxc_iomux_v3_setup_pad+0x1b0>
90015144:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
90015148:	e3530000 	cmp	r3, #0
9001514c:	0a000018 	beq	900151b4 <mxc_iomux_v3_setup_pad+0x1b0>
        if (pad_ctrl & PAD_CTL_LVE) {
90015150:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015154:	e2033701 	and	r3, r3, #262144	; 0x40000
90015158:	e3530000 	cmp	r3, #0
9001515c:	0a000005 	beq	90015178 <mxc_iomux_v3_setup_pad+0x174>
            /* Set the bit for LVE */
            pad_ctrl |= (1 << PAD_CTL_LVE_OFFSET);
90015160:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015164:	e3833501 	orr	r3, r3, #4194304	; 0x400000
90015168:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
            pad_ctrl &= ~(PAD_CTL_LVE);
9001516c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015170:	e3c33701 	bic	r3, r3, #262144	; 0x40000
90015174:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        }
        mmio_write((uintptr_t)(base + pad_ctrl_ofs), (uintptr_t)(pad_ctrl));
90015178:	e30a3858 	movw	r3, #43096	; 0xa858
9001517c:	e3493019 	movt	r3, #36889	; 0x9019
90015180:	e5932000 	ldr	r2, [r3]
90015184:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
90015188:	e0823003 	add	r3, r2, r3
9001518c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
90015190:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015194:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
90015198:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001519c:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    return (DEV_VRTMEM_BASE - DEV_PHYMEM_BASE) + paddr;
900151a0:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
900151a4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    *(volatile mmio_reg_t*)(MMIO_P2V(paddr)) = (value);
900151a8:	e1a02003 	mov	r2, r3
900151ac:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
900151b0:	e5823000 	str	r3, [r2]
    }

    return 0;
900151b4:	e3a03000 	mov	r3, #0
}
900151b8:	e1a00003 	mov	r0, r3
900151bc:	e24bd018 	sub	sp, fp, #24
900151c0:	e8bd0bf0 	pop	{r4, r5, r6, r7, r8, r9, fp}
900151c4:	e12fff1e 	bx	lr

900151c8 <proxy>:
    struct TraceTag uart_driver_tag;
    struct XiziSerialDriver* serial;
};

static struct PrintProxy* const proxy()
{
900151c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900151cc:	e28db000 	add	fp, sp, #0
    static struct PrintProxy serial_proxy;
    return &serial_proxy;
900151d0:	e30a385c 	movw	r3, #43100	; 0xa85c
900151d4:	e3493019 	movt	r3, #36889	; 0x9019
}
900151d8:	e1a00003 	mov	r0, r3
900151dc:	e28bd000 	add	sp, fp, #0
900151e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900151e4:	e12fff1e 	bx	lr

900151e8 <serial_init>:

int serial_init(struct TraceTag* uart_driver_tag)
{
900151e8:	e92d4810 	push	{r4, fp, lr}
900151ec:	e28db008 	add	fp, sp, #8
900151f0:	e24dd00c 	sub	sp, sp, #12
900151f4:	e50b0010 	str	r0, [fp, #-16]
    proxy()->uart_driver_tag = *uart_driver_tag;
900151f8:	ebfffff2 	bl	900151c8 <proxy>
900151fc:	e1a03000 	mov	r3, r0
90015200:	e51b2010 	ldr	r2, [fp, #-16]
90015204:	e8920003 	ldm	r2, {r0, r1}
90015208:	e8830003 	stm	r3, {r0, r1}
    proxy()->serial = AchieveResource(&proxy()->uart_driver_tag);
9001520c:	ebffffed 	bl	900151c8 <proxy>
90015210:	e1a04000 	mov	r4, r0
90015214:	ebffffeb 	bl	900151c8 <proxy>
90015218:	e1a03000 	mov	r3, r0
9001521c:	e1a00003 	mov	r0, r3
90015220:	eb000bad 	bl	900180dc <AchieveResource>
90015224:	e1a03000 	mov	r3, r0
90015228:	e5843008 	str	r3, [r4, #8]
    return 0;
9001522c:	e3a03000 	mov	r3, #0
}
90015230:	e1a00003 	mov	r0, r3
90015234:	e24bd008 	sub	sp, fp, #8
90015238:	e8bd8810 	pop	{r4, fp, pc}

9001523c <PrintInt>:

static void PrintInt(int xx, int base, int sign)
{
9001523c:	e92d4810 	push	{r4, fp, lr}
90015240:	e28db008 	add	fp, sp, #8
90015244:	e24dd02c 	sub	sp, sp, #44	; 0x2c
90015248:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
9001524c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
90015250:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i;
    uint32_t x;

    if (sign && (sign = xx < 0)) {
90015254:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90015258:	e3530000 	cmp	r3, #0
9001525c:	0a00000a 	beq	9001528c <PrintInt+0x50>
90015260:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90015264:	e1a03fa3 	lsr	r3, r3, #31
90015268:	e6ef3073 	uxtb	r3, r3
9001526c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
90015270:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90015274:	e3530000 	cmp	r3, #0
90015278:	0a000003 	beq	9001528c <PrintInt+0x50>
        x = -xx;
9001527c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90015280:	e2633000 	rsb	r3, r3, #0
90015284:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90015288:	ea000001 	b	90015294 <PrintInt+0x58>
    } else {
        x = xx;
9001528c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90015290:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    }

    i = 0;
90015294:	e3a03000 	mov	r3, #0
90015298:	e50b3010 	str	r3, [fp, #-16]

    do {
        buf[i++] = digits[x % base];
9001529c:	e51b4010 	ldr	r4, [fp, #-16]
900152a0:	e2843001 	add	r3, r4, #1
900152a4:	e50b3010 	str	r3, [fp, #-16]
900152a8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
900152ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900152b0:	e1a01002 	mov	r1, r2
900152b4:	e1a00003 	mov	r0, r3
900152b8:	fa002d0f 	blx	900206fc <__aeabi_uidivmod>
900152bc:	e1a03001 	mov	r3, r1
900152c0:	e1a02003 	mov	r2, r3
900152c4:	e303332c 	movw	r3, #13100	; 0x332c
900152c8:	e3493002 	movt	r3, #36866	; 0x9002
900152cc:	e7d32002 	ldrb	r2, [r3, r2]
900152d0:	e24b300c 	sub	r3, fp, #12
900152d4:	e0833004 	add	r3, r3, r4
900152d8:	e5432018 	strb	r2, [r3, #-24]	; 0xffffffe8
    } while ((x /= base) != 0);
900152dc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
900152e0:	e1a01003 	mov	r1, r3
900152e4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
900152e8:	fa002c6c 	blx	900204a0 <__udivsi3>
900152ec:	e1a03000 	mov	r3, r0
900152f0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
900152f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900152f8:	e3530000 	cmp	r3, #0
900152fc:	1affffe6 	bne	9001529c <PrintInt+0x60>

    if (sign)
90015300:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90015304:	e3530000 	cmp	r3, #0
90015308:	0a000011 	beq	90015354 <PrintInt+0x118>
        buf[i++] = '-';
9001530c:	e51b3010 	ldr	r3, [fp, #-16]
90015310:	e2832001 	add	r2, r3, #1
90015314:	e50b2010 	str	r2, [fp, #-16]
90015318:	e24b200c 	sub	r2, fp, #12
9001531c:	e0823003 	add	r3, r2, r3
90015320:	e3a0202d 	mov	r2, #45	; 0x2d
90015324:	e5432018 	strb	r2, [r3, #-24]	; 0xffffffe8

    while (--i >= 0)
90015328:	ea000009 	b	90015354 <PrintInt+0x118>
        proxy()->serial->putc(buf[i]);
9001532c:	ebffffa5 	bl	900151c8 <proxy>
90015330:	e1a03000 	mov	r3, r0
90015334:	e5933008 	ldr	r3, [r3, #8]
90015338:	e593300c 	ldr	r3, [r3, #12]
9001533c:	e24b1024 	sub	r1, fp, #36	; 0x24
90015340:	e51b2010 	ldr	r2, [fp, #-16]
90015344:	e0812002 	add	r2, r1, r2
90015348:	e5d22000 	ldrb	r2, [r2]
9001534c:	e1a00002 	mov	r0, r2
90015350:	e12fff33 	blx	r3
    while (--i >= 0)
90015354:	e51b3010 	ldr	r3, [fp, #-16]
90015358:	e2433001 	sub	r3, r3, #1
9001535c:	e50b3010 	str	r3, [fp, #-16]
90015360:	e51b3010 	ldr	r3, [fp, #-16]
90015364:	e3530000 	cmp	r3, #0
90015368:	aaffffef 	bge	9001532c <PrintInt+0xf0>
}
9001536c:	e320f000 	nop	{0}
90015370:	e24bd008 	sub	sp, fp, #8
90015374:	e8bd8810 	pop	{r4, fp, pc}

90015378 <KPrintf>:

void KPrintf(char* fmt, ...)
{
90015378:	e92d000f 	push	{r0, r1, r2, r3}
9001537c:	e92d4800 	push	{fp, lr}
90015380:	e28db004 	add	fp, sp, #4
90015384:	e24dd010 	sub	sp, sp, #16
    int i, c;
    uint32_t* argp;
    char* s;

    if (fmt == 0) {
90015388:	e59b3004 	ldr	r3, [fp, #4]
9001538c:	e3530000 	cmp	r3, #0
90015390:	1a000003 	bne	900153a4 <KPrintf+0x2c>
        KPrintf("null fmt");
90015394:	e301021c 	movw	r0, #4636	; 0x121c
90015398:	e3490002 	movt	r0, #36866	; 0x9002
9001539c:	ebfffff5 	bl	90015378 <KPrintf>
        return;
900153a0:	ea00007b 	b	90015594 <KPrintf+0x21c>
    }

    argp = (uint32_t*)(void*)(&fmt + 1);
900153a4:	e28b3008 	add	r3, fp, #8
900153a8:	e50b300c 	str	r3, [fp, #-12]

    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
900153ac:	e3a03000 	mov	r3, #0
900153b0:	e50b3008 	str	r3, [fp, #-8]
900153b4:	ea00006c 	b	9001556c <KPrintf+0x1f4>
        if (c != '%') {
900153b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900153bc:	e3530025 	cmp	r3, #37	; 0x25
900153c0:	0a000008 	beq	900153e8 <KPrintf+0x70>
            proxy()->serial->putc(c);
900153c4:	ebffff7f 	bl	900151c8 <proxy>
900153c8:	e1a03000 	mov	r3, r0
900153cc:	e5933008 	ldr	r3, [r3, #8]
900153d0:	e593300c 	ldr	r3, [r3, #12]
900153d4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
900153d8:	e6ef2072 	uxtb	r2, r2
900153dc:	e1a00002 	mov	r0, r2
900153e0:	e12fff33 	blx	r3
            continue;
900153e4:	ea00005d 	b	90015560 <KPrintf+0x1e8>
        }

        c = fmt[++i] & 0xff;
900153e8:	e59b2004 	ldr	r2, [fp, #4]
900153ec:	e51b3008 	ldr	r3, [fp, #-8]
900153f0:	e2833001 	add	r3, r3, #1
900153f4:	e50b3008 	str	r3, [fp, #-8]
900153f8:	e51b3008 	ldr	r3, [fp, #-8]
900153fc:	e0823003 	add	r3, r2, r3
90015400:	e5d33000 	ldrb	r3, [r3]
90015404:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        if (!c)
90015408:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001540c:	e3530000 	cmp	r3, #0
90015410:	0a00005e 	beq	90015590 <KPrintf+0x218>
            break;

        switch (c) {
90015414:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015418:	e3530070 	cmp	r3, #112	; 0x70
9001541c:	0a000014 	beq	90015474 <KPrintf+0xfc>
90015420:	e3530070 	cmp	r3, #112	; 0x70
90015424:	ca000004 	bgt	9001543c <KPrintf+0xc4>
90015428:	e3530025 	cmp	r3, #37	; 0x25
9001542c:	0a000035 	beq	90015508 <KPrintf+0x190>
90015430:	e3530064 	cmp	r3, #100	; 0x64
90015434:	0a000005 	beq	90015450 <KPrintf+0xd8>
90015438:	ea000039 	b	90015524 <KPrintf+0x1ac>
9001543c:	e3530073 	cmp	r3, #115	; 0x73
90015440:	0a000014 	beq	90015498 <KPrintf+0x120>
90015444:	e3530078 	cmp	r3, #120	; 0x78
90015448:	0a000009 	beq	90015474 <KPrintf+0xfc>
9001544c:	ea000034 	b	90015524 <KPrintf+0x1ac>
        case 'd':
            PrintInt(*argp++, 10, 1);
90015450:	e51b300c 	ldr	r3, [fp, #-12]
90015454:	e2832004 	add	r2, r3, #4
90015458:	e50b200c 	str	r2, [fp, #-12]
9001545c:	e5933000 	ldr	r3, [r3]
90015460:	e3a02001 	mov	r2, #1
90015464:	e3a0100a 	mov	r1, #10
90015468:	e1a00003 	mov	r0, r3
9001546c:	ebffff72 	bl	9001523c <PrintInt>
            break;
90015470:	ea00003a 	b	90015560 <KPrintf+0x1e8>

        case 'x':
        case 'p':
            PrintInt(*argp++, 16, 0);
90015474:	e51b300c 	ldr	r3, [fp, #-12]
90015478:	e2832004 	add	r2, r3, #4
9001547c:	e50b200c 	str	r2, [fp, #-12]
90015480:	e5933000 	ldr	r3, [r3]
90015484:	e3a02000 	mov	r2, #0
90015488:	e3a01010 	mov	r1, #16
9001548c:	e1a00003 	mov	r0, r3
90015490:	ebffff69 	bl	9001523c <PrintInt>
            break;
90015494:	ea000031 	b	90015560 <KPrintf+0x1e8>

        case 's':
            if ((s = (char*)*argp++) == 0) {
90015498:	e51b300c 	ldr	r3, [fp, #-12]
9001549c:	e2832004 	add	r2, r3, #4
900154a0:	e50b200c 	str	r2, [fp, #-12]
900154a4:	e5933000 	ldr	r3, [r3]
900154a8:	e50b3010 	str	r3, [fp, #-16]
900154ac:	e51b3010 	ldr	r3, [fp, #-16]
900154b0:	e3530000 	cmp	r3, #0
900154b4:	1a00000e 	bne	900154f4 <KPrintf+0x17c>
                s = "(null)";
900154b8:	e3013228 	movw	r3, #4648	; 0x1228
900154bc:	e3493002 	movt	r3, #36866	; 0x9002
900154c0:	e50b3010 	str	r3, [fp, #-16]
            }

            for (; *s; s++) {
900154c4:	ea00000a 	b	900154f4 <KPrintf+0x17c>
                proxy()->serial->putc(*s);
900154c8:	ebffff3e 	bl	900151c8 <proxy>
900154cc:	e1a03000 	mov	r3, r0
900154d0:	e5933008 	ldr	r3, [r3, #8]
900154d4:	e593300c 	ldr	r3, [r3, #12]
900154d8:	e51b2010 	ldr	r2, [fp, #-16]
900154dc:	e5d22000 	ldrb	r2, [r2]
900154e0:	e1a00002 	mov	r0, r2
900154e4:	e12fff33 	blx	r3
            for (; *s; s++) {
900154e8:	e51b3010 	ldr	r3, [fp, #-16]
900154ec:	e2833001 	add	r3, r3, #1
900154f0:	e50b3010 	str	r3, [fp, #-16]
900154f4:	e51b3010 	ldr	r3, [fp, #-16]
900154f8:	e5d33000 	ldrb	r3, [r3]
900154fc:	e3530000 	cmp	r3, #0
90015500:	1afffff0 	bne	900154c8 <KPrintf+0x150>
            }
            break;
90015504:	ea000015 	b	90015560 <KPrintf+0x1e8>

        case '%':
            proxy()->serial->putc('%');
90015508:	ebffff2e 	bl	900151c8 <proxy>
9001550c:	e1a03000 	mov	r3, r0
90015510:	e5933008 	ldr	r3, [r3, #8]
90015514:	e593300c 	ldr	r3, [r3, #12]
90015518:	e3a00025 	mov	r0, #37	; 0x25
9001551c:	e12fff33 	blx	r3
            break;
90015520:	ea00000e 	b	90015560 <KPrintf+0x1e8>

        default:
            // Print unknown % sequence to draw attention.
            proxy()->serial->putc('%');
90015524:	ebffff27 	bl	900151c8 <proxy>
90015528:	e1a03000 	mov	r3, r0
9001552c:	e5933008 	ldr	r3, [r3, #8]
90015530:	e593300c 	ldr	r3, [r3, #12]
90015534:	e3a00025 	mov	r0, #37	; 0x25
90015538:	e12fff33 	blx	r3
            proxy()->serial->putc(c);
9001553c:	ebffff21 	bl	900151c8 <proxy>
90015540:	e1a03000 	mov	r3, r0
90015544:	e5933008 	ldr	r3, [r3, #8]
90015548:	e593300c 	ldr	r3, [r3, #12]
9001554c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90015550:	e6ef2072 	uxtb	r2, r2
90015554:	e1a00002 	mov	r0, r2
90015558:	e12fff33 	blx	r3
            break;
9001555c:	e320f000 	nop	{0}
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
90015560:	e51b3008 	ldr	r3, [fp, #-8]
90015564:	e2833001 	add	r3, r3, #1
90015568:	e50b3008 	str	r3, [fp, #-8]
9001556c:	e59b2004 	ldr	r2, [fp, #4]
90015570:	e51b3008 	ldr	r3, [fp, #-8]
90015574:	e0823003 	add	r3, r2, r3
90015578:	e5d33000 	ldrb	r3, [r3]
9001557c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90015580:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015584:	e3530000 	cmp	r3, #0
90015588:	1affff8a 	bne	900153b8 <KPrintf+0x40>
9001558c:	ea000000 	b	90015594 <KPrintf+0x21c>
            break;
90015590:	e320f000 	nop	{0}
        }
    }
}
90015594:	e24bd004 	sub	sp, fp, #4
90015598:	e8bd4800 	pop	{fp, lr}
9001559c:	e28dd010 	add	sp, sp, #16
900155a0:	e12fff1e 	bx	lr

900155a4 <InvalidateL1Dcache>:
*************************************************/

#include "l1_cache.h"

void InvalidateL1Dcache(uintptr_t start, uintptr_t end)
{
900155a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900155a8:	e28db000 	add	fp, sp, #0
900155ac:	e24dd024 	sub	sp, sp, #36	; 0x24
900155b0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
900155b4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uintptr_t length = end - start;
900155b8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
900155bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900155c0:	e0423003 	sub	r3, r2, r3
900155c4:	e50b300c 	str	r3, [fp, #-12]
    void* addr = (void*)start;
900155c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900155cc:	e50b3008 	str	r3, [fp, #-8]

    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
900155d0:	e3a03000 	mov	r3, #0
900155d4:	e50b3010 	str	r3, [fp, #-16]
900155d8:	e3a03000 	mov	r3, #0
900155dc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    
    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
900155e0:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
900155e4:	e50b3010 	str	r3, [fp, #-16]
    line_size = 1 << ((csidr & 0x7) + 4);
900155e8:	e51b3010 	ldr	r3, [fp, #-16]
900155ec:	e2033007 	and	r3, r3, #7
900155f0:	e2833004 	add	r3, r3, #4
900155f4:	e3a02001 	mov	r2, #1
900155f8:	e1a03312 	lsl	r3, r2, r3
900155fc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    // align the address with line
    const void * end_addr = (const void *)((uint32_t)addr + length);
90015600:	e51b2008 	ldr	r2, [fp, #-8]
90015604:	e51b300c 	ldr	r3, [fp, #-12]
90015608:	e0823003 	add	r3, r2, r3
9001560c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
90015610:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015614:	e2632000 	rsb	r2, r3, #0
90015618:	e51b3008 	ldr	r3, [fp, #-8]
9001561c:	e0033002 	and	r3, r3, r2
90015620:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        _ARM_MCR(15, 0, va, 7, 6, 1);
90015624:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90015628:	ee073f36 	mcr	15, 0, r3, cr7, cr6, {1}
        // increment addres to next line and decrement lenght
        addr = (void*)((uint32_t)addr + line_size);
9001562c:	e51b2008 	ldr	r2, [fp, #-8]
90015630:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015634:	e0823003 	add	r3, r2, r3
90015638:	e50b3008 	str	r3, [fp, #-8]
    } while (addr < end_addr);
9001563c:	e51b2008 	ldr	r2, [fp, #-8]
90015640:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90015644:	e1520003 	cmp	r2, r3
90015648:	3afffff0 	bcc	90015610 <InvalidateL1Dcache+0x6c>
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
9001564c:	f57ff04f 	dsb	sy
}
90015650:	e320f000 	nop	{0}
90015654:	e28bd000 	add	sp, fp, #0
90015658:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001565c:	e12fff1e 	bx	lr

90015660 <InvalidateL1DcacheAll>:

void InvalidateL1DcacheAll(void)
{
90015660:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015664:	e28db000 	add	fp, sp, #0
90015668:	e24dd014 	sub	sp, sp, #20
    uint32_t csid; // Cache Size ID
    uint32_t wayset; // wayset parameter
    int num_sets; // number of sets
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0); // Read Cache Size ID
9001566c:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
90015670:	e50b3010 	str	r3, [fp, #-16]

    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT)
90015674:	e51b3010 	ldr	r3, [fp, #-16]
90015678:	e1a031a3 	lsr	r3, r3, #3
9001567c:	e7e93053 	ubfx	r3, r3, #0, #10
90015680:	e50b300c 	str	r3, [fp, #-12]

    // Invalidation all lines (all Sets in all ways)
    while (num_ways >= 0) {
90015684:	ea000015 	b	900156e0 <InvalidateL1DcacheAll+0x80>
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK) >> csid_NUMSETS_SHIFT)
90015688:	e51b3010 	ldr	r3, [fp, #-16]
9001568c:	e1a036a3 	lsr	r3, r3, #13
90015690:	e7ee3053 	ubfx	r3, r3, #0, #15
90015694:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
90015698:	ea00000a 	b	900156c8 <InvalidateL1DcacheAll+0x68>
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_sets << 3SETWAY_WAY_SHIFT)
9001569c:	e51b3008 	ldr	r3, [fp, #-8]
900156a0:	e1a02283 	lsl	r2, r3, #5
900156a4:	e51b300c 	ldr	r3, [fp, #-12]
900156a8:	e1a03f03 	lsl	r3, r3, #30
900156ac:	e1823003 	orr	r3, r2, r3
900156b0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            // invalidate line if we know set and way
            _ARM_MCR(15, 0, wayset, 7, 6, 2);
900156b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900156b8:	ee073f56 	mcr	15, 0, r3, cr7, cr6, {2}
            num_sets--;
900156bc:	e51b3008 	ldr	r3, [fp, #-8]
900156c0:	e2433001 	sub	r3, r3, #1
900156c4:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
900156c8:	e51b3008 	ldr	r3, [fp, #-8]
900156cc:	e3530000 	cmp	r3, #0
900156d0:	aafffff1 	bge	9001569c <InvalidateL1DcacheAll+0x3c>
        }
        num_ways--;
900156d4:	e51b300c 	ldr	r3, [fp, #-12]
900156d8:	e2433001 	sub	r3, r3, #1
900156dc:	e50b300c 	str	r3, [fp, #-12]
    while (num_ways >= 0) {
900156e0:	e51b300c 	ldr	r3, [fp, #-12]
900156e4:	e3530000 	cmp	r3, #0
900156e8:	aaffffe6 	bge	90015688 <InvalidateL1DcacheAll+0x28>
    }

    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
900156ec:	f57ff04f 	dsb	sy
}
900156f0:	e320f000 	nop	{0}
900156f4:	e28bd000 	add	sp, fp, #0
900156f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900156fc:	e12fff1e 	bx	lr

90015700 <CleanL1Dcache>:

void CleanL1Dcache(uintptr_t start, uintptr_t end)
{
90015700:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015704:	e28db000 	add	fp, sp, #0
90015708:	e24dd024 	sub	sp, sp, #36	; 0x24
9001570c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90015710:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    void* addr = (void*)start;
90015714:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015718:	e50b3008 	str	r3, [fp, #-8]
    uintptr_t length = end - start;
9001571c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
90015720:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015724:	e0423003 	sub	r3, r2, r3
90015728:	e50b300c 	str	r3, [fp, #-12]
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
9001572c:	e3a03000 	mov	r3, #0
90015730:	e50b3010 	str	r3, [fp, #-16]
90015734:	e3a03000 	mov	r3, #0
90015738:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    const void * end_addr = (const void *)((uint32_t)addr + length);
9001573c:	e51b2008 	ldr	r2, [fp, #-8]
90015740:	e51b300c 	ldr	r3, [fp, #-12]
90015744:	e0823003 	add	r3, r2, r3
90015748:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
9001574c:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
90015750:	e50b3010 	str	r3, [fp, #-16]
    line_size = 1 << ((csidr & 0x7) + 4);
90015754:	e51b3010 	ldr	r3, [fp, #-16]
90015758:	e2033007 	and	r3, r3, #7
9001575c:	e2833004 	add	r3, r3, #4
90015760:	e3a02001 	mov	r2, #1
90015764:	e1a03312 	lsl	r3, r2, r3
90015768:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size  - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
9001576c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015770:	e2632000 	rsb	r2, r3, #0
90015774:	e51b3008 	ldr	r3, [fp, #-8]
90015778:	e0033002 	and	r3, r3, r2
9001577c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        _ARM_MCR(15, 0, va, 7, 10, 1);
90015780:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90015784:	ee073f3a 	mcr	15, 0, r3, cr7, cr10, {1}
        
        // increment addres to next line and decrement lenght
        addr = (void*)((uint32_t)addr + line_size);
90015788:	e51b2008 	ldr	r2, [fp, #-8]
9001578c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015790:	e0823003 	add	r3, r2, r3
90015794:	e50b3008 	str	r3, [fp, #-8]
    } while (addr < end_addr);
90015798:	e51b2008 	ldr	r2, [fp, #-8]
9001579c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900157a0:	e1520003 	cmp	r2, r3
900157a4:	3afffff0 	bcc	9001576c <CleanL1Dcache+0x6c>
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
900157a8:	f57ff04f 	dsb	sy
}
900157ac:	e320f000 	nop	{0}
900157b0:	e28bd000 	add	sp, fp, #0
900157b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900157b8:	e12fff1e 	bx	lr

900157bc <CleanL1DcacheAll>:

void CleanL1DcacheAll(void)
{
900157bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900157c0:	e28db000 	add	fp, sp, #0
900157c4:	e24dd014 	sub	sp, sp, #20
    uint32_t csid; // Cache Size ID
    uint32_t wayset; // wayset parameter
    int num_sets; // number of sets
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0); // Read Cache Size ID
900157c8:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
900157cc:	e50b3010 	str	r3, [fp, #-16]

    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT`)
900157d0:	e51b3010 	ldr	r3, [fp, #-16]
900157d4:	e1a031a3 	lsr	r3, r3, #3
900157d8:	e7e93053 	ubfx	r3, r3, #0, #10
900157dc:	e50b300c 	str	r3, [fp, #-12]
    while (num_ways >= 0) {
900157e0:	ea000015 	b	9001583c <CleanL1DcacheAll+0x80>
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK)      >> csid_NUMSETS_SHIFT       )
900157e4:	e51b3010 	ldr	r3, [fp, #-16]
900157e8:	e1a036a3 	lsr	r3, r3, #13
900157ec:	e7ee3053 	ubfx	r3, r3, #0, #15
900157f0:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
900157f4:	ea00000a 	b	90015824 <CleanL1DcacheAll+0x68>
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_ways << 3SETWAY_WAY_SHIFT)
900157f8:	e51b3008 	ldr	r3, [fp, #-8]
900157fc:	e1a02283 	lsl	r2, r3, #5
90015800:	e51b300c 	ldr	r3, [fp, #-12]
90015804:	e1a03f03 	lsl	r3, r3, #30
90015808:	e1823003 	orr	r3, r2, r3
9001580c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            // FLUSH (clean) line if we know set and way
            _ARM_MCR(15, 0, wayset, 7, 10, 2);
90015810:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015814:	ee073f5a 	mcr	15, 0, r3, cr7, cr10, {2}
            num_sets--;
90015818:	e51b3008 	ldr	r3, [fp, #-8]
9001581c:	e2433001 	sub	r3, r3, #1
90015820:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
90015824:	e51b3008 	ldr	r3, [fp, #-8]
90015828:	e3530000 	cmp	r3, #0
9001582c:	aafffff1 	bge	900157f8 <CleanL1DcacheAll+0x3c>
        }
        num_ways--;
90015830:	e51b300c 	ldr	r3, [fp, #-12]
90015834:	e2433001 	sub	r3, r3, #1
90015838:	e50b300c 	str	r3, [fp, #-12]
    while (num_ways >= 0) {
9001583c:	e51b300c 	ldr	r3, [fp, #-12]
90015840:	e3530000 	cmp	r3, #0
90015844:	aaffffe6 	bge	900157e4 <CleanL1DcacheAll+0x28>
    }

    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
90015848:	f57ff04f 	dsb	sy
}
9001584c:	e320f000 	nop	{0}
90015850:	e28bd000 	add	sp, fp, #0
90015854:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015858:	e12fff1e 	bx	lr

9001585c <FlushL1Dcache>:

void FlushL1Dcache(uintptr_t start, uintptr_t end)
{
9001585c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015860:	e28db000 	add	fp, sp, #0
90015864:	e24dd024 	sub	sp, sp, #36	; 0x24
90015868:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001586c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    void* addr = (void*)start;
90015870:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015874:	e50b3008 	str	r3, [fp, #-8]
    // size_t length=end-start;
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
90015878:	e3a03000 	mov	r3, #0
9001587c:	e50b300c 	str	r3, [fp, #-12]
90015880:	e3a03000 	mov	r3, #0
90015884:	e50b3010 	str	r3, [fp, #-16]
    const void * end_addr = (const void *)((uint32_t)end);
90015888:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001588c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
90015890:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
90015894:	e50b300c 	str	r3, [fp, #-12]
    line_size = 1 << ((csidr & 0x7) + 4);
90015898:	e51b300c 	ldr	r3, [fp, #-12]
9001589c:	e2033007 	and	r3, r3, #7
900158a0:	e2833004 	add	r3, r3, #4
900158a4:	e3a02001 	mov	r2, #1
900158a8:	e1a03312 	lsl	r3, r2, r3
900158ac:	e50b3010 	str	r3, [fp, #-16]
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size  - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
900158b0:	e51b3010 	ldr	r3, [fp, #-16]
900158b4:	e2632000 	rsb	r2, r3, #0
900158b8:	e51b3008 	ldr	r3, [fp, #-8]
900158bc:	e0033002 	and	r3, r3, r2
900158c0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        _ARM_MCR(15, 0, va, 7, 14, 1);
900158c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900158c8:	ee073f3e 	mcr	15, 0, r3, cr7, cr14, {1}

        // increment addres to next line and decrement lenght
        addr = (void*)((uint32_t)addr + line_size);
900158cc:	e51b2008 	ldr	r2, [fp, #-8]
900158d0:	e51b3010 	ldr	r3, [fp, #-16]
900158d4:	e0823003 	add	r3, r2, r3
900158d8:	e50b3008 	str	r3, [fp, #-8]
    } while (addr < end_addr);
900158dc:	e51b2008 	ldr	r2, [fp, #-8]
900158e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900158e4:	e1520003 	cmp	r2, r3
900158e8:	3afffff0 	bcc	900158b0 <FlushL1Dcache+0x54>
    
    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
900158ec:	f57ff04f 	dsb	sy
}
900158f0:	e320f000 	nop	{0}
900158f4:	e28bd000 	add	sp, fp, #0
900158f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900158fc:	e12fff1e 	bx	lr

90015900 <FlushL1DcacheAll>:

void FlushL1DcacheAll(void)
{
90015900:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015904:	e28db000 	add	fp, sp, #0
90015908:	e24dd014 	sub	sp, sp, #20
    uint32_t csid; // Cache Size ID
    uint32_t wayset; // wayset parameter
    int num_sets; // number of sets
    int num_ways; // number of ways

    _ARM_MRC(15, 1, csid, 0, 0, 0); // Read Cache Size ID
9001590c:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
90015910:	e50b3010 	str	r3, [fp, #-16]

    // Fill number of sets  and number of ways from csid register  This walues are decremented by 1
    num_ways = (csid >> 0x03) & 0x3FFu; //((csid& csid_ASSOCIATIVITY_MASK) >> csid_ASSOCIATIVITY_SHIFT`)
90015914:	e51b3010 	ldr	r3, [fp, #-16]
90015918:	e1a031a3 	lsr	r3, r3, #3
9001591c:	e7e93053 	ubfx	r3, r3, #0, #10
90015920:	e50b300c 	str	r3, [fp, #-12]
    while (num_ways >= 0) {
90015924:	ea000015 	b	90015980 <FlushL1DcacheAll+0x80>
        num_sets = (csid >> 0x0D) & 0x7FFFu; //((csid & csid_NUMSETS_MASK)      >> csid_NUMSETS_SHIFT       )
90015928:	e51b3010 	ldr	r3, [fp, #-16]
9001592c:	e1a036a3 	lsr	r3, r3, #13
90015930:	e7ee3053 	ubfx	r3, r3, #0, #15
90015934:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
90015938:	ea00000a 	b	90015968 <FlushL1DcacheAll+0x68>
            wayset = (num_sets << 5u) | (num_ways << 30u); //(num_sets << SETWAY_SET_SHIFT) | (num_ways << 3SETWAY_WAY_SHIFT)
9001593c:	e51b3008 	ldr	r3, [fp, #-8]
90015940:	e1a02283 	lsl	r2, r3, #5
90015944:	e51b300c 	ldr	r3, [fp, #-12]
90015948:	e1a03f03 	lsl	r3, r3, #30
9001594c:	e1823003 	orr	r3, r2, r3
90015950:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            // FLUSH (clean) line if we know set and way
            _ARM_MCR(15, 0, wayset, 7, 14, 2);
90015954:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015958:	ee073f5e 	mcr	15, 0, r3, cr7, cr14, {2}
            num_sets--;
9001595c:	e51b3008 	ldr	r3, [fp, #-8]
90015960:	e2433001 	sub	r3, r3, #1
90015964:	e50b3008 	str	r3, [fp, #-8]
        while (num_sets >= 0) {
90015968:	e51b3008 	ldr	r3, [fp, #-8]
9001596c:	e3530000 	cmp	r3, #0
90015970:	aafffff1 	bge	9001593c <FlushL1DcacheAll+0x3c>
        }
        num_ways--;
90015974:	e51b300c 	ldr	r3, [fp, #-12]
90015978:	e2433001 	sub	r3, r3, #1
9001597c:	e50b300c 	str	r3, [fp, #-12]
    while (num_ways >= 0) {
90015980:	e51b300c 	ldr	r3, [fp, #-12]
90015984:	e3530000 	cmp	r3, #0
90015988:	aaffffe6 	bge	90015928 <FlushL1DcacheAll+0x28>
    }

    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
9001598c:	f57ff04f 	dsb	sy
}
90015990:	e320f000 	nop	{0}
90015994:	e28bd000 	add	sp, fp, #0
90015998:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001599c:	e12fff1e 	bx	lr

900159a0 <InvalidateL1IcacheAll>:

void InvalidateL1IcacheAll()
{
900159a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900159a4:	e28db000 	add	fp, sp, #0
900159a8:	e24dd00c 	sub	sp, sp, #12
    uint32_t SBZ = 0x0u;
900159ac:	e3a03000 	mov	r3, #0
900159b0:	e50b3008 	str	r3, [fp, #-8]
    
    _ARM_MCR(15, 0, SBZ, 7, 5, 0);
900159b4:	e51b3008 	ldr	r3, [fp, #-8]
900159b8:	ee073f15 	mcr	15, 0, r3, cr7, cr5, {0}

    // synchronize context on this processor

    ISB();
900159bc:	f57ff06f 	isb	sy
}
900159c0:	e320f000 	nop	{0}
900159c4:	e28bd000 	add	sp, fp, #0
900159c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
900159cc:	e12fff1e 	bx	lr

900159d0 <InvalidateL1Icache>:

void InvalidateL1Icache(uintptr_t start, uintptr_t end)
{
900159d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900159d4:	e28db000 	add	fp, sp, #0
900159d8:	e24dd024 	sub	sp, sp, #36	; 0x24
900159dc:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
900159e0:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    void* addr = (void*)start;
900159e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900159e8:	e50b3008 	str	r3, [fp, #-8]
    uint32_t va;
    uint32_t csidr = 0, line_size = 0;
900159ec:	e3a03000 	mov	r3, #0
900159f0:	e50b300c 	str	r3, [fp, #-12]
900159f4:	e3a03000 	mov	r3, #0
900159f8:	e50b3010 	str	r3, [fp, #-16]
    const void * end_addr = (const void *)((uint32_t)end);
900159fc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90015a00:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    // get the cache line size
    _ARM_MRC(15, 1, csidr, 0, 0, 0);
90015a04:	ee303f10 	mrc	15, 1, r3, cr0, cr0, {0}
90015a08:	e50b300c 	str	r3, [fp, #-12]
    line_size = 1 << ((csidr & 0x7) + 4);    
90015a0c:	e51b300c 	ldr	r3, [fp, #-12]
90015a10:	e2033007 	and	r3, r3, #7
90015a14:	e2833004 	add	r3, r3, #4
90015a18:	e3a02001 	mov	r2, #1
90015a1c:	e1a03312 	lsl	r3, r2, r3
90015a20:	e50b3010 	str	r3, [fp, #-16]
    
    do
    {
        // Clean data cache line to PoC (Point of Coherence) by va. 
        va = (uint32_t) ((uint32_t)addr & (~(line_size - 1))); //addr & va_VIRTUAL_ADDRESS_MASK
90015a24:	e51b3010 	ldr	r3, [fp, #-16]
90015a28:	e2632000 	rsb	r2, r3, #0
90015a2c:	e51b3008 	ldr	r3, [fp, #-8]
90015a30:	e0033002 	and	r3, r3, r2
90015a34:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        _ARM_MCR(15, 0, va, 7, 5, 1);
90015a38:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90015a3c:	ee073f35 	mcr	15, 0, r3, cr7, cr5, {1}
        // increment addres to next line and decrement lenght
        addr = (void*)((uint32_t)addr + line_size);
90015a40:	e51b2008 	ldr	r2, [fp, #-8]
90015a44:	e51b3010 	ldr	r3, [fp, #-16]
90015a48:	e0823003 	add	r3, r2, r3
90015a4c:	e50b3008 	str	r3, [fp, #-8]
    } while (addr < end_addr);
90015a50:	e51b2008 	ldr	r2, [fp, #-8]
90015a54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015a58:	e1520003 	cmp	r2, r3
90015a5c:	3afffff0 	bcc	90015a24 <InvalidateL1Icache+0x54>

    // synchronize context on this processor
    ISB();
90015a60:	f57ff06f 	isb	sy
}
90015a64:	e320f000 	nop	{0}
90015a68:	e28bd000 	add	sp, fp, #0
90015a6c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015a70:	e12fff1e 	bx	lr

90015a74 <EnableL1Icache>:

void EnableL1Icache(void)
{
90015a74:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015a78:	e28db000 	add	fp, sp, #0
90015a7c:	e24dd00c 	sub	sp, sp, #12
    uint32_t sctlr  ;// System Control Register 
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
90015a80:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
90015a84:	e50b3008 	str	r3, [fp, #-8]
    // ignore the operation if I is enabled already
    if(!(sctlr & BM_SCTLR_I))
90015a88:	e51b3008 	ldr	r3, [fp, #-8]
90015a8c:	e2033a01 	and	r3, r3, #4096	; 0x1000
90015a90:	e3530000 	cmp	r3, #0
90015a94:	1a000005 	bne	90015ab0 <EnableL1Icache+0x3c>
    {	
        // set  I bit (instruction caching enable)
        sctlr |= BM_SCTLR_I;
90015a98:	e51b3008 	ldr	r3, [fp, #-8]
90015a9c:	e3833a01 	orr	r3, r3, #4096	; 0x1000
90015aa0:	e50b3008 	str	r3, [fp, #-8]
        // write modified sctlr
        _ARM_MCR(15, 0, sctlr, 1, 0, 0);
90015aa4:	e51b3008 	ldr	r3, [fp, #-8]
90015aa8:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
        // synchronize context on this processor
        ISB();
90015aac:	f57ff06f 	isb	sy
    }
}
90015ab0:	e320f000 	nop	{0}
90015ab4:	e28bd000 	add	sp, fp, #0
90015ab8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015abc:	e12fff1e 	bx	lr

90015ac0 <DisableL1Icache>:

void DisableL1Icache()
{
90015ac0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015ac4:	e28db000 	add	fp, sp, #0
90015ac8:	e24dd00c 	sub	sp, sp, #12
    uint32_t sctlr  ;// System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
90015acc:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
90015ad0:	e50b3008 	str	r3, [fp, #-8]
    
    // Clear  I bit (instruction caching enable) 
    sctlr &= ~BM_SCTLR_I;
90015ad4:	e51b3008 	ldr	r3, [fp, #-8]
90015ad8:	e3c33a01 	bic	r3, r3, #4096	; 0x1000
90015adc:	e50b3008 	str	r3, [fp, #-8]

    // write modified sctlr
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);
90015ae0:	e51b3008 	ldr	r3, [fp, #-8]
90015ae4:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}

    // synchronize context on this processor
    ISB();
90015ae8:	f57ff06f 	isb	sy
}
90015aec:	e320f000 	nop	{0}
90015af0:	e28bd000 	add	sp, fp, #0
90015af4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015af8:	e12fff1e 	bx	lr

90015afc <EnableL1Dcache>:

void EnableL1Dcache()
{
90015afc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015b00:	e28db000 	add	fp, sp, #0
90015b04:	e24dd00c 	sub	sp, sp, #12
    uint32_t sctlr; // System Control Register 
    
    // read sctlr 
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
90015b08:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
90015b0c:	e50b3008 	str	r3, [fp, #-8]
        
    if (!(sctlr & BM_SCTLR_C))
90015b10:	e51b3008 	ldr	r3, [fp, #-8]
90015b14:	e2033004 	and	r3, r3, #4
90015b18:	e3530000 	cmp	r3, #0
90015b1c:	1a000005 	bne	90015b38 <EnableL1Dcache+0x3c>
    {
        // set  C bit (data caching enable) 
        sctlr |= BM_SCTLR_C;
90015b20:	e51b3008 	ldr	r3, [fp, #-8]
90015b24:	e3833004 	orr	r3, r3, #4
90015b28:	e50b3008 	str	r3, [fp, #-8]
        
        // write modified sctlr
        _ARM_MCR(15, 0, sctlr, 1, 0, 0);
90015b2c:	e51b3008 	ldr	r3, [fp, #-8]
90015b30:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}
        
        // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
        DSB();
90015b34:	f57ff04f 	dsb	sy
    }
}
90015b38:	e320f000 	nop	{0}
90015b3c:	e28bd000 	add	sp, fp, #0
90015b40:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015b44:	e12fff1e 	bx	lr

90015b48 <DisableL1Dcache>:

void DisableL1Dcache()
{
90015b48:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015b4c:	e28db000 	add	fp, sp, #0
90015b50:	e24dd00c 	sub	sp, sp, #12
    uint32_t sctlr; // System Control Register

    // read sctlr
    _ARM_MRC(15, 0, sctlr, 1, 0, 0);
90015b54:	ee113f10 	mrc	15, 0, r3, cr1, cr0, {0}
90015b58:	e50b3008 	str	r3, [fp, #-8]

    // set  C bit (data caching enable)
    sctlr &= ~BM_SCTLR_C;
90015b5c:	e51b3008 	ldr	r3, [fp, #-8]
90015b60:	e3c33004 	bic	r3, r3, #4
90015b64:	e50b3008 	str	r3, [fp, #-8]

    // write modified sctlr
    _ARM_MCR(15, 0, sctlr, 1, 0, 0);
90015b68:	e51b3008 	ldr	r3, [fp, #-8]
90015b6c:	ee013f10 	mcr	15, 0, r3, cr1, cr0, {0}

    // All Cache, Branch predictor and TLB maintenance operations before followed instruction complete
    DSB();
90015b70:	f57ff04f 	dsb	sy
90015b74:	e320f000 	nop	{0}
90015b78:	e28bd000 	add	sp, fp, #0
90015b7c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015b80:	e12fff1e 	bx	lr

90015b84 <pl310_flush_all>:
 *   Flush all ways using the Clean Invalidate Way Register (CIWR).
 *
 ****************************************************************************/

void pl310_flush_all(void)
{
90015b84:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015b88:	e28db000 	add	fp, sp, #0
90015b8c:	e24dd014 	sub	sp, sp, #20
    DSB();
90015b90:	f57ff04f 	dsb	sy
90015b94:	e3a03a02 	mov	r3, #8192	; 0x2000
90015b98:	e34030a0 	movt	r3, #160	; 0xa0
90015b9c:	e50b3008 	str	r3, [fp, #-8]
    return (DEV_VRTMEM_BASE - DEV_PHYMEM_BASE) + paddr;
90015ba0:	e51b3008 	ldr	r3, [fp, #-8]
90015ba4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    /* Flush all ways by writing the set of ways to be cleaned to the Clean
    * Invalidate Way Register (CIWR).
    */
    write32(PL310_WAY_MASK, L2CC_CIWR);
90015ba8:	e2833e7f 	add	r3, r3, #2032	; 0x7f0
90015bac:	e283300c 	add	r3, r3, #12
90015bb0:	e1a02003 	mov	r2, r3
90015bb4:	e30f3fff 	movw	r3, #65535	; 0xffff
90015bb8:	e5823000 	str	r3, [r2]

    /* Wait for cache operation by way to complete */
    while ((read32(L2CC_CIWR) & PL310_WAY_MASK) != 0)
90015bbc:	e320f000 	nop	{0}
90015bc0:	e3a03a02 	mov	r3, #8192	; 0x2000
90015bc4:	e34030a0 	movt	r3, #160	; 0xa0
90015bc8:	e50b300c 	str	r3, [fp, #-12]
90015bcc:	e51b300c 	ldr	r3, [fp, #-12]
90015bd0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90015bd4:	e2833e7f 	add	r3, r3, #2032	; 0x7f0
90015bd8:	e283300c 	add	r3, r3, #12
90015bdc:	e5933000 	ldr	r3, [r3]
90015be0:	e6ff3073 	uxth	r3, r3
90015be4:	e3530000 	cmp	r3, #0
90015be8:	1afffff4 	bne	90015bc0 <pl310_flush_all+0x3c>
90015bec:	e3a03a02 	mov	r3, #8192	; 0x2000
90015bf0:	e34030a0 	movt	r3, #160	; 0xa0
90015bf4:	e50b3010 	str	r3, [fp, #-16]
90015bf8:	e51b3010 	ldr	r3, [fp, #-16]
90015bfc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */

    write32(0, L2CC_CSR);
90015c00:	e2833e73 	add	r3, r3, #1840	; 0x730
90015c04:	e1a02003 	mov	r2, r3
90015c08:	e3a03000 	mov	r3, #0
90015c0c:	e5823000 	str	r3, [r2]
    DSB();
90015c10:	f57ff04f 	dsb	sy
}
90015c14:	e320f000 	nop	{0}
90015c18:	e28bd000 	add	sp, fp, #0
90015c1c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015c20:	e12fff1e 	bx	lr

90015c24 <arm_l2ccinitialize>:
 *   upon return.
 *
 ****************************************************************************/

void arm_l2ccinitialize(void)
{
90015c24:	e92d4800 	push	{fp, lr}
90015c28:	e28db004 	add	fp, sp, #4
90015c2c:	e24dd020 	sub	sp, sp, #32
90015c30:	e3a03a02 	mov	r3, #8192	; 0x2000
90015c34:	e34030a0 	movt	r3, #160	; 0xa0
90015c38:	e50b3010 	str	r3, [fp, #-16]
90015c3c:	e51b3010 	ldr	r3, [fp, #-16]
90015c40:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    DEBUGASSERT((read32(L2CC_ACR) & L2CC_ACR_WAYSIZE_MASK) == L2CC_ACR_WAYSIZE_512KB);
#else
#  error No way size selected
#endif

    if ((read32(L2CC_CR) & L2CC_CR_L2CEN) == 0) {
90015c44:	e2833c01 	add	r3, r3, #256	; 0x100
90015c48:	e5933000 	ldr	r3, [r3]
90015c4c:	e2033001 	and	r3, r3, #1
90015c50:	e3530000 	cmp	r3, #0
90015c54:	1a000044 	bne	90015d6c <arm_l2ccinitialize+0x148>
        write32(regval | L2X0_ADDR_FILTER_EN, L2CC_FLSTRT);
#endif
#endif
        /* Make sure that the memory is not locked down */

        for (i = 0; i < PL310_NLOCKREGS; i++) {
90015c58:	e3a03000 	mov	r3, #0
90015c5c:	e50b3008 	str	r3, [fp, #-8]
90015c60:	ea00001b 	b	90015cd4 <arm_l2ccinitialize+0xb0>
90015c64:	e3a03a02 	mov	r3, #8192	; 0x2000
90015c68:	e34030a0 	movt	r3, #160	; 0xa0
90015c6c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90015c70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90015c74:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            write32(0, L2CC_DLKR(i));
90015c78:	e51b2008 	ldr	r2, [fp, #-8]
90015c7c:	e1a02182 	lsl	r2, r2, #3
90015c80:	e0833002 	add	r3, r3, r2
90015c84:	e2833c09 	add	r3, r3, #2304	; 0x900
90015c88:	e1a02003 	mov	r2, r3
90015c8c:	e3a03000 	mov	r3, #0
90015c90:	e5823000 	str	r3, [r2]
90015c94:	e3a03a02 	mov	r3, #8192	; 0x2000
90015c98:	e34030a0 	movt	r3, #160	; 0xa0
90015c9c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90015ca0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015ca4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            write32(0, L2CC_ILKR(i));
90015ca8:	e51b2008 	ldr	r2, [fp, #-8]
90015cac:	e1a02182 	lsl	r2, r2, #3
90015cb0:	e0833002 	add	r3, r3, r2
90015cb4:	e2833c09 	add	r3, r3, #2304	; 0x900
90015cb8:	e2833004 	add	r3, r3, #4
90015cbc:	e1a02003 	mov	r2, r3
90015cc0:	e3a03000 	mov	r3, #0
90015cc4:	e5823000 	str	r3, [r2]
        for (i = 0; i < PL310_NLOCKREGS; i++) {
90015cc8:	e51b3008 	ldr	r3, [fp, #-8]
90015ccc:	e2833001 	add	r3, r3, #1
90015cd0:	e50b3008 	str	r3, [fp, #-8]
90015cd4:	e51b3008 	ldr	r3, [fp, #-8]
90015cd8:	e3530000 	cmp	r3, #0
90015cdc:	daffffe0 	ble	90015c64 <arm_l2ccinitialize+0x40>
90015ce0:	e3a03a02 	mov	r3, #8192	; 0x2000
90015ce4:	e34030a0 	movt	r3, #160	; 0xa0
90015ce8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90015cec:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90015cf0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        }

        /* Configure the cache properties */

        regval = read32(L2CC_ACR);
90015cf4:	e2833f41 	add	r3, r3, #260	; 0x104
90015cf8:	e5933000 	ldr	r3, [r3]
90015cfc:	e50b300c 	str	r3, [fp, #-12]
        regval &= ~L2CC_ACR_CONFIGMASK;
90015d00:	e51b200c 	ldr	r2, [fp, #-12]
90015d04:	e3a03c02 	mov	r3, #512	; 0x200
90015d08:	e34030cf 	movt	r3, #207	; 0xcf
90015d0c:	e0033002 	and	r3, r3, r2
90015d10:	e50b300c 	str	r3, [fp, #-12]
        regval |= L2CC_ACR_CONFIG;
90015d14:	e51b300c 	ldr	r3, [fp, #-12]
90015d18:	e3833402 	orr	r3, r3, #33554432	; 0x2000000
90015d1c:	e50b300c 	str	r3, [fp, #-12]
90015d20:	e3a03a02 	mov	r3, #8192	; 0x2000
90015d24:	e34030a0 	movt	r3, #160	; 0xa0
90015d28:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
90015d2c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015d30:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        write32(regval, L2CC_ACR);
90015d34:	e2833f41 	add	r3, r3, #260	; 0x104
90015d38:	e1a02003 	mov	r2, r3
90015d3c:	e51b300c 	ldr	r3, [fp, #-12]
90015d40:	e5823000 	str	r3, [r2]

        /* Invalidate and enable the cache */

        InvalidateL2CacheAll();
90015d44:	eb00003c 	bl	90015e3c <InvalidateL2CacheAll>
90015d48:	e3a03a02 	mov	r3, #8192	; 0x2000
90015d4c:	e34030a0 	movt	r3, #160	; 0xa0
90015d50:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90015d54:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90015d58:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        write32(L2CC_CR_L2CEN, L2CC_CR);
90015d5c:	e2833c01 	add	r3, r3, #256	; 0x100
90015d60:	e1a02003 	mov	r2, r3
90015d64:	e3a03001 	mov	r3, #1
90015d68:	e5823000 	str	r3, [r2]
    }
}
90015d6c:	e320f000 	nop	{0}
90015d70:	e24bd004 	sub	sp, fp, #4
90015d74:	e8bd8800 	pop	{fp, pc}

90015d78 <EnableL2Cache>:
 *    Control Register (CR)
 *
 ****************************************************************************/

void EnableL2Cache(void)
{
90015d78:	e92d4800 	push	{fp, lr}
90015d7c:	e28db004 	add	fp, sp, #4
90015d80:	e24dd008 	sub	sp, sp, #8

    InvalidateL2CacheAll();
90015d84:	eb00002c 	bl	90015e3c <InvalidateL2CacheAll>
90015d88:	e3a03a02 	mov	r3, #8192	; 0x2000
90015d8c:	e34030a0 	movt	r3, #160	; 0xa0
90015d90:	e50b3008 	str	r3, [fp, #-8]
90015d94:	e51b3008 	ldr	r3, [fp, #-8]
90015d98:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    write32(L2CC_CR_L2CEN, L2CC_CR);
90015d9c:	e2833c01 	add	r3, r3, #256	; 0x100
90015da0:	e1a02003 	mov	r2, r3
90015da4:	e3a03001 	mov	r3, #1
90015da8:	e5823000 	str	r3, [r2]
}
90015dac:	e320f000 	nop	{0}
90015db0:	e24bd004 	sub	sp, fp, #4
90015db4:	e8bd8800 	pop	{fp, pc}

90015db8 <DisableL2Cache>:
 *
 * 
 ****************************************************************************/

void DisableL2Cache(void)
{
90015db8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015dbc:	e28db000 	add	fp, sp, #0
90015dc0:	e24dd00c 	sub	sp, sp, #12
90015dc4:	e3a03a02 	mov	r3, #8192	; 0x2000
90015dc8:	e34030a0 	movt	r3, #160	; 0xa0
90015dcc:	e50b3008 	str	r3, [fp, #-8]
90015dd0:	e51b3008 	ldr	r3, [fp, #-8]
90015dd4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    write32(0, L2CC_CR);
90015dd8:	e2833c01 	add	r3, r3, #256	; 0x100
90015ddc:	e1a02003 	mov	r2, r3
90015de0:	e3a03000 	mov	r3, #0
90015de4:	e5823000 	str	r3, [r2]
    DSB();
90015de8:	f57ff04f 	dsb	sy
}
90015dec:	e320f000 	nop	{0}
90015df0:	e28bd000 	add	sp, fp, #0
90015df4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015df8:	e12fff1e 	bx	lr

90015dfc <SyncL2Cache>:
 *   EB, are empty.
 *
 ****************************************************************************/

void SyncL2Cache(void)
{
90015dfc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015e00:	e28db000 	add	fp, sp, #0
90015e04:	e24dd00c 	sub	sp, sp, #12
90015e08:	e3a03a02 	mov	r3, #8192	; 0x2000
90015e0c:	e34030a0 	movt	r3, #160	; 0xa0
90015e10:	e50b3008 	str	r3, [fp, #-8]
90015e14:	e51b3008 	ldr	r3, [fp, #-8]
90015e18:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    write32(0, L2CC_CSR);
90015e1c:	e2833e73 	add	r3, r3, #1840	; 0x730
90015e20:	e1a02003 	mov	r2, r3
90015e24:	e3a03000 	mov	r3, #0
90015e28:	e5823000 	str	r3, [r2]
}
90015e2c:	e320f000 	nop	{0}
90015e30:	e28bd000 	add	sp, fp, #0
90015e34:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90015e38:	e12fff1e 	bx	lr

90015e3c <InvalidateL2CacheAll>:
 *   Invalidate all ways using the Invalidate Way Register (IWR).
 *
 ****************************************************************************/

void InvalidateL2CacheAll(void)
{
90015e3c:	e92d4800 	push	{fp, lr}
90015e40:	e28db004 	add	fp, sp, #4
90015e44:	e24dd018 	sub	sp, sp, #24
90015e48:	e3a03a02 	mov	r3, #8192	; 0x2000
90015e4c:	e34030a0 	movt	r3, #160	; 0xa0
90015e50:	e50b3010 	str	r3, [fp, #-16]
90015e54:	e51b3010 	ldr	r3, [fp, #-16]
90015e58:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    uint32_t regval;

    /* Invalidate all ways */
    /* Disable the L2 cache while we invalidate it */

    regval = read32(L2CC_CR);
90015e5c:	e2833c01 	add	r3, r3, #256	; 0x100
90015e60:	e5933000 	ldr	r3, [r3]
90015e64:	e50b3008 	str	r3, [fp, #-8]
    DisableL2Cache();
90015e68:	ebffffd2 	bl	90015db8 <DisableL2Cache>
90015e6c:	e3a03a02 	mov	r3, #8192	; 0x2000
90015e70:	e34030a0 	movt	r3, #160	; 0xa0
90015e74:	e50b300c 	str	r3, [fp, #-12]
90015e78:	e51b300c 	ldr	r3, [fp, #-12]
90015e7c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    /* Invalidate all ways by writing the bit mask of ways to be invalidated
    * the Invalidate Way Register (IWR).
    */

    write32(PL310_WAY_MASK, L2CC_IWR);
90015e80:	e2833e77 	add	r3, r3, #1904	; 0x770
90015e84:	e283300c 	add	r3, r3, #12
90015e88:	e1a02003 	mov	r2, r3
90015e8c:	e30f3fff 	movw	r3, #65535	; 0xffff
90015e90:	e5823000 	str	r3, [r2]

    while ((read32(L2CC_IWR) & PL310_WAY_MASK) != 0)
90015e94:	e320f000 	nop	{0}
90015e98:	e3a03a02 	mov	r3, #8192	; 0x2000
90015e9c:	e34030a0 	movt	r3, #160	; 0xa0
90015ea0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90015ea4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015ea8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90015eac:	e2833e77 	add	r3, r3, #1904	; 0x770
90015eb0:	e283300c 	add	r3, r3, #12
90015eb4:	e5933000 	ldr	r3, [r3]
90015eb8:	e6ff3073 	uxth	r3, r3
90015ebc:	e3530000 	cmp	r3, #0
90015ec0:	1afffff4 	bne	90015e98 <InvalidateL2CacheAll+0x5c>
90015ec4:	e3a03a02 	mov	r3, #8192	; 0x2000
90015ec8:	e34030a0 	movt	r3, #160	; 0xa0
90015ecc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90015ed0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90015ed4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */

    write32(0, L2CC_CSR);
90015ed8:	e2833e73 	add	r3, r3, #1840	; 0x730
90015edc:	e1a02003 	mov	r2, r3
90015ee0:	e3a03000 	mov	r3, #0
90015ee4:	e5823000 	str	r3, [r2]
90015ee8:	e3a03a02 	mov	r3, #8192	; 0x2000
90015eec:	e34030a0 	movt	r3, #160	; 0xa0
90015ef0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90015ef4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90015ef8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    /* Then re-enable the L2 cache if it was enabled before */

    write32(regval, L2CC_CR);
90015efc:	e2833c01 	add	r3, r3, #256	; 0x100
90015f00:	e1a02003 	mov	r2, r3
90015f04:	e51b3008 	ldr	r3, [fp, #-8]
90015f08:	e5823000 	str	r3, [r2]
}
90015f0c:	e320f000 	nop	{0}
90015f10:	e24bd004 	sub	sp, fp, #4
90015f14:	e8bd8800 	pop	{fp, pc}

90015f18 <InvalidateL2Cache>:
 *   Address Line Register (IPALR) repeatedly.
 *
 ****************************************************************************/

void InvalidateL2Cache(uintptr_t startaddr, uintptr_t endaddr)
{
90015f18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90015f1c:	e28db000 	add	fp, sp, #0
90015f20:	e24dd024 	sub	sp, sp, #36	; 0x24
90015f24:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90015f28:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uintptr_t invalsize;
    uintptr_t gulpend;

    /* Check if the start address is aligned with a cacheline */
    if ((startaddr & PL310_CACHE_LINE_MASK) != 0) {
90015f2c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015f30:	e203301f 	and	r3, r3, #31
90015f34:	e3530000 	cmp	r3, #0
90015f38:	0a00000e 	beq	90015f78 <InvalidateL2Cache+0x60>
        /* No.. align down and flush the cache line by writing the address to
        * the Clean Invalidate Physical Address Line Register (CIPALR).
        */

        startaddr &= ~PL310_CACHE_LINE_MASK;
90015f3c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015f40:	e3c3301f 	bic	r3, r3, #31
90015f44:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
90015f48:	e3a03a02 	mov	r3, #8192	; 0x2000
90015f4c:	e34030a0 	movt	r3, #160	; 0xa0
90015f50:	e50b3010 	str	r3, [fp, #-16]
90015f54:	e51b3010 	ldr	r3, [fp, #-16]
90015f58:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        write32(startaddr, L2CC_CIPALR);
90015f5c:	e2833e7f 	add	r3, r3, #2032	; 0x7f0
90015f60:	e1a02003 	mov	r2, r3
90015f64:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015f68:	e5823000 	str	r3, [r2]

        /* Then start invalidating at the next cache line */

        startaddr += PL310_CACHE_LINE_SIZE;
90015f6c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015f70:	e2833020 	add	r3, r3, #32
90015f74:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    }

    /* Check if the end address is aligned with a cache line */

    if ((endaddr & PL310_CACHE_LINE_MASK) != 0) {
90015f78:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90015f7c:	e203301f 	and	r3, r3, #31
90015f80:	e3530000 	cmp	r3, #0
90015f84:	0a000028 	beq	9001602c <InvalidateL2Cache+0x114>
        /* No.. align down and flush cache line by writing the address to
        * the Clean Invalidate Physical Address Line Register (CIPALR).
        */

        endaddr &= ~PL310_CACHE_LINE_MASK;
90015f88:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90015f8c:	e3c3301f 	bic	r3, r3, #31
90015f90:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90015f94:	e3a03a02 	mov	r3, #8192	; 0x2000
90015f98:	e34030a0 	movt	r3, #160	; 0xa0
90015f9c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90015fa0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90015fa4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        write32(endaddr, L2CC_CIPALR);
90015fa8:	e2833e7f 	add	r3, r3, #2032	; 0x7f0
90015fac:	e1a02003 	mov	r2, r3
90015fb0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90015fb4:	e5823000 	str	r3, [r2]

    /* Loop, invalidated the address range by cache line.  Interrupts are re-
    * enabled momentarily every PL310_GULP_SIZE bytes.
    */

    while (startaddr < endaddr) {
90015fb8:	ea00001b 	b	9001602c <InvalidateL2Cache+0x114>
        /* Get the size of the next gulp of cache lines to invalidate.  We do
        * this in small chunks so that we do not have to keep interrupts
        * disabled throughout the whole flush.
        */

        invalsize = endaddr - startaddr;
90015fbc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
90015fc0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015fc4:	e0423003 	sub	r3, r2, r3
90015fc8:	e50b3008 	str	r3, [fp, #-8]
        gulpend = startaddr + MIN(invalsize, PL310_GULP_SIZE);
90015fcc:	e51b3008 	ldr	r3, [fp, #-8]
90015fd0:	e3530a01 	cmp	r3, #4096	; 0x1000
90015fd4:	31a02003 	movcc	r2, r3
90015fd8:	23a02a01 	movcs	r2, #4096	; 0x1000
90015fdc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90015fe0:	e0823003 	add	r3, r2, r3
90015fe4:	e50b300c 	str	r3, [fp, #-12]

        /* Disable interrupts and invalidate the gulp */
        while (startaddr < gulpend) {
90015fe8:	ea00000b 	b	9001601c <InvalidateL2Cache+0x104>
90015fec:	e3a03a02 	mov	r3, #8192	; 0x2000
90015ff0:	e34030a0 	movt	r3, #160	; 0xa0
90015ff4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90015ff8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90015ffc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            /* Invalidate the cache line by writing the address to the
            * Invalidate Physical Address Line Register (IPALR).
            */
            write32(startaddr, L2CC_IPALR);
90016000:	e2833e77 	add	r3, r3, #1904	; 0x770
90016004:	e1a02003 	mov	r2, r3
90016008:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001600c:	e5823000 	str	r3, [r2]

            /* Start of the next cache line */

            startaddr += PL310_CACHE_LINE_SIZE;
90016010:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90016014:	e2833020 	add	r3, r3, #32
90016018:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        while (startaddr < gulpend) {
9001601c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90016020:	e51b300c 	ldr	r3, [fp, #-12]
90016024:	e1520003 	cmp	r2, r3
90016028:	3affffef 	bcc	90015fec <InvalidateL2Cache+0xd4>
    while (startaddr < endaddr) {
9001602c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90016030:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90016034:	e1520003 	cmp	r2, r3
90016038:	3affffdf 	bcc	90015fbc <InvalidateL2Cache+0xa4>
9001603c:	e3a03a02 	mov	r3, #8192	; 0x2000
90016040:	e34030a0 	movt	r3, #160	; 0xa0
90016044:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
90016048:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001604c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    }

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */
    write32(0, L2CC_CSR);
90016050:	e2833e73 	add	r3, r3, #1840	; 0x730
90016054:	e1a02003 	mov	r2, r3
90016058:	e3a03000 	mov	r3, #0
9001605c:	e5823000 	str	r3, [r2]
}
90016060:	e320f000 	nop	{0}
90016064:	e28bd000 	add	sp, fp, #0
90016068:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001606c:	e12fff1e 	bx	lr

90016070 <CleanL2CacheAll>:
 *   Clean all ways by using the Clean Ways Register (CWR).
 *
 ****************************************************************************/

void CleanL2CacheAll(void)
{
90016070:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90016074:	e28db000 	add	fp, sp, #0
90016078:	e24dd014 	sub	sp, sp, #20
9001607c:	e3a03a02 	mov	r3, #8192	; 0x2000
90016080:	e34030a0 	movt	r3, #160	; 0xa0
90016084:	e50b3008 	str	r3, [fp, #-8]
90016088:	e51b3008 	ldr	r3, [fp, #-8]
9001608c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    write32(PL310_WAY_MASK, L2CC_CWR);
90016090:	e2833e7b 	add	r3, r3, #1968	; 0x7b0
90016094:	e283300c 	add	r3, r3, #12
90016098:	e1a02003 	mov	r2, r3
9001609c:	e30f3fff 	movw	r3, #65535	; 0xffff
900160a0:	e5823000 	str	r3, [r2]

    /* Wait for cache operation by way to complete */

    while ((read32(L2CC_CWR) & PL310_WAY_MASK) != 0)
900160a4:	e320f000 	nop	{0}
900160a8:	e3a03a02 	mov	r3, #8192	; 0x2000
900160ac:	e34030a0 	movt	r3, #160	; 0xa0
900160b0:	e50b300c 	str	r3, [fp, #-12]
900160b4:	e51b300c 	ldr	r3, [fp, #-12]
900160b8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900160bc:	e2833e7b 	add	r3, r3, #1968	; 0x7b0
900160c0:	e283300c 	add	r3, r3, #12
900160c4:	e5933000 	ldr	r3, [r3]
900160c8:	e6ff3073 	uxth	r3, r3
900160cc:	e3530000 	cmp	r3, #0
900160d0:	1afffff4 	bne	900160a8 <CleanL2CacheAll+0x38>
900160d4:	e3a03a02 	mov	r3, #8192	; 0x2000
900160d8:	e34030a0 	movt	r3, #160	; 0xa0
900160dc:	e50b3010 	str	r3, [fp, #-16]
900160e0:	e51b3010 	ldr	r3, [fp, #-16]
900160e4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */

    write32(0, L2CC_CSR);
900160e8:	e2833e73 	add	r3, r3, #1840	; 0x730
900160ec:	e1a02003 	mov	r2, r3
900160f0:	e3a03000 	mov	r3, #0
900160f4:	e5823000 	str	r3, [r2]
}
900160f8:	e320f000 	nop	{0}
900160fc:	e28bd000 	add	sp, fp, #0
90016100:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90016104:	e12fff1e 	bx	lr

90016108 <CleanL2Cache>:
 *   Address Line Register (CPALR) repeatedly.
 *
 ****************************************************************************/

void CleanL2Cache(uintptr_t startaddr, uintptr_t endaddr)
{
90016108:	e92d4800 	push	{fp, lr}
9001610c:	e28db004 	add	fp, sp, #4
90016110:	e24dd018 	sub	sp, sp, #24
90016114:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90016118:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4

    /* If the range of addresses to clean is as large or larger the L2 cache,
    * then just clean the whole thing.
    */

    cleansize = endaddr - startaddr;
9001611c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90016120:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016124:	e0423003 	sub	r3, r2, r3
90016128:	e50b3008 	str	r3, [fp, #-8]
    if (cleansize >= PL310_CACHE_SIZE) {
9001612c:	e51b3008 	ldr	r3, [fp, #-8]
90016130:	e3530701 	cmp	r3, #262144	; 0x40000
90016134:	3a000001 	bcc	90016140 <CleanL2Cache+0x38>
        CleanL2CacheAll();
90016138:	ebffffcc 	bl	90016070 <CleanL2CacheAll>
        return;
9001613c:	ea00002c 	b	900161f4 <CleanL2Cache+0xec>
    }

    /* Align the starting address to a cache line boundary */

    startaddr &= ~PL310_CACHE_LINE_MASK;
90016140:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016144:	e3c3301f 	bic	r3, r3, #31
90016148:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    /* Clean the L2 cache by cache line, enabling interrupts momentarily
    * every PL310_GULP_SIZE bytes.
    */

    while (startaddr < endaddr) {
9001614c:	ea00001b 	b	900161c0 <CleanL2Cache+0xb8>
        /* Get the size of the next gulp of cache lines to flush.  We do
        * this in small chunks so that we do not have to keep interrupts
        * disabled throughout the whole flush.
        */

        cleansize = endaddr - startaddr;
90016150:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90016154:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016158:	e0423003 	sub	r3, r2, r3
9001615c:	e50b3008 	str	r3, [fp, #-8]
        gulpend = startaddr + MIN(cleansize, PL310_GULP_SIZE);
90016160:	e51b3008 	ldr	r3, [fp, #-8]
90016164:	e3530a01 	cmp	r3, #4096	; 0x1000
90016168:	31a02003 	movcc	r2, r3
9001616c:	23a02a01 	movcs	r2, #4096	; 0x1000
90016170:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016174:	e0823003 	add	r3, r2, r3
90016178:	e50b300c 	str	r3, [fp, #-12]

        /* Disable interrupts and clean the gulp */
        while (startaddr < gulpend) {
9001617c:	ea00000b 	b	900161b0 <CleanL2Cache+0xa8>
90016180:	e3a03a02 	mov	r3, #8192	; 0x2000
90016184:	e34030a0 	movt	r3, #160	; 0xa0
90016188:	e50b3010 	str	r3, [fp, #-16]
9001618c:	e51b3010 	ldr	r3, [fp, #-16]
90016190:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
            /* Clean the cache line by writing the address to the Clean
            * Physical Address Line Register (CPALR).
            */

            write32(startaddr, L2CC_CPALR);
90016194:	e2833e7b 	add	r3, r3, #1968	; 0x7b0
90016198:	e1a02003 	mov	r2, r3
9001619c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900161a0:	e5823000 	str	r3, [r2]

            /* Start of the next cache line */

            startaddr += PL310_CACHE_LINE_SIZE;
900161a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900161a8:	e2833020 	add	r3, r3, #32
900161ac:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        while (startaddr < gulpend) {
900161b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900161b4:	e51b300c 	ldr	r3, [fp, #-12]
900161b8:	e1520003 	cmp	r2, r3
900161bc:	3affffef 	bcc	90016180 <CleanL2Cache+0x78>
    while (startaddr < endaddr) {
900161c0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900161c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900161c8:	e1520003 	cmp	r2, r3
900161cc:	3affffdf 	bcc	90016150 <CleanL2Cache+0x48>
900161d0:	e3a03a02 	mov	r3, #8192	; 0x2000
900161d4:	e34030a0 	movt	r3, #160	; 0xa0
900161d8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
900161dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900161e0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    }

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */
    write32(0, L2CC_CSR);
900161e4:	e2833e73 	add	r3, r3, #1840	; 0x730
900161e8:	e1a02003 	mov	r2, r3
900161ec:	e3a03000 	mov	r3, #0
900161f0:	e5823000 	str	r3, [r2]
}
900161f4:	e24bd004 	sub	sp, fp, #4
900161f8:	e8bd8800 	pop	{fp, pc}

900161fc <FlushL2CacheAll>:
 *   Flush all ways using the Clean Invalidate Way Register (CIWR).
 *
 ****************************************************************************/

void FlushL2CacheAll(void)
{
900161fc:	e92d4800 	push	{fp, lr}
90016200:	e28db004 	add	fp, sp, #4
    /* Flush all ways using the Clean Invalidate Way Register (CIWR). */
    pl310_flush_all();
90016204:	ebfffe5e 	bl	90015b84 <pl310_flush_all>
}
90016208:	e320f000 	nop	{0}
9001620c:	e8bd8800 	pop	{fp, pc}

90016210 <FlushL2Cache>:
 *   Line Register (CIPALR) repeatedly.
 *
 ****************************************************************************/

void FlushL2Cache(uint32_t startaddr, uint32_t endaddr)
{
90016210:	e92d4800 	push	{fp, lr}
90016214:	e28db004 	add	fp, sp, #4
90016218:	e24dd018 	sub	sp, sp, #24
9001621c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90016220:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    uintptr_t  gulpend;
    /* If the range of addresses to flush is as large or larger the L2 cache,
    * then just flush the whole thing.
    */

    flushsize = endaddr - startaddr;
90016224:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90016228:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001622c:	e0423003 	sub	r3, r2, r3
90016230:	e50b3008 	str	r3, [fp, #-8]
    if (flushsize >= PL310_CACHE_SIZE)
90016234:	e51b3008 	ldr	r3, [fp, #-8]
90016238:	e3530701 	cmp	r3, #262144	; 0x40000
9001623c:	3a000001 	bcc	90016248 <FlushL2Cache+0x38>
    {
        pl310_flush_all();
90016240:	ebfffe4f 	bl	90015b84 <pl310_flush_all>
        return;
90016244:	ea00002c 	b	900162fc <FlushL2Cache+0xec>
    }

    /* Align the starting address to a cache line boundary */

    startaddr &= ~PL310_CACHE_LINE_MASK;
90016248:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001624c:	e3c3301f 	bic	r3, r3, #31
90016250:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    /* Flush the L2 cache by cache line, enabling interrupts momentarily
    * every PL310_GULP_SIZE bytes.
    */

    while (startaddr < endaddr)
90016254:	ea00001b 	b	900162c8 <FlushL2Cache+0xb8>
        /* Get the size of the next gulp of cache lines to flush.  We do
        * this in small chunks so that we do not have to keep interrupts
        * disabled throughout the whole flush.
        */

        flushsize = endaddr - startaddr;
90016258:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001625c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016260:	e0423003 	sub	r3, r2, r3
90016264:	e50b3008 	str	r3, [fp, #-8]
        gulpend   = startaddr + MIN(flushsize, PL310_GULP_SIZE);
90016268:	e51b3008 	ldr	r3, [fp, #-8]
9001626c:	e3530a01 	cmp	r3, #4096	; 0x1000
90016270:	31a02003 	movcc	r2, r3
90016274:	23a02a01 	movcs	r2, #4096	; 0x1000
90016278:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001627c:	e0823003 	add	r3, r2, r3
90016280:	e50b300c 	str	r3, [fp, #-12]

        /* Disable interrupts and flush the gulp */
        while (startaddr < gulpend)
90016284:	ea00000b 	b	900162b8 <FlushL2Cache+0xa8>
90016288:	e3a03a02 	mov	r3, #8192	; 0x2000
9001628c:	e34030a0 	movt	r3, #160	; 0xa0
90016290:	e50b3010 	str	r3, [fp, #-16]
90016294:	e51b3010 	ldr	r3, [fp, #-16]
90016298:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
        {
            /* Flush the cache line by writing the address to the Clean
            * Invalidate Physical Address Line Register (CIPALR).
            */
            write32(startaddr, L2CC_CIPALR);
9001629c:	e2833e7f 	add	r3, r3, #2032	; 0x7f0
900162a0:	e1a02003 	mov	r2, r3
900162a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900162a8:	e5823000 	str	r3, [r2]

            /* Start of the next cache line */
            startaddr += PL310_CACHE_LINE_SIZE;
900162ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900162b0:	e2833020 	add	r3, r3, #32
900162b4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        while (startaddr < gulpend)
900162b8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900162bc:	e51b300c 	ldr	r3, [fp, #-12]
900162c0:	e1520003 	cmp	r2, r3
900162c4:	3affffef 	bcc	90016288 <FlushL2Cache+0x78>
    while (startaddr < endaddr)
900162c8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900162cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900162d0:	e1520003 	cmp	r2, r3
900162d4:	3affffdf 	bcc	90016258 <FlushL2Cache+0x48>
900162d8:	e3a03a02 	mov	r3, #8192	; 0x2000
900162dc:	e34030a0 	movt	r3, #160	; 0xa0
900162e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
900162e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900162e8:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
    }

    /* Drain the STB. Operation complete when all buffers, LRB, LFB, STB, and
    * EB, are empty.
    */
    write32(0, L2CC_CSR);
900162ec:	e2833e73 	add	r3, r3, #1840	; 0x730
900162f0:	e1a02003 	mov	r2, r3
900162f4:	e3a03000 	mov	r3, #0
900162f8:	e5823000 	str	r3, [r2]
}
900162fc:	e24bd004 	sub	sp, fp, #4
90016300:	e8bd8800 	pop	{fp, pc}

90016304 <invalidate_dcache>:
 *   in the cache.
 *
 ****************************************************************************/

static inline void invalidate_dcache(uintptr_t start, uintptr_t end)
{
90016304:	e92d4800 	push	{fp, lr}
90016308:	e28db004 	add	fp, sp, #4
9001630c:	e24dd008 	sub	sp, sp, #8
90016310:	e50b0008 	str	r0, [fp, #-8]
90016314:	e50b100c 	str	r1, [fp, #-12]
    InvalidateL1Dcache(start, end);
90016318:	e51b100c 	ldr	r1, [fp, #-12]
9001631c:	e51b0008 	ldr	r0, [fp, #-8]
90016320:	ebfffc9f 	bl	900155a4 <InvalidateL1Dcache>
    // InvalidateL2Cache(start, end);
}
90016324:	e320f000 	nop	{0}
90016328:	e24bd004 	sub	sp, fp, #4
9001632c:	e8bd8800 	pop	{fp, pc}

90016330 <invalidate_dcache_all>:
 *   by disabling interrupts.
 *
 ****************************************************************************/

static inline void invalidate_dcache_all(void)
{
90016330:	e92d4800 	push	{fp, lr}
90016334:	e28db004 	add	fp, sp, #4
    InvalidateL1DcacheAll();
90016338:	ebfffcc8 	bl	90015660 <InvalidateL1DcacheAll>
    // InvalidateL2CacheAll();
}
9001633c:	e320f000 	nop	{0}
90016340:	e8bd8800 	pop	{fp, pc}

90016344 <invalidate_icache>:
 * Description:
 *   Invalidate the instruction cache within the specified region.
 *
 ****************************************************************************/
static inline void invalidate_icache(uintptr_t start, uintptr_t end)
{
90016344:	e92d4800 	push	{fp, lr}
90016348:	e28db004 	add	fp, sp, #4
9001634c:	e24dd008 	sub	sp, sp, #8
90016350:	e50b0008 	str	r0, [fp, #-8]
90016354:	e50b100c 	str	r1, [fp, #-12]
    InvalidateL1Icache(start, end);
90016358:	e51b100c 	ldr	r1, [fp, #-12]
9001635c:	e51b0008 	ldr	r0, [fp, #-8]
90016360:	ebfffd9a 	bl	900159d0 <InvalidateL1Icache>
}
90016364:	e320f000 	nop	{0}
90016368:	e24bd004 	sub	sp, fp, #4
9001636c:	e8bd8800 	pop	{fp, pc}

90016370 <invalidate_icache_all>:
 *   cache
 *
 ****************************************************************************/

static inline void invalidate_icache_all(void)
{
90016370:	e92d4800 	push	{fp, lr}
90016374:	e28db004 	add	fp, sp, #4
    InvalidateL1IcacheAll();
90016378:	ebfffd88 	bl	900159a0 <InvalidateL1IcacheAll>
}
9001637c:	e320f000 	nop	{0}
90016380:	e8bd8800 	pop	{fp, pc}

90016384 <clean_dcache>:
 *   contents of the data cache to memory.
 *
 ****************************************************************************/

static inline void clean_dcache(uintptr_t start, uintptr_t end)
{
90016384:	e92d4800 	push	{fp, lr}
90016388:	e28db004 	add	fp, sp, #4
9001638c:	e24dd008 	sub	sp, sp, #8
90016390:	e50b0008 	str	r0, [fp, #-8]
90016394:	e50b100c 	str	r1, [fp, #-12]
    CleanL1Dcache(start, end);
90016398:	e51b100c 	ldr	r1, [fp, #-12]
9001639c:	e51b0008 	ldr	r0, [fp, #-8]
900163a0:	ebfffcd6 	bl	90015700 <CleanL1Dcache>
    // CleanL2Cache(start, end);
}
900163a4:	e320f000 	nop	{0}
900163a8:	e24bd004 	sub	sp, fp, #4
900163ac:	e8bd8800 	pop	{fp, pc}

900163b0 <clean_dcache_all>:
 *   contents of the data cache to memory.
 *
 ****************************************************************************/

static inline void clean_dcache_all(void)
{
900163b0:	e92d4800 	push	{fp, lr}
900163b4:	e28db004 	add	fp, sp, #4
    CleanL1DcacheAll();
900163b8:	ebfffcff 	bl	900157bc <CleanL1DcacheAll>
    // CleanL2CacheAll();
}
900163bc:	e320f000 	nop	{0}
900163c0:	e8bd8800 	pop	{fp, pc}

900163c4 <flush_dcache>:
 *   invalidating the D cache.
 *
 ****************************************************************************/

static inline void flush_dcache(uintptr_t start, uintptr_t end)
{
900163c4:	e92d4800 	push	{fp, lr}
900163c8:	e28db004 	add	fp, sp, #4
900163cc:	e24dd008 	sub	sp, sp, #8
900163d0:	e50b0008 	str	r0, [fp, #-8]
900163d4:	e50b100c 	str	r1, [fp, #-12]

    FlushL1Dcache(start, end);
900163d8:	e51b100c 	ldr	r1, [fp, #-12]
900163dc:	e51b0008 	ldr	r0, [fp, #-8]
900163e0:	ebfffd1d 	bl	9001585c <FlushL1Dcache>
    // FlushL2Cache(start, end);
}
900163e4:	e320f000 	nop	{0}
900163e8:	e24bd004 	sub	sp, fp, #4
900163ec:	e8bd8800 	pop	{fp, pc}

900163f0 <flush_dcache_all>:
 *   Flush the entire data cache by cleaning and invalidating the D cache.
 *
 ****************************************************************************/

static inline void flush_dcache_all(void)
{
900163f0:	e92d4800 	push	{fp, lr}
900163f4:	e28db004 	add	fp, sp, #4
    FlushL1DcacheAll();
900163f8:	ebfffd40 	bl	90015900 <FlushL1DcacheAll>
    // FlushL2CacheAll();
}
900163fc:	e320f000 	nop	{0}
90016400:	e8bd8800 	pop	{fp, pc}

90016404 <enable_icache>:
 *   Enable the I-Cache
 *
 ****************************************************************************/

static inline void enable_icache(void)
{
90016404:	e92d4800 	push	{fp, lr}
90016408:	e28db004 	add	fp, sp, #4
    EnableL1Icache();
9001640c:	ebfffd98 	bl	90015a74 <EnableL1Icache>
}
90016410:	e320f000 	nop	{0}
90016414:	e8bd8800 	pop	{fp, pc}

90016418 <disable_icache>:
 *   Disable the I-Cache
 *
 ****************************************************************************/

static inline void disable_icache(void)
{
90016418:	e92d4800 	push	{fp, lr}
9001641c:	e28db004 	add	fp, sp, #4
    DisableL1Icache();
90016420:	ebfffda6 	bl	90015ac0 <DisableL1Icache>
}
90016424:	e320f000 	nop	{0}
90016428:	e8bd8800 	pop	{fp, pc}

9001642c <enable_dcache>:
 *   Enable the D-Cache
 *
 ****************************************************************************/

static inline void enable_dcache(void)
{
9001642c:	e92d4800 	push	{fp, lr}
90016430:	e28db004 	add	fp, sp, #4
    EnableL1Dcache();
90016434:	ebfffdb0 	bl	90015afc <EnableL1Dcache>
    // EnableL2Cache();
}
90016438:	e320f000 	nop	{0}
9001643c:	e8bd8800 	pop	{fp, pc}

90016440 <disable_dcache>:
 *   Disable the D-Cache
 *
 ****************************************************************************/

static inline void disable_dcache(void)
{
90016440:	e92d4800 	push	{fp, lr}
90016444:	e28db004 	add	fp, sp, #4
    FlushL1DcacheAll();
90016448:	ebfffd2c 	bl	90015900 <FlushL1DcacheAll>
    // pl310_flush_all();
    DisableL1Dcache();
9001644c:	ebfffdbd 	bl	90015b48 <DisableL1Dcache>
    // DisableL2Cache();
}
90016450:	e320f000 	nop	{0}
90016454:	e8bd8800 	pop	{fp, pc}

90016458 <hardkernel_icache_init>:
    .flushall = flush_dcache_all,
    .invalidateall = invalidate_dcache_all,
};

struct ICacheDone* hardkernel_icache_init(struct TraceTag* hardkernel_tag)
{
90016458:	e92d4800 	push	{fp, lr}
9001645c:	e28db004 	add	fp, sp, #4
90016460:	e24dd008 	sub	sp, sp, #8
90016464:	e50b0008 	str	r0, [fp, #-8]
    /* init icache */
    icache_done.enable();
90016468:	e3033340 	movw	r3, #13120	; 0x3340
9001646c:	e3493002 	movt	r3, #36866	; 0x9002
90016470:	e5933000 	ldr	r3, [r3]
90016474:	e12fff33 	blx	r3
    return &icache_done;
90016478:	e3033340 	movw	r3, #13120	; 0x3340
9001647c:	e3493002 	movt	r3, #36866	; 0x9002
}
90016480:	e1a00003 	mov	r0, r3
90016484:	e24bd004 	sub	sp, fp, #4
90016488:	e8bd8800 	pop	{fp, pc}

9001648c <hardkernel_dcache_init>:

struct DCacheDone* hardkernel_dcache_init(struct TraceTag* hardkernel_tag)
{
9001648c:	e92d4800 	push	{fp, lr}
90016490:	e28db004 	add	fp, sp, #4
90016494:	e24dd008 	sub	sp, sp, #8
90016498:	e50b0008 	str	r0, [fp, #-8]
    /* init dcache */
    dcache_done.enable();
9001649c:	e3033350 	movw	r3, #13136	; 0x3350
900164a0:	e3493002 	movt	r3, #36866	; 0x9002
900164a4:	e5933000 	ldr	r3, [r3]
900164a8:	e12fff33 	blx	r3
    return &dcache_done;
900164ac:	e3033350 	movw	r3, #13136	; 0x3350
900164b0:	e3493002 	movt	r3, #36866	; 0x9002
900164b4:	e1a00003 	mov	r0, r3
900164b8:	e24bd004 	sub	sp, fp, #4
900164bc:	e8bd8800 	pop	{fp, pc}

900164c0 <xizi_uart_init>:
    }

static struct TraceTag hardkernel_tag;

static bool xizi_uart_init()
{
900164c0:	e92d4800 	push	{fp, lr}
900164c4:	e28db004 	add	fp, sp, #4
900164c8:	e24dd018 	sub	sp, sp, #24
    struct XiziSerialDriver* p_uart_driver = hardkernel_uart_init(&hardkernel_tag);
900164cc:	e30a0868 	movw	r0, #43112	; 0xa868
900164d0:	e3490019 	movt	r0, #36889	; 0x9019
900164d4:	ebfffab1 	bl	90014fa0 <hardkernel_uart_init>
900164d8:	e50b0008 	str	r0, [fp, #-8]
    if (p_uart_driver == NULL) {
900164dc:	e51b3008 	ldr	r3, [fp, #-8]
900164e0:	e3530000 	cmp	r3, #0
900164e4:	1a00000a 	bne	90016514 <xizi_uart_init+0x54>
        ERROR("uart driver init failed\n");
900164e8:	e3a02033 	mov	r2, #51	; 0x33
900164ec:	e30115ac 	movw	r1, #5548	; 0x15ac
900164f0:	e3491002 	movt	r1, #36866	; 0x9002
900164f4:	e3010230 	movw	r0, #4656	; 0x1230
900164f8:	e3490002 	movt	r0, #36866	; 0x9002
900164fc:	ebfffb9d 	bl	90015378 <KPrintf>
90016500:	e3010240 	movw	r0, #4672	; 0x1240
90016504:	e3490002 	movt	r0, #36866	; 0x9002
90016508:	ebfffb9a 	bl	90015378 <KPrintf>
        return false;
9001650c:	e3a03000 	mov	r3, #0
90016510:	ea00001c 	b	90016588 <xizi_uart_init+0xc8>
    }

    struct TraceTag uart_driver_tag;
    if (!CreateResourceTag(&uart_driver_tag, &hardkernel_tag, "uart-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_uart_driver)) {
90016514:	e24b0010 	sub	r0, fp, #16
90016518:	e51b3008 	ldr	r3, [fp, #-8]
9001651c:	e58d3000 	str	r3, [sp]
90016520:	e3a03002 	mov	r3, #2
90016524:	e301225c 	movw	r2, #4700	; 0x125c
90016528:	e3492002 	movt	r2, #36866	; 0x9002
9001652c:	e30a1868 	movw	r1, #43112	; 0xa868
90016530:	e3491019 	movt	r1, #36889	; 0x9019
90016534:	eb00070e 	bl	90018174 <CreateResourceTag>
90016538:	e1a03000 	mov	r3, r0
9001653c:	e2233001 	eor	r3, r3, #1
90016540:	e6ef3073 	uxtb	r3, r3
90016544:	e3530000 	cmp	r3, #0
90016548:	0a00000a 	beq	90016578 <xizi_uart_init+0xb8>
        ERROR("Create uart resource failed.\n");
9001654c:	e3a02039 	mov	r2, #57	; 0x39
90016550:	e30115ac 	movw	r1, #5548	; 0x15ac
90016554:	e3491002 	movt	r1, #36866	; 0x9002
90016558:	e3010230 	movw	r0, #4656	; 0x1230
9001655c:	e3490002 	movt	r0, #36866	; 0x9002
90016560:	ebfffb84 	bl	90015378 <KPrintf>
90016564:	e3010270 	movw	r0, #4720	; 0x1270
90016568:	e3490002 	movt	r0, #36866	; 0x9002
9001656c:	ebfffb81 	bl	90015378 <KPrintf>
        return false;
90016570:	e3a03000 	mov	r3, #0
90016574:	ea000003 	b	90016588 <xizi_uart_init+0xc8>
    }

    serial_init(&uart_driver_tag);
90016578:	e24b3010 	sub	r3, fp, #16
9001657c:	e1a00003 	mov	r0, r3
90016580:	ebfffb18 	bl	900151e8 <serial_init>
    return true;
90016584:	e3a03001 	mov	r3, #1
}
90016588:	e1a00003 	mov	r0, r3
9001658c:	e24bd004 	sub	sp, fp, #4
90016590:	e8bd8800 	pop	{fp, pc}

90016594 <xizi_intr_init>:

static bool xizi_intr_init()
{
90016594:	e92d4800 	push	{fp, lr}
90016598:	e28db004 	add	fp, sp, #4
9001659c:	e24dd028 	sub	sp, sp, #40	; 0x28
    /* init intr driver */
    struct XiziTrapDriver* p_intr_driver = hardkernel_intr_init(&hardkernel_tag);
900165a0:	e30a0868 	movw	r0, #43112	; 0xa868
900165a4:	e3490019 	movt	r0, #36889	; 0x9019
900165a8:	ebfff3b4 	bl	90013480 <hardkernel_intr_init>
900165ac:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(p_intr_driver == NULL)) {
900165b0:	e51b3008 	ldr	r3, [fp, #-8]
900165b4:	e3530000 	cmp	r3, #0
900165b8:	03a03001 	moveq	r3, #1
900165bc:	13a03000 	movne	r3, #0
900165c0:	e6ef3073 	uxtb	r3, r3
900165c4:	e3530000 	cmp	r3, #0
900165c8:	0a00000a 	beq	900165f8 <xizi_intr_init+0x64>
        ERROR("intr driver init failed\n");
900165cc:	e3a02046 	mov	r2, #70	; 0x46
900165d0:	e30115bc 	movw	r1, #5564	; 0x15bc
900165d4:	e3491002 	movt	r1, #36866	; 0x9002
900165d8:	e3010230 	movw	r0, #4656	; 0x1230
900165dc:	e3490002 	movt	r0, #36866	; 0x9002
900165e0:	ebfffb64 	bl	90015378 <KPrintf>
900165e4:	e3010290 	movw	r0, #4752	; 0x1290
900165e8:	e3490002 	movt	r0, #36866	; 0x9002
900165ec:	ebfffb61 	bl	90015378 <KPrintf>
        return false;
900165f0:	e3a03000 	mov	r3, #0
900165f4:	ea00005c 	b	9001676c <xizi_intr_init+0x1d8>
    }

    struct TraceTag intr_driver_tag = {};
900165f8:	e24b3010 	sub	r3, fp, #16
900165fc:	e3a02000 	mov	r2, #0
90016600:	e5832000 	str	r2, [r3]
90016604:	e5832004 	str	r2, [r3, #4]
    if (!CreateResourceTag(&intr_driver_tag, &hardkernel_tag, "intr-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_intr_driver)) {
90016608:	e24b0010 	sub	r0, fp, #16
9001660c:	e51b3008 	ldr	r3, [fp, #-8]
90016610:	e58d3000 	str	r3, [sp]
90016614:	e3a03002 	mov	r3, #2
90016618:	e30122ac 	movw	r2, #4780	; 0x12ac
9001661c:	e3492002 	movt	r2, #36866	; 0x9002
90016620:	e30a1868 	movw	r1, #43112	; 0xa868
90016624:	e3491019 	movt	r1, #36889	; 0x9019
90016628:	eb0006d1 	bl	90018174 <CreateResourceTag>
9001662c:	e1a03000 	mov	r3, r0
90016630:	e2233001 	eor	r3, r3, #1
90016634:	e6ef3073 	uxtb	r3, r3
90016638:	e3530000 	cmp	r3, #0
9001663c:	0a00000a 	beq	9001666c <xizi_intr_init+0xd8>
        ERROR("Create intr resource failed.\n");
90016640:	e3a0204c 	mov	r2, #76	; 0x4c
90016644:	e30115bc 	movw	r1, #5564	; 0x15bc
90016648:	e3491002 	movt	r1, #36866	; 0x9002
9001664c:	e3010230 	movw	r0, #4656	; 0x1230
90016650:	e3490002 	movt	r0, #36866	; 0x9002
90016654:	ebfffb47 	bl	90015378 <KPrintf>
90016658:	e30102c0 	movw	r0, #4800	; 0x12c0
9001665c:	e3490002 	movt	r0, #36866	; 0x9002
90016660:	ebfffb44 	bl	90015378 <KPrintf>
        return false;
90016664:	e3a03000 	mov	r3, #0
90016668:	ea00003f 	b	9001676c <xizi_intr_init+0x1d8>
    }

    /* grant rights to intr dispatcher */
    struct IrqDispatcherRightGroup irq_dispatcher_rights = { .intr_driver_tag = intr_driver_tag };
9001666c:	e24b3018 	sub	r3, fp, #24
90016670:	e24b2010 	sub	r2, fp, #16
90016674:	e8920003 	ldm	r2, {r0, r1}
90016678:	e8830003 	stm	r3, {r0, r1}
    if (!intr_distributer_init(&irq_dispatcher_rights)) {
9001667c:	e24b3018 	sub	r3, fp, #24
90016680:	e1a00003 	mov	r0, r3
90016684:	eb00121e 	bl	9001af04 <intr_distributer_init>
90016688:	e1a03000 	mov	r3, r0
9001668c:	e2233001 	eor	r3, r3, #1
90016690:	e6ef3073 	uxtb	r3, r3
90016694:	e3530000 	cmp	r3, #0
90016698:	0a00000a 	beq	900166c8 <xizi_intr_init+0x134>
        ERROR("init intr distributer failed.\n");
9001669c:	e3a02053 	mov	r2, #83	; 0x53
900166a0:	e30115bc 	movw	r1, #5564	; 0x15bc
900166a4:	e3491002 	movt	r1, #36866	; 0x9002
900166a8:	e3010230 	movw	r0, #4656	; 0x1230
900166ac:	e3490002 	movt	r0, #36866	; 0x9002
900166b0:	ebfffb30 	bl	90015378 <KPrintf>
900166b4:	e30102e0 	movw	r0, #4832	; 0x12e0
900166b8:	e3490002 	movt	r0, #36866	; 0x9002
900166bc:	ebfffb2d 	bl	90015378 <KPrintf>
        return false;
900166c0:	e3a03000 	mov	r3, #0
900166c4:	ea000028 	b	9001676c <xizi_intr_init+0x1d8>
    }

    /* grant rights to syscall dispatcher */
    struct SwiDispatcherRightGroup swi_dispatcher_rights = { .intr_driver_tag = intr_driver_tag };
900166c8:	e24b3020 	sub	r3, fp, #32
900166cc:	e24b2010 	sub	r2, fp, #16
900166d0:	e8920003 	ldm	r2, {r0, r1}
900166d4:	e8830003 	stm	r3, {r0, r1}
    if (!swi_distributer_init(&swi_dispatcher_rights)) {
900166d8:	e24b3020 	sub	r3, fp, #32
900166dc:	e1a00003 	mov	r0, r3
900166e0:	eb00133e 	bl	9001b3e0 <swi_distributer_init>
900166e4:	e1a03000 	mov	r3, r0
900166e8:	e2233001 	eor	r3, r3, #1
900166ec:	e6ef3073 	uxtb	r3, r3
900166f0:	e3530000 	cmp	r3, #0
900166f4:	0a00000a 	beq	90016724 <xizi_intr_init+0x190>
        ERROR("init syscall distributer failed.\n");
900166f8:	e3a0205a 	mov	r2, #90	; 0x5a
900166fc:	e30115bc 	movw	r1, #5564	; 0x15bc
90016700:	e3491002 	movt	r1, #36866	; 0x9002
90016704:	e3010230 	movw	r0, #4656	; 0x1230
90016708:	e3490002 	movt	r0, #36866	; 0x9002
9001670c:	ebfffb19 	bl	90015378 <KPrintf>
90016710:	e3010300 	movw	r0, #4864	; 0x1300
90016714:	e3490002 	movt	r0, #36866	; 0x9002
90016718:	ebfffb16 	bl	90015378 <KPrintf>
        return false;
9001671c:	e3a03000 	mov	r3, #0
90016720:	ea000011 	b	9001676c <xizi_intr_init+0x1d8>
    }

    /* grant rights to spinlock module*/
    if (!module_spinlock_use_intr_init()) {
90016724:	ebfff57e 	bl	90013d24 <module_spinlock_use_intr_init>
90016728:	e1a03000 	mov	r3, r0
9001672c:	e2233001 	eor	r3, r3, #1
90016730:	e6ef3073 	uxtb	r3, r3
90016734:	e3530000 	cmp	r3, #0
90016738:	0a00000a 	beq	90016768 <xizi_intr_init+0x1d4>
        ERROR("spinlock init using interrupt failed\n");
9001673c:	e3a02060 	mov	r2, #96	; 0x60
90016740:	e30115bc 	movw	r1, #5564	; 0x15bc
90016744:	e3491002 	movt	r1, #36866	; 0x9002
90016748:	e3010230 	movw	r0, #4656	; 0x1230
9001674c:	e3490002 	movt	r0, #36866	; 0x9002
90016750:	ebfffb08 	bl	90015378 <KPrintf>
90016754:	e3010324 	movw	r0, #4900	; 0x1324
90016758:	e3490002 	movt	r0, #36866	; 0x9002
9001675c:	ebfffb05 	bl	90015378 <KPrintf>
        return false;
90016760:	e3a03000 	mov	r3, #0
90016764:	ea000000 	b	9001676c <xizi_intr_init+0x1d8>
    }

    return true;
90016768:	e3a03001 	mov	r3, #1
}
9001676c:	e1a00003 	mov	r0, r3
90016770:	e24bd004 	sub	sp, fp, #4
90016774:	e8bd8800 	pop	{fp, pc}

90016778 <xizi_gpt_init>:

static bool xizi_gpt_init()
{
90016778:	e92d4810 	push	{r4, fp, lr}
9001677c:	e28db008 	add	fp, sp, #8
90016780:	e24dd024 	sub	sp, sp, #36	; 0x24
    /* init clock driver and create clock driver tag */
    struct XiziClockDriver* p_clock_driver = hardkernel_clock_init(&hardkernel_tag);
90016784:	e30a0868 	movw	r0, #43112	; 0xa868
90016788:	e3490019 	movt	r0, #36889	; 0x9019
9001678c:	ebffeda6 	bl	90011e2c <hardkernel_clock_init>
90016790:	e50b0010 	str	r0, [fp, #-16]
    if (UNLIKELY(p_clock_driver == NULL)) {
90016794:	e51b3010 	ldr	r3, [fp, #-16]
90016798:	e3530000 	cmp	r3, #0
9001679c:	03a03001 	moveq	r3, #1
900167a0:	13a03000 	movne	r3, #0
900167a4:	e6ef3073 	uxtb	r3, r3
900167a8:	e3530000 	cmp	r3, #0
900167ac:	0a00000a 	beq	900167dc <xizi_gpt_init+0x64>
        ERROR("clock driver init failed\n");
900167b0:	e3a0206c 	mov	r2, #108	; 0x6c
900167b4:	e30115cc 	movw	r1, #5580	; 0x15cc
900167b8:	e3491002 	movt	r1, #36866	; 0x9002
900167bc:	e3010230 	movw	r0, #4656	; 0x1230
900167c0:	e3490002 	movt	r0, #36866	; 0x9002
900167c4:	ebfffaeb 	bl	90015378 <KPrintf>
900167c8:	e301034c 	movw	r0, #4940	; 0x134c
900167cc:	e3490002 	movt	r0, #36866	; 0x9002
900167d0:	ebfffae8 	bl	90015378 <KPrintf>
        return false;
900167d4:	e3a03000 	mov	r3, #0
900167d8:	ea00005b 	b	9001694c <xizi_gpt_init+0x1d4>
    }

    struct TraceTag clock_driver_tag;
    if (!CreateResourceTag(&clock_driver_tag, &hardkernel_tag, "clock-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_clock_driver)) {
900167dc:	e24b001c 	sub	r0, fp, #28
900167e0:	e51b3010 	ldr	r3, [fp, #-16]
900167e4:	e58d3000 	str	r3, [sp]
900167e8:	e3a03002 	mov	r3, #2
900167ec:	e3012368 	movw	r2, #4968	; 0x1368
900167f0:	e3492002 	movt	r2, #36866	; 0x9002
900167f4:	e30a1868 	movw	r1, #43112	; 0xa868
900167f8:	e3491019 	movt	r1, #36889	; 0x9019
900167fc:	eb00065c 	bl	90018174 <CreateResourceTag>
90016800:	e1a03000 	mov	r3, r0
90016804:	e2233001 	eor	r3, r3, #1
90016808:	e6ef3073 	uxtb	r3, r3
9001680c:	e3530000 	cmp	r3, #0
90016810:	0a00000a 	beq	90016840 <xizi_gpt_init+0xc8>
        ERROR("Create clock resource failed.\n");
90016814:	e3a02072 	mov	r2, #114	; 0x72
90016818:	e30115cc 	movw	r1, #5580	; 0x15cc
9001681c:	e3491002 	movt	r1, #36866	; 0x9002
90016820:	e3010230 	movw	r0, #4656	; 0x1230
90016824:	e3490002 	movt	r0, #36866	; 0x9002
90016828:	ebfffad2 	bl	90015378 <KPrintf>
9001682c:	e301037c 	movw	r0, #4988	; 0x137c
90016830:	e3490002 	movt	r0, #36866	; 0x9002
90016834:	ebfffacf 	bl	90015378 <KPrintf>
        return false;
90016838:	e3a03000 	mov	r3, #0
9001683c:	ea000042 	b	9001694c <xizi_gpt_init+0x1d4>
    }

    /* enable clock interrupt */
    if (!clock_intr_handler_init(&clock_driver_tag)) {
90016840:	e24b301c 	sub	r3, fp, #28
90016844:	e1a00003 	mov	r0, r3
90016848:	eb001288 	bl	9001b270 <clock_intr_handler_init>
9001684c:	e1a03000 	mov	r3, r0
90016850:	e2233001 	eor	r3, r3, #1
90016854:	e6ef3073 	uxtb	r3, r3
90016858:	e3530000 	cmp	r3, #0
9001685c:	0a00000a 	beq	9001688c <xizi_gpt_init+0x114>
        ERROR("clock interrupt init failed.\n");
90016860:	e3a02078 	mov	r2, #120	; 0x78
90016864:	e30115cc 	movw	r1, #5580	; 0x15cc
90016868:	e3491002 	movt	r1, #36866	; 0x9002
9001686c:	e3010230 	movw	r0, #4656	; 0x1230
90016870:	e3490002 	movt	r0, #36866	; 0x9002
90016874:	ebfffabf 	bl	90015378 <KPrintf>
90016878:	e301039c 	movw	r0, #5020	; 0x139c
9001687c:	e3490002 	movt	r0, #36866	; 0x9002
90016880:	ebfffabc 	bl	90015378 <KPrintf>
        return false;
90016884:	e3a03000 	mov	r3, #0
90016888:	ea00002f 	b	9001694c <xizi_gpt_init+0x1d4>
    }
    // get intr driver tag
    struct TraceTag intr_driver_tag;
    if (!AchieveResourceTag(&intr_driver_tag, &hardkernel_tag, "intr-ac-resource")) {
9001688c:	e24b3024 	sub	r3, fp, #36	; 0x24
90016890:	e30122ac 	movw	r2, #4780	; 0x12ac
90016894:	e3492002 	movt	r2, #36866	; 0x9002
90016898:	e30a1868 	movw	r1, #43112	; 0xa868
9001689c:	e3491019 	movt	r1, #36889	; 0x9019
900168a0:	e1a00003 	mov	r0, r3
900168a4:	eb0005f9 	bl	90018090 <AchieveResourceTag>
900168a8:	e1a03000 	mov	r3, r0
900168ac:	e2233001 	eor	r3, r3, #1
900168b0:	e6ef3073 	uxtb	r3, r3
900168b4:	e3530000 	cmp	r3, #0
900168b8:	0a00000a 	beq	900168e8 <xizi_gpt_init+0x170>
        ERROR("Achieve intr resource failed.\n");
900168bc:	e3a0207e 	mov	r2, #126	; 0x7e
900168c0:	e30115cc 	movw	r1, #5580	; 0x15cc
900168c4:	e3491002 	movt	r1, #36866	; 0x9002
900168c8:	e3010230 	movw	r0, #4656	; 0x1230
900168cc:	e3490002 	movt	r0, #36866	; 0x9002
900168d0:	ebfffaa8 	bl	90015378 <KPrintf>
900168d4:	e30103bc 	movw	r0, #5052	; 0x13bc
900168d8:	e3490002 	movt	r0, #36866	; 0x9002
900168dc:	ebfffaa5 	bl	90015378 <KPrintf>
        return false;
900168e0:	e3a03000 	mov	r3, #0
900168e4:	ea000018 	b	9001694c <xizi_gpt_init+0x1d4>
    }
    // register clock handler to intr
    struct XiziTrapDriver* p_intr_driver = (struct XiziTrapDriver*)AchieveResource(&intr_driver_tag);
900168e8:	e24b3024 	sub	r3, fp, #36	; 0x24
900168ec:	e1a00003 	mov	r0, r3
900168f0:	eb0005f9 	bl	900180dc <AchieveResource>
900168f4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    p_intr_driver->bind_irq_handler(p_clock_driver->get_clock_int(), xizi_clock_handler);
900168f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900168fc:	e59342ac 	ldr	r4, [r3, #684]	; 0x2ac
90016900:	e51b3010 	ldr	r3, [fp, #-16]
90016904:	e5933004 	ldr	r3, [r3, #4]
90016908:	e12fff33 	blx	r3
9001690c:	e1a03000 	mov	r3, r0
90016910:	e30b12d4 	movw	r1, #45780	; 0xb2d4
90016914:	e3491001 	movt	r1, #36865	; 0x9001
90016918:	e1a00003 	mov	r0, r3
9001691c:	e12fff34 	blx	r4
    p_intr_driver->single_irq_enable(p_clock_driver->get_clock_int(), 0, 0);
90016920:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90016924:	e593429c 	ldr	r4, [r3, #668]	; 0x29c
90016928:	e51b3010 	ldr	r3, [fp, #-16]
9001692c:	e5933004 	ldr	r3, [r3, #4]
90016930:	e12fff33 	blx	r3
90016934:	e1a03000 	mov	r3, r0
90016938:	e3a02000 	mov	r2, #0
9001693c:	e3a01000 	mov	r1, #0
90016940:	e1a00003 	mov	r0, r3
90016944:	e12fff34 	blx	r4

    return true;
90016948:	e3a03001 	mov	r3, #1
}
9001694c:	e1a00003 	mov	r0, r3
90016950:	e24bd008 	sub	sp, fp, #8
90016954:	e8bd8810 	pop	{r4, fp, pc}

90016958 <xizi_cache_init>:

static bool xizi_cache_init()
{
90016958:	e92d4800 	push	{fp, lr}
9001695c:	e28db004 	add	fp, sp, #4
90016960:	e24dd020 	sub	sp, sp, #32
    struct TraceTag icache_driver_tag, dcache_driver_tag;

    struct ICacheDone* p_icache_done = hardkernel_icache_init(&hardkernel_tag);
90016964:	e30a0868 	movw	r0, #43112	; 0xa868
90016968:	e3490019 	movt	r0, #36889	; 0x9019
9001696c:	ebfffeb9 	bl	90016458 <hardkernel_icache_init>
90016970:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(p_icache_done == NULL)) {
90016974:	e51b3008 	ldr	r3, [fp, #-8]
90016978:	e3530000 	cmp	r3, #0
9001697c:	03a03001 	moveq	r3, #1
90016980:	13a03000 	movne	r3, #0
90016984:	e6ef3073 	uxtb	r3, r3
90016988:	e3530000 	cmp	r3, #0
9001698c:	0a00000a 	beq	900169bc <xizi_cache_init+0x64>
        ERROR("icache driver init failed.\n");
90016990:	e3a0208f 	mov	r2, #143	; 0x8f
90016994:	e30115dc 	movw	r1, #5596	; 0x15dc
90016998:	e3491002 	movt	r1, #36866	; 0x9002
9001699c:	e3010230 	movw	r0, #4656	; 0x1230
900169a0:	e3490002 	movt	r0, #36866	; 0x9002
900169a4:	ebfffa73 	bl	90015378 <KPrintf>
900169a8:	e30103dc 	movw	r0, #5084	; 0x13dc
900169ac:	e3490002 	movt	r0, #36866	; 0x9002
900169b0:	ebfffa70 	bl	90015378 <KPrintf>
        return false;
900169b4:	e3a03000 	mov	r3, #0
900169b8:	ea000048 	b	90016ae0 <xizi_cache_init+0x188>
    }
    if (!CreateResourceTag(&icache_driver_tag, &hardkernel_tag, "icache-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_icache_done)) {
900169bc:	e24b0014 	sub	r0, fp, #20
900169c0:	e51b3008 	ldr	r3, [fp, #-8]
900169c4:	e58d3000 	str	r3, [sp]
900169c8:	e3a03002 	mov	r3, #2
900169cc:	e30123f8 	movw	r2, #5112	; 0x13f8
900169d0:	e3492002 	movt	r2, #36866	; 0x9002
900169d4:	e30a1868 	movw	r1, #43112	; 0xa868
900169d8:	e3491019 	movt	r1, #36889	; 0x9019
900169dc:	eb0005e4 	bl	90018174 <CreateResourceTag>
900169e0:	e1a03000 	mov	r3, r0
900169e4:	e2233001 	eor	r3, r3, #1
900169e8:	e6ef3073 	uxtb	r3, r3
900169ec:	e3530000 	cmp	r3, #0
900169f0:	0a00000a 	beq	90016a20 <xizi_cache_init+0xc8>
        ERROR("Create icache resource failed.\n");
900169f4:	e3a02093 	mov	r2, #147	; 0x93
900169f8:	e30115dc 	movw	r1, #5596	; 0x15dc
900169fc:	e3491002 	movt	r1, #36866	; 0x9002
90016a00:	e3010230 	movw	r0, #4656	; 0x1230
90016a04:	e3490002 	movt	r0, #36866	; 0x9002
90016a08:	ebfffa5a 	bl	90015378 <KPrintf>
90016a0c:	e301040c 	movw	r0, #5132	; 0x140c
90016a10:	e3490002 	movt	r0, #36866	; 0x9002
90016a14:	ebfffa57 	bl	90015378 <KPrintf>
        return false;
90016a18:	e3a03000 	mov	r3, #0
90016a1c:	ea00002f 	b	90016ae0 <xizi_cache_init+0x188>
    }

    struct DCacheDone* p_dcache_done = hardkernel_dcache_init(&hardkernel_tag);
90016a20:	e30a0868 	movw	r0, #43112	; 0xa868
90016a24:	e3490019 	movt	r0, #36889	; 0x9019
90016a28:	ebfffe97 	bl	9001648c <hardkernel_dcache_init>
90016a2c:	e50b000c 	str	r0, [fp, #-12]
    if (UNLIKELY(p_dcache_done == NULL)) {
90016a30:	e51b300c 	ldr	r3, [fp, #-12]
90016a34:	e3530000 	cmp	r3, #0
90016a38:	03a03001 	moveq	r3, #1
90016a3c:	13a03000 	movne	r3, #0
90016a40:	e6ef3073 	uxtb	r3, r3
90016a44:	e3530000 	cmp	r3, #0
90016a48:	0a00000a 	beq	90016a78 <xizi_cache_init+0x120>
        ERROR("dcache driver init failed.\n");
90016a4c:	e3a02099 	mov	r2, #153	; 0x99
90016a50:	e30115dc 	movw	r1, #5596	; 0x15dc
90016a54:	e3491002 	movt	r1, #36866	; 0x9002
90016a58:	e3010230 	movw	r0, #4656	; 0x1230
90016a5c:	e3490002 	movt	r0, #36866	; 0x9002
90016a60:	ebfffa44 	bl	90015378 <KPrintf>
90016a64:	e301042c 	movw	r0, #5164	; 0x142c
90016a68:	e3490002 	movt	r0, #36866	; 0x9002
90016a6c:	ebfffa41 	bl	90015378 <KPrintf>
        return false;
90016a70:	e3a03000 	mov	r3, #0
90016a74:	ea000019 	b	90016ae0 <xizi_cache_init+0x188>
    }
    if (!CreateResourceTag(&dcache_driver_tag, &hardkernel_tag, "dcache-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_dcache_done)) {
90016a78:	e24b001c 	sub	r0, fp, #28
90016a7c:	e51b300c 	ldr	r3, [fp, #-12]
90016a80:	e58d3000 	str	r3, [sp]
90016a84:	e3a03002 	mov	r3, #2
90016a88:	e3012448 	movw	r2, #5192	; 0x1448
90016a8c:	e3492002 	movt	r2, #36866	; 0x9002
90016a90:	e30a1868 	movw	r1, #43112	; 0xa868
90016a94:	e3491019 	movt	r1, #36889	; 0x9019
90016a98:	eb0005b5 	bl	90018174 <CreateResourceTag>
90016a9c:	e1a03000 	mov	r3, r0
90016aa0:	e2233001 	eor	r3, r3, #1
90016aa4:	e6ef3073 	uxtb	r3, r3
90016aa8:	e3530000 	cmp	r3, #0
90016aac:	0a00000a 	beq	90016adc <xizi_cache_init+0x184>
        ERROR("Create dcache resource failed.\n");
90016ab0:	e3a0209d 	mov	r2, #157	; 0x9d
90016ab4:	e30115dc 	movw	r1, #5596	; 0x15dc
90016ab8:	e3491002 	movt	r1, #36866	; 0x9002
90016abc:	e3010230 	movw	r0, #4656	; 0x1230
90016ac0:	e3490002 	movt	r0, #36866	; 0x9002
90016ac4:	ebfffa2b 	bl	90015378 <KPrintf>
90016ac8:	e301045c 	movw	r0, #5212	; 0x145c
90016acc:	e3490002 	movt	r0, #36866	; 0x9002
90016ad0:	ebfffa28 	bl	90015378 <KPrintf>
        return false;
90016ad4:	e3a03000 	mov	r3, #0
90016ad8:	ea000000 	b	90016ae0 <xizi_cache_init+0x188>
    }

    return true;
90016adc:	e3a03001 	mov	r3, #1
}
90016ae0:	e1a00003 	mov	r0, r3
90016ae4:	e24bd004 	sub	sp, fp, #4
90016ae8:	e8bd8800 	pop	{fp, pc}

90016aec <xizi_mmu_init>:

static bool xizi_mmu_init()
{
90016aec:	e92d4800 	push	{fp, lr}
90016af0:	e28db004 	add	fp, sp, #4
90016af4:	e24dd018 	sub	sp, sp, #24
    struct MmuCommonDone* p_mmu_done = hardkernel_mmu_init(&hardkernel_tag, "icache-ac-resource", "dcache-ac-resource");
90016af8:	e3012448 	movw	r2, #5192	; 0x1448
90016afc:	e3492002 	movt	r2, #36866	; 0x9002
90016b00:	e30113f8 	movw	r1, #5112	; 0x13f8
90016b04:	e3491002 	movt	r1, #36866	; 0x9002
90016b08:	e30a0868 	movw	r0, #43112	; 0xa868
90016b0c:	e3490019 	movt	r0, #36889	; 0x9019
90016b10:	ebffeed8 	bl	90012678 <hardkernel_mmu_init>
90016b14:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(p_mmu_done == NULL)) {
90016b18:	e51b3008 	ldr	r3, [fp, #-8]
90016b1c:	e3530000 	cmp	r3, #0
90016b20:	03a03001 	moveq	r3, #1
90016b24:	13a03000 	movne	r3, #0
90016b28:	e6ef3073 	uxtb	r3, r3
90016b2c:	e3530000 	cmp	r3, #0
90016b30:	0a00000a 	beq	90016b60 <xizi_mmu_init+0x74>
        ERROR("mmu driver init failed\n");
90016b34:	e3a020a8 	mov	r2, #168	; 0xa8
90016b38:	e30115ec 	movw	r1, #5612	; 0x15ec
90016b3c:	e3491002 	movt	r1, #36866	; 0x9002
90016b40:	e3010230 	movw	r0, #4656	; 0x1230
90016b44:	e3490002 	movt	r0, #36866	; 0x9002
90016b48:	ebfffa0a 	bl	90015378 <KPrintf>
90016b4c:	e301047c 	movw	r0, #5244	; 0x147c
90016b50:	e3490002 	movt	r0, #36866	; 0x9002
90016b54:	ebfffa07 	bl	90015378 <KPrintf>
        return false;
90016b58:	e3a03000 	mov	r3, #0
90016b5c:	ea000009 	b	90016b88 <xizi_mmu_init+0x9c>
    }

    /* create trace for mmu driver */
    struct TraceTag mmu_driver_tag;
    CreateResourceTag(&mmu_driver_tag, &hardkernel_tag, "mmu-ac-resource", TRACER_HARDKERNEL_AC_RESOURCE, p_mmu_done);
90016b60:	e24b0010 	sub	r0, fp, #16
90016b64:	e51b3008 	ldr	r3, [fp, #-8]
90016b68:	e58d3000 	str	r3, [sp]
90016b6c:	e3a03002 	mov	r3, #2
90016b70:	e3012494 	movw	r2, #5268	; 0x1494
90016b74:	e3492002 	movt	r2, #36866	; 0x9002
90016b78:	e30a1868 	movw	r1, #43112	; 0xa868
90016b7c:	e3491019 	movt	r1, #36889	; 0x9019
90016b80:	eb00057b 	bl	90018174 <CreateResourceTag>

    return true;
90016b84:	e3a03001 	mov	r3, #1
}
90016b88:	e1a00003 	mov	r0, r3
90016b8c:	e24bd004 	sub	sp, fp, #4
90016b90:	e8bd8800 	pop	{fp, pc}

90016b94 <hardkernel_init>:
    KERN_BOOT_DRIVER("mmu", "Xizi mmu driver initialized successfully.", xizi_mmu_init),
    KERN_BOOT_DRIVER("clock", "Xizi clock driver initialized successfully.", xizi_gpt_init),
};

bool hardkernel_init(struct TraceTag* _hardkernel_tag)
{
90016b94:	e92d4800 	push	{fp, lr}
90016b98:	e28db004 	add	fp, sp, #4
90016b9c:	e24dd010 	sub	sp, sp, #16
90016ba0:	e50b0010 	str	r0, [fp, #-16]
    hardkernel_tag = *_hardkernel_tag;
90016ba4:	e30a3868 	movw	r3, #43112	; 0xa868
90016ba8:	e3493019 	movt	r3, #36889	; 0x9019
90016bac:	e51b2010 	ldr	r2, [fp, #-16]
90016bb0:	e8920003 	ldm	r2, {r0, r1}
90016bb4:	e8830003 	stm	r3, {r0, r1}

    for (uint32_t i = 0; i < sizeof(hardkernel_init_array) / sizeof(struct XiziBootNode); i++) {
90016bb8:	e3a03000 	mov	r3, #0
90016bbc:	e50b3008 	str	r3, [fp, #-8]
90016bc0:	ea000023 	b	90016c54 <hardkernel_init+0xc0>
        if (!hardkernel_init_array[i].init()) {
90016bc4:	e3032370 	movw	r2, #13168	; 0x3370
90016bc8:	e3492002 	movt	r2, #36866	; 0x9002
90016bcc:	e51b1008 	ldr	r1, [fp, #-8]
90016bd0:	e1a03001 	mov	r3, r1
90016bd4:	e1a03083 	lsl	r3, r3, #1
90016bd8:	e0833001 	add	r3, r3, r1
90016bdc:	e1a03103 	lsl	r3, r3, #2
90016be0:	e0823003 	add	r3, r2, r3
90016be4:	e2833008 	add	r3, r3, #8
90016be8:	e5933000 	ldr	r3, [r3]
90016bec:	e12fff33 	blx	r3
90016bf0:	e1a03000 	mov	r3, r0
90016bf4:	e2233001 	eor	r3, r3, #1
90016bf8:	e6ef3073 	uxtb	r3, r3
90016bfc:	e3530000 	cmp	r3, #0
90016c00:	0a000001 	beq	90016c0c <hardkernel_init+0x78>
            return false;
90016c04:	e3a03000 	mov	r3, #0
90016c08:	ea000015 	b	90016c64 <hardkernel_init+0xd0>
        }
        LOG_PRINTF(hardkernel_init_array[i].bootinfo);
90016c0c:	e3032370 	movw	r2, #13168	; 0x3370
90016c10:	e3492002 	movt	r2, #36866	; 0x9002
90016c14:	e51b1008 	ldr	r1, [fp, #-8]
90016c18:	e1a03001 	mov	r3, r1
90016c1c:	e1a03083 	lsl	r3, r3, #1
90016c20:	e0833001 	add	r3, r3, r1
90016c24:	e1a03103 	lsl	r3, r3, #2
90016c28:	e0823003 	add	r3, r2, r3
90016c2c:	e2833004 	add	r3, r3, #4
90016c30:	e5933000 	ldr	r3, [r3]
90016c34:	e1a00003 	mov	r0, r3
90016c38:	ebfff9ce 	bl	90015378 <KPrintf>
        LOG_PRINTF("\n");
90016c3c:	e30105a8 	movw	r0, #5544	; 0x15a8
90016c40:	e3490002 	movt	r0, #36866	; 0x9002
90016c44:	ebfff9cb 	bl	90015378 <KPrintf>
    for (uint32_t i = 0; i < sizeof(hardkernel_init_array) / sizeof(struct XiziBootNode); i++) {
90016c48:	e51b3008 	ldr	r3, [fp, #-8]
90016c4c:	e2833001 	add	r3, r3, #1
90016c50:	e50b3008 	str	r3, [fp, #-8]
90016c54:	e51b3008 	ldr	r3, [fp, #-8]
90016c58:	e3530004 	cmp	r3, #4
90016c5c:	9affffd8 	bls	90016bc4 <hardkernel_init+0x30>
    }
    return true;
90016c60:	e3a03001 	mov	r3, #1
90016c64:	e1a00003 	mov	r0, r3
90016c68:	e24bd004 	sub	sp, fp, #4
90016c6c:	e8bd8800 	pop	{fp, pc}

90016c70 <RequireRootTag>:

struct SysTracer sys_tracer;
char* tracer_space[TRACER_MEM_CHUNK_SIZE * NR_TRACER_MEM_CHUNKS];

struct TraceTag* const RequireRootTag()
{
90016c70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90016c74:	e28db000 	add	fp, sp, #0
    static struct TraceTag root_trace_tag = { NULL };
    return &root_trace_tag;
90016c78:	e30a3870 	movw	r3, #43120	; 0xa870
90016c7c:	e3493019 	movt	r3, #36889	; 0x9019
}
90016c80:	e1a00003 	mov	r0, r3
90016c84:	e28bd000 	add	sp, fp, #0
90016c88:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90016c8c:	e12fff1e 	bx	lr

90016c90 <namecmp>:

static inline int namecmp(const char* s, const char* t)
{
90016c90:	e92d4800 	push	{fp, lr}
90016c94:	e28db004 	add	fp, sp, #4
90016c98:	e24dd008 	sub	sp, sp, #8
90016c9c:	e50b0008 	str	r0, [fp, #-8]
90016ca0:	e50b100c 	str	r1, [fp, #-12]
    return strncmp(s, t, RESOURCE_NAME_SIZE);
90016ca4:	e3a0200e 	mov	r2, #14
90016ca8:	e51b100c 	ldr	r1, [fp, #-12]
90016cac:	e51b0008 	ldr	r0, [fp, #-8]
90016cb0:	fa00276f 	blx	90020a74 <strncmp>
90016cb4:	e1a03000 	mov	r3, r0
}
90016cb8:	e1a00003 	mov	r0, r3
90016cbc:	e24bd004 	sub	sp, fp, #4
90016cc0:	e8bd8800 	pop	{fp, pc}

90016cc4 <alloc_trace_meta>:

/// @brief alloc a trace meta to trace resource
static struct TraceMeta* alloc_trace_meta()
{
90016cc4:	e92d4800 	push	{fp, lr}
90016cc8:	e28db004 	add	fp, sp, #4
90016ccc:	e24dd010 	sub	sp, sp, #16
    int index = -1;
90016cd0:	e3e03000 	mvn	r3, #0
90016cd4:	e50b3008 	str	r3, [fp, #-8]

    spinlock_lock(&sys_tracer.trace_meta_bitmap_lock);
90016cd8:	e59f0148 	ldr	r0, [pc, #328]	; 90016e28 <alloc_trace_meta+0x164>
90016cdc:	ebfff428 	bl	90013d84 <spinlock_lock>
    for (uint32_t idx = 0; idx < BITS_TRACEMETA_BITMAP; idx++) {
90016ce0:	e3a03000 	mov	r3, #0
90016ce4:	e50b300c 	str	r3, [fp, #-12]
90016ce8:	ea000030 	b	90016db0 <alloc_trace_meta+0xec>
        if (sys_tracer.trace_meta_bit_map[idx] == 0xFFFFFFFF) {
90016cec:	e30a3880 	movw	r3, #43136	; 0xa880
90016cf0:	e3493019 	movt	r3, #36889	; 0x9019
90016cf4:	e51b200c 	ldr	r2, [fp, #-12]
90016cf8:	e2822010 	add	r2, r2, #16
90016cfc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90016d00:	e3730001 	cmn	r3, #1
90016d04:	0a000025 	beq	90016da0 <alloc_trace_meta+0xdc>
            continue;
        }
        uint32_t position = __builtin_ffs(~sys_tracer.trace_meta_bit_map[idx]) - 1;
90016d08:	e30a3880 	movw	r3, #43136	; 0xa880
90016d0c:	e3493019 	movt	r3, #36889	; 0x9019
90016d10:	e51b200c 	ldr	r2, [fp, #-12]
90016d14:	e2822010 	add	r2, r2, #16
90016d18:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90016d1c:	e1e03003 	mvn	r3, r3
90016d20:	e1a02003 	mov	r2, r3
90016d24:	e6ff3f32 	rbit	r3, r2
90016d28:	e16f3f13 	clz	r3, r3
90016d2c:	e3520000 	cmp	r2, #0
90016d30:	1a000000 	bne	90016d38 <alloc_trace_meta+0x74>
90016d34:	e3e03000 	mvn	r3, #0
90016d38:	e2833001 	add	r3, r3, #1
90016d3c:	e2433001 	sub	r3, r3, #1
90016d40:	e50b3010 	str	r3, [fp, #-16]
        if (position != 31) {
90016d44:	e51b3010 	ldr	r3, [fp, #-16]
90016d48:	e353001f 	cmp	r3, #31
90016d4c:	0a000014 	beq	90016da4 <alloc_trace_meta+0xe0>
            // found a free bit
            sys_tracer.trace_meta_bit_map[idx] |= (1 << (position));
90016d50:	e30a3880 	movw	r3, #43136	; 0xa880
90016d54:	e3493019 	movt	r3, #36889	; 0x9019
90016d58:	e51b200c 	ldr	r2, [fp, #-12]
90016d5c:	e2822010 	add	r2, r2, #16
90016d60:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90016d64:	e3a01001 	mov	r1, #1
90016d68:	e51b2010 	ldr	r2, [fp, #-16]
90016d6c:	e1a02211 	lsl	r2, r1, r2
90016d70:	e1831002 	orr	r1, r3, r2
90016d74:	e30a3880 	movw	r3, #43136	; 0xa880
90016d78:	e3493019 	movt	r3, #36889	; 0x9019
90016d7c:	e51b200c 	ldr	r2, [fp, #-12]
90016d80:	e2822010 	add	r2, r2, #16
90016d84:	e7831102 	str	r1, [r3, r2, lsl #2]
            index = idx * 32 + position;
90016d88:	e51b300c 	ldr	r3, [fp, #-12]
90016d8c:	e1a02283 	lsl	r2, r3, #5
90016d90:	e51b3010 	ldr	r3, [fp, #-16]
90016d94:	e0823003 	add	r3, r2, r3
90016d98:	e50b3008 	str	r3, [fp, #-8]
            break;
90016d9c:	ea000006 	b	90016dbc <alloc_trace_meta+0xf8>
            continue;
90016da0:	e320f000 	nop	{0}
    for (uint32_t idx = 0; idx < BITS_TRACEMETA_BITMAP; idx++) {
90016da4:	e51b300c 	ldr	r3, [fp, #-12]
90016da8:	e2833001 	add	r3, r3, #1
90016dac:	e50b300c 	str	r3, [fp, #-12]
90016db0:	e51b300c 	ldr	r3, [fp, #-12]
90016db4:	e3530003 	cmp	r3, #3
90016db8:	9affffcb 	bls	90016cec <alloc_trace_meta+0x28>
        }
    }
    spinlock_unlock(&sys_tracer.trace_meta_bitmap_lock);
90016dbc:	e59f0064 	ldr	r0, [pc, #100]	; 90016e28 <alloc_trace_meta+0x164>
90016dc0:	ebfff41f 	bl	90013e44 <spinlock_unlock>

    if (index == -1) {
90016dc4:	e51b3008 	ldr	r3, [fp, #-8]
90016dc8:	e3730001 	cmn	r3, #1
90016dcc:	1a000002 	bne	90016ddc <alloc_trace_meta+0x118>
        panic("Tracer no enough TracerMeta.");
90016dd0:	e30105fc 	movw	r0, #5628	; 0x15fc
90016dd4:	e3490002 	movt	r0, #36866	; 0x9002
90016dd8:	ebfff058 	bl	90012f40 <panic>
    }

    sys_tracer.trace_meta_poll[index].index = index;
90016ddc:	e51b3008 	ldr	r3, [fp, #-8]
90016de0:	e6ff2073 	uxth	r2, r3
90016de4:	e30a3880 	movw	r3, #43136	; 0xa880
90016de8:	e3493019 	movt	r3, #36889	; 0x9019
90016dec:	e51b1008 	ldr	r1, [fp, #-8]
90016df0:	e2811004 	add	r1, r1, #4
90016df4:	e1a01281 	lsl	r1, r1, #5
90016df8:	e0833001 	add	r3, r3, r1
90016dfc:	e283300c 	add	r3, r3, #12
90016e00:	e1c320b0 	strh	r2, [r3]
    return &sys_tracer.trace_meta_poll[index];
90016e04:	e51b3008 	ldr	r3, [fp, #-8]
90016e08:	e2833004 	add	r3, r3, #4
90016e0c:	e1a02283 	lsl	r2, r3, #5
90016e10:	e30a3880 	movw	r3, #43136	; 0xa880
90016e14:	e3493019 	movt	r3, #36889	; 0x9019
90016e18:	e0823003 	add	r3, r2, r3
}
90016e1c:	e1a00003 	mov	r0, r3
90016e20:	e24bd004 	sub	sp, fp, #4
90016e24:	e8bd8800 	pop	{fp, pc}
90016e28:	9019a8e0 	.word	0x9019a8e0

90016e2c <dealloc_trace_meta>:

static bool dealloc_trace_meta(struct TraceMeta* meta)
{
90016e2c:	e92d4800 	push	{fp, lr}
90016e30:	e28db004 	add	fp, sp, #4
90016e34:	e24dd018 	sub	sp, sp, #24
90016e38:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    int index = meta->index;
90016e3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90016e40:	e1d330bc 	ldrh	r3, [r3, #12]
90016e44:	e50b3008 	str	r3, [fp, #-8]

    spinlock_lock(&sys_tracer.trace_meta_bitmap_lock);
90016e48:	e59f010c 	ldr	r0, [pc, #268]	; 90016f5c <dealloc_trace_meta+0x130>
90016e4c:	ebfff3cc 	bl	90013d84 <spinlock_lock>
    // clear bitmap
    uint32_t outer_index = index / 32;
90016e50:	e51b3008 	ldr	r3, [fp, #-8]
90016e54:	e283201f 	add	r2, r3, #31
90016e58:	e3530000 	cmp	r3, #0
90016e5c:	b1a03002 	movlt	r3, r2
90016e60:	a1a03003 	movge	r3, r3
90016e64:	e1a032c3 	asr	r3, r3, #5
90016e68:	e50b300c 	str	r3, [fp, #-12]
    uint32_t inner_index = index % 32;
90016e6c:	e51b3008 	ldr	r3, [fp, #-8]
90016e70:	e2732000 	rsbs	r2, r3, #0
90016e74:	e203301f 	and	r3, r3, #31
90016e78:	e202201f 	and	r2, r2, #31
90016e7c:	52623000 	rsbpl	r3, r2, #0
90016e80:	e50b3010 	str	r3, [fp, #-16]
    sys_tracer.trace_meta_bit_map[outer_index] &= (uint32_t)(~(1 << inner_index));
90016e84:	e30a3880 	movw	r3, #43136	; 0xa880
90016e88:	e3493019 	movt	r3, #36889	; 0x9019
90016e8c:	e51b200c 	ldr	r2, [fp, #-12]
90016e90:	e2822010 	add	r2, r2, #16
90016e94:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90016e98:	e3a01001 	mov	r1, #1
90016e9c:	e51b2010 	ldr	r2, [fp, #-16]
90016ea0:	e1a02211 	lsl	r2, r1, r2
90016ea4:	e1e02002 	mvn	r2, r2
90016ea8:	e0031002 	and	r1, r3, r2
90016eac:	e30a3880 	movw	r3, #43136	; 0xa880
90016eb0:	e3493019 	movt	r3, #36889	; 0x9019
90016eb4:	e51b200c 	ldr	r2, [fp, #-12]
90016eb8:	e2822010 	add	r2, r2, #16
90016ebc:	e7831102 	str	r1, [r3, r2, lsl #2]
    // clear meta
    sys_tracer.trace_meta_poll[index].type = TRACER_INVALID;
90016ec0:	e30a2880 	movw	r2, #43136	; 0xa880
90016ec4:	e3492019 	movt	r2, #36889	; 0x9019
90016ec8:	e51b3008 	ldr	r3, [fp, #-8]
90016ecc:	e2833004 	add	r3, r3, #4
90016ed0:	e1a03283 	lsl	r3, r3, #5
90016ed4:	e0823003 	add	r3, r2, r3
90016ed8:	e3a02000 	mov	r2, #0
90016edc:	e5c32004 	strb	r2, [r3, #4]
    spinlock_unlock(&sys_tracer.trace_meta_bitmap_lock);
90016ee0:	e59f0074 	ldr	r0, [pc, #116]	; 90016f5c <dealloc_trace_meta+0x130>
90016ee4:	ebfff3d6 	bl	90013e44 <spinlock_unlock>

    if (index == -1) {
90016ee8:	e51b3008 	ldr	r3, [fp, #-8]
90016eec:	e3730001 	cmn	r3, #1
90016ef0:	1a000002 	bne	90016f00 <dealloc_trace_meta+0xd4>
        panic("Tracer no enough TracerMeta.");
90016ef4:	e30105fc 	movw	r0, #5628	; 0x15fc
90016ef8:	e3490002 	movt	r0, #36866	; 0x9002
90016efc:	ebfff00f 	bl	90012f40 <panic>
    }

    sys_tracer.trace_meta_poll[index].index = index;
90016f00:	e51b3008 	ldr	r3, [fp, #-8]
90016f04:	e6ff2073 	uxth	r2, r3
90016f08:	e30a3880 	movw	r3, #43136	; 0xa880
90016f0c:	e3493019 	movt	r3, #36889	; 0x9019
90016f10:	e51b1008 	ldr	r1, [fp, #-8]
90016f14:	e2811004 	add	r1, r1, #4
90016f18:	e1a01281 	lsl	r1, r1, #5
90016f1c:	e0833001 	add	r3, r3, r1
90016f20:	e283300c 	add	r3, r3, #12
90016f24:	e1c320b0 	strh	r2, [r3]
    return &sys_tracer.trace_meta_poll[index];
90016f28:	e51b3008 	ldr	r3, [fp, #-8]
90016f2c:	e2833004 	add	r3, r3, #4
90016f30:	e1a02283 	lsl	r2, r3, #5
90016f34:	e30a3880 	movw	r3, #43136	; 0xa880
90016f38:	e3493019 	movt	r3, #36889	; 0x9019
90016f3c:	e0823003 	add	r3, r2, r3
90016f40:	e3530000 	cmp	r3, #0
90016f44:	13a03001 	movne	r3, #1
90016f48:	03a03000 	moveq	r3, #0
90016f4c:	e6ef3073 	uxtb	r3, r3
}
90016f50:	e1a00003 	mov	r0, r3
90016f54:	e24bd004 	sub	sp, fp, #4
90016f58:	e8bd8800 	pop	{fp, pc}
90016f5c:	9019a8e0 	.word	0x9019a8e0

90016f60 <trace_meta_map_mem_chunk>:

static tracer_mem_chunk_idx_t trace_meta_map_mem_chunk(struct TraceMeta* const p_trace_meta, tracer_mem_chunk_idx_t mem_chunk_num)
{
90016f60:	e92d4810 	push	{r4, fp, lr}
90016f64:	e28db008 	add	fp, sp, #8
90016f68:	e24dd01c 	sub	sp, sp, #28
90016f6c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90016f70:	e1a03001 	mov	r3, r1
90016f74:	e14b32b2 	strh	r3, [fp, #-34]	; 0xffffffde
    tracer_mem_chunk_idx_t addr;
    /* direct mapping */
    if (mem_chunk_num < TRACEMETA_NR_DIRECT) {
90016f78:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
90016f7c:	e3530004 	cmp	r3, #4
90016f80:	8a000015 	bhi	90016fdc <trace_meta_map_mem_chunk+0x7c>
        if ((addr = p_trace_meta->addr[mem_chunk_num]) == 0) {
90016f84:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
90016f88:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90016f8c:	e1a03083 	lsl	r3, r3, #1
90016f90:	e0823003 	add	r3, r2, r3
90016f94:	e283300e 	add	r3, r3, #14
90016f98:	e1d330b0 	ldrh	r3, [r3]
90016f9c:	e14b30be 	strh	r3, [fp, #-14]
90016fa0:	e15b30be 	ldrh	r3, [fp, #-14]
90016fa4:	e3530000 	cmp	r3, #0
90016fa8:	1a000009 	bne	90016fd4 <trace_meta_map_mem_chunk+0x74>
            p_trace_meta->addr[mem_chunk_num] = addr = tracer_mem_chunk_alloc();
90016fac:	e15b42b2 	ldrh	r4, [fp, #-34]	; 0xffffffde
90016fb0:	eb000667 	bl	90018954 <tracer_mem_chunk_alloc>
90016fb4:	e1a03000 	mov	r3, r0
90016fb8:	e14b30be 	strh	r3, [fp, #-14]
90016fbc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90016fc0:	e1a03084 	lsl	r3, r4, #1
90016fc4:	e0823003 	add	r3, r2, r3
90016fc8:	e283300e 	add	r3, r3, #14
90016fcc:	e15b20be 	ldrh	r2, [fp, #-14]
90016fd0:	e1c320b0 	strh	r2, [r3]
        }
        return addr;
90016fd4:	e15b30be 	ldrh	r3, [fp, #-14]
90016fd8:	ea000048 	b	90017100 <trace_meta_map_mem_chunk+0x1a0>
    }

    /* indirect mapping */
    mem_chunk_num -= TRACEMETA_NR_DIRECT;
90016fdc:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
90016fe0:	e2433005 	sub	r3, r3, #5
90016fe4:	e14b32b2 	strh	r3, [fp, #-34]	; 0xffffffde
    int indirect_mem_chunk_id = mem_chunk_num / NR_ADDR_PER_MEM_CHUNK;
90016fe8:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
90016fec:	e1a03323 	lsr	r3, r3, #6
90016ff0:	e6ff3073 	uxth	r3, r3
90016ff4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (indirect_mem_chunk_id < TRACEMETA_NR_INDIRECT) {
90016ff8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90016ffc:	e3530003 	cmp	r3, #3
90017000:	ca00001d 	bgt	9001707c <trace_meta_map_mem_chunk+0x11c>
        if ((addr = p_trace_meta->addr[TRACEMETA_NR_DIRECT + indirect_mem_chunk_id]) == 0) {
90017004:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017008:	e2833005 	add	r3, r3, #5
9001700c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90017010:	e1a03083 	lsl	r3, r3, #1
90017014:	e0823003 	add	r3, r2, r3
90017018:	e283300e 	add	r3, r3, #14
9001701c:	e1d330b0 	ldrh	r3, [r3]
90017020:	e14b30be 	strh	r3, [fp, #-14]
90017024:	e15b30be 	ldrh	r3, [fp, #-14]
90017028:	e3530000 	cmp	r3, #0
9001702c:	1a00000a 	bne	9001705c <trace_meta_map_mem_chunk+0xfc>
            p_trace_meta->addr[TRACEMETA_NR_DIRECT + indirect_mem_chunk_id] = addr = tracer_mem_chunk_alloc();
90017030:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017034:	e2834005 	add	r4, r3, #5
90017038:	eb000645 	bl	90018954 <tracer_mem_chunk_alloc>
9001703c:	e1a03000 	mov	r3, r0
90017040:	e14b30be 	strh	r3, [fp, #-14]
90017044:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90017048:	e1a03084 	lsl	r3, r4, #1
9001704c:	e0823003 	add	r3, r2, r3
90017050:	e283300e 	add	r3, r3, #14
90017054:	e15b20be 	ldrh	r2, [fp, #-14]
90017058:	e1c320b0 	strh	r2, [r3]
        }
        mem_chunk_num -= indirect_mem_chunk_id * NR_ADDR_PER_MEM_CHUNK;
9001705c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017060:	e1a03283 	lsl	r3, r3, #5
90017064:	e1a030a3 	lsr	r3, r3, #1
90017068:	e6ff3073 	uxth	r3, r3
9001706c:	e15b22b2 	ldrh	r2, [fp, #-34]	; 0xffffffde
90017070:	e0423003 	sub	r3, r2, r3
90017074:	e14b32b2 	strh	r3, [fp, #-34]	; 0xffffffde
90017078:	ea000002 	b	90017088 <trace_meta_map_mem_chunk+0x128>
    } else {
        panic("tracer inode, bmap out of range");
9001707c:	e301061c 	movw	r0, #5660	; 0x161c
90017080:	e3490002 	movt	r0, #36866	; 0x9002
90017084:	ebffefad 	bl	90012f40 <panic>
        // no return
    }

    // index mem_chunk
    struct tracer_mem_chunk* tracer_mem_chunk = tracer_mem_chunk_read(addr);
90017088:	e15b30be 	ldrh	r3, [fp, #-14]
9001708c:	e1a00003 	mov	r0, r3
90017090:	eb00054f 	bl	900185d4 <tracer_mem_chunk_read>
90017094:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    tracer_mem_chunk_idx_t* indirect_list = (tracer_mem_chunk_idx_t*)tracer_mem_chunk->data;
90017098:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001709c:	e5933010 	ldr	r3, [r3, #16]
900170a0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4

    if ((addr = indirect_list[mem_chunk_num]) == 0) {
900170a4:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
900170a8:	e1a03083 	lsl	r3, r3, #1
900170ac:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
900170b0:	e0823003 	add	r3, r2, r3
900170b4:	e1d330b0 	ldrh	r3, [r3]
900170b8:	e14b30be 	strh	r3, [fp, #-14]
900170bc:	e15b30be 	ldrh	r3, [fp, #-14]
900170c0:	e3530000 	cmp	r3, #0
900170c4:	1a00000a 	bne	900170f4 <trace_meta_map_mem_chunk+0x194>
        indirect_list[mem_chunk_num] = addr = tracer_mem_chunk_alloc();
900170c8:	e15b32b2 	ldrh	r3, [fp, #-34]	; 0xffffffde
900170cc:	e1a03083 	lsl	r3, r3, #1
900170d0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
900170d4:	e0824003 	add	r4, r2, r3
900170d8:	eb00061d 	bl	90018954 <tracer_mem_chunk_alloc>
900170dc:	e1a03000 	mov	r3, r0
900170e0:	e14b30be 	strh	r3, [fp, #-14]
900170e4:	e15b30be 	ldrh	r3, [fp, #-14]
900170e8:	e1c430b0 	strh	r3, [r4]
        tracer_mem_chunk_write(tracer_mem_chunk);
900170ec:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
900170f0:	eb00054f 	bl	90018634 <tracer_mem_chunk_write>
    }

    tracer_mem_chunk_release(tracer_mem_chunk);
900170f4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
900170f8:	eb00055e 	bl	90018678 <tracer_mem_chunk_release>
    return addr;
900170fc:	e15b30be 	ldrh	r3, [fp, #-14]
}
90017100:	e1a00003 	mov	r0, r3
90017104:	e24bd008 	sub	sp, fp, #8
90017108:	e8bd8810 	pop	{r4, fp, pc}

9001710c <trace_write_info>:

/// @brief write trace info by trace meta
static int trace_write_info(struct TraceMeta* const p_trace_meta, char* src, uint32_t off, uint32_t n)
{
9001710c:	e92d4800 	push	{fp, lr}
90017110:	e28db004 	add	fp, sp, #4
90017114:	e24dd020 	sub	sp, sp, #32
90017118:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
9001711c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
90017120:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
90017124:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (p_trace_meta->type == TRACER_INVALID) {
90017128:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001712c:	e5d33004 	ldrb	r3, [r3, #4]
90017130:	e3530000 	cmp	r3, #0
90017134:	1a000001 	bne	90017140 <trace_write_info+0x34>
        return -1;
90017138:	e3e03000 	mvn	r3, #0
9001713c:	ea00006e 	b	900172fc <trace_write_info+0x1f0>
    }

    // fast path
    if (off == 0 && n <= sizeof(uintptr_t)) {
90017140:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017144:	e3530000 	cmp	r3, #0
90017148:	1a000008 	bne	90017170 <trace_write_info+0x64>
9001714c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90017150:	e3530004 	cmp	r3, #4
90017154:	8a000005 	bhi	90017170 <trace_write_info+0x64>
        p_trace_meta->reserved = *(uintptr_t*)src;
90017158:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001715c:	e5932000 	ldr	r2, [r3]
90017160:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017164:	e5832008 	str	r2, [r3, #8]
        return n;
90017168:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001716c:	ea000062 	b	900172fc <trace_write_info+0x1f0>
    }

    if (UNLIKELY(off > p_trace_meta->size || off + n > VFS_FILE_MAXSIZE * TRACER_MEM_CHUNK_SIZE || off + n < off)) {
90017170:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017174:	e5932000 	ldr	r2, [r3]
90017178:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001717c:	e1520003 	cmp	r2, r3
90017180:	33a03001 	movcc	r3, #1
90017184:	23a03000 	movcs	r3, #0
90017188:	e6ef3073 	uxtb	r3, r3
9001718c:	e3530000 	cmp	r3, #0
90017190:	1a000008 	bne	900171b8 <trace_write_info+0xac>
90017194:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90017198:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001719c:	e0823003 	add	r3, r2, r3
900171a0:	e3530e8a 	cmp	r3, #2208	; 0x8a0
900171a4:	83a03001 	movhi	r3, #1
900171a8:	93a03000 	movls	r3, #0
900171ac:	e6ef3073 	uxtb	r3, r3
900171b0:	e3530000 	cmp	r3, #0
900171b4:	0a000001 	beq	900171c0 <trace_write_info+0xb4>
900171b8:	e3a03001 	mov	r3, #1
900171bc:	ea000000 	b	900171c4 <trace_write_info+0xb8>
900171c0:	e3a03000 	mov	r3, #0
900171c4:	e3530000 	cmp	r3, #0
900171c8:	1a000009 	bne	900171f4 <trace_write_info+0xe8>
900171cc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900171d0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900171d4:	e0822003 	add	r2, r2, r3
900171d8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900171dc:	e1520003 	cmp	r2, r3
900171e0:	33a03001 	movcc	r3, #1
900171e4:	23a03000 	movcs	r3, #0
900171e8:	e6ef3073 	uxtb	r3, r3
900171ec:	e3530000 	cmp	r3, #0
900171f0:	0a000001 	beq	900171fc <trace_write_info+0xf0>
        return -1;
900171f4:	e3e03000 	mvn	r3, #0
900171f8:	ea00003f 	b	900172fc <trace_write_info+0x1f0>
    }

    struct tracer_mem_chunk* tracer_mem_chunk;
    uint32_t m;
    for (uint32_t tot = 0; tot < n; tot += m, off += m, src += m) {
900171fc:	e3a03000 	mov	r3, #0
90017200:	e50b3008 	str	r3, [fp, #-8]
90017204:	ea00002c 	b	900172bc <trace_write_info+0x1b0>
        tracer_mem_chunk = tracer_mem_chunk_read(trace_meta_map_mem_chunk(p_trace_meta, off / TRACER_MEM_CHUNK_SIZE));
90017208:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001720c:	e1a032a3 	lsr	r3, r3, #5
90017210:	e6ff3073 	uxth	r3, r3
90017214:	e1a01003 	mov	r1, r3
90017218:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001721c:	ebffff4f 	bl	90016f60 <trace_meta_map_mem_chunk>
90017220:	e1a03000 	mov	r3, r0
90017224:	e1a00003 	mov	r0, r3
90017228:	eb0004e9 	bl	900185d4 <tracer_mem_chunk_read>
9001722c:	e50b000c 	str	r0, [fp, #-12]
        m = min(n - tot, TRACER_MEM_CHUNK_SIZE - off % TRACER_MEM_CHUNK_SIZE);
90017230:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017234:	e203301f 	and	r3, r3, #31
90017238:	e2632020 	rsb	r2, r3, #32
9001723c:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
90017240:	e51b3008 	ldr	r3, [fp, #-8]
90017244:	e0413003 	sub	r3, r1, r3
90017248:	e1520003 	cmp	r2, r3
9001724c:	31a03002 	movcc	r3, r2
90017250:	21a03003 	movcs	r3, r3
90017254:	e50b3010 	str	r3, [fp, #-16]
        memmove(tracer_mem_chunk->data + off % TRACER_MEM_CHUNK_SIZE, src, m);
90017258:	e51b300c 	ldr	r3, [fp, #-12]
9001725c:	e5932010 	ldr	r2, [r3, #16]
90017260:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017264:	e203301f 	and	r3, r3, #31
90017268:	e0823003 	add	r3, r2, r3
9001726c:	e51b2010 	ldr	r2, [fp, #-16]
90017270:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
90017274:	e1a00003 	mov	r0, r3
90017278:	fa002588 	blx	900208a0 <memmove>
        tracer_mem_chunk_write(tracer_mem_chunk);
9001727c:	e51b000c 	ldr	r0, [fp, #-12]
90017280:	eb0004eb 	bl	90018634 <tracer_mem_chunk_write>
        tracer_mem_chunk_release(tracer_mem_chunk);
90017284:	e51b000c 	ldr	r0, [fp, #-12]
90017288:	eb0004fa 	bl	90018678 <tracer_mem_chunk_release>
    for (uint32_t tot = 0; tot < n; tot += m, off += m, src += m) {
9001728c:	e51b2008 	ldr	r2, [fp, #-8]
90017290:	e51b3010 	ldr	r3, [fp, #-16]
90017294:	e0823003 	add	r3, r2, r3
90017298:	e50b3008 	str	r3, [fp, #-8]
9001729c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900172a0:	e51b3010 	ldr	r3, [fp, #-16]
900172a4:	e0823003 	add	r3, r2, r3
900172a8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
900172ac:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
900172b0:	e51b3010 	ldr	r3, [fp, #-16]
900172b4:	e0823003 	add	r3, r2, r3
900172b8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
900172bc:	e51b2008 	ldr	r2, [fp, #-8]
900172c0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900172c4:	e1520003 	cmp	r2, r3
900172c8:	3affffce 	bcc	90017208 <trace_write_info+0xfc>
    }

    if (n > 0 && off > p_trace_meta->size) {
900172cc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900172d0:	e3530000 	cmp	r3, #0
900172d4:	0a000007 	beq	900172f8 <trace_write_info+0x1ec>
900172d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900172dc:	e5932000 	ldr	r2, [r3]
900172e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900172e4:	e1520003 	cmp	r2, r3
900172e8:	2a000002 	bcs	900172f8 <trace_write_info+0x1ec>
        p_trace_meta->size = off;
900172ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900172f0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900172f4:	e5832000 	str	r2, [r3]
    }

    return n;
900172f8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
}
900172fc:	e1a00003 	mov	r0, r3
90017300:	e24bd004 	sub	sp, fp, #4
90017304:	e8bd8800 	pop	{fp, pc}

90017308 <trace_read_info>:

/// @brief read trace info by trace meta
static int trace_read_info(struct TraceMeta* const p_trace_meta, char* dst, uint32_t off, uint32_t n)
{
90017308:	e92d4800 	push	{fp, lr}
9001730c:	e28db004 	add	fp, sp, #4
90017310:	e24dd018 	sub	sp, sp, #24
90017314:	e50b0010 	str	r0, [fp, #-16]
90017318:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001731c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
90017320:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if (p_trace_meta->type == TRACER_INVALID) {
90017324:	e51b3010 	ldr	r3, [fp, #-16]
90017328:	e5d33004 	ldrb	r3, [r3, #4]
9001732c:	e3530000 	cmp	r3, #0
90017330:	1a000001 	bne	9001733c <trace_read_info+0x34>
        return -1;
90017334:	e3e03000 	mvn	r3, #0
90017338:	ea00006b 	b	900174ec <trace_read_info+0x1e4>
    }

    if (off == 0 && n <= sizeof(uintptr_t)) {
9001733c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017340:	e3530000 	cmp	r3, #0
90017344:	1a000008 	bne	9001736c <trace_read_info+0x64>
90017348:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001734c:	e3530004 	cmp	r3, #4
90017350:	8a000005 	bhi	9001736c <trace_read_info+0x64>
        *(uintptr_t*)dst = p_trace_meta->reserved;
90017354:	e51b3010 	ldr	r3, [fp, #-16]
90017358:	e5932008 	ldr	r2, [r3, #8]
9001735c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017360:	e5832000 	str	r2, [r3]
        return n;
90017364:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90017368:	ea00005f 	b	900174ec <trace_read_info+0x1e4>
    }

    if (UNLIKELY(off > p_trace_meta->size || off + n < off)) {
9001736c:	e51b3010 	ldr	r3, [fp, #-16]
90017370:	e5932000 	ldr	r2, [r3]
90017374:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017378:	e1520003 	cmp	r2, r3
9001737c:	33a03001 	movcc	r3, #1
90017380:	23a03000 	movcs	r3, #0
90017384:	e6ef3073 	uxtb	r3, r3
90017388:	e3530000 	cmp	r3, #0
9001738c:	1a000009 	bne	900173b8 <trace_read_info+0xb0>
90017390:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90017394:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90017398:	e0822003 	add	r2, r2, r3
9001739c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900173a0:	e1520003 	cmp	r2, r3
900173a4:	33a03001 	movcc	r3, #1
900173a8:	23a03000 	movcs	r3, #0
900173ac:	e6ef3073 	uxtb	r3, r3
900173b0:	e3530000 	cmp	r3, #0
900173b4:	0a000001 	beq	900173c0 <trace_read_info+0xb8>
        return -1;
900173b8:	e3e03000 	mvn	r3, #0
900173bc:	ea00004a 	b	900174ec <trace_read_info+0x1e4>
    }
    if (UNLIKELY(off + n > p_trace_meta->size)) {
900173c0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900173c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900173c8:	e0822003 	add	r2, r2, r3
900173cc:	e51b3010 	ldr	r3, [fp, #-16]
900173d0:	e5933000 	ldr	r3, [r3]
900173d4:	e1520003 	cmp	r2, r3
900173d8:	83a03001 	movhi	r3, #1
900173dc:	93a03000 	movls	r3, #0
900173e0:	e6ef3073 	uxtb	r3, r3
900173e4:	e3530000 	cmp	r3, #0
900173e8:	0a000004 	beq	90017400 <trace_read_info+0xf8>
        n = p_trace_meta->size - off;
900173ec:	e51b3010 	ldr	r3, [fp, #-16]
900173f0:	e5932000 	ldr	r2, [r3]
900173f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900173f8:	e0423003 	sub	r3, r2, r3
900173fc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    }

    static struct tracer_mem_chunk* tracer_mem_chunk;
    uint32_t m;
    for (uint32_t tot = 0; tot < n; tot += m, off += m, dst += m) {
90017400:	e3a03000 	mov	r3, #0
90017404:	e50b3008 	str	r3, [fp, #-8]
90017408:	ea000032 	b	900174d8 <trace_read_info+0x1d0>
        tracer_mem_chunk = tracer_mem_chunk_read(trace_meta_map_mem_chunk(p_trace_meta, off / TRACER_MEM_CHUNK_SIZE));
9001740c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017410:	e1a032a3 	lsr	r3, r3, #5
90017414:	e6ff3073 	uxth	r3, r3
90017418:	e1a01003 	mov	r1, r3
9001741c:	e51b0010 	ldr	r0, [fp, #-16]
90017420:	ebfffece 	bl	90016f60 <trace_meta_map_mem_chunk>
90017424:	e1a03000 	mov	r3, r0
90017428:	e1a00003 	mov	r0, r3
9001742c:	eb000468 	bl	900185d4 <tracer_mem_chunk_read>
90017430:	e1a02000 	mov	r2, r0
90017434:	e30a3878 	movw	r3, #43128	; 0xa878
90017438:	e3493019 	movt	r3, #36889	; 0x9019
9001743c:	e5832000 	str	r2, [r3]
        m = min(n - tot, TRACER_MEM_CHUNK_SIZE - off % TRACER_MEM_CHUNK_SIZE);
90017440:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017444:	e203301f 	and	r3, r3, #31
90017448:	e2632020 	rsb	r2, r3, #32
9001744c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
90017450:	e51b3008 	ldr	r3, [fp, #-8]
90017454:	e0413003 	sub	r3, r1, r3
90017458:	e1520003 	cmp	r2, r3
9001745c:	31a03002 	movcc	r3, r2
90017460:	21a03003 	movcs	r3, r3
90017464:	e50b300c 	str	r3, [fp, #-12]
        memmove(dst, tracer_mem_chunk->data + off % TRACER_MEM_CHUNK_SIZE, m);
90017468:	e30a3878 	movw	r3, #43128	; 0xa878
9001746c:	e3493019 	movt	r3, #36889	; 0x9019
90017470:	e5933000 	ldr	r3, [r3]
90017474:	e5932010 	ldr	r2, [r3, #16]
90017478:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001747c:	e203301f 	and	r3, r3, #31
90017480:	e0823003 	add	r3, r2, r3
90017484:	e51b200c 	ldr	r2, [fp, #-12]
90017488:	e1a01003 	mov	r1, r3
9001748c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90017490:	fa002502 	blx	900208a0 <memmove>
        tracer_mem_chunk_release(tracer_mem_chunk);
90017494:	e30a3878 	movw	r3, #43128	; 0xa878
90017498:	e3493019 	movt	r3, #36889	; 0x9019
9001749c:	e5933000 	ldr	r3, [r3]
900174a0:	e1a00003 	mov	r0, r3
900174a4:	eb000473 	bl	90018678 <tracer_mem_chunk_release>
    for (uint32_t tot = 0; tot < n; tot += m, off += m, dst += m) {
900174a8:	e51b2008 	ldr	r2, [fp, #-8]
900174ac:	e51b300c 	ldr	r3, [fp, #-12]
900174b0:	e0823003 	add	r3, r2, r3
900174b4:	e50b3008 	str	r3, [fp, #-8]
900174b8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
900174bc:	e51b300c 	ldr	r3, [fp, #-12]
900174c0:	e0823003 	add	r3, r2, r3
900174c4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
900174c8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
900174cc:	e51b300c 	ldr	r3, [fp, #-12]
900174d0:	e0823003 	add	r3, r2, r3
900174d4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
900174d8:	e51b2008 	ldr	r2, [fp, #-8]
900174dc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900174e0:	e1520003 	cmp	r2, r3
900174e4:	3affffc8 	bcc	9001740c <trace_read_info+0x104>
    }

    return n;
900174e8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
900174ec:	e1a00003 	mov	r0, r3
900174f0:	e24bd004 	sub	sp, fp, #4
900174f4:	e8bd8800 	pop	{fp, pc}

900174f8 <tracer_find_meta_onestep>:

static struct TraceMeta* tracer_find_meta_onestep(struct TraceMeta* const p_owner, char* name, uint32_t* poff)
{
900174f8:	e92d4800 	push	{fp, lr}
900174fc:	e28db004 	add	fp, sp, #4
90017500:	e24dd028 	sub	sp, sp, #40	; 0x28
90017504:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90017508:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001750c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    struct TraceResourceEntry resource_entry;

    if (p_owner->type != TRACER_OWNER) {
90017510:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017514:	e5d33004 	ldrb	r3, [r3, #4]
90017518:	e3530001 	cmp	r3, #1
9001751c:	0a00000d 	beq	90017558 <tracer_find_meta_onestep+0x60>
        ERROR("tracer_find_meta_onestep, not a dir, index: %d\n", p_owner->index);
90017520:	e3a020d7 	mov	r2, #215	; 0xd7
90017524:	e301191c 	movw	r1, #6428	; 0x191c
90017528:	e3491002 	movt	r1, #36866	; 0x9002
9001752c:	e301063c 	movw	r0, #5692	; 0x163c
90017530:	e3490002 	movt	r0, #36866	; 0x9002
90017534:	ebfff78f 	bl	90015378 <KPrintf>
90017538:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001753c:	e1d330bc 	ldrh	r3, [r3, #12]
90017540:	e1a01003 	mov	r1, r3
90017544:	e301064c 	movw	r0, #5708	; 0x164c
90017548:	e3490002 	movt	r0, #36866	; 0x9002
9001754c:	ebfff789 	bl	90015378 <KPrintf>
        return NULL;
90017550:	e3a03000 	mov	r3, #0
90017554:	ea000042 	b	90017664 <tracer_find_meta_onestep+0x16c>
    }

    for (uint32_t off = 0; off < p_owner->size; off += sizeof(resource_entry)) {
90017558:	e3a03000 	mov	r3, #0
9001755c:	e50b3008 	str	r3, [fp, #-8]
90017560:	ea000039 	b	9001764c <tracer_find_meta_onestep+0x154>
        if (trace_read_info(p_owner, (char*)&resource_entry, off, sizeof(resource_entry)) != sizeof(resource_entry)) {
90017564:	e24b101c 	sub	r1, fp, #28
90017568:	e3a03010 	mov	r3, #16
9001756c:	e51b2008 	ldr	r2, [fp, #-8]
90017570:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90017574:	ebffff63 	bl	90017308 <trace_read_info>
90017578:	e1a03000 	mov	r3, r0
9001757c:	e3530010 	cmp	r3, #16
90017580:	0a000002 	beq	90017590 <tracer_find_meta_onestep+0x98>
            panic("tracer_find_meta_onestep: read trace owner's resources failed\n");
90017584:	e301067c 	movw	r0, #5756	; 0x167c
90017588:	e3490002 	movt	r0, #36866	; 0x9002
9001758c:	ebffee6b 	bl	90012f40 <panic>
        }

        if (resource_entry.index == 0) {
90017590:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
90017594:	e3530000 	cmp	r3, #0
90017598:	0a000027 	beq	9001763c <tracer_find_meta_onestep+0x144>
            continue;
        }

        if (namecmp(name, resource_entry.name) == 0) {
9001759c:	e24b301c 	sub	r3, fp, #28
900175a0:	e2833002 	add	r3, r3, #2
900175a4:	e1a01003 	mov	r1, r3
900175a8:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
900175ac:	ebfffdb7 	bl	90016c90 <namecmp>
900175b0:	e1a03000 	mov	r3, r0
900175b4:	e3530000 	cmp	r3, #0
900175b8:	1a000020 	bne	90017640 <tracer_find_meta_onestep+0x148>
            if (poff) {
900175bc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
900175c0:	e3530000 	cmp	r3, #0
900175c4:	0a000002 	beq	900175d4 <tracer_find_meta_onestep+0xdc>
                *poff = off;
900175c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
900175cc:	e51b2008 	ldr	r2, [fp, #-8]
900175d0:	e5832000 	str	r2, [r3]
            }
            uint32_t vindex = resource_entry.index;
900175d4:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
900175d8:	e50b300c 	str	r3, [fp, #-12]
            assert(vindex >= 0 && vindex < NR_MAX_TRACEMETA);
900175dc:	e51b300c 	ldr	r3, [fp, #-12]
900175e0:	e353007f 	cmp	r3, #127	; 0x7f
900175e4:	9a00000d 	bls	90017620 <tracer_find_meta_onestep+0x128>
900175e8:	e3a020e9 	mov	r2, #233	; 0xe9
900175ec:	e301191c 	movw	r1, #6428	; 0x191c
900175f0:	e3491002 	movt	r1, #36866	; 0x9002
900175f4:	e301063c 	movw	r0, #5692	; 0x163c
900175f8:	e3490002 	movt	r0, #36866	; 0x9002
900175fc:	ebfff75d 	bl	90015378 <KPrintf>
90017600:	e30116bc 	movw	r1, #5820	; 0x16bc
90017604:	e3491002 	movt	r1, #36866	; 0x9002
90017608:	e30106e8 	movw	r0, #5864	; 0x16e8
9001760c:	e3490002 	movt	r0, #36866	; 0x9002
90017610:	ebfff758 	bl	90015378 <KPrintf>
90017614:	e30106f8 	movw	r0, #5880	; 0x16f8
90017618:	e3490002 	movt	r0, #36866	; 0x9002
9001761c:	ebffee47 	bl	90012f40 <panic>
            return &sys_tracer.trace_meta_poll[vindex];
90017620:	e51b300c 	ldr	r3, [fp, #-12]
90017624:	e2833004 	add	r3, r3, #4
90017628:	e1a02283 	lsl	r2, r3, #5
9001762c:	e30a3880 	movw	r3, #43136	; 0xa880
90017630:	e3493019 	movt	r3, #36889	; 0x9019
90017634:	e0823003 	add	r3, r2, r3
90017638:	ea000009 	b	90017664 <tracer_find_meta_onestep+0x16c>
            continue;
9001763c:	e320f000 	nop	{0}
    for (uint32_t off = 0; off < p_owner->size; off += sizeof(resource_entry)) {
90017640:	e51b3008 	ldr	r3, [fp, #-8]
90017644:	e2833010 	add	r3, r3, #16
90017648:	e50b3008 	str	r3, [fp, #-8]
9001764c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017650:	e5932000 	ldr	r2, [r3]
90017654:	e51b3008 	ldr	r3, [fp, #-8]
90017658:	e1520003 	cmp	r2, r3
9001765c:	8affffc0 	bhi	90017564 <tracer_find_meta_onestep+0x6c>
        }
    }

    return NULL;
90017660:	e3a03000 	mov	r3, #0
}
90017664:	e1a00003 	mov	r0, r3
90017668:	e24bd004 	sub	sp, fp, #4
9001766c:	e8bd8800 	pop	{fp, pc}

90017670 <tracer_append_meta>:

// Write a new vdirectory entry (name, index) into the vdirectory dp.
static int tracer_append_meta(struct TraceMeta* p_owner, char* name, uint32_t index)
{
90017670:	e92d4800 	push	{fp, lr}
90017674:	e28db004 	add	fp, sp, #4
90017678:	e24dd028 	sub	sp, sp, #40	; 0x28
9001767c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90017680:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
90017684:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    struct TraceResourceEntry resource_entry;

    int offset = 0;
90017688:	e3a03000 	mov	r3, #0
9001768c:	e50b3008 	str	r3, [fp, #-8]
    for (offset = 0; offset < p_owner->size; offset += sizeof(resource_entry)) {
90017690:	e3a03000 	mov	r3, #0
90017694:	e50b3008 	str	r3, [fp, #-8]
90017698:	ea000018 	b	90017700 <tracer_append_meta+0x90>
        if (trace_read_info(p_owner, (char*)&resource_entry, offset, sizeof(resource_entry)) != sizeof(resource_entry)) {
9001769c:	e51b2008 	ldr	r2, [fp, #-8]
900176a0:	e24b1018 	sub	r1, fp, #24
900176a4:	e3a03010 	mov	r3, #16
900176a8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
900176ac:	ebffff15 	bl	90017308 <trace_read_info>
900176b0:	e1a03000 	mov	r3, r0
900176b4:	e3530010 	cmp	r3, #16
900176b8:	0a00000a 	beq	900176e8 <tracer_append_meta+0x78>
            ERROR("tracer_append_meta failed, read owner's resources failed.\n");
900176bc:	e3a020f9 	mov	r2, #249	; 0xf9
900176c0:	e3011938 	movw	r1, #6456	; 0x1938
900176c4:	e3491002 	movt	r1, #36866	; 0x9002
900176c8:	e301063c 	movw	r0, #5692	; 0x163c
900176cc:	e3490002 	movt	r0, #36866	; 0x9002
900176d0:	ebfff728 	bl	90015378 <KPrintf>
900176d4:	e30106fc 	movw	r0, #5884	; 0x16fc
900176d8:	e3490002 	movt	r0, #36866	; 0x9002
900176dc:	ebfff725 	bl	90015378 <KPrintf>
            return -1;
900176e0:	e3e03000 	mvn	r3, #0
900176e4:	ea000029 	b	90017790 <tracer_append_meta+0x120>
        }
        if (resource_entry.index == 0) {
900176e8:	e15b31b8 	ldrh	r3, [fp, #-24]	; 0xffffffe8
900176ec:	e3530000 	cmp	r3, #0
900176f0:	0a000008 	beq	90017718 <tracer_append_meta+0xa8>
    for (offset = 0; offset < p_owner->size; offset += sizeof(resource_entry)) {
900176f4:	e51b3008 	ldr	r3, [fp, #-8]
900176f8:	e2833010 	add	r3, r3, #16
900176fc:	e50b3008 	str	r3, [fp, #-8]
90017700:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017704:	e5932000 	ldr	r2, [r3]
90017708:	e51b3008 	ldr	r3, [fp, #-8]
9001770c:	e1520003 	cmp	r2, r3
90017710:	8affffe1 	bhi	9001769c <tracer_append_meta+0x2c>
90017714:	ea000000 	b	9001771c <tracer_append_meta+0xac>
            break;
90017718:	e320f000 	nop	{0}
        }
    }

    strncpy(resource_entry.name, name, RESOURCE_NAME_SIZE);
9001771c:	e24b3018 	sub	r3, fp, #24
90017720:	e2833002 	add	r3, r3, #2
90017724:	e3a0200e 	mov	r2, #14
90017728:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001772c:	e1a00003 	mov	r0, r3
90017730:	fa0024f6 	blx	90020b10 <strncpy>
    resource_entry.index = index;
90017734:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90017738:	e6ff3073 	uxth	r3, r3
9001773c:	e14b31b8 	strh	r3, [fp, #-24]	; 0xffffffe8
    if (trace_write_info(p_owner, (char*)&resource_entry, offset, sizeof(resource_entry)) != sizeof(resource_entry)) {
90017740:	e51b2008 	ldr	r2, [fp, #-8]
90017744:	e24b1018 	sub	r1, fp, #24
90017748:	e3a03010 	mov	r3, #16
9001774c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90017750:	ebfffe6d 	bl	9001710c <trace_write_info>
90017754:	e1a03000 	mov	r3, r0
90017758:	e3530010 	cmp	r3, #16
9001775c:	0a00000a 	beq	9001778c <tracer_append_meta+0x11c>
        ERROR("tracer_append_meta failed, append resource to owner failed.\n");
90017760:	e3a02f41 	mov	r2, #260	; 0x104
90017764:	e3011938 	movw	r1, #6456	; 0x1938
90017768:	e3491002 	movt	r1, #36866	; 0x9002
9001776c:	e301063c 	movw	r0, #5692	; 0x163c
90017770:	e3490002 	movt	r0, #36866	; 0x9002
90017774:	ebfff6ff 	bl	90015378 <KPrintf>
90017778:	e3010738 	movw	r0, #5944	; 0x1738
9001777c:	e3490002 	movt	r0, #36866	; 0x9002
90017780:	ebfff6fc 	bl	90015378 <KPrintf>
        return -1;
90017784:	e3e03000 	mvn	r3, #0
90017788:	ea000000 	b	90017790 <tracer_append_meta+0x120>
    }

    return 0;
9001778c:	e3a03000 	mov	r3, #0
}
90017790:	e1a00003 	mov	r0, r3
90017794:	e24bd004 	sub	sp, fp, #4
90017798:	e8bd8800 	pop	{fp, pc}

9001779c <tracer_new_meta>:

static struct TraceMeta* tracer_new_meta(struct TraceMeta* p_owner, char* name, short type)
{
9001779c:	e92d4800 	push	{fp, lr}
900177a0:	e28db004 	add	fp, sp, #4
900177a4:	e24dd018 	sub	sp, sp, #24
900177a8:	e50b0010 	str	r0, [fp, #-16]
900177ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
900177b0:	e1a03002 	mov	r3, r2
900177b4:	e14b31b6 	strh	r3, [fp, #-22]	; 0xffffffea
    struct TraceMeta* p_trace_meta;

    // check if owner entry exists
    uint32_t offset;
    if ((p_trace_meta = tracer_find_meta_onestep(p_owner, name, &offset)) != 0) {
900177b8:	e24b300c 	sub	r3, fp, #12
900177bc:	e1a02003 	mov	r2, r3
900177c0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
900177c4:	e51b0010 	ldr	r0, [fp, #-16]
900177c8:	ebffff4a 	bl	900174f8 <tracer_find_meta_onestep>
900177cc:	e50b0008 	str	r0, [fp, #-8]
900177d0:	e51b3008 	ldr	r3, [fp, #-8]
900177d4:	e3530000 	cmp	r3, #0
900177d8:	0a00000a 	beq	90017808 <tracer_new_meta+0x6c>
        LOG("create resource(trace meta) failed, %s is existed\n", name);
900177dc:	e301194c 	movw	r1, #6476	; 0x194c
900177e0:	e3491002 	movt	r1, #36866	; 0x9002
900177e4:	e3010778 	movw	r0, #6008	; 0x1778
900177e8:	e3490002 	movt	r0, #36866	; 0x9002
900177ec:	ebfff6e1 	bl	90015378 <KPrintf>
900177f0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
900177f4:	e3010784 	movw	r0, #6020	; 0x1784
900177f8:	e3490002 	movt	r0, #36866	; 0x9002
900177fc:	ebfff6dd 	bl	90015378 <KPrintf>
        return NULL;
90017800:	e3a03000 	mov	r3, #0
90017804:	ea00002f 	b	900178c8 <tracer_new_meta+0x12c>
    }

    if ((p_trace_meta = alloc_trace_meta()) == 0) {
90017808:	ebfffd2d 	bl	90016cc4 <alloc_trace_meta>
9001780c:	e50b0008 	str	r0, [fp, #-8]
90017810:	e51b3008 	ldr	r3, [fp, #-8]
90017814:	e3530000 	cmp	r3, #0
90017818:	1a00000a 	bne	90017848 <tracer_new_meta+0xac>
        ERROR("create resource(trace meta) failed, cache is no free\n");
9001781c:	e3002117 	movw	r2, #279	; 0x117
90017820:	e301194c 	movw	r1, #6476	; 0x194c
90017824:	e3491002 	movt	r1, #36866	; 0x9002
90017828:	e301063c 	movw	r0, #5692	; 0x163c
9001782c:	e3490002 	movt	r0, #36866	; 0x9002
90017830:	ebfff6d0 	bl	90015378 <KPrintf>
90017834:	e30107b8 	movw	r0, #6072	; 0x17b8
90017838:	e3490002 	movt	r0, #36866	; 0x9002
9001783c:	ebfff6cd 	bl	90015378 <KPrintf>
        return NULL;
90017840:	e3a03000 	mov	r3, #0
90017844:	ea00001f 	b	900178c8 <tracer_new_meta+0x12c>
    }

    p_trace_meta->type = type;
90017848:	e15b31b6 	ldrh	r3, [fp, #-22]	; 0xffffffea
9001784c:	e6ef2073 	uxtb	r2, r3
90017850:	e51b3008 	ldr	r3, [fp, #-8]
90017854:	e5c32004 	strb	r2, [r3, #4]
    p_trace_meta->size = 0;
90017858:	e51b3008 	ldr	r3, [fp, #-8]
9001785c:	e3a02000 	mov	r2, #0
90017860:	e5832000 	str	r2, [r3]

    // update parent directory
    tracer_append_meta(p_owner, name, p_trace_meta->index);
90017864:	e51b3008 	ldr	r3, [fp, #-8]
90017868:	e1d330bc 	ldrh	r3, [r3, #12]
9001786c:	e1a02003 	mov	r2, r3
90017870:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90017874:	e51b0010 	ldr	r0, [fp, #-16]
90017878:	ebffff7c 	bl	90017670 <tracer_append_meta>

    // update "." and ".." for vfs inode
    if (p_trace_meta->type == TRACER_OWNER) {
9001787c:	e51b3008 	ldr	r3, [fp, #-8]
90017880:	e5d33004 	ldrb	r3, [r3, #4]
90017884:	e3530001 	cmp	r3, #1
90017888:	1a00000d 	bne	900178c4 <tracer_new_meta+0x128>
        tracer_append_meta(p_trace_meta, ".", p_trace_meta->index);
9001788c:	e51b3008 	ldr	r3, [fp, #-8]
90017890:	e1d330bc 	ldrh	r3, [r3, #12]
90017894:	e1a02003 	mov	r2, r3
90017898:	e30117f0 	movw	r1, #6128	; 0x17f0
9001789c:	e3491002 	movt	r1, #36866	; 0x9002
900178a0:	e51b0008 	ldr	r0, [fp, #-8]
900178a4:	ebffff71 	bl	90017670 <tracer_append_meta>
        tracer_append_meta(p_trace_meta, "..", p_owner->index);
900178a8:	e51b3010 	ldr	r3, [fp, #-16]
900178ac:	e1d330bc 	ldrh	r3, [r3, #12]
900178b0:	e1a02003 	mov	r2, r3
900178b4:	e30117f4 	movw	r1, #6132	; 0x17f4
900178b8:	e3491002 	movt	r1, #36866	; 0x9002
900178bc:	e51b0008 	ldr	r0, [fp, #-8]
900178c0:	ebffff6a 	bl	90017670 <tracer_append_meta>
    }

    return p_trace_meta;
900178c4:	e51b3008 	ldr	r3, [fp, #-8]
}
900178c8:	e1a00003 	mov	r0, r3
900178cc:	e24bd004 	sub	sp, fp, #4
900178d0:	e8bd8800 	pop	{fp, pc}

900178d4 <parse_path>:

static char* parse_path(char* path, char* name)
{
900178d4:	e92d4800 	push	{fp, lr}
900178d8:	e28db004 	add	fp, sp, #4
900178dc:	e24dd010 	sub	sp, sp, #16
900178e0:	e50b0010 	str	r0, [fp, #-16]
900178e4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    // skip extra '/'
    while (*path == '/') {
900178e8:	ea000002 	b	900178f8 <parse_path+0x24>
        path++;
900178ec:	e51b3010 	ldr	r3, [fp, #-16]
900178f0:	e2833001 	add	r3, r3, #1
900178f4:	e50b3010 	str	r3, [fp, #-16]
    while (*path == '/') {
900178f8:	e51b3010 	ldr	r3, [fp, #-16]
900178fc:	e5d33000 	ldrb	r3, [r3]
90017900:	e353002f 	cmp	r3, #47	; 0x2f
90017904:	0afffff8 	beq	900178ec <parse_path+0x18>
    }
    if (*path == '\0') {
90017908:	e51b3010 	ldr	r3, [fp, #-16]
9001790c:	e5d33000 	ldrb	r3, [r3]
90017910:	e3530000 	cmp	r3, #0
90017914:	1a000001 	bne	90017920 <parse_path+0x4c>
        return NULL;
90017918:	e3a03000 	mov	r3, #0
9001791c:	ea000024 	b	900179b4 <parse_path+0xe0>
    }

    // start of current name
    char* cur_start = path;
90017920:	e51b3010 	ldr	r3, [fp, #-16]
90017924:	e50b3008 	str	r3, [fp, #-8]
    while (*path != '/' && *path != '\0') {
90017928:	ea000002 	b	90017938 <parse_path+0x64>
        path++;
9001792c:	e51b3010 	ldr	r3, [fp, #-16]
90017930:	e2833001 	add	r3, r3, #1
90017934:	e50b3010 	str	r3, [fp, #-16]
    while (*path != '/' && *path != '\0') {
90017938:	e51b3010 	ldr	r3, [fp, #-16]
9001793c:	e5d33000 	ldrb	r3, [r3]
90017940:	e353002f 	cmp	r3, #47	; 0x2f
90017944:	0a000003 	beq	90017958 <parse_path+0x84>
90017948:	e51b3010 	ldr	r3, [fp, #-16]
9001794c:	e5d33000 	ldrb	r3, [r3]
90017950:	e3530000 	cmp	r3, #0
90017954:	1afffff4 	bne	9001792c <parse_path+0x58>
    }

    // handle current name
    int len = path - cur_start;
90017958:	e51b2010 	ldr	r2, [fp, #-16]
9001795c:	e51b3008 	ldr	r3, [fp, #-8]
90017960:	e0423003 	sub	r3, r2, r3
90017964:	e50b300c 	str	r3, [fp, #-12]
    if (len >= RESOURCE_NAME_SIZE) {
90017968:	e51b300c 	ldr	r3, [fp, #-12]
9001796c:	e353000d 	cmp	r3, #13
90017970:	da000004 	ble	90017988 <parse_path+0xb4>
        strncpy(name, cur_start, RESOURCE_NAME_SIZE);
90017974:	e3a0200e 	mov	r2, #14
90017978:	e51b1008 	ldr	r1, [fp, #-8]
9001797c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90017980:	fa002462 	blx	90020b10 <strncpy>
90017984:	ea000009 	b	900179b0 <parse_path+0xdc>
    } else {
        strncpy(name, cur_start, len);
90017988:	e51b300c 	ldr	r3, [fp, #-12]
9001798c:	e1a02003 	mov	r2, r3
90017990:	e51b1008 	ldr	r1, [fp, #-8]
90017994:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90017998:	fa00245c 	blx	90020b10 <strncpy>
        name[len] = '\0';
9001799c:	e51b300c 	ldr	r3, [fp, #-12]
900179a0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
900179a4:	e0823003 	add	r3, r2, r3
900179a8:	e3a02000 	mov	r2, #0
900179ac:	e5c32000 	strb	r2, [r3]
    }

    return path;
900179b0:	e51b3010 	ldr	r3, [fp, #-16]
}
900179b4:	e1a00003 	mov	r0, r3
900179b8:	e24bd004 	sub	sp, fp, #4
900179bc:	e8bd8800 	pop	{fp, pc}

900179c0 <tracer_find_meta>:

static struct TraceMeta* tracer_find_meta(struct TraceMeta* const p_owner, char* path, int nameiparent, char* name)
{
900179c0:	e92d4800 	push	{fp, lr}
900179c4:	e28db004 	add	fp, sp, #4
900179c8:	e24dd018 	sub	sp, sp, #24
900179cc:	e50b0010 	str	r0, [fp, #-16]
900179d0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
900179d4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
900179d8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    struct TraceMeta* p_owner_inside = p_owner;
900179dc:	e51b3010 	ldr	r3, [fp, #-16]
900179e0:	e50b3008 	str	r3, [fp, #-8]
    struct TraceMeta* vnp;

    /* traverse TRACER_OWNER */
    while ((path = parse_path(path, name)) != 0) {
900179e4:	ea000024 	b	90017a7c <tracer_find_meta+0xbc>
        if (p_owner_inside->type != TRACER_OWNER) {
900179e8:	e51b3008 	ldr	r3, [fp, #-8]
900179ec:	e5d33004 	ldrb	r3, [r3, #4]
900179f0:	e3530001 	cmp	r3, #1
900179f4:	0a000001 	beq	90017a00 <tracer_find_meta+0x40>
            return NULL;
900179f8:	e3a03000 	mov	r3, #0
900179fc:	ea00002b 	b	90017ab0 <tracer_find_meta+0xf0>
        }
        if (nameiparent && *path == '\0') {
90017a00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017a04:	e3530000 	cmp	r3, #0
90017a08:	0a000005 	beq	90017a24 <tracer_find_meta+0x64>
90017a0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017a10:	e5d33000 	ldrb	r3, [r3]
90017a14:	e3530000 	cmp	r3, #0
90017a18:	1a000001 	bne	90017a24 <tracer_find_meta+0x64>
            return p_owner_inside;
90017a1c:	e51b3008 	ldr	r3, [fp, #-8]
90017a20:	ea000022 	b	90017ab0 <tracer_find_meta+0xf0>
        }
        if ((vnp = tracer_find_meta_onestep(p_owner_inside, name, NULL)) == 0) {
90017a24:	e3a02000 	mov	r2, #0
90017a28:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
90017a2c:	e51b0008 	ldr	r0, [fp, #-8]
90017a30:	ebfffeb0 	bl	900174f8 <tracer_find_meta_onestep>
90017a34:	e50b000c 	str	r0, [fp, #-12]
90017a38:	e51b300c 	ldr	r3, [fp, #-12]
90017a3c:	e3530000 	cmp	r3, #0
90017a40:	1a00000b 	bne	90017a74 <tracer_find_meta+0xb4>
            ERROR("Not such object: %s\n", path);
90017a44:	e3a02f55 	mov	r2, #340	; 0x154
90017a48:	e301195c 	movw	r1, #6492	; 0x195c
90017a4c:	e3491002 	movt	r1, #36866	; 0x9002
90017a50:	e301063c 	movw	r0, #5692	; 0x163c
90017a54:	e3490002 	movt	r0, #36866	; 0x9002
90017a58:	ebfff646 	bl	90015378 <KPrintf>
90017a5c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90017a60:	e30107f8 	movw	r0, #6136	; 0x17f8
90017a64:	e3490002 	movt	r0, #36866	; 0x9002
90017a68:	ebfff642 	bl	90015378 <KPrintf>
            return NULL;
90017a6c:	e3a03000 	mov	r3, #0
90017a70:	ea00000e 	b	90017ab0 <tracer_find_meta+0xf0>
        }
        p_owner_inside = vnp;
90017a74:	e51b300c 	ldr	r3, [fp, #-12]
90017a78:	e50b3008 	str	r3, [fp, #-8]
    while ((path = parse_path(path, name)) != 0) {
90017a7c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
90017a80:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90017a84:	ebffff92 	bl	900178d4 <parse_path>
90017a88:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
90017a8c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017a90:	e3530000 	cmp	r3, #0
90017a94:	1affffd3 	bne	900179e8 <tracer_find_meta+0x28>
    }

    if (nameiparent) {
90017a98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90017a9c:	e3530000 	cmp	r3, #0
90017aa0:	0a000001 	beq	90017aac <tracer_find_meta+0xec>
        return NULL;
90017aa4:	e3a03000 	mov	r3, #0
90017aa8:	ea000000 	b	90017ab0 <tracer_find_meta+0xf0>
    }
    return p_owner_inside;
90017aac:	e51b3008 	ldr	r3, [fp, #-8]
}
90017ab0:	e1a00003 	mov	r0, r3
90017ab4:	e24bd004 	sub	sp, fp, #4
90017ab8:	e8bd8800 	pop	{fp, pc}

90017abc <tracer_write_trace>:

int tracer_write_trace(struct TraceTag* const p_trace_tag, char* src, uint32_t off, uint32_t n)
{
90017abc:	e92d4800 	push	{fp, lr}
90017ac0:	e28db004 	add	fp, sp, #4
90017ac4:	e24dd010 	sub	sp, sp, #16
90017ac8:	e50b0008 	str	r0, [fp, #-8]
90017acc:	e50b100c 	str	r1, [fp, #-12]
90017ad0:	e50b2010 	str	r2, [fp, #-16]
90017ad4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (src == NULL || p_trace_tag == NULL || p_trace_tag->meta == NULL) {
90017ad8:	e51b300c 	ldr	r3, [fp, #-12]
90017adc:	e3530000 	cmp	r3, #0
90017ae0:	0a000006 	beq	90017b00 <tracer_write_trace+0x44>
90017ae4:	e51b3008 	ldr	r3, [fp, #-8]
90017ae8:	e3530000 	cmp	r3, #0
90017aec:	0a000003 	beq	90017b00 <tracer_write_trace+0x44>
90017af0:	e51b3008 	ldr	r3, [fp, #-8]
90017af4:	e5933000 	ldr	r3, [r3]
90017af8:	e3530000 	cmp	r3, #0
90017afc:	1a000001 	bne	90017b08 <tracer_write_trace+0x4c>
        return -1;
90017b00:	e3e03000 	mvn	r3, #0
90017b04:	ea000006 	b	90017b24 <tracer_write_trace+0x68>
    }
    return trace_write_info(p_trace_tag->meta, src, off, n);
90017b08:	e51b3008 	ldr	r3, [fp, #-8]
90017b0c:	e5930000 	ldr	r0, [r3]
90017b10:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017b14:	e51b2010 	ldr	r2, [fp, #-16]
90017b18:	e51b100c 	ldr	r1, [fp, #-12]
90017b1c:	ebfffd7a 	bl	9001710c <trace_write_info>
90017b20:	e1a03000 	mov	r3, r0
}
90017b24:	e1a00003 	mov	r0, r3
90017b28:	e24bd004 	sub	sp, fp, #4
90017b2c:	e8bd8800 	pop	{fp, pc}

90017b30 <tracer_read_trace>:

int tracer_read_trace(struct TraceTag* const p_trace_tag, char* dst, uint32_t off, uint32_t n)
{
90017b30:	e92d4800 	push	{fp, lr}
90017b34:	e28db004 	add	fp, sp, #4
90017b38:	e24dd010 	sub	sp, sp, #16
90017b3c:	e50b0008 	str	r0, [fp, #-8]
90017b40:	e50b100c 	str	r1, [fp, #-12]
90017b44:	e50b2010 	str	r2, [fp, #-16]
90017b48:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (dst == NULL || p_trace_tag == NULL || p_trace_tag->meta == NULL) {
90017b4c:	e51b300c 	ldr	r3, [fp, #-12]
90017b50:	e3530000 	cmp	r3, #0
90017b54:	0a000006 	beq	90017b74 <tracer_read_trace+0x44>
90017b58:	e51b3008 	ldr	r3, [fp, #-8]
90017b5c:	e3530000 	cmp	r3, #0
90017b60:	0a000003 	beq	90017b74 <tracer_read_trace+0x44>
90017b64:	e51b3008 	ldr	r3, [fp, #-8]
90017b68:	e5933000 	ldr	r3, [r3]
90017b6c:	e3530000 	cmp	r3, #0
90017b70:	1a000001 	bne	90017b7c <tracer_read_trace+0x4c>
        return -1;
90017b74:	e3e03000 	mvn	r3, #0
90017b78:	ea000006 	b	90017b98 <tracer_read_trace+0x68>
    }
    return trace_read_info(p_trace_tag->meta, dst, off, n);
90017b7c:	e51b3008 	ldr	r3, [fp, #-8]
90017b80:	e5930000 	ldr	r0, [r3]
90017b84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017b88:	e51b2010 	ldr	r2, [fp, #-16]
90017b8c:	e51b100c 	ldr	r1, [fp, #-12]
90017b90:	ebfffddc 	bl	90017308 <trace_read_info>
90017b94:	e1a03000 	mov	r3, r0
}
90017b98:	e1a00003 	mov	r0, r3
90017b9c:	e24bd004 	sub	sp, fp, #4
90017ba0:	e8bd8800 	pop	{fp, pc}

90017ba4 <trace_locate_inner>:

/// @brief
static void trace_locate_inner(struct TraceTag* target, struct TraceTag* const p_trace_tag, char* path, bool parent)
{
90017ba4:	e92d4800 	push	{fp, lr}
90017ba8:	e28db004 	add	fp, sp, #4
90017bac:	e24dd028 	sub	sp, sp, #40	; 0x28
90017bb0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90017bb4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
90017bb8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
90017bbc:	e54b3029 	strb	r3, [fp, #-41]	; 0xffffffd7
    char name[RESOURCE_NAME_SIZE];
    struct TraceMeta* p_trace_meta = tracer_find_meta(p_trace_tag->meta, path, parent, name);
90017bc0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90017bc4:	e5930000 	ldr	r0, [r3]
90017bc8:	e55b2029 	ldrb	r2, [fp, #-41]	; 0xffffffd7
90017bcc:	e24b3018 	sub	r3, fp, #24
90017bd0:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
90017bd4:	ebffff79 	bl	900179c0 <tracer_find_meta>
90017bd8:	e50b0008 	str	r0, [fp, #-8]
    // p_trace_meta: TRACER_OWNER, VT_FS or other.
    //      TRACER_OWNER: path: "", name: "dir name"
    //      other:  path: "", name: "file name"
    if (!p_trace_meta) {
90017bdc:	e51b3008 	ldr	r3, [fp, #-8]
90017be0:	e3530000 	cmp	r3, #0
90017be4:	1a000007 	bne	90017c08 <trace_locate_inner+0x64>
        DEBUG("trace_locate, not found\n");
90017be8:	e3011970 	movw	r1, #6512	; 0x1970
90017bec:	e3491002 	movt	r1, #36866	; 0x9002
90017bf0:	e3010810 	movw	r0, #6160	; 0x1810
90017bf4:	e3490002 	movt	r0, #36866	; 0x9002
90017bf8:	ebfff5de 	bl	90015378 <KPrintf>
90017bfc:	e3010820 	movw	r0, #6176	; 0x1820
90017c00:	e3490002 	movt	r0, #36866	; 0x9002
90017c04:	ebfff5db 	bl	90015378 <KPrintf>
    }
    target->type = p_trace_meta->type;
90017c08:	e51b3008 	ldr	r3, [fp, #-8]
90017c0c:	e5d33004 	ldrb	r3, [r3, #4]
90017c10:	e6bf2073 	sxth	r2, r3
90017c14:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017c18:	e1c320b4 	strh	r2, [r3, #4]
    target->meta = p_trace_meta;
90017c1c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90017c20:	e51b2008 	ldr	r2, [fp, #-8]
90017c24:	e5832000 	str	r2, [r3]
}
90017c28:	e320f000 	nop	{0}
90017c2c:	e24bd004 	sub	sp, fp, #4
90017c30:	e8bd8800 	pop	{fp, pc}

90017c34 <trace_locate>:

static inline void trace_locate(struct TraceTag* target, struct TraceTag* const p_trace_tag, char* path)
{
90017c34:	e92d4800 	push	{fp, lr}
90017c38:	e28db004 	add	fp, sp, #4
90017c3c:	e24dd010 	sub	sp, sp, #16
90017c40:	e50b0008 	str	r0, [fp, #-8]
90017c44:	e50b100c 	str	r1, [fp, #-12]
90017c48:	e50b2010 	str	r2, [fp, #-16]
    trace_locate_inner(target, p_trace_tag, path, 0);
90017c4c:	e3a03000 	mov	r3, #0
90017c50:	e51b2010 	ldr	r2, [fp, #-16]
90017c54:	e51b100c 	ldr	r1, [fp, #-12]
90017c58:	e51b0008 	ldr	r0, [fp, #-8]
90017c5c:	ebffffd0 	bl	90017ba4 <trace_locate_inner>
}
90017c60:	e320f000 	nop	{0}
90017c64:	e24bd004 	sub	sp, fp, #4
90017c68:	e8bd8800 	pop	{fp, pc}

90017c6c <tracer_create_trace>:
{
    trace_locate_inner(target, p_trace_tag, path, 1);
}

bool tracer_create_trace(struct TraceTag* target, struct TraceTag* p_trace_tag, char* path, short type)
{
90017c6c:	e92d4800 	push	{fp, lr}
90017c70:	e28db004 	add	fp, sp, #4
90017c74:	e24dd018 	sub	sp, sp, #24
90017c78:	e50b0010 	str	r0, [fp, #-16]
90017c7c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90017c80:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
90017c84:	e14b31ba 	strh	r3, [fp, #-26]	; 0xffffffe6
    struct TraceMeta *p_trace_meta, *p_owner;

    // find parent vfs inode
    if ((p_owner = p_trace_tag->meta) == 0) {
90017c88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017c8c:	e5933000 	ldr	r3, [r3]
90017c90:	e50b3008 	str	r3, [fp, #-8]
90017c94:	e51b3008 	ldr	r3, [fp, #-8]
90017c98:	e3530000 	cmp	r3, #0
90017c9c:	1a00000c 	bne	90017cd4 <tracer_create_trace+0x68>
        LOG("create tracemeta failed, parent is null\n");
90017ca0:	e3011984 	movw	r1, #6532	; 0x1984
90017ca4:	e3491002 	movt	r1, #36866	; 0x9002
90017ca8:	e3010778 	movw	r0, #6008	; 0x1778
90017cac:	e3490002 	movt	r0, #36866	; 0x9002
90017cb0:	ebfff5b0 	bl	90015378 <KPrintf>
90017cb4:	e301083c 	movw	r0, #6204	; 0x183c
90017cb8:	e3490002 	movt	r0, #36866	; 0x9002
90017cbc:	ebfff5ad 	bl	90015378 <KPrintf>
        target->meta = NULL;
90017cc0:	e51b3010 	ldr	r3, [fp, #-16]
90017cc4:	e3a02000 	mov	r2, #0
90017cc8:	e5832000 	str	r2, [r3]
        return false;
90017ccc:	e3a03000 	mov	r3, #0
90017cd0:	ea000009 	b	90017cfc <tracer_create_trace+0x90>
    }

    p_trace_meta = tracer_new_meta(p_owner, path, type);
90017cd4:	e15b31fa 	ldrsh	r3, [fp, #-26]	; 0xffffffe6
90017cd8:	e1a02003 	mov	r2, r3
90017cdc:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
90017ce0:	e51b0008 	ldr	r0, [fp, #-8]
90017ce4:	ebfffeac 	bl	9001779c <tracer_new_meta>
90017ce8:	e50b000c 	str	r0, [fp, #-12]
    target->meta = p_trace_meta;
90017cec:	e51b3010 	ldr	r3, [fp, #-16]
90017cf0:	e51b200c 	ldr	r2, [fp, #-12]
90017cf4:	e5832000 	str	r2, [r3]
    return true;
90017cf8:	e3a03001 	mov	r3, #1
}
90017cfc:	e1a00003 	mov	r0, r3
90017d00:	e24bd004 	sub	sp, fp, #4
90017d04:	e8bd8800 	pop	{fp, pc}

90017d08 <tracer_delete_trace>:

bool tracer_delete_trace(struct TraceTag* target, struct TraceTag* owner)
{
90017d08:	e92d4800 	push	{fp, lr}
90017d0c:	e28db004 	add	fp, sp, #4
90017d10:	e24dd028 	sub	sp, sp, #40	; 0x28
90017d14:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
90017d18:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    if (target->meta == NULL || owner->type != TRACER_OWNER) {
90017d1c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90017d20:	e5933000 	ldr	r3, [r3]
90017d24:	e3530000 	cmp	r3, #0
90017d28:	0a000003 	beq	90017d3c <tracer_delete_trace+0x34>
90017d2c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90017d30:	e1d330f4 	ldrsh	r3, [r3, #4]
90017d34:	e3530001 	cmp	r3, #1
90017d38:	0a000001 	beq	90017d44 <tracer_delete_trace+0x3c>
        return false;
90017d3c:	e3a03000 	mov	r3, #0
90017d40:	ea00005e 	b	90017ec0 <tracer_delete_trace+0x1b8>
    }
    struct TraceMeta* p_trace_meta = target->meta;
90017d44:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90017d48:	e5933000 	ldr	r3, [r3]
90017d4c:	e50b3010 	str	r3, [fp, #-16]
    struct TraceMeta* p_owner_meta = owner->meta;
90017d50:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90017d54:	e5933000 	ldr	r3, [r3]
90017d58:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    assert(p_trace_meta->type != TRACER_INVALID);
90017d5c:	e51b3010 	ldr	r3, [fp, #-16]
90017d60:	e5d33004 	ldrb	r3, [r3, #4]
90017d64:	e3530000 	cmp	r3, #0
90017d68:	1a00000d 	bne	90017da4 <tracer_delete_trace+0x9c>
90017d6c:	e3a02e1a 	mov	r2, #416	; 0x1a0
90017d70:	e3011998 	movw	r1, #6552	; 0x1998
90017d74:	e3491002 	movt	r1, #36866	; 0x9002
90017d78:	e301063c 	movw	r0, #5692	; 0x163c
90017d7c:	e3490002 	movt	r0, #36866	; 0x9002
90017d80:	ebfff57c 	bl	90015378 <KPrintf>
90017d84:	e3011868 	movw	r1, #6248	; 0x1868
90017d88:	e3491002 	movt	r1, #36866	; 0x9002
90017d8c:	e30106e8 	movw	r0, #5864	; 0x16e8
90017d90:	e3490002 	movt	r0, #36866	; 0x9002
90017d94:	ebfff577 	bl	90015378 <KPrintf>
90017d98:	e30106f8 	movw	r0, #5880	; 0x16f8
90017d9c:	e3490002 	movt	r0, #36866	; 0x9002
90017da0:	ebffec66 	bl	90012f40 <panic>
    if (p_trace_meta->type == TRACER_OWNER) {
        /// @todo support recursive delete
    }

    struct TraceResourceEntry resource_entry;
    bool is_owned = false;
90017da4:	e3a03000 	mov	r3, #0
90017da8:	e54b3005 	strb	r3, [fp, #-5]
    for (uint32_t off = 0; off < p_owner_meta->size; off += sizeof(resource_entry)) {
90017dac:	e3a03000 	mov	r3, #0
90017db0:	e50b300c 	str	r3, [fp, #-12]
90017db4:	ea000021 	b	90017e40 <tracer_delete_trace+0x138>
        if (trace_read_info(p_owner_meta, (char*)&resource_entry, off, sizeof(resource_entry)) != sizeof(resource_entry)) {
90017db8:	e24b1024 	sub	r1, fp, #36	; 0x24
90017dbc:	e3a03010 	mov	r3, #16
90017dc0:	e51b200c 	ldr	r2, [fp, #-12]
90017dc4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90017dc8:	ebfffd4e 	bl	90017308 <trace_read_info>
90017dcc:	e1a03000 	mov	r3, r0
90017dd0:	e3530010 	cmp	r3, #16
90017dd4:	0a000002 	beq	90017de4 <tracer_delete_trace+0xdc>
            panic("tracer_find_meta_onestep: read trace owner's resources failed\n");
90017dd8:	e301067c 	movw	r0, #5756	; 0x167c
90017ddc:	e3490002 	movt	r0, #36866	; 0x9002
90017de0:	ebffec56 	bl	90012f40 <panic>
        }

        if (resource_entry.index == 0) {
90017de4:	e15b32b4 	ldrh	r3, [fp, #-36]	; 0xffffffdc
90017de8:	e3530000 	cmp	r3, #0
90017dec:	0a00000f 	beq	90017e30 <tracer_delete_trace+0x128>
            continue;
        }

        if (resource_entry.index == p_trace_meta->index) {
90017df0:	e15b22b4 	ldrh	r2, [fp, #-36]	; 0xffffffdc
90017df4:	e51b3010 	ldr	r3, [fp, #-16]
90017df8:	e1d330bc 	ldrh	r3, [r3, #12]
90017dfc:	e1520003 	cmp	r2, r3
90017e00:	1a00000b 	bne	90017e34 <tracer_delete_trace+0x12c>
            resource_entry.index = 0;
90017e04:	e3a03000 	mov	r3, #0
90017e08:	e14b32b4 	strh	r3, [fp, #-36]	; 0xffffffdc
            trace_write_info(owner->meta, (char*)&resource_entry, off, sizeof(resource_entry));
90017e0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90017e10:	e5930000 	ldr	r0, [r3]
90017e14:	e24b1024 	sub	r1, fp, #36	; 0x24
90017e18:	e3a03010 	mov	r3, #16
90017e1c:	e51b200c 	ldr	r2, [fp, #-12]
90017e20:	ebfffcb9 	bl	9001710c <trace_write_info>
            is_owned = true;
90017e24:	e3a03001 	mov	r3, #1
90017e28:	e54b3005 	strb	r3, [fp, #-5]
            break;
90017e2c:	ea000008 	b	90017e54 <tracer_delete_trace+0x14c>
            continue;
90017e30:	e320f000 	nop	{0}
    for (uint32_t off = 0; off < p_owner_meta->size; off += sizeof(resource_entry)) {
90017e34:	e51b300c 	ldr	r3, [fp, #-12]
90017e38:	e2833010 	add	r3, r3, #16
90017e3c:	e50b300c 	str	r3, [fp, #-12]
90017e40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90017e44:	e5932000 	ldr	r2, [r3]
90017e48:	e51b300c 	ldr	r3, [fp, #-12]
90017e4c:	e1520003 	cmp	r2, r3
90017e50:	8affffd8 	bhi	90017db8 <tracer_delete_trace+0xb0>
        }
    }

    if (!is_owned) {
90017e54:	e55b3005 	ldrb	r3, [fp, #-5]
90017e58:	e2233001 	eor	r3, r3, #1
90017e5c:	e6ef3073 	uxtb	r3, r3
90017e60:	e3530000 	cmp	r3, #0
90017e64:	0a000012 	beq	90017eb4 <tracer_delete_trace+0x1ac>
        ERROR("delete trace(%d) not owned by given owner(%d).\n", target->meta->index, owner->meta->index);
90017e68:	e30021ba 	movw	r2, #442	; 0x1ba
90017e6c:	e3011998 	movw	r1, #6552	; 0x1998
90017e70:	e3491002 	movt	r1, #36866	; 0x9002
90017e74:	e301063c 	movw	r0, #5692	; 0x163c
90017e78:	e3490002 	movt	r0, #36866	; 0x9002
90017e7c:	ebfff53d 	bl	90015378 <KPrintf>
90017e80:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90017e84:	e5933000 	ldr	r3, [r3]
90017e88:	e1d330bc 	ldrh	r3, [r3, #12]
90017e8c:	e1a01003 	mov	r1, r3
90017e90:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90017e94:	e5933000 	ldr	r3, [r3]
90017e98:	e1d330bc 	ldrh	r3, [r3, #12]
90017e9c:	e1a02003 	mov	r2, r3
90017ea0:	e3010890 	movw	r0, #6288	; 0x1890
90017ea4:	e3490002 	movt	r0, #36866	; 0x9002
90017ea8:	ebfff532 	bl	90015378 <KPrintf>
        return false;
90017eac:	e3a03000 	mov	r3, #0
90017eb0:	ea000002 	b	90017ec0 <tracer_delete_trace+0x1b8>
    }
    dealloc_trace_meta(p_trace_meta);
90017eb4:	e51b0010 	ldr	r0, [fp, #-16]
90017eb8:	ebfffbdb 	bl	90016e2c <dealloc_trace_meta>

    return true;
90017ebc:	e3a03001 	mov	r3, #1
}
90017ec0:	e1a00003 	mov	r0, r3
90017ec4:	e24bd004 	sub	sp, fp, #4
90017ec8:	e8bd8800 	pop	{fp, pc}

90017ecc <tracer_init>:

void tracer_init(void)
{
90017ecc:	e92d4800 	push	{fp, lr}
90017ed0:	e28db004 	add	fp, sp, #4
90017ed4:	e24dd008 	sub	sp, sp, #8
    /* init sys_tracer, the manager */
    spinlock_init(&sys_tracer.mem_chunk_bitmap_lock, "tracer_mem_chunk_bitmap");
90017ed8:	e30118c0 	movw	r1, #6336	; 0x18c0
90017edc:	e3491002 	movt	r1, #36866	; 0x9002
90017ee0:	e59f010c 	ldr	r0, [pc, #268]	; 90017ff4 <tracer_init+0x128>
90017ee4:	ebffef95 	bl	90013d40 <spinlock_init>
    spinlock_init(&sys_tracer.trace_meta_bitmap_lock, "tracer_meta_bitmap");
90017ee8:	e30118d8 	movw	r1, #6360	; 0x18d8
90017eec:	e3491002 	movt	r1, #36866	; 0x9002
90017ef0:	e59f0100 	ldr	r0, [pc, #256]	; 90017ff8 <tracer_init+0x12c>
90017ef4:	ebffef91 	bl	90013d40 <spinlock_init>
    memset(sys_tracer.mem_chunks_bit_map, 0, sizeof(sys_tracer.mem_chunk_bitmap_lock));
90017ef8:	e3a02020 	mov	r2, #32
90017efc:	e3a01000 	mov	r1, #0
90017f00:	e30a0880 	movw	r0, #43136	; 0xa880
90017f04:	e3490019 	movt	r0, #36889	; 0x9019
90017f08:	fa002299 	blx	90020974 <memset>
    memset(sys_tracer.trace_meta_bit_map, 0, sizeof(sys_tracer.trace_meta_bit_map));
90017f0c:	e3a02010 	mov	r2, #16
90017f10:	e3a01000 	mov	r1, #0
90017f14:	e59f00e0 	ldr	r0, [pc, #224]	; 90017ffc <tracer_init+0x130>
90017f18:	fa002295 	blx	90020974 <memset>

    assert((TRACER_MEM_CHUNK_SIZE % sizeof(struct TraceMeta)) == 0);
    assert((TRACER_MEM_CHUNK_SIZE % sizeof(struct TraceResourceEntry)) == 0);
    // mem_chunk space, fit with mem_chunk_bit_map
    mem_chunk_synchronizer_init((uintptr_t)tracer_space, TRACER_MEM_CHUNK_SIZE, NR_TRACER_MEM_CHUNKS);
90017f1c:	e30b3900 	movw	r3, #47360	; 0xb900
90017f20:	e3493019 	movt	r3, #36889	; 0x9019
90017f24:	e3a02c01 	mov	r2, #256	; 0x100
90017f28:	e3a01020 	mov	r1, #32
90017f2c:	e1a00003 	mov	r0, r3
90017f30:	eb0000fc 	bl	90018328 <mem_chunk_synchronizer_init>

    /* build root inode */
    alloc_trace_meta(); // inode as guard.
90017f34:	ebfffb62 	bl	90016cc4 <alloc_trace_meta>

    /* build root trace_meta */
    struct TraceMeta* root_tracemeta = alloc_trace_meta();
90017f38:	ebfffb61 	bl	90016cc4 <alloc_trace_meta>
90017f3c:	e50b0008 	str	r0, [fp, #-8]
    assert(root_tracemeta->index == 1);
90017f40:	e51b3008 	ldr	r3, [fp, #-8]
90017f44:	e1d330bc 	ldrh	r3, [r3, #12]
90017f48:	e3530001 	cmp	r3, #1
90017f4c:	0a00000d 	beq	90017f88 <tracer_init+0xbc>
90017f50:	e3a02f75 	mov	r2, #468	; 0x1d4
90017f54:	e30119ac 	movw	r1, #6572	; 0x19ac
90017f58:	e3491002 	movt	r1, #36866	; 0x9002
90017f5c:	e301063c 	movw	r0, #5692	; 0x163c
90017f60:	e3490002 	movt	r0, #36866	; 0x9002
90017f64:	ebfff503 	bl	90015378 <KPrintf>
90017f68:	e30118ec 	movw	r1, #6380	; 0x18ec
90017f6c:	e3491002 	movt	r1, #36866	; 0x9002
90017f70:	e30106e8 	movw	r0, #5864	; 0x16e8
90017f74:	e3490002 	movt	r0, #36866	; 0x9002
90017f78:	ebfff4fe 	bl	90015378 <KPrintf>
90017f7c:	e30106f8 	movw	r0, #5880	; 0x16f8
90017f80:	e3490002 	movt	r0, #36866	; 0x9002
90017f84:	ebffebed 	bl	90012f40 <panic>
    root_tracemeta->type = TRACER_OWNER;
90017f88:	e51b3008 	ldr	r3, [fp, #-8]
90017f8c:	e3a02001 	mov	r2, #1
90017f90:	e5c32004 	strb	r2, [r3, #4]
    root_tracemeta->size = 0;
90017f94:	e51b3008 	ldr	r3, [fp, #-8]
90017f98:	e3a02000 	mov	r2, #0
90017f9c:	e5832000 	str	r2, [r3]

    tracer_append_meta(root_tracemeta, ".", root_tracemeta->index);
90017fa0:	e51b3008 	ldr	r3, [fp, #-8]
90017fa4:	e1d330bc 	ldrh	r3, [r3, #12]
90017fa8:	e1a02003 	mov	r2, r3
90017fac:	e30117f0 	movw	r1, #6128	; 0x17f0
90017fb0:	e3491002 	movt	r1, #36866	; 0x9002
90017fb4:	e51b0008 	ldr	r0, [fp, #-8]
90017fb8:	ebfffdac 	bl	90017670 <tracer_append_meta>
    tracer_append_meta(root_tracemeta, "..", root_tracemeta->index);
90017fbc:	e51b3008 	ldr	r3, [fp, #-8]
90017fc0:	e1d330bc 	ldrh	r3, [r3, #12]
90017fc4:	e1a02003 	mov	r2, r3
90017fc8:	e30117f4 	movw	r1, #6132	; 0x17f4
90017fcc:	e3491002 	movt	r1, #36866	; 0x9002
90017fd0:	e51b0008 	ldr	r0, [fp, #-8]
90017fd4:	ebfffda5 	bl	90017670 <tracer_append_meta>

    RequireRootTag()->meta = root_tracemeta;
90017fd8:	ebfffb24 	bl	90016c70 <RequireRootTag>
90017fdc:	e1a02000 	mov	r2, r0
90017fe0:	e51b3008 	ldr	r3, [fp, #-8]
90017fe4:	e5823000 	str	r3, [r2]
}
90017fe8:	e320f000 	nop	{0}
90017fec:	e24bd004 	sub	sp, fp, #4
90017ff0:	e8bd8800 	pop	{fp, pc}
90017ff4:	9019a8a0 	.word	0x9019a8a0
90017ff8:	9019a8e0 	.word	0x9019a8e0
90017ffc:	9019a8c0 	.word	0x9019a8c0

90018000 <tracer_find_tag>:

/// @brief find resource tag
void tracer_find_tag(struct TraceTag* target, struct TraceTag* const source, char* path)
{
90018000:	e92d4800 	push	{fp, lr}
90018004:	e28db004 	add	fp, sp, #4
90018008:	e24dd018 	sub	sp, sp, #24
9001800c:	e50b0010 	str	r0, [fp, #-16]
90018010:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90018014:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    target->meta = NULL;
90018018:	e51b3010 	ldr	r3, [fp, #-16]
9001801c:	e3a02000 	mov	r2, #0
90018020:	e5832000 	str	r2, [r3]
    struct TraceTag* p_trace_tag;

    if (*path == '/' || source == NULL) {
90018024:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018028:	e5d33000 	ldrb	r3, [r3]
9001802c:	e353002f 	cmp	r3, #47	; 0x2f
90018030:	0a000002 	beq	90018040 <tracer_find_tag+0x40>
90018034:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90018038:	e3530000 	cmp	r3, #0
9001803c:	1a000002 	bne	9001804c <tracer_find_tag+0x4c>
        p_trace_tag = RequireRootTag();
90018040:	ebfffb0a 	bl	90016c70 <RequireRootTag>
90018044:	e50b0008 	str	r0, [fp, #-8]
90018048:	ea000001 	b	90018054 <tracer_find_tag+0x54>
    } else {
        p_trace_tag = source;
9001804c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90018050:	e50b3008 	str	r3, [fp, #-8]
    }
    if (p_trace_tag == NULL || p_trace_tag->meta == NULL) {
90018054:	e51b3008 	ldr	r3, [fp, #-8]
90018058:	e3530000 	cmp	r3, #0
9001805c:	0a000008 	beq	90018084 <tracer_find_tag+0x84>
90018060:	e51b3008 	ldr	r3, [fp, #-8]
90018064:	e5933000 	ldr	r3, [r3]
90018068:	e3530000 	cmp	r3, #0
9001806c:	0a000004 	beq	90018084 <tracer_find_tag+0x84>
        return;
    }
    trace_locate(target, p_trace_tag, path);
90018070:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90018074:	e51b1008 	ldr	r1, [fp, #-8]
90018078:	e51b0010 	ldr	r0, [fp, #-16]
9001807c:	ebfffeec 	bl	90017c34 <trace_locate>
90018080:	ea000000 	b	90018088 <tracer_find_tag+0x88>
        return;
90018084:	e320f000 	nop	{0}
}
90018088:	e24bd004 	sub	sp, fp, #4
9001808c:	e8bd8800 	pop	{fp, pc}

90018090 <AchieveResourceTag>:

bool AchieveResourceTag(struct TraceTag* target, struct TraceTag* owner, char* name)
{
90018090:	e92d4800 	push	{fp, lr}
90018094:	e28db004 	add	fp, sp, #4
90018098:	e24dd010 	sub	sp, sp, #16
9001809c:	e50b0008 	str	r0, [fp, #-8]
900180a0:	e50b100c 	str	r1, [fp, #-12]
900180a4:	e50b2010 	str	r2, [fp, #-16]
    tracer_find_tag(target, owner, name);
900180a8:	e51b2010 	ldr	r2, [fp, #-16]
900180ac:	e51b100c 	ldr	r1, [fp, #-12]
900180b0:	e51b0008 	ldr	r0, [fp, #-8]
900180b4:	ebffffd1 	bl	90018000 <tracer_find_tag>
    if (target == NULL) {
900180b8:	e51b3008 	ldr	r3, [fp, #-8]
900180bc:	e3530000 	cmp	r3, #0
900180c0:	1a000001 	bne	900180cc <AchieveResourceTag+0x3c>
        return false;
900180c4:	e3a03000 	mov	r3, #0
900180c8:	ea000000 	b	900180d0 <AchieveResourceTag+0x40>
    }
    return true;
900180cc:	e3a03001 	mov	r3, #1
}
900180d0:	e1a00003 	mov	r0, r3
900180d4:	e24bd004 	sub	sp, fp, #4
900180d8:	e8bd8800 	pop	{fp, pc}

900180dc <AchieveResource>:

void* AchieveResource(struct TraceTag* target)
{
900180dc:	e92d4800 	push	{fp, lr}
900180e0:	e28db004 	add	fp, sp, #4
900180e4:	e24dd010 	sub	sp, sp, #16
900180e8:	e50b0010 	str	r0, [fp, #-16]
    if (target->type == TRACER_OWNER) {
900180ec:	e51b3010 	ldr	r3, [fp, #-16]
900180f0:	e1d330f4 	ldrsh	r3, [r3, #4]
900180f4:	e3530001 	cmp	r3, #1
900180f8:	1a000001 	bne	90018104 <AchieveResource+0x28>
        return NULL;
900180fc:	e3a03000 	mov	r3, #0
90018100:	ea000018 	b	90018168 <AchieveResource+0x8c>
    }
    void* p_resource = NULL;
90018104:	e3a03000 	mov	r3, #0
90018108:	e50b3008 	str	r3, [fp, #-8]
    tracer_read_trace(target, (char*)&p_resource, 0, sizeof(void*));
9001810c:	e24b1008 	sub	r1, fp, #8
90018110:	e3a03004 	mov	r3, #4
90018114:	e3a02000 	mov	r2, #0
90018118:	e51b0010 	ldr	r0, [fp, #-16]
9001811c:	ebfffe83 	bl	90017b30 <tracer_read_trace>
    assert(p_resource != NULL);
90018120:	e51b3008 	ldr	r3, [fp, #-8]
90018124:	e3530000 	cmp	r3, #0
90018128:	1a00000d 	bne	90018164 <AchieveResource+0x88>
9001812c:	e30021ff 	movw	r2, #511	; 0x1ff
90018130:	e30119b8 	movw	r1, #6584	; 0x19b8
90018134:	e3491002 	movt	r1, #36866	; 0x9002
90018138:	e301063c 	movw	r0, #5692	; 0x163c
9001813c:	e3490002 	movt	r0, #36866	; 0x9002
90018140:	ebfff48c 	bl	90015378 <KPrintf>
90018144:	e3011908 	movw	r1, #6408	; 0x1908
90018148:	e3491002 	movt	r1, #36866	; 0x9002
9001814c:	e30106e8 	movw	r0, #5864	; 0x16e8
90018150:	e3490002 	movt	r0, #36866	; 0x9002
90018154:	ebfff487 	bl	90015378 <KPrintf>
90018158:	e30106f8 	movw	r0, #5880	; 0x16f8
9001815c:	e3490002 	movt	r0, #36866	; 0x9002
90018160:	ebffeb76 	bl	90012f40 <panic>
    return p_resource;
90018164:	e51b3008 	ldr	r3, [fp, #-8]
}
90018168:	e1a00003 	mov	r0, r3
9001816c:	e24bd004 	sub	sp, fp, #4
90018170:	e8bd8800 	pop	{fp, pc}

90018174 <CreateResourceTag>:

bool CreateResourceTag(struct TraceTag* new_tag, struct TraceTag* owner, char* name, tracemeta_ac_type type, void* p_resource)
{
90018174:	e92d4800 	push	{fp, lr}
90018178:	e28db004 	add	fp, sp, #4
9001817c:	e24dd010 	sub	sp, sp, #16
90018180:	e50b0008 	str	r0, [fp, #-8]
90018184:	e50b100c 	str	r1, [fp, #-12]
90018188:	e50b2010 	str	r2, [fp, #-16]
9001818c:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    new_tag->type = type;
90018190:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
90018194:	e6bf2073 	sxth	r2, r3
90018198:	e51b3008 	ldr	r3, [fp, #-8]
9001819c:	e1c320b4 	strh	r2, [r3, #4]
    if (type == TRACER_OWNER) {
900181a0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
900181a4:	e3530001 	cmp	r3, #1
900181a8:	1a000007 	bne	900181cc <CreateResourceTag+0x58>
        return tracer_create_trace(new_tag, owner, name, type);
900181ac:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
900181b0:	e6bf3073 	sxth	r3, r3
900181b4:	e51b2010 	ldr	r2, [fp, #-16]
900181b8:	e51b100c 	ldr	r1, [fp, #-12]
900181bc:	e51b0008 	ldr	r0, [fp, #-8]
900181c0:	ebfffea9 	bl	90017c6c <tracer_create_trace>
900181c4:	e1a03000 	mov	r3, r0
900181c8:	ea00001b 	b	9001823c <CreateResourceTag+0xc8>
    }

    // handle ac resource types
    if (p_resource == NULL) {
900181cc:	e59b3004 	ldr	r3, [fp, #4]
900181d0:	e3530000 	cmp	r3, #0
900181d4:	1a000001 	bne	900181e0 <CreateResourceTag+0x6c>
        return false;
900181d8:	e3a03000 	mov	r3, #0
900181dc:	ea000016 	b	9001823c <CreateResourceTag+0xc8>
    }

    if (!tracer_create_trace(new_tag, owner, name, type)) {
900181e0:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
900181e4:	e6bf3073 	sxth	r3, r3
900181e8:	e51b2010 	ldr	r2, [fp, #-16]
900181ec:	e51b100c 	ldr	r1, [fp, #-12]
900181f0:	e51b0008 	ldr	r0, [fp, #-8]
900181f4:	ebfffe9c 	bl	90017c6c <tracer_create_trace>
900181f8:	e1a03000 	mov	r3, r0
900181fc:	e2233001 	eor	r3, r3, #1
90018200:	e6ef3073 	uxtb	r3, r3
90018204:	e3530000 	cmp	r3, #0
90018208:	0a000001 	beq	90018214 <CreateResourceTag+0xa0>
        return false;
9001820c:	e3a03000 	mov	r3, #0
90018210:	ea000009 	b	9001823c <CreateResourceTag+0xc8>
    }
    return tracer_write_trace(new_tag, (char*)&p_resource, 0, sizeof(void*)) == sizeof(void*);
90018214:	e3a03004 	mov	r3, #4
90018218:	e3a02000 	mov	r2, #0
9001821c:	e28b1004 	add	r1, fp, #4
90018220:	e51b0008 	ldr	r0, [fp, #-8]
90018224:	ebfffe24 	bl	90017abc <tracer_write_trace>
90018228:	e1a03000 	mov	r3, r0
9001822c:	e3530004 	cmp	r3, #4
90018230:	03a03001 	moveq	r3, #1
90018234:	13a03000 	movne	r3, #0
90018238:	e6ef3073 	uxtb	r3, r3
}
9001823c:	e1a00003 	mov	r0, r3
90018240:	e24bd004 	sub	sp, fp, #4
90018244:	e8bd8800 	pop	{fp, pc}

90018248 <DeleteResource>:

bool DeleteResource(struct TraceTag* target, struct TraceTag* owner)
{
90018248:	e92d4800 	push	{fp, lr}
9001824c:	e28db004 	add	fp, sp, #4
90018250:	e24dd008 	sub	sp, sp, #8
90018254:	e50b0008 	str	r0, [fp, #-8]
90018258:	e50b100c 	str	r1, [fp, #-12]
    return tracer_delete_trace(target, owner);
9001825c:	e51b100c 	ldr	r1, [fp, #-12]
90018260:	e51b0008 	ldr	r0, [fp, #-8]
90018264:	ebfffea7 	bl	90017d08 <tracer_delete_trace>
90018268:	e1a03000 	mov	r3, r0
9001826c:	e1a00003 	mov	r0, r3
90018270:	e24bd004 	sub	sp, fp, #4
90018274:	e8bd8800 	pop	{fp, pc}

90018278 <tracer_mem_chunk_sync>:
};

static struct mem_chunk_synchronizer tracer_mem_chunk_syner;

static void tracer_mem_chunk_sync(struct tracer_mem_chunk* b)
{
90018278:	e92d4800 	push	{fp, lr}
9001827c:	e28db004 	add	fp, sp, #4
90018280:	e24dd008 	sub	sp, sp, #8
90018284:	e50b0008 	str	r0, [fp, #-8]
    if (!(b->flag & TRACER_MEM_CHUNK_BUSY)) {
90018288:	e51b3008 	ldr	r3, [fp, #-8]
9001828c:	e5d33000 	ldrb	r3, [r3]
90018290:	e2033001 	and	r3, r3, #1
90018294:	e3530000 	cmp	r3, #0
90018298:	1a000002 	bne	900182a8 <tracer_mem_chunk_sync+0x30>
        panic("mem_chunk_sync: buf not busy");
9001829c:	e30109c8 	movw	r0, #6600	; 0x19c8
900182a0:	e3490002 	movt	r0, #36866	; 0x9002
900182a4:	ebffeb25 	bl	90012f40 <panic>
    }

    if (b->chunk_id >= tracer_mem_chunk_syner.nr_mem_chunks) {
900182a8:	e51b3008 	ldr	r3, [fp, #-8]
900182ac:	e5932004 	ldr	r2, [r3, #4]
900182b0:	e3033900 	movw	r3, #14592	; 0x3900
900182b4:	e349301a 	movt	r3, #36890	; 0x901a
900182b8:	e5933008 	ldr	r3, [r3, #8]
900182bc:	e1520003 	cmp	r2, r3
900182c0:	3a000002 	bcc	900182d0 <tracer_mem_chunk_sync+0x58>
        panic("mem_chunk_sync: sector out of range");
900182c4:	e30109e8 	movw	r0, #6632	; 0x19e8
900182c8:	e3490002 	movt	r0, #36866	; 0x9002
900182cc:	ebffeb1b 	bl	90012f40 <panic>
    }

    b->data = (uint8_t*)(tracer_mem_chunk_syner.mem_chunk_base + b->chunk_id * tracer_mem_chunk_syner.mem_chunk_size);
900182d0:	e3033900 	movw	r3, #14592	; 0x3900
900182d4:	e349301a 	movt	r3, #36890	; 0x901a
900182d8:	e5932000 	ldr	r2, [r3]
900182dc:	e51b3008 	ldr	r3, [fp, #-8]
900182e0:	e5931004 	ldr	r1, [r3, #4]
900182e4:	e3033900 	movw	r3, #14592	; 0x3900
900182e8:	e349301a 	movt	r3, #36890	; 0x901a
900182ec:	e5933004 	ldr	r3, [r3, #4]
900182f0:	e0030193 	mul	r3, r3, r1
900182f4:	e0823003 	add	r3, r2, r3
900182f8:	e1a02003 	mov	r2, r3
900182fc:	e51b3008 	ldr	r3, [fp, #-8]
90018300:	e5832010 	str	r2, [r3, #16]
    b->flag |= TRACER_MEM_CHUNK_VALID;
90018304:	e51b3008 	ldr	r3, [fp, #-8]
90018308:	e5d33000 	ldrb	r3, [r3]
9001830c:	e3833002 	orr	r3, r3, #2
90018310:	e6ef2073 	uxtb	r2, r3
90018314:	e51b3008 	ldr	r3, [fp, #-8]
90018318:	e5c32000 	strb	r2, [r3]
}
9001831c:	e320f000 	nop	{0}
90018320:	e24bd004 	sub	sp, fp, #4
90018324:	e8bd8800 	pop	{fp, pc}

90018328 <mem_chunk_synchronizer_init>:

void mem_chunk_synchronizer_init(uintptr_t mem_chunk_base, uint32_t mem_chunk_size, uint32_t nr_mem_chunks)
{
90018328:	e92d4800 	push	{fp, lr}
9001832c:	e28db004 	add	fp, sp, #4
90018330:	e24dd030 	sub	sp, sp, #48	; 0x30
90018334:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
90018338:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
9001833c:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    spinlock_init(&tracer_mem_chunk_syner.lock, "tracer_mem_chunk_syner");
90018340:	e3011a0c 	movw	r1, #6668	; 0x1a0c
90018344:	e3491002 	movt	r1, #36866	; 0x9002
90018348:	e59f0108 	ldr	r0, [pc, #264]	; 90018458 <mem_chunk_synchronizer_init+0x130>
9001834c:	ebffee7b 	bl	90013d40 <spinlock_init>
    tracer_mem_chunk_syner.mem_chunk_base = mem_chunk_base;
90018350:	e3033900 	movw	r3, #14592	; 0x3900
90018354:	e349301a 	movt	r3, #36890	; 0x901a
90018358:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001835c:	e5832000 	str	r2, [r3]
    tracer_mem_chunk_syner.mem_chunk_size = mem_chunk_size;
90018360:	e3033900 	movw	r3, #14592	; 0x3900
90018364:	e349301a 	movt	r3, #36890	; 0x901a
90018368:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001836c:	e5832004 	str	r2, [r3, #4]
    tracer_mem_chunk_syner.nr_mem_chunks = nr_mem_chunks;
90018370:	e3033900 	movw	r3, #14592	; 0x3900
90018374:	e349301a 	movt	r3, #36890	; 0x901a
90018378:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
9001837c:	e5832008 	str	r2, [r3, #8]
90018380:	e59f30d4 	ldr	r3, [pc, #212]	; 9001845c <mem_chunk_synchronizer_init+0x134>
90018384:	e50b300c 	str	r3, [fp, #-12]
         item = DOUBLE_LIST_ENTRY(item->member.prev, typeof(*item), member))

__attribute__((always_inline))
static void inline doubleListNodeInit(struct double_list_node *list)
{
    list->next = list;
90018388:	e51b300c 	ldr	r3, [fp, #-12]
9001838c:	e51b200c 	ldr	r2, [fp, #-12]
90018390:	e5832000 	str	r2, [r3]
    list->prev = list;
90018394:	e51b300c 	ldr	r3, [fp, #-12]
90018398:	e51b200c 	ldr	r2, [fp, #-12]
9001839c:	e5832004 	str	r2, [r3, #4]

    // Create linked list of buffers
    doubleListNodeInit(&tracer_mem_chunk_syner.head);
    for (struct tracer_mem_chunk* b = tracer_mem_chunk_syner.mem_chunk_access_list; b < tracer_mem_chunk_syner.mem_chunk_access_list + NR_MEM_CHUNK_CACHE; b++) {
900183a0:	e59f30b8 	ldr	r3, [pc, #184]	; 90018460 <mem_chunk_synchronizer_init+0x138>
900183a4:	e50b3008 	str	r3, [fp, #-8]
900183a8:	ea000023 	b	9001843c <mem_chunk_synchronizer_init+0x114>
        doubleListNodeInit(&b->list_node);
900183ac:	e51b3008 	ldr	r3, [fp, #-8]
900183b0:	e2833008 	add	r3, r3, #8
900183b4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    list->next = list;
900183b8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900183bc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
900183c0:	e5832000 	str	r2, [r3]
    list->prev = list;
900183c4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900183c8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
900183cc:	e5832004 	str	r2, [r3, #4]
        doubleListAddOnHead(&b->list_node, &tracer_mem_chunk_syner.head);
900183d0:	e51b3008 	ldr	r3, [fp, #-8]
900183d4:	e2833008 	add	r3, r3, #8
900183d8:	e50b3010 	str	r3, [fp, #-16]
900183dc:	e59f3078 	ldr	r3, [pc, #120]	; 9001845c <mem_chunk_synchronizer_init+0x134>
900183e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    prev->next = next;
}

__attribute__((always_inline)) static void inline doubleListAddOnHead(struct double_list_node* new_node, struct double_list_node* head)
{
    _double_list_add(new_node, head, head->next);
900183e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900183e8:	e5933000 	ldr	r3, [r3]
900183ec:	e51b2010 	ldr	r2, [fp, #-16]
900183f0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
900183f4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
900183f8:	e50b201c 	str	r2, [fp, #-28]	; 0xffffffe4
900183fc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    next->prev = new_node;
90018400:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90018404:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90018408:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001840c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018410:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90018414:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
90018418:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001841c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90018420:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
90018424:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90018428:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001842c:	e5832000 	str	r2, [r3]
    for (struct tracer_mem_chunk* b = tracer_mem_chunk_syner.mem_chunk_access_list; b < tracer_mem_chunk_syner.mem_chunk_access_list + NR_MEM_CHUNK_CACHE; b++) {
90018430:	e51b3008 	ldr	r3, [fp, #-8]
90018434:	e2833014 	add	r3, r3, #20
90018438:	e50b3008 	str	r3, [fp, #-8]
9001843c:	e59f2018 	ldr	r2, [pc, #24]	; 9001845c <mem_chunk_synchronizer_init+0x134>
90018440:	e51b3008 	ldr	r3, [fp, #-8]
90018444:	e1530002 	cmp	r3, r2
90018448:	3affffd7 	bcc	900183ac <mem_chunk_synchronizer_init+0x84>
    }
}
9001844c:	e320f000 	nop	{0}
90018450:	e24bd004 	sub	sp, fp, #4
90018454:	e8bd8800 	pop	{fp, pc}
90018458:	901a3920 	.word	0x901a3920
9001845c:	901a4340 	.word	0x901a4340
90018460:	901a3940 	.word	0x901a3940

90018464 <tracer_get_mem_chunk_cache>:

static struct tracer_mem_chunk* tracer_get_mem_chunk_cache(uint32_t chunk_id)
{
90018464:	e92d4800 	push	{fp, lr}
90018468:	e28db004 	add	fp, sp, #4
9001846c:	e24dd010 	sub	sp, sp, #16
90018470:	e50b0010 	str	r0, [fp, #-16]
    spinlock_lock(&tracer_mem_chunk_syner.lock);
90018474:	e59f0150 	ldr	r0, [pc, #336]	; 900185cc <tracer_get_mem_chunk_cache+0x168>
90018478:	ebffee41 	bl	90013d84 <spinlock_lock>

    // cached mem_chunk cache
    struct tracer_mem_chunk* b;
    DOUBLE_LIST_FOR_EACH_ENTRY(b, &tracer_mem_chunk_syner.head, list_node)
9001847c:	e3033900 	movw	r3, #14592	; 0x3900
90018480:	e349301a 	movt	r3, #36890	; 0x901a
90018484:	e5933a40 	ldr	r3, [r3, #2624]	; 0xa40
90018488:	e2433008 	sub	r3, r3, #8
9001848c:	e50b3008 	str	r3, [fp, #-8]
90018490:	ea000023 	b	90018524 <tracer_get_mem_chunk_cache+0xc0>
    {
        if (b->chunk_id == chunk_id) {
90018494:	e51b3008 	ldr	r3, [fp, #-8]
90018498:	e5932004 	ldr	r2, [r3, #4]
9001849c:	e51b3010 	ldr	r3, [fp, #-16]
900184a0:	e1520003 	cmp	r2, r3
900184a4:	1a00001a 	bne	90018514 <tracer_get_mem_chunk_cache+0xb0>
            if (!(b->flag & TRACER_MEM_CHUNK_BUSY)) {
900184a8:	e51b3008 	ldr	r3, [fp, #-8]
900184ac:	e5d33000 	ldrb	r3, [r3]
900184b0:	e2033001 	and	r3, r3, #1
900184b4:	e3530000 	cmp	r3, #0
900184b8:	1a000009 	bne	900184e4 <tracer_get_mem_chunk_cache+0x80>
                b->flag |= TRACER_MEM_CHUNK_BUSY;
900184bc:	e51b3008 	ldr	r3, [fp, #-8]
900184c0:	e5d33000 	ldrb	r3, [r3]
900184c4:	e3833001 	orr	r3, r3, #1
900184c8:	e6ef2073 	uxtb	r2, r3
900184cc:	e51b3008 	ldr	r3, [fp, #-8]
900184d0:	e5c32000 	strb	r2, [r3]
                spinlock_unlock(&tracer_mem_chunk_syner.lock);
900184d4:	e59f00f0 	ldr	r0, [pc, #240]	; 900185cc <tracer_get_mem_chunk_cache+0x168>
900184d8:	ebffee59 	bl	90013e44 <spinlock_unlock>
                return b;
900184dc:	e51b3008 	ldr	r3, [fp, #-8]
900184e0:	ea000036 	b	900185c0 <tracer_get_mem_chunk_cache+0x15c>
            }
            ERROR("tracer mem_chunk syner is locked\n");
900184e4:	e3a0205b 	mov	r2, #91	; 0x5b
900184e8:	e3011bcc 	movw	r1, #7116	; 0x1bcc
900184ec:	e3491002 	movt	r1, #36866	; 0x9002
900184f0:	e3010a24 	movw	r0, #6692	; 0x1a24
900184f4:	e3490002 	movt	r0, #36866	; 0x9002
900184f8:	ebfff39e 	bl	90015378 <KPrintf>
900184fc:	e3010a34 	movw	r0, #6708	; 0x1a34
90018500:	e3490002 	movt	r0, #36866	; 0x9002
90018504:	ebfff39b 	bl	90015378 <KPrintf>
            panic("");
90018508:	e3010a58 	movw	r0, #6744	; 0x1a58
9001850c:	e3490002 	movt	r0, #36866	; 0x9002
90018510:	ebffea8a 	bl	90012f40 <panic>
    DOUBLE_LIST_FOR_EACH_ENTRY(b, &tracer_mem_chunk_syner.head, list_node)
90018514:	e51b3008 	ldr	r3, [fp, #-8]
90018518:	e5933008 	ldr	r3, [r3, #8]
9001851c:	e2433008 	sub	r3, r3, #8
90018520:	e50b3008 	str	r3, [fp, #-8]
90018524:	e51b3008 	ldr	r3, [fp, #-8]
90018528:	e2833008 	add	r3, r3, #8
9001852c:	e59f209c 	ldr	r2, [pc, #156]	; 900185d0 <tracer_get_mem_chunk_cache+0x16c>
90018530:	e1530002 	cmp	r3, r2
90018534:	1affffd6 	bne	90018494 <tracer_get_mem_chunk_cache+0x30>
        }
    }

    // Non-cached mem_chunk cache
    DOUBLE_LIST_FOR_EACH_ENTRY_REVERSE(b, &tracer_mem_chunk_syner.head, list_node)
90018538:	e3033900 	movw	r3, #14592	; 0x3900
9001853c:	e349301a 	movt	r3, #36890	; 0x901a
90018540:	e5933a44 	ldr	r3, [r3, #2628]	; 0xa44
90018544:	e2433008 	sub	r3, r3, #8
90018548:	e50b3008 	str	r3, [fp, #-8]
9001854c:	ea000012 	b	9001859c <tracer_get_mem_chunk_cache+0x138>
    {
        if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
90018550:	e51b3008 	ldr	r3, [fp, #-8]
90018554:	e5d33000 	ldrb	r3, [r3]
90018558:	e2033001 	and	r3, r3, #1
9001855c:	e3530000 	cmp	r3, #0
90018560:	1a000009 	bne	9001858c <tracer_get_mem_chunk_cache+0x128>
            b->chunk_id = chunk_id;
90018564:	e51b3008 	ldr	r3, [fp, #-8]
90018568:	e51b2010 	ldr	r2, [fp, #-16]
9001856c:	e5832004 	str	r2, [r3, #4]
            b->flag = TRACER_MEM_CHUNK_BUSY;
90018570:	e51b3008 	ldr	r3, [fp, #-8]
90018574:	e3a02001 	mov	r2, #1
90018578:	e5c32000 	strb	r2, [r3]
            spinlock_unlock(&tracer_mem_chunk_syner.lock);
9001857c:	e59f0048 	ldr	r0, [pc, #72]	; 900185cc <tracer_get_mem_chunk_cache+0x168>
90018580:	ebffee2f 	bl	90013e44 <spinlock_unlock>
            return b;
90018584:	e51b3008 	ldr	r3, [fp, #-8]
90018588:	ea00000c 	b	900185c0 <tracer_get_mem_chunk_cache+0x15c>
    DOUBLE_LIST_FOR_EACH_ENTRY_REVERSE(b, &tracer_mem_chunk_syner.head, list_node)
9001858c:	e51b3008 	ldr	r3, [fp, #-8]
90018590:	e593300c 	ldr	r3, [r3, #12]
90018594:	e2433008 	sub	r3, r3, #8
90018598:	e50b3008 	str	r3, [fp, #-8]
9001859c:	e51b3008 	ldr	r3, [fp, #-8]
900185a0:	e2833008 	add	r3, r3, #8
900185a4:	e59f2024 	ldr	r2, [pc, #36]	; 900185d0 <tracer_get_mem_chunk_cache+0x16c>
900185a8:	e1530002 	cmp	r3, r2
900185ac:	1affffe7 	bne	90018550 <tracer_get_mem_chunk_cache+0xec>
        }
    }

    panic("tracer_get_mem_chunk_cache: no cache");
900185b0:	e3010a5c 	movw	r0, #6748	; 0x1a5c
900185b4:	e3490002 	movt	r0, #36866	; 0x9002
900185b8:	ebffea60 	bl	90012f40 <panic>
    return NULL;
900185bc:	e3a03000 	mov	r3, #0
}
900185c0:	e1a00003 	mov	r0, r3
900185c4:	e24bd004 	sub	sp, fp, #4
900185c8:	e8bd8800 	pop	{fp, pc}
900185cc:	901a3920 	.word	0x901a3920
900185d0:	901a4340 	.word	0x901a4340

900185d4 <tracer_mem_chunk_read>:

// Return a TRACER_MEM_CHUNK_BUSY buf with the contents of the indicated disk sector.
struct tracer_mem_chunk* tracer_mem_chunk_read(uint32_t chunk_id)
{
900185d4:	e92d4800 	push	{fp, lr}
900185d8:	e28db004 	add	fp, sp, #4
900185dc:	e24dd010 	sub	sp, sp, #16
900185e0:	e50b0010 	str	r0, [fp, #-16]
    struct tracer_mem_chunk* b = tracer_get_mem_chunk_cache(chunk_id);
900185e4:	e51b0010 	ldr	r0, [fp, #-16]
900185e8:	ebffff9d 	bl	90018464 <tracer_get_mem_chunk_cache>
900185ec:	e50b0008 	str	r0, [fp, #-8]
    if (!(b->flag & TRACER_MEM_CHUNK_VALID)) {
900185f0:	e51b3008 	ldr	r3, [fp, #-8]
900185f4:	e5d33000 	ldrb	r3, [r3]
900185f8:	e2033002 	and	r3, r3, #2
900185fc:	e3530000 	cmp	r3, #0
90018600:	1a000007 	bne	90018624 <tracer_mem_chunk_read+0x50>
        tracer_mem_chunk_sync(b);
90018604:	e51b0008 	ldr	r0, [fp, #-8]
90018608:	ebffff1a 	bl	90018278 <tracer_mem_chunk_sync>
        b->flag |= TRACER_MEM_CHUNK_VALID;
9001860c:	e51b3008 	ldr	r3, [fp, #-8]
90018610:	e5d33000 	ldrb	r3, [r3]
90018614:	e3833002 	orr	r3, r3, #2
90018618:	e6ef2073 	uxtb	r2, r3
9001861c:	e51b3008 	ldr	r3, [fp, #-8]
90018620:	e5c32000 	strb	r2, [r3]
    }
    return b;
90018624:	e51b3008 	ldr	r3, [fp, #-8]
}
90018628:	e1a00003 	mov	r0, r3
9001862c:	e24bd004 	sub	sp, fp, #4
90018630:	e8bd8800 	pop	{fp, pc}

90018634 <tracer_mem_chunk_write>:

void tracer_mem_chunk_write(struct tracer_mem_chunk* b)
{
90018634:	e92d4800 	push	{fp, lr}
90018638:	e28db004 	add	fp, sp, #4
9001863c:	e24dd008 	sub	sp, sp, #8
90018640:	e50b0008 	str	r0, [fp, #-8]
    if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
90018644:	e51b3008 	ldr	r3, [fp, #-8]
90018648:	e5d33000 	ldrb	r3, [r3]
9001864c:	e2033001 	and	r3, r3, #1
90018650:	e3530000 	cmp	r3, #0
90018654:	1a000002 	bne	90018664 <tracer_mem_chunk_write+0x30>
        panic("tracer mem_chunk write a no busy mem_chunk");
90018658:	e3010a84 	movw	r0, #6788	; 0x1a84
9001865c:	e3490002 	movt	r0, #36866	; 0x9002
90018660:	ebffea36 	bl	90012f40 <panic>
    }
    tracer_mem_chunk_sync(b);
90018664:	e51b0008 	ldr	r0, [fp, #-8]
90018668:	ebffff02 	bl	90018278 <tracer_mem_chunk_sync>
}
9001866c:	e320f000 	nop	{0}
90018670:	e24bd004 	sub	sp, fp, #4
90018674:	e8bd8800 	pop	{fp, pc}

90018678 <tracer_mem_chunk_release>:

void tracer_mem_chunk_release(struct tracer_mem_chunk* b)
{
90018678:	e92d4800 	push	{fp, lr}
9001867c:	e28db004 	add	fp, sp, #4
90018680:	e24dd028 	sub	sp, sp, #40	; 0x28
90018684:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    if ((b->flag & TRACER_MEM_CHUNK_BUSY) == 0) {
90018688:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001868c:	e5d33000 	ldrb	r3, [r3]
90018690:	e2033001 	and	r3, r3, #1
90018694:	e3530000 	cmp	r3, #0
90018698:	1a000002 	bne	900186a8 <tracer_mem_chunk_release+0x30>
        panic("tracer mem_chunk release but it's busy occupied");
9001869c:	e3010ab0 	movw	r0, #6832	; 0x1ab0
900186a0:	e3490002 	movt	r0, #36866	; 0x9002
900186a4:	ebffea25 	bl	90012f40 <panic>
    }

    // move mem_chunk that just used to the head of cache list
    spinlock_lock(&tracer_mem_chunk_syner.lock);
900186a8:	e59f00e0 	ldr	r0, [pc, #224]	; 90018790 <tracer_mem_chunk_release+0x118>
900186ac:	ebffedb4 	bl	90013d84 <spinlock_lock>

    doubleListDel(&b->list_node);
900186b0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
900186b4:	e2833008 	add	r3, r3, #8
900186b8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
}

__attribute__((always_inline))
static void inline doubleListDel(struct double_list_node *entry)
{
    _double_list_del(entry->prev, entry->next);
900186bc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900186c0:	e5932004 	ldr	r2, [r3, #4]
900186c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900186c8:	e5933000 	ldr	r3, [r3]
900186cc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
900186d0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    next->prev = prev;
900186d4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900186d8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900186dc:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
900186e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900186e4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
900186e8:	e5832000 	str	r2, [r3]
    entry->next = entry;
900186ec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900186f0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
900186f4:	e5832000 	str	r2, [r3]
    entry->prev = entry;
900186f8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900186fc:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90018700:	e5832004 	str	r2, [r3, #4]
    doubleListAddOnHead(&b->list_node, &tracer_mem_chunk_syner.head);
90018704:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90018708:	e2833008 	add	r3, r3, #8
9001870c:	e50b3008 	str	r3, [fp, #-8]
90018710:	e59f307c 	ldr	r3, [pc, #124]	; 90018794 <tracer_mem_chunk_release+0x11c>
90018714:	e50b300c 	str	r3, [fp, #-12]
    _double_list_add(new_node, head, head->next);
90018718:	e51b300c 	ldr	r3, [fp, #-12]
9001871c:	e5933000 	ldr	r3, [r3]
90018720:	e51b2008 	ldr	r2, [fp, #-8]
90018724:	e50b2010 	str	r2, [fp, #-16]
90018728:	e51b200c 	ldr	r2, [fp, #-12]
9001872c:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
90018730:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    next->prev = new_node;
90018734:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018738:	e51b2010 	ldr	r2, [fp, #-16]
9001873c:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
90018740:	e51b3010 	ldr	r3, [fp, #-16]
90018744:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90018748:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001874c:	e51b3010 	ldr	r3, [fp, #-16]
90018750:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90018754:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
90018758:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001875c:	e51b2010 	ldr	r2, [fp, #-16]
90018760:	e5832000 	str	r2, [r3]
    b->flag &= ~TRACER_MEM_CHUNK_BUSY;
90018764:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90018768:	e5d33000 	ldrb	r3, [r3]
9001876c:	e3c33001 	bic	r3, r3, #1
90018770:	e6ef2073 	uxtb	r2, r3
90018774:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90018778:	e5c32000 	strb	r2, [r3]

    spinlock_unlock(&tracer_mem_chunk_syner.lock);
9001877c:	e59f000c 	ldr	r0, [pc, #12]	; 90018790 <tracer_mem_chunk_release+0x118>
90018780:	ebffedaf 	bl	90013e44 <spinlock_unlock>
}
90018784:	e320f000 	nop	{0}
90018788:	e24bd004 	sub	sp, fp, #4
9001878c:	e8bd8800 	pop	{fp, pc}
90018790:	901a3920 	.word	0x901a3920
90018794:	901a4340 	.word	0x901a4340

90018798 <tracer_mem_chunk_zero>:

static void tracer_mem_chunk_zero(uint32_t chunk_id)
{
90018798:	e92d4800 	push	{fp, lr}
9001879c:	e28db004 	add	fp, sp, #4
900187a0:	e24dd010 	sub	sp, sp, #16
900187a4:	e50b0010 	str	r0, [fp, #-16]
    assert(chunk_id >= 0 && chunk_id < tracer_mem_chunk_syner.nr_mem_chunks);
900187a8:	e3033900 	movw	r3, #14592	; 0x3900
900187ac:	e349301a 	movt	r3, #36890	; 0x901a
900187b0:	e5932008 	ldr	r2, [r3, #8]
900187b4:	e51b3010 	ldr	r3, [fp, #-16]
900187b8:	e1520003 	cmp	r2, r3
900187bc:	8a00000d 	bhi	900187f8 <tracer_mem_chunk_zero+0x60>
900187c0:	e3a02094 	mov	r2, #148	; 0x94
900187c4:	e3011be8 	movw	r1, #7144	; 0x1be8
900187c8:	e3491002 	movt	r1, #36866	; 0x9002
900187cc:	e3010a24 	movw	r0, #6692	; 0x1a24
900187d0:	e3490002 	movt	r0, #36866	; 0x9002
900187d4:	ebfff2e7 	bl	90015378 <KPrintf>
900187d8:	e3011ae0 	movw	r1, #6880	; 0x1ae0
900187dc:	e3491002 	movt	r1, #36866	; 0x9002
900187e0:	e3010b24 	movw	r0, #6948	; 0x1b24
900187e4:	e3490002 	movt	r0, #36866	; 0x9002
900187e8:	ebfff2e2 	bl	90015378 <KPrintf>
900187ec:	e3010b34 	movw	r0, #6964	; 0x1b34
900187f0:	e3490002 	movt	r0, #36866	; 0x9002
900187f4:	ebffe9d1 	bl	90012f40 <panic>
    struct tracer_mem_chunk* tracer_mem_chunk = NULL;
900187f8:	e3a03000 	mov	r3, #0
900187fc:	e50b3008 	str	r3, [fp, #-8]
    tracer_mem_chunk = tracer_mem_chunk_read(chunk_id);
90018800:	e51b0010 	ldr	r0, [fp, #-16]
90018804:	ebffff72 	bl	900185d4 <tracer_mem_chunk_read>
90018808:	e50b0008 	str	r0, [fp, #-8]
    memset(tracer_mem_chunk->data, 0, tracer_mem_chunk_syner.mem_chunk_size);
9001880c:	e51b3008 	ldr	r3, [fp, #-8]
90018810:	e5930010 	ldr	r0, [r3, #16]
90018814:	e3033900 	movw	r3, #14592	; 0x3900
90018818:	e349301a 	movt	r3, #36890	; 0x901a
9001881c:	e5933004 	ldr	r3, [r3, #4]
90018820:	e1a02003 	mov	r2, r3
90018824:	e3a01000 	mov	r1, #0
90018828:	fa002051 	blx	90020974 <memset>
    tracer_mem_chunk_write(tracer_mem_chunk);
9001882c:	e51b0008 	ldr	r0, [fp, #-8]
90018830:	ebffff7f 	bl	90018634 <tracer_mem_chunk_write>
    tracer_mem_chunk_release(tracer_mem_chunk);
90018834:	e51b0008 	ldr	r0, [fp, #-8]
90018838:	ebffff8e 	bl	90018678 <tracer_mem_chunk_release>
}
9001883c:	e320f000 	nop	{0}
90018840:	e24bd004 	sub	sp, fp, #4
90018844:	e8bd8800 	pop	{fp, pc}

90018848 <find_first_free_mem_chunk>:

/// @return mem_chunk_idx in bit_map
static uint32_t find_first_free_mem_chunk()
{
90018848:	e92d4800 	push	{fp, lr}
9001884c:	e28db004 	add	fp, sp, #4
90018850:	e24dd008 	sub	sp, sp, #8
    /// @todo another mem_chunk
    spinlock_lock(&sys_tracer.mem_chunk_bitmap_lock);
90018854:	e59f00f4 	ldr	r0, [pc, #244]	; 90018950 <find_first_free_mem_chunk+0x108>
90018858:	ebffed49 	bl	90013d84 <spinlock_lock>
    for (uint32_t idx = 0; idx < BITS_MEM_CHUNK_BITMAP; idx++) {
9001885c:	e3a03000 	mov	r3, #0
90018860:	e50b3008 	str	r3, [fp, #-8]
90018864:	ea00002d 	b	90018920 <find_first_free_mem_chunk+0xd8>
        if (sys_tracer.mem_chunks_bit_map[idx] == 0xFFFFFFFF) {
90018868:	e30a3880 	movw	r3, #43136	; 0xa880
9001886c:	e3493019 	movt	r3, #36889	; 0x9019
90018870:	e51b2008 	ldr	r2, [fp, #-8]
90018874:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90018878:	e3730001 	cmn	r3, #1
9001887c:	0a000023 	beq	90018910 <find_first_free_mem_chunk+0xc8>
            continue;
        }
        uint32_t position = __builtin_ffs(~sys_tracer.mem_chunks_bit_map[idx]);
90018880:	e30a3880 	movw	r3, #43136	; 0xa880
90018884:	e3493019 	movt	r3, #36889	; 0x9019
90018888:	e51b2008 	ldr	r2, [fp, #-8]
9001888c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90018890:	e1e03003 	mvn	r3, r3
90018894:	e1a02003 	mov	r2, r3
90018898:	e6ff3f32 	rbit	r3, r2
9001889c:	e16f3f13 	clz	r3, r3
900188a0:	e3520000 	cmp	r2, #0
900188a4:	1a000000 	bne	900188ac <find_first_free_mem_chunk+0x64>
900188a8:	e3e03000 	mvn	r3, #0
900188ac:	e2833001 	add	r3, r3, #1
900188b0:	e50b300c 	str	r3, [fp, #-12]
        if (position != 32) {
900188b4:	e51b300c 	ldr	r3, [fp, #-12]
900188b8:	e3530020 	cmp	r3, #32
900188bc:	0a000014 	beq	90018914 <find_first_free_mem_chunk+0xcc>
            sys_tracer.mem_chunks_bit_map[idx] |= (1 << (position - 1));
900188c0:	e30a3880 	movw	r3, #43136	; 0xa880
900188c4:	e3493019 	movt	r3, #36889	; 0x9019
900188c8:	e51b2008 	ldr	r2, [fp, #-8]
900188cc:	e7933102 	ldr	r3, [r3, r2, lsl #2]
900188d0:	e51b200c 	ldr	r2, [fp, #-12]
900188d4:	e2422001 	sub	r2, r2, #1
900188d8:	e3a01001 	mov	r1, #1
900188dc:	e1a02211 	lsl	r2, r1, r2
900188e0:	e1831002 	orr	r1, r3, r2
900188e4:	e30a3880 	movw	r3, #43136	; 0xa880
900188e8:	e3493019 	movt	r3, #36889	; 0x9019
900188ec:	e51b2008 	ldr	r2, [fp, #-8]
900188f0:	e7831102 	str	r1, [r3, r2, lsl #2]
            spinlock_unlock(&sys_tracer.mem_chunk_bitmap_lock);
900188f4:	e59f0054 	ldr	r0, [pc, #84]	; 90018950 <find_first_free_mem_chunk+0x108>
900188f8:	ebffed51 	bl	90013e44 <spinlock_unlock>
            return idx * 32 + position;
900188fc:	e51b3008 	ldr	r3, [fp, #-8]
90018900:	e1a02283 	lsl	r2, r3, #5
90018904:	e51b300c 	ldr	r3, [fp, #-12]
90018908:	e0823003 	add	r3, r2, r3
9001890c:	ea00000c 	b	90018944 <find_first_free_mem_chunk+0xfc>
            continue;
90018910:	e320f000 	nop	{0}
    for (uint32_t idx = 0; idx < BITS_MEM_CHUNK_BITMAP; idx++) {
90018914:	e51b3008 	ldr	r3, [fp, #-8]
90018918:	e2833001 	add	r3, r3, #1
9001891c:	e50b3008 	str	r3, [fp, #-8]
90018920:	e51b3008 	ldr	r3, [fp, #-8]
90018924:	e3530007 	cmp	r3, #7
90018928:	9affffce 	bls	90018868 <find_first_free_mem_chunk+0x20>
        }
    }
    spinlock_unlock(&sys_tracer.mem_chunk_bitmap_lock);
9001892c:	e59f001c 	ldr	r0, [pc, #28]	; 90018950 <find_first_free_mem_chunk+0x108>
90018930:	ebffed43 	bl	90013e44 <spinlock_unlock>
    panic("Tracer no enough space.");
90018934:	e3010b38 	movw	r0, #6968	; 0x1b38
90018938:	e3490002 	movt	r0, #36866	; 0x9002
9001893c:	ebffe97f 	bl	90012f40 <panic>
    return 0;
90018940:	e3a03000 	mov	r3, #0
}
90018944:	e1a00003 	mov	r0, r3
90018948:	e24bd004 	sub	sp, fp, #4
9001894c:	e8bd8800 	pop	{fp, pc}
90018950:	9019a8a0 	.word	0x9019a8a0

90018954 <tracer_mem_chunk_alloc>:

uint32_t tracer_mem_chunk_alloc()
{
90018954:	e92d4800 	push	{fp, lr}
90018958:	e28db004 	add	fp, sp, #4
9001895c:	e24dd008 	sub	sp, sp, #8
    tracer_mem_chunk_idx_t idx = find_first_free_mem_chunk();
90018960:	ebffffb8 	bl	90018848 <find_first_free_mem_chunk>
90018964:	e1a03000 	mov	r3, r0
90018968:	e14b30b6 	strh	r3, [fp, #-6]
    tracer_mem_chunk_zero(idx);
9001896c:	e15b30b6 	ldrh	r3, [fp, #-6]
90018970:	e1a00003 	mov	r0, r3
90018974:	ebffff87 	bl	90018798 <tracer_mem_chunk_zero>
    return idx;
90018978:	e15b30b6 	ldrh	r3, [fp, #-6]
}
9001897c:	e1a00003 	mov	r0, r3
90018980:	e24bd004 	sub	sp, fp, #4
90018984:	e8bd8800 	pop	{fp, pc}

90018988 <tracer_mem_chunk_free>:

void tracer_mem_chunk_free(uint32_t chunk_id)
{
90018988:	e92d4800 	push	{fp, lr}
9001898c:	e28db004 	add	fp, sp, #4
90018990:	e24dd010 	sub	sp, sp, #16
90018994:	e50b0010 	str	r0, [fp, #-16]
    assert(chunk_id >= 0 && chunk_id < NR_TRACER_MEM_CHUNKS);
90018998:	e51b3010 	ldr	r3, [fp, #-16]
9001899c:	e35300ff 	cmp	r3, #255	; 0xff
900189a0:	9a00000d 	bls	900189dc <tracer_mem_chunk_free+0x54>
900189a4:	e3a020ba 	mov	r2, #186	; 0xba
900189a8:	e3011c00 	movw	r1, #7168	; 0x1c00
900189ac:	e3491002 	movt	r1, #36866	; 0x9002
900189b0:	e3010a24 	movw	r0, #6692	; 0x1a24
900189b4:	e3490002 	movt	r0, #36866	; 0x9002
900189b8:	ebfff26e 	bl	90015378 <KPrintf>
900189bc:	e3011b50 	movw	r1, #6992	; 0x1b50
900189c0:	e3491002 	movt	r1, #36866	; 0x9002
900189c4:	e3010b24 	movw	r0, #6948	; 0x1b24
900189c8:	e3490002 	movt	r0, #36866	; 0x9002
900189cc:	ebfff269 	bl	90015378 <KPrintf>
900189d0:	e3010b34 	movw	r0, #6964	; 0x1b34
900189d4:	e3490002 	movt	r0, #36866	; 0x9002
900189d8:	ebffe958 	bl	90012f40 <panic>
    spinlock_lock(&sys_tracer.mem_chunk_bitmap_lock);
900189dc:	e59f00c0 	ldr	r0, [pc, #192]	; 90018aa4 <tracer_mem_chunk_free+0x11c>
900189e0:	ebffece7 	bl	90013d84 <spinlock_lock>
    uint32_t idx = chunk_id % 32;
900189e4:	e51b3010 	ldr	r3, [fp, #-16]
900189e8:	e203301f 	and	r3, r3, #31
900189ec:	e50b3008 	str	r3, [fp, #-8]
    uint32_t inner_mem_chunk_bit = chunk_id / 32;
900189f0:	e51b3010 	ldr	r3, [fp, #-16]
900189f4:	e1a032a3 	lsr	r3, r3, #5
900189f8:	e50b300c 	str	r3, [fp, #-12]
    // assert mem_chunk is allocated
    assert((sys_tracer.mem_chunks_bit_map[idx] & (1 << inner_mem_chunk_bit)) != 0);
900189fc:	e30a3880 	movw	r3, #43136	; 0xa880
90018a00:	e3493019 	movt	r3, #36889	; 0x9019
90018a04:	e51b2008 	ldr	r2, [fp, #-8]
90018a08:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90018a0c:	e3a01001 	mov	r1, #1
90018a10:	e51b200c 	ldr	r2, [fp, #-12]
90018a14:	e1a02211 	lsl	r2, r1, r2
90018a18:	e0033002 	and	r3, r3, r2
90018a1c:	e3530000 	cmp	r3, #0
90018a20:	1a00000d 	bne	90018a5c <tracer_mem_chunk_free+0xd4>
90018a24:	e3a020bf 	mov	r2, #191	; 0xbf
90018a28:	e3011c00 	movw	r1, #7168	; 0x1c00
90018a2c:	e3491002 	movt	r1, #36866	; 0x9002
90018a30:	e3010a24 	movw	r0, #6692	; 0x1a24
90018a34:	e3490002 	movt	r0, #36866	; 0x9002
90018a38:	ebfff24e 	bl	90015378 <KPrintf>
90018a3c:	e3011b84 	movw	r1, #7044	; 0x1b84
90018a40:	e3491002 	movt	r1, #36866	; 0x9002
90018a44:	e3010b24 	movw	r0, #6948	; 0x1b24
90018a48:	e3490002 	movt	r0, #36866	; 0x9002
90018a4c:	ebfff249 	bl	90015378 <KPrintf>
90018a50:	e3010b34 	movw	r0, #6964	; 0x1b34
90018a54:	e3490002 	movt	r0, #36866	; 0x9002
90018a58:	ebffe938 	bl	90012f40 <panic>
    sys_tracer.mem_chunks_bit_map[idx] &= (uint32_t)(~(1 << inner_mem_chunk_bit));
90018a5c:	e30a3880 	movw	r3, #43136	; 0xa880
90018a60:	e3493019 	movt	r3, #36889	; 0x9019
90018a64:	e51b2008 	ldr	r2, [fp, #-8]
90018a68:	e7933102 	ldr	r3, [r3, r2, lsl #2]
90018a6c:	e3a01001 	mov	r1, #1
90018a70:	e51b200c 	ldr	r2, [fp, #-12]
90018a74:	e1a02211 	lsl	r2, r1, r2
90018a78:	e1e02002 	mvn	r2, r2
90018a7c:	e0031002 	and	r1, r3, r2
90018a80:	e30a3880 	movw	r3, #43136	; 0xa880
90018a84:	e3493019 	movt	r3, #36889	; 0x9019
90018a88:	e51b2008 	ldr	r2, [fp, #-8]
90018a8c:	e7831102 	str	r1, [r3, r2, lsl #2]
    spinlock_unlock(&sys_tracer.mem_chunk_bitmap_lock);
90018a90:	e59f000c 	ldr	r0, [pc, #12]	; 90018aa4 <tracer_mem_chunk_free+0x11c>
90018a94:	ebffecea 	bl	90013e44 <spinlock_unlock>
90018a98:	e320f000 	nop	{0}
90018a9c:	e24bd004 	sub	sp, fp, #4
90018aa0:	e8bd8800 	pop	{fp, pc}
90018aa4:	9019a8a0 	.word	0x9019a8a0

90018aa8 <softkernel_init>:
#include "kalloc.h"
#include "log.h"
#include "task.h"

bool softkernel_init(struct TraceTag* _hardkernel_tag, struct TraceTag* _softkernel_tag)
{
90018aa8:	e92d4800 	push	{fp, lr}
90018aac:	e28db004 	add	fp, sp, #4
90018ab0:	e24dd038 	sub	sp, sp, #56	; 0x38
90018ab4:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
90018ab8:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    struct TraceTag server_identifier_owner;
    CreateResourceTag(&server_identifier_owner, _softkernel_tag, "server-identifier", TRACER_OWNER, NULL);
90018abc:	e24b000c 	sub	r0, fp, #12
90018ac0:	e3a03000 	mov	r3, #0
90018ac4:	e58d3000 	str	r3, [sp]
90018ac8:	e3a03001 	mov	r3, #1
90018acc:	e3012c18 	movw	r2, #7192	; 0x1c18
90018ad0:	e3492002 	movt	r2, #36866	; 0x9002
90018ad4:	e51b1034 	ldr	r1, [fp, #-52]	; 0xffffffcc
90018ad8:	ebfffda5 	bl	90018174 <CreateResourceTag>

    /* init soft kernel */
    module_phymem_init(); // init buddy management system
90018adc:	eb000043 	bl	90018bf0 <module_phymem_init>

    struct PagerRightGroup pager_rights = { 0 };
90018ae0:	e24b3014 	sub	r3, fp, #20
90018ae4:	e3a02000 	mov	r2, #0
90018ae8:	e5832000 	str	r2, [r3]
90018aec:	e5832004 	str	r2, [r3, #4]
    AchieveResourceTag(&pager_rights.mmu_driver_tag, _hardkernel_tag, "mmu-ac-resource");
90018af0:	e24b3014 	sub	r3, fp, #20
90018af4:	e3012c2c 	movw	r2, #7212	; 0x1c2c
90018af8:	e3492002 	movt	r2, #36866	; 0x9002
90018afc:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
90018b00:	e1a00003 	mov	r0, r3
90018b04:	ebfffd61 	bl	90018090 <AchieveResourceTag>
    module_pager_init(&pager_rights);
90018b08:	e24b3014 	sub	r3, fp, #20
90018b0c:	e1a00003 	mov	r0, r3
90018b10:	eb00031b 	bl	90019784 <module_pager_init>

    struct TraceTag mmu_driver_tag;
    AchieveResourceTag(&mmu_driver_tag, _hardkernel_tag, "mmu-ac-resource");
90018b14:	e24b301c 	sub	r3, fp, #28
90018b18:	e3012c2c 	movw	r2, #7212	; 0x1c2c
90018b1c:	e3492002 	movt	r2, #36866	; 0x9002
90018b20:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
90018b24:	e1a00003 	mov	r0, r3
90018b28:	ebfffd58 	bl	90018090 <AchieveResourceTag>
    load_kern_pgdir(&mmu_driver_tag); // enter kernel virtmem space
90018b2c:	e24b301c 	sub	r3, fp, #28
90018b30:	e1a00003 	mov	r0, r3
90018b34:	eb00032c 	bl	900197ec <load_kern_pgdir>

    module_task_manager_init(); // init task
90018b38:	eb000de9 	bl	9001c2e4 <module_task_manager_init>

    struct SharePageRightGroup sp_rights = { 0 };
90018b3c:	e24b302c 	sub	r3, fp, #44	; 0x2c
90018b40:	e3a02000 	mov	r2, #0
90018b44:	e5832000 	str	r2, [r3]
90018b48:	e5832004 	str	r2, [r3, #4]
90018b4c:	e5832008 	str	r2, [r3, #8]
90018b50:	e583200c 	str	r2, [r3, #12]
    AchieveResourceTag(&sp_rights.dcache_driver_tag, _hardkernel_tag, "dcache-ac-resource");
90018b54:	e24b302c 	sub	r3, fp, #44	; 0x2c
90018b58:	e3012c3c 	movw	r2, #7228	; 0x1c3c
90018b5c:	e3492002 	movt	r2, #36866	; 0x9002
90018b60:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
90018b64:	e1a00003 	mov	r0, r3
90018b68:	ebfffd48 	bl	90018090 <AchieveResourceTag>
    AchieveResourceTag(&sp_rights.mmu_driver_tag, _hardkernel_tag, "mmu-ac-resource");
90018b6c:	e24b302c 	sub	r3, fp, #44	; 0x2c
90018b70:	e2833008 	add	r3, r3, #8
90018b74:	e3012c2c 	movw	r2, #7212	; 0x1c2c
90018b78:	e3492002 	movt	r2, #36866	; 0x9002
90018b7c:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
90018b80:	e1a00003 	mov	r0, r3
90018b84:	ebfffd41 	bl	90018090 <AchieveResourceTag>
    module_share_page_init(&sp_rights);
90018b88:	e24b302c 	sub	r3, fp, #44	; 0x2c
90018b8c:	e1a00003 	mov	r0, r3
90018b90:	eb001d94 	bl	900201e8 <module_share_page_init>

    return true;
90018b94:	e3a03001 	mov	r3, #1
}
90018b98:	e1a00003 	mov	r0, r3
90018b9c:	e24bd004 	sub	sp, fp, #4
90018ba0:	e8bd8800 	pop	{fp, pc}

90018ba4 <show_xizi_bar>:

void show_xizi_bar(void)
{
90018ba4:	e92d4800 	push	{fp, lr}
90018ba8:	e28db004 	add	fp, sp, #4
    LOG_PRINTF("__  _____ ________     __  __ ___ ____ ____   ___\n");
90018bac:	e3010c50 	movw	r0, #7248	; 0x1c50
90018bb0:	e3490002 	movt	r0, #36866	; 0x9002
90018bb4:	ebfff1ef 	bl	90015378 <KPrintf>
    LOG_PRINTF("\\ \\/ /_ _|__  /_ _|   |  \\/  |_ _/ ___|  _ \\ / _ \\\n");
90018bb8:	e3010c84 	movw	r0, #7300	; 0x1c84
90018bbc:	e3490002 	movt	r0, #36866	; 0x9002
90018bc0:	ebfff1ec 	bl	90015378 <KPrintf>
    LOG_PRINTF(" \\  / | |  / / | |    | |\\/| || | |   | |_) | | | |\n");
90018bc4:	e3010cb8 	movw	r0, #7352	; 0x1cb8
90018bc8:	e3490002 	movt	r0, #36866	; 0x9002
90018bcc:	ebfff1e9 	bl	90015378 <KPrintf>
    LOG_PRINTF(" /  \\ | | / /_ | |    | |  | || | |___|  _ <| |_| |\n");
90018bd0:	e3010cf0 	movw	r0, #7408	; 0x1cf0
90018bd4:	e3490002 	movt	r0, #36866	; 0x9002
90018bd8:	ebfff1e6 	bl	90015378 <KPrintf>
    LOG_PRINTF("/_/\\_\\___/____|___|   |_|  |_|___\\____|_| \\_\\\\___/ \n");
90018bdc:	e3010d28 	movw	r0, #7464	; 0x1d28
90018be0:	e3490002 	movt	r0, #36866	; 0x9002
90018be4:	ebfff1e3 	bl	90015378 <KPrintf>
90018be8:	e320f000 	nop	{0}
90018bec:	e8bd8800 	pop	{fp, pc}

90018bf0 <module_phymem_init>:
struct KBuddy kern_virtmem_buddy;
struct KBuddy user_phy_freemem_buddy;

extern uint32_t kernel_data_end[];
bool module_phymem_init()
{
90018bf0:	e92d4800 	push	{fp, lr}
90018bf4:	e28db004 	add	fp, sp, #4
90018bf8:	e24dd010 	sub	sp, sp, #16
    LOG_PRINTF("Organizing free memory...\n");
90018bfc:	e3010d60 	movw	r0, #7520	; 0x1d60
90018c00:	e3490002 	movt	r0, #36866	; 0x9002
90018c04:	ebfff1db 	bl	90015378 <KPrintf>
    uint32_t kern_freemem_start = V2P(&kernel_data_end);
90018c08:	e3053000 	movw	r3, #20480	; 0x5000
90018c0c:	e349309a 	movt	r3, #37018	; 0x909a
90018c10:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90018c14:	e50b3008 	str	r3, [fp, #-8]
    uint32_t kern_freemem_end = PHY_USER_FREEMEM_BASE;
90018c18:	e3a03203 	mov	r3, #805306368	; 0x30000000
90018c1c:	e50b300c 	str	r3, [fp, #-12]
    uint32_t user_freemem_start = PHY_USER_FREEMEM_BASE;
90018c20:	e3a03203 	mov	r3, #805306368	; 0x30000000
90018c24:	e50b3010 	str	r3, [fp, #-16]
    uint32_t user_freemem_end = PHY_MEM_STOP;
90018c28:	e3a03205 	mov	r3, #1342177280	; 0x50000000
90018c2c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    KBuddySysInit(&kern_virtmem_buddy, kern_freemem_start, kern_freemem_end);
90018c30:	e51b200c 	ldr	r2, [fp, #-12]
90018c34:	e51b1008 	ldr	r1, [fp, #-8]
90018c38:	e3040440 	movw	r0, #17472	; 0x4440
90018c3c:	e349005a 	movt	r0, #36954	; 0x905a
90018c40:	eb0004f6 	bl	9001a020 <KBuddySysInit>
    KBuddySysInit(&user_phy_freemem_buddy, user_freemem_start, user_freemem_end);
90018c44:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90018c48:	e51b1010 	ldr	r1, [fp, #-16]
90018c4c:	e3040360 	movw	r0, #17248	; 0x4360
90018c50:	e349001a 	movt	r0, #36890	; 0x901a
90018c54:	eb0004f1 	bl	9001a020 <KBuddySysInit>
    LOG_PRINTF("Free memory organized done.\n");
90018c58:	e3010d7c 	movw	r0, #7548	; 0x1d7c
90018c5c:	e3490002 	movt	r0, #36866	; 0x9002
90018c60:	ebfff1c4 	bl	90015378 <KPrintf>
    return true;
90018c64:	e3a03001 	mov	r3, #1
}
90018c68:	e1a00003 	mov	r0, r3
90018c6c:	e24bd004 	sub	sp, fp, #4
90018c70:	e8bd8800 	pop	{fp, pc}

90018c74 <kalloc>:

char* kalloc(uint32_t size)
{
90018c74:	e92d4800 	push	{fp, lr}
90018c78:	e28db004 	add	fp, sp, #4
90018c7c:	e24dd010 	sub	sp, sp, #16
90018c80:	e50b0010 	str	r0, [fp, #-16]
    char* mem_alloc = KBuddyAlloc(&kern_virtmem_buddy, size);
90018c84:	e51b1010 	ldr	r1, [fp, #-16]
90018c88:	e3040440 	movw	r0, #17472	; 0x4440
90018c8c:	e349005a 	movt	r0, #36954	; 0x905a
90018c90:	eb000560 	bl	9001a218 <KBuddyAlloc>
90018c94:	e50b0008 	str	r0, [fp, #-8]
    if (mem_alloc == NULL) {
90018c98:	e51b3008 	ldr	r3, [fp, #-8]
90018c9c:	e3530000 	cmp	r3, #0
90018ca0:	1a000001 	bne	90018cac <kalloc+0x38>
        return NULL;
90018ca4:	e3a03000 	mov	r3, #0
90018ca8:	ea000014 	b	90018d00 <kalloc+0x8c>
    }
    mem_alloc = P2V(mem_alloc);
90018cac:	e51b3008 	ldr	r3, [fp, #-8]
90018cb0:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90018cb4:	e50b3008 	str	r3, [fp, #-8]
    if ((uintptr_t)mem_alloc < KERN_MEM_BASE) {
90018cb8:	e51b3008 	ldr	r3, [fp, #-8]
90018cbc:	e3730217 	cmn	r3, #1879048193	; 0x70000001
90018cc0:	8a000009 	bhi	90018cec <kalloc+0x78>
        DEBUG("Error Alloc: %x by size: %d (Caused by double free)\n", mem_alloc, size);
90018cc4:	e3011de4 	movw	r1, #7652	; 0x1de4
90018cc8:	e3491002 	movt	r1, #36866	; 0x9002
90018ccc:	e3010d9c 	movw	r0, #7580	; 0x1d9c
90018cd0:	e3490002 	movt	r0, #36866	; 0x9002
90018cd4:	ebfff1a7 	bl	90015378 <KPrintf>
90018cd8:	e51b2010 	ldr	r2, [fp, #-16]
90018cdc:	e51b1008 	ldr	r1, [fp, #-8]
90018ce0:	e3010dac 	movw	r0, #7596	; 0x1dac
90018ce4:	e3490002 	movt	r0, #36866	; 0x9002
90018ce8:	ebfff1a2 	bl	90015378 <KPrintf>
    }
    memset(mem_alloc, 0, size);
90018cec:	e51b2010 	ldr	r2, [fp, #-16]
90018cf0:	e3a01000 	mov	r1, #0
90018cf4:	e51b0008 	ldr	r0, [fp, #-8]
90018cf8:	fa001f1d 	blx	90020974 <memset>
    return mem_alloc;
90018cfc:	e51b3008 	ldr	r3, [fp, #-8]
}
90018d00:	e1a00003 	mov	r0, r3
90018d04:	e24bd004 	sub	sp, fp, #4
90018d08:	e8bd8800 	pop	{fp, pc}

90018d0c <kfree>:

bool kfree(char* vaddr)
{
90018d0c:	e92d4800 	push	{fp, lr}
90018d10:	e28db004 	add	fp, sp, #4
90018d14:	e24dd008 	sub	sp, sp, #8
90018d18:	e50b0008 	str	r0, [fp, #-8]
    return KBuddyFree(&kern_virtmem_buddy, V2P_WO(vaddr));
90018d1c:	e51b3008 	ldr	r3, [fp, #-8]
90018d20:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90018d24:	e1a01003 	mov	r1, r3
90018d28:	e3040440 	movw	r0, #17472	; 0x4440
90018d2c:	e349005a 	movt	r0, #36954	; 0x905a
90018d30:	eb000565 	bl	9001a2cc <KBuddyFree>
90018d34:	e1a03000 	mov	r3, r0
}
90018d38:	e1a00003 	mov	r0, r3
90018d3c:	e24bd004 	sub	sp, fp, #4
90018d40:	e8bd8800 	pop	{fp, pc}

90018d44 <raw_alloc>:

char* raw_alloc(uint32_t size)
{
90018d44:	e92d4800 	push	{fp, lr}
90018d48:	e28db004 	add	fp, sp, #4
90018d4c:	e24dd010 	sub	sp, sp, #16
90018d50:	e50b0010 	str	r0, [fp, #-16]
    char* mem_alloc = KBuddyAlloc(&user_phy_freemem_buddy, size);
90018d54:	e51b1010 	ldr	r1, [fp, #-16]
90018d58:	e3040360 	movw	r0, #17248	; 0x4360
90018d5c:	e349001a 	movt	r0, #36890	; 0x901a
90018d60:	eb00052c 	bl	9001a218 <KBuddyAlloc>
90018d64:	e50b0008 	str	r0, [fp, #-8]
    if (mem_alloc == NULL) {
90018d68:	e51b3008 	ldr	r3, [fp, #-8]
90018d6c:	e3530000 	cmp	r3, #0
90018d70:	1a000001 	bne	90018d7c <raw_alloc+0x38>
        return NULL;
90018d74:	e3a03000 	mov	r3, #0
90018d78:	ea000000 	b	90018d80 <raw_alloc+0x3c>
    }
    return mem_alloc;
90018d7c:	e51b3008 	ldr	r3, [fp, #-8]
}
90018d80:	e1a00003 	mov	r0, r3
90018d84:	e24bd004 	sub	sp, fp, #4
90018d88:	e8bd8800 	pop	{fp, pc}

90018d8c <raw_free>:

bool raw_free(char* paddr)
{
90018d8c:	e92d4800 	push	{fp, lr}
90018d90:	e28db004 	add	fp, sp, #4
90018d94:	e24dd008 	sub	sp, sp, #8
90018d98:	e50b0008 	str	r0, [fp, #-8]
    return KBuddyFree(&user_phy_freemem_buddy, paddr);
90018d9c:	e51b1008 	ldr	r1, [fp, #-8]
90018da0:	e3040360 	movw	r0, #17248	; 0x4360
90018da4:	e349001a 	movt	r0, #36890	; 0x901a
90018da8:	eb000547 	bl	9001a2cc <KBuddyFree>
90018dac:	e1a03000 	mov	r3, r0
}
90018db0:	e1a00003 	mov	r0, r3
90018db4:	e24bd004 	sub	sp, fp, #4
90018db8:	e8bd8800 	pop	{fp, pc}

90018dbc <show_phymem_info>:

void show_phymem_info()
{
90018dbc:	e92d4800 	push	{fp, lr}
90018dc0:	e28db004 	add	fp, sp, #4
    KFreePagesInfo(&user_phy_freemem_buddy);
90018dc4:	e3040360 	movw	r0, #17248	; 0x4360
90018dc8:	e349001a 	movt	r0, #36890	; 0x901a
90018dcc:	eb000592 	bl	9001a41c <KFreePagesInfo>
90018dd0:	e320f000 	nop	{0}
90018dd4:	e8bd8800 	pop	{fp, pc}

90018dd8 <_new_pgdir>:
#include "pagetable.h"

static struct PagerRightGroup right_group;
struct MmuCommonDone* _p_pgtbl_mmu_access = NULL;
static bool _new_pgdir(struct TopLevelPageDirectory* pgdir)
{
90018dd8:	e92d4800 	push	{fp, lr}
90018ddc:	e28db004 	add	fp, sp, #4
90018de0:	e24dd010 	sub	sp, sp, #16
90018de4:	e50b0010 	str	r0, [fp, #-16]
    void* new_pgdir_addr = 0;
90018de8:	e3a03000 	mov	r3, #0
90018dec:	e50b3008 	str	r3, [fp, #-8]
    if (UNLIKELY((new_pgdir_addr = kalloc(TOPLEVLE_PAGEDIR_SIZE)) == NULL)) {
90018df0:	e3a00901 	mov	r0, #16384	; 0x4000
90018df4:	ebffff9e 	bl	90018c74 <kalloc>
90018df8:	e50b0008 	str	r0, [fp, #-8]
90018dfc:	e51b3008 	ldr	r3, [fp, #-8]
90018e00:	e3530000 	cmp	r3, #0
90018e04:	03a03001 	moveq	r3, #1
90018e08:	13a03000 	movne	r3, #0
90018e0c:	e6ef3073 	uxtb	r3, r3
90018e10:	e3530000 	cmp	r3, #0
90018e14:	0a000001 	beq	90018e20 <_new_pgdir+0x48>
        return false;
90018e18:	e3a03000 	mov	r3, #0
90018e1c:	ea000007 	b	90018e40 <_new_pgdir+0x68>
    }

    pgdir->pd_addr = new_pgdir_addr;
90018e20:	e51b3010 	ldr	r3, [fp, #-16]
90018e24:	e51b2008 	ldr	r2, [fp, #-8]
90018e28:	e5832000 	str	r2, [r3]

    memset(new_pgdir_addr, 0, TOPLEVLE_PAGEDIR_SIZE);
90018e2c:	e3a02901 	mov	r2, #16384	; 0x4000
90018e30:	e3a01000 	mov	r1, #0
90018e34:	e51b0008 	ldr	r0, [fp, #-8]
90018e38:	fa001ecd 	blx	90020974 <memset>
    return true;
90018e3c:	e3a03001 	mov	r3, #1
}
90018e40:	e1a00003 	mov	r0, r3
90018e44:	e24bd004 	sub	sp, fp, #4
90018e48:	e8bd8800 	pop	{fp, pc}

90018e4c <_map_pages>:

static bool _map_pages(uintptr_t* pgdir, uintptr_t vaddr, uintptr_t paddr, uintptr_t len, uintptr_t attr)
{
90018e4c:	e92d4800 	push	{fp, lr}
90018e50:	e28db004 	add	fp, sp, #4
90018e54:	e24dd018 	sub	sp, sp, #24
90018e58:	e50b0010 	str	r0, [fp, #-16]
90018e5c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90018e60:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
90018e64:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if (len <= 0) {
90018e68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90018e6c:	e3530000 	cmp	r3, #0
90018e70:	1a000001 	bne	90018e7c <_map_pages+0x30>
        return false;
90018e74:	e3a03000 	mov	r3, #0
90018e78:	ea000041 	b	90018f84 <_map_pages+0x138>
    }
    vaddr = ALIGNDOWN(vaddr, LEVEL4_PTE_SIZE);
90018e7c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90018e80:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90018e84:	e3c3300f 	bic	r3, r3, #15
90018e88:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    paddr = ALIGNDOWN(paddr, LEVEL4_PTE_SIZE);
90018e8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018e90:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90018e94:	e3c3300f 	bic	r3, r3, #15
90018e98:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    uintptr_t vaddr_last = ALIGNDOWN(vaddr + len - 1, LEVEL4_PTE_SIZE);
90018e9c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90018ea0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90018ea4:	e0823003 	add	r3, r2, r3
90018ea8:	e2433001 	sub	r3, r3, #1
90018eac:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90018eb0:	e3c3300f 	bic	r3, r3, #15
90018eb4:	e50b3008 	str	r3, [fp, #-8]

    uintptr_t* pte;
    while (true) {
        if ((pte = _page_walk(pgdir, vaddr, true)) == 0) {
90018eb8:	e3a02001 	mov	r2, #1
90018ebc:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90018ec0:	e51b0010 	ldr	r0, [fp, #-16]
90018ec4:	eb000295 	bl	90019920 <_page_walk>
90018ec8:	e50b000c 	str	r0, [fp, #-12]
90018ecc:	e51b300c 	ldr	r3, [fp, #-12]
90018ed0:	e3530000 	cmp	r3, #0
90018ed4:	1a000001 	bne	90018ee0 <_map_pages+0x94>
            return false;
90018ed8:	e3a03000 	mov	r3, #0
90018edc:	ea000028 	b	90018f84 <_map_pages+0x138>
        }

        if (UNLIKELY(*pte != 0)) {
90018ee0:	e51b300c 	ldr	r3, [fp, #-12]
90018ee4:	e5933000 	ldr	r3, [r3]
90018ee8:	e3530000 	cmp	r3, #0
90018eec:	13a03001 	movne	r3, #1
90018ef0:	03a03000 	moveq	r3, #0
90018ef4:	e6ef3073 	uxtb	r3, r3
90018ef8:	e3530000 	cmp	r3, #0
90018efc:	0a00000e 	beq	90018f3c <_map_pages+0xf0>
            ERROR("remapping: vaddr: %x | paddr: %x | pte: %x |\n", vaddr, paddr, *pte);
90018f00:	e3a02046 	mov	r2, #70	; 0x46
90018f04:	e3011f64 	movw	r1, #8036	; 0x1f64
90018f08:	e3491002 	movt	r1, #36866	; 0x9002
90018f0c:	e3010dec 	movw	r0, #7660	; 0x1dec
90018f10:	e3490002 	movt	r0, #36866	; 0x9002
90018f14:	ebfff117 	bl	90015378 <KPrintf>
90018f18:	e51b300c 	ldr	r3, [fp, #-12]
90018f1c:	e5933000 	ldr	r3, [r3]
90018f20:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90018f24:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90018f28:	e3010dfc 	movw	r0, #7676	; 0x1dfc
90018f2c:	e3490002 	movt	r0, #36866	; 0x9002
90018f30:	ebfff110 	bl	90015378 <KPrintf>
            return false;
90018f34:	e3a03000 	mov	r3, #0
90018f38:	ea000011 	b	90018f84 <_map_pages+0x138>
        }

        *pte = paddr | attr;
90018f3c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90018f40:	e59b3004 	ldr	r3, [fp, #4]
90018f44:	e1822003 	orr	r2, r2, r3
90018f48:	e51b300c 	ldr	r3, [fp, #-12]
90018f4c:	e5832000 	str	r2, [r3]

        if (vaddr == vaddr_last) {
90018f50:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90018f54:	e51b3008 	ldr	r3, [fp, #-8]
90018f58:	e1520003 	cmp	r2, r3
90018f5c:	0a000006 	beq	90018f7c <_map_pages+0x130>
            break;
        }

        vaddr += PAGE_SIZE;
90018f60:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90018f64:	e2833a01 	add	r3, r3, #4096	; 0x1000
90018f68:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        paddr += PAGE_SIZE;
90018f6c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018f70:	e2833a01 	add	r3, r3, #4096	; 0x1000
90018f74:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if ((pte = _page_walk(pgdir, vaddr, true)) == 0) {
90018f78:	eaffffce 	b	90018eb8 <_map_pages+0x6c>
            break;
90018f7c:	e320f000 	nop	{0}
    }

    return true;
90018f80:	e3a03001 	mov	r3, #1
}
90018f84:	e1a00003 	mov	r0, r3
90018f88:	e24bd004 	sub	sp, fp, #4
90018f8c:	e8bd8800 	pop	{fp, pc}

90018f90 <_unmap_pages>:

static bool _unmap_pages(uintptr_t* pgdir, uintptr_t vaddr, uintptr_t len)
{
90018f90:	e92d4800 	push	{fp, lr}
90018f94:	e28db004 	add	fp, sp, #4
90018f98:	e24dd018 	sub	sp, sp, #24
90018f9c:	e50b0010 	str	r0, [fp, #-16]
90018fa0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
90018fa4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    if (len <= 0) {
90018fa8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018fac:	e3530000 	cmp	r3, #0
90018fb0:	1a000001 	bne	90018fbc <_unmap_pages+0x2c>
        return false;
90018fb4:	e3a03000 	mov	r3, #0
90018fb8:	ea000034 	b	90019090 <_unmap_pages+0x100>
    }
    vaddr = ALIGNDOWN(vaddr, LEVEL4_PTE_SIZE);
90018fbc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90018fc0:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90018fc4:	e3c3300f 	bic	r3, r3, #15
90018fc8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    uintptr_t vaddr_last = ALIGNDOWN(vaddr + len - 1, LEVEL4_PTE_SIZE);
90018fcc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90018fd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90018fd4:	e0823003 	add	r3, r2, r3
90018fd8:	e2433001 	sub	r3, r3, #1
90018fdc:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90018fe0:	e3c3300f 	bic	r3, r3, #15
90018fe4:	e50b3008 	str	r3, [fp, #-8]

    uintptr_t* pte;
    while (true) {
        if ((pte = _page_walk(pgdir, vaddr, true)) == 0) {
90018fe8:	e3a02001 	mov	r2, #1
90018fec:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90018ff0:	e51b0010 	ldr	r0, [fp, #-16]
90018ff4:	eb000249 	bl	90019920 <_page_walk>
90018ff8:	e50b000c 	str	r0, [fp, #-12]
90018ffc:	e51b300c 	ldr	r3, [fp, #-12]
90019000:	e3530000 	cmp	r3, #0
90019004:	1a000001 	bne	90019010 <_unmap_pages+0x80>
            return false;
90019008:	e3a03000 	mov	r3, #0
9001900c:	ea00001f 	b	90019090 <_unmap_pages+0x100>
        }

        if (*pte == 0) {
90019010:	e51b300c 	ldr	r3, [fp, #-12]
90019014:	e5933000 	ldr	r3, [r3]
90019018:	e3530000 	cmp	r3, #0
9001901c:	1a00000e 	bne	9001905c <_unmap_pages+0xcc>
            ERROR("unmap a unmapped page, vaddr: %x, pte: %x\n", vaddr, *pte);
90019020:	e3a02066 	mov	r2, #102	; 0x66
90019024:	e3011f70 	movw	r1, #8048	; 0x1f70
90019028:	e3491002 	movt	r1, #36866	; 0x9002
9001902c:	e3010dec 	movw	r0, #7660	; 0x1dec
90019030:	e3490002 	movt	r0, #36866	; 0x9002
90019034:	ebfff0cf 	bl	90015378 <KPrintf>
90019038:	e51b300c 	ldr	r3, [fp, #-12]
9001903c:	e5933000 	ldr	r3, [r3]
90019040:	e1a02003 	mov	r2, r3
90019044:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90019048:	e3010e2c 	movw	r0, #7724	; 0x1e2c
9001904c:	e3490002 	movt	r0, #36866	; 0x9002
90019050:	ebfff0c8 	bl	90015378 <KPrintf>
            return false;
90019054:	e3a03000 	mov	r3, #0
90019058:	ea00000c 	b	90019090 <_unmap_pages+0x100>
        }

        *pte = 0;
9001905c:	e51b300c 	ldr	r3, [fp, #-12]
90019060:	e3a02000 	mov	r2, #0
90019064:	e5832000 	str	r2, [r3]

        if (vaddr == vaddr_last) {
90019068:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001906c:	e51b3008 	ldr	r3, [fp, #-8]
90019070:	e1520003 	cmp	r2, r3
90019074:	0a000003 	beq	90019088 <_unmap_pages+0xf8>
            break;
        }

        vaddr += PAGE_SIZE;
90019078:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001907c:	e2833a01 	add	r3, r3, #4096	; 0x1000
90019080:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        if ((pte = _page_walk(pgdir, vaddr, true)) == 0) {
90019084:	eaffffd7 	b	90018fe8 <_unmap_pages+0x58>
            break;
90019088:	e320f000 	nop	{0}
    }

    return true;
9001908c:	e3a03001 	mov	r3, #1
}
90019090:	e1a00003 	mov	r0, r3
90019094:	e24bd004 	sub	sp, fp, #4
90019098:	e8bd8800 	pop	{fp, pc}

9001909c <_map_user_pages>:
/// @param paddr
/// @param len
/// @param is_dev
/// @return
static bool _map_user_pages(uintptr_t* pgdir, uintptr_t vaddr, uintptr_t paddr, uintptr_t len, bool is_dev)
{
9001909c:	e92d4800 	push	{fp, lr}
900190a0:	e28db004 	add	fp, sp, #4
900190a4:	e24dd020 	sub	sp, sp, #32
900190a8:	e50b0010 	str	r0, [fp, #-16]
900190ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
900190b0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
900190b4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4

    if (UNLIKELY(vaddr >= USER_MEM_TOP)) {
900190b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900190bc:	e1a03fa3 	lsr	r3, r3, #31
900190c0:	e6ef3073 	uxtb	r3, r3
900190c4:	e3530000 	cmp	r3, #0
900190c8:	0a00000a 	beq	900190f8 <_map_user_pages+0x5c>
        ERROR("mapping kernel space.\n");
900190cc:	e3a02081 	mov	r2, #129	; 0x81
900190d0:	e3011f80 	movw	r1, #8064	; 0x1f80
900190d4:	e3491002 	movt	r1, #36866	; 0x9002
900190d8:	e3010dec 	movw	r0, #7660	; 0x1dec
900190dc:	e3490002 	movt	r0, #36866	; 0x9002
900190e0:	ebfff0a4 	bl	90015378 <KPrintf>
900190e4:	e3010e58 	movw	r0, #7768	; 0x1e58
900190e8:	e3490002 	movt	r0, #36866	; 0x9002
900190ec:	ebfff0a1 	bl	90015378 <KPrintf>
        return false;
900190f0:	e3a03000 	mov	r3, #0
900190f4:	ea00001d 	b	90019170 <_map_user_pages+0xd4>
    }

    uintptr_t mem_attr = 0;
900190f8:	e3a03000 	mov	r3, #0
900190fc:	e50b3008 	str	r3, [fp, #-8]
    if (LIKELY(!is_dev)) {
90019100:	e5db3004 	ldrb	r3, [fp, #4]
90019104:	e2233001 	eor	r3, r3, #1
90019108:	e6ef3073 	uxtb	r3, r3
9001910c:	e3530000 	cmp	r3, #0
90019110:	0a000007 	beq	90019134 <_map_user_pages+0x98>
        _p_pgtbl_mmu_access->MmuUsrPteAttr(&mem_attr);
90019114:	e3043528 	movw	r3, #17704	; 0x4528
90019118:	e349309a 	movt	r3, #37018	; 0x909a
9001911c:	e5933000 	ldr	r3, [r3]
90019120:	e5933008 	ldr	r3, [r3, #8]
90019124:	e24b2008 	sub	r2, fp, #8
90019128:	e1a00002 	mov	r0, r2
9001912c:	e12fff33 	blx	r3
90019130:	ea000006 	b	90019150 <_map_user_pages+0xb4>
    } else {
        _p_pgtbl_mmu_access->MmuUsrDevPteAttr(&mem_attr);
90019134:	e3043528 	movw	r3, #17704	; 0x4528
90019138:	e349309a 	movt	r3, #37018	; 0x909a
9001913c:	e5933000 	ldr	r3, [r3]
90019140:	e593300c 	ldr	r3, [r3, #12]
90019144:	e24b2008 	sub	r2, fp, #8
90019148:	e1a00002 	mov	r0, r2
9001914c:	e12fff33 	blx	r3
    }

    return _map_pages(pgdir, vaddr, paddr, len, mem_attr);
90019150:	e51b3008 	ldr	r3, [fp, #-8]
90019154:	e58d3000 	str	r3, [sp]
90019158:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001915c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019160:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90019164:	e51b0010 	ldr	r0, [fp, #-16]
90019168:	ebffff37 	bl	90018e4c <_map_pages>
9001916c:	e1a03000 	mov	r3, r0
}
90019170:	e1a00003 	mov	r0, r3
90019174:	e24bd004 	sub	sp, fp, #4
90019178:	e8bd8800 	pop	{fp, pc}

9001917c <_free_user_pgdir>:

static void _free_user_pgdir(struct TopLevelPageDirectory* pgdir)
{
9001917c:	e92d4800 	push	{fp, lr}
90019180:	e28db004 	add	fp, sp, #4
90019184:	e24dd030 	sub	sp, sp, #48	; 0x30
90019188:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    uintptr_t low_bound = kern_virtmem_buddy.mem_start, high_bound = kern_virtmem_buddy.mem_end;
9001918c:	e3043440 	movw	r3, #17472	; 0x4440
90019190:	e349305a 	movt	r3, #36954	; 0x905a
90019194:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
90019198:	e50b3010 	str	r3, [fp, #-16]
9001919c:	e3043440 	movw	r3, #17472	; 0x4440
900191a0:	e349305a 	movt	r3, #36954	; 0x905a
900191a4:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
900191a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    uintptr_t user_low_bound = user_phy_freemem_buddy.mem_start, user_high_bound = user_phy_freemem_buddy.mem_end;
900191ac:	e3043360 	movw	r3, #17248	; 0x4360
900191b0:	e349301a 	movt	r3, #36890	; 0x901a
900191b4:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
900191b8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
900191bc:	e3043360 	movw	r3, #17248	; 0x4360
900191c0:	e349301a 	movt	r3, #36890	; 0x901a
900191c4:	e59330c0 	ldr	r3, [r3, #192]	; 0xc0
900191c8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    uintptr_t end_idx = USER_MEM_TOP >> LEVEL3_PDE_SHIFT;
900191cc:	e3a03b02 	mov	r3, #2048	; 0x800
900191d0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

    for (uintptr_t i = 0; i < end_idx; i++) {
900191d4:	e3a03000 	mov	r3, #0
900191d8:	e50b3008 	str	r3, [fp, #-8]
900191dc:	ea00004e 	b	9001931c <_free_user_pgdir+0x1a0>
        // free each page table
        uintptr_t* pgtbl_paddr = (uintptr_t*)LEVEL4_PTE_ADDR(pgdir->pd_addr[i]);
900191e0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
900191e4:	e5932000 	ldr	r2, [r3]
900191e8:	e51b3008 	ldr	r3, [fp, #-8]
900191ec:	e1a03103 	lsl	r3, r3, #2
900191f0:	e0823003 	add	r3, r2, r3
900191f4:	e5933000 	ldr	r3, [r3]
900191f8:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
900191fc:	e3c3300f 	bic	r3, r3, #15
90019200:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
        if (pgtbl_paddr != 0) {
90019204:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019208:	e3530000 	cmp	r3, #0
9001920c:	0a00003f 	beq	90019310 <_free_user_pgdir+0x194>
            // free each page
            for (uintptr_t j = 0; j < NUM_LEVEL4_PTE; j++) {
90019210:	e3a03000 	mov	r3, #0
90019214:	e50b300c 	str	r3, [fp, #-12]
90019218:	ea000035 	b	900192f4 <_free_user_pgdir+0x178>
                uintptr_t* page_paddr = (uintptr_t*)ALIGNDOWN(((uintptr_t*)P2V(pgtbl_paddr))[j], PAGE_SIZE);
9001921c:	e51b300c 	ldr	r3, [fp, #-12]
90019220:	e2833202 	add	r3, r3, #536870912	; 0x20000000
90019224:	e1a03103 	lsl	r3, r3, #2
90019228:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001922c:	e0823003 	add	r3, r2, r3
90019230:	e5933000 	ldr	r3, [r3]
90019234:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90019238:	e3c3300f 	bic	r3, r3, #15
9001923c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
                if (page_paddr != NULL) {
90019240:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019244:	e3530000 	cmp	r3, #0
90019248:	0a000026 	beq	900192e8 <_free_user_pgdir+0x16c>
                    if (LIKELY((uintptr_t)page_paddr >= low_bound && (uintptr_t)page_paddr < high_bound)) {
9001924c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019250:	e51b3010 	ldr	r3, [fp, #-16]
90019254:	e1520003 	cmp	r2, r3
90019258:	23a03001 	movcs	r3, #1
9001925c:	33a03000 	movcc	r3, #0
90019260:	e6ef3073 	uxtb	r3, r3
90019264:	e3530000 	cmp	r3, #0
90019268:	0a00000c 	beq	900192a0 <_free_user_pgdir+0x124>
9001926c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019270:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019274:	e1520003 	cmp	r2, r3
90019278:	33a03001 	movcc	r3, #1
9001927c:	23a03000 	movcs	r3, #0
90019280:	e6ef3073 	uxtb	r3, r3
90019284:	e3530000 	cmp	r3, #0
90019288:	0a000004 	beq	900192a0 <_free_user_pgdir+0x124>
                        kfree(P2V(page_paddr));
9001928c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019290:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90019294:	e1a00003 	mov	r0, r3
90019298:	ebfffe9b 	bl	90018d0c <kfree>
9001929c:	ea000011 	b	900192e8 <_free_user_pgdir+0x16c>
                    } else if (LIKELY((uintptr_t)page_paddr >= user_low_bound && (uintptr_t)page_paddr < user_high_bound)) {
900192a0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
900192a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
900192a8:	e1520003 	cmp	r2, r3
900192ac:	23a03001 	movcs	r3, #1
900192b0:	33a03000 	movcc	r3, #0
900192b4:	e6ef3073 	uxtb	r3, r3
900192b8:	e3530000 	cmp	r3, #0
900192bc:	0a000009 	beq	900192e8 <_free_user_pgdir+0x16c>
900192c0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
900192c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900192c8:	e1520003 	cmp	r2, r3
900192cc:	33a03001 	movcc	r3, #1
900192d0:	23a03000 	movcs	r3, #0
900192d4:	e6ef3073 	uxtb	r3, r3
900192d8:	e3530000 	cmp	r3, #0
900192dc:	0a000001 	beq	900192e8 <_free_user_pgdir+0x16c>
                        raw_free((char*)page_paddr);
900192e0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
900192e4:	ebfffea8 	bl	90018d8c <raw_free>
            for (uintptr_t j = 0; j < NUM_LEVEL4_PTE; j++) {
900192e8:	e51b300c 	ldr	r3, [fp, #-12]
900192ec:	e2833001 	add	r3, r3, #1
900192f0:	e50b300c 	str	r3, [fp, #-12]
900192f4:	e51b300c 	ldr	r3, [fp, #-12]
900192f8:	e35300ff 	cmp	r3, #255	; 0xff
900192fc:	9affffc6 	bls	9001921c <_free_user_pgdir+0xa0>
                    }
                }
            }
            kfree(P2V(pgtbl_paddr));
90019300:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019304:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90019308:	e1a00003 	mov	r0, r3
9001930c:	ebfffe7e 	bl	90018d0c <kfree>
    for (uintptr_t i = 0; i < end_idx; i++) {
90019310:	e51b3008 	ldr	r3, [fp, #-8]
90019314:	e2833001 	add	r3, r3, #1
90019318:	e50b3008 	str	r3, [fp, #-8]
9001931c:	e51b2008 	ldr	r2, [fp, #-8]
90019320:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90019324:	e1520003 	cmp	r2, r3
90019328:	3affffac 	bcc	900191e0 <_free_user_pgdir+0x64>
        }
    }
    kfree((char*)pgdir->pd_addr);
9001932c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90019330:	e5933000 	ldr	r3, [r3]
90019334:	e1a00003 	mov	r0, r3
90019338:	ebfffe73 	bl	90018d0c <kfree>
}
9001933c:	e320f000 	nop	{0}
90019340:	e24bd004 	sub	sp, fp, #4
90019344:	e8bd8800 	pop	{fp, pc}

90019348 <_resize_user_pgdir>:

/// assume that a user pagedir is allocated from [0, size)
/// if new_size > old_size, allocate more space,
/// if old_size > new_size, free extra space, to avoid unnecessary alloc/free.
static uintptr_t _resize_user_pgdir(struct TopLevelPageDirectory* pgdir, uintptr_t old_size, uintptr_t new_size)
{
90019348:	e92d4810 	push	{r4, fp, lr}
9001934c:	e28db008 	add	fp, sp, #8
90019350:	e24dd024 	sub	sp, sp, #36	; 0x24
90019354:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90019358:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
9001935c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    if (UNLIKELY(new_size > USER_MEM_TOP)) {
90019360:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90019364:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
90019368:	83a03001 	movhi	r3, #1
9001936c:	93a03000 	movls	r3, #0
90019370:	e6ef3073 	uxtb	r3, r3
90019374:	e3530000 	cmp	r3, #0
90019378:	0a00000a 	beq	900193a8 <_resize_user_pgdir+0x60>
        ERROR("user size out of range.\n");
9001937c:	e3a020b0 	mov	r2, #176	; 0xb0
90019380:	e3011f90 	movw	r1, #8080	; 0x1f90
90019384:	e3491002 	movt	r1, #36866	; 0x9002
90019388:	e3010dec 	movw	r0, #7660	; 0x1dec
9001938c:	e3490002 	movt	r0, #36866	; 0x9002
90019390:	ebffeff8 	bl	90015378 <KPrintf>
90019394:	e3010e70 	movw	r0, #7792	; 0x1e70
90019398:	e3490002 	movt	r0, #36866	; 0x9002
9001939c:	ebffeff5 	bl	90015378 <KPrintf>
        return old_size;
900193a0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900193a4:	ea000039 	b	90019490 <_resize_user_pgdir+0x148>
    }
    if (UNLIKELY(new_size < old_size)) {
900193a8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900193ac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900193b0:	e1520003 	cmp	r2, r3
900193b4:	33a03001 	movcc	r3, #1
900193b8:	23a03000 	movcs	r3, #0
900193bc:	e6ef3073 	uxtb	r3, r3
900193c0:	e3530000 	cmp	r3, #0
900193c4:	0a000001 	beq	900193d0 <_resize_user_pgdir+0x88>
        /// @todo: free extra space.
        return old_size;
900193c8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900193cc:	ea00002f 	b	90019490 <_resize_user_pgdir+0x148>
    }

    uintptr_t cur_size = ALIGNUP(old_size, PAGE_SIZE);
900193d0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
900193d4:	e2833eff 	add	r3, r3, #4080	; 0xff0
900193d8:	e283300f 	add	r3, r3, #15
900193dc:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
900193e0:	e3c3300f 	bic	r3, r3, #15
900193e4:	e50b3010 	str	r3, [fp, #-16]

    while (cur_size < new_size) {
900193e8:	ea000023 	b	9001947c <_resize_user_pgdir+0x134>
        char* new_page = kalloc(PAGE_SIZE);
900193ec:	e3a00a01 	mov	r0, #4096	; 0x1000
900193f0:	ebfffe1f 	bl	90018c74 <kalloc>
900193f4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
        if (new_page == NULL) {
900193f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900193fc:	e3530000 	cmp	r3, #0
90019400:	1a00000a 	bne	90019430 <_resize_user_pgdir+0xe8>
            ERROR("No memory\n");
90019404:	e3a020bd 	mov	r2, #189	; 0xbd
90019408:	e3011f90 	movw	r1, #8080	; 0x1f90
9001940c:	e3491002 	movt	r1, #36866	; 0x9002
90019410:	e3010dec 	movw	r0, #7660	; 0x1dec
90019414:	e3490002 	movt	r0, #36866	; 0x9002
90019418:	ebffefd6 	bl	90015378 <KPrintf>
9001941c:	e3010e8c 	movw	r0, #7820	; 0x1e8c
90019420:	e3490002 	movt	r0, #36866	; 0x9002
90019424:	ebffefd3 	bl	90015378 <KPrintf>
            return cur_size;
90019428:	e51b3010 	ldr	r3, [fp, #-16]
9001942c:	ea000017 	b	90019490 <_resize_user_pgdir+0x148>
        }
        memset(new_page, 0, PAGE_SIZE);
90019430:	e3a02a01 	mov	r2, #4096	; 0x1000
90019434:	e3a01000 	mov	r1, #0
90019438:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
9001943c:	fa001d4c 	blx	90020974 <memset>

        xizi_pager.map_pages(pgdir->pd_addr, cur_size, V2P(new_page), PAGE_SIZE, false);
90019440:	e30333ac 	movw	r3, #13228	; 0x33ac
90019444:	e3493002 	movt	r3, #36866	; 0x9002
90019448:	e5934008 	ldr	r4, [r3, #8]
9001944c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90019450:	e5930000 	ldr	r0, [r3]
90019454:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019458:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
9001945c:	e3a03000 	mov	r3, #0
90019460:	e58d3000 	str	r3, [sp]
90019464:	e3a03a01 	mov	r3, #4096	; 0x1000
90019468:	e51b1010 	ldr	r1, [fp, #-16]
9001946c:	e12fff34 	blx	r4
        cur_size += PAGE_SIZE;
90019470:	e51b3010 	ldr	r3, [fp, #-16]
90019474:	e2833a01 	add	r3, r3, #4096	; 0x1000
90019478:	e50b3010 	str	r3, [fp, #-16]
    while (cur_size < new_size) {
9001947c:	e51b2010 	ldr	r2, [fp, #-16]
90019480:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90019484:	e1520003 	cmp	r2, r3
90019488:	3affffd7 	bcc	900193ec <_resize_user_pgdir+0xa4>
    }

    return new_size;
9001948c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
90019490:	e1a00003 	mov	r0, r3
90019494:	e24bd008 	sub	sp, fp, #8
90019498:	e8bd8810 	pop	{r4, fp, pc}

9001949c <_address_translate>:
/// @brief translate virt address to phy address with pgdir
/// @param pgdir
/// @param vaddr accept only page aligned address
/// @return paddr of pgdir(vaddr); zero for unmapped addr
static uintptr_t _address_translate(struct TopLevelPageDirectory* pgdir, uintptr_t vaddr)
{
9001949c:	e92d4800 	push	{fp, lr}
900194a0:	e28db004 	add	fp, sp, #4
900194a4:	e24dd010 	sub	sp, sp, #16
900194a8:	e50b0010 	str	r0, [fp, #-16]
900194ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    assert(vaddr % PAGE_SIZE == 0);
900194b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
900194b4:	e7eb3053 	ubfx	r3, r3, #0, #12
900194b8:	e3530000 	cmp	r3, #0
900194bc:	0a00000d 	beq	900194f8 <_address_translate+0x5c>
900194c0:	e3a020cf 	mov	r2, #207	; 0xcf
900194c4:	e3011fa4 	movw	r1, #8100	; 0x1fa4
900194c8:	e3491002 	movt	r1, #36866	; 0x9002
900194cc:	e3010dec 	movw	r0, #7660	; 0x1dec
900194d0:	e3490002 	movt	r0, #36866	; 0x9002
900194d4:	ebffefa7 	bl	90015378 <KPrintf>
900194d8:	e3011e98 	movw	r1, #7832	; 0x1e98
900194dc:	e3491002 	movt	r1, #36866	; 0x9002
900194e0:	e3010eb0 	movw	r0, #7856	; 0x1eb0
900194e4:	e3490002 	movt	r0, #36866	; 0x9002
900194e8:	ebffefa2 	bl	90015378 <KPrintf>
900194ec:	e3010ec0 	movw	r0, #7872	; 0x1ec0
900194f0:	e3490002 	movt	r0, #36866	; 0x9002
900194f4:	ebffe691 	bl	90012f40 <panic>
    const uintptr_t* const pte = _page_walk(pgdir->pd_addr, vaddr, false);
900194f8:	e51b3010 	ldr	r3, [fp, #-16]
900194fc:	e5933000 	ldr	r3, [r3]
90019500:	e3a02000 	mov	r2, #0
90019504:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
90019508:	e1a00003 	mov	r0, r3
9001950c:	eb000103 	bl	90019920 <_page_walk>
90019510:	e50b0008 	str	r0, [fp, #-8]
    if (pte == NULL || *pte == 0) {
90019514:	e51b3008 	ldr	r3, [fp, #-8]
90019518:	e3530000 	cmp	r3, #0
9001951c:	0a000003 	beq	90019530 <_address_translate+0x94>
90019520:	e51b3008 	ldr	r3, [fp, #-8]
90019524:	e5933000 	ldr	r3, [r3]
90019528:	e3530000 	cmp	r3, #0
9001952c:	1a000001 	bne	90019538 <_address_translate+0x9c>
        return 0;
90019530:	e3a03000 	mov	r3, #0
90019534:	ea000003 	b	90019548 <_address_translate+0xac>
    }
    return (uintptr_t)ALIGNDOWN(*pte, PAGE_SIZE);
90019538:	e51b3008 	ldr	r3, [fp, #-8]
9001953c:	e5933000 	ldr	r3, [r3]
90019540:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90019544:	e3c3300f 	bic	r3, r3, #15
}
90019548:	e1a00003 	mov	r0, r3
9001954c:	e24bd004 	sub	sp, fp, #4
90019550:	e8bd8800 	pop	{fp, pc}

90019554 <_cross_vspace_data_copy_in_page>:

static uintptr_t _cross_vspace_data_copy_in_page(struct TopLevelPageDirectory* pgdir, uintptr_t cross_dest, uintptr_t src, uintptr_t len)
{
90019554:	e92d4800 	push	{fp, lr}
90019558:	e28db004 	add	fp, sp, #4
9001955c:	e24dd028 	sub	sp, sp, #40	; 0x28
90019560:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90019564:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
90019568:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
9001956c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    uintptr_t cross_dest_end = cross_dest + len;
90019570:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
90019574:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019578:	e0823003 	add	r3, r2, r3
9001957c:	e50b3008 	str	r3, [fp, #-8]
    assert(ALIGNUP(cross_dest, PAGE_SIZE) == ALIGNUP(cross_dest_end, PAGE_SIZE));
90019580:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019584:	e2832eff 	add	r2, r3, #4080	; 0xff0
90019588:	e282200f 	add	r2, r2, #15
9001958c:	e51b3008 	ldr	r3, [fp, #-8]
90019590:	e2833eff 	add	r3, r3, #4080	; 0xff0
90019594:	e283300f 	add	r3, r3, #15
90019598:	e0233002 	eor	r3, r3, r2
9001959c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
900195a0:	e3c3300f 	bic	r3, r3, #15
900195a4:	e3530000 	cmp	r3, #0
900195a8:	0a00000d 	beq	900195e4 <_cross_vspace_data_copy_in_page+0x90>
900195ac:	e3a020da 	mov	r2, #218	; 0xda
900195b0:	e3011fb8 	movw	r1, #8120	; 0x1fb8
900195b4:	e3491002 	movt	r1, #36866	; 0x9002
900195b8:	e3010dec 	movw	r0, #7660	; 0x1dec
900195bc:	e3490002 	movt	r0, #36866	; 0x9002
900195c0:	ebffef6c 	bl	90015378 <KPrintf>
900195c4:	e3011ec4 	movw	r1, #7876	; 0x1ec4
900195c8:	e3491002 	movt	r1, #36866	; 0x9002
900195cc:	e3010eb0 	movw	r0, #7856	; 0x1eb0
900195d0:	e3490002 	movt	r0, #36866	; 0x9002
900195d4:	ebffef67 	bl	90015378 <KPrintf>
900195d8:	e3010ec0 	movw	r0, #7872	; 0x1ec0
900195dc:	e3490002 	movt	r0, #36866	; 0x9002
900195e0:	ebffe656 	bl	90012f40 <panic>

    uintptr_t paddr = xizi_pager.address_translate(pgdir, ALIGNDOWN(cross_dest, PAGE_SIZE));
900195e4:	e30333ac 	movw	r3, #13228	; 0x33ac
900195e8:	e3493002 	movt	r3, #36866	; 0x9002
900195ec:	e5932014 	ldr	r2, [r3, #20]
900195f0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
900195f4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
900195f8:	e3c3300f 	bic	r3, r3, #15
900195fc:	e1a01003 	mov	r1, r3
90019600:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
90019604:	e12fff32 	blx	r2
90019608:	e50b000c 	str	r0, [fp, #-12]
    uintptr_t offset = cross_dest - ALIGNDOWN(cross_dest, PAGE_SIZE);
9001960c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019610:	e7eb3053 	ubfx	r3, r3, #0, #12
90019614:	e50b3010 	str	r3, [fp, #-16]
    uintptr_t* vdest = (uintptr_t*)((uintptr_t)P2V(paddr) + offset);
90019618:	e51b200c 	ldr	r2, [fp, #-12]
9001961c:	e51b3010 	ldr	r3, [fp, #-16]
90019620:	e0823003 	add	r3, r2, r3
90019624:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90019628:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    uintptr_t* vsrc = (uintptr_t*)src;
9001962c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019630:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    memcpy(vdest, vsrc, len);
90019634:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
90019638:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001963c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
90019640:	fa001c5b 	blx	900207b4 <memcpy>
    return len;
90019644:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
}
90019648:	e1a00003 	mov	r0, r3
9001964c:	e24bd004 	sub	sp, fp, #4
90019650:	e8bd8800 	pop	{fp, pc}

90019654 <_cross_vspace_data_copy>:
/// @param cross_dest vaddress in pgdir
/// @param src
/// @param len
/// @return
static uintptr_t _cross_vspace_data_copy(struct TopLevelPageDirectory* pgdir, uintptr_t cross_dest, uintptr_t src, uintptr_t len)
{
90019654:	e92d4800 	push	{fp, lr}
90019658:	e28db004 	add	fp, sp, #4
9001965c:	e24dd020 	sub	sp, sp, #32
90019660:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90019664:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
90019668:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
9001966c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uintptr_t len_to_top = ALIGNUP(cross_dest, PAGE_SIZE) - cross_dest;
90019670:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019674:	e2833eff 	add	r3, r3, #4080	; 0xff0
90019678:	e283300f 	add	r3, r3, #15
9001967c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90019680:	e3c3300f 	bic	r3, r3, #15
90019684:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90019688:	e0433002 	sub	r3, r3, r2
9001968c:	e50b3008 	str	r3, [fp, #-8]

    uintptr_t copied_len = 0;
90019690:	e3a03000 	mov	r3, #0
90019694:	e50b300c 	str	r3, [fp, #-12]
    while (copied_len < len) {
90019698:	ea000031 	b	90019764 <_cross_vspace_data_copy+0x110>
        uintptr_t current_copy_len = len_to_top >= len ? len : len_to_top;
9001969c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
900196a0:	e51b3008 	ldr	r3, [fp, #-8]
900196a4:	e1520003 	cmp	r2, r3
900196a8:	31a03002 	movcc	r3, r2
900196ac:	21a03003 	movcs	r3, r3
900196b0:	e50b3010 	str	r3, [fp, #-16]

        current_copy_len = _cross_vspace_data_copy_in_page(pgdir, cross_dest, src, current_copy_len);
900196b4:	e51b3010 	ldr	r3, [fp, #-16]
900196b8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900196bc:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
900196c0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
900196c4:	ebffffa2 	bl	90019554 <_cross_vspace_data_copy_in_page>
900196c8:	e50b0010 	str	r0, [fp, #-16]

        // update variables
        copied_len += current_copy_len;
900196cc:	e51b200c 	ldr	r2, [fp, #-12]
900196d0:	e51b3010 	ldr	r3, [fp, #-16]
900196d4:	e0823003 	add	r3, r2, r3
900196d8:	e50b300c 	str	r3, [fp, #-12]
        cross_dest += current_copy_len;
900196dc:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
900196e0:	e51b3010 	ldr	r3, [fp, #-16]
900196e4:	e0823003 	add	r3, r2, r3
900196e8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        src += current_copy_len;
900196ec:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
900196f0:	e51b3010 	ldr	r3, [fp, #-16]
900196f4:	e0823003 	add	r3, r2, r3
900196f8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        len_to_top = ALIGNDOWN(cross_dest + PAGE_SIZE, PAGE_SIZE) - ALIGNDOWN(cross_dest, PAGE_SIZE); // actually PAGE_SIZE
900196fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019700:	e2833a01 	add	r3, r3, #4096	; 0x1000
90019704:	e3c32eff 	bic	r2, r3, #4080	; 0xff0
90019708:	e3c2200f 	bic	r2, r2, #15
9001970c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019710:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
90019714:	e3c3300f 	bic	r3, r3, #15
90019718:	e0423003 	sub	r3, r2, r3
9001971c:	e50b3008 	str	r3, [fp, #-8]
        assert(len_to_top == PAGE_SIZE);
90019720:	e51b3008 	ldr	r3, [fp, #-8]
90019724:	e3530a01 	cmp	r3, #4096	; 0x1000
90019728:	0a00000d 	beq	90019764 <_cross_vspace_data_copy+0x110>
9001972c:	e3a020f9 	mov	r2, #249	; 0xf9
90019730:	e3011fd8 	movw	r1, #8152	; 0x1fd8
90019734:	e3491002 	movt	r1, #36866	; 0x9002
90019738:	e3010dec 	movw	r0, #7660	; 0x1dec
9001973c:	e3490002 	movt	r0, #36866	; 0x9002
90019740:	ebffef0c 	bl	90015378 <KPrintf>
90019744:	e3011f0c 	movw	r1, #7948	; 0x1f0c
90019748:	e3491002 	movt	r1, #36866	; 0x9002
9001974c:	e3010eb0 	movw	r0, #7856	; 0x1eb0
90019750:	e3490002 	movt	r0, #36866	; 0x9002
90019754:	ebffef07 	bl	90015378 <KPrintf>
90019758:	e3010ec0 	movw	r0, #7872	; 0x1ec0
9001975c:	e3490002 	movt	r0, #36866	; 0x9002
90019760:	ebffe5f6 	bl	90012f40 <panic>
    while (copied_len < len) {
90019764:	e51b200c 	ldr	r2, [fp, #-12]
90019768:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001976c:	e1520003 	cmp	r2, r3
90019770:	3affffc9 	bcc	9001969c <_cross_vspace_data_copy+0x48>
    }

    return len;
90019774:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
}
90019778:	e1a00003 	mov	r0, r3
9001977c:	e24bd004 	sub	sp, fp, #4
90019780:	e8bd8800 	pop	{fp, pc}

90019784 <module_pager_init>:
    .address_translate = _address_translate,
    .cross_vspace_data_copy = _cross_vspace_data_copy,
};

bool module_pager_init(struct PagerRightGroup* _right_group)
{
90019784:	e92d4800 	push	{fp, lr}
90019788:	e28db004 	add	fp, sp, #4
9001978c:	e24dd008 	sub	sp, sp, #8
90019790:	e50b0008 	str	r0, [fp, #-8]
    right_group = *_right_group;
90019794:	e3043520 	movw	r3, #17696	; 0x4520
90019798:	e349309a 	movt	r3, #37018	; 0x909a
9001979c:	e51b2008 	ldr	r2, [fp, #-8]
900197a0:	e8920003 	ldm	r2, {r0, r1}
900197a4:	e8830003 	stm	r3, {r0, r1}
    _p_pgtbl_mmu_access = AchieveResource(&right_group.mmu_driver_tag);
900197a8:	e3040520 	movw	r0, #17696	; 0x4520
900197ac:	e349009a 	movt	r0, #37018	; 0x909a
900197b0:	ebfffa49 	bl	900180dc <AchieveResource>
900197b4:	e1a02000 	mov	r2, r0
900197b8:	e3043528 	movw	r3, #17704	; 0x4528
900197bc:	e349309a 	movt	r3, #37018	; 0x909a
900197c0:	e5832000 	str	r2, [r3]
    return _p_pgtbl_mmu_access != NULL;
900197c4:	e3043528 	movw	r3, #17704	; 0x4528
900197c8:	e349309a 	movt	r3, #37018	; 0x909a
900197cc:	e5933000 	ldr	r3, [r3]
900197d0:	e3530000 	cmp	r3, #0
900197d4:	13a03001 	movne	r3, #1
900197d8:	03a03000 	moveq	r3, #0
900197dc:	e6ef3073 	uxtb	r3, r3
}
900197e0:	e1a00003 	mov	r0, r3
900197e4:	e24bd004 	sub	sp, fp, #4
900197e8:	e8bd8800 	pop	{fp, pc}

900197ec <load_kern_pgdir>:

/// @brief kernel pagedir
struct TopLevelPageDirectory kern_pgdir;

void load_kern_pgdir(struct TraceTag* mmu_driver_tag)
{
900197ec:	e92d4800 	push	{fp, lr}
900197f0:	e28db004 	add	fp, sp, #4
900197f4:	e24dd018 	sub	sp, sp, #24
900197f8:	e50b0010 	str	r0, [fp, #-16]
    if (mmu_driver_tag->meta == NULL) {
900197fc:	e51b3010 	ldr	r3, [fp, #-16]
90019800:	e5933000 	ldr	r3, [r3]
90019804:	e3530000 	cmp	r3, #0
90019808:	1a000009 	bne	90019834 <load_kern_pgdir+0x48>
        ERROR("Invalid mmu driver tag.\n");
9001980c:	e3002117 	movw	r2, #279	; 0x117
90019810:	e3011ff0 	movw	r1, #8176	; 0x1ff0
90019814:	e3491002 	movt	r1, #36866	; 0x9002
90019818:	e3010dec 	movw	r0, #7660	; 0x1dec
9001981c:	e3490002 	movt	r0, #36866	; 0x9002
90019820:	ebffeed4 	bl	90015378 <KPrintf>
90019824:	e3010f24 	movw	r0, #7972	; 0x1f24
90019828:	e3490002 	movt	r0, #36866	; 0x9002
9001982c:	ebffeed1 	bl	90015378 <KPrintf>
90019830:	ea000038 	b	90019918 <load_kern_pgdir+0x12c>
        return;
    }

    if (!_new_pgdir(&kern_pgdir)) {
90019834:	e304052c 	movw	r0, #17708	; 0x452c
90019838:	e349009a 	movt	r0, #37018	; 0x909a
9001983c:	ebfffd65 	bl	90018dd8 <_new_pgdir>
90019840:	e1a03000 	mov	r3, r0
90019844:	e2233001 	eor	r3, r3, #1
90019848:	e6ef3073 	uxtb	r3, r3
9001984c:	e3530000 	cmp	r3, #0
90019850:	0a000002 	beq	90019860 <load_kern_pgdir+0x74>
        panic("cannot alloc kernel page directory");
90019854:	e3010f40 	movw	r0, #8000	; 0x1f40
90019858:	e3490002 	movt	r0, #36866	; 0x9002
9001985c:	ebffe5b7 	bl	90012f40 <panic>
    }
    uintptr_t kern_attr = 0;
90019860:	e3a03000 	mov	r3, #0
90019864:	e50b3008 	str	r3, [fp, #-8]
    _p_pgtbl_mmu_access->MmuKernPteAttr(&kern_attr);
90019868:	e3043528 	movw	r3, #17704	; 0x4528
9001986c:	e349309a 	movt	r3, #37018	; 0x909a
90019870:	e5933000 	ldr	r3, [r3]
90019874:	e5933010 	ldr	r3, [r3, #16]
90019878:	e24b2008 	sub	r2, fp, #8
9001987c:	e1a00002 	mov	r0, r2
90019880:	e12fff33 	blx	r3
    uintptr_t dev_attr = 0;
90019884:	e3a03000 	mov	r3, #0
90019888:	e50b300c 	str	r3, [fp, #-12]
    _p_pgtbl_mmu_access->MmuDevPteAttr(&dev_attr);
9001988c:	e3043528 	movw	r3, #17704	; 0x4528
90019890:	e349309a 	movt	r3, #37018	; 0x909a
90019894:	e5933000 	ldr	r3, [r3]
90019898:	e5933000 	ldr	r3, [r3]
9001989c:	e24b200c 	sub	r2, fp, #12
900198a0:	e1a00002 	mov	r0, r2
900198a4:	e12fff33 	blx	r3

    // kern mem
    _map_pages((uintptr_t*)kern_pgdir.pd_addr, KERN_MEM_BASE, PHY_MEM_BASE, (PHY_MEM_STOP - PHY_MEM_BASE), kern_attr);
900198a8:	e304352c 	movw	r3, #17708	; 0x452c
900198ac:	e349309a 	movt	r3, #37018	; 0x909a
900198b0:	e5930000 	ldr	r0, [r3]
900198b4:	e51b3008 	ldr	r3, [fp, #-8]
900198b8:	e58d3000 	str	r3, [sp]
900198bc:	e3a03101 	mov	r3, #1073741824	; 0x40000000
900198c0:	e3a02201 	mov	r2, #268435456	; 0x10000000
900198c4:	e3a01209 	mov	r1, #-1879048192	; 0x90000000
900198c8:	ebfffd5f 	bl	90018e4c <_map_pages>
    // dev mem
    _map_pages((uintptr_t*)kern_pgdir.pd_addr, DEV_VRTMEM_BASE, DEV_PHYMEM_BASE, DEV_MEM_SZ, dev_attr);
900198cc:	e304352c 	movw	r3, #17708	; 0x452c
900198d0:	e349309a 	movt	r3, #37018	; 0x909a
900198d4:	e5930000 	ldr	r0, [r3]
900198d8:	e51b300c 	ldr	r3, [fp, #-12]
900198dc:	e58d3000 	str	r3, [sp]
900198e0:	e3a03201 	mov	r3, #268435456	; 0x10000000
900198e4:	e3a02000 	mov	r2, #0
900198e8:	e3a01102 	mov	r1, #-2147483648	; 0x80000000
900198ec:	ebfffd56 	bl	90018e4c <_map_pages>

    _p_pgtbl_mmu_access->LoadPgdir((uintptr_t)V2P(kern_pgdir.pd_addr));
900198f0:	e3043528 	movw	r3, #17704	; 0x4528
900198f4:	e349309a 	movt	r3, #37018	; 0x909a
900198f8:	e5933000 	ldr	r3, [r3]
900198fc:	e5932018 	ldr	r2, [r3, #24]
90019900:	e304352c 	movw	r3, #17708	; 0x452c
90019904:	e349309a 	movt	r3, #37018	; 0x909a
90019908:	e5933000 	ldr	r3, [r3]
9001990c:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
90019910:	e1a00003 	mov	r0, r3
90019914:	e12fff32 	blx	r2
90019918:	e24bd004 	sub	sp, fp, #4
9001991c:	e8bd8800 	pop	{fp, pc}

90019920 <_page_walk>:

#include "kalloc.h"
#include "pagetable.h"

uintptr_t* _page_walk(uintptr_t* pgdir, uintptr_t vaddr, bool alloc)
{
90019920:	e92d4800 	push	{fp, lr}
90019924:	e28db004 	add	fp, sp, #4
90019928:	e24dd020 	sub	sp, sp, #32
9001992c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
90019930:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
90019934:	e1a03002 	mov	r3, r2
90019938:	e54b301d 	strb	r3, [fp, #-29]	; 0xffffffe3

    // get page table addr
    uintptr_t pde_attr = 0;
9001993c:	e3a03000 	mov	r3, #0
90019940:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    _p_pgtbl_mmu_access->MmuPdeAttr(&pde_attr);
90019944:	e3043528 	movw	r3, #17704	; 0x4528
90019948:	e349309a 	movt	r3, #37018	; 0x909a
9001994c:	e5933000 	ldr	r3, [r3]
90019950:	e5933004 	ldr	r3, [r3, #4]
90019954:	e24b2014 	sub	r2, fp, #20
90019958:	e1a00002 	mov	r0, r2
9001995c:	e12fff33 	blx	r3

    uintptr_t* pde_ptr = (uintptr_t*)&pgdir[vaddr >> LEVEL3_PDE_SHIFT];
90019960:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019964:	e1a03a23 	lsr	r3, r3, #20
90019968:	e1a03103 	lsl	r3, r3, #2
9001996c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019970:	e0823003 	add	r3, r2, r3
90019974:	e50b300c 	str	r3, [fp, #-12]

    uintptr_t* pgtbl_vaddr;
    if (*pde_ptr != 0) {
90019978:	e51b300c 	ldr	r3, [fp, #-12]
9001997c:	e5933000 	ldr	r3, [r3]
90019980:	e3530000 	cmp	r3, #0
90019984:	0a000009 	beq	900199b0 <_page_walk+0x90>
        uintptr_t pgtbl_paddr = (*pde_ptr) & ~pde_attr;
90019988:	e51b300c 	ldr	r3, [fp, #-12]
9001998c:	e5932000 	ldr	r2, [r3]
90019990:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019994:	e1e03003 	mvn	r3, r3
90019998:	e0033002 	and	r3, r3, r2
9001999c:	e50b3010 	str	r3, [fp, #-16]
        pgtbl_vaddr = (uintptr_t*)P2V(pgtbl_paddr);
900199a0:	e51b3010 	ldr	r3, [fp, #-16]
900199a4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
900199a8:	e50b3008 	str	r3, [fp, #-8]
900199ac:	ea000016 	b	90019a0c <_page_walk+0xec>
    } else {
        if (!alloc || !(pgtbl_vaddr = (uintptr_t*)kalloc(sizeof(uintptr_t) * NUM_LEVEL4_PTE))) {
900199b0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
900199b4:	e2233001 	eor	r3, r3, #1
900199b8:	e6ef3073 	uxtb	r3, r3
900199bc:	e3530000 	cmp	r3, #0
900199c0:	1a000005 	bne	900199dc <_page_walk+0xbc>
900199c4:	e3a00b01 	mov	r0, #1024	; 0x400
900199c8:	ebfffca9 	bl	90018c74 <kalloc>
900199cc:	e50b0008 	str	r0, [fp, #-8]
900199d0:	e51b3008 	ldr	r3, [fp, #-8]
900199d4:	e3530000 	cmp	r3, #0
900199d8:	1a000001 	bne	900199e4 <_page_walk+0xc4>
            return 0;
900199dc:	e3a03000 	mov	r3, #0
900199e0:	ea00000f 	b	90019a24 <_page_walk+0x104>
        }

        memset(pgtbl_vaddr, 0, sizeof(uintptr_t) * NUM_LEVEL4_PTE);
900199e4:	e3a02b01 	mov	r2, #1024	; 0x400
900199e8:	e3a01000 	mov	r1, #0
900199ec:	e51b0008 	ldr	r0, [fp, #-8]
900199f0:	fa001bdf 	blx	90020974 <memset>
        *pde_ptr = V2P(pgtbl_vaddr) | pde_attr;
900199f4:	e51b3008 	ldr	r3, [fp, #-8]
900199f8:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
900199fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019a00:	e1822003 	orr	r2, r2, r3
90019a04:	e51b300c 	ldr	r3, [fp, #-12]
90019a08:	e5832000 	str	r2, [r3]
    }

    return &pgtbl_vaddr[LEVEL4_PTE_IDX(vaddr)];
90019a0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019a10:	e1a03623 	lsr	r3, r3, #12
90019a14:	e6ef3073 	uxtb	r3, r3
90019a18:	e1a03103 	lsl	r3, r3, #2
90019a1c:	e51b2008 	ldr	r2, [fp, #-8]
90019a20:	e0823003 	add	r3, r2, r3
90019a24:	e1a00003 	mov	r0, r3
90019a28:	e24bd004 	sub	sp, fp, #4
90019a2c:	e8bd8800 	pop	{fp, pc}

90019a30 <_buddy_split_page>:

#include "buddy.h"
#include "log.h"

static void _buddy_split_page(struct KPage* page, uint32_t low_order, uint32_t high_order, struct KFreeList* list)
{
90019a30:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
90019a34:	e28db000 	add	fp, sp, #0
90019a38:	e24dd02c 	sub	sp, sp, #44	; 0x2c
90019a3c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
90019a40:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
90019a44:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
90019a48:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    uint32_t size = (1 << high_order);
90019a4c:	e3a02001 	mov	r2, #1
90019a50:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019a54:	e1a03312 	lsl	r3, r2, r3
90019a58:	e50b3008 	str	r3, [fp, #-8]
    while (high_order > low_order) {
90019a5c:	ea000029 	b	90019b08 <_buddy_split_page+0xd8>
        list--;
90019a60:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019a64:	e243300c 	sub	r3, r3, #12
90019a68:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
        size >>= 1;
90019a6c:	e51b3008 	ldr	r3, [fp, #-8]
90019a70:	e1a030a3 	lsr	r3, r3, #1
90019a74:	e50b3008 	str	r3, [fp, #-8]
        doubleListAddOnHead(&page[size].node, &list->list_head);
90019a78:	e51b3008 	ldr	r3, [fp, #-8]
90019a7c:	e1a03203 	lsl	r3, r3, #4
90019a80:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90019a84:	e0823003 	add	r3, r2, r3
90019a88:	e1a02003 	mov	r2, r3
90019a8c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019a90:	e2833004 	add	r3, r3, #4
90019a94:	e50b200c 	str	r2, [fp, #-12]
90019a98:	e50b3010 	str	r3, [fp, #-16]
    _double_list_add(new_node, head, head->next);
90019a9c:	e51b3010 	ldr	r3, [fp, #-16]
90019aa0:	e5933000 	ldr	r3, [r3]
90019aa4:	e51b200c 	ldr	r2, [fp, #-12]
90019aa8:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
90019aac:	e51b2010 	ldr	r2, [fp, #-16]
90019ab0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
90019ab4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    next->prev = new_node;
90019ab8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019abc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90019ac0:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
90019ac4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019ac8:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90019acc:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
90019ad0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019ad4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019ad8:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
90019adc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90019ae0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90019ae4:	e5832000 	str	r2, [r3]
        list->n_free_pages++;
90019ae8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019aec:	e5933000 	ldr	r3, [r3]
90019af0:	e2832001 	add	r2, r3, #1
90019af4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019af8:	e5832000 	str	r2, [r3]
        high_order--;
90019afc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019b00:	e2433001 	sub	r3, r3, #1
90019b04:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    while (high_order > low_order) {
90019b08:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019b0c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019b10:	e1520003 	cmp	r2, r3
90019b14:	8affffd1 	bhi	90019a60 <_buddy_split_page+0x30>
    }
}
90019b18:	e320f000 	nop	{0}
90019b1c:	e28bd000 	add	sp, fp, #0
90019b20:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90019b24:	e12fff1e 	bx	lr

90019b28 <KBuddyPagesAlloc>:
    return;
}

// find free page and split it to small page if need
static struct KPage* KBuddyPagesAlloc(struct KBuddy* pbuddy, int nPages)
{
90019b28:	e92d4800 	push	{fp, lr}
90019b2c:	e28db004 	add	fp, sp, #4
90019b30:	e24dd038 	sub	sp, sp, #56	; 0x38
90019b34:	e50b0038 	str	r0, [fp, #-56]	; 0xffffffc8
90019b38:	e50b103c 	str	r1, [fp, #-60]	; 0xffffffc4
    struct KPage* page = NULL;
90019b3c:	e3a03000 	mov	r3, #0
90019b40:	e50b3010 	str	r3, [fp, #-16]
    struct KFreeList* list = NULL;
90019b44:	e3a03000 	mov	r3, #0
90019b48:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int i = 0, order = 0;
90019b4c:	e3a03000 	mov	r3, #0
90019b50:	e50b3008 	str	r3, [fp, #-8]
90019b54:	e3a03000 	mov	r3, #0
90019b58:	e50b300c 	str	r3, [fp, #-12]

    spinlock_lock(&pbuddy->lock);
90019b5c:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90019b60:	e2833020 	add	r3, r3, #32
90019b64:	e1a00003 	mov	r0, r3
90019b68:	ebffe885 	bl	90013d84 <spinlock_lock>

    // find order
    for (order = 0; (FREE_LIST_INDEX(order)) < nPages; order++)
90019b6c:	e3a03000 	mov	r3, #0
90019b70:	e50b300c 	str	r3, [fp, #-12]
90019b74:	ea000002 	b	90019b84 <KBuddyPagesAlloc+0x5c>
90019b78:	e51b300c 	ldr	r3, [fp, #-12]
90019b7c:	e2833001 	add	r3, r3, #1
90019b80:	e50b300c 	str	r3, [fp, #-12]
90019b84:	e3a02001 	mov	r2, #1
90019b88:	e51b300c 	ldr	r3, [fp, #-12]
90019b8c:	e1a02312 	lsl	r2, r2, r3
90019b90:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
90019b94:	e1520003 	cmp	r2, r3
90019b98:	bafffff6 	blt	90019b78 <KBuddyPagesAlloc+0x50>
        ;

    // find the free page list
    for (i = order; i < MAX_BUDDY_ORDER; i++) {
90019b9c:	e51b300c 	ldr	r3, [fp, #-12]
90019ba0:	e50b3008 	str	r3, [fp, #-8]
90019ba4:	ea000056 	b	90019d04 <KBuddyPagesAlloc+0x1dc>
        list = pbuddy->free_list + i;
90019ba8:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90019bac:	e2831040 	add	r1, r3, #64	; 0x40
90019bb0:	e51b2008 	ldr	r2, [fp, #-8]
90019bb4:	e1a03002 	mov	r3, r2
90019bb8:	e1a03083 	lsl	r3, r3, #1
90019bbc:	e0833002 	add	r3, r3, r2
90019bc0:	e1a03103 	lsl	r3, r3, #2
90019bc4:	e0813003 	add	r3, r1, r3
90019bc8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        if (IS_DOUBLE_LIST_EMPTY(&list->list_head)) {
90019bcc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019bd0:	e5932004 	ldr	r2, [r3, #4]
90019bd4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019bd8:	e2833004 	add	r3, r3, #4
90019bdc:	e1520003 	cmp	r2, r3
90019be0:	1a000003 	bne	90019bf4 <KBuddyPagesAlloc+0xcc>
    for (i = order; i < MAX_BUDDY_ORDER; i++) {
90019be4:	e51b3008 	ldr	r3, [fp, #-8]
90019be8:	e2833001 	add	r3, r3, #1
90019bec:	e50b3008 	str	r3, [fp, #-8]
90019bf0:	ea000043 	b	90019d04 <KBuddyPagesAlloc+0x1dc>
            continue;
        }

        // find the page
        page = CONTAINER_OF(list->list_head.next, struct KPage, node);
90019bf4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019bf8:	e5933004 	ldr	r3, [r3, #4]
90019bfc:	e50b3010 	str	r3, [fp, #-16]
        doubleListDel(&page->node);
90019c00:	e51b3010 	ldr	r3, [fp, #-16]
90019c04:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    _double_list_del(entry->prev, entry->next);
90019c08:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019c0c:	e5932004 	ldr	r2, [r3, #4]
90019c10:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019c14:	e5933000 	ldr	r3, [r3]
90019c18:	e50b202c 	str	r2, [fp, #-44]	; 0xffffffd4
90019c1c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    next->prev = prev;
90019c20:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90019c24:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
90019c28:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
90019c2c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019c30:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
90019c34:	e5832000 	str	r2, [r3]
    entry->next = entry;
90019c38:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019c3c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019c40:	e5832000 	str	r2, [r3]
    entry->prev = entry;
90019c44:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90019c48:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019c4c:	e5832004 	str	r2, [r3, #4]
        list->n_free_pages--;
90019c50:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019c54:	e5933000 	ldr	r3, [r3]
90019c58:	e2432001 	sub	r2, r3, #1
90019c5c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019c60:	e5832000 	str	r2, [r3]

        // split the page to some small pages
        _buddy_split_page(page, order, i, list);
90019c64:	e51b100c 	ldr	r1, [fp, #-12]
90019c68:	e51b2008 	ldr	r2, [fp, #-8]
90019c6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019c70:	e51b0010 	ldr	r0, [fp, #-16]
90019c74:	ebffff6d 	bl	90019a30 <_buddy_split_page>
90019c78:	e51b3010 	ldr	r3, [fp, #-16]
90019c7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
90019c80:	e51b300c 	ldr	r3, [fp, #-12]
90019c84:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    struct KPage* p = NULL;
90019c88:	e3a03000 	mov	r3, #0
90019c8c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    page->order = order;
90019c90:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90019c94:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90019c98:	e5832008 	str	r2, [r3, #8]
    for (i = 1; i < FREE_LIST_INDEX(order); i++) {
90019c9c:	e3a03001 	mov	r3, #1
90019ca0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90019ca4:	ea00000a 	b	90019cd4 <KBuddyPagesAlloc+0x1ac>
        p = page + i;
90019ca8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019cac:	e1a03203 	lsl	r3, r3, #4
90019cb0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019cb4:	e0823003 	add	r3, r2, r3
90019cb8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        p->page_node = page;
90019cbc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90019cc0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019cc4:	e5832008 	str	r2, [r3, #8]
    for (i = 1; i < FREE_LIST_INDEX(order); i++) {
90019cc8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019ccc:	e2833001 	add	r3, r3, #1
90019cd0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
90019cd4:	e3a02001 	mov	r2, #1
90019cd8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019cdc:	e1a03312 	lsl	r3, r2, r3
90019ce0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
90019ce4:	e1520003 	cmp	r2, r3
90019ce8:	baffffee 	blt	90019ca8 <KBuddyPagesAlloc+0x180>

        // set the pages' order
        _buddy_set_pages_order(page, order);

        spinlock_unlock(&pbuddy->lock);
90019cec:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90019cf0:	e2833020 	add	r3, r3, #32
90019cf4:	e1a00003 	mov	r0, r3
90019cf8:	ebffe851 	bl	90013e44 <spinlock_unlock>
        return page;
90019cfc:	e51b3010 	ldr	r3, [fp, #-16]
90019d00:	ea000007 	b	90019d24 <KBuddyPagesAlloc+0x1fc>
    for (i = order; i < MAX_BUDDY_ORDER; i++) {
90019d04:	e51b3008 	ldr	r3, [fp, #-8]
90019d08:	e3530009 	cmp	r3, #9
90019d0c:	daffffa5 	ble	90019ba8 <KBuddyPagesAlloc+0x80>
    }

    // there is no enough free page to satisfy the nPages
    spinlock_unlock(&pbuddy->lock);
90019d10:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90019d14:	e2833020 	add	r3, r3, #32
90019d18:	e1a00003 	mov	r0, r3
90019d1c:	ebffe848 	bl	90013e44 <spinlock_unlock>
    return NULL;
90019d20:	e3a03000 	mov	r3, #0
}
90019d24:	e1a00003 	mov	r0, r3
90019d28:	e24bd004 	sub	sp, fp, #4
90019d2c:	e8bd8800 	pop	{fp, pc}

90019d30 <KBuddyPagesFree>:

// free continuous pages from page pointer
static void KBuddyPagesFree(struct KBuddy* pbuddy, struct KPage* page)
{
90019d30:	e92d4800 	push	{fp, lr}
90019d34:	e28db004 	add	fp, sp, #4
90019d38:	e24dd040 	sub	sp, sp, #64	; 0x40
90019d3c:	e50b0040 	str	r0, [fp, #-64]	; 0xffffffc0
90019d40:	e50b1044 	str	r1, [fp, #-68]	; 0xffffffbc
    struct KPage* buddy = NULL;
90019d44:	e3a03000 	mov	r3, #0
90019d48:	e50b3010 	str	r3, [fp, #-16]
    uint32_t order = (page->order >= MAX_BUDDY_ORDER) ? 0 : page->order;
90019d4c:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
90019d50:	e5933008 	ldr	r3, [r3, #8]
90019d54:	e3530009 	cmp	r3, #9
90019d58:	8a000002 	bhi	90019d68 <KBuddyPagesFree+0x38>
90019d5c:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
90019d60:	e5933008 	ldr	r3, [r3, #8]
90019d64:	ea000000 	b	90019d6c <KBuddyPagesFree+0x3c>
90019d68:	e3a03000 	mov	r3, #0
90019d6c:	e50b3008 	str	r3, [fp, #-8]
    uint32_t buddy_idx = 0, new_buddy_idx = 0;
90019d70:	e3a03000 	mov	r3, #0
90019d74:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
90019d78:	e3a03000 	mov	r3, #0
90019d7c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    uint32_t page_idx = page - pbuddy->pages;
90019d80:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
90019d84:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
90019d88:	e28220c4 	add	r2, r2, #196	; 0xc4
90019d8c:	e0433002 	sub	r3, r3, r2
90019d90:	e1a03243 	asr	r3, r3, #4
90019d94:	e50b300c 	str	r3, [fp, #-12]

    spinlock_lock(&pbuddy->lock);
90019d98:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
90019d9c:	e2833020 	add	r3, r3, #32
90019da0:	e1a00003 	mov	r0, r3
90019da4:	ebffe7f6 	bl	90013d84 <spinlock_lock>

    for (; order < MAX_BUDDY_ORDER - 1; order++) {
90019da8:	ea00005b 	b	90019f1c <KBuddyPagesFree+0x1ec>
        // find and delete buddy to combine
        buddy_idx = BUDDY_PAGE_INDEX(page_idx, order);
90019dac:	e3a02001 	mov	r2, #1
90019db0:	e51b3008 	ldr	r3, [fp, #-8]
90019db4:	e1a03312 	lsl	r3, r2, r3
90019db8:	e1a02003 	mov	r2, r3
90019dbc:	e51b300c 	ldr	r3, [fp, #-12]
90019dc0:	e0233002 	eor	r3, r3, r2
90019dc4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        if (buddy_idx > pbuddy->n_pages - 1) {
90019dc8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
90019dcc:	e5933000 	ldr	r3, [r3]
90019dd0:	e2432001 	sub	r2, r3, #1
90019dd4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90019dd8:	e1520003 	cmp	r2, r3
90019ddc:	3a000052 	bcc	90019f2c <KBuddyPagesFree+0x1fc>
            break;
        }
        buddy = page + (buddy_idx - page_idx);
90019de0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90019de4:	e51b300c 	ldr	r3, [fp, #-12]
90019de8:	e0423003 	sub	r3, r2, r3
90019dec:	e1a03203 	lsl	r3, r3, #4
90019df0:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
90019df4:	e0823003 	add	r3, r2, r3
90019df8:	e50b3010 	str	r3, [fp, #-16]
        if (!IS_BUDDY_PAGE(buddy, order)) {
90019dfc:	e51b3010 	ldr	r3, [fp, #-16]
90019e00:	e5932008 	ldr	r2, [r3, #8]
90019e04:	e51b3008 	ldr	r3, [fp, #-8]
90019e08:	e1520003 	cmp	r2, r3
90019e0c:	1a000047 	bne	90019f30 <KBuddyPagesFree+0x200>
90019e10:	e51b3010 	ldr	r3, [fp, #-16]
90019e14:	e5932000 	ldr	r2, [r3]
90019e18:	e51b3010 	ldr	r3, [fp, #-16]
90019e1c:	e1520003 	cmp	r2, r3
90019e20:	0a000042 	beq	90019f30 <KBuddyPagesFree+0x200>
            break;
        }
        // remove buddy
        doubleListDel(&buddy->node);
90019e24:	e51b3010 	ldr	r3, [fp, #-16]
90019e28:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    _double_list_del(entry->prev, entry->next);
90019e2c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019e30:	e5932004 	ldr	r2, [r3, #4]
90019e34:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019e38:	e5933000 	ldr	r3, [r3]
90019e3c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
90019e40:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    next->prev = prev;
90019e44:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90019e48:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
90019e4c:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
90019e50:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90019e54:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
90019e58:	e5832000 	str	r2, [r3]
    entry->next = entry;
90019e5c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019e60:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90019e64:	e5832000 	str	r2, [r3]
    entry->prev = entry;
90019e68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90019e6c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90019e70:	e5832004 	str	r2, [r3, #4]
        pbuddy->free_list[order].n_free_pages--;
90019e74:	e51b1040 	ldr	r1, [fp, #-64]	; 0xffffffc0
90019e78:	e51b2008 	ldr	r2, [fp, #-8]
90019e7c:	e1a03002 	mov	r3, r2
90019e80:	e1a03083 	lsl	r3, r3, #1
90019e84:	e0833002 	add	r3, r3, r2
90019e88:	e1a03103 	lsl	r3, r3, #2
90019e8c:	e0813003 	add	r3, r1, r3
90019e90:	e2833040 	add	r3, r3, #64	; 0x40
90019e94:	e5933000 	ldr	r3, [r3]
90019e98:	e2431001 	sub	r1, r3, #1
90019e9c:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
90019ea0:	e51b2008 	ldr	r2, [fp, #-8]
90019ea4:	e1a03002 	mov	r3, r2
90019ea8:	e1a03083 	lsl	r3, r3, #1
90019eac:	e0833002 	add	r3, r3, r2
90019eb0:	e1a03103 	lsl	r3, r3, #2
90019eb4:	e0803003 	add	r3, r0, r3
90019eb8:	e2833040 	add	r3, r3, #64	; 0x40
90019ebc:	e5831000 	str	r1, [r3]
        buddy->order = MAX_BUDDY_ORDER;
90019ec0:	e51b3010 	ldr	r3, [fp, #-16]
90019ec4:	e3a0200a 	mov	r2, #10
90019ec8:	e5832008 	str	r2, [r3, #8]
        // update page and page_idx after combined
        new_buddy_idx = COMBINED_PAGE_INDEX(page_idx, order);
90019ecc:	e3a02001 	mov	r2, #1
90019ed0:	e51b3008 	ldr	r3, [fp, #-8]
90019ed4:	e1a03312 	lsl	r3, r2, r3
90019ed8:	e1e03003 	mvn	r3, r3
90019edc:	e1a02003 	mov	r2, r3
90019ee0:	e51b300c 	ldr	r3, [fp, #-12]
90019ee4:	e0033002 	and	r3, r3, r2
90019ee8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        page = page + (new_buddy_idx - page_idx);
90019eec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90019ef0:	e51b300c 	ldr	r3, [fp, #-12]
90019ef4:	e0423003 	sub	r3, r2, r3
90019ef8:	e1a03203 	lsl	r3, r3, #4
90019efc:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
90019f00:	e0823003 	add	r3, r2, r3
90019f04:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
        page_idx = new_buddy_idx;
90019f08:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90019f0c:	e50b300c 	str	r3, [fp, #-12]
    for (; order < MAX_BUDDY_ORDER - 1; order++) {
90019f10:	e51b3008 	ldr	r3, [fp, #-8]
90019f14:	e2833001 	add	r3, r3, #1
90019f18:	e50b3008 	str	r3, [fp, #-8]
90019f1c:	e51b3008 	ldr	r3, [fp, #-8]
90019f20:	e3530008 	cmp	r3, #8
90019f24:	9affffa0 	bls	90019dac <KBuddyPagesFree+0x7c>
90019f28:	ea000000 	b	90019f30 <KBuddyPagesFree+0x200>
            break;
90019f2c:	e320f000 	nop	{0}
    }
    page->order = order;
90019f30:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
90019f34:	e51b2008 	ldr	r2, [fp, #-8]
90019f38:	e5832008 	str	r2, [r3, #8]
    doubleListAddOnHead(&page->node, &pbuddy->free_list[order].list_head);
90019f3c:	e51b1044 	ldr	r1, [fp, #-68]	; 0xffffffbc
90019f40:	e51b2008 	ldr	r2, [fp, #-8]
90019f44:	e1a03002 	mov	r3, r2
90019f48:	e1a03083 	lsl	r3, r3, #1
90019f4c:	e0833002 	add	r3, r3, r2
90019f50:	e1a03103 	lsl	r3, r3, #2
90019f54:	e2833040 	add	r3, r3, #64	; 0x40
90019f58:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
90019f5c:	e0823003 	add	r3, r2, r3
90019f60:	e2833004 	add	r3, r3, #4
90019f64:	e50b1028 	str	r1, [fp, #-40]	; 0xffffffd8
90019f68:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    _double_list_add(new_node, head, head->next);
90019f6c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90019f70:	e5933000 	ldr	r3, [r3]
90019f74:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90019f78:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
90019f7c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
90019f80:	e50b2034 	str	r2, [fp, #-52]	; 0xffffffcc
90019f84:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    next->prev = new_node;
90019f88:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
90019f8c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
90019f90:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
90019f94:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90019f98:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
90019f9c:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
90019fa0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90019fa4:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
90019fa8:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
90019fac:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
90019fb0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
90019fb4:	e5832000 	str	r2, [r3]
    pbuddy->free_list[order].n_free_pages++;
90019fb8:	e51b1040 	ldr	r1, [fp, #-64]	; 0xffffffc0
90019fbc:	e51b2008 	ldr	r2, [fp, #-8]
90019fc0:	e1a03002 	mov	r3, r2
90019fc4:	e1a03083 	lsl	r3, r3, #1
90019fc8:	e0833002 	add	r3, r3, r2
90019fcc:	e1a03103 	lsl	r3, r3, #2
90019fd0:	e0813003 	add	r3, r1, r3
90019fd4:	e2833040 	add	r3, r3, #64	; 0x40
90019fd8:	e5933000 	ldr	r3, [r3]
90019fdc:	e2831001 	add	r1, r3, #1
90019fe0:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
90019fe4:	e51b2008 	ldr	r2, [fp, #-8]
90019fe8:	e1a03002 	mov	r3, r2
90019fec:	e1a03083 	lsl	r3, r3, #1
90019ff0:	e0833002 	add	r3, r3, r2
90019ff4:	e1a03103 	lsl	r3, r3, #2
90019ff8:	e0803003 	add	r3, r0, r3
90019ffc:	e2833040 	add	r3, r3, #64	; 0x40
9001a000:	e5831000 	str	r1, [r3]

    spinlock_unlock(&pbuddy->lock);
9001a004:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
9001a008:	e2833020 	add	r3, r3, #32
9001a00c:	e1a00003 	mov	r0, r3
9001a010:	ebffe78b 	bl	90013e44 <spinlock_unlock>
    return;
9001a014:	e320f000 	nop	{0}
}
9001a018:	e24bd004 	sub	sp, fp, #4
9001a01c:	e8bd8800 	pop	{fp, pc}

9001a020 <KBuddySysInit>:

void KBuddySysInit(struct KBuddy* pbuddy, uint32_t mem_start, uint32_t mem_end)
{
9001a020:	e92d4800 	push	{fp, lr}
9001a024:	e28db004 	add	fp, sp, #4
9001a028:	e24dd028 	sub	sp, sp, #40	; 0x28
9001a02c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001a030:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001a034:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    uint32_t i = 0;
9001a038:	e3a03000 	mov	r3, #0
9001a03c:	e50b3008 	str	r3, [fp, #-8]
    struct KPage* page = NULL;
9001a040:	e3a03000 	mov	r3, #0
9001a044:	e50b300c 	str	r3, [fp, #-12]
    struct KFreeList* free_list = NULL;
9001a048:	e3a03000 	mov	r3, #0
9001a04c:	e50b3010 	str	r3, [fp, #-16]

    // init spinlock
    spinlock_init(&pbuddy->lock, "kbuddy");
9001a050:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a054:	e2833020 	add	r3, r3, #32
9001a058:	e3021000 	movw	r1, #8192	; 0x2000
9001a05c:	e3491002 	movt	r1, #36866	; 0x9002
9001a060:	e1a00003 	mov	r0, r3
9001a064:	ebffe735 	bl	90013d40 <spinlock_init>

    // init global kernel Buddy system
    pbuddy->mem_start = mem_start;
9001a068:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a06c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001a070:	e58320bc 	str	r2, [r3, #188]	; 0xbc
    pbuddy->mem_end = mem_end;
9001a074:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a078:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001a07c:	e58320c0 	str	r2, [r3, #192]	; 0xc0

    // k_page is used to manage free pages
    pbuddy->mem_start = ALIGNUP(pbuddy->mem_start, 4 * PAGE_SIZE);
9001a080:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a084:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
9001a088:	e2833dff 	add	r3, r3, #16320	; 0x3fc0
9001a08c:	e283303f 	add	r3, r3, #63	; 0x3f
9001a090:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
9001a094:	e3c3303f 	bic	r3, r3, #63	; 0x3f
9001a098:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001a09c:	e58230bc 	str	r3, [r2, #188]	; 0xbc

    // total number of free pages
    pbuddy->n_pages = (pbuddy->mem_end - (uint32_t)pbuddy->mem_start) >> LEVEL4_PTE_SHIFT;
9001a0a0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0a4:	e59320c0 	ldr	r2, [r3, #192]	; 0xc0
9001a0a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0ac:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
9001a0b0:	e0423003 	sub	r3, r2, r3
9001a0b4:	e1a02623 	lsr	r2, r3, #12
9001a0b8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0bc:	e5832000 	str	r2, [r3]

    memset(pbuddy->pages, 0, pbuddy->n_pages);
9001a0c0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0c4:	e28300c4 	add	r0, r3, #196	; 0xc4
9001a0c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0cc:	e5933000 	ldr	r3, [r3]
9001a0d0:	e1a02003 	mov	r2, r3
9001a0d4:	e3a01000 	mov	r1, #0
9001a0d8:	fa001a25 	blx	90020974 <memset>

    // init each free page list from 2^0 to 2^8
    for (; i < MAX_BUDDY_ORDER; i++) {
9001a0dc:	ea000017 	b	9001a140 <KBuddySysInit+0x120>
        free_list = pbuddy->free_list + i;
9001a0e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a0e4:	e2831040 	add	r1, r3, #64	; 0x40
9001a0e8:	e51b2008 	ldr	r2, [fp, #-8]
9001a0ec:	e1a03002 	mov	r3, r2
9001a0f0:	e1a03083 	lsl	r3, r3, #1
9001a0f4:	e0833002 	add	r3, r3, r2
9001a0f8:	e1a03103 	lsl	r3, r3, #2
9001a0fc:	e0813003 	add	r3, r1, r3
9001a100:	e50b3010 	str	r3, [fp, #-16]
        doubleListNodeInit(&free_list->list_head);
9001a104:	e51b3010 	ldr	r3, [fp, #-16]
9001a108:	e2833004 	add	r3, r3, #4
9001a10c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    list->next = list;
9001a110:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a114:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001a118:	e5832000 	str	r2, [r3]
    list->prev = list;
9001a11c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a120:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001a124:	e5832004 	str	r2, [r3, #4]
        free_list->n_free_pages = 0;
9001a128:	e51b3010 	ldr	r3, [fp, #-16]
9001a12c:	e3a02000 	mov	r2, #0
9001a130:	e5832000 	str	r2, [r3]
    for (; i < MAX_BUDDY_ORDER; i++) {
9001a134:	e51b3008 	ldr	r3, [fp, #-8]
9001a138:	e2833001 	add	r3, r3, #1
9001a13c:	e50b3008 	str	r3, [fp, #-8]
9001a140:	e51b3008 	ldr	r3, [fp, #-8]
9001a144:	e3530009 	cmp	r3, #9
9001a148:	9affffe4 	bls	9001a0e0 <KBuddySysInit+0xc0>
    }

    // init and free each page
    for (i = 0; i < pbuddy->n_pages; i++) {
9001a14c:	e3a03000 	mov	r3, #0
9001a150:	e50b3008 	str	r3, [fp, #-8]
9001a154:	ea00000b 	b	9001a188 <KBuddySysInit+0x168>
        page = pbuddy->pages + i;
9001a158:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a15c:	e28320c4 	add	r2, r3, #196	; 0xc4
9001a160:	e51b3008 	ldr	r3, [fp, #-8]
9001a164:	e1a03203 	lsl	r3, r3, #4
9001a168:	e0823003 	add	r3, r2, r3
9001a16c:	e50b300c 	str	r3, [fp, #-12]
        page->order = MAX_BUDDY_ORDER;
9001a170:	e51b300c 	ldr	r3, [fp, #-12]
9001a174:	e3a0200a 	mov	r2, #10
9001a178:	e5832008 	str	r2, [r3, #8]
    for (i = 0; i < pbuddy->n_pages; i++) {
9001a17c:	e51b3008 	ldr	r3, [fp, #-8]
9001a180:	e2833001 	add	r3, r3, #1
9001a184:	e50b3008 	str	r3, [fp, #-8]
9001a188:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a18c:	e5932000 	ldr	r2, [r3]
9001a190:	e51b3008 	ldr	r3, [fp, #-8]
9001a194:	e1520003 	cmp	r2, r3
9001a198:	8affffee 	bhi	9001a158 <KBuddySysInit+0x138>
    }
    for (i = 0; i < pbuddy->n_pages; i++) {
9001a19c:	e3a03000 	mov	r3, #0
9001a1a0:	e50b3008 	str	r3, [fp, #-8]
9001a1a4:	ea000013 	b	9001a1f8 <KBuddySysInit+0x1d8>
        page = pbuddy->pages + i;
9001a1a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a1ac:	e28320c4 	add	r2, r3, #196	; 0xc4
9001a1b0:	e51b3008 	ldr	r3, [fp, #-8]
9001a1b4:	e1a03203 	lsl	r3, r3, #4
9001a1b8:	e0823003 	add	r3, r2, r3
9001a1bc:	e50b300c 	str	r3, [fp, #-12]
        doubleListNodeInit(&page->node);
9001a1c0:	e51b300c 	ldr	r3, [fp, #-12]
9001a1c4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    list->next = list;
9001a1c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a1cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001a1d0:	e5832000 	str	r2, [r3]
    list->prev = list;
9001a1d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a1d8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001a1dc:	e5832004 	str	r2, [r3, #4]
        KBuddyPagesFree(pbuddy, page);
9001a1e0:	e51b100c 	ldr	r1, [fp, #-12]
9001a1e4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001a1e8:	ebfffed0 	bl	90019d30 <KBuddyPagesFree>
    for (i = 0; i < pbuddy->n_pages; i++) {
9001a1ec:	e51b3008 	ldr	r3, [fp, #-8]
9001a1f0:	e2833001 	add	r3, r3, #1
9001a1f4:	e50b3008 	str	r3, [fp, #-8]
9001a1f8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a1fc:	e5932000 	ldr	r2, [r3]
9001a200:	e51b3008 	ldr	r3, [fp, #-8]
9001a204:	e1520003 	cmp	r2, r3
9001a208:	8affffe6 	bhi	9001a1a8 <KBuddySysInit+0x188>
    }
}
9001a20c:	e320f000 	nop	{0}
9001a210:	e24bd004 	sub	sp, fp, #4
9001a214:	e8bd8800 	pop	{fp, pc}

9001a218 <KBuddyAlloc>:

char* KBuddyAlloc(struct KBuddy* pbuddy, uint32_t size)
{
9001a218:	e92d4800 	push	{fp, lr}
9001a21c:	e28db004 	add	fp, sp, #4
9001a220:	e24dd028 	sub	sp, sp, #40	; 0x28
9001a224:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
9001a228:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    int nPages = CALCULATE_NPAGES(size);
9001a22c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001a230:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001a234:	e283300f 	add	r3, r3, #15
9001a238:	e1a03623 	lsr	r3, r3, #12
9001a23c:	e50b3008 	str	r3, [fp, #-8]
    struct KPage* page = KBuddyPagesAlloc(pbuddy, nPages);
9001a240:	e51b1008 	ldr	r1, [fp, #-8]
9001a244:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
9001a248:	ebfffe36 	bl	90019b28 <KBuddyPagesAlloc>
9001a24c:	e50b000c 	str	r0, [fp, #-12]
    if (page == NULL)
9001a250:	e51b300c 	ldr	r3, [fp, #-12]
9001a254:	e3530000 	cmp	r3, #0
9001a258:	1a000001 	bne	9001a264 <KBuddyAlloc+0x4c>
        return NULL;
9001a25c:	e3a03000 	mov	r3, #0
9001a260:	ea000016 	b	9001a2c0 <KBuddyAlloc+0xa8>

    char* v_addr = NULL;
9001a264:	e3a03000 	mov	r3, #0
9001a268:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
9001a26c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001a270:	e50b3010 	str	r3, [fp, #-16]
9001a274:	e51b300c 	ldr	r3, [fp, #-12]
9001a278:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001a27c:	e24b3020 	sub	r3, fp, #32
9001a280:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    uint32_t offset = page - pbuddy->pages;
9001a284:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a288:	e51b2010 	ldr	r2, [fp, #-16]
9001a28c:	e28220c4 	add	r2, r2, #196	; 0xc4
9001a290:	e0433002 	sub	r3, r3, r2
9001a294:	e1a03243 	asr	r3, r3, #4
9001a298:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    *vaddr = (char*)(pbuddy->mem_start + (offset << LEVEL4_PTE_SHIFT));
9001a29c:	e51b3010 	ldr	r3, [fp, #-16]
9001a2a0:	e59320bc 	ldr	r2, [r3, #188]	; 0xbc
9001a2a4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001a2a8:	e1a03603 	lsl	r3, r3, #12
9001a2ac:	e0823003 	add	r3, r2, r3
9001a2b0:	e1a02003 	mov	r2, r3
9001a2b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a2b8:	e5832000 	str	r2, [r3]
    _buddy_page_to_vaddr(pbuddy, page, &v_addr);

    return v_addr;
9001a2bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
9001a2c0:	e1a00003 	mov	r0, r3
9001a2c4:	e24bd004 	sub	sp, fp, #4
9001a2c8:	e8bd8800 	pop	{fp, pc}

9001a2cc <KBuddyFree>:

bool KBuddyFree(struct KBuddy* pbuddy, char* vaddr)
{
9001a2cc:	e92d4800 	push	{fp, lr}
9001a2d0:	e28db004 	add	fp, sp, #4
9001a2d4:	e24dd020 	sub	sp, sp, #32
9001a2d8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001a2dc:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    struct KPage* page = NULL;
9001a2e0:	e3a03000 	mov	r3, #0
9001a2e4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    if ((uint32_t)vaddr % (PAGE_SIZE)) {
9001a2e8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001a2ec:	e7eb3053 	ubfx	r3, r3, #0, #12
9001a2f0:	e3530000 	cmp	r3, #0
9001a2f4:	0a00000b 	beq	9001a328 <KBuddyFree+0x5c>
        ERROR("kbuddyfree - unaligned: %x\n", vaddr);
9001a2f8:	e3a020ce 	mov	r2, #206	; 0xce
9001a2fc:	e30210c4 	movw	r1, #8388	; 0x20c4
9001a300:	e3491002 	movt	r1, #36866	; 0x9002
9001a304:	e3020008 	movw	r0, #8200	; 0x2008
9001a308:	e3490002 	movt	r0, #36866	; 0x9002
9001a30c:	ebffec19 	bl	90015378 <KPrintf>
9001a310:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001a314:	e3020018 	movw	r0, #8216	; 0x2018
9001a318:	e3490002 	movt	r0, #36866	; 0x9002
9001a31c:	ebffec15 	bl	90015378 <KPrintf>
        return false;
9001a320:	e3a03000 	mov	r3, #0
9001a324:	ea000039 	b	9001a410 <KBuddyFree+0x144>
    }
    if ((uint32_t)vaddr < pbuddy->mem_start) {
9001a328:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a32c:	e59320bc 	ldr	r2, [r3, #188]	; 0xbc
9001a330:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001a334:	e1520003 	cmp	r2, r3
9001a338:	9a00000b 	bls	9001a36c <KBuddyFree+0xa0>
        ERROR("kbuddyfree - under buddy free page address: %x\n", vaddr);
9001a33c:	e3a020d2 	mov	r2, #210	; 0xd2
9001a340:	e30210c4 	movw	r1, #8388	; 0x20c4
9001a344:	e3491002 	movt	r1, #36866	; 0x9002
9001a348:	e3020008 	movw	r0, #8200	; 0x2008
9001a34c:	e3490002 	movt	r0, #36866	; 0x9002
9001a350:	ebffec08 	bl	90015378 <KPrintf>
9001a354:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001a358:	e3020034 	movw	r0, #8244	; 0x2034
9001a35c:	e3490002 	movt	r0, #36866	; 0x9002
9001a360:	ebffec04 	bl	90015378 <KPrintf>
        return false;
9001a364:	e3a03000 	mov	r3, #0
9001a368:	ea000028 	b	9001a410 <KBuddyFree+0x144>
    }
    if ((uint32_t)vaddr >= pbuddy->mem_end) {
9001a36c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a370:	e59320c0 	ldr	r2, [r3, #192]	; 0xc0
9001a374:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001a378:	e1520003 	cmp	r2, r3
9001a37c:	8a00000b 	bhi	9001a3b0 <KBuddyFree+0xe4>
        ERROR("kbuddyfree - over buddy free page address: %x\n", vaddr);
9001a380:	e3a020d6 	mov	r2, #214	; 0xd6
9001a384:	e30210c4 	movw	r1, #8388	; 0x20c4
9001a388:	e3491002 	movt	r1, #36866	; 0x9002
9001a38c:	e3020008 	movw	r0, #8200	; 0x2008
9001a390:	e3490002 	movt	r0, #36866	; 0x9002
9001a394:	ebffebf7 	bl	90015378 <KPrintf>
9001a398:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001a39c:	e3020064 	movw	r0, #8292	; 0x2064
9001a3a0:	e3490002 	movt	r0, #36866	; 0x9002
9001a3a4:	ebffebf3 	bl	90015378 <KPrintf>
        return false;
9001a3a8:	e3a03000 	mov	r3, #0
9001a3ac:	ea000017 	b	9001a410 <KBuddyFree+0x144>
9001a3b0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a3b4:	e50b3008 	str	r3, [fp, #-8]
9001a3b8:	e24b3018 	sub	r3, fp, #24
9001a3bc:	e50b300c 	str	r3, [fp, #-12]
9001a3c0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001a3c4:	e50b3010 	str	r3, [fp, #-16]
    uint32_t offset = (uint32_t)vaddr - pbuddy->mem_start;
9001a3c8:	e51b2010 	ldr	r2, [fp, #-16]
9001a3cc:	e51b3008 	ldr	r3, [fp, #-8]
9001a3d0:	e59330bc 	ldr	r3, [r3, #188]	; 0xbc
9001a3d4:	e0423003 	sub	r3, r2, r3
9001a3d8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    *page = (struct KPage*)(pbuddy->pages + (offset >> LEVEL4_PTE_SHIFT));
9001a3dc:	e51b3008 	ldr	r3, [fp, #-8]
9001a3e0:	e28320c4 	add	r2, r3, #196	; 0xc4
9001a3e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a3e8:	e1a03623 	lsr	r3, r3, #12
9001a3ec:	e1a03203 	lsl	r3, r3, #4
9001a3f0:	e0822003 	add	r2, r2, r3
9001a3f4:	e51b300c 	ldr	r3, [fp, #-12]
9001a3f8:	e5832000 	str	r2, [r3]
    }

    _buddy_vaddr_to_page(pbuddy, &page, vaddr);
    KBuddyPagesFree(pbuddy, page);
9001a3fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a400:	e1a01003 	mov	r1, r3
9001a404:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001a408:	ebfffe48 	bl	90019d30 <KBuddyPagesFree>

    return true;
9001a40c:	e3a03001 	mov	r3, #1
}
9001a410:	e1a00003 	mov	r0, r3
9001a414:	e24bd004 	sub	sp, fp, #4
9001a418:	e8bd8800 	pop	{fp, pc}

9001a41c <KFreePagesInfo>:

void KFreePagesInfo(struct KBuddy* pbuddy)
{
9001a41c:	e92d4800 	push	{fp, lr}
9001a420:	e28db004 	add	fp, sp, #4
9001a424:	e24dd010 	sub	sp, sp, #16
9001a428:	e50b0010 	str	r0, [fp, #-16]
    DEBUG("Buddy structure:");
9001a42c:	e30210d0 	movw	r1, #8400	; 0x20d0
9001a430:	e3491002 	movt	r1, #36866	; 0x9002
9001a434:	e3020094 	movw	r0, #8340	; 0x2094
9001a438:	e3490002 	movt	r0, #36866	; 0x9002
9001a43c:	ebffebcd 	bl	90015378 <KPrintf>
9001a440:	e30200a4 	movw	r0, #8356	; 0x20a4
9001a444:	e3490002 	movt	r0, #36866	; 0x9002
9001a448:	ebffebca 	bl	90015378 <KPrintf>
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
9001a44c:	e3a03000 	mov	r3, #0
9001a450:	e50b3008 	str	r3, [fp, #-8]
9001a454:	ea00000f 	b	9001a498 <KFreePagesInfo+0x7c>
        DEBUG_PRINTF(" %d ", pbuddy->free_list[j].n_free_pages);
9001a458:	e51b1010 	ldr	r1, [fp, #-16]
9001a45c:	e51b2008 	ldr	r2, [fp, #-8]
9001a460:	e1a03002 	mov	r3, r2
9001a464:	e1a03083 	lsl	r3, r3, #1
9001a468:	e0833002 	add	r3, r3, r2
9001a46c:	e1a03103 	lsl	r3, r3, #2
9001a470:	e0813003 	add	r3, r1, r3
9001a474:	e2833040 	add	r3, r3, #64	; 0x40
9001a478:	e5933000 	ldr	r3, [r3]
9001a47c:	e1a01003 	mov	r1, r3
9001a480:	e30200b8 	movw	r0, #8376	; 0x20b8
9001a484:	e3490002 	movt	r0, #36866	; 0x9002
9001a488:	ebffebba 	bl	90015378 <KPrintf>
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
9001a48c:	e51b3008 	ldr	r3, [fp, #-8]
9001a490:	e2833001 	add	r3, r3, #1
9001a494:	e50b3008 	str	r3, [fp, #-8]
9001a498:	e51b3008 	ldr	r3, [fp, #-8]
9001a49c:	e3530009 	cmp	r3, #9
9001a4a0:	daffffec 	ble	9001a458 <KFreePagesInfo+0x3c>
    }
    DEBUG_PRINTF("\n");
9001a4a4:	e30200c0 	movw	r0, #8384	; 0x20c0
9001a4a8:	e3490002 	movt	r0, #36866	; 0x9002
9001a4ac:	ebffebb1 	bl	90015378 <KPrintf>
9001a4b0:	e320f000 	nop	{0}
9001a4b4:	e24bd004 	sub	sp, fp, #4
9001a4b8:	e8bd8800 	pop	{fp, pc}

9001a4bc <slab_init>:

#define ARENA_SIZE_PER_INCREASE PAGE_SIZE
#define MAX_NR_ELEMENT_PER_SLABPAGE 64

void slab_init(struct slab_allocator* const allocator, const size_t element_size)
{
9001a4bc:	e92d4830 	push	{r4, r5, fp, lr}
9001a4c0:	e28db00c 	add	fp, sp, #12
9001a4c4:	e24dd008 	sub	sp, sp, #8
9001a4c8:	e50b0010 	str	r0, [fp, #-16]
9001a4cc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    if (allocator == NULL) {
9001a4d0:	e51b3010 	ldr	r3, [fp, #-16]
9001a4d4:	e3530000 	cmp	r3, #0
9001a4d8:	1a000002 	bne	9001a4e8 <slab_init+0x2c>
        panic("init a NULL slab_allocator\n");
9001a4dc:	e30200e0 	movw	r0, #8416	; 0x20e0
9001a4e0:	e3490002 	movt	r0, #36866	; 0x9002
9001a4e4:	ebffe295 	bl	90012f40 <panic>
    }
    if (element_size <= 0 || element_size > ARENA_SIZE_PER_INCREASE) {
9001a4e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a4ec:	e3530000 	cmp	r3, #0
9001a4f0:	0a000002 	beq	9001a500 <slab_init+0x44>
9001a4f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001a4f8:	e3530a01 	cmp	r3, #4096	; 0x1000
9001a4fc:	9a000002 	bls	9001a50c <slab_init+0x50>
        panic("Not supported slab element size\n");
9001a500:	e30200fc 	movw	r0, #8444	; 0x20fc
9001a504:	e3490002 	movt	r0, #36866	; 0x9002
9001a508:	ebffe28c 	bl	90012f40 <panic>
    }

    allocator->element_size = element_size;
9001a50c:	e51b3010 	ldr	r3, [fp, #-16]
9001a510:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001a514:	e5832000 	str	r2, [r3]
    allocator->slabsize = ARENA_SIZE_PER_INCREASE;
9001a518:	e51b3010 	ldr	r3, [fp, #-16]
9001a51c:	e3a02a01 	mov	r2, #4096	; 0x1000
9001a520:	e5832008 	str	r2, [r3, #8]

    allocator->nr_elements = (allocator->slabsize - offsetof(struct slab_state, data)) / element_size;
9001a524:	e51b3010 	ldr	r3, [fp, #-16]
9001a528:	e5933008 	ldr	r3, [r3, #8]
9001a52c:	e2433014 	sub	r3, r3, #20
9001a530:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001a534:	e1a00003 	mov	r0, r3
9001a538:	fa0017d8 	blx	900204a0 <__udivsi3>
9001a53c:	e1a03000 	mov	r3, r0
9001a540:	e1a02003 	mov	r2, r3
9001a544:	e51b3010 	ldr	r3, [fp, #-16]
9001a548:	e5832004 	str	r2, [r3, #4]
    allocator->nr_elements = allocator->nr_elements > MAX_NR_ELEMENT_PER_SLABPAGE ? MAX_NR_ELEMENT_PER_SLABPAGE : allocator->nr_elements;
9001a54c:	e51b3010 	ldr	r3, [fp, #-16]
9001a550:	e5933004 	ldr	r3, [r3, #4]
9001a554:	e3530040 	cmp	r3, #64	; 0x40
9001a558:	31a02003 	movcc	r2, r3
9001a55c:	23a02040 	movcs	r2, #64	; 0x40
9001a560:	e51b3010 	ldr	r3, [fp, #-16]
9001a564:	e5832004 	str	r2, [r3, #4]

    allocator->bitmap_empty = ~BITMAP_BITS_EMPTY_FULL >> (MAX_NR_ELEMENT_PER_SLABPAGE - allocator->nr_elements);
9001a568:	e51b3010 	ldr	r3, [fp, #-16]
9001a56c:	e5933004 	ldr	r3, [r3, #4]
9001a570:	e2631040 	rsb	r1, r3, #64	; 0x40
9001a574:	e3e02000 	mvn	r2, #0
9001a578:	e3e03000 	mvn	r3, #0
9001a57c:	e261c020 	rsb	ip, r1, #32
9001a580:	e2410020 	sub	r0, r1, #32
9001a584:	e1a04132 	lsr	r4, r2, r1
9001a588:	e1844c13 	orr	r4, r4, r3, lsl ip
9001a58c:	e1844033 	orr	r4, r4, r3, lsr r0
9001a590:	e1a05133 	lsr	r5, r3, r1
9001a594:	e51b3010 	ldr	r3, [fp, #-16]
9001a598:	e1c341f0 	strd	r4, [r3, #16]

    allocator->partial = allocator->empty = allocator->full = NULL;
9001a59c:	e51b3010 	ldr	r3, [fp, #-16]
9001a5a0:	e3a02000 	mov	r2, #0
9001a5a4:	e5832020 	str	r2, [r3, #32]
9001a5a8:	e51b3010 	ldr	r3, [fp, #-16]
9001a5ac:	e5932020 	ldr	r2, [r3, #32]
9001a5b0:	e51b3010 	ldr	r3, [fp, #-16]
9001a5b4:	e583201c 	str	r2, [r3, #28]
9001a5b8:	e51b3010 	ldr	r3, [fp, #-16]
9001a5bc:	e593201c 	ldr	r2, [r3, #28]
9001a5c0:	e51b3010 	ldr	r3, [fp, #-16]
9001a5c4:	e5832018 	str	r2, [r3, #24]
}
9001a5c8:	e320f000 	nop	{0}
9001a5cc:	e24bd00c 	sub	sp, fp, #12
9001a5d0:	e8bd8830 	pop	{r4, r5, fp, pc}

9001a5d4 <slab_alloc>:

void* slab_alloc(struct slab_allocator* const allocator)
{
9001a5d4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
9001a5d8:	e28db014 	add	fp, sp, #20
9001a5dc:	e24dd010 	sub	sp, sp, #16
9001a5e0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    assert(allocator != NULL);
9001a5e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a5e8:	e3530000 	cmp	r3, #0
9001a5ec:	1a00000d 	bne	9001a628 <slab_alloc+0x54>
9001a5f0:	e3a02048 	mov	r2, #72	; 0x48
9001a5f4:	e302117c 	movw	r1, #8572	; 0x217c
9001a5f8:	e3491002 	movt	r1, #36866	; 0x9002
9001a5fc:	e3020120 	movw	r0, #8480	; 0x2120
9001a600:	e3490002 	movt	r0, #36866	; 0x9002
9001a604:	ebffeb5b 	bl	90015378 <KPrintf>
9001a608:	e3021130 	movw	r1, #8496	; 0x2130
9001a60c:	e3491002 	movt	r1, #36866	; 0x9002
9001a610:	e3020144 	movw	r0, #8516	; 0x2144
9001a614:	e3490002 	movt	r0, #36866	; 0x9002
9001a618:	ebffeb56 	bl	90015378 <KPrintf>
9001a61c:	e3020154 	movw	r0, #8532	; 0x2154
9001a620:	e3490002 	movt	r0, #36866	; 0x9002
9001a624:	ebffe245 	bl	90012f40 <panic>

    if (LIKELY(allocator->partial != NULL)) {
9001a628:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a62c:	e5933018 	ldr	r3, [r3, #24]
9001a630:	e3530000 	cmp	r3, #0
9001a634:	13a03001 	movne	r3, #1
9001a638:	03a03000 	moveq	r3, #0
9001a63c:	e6ef3073 	uxtb	r3, r3
9001a640:	e3530000 	cmp	r3, #0
9001a644:	0a000050 	beq	9001a78c <slab_alloc+0x1b8>
        register const size_t slot = BITMAP_FIND_FIRST_BIT(allocator->partial->bitmap);
9001a648:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a64c:	e5933018 	ldr	r3, [r3, #24]
9001a650:	e1c320d8 	ldrd	r2, [r3, #8]
9001a654:	e1a00002 	mov	r0, r2
9001a658:	e1a01003 	mov	r1, r3
9001a65c:	fa00182e 	blx	9002071c <__ctzdi2>
9001a660:	e1a03000 	mov	r3, r0
9001a664:	e1a06003 	mov	r6, r3
        allocator->partial->bitmap ^= BITMAP_FIRST_BIT << slot;
9001a668:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a66c:	e593c018 	ldr	ip, [r3, #24]
9001a670:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a674:	e5933018 	ldr	r3, [r3, #24]
9001a678:	e1c300d8 	ldrd	r0, [r3, #8]
9001a67c:	e3a02001 	mov	r2, #1
9001a680:	e3a03000 	mov	r3, #0
9001a684:	e2467020 	sub	r7, r6, #32
9001a688:	e266e020 	rsb	lr, r6, #32
9001a68c:	e1a05613 	lsl	r5, r3, r6
9001a690:	e1855712 	orr	r5, r5, r2, lsl r7
9001a694:	e1855e32 	orr	r5, r5, r2, lsr lr
9001a698:	e1a04612 	lsl	r4, r2, r6
9001a69c:	e0202004 	eor	r2, r0, r4
9001a6a0:	e0213005 	eor	r3, r1, r5
9001a6a4:	e1cc20f8 	strd	r2, [ip, #8]

        if (UNLIKELY(allocator->partial->bitmap == BITMAP_BITS_EMPTY_FULL)) {
9001a6a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a6ac:	e5933018 	ldr	r3, [r3, #24]
9001a6b0:	e1c320d8 	ldrd	r2, [r3, #8]
9001a6b4:	e1823003 	orr	r3, r2, r3
9001a6b8:	e3530000 	cmp	r3, #0
9001a6bc:	03a03001 	moveq	r3, #1
9001a6c0:	13a03000 	movne	r3, #0
9001a6c4:	e6ef3073 	uxtb	r3, r3
9001a6c8:	e3530000 	cmp	r3, #0
9001a6cc:	0a000026 	beq	9001a76c <slab_alloc+0x198>
            struct slab_state* const full_head = allocator->partial;
9001a6d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a6d4:	e5933018 	ldr	r3, [r3, #24]
9001a6d8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
            if ((allocator->partial = allocator->partial->next) != NULL) {
9001a6dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a6e0:	e5933018 	ldr	r3, [r3, #24]
9001a6e4:	e5932004 	ldr	r2, [r3, #4]
9001a6e8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a6ec:	e5832018 	str	r2, [r3, #24]
9001a6f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a6f4:	e5933018 	ldr	r3, [r3, #24]
9001a6f8:	e3530000 	cmp	r3, #0
9001a6fc:	0a000003 	beq	9001a710 <slab_alloc+0x13c>
                allocator->partial->prev = NULL;
9001a700:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a704:	e5933018 	ldr	r3, [r3, #24]
9001a708:	e3a02000 	mov	r2, #0
9001a70c:	e5832000 	str	r2, [r3]
            }
            if ((full_head->next = allocator->full) != NULL) {
9001a710:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a714:	e5932020 	ldr	r2, [r3, #32]
9001a718:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a71c:	e5832004 	str	r2, [r3, #4]
9001a720:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001a724:	e5933004 	ldr	r3, [r3, #4]
9001a728:	e3530000 	cmp	r3, #0
9001a72c:	0a000003 	beq	9001a740 <slab_alloc+0x16c>
                allocator->full->prev = full_head;
9001a730:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a734:	e5933020 	ldr	r3, [r3, #32]
9001a738:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001a73c:	e5832000 	str	r2, [r3]
            }
            allocator->full = full_head;
9001a740:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a744:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001a748:	e5832020 	str	r2, [r3, #32]
            return allocator->full->data + slot * allocator->element_size;
9001a74c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a750:	e5933020 	ldr	r3, [r3, #32]
9001a754:	e2832014 	add	r2, r3, #20
9001a758:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a75c:	e5933000 	ldr	r3, [r3]
9001a760:	e0030396 	mul	r3, r6, r3
9001a764:	e0823003 	add	r3, r2, r3
9001a768:	ea000060 	b	9001a8f0 <slab_alloc+0x31c>
        } else {
            return allocator->partial->data + slot * allocator->element_size;
9001a76c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a770:	e5933018 	ldr	r3, [r3, #24]
9001a774:	e2832014 	add	r2, r3, #20
9001a778:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a77c:	e5933000 	ldr	r3, [r3]
9001a780:	e0030396 	mul	r3, r6, r3
9001a784:	e0823003 	add	r3, r2, r3
9001a788:	ea000058 	b	9001a8f0 <slab_alloc+0x31c>
        }
    }

    /* there is no partial slab */
    if (LIKELY((allocator->partial = allocator->empty) != NULL)) {
9001a78c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a790:	e593201c 	ldr	r2, [r3, #28]
9001a794:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a798:	e5832018 	str	r2, [r3, #24]
9001a79c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a7a0:	e5933018 	ldr	r3, [r3, #24]
9001a7a4:	e3530000 	cmp	r3, #0
9001a7a8:	13a03001 	movne	r3, #1
9001a7ac:	03a03000 	moveq	r3, #0
9001a7b0:	e6ef3073 	uxtb	r3, r3
9001a7b4:	e3530000 	cmp	r3, #0
9001a7b8:	0a00001a 	beq	9001a828 <slab_alloc+0x254>
        /* achieve (partial) slab from empty */
        if (LIKELY((allocator->empty = allocator->empty->next) != NULL)) {
9001a7bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a7c0:	e593301c 	ldr	r3, [r3, #28]
9001a7c4:	e5932004 	ldr	r2, [r3, #4]
9001a7c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a7cc:	e583201c 	str	r2, [r3, #28]
9001a7d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a7d4:	e593301c 	ldr	r3, [r3, #28]
9001a7d8:	e3530000 	cmp	r3, #0
9001a7dc:	13a03001 	movne	r3, #1
9001a7e0:	03a03000 	moveq	r3, #0
9001a7e4:	e6ef3073 	uxtb	r3, r3
9001a7e8:	e3530000 	cmp	r3, #0
9001a7ec:	0a000003 	beq	9001a800 <slab_alloc+0x22c>
            allocator->empty->prev = NULL;
9001a7f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a7f4:	e593301c 	ldr	r3, [r3, #28]
9001a7f8:	e3a02000 	mov	r2, #0
9001a7fc:	e5832000 	str	r2, [r3]
        }
        allocator->partial->next = NULL;
9001a800:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a804:	e5933018 	ldr	r3, [r3, #24]
9001a808:	e3a02000 	mov	r2, #0
9001a80c:	e5832004 	str	r2, [r3, #4]
        allocator->partial->refcount++;
9001a810:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a814:	e5933018 	ldr	r3, [r3, #24]
9001a818:	e5932010 	ldr	r2, [r3, #16]
9001a81c:	e2822001 	add	r2, r2, #1
9001a820:	e5832010 	str	r2, [r3, #16]
9001a824:	ea000028 	b	9001a8cc <slab_alloc+0x2f8>
    } else {
        /* achieve slab from outer arena */
        allocator->partial = (struct slab_state*)LOWLEVEL_ALLOC(allocator->slabsize);
9001a828:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a82c:	e5933008 	ldr	r3, [r3, #8]
9001a830:	e1a00003 	mov	r0, r3
9001a834:	ebfff90e 	bl	90018c74 <kalloc>
9001a838:	e1a02000 	mov	r2, r0
9001a83c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a840:	e5832018 	str	r2, [r3, #24]
        if (UNLIKELY(allocator->partial == NULL)) {
9001a844:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a848:	e5933018 	ldr	r3, [r3, #24]
9001a84c:	e3530000 	cmp	r3, #0
9001a850:	03a03001 	moveq	r3, #1
9001a854:	13a03000 	movne	r3, #0
9001a858:	e6ef3073 	uxtb	r3, r3
9001a85c:	e3530000 	cmp	r3, #0
9001a860:	0a00000d 	beq	9001a89c <slab_alloc+0x2c8>
            ERROR("no enough memory\n");
9001a864:	e3a02069 	mov	r2, #105	; 0x69
9001a868:	e302117c 	movw	r1, #8572	; 0x217c
9001a86c:	e3491002 	movt	r1, #36866	; 0x9002
9001a870:	e3020120 	movw	r0, #8480	; 0x2120
9001a874:	e3490002 	movt	r0, #36866	; 0x9002
9001a878:	ebffeabe 	bl	90015378 <KPrintf>
9001a87c:	e3020158 	movw	r0, #8536	; 0x2158
9001a880:	e3490002 	movt	r0, #36866	; 0x9002
9001a884:	ebffeabb 	bl	90015378 <KPrintf>
            return allocator->partial = NULL;
9001a888:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a88c:	e3a02000 	mov	r2, #0
9001a890:	e5832018 	str	r2, [r3, #24]
9001a894:	e3a03000 	mov	r3, #0
9001a898:	ea000014 	b	9001a8f0 <slab_alloc+0x31c>
        }
        allocator->partial->prev = allocator->partial->next = NULL;
9001a89c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8a0:	e5932018 	ldr	r2, [r3, #24]
9001a8a4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8a8:	e5933018 	ldr	r3, [r3, #24]
9001a8ac:	e3a01000 	mov	r1, #0
9001a8b0:	e5831004 	str	r1, [r3, #4]
9001a8b4:	e5933004 	ldr	r3, [r3, #4]
9001a8b8:	e5823000 	str	r3, [r2]
        allocator->partial->refcount = 1;
9001a8bc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8c0:	e5933018 	ldr	r3, [r3, #24]
9001a8c4:	e3a02001 	mov	r2, #1
9001a8c8:	e5832010 	str	r2, [r3, #16]
    }
    allocator->partial->bitmap = allocator->bitmap_empty ^ BITMAP_FIRST_BIT;
9001a8cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8d0:	e5931018 	ldr	r1, [r3, #24]
9001a8d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8d8:	e1c321d0 	ldrd	r2, [r3, #16]
9001a8dc:	e2222001 	eor	r2, r2, #1
9001a8e0:	e1c120f8 	strd	r2, [r1, #8]
    return allocator->partial->data;
9001a8e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a8e8:	e5933018 	ldr	r3, [r3, #24]
9001a8ec:	e2833014 	add	r3, r3, #20
}
9001a8f0:	e1a00003 	mov	r0, r3
9001a8f4:	e24bd014 	sub	sp, fp, #20
9001a8f8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

9001a8fc <slab_free>:

void slab_free(struct slab_allocator* const allocator, const void* const addr)
{
9001a8fc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
9001a900:	e28db018 	add	fp, sp, #24
9001a904:	e24dd014 	sub	sp, sp, #20
9001a908:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
9001a90c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    assert(allocator != NULL);
9001a910:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001a914:	e3530000 	cmp	r3, #0
9001a918:	1a00000d 	bne	9001a954 <slab_free+0x58>
9001a91c:	e3a02075 	mov	r2, #117	; 0x75
9001a920:	e3021188 	movw	r1, #8584	; 0x2188
9001a924:	e3491002 	movt	r1, #36866	; 0x9002
9001a928:	e3020120 	movw	r0, #8480	; 0x2120
9001a92c:	e3490002 	movt	r0, #36866	; 0x9002
9001a930:	ebffea90 	bl	90015378 <KPrintf>
9001a934:	e3021130 	movw	r1, #8496	; 0x2130
9001a938:	e3491002 	movt	r1, #36866	; 0x9002
9001a93c:	e3020144 	movw	r0, #8516	; 0x2144
9001a940:	e3490002 	movt	r0, #36866	; 0x9002
9001a944:	ebffea8b 	bl	90015378 <KPrintf>
9001a948:	e3020154 	movw	r0, #8532	; 0x2154
9001a94c:	e3490002 	movt	r0, #36866	; 0x9002
9001a950:	ebffe17a 	bl	90012f40 <panic>
    assert(addr != NULL);
9001a954:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001a958:	e3530000 	cmp	r3, #0
9001a95c:	1a00000d 	bne	9001a998 <slab_free+0x9c>
9001a960:	e3a02076 	mov	r2, #118	; 0x76
9001a964:	e3021188 	movw	r1, #8584	; 0x2188
9001a968:	e3491002 	movt	r1, #36866	; 0x9002
9001a96c:	e3020120 	movw	r0, #8480	; 0x2120
9001a970:	e3490002 	movt	r0, #36866	; 0x9002
9001a974:	ebffea7f 	bl	90015378 <KPrintf>
9001a978:	e302116c 	movw	r1, #8556	; 0x216c
9001a97c:	e3491002 	movt	r1, #36866	; 0x9002
9001a980:	e3020144 	movw	r0, #8516	; 0x2144
9001a984:	e3490002 	movt	r0, #36866	; 0x9002
9001a988:	ebffea7a 	bl	90015378 <KPrintf>
9001a98c:	e3020154 	movw	r0, #8532	; 0x2154
9001a990:	e3490002 	movt	r0, #36866	; 0x9002
9001a994:	ebffe169 	bl	90012f40 <panic>

    struct slab_state* const slab_to_free = (void*)ALIGNDOWN(addr, allocator->slabsize);
9001a998:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001a99c:	e5933008 	ldr	r3, [r3, #8]
9001a9a0:	e2632000 	rsb	r2, r3, #0
9001a9a4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001a9a8:	e0033002 	and	r3, r3, r2
9001a9ac:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    register const size_t slot = ((char*)addr - (char*)slab_to_free - offsetof(struct slab_state, data)) / allocator->element_size;
9001a9b0:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001a9b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a9b8:	e0423003 	sub	r3, r2, r3
9001a9bc:	e2432014 	sub	r2, r3, #20
9001a9c0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001a9c4:	e5933000 	ldr	r3, [r3]
9001a9c8:	e1a01003 	mov	r1, r3
9001a9cc:	e1a00002 	mov	r0, r2
9001a9d0:	fa0016b2 	blx	900204a0 <__udivsi3>
9001a9d4:	e1a03000 	mov	r3, r0
9001a9d8:	e1a08003 	mov	r8, r3

    if (UNLIKELY(slab_to_free->bitmap == BITMAP_BITS_EMPTY_FULL)) {
9001a9dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001a9e0:	e1c320d8 	ldrd	r2, [r3, #8]
9001a9e4:	e1823003 	orr	r3, r2, r3
9001a9e8:	e3530000 	cmp	r3, #0
9001a9ec:	03a03001 	moveq	r3, #1
9001a9f0:	13a03000 	movne	r3, #0
9001a9f4:	e6ef3073 	uxtb	r3, r3
9001a9f8:	e3530000 	cmp	r3, #0
9001a9fc:	0a000048 	beq	9001ab24 <slab_free+0x228>
        /* free element from full slab */
        slab_to_free->bitmap = BITMAP_FIRST_BIT << slot;
9001aa00:	e3a02001 	mov	r2, #1
9001aa04:	e3a03000 	mov	r3, #0
9001aa08:	e2480020 	sub	r0, r8, #32
9001aa0c:	e2681020 	rsb	r1, r8, #32
9001aa10:	e1a07813 	lsl	r7, r3, r8
9001aa14:	e1877012 	orr	r7, r7, r2, lsl r0
9001aa18:	e1877132 	orr	r7, r7, r2, lsr r1
9001aa1c:	e1a06812 	lsl	r6, r2, r8
9001aa20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aa24:	e1c360f8 	strd	r6, [r3, #8]

        if (LIKELY(slab_to_free != allocator->full)) {
9001aa28:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aa2c:	e5932020 	ldr	r2, [r3, #32]
9001aa30:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aa34:	e1520003 	cmp	r2, r3
9001aa38:	13a03001 	movne	r3, #1
9001aa3c:	03a03000 	moveq	r3, #0
9001aa40:	e6ef3073 	uxtb	r3, r3
9001aa44:	e3530000 	cmp	r3, #0
9001aa48:	0a000014 	beq	9001aaa0 <slab_free+0x1a4>
            if (LIKELY((slab_to_free->prev->next = slab_to_free->next) != NULL)) {
9001aa4c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aa50:	e5933000 	ldr	r3, [r3]
9001aa54:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001aa58:	e5922004 	ldr	r2, [r2, #4]
9001aa5c:	e5832004 	str	r2, [r3, #4]
9001aa60:	e5933004 	ldr	r3, [r3, #4]
9001aa64:	e3530000 	cmp	r3, #0
9001aa68:	13a03001 	movne	r3, #1
9001aa6c:	03a03000 	moveq	r3, #0
9001aa70:	e6ef3073 	uxtb	r3, r3
9001aa74:	e3530000 	cmp	r3, #0
9001aa78:	0a000004 	beq	9001aa90 <slab_free+0x194>
                slab_to_free->next->prev = slab_to_free->prev;
9001aa7c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aa80:	e5933004 	ldr	r3, [r3, #4]
9001aa84:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001aa88:	e5922000 	ldr	r2, [r2]
9001aa8c:	e5832000 	str	r2, [r3]
            }
            slab_to_free->prev = NULL;
9001aa90:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aa94:	e3a02000 	mov	r2, #0
9001aa98:	e5832000 	str	r2, [r3]
9001aa9c:	ea00000c 	b	9001aad4 <slab_free+0x1d8>
        } else if ((allocator->full = allocator->full->next) != NULL) {
9001aaa0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aaa4:	e5933020 	ldr	r3, [r3, #32]
9001aaa8:	e5932004 	ldr	r2, [r3, #4]
9001aaac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aab0:	e5832020 	str	r2, [r3, #32]
9001aab4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aab8:	e5933020 	ldr	r3, [r3, #32]
9001aabc:	e3530000 	cmp	r3, #0
9001aac0:	0a000003 	beq	9001aad4 <slab_free+0x1d8>
            allocator->full->prev = NULL;
9001aac4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aac8:	e5933020 	ldr	r3, [r3, #32]
9001aacc:	e3a02000 	mov	r2, #0
9001aad0:	e5832000 	str	r2, [r3]
        }

        slab_to_free->next = allocator->partial;
9001aad4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aad8:	e5932018 	ldr	r2, [r3, #24]
9001aadc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001aae0:	e5832004 	str	r2, [r3, #4]
        if (LIKELY(allocator->partial != NULL)) {
9001aae4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001aae8:	e5933018 	ldr	r3, [r3, #24]
9001aaec:	e3530000 	cmp	r3, #0
9001aaf0:	13a03001 	movne	r3, #1
9001aaf4:	03a03000 	moveq	r3, #0
9001aaf8:	e6ef3073 	uxtb	r3, r3
9001aafc:	e3530000 	cmp	r3, #0
9001ab00:	0a000003 	beq	9001ab14 <slab_free+0x218>
            allocator->partial->prev = slab_to_free;
9001ab04:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ab08:	e5933018 	ldr	r3, [r3, #24]
9001ab0c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ab10:	e5832000 	str	r2, [r3]
        }
        allocator->partial = slab_to_free;
9001ab14:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ab18:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ab1c:	e5832018 	str	r2, [r3, #24]
            slab_to_free->refcount--;
        }
    } else {
        slab_to_free->bitmap |= BITMAP_FIRST_BIT << slot;
    }
}
9001ab20:	ea0000a3 	b	9001adb4 <slab_free+0x4b8>
    } else if (UNLIKELY(BITMAP_USED_SOLE_BIT(slab_to_free->bitmap, allocator->bitmap_empty))) {
9001ab24:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ab28:	e1c320d8 	ldrd	r2, [r3, #8]
9001ab2c:	e1e00002 	mvn	r0, r2
9001ab30:	e1e01003 	mvn	r1, r3
9001ab34:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ab38:	e1c321d0 	ldrd	r2, [r3, #16]
9001ab3c:	e0000002 	and	r0, r0, r2
9001ab40:	e0011003 	and	r1, r1, r3
9001ab44:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ab48:	e1c320d8 	ldrd	r2, [r3, #8]
9001ab4c:	e1e06002 	mvn	r6, r2
9001ab50:	e1e07003 	mvn	r7, r3
9001ab54:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ab58:	e1c321d0 	ldrd	r2, [r3, #16]
9001ab5c:	e0022006 	and	r2, r2, r6
9001ab60:	e0033007 	and	r3, r3, r7
9001ab64:	e2522001 	subs	r2, r2, #1
9001ab68:	e2c33000 	sbc	r3, r3, #0
9001ab6c:	e0022000 	and	r2, r2, r0
9001ab70:	e0033001 	and	r3, r3, r1
9001ab74:	e1823003 	orr	r3, r2, r3
9001ab78:	e3530000 	cmp	r3, #0
9001ab7c:	03a03001 	moveq	r3, #1
9001ab80:	13a03000 	movne	r3, #0
9001ab84:	e6ef3073 	uxtb	r3, r3
9001ab88:	e3530000 	cmp	r3, #0
9001ab8c:	0a00007a 	beq	9001ad7c <slab_free+0x480>
        if (LIKELY(slab_to_free->refcount == 1)) {
9001ab90:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ab94:	e5933010 	ldr	r3, [r3, #16]
9001ab98:	e3530001 	cmp	r3, #1
9001ab9c:	03a03001 	moveq	r3, #1
9001aba0:	13a03000 	movne	r3, #0
9001aba4:	e6ef3073 	uxtb	r3, r3
9001aba8:	e3530000 	cmp	r3, #0
9001abac:	0a00002a 	beq	9001ac5c <slab_free+0x360>
            if (LIKELY(slab_to_free != allocator->partial)) {
9001abb0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001abb4:	e5932018 	ldr	r2, [r3, #24]
9001abb8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001abbc:	e1520003 	cmp	r2, r3
9001abc0:	13a03001 	movne	r3, #1
9001abc4:	03a03000 	moveq	r3, #0
9001abc8:	e6ef3073 	uxtb	r3, r3
9001abcc:	e3530000 	cmp	r3, #0
9001abd0:	0a00000d 	beq	9001ac0c <slab_free+0x310>
                if ((slab_to_free->prev->next = slab_to_free->next) != NULL) {
9001abd4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001abd8:	e5933000 	ldr	r3, [r3]
9001abdc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001abe0:	e5922004 	ldr	r2, [r2, #4]
9001abe4:	e5832004 	str	r2, [r3, #4]
9001abe8:	e5933004 	ldr	r3, [r3, #4]
9001abec:	e3530000 	cmp	r3, #0
9001abf0:	0a000016 	beq	9001ac50 <slab_free+0x354>
                    slab_to_free->next->prev = slab_to_free->prev;
9001abf4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001abf8:	e5933004 	ldr	r3, [r3, #4]
9001abfc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ac00:	e5922000 	ldr	r2, [r2]
9001ac04:	e5832000 	str	r2, [r3]
9001ac08:	ea000010 	b	9001ac50 <slab_free+0x354>
            } else if (LIKELY((allocator->partial = allocator->partial->next) != NULL)) {
9001ac0c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac10:	e5933018 	ldr	r3, [r3, #24]
9001ac14:	e5932004 	ldr	r2, [r3, #4]
9001ac18:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac1c:	e5832018 	str	r2, [r3, #24]
9001ac20:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac24:	e5933018 	ldr	r3, [r3, #24]
9001ac28:	e3530000 	cmp	r3, #0
9001ac2c:	13a03001 	movne	r3, #1
9001ac30:	03a03000 	moveq	r3, #0
9001ac34:	e6ef3073 	uxtb	r3, r3
9001ac38:	e3530000 	cmp	r3, #0
9001ac3c:	0a000003 	beq	9001ac50 <slab_free+0x354>
                allocator->partial->prev = NULL;
9001ac40:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac44:	e5933018 	ldr	r3, [r3, #24]
9001ac48:	e3a02000 	mov	r2, #0
9001ac4c:	e5832000 	str	r2, [r3]
            LOWLEVEL_FREE((void*)slab_to_free);
9001ac50:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001ac54:	ebfff82c 	bl	90018d0c <kfree>
}
9001ac58:	ea000055 	b	9001adb4 <slab_free+0x4b8>
            slab_to_free->bitmap = allocator->bitmap_empty;
9001ac5c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac60:	e1c321d0 	ldrd	r2, [r3, #16]
9001ac64:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001ac68:	e1c120f8 	strd	r2, [r1, #8]
            if (LIKELY(slab_to_free != allocator->partial)) {
9001ac6c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ac70:	e5932018 	ldr	r2, [r3, #24]
9001ac74:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ac78:	e1520003 	cmp	r2, r3
9001ac7c:	13a03001 	movne	r3, #1
9001ac80:	03a03000 	moveq	r3, #0
9001ac84:	e6ef3073 	uxtb	r3, r3
9001ac88:	e3530000 	cmp	r3, #0
9001ac8c:	0a000010 	beq	9001acd4 <slab_free+0x3d8>
                if ((slab_to_free->prev->next = slab_to_free->next) != NULL) {
9001ac90:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ac94:	e5933000 	ldr	r3, [r3]
9001ac98:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ac9c:	e5922004 	ldr	r2, [r2, #4]
9001aca0:	e5832004 	str	r2, [r3, #4]
9001aca4:	e5933004 	ldr	r3, [r3, #4]
9001aca8:	e3530000 	cmp	r3, #0
9001acac:	0a000004 	beq	9001acc4 <slab_free+0x3c8>
                    slab_to_free->next->prev = slab_to_free->prev;
9001acb0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001acb4:	e5933004 	ldr	r3, [r3, #4]
9001acb8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001acbc:	e5922000 	ldr	r2, [r2]
9001acc0:	e5832000 	str	r2, [r3]
                slab_to_free->prev = NULL;
9001acc4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001acc8:	e3a02000 	mov	r2, #0
9001accc:	e5832000 	str	r2, [r3]
9001acd0:	ea000010 	b	9001ad18 <slab_free+0x41c>
            } else if (LIKELY((allocator->partial = allocator->partial->next) != NULL)) {
9001acd4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001acd8:	e5933018 	ldr	r3, [r3, #24]
9001acdc:	e5932004 	ldr	r2, [r3, #4]
9001ace0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ace4:	e5832018 	str	r2, [r3, #24]
9001ace8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001acec:	e5933018 	ldr	r3, [r3, #24]
9001acf0:	e3530000 	cmp	r3, #0
9001acf4:	13a03001 	movne	r3, #1
9001acf8:	03a03000 	moveq	r3, #0
9001acfc:	e6ef3073 	uxtb	r3, r3
9001ad00:	e3530000 	cmp	r3, #0
9001ad04:	0a000003 	beq	9001ad18 <slab_free+0x41c>
                allocator->partial->prev = NULL;
9001ad08:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ad0c:	e5933018 	ldr	r3, [r3, #24]
9001ad10:	e3a02000 	mov	r2, #0
9001ad14:	e5832000 	str	r2, [r3]
            slab_to_free->next = allocator->empty;
9001ad18:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ad1c:	e593201c 	ldr	r2, [r3, #28]
9001ad20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ad24:	e5832004 	str	r2, [r3, #4]
            if (UNLIKELY(allocator->empty != NULL))
9001ad28:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ad2c:	e593301c 	ldr	r3, [r3, #28]
9001ad30:	e3530000 	cmp	r3, #0
9001ad34:	13a03001 	movne	r3, #1
9001ad38:	03a03000 	moveq	r3, #0
9001ad3c:	e6ef3073 	uxtb	r3, r3
9001ad40:	e3530000 	cmp	r3, #0
9001ad44:	0a000003 	beq	9001ad58 <slab_free+0x45c>
                allocator->empty->prev = slab_to_free;
9001ad48:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ad4c:	e593301c 	ldr	r3, [r3, #28]
9001ad50:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ad54:	e5832000 	str	r2, [r3]
            allocator->empty = slab_to_free;
9001ad58:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ad5c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001ad60:	e583201c 	str	r2, [r3, #28]
            slab_to_free->refcount--;
9001ad64:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ad68:	e5933010 	ldr	r3, [r3, #16]
9001ad6c:	e2432001 	sub	r2, r3, #1
9001ad70:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ad74:	e5832010 	str	r2, [r3, #16]
}
9001ad78:	ea00000d 	b	9001adb4 <slab_free+0x4b8>
        slab_to_free->bitmap |= BITMAP_FIRST_BIT << slot;
9001ad7c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ad80:	e1c300d8 	ldrd	r0, [r3, #8]
9001ad84:	e3a02001 	mov	r2, #1
9001ad88:	e3a03000 	mov	r3, #0
9001ad8c:	e248e020 	sub	lr, r8, #32
9001ad90:	e268c020 	rsb	ip, r8, #32
9001ad94:	e1a05813 	lsl	r5, r3, r8
9001ad98:	e1855e12 	orr	r5, r5, r2, lsl lr
9001ad9c:	e1855c32 	orr	r5, r5, r2, lsr ip
9001ada0:	e1a04812 	lsl	r4, r2, r8
9001ada4:	e1802004 	orr	r2, r0, r4
9001ada8:	e1813005 	orr	r3, r1, r5
9001adac:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001adb0:	e1c120f8 	strd	r2, [r1, #8]
}
9001adb4:	e320f000 	nop	{0}
9001adb8:	e24bd018 	sub	sp, fp, #24
9001adbc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

9001adc0 <slab_destroy>:

void slab_destroy(const struct slab_allocator* const allocator)
{
9001adc0:	e92d4800 	push	{fp, lr}
9001adc4:	e28db004 	add	fp, sp, #4
9001adc8:	e24dd020 	sub	sp, sp, #32
9001adcc:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    assert(allocator != NULL);
9001add0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001add4:	e3530000 	cmp	r3, #0
9001add8:	1a00000d 	bne	9001ae14 <slab_destroy+0x54>
9001addc:	e3a020b3 	mov	r2, #179	; 0xb3
9001ade0:	e3021194 	movw	r1, #8596	; 0x2194
9001ade4:	e3491002 	movt	r1, #36866	; 0x9002
9001ade8:	e3020120 	movw	r0, #8480	; 0x2120
9001adec:	e3490002 	movt	r0, #36866	; 0x9002
9001adf0:	ebffe960 	bl	90015378 <KPrintf>
9001adf4:	e3021130 	movw	r1, #8496	; 0x2130
9001adf8:	e3491002 	movt	r1, #36866	; 0x9002
9001adfc:	e3020144 	movw	r0, #8516	; 0x2144
9001ae00:	e3490002 	movt	r0, #36866	; 0x9002
9001ae04:	ebffe95b 	bl	90015378 <KPrintf>
9001ae08:	e3020154 	movw	r0, #8532	; 0x2154
9001ae0c:	e3490002 	movt	r0, #36866	; 0x9002
9001ae10:	ebffe04a 	bl	90012f40 <panic>

    struct slab_state* const slab_lists[] = { allocator->partial, allocator->empty, allocator->full };
9001ae14:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ae18:	e5933018 	ldr	r3, [r3, #24]
9001ae1c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001ae20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ae24:	e593301c 	ldr	r3, [r3, #28]
9001ae28:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001ae2c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ae30:	e5933020 	ldr	r3, [r3, #32]
9001ae34:	e50b3010 	str	r3, [fp, #-16]
    for (size_t i = 0; i < (sizeof(slab_lists) / sizeof(struct slab_state*)); i++) {
9001ae38:	e3a03000 	mov	r3, #0
9001ae3c:	e50b3008 	str	r3, [fp, #-8]
9001ae40:	ea000016 	b	9001aea0 <slab_destroy+0xe0>
        struct slab_state* slab = slab_lists[i];
9001ae44:	e51b3008 	ldr	r3, [fp, #-8]
9001ae48:	e1a03103 	lsl	r3, r3, #2
9001ae4c:	e24b2004 	sub	r2, fp, #4
9001ae50:	e0823003 	add	r3, r2, r3
9001ae54:	e5133014 	ldr	r3, [r3, #-20]	; 0xffffffec
9001ae58:	e50b300c 	str	r3, [fp, #-12]

        while (slab != NULL) {
9001ae5c:	ea000009 	b	9001ae88 <slab_destroy+0xc8>
            if (slab->refcount != 0) {
9001ae60:	e51b300c 	ldr	r3, [fp, #-12]
9001ae64:	e5933010 	ldr	r3, [r3, #16]
9001ae68:	e3530000 	cmp	r3, #0
9001ae6c:	0a000002 	beq	9001ae7c <slab_destroy+0xbc>
                LOWLEVEL_FREE((void*)slab);
9001ae70:	e51b000c 	ldr	r0, [fp, #-12]
9001ae74:	ebfff7a4 	bl	90018d0c <kfree>
9001ae78:	ea000002 	b	9001ae88 <slab_destroy+0xc8>
            } else {
                slab = slab->next;
9001ae7c:	e51b300c 	ldr	r3, [fp, #-12]
9001ae80:	e5933004 	ldr	r3, [r3, #4]
9001ae84:	e50b300c 	str	r3, [fp, #-12]
        while (slab != NULL) {
9001ae88:	e51b300c 	ldr	r3, [fp, #-12]
9001ae8c:	e3530000 	cmp	r3, #0
9001ae90:	1afffff2 	bne	9001ae60 <slab_destroy+0xa0>
    for (size_t i = 0; i < (sizeof(slab_lists) / sizeof(struct slab_state*)); i++) {
9001ae94:	e51b3008 	ldr	r3, [fp, #-8]
9001ae98:	e2833001 	add	r3, r3, #1
9001ae9c:	e50b3008 	str	r3, [fp, #-8]
9001aea0:	e51b3008 	ldr	r3, [fp, #-8]
9001aea4:	e3530002 	cmp	r3, #2
9001aea8:	9affffe5 	bls	9001ae44 <slab_destroy+0x84>
            }
        }
    }
9001aeac:	e320f000 	nop	{0}
9001aeb0:	e24bd004 	sub	sp, fp, #4
9001aeb4:	e8bd8800 	pop	{fp, pc}

9001aeb8 <cur_cpuid>:
{
9001aeb8:	e92d4800 	push	{fp, lr}
9001aebc:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001aec0:	ebffd89a 	bl	90011130 <cpu_get_current>
9001aec4:	e1a03000 	mov	r3, r0
}
9001aec8:	e1a00003 	mov	r0, r3
9001aecc:	e8bd8800 	pop	{fp, pc}

9001aed0 <cur_cpu>:
{
9001aed0:	e92d4800 	push	{fp, lr}
9001aed4:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001aed8:	ebfffff6 	bl	9001aeb8 <cur_cpuid>
9001aedc:	e1a02000 	mov	r2, r0
9001aee0:	e1a03002 	mov	r3, r2
9001aee4:	e1a03083 	lsl	r3, r3, #1
9001aee8:	e0833002 	add	r3, r3, r2
9001aeec:	e1a03103 	lsl	r3, r3, #2
9001aef0:	e304256c 	movw	r2, #17772	; 0x456c
9001aef4:	e349209a 	movt	r2, #37018	; 0x909a
9001aef8:	e0833002 	add	r3, r3, r2
9001aefc:	e1a00003 	mov	r0, r3
9001af00:	e8bd8800 	pop	{fp, pc}

9001af04 <intr_distributer_init>:
#include "task.h"

static struct IrqDispatcherRightGroup right_group;
static struct XiziTrapDriver* p_intr_driver = NULL;
bool intr_distributer_init(struct IrqDispatcherRightGroup* _right_group)
{
9001af04:	e92d4800 	push	{fp, lr}
9001af08:	e28db004 	add	fp, sp, #4
9001af0c:	e24dd008 	sub	sp, sp, #8
9001af10:	e50b0008 	str	r0, [fp, #-8]
    right_group = *_right_group;
9001af14:	e3043530 	movw	r3, #17712	; 0x4530
9001af18:	e349309a 	movt	r3, #37018	; 0x909a
9001af1c:	e51b2008 	ldr	r2, [fp, #-8]
9001af20:	e8920003 	ldm	r2, {r0, r1}
9001af24:	e8830003 	stm	r3, {r0, r1}
    p_intr_driver = AchieveResource(&_right_group->intr_driver_tag);
9001af28:	e51b3008 	ldr	r3, [fp, #-8]
9001af2c:	e1a00003 	mov	r0, r3
9001af30:	ebfff469 	bl	900180dc <AchieveResource>
9001af34:	e1a02000 	mov	r2, r0
9001af38:	e3043538 	movw	r3, #17720	; 0x4538
9001af3c:	e349309a 	movt	r3, #37018	; 0x909a
9001af40:	e5832000 	str	r2, [r3]
    return p_intr_driver != NULL;
9001af44:	e3043538 	movw	r3, #17720	; 0x4538
9001af48:	e349309a 	movt	r3, #37018	; 0x909a
9001af4c:	e5933000 	ldr	r3, [r3]
9001af50:	e3530000 	cmp	r3, #0
9001af54:	13a03001 	movne	r3, #1
9001af58:	03a03000 	moveq	r3, #0
9001af5c:	e6ef3073 	uxtb	r3, r3
}
9001af60:	e1a00003 	mov	r0, r3
9001af64:	e24bd004 	sub	sp, fp, #4
9001af68:	e8bd8800 	pop	{fp, pc}

9001af6c <default_interrupt_routine>:

void default_interrupt_routine(void)
{
9001af6c:	e92d4800 	push	{fp, lr}
9001af70:	e28db004 	add	fp, sp, #4
    /* default handler borrow the rights of dispatcher */
    ///@todo Support other cores. (currently assume that CPU_0 is used)
    ERROR("Interrupt %d has been asserted\n", p_intr_driver->curr_int[0]);
9001af74:	e3a02035 	mov	r2, #53	; 0x35
9001af78:	e3021220 	movw	r1, #8736	; 0x2220
9001af7c:	e3491002 	movt	r1, #36866	; 0x9002
9001af80:	e30201a4 	movw	r0, #8612	; 0x21a4
9001af84:	e3490002 	movt	r0, #36866	; 0x9002
9001af88:	ebffe8fa 	bl	90015378 <KPrintf>
9001af8c:	e3043538 	movw	r3, #17720	; 0x4538
9001af90:	e349309a 	movt	r3, #37018	; 0x909a
9001af94:	e5933000 	ldr	r3, [r3]
9001af98:	e5933280 	ldr	r3, [r3, #640]	; 0x280
9001af9c:	e1a01003 	mov	r1, r3
9001afa0:	e30201b4 	movw	r0, #8628	; 0x21b4
9001afa4:	e3490002 	movt	r0, #36866	; 0x9002
9001afa8:	ebffe8f2 	bl	90015378 <KPrintf>
}
9001afac:	e320f000 	nop	{0}
9001afb0:	e8bd8800 	pop	{fp, pc}

9001afb4 <intr_irq_dispatch>:

extern void context_switch(struct context**, struct context*);
void intr_irq_dispatch(struct trapframe* tf)
{
9001afb4:	e92d4810 	push	{r4, fp, lr}
9001afb8:	e28db008 	add	fp, sp, #8
9001afbc:	e24dd024 	sub	sp, sp, #36	; 0x24
9001afc0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    assert(p_intr_driver != NULL);
9001afc4:	e3043538 	movw	r3, #17720	; 0x4538
9001afc8:	e349309a 	movt	r3, #37018	; 0x909a
9001afcc:	e5933000 	ldr	r3, [r3]
9001afd0:	e3530000 	cmp	r3, #0
9001afd4:	1a00000d 	bne	9001b010 <intr_irq_dispatch+0x5c>
9001afd8:	e3a0203b 	mov	r2, #59	; 0x3b
9001afdc:	e302123c 	movw	r1, #8764	; 0x223c
9001afe0:	e3491002 	movt	r1, #36866	; 0x9002
9001afe4:	e30201a4 	movw	r0, #8612	; 0x21a4
9001afe8:	e3490002 	movt	r0, #36866	; 0x9002
9001afec:	ebffe8e1 	bl	90015378 <KPrintf>
9001aff0:	e30211d4 	movw	r1, #8660	; 0x21d4
9001aff4:	e3491002 	movt	r1, #36866	; 0x9002
9001aff8:	e30201ec 	movw	r0, #8684	; 0x21ec
9001affc:	e3490002 	movt	r0, #36866	; 0x9002
9001b000:	ebffe8dc 	bl	90015378 <KPrintf>
9001b004:	e30201fc 	movw	r0, #8700	; 0x21fc
9001b008:	e3490002 	movt	r0, #36866	; 0x9002
9001b00c:	ebffdfcb 	bl	90012f40 <panic>

    p_intr_driver->cpu_irq_disable();
9001b010:	e3043538 	movw	r3, #17720	; 0x4538
9001b014:	e349309a 	movt	r3, #37018	; 0x909a
9001b018:	e5933000 	ldr	r3, [r3]
9001b01c:	e5933298 	ldr	r3, [r3, #664]	; 0x298
9001b020:	e12fff33 	blx	r3
    // enter irq
    uint32_t int_info = 0;
9001b024:	e3a03000 	mov	r3, #0
9001b028:	e50b3010 	str	r3, [fp, #-16]
    if ((int_info = p_intr_driver->hw_before_irq()) == 0) {
9001b02c:	e3043538 	movw	r3, #17720	; 0x4538
9001b030:	e349309a 	movt	r3, #37018	; 0x909a
9001b034:	e5933000 	ldr	r3, [r3]
9001b038:	e59332b4 	ldr	r3, [r3, #692]	; 0x2b4
9001b03c:	e12fff33 	blx	r3
9001b040:	e50b0010 	str	r0, [fp, #-16]
9001b044:	e51b3010 	ldr	r3, [fp, #-16]
9001b048:	e3530000 	cmp	r3, #0
9001b04c:	0a000071 	beq	9001b218 <intr_irq_dispatch+0x264>
        return;
    }

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001b050:	ebffff9e 	bl	9001aed0 <cur_cpu>
9001b054:	e1a03000 	mov	r3, r0
9001b058:	e5933004 	ldr	r3, [r3, #4]
9001b05c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (LIKELY(current_task != NULL)) {
9001b060:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b064:	e3530000 	cmp	r3, #0
9001b068:	13a03001 	movne	r3, #1
9001b06c:	03a03000 	moveq	r3, #0
9001b070:	e6ef3073 	uxtb	r3, r3
9001b074:	e3530000 	cmp	r3, #0
9001b078:	0a000002 	beq	9001b088 <intr_irq_dispatch+0xd4>
        current_task->main_thread.trapframe = tf;
9001b07c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b080:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001b084:	e5832078 	str	r2, [r3, #120]	; 0x78
    }

    unsigned cpu = p_intr_driver->hw_cur_int_cpu(int_info);
9001b088:	e3043538 	movw	r3, #17720	; 0x4538
9001b08c:	e349309a 	movt	r3, #37018	; 0x909a
9001b090:	e5933000 	ldr	r3, [r3]
9001b094:	e59332bc 	ldr	r3, [r3, #700]	; 0x2bc
9001b098:	e51b0010 	ldr	r0, [fp, #-16]
9001b09c:	e12fff33 	blx	r3
9001b0a0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    unsigned irq = p_intr_driver->hw_cur_int_num(int_info);
9001b0a4:	e3043538 	movw	r3, #17720	; 0x4538
9001b0a8:	e349309a 	movt	r3, #37018	; 0x909a
9001b0ac:	e5933000 	ldr	r3, [r3]
9001b0b0:	e59332b8 	ldr	r3, [r3, #696]	; 0x2b8
9001b0b4:	e51b0010 	ldr	r0, [fp, #-16]
9001b0b8:	e12fff33 	blx	r3
9001b0bc:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    p_intr_driver->curr_int[cpu] = irq;
9001b0c0:	e3043538 	movw	r3, #17720	; 0x4538
9001b0c4:	e349309a 	movt	r3, #37018	; 0x909a
9001b0c8:	e5933000 	ldr	r3, [r3]
9001b0cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001b0d0:	e28220a0 	add	r2, r2, #160	; 0xa0
9001b0d4:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
9001b0d8:	e7831102 	str	r1, [r3, r2, lsl #2]

    // distribute irq
    irq_handler_t isr = p_intr_driver->sw_irqtbl[irq].handler;
9001b0dc:	e3043538 	movw	r3, #17720	; 0x4538
9001b0e0:	e349309a 	movt	r3, #37018	; 0x909a
9001b0e4:	e5933000 	ldr	r3, [r3]
9001b0e8:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001b0ec:	e7933102 	ldr	r3, [r3, r2, lsl #2]
9001b0f0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    if (isr) {
9001b0f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001b0f8:	e3530000 	cmp	r3, #0
9001b0fc:	0a000005 	beq	9001b118 <intr_irq_dispatch+0x164>
        isr(irq, tf, NULL);
9001b100:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
9001b104:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001b108:	e3a02000 	mov	r2, #0
9001b10c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
9001b110:	e12fff33 	blx	r3
9001b114:	ea000000 	b	9001b11c <intr_irq_dispatch+0x168>
    } else {
        default_interrupt_routine();
9001b118:	ebffff93 	bl	9001af6c <default_interrupt_routine>
    }

    // finish irq.
    p_intr_driver->curr_int[cpu] = 0;
9001b11c:	e3043538 	movw	r3, #17720	; 0x4538
9001b120:	e349309a 	movt	r3, #37018	; 0x909a
9001b124:	e5933000 	ldr	r3, [r3]
9001b128:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001b12c:	e28220a0 	add	r2, r2, #160	; 0xa0
9001b130:	e3a01000 	mov	r1, #0
9001b134:	e7831102 	str	r1, [r3, r2, lsl #2]
    p_intr_driver->hw_after_irq(int_info);
9001b138:	e3043538 	movw	r3, #17720	; 0x4538
9001b13c:	e349309a 	movt	r3, #37018	; 0x909a
9001b140:	e5933000 	ldr	r3, [r3]
9001b144:	e59332c0 	ldr	r3, [r3, #704]	; 0x2c0
9001b148:	e51b0010 	ldr	r0, [fp, #-16]
9001b14c:	e12fff33 	blx	r3

    if (UNLIKELY(cur_cpu()->task == NULL && current_task != NULL)) {
9001b150:	ebffff5e 	bl	9001aed0 <cur_cpu>
9001b154:	e1a03000 	mov	r3, r0
9001b158:	e5933004 	ldr	r3, [r3, #4]
9001b15c:	e3530000 	cmp	r3, #0
9001b160:	03a03001 	moveq	r3, #1
9001b164:	13a03000 	movne	r3, #0
9001b168:	e6ef3073 	uxtb	r3, r3
9001b16c:	e3530000 	cmp	r3, #0
9001b170:	0a00000e 	beq	9001b1b0 <intr_irq_dispatch+0x1fc>
9001b174:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b178:	e3530000 	cmp	r3, #0
9001b17c:	13a03001 	movne	r3, #1
9001b180:	03a03000 	moveq	r3, #0
9001b184:	e6ef3073 	uxtb	r3, r3
9001b188:	e3530000 	cmp	r3, #0
9001b18c:	0a000007 	beq	9001b1b0 <intr_irq_dispatch+0x1fc>
        context_switch(&current_task->main_thread.context, cur_cpu()->scheduler);
9001b190:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b194:	e2834074 	add	r4, r3, #116	; 0x74
9001b198:	ebffff4c 	bl	9001aed0 <cur_cpu>
9001b19c:	e1a03000 	mov	r3, r0
9001b1a0:	e5933008 	ldr	r3, [r3, #8]
9001b1a4:	e1a01003 	mov	r1, r3
9001b1a8:	e1a00004 	mov	r0, r4
9001b1ac:	ebffd82f 	bl	90011270 <context_switch>
    }
    assert(current_task == cur_cpu()->task);
9001b1b0:	ebffff46 	bl	9001aed0 <cur_cpu>
9001b1b4:	e1a03000 	mov	r3, r0
9001b1b8:	e5932004 	ldr	r2, [r3, #4]
9001b1bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b1c0:	e1520003 	cmp	r2, r3
9001b1c4:	0a00000d 	beq	9001b200 <intr_irq_dispatch+0x24c>
9001b1c8:	e3a0205c 	mov	r2, #92	; 0x5c
9001b1cc:	e302123c 	movw	r1, #8764	; 0x223c
9001b1d0:	e3491002 	movt	r1, #36866	; 0x9002
9001b1d4:	e30201a4 	movw	r0, #8612	; 0x21a4
9001b1d8:	e3490002 	movt	r0, #36866	; 0x9002
9001b1dc:	ebffe865 	bl	90015378 <KPrintf>
9001b1e0:	e3021200 	movw	r1, #8704	; 0x2200
9001b1e4:	e3491002 	movt	r1, #36866	; 0x9002
9001b1e8:	e30201ec 	movw	r0, #8684	; 0x21ec
9001b1ec:	e3490002 	movt	r0, #36866	; 0x9002
9001b1f0:	ebffe860 	bl	90015378 <KPrintf>
9001b1f4:	e30201fc 	movw	r0, #8700	; 0x21fc
9001b1f8:	e3490002 	movt	r0, #36866	; 0x9002
9001b1fc:	ebffdf4f 	bl	90012f40 <panic>

    p_intr_driver->cpu_irq_enable();
9001b200:	e3043538 	movw	r3, #17720	; 0x4538
9001b204:	e349309a 	movt	r3, #37018	; 0x909a
9001b208:	e5933000 	ldr	r3, [r3]
9001b20c:	e5933294 	ldr	r3, [r3, #660]	; 0x294
9001b210:	e12fff33 	blx	r3
9001b214:	ea000000 	b	9001b21c <intr_irq_dispatch+0x268>
        return;
9001b218:	e320f000 	nop	{0}
}
9001b21c:	e24bd008 	sub	sp, fp, #8
9001b220:	e8bd8810 	pop	{r4, fp, pc}

9001b224 <cur_cpuid>:
{
9001b224:	e92d4800 	push	{fp, lr}
9001b228:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001b22c:	ebffd7bf 	bl	90011130 <cpu_get_current>
9001b230:	e1a03000 	mov	r3, r0
}
9001b234:	e1a00003 	mov	r0, r3
9001b238:	e8bd8800 	pop	{fp, pc}

9001b23c <cur_cpu>:
{
9001b23c:	e92d4800 	push	{fp, lr}
9001b240:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001b244:	ebfffff6 	bl	9001b224 <cur_cpuid>
9001b248:	e1a02000 	mov	r2, r0
9001b24c:	e1a03002 	mov	r3, r2
9001b250:	e1a03083 	lsl	r3, r3, #1
9001b254:	e0833002 	add	r3, r3, r2
9001b258:	e1a03103 	lsl	r3, r3, #2
9001b25c:	e304256c 	movw	r2, #17772	; 0x456c
9001b260:	e349209a 	movt	r2, #37018	; 0x909a
9001b264:	e0833002 	add	r3, r3, r2
9001b268:	e1a00003 	mov	r0, r3
9001b26c:	e8bd8800 	pop	{fp, pc}

9001b270 <clock_intr_handler_init>:

static struct TraceTag clock_driver_tag;
static struct XiziClockDriver* p_clock_driver = NULL;

bool clock_intr_handler_init(struct TraceTag* p_clock_driver_tag)
{
9001b270:	e92d4800 	push	{fp, lr}
9001b274:	e28db004 	add	fp, sp, #4
9001b278:	e24dd008 	sub	sp, sp, #8
9001b27c:	e50b0008 	str	r0, [fp, #-8]
    clock_driver_tag = *p_clock_driver_tag;
9001b280:	e3043540 	movw	r3, #17728	; 0x4540
9001b284:	e349309a 	movt	r3, #37018	; 0x909a
9001b288:	e51b2008 	ldr	r2, [fp, #-8]
9001b28c:	e8920003 	ldm	r2, {r0, r1}
9001b290:	e8830003 	stm	r3, {r0, r1}
    p_clock_driver = AchieveResource(p_clock_driver_tag);
9001b294:	e51b0008 	ldr	r0, [fp, #-8]
9001b298:	ebfff38f 	bl	900180dc <AchieveResource>
9001b29c:	e1a02000 	mov	r2, r0
9001b2a0:	e3043548 	movw	r3, #17736	; 0x4548
9001b2a4:	e349309a 	movt	r3, #37018	; 0x909a
9001b2a8:	e5832000 	str	r2, [r3]
    return p_clock_driver != NULL;
9001b2ac:	e3043548 	movw	r3, #17736	; 0x4548
9001b2b0:	e349309a 	movt	r3, #37018	; 0x909a
9001b2b4:	e5933000 	ldr	r3, [r3]
9001b2b8:	e3530000 	cmp	r3, #0
9001b2bc:	13a03001 	movne	r3, #1
9001b2c0:	03a03000 	moveq	r3, #0
9001b2c4:	e6ef3073 	uxtb	r3, r3
}
9001b2c8:	e1a00003 	mov	r0, r3
9001b2cc:	e24bd004 	sub	sp, fp, #4
9001b2d0:	e8bd8800 	pop	{fp, pc}

9001b2d4 <xizi_clock_handler>:

uint64_t global_tick = 0;
int xizi_clock_handler(int irq, void* tf, void* arg)
{
9001b2d4:	e92d4800 	push	{fp, lr}
9001b2d8:	e28db004 	add	fp, sp, #4
9001b2dc:	e24dd018 	sub	sp, sp, #24
9001b2e0:	e50b0010 	str	r0, [fp, #-16]
9001b2e4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001b2e8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    /* handle clock interrupt using driver */
    p_clock_driver->clear_clock_intr();
9001b2ec:	e3043548 	movw	r3, #17736	; 0x4548
9001b2f0:	e349309a 	movt	r3, #37018	; 0x909a
9001b2f4:	e5933000 	ldr	r3, [r3]
9001b2f8:	e5933008 	ldr	r3, [r3, #8]
9001b2fc:	e12fff33 	blx	r3
    global_tick++;
9001b300:	e3043550 	movw	r3, #17744	; 0x4550
9001b304:	e349309a 	movt	r3, #37018	; 0x909a
9001b308:	e1c320d0 	ldrd	r2, [r3]
9001b30c:	e2920001 	adds	r0, r2, #1
9001b310:	e2a31000 	adc	r1, r3, #0
9001b314:	e3043550 	movw	r3, #17744	; 0x4550
9001b318:	e349309a 	movt	r3, #37018	; 0x909a
9001b31c:	e1c300f0 	strd	r0, [r3]
    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001b320:	ebffffc5 	bl	9001b23c <cur_cpu>
9001b324:	e1a03000 	mov	r3, r0
9001b328:	e5933004 	ldr	r3, [r3, #4]
9001b32c:	e50b3008 	str	r3, [fp, #-8]
    if (current_task) {
9001b330:	e51b3008 	ldr	r3, [fp, #-8]
9001b334:	e3530000 	cmp	r3, #0
9001b338:	0a000011 	beq	9001b384 <xizi_clock_handler+0xb0>
        current_task->remain_tick--;
9001b33c:	e51b3008 	ldr	r3, [fp, #-8]
9001b340:	e593307c 	ldr	r3, [r3, #124]	; 0x7c
9001b344:	e2432001 	sub	r2, r3, #1
9001b348:	e51b3008 	ldr	r3, [fp, #-8]
9001b34c:	e583207c 	str	r2, [r3, #124]	; 0x7c
        current_task->maxium_tick--;
9001b350:	e51b3008 	ldr	r3, [fp, #-8]
9001b354:	e5933080 	ldr	r3, [r3, #128]	; 0x80
9001b358:	e2432001 	sub	r2, r3, #1
9001b35c:	e51b3008 	ldr	r3, [fp, #-8]
9001b360:	e5832080 	str	r2, [r3, #128]	; 0x80
        if (current_task->remain_tick == 0) {
9001b364:	e51b3008 	ldr	r3, [fp, #-8]
9001b368:	e593307c 	ldr	r3, [r3, #124]	; 0x7c
9001b36c:	e3530000 	cmp	r3, #0
9001b370:	1a000003 	bne	9001b384 <xizi_clock_handler+0xb0>
            xizi_task_manager.cur_task_yield_noschedule();
9001b374:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b378:	e3493002 	movt	r3, #36866	; 0x9002
9001b37c:	e5933170 	ldr	r3, [r3, #368]	; 0x170
9001b380:	e12fff33 	blx	r3
        }
    }
    return 0;
9001b384:	e3a03000 	mov	r3, #0
9001b388:	e1a00003 	mov	r0, r3
9001b38c:	e24bd004 	sub	sp, fp, #4
9001b390:	e8bd8800 	pop	{fp, pc}

9001b394 <cur_cpuid>:
{
9001b394:	e92d4800 	push	{fp, lr}
9001b398:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001b39c:	ebffd763 	bl	90011130 <cpu_get_current>
9001b3a0:	e1a03000 	mov	r3, r0
}
9001b3a4:	e1a00003 	mov	r0, r3
9001b3a8:	e8bd8800 	pop	{fp, pc}

9001b3ac <cur_cpu>:
{
9001b3ac:	e92d4800 	push	{fp, lr}
9001b3b0:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001b3b4:	ebfffff6 	bl	9001b394 <cur_cpuid>
9001b3b8:	e1a02000 	mov	r2, r0
9001b3bc:	e1a03002 	mov	r3, r2
9001b3c0:	e1a03083 	lsl	r3, r3, #1
9001b3c4:	e0833002 	add	r3, r3, r2
9001b3c8:	e1a03103 	lsl	r3, r3, #2
9001b3cc:	e304256c 	movw	r2, #17772	; 0x456c
9001b3d0:	e349209a 	movt	r2, #37018	; 0x909a
9001b3d4:	e0833002 	add	r3, r3, r2
9001b3d8:	e1a00003 	mov	r0, r3
9001b3dc:	e8bd8800 	pop	{fp, pc}

9001b3e0 <swi_distributer_init>:

static struct SwiDispatcherRightGroup right_group;
static struct XiziTrapDriver* p_intr_driver = NULL;

bool swi_distributer_init(struct SwiDispatcherRightGroup* _right_group)
{
9001b3e0:	e92d4800 	push	{fp, lr}
9001b3e4:	e28db004 	add	fp, sp, #4
9001b3e8:	e24dd008 	sub	sp, sp, #8
9001b3ec:	e50b0008 	str	r0, [fp, #-8]
    right_group = *_right_group;
9001b3f0:	e3043558 	movw	r3, #17752	; 0x4558
9001b3f4:	e349309a 	movt	r3, #37018	; 0x909a
9001b3f8:	e51b2008 	ldr	r2, [fp, #-8]
9001b3fc:	e8920003 	ldm	r2, {r0, r1}
9001b400:	e8830003 	stm	r3, {r0, r1}
    p_intr_driver = AchieveResource(&_right_group->intr_driver_tag);
9001b404:	e51b3008 	ldr	r3, [fp, #-8]
9001b408:	e1a00003 	mov	r0, r3
9001b40c:	ebfff332 	bl	900180dc <AchieveResource>
9001b410:	e1a02000 	mov	r2, r0
9001b414:	e3043560 	movw	r3, #17760	; 0x4560
9001b418:	e349309a 	movt	r3, #37018	; 0x909a
9001b41c:	e5832000 	str	r2, [r3]
    return p_intr_driver != NULL;
9001b420:	e3043560 	movw	r3, #17760	; 0x4560
9001b424:	e349309a 	movt	r3, #37018	; 0x909a
9001b428:	e5933000 	ldr	r3, [r3]
9001b42c:	e3530000 	cmp	r3, #0
9001b430:	13a03001 	movne	r3, #1
9001b434:	03a03000 	moveq	r3, #0
9001b438:	e6ef3073 	uxtb	r3, r3
}
9001b43c:	e1a00003 	mov	r0, r3
9001b440:	e24bd004 	sub	sp, fp, #4
9001b444:	e8bd8800 	pop	{fp, pc}

9001b448 <software_irq_dispatch>:

extern void context_switch(struct context**, struct context*);
void software_irq_dispatch(struct trapframe* tf)
{
9001b448:	e92d4810 	push	{r4, fp, lr}
9001b44c:	e28db008 	add	fp, sp, #8
9001b450:	e24dd034 	sub	sp, sp, #52	; 0x34
9001b454:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    assert(p_intr_driver != NULL);
9001b458:	e3043560 	movw	r3, #17760	; 0x4560
9001b45c:	e349309a 	movt	r3, #37018	; 0x909a
9001b460:	e5933000 	ldr	r3, [r3]
9001b464:	e3530000 	cmp	r3, #0
9001b468:	1a00000d 	bne	9001b4a4 <software_irq_dispatch+0x5c>
9001b46c:	e3a02033 	mov	r2, #51	; 0x33
9001b470:	e30212d4 	movw	r1, #8916	; 0x22d4
9001b474:	e3491002 	movt	r1, #36866	; 0x9002
9001b478:	e3020250 	movw	r0, #8784	; 0x2250
9001b47c:	e3490002 	movt	r0, #36866	; 0x9002
9001b480:	ebffe7bc 	bl	90015378 <KPrintf>
9001b484:	e3021260 	movw	r1, #8800	; 0x2260
9001b488:	e3491002 	movt	r1, #36866	; 0x9002
9001b48c:	e3020278 	movw	r0, #8824	; 0x2278
9001b490:	e3490002 	movt	r0, #36866	; 0x9002
9001b494:	ebffe7b7 	bl	90015378 <KPrintf>
9001b498:	e3020288 	movw	r0, #8840	; 0x2288
9001b49c:	e3490002 	movt	r0, #36866	; 0x9002
9001b4a0:	ebffdea6 	bl	90012f40 <panic>

    p_intr_driver->cpu_irq_disable();
9001b4a4:	e3043560 	movw	r3, #17760	; 0x4560
9001b4a8:	e349309a 	movt	r3, #37018	; 0x909a
9001b4ac:	e5933000 	ldr	r3, [r3]
9001b4b0:	e5933298 	ldr	r3, [r3, #664]	; 0x298
9001b4b4:	e12fff33 	blx	r3
    // get current task
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001b4b8:	ebffffbb 	bl	9001b3ac <cur_cpu>
9001b4bc:	e1a03000 	mov	r3, r0
9001b4c0:	e5933004 	ldr	r3, [r3, #4]
9001b4c4:	e50b3010 	str	r3, [fp, #-16]
    /// @todo: Handle dead task

    int syscall_num = -1;
9001b4c8:	e3e03000 	mvn	r3, #0
9001b4cc:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    if (cur_task && cur_task->state != DEAD) {
9001b4d0:	e51b3010 	ldr	r3, [fp, #-16]
9001b4d4:	e3530000 	cmp	r3, #0
9001b4d8:	0a00002a 	beq	9001b588 <software_irq_dispatch+0x140>
9001b4dc:	e51b3010 	ldr	r3, [fp, #-16]
9001b4e0:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001b4e4:	e3530003 	cmp	r3, #3
9001b4e8:	0a000026 	beq	9001b588 <software_irq_dispatch+0x140>
        cur_task->main_thread.trapframe = tf;
9001b4ec:	e51b3010 	ldr	r3, [fp, #-16]
9001b4f0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
9001b4f4:	e5832078 	str	r2, [r3, #120]	; 0x78
        // call syscall
        int ret = arch_syscall(cur_task->main_thread.trapframe, &syscall_num);
9001b4f8:	e51b3010 	ldr	r3, [fp, #-16]
9001b4fc:	e5933078 	ldr	r3, [r3, #120]	; 0x78
9001b500:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001b504:	e24b3028 	sub	r3, fp, #40	; 0x28
9001b508:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
/// @return
extern int syscall(int sys_num, uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4);
__attribute__((__always_inline__)) static inline int arch_syscall(struct trapframe* tf, int* syscall_num)
{
    // call syscall
    *syscall_num = tf->r0;
9001b50c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b510:	e5933010 	ldr	r3, [r3, #16]
9001b514:	e1a02003 	mov	r2, r3
9001b518:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001b51c:	e5832000 	str	r2, [r3]
    return syscall(*syscall_num, tf->r1, tf->r2, tf->r3, tf->r4);
9001b520:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001b524:	e5930000 	ldr	r0, [r3]
9001b528:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b52c:	e5931014 	ldr	r1, [r3, #20]
9001b530:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b534:	e5932018 	ldr	r2, [r3, #24]
9001b538:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b53c:	e593c01c 	ldr	ip, [r3, #28]
9001b540:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b544:	e5933020 	ldr	r3, [r3, #32]
9001b548:	e58d3000 	str	r3, [sp]
9001b54c:	e1a0300c 	mov	r3, ip
9001b550:	eb000632 	bl	9001ce20 <syscall>
9001b554:	e1a03000 	mov	r3, r0
9001b558:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

        if (syscall_num != SYSCALL_EXEC) {
9001b55c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001b560:	e3530009 	cmp	r3, #9
9001b564:	0a000011 	beq	9001b5b0 <software_irq_dispatch+0x168>
9001b568:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001b56c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
9001b570:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b574:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
/// @brief set return reg to trapframe
/// @param tf
/// @param ret
__attribute__((__always_inline__)) static inline void arch_set_return(struct trapframe* tf, int ret)
{
    tf->r0 = (uint32_t)ret;
9001b578:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001b57c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001b580:	e5832010 	str	r2, [r3, #16]
    if (cur_task && cur_task->state != DEAD) {
9001b584:	ea000009 	b	9001b5b0 <software_irq_dispatch+0x168>
            arch_set_return(tf, ret);
        }
    } else {
        ERROR("syscall by killed task.\n");
9001b588:	e3a02044 	mov	r2, #68	; 0x44
9001b58c:	e30212d4 	movw	r1, #8916	; 0x22d4
9001b590:	e3491002 	movt	r1, #36866	; 0x9002
9001b594:	e3020250 	movw	r0, #8784	; 0x2250
9001b598:	e3490002 	movt	r0, #36866	; 0x9002
9001b59c:	ebffe775 	bl	90015378 <KPrintf>
9001b5a0:	e302028c 	movw	r0, #8844	; 0x228c
9001b5a4:	e3490002 	movt	r0, #36866	; 0x9002
9001b5a8:	ebffe772 	bl	90015378 <KPrintf>
9001b5ac:	ea000000 	b	9001b5b4 <software_irq_dispatch+0x16c>
    if (cur_task && cur_task->state != DEAD) {
9001b5b0:	e320f000 	nop	{0}
    }

    if (cur_cpu()->task == NULL && cur_task != NULL) {
9001b5b4:	ebffff7c 	bl	9001b3ac <cur_cpu>
9001b5b8:	e1a03000 	mov	r3, r0
9001b5bc:	e5933004 	ldr	r3, [r3, #4]
9001b5c0:	e3530000 	cmp	r3, #0
9001b5c4:	1a00000a 	bne	9001b5f4 <software_irq_dispatch+0x1ac>
9001b5c8:	e51b3010 	ldr	r3, [fp, #-16]
9001b5cc:	e3530000 	cmp	r3, #0
9001b5d0:	0a000007 	beq	9001b5f4 <software_irq_dispatch+0x1ac>
        context_switch(&cur_task->main_thread.context, cur_cpu()->scheduler);
9001b5d4:	e51b3010 	ldr	r3, [fp, #-16]
9001b5d8:	e2834074 	add	r4, r3, #116	; 0x74
9001b5dc:	ebffff72 	bl	9001b3ac <cur_cpu>
9001b5e0:	e1a03000 	mov	r3, r0
9001b5e4:	e5933008 	ldr	r3, [r3, #8]
9001b5e8:	e1a01003 	mov	r1, r3
9001b5ec:	e1a00004 	mov	r0, r4
9001b5f0:	ebffd71e 	bl	90011270 <context_switch>
    }
    assert(cur_task == cur_cpu()->task);
9001b5f4:	ebffff6c 	bl	9001b3ac <cur_cpu>
9001b5f8:	e1a03000 	mov	r3, r0
9001b5fc:	e5932004 	ldr	r2, [r3, #4]
9001b600:	e51b3010 	ldr	r3, [fp, #-16]
9001b604:	e1520003 	cmp	r2, r3
9001b608:	0a00000d 	beq	9001b644 <software_irq_dispatch+0x1fc>
9001b60c:	e3a0204a 	mov	r2, #74	; 0x4a
9001b610:	e30212d4 	movw	r1, #8916	; 0x22d4
9001b614:	e3491002 	movt	r1, #36866	; 0x9002
9001b618:	e3020250 	movw	r0, #8784	; 0x2250
9001b61c:	e3490002 	movt	r0, #36866	; 0x9002
9001b620:	ebffe754 	bl	90015378 <KPrintf>
9001b624:	e30212a8 	movw	r1, #8872	; 0x22a8
9001b628:	e3491002 	movt	r1, #36866	; 0x9002
9001b62c:	e3020278 	movw	r0, #8824	; 0x2278
9001b630:	e3490002 	movt	r0, #36866	; 0x9002
9001b634:	ebffe74f 	bl	90015378 <KPrintf>
9001b638:	e3020288 	movw	r0, #8840	; 0x2288
9001b63c:	e3490002 	movt	r0, #36866	; 0x9002
9001b640:	ebffde3e 	bl	90012f40 <panic>
    if (syscall_num == SYSCALL_EXIT) {
9001b644:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001b648:	e3530002 	cmp	r3, #2
9001b64c:	1a000008 	bne	9001b674 <software_irq_dispatch+0x22c>
        ERROR("Exit reaches");
9001b650:	e3a0204c 	mov	r2, #76	; 0x4c
9001b654:	e30212d4 	movw	r1, #8916	; 0x22d4
9001b658:	e3491002 	movt	r1, #36866	; 0x9002
9001b65c:	e3020250 	movw	r0, #8784	; 0x2250
9001b660:	e3490002 	movt	r0, #36866	; 0x9002
9001b664:	ebffe743 	bl	90015378 <KPrintf>
9001b668:	e30202c4 	movw	r0, #8900	; 0x22c4
9001b66c:	e3490002 	movt	r0, #36866	; 0x9002
9001b670:	ebffe740 	bl	90015378 <KPrintf>
    }
    p_intr_driver->cpu_irq_enable();
9001b674:	e3043560 	movw	r3, #17760	; 0x4560
9001b678:	e349309a 	movt	r3, #37018	; 0x909a
9001b67c:	e5933000 	ldr	r3, [r3]
9001b680:	e5933294 	ldr	r3, [r3, #660]	; 0x294
9001b684:	e12fff33 	blx	r3
9001b688:	e320f000 	nop	{0}
9001b68c:	e24bd008 	sub	sp, fp, #8
9001b690:	e8bd8810 	pop	{r4, fp, pc}

9001b694 <cur_cpuid>:
{
9001b694:	e92d4800 	push	{fp, lr}
9001b698:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001b69c:	ebffd6a3 	bl	90011130 <cpu_get_current>
9001b6a0:	e1a03000 	mov	r3, r0
}
9001b6a4:	e1a00003 	mov	r0, r3
9001b6a8:	e8bd8800 	pop	{fp, pc}

9001b6ac <cur_cpu>:
{
9001b6ac:	e92d4800 	push	{fp, lr}
9001b6b0:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001b6b4:	ebfffff6 	bl	9001b694 <cur_cpuid>
9001b6b8:	e1a02000 	mov	r2, r0
9001b6bc:	e1a03002 	mov	r3, r2
9001b6c0:	e1a03083 	lsl	r3, r3, #1
9001b6c4:	e0833002 	add	r3, r3, r2
9001b6c8:	e1a03103 	lsl	r3, r3, #2
9001b6cc:	e304256c 	movw	r2, #17772	; 0x456c
9001b6d0:	e349209a 	movt	r2, #37018	; 0x909a
9001b6d4:	e0833002 	add	r3, r3, r2
9001b6d8:	e1a00003 	mov	r0, r3
9001b6dc:	e8bd8800 	pop	{fp, pc}

9001b6e0 <_task_manager_init>:

struct CPU global_cpus[NR_CPU];
uint32_t ready_task_priority;

static void _task_manager_init()
{
9001b6e0:	e92d4800 	push	{fp, lr}
9001b6e4:	e28db004 	add	fp, sp, #4
9001b6e8:	e24dd008 	sub	sp, sp, #8
    // init lock for task list
    spinlock_init(&xizi_task_manager.lock, "proclist");
9001b6ec:	e30212ec 	movw	r1, #8940	; 0x22ec
9001b6f0:	e3491002 	movt	r1, #36866	; 0x9002
9001b6f4:	e30303e0 	movw	r0, #13280	; 0x33e0
9001b6f8:	e3490002 	movt	r0, #36866	; 0x9002
9001b6fc:	ebffe18f 	bl	90013d40 <spinlock_init>
    // init task list to NULL
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
9001b700:	e3a03000 	mov	r3, #0
9001b704:	e50b3008 	str	r3, [fp, #-8]
9001b708:	ea00000f 	b	9001b74c <_task_manager_init+0x6c>
        doubleListNodeInit(&xizi_task_manager.task_list_head[i]);
9001b70c:	e51b3008 	ldr	r3, [fp, #-8]
9001b710:	e2833004 	add	r3, r3, #4
9001b714:	e1a02183 	lsl	r2, r3, #3
9001b718:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b71c:	e3493002 	movt	r3, #36866	; 0x9002
9001b720:	e0823003 	add	r3, r2, r3
9001b724:	e50b300c 	str	r3, [fp, #-12]
    list->next = list;
9001b728:	e51b300c 	ldr	r3, [fp, #-12]
9001b72c:	e51b200c 	ldr	r2, [fp, #-12]
9001b730:	e5832000 	str	r2, [r3]
    list->prev = list;
9001b734:	e51b300c 	ldr	r3, [fp, #-12]
9001b738:	e51b200c 	ldr	r2, [fp, #-12]
9001b73c:	e5832004 	str	r2, [r3, #4]
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
9001b740:	e51b3008 	ldr	r3, [fp, #-8]
9001b744:	e2833001 	add	r3, r3, #1
9001b748:	e50b3008 	str	r3, [fp, #-8]
9001b74c:	e51b3008 	ldr	r3, [fp, #-8]
9001b750:	e353001f 	cmp	r3, #31
9001b754:	daffffec 	ble	9001b70c <_task_manager_init+0x2c>
    }
    // init task (slab) allocator
    slab_init(&xizi_task_manager.task_allocator, sizeof(struct TaskMicroDescriptor));
9001b758:	e3a010c0 	mov	r1, #192	; 0xc0
9001b75c:	e59f002c 	ldr	r0, [pc, #44]	; 9001b790 <_task_manager_init+0xb0>
9001b760:	ebfffb55 	bl	9001a4bc <slab_init>

    // pid pool
    xizi_task_manager.next_pid = 0;
9001b764:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b768:	e3493002 	movt	r3, #36866	; 0x9002
9001b76c:	e3a02000 	mov	r2, #0
9001b770:	e5832150 	str	r2, [r3, #336]	; 0x150

    // init priority bit map
    ready_task_priority = 0;
9001b774:	e304359c 	movw	r3, #17820	; 0x459c
9001b778:	e349309a 	movt	r3, #37018	; 0x909a
9001b77c:	e3a02000 	mov	r2, #0
9001b780:	e5832000 	str	r2, [r3]
}
9001b784:	e320f000 	nop	{0}
9001b788:	e24bd004 	sub	sp, fp, #4
9001b78c:	e8bd8800 	pop	{fp, pc}
9001b790:	90023508 	.word	0x90023508

9001b794 <_alloc_task_cb>:

/// @brief alloc a new task without init
static struct TaskMicroDescriptor* _alloc_task_cb()
{
9001b794:	e92d4800 	push	{fp, lr}
9001b798:	e28db004 	add	fp, sp, #4
9001b79c:	e24dd008 	sub	sp, sp, #8
    spinlock_lock(&xizi_task_manager.lock);
9001b7a0:	e30303e0 	movw	r0, #13280	; 0x33e0
9001b7a4:	e3490002 	movt	r0, #36866	; 0x9002
9001b7a8:	ebffe175 	bl	90013d84 <spinlock_lock>
    // alloc task and add it to used task list
    struct TaskMicroDescriptor* task = (struct TaskMicroDescriptor*)slab_alloc(&xizi_task_manager.task_allocator);
9001b7ac:	e59f00c4 	ldr	r0, [pc, #196]	; 9001b878 <_alloc_task_cb+0xe4>
9001b7b0:	ebfffb87 	bl	9001a5d4 <slab_alloc>
9001b7b4:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(task == NULL)) {
9001b7b8:	e51b3008 	ldr	r3, [fp, #-8]
9001b7bc:	e3530000 	cmp	r3, #0
9001b7c0:	03a03001 	moveq	r3, #1
9001b7c4:	13a03000 	movne	r3, #0
9001b7c8:	e6ef3073 	uxtb	r3, r3
9001b7cc:	e3530000 	cmp	r3, #0
9001b7d0:	0a00000d 	beq	9001b80c <_alloc_task_cb+0x78>
        ERROR("Not enough memory\n");
9001b7d4:	e3a02045 	mov	r2, #69	; 0x45
9001b7d8:	e30213b0 	movw	r1, #9136	; 0x23b0
9001b7dc:	e3491002 	movt	r1, #36866	; 0x9002
9001b7e0:	e30202f8 	movw	r0, #8952	; 0x22f8
9001b7e4:	e3490002 	movt	r0, #36866	; 0x9002
9001b7e8:	ebffe6e2 	bl	90015378 <KPrintf>
9001b7ec:	e3020308 	movw	r0, #8968	; 0x2308
9001b7f0:	e3490002 	movt	r0, #36866	; 0x9002
9001b7f4:	ebffe6df 	bl	90015378 <KPrintf>
        spinlock_unlock(&xizi_task_manager.lock);
9001b7f8:	e30303e0 	movw	r0, #13280	; 0x33e0
9001b7fc:	e3490002 	movt	r0, #36866	; 0x9002
9001b800:	ebffe18f 	bl	90013e44 <spinlock_unlock>
        return NULL;
9001b804:	e3a03000 	mov	r3, #0
9001b808:	ea000017 	b	9001b86c <_alloc_task_cb+0xd8>
    }
    // set pid once task is allocated
    memset(task, 0, sizeof(*task));
9001b80c:	e3a020c0 	mov	r2, #192	; 0xc0
9001b810:	e3a01000 	mov	r1, #0
9001b814:	e51b0008 	ldr	r0, [fp, #-8]
9001b818:	fa001455 	blx	90020974 <memset>
    task->pid = xizi_task_manager.next_pid++;
9001b81c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b820:	e3493002 	movt	r3, #36866	; 0x9002
9001b824:	e5932150 	ldr	r2, [r3, #336]	; 0x150
9001b828:	e2821001 	add	r1, r2, #1
9001b82c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b830:	e3493002 	movt	r3, #36866	; 0x9002
9001b834:	e5831150 	str	r1, [r3, #336]	; 0x150
9001b838:	e51b3008 	ldr	r3, [fp, #-8]
9001b83c:	e5832040 	str	r2, [r3, #64]	; 0x40
    // update pcb used
    xizi_task_manager.nr_pcb_used += 1;
9001b840:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b844:	e3493002 	movt	r3, #36866	; 0x9002
9001b848:	e5933120 	ldr	r3, [r3, #288]	; 0x120
9001b84c:	e2832001 	add	r2, r3, #1
9001b850:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b854:	e3493002 	movt	r3, #36866	; 0x9002
9001b858:	e5832120 	str	r2, [r3, #288]	; 0x120

    spinlock_unlock(&xizi_task_manager.lock);
9001b85c:	e30303e0 	movw	r0, #13280	; 0x33e0
9001b860:	e3490002 	movt	r0, #36866	; 0x9002
9001b864:	ebffe176 	bl	90013e44 <spinlock_unlock>
    return task;
9001b868:	e51b3008 	ldr	r3, [fp, #-8]
}
9001b86c:	e1a00003 	mov	r0, r3
9001b870:	e24bd004 	sub	sp, fp, #4
9001b874:	e8bd8800 	pop	{fp, pc}
9001b878:	90023508 	.word	0x90023508

9001b87c <_dealloc_task_cb>:

/// @brief this function changes task list without locking, so it must be called inside a lock critical area
/// @param task
static void _dealloc_task_cb(struct TaskMicroDescriptor* task)
{
9001b87c:	e92d4800 	push	{fp, lr}
9001b880:	e28db004 	add	fp, sp, #4
9001b884:	e24dd018 	sub	sp, sp, #24
9001b888:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    if (UNLIKELY(task == NULL)) {
9001b88c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b890:	e3530000 	cmp	r3, #0
9001b894:	03a03001 	moveq	r3, #1
9001b898:	13a03000 	movne	r3, #0
9001b89c:	e6ef3073 	uxtb	r3, r3
9001b8a0:	e3530000 	cmp	r3, #0
9001b8a4:	0a000009 	beq	9001b8d0 <_dealloc_task_cb+0x54>
        ERROR("deallocating a NULL task\n");
9001b8a8:	e3a02058 	mov	r2, #88	; 0x58
9001b8ac:	e30213c0 	movw	r1, #9152	; 0x23c0
9001b8b0:	e3491002 	movt	r1, #36866	; 0x9002
9001b8b4:	e30202f8 	movw	r0, #8952	; 0x22f8
9001b8b8:	e3490002 	movt	r0, #36866	; 0x9002
9001b8bc:	ebffe6ad 	bl	90015378 <KPrintf>
9001b8c0:	e302031c 	movw	r0, #8988	; 0x231c
9001b8c4:	e3490002 	movt	r0, #36866	; 0x9002
9001b8c8:	ebffe6aa 	bl	90015378 <KPrintf>
        return;
9001b8cc:	ea00004e 	b	9001ba0c <_dealloc_task_cb+0x190>
    }

    // stack is mapped in vspace, so it should be free by pgdir
    if (task->pgdir.pd_addr) {
9001b8d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b8d4:	e5933050 	ldr	r3, [r3, #80]	; 0x50
9001b8d8:	e3530000 	cmp	r3, #0
9001b8dc:	0a000006 	beq	9001b8fc <_dealloc_task_cb+0x80>
        xizi_pager.free_user_pgdir(&task->pgdir);
9001b8e0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001b8e4:	e3493002 	movt	r3, #36866	; 0x9002
9001b8e8:	e5933004 	ldr	r3, [r3, #4]
9001b8ec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001b8f0:	e2822050 	add	r2, r2, #80	; 0x50
9001b8f4:	e1a00002 	mov	r0, r2
9001b8f8:	e12fff33 	blx	r3
    }
    if (task->main_thread.stack_addr) {
9001b8fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b900:	e5933070 	ldr	r3, [r3, #112]	; 0x70
9001b904:	e3530000 	cmp	r3, #0
9001b908:	0a000003 	beq	9001b91c <_dealloc_task_cb+0xa0>
        kfree((char*)task->main_thread.stack_addr);
9001b90c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b910:	e5933070 	ldr	r3, [r3, #112]	; 0x70
9001b914:	e1a00003 	mov	r0, r3
9001b918:	ebfff4fb 	bl	90018d0c <kfree>
    }

    struct double_list_node* cur_node = &task->node;
9001b91c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b920:	e50b3008 	str	r3, [fp, #-8]
9001b924:	e51b3008 	ldr	r3, [fp, #-8]
9001b928:	e50b300c 	str	r3, [fp, #-12]
    _double_list_del(entry->prev, entry->next);
9001b92c:	e51b300c 	ldr	r3, [fp, #-12]
9001b930:	e5932004 	ldr	r2, [r3, #4]
9001b934:	e51b300c 	ldr	r3, [fp, #-12]
9001b938:	e5933000 	ldr	r3, [r3]
9001b93c:	e50b2010 	str	r2, [fp, #-16]
9001b940:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    next->prev = prev;
9001b944:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001b948:	e51b2010 	ldr	r2, [fp, #-16]
9001b94c:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001b950:	e51b3010 	ldr	r3, [fp, #-16]
9001b954:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001b958:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001b95c:	e51b300c 	ldr	r3, [fp, #-12]
9001b960:	e51b200c 	ldr	r2, [fp, #-12]
9001b964:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001b968:	e51b300c 	ldr	r3, [fp, #-12]
9001b96c:	e51b200c 	ldr	r2, [fp, #-12]
9001b970:	e5832004 	str	r2, [r3, #4]
    // remove it from used task list
    doubleListDel(cur_node);

    // free task back to allocator
    slab_free(&xizi_task_manager.task_allocator, (void*)task);
9001b974:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001b978:	e59f0094 	ldr	r0, [pc, #148]	; 9001ba14 <_dealloc_task_cb+0x198>
9001b97c:	ebfffbde 	bl	9001a8fc <slab_free>
    xizi_task_manager.nr_pcb_used -= 1;
9001b980:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b984:	e3493002 	movt	r3, #36866	; 0x9002
9001b988:	e5933120 	ldr	r3, [r3, #288]	; 0x120
9001b98c:	e2432001 	sub	r2, r3, #1
9001b990:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b994:	e3493002 	movt	r3, #36866	; 0x9002
9001b998:	e5832120 	str	r2, [r3, #288]	; 0x120

    // remove priority
    if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[task->priority])) {
9001b99c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b9a0:	e593208c 	ldr	r2, [r3, #140]	; 0x8c
9001b9a4:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b9a8:	e3493002 	movt	r3, #36866	; 0x9002
9001b9ac:	e2822004 	add	r2, r2, #4
9001b9b0:	e7932182 	ldr	r2, [r3, r2, lsl #3]
9001b9b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b9b8:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001b9bc:	e2833004 	add	r3, r3, #4
9001b9c0:	e1a01183 	lsl	r1, r3, #3
9001b9c4:	e30333e0 	movw	r3, #13280	; 0x33e0
9001b9c8:	e3493002 	movt	r3, #36866	; 0x9002
9001b9cc:	e0813003 	add	r3, r1, r3
9001b9d0:	e1520003 	cmp	r2, r3
9001b9d4:	1a00000c 	bne	9001ba0c <_dealloc_task_cb+0x190>
        ready_task_priority &= ~(1 << task->priority);
9001b9d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001b9dc:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001b9e0:	e3a02001 	mov	r2, #1
9001b9e4:	e1a03312 	lsl	r3, r2, r3
9001b9e8:	e1e03003 	mvn	r3, r3
9001b9ec:	e1a02003 	mov	r2, r3
9001b9f0:	e304359c 	movw	r3, #17820	; 0x459c
9001b9f4:	e349309a 	movt	r3, #37018	; 0x909a
9001b9f8:	e5933000 	ldr	r3, [r3]
9001b9fc:	e0022003 	and	r2, r2, r3
9001ba00:	e304359c 	movw	r3, #17820	; 0x459c
9001ba04:	e349309a 	movt	r3, #37018	; 0x909a
9001ba08:	e5832000 	str	r2, [r3]
    }
}
9001ba0c:	e24bd004 	sub	sp, fp, #4
9001ba10:	e8bd8800 	pop	{fp, pc}
9001ba14:	90023508 	.word	0x90023508

9001ba18 <_new_task_cb>:

/* alloc a new task with init */
static struct TaskMicroDescriptor* _new_task_cb()
{
9001ba18:	e92d4800 	push	{fp, lr}
9001ba1c:	e28db004 	add	fp, sp, #4
9001ba20:	e24dd018 	sub	sp, sp, #24
    // alloc task space
    struct TaskMicroDescriptor* task = _alloc_task_cb();
9001ba24:	ebffff5a 	bl	9001b794 <_alloc_task_cb>
9001ba28:	e50b0008 	str	r0, [fp, #-8]
    if (!task) {
9001ba2c:	e51b3008 	ldr	r3, [fp, #-8]
9001ba30:	e3530000 	cmp	r3, #0
9001ba34:	1a000001 	bne	9001ba40 <_new_task_cb+0x28>
        return NULL;
9001ba38:	e3a03000 	mov	r3, #0
9001ba3c:	ea000055 	b	9001bb98 <_new_task_cb+0x180>
    }
    // init vm
    if (!xizi_pager.new_pgdir(&task->pgdir)) {
9001ba40:	e30333ac 	movw	r3, #13228	; 0x33ac
9001ba44:	e3493002 	movt	r3, #36866	; 0x9002
9001ba48:	e5933000 	ldr	r3, [r3]
9001ba4c:	e51b2008 	ldr	r2, [fp, #-8]
9001ba50:	e2822050 	add	r2, r2, #80	; 0x50
9001ba54:	e1a00002 	mov	r0, r2
9001ba58:	e12fff33 	blx	r3
9001ba5c:	e1a03000 	mov	r3, r0
9001ba60:	e2233001 	eor	r3, r3, #1
9001ba64:	e6ef3073 	uxtb	r3, r3
9001ba68:	e3530000 	cmp	r3, #0
9001ba6c:	0a000003 	beq	9001ba80 <_new_task_cb+0x68>
        _dealloc_task_cb(task);
9001ba70:	e51b0008 	ldr	r0, [fp, #-8]
9001ba74:	ebffff80 	bl	9001b87c <_dealloc_task_cb>
        return NULL;
9001ba78:	e3a03000 	mov	r3, #0
9001ba7c:	ea000045 	b	9001bb98 <_new_task_cb+0x180>
    }
    /* init basic task member */
    doubleListNodeInit(&task->cli_sess_listhead);
9001ba80:	e51b3008 	ldr	r3, [fp, #-8]
9001ba84:	e2833054 	add	r3, r3, #84	; 0x54
9001ba88:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    list->next = list;
9001ba8c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ba90:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001ba94:	e5832000 	str	r2, [r3]
    list->prev = list;
9001ba98:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ba9c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001baa0:	e5832004 	str	r2, [r3, #4]
    doubleListNodeInit(&task->svr_sess_listhead);
9001baa4:	e51b3008 	ldr	r3, [fp, #-8]
9001baa8:	e283305c 	add	r3, r3, #92	; 0x5c
9001baac:	e50b3010 	str	r3, [fp, #-16]
    list->next = list;
9001bab0:	e51b3010 	ldr	r3, [fp, #-16]
9001bab4:	e51b2010 	ldr	r2, [fp, #-16]
9001bab8:	e5832000 	str	r2, [r3]
    list->prev = list;
9001babc:	e51b3010 	ldr	r3, [fp, #-16]
9001bac0:	e51b2010 	ldr	r2, [fp, #-16]
9001bac4:	e5832004 	str	r2, [r3, #4]

    /* init main thread of task */
    task->main_thread.task = task;
9001bac8:	e51b3008 	ldr	r3, [fp, #-8]
9001bacc:	e51b2008 	ldr	r2, [fp, #-8]
9001bad0:	e583206c 	str	r2, [r3, #108]	; 0x6c
    // alloc stack page for task
    if ((void*)(task->main_thread.stack_addr = (uintptr_t)kalloc(USER_STACK_SIZE)) == NULL) {
9001bad4:	e3a00a01 	mov	r0, #4096	; 0x1000
9001bad8:	ebfff465 	bl	90018c74 <kalloc>
9001badc:	e1a03000 	mov	r3, r0
9001bae0:	e1a02003 	mov	r2, r3
9001bae4:	e51b3008 	ldr	r3, [fp, #-8]
9001bae8:	e5832070 	str	r2, [r3, #112]	; 0x70
9001baec:	e51b3008 	ldr	r3, [fp, #-8]
9001baf0:	e5933070 	ldr	r3, [r3, #112]	; 0x70
9001baf4:	e3530000 	cmp	r3, #0
9001baf8:	1a000003 	bne	9001bb0c <_new_task_cb+0xf4>
        _dealloc_task_cb(task);
9001bafc:	e51b0008 	ldr	r0, [fp, #-8]
9001bb00:	ebffff5d 	bl	9001b87c <_dealloc_task_cb>
        return NULL;
9001bb04:	e3a03000 	mov	r3, #0
9001bb08:	ea000022 	b	9001bb98 <_new_task_cb+0x180>
    }

    /* set context of main thread stack */
    /// stack bottom
    memset((void*)task->main_thread.stack_addr, 0x00, USER_STACK_SIZE);
9001bb0c:	e51b3008 	ldr	r3, [fp, #-8]
9001bb10:	e5933070 	ldr	r3, [r3, #112]	; 0x70
9001bb14:	e3a02a01 	mov	r2, #4096	; 0x1000
9001bb18:	e3a01000 	mov	r1, #0
9001bb1c:	e1a00003 	mov	r0, r3
9001bb20:	fa001393 	blx	90020974 <memset>
    char* sp = (char*)task->main_thread.stack_addr + USER_STACK_SIZE - 4;
9001bb24:	e51b3008 	ldr	r3, [fp, #-8]
9001bb28:	e5933070 	ldr	r3, [r3, #112]	; 0x70
9001bb2c:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001bb30:	e283300c 	add	r3, r3, #12
9001bb34:	e50b300c 	str	r3, [fp, #-12]

    /// 1. trap frame into stack, for process to nomally return by trap_return
    sp -= sizeof(*task->main_thread.trapframe);
9001bb38:	e51b300c 	ldr	r3, [fp, #-12]
9001bb3c:	e2433048 	sub	r3, r3, #72	; 0x48
9001bb40:	e50b300c 	str	r3, [fp, #-12]
    task->main_thread.trapframe = (struct trapframe*)sp;
9001bb44:	e51b3008 	ldr	r3, [fp, #-8]
9001bb48:	e51b200c 	ldr	r2, [fp, #-12]
9001bb4c:	e5832078 	str	r2, [r3, #120]	; 0x78

    /// 2. context into stack
    sp -= sizeof(*task->main_thread.context);
9001bb50:	e51b300c 	ldr	r3, [fp, #-12]
9001bb54:	e2433028 	sub	r3, r3, #40	; 0x28
9001bb58:	e50b300c 	str	r3, [fp, #-12]
    task->main_thread.context = (struct context*)sp;
9001bb5c:	e51b3008 	ldr	r3, [fp, #-8]
9001bb60:	e51b200c 	ldr	r2, [fp, #-12]
9001bb64:	e5832074 	str	r2, [r3, #116]	; 0x74
    arch_init_context(task->main_thread.context);
9001bb68:	e51b3008 	ldr	r3, [fp, #-8]
9001bb6c:	e5933074 	ldr	r3, [r3, #116]	; 0x74
9001bb70:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    memset(ctx, 0, sizeof(*ctx));
9001bb74:	e3a02028 	mov	r2, #40	; 0x28
9001bb78:	e3a01000 	mov	r1, #0
9001bb7c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001bb80:	fa00137b 	blx	90020974 <memset>
    ctx->lr = (uint32_t)(trap_return);
9001bb84:	e3033e68 	movw	r3, #15976	; 0x3e68
9001bb88:	e3493001 	movt	r3, #36865	; 0x9001
9001bb8c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001bb90:	e5823024 	str	r3, [r2, #36]	; 0x24

    return task;
9001bb94:	e51b3008 	ldr	r3, [fp, #-8]
}
9001bb98:	e1a00003 	mov	r0, r3
9001bb9c:	e24bd004 	sub	sp, fp, #4
9001bba0:	e8bd8800 	pop	{fp, pc}

9001bba4 <_task_set_default_schedule_attr>:

static void _task_set_default_schedule_attr(struct TaskMicroDescriptor* task, struct TraceTag* cwd)
{
9001bba4:	e92d4800 	push	{fp, lr}
9001bba8:	e28db004 	add	fp, sp, #4
9001bbac:	e24dd020 	sub	sp, sp, #32
9001bbb0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001bbb4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    spinlock_init(&task->lock, task->name);
9001bbb8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbbc:	e2832020 	add	r2, r3, #32
9001bbc0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbc4:	e2833094 	add	r3, r3, #148	; 0x94
9001bbc8:	e1a01003 	mov	r1, r3
9001bbcc:	e1a00002 	mov	r0, r2
9001bbd0:	ebffe05a 	bl	90013d40 <spinlock_init>
    task->remain_tick = TASK_CLOCK_TICK;
9001bbd4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbd8:	e3a02032 	mov	r2, #50	; 0x32
9001bbdc:	e583207c 	str	r2, [r3, #124]	; 0x7c
    task->maxium_tick = TASK_CLOCK_TICK * 10;
9001bbe0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbe4:	e3a02f7d 	mov	r2, #500	; 0x1f4
9001bbe8:	e5832080 	str	r2, [r3, #128]	; 0x80
    task->state = READY;
9001bbec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbf0:	e3a02001 	mov	r2, #1
9001bbf4:	e5c32048 	strb	r2, [r3, #72]	; 0x48
    task->cwd = *cwd;
9001bbf8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bbfc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001bc00:	e2833084 	add	r3, r3, #132	; 0x84
9001bc04:	e8920003 	ldm	r2, {r0, r1}
9001bc08:	e8830003 	stm	r3, {r0, r1}
    task->priority = TASK_DEFAULT_PRIORITY;
9001bc0c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bc10:	e3a02002 	mov	r2, #2
9001bc14:	e583208c 	str	r2, [r3, #140]	; 0x8c
    doubleListAddOnHead(&task->node, &xizi_task_manager.task_list_head[task->priority]);
9001bc18:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001bc1c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bc20:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001bc24:	e2833004 	add	r3, r3, #4
9001bc28:	e1a01183 	lsl	r1, r3, #3
9001bc2c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001bc30:	e3493002 	movt	r3, #36866	; 0x9002
9001bc34:	e0813003 	add	r3, r1, r3
9001bc38:	e50b2008 	str	r2, [fp, #-8]
9001bc3c:	e50b300c 	str	r3, [fp, #-12]
    _double_list_add(new_node, head, head->next);
9001bc40:	e51b300c 	ldr	r3, [fp, #-12]
9001bc44:	e5933000 	ldr	r3, [r3]
9001bc48:	e51b2008 	ldr	r2, [fp, #-8]
9001bc4c:	e50b2010 	str	r2, [fp, #-16]
9001bc50:	e51b200c 	ldr	r2, [fp, #-12]
9001bc54:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
9001bc58:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    next->prev = new_node;
9001bc5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001bc60:	e51b2010 	ldr	r2, [fp, #-16]
9001bc64:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001bc68:	e51b3010 	ldr	r3, [fp, #-16]
9001bc6c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001bc70:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001bc74:	e51b3010 	ldr	r3, [fp, #-16]
9001bc78:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001bc7c:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001bc80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001bc84:	e51b2010 	ldr	r2, [fp, #-16]
9001bc88:	e5832000 	str	r2, [r3]
    ready_task_priority |= (1 << task->priority);
9001bc8c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001bc90:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001bc94:	e3a02001 	mov	r2, #1
9001bc98:	e1a03312 	lsl	r3, r2, r3
9001bc9c:	e1a02003 	mov	r2, r3
9001bca0:	e304359c 	movw	r3, #17820	; 0x459c
9001bca4:	e349309a 	movt	r3, #37018	; 0x909a
9001bca8:	e5933000 	ldr	r3, [r3]
9001bcac:	e1822003 	orr	r2, r2, r3
9001bcb0:	e304359c 	movw	r3, #17820	; 0x459c
9001bcb4:	e349309a 	movt	r3, #37018	; 0x909a
9001bcb8:	e5832000 	str	r2, [r3]
}
9001bcbc:	e320f000 	nop	{0}
9001bcc0:	e24bd004 	sub	sp, fp, #4
9001bcc4:	e8bd8800 	pop	{fp, pc}

9001bcc8 <_scheduler>:

struct TaskMicroDescriptor* next_task_emergency = NULL;
extern void context_switch(struct context**, struct context*);
static void _scheduler(struct SchedulerRightGroup right_group)
{
9001bcc8:	e92d4800 	push	{fp, lr}
9001bccc:	e28db004 	add	fp, sp, #4
9001bcd0:	e24dd020 	sub	sp, sp, #32
9001bcd4:	e24bc024 	sub	ip, fp, #36	; 0x24
9001bcd8:	e88c000f 	stm	ip, {r0, r1, r2, r3}
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
9001bcdc:	e24b3024 	sub	r3, fp, #36	; 0x24
9001bce0:	e2833008 	add	r3, r3, #8
9001bce4:	e1a00003 	mov	r0, r3
9001bce8:	ebfff0fb 	bl	900180dc <AchieveResource>
9001bcec:	e50b000c 	str	r0, [fp, #-12]

    struct TaskMicroDescriptor* next_task;

    while (1) {
        spinlock_lock(&xizi_task_manager.lock);
9001bcf0:	e30303e0 	movw	r0, #13280	; 0x33e0
9001bcf4:	e3490002 	movt	r0, #36866	; 0x9002
9001bcf8:	ebffe021 	bl	90013d84 <spinlock_lock>
        next_task = NULL;
9001bcfc:	e3a03000 	mov	r3, #0
9001bd00:	e50b3008 	str	r3, [fp, #-8]
        /* find next runnable task */
        assert(cur_cpu()->task == NULL);
9001bd04:	ebfffe68 	bl	9001b6ac <cur_cpu>
9001bd08:	e1a03000 	mov	r3, r0
9001bd0c:	e5933004 	ldr	r3, [r3, #4]
9001bd10:	e3530000 	cmp	r3, #0
9001bd14:	0a00000d 	beq	9001bd50 <_scheduler+0x88>
9001bd18:	e3a020b4 	mov	r2, #180	; 0xb4
9001bd1c:	e30213d4 	movw	r1, #9172	; 0x23d4
9001bd20:	e3491002 	movt	r1, #36866	; 0x9002
9001bd24:	e30202f8 	movw	r0, #8952	; 0x22f8
9001bd28:	e3490002 	movt	r0, #36866	; 0x9002
9001bd2c:	ebffe591 	bl	90015378 <KPrintf>
9001bd30:	e3021338 	movw	r1, #9016	; 0x2338
9001bd34:	e3491002 	movt	r1, #36866	; 0x9002
9001bd38:	e3020350 	movw	r0, #9040	; 0x2350
9001bd3c:	e3490002 	movt	r0, #36866	; 0x9002
9001bd40:	ebffe58c 	bl	90015378 <KPrintf>
9001bd44:	e3020360 	movw	r0, #9056	; 0x2360
9001bd48:	e3490002 	movt	r0, #36866	; 0x9002
9001bd4c:	ebffdc7b 	bl	90012f40 <panic>
        if (next_task_emergency != NULL) {
9001bd50:	e3043564 	movw	r3, #17764	; 0x4564
9001bd54:	e349309a 	movt	r3, #37018	; 0x909a
9001bd58:	e5933000 	ldr	r3, [r3]
9001bd5c:	e3530000 	cmp	r3, #0
9001bd60:	0a000013 	beq	9001bdb4 <_scheduler+0xec>
            next_task = next_task_emergency;
9001bd64:	e3043564 	movw	r3, #17764	; 0x4564
9001bd68:	e349309a 	movt	r3, #37018	; 0x909a
9001bd6c:	e5933000 	ldr	r3, [r3]
9001bd70:	e50b3008 	str	r3, [fp, #-8]
            spinlock_lock(&next_task->lock);
9001bd74:	e51b3008 	ldr	r3, [fp, #-8]
9001bd78:	e2833020 	add	r3, r3, #32
9001bd7c:	e1a00003 	mov	r0, r3
9001bd80:	ebffdfff 	bl	90013d84 <spinlock_lock>
            next_task->state = RUNNING;
9001bd84:	e51b3008 	ldr	r3, [fp, #-8]
9001bd88:	e3a02002 	mov	r2, #2
9001bd8c:	e5c32048 	strb	r2, [r3, #72]	; 0x48
            spinlock_unlock(&next_task->lock);
9001bd90:	e51b3008 	ldr	r3, [fp, #-8]
9001bd94:	e2833020 	add	r3, r3, #32
9001bd98:	e1a00003 	mov	r0, r3
9001bd9c:	ebffe028 	bl	90013e44 <spinlock_unlock>
            next_task_emergency = NULL;
9001bda0:	e3043564 	movw	r3, #17764	; 0x4564
9001bda4:	e349309a 	movt	r3, #37018	; 0x909a
9001bda8:	e3a02000 	mov	r2, #0
9001bdac:	e5832000 	str	r2, [r3]
9001bdb0:	ea000004 	b	9001bdc8 <_scheduler+0x100>
        } else {
            next_task = xizi_task_manager.next_runnable_task();
9001bdb4:	e30333e0 	movw	r3, #13280	; 0x33e0
9001bdb8:	e3493002 	movt	r3, #36866	; 0x9002
9001bdbc:	e5933168 	ldr	r3, [r3, #360]	; 0x168
9001bdc0:	e12fff33 	blx	r3
9001bdc4:	e50b0008 	str	r0, [fp, #-8]
        }
        spinlock_unlock(&xizi_task_manager.lock);
9001bdc8:	e30303e0 	movw	r0, #13280	; 0x33e0
9001bdcc:	e3490002 	movt	r0, #36866	; 0x9002
9001bdd0:	ebffe01b 	bl	90013e44 <spinlock_unlock>
        /* not a runnable task */
        if (UNLIKELY(next_task == NULL)) {
9001bdd4:	e51b3008 	ldr	r3, [fp, #-8]
9001bdd8:	e3530000 	cmp	r3, #0
9001bddc:	03a03001 	moveq	r3, #1
9001bde0:	13a03000 	movne	r3, #0
9001bde4:	e6ef3073 	uxtb	r3, r3
9001bde8:	e3530000 	cmp	r3, #0
9001bdec:	1a000025 	bne	9001be88 <_scheduler+0x1c0>
            continue;
        }
        assert(next_task->state == RUNNING);
9001bdf0:	e51b3008 	ldr	r3, [fp, #-8]
9001bdf4:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001bdf8:	e3530002 	cmp	r3, #2
9001bdfc:	0a00000d 	beq	9001be38 <_scheduler+0x170>
9001be00:	e3a020c3 	mov	r2, #195	; 0xc3
9001be04:	e30213d4 	movw	r1, #9172	; 0x23d4
9001be08:	e3491002 	movt	r1, #36866	; 0x9002
9001be0c:	e30202f8 	movw	r0, #8952	; 0x22f8
9001be10:	e3490002 	movt	r0, #36866	; 0x9002
9001be14:	ebffe557 	bl	90015378 <KPrintf>
9001be18:	e3021364 	movw	r1, #9060	; 0x2364
9001be1c:	e3491002 	movt	r1, #36866	; 0x9002
9001be20:	e3020350 	movw	r0, #9040	; 0x2350
9001be24:	e3490002 	movt	r0, #36866	; 0x9002
9001be28:	ebffe552 	bl	90015378 <KPrintf>
9001be2c:	e3020360 	movw	r0, #9056	; 0x2360
9001be30:	e3490002 	movt	r0, #36866	; 0x9002
9001be34:	ebffdc41 	bl	90012f40 <panic>
        // p_mmu_driver->LoadPgdirCrit((uintptr_t)V2P(next_task->pgdir.pd_addr), &right_group.intr_driver_tag);
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(next_task->pgdir.pd_addr));
9001be38:	e51b300c 	ldr	r3, [fp, #-12]
9001be3c:	e5933018 	ldr	r3, [r3, #24]
9001be40:	e51b2008 	ldr	r2, [fp, #-8]
9001be44:	e5922050 	ldr	r2, [r2, #80]	; 0x50
9001be48:	e2822102 	add	r2, r2, #-2147483648	; 0x80000000
9001be4c:	e1a00002 	mov	r0, r2
9001be50:	e12fff33 	blx	r3

        struct CPU* cpu = cur_cpu();
9001be54:	ebfffe14 	bl	9001b6ac <cur_cpu>
9001be58:	e50b0010 	str	r0, [fp, #-16]
        cpu->task = next_task;
9001be5c:	e51b3010 	ldr	r3, [fp, #-16]
9001be60:	e51b2008 	ldr	r2, [fp, #-8]
9001be64:	e5832004 	str	r2, [r3, #4]
        context_switch(&cpu->scheduler, next_task->main_thread.context);
9001be68:	e51b3010 	ldr	r3, [fp, #-16]
9001be6c:	e2832008 	add	r2, r3, #8
9001be70:	e51b3008 	ldr	r3, [fp, #-8]
9001be74:	e5933074 	ldr	r3, [r3, #116]	; 0x74
9001be78:	e1a01003 	mov	r1, r3
9001be7c:	e1a00002 	mov	r0, r2
9001be80:	ebffd4fa 	bl	90011270 <context_switch>
9001be84:	eaffff99 	b	9001bcf0 <_scheduler+0x28>
            continue;
9001be88:	e320f000 	nop	{0}
    while (1) {
9001be8c:	eaffff97 	b	9001bcf0 <_scheduler+0x28>

9001be90 <_cur_task_yield_noschedule>:
    }
}

static uint32_t yield_cnt = 0;
static void _cur_task_yield_noschedule(void)
{
9001be90:	e92d4800 	push	{fp, lr}
9001be94:	e28db004 	add	fp, sp, #4
9001be98:	e24dd028 	sub	sp, sp, #40	; 0x28
    yield_cnt++;
9001be9c:	e3043568 	movw	r3, #17768	; 0x4568
9001bea0:	e349309a 	movt	r3, #37018	; 0x909a
9001bea4:	e5933000 	ldr	r3, [r3]
9001bea8:	e2832001 	add	r2, r3, #1
9001beac:	e3043568 	movw	r3, #17768	; 0x4568
9001beb0:	e349309a 	movt	r3, #37018	; 0x909a
9001beb4:	e5832000 	str	r2, [r3]

    spinlock_lock(&xizi_task_manager.lock);
9001beb8:	e30303e0 	movw	r0, #13280	; 0x33e0
9001bebc:	e3490002 	movt	r0, #36866	; 0x9002
9001bec0:	ebffdfaf 	bl	90013d84 <spinlock_lock>
    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001bec4:	ebfffdf8 	bl	9001b6ac <cur_cpu>
9001bec8:	e1a03000 	mov	r3, r0
9001becc:	e5933004 	ldr	r3, [r3, #4]
9001bed0:	e50b3008 	str	r3, [fp, #-8]
    assert(current_task != NULL);
9001bed4:	e51b3008 	ldr	r3, [fp, #-8]
9001bed8:	e3530000 	cmp	r3, #0
9001bedc:	1a00000d 	bne	9001bf18 <_cur_task_yield_noschedule+0x88>
9001bee0:	e3a020d4 	mov	r2, #212	; 0xd4
9001bee4:	e30213e0 	movw	r1, #9184	; 0x23e0
9001bee8:	e3491002 	movt	r1, #36866	; 0x9002
9001beec:	e30202f8 	movw	r0, #8952	; 0x22f8
9001bef0:	e3490002 	movt	r0, #36866	; 0x9002
9001bef4:	ebffe51f 	bl	90015378 <KPrintf>
9001bef8:	e3021380 	movw	r1, #9088	; 0x2380
9001befc:	e3491002 	movt	r1, #36866	; 0x9002
9001bf00:	e3020350 	movw	r0, #9040	; 0x2350
9001bf04:	e3490002 	movt	r0, #36866	; 0x9002
9001bf08:	ebffe51a 	bl	90015378 <KPrintf>
9001bf0c:	e3020360 	movw	r0, #9056	; 0x2360
9001bf10:	e3490002 	movt	r0, #36866	; 0x9002
9001bf14:	ebffdc09 	bl	90012f40 <panic>

    // rearrage current task position
    doubleListDel(&current_task->node);
9001bf18:	e51b3008 	ldr	r3, [fp, #-8]
9001bf1c:	e50b300c 	str	r3, [fp, #-12]
    _double_list_del(entry->prev, entry->next);
9001bf20:	e51b300c 	ldr	r3, [fp, #-12]
9001bf24:	e5932004 	ldr	r2, [r3, #4]
9001bf28:	e51b300c 	ldr	r3, [fp, #-12]
9001bf2c:	e5933000 	ldr	r3, [r3]
9001bf30:	e50b2010 	str	r2, [fp, #-16]
9001bf34:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    next->prev = prev;
9001bf38:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001bf3c:	e51b2010 	ldr	r2, [fp, #-16]
9001bf40:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001bf44:	e51b3010 	ldr	r3, [fp, #-16]
9001bf48:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001bf4c:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001bf50:	e51b300c 	ldr	r3, [fp, #-12]
9001bf54:	e51b200c 	ldr	r2, [fp, #-12]
9001bf58:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001bf5c:	e51b300c 	ldr	r3, [fp, #-12]
9001bf60:	e51b200c 	ldr	r2, [fp, #-12]
9001bf64:	e5832004 	str	r2, [r3, #4]
    // DEBUG("%s,%d\n", current_task->name, strcmp(current_task->name, name1));
    if (current_task->maxium_tick <= 0) {
9001bf68:	e51b3008 	ldr	r3, [fp, #-8]
9001bf6c:	e5933080 	ldr	r3, [r3, #128]	; 0x80
9001bf70:	e3530000 	cmp	r3, #0
9001bf74:	ca000023 	bgt	9001c008 <_cur_task_yield_noschedule+0x178>
        if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[current_task->priority])) {
9001bf78:	e51b3008 	ldr	r3, [fp, #-8]
9001bf7c:	e593208c 	ldr	r2, [r3, #140]	; 0x8c
9001bf80:	e30333e0 	movw	r3, #13280	; 0x33e0
9001bf84:	e3493002 	movt	r3, #36866	; 0x9002
9001bf88:	e2822004 	add	r2, r2, #4
9001bf8c:	e7932182 	ldr	r2, [r3, r2, lsl #3]
9001bf90:	e51b3008 	ldr	r3, [fp, #-8]
9001bf94:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001bf98:	e2833004 	add	r3, r3, #4
9001bf9c:	e1a01183 	lsl	r1, r3, #3
9001bfa0:	e30333e0 	movw	r3, #13280	; 0x33e0
9001bfa4:	e3493002 	movt	r3, #36866	; 0x9002
9001bfa8:	e0813003 	add	r3, r1, r3
9001bfac:	e1520003 	cmp	r2, r3
9001bfb0:	1a00000c 	bne	9001bfe8 <_cur_task_yield_noschedule+0x158>
            ready_task_priority &= ~(1 << current_task->priority);
9001bfb4:	e51b3008 	ldr	r3, [fp, #-8]
9001bfb8:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001bfbc:	e3a02001 	mov	r2, #1
9001bfc0:	e1a03312 	lsl	r3, r2, r3
9001bfc4:	e1e03003 	mvn	r3, r3
9001bfc8:	e1a02003 	mov	r2, r3
9001bfcc:	e304359c 	movw	r3, #17820	; 0x459c
9001bfd0:	e349309a 	movt	r3, #37018	; 0x909a
9001bfd4:	e5933000 	ldr	r3, [r3]
9001bfd8:	e0022003 	and	r2, r2, r3
9001bfdc:	e304359c 	movw	r3, #17820	; 0x459c
9001bfe0:	e349309a 	movt	r3, #37018	; 0x909a
9001bfe4:	e5832000 	str	r2, [r3]
        }
        current_task->priority += 1;
9001bfe8:	e51b3008 	ldr	r3, [fp, #-8]
9001bfec:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001bff0:	e2832001 	add	r2, r3, #1
9001bff4:	e51b3008 	ldr	r3, [fp, #-8]
9001bff8:	e583208c 	str	r2, [r3, #140]	; 0x8c
        current_task->maxium_tick = TASK_CLOCK_TICK * 10;
9001bffc:	e51b3008 	ldr	r3, [fp, #-8]
9001c000:	e3a02f7d 	mov	r2, #500	; 0x1f4
9001c004:	e5832080 	str	r2, [r3, #128]	; 0x80
    }
    doubleListAddOnBack(&current_task->node, &xizi_task_manager.task_list_head[current_task->priority]);
9001c008:	e51b2008 	ldr	r2, [fp, #-8]
9001c00c:	e51b3008 	ldr	r3, [fp, #-8]
9001c010:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001c014:	e2833004 	add	r3, r3, #4
9001c018:	e1a01183 	lsl	r1, r3, #3
9001c01c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c020:	e3493002 	movt	r3, #36866	; 0x9002
9001c024:	e0813003 	add	r3, r1, r3
9001c028:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9001c02c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    _double_list_add(new_node, head->prev, head);
9001c030:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c034:	e5933004 	ldr	r3, [r3, #4]
9001c038:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001c03c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
9001c040:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001c044:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c048:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    next->prev = new_node;
9001c04c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001c050:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001c054:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001c058:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c05c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001c060:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001c064:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c068:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001c06c:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001c070:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c074:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001c078:	e5832000 	str	r2, [r3]
    ready_task_priority |= (1 << current_task->priority);
9001c07c:	e51b3008 	ldr	r3, [fp, #-8]
9001c080:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001c084:	e3a02001 	mov	r2, #1
9001c088:	e1a03312 	lsl	r3, r2, r3
9001c08c:	e1a02003 	mov	r2, r3
9001c090:	e304359c 	movw	r3, #17820	; 0x459c
9001c094:	e349309a 	movt	r3, #37018	; 0x909a
9001c098:	e5933000 	ldr	r3, [r3]
9001c09c:	e1822003 	orr	r2, r2, r3
9001c0a0:	e304359c 	movw	r3, #17820	; 0x459c
9001c0a4:	e349309a 	movt	r3, #37018	; 0x909a
9001c0a8:	e5832000 	str	r2, [r3]
    // set current task state
    spinlock_lock(&current_task->lock);
9001c0ac:	e51b3008 	ldr	r3, [fp, #-8]
9001c0b0:	e2833020 	add	r3, r3, #32
9001c0b4:	e1a00003 	mov	r0, r3
9001c0b8:	ebffdf31 	bl	90013d84 <spinlock_lock>
    current_task->state = READY;
9001c0bc:	e51b3008 	ldr	r3, [fp, #-8]
9001c0c0:	e3a02001 	mov	r2, #1
9001c0c4:	e5c32048 	strb	r2, [r3, #72]	; 0x48
    current_task->remain_tick = TASK_CLOCK_TICK;
9001c0c8:	e51b3008 	ldr	r3, [fp, #-8]
9001c0cc:	e3a02032 	mov	r2, #50	; 0x32
9001c0d0:	e583207c 	str	r2, [r3, #124]	; 0x7c
    spinlock_unlock(&current_task->lock);
9001c0d4:	e51b3008 	ldr	r3, [fp, #-8]
9001c0d8:	e2833020 	add	r3, r3, #32
9001c0dc:	e1a00003 	mov	r0, r3
9001c0e0:	ebffdf57 	bl	90013e44 <spinlock_unlock>
    cur_cpu()->task = NULL;
9001c0e4:	ebfffd70 	bl	9001b6ac <cur_cpu>
9001c0e8:	e1a02000 	mov	r2, r0
9001c0ec:	e3a03000 	mov	r3, #0
9001c0f0:	e5823004 	str	r3, [r2, #4]
    if (yield_cnt == 50) {
9001c0f4:	e3043568 	movw	r3, #17768	; 0x4568
9001c0f8:	e349309a 	movt	r3, #37018	; 0x909a
9001c0fc:	e5933000 	ldr	r3, [r3]
9001c100:	e3530032 	cmp	r3, #50	; 0x32
9001c104:	1a000004 	bne	9001c11c <_cur_task_yield_noschedule+0x28c>
        recover_priority();
9001c108:	eb00010d 	bl	9001c544 <recover_priority>
        yield_cnt = 0;
9001c10c:	e3043568 	movw	r3, #17768	; 0x4568
9001c110:	e349309a 	movt	r3, #37018	; 0x909a
9001c114:	e3a02000 	mov	r2, #0
9001c118:	e5832000 	str	r2, [r3]
    }
    spinlock_unlock(&xizi_task_manager.lock);
9001c11c:	e30303e0 	movw	r0, #13280	; 0x33e0
9001c120:	e3490002 	movt	r0, #36866	; 0x9002
9001c124:	ebffdf46 	bl	90013e44 <spinlock_unlock>
}
9001c128:	e320f000 	nop	{0}
9001c12c:	e24bd004 	sub	sp, fp, #4
9001c130:	e8bd8800 	pop	{fp, pc}

9001c134 <_set_cur_task_priority>:

static void _set_cur_task_priority(int priority)
{
9001c134:	e92d4800 	push	{fp, lr}
9001c138:	e28db004 	add	fp, sp, #4
9001c13c:	e24dd030 	sub	sp, sp, #48	; 0x30
9001c140:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    if (priority < 0 || priority >= TASK_MAX_PRIORITY) {
9001c144:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001c148:	e3530000 	cmp	r3, #0
9001c14c:	ba000002 	blt	9001c15c <_set_cur_task_priority+0x28>
9001c150:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001c154:	e353001f 	cmp	r3, #31
9001c158:	da000009 	ble	9001c184 <_set_cur_task_priority+0x50>
        ERROR("priority is invalid\n");
9001c15c:	e3a020f2 	mov	r2, #242	; 0xf2
9001c160:	e30213fc 	movw	r1, #9212	; 0x23fc
9001c164:	e3491002 	movt	r1, #36866	; 0x9002
9001c168:	e30202f8 	movw	r0, #8952	; 0x22f8
9001c16c:	e3490002 	movt	r0, #36866	; 0x9002
9001c170:	ebffe480 	bl	90015378 <KPrintf>
9001c174:	e3020398 	movw	r0, #9112	; 0x2398
9001c178:	e3490002 	movt	r0, #36866	; 0x9002
9001c17c:	ebffe47d 	bl	90015378 <KPrintf>
        return;
9001c180:	ea000055 	b	9001c2dc <_set_cur_task_priority+0x1a8>
    }

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001c184:	ebfffd48 	bl	9001b6ac <cur_cpu>
9001c188:	e1a03000 	mov	r3, r0
9001c18c:	e5933004 	ldr	r3, [r3, #4]
9001c190:	e50b3008 	str	r3, [fp, #-8]
    assert(current_task != NULL);
9001c194:	e51b3008 	ldr	r3, [fp, #-8]
9001c198:	e3530000 	cmp	r3, #0
9001c19c:	1a00000d 	bne	9001c1d8 <_set_cur_task_priority+0xa4>
9001c1a0:	e3a020f7 	mov	r2, #247	; 0xf7
9001c1a4:	e30213fc 	movw	r1, #9212	; 0x23fc
9001c1a8:	e3491002 	movt	r1, #36866	; 0x9002
9001c1ac:	e30202f8 	movw	r0, #8952	; 0x22f8
9001c1b0:	e3490002 	movt	r0, #36866	; 0x9002
9001c1b4:	ebffe46f 	bl	90015378 <KPrintf>
9001c1b8:	e3021380 	movw	r1, #9088	; 0x2380
9001c1bc:	e3491002 	movt	r1, #36866	; 0x9002
9001c1c0:	e3020350 	movw	r0, #9040	; 0x2350
9001c1c4:	e3490002 	movt	r0, #36866	; 0x9002
9001c1c8:	ebffe46a 	bl	90015378 <KPrintf>
9001c1cc:	e3020360 	movw	r0, #9056	; 0x2360
9001c1d0:	e3490002 	movt	r0, #36866	; 0x9002
9001c1d4:	ebffdb59 	bl	90012f40 <panic>

    current_task->priority = priority;
9001c1d8:	e51b3008 	ldr	r3, [fp, #-8]
9001c1dc:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
9001c1e0:	e583208c 	str	r2, [r3, #140]	; 0x8c

    doubleListDel(&current_task->node);
9001c1e4:	e51b3008 	ldr	r3, [fp, #-8]
9001c1e8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    _double_list_del(entry->prev, entry->next);
9001c1ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c1f0:	e5932004 	ldr	r2, [r3, #4]
9001c1f4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c1f8:	e5933000 	ldr	r3, [r3]
9001c1fc:	e50b2024 	str	r2, [fp, #-36]	; 0xffffffdc
9001c200:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    next->prev = prev;
9001c204:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001c208:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001c20c:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001c210:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c214:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001c218:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001c21c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c220:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001c224:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001c228:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c22c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001c230:	e5832004 	str	r2, [r3, #4]
    doubleListAddOnBack(&current_task->node, &xizi_task_manager.task_list_head[current_task->priority]);
9001c234:	e51b2008 	ldr	r2, [fp, #-8]
9001c238:	e51b3008 	ldr	r3, [fp, #-8]
9001c23c:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001c240:	e2833004 	add	r3, r3, #4
9001c244:	e1a01183 	lsl	r1, r3, #3
9001c248:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c24c:	e3493002 	movt	r3, #36866	; 0x9002
9001c250:	e0813003 	add	r3, r1, r3
9001c254:	e50b200c 	str	r2, [fp, #-12]
9001c258:	e50b3010 	str	r3, [fp, #-16]
    _double_list_add(new_node, head->prev, head);
9001c25c:	e51b3010 	ldr	r3, [fp, #-16]
9001c260:	e5933004 	ldr	r3, [r3, #4]
9001c264:	e51b200c 	ldr	r2, [fp, #-12]
9001c268:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
9001c26c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001c270:	e51b3010 	ldr	r3, [fp, #-16]
9001c274:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    next->prev = new_node;
9001c278:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c27c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001c280:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001c284:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001c288:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001c28c:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001c290:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001c294:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001c298:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001c29c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001c2a0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001c2a4:	e5832000 	str	r2, [r3]

    ready_task_priority |= (1 << current_task->priority);
9001c2a8:	e51b3008 	ldr	r3, [fp, #-8]
9001c2ac:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001c2b0:	e3a02001 	mov	r2, #1
9001c2b4:	e1a03312 	lsl	r3, r2, r3
9001c2b8:	e1a02003 	mov	r2, r3
9001c2bc:	e304359c 	movw	r3, #17820	; 0x459c
9001c2c0:	e349309a 	movt	r3, #37018	; 0x909a
9001c2c4:	e5933000 	ldr	r3, [r3]
9001c2c8:	e1822003 	orr	r2, r2, r3
9001c2cc:	e304359c 	movw	r3, #17820	; 0x459c
9001c2d0:	e349309a 	movt	r3, #37018	; 0x909a
9001c2d4:	e5832000 	str	r2, [r3]

    return;
9001c2d8:	e320f000 	nop	{0}
}
9001c2dc:	e24bd004 	sub	sp, fp, #4
9001c2e0:	e8bd8800 	pop	{fp, pc}

9001c2e4 <module_task_manager_init>:
    .cur_task_yield_noschedule = _cur_task_yield_noschedule,
    .set_cur_task_priority = _set_cur_task_priority
};

bool module_task_manager_init(void)
{
9001c2e4:	e92d4800 	push	{fp, lr}
9001c2e8:	e28db004 	add	fp, sp, #4
    xizi_task_manager.init();
9001c2ec:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c2f0:	e3493002 	movt	r3, #36866	; 0x9002
9001c2f4:	e5933158 	ldr	r3, [r3, #344]	; 0x158
9001c2f8:	e12fff33 	blx	r3
    return true;
9001c2fc:	e3a03001 	mov	r3, #1
}
9001c300:	e1a00003 	mov	r0, r3
9001c304:	e8bd8800 	pop	{fp, pc}

9001c308 <max_priority_runnable_task>:
1. first version
*************************************************/
#include "scheduler.h"

struct TaskMicroDescriptor* max_priority_runnable_task(void)
{
9001c308:	e92d4800 	push	{fp, lr}
9001c30c:	e28db004 	add	fp, sp, #4
9001c310:	e24dd008 	sub	sp, sp, #8
    struct TaskMicroDescriptor* task = NULL;
9001c314:	e3a03000 	mov	r3, #0
9001c318:	e50b3008 	str	r3, [fp, #-8]
    uint32_t priority = 0;
9001c31c:	e3a03000 	mov	r3, #0
9001c320:	e50b300c 	str	r3, [fp, #-12]

    priority = __builtin_ffs(ready_task_priority) - 1;
9001c324:	e304359c 	movw	r3, #17820	; 0x459c
9001c328:	e349309a 	movt	r3, #37018	; 0x909a
9001c32c:	e5933000 	ldr	r3, [r3]
9001c330:	e1a02003 	mov	r2, r3
9001c334:	e6ff3f32 	rbit	r3, r2
9001c338:	e16f3f13 	clz	r3, r3
9001c33c:	e3520000 	cmp	r2, #0
9001c340:	1a000000 	bne	9001c348 <max_priority_runnable_task+0x40>
9001c344:	e3e03000 	mvn	r3, #0
9001c348:	e2833001 	add	r3, r3, #1
9001c34c:	e2433001 	sub	r3, r3, #1
9001c350:	e50b300c 	str	r3, [fp, #-12]

    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
9001c354:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c358:	e3493002 	movt	r3, #36866	; 0x9002
9001c35c:	e51b200c 	ldr	r2, [fp, #-12]
9001c360:	e2822004 	add	r2, r2, #4
9001c364:	e7933182 	ldr	r3, [r3, r2, lsl #3]
9001c368:	e50b3008 	str	r3, [fp, #-8]
9001c36c:	ea000026 	b	9001c40c <max_priority_runnable_task+0x104>
    {
        spinlock_lock(&task->lock);
9001c370:	e51b3008 	ldr	r3, [fp, #-8]
9001c374:	e2833020 	add	r3, r3, #32
9001c378:	e1a00003 	mov	r0, r3
9001c37c:	ebffde80 	bl	90013d84 <spinlock_lock>
        if (task->state == READY) {
9001c380:	e51b3008 	ldr	r3, [fp, #-8]
9001c384:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001c388:	e3530001 	cmp	r3, #1
9001c38c:	1a000008 	bne	9001c3b4 <max_priority_runnable_task+0xac>
            // found a runnable task, stop this look up
            task->state = RUNNING;
9001c390:	e51b3008 	ldr	r3, [fp, #-8]
9001c394:	e3a02002 	mov	r2, #2
9001c398:	e5c32048 	strb	r2, [r3, #72]	; 0x48
            spinlock_unlock(&task->lock);
9001c39c:	e51b3008 	ldr	r3, [fp, #-8]
9001c3a0:	e2833020 	add	r3, r3, #32
9001c3a4:	e1a00003 	mov	r0, r3
9001c3a8:	ebffdea5 	bl	90013e44 <spinlock_unlock>
            return task;
9001c3ac:	e51b3008 	ldr	r3, [fp, #-8]
9001c3b0:	ea00001f 	b	9001c434 <max_priority_runnable_task+0x12c>
        } else if (task->state == DEAD) {
9001c3b4:	e51b3008 	ldr	r3, [fp, #-8]
9001c3b8:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001c3bc:	e3530003 	cmp	r3, #3
9001c3c0:	1a00000a 	bne	9001c3f0 <max_priority_runnable_task+0xe8>
            // found a killed task, stop this loop
            // change in pcb_list may break this loop, so find a runnable in next look up
            spinlock_unlock(&task->lock);
9001c3c4:	e51b3008 	ldr	r3, [fp, #-8]
9001c3c8:	e2833020 	add	r3, r3, #32
9001c3cc:	e1a00003 	mov	r0, r3
9001c3d0:	ebffde9b 	bl	90013e44 <spinlock_unlock>
            xizi_task_manager.free_pcb(task);
9001c3d4:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c3d8:	e3493002 	movt	r3, #36866	; 0x9002
9001c3dc:	e5933160 	ldr	r3, [r3, #352]	; 0x160
9001c3e0:	e51b0008 	ldr	r0, [fp, #-8]
9001c3e4:	e12fff33 	blx	r3
            return NULL;
9001c3e8:	e3a03000 	mov	r3, #0
9001c3ec:	ea000010 	b	9001c434 <max_priority_runnable_task+0x12c>
        }
        spinlock_unlock(&task->lock);
9001c3f0:	e51b3008 	ldr	r3, [fp, #-8]
9001c3f4:	e2833020 	add	r3, r3, #32
9001c3f8:	e1a00003 	mov	r0, r3
9001c3fc:	ebffde90 	bl	90013e44 <spinlock_unlock>
    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
9001c400:	e51b3008 	ldr	r3, [fp, #-8]
9001c404:	e5933000 	ldr	r3, [r3]
9001c408:	e50b3008 	str	r3, [fp, #-8]
9001c40c:	e51b2008 	ldr	r2, [fp, #-8]
9001c410:	e51b300c 	ldr	r3, [fp, #-12]
9001c414:	e2833004 	add	r3, r3, #4
9001c418:	e1a01183 	lsl	r1, r3, #3
9001c41c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c420:	e3493002 	movt	r3, #36866	; 0x9002
9001c424:	e0813003 	add	r3, r1, r3
9001c428:	e1520003 	cmp	r2, r3
9001c42c:	1affffcf 	bne	9001c370 <max_priority_runnable_task+0x68>
    }
    return NULL;
9001c430:	e3a03000 	mov	r3, #0
}
9001c434:	e1a00003 	mov	r0, r3
9001c438:	e24bd004 	sub	sp, fp, #4
9001c43c:	e8bd8800 	pop	{fp, pc}

9001c440 <round_robin_runnable_task>:

struct TaskMicroDescriptor* round_robin_runnable_task(uint32_t priority)
{
9001c440:	e92d4800 	push	{fp, lr}
9001c444:	e28db004 	add	fp, sp, #4
9001c448:	e24dd010 	sub	sp, sp, #16
9001c44c:	e50b0010 	str	r0, [fp, #-16]
    struct TaskMicroDescriptor* task = NULL;
9001c450:	e3a03000 	mov	r3, #0
9001c454:	e50b3008 	str	r3, [fp, #-8]

    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
9001c458:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c45c:	e3493002 	movt	r3, #36866	; 0x9002
9001c460:	e51b2010 	ldr	r2, [fp, #-16]
9001c464:	e2822004 	add	r2, r2, #4
9001c468:	e7933182 	ldr	r3, [r3, r2, lsl #3]
9001c46c:	e50b3008 	str	r3, [fp, #-8]
9001c470:	ea000026 	b	9001c510 <round_robin_runnable_task+0xd0>
    {

        spinlock_lock(&task->lock);
9001c474:	e51b3008 	ldr	r3, [fp, #-8]
9001c478:	e2833020 	add	r3, r3, #32
9001c47c:	e1a00003 	mov	r0, r3
9001c480:	ebffde3f 	bl	90013d84 <spinlock_lock>
        if (task->state == READY) {
9001c484:	e51b3008 	ldr	r3, [fp, #-8]
9001c488:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001c48c:	e3530001 	cmp	r3, #1
9001c490:	1a000008 	bne	9001c4b8 <round_robin_runnable_task+0x78>
            // found a runnable task, stop this look up
            spinlock_unlock(&task->lock);
9001c494:	e51b3008 	ldr	r3, [fp, #-8]
9001c498:	e2833020 	add	r3, r3, #32
9001c49c:	e1a00003 	mov	r0, r3
9001c4a0:	ebffde67 	bl	90013e44 <spinlock_unlock>
            task->state = RUNNING;
9001c4a4:	e51b3008 	ldr	r3, [fp, #-8]
9001c4a8:	e3a02002 	mov	r2, #2
9001c4ac:	e5c32048 	strb	r2, [r3, #72]	; 0x48
            return task;
9001c4b0:	e51b3008 	ldr	r3, [fp, #-8]
9001c4b4:	ea00001f 	b	9001c538 <round_robin_runnable_task+0xf8>
        } else if (task->state == DEAD) {
9001c4b8:	e51b3008 	ldr	r3, [fp, #-8]
9001c4bc:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001c4c0:	e3530003 	cmp	r3, #3
9001c4c4:	1a00000a 	bne	9001c4f4 <round_robin_runnable_task+0xb4>
            // found a killed task, stop this loop
            // change in pcb_list may break this loop, so find a runnable in next look up
            spinlock_unlock(&task->lock);
9001c4c8:	e51b3008 	ldr	r3, [fp, #-8]
9001c4cc:	e2833020 	add	r3, r3, #32
9001c4d0:	e1a00003 	mov	r0, r3
9001c4d4:	ebffde5a 	bl	90013e44 <spinlock_unlock>
            xizi_task_manager.free_pcb(task);
9001c4d8:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c4dc:	e3493002 	movt	r3, #36866	; 0x9002
9001c4e0:	e5933160 	ldr	r3, [r3, #352]	; 0x160
9001c4e4:	e51b0008 	ldr	r0, [fp, #-8]
9001c4e8:	e12fff33 	blx	r3
            return NULL;
9001c4ec:	e3a03000 	mov	r3, #0
9001c4f0:	ea000010 	b	9001c538 <round_robin_runnable_task+0xf8>
        }
        spinlock_unlock(&task->lock);
9001c4f4:	e51b3008 	ldr	r3, [fp, #-8]
9001c4f8:	e2833020 	add	r3, r3, #32
9001c4fc:	e1a00003 	mov	r0, r3
9001c500:	ebffde4f 	bl	90013e44 <spinlock_unlock>
    DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[priority], node)
9001c504:	e51b3008 	ldr	r3, [fp, #-8]
9001c508:	e5933000 	ldr	r3, [r3]
9001c50c:	e50b3008 	str	r3, [fp, #-8]
9001c510:	e51b2008 	ldr	r2, [fp, #-8]
9001c514:	e51b3010 	ldr	r3, [fp, #-16]
9001c518:	e2833004 	add	r3, r3, #4
9001c51c:	e1a01183 	lsl	r1, r3, #3
9001c520:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c524:	e3493002 	movt	r3, #36866	; 0x9002
9001c528:	e0813003 	add	r3, r1, r3
9001c52c:	e1520003 	cmp	r2, r3
9001c530:	1affffcf 	bne	9001c474 <round_robin_runnable_task+0x34>
    }

    return NULL;
9001c534:	e3a03000 	mov	r3, #0
}
9001c538:	e1a00003 	mov	r0, r3
9001c53c:	e24bd004 	sub	sp, fp, #4
9001c540:	e8bd8800 	pop	{fp, pc}

9001c544 <recover_priority>:

/* recover task priority */
void recover_priority(void)
{
9001c544:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
9001c548:	e28db000 	add	fp, sp, #0
9001c54c:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    struct TaskMicroDescriptor* task = NULL;
9001c550:	e3a03000 	mov	r3, #0
9001c554:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 1; i < TASK_MAX_PRIORITY; i++) {
9001c558:	e3a03001 	mov	r3, #1
9001c55c:	e50b300c 	str	r3, [fp, #-12]
9001c560:	ea000057 	b	9001c6c4 <recover_priority+0x180>
        if (i == TASK_DEFAULT_PRIORITY)
9001c564:	e51b300c 	ldr	r3, [fp, #-12]
9001c568:	e3530002 	cmp	r3, #2
9001c56c:	0a000050 	beq	9001c6b4 <recover_priority+0x170>
            continue;
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
9001c570:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c574:	e3493002 	movt	r3, #36866	; 0x9002
9001c578:	e51b200c 	ldr	r2, [fp, #-12]
9001c57c:	e2822004 	add	r2, r2, #4
9001c580:	e7933182 	ldr	r3, [r3, r2, lsl #3]
9001c584:	e50b3008 	str	r3, [fp, #-8]
9001c588:	ea00003f 	b	9001c68c <recover_priority+0x148>
        {
            if (!IS_DOUBLE_LIST_EMPTY(&task->node)) {
9001c58c:	e51b3008 	ldr	r3, [fp, #-8]
9001c590:	e5932000 	ldr	r2, [r3]
9001c594:	e51b3008 	ldr	r3, [fp, #-8]
9001c598:	e1520003 	cmp	r2, r3
9001c59c:	0a000037 	beq	9001c680 <recover_priority+0x13c>
                // DEBUG("%s priority recover\n", task->name);
                task->priority = TASK_DEFAULT_PRIORITY;
9001c5a0:	e51b3008 	ldr	r3, [fp, #-8]
9001c5a4:	e3a02002 	mov	r2, #2
9001c5a8:	e583208c 	str	r2, [r3, #140]	; 0x8c
                doubleListDel(&task->node);
9001c5ac:	e51b3008 	ldr	r3, [fp, #-8]
9001c5b0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    _double_list_del(entry->prev, entry->next);
9001c5b4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c5b8:	e5932004 	ldr	r2, [r3, #4]
9001c5bc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c5c0:	e5933000 	ldr	r3, [r3]
9001c5c4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
9001c5c8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    next->prev = prev;
9001c5cc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001c5d0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001c5d4:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001c5d8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001c5dc:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001c5e0:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001c5e4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c5e8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001c5ec:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001c5f0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001c5f4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001c5f8:	e5832004 	str	r2, [r3, #4]
                doubleListAddOnBack(&task->node, &xizi_task_manager.task_list_head[task->priority]);
9001c5fc:	e51b2008 	ldr	r2, [fp, #-8]
9001c600:	e51b3008 	ldr	r3, [fp, #-8]
9001c604:	e593308c 	ldr	r3, [r3, #140]	; 0x8c
9001c608:	e2833004 	add	r3, r3, #4
9001c60c:	e1a01183 	lsl	r1, r3, #3
9001c610:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c614:	e3493002 	movt	r3, #36866	; 0x9002
9001c618:	e0813003 	add	r3, r1, r3
9001c61c:	e50b2010 	str	r2, [fp, #-16]
9001c620:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    _double_list_add(new_node, head->prev, head);
9001c624:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001c628:	e5933004 	ldr	r3, [r3, #4]
9001c62c:	e51b2010 	ldr	r2, [fp, #-16]
9001c630:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9001c634:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001c638:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001c63c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    next->prev = new_node;
9001c640:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001c644:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001c648:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001c64c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001c650:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001c654:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001c658:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001c65c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001c660:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001c664:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c668:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001c66c:	e5832000 	str	r2, [r3]
                i--;
9001c670:	e51b300c 	ldr	r3, [fp, #-12]
9001c674:	e2433001 	sub	r3, r3, #1
9001c678:	e50b300c 	str	r3, [fp, #-12]
                break;
9001c67c:	ea00000d 	b	9001c6b8 <recover_priority+0x174>
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
9001c680:	e51b3008 	ldr	r3, [fp, #-8]
9001c684:	e5933000 	ldr	r3, [r3]
9001c688:	e50b3008 	str	r3, [fp, #-8]
9001c68c:	e51b2008 	ldr	r2, [fp, #-8]
9001c690:	e51b300c 	ldr	r3, [fp, #-12]
9001c694:	e2833004 	add	r3, r3, #4
9001c698:	e1a01183 	lsl	r1, r3, #3
9001c69c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c6a0:	e3493002 	movt	r3, #36866	; 0x9002
9001c6a4:	e0813003 	add	r3, r1, r3
9001c6a8:	e1520003 	cmp	r2, r3
9001c6ac:	1affffb6 	bne	9001c58c <recover_priority+0x48>
9001c6b0:	ea000000 	b	9001c6b8 <recover_priority+0x174>
            continue;
9001c6b4:	e320f000 	nop	{0}
    for (int i = 1; i < TASK_MAX_PRIORITY; i++) {
9001c6b8:	e51b300c 	ldr	r3, [fp, #-12]
9001c6bc:	e2833001 	add	r3, r3, #1
9001c6c0:	e50b300c 	str	r3, [fp, #-12]
9001c6c4:	e51b300c 	ldr	r3, [fp, #-12]
9001c6c8:	e353001f 	cmp	r3, #31
9001c6cc:	daffffa4 	ble	9001c564 <recover_priority+0x20>
            }
        }
    }
9001c6d0:	e320f000 	nop	{0}
9001c6d4:	e28bd000 	add	sp, fp, #0
9001c6d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
9001c6dc:	e12fff1e 	bx	lr

9001c6e0 <spawn_embedded_task>:
#include "task.h"

#include "execelf.h"

int spawn_embedded_task(char* img_start, char* name, char** argv)
{
9001c6e0:	e92d4810 	push	{r4, fp, lr}
9001c6e4:	e28db008 	add	fp, sp, #8
9001c6e8:	e24ddf49 	sub	sp, sp, #292	; 0x124
9001c6ec:	e50b0118 	str	r0, [fp, #-280]	; 0xfffffee8
9001c6f0:	e50b111c 	str	r1, [fp, #-284]	; 0xfffffee4
9001c6f4:	e50b2120 	str	r2, [fp, #-288]	; 0xfffffee0
    struct TaskMicroDescriptor* new_task_cb = xizi_task_manager.new_task_cb();
9001c6f8:	e30333e0 	movw	r3, #13280	; 0x33e0
9001c6fc:	e3493002 	movt	r3, #36866	; 0x9002
9001c700:	e593315c 	ldr	r3, [r3, #348]	; 0x15c
9001c704:	e12fff33 	blx	r3
9001c708:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    if (UNLIKELY(!new_task_cb)) {
9001c70c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001c710:	e3530000 	cmp	r3, #0
9001c714:	03a03001 	moveq	r3, #1
9001c718:	13a03000 	movne	r3, #0
9001c71c:	e6ef3073 	uxtb	r3, r3
9001c720:	e3530000 	cmp	r3, #0
9001c724:	0a00000a 	beq	9001c754 <spawn_embedded_task+0x74>
        ERROR("Unable to new task control block.\n");
9001c728:	e3a02029 	mov	r2, #41	; 0x29
9001c72c:	e3021548 	movw	r1, #9544	; 0x2548
9001c730:	e3491002 	movt	r1, #36866	; 0x9002
9001c734:	e3020414 	movw	r0, #9236	; 0x2414
9001c738:	e3490002 	movt	r0, #36866	; 0x9002
9001c73c:	ebffe30d 	bl	90015378 <KPrintf>
9001c740:	e3020424 	movw	r0, #9252	; 0x2424
9001c744:	e3490002 	movt	r0, #36866	; 0x9002
9001c748:	ebffe30a 	bl	90015378 <KPrintf>
        return -1;
9001c74c:	e3e03000 	mvn	r3, #0
9001c750:	ea0001af 	b	9001ce14 <spawn_embedded_task+0x734>
    }
    // init trapframe
    arch_init_trapframe(new_task_cb->main_thread.trapframe, 0, 0);
9001c754:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001c758:	e5933078 	ldr	r3, [r3, #120]	; 0x78
9001c75c:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
9001c760:	e3a03000 	mov	r3, #0
9001c764:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
9001c768:	e3a03000 	mov	r3, #0
9001c76c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    memset(tf, 0, sizeof(*tf));
9001c770:	e3a02048 	mov	r2, #72	; 0x48
9001c774:	e3a01000 	mov	r1, #0
9001c778:	e51b0048 	ldr	r0, [fp, #-72]	; 0xffffffb8
9001c77c:	fa00107c 	blx	90020974 <memset>
    __asm__ __volatile__(
9001c780:	e10f3000 	mrs	r3, CPSR
9001c784:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    val &= ~DIS_INT;
9001c788:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
9001c78c:	e3c33080 	bic	r3, r3, #128	; 0x80
9001c790:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    val &= ~ARM_CPSR_MODE_MASK;
9001c794:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
9001c798:	e3c3301f 	bic	r3, r3, #31
9001c79c:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    val |= ARM_MODE_USR;
9001c7a0:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
9001c7a4:	e3833010 	orr	r3, r3, #16
9001c7a8:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    return val;
9001c7ac:	e51b2054 	ldr	r2, [fp, #-84]	; 0xffffffac
    tf->spsr = user_mode();
9001c7b0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001c7b4:	e583200c 	str	r2, [r3, #12]
    tf->sp_usr = sp;
9001c7b8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001c7bc:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
9001c7c0:	e5832000 	str	r2, [r3]
    tf->lr_svc = 0;
9001c7c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001c7c8:	e3a02000 	mov	r2, #0
9001c7cc:	e5832008 	str	r2, [r3, #8]
    tf->lr_usr = 0;
9001c7d0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001c7d4:	e3a02000 	mov	r2, #0
9001c7d8:	e5832004 	str	r2, [r3, #4]
    tf->pc = pc;
9001c7dc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001c7e0:	e51b2050 	ldr	r2, [fp, #-80]	; 0xffffffb0
9001c7e4:	e5832044 	str	r2, [r3, #68]	; 0x44

    /* load img to task */
    /* 1. load elf header */
    struct elfhdr* elf = (struct elfhdr*)img_start;
9001c7e8:	e51b3118 	ldr	r3, [fp, #-280]	; 0xfffffee8
9001c7ec:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    // pgdir for new task
    struct TopLevelPageDirectory pgdir;
    if (UNLIKELY(!xizi_pager.new_pgdir(&pgdir))) {
9001c7f0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001c7f4:	e3493002 	movt	r3, #36866	; 0x9002
9001c7f8:	e5933000 	ldr	r3, [r3]
9001c7fc:	e24b2070 	sub	r2, fp, #112	; 0x70
9001c800:	e1a00002 	mov	r0, r2
9001c804:	e12fff33 	blx	r3
9001c808:	e1a03000 	mov	r3, r0
9001c80c:	e2233001 	eor	r3, r3, #1
9001c810:	e6ef3073 	uxtb	r3, r3
9001c814:	e3530000 	cmp	r3, #0
9001c818:	0a000009 	beq	9001c844 <spawn_embedded_task+0x164>
        ERROR("create new pgdir failed.\n");
9001c81c:	e3a02035 	mov	r2, #53	; 0x35
9001c820:	e3021548 	movw	r1, #9544	; 0x2548
9001c824:	e3491002 	movt	r1, #36866	; 0x9002
9001c828:	e3020414 	movw	r0, #9236	; 0x2414
9001c82c:	e3490002 	movt	r0, #36866	; 0x9002
9001c830:	ebffe2d0 	bl	90015378 <KPrintf>
9001c834:	e3020448 	movw	r0, #9288	; 0x2448
9001c838:	e3490002 	movt	r0, #36866	; 0x9002
9001c83c:	ebffe2cd 	bl	90015378 <KPrintf>
        goto error_exec;
9001c840:	ea000169 	b	9001cdec <spawn_embedded_task+0x70c>
    }
    memcpy(pgdir.pd_addr, kern_pgdir.pd_addr, TOPLEVLE_PAGEDIR_SIZE);
9001c844:	e51b0070 	ldr	r0, [fp, #-112]	; 0xffffff90
9001c848:	e304352c 	movw	r3, #17708	; 0x452c
9001c84c:	e349309a 	movt	r3, #37018	; 0x909a
9001c850:	e5933000 	ldr	r3, [r3]
9001c854:	e3a02901 	mov	r2, #16384	; 0x4000
9001c858:	e1a01003 	mov	r1, r3
9001c85c:	fa000fd4 	blx	900207b4 <memcpy>

    /* 2. load elf content */
    uint32_t load_size = 0;
9001c860:	e3a03000 	mov	r3, #0
9001c864:	e50b3010 	str	r3, [fp, #-16]
    struct proghdr ph;
    for (int sec_idx = 0, off = elf->phoff; sec_idx < elf->phnum; sec_idx++, off += sizeof(ph)) {
9001c868:	e3a03000 	mov	r3, #0
9001c86c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001c870:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001c874:	e593301c 	ldr	r3, [r3, #28]
9001c878:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001c87c:	ea00006d 	b	9001ca38 <spawn_embedded_task+0x358>
        // load proghdr
        memcpy((char*)&ph, img_start + off, sizeof(ph));
9001c880:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001c884:	e51b2118 	ldr	r2, [fp, #-280]	; 0xfffffee8
9001c888:	e0821003 	add	r1, r2, r3
9001c88c:	e24b3090 	sub	r3, fp, #144	; 0x90
9001c890:	e3a02020 	mov	r2, #32
9001c894:	e1a00003 	mov	r0, r3
9001c898:	fa000fc5 	blx	900207b4 <memcpy>

        if (ph.type != ELF_PROG_LOAD)
9001c89c:	e51b3090 	ldr	r3, [fp, #-144]	; 0xffffff70
9001c8a0:	e3530001 	cmp	r3, #1
9001c8a4:	1a00005c 	bne	9001ca1c <spawn_embedded_task+0x33c>
            continue;
        if (ph.memsz < ph.filesz) {
9001c8a8:	e51b207c 	ldr	r2, [fp, #-124]	; 0xffffff84
9001c8ac:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
9001c8b0:	e1520003 	cmp	r2, r3
9001c8b4:	2a000009 	bcs	9001c8e0 <spawn_embedded_task+0x200>
            ERROR("elf header mem size less than file size\n");
9001c8b8:	e3a02044 	mov	r2, #68	; 0x44
9001c8bc:	e3021548 	movw	r1, #9544	; 0x2548
9001c8c0:	e3491002 	movt	r1, #36866	; 0x9002
9001c8c4:	e3020414 	movw	r0, #9236	; 0x2414
9001c8c8:	e3490002 	movt	r0, #36866	; 0x9002
9001c8cc:	ebffe2a9 	bl	90015378 <KPrintf>
9001c8d0:	e3020464 	movw	r0, #9316	; 0x2464
9001c8d4:	e3490002 	movt	r0, #36866	; 0x9002
9001c8d8:	ebffe2a6 	bl	90015378 <KPrintf>
            goto error_exec;
9001c8dc:	ea000142 	b	9001cdec <spawn_embedded_task+0x70c>
        }

        // read section
        // 1. alloc space
        if ((load_size = xizi_pager.resize_user_pgdir(&pgdir, load_size, ph.vaddr + ph.memsz))
9001c8e0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001c8e4:	e3493002 	movt	r3, #36866	; 0x9002
9001c8e8:	e5933010 	ldr	r3, [r3, #16]
9001c8ec:	e51b1088 	ldr	r1, [fp, #-136]	; 0xffffff78
9001c8f0:	e51b207c 	ldr	r2, [fp, #-124]	; 0xffffff84
9001c8f4:	e0812002 	add	r2, r1, r2
9001c8f8:	e24b0070 	sub	r0, fp, #112	; 0x70
9001c8fc:	e51b1010 	ldr	r1, [fp, #-16]
9001c900:	e12fff33 	blx	r3
9001c904:	e50b0010 	str	r0, [fp, #-16]
            != ph.vaddr + ph.memsz) {
9001c908:	e51b2088 	ldr	r2, [fp, #-136]	; 0xffffff78
9001c90c:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
9001c910:	e0823003 	add	r3, r2, r3
        if ((load_size = xizi_pager.resize_user_pgdir(&pgdir, load_size, ph.vaddr + ph.memsz))
9001c914:	e51b2010 	ldr	r2, [fp, #-16]
9001c918:	e1520003 	cmp	r2, r3
9001c91c:	1a000131 	bne	9001cde8 <spawn_embedded_task+0x708>
            goto error_exec;
        }
        // 2. copy inode to space
        assert(ph.vaddr % PAGE_SIZE == 0);
9001c920:	e51b3088 	ldr	r3, [fp, #-136]	; 0xffffff78
9001c924:	e7eb3053 	ubfx	r3, r3, #0, #12
9001c928:	e3530000 	cmp	r3, #0
9001c92c:	0a00000d 	beq	9001c968 <spawn_embedded_task+0x288>
9001c930:	e3a0204f 	mov	r2, #79	; 0x4f
9001c934:	e3021548 	movw	r1, #9544	; 0x2548
9001c938:	e3491002 	movt	r1, #36866	; 0x9002
9001c93c:	e3020414 	movw	r0, #9236	; 0x2414
9001c940:	e3490002 	movt	r0, #36866	; 0x9002
9001c944:	ebffe28b 	bl	90015378 <KPrintf>
9001c948:	e3021490 	movw	r1, #9360	; 0x2490
9001c94c:	e3491002 	movt	r1, #36866	; 0x9002
9001c950:	e30204ac 	movw	r0, #9388	; 0x24ac
9001c954:	e3490002 	movt	r0, #36866	; 0x9002
9001c958:	ebffe286 	bl	90015378 <KPrintf>
9001c95c:	e30204bc 	movw	r0, #9404	; 0x24bc
9001c960:	e3490002 	movt	r0, #36866	; 0x9002
9001c964:	ebffd975 	bl	90012f40 <panic>
        for (int addr_offset = 0; addr_offset < ph.filesz; addr_offset += PAGE_SIZE) {
9001c968:	e3a03000 	mov	r3, #0
9001c96c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001c970:	ea000024 	b	9001ca08 <spawn_embedded_task+0x328>
            uintptr_t page_paddr = xizi_pager.address_translate(&pgdir, ph.vaddr + addr_offset);
9001c974:	e30333ac 	movw	r3, #13228	; 0x33ac
9001c978:	e3493002 	movt	r3, #36866	; 0x9002
9001c97c:	e5933014 	ldr	r3, [r3, #20]
9001c980:	e51b1088 	ldr	r1, [fp, #-136]	; 0xffffff78
9001c984:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001c988:	e0811002 	add	r1, r1, r2
9001c98c:	e24b2070 	sub	r2, fp, #112	; 0x70
9001c990:	e1a00002 	mov	r0, r2
9001c994:	e12fff33 	blx	r3
9001c998:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
            if (page_paddr == 0) {
9001c99c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001c9a0:	e3530000 	cmp	r3, #0
9001c9a4:	1a000002 	bne	9001c9b4 <spawn_embedded_task+0x2d4>
                panic("copy elf file to unmapped addr");
9001c9a8:	e30204c0 	movw	r0, #9408	; 0x24c0
9001c9ac:	e3490002 	movt	r0, #36866	; 0x9002
9001c9b0:	ebffd962 	bl	90012f40 <panic>
            }
            uintptr_t read_size = (ph.filesz - addr_offset < PAGE_SIZE ? ph.filesz - addr_offset : PAGE_SIZE);
9001c9b4:	e51b2080 	ldr	r2, [fp, #-128]	; 0xffffff80
9001c9b8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c9bc:	e0423003 	sub	r3, r2, r3
9001c9c0:	e3530a01 	cmp	r3, #4096	; 0x1000
9001c9c4:	31a03003 	movcc	r3, r3
9001c9c8:	23a03a01 	movcs	r3, #4096	; 0x1000
9001c9cc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
            memcpy(P2V(page_paddr), img_start + (ph.off + addr_offset), read_size);
9001c9d0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001c9d4:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001c9d8:	e1a00003 	mov	r0, r3
9001c9dc:	e51b208c 	ldr	r2, [fp, #-140]	; 0xffffff74
9001c9e0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001c9e4:	e0823003 	add	r3, r2, r3
9001c9e8:	e51b2118 	ldr	r2, [fp, #-280]	; 0xfffffee8
9001c9ec:	e0823003 	add	r3, r2, r3
9001c9f0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
9001c9f4:	e1a01003 	mov	r1, r3
9001c9f8:	fa000f6d 	blx	900207b4 <memcpy>
        for (int addr_offset = 0; addr_offset < ph.filesz; addr_offset += PAGE_SIZE) {
9001c9fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001ca00:	e2833a01 	add	r3, r3, #4096	; 0x1000
9001ca04:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001ca08:	e51b2080 	ldr	r2, [fp, #-128]	; 0xffffff80
9001ca0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001ca10:	e1520003 	cmp	r2, r3
9001ca14:	8affffd6 	bhi	9001c974 <spawn_embedded_task+0x294>
9001ca18:	ea000000 	b	9001ca20 <spawn_embedded_task+0x340>
            continue;
9001ca1c:	e320f000 	nop	{0}
    for (int sec_idx = 0, off = elf->phoff; sec_idx < elf->phnum; sec_idx++, off += sizeof(ph)) {
9001ca20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ca24:	e2833001 	add	r3, r3, #1
9001ca28:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001ca2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001ca30:	e2833020 	add	r3, r3, #32
9001ca34:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001ca38:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001ca3c:	e1d332bc 	ldrh	r3, [r3, #44]	; 0x2c
9001ca40:	e1a02003 	mov	r2, r3
9001ca44:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ca48:	e1520003 	cmp	r2, r3
9001ca4c:	caffff8b 	bgt	9001c880 <spawn_embedded_task+0x1a0>
        }
    }

    /// elf file content now in memory
    // alloc stack page and map to TOP of user vspace
    uintptr_t* stack_bottom = (uintptr_t*)kalloc(USER_STACK_SIZE);
9001ca50:	e3a00a01 	mov	r0, #4096	; 0x1000
9001ca54:	ebfff086 	bl	90018c74 <kalloc>
9001ca58:	e50b0038 	str	r0, [fp, #-56]	; 0xffffffc8
    if (UNLIKELY(stack_bottom == NULL)) {
9001ca5c:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001ca60:	e3530000 	cmp	r3, #0
9001ca64:	03a03001 	moveq	r3, #1
9001ca68:	13a03000 	movne	r3, #0
9001ca6c:	e6ef3073 	uxtb	r3, r3
9001ca70:	e3530000 	cmp	r3, #0
9001ca74:	0a000009 	beq	9001caa0 <spawn_embedded_task+0x3c0>
        ERROR("No memory.\n");
9001ca78:	e3a0205e 	mov	r2, #94	; 0x5e
9001ca7c:	e3021548 	movw	r1, #9544	; 0x2548
9001ca80:	e3491002 	movt	r1, #36866	; 0x9002
9001ca84:	e3020414 	movw	r0, #9236	; 0x2414
9001ca88:	e3490002 	movt	r0, #36866	; 0x9002
9001ca8c:	ebffe239 	bl	90015378 <KPrintf>
9001ca90:	e30204e0 	movw	r0, #9440	; 0x24e0
9001ca94:	e3490002 	movt	r0, #36866	; 0x9002
9001ca98:	ebffe236 	bl	90015378 <KPrintf>
        goto error_exec;
9001ca9c:	ea0000d2 	b	9001cdec <spawn_embedded_task+0x70c>
    }
    xizi_pager.map_pages(pgdir.pd_addr, USER_MEM_TOP - USER_STACK_SIZE, V2P(stack_bottom), USER_STACK_SIZE, false);
9001caa0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001caa4:	e3493002 	movt	r3, #36866	; 0x9002
9001caa8:	e5934008 	ldr	r4, [r3, #8]
9001caac:	e51b0070 	ldr	r0, [fp, #-112]	; 0xffffff90
9001cab0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001cab4:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
9001cab8:	e3a03000 	mov	r3, #0
9001cabc:	e58d3000 	str	r3, [sp]
9001cac0:	e3a03a01 	mov	r3, #4096	; 0x1000
9001cac4:	e3a01a0f 	mov	r1, #61440	; 0xf000
9001cac8:	e3471fff 	movt	r1, #32767	; 0x7fff
9001cacc:	e12fff34 	blx	r4

    uintptr_t user_vspace_sp = USER_MEM_TOP;
9001cad0:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
9001cad4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    /// @todo change 32 to some macro
    uintptr_t user_stack_init[32];
    uintptr_t argc = 0;
9001cad8:	e3a03000 	mov	r3, #0
9001cadc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uintptr_t copy_len = 0;
9001cae0:	e3a03000 	mov	r3, #0
9001cae4:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
9001cae8:	e3a03000 	mov	r3, #0
9001caec:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001caf0:	ea000037 	b	9001cbd4 <spawn_embedded_task+0x4f4>
        /// @todo handle with large number of parameters

        // copy param to user stack
        copy_len = strlen(argv[argc]) + 1;
9001caf4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001caf8:	e1a03103 	lsl	r3, r3, #2
9001cafc:	e51b2120 	ldr	r2, [fp, #-288]	; 0xfffffee0
9001cb00:	e0823003 	add	r3, r2, r3
9001cb04:	e5933000 	ldr	r3, [r3]
9001cb08:	e1a00003 	mov	r0, r3
9001cb0c:	fa000fc1 	blx	90020a18 <strlen>
9001cb10:	e1a03000 	mov	r3, r0
9001cb14:	e2833001 	add	r3, r3, #1
9001cb18:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
        user_vspace_sp = (user_vspace_sp - copy_len) & ~3;
9001cb1c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001cb20:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cb24:	e0423003 	sub	r3, r2, r3
9001cb28:	e3c33003 	bic	r3, r3, #3
9001cb2c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)argv[argc], copy_len);
9001cb30:	e30333ac 	movw	r3, #13228	; 0x33ac
9001cb34:	e3493002 	movt	r3, #36866	; 0x9002
9001cb38:	e5934018 	ldr	r4, [r3, #24]
9001cb3c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cb40:	e1a03103 	lsl	r3, r3, #2
9001cb44:	e51b2120 	ldr	r2, [fp, #-288]	; 0xfffffee0
9001cb48:	e0823003 	add	r3, r2, r3
9001cb4c:	e5933000 	ldr	r3, [r3]
9001cb50:	e1a02003 	mov	r2, r3
9001cb54:	e24b0070 	sub	r0, fp, #112	; 0x70
9001cb58:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cb5c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001cb60:	e12fff34 	blx	r4
9001cb64:	e50b0040 	str	r0, [fp, #-64]	; 0xffffffc0
        if (UNLIKELY(copied_len != copy_len)) {
9001cb68:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
9001cb6c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cb70:	e1520003 	cmp	r2, r3
9001cb74:	13a03001 	movne	r3, #1
9001cb78:	03a03000 	moveq	r3, #0
9001cb7c:	e6ef3073 	uxtb	r3, r3
9001cb80:	e3530000 	cmp	r3, #0
9001cb84:	0a000009 	beq	9001cbb0 <spawn_embedded_task+0x4d0>
            ERROR("Something went wrong when copying params.\n");
9001cb88:	e3a02070 	mov	r2, #112	; 0x70
9001cb8c:	e3021548 	movw	r1, #9544	; 0x2548
9001cb90:	e3491002 	movt	r1, #36866	; 0x9002
9001cb94:	e3020414 	movw	r0, #9236	; 0x2414
9001cb98:	e3490002 	movt	r0, #36866	; 0x9002
9001cb9c:	ebffe1f5 	bl	90015378 <KPrintf>
9001cba0:	e30204ec 	movw	r0, #9452	; 0x24ec
9001cba4:	e3490002 	movt	r0, #36866	; 0x9002
9001cba8:	ebffe1f2 	bl	90015378 <KPrintf>
            goto error_exec;
9001cbac:	ea00008e 	b	9001cdec <spawn_embedded_task+0x70c>
        }
        user_stack_init[argc] = user_vspace_sp;
9001cbb0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cbb4:	e1a03103 	lsl	r3, r3, #2
9001cbb8:	e24b200c 	sub	r2, fp, #12
9001cbbc:	e0823003 	add	r3, r2, r3
9001cbc0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001cbc4:	e5032104 	str	r2, [r3, #-260]	; 0xfffffefc
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
9001cbc8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cbcc:	e2833001 	add	r3, r3, #1
9001cbd0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001cbd4:	e51b3120 	ldr	r3, [fp, #-288]	; 0xfffffee0
9001cbd8:	e3530000 	cmp	r3, #0
9001cbdc:	0a000006 	beq	9001cbfc <spawn_embedded_task+0x51c>
9001cbe0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cbe4:	e1a03103 	lsl	r3, r3, #2
9001cbe8:	e51b2120 	ldr	r2, [fp, #-288]	; 0xfffffee0
9001cbec:	e0823003 	add	r3, r2, r3
9001cbf0:	e5933000 	ldr	r3, [r3]
9001cbf4:	e3530000 	cmp	r3, #0
9001cbf8:	1affffbd 	bne	9001caf4 <spawn_embedded_task+0x414>
    }
    user_stack_init[argc] = 0;
9001cbfc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cc00:	e1a03103 	lsl	r3, r3, #2
9001cc04:	e24b200c 	sub	r2, fp, #12
9001cc08:	e0823003 	add	r3, r2, r3
9001cc0c:	e3a02000 	mov	r2, #0
9001cc10:	e5032104 	str	r2, [r3, #-260]	; 0xfffffefc
    copy_len = (argc + 1) * sizeof(uintptr_t);
9001cc14:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cc18:	e2833001 	add	r3, r3, #1
9001cc1c:	e1a03103 	lsl	r3, r3, #2
9001cc20:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    user_vspace_sp -= copy_len;
9001cc24:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001cc28:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cc2c:	e0423003 	sub	r3, r2, r3
9001cc30:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)user_stack_init, copy_len);
9001cc34:	e30333ac 	movw	r3, #13228	; 0x33ac
9001cc38:	e3493002 	movt	r3, #36866	; 0x9002
9001cc3c:	e5934018 	ldr	r4, [r3, #24]
9001cc40:	e24b2e11 	sub	r2, fp, #272	; 0x110
9001cc44:	e24b0070 	sub	r0, fp, #112	; 0x70
9001cc48:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cc4c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001cc50:	e12fff34 	blx	r4
9001cc54:	e50b0044 	str	r0, [fp, #-68]	; 0xffffffbc
    if (UNLIKELY(copied_len != copy_len)) {
9001cc58:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
9001cc5c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001cc60:	e1520003 	cmp	r2, r3
9001cc64:	13a03001 	movne	r3, #1
9001cc68:	03a03000 	moveq	r3, #0
9001cc6c:	e6ef3073 	uxtb	r3, r3
9001cc70:	e3530000 	cmp	r3, #0
9001cc74:	0a000009 	beq	9001cca0 <spawn_embedded_task+0x5c0>
        ERROR("Something went wrong when copying params.\n");
9001cc78:	e3a0207a 	mov	r2, #122	; 0x7a
9001cc7c:	e3021548 	movw	r1, #9544	; 0x2548
9001cc80:	e3491002 	movt	r1, #36866	; 0x9002
9001cc84:	e3020414 	movw	r0, #9236	; 0x2414
9001cc88:	e3490002 	movt	r0, #36866	; 0x9002
9001cc8c:	ebffe1b9 	bl	90015378 <KPrintf>
9001cc90:	e30204ec 	movw	r0, #9452	; 0x24ec
9001cc94:	e3490002 	movt	r0, #36866	; 0x9002
9001cc98:	ebffe1b6 	bl	90015378 <KPrintf>
        goto error_exec;
9001cc9c:	ea000052 	b	9001cdec <spawn_embedded_task+0x70c>
    }

    // init task trapframe, which stores in svc stack
    // do not go tp error_exec once we change trapframe!
    assert(copied_len == (argc + 1) * sizeof(uintptr_t));
9001cca0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cca4:	e2833001 	add	r3, r3, #1
9001cca8:	e1a02103 	lsl	r2, r3, #2
9001ccac:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
9001ccb0:	e1520003 	cmp	r2, r3
9001ccb4:	0a00000d 	beq	9001ccf0 <spawn_embedded_task+0x610>
9001ccb8:	e3a02080 	mov	r2, #128	; 0x80
9001ccbc:	e3021548 	movw	r1, #9544	; 0x2548
9001ccc0:	e3491002 	movt	r1, #36866	; 0x9002
9001ccc4:	e3020414 	movw	r0, #9236	; 0x2414
9001ccc8:	e3490002 	movt	r0, #36866	; 0x9002
9001cccc:	ebffe1a9 	bl	90015378 <KPrintf>
9001ccd0:	e3021518 	movw	r1, #9496	; 0x2518
9001ccd4:	e3491002 	movt	r1, #36866	; 0x9002
9001ccd8:	e30204ac 	movw	r0, #9388	; 0x24ac
9001ccdc:	e3490002 	movt	r0, #36866	; 0x9002
9001cce0:	ebffe1a4 	bl	90015378 <KPrintf>
9001cce4:	e30204bc 	movw	r0, #9404	; 0x24bc
9001cce8:	e3490002 	movt	r0, #36866	; 0x9002
9001ccec:	ebffd893 	bl	90012f40 <panic>
    arch_trapframe_set_sp_pc(new_task_cb->main_thread.trapframe, user_vspace_sp, elf->entry);
9001ccf0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001ccf4:	e5932078 	ldr	r2, [r3, #120]	; 0x78
9001ccf8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001ccfc:	e5933018 	ldr	r3, [r3, #24]
9001cd00:	e50b2064 	str	r2, [fp, #-100]	; 0xffffff9c
9001cd04:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001cd08:	e50b2068 	str	r2, [fp, #-104]	; 0xffffff98
9001cd0c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    tf->sp_usr = sp;
9001cd10:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
9001cd14:	e51b2068 	ldr	r2, [fp, #-104]	; 0xffffff98
9001cd18:	e5832000 	str	r2, [r3]
    tf->pc = pc;
9001cd1c:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
9001cd20:	e51b206c 	ldr	r2, [fp, #-108]	; 0xffffff94
9001cd24:	e5832044 	str	r2, [r3, #68]	; 0x44
    arch_set_main_params(new_task_cb->main_thread.trapframe, argc, user_vspace_sp);
9001cd28:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001cd2c:	e5932078 	ldr	r2, [r3, #120]	; 0x78
9001cd30:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001cd34:	e50b2058 	str	r2, [fp, #-88]	; 0xffffffa8
9001cd38:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
9001cd3c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001cd40:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    tf->r0 = (uint32_t)argc;
9001cd44:	e51b205c 	ldr	r2, [fp, #-92]	; 0xffffffa4
9001cd48:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
9001cd4c:	e5832010 	str	r2, [r3, #16]
    tf->r1 = (uint32_t)argv;
9001cd50:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
9001cd54:	e51b2060 	ldr	r2, [fp, #-96]	; 0xffffffa0
9001cd58:	e5832014 	str	r2, [r3, #20]

    // save program name
    strncpy(new_task_cb->name, name, sizeof(new_task_cb->name));
9001cd5c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001cd60:	e2833094 	add	r3, r3, #148	; 0x94
9001cd64:	e3a02010 	mov	r2, #16
9001cd68:	e51b111c 	ldr	r1, [fp, #-284]	; 0xfffffee4
9001cd6c:	e1a00003 	mov	r0, r3
9001cd70:	fa000f66 	blx	90020b10 <strncpy>

    struct TopLevelPageDirectory old_pgdir = new_task_cb->pgdir;
9001cd74:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001cd78:	e5933050 	ldr	r3, [r3, #80]	; 0x50
9001cd7c:	e50b3114 	str	r3, [fp, #-276]	; 0xfffffeec
    new_task_cb->pgdir = pgdir;
9001cd80:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001cd84:	e51b2070 	ldr	r2, [fp, #-112]	; 0xffffff90
9001cd88:	e5832050 	str	r2, [r3, #80]	; 0x50

    /// @todo record mem size used b task
    new_task_cb->mem_size = ALIGNUP(load_size, PAGE_SIZE);
9001cd8c:	e51b3010 	ldr	r3, [fp, #-16]
9001cd90:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001cd94:	e283300f 	add	r3, r3, #15
9001cd98:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
9001cd9c:	e3c3300f 	bic	r3, r3, #15
9001cda0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001cda4:	e5823090 	str	r3, [r2, #144]	; 0x90

    xizi_pager.free_user_pgdir(&old_pgdir);
9001cda8:	e30333ac 	movw	r3, #13228	; 0x33ac
9001cdac:	e3493002 	movt	r3, #36866	; 0x9002
9001cdb0:	e5933004 	ldr	r3, [r3, #4]
9001cdb4:	e24b2f45 	sub	r2, fp, #276	; 0x114
9001cdb8:	e1a00002 	mov	r0, r2
9001cdbc:	e12fff33 	blx	r3

    xizi_task_manager.task_set_default_schedule_attr(new_task_cb, RequireRootTag());
9001cdc0:	e30333e0 	movw	r3, #13280	; 0x33e0
9001cdc4:	e3493002 	movt	r3, #36866	; 0x9002
9001cdc8:	e5934164 	ldr	r4, [r3, #356]	; 0x164
9001cdcc:	ebffe7a7 	bl	90016c70 <RequireRootTag>
9001cdd0:	e1a03000 	mov	r3, r0
9001cdd4:	e1a01003 	mov	r1, r3
9001cdd8:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
9001cddc:	e12fff34 	blx	r4
    return 0;
9001cde0:	e3a03000 	mov	r3, #0
9001cde4:	ea00000a 	b	9001ce14 <spawn_embedded_task+0x734>
            goto error_exec;
9001cde8:	e320f000 	nop	{0}

error_exec:
    if (pgdir.pd_addr != NULL) {
9001cdec:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
9001cdf0:	e3530000 	cmp	r3, #0
9001cdf4:	0a000005 	beq	9001ce10 <spawn_embedded_task+0x730>
        xizi_pager.free_user_pgdir(&pgdir);
9001cdf8:	e30333ac 	movw	r3, #13228	; 0x33ac
9001cdfc:	e3493002 	movt	r3, #36866	; 0x9002
9001ce00:	e5933004 	ldr	r3, [r3, #4]
9001ce04:	e24b2070 	sub	r2, fp, #112	; 0x70
9001ce08:	e1a00002 	mov	r0, r2
9001ce0c:	e12fff33 	blx	r3
    }
    return -1;
9001ce10:	e3e03000 	mvn	r3, #0
9001ce14:	e1a00003 	mov	r0, r3
9001ce18:	e24bd008 	sub	sp, fp, #8
9001ce1c:	e8bd8810 	pop	{r4, fp, pc}

9001ce20 <syscall>:
#include "trap_common.h"

#include "syscall.h"

int syscall(int sys_num, uintptr_t param1, uintptr_t param2, uintptr_t param3, uintptr_t param4)
{
9001ce20:	e92d4800 	push	{fp, lr}
9001ce24:	e28db004 	add	fp, sp, #4
9001ce28:	e24dd018 	sub	sp, sp, #24
9001ce2c:	e50b0010 	str	r0, [fp, #-16]
9001ce30:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001ce34:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9001ce38:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    int ret = -1;
9001ce3c:	e3e03000 	mvn	r3, #0
9001ce40:	e50b3008 	str	r3, [fp, #-8]

    switch (sys_num) {
9001ce44:	e51b3010 	ldr	r3, [fp, #-16]
9001ce48:	e353000b 	cmp	r3, #11
9001ce4c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
9001ce50:	ea000050 	b	9001cf98 <syscall+0x178>
9001ce54:	9001ce84 	.word	0x9001ce84
9001ce58:	9001ce90 	.word	0x9001ce90
9001ce5c:	9001ceac 	.word	0x9001ceac
9001ce60:	9001ceb8 	.word	0x9001ceb8
9001ce64:	9001cf60 	.word	0x9001cf60
9001ce68:	9001cec4 	.word	0x9001cec4
9001ce6c:	9001ced8 	.word	0x9001ced8
9001ce70:	9001cef4 	.word	0x9001cef4
9001ce74:	9001cf10 	.word	0x9001cf10
9001ce78:	9001cf24 	.word	0x9001cf24
9001ce7c:	9001cf40 	.word	0x9001cf40
9001ce80:	9001cf7c 	.word	0x9001cf7c
    case SYSCALL_TEST:
        ret = 0;
9001ce84:	e3a03000 	mov	r3, #0
9001ce88:	e50b3008 	str	r3, [fp, #-8]
        break;
9001ce8c:	ea00004e 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_SPAWN:
        ret = sys_spawn((struct KernReadTool*)param1, (char*)param2, (char**)param3);
9001ce90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ce94:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001ce98:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001ce9c:	e1a00003 	mov	r0, r3
9001cea0:	eb00004d 	bl	9001cfdc <sys_spawn>
9001cea4:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cea8:	ea000047 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_EXIT:
        ret = sys_exit();
9001ceac:	eb000742 	bl	9001ebbc <sys_exit>
9001ceb0:	e50b0008 	str	r0, [fp, #-8]
        break;
9001ceb4:	ea000044 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_YIELD:
        ret = sys_yield();
9001ceb8:	eb000306 	bl	9001dad8 <sys_yield>
9001cebc:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cec0:	ea000041 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_SERVER:
        ret = sys_register_as_server((char*)param1);
9001cec4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cec8:	e1a00003 	mov	r0, r3
9001cecc:	eb00031d 	bl	9001db48 <sys_register_as_server>
9001ced0:	e50b0008 	str	r0, [fp, #-8]
        break;
9001ced4:	ea00003c 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_SESSION:
        ret = sys_connect_session((char*)param1, (int)param2, (struct Session*)param3);
9001ced8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cedc:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001cee0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001cee4:	e1a00003 	mov	r0, r3
9001cee8:	eb00039e 	bl	9001dd68 <sys_connect_session>
9001ceec:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cef0:	ea000035 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_POLL_SESSION:
        ret = sys_poll_session((struct Session*)param1, (int)param2);
9001cef4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cef8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001cefc:	e1a01002 	mov	r1, r2
9001cf00:	e1a00003 	mov	r0, r3
9001cf04:	eb000410 	bl	9001df4c <sys_poll_session>
9001cf08:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf0c:	ea00002e 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_CLOSE_SESSION:
        ret = sys_close_session((struct Session*)param1);
9001cf10:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cf14:	e1a00003 	mov	r0, r3
9001cf18:	eb000560 	bl	9001e4a0 <sys_close_session>
9001cf1c:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf20:	ea000029 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_EXEC:
        ret = sys_exec((struct KernReadTool*)param1, (char*)param2, (char**)param3);
9001cf24:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cf28:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001cf2c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001cf30:	e1a00003 	mov	r0, r3
9001cf34:	eb00029c 	bl	9001d9ac <sys_exec>
9001cf38:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf3c:	ea000022 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_SYS_STATE:
        ret = sys_state(param1, (sys_state_info*)param2);
9001cf40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cf44:	e6ef3073 	uxtb	r3, r3
9001cf48:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001cf4c:	e1a01002 	mov	r1, r2
9001cf50:	e1a00003 	mov	r0, r3
9001cf54:	eb000904 	bl	9001f36c <sys_state>
9001cf58:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf5c:	ea00001a 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_MMAP:
        ret = sys_mmap(param1, param2, (int)param3, (int)param4);
9001cf60:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001cf64:	e59b3004 	ldr	r3, [fp, #4]
9001cf68:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001cf6c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
9001cf70:	eb000949 	bl	9001f49c <sys_mmap>
9001cf74:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf78:	ea000013 	b	9001cfcc <syscall+0x1ac>
    case SYSCALL_REGISTER_IRQ:
        ret = sys_register_irq((int)param1, (int)param2);
9001cf7c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001cf80:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001cf84:	e1a01002 	mov	r1, r2
9001cf88:	e1a00003 	mov	r0, r3
9001cf8c:	eb000693 	bl	9001e9e0 <sys_register_irq>
9001cf90:	e50b0008 	str	r0, [fp, #-8]
        break;
9001cf94:	ea00000c 	b	9001cfcc <syscall+0x1ac>

    default:
        ERROR("Unsurport syscall(%d) right now\n", sys_num);
9001cf98:	e3a0204e 	mov	r2, #78	; 0x4e
9001cf9c:	e3021590 	movw	r1, #9616	; 0x2590
9001cfa0:	e3491002 	movt	r1, #36866	; 0x9002
9001cfa4:	e302055c 	movw	r0, #9564	; 0x255c
9001cfa8:	e3490002 	movt	r0, #36866	; 0x9002
9001cfac:	ebffe0f1 	bl	90015378 <KPrintf>
9001cfb0:	e51b1010 	ldr	r1, [fp, #-16]
9001cfb4:	e302056c 	movw	r0, #9580	; 0x256c
9001cfb8:	e3490002 	movt	r0, #36866	; 0x9002
9001cfbc:	ebffe0ed 	bl	90015378 <KPrintf>
        ret = -1;
9001cfc0:	e3e03000 	mvn	r3, #0
9001cfc4:	e50b3008 	str	r3, [fp, #-8]
        break;
9001cfc8:	e320f000 	nop	{0}
    }

    return ret;
9001cfcc:	e51b3008 	ldr	r3, [fp, #-8]
9001cfd0:	e1a00003 	mov	r0, r3
9001cfd4:	e24bd004 	sub	sp, fp, #4
9001cfd8:	e8bd8800 	pop	{fp, pc}

9001cfdc <sys_spawn>:
#include "syscall.h"
#include "task.h"

extern int task_exec(struct TaskMicroDescriptor* task, struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv);
int sys_spawn(struct KernReadTool* read_tool, char* name, char** argv)
{
9001cfdc:	e92d4810 	push	{r4, fp, lr}
9001cfe0:	e28db008 	add	fp, sp, #8
9001cfe4:	e24dd03c 	sub	sp, sp, #60	; 0x3c
9001cfe8:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
9001cfec:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
9001cff0:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    // alloc a new pcb
    struct TaskMicroDescriptor* new_task_cb = xizi_task_manager.new_task_cb();
9001cff4:	e30333e0 	movw	r3, #13280	; 0x33e0
9001cff8:	e3493002 	movt	r3, #36866	; 0x9002
9001cffc:	e593315c 	ldr	r3, [r3, #348]	; 0x15c
9001d000:	e12fff33 	blx	r3
9001d004:	e50b0010 	str	r0, [fp, #-16]
    if (UNLIKELY(!new_task_cb)) {
9001d008:	e51b3010 	ldr	r3, [fp, #-16]
9001d00c:	e3530000 	cmp	r3, #0
9001d010:	03a03001 	moveq	r3, #1
9001d014:	13a03000 	movne	r3, #0
9001d018:	e6ef3073 	uxtb	r3, r3
9001d01c:	e3530000 	cmp	r3, #0
9001d020:	0a00000a 	beq	9001d050 <sys_spawn+0x74>
        ERROR("Unable to new task control block.\n");
9001d024:	e3a0202a 	mov	r2, #42	; 0x2a
9001d028:	e30215cc 	movw	r1, #9676	; 0x25cc
9001d02c:	e3491002 	movt	r1, #36866	; 0x9002
9001d030:	e3020598 	movw	r0, #9624	; 0x2598
9001d034:	e3490002 	movt	r0, #36866	; 0x9002
9001d038:	ebffe0ce 	bl	90015378 <KPrintf>
9001d03c:	e30205a8 	movw	r0, #9640	; 0x25a8
9001d040:	e3490002 	movt	r0, #36866	; 0x9002
9001d044:	ebffe0cb 	bl	90015378 <KPrintf>
        return -1;
9001d048:	e3e03000 	mvn	r3, #0
9001d04c:	ea000049 	b	9001d178 <sys_spawn+0x19c>
    }
    // init trapframe
    arch_init_trapframe(new_task_cb->main_thread.trapframe, 0, 0);
9001d050:	e51b3010 	ldr	r3, [fp, #-16]
9001d054:	e5933078 	ldr	r3, [r3, #120]	; 0x78
9001d058:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
9001d05c:	e3a03000 	mov	r3, #0
9001d060:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001d064:	e3a03000 	mov	r3, #0
9001d068:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    memset(tf, 0, sizeof(*tf));
9001d06c:	e3a02048 	mov	r2, #72	; 0x48
9001d070:	e3a01000 	mov	r1, #0
9001d074:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001d078:	fa000e3d 	blx	90020974 <memset>
    __asm__ __volatile__(
9001d07c:	e10f3000 	mrs	r3, CPSR
9001d080:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    val &= ~DIS_INT;
9001d084:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001d088:	e3c33080 	bic	r3, r3, #128	; 0x80
9001d08c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    val &= ~ARM_CPSR_MODE_MASK;
9001d090:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001d094:	e3c3301f 	bic	r3, r3, #31
9001d098:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    val |= ARM_MODE_USR;
9001d09c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001d0a0:	e3833010 	orr	r3, r3, #16
9001d0a4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    return val;
9001d0a8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    tf->spsr = user_mode();
9001d0ac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d0b0:	e583200c 	str	r2, [r3, #12]
    tf->sp_usr = sp;
9001d0b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d0b8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001d0bc:	e5832000 	str	r2, [r3]
    tf->lr_svc = 0;
9001d0c0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d0c4:	e3a02000 	mov	r2, #0
9001d0c8:	e5832008 	str	r2, [r3, #8]
    tf->lr_usr = 0;
9001d0cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d0d0:	e3a02000 	mov	r2, #0
9001d0d4:	e5832004 	str	r2, [r3, #4]
    tf->pc = pc;
9001d0d8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d0dc:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001d0e0:	e5832044 	str	r2, [r3, #68]	; 0x44

    struct Session* session = read_tool->session;
9001d0e4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001d0e8:	e5933000 	ldr	r3, [r3]
9001d0ec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    int fd = read_tool->fd;
9001d0f0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001d0f4:	e5933004 	ldr	r3, [r3, #4]
9001d0f8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    ipc_read_fn ipc_read = read_tool->ipc_read;
9001d0fc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001d100:	e5933008 	ldr	r3, [r3, #8]
9001d104:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if (UNLIKELY(task_exec(new_task_cb, session, fd, ipc_read, name, argv)) < 0) {
9001d108:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d10c:	e58d3004 	str	r3, [sp, #4]
9001d110:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001d114:	e58d3000 	str	r3, [sp]
9001d118:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d11c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001d120:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001d124:	e51b0010 	ldr	r0, [fp, #-16]
9001d128:	eb000028 	bl	9001d1d0 <task_exec>
9001d12c:	e1a03000 	mov	r3, r0
9001d130:	e3530000 	cmp	r3, #0
9001d134:	aa000006 	bge	9001d154 <sys_spawn+0x178>
        xizi_task_manager.free_pcb(new_task_cb);
9001d138:	e30333e0 	movw	r3, #13280	; 0x33e0
9001d13c:	e3493002 	movt	r3, #36866	; 0x9002
9001d140:	e5933160 	ldr	r3, [r3, #352]	; 0x160
9001d144:	e51b0010 	ldr	r0, [fp, #-16]
9001d148:	e12fff33 	blx	r3
        return -1;
9001d14c:	e3e03000 	mvn	r3, #0
9001d150:	ea000008 	b	9001d178 <sys_spawn+0x19c>
    }
    // init pcb
    xizi_task_manager.task_set_default_schedule_attr(new_task_cb, RequireRootTag());
9001d154:	e30333e0 	movw	r3, #13280	; 0x33e0
9001d158:	e3493002 	movt	r3, #36866	; 0x9002
9001d15c:	e5934164 	ldr	r4, [r3, #356]	; 0x164
9001d160:	ebffe6c2 	bl	90016c70 <RequireRootTag>
9001d164:	e1a03000 	mov	r3, r0
9001d168:	e1a01003 	mov	r1, r3
9001d16c:	e51b0010 	ldr	r0, [fp, #-16]
9001d170:	e12fff34 	blx	r4

    return 0;
9001d174:	e3a03000 	mov	r3, #0
9001d178:	e1a00003 	mov	r0, r3
9001d17c:	e24bd008 	sub	sp, fp, #8
9001d180:	e8bd8810 	pop	{r4, fp, pc}

9001d184 <cur_cpuid>:
{
9001d184:	e92d4800 	push	{fp, lr}
9001d188:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001d18c:	ebffcfe7 	bl	90011130 <cpu_get_current>
9001d190:	e1a03000 	mov	r3, r0
}
9001d194:	e1a00003 	mov	r0, r3
9001d198:	e8bd8800 	pop	{fp, pc}

9001d19c <cur_cpu>:
{
9001d19c:	e92d4800 	push	{fp, lr}
9001d1a0:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001d1a4:	ebfffff6 	bl	9001d184 <cur_cpuid>
9001d1a8:	e1a02000 	mov	r2, r0
9001d1ac:	e1a03002 	mov	r3, r2
9001d1b0:	e1a03083 	lsl	r3, r3, #1
9001d1b4:	e0833002 	add	r3, r3, r2
9001d1b8:	e1a03103 	lsl	r3, r3, #2
9001d1bc:	e304256c 	movw	r2, #17772	; 0x456c
9001d1c0:	e349209a 	movt	r2, #37018	; 0x909a
9001d1c4:	e0833002 	add	r3, r3, r2
9001d1c8:	e1a00003 	mov	r0, r3
9001d1cc:	e8bd8800 	pop	{fp, pc}

9001d1d0 <task_exec>:
/// @brief load a user program for execution
/// @param path path to elf file
/// @param argv arguments giving to main
/// @return
int task_exec(struct TaskMicroDescriptor* task, struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
9001d1d0:	e92d4810 	push	{r4, fp, lr}
9001d1d4:	e28db008 	add	fp, sp, #8
9001d1d8:	e24ddf51 	sub	sp, sp, #324	; 0x144
9001d1dc:	e50b0138 	str	r0, [fp, #-312]	; 0xfffffec8
9001d1e0:	e50b113c 	str	r1, [fp, #-316]	; 0xfffffec4
9001d1e4:	e50b2140 	str	r2, [fp, #-320]	; 0xfffffec0
9001d1e8:	e50b3144 	str	r3, [fp, #-324]	; 0xfffffebc
    struct elfhdr elf;
    struct TopLevelPageDirectory pgdir;
    pgdir.pd_addr = NULL;
9001d1ec:	e3a03000 	mov	r3, #0
9001d1f0:	e50b3090 	str	r3, [fp, #-144]	; 0xffffff70

    if (ipc_read(session, fd, (char*)&elf, 0, sizeof(elf)) < sizeof(elf) || elf.magic != ELF_MAGIC) {
9001d1f4:	e24b208c 	sub	r2, fp, #140	; 0x8c
9001d1f8:	e3a03034 	mov	r3, #52	; 0x34
9001d1fc:	e58d3000 	str	r3, [sp]
9001d200:	e51b4144 	ldr	r4, [fp, #-324]	; 0xfffffebc
9001d204:	e3a03000 	mov	r3, #0
9001d208:	e51b1140 	ldr	r1, [fp, #-320]	; 0xfffffec0
9001d20c:	e51b013c 	ldr	r0, [fp, #-316]	; 0xfffffec4
9001d210:	e12fff34 	blx	r4
9001d214:	e1a03000 	mov	r3, r0
9001d218:	e3530033 	cmp	r3, #51	; 0x33
9001d21c:	9a000004 	bls	9001d234 <task_exec+0x64>
9001d220:	e51b208c 	ldr	r2, [fp, #-140]	; 0xffffff74
9001d224:	e304357f 	movw	r3, #17791	; 0x457f
9001d228:	e344364c 	movt	r3, #17996	; 0x464c
9001d22c:	e1520003 	cmp	r2, r3
9001d230:	0a000009 	beq	9001d25c <task_exec+0x8c>
        ERROR("invalide elf file.\n");
9001d234:	e3a0204c 	mov	r2, #76	; 0x4c
9001d238:	e3021784 	movw	r1, #10116	; 0x2784
9001d23c:	e3491002 	movt	r1, #36866	; 0x9002
9001d240:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d244:	e3490002 	movt	r0, #36866	; 0x9002
9001d248:	ebffe04a 	bl	90015378 <KPrintf>
9001d24c:	e30205e8 	movw	r0, #9704	; 0x25e8
9001d250:	e3490002 	movt	r0, #36866	; 0x9002
9001d254:	ebffe047 	bl	90015378 <KPrintf>
        goto error_exec;
9001d258:	ea0001bd 	b	9001d954 <task_exec+0x784>
    }

    // pgdir for new task
    if (UNLIKELY(!xizi_pager.new_pgdir(&pgdir))) {
9001d25c:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d260:	e3493002 	movt	r3, #36866	; 0x9002
9001d264:	e5933000 	ldr	r3, [r3]
9001d268:	e24b2090 	sub	r2, fp, #144	; 0x90
9001d26c:	e1a00002 	mov	r0, r2
9001d270:	e12fff33 	blx	r3
9001d274:	e1a03000 	mov	r3, r0
9001d278:	e2233001 	eor	r3, r3, #1
9001d27c:	e6ef3073 	uxtb	r3, r3
9001d280:	e3530000 	cmp	r3, #0
9001d284:	0a000009 	beq	9001d2b0 <task_exec+0xe0>
        ERROR("create new pgdir failed.\n");
9001d288:	e3a02052 	mov	r2, #82	; 0x52
9001d28c:	e3021784 	movw	r1, #10116	; 0x2784
9001d290:	e3491002 	movt	r1, #36866	; 0x9002
9001d294:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d298:	e3490002 	movt	r0, #36866	; 0x9002
9001d29c:	ebffe035 	bl	90015378 <KPrintf>
9001d2a0:	e30205fc 	movw	r0, #9724	; 0x25fc
9001d2a4:	e3490002 	movt	r0, #36866	; 0x9002
9001d2a8:	ebffe032 	bl	90015378 <KPrintf>
        goto error_exec;
9001d2ac:	ea0001a8 	b	9001d954 <task_exec+0x784>
    }
    memcpy(pgdir.pd_addr, kern_pgdir.pd_addr, TOPLEVLE_PAGEDIR_SIZE);
9001d2b0:	e51b0090 	ldr	r0, [fp, #-144]	; 0xffffff70
9001d2b4:	e304352c 	movw	r3, #17708	; 0x452c
9001d2b8:	e349309a 	movt	r3, #37018	; 0x909a
9001d2bc:	e5933000 	ldr	r3, [r3]
9001d2c0:	e3a02901 	mov	r2, #16384	; 0x4000
9001d2c4:	e1a01003 	mov	r1, r3
9001d2c8:	fa000d39 	blx	900207b4 <memcpy>

    // read elf file by (header, section)
    uintptr_t load_size = 0;
9001d2cc:	e3a03000 	mov	r3, #0
9001d2d0:	e50b3010 	str	r3, [fp, #-16]
    struct proghdr ph;
    for (int sec_idx = 0, off = elf.phoff; sec_idx < elf.phnum; sec_idx++, off += sizeof(ph)) {
9001d2d4:	e3a03000 	mov	r3, #0
9001d2d8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001d2dc:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
9001d2e0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001d2e4:	ea000093 	b	9001d538 <task_exec+0x368>
        if (ipc_read(session, fd, (char*)&ph, off, sizeof(ph)) != sizeof(ph)) {
9001d2e8:	e24b20b0 	sub	r2, fp, #176	; 0xb0
9001d2ec:	e3a03020 	mov	r3, #32
9001d2f0:	e58d3000 	str	r3, [sp]
9001d2f4:	e51b4144 	ldr	r4, [fp, #-324]	; 0xfffffebc
9001d2f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001d2fc:	e51b1140 	ldr	r1, [fp, #-320]	; 0xfffffec0
9001d300:	e51b013c 	ldr	r0, [fp, #-316]	; 0xfffffec4
9001d304:	e12fff34 	blx	r4
9001d308:	e1a03000 	mov	r3, r0
9001d30c:	e3530020 	cmp	r3, #32
9001d310:	0a000009 	beq	9001d33c <task_exec+0x16c>
            ERROR("Read elf header failed\n");
9001d314:	e3a0205c 	mov	r2, #92	; 0x5c
9001d318:	e3021784 	movw	r1, #10116	; 0x2784
9001d31c:	e3491002 	movt	r1, #36866	; 0x9002
9001d320:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d324:	e3490002 	movt	r0, #36866	; 0x9002
9001d328:	ebffe012 	bl	90015378 <KPrintf>
9001d32c:	e3020618 	movw	r0, #9752	; 0x2618
9001d330:	e3490002 	movt	r0, #36866	; 0x9002
9001d334:	ebffe00f 	bl	90015378 <KPrintf>
            goto error_exec;
9001d338:	ea000185 	b	9001d954 <task_exec+0x784>
        }

        if (ph.type != ELF_PROG_LOAD)
9001d33c:	e51b30b0 	ldr	r3, [fp, #-176]	; 0xffffff50
9001d340:	e3530001 	cmp	r3, #1
9001d344:	1a000074 	bne	9001d51c <task_exec+0x34c>
            continue;
        if (ph.memsz < ph.filesz) {
9001d348:	e51b209c 	ldr	r2, [fp, #-156]	; 0xffffff64
9001d34c:	e51b30a0 	ldr	r3, [fp, #-160]	; 0xffffff60
9001d350:	e1520003 	cmp	r2, r3
9001d354:	2a000009 	bcs	9001d380 <task_exec+0x1b0>
            ERROR("elf header mem size less than file size\n");
9001d358:	e3a02063 	mov	r2, #99	; 0x63
9001d35c:	e3021784 	movw	r1, #10116	; 0x2784
9001d360:	e3491002 	movt	r1, #36866	; 0x9002
9001d364:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d368:	e3490002 	movt	r0, #36866	; 0x9002
9001d36c:	ebffe001 	bl	90015378 <KPrintf>
9001d370:	e3020630 	movw	r0, #9776	; 0x2630
9001d374:	e3490002 	movt	r0, #36866	; 0x9002
9001d378:	ebffdffe 	bl	90015378 <KPrintf>
            goto error_exec;
9001d37c:	ea000174 	b	9001d954 <task_exec+0x784>
        }

        // read section
        // 1. alloc space
        if ((load_size = xizi_pager.resize_user_pgdir(&pgdir, load_size, ph.vaddr + ph.memsz))
9001d380:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d384:	e3493002 	movt	r3, #36866	; 0x9002
9001d388:	e5933010 	ldr	r3, [r3, #16]
9001d38c:	e51b10a8 	ldr	r1, [fp, #-168]	; 0xffffff58
9001d390:	e51b209c 	ldr	r2, [fp, #-156]	; 0xffffff64
9001d394:	e0812002 	add	r2, r1, r2
9001d398:	e24b0090 	sub	r0, fp, #144	; 0x90
9001d39c:	e51b1010 	ldr	r1, [fp, #-16]
9001d3a0:	e12fff33 	blx	r3
9001d3a4:	e50b0010 	str	r0, [fp, #-16]
            != ph.vaddr + ph.memsz) {
9001d3a8:	e51b20a8 	ldr	r2, [fp, #-168]	; 0xffffff58
9001d3ac:	e51b309c 	ldr	r3, [fp, #-156]	; 0xffffff64
9001d3b0:	e0823003 	add	r3, r2, r3
        if ((load_size = xizi_pager.resize_user_pgdir(&pgdir, load_size, ph.vaddr + ph.memsz))
9001d3b4:	e51b2010 	ldr	r2, [fp, #-16]
9001d3b8:	e1520003 	cmp	r2, r3
9001d3bc:	1a000163 	bne	9001d950 <task_exec+0x780>
            goto error_exec;
        }
        // 2. copy inode to space
        assert(ph.vaddr % PAGE_SIZE == 0);
9001d3c0:	e51b30a8 	ldr	r3, [fp, #-168]	; 0xffffff58
9001d3c4:	e7eb3053 	ubfx	r3, r3, #0, #12
9001d3c8:	e3530000 	cmp	r3, #0
9001d3cc:	0a00000d 	beq	9001d408 <task_exec+0x238>
9001d3d0:	e3a0206e 	mov	r2, #110	; 0x6e
9001d3d4:	e3021784 	movw	r1, #10116	; 0x2784
9001d3d8:	e3491002 	movt	r1, #36866	; 0x9002
9001d3dc:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d3e0:	e3490002 	movt	r0, #36866	; 0x9002
9001d3e4:	ebffdfe3 	bl	90015378 <KPrintf>
9001d3e8:	e302165c 	movw	r1, #9820	; 0x265c
9001d3ec:	e3491002 	movt	r1, #36866	; 0x9002
9001d3f0:	e3020678 	movw	r0, #9848	; 0x2678
9001d3f4:	e3490002 	movt	r0, #36866	; 0x9002
9001d3f8:	ebffdfde 	bl	90015378 <KPrintf>
9001d3fc:	e3020688 	movw	r0, #9864	; 0x2688
9001d400:	e3490002 	movt	r0, #36866	; 0x9002
9001d404:	ebffd6cd 	bl	90012f40 <panic>
        for (int addr_offset = 0; addr_offset < ph.filesz; addr_offset += PAGE_SIZE) {
9001d408:	e3a03000 	mov	r3, #0
9001d40c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001d410:	ea00003c 	b	9001d508 <task_exec+0x338>
            uintptr_t page_paddr = xizi_pager.address_translate(&pgdir, ph.vaddr + addr_offset);
9001d414:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d418:	e3493002 	movt	r3, #36866	; 0x9002
9001d41c:	e5933014 	ldr	r3, [r3, #20]
9001d420:	e51b10a8 	ldr	r1, [fp, #-168]	; 0xffffff58
9001d424:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001d428:	e0811002 	add	r1, r1, r2
9001d42c:	e24b2090 	sub	r2, fp, #144	; 0x90
9001d430:	e1a00002 	mov	r0, r2
9001d434:	e12fff33 	blx	r3
9001d438:	e50b002c 	str	r0, [fp, #-44]	; 0xffffffd4
            if (page_paddr == 0) {
9001d43c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001d440:	e3530000 	cmp	r3, #0
9001d444:	1a000002 	bne	9001d454 <task_exec+0x284>
                panic("copy elf file to unmapped addr");
9001d448:	e302068c 	movw	r0, #9868	; 0x268c
9001d44c:	e3490002 	movt	r0, #36866	; 0x9002
9001d450:	ebffd6ba 	bl	90012f40 <panic>
            }
            uintptr_t read_size = (ph.filesz - addr_offset < PAGE_SIZE ? ph.filesz - addr_offset : PAGE_SIZE);
9001d454:	e51b20a0 	ldr	r2, [fp, #-160]	; 0xffffff60
9001d458:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d45c:	e0423003 	sub	r3, r2, r3
9001d460:	e3530a01 	cmp	r3, #4096	; 0x1000
9001d464:	31a03003 	movcc	r3, r3
9001d468:	23a03a01 	movcs	r3, #4096	; 0x1000
9001d46c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
            if (read_size != ipc_read(session, fd, P2V(page_paddr), ph.off + addr_offset, read_size)) {
9001d470:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001d474:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001d478:	e1a01003 	mov	r1, r3
9001d47c:	e51b20ac 	ldr	r2, [fp, #-172]	; 0xffffff54
9001d480:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d484:	e0823003 	add	r3, r2, r3
9001d488:	e1a02003 	mov	r2, r3
9001d48c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001d490:	e58d3000 	str	r3, [sp]
9001d494:	e51b4144 	ldr	r4, [fp, #-324]	; 0xfffffebc
9001d498:	e1a03002 	mov	r3, r2
9001d49c:	e1a02001 	mov	r2, r1
9001d4a0:	e51b1140 	ldr	r1, [fp, #-320]	; 0xfffffec0
9001d4a4:	e51b013c 	ldr	r0, [fp, #-316]	; 0xfffffec4
9001d4a8:	e12fff34 	blx	r4
9001d4ac:	e1a03000 	mov	r3, r0
9001d4b0:	e1a02003 	mov	r2, r3
9001d4b4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001d4b8:	e1520003 	cmp	r2, r3
9001d4bc:	0a00000e 	beq	9001d4fc <task_exec+0x32c>
                ERROR("read size error, off: %d, read len: %d\n", ph.off + addr_offset, read_size);
9001d4c0:	e3a02076 	mov	r2, #118	; 0x76
9001d4c4:	e3021784 	movw	r1, #10116	; 0x2784
9001d4c8:	e3491002 	movt	r1, #36866	; 0x9002
9001d4cc:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d4d0:	e3490002 	movt	r0, #36866	; 0x9002
9001d4d4:	ebffdfa7 	bl	90015378 <KPrintf>
9001d4d8:	e51b20ac 	ldr	r2, [fp, #-172]	; 0xffffff54
9001d4dc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d4e0:	e0823003 	add	r3, r2, r3
9001d4e4:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
9001d4e8:	e1a01003 	mov	r1, r3
9001d4ec:	e30206ac 	movw	r0, #9900	; 0x26ac
9001d4f0:	e3490002 	movt	r0, #36866	; 0x9002
9001d4f4:	ebffdf9f 	bl	90015378 <KPrintf>
                goto error_exec;
9001d4f8:	ea000115 	b	9001d954 <task_exec+0x784>
        for (int addr_offset = 0; addr_offset < ph.filesz; addr_offset += PAGE_SIZE) {
9001d4fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d500:	e2833a01 	add	r3, r3, #4096	; 0x1000
9001d504:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
9001d508:	e51b20a0 	ldr	r2, [fp, #-160]	; 0xffffff60
9001d50c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001d510:	e1520003 	cmp	r2, r3
9001d514:	8affffbe 	bhi	9001d414 <task_exec+0x244>
9001d518:	ea000000 	b	9001d520 <task_exec+0x350>
            continue;
9001d51c:	e320f000 	nop	{0}
    for (int sec_idx = 0, off = elf.phoff; sec_idx < elf.phnum; sec_idx++, off += sizeof(ph)) {
9001d520:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001d524:	e2833001 	add	r3, r3, #1
9001d528:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001d52c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001d530:	e2833020 	add	r3, r3, #32
9001d534:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
9001d538:	e15b36b0 	ldrh	r3, [fp, #-96]	; 0xffffffa0
9001d53c:	e1a02003 	mov	r2, r3
9001d540:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001d544:	e1520003 	cmp	r2, r3
9001d548:	caffff66 	bgt	9001d2e8 <task_exec+0x118>
        }
    }

    /// elf file content now in memory
    // alloc stack page and map to TOP of user vspace
    uintptr_t* stack_bottom = (uintptr_t*)kalloc(USER_STACK_SIZE);
9001d54c:	e3a00a01 	mov	r0, #4096	; 0x1000
9001d550:	ebffedc7 	bl	90018c74 <kalloc>
9001d554:	e50b0034 	str	r0, [fp, #-52]	; 0xffffffcc
    if (UNLIKELY(stack_bottom == NULL)) {
9001d558:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001d55c:	e3530000 	cmp	r3, #0
9001d560:	03a03001 	moveq	r3, #1
9001d564:	13a03000 	movne	r3, #0
9001d568:	e6ef3073 	uxtb	r3, r3
9001d56c:	e3530000 	cmp	r3, #0
9001d570:	0a000009 	beq	9001d59c <task_exec+0x3cc>
        ERROR("No memory.\n");
9001d574:	e3a02080 	mov	r2, #128	; 0x80
9001d578:	e3021784 	movw	r1, #10116	; 0x2784
9001d57c:	e3491002 	movt	r1, #36866	; 0x9002
9001d580:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d584:	e3490002 	movt	r0, #36866	; 0x9002
9001d588:	ebffdf7a 	bl	90015378 <KPrintf>
9001d58c:	e30206d4 	movw	r0, #9940	; 0x26d4
9001d590:	e3490002 	movt	r0, #36866	; 0x9002
9001d594:	ebffdf77 	bl	90015378 <KPrintf>
        goto error_exec;
9001d598:	ea0000ed 	b	9001d954 <task_exec+0x784>
    }
    if (!xizi_pager.map_pages(pgdir.pd_addr, USER_MEM_TOP - USER_STACK_SIZE, V2P(stack_bottom), USER_STACK_SIZE, false)) {
9001d59c:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d5a0:	e3493002 	movt	r3, #36866	; 0x9002
9001d5a4:	e5934008 	ldr	r4, [r3, #8]
9001d5a8:	e51b0090 	ldr	r0, [fp, #-144]	; 0xffffff70
9001d5ac:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001d5b0:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
9001d5b4:	e3a03000 	mov	r3, #0
9001d5b8:	e58d3000 	str	r3, [sp]
9001d5bc:	e3a03a01 	mov	r3, #4096	; 0x1000
9001d5c0:	e3a01a0f 	mov	r1, #61440	; 0xf000
9001d5c4:	e3471fff 	movt	r1, #32767	; 0x7fff
9001d5c8:	e12fff34 	blx	r4
9001d5cc:	e1a03000 	mov	r3, r0
9001d5d0:	e2233001 	eor	r3, r3, #1
9001d5d4:	e6ef3073 	uxtb	r3, r3
9001d5d8:	e3530000 	cmp	r3, #0
9001d5dc:	0a00000b 	beq	9001d610 <task_exec+0x440>
        ERROR("User stack map failed\n");
9001d5e0:	e3a02084 	mov	r2, #132	; 0x84
9001d5e4:	e3021784 	movw	r1, #10116	; 0x2784
9001d5e8:	e3491002 	movt	r1, #36866	; 0x9002
9001d5ec:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d5f0:	e3490002 	movt	r0, #36866	; 0x9002
9001d5f4:	ebffdf5f 	bl	90015378 <KPrintf>
9001d5f8:	e30206e0 	movw	r0, #9952	; 0x26e0
9001d5fc:	e3490002 	movt	r0, #36866	; 0x9002
9001d600:	ebffdf5c 	bl	90015378 <KPrintf>
        kfree((char*)stack_bottom);
9001d604:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
9001d608:	ebffedbf 	bl	90018d0c <kfree>
        goto error_exec;
9001d60c:	ea0000d0 	b	9001d954 <task_exec+0x784>
    }

    uintptr_t user_vspace_sp = USER_MEM_TOP;
9001d610:	e3a03102 	mov	r3, #-2147483648	; 0x80000000
9001d614:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    /// @todo change 32 to some macro
    uintptr_t user_stack_init[32];
    uintptr_t argc = 0;
9001d618:	e3a03000 	mov	r3, #0
9001d61c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uintptr_t copy_len = 0;
9001d620:	e3a03000 	mov	r3, #0
9001d624:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
9001d628:	e3a03000 	mov	r3, #0
9001d62c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001d630:	ea000037 	b	9001d714 <task_exec+0x544>
        /// @todo handle with large number of parameters (more than 32)

        // copy param to user stack
        copy_len = strlen(argv[argc]) + 1;
9001d634:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d638:	e1a03103 	lsl	r3, r3, #2
9001d63c:	e59b2008 	ldr	r2, [fp, #8]
9001d640:	e0823003 	add	r3, r2, r3
9001d644:	e5933000 	ldr	r3, [r3]
9001d648:	e1a00003 	mov	r0, r3
9001d64c:	fa000cf1 	blx	90020a18 <strlen>
9001d650:	e1a03000 	mov	r3, r0
9001d654:	e2833001 	add	r3, r3, #1
9001d658:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
        user_vspace_sp = (user_vspace_sp - copy_len) & ~3;
9001d65c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001d660:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d664:	e0423003 	sub	r3, r2, r3
9001d668:	e3c33003 	bic	r3, r3, #3
9001d66c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)argv[argc], copy_len);
9001d670:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d674:	e3493002 	movt	r3, #36866	; 0x9002
9001d678:	e5934018 	ldr	r4, [r3, #24]
9001d67c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d680:	e1a03103 	lsl	r3, r3, #2
9001d684:	e59b2008 	ldr	r2, [fp, #8]
9001d688:	e0823003 	add	r3, r2, r3
9001d68c:	e5933000 	ldr	r3, [r3]
9001d690:	e1a02003 	mov	r2, r3
9001d694:	e24b0090 	sub	r0, fp, #144	; 0x90
9001d698:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d69c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001d6a0:	e12fff34 	blx	r4
9001d6a4:	e50b003c 	str	r0, [fp, #-60]	; 0xffffffc4
        if (UNLIKELY(copied_len != copy_len)) {
9001d6a8:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
9001d6ac:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d6b0:	e1520003 	cmp	r2, r3
9001d6b4:	13a03001 	movne	r3, #1
9001d6b8:	03a03000 	moveq	r3, #0
9001d6bc:	e6ef3073 	uxtb	r3, r3
9001d6c0:	e3530000 	cmp	r3, #0
9001d6c4:	0a000009 	beq	9001d6f0 <task_exec+0x520>
            ERROR("Something went wrong when copying params.\n");
9001d6c8:	e3a02096 	mov	r2, #150	; 0x96
9001d6cc:	e3021784 	movw	r1, #10116	; 0x2784
9001d6d0:	e3491002 	movt	r1, #36866	; 0x9002
9001d6d4:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d6d8:	e3490002 	movt	r0, #36866	; 0x9002
9001d6dc:	ebffdf25 	bl	90015378 <KPrintf>
9001d6e0:	e30206f8 	movw	r0, #9976	; 0x26f8
9001d6e4:	e3490002 	movt	r0, #36866	; 0x9002
9001d6e8:	ebffdf22 	bl	90015378 <KPrintf>
            goto error_exec;
9001d6ec:	ea000098 	b	9001d954 <task_exec+0x784>
        }
        user_stack_init[argc] = user_vspace_sp;
9001d6f0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d6f4:	e1a03103 	lsl	r3, r3, #2
9001d6f8:	e24b200c 	sub	r2, fp, #12
9001d6fc:	e0823003 	add	r3, r2, r3
9001d700:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001d704:	e5032124 	str	r2, [r3, #-292]	; 0xfffffedc
    for (argc = 0; argv != NULL && argv[argc] != NULL; argc++) {
9001d708:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d70c:	e2833001 	add	r3, r3, #1
9001d710:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9001d714:	e59b3008 	ldr	r3, [fp, #8]
9001d718:	e3530000 	cmp	r3, #0
9001d71c:	0a000006 	beq	9001d73c <task_exec+0x56c>
9001d720:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d724:	e1a03103 	lsl	r3, r3, #2
9001d728:	e59b2008 	ldr	r2, [fp, #8]
9001d72c:	e0823003 	add	r3, r2, r3
9001d730:	e5933000 	ldr	r3, [r3]
9001d734:	e3530000 	cmp	r3, #0
9001d738:	1affffbd 	bne	9001d634 <task_exec+0x464>
    }
    user_stack_init[argc] = 0;
9001d73c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d740:	e1a03103 	lsl	r3, r3, #2
9001d744:	e24b200c 	sub	r2, fp, #12
9001d748:	e0823003 	add	r3, r2, r3
9001d74c:	e3a02000 	mov	r2, #0
9001d750:	e5032124 	str	r2, [r3, #-292]	; 0xfffffedc
    copy_len = (argc + 1) * sizeof(uintptr_t);
9001d754:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d758:	e2833001 	add	r3, r3, #1
9001d75c:	e1a03103 	lsl	r3, r3, #2
9001d760:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    user_vspace_sp -= copy_len;
9001d764:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001d768:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d76c:	e0423003 	sub	r3, r2, r3
9001d770:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    uintptr_t copied_len = xizi_pager.cross_vspace_data_copy(&pgdir, user_vspace_sp, (uintptr_t)user_stack_init, copy_len);
9001d774:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d778:	e3493002 	movt	r3, #36866	; 0x9002
9001d77c:	e5934018 	ldr	r4, [r3, #24]
9001d780:	e24b2e13 	sub	r2, fp, #304	; 0x130
9001d784:	e24b0090 	sub	r0, fp, #144	; 0x90
9001d788:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d78c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001d790:	e12fff34 	blx	r4
9001d794:	e50b0040 	str	r0, [fp, #-64]	; 0xffffffc0
    if (UNLIKELY(copied_len != copy_len)) {
9001d798:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
9001d79c:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001d7a0:	e1520003 	cmp	r2, r3
9001d7a4:	13a03001 	movne	r3, #1
9001d7a8:	03a03000 	moveq	r3, #0
9001d7ac:	e6ef3073 	uxtb	r3, r3
9001d7b0:	e3530000 	cmp	r3, #0
9001d7b4:	0a000009 	beq	9001d7e0 <task_exec+0x610>
        ERROR("Something went wrong when copying params.\n");
9001d7b8:	e3a020a0 	mov	r2, #160	; 0xa0
9001d7bc:	e3021784 	movw	r1, #10116	; 0x2784
9001d7c0:	e3491002 	movt	r1, #36866	; 0x9002
9001d7c4:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d7c8:	e3490002 	movt	r0, #36866	; 0x9002
9001d7cc:	ebffdee9 	bl	90015378 <KPrintf>
9001d7d0:	e30206f8 	movw	r0, #9976	; 0x26f8
9001d7d4:	e3490002 	movt	r0, #36866	; 0x9002
9001d7d8:	ebffdee6 	bl	90015378 <KPrintf>
        goto error_exec;
9001d7dc:	ea00005c 	b	9001d954 <task_exec+0x784>
    }

    // init task trapframe, which stores in svc stack
    // do not go tp error_exec once we change trapframe!
    assert(copied_len == (argc + 1) * sizeof(uintptr_t));
9001d7e0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d7e4:	e2833001 	add	r3, r3, #1
9001d7e8:	e1a02103 	lsl	r2, r3, #2
9001d7ec:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
9001d7f0:	e1520003 	cmp	r2, r3
9001d7f4:	0a00000d 	beq	9001d830 <task_exec+0x660>
9001d7f8:	e3a020a6 	mov	r2, #166	; 0xa6
9001d7fc:	e3021784 	movw	r1, #10116	; 0x2784
9001d800:	e3491002 	movt	r1, #36866	; 0x9002
9001d804:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d808:	e3490002 	movt	r0, #36866	; 0x9002
9001d80c:	ebffded9 	bl	90015378 <KPrintf>
9001d810:	e3021724 	movw	r1, #10020	; 0x2724
9001d814:	e3491002 	movt	r1, #36866	; 0x9002
9001d818:	e3020678 	movw	r0, #9848	; 0x2678
9001d81c:	e3490002 	movt	r0, #36866	; 0x9002
9001d820:	ebffded4 	bl	90015378 <KPrintf>
9001d824:	e3020688 	movw	r0, #9864	; 0x2688
9001d828:	e3490002 	movt	r0, #36866	; 0x9002
9001d82c:	ebffd5c3 	bl	90012f40 <panic>
    arch_trapframe_set_sp_pc(task->main_thread.trapframe, user_vspace_sp, elf.entry);
9001d830:	e51b3138 	ldr	r3, [fp, #-312]	; 0xfffffec8
9001d834:	e5932078 	ldr	r2, [r3, #120]	; 0x78
9001d838:	e51b3074 	ldr	r3, [fp, #-116]	; 0xffffff8c
9001d83c:	e50b2050 	str	r2, [fp, #-80]	; 0xffffffb0
9001d840:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001d844:	e50b2054 	str	r2, [fp, #-84]	; 0xffffffac
9001d848:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    tf->sp_usr = sp;
9001d84c:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001d850:	e51b2054 	ldr	r2, [fp, #-84]	; 0xffffffac
9001d854:	e5832000 	str	r2, [r3]
    tf->pc = pc;
9001d858:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001d85c:	e51b2058 	ldr	r2, [fp, #-88]	; 0xffffffa8
9001d860:	e5832044 	str	r2, [r3, #68]	; 0x44
    arch_set_main_params(task->main_thread.trapframe, argc, user_vspace_sp);
9001d864:	e51b3138 	ldr	r3, [fp, #-312]	; 0xfffffec8
9001d868:	e5932078 	ldr	r2, [r3, #120]	; 0x78
9001d86c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001d870:	e50b2044 	str	r2, [fp, #-68]	; 0xffffffbc
9001d874:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
9001d878:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001d87c:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    tf->r0 = (uint32_t)argc;
9001d880:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
9001d884:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
9001d888:	e5832010 	str	r2, [r3, #16]
    tf->r1 = (uint32_t)argv;
9001d88c:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
9001d890:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
9001d894:	e5832014 	str	r2, [r3, #20]

    // save program name
    char* last = NULL;
9001d898:	e3a03000 	mov	r3, #0
9001d89c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    for (last = name; *name; name++) {
9001d8a0:	e59b3004 	ldr	r3, [fp, #4]
9001d8a4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
9001d8a8:	ea000009 	b	9001d8d4 <task_exec+0x704>
        if (*name == '/') {
9001d8ac:	e59b3004 	ldr	r3, [fp, #4]
9001d8b0:	e5d33000 	ldrb	r3, [r3]
9001d8b4:	e353002f 	cmp	r3, #47	; 0x2f
9001d8b8:	1a000002 	bne	9001d8c8 <task_exec+0x6f8>
            last = name + 1;
9001d8bc:	e59b3004 	ldr	r3, [fp, #4]
9001d8c0:	e2833001 	add	r3, r3, #1
9001d8c4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    for (last = name; *name; name++) {
9001d8c8:	e59b3004 	ldr	r3, [fp, #4]
9001d8cc:	e2833001 	add	r3, r3, #1
9001d8d0:	e58b3004 	str	r3, [fp, #4]
9001d8d4:	e59b3004 	ldr	r3, [fp, #4]
9001d8d8:	e5d33000 	ldrb	r3, [r3]
9001d8dc:	e3530000 	cmp	r3, #0
9001d8e0:	1afffff1 	bne	9001d8ac <task_exec+0x6dc>
        }
    }
    strncpy(task->name, last, sizeof(task->name));
9001d8e4:	e51b3138 	ldr	r3, [fp, #-312]	; 0xfffffec8
9001d8e8:	e2833094 	add	r3, r3, #148	; 0x94
9001d8ec:	e3a02010 	mov	r2, #16
9001d8f0:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
9001d8f4:	e1a00003 	mov	r0, r3
9001d8f8:	fa000c84 	blx	90020b10 <strncpy>

    struct TopLevelPageDirectory old_pgdir = task->pgdir;
9001d8fc:	e51b3138 	ldr	r3, [fp, #-312]	; 0xfffffec8
9001d900:	e5933050 	ldr	r3, [r3, #80]	; 0x50
9001d904:	e50b3134 	str	r3, [fp, #-308]	; 0xfffffecc
    task->pgdir = pgdir;
9001d908:	e51b3138 	ldr	r3, [fp, #-312]	; 0xfffffec8
9001d90c:	e51b2090 	ldr	r2, [fp, #-144]	; 0xffffff70
9001d910:	e5832050 	str	r2, [r3, #80]	; 0x50

    /// @todo record mem size used b task
    task->mem_size = ALIGNUP(load_size, PAGE_SIZE);
9001d914:	e51b3010 	ldr	r3, [fp, #-16]
9001d918:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001d91c:	e283300f 	add	r3, r3, #15
9001d920:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
9001d924:	e3c3300f 	bic	r3, r3, #15
9001d928:	e51b2138 	ldr	r2, [fp, #-312]	; 0xfffffec8
9001d92c:	e5823090 	str	r3, [r2, #144]	; 0x90

    xizi_pager.free_user_pgdir(&old_pgdir);
9001d930:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d934:	e3493002 	movt	r3, #36866	; 0x9002
9001d938:	e5933004 	ldr	r3, [r3, #4]
9001d93c:	e24b2f4d 	sub	r2, fp, #308	; 0x134
9001d940:	e1a00002 	mov	r0, r2
9001d944:	e12fff33 	blx	r3
    return 0;
9001d948:	e3a03000 	mov	r3, #0
9001d94c:	ea000013 	b	9001d9a0 <task_exec+0x7d0>
            goto error_exec;
9001d950:	e320f000 	nop	{0}

error_exec:
    if (pgdir.pd_addr != NULL) {
9001d954:	e51b3090 	ldr	r3, [fp, #-144]	; 0xffffff70
9001d958:	e3530000 	cmp	r3, #0
9001d95c:	0a000005 	beq	9001d978 <task_exec+0x7a8>
        xizi_pager.free_user_pgdir(&pgdir);
9001d960:	e30333ac 	movw	r3, #13228	; 0x33ac
9001d964:	e3493002 	movt	r3, #36866	; 0x9002
9001d968:	e5933004 	ldr	r3, [r3, #4]
9001d96c:	e24b2090 	sub	r2, fp, #144	; 0x90
9001d970:	e1a00002 	mov	r0, r2
9001d974:	e12fff33 	blx	r3
    }
    ERROR("task create error\n");
9001d978:	e3a020c0 	mov	r2, #192	; 0xc0
9001d97c:	e3021784 	movw	r1, #10116	; 0x2784
9001d980:	e3491002 	movt	r1, #36866	; 0x9002
9001d984:	e30205d8 	movw	r0, #9688	; 0x25d8
9001d988:	e3490002 	movt	r0, #36866	; 0x9002
9001d98c:	ebffde79 	bl	90015378 <KPrintf>
9001d990:	e3020754 	movw	r0, #10068	; 0x2754
9001d994:	e3490002 	movt	r0, #36866	; 0x9002
9001d998:	ebffde76 	bl	90015378 <KPrintf>
    return -1;
9001d99c:	e3e03000 	mvn	r3, #0
}
9001d9a0:	e1a00003 	mov	r0, r3
9001d9a4:	e24bd008 	sub	sp, fp, #8
9001d9a8:	e8bd8810 	pop	{r4, fp, pc}

9001d9ac <sys_exec>:

int sys_exec(struct KernReadTool* read_tool, char* name, char** argv)
{
9001d9ac:	e92d4800 	push	{fp, lr}
9001d9b0:	e28db004 	add	fp, sp, #4
9001d9b4:	e24dd030 	sub	sp, sp, #48	; 0x30
9001d9b8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001d9bc:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001d9c0:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    /// @todo find a source of mmu_driver_tag instead of requiring from root
    static struct TraceTag mmu_driver_tag;
    static bool init = false;
    if (UNLIKELY(!init)) {
9001d9c4:	e30435a0 	movw	r3, #17824	; 0x45a0
9001d9c8:	e349309a 	movt	r3, #37018	; 0x909a
9001d9cc:	e5d33000 	ldrb	r3, [r3]
9001d9d0:	e2233001 	eor	r3, r3, #1
9001d9d4:	e6ef3073 	uxtb	r3, r3
9001d9d8:	e3530000 	cmp	r3, #0
9001d9dc:	0a00000b 	beq	9001da10 <sys_exec+0x64>
        AchieveResourceTag(&mmu_driver_tag, RequireRootTag(), "hardkernel/mmu-ac-resource");
9001d9e0:	ebffe4a2 	bl	90016c70 <RequireRootTag>
9001d9e4:	e1a03000 	mov	r3, r0
9001d9e8:	e3022768 	movw	r2, #10088	; 0x2768
9001d9ec:	e3492002 	movt	r2, #36866	; 0x9002
9001d9f0:	e1a01003 	mov	r1, r3
9001d9f4:	e30405a4 	movw	r0, #17828	; 0x45a4
9001d9f8:	e349009a 	movt	r0, #37018	; 0x909a
9001d9fc:	ebffe9a3 	bl	90018090 <AchieveResourceTag>
        init = true;
9001da00:	e30435a0 	movw	r3, #17824	; 0x45a0
9001da04:	e349309a 	movt	r3, #37018	; 0x909a
9001da08:	e3a02001 	mov	r2, #1
9001da0c:	e5c32000 	strb	r2, [r3]
    }

    struct MmuCommonDone* p_mmu_driver = AchieveResource(&mmu_driver_tag);
9001da10:	e30405a4 	movw	r0, #17828	; 0x45a4
9001da14:	e349009a 	movt	r0, #37018	; 0x909a
9001da18:	ebffe9af 	bl	900180dc <AchieveResource>
9001da1c:	e50b0008 	str	r0, [fp, #-8]

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001da20:	ebfffddd 	bl	9001d19c <cur_cpu>
9001da24:	e1a03000 	mov	r3, r0
9001da28:	e5933004 	ldr	r3, [r3, #4]
9001da2c:	e50b300c 	str	r3, [fp, #-12]
    struct Session* session = read_tool->session;
9001da30:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001da34:	e5933000 	ldr	r3, [r3]
9001da38:	e50b3010 	str	r3, [fp, #-16]
    int fd = read_tool->fd;
9001da3c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001da40:	e5933004 	ldr	r3, [r3, #4]
9001da44:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ipc_read_fn ipc_read = read_tool->ipc_read;
9001da48:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001da4c:	e5933008 	ldr	r3, [r3, #8]
9001da50:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    int ret = task_exec(current_task, session, fd, ipc_read, name, argv);
9001da54:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001da58:	e58d3004 	str	r3, [sp, #4]
9001da5c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001da60:	e58d3000 	str	r3, [sp]
9001da64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001da68:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001da6c:	e51b1010 	ldr	r1, [fp, #-16]
9001da70:	e51b000c 	ldr	r0, [fp, #-12]
9001da74:	ebfffdd5 	bl	9001d1d0 <task_exec>
9001da78:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (ret >= 0) {
9001da7c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001da80:	e3530000 	cmp	r3, #0
9001da84:	ba00000f 	blt	9001dac8 <sys_exec+0x11c>
        spinlock_init(&current_task->lock, current_task->name);
9001da88:	e51b300c 	ldr	r3, [fp, #-12]
9001da8c:	e2832020 	add	r2, r3, #32
9001da90:	e51b300c 	ldr	r3, [fp, #-12]
9001da94:	e2833094 	add	r3, r3, #148	; 0x94
9001da98:	e1a01003 	mov	r1, r3
9001da9c:	e1a00002 	mov	r0, r2
9001daa0:	ebffd8a6 	bl	90013d40 <spinlock_init>
        p_mmu_driver->LoadPgdir((uintptr_t)V2P(current_task->pgdir.pd_addr));
9001daa4:	e51b3008 	ldr	r3, [fp, #-8]
9001daa8:	e5933018 	ldr	r3, [r3, #24]
9001daac:	e51b200c 	ldr	r2, [fp, #-12]
9001dab0:	e5922050 	ldr	r2, [r2, #80]	; 0x50
9001dab4:	e2822102 	add	r2, r2, #-2147483648	; 0x80000000
9001dab8:	e1a00002 	mov	r0, r2
9001dabc:	e12fff33 	blx	r3
        return ret;
9001dac0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dac4:	ea000000 	b	9001dacc <sys_exec+0x120>
    }
    return -1;
9001dac8:	e3e03000 	mvn	r3, #0
9001dacc:	e1a00003 	mov	r0, r3
9001dad0:	e24bd004 	sub	sp, fp, #4
9001dad4:	e8bd8800 	pop	{fp, pc}

9001dad8 <sys_yield>:
#include "task.h"

#include "log.h"

int sys_yield()
{
9001dad8:	e92d4800 	push	{fp, lr}
9001dadc:	e28db004 	add	fp, sp, #4
    xizi_task_manager.cur_task_yield_noschedule();
9001dae0:	e30333e0 	movw	r3, #13280	; 0x33e0
9001dae4:	e3493002 	movt	r3, #36866	; 0x9002
9001dae8:	e5933170 	ldr	r3, [r3, #368]	; 0x170
9001daec:	e12fff33 	blx	r3
    return 0;
9001daf0:	e3a03000 	mov	r3, #0
9001daf4:	e1a00003 	mov	r0, r3
9001daf8:	e8bd8800 	pop	{fp, pc}

9001dafc <cur_cpuid>:
{
9001dafc:	e92d4800 	push	{fp, lr}
9001db00:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001db04:	ebffcd89 	bl	90011130 <cpu_get_current>
9001db08:	e1a03000 	mov	r3, r0
}
9001db0c:	e1a00003 	mov	r0, r3
9001db10:	e8bd8800 	pop	{fp, pc}

9001db14 <cur_cpu>:
{
9001db14:	e92d4800 	push	{fp, lr}
9001db18:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001db1c:	ebfffff6 	bl	9001dafc <cur_cpuid>
9001db20:	e1a02000 	mov	r2, r0
9001db24:	e1a03002 	mov	r3, r2
9001db28:	e1a03083 	lsl	r3, r3, #1
9001db2c:	e0833002 	add	r3, r3, r2
9001db30:	e1a03103 	lsl	r3, r3, #2
9001db34:	e304256c 	movw	r2, #17772	; 0x456c
9001db38:	e349209a 	movt	r2, #37018	; 0x909a
9001db3c:	e0833002 	add	r3, r3, r2
9001db40:	e1a00003 	mov	r0, r3
9001db44:	e8bd8800 	pop	{fp, pc}

9001db48 <sys_register_as_server>:
#include "task.h"

#define SERVER_DIR_NAME_SIZE 14

int sys_register_as_server(char* name)
{
9001db48:	e92d4800 	push	{fp, lr}
9001db4c:	e28db004 	add	fp, sp, #4
9001db50:	e24dd020 	sub	sp, sp, #32
9001db54:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    struct TaskMicroDescriptor* server = cur_cpu()->task;
9001db58:	ebffffed 	bl	9001db14 <cur_cpu>
9001db5c:	e1a03000 	mov	r3, r0
9001db60:	e5933004 	ldr	r3, [r3, #4]
9001db64:	e50b3008 	str	r3, [fp, #-8]
    struct TraceTag server_identifier_set_tag;
    if (!AchieveResourceTag(&server_identifier_set_tag, RequireRootTag(), "softkernel/server-identifier")) {
9001db68:	ebffe440 	bl	90016c70 <RequireRootTag>
9001db6c:	e1a01000 	mov	r1, r0
9001db70:	e24b3010 	sub	r3, fp, #16
9001db74:	e3022790 	movw	r2, #10128	; 0x2790
9001db78:	e3492002 	movt	r2, #36866	; 0x9002
9001db7c:	e1a00003 	mov	r0, r3
9001db80:	ebffe942 	bl	90018090 <AchieveResourceTag>
9001db84:	e1a03000 	mov	r3, r0
9001db88:	e2233001 	eor	r3, r3, #1
9001db8c:	e6ef3073 	uxtb	r3, r3
9001db90:	e3530000 	cmp	r3, #0
9001db94:	0a000002 	beq	9001dba4 <sys_register_as_server+0x5c>
        panic("Server identifier not initialized.\b");
9001db98:	e30207b0 	movw	r0, #10160	; 0x27b0
9001db9c:	e3490002 	movt	r0, #36866	; 0x9002
9001dba0:	ebffd4e6 	bl	90012f40 <panic>
    }
    assert(server_identifier_set_tag.meta != NULL || server_identifier_set_tag.type == TRACER_OWNER);
9001dba4:	e51b3010 	ldr	r3, [fp, #-16]
9001dba8:	e3530000 	cmp	r3, #0
9001dbac:	1a000010 	bne	9001dbf4 <sys_register_as_server+0xac>
9001dbb0:	e15b30fc 	ldrsh	r3, [fp, #-12]
9001dbb4:	e3530001 	cmp	r3, #1
9001dbb8:	0a00000d 	beq	9001dbf4 <sys_register_as_server+0xac>
9001dbbc:	e3a0202f 	mov	r2, #47	; 0x2f
9001dbc0:	e3021854 	movw	r1, #10324	; 0x2854
9001dbc4:	e3491002 	movt	r1, #36866	; 0x9002
9001dbc8:	e30207d4 	movw	r0, #10196	; 0x27d4
9001dbcc:	e3490002 	movt	r0, #36866	; 0x9002
9001dbd0:	ebffdde8 	bl	90015378 <KPrintf>
9001dbd4:	e30217e4 	movw	r1, #10212	; 0x27e4
9001dbd8:	e3491002 	movt	r1, #36866	; 0x9002
9001dbdc:	e3020840 	movw	r0, #10304	; 0x2840
9001dbe0:	e3490002 	movt	r0, #36866	; 0x9002
9001dbe4:	ebffdde3 	bl	90015378 <KPrintf>
9001dbe8:	e3020850 	movw	r0, #10320	; 0x2850
9001dbec:	e3490002 	movt	r0, #36866	; 0x9002
9001dbf0:	ebffd4d2 	bl	90012f40 <panic>

    if (!CreateResourceTag(&server->server_identifier, &server_identifier_set_tag, name, TRACER_SERVER_IDENTITY_AC_RESOURCE, server)) {
9001dbf4:	e51b3008 	ldr	r3, [fp, #-8]
9001dbf8:	e2830064 	add	r0, r3, #100	; 0x64
9001dbfc:	e24b1010 	sub	r1, fp, #16
9001dc00:	e51b3008 	ldr	r3, [fp, #-8]
9001dc04:	e58d3000 	str	r3, [sp]
9001dc08:	e3a03004 	mov	r3, #4
9001dc0c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001dc10:	ebffe957 	bl	90018174 <CreateResourceTag>
9001dc14:	e1a03000 	mov	r3, r0
9001dc18:	e2233001 	eor	r3, r3, #1
9001dc1c:	e6ef3073 	uxtb	r3, r3
9001dc20:	e3530000 	cmp	r3, #0
9001dc24:	0a000001 	beq	9001dc30 <sys_register_as_server+0xe8>
        return -1;
9001dc28:	e3e03000 	mvn	r3, #0
9001dc2c:	ea000000 	b	9001dc34 <sys_register_as_server+0xec>
    }

    return 0;
9001dc30:	e3a03000 	mov	r3, #0
}
9001dc34:	e1a00003 	mov	r0, r3
9001dc38:	e24bd004 	sub	sp, fp, #4
9001dc3c:	e8bd8800 	pop	{fp, pc}

9001dc40 <cur_cpuid>:
{
9001dc40:	e92d4800 	push	{fp, lr}
9001dc44:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001dc48:	ebffcd38 	bl	90011130 <cpu_get_current>
9001dc4c:	e1a03000 	mov	r3, r0
}
9001dc50:	e1a00003 	mov	r0, r3
9001dc54:	e8bd8800 	pop	{fp, pc}

9001dc58 <cur_cpu>:
{
9001dc58:	e92d4800 	push	{fp, lr}
9001dc5c:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001dc60:	ebfffff6 	bl	9001dc40 <cur_cpuid>
9001dc64:	e1a02000 	mov	r2, r0
9001dc68:	e1a03002 	mov	r3, r2
9001dc6c:	e1a03083 	lsl	r3, r3, #1
9001dc70:	e0833002 	add	r3, r3, r2
9001dc74:	e1a03103 	lsl	r3, r3, #2
9001dc78:	e304256c 	movw	r2, #17772	; 0x456c
9001dc7c:	e349209a 	movt	r2, #37018	; 0x909a
9001dc80:	e0833002 	add	r3, r3, r2
9001dc84:	e1a00003 	mov	r0, r3
9001dc88:	e8bd8800 	pop	{fp, pc}

9001dc8c <create_session_inner>:
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int create_session_inner(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, int capacity, struct Session* user_session)
{
9001dc8c:	e92d4800 	push	{fp, lr}
9001dc90:	e28db004 	add	fp, sp, #4
9001dc94:	e24dd018 	sub	sp, sp, #24
9001dc98:	e50b0010 	str	r0, [fp, #-16]
9001dc9c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001dca0:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9001dca4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    // create share pages
    struct session_backend* session_backend = xizi_share_page_manager.create_share_pages(client, server, capacity);
9001dca8:	e3033564 	movw	r3, #13668	; 0x3564
9001dcac:	e3493002 	movt	r3, #36866	; 0x9002
9001dcb0:	e5933000 	ldr	r3, [r3]
9001dcb4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001dcb8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001dcbc:	e51b0010 	ldr	r0, [fp, #-16]
9001dcc0:	e12fff33 	blx	r3
9001dcc4:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(session_backend == NULL)) {
9001dcc8:	e51b3008 	ldr	r3, [fp, #-8]
9001dccc:	e3530000 	cmp	r3, #0
9001dcd0:	03a03001 	moveq	r3, #1
9001dcd4:	13a03000 	movne	r3, #0
9001dcd8:	e6ef3073 	uxtb	r3, r3
9001dcdc:	e3530000 	cmp	r3, #0
9001dce0:	0a000009 	beq	9001dd0c <create_session_inner+0x80>
        DEBUG("create_share_pages failed\n");
9001dce4:	e3021978 	movw	r1, #10616	; 0x2978
9001dce8:	e3491002 	movt	r1, #36866	; 0x9002
9001dcec:	e302086c 	movw	r0, #10348	; 0x286c
9001dcf0:	e3490002 	movt	r0, #36866	; 0x9002
9001dcf4:	ebffdd9f 	bl	90015378 <KPrintf>
9001dcf8:	e302087c 	movw	r0, #10364	; 0x287c
9001dcfc:	e3490002 	movt	r0, #36866	; 0x9002
9001dd00:	ebffdd9c 	bl	90015378 <KPrintf>
        return -1;
9001dd04:	e3e03000 	mvn	r3, #0
9001dd08:	ea000013 	b	9001dd5c <create_session_inner+0xd0>
    }

    // init user_session
    user_session->buf = (void*)session_backend->client_side.buf_addr;
9001dd0c:	e51b3008 	ldr	r3, [fp, #-8]
9001dd10:	e5933024 	ldr	r3, [r3, #36]	; 0x24
9001dd14:	e1a02003 	mov	r2, r3
9001dd18:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dd1c:	e5832010 	str	r2, [r3, #16]
    user_session->capacity = session_backend->client_side.capacity;
9001dd20:	e51b3008 	ldr	r3, [fp, #-8]
9001dd24:	e5932028 	ldr	r2, [r3, #40]	; 0x28
9001dd28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dd2c:	e5832004 	str	r2, [r3, #4]
    user_session->head = 0;
9001dd30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dd34:	e3a02000 	mov	r2, #0
9001dd38:	e5832008 	str	r2, [r3, #8]
    user_session->tail = 0;
9001dd3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dd40:	e3a02000 	mov	r2, #0
9001dd44:	e583200c 	str	r2, [r3, #12]
    user_session->id = session_backend->session_id;
9001dd48:	e51b3008 	ldr	r3, [fp, #-8]
9001dd4c:	e5932030 	ldr	r2, [r3, #48]	; 0x30
9001dd50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001dd54:	e5832000 	str	r2, [r3]

    return 0;
9001dd58:	e3a03000 	mov	r3, #0
}
9001dd5c:	e1a00003 	mov	r0, r3
9001dd60:	e24bd004 	sub	sp, fp, #4
9001dd64:	e8bd8800 	pop	{fp, pc}

9001dd68 <sys_connect_session>:

int sys_connect_session(char* path, int capacity, struct Session* user_session)
{
9001dd68:	e92d4800 	push	{fp, lr}
9001dd6c:	e28db004 	add	fp, sp, #4
9001dd70:	e24dd028 	sub	sp, sp, #40	; 0x28
9001dd74:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001dd78:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001dd7c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    if (capacity <= 0) {
9001dd80:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001dd84:	e3530000 	cmp	r3, #0
9001dd88:	ca000001 	bgt	9001dd94 <sys_connect_session+0x2c>
        return -1;
9001dd8c:	e3e03000 	mvn	r3, #0
9001dd90:	ea000057 	b	9001def4 <sys_connect_session+0x18c>
    }

    struct TaskMicroDescriptor* client = cur_cpu()->task;
9001dd94:	ebffffaf 	bl	9001dc58 <cur_cpu>
9001dd98:	e1a03000 	mov	r3, r0
9001dd9c:	e5933004 	ldr	r3, [r3, #4]
9001dda0:	e50b3008 	str	r3, [fp, #-8]
    /// get server
    struct TraceTag server_identifier_owner;
    if (!AchieveResourceTag(&server_identifier_owner, RequireRootTag(), "softkernel/server-identifier")) {
9001dda4:	ebffe3b1 	bl	90016c70 <RequireRootTag>
9001dda8:	e1a01000 	mov	r1, r0
9001ddac:	e24b3014 	sub	r3, fp, #20
9001ddb0:	e3022898 	movw	r2, #10392	; 0x2898
9001ddb4:	e3492002 	movt	r2, #36866	; 0x9002
9001ddb8:	e1a00003 	mov	r0, r3
9001ddbc:	ebffe8b3 	bl	90018090 <AchieveResourceTag>
9001ddc0:	e1a03000 	mov	r3, r0
9001ddc4:	e2233001 	eor	r3, r3, #1
9001ddc8:	e6ef3073 	uxtb	r3, r3
9001ddcc:	e3530000 	cmp	r3, #0
9001ddd0:	0a000002 	beq	9001dde0 <sys_connect_session+0x78>
        panic("Server identifier not initialized.\b");
9001ddd4:	e30208b8 	movw	r0, #10424	; 0x28b8
9001ddd8:	e3490002 	movt	r0, #36866	; 0x9002
9001dddc:	ebffd457 	bl	90012f40 <panic>
    }
    assert(server_identifier_owner.meta != NULL || server_identifier_owner.type == TRACER_OWNER);
9001dde0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001dde4:	e3530000 	cmp	r3, #0
9001dde8:	1a000010 	bne	9001de30 <sys_connect_session+0xc8>
9001ddec:	e15b31f0 	ldrsh	r3, [fp, #-16]
9001ddf0:	e3530001 	cmp	r3, #1
9001ddf4:	0a00000d 	beq	9001de30 <sys_connect_session+0xc8>
9001ddf8:	e3a02045 	mov	r2, #69	; 0x45
9001ddfc:	e3021990 	movw	r1, #10640	; 0x2990
9001de00:	e3491002 	movt	r1, #36866	; 0x9002
9001de04:	e30208dc 	movw	r0, #10460	; 0x28dc
9001de08:	e3490002 	movt	r0, #36866	; 0x9002
9001de0c:	ebffdd59 	bl	90015378 <KPrintf>
9001de10:	e30218ec 	movw	r1, #10476	; 0x28ec
9001de14:	e3491002 	movt	r1, #36866	; 0x9002
9001de18:	e3020944 	movw	r0, #10564	; 0x2944
9001de1c:	e3490002 	movt	r0, #36866	; 0x9002
9001de20:	ebffdd54 	bl	90015378 <KPrintf>
9001de24:	e3020954 	movw	r0, #10580	; 0x2954
9001de28:	e3490002 	movt	r0, #36866	; 0x9002
9001de2c:	ebffd443 	bl	90012f40 <panic>

    struct TraceTag server_tag;
    if (!AchieveResourceTag(&server_tag, &server_identifier_owner, path)) {
9001de30:	e24b1014 	sub	r1, fp, #20
9001de34:	e24b301c 	sub	r3, fp, #28
9001de38:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001de3c:	e1a00003 	mov	r0, r3
9001de40:	ebffe892 	bl	90018090 <AchieveResourceTag>
9001de44:	e1a03000 	mov	r3, r0
9001de48:	e2233001 	eor	r3, r3, #1
9001de4c:	e6ef3073 	uxtb	r3, r3
9001de50:	e3530000 	cmp	r3, #0
9001de54:	0a00000b 	beq	9001de88 <sys_connect_session+0x120>
        ERROR("Not server: %s\n", path);
9001de58:	e3a02049 	mov	r2, #73	; 0x49
9001de5c:	e3021990 	movw	r1, #10640	; 0x2990
9001de60:	e3491002 	movt	r1, #36866	; 0x9002
9001de64:	e30208dc 	movw	r0, #10460	; 0x28dc
9001de68:	e3490002 	movt	r0, #36866	; 0x9002
9001de6c:	ebffdd41 	bl	90015378 <KPrintf>
9001de70:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
9001de74:	e3020958 	movw	r0, #10584	; 0x2958
9001de78:	e3490002 	movt	r0, #36866	; 0x9002
9001de7c:	ebffdd3d 	bl	90015378 <KPrintf>
        return -1;
9001de80:	e3e03000 	mvn	r3, #0
9001de84:	ea00001a 	b	9001def4 <sys_connect_session+0x18c>
    }

    struct TaskMicroDescriptor* server = AchieveResource(&server_tag);
9001de88:	e24b301c 	sub	r3, fp, #28
9001de8c:	e1a00003 	mov	r0, r3
9001de90:	ebffe891 	bl	900180dc <AchieveResource>
9001de94:	e50b000c 	str	r0, [fp, #-12]
    assert(server != NULL);
9001de98:	e51b300c 	ldr	r3, [fp, #-12]
9001de9c:	e3530000 	cmp	r3, #0
9001dea0:	1a00000d 	bne	9001dedc <sys_connect_session+0x174>
9001dea4:	e3a0204e 	mov	r2, #78	; 0x4e
9001dea8:	e3021990 	movw	r1, #10640	; 0x2990
9001deac:	e3491002 	movt	r1, #36866	; 0x9002
9001deb0:	e30208dc 	movw	r0, #10460	; 0x28dc
9001deb4:	e3490002 	movt	r0, #36866	; 0x9002
9001deb8:	ebffdd2e 	bl	90015378 <KPrintf>
9001debc:	e3021968 	movw	r1, #10600	; 0x2968
9001dec0:	e3491002 	movt	r1, #36866	; 0x9002
9001dec4:	e3020944 	movw	r0, #10564	; 0x2944
9001dec8:	e3490002 	movt	r0, #36866	; 0x9002
9001decc:	ebffdd29 	bl	90015378 <KPrintf>
9001ded0:	e3020954 	movw	r0, #10580	; 0x2954
9001ded4:	e3490002 	movt	r0, #36866	; 0x9002
9001ded8:	ebffd418 	bl	90012f40 <panic>
    return create_session_inner(client, server, capacity, user_session);
9001dedc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001dee0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001dee4:	e51b100c 	ldr	r1, [fp, #-12]
9001dee8:	e51b0008 	ldr	r0, [fp, #-8]
9001deec:	ebffff66 	bl	9001dc8c <create_session_inner>
9001def0:	e1a03000 	mov	r3, r0
9001def4:	e1a00003 	mov	r0, r3
9001def8:	e24bd004 	sub	sp, fp, #4
9001defc:	e8bd8800 	pop	{fp, pc}

9001df00 <cur_cpuid>:
{
9001df00:	e92d4800 	push	{fp, lr}
9001df04:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001df08:	ebffcc88 	bl	90011130 <cpu_get_current>
9001df0c:	e1a03000 	mov	r3, r0
}
9001df10:	e1a00003 	mov	r0, r3
9001df14:	e8bd8800 	pop	{fp, pc}

9001df18 <cur_cpu>:
{
9001df18:	e92d4800 	push	{fp, lr}
9001df1c:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001df20:	ebfffff6 	bl	9001df00 <cur_cpuid>
9001df24:	e1a02000 	mov	r2, r0
9001df28:	e1a03002 	mov	r3, r2
9001df2c:	e1a03083 	lsl	r3, r3, #1
9001df30:	e0833002 	add	r3, r3, r2
9001df34:	e1a03103 	lsl	r3, r3, #2
9001df38:	e304256c 	movw	r2, #17772	; 0x456c
9001df3c:	e349209a 	movt	r2, #37018	; 0x909a
9001df40:	e0833002 	add	r3, r3, r2
9001df44:	e1a00003 	mov	r0, r3
9001df48:	e8bd8800 	pop	{fp, pc}

9001df4c <sys_poll_session>:
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_poll_session(struct Session* userland_session_arr, int arr_capacity)
{
9001df4c:	e92d4800 	push	{fp, lr}
9001df50:	e28db004 	add	fp, sp, #4
9001df54:	e24dd048 	sub	sp, sp, #72	; 0x48
9001df58:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
9001df5c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001df60:	ebffffec 	bl	9001df18 <cur_cpu>
9001df64:	e1a03000 	mov	r3, r0
9001df68:	e5933004 	ldr	r3, [r3, #4]
9001df6c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    if (cur_task == NULL) {
9001df70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001df74:	e3530000 	cmp	r3, #0
9001df78:	1a00000a 	bne	9001dfa8 <sys_poll_session+0x5c>
        ERROR("%s by killed task\n");
9001df7c:	e3a02028 	mov	r2, #40	; 0x28
9001df80:	e3021a04 	movw	r1, #10756	; 0x2a04
9001df84:	e3491002 	movt	r1, #36866	; 0x9002
9001df88:	e30209a4 	movw	r0, #10660	; 0x29a4
9001df8c:	e3490002 	movt	r0, #36866	; 0x9002
9001df90:	ebffdcf8 	bl	90015378 <KPrintf>
9001df94:	e30209b4 	movw	r0, #10676	; 0x29b4
9001df98:	e3490002 	movt	r0, #36866	; 0x9002
9001df9c:	ebffdcf5 	bl	90015378 <KPrintf>
        return -1;
9001dfa0:	e3e03000 	mvn	r3, #0
9001dfa4:	ea000127 	b	9001e448 <sys_poll_session+0x4fc>
    }

    spinlock_lock(&cur_task->lock);
9001dfa8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001dfac:	e2833020 	add	r3, r3, #32
9001dfb0:	e1a00003 	mov	r0, r3
9001dfb4:	ebffd772 	bl	90013d84 <spinlock_lock>

    struct double_list_node* cur_node = NULL;
9001dfb8:	e3a03000 	mov	r3, #0
9001dfbc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    struct server_session* server_session = NULL;
9001dfc0:	e3a03000 	mov	r3, #0
9001dfc4:	e50b3008 	str	r3, [fp, #-8]
    /* update old sessions */
    for (int i = 0; i < arr_capacity; i++) {
9001dfc8:	e3a03000 	mov	r3, #0
9001dfcc:	e50b300c 	str	r3, [fp, #-12]
9001dfd0:	ea000084 	b	9001e1e8 <sys_poll_session+0x29c>
        if (UNLIKELY(userland_session_arr[i].buf == NULL)) {
9001dfd4:	e51b200c 	ldr	r2, [fp, #-12]
9001dfd8:	e1a03002 	mov	r3, r2
9001dfdc:	e1a03103 	lsl	r3, r3, #2
9001dfe0:	e0833002 	add	r3, r3, r2
9001dfe4:	e1a03103 	lsl	r3, r3, #2
9001dfe8:	e1a02003 	mov	r2, r3
9001dfec:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001dff0:	e0833002 	add	r3, r3, r2
9001dff4:	e5933010 	ldr	r3, [r3, #16]
9001dff8:	e3530000 	cmp	r3, #0
9001dffc:	03a03001 	moveq	r3, #1
9001e000:	13a03000 	movne	r3, #0
9001e004:	e6ef3073 	uxtb	r3, r3
9001e008:	e3530000 	cmp	r3, #0
9001e00c:	1a00007a 	bne	9001e1fc <sys_poll_session+0x2b0>
            break;
        }
        cur_node = cur_task->svr_sess_listhead.next;
9001e010:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e014:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
9001e018:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        server_session = CONTAINER_OF(cur_node, struct server_session, node);
9001e01c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001e020:	e50b3008 	str	r3, [fp, #-8]
        if (UNLIKELY(server_session->buf_addr != (uintptr_t)userland_session_arr[i].buf)) {
9001e024:	e51b3008 	ldr	r3, [fp, #-8]
9001e028:	e5931008 	ldr	r1, [r3, #8]
9001e02c:	e51b200c 	ldr	r2, [fp, #-12]
9001e030:	e1a03002 	mov	r3, r2
9001e034:	e1a03103 	lsl	r3, r3, #2
9001e038:	e0833002 	add	r3, r3, r2
9001e03c:	e1a03103 	lsl	r3, r3, #2
9001e040:	e1a02003 	mov	r2, r3
9001e044:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e048:	e0833002 	add	r3, r3, r2
9001e04c:	e5933010 	ldr	r3, [r3, #16]
9001e050:	e1510003 	cmp	r1, r3
9001e054:	13a03001 	movne	r3, #1
9001e058:	03a03000 	moveq	r3, #0
9001e05c:	e6ef3073 	uxtb	r3, r3
9001e060:	e3530000 	cmp	r3, #0
9001e064:	0a00001a 	beq	9001e0d4 <sys_poll_session+0x188>
            ERROR("mismatched old session addr, user buf: %x, server buf: %x\n", userland_session_arr[i].buf, server_session->buf_addr);
9001e068:	e3a02038 	mov	r2, #56	; 0x38
9001e06c:	e3021a04 	movw	r1, #10756	; 0x2a04
9001e070:	e3491002 	movt	r1, #36866	; 0x9002
9001e074:	e30209a4 	movw	r0, #10660	; 0x29a4
9001e078:	e3490002 	movt	r0, #36866	; 0x9002
9001e07c:	ebffdcbd 	bl	90015378 <KPrintf>
9001e080:	e51b200c 	ldr	r2, [fp, #-12]
9001e084:	e1a03002 	mov	r3, r2
9001e088:	e1a03103 	lsl	r3, r3, #2
9001e08c:	e0833002 	add	r3, r3, r2
9001e090:	e1a03103 	lsl	r3, r3, #2
9001e094:	e1a02003 	mov	r2, r3
9001e098:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e09c:	e0833002 	add	r3, r3, r2
9001e0a0:	e5931010 	ldr	r1, [r3, #16]
9001e0a4:	e51b3008 	ldr	r3, [fp, #-8]
9001e0a8:	e5933008 	ldr	r3, [r3, #8]
9001e0ac:	e1a02003 	mov	r2, r3
9001e0b0:	e30209c8 	movw	r0, #10696	; 0x29c8
9001e0b4:	e3490002 	movt	r0, #36866	; 0x9002
9001e0b8:	ebffdcae 	bl	90015378 <KPrintf>
            spinlock_unlock(&cur_task->lock);
9001e0bc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e0c0:	e2833020 	add	r3, r3, #32
9001e0c4:	e1a00003 	mov	r0, r3
9001e0c8:	ebffd75d 	bl	90013e44 <spinlock_unlock>
            return -1;
9001e0cc:	e3e03000 	mvn	r3, #0
9001e0d0:	ea0000dc 	b	9001e448 <sys_poll_session+0x4fc>
        }
        // update session_backend
        server_session->head = userland_session_arr[i].head;
9001e0d4:	e51b200c 	ldr	r2, [fp, #-12]
9001e0d8:	e1a03002 	mov	r3, r2
9001e0dc:	e1a03103 	lsl	r3, r3, #2
9001e0e0:	e0833002 	add	r3, r3, r2
9001e0e4:	e1a03103 	lsl	r3, r3, #2
9001e0e8:	e1a02003 	mov	r2, r3
9001e0ec:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e0f0:	e0833002 	add	r3, r3, r2
9001e0f4:	e5932008 	ldr	r2, [r3, #8]
9001e0f8:	e51b3008 	ldr	r3, [fp, #-8]
9001e0fc:	e5832010 	str	r2, [r3, #16]
        server_session->tail = userland_session_arr[i].tail;
9001e100:	e51b200c 	ldr	r2, [fp, #-12]
9001e104:	e1a03002 	mov	r3, r2
9001e108:	e1a03103 	lsl	r3, r3, #2
9001e10c:	e0833002 	add	r3, r3, r2
9001e110:	e1a03103 	lsl	r3, r3, #2
9001e114:	e1a02003 	mov	r2, r3
9001e118:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e11c:	e0833002 	add	r3, r3, r2
9001e120:	e593200c 	ldr	r2, [r3, #12]
9001e124:	e51b3008 	ldr	r3, [fp, #-8]
9001e128:	e5832014 	str	r2, [r3, #20]
9001e12c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001e130:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    _double_list_del(entry->prev, entry->next);
9001e134:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001e138:	e5932004 	ldr	r2, [r3, #4]
9001e13c:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001e140:	e5933000 	ldr	r3, [r3]
9001e144:	e50b203c 	str	r2, [fp, #-60]	; 0xffffffc4
9001e148:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    next->prev = prev;
9001e14c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
9001e150:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
9001e154:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001e158:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001e15c:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
9001e160:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001e164:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001e168:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
9001e16c:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001e170:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
9001e174:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
9001e178:	e5832004 	str	r2, [r3, #4]
        doubleListDel(cur_node);
        doubleListAddOnBack(cur_node, &cur_task->svr_sess_listhead);
9001e17c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e180:	e283305c 	add	r3, r3, #92	; 0x5c
9001e184:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001e188:	e50b2024 	str	r2, [fp, #-36]	; 0xffffffdc
9001e18c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    _double_list_add(new_node, head->prev, head);
9001e190:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001e194:	e5933004 	ldr	r3, [r3, #4]
9001e198:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001e19c:	e50b202c 	str	r2, [fp, #-44]	; 0xffffffd4
9001e1a0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
9001e1a4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001e1a8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    next->prev = new_node;
9001e1ac:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001e1b0:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001e1b4:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001e1b8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001e1bc:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
9001e1c0:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001e1c4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001e1c8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
9001e1cc:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001e1d0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001e1d4:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001e1d8:	e5832000 	str	r2, [r3]
    for (int i = 0; i < arr_capacity; i++) {
9001e1dc:	e51b300c 	ldr	r3, [fp, #-12]
9001e1e0:	e2833001 	add	r3, r3, #1
9001e1e4:	e50b300c 	str	r3, [fp, #-12]
9001e1e8:	e51b200c 	ldr	r2, [fp, #-12]
9001e1ec:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
9001e1f0:	e1520003 	cmp	r2, r3
9001e1f4:	baffff76 	blt	9001dfd4 <sys_poll_session+0x88>
9001e1f8:	ea000000 	b	9001e200 <sys_poll_session+0x2b4>
            break;
9001e1fc:	e320f000 	nop	{0}
    }
    spinlock_unlock(&cur_task->lock);
9001e200:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e204:	e2833020 	add	r3, r3, #32
9001e208:	e1a00003 	mov	r0, r3
9001e20c:	ebffd70c 	bl	90013e44 <spinlock_unlock>

    /* handle sessions for condition 2, ref. delete_share_pages() */
    bool has_delete = true;
9001e210:	e3a03001 	mov	r3, #1
9001e214:	e54b300d 	strb	r3, [fp, #-13]
    while (has_delete) {
9001e218:	ea00003e 	b	9001e318 <sys_poll_session+0x3cc>
        has_delete = false;
9001e21c:	e3a03000 	mov	r3, #0
9001e220:	e54b300d 	strb	r3, [fp, #-13]

        spinlock_lock(&cur_task->lock);
9001e224:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e228:	e2833020 	add	r3, r3, #32
9001e22c:	e1a00003 	mov	r0, r3
9001e230:	ebffd6d3 	bl	90013d84 <spinlock_lock>
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e234:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e238:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
9001e23c:	e50b3008 	str	r3, [fp, #-8]
9001e240:	ea000026 	b	9001e2e0 <sys_poll_session+0x394>
        {
            if (SERVER_SESSION_BACKEND(server_session)->client_side.closed) {
9001e244:	e51b3008 	ldr	r3, [fp, #-8]
9001e248:	e5d3302c 	ldrb	r3, [r3, #44]	; 0x2c
9001e24c:	e3530000 	cmp	r3, #0
9001e250:	0a00001f 	beq	9001e2d4 <sys_poll_session+0x388>
                // client had closed it, then server will close it too
                struct session_backend* session_backend = SERVER_SESSION_BACKEND(server_session);
9001e254:	e51b3008 	ldr	r3, [fp, #-8]
9001e258:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

                spinlock_unlock(&cur_task->lock);
9001e25c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e260:	e2833020 	add	r3, r3, #32
9001e264:	e1a00003 	mov	r0, r3
9001e268:	ebffd6f5 	bl	90013e44 <spinlock_unlock>
                if (!session_backend->server_side.closed) {
9001e26c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e270:	e5d33018 	ldrb	r3, [r3, #24]
9001e274:	e2233001 	eor	r3, r3, #1
9001e278:	e6ef3073 	uxtb	r3, r3
9001e27c:	e3530000 	cmp	r3, #0
9001e280:	0a00000b 	beq	9001e2b4 <sys_poll_session+0x368>
                    session_backend->server_side.closed = true;
9001e284:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e288:	e3a02001 	mov	r2, #1
9001e28c:	e5c32018 	strb	r2, [r3, #24]
                    xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->server_side.buf_addr, session_backend->nr_pages);
9001e290:	e3033564 	movw	r3, #13668	; 0x3564
9001e294:	e3493002 	movt	r3, #36866	; 0x9002
9001e298:	e5933004 	ldr	r3, [r3, #4]
9001e29c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001e2a0:	e5921008 	ldr	r1, [r2, #8]
9001e2a4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001e2a8:	e5922034 	ldr	r2, [r2, #52]	; 0x34
9001e2ac:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001e2b0:	e12fff33 	blx	r3
                }
                xizi_share_page_manager.delete_share_pages(session_backend);
9001e2b4:	e3033564 	movw	r3, #13668	; 0x3564
9001e2b8:	e3493002 	movt	r3, #36866	; 0x9002
9001e2bc:	e5933008 	ldr	r3, [r3, #8]
9001e2c0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001e2c4:	e12fff33 	blx	r3
                has_delete = true;
9001e2c8:	e3a03001 	mov	r3, #1
9001e2cc:	e54b300d 	strb	r3, [fp, #-13]
                break;
9001e2d0:	ea000007 	b	9001e2f4 <sys_poll_session+0x3a8>
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e2d4:	e51b3008 	ldr	r3, [fp, #-8]
9001e2d8:	e5933000 	ldr	r3, [r3]
9001e2dc:	e50b3008 	str	r3, [fp, #-8]
9001e2e0:	e51b2008 	ldr	r2, [fp, #-8]
9001e2e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e2e8:	e283305c 	add	r3, r3, #92	; 0x5c
9001e2ec:	e1520003 	cmp	r2, r3
9001e2f0:	1affffd3 	bne	9001e244 <sys_poll_session+0x2f8>
            }
        }
        if (!has_delete) {
9001e2f4:	e55b300d 	ldrb	r3, [fp, #-13]
9001e2f8:	e2233001 	eor	r3, r3, #1
9001e2fc:	e6ef3073 	uxtb	r3, r3
9001e300:	e3530000 	cmp	r3, #0
9001e304:	0a000003 	beq	9001e318 <sys_poll_session+0x3cc>
            spinlock_unlock(&cur_task->lock);
9001e308:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e30c:	e2833020 	add	r3, r3, #32
9001e310:	e1a00003 	mov	r0, r3
9001e314:	ebffd6ca 	bl	90013e44 <spinlock_unlock>
    while (has_delete) {
9001e318:	e55b300d 	ldrb	r3, [fp, #-13]
9001e31c:	e3530000 	cmp	r3, #0
9001e320:	1affffbd 	bne	9001e21c <sys_poll_session+0x2d0>
        }
    }

    /* poll with new sessions */
    spinlock_lock(&cur_task->lock);
9001e324:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e328:	e2833020 	add	r3, r3, #32
9001e32c:	e1a00003 	mov	r0, r3
9001e330:	ebffd693 	bl	90013d84 <spinlock_lock>
    int i = 0;
9001e334:	e3a03000 	mov	r3, #0
9001e338:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e33c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e340:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
9001e344:	e50b3008 	str	r3, [fp, #-8]
9001e348:	ea000020 	b	9001e3d0 <sys_poll_session+0x484>
    {
        if (i >= arr_capacity) {
9001e34c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001e350:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
9001e354:	e1520003 	cmp	r2, r3
9001e358:	aa000022 	bge	9001e3e8 <sys_poll_session+0x49c>
            break;
        }
        userland_session_arr[i++] = (struct Session) {
9001e35c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e360:	e2832001 	add	r2, r3, #1
9001e364:	e50b2014 	str	r2, [fp, #-20]	; 0xffffffec
9001e368:	e1a02003 	mov	r2, r3
9001e36c:	e1a03002 	mov	r3, r2
9001e370:	e1a03103 	lsl	r3, r3, #2
9001e374:	e0833002 	add	r3, r3, r2
9001e378:	e1a03103 	lsl	r3, r3, #2
9001e37c:	e1a02003 	mov	r2, r3
9001e380:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e384:	e0833002 	add	r3, r3, r2
            .buf = (void*)server_session->buf_addr,
            .capacity = server_session->capacity,
            .head = server_session->head,
            .tail = server_session->tail,
            .id = SERVER_SESSION_BACKEND(server_session)->session_id,
9001e388:	e51b2008 	ldr	r2, [fp, #-8]
9001e38c:	e592c030 	ldr	ip, [r2, #48]	; 0x30
            .capacity = server_session->capacity,
9001e390:	e51b2008 	ldr	r2, [fp, #-8]
9001e394:	e592000c 	ldr	r0, [r2, #12]
            .head = server_session->head,
9001e398:	e51b2008 	ldr	r2, [fp, #-8]
9001e39c:	e5921010 	ldr	r1, [r2, #16]
            .tail = server_session->tail,
9001e3a0:	e51b2008 	ldr	r2, [fp, #-8]
9001e3a4:	e5922014 	ldr	r2, [r2, #20]
            .buf = (void*)server_session->buf_addr,
9001e3a8:	e51be008 	ldr	lr, [fp, #-8]
9001e3ac:	e59ee008 	ldr	lr, [lr, #8]
        userland_session_arr[i++] = (struct Session) {
9001e3b0:	e583c000 	str	ip, [r3]
9001e3b4:	e5830004 	str	r0, [r3, #4]
9001e3b8:	e5831008 	str	r1, [r3, #8]
9001e3bc:	e583200c 	str	r2, [r3, #12]
9001e3c0:	e583e010 	str	lr, [r3, #16]
    DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e3c4:	e51b3008 	ldr	r3, [fp, #-8]
9001e3c8:	e5933000 	ldr	r3, [r3]
9001e3cc:	e50b3008 	str	r3, [fp, #-8]
9001e3d0:	e51b2008 	ldr	r2, [fp, #-8]
9001e3d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e3d8:	e283305c 	add	r3, r3, #92	; 0x5c
9001e3dc:	e1520003 	cmp	r2, r3
9001e3e0:	1affffd9 	bne	9001e34c <sys_poll_session+0x400>
9001e3e4:	ea000000 	b	9001e3ec <sys_poll_session+0x4a0>
            break;
9001e3e8:	e320f000 	nop	{0}
        };
    }
    if (LIKELY(i < arr_capacity)) {
9001e3ec:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001e3f0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
9001e3f4:	e1520003 	cmp	r2, r3
9001e3f8:	b3a03001 	movlt	r3, #1
9001e3fc:	a3a03000 	movge	r3, #0
9001e400:	e6ef3073 	uxtb	r3, r3
9001e404:	e3530000 	cmp	r3, #0
9001e408:	0a000009 	beq	9001e434 <sys_poll_session+0x4e8>
        userland_session_arr[i].buf = 0;
9001e40c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001e410:	e1a03002 	mov	r3, r2
9001e414:	e1a03103 	lsl	r3, r3, #2
9001e418:	e0833002 	add	r3, r3, r2
9001e41c:	e1a03103 	lsl	r3, r3, #2
9001e420:	e1a02003 	mov	r2, r3
9001e424:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001e428:	e0833002 	add	r3, r3, r2
9001e42c:	e3a02000 	mov	r2, #0
9001e430:	e5832010 	str	r2, [r3, #16]
    }
    spinlock_unlock(&cur_task->lock);
9001e434:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e438:	e2833020 	add	r3, r3, #32
9001e43c:	e1a00003 	mov	r0, r3
9001e440:	ebffd67f 	bl	90013e44 <spinlock_unlock>

    return 0;
9001e444:	e3a03000 	mov	r3, #0
9001e448:	e1a00003 	mov	r0, r3
9001e44c:	e24bd004 	sub	sp, fp, #4
9001e450:	e8bd8800 	pop	{fp, pc}

9001e454 <cur_cpuid>:
{
9001e454:	e92d4800 	push	{fp, lr}
9001e458:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001e45c:	ebffcb33 	bl	90011130 <cpu_get_current>
9001e460:	e1a03000 	mov	r3, r0
}
9001e464:	e1a00003 	mov	r0, r3
9001e468:	e8bd8800 	pop	{fp, pc}

9001e46c <cur_cpu>:
{
9001e46c:	e92d4800 	push	{fp, lr}
9001e470:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001e474:	ebfffff6 	bl	9001e454 <cur_cpuid>
9001e478:	e1a02000 	mov	r2, r0
9001e47c:	e1a03002 	mov	r3, r2
9001e480:	e1a03083 	lsl	r3, r3, #1
9001e484:	e0833002 	add	r3, r3, r2
9001e488:	e1a03103 	lsl	r3, r3, #2
9001e48c:	e304256c 	movw	r2, #17772	; 0x456c
9001e490:	e349209a 	movt	r2, #37018	; 0x909a
9001e494:	e0833002 	add	r3, r3, r2
9001e498:	e1a00003 	mov	r0, r3
9001e49c:	e8bd8800 	pop	{fp, pc}

9001e4a0 <sys_close_session>:
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_close_session(struct Session* session)
{
9001e4a0:	e92d4800 	push	{fp, lr}
9001e4a4:	e28db004 	add	fp, sp, #4
9001e4a8:	e24dd020 	sub	sp, sp, #32
9001e4ac:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001e4b0:	ebffffed 	bl	9001e46c <cur_cpu>
9001e4b4:	e1a03000 	mov	r3, r0
9001e4b8:	e5933004 	ldr	r3, [r3, #4]
9001e4bc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(cur_task != NULL);
9001e4c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e4c4:	e3530000 	cmp	r3, #0
9001e4c8:	1a00000d 	bne	9001e504 <sys_close_session+0x64>
9001e4cc:	e3a02027 	mov	r2, #39	; 0x27
9001e4d0:	e3021a50 	movw	r1, #10832	; 0x2a50
9001e4d4:	e3491002 	movt	r1, #36866	; 0x9002
9001e4d8:	e3020a18 	movw	r0, #10776	; 0x2a18
9001e4dc:	e3490002 	movt	r0, #36866	; 0x9002
9001e4e0:	ebffdba4 	bl	90015378 <KPrintf>
9001e4e4:	e3021a28 	movw	r1, #10792	; 0x2a28
9001e4e8:	e3491002 	movt	r1, #36866	; 0x9002
9001e4ec:	e3020a3c 	movw	r0, #10812	; 0x2a3c
9001e4f0:	e3490002 	movt	r0, #36866	; 0x9002
9001e4f4:	ebffdb9f 	bl	90015378 <KPrintf>
9001e4f8:	e3020a4c 	movw	r0, #10828	; 0x2a4c
9001e4fc:	e3490002 	movt	r0, #36866	; 0x9002
9001e500:	ebffd28e 	bl	90012f40 <panic>
    /* check if session is available */
    if (session->buf == NULL || (uintptr_t)session->buf < USER_IPC_SPACE_BASE || (uintptr_t)session->buf > USER_IPC_SPACE_TOP) {
9001e504:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e508:	e5933010 	ldr	r3, [r3, #16]
9001e50c:	e3530000 	cmp	r3, #0
9001e510:	0a00000a 	beq	9001e540 <sys_close_session+0xa0>
9001e514:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e518:	e5933010 	ldr	r3, [r3, #16]
9001e51c:	e3730219 	cmn	r3, #-1879048191	; 0x90000001
9001e520:	9a000006 	bls	9001e540 <sys_close_session+0xa0>
9001e524:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e528:	e5933010 	ldr	r3, [r3, #16]
9001e52c:	e1a02003 	mov	r2, r3
9001e530:	e3a03a0f 	mov	r3, #61440	; 0xf000
9001e534:	e3473fff 	movt	r3, #32767	; 0x7fff
9001e538:	e1520003 	cmp	r2, r3
9001e53c:	9a000001 	bls	9001e548 <sys_close_session+0xa8>
        return -1;
9001e540:	e3e03000 	mvn	r3, #0
9001e544:	ea000078 	b	9001e72c <sys_close_session+0x28c>
    }

    /* check if session is a client one or a server one */
    struct session_backend* session_backend = NULL;
9001e548:	e3a03000 	mov	r3, #0
9001e54c:	e50b3008 	str	r3, [fp, #-8]
    bool session_valid = false;
9001e550:	e3a03000 	mov	r3, #0
9001e554:	e54b3009 	strb	r3, [fp, #-9]

    struct client_session* client_session = NULL;
9001e558:	e3a03000 	mov	r3, #0
9001e55c:	e50b3010 	str	r3, [fp, #-16]
    DOUBLE_LIST_FOR_EACH_ENTRY(client_session, &cur_task->cli_sess_listhead, node)
9001e560:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e564:	e5933054 	ldr	r3, [r3, #84]	; 0x54
9001e568:	e50b3010 	str	r3, [fp, #-16]
9001e56c:	ea000021 	b	9001e5f8 <sys_close_session+0x158>
    {
        if ((uintptr_t)session->buf == client_session->buf_addr) {
9001e570:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e574:	e5933010 	ldr	r3, [r3, #16]
9001e578:	e1a02003 	mov	r2, r3
9001e57c:	e51b3010 	ldr	r3, [fp, #-16]
9001e580:	e5933008 	ldr	r3, [r3, #8]
9001e584:	e1520003 	cmp	r2, r3
9001e588:	1a000017 	bne	9001e5ec <sys_close_session+0x14c>
            session_valid = true;
9001e58c:	e3a03001 	mov	r3, #1
9001e590:	e54b3009 	strb	r3, [fp, #-9]
            session_backend = CLIENT_SESSION_BACKEND(client_session);
9001e594:	e51b3010 	ldr	r3, [fp, #-16]
9001e598:	e243301c 	sub	r3, r3, #28
9001e59c:	e50b3008 	str	r3, [fp, #-8]
            if (!client_session->closed) {
9001e5a0:	e51b3010 	ldr	r3, [fp, #-16]
9001e5a4:	e5d33010 	ldrb	r3, [r3, #16]
9001e5a8:	e2233001 	eor	r3, r3, #1
9001e5ac:	e6ef3073 	uxtb	r3, r3
9001e5b0:	e3530000 	cmp	r3, #0
9001e5b4:	0a000015 	beq	9001e610 <sys_close_session+0x170>
                client_session->closed = true;
9001e5b8:	e51b3010 	ldr	r3, [fp, #-16]
9001e5bc:	e3a02001 	mov	r2, #1
9001e5c0:	e5c32010 	strb	r2, [r3, #16]
                xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->client_side.buf_addr, session_backend->nr_pages);
9001e5c4:	e3033564 	movw	r3, #13668	; 0x3564
9001e5c8:	e3493002 	movt	r3, #36866	; 0x9002
9001e5cc:	e5933004 	ldr	r3, [r3, #4]
9001e5d0:	e51b2008 	ldr	r2, [fp, #-8]
9001e5d4:	e5921024 	ldr	r1, [r2, #36]	; 0x24
9001e5d8:	e51b2008 	ldr	r2, [fp, #-8]
9001e5dc:	e5922034 	ldr	r2, [r2, #52]	; 0x34
9001e5e0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001e5e4:	e12fff33 	blx	r3
            }
            break;
9001e5e8:	ea000008 	b	9001e610 <sys_close_session+0x170>
    DOUBLE_LIST_FOR_EACH_ENTRY(client_session, &cur_task->cli_sess_listhead, node)
9001e5ec:	e51b3010 	ldr	r3, [fp, #-16]
9001e5f0:	e5933000 	ldr	r3, [r3]
9001e5f4:	e50b3010 	str	r3, [fp, #-16]
9001e5f8:	e51b2010 	ldr	r2, [fp, #-16]
9001e5fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e600:	e2833054 	add	r3, r3, #84	; 0x54
9001e604:	e1520003 	cmp	r2, r3
9001e608:	1affffd8 	bne	9001e570 <sys_close_session+0xd0>
9001e60c:	ea000000 	b	9001e614 <sys_close_session+0x174>
            break;
9001e610:	e320f000 	nop	{0}
        }
    }
    if (UNLIKELY(session_backend == NULL)) {
9001e614:	e51b3008 	ldr	r3, [fp, #-8]
9001e618:	e3530000 	cmp	r3, #0
9001e61c:	03a03001 	moveq	r3, #1
9001e620:	13a03000 	movne	r3, #0
9001e624:	e6ef3073 	uxtb	r3, r3
9001e628:	e3530000 	cmp	r3, #0
9001e62c:	0a00002d 	beq	9001e6e8 <sys_close_session+0x248>
        struct server_session* server_session = NULL;
9001e630:	e3a03000 	mov	r3, #0
9001e634:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e638:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e63c:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
9001e640:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001e644:	ea000020 	b	9001e6cc <sys_close_session+0x22c>
        {
            if ((uintptr_t)session->buf == server_session->buf_addr) {
9001e648:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001e64c:	e5933010 	ldr	r3, [r3, #16]
9001e650:	e1a02003 	mov	r2, r3
9001e654:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e658:	e5933008 	ldr	r3, [r3, #8]
9001e65c:	e1520003 	cmp	r2, r3
9001e660:	1a000016 	bne	9001e6c0 <sys_close_session+0x220>
                session_valid = true;
9001e664:	e3a03001 	mov	r3, #1
9001e668:	e54b3009 	strb	r3, [fp, #-9]
                session_backend = SERVER_SESSION_BACKEND(server_session);
9001e66c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e670:	e50b3008 	str	r3, [fp, #-8]
                if (!server_session->closed) {
9001e674:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e678:	e5d33018 	ldrb	r3, [r3, #24]
9001e67c:	e2233001 	eor	r3, r3, #1
9001e680:	e6ef3073 	uxtb	r3, r3
9001e684:	e3530000 	cmp	r3, #0
9001e688:	0a000015 	beq	9001e6e4 <sys_close_session+0x244>
                    server_session->closed = true;
9001e68c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e690:	e3a02001 	mov	r2, #1
9001e694:	e5c32018 	strb	r2, [r3, #24]
                    xizi_share_page_manager.unmap_task_share_pages(cur_task, session_backend->server_side.buf_addr, session_backend->nr_pages);
9001e698:	e3033564 	movw	r3, #13668	; 0x3564
9001e69c:	e3493002 	movt	r3, #36866	; 0x9002
9001e6a0:	e5933004 	ldr	r3, [r3, #4]
9001e6a4:	e51b2008 	ldr	r2, [fp, #-8]
9001e6a8:	e5921008 	ldr	r1, [r2, #8]
9001e6ac:	e51b2008 	ldr	r2, [fp, #-8]
9001e6b0:	e5922034 	ldr	r2, [r2, #52]	; 0x34
9001e6b4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001e6b8:	e12fff33 	blx	r3
                }
                break;
9001e6bc:	ea000008 	b	9001e6e4 <sys_close_session+0x244>
        DOUBLE_LIST_FOR_EACH_ENTRY(server_session, &cur_task->svr_sess_listhead, node)
9001e6c0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001e6c4:	e5933000 	ldr	r3, [r3]
9001e6c8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
9001e6cc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001e6d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001e6d4:	e283305c 	add	r3, r3, #92	; 0x5c
9001e6d8:	e1520003 	cmp	r2, r3
9001e6dc:	1affffd9 	bne	9001e648 <sys_close_session+0x1a8>
9001e6e0:	ea000000 	b	9001e6e8 <sys_close_session+0x248>
                break;
9001e6e4:	e320f000 	nop	{0}
            }
        }
    }

    /* close this session */
    if (UNLIKELY(session_backend->client_side.closed && session_backend->server_side.closed) && LIKELY(session_valid)) {
9001e6e8:	e51b3008 	ldr	r3, [fp, #-8]
9001e6ec:	e5d3302c 	ldrb	r3, [r3, #44]	; 0x2c
9001e6f0:	e3530000 	cmp	r3, #0
9001e6f4:	0a00000b 	beq	9001e728 <sys_close_session+0x288>
9001e6f8:	e51b3008 	ldr	r3, [fp, #-8]
9001e6fc:	e5d33018 	ldrb	r3, [r3, #24]
9001e700:	e3530000 	cmp	r3, #0
9001e704:	0a000007 	beq	9001e728 <sys_close_session+0x288>
9001e708:	e55b3009 	ldrb	r3, [fp, #-9]
9001e70c:	e3530000 	cmp	r3, #0
9001e710:	0a000004 	beq	9001e728 <sys_close_session+0x288>
        xizi_share_page_manager.delete_share_pages(session_backend);
9001e714:	e3033564 	movw	r3, #13668	; 0x3564
9001e718:	e3493002 	movt	r3, #36866	; 0x9002
9001e71c:	e5933008 	ldr	r3, [r3, #8]
9001e720:	e51b0008 	ldr	r0, [fp, #-8]
9001e724:	e12fff33 	blx	r3
    }

    return 0;
9001e728:	e3a03000 	mov	r3, #0
9001e72c:	e1a00003 	mov	r0, r3
9001e730:	e24bd004 	sub	sp, fp, #4
9001e734:	e8bd8800 	pop	{fp, pc}

9001e738 <cur_cpuid>:
{
9001e738:	e92d4800 	push	{fp, lr}
9001e73c:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001e740:	ebffca7a 	bl	90011130 <cpu_get_current>
9001e744:	e1a03000 	mov	r3, r0
}
9001e748:	e1a00003 	mov	r0, r3
9001e74c:	e8bd8800 	pop	{fp, pc}

9001e750 <cur_cpu>:
{
9001e750:	e92d4800 	push	{fp, lr}
9001e754:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001e758:	ebfffff6 	bl	9001e738 <cur_cpuid>
9001e75c:	e1a02000 	mov	r2, r0
9001e760:	e1a03002 	mov	r3, r2
9001e764:	e1a03083 	lsl	r3, r3, #1
9001e768:	e0833002 	add	r3, r3, r2
9001e76c:	e1a03103 	lsl	r3, r3, #2
9001e770:	e304256c 	movw	r2, #17772	; 0x456c
9001e774:	e349209a 	movt	r2, #37018	; 0x909a
9001e778:	e0833002 	add	r3, r3, r2
9001e77c:	e1a00003 	mov	r0, r3
9001e780:	e8bd8800 	pop	{fp, pc}

9001e784 <send_irq_to_user>:
    struct Session* session;
    int opcode;
} irq_forward_table[NR_IRQS];

static void send_irq_to_user(int irq_num)
{
9001e784:	e92d4800 	push	{fp, lr}
9001e788:	e28db004 	add	fp, sp, #4
9001e78c:	e24dd010 	sub	sp, sp, #16
9001e790:	e50b0010 	str	r0, [fp, #-16]
    int len = IPC_ARG_INFO_BASE_OFFSET;
9001e794:	e3a0300c 	mov	r3, #12
9001e798:	e50b3008 	str	r3, [fp, #-8]
    /* add session tail */
    struct IpcMsg* buf = irq_forward_table[irq_num].session->buf + irq_forward_table[irq_num].session->tail;
9001e79c:	e3042680 	movw	r2, #18048	; 0x4680
9001e7a0:	e349209a 	movt	r2, #37018	; 0x909a
9001e7a4:	e51b1010 	ldr	r1, [fp, #-16]
9001e7a8:	e1a03001 	mov	r3, r1
9001e7ac:	e1a03083 	lsl	r3, r3, #1
9001e7b0:	e0833001 	add	r3, r3, r1
9001e7b4:	e1a03103 	lsl	r3, r3, #2
9001e7b8:	e0823003 	add	r3, r2, r3
9001e7bc:	e2833004 	add	r3, r3, #4
9001e7c0:	e5933000 	ldr	r3, [r3]
9001e7c4:	e5930010 	ldr	r0, [r3, #16]
9001e7c8:	e3042680 	movw	r2, #18048	; 0x4680
9001e7cc:	e349209a 	movt	r2, #37018	; 0x909a
9001e7d0:	e51b1010 	ldr	r1, [fp, #-16]
9001e7d4:	e1a03001 	mov	r3, r1
9001e7d8:	e1a03083 	lsl	r3, r3, #1
9001e7dc:	e0833001 	add	r3, r3, r1
9001e7e0:	e1a03103 	lsl	r3, r3, #2
9001e7e4:	e0823003 	add	r3, r2, r3
9001e7e8:	e2833004 	add	r3, r3, #4
9001e7ec:	e5933000 	ldr	r3, [r3]
9001e7f0:	e593300c 	ldr	r3, [r3, #12]
9001e7f4:	e0803003 	add	r3, r0, r3
9001e7f8:	e50b300c 	str	r3, [fp, #-12]
    irq_forward_table[irq_num].session->tail += len;
9001e7fc:	e3042680 	movw	r2, #18048	; 0x4680
9001e800:	e349209a 	movt	r2, #37018	; 0x909a
9001e804:	e51b1010 	ldr	r1, [fp, #-16]
9001e808:	e1a03001 	mov	r3, r1
9001e80c:	e1a03083 	lsl	r3, r3, #1
9001e810:	e0833001 	add	r3, r3, r1
9001e814:	e1a03103 	lsl	r3, r3, #2
9001e818:	e0823003 	add	r3, r2, r3
9001e81c:	e2833004 	add	r3, r3, #4
9001e820:	e5930000 	ldr	r0, [r3]
9001e824:	e3042680 	movw	r2, #18048	; 0x4680
9001e828:	e349209a 	movt	r2, #37018	; 0x909a
9001e82c:	e51b1010 	ldr	r1, [fp, #-16]
9001e830:	e1a03001 	mov	r3, r1
9001e834:	e1a03083 	lsl	r3, r3, #1
9001e838:	e0833001 	add	r3, r3, r1
9001e83c:	e1a03103 	lsl	r3, r3, #2
9001e840:	e0823003 	add	r3, r2, r3
9001e844:	e2833004 	add	r3, r3, #4
9001e848:	e5933000 	ldr	r3, [r3]
9001e84c:	e593200c 	ldr	r2, [r3, #12]
9001e850:	e51b3008 	ldr	r3, [fp, #-8]
9001e854:	e0823003 	add	r3, r2, r3
9001e858:	e580300c 	str	r3, [r0, #12]
    memset((void*)buf, 0, len);
9001e85c:	e51b3008 	ldr	r3, [fp, #-8]
9001e860:	e1a02003 	mov	r2, r3
9001e864:	e3a01000 	mov	r1, #0
9001e868:	e51b000c 	ldr	r0, [fp, #-12]
9001e86c:	fa000840 	blx	90020974 <memset>
    /* construct message */
    buf->header.len = len;
9001e870:	e51b3008 	ldr	r3, [fp, #-8]
9001e874:	e6ff2073 	uxth	r2, r3
9001e878:	e51b300c 	ldr	r3, [fp, #-12]
9001e87c:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.nr_args = 0;
9001e880:	e51b200c 	ldr	r2, [fp, #-12]
9001e884:	e5d23000 	ldrb	r3, [r2]
9001e888:	e7c7321f 	bfc	r3, #4, #4
9001e88c:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
9001e890:	e51b200c 	ldr	r2, [fp, #-12]
9001e894:	e5d23000 	ldrb	r3, [r2]
9001e898:	e3833004 	orr	r3, r3, #4
9001e89c:	e5c23000 	strb	r3, [r2]
    buf->header.opcode = irq_forward_table[irq_num].opcode;
9001e8a0:	e3042680 	movw	r2, #18048	; 0x4680
9001e8a4:	e349209a 	movt	r2, #37018	; 0x909a
9001e8a8:	e51b1010 	ldr	r1, [fp, #-16]
9001e8ac:	e1a03001 	mov	r3, r1
9001e8b0:	e1a03083 	lsl	r3, r3, #1
9001e8b4:	e0833001 	add	r3, r3, r1
9001e8b8:	e1a03103 	lsl	r3, r3, #2
9001e8bc:	e0823003 	add	r3, r2, r3
9001e8c0:	e2833008 	add	r3, r3, #8
9001e8c4:	e5933000 	ldr	r3, [r3]
9001e8c8:	e6ef2073 	uxtb	r2, r3
9001e8cc:	e51b300c 	ldr	r3, [fp, #-12]
9001e8d0:	e5c32001 	strb	r2, [r3, #1]
    buf->header.done = 0;
9001e8d4:	e51b200c 	ldr	r2, [fp, #-12]
9001e8d8:	e5d23000 	ldrb	r3, [r2]
9001e8dc:	e7c1309f 	bfc	r3, #1, #1
9001e8e0:	e5c23000 	strb	r3, [r2]
    buf->header.magic = IPC_MSG_MAGIC;
9001e8e4:	e51b200c 	ldr	r2, [fp, #-12]
9001e8e8:	e30d3cba 	movw	r3, #56506	; 0xdcba
9001e8ec:	e34a3bcd 	movt	r3, #43981	; 0xabcd
9001e8f0:	e5823004 	str	r3, [r2, #4]
    buf->header.valid = 1;
9001e8f4:	e51b200c 	ldr	r2, [fp, #-12]
9001e8f8:	e5d23000 	ldrb	r3, [r2]
9001e8fc:	e3833001 	orr	r3, r3, #1
9001e900:	e5c23000 	strb	r3, [r2]
    /* add session head */
    irq_forward_table[irq_num].session->head += len;
9001e904:	e3042680 	movw	r2, #18048	; 0x4680
9001e908:	e349209a 	movt	r2, #37018	; 0x909a
9001e90c:	e51b1010 	ldr	r1, [fp, #-16]
9001e910:	e1a03001 	mov	r3, r1
9001e914:	e1a03083 	lsl	r3, r3, #1
9001e918:	e0833001 	add	r3, r3, r1
9001e91c:	e1a03103 	lsl	r3, r3, #2
9001e920:	e0823003 	add	r3, r2, r3
9001e924:	e2833004 	add	r3, r3, #4
9001e928:	e5930000 	ldr	r0, [r3]
9001e92c:	e3042680 	movw	r2, #18048	; 0x4680
9001e930:	e349209a 	movt	r2, #37018	; 0x909a
9001e934:	e51b1010 	ldr	r1, [fp, #-16]
9001e938:	e1a03001 	mov	r3, r1
9001e93c:	e1a03083 	lsl	r3, r3, #1
9001e940:	e0833001 	add	r3, r3, r1
9001e944:	e1a03103 	lsl	r3, r3, #2
9001e948:	e0823003 	add	r3, r2, r3
9001e94c:	e2833004 	add	r3, r3, #4
9001e950:	e5933000 	ldr	r3, [r3]
9001e954:	e5932008 	ldr	r2, [r3, #8]
9001e958:	e51b3008 	ldr	r3, [fp, #-8]
9001e95c:	e0823003 	add	r3, r2, r3
9001e960:	e5803008 	str	r3, [r0, #8]
}
9001e964:	e320f000 	nop	{0}
9001e968:	e24bd004 	sub	sp, fp, #4
9001e96c:	e8bd8800 	pop	{fp, pc}

9001e970 <user_irq_handler>:

int user_irq_handler(int irq, void* tf, void* arg)
{
9001e970:	e92d4800 	push	{fp, lr}
9001e974:	e28db004 	add	fp, sp, #4
9001e978:	e24dd010 	sub	sp, sp, #16
9001e97c:	e50b0008 	str	r0, [fp, #-8]
9001e980:	e50b100c 	str	r1, [fp, #-12]
9001e984:	e50b2010 	str	r2, [fp, #-16]
    send_irq_to_user(irq);
9001e988:	e51b0008 	ldr	r0, [fp, #-8]
9001e98c:	ebffff7c 	bl	9001e784 <send_irq_to_user>
    next_task_emergency = irq_forward_table[irq].handle_task;
9001e990:	e3042680 	movw	r2, #18048	; 0x4680
9001e994:	e349209a 	movt	r2, #37018	; 0x909a
9001e998:	e51b1008 	ldr	r1, [fp, #-8]
9001e99c:	e1a03001 	mov	r3, r1
9001e9a0:	e1a03083 	lsl	r3, r3, #1
9001e9a4:	e0833001 	add	r3, r3, r1
9001e9a8:	e1a03103 	lsl	r3, r3, #2
9001e9ac:	e0823003 	add	r3, r2, r3
9001e9b0:	e5932000 	ldr	r2, [r3]
9001e9b4:	e3043564 	movw	r3, #17764	; 0x4564
9001e9b8:	e349309a 	movt	r3, #37018	; 0x909a
9001e9bc:	e5832000 	str	r2, [r3]
    xizi_task_manager.cur_task_yield_noschedule();
9001e9c0:	e30333e0 	movw	r3, #13280	; 0x33e0
9001e9c4:	e3493002 	movt	r3, #36866	; 0x9002
9001e9c8:	e5933170 	ldr	r3, [r3, #368]	; 0x170
9001e9cc:	e12fff33 	blx	r3
    return 0;
9001e9d0:	e3a03000 	mov	r3, #0
}
9001e9d4:	e1a00003 	mov	r0, r3
9001e9d8:	e24bd004 	sub	sp, fp, #4
9001e9dc:	e8bd8800 	pop	{fp, pc}

9001e9e0 <sys_register_irq>:

extern int create_session_inner(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, int capacity, struct Session* user_session);
int sys_register_irq(int irq_num, int irq_opcode)
{
9001e9e0:	e92d4800 	push	{fp, lr}
9001e9e4:	e28db004 	add	fp, sp, #4
9001e9e8:	e24dd010 	sub	sp, sp, #16
9001e9ec:	e50b0010 	str	r0, [fp, #-16]
9001e9f0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    static struct TraceTag intr_ac_tag;
    if (!AchieveResourceTag(&intr_ac_tag, RequireRootTag(), "hardkernel/intr-ac-resource")) {
9001e9f4:	ebffe09d 	bl	90016c70 <RequireRootTag>
9001e9f8:	e1a03000 	mov	r3, r0
9001e9fc:	e3022a64 	movw	r2, #10852	; 0x2a64
9001ea00:	e3492002 	movt	r2, #36866	; 0x9002
9001ea04:	e1a01003 	mov	r1, r3
9001ea08:	e3040e00 	movw	r0, #19968	; 0x4e00
9001ea0c:	e349009a 	movt	r0, #37018	; 0x909a
9001ea10:	ebffe59e 	bl	90018090 <AchieveResourceTag>
9001ea14:	e1a03000 	mov	r3, r0
9001ea18:	e2233001 	eor	r3, r3, #1
9001ea1c:	e6ef3073 	uxtb	r3, r3
9001ea20:	e3530000 	cmp	r3, #0
9001ea24:	0a00000a 	beq	9001ea54 <sys_register_irq+0x74>
        ERROR("intr not initialized.\n");
9001ea28:	e3a02051 	mov	r2, #81	; 0x51
9001ea2c:	e3021ac0 	movw	r1, #10944	; 0x2ac0
9001ea30:	e3491002 	movt	r1, #36866	; 0x9002
9001ea34:	e3020a80 	movw	r0, #10880	; 0x2a80
9001ea38:	e3490002 	movt	r0, #36866	; 0x9002
9001ea3c:	ebffda4d 	bl	90015378 <KPrintf>
9001ea40:	e3020a90 	movw	r0, #10896	; 0x2a90
9001ea44:	e3490002 	movt	r0, #36866	; 0x9002
9001ea48:	ebffda4a 	bl	90015378 <KPrintf>
        return -1;
9001ea4c:	e3e03000 	mvn	r3, #0
9001ea50:	ea000043 	b	9001eb64 <sys_register_irq+0x184>
    }
    struct XiziTrapDriver* p_intr_driver = AchieveResource(&intr_ac_tag);
9001ea54:	e3040e00 	movw	r0, #19968	; 0x4e00
9001ea58:	e349009a 	movt	r0, #37018	; 0x909a
9001ea5c:	ebffe59e 	bl	900180dc <AchieveResource>
9001ea60:	e50b0008 	str	r0, [fp, #-8]

    if (p_intr_driver->sw_irqtbl[irq_num].handler != NULL) {
9001ea64:	e51b3008 	ldr	r3, [fp, #-8]
9001ea68:	e51b2010 	ldr	r2, [fp, #-16]
9001ea6c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
9001ea70:	e3530000 	cmp	r3, #0
9001ea74:	0a00000b 	beq	9001eaa8 <sys_register_irq+0xc8>
        ERROR("irq %d is occupied.\n", irq_num);
9001ea78:	e3a02057 	mov	r2, #87	; 0x57
9001ea7c:	e3021ac0 	movw	r1, #10944	; 0x2ac0
9001ea80:	e3491002 	movt	r1, #36866	; 0x9002
9001ea84:	e3020a80 	movw	r0, #10880	; 0x2a80
9001ea88:	e3490002 	movt	r0, #36866	; 0x9002
9001ea8c:	ebffda39 	bl	90015378 <KPrintf>
9001ea90:	e51b1010 	ldr	r1, [fp, #-16]
9001ea94:	e3020aa8 	movw	r0, #10920	; 0x2aa8
9001ea98:	e3490002 	movt	r0, #36866	; 0x9002
9001ea9c:	ebffda35 	bl	90015378 <KPrintf>
        return -1;
9001eaa0:	e3e03000 	mvn	r3, #0
9001eaa4:	ea00002e 	b	9001eb64 <sys_register_irq+0x184>
    }
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001eaa8:	ebffff28 	bl	9001e750 <cur_cpu>
9001eaac:	e1a03000 	mov	r3, r0
9001eab0:	e5933004 	ldr	r3, [r3, #4]
9001eab4:	e50b300c 	str	r3, [fp, #-12]
    irq_forward_table[irq_num].handle_task = cur_task;
9001eab8:	e3042680 	movw	r2, #18048	; 0x4680
9001eabc:	e349209a 	movt	r2, #37018	; 0x909a
9001eac0:	e51b1010 	ldr	r1, [fp, #-16]
9001eac4:	e1a03001 	mov	r3, r1
9001eac8:	e1a03083 	lsl	r3, r3, #1
9001eacc:	e0833001 	add	r3, r3, r1
9001ead0:	e1a03103 	lsl	r3, r3, #2
9001ead4:	e0823003 	add	r3, r2, r3
9001ead8:	e51b200c 	ldr	r2, [fp, #-12]
9001eadc:	e5832000 	str	r2, [r3]
    irq_forward_table[irq_num].opcode = irq_opcode;
9001eae0:	e3042680 	movw	r2, #18048	; 0x4680
9001eae4:	e349209a 	movt	r2, #37018	; 0x909a
9001eae8:	e51b1010 	ldr	r1, [fp, #-16]
9001eaec:	e1a03001 	mov	r3, r1
9001eaf0:	e1a03083 	lsl	r3, r3, #1
9001eaf4:	e0833001 	add	r3, r3, r1
9001eaf8:	e1a03103 	lsl	r3, r3, #2
9001eafc:	e0823003 	add	r3, r2, r3
9001eb00:	e2833008 	add	r3, r3, #8
9001eb04:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001eb08:	e5832000 	str	r2, [r3]
    create_session_inner(&kernel_irq_proxy, cur_task, PAGE_SIZE, irq_forward_table[irq_num].session);
9001eb0c:	e3042680 	movw	r2, #18048	; 0x4680
9001eb10:	e349209a 	movt	r2, #37018	; 0x909a
9001eb14:	e51b1010 	ldr	r1, [fp, #-16]
9001eb18:	e1a03001 	mov	r3, r1
9001eb1c:	e1a03083 	lsl	r3, r3, #1
9001eb20:	e0833001 	add	r3, r3, r1
9001eb24:	e1a03103 	lsl	r3, r3, #2
9001eb28:	e0823003 	add	r3, r2, r3
9001eb2c:	e2833004 	add	r3, r3, #4
9001eb30:	e5933000 	ldr	r3, [r3]
9001eb34:	e3a02a01 	mov	r2, #4096	; 0x1000
9001eb38:	e51b100c 	ldr	r1, [fp, #-12]
9001eb3c:	e30405c0 	movw	r0, #17856	; 0x45c0
9001eb40:	e349009a 	movt	r0, #37018	; 0x909a
9001eb44:	ebfffc50 	bl	9001dc8c <create_session_inner>
    p_intr_driver->bind_irq_handler(irq_num, user_irq_handler);
9001eb48:	e51b3008 	ldr	r3, [fp, #-8]
9001eb4c:	e59332ac 	ldr	r3, [r3, #684]	; 0x2ac
9001eb50:	e30e1970 	movw	r1, #59760	; 0xe970
9001eb54:	e3491001 	movt	r1, #36865	; 0x9001
9001eb58:	e51b0010 	ldr	r0, [fp, #-16]
9001eb5c:	e12fff33 	blx	r3

    return 0;
9001eb60:	e3a03000 	mov	r3, #0
9001eb64:	e1a00003 	mov	r0, r3
9001eb68:	e24bd004 	sub	sp, fp, #4
9001eb6c:	e8bd8800 	pop	{fp, pc}

9001eb70 <cur_cpuid>:
{
9001eb70:	e92d4800 	push	{fp, lr}
9001eb74:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001eb78:	ebffc96c 	bl	90011130 <cpu_get_current>
9001eb7c:	e1a03000 	mov	r3, r0
}
9001eb80:	e1a00003 	mov	r0, r3
9001eb84:	e8bd8800 	pop	{fp, pc}

9001eb88 <cur_cpu>:
{
9001eb88:	e92d4800 	push	{fp, lr}
9001eb8c:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001eb90:	ebfffff6 	bl	9001eb70 <cur_cpuid>
9001eb94:	e1a02000 	mov	r2, r0
9001eb98:	e1a03002 	mov	r3, r2
9001eb9c:	e1a03083 	lsl	r3, r3, #1
9001eba0:	e0833002 	add	r3, r3, r2
9001eba4:	e1a03103 	lsl	r3, r3, #2
9001eba8:	e304256c 	movw	r2, #17772	; 0x456c
9001ebac:	e349209a 	movt	r2, #37018	; 0x909a
9001ebb0:	e0833002 	add	r3, r3, r2
9001ebb4:	e1a00003 	mov	r0, r3
9001ebb8:	e8bd8800 	pop	{fp, pc}

9001ebbc <sys_exit>:
#include "multicores.h"
#include "syscall.h"
#include "task.h"

int sys_exit()
{
9001ebbc:	e92d4800 	push	{fp, lr}
9001ebc0:	e28db004 	add	fp, sp, #4
9001ebc4:	e24dd030 	sub	sp, sp, #48	; 0x30

    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001ebc8:	ebffffee 	bl	9001eb88 <cur_cpu>
9001ebcc:	e1a03000 	mov	r3, r0
9001ebd0:	e5933004 	ldr	r3, [r3, #4]
9001ebd4:	e50b3008 	str	r3, [fp, #-8]
    assert(cur_task != NULL);
9001ebd8:	e51b3008 	ldr	r3, [fp, #-8]
9001ebdc:	e3530000 	cmp	r3, #0
9001ebe0:	1a00000d 	bne	9001ec1c <sys_exit+0x60>
9001ebe4:	e3a0202b 	mov	r2, #43	; 0x2b
9001ebe8:	e3021b54 	movw	r1, #11092	; 0x2b54
9001ebec:	e3491002 	movt	r1, #36866	; 0x9002
9001ebf0:	e3020ad4 	movw	r0, #10964	; 0x2ad4
9001ebf4:	e3490002 	movt	r0, #36866	; 0x9002
9001ebf8:	ebffd9de 	bl	90015378 <KPrintf>
9001ebfc:	e3021ae4 	movw	r1, #10980	; 0x2ae4
9001ec00:	e3491002 	movt	r1, #36866	; 0x9002
9001ec04:	e3020af8 	movw	r0, #11000	; 0x2af8
9001ec08:	e3490002 	movt	r0, #36866	; 0x9002
9001ec0c:	ebffd9d9 	bl	90015378 <KPrintf>
9001ec10:	e3020b08 	movw	r0, #11016	; 0x2b08
9001ec14:	e3490002 	movt	r0, #36866	; 0x9002
9001ec18:	ebffd0c8 	bl	90012f40 <panic>

    /* handle sessions for condition 1, ref. delete_share_pages() */
    // close all server_sessions
    struct server_session* server_session = NULL;
9001ec1c:	e3a03000 	mov	r3, #0
9001ec20:	e50b300c 	str	r3, [fp, #-12]
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->svr_sess_listhead)) {
9001ec24:	ea000035 	b	9001ed00 <sys_exit+0x144>
        server_session = CONTAINER_OF(cur_task->svr_sess_listhead.next, struct server_session, node);
9001ec28:	e51b3008 	ldr	r3, [fp, #-8]
9001ec2c:	e593305c 	ldr	r3, [r3, #92]	; 0x5c
9001ec30:	e50b300c 	str	r3, [fp, #-12]
        // cut the connection from task to session
        if (!server_session->closed) {
9001ec34:	e51b300c 	ldr	r3, [fp, #-12]
9001ec38:	e5d33018 	ldrb	r3, [r3, #24]
9001ec3c:	e2233001 	eor	r3, r3, #1
9001ec40:	e6ef3073 	uxtb	r3, r3
9001ec44:	e3530000 	cmp	r3, #0
9001ec48:	0a00000c 	beq	9001ec80 <sys_exit+0xc4>
            xizi_share_page_manager.unmap_task_share_pages(cur_task, server_session->buf_addr, CLIENT_SESSION_BACKEND(server_session)->nr_pages);
9001ec4c:	e3033564 	movw	r3, #13668	; 0x3564
9001ec50:	e3493002 	movt	r3, #36866	; 0x9002
9001ec54:	e5933004 	ldr	r3, [r3, #4]
9001ec58:	e51b200c 	ldr	r2, [fp, #-12]
9001ec5c:	e5921008 	ldr	r1, [r2, #8]
9001ec60:	e51b200c 	ldr	r2, [fp, #-12]
9001ec64:	e242201c 	sub	r2, r2, #28
9001ec68:	e5922034 	ldr	r2, [r2, #52]	; 0x34
9001ec6c:	e51b0008 	ldr	r0, [fp, #-8]
9001ec70:	e12fff33 	blx	r3
            server_session->closed = true;
9001ec74:	e51b300c 	ldr	r3, [fp, #-12]
9001ec78:	e3a02001 	mov	r2, #1
9001ec7c:	e5c32018 	strb	r2, [r3, #24]
        }
        doubleListDel(&server_session->node);
9001ec80:	e51b300c 	ldr	r3, [fp, #-12]
9001ec84:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    _double_list_del(entry->prev, entry->next);
9001ec88:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ec8c:	e5932004 	ldr	r2, [r3, #4]
9001ec90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ec94:	e5933000 	ldr	r3, [r3]
9001ec98:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9001ec9c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    next->prev = prev;
9001eca0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001eca4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001eca8:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001ecac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001ecb0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001ecb4:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001ecb8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ecbc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001ecc0:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001ecc4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001ecc8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001eccc:	e5832004 	str	r2, [r3, #4]
        SERVER_SESSION_BACKEND(server_session)->server = NULL;
9001ecd0:	e51b300c 	ldr	r3, [fp, #-12]
9001ecd4:	e3a02000 	mov	r2, #0
9001ecd8:	e583203c 	str	r2, [r3, #60]	; 0x3c
        // delete session (also cut connection from session to task)
        if (SERVER_SESSION_BACKEND(server_session)->client_side.closed) {
9001ecdc:	e51b300c 	ldr	r3, [fp, #-12]
9001ece0:	e5d3302c 	ldrb	r3, [r3, #44]	; 0x2c
9001ece4:	e3530000 	cmp	r3, #0
9001ece8:	0a000004 	beq	9001ed00 <sys_exit+0x144>
            xizi_share_page_manager.delete_share_pages(SERVER_SESSION_BACKEND(server_session));
9001ecec:	e3033564 	movw	r3, #13668	; 0x3564
9001ecf0:	e3493002 	movt	r3, #36866	; 0x9002
9001ecf4:	e5933008 	ldr	r3, [r3, #8]
9001ecf8:	e51b000c 	ldr	r0, [fp, #-12]
9001ecfc:	e12fff33 	blx	r3
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->svr_sess_listhead)) {
9001ed00:	e51b3008 	ldr	r3, [fp, #-8]
9001ed04:	e593205c 	ldr	r2, [r3, #92]	; 0x5c
9001ed08:	e51b3008 	ldr	r3, [fp, #-8]
9001ed0c:	e283305c 	add	r3, r3, #92	; 0x5c
9001ed10:	e1520003 	cmp	r2, r3
9001ed14:	1affffc3 	bne	9001ec28 <sys_exit+0x6c>
        }
    }
    // close all client_sessions
    struct client_session* client_session = NULL;
9001ed18:	e3a03000 	mov	r3, #0
9001ed1c:	e50b3010 	str	r3, [fp, #-16]
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->cli_sess_listhead)) {
9001ed20:	ea000039 	b	9001ee0c <sys_exit+0x250>
        client_session = CONTAINER_OF(cur_task->cli_sess_listhead.next, struct client_session, node);
9001ed24:	e51b3008 	ldr	r3, [fp, #-8]
9001ed28:	e5933054 	ldr	r3, [r3, #84]	; 0x54
9001ed2c:	e50b3010 	str	r3, [fp, #-16]
        // cut the connection from task to session
        if (!client_session->closed) {
9001ed30:	e51b3010 	ldr	r3, [fp, #-16]
9001ed34:	e5d33010 	ldrb	r3, [r3, #16]
9001ed38:	e2233001 	eor	r3, r3, #1
9001ed3c:	e6ef3073 	uxtb	r3, r3
9001ed40:	e3530000 	cmp	r3, #0
9001ed44:	0a00000c 	beq	9001ed7c <sys_exit+0x1c0>
            xizi_share_page_manager.unmap_task_share_pages(cur_task, client_session->buf_addr, CLIENT_SESSION_BACKEND(client_session)->nr_pages);
9001ed48:	e3033564 	movw	r3, #13668	; 0x3564
9001ed4c:	e3493002 	movt	r3, #36866	; 0x9002
9001ed50:	e5933004 	ldr	r3, [r3, #4]
9001ed54:	e51b2010 	ldr	r2, [fp, #-16]
9001ed58:	e5921008 	ldr	r1, [r2, #8]
9001ed5c:	e51b2010 	ldr	r2, [fp, #-16]
9001ed60:	e242201c 	sub	r2, r2, #28
9001ed64:	e5922034 	ldr	r2, [r2, #52]	; 0x34
9001ed68:	e51b0008 	ldr	r0, [fp, #-8]
9001ed6c:	e12fff33 	blx	r3
            client_session->closed = true;
9001ed70:	e51b3010 	ldr	r3, [fp, #-16]
9001ed74:	e3a02001 	mov	r2, #1
9001ed78:	e5c32010 	strb	r2, [r3, #16]
        }
        doubleListDel(&client_session->node);
9001ed7c:	e51b3010 	ldr	r3, [fp, #-16]
9001ed80:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    _double_list_del(entry->prev, entry->next);
9001ed84:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ed88:	e5932004 	ldr	r2, [r3, #4]
9001ed8c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001ed90:	e5933000 	ldr	r3, [r3]
9001ed94:	e50b2024 	str	r2, [fp, #-36]	; 0xffffffdc
9001ed98:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    next->prev = prev;
9001ed9c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001eda0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001eda4:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9001eda8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
9001edac:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001edb0:	e5832000 	str	r2, [r3]
    entry->next = entry;
9001edb4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001edb8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001edbc:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9001edc0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001edc4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001edc8:	e5832004 	str	r2, [r3, #4]
        CLIENT_SESSION_BACKEND(client_session)->client = NULL;
9001edcc:	e51b3010 	ldr	r3, [fp, #-16]
9001edd0:	e243301c 	sub	r3, r3, #28
9001edd4:	e3a02000 	mov	r2, #0
9001edd8:	e5832038 	str	r2, [r3, #56]	; 0x38
        // delete session (also cut connection from session to task)
        if (CLIENT_SESSION_BACKEND(client_session)->server_side.closed) {
9001eddc:	e51b3010 	ldr	r3, [fp, #-16]
9001ede0:	e243301c 	sub	r3, r3, #28
9001ede4:	e5d33018 	ldrb	r3, [r3, #24]
9001ede8:	e3530000 	cmp	r3, #0
9001edec:	0a000006 	beq	9001ee0c <sys_exit+0x250>
            xizi_share_page_manager.delete_share_pages(CLIENT_SESSION_BACKEND(client_session));
9001edf0:	e3033564 	movw	r3, #13668	; 0x3564
9001edf4:	e3493002 	movt	r3, #36866	; 0x9002
9001edf8:	e5933008 	ldr	r3, [r3, #8]
9001edfc:	e51b2010 	ldr	r2, [fp, #-16]
9001ee00:	e242201c 	sub	r2, r2, #28
9001ee04:	e1a00002 	mov	r0, r2
9001ee08:	e12fff33 	blx	r3
    while (!IS_DOUBLE_LIST_EMPTY(&cur_task->cli_sess_listhead)) {
9001ee0c:	e51b3008 	ldr	r3, [fp, #-8]
9001ee10:	e5932054 	ldr	r2, [r3, #84]	; 0x54
9001ee14:	e51b3008 	ldr	r3, [fp, #-8]
9001ee18:	e2833054 	add	r3, r3, #84	; 0x54
9001ee1c:	e1520003 	cmp	r2, r3
9001ee20:	1affffbf 	bne	9001ed24 <sys_exit+0x168>
        }
    }

    if (cur_task->server_identifier.meta != NULL) {
9001ee24:	e51b3008 	ldr	r3, [fp, #-8]
9001ee28:	e5933064 	ldr	r3, [r3, #100]	; 0x64
9001ee2c:	e3530000 	cmp	r3, #0
9001ee30:	0a00001d 	beq	9001eeac <sys_exit+0x2f0>
        struct TraceTag server_identifier_owner;
        AchieveResourceTag(&server_identifier_owner, RequireRootTag(), "softkernel/server-identifier");
9001ee34:	ebffdf8d 	bl	90016c70 <RequireRootTag>
9001ee38:	e1a01000 	mov	r1, r0
9001ee3c:	e24b3030 	sub	r3, fp, #48	; 0x30
9001ee40:	e3022b0c 	movw	r2, #11020	; 0x2b0c
9001ee44:	e3492002 	movt	r2, #36866	; 0x9002
9001ee48:	e1a00003 	mov	r0, r3
9001ee4c:	ebffe48f 	bl	90018090 <AchieveResourceTag>
        assert(server_identifier_owner.meta != NULL);
9001ee50:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001ee54:	e3530000 	cmp	r3, #0
9001ee58:	1a00000d 	bne	9001ee94 <sys_exit+0x2d8>
9001ee5c:	e3a02052 	mov	r2, #82	; 0x52
9001ee60:	e3021b54 	movw	r1, #11092	; 0x2b54
9001ee64:	e3491002 	movt	r1, #36866	; 0x9002
9001ee68:	e3020ad4 	movw	r0, #10964	; 0x2ad4
9001ee6c:	e3490002 	movt	r0, #36866	; 0x9002
9001ee70:	ebffd940 	bl	90015378 <KPrintf>
9001ee74:	e3021b2c 	movw	r1, #11052	; 0x2b2c
9001ee78:	e3491002 	movt	r1, #36866	; 0x9002
9001ee7c:	e3020af8 	movw	r0, #11000	; 0x2af8
9001ee80:	e3490002 	movt	r0, #36866	; 0x9002
9001ee84:	ebffd93b 	bl	90015378 <KPrintf>
9001ee88:	e3020b08 	movw	r0, #11016	; 0x2b08
9001ee8c:	e3490002 	movt	r0, #36866	; 0x9002
9001ee90:	ebffd02a 	bl	90012f40 <panic>
        DeleteResource(&cur_task->server_identifier, &server_identifier_owner);
9001ee94:	e51b3008 	ldr	r3, [fp, #-8]
9001ee98:	e2833064 	add	r3, r3, #100	; 0x64
9001ee9c:	e24b2030 	sub	r2, fp, #48	; 0x30
9001eea0:	e1a01002 	mov	r1, r2
9001eea4:	e1a00003 	mov	r0, r3
9001eea8:	ebffe4e6 	bl	90018248 <DeleteResource>
    }

    // delete task for pcb_list
    xizi_task_manager.cur_task_yield_noschedule();
9001eeac:	e30333e0 	movw	r3, #13280	; 0x33e0
9001eeb0:	e3493002 	movt	r3, #36866	; 0x9002
9001eeb4:	e5933170 	ldr	r3, [r3, #368]	; 0x170
9001eeb8:	e12fff33 	blx	r3
    spinlock_lock(&cur_task->lock);
9001eebc:	e51b3008 	ldr	r3, [fp, #-8]
9001eec0:	e2833020 	add	r3, r3, #32
9001eec4:	e1a00003 	mov	r0, r3
9001eec8:	ebffd3ad 	bl	90013d84 <spinlock_lock>
    cur_task->state = DEAD;
9001eecc:	e51b3008 	ldr	r3, [fp, #-8]
9001eed0:	e3a02003 	mov	r2, #3
9001eed4:	e5c32048 	strb	r2, [r3, #72]	; 0x48
    spinlock_unlock(&cur_task->lock);
9001eed8:	e51b3008 	ldr	r3, [fp, #-8]
9001eedc:	e2833020 	add	r3, r3, #32
9001eee0:	e1a00003 	mov	r0, r3
9001eee4:	ebffd3d6 	bl	90013e44 <spinlock_unlock>

    return 0;
9001eee8:	e3a03000 	mov	r3, #0
9001eeec:	e1a00003 	mov	r0, r3
9001eef0:	e24bd004 	sub	sp, fp, #4
9001eef4:	e8bd8800 	pop	{fp, pc}

9001eef8 <cur_cpuid>:
{
9001eef8:	e92d4800 	push	{fp, lr}
9001eefc:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001ef00:	ebffc88a 	bl	90011130 <cpu_get_current>
9001ef04:	e1a03000 	mov	r3, r0
}
9001ef08:	e1a00003 	mov	r0, r3
9001ef0c:	e8bd8800 	pop	{fp, pc}

9001ef10 <cur_cpu>:
{
9001ef10:	e92d4800 	push	{fp, lr}
9001ef14:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001ef18:	ebfffff6 	bl	9001eef8 <cur_cpuid>
9001ef1c:	e1a02000 	mov	r2, r0
9001ef20:	e1a03002 	mov	r3, r2
9001ef24:	e1a03083 	lsl	r3, r3, #1
9001ef28:	e0833002 	add	r3, r3, r2
9001ef2c:	e1a03103 	lsl	r3, r3, #2
9001ef30:	e304256c 	movw	r2, #17772	; 0x456c
9001ef34:	e349209a 	movt	r2, #37018	; 0x909a
9001ef38:	e0833002 	add	r3, r3, r2
9001ef3c:	e1a00003 	mov	r0, r3
9001ef40:	e8bd8800 	pop	{fp, pc}

9001ef44 <_padding>:

extern uint8_t _binary_fs_img_start[], _binary_fs_img_end[];

/// @brief Padding task name length to TASK_NAME_MAX_LEN
static inline void _padding(char* name)
{
9001ef44:	e92d4800 	push	{fp, lr}
9001ef48:	e28db004 	add	fp, sp, #4
9001ef4c:	e24dd010 	sub	sp, sp, #16
9001ef50:	e50b0010 	str	r0, [fp, #-16]
    int i;
    size_t length = strlen(name);
9001ef54:	e51b0010 	ldr	r0, [fp, #-16]
9001ef58:	fa0006ae 	blx	90020a18 <strlen>
9001ef5c:	e50b000c 	str	r0, [fp, #-12]
    for (i = length; i < TASK_NAME_MAX_LEN - 1; i++) {
9001ef60:	e51b300c 	ldr	r3, [fp, #-12]
9001ef64:	e50b3008 	str	r3, [fp, #-8]
9001ef68:	ea000007 	b	9001ef8c <_padding+0x48>
        name[i] = ' ';
9001ef6c:	e51b3008 	ldr	r3, [fp, #-8]
9001ef70:	e51b2010 	ldr	r2, [fp, #-16]
9001ef74:	e0823003 	add	r3, r2, r3
9001ef78:	e3a02020 	mov	r2, #32
9001ef7c:	e5c32000 	strb	r2, [r3]
    for (i = length; i < TASK_NAME_MAX_LEN - 1; i++) {
9001ef80:	e51b3008 	ldr	r3, [fp, #-8]
9001ef84:	e2833001 	add	r3, r3, #1
9001ef88:	e50b3008 	str	r3, [fp, #-8]
9001ef8c:	e51b3008 	ldr	r3, [fp, #-8]
9001ef90:	e353000e 	cmp	r3, #14
9001ef94:	dafffff4 	ble	9001ef6c <_padding+0x28>
    }
    name[i] = '\0';
9001ef98:	e51b3008 	ldr	r3, [fp, #-8]
9001ef9c:	e51b2010 	ldr	r2, [fp, #-16]
9001efa0:	e0823003 	add	r3, r2, r3
9001efa4:	e3a02000 	mov	r2, #0
9001efa8:	e5c32000 	strb	r2, [r3]
    return;
9001efac:	e320f000 	nop	{0}
}
9001efb0:	e24bd004 	sub	sp, fp, #4
9001efb4:	e8bd8800 	pop	{fp, pc}

9001efb8 <show_tasks>:

void show_tasks(void)
{
9001efb8:	e92d4800 	push	{fp, lr}
9001efbc:	e28db004 	add	fp, sp, #4
9001efc0:	e24dd010 	sub	sp, sp, #16
    struct TaskMicroDescriptor* task = NULL;
9001efc4:	e3a03000 	mov	r3, #0
9001efc8:	e50b3008 	str	r3, [fp, #-8]
    DEBUG_PRINTF("******************************************************\n");
9001efcc:	e3020b60 	movw	r0, #11104	; 0x2b60
9001efd0:	e3490002 	movt	r0, #36866	; 0x9002
9001efd4:	ebffd8e7 	bl	90015378 <KPrintf>
    DEBUG_PRINTF("STAT     ID   TASK            PRI   LEFT_TICKS\n");
9001efd8:	e3020b98 	movw	r0, #11160	; 0x2b98
9001efdc:	e3490002 	movt	r0, #36866	; 0x9002
9001efe0:	ebffd8e4 	bl	90015378 <KPrintf>
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
9001efe4:	e3a03000 	mov	r3, #0
9001efe8:	e50b300c 	str	r3, [fp, #-12]
9001efec:	ea000054 	b	9001f144 <show_tasks+0x18c>
        if (IS_DOUBLE_LIST_EMPTY(&xizi_task_manager.task_list_head[i])) {
9001eff0:	e30333e0 	movw	r3, #13280	; 0x33e0
9001eff4:	e3493002 	movt	r3, #36866	; 0x9002
9001eff8:	e51b200c 	ldr	r2, [fp, #-12]
9001effc:	e2822004 	add	r2, r2, #4
9001f000:	e7932182 	ldr	r2, [r3, r2, lsl #3]
9001f004:	e51b300c 	ldr	r3, [fp, #-12]
9001f008:	e2833004 	add	r3, r3, #4
9001f00c:	e1a01183 	lsl	r1, r3, #3
9001f010:	e30333e0 	movw	r3, #13280	; 0x33e0
9001f014:	e3493002 	movt	r3, #36866	; 0x9002
9001f018:	e0813003 	add	r3, r1, r3
9001f01c:	e1520003 	cmp	r2, r3
9001f020:	0a000043 	beq	9001f134 <show_tasks+0x17c>
            continue;
        }
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
9001f024:	e30333e0 	movw	r3, #13280	; 0x33e0
9001f028:	e3493002 	movt	r3, #36866	; 0x9002
9001f02c:	e51b200c 	ldr	r2, [fp, #-12]
9001f030:	e2822004 	add	r2, r2, #4
9001f034:	e7933182 	ldr	r3, [r3, r2, lsl #3]
9001f038:	e50b3008 	str	r3, [fp, #-8]
9001f03c:	ea000032 	b	9001f10c <show_tasks+0x154>
        {
            if (task->state == INIT)
9001f040:	e51b3008 	ldr	r3, [fp, #-8]
9001f044:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001f048:	e3530000 	cmp	r3, #0
9001f04c:	1a000003 	bne	9001f060 <show_tasks+0xa8>
                DEBUG_PRINTF("   INIT ");
9001f050:	e3020bc8 	movw	r0, #11208	; 0x2bc8
9001f054:	e3490002 	movt	r0, #36866	; 0x9002
9001f058:	ebffd8c6 	bl	90015378 <KPrintf>
9001f05c:	ea000016 	b	9001f0bc <show_tasks+0x104>
            else if (task->state == READY)
9001f060:	e51b3008 	ldr	r3, [fp, #-8]
9001f064:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001f068:	e3530001 	cmp	r3, #1
9001f06c:	1a000003 	bne	9001f080 <show_tasks+0xc8>
                DEBUG_PRINTF("  READY ");
9001f070:	e3020bd4 	movw	r0, #11220	; 0x2bd4
9001f074:	e3490002 	movt	r0, #36866	; 0x9002
9001f078:	ebffd8be 	bl	90015378 <KPrintf>
9001f07c:	ea00000e 	b	9001f0bc <show_tasks+0x104>
            else if (task->state == RUNNING)
9001f080:	e51b3008 	ldr	r3, [fp, #-8]
9001f084:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001f088:	e3530002 	cmp	r3, #2
9001f08c:	1a000003 	bne	9001f0a0 <show_tasks+0xe8>
                DEBUG_PRINTF("RUNNING ");
9001f090:	e3020be0 	movw	r0, #11232	; 0x2be0
9001f094:	e3490002 	movt	r0, #36866	; 0x9002
9001f098:	ebffd8b6 	bl	90015378 <KPrintf>
9001f09c:	ea000006 	b	9001f0bc <show_tasks+0x104>
            else if (task->state == DEAD)
9001f0a0:	e51b3008 	ldr	r3, [fp, #-8]
9001f0a4:	e5d33048 	ldrb	r3, [r3, #72]	; 0x48
9001f0a8:	e3530003 	cmp	r3, #3
9001f0ac:	1a000002 	bne	9001f0bc <show_tasks+0x104>
                DEBUG_PRINTF("   DEAD ");
9001f0b0:	e3020bec 	movw	r0, #11244	; 0x2bec
9001f0b4:	e3490002 	movt	r0, #36866	; 0x9002
9001f0b8:	ebffd8ae 	bl	90015378 <KPrintf>

            _padding(task->name);
9001f0bc:	e51b3008 	ldr	r3, [fp, #-8]
9001f0c0:	e2833094 	add	r3, r3, #148	; 0x94
9001f0c4:	e1a00003 	mov	r0, r3
9001f0c8:	ebffff9d 	bl	9001ef44 <_padding>
            DEBUG_PRINTF("  %d   %s  %d       %d\n", task->pid, task->name, task->priority, task->remain_tick);
9001f0cc:	e51b3008 	ldr	r3, [fp, #-8]
9001f0d0:	e5931040 	ldr	r1, [r3, #64]	; 0x40
9001f0d4:	e51b3008 	ldr	r3, [fp, #-8]
9001f0d8:	e2832094 	add	r2, r3, #148	; 0x94
9001f0dc:	e51b3008 	ldr	r3, [fp, #-8]
9001f0e0:	e593008c 	ldr	r0, [r3, #140]	; 0x8c
9001f0e4:	e51b3008 	ldr	r3, [fp, #-8]
9001f0e8:	e593307c 	ldr	r3, [r3, #124]	; 0x7c
9001f0ec:	e58d3000 	str	r3, [sp]
9001f0f0:	e1a03000 	mov	r3, r0
9001f0f4:	e3020bf8 	movw	r0, #11256	; 0x2bf8
9001f0f8:	e3490002 	movt	r0, #36866	; 0x9002
9001f0fc:	ebffd89d 	bl	90015378 <KPrintf>
        DOUBLE_LIST_FOR_EACH_ENTRY(task, &xizi_task_manager.task_list_head[i], node)
9001f100:	e51b3008 	ldr	r3, [fp, #-8]
9001f104:	e5933000 	ldr	r3, [r3]
9001f108:	e50b3008 	str	r3, [fp, #-8]
9001f10c:	e51b2008 	ldr	r2, [fp, #-8]
9001f110:	e51b300c 	ldr	r3, [fp, #-12]
9001f114:	e2833004 	add	r3, r3, #4
9001f118:	e1a01183 	lsl	r1, r3, #3
9001f11c:	e30333e0 	movw	r3, #13280	; 0x33e0
9001f120:	e3493002 	movt	r3, #36866	; 0x9002
9001f124:	e0813003 	add	r3, r1, r3
9001f128:	e1520003 	cmp	r2, r3
9001f12c:	1affffc3 	bne	9001f040 <show_tasks+0x88>
9001f130:	ea000000 	b	9001f138 <show_tasks+0x180>
            continue;
9001f134:	e320f000 	nop	{0}
    for (int i = 0; i < TASK_MAX_PRIORITY; i++) {
9001f138:	e51b300c 	ldr	r3, [fp, #-12]
9001f13c:	e2833001 	add	r3, r3, #1
9001f140:	e50b300c 	str	r3, [fp, #-12]
9001f144:	e51b300c 	ldr	r3, [fp, #-12]
9001f148:	e353001f 	cmp	r3, #31
9001f14c:	daffffa7 	ble	9001eff0 <show_tasks+0x38>
        }
    }
    DEBUG_PRINTF("******************************************************\n");
9001f150:	e3020b60 	movw	r0, #11104	; 0x2b60
9001f154:	e3490002 	movt	r0, #36866	; 0x9002
9001f158:	ebffd886 	bl	90015378 <KPrintf>
    return;
9001f15c:	e320f000 	nop	{0}
}
9001f160:	e24bd004 	sub	sp, fp, #4
9001f164:	e8bd8800 	pop	{fp, pc}

9001f168 <show_mem>:

extern struct KBuddy user_phy_freemem_buddy;
extern struct KBuddy kern_virtmem_buddy;
extern uint32_t kernel_data_end[];
void show_mem(void)
{
9001f168:	e92d4800 	push	{fp, lr}
9001f16c:	e28db004 	add	fp, sp, #4
9001f170:	e24dd010 	sub	sp, sp, #16
    DEBUG_PRINTF("*********************************************************\n");
9001f174:	e3020c10 	movw	r0, #11280	; 0x2c10
9001f178:	e3490002 	movt	r0, #36866	; 0x9002
9001f17c:	ebffd87d 	bl	90015378 <KPrintf>
    DEBUG_PRINTF(" TOTAL(KB)        USED(KB)        FREE(KB) \n");
9001f180:	e3020c4c 	movw	r0, #11340	; 0x2c4c
9001f184:	e3490002 	movt	r0, #36866	; 0x9002
9001f188:	ebffd87a 	bl	90015378 <KPrintf>

    uint32_t total = (PHY_MEM_STOP - V2P(kernel_data_end)) >> 10;
9001f18c:	e3053000 	movw	r3, #20480	; 0x5000
9001f190:	e349309a 	movt	r3, #37018	; 0x909a
9001f194:	e263320d 	rsb	r3, r3, #-805306368	; 0xd0000000
9001f198:	e1a03523 	lsr	r3, r3, #10
9001f19c:	e50b3010 	str	r3, [fp, #-16]
    uint32_t used = 0;
9001f1a0:	e3a03000 	mov	r3, #0
9001f1a4:	e50b3008 	str	r3, [fp, #-8]
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
9001f1a8:	e3a03000 	mov	r3, #0
9001f1ac:	e50b300c 	str	r3, [fp, #-12]
9001f1b0:	ea000022 	b	9001f240 <show_mem+0xd8>
        used += user_phy_freemem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
9001f1b4:	e3042360 	movw	r2, #17248	; 0x4360
9001f1b8:	e349201a 	movt	r2, #36890	; 0x901a
9001f1bc:	e51b100c 	ldr	r1, [fp, #-12]
9001f1c0:	e1a03001 	mov	r3, r1
9001f1c4:	e1a03083 	lsl	r3, r3, #1
9001f1c8:	e0833001 	add	r3, r3, r1
9001f1cc:	e1a03103 	lsl	r3, r3, #2
9001f1d0:	e0823003 	add	r3, r2, r3
9001f1d4:	e2833040 	add	r3, r3, #64	; 0x40
9001f1d8:	e5932000 	ldr	r2, [r3]
9001f1dc:	e51b300c 	ldr	r3, [fp, #-12]
9001f1e0:	e1a03312 	lsl	r3, r2, r3
9001f1e4:	e1a03603 	lsl	r3, r3, #12
9001f1e8:	e51b2008 	ldr	r2, [fp, #-8]
9001f1ec:	e0823003 	add	r3, r2, r3
9001f1f0:	e50b3008 	str	r3, [fp, #-8]
        used += kern_virtmem_buddy.free_list[j].n_free_pages * (1 << j) * PAGE_SIZE;
9001f1f4:	e3042440 	movw	r2, #17472	; 0x4440
9001f1f8:	e349205a 	movt	r2, #36954	; 0x905a
9001f1fc:	e51b100c 	ldr	r1, [fp, #-12]
9001f200:	e1a03001 	mov	r3, r1
9001f204:	e1a03083 	lsl	r3, r3, #1
9001f208:	e0833001 	add	r3, r3, r1
9001f20c:	e1a03103 	lsl	r3, r3, #2
9001f210:	e0823003 	add	r3, r2, r3
9001f214:	e2833040 	add	r3, r3, #64	; 0x40
9001f218:	e5932000 	ldr	r2, [r3]
9001f21c:	e51b300c 	ldr	r3, [fp, #-12]
9001f220:	e1a03312 	lsl	r3, r2, r3
9001f224:	e1a03603 	lsl	r3, r3, #12
9001f228:	e51b2008 	ldr	r2, [fp, #-8]
9001f22c:	e0823003 	add	r3, r2, r3
9001f230:	e50b3008 	str	r3, [fp, #-8]
    for (int j = 0; j < MAX_BUDDY_ORDER; j++) {
9001f234:	e51b300c 	ldr	r3, [fp, #-12]
9001f238:	e2833001 	add	r3, r3, #1
9001f23c:	e50b300c 	str	r3, [fp, #-12]
9001f240:	e51b300c 	ldr	r3, [fp, #-12]
9001f244:	e3530009 	cmp	r3, #9
9001f248:	daffffd9 	ble	9001f1b4 <show_mem+0x4c>
    }
    used = used >> 10;
9001f24c:	e51b3008 	ldr	r3, [fp, #-8]
9001f250:	e1a03523 	lsr	r3, r3, #10
9001f254:	e50b3008 	str	r3, [fp, #-8]

    DEBUG_PRINTF(" %d           %d           %d\n", total, total - used, used);
9001f258:	e51b2010 	ldr	r2, [fp, #-16]
9001f25c:	e51b3008 	ldr	r3, [fp, #-8]
9001f260:	e0422003 	sub	r2, r2, r3
9001f264:	e51b3008 	ldr	r3, [fp, #-8]
9001f268:	e51b1010 	ldr	r1, [fp, #-16]
9001f26c:	e3020c7c 	movw	r0, #11388	; 0x2c7c
9001f270:	e3490002 	movt	r0, #36866	; 0x9002
9001f274:	ebffd83f 	bl	90015378 <KPrintf>
    DEBUG_PRINTF("*********************************************************\n");
9001f278:	e3020c10 	movw	r0, #11280	; 0x2c10
9001f27c:	e3490002 	movt	r0, #36866	; 0x9002
9001f280:	ebffd83c 	bl	90015378 <KPrintf>
    return;
9001f284:	e320f000 	nop	{0}
}
9001f288:	e24bd004 	sub	sp, fp, #4
9001f28c:	e8bd8800 	pop	{fp, pc}

9001f290 <show_cpu>:

void show_cpu(void)
{
9001f290:	e92d4800 	push	{fp, lr}
9001f294:	e28db004 	add	fp, sp, #4
9001f298:	e24dd010 	sub	sp, sp, #16
    DEBUG_PRINTF("**********************************************************\n");
9001f29c:	e3020c9c 	movw	r0, #11420	; 0x2c9c
9001f2a0:	e3490002 	movt	r0, #36866	; 0x9002
9001f2a4:	ebffd833 	bl	90015378 <KPrintf>
#ifdef ARCH_SMP
    /// @todo support smp
    KPrintf(" cpu  VALUE \n");
#endif

    int cpu_id = 0;
9001f2a8:	e3a03000 	mov	r3, #0
9001f2ac:	e50b3008 	str	r3, [fp, #-8]

    struct TaskMicroDescriptor* current_task = cur_cpu()->task;
9001f2b0:	ebffff16 	bl	9001ef10 <cur_cpu>
9001f2b4:	e1a03000 	mov	r3, r0
9001f2b8:	e5933004 	ldr	r3, [r3, #4]
9001f2bc:	e50b300c 	str	r3, [fp, #-12]
    assert(current_task != NULL);
9001f2c0:	e51b300c 	ldr	r3, [fp, #-12]
9001f2c4:	e3530000 	cmp	r3, #0
9001f2c8:	1a00000d 	bne	9001f304 <show_cpu+0x74>
9001f2cc:	e3a02073 	mov	r2, #115	; 0x73
9001f2d0:	e3021da0 	movw	r1, #11680	; 0x2da0
9001f2d4:	e3491002 	movt	r1, #36866	; 0x9002
9001f2d8:	e3020cd8 	movw	r0, #11480	; 0x2cd8
9001f2dc:	e3490002 	movt	r0, #36866	; 0x9002
9001f2e0:	ebffd824 	bl	90015378 <KPrintf>
9001f2e4:	e3021ce8 	movw	r1, #11496	; 0x2ce8
9001f2e8:	e3491002 	movt	r1, #36866	; 0x9002
9001f2ec:	e3020d00 	movw	r0, #11520	; 0x2d00
9001f2f0:	e3490002 	movt	r0, #36866	; 0x9002
9001f2f4:	ebffd81f 	bl	90015378 <KPrintf>
9001f2f8:	e3020d10 	movw	r0, #11536	; 0x2d10
9001f2fc:	e3490002 	movt	r0, #36866	; 0x9002
9001f300:	ebffcf0e 	bl	90012f40 <panic>

    _padding(current_task->name);
9001f304:	e51b300c 	ldr	r3, [fp, #-12]
9001f308:	e2833094 	add	r3, r3, #148	; 0x94
9001f30c:	e1a00003 	mov	r0, r3
9001f310:	ebffff0b 	bl	9001ef44 <_padding>

    DEBUG_PRINTF(" ID  COMMAND        USED_TICKS  FREE_TICKS \n");
9001f314:	e3020d14 	movw	r0, #11540	; 0x2d14
9001f318:	e3490002 	movt	r0, #36866	; 0x9002
9001f31c:	ebffd815 	bl	90015378 <KPrintf>
    DEBUG_PRINTF(" %d   %s   %d          %d\n", cpu_id, current_task->name, TASK_CLOCK_TICK - current_task->remain_tick, current_task->remain_tick);
9001f320:	e51b300c 	ldr	r3, [fp, #-12]
9001f324:	e2832094 	add	r2, r3, #148	; 0x94
9001f328:	e51b300c 	ldr	r3, [fp, #-12]
9001f32c:	e593307c 	ldr	r3, [r3, #124]	; 0x7c
9001f330:	e2631032 	rsb	r1, r3, #50	; 0x32
9001f334:	e51b300c 	ldr	r3, [fp, #-12]
9001f338:	e593307c 	ldr	r3, [r3, #124]	; 0x7c
9001f33c:	e58d3000 	str	r3, [sp]
9001f340:	e1a03001 	mov	r3, r1
9001f344:	e51b1008 	ldr	r1, [fp, #-8]
9001f348:	e3020d44 	movw	r0, #11588	; 0x2d44
9001f34c:	e3490002 	movt	r0, #36866	; 0x9002
9001f350:	ebffd808 	bl	90015378 <KPrintf>

    DEBUG_PRINTF("***********************************************************\n");
9001f354:	e3020d60 	movw	r0, #11616	; 0x2d60
9001f358:	e3490002 	movt	r0, #36866	; 0x9002
9001f35c:	ebffd805 	bl	90015378 <KPrintf>
    return;
9001f360:	e320f000 	nop	{0}
}
9001f364:	e24bd004 	sub	sp, fp, #4
9001f368:	e8bd8800 	pop	{fp, pc}

9001f36c <sys_state>:

int sys_state(sys_state_option option, sys_state_info* info)
{
9001f36c:	e92d4800 	push	{fp, lr}
9001f370:	e28db004 	add	fp, sp, #4
9001f374:	e24dd008 	sub	sp, sp, #8
9001f378:	e1a03000 	mov	r3, r0
9001f37c:	e50b100c 	str	r1, [fp, #-12]
9001f380:	e54b3005 	strb	r3, [fp, #-5]
    if (option == SYS_STATE_MEMBLOCK_INFO) {
9001f384:	e55b3005 	ldrb	r3, [fp, #-5]
9001f388:	e3530003 	cmp	r3, #3
9001f38c:	1a00000a 	bne	9001f3bc <sys_state+0x50>
        info->memblock_info.memblock_start = (uintptr_t)V2P(_binary_fs_img_start);
9001f390:	e3043000 	movw	r3, #16384	; 0x4000
9001f394:	e3493002 	movt	r3, #36866	; 0x9002
9001f398:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
9001f39c:	e51b300c 	ldr	r3, [fp, #-12]
9001f3a0:	e5832000 	str	r2, [r3]
        info->memblock_info.memblock_end = (uintptr_t)V2P(_binary_fs_img_end);
9001f3a4:	e3043000 	movw	r3, #16384	; 0x4000
9001f3a8:	e3493012 	movt	r3, #36882	; 0x9012
9001f3ac:	e2832102 	add	r2, r3, #-2147483648	; 0x80000000
9001f3b0:	e51b300c 	ldr	r3, [fp, #-12]
9001f3b4:	e5832004 	str	r2, [r3, #4]
9001f3b8:	ea000020 	b	9001f440 <sys_state+0xd4>
    } else if (option == SYS_STATE_GET_HEAP_BASE) {
9001f3bc:	e55b3005 	ldrb	r3, [fp, #-5]
9001f3c0:	e3530002 	cmp	r3, #2
9001f3c4:	1a000004 	bne	9001f3dc <sys_state+0x70>
        return cur_cpu()->task->mem_size;
9001f3c8:	ebfffed0 	bl	9001ef10 <cur_cpu>
9001f3cc:	e1a03000 	mov	r3, r0
9001f3d0:	e5933004 	ldr	r3, [r3, #4]
9001f3d4:	e5933090 	ldr	r3, [r3, #144]	; 0x90
9001f3d8:	ea000019 	b	9001f444 <sys_state+0xd8>
    } else if (option == SYS_STATE_SET_TASK_PRIORITY) {
9001f3dc:	e55b3005 	ldrb	r3, [fp, #-5]
9001f3e0:	e3530001 	cmp	r3, #1
9001f3e4:	1a000007 	bne	9001f408 <sys_state+0x9c>
        xizi_task_manager.set_cur_task_priority(info->priority);
9001f3e8:	e30333e0 	movw	r3, #13280	; 0x33e0
9001f3ec:	e3493002 	movt	r3, #36866	; 0x9002
9001f3f0:	e5933174 	ldr	r3, [r3, #372]	; 0x174
9001f3f4:	e51b200c 	ldr	r2, [fp, #-12]
9001f3f8:	e5922000 	ldr	r2, [r2]
9001f3fc:	e1a00002 	mov	r0, r2
9001f400:	e12fff33 	blx	r3
9001f404:	ea00000d 	b	9001f440 <sys_state+0xd4>
    } else if (option == SYS_STATE_SHOW_TASKS) {
9001f408:	e55b3005 	ldrb	r3, [fp, #-5]
9001f40c:	e3530004 	cmp	r3, #4
9001f410:	1a000001 	bne	9001f41c <sys_state+0xb0>
        show_tasks();
9001f414:	ebfffee7 	bl	9001efb8 <show_tasks>
9001f418:	ea000008 	b	9001f440 <sys_state+0xd4>
    } else if (option == SYS_STATE_SHOW_MEM_INFO) {
9001f41c:	e55b3005 	ldrb	r3, [fp, #-5]
9001f420:	e3530005 	cmp	r3, #5
9001f424:	1a000001 	bne	9001f430 <sys_state+0xc4>
        show_mem();
9001f428:	ebffff4e 	bl	9001f168 <show_mem>
9001f42c:	ea000003 	b	9001f440 <sys_state+0xd4>
    } else if (option == SYS_STATE_SHOW_CPU_INFO) {
9001f430:	e55b3005 	ldrb	r3, [fp, #-5]
9001f434:	e3530006 	cmp	r3, #6
9001f438:	1a000000 	bne	9001f440 <sys_state+0xd4>
        show_cpu();
9001f43c:	ebffff93 	bl	9001f290 <show_cpu>
    }

    return 0;
9001f440:	e3a03000 	mov	r3, #0
9001f444:	e1a00003 	mov	r0, r3
9001f448:	e24bd004 	sub	sp, fp, #4
9001f44c:	e8bd8800 	pop	{fp, pc}

9001f450 <cur_cpuid>:
{
9001f450:	e92d4800 	push	{fp, lr}
9001f454:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001f458:	ebffc734 	bl	90011130 <cpu_get_current>
9001f45c:	e1a03000 	mov	r3, r0
}
9001f460:	e1a00003 	mov	r0, r3
9001f464:	e8bd8800 	pop	{fp, pc}

9001f468 <cur_cpu>:
{
9001f468:	e92d4800 	push	{fp, lr}
9001f46c:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001f470:	ebfffff6 	bl	9001f450 <cur_cpuid>
9001f474:	e1a02000 	mov	r2, r0
9001f478:	e1a03002 	mov	r3, r2
9001f47c:	e1a03083 	lsl	r3, r3, #1
9001f480:	e0833002 	add	r3, r3, r2
9001f484:	e1a03103 	lsl	r3, r3, #2
9001f488:	e304256c 	movw	r2, #17772	; 0x456c
9001f48c:	e349209a 	movt	r2, #37018	; 0x909a
9001f490:	e0833002 	add	r3, r3, r2
9001f494:	e1a00003 	mov	r0, r3
9001f498:	e8bd8800 	pop	{fp, pc}

9001f49c <sys_mmap>:
#include "share_page.h"
#include "syscall.h"
#include "task.h"

int sys_mmap(uintptr_t vaddr, uintptr_t paddr, int len, int is_dev)
{
9001f49c:	e92d4810 	push	{r4, fp, lr}
9001f4a0:	e28db008 	add	fp, sp, #8
9001f4a4:	e24dd034 	sub	sp, sp, #52	; 0x34
9001f4a8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
9001f4ac:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
9001f4b0:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
9001f4b4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    struct TaskMicroDescriptor* cur_task = cur_cpu()->task;
9001f4b8:	ebffffea 	bl	9001f468 <cur_cpu>
9001f4bc:	e1a03000 	mov	r3, r0
9001f4c0:	e5933004 	ldr	r3, [r3, #4]
9001f4c4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(cur_task != NULL);
9001f4c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001f4cc:	e3530000 	cmp	r3, #0
9001f4d0:	1a00000d 	bne	9001f50c <sys_mmap+0x70>
9001f4d4:	e3a0202a 	mov	r2, #42	; 0x2a
9001f4d8:	e3021de4 	movw	r1, #11748	; 0x2de4
9001f4dc:	e3491002 	movt	r1, #36866	; 0x9002
9001f4e0:	e3020dac 	movw	r0, #11692	; 0x2dac
9001f4e4:	e3490002 	movt	r0, #36866	; 0x9002
9001f4e8:	ebffd7a2 	bl	90015378 <KPrintf>
9001f4ec:	e3021dbc 	movw	r1, #11708	; 0x2dbc
9001f4f0:	e3491002 	movt	r1, #36866	; 0x9002
9001f4f4:	e3020dd0 	movw	r0, #11728	; 0x2dd0
9001f4f8:	e3490002 	movt	r0, #36866	; 0x9002
9001f4fc:	ebffd79d 	bl	90015378 <KPrintf>
9001f500:	e3020de0 	movw	r0, #11744	; 0x2de0
9001f504:	e3490002 	movt	r0, #36866	; 0x9002
9001f508:	ebffce8c 	bl	90012f40 <panic>

    int true_len = ALIGNUP(len, PAGE_SIZE);
9001f50c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
9001f510:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001f514:	e283300f 	add	r3, r3, #15
9001f518:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
9001f51c:	e3c3300f 	bic	r3, r3, #15
9001f520:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4

    if (paddr != (uintptr_t)NULL) {
9001f524:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001f528:	e3530000 	cmp	r3, #0
9001f52c:	0a000016 	beq	9001f58c <sys_mmap+0xf0>
        if (xizi_share_page_manager.task_map_pages(cur_task, vaddr, paddr, true_len / PAGE_SIZE, is_dev) == (uintptr_t)NULL) {
9001f530:	e3033564 	movw	r3, #13668	; 0x3564
9001f534:	e3493002 	movt	r3, #36866	; 0x9002
9001f538:	e593400c 	ldr	r4, [r3, #12]
9001f53c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001f540:	e2832eff 	add	r2, r3, #4080	; 0xff0
9001f544:	e282200f 	add	r2, r2, #15
9001f548:	e3530000 	cmp	r3, #0
9001f54c:	b1a03002 	movlt	r3, r2
9001f550:	a1a03003 	movge	r3, r3
9001f554:	e1a03643 	asr	r3, r3, #12
9001f558:	e1a02003 	mov	r2, r3
9001f55c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001f560:	e58d3000 	str	r3, [sp]
9001f564:	e1a03002 	mov	r3, r2
9001f568:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001f56c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
9001f570:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001f574:	e12fff34 	blx	r4
9001f578:	e1a03000 	mov	r3, r0
9001f57c:	e3530000 	cmp	r3, #0
9001f580:	1a000029 	bne	9001f62c <sys_mmap+0x190>
            return -1;
9001f584:	e3e03000 	mvn	r3, #0
9001f588:	ea00002a 	b	9001f638 <sys_mmap+0x19c>
        }
    } else {
        int load_len = 0;
9001f58c:	e3a03000 	mov	r3, #0
9001f590:	e50b3010 	str	r3, [fp, #-16]
        uintptr_t load_vaddr = vaddr;
9001f594:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f598:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        while (load_len < true_len) {
9001f59c:	ea00001e 	b	9001f61c <sys_mmap+0x180>
            char* paddr = raw_alloc(PAGE_SIZE);
9001f5a0:	e3a00a01 	mov	r0, #4096	; 0x1000
9001f5a4:	ebffe5e6 	bl	90018d44 <raw_alloc>
9001f5a8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
            if (paddr == NULL) {
9001f5ac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f5b0:	e3530000 	cmp	r3, #0
9001f5b4:	1a000001 	bne	9001f5c0 <sys_mmap+0x124>
                return -1;
9001f5b8:	e3e03000 	mvn	r3, #0
9001f5bc:	ea00001d 	b	9001f638 <sys_mmap+0x19c>
            }
            if (xizi_share_page_manager.task_map_pages(cur_task, load_vaddr, (uintptr_t)paddr, 1, false) == (uintptr_t)NULL) {
9001f5c0:	e3033564 	movw	r3, #13668	; 0x3564
9001f5c4:	e3493002 	movt	r3, #36866	; 0x9002
9001f5c8:	e593400c 	ldr	r4, [r3, #12]
9001f5cc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001f5d0:	e3a03000 	mov	r3, #0
9001f5d4:	e58d3000 	str	r3, [sp]
9001f5d8:	e3a03001 	mov	r3, #1
9001f5dc:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001f5e0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001f5e4:	e12fff34 	blx	r4
9001f5e8:	e1a03000 	mov	r3, r0
9001f5ec:	e3530000 	cmp	r3, #0
9001f5f0:	1a000003 	bne	9001f604 <sys_mmap+0x168>
                raw_free(paddr);
9001f5f4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001f5f8:	ebffe5e3 	bl	90018d8c <raw_free>
                return -1;
9001f5fc:	e3e03000 	mvn	r3, #0
9001f600:	ea00000c 	b	9001f638 <sys_mmap+0x19c>
            }
            load_vaddr += PAGE_SIZE;
9001f604:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001f608:	e2833a01 	add	r3, r3, #4096	; 0x1000
9001f60c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            load_len += PAGE_SIZE;
9001f610:	e51b3010 	ldr	r3, [fp, #-16]
9001f614:	e2833a01 	add	r3, r3, #4096	; 0x1000
9001f618:	e50b3010 	str	r3, [fp, #-16]
        while (load_len < true_len) {
9001f61c:	e51b2010 	ldr	r2, [fp, #-16]
9001f620:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001f624:	e1520003 	cmp	r2, r3
9001f628:	baffffdc 	blt	9001f5a0 <sys_mmap+0x104>
        }
    }
    return vaddr + true_len;
9001f62c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001f630:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f634:	e0823003 	add	r3, r2, r3
9001f638:	e1a00003 	mov	r0, r3
9001f63c:	e24bd008 	sub	sp, fp, #8
9001f640:	e8bd8810 	pop	{r4, fp, pc}

9001f644 <cur_cpuid>:
{
9001f644:	e92d4800 	push	{fp, lr}
9001f648:	e28db004 	add	fp, sp, #4
    return cpu_get_current();
9001f64c:	ebffc6b7 	bl	90011130 <cpu_get_current>
9001f650:	e1a03000 	mov	r3, r0
}
9001f654:	e1a00003 	mov	r0, r3
9001f658:	e8bd8800 	pop	{fp, pc}

9001f65c <cur_cpu>:
{
9001f65c:	e92d4800 	push	{fp, lr}
9001f660:	e28db004 	add	fp, sp, #4
    return &global_cpus[cur_cpuid()];
9001f664:	ebfffff6 	bl	9001f644 <cur_cpuid>
9001f668:	e1a02000 	mov	r2, r0
9001f66c:	e1a03002 	mov	r3, r2
9001f670:	e1a03083 	lsl	r3, r3, #1
9001f674:	e0833002 	add	r3, r3, r2
9001f678:	e1a03103 	lsl	r3, r3, #2
9001f67c:	e304256c 	movw	r2, #17772	; 0x456c
9001f680:	e349209a 	movt	r2, #37018	; 0x909a
9001f684:	e0833002 	add	r3, r3, r2
9001f688:	e1a00003 	mov	r0, r3
9001f68c:	e8bd8800 	pop	{fp, pc}

9001f690 <SessionAllocator>:
#include "task.h"

static struct SharePageRightGroup right_group;

static struct slab_allocator* SessionAllocator()
{
9001f690:	e92d4800 	push	{fp, lr}
9001f694:	e28db004 	add	fp, sp, #4
    static bool init = false;
    static struct slab_allocator session_slab;
    if (!init) {
9001f698:	e3043e18 	movw	r3, #19992	; 0x4e18
9001f69c:	e349309a 	movt	r3, #37018	; 0x909a
9001f6a0:	e5d33000 	ldrb	r3, [r3]
9001f6a4:	e2233001 	eor	r3, r3, #1
9001f6a8:	e6ef3073 	uxtb	r3, r3
9001f6ac:	e3530000 	cmp	r3, #0
9001f6b0:	0a000003 	beq	9001f6c4 <SessionAllocator+0x34>
        slab_init(&session_slab, sizeof(struct session_backend));
9001f6b4:	e3a01044 	mov	r1, #68	; 0x44
9001f6b8:	e3040e20 	movw	r0, #20000	; 0x4e20
9001f6bc:	e349009a 	movt	r0, #37018	; 0x909a
9001f6c0:	ebffeb7d 	bl	9001a4bc <slab_init>
    }
    return &session_slab;
9001f6c4:	e3043e20 	movw	r3, #20000	; 0x4e20
9001f6c8:	e349309a 	movt	r3, #37018	; 0x909a
}
9001f6cc:	e1a00003 	mov	r0, r3
9001f6d0:	e8bd8800 	pop	{fp, pc}

9001f6d4 <check_pages_unmapped>:
/// @param task
/// @param vaddr
/// @param nr_pages
/// @return true if mem range is free, false if at least one page inside [vaddr, vaddr + nr_pages * PAGE_SIZE) is mapped
static inline bool check_pages_unmapped(struct TaskMicroDescriptor* task, uintptr_t vaddr, int nr_pages)
{
9001f6d4:	e92d4800 	push	{fp, lr}
9001f6d8:	e28db004 	add	fp, sp, #4
9001f6dc:	e24dd018 	sub	sp, sp, #24
9001f6e0:	e50b0010 	str	r0, [fp, #-16]
9001f6e4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001f6e8:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    static uintptr_t paddr = UINT32_MAX;
    for (uint32_t i = 0; i < nr_pages; i++) {
9001f6ec:	e3a03000 	mov	r3, #0
9001f6f0:	e50b3008 	str	r3, [fp, #-8]
9001f6f4:	ea000018 	b	9001f75c <check_pages_unmapped+0x88>
        if ((paddr = xizi_pager.address_translate(&task->pgdir, vaddr)) != 0) {
9001f6f8:	e30333ac 	movw	r3, #13228	; 0x33ac
9001f6fc:	e3493002 	movt	r3, #36866	; 0x9002
9001f700:	e5933014 	ldr	r3, [r3, #20]
9001f704:	e51b2010 	ldr	r2, [fp, #-16]
9001f708:	e2822050 	add	r2, r2, #80	; 0x50
9001f70c:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001f710:	e1a00002 	mov	r0, r2
9001f714:	e12fff33 	blx	r3
9001f718:	e1a02000 	mov	r2, r0
9001f71c:	e3033574 	movw	r3, #13684	; 0x3574
9001f720:	e3493002 	movt	r3, #36866	; 0x9002
9001f724:	e5832000 	str	r2, [r3]
9001f728:	e3033574 	movw	r3, #13684	; 0x3574
9001f72c:	e3493002 	movt	r3, #36866	; 0x9002
9001f730:	e5933000 	ldr	r3, [r3]
9001f734:	e3530000 	cmp	r3, #0
9001f738:	0a000001 	beq	9001f744 <check_pages_unmapped+0x70>
            return false;
9001f73c:	e3a03000 	mov	r3, #0
9001f740:	ea00000a 	b	9001f770 <check_pages_unmapped+0x9c>
        }
        vaddr += PAGE_SIZE;
9001f744:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001f748:	e2833a01 	add	r3, r3, #4096	; 0x1000
9001f74c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (uint32_t i = 0; i < nr_pages; i++) {
9001f750:	e51b3008 	ldr	r3, [fp, #-8]
9001f754:	e2833001 	add	r3, r3, #1
9001f758:	e50b3008 	str	r3, [fp, #-8]
9001f75c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001f760:	e51b2008 	ldr	r2, [fp, #-8]
9001f764:	e1520003 	cmp	r2, r3
9001f768:	3affffe2 	bcc	9001f6f8 <check_pages_unmapped+0x24>
    }
    return true;
9001f76c:	e3a03001 	mov	r3, #1
}
9001f770:	e1a00003 	mov	r0, r3
9001f774:	e24bd004 	sub	sp, fp, #4
9001f778:	e8bd8800 	pop	{fp, pc}

9001f77c <alloc_share_page_addr>:
/// @param task
/// @param nr_pages continuously map nr_pages
/// @return addr to be mapped, aligned by page
/// @todo optimize, and suppurt multiple pages
static uintptr_t alloc_share_page_addr(struct TaskMicroDescriptor* task, const int nr_pages)
{
9001f77c:	e92d4800 	push	{fp, lr}
9001f780:	e28db004 	add	fp, sp, #4
9001f784:	e24dd010 	sub	sp, sp, #16
9001f788:	e50b0010 	str	r0, [fp, #-16]
9001f78c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    uintptr_t vaddr = USER_IPC_SPACE_BASE;
9001f790:	e3a03207 	mov	r3, #1879048192	; 0x70000000
9001f794:	e50b3008 	str	r3, [fp, #-8]
    while (!check_pages_unmapped(task, vaddr, nr_pages)) {
9001f798:	ea000014 	b	9001f7f0 <alloc_share_page_addr+0x74>
        vaddr += 2 * PAGE_SIZE;
9001f79c:	e51b3008 	ldr	r3, [fp, #-8]
9001f7a0:	e2833a02 	add	r3, r3, #8192	; 0x2000
9001f7a4:	e50b3008 	str	r3, [fp, #-8]
        assert(vaddr % PAGE_SIZE == 0);
9001f7a8:	e51b3008 	ldr	r3, [fp, #-8]
9001f7ac:	e7eb3053 	ubfx	r3, r3, #0, #12
9001f7b0:	e3530000 	cmp	r3, #0
9001f7b4:	0a00000d 	beq	9001f7f0 <alloc_share_page_addr+0x74>
9001f7b8:	e3a0204f 	mov	r2, #79	; 0x4f
9001f7bc:	e3021e54 	movw	r1, #11860	; 0x2e54
9001f7c0:	e3491002 	movt	r1, #36866	; 0x9002
9001f7c4:	e3020df0 	movw	r0, #11760	; 0x2df0
9001f7c8:	e3490002 	movt	r0, #36866	; 0x9002
9001f7cc:	ebffd6e9 	bl	90015378 <KPrintf>
9001f7d0:	e3021e00 	movw	r1, #11776	; 0x2e00
9001f7d4:	e3491002 	movt	r1, #36866	; 0x9002
9001f7d8:	e3020e18 	movw	r0, #11800	; 0x2e18
9001f7dc:	e3490002 	movt	r0, #36866	; 0x9002
9001f7e0:	ebffd6e4 	bl	90015378 <KPrintf>
9001f7e4:	e3020e28 	movw	r0, #11816	; 0x2e28
9001f7e8:	e3490002 	movt	r0, #36866	; 0x9002
9001f7ec:	ebffcdd3 	bl	90012f40 <panic>
    while (!check_pages_unmapped(task, vaddr, nr_pages)) {
9001f7f0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001f7f4:	e51b1008 	ldr	r1, [fp, #-8]
9001f7f8:	e51b0010 	ldr	r0, [fp, #-16]
9001f7fc:	ebffffb4 	bl	9001f6d4 <check_pages_unmapped>
9001f800:	e1a03000 	mov	r3, r0
9001f804:	e2233001 	eor	r3, r3, #1
9001f808:	e6ef3073 	uxtb	r3, r3
9001f80c:	e3530000 	cmp	r3, #0
9001f810:	1affffe1 	bne	9001f79c <alloc_share_page_addr+0x20>
    }
    // now that nr_pages size after vaddr is unmapped
    if (UNLIKELY(vaddr >= USER_IPC_SPACE_TOP)) {
9001f814:	e51b2008 	ldr	r2, [fp, #-8]
9001f818:	e30e3fff 	movw	r3, #61439	; 0xefff
9001f81c:	e3473fff 	movt	r3, #32767	; 0x7fff
9001f820:	e1520003 	cmp	r2, r3
9001f824:	83a03001 	movhi	r3, #1
9001f828:	93a03000 	movls	r3, #0
9001f82c:	e6ef3073 	uxtb	r3, r3
9001f830:	e3530000 	cmp	r3, #0
9001f834:	0a000001 	beq	9001f840 <alloc_share_page_addr+0xc4>
        return (uintptr_t)NULL;
9001f838:	e3a03000 	mov	r3, #0
9001f83c:	ea000000 	b	9001f844 <alloc_share_page_addr+0xc8>
    }
    return vaddr;
9001f840:	e51b3008 	ldr	r3, [fp, #-8]
}
9001f844:	e1a00003 	mov	r0, r3
9001f848:	e24bd004 	sub	sp, fp, #4
9001f84c:	e8bd8800 	pop	{fp, pc}

9001f850 <map_task_share_page>:

static uintptr_t map_task_share_page(struct TaskMicroDescriptor* task, const uintptr_t paddr, const int nr_pages)
{
9001f850:	e92d4810 	push	{r4, fp, lr}
9001f854:	e28db008 	add	fp, sp, #8
9001f858:	e24dd02c 	sub	sp, sp, #44	; 0x2c
9001f85c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001f860:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001f864:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
9001f868:	e3040e08 	movw	r0, #19976	; 0x4e08
9001f86c:	e349009a 	movt	r0, #37018	; 0x909a
9001f870:	ebffe219 	bl	900180dc <AchieveResource>
9001f874:	e50b0010 	str	r0, [fp, #-16]
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
9001f878:	e59f01bc 	ldr	r0, [pc, #444]	; 9001fa3c <map_task_share_page+0x1ec>
9001f87c:	ebffe216 	bl	900180dc <AchieveResource>
9001f880:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec

    spinlock_lock(&task->lock);
9001f884:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f888:	e2833020 	add	r3, r3, #32
9001f88c:	e1a00003 	mov	r0, r3
9001f890:	ebffd13b 	bl	90013d84 <spinlock_lock>
    // map double vaddr page to support uniform ring buffer r/w
    uintptr_t vaddr = alloc_share_page_addr(task, nr_pages * 2);
9001f894:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f898:	e1a03083 	lsl	r3, r3, #1
9001f89c:	e1a01003 	mov	r1, r3
9001f8a0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
9001f8a4:	ebffffb4 	bl	9001f77c <alloc_share_page_addr>
9001f8a8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    if (UNLIKELY(vaddr == 0)) {
9001f8ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001f8b0:	e3530000 	cmp	r3, #0
9001f8b4:	03a03001 	moveq	r3, #1
9001f8b8:	13a03000 	movne	r3, #0
9001f8bc:	e6ef3073 	uxtb	r3, r3
9001f8c0:	e3530000 	cmp	r3, #0
9001f8c4:	0a000005 	beq	9001f8e0 <map_task_share_page+0x90>
        spinlock_unlock(&task->lock);
9001f8c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f8cc:	e2833020 	add	r3, r3, #32
9001f8d0:	e1a00003 	mov	r0, r3
9001f8d4:	ebffd15a 	bl	90013e44 <spinlock_unlock>
        return (uintptr_t)NULL;
9001f8d8:	e3a03000 	mov	r3, #0
9001f8dc:	ea000053 	b	9001fa30 <map_task_share_page+0x1e0>
    }
    if (!xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, false)) {
9001f8e0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001f8e4:	e3493002 	movt	r3, #36866	; 0x9002
9001f8e8:	e5934008 	ldr	r4, [r3, #8]
9001f8ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f8f0:	e5930050 	ldr	r0, [r3, #80]	; 0x50
9001f8f4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f8f8:	e1a03603 	lsl	r3, r3, #12
9001f8fc:	e1a02003 	mov	r2, r3
9001f900:	e3a03000 	mov	r3, #0
9001f904:	e58d3000 	str	r3, [sp]
9001f908:	e1a03002 	mov	r3, r2
9001f90c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001f910:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001f914:	e12fff34 	blx	r4
9001f918:	e1a03000 	mov	r3, r0
9001f91c:	e2233001 	eor	r3, r3, #1
9001f920:	e6ef3073 	uxtb	r3, r3
9001f924:	e3530000 	cmp	r3, #0
9001f928:	0a000005 	beq	9001f944 <map_task_share_page+0xf4>
        spinlock_unlock(&task->lock);
9001f92c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f930:	e2833020 	add	r3, r3, #32
9001f934:	e1a00003 	mov	r0, r3
9001f938:	ebffd141 	bl	90013e44 <spinlock_unlock>
        return (uintptr_t)NULL;
9001f93c:	e3a03000 	mov	r3, #0
9001f940:	ea00003a 	b	9001fa30 <map_task_share_page+0x1e0>
    }
    if (!xizi_pager.map_pages(task->pgdir.pd_addr, vaddr + (nr_pages * PAGE_SIZE), paddr, nr_pages * PAGE_SIZE, false)) {
9001f944:	e30333ac 	movw	r3, #13228	; 0x33ac
9001f948:	e3493002 	movt	r3, #36866	; 0x9002
9001f94c:	e5934008 	ldr	r4, [r3, #8]
9001f950:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f954:	e5930050 	ldr	r0, [r3, #80]	; 0x50
9001f958:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f95c:	e1a03603 	lsl	r3, r3, #12
9001f960:	e1a02003 	mov	r2, r3
9001f964:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001f968:	e0821003 	add	r1, r2, r3
9001f96c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9001f970:	e1a03603 	lsl	r3, r3, #12
9001f974:	e1a02003 	mov	r2, r3
9001f978:	e3a03000 	mov	r3, #0
9001f97c:	e58d3000 	str	r3, [sp]
9001f980:	e1a03002 	mov	r3, r2
9001f984:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
9001f988:	e12fff34 	blx	r4
9001f98c:	e1a03000 	mov	r3, r0
9001f990:	e2233001 	eor	r3, r3, #1
9001f994:	e6ef3073 	uxtb	r3, r3
9001f998:	e3530000 	cmp	r3, #0
9001f99c:	0a00000e 	beq	9001f9dc <map_task_share_page+0x18c>
        xizi_pager.unmap_pages(task->pgdir.pd_addr, vaddr, nr_pages * PAGE_SIZE);
9001f9a0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001f9a4:	e3493002 	movt	r3, #36866	; 0x9002
9001f9a8:	e593300c 	ldr	r3, [r3, #12]
9001f9ac:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9001f9b0:	e5920050 	ldr	r0, [r2, #80]	; 0x50
9001f9b4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001f9b8:	e1a02602 	lsl	r2, r2, #12
9001f9bc:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001f9c0:	e12fff33 	blx	r3
        spinlock_unlock(&task->lock);
9001f9c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f9c8:	e2833020 	add	r3, r3, #32
9001f9cc:	e1a00003 	mov	r0, r3
9001f9d0:	ebffd11b 	bl	90013e44 <spinlock_unlock>
        return (uintptr_t)NULL;
9001f9d4:	e3a03000 	mov	r3, #0
9001f9d8:	ea000014 	b	9001fa30 <map_task_share_page+0x1e0>
    }
    spinlock_unlock(&task->lock);
9001f9dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f9e0:	e2833020 	add	r3, r3, #32
9001f9e4:	e1a00003 	mov	r0, r3
9001f9e8:	ebffd115 	bl	90013e44 <spinlock_unlock>
    if (task == cur_cpu()->task) {
9001f9ec:	ebffff1a 	bl	9001f65c <cur_cpu>
9001f9f0:	e1a03000 	mov	r3, r0
9001f9f4:	e5932004 	ldr	r2, [r3, #4]
9001f9f8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001f9fc:	e1520003 	cmp	r2, r3
9001fa00:	1a000009 	bne	9001fa2c <map_task_share_page+0x1dc>
        p_mmu_driver->TlbFlush(vaddr, 2 * nr_pages * PAGE_SIZE);
9001fa04:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fa08:	e593301c 	ldr	r3, [r3, #28]
9001fa0c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001fa10:	e1a02682 	lsl	r2, r2, #13
9001fa14:	e1a01002 	mov	r1, r2
9001fa18:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
9001fa1c:	e12fff33 	blx	r3
        /// @todo clean range rather than all
        p_dcache_done->flushall();
9001fa20:	e51b3010 	ldr	r3, [fp, #-16]
9001fa24:	e5933018 	ldr	r3, [r3, #24]
9001fa28:	e12fff33 	blx	r3
        // p_dcache_done->flush(vaddr, vaddr + 2 * nr_pages * PAGE_SIZE);
    }
    return vaddr;
9001fa2c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
9001fa30:	e1a00003 	mov	r0, r3
9001fa34:	e24bd008 	sub	sp, fp, #8
9001fa38:	e8bd8810 	pop	{r4, fp, pc}
9001fa3c:	909a4e10 	.word	0x909a4e10

9001fa40 <task_map_pages>:

uintptr_t task_map_pages(struct TaskMicroDescriptor* task, const uintptr_t vaddr, const uintptr_t paddr, const int nr_pages, const int is_dev)
{
9001fa40:	e92d4810 	push	{r4, fp, lr}
9001fa44:	e28db008 	add	fp, sp, #8
9001fa48:	e24dd02c 	sub	sp, sp, #44	; 0x2c
9001fa4c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
9001fa50:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
9001fa54:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
9001fa58:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
9001fa5c:	e3040e08 	movw	r0, #19976	; 0x4e08
9001fa60:	e349009a 	movt	r0, #37018	; 0x909a
9001fa64:	ebffe19c 	bl	900180dc <AchieveResource>
9001fa68:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
9001fa6c:	e59f0128 	ldr	r0, [pc, #296]	; 9001fb9c <task_map_pages+0x15c>
9001fa70:	ebffe199 	bl	900180dc <AchieveResource>
9001fa74:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8

    spinlock_lock(&task->lock);
9001fa78:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001fa7c:	e2833020 	add	r3, r3, #32
9001fa80:	e1a00003 	mov	r0, r3
9001fa84:	ebffd0be 	bl	90013d84 <spinlock_lock>
    bool ret = false;
9001fa88:	e3a03000 	mov	r3, #0
9001fa8c:	e54b300d 	strb	r3, [fp, #-13]
    if (is_dev) {
9001fa90:	e59b3004 	ldr	r3, [fp, #4]
9001fa94:	e3530000 	cmp	r3, #0
9001fa98:	0a000010 	beq	9001fae0 <task_map_pages+0xa0>
        ret = xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, true);
9001fa9c:	e30333ac 	movw	r3, #13228	; 0x33ac
9001faa0:	e3493002 	movt	r3, #36866	; 0x9002
9001faa4:	e5934008 	ldr	r4, [r3, #8]
9001faa8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001faac:	e5930050 	ldr	r0, [r3, #80]	; 0x50
9001fab0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001fab4:	e1a03603 	lsl	r3, r3, #12
9001fab8:	e1a02003 	mov	r2, r3
9001fabc:	e3a03001 	mov	r3, #1
9001fac0:	e58d3000 	str	r3, [sp]
9001fac4:	e1a03002 	mov	r3, r2
9001fac8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001facc:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001fad0:	e12fff34 	blx	r4
9001fad4:	e1a03000 	mov	r3, r0
9001fad8:	e54b300d 	strb	r3, [fp, #-13]
9001fadc:	ea00000f 	b	9001fb20 <task_map_pages+0xe0>
    } else {
        ret = xizi_pager.map_pages(task->pgdir.pd_addr, vaddr, paddr, nr_pages * PAGE_SIZE, false);
9001fae0:	e30333ac 	movw	r3, #13228	; 0x33ac
9001fae4:	e3493002 	movt	r3, #36866	; 0x9002
9001fae8:	e5934008 	ldr	r4, [r3, #8]
9001faec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001faf0:	e5930050 	ldr	r0, [r3, #80]	; 0x50
9001faf4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
9001faf8:	e1a03603 	lsl	r3, r3, #12
9001fafc:	e1a02003 	mov	r2, r3
9001fb00:	e3a03000 	mov	r3, #0
9001fb04:	e58d3000 	str	r3, [sp]
9001fb08:	e1a03002 	mov	r3, r2
9001fb0c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
9001fb10:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
9001fb14:	e12fff34 	blx	r4
9001fb18:	e1a03000 	mov	r3, r0
9001fb1c:	e54b300d 	strb	r3, [fp, #-13]
    }
    spinlock_unlock(&task->lock);
9001fb20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001fb24:	e2833020 	add	r3, r3, #32
9001fb28:	e1a00003 	mov	r0, r3
9001fb2c:	ebffd0c4 	bl	90013e44 <spinlock_unlock>
    if (!ret) {
9001fb30:	e55b300d 	ldrb	r3, [fp, #-13]
9001fb34:	e2233001 	eor	r3, r3, #1
9001fb38:	e6ef3073 	uxtb	r3, r3
9001fb3c:	e3530000 	cmp	r3, #0
9001fb40:	0a000001 	beq	9001fb4c <task_map_pages+0x10c>
        return (uintptr_t)NULL;
9001fb44:	e3a03000 	mov	r3, #0
9001fb48:	ea000010 	b	9001fb90 <task_map_pages+0x150>
    }
    if (task == cur_cpu()->task) {
9001fb4c:	ebfffec2 	bl	9001f65c <cur_cpu>
9001fb50:	e1a03000 	mov	r3, r0
9001fb54:	e5932004 	ldr	r2, [r3, #4]
9001fb58:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9001fb5c:	e1520003 	cmp	r2, r3
9001fb60:	1a000009 	bne	9001fb8c <task_map_pages+0x14c>
        p_mmu_driver->TlbFlush(vaddr, nr_pages * PAGE_SIZE);
9001fb64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001fb68:	e593301c 	ldr	r3, [r3, #28]
9001fb6c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9001fb70:	e1a02602 	lsl	r2, r2, #12
9001fb74:	e1a01002 	mov	r1, r2
9001fb78:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
9001fb7c:	e12fff33 	blx	r3
        /// @todo clean range rather than all
        p_dcache_done->flushall();
9001fb80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fb84:	e5933018 	ldr	r3, [r3, #24]
9001fb88:	e12fff33 	blx	r3
        // p_dcache_done->flush(vaddr, vaddr + nr_pages * PAGE_SIZE);
    }

    return vaddr;
9001fb8c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
}
9001fb90:	e1a00003 	mov	r0, r3
9001fb94:	e24bd008 	sub	sp, fp, #8
9001fb98:	e8bd8810 	pop	{r4, fp, pc}
9001fb9c:	909a4e10 	.word	0x909a4e10

9001fba0 <unmap_task_share_pages>:

void unmap_task_share_pages(struct TaskMicroDescriptor* task, const uintptr_t task_vaddr, const int nr_pages)
{
9001fba0:	e92d4800 	push	{fp, lr}
9001fba4:	e28db004 	add	fp, sp, #4
9001fba8:	e24dd018 	sub	sp, sp, #24
9001fbac:	e50b0010 	str	r0, [fp, #-16]
9001fbb0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
9001fbb4:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    /* get driver codes */
    struct DCacheDone* p_dcache_done = AchieveResource(&right_group.dcache_driver_tag);
9001fbb8:	e3040e08 	movw	r0, #19976	; 0x4e08
9001fbbc:	e349009a 	movt	r0, #37018	; 0x909a
9001fbc0:	ebffe145 	bl	900180dc <AchieveResource>
9001fbc4:	e50b0008 	str	r0, [fp, #-8]
    struct MmuCommonDone* p_mmu_driver = AchieveResource(&right_group.mmu_driver_tag);
9001fbc8:	e59f00c8 	ldr	r0, [pc, #200]	; 9001fc98 <unmap_task_share_pages+0xf8>
9001fbcc:	ebffe142 	bl	900180dc <AchieveResource>
9001fbd0:	e50b000c 	str	r0, [fp, #-12]

    spinlock_lock(&task->lock);
9001fbd4:	e51b3010 	ldr	r3, [fp, #-16]
9001fbd8:	e2833020 	add	r3, r3, #32
9001fbdc:	e1a00003 	mov	r0, r3
9001fbe0:	ebffd067 	bl	90013d84 <spinlock_lock>
    xizi_pager.unmap_pages(task->pgdir.pd_addr, task_vaddr, nr_pages * PAGE_SIZE);
9001fbe4:	e30333ac 	movw	r3, #13228	; 0x33ac
9001fbe8:	e3493002 	movt	r3, #36866	; 0x9002
9001fbec:	e593300c 	ldr	r3, [r3, #12]
9001fbf0:	e51b2010 	ldr	r2, [fp, #-16]
9001fbf4:	e5920050 	ldr	r0, [r2, #80]	; 0x50
9001fbf8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001fbfc:	e1a02602 	lsl	r2, r2, #12
9001fc00:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
9001fc04:	e12fff33 	blx	r3
    xizi_pager.unmap_pages(task->pgdir.pd_addr, task_vaddr + (nr_pages * PAGE_SIZE), nr_pages * PAGE_SIZE);
9001fc08:	e30333ac 	movw	r3, #13228	; 0x33ac
9001fc0c:	e3493002 	movt	r3, #36866	; 0x9002
9001fc10:	e593300c 	ldr	r3, [r3, #12]
9001fc14:	e51b2010 	ldr	r2, [fp, #-16]
9001fc18:	e5920050 	ldr	r0, [r2, #80]	; 0x50
9001fc1c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001fc20:	e1a02602 	lsl	r2, r2, #12
9001fc24:	e1a01002 	mov	r1, r2
9001fc28:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001fc2c:	e0811002 	add	r1, r1, r2
9001fc30:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001fc34:	e1a02602 	lsl	r2, r2, #12
9001fc38:	e12fff33 	blx	r3
    spinlock_unlock(&task->lock);
9001fc3c:	e51b3010 	ldr	r3, [fp, #-16]
9001fc40:	e2833020 	add	r3, r3, #32
9001fc44:	e1a00003 	mov	r0, r3
9001fc48:	ebffd07d 	bl	90013e44 <spinlock_unlock>
    if (task == cur_cpu()->task) {
9001fc4c:	ebfffe82 	bl	9001f65c <cur_cpu>
9001fc50:	e1a03000 	mov	r3, r0
9001fc54:	e5932004 	ldr	r2, [r3, #4]
9001fc58:	e51b3010 	ldr	r3, [fp, #-16]
9001fc5c:	e1520003 	cmp	r2, r3
9001fc60:	1a000009 	bne	9001fc8c <unmap_task_share_pages+0xec>
        p_mmu_driver->TlbFlush(task_vaddr, 2 * nr_pages * PAGE_SIZE);
9001fc64:	e51b300c 	ldr	r3, [fp, #-12]
9001fc68:	e593301c 	ldr	r3, [r3, #28]
9001fc6c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001fc70:	e1a02682 	lsl	r2, r2, #13
9001fc74:	e1a01002 	mov	r1, r2
9001fc78:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
9001fc7c:	e12fff33 	blx	r3
        /// @todo clean range rather than all
        p_dcache_done->flushall();
9001fc80:	e51b3008 	ldr	r3, [fp, #-8]
9001fc84:	e5933018 	ldr	r3, [r3, #24]
9001fc88:	e12fff33 	blx	r3
        // p_dcache_done->flush(task_vaddr, task_vaddr + 2 * nr_pages * PAGE_SIZE);
    }
}
9001fc8c:	e320f000 	nop	{0}
9001fc90:	e24bd004 	sub	sp, fp, #4
9001fc94:	e8bd8800 	pop	{fp, pc}
9001fc98:	909a4e10 	.word	0x909a4e10

9001fc9c <create_share_pages>:

static int next_session_id = 1;
struct session_backend* create_share_pages(struct TaskMicroDescriptor* client, struct TaskMicroDescriptor* server, const int capacity)
{
9001fc9c:	e92d4800 	push	{fp, lr}
9001fca0:	e28db004 	add	fp, sp, #4
9001fca4:	e24dd058 	sub	sp, sp, #88	; 0x58
9001fca8:	e50b0050 	str	r0, [fp, #-80]	; 0xffffffb0
9001fcac:	e50b1054 	str	r1, [fp, #-84]	; 0xffffffac
9001fcb0:	e50b2058 	str	r2, [fp, #-88]	; 0xffffffa8
    struct session_backend* session_backend = (struct session_backend*)slab_alloc(SessionAllocator());
9001fcb4:	ebfffe75 	bl	9001f690 <SessionAllocator>
9001fcb8:	e1a03000 	mov	r3, r0
9001fcbc:	e1a00003 	mov	r0, r3
9001fcc0:	ebffea43 	bl	9001a5d4 <slab_alloc>
9001fcc4:	e50b0008 	str	r0, [fp, #-8]
    if (UNLIKELY(session_backend == NULL)) {
9001fcc8:	e51b3008 	ldr	r3, [fp, #-8]
9001fccc:	e3530000 	cmp	r3, #0
9001fcd0:	03a03001 	moveq	r3, #1
9001fcd4:	13a03000 	movne	r3, #0
9001fcd8:	e6ef3073 	uxtb	r3, r3
9001fcdc:	e3530000 	cmp	r3, #0
9001fce0:	0a000001 	beq	9001fcec <create_share_pages+0x50>
        return NULL;
9001fce4:	e3a03000 	mov	r3, #0
9001fce8:	ea0000e0 	b	90020070 <create_share_pages+0x3d4>
    }

    int true_capacity = ALIGNUP(capacity, PAGE_SIZE);
9001fcec:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
9001fcf0:	e2833eff 	add	r3, r3, #4080	; 0xff0
9001fcf4:	e283300f 	add	r3, r3, #15
9001fcf8:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
9001fcfc:	e3c3300f 	bic	r3, r3, #15
9001fd00:	e50b300c 	str	r3, [fp, #-12]
    int nr_pages = true_capacity / PAGE_SIZE;
9001fd04:	e51b300c 	ldr	r3, [fp, #-12]
9001fd08:	e2832eff 	add	r2, r3, #4080	; 0xff0
9001fd0c:	e282200f 	add	r2, r2, #15
9001fd10:	e3530000 	cmp	r3, #0
9001fd14:	b1a03002 	movlt	r3, r2
9001fd18:	a1a03003 	movge	r3, r3
9001fd1c:	e1a03643 	asr	r3, r3, #12
9001fd20:	e50b3010 	str	r3, [fp, #-16]
    uintptr_t kern_vaddr = (uintptr_t)kalloc(true_capacity);
9001fd24:	e51b300c 	ldr	r3, [fp, #-12]
9001fd28:	e1a00003 	mov	r0, r3
9001fd2c:	ebffe3d0 	bl	90018c74 <kalloc>
9001fd30:	e1a03000 	mov	r3, r0
9001fd34:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (UNLIKELY(kern_vaddr == (uintptr_t)NULL)) {
9001fd38:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fd3c:	e3530000 	cmp	r3, #0
9001fd40:	03a03001 	moveq	r3, #1
9001fd44:	13a03000 	movne	r3, #0
9001fd48:	e6ef3073 	uxtb	r3, r3
9001fd4c:	e3530000 	cmp	r3, #0
9001fd50:	0a00000a 	beq	9001fd80 <create_share_pages+0xe4>
        ERROR("No memory\n");
9001fd54:	e3a020b1 	mov	r2, #177	; 0xb1
9001fd58:	e3021e6c 	movw	r1, #11884	; 0x2e6c
9001fd5c:	e3491002 	movt	r1, #36866	; 0x9002
9001fd60:	e3020df0 	movw	r0, #11760	; 0x2df0
9001fd64:	e3490002 	movt	r0, #36866	; 0x9002
9001fd68:	ebffd582 	bl	90015378 <KPrintf>
9001fd6c:	e3020e2c 	movw	r0, #11820	; 0x2e2c
9001fd70:	e3490002 	movt	r0, #36866	; 0x9002
9001fd74:	ebffd57f 	bl	90015378 <KPrintf>
        return NULL;
9001fd78:	e3a03000 	mov	r3, #0
9001fd7c:	ea0000bb 	b	90020070 <create_share_pages+0x3d4>
    }
    assert(kern_vaddr % PAGE_SIZE == 0);
9001fd80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fd84:	e7eb3053 	ubfx	r3, r3, #0, #12
9001fd88:	e3530000 	cmp	r3, #0
9001fd8c:	0a00000d 	beq	9001fdc8 <create_share_pages+0x12c>
9001fd90:	e3a020b4 	mov	r2, #180	; 0xb4
9001fd94:	e3021e6c 	movw	r1, #11884	; 0x2e6c
9001fd98:	e3491002 	movt	r1, #36866	; 0x9002
9001fd9c:	e3020df0 	movw	r0, #11760	; 0x2df0
9001fda0:	e3490002 	movt	r0, #36866	; 0x9002
9001fda4:	ebffd573 	bl	90015378 <KPrintf>
9001fda8:	e3021e38 	movw	r1, #11832	; 0x2e38
9001fdac:	e3491002 	movt	r1, #36866	; 0x9002
9001fdb0:	e3020e18 	movw	r0, #11800	; 0x2e18
9001fdb4:	e3490002 	movt	r0, #36866	; 0x9002
9001fdb8:	ebffd56e 	bl	90015378 <KPrintf>
9001fdbc:	e3020e28 	movw	r0, #11816	; 0x2e28
9001fdc0:	e3490002 	movt	r0, #36866	; 0x9002
9001fdc4:	ebffcc5d 	bl	90012f40 <panic>
    uintptr_t client_vaddr = map_task_share_page(client, V2P_WO(kern_vaddr), nr_pages);
9001fdc8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fdcc:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001fdd0:	e51b2010 	ldr	r2, [fp, #-16]
9001fdd4:	e1a01003 	mov	r1, r3
9001fdd8:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
9001fddc:	ebfffe9b 	bl	9001f850 <map_task_share_page>
9001fde0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    if (UNLIKELY(client_vaddr == 0)) {
9001fde4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
9001fde8:	e3530000 	cmp	r3, #0
9001fdec:	03a03001 	moveq	r3, #1
9001fdf0:	13a03000 	movne	r3, #0
9001fdf4:	e6ef3073 	uxtb	r3, r3
9001fdf8:	e3530000 	cmp	r3, #0
9001fdfc:	0a000004 	beq	9001fe14 <create_share_pages+0x178>
        kfree((char*)kern_vaddr);
9001fe00:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fe04:	e1a00003 	mov	r0, r3
9001fe08:	ebffe3bf 	bl	90018d0c <kfree>
        return NULL;
9001fe0c:	e3a03000 	mov	r3, #0
9001fe10:	ea000096 	b	90020070 <create_share_pages+0x3d4>
    }
    uintptr_t server_vaddr = map_task_share_page(server, V2P_WO(kern_vaddr), nr_pages);
9001fe14:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fe18:	e2833102 	add	r3, r3, #-2147483648	; 0x80000000
9001fe1c:	e51b2010 	ldr	r2, [fp, #-16]
9001fe20:	e1a01003 	mov	r1, r3
9001fe24:	e51b0054 	ldr	r0, [fp, #-84]	; 0xffffffac
9001fe28:	ebfffe88 	bl	9001f850 <map_task_share_page>
9001fe2c:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (UNLIKELY(server_vaddr == 0)) {
9001fe30:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
9001fe34:	e3530000 	cmp	r3, #0
9001fe38:	03a03001 	moveq	r3, #1
9001fe3c:	13a03000 	movne	r3, #0
9001fe40:	e6ef3073 	uxtb	r3, r3
9001fe44:	e3530000 	cmp	r3, #0
9001fe48:	0a000008 	beq	9001fe70 <create_share_pages+0x1d4>
        unmap_task_share_pages(client, client_vaddr, nr_pages);
9001fe4c:	e51b2010 	ldr	r2, [fp, #-16]
9001fe50:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
9001fe54:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
9001fe58:	ebffff50 	bl	9001fba0 <unmap_task_share_pages>
        kfree((char*)kern_vaddr);
9001fe5c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9001fe60:	e1a00003 	mov	r0, r3
9001fe64:	ebffe3a8 	bl	90018d0c <kfree>
        return NULL;
9001fe68:	e3a03000 	mov	r3, #0
9001fe6c:	ea00007f 	b	90020070 <create_share_pages+0x3d4>
    }

    /* build session_backend */
    session_backend->session_id = next_session_id++;
9001fe70:	e3033560 	movw	r3, #13664	; 0x3560
9001fe74:	e3493002 	movt	r3, #36866	; 0x9002
9001fe78:	e5932000 	ldr	r2, [r3]
9001fe7c:	e2821001 	add	r1, r2, #1
9001fe80:	e3033560 	movw	r3, #13664	; 0x3560
9001fe84:	e3493002 	movt	r3, #36866	; 0x9002
9001fe88:	e5831000 	str	r1, [r3]
9001fe8c:	e51b3008 	ldr	r3, [fp, #-8]
9001fe90:	e5832030 	str	r2, [r3, #48]	; 0x30
    session_backend->buf_kernel_addr = kern_vaddr;
9001fe94:	e51b3008 	ldr	r3, [fp, #-8]
9001fe98:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9001fe9c:	e5832040 	str	r2, [r3, #64]	; 0x40
    session_backend->nr_pages = nr_pages;
9001fea0:	e51b3008 	ldr	r3, [fp, #-8]
9001fea4:	e51b2010 	ldr	r2, [fp, #-16]
9001fea8:	e5832034 	str	r2, [r3, #52]	; 0x34
    session_backend->client = client;
9001feac:	e51b3008 	ldr	r3, [fp, #-8]
9001feb0:	e51b2050 	ldr	r2, [fp, #-80]	; 0xffffffb0
9001feb4:	e5832038 	str	r2, [r3, #56]	; 0x38
    session_backend->server = server;
9001feb8:	e51b3008 	ldr	r3, [fp, #-8]
9001febc:	e51b2054 	ldr	r2, [fp, #-84]	; 0xffffffac
9001fec0:	e583203c 	str	r2, [r3, #60]	; 0x3c
    // init client side session struct
    session_backend->client_side.buf_addr = client_vaddr;
9001fec4:	e51b3008 	ldr	r3, [fp, #-8]
9001fec8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
9001fecc:	e5832024 	str	r2, [r3, #36]	; 0x24
    session_backend->client_side.capacity = true_capacity;
9001fed0:	e51b3008 	ldr	r3, [fp, #-8]
9001fed4:	e51b200c 	ldr	r2, [fp, #-12]
9001fed8:	e5832028 	str	r2, [r3, #40]	; 0x28
    session_backend->client_side.closed = false;
9001fedc:	e51b3008 	ldr	r3, [fp, #-8]
9001fee0:	e3a02000 	mov	r2, #0
9001fee4:	e5c3202c 	strb	r2, [r3, #44]	; 0x2c
    spinlock_lock(&client->lock);
9001fee8:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001feec:	e2833020 	add	r3, r3, #32
9001fef0:	e1a00003 	mov	r0, r3
9001fef4:	ebffcfa2 	bl	90013d84 <spinlock_lock>
    doubleListNodeInit(&session_backend->client_side.node);
9001fef8:	e51b3008 	ldr	r3, [fp, #-8]
9001fefc:	e283301c 	add	r3, r3, #28
9001ff00:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    list->next = list;
9001ff04:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
9001ff08:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
9001ff0c:	e5832000 	str	r2, [r3]
    list->prev = list;
9001ff10:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
9001ff14:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
9001ff18:	e5832004 	str	r2, [r3, #4]
    doubleListAddOnBack(&session_backend->client_side.node, &client->cli_sess_listhead);
9001ff1c:	e51b3008 	ldr	r3, [fp, #-8]
9001ff20:	e283201c 	add	r2, r3, #28
9001ff24:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001ff28:	e2833054 	add	r3, r3, #84	; 0x54
9001ff2c:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
9001ff30:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    _double_list_add(new_node, head->prev, head);
9001ff34:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001ff38:	e5933004 	ldr	r3, [r3, #4]
9001ff3c:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
9001ff40:	e50b2040 	str	r2, [fp, #-64]	; 0xffffffc0
9001ff44:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
9001ff48:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
9001ff4c:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    next->prev = new_node;
9001ff50:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
9001ff54:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
9001ff58:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
9001ff5c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
9001ff60:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
9001ff64:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
9001ff68:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
9001ff6c:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
9001ff70:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
9001ff74:	e51b3044 	ldr	r3, [fp, #-68]	; 0xffffffbc
9001ff78:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
9001ff7c:	e5832000 	str	r2, [r3]
    spinlock_unlock(&client->lock);
9001ff80:	e51b3050 	ldr	r3, [fp, #-80]	; 0xffffffb0
9001ff84:	e2833020 	add	r3, r3, #32
9001ff88:	e1a00003 	mov	r0, r3
9001ff8c:	ebffcfac 	bl	90013e44 <spinlock_unlock>
    // init server side session struct
    session_backend->server_side.buf_addr = server_vaddr;
9001ff90:	e51b3008 	ldr	r3, [fp, #-8]
9001ff94:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
9001ff98:	e5832008 	str	r2, [r3, #8]
    session_backend->server_side.capacity = true_capacity;
9001ff9c:	e51b3008 	ldr	r3, [fp, #-8]
9001ffa0:	e51b200c 	ldr	r2, [fp, #-12]
9001ffa4:	e583200c 	str	r2, [r3, #12]
    session_backend->server_side.head = 0;
9001ffa8:	e51b3008 	ldr	r3, [fp, #-8]
9001ffac:	e3a02000 	mov	r2, #0
9001ffb0:	e5832010 	str	r2, [r3, #16]
    session_backend->server_side.tail = 0;
9001ffb4:	e51b3008 	ldr	r3, [fp, #-8]
9001ffb8:	e3a02000 	mov	r2, #0
9001ffbc:	e5832014 	str	r2, [r3, #20]
    session_backend->server_side.closed = false;
9001ffc0:	e51b3008 	ldr	r3, [fp, #-8]
9001ffc4:	e3a02000 	mov	r2, #0
9001ffc8:	e5c32018 	strb	r2, [r3, #24]
    spinlock_lock(&server->lock);
9001ffcc:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
9001ffd0:	e2833020 	add	r3, r3, #32
9001ffd4:	e1a00003 	mov	r0, r3
9001ffd8:	ebffcf69 	bl	90013d84 <spinlock_lock>
    doubleListNodeInit(&session_backend->server_side.node);
9001ffdc:	e51b3008 	ldr	r3, [fp, #-8]
9001ffe0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    list->next = list;
9001ffe4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001ffe8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
9001ffec:	e5832000 	str	r2, [r3]
    list->prev = list;
9001fff0:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
9001fff4:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
9001fff8:	e5832004 	str	r2, [r3, #4]
    doubleListAddOnBack(&session_backend->server_side.node, &server->svr_sess_listhead);
9001fffc:	e51b2008 	ldr	r2, [fp, #-8]
90020000:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
90020004:	e283305c 	add	r3, r3, #92	; 0x5c
90020008:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
9002000c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    _double_list_add(new_node, head->prev, head);
90020010:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90020014:	e5933004 	ldr	r3, [r3, #4]
90020018:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
9002001c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
90020020:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
90020024:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
90020028:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    next->prev = new_node;
9002002c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
90020030:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90020034:	e5832004 	str	r2, [r3, #4]
    new_node->next = next;
90020038:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
9002003c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
90020040:	e5832000 	str	r2, [r3]
    new_node->prev = prev;
90020044:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
90020048:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
9002004c:	e5832004 	str	r2, [r3, #4]
    prev->next = new_node;
90020050:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
90020054:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
90020058:	e5832000 	str	r2, [r3]
    spinlock_unlock(&server->lock);
9002005c:	e51b3054 	ldr	r3, [fp, #-84]	; 0xffffffac
90020060:	e2833020 	add	r3, r3, #32
90020064:	e1a00003 	mov	r0, r3
90020068:	ebffcf75 	bl	90013e44 <spinlock_unlock>

    return session_backend;
9002006c:	e51b3008 	ldr	r3, [fp, #-8]
}
90020070:	e1a00003 	mov	r0, r3
90020074:	e24bd004 	sub	sp, fp, #4
90020078:	e8bd8800 	pop	{fp, pc}

9002007c <delete_share_pages>:
 *  1. task exits, close its side of sessions and found opposite side is also closed.
 *  2. server poll found a closed client side session.
 *  3. client close a session, and found server side has closed.
 */
int delete_share_pages(struct session_backend* session_backend)
{
9002007c:	e92d4800 	push	{fp, lr}
90020080:	e28db004 	add	fp, sp, #4
90020084:	e24dd020 	sub	sp, sp, #32
90020088:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    if (session_backend == NULL) {
9002008c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90020090:	e3530000 	cmp	r3, #0
90020094:	1a000001 	bne	900200a0 <delete_share_pages+0x24>
        return -1;
90020098:	e3e03000 	mvn	r3, #0
9002009c:	ea00004e 	b	900201dc <delete_share_pages+0x160>
    }

    /* unmap share pages */
    if (session_backend->client) {
900200a0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900200a4:	e5933038 	ldr	r3, [r3, #56]	; 0x38
900200a8:	e3530000 	cmp	r3, #0
900200ac:	0a00001e 	beq	9002012c <delete_share_pages+0xb0>
        spinlock_lock(&session_backend->client->lock);
900200b0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900200b4:	e5933038 	ldr	r3, [r3, #56]	; 0x38
900200b8:	e2833020 	add	r3, r3, #32
900200bc:	e1a00003 	mov	r0, r3
900200c0:	ebffcf2f 	bl	90013d84 <spinlock_lock>
        doubleListDel(&session_backend->client_side.node);
900200c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900200c8:	e283301c 	add	r3, r3, #28
900200cc:	e50b3008 	str	r3, [fp, #-8]
    _double_list_del(entry->prev, entry->next);
900200d0:	e51b3008 	ldr	r3, [fp, #-8]
900200d4:	e5932004 	ldr	r2, [r3, #4]
900200d8:	e51b3008 	ldr	r3, [fp, #-8]
900200dc:	e5933000 	ldr	r3, [r3]
900200e0:	e50b200c 	str	r2, [fp, #-12]
900200e4:	e50b3010 	str	r3, [fp, #-16]
    next->prev = prev;
900200e8:	e51b3010 	ldr	r3, [fp, #-16]
900200ec:	e51b200c 	ldr	r2, [fp, #-12]
900200f0:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
900200f4:	e51b300c 	ldr	r3, [fp, #-12]
900200f8:	e51b2010 	ldr	r2, [fp, #-16]
900200fc:	e5832000 	str	r2, [r3]
    entry->next = entry;
90020100:	e51b3008 	ldr	r3, [fp, #-8]
90020104:	e51b2008 	ldr	r2, [fp, #-8]
90020108:	e5832000 	str	r2, [r3]
    entry->prev = entry;
9002010c:	e51b3008 	ldr	r3, [fp, #-8]
90020110:	e51b2008 	ldr	r2, [fp, #-8]
90020114:	e5832004 	str	r2, [r3, #4]
        spinlock_unlock(&session_backend->client->lock);
90020118:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
9002011c:	e5933038 	ldr	r3, [r3, #56]	; 0x38
90020120:	e2833020 	add	r3, r3, #32
90020124:	e1a00003 	mov	r0, r3
90020128:	ebffcf45 	bl	90013e44 <spinlock_unlock>
    }

    if (session_backend->server) {
9002012c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90020130:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
90020134:	e3530000 	cmp	r3, #0
90020138:	0a00001d 	beq	900201b4 <delete_share_pages+0x138>
        spinlock_lock(&session_backend->server->lock);
9002013c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90020140:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
90020144:	e2833020 	add	r3, r3, #32
90020148:	e1a00003 	mov	r0, r3
9002014c:	ebffcf0c 	bl	90013d84 <spinlock_lock>
        doubleListDel(&session_backend->server_side.node);
90020150:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
90020154:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    _double_list_del(entry->prev, entry->next);
90020158:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9002015c:	e5932004 	ldr	r2, [r3, #4]
90020160:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90020164:	e5933000 	ldr	r3, [r3]
90020168:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
9002016c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    next->prev = prev;
90020170:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
90020174:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
90020178:	e5832004 	str	r2, [r3, #4]
    prev->next = next;
9002017c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
90020180:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
90020184:	e5832000 	str	r2, [r3]
    entry->next = entry;
90020188:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
9002018c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
90020190:	e5832000 	str	r2, [r3]
    entry->prev = entry;
90020194:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
90020198:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
9002019c:	e5832004 	str	r2, [r3, #4]
        spinlock_unlock(&session_backend->server->lock);
900201a0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900201a4:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
900201a8:	e2833020 	add	r3, r3, #32
900201ac:	e1a00003 	mov	r0, r3
900201b0:	ebffcf23 	bl	90013e44 <spinlock_unlock>
    }

    /* free seesion backend */
    kfree((void*)session_backend->buf_kernel_addr);
900201b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
900201b8:	e5933040 	ldr	r3, [r3, #64]	; 0x40
900201bc:	e1a00003 	mov	r0, r3
900201c0:	ebffe2d1 	bl	90018d0c <kfree>
    slab_free(SessionAllocator(), (void*)session_backend);
900201c4:	ebfffd31 	bl	9001f690 <SessionAllocator>
900201c8:	e1a03000 	mov	r3, r0
900201cc:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
900201d0:	e1a00003 	mov	r0, r3
900201d4:	ebffe9c8 	bl	9001a8fc <slab_free>

    return 0;
900201d8:	e3a03000 	mov	r3, #0
}
900201dc:	e1a00003 	mov	r0, r3
900201e0:	e24bd004 	sub	sp, fp, #4
900201e4:	e8bd8800 	pop	{fp, pc}

900201e8 <module_share_page_init>:
    .delete_share_pages = delete_share_pages,
    .task_map_pages = task_map_pages,
};

int module_share_page_init(struct SharePageRightGroup* _right_group)
{
900201e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
900201ec:	e28db000 	add	fp, sp, #0
900201f0:	e24dd00c 	sub	sp, sp, #12
900201f4:	e50b0008 	str	r0, [fp, #-8]
    /* assign rights to share page module */
    right_group = *_right_group;
900201f8:	e3043e08 	movw	r3, #19976	; 0x4e08
900201fc:	e349309a 	movt	r3, #37018	; 0x909a
90020200:	e51b2008 	ldr	r2, [fp, #-8]
90020204:	e1a0c003 	mov	ip, r3
90020208:	e1a03002 	mov	r3, r2
9002020c:	e893000f 	ldm	r3, {r0, r1, r2, r3}
90020210:	e88c000f 	stm	ip, {r0, r1, r2, r3}
    return 0;
90020214:	e3a03000 	mov	r3, #0
90020218:	e1a00003 	mov	r0, r3
9002021c:	e28bd000 	add	sp, fp, #0
90020220:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
90020224:	e12fff1e 	bx	lr

90020228 <main>:
#include "task.h"

extern uint32_t _binary_init_start[], _binary_default_fs_start[];
extern int sys_spawn(char* path, char** argv);
int main(void)
{
90020228:	e92d4810 	push	{r4, fp, lr}
9002022c:	e28db008 	add	fp, sp, #8
90020230:	e24dd03c 	sub	sp, sp, #60	; 0x3c
    /* init tracer */
    // clang-format off
    tracer_init(); // init tracer system
90020234:	ebffdf24 	bl	90017ecc <tracer_init>
    struct TraceTag hardkernel_tag, softkernel_tag;
    if (!CreateResourceTag(&hardkernel_tag, RequireRootTag(), "hardkernel", TRACER_OWNER, NULL) || 
90020238:	ebffda8c 	bl	90016c70 <RequireRootTag>
9002023c:	e1a01000 	mov	r1, r0
90020240:	e24b0014 	sub	r0, fp, #20
90020244:	e3a03000 	mov	r3, #0
90020248:	e58d3000 	str	r3, [sp]
9002024c:	e3a03001 	mov	r3, #1
90020250:	e3022e80 	movw	r2, #11904	; 0x2e80
90020254:	e3492002 	movt	r2, #36866	; 0x9002
90020258:	ebffdfc5 	bl	90018174 <CreateResourceTag>
9002025c:	e1a03000 	mov	r3, r0
90020260:	e2233001 	eor	r3, r3, #1
90020264:	e6ef3073 	uxtb	r3, r3
90020268:	e3530000 	cmp	r3, #0
9002026c:	1a00000d 	bne	900202a8 <main+0x80>
        !CreateResourceTag(&softkernel_tag, RequireRootTag(), "softkernel", TRACER_OWNER, NULL)) {
90020270:	ebffda7e 	bl	90016c70 <RequireRootTag>
90020274:	e1a01000 	mov	r1, r0
90020278:	e24b001c 	sub	r0, fp, #28
9002027c:	e3a03000 	mov	r3, #0
90020280:	e58d3000 	str	r3, [sp]
90020284:	e3a03001 	mov	r3, #1
90020288:	e3022e8c 	movw	r2, #11916	; 0x2e8c
9002028c:	e3492002 	movt	r2, #36866	; 0x9002
90020290:	ebffdfb7 	bl	90018174 <CreateResourceTag>
90020294:	e1a03000 	mov	r3, r0
90020298:	e2233001 	eor	r3, r3, #1
9002029c:	e6ef3073 	uxtb	r3, r3
    if (!CreateResourceTag(&hardkernel_tag, RequireRootTag(), "hardkernel", TRACER_OWNER, NULL) || 
900202a0:	e3530000 	cmp	r3, #0
900202a4:	0a00000a 	beq	900202d4 <main+0xac>
        ERROR("Failed to create hardkernel owner and softkernel owner.\n");
900202a8:	e3a0202d 	mov	r2, #45	; 0x2d
900202ac:	e3031000 	movw	r1, #12288	; 0x3000
900202b0:	e3491002 	movt	r1, #36866	; 0x9002
900202b4:	e3020e98 	movw	r0, #11928	; 0x2e98
900202b8:	e3490002 	movt	r0, #36866	; 0x9002
900202bc:	ebffd42d 	bl	90015378 <KPrintf>
900202c0:	e3020ea8 	movw	r0, #11944	; 0x2ea8
900202c4:	e3490002 	movt	r0, #36866	; 0x9002
900202c8:	ebffd42a 	bl	90015378 <KPrintf>
        return -1;
900202cc:	e3e03000 	mvn	r3, #0
900202d0:	ea00006e 	b	90020490 <main+0x268>
    }
    // clang-format on

    /* init hardkernel */
    if (!hardkernel_init(&hardkernel_tag)) {
900202d4:	e24b3014 	sub	r3, fp, #20
900202d8:	e1a00003 	mov	r0, r3
900202dc:	ebffda2c 	bl	90016b94 <hardkernel_init>
900202e0:	e1a03000 	mov	r3, r0
900202e4:	e2233001 	eor	r3, r3, #1
900202e8:	e6ef3073 	uxtb	r3, r3
900202ec:	e3530000 	cmp	r3, #0
900202f0:	0a000001 	beq	900202fc <main+0xd4>
        return -1;
900202f4:	e3e03000 	mvn	r3, #0
900202f8:	ea000064 	b	90020490 <main+0x268>
    }
    /* init softkernel */
    if (!softkernel_init(&hardkernel_tag, &softkernel_tag)) {
900202fc:	e24b201c 	sub	r2, fp, #28
90020300:	e24b3014 	sub	r3, fp, #20
90020304:	e1a01002 	mov	r1, r2
90020308:	e1a00003 	mov	r0, r3
9002030c:	ebffe1e5 	bl	90018aa8 <softkernel_init>
90020310:	e1a03000 	mov	r3, r0
90020314:	e2233001 	eor	r3, r3, #1
90020318:	e6ef3073 	uxtb	r3, r3
9002031c:	e3530000 	cmp	r3, #0
90020320:	0a000001 	beq	9002032c <main+0x104>
        return -1;
90020324:	e3e03000 	mvn	r3, #0
90020328:	ea000058 	b	90020490 <main+0x268>
    }
    show_xizi_bar();
9002032c:	ebffe21c 	bl	90018ba4 <show_xizi_bar>

    /* start first task */
    char* init_task_param[2] = { "/app/init", 0 };
90020330:	e3023ee4 	movw	r3, #12004	; 0x2ee4
90020334:	e3493002 	movt	r3, #36866	; 0x9002
90020338:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
9002033c:	e3a03000 	mov	r3, #0
90020340:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    spawn_embedded_task((char*)_binary_init_start, "init", init_task_param);
90020344:	e24b3024 	sub	r3, fp, #36	; 0x24
90020348:	e1a02003 	mov	r2, r3
9002034c:	e3021ef0 	movw	r1, #12016	; 0x2ef0
90020350:	e3491002 	movt	r1, #36866	; 0x9002
90020354:	e3040000 	movw	r0, #16384	; 0x4000
90020358:	e3490012 	movt	r0, #36882	; 0x9012
9002035c:	ebfff0df 	bl	9001c6e0 <spawn_embedded_task>
    char* fs_server_task_param[2] = { "/app/fs_server", 0 };
90020360:	e3023ef8 	movw	r3, #12024	; 0x2ef8
90020364:	e3493002 	movt	r3, #36866	; 0x9002
90020368:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
9002036c:	e3a03000 	mov	r3, #0
90020370:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    spawn_embedded_task((char*)_binary_default_fs_start, "memfs", fs_server_task_param);
90020374:	e24b302c 	sub	r3, fp, #44	; 0x2c
90020378:	e1a02003 	mov	r2, r3
9002037c:	e3021f08 	movw	r1, #12040	; 0x2f08
90020380:	e3491002 	movt	r1, #36866	; 0x9002
90020384:	e30b0370 	movw	r0, #45936	; 0xb370
90020388:	e3490013 	movt	r0, #36883	; 0x9013
9002038c:	ebfff0d3 	bl	9001c6e0 <spawn_embedded_task>

    /* start scheduler */
    struct SchedulerRightGroup scheduler_rights = { 0 };
90020390:	e24b303c 	sub	r3, fp, #60	; 0x3c
90020394:	e3a02000 	mov	r2, #0
90020398:	e5832000 	str	r2, [r3]
9002039c:	e5832004 	str	r2, [r3, #4]
900203a0:	e5832008 	str	r2, [r3, #8]
900203a4:	e583200c 	str	r2, [r3, #12]
    assert(AchieveResourceTag(&scheduler_rights.mmu_driver_tag, &hardkernel_tag, "mmu-ac-resource"));
900203a8:	e24b1014 	sub	r1, fp, #20
900203ac:	e24b303c 	sub	r3, fp, #60	; 0x3c
900203b0:	e2833008 	add	r3, r3, #8
900203b4:	e3022f10 	movw	r2, #12048	; 0x2f10
900203b8:	e3492002 	movt	r2, #36866	; 0x9002
900203bc:	e1a00003 	mov	r0, r3
900203c0:	ebffdf32 	bl	90018090 <AchieveResourceTag>
900203c4:	e1a03000 	mov	r3, r0
900203c8:	e2233001 	eor	r3, r3, #1
900203cc:	e6ef3073 	uxtb	r3, r3
900203d0:	e3530000 	cmp	r3, #0
900203d4:	0a00000d 	beq	90020410 <main+0x1e8>
900203d8:	e3a02044 	mov	r2, #68	; 0x44
900203dc:	e3031000 	movw	r1, #12288	; 0x3000
900203e0:	e3491002 	movt	r1, #36866	; 0x9002
900203e4:	e3020e98 	movw	r0, #11928	; 0x2e98
900203e8:	e3490002 	movt	r0, #36866	; 0x9002
900203ec:	ebffd3e1 	bl	90015378 <KPrintf>
900203f0:	e3021f20 	movw	r1, #12064	; 0x2f20
900203f4:	e3491002 	movt	r1, #36866	; 0x9002
900203f8:	e3020f7c 	movw	r0, #12156	; 0x2f7c
900203fc:	e3490002 	movt	r0, #36866	; 0x9002
90020400:	ebffd3dc 	bl	90015378 <KPrintf>
90020404:	e3020f8c 	movw	r0, #12172	; 0x2f8c
90020408:	e3490002 	movt	r0, #36866	; 0x9002
9002040c:	ebffcacb 	bl	90012f40 <panic>
    assert(AchieveResourceTag(&scheduler_rights.intr_driver_tag, &hardkernel_tag, "intr-ac-resource"));
90020410:	e24b1014 	sub	r1, fp, #20
90020414:	e24b303c 	sub	r3, fp, #60	; 0x3c
90020418:	e3022f90 	movw	r2, #12176	; 0x2f90
9002041c:	e3492002 	movt	r2, #36866	; 0x9002
90020420:	e1a00003 	mov	r0, r3
90020424:	ebffdf19 	bl	90018090 <AchieveResourceTag>
90020428:	e1a03000 	mov	r3, r0
9002042c:	e2233001 	eor	r3, r3, #1
90020430:	e6ef3073 	uxtb	r3, r3
90020434:	e3530000 	cmp	r3, #0
90020438:	0a00000d 	beq	90020474 <main+0x24c>
9002043c:	e3a02045 	mov	r2, #69	; 0x45
90020440:	e3031000 	movw	r1, #12288	; 0x3000
90020444:	e3491002 	movt	r1, #36866	; 0x9002
90020448:	e3020e98 	movw	r0, #11928	; 0x2e98
9002044c:	e3490002 	movt	r0, #36866	; 0x9002
90020450:	ebffd3c8 	bl	90015378 <KPrintf>
90020454:	e3021fa4 	movw	r1, #12196	; 0x2fa4
90020458:	e3491002 	movt	r1, #36866	; 0x9002
9002045c:	e3020f7c 	movw	r0, #12156	; 0x2f7c
90020460:	e3490002 	movt	r0, #36866	; 0x9002
90020464:	ebffd3c3 	bl	90015378 <KPrintf>
90020468:	e3020f8c 	movw	r0, #12172	; 0x2f8c
9002046c:	e3490002 	movt	r0, #36866	; 0x9002
90020470:	ebffcab2 	bl	90012f40 <panic>
    xizi_task_manager.task_scheduler(scheduler_rights);
90020474:	e30333e0 	movw	r3, #13280	; 0x33e0
90020478:	e3493002 	movt	r3, #36866	; 0x9002
9002047c:	e593416c 	ldr	r4, [r3, #364]	; 0x16c
90020480:	e24b303c 	sub	r3, fp, #60	; 0x3c
90020484:	e893000f 	ldm	r3, {r0, r1, r2, r3}
90020488:	e12fff34 	blx	r4

    // never reached
    return 0;
9002048c:	e3a03000 	mov	r3, #0
90020490:	e1a00003 	mov	r0, r3
90020494:	e24bd008 	sub	sp, fp, #8
90020498:	e8bd8810 	pop	{r4, fp, pc}
9002049c:	00000000 	andeq	r0, r0, r0

900204a0 <__udivsi3>:
900204a0:	1e4a      	subs	r2, r1, #1
900204a2:	bf08      	it	eq
900204a4:	4770      	bxeq	lr
900204a6:	f0c0 8124 	bcc.w	900206f2 <__udivsi3+0x252>
900204aa:	4288      	cmp	r0, r1
900204ac:	f240 8116 	bls.w	900206dc <__udivsi3+0x23c>
900204b0:	4211      	tst	r1, r2
900204b2:	f000 8117 	beq.w	900206e4 <__udivsi3+0x244>
900204b6:	fab0 f380 	clz	r3, r0
900204ba:	fab1 f281 	clz	r2, r1
900204be:	eba2 0303 	sub.w	r3, r2, r3
900204c2:	f1c3 031f 	rsb	r3, r3, #31
900204c6:	a204      	add	r2, pc, #16	; (adr r2, 900204d8 <__udivsi3+0x38>)
900204c8:	eb02 1303 	add.w	r3, r2, r3, lsl #4
900204cc:	f04f 0200 	mov.w	r2, #0
900204d0:	469f      	mov	pc, r3
900204d2:	bf00      	nop
900204d4:	f3af 8000 	nop.w
900204d8:	ebb0 7fc1 	cmp.w	r0, r1, lsl #31
900204dc:	bf00      	nop
900204de:	eb42 0202 	adc.w	r2, r2, r2
900204e2:	bf28      	it	cs
900204e4:	eba0 70c1 	subcs.w	r0, r0, r1, lsl #31
900204e8:	ebb0 7f81 	cmp.w	r0, r1, lsl #30
900204ec:	bf00      	nop
900204ee:	eb42 0202 	adc.w	r2, r2, r2
900204f2:	bf28      	it	cs
900204f4:	eba0 7081 	subcs.w	r0, r0, r1, lsl #30
900204f8:	ebb0 7f41 	cmp.w	r0, r1, lsl #29
900204fc:	bf00      	nop
900204fe:	eb42 0202 	adc.w	r2, r2, r2
90020502:	bf28      	it	cs
90020504:	eba0 7041 	subcs.w	r0, r0, r1, lsl #29
90020508:	ebb0 7f01 	cmp.w	r0, r1, lsl #28
9002050c:	bf00      	nop
9002050e:	eb42 0202 	adc.w	r2, r2, r2
90020512:	bf28      	it	cs
90020514:	eba0 7001 	subcs.w	r0, r0, r1, lsl #28
90020518:	ebb0 6fc1 	cmp.w	r0, r1, lsl #27
9002051c:	bf00      	nop
9002051e:	eb42 0202 	adc.w	r2, r2, r2
90020522:	bf28      	it	cs
90020524:	eba0 60c1 	subcs.w	r0, r0, r1, lsl #27
90020528:	ebb0 6f81 	cmp.w	r0, r1, lsl #26
9002052c:	bf00      	nop
9002052e:	eb42 0202 	adc.w	r2, r2, r2
90020532:	bf28      	it	cs
90020534:	eba0 6081 	subcs.w	r0, r0, r1, lsl #26
90020538:	ebb0 6f41 	cmp.w	r0, r1, lsl #25
9002053c:	bf00      	nop
9002053e:	eb42 0202 	adc.w	r2, r2, r2
90020542:	bf28      	it	cs
90020544:	eba0 6041 	subcs.w	r0, r0, r1, lsl #25
90020548:	ebb0 6f01 	cmp.w	r0, r1, lsl #24
9002054c:	bf00      	nop
9002054e:	eb42 0202 	adc.w	r2, r2, r2
90020552:	bf28      	it	cs
90020554:	eba0 6001 	subcs.w	r0, r0, r1, lsl #24
90020558:	ebb0 5fc1 	cmp.w	r0, r1, lsl #23
9002055c:	bf00      	nop
9002055e:	eb42 0202 	adc.w	r2, r2, r2
90020562:	bf28      	it	cs
90020564:	eba0 50c1 	subcs.w	r0, r0, r1, lsl #23
90020568:	ebb0 5f81 	cmp.w	r0, r1, lsl #22
9002056c:	bf00      	nop
9002056e:	eb42 0202 	adc.w	r2, r2, r2
90020572:	bf28      	it	cs
90020574:	eba0 5081 	subcs.w	r0, r0, r1, lsl #22
90020578:	ebb0 5f41 	cmp.w	r0, r1, lsl #21
9002057c:	bf00      	nop
9002057e:	eb42 0202 	adc.w	r2, r2, r2
90020582:	bf28      	it	cs
90020584:	eba0 5041 	subcs.w	r0, r0, r1, lsl #21
90020588:	ebb0 5f01 	cmp.w	r0, r1, lsl #20
9002058c:	bf00      	nop
9002058e:	eb42 0202 	adc.w	r2, r2, r2
90020592:	bf28      	it	cs
90020594:	eba0 5001 	subcs.w	r0, r0, r1, lsl #20
90020598:	ebb0 4fc1 	cmp.w	r0, r1, lsl #19
9002059c:	bf00      	nop
9002059e:	eb42 0202 	adc.w	r2, r2, r2
900205a2:	bf28      	it	cs
900205a4:	eba0 40c1 	subcs.w	r0, r0, r1, lsl #19
900205a8:	ebb0 4f81 	cmp.w	r0, r1, lsl #18
900205ac:	bf00      	nop
900205ae:	eb42 0202 	adc.w	r2, r2, r2
900205b2:	bf28      	it	cs
900205b4:	eba0 4081 	subcs.w	r0, r0, r1, lsl #18
900205b8:	ebb0 4f41 	cmp.w	r0, r1, lsl #17
900205bc:	bf00      	nop
900205be:	eb42 0202 	adc.w	r2, r2, r2
900205c2:	bf28      	it	cs
900205c4:	eba0 4041 	subcs.w	r0, r0, r1, lsl #17
900205c8:	ebb0 4f01 	cmp.w	r0, r1, lsl #16
900205cc:	bf00      	nop
900205ce:	eb42 0202 	adc.w	r2, r2, r2
900205d2:	bf28      	it	cs
900205d4:	eba0 4001 	subcs.w	r0, r0, r1, lsl #16
900205d8:	ebb0 3fc1 	cmp.w	r0, r1, lsl #15
900205dc:	bf00      	nop
900205de:	eb42 0202 	adc.w	r2, r2, r2
900205e2:	bf28      	it	cs
900205e4:	eba0 30c1 	subcs.w	r0, r0, r1, lsl #15
900205e8:	ebb0 3f81 	cmp.w	r0, r1, lsl #14
900205ec:	bf00      	nop
900205ee:	eb42 0202 	adc.w	r2, r2, r2
900205f2:	bf28      	it	cs
900205f4:	eba0 3081 	subcs.w	r0, r0, r1, lsl #14
900205f8:	ebb0 3f41 	cmp.w	r0, r1, lsl #13
900205fc:	bf00      	nop
900205fe:	eb42 0202 	adc.w	r2, r2, r2
90020602:	bf28      	it	cs
90020604:	eba0 3041 	subcs.w	r0, r0, r1, lsl #13
90020608:	ebb0 3f01 	cmp.w	r0, r1, lsl #12
9002060c:	bf00      	nop
9002060e:	eb42 0202 	adc.w	r2, r2, r2
90020612:	bf28      	it	cs
90020614:	eba0 3001 	subcs.w	r0, r0, r1, lsl #12
90020618:	ebb0 2fc1 	cmp.w	r0, r1, lsl #11
9002061c:	bf00      	nop
9002061e:	eb42 0202 	adc.w	r2, r2, r2
90020622:	bf28      	it	cs
90020624:	eba0 20c1 	subcs.w	r0, r0, r1, lsl #11
90020628:	ebb0 2f81 	cmp.w	r0, r1, lsl #10
9002062c:	bf00      	nop
9002062e:	eb42 0202 	adc.w	r2, r2, r2
90020632:	bf28      	it	cs
90020634:	eba0 2081 	subcs.w	r0, r0, r1, lsl #10
90020638:	ebb0 2f41 	cmp.w	r0, r1, lsl #9
9002063c:	bf00      	nop
9002063e:	eb42 0202 	adc.w	r2, r2, r2
90020642:	bf28      	it	cs
90020644:	eba0 2041 	subcs.w	r0, r0, r1, lsl #9
90020648:	ebb0 2f01 	cmp.w	r0, r1, lsl #8
9002064c:	bf00      	nop
9002064e:	eb42 0202 	adc.w	r2, r2, r2
90020652:	bf28      	it	cs
90020654:	eba0 2001 	subcs.w	r0, r0, r1, lsl #8
90020658:	ebb0 1fc1 	cmp.w	r0, r1, lsl #7
9002065c:	bf00      	nop
9002065e:	eb42 0202 	adc.w	r2, r2, r2
90020662:	bf28      	it	cs
90020664:	eba0 10c1 	subcs.w	r0, r0, r1, lsl #7
90020668:	ebb0 1f81 	cmp.w	r0, r1, lsl #6
9002066c:	bf00      	nop
9002066e:	eb42 0202 	adc.w	r2, r2, r2
90020672:	bf28      	it	cs
90020674:	eba0 1081 	subcs.w	r0, r0, r1, lsl #6
90020678:	ebb0 1f41 	cmp.w	r0, r1, lsl #5
9002067c:	bf00      	nop
9002067e:	eb42 0202 	adc.w	r2, r2, r2
90020682:	bf28      	it	cs
90020684:	eba0 1041 	subcs.w	r0, r0, r1, lsl #5
90020688:	ebb0 1f01 	cmp.w	r0, r1, lsl #4
9002068c:	bf00      	nop
9002068e:	eb42 0202 	adc.w	r2, r2, r2
90020692:	bf28      	it	cs
90020694:	eba0 1001 	subcs.w	r0, r0, r1, lsl #4
90020698:	ebb0 0fc1 	cmp.w	r0, r1, lsl #3
9002069c:	bf00      	nop
9002069e:	eb42 0202 	adc.w	r2, r2, r2
900206a2:	bf28      	it	cs
900206a4:	eba0 00c1 	subcs.w	r0, r0, r1, lsl #3
900206a8:	ebb0 0f81 	cmp.w	r0, r1, lsl #2
900206ac:	bf00      	nop
900206ae:	eb42 0202 	adc.w	r2, r2, r2
900206b2:	bf28      	it	cs
900206b4:	eba0 0081 	subcs.w	r0, r0, r1, lsl #2
900206b8:	ebb0 0f41 	cmp.w	r0, r1, lsl #1
900206bc:	bf00      	nop
900206be:	eb42 0202 	adc.w	r2, r2, r2
900206c2:	bf28      	it	cs
900206c4:	eba0 0041 	subcs.w	r0, r0, r1, lsl #1
900206c8:	ebb0 0f01 	cmp.w	r0, r1
900206cc:	bf00      	nop
900206ce:	eb42 0202 	adc.w	r2, r2, r2
900206d2:	bf28      	it	cs
900206d4:	eba0 0001 	subcs.w	r0, r0, r1
900206d8:	4610      	mov	r0, r2
900206da:	4770      	bx	lr
900206dc:	bf0c      	ite	eq
900206de:	2001      	moveq	r0, #1
900206e0:	2000      	movne	r0, #0
900206e2:	4770      	bx	lr
900206e4:	fab1 f281 	clz	r2, r1
900206e8:	f1c2 021f 	rsb	r2, r2, #31
900206ec:	fa20 f002 	lsr.w	r0, r0, r2
900206f0:	4770      	bx	lr
900206f2:	b108      	cbz	r0, 900206f8 <__udivsi3+0x258>
900206f4:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
900206f8:	f000 b80e 	b.w	90020718 <__aeabi_idiv0>

900206fc <__aeabi_uidivmod>:
900206fc:	2900      	cmp	r1, #0
900206fe:	d0f8      	beq.n	900206f2 <__udivsi3+0x252>
90020700:	e92d 4003 	stmdb	sp!, {r0, r1, lr}
90020704:	f7ff fecc 	bl	900204a0 <__udivsi3>
90020708:	e8bd 4006 	ldmia.w	sp!, {r1, r2, lr}
9002070c:	fb02 f300 	mul.w	r3, r2, r0
90020710:	eba1 0103 	sub.w	r1, r1, r3
90020714:	4770      	bx	lr
90020716:	bf00      	nop

90020718 <__aeabi_idiv0>:
90020718:	4770      	bx	lr
9002071a:	bf00      	nop

9002071c <__ctzdi2>:
9002071c:	b930      	cbnz	r0, 9002072c <__ctzdi2+0x10>
9002071e:	fa91 f1a1 	rbit	r1, r1
90020722:	2020      	movs	r0, #32
90020724:	fab1 f181 	clz	r1, r1
90020728:	4408      	add	r0, r1
9002072a:	4770      	bx	lr
9002072c:	4601      	mov	r1, r0
9002072e:	fa91 f1a1 	rbit	r1, r1
90020732:	fab1 f181 	clz	r1, r1
90020736:	2000      	movs	r0, #0
90020738:	4408      	add	r0, r1
9002073a:	4770      	bx	lr

9002073c <exit>:
9002073c:	b508      	push	{r3, lr}
9002073e:	2100      	movs	r1, #0
90020740:	4604      	mov	r4, r0
90020742:	f000 fa29 	bl	90020b98 <__call_exitprocs>
90020746:	f243 0308 	movw	r3, #12296	; 0x3008
9002074a:	f2c9 0302 	movt	r3, #36866	; 0x9002
9002074e:	6818      	ldr	r0, [r3, #0]
90020750:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
90020752:	b103      	cbz	r3, 90020756 <exit+0x1a>
90020754:	4798      	blx	r3
90020756:	4620      	mov	r0, r4
90020758:	f000 fb36 	bl	90020dc8 <_exit>

9002075c <__libc_init_array>:
9002075c:	b570      	push	{r4, r5, r6, lr}
9002075e:	f240 0600 	movw	r6, #0
90020762:	f240 0500 	movw	r5, #0
90020766:	f2c0 0600 	movt	r6, #0
9002076a:	f2c0 0500 	movt	r5, #0
9002076e:	1b76      	subs	r6, r6, r5
90020770:	10b6      	asrs	r6, r6, #2
90020772:	bf18      	it	ne
90020774:	2400      	movne	r4, #0
90020776:	d005      	beq.n	90020784 <__libc_init_array+0x28>
90020778:	3401      	adds	r4, #1
9002077a:	f855 3b04 	ldr.w	r3, [r5], #4
9002077e:	4798      	blx	r3
90020780:	42a6      	cmp	r6, r4
90020782:	d1f9      	bne.n	90020778 <__libc_init_array+0x1c>
90020784:	f240 0600 	movw	r6, #0
90020788:	f240 0500 	movw	r5, #0
9002078c:	f2c0 0600 	movt	r6, #0
90020790:	f2c0 0500 	movt	r5, #0
90020794:	1b76      	subs	r6, r6, r5
90020796:	f000 fb19 	bl	90020dcc <_init>
9002079a:	10b6      	asrs	r6, r6, #2
9002079c:	bf18      	it	ne
9002079e:	2400      	movne	r4, #0
900207a0:	d006      	beq.n	900207b0 <__libc_init_array+0x54>
900207a2:	3401      	adds	r4, #1
900207a4:	f855 3b04 	ldr.w	r3, [r5], #4
900207a8:	4798      	blx	r3
900207aa:	42a6      	cmp	r6, r4
900207ac:	d1f9      	bne.n	900207a2 <__libc_init_array+0x46>
900207ae:	bd70      	pop	{r4, r5, r6, pc}
900207b0:	bd70      	pop	{r4, r5, r6, pc}
900207b2:	bf00      	nop

900207b4 <memcpy>:
900207b4:	4684      	mov	ip, r0
900207b6:	ea41 0300 	orr.w	r3, r1, r0
900207ba:	f013 0303 	ands.w	r3, r3, #3
900207be:	d149      	bne.n	90020854 <memcpy+0xa0>
900207c0:	3a40      	subs	r2, #64	; 0x40
900207c2:	d323      	bcc.n	9002080c <memcpy+0x58>
900207c4:	680b      	ldr	r3, [r1, #0]
900207c6:	6003      	str	r3, [r0, #0]
900207c8:	684b      	ldr	r3, [r1, #4]
900207ca:	6043      	str	r3, [r0, #4]
900207cc:	688b      	ldr	r3, [r1, #8]
900207ce:	6083      	str	r3, [r0, #8]
900207d0:	68cb      	ldr	r3, [r1, #12]
900207d2:	60c3      	str	r3, [r0, #12]
900207d4:	690b      	ldr	r3, [r1, #16]
900207d6:	6103      	str	r3, [r0, #16]
900207d8:	694b      	ldr	r3, [r1, #20]
900207da:	6143      	str	r3, [r0, #20]
900207dc:	698b      	ldr	r3, [r1, #24]
900207de:	6183      	str	r3, [r0, #24]
900207e0:	69cb      	ldr	r3, [r1, #28]
900207e2:	61c3      	str	r3, [r0, #28]
900207e4:	6a0b      	ldr	r3, [r1, #32]
900207e6:	6203      	str	r3, [r0, #32]
900207e8:	6a4b      	ldr	r3, [r1, #36]	; 0x24
900207ea:	6243      	str	r3, [r0, #36]	; 0x24
900207ec:	6a8b      	ldr	r3, [r1, #40]	; 0x28
900207ee:	6283      	str	r3, [r0, #40]	; 0x28
900207f0:	6acb      	ldr	r3, [r1, #44]	; 0x2c
900207f2:	62c3      	str	r3, [r0, #44]	; 0x2c
900207f4:	6b0b      	ldr	r3, [r1, #48]	; 0x30
900207f6:	6303      	str	r3, [r0, #48]	; 0x30
900207f8:	6b4b      	ldr	r3, [r1, #52]	; 0x34
900207fa:	6343      	str	r3, [r0, #52]	; 0x34
900207fc:	6b8b      	ldr	r3, [r1, #56]	; 0x38
900207fe:	6383      	str	r3, [r0, #56]	; 0x38
90020800:	6bcb      	ldr	r3, [r1, #60]	; 0x3c
90020802:	63c3      	str	r3, [r0, #60]	; 0x3c
90020804:	3040      	adds	r0, #64	; 0x40
90020806:	3140      	adds	r1, #64	; 0x40
90020808:	3a40      	subs	r2, #64	; 0x40
9002080a:	d2db      	bcs.n	900207c4 <memcpy+0x10>
9002080c:	3230      	adds	r2, #48	; 0x30
9002080e:	d30b      	bcc.n	90020828 <memcpy+0x74>
90020810:	680b      	ldr	r3, [r1, #0]
90020812:	6003      	str	r3, [r0, #0]
90020814:	684b      	ldr	r3, [r1, #4]
90020816:	6043      	str	r3, [r0, #4]
90020818:	688b      	ldr	r3, [r1, #8]
9002081a:	6083      	str	r3, [r0, #8]
9002081c:	68cb      	ldr	r3, [r1, #12]
9002081e:	60c3      	str	r3, [r0, #12]
90020820:	3010      	adds	r0, #16
90020822:	3110      	adds	r1, #16
90020824:	3a10      	subs	r2, #16
90020826:	d2f3      	bcs.n	90020810 <memcpy+0x5c>
90020828:	320c      	adds	r2, #12
9002082a:	d305      	bcc.n	90020838 <memcpy+0x84>
9002082c:	f851 3b04 	ldr.w	r3, [r1], #4
90020830:	f840 3b04 	str.w	r3, [r0], #4
90020834:	3a04      	subs	r2, #4
90020836:	d2f9      	bcs.n	9002082c <memcpy+0x78>
90020838:	3204      	adds	r2, #4
9002083a:	d008      	beq.n	9002084e <memcpy+0x9a>
9002083c:	07d2      	lsls	r2, r2, #31
9002083e:	bf1c      	itt	ne
90020840:	f811 3b01 	ldrbne.w	r3, [r1], #1
90020844:	f800 3b01 	strbne.w	r3, [r0], #1
90020848:	d301      	bcc.n	9002084e <memcpy+0x9a>
9002084a:	880b      	ldrh	r3, [r1, #0]
9002084c:	8003      	strh	r3, [r0, #0]
9002084e:	4660      	mov	r0, ip
90020850:	4770      	bx	lr
90020852:	bf00      	nop
90020854:	2a08      	cmp	r2, #8
90020856:	d313      	bcc.n	90020880 <memcpy+0xcc>
90020858:	078b      	lsls	r3, r1, #30
9002085a:	d0b1      	beq.n	900207c0 <memcpy+0xc>
9002085c:	f010 0303 	ands.w	r3, r0, #3
90020860:	d0ae      	beq.n	900207c0 <memcpy+0xc>
90020862:	f1c3 0304 	rsb	r3, r3, #4
90020866:	1ad2      	subs	r2, r2, r3
90020868:	07db      	lsls	r3, r3, #31
9002086a:	bf1c      	itt	ne
9002086c:	f811 3b01 	ldrbne.w	r3, [r1], #1
90020870:	f800 3b01 	strbne.w	r3, [r0], #1
90020874:	d3a4      	bcc.n	900207c0 <memcpy+0xc>
90020876:	f831 3b02 	ldrh.w	r3, [r1], #2
9002087a:	f820 3b02 	strh.w	r3, [r0], #2
9002087e:	e79f      	b.n	900207c0 <memcpy+0xc>
90020880:	3a04      	subs	r2, #4
90020882:	d3d9      	bcc.n	90020838 <memcpy+0x84>
90020884:	3a01      	subs	r2, #1
90020886:	f811 3b01 	ldrb.w	r3, [r1], #1
9002088a:	f800 3b01 	strb.w	r3, [r0], #1
9002088e:	d2f9      	bcs.n	90020884 <memcpy+0xd0>
90020890:	780b      	ldrb	r3, [r1, #0]
90020892:	7003      	strb	r3, [r0, #0]
90020894:	784b      	ldrb	r3, [r1, #1]
90020896:	7043      	strb	r3, [r0, #1]
90020898:	788b      	ldrb	r3, [r1, #2]
9002089a:	7083      	strb	r3, [r0, #2]
9002089c:	4660      	mov	r0, ip
9002089e:	4770      	bx	lr

900208a0 <memmove>:
900208a0:	4288      	cmp	r0, r1
900208a2:	b5f0      	push	{r4, r5, r6, r7, lr}
900208a4:	d90c      	bls.n	900208c0 <memmove+0x20>
900208a6:	188b      	adds	r3, r1, r2
900208a8:	4298      	cmp	r0, r3
900208aa:	d209      	bcs.n	900208c0 <memmove+0x20>
900208ac:	1884      	adds	r4, r0, r2
900208ae:	b1aa      	cbz	r2, 900208dc <memmove+0x3c>
900208b0:	4622      	mov	r2, r4
900208b2:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
900208b6:	4299      	cmp	r1, r3
900208b8:	f802 4d01 	strb.w	r4, [r2, #-1]!
900208bc:	d1f9      	bne.n	900208b2 <memmove+0x12>
900208be:	bdf0      	pop	{r4, r5, r6, r7, pc}
900208c0:	2a0f      	cmp	r2, #15
900208c2:	bf98      	it	ls
900208c4:	4603      	movls	r3, r0
900208c6:	d80a      	bhi.n	900208de <memmove+0x3e>
900208c8:	2a00      	cmp	r2, #0
900208ca:	d04e      	beq.n	9002096a <memmove+0xca>
900208cc:	3b01      	subs	r3, #1
900208ce:	440a      	add	r2, r1
900208d0:	f811 4b01 	ldrb.w	r4, [r1], #1
900208d4:	428a      	cmp	r2, r1
900208d6:	f803 4f01 	strb.w	r4, [r3, #1]!
900208da:	d1f9      	bne.n	900208d0 <memmove+0x30>
900208dc:	bdf0      	pop	{r4, r5, r6, r7, pc}
900208de:	ea41 0300 	orr.w	r3, r1, r0
900208e2:	079b      	lsls	r3, r3, #30
900208e4:	d13f      	bne.n	90020966 <memmove+0xc6>
900208e6:	f1a2 0710 	sub.w	r7, r2, #16
900208ea:	f100 0310 	add.w	r3, r0, #16
900208ee:	f027 060f 	bic.w	r6, r7, #15
900208f2:	f101 0410 	add.w	r4, r1, #16
900208f6:	3620      	adds	r6, #32
900208f8:	4406      	add	r6, r0
900208fa:	f854 5c10 	ldr.w	r5, [r4, #-16]
900208fe:	3310      	adds	r3, #16
90020900:	3410      	adds	r4, #16
90020902:	f843 5c20 	str.w	r5, [r3, #-32]
90020906:	f854 5c1c 	ldr.w	r5, [r4, #-28]
9002090a:	f843 5c1c 	str.w	r5, [r3, #-28]
9002090e:	f854 5c18 	ldr.w	r5, [r4, #-24]
90020912:	f843 5c18 	str.w	r5, [r3, #-24]
90020916:	f854 5c14 	ldr.w	r5, [r4, #-20]
9002091a:	f843 5c14 	str.w	r5, [r3, #-20]
9002091e:	42b3      	cmp	r3, r6
90020920:	d1eb      	bne.n	900208fa <memmove+0x5a>
90020922:	f002 040f 	and.w	r4, r2, #15
90020926:	f027 030f 	bic.w	r3, r7, #15
9002092a:	2c03      	cmp	r4, #3
9002092c:	f103 0310 	add.w	r3, r3, #16
90020930:	4419      	add	r1, r3
90020932:	4403      	add	r3, r0
90020934:	d91a      	bls.n	9002096c <memmove+0xcc>
90020936:	f1a4 0e04 	sub.w	lr, r4, #4
9002093a:	1f1d      	subs	r5, r3, #4
9002093c:	f02e 0703 	bic.w	r7, lr, #3
90020940:	460c      	mov	r4, r1
90020942:	3704      	adds	r7, #4
90020944:	440f      	add	r7, r1
90020946:	f854 6b04 	ldr.w	r6, [r4], #4
9002094a:	42bc      	cmp	r4, r7
9002094c:	f845 6f04 	str.w	r6, [r5, #4]!
90020950:	d1f9      	bne.n	90020946 <memmove+0xa6>
90020952:	f02e 0403 	bic.w	r4, lr, #3
90020956:	f002 0203 	and.w	r2, r2, #3
9002095a:	3404      	adds	r4, #4
9002095c:	4421      	add	r1, r4
9002095e:	4423      	add	r3, r4
90020960:	2a00      	cmp	r2, #0
90020962:	d1b3      	bne.n	900208cc <memmove+0x2c>
90020964:	e001      	b.n	9002096a <memmove+0xca>
90020966:	4603      	mov	r3, r0
90020968:	e7b0      	b.n	900208cc <memmove+0x2c>
9002096a:	bdf0      	pop	{r4, r5, r6, r7, pc}
9002096c:	4622      	mov	r2, r4
9002096e:	2a00      	cmp	r2, #0
90020970:	d1ac      	bne.n	900208cc <memmove+0x2c>
90020972:	e7fa      	b.n	9002096a <memmove+0xca>

90020974 <memset>:
90020974:	b4f0      	push	{r4, r5, r6, r7}
90020976:	0786      	lsls	r6, r0, #30
90020978:	d04a      	beq.n	90020a10 <memset+0x9c>
9002097a:	1e54      	subs	r4, r2, #1
9002097c:	2a00      	cmp	r2, #0
9002097e:	d045      	beq.n	90020a0c <memset+0x98>
90020980:	b2ca      	uxtb	r2, r1
90020982:	4603      	mov	r3, r0
90020984:	e002      	b.n	9002098c <memset+0x18>
90020986:	f114 34ff 	adds.w	r4, r4, #4294967295	; 0xffffffff
9002098a:	d33f      	bcc.n	90020a0c <memset+0x98>
9002098c:	f803 2b01 	strb.w	r2, [r3], #1
90020990:	079d      	lsls	r5, r3, #30
90020992:	d1f8      	bne.n	90020986 <memset+0x12>
90020994:	2c03      	cmp	r4, #3
90020996:	d932      	bls.n	900209fe <memset+0x8a>
90020998:	b2cd      	uxtb	r5, r1
9002099a:	2c0f      	cmp	r4, #15
9002099c:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
900209a0:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
900209a4:	d91b      	bls.n	900209de <memset+0x6a>
900209a6:	f1a4 0710 	sub.w	r7, r4, #16
900209aa:	f103 0210 	add.w	r2, r3, #16
900209ae:	f027 060f 	bic.w	r6, r7, #15
900209b2:	3620      	adds	r6, #32
900209b4:	441e      	add	r6, r3
900209b6:	f842 5c10 	str.w	r5, [r2, #-16]
900209ba:	3210      	adds	r2, #16
900209bc:	f842 5c1c 	str.w	r5, [r2, #-28]
900209c0:	f842 5c18 	str.w	r5, [r2, #-24]
900209c4:	f842 5c14 	str.w	r5, [r2, #-20]
900209c8:	42b2      	cmp	r2, r6
900209ca:	d1f4      	bne.n	900209b6 <memset+0x42>
900209cc:	f004 040f 	and.w	r4, r4, #15
900209d0:	f027 070f 	bic.w	r7, r7, #15
900209d4:	2c03      	cmp	r4, #3
900209d6:	f107 0710 	add.w	r7, r7, #16
900209da:	443b      	add	r3, r7
900209dc:	d90f      	bls.n	900209fe <memset+0x8a>
900209de:	1f27      	subs	r7, r4, #4
900209e0:	461a      	mov	r2, r3
900209e2:	f027 0603 	bic.w	r6, r7, #3
900209e6:	3604      	adds	r6, #4
900209e8:	441e      	add	r6, r3
900209ea:	f842 5b04 	str.w	r5, [r2], #4
900209ee:	4296      	cmp	r6, r2
900209f0:	d1fb      	bne.n	900209ea <memset+0x76>
900209f2:	f027 0703 	bic.w	r7, r7, #3
900209f6:	f004 0403 	and.w	r4, r4, #3
900209fa:	3704      	adds	r7, #4
900209fc:	443b      	add	r3, r7
900209fe:	b12c      	cbz	r4, 90020a0c <memset+0x98>
90020a00:	b2c9      	uxtb	r1, r1
90020a02:	441c      	add	r4, r3
90020a04:	f803 1b01 	strb.w	r1, [r3], #1
90020a08:	429c      	cmp	r4, r3
90020a0a:	d1fb      	bne.n	90020a04 <memset+0x90>
90020a0c:	bcf0      	pop	{r4, r5, r6, r7}
90020a0e:	4770      	bx	lr
90020a10:	4614      	mov	r4, r2
90020a12:	4603      	mov	r3, r0
90020a14:	e7be      	b.n	90020994 <memset+0x20>
90020a16:	bf00      	nop

90020a18 <strlen>:
90020a18:	f020 0103 	bic.w	r1, r0, #3
90020a1c:	f010 0003 	ands.w	r0, r0, #3
90020a20:	f1c0 0000 	rsb	r0, r0, #0
90020a24:	f851 3b04 	ldr.w	r3, [r1], #4
90020a28:	f100 0c04 	add.w	ip, r0, #4
90020a2c:	ea4f 0ccc 	mov.w	ip, ip, lsl #3
90020a30:	f06f 0200 	mvn.w	r2, #0
90020a34:	bf1c      	itt	ne
90020a36:	fa22 f20c 	lsrne.w	r2, r2, ip
90020a3a:	4313      	orrne	r3, r2
90020a3c:	f04f 0c01 	mov.w	ip, #1
90020a40:	ea4c 2c0c 	orr.w	ip, ip, ip, lsl #8
90020a44:	ea4c 4c0c 	orr.w	ip, ip, ip, lsl #16
90020a48:	eba3 020c 	sub.w	r2, r3, ip
90020a4c:	ea22 0203 	bic.w	r2, r2, r3
90020a50:	ea12 12cc 	ands.w	r2, r2, ip, lsl #7
90020a54:	bf04      	itt	eq
90020a56:	f851 3b04 	ldreq.w	r3, [r1], #4
90020a5a:	3004      	addeq	r0, #4
90020a5c:	d0f4      	beq.n	90020a48 <strlen+0x30>
90020a5e:	f1c2 0100 	rsb	r1, r2, #0
90020a62:	ea02 0201 	and.w	r2, r2, r1
90020a66:	fab2 f282 	clz	r2, r2
90020a6a:	f1c2 021f 	rsb	r2, r2, #31
90020a6e:	eb00 00d2 	add.w	r0, r0, r2, lsr #3
90020a72:	4770      	bx	lr

90020a74 <strncmp>:
90020a74:	2a00      	cmp	r2, #0
90020a76:	d043      	beq.n	90020b00 <strncmp+0x8c>
90020a78:	ea40 0301 	orr.w	r3, r0, r1
90020a7c:	f013 0303 	ands.w	r3, r3, #3
90020a80:	b4f0      	push	{r4, r5, r6, r7}
90020a82:	d125      	bne.n	90020ad0 <strncmp+0x5c>
90020a84:	2a03      	cmp	r2, #3
90020a86:	d923      	bls.n	90020ad0 <strncmp+0x5c>
90020a88:	6804      	ldr	r4, [r0, #0]
90020a8a:	680d      	ldr	r5, [r1, #0]
90020a8c:	42ac      	cmp	r4, r5
90020a8e:	d11f      	bne.n	90020ad0 <strncmp+0x5c>
90020a90:	3a04      	subs	r2, #4
90020a92:	d037      	beq.n	90020b04 <strncmp+0x90>
90020a94:	f1a4 3501 	sub.w	r5, r4, #16843009	; 0x1010101
90020a98:	ea25 0404 	bic.w	r4, r5, r4
90020a9c:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
90020aa0:	bf04      	itt	eq
90020aa2:	3004      	addeq	r0, #4
90020aa4:	3104      	addeq	r1, #4
90020aa6:	d00f      	beq.n	90020ac8 <strncmp+0x54>
90020aa8:	e02c      	b.n	90020b04 <strncmp+0x90>
90020aaa:	f850 3b04 	ldr.w	r3, [r0], #4
90020aae:	3104      	adds	r1, #4
90020ab0:	682e      	ldr	r6, [r5, #0]
90020ab2:	f1a3 3401 	sub.w	r4, r3, #16843009	; 0x1010101
90020ab6:	42b3      	cmp	r3, r6
90020ab8:	ea24 0403 	bic.w	r4, r4, r3
90020abc:	d125      	bne.n	90020b0a <strncmp+0x96>
90020abe:	3a04      	subs	r2, #4
90020ac0:	d020      	beq.n	90020b04 <strncmp+0x90>
90020ac2:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
90020ac6:	d11d      	bne.n	90020b04 <strncmp+0x90>
90020ac8:	2a03      	cmp	r2, #3
90020aca:	4607      	mov	r7, r0
90020acc:	460d      	mov	r5, r1
90020ace:	d8ec      	bhi.n	90020aaa <strncmp+0x36>
90020ad0:	7803      	ldrb	r3, [r0, #0]
90020ad2:	3a01      	subs	r2, #1
90020ad4:	780c      	ldrb	r4, [r1, #0]
90020ad6:	429c      	cmp	r4, r3
90020ad8:	d10f      	bne.n	90020afa <strncmp+0x86>
90020ada:	2a00      	cmp	r2, #0
90020adc:	bf18      	it	ne
90020ade:	2c00      	cmpne	r4, #0
90020ae0:	d104      	bne.n	90020aec <strncmp+0x78>
90020ae2:	e00f      	b.n	90020b04 <strncmp+0x90>
90020ae4:	2a00      	cmp	r2, #0
90020ae6:	bf18      	it	ne
90020ae8:	2b00      	cmpne	r3, #0
90020aea:	d00b      	beq.n	90020b04 <strncmp+0x90>
90020aec:	f810 3f01 	ldrb.w	r3, [r0, #1]!
90020af0:	3a01      	subs	r2, #1
90020af2:	f811 4f01 	ldrb.w	r4, [r1, #1]!
90020af6:	42a3      	cmp	r3, r4
90020af8:	d0f4      	beq.n	90020ae4 <strncmp+0x70>
90020afa:	1b18      	subs	r0, r3, r4
90020afc:	bcf0      	pop	{r4, r5, r6, r7}
90020afe:	4770      	bx	lr
90020b00:	4610      	mov	r0, r2
90020b02:	4770      	bx	lr
90020b04:	2000      	movs	r0, #0
90020b06:	bcf0      	pop	{r4, r5, r6, r7}
90020b08:	4770      	bx	lr
90020b0a:	4629      	mov	r1, r5
90020b0c:	4638      	mov	r0, r7
90020b0e:	e7df      	b.n	90020ad0 <strncmp+0x5c>

90020b10 <strncpy>:
90020b10:	2a03      	cmp	r2, #3
90020b12:	ea40 0301 	orr.w	r3, r0, r1
90020b16:	f3c3 0301 	ubfx	r3, r3, #0, #2
90020b1a:	b470      	push	{r4, r5, r6}
90020b1c:	bf94      	ite	ls
90020b1e:	2400      	movls	r4, #0
90020b20:	2401      	movhi	r4, #1
90020b22:	2b00      	cmp	r3, #0
90020b24:	4605      	mov	r5, r0
90020b26:	bf18      	it	ne
90020b28:	2400      	movne	r4, #0
90020b2a:	b174      	cbz	r4, 90020b4a <strncpy+0x3a>
90020b2c:	460e      	mov	r6, r1
90020b2e:	f851 4b04 	ldr.w	r4, [r1], #4
90020b32:	f1a4 3301 	sub.w	r3, r4, #16843009	; 0x1010101
90020b36:	ea23 0304 	bic.w	r3, r3, r4
90020b3a:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
90020b3e:	d11c      	bne.n	90020b7a <strncpy+0x6a>
90020b40:	3a04      	subs	r2, #4
90020b42:	f845 4b04 	str.w	r4, [r5], #4
90020b46:	2a03      	cmp	r2, #3
90020b48:	d8f0      	bhi.n	90020b2c <strncpy+0x1c>
90020b4a:	b1a2      	cbz	r2, 90020b76 <strncpy+0x66>
90020b4c:	780c      	ldrb	r4, [r1, #0]
90020b4e:	3a01      	subs	r2, #1
90020b50:	1c6b      	adds	r3, r5, #1
90020b52:	3101      	adds	r1, #1
90020b54:	702c      	strb	r4, [r5, #0]
90020b56:	b13c      	cbz	r4, 90020b68 <strncpy+0x58>
90020b58:	b16a      	cbz	r2, 90020b76 <strncpy+0x66>
90020b5a:	f811 4b01 	ldrb.w	r4, [r1], #1
90020b5e:	3a01      	subs	r2, #1
90020b60:	f803 4b01 	strb.w	r4, [r3], #1
90020b64:	2c00      	cmp	r4, #0
90020b66:	d1f7      	bne.n	90020b58 <strncpy+0x48>
90020b68:	b12a      	cbz	r2, 90020b76 <strncpy+0x66>
90020b6a:	441a      	add	r2, r3
90020b6c:	2100      	movs	r1, #0
90020b6e:	f803 1b01 	strb.w	r1, [r3], #1
90020b72:	429a      	cmp	r2, r3
90020b74:	d1fb      	bne.n	90020b6e <strncpy+0x5e>
90020b76:	bc70      	pop	{r4, r5, r6}
90020b78:	4770      	bx	lr
90020b7a:	4631      	mov	r1, r6
90020b7c:	e7e6      	b.n	90020b4c <strncpy+0x3c>
90020b7e:	bf00      	nop

90020b80 <register_fini>:
90020b80:	f240 0300 	movw	r3, #0
90020b84:	f2c0 0300 	movt	r3, #0
90020b88:	b12b      	cbz	r3, 90020b96 <register_fini+0x16>
90020b8a:	f640 409d 	movw	r0, #3229	; 0xc9d
90020b8e:	f2c9 0002 	movt	r0, #36866	; 0x9002
90020b92:	f000 b87d 	b.w	90020c90 <atexit>
90020b96:	4770      	bx	lr

90020b98 <__call_exitprocs>:
90020b98:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
90020b9c:	f643 13a8 	movw	r3, #14760	; 0x39a8
90020ba0:	b087      	sub	sp, #28
90020ba2:	f2c9 0302 	movt	r3, #36866	; 0x9002
90020ba6:	460e      	mov	r6, r1
90020ba8:	9305      	str	r3, [sp, #20]
90020baa:	9001      	str	r0, [sp, #4]
90020bac:	6818      	ldr	r0, [r3, #0]
90020bae:	f240 0300 	movw	r3, #0
90020bb2:	461c      	mov	r4, r3
90020bb4:	f000 f896 	bl	90020ce4 <__retarget_lock_acquire_recursive>
90020bb8:	f243 0308 	movw	r3, #12296	; 0x3008
90020bbc:	f2c9 0302 	movt	r3, #36866	; 0x9002
90020bc0:	4622      	mov	r2, r4
90020bc2:	f2c0 0200 	movt	r2, #0
90020bc6:	681b      	ldr	r3, [r3, #0]
90020bc8:	9202      	str	r2, [sp, #8]
90020bca:	9303      	str	r3, [sp, #12]
90020bcc:	f503 73a4 	add.w	r3, r3, #328	; 0x148
90020bd0:	9304      	str	r3, [sp, #16]
90020bd2:	9b03      	ldr	r3, [sp, #12]
90020bd4:	f8d3 7148 	ldr.w	r7, [r3, #328]	; 0x148
90020bd8:	b32f      	cbz	r7, 90020c26 <__call_exitprocs+0x8e>
90020bda:	f8dd b010 	ldr.w	fp, [sp, #16]
90020bde:	f04f 0a01 	mov.w	sl, #1
90020be2:	687c      	ldr	r4, [r7, #4]
90020be4:	1e65      	subs	r5, r4, #1
90020be6:	bf5e      	ittt	pl
90020be8:	3401      	addpl	r4, #1
90020bea:	f04f 0900 	movpl.w	r9, #0
90020bee:	eb07 0484 	addpl.w	r4, r7, r4, lsl #2
90020bf2:	d408      	bmi.n	90020c06 <__call_exitprocs+0x6e>
90020bf4:	b1f6      	cbz	r6, 90020c34 <__call_exitprocs+0x9c>
90020bf6:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
90020bfa:	429e      	cmp	r6, r3
90020bfc:	d01a      	beq.n	90020c34 <__call_exitprocs+0x9c>
90020bfe:	3d01      	subs	r5, #1
90020c00:	3c04      	subs	r4, #4
90020c02:	1c6b      	adds	r3, r5, #1
90020c04:	d1f6      	bne.n	90020bf4 <__call_exitprocs+0x5c>
90020c06:	9b02      	ldr	r3, [sp, #8]
90020c08:	b16b      	cbz	r3, 90020c26 <__call_exitprocs+0x8e>
90020c0a:	687b      	ldr	r3, [r7, #4]
90020c0c:	2b00      	cmp	r3, #0
90020c0e:	d139      	bne.n	90020c84 <__call_exitprocs+0xec>
90020c10:	683b      	ldr	r3, [r7, #0]
90020c12:	b143      	cbz	r3, 90020c26 <__call_exitprocs+0x8e>
90020c14:	4638      	mov	r0, r7
90020c16:	f8cb 3000 	str.w	r3, [fp]
90020c1a:	f3af 8000 	nop.w
90020c1e:	f8db 7000 	ldr.w	r7, [fp]
90020c22:	2f00      	cmp	r7, #0
90020c24:	d1dd      	bne.n	90020be2 <__call_exitprocs+0x4a>
90020c26:	9b05      	ldr	r3, [sp, #20]
90020c28:	6818      	ldr	r0, [r3, #0]
90020c2a:	b007      	add	sp, #28
90020c2c:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
90020c30:	f000 b860 	b.w	90020cf4 <__retarget_lock_release_recursive>
90020c34:	687b      	ldr	r3, [r7, #4]
90020c36:	6822      	ldr	r2, [r4, #0]
90020c38:	3b01      	subs	r3, #1
90020c3a:	42ab      	cmp	r3, r5
90020c3c:	bf0c      	ite	eq
90020c3e:	607d      	streq	r5, [r7, #4]
90020c40:	f8c4 9000 	strne.w	r9, [r4]
90020c44:	2a00      	cmp	r2, #0
90020c46:	d0da      	beq.n	90020bfe <__call_exitprocs+0x66>
90020c48:	f8d7 1188 	ldr.w	r1, [r7, #392]	; 0x188
90020c4c:	fa0a f305 	lsl.w	r3, sl, r5
90020c50:	f8d7 8004 	ldr.w	r8, [r7, #4]
90020c54:	420b      	tst	r3, r1
90020c56:	d00f      	beq.n	90020c78 <__call_exitprocs+0xe0>
90020c58:	f8d7 118c 	ldr.w	r1, [r7, #396]	; 0x18c
90020c5c:	420b      	tst	r3, r1
90020c5e:	d10d      	bne.n	90020c7c <__call_exitprocs+0xe4>
90020c60:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
90020c64:	9801      	ldr	r0, [sp, #4]
90020c66:	4790      	blx	r2
90020c68:	687b      	ldr	r3, [r7, #4]
90020c6a:	4543      	cmp	r3, r8
90020c6c:	d1b1      	bne.n	90020bd2 <__call_exitprocs+0x3a>
90020c6e:	f8db 3000 	ldr.w	r3, [fp]
90020c72:	42bb      	cmp	r3, r7
90020c74:	d0c3      	beq.n	90020bfe <__call_exitprocs+0x66>
90020c76:	e7ac      	b.n	90020bd2 <__call_exitprocs+0x3a>
90020c78:	4790      	blx	r2
90020c7a:	e7f5      	b.n	90020c68 <__call_exitprocs+0xd0>
90020c7c:	f8d4 0080 	ldr.w	r0, [r4, #128]	; 0x80
90020c80:	4790      	blx	r2
90020c82:	e7f1      	b.n	90020c68 <__call_exitprocs+0xd0>
90020c84:	46bb      	mov	fp, r7
90020c86:	683f      	ldr	r7, [r7, #0]
90020c88:	2f00      	cmp	r7, #0
90020c8a:	d1aa      	bne.n	90020be2 <__call_exitprocs+0x4a>
90020c8c:	e7cb      	b.n	90020c26 <__call_exitprocs+0x8e>
90020c8e:	bf00      	nop

90020c90 <atexit>:
90020c90:	2300      	movs	r3, #0
90020c92:	4601      	mov	r1, r0
90020c94:	461a      	mov	r2, r3
90020c96:	4618      	mov	r0, r3
90020c98:	f000 b82e 	b.w	90020cf8 <__register_exitproc>

90020c9c <__libc_fini_array>:
90020c9c:	b538      	push	{r3, r4, r5, lr}
90020c9e:	f240 0400 	movw	r4, #0
90020ca2:	f240 0500 	movw	r5, #0
90020ca6:	f2c0 0400 	movt	r4, #0
90020caa:	f2c0 0500 	movt	r5, #0
90020cae:	1b64      	subs	r4, r4, r5
90020cb0:	10a4      	asrs	r4, r4, #2
90020cb2:	bf18      	it	ne
90020cb4:	eb05 0584 	addne.w	r5, r5, r4, lsl #2
90020cb8:	d005      	beq.n	90020cc6 <__libc_fini_array+0x2a>
90020cba:	3c01      	subs	r4, #1
90020cbc:	f855 3d04 	ldr.w	r3, [r5, #-4]!
90020cc0:	4798      	blx	r3
90020cc2:	2c00      	cmp	r4, #0
90020cc4:	d1f9      	bne.n	90020cba <__libc_fini_array+0x1e>
90020cc6:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
90020cca:	f000 b885 	b.w	90020dd8 <_fini>
90020cce:	bf00      	nop

90020cd0 <__retarget_lock_init>:
90020cd0:	4770      	bx	lr
90020cd2:	bf00      	nop

90020cd4 <__retarget_lock_init_recursive>:
90020cd4:	4770      	bx	lr
90020cd6:	bf00      	nop

90020cd8 <__retarget_lock_close>:
90020cd8:	4770      	bx	lr
90020cda:	bf00      	nop

90020cdc <__retarget_lock_close_recursive>:
90020cdc:	4770      	bx	lr
90020cde:	bf00      	nop

90020ce0 <__retarget_lock_acquire>:
90020ce0:	4770      	bx	lr
90020ce2:	bf00      	nop

90020ce4 <__retarget_lock_acquire_recursive>:
90020ce4:	4770      	bx	lr
90020ce6:	bf00      	nop

90020ce8 <__retarget_lock_try_acquire>:
90020ce8:	2001      	movs	r0, #1
90020cea:	4770      	bx	lr

90020cec <__retarget_lock_try_acquire_recursive>:
90020cec:	2001      	movs	r0, #1
90020cee:	4770      	bx	lr

90020cf0 <__retarget_lock_release>:
90020cf0:	4770      	bx	lr
90020cf2:	bf00      	nop

90020cf4 <__retarget_lock_release_recursive>:
90020cf4:	4770      	bx	lr
90020cf6:	bf00      	nop

90020cf8 <__register_exitproc>:
90020cf8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
90020cfc:	f643 14a8 	movw	r4, #14760	; 0x39a8
90020d00:	f2c9 0402 	movt	r4, #36866	; 0x9002
90020d04:	4605      	mov	r5, r0
90020d06:	461f      	mov	r7, r3
90020d08:	460e      	mov	r6, r1
90020d0a:	6820      	ldr	r0, [r4, #0]
90020d0c:	4690      	mov	r8, r2
90020d0e:	f7ff ffe9 	bl	90020ce4 <__retarget_lock_acquire_recursive>
90020d12:	f243 0308 	movw	r3, #12296	; 0x3008
90020d16:	f2c9 0302 	movt	r3, #36866	; 0x9002
90020d1a:	f8d3 9000 	ldr.w	r9, [r3]
90020d1e:	f8d9 3148 	ldr.w	r3, [r9, #328]	; 0x148
90020d22:	2b00      	cmp	r3, #0
90020d24:	d043      	beq.n	90020dae <__register_exitproc+0xb6>
90020d26:	685a      	ldr	r2, [r3, #4]
90020d28:	2a1f      	cmp	r2, #31
90020d2a:	bfd8      	it	le
90020d2c:	f102 0e01 	addle.w	lr, r2, #1
90020d30:	dd19      	ble.n	90020d66 <__register_exitproc+0x6e>
90020d32:	f240 0300 	movw	r3, #0
90020d36:	f2c0 0300 	movt	r3, #0
90020d3a:	2b00      	cmp	r3, #0
90020d3c:	d03c      	beq.n	90020db8 <__register_exitproc+0xc0>
90020d3e:	f44f 70c8 	mov.w	r0, #400	; 0x190
90020d42:	f3af 8000 	nop.w
90020d46:	4603      	mov	r3, r0
90020d48:	b3b0      	cbz	r0, 90020db8 <__register_exitproc+0xc0>
90020d4a:	f8d9 1148 	ldr.w	r1, [r9, #328]	; 0x148
90020d4e:	2000      	movs	r0, #0
90020d50:	4602      	mov	r2, r0
90020d52:	f04f 0e01 	mov.w	lr, #1
90020d56:	6058      	str	r0, [r3, #4]
90020d58:	6019      	str	r1, [r3, #0]
90020d5a:	f8c9 3148 	str.w	r3, [r9, #328]	; 0x148
90020d5e:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
90020d62:	f8c3 018c 	str.w	r0, [r3, #396]	; 0x18c
90020d66:	b1bd      	cbz	r5, 90020d98 <__register_exitproc+0xa0>
90020d68:	eb03 0182 	add.w	r1, r3, r2, lsl #2
90020d6c:	2d02      	cmp	r5, #2
90020d6e:	f04f 0c01 	mov.w	ip, #1
90020d72:	f8c1 8088 	str.w	r8, [r1, #136]	; 0x88
90020d76:	fa0c fc02 	lsl.w	ip, ip, r2
90020d7a:	f8d3 0188 	ldr.w	r0, [r3, #392]	; 0x188
90020d7e:	ea40 000c 	orr.w	r0, r0, ip
90020d82:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
90020d86:	f8c1 7108 	str.w	r7, [r1, #264]	; 0x108
90020d8a:	bf02      	ittt	eq
90020d8c:	f8d3 118c 	ldreq.w	r1, [r3, #396]	; 0x18c
90020d90:	ea41 010c 	orreq.w	r1, r1, ip
90020d94:	f8c3 118c 	streq.w	r1, [r3, #396]	; 0x18c
90020d98:	3202      	adds	r2, #2
90020d9a:	f8c3 e004 	str.w	lr, [r3, #4]
90020d9e:	6820      	ldr	r0, [r4, #0]
90020da0:	f843 6022 	str.w	r6, [r3, r2, lsl #2]
90020da4:	f7ff ffa6 	bl	90020cf4 <__retarget_lock_release_recursive>
90020da8:	2000      	movs	r0, #0
90020daa:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
90020dae:	f509 73a6 	add.w	r3, r9, #332	; 0x14c
90020db2:	f8c9 3148 	str.w	r3, [r9, #328]	; 0x148
90020db6:	e7b6      	b.n	90020d26 <__register_exitproc+0x2e>
90020db8:	6820      	ldr	r0, [r4, #0]
90020dba:	f7ff ff9b 	bl	90020cf4 <__retarget_lock_release_recursive>
90020dbe:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
90020dc2:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
90020dc6:	bf00      	nop

90020dc8 <_exit>:
90020dc8:	e7fe      	b.n	90020dc8 <_exit>
90020dca:	bf00      	nop

Disassembly of section .init:

90020dcc <_init>:
90020dcc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
90020dce:	bf00      	nop
90020dd0:	bcf8      	pop	{r3, r4, r5, r6, r7}
90020dd2:	bc08      	pop	{r3}
90020dd4:	469e      	mov	lr, r3
90020dd6:	4770      	bx	lr

Disassembly of section .fini:

90020dd8 <_fini>:
90020dd8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
90020dda:	bf00      	nop
90020ddc:	bcf8      	pop	{r3, r4, r5, r6, r7}
90020dde:	bc08      	pop	{r3}
90020de0:	469e      	mov	lr, r3
90020de2:	4770      	bx	lr
