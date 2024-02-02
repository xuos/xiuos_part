
test_priority:     file format elf32-littlearm


Disassembly of section .init:

00008000 <_init>:
    8000:	e1a0c00d 	mov	ip, sp
    8004:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
    8008:	e24cb004 	sub	fp, ip, #4
    800c:	e24bd028 	sub	sp, fp, #40	; 0x28
    8010:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
    8014:	e12fff1e 	bx	lr

Disassembly of section .text:

00008018 <__do_global_dtors_aux>:
    8018:	e92d4010 	push	{r4, lr}
    801c:	e59f4028 	ldr	r4, [pc, #40]	; 804c <__do_global_dtors_aux+0x34>
    8020:	e5d43000 	ldrb	r3, [r4]
    8024:	e3530000 	cmp	r3, #0
    8028:	1a000005 	bne	8044 <__do_global_dtors_aux+0x2c>
    802c:	e59f301c 	ldr	r3, [pc, #28]	; 8050 <__do_global_dtors_aux+0x38>
    8030:	e3530000 	cmp	r3, #0
    8034:	159f0018 	ldrne	r0, [pc, #24]	; 8054 <__do_global_dtors_aux+0x3c>
    8038:	1320f000 	nopne	{0}
    803c:	e3a03001 	mov	r3, #1
    8040:	e5c43000 	strb	r3, [r4]
    8044:	e8bd4010 	pop	{r4, lr}
    8048:	e12fff1e 	bx	lr
    804c:	00008ed8 	.word	0x00008ed8
    8050:	00000000 	.word	0x00000000
    8054:	00008eb0 	.word	0x00008eb0

00008058 <frame_dummy>:
    8058:	e59f3060 	ldr	r3, [pc, #96]	; 80c0 <frame_dummy+0x68>
    805c:	e3530000 	cmp	r3, #0
    8060:	0a000009 	beq	808c <frame_dummy+0x34>
    8064:	e59f0058 	ldr	r0, [pc, #88]	; 80c4 <frame_dummy+0x6c>
    8068:	e92d4010 	push	{r4, lr}
    806c:	e59f1054 	ldr	r1, [pc, #84]	; 80c8 <frame_dummy+0x70>
    8070:	e320f000 	nop	{0}
    8074:	e59f0050 	ldr	r0, [pc, #80]	; 80cc <frame_dummy+0x74>
    8078:	e5903000 	ldr	r3, [r0]
    807c:	e3530000 	cmp	r3, #0
    8080:	1a000009 	bne	80ac <frame_dummy+0x54>
    8084:	e8bd4010 	pop	{r4, lr}
    8088:	e12fff1e 	bx	lr
    808c:	e59f0038 	ldr	r0, [pc, #56]	; 80cc <frame_dummy+0x74>
    8090:	e5903000 	ldr	r3, [r0]
    8094:	e3530000 	cmp	r3, #0
    8098:	012fff1e 	bxeq	lr
    809c:	e59f302c 	ldr	r3, [pc, #44]	; 80d0 <frame_dummy+0x78>
    80a0:	e3530000 	cmp	r3, #0
    80a4:	012fff1e 	bxeq	lr
    80a8:	e12fff13 	bx	r3
    80ac:	e59f301c 	ldr	r3, [pc, #28]	; 80d0 <frame_dummy+0x78>
    80b0:	e3530000 	cmp	r3, #0
    80b4:	0afffff2 	beq	8084 <frame_dummy+0x2c>
    80b8:	e8bd4010 	pop	{r4, lr}
    80bc:	e12fff13 	bx	r3
    80c0:	00000000 	.word	0x00000000
    80c4:	00008eb0 	.word	0x00008eb0
    80c8:	00008edc 	.word	0x00008edc
    80cc:	00008ebc 	.word	0x00008ebc
    80d0:	00000000 	.word	0x00000000

000080d4 <_mainCRTStartup>:
    80d4:	e59f30f0 	ldr	r3, [pc, #240]	; 81cc <_mainCRTStartup+0xf8>
    80d8:	e3530000 	cmp	r3, #0
    80dc:	059f30e4 	ldreq	r3, [pc, #228]	; 81c8 <_mainCRTStartup+0xf4>
    80e0:	e1a0d003 	mov	sp, r3
    80e4:	e10f2000 	mrs	r2, CPSR
    80e8:	e312000f 	tst	r2, #15
    80ec:	0a000015 	beq	8148 <_mainCRTStartup+0x74>
    80f0:	e321f0d1 	msr	CPSR_c, #209	; 0xd1
    80f4:	e1a0d003 	mov	sp, r3
    80f8:	e24daa01 	sub	sl, sp, #4096	; 0x1000
    80fc:	e1a0300a 	mov	r3, sl
    8100:	e321f0d7 	msr	CPSR_c, #215	; 0xd7
    8104:	e1a0d003 	mov	sp, r3
    8108:	e2433a01 	sub	r3, r3, #4096	; 0x1000
    810c:	e321f0db 	msr	CPSR_c, #219	; 0xdb
    8110:	e1a0d003 	mov	sp, r3
    8114:	e2433a01 	sub	r3, r3, #4096	; 0x1000
    8118:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    811c:	e1a0d003 	mov	sp, r3
    8120:	e2433a02 	sub	r3, r3, #8192	; 0x2000
    8124:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
    8128:	e1a0d003 	mov	sp, r3
    812c:	e2433902 	sub	r3, r3, #32768	; 0x8000
    8130:	e3c330ff 	bic	r3, r3, #255	; 0xff
    8134:	e3c33cff 	bic	r3, r3, #65280	; 0xff00
    8138:	e5033004 	str	r3, [r3, #-4]
    813c:	e9532000 	ldmdb	r3, {sp}^
    8140:	e38220c0 	orr	r2, r2, #192	; 0xc0
    8144:	e121f002 	msr	CPSR_c, r2
    8148:	e243a801 	sub	sl, r3, #65536	; 0x10000
    814c:	e3b01000 	movs	r1, #0
    8150:	e1a0b001 	mov	fp, r1
    8154:	e1a07001 	mov	r7, r1
    8158:	e59f0078 	ldr	r0, [pc, #120]	; 81d8 <_mainCRTStartup+0x104>
    815c:	e59f2078 	ldr	r2, [pc, #120]	; 81dc <_mainCRTStartup+0x108>
    8160:	e0522000 	subs	r2, r2, r0
    8164:	eb0002f6 	bl	8d44 <memset>
    8168:	e59f3060 	ldr	r3, [pc, #96]	; 81d0 <_mainCRTStartup+0xfc>
    816c:	e3530000 	cmp	r3, #0
    8170:	0a000001 	beq	817c <_mainCRTStartup+0xa8>
    8174:	e1a0e00f 	mov	lr, pc
    8178:	e1a0f003 	mov	pc, r3
    817c:	e59f3050 	ldr	r3, [pc, #80]	; 81d4 <_mainCRTStartup+0x100>
    8180:	e3530000 	cmp	r3, #0
    8184:	0a000001 	beq	8190 <_mainCRTStartup+0xbc>
    8188:	e1a0e00f 	mov	lr, pc
    818c:	e1a0f003 	mov	pc, r3
    8190:	e3b00000 	movs	r0, #0
    8194:	e3b01000 	movs	r1, #0
    8198:	e1b04000 	movs	r4, r0
    819c:	e1b05001 	movs	r5, r1
    81a0:	e59f0038 	ldr	r0, [pc, #56]	; 81e0 <_mainCRTStartup+0x10c>
    81a4:	e3500000 	cmp	r0, #0
    81a8:	0a000001 	beq	81b4 <_mainCRTStartup+0xe0>
    81ac:	e59f0030 	ldr	r0, [pc, #48]	; 81e4 <_mainCRTStartup+0x110>
    81b0:	e320f000 	nop	{0}
    81b4:	eb0002c2 	bl	8cc4 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb000029 	bl	826c <main>
    81c4:	eb0001a4 	bl	885c <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00008ed5 	.word	0x00008ed5
    81dc:	00008ef8 	.word	0x00008ef8
	...

000081e8 <count_down>:

#include "libserial.h"
#include "usyscall.h"

static void count_down()
{
    81e8:	e92d4800 	push	{fp, lr}
    81ec:	e28db004 	add	fp, sp, #4
    81f0:	e24dd008 	sub	sp, sp, #8
    int time = 500000000;
    81f4:	e3a03c65 	mov	r3, #25856	; 0x6500
    81f8:	e3413dcd 	movt	r3, #7629	; 0x1dcd
    81fc:	e50b3008 	str	r3, [fp, #-8]
    while (time >= 0) {
    8200:	ea000013 	b	8254 <count_down+0x6c>
        if (time % 10000000 == 0) {
    8204:	e51b2008 	ldr	r2, [fp, #-8]
    8208:	e30c3a6b 	movw	r3, #51819	; 0xca6b
    820c:	e3463b5f 	movt	r3, #27487	; 0x6b5f
    8210:	e0c10392 	smull	r0, r1, r2, r3
    8214:	e1a01b41 	asr	r1, r1, #22
    8218:	e1a03fc2 	asr	r3, r2, #31
    821c:	e0413003 	sub	r3, r1, r3
    8220:	e3091680 	movw	r1, #38528	; 0x9680
    8224:	e3401098 	movt	r1, #152	; 0x98
    8228:	e0030391 	mul	r3, r1, r3
    822c:	e0423003 	sub	r3, r2, r3
    8230:	e3530000 	cmp	r3, #0
    8234:	1a000003 	bne	8248 <count_down+0x60>
            printf("Priority-based preempting, time remained %d\n", time);
    8238:	e51b1008 	ldr	r1, [fp, #-8]
    823c:	e3080e70 	movw	r0, #36464	; 0x8e70
    8240:	e3400000 	movt	r0, #0
    8244:	eb0000c4 	bl	855c <printf>
        }
        time--;
    8248:	e51b3008 	ldr	r3, [fp, #-8]
    824c:	e2433001 	sub	r3, r3, #1
    8250:	e50b3008 	str	r3, [fp, #-8]
    while (time >= 0) {
    8254:	e51b3008 	ldr	r3, [fp, #-8]
    8258:	e3530000 	cmp	r3, #0
    825c:	aaffffe8 	bge	8204 <count_down+0x1c>
    }
    return;
    8260:	e320f000 	nop	{0}
}
    8264:	e24bd004 	sub	sp, fp, #4
    8268:	e8bd8800 	pop	{fp, pc}

0000826c <main>:

int main(int argc, char* argv[])
{
    826c:	e92d4800 	push	{fp, lr}
    8270:	e28db004 	add	fp, sp, #4
    8274:	e24dd010 	sub	sp, sp, #16
    8278:	e50b0010 	str	r0, [fp, #-16]
    827c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    // set priority
    sys_state_info info;
    info.priority = 0;
    8280:	e3a03000 	mov	r3, #0
    8284:	e50b300c 	str	r3, [fp, #-12]
    set_priority(&info);
    8288:	e24b300c 	sub	r3, fp, #12
    828c:	e1a00003 	mov	r0, r3
    8290:	eb0001dc 	bl	8a08 <set_priority>

    // test function
    count_down();
    8294:	ebffffd3 	bl	81e8 <count_down>

    exit();
    8298:	eb00016f 	bl	885c <exit>
    return 0;
    829c:	e3a03000 	mov	r3, #0
}
    82a0:	e1a00003 	mov	r0, r3
    82a4:	e24bd004 	sub	sp, fp, #4
    82a8:	e8bd8800 	pop	{fp, pc}

000082ac <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    82ac:	e92d4800 	push	{fp, lr}
    82b0:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    82b4:	e3083ef4 	movw	r3, #36596	; 0x8ef4
    82b8:	e3403000 	movt	r3, #0
    82bc:	e5933000 	ldr	r3, [r3]
    82c0:	e3530000 	cmp	r3, #0
    82c4:	1a00000f 	bne	8308 <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    82c8:	e3a03001 	mov	r3, #1
    82cc:	e3a02a01 	mov	r2, #4096	; 0x1000
    82d0:	e3a01902 	mov	r1, #32768	; 0x8000
    82d4:	e340121e 	movt	r1, #542	; 0x21e
    82d8:	e3a00a0f 	mov	r0, #61440	; 0xf000
    82dc:	e3460fff 	movt	r0, #28671	; 0x6fff
    82e0:	eb00020f 	bl	8b24 <mmap>
    82e4:	e1a03000 	mov	r3, r0
    82e8:	e3730001 	cmn	r3, #1
    82ec:	1a000001 	bne	82f8 <init_uart_mmio+0x4c>
            return false;
    82f0:	e3a03000 	mov	r3, #0
    82f4:	ea000004 	b	830c <init_uart_mmio+0x60>
        }
        mapped = 1;
    82f8:	e3083ef4 	movw	r3, #36596	; 0x8ef4
    82fc:	e3403000 	movt	r3, #0
    8300:	e3a02001 	mov	r2, #1
    8304:	e5832000 	str	r2, [r3]
    }
    return true;
    8308:	e3a03001 	mov	r3, #1
}
    830c:	e1a00003 	mov	r0, r3
    8310:	e8bd8800 	pop	{fp, pc}

00008314 <putc>:

static void putc(char c)
{
    8314:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8318:	e28db000 	add	fp, sp, #0
    831c:	e24dd00c 	sub	sp, sp, #12
    8320:	e1a03000 	mov	r3, r0
    8324:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8328:	e320f000 	nop	{0}
    832c:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    8330:	e3463fff 	movt	r3, #28671	; 0x6fff
    8334:	e5933000 	ldr	r3, [r3]
    8338:	e7e03253 	ubfx	r3, r3, #4, #1
    833c:	e6ef3073 	uxtb	r3, r3
    8340:	e3530000 	cmp	r3, #0
    8344:	1afffff8 	bne	832c <putc+0x18>
        ;

    if (c == '\n') {
    8348:	e55b3005 	ldrb	r3, [fp, #-5]
    834c:	e353000a 	cmp	r3, #10
    8350:	1a00000b 	bne	8384 <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    8354:	e30f3040 	movw	r3, #61504	; 0xf040
    8358:	e3463fff 	movt	r3, #28671	; 0x6fff
    835c:	e3a0200d 	mov	r2, #13
    8360:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8364:	e320f000 	nop	{0}
    8368:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    836c:	e3463fff 	movt	r3, #28671	; 0x6fff
    8370:	e5933000 	ldr	r3, [r3]
    8374:	e7e03253 	ubfx	r3, r3, #4, #1
    8378:	e6ef3073 	uxtb	r3, r3
    837c:	e3530000 	cmp	r3, #0
    8380:	1afffff8 	bne	8368 <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    8384:	e30f3040 	movw	r3, #61504	; 0xf040
    8388:	e3463fff 	movt	r3, #28671	; 0x6fff
    838c:	e55b2005 	ldrb	r2, [fp, #-5]
    8390:	e5832000 	str	r2, [r3]
}
    8394:	e320f000 	nop	{0}
    8398:	e28bd000 	add	sp, fp, #0
    839c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    83a0:	e12fff1e 	bx	lr

000083a4 <getc>:

char getc(void)
{
    83a4:	e92d4800 	push	{fp, lr}
    83a8:	e28db004 	add	fp, sp, #4
    83ac:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    83b0:	ebffffbd 	bl	82ac <init_uart_mmio>
    83b4:	e1a03000 	mov	r3, r0
    83b8:	e2233001 	eor	r3, r3, #1
    83bc:	e6ef3073 	uxtb	r3, r3
    83c0:	e3530000 	cmp	r3, #0
    83c4:	0a000001 	beq	83d0 <getc+0x2c>
        return 0xFF;
    83c8:	e3a030ff 	mov	r3, #255	; 0xff
    83cc:	ea000014 	b	8424 <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    83d0:	e30f3098 	movw	r3, #61592	; 0xf098
    83d4:	e3463fff 	movt	r3, #28671	; 0x6fff
    83d8:	e5933000 	ldr	r3, [r3]
    83dc:	e7e03053 	ubfx	r3, r3, #0, #1
    83e0:	e6ef3073 	uxtb	r3, r3
    83e4:	e3530000 	cmp	r3, #0
    83e8:	1a000001 	bne	83f4 <getc+0x50>
        return 0xFF;
    83ec:	e3a030ff 	mov	r3, #255	; 0xff
    83f0:	ea00000b 	b	8424 <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    83f4:	e3a03a0f 	mov	r3, #61440	; 0xf000
    83f8:	e3463fff 	movt	r3, #28671	; 0x6fff
    83fc:	e5933000 	ldr	r3, [r3]
    8400:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    8404:	e51b3008 	ldr	r3, [fp, #-8]
    8408:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    840c:	e3530000 	cmp	r3, #0
    8410:	0a000001 	beq	841c <getc+0x78>
        return 0xFF;
    8414:	e3a030ff 	mov	r3, #255	; 0xff
    8418:	ea000001 	b	8424 <getc+0x80>

    return (char)read_data;
    841c:	e51b3008 	ldr	r3, [fp, #-8]
    8420:	e6ef3073 	uxtb	r3, r3
}
    8424:	e1a00003 	mov	r0, r3
    8428:	e24bd004 	sub	sp, fp, #4
    842c:	e8bd8800 	pop	{fp, pc}

00008430 <printint>:

static void printint(int xx, int base, int sgn)
{
    8430:	e92d4810 	push	{r4, fp, lr}
    8434:	e28db008 	add	fp, sp, #8
    8438:	e24dd034 	sub	sp, sp, #52	; 0x34
    843c:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    8440:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    8444:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    8448:	e3a03000 	mov	r3, #0
    844c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    8450:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    8454:	e3530000 	cmp	r3, #0
    8458:	0a000008 	beq	8480 <printint+0x50>
    845c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8460:	e3530000 	cmp	r3, #0
    8464:	aa000005 	bge	8480 <printint+0x50>
        neg = 1;
    8468:	e3a03001 	mov	r3, #1
    846c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    8470:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8474:	e2633000 	rsb	r3, r3, #0
    8478:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    847c:	ea000001 	b	8488 <printint+0x58>
    } else {
        x = xx;
    8480:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8484:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    8488:	e3a03000 	mov	r3, #0
    848c:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    8490:	e51b4010 	ldr	r4, [fp, #-16]
    8494:	e2843001 	add	r3, r4, #1
    8498:	e50b3010 	str	r3, [fp, #-16]
    849c:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    84a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    84a4:	e1a01002 	mov	r1, r2
    84a8:	e1a00003 	mov	r0, r3
    84ac:	eb0001fb 	bl	8ca0 <__aeabi_uidivmod>
    84b0:	e1a03001 	mov	r3, r1
    84b4:	e1a02003 	mov	r2, r3
    84b8:	e3083ec4 	movw	r3, #36548	; 0x8ec4
    84bc:	e3403000 	movt	r3, #0
    84c0:	e7d32002 	ldrb	r2, [r3, r2]
    84c4:	e24b300c 	sub	r3, fp, #12
    84c8:	e0833004 	add	r3, r3, r4
    84cc:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    84d0:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    84d4:	e1a01003 	mov	r1, r3
    84d8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    84dc:	eb0001b2 	bl	8bac <__udivsi3>
    84e0:	e1a03000 	mov	r3, r0
    84e4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    84e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    84ec:	e3530000 	cmp	r3, #0
    84f0:	1affffe6 	bne	8490 <printint+0x60>
    if (neg)
    84f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    84f8:	e3530000 	cmp	r3, #0
    84fc:	0a00000d 	beq	8538 <printint+0x108>
        buf[i++] = '-';
    8500:	e51b3010 	ldr	r3, [fp, #-16]
    8504:	e2832001 	add	r2, r3, #1
    8508:	e50b2010 	str	r2, [fp, #-16]
    850c:	e24b200c 	sub	r2, fp, #12
    8510:	e0823003 	add	r3, r2, r3
    8514:	e3a0202d 	mov	r2, #45	; 0x2d
    8518:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    851c:	ea000005 	b	8538 <printint+0x108>
        putc(buf[i]);
    8520:	e24b2028 	sub	r2, fp, #40	; 0x28
    8524:	e51b3010 	ldr	r3, [fp, #-16]
    8528:	e0823003 	add	r3, r2, r3
    852c:	e5d33000 	ldrb	r3, [r3]
    8530:	e1a00003 	mov	r0, r3
    8534:	ebffff76 	bl	8314 <putc>
    while (--i >= 0)
    8538:	e51b3010 	ldr	r3, [fp, #-16]
    853c:	e2433001 	sub	r3, r3, #1
    8540:	e50b3010 	str	r3, [fp, #-16]
    8544:	e51b3010 	ldr	r3, [fp, #-16]
    8548:	e3530000 	cmp	r3, #0
    854c:	aafffff3 	bge	8520 <printint+0xf0>
}
    8550:	e320f000 	nop	{0}
    8554:	e24bd008 	sub	sp, fp, #8
    8558:	e8bd8810 	pop	{r4, fp, pc}

0000855c <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    855c:	e92d000f 	push	{r0, r1, r2, r3}
    8560:	e92d4800 	push	{fp, lr}
    8564:	e28db004 	add	fp, sp, #4
    8568:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    856c:	ebffff4e 	bl	82ac <init_uart_mmio>
    8570:	e1a03000 	mov	r3, r0
    8574:	e2233001 	eor	r3, r3, #1
    8578:	e6ef3073 	uxtb	r3, r3
    857c:	e3530000 	cmp	r3, #0
    8580:	1a00007b 	bne	8774 <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    8584:	e3a03000 	mov	r3, #0
    8588:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    858c:	e28b3008 	add	r3, fp, #8
    8590:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    8594:	e3a03000 	mov	r3, #0
    8598:	e50b300c 	str	r3, [fp, #-12]
    859c:	ea00006d 	b	8758 <printf+0x1fc>
        c = fmt[i] & 0xff;
    85a0:	e59b2004 	ldr	r2, [fp, #4]
    85a4:	e51b300c 	ldr	r3, [fp, #-12]
    85a8:	e0823003 	add	r3, r2, r3
    85ac:	e5d33000 	ldrb	r3, [r3]
    85b0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    85b4:	e51b3010 	ldr	r3, [fp, #-16]
    85b8:	e3530000 	cmp	r3, #0
    85bc:	1a00000a 	bne	85ec <printf+0x90>
            if (c == '%') {
    85c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    85c4:	e3530025 	cmp	r3, #37	; 0x25
    85c8:	1a000002 	bne	85d8 <printf+0x7c>
                state = '%';
    85cc:	e3a03025 	mov	r3, #37	; 0x25
    85d0:	e50b3010 	str	r3, [fp, #-16]
    85d4:	ea00005c 	b	874c <printf+0x1f0>
            } else {
                putc(c);
    85d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    85dc:	e6ef3073 	uxtb	r3, r3
    85e0:	e1a00003 	mov	r0, r3
    85e4:	ebffff4a 	bl	8314 <putc>
    85e8:	ea000057 	b	874c <printf+0x1f0>
            }
        } else if (state == '%') {
    85ec:	e51b3010 	ldr	r3, [fp, #-16]
    85f0:	e3530025 	cmp	r3, #37	; 0x25
    85f4:	1a000054 	bne	874c <printf+0x1f0>
            if (c == 'd') {
    85f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    85fc:	e3530064 	cmp	r3, #100	; 0x64
    8600:	1a000009 	bne	862c <printf+0xd0>
                printint(*ap, 10, 1);
    8604:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8608:	e5933000 	ldr	r3, [r3]
    860c:	e3a02001 	mov	r2, #1
    8610:	e3a0100a 	mov	r1, #10
    8614:	e1a00003 	mov	r0, r3
    8618:	ebffff84 	bl	8430 <printint>
                ap++;
    861c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8620:	e2833004 	add	r3, r3, #4
    8624:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8628:	ea000045 	b	8744 <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    862c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8630:	e3530078 	cmp	r3, #120	; 0x78
    8634:	0a000002 	beq	8644 <printf+0xe8>
    8638:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    863c:	e3530070 	cmp	r3, #112	; 0x70
    8640:	1a000009 	bne	866c <printf+0x110>
                printint(*ap, 16, 0);
    8644:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8648:	e5933000 	ldr	r3, [r3]
    864c:	e3a02000 	mov	r2, #0
    8650:	e3a01010 	mov	r1, #16
    8654:	e1a00003 	mov	r0, r3
    8658:	ebffff74 	bl	8430 <printint>
                ap++;
    865c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8660:	e2833004 	add	r3, r3, #4
    8664:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8668:	ea000035 	b	8744 <printf+0x1e8>
            } else if (c == 's') {
    866c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8670:	e3530073 	cmp	r3, #115	; 0x73
    8674:	1a000018 	bne	86dc <printf+0x180>
                s = (char*)*ap;
    8678:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    867c:	e5933000 	ldr	r3, [r3]
    8680:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    8684:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8688:	e2833004 	add	r3, r3, #4
    868c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    8690:	e51b3008 	ldr	r3, [fp, #-8]
    8694:	e3530000 	cmp	r3, #0
    8698:	1a00000a 	bne	86c8 <printf+0x16c>
                    s = "(null)";
    869c:	e3083ea0 	movw	r3, #36512	; 0x8ea0
    86a0:	e3403000 	movt	r3, #0
    86a4:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    86a8:	ea000006 	b	86c8 <printf+0x16c>
                    putc(*s);
    86ac:	e51b3008 	ldr	r3, [fp, #-8]
    86b0:	e5d33000 	ldrb	r3, [r3]
    86b4:	e1a00003 	mov	r0, r3
    86b8:	ebffff15 	bl	8314 <putc>
                    s++;
    86bc:	e51b3008 	ldr	r3, [fp, #-8]
    86c0:	e2833001 	add	r3, r3, #1
    86c4:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    86c8:	e51b3008 	ldr	r3, [fp, #-8]
    86cc:	e5d33000 	ldrb	r3, [r3]
    86d0:	e3530000 	cmp	r3, #0
    86d4:	1afffff4 	bne	86ac <printf+0x150>
    86d8:	ea000019 	b	8744 <printf+0x1e8>
                }
            } else if (c == 'c') {
    86dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    86e0:	e3530063 	cmp	r3, #99	; 0x63
    86e4:	1a000008 	bne	870c <printf+0x1b0>
                putc(*ap);
    86e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86ec:	e5933000 	ldr	r3, [r3]
    86f0:	e6ef3073 	uxtb	r3, r3
    86f4:	e1a00003 	mov	r0, r3
    86f8:	ebffff05 	bl	8314 <putc>
                ap++;
    86fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8700:	e2833004 	add	r3, r3, #4
    8704:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8708:	ea00000d 	b	8744 <printf+0x1e8>
            } else if (c == '%') {
    870c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8710:	e3530025 	cmp	r3, #37	; 0x25
    8714:	1a000004 	bne	872c <printf+0x1d0>
                putc(c);
    8718:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    871c:	e6ef3073 	uxtb	r3, r3
    8720:	e1a00003 	mov	r0, r3
    8724:	ebfffefa 	bl	8314 <putc>
    8728:	ea000005 	b	8744 <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    872c:	e3a00025 	mov	r0, #37	; 0x25
    8730:	ebfffef7 	bl	8314 <putc>
                putc(c);
    8734:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8738:	e6ef3073 	uxtb	r3, r3
    873c:	e1a00003 	mov	r0, r3
    8740:	ebfffef3 	bl	8314 <putc>
            }
            state = 0;
    8744:	e3a03000 	mov	r3, #0
    8748:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    874c:	e51b300c 	ldr	r3, [fp, #-12]
    8750:	e2833001 	add	r3, r3, #1
    8754:	e50b300c 	str	r3, [fp, #-12]
    8758:	e59b2004 	ldr	r2, [fp, #4]
    875c:	e51b300c 	ldr	r3, [fp, #-12]
    8760:	e0823003 	add	r3, r2, r3
    8764:	e5d33000 	ldrb	r3, [r3]
    8768:	e3530000 	cmp	r3, #0
    876c:	1affff8b 	bne	85a0 <printf+0x44>
    8770:	ea000000 	b	8778 <printf+0x21c>
        return;
    8774:	e320f000 	nop	{0}
        }
    }
    8778:	e24bd004 	sub	sp, fp, #4
    877c:	e8bd4800 	pop	{fp, lr}
    8780:	e28dd010 	add	sp, sp, #16
    8784:	e12fff1e 	bx	lr

00008788 <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    8788:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    878c:	e28db014 	add	fp, sp, #20
    8790:	e24dd018 	sub	sp, sp, #24
    8794:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    8798:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    879c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    87a0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    87a4:	e3e03000 	mvn	r3, #0
    87a8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    87ac:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    87b0:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    87b4:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    87b8:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    87bc:	e59b7004 	ldr	r7, [fp, #4]
    87c0:	e1a0000c 	mov	r0, ip
    87c4:	e1a0100e 	mov	r1, lr
    87c8:	e1a02005 	mov	r2, r5
    87cc:	e1a03006 	mov	r3, r6
    87d0:	e1a04007 	mov	r4, r7
    87d4:	ef000000 	svc	0x00000000
    87d8:	f57ff04f 	dsb	sy
    87dc:	f57ff06f 	isb	sy
    87e0:	e1a0c000 	mov	ip, r0
    87e4:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    87e8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    87ec:	e1a00003 	mov	r0, r3
    87f0:	e24bd014 	sub	sp, fp, #20
    87f4:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000087f8 <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    87f8:	e92d4800 	push	{fp, lr}
    87fc:	e28db004 	add	fp, sp, #4
    8800:	e24dd028 	sub	sp, sp, #40	; 0x28
    8804:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8808:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    880c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8810:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    8814:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8818:	e50b3010 	str	r3, [fp, #-16]
    881c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8820:	e50b300c 	str	r3, [fp, #-12]
    8824:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8828:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    882c:	e24b1010 	sub	r1, fp, #16
    8830:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8834:	e59b0004 	ldr	r0, [fp, #4]
    8838:	e3a03000 	mov	r3, #0
    883c:	e58d3000 	str	r3, [sp]
    8840:	e1a03000 	mov	r3, r0
    8844:	e3a00001 	mov	r0, #1
    8848:	ebffffce 	bl	8788 <syscall>
    884c:	e1a03000 	mov	r3, r0
}
    8850:	e1a00003 	mov	r0, r3
    8854:	e24bd004 	sub	sp, fp, #4
    8858:	e8bd8800 	pop	{fp, pc}

0000885c <exit>:

int exit()
{
    885c:	e92d4800 	push	{fp, lr}
    8860:	e28db004 	add	fp, sp, #4
    8864:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    8868:	e3a03000 	mov	r3, #0
    886c:	e58d3000 	str	r3, [sp]
    8870:	e3a03000 	mov	r3, #0
    8874:	e3a02000 	mov	r2, #0
    8878:	e3a01000 	mov	r1, #0
    887c:	e3a00002 	mov	r0, #2
    8880:	ebffffc0 	bl	8788 <syscall>
    8884:	e1a03000 	mov	r3, r0
}
    8888:	e1a00003 	mov	r0, r3
    888c:	e24bd004 	sub	sp, fp, #4
    8890:	e8bd8800 	pop	{fp, pc}

00008894 <yield>:

int yield()
{
    8894:	e92d4800 	push	{fp, lr}
    8898:	e28db004 	add	fp, sp, #4
    889c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    88a0:	e3a03000 	mov	r3, #0
    88a4:	e58d3000 	str	r3, [sp]
    88a8:	e3a03000 	mov	r3, #0
    88ac:	e3a02000 	mov	r2, #0
    88b0:	e3a01000 	mov	r1, #0
    88b4:	e3a00003 	mov	r0, #3
    88b8:	ebffffb2 	bl	8788 <syscall>
    88bc:	e1a03000 	mov	r3, r0
}
    88c0:	e1a00003 	mov	r0, r3
    88c4:	e24bd004 	sub	sp, fp, #4
    88c8:	e8bd8800 	pop	{fp, pc}

000088cc <register_server>:

int register_server(char* name)
{
    88cc:	e92d4800 	push	{fp, lr}
    88d0:	e28db004 	add	fp, sp, #4
    88d4:	e24dd010 	sub	sp, sp, #16
    88d8:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    88dc:	e51b1008 	ldr	r1, [fp, #-8]
    88e0:	e3a03000 	mov	r3, #0
    88e4:	e58d3000 	str	r3, [sp]
    88e8:	e3a03000 	mov	r3, #0
    88ec:	e3a02000 	mov	r2, #0
    88f0:	e3a00005 	mov	r0, #5
    88f4:	ebffffa3 	bl	8788 <syscall>
    88f8:	e1a03000 	mov	r3, r0
}
    88fc:	e1a00003 	mov	r0, r3
    8900:	e24bd004 	sub	sp, fp, #4
    8904:	e8bd8800 	pop	{fp, pc}

00008908 <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    8908:	e92d4800 	push	{fp, lr}
    890c:	e28db004 	add	fp, sp, #4
    8910:	e24dd018 	sub	sp, sp, #24
    8914:	e50b0008 	str	r0, [fp, #-8]
    8918:	e50b100c 	str	r1, [fp, #-12]
    891c:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    8920:	e51b1008 	ldr	r1, [fp, #-8]
    8924:	e51b2010 	ldr	r2, [fp, #-16]
    8928:	e3a03000 	mov	r3, #0
    892c:	e58d3000 	str	r3, [sp]
    8930:	e1a03002 	mov	r3, r2
    8934:	e51b200c 	ldr	r2, [fp, #-12]
    8938:	e3a00006 	mov	r0, #6
    893c:	ebffff91 	bl	8788 <syscall>
    8940:	e1a03000 	mov	r3, r0
}
    8944:	e1a00003 	mov	r0, r3
    8948:	e24bd004 	sub	sp, fp, #4
    894c:	e8bd8800 	pop	{fp, pc}

00008950 <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    8950:	e92d4800 	push	{fp, lr}
    8954:	e28db004 	add	fp, sp, #4
    8958:	e24dd010 	sub	sp, sp, #16
    895c:	e50b0008 	str	r0, [fp, #-8]
    8960:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    8964:	e51b1008 	ldr	r1, [fp, #-8]
    8968:	e3a03000 	mov	r3, #0
    896c:	e58d3000 	str	r3, [sp]
    8970:	e3a03000 	mov	r3, #0
    8974:	e51b200c 	ldr	r2, [fp, #-12]
    8978:	e3a00007 	mov	r0, #7
    897c:	ebffff81 	bl	8788 <syscall>
    8980:	e1a03000 	mov	r3, r0
}
    8984:	e1a00003 	mov	r0, r3
    8988:	e24bd004 	sub	sp, fp, #4
    898c:	e8bd8800 	pop	{fp, pc}

00008990 <close_session>:

int close_session(struct Session* session)
{
    8990:	e92d4800 	push	{fp, lr}
    8994:	e28db004 	add	fp, sp, #4
    8998:	e24dd010 	sub	sp, sp, #16
    899c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    89a0:	e51b1008 	ldr	r1, [fp, #-8]
    89a4:	e3a03000 	mov	r3, #0
    89a8:	e58d3000 	str	r3, [sp]
    89ac:	e3a03000 	mov	r3, #0
    89b0:	e3a02000 	mov	r2, #0
    89b4:	e3a00008 	mov	r0, #8
    89b8:	ebffff72 	bl	8788 <syscall>
    89bc:	e1a03000 	mov	r3, r0
}
    89c0:	e1a00003 	mov	r0, r3
    89c4:	e24bd004 	sub	sp, fp, #4
    89c8:	e8bd8800 	pop	{fp, pc}

000089cc <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    89cc:	e92d4800 	push	{fp, lr}
    89d0:	e28db004 	add	fp, sp, #4
    89d4:	e24dd010 	sub	sp, sp, #16
    89d8:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    89dc:	e51b2008 	ldr	r2, [fp, #-8]
    89e0:	e3a03000 	mov	r3, #0
    89e4:	e58d3000 	str	r3, [sp]
    89e8:	e3a03000 	mov	r3, #0
    89ec:	e3a01003 	mov	r1, #3
    89f0:	e3a0000a 	mov	r0, #10
    89f4:	ebffff63 	bl	8788 <syscall>
    89f8:	e1a03000 	mov	r3, r0
}
    89fc:	e1a00003 	mov	r0, r3
    8a00:	e24bd004 	sub	sp, fp, #4
    8a04:	e8bd8800 	pop	{fp, pc}

00008a08 <set_priority>:

int set_priority(sys_state_info* info)
{
    8a08:	e92d4800 	push	{fp, lr}
    8a0c:	e28db004 	add	fp, sp, #4
    8a10:	e24dd010 	sub	sp, sp, #16
    8a14:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    8a18:	e51b2008 	ldr	r2, [fp, #-8]
    8a1c:	e3a03000 	mov	r3, #0
    8a20:	e58d3000 	str	r3, [sp]
    8a24:	e3a03000 	mov	r3, #0
    8a28:	e3a01001 	mov	r1, #1
    8a2c:	e3a0000a 	mov	r0, #10
    8a30:	ebffff54 	bl	8788 <syscall>
    8a34:	e1a03000 	mov	r3, r0
}
    8a38:	e1a00003 	mov	r0, r3
    8a3c:	e24bd004 	sub	sp, fp, #4
    8a40:	e8bd8800 	pop	{fp, pc}

00008a44 <task_heap_base>:

int task_heap_base()
{
    8a44:	e92d4800 	push	{fp, lr}
    8a48:	e28db004 	add	fp, sp, #4
    8a4c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    8a50:	e3a03000 	mov	r3, #0
    8a54:	e58d3000 	str	r3, [sp]
    8a58:	e3a03000 	mov	r3, #0
    8a5c:	e3a02000 	mov	r2, #0
    8a60:	e3a01002 	mov	r1, #2
    8a64:	e3a0000a 	mov	r0, #10
    8a68:	ebffff46 	bl	8788 <syscall>
    8a6c:	e1a03000 	mov	r3, r0
}
    8a70:	e1a00003 	mov	r0, r3
    8a74:	e24bd004 	sub	sp, fp, #4
    8a78:	e8bd8800 	pop	{fp, pc}

00008a7c <show_task>:

int show_task()
{
    8a7c:	e92d4800 	push	{fp, lr}
    8a80:	e28db004 	add	fp, sp, #4
    8a84:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    8a88:	e3a03000 	mov	r3, #0
    8a8c:	e58d3000 	str	r3, [sp]
    8a90:	e3a03000 	mov	r3, #0
    8a94:	e3a02000 	mov	r2, #0
    8a98:	e3a01004 	mov	r1, #4
    8a9c:	e3a0000a 	mov	r0, #10
    8aa0:	ebffff38 	bl	8788 <syscall>
    8aa4:	e1a03000 	mov	r3, r0
}
    8aa8:	e1a00003 	mov	r0, r3
    8aac:	e24bd004 	sub	sp, fp, #4
    8ab0:	e8bd8800 	pop	{fp, pc}

00008ab4 <show_mem>:

int show_mem()
{
    8ab4:	e92d4800 	push	{fp, lr}
    8ab8:	e28db004 	add	fp, sp, #4
    8abc:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    8ac0:	e3a03000 	mov	r3, #0
    8ac4:	e58d3000 	str	r3, [sp]
    8ac8:	e3a03000 	mov	r3, #0
    8acc:	e3a02000 	mov	r2, #0
    8ad0:	e3a01005 	mov	r1, #5
    8ad4:	e3a0000a 	mov	r0, #10
    8ad8:	ebffff2a 	bl	8788 <syscall>
    8adc:	e1a03000 	mov	r3, r0
}
    8ae0:	e1a00003 	mov	r0, r3
    8ae4:	e24bd004 	sub	sp, fp, #4
    8ae8:	e8bd8800 	pop	{fp, pc}

00008aec <show_cpu>:

int show_cpu()
{
    8aec:	e92d4800 	push	{fp, lr}
    8af0:	e28db004 	add	fp, sp, #4
    8af4:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    8af8:	e3a03000 	mov	r3, #0
    8afc:	e58d3000 	str	r3, [sp]
    8b00:	e3a03000 	mov	r3, #0
    8b04:	e3a02000 	mov	r2, #0
    8b08:	e3a01006 	mov	r1, #6
    8b0c:	e3a0000a 	mov	r0, #10
    8b10:	ebffff1c 	bl	8788 <syscall>
    8b14:	e1a03000 	mov	r3, r0
}
    8b18:	e1a00003 	mov	r0, r3
    8b1c:	e24bd004 	sub	sp, fp, #4
    8b20:	e8bd8800 	pop	{fp, pc}

00008b24 <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    8b24:	e92d4800 	push	{fp, lr}
    8b28:	e28db004 	add	fp, sp, #4
    8b2c:	e24dd018 	sub	sp, sp, #24
    8b30:	e50b0008 	str	r0, [fp, #-8]
    8b34:	e50b100c 	str	r1, [fp, #-12]
    8b38:	e50b2010 	str	r2, [fp, #-16]
    8b3c:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    8b40:	e51b1008 	ldr	r1, [fp, #-8]
    8b44:	e51b200c 	ldr	r2, [fp, #-12]
    8b48:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    8b4c:	e58d3000 	str	r3, [sp]
    8b50:	e51b3010 	ldr	r3, [fp, #-16]
    8b54:	e3a00004 	mov	r0, #4
    8b58:	ebffff0a 	bl	8788 <syscall>
    8b5c:	e1a03000 	mov	r3, r0
}
    8b60:	e1a00003 	mov	r0, r3
    8b64:	e24bd004 	sub	sp, fp, #4
    8b68:	e8bd8800 	pop	{fp, pc}

00008b6c <register_irq>:

int register_irq(int irq, int opcode)
{
    8b6c:	e92d4800 	push	{fp, lr}
    8b70:	e28db004 	add	fp, sp, #4
    8b74:	e24dd010 	sub	sp, sp, #16
    8b78:	e50b0008 	str	r0, [fp, #-8]
    8b7c:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    8b80:	e3a03000 	mov	r3, #0
    8b84:	e58d3000 	str	r3, [sp]
    8b88:	e3a03000 	mov	r3, #0
    8b8c:	e51b200c 	ldr	r2, [fp, #-12]
    8b90:	e51b1008 	ldr	r1, [fp, #-8]
    8b94:	e3a0000b 	mov	r0, #11
    8b98:	ebfffefa 	bl	8788 <syscall>
    8b9c:	e1a03000 	mov	r3, r0
    8ba0:	e1a00003 	mov	r0, r3
    8ba4:	e24bd004 	sub	sp, fp, #4
    8ba8:	e8bd8800 	pop	{fp, pc}

00008bac <__udivsi3>:
    8bac:	e2512001 	subs	r2, r1, #1
    8bb0:	012fff1e 	bxeq	lr
    8bb4:	3a000036 	bcc	8c94 <__udivsi3+0xe8>
    8bb8:	e1500001 	cmp	r0, r1
    8bbc:	9a000022 	bls	8c4c <__udivsi3+0xa0>
    8bc0:	e1110002 	tst	r1, r2
    8bc4:	0a000023 	beq	8c58 <__udivsi3+0xac>
    8bc8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    8bcc:	01a01181 	lsleq	r1, r1, #3
    8bd0:	03a03008 	moveq	r3, #8
    8bd4:	13a03001 	movne	r3, #1
    8bd8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    8bdc:	31510000 	cmpcc	r1, r0
    8be0:	31a01201 	lslcc	r1, r1, #4
    8be4:	31a03203 	lslcc	r3, r3, #4
    8be8:	3afffffa 	bcc	8bd8 <__udivsi3+0x2c>
    8bec:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    8bf0:	31510000 	cmpcc	r1, r0
    8bf4:	31a01081 	lslcc	r1, r1, #1
    8bf8:	31a03083 	lslcc	r3, r3, #1
    8bfc:	3afffffa 	bcc	8bec <__udivsi3+0x40>
    8c00:	e3a02000 	mov	r2, #0
    8c04:	e1500001 	cmp	r0, r1
    8c08:	20400001 	subcs	r0, r0, r1
    8c0c:	21822003 	orrcs	r2, r2, r3
    8c10:	e15000a1 	cmp	r0, r1, lsr #1
    8c14:	204000a1 	subcs	r0, r0, r1, lsr #1
    8c18:	218220a3 	orrcs	r2, r2, r3, lsr #1
    8c1c:	e1500121 	cmp	r0, r1, lsr #2
    8c20:	20400121 	subcs	r0, r0, r1, lsr #2
    8c24:	21822123 	orrcs	r2, r2, r3, lsr #2
    8c28:	e15001a1 	cmp	r0, r1, lsr #3
    8c2c:	204001a1 	subcs	r0, r0, r1, lsr #3
    8c30:	218221a3 	orrcs	r2, r2, r3, lsr #3
    8c34:	e3500000 	cmp	r0, #0
    8c38:	11b03223 	lsrsne	r3, r3, #4
    8c3c:	11a01221 	lsrne	r1, r1, #4
    8c40:	1affffef 	bne	8c04 <__udivsi3+0x58>
    8c44:	e1a00002 	mov	r0, r2
    8c48:	e12fff1e 	bx	lr
    8c4c:	03a00001 	moveq	r0, #1
    8c50:	13a00000 	movne	r0, #0
    8c54:	e12fff1e 	bx	lr
    8c58:	e3510801 	cmp	r1, #65536	; 0x10000
    8c5c:	21a01821 	lsrcs	r1, r1, #16
    8c60:	23a02010 	movcs	r2, #16
    8c64:	33a02000 	movcc	r2, #0
    8c68:	e3510c01 	cmp	r1, #256	; 0x100
    8c6c:	21a01421 	lsrcs	r1, r1, #8
    8c70:	22822008 	addcs	r2, r2, #8
    8c74:	e3510010 	cmp	r1, #16
    8c78:	21a01221 	lsrcs	r1, r1, #4
    8c7c:	22822004 	addcs	r2, r2, #4
    8c80:	e3510004 	cmp	r1, #4
    8c84:	82822003 	addhi	r2, r2, #3
    8c88:	908220a1 	addls	r2, r2, r1, lsr #1
    8c8c:	e1a00230 	lsr	r0, r0, r2
    8c90:	e12fff1e 	bx	lr
    8c94:	e3500000 	cmp	r0, #0
    8c98:	13e00000 	mvnne	r0, #0
    8c9c:	ea000007 	b	8cc0 <__aeabi_idiv0>

00008ca0 <__aeabi_uidivmod>:
    8ca0:	e3510000 	cmp	r1, #0
    8ca4:	0afffffa 	beq	8c94 <__udivsi3+0xe8>
    8ca8:	e92d4003 	push	{r0, r1, lr}
    8cac:	ebffffbe 	bl	8bac <__udivsi3>
    8cb0:	e8bd4006 	pop	{r1, r2, lr}
    8cb4:	e0030092 	mul	r3, r2, r0
    8cb8:	e0411003 	sub	r1, r1, r3
    8cbc:	e12fff1e 	bx	lr

00008cc0 <__aeabi_idiv0>:
    8cc0:	e12fff1e 	bx	lr

00008cc4 <__libc_init_array>:
    8cc4:	e92d4070 	push	{r4, r5, r6, lr}
    8cc8:	e59f6064 	ldr	r6, [pc, #100]	; 8d34 <__libc_init_array+0x70>
    8ccc:	e59f5064 	ldr	r5, [pc, #100]	; 8d38 <__libc_init_array+0x74>
    8cd0:	e0466005 	sub	r6, r6, r5
    8cd4:	e1b06146 	asrs	r6, r6, #2
    8cd8:	13a04000 	movne	r4, #0
    8cdc:	0a000005 	beq	8cf8 <__libc_init_array+0x34>
    8ce0:	e2844001 	add	r4, r4, #1
    8ce4:	e4953004 	ldr	r3, [r5], #4
    8ce8:	e1a0e00f 	mov	lr, pc
    8cec:	e12fff13 	bx	r3
    8cf0:	e1560004 	cmp	r6, r4
    8cf4:	1afffff9 	bne	8ce0 <__libc_init_array+0x1c>
    8cf8:	e59f603c 	ldr	r6, [pc, #60]	; 8d3c <__libc_init_array+0x78>
    8cfc:	e59f503c 	ldr	r5, [pc, #60]	; 8d40 <__libc_init_array+0x7c>
    8d00:	e0466005 	sub	r6, r6, r5
    8d04:	ebfffcbd 	bl	8000 <_init>
    8d08:	e1b06146 	asrs	r6, r6, #2
    8d0c:	13a04000 	movne	r4, #0
    8d10:	0a000005 	beq	8d2c <__libc_init_array+0x68>
    8d14:	e2844001 	add	r4, r4, #1
    8d18:	e4953004 	ldr	r3, [r5], #4
    8d1c:	e1a0e00f 	mov	lr, pc
    8d20:	e12fff13 	bx	r3
    8d24:	e1560004 	cmp	r6, r4
    8d28:	1afffff9 	bne	8d14 <__libc_init_array+0x50>
    8d2c:	e8bd4070 	pop	{r4, r5, r6, lr}
    8d30:	e12fff1e 	bx	lr
    8d34:	00008eb4 	.word	0x00008eb4
    8d38:	00008eb4 	.word	0x00008eb4
    8d3c:	00008eb8 	.word	0x00008eb8
    8d40:	00008eb4 	.word	0x00008eb4

00008d44 <memset>:
    8d44:	e3100003 	tst	r0, #3
    8d48:	0a000040 	beq	8e50 <memset+0x10c>
    8d4c:	e3520000 	cmp	r2, #0
    8d50:	e2422001 	sub	r2, r2, #1
    8d54:	012fff1e 	bxeq	lr
    8d58:	e201c0ff 	and	ip, r1, #255	; 0xff
    8d5c:	e1a03000 	mov	r3, r0
    8d60:	ea000002 	b	8d70 <memset+0x2c>
    8d64:	e2422001 	sub	r2, r2, #1
    8d68:	e3720001 	cmn	r2, #1
    8d6c:	012fff1e 	bxeq	lr
    8d70:	e4c3c001 	strb	ip, [r3], #1
    8d74:	e3130003 	tst	r3, #3
    8d78:	1afffff9 	bne	8d64 <memset+0x20>
    8d7c:	e3520003 	cmp	r2, #3
    8d80:	9a00002a 	bls	8e30 <memset+0xec>
    8d84:	e92d4010 	push	{r4, lr}
    8d88:	e201e0ff 	and	lr, r1, #255	; 0xff
    8d8c:	e18ee40e 	orr	lr, lr, lr, lsl #8
    8d90:	e352000f 	cmp	r2, #15
    8d94:	e18ee80e 	orr	lr, lr, lr, lsl #16
    8d98:	9a000010 	bls	8de0 <memset+0x9c>
    8d9c:	e1a04002 	mov	r4, r2
    8da0:	e283c010 	add	ip, r3, #16
    8da4:	e2444010 	sub	r4, r4, #16
    8da8:	e354000f 	cmp	r4, #15
    8dac:	e50ce010 	str	lr, [ip, #-16]
    8db0:	e50ce00c 	str	lr, [ip, #-12]
    8db4:	e50ce008 	str	lr, [ip, #-8]
    8db8:	e50ce004 	str	lr, [ip, #-4]
    8dbc:	e28cc010 	add	ip, ip, #16
    8dc0:	8afffff7 	bhi	8da4 <memset+0x60>
    8dc4:	e242c010 	sub	ip, r2, #16
    8dc8:	e3ccc00f 	bic	ip, ip, #15
    8dcc:	e202200f 	and	r2, r2, #15
    8dd0:	e28cc010 	add	ip, ip, #16
    8dd4:	e3520003 	cmp	r2, #3
    8dd8:	e083300c 	add	r3, r3, ip
    8ddc:	9a00000a 	bls	8e0c <memset+0xc8>
    8de0:	e1a04003 	mov	r4, r3
    8de4:	e1a0c002 	mov	ip, r2
    8de8:	e24cc004 	sub	ip, ip, #4
    8dec:	e35c0003 	cmp	ip, #3
    8df0:	e484e004 	str	lr, [r4], #4
    8df4:	8afffffb 	bhi	8de8 <memset+0xa4>
    8df8:	e242c004 	sub	ip, r2, #4
    8dfc:	e3ccc003 	bic	ip, ip, #3
    8e00:	e28cc004 	add	ip, ip, #4
    8e04:	e083300c 	add	r3, r3, ip
    8e08:	e2022003 	and	r2, r2, #3
    8e0c:	e3520000 	cmp	r2, #0
    8e10:	0a000004 	beq	8e28 <memset+0xe4>
    8e14:	e20110ff 	and	r1, r1, #255	; 0xff
    8e18:	e0832002 	add	r2, r3, r2
    8e1c:	e4c31001 	strb	r1, [r3], #1
    8e20:	e1520003 	cmp	r2, r3
    8e24:	1afffffc 	bne	8e1c <memset+0xd8>
    8e28:	e8bd4010 	pop	{r4, lr}
    8e2c:	e12fff1e 	bx	lr
    8e30:	e3520000 	cmp	r2, #0
    8e34:	012fff1e 	bxeq	lr
    8e38:	e20110ff 	and	r1, r1, #255	; 0xff
    8e3c:	e0832002 	add	r2, r3, r2
    8e40:	e4c31001 	strb	r1, [r3], #1
    8e44:	e1520003 	cmp	r2, r3
    8e48:	1afffffc 	bne	8e40 <memset+0xfc>
    8e4c:	e12fff1e 	bx	lr
    8e50:	e1a03000 	mov	r3, r0
    8e54:	eaffffc8 	b	8d7c <memset+0x38>

Disassembly of section .fini:

00008e58 <_fini>:
    8e58:	e1a0c00d 	mov	ip, sp
    8e5c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
    8e60:	e24cb004 	sub	fp, ip, #4
    8e64:	e24bd028 	sub	sp, fp, #40	; 0x28
    8e68:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
    8e6c:	e12fff1e 	bx	lr
