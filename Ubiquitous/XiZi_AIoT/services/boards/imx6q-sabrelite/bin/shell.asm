
shell:     file format elf32-littlearm


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
    804c:	00015bbc 	.word	0x00015bbc
    8050:	00000000 	.word	0x00000000
    8054:	00015190 	.word	0x00015190

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
    80c4:	00015190 	.word	0x00015190
    80c8:	00015bc0 	.word	0x00015bc0
    80cc:	0001519c 	.word	0x0001519c
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
    8164:	eb001e7a 	bl	fb54 <memset>
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
    81b4:	eb001daf 	bl	f878 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb000047 	bl	82e4 <main>
    81c4:	eb001aa2 	bl	ec54 <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00015bbc 	.word	0x00015bbc
    81dc:	00015ee4 	.word	0x00015ee4
	...

000081e8 <userShellWrite>:
Shell shell;
char shellBuffer[512];
struct Session session_fs;

signed short userShellWrite(char* data, unsigned short len)
{
    81e8:	e92d4800 	push	{fp, lr}
    81ec:	e28db004 	add	fp, sp, #4
    81f0:	e24dd010 	sub	sp, sp, #16
    81f4:	e50b0010 	str	r0, [fp, #-16]
    81f8:	e1a03001 	mov	r3, r1
    81fc:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee
    unsigned short length = len;
    8200:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    8204:	e14b30b6 	strh	r3, [fp, #-6]
    while (length--) {
    8208:	ea000007 	b	822c <userShellWrite+0x44>
        printf("%c", *data++);
    820c:	e51b3010 	ldr	r3, [fp, #-16]
    8210:	e2832001 	add	r2, r3, #1
    8214:	e50b2010 	str	r2, [fp, #-16]
    8218:	e5d33000 	ldrb	r3, [r3]
    821c:	e1a01003 	mov	r1, r3
    8220:	e3040790 	movw	r0, #18320	; 0x4790
    8224:	e3400001 	movt	r0, #1
    8228:	eb000104 	bl	8640 <printf>
    while (length--) {
    822c:	e15b30b6 	ldrh	r3, [fp, #-6]
    8230:	e2432001 	sub	r2, r3, #1
    8234:	e14b20b6 	strh	r2, [fp, #-6]
    8238:	e3530000 	cmp	r3, #0
    823c:	1afffff2 	bne	820c <userShellWrite+0x24>
    }
    return len;
    8240:	e15b31f2 	ldrsh	r3, [fp, #-18]	; 0xffffffee
}
    8244:	e1a00003 	mov	r0, r3
    8248:	e24bd004 	sub	sp, fp, #4
    824c:	e8bd8800 	pop	{fp, pc}

00008250 <userShellRead>:

signed short userShellRead(char* data, unsigned short len)
{
    8250:	e92d4800 	push	{fp, lr}
    8254:	e28db004 	add	fp, sp, #4
    8258:	e24dd010 	sub	sp, sp, #16
    825c:	e50b0010 	str	r0, [fp, #-16]
    8260:	e1a03001 	mov	r3, r1
    8264:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee
    unsigned short length = len;
    8268:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    826c:	e14b30b6 	strh	r3, [fp, #-6]
    static char cur_read;
    while (length--) {
    8270:	ea000012 	b	82c0 <userShellRead+0x70>
        cur_read = getc();
    8274:	eb000083 	bl	8488 <getc>
    8278:	e1a03000 	mov	r3, r0
    827c:	e1a02003 	mov	r2, r3
    8280:	e3053bd8 	movw	r3, #23512	; 0x5bd8
    8284:	e3403001 	movt	r3, #1
    8288:	e5c32000 	strb	r2, [r3]
        if (cur_read == 0xff) {
    828c:	e3053bd8 	movw	r3, #23512	; 0x5bd8
    8290:	e3403001 	movt	r3, #1
    8294:	e5d33000 	ldrb	r3, [r3]
    8298:	e35300ff 	cmp	r3, #255	; 0xff
    829c:	1a000000 	bne	82a4 <userShellRead+0x54>
            yield();
    82a0:	eb001a79 	bl	ec8c <yield>
        }
        // *data++ = getc();
        *data++ = cur_read;
    82a4:	e51b2010 	ldr	r2, [fp, #-16]
    82a8:	e2823001 	add	r3, r2, #1
    82ac:	e50b3010 	str	r3, [fp, #-16]
    82b0:	e3053bd8 	movw	r3, #23512	; 0x5bd8
    82b4:	e3403001 	movt	r3, #1
    82b8:	e5d33000 	ldrb	r3, [r3]
    82bc:	e5c23000 	strb	r3, [r2]
    while (length--) {
    82c0:	e15b30b6 	ldrh	r3, [fp, #-6]
    82c4:	e2432001 	sub	r2, r3, #1
    82c8:	e14b20b6 	strh	r2, [fp, #-6]
    82cc:	e3530000 	cmp	r3, #0
    82d0:	1affffe7 	bne	8274 <userShellRead+0x24>
    }
    return len;
    82d4:	e15b31f2 	ldrsh	r3, [fp, #-18]	; 0xffffffee
}
    82d8:	e1a00003 	mov	r0, r3
    82dc:	e24bd004 	sub	sp, fp, #4
    82e0:	e8bd8800 	pop	{fp, pc}

000082e4 <main>:

int main(void)
{
    82e4:	e92d4800 	push	{fp, lr}
    82e8:	e28db004 	add	fp, sp, #4
    shell.write = userShellWrite;
    82ec:	e3053c3c 	movw	r3, #23612	; 0x5c3c
    82f0:	e3403001 	movt	r3, #1
    82f4:	e30821e8 	movw	r2, #33256	; 0x81e8
    82f8:	e3402000 	movt	r2, #0
    82fc:	e5832068 	str	r2, [r3, #104]	; 0x68
    shell.read = userShellRead;
    8300:	e3053c3c 	movw	r3, #23612	; 0x5c3c
    8304:	e3403001 	movt	r3, #1
    8308:	e3082250 	movw	r2, #33360	; 0x8250
    830c:	e3402000 	movt	r2, #0
    8310:	e5832064 	str	r2, [r3, #100]	; 0x64

    shellInit(&shell, shellBuffer, 512);
    8314:	e3a02c02 	mov	r2, #512	; 0x200
    8318:	e3051ca8 	movw	r1, #23720	; 0x5ca8
    831c:	e3401001 	movt	r1, #1
    8320:	e3050c3c 	movw	r0, #23612	; 0x5c3c
    8324:	e3400001 	movt	r0, #1
    8328:	eb00015f 	bl	88ac <shellInit>

    connect_session(&session_fs, "MemFS", 8092);
    832c:	e3012f9c 	movw	r2, #8092	; 0x1f9c
    8330:	e3041794 	movw	r1, #18324	; 0x4794
    8334:	e3401001 	movt	r1, #1
    8338:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    833c:	e3400001 	movt	r0, #1
    8340:	eb00194b 	bl	e874 <connect_session>
    if (!session_fs.buf) {
    8344:	e3053ea8 	movw	r3, #24232	; 0x5ea8
    8348:	e3403001 	movt	r3, #1
    834c:	e5933010 	ldr	r3, [r3, #16]
    8350:	e3530000 	cmp	r3, #0
    8354:	1a000004 	bne	836c <main+0x88>
        printf("session connect faield\n");
    8358:	e304079c 	movw	r0, #18332	; 0x479c
    835c:	e3400001 	movt	r0, #1
    8360:	eb0000b6 	bl	8640 <printf>
        return -1;
    8364:	e3e03000 	mvn	r3, #0
    8368:	ea000006 	b	8388 <main+0xa4>
    }

    shellTask(&shell);
    836c:	e3050c3c 	movw	r0, #23612	; 0x5c3c
    8370:	e3400001 	movt	r0, #1
    8374:	eb000e52 	bl	bcc4 <shellTask>

    free_session(&session_fs);
    8378:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    837c:	e3400001 	movt	r0, #1
    8380:	eb001949 	bl	e8ac <free_session>

    return 0;
    8384:	e3a03000 	mov	r3, #0
}
    8388:	e1a00003 	mov	r0, r3
    838c:	e8bd8800 	pop	{fp, pc}

00008390 <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    8390:	e92d4800 	push	{fp, lr}
    8394:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    8398:	e3053bdc 	movw	r3, #23516	; 0x5bdc
    839c:	e3403001 	movt	r3, #1
    83a0:	e5933000 	ldr	r3, [r3]
    83a4:	e3530000 	cmp	r3, #0
    83a8:	1a00000f 	bne	83ec <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    83ac:	e3a03001 	mov	r3, #1
    83b0:	e3a02a01 	mov	r2, #4096	; 0x1000
    83b4:	e3a01902 	mov	r1, #32768	; 0x8000
    83b8:	e340121e 	movt	r1, #542	; 0x21e
    83bc:	e3a00a0f 	mov	r0, #61440	; 0xf000
    83c0:	e3460fff 	movt	r0, #28671	; 0x6fff
    83c4:	eb001ad4 	bl	ef1c <mmap>
    83c8:	e1a03000 	mov	r3, r0
    83cc:	e3730001 	cmn	r3, #1
    83d0:	1a000001 	bne	83dc <init_uart_mmio+0x4c>
            return false;
    83d4:	e3a03000 	mov	r3, #0
    83d8:	ea000004 	b	83f0 <init_uart_mmio+0x60>
        }
        mapped = 1;
    83dc:	e3053bdc 	movw	r3, #23516	; 0x5bdc
    83e0:	e3403001 	movt	r3, #1
    83e4:	e3a02001 	mov	r2, #1
    83e8:	e5832000 	str	r2, [r3]
    }
    return true;
    83ec:	e3a03001 	mov	r3, #1
}
    83f0:	e1a00003 	mov	r0, r3
    83f4:	e8bd8800 	pop	{fp, pc}

000083f8 <putc>:

static void putc(char c)
{
    83f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    83fc:	e28db000 	add	fp, sp, #0
    8400:	e24dd00c 	sub	sp, sp, #12
    8404:	e1a03000 	mov	r3, r0
    8408:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    840c:	e320f000 	nop	{0}
    8410:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    8414:	e3463fff 	movt	r3, #28671	; 0x6fff
    8418:	e5933000 	ldr	r3, [r3]
    841c:	e7e03253 	ubfx	r3, r3, #4, #1
    8420:	e6ef3073 	uxtb	r3, r3
    8424:	e3530000 	cmp	r3, #0
    8428:	1afffff8 	bne	8410 <putc+0x18>
        ;

    if (c == '\n') {
    842c:	e55b3005 	ldrb	r3, [fp, #-5]
    8430:	e353000a 	cmp	r3, #10
    8434:	1a00000b 	bne	8468 <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    8438:	e30f3040 	movw	r3, #61504	; 0xf040
    843c:	e3463fff 	movt	r3, #28671	; 0x6fff
    8440:	e3a0200d 	mov	r2, #13
    8444:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8448:	e320f000 	nop	{0}
    844c:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    8450:	e3463fff 	movt	r3, #28671	; 0x6fff
    8454:	e5933000 	ldr	r3, [r3]
    8458:	e7e03253 	ubfx	r3, r3, #4, #1
    845c:	e6ef3073 	uxtb	r3, r3
    8460:	e3530000 	cmp	r3, #0
    8464:	1afffff8 	bne	844c <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    8468:	e30f3040 	movw	r3, #61504	; 0xf040
    846c:	e3463fff 	movt	r3, #28671	; 0x6fff
    8470:	e55b2005 	ldrb	r2, [fp, #-5]
    8474:	e5832000 	str	r2, [r3]
}
    8478:	e320f000 	nop	{0}
    847c:	e28bd000 	add	sp, fp, #0
    8480:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8484:	e12fff1e 	bx	lr

00008488 <getc>:

char getc(void)
{
    8488:	e92d4800 	push	{fp, lr}
    848c:	e28db004 	add	fp, sp, #4
    8490:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    8494:	ebffffbd 	bl	8390 <init_uart_mmio>
    8498:	e1a03000 	mov	r3, r0
    849c:	e2233001 	eor	r3, r3, #1
    84a0:	e6ef3073 	uxtb	r3, r3
    84a4:	e3530000 	cmp	r3, #0
    84a8:	0a000001 	beq	84b4 <getc+0x2c>
        return 0xFF;
    84ac:	e3a030ff 	mov	r3, #255	; 0xff
    84b0:	ea000014 	b	8508 <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    84b4:	e30f3098 	movw	r3, #61592	; 0xf098
    84b8:	e3463fff 	movt	r3, #28671	; 0x6fff
    84bc:	e5933000 	ldr	r3, [r3]
    84c0:	e7e03053 	ubfx	r3, r3, #0, #1
    84c4:	e6ef3073 	uxtb	r3, r3
    84c8:	e3530000 	cmp	r3, #0
    84cc:	1a000001 	bne	84d8 <getc+0x50>
        return 0xFF;
    84d0:	e3a030ff 	mov	r3, #255	; 0xff
    84d4:	ea00000b 	b	8508 <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    84d8:	e3a03a0f 	mov	r3, #61440	; 0xf000
    84dc:	e3463fff 	movt	r3, #28671	; 0x6fff
    84e0:	e5933000 	ldr	r3, [r3]
    84e4:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    84e8:	e51b3008 	ldr	r3, [fp, #-8]
    84ec:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    84f0:	e3530000 	cmp	r3, #0
    84f4:	0a000001 	beq	8500 <getc+0x78>
        return 0xFF;
    84f8:	e3a030ff 	mov	r3, #255	; 0xff
    84fc:	ea000001 	b	8508 <getc+0x80>

    return (char)read_data;
    8500:	e51b3008 	ldr	r3, [fp, #-8]
    8504:	e6ef3073 	uxtb	r3, r3
}
    8508:	e1a00003 	mov	r0, r3
    850c:	e24bd004 	sub	sp, fp, #4
    8510:	e8bd8800 	pop	{fp, pc}

00008514 <printint>:

static void printint(int xx, int base, int sgn)
{
    8514:	e92d4810 	push	{r4, fp, lr}
    8518:	e28db008 	add	fp, sp, #8
    851c:	e24dd034 	sub	sp, sp, #52	; 0x34
    8520:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    8524:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    8528:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    852c:	e3a03000 	mov	r3, #0
    8530:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    8534:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    8538:	e3530000 	cmp	r3, #0
    853c:	0a000008 	beq	8564 <printint+0x50>
    8540:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8544:	e3530000 	cmp	r3, #0
    8548:	aa000005 	bge	8564 <printint+0x50>
        neg = 1;
    854c:	e3a03001 	mov	r3, #1
    8550:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    8554:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8558:	e2633000 	rsb	r3, r3, #0
    855c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8560:	ea000001 	b	856c <printint+0x58>
    } else {
        x = xx;
    8564:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    8568:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    856c:	e3a03000 	mov	r3, #0
    8570:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    8574:	e51b4010 	ldr	r4, [fp, #-16]
    8578:	e2843001 	add	r3, r4, #1
    857c:	e50b3010 	str	r3, [fp, #-16]
    8580:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8584:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8588:	e1a01002 	mov	r1, r2
    858c:	e1a00003 	mov	r0, r3
    8590:	eb001ac0 	bl	f098 <__aeabi_uidivmod>
    8594:	e1a03001 	mov	r3, r1
    8598:	e1a02003 	mov	r2, r3
    859c:	e30531a4 	movw	r3, #20900	; 0x51a4
    85a0:	e3403001 	movt	r3, #1
    85a4:	e7d32002 	ldrb	r2, [r3, r2]
    85a8:	e24b300c 	sub	r3, fp, #12
    85ac:	e0833004 	add	r3, r3, r4
    85b0:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    85b4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    85b8:	e1a01003 	mov	r1, r3
    85bc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    85c0:	eb001a77 	bl	efa4 <__udivsi3>
    85c4:	e1a03000 	mov	r3, r0
    85c8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    85cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    85d0:	e3530000 	cmp	r3, #0
    85d4:	1affffe6 	bne	8574 <printint+0x60>
    if (neg)
    85d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    85dc:	e3530000 	cmp	r3, #0
    85e0:	0a00000d 	beq	861c <printint+0x108>
        buf[i++] = '-';
    85e4:	e51b3010 	ldr	r3, [fp, #-16]
    85e8:	e2832001 	add	r2, r3, #1
    85ec:	e50b2010 	str	r2, [fp, #-16]
    85f0:	e24b200c 	sub	r2, fp, #12
    85f4:	e0823003 	add	r3, r2, r3
    85f8:	e3a0202d 	mov	r2, #45	; 0x2d
    85fc:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    8600:	ea000005 	b	861c <printint+0x108>
        putc(buf[i]);
    8604:	e24b2028 	sub	r2, fp, #40	; 0x28
    8608:	e51b3010 	ldr	r3, [fp, #-16]
    860c:	e0823003 	add	r3, r2, r3
    8610:	e5d33000 	ldrb	r3, [r3]
    8614:	e1a00003 	mov	r0, r3
    8618:	ebffff76 	bl	83f8 <putc>
    while (--i >= 0)
    861c:	e51b3010 	ldr	r3, [fp, #-16]
    8620:	e2433001 	sub	r3, r3, #1
    8624:	e50b3010 	str	r3, [fp, #-16]
    8628:	e51b3010 	ldr	r3, [fp, #-16]
    862c:	e3530000 	cmp	r3, #0
    8630:	aafffff3 	bge	8604 <printint+0xf0>
}
    8634:	e320f000 	nop	{0}
    8638:	e24bd008 	sub	sp, fp, #8
    863c:	e8bd8810 	pop	{r4, fp, pc}

00008640 <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    8640:	e92d000f 	push	{r0, r1, r2, r3}
    8644:	e92d4800 	push	{fp, lr}
    8648:	e28db004 	add	fp, sp, #4
    864c:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    8650:	ebffff4e 	bl	8390 <init_uart_mmio>
    8654:	e1a03000 	mov	r3, r0
    8658:	e2233001 	eor	r3, r3, #1
    865c:	e6ef3073 	uxtb	r3, r3
    8660:	e3530000 	cmp	r3, #0
    8664:	1a00007b 	bne	8858 <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    8668:	e3a03000 	mov	r3, #0
    866c:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    8670:	e28b3008 	add	r3, fp, #8
    8674:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    8678:	e3a03000 	mov	r3, #0
    867c:	e50b300c 	str	r3, [fp, #-12]
    8680:	ea00006d 	b	883c <printf+0x1fc>
        c = fmt[i] & 0xff;
    8684:	e59b2004 	ldr	r2, [fp, #4]
    8688:	e51b300c 	ldr	r3, [fp, #-12]
    868c:	e0823003 	add	r3, r2, r3
    8690:	e5d33000 	ldrb	r3, [r3]
    8694:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    8698:	e51b3010 	ldr	r3, [fp, #-16]
    869c:	e3530000 	cmp	r3, #0
    86a0:	1a00000a 	bne	86d0 <printf+0x90>
            if (c == '%') {
    86a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    86a8:	e3530025 	cmp	r3, #37	; 0x25
    86ac:	1a000002 	bne	86bc <printf+0x7c>
                state = '%';
    86b0:	e3a03025 	mov	r3, #37	; 0x25
    86b4:	e50b3010 	str	r3, [fp, #-16]
    86b8:	ea00005c 	b	8830 <printf+0x1f0>
            } else {
                putc(c);
    86bc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    86c0:	e6ef3073 	uxtb	r3, r3
    86c4:	e1a00003 	mov	r0, r3
    86c8:	ebffff4a 	bl	83f8 <putc>
    86cc:	ea000057 	b	8830 <printf+0x1f0>
            }
        } else if (state == '%') {
    86d0:	e51b3010 	ldr	r3, [fp, #-16]
    86d4:	e3530025 	cmp	r3, #37	; 0x25
    86d8:	1a000054 	bne	8830 <printf+0x1f0>
            if (c == 'd') {
    86dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    86e0:	e3530064 	cmp	r3, #100	; 0x64
    86e4:	1a000009 	bne	8710 <printf+0xd0>
                printint(*ap, 10, 1);
    86e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86ec:	e5933000 	ldr	r3, [r3]
    86f0:	e3a02001 	mov	r2, #1
    86f4:	e3a0100a 	mov	r1, #10
    86f8:	e1a00003 	mov	r0, r3
    86fc:	ebffff84 	bl	8514 <printint>
                ap++;
    8700:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8704:	e2833004 	add	r3, r3, #4
    8708:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    870c:	ea000045 	b	8828 <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    8710:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8714:	e3530078 	cmp	r3, #120	; 0x78
    8718:	0a000002 	beq	8728 <printf+0xe8>
    871c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8720:	e3530070 	cmp	r3, #112	; 0x70
    8724:	1a000009 	bne	8750 <printf+0x110>
                printint(*ap, 16, 0);
    8728:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    872c:	e5933000 	ldr	r3, [r3]
    8730:	e3a02000 	mov	r2, #0
    8734:	e3a01010 	mov	r1, #16
    8738:	e1a00003 	mov	r0, r3
    873c:	ebffff74 	bl	8514 <printint>
                ap++;
    8740:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8744:	e2833004 	add	r3, r3, #4
    8748:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    874c:	ea000035 	b	8828 <printf+0x1e8>
            } else if (c == 's') {
    8750:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8754:	e3530073 	cmp	r3, #115	; 0x73
    8758:	1a000018 	bne	87c0 <printf+0x180>
                s = (char*)*ap;
    875c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8760:	e5933000 	ldr	r3, [r3]
    8764:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    8768:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    876c:	e2833004 	add	r3, r3, #4
    8770:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    8774:	e51b3008 	ldr	r3, [fp, #-8]
    8778:	e3530000 	cmp	r3, #0
    877c:	1a00000a 	bne	87ac <printf+0x16c>
                    s = "(null)";
    8780:	e30437b4 	movw	r3, #18356	; 0x47b4
    8784:	e3403001 	movt	r3, #1
    8788:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    878c:	ea000006 	b	87ac <printf+0x16c>
                    putc(*s);
    8790:	e51b3008 	ldr	r3, [fp, #-8]
    8794:	e5d33000 	ldrb	r3, [r3]
    8798:	e1a00003 	mov	r0, r3
    879c:	ebffff15 	bl	83f8 <putc>
                    s++;
    87a0:	e51b3008 	ldr	r3, [fp, #-8]
    87a4:	e2833001 	add	r3, r3, #1
    87a8:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    87ac:	e51b3008 	ldr	r3, [fp, #-8]
    87b0:	e5d33000 	ldrb	r3, [r3]
    87b4:	e3530000 	cmp	r3, #0
    87b8:	1afffff4 	bne	8790 <printf+0x150>
    87bc:	ea000019 	b	8828 <printf+0x1e8>
                }
            } else if (c == 'c') {
    87c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    87c4:	e3530063 	cmp	r3, #99	; 0x63
    87c8:	1a000008 	bne	87f0 <printf+0x1b0>
                putc(*ap);
    87cc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87d0:	e5933000 	ldr	r3, [r3]
    87d4:	e6ef3073 	uxtb	r3, r3
    87d8:	e1a00003 	mov	r0, r3
    87dc:	ebffff05 	bl	83f8 <putc>
                ap++;
    87e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87e4:	e2833004 	add	r3, r3, #4
    87e8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    87ec:	ea00000d 	b	8828 <printf+0x1e8>
            } else if (c == '%') {
    87f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    87f4:	e3530025 	cmp	r3, #37	; 0x25
    87f8:	1a000004 	bne	8810 <printf+0x1d0>
                putc(c);
    87fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8800:	e6ef3073 	uxtb	r3, r3
    8804:	e1a00003 	mov	r0, r3
    8808:	ebfffefa 	bl	83f8 <putc>
    880c:	ea000005 	b	8828 <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    8810:	e3a00025 	mov	r0, #37	; 0x25
    8814:	ebfffef7 	bl	83f8 <putc>
                putc(c);
    8818:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    881c:	e6ef3073 	uxtb	r3, r3
    8820:	e1a00003 	mov	r0, r3
    8824:	ebfffef3 	bl	83f8 <putc>
            }
            state = 0;
    8828:	e3a03000 	mov	r3, #0
    882c:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    8830:	e51b300c 	ldr	r3, [fp, #-12]
    8834:	e2833001 	add	r3, r3, #1
    8838:	e50b300c 	str	r3, [fp, #-12]
    883c:	e59b2004 	ldr	r2, [fp, #4]
    8840:	e51b300c 	ldr	r3, [fp, #-12]
    8844:	e0823003 	add	r3, r2, r3
    8848:	e5d33000 	ldrb	r3, [r3]
    884c:	e3530000 	cmp	r3, #0
    8850:	1affff8b 	bne	8684 <printf+0x44>
    8854:	ea000000 	b	885c <printf+0x21c>
        return;
    8858:	e320f000 	nop	{0}
        }
    }
    885c:	e24bd004 	sub	sp, fp, #4
    8860:	e8bd4800 	pop	{fp, lr}
    8864:	e28dd010 	add	sp, sp, #16
    8868:	e12fff1e 	bx	lr

0000886c <agencyshellRun>:

#if SHELL_EXEC_UNDEF_FUNC == 1
extern int shellExecute(int argc, char* argv[]);
#endif

SHELL_AGENCY_FUNC(shellRun, shellGetCurrent(), (const char*)p1);
    886c:	e92d4800 	push	{fp, lr}
    8870:	e28db004 	add	fp, sp, #4
    8874:	e24dd010 	sub	sp, sp, #16
    8878:	e50b0008 	str	r0, [fp, #-8]
    887c:	e50b100c 	str	r1, [fp, #-12]
    8880:	e50b2010 	str	r2, [fp, #-16]
    8884:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8888:	eb0000a2 	bl	8b18 <shellGetCurrent>
    888c:	e1a02000 	mov	r2, r0
    8890:	e51b3008 	ldr	r3, [fp, #-8]
    8894:	e1a01003 	mov	r1, r3
    8898:	e1a00002 	mov	r0, r2
    889c:	eb000d65 	bl	be38 <shellRun>
    88a0:	e320f000 	nop	{0}
    88a4:	e24bd004 	sub	sp, fp, #4
    88a8:	e8bd8800 	pop	{fp, pc}

000088ac <shellInit>:
 * @brief shell 初始化
 *
 * @param shell shell对象
 */
void shellInit(Shell* shell, char* buffer, unsigned short size)
{
    88ac:	e92d4800 	push	{fp, lr}
    88b0:	e28db004 	add	fp, sp, #4
    88b4:	e24dd018 	sub	sp, sp, #24
    88b8:	e50b0010 	str	r0, [fp, #-16]
    88bc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    88c0:	e1a03002 	mov	r3, r2
    88c4:	e14b31b6 	strh	r3, [fp, #-22]	; 0xffffffea
    shell->parser.length = 0;
    88c8:	e51b3010 	ldr	r3, [fp, #-16]
    88cc:	e3a02000 	mov	r2, #0
    88d0:	e1c320bc 	strh	r2, [r3, #12]
    shell->parser.cursor = 0;
    88d4:	e51b3010 	ldr	r3, [fp, #-16]
    88d8:	e3a02000 	mov	r2, #0
    88dc:	e1c320be 	strh	r2, [r3, #14]
    shell->info.user = NULL;
    88e0:	e51b3010 	ldr	r3, [fp, #-16]
    88e4:	e3a02000 	mov	r2, #0
    88e8:	e5832000 	str	r2, [r3]
    shell->status.isChecked = 1;
    88ec:	e51b2010 	ldr	r2, [fp, #-16]
    88f0:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    88f4:	e3833001 	orr	r3, r3, #1
    88f8:	e5c23060 	strb	r3, [r2, #96]	; 0x60

    shell->parser.buffer = buffer;
    88fc:	e51b3010 	ldr	r3, [fp, #-16]
    8900:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8904:	e5832010 	str	r2, [r3, #16]
    shell->parser.bufferSize = size / (SHELL_HISTORY_MAX_NUMBER + 1);
    8908:	e15b21b6 	ldrh	r2, [fp, #-22]	; 0xffffffea
    890c:	e30a3aab 	movw	r3, #43691	; 0xaaab
    8910:	e34a3aaa 	movt	r3, #43690	; 0xaaaa
    8914:	e0832392 	umull	r2, r3, r2, r3
    8918:	e1a03123 	lsr	r3, r3, #2
    891c:	e6ff2073 	uxth	r2, r3
    8920:	e51b3010 	ldr	r3, [fp, #-16]
    8924:	e1c323b4 	strh	r2, [r3, #52]	; 0x34

#if SHELL_HISTORY_MAX_NUMBER > 0
    shell->history.offset = 0;
    8928:	e51b3010 	ldr	r3, [fp, #-16]
    892c:	e3a02000 	mov	r2, #0
    8930:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    shell->history.number = 0;
    8934:	e51b3010 	ldr	r3, [fp, #-16]
    8938:	e3a02000 	mov	r2, #0
    893c:	e1c325b0 	strh	r2, [r3, #80]	; 0x50
    shell->history.record = 0;
    8940:	e51b3010 	ldr	r3, [fp, #-16]
    8944:	e3a02000 	mov	r2, #0
    8948:	e1c325b2 	strh	r2, [r3, #82]	; 0x52
    for (short i = 0; i < SHELL_HISTORY_MAX_NUMBER; i++) {
    894c:	e3a03000 	mov	r3, #0
    8950:	e14b30b6 	strh	r3, [fp, #-6]
    8954:	ea000013 	b	89a8 <shellInit+0xfc>
        shell->history.item[i] = buffer + shell->parser.bufferSize * (i + 1);
    8958:	e15b30f6 	ldrsh	r3, [fp, #-6]
    895c:	e51b2010 	ldr	r2, [fp, #-16]
    8960:	e1d223b4 	ldrh	r2, [r2, #52]	; 0x34
    8964:	e1a01002 	mov	r1, r2
    8968:	e15b20f6 	ldrsh	r2, [fp, #-6]
    896c:	e2822001 	add	r2, r2, #1
    8970:	e0020192 	mul	r2, r2, r1
    8974:	e1a01002 	mov	r1, r2
    8978:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    897c:	e0822001 	add	r2, r2, r1
    8980:	e51b1010 	ldr	r1, [fp, #-16]
    8984:	e283300e 	add	r3, r3, #14
    8988:	e1a03103 	lsl	r3, r3, #2
    898c:	e0813003 	add	r3, r1, r3
    8990:	e5832004 	str	r2, [r3, #4]
    for (short i = 0; i < SHELL_HISTORY_MAX_NUMBER; i++) {
    8994:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8998:	e6ff3073 	uxth	r3, r3
    899c:	e2833001 	add	r3, r3, #1
    89a0:	e6ff3073 	uxth	r3, r3
    89a4:	e14b30b6 	strh	r3, [fp, #-6]
    89a8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    89ac:	e3530004 	cmp	r3, #4
    89b0:	daffffe8 	ble	8958 <shellInit+0xac>
        / sizeof(ShellCommand);
#else
#error not supported compiler, please use command table mode
#endif
#else
    shell->commandList.base = (ShellCommand*)shellCommandList;
    89b4:	e51b2010 	ldr	r2, [fp, #-16]
    89b8:	e30439d0 	movw	r3, #18896	; 0x49d0
    89bc:	e3403001 	movt	r3, #1
    89c0:	e5823058 	str	r3, [r2, #88]	; 0x58
    shell->commandList.count = shellCommandCount;
    89c4:	e3043b80 	movw	r3, #19328	; 0x4b80
    89c8:	e3403001 	movt	r3, #1
    89cc:	e1d320b0 	ldrh	r2, [r3]
    89d0:	e51b3010 	ldr	r3, [fp, #-16]
    89d4:	e1c325bc 	strh	r2, [r3, #92]	; 0x5c
#endif

    shellAdd(shell);
    89d8:	e51b0010 	ldr	r0, [fp, #-16]
    89dc:	eb000010 	bl	8a24 <shellAdd>

    shellSetUser(shell, shellSeekCommand(shell, SHELL_DEFAULT_USER, shell->commandList.base, 0));
    89e0:	e51b3010 	ldr	r3, [fp, #-16]
    89e4:	e5932058 	ldr	r2, [r3, #88]	; 0x58
    89e8:	e3a03000 	mov	r3, #0
    89ec:	e3041ccc 	movw	r1, #19660	; 0x4ccc
    89f0:	e3401001 	movt	r1, #1
    89f4:	e51b0010 	ldr	r0, [fp, #-16]
    89f8:	eb0006c0 	bl	a500 <shellSeekCommand>
    89fc:	e1a03000 	mov	r3, r0
    8a00:	e1a01003 	mov	r1, r3
    8a04:	e51b0010 	ldr	r0, [fp, #-16]
    8a08:	eb0008d6 	bl	ad68 <shellSetUser>
    shellWritePrompt(shell, 1);
    8a0c:	e3a01001 	mov	r1, #1
    8a10:	e51b0010 	ldr	r0, [fp, #-16]
    8a14:	eb0000d7 	bl	8d78 <shellWritePrompt>
}
    8a18:	e320f000 	nop	{0}
    8a1c:	e24bd004 	sub	sp, fp, #4
    8a20:	e8bd8800 	pop	{fp, pc}

00008a24 <shellAdd>:
 * @brief 添加shell
 *
 * @param shell shell对象
 */
static void shellAdd(Shell* shell)
{
    8a24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8a28:	e28db000 	add	fp, sp, #0
    8a2c:	e24dd014 	sub	sp, sp, #20
    8a30:	e50b0010 	str	r0, [fp, #-16]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8a34:	e3a03000 	mov	r3, #0
    8a38:	e14b30b6 	strh	r3, [fp, #-6]
    8a3c:	ea000010 	b	8a84 <shellAdd+0x60>
        if (shellList[i] == NULL) {
    8a40:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8a44:	e3053be0 	movw	r3, #23520	; 0x5be0
    8a48:	e3403001 	movt	r3, #1
    8a4c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8a50:	e3530000 	cmp	r3, #0
    8a54:	1a000005 	bne	8a70 <shellAdd+0x4c>
            shellList[i] = shell;
    8a58:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8a5c:	e3053be0 	movw	r3, #23520	; 0x5be0
    8a60:	e3403001 	movt	r3, #1
    8a64:	e51b1010 	ldr	r1, [fp, #-16]
    8a68:	e7831102 	str	r1, [r3, r2, lsl #2]
            return;
    8a6c:	ea000007 	b	8a90 <shellAdd+0x6c>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8a70:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8a74:	e6ff3073 	uxth	r3, r3
    8a78:	e2833001 	add	r3, r3, #1
    8a7c:	e6ff3073 	uxth	r3, r3
    8a80:	e14b30b6 	strh	r3, [fp, #-6]
    8a84:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8a88:	e3530004 	cmp	r3, #4
    8a8c:	daffffeb 	ble	8a40 <shellAdd+0x1c>
        }
    }
}
    8a90:	e28bd000 	add	sp, fp, #0
    8a94:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8a98:	e12fff1e 	bx	lr

00008a9c <shellRemove>:
 *
 * @param shell shell对象
 *
 */
void shellRemove(Shell* shell)
{
    8a9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8aa0:	e28db000 	add	fp, sp, #0
    8aa4:	e24dd014 	sub	sp, sp, #20
    8aa8:	e50b0010 	str	r0, [fp, #-16]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8aac:	e3a03000 	mov	r3, #0
    8ab0:	e14b30b6 	strh	r3, [fp, #-6]
    8ab4:	ea000011 	b	8b00 <shellRemove+0x64>
        if (shellList[i] == shell) {
    8ab8:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8abc:	e3053be0 	movw	r3, #23520	; 0x5be0
    8ac0:	e3403001 	movt	r3, #1
    8ac4:	e7932102 	ldr	r2, [r3, r2, lsl #2]
    8ac8:	e51b3010 	ldr	r3, [fp, #-16]
    8acc:	e1520003 	cmp	r2, r3
    8ad0:	1a000005 	bne	8aec <shellRemove+0x50>
            shellList[i] = NULL;
    8ad4:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8ad8:	e3053be0 	movw	r3, #23520	; 0x5be0
    8adc:	e3403001 	movt	r3, #1
    8ae0:	e3a01000 	mov	r1, #0
    8ae4:	e7831102 	str	r1, [r3, r2, lsl #2]
            return;
    8ae8:	ea000007 	b	8b0c <shellRemove+0x70>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8aec:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8af0:	e6ff3073 	uxth	r3, r3
    8af4:	e2833001 	add	r3, r3, #1
    8af8:	e6ff3073 	uxth	r3, r3
    8afc:	e14b30b6 	strh	r3, [fp, #-6]
    8b00:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8b04:	e3530004 	cmp	r3, #4
    8b08:	daffffea 	ble	8ab8 <shellRemove+0x1c>
        }
    }
}
    8b0c:	e28bd000 	add	sp, fp, #0
    8b10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8b14:	e12fff1e 	bx	lr

00008b18 <shellGetCurrent>:
 * @brief 获取当前活动shell
 *
 * @return Shell* 当前活动shell对象
 */
Shell* shellGetCurrent(void)
{
    8b18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8b1c:	e28db000 	add	fp, sp, #0
    8b20:	e24dd00c 	sub	sp, sp, #12
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8b24:	e3a03000 	mov	r3, #0
    8b28:	e14b30b6 	strh	r3, [fp, #-6]
    8b2c:	ea000018 	b	8b94 <shellGetCurrent+0x7c>
        if (shellList[i] && shellList[i]->status.isActive) {
    8b30:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8b34:	e3053be0 	movw	r3, #23520	; 0x5be0
    8b38:	e3403001 	movt	r3, #1
    8b3c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8b40:	e3530000 	cmp	r3, #0
    8b44:	0a00000d 	beq	8b80 <shellGetCurrent+0x68>
    8b48:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8b4c:	e3053be0 	movw	r3, #23520	; 0x5be0
    8b50:	e3403001 	movt	r3, #1
    8b54:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8b58:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    8b5c:	e2033002 	and	r3, r3, #2
    8b60:	e6ef3073 	uxtb	r3, r3
    8b64:	e3530000 	cmp	r3, #0
    8b68:	0a000004 	beq	8b80 <shellGetCurrent+0x68>
            return shellList[i];
    8b6c:	e15b20f6 	ldrsh	r2, [fp, #-6]
    8b70:	e3053be0 	movw	r3, #23520	; 0x5be0
    8b74:	e3403001 	movt	r3, #1
    8b78:	e7933102 	ldr	r3, [r3, r2, lsl #2]
    8b7c:	ea000008 	b	8ba4 <shellGetCurrent+0x8c>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    8b80:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8b84:	e6ff3073 	uxth	r3, r3
    8b88:	e2833001 	add	r3, r3, #1
    8b8c:	e6ff3073 	uxth	r3, r3
    8b90:	e14b30b6 	strh	r3, [fp, #-6]
    8b94:	e15b30f6 	ldrsh	r3, [fp, #-6]
    8b98:	e3530004 	cmp	r3, #4
    8b9c:	daffffe3 	ble	8b30 <shellGetCurrent+0x18>
        }
    }
    return NULL;
    8ba0:	e3a03000 	mov	r3, #0
}
    8ba4:	e1a00003 	mov	r0, r3
    8ba8:	e28bd000 	add	sp, fp, #0
    8bac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8bb0:	e12fff1e 	bx	lr

00008bb4 <shellWriteByte>:
 *
 * @param shell shell对象
 * @param data 字符数据
 */
static void shellWriteByte(Shell* shell, char data)
{
    8bb4:	e92d4800 	push	{fp, lr}
    8bb8:	e28db004 	add	fp, sp, #4
    8bbc:	e24dd008 	sub	sp, sp, #8
    8bc0:	e50b0008 	str	r0, [fp, #-8]
    8bc4:	e1a03001 	mov	r3, r1
    8bc8:	e54b3009 	strb	r3, [fp, #-9]
    shell->write(&data, 1);
    8bcc:	e51b3008 	ldr	r3, [fp, #-8]
    8bd0:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8bd4:	e24b2009 	sub	r2, fp, #9
    8bd8:	e3a01001 	mov	r1, #1
    8bdc:	e1a00002 	mov	r0, r2
    8be0:	e12fff33 	blx	r3
}
    8be4:	e320f000 	nop	{0}
    8be8:	e24bd004 	sub	sp, fp, #4
    8bec:	e8bd8800 	pop	{fp, pc}

00008bf0 <shellWriteString>:
 * @param string 字符串数据
 *
 * @return unsigned short 写入字符的数量
 */
unsigned short shellWriteString(Shell* shell, const char* string)
{
    8bf0:	e92d4800 	push	{fp, lr}
    8bf4:	e28db004 	add	fp, sp, #4
    8bf8:	e24dd010 	sub	sp, sp, #16
    8bfc:	e50b0010 	str	r0, [fp, #-16]
    8c00:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    unsigned short count = 0;
    8c04:	e3a03000 	mov	r3, #0
    8c08:	e14b30b6 	strh	r3, [fp, #-6]
    const char* p = string;
    8c0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c10:	e50b300c 	str	r3, [fp, #-12]
    SHELL_ASSERT(shell->write, return 0);
    8c14:	e51b3010 	ldr	r3, [fp, #-16]
    8c18:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8c1c:	e3530000 	cmp	r3, #0
    8c20:	1a000004 	bne	8c38 <shellWriteString+0x48>
    8c24:	e3a03000 	mov	r3, #0
    8c28:	ea000010 	b	8c70 <shellWriteString+0x80>
    while (*p++) {
        count++;
    8c2c:	e15b30b6 	ldrh	r3, [fp, #-6]
    8c30:	e2833001 	add	r3, r3, #1
    8c34:	e14b30b6 	strh	r3, [fp, #-6]
    while (*p++) {
    8c38:	e51b300c 	ldr	r3, [fp, #-12]
    8c3c:	e2832001 	add	r2, r3, #1
    8c40:	e50b200c 	str	r2, [fp, #-12]
    8c44:	e5d33000 	ldrb	r3, [r3]
    8c48:	e3530000 	cmp	r3, #0
    8c4c:	1afffff6 	bne	8c2c <shellWriteString+0x3c>
    }
    return shell->write((char*)string, count);
    8c50:	e51b3010 	ldr	r3, [fp, #-16]
    8c54:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8c58:	e15b20b6 	ldrh	r2, [fp, #-6]
    8c5c:	e1a01002 	mov	r1, r2
    8c60:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    8c64:	e12fff33 	blx	r3
    8c68:	e1a03000 	mov	r3, r0
    8c6c:	e6ff3073 	uxth	r3, r3
}
    8c70:	e1a00003 	mov	r0, r3
    8c74:	e24bd004 	sub	sp, fp, #4
    8c78:	e8bd8800 	pop	{fp, pc}

00008c7c <shellWriteCommandDesc>:
 * @param string 字符串数据
 *
 * @return unsigned short 写入字符的数量
 */
static unsigned short shellWriteCommandDesc(Shell* shell, const char* string)
{
    8c7c:	e92d4800 	push	{fp, lr}
    8c80:	e28db004 	add	fp, sp, #4
    8c84:	e24dd010 	sub	sp, sp, #16
    8c88:	e50b0010 	str	r0, [fp, #-16]
    8c8c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    unsigned short count = 0;
    8c90:	e3a03000 	mov	r3, #0
    8c94:	e14b30b6 	strh	r3, [fp, #-6]
    const char* p = string;
    8c98:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c9c:	e50b300c 	str	r3, [fp, #-12]
    SHELL_ASSERT(shell->write, return 0);
    8ca0:	e51b3010 	ldr	r3, [fp, #-16]
    8ca4:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8ca8:	e3530000 	cmp	r3, #0
    8cac:	1a000007 	bne	8cd0 <shellWriteCommandDesc+0x54>
    8cb0:	e3a03000 	mov	r3, #0
    8cb4:	ea00002c 	b	8d6c <shellWriteCommandDesc+0xf0>
    while (*p && *p != '\r' && *p != '\n') {
        p++;
    8cb8:	e51b300c 	ldr	r3, [fp, #-12]
    8cbc:	e2833001 	add	r3, r3, #1
    8cc0:	e50b300c 	str	r3, [fp, #-12]
        count++;
    8cc4:	e15b30b6 	ldrh	r3, [fp, #-6]
    8cc8:	e2833001 	add	r3, r3, #1
    8ccc:	e14b30b6 	strh	r3, [fp, #-6]
    while (*p && *p != '\r' && *p != '\n') {
    8cd0:	e51b300c 	ldr	r3, [fp, #-12]
    8cd4:	e5d33000 	ldrb	r3, [r3]
    8cd8:	e3530000 	cmp	r3, #0
    8cdc:	0a000007 	beq	8d00 <shellWriteCommandDesc+0x84>
    8ce0:	e51b300c 	ldr	r3, [fp, #-12]
    8ce4:	e5d33000 	ldrb	r3, [r3]
    8ce8:	e353000d 	cmp	r3, #13
    8cec:	0a000003 	beq	8d00 <shellWriteCommandDesc+0x84>
    8cf0:	e51b300c 	ldr	r3, [fp, #-12]
    8cf4:	e5d33000 	ldrb	r3, [r3]
    8cf8:	e353000a 	cmp	r3, #10
    8cfc:	1affffed 	bne	8cb8 <shellWriteCommandDesc+0x3c>
    }

    if (count > 36) {
    8d00:	e15b30b6 	ldrh	r3, [fp, #-6]
    8d04:	e3530024 	cmp	r3, #36	; 0x24
    8d08:	9a00000b 	bls	8d3c <shellWriteCommandDesc+0xc0>
        shell->write((char*)string, 36);
    8d0c:	e51b3010 	ldr	r3, [fp, #-16]
    8d10:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8d14:	e3a01024 	mov	r1, #36	; 0x24
    8d18:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    8d1c:	e12fff33 	blx	r3
        shell->write("...", 3);
    8d20:	e51b3010 	ldr	r3, [fp, #-16]
    8d24:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8d28:	e3a01003 	mov	r1, #3
    8d2c:	e3040cd4 	movw	r0, #19668	; 0x4cd4
    8d30:	e3400001 	movt	r0, #1
    8d34:	e12fff33 	blx	r3
    8d38:	ea000005 	b	8d54 <shellWriteCommandDesc+0xd8>
    } else {
        shell->write((char*)string, count);
    8d3c:	e51b3010 	ldr	r3, [fp, #-16]
    8d40:	e5933068 	ldr	r3, [r3, #104]	; 0x68
    8d44:	e15b20b6 	ldrh	r2, [fp, #-6]
    8d48:	e1a01002 	mov	r1, r2
    8d4c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    8d50:	e12fff33 	blx	r3
    }
    return count > 36 ? 36 : 39;
    8d54:	e15b30b6 	ldrh	r3, [fp, #-6]
    8d58:	e3530024 	cmp	r3, #36	; 0x24
    8d5c:	9a000001 	bls	8d68 <shellWriteCommandDesc+0xec>
    8d60:	e3a03024 	mov	r3, #36	; 0x24
    8d64:	ea000000 	b	8d6c <shellWriteCommandDesc+0xf0>
    8d68:	e3a03027 	mov	r3, #39	; 0x27
}
    8d6c:	e1a00003 	mov	r0, r3
    8d70:	e24bd004 	sub	sp, fp, #4
    8d74:	e8bd8800 	pop	{fp, pc}

00008d78 <shellWritePrompt>:
 * @param shell shell对象
 * @param newline 新行
 *
 */
static void shellWritePrompt(Shell* shell, unsigned char newline)
{
    8d78:	e92d4800 	push	{fp, lr}
    8d7c:	e28db004 	add	fp, sp, #4
    8d80:	e24dd008 	sub	sp, sp, #8
    8d84:	e50b0008 	str	r0, [fp, #-8]
    8d88:	e1a03001 	mov	r3, r1
    8d8c:	e54b3009 	strb	r3, [fp, #-9]
    if (shell->status.isChecked) {
    8d90:	e51b3008 	ldr	r3, [fp, #-8]
    8d94:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    8d98:	e2033001 	and	r3, r3, #1
    8d9c:	e6ef3073 	uxtb	r3, r3
    8da0:	e3530000 	cmp	r3, #0
    8da4:	0a000021 	beq	8e30 <shellWritePrompt+0xb8>
        if (newline) {
    8da8:	e55b3009 	ldrb	r3, [fp, #-9]
    8dac:	e3530000 	cmp	r3, #0
    8db0:	0a000003 	beq	8dc4 <shellWritePrompt+0x4c>
            shellWriteString(shell, "\r\n");
    8db4:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    8db8:	e3401001 	movt	r1, #1
    8dbc:	e51b0008 	ldr	r0, [fp, #-8]
    8dc0:	ebffff8a 	bl	8bf0 <shellWriteString>
        }
        shellWriteString(shell, shell->info.user->data.user.name);
    8dc4:	e51b3008 	ldr	r3, [fp, #-8]
    8dc8:	e5933000 	ldr	r3, [r3]
    8dcc:	e5933004 	ldr	r3, [r3, #4]
    8dd0:	e1a01003 	mov	r1, r3
    8dd4:	e51b0008 	ldr	r0, [fp, #-8]
    8dd8:	ebffff84 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, ":");
    8ddc:	e3041cdc 	movw	r1, #19676	; 0x4cdc
    8de0:	e3401001 	movt	r1, #1
    8de4:	e51b0008 	ldr	r0, [fp, #-8]
    8de8:	ebffff80 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, shell->info.path ? shell->info.path : "/");
    8dec:	e51b3008 	ldr	r3, [fp, #-8]
    8df0:	e5933008 	ldr	r3, [r3, #8]
    8df4:	e3530000 	cmp	r3, #0
    8df8:	0a000002 	beq	8e08 <shellWritePrompt+0x90>
    8dfc:	e51b3008 	ldr	r3, [fp, #-8]
    8e00:	e5933008 	ldr	r3, [r3, #8]
    8e04:	ea000001 	b	8e10 <shellWritePrompt+0x98>
    8e08:	e3043ce0 	movw	r3, #19680	; 0x4ce0
    8e0c:	e3403001 	movt	r3, #1
    8e10:	e1a01003 	mov	r1, r3
    8e14:	e51b0008 	ldr	r0, [fp, #-8]
    8e18:	ebffff74 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, "$ ");
    8e1c:	e3041ce4 	movw	r1, #19684	; 0x4ce4
    8e20:	e3401001 	movt	r1, #1
    8e24:	e51b0008 	ldr	r0, [fp, #-8]
    8e28:	ebffff70 	bl	8bf0 <shellWriteString>
    } else {
        shellWriteString(shell, shellText[SHELL_TEXT_PASSWORD_HINT]);
    }
}
    8e2c:	ea000005 	b	8e48 <shellWritePrompt+0xd0>
        shellWriteString(shell, shellText[SHELL_TEXT_PASSWORD_HINT]);
    8e30:	e30531b8 	movw	r3, #20920	; 0x51b8
    8e34:	e3403001 	movt	r3, #1
    8e38:	e593302c 	ldr	r3, [r3, #44]	; 0x2c
    8e3c:	e1a01003 	mov	r1, r3
    8e40:	e51b0008 	ldr	r0, [fp, #-8]
    8e44:	ebffff69 	bl	8bf0 <shellWriteString>
}
    8e48:	e320f000 	nop	{0}
    8e4c:	e24bd004 	sub	sp, fp, #4
    8e50:	e8bd8800 	pop	{fp, pc}

00008e54 <shellCheckPermission>:
 *
 * @return signed char 0 当前用户具有该命令权限
 * @return signec char -1 当前用户不具有该命令权限
 */
signed char shellCheckPermission(Shell* shell, ShellCommand* command)
{
    8e54:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8e58:	e28db000 	add	fp, sp, #0
    8e5c:	e24dd00c 	sub	sp, sp, #12
    8e60:	e50b0008 	str	r0, [fp, #-8]
    8e64:	e50b100c 	str	r1, [fp, #-12]
    return ((!command->attr.attrs.permission
    8e68:	e51b300c 	ldr	r3, [fp, #-12]
    8e6c:	e5d33000 	ldrb	r3, [r3]
                    && (command->attr.attrs.permission
                        & shell->info.user->attr.attrs.permission)))
               && (shell->status.isChecked
                   || command->attr.attrs.enableUnchecked))
        ? 0
        : -1;
    8e70:	e3530000 	cmp	r3, #0
    8e74:	0a000012 	beq	8ec4 <shellCheckPermission+0x70>
                || command->attr.attrs.type == SHELL_TYPE_USER
    8e78:	e51b300c 	ldr	r3, [fp, #-12]
    8e7c:	e5d33001 	ldrb	r3, [r3, #1]
    8e80:	e203300f 	and	r3, r3, #15
    8e84:	e6ef3073 	uxtb	r3, r3
    8e88:	e3530008 	cmp	r3, #8
    8e8c:	0a00000c 	beq	8ec4 <shellCheckPermission+0x70>
                || (shell->info.user
    8e90:	e51b3008 	ldr	r3, [fp, #-8]
    8e94:	e5933000 	ldr	r3, [r3]
    8e98:	e3530000 	cmp	r3, #0
    8e9c:	0a000016 	beq	8efc <shellCheckPermission+0xa8>
                    && (command->attr.attrs.permission
    8ea0:	e51b300c 	ldr	r3, [fp, #-12]
    8ea4:	e5d32000 	ldrb	r2, [r3]
                        & shell->info.user->attr.attrs.permission)))
    8ea8:	e51b3008 	ldr	r3, [fp, #-8]
    8eac:	e5933000 	ldr	r3, [r3]
    8eb0:	e5d33000 	ldrb	r3, [r3]
                    && (command->attr.attrs.permission
    8eb4:	e0033002 	and	r3, r3, r2
    8eb8:	e6ef3073 	uxtb	r3, r3
    8ebc:	e3530000 	cmp	r3, #0
    8ec0:	0a00000d 	beq	8efc <shellCheckPermission+0xa8>
               && (shell->status.isChecked
    8ec4:	e51b3008 	ldr	r3, [fp, #-8]
    8ec8:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    8ecc:	e2033001 	and	r3, r3, #1
    8ed0:	e6ef3073 	uxtb	r3, r3
    8ed4:	e3530000 	cmp	r3, #0
    8ed8:	1a000005 	bne	8ef4 <shellCheckPermission+0xa0>
                   || command->attr.attrs.enableUnchecked))
    8edc:	e51b300c 	ldr	r3, [fp, #-12]
    8ee0:	e5d33001 	ldrb	r3, [r3, #1]
    8ee4:	e2033010 	and	r3, r3, #16
    8ee8:	e6ef3073 	uxtb	r3, r3
    8eec:	e3530000 	cmp	r3, #0
    8ef0:	0a000001 	beq	8efc <shellCheckPermission+0xa8>
        : -1;
    8ef4:	e3a03000 	mov	r3, #0
    8ef8:	ea000000 	b	8f00 <shellCheckPermission+0xac>
    8efc:	e3e03000 	mvn	r3, #0
}
    8f00:	e1a00003 	mov	r0, r3
    8f04:	e28bd000 	add	sp, fp, #0
    8f08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8f0c:	e12fff1e 	bx	lr

00008f10 <shellToHex>:
 * @param buffer 缓冲
 *
 * @return signed char 转换后有效数据长度
 */
signed char shellToHex(unsigned int value, char* buffer)
{
    8f10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8f14:	e28db000 	add	fp, sp, #0
    8f18:	e24dd014 	sub	sp, sp, #20
    8f1c:	e50b0010 	str	r0, [fp, #-16]
    8f20:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    char byte;
    unsigned char i = 8;
    8f24:	e3a03008 	mov	r3, #8
    8f28:	e54b3005 	strb	r3, [fp, #-5]
    buffer[8] = 0;
    8f2c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8f30:	e2833008 	add	r3, r3, #8
    8f34:	e3a02000 	mov	r2, #0
    8f38:	e5c32000 	strb	r2, [r3]
    while (value) {
    8f3c:	ea000017 	b	8fa0 <shellToHex+0x90>
        byte = value & 0x0000000F;
    8f40:	e51b3010 	ldr	r3, [fp, #-16]
    8f44:	e6ef3073 	uxtb	r3, r3
    8f48:	e203300f 	and	r3, r3, #15
    8f4c:	e54b3006 	strb	r3, [fp, #-6]
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    8f50:	e55b3005 	ldrb	r3, [fp, #-5]
    8f54:	e2433001 	sub	r3, r3, #1
    8f58:	e54b3005 	strb	r3, [fp, #-5]
    8f5c:	e55b3005 	ldrb	r3, [fp, #-5]
    8f60:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8f64:	e0822003 	add	r2, r2, r3
    8f68:	e55b3006 	ldrb	r3, [fp, #-6]
    8f6c:	e3530009 	cmp	r3, #9
    8f70:	9a000003 	bls	8f84 <shellToHex+0x74>
    8f74:	e55b3006 	ldrb	r3, [fp, #-6]
    8f78:	e2833057 	add	r3, r3, #87	; 0x57
    8f7c:	e6ef3073 	uxtb	r3, r3
    8f80:	ea000002 	b	8f90 <shellToHex+0x80>
    8f84:	e55b3006 	ldrb	r3, [fp, #-6]
    8f88:	e2833030 	add	r3, r3, #48	; 0x30
    8f8c:	e6ef3073 	uxtb	r3, r3
    8f90:	e5c23000 	strb	r3, [r2]
        value >>= 4;
    8f94:	e51b3010 	ldr	r3, [fp, #-16]
    8f98:	e1a03223 	lsr	r3, r3, #4
    8f9c:	e50b3010 	str	r3, [fp, #-16]
    while (value) {
    8fa0:	e51b3010 	ldr	r3, [fp, #-16]
    8fa4:	e3530000 	cmp	r3, #0
    8fa8:	1affffe4 	bne	8f40 <shellToHex+0x30>
    }
    return 8 - i;
    8fac:	e55b3005 	ldrb	r3, [fp, #-5]
    8fb0:	e2633008 	rsb	r3, r3, #8
    8fb4:	e6ef3073 	uxtb	r3, r3
    8fb8:	e6af3073 	sxtb	r3, r3
}
    8fbc:	e1a00003 	mov	r0, r3
    8fc0:	e28bd000 	add	sp, fp, #0
    8fc4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8fc8:	e12fff1e 	bx	lr

00008fcc <shellToDec>:
 * @param buffer 缓冲
 *
 * @return signed char 转换后有效数据长度
 */
signed char shellToDec(int value, char* buffer)
{
    8fcc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8fd0:	e28db000 	add	fp, sp, #0
    8fd4:	e24dd014 	sub	sp, sp, #20
    8fd8:	e50b0010 	str	r0, [fp, #-16]
    8fdc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    unsigned char i = 11;
    8fe0:	e3a0300b 	mov	r3, #11
    8fe4:	e54b3005 	strb	r3, [fp, #-5]
    int v = value;
    8fe8:	e51b3010 	ldr	r3, [fp, #-16]
    8fec:	e50b300c 	str	r3, [fp, #-12]
    if (value < 0) {
    8ff0:	e51b3010 	ldr	r3, [fp, #-16]
    8ff4:	e3530000 	cmp	r3, #0
    8ff8:	aa000002 	bge	9008 <shellToDec+0x3c>
        v = -value;
    8ffc:	e51b3010 	ldr	r3, [fp, #-16]
    9000:	e2633000 	rsb	r3, r3, #0
    9004:	e50b300c 	str	r3, [fp, #-12]
    }
    buffer[11] = 0;
    9008:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    900c:	e283300b 	add	r3, r3, #11
    9010:	e3a02000 	mov	r2, #0
    9014:	e5c32000 	strb	r2, [r3]
    while (v) {
    9018:	ea00001d 	b	9094 <shellToDec+0xc8>
        buffer[--i] = v % 10 + 48;
    901c:	e55b3005 	ldrb	r3, [fp, #-5]
    9020:	e2433001 	sub	r3, r3, #1
    9024:	e54b3005 	strb	r3, [fp, #-5]
    9028:	e55b3005 	ldrb	r3, [fp, #-5]
    902c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9030:	e082c003 	add	ip, r2, r3
    9034:	e51b200c 	ldr	r2, [fp, #-12]
    9038:	e3063667 	movw	r3, #26215	; 0x6667
    903c:	e3463666 	movt	r3, #26214	; 0x6666
    9040:	e0c10392 	smull	r0, r1, r2, r3
    9044:	e1a01141 	asr	r1, r1, #2
    9048:	e1a03fc2 	asr	r3, r2, #31
    904c:	e0411003 	sub	r1, r1, r3
    9050:	e1a03001 	mov	r3, r1
    9054:	e1a03103 	lsl	r3, r3, #2
    9058:	e0833001 	add	r3, r3, r1
    905c:	e1a03083 	lsl	r3, r3, #1
    9060:	e0421003 	sub	r1, r2, r3
    9064:	e6ef3071 	uxtb	r3, r1
    9068:	e2833030 	add	r3, r3, #48	; 0x30
    906c:	e6ef3073 	uxtb	r3, r3
    9070:	e5cc3000 	strb	r3, [ip]
        v /= 10;
    9074:	e51b100c 	ldr	r1, [fp, #-12]
    9078:	e3063667 	movw	r3, #26215	; 0x6667
    907c:	e3463666 	movt	r3, #26214	; 0x6666
    9080:	e0c32391 	smull	r2, r3, r1, r3
    9084:	e1a02143 	asr	r2, r3, #2
    9088:	e1a03fc1 	asr	r3, r1, #31
    908c:	e0423003 	sub	r3, r2, r3
    9090:	e50b300c 	str	r3, [fp, #-12]
    while (v) {
    9094:	e51b300c 	ldr	r3, [fp, #-12]
    9098:	e3530000 	cmp	r3, #0
    909c:	1affffde 	bne	901c <shellToDec+0x50>
    }
    if (value < 0) {
    90a0:	e51b3010 	ldr	r3, [fp, #-16]
    90a4:	e3530000 	cmp	r3, #0
    90a8:	aa000007 	bge	90cc <shellToDec+0x100>
        buffer[--i] = '-';
    90ac:	e55b3005 	ldrb	r3, [fp, #-5]
    90b0:	e2433001 	sub	r3, r3, #1
    90b4:	e54b3005 	strb	r3, [fp, #-5]
    90b8:	e55b3005 	ldrb	r3, [fp, #-5]
    90bc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    90c0:	e0823003 	add	r3, r2, r3
    90c4:	e3a0202d 	mov	r2, #45	; 0x2d
    90c8:	e5c32000 	strb	r2, [r3]
    }
    if (value == 0) {
    90cc:	e51b3010 	ldr	r3, [fp, #-16]
    90d0:	e3530000 	cmp	r3, #0
    90d4:	1a000007 	bne	90f8 <shellToDec+0x12c>
        buffer[--i] = '0';
    90d8:	e55b3005 	ldrb	r3, [fp, #-5]
    90dc:	e2433001 	sub	r3, r3, #1
    90e0:	e54b3005 	strb	r3, [fp, #-5]
    90e4:	e55b3005 	ldrb	r3, [fp, #-5]
    90e8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    90ec:	e0823003 	add	r3, r2, r3
    90f0:	e3a02030 	mov	r2, #48	; 0x30
    90f4:	e5c32000 	strb	r2, [r3]
    }
    return 11 - i;
    90f8:	e55b3005 	ldrb	r3, [fp, #-5]
    90fc:	e263300b 	rsb	r3, r3, #11
    9100:	e6ef3073 	uxtb	r3, r3
    9104:	e6af3073 	sxtb	r3, r3
}
    9108:	e1a00003 	mov	r0, r3
    910c:	e28bd000 	add	sp, fp, #0
    9110:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9114:	e12fff1e 	bx	lr

00009118 <shellStringCopy>:
 * @param dest 目标字符串
 * @param src 源字符串
 * @return unsigned short 字符串长度
 */
static unsigned short shellStringCopy(char* dest, char* src)
{
    9118:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    911c:	e28db000 	add	fp, sp, #0
    9120:	e24dd014 	sub	sp, sp, #20
    9124:	e50b0010 	str	r0, [fp, #-16]
    9128:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    unsigned short count = 0;
    912c:	e3a03000 	mov	r3, #0
    9130:	e14b30b6 	strh	r3, [fp, #-6]
    while (*(src + count)) {
    9134:	ea00000a 	b	9164 <shellStringCopy+0x4c>
        *(dest + count) = *(src + count);
    9138:	e15b30b6 	ldrh	r3, [fp, #-6]
    913c:	e51b2010 	ldr	r2, [fp, #-16]
    9140:	e0823003 	add	r3, r2, r3
    9144:	e15b20b6 	ldrh	r2, [fp, #-6]
    9148:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    914c:	e0812002 	add	r2, r1, r2
    9150:	e5d22000 	ldrb	r2, [r2]
    9154:	e5c32000 	strb	r2, [r3]
        count++;
    9158:	e15b30b6 	ldrh	r3, [fp, #-6]
    915c:	e2833001 	add	r3, r3, #1
    9160:	e14b30b6 	strh	r3, [fp, #-6]
    while (*(src + count)) {
    9164:	e15b30b6 	ldrh	r3, [fp, #-6]
    9168:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    916c:	e0823003 	add	r3, r2, r3
    9170:	e5d33000 	ldrb	r3, [r3]
    9174:	e3530000 	cmp	r3, #0
    9178:	1affffee 	bne	9138 <shellStringCopy+0x20>
    }
    *(dest + count) = 0;
    917c:	e15b30b6 	ldrh	r3, [fp, #-6]
    9180:	e51b2010 	ldr	r2, [fp, #-16]
    9184:	e0823003 	add	r3, r2, r3
    9188:	e3a02000 	mov	r2, #0
    918c:	e5c32000 	strb	r2, [r3]
    return count;
    9190:	e15b30b6 	ldrh	r3, [fp, #-6]
}
    9194:	e1a00003 	mov	r0, r3
    9198:	e28bd000 	add	sp, fp, #0
    919c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    91a0:	e12fff1e 	bx	lr

000091a4 <shellStringCompare>:
 * @param dest 目标字符串
 * @param src 源字符串
 * @return unsigned short 匹配长度
 */
static unsigned short shellStringCompare(char* dest, char* src)
{
    91a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    91a8:	e28db000 	add	fp, sp, #0
    91ac:	e24dd014 	sub	sp, sp, #20
    91b0:	e50b0010 	str	r0, [fp, #-16]
    91b4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    unsigned short match = 0;
    91b8:	e3a03000 	mov	r3, #0
    91bc:	e14b30b6 	strh	r3, [fp, #-6]
    unsigned short i = 0;
    91c0:	e3a03000 	mov	r3, #0
    91c4:	e14b30b8 	strh	r3, [fp, #-8]

    while (*(dest + i) && *(src + i)) {
    91c8:	ea00000f 	b	920c <shellStringCompare+0x68>
        if (*(dest + i) != *(src + i)) {
    91cc:	e15b30b8 	ldrh	r3, [fp, #-8]
    91d0:	e51b2010 	ldr	r2, [fp, #-16]
    91d4:	e0823003 	add	r3, r2, r3
    91d8:	e5d32000 	ldrb	r2, [r3]
    91dc:	e15b30b8 	ldrh	r3, [fp, #-8]
    91e0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    91e4:	e0813003 	add	r3, r1, r3
    91e8:	e5d33000 	ldrb	r3, [r3]
    91ec:	e1520003 	cmp	r2, r3
    91f0:	1a000012 	bne	9240 <shellStringCompare+0x9c>
            break;
        }
        match++;
    91f4:	e15b30b6 	ldrh	r3, [fp, #-6]
    91f8:	e2833001 	add	r3, r3, #1
    91fc:	e14b30b6 	strh	r3, [fp, #-6]
        i++;
    9200:	e15b30b8 	ldrh	r3, [fp, #-8]
    9204:	e2833001 	add	r3, r3, #1
    9208:	e14b30b8 	strh	r3, [fp, #-8]
    while (*(dest + i) && *(src + i)) {
    920c:	e15b30b8 	ldrh	r3, [fp, #-8]
    9210:	e51b2010 	ldr	r2, [fp, #-16]
    9214:	e0823003 	add	r3, r2, r3
    9218:	e5d33000 	ldrb	r3, [r3]
    921c:	e3530000 	cmp	r3, #0
    9220:	0a000007 	beq	9244 <shellStringCompare+0xa0>
    9224:	e15b30b8 	ldrh	r3, [fp, #-8]
    9228:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    922c:	e0823003 	add	r3, r2, r3
    9230:	e5d33000 	ldrb	r3, [r3]
    9234:	e3530000 	cmp	r3, #0
    9238:	1affffe3 	bne	91cc <shellStringCompare+0x28>
    923c:	ea000000 	b	9244 <shellStringCompare+0xa0>
            break;
    9240:	e320f000 	nop	{0}
    }
    return match;
    9244:	e15b30b6 	ldrh	r3, [fp, #-6]
}
    9248:	e1a00003 	mov	r0, r3
    924c:	e28bd000 	add	sp, fp, #0
    9250:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9254:	e12fff1e 	bx	lr

00009258 <shellGetCommandName>:
 *
 * @param command 命令
 * @return const char* 命令名
 */
static const char* shellGetCommandName(ShellCommand* command)
{
    9258:	e92d4800 	push	{fp, lr}
    925c:	e28db004 	add	fp, sp, #4
    9260:	e24dd010 	sub	sp, sp, #16
    9264:	e50b0010 	str	r0, [fp, #-16]
    static char buffer[9];
    for (unsigned char i = 0; i < 9; i++) {
    9268:	e3a03000 	mov	r3, #0
    926c:	e54b3005 	strb	r3, [fp, #-5]
    9270:	ea000007 	b	9294 <shellGetCommandName+0x3c>
        buffer[i] = '0';
    9274:	e55b2005 	ldrb	r2, [fp, #-5]
    9278:	e3053bf4 	movw	r3, #23540	; 0x5bf4
    927c:	e3403001 	movt	r3, #1
    9280:	e3a01030 	mov	r1, #48	; 0x30
    9284:	e7c31002 	strb	r1, [r3, r2]
    for (unsigned char i = 0; i < 9; i++) {
    9288:	e55b3005 	ldrb	r3, [fp, #-5]
    928c:	e2833001 	add	r3, r3, #1
    9290:	e54b3005 	strb	r3, [fp, #-5]
    9294:	e55b3005 	ldrb	r3, [fp, #-5]
    9298:	e3530008 	cmp	r3, #8
    929c:	9afffff4 	bls	9274 <shellGetCommandName+0x1c>
    }
    if (command->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    92a0:	e51b3010 	ldr	r3, [fp, #-16]
    92a4:	e5d33001 	ldrb	r3, [r3, #1]
    92a8:	e7e33053 	ubfx	r3, r3, #0, #4
    92ac:	e6ef3073 	uxtb	r3, r3
    92b0:	e3530001 	cmp	r3, #1
    92b4:	ca000002 	bgt	92c4 <shellGetCommandName+0x6c>
        return command->data.cmd.name;
    92b8:	e51b3010 	ldr	r3, [fp, #-16]
    92bc:	e5933004 	ldr	r3, [r3, #4]
    92c0:	ea000019 	b	932c <shellGetCommandName+0xd4>
    } else if (command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    92c4:	e51b3010 	ldr	r3, [fp, #-16]
    92c8:	e5d33001 	ldrb	r3, [r3, #1]
    92cc:	e7e33053 	ubfx	r3, r3, #0, #4
    92d0:	e6ef3073 	uxtb	r3, r3
    92d4:	e3530007 	cmp	r3, #7
    92d8:	ca000002 	bgt	92e8 <shellGetCommandName+0x90>
        return command->data.var.name;
    92dc:	e51b3010 	ldr	r3, [fp, #-16]
    92e0:	e5933004 	ldr	r3, [r3, #4]
    92e4:	ea000010 	b	932c <shellGetCommandName+0xd4>
    } else if (command->attr.attrs.type <= SHELL_TYPE_USER) {
    92e8:	e51b3010 	ldr	r3, [fp, #-16]
    92ec:	e5d33001 	ldrb	r3, [r3, #1]
    92f0:	e7e33053 	ubfx	r3, r3, #0, #4
    92f4:	e6ef3073 	uxtb	r3, r3
    92f8:	e3530008 	cmp	r3, #8
    92fc:	ca000002 	bgt	930c <shellGetCommandName+0xb4>
        return command->data.user.name;
    9300:	e51b3010 	ldr	r3, [fp, #-16]
    9304:	e5933004 	ldr	r3, [r3, #4]
    9308:	ea000007 	b	932c <shellGetCommandName+0xd4>
    else if (command->attr.attrs.type == SHELL_TYPE_PARAM_PARSER) {
        return command->data.paramParser.type;
    }
#endif
    else {
        shellToHex(command->data.key.value, buffer);
    930c:	e51b3010 	ldr	r3, [fp, #-16]
    9310:	e5933004 	ldr	r3, [r3, #4]
    9314:	e3051bf4 	movw	r1, #23540	; 0x5bf4
    9318:	e3401001 	movt	r1, #1
    931c:	e1a00003 	mov	r0, r3
    9320:	ebfffefa 	bl	8f10 <shellToHex>
        return buffer;
    9324:	e3053bf4 	movw	r3, #23540	; 0x5bf4
    9328:	e3403001 	movt	r3, #1
    }
}
    932c:	e1a00003 	mov	r0, r3
    9330:	e24bd004 	sub	sp, fp, #4
    9334:	e8bd8800 	pop	{fp, pc}

00009338 <shellGetCommandDesc>:
 *
 * @param command 命令
 * @return const char* 命令描述
 */
static const char* shellGetCommandDesc(ShellCommand* command)
{
    9338:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    933c:	e28db000 	add	fp, sp, #0
    9340:	e24dd00c 	sub	sp, sp, #12
    9344:	e50b0008 	str	r0, [fp, #-8]
    if (command->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    9348:	e51b3008 	ldr	r3, [fp, #-8]
    934c:	e5d33001 	ldrb	r3, [r3, #1]
    9350:	e7e33053 	ubfx	r3, r3, #0, #4
    9354:	e6ef3073 	uxtb	r3, r3
    9358:	e3530001 	cmp	r3, #1
    935c:	ca000002 	bgt	936c <shellGetCommandDesc+0x34>
        return command->data.cmd.desc;
    9360:	e51b3008 	ldr	r3, [fp, #-8]
    9364:	e593300c 	ldr	r3, [r3, #12]
    9368:	ea000013 	b	93bc <shellGetCommandDesc+0x84>
    } else if (command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    936c:	e51b3008 	ldr	r3, [fp, #-8]
    9370:	e5d33001 	ldrb	r3, [r3, #1]
    9374:	e7e33053 	ubfx	r3, r3, #0, #4
    9378:	e6ef3073 	uxtb	r3, r3
    937c:	e3530007 	cmp	r3, #7
    9380:	ca000002 	bgt	9390 <shellGetCommandDesc+0x58>
        return command->data.var.desc;
    9384:	e51b3008 	ldr	r3, [fp, #-8]
    9388:	e593300c 	ldr	r3, [r3, #12]
    938c:	ea00000a 	b	93bc <shellGetCommandDesc+0x84>
    } else if (command->attr.attrs.type <= SHELL_TYPE_USER) {
    9390:	e51b3008 	ldr	r3, [fp, #-8]
    9394:	e5d33001 	ldrb	r3, [r3, #1]
    9398:	e7e33053 	ubfx	r3, r3, #0, #4
    939c:	e6ef3073 	uxtb	r3, r3
    93a0:	e3530008 	cmp	r3, #8
    93a4:	ca000002 	bgt	93b4 <shellGetCommandDesc+0x7c>
        return command->data.user.desc;
    93a8:	e51b3008 	ldr	r3, [fp, #-8]
    93ac:	e593300c 	ldr	r3, [r3, #12]
    93b0:	ea000001 	b	93bc <shellGetCommandDesc+0x84>
    } else {
        return command->data.key.desc;
    93b4:	e51b3008 	ldr	r3, [fp, #-8]
    93b8:	e593300c 	ldr	r3, [r3, #12]
    }
}
    93bc:	e1a00003 	mov	r0, r3
    93c0:	e28bd000 	add	sp, fp, #0
    93c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    93c8:	e12fff1e 	bx	lr

000093cc <shellListItem>:
 *
 * @param shell shell对象
 * @param item 命令条目
 */
void shellListItem(Shell* shell, ShellCommand* item)
{
    93cc:	e92d4800 	push	{fp, lr}
    93d0:	e28db004 	add	fp, sp, #4
    93d4:	e24dd010 	sub	sp, sp, #16
    93d8:	e50b0010 	str	r0, [fp, #-16]
    93dc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    short spaceLength;

    spaceLength = 22 - shellWriteString(shell, shellGetCommandName(item));
    93e0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    93e4:	ebffff9b 	bl	9258 <shellGetCommandName>
    93e8:	e1a03000 	mov	r3, r0
    93ec:	e1a01003 	mov	r1, r3
    93f0:	e51b0010 	ldr	r0, [fp, #-16]
    93f4:	ebfffdfd 	bl	8bf0 <shellWriteString>
    93f8:	e1a03000 	mov	r3, r0
    93fc:	e2633016 	rsb	r3, r3, #22
    9400:	e6ff3073 	uxth	r3, r3
    9404:	e14b30b6 	strh	r3, [fp, #-6]
    spaceLength = (spaceLength > 0) ? spaceLength : 4;
    9408:	e15b30f6 	ldrsh	r3, [fp, #-6]
    940c:	e3530000 	cmp	r3, #0
    9410:	da000001 	ble	941c <shellListItem+0x50>
    9414:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9418:	ea000000 	b	9420 <shellListItem+0x54>
    941c:	e3a03004 	mov	r3, #4
    9420:	e14b30b6 	strh	r3, [fp, #-6]
    do {
        shellWriteByte(shell, ' ');
    9424:	e3a01020 	mov	r1, #32
    9428:	e51b0010 	ldr	r0, [fp, #-16]
    942c:	ebfffde0 	bl	8bb4 <shellWriteByte>
    } while (--spaceLength);
    9430:	e15b30b6 	ldrh	r3, [fp, #-6]
    9434:	e2433001 	sub	r3, r3, #1
    9438:	e6ff3073 	uxth	r3, r3
    943c:	e14b30b6 	strh	r3, [fp, #-6]
    9440:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9444:	e3530000 	cmp	r3, #0
    9448:	1afffff5 	bne	9424 <shellListItem+0x58>
    if (item->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    944c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9450:	e5d33001 	ldrb	r3, [r3, #1]
    9454:	e7e33053 	ubfx	r3, r3, #0, #4
    9458:	e6ef3073 	uxtb	r3, r3
    945c:	e3530001 	cmp	r3, #1
    9460:	ca000006 	bgt	9480 <shellListItem+0xb4>
        shellWriteString(shell, shellText[SHELL_TEXT_TYPE_CMD]);
    9464:	e30531b8 	movw	r3, #20920	; 0x51b8
    9468:	e3403001 	movt	r3, #1
    946c:	e593303c 	ldr	r3, [r3, #60]	; 0x3c
    9470:	e1a01003 	mov	r1, r3
    9474:	e51b0010 	ldr	r0, [fp, #-16]
    9478:	ebfffddc 	bl	8bf0 <shellWriteString>
    947c:	ea00002c 	b	9534 <shellListItem+0x168>
    } else if (item->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    9480:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9484:	e5d33001 	ldrb	r3, [r3, #1]
    9488:	e7e33053 	ubfx	r3, r3, #0, #4
    948c:	e6ef3073 	uxtb	r3, r3
    9490:	e3530007 	cmp	r3, #7
    9494:	ca000006 	bgt	94b4 <shellListItem+0xe8>
        shellWriteString(shell, shellText[SHELL_TEXT_TYPE_VAR]);
    9498:	e30531b8 	movw	r3, #20920	; 0x51b8
    949c:	e3403001 	movt	r3, #1
    94a0:	e5933040 	ldr	r3, [r3, #64]	; 0x40
    94a4:	e1a01003 	mov	r1, r3
    94a8:	e51b0010 	ldr	r0, [fp, #-16]
    94ac:	ebfffdcf 	bl	8bf0 <shellWriteString>
    94b0:	ea00001f 	b	9534 <shellListItem+0x168>
    } else if (item->attr.attrs.type <= SHELL_TYPE_USER) {
    94b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    94b8:	e5d33001 	ldrb	r3, [r3, #1]
    94bc:	e7e33053 	ubfx	r3, r3, #0, #4
    94c0:	e6ef3073 	uxtb	r3, r3
    94c4:	e3530008 	cmp	r3, #8
    94c8:	ca000006 	bgt	94e8 <shellListItem+0x11c>
        shellWriteString(shell, shellText[SHELL_TEXT_TYPE_USER]);
    94cc:	e30531b8 	movw	r3, #20920	; 0x51b8
    94d0:	e3403001 	movt	r3, #1
    94d4:	e5933044 	ldr	r3, [r3, #68]	; 0x44
    94d8:	e1a01003 	mov	r1, r3
    94dc:	e51b0010 	ldr	r0, [fp, #-16]
    94e0:	ebfffdc2 	bl	8bf0 <shellWriteString>
    94e4:	ea000012 	b	9534 <shellListItem+0x168>
    } else if (item->attr.attrs.type <= SHELL_TYPE_KEY) {
    94e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    94ec:	e5d33001 	ldrb	r3, [r3, #1]
    94f0:	e7e33053 	ubfx	r3, r3, #0, #4
    94f4:	e6ef3073 	uxtb	r3, r3
    94f8:	e3530009 	cmp	r3, #9
    94fc:	ca000006 	bgt	951c <shellListItem+0x150>
        shellWriteString(shell, shellText[SHELL_TEXT_TYPE_KEY]);
    9500:	e30531b8 	movw	r3, #20920	; 0x51b8
    9504:	e3403001 	movt	r3, #1
    9508:	e5933048 	ldr	r3, [r3, #72]	; 0x48
    950c:	e1a01003 	mov	r1, r3
    9510:	e51b0010 	ldr	r0, [fp, #-16]
    9514:	ebfffdb5 	bl	8bf0 <shellWriteString>
    9518:	ea000005 	b	9534 <shellListItem+0x168>
    } else {
        shellWriteString(shell, shellText[SHELL_TEXT_TYPE_NONE]);
    951c:	e30531b8 	movw	r3, #20920	; 0x51b8
    9520:	e3403001 	movt	r3, #1
    9524:	e593304c 	ldr	r3, [r3, #76]	; 0x4c
    9528:	e1a01003 	mov	r1, r3
    952c:	e51b0010 	ldr	r0, [fp, #-16]
    9530:	ebfffdae 	bl	8bf0 <shellWriteString>
    }
#if SHELL_HELP_SHOW_PERMISSION == 1
    shellWriteString(shell, "  ");
    9534:	e3041ce8 	movw	r1, #19688	; 0x4ce8
    9538:	e3401001 	movt	r1, #1
    953c:	e51b0010 	ldr	r0, [fp, #-16]
    9540:	ebfffdaa 	bl	8bf0 <shellWriteString>
    for (signed char i = 7; i >= 0; i--) {
    9544:	e3a03007 	mov	r3, #7
    9548:	e54b3007 	strb	r3, [fp, #-7]
    954c:	ea000012 	b	959c <shellListItem+0x1d0>
        shellWriteByte(shell, item->attr.attrs.permission & (1 << i) ? 'x' : '-');
    9550:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9554:	e5d33000 	ldrb	r3, [r3]
    9558:	e1a02003 	mov	r2, r3
    955c:	e15b30d7 	ldrsb	r3, [fp, #-7]
    9560:	e1a03352 	asr	r3, r2, r3
    9564:	e2033001 	and	r3, r3, #1
    9568:	e3530000 	cmp	r3, #0
    956c:	0a000001 	beq	9578 <shellListItem+0x1ac>
    9570:	e3a03078 	mov	r3, #120	; 0x78
    9574:	ea000000 	b	957c <shellListItem+0x1b0>
    9578:	e3a0302d 	mov	r3, #45	; 0x2d
    957c:	e1a01003 	mov	r1, r3
    9580:	e51b0010 	ldr	r0, [fp, #-16]
    9584:	ebfffd8a 	bl	8bb4 <shellWriteByte>
    for (signed char i = 7; i >= 0; i--) {
    9588:	e15b30d7 	ldrsb	r3, [fp, #-7]
    958c:	e6ef3073 	uxtb	r3, r3
    9590:	e2433001 	sub	r3, r3, #1
    9594:	e6ef3073 	uxtb	r3, r3
    9598:	e54b3007 	strb	r3, [fp, #-7]
    959c:	e15b30d7 	ldrsb	r3, [fp, #-7]
    95a0:	e3530000 	cmp	r3, #0
    95a4:	aaffffe9 	bge	9550 <shellListItem+0x184>
    }
#endif
    shellWriteString(shell, "  ");
    95a8:	e3041ce8 	movw	r1, #19688	; 0x4ce8
    95ac:	e3401001 	movt	r1, #1
    95b0:	e51b0010 	ldr	r0, [fp, #-16]
    95b4:	ebfffd8d 	bl	8bf0 <shellWriteString>
    shellWriteCommandDesc(shell, shellGetCommandDesc(item));
    95b8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    95bc:	ebffff5d 	bl	9338 <shellGetCommandDesc>
    95c0:	e1a03000 	mov	r3, r0
    95c4:	e1a01003 	mov	r1, r3
    95c8:	e51b0010 	ldr	r0, [fp, #-16]
    95cc:	ebfffdaa 	bl	8c7c <shellWriteCommandDesc>
    shellWriteString(shell, "\r\n");
    95d0:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    95d4:	e3401001 	movt	r1, #1
    95d8:	e51b0010 	ldr	r0, [fp, #-16]
    95dc:	ebfffd83 	bl	8bf0 <shellWriteString>
}
    95e0:	e320f000 	nop	{0}
    95e4:	e24bd004 	sub	sp, fp, #4
    95e8:	e8bd8800 	pop	{fp, pc}

000095ec <shellListCommand>:
 * @brief shell列出可执行命令
 *
 * @param shell shell对象
 */
void shellListCommand(Shell* shell)
{
    95ec:	e92d4800 	push	{fp, lr}
    95f0:	e28db004 	add	fp, sp, #4
    95f4:	e24dd010 	sub	sp, sp, #16
    95f8:	e50b0010 	str	r0, [fp, #-16]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    95fc:	e51b3010 	ldr	r3, [fp, #-16]
    9600:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    9604:	e50b300c 	str	r3, [fp, #-12]
    shellWriteString(shell, shellText[SHELL_TEXT_CMD_LIST]);
    9608:	e30531b8 	movw	r3, #20920	; 0x51b8
    960c:	e3403001 	movt	r3, #1
    9610:	e5933004 	ldr	r3, [r3, #4]
    9614:	e1a01003 	mov	r1, r3
    9618:	e51b0010 	ldr	r0, [fp, #-16]
    961c:	ebfffd73 	bl	8bf0 <shellWriteString>
    for (short i = 0; i < shell->commandList.count; i++) {
    9620:	e3a03000 	mov	r3, #0
    9624:	e14b30b6 	strh	r3, [fp, #-6]
    9628:	ea00001e 	b	96a8 <shellListCommand+0xbc>
        if (base[i].attr.attrs.type <= SHELL_TYPE_CMD_FUNC
    962c:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9630:	e1a03203 	lsl	r3, r3, #4
    9634:	e51b200c 	ldr	r2, [fp, #-12]
    9638:	e0823003 	add	r3, r2, r3
    963c:	e5d33001 	ldrb	r3, [r3, #1]
    9640:	e7e33053 	ubfx	r3, r3, #0, #4
    9644:	e6ef3073 	uxtb	r3, r3
    9648:	e3530001 	cmp	r3, #1
    964c:	ca000010 	bgt	9694 <shellListCommand+0xa8>
            && shellCheckPermission(shell, &base[i]) == 0) {
    9650:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9654:	e1a03203 	lsl	r3, r3, #4
    9658:	e51b200c 	ldr	r2, [fp, #-12]
    965c:	e0823003 	add	r3, r2, r3
    9660:	e1a01003 	mov	r1, r3
    9664:	e51b0010 	ldr	r0, [fp, #-16]
    9668:	ebfffdf9 	bl	8e54 <shellCheckPermission>
    966c:	e1a03000 	mov	r3, r0
    9670:	e3530000 	cmp	r3, #0
    9674:	1a000006 	bne	9694 <shellListCommand+0xa8>
            shellListItem(shell, &base[i]);
    9678:	e15b30f6 	ldrsh	r3, [fp, #-6]
    967c:	e1a03203 	lsl	r3, r3, #4
    9680:	e51b200c 	ldr	r2, [fp, #-12]
    9684:	e0823003 	add	r3, r2, r3
    9688:	e1a01003 	mov	r1, r3
    968c:	e51b0010 	ldr	r0, [fp, #-16]
    9690:	ebffff4d 	bl	93cc <shellListItem>
    for (short i = 0; i < shell->commandList.count; i++) {
    9694:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9698:	e6ff3073 	uxth	r3, r3
    969c:	e2833001 	add	r3, r3, #1
    96a0:	e6ff3073 	uxth	r3, r3
    96a4:	e14b30b6 	strh	r3, [fp, #-6]
    96a8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    96ac:	e51b2010 	ldr	r2, [fp, #-16]
    96b0:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    96b4:	e1530002 	cmp	r3, r2
    96b8:	baffffdb 	blt	962c <shellListCommand+0x40>
        }
    }
}
    96bc:	e320f000 	nop	{0}
    96c0:	e24bd004 	sub	sp, fp, #4
    96c4:	e8bd8800 	pop	{fp, pc}

000096c8 <shellListVar>:
 * @brief shell列出变量
 *
 * @param shell shell对象
 */
void shellListVar(Shell* shell)
{
    96c8:	e92d4800 	push	{fp, lr}
    96cc:	e28db004 	add	fp, sp, #4
    96d0:	e24dd010 	sub	sp, sp, #16
    96d4:	e50b0010 	str	r0, [fp, #-16]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    96d8:	e51b3010 	ldr	r3, [fp, #-16]
    96dc:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    96e0:	e50b300c 	str	r3, [fp, #-12]
    shellWriteString(shell, shellText[SHELL_TEXT_VAR_LIST]);
    96e4:	e30531b8 	movw	r3, #20920	; 0x51b8
    96e8:	e3403001 	movt	r3, #1
    96ec:	e5933008 	ldr	r3, [r3, #8]
    96f0:	e1a01003 	mov	r1, r3
    96f4:	e51b0010 	ldr	r0, [fp, #-16]
    96f8:	ebfffd3c 	bl	8bf0 <shellWriteString>
    for (short i = 0; i < shell->commandList.count; i++) {
    96fc:	e3a03000 	mov	r3, #0
    9700:	e14b30b6 	strh	r3, [fp, #-6]
    9704:	ea000027 	b	97a8 <shellListVar+0xe0>
        if (base[i].attr.attrs.type > SHELL_TYPE_CMD_FUNC
    9708:	e15b30f6 	ldrsh	r3, [fp, #-6]
    970c:	e1a03203 	lsl	r3, r3, #4
    9710:	e51b200c 	ldr	r2, [fp, #-12]
    9714:	e0823003 	add	r3, r2, r3
    9718:	e5d33001 	ldrb	r3, [r3, #1]
    971c:	e7e33053 	ubfx	r3, r3, #0, #4
    9720:	e6ef3073 	uxtb	r3, r3
    9724:	e3530001 	cmp	r3, #1
    9728:	da000019 	ble	9794 <shellListVar+0xcc>
            && base[i].attr.attrs.type <= SHELL_TYPE_VAR_NODE
    972c:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9730:	e1a03203 	lsl	r3, r3, #4
    9734:	e51b200c 	ldr	r2, [fp, #-12]
    9738:	e0823003 	add	r3, r2, r3
    973c:	e5d33001 	ldrb	r3, [r3, #1]
    9740:	e7e33053 	ubfx	r3, r3, #0, #4
    9744:	e6ef3073 	uxtb	r3, r3
    9748:	e3530007 	cmp	r3, #7
    974c:	ca000010 	bgt	9794 <shellListVar+0xcc>
            && shellCheckPermission(shell, &base[i]) == 0) {
    9750:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9754:	e1a03203 	lsl	r3, r3, #4
    9758:	e51b200c 	ldr	r2, [fp, #-12]
    975c:	e0823003 	add	r3, r2, r3
    9760:	e1a01003 	mov	r1, r3
    9764:	e51b0010 	ldr	r0, [fp, #-16]
    9768:	ebfffdb9 	bl	8e54 <shellCheckPermission>
    976c:	e1a03000 	mov	r3, r0
    9770:	e3530000 	cmp	r3, #0
    9774:	1a000006 	bne	9794 <shellListVar+0xcc>
            shellListItem(shell, &base[i]);
    9778:	e15b30f6 	ldrsh	r3, [fp, #-6]
    977c:	e1a03203 	lsl	r3, r3, #4
    9780:	e51b200c 	ldr	r2, [fp, #-12]
    9784:	e0823003 	add	r3, r2, r3
    9788:	e1a01003 	mov	r1, r3
    978c:	e51b0010 	ldr	r0, [fp, #-16]
    9790:	ebffff0d 	bl	93cc <shellListItem>
    for (short i = 0; i < shell->commandList.count; i++) {
    9794:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9798:	e6ff3073 	uxth	r3, r3
    979c:	e2833001 	add	r3, r3, #1
    97a0:	e6ff3073 	uxth	r3, r3
    97a4:	e14b30b6 	strh	r3, [fp, #-6]
    97a8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    97ac:	e51b2010 	ldr	r2, [fp, #-16]
    97b0:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    97b4:	e1530002 	cmp	r3, r2
    97b8:	baffffd2 	blt	9708 <shellListVar+0x40>
        }
    }
}
    97bc:	e320f000 	nop	{0}
    97c0:	e24bd004 	sub	sp, fp, #4
    97c4:	e8bd8800 	pop	{fp, pc}

000097c8 <shellListUser>:
 * @brief shell列出用户
 *
 * @param shell shell对象
 */
void shellListUser(Shell* shell)
{
    97c8:	e92d4800 	push	{fp, lr}
    97cc:	e28db004 	add	fp, sp, #4
    97d0:	e24dd010 	sub	sp, sp, #16
    97d4:	e50b0010 	str	r0, [fp, #-16]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    97d8:	e51b3010 	ldr	r3, [fp, #-16]
    97dc:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    97e0:	e50b300c 	str	r3, [fp, #-12]
    shellWriteString(shell, shellText[SHELL_TEXT_USER_LIST]);
    97e4:	e30531b8 	movw	r3, #20920	; 0x51b8
    97e8:	e3403001 	movt	r3, #1
    97ec:	e593300c 	ldr	r3, [r3, #12]
    97f0:	e1a01003 	mov	r1, r3
    97f4:	e51b0010 	ldr	r0, [fp, #-16]
    97f8:	ebfffcfc 	bl	8bf0 <shellWriteString>
    for (short i = 0; i < shell->commandList.count; i++) {
    97fc:	e3a03000 	mov	r3, #0
    9800:	e14b30b6 	strh	r3, [fp, #-6]
    9804:	ea000027 	b	98a8 <shellListUser+0xe0>
        if (base[i].attr.attrs.type > SHELL_TYPE_VAR_NODE
    9808:	e15b30f6 	ldrsh	r3, [fp, #-6]
    980c:	e1a03203 	lsl	r3, r3, #4
    9810:	e51b200c 	ldr	r2, [fp, #-12]
    9814:	e0823003 	add	r3, r2, r3
    9818:	e5d33001 	ldrb	r3, [r3, #1]
    981c:	e7e33053 	ubfx	r3, r3, #0, #4
    9820:	e6ef3073 	uxtb	r3, r3
    9824:	e3530007 	cmp	r3, #7
    9828:	da000019 	ble	9894 <shellListUser+0xcc>
            && base[i].attr.attrs.type <= SHELL_TYPE_USER
    982c:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9830:	e1a03203 	lsl	r3, r3, #4
    9834:	e51b200c 	ldr	r2, [fp, #-12]
    9838:	e0823003 	add	r3, r2, r3
    983c:	e5d33001 	ldrb	r3, [r3, #1]
    9840:	e7e33053 	ubfx	r3, r3, #0, #4
    9844:	e6ef3073 	uxtb	r3, r3
    9848:	e3530008 	cmp	r3, #8
    984c:	ca000010 	bgt	9894 <shellListUser+0xcc>
            && shellCheckPermission(shell, &base[i]) == 0) {
    9850:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9854:	e1a03203 	lsl	r3, r3, #4
    9858:	e51b200c 	ldr	r2, [fp, #-12]
    985c:	e0823003 	add	r3, r2, r3
    9860:	e1a01003 	mov	r1, r3
    9864:	e51b0010 	ldr	r0, [fp, #-16]
    9868:	ebfffd79 	bl	8e54 <shellCheckPermission>
    986c:	e1a03000 	mov	r3, r0
    9870:	e3530000 	cmp	r3, #0
    9874:	1a000006 	bne	9894 <shellListUser+0xcc>
            shellListItem(shell, &base[i]);
    9878:	e15b30f6 	ldrsh	r3, [fp, #-6]
    987c:	e1a03203 	lsl	r3, r3, #4
    9880:	e51b200c 	ldr	r2, [fp, #-12]
    9884:	e0823003 	add	r3, r2, r3
    9888:	e1a01003 	mov	r1, r3
    988c:	e51b0010 	ldr	r0, [fp, #-16]
    9890:	ebfffecd 	bl	93cc <shellListItem>
    for (short i = 0; i < shell->commandList.count; i++) {
    9894:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9898:	e6ff3073 	uxth	r3, r3
    989c:	e2833001 	add	r3, r3, #1
    98a0:	e6ff3073 	uxth	r3, r3
    98a4:	e14b30b6 	strh	r3, [fp, #-6]
    98a8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    98ac:	e51b2010 	ldr	r2, [fp, #-16]
    98b0:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    98b4:	e1530002 	cmp	r3, r2
    98b8:	baffffd2 	blt	9808 <shellListUser+0x40>
        }
    }
}
    98bc:	e320f000 	nop	{0}
    98c0:	e24bd004 	sub	sp, fp, #4
    98c4:	e8bd8800 	pop	{fp, pc}

000098c8 <shellListKey>:
 * @brief shell列出按键
 *
 * @param shell shell对象
 */
void shellListKey(Shell* shell)
{
    98c8:	e92d4800 	push	{fp, lr}
    98cc:	e28db004 	add	fp, sp, #4
    98d0:	e24dd010 	sub	sp, sp, #16
    98d4:	e50b0010 	str	r0, [fp, #-16]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    98d8:	e51b3010 	ldr	r3, [fp, #-16]
    98dc:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    98e0:	e50b300c 	str	r3, [fp, #-12]
    shellWriteString(shell, shellText[SHELL_TEXT_KEY_LIST]);
    98e4:	e30531b8 	movw	r3, #20920	; 0x51b8
    98e8:	e3403001 	movt	r3, #1
    98ec:	e5933010 	ldr	r3, [r3, #16]
    98f0:	e1a01003 	mov	r1, r3
    98f4:	e51b0010 	ldr	r0, [fp, #-16]
    98f8:	ebfffcbc 	bl	8bf0 <shellWriteString>
    for (short i = 0; i < shell->commandList.count; i++) {
    98fc:	e3a03000 	mov	r3, #0
    9900:	e14b30b6 	strh	r3, [fp, #-6]
    9904:	ea000027 	b	99a8 <shellListKey+0xe0>
        if (base[i].attr.attrs.type > SHELL_TYPE_USER
    9908:	e15b30f6 	ldrsh	r3, [fp, #-6]
    990c:	e1a03203 	lsl	r3, r3, #4
    9910:	e51b200c 	ldr	r2, [fp, #-12]
    9914:	e0823003 	add	r3, r2, r3
    9918:	e5d33001 	ldrb	r3, [r3, #1]
    991c:	e7e33053 	ubfx	r3, r3, #0, #4
    9920:	e6ef3073 	uxtb	r3, r3
    9924:	e3530008 	cmp	r3, #8
    9928:	da000019 	ble	9994 <shellListKey+0xcc>
            && base[i].attr.attrs.type <= SHELL_TYPE_KEY
    992c:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9930:	e1a03203 	lsl	r3, r3, #4
    9934:	e51b200c 	ldr	r2, [fp, #-12]
    9938:	e0823003 	add	r3, r2, r3
    993c:	e5d33001 	ldrb	r3, [r3, #1]
    9940:	e7e33053 	ubfx	r3, r3, #0, #4
    9944:	e6ef3073 	uxtb	r3, r3
    9948:	e3530009 	cmp	r3, #9
    994c:	ca000010 	bgt	9994 <shellListKey+0xcc>
            && shellCheckPermission(shell, &base[i]) == 0) {
    9950:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9954:	e1a03203 	lsl	r3, r3, #4
    9958:	e51b200c 	ldr	r2, [fp, #-12]
    995c:	e0823003 	add	r3, r2, r3
    9960:	e1a01003 	mov	r1, r3
    9964:	e51b0010 	ldr	r0, [fp, #-16]
    9968:	ebfffd39 	bl	8e54 <shellCheckPermission>
    996c:	e1a03000 	mov	r3, r0
    9970:	e3530000 	cmp	r3, #0
    9974:	1a000006 	bne	9994 <shellListKey+0xcc>
            shellListItem(shell, &base[i]);
    9978:	e15b30f6 	ldrsh	r3, [fp, #-6]
    997c:	e1a03203 	lsl	r3, r3, #4
    9980:	e51b200c 	ldr	r2, [fp, #-12]
    9984:	e0823003 	add	r3, r2, r3
    9988:	e1a01003 	mov	r1, r3
    998c:	e51b0010 	ldr	r0, [fp, #-16]
    9990:	ebfffe8d 	bl	93cc <shellListItem>
    for (short i = 0; i < shell->commandList.count; i++) {
    9994:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9998:	e6ff3073 	uxth	r3, r3
    999c:	e2833001 	add	r3, r3, #1
    99a0:	e6ff3073 	uxth	r3, r3
    99a4:	e14b30b6 	strh	r3, [fp, #-6]
    99a8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    99ac:	e51b2010 	ldr	r2, [fp, #-16]
    99b0:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    99b4:	e1530002 	cmp	r3, r2
    99b8:	baffffd2 	blt	9908 <shellListKey+0x40>
        }
    }
}
    99bc:	e320f000 	nop	{0}
    99c0:	e24bd004 	sub	sp, fp, #4
    99c4:	e8bd8800 	pop	{fp, pc}

000099c8 <shellListAll>:
 * @brief shell列出所有命令
 *
 * @param shell shell对象
 */
void shellListAll(Shell* shell)
{
    99c8:	e92d4800 	push	{fp, lr}
    99cc:	e28db004 	add	fp, sp, #4
    99d0:	e24dd008 	sub	sp, sp, #8
    99d4:	e50b0008 	str	r0, [fp, #-8]
#if SHELL_HELP_LIST_USER == 1
    shellListUser(shell);
#endif
    shellListCommand(shell);
    99d8:	e51b0008 	ldr	r0, [fp, #-8]
    99dc:	ebffff02 	bl	95ec <shellListCommand>
    shellListVar(shell);
#endif
#if SHELL_HELP_LIST_KEY == 1
    shellListKey(shell);
#endif
}
    99e0:	e320f000 	nop	{0}
    99e4:	e24bd004 	sub	sp, fp, #4
    99e8:	e8bd8800 	pop	{fp, pc}

000099ec <shellDeleteCommandLine>:
 *
 * @param shell shell对象
 * @param length 删除长度
 */
void shellDeleteCommandLine(Shell* shell, unsigned char length)
{
    99ec:	e92d4800 	push	{fp, lr}
    99f0:	e28db004 	add	fp, sp, #4
    99f4:	e24dd008 	sub	sp, sp, #8
    99f8:	e50b0008 	str	r0, [fp, #-8]
    99fc:	e1a03001 	mov	r3, r1
    9a00:	e54b3009 	strb	r3, [fp, #-9]
    while (length--) {
    9a04:	ea000003 	b	9a18 <shellDeleteCommandLine+0x2c>
        shellWriteString(shell, "\b \b");
    9a08:	e3041cec 	movw	r1, #19692	; 0x4cec
    9a0c:	e3401001 	movt	r1, #1
    9a10:	e51b0008 	ldr	r0, [fp, #-8]
    9a14:	ebfffc75 	bl	8bf0 <shellWriteString>
    while (length--) {
    9a18:	e55b3009 	ldrb	r3, [fp, #-9]
    9a1c:	e2432001 	sub	r2, r3, #1
    9a20:	e54b2009 	strb	r2, [fp, #-9]
    9a24:	e3530000 	cmp	r3, #0
    9a28:	1afffff6 	bne	9a08 <shellDeleteCommandLine+0x1c>
    }
}
    9a2c:	e320f000 	nop	{0}
    9a30:	e24bd004 	sub	sp, fp, #4
    9a34:	e8bd8800 	pop	{fp, pc}

00009a38 <shellClearCommandLine>:
 * @brief shell 清空命令行输入
 *
 * @param shell shell对象
 */
void shellClearCommandLine(Shell* shell)
{
    9a38:	e92d4800 	push	{fp, lr}
    9a3c:	e28db004 	add	fp, sp, #4
    9a40:	e24dd010 	sub	sp, sp, #16
    9a44:	e50b0010 	str	r0, [fp, #-16]
    for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9a48:	e51b3010 	ldr	r3, [fp, #-16]
    9a4c:	e1d320bc 	ldrh	r2, [r3, #12]
    9a50:	e51b3010 	ldr	r3, [fp, #-16]
    9a54:	e1d330be 	ldrh	r3, [r3, #14]
    9a58:	e0423003 	sub	r3, r2, r3
    9a5c:	e6ff3073 	uxth	r3, r3
    9a60:	e14b30b6 	strh	r3, [fp, #-6]
    9a64:	ea000007 	b	9a88 <shellClearCommandLine+0x50>
        shellWriteByte(shell, ' ');
    9a68:	e3a01020 	mov	r1, #32
    9a6c:	e51b0010 	ldr	r0, [fp, #-16]
    9a70:	ebfffc4f 	bl	8bb4 <shellWriteByte>
    for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9a74:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9a78:	e6ff3073 	uxth	r3, r3
    9a7c:	e2433001 	sub	r3, r3, #1
    9a80:	e6ff3073 	uxth	r3, r3
    9a84:	e14b30b6 	strh	r3, [fp, #-6]
    9a88:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9a8c:	e3530000 	cmp	r3, #0
    9a90:	cafffff4 	bgt	9a68 <shellClearCommandLine+0x30>
    }
    shellDeleteCommandLine(shell, shell->parser.length);
    9a94:	e51b3010 	ldr	r3, [fp, #-16]
    9a98:	e1d330bc 	ldrh	r3, [r3, #12]
    9a9c:	e6ef3073 	uxtb	r3, r3
    9aa0:	e1a01003 	mov	r1, r3
    9aa4:	e51b0010 	ldr	r0, [fp, #-16]
    9aa8:	ebffffcf 	bl	99ec <shellDeleteCommandLine>
}
    9aac:	e320f000 	nop	{0}
    9ab0:	e24bd004 	sub	sp, fp, #4
    9ab4:	e8bd8800 	pop	{fp, pc}

00009ab8 <shellInsertByte>:
 *
 * @param shell shell对象
 * @param data 字符数据
 */
void shellInsertByte(Shell* shell, char data)
{
    9ab8:	e92d4800 	push	{fp, lr}
    9abc:	e28db004 	add	fp, sp, #4
    9ac0:	e24dd010 	sub	sp, sp, #16
    9ac4:	e50b0010 	str	r0, [fp, #-16]
    9ac8:	e1a03001 	mov	r3, r1
    9acc:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    /* 判断输入数据是否过长 */
    if (shell->parser.length >= shell->parser.bufferSize - 1) {
    9ad0:	e51b3010 	ldr	r3, [fp, #-16]
    9ad4:	e1d330bc 	ldrh	r3, [r3, #12]
    9ad8:	e1a02003 	mov	r2, r3
    9adc:	e51b3010 	ldr	r3, [fp, #-16]
    9ae0:	e1d333b4 	ldrh	r3, [r3, #52]	; 0x34
    9ae4:	e2433001 	sub	r3, r3, #1
    9ae8:	e1520003 	cmp	r2, r3
    9aec:	ba00000e 	blt	9b2c <shellInsertByte+0x74>
        shellWriteString(shell, shellText[SHELL_TEXT_CMD_TOO_LONG]);
    9af0:	e30531b8 	movw	r3, #20920	; 0x51b8
    9af4:	e3403001 	movt	r3, #1
    9af8:	e5933000 	ldr	r3, [r3]
    9afc:	e1a01003 	mov	r1, r3
    9b00:	e51b0010 	ldr	r0, [fp, #-16]
    9b04:	ebfffc39 	bl	8bf0 <shellWriteString>
        shellWritePrompt(shell, 1);
    9b08:	e3a01001 	mov	r1, #1
    9b0c:	e51b0010 	ldr	r0, [fp, #-16]
    9b10:	ebfffc98 	bl	8d78 <shellWritePrompt>
        shellWriteString(shell, shell->parser.buffer);
    9b14:	e51b3010 	ldr	r3, [fp, #-16]
    9b18:	e5933010 	ldr	r3, [r3, #16]
    9b1c:	e1a01003 	mov	r1, r3
    9b20:	e51b0010 	ldr	r0, [fp, #-16]
    9b24:	ebfffc31 	bl	8bf0 <shellWriteString>
        return;
    9b28:	ea00009e 	b	9da8 <shellInsertByte+0x2f0>
    }

    /* 插入数据 */
    if (shell->parser.cursor == shell->parser.length) {
    9b2c:	e51b3010 	ldr	r3, [fp, #-16]
    9b30:	e1d320be 	ldrh	r2, [r3, #14]
    9b34:	e51b3010 	ldr	r3, [fp, #-16]
    9b38:	e1d330bc 	ldrh	r3, [r3, #12]
    9b3c:	e1520003 	cmp	r2, r3
    9b40:	1a000024 	bne	9bd8 <shellInsertByte+0x120>
        shell->parser.buffer[shell->parser.length++] = data;
    9b44:	e51b3010 	ldr	r3, [fp, #-16]
    9b48:	e5932010 	ldr	r2, [r3, #16]
    9b4c:	e51b3010 	ldr	r3, [fp, #-16]
    9b50:	e1d330bc 	ldrh	r3, [r3, #12]
    9b54:	e2831001 	add	r1, r3, #1
    9b58:	e6ff0071 	uxth	r0, r1
    9b5c:	e51b1010 	ldr	r1, [fp, #-16]
    9b60:	e1c100bc 	strh	r0, [r1, #12]
    9b64:	e0823003 	add	r3, r2, r3
    9b68:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
    9b6c:	e5c32000 	strb	r2, [r3]
        shell->parser.buffer[shell->parser.length] = 0;
    9b70:	e51b3010 	ldr	r3, [fp, #-16]
    9b74:	e5933010 	ldr	r3, [r3, #16]
    9b78:	e51b2010 	ldr	r2, [fp, #-16]
    9b7c:	e1d220bc 	ldrh	r2, [r2, #12]
    9b80:	e0833002 	add	r3, r3, r2
    9b84:	e3a02000 	mov	r2, #0
    9b88:	e5c32000 	strb	r2, [r3]
        shell->parser.cursor++;
    9b8c:	e51b3010 	ldr	r3, [fp, #-16]
    9b90:	e1d330be 	ldrh	r3, [r3, #14]
    9b94:	e2833001 	add	r3, r3, #1
    9b98:	e6ff2073 	uxth	r2, r3
    9b9c:	e51b3010 	ldr	r3, [fp, #-16]
    9ba0:	e1c320be 	strh	r2, [r3, #14]
        shellWriteByte(shell, shell->status.isChecked ? data : '*');
    9ba4:	e51b3010 	ldr	r3, [fp, #-16]
    9ba8:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    9bac:	e2033001 	and	r3, r3, #1
    9bb0:	e6ef3073 	uxtb	r3, r3
    9bb4:	e3530000 	cmp	r3, #0
    9bb8:	0a000001 	beq	9bc4 <shellInsertByte+0x10c>
    9bbc:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    9bc0:	ea000000 	b	9bc8 <shellInsertByte+0x110>
    9bc4:	e3a0302a 	mov	r3, #42	; 0x2a
    9bc8:	e1a01003 	mov	r1, r3
    9bcc:	e51b0010 	ldr	r0, [fp, #-16]
    9bd0:	ebfffbf7 	bl	8bb4 <shellWriteByte>
    9bd4:	ea000073 	b	9da8 <shellInsertByte+0x2f0>
    } else if (shell->parser.cursor < shell->parser.length) {
    9bd8:	e51b3010 	ldr	r3, [fp, #-16]
    9bdc:	e1d320be 	ldrh	r2, [r3, #14]
    9be0:	e51b3010 	ldr	r3, [fp, #-16]
    9be4:	e1d330bc 	ldrh	r3, [r3, #12]
    9be8:	e1520003 	cmp	r2, r3
    9bec:	2a00006d 	bcs	9da8 <shellInsertByte+0x2f0>
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9bf0:	e51b3010 	ldr	r3, [fp, #-16]
    9bf4:	e1d320bc 	ldrh	r2, [r3, #12]
    9bf8:	e51b3010 	ldr	r3, [fp, #-16]
    9bfc:	e1d330be 	ldrh	r3, [r3, #14]
    9c00:	e0423003 	sub	r3, r2, r3
    9c04:	e6ff3073 	uxth	r3, r3
    9c08:	e14b30b6 	strh	r3, [fp, #-6]
    9c0c:	ea000017 	b	9c70 <shellInsertByte+0x1b8>
            shell->parser.buffer[shell->parser.cursor + i] = shell->parser.buffer[shell->parser.cursor + i - 1];
    9c10:	e51b3010 	ldr	r3, [fp, #-16]
    9c14:	e5933010 	ldr	r3, [r3, #16]
    9c18:	e51b2010 	ldr	r2, [fp, #-16]
    9c1c:	e1d220be 	ldrh	r2, [r2, #14]
    9c20:	e1a01002 	mov	r1, r2
    9c24:	e15b20f6 	ldrsh	r2, [fp, #-6]
    9c28:	e0812002 	add	r2, r1, r2
    9c2c:	e0833002 	add	r3, r3, r2
    9c30:	e51b2010 	ldr	r2, [fp, #-16]
    9c34:	e5921010 	ldr	r1, [r2, #16]
    9c38:	e51b2010 	ldr	r2, [fp, #-16]
    9c3c:	e1d220be 	ldrh	r2, [r2, #14]
    9c40:	e1a00002 	mov	r0, r2
    9c44:	e15b20f6 	ldrsh	r2, [fp, #-6]
    9c48:	e0802002 	add	r2, r0, r2
    9c4c:	e2422001 	sub	r2, r2, #1
    9c50:	e0812002 	add	r2, r1, r2
    9c54:	e5d22000 	ldrb	r2, [r2]
    9c58:	e5c32000 	strb	r2, [r3]
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9c5c:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9c60:	e6ff3073 	uxth	r3, r3
    9c64:	e2433001 	sub	r3, r3, #1
    9c68:	e6ff3073 	uxth	r3, r3
    9c6c:	e14b30b6 	strh	r3, [fp, #-6]
    9c70:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9c74:	e3530000 	cmp	r3, #0
    9c78:	caffffe4 	bgt	9c10 <shellInsertByte+0x158>
        }
        shell->parser.buffer[shell->parser.cursor++] = data;
    9c7c:	e51b3010 	ldr	r3, [fp, #-16]
    9c80:	e5932010 	ldr	r2, [r3, #16]
    9c84:	e51b3010 	ldr	r3, [fp, #-16]
    9c88:	e1d330be 	ldrh	r3, [r3, #14]
    9c8c:	e2831001 	add	r1, r3, #1
    9c90:	e6ff0071 	uxth	r0, r1
    9c94:	e51b1010 	ldr	r1, [fp, #-16]
    9c98:	e1c100be 	strh	r0, [r1, #14]
    9c9c:	e0823003 	add	r3, r2, r3
    9ca0:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
    9ca4:	e5c32000 	strb	r2, [r3]
        shell->parser.buffer[++shell->parser.length] = 0;
    9ca8:	e51b3010 	ldr	r3, [fp, #-16]
    9cac:	e5933010 	ldr	r3, [r3, #16]
    9cb0:	e51b2010 	ldr	r2, [fp, #-16]
    9cb4:	e1d220bc 	ldrh	r2, [r2, #12]
    9cb8:	e2822001 	add	r2, r2, #1
    9cbc:	e6ff1072 	uxth	r1, r2
    9cc0:	e51b2010 	ldr	r2, [fp, #-16]
    9cc4:	e1c210bc 	strh	r1, [r2, #12]
    9cc8:	e51b2010 	ldr	r2, [fp, #-16]
    9ccc:	e1d220bc 	ldrh	r2, [r2, #12]
    9cd0:	e0833002 	add	r3, r3, r2
    9cd4:	e3a02000 	mov	r2, #0
    9cd8:	e5c32000 	strb	r2, [r3]
        for (short i = shell->parser.cursor - 1; i < shell->parser.length; i++) {
    9cdc:	e51b3010 	ldr	r3, [fp, #-16]
    9ce0:	e1d330be 	ldrh	r3, [r3, #14]
    9ce4:	e2433001 	sub	r3, r3, #1
    9ce8:	e6ff3073 	uxth	r3, r3
    9cec:	e14b30b8 	strh	r3, [fp, #-8]
    9cf0:	ea000014 	b	9d48 <shellInsertByte+0x290>
            shellWriteByte(shell,
                shell->status.isChecked ? shell->parser.buffer[i] : '*');
    9cf4:	e51b3010 	ldr	r3, [fp, #-16]
    9cf8:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    9cfc:	e2033001 	and	r3, r3, #1
    9d00:	e6ef3073 	uxtb	r3, r3
            shellWriteByte(shell,
    9d04:	e3530000 	cmp	r3, #0
    9d08:	0a000005 	beq	9d24 <shellInsertByte+0x26c>
                shell->status.isChecked ? shell->parser.buffer[i] : '*');
    9d0c:	e51b3010 	ldr	r3, [fp, #-16]
    9d10:	e5932010 	ldr	r2, [r3, #16]
    9d14:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9d18:	e0823003 	add	r3, r2, r3
            shellWriteByte(shell,
    9d1c:	e5d33000 	ldrb	r3, [r3]
    9d20:	ea000000 	b	9d28 <shellInsertByte+0x270>
    9d24:	e3a0302a 	mov	r3, #42	; 0x2a
    9d28:	e1a01003 	mov	r1, r3
    9d2c:	e51b0010 	ldr	r0, [fp, #-16]
    9d30:	ebfffb9f 	bl	8bb4 <shellWriteByte>
        for (short i = shell->parser.cursor - 1; i < shell->parser.length; i++) {
    9d34:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9d38:	e6ff3073 	uxth	r3, r3
    9d3c:	e2833001 	add	r3, r3, #1
    9d40:	e6ff3073 	uxth	r3, r3
    9d44:	e14b30b8 	strh	r3, [fp, #-8]
    9d48:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9d4c:	e51b2010 	ldr	r2, [fp, #-16]
    9d50:	e1d220bc 	ldrh	r2, [r2, #12]
    9d54:	e1530002 	cmp	r3, r2
    9d58:	baffffe5 	blt	9cf4 <shellInsertByte+0x23c>
        }
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9d5c:	e51b3010 	ldr	r3, [fp, #-16]
    9d60:	e1d320bc 	ldrh	r2, [r3, #12]
    9d64:	e51b3010 	ldr	r3, [fp, #-16]
    9d68:	e1d330be 	ldrh	r3, [r3, #14]
    9d6c:	e0423003 	sub	r3, r2, r3
    9d70:	e6ff3073 	uxth	r3, r3
    9d74:	e14b30ba 	strh	r3, [fp, #-10]
    9d78:	ea000007 	b	9d9c <shellInsertByte+0x2e4>
            shellWriteByte(shell, '\b');
    9d7c:	e3a01008 	mov	r1, #8
    9d80:	e51b0010 	ldr	r0, [fp, #-16]
    9d84:	ebfffb8a 	bl	8bb4 <shellWriteByte>
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    9d88:	e15b30fa 	ldrsh	r3, [fp, #-10]
    9d8c:	e6ff3073 	uxth	r3, r3
    9d90:	e2433001 	sub	r3, r3, #1
    9d94:	e6ff3073 	uxth	r3, r3
    9d98:	e14b30ba 	strh	r3, [fp, #-10]
    9d9c:	e15b30fa 	ldrsh	r3, [fp, #-10]
    9da0:	e3530000 	cmp	r3, #0
    9da4:	cafffff4 	bgt	9d7c <shellInsertByte+0x2c4>
        }
    }
}
    9da8:	e24bd004 	sub	sp, fp, #4
    9dac:	e8bd8800 	pop	{fp, pc}

00009db0 <shellDeleteByte>:
 *
 * @param shell shell对象
 * @param direction 删除方向 {@code 1}删除光标前字符 {@code -1}删除光标处字符
 */
void shellDeleteByte(Shell* shell, signed char direction)
{
    9db0:	e92d4800 	push	{fp, lr}
    9db4:	e28db004 	add	fp, sp, #4
    9db8:	e24dd010 	sub	sp, sp, #16
    9dbc:	e50b0010 	str	r0, [fp, #-16]
    9dc0:	e1a03001 	mov	r3, r1
    9dc4:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    char offset = (direction == -1) ? 1 : 0;
    9dc8:	e15b31d1 	ldrsb	r3, [fp, #-17]	; 0xffffffef
    9dcc:	e3730001 	cmn	r3, #1
    9dd0:	03a03001 	moveq	r3, #1
    9dd4:	13a03000 	movne	r3, #0
    9dd8:	e6ef3073 	uxtb	r3, r3
    9ddc:	e54b300b 	strb	r3, [fp, #-11]

    if ((shell->parser.cursor == 0 && direction == 1)
    9de0:	e51b3010 	ldr	r3, [fp, #-16]
    9de4:	e1d330be 	ldrh	r3, [r3, #14]
    9de8:	e3530000 	cmp	r3, #0
    9dec:	1a000002 	bne	9dfc <shellDeleteByte+0x4c>
    9df0:	e15b31d1 	ldrsb	r3, [fp, #-17]	; 0xffffffef
    9df4:	e3530001 	cmp	r3, #1
    9df8:	0a000094 	beq	a050 <shellDeleteByte+0x2a0>
        || (shell->parser.cursor == shell->parser.length && direction == -1)) {
    9dfc:	e51b3010 	ldr	r3, [fp, #-16]
    9e00:	e1d320be 	ldrh	r2, [r3, #14]
    9e04:	e51b3010 	ldr	r3, [fp, #-16]
    9e08:	e1d330bc 	ldrh	r3, [r3, #12]
    9e0c:	e1520003 	cmp	r2, r3
    9e10:	1a000002 	bne	9e20 <shellDeleteByte+0x70>
    9e14:	e15b31d1 	ldrsb	r3, [fp, #-17]	; 0xffffffef
    9e18:	e3730001 	cmn	r3, #1
    9e1c:	0a00008b 	beq	a050 <shellDeleteByte+0x2a0>
        return;
    }
    if (shell->parser.cursor == shell->parser.length && direction == 1) {
    9e20:	e51b3010 	ldr	r3, [fp, #-16]
    9e24:	e1d320be 	ldrh	r2, [r3, #14]
    9e28:	e51b3010 	ldr	r3, [fp, #-16]
    9e2c:	e1d330bc 	ldrh	r3, [r3, #12]
    9e30:	e1520003 	cmp	r2, r3
    9e34:	1a000019 	bne	9ea0 <shellDeleteByte+0xf0>
    9e38:	e15b31d1 	ldrsb	r3, [fp, #-17]	; 0xffffffef
    9e3c:	e3530001 	cmp	r3, #1
    9e40:	1a000016 	bne	9ea0 <shellDeleteByte+0xf0>
        shell->parser.cursor--;
    9e44:	e51b3010 	ldr	r3, [fp, #-16]
    9e48:	e1d330be 	ldrh	r3, [r3, #14]
    9e4c:	e2433001 	sub	r3, r3, #1
    9e50:	e6ff2073 	uxth	r2, r3
    9e54:	e51b3010 	ldr	r3, [fp, #-16]
    9e58:	e1c320be 	strh	r2, [r3, #14]
        shell->parser.length--;
    9e5c:	e51b3010 	ldr	r3, [fp, #-16]
    9e60:	e1d330bc 	ldrh	r3, [r3, #12]
    9e64:	e2433001 	sub	r3, r3, #1
    9e68:	e6ff2073 	uxth	r2, r3
    9e6c:	e51b3010 	ldr	r3, [fp, #-16]
    9e70:	e1c320bc 	strh	r2, [r3, #12]
        shell->parser.buffer[shell->parser.length] = 0;
    9e74:	e51b3010 	ldr	r3, [fp, #-16]
    9e78:	e5933010 	ldr	r3, [r3, #16]
    9e7c:	e51b2010 	ldr	r2, [fp, #-16]
    9e80:	e1d220bc 	ldrh	r2, [r2, #12]
    9e84:	e0833002 	add	r3, r3, r2
    9e88:	e3a02000 	mov	r2, #0
    9e8c:	e5c32000 	strb	r2, [r3]
        shellDeleteCommandLine(shell, 1);
    9e90:	e3a01001 	mov	r1, #1
    9e94:	e51b0010 	ldr	r0, [fp, #-16]
    9e98:	ebfffed3 	bl	99ec <shellDeleteCommandLine>
    9e9c:	ea00006c 	b	a054 <shellDeleteByte+0x2a4>
    } else {
        for (short i = offset; i < shell->parser.length - shell->parser.cursor; i++) {
    9ea0:	e55b300b 	ldrb	r3, [fp, #-11]
    9ea4:	e14b30b6 	strh	r3, [fp, #-6]
    9ea8:	ea000017 	b	9f0c <shellDeleteByte+0x15c>
            shell->parser.buffer[shell->parser.cursor + i - 1] = shell->parser.buffer[shell->parser.cursor + i];
    9eac:	e51b3010 	ldr	r3, [fp, #-16]
    9eb0:	e5932010 	ldr	r2, [r3, #16]
    9eb4:	e51b3010 	ldr	r3, [fp, #-16]
    9eb8:	e1d330be 	ldrh	r3, [r3, #14]
    9ebc:	e1a01003 	mov	r1, r3
    9ec0:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9ec4:	e0813003 	add	r3, r1, r3
    9ec8:	e2433001 	sub	r3, r3, #1
    9ecc:	e0823003 	add	r3, r2, r3
    9ed0:	e51b2010 	ldr	r2, [fp, #-16]
    9ed4:	e5922010 	ldr	r2, [r2, #16]
    9ed8:	e51b1010 	ldr	r1, [fp, #-16]
    9edc:	e1d110be 	ldrh	r1, [r1, #14]
    9ee0:	e1a00001 	mov	r0, r1
    9ee4:	e15b10f6 	ldrsh	r1, [fp, #-6]
    9ee8:	e0801001 	add	r1, r0, r1
    9eec:	e0822001 	add	r2, r2, r1
    9ef0:	e5d22000 	ldrb	r2, [r2]
    9ef4:	e5c32000 	strb	r2, [r3]
        for (short i = offset; i < shell->parser.length - shell->parser.cursor; i++) {
    9ef8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    9efc:	e6ff3073 	uxth	r3, r3
    9f00:	e2833001 	add	r3, r3, #1
    9f04:	e6ff3073 	uxth	r3, r3
    9f08:	e14b30b6 	strh	r3, [fp, #-6]
    9f0c:	e15b20f6 	ldrsh	r2, [fp, #-6]
    9f10:	e51b3010 	ldr	r3, [fp, #-16]
    9f14:	e1d330bc 	ldrh	r3, [r3, #12]
    9f18:	e1a01003 	mov	r1, r3
    9f1c:	e51b3010 	ldr	r3, [fp, #-16]
    9f20:	e1d330be 	ldrh	r3, [r3, #14]
    9f24:	e0413003 	sub	r3, r1, r3
    9f28:	e1520003 	cmp	r2, r3
    9f2c:	baffffde 	blt	9eac <shellDeleteByte+0xfc>
        }
        shell->parser.length--;
    9f30:	e51b3010 	ldr	r3, [fp, #-16]
    9f34:	e1d330bc 	ldrh	r3, [r3, #12]
    9f38:	e2433001 	sub	r3, r3, #1
    9f3c:	e6ff2073 	uxth	r2, r3
    9f40:	e51b3010 	ldr	r3, [fp, #-16]
    9f44:	e1c320bc 	strh	r2, [r3, #12]
        if (!offset) {
    9f48:	e55b300b 	ldrb	r3, [fp, #-11]
    9f4c:	e3530000 	cmp	r3, #0
    9f50:	1a000008 	bne	9f78 <shellDeleteByte+0x1c8>
            shell->parser.cursor--;
    9f54:	e51b3010 	ldr	r3, [fp, #-16]
    9f58:	e1d330be 	ldrh	r3, [r3, #14]
    9f5c:	e2433001 	sub	r3, r3, #1
    9f60:	e6ff2073 	uxth	r2, r3
    9f64:	e51b3010 	ldr	r3, [fp, #-16]
    9f68:	e1c320be 	strh	r2, [r3, #14]
            shellWriteByte(shell, '\b');
    9f6c:	e3a01008 	mov	r1, #8
    9f70:	e51b0010 	ldr	r0, [fp, #-16]
    9f74:	ebfffb0e 	bl	8bb4 <shellWriteByte>
        }
        shell->parser.buffer[shell->parser.length] = 0;
    9f78:	e51b3010 	ldr	r3, [fp, #-16]
    9f7c:	e5933010 	ldr	r3, [r3, #16]
    9f80:	e51b2010 	ldr	r2, [fp, #-16]
    9f84:	e1d220bc 	ldrh	r2, [r2, #12]
    9f88:	e0833002 	add	r3, r3, r2
    9f8c:	e3a02000 	mov	r2, #0
    9f90:	e5c32000 	strb	r2, [r3]
        for (short i = shell->parser.cursor; i < shell->parser.length; i++) {
    9f94:	e51b3010 	ldr	r3, [fp, #-16]
    9f98:	e1d330be 	ldrh	r3, [r3, #14]
    9f9c:	e14b30b8 	strh	r3, [fp, #-8]
    9fa0:	ea00000c 	b	9fd8 <shellDeleteByte+0x228>
            shellWriteByte(shell, shell->parser.buffer[i]);
    9fa4:	e51b3010 	ldr	r3, [fp, #-16]
    9fa8:	e5932010 	ldr	r2, [r3, #16]
    9fac:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9fb0:	e0823003 	add	r3, r2, r3
    9fb4:	e5d33000 	ldrb	r3, [r3]
    9fb8:	e1a01003 	mov	r1, r3
    9fbc:	e51b0010 	ldr	r0, [fp, #-16]
    9fc0:	ebfffafb 	bl	8bb4 <shellWriteByte>
        for (short i = shell->parser.cursor; i < shell->parser.length; i++) {
    9fc4:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9fc8:	e6ff3073 	uxth	r3, r3
    9fcc:	e2833001 	add	r3, r3, #1
    9fd0:	e6ff3073 	uxth	r3, r3
    9fd4:	e14b30b8 	strh	r3, [fp, #-8]
    9fd8:	e15b30f8 	ldrsh	r3, [fp, #-8]
    9fdc:	e51b2010 	ldr	r2, [fp, #-16]
    9fe0:	e1d220bc 	ldrh	r2, [r2, #12]
    9fe4:	e1530002 	cmp	r3, r2
    9fe8:	baffffed 	blt	9fa4 <shellDeleteByte+0x1f4>
        }
        shellWriteByte(shell, ' ');
    9fec:	e3a01020 	mov	r1, #32
    9ff0:	e51b0010 	ldr	r0, [fp, #-16]
    9ff4:	ebfffaee 	bl	8bb4 <shellWriteByte>
        for (short i = shell->parser.length - shell->parser.cursor + 1; i > 0; i--) {
    9ff8:	e51b3010 	ldr	r3, [fp, #-16]
    9ffc:	e1d320bc 	ldrh	r2, [r3, #12]
    a000:	e51b3010 	ldr	r3, [fp, #-16]
    a004:	e1d330be 	ldrh	r3, [r3, #14]
    a008:	e0423003 	sub	r3, r2, r3
    a00c:	e6ff3073 	uxth	r3, r3
    a010:	e2833001 	add	r3, r3, #1
    a014:	e6ff3073 	uxth	r3, r3
    a018:	e14b30ba 	strh	r3, [fp, #-10]
    a01c:	ea000007 	b	a040 <shellDeleteByte+0x290>
            shellWriteByte(shell, '\b');
    a020:	e3a01008 	mov	r1, #8
    a024:	e51b0010 	ldr	r0, [fp, #-16]
    a028:	ebfffae1 	bl	8bb4 <shellWriteByte>
        for (short i = shell->parser.length - shell->parser.cursor + 1; i > 0; i--) {
    a02c:	e15b30fa 	ldrsh	r3, [fp, #-10]
    a030:	e6ff3073 	uxth	r3, r3
    a034:	e2433001 	sub	r3, r3, #1
    a038:	e6ff3073 	uxth	r3, r3
    a03c:	e14b30ba 	strh	r3, [fp, #-10]
    a040:	e15b30fa 	ldrsh	r3, [fp, #-10]
    a044:	e3530000 	cmp	r3, #0
    a048:	cafffff4 	bgt	a020 <shellDeleteByte+0x270>
    a04c:	ea000000 	b	a054 <shellDeleteByte+0x2a4>
        return;
    a050:	e320f000 	nop	{0}
        }
    }
}
    a054:	e24bd004 	sub	sp, fp, #4
    a058:	e8bd8800 	pop	{fp, pc}

0000a05c <shellSplit>:
 * @param maxNum 最大分割数量
 *
 * @return int 分割得到的字串数量
 */
int shellSplit(char* string, unsigned short strLen, char* array[], char splitKey, short maxNum)
{
    a05c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    a060:	e28db000 	add	fp, sp, #0
    a064:	e24dd034 	sub	sp, sp, #52	; 0x34
    a068:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    a06c:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    a070:	e14b12ba 	strh	r1, [fp, #-42]	; 0xffffffd6
    a074:	e54b302b 	strb	r3, [fp, #-43]	; 0xffffffd5
    unsigned char record = 1;
    a078:	e3a03001 	mov	r3, #1
    a07c:	e54b3005 	strb	r3, [fp, #-5]
    unsigned char pairedLeft[16] = { 0 };
    a080:	e24b3024 	sub	r3, fp, #36	; 0x24
    a084:	e3a02000 	mov	r2, #0
    a088:	e5832000 	str	r2, [r3]
    a08c:	e5832004 	str	r2, [r3, #4]
    a090:	e5832008 	str	r2, [r3, #8]
    a094:	e583200c 	str	r2, [r3, #12]
    unsigned char pariedCount = 0;
    a098:	e3a03000 	mov	r3, #0
    a09c:	e54b3006 	strb	r3, [fp, #-6]
    int count = 0;
    a0a0:	e3a03000 	mov	r3, #0
    a0a4:	e50b300c 	str	r3, [fp, #-12]

    for (short i = 0; i < maxNum; i++) {
    a0a8:	e3a03000 	mov	r3, #0
    a0ac:	e14b30be 	strh	r3, [fp, #-14]
    a0b0:	ea00000a 	b	a0e0 <shellSplit+0x84>
        array[i] = NULL;
    a0b4:	e15b30fe 	ldrsh	r3, [fp, #-14]
    a0b8:	e1a03103 	lsl	r3, r3, #2
    a0bc:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    a0c0:	e0823003 	add	r3, r2, r3
    a0c4:	e3a02000 	mov	r2, #0
    a0c8:	e5832000 	str	r2, [r3]
    for (short i = 0; i < maxNum; i++) {
    a0cc:	e15b30fe 	ldrsh	r3, [fp, #-14]
    a0d0:	e6ff3073 	uxth	r3, r3
    a0d4:	e2833001 	add	r3, r3, #1
    a0d8:	e6ff3073 	uxth	r3, r3
    a0dc:	e14b30be 	strh	r3, [fp, #-14]
    a0e0:	e15b20fe 	ldrsh	r2, [fp, #-14]
    a0e4:	e1db30f4 	ldrsh	r3, [fp, #4]
    a0e8:	e1520003 	cmp	r2, r3
    a0ec:	bafffff0 	blt	a0b4 <shellSplit+0x58>
    }

    for (unsigned short i = 0; i < strLen; i++) {
    a0f0:	e3a03000 	mov	r3, #0
    a0f4:	e14b31b0 	strh	r3, [fp, #-16]
    a0f8:	ea000091 	b	a344 <shellSplit+0x2e8>
        if (pariedCount == 0) {
    a0fc:	e55b3006 	ldrb	r3, [fp, #-6]
    a100:	e3530000 	cmp	r3, #0
    a104:	1a000039 	bne	a1f0 <shellSplit+0x194>
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    a108:	e15b31b0 	ldrh	r3, [fp, #-16]
    a10c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a110:	e0823003 	add	r3, r2, r3
    a114:	e5d33000 	ldrb	r3, [r3]
    a118:	e55b202b 	ldrb	r2, [fp, #-43]	; 0xffffffd5
    a11c:	e1520003 	cmp	r2, r3
    a120:	0a000013 	beq	a174 <shellSplit+0x118>
    a124:	e55b3005 	ldrb	r3, [fp, #-5]
    a128:	e3530001 	cmp	r3, #1
    a12c:	1a000010 	bne	a174 <shellSplit+0x118>
    a130:	e1db20f4 	ldrsh	r2, [fp, #4]
    a134:	e51b300c 	ldr	r3, [fp, #-12]
    a138:	e1520003 	cmp	r2, r3
    a13c:	da00000c 	ble	a174 <shellSplit+0x118>
                array[count++] = &(string[i]);
    a140:	e51b300c 	ldr	r3, [fp, #-12]
    a144:	e2832001 	add	r2, r3, #1
    a148:	e50b200c 	str	r2, [fp, #-12]
    a14c:	e1a03103 	lsl	r3, r3, #2
    a150:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    a154:	e0823003 	add	r3, r2, r3
    a158:	e15b21b0 	ldrh	r2, [fp, #-16]
    a15c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    a160:	e0812002 	add	r2, r1, r2
    a164:	e5832000 	str	r2, [r3]
                record = 0;
    a168:	e3a03000 	mov	r3, #0
    a16c:	e54b3005 	strb	r3, [fp, #-5]
    a170:	ea00001e 	b	a1f0 <shellSplit+0x194>
            } else if ((string[i] == splitKey || string[i] == ' ') && record == 0) {
    a174:	e15b31b0 	ldrh	r3, [fp, #-16]
    a178:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a17c:	e0823003 	add	r3, r2, r3
    a180:	e5d33000 	ldrb	r3, [r3]
    a184:	e55b202b 	ldrb	r2, [fp, #-43]	; 0xffffffd5
    a188:	e1520003 	cmp	r2, r3
    a18c:	0a000005 	beq	a1a8 <shellSplit+0x14c>
    a190:	e15b31b0 	ldrh	r3, [fp, #-16]
    a194:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a198:	e0823003 	add	r3, r2, r3
    a19c:	e5d33000 	ldrb	r3, [r3]
    a1a0:	e3530020 	cmp	r3, #32
    a1a4:	1a000011 	bne	a1f0 <shellSplit+0x194>
    a1a8:	e55b3005 	ldrb	r3, [fp, #-5]
    a1ac:	e3530000 	cmp	r3, #0
    a1b0:	1a00000e 	bne	a1f0 <shellSplit+0x194>
                string[i] = 0;
    a1b4:	e15b31b0 	ldrh	r3, [fp, #-16]
    a1b8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a1bc:	e0823003 	add	r3, r2, r3
    a1c0:	e3a02000 	mov	r2, #0
    a1c4:	e5c32000 	strb	r2, [r3]
                if (string[i + 1] != ' ') {
    a1c8:	e15b31b0 	ldrh	r3, [fp, #-16]
    a1cc:	e2833001 	add	r3, r3, #1
    a1d0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a1d4:	e0823003 	add	r3, r2, r3
    a1d8:	e5d33000 	ldrb	r3, [r3]
    a1dc:	e3530020 	cmp	r3, #32
    a1e0:	0a000053 	beq	a334 <shellSplit+0x2d8>
                    record = 1;
    a1e4:	e3a03001 	mov	r3, #1
    a1e8:	e54b3005 	strb	r3, [fp, #-5]
                }
                continue;
    a1ec:	ea000050 	b	a334 <shellSplit+0x2d8>
            }
        }

        for (unsigned char j = 0; j < sizeof(pairedChars) / 2; j++) {
    a1f0:	e3a03000 	mov	r3, #0
    a1f4:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    a1f8:	ea000039 	b	a2e4 <shellSplit+0x288>
            if (pariedCount > 0
    a1fc:	e55b3006 	ldrb	r3, [fp, #-6]
    a200:	e3530000 	cmp	r3, #0
    a204:	0a00001a 	beq	a274 <shellSplit+0x218>
                && string[i] == pairedChars[j][1]
    a208:	e15b31b0 	ldrh	r3, [fp, #-16]
    a20c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a210:	e0823003 	add	r3, r2, r3
    a214:	e5d31000 	ldrb	r1, [r3]
    a218:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    a21c:	e3052208 	movw	r2, #21000	; 0x5208
    a220:	e3402001 	movt	r2, #1
    a224:	e1a03083 	lsl	r3, r3, #1
    a228:	e0823003 	add	r3, r2, r3
    a22c:	e5d33001 	ldrb	r3, [r3, #1]
    a230:	e1510003 	cmp	r1, r3
    a234:	1a00000e 	bne	a274 <shellSplit+0x218>
                && pairedLeft[pariedCount - 1] == pairedChars[j][0]) {
    a238:	e55b3006 	ldrb	r3, [fp, #-6]
    a23c:	e2433001 	sub	r3, r3, #1
    a240:	e24b2004 	sub	r2, fp, #4
    a244:	e0823003 	add	r3, r2, r3
    a248:	e5532020 	ldrb	r2, [r3, #-32]	; 0xffffffe0
    a24c:	e55b1011 	ldrb	r1, [fp, #-17]	; 0xffffffef
    a250:	e3053208 	movw	r3, #21000	; 0x5208
    a254:	e3403001 	movt	r3, #1
    a258:	e7d33081 	ldrb	r3, [r3, r1, lsl #1]
    a25c:	e1520003 	cmp	r2, r3
    a260:	1a000003 	bne	a274 <shellSplit+0x218>
                --pariedCount;
    a264:	e55b3006 	ldrb	r3, [fp, #-6]
    a268:	e2433001 	sub	r3, r3, #1
    a26c:	e54b3006 	strb	r3, [fp, #-6]
                break;
    a270:	ea00001e 	b	a2f0 <shellSplit+0x294>
            } else if (string[i] == pairedChars[j][0]) {
    a274:	e15b31b0 	ldrh	r3, [fp, #-16]
    a278:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a27c:	e0823003 	add	r3, r2, r3
    a280:	e5d32000 	ldrb	r2, [r3]
    a284:	e55b1011 	ldrb	r1, [fp, #-17]	; 0xffffffef
    a288:	e3053208 	movw	r3, #21000	; 0x5208
    a28c:	e3403001 	movt	r3, #1
    a290:	e7d33081 	ldrb	r3, [r3, r1, lsl #1]
    a294:	e1520003 	cmp	r2, r3
    a298:	1a00000e 	bne	a2d8 <shellSplit+0x27c>
                pairedLeft[pariedCount++] = pairedChars[j][0];
    a29c:	e55b3006 	ldrb	r3, [fp, #-6]
    a2a0:	e2832001 	add	r2, r3, #1
    a2a4:	e54b2006 	strb	r2, [fp, #-6]
    a2a8:	e1a01003 	mov	r1, r3
    a2ac:	e55b2011 	ldrb	r2, [fp, #-17]	; 0xffffffef
    a2b0:	e3053208 	movw	r3, #21000	; 0x5208
    a2b4:	e3403001 	movt	r3, #1
    a2b8:	e7d32082 	ldrb	r2, [r3, r2, lsl #1]
    a2bc:	e24b3004 	sub	r3, fp, #4
    a2c0:	e0833001 	add	r3, r3, r1
    a2c4:	e5432020 	strb	r2, [r3, #-32]	; 0xffffffe0
                pariedCount &= 0x0F;
    a2c8:	e55b3006 	ldrb	r3, [fp, #-6]
    a2cc:	e203300f 	and	r3, r3, #15
    a2d0:	e54b3006 	strb	r3, [fp, #-6]
                break;
    a2d4:	ea000005 	b	a2f0 <shellSplit+0x294>
        for (unsigned char j = 0; j < sizeof(pairedChars) / 2; j++) {
    a2d8:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    a2dc:	e2833001 	add	r3, r3, #1
    a2e0:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    a2e4:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    a2e8:	e3530000 	cmp	r3, #0
    a2ec:	0affffc2 	beq	a1fc <shellSplit+0x1a0>
            }
        }

        if (string[i] == '\\' && string[i + 1] != 0) {
    a2f0:	e15b31b0 	ldrh	r3, [fp, #-16]
    a2f4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a2f8:	e0823003 	add	r3, r2, r3
    a2fc:	e5d33000 	ldrb	r3, [r3]
    a300:	e353005c 	cmp	r3, #92	; 0x5c
    a304:	1a00000b 	bne	a338 <shellSplit+0x2dc>
    a308:	e15b31b0 	ldrh	r3, [fp, #-16]
    a30c:	e2833001 	add	r3, r3, #1
    a310:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a314:	e0823003 	add	r3, r2, r3
    a318:	e5d33000 	ldrb	r3, [r3]
    a31c:	e3530000 	cmp	r3, #0
    a320:	0a000004 	beq	a338 <shellSplit+0x2dc>
            i++;
    a324:	e15b31b0 	ldrh	r3, [fp, #-16]
    a328:	e2833001 	add	r3, r3, #1
    a32c:	e14b31b0 	strh	r3, [fp, #-16]
    a330:	ea000000 	b	a338 <shellSplit+0x2dc>
                continue;
    a334:	e320f000 	nop	{0}
    for (unsigned short i = 0; i < strLen; i++) {
    a338:	e15b31b0 	ldrh	r3, [fp, #-16]
    a33c:	e2833001 	add	r3, r3, #1
    a340:	e14b31b0 	strh	r3, [fp, #-16]
    a344:	e15b21b0 	ldrh	r2, [fp, #-16]
    a348:	e15b32ba 	ldrh	r3, [fp, #-42]	; 0xffffffd6
    a34c:	e1520003 	cmp	r2, r3
    a350:	3affff69 	bcc	a0fc <shellSplit+0xa0>
        }
    }
    return count;
    a354:	e51b300c 	ldr	r3, [fp, #-12]
}
    a358:	e1a00003 	mov	r0, r3
    a35c:	e28bd000 	add	sp, fp, #0
    a360:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    a364:	e12fff1e 	bx	lr

0000a368 <shellParserParam>:
 * @brief shell 解析参数
 *
 * @param shell shell对象
 */
static void shellParserParam(Shell* shell)
{
    a368:	e92d4800 	push	{fp, lr}
    a36c:	e28db004 	add	fp, sp, #4
    a370:	e24dd010 	sub	sp, sp, #16
    a374:	e50b0008 	str	r0, [fp, #-8]
    shell->parser.paramCount = shellSplit(shell->parser.buffer, shell->parser.length,
    a378:	e51b3008 	ldr	r3, [fp, #-8]
    a37c:	e5930010 	ldr	r0, [r3, #16]
    a380:	e51b3008 	ldr	r3, [fp, #-8]
    a384:	e1d310bc 	ldrh	r1, [r3, #12]
        shell->parser.param, ' ', SHELL_PARAMETER_MAX_NUMBER);
    a388:	e51b3008 	ldr	r3, [fp, #-8]
    a38c:	e2832014 	add	r2, r3, #20
    shell->parser.paramCount = shellSplit(shell->parser.buffer, shell->parser.length,
    a390:	e3a03008 	mov	r3, #8
    a394:	e58d3000 	str	r3, [sp]
    a398:	e3a03020 	mov	r3, #32
    a39c:	ebffff2e 	bl	a05c <shellSplit>
    a3a0:	e1a03000 	mov	r3, r0
    a3a4:	e6ff2073 	uxth	r2, r3
    a3a8:	e51b3008 	ldr	r3, [fp, #-8]
    a3ac:	e1c323b6 	strh	r2, [r3, #54]	; 0x36
}
    a3b0:	e320f000 	nop	{0}
    a3b4:	e24bd004 	sub	sp, fp, #4
    a3b8:	e8bd8800 	pop	{fp, pc}

0000a3bc <shellRemoveParamQuotes>:
 * @brief shell去除字符串参数头尾的双引号
 *
 * @param shell shell对象
 */
static void shellRemoveParamQuotes(Shell* shell)
{
    a3bc:	e92d4800 	push	{fp, lr}
    a3c0:	e28db004 	add	fp, sp, #4
    a3c4:	e24dd010 	sub	sp, sp, #16
    a3c8:	e50b0010 	str	r0, [fp, #-16]
    unsigned short paramLength;
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    a3cc:	e3a03000 	mov	r3, #0
    a3d0:	e14b30b6 	strh	r3, [fp, #-6]
    a3d4:	ea000041 	b	a4e0 <shellRemoveParamQuotes+0x124>
        if (shell->parser.param[i][0] == '\"') {
    a3d8:	e15b30b6 	ldrh	r3, [fp, #-6]
    a3dc:	e51b2010 	ldr	r2, [fp, #-16]
    a3e0:	e2833004 	add	r3, r3, #4
    a3e4:	e1a03103 	lsl	r3, r3, #2
    a3e8:	e0823003 	add	r3, r2, r3
    a3ec:	e5933004 	ldr	r3, [r3, #4]
    a3f0:	e5d33000 	ldrb	r3, [r3]
    a3f4:	e3530022 	cmp	r3, #34	; 0x22
    a3f8:	1a000014 	bne	a450 <shellRemoveParamQuotes+0x94>
            shell->parser.param[i][0] = 0;
    a3fc:	e15b30b6 	ldrh	r3, [fp, #-6]
    a400:	e51b2010 	ldr	r2, [fp, #-16]
    a404:	e2833004 	add	r3, r3, #4
    a408:	e1a03103 	lsl	r3, r3, #2
    a40c:	e0823003 	add	r3, r2, r3
    a410:	e5933004 	ldr	r3, [r3, #4]
    a414:	e3a02000 	mov	r2, #0
    a418:	e5c32000 	strb	r2, [r3]
            shell->parser.param[i] = &shell->parser.param[i][1];
    a41c:	e15b00b6 	ldrh	r0, [fp, #-6]
    a420:	e15b30b6 	ldrh	r3, [fp, #-6]
    a424:	e51b2010 	ldr	r2, [fp, #-16]
    a428:	e2833004 	add	r3, r3, #4
    a42c:	e1a03103 	lsl	r3, r3, #2
    a430:	e0823003 	add	r3, r2, r3
    a434:	e5933004 	ldr	r3, [r3, #4]
    a438:	e2832001 	add	r2, r3, #1
    a43c:	e51b1010 	ldr	r1, [fp, #-16]
    a440:	e2803004 	add	r3, r0, #4
    a444:	e1a03103 	lsl	r3, r3, #2
    a448:	e0813003 	add	r3, r1, r3
    a44c:	e5832004 	str	r2, [r3, #4]
        }
        paramLength = strlen(shell->parser.param[i]);
    a450:	e15b30b6 	ldrh	r3, [fp, #-6]
    a454:	e51b2010 	ldr	r2, [fp, #-16]
    a458:	e2833004 	add	r3, r3, #4
    a45c:	e1a03103 	lsl	r3, r3, #2
    a460:	e0823003 	add	r3, r2, r3
    a464:	e5933004 	ldr	r3, [r3, #4]
    a468:	e1a00003 	mov	r0, r3
    a46c:	eb001686 	bl	fe8c <strlen>
    a470:	e1a03000 	mov	r3, r0
    a474:	e14b30b8 	strh	r3, [fp, #-8]
        if (shell->parser.param[i][paramLength - 1] == '\"') {
    a478:	e15b30b6 	ldrh	r3, [fp, #-6]
    a47c:	e51b2010 	ldr	r2, [fp, #-16]
    a480:	e2833004 	add	r3, r3, #4
    a484:	e1a03103 	lsl	r3, r3, #2
    a488:	e0823003 	add	r3, r2, r3
    a48c:	e5932004 	ldr	r2, [r3, #4]
    a490:	e15b30b8 	ldrh	r3, [fp, #-8]
    a494:	e2433001 	sub	r3, r3, #1
    a498:	e0823003 	add	r3, r2, r3
    a49c:	e5d33000 	ldrb	r3, [r3]
    a4a0:	e3530022 	cmp	r3, #34	; 0x22
    a4a4:	1a00000a 	bne	a4d4 <shellRemoveParamQuotes+0x118>
            shell->parser.param[i][paramLength - 1] = 0;
    a4a8:	e15b30b6 	ldrh	r3, [fp, #-6]
    a4ac:	e51b2010 	ldr	r2, [fp, #-16]
    a4b0:	e2833004 	add	r3, r3, #4
    a4b4:	e1a03103 	lsl	r3, r3, #2
    a4b8:	e0823003 	add	r3, r2, r3
    a4bc:	e5932004 	ldr	r2, [r3, #4]
    a4c0:	e15b30b8 	ldrh	r3, [fp, #-8]
    a4c4:	e2433001 	sub	r3, r3, #1
    a4c8:	e0823003 	add	r3, r2, r3
    a4cc:	e3a02000 	mov	r2, #0
    a4d0:	e5c32000 	strb	r2, [r3]
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    a4d4:	e15b30b6 	ldrh	r3, [fp, #-6]
    a4d8:	e2833001 	add	r3, r3, #1
    a4dc:	e14b30b6 	strh	r3, [fp, #-6]
    a4e0:	e51b3010 	ldr	r3, [fp, #-16]
    a4e4:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
    a4e8:	e15b20b6 	ldrh	r2, [fp, #-6]
    a4ec:	e1520003 	cmp	r2, r3
    a4f0:	3affffb8 	bcc	a3d8 <shellRemoveParamQuotes+0x1c>
        }
    }
}
    a4f4:	e320f000 	nop	{0}
    a4f8:	e24bd004 	sub	sp, fp, #4
    a4fc:	e8bd8800 	pop	{fp, pc}

0000a500 <shellSeekCommand>:
 */
ShellCommand* shellSeekCommand(Shell* shell,
    const char* cmd,
    ShellCommand* base,
    unsigned short compareLength)
{
    a500:	e92d4800 	push	{fp, lr}
    a504:	e28db004 	add	fp, sp, #4
    a508:	e24dd018 	sub	sp, sp, #24
    a50c:	e50b0010 	str	r0, [fp, #-16]
    a510:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    a514:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    a518:	e14b31ba 	strh	r3, [fp, #-26]	; 0xffffffe6
    const char* name;
    unsigned short count = shell->commandList.count - ((size_t)base - (size_t)shell->commandList.base) / sizeof(ShellCommand);
    a51c:	e51b3010 	ldr	r3, [fp, #-16]
    a520:	e1d325bc 	ldrh	r2, [r3, #92]	; 0x5c
    a524:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a528:	e51b1010 	ldr	r1, [fp, #-16]
    a52c:	e5911058 	ldr	r1, [r1, #88]	; 0x58
    a530:	e0433001 	sub	r3, r3, r1
    a534:	e1a03223 	lsr	r3, r3, #4
    a538:	e6ff3073 	uxth	r3, r3
    a53c:	e0423003 	sub	r3, r2, r3
    a540:	e14b30b8 	strh	r3, [fp, #-8]
    for (unsigned short i = 0; i < count; i++) {
    a544:	e3a03000 	mov	r3, #0
    a548:	e14b30b6 	strh	r3, [fp, #-6]
    a54c:	ea000038 	b	a634 <shellSeekCommand+0x134>
        if (base[i].attr.attrs.type == SHELL_TYPE_KEY
    a550:	e15b30b6 	ldrh	r3, [fp, #-6]
    a554:	e1a03203 	lsl	r3, r3, #4
    a558:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a55c:	e0823003 	add	r3, r2, r3
    a560:	e5d33001 	ldrb	r3, [r3, #1]
    a564:	e203300f 	and	r3, r3, #15
    a568:	e6ef3073 	uxtb	r3, r3
    a56c:	e3530009 	cmp	r3, #9
    a570:	0a00002b 	beq	a624 <shellSeekCommand+0x124>
            || shellCheckPermission(shell, &base[i]) != 0) {
    a574:	e15b30b6 	ldrh	r3, [fp, #-6]
    a578:	e1a03203 	lsl	r3, r3, #4
    a57c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a580:	e0823003 	add	r3, r2, r3
    a584:	e1a01003 	mov	r1, r3
    a588:	e51b0010 	ldr	r0, [fp, #-16]
    a58c:	ebfffa30 	bl	8e54 <shellCheckPermission>
    a590:	e1a03000 	mov	r3, r0
    a594:	e3530000 	cmp	r3, #0
    a598:	1a000021 	bne	a624 <shellSeekCommand+0x124>
            continue;
        }
        name = shellGetCommandName(&base[i]);
    a59c:	e15b30b6 	ldrh	r3, [fp, #-6]
    a5a0:	e1a03203 	lsl	r3, r3, #4
    a5a4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a5a8:	e0823003 	add	r3, r2, r3
    a5ac:	e1a00003 	mov	r0, r3
    a5b0:	ebfffb28 	bl	9258 <shellGetCommandName>
    a5b4:	e50b000c 	str	r0, [fp, #-12]
        if (!compareLength) {
    a5b8:	e15b31ba 	ldrh	r3, [fp, #-26]	; 0xffffffe6
    a5bc:	e3530000 	cmp	r3, #0
    a5c0:	1a00000a 	bne	a5f0 <shellSeekCommand+0xf0>
            if (strcmp(cmd, name) == 0) {
    a5c4:	e51b100c 	ldr	r1, [fp, #-12]
    a5c8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    a5cc:	eb0015a5 	bl	fc68 <strcmp>
    a5d0:	e1a03000 	mov	r3, r0
    a5d4:	e3530000 	cmp	r3, #0
    a5d8:	1a000012 	bne	a628 <shellSeekCommand+0x128>
                return &base[i];
    a5dc:	e15b30b6 	ldrh	r3, [fp, #-6]
    a5e0:	e1a03203 	lsl	r3, r3, #4
    a5e4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a5e8:	e0823003 	add	r3, r2, r3
    a5ec:	ea000015 	b	a648 <shellSeekCommand+0x148>
            }
        } else {
            if (strncmp(cmd, name, compareLength) == 0) {
    a5f0:	e15b31ba 	ldrh	r3, [fp, #-26]	; 0xffffffe6
    a5f4:	e1a02003 	mov	r2, r3
    a5f8:	e51b100c 	ldr	r1, [fp, #-12]
    a5fc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    a600:	eb001639 	bl	feec <strncmp>
    a604:	e1a03000 	mov	r3, r0
    a608:	e3530000 	cmp	r3, #0
    a60c:	1a000005 	bne	a628 <shellSeekCommand+0x128>
                return &base[i];
    a610:	e15b30b6 	ldrh	r3, [fp, #-6]
    a614:	e1a03203 	lsl	r3, r3, #4
    a618:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a61c:	e0823003 	add	r3, r2, r3
    a620:	ea000008 	b	a648 <shellSeekCommand+0x148>
            continue;
    a624:	e320f000 	nop	{0}
    for (unsigned short i = 0; i < count; i++) {
    a628:	e15b30b6 	ldrh	r3, [fp, #-6]
    a62c:	e2833001 	add	r3, r3, #1
    a630:	e14b30b6 	strh	r3, [fp, #-6]
    a634:	e15b20b6 	ldrh	r2, [fp, #-6]
    a638:	e15b30b8 	ldrh	r3, [fp, #-8]
    a63c:	e1520003 	cmp	r2, r3
    a640:	3affffc2 	bcc	a550 <shellSeekCommand+0x50>
            }
        }
    }
    return NULL;
    a644:	e3a03000 	mov	r3, #0
}
    a648:	e1a00003 	mov	r0, r3
    a64c:	e24bd004 	sub	sp, fp, #4
    a650:	e8bd8800 	pop	{fp, pc}

0000a654 <shellGetVarValue>:
 * @param shell shell对象
 * @param command 命令
 * @return int 变量值
 */
int shellGetVarValue(Shell* shell, ShellCommand* command)
{
    a654:	e92d4800 	push	{fp, lr}
    a658:	e28db004 	add	fp, sp, #4
    a65c:	e24dd010 	sub	sp, sp, #16
    a660:	e50b0010 	str	r0, [fp, #-16]
    a664:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int value = 0;
    a668:	e3a03000 	mov	r3, #0
    a66c:	e50b3008 	str	r3, [fp, #-8]
    switch (command->attr.attrs.type) {
    a670:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a674:	e5d33001 	ldrb	r3, [r3, #1]
    a678:	e7e33053 	ubfx	r3, r3, #0, #4
    a67c:	e6ef3073 	uxtb	r3, r3
    a680:	e2433002 	sub	r3, r3, #2
    a684:	e3530005 	cmp	r3, #5
    a688:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    a68c:	ea00002a 	b	a73c <shellGetVarValue+0xe8>
    a690:	0000a6a8 	.word	0x0000a6a8
    a694:	0000a6bc 	.word	0x0000a6bc
    a698:	0000a6d0 	.word	0x0000a6d0
    a69c:	0000a6e4 	.word	0x0000a6e4
    a6a0:	0000a6e4 	.word	0x0000a6e4
    a6a4:	0000a6f4 	.word	0x0000a6f4
    case SHELL_TYPE_VAR_INT:
        value = *((int*)(command->data.var.value));
    a6a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6ac:	e5933008 	ldr	r3, [r3, #8]
    a6b0:	e5933000 	ldr	r3, [r3]
    a6b4:	e50b3008 	str	r3, [fp, #-8]
        break;
    a6b8:	ea000020 	b	a740 <shellGetVarValue+0xec>
    case SHELL_TYPE_VAR_SHORT:
        value = *((short*)(command->data.var.value));
    a6bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6c0:	e5933008 	ldr	r3, [r3, #8]
    a6c4:	e1d330f0 	ldrsh	r3, [r3]
    a6c8:	e50b3008 	str	r3, [fp, #-8]
        break;
    a6cc:	ea00001b 	b	a740 <shellGetVarValue+0xec>
    case SHELL_TYPE_VAR_CHAR:
        value = *((char*)(command->data.var.value));
    a6d0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6d4:	e5933008 	ldr	r3, [r3, #8]
    a6d8:	e5d33000 	ldrb	r3, [r3]
    a6dc:	e50b3008 	str	r3, [fp, #-8]
        break;
    a6e0:	ea000016 	b	a740 <shellGetVarValue+0xec>
    case SHELL_TYPE_VAR_STRING:
    case SHELL_TYPE_VAR_POINT:
        value = (size_t)(command->data.var.value);
    a6e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6e8:	e5933008 	ldr	r3, [r3, #8]
    a6ec:	e50b3008 	str	r3, [fp, #-8]
        break;
    a6f0:	ea000012 	b	a740 <shellGetVarValue+0xec>
    case SHELL_TYPE_VAR_NODE: {
        int (*func)(void*) = ((ShellNodeVarAttr*)command->data.var.value)->get;
    a6f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6f8:	e5933008 	ldr	r3, [r3, #8]
    a6fc:	e5933004 	ldr	r3, [r3, #4]
    a700:	e50b300c 	str	r3, [fp, #-12]
        value = func ? func(((ShellNodeVarAttr*)command->data.var.value)->var) : 0;
    a704:	e51b300c 	ldr	r3, [fp, #-12]
    a708:	e3530000 	cmp	r3, #0
    a70c:	0a000007 	beq	a730 <shellGetVarValue+0xdc>
    a710:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a714:	e5933008 	ldr	r3, [r3, #8]
    a718:	e5932000 	ldr	r2, [r3]
    a71c:	e51b300c 	ldr	r3, [fp, #-12]
    a720:	e1a00002 	mov	r0, r2
    a724:	e12fff33 	blx	r3
    a728:	e1a03000 	mov	r3, r0
    a72c:	ea000000 	b	a734 <shellGetVarValue+0xe0>
    a730:	e3a03000 	mov	r3, #0
    a734:	e50b3008 	str	r3, [fp, #-8]
        break;
    a738:	ea000000 	b	a740 <shellGetVarValue+0xec>
    }
    default:
        break;
    a73c:	e320f000 	nop	{0}
    }
    return value;
    a740:	e51b3008 	ldr	r3, [fp, #-8]
}
    a744:	e1a00003 	mov	r0, r3
    a748:	e24bd004 	sub	sp, fp, #4
    a74c:	e8bd8800 	pop	{fp, pc}

0000a750 <shellSetVarValue>:
 * @param command 命令
 * @param value 值
 * @return int 返回变量值
 */
int shellSetVarValue(Shell* shell, ShellCommand* command, int value)
{
    a750:	e92d4800 	push	{fp, lr}
    a754:	e28db004 	add	fp, sp, #4
    a758:	e24dd018 	sub	sp, sp, #24
    a75c:	e50b0010 	str	r0, [fp, #-16]
    a760:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    a764:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    if (command->attr.attrs.readOnly) {
    a768:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a76c:	e5d33001 	ldrb	r3, [r3, #1]
    a770:	e2033040 	and	r3, r3, #64	; 0x40
    a774:	e6ef3073 	uxtb	r3, r3
    a778:	e3530000 	cmp	r3, #0
    a77c:	0a000006 	beq	a79c <shellSetVarValue+0x4c>
        shellWriteString(shell, shellText[SHELL_TEXT_VAR_READ_ONLY_CANNOT_MODIFY]);
    a780:	e30531b8 	movw	r3, #20920	; 0x51b8
    a784:	e3403001 	movt	r3, #1
    a788:	e593301c 	ldr	r3, [r3, #28]
    a78c:	e1a01003 	mov	r1, r3
    a790:	e51b0010 	ldr	r0, [fp, #-16]
    a794:	ebfff915 	bl	8bf0 <shellWriteString>
    a798:	ea00004d 	b	a8d4 <shellSetVarValue+0x184>
    } else {
        switch (command->attr.attrs.type) {
    a79c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a7a0:	e5d33001 	ldrb	r3, [r3, #1]
    a7a4:	e7e33053 	ubfx	r3, r3, #0, #4
    a7a8:	e6ef3073 	uxtb	r3, r3
    a7ac:	e2433002 	sub	r3, r3, #2
    a7b0:	e3530005 	cmp	r3, #5
    a7b4:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    a7b8:	ea000042 	b	a8c8 <shellSetVarValue+0x178>
    a7bc:	0000a7d4 	.word	0x0000a7d4
    a7c0:	0000a7e8 	.word	0x0000a7e8
    a7c4:	0000a800 	.word	0x0000a800
    a7c8:	0000a818 	.word	0x0000a818
    a7cc:	0000a834 	.word	0x0000a834
    a7d0:	0000a850 	.word	0x0000a850
        case SHELL_TYPE_VAR_INT:
            *((int*)(command->data.var.value)) = value;
    a7d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a7d8:	e5933008 	ldr	r3, [r3, #8]
    a7dc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a7e0:	e5832000 	str	r2, [r3]
            break;
    a7e4:	ea00003a 	b	a8d4 <shellSetVarValue+0x184>
        case SHELL_TYPE_VAR_SHORT:
            *((short*)(command->data.var.value)) = value;
    a7e8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a7ec:	e5933008 	ldr	r3, [r3, #8]
    a7f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a7f4:	e6bf2072 	sxth	r2, r2
    a7f8:	e1c320b0 	strh	r2, [r3]
            break;
    a7fc:	ea000034 	b	a8d4 <shellSetVarValue+0x184>
        case SHELL_TYPE_VAR_CHAR:
            *((char*)(command->data.var.value)) = value;
    a800:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a804:	e5933008 	ldr	r3, [r3, #8]
    a808:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a80c:	e6ef2072 	uxtb	r2, r2
    a810:	e5c32000 	strb	r2, [r3]
            break;
    a814:	ea00002e 	b	a8d4 <shellSetVarValue+0x184>
        case SHELL_TYPE_VAR_STRING:
            shellStringCopy(((char*)(command->data.var.value)), (char*)(size_t)value);
    a818:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a81c:	e5933008 	ldr	r3, [r3, #8]
    a820:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    a824:	e1a01002 	mov	r1, r2
    a828:	e1a00003 	mov	r0, r3
    a82c:	ebfffa39 	bl	9118 <shellStringCopy>
            break;
    a830:	ea000027 	b	a8d4 <shellSetVarValue+0x184>
        case SHELL_TYPE_VAR_POINT:
            shellWriteString(shell, shellText[SHELL_TEXT_POINT_CANNOT_MODIFY]);
    a834:	e30531b8 	movw	r3, #20920	; 0x51b8
    a838:	e3403001 	movt	r3, #1
    a83c:	e5933018 	ldr	r3, [r3, #24]
    a840:	e1a01003 	mov	r1, r3
    a844:	e51b0010 	ldr	r0, [fp, #-16]
    a848:	ebfff8e8 	bl	8bf0 <shellWriteString>
            break;
    a84c:	ea000020 	b	a8d4 <shellSetVarValue+0x184>
        case SHELL_TYPE_VAR_NODE:
            if (((ShellNodeVarAttr*)command->data.var.value)->set) {
    a850:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a854:	e5933008 	ldr	r3, [r3, #8]
    a858:	e5933008 	ldr	r3, [r3, #8]
    a85c:	e3530000 	cmp	r3, #0
    a860:	0a00001a 	beq	a8d0 <shellSetVarValue+0x180>
                if (((ShellNodeVarAttr*)command->data.var.value)->var) {
    a864:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a868:	e5933008 	ldr	r3, [r3, #8]
    a86c:	e5933000 	ldr	r3, [r3]
    a870:	e3530000 	cmp	r3, #0
    a874:	0a00000b 	beq	a8a8 <shellSetVarValue+0x158>
                    int (*func)(void*, int) = ((ShellNodeVarAttr*)command->data.var.value)->set;
    a878:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a87c:	e5933008 	ldr	r3, [r3, #8]
    a880:	e5933008 	ldr	r3, [r3, #8]
    a884:	e50b3008 	str	r3, [fp, #-8]
                    func(((ShellNodeVarAttr*)command->data.var.value)->var, value);
    a888:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a88c:	e5933008 	ldr	r3, [r3, #8]
    a890:	e5932000 	ldr	r2, [r3]
    a894:	e51b3008 	ldr	r3, [fp, #-8]
    a898:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    a89c:	e1a00002 	mov	r0, r2
    a8a0:	e12fff33 	blx	r3
                } else {
                    int (*func)(int) = ((ShellNodeVarAttr*)command->data.var.value)->set;
                    func(value);
                }
            }
            break;
    a8a4:	ea000009 	b	a8d0 <shellSetVarValue+0x180>
                    int (*func)(int) = ((ShellNodeVarAttr*)command->data.var.value)->set;
    a8a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a8ac:	e5933008 	ldr	r3, [r3, #8]
    a8b0:	e5933008 	ldr	r3, [r3, #8]
    a8b4:	e50b300c 	str	r3, [fp, #-12]
                    func(value);
    a8b8:	e51b300c 	ldr	r3, [fp, #-12]
    a8bc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    a8c0:	e12fff33 	blx	r3
            break;
    a8c4:	ea000001 	b	a8d0 <shellSetVarValue+0x180>
        default:
            break;
    a8c8:	e320f000 	nop	{0}
    a8cc:	ea000000 	b	a8d4 <shellSetVarValue+0x184>
            break;
    a8d0:	e320f000 	nop	{0}
        }
    }
    return shellShowVar(shell, command);
    a8d4:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    a8d8:	e51b0010 	ldr	r0, [fp, #-16]
    a8dc:	eb000003 	bl	a8f0 <shellShowVar>
    a8e0:	e1a03000 	mov	r3, r0
}
    a8e4:	e1a00003 	mov	r0, r3
    a8e8:	e24bd004 	sub	sp, fp, #4
    a8ec:	e8bd8800 	pop	{fp, pc}

0000a8f0 <shellShowVar>:
 * @param shell shell对象
 * @param command 命令
 * @return int 返回变量值
 */
static int shellShowVar(Shell* shell, ShellCommand* command)
{
    a8f0:	e92d4800 	push	{fp, lr}
    a8f4:	e28db004 	add	fp, sp, #4
    a8f8:	e24dd020 	sub	sp, sp, #32
    a8fc:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    a900:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    char buffer[12] = "00000000000";
    a904:	e3043d00 	movw	r3, #19712	; 0x4d00
    a908:	e3403001 	movt	r3, #1
    a90c:	e24bc018 	sub	ip, fp, #24
    a910:	e8930007 	ldm	r3, {r0, r1, r2}
    a914:	e88c0007 	stm	ip, {r0, r1, r2}
    int value = shellGetVarValue(shell, command);
    a918:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    a91c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a920:	ebffff4b 	bl	a654 <shellGetVarValue>
    a924:	e50b000c 	str	r0, [fp, #-12]

    shellWriteString(shell, command->data.var.name);
    a928:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    a92c:	e5933004 	ldr	r3, [r3, #4]
    a930:	e1a01003 	mov	r1, r3
    a934:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a938:	ebfff8ac 	bl	8bf0 <shellWriteString>
    shellWriteString(shell, " = ");
    a93c:	e3041cf0 	movw	r1, #19696	; 0x4cf0
    a940:	e3401001 	movt	r1, #1
    a944:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a948:	ebfff8a8 	bl	8bf0 <shellWriteString>

    switch (command->attr.attrs.type) {
    a94c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    a950:	e5d33001 	ldrb	r3, [r3, #1]
    a954:	e7e33053 	ubfx	r3, r3, #0, #4
    a958:	e6ef3073 	uxtb	r3, r3
    a95c:	e3530005 	cmp	r3, #5
    a960:	1a00000c 	bne	a998 <shellShowVar+0xa8>
    case SHELL_TYPE_VAR_STRING:
        shellWriteString(shell, "\"");
    a964:	e3041cf4 	movw	r1, #19700	; 0x4cf4
    a968:	e3401001 	movt	r1, #1
    a96c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a970:	ebfff89e 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, (char*)(size_t)value);
    a974:	e51b300c 	ldr	r3, [fp, #-12]
    a978:	e1a01003 	mov	r1, r3
    a97c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a980:	ebfff89a 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, "\"");
    a984:	e3041cf4 	movw	r1, #19700	; 0x4cf4
    a988:	e3401001 	movt	r1, #1
    a98c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a990:	ebfff896 	bl	8bf0 <shellWriteString>
        break;
    a994:	ea000028 	b	aa3c <shellShowVar+0x14c>
    // case SHELL_TYPE_VAR_INT:
    // case SHELL_TYPE_VAR_SHORT:
    // case SHELL_TYPE_VAR_CHAR:
    // case SHELL_TYPE_VAR_POINT:
    default:
        shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    a998:	e24b3018 	sub	r3, fp, #24
    a99c:	e1a01003 	mov	r1, r3
    a9a0:	e51b000c 	ldr	r0, [fp, #-12]
    a9a4:	ebfff988 	bl	8fcc <shellToDec>
    a9a8:	e1a03000 	mov	r3, r0
    a9ac:	e263300b 	rsb	r3, r3, #11
    a9b0:	e24b2018 	sub	r2, fp, #24
    a9b4:	e0823003 	add	r3, r2, r3
    a9b8:	e1a01003 	mov	r1, r3
    a9bc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a9c0:	ebfff88a 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, ", 0x");
    a9c4:	e3041cf8 	movw	r1, #19704	; 0x4cf8
    a9c8:	e3401001 	movt	r1, #1
    a9cc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a9d0:	ebfff886 	bl	8bf0 <shellWriteString>
        for (short i = 0; i < 11; i++) {
    a9d4:	e3a03000 	mov	r3, #0
    a9d8:	e14b30b6 	strh	r3, [fp, #-6]
    a9dc:	ea000009 	b	aa08 <shellShowVar+0x118>
            buffer[i] = '0';
    a9e0:	e15b30f6 	ldrsh	r3, [fp, #-6]
    a9e4:	e24b2004 	sub	r2, fp, #4
    a9e8:	e0823003 	add	r3, r2, r3
    a9ec:	e3a02030 	mov	r2, #48	; 0x30
    a9f0:	e5432014 	strb	r2, [r3, #-20]	; 0xffffffec
        for (short i = 0; i < 11; i++) {
    a9f4:	e15b30f6 	ldrsh	r3, [fp, #-6]
    a9f8:	e6ff3073 	uxth	r3, r3
    a9fc:	e2833001 	add	r3, r3, #1
    aa00:	e6ff3073 	uxth	r3, r3
    aa04:	e14b30b6 	strh	r3, [fp, #-6]
    aa08:	e15b30f6 	ldrsh	r3, [fp, #-6]
    aa0c:	e353000a 	cmp	r3, #10
    aa10:	dafffff2 	ble	a9e0 <shellShowVar+0xf0>
        }
        shellToHex(value, buffer);
    aa14:	e51b300c 	ldr	r3, [fp, #-12]
    aa18:	e24b2018 	sub	r2, fp, #24
    aa1c:	e1a01002 	mov	r1, r2
    aa20:	e1a00003 	mov	r0, r3
    aa24:	ebfff939 	bl	8f10 <shellToHex>
        shellWriteString(shell, buffer);
    aa28:	e24b3018 	sub	r3, fp, #24
    aa2c:	e1a01003 	mov	r1, r3
    aa30:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    aa34:	ebfff86d 	bl	8bf0 <shellWriteString>
        break;
    aa38:	e320f000 	nop	{0}
    }

    shellWriteString(shell, "\r\n");
    aa3c:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    aa40:	e3401001 	movt	r1, #1
    aa44:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    aa48:	ebfff868 	bl	8bf0 <shellWriteString>
    return value;
    aa4c:	e51b300c 	ldr	r3, [fp, #-12]
}
    aa50:	e1a00003 	mov	r0, r3
    aa54:	e24bd004 	sub	sp, fp, #4
    aa58:	e8bd8800 	pop	{fp, pc}

0000aa5c <shellSetVar>:
 * @param name 变量名
 * @param value 变量值
 * @return int 返回变量值
 */
int shellSetVar(char* name, int value)
{
    aa5c:	e92d4800 	push	{fp, lr}
    aa60:	e28db004 	add	fp, sp, #4
    aa64:	e24dd010 	sub	sp, sp, #16
    aa68:	e50b0010 	str	r0, [fp, #-16]
    aa6c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    Shell* shell = shellGetCurrent();
    aa70:	ebfff828 	bl	8b18 <shellGetCurrent>
    aa74:	e50b0008 	str	r0, [fp, #-8]
    if (shell == NULL) {
    aa78:	e51b3008 	ldr	r3, [fp, #-8]
    aa7c:	e3530000 	cmp	r3, #0
    aa80:	1a000001 	bne	aa8c <shellSetVar+0x30>
        return 0;
    aa84:	e3a03000 	mov	r3, #0
    aa88:	ea00002d 	b	ab44 <shellSetVar+0xe8>
    }
    ShellCommand* command = shellSeekCommand(shell,
        name,
        shell->commandList.base,
    aa8c:	e51b3008 	ldr	r3, [fp, #-8]
    aa90:	e5932058 	ldr	r2, [r3, #88]	; 0x58
    ShellCommand* command = shellSeekCommand(shell,
    aa94:	e3a03000 	mov	r3, #0
    aa98:	e51b1010 	ldr	r1, [fp, #-16]
    aa9c:	e51b0008 	ldr	r0, [fp, #-8]
    aaa0:	ebfffe96 	bl	a500 <shellSeekCommand>
    aaa4:	e50b000c 	str	r0, [fp, #-12]
        0);
    if (!command) {
    aaa8:	e51b300c 	ldr	r3, [fp, #-12]
    aaac:	e3530000 	cmp	r3, #0
    aab0:	1a000007 	bne	aad4 <shellSetVar+0x78>
        shellWriteString(shell, shellText[SHELL_TEXT_VAR_NOT_FOUND]);
    aab4:	e30531b8 	movw	r3, #20920	; 0x51b8
    aab8:	e3403001 	movt	r3, #1
    aabc:	e5933024 	ldr	r3, [r3, #36]	; 0x24
    aac0:	e1a01003 	mov	r1, r3
    aac4:	e51b0008 	ldr	r0, [fp, #-8]
    aac8:	ebfff848 	bl	8bf0 <shellWriteString>
        return 0;
    aacc:	e3a03000 	mov	r3, #0
    aad0:	ea00001b 	b	ab44 <shellSetVar+0xe8>
    }
    if (command->attr.attrs.type < SHELL_TYPE_VAR_INT
    aad4:	e51b300c 	ldr	r3, [fp, #-12]
    aad8:	e5d33001 	ldrb	r3, [r3, #1]
    aadc:	e7e33053 	ubfx	r3, r3, #0, #4
    aae0:	e6ef3073 	uxtb	r3, r3
    aae4:	e3530001 	cmp	r3, #1
    aae8:	da000005 	ble	ab04 <shellSetVar+0xa8>
        || command->attr.attrs.type > SHELL_TYPE_VAR_NODE) {
    aaec:	e51b300c 	ldr	r3, [fp, #-12]
    aaf0:	e5d33001 	ldrb	r3, [r3, #1]
    aaf4:	e7e33053 	ubfx	r3, r3, #0, #4
    aaf8:	e6ef3073 	uxtb	r3, r3
    aafc:	e3530007 	cmp	r3, #7
    ab00:	da00000a 	ble	ab30 <shellSetVar+0xd4>
        shellWriteString(shell, name);
    ab04:	e51b1010 	ldr	r1, [fp, #-16]
    ab08:	e51b0008 	ldr	r0, [fp, #-8]
    ab0c:	ebfff837 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, shellText[SHELL_TEXT_NOT_VAR]);
    ab10:	e30531b8 	movw	r3, #20920	; 0x51b8
    ab14:	e3403001 	movt	r3, #1
    ab18:	e5933020 	ldr	r3, [r3, #32]
    ab1c:	e1a01003 	mov	r1, r3
    ab20:	e51b0008 	ldr	r0, [fp, #-8]
    ab24:	ebfff831 	bl	8bf0 <shellWriteString>
        return 0;
    ab28:	e3a03000 	mov	r3, #0
    ab2c:	ea000004 	b	ab44 <shellSetVar+0xe8>
    }
    return shellSetVarValue(shell, command, value);
    ab30:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    ab34:	e51b100c 	ldr	r1, [fp, #-12]
    ab38:	e51b0008 	ldr	r0, [fp, #-8]
    ab3c:	ebffff03 	bl	a750 <shellSetVarValue>
    ab40:	e1a03000 	mov	r3, r0
}
    ab44:	e1a00003 	mov	r0, r3
    ab48:	e24bd004 	sub	sp, fp, #4
    ab4c:	e8bd8800 	pop	{fp, pc}

0000ab50 <shellRunCommand>:
 * @param command 命令
 *
 * @return unsigned int 命令返回值
 */
unsigned int shellRunCommand(Shell* shell, ShellCommand* command)
{
    ab50:	e92d4800 	push	{fp, lr}
    ab54:	e28db004 	add	fp, sp, #4
    ab58:	e24dd010 	sub	sp, sp, #16
    ab5c:	e50b0010 	str	r0, [fp, #-16]
    ab60:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    int returnValue = 0;
    ab64:	e3a03000 	mov	r3, #0
    ab68:	e50b3008 	str	r3, [fp, #-8]
    shell->status.isActive = 1;
    ab6c:	e51b2010 	ldr	r2, [fp, #-16]
    ab70:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    ab74:	e3833002 	orr	r3, r3, #2
    ab78:	e5c23060 	strb	r3, [r2, #96]	; 0x60
    if (command->attr.attrs.type == SHELL_TYPE_CMD_MAIN) {
    ab7c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ab80:	e5d33001 	ldrb	r3, [r3, #1]
    ab84:	e203300f 	and	r3, r3, #15
    ab88:	e6ef3073 	uxtb	r3, r3
    ab8c:	e3530000 	cmp	r3, #0
    ab90:	1a000017 	bne	abf4 <shellRunCommand+0xa4>
        shellRemoveParamQuotes(shell);
    ab94:	e51b0010 	ldr	r0, [fp, #-16]
    ab98:	ebfffe07 	bl	a3bc <shellRemoveParamQuotes>
        int (*func)(int, char**) = command->data.cmd.function;
    ab9c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aba0:	e5933008 	ldr	r3, [r3, #8]
    aba4:	e50b300c 	str	r3, [fp, #-12]
        returnValue = func(shell->parser.paramCount, shell->parser.param);
    aba8:	e51b3010 	ldr	r3, [fp, #-16]
    abac:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
    abb0:	e1a00003 	mov	r0, r3
    abb4:	e51b3010 	ldr	r3, [fp, #-16]
    abb8:	e2832014 	add	r2, r3, #20
    abbc:	e51b300c 	ldr	r3, [fp, #-12]
    abc0:	e1a01002 	mov	r1, r2
    abc4:	e12fff33 	blx	r3
    abc8:	e50b0008 	str	r0, [fp, #-8]
        if (!command->attr.attrs.disableReturn) {
    abcc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    abd0:	e5d33001 	ldrb	r3, [r3, #1]
    abd4:	e2033020 	and	r3, r3, #32
    abd8:	e6ef3073 	uxtb	r3, r3
    abdc:	e3530000 	cmp	r3, #0
    abe0:	1a000035 	bne	acbc <shellRunCommand+0x16c>
            shellWriteReturnValue(shell, returnValue);
    abe4:	e51b1008 	ldr	r1, [fp, #-8]
    abe8:	e51b0010 	ldr	r0, [fp, #-16]
    abec:	eb00008b 	bl	ae20 <shellWriteReturnValue>
    abf0:	ea000031 	b	acbc <shellRunCommand+0x16c>
        }
    } else if (command->attr.attrs.type == SHELL_TYPE_CMD_FUNC) {
    abf4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    abf8:	e5d33001 	ldrb	r3, [r3, #1]
    abfc:	e203300f 	and	r3, r3, #15
    ac00:	e6ef3073 	uxtb	r3, r3
    ac04:	e3530001 	cmp	r3, #1
    ac08:	1a000012 	bne	ac58 <shellRunCommand+0x108>
        returnValue = shellExtRun(shell,
            command,
            shell->parser.paramCount,
    ac0c:	e51b3010 	ldr	r3, [fp, #-16]
    ac10:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
        returnValue = shellExtRun(shell,
    ac14:	e1a02003 	mov	r2, r3
            shell->parser.param);
    ac18:	e51b3010 	ldr	r3, [fp, #-16]
    ac1c:	e2833014 	add	r3, r3, #20
        returnValue = shellExtRun(shell,
    ac20:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    ac24:	e51b0010 	ldr	r0, [fp, #-16]
    ac28:	eb0006da 	bl	c798 <shellExtRun>
    ac2c:	e50b0008 	str	r0, [fp, #-8]
        if (!command->attr.attrs.disableReturn) {
    ac30:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ac34:	e5d33001 	ldrb	r3, [r3, #1]
    ac38:	e2033020 	and	r3, r3, #32
    ac3c:	e6ef3073 	uxtb	r3, r3
    ac40:	e3530000 	cmp	r3, #0
    ac44:	1a00001c 	bne	acbc <shellRunCommand+0x16c>
            shellWriteReturnValue(shell, returnValue);
    ac48:	e51b1008 	ldr	r1, [fp, #-8]
    ac4c:	e51b0010 	ldr	r0, [fp, #-16]
    ac50:	eb000072 	bl	ae20 <shellWriteReturnValue>
    ac54:	ea000018 	b	acbc <shellRunCommand+0x16c>
        }
    } else if (command->attr.attrs.type >= SHELL_TYPE_VAR_INT
    ac58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ac5c:	e5d33001 	ldrb	r3, [r3, #1]
    ac60:	e7e33053 	ubfx	r3, r3, #0, #4
    ac64:	e6ef3073 	uxtb	r3, r3
    ac68:	e3530001 	cmp	r3, #1
    ac6c:	da000009 	ble	ac98 <shellRunCommand+0x148>
        && command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    ac70:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ac74:	e5d33001 	ldrb	r3, [r3, #1]
    ac78:	e7e33053 	ubfx	r3, r3, #0, #4
    ac7c:	e6ef3073 	uxtb	r3, r3
    ac80:	e3530007 	cmp	r3, #7
    ac84:	ca000003 	bgt	ac98 <shellRunCommand+0x148>
        shellShowVar(shell, command);
    ac88:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    ac8c:	e51b0010 	ldr	r0, [fp, #-16]
    ac90:	ebffff16 	bl	a8f0 <shellShowVar>
    ac94:	ea000008 	b	acbc <shellRunCommand+0x16c>
    } else if (command->attr.attrs.type == SHELL_TYPE_USER) {
    ac98:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ac9c:	e5d33001 	ldrb	r3, [r3, #1]
    aca0:	e203300f 	and	r3, r3, #15
    aca4:	e6ef3073 	uxtb	r3, r3
    aca8:	e3530008 	cmp	r3, #8
    acac:	1a000002 	bne	acbc <shellRunCommand+0x16c>
        shellSetUser(shell, command);
    acb0:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    acb4:	e51b0010 	ldr	r0, [fp, #-16]
    acb8:	eb00002a 	bl	ad68 <shellSetUser>
    }
    shell->status.isActive = 0;
    acbc:	e51b2010 	ldr	r2, [fp, #-16]
    acc0:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    acc4:	e7c1309f 	bfc	r3, #1, #1
    acc8:	e5c23060 	strb	r3, [r2, #96]	; 0x60

    return returnValue;
    accc:	e51b3008 	ldr	r3, [fp, #-8]
}
    acd0:	e1a00003 	mov	r0, r3
    acd4:	e24bd004 	sub	sp, fp, #4
    acd8:	e8bd8800 	pop	{fp, pc}

0000acdc <shellCheckPassword>:
 * @brief shell校验密码
 *
 * @param shell shell对象
 */
static void shellCheckPassword(Shell* shell)
{
    acdc:	e92d4800 	push	{fp, lr}
    ace0:	e28db004 	add	fp, sp, #4
    ace4:	e24dd008 	sub	sp, sp, #8
    ace8:	e50b0008 	str	r0, [fp, #-8]
    if (strcmp(shell->parser.buffer, shell->info.user->data.user.password) == 0) {
    acec:	e51b3008 	ldr	r3, [fp, #-8]
    acf0:	e5932010 	ldr	r2, [r3, #16]
    acf4:	e51b3008 	ldr	r3, [fp, #-8]
    acf8:	e5933000 	ldr	r3, [r3]
    acfc:	e5933008 	ldr	r3, [r3, #8]
    ad00:	e1a01003 	mov	r1, r3
    ad04:	e1a00002 	mov	r0, r2
    ad08:	eb0013d6 	bl	fc68 <strcmp>
    ad0c:	e1a03000 	mov	r3, r0
    ad10:	e3530000 	cmp	r3, #0
    ad14:	1a000004 	bne	ad2c <shellCheckPassword+0x50>
        shell->status.isChecked = 1;
    ad18:	e51b2008 	ldr	r2, [fp, #-8]
    ad1c:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    ad20:	e3833001 	orr	r3, r3, #1
    ad24:	e5c23060 	strb	r3, [r2, #96]	; 0x60
    ad28:	ea000005 	b	ad44 <shellCheckPassword+0x68>
#if SHELL_SHOW_INFO == 1
        shellWriteString(shell, shellText[SHELL_TEXT_INFO]);
#endif
    } else {
        shellWriteString(shell, shellText[SHELL_TEXT_PASSWORD_ERROR]);
    ad2c:	e30531b8 	movw	r3, #20920	; 0x51b8
    ad30:	e3403001 	movt	r3, #1
    ad34:	e5933030 	ldr	r3, [r3, #48]	; 0x30
    ad38:	e1a01003 	mov	r1, r3
    ad3c:	e51b0008 	ldr	r0, [fp, #-8]
    ad40:	ebfff7aa 	bl	8bf0 <shellWriteString>
    }
    shell->parser.length = 0;
    ad44:	e51b3008 	ldr	r3, [fp, #-8]
    ad48:	e3a02000 	mov	r2, #0
    ad4c:	e1c320bc 	strh	r2, [r3, #12]
    shell->parser.cursor = 0;
    ad50:	e51b3008 	ldr	r3, [fp, #-8]
    ad54:	e3a02000 	mov	r2, #0
    ad58:	e1c320be 	strh	r2, [r3, #14]
}
    ad5c:	e320f000 	nop	{0}
    ad60:	e24bd004 	sub	sp, fp, #4
    ad64:	e8bd8800 	pop	{fp, pc}

0000ad68 <shellSetUser>:
 *
 * @param shell shell对象
 * @param user 用户
 */
void shellSetUser(Shell* shell, const ShellCommand* user)
{
    ad68:	e92d4800 	push	{fp, lr}
    ad6c:	e28db004 	add	fp, sp, #4
    ad70:	e24dd008 	sub	sp, sp, #8
    ad74:	e50b0008 	str	r0, [fp, #-8]
    ad78:	e50b100c 	str	r1, [fp, #-12]
    shell->info.user = user;
    ad7c:	e51b3008 	ldr	r3, [fp, #-8]
    ad80:	e51b200c 	ldr	r2, [fp, #-12]
    ad84:	e5832000 	str	r2, [r3]
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    ad88:	e51b300c 	ldr	r3, [fp, #-12]
    ad8c:	e5933008 	ldr	r3, [r3, #8]
                                  && (shell->parser.paramCount < 2
                                      || strcmp(user->data.user.password, shell->parser.param[1]) != 0))
        ? 0
        : 1;
    ad90:	e3530000 	cmp	r3, #0
    ad94:	0a000014 	beq	adec <shellSetUser+0x84>
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    ad98:	e51b300c 	ldr	r3, [fp, #-12]
    ad9c:	e5933008 	ldr	r3, [r3, #8]
    ada0:	e1a00003 	mov	r0, r3
    ada4:	eb001438 	bl	fe8c <strlen>
    ada8:	e1a03000 	mov	r3, r0
    adac:	e3530000 	cmp	r3, #0
    adb0:	0a00000d 	beq	adec <shellSetUser+0x84>
                                  && (shell->parser.paramCount < 2
    adb4:	e51b3008 	ldr	r3, [fp, #-8]
    adb8:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
        : 1;
    adbc:	e3530001 	cmp	r3, #1
    adc0:	9a00000b 	bls	adf4 <shellSetUser+0x8c>
                                      || strcmp(user->data.user.password, shell->parser.param[1]) != 0))
    adc4:	e51b300c 	ldr	r3, [fp, #-12]
    adc8:	e5932008 	ldr	r2, [r3, #8]
    adcc:	e51b3008 	ldr	r3, [fp, #-8]
    add0:	e5933018 	ldr	r3, [r3, #24]
    add4:	e1a01003 	mov	r1, r3
    add8:	e1a00002 	mov	r0, r2
    addc:	eb0013a1 	bl	fc68 <strcmp>
    ade0:	e1a03000 	mov	r3, r0
    ade4:	e3530000 	cmp	r3, #0
    ade8:	1a000001 	bne	adf4 <shellSetUser+0x8c>
        : 1;
    adec:	e3a03001 	mov	r3, #1
    adf0:	ea000000 	b	adf8 <shellSetUser+0x90>
    adf4:	e3a03000 	mov	r3, #0
    adf8:	e6ef3073 	uxtb	r3, r3
    adfc:	e2033001 	and	r3, r3, #1
    ae00:	e6ef1073 	uxtb	r1, r3
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    ae04:	e51b2008 	ldr	r2, [fp, #-8]
    ae08:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    ae0c:	e7c03011 	bfi	r3, r1, #0, #1
    ae10:	e5c23060 	strb	r3, [r2, #96]	; 0x60
#if SHELL_SHOW_INFO == 1
    if (shell->status.isChecked) {
        shellWriteString(shell, shellText[SHELL_TEXT_INFO]);
    }
#endif
}
    ae14:	e320f000 	nop	{0}
    ae18:	e24bd004 	sub	sp, fp, #4
    ae1c:	e8bd8800 	pop	{fp, pc}

0000ae20 <shellWriteReturnValue>:
 *
 * @param shell shell对象
 * @param value 返回值
 */
static void shellWriteReturnValue(Shell* shell, int value)
{
    ae20:	e92d4800 	push	{fp, lr}
    ae24:	e28db004 	add	fp, sp, #4
    ae28:	e24dd018 	sub	sp, sp, #24
    ae2c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    ae30:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    char buffer[12] = "00000000000";
    ae34:	e3043d00 	movw	r3, #19712	; 0x4d00
    ae38:	e3403001 	movt	r3, #1
    ae3c:	e24bc014 	sub	ip, fp, #20
    ae40:	e8930007 	ldm	r3, {r0, r1, r2}
    ae44:	e88c0007 	stm	ip, {r0, r1, r2}
    shellWriteString(shell, "Return: ");
    ae48:	e3041d0c 	movw	r1, #19724	; 0x4d0c
    ae4c:	e3401001 	movt	r1, #1
    ae50:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    ae54:	ebfff765 	bl	8bf0 <shellWriteString>
    shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    ae58:	e24b3014 	sub	r3, fp, #20
    ae5c:	e1a01003 	mov	r1, r3
    ae60:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    ae64:	ebfff858 	bl	8fcc <shellToDec>
    ae68:	e1a03000 	mov	r3, r0
    ae6c:	e263300b 	rsb	r3, r3, #11
    ae70:	e24b2014 	sub	r2, fp, #20
    ae74:	e0823003 	add	r3, r2, r3
    ae78:	e1a01003 	mov	r1, r3
    ae7c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    ae80:	ebfff75a 	bl	8bf0 <shellWriteString>
    shellWriteString(shell, ", 0x");
    ae84:	e3041cf8 	movw	r1, #19704	; 0x4cf8
    ae88:	e3401001 	movt	r1, #1
    ae8c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    ae90:	ebfff756 	bl	8bf0 <shellWriteString>
    for (short i = 0; i < 11; i++) {
    ae94:	e3a03000 	mov	r3, #0
    ae98:	e14b30b6 	strh	r3, [fp, #-6]
    ae9c:	ea000009 	b	aec8 <shellWriteReturnValue+0xa8>
        buffer[i] = '0';
    aea0:	e15b30f6 	ldrsh	r3, [fp, #-6]
    aea4:	e24b2004 	sub	r2, fp, #4
    aea8:	e0823003 	add	r3, r2, r3
    aeac:	e3a02030 	mov	r2, #48	; 0x30
    aeb0:	e5432010 	strb	r2, [r3, #-16]
    for (short i = 0; i < 11; i++) {
    aeb4:	e15b30f6 	ldrsh	r3, [fp, #-6]
    aeb8:	e6ff3073 	uxth	r3, r3
    aebc:	e2833001 	add	r3, r3, #1
    aec0:	e6ff3073 	uxth	r3, r3
    aec4:	e14b30b6 	strh	r3, [fp, #-6]
    aec8:	e15b30f6 	ldrsh	r3, [fp, #-6]
    aecc:	e353000a 	cmp	r3, #10
    aed0:	dafffff2 	ble	aea0 <shellWriteReturnValue+0x80>
    }
    shellToHex(value, buffer);
    aed4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    aed8:	e24b2014 	sub	r2, fp, #20
    aedc:	e1a01002 	mov	r1, r2
    aee0:	e1a00003 	mov	r0, r3
    aee4:	ebfff809 	bl	8f10 <shellToHex>
    shellWriteString(shell, buffer);
    aee8:	e24b3014 	sub	r3, fp, #20
    aeec:	e1a01003 	mov	r1, r3
    aef0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    aef4:	ebfff73d 	bl	8bf0 <shellWriteString>
    shellWriteString(shell, "\r\n");
    aef8:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    aefc:	e3401001 	movt	r1, #1
    af00:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    af04:	ebfff739 	bl	8bf0 <shellWriteString>
#if SHELL_KEEP_RETURN_VALUE == 1
    shell->info.retVal = value;
#endif
}
    af08:	e320f000 	nop	{0}
    af0c:	e24bd004 	sub	sp, fp, #4
    af10:	e8bd8800 	pop	{fp, pc}

0000af14 <shellHistoryAdd>:
 * @brief shell历史记录添加
 *
 * @param shell shell对象
 */
static void shellHistoryAdd(Shell* shell)
{
    af14:	e92d4800 	push	{fp, lr}
    af18:	e28db004 	add	fp, sp, #4
    af1c:	e24dd008 	sub	sp, sp, #8
    af20:	e50b0008 	str	r0, [fp, #-8]
    shell->history.offset = 0;
    af24:	e51b3008 	ldr	r3, [fp, #-8]
    af28:	e3a02000 	mov	r2, #0
    af2c:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    if (shell->history.number > 0
    af30:	e51b3008 	ldr	r3, [fp, #-8]
    af34:	e1d335b0 	ldrh	r3, [r3, #80]	; 0x50
    af38:	e3530000 	cmp	r3, #0
    af3c:	0a000015 	beq	af98 <shellHistoryAdd+0x84>
        && strcmp(shell->history.item[(shell->history.record == 0 ? SHELL_HISTORY_MAX_NUMBER : shell->history.record) - 1],
    af40:	e51b3008 	ldr	r3, [fp, #-8]
    af44:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    af48:	e3530000 	cmp	r3, #0
    af4c:	0a000003 	beq	af60 <shellHistoryAdd+0x4c>
    af50:	e51b3008 	ldr	r3, [fp, #-8]
    af54:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    af58:	e2433001 	sub	r3, r3, #1
    af5c:	ea000000 	b	af64 <shellHistoryAdd+0x50>
    af60:	e3a03004 	mov	r3, #4
    af64:	e51b2008 	ldr	r2, [fp, #-8]
    af68:	e283300e 	add	r3, r3, #14
    af6c:	e1a03103 	lsl	r3, r3, #2
    af70:	e0823003 	add	r3, r2, r3
    af74:	e5932004 	ldr	r2, [r3, #4]
               shell->parser.buffer)
    af78:	e51b3008 	ldr	r3, [fp, #-8]
    af7c:	e5933010 	ldr	r3, [r3, #16]
        && strcmp(shell->history.item[(shell->history.record == 0 ? SHELL_HISTORY_MAX_NUMBER : shell->history.record) - 1],
    af80:	e1a01003 	mov	r1, r3
    af84:	e1a00002 	mov	r0, r2
    af88:	eb001336 	bl	fc68 <strcmp>
    af8c:	e1a03000 	mov	r3, r0
    af90:	e3530000 	cmp	r3, #0
    af94:	0a000029 	beq	b040 <shellHistoryAdd+0x12c>
            == 0) {
        return;
    }
    if (shellStringCopy(shell->history.item[shell->history.record],
    af98:	e51b3008 	ldr	r3, [fp, #-8]
    af9c:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    afa0:	e51b2008 	ldr	r2, [fp, #-8]
    afa4:	e283300e 	add	r3, r3, #14
    afa8:	e1a03103 	lsl	r3, r3, #2
    afac:	e0823003 	add	r3, r2, r3
    afb0:	e5932004 	ldr	r2, [r3, #4]
    afb4:	e51b3008 	ldr	r3, [fp, #-8]
    afb8:	e5933010 	ldr	r3, [r3, #16]
    afbc:	e1a01003 	mov	r1, r3
    afc0:	e1a00002 	mov	r0, r2
    afc4:	ebfff853 	bl	9118 <shellStringCopy>
    afc8:	e1a03000 	mov	r3, r0
    afcc:	e3530000 	cmp	r3, #0
    afd0:	0a000005 	beq	afec <shellHistoryAdd+0xd8>
            shell->parser.buffer)
        != 0) {
        shell->history.record++;
    afd4:	e51b3008 	ldr	r3, [fp, #-8]
    afd8:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    afdc:	e2833001 	add	r3, r3, #1
    afe0:	e6ff2073 	uxth	r2, r3
    afe4:	e51b3008 	ldr	r3, [fp, #-8]
    afe8:	e1c325b2 	strh	r2, [r3, #82]	; 0x52
    }
    if (++shell->history.number > SHELL_HISTORY_MAX_NUMBER) {
    afec:	e51b3008 	ldr	r3, [fp, #-8]
    aff0:	e1d335b0 	ldrh	r3, [r3, #80]	; 0x50
    aff4:	e2833001 	add	r3, r3, #1
    aff8:	e6ff2073 	uxth	r2, r3
    affc:	e51b3008 	ldr	r3, [fp, #-8]
    b000:	e1c325b0 	strh	r2, [r3, #80]	; 0x50
    b004:	e51b3008 	ldr	r3, [fp, #-8]
    b008:	e1d335b0 	ldrh	r3, [r3, #80]	; 0x50
    b00c:	e3530005 	cmp	r3, #5
    b010:	9a000002 	bls	b020 <shellHistoryAdd+0x10c>
        shell->history.number = SHELL_HISTORY_MAX_NUMBER;
    b014:	e51b3008 	ldr	r3, [fp, #-8]
    b018:	e3a02005 	mov	r2, #5
    b01c:	e1c325b0 	strh	r2, [r3, #80]	; 0x50
    }
    if (shell->history.record >= SHELL_HISTORY_MAX_NUMBER) {
    b020:	e51b3008 	ldr	r3, [fp, #-8]
    b024:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    b028:	e3530004 	cmp	r3, #4
    b02c:	9a000004 	bls	b044 <shellHistoryAdd+0x130>
        shell->history.record = 0;
    b030:	e51b3008 	ldr	r3, [fp, #-8]
    b034:	e3a02000 	mov	r2, #0
    b038:	e1c325b2 	strh	r2, [r3, #82]	; 0x52
    b03c:	ea000000 	b	b044 <shellHistoryAdd+0x130>
        return;
    b040:	e320f000 	nop	{0}
    }
}
    b044:	e24bd004 	sub	sp, fp, #4
    b048:	e8bd8800 	pop	{fp, pc}

0000b04c <shellHistory>:
 *
 * @param shell shell对象
 * @param dir 方向 {@code <0}往上查找 {@code >0}往下查找
 */
static void shellHistory(Shell* shell, signed char dir)
{
    b04c:	e92d4800 	push	{fp, lr}
    b050:	e28db004 	add	fp, sp, #4
    b054:	e24dd008 	sub	sp, sp, #8
    b058:	e50b0008 	str	r0, [fp, #-8]
    b05c:	e1a03001 	mov	r3, r1
    b060:	e54b3009 	strb	r3, [fp, #-9]
    if (dir > 0) {
    b064:	e15b30d9 	ldrsb	r3, [fp, #-9]
    b068:	e3530000 	cmp	r3, #0
    b06c:	da00002a 	ble	b11c <shellHistory+0xd0>
        if (shell->history.offset-- <= -((shell->history.number > shell->history.record) ? shell->history.number : shell->history.record)) {
    b070:	e51b3008 	ldr	r3, [fp, #-8]
    b074:	e1d315f4 	ldrsh	r1, [r3, #84]	; 0x54
    b078:	e6ff3071 	uxth	r3, r1
    b07c:	e2433001 	sub	r3, r3, #1
    b080:	e6ff3073 	uxth	r3, r3
    b084:	e6bf2073 	sxth	r2, r3
    b088:	e51b3008 	ldr	r3, [fp, #-8]
    b08c:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    b090:	e51b3008 	ldr	r3, [fp, #-8]
    b094:	e1d325b0 	ldrh	r2, [r3, #80]	; 0x50
    b098:	e51b3008 	ldr	r3, [fp, #-8]
    b09c:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    b0a0:	e1520003 	cmp	r2, r3
    b0a4:	9a000003 	bls	b0b8 <shellHistory+0x6c>
    b0a8:	e51b3008 	ldr	r3, [fp, #-8]
    b0ac:	e1d335b0 	ldrh	r3, [r3, #80]	; 0x50
    b0b0:	e2633000 	rsb	r3, r3, #0
    b0b4:	ea000002 	b	b0c4 <shellHistory+0x78>
    b0b8:	e51b3008 	ldr	r3, [fp, #-8]
    b0bc:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    b0c0:	e2633000 	rsb	r3, r3, #0
    b0c4:	e1510003 	cmp	r1, r3
    b0c8:	ca000026 	bgt	b168 <shellHistory+0x11c>
            shell->history.offset = -((shell->history.number > shell->history.record)
    b0cc:	e51b3008 	ldr	r3, [fp, #-8]
    b0d0:	e1d325b0 	ldrh	r2, [r3, #80]	; 0x50
    b0d4:	e51b3008 	ldr	r3, [fp, #-8]
    b0d8:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    b0dc:	e1520003 	cmp	r2, r3
    b0e0:	9a000005 	bls	b0fc <shellHistory+0xb0>
                    ? shell->history.number
    b0e4:	e51b3008 	ldr	r3, [fp, #-8]
    b0e8:	e1d335b0 	ldrh	r3, [r3, #80]	; 0x50
            shell->history.offset = -((shell->history.number > shell->history.record)
    b0ec:	e2633000 	rsb	r3, r3, #0
    b0f0:	e6ff3073 	uxth	r3, r3
    b0f4:	e6bf3073 	sxth	r3, r3
    b0f8:	ea000004 	b	b110 <shellHistory+0xc4>
                    : shell->history.record);
    b0fc:	e51b3008 	ldr	r3, [fp, #-8]
    b100:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
            shell->history.offset = -((shell->history.number > shell->history.record)
    b104:	e2633000 	rsb	r3, r3, #0
    b108:	e6ff3073 	uxth	r3, r3
    b10c:	e6bf3073 	sxth	r3, r3
    b110:	e51b2008 	ldr	r2, [fp, #-8]
    b114:	e1c235b4 	strh	r3, [r2, #84]	; 0x54
    b118:	ea000012 	b	b168 <shellHistory+0x11c>
        }
    } else if (dir < 0) {
    b11c:	e15b30d9 	ldrsb	r3, [fp, #-9]
    b120:	e3530000 	cmp	r3, #0
    b124:	aa000048 	bge	b24c <shellHistory+0x200>
        if (++shell->history.offset > 0) {
    b128:	e51b3008 	ldr	r3, [fp, #-8]
    b12c:	e1d335f4 	ldrsh	r3, [r3, #84]	; 0x54
    b130:	e6ff3073 	uxth	r3, r3
    b134:	e2833001 	add	r3, r3, #1
    b138:	e6ff3073 	uxth	r3, r3
    b13c:	e6bf2073 	sxth	r2, r3
    b140:	e51b3008 	ldr	r3, [fp, #-8]
    b144:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
    b148:	e51b3008 	ldr	r3, [fp, #-8]
    b14c:	e1d335f4 	ldrsh	r3, [r3, #84]	; 0x54
    b150:	e3530000 	cmp	r3, #0
    b154:	da000003 	ble	b168 <shellHistory+0x11c>
            shell->history.offset = 0;
    b158:	e51b3008 	ldr	r3, [fp, #-8]
    b15c:	e3a02000 	mov	r2, #0
    b160:	e1c325b4 	strh	r2, [r3, #84]	; 0x54
            return;
    b164:	ea00003b 	b	b258 <shellHistory+0x20c>
        }
    } else {
        return;
    }
    shellClearCommandLine(shell);
    b168:	e51b0008 	ldr	r0, [fp, #-8]
    b16c:	ebfffa31 	bl	9a38 <shellClearCommandLine>
    if (shell->history.offset == 0) {
    b170:	e51b3008 	ldr	r3, [fp, #-8]
    b174:	e1d335f4 	ldrsh	r3, [r3, #84]	; 0x54
    b178:	e3530000 	cmp	r3, #0
    b17c:	1a000007 	bne	b1a0 <shellHistory+0x154>
        shell->parser.cursor = shell->parser.length = 0;
    b180:	e51b3008 	ldr	r3, [fp, #-8]
    b184:	e3a02000 	mov	r2, #0
    b188:	e1c320bc 	strh	r2, [r3, #12]
    b18c:	e51b3008 	ldr	r3, [fp, #-8]
    b190:	e1d320bc 	ldrh	r2, [r3, #12]
    b194:	e51b3008 	ldr	r3, [fp, #-8]
    b198:	e1c320be 	strh	r2, [r3, #14]
    b19c:	ea00002d 	b	b258 <shellHistory+0x20c>
    } else {
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    b1a0:	e51b3008 	ldr	r3, [fp, #-8]
    b1a4:	e5930010 	ldr	r0, [r3, #16]
                 shell->history.item[(shell->history.record + SHELL_HISTORY_MAX_NUMBER
    b1a8:	e51b3008 	ldr	r3, [fp, #-8]
    b1ac:	e1d335b2 	ldrh	r3, [r3, #82]	; 0x52
    b1b0:	e2833005 	add	r3, r3, #5
                                         + shell->history.offset)
    b1b4:	e51b2008 	ldr	r2, [fp, #-8]
    b1b8:	e1d225f4 	ldrsh	r2, [r2, #84]	; 0x54
    b1bc:	e0831002 	add	r1, r3, r2
                     % SHELL_HISTORY_MAX_NUMBER]))
    b1c0:	e3063667 	movw	r3, #26215	; 0x6667
    b1c4:	e3463666 	movt	r3, #26214	; 0x6666
    b1c8:	e0c32391 	smull	r2, r3, r1, r3
    b1cc:	e1a020c3 	asr	r2, r3, #1
    b1d0:	e1a03fc1 	asr	r3, r1, #31
    b1d4:	e0422003 	sub	r2, r2, r3
    b1d8:	e1a03002 	mov	r3, r2
    b1dc:	e1a03103 	lsl	r3, r3, #2
    b1e0:	e0833002 	add	r3, r3, r2
    b1e4:	e0412003 	sub	r2, r1, r3
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    b1e8:	e51b1008 	ldr	r1, [fp, #-8]
    b1ec:	e282300e 	add	r3, r2, #14
    b1f0:	e1a03103 	lsl	r3, r3, #2
    b1f4:	e0813003 	add	r3, r1, r3
    b1f8:	e5933004 	ldr	r3, [r3, #4]
    b1fc:	e1a01003 	mov	r1, r3
    b200:	ebfff7c4 	bl	9118 <shellStringCopy>
    b204:	e1a03000 	mov	r3, r0
    b208:	e1a02003 	mov	r2, r3
    b20c:	e51b3008 	ldr	r3, [fp, #-8]
    b210:	e1c320bc 	strh	r2, [r3, #12]
    b214:	e51b3008 	ldr	r3, [fp, #-8]
    b218:	e1d330bc 	ldrh	r3, [r3, #12]
    b21c:	e3530000 	cmp	r3, #0
    b220:	0a00000b 	beq	b254 <shellHistory+0x208>
            == 0) {
            return;
        }
        shell->parser.cursor = shell->parser.length;
    b224:	e51b3008 	ldr	r3, [fp, #-8]
    b228:	e1d320bc 	ldrh	r2, [r3, #12]
    b22c:	e51b3008 	ldr	r3, [fp, #-8]
    b230:	e1c320be 	strh	r2, [r3, #14]
        shellWriteString(shell, shell->parser.buffer);
    b234:	e51b3008 	ldr	r3, [fp, #-8]
    b238:	e5933010 	ldr	r3, [r3, #16]
    b23c:	e1a01003 	mov	r1, r3
    b240:	e51b0008 	ldr	r0, [fp, #-8]
    b244:	ebfff669 	bl	8bf0 <shellWriteString>
    b248:	ea000002 	b	b258 <shellHistory+0x20c>
        return;
    b24c:	e320f000 	nop	{0}
    b250:	ea000000 	b	b258 <shellHistory+0x20c>
            return;
    b254:	e320f000 	nop	{0}
    }
}
    b258:	e24bd004 	sub	sp, fp, #4
    b25c:	e8bd8800 	pop	{fp, pc}

0000b260 <shellNormalInput>:
 *
 * @param shell shell 对象
 * @param data 输入字符
 */
void shellNormalInput(Shell* shell, char data)
{
    b260:	e92d4800 	push	{fp, lr}
    b264:	e28db004 	add	fp, sp, #4
    b268:	e24dd008 	sub	sp, sp, #8
    b26c:	e50b0008 	str	r0, [fp, #-8]
    b270:	e1a03001 	mov	r3, r1
    b274:	e54b3009 	strb	r3, [fp, #-9]
    shell->status.tabFlag = 0;
    b278:	e51b2008 	ldr	r2, [fp, #-8]
    b27c:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    b280:	e7c2311f 	bfc	r3, #2, #1
    b284:	e5c23060 	strb	r3, [r2, #96]	; 0x60
    shellInsertByte(shell, data);
    b288:	e55b3009 	ldrb	r3, [fp, #-9]
    b28c:	e1a01003 	mov	r1, r3
    b290:	e51b0008 	ldr	r0, [fp, #-8]
    b294:	ebfffa07 	bl	9ab8 <shellInsertByte>
}
    b298:	e320f000 	nop	{0}
    b29c:	e24bd004 	sub	sp, fp, #4
    b2a0:	e8bd8800 	pop	{fp, pc}

0000b2a4 <shellExec>:
 * @brief shell运行命令
 *
 * @param shell shell对象
 */
void shellExec(Shell* shell)
{
    b2a4:	e92d4800 	push	{fp, lr}
    b2a8:	e28db004 	add	fp, sp, #4
    b2ac:	e24dd020 	sub	sp, sp, #32
    b2b0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8

    if (shell->parser.length == 0) {
    b2b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b2b8:	e1d330bc 	ldrh	r3, [r3, #12]
    b2bc:	e3530000 	cmp	r3, #0
    b2c0:	0a00006e 	beq	b480 <shellExec+0x1dc>
        return;
    }

    shell->parser.buffer[shell->parser.length] = 0;
    b2c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b2c8:	e5933010 	ldr	r3, [r3, #16]
    b2cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b2d0:	e1d220bc 	ldrh	r2, [r2, #12]
    b2d4:	e0833002 	add	r3, r3, r2
    b2d8:	e3a02000 	mov	r2, #0
    b2dc:	e5c32000 	strb	r2, [r3]

    if (shell->status.isChecked) {
    b2e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b2e4:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    b2e8:	e2033001 	and	r3, r3, #1
    b2ec:	e6ef3073 	uxtb	r3, r3
    b2f0:	e3530000 	cmp	r3, #0
    b2f4:	0a00005e 	beq	b474 <shellExec+0x1d0>
#if SHELL_HISTORY_MAX_NUMBER > 0
        shellHistoryAdd(shell);
    b2f8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b2fc:	ebffff04 	bl	af14 <shellHistoryAdd>
#endif /** SHELL_HISTORY_MAX_NUMBER > 0 */
        shellParserParam(shell);
    b300:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b304:	ebfffc17 	bl	a368 <shellParserParam>
        shell->parser.length = shell->parser.cursor = 0;
    b308:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b30c:	e3a02000 	mov	r2, #0
    b310:	e1c320be 	strh	r2, [r3, #14]
    b314:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b318:	e1d320be 	ldrh	r2, [r3, #14]
    b31c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b320:	e1c320bc 	strh	r2, [r3, #12]
        if (shell->parser.paramCount == 0) {
    b324:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b328:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
    b32c:	e3530000 	cmp	r3, #0
    b330:	0a000054 	beq	b488 <shellExec+0x1e4>
            return;
        }
        shellWriteString(shell, "\r\n");
    b334:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    b338:	e3401001 	movt	r1, #1
    b33c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b340:	ebfff62a 	bl	8bf0 <shellWriteString>

        // exec shell command
        ShellCommand* command = shellSeekCommand(shell,
            shell->parser.param[0],
    b344:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b348:	e5931014 	ldr	r1, [r3, #20]
            shell->commandList.base,
    b34c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b350:	e5932058 	ldr	r2, [r3, #88]	; 0x58
        ShellCommand* command = shellSeekCommand(shell,
    b354:	e3a03000 	mov	r3, #0
    b358:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b35c:	ebfffc67 	bl	a500 <shellSeekCommand>
    b360:	e50b0008 	str	r0, [fp, #-8]
            0);
        if (command != NULL) {
    b364:	e51b3008 	ldr	r3, [fp, #-8]
    b368:	e3530000 	cmp	r3, #0
    b36c:	0a000003 	beq	b380 <shellExec+0xdc>
            shellRunCommand(shell, command);
    b370:	e51b1008 	ldr	r1, [fp, #-8]
    b374:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b378:	ebfffdf4 	bl	ab50 <shellRunCommand>
    b37c:	ea000042 	b	b48c <shellExec+0x1e8>
        } else {
            // exec user apps
            int paramNum = shell->parser.paramCount > SHELL_PARAMETER_MAX_NUMBER ? SHELL_PARAMETER_MAX_NUMBER : shell->parser.paramCount;
    b380:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b384:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
    b388:	e3530008 	cmp	r3, #8
    b38c:	8a000002 	bhi	b39c <shellExec+0xf8>
    b390:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b394:	e1d333b6 	ldrh	r3, [r3, #54]	; 0x36
    b398:	ea000000 	b	b3a0 <shellExec+0xfc>
    b39c:	e3a03008 	mov	r3, #8
    b3a0:	e50b300c 	str	r3, [fp, #-12]
            shell->parser.param[paramNum] = 0;
    b3a4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b3a8:	e51b300c 	ldr	r3, [fp, #-12]
    b3ac:	e2833004 	add	r3, r3, #4
    b3b0:	e1a03103 	lsl	r3, r3, #2
    b3b4:	e0823003 	add	r3, r2, r3
    b3b8:	e3a02000 	mov	r2, #0
    b3bc:	e5832004 	str	r2, [r3, #4]
            int fd = -1;
    b3c0:	e3e03000 	mvn	r3, #0
    b3c4:	e50b3010 	str	r3, [fp, #-16]
            fd = open(&session_fs, shell->parser.param[0]);
    b3c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b3cc:	e5933014 	ldr	r3, [r3, #20]
    b3d0:	e1a01003 	mov	r1, r3
    b3d4:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    b3d8:	e3400001 	movt	r0, #1
    b3dc:	eb00089d 	bl	d658 <open>
    b3e0:	e50b0010 	str	r0, [fp, #-16]
            if (fd < 0) {
    b3e4:	e51b3010 	ldr	r3, [fp, #-16]
    b3e8:	e3530000 	cmp	r3, #0
    b3ec:	aa000006 	bge	b40c <shellExec+0x168>
                shellWriteString(shell, shellText[SHELL_TEXT_CMD_NOT_FOUND]);
    b3f0:	e30531b8 	movw	r3, #20920	; 0x51b8
    b3f4:	e3403001 	movt	r3, #1
    b3f8:	e5933014 	ldr	r3, [r3, #20]
    b3fc:	e1a01003 	mov	r1, r3
    b400:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b404:	ebfff5f9 	bl	8bf0 <shellWriteString>
    b408:	ea00001f 	b	b48c <shellExec+0x1e8>
            } else {
                if (spawn(&session_fs, fd, read, shell->parser.param[0], shell->parser.param) < 0) {
    b40c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b410:	e5932014 	ldr	r2, [r3, #20]
    b414:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b418:	e2833014 	add	r3, r3, #20
    b41c:	e58d3000 	str	r3, [sp]
    b420:	e1a03002 	mov	r3, r2
    b424:	e30d2b38 	movw	r2, #56120	; 0xdb38
    b428:	e3402000 	movt	r2, #0
    b42c:	e51b1010 	ldr	r1, [fp, #-16]
    b430:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    b434:	e3400001 	movt	r0, #1
    b438:	eb000dec 	bl	ebf0 <spawn>
    b43c:	e1a03000 	mov	r3, r0
    b440:	e3530000 	cmp	r3, #0
    b444:	aa000005 	bge	b460 <shellExec+0x1bc>
                    shellWriteString(shell, shellText[SHELL_TEXT_CMD_NOT_FOUND]);
    b448:	e30531b8 	movw	r3, #20920	; 0x51b8
    b44c:	e3403001 	movt	r3, #1
    b450:	e5933014 	ldr	r3, [r3, #20]
    b454:	e1a01003 	mov	r1, r3
    b458:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b45c:	ebfff5e3 	bl	8bf0 <shellWriteString>
                }
                close(&session_fs, fd);
    b460:	e51b1010 	ldr	r1, [fp, #-16]
    b464:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    b468:	e3400001 	movt	r0, #1
    b46c:	eb0008f7 	bl	d850 <close>
    b470:	ea000005 	b	b48c <shellExec+0x1e8>
            }
        }
    } else {
        shellCheckPassword(shell);
    b474:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b478:	ebfffe17 	bl	acdc <shellCheckPassword>
    b47c:	ea000002 	b	b48c <shellExec+0x1e8>
        return;
    b480:	e320f000 	nop	{0}
    b484:	ea000000 	b	b48c <shellExec+0x1e8>
            return;
    b488:	e320f000 	nop	{0}
    }
}
    b48c:	e24bd004 	sub	sp, fp, #4
    b490:	e8bd8800 	pop	{fp, pc}

0000b494 <shellUp>:
 * @brief shell上方向键输入
 *
 * @param shell shell对象
 */
void shellUp(Shell* shell)
{
    b494:	e92d4800 	push	{fp, lr}
    b498:	e28db004 	add	fp, sp, #4
    b49c:	e24dd008 	sub	sp, sp, #8
    b4a0:	e50b0008 	str	r0, [fp, #-8]
    shellHistory(shell, 1);
    b4a4:	e3a01001 	mov	r1, #1
    b4a8:	e51b0008 	ldr	r0, [fp, #-8]
    b4ac:	ebfffee6 	bl	b04c <shellHistory>
}
    b4b0:	e320f000 	nop	{0}
    b4b4:	e24bd004 	sub	sp, fp, #4
    b4b8:	e8bd8800 	pop	{fp, pc}

0000b4bc <shellDown>:
 * @brief shell下方向键输入
 *
 * @param shell shell对象
 */
void shellDown(Shell* shell)
{
    b4bc:	e92d4800 	push	{fp, lr}
    b4c0:	e28db004 	add	fp, sp, #4
    b4c4:	e24dd008 	sub	sp, sp, #8
    b4c8:	e50b0008 	str	r0, [fp, #-8]
    shellHistory(shell, -1);
    b4cc:	e3e01000 	mvn	r1, #0
    b4d0:	e51b0008 	ldr	r0, [fp, #-8]
    b4d4:	ebfffedc 	bl	b04c <shellHistory>
}
    b4d8:	e320f000 	nop	{0}
    b4dc:	e24bd004 	sub	sp, fp, #4
    b4e0:	e8bd8800 	pop	{fp, pc}

0000b4e4 <shellRight>:
 * @brief shell右方向键输入
 *
 * @param shell shell对象
 */
void shellRight(Shell* shell)
{
    b4e4:	e92d4800 	push	{fp, lr}
    b4e8:	e28db004 	add	fp, sp, #4
    b4ec:	e24dd008 	sub	sp, sp, #8
    b4f0:	e50b0008 	str	r0, [fp, #-8]
    if (shell->parser.cursor < shell->parser.length) {
    b4f4:	e51b3008 	ldr	r3, [fp, #-8]
    b4f8:	e1d320be 	ldrh	r2, [r3, #14]
    b4fc:	e51b3008 	ldr	r3, [fp, #-8]
    b500:	e1d330bc 	ldrh	r3, [r3, #12]
    b504:	e1520003 	cmp	r2, r3
    b508:	2a00000c 	bcs	b540 <shellRight+0x5c>
        shellWriteByte(shell, shell->parser.buffer[shell->parser.cursor++]);
    b50c:	e51b3008 	ldr	r3, [fp, #-8]
    b510:	e5932010 	ldr	r2, [r3, #16]
    b514:	e51b3008 	ldr	r3, [fp, #-8]
    b518:	e1d330be 	ldrh	r3, [r3, #14]
    b51c:	e2831001 	add	r1, r3, #1
    b520:	e6ff0071 	uxth	r0, r1
    b524:	e51b1008 	ldr	r1, [fp, #-8]
    b528:	e1c100be 	strh	r0, [r1, #14]
    b52c:	e0823003 	add	r3, r2, r3
    b530:	e5d33000 	ldrb	r3, [r3]
    b534:	e1a01003 	mov	r1, r3
    b538:	e51b0008 	ldr	r0, [fp, #-8]
    b53c:	ebfff59c 	bl	8bb4 <shellWriteByte>
    }
}
    b540:	e320f000 	nop	{0}
    b544:	e24bd004 	sub	sp, fp, #4
    b548:	e8bd8800 	pop	{fp, pc}

0000b54c <shellLeft>:
 * @brief shell左方向键输入
 *
 * @param shell shell对象
 */
void shellLeft(Shell* shell)
{
    b54c:	e92d4800 	push	{fp, lr}
    b550:	e28db004 	add	fp, sp, #4
    b554:	e24dd008 	sub	sp, sp, #8
    b558:	e50b0008 	str	r0, [fp, #-8]
    if (shell->parser.cursor > 0) {
    b55c:	e51b3008 	ldr	r3, [fp, #-8]
    b560:	e1d330be 	ldrh	r3, [r3, #14]
    b564:	e3530000 	cmp	r3, #0
    b568:	0a000008 	beq	b590 <shellLeft+0x44>
        shellWriteByte(shell, '\b');
    b56c:	e3a01008 	mov	r1, #8
    b570:	e51b0008 	ldr	r0, [fp, #-8]
    b574:	ebfff58e 	bl	8bb4 <shellWriteByte>
        shell->parser.cursor--;
    b578:	e51b3008 	ldr	r3, [fp, #-8]
    b57c:	e1d330be 	ldrh	r3, [r3, #14]
    b580:	e2433001 	sub	r3, r3, #1
    b584:	e6ff2073 	uxth	r2, r3
    b588:	e51b3008 	ldr	r3, [fp, #-8]
    b58c:	e1c320be 	strh	r2, [r3, #14]
    }
}
    b590:	e320f000 	nop	{0}
    b594:	e24bd004 	sub	sp, fp, #4
    b598:	e8bd8800 	pop	{fp, pc}

0000b59c <shellTab>:
 * @brief shell Tab按键处理
 *
 * @param shell shell对象
 */
void shellTab(Shell* shell)
{
    b59c:	e92d4810 	push	{r4, fp, lr}
    b5a0:	e28db008 	add	fp, sp, #8
    b5a4:	e24dd01c 	sub	sp, sp, #28
    b5a8:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    unsigned short maxMatch = shell->parser.bufferSize;
    b5ac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b5b0:	e1d333b4 	ldrh	r3, [r3, #52]	; 0x34
    b5b4:	e14b30be 	strh	r3, [fp, #-14]
    unsigned short lastMatchIndex = 0;
    b5b8:	e3a03000 	mov	r3, #0
    b5bc:	e14b31b0 	strh	r3, [fp, #-16]
    unsigned short matchNum = 0;
    b5c0:	e3a03000 	mov	r3, #0
    b5c4:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee
    unsigned short length;

    if (shell->parser.length == 0) {
    b5c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b5cc:	e1d330bc 	ldrh	r3, [r3, #12]
    b5d0:	e3530000 	cmp	r3, #0
    b5d4:	1a000005 	bne	b5f0 <shellTab+0x54>
        shellListAll(shell);
    b5d8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b5dc:	ebfff8f9 	bl	99c8 <shellListAll>
        shellWritePrompt(shell, 1);
    b5e0:	e3a01001 	mov	r1, #1
    b5e4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b5e8:	ebfff5e2 	bl	8d78 <shellWritePrompt>
    b5ec:	ea0000a2 	b	b87c <shellTab+0x2e0>
    } else if (shell->parser.length > 0) {
    b5f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b5f4:	e1d330bc 	ldrh	r3, [r3, #12]
    b5f8:	e3530000 	cmp	r3, #0
    b5fc:	0a00009e 	beq	b87c <shellTab+0x2e0>
        shell->parser.buffer[shell->parser.length] = 0;
    b600:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b604:	e5933010 	ldr	r3, [r3, #16]
    b608:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b60c:	e1d220bc 	ldrh	r2, [r2, #12]
    b610:	e0833002 	add	r3, r3, r2
    b614:	e3a02000 	mov	r2, #0
    b618:	e5c32000 	strb	r2, [r3]
        ShellCommand* base = (ShellCommand*)shell->commandList.base;
    b61c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b620:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    b624:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        for (short i = 0; i < shell->commandList.count; i++) {
    b628:	e3a03000 	mov	r3, #0
    b62c:	e14b31b4 	strh	r3, [fp, #-20]	; 0xffffffec
    b630:	ea00004f 	b	b774 <shellTab+0x1d8>
            if (shellCheckPermission(shell, &base[i]) == 0
    b634:	e15b31f4 	ldrsh	r3, [fp, #-20]	; 0xffffffec
    b638:	e1a03203 	lsl	r3, r3, #4
    b63c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b640:	e0823003 	add	r3, r2, r3
    b644:	e1a01003 	mov	r1, r3
    b648:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b64c:	ebfff600 	bl	8e54 <shellCheckPermission>
    b650:	e1a03000 	mov	r3, r0
    b654:	e3530000 	cmp	r3, #0
    b658:	1a000040 	bne	b760 <shellTab+0x1c4>
                && shellStringCompare(shell->parser.buffer,
    b65c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b660:	e5934010 	ldr	r4, [r3, #16]
                       (char*)shellGetCommandName(&base[i]))
    b664:	e15b31f4 	ldrsh	r3, [fp, #-20]	; 0xffffffec
    b668:	e1a03203 	lsl	r3, r3, #4
    b66c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b670:	e0823003 	add	r3, r2, r3
    b674:	e1a00003 	mov	r0, r3
    b678:	ebfff6f6 	bl	9258 <shellGetCommandName>
    b67c:	e1a03000 	mov	r3, r0
                && shellStringCompare(shell->parser.buffer,
    b680:	e1a01003 	mov	r1, r3
    b684:	e1a00004 	mov	r0, r4
    b688:	ebfff6c5 	bl	91a4 <shellStringCompare>
    b68c:	e1a03000 	mov	r3, r0
    b690:	e1a02003 	mov	r2, r3
                    == shell->parser.length) {
    b694:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b698:	e1d330bc 	ldrh	r3, [r3, #12]
                && shellStringCompare(shell->parser.buffer,
    b69c:	e1520003 	cmp	r2, r3
    b6a0:	1a00002e 	bne	b760 <shellTab+0x1c4>
                if (matchNum != 0) {
    b6a4:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b6a8:	e3530000 	cmp	r3, #0
    b6ac:	0a000026 	beq	b74c <shellTab+0x1b0>
                    if (matchNum == 1) {
    b6b0:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b6b4:	e3530001 	cmp	r3, #1
    b6b8:	1a000003 	bne	b6cc <shellTab+0x130>
                        shellWriteString(shell, "\r\n");
    b6bc:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    b6c0:	e3401001 	movt	r1, #1
    b6c4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b6c8:	ebfff548 	bl	8bf0 <shellWriteString>
                    }
                    shellListItem(shell, &base[lastMatchIndex]);
    b6cc:	e15b31b0 	ldrh	r3, [fp, #-16]
    b6d0:	e1a03203 	lsl	r3, r3, #4
    b6d4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b6d8:	e0823003 	add	r3, r2, r3
    b6dc:	e1a01003 	mov	r1, r3
    b6e0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b6e4:	ebfff738 	bl	93cc <shellListItem>
                    length = shellStringCompare((char*)shellGetCommandName(&base[lastMatchIndex]),
    b6e8:	e15b31b0 	ldrh	r3, [fp, #-16]
    b6ec:	e1a03203 	lsl	r3, r3, #4
    b6f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b6f4:	e0823003 	add	r3, r2, r3
    b6f8:	e1a00003 	mov	r0, r3
    b6fc:	ebfff6d5 	bl	9258 <shellGetCommandName>
    b700:	e1a04000 	mov	r4, r0
                        (char*)shellGetCommandName(&base[i]));
    b704:	e15b31f4 	ldrsh	r3, [fp, #-20]	; 0xffffffec
    b708:	e1a03203 	lsl	r3, r3, #4
    b70c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b710:	e0823003 	add	r3, r2, r3
    b714:	e1a00003 	mov	r0, r3
    b718:	ebfff6ce 	bl	9258 <shellGetCommandName>
    b71c:	e1a03000 	mov	r3, r0
                    length = shellStringCompare((char*)shellGetCommandName(&base[lastMatchIndex]),
    b720:	e1a01003 	mov	r1, r3
    b724:	e1a00004 	mov	r0, r4
    b728:	ebfff69d 	bl	91a4 <shellStringCompare>
    b72c:	e1a03000 	mov	r3, r0
    b730:	e14b31ba 	strh	r3, [fp, #-26]	; 0xffffffe6
                    maxMatch = (maxMatch > length) ? length : maxMatch;
    b734:	e15b20be 	ldrh	r2, [fp, #-14]
    b738:	e15b31ba 	ldrh	r3, [fp, #-26]	; 0xffffffe6
    b73c:	e1520003 	cmp	r2, r3
    b740:	31a03002 	movcc	r3, r2
    b744:	21a03003 	movcs	r3, r3
    b748:	e14b30be 	strh	r3, [fp, #-14]
                }
                lastMatchIndex = i;
    b74c:	e15b31b4 	ldrh	r3, [fp, #-20]	; 0xffffffec
    b750:	e14b31b0 	strh	r3, [fp, #-16]
                matchNum++;
    b754:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b758:	e2833001 	add	r3, r3, #1
    b75c:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee
        for (short i = 0; i < shell->commandList.count; i++) {
    b760:	e15b31f4 	ldrsh	r3, [fp, #-20]	; 0xffffffec
    b764:	e6ff3073 	uxth	r3, r3
    b768:	e2833001 	add	r3, r3, #1
    b76c:	e6ff3073 	uxth	r3, r3
    b770:	e14b31b4 	strh	r3, [fp, #-20]	; 0xffffffec
    b774:	e15b31f4 	ldrsh	r3, [fp, #-20]	; 0xffffffec
    b778:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b77c:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    b780:	e1530002 	cmp	r3, r2
    b784:	baffffaa 	blt	b634 <shellTab+0x98>
            }
        }
        if (matchNum == 0) {
    b788:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b78c:	e3530000 	cmp	r3, #0
    b790:	0a000038 	beq	b878 <shellTab+0x2dc>
            return;
        }
        if (matchNum == 1) {
    b794:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b798:	e3530001 	cmp	r3, #1
    b79c:	1a000001 	bne	b7a8 <shellTab+0x20c>
            shellClearCommandLine(shell);
    b7a0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b7a4:	ebfff8a3 	bl	9a38 <shellClearCommandLine>
        }
        if (matchNum != 0) {
    b7a8:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b7ac:	e3530000 	cmp	r3, #0
    b7b0:	0a00000f 	beq	b7f4 <shellTab+0x258>
            shell->parser.length = shellStringCopy(shell->parser.buffer,
    b7b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b7b8:	e5934010 	ldr	r4, [r3, #16]
                (char*)shellGetCommandName(&base[lastMatchIndex]));
    b7bc:	e15b31b0 	ldrh	r3, [fp, #-16]
    b7c0:	e1a03203 	lsl	r3, r3, #4
    b7c4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b7c8:	e0823003 	add	r3, r2, r3
    b7cc:	e1a00003 	mov	r0, r3
    b7d0:	ebfff6a0 	bl	9258 <shellGetCommandName>
    b7d4:	e1a03000 	mov	r3, r0
            shell->parser.length = shellStringCopy(shell->parser.buffer,
    b7d8:	e1a01003 	mov	r1, r3
    b7dc:	e1a00004 	mov	r0, r4
    b7e0:	ebfff64c 	bl	9118 <shellStringCopy>
    b7e4:	e1a03000 	mov	r3, r0
    b7e8:	e1a02003 	mov	r2, r3
    b7ec:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b7f0:	e1c320bc 	strh	r2, [r3, #12]
        }
        if (matchNum > 1) {
    b7f4:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    b7f8:	e3530001 	cmp	r3, #1
    b7fc:	9a00000c 	bls	b834 <shellTab+0x298>
            shellListItem(shell, &base[lastMatchIndex]);
    b800:	e15b31b0 	ldrh	r3, [fp, #-16]
    b804:	e1a03203 	lsl	r3, r3, #4
    b808:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b80c:	e0823003 	add	r3, r2, r3
    b810:	e1a01003 	mov	r1, r3
    b814:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b818:	ebfff6eb 	bl	93cc <shellListItem>
            shellWritePrompt(shell, 1);
    b81c:	e3a01001 	mov	r1, #1
    b820:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b824:	ebfff553 	bl	8d78 <shellWritePrompt>
            shell->parser.length = maxMatch;
    b828:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b82c:	e15b20be 	ldrh	r2, [fp, #-14]
    b830:	e1c320bc 	strh	r2, [r3, #12]
        }
        shell->parser.buffer[shell->parser.length] = 0;
    b834:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b838:	e5933010 	ldr	r3, [r3, #16]
    b83c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b840:	e1d220bc 	ldrh	r2, [r2, #12]
    b844:	e0833002 	add	r3, r3, r2
    b848:	e3a02000 	mov	r2, #0
    b84c:	e5c32000 	strb	r2, [r3]
        shell->parser.cursor = shell->parser.length;
    b850:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b854:	e1d320bc 	ldrh	r2, [r3, #12]
    b858:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b85c:	e1c320be 	strh	r2, [r3, #14]
        shellWriteString(shell, shell->parser.buffer);
    b860:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b864:	e5933010 	ldr	r3, [r3, #16]
    b868:	e1a01003 	mov	r1, r3
    b86c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b870:	ebfff4de 	bl	8bf0 <shellWriteString>
    b874:	ea000000 	b	b87c <shellTab+0x2e0>
            return;
    b878:	e320f000 	nop	{0}
#endif
        } else {
            shell->status.tabFlag = 1;
        }
    }
}
    b87c:	e24bd008 	sub	sp, fp, #8
    b880:	e8bd8810 	pop	{r4, fp, pc}

0000b884 <shellBackspace>:
 * @brief shell 退格
 *
 * @param shell shell对象
 */
void shellBackspace(Shell* shell)
{
    b884:	e92d4800 	push	{fp, lr}
    b888:	e28db004 	add	fp, sp, #4
    b88c:	e24dd008 	sub	sp, sp, #8
    b890:	e50b0008 	str	r0, [fp, #-8]
    shellDeleteByte(shell, 1);
    b894:	e3a01001 	mov	r1, #1
    b898:	e51b0008 	ldr	r0, [fp, #-8]
    b89c:	ebfff943 	bl	9db0 <shellDeleteByte>
}
    b8a0:	e320f000 	nop	{0}
    b8a4:	e24bd004 	sub	sp, fp, #4
    b8a8:	e8bd8800 	pop	{fp, pc}

0000b8ac <shellDelete>:
 * @brief shell 删除
 *
 * @param shell shell对象
 */
void shellDelete(Shell* shell)
{
    b8ac:	e92d4800 	push	{fp, lr}
    b8b0:	e28db004 	add	fp, sp, #4
    b8b4:	e24dd008 	sub	sp, sp, #8
    b8b8:	e50b0008 	str	r0, [fp, #-8]
    shellDeleteByte(shell, -1);
    b8bc:	e3e01000 	mvn	r1, #0
    b8c0:	e51b0008 	ldr	r0, [fp, #-8]
    b8c4:	ebfff939 	bl	9db0 <shellDeleteByte>
}
    b8c8:	e320f000 	nop	{0}
    b8cc:	e24bd004 	sub	sp, fp, #4
    b8d0:	e8bd8800 	pop	{fp, pc}

0000b8d4 <shellEnter>:
 * @brief shell 回车处理
 *
 * @param shell shell对象
 */
void shellEnter(Shell* shell)
{
    b8d4:	e92d4800 	push	{fp, lr}
    b8d8:	e28db004 	add	fp, sp, #4
    b8dc:	e24dd008 	sub	sp, sp, #8
    b8e0:	e50b0008 	str	r0, [fp, #-8]
    shellExec(shell);
    b8e4:	e51b0008 	ldr	r0, [fp, #-8]
    b8e8:	ebfffe6d 	bl	b2a4 <shellExec>
    shellWritePrompt(shell, 1);
    b8ec:	e3a01001 	mov	r1, #1
    b8f0:	e51b0008 	ldr	r0, [fp, #-8]
    b8f4:	ebfff51f 	bl	8d78 <shellWritePrompt>
}
    b8f8:	e320f000 	nop	{0}
    b8fc:	e24bd004 	sub	sp, fp, #4
    b900:	e8bd8800 	pop	{fp, pc}

0000b904 <shellWriteCommandHelp>:
 *
 * @param shell shell对象
 * @param cmd 命令字符串
 */
static void shellWriteCommandHelp(Shell* shell, char* cmd)
{
    b904:	e92d4800 	push	{fp, lr}
    b908:	e28db004 	add	fp, sp, #4
    b90c:	e24dd010 	sub	sp, sp, #16
    b910:	e50b0010 	str	r0, [fp, #-16]
    b914:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    ShellCommand* command = shellSeekCommand(shell,
        cmd,
        shell->commandList.base,
    b918:	e51b3010 	ldr	r3, [fp, #-16]
    b91c:	e5932058 	ldr	r2, [r3, #88]	; 0x58
    ShellCommand* command = shellSeekCommand(shell,
    b920:	e3a03000 	mov	r3, #0
    b924:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    b928:	e51b0010 	ldr	r0, [fp, #-16]
    b92c:	ebfffaf3 	bl	a500 <shellSeekCommand>
    b930:	e50b0008 	str	r0, [fp, #-8]
        0);
    if (command) {
    b934:	e51b3008 	ldr	r3, [fp, #-8]
    b938:	e3530000 	cmp	r3, #0
    b93c:	0a00001a 	beq	b9ac <shellWriteCommandHelp+0xa8>
        shellWriteString(shell, shellText[SHELL_TEXT_HELP_HEADER]);
    b940:	e30531b8 	movw	r3, #20920	; 0x51b8
    b944:	e3403001 	movt	r3, #1
    b948:	e5933028 	ldr	r3, [r3, #40]	; 0x28
    b94c:	e1a01003 	mov	r1, r3
    b950:	e51b0010 	ldr	r0, [fp, #-16]
    b954:	ebfff4a5 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, shellGetCommandName(command));
    b958:	e51b0008 	ldr	r0, [fp, #-8]
    b95c:	ebfff63d 	bl	9258 <shellGetCommandName>
    b960:	e1a03000 	mov	r3, r0
    b964:	e1a01003 	mov	r1, r3
    b968:	e51b0010 	ldr	r0, [fp, #-16]
    b96c:	ebfff49f 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, "\r\n");
    b970:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    b974:	e3401001 	movt	r1, #1
    b978:	e51b0010 	ldr	r0, [fp, #-16]
    b97c:	ebfff49b 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, shellGetCommandDesc(command));
    b980:	e51b0008 	ldr	r0, [fp, #-8]
    b984:	ebfff66b 	bl	9338 <shellGetCommandDesc>
    b988:	e1a03000 	mov	r3, r0
    b98c:	e1a01003 	mov	r1, r3
    b990:	e51b0010 	ldr	r0, [fp, #-16]
    b994:	ebfff495 	bl	8bf0 <shellWriteString>
        shellWriteString(shell, "\r\n");
    b998:	e3041cd8 	movw	r1, #19672	; 0x4cd8
    b99c:	e3401001 	movt	r1, #1
    b9a0:	e51b0010 	ldr	r0, [fp, #-16]
    b9a4:	ebfff491 	bl	8bf0 <shellWriteString>
    } else {
        shellWriteString(shell, shellText[SHELL_TEXT_CMD_NOT_FOUND]);
    }
}
    b9a8:	ea000005 	b	b9c4 <shellWriteCommandHelp+0xc0>
        shellWriteString(shell, shellText[SHELL_TEXT_CMD_NOT_FOUND]);
    b9ac:	e30531b8 	movw	r3, #20920	; 0x51b8
    b9b0:	e3403001 	movt	r3, #1
    b9b4:	e5933014 	ldr	r3, [r3, #20]
    b9b8:	e1a01003 	mov	r1, r3
    b9bc:	e51b0010 	ldr	r0, [fp, #-16]
    b9c0:	ebfff48a 	bl	8bf0 <shellWriteString>
}
    b9c4:	e320f000 	nop	{0}
    b9c8:	e24bd004 	sub	sp, fp, #4
    b9cc:	e8bd8800 	pop	{fp, pc}

0000b9d0 <shellHelp>:
 *
 * @param argc 参数个数
 * @param argv 参数
 */
void shellHelp(int argc, char* argv[])
{
    b9d0:	e92d4800 	push	{fp, lr}
    b9d4:	e28db004 	add	fp, sp, #4
    b9d8:	e24dd010 	sub	sp, sp, #16
    b9dc:	e50b0010 	str	r0, [fp, #-16]
    b9e0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    Shell* shell = shellGetCurrent();
    b9e4:	ebfff44b 	bl	8b18 <shellGetCurrent>
    b9e8:	e50b0008 	str	r0, [fp, #-8]
    SHELL_ASSERT(shell, return);
    b9ec:	e51b3008 	ldr	r3, [fp, #-8]
    b9f0:	e3530000 	cmp	r3, #0
    b9f4:	0a00000f 	beq	ba38 <shellHelp+0x68>
    if (argc == 1) {
    b9f8:	e51b3010 	ldr	r3, [fp, #-16]
    b9fc:	e3530001 	cmp	r3, #1
    ba00:	1a000002 	bne	ba10 <shellHelp+0x40>
        shellListAll(shell);
    ba04:	e51b0008 	ldr	r0, [fp, #-8]
    ba08:	ebfff7ee 	bl	99c8 <shellListAll>
    ba0c:	ea00000a 	b	ba3c <shellHelp+0x6c>
    } else if (argc > 1) {
    ba10:	e51b3010 	ldr	r3, [fp, #-16]
    ba14:	e3530001 	cmp	r3, #1
    ba18:	da000007 	ble	ba3c <shellHelp+0x6c>
        shellWriteCommandHelp(shell, argv[1]);
    ba1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ba20:	e2833004 	add	r3, r3, #4
    ba24:	e5933000 	ldr	r3, [r3]
    ba28:	e1a01003 	mov	r1, r3
    ba2c:	e51b0008 	ldr	r0, [fp, #-8]
    ba30:	ebffffb3 	bl	b904 <shellWriteCommandHelp>
    ba34:	ea000000 	b	ba3c <shellHelp+0x6c>
    SHELL_ASSERT(shell, return);
    ba38:	e320f000 	nop	{0}
    }
}
    ba3c:	e24bd004 	sub	sp, fp, #4
    ba40:	e8bd8800 	pop	{fp, pc}

0000ba44 <shellHandler>:
 *
 * @param shell shell对象
 * @param data 输入数据
 */
void shellHandler(Shell* shell, char data)
{
    ba44:	e92d4800 	push	{fp, lr}
    ba48:	e28db004 	add	fp, sp, #4
    ba4c:	e24dd018 	sub	sp, sp, #24
    ba50:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    ba54:	e1a03001 	mov	r3, r1
    ba58:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
    CHECK_DATA(data, return);
    ba5c:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    ba60:	e35300ff 	cmp	r3, #255	; 0xff
    ba64:	0a000093 	beq	bcb8 <shellHandler+0x274>
        }
    }
#endif

    /* 根据记录的按键键值计算当前字节在按键键值中的偏移 */
    char keyByteOffset = 24;
    ba68:	e3a03018 	mov	r3, #24
    ba6c:	e54b3005 	strb	r3, [fp, #-5]
    int keyFilter = 0x00000000;
    ba70:	e3a03000 	mov	r3, #0
    ba74:	e50b300c 	str	r3, [fp, #-12]
    if ((shell->parser.keyValue & 0x0000FF00) != 0x00000000) {
    ba78:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ba7c:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    ba80:	e2033cff 	and	r3, r3, #65280	; 0xff00
    ba84:	e3530000 	cmp	r3, #0
    ba88:	0a000004 	beq	baa0 <shellHandler+0x5c>
        keyByteOffset = 0;
    ba8c:	e3a03000 	mov	r3, #0
    ba90:	e54b3005 	strb	r3, [fp, #-5]
        keyFilter = 0xFFFFFF00;
    ba94:	e3e030ff 	mvn	r3, #255	; 0xff
    ba98:	e50b300c 	str	r3, [fp, #-12]
    ba9c:	ea000013 	b	baf0 <shellHandler+0xac>
    } else if ((shell->parser.keyValue & 0x00FF0000) != 0x00000000) {
    baa0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    baa4:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    baa8:	e20338ff 	and	r3, r3, #16711680	; 0xff0000
    baac:	e3530000 	cmp	r3, #0
    bab0:	0a000005 	beq	bacc <shellHandler+0x88>
        keyByteOffset = 8;
    bab4:	e3a03008 	mov	r3, #8
    bab8:	e54b3005 	strb	r3, [fp, #-5]
        keyFilter = 0xFFFF0000;
    babc:	e3a03000 	mov	r3, #0
    bac0:	e34f3fff 	movt	r3, #65535	; 0xffff
    bac4:	e50b300c 	str	r3, [fp, #-12]
    bac8:	ea000008 	b	baf0 <shellHandler+0xac>
    } else if ((shell->parser.keyValue & 0xFF000000) != 0x00000000) {
    bacc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bad0:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    bad4:	e20334ff 	and	r3, r3, #-16777216	; 0xff000000
    bad8:	e3530000 	cmp	r3, #0
    badc:	0a000003 	beq	baf0 <shellHandler+0xac>
        keyByteOffset = 16;
    bae0:	e3a03010 	mov	r3, #16
    bae4:	e54b3005 	strb	r3, [fp, #-5]
        keyFilter = 0xFF000000;
    bae8:	e3a034ff 	mov	r3, #-16777216	; 0xff000000
    baec:	e50b300c 	str	r3, [fp, #-12]
    }

    /* 遍历ShellCommand列表，尝试进行按键键值匹配 */
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    baf0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    baf4:	e5933058 	ldr	r3, [r3, #88]	; 0x58
    baf8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (short i = 0; i < shell->commandList.count; i++) {
    bafc:	e3a03000 	mov	r3, #0
    bb00:	e14b30be 	strh	r3, [fp, #-14]
    bb04:	ea00005b 	b	bc78 <shellHandler+0x234>
        /* 判断是否是按键定义并验证权限 */
        if (base[i].attr.attrs.type == SHELL_TYPE_KEY
    bb08:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bb0c:	e1a03203 	lsl	r3, r3, #4
    bb10:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bb14:	e0823003 	add	r3, r2, r3
    bb18:	e5d33001 	ldrb	r3, [r3, #1]
    bb1c:	e203300f 	and	r3, r3, #15
    bb20:	e6ef3073 	uxtb	r3, r3
    bb24:	e3530009 	cmp	r3, #9
    bb28:	1a00004d 	bne	bc64 <shellHandler+0x220>
            && shellCheckPermission(shell, &(base[i])) == 0) {
    bb2c:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bb30:	e1a03203 	lsl	r3, r3, #4
    bb34:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bb38:	e0823003 	add	r3, r2, r3
    bb3c:	e1a01003 	mov	r1, r3
    bb40:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    bb44:	ebfff4c2 	bl	8e54 <shellCheckPermission>
    bb48:	e1a03000 	mov	r3, r0
    bb4c:	e3530000 	cmp	r3, #0
    bb50:	1a000043 	bne	bc64 <shellHandler+0x220>
            /* 对输入的字节同按键键值进行匹配 */
            if ((base[i].data.key.value & keyFilter) == shell->parser.keyValue
    bb54:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bb58:	e1a03203 	lsl	r3, r3, #4
    bb5c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bb60:	e0823003 	add	r3, r2, r3
    bb64:	e5932004 	ldr	r2, [r3, #4]
    bb68:	e51b300c 	ldr	r3, [fp, #-12]
    bb6c:	e0022003 	and	r2, r2, r3
    bb70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bb74:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    bb78:	e1520003 	cmp	r2, r3
    bb7c:	1a000038 	bne	bc64 <shellHandler+0x220>
                && (base[i].data.key.value & (0xFF << keyByteOffset)) == (data << keyByteOffset)) {
    bb80:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bb84:	e1a03203 	lsl	r3, r3, #4
    bb88:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bb8c:	e0823003 	add	r3, r2, r3
    bb90:	e5932004 	ldr	r2, [r3, #4]
    bb94:	e55b3005 	ldrb	r3, [fp, #-5]
    bb98:	e3a010ff 	mov	r1, #255	; 0xff
    bb9c:	e1a03311 	lsl	r3, r1, r3
    bba0:	e0022003 	and	r2, r2, r3
    bba4:	e55b1019 	ldrb	r1, [fp, #-25]	; 0xffffffe7
    bba8:	e55b3005 	ldrb	r3, [fp, #-5]
    bbac:	e1a03311 	lsl	r3, r1, r3
    bbb0:	e1520003 	cmp	r2, r3
    bbb4:	1a00002a 	bne	bc64 <shellHandler+0x220>
                shell->parser.keyValue |= data << keyByteOffset;
    bbb8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bbbc:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    bbc0:	e55b1019 	ldrb	r1, [fp, #-25]	; 0xffffffe7
    bbc4:	e55b3005 	ldrb	r3, [fp, #-5]
    bbc8:	e1a03311 	lsl	r3, r1, r3
    bbcc:	e1822003 	orr	r2, r2, r3
    bbd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bbd4:	e5832038 	str	r2, [r3, #56]	; 0x38
                data = 0x00;
    bbd8:	e3a03000 	mov	r3, #0
    bbdc:	e54b3019 	strb	r3, [fp, #-25]	; 0xffffffe7
                if (keyByteOffset == 0
    bbe0:	e55b3005 	ldrb	r3, [fp, #-5]
    bbe4:	e3530000 	cmp	r3, #0
    bbe8:	0a00000b 	beq	bc1c <shellHandler+0x1d8>
                    || (base[i].data.key.value & (0xFF << (keyByteOffset - 8))) == 0x00000000) {
    bbec:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bbf0:	e1a03203 	lsl	r3, r3, #4
    bbf4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bbf8:	e0823003 	add	r3, r2, r3
    bbfc:	e5932004 	ldr	r2, [r3, #4]
    bc00:	e55b3005 	ldrb	r3, [fp, #-5]
    bc04:	e2433008 	sub	r3, r3, #8
    bc08:	e3a010ff 	mov	r1, #255	; 0xff
    bc0c:	e1a03311 	lsl	r3, r1, r3
    bc10:	e0033002 	and	r3, r3, r2
    bc14:	e3530000 	cmp	r3, #0
    bc18:	1a000011 	bne	bc64 <shellHandler+0x220>
                    if (base[i].data.key.function) {
    bc1c:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bc20:	e1a03203 	lsl	r3, r3, #4
    bc24:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bc28:	e0823003 	add	r3, r2, r3
    bc2c:	e5933008 	ldr	r3, [r3, #8]
    bc30:	e3530000 	cmp	r3, #0
    bc34:	0a000006 	beq	bc54 <shellHandler+0x210>
                        base[i].data.key.function(shell);
    bc38:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bc3c:	e1a03203 	lsl	r3, r3, #4
    bc40:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    bc44:	e0823003 	add	r3, r2, r3
    bc48:	e5933008 	ldr	r3, [r3, #8]
    bc4c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    bc50:	e12fff33 	blx	r3
                    }
                    shell->parser.keyValue = 0x00000000;
    bc54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bc58:	e3a02000 	mov	r2, #0
    bc5c:	e5832038 	str	r2, [r3, #56]	; 0x38
                    break;
    bc60:	ea000009 	b	bc8c <shellHandler+0x248>
    for (short i = 0; i < shell->commandList.count; i++) {
    bc64:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bc68:	e6ff3073 	uxth	r3, r3
    bc6c:	e2833001 	add	r3, r3, #1
    bc70:	e6ff3073 	uxth	r3, r3
    bc74:	e14b30be 	strh	r3, [fp, #-14]
    bc78:	e15b30fe 	ldrsh	r3, [fp, #-14]
    bc7c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    bc80:	e1d225bc 	ldrh	r2, [r2, #92]	; 0x5c
    bc84:	e1530002 	cmp	r3, r2
    bc88:	baffff9e 	blt	bb08 <shellHandler+0xc4>
                }
            }
        }
    }

    if (data != 0x00) {
    bc8c:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    bc90:	e3530000 	cmp	r3, #0
    bc94:	0a000008 	beq	bcbc <shellHandler+0x278>
        shell->parser.keyValue = 0x00000000;
    bc98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bc9c:	e3a02000 	mov	r2, #0
    bca0:	e5832038 	str	r2, [r3, #56]	; 0x38
        shellNormalInput(shell, data);
    bca4:	e55b3019 	ldrb	r3, [fp, #-25]	; 0xffffffe7
    bca8:	e1a01003 	mov	r1, r3
    bcac:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    bcb0:	ebfffd6a 	bl	b260 <shellNormalInput>
    bcb4:	ea000000 	b	bcbc <shellHandler+0x278>
    CHECK_DATA(data, return);
    bcb8:	e320f000 	nop	{0}

    if (SHELL_GET_TICK()) {
        shell->info.activeTime = SHELL_GET_TICK();
    }
    SHELL_UNLOCK(shell);
}
    bcbc:	e24bd004 	sub	sp, fp, #4
    bcc0:	e8bd8800 	pop	{fp, pc}

0000bcc4 <shellTask>:
 *
 * @param param 参数(shell对象)
 *
 */
void shellTask(void* param)
{
    bcc4:	e92d4800 	push	{fp, lr}
    bcc8:	e28db004 	add	fp, sp, #4
    bccc:	e24dd010 	sub	sp, sp, #16
    bcd0:	e50b0010 	str	r0, [fp, #-16]
    Shell* shell = (Shell*)param;
    bcd4:	e51b3010 	ldr	r3, [fp, #-16]
    bcd8:	e50b3008 	str	r3, [fp, #-8]
    char data;
#if SHELL_TASK_WHILE == 1
    while (1) {
#endif
        if (shell->read && shell->read(&data, 1) == 1) {
    bcdc:	e51b3008 	ldr	r3, [fp, #-8]
    bce0:	e5933064 	ldr	r3, [r3, #100]	; 0x64
    bce4:	e3530000 	cmp	r3, #0
    bce8:	0afffffb 	beq	bcdc <shellTask+0x18>
    bcec:	e51b3008 	ldr	r3, [fp, #-8]
    bcf0:	e5933064 	ldr	r3, [r3, #100]	; 0x64
    bcf4:	e24b2009 	sub	r2, fp, #9
    bcf8:	e3a01001 	mov	r1, #1
    bcfc:	e1a00002 	mov	r0, r2
    bd00:	e12fff33 	blx	r3
    bd04:	e1a03000 	mov	r3, r0
    bd08:	e3530001 	cmp	r3, #1
    bd0c:	1afffff2 	bne	bcdc <shellTask+0x18>
            shellHandler(shell, data);
    bd10:	e55b3009 	ldrb	r3, [fp, #-9]
    bd14:	e1a01003 	mov	r1, r3
    bd18:	e51b0008 	ldr	r0, [fp, #-8]
    bd1c:	ebffff48 	bl	ba44 <shellHandler>
        if (shell->read && shell->read(&data, 1) == 1) {
    bd20:	eaffffed 	b	bcdc <shellTask+0x18>

0000bd24 <shellUsers>:

/**
 * @brief shell 输出用户列表(shell调用)
 */
void shellUsers(void)
{
    bd24:	e92d4800 	push	{fp, lr}
    bd28:	e28db004 	add	fp, sp, #4
    bd2c:	e24dd008 	sub	sp, sp, #8
    Shell* shell = shellGetCurrent();
    bd30:	ebfff378 	bl	8b18 <shellGetCurrent>
    bd34:	e50b0008 	str	r0, [fp, #-8]
    if (shell) {
    bd38:	e51b3008 	ldr	r3, [fp, #-8]
    bd3c:	e3530000 	cmp	r3, #0
    bd40:	0a000001 	beq	bd4c <shellUsers+0x28>
        shellListUser(shell);
    bd44:	e51b0008 	ldr	r0, [fp, #-8]
    bd48:	ebfff69e 	bl	97c8 <shellListUser>
    }
}
    bd4c:	e320f000 	nop	{0}
    bd50:	e24bd004 	sub	sp, fp, #4
    bd54:	e8bd8800 	pop	{fp, pc}

0000bd58 <shellCmds>:

/**
 * @brief shell 输出命令列表(shell调用)
 */
void shellCmds(void)
{
    bd58:	e92d4800 	push	{fp, lr}
    bd5c:	e28db004 	add	fp, sp, #4
    bd60:	e24dd008 	sub	sp, sp, #8
    Shell* shell = shellGetCurrent();
    bd64:	ebfff36b 	bl	8b18 <shellGetCurrent>
    bd68:	e50b0008 	str	r0, [fp, #-8]
    if (shell) {
    bd6c:	e51b3008 	ldr	r3, [fp, #-8]
    bd70:	e3530000 	cmp	r3, #0
    bd74:	0a000001 	beq	bd80 <shellCmds+0x28>
        shellListCommand(shell);
    bd78:	e51b0008 	ldr	r0, [fp, #-8]
    bd7c:	ebfff61a 	bl	95ec <shellListCommand>
    }
}
    bd80:	e320f000 	nop	{0}
    bd84:	e24bd004 	sub	sp, fp, #4
    bd88:	e8bd8800 	pop	{fp, pc}

0000bd8c <shellVars>:

/**
 * @brief shell 输出变量列表(shell调用)
 */
void shellVars(void)
{
    bd8c:	e92d4800 	push	{fp, lr}
    bd90:	e28db004 	add	fp, sp, #4
    bd94:	e24dd008 	sub	sp, sp, #8
    Shell* shell = shellGetCurrent();
    bd98:	ebfff35e 	bl	8b18 <shellGetCurrent>
    bd9c:	e50b0008 	str	r0, [fp, #-8]
    if (shell) {
    bda0:	e51b3008 	ldr	r3, [fp, #-8]
    bda4:	e3530000 	cmp	r3, #0
    bda8:	0a000001 	beq	bdb4 <shellVars+0x28>
        shellListVar(shell);
    bdac:	e51b0008 	ldr	r0, [fp, #-8]
    bdb0:	ebfff644 	bl	96c8 <shellListVar>
    }
}
    bdb4:	e320f000 	nop	{0}
    bdb8:	e24bd004 	sub	sp, fp, #4
    bdbc:	e8bd8800 	pop	{fp, pc}

0000bdc0 <shellKeys>:

/**
 * @brief shell 输出按键列表(shell调用)
 */
void shellKeys(void)
{
    bdc0:	e92d4800 	push	{fp, lr}
    bdc4:	e28db004 	add	fp, sp, #4
    bdc8:	e24dd008 	sub	sp, sp, #8
    Shell* shell = shellGetCurrent();
    bdcc:	ebfff351 	bl	8b18 <shellGetCurrent>
    bdd0:	e50b0008 	str	r0, [fp, #-8]
    if (shell) {
    bdd4:	e51b3008 	ldr	r3, [fp, #-8]
    bdd8:	e3530000 	cmp	r3, #0
    bddc:	0a000001 	beq	bde8 <shellKeys+0x28>
        shellListKey(shell);
    bde0:	e51b0008 	ldr	r0, [fp, #-8]
    bde4:	ebfff6b7 	bl	98c8 <shellListKey>
    }
}
    bde8:	e320f000 	nop	{0}
    bdec:	e24bd004 	sub	sp, fp, #4
    bdf0:	e8bd8800 	pop	{fp, pc}

0000bdf4 <shellClear>:

/**
 * @brief shell 清空控制台(shell调用)
 */
void shellClear(void)
{
    bdf4:	e92d4800 	push	{fp, lr}
    bdf8:	e28db004 	add	fp, sp, #4
    bdfc:	e24dd008 	sub	sp, sp, #8
    Shell* shell = shellGetCurrent();
    be00:	ebfff344 	bl	8b18 <shellGetCurrent>
    be04:	e50b0008 	str	r0, [fp, #-8]
    if (shell) {
    be08:	e51b3008 	ldr	r3, [fp, #-8]
    be0c:	e3530000 	cmp	r3, #0
    be10:	0a000005 	beq	be2c <shellClear+0x38>
        shellWriteString(shell, shellText[SHELL_TEXT_CLEAR_CONSOLE]);
    be14:	e30531b8 	movw	r3, #20920	; 0x51b8
    be18:	e3403001 	movt	r3, #1
    be1c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    be20:	e1a01003 	mov	r1, r3
    be24:	e51b0008 	ldr	r0, [fp, #-8]
    be28:	ebfff370 	bl	8bf0 <shellWriteString>
    }
}
    be2c:	e320f000 	nop	{0}
    be30:	e24bd004 	sub	sp, fp, #4
    be34:	e8bd8800 	pop	{fp, pc}

0000be38 <shellRun>:
 * @param shell shell对象
 * @param cmd 命令字符串
 * @return int 返回值
 */
int shellRun(Shell* shell, const char* cmd)
{
    be38:	e92d4800 	push	{fp, lr}
    be3c:	e28db004 	add	fp, sp, #4
    be40:	e24dd010 	sub	sp, sp, #16
    be44:	e50b0010 	str	r0, [fp, #-16]
    be48:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    SHELL_ASSERT(shell && cmd, return -1);
    be4c:	e51b3010 	ldr	r3, [fp, #-16]
    be50:	e3530000 	cmp	r3, #0
    be54:	0a000002 	beq	be64 <shellRun+0x2c>
    be58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    be5c:	e3530000 	cmp	r3, #0
    be60:	1a000001 	bne	be6c <shellRun+0x34>
    be64:	e3e03000 	mvn	r3, #0
    be68:	ea000027 	b	bf0c <shellRun+0xd4>
    char active = shell->status.isActive;
    be6c:	e51b3010 	ldr	r3, [fp, #-16]
    be70:	e5d33060 	ldrb	r3, [r3, #96]	; 0x60
    be74:	e7e030d3 	ubfx	r3, r3, #1, #1
    be78:	e6ef3073 	uxtb	r3, r3
    be7c:	e54b3005 	strb	r3, [fp, #-5]
    if (strlen(cmd) > shell->parser.bufferSize - 1) {
    be80:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    be84:	eb001000 	bl	fe8c <strlen>
    be88:	e1a02000 	mov	r2, r0
    be8c:	e51b3010 	ldr	r3, [fp, #-16]
    be90:	e1d333b4 	ldrh	r3, [r3, #52]	; 0x34
    be94:	e2433001 	sub	r3, r3, #1
    be98:	e1520003 	cmp	r2, r3
    be9c:	9a000007 	bls	bec0 <shellRun+0x88>
        shellWriteString(shell, shellText[SHELL_TEXT_CMD_TOO_LONG]);
    bea0:	e30531b8 	movw	r3, #20920	; 0x51b8
    bea4:	e3403001 	movt	r3, #1
    bea8:	e5933000 	ldr	r3, [r3]
    beac:	e1a01003 	mov	r1, r3
    beb0:	e51b0010 	ldr	r0, [fp, #-16]
    beb4:	ebfff34d 	bl	8bf0 <shellWriteString>
        return -1;
    beb8:	e3e03000 	mvn	r3, #0
    bebc:	ea000012 	b	bf0c <shellRun+0xd4>
    } else {
        shell->parser.length = shellStringCopy(shell->parser.buffer, (char*)cmd);
    bec0:	e51b3010 	ldr	r3, [fp, #-16]
    bec4:	e5933010 	ldr	r3, [r3, #16]
    bec8:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    becc:	e1a00003 	mov	r0, r3
    bed0:	ebfff490 	bl	9118 <shellStringCopy>
    bed4:	e1a03000 	mov	r3, r0
    bed8:	e1a02003 	mov	r2, r3
    bedc:	e51b3010 	ldr	r3, [fp, #-16]
    bee0:	e1c320bc 	strh	r2, [r3, #12]
        shellExec(shell);
    bee4:	e51b0010 	ldr	r0, [fp, #-16]
    bee8:	ebfffced 	bl	b2a4 <shellExec>
        shell->status.isActive = active;
    beec:	e55b3005 	ldrb	r3, [fp, #-5]
    bef0:	e2033001 	and	r3, r3, #1
    bef4:	e6ef1073 	uxtb	r1, r3
    bef8:	e51b2010 	ldr	r2, [fp, #-16]
    befc:	e5d23060 	ldrb	r3, [r2, #96]	; 0x60
    bf00:	e7c13091 	bfi	r3, r1, #1, #1
    bf04:	e5c23060 	strb	r3, [r2, #96]	; 0x60
        return 0;
    bf08:	e3a03000 	mov	r3, #0
    }
}
    bf0c:	e1a00003 	mov	r0, r3
    bf10:	e24bd004 	sub	sp, fp, #4
    bf14:	e8bd8800 	pop	{fp, pc}

0000bf18 <shellLs>:

/**
 * @brief ls 打印当前路径下所有文件(文件系统调用)
 */
void shellLs(const char* path, ...)
{
    bf18:	e92d000f 	push	{r0, r1, r2, r3}
    bf1c:	e92d4800 	push	{fp, lr}
    bf20:	e28db004 	add	fp, sp, #4
    if (*path == '\0') {
    bf24:	e59b3004 	ldr	r3, [fp, #4]
    bf28:	e5d33000 	ldrb	r3, [r3]
    bf2c:	e3530000 	cmp	r3, #0
    bf30:	1a000002 	bne	bf40 <shellLs+0x28>
        path = ".";
    bf34:	e3043d18 	movw	r3, #19736	; 0x4d18
    bf38:	e3403001 	movt	r3, #1
    bf3c:	e58b3004 	str	r3, [fp, #4]
    }
    ls(&session_fs, (char*)path);
    bf40:	e59b1004 	ldr	r1, [fp, #4]
    bf44:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    bf48:	e3400001 	movt	r0, #1
    bf4c:	eb00031e 	bl	cbcc <ls>
}
    bf50:	e320f000 	nop	{0}
    bf54:	e24bd004 	sub	sp, fp, #4
    bf58:	e8bd4800 	pop	{fp, lr}
    bf5c:	e28dd010 	add	sp, sp, #16
    bf60:	e12fff1e 	bx	lr

0000bf64 <shellCd>:

/**
 * @brief cd 切换到指定路径下(文件系统调用)
 */
void shellCd(const char* path)
{
    bf64:	e92d4800 	push	{fp, lr}
    bf68:	e28db004 	add	fp, sp, #4
    bf6c:	e24dd008 	sub	sp, sp, #8
    bf70:	e50b0008 	str	r0, [fp, #-8]
    cd(&session_fs, (char*)path);
    bf74:	e51b1008 	ldr	r1, [fp, #-8]
    bf78:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    bf7c:	e3400001 	movt	r0, #1
    bf80:	eb000398 	bl	cde8 <cd>
}
    bf84:	e320f000 	nop	{0}
    bf88:	e24bd004 	sub	sp, fp, #4
    bf8c:	e8bd8800 	pop	{fp, pc}

0000bf90 <shellMkdir>:

/**
 * @brief mkdir 创建指定路径的一个目录(文件系统调用)
 */
void shellMkdir(const char* path)
{
    bf90:	e92d4800 	push	{fp, lr}
    bf94:	e28db004 	add	fp, sp, #4
    bf98:	e24dd008 	sub	sp, sp, #8
    bf9c:	e50b0008 	str	r0, [fp, #-8]
    mkdir(&session_fs, (char*)path);
    bfa0:	e51b1008 	ldr	r1, [fp, #-8]
    bfa4:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    bfa8:	e3400001 	movt	r0, #1
    bfac:	eb000414 	bl	d004 <mkdir>
}
    bfb0:	e320f000 	nop	{0}
    bfb4:	e24bd004 	sub	sp, fp, #4
    bfb8:	e8bd8800 	pop	{fp, pc}

0000bfbc <shellRm>:

/**
 * @brief Delete 删除指定路径的一个文件或者目录(文件系统调用)。如果是目录，默认删除目录下全部文件
 */
void shellRm(const char* path)
{
    bfbc:	e92d4800 	push	{fp, lr}
    bfc0:	e28db004 	add	fp, sp, #4
    bfc4:	e24dd008 	sub	sp, sp, #8
    bfc8:	e50b0008 	str	r0, [fp, #-8]
    rm(&session_fs, (char*)path);
    bfcc:	e51b1008 	ldr	r1, [fp, #-8]
    bfd0:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    bfd4:	e3400001 	movt	r0, #1
    bfd8:	eb000490 	bl	d220 <rm>
}
    bfdc:	e320f000 	nop	{0}
    bfe0:	e24bd004 	sub	sp, fp, #4
    bfe4:	e8bd8800 	pop	{fp, pc}

0000bfe8 <shellCat>:

/**
 * @brief Cat 将指定文件内容在控制台上打印出来(文件系统调用)
 */
void shellCat(const char* path)
{
    bfe8:	e92d4800 	push	{fp, lr}
    bfec:	e28db004 	add	fp, sp, #4
    bff0:	e24dd008 	sub	sp, sp, #8
    bff4:	e50b0008 	str	r0, [fp, #-8]
    cat(&session_fs, (char*)path);
    bff8:	e51b1008 	ldr	r1, [fp, #-8]
    bffc:	e3050ea8 	movw	r0, #24232	; 0x5ea8
    c000:	e3400001 	movt	r0, #1
    c004:	eb00050c 	bl	d43c <cat>
}
    c008:	e320f000 	nop	{0}
    c00c:	e24bd004 	sub	sp, fp, #4
    c010:	e8bd8800 	pop	{fp, pc}

0000c014 <shellShowTasks>:

/**
 * @brief 展示内核中全部tasks状态
 */
void shellShowTasks()
{
    c014:	e92d4800 	push	{fp, lr}
    c018:	e28db004 	add	fp, sp, #4
    show_task();
    c01c:	eb000b94 	bl	ee74 <show_task>
}
    c020:	e320f000 	nop	{0}
    c024:	e8bd8800 	pop	{fp, pc}

0000c028 <shellShowMemInfo>:

/**
 * @brief 展示当前内存信息
 */
void shellShowMemInfo()
{
    c028:	e92d4800 	push	{fp, lr}
    c02c:	e28db004 	add	fp, sp, #4
    show_mem();
    c030:	eb000b9d 	bl	eeac <show_mem>
}
    c034:	e320f000 	nop	{0}
    c038:	e8bd8800 	pop	{fp, pc}

0000c03c <shellShowCpusInfo>:

/**
 * @brief 展示当前cpu状态
 */
void shellShowCpusInfo()
{
    c03c:	e92d4800 	push	{fp, lr}
    c040:	e28db004 	add	fp, sp, #4
    show_cpu();
    c044:	eb000ba6 	bl	eee4 <show_cpu>
}
    c048:	e320f000 	nop	{0}
    c04c:	e8bd8800 	pop	{fp, pc}

0000c050 <shellExtNumType>:
 *
 * @param string Parameter string
 * @return NUM_Type Base
 */
static NUM_Type shellExtNumType(char* string)
{
    c050:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c054:	e28db000 	add	fp, sp, #0
    c058:	e24dd014 	sub	sp, sp, #20
    c05c:	e50b0010 	str	r0, [fp, #-16]
    char* p = string;
    c060:	e51b3010 	ldr	r3, [fp, #-16]
    c064:	e50b3008 	str	r3, [fp, #-8]
    NUM_Type type = NUM_TYPE_INT;
    c068:	e3a03000 	mov	r3, #0
    c06c:	e54b3009 	strb	r3, [fp, #-9]

    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    c070:	e51b3008 	ldr	r3, [fp, #-8]
    c074:	e5d33000 	ldrb	r3, [r3]
    c078:	e3530030 	cmp	r3, #48	; 0x30
    c07c:	1a00000c 	bne	c0b4 <shellExtNumType+0x64>
    c080:	e51b3008 	ldr	r3, [fp, #-8]
    c084:	e2833001 	add	r3, r3, #1
    c088:	e5d33000 	ldrb	r3, [r3]
    c08c:	e3530078 	cmp	r3, #120	; 0x78
    c090:	0a000004 	beq	c0a8 <shellExtNumType+0x58>
    c094:	e51b3008 	ldr	r3, [fp, #-8]
    c098:	e2833001 	add	r3, r3, #1
    c09c:	e5d33000 	ldrb	r3, [r3]
    c0a0:	e3530058 	cmp	r3, #88	; 0x58
    c0a4:	1a000002 	bne	c0b4 <shellExtNumType+0x64>
        type = NUM_TYPE_HEX;
    c0a8:	e3a03003 	mov	r3, #3
    c0ac:	e54b3009 	strb	r3, [fp, #-9]
    c0b0:	ea000016 	b	c110 <shellExtNumType+0xc0>
    } else if ((*p == '0') && ((*(p + 1) == 'b') || (*(p + 1) == 'B'))) {
    c0b4:	e51b3008 	ldr	r3, [fp, #-8]
    c0b8:	e5d33000 	ldrb	r3, [r3]
    c0bc:	e3530030 	cmp	r3, #48	; 0x30
    c0c0:	1a00000c 	bne	c0f8 <shellExtNumType+0xa8>
    c0c4:	e51b3008 	ldr	r3, [fp, #-8]
    c0c8:	e2833001 	add	r3, r3, #1
    c0cc:	e5d33000 	ldrb	r3, [r3]
    c0d0:	e3530062 	cmp	r3, #98	; 0x62
    c0d4:	0a000004 	beq	c0ec <shellExtNumType+0x9c>
    c0d8:	e51b3008 	ldr	r3, [fp, #-8]
    c0dc:	e2833001 	add	r3, r3, #1
    c0e0:	e5d33000 	ldrb	r3, [r3]
    c0e4:	e3530042 	cmp	r3, #66	; 0x42
    c0e8:	1a000002 	bne	c0f8 <shellExtNumType+0xa8>
        type = NUM_TYPE_BIN;
    c0ec:	e3a03001 	mov	r3, #1
    c0f0:	e54b3009 	strb	r3, [fp, #-9]
    c0f4:	ea000005 	b	c110 <shellExtNumType+0xc0>
    } else if (*p == '0') {
    c0f8:	e51b3008 	ldr	r3, [fp, #-8]
    c0fc:	e5d33000 	ldrb	r3, [r3]
    c100:	e3530030 	cmp	r3, #48	; 0x30
    c104:	1a00000e 	bne	c144 <shellExtNumType+0xf4>
        type = NUM_TYPE_OCT;
    c108:	e3a03002 	mov	r3, #2
    c10c:	e54b3009 	strb	r3, [fp, #-9]
    }

    while (*p++) {
    c110:	ea00000b 	b	c144 <shellExtNumType+0xf4>
        if (*p == '.' && *(p + 1) != 0) {
    c114:	e51b3008 	ldr	r3, [fp, #-8]
    c118:	e5d33000 	ldrb	r3, [r3]
    c11c:	e353002e 	cmp	r3, #46	; 0x2e
    c120:	1a000007 	bne	c144 <shellExtNumType+0xf4>
    c124:	e51b3008 	ldr	r3, [fp, #-8]
    c128:	e2833001 	add	r3, r3, #1
    c12c:	e5d33000 	ldrb	r3, [r3]
    c130:	e3530000 	cmp	r3, #0
    c134:	0a000002 	beq	c144 <shellExtNumType+0xf4>
            type = NUM_TYPE_FLOAT;
    c138:	e3a03004 	mov	r3, #4
    c13c:	e54b3009 	strb	r3, [fp, #-9]
            break;
    c140:	ea000005 	b	c15c <shellExtNumType+0x10c>
    while (*p++) {
    c144:	e51b3008 	ldr	r3, [fp, #-8]
    c148:	e2832001 	add	r2, r3, #1
    c14c:	e50b2008 	str	r2, [fp, #-8]
    c150:	e5d33000 	ldrb	r3, [r3]
    c154:	e3530000 	cmp	r3, #0
    c158:	1affffed 	bne	c114 <shellExtNumType+0xc4>
        }
    }

    return type;
    c15c:	e55b3009 	ldrb	r3, [fp, #-9]
}
    c160:	e1a00003 	mov	r0, r3
    c164:	e28bd000 	add	sp, fp, #0
    c168:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c16c:	e12fff1e 	bx	lr

0000c170 <shellExtToNum>:
 *
 * @param code character
 * @return char number
 */
static char shellExtToNum(char code)
{
    c170:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c174:	e28db000 	add	fp, sp, #0
    c178:	e24dd00c 	sub	sp, sp, #12
    c17c:	e1a03000 	mov	r3, r0
    c180:	e54b3005 	strb	r3, [fp, #-5]
    if ((code >= '0') && (code <= '9')) {
    c184:	e55b3005 	ldrb	r3, [fp, #-5]
    c188:	e353002f 	cmp	r3, #47	; 0x2f
    c18c:	9a000006 	bls	c1ac <shellExtToNum+0x3c>
    c190:	e55b3005 	ldrb	r3, [fp, #-5]
    c194:	e3530039 	cmp	r3, #57	; 0x39
    c198:	8a000003 	bhi	c1ac <shellExtToNum+0x3c>
        return code - '0';
    c19c:	e55b3005 	ldrb	r3, [fp, #-5]
    c1a0:	e2433030 	sub	r3, r3, #48	; 0x30
    c1a4:	e6ef3073 	uxtb	r3, r3
    c1a8:	ea000014 	b	c200 <shellExtToNum+0x90>
    } else if ((code >= 'a') && (code <= 'f')) {
    c1ac:	e55b3005 	ldrb	r3, [fp, #-5]
    c1b0:	e3530060 	cmp	r3, #96	; 0x60
    c1b4:	9a000006 	bls	c1d4 <shellExtToNum+0x64>
    c1b8:	e55b3005 	ldrb	r3, [fp, #-5]
    c1bc:	e3530066 	cmp	r3, #102	; 0x66
    c1c0:	8a000003 	bhi	c1d4 <shellExtToNum+0x64>
        return code - 'a' + 10;
    c1c4:	e55b3005 	ldrb	r3, [fp, #-5]
    c1c8:	e2433057 	sub	r3, r3, #87	; 0x57
    c1cc:	e6ef3073 	uxtb	r3, r3
    c1d0:	ea00000a 	b	c200 <shellExtToNum+0x90>
    } else if ((code >= 'A') && (code <= 'F')) {
    c1d4:	e55b3005 	ldrb	r3, [fp, #-5]
    c1d8:	e3530040 	cmp	r3, #64	; 0x40
    c1dc:	9a000006 	bls	c1fc <shellExtToNum+0x8c>
    c1e0:	e55b3005 	ldrb	r3, [fp, #-5]
    c1e4:	e3530046 	cmp	r3, #70	; 0x46
    c1e8:	8a000003 	bhi	c1fc <shellExtToNum+0x8c>
        return code - 'A' + 10;
    c1ec:	e55b3005 	ldrb	r3, [fp, #-5]
    c1f0:	e2433037 	sub	r3, r3, #55	; 0x37
    c1f4:	e6ef3073 	uxtb	r3, r3
    c1f8:	ea000000 	b	c200 <shellExtToNum+0x90>
    } else {
        return 0;
    c1fc:	e3a03000 	mov	r3, #0
    }
}
    c200:	e1a00003 	mov	r0, r3
    c204:	e28bd000 	add	sp, fp, #0
    c208:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c20c:	e12fff1e 	bx	lr

0000c210 <shellExtParseChar>:
 *
 * @param string String parameter
 * @return char Parsed character
 */
static char shellExtParseChar(char* string)
{
    c210:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c214:	e28db000 	add	fp, sp, #0
    c218:	e24dd014 	sub	sp, sp, #20
    c21c:	e50b0010 	str	r0, [fp, #-16]
    char* p = string + 1;
    c220:	e51b3010 	ldr	r3, [fp, #-16]
    c224:	e2833001 	add	r3, r3, #1
    c228:	e50b300c 	str	r3, [fp, #-12]
    char value = 0;
    c22c:	e3a03000 	mov	r3, #0
    c230:	e54b3005 	strb	r3, [fp, #-5]

    if (*p == '\\') {
    c234:	e51b300c 	ldr	r3, [fp, #-12]
    c238:	e5d33000 	ldrb	r3, [r3]
    c23c:	e353005c 	cmp	r3, #92	; 0x5c
    c240:	1a000024 	bne	c2d8 <shellExtParseChar+0xc8>
        switch (*(p + 1)) {
    c244:	e51b300c 	ldr	r3, [fp, #-12]
    c248:	e2833001 	add	r3, r3, #1
    c24c:	e5d33000 	ldrb	r3, [r3]
    c250:	e353006e 	cmp	r3, #110	; 0x6e
    c254:	0a000011 	beq	c2a0 <shellExtParseChar+0x90>
    c258:	e353006e 	cmp	r3, #110	; 0x6e
    c25c:	ca000004 	bgt	c274 <shellExtParseChar+0x64>
    c260:	e3530030 	cmp	r3, #48	; 0x30
    c264:	0a000013 	beq	c2b8 <shellExtParseChar+0xa8>
    c268:	e3530062 	cmp	r3, #98	; 0x62
    c26c:	0a000005 	beq	c288 <shellExtParseChar+0x78>
    c270:	ea000013 	b	c2c4 <shellExtParseChar+0xb4>
    c274:	e3530072 	cmp	r3, #114	; 0x72
    c278:	0a000005 	beq	c294 <shellExtParseChar+0x84>
    c27c:	e3530074 	cmp	r3, #116	; 0x74
    c280:	0a000009 	beq	c2ac <shellExtParseChar+0x9c>
    c284:	ea00000e 	b	c2c4 <shellExtParseChar+0xb4>
        case 'b':
            value = '\b';
    c288:	e3a03008 	mov	r3, #8
    c28c:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c290:	ea000013 	b	c2e4 <shellExtParseChar+0xd4>
        case 'r':
            value = '\r';
    c294:	e3a0300d 	mov	r3, #13
    c298:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c29c:	ea000010 	b	c2e4 <shellExtParseChar+0xd4>
        case 'n':
            value = '\n';
    c2a0:	e3a0300a 	mov	r3, #10
    c2a4:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c2a8:	ea00000d 	b	c2e4 <shellExtParseChar+0xd4>
        case 't':
            value = '\t';
    c2ac:	e3a03009 	mov	r3, #9
    c2b0:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c2b4:	ea00000a 	b	c2e4 <shellExtParseChar+0xd4>
        case '0':
            value = 0;
    c2b8:	e3a03000 	mov	r3, #0
    c2bc:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c2c0:	ea000007 	b	c2e4 <shellExtParseChar+0xd4>
        default:
            value = *(p + 1);
    c2c4:	e51b300c 	ldr	r3, [fp, #-12]
    c2c8:	e5d33001 	ldrb	r3, [r3, #1]
    c2cc:	e54b3005 	strb	r3, [fp, #-5]
            break;
    c2d0:	e320f000 	nop	{0}
    c2d4:	ea000002 	b	c2e4 <shellExtParseChar+0xd4>
        }
    } else {
        value = *p;
    c2d8:	e51b300c 	ldr	r3, [fp, #-12]
    c2dc:	e5d33000 	ldrb	r3, [r3]
    c2e0:	e54b3005 	strb	r3, [fp, #-5]
    }
    return value;
    c2e4:	e55b3005 	ldrb	r3, [fp, #-5]
}
    c2e8:	e1a00003 	mov	r0, r3
    c2ec:	e28bd000 	add	sp, fp, #0
    c2f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c2f4:	e12fff1e 	bx	lr

0000c2f8 <shellExtParseString>:
 *
 * @param string String parameter
 * @return char* Parsed string
 */
static char* shellExtParseString(char* string)
{
    c2f8:	e92d4810 	push	{r4, fp, lr}
    c2fc:	e28db008 	add	fp, sp, #8
    c300:	e24dd014 	sub	sp, sp, #20
    c304:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    char* p = string;
    c308:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c30c:	e50b3010 	str	r3, [fp, #-16]
    unsigned short index = 0;
    c310:	e3a03000 	mov	r3, #0
    c314:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee

    if (*string == '\"') {
    c318:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c31c:	e5d33000 	ldrb	r3, [r3]
    c320:	e3530022 	cmp	r3, #34	; 0x22
    c324:	1a00002c 	bne	c3dc <shellExtParseString+0xe4>
        p = ++string;
    c328:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c32c:	e2833001 	add	r3, r3, #1
    c330:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c334:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c338:	e50b3010 	str	r3, [fp, #-16]
    }

    while (*p) {
    c33c:	ea000026 	b	c3dc <shellExtParseString+0xe4>
        if (*p == '\\') {
    c340:	e51b3010 	ldr	r3, [fp, #-16]
    c344:	e5d33000 	ldrb	r3, [r3]
    c348:	e353005c 	cmp	r3, #92	; 0x5c
    c34c:	1a00000c 	bne	c384 <shellExtParseString+0x8c>
            *(string + index) = shellExtParseChar(p - 1);
    c350:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    c354:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c358:	e0824003 	add	r4, r2, r3
    c35c:	e51b3010 	ldr	r3, [fp, #-16]
    c360:	e2433001 	sub	r3, r3, #1
    c364:	e1a00003 	mov	r0, r3
    c368:	ebffffa8 	bl	c210 <shellExtParseChar>
    c36c:	e1a03000 	mov	r3, r0
    c370:	e5c43000 	strb	r3, [r4]
            p++;
    c374:	e51b3010 	ldr	r3, [fp, #-16]
    c378:	e2833001 	add	r3, r3, #1
    c37c:	e50b3010 	str	r3, [fp, #-16]
    c380:	ea00000f 	b	c3c4 <shellExtParseString+0xcc>
        } else if (*p == '\"') {
    c384:	e51b3010 	ldr	r3, [fp, #-16]
    c388:	e5d33000 	ldrb	r3, [r3]
    c38c:	e3530022 	cmp	r3, #34	; 0x22
    c390:	1a000005 	bne	c3ac <shellExtParseString+0xb4>
            *(string + index) = 0;
    c394:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    c398:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c39c:	e0823003 	add	r3, r2, r3
    c3a0:	e3a02000 	mov	r2, #0
    c3a4:	e5c32000 	strb	r2, [r3]
    c3a8:	ea000005 	b	c3c4 <shellExtParseString+0xcc>
        } else {
            *(string + index) = *p;
    c3ac:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    c3b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c3b4:	e0823003 	add	r3, r2, r3
    c3b8:	e51b2010 	ldr	r2, [fp, #-16]
    c3bc:	e5d22000 	ldrb	r2, [r2]
    c3c0:	e5c32000 	strb	r2, [r3]
        }
        p++;
    c3c4:	e51b3010 	ldr	r3, [fp, #-16]
    c3c8:	e2833001 	add	r3, r3, #1
    c3cc:	e50b3010 	str	r3, [fp, #-16]
        index++;
    c3d0:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    c3d4:	e2833001 	add	r3, r3, #1
    c3d8:	e14b31b2 	strh	r3, [fp, #-18]	; 0xffffffee
    while (*p) {
    c3dc:	e51b3010 	ldr	r3, [fp, #-16]
    c3e0:	e5d33000 	ldrb	r3, [r3]
    c3e4:	e3530000 	cmp	r3, #0
    c3e8:	1affffd4 	bne	c340 <shellExtParseString+0x48>
    }
    *(string + index) = 0;
    c3ec:	e15b31b2 	ldrh	r3, [fp, #-18]	; 0xffffffee
    c3f0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c3f4:	e0823003 	add	r3, r2, r3
    c3f8:	e3a02000 	mov	r2, #0
    c3fc:	e5c32000 	strb	r2, [r3]
    return string;
    c400:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    c404:	e1a00003 	mov	r0, r3
    c408:	e24bd008 	sub	sp, fp, #8
    c40c:	e8bd8810 	pop	{r4, fp, pc}

0000c410 <shellExtParseNumber>:
 *
 * @param string String parameter
 * @return unsigned int Parsed number
 */
static unsigned int shellExtParseNumber(char* string)
{
    c410:	e92d4810 	push	{r4, fp, lr}
    c414:	e28db008 	add	fp, sp, #8
    c418:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    c41c:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    NUM_Type type = NUM_TYPE_INT;
    c420:	e3a03000 	mov	r3, #0
    c424:	e54b3021 	strb	r3, [fp, #-33]	; 0xffffffdf
    char radix = 10;
    c428:	e3a0300a 	mov	r3, #10
    c42c:	e54b300d 	strb	r3, [fp, #-13]
    char* p = string;
    c430:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    c434:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    char offset = 0;
    c438:	e3a03000 	mov	r3, #0
    c43c:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    signed char sign = 1;
    c440:	e3a03001 	mov	r3, #1
    c444:	e54b3016 	strb	r3, [fp, #-22]	; 0xffffffea
    unsigned int valueInt = 0;
    c448:	e3a03000 	mov	r3, #0
    c44c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    float valueFloat = 0.0;
    c450:	e3a03000 	mov	r3, #0
    c454:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    unsigned int devide = 0;
    c458:	e3a03000 	mov	r3, #0
    c45c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0

    if (*string == '-') {
    c460:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    c464:	e5d33000 	ldrb	r3, [r3]
    c468:	e353002d 	cmp	r3, #45	; 0x2d
    c46c:	1a000001 	bne	c478 <shellExtParseNumber+0x68>
        sign = -1;
    c470:	e3e03000 	mvn	r3, #0
    c474:	e54b3016 	strb	r3, [fp, #-22]	; 0xffffffea
    }

    type = shellExtNumType(string + ((sign == -1) ? 1 : 0));
    c478:	e15b31d6 	ldrsb	r3, [fp, #-22]	; 0xffffffea
    c47c:	e3730001 	cmn	r3, #1
    c480:	1a000001 	bne	c48c <shellExtParseNumber+0x7c>
    c484:	e3a03001 	mov	r3, #1
    c488:	ea000000 	b	c490 <shellExtParseNumber+0x80>
    c48c:	e3a03000 	mov	r3, #0
    c490:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    c494:	e0823003 	add	r3, r2, r3
    c498:	e1a00003 	mov	r0, r3
    c49c:	ebfffeeb 	bl	c050 <shellExtNumType>
    c4a0:	e1a03000 	mov	r3, r0
    c4a4:	e54b3021 	strb	r3, [fp, #-33]	; 0xffffffdf

    switch ((char)type) {
    c4a8:	e55b3021 	ldrb	r3, [fp, #-33]	; 0xffffffdf
    c4ac:	e3530002 	cmp	r3, #2
    c4b0:	0a000009 	beq	c4dc <shellExtParseNumber+0xcc>
    c4b4:	e3530003 	cmp	r3, #3
    c4b8:	0a000002 	beq	c4c8 <shellExtParseNumber+0xb8>
    c4bc:	e3530001 	cmp	r3, #1
    c4c0:	0a00000a 	beq	c4f0 <shellExtParseNumber+0xe0>
        radix = 2;
        offset = 2;
        break;

    default:
        break;
    c4c4:	ea00000e 	b	c504 <shellExtParseNumber+0xf4>
        radix = 16;
    c4c8:	e3a03010 	mov	r3, #16
    c4cc:	e54b300d 	strb	r3, [fp, #-13]
        offset = 2;
    c4d0:	e3a03002 	mov	r3, #2
    c4d4:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
        break;
    c4d8:	ea000009 	b	c504 <shellExtParseNumber+0xf4>
        radix = 8;
    c4dc:	e3a03008 	mov	r3, #8
    c4e0:	e54b300d 	strb	r3, [fp, #-13]
        offset = 1;
    c4e4:	e3a03001 	mov	r3, #1
    c4e8:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
        break;
    c4ec:	ea000004 	b	c504 <shellExtParseNumber+0xf4>
        radix = 2;
    c4f0:	e3a03002 	mov	r3, #2
    c4f4:	e54b300d 	strb	r3, [fp, #-13]
        offset = 2;
    c4f8:	e3a03002 	mov	r3, #2
    c4fc:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
        break;
    c500:	e320f000 	nop	{0}
    }

    p = string + offset + ((sign == -1) ? 1 : 0);
    c504:	e55b2015 	ldrb	r2, [fp, #-21]	; 0xffffffeb
    c508:	e15b31d6 	ldrsb	r3, [fp, #-22]	; 0xffffffea
    c50c:	e3730001 	cmn	r3, #1
    c510:	1a000001 	bne	c51c <shellExtParseNumber+0x10c>
    c514:	e3a03001 	mov	r3, #1
    c518:	ea000000 	b	c520 <shellExtParseNumber+0x110>
    c51c:	e3a03000 	mov	r3, #0
    c520:	e0823003 	add	r3, r2, r3
    c524:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    c528:	e0823003 	add	r3, r2, r3
    c52c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

    while (*p) {
    c530:	ea00001c 	b	c5a8 <shellExtParseNumber+0x198>
        if (*p == '.') {
    c534:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c538:	e5d33000 	ldrb	r3, [r3]
    c53c:	e353002e 	cmp	r3, #46	; 0x2e
    c540:	1a000005 	bne	c55c <shellExtParseNumber+0x14c>
            devide = 1;
    c544:	e3a03001 	mov	r3, #1
    c548:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
            p++;
    c54c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c550:	e2833001 	add	r3, r3, #1
    c554:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            continue;
    c558:	ea000012 	b	c5a8 <shellExtParseNumber+0x198>
        }
        valueInt = valueInt * radix + shellExtToNum(*p);
    c55c:	e55b300d 	ldrb	r3, [fp, #-13]
    c560:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c564:	e0040392 	mul	r4, r2, r3
    c568:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c56c:	e5d33000 	ldrb	r3, [r3]
    c570:	e1a00003 	mov	r0, r3
    c574:	ebfffefd 	bl	c170 <shellExtToNum>
    c578:	e1a03000 	mov	r3, r0
    c57c:	e0843003 	add	r3, r4, r3
    c580:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
        devide *= 10;
    c584:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    c588:	e1a03002 	mov	r3, r2
    c58c:	e1a03103 	lsl	r3, r3, #2
    c590:	e0833002 	add	r3, r3, r2
    c594:	e1a03083 	lsl	r3, r3, #1
    c598:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        p++;
    c59c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c5a0:	e2833001 	add	r3, r3, #1
    c5a4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    while (*p) {
    c5a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c5ac:	e5d33000 	ldrb	r3, [r3]
    c5b0:	e3530000 	cmp	r3, #0
    c5b4:	1affffde 	bne	c534 <shellExtParseNumber+0x124>
    }
    if (type == NUM_TYPE_FLOAT && devide != 0) {
    c5b8:	e55b3021 	ldrb	r3, [fp, #-33]	; 0xffffffdf
    c5bc:	e3530004 	cmp	r3, #4
    c5c0:	1a000019 	bne	c62c <shellExtParseNumber+0x21c>
    c5c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    c5c8:	e3530000 	cmp	r3, #0
    c5cc:	0a000016 	beq	c62c <shellExtParseNumber+0x21c>
        valueFloat = (float)valueInt / devide * sign;
    c5d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    c5d4:	eb000b7c 	bl	f3cc <__aeabi_ui2f>
    c5d8:	e1a04000 	mov	r4, r0
    c5dc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    c5e0:	eb000b79 	bl	f3cc <__aeabi_ui2f>
    c5e4:	e1a03000 	mov	r3, r0
    c5e8:	e1a01003 	mov	r1, r3
    c5ec:	e1a00004 	mov	r0, r4
    c5f0:	eb000c14 	bl	f648 <__aeabi_fdiv>
    c5f4:	e1a03000 	mov	r3, r0
    c5f8:	e1a04003 	mov	r4, r3
    c5fc:	e15b31d6 	ldrsb	r3, [fp, #-22]	; 0xffffffea
    c600:	e1a00003 	mov	r0, r3
    c604:	eb000b72 	bl	f3d4 <__aeabi_i2f>
    c608:	e1a03000 	mov	r3, r0
    c60c:	e1a01003 	mov	r1, r3
    c610:	e1a00004 	mov	r0, r4
    c614:	eb000ba5 	bl	f4b0 <__aeabi_fmul>
    c618:	e1a03000 	mov	r3, r0
    c61c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
        return *(unsigned int*)(&valueFloat);
    c620:	e24b3028 	sub	r3, fp, #40	; 0x28
    c624:	e5933000 	ldr	r3, [r3]
    c628:	ea000002 	b	c638 <shellExtParseNumber+0x228>
    } else {
        return valueInt * sign;
    c62c:	e15b31d6 	ldrsb	r3, [fp, #-22]	; 0xffffffea
    c630:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c634:	e0030392 	mul	r3, r2, r3
    }
}
    c638:	e1a00003 	mov	r0, r3
    c63c:	e24bd008 	sub	sp, fp, #8
    c640:	e8bd8810 	pop	{r4, fp, pc}

0000c644 <shellExtParseVar>:
 * @param shell shell object
 * @param var variable
 * @return unsigned int variable value
 */
static unsigned int shellExtParseVar(Shell* shell, char* var)
{
    c644:	e92d4800 	push	{fp, lr}
    c648:	e28db004 	add	fp, sp, #4
    c64c:	e24dd010 	sub	sp, sp, #16
    c650:	e50b0010 	str	r0, [fp, #-16]
    c654:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    ShellCommand* command = shellSeekCommand(shell,
        var + 1,
    c658:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c65c:	e2831001 	add	r1, r3, #1
        shell->commandList.base,
    c660:	e51b3010 	ldr	r3, [fp, #-16]
    c664:	e5932058 	ldr	r2, [r3, #88]	; 0x58
    ShellCommand* command = shellSeekCommand(shell,
    c668:	e3a03000 	mov	r3, #0
    c66c:	e51b0010 	ldr	r0, [fp, #-16]
    c670:	ebfff7a2 	bl	a500 <shellSeekCommand>
    c674:	e50b0008 	str	r0, [fp, #-8]
        0);
    if (command) {
    c678:	e51b3008 	ldr	r3, [fp, #-8]
    c67c:	e3530000 	cmp	r3, #0
    c680:	0a000004 	beq	c698 <shellExtParseVar+0x54>
        return shellGetVarValue(shell, command);
    c684:	e51b1008 	ldr	r1, [fp, #-8]
    c688:	e51b0010 	ldr	r0, [fp, #-16]
    c68c:	ebfff7f0 	bl	a654 <shellGetVarValue>
    c690:	e1a03000 	mov	r3, r0
    c694:	ea000000 	b	c69c <shellExtParseVar+0x58>
    } else {
        return 0;
    c698:	e3a03000 	mov	r3, #0
    }
}
    c69c:	e1a00003 	mov	r0, r3
    c6a0:	e24bd004 	sub	sp, fp, #4
    c6a4:	e8bd8800 	pop	{fp, pc}

0000c6a8 <shellExtParsePara>:
 * @param shell shell
 * @param string parameter
 * @return unsigned int Analysis result
 */
unsigned int shellExtParsePara(Shell* shell, char* string)
{
    c6a8:	e92d4800 	push	{fp, lr}
    c6ac:	e28db004 	add	fp, sp, #4
    c6b0:	e24dd008 	sub	sp, sp, #8
    c6b4:	e50b0008 	str	r0, [fp, #-8]
    c6b8:	e50b100c 	str	r1, [fp, #-12]
    if (*string == '\'' && *(string + 1)) {
    c6bc:	e51b300c 	ldr	r3, [fp, #-12]
    c6c0:	e5d33000 	ldrb	r3, [r3]
    c6c4:	e3530027 	cmp	r3, #39	; 0x27
    c6c8:	1a000008 	bne	c6f0 <shellExtParsePara+0x48>
    c6cc:	e51b300c 	ldr	r3, [fp, #-12]
    c6d0:	e2833001 	add	r3, r3, #1
    c6d4:	e5d33000 	ldrb	r3, [r3]
    c6d8:	e3530000 	cmp	r3, #0
    c6dc:	0a000003 	beq	c6f0 <shellExtParsePara+0x48>
        return (unsigned int)shellExtParseChar(string);
    c6e0:	e51b000c 	ldr	r0, [fp, #-12]
    c6e4:	ebfffec9 	bl	c210 <shellExtParseChar>
    c6e8:	e1a03000 	mov	r3, r0
    c6ec:	ea000026 	b	c78c <shellExtParsePara+0xe4>
    } else if (*string == '-' || (*string >= '0' && *string <= '9')) {
    c6f0:	e51b300c 	ldr	r3, [fp, #-12]
    c6f4:	e5d33000 	ldrb	r3, [r3]
    c6f8:	e353002d 	cmp	r3, #45	; 0x2d
    c6fc:	0a000007 	beq	c720 <shellExtParsePara+0x78>
    c700:	e51b300c 	ldr	r3, [fp, #-12]
    c704:	e5d33000 	ldrb	r3, [r3]
    c708:	e353002f 	cmp	r3, #47	; 0x2f
    c70c:	9a000007 	bls	c730 <shellExtParsePara+0x88>
    c710:	e51b300c 	ldr	r3, [fp, #-12]
    c714:	e5d33000 	ldrb	r3, [r3]
    c718:	e3530039 	cmp	r3, #57	; 0x39
    c71c:	8a000003 	bhi	c730 <shellExtParsePara+0x88>
        return (unsigned int)shellExtParseNumber(string);
    c720:	e51b000c 	ldr	r0, [fp, #-12]
    c724:	ebffff39 	bl	c410 <shellExtParseNumber>
    c728:	e1a03000 	mov	r3, r0
    c72c:	ea000016 	b	c78c <shellExtParsePara+0xe4>
    } else if (*string == '$' && *(string + 1)) {
    c730:	e51b300c 	ldr	r3, [fp, #-12]
    c734:	e5d33000 	ldrb	r3, [r3]
    c738:	e3530024 	cmp	r3, #36	; 0x24
    c73c:	1a000009 	bne	c768 <shellExtParsePara+0xc0>
    c740:	e51b300c 	ldr	r3, [fp, #-12]
    c744:	e2833001 	add	r3, r3, #1
    c748:	e5d33000 	ldrb	r3, [r3]
    c74c:	e3530000 	cmp	r3, #0
    c750:	0a000004 	beq	c768 <shellExtParsePara+0xc0>
        return shellExtParseVar(shell, string);
    c754:	e51b100c 	ldr	r1, [fp, #-12]
    c758:	e51b0008 	ldr	r0, [fp, #-8]
    c75c:	ebffffb8 	bl	c644 <shellExtParseVar>
    c760:	e1a03000 	mov	r3, r0
    c764:	ea000008 	b	c78c <shellExtParsePara+0xe4>
    } else if (*string) {
    c768:	e51b300c 	ldr	r3, [fp, #-12]
    c76c:	e5d33000 	ldrb	r3, [r3]
    c770:	e3530000 	cmp	r3, #0
    c774:	0a000003 	beq	c788 <shellExtParsePara+0xe0>
        return (unsigned long)shellExtParseString(string);
    c778:	e51b000c 	ldr	r0, [fp, #-12]
    c77c:	ebfffedd 	bl	c2f8 <shellExtParseString>
    c780:	e1a03000 	mov	r3, r0
    c784:	ea000000 	b	c78c <shellExtParsePara+0xe4>
    }
    return 0;
    c788:	e3a03000 	mov	r3, #0
}
    c78c:	e1a00003 	mov	r0, r3
    c790:	e24bd004 	sub	sp, fp, #4
    c794:	e8bd8800 	pop	{fp, pc}

0000c798 <shellExtRun>:
 * @param argc Number of parameters
 * @param argv parameter
 * @return int return value
 */
int shellExtRun(Shell* shell, ShellCommand* command, int argc, char* argv[])
{
    c798:	e92d4830 	push	{r4, r5, fp, lr}
    c79c:	e28db00c 	add	fp, sp, #12
    c7a0:	e24dd048 	sub	sp, sp, #72	; 0x48
    c7a4:	e50b0038 	str	r0, [fp, #-56]	; 0xffffffc8
    c7a8:	e50b103c 	str	r1, [fp, #-60]	; 0xffffffc4
    c7ac:	e50b2040 	str	r2, [fp, #-64]	; 0xffffffc0
    c7b0:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    unsigned int params[8] = { 0 };
    c7b4:	e24b3034 	sub	r3, fp, #52	; 0x34
    c7b8:	e3a02020 	mov	r2, #32
    c7bc:	e3a01000 	mov	r1, #0
    c7c0:	e1a00003 	mov	r0, r3
    c7c4:	eb000ce2 	bl	fb54 <memset>
    int paramNum = command->attr.attrs.paramNum > (argc - 1) ? command->attr.attrs.paramNum : (argc - 1);
    c7c8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    c7cc:	e2433001 	sub	r3, r3, #1
    c7d0:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
    c7d4:	e5d22002 	ldrb	r2, [r2, #2]
    c7d8:	e7e32052 	ubfx	r2, r2, #0, #4
    c7dc:	e6ef2072 	uxtb	r2, r2
    c7e0:	e1530002 	cmp	r3, r2
    c7e4:	a1a03003 	movge	r3, r3
    c7e8:	b1a03002 	movlt	r3, r2
    c7ec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (int i = 0; i < argc - 1; i++) {
    c7f0:	e3a03000 	mov	r3, #0
    c7f4:	e50b3010 	str	r3, [fp, #-16]
    c7f8:	ea000011 	b	c844 <shellExtRun+0xac>
        params[i] = shellExtParsePara(shell, argv[i + 1]);
    c7fc:	e51b3010 	ldr	r3, [fp, #-16]
    c800:	e2833001 	add	r3, r3, #1
    c804:	e1a03103 	lsl	r3, r3, #2
    c808:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    c80c:	e0823003 	add	r3, r2, r3
    c810:	e5933000 	ldr	r3, [r3]
    c814:	e1a01003 	mov	r1, r3
    c818:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    c81c:	ebffffa1 	bl	c6a8 <shellExtParsePara>
    c820:	e1a02000 	mov	r2, r0
    c824:	e51b3010 	ldr	r3, [fp, #-16]
    c828:	e1a03103 	lsl	r3, r3, #2
    c82c:	e24b100c 	sub	r1, fp, #12
    c830:	e0813003 	add	r3, r1, r3
    c834:	e5032028 	str	r2, [r3, #-40]	; 0xffffffd8
    for (int i = 0; i < argc - 1; i++) {
    c838:	e51b3010 	ldr	r3, [fp, #-16]
    c83c:	e2833001 	add	r3, r3, #1
    c840:	e50b3010 	str	r3, [fp, #-16]
    c844:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    c848:	e2432001 	sub	r2, r3, #1
    c84c:	e51b3010 	ldr	r3, [fp, #-16]
    c850:	e1520003 	cmp	r2, r3
    c854:	caffffe8 	bgt	c7fc <shellExtRun+0x64>
    }
    switch (paramNum) {
    c858:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c85c:	e3530007 	cmp	r3, #7
    c860:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    c864:	ea000059 	b	c9d0 <shellExtRun+0x238>
    c868:	0000c888 	.word	0x0000c888
    c86c:	0000c89c 	.word	0x0000c89c
    c870:	0000c8b8 	.word	0x0000c8b8
    c874:	0000c8d8 	.word	0x0000c8d8
    c878:	0000c8f8 	.word	0x0000c8f8
    c87c:	0000c91c 	.word	0x0000c91c
    c880:	0000c94c 	.word	0x0000c94c
    c884:	0000c988 	.word	0x0000c988
    case 0:
        return command->data.cmd.function();
    c888:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c88c:	e5933008 	ldr	r3, [r3, #8]
    c890:	e12fff33 	blx	r3
    c894:	e1a03000 	mov	r3, r0
    c898:	ea00004d 	b	c9d4 <shellExtRun+0x23c>
        // break;
    case 1:
        return command->data.cmd.function(params[0]);
    c89c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c8a0:	e5933008 	ldr	r3, [r3, #8]
    c8a4:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    c8a8:	e1a00002 	mov	r0, r2
    c8ac:	e12fff33 	blx	r3
    c8b0:	e1a03000 	mov	r3, r0
    c8b4:	ea000046 	b	c9d4 <shellExtRun+0x23c>
        // break;
    case 2:
        return command->data.cmd.function(params[0], params[1]);
    c8b8:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c8bc:	e5933008 	ldr	r3, [r3, #8]
    c8c0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    c8c4:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
    c8c8:	e1a00002 	mov	r0, r2
    c8cc:	e12fff33 	blx	r3
    c8d0:	e1a03000 	mov	r3, r0
    c8d4:	ea00003e 	b	c9d4 <shellExtRun+0x23c>
        // break;
    case 3:
        return command->data.cmd.function(params[0], params[1],
    c8d8:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c8dc:	e5933008 	ldr	r3, [r3, #8]
    c8e0:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    c8e4:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
    c8e8:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    c8ec:	e12fff33 	blx	r3
    c8f0:	e1a03000 	mov	r3, r0
    c8f4:	ea000036 	b	c9d4 <shellExtRun+0x23c>
            params[2]);
        // break;
    case 4:
        return command->data.cmd.function(params[0], params[1],
    c8f8:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c8fc:	e5934008 	ldr	r4, [r3, #8]
    c900:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    c904:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
    c908:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    c90c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    c910:	e12fff34 	blx	r4
    c914:	e1a03000 	mov	r3, r0
    c918:	ea00002d 	b	c9d4 <shellExtRun+0x23c>
            params[2], params[3]);
        // break;
    case 5:
        return command->data.cmd.function(params[0], params[1],
    c91c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c920:	e5934008 	ldr	r4, [r3, #8]
    c924:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    c928:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
    c92c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    c930:	e51bc028 	ldr	ip, [fp, #-40]	; 0xffffffd8
    c934:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c938:	e58d3000 	str	r3, [sp]
    c93c:	e1a0300c 	mov	r3, ip
    c940:	e12fff34 	blx	r4
    c944:	e1a03000 	mov	r3, r0
    c948:	ea000021 	b	c9d4 <shellExtRun+0x23c>
            params[2], params[3],
            params[4]);
        // break;
    case 6:
        return command->data.cmd.function(params[0], params[1],
    c94c:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c950:	e5934008 	ldr	r4, [r3, #8]
    c954:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    c958:	e51b1030 	ldr	r1, [fp, #-48]	; 0xffffffd0
    c95c:	e51bc02c 	ldr	ip, [fp, #-44]	; 0xffffffd4
    c960:	e51be028 	ldr	lr, [fp, #-40]	; 0xffffffd8
    c964:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c968:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    c96c:	e58d2004 	str	r2, [sp, #4]
    c970:	e58d3000 	str	r3, [sp]
    c974:	e1a0300e 	mov	r3, lr
    c978:	e1a0200c 	mov	r2, ip
    c97c:	e12fff34 	blx	r4
    c980:	e1a03000 	mov	r3, r0
    c984:	ea000012 	b	c9d4 <shellExtRun+0x23c>
            params[2], params[3],
            params[4], params[5]);
        // break;
    case 7:
        return command->data.cmd.function(params[0], params[1],
    c988:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    c98c:	e5934008 	ldr	r4, [r3, #8]
    c990:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    c994:	e51bc030 	ldr	ip, [fp, #-48]	; 0xffffffd0
    c998:	e51be02c 	ldr	lr, [fp, #-44]	; 0xffffffd4
    c99c:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    c9a0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c9a4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    c9a8:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    c9ac:	e58d1008 	str	r1, [sp, #8]
    c9b0:	e58d2004 	str	r2, [sp, #4]
    c9b4:	e58d3000 	str	r3, [sp]
    c9b8:	e1a03005 	mov	r3, r5
    c9bc:	e1a0200e 	mov	r2, lr
    c9c0:	e1a0100c 	mov	r1, ip
    c9c4:	e12fff34 	blx	r4
    c9c8:	e1a03000 	mov	r3, r0
    c9cc:	ea000000 	b	c9d4 <shellExtRun+0x23c>
            params[2], params[3],
            params[4], params[5],
            params[6]);
        // break;
    default:
        return -1;
    c9d0:	e3e03000 	mvn	r3, #0
        // break;
    }
}
    c9d4:	e1a00003 	mov	r0, r3
    c9d8:	e24bd00c 	sub	sp, fp, #12
    c9dc:	e8bd8830 	pop	{r4, r5, fp, pc}

0000c9e0 <ipc_call_copy_args_Ipc_ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs_to_client.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    c9e0:	e92d4800 	push	{fp, lr}
    c9e4:	e28db004 	add	fp, sp, #4
    c9e8:	e24dd048 	sub	sp, sp, #72	; 0x48
    c9ec:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    c9f0:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    c9f4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    c9f8:	e3530000 	cmp	r3, #0
    c9fc:	1a000001 	bne	ca08 <ipc_call_copy_args_Ipc_ls+0x28>
    ca00:	e3e03000 	mvn	r3, #0
    ca04:	ea00006d 	b	cbc0 <ipc_call_copy_args_Ipc_ls+0x1e0>
    ca08:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ca0c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    ca10:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ca14:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    ca18:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    ca1c:	eb000d1a 	bl	fe8c <strlen>
    ca20:	e1a03000 	mov	r3, r0
    ca24:	e2833001 	add	r3, r3, #1
    ca28:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    ca2c:	e24b3044 	sub	r3, fp, #68	; 0x44
    ca30:	e1a02003 	mov	r2, r3
    ca34:	e3a01001 	mov	r1, #1
    ca38:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    ca3c:	eb000510 	bl	de84 <new_ipc_msg>
    ca40:	e1a03000 	mov	r3, r0
    ca44:	e50b3008 	str	r3, [fp, #-8]
    ca48:	e51b3008 	ldr	r3, [fp, #-8]
    ca4c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    ca50:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ca54:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    ca58:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    ca5c:	eb000d0a 	bl	fe8c <strlen>
    ca60:	e1a03000 	mov	r3, r0
    ca64:	e2833001 	add	r3, r3, #1
    ca68:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    ca6c:	e3a01000 	mov	r1, #0
    ca70:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    ca74:	eb00056f 	bl	e038 <ipc_msg_set_nth_arg>
    ca78:	e3a03001 	mov	r3, #1
    ca7c:	e50b300c 	str	r3, [fp, #-12]
    ca80:	e51b3008 	ldr	r3, [fp, #-8]
    ca84:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    ca88:	e3a03001 	mov	r3, #1
    ca8c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
/// @param msg
/// @param opcode
/// @return
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
    ca90:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ca94:	e3530000 	cmp	r3, #0
    ca98:	ba000002 	blt	caa8 <ipc_call_copy_args_Ipc_ls+0xc8>
    ca9c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    caa0:	e35300ff 	cmp	r3, #255	; 0xff
    caa4:	da000001 	ble	cab0 <ipc_call_copy_args_Ipc_ls+0xd0>
        return false;
    caa8:	e3a03000 	mov	r3, #0
    caac:	ea000004 	b	cac4 <ipc_call_copy_args_Ipc_ls+0xe4>
    }
    msg->header.opcode = opcode;
    cab0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    cab4:	e6ef2073 	uxtb	r2, r3
    cab8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    cabc:	e5c32001 	strb	r2, [r3, #1]
    return true;
    cac0:	e3a03001 	mov	r3, #1
    cac4:	e50b300c 	str	r3, [fp, #-12]
    cac8:	e51b0008 	ldr	r0, [fp, #-8]
    cacc:	eb0005e1 	bl	e258 <ipc_msg_send_wait>
    cad0:	e51b3008 	ldr	r3, [fp, #-8]
    cad4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    cad8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    cadc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    cae0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    cae4:	eb000ce8 	bl	fe8c <strlen>
    cae8:	e1a03000 	mov	r3, r0
    caec:	e2833001 	add	r3, r3, #1
    caf0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    caf4:	e3a01000 	mov	r1, #0
    caf8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    cafc:	eb000595 	bl	e158 <ipc_msg_get_nth_arg>
    cb00:	e3a03001 	mov	r3, #1
    cb04:	e50b300c 	str	r3, [fp, #-12]
    cb08:	e3a03000 	mov	r3, #0
    cb0c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    cb10:	e51b3008 	ldr	r3, [fp, #-8]
    cb14:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    cb18:	e24b3040 	sub	r3, fp, #64	; 0x40
    cb1c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    cb20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cb24:	e5d33000 	ldrb	r3, [r3]
    cb28:	e2033002 	and	r3, r3, #2
    cb2c:	e6ef3073 	uxtb	r3, r3
    cb30:	e3530000 	cmp	r3, #0
    cb34:	1a000007 	bne	cb58 <ipc_call_copy_args_Ipc_ls+0x178>
    cb38:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    cb3c:	e3403001 	movt	r3, #1
    cb40:	e3042d84 	movw	r2, #19844	; 0x4d84
    cb44:	e3402001 	movt	r2, #1
    cb48:	e3a01074 	mov	r1, #116	; 0x74
    cb4c:	e3040d34 	movw	r0, #19764	; 0x4d34
    cb50:	e3400001 	movt	r0, #1
    cb54:	eb000b13 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    cb58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cb5c:	e2833008 	add	r3, r3, #8
    cb60:	e3a02004 	mov	r2, #4
    cb64:	e1a01003 	mov	r1, r3
    cb68:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    cb6c:	eb000b61 	bl	f8f8 <memcpy>
    cb70:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    cb74:	e50b3010 	str	r3, [fp, #-16]
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    cb78:	e51b3010 	ldr	r3, [fp, #-16]
    cb7c:	e5933010 	ldr	r3, [r3, #16]
    cb80:	e51b2010 	ldr	r2, [fp, #-16]
    cb84:	e5922008 	ldr	r2, [r2, #8]
    cb88:	e0833002 	add	r3, r3, r2
    cb8c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    cb90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cb94:	e5d33000 	ldrb	r3, [r3]
    cb98:	e2033004 	and	r3, r3, #4
    cb9c:	e6ef3073 	uxtb	r3, r3
    cba0:	e3530000 	cmp	r3, #0
    cba4:	0a000004 	beq	cbbc <ipc_call_copy_args_Ipc_ls+0x1dc>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    cba8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cbac:	e1d330b2 	ldrh	r3, [r3, #2]
    cbb0:	e1a01003 	mov	r1, r3
    cbb4:	e51b0010 	ldr	r0, [fp, #-16]
    cbb8:	eb0007a0 	bl	ea40 <session_free_buf>
    cbbc:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    cbc0:	e1a00003 	mov	r0, r3
    cbc4:	e24bd004 	sub	sp, fp, #4
    cbc8:	e8bd8800 	pop	{fp, pc}

0000cbcc <ls>:
int ls(struct Session* session, char* path)
{
    cbcc:	e92d4800 	push	{fp, lr}
    cbd0:	e28db004 	add	fp, sp, #4
    cbd4:	e24dd008 	sub	sp, sp, #8
    cbd8:	e50b0008 	str	r0, [fp, #-8]
    cbdc:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_ls)(session, path);
    cbe0:	e51b100c 	ldr	r1, [fp, #-12]
    cbe4:	e51b0008 	ldr	r0, [fp, #-8]
    cbe8:	ebffff7c 	bl	c9e0 <ipc_call_copy_args_Ipc_ls>
    cbec:	e1a03000 	mov	r3, r0
}
    cbf0:	e1a00003 	mov	r0, r3
    cbf4:	e24bd004 	sub	sp, fp, #4
    cbf8:	e8bd8800 	pop	{fp, pc}

0000cbfc <ipc_call_copy_args_Ipc_cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    cbfc:	e92d4800 	push	{fp, lr}
    cc00:	e28db004 	add	fp, sp, #4
    cc04:	e24dd048 	sub	sp, sp, #72	; 0x48
    cc08:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    cc0c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    cc10:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    cc14:	e3530000 	cmp	r3, #0
    cc18:	1a000001 	bne	cc24 <ipc_call_copy_args_Ipc_cd+0x28>
    cc1c:	e3e03000 	mvn	r3, #0
    cc20:	ea00006d 	b	cddc <ipc_call_copy_args_Ipc_cd+0x1e0>
    cc24:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    cc28:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    cc2c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    cc30:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    cc34:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    cc38:	eb000c93 	bl	fe8c <strlen>
    cc3c:	e1a03000 	mov	r3, r0
    cc40:	e2833001 	add	r3, r3, #1
    cc44:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    cc48:	e24b3044 	sub	r3, fp, #68	; 0x44
    cc4c:	e1a02003 	mov	r2, r3
    cc50:	e3a01001 	mov	r1, #1
    cc54:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    cc58:	eb000489 	bl	de84 <new_ipc_msg>
    cc5c:	e1a03000 	mov	r3, r0
    cc60:	e50b3008 	str	r3, [fp, #-8]
    cc64:	e51b3008 	ldr	r3, [fp, #-8]
    cc68:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    cc6c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    cc70:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    cc74:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    cc78:	eb000c83 	bl	fe8c <strlen>
    cc7c:	e1a03000 	mov	r3, r0
    cc80:	e2833001 	add	r3, r3, #1
    cc84:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    cc88:	e3a01000 	mov	r1, #0
    cc8c:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    cc90:	eb0004e8 	bl	e038 <ipc_msg_set_nth_arg>
    cc94:	e3a03001 	mov	r3, #1
    cc98:	e50b300c 	str	r3, [fp, #-12]
    cc9c:	e51b3008 	ldr	r3, [fp, #-8]
    cca0:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    cca4:	e3a03002 	mov	r3, #2
    cca8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    ccac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ccb0:	e3530000 	cmp	r3, #0
    ccb4:	ba000002 	blt	ccc4 <ipc_call_copy_args_Ipc_cd+0xc8>
    ccb8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ccbc:	e35300ff 	cmp	r3, #255	; 0xff
    ccc0:	da000001 	ble	cccc <ipc_call_copy_args_Ipc_cd+0xd0>
        return false;
    ccc4:	e3a03000 	mov	r3, #0
    ccc8:	ea000004 	b	cce0 <ipc_call_copy_args_Ipc_cd+0xe4>
    msg->header.opcode = opcode;
    cccc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ccd0:	e6ef2073 	uxtb	r2, r3
    ccd4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    ccd8:	e5c32001 	strb	r2, [r3, #1]
    return true;
    ccdc:	e3a03001 	mov	r3, #1
    cce0:	e50b300c 	str	r3, [fp, #-12]
    cce4:	e51b0008 	ldr	r0, [fp, #-8]
    cce8:	eb00055a 	bl	e258 <ipc_msg_send_wait>
    ccec:	e51b3008 	ldr	r3, [fp, #-8]
    ccf0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    ccf4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ccf8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    ccfc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    cd00:	eb000c61 	bl	fe8c <strlen>
    cd04:	e1a03000 	mov	r3, r0
    cd08:	e2833001 	add	r3, r3, #1
    cd0c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    cd10:	e3a01000 	mov	r1, #0
    cd14:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    cd18:	eb00050e 	bl	e158 <ipc_msg_get_nth_arg>
    cd1c:	e3a03001 	mov	r3, #1
    cd20:	e50b300c 	str	r3, [fp, #-12]
    cd24:	e3a03000 	mov	r3, #0
    cd28:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    cd2c:	e51b3008 	ldr	r3, [fp, #-8]
    cd30:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    cd34:	e24b3040 	sub	r3, fp, #64	; 0x40
    cd38:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    cd3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd40:	e5d33000 	ldrb	r3, [r3]
    cd44:	e2033002 	and	r3, r3, #2
    cd48:	e6ef3073 	uxtb	r3, r3
    cd4c:	e3530000 	cmp	r3, #0
    cd50:	1a000007 	bne	cd74 <ipc_call_copy_args_Ipc_cd+0x178>
    cd54:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    cd58:	e3403001 	movt	r3, #1
    cd5c:	e3042d84 	movw	r2, #19844	; 0x4d84
    cd60:	e3402001 	movt	r2, #1
    cd64:	e3a01074 	mov	r1, #116	; 0x74
    cd68:	e3040d34 	movw	r0, #19764	; 0x4d34
    cd6c:	e3400001 	movt	r0, #1
    cd70:	eb000a8c 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    cd74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd78:	e2833008 	add	r3, r3, #8
    cd7c:	e3a02004 	mov	r2, #4
    cd80:	e1a01003 	mov	r1, r3
    cd84:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    cd88:	eb000ada 	bl	f8f8 <memcpy>
    cd8c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    cd90:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    cd94:	e51b3010 	ldr	r3, [fp, #-16]
    cd98:	e5933010 	ldr	r3, [r3, #16]
    cd9c:	e51b2010 	ldr	r2, [fp, #-16]
    cda0:	e5922008 	ldr	r2, [r2, #8]
    cda4:	e0833002 	add	r3, r3, r2
    cda8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    cdac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cdb0:	e5d33000 	ldrb	r3, [r3]
    cdb4:	e2033004 	and	r3, r3, #4
    cdb8:	e6ef3073 	uxtb	r3, r3
    cdbc:	e3530000 	cmp	r3, #0
    cdc0:	0a000004 	beq	cdd8 <ipc_call_copy_args_Ipc_cd+0x1dc>
    return session_free_buf(session, msg->header.len);
    cdc4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cdc8:	e1d330b2 	ldrh	r3, [r3, #2]
    cdcc:	e1a01003 	mov	r1, r3
    cdd0:	e51b0010 	ldr	r0, [fp, #-16]
    cdd4:	eb000719 	bl	ea40 <session_free_buf>
    cdd8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    cddc:	e1a00003 	mov	r0, r3
    cde0:	e24bd004 	sub	sp, fp, #4
    cde4:	e8bd8800 	pop	{fp, pc}

0000cde8 <cd>:
int cd(struct Session* session, char* path)
{
    cde8:	e92d4800 	push	{fp, lr}
    cdec:	e28db004 	add	fp, sp, #4
    cdf0:	e24dd008 	sub	sp, sp, #8
    cdf4:	e50b0008 	str	r0, [fp, #-8]
    cdf8:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cd)(session, path);
    cdfc:	e51b100c 	ldr	r1, [fp, #-12]
    ce00:	e51b0008 	ldr	r0, [fp, #-8]
    ce04:	ebffff7c 	bl	cbfc <ipc_call_copy_args_Ipc_cd>
    ce08:	e1a03000 	mov	r3, r0
}
    ce0c:	e1a00003 	mov	r0, r3
    ce10:	e24bd004 	sub	sp, fp, #4
    ce14:	e8bd8800 	pop	{fp, pc}

0000ce18 <ipc_call_copy_args_Ipc_mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    ce18:	e92d4800 	push	{fp, lr}
    ce1c:	e28db004 	add	fp, sp, #4
    ce20:	e24dd048 	sub	sp, sp, #72	; 0x48
    ce24:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    ce28:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    ce2c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ce30:	e3530000 	cmp	r3, #0
    ce34:	1a000001 	bne	ce40 <ipc_call_copy_args_Ipc_mkdir+0x28>
    ce38:	e3e03000 	mvn	r3, #0
    ce3c:	ea00006d 	b	cff8 <ipc_call_copy_args_Ipc_mkdir+0x1e0>
    ce40:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    ce44:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    ce48:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ce4c:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    ce50:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    ce54:	eb000c0c 	bl	fe8c <strlen>
    ce58:	e1a03000 	mov	r3, r0
    ce5c:	e2833001 	add	r3, r3, #1
    ce60:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    ce64:	e24b3044 	sub	r3, fp, #68	; 0x44
    ce68:	e1a02003 	mov	r2, r3
    ce6c:	e3a01001 	mov	r1, #1
    ce70:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    ce74:	eb000402 	bl	de84 <new_ipc_msg>
    ce78:	e1a03000 	mov	r3, r0
    ce7c:	e50b3008 	str	r3, [fp, #-8]
    ce80:	e51b3008 	ldr	r3, [fp, #-8]
    ce84:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    ce88:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    ce8c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    ce90:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    ce94:	eb000bfc 	bl	fe8c <strlen>
    ce98:	e1a03000 	mov	r3, r0
    ce9c:	e2833001 	add	r3, r3, #1
    cea0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    cea4:	e3a01000 	mov	r1, #0
    cea8:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    ceac:	eb000461 	bl	e038 <ipc_msg_set_nth_arg>
    ceb0:	e3a03001 	mov	r3, #1
    ceb4:	e50b300c 	str	r3, [fp, #-12]
    ceb8:	e51b3008 	ldr	r3, [fp, #-8]
    cebc:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    cec0:	e3a03003 	mov	r3, #3
    cec4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    cec8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    cecc:	e3530000 	cmp	r3, #0
    ced0:	ba000002 	blt	cee0 <ipc_call_copy_args_Ipc_mkdir+0xc8>
    ced4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ced8:	e35300ff 	cmp	r3, #255	; 0xff
    cedc:	da000001 	ble	cee8 <ipc_call_copy_args_Ipc_mkdir+0xd0>
        return false;
    cee0:	e3a03000 	mov	r3, #0
    cee4:	ea000004 	b	cefc <ipc_call_copy_args_Ipc_mkdir+0xe4>
    msg->header.opcode = opcode;
    cee8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    ceec:	e6ef2073 	uxtb	r2, r3
    cef0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    cef4:	e5c32001 	strb	r2, [r3, #1]
    return true;
    cef8:	e3a03001 	mov	r3, #1
    cefc:	e50b300c 	str	r3, [fp, #-12]
    cf00:	e51b0008 	ldr	r0, [fp, #-8]
    cf04:	eb0004d3 	bl	e258 <ipc_msg_send_wait>
    cf08:	e51b3008 	ldr	r3, [fp, #-8]
    cf0c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    cf10:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    cf14:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    cf18:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    cf1c:	eb000bda 	bl	fe8c <strlen>
    cf20:	e1a03000 	mov	r3, r0
    cf24:	e2833001 	add	r3, r3, #1
    cf28:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    cf2c:	e3a01000 	mov	r1, #0
    cf30:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    cf34:	eb000487 	bl	e158 <ipc_msg_get_nth_arg>
    cf38:	e3a03001 	mov	r3, #1
    cf3c:	e50b300c 	str	r3, [fp, #-12]
    cf40:	e3a03000 	mov	r3, #0
    cf44:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    cf48:	e51b3008 	ldr	r3, [fp, #-8]
    cf4c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    cf50:	e24b3040 	sub	r3, fp, #64	; 0x40
    cf54:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    cf58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf5c:	e5d33000 	ldrb	r3, [r3]
    cf60:	e2033002 	and	r3, r3, #2
    cf64:	e6ef3073 	uxtb	r3, r3
    cf68:	e3530000 	cmp	r3, #0
    cf6c:	1a000007 	bne	cf90 <ipc_call_copy_args_Ipc_mkdir+0x178>
    cf70:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    cf74:	e3403001 	movt	r3, #1
    cf78:	e3042d84 	movw	r2, #19844	; 0x4d84
    cf7c:	e3402001 	movt	r2, #1
    cf80:	e3a01074 	mov	r1, #116	; 0x74
    cf84:	e3040d34 	movw	r0, #19764	; 0x4d34
    cf88:	e3400001 	movt	r0, #1
    cf8c:	eb000a05 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    cf90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cf94:	e2833008 	add	r3, r3, #8
    cf98:	e3a02004 	mov	r2, #4
    cf9c:	e1a01003 	mov	r1, r3
    cfa0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    cfa4:	eb000a53 	bl	f8f8 <memcpy>
    cfa8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    cfac:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    cfb0:	e51b3010 	ldr	r3, [fp, #-16]
    cfb4:	e5933010 	ldr	r3, [r3, #16]
    cfb8:	e51b2010 	ldr	r2, [fp, #-16]
    cfbc:	e5922008 	ldr	r2, [r2, #8]
    cfc0:	e0833002 	add	r3, r3, r2
    cfc4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    cfc8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cfcc:	e5d33000 	ldrb	r3, [r3]
    cfd0:	e2033004 	and	r3, r3, #4
    cfd4:	e6ef3073 	uxtb	r3, r3
    cfd8:	e3530000 	cmp	r3, #0
    cfdc:	0a000004 	beq	cff4 <ipc_call_copy_args_Ipc_mkdir+0x1dc>
    return session_free_buf(session, msg->header.len);
    cfe0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cfe4:	e1d330b2 	ldrh	r3, [r3, #2]
    cfe8:	e1a01003 	mov	r1, r3
    cfec:	e51b0010 	ldr	r0, [fp, #-16]
    cff0:	eb000692 	bl	ea40 <session_free_buf>
    cff4:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    cff8:	e1a00003 	mov	r0, r3
    cffc:	e24bd004 	sub	sp, fp, #4
    d000:	e8bd8800 	pop	{fp, pc}

0000d004 <mkdir>:
int mkdir(struct Session* session, char* path)
{
    d004:	e92d4800 	push	{fp, lr}
    d008:	e28db004 	add	fp, sp, #4
    d00c:	e24dd008 	sub	sp, sp, #8
    d010:	e50b0008 	str	r0, [fp, #-8]
    d014:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_mkdir)(session, path);
    d018:	e51b100c 	ldr	r1, [fp, #-12]
    d01c:	e51b0008 	ldr	r0, [fp, #-8]
    d020:	ebffff7c 	bl	ce18 <ipc_call_copy_args_Ipc_mkdir>
    d024:	e1a03000 	mov	r3, r0
}
    d028:	e1a00003 	mov	r0, r3
    d02c:	e24bd004 	sub	sp, fp, #4
    d030:	e8bd8800 	pop	{fp, pc}

0000d034 <ipc_call_copy_args_Ipc_delete>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    d034:	e92d4800 	push	{fp, lr}
    d038:	e28db004 	add	fp, sp, #4
    d03c:	e24dd048 	sub	sp, sp, #72	; 0x48
    d040:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    d044:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    d048:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d04c:	e3530000 	cmp	r3, #0
    d050:	1a000001 	bne	d05c <ipc_call_copy_args_Ipc_delete+0x28>
    d054:	e3e03000 	mvn	r3, #0
    d058:	ea00006d 	b	d214 <ipc_call_copy_args_Ipc_delete+0x1e0>
    d05c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d060:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    d064:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d068:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    d06c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d070:	eb000b85 	bl	fe8c <strlen>
    d074:	e1a03000 	mov	r3, r0
    d078:	e2833001 	add	r3, r3, #1
    d07c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    d080:	e24b3044 	sub	r3, fp, #68	; 0x44
    d084:	e1a02003 	mov	r2, r3
    d088:	e3a01001 	mov	r1, #1
    d08c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    d090:	eb00037b 	bl	de84 <new_ipc_msg>
    d094:	e1a03000 	mov	r3, r0
    d098:	e50b3008 	str	r3, [fp, #-8]
    d09c:	e51b3008 	ldr	r3, [fp, #-8]
    d0a0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    d0a4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d0a8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    d0ac:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    d0b0:	eb000b75 	bl	fe8c <strlen>
    d0b4:	e1a03000 	mov	r3, r0
    d0b8:	e2833001 	add	r3, r3, #1
    d0bc:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    d0c0:	e3a01000 	mov	r1, #0
    d0c4:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    d0c8:	eb0003da 	bl	e038 <ipc_msg_set_nth_arg>
    d0cc:	e3a03001 	mov	r3, #1
    d0d0:	e50b300c 	str	r3, [fp, #-12]
    d0d4:	e51b3008 	ldr	r3, [fp, #-8]
    d0d8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    d0dc:	e3a03004 	mov	r3, #4
    d0e0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    d0e4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d0e8:	e3530000 	cmp	r3, #0
    d0ec:	ba000002 	blt	d0fc <ipc_call_copy_args_Ipc_delete+0xc8>
    d0f0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d0f4:	e35300ff 	cmp	r3, #255	; 0xff
    d0f8:	da000001 	ble	d104 <ipc_call_copy_args_Ipc_delete+0xd0>
        return false;
    d0fc:	e3a03000 	mov	r3, #0
    d100:	ea000004 	b	d118 <ipc_call_copy_args_Ipc_delete+0xe4>
    msg->header.opcode = opcode;
    d104:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d108:	e6ef2073 	uxtb	r2, r3
    d10c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    d110:	e5c32001 	strb	r2, [r3, #1]
    return true;
    d114:	e3a03001 	mov	r3, #1
    d118:	e50b300c 	str	r3, [fp, #-12]
    d11c:	e51b0008 	ldr	r0, [fp, #-8]
    d120:	eb00044c 	bl	e258 <ipc_msg_send_wait>
    d124:	e51b3008 	ldr	r3, [fp, #-8]
    d128:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    d12c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d130:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    d134:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    d138:	eb000b53 	bl	fe8c <strlen>
    d13c:	e1a03000 	mov	r3, r0
    d140:	e2833001 	add	r3, r3, #1
    d144:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    d148:	e3a01000 	mov	r1, #0
    d14c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    d150:	eb000400 	bl	e158 <ipc_msg_get_nth_arg>
    d154:	e3a03001 	mov	r3, #1
    d158:	e50b300c 	str	r3, [fp, #-12]
    d15c:	e3a03000 	mov	r3, #0
    d160:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    d164:	e51b3008 	ldr	r3, [fp, #-8]
    d168:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    d16c:	e24b3040 	sub	r3, fp, #64	; 0x40
    d170:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    d174:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d178:	e5d33000 	ldrb	r3, [r3]
    d17c:	e2033002 	and	r3, r3, #2
    d180:	e6ef3073 	uxtb	r3, r3
    d184:	e3530000 	cmp	r3, #0
    d188:	1a000007 	bne	d1ac <ipc_call_copy_args_Ipc_delete+0x178>
    d18c:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    d190:	e3403001 	movt	r3, #1
    d194:	e3042d84 	movw	r2, #19844	; 0x4d84
    d198:	e3402001 	movt	r2, #1
    d19c:	e3a01074 	mov	r1, #116	; 0x74
    d1a0:	e3040d34 	movw	r0, #19764	; 0x4d34
    d1a4:	e3400001 	movt	r0, #1
    d1a8:	eb00097e 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    d1ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d1b0:	e2833008 	add	r3, r3, #8
    d1b4:	e3a02004 	mov	r2, #4
    d1b8:	e1a01003 	mov	r1, r3
    d1bc:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    d1c0:	eb0009cc 	bl	f8f8 <memcpy>
    d1c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d1c8:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    d1cc:	e51b3010 	ldr	r3, [fp, #-16]
    d1d0:	e5933010 	ldr	r3, [r3, #16]
    d1d4:	e51b2010 	ldr	r2, [fp, #-16]
    d1d8:	e5922008 	ldr	r2, [r2, #8]
    d1dc:	e0833002 	add	r3, r3, r2
    d1e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    d1e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d1e8:	e5d33000 	ldrb	r3, [r3]
    d1ec:	e2033004 	and	r3, r3, #4
    d1f0:	e6ef3073 	uxtb	r3, r3
    d1f4:	e3530000 	cmp	r3, #0
    d1f8:	0a000004 	beq	d210 <ipc_call_copy_args_Ipc_delete+0x1dc>
    return session_free_buf(session, msg->header.len);
    d1fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d200:	e1d330b2 	ldrh	r3, [r3, #2]
    d204:	e1a01003 	mov	r1, r3
    d208:	e51b0010 	ldr	r0, [fp, #-16]
    d20c:	eb00060b 	bl	ea40 <session_free_buf>
    d210:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    d214:	e1a00003 	mov	r0, r3
    d218:	e24bd004 	sub	sp, fp, #4
    d21c:	e8bd8800 	pop	{fp, pc}

0000d220 <rm>:
int rm(struct Session* session, char* path)
{
    d220:	e92d4800 	push	{fp, lr}
    d224:	e28db004 	add	fp, sp, #4
    d228:	e24dd008 	sub	sp, sp, #8
    d22c:	e50b0008 	str	r0, [fp, #-8]
    d230:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_delete)(session, path);
    d234:	e51b100c 	ldr	r1, [fp, #-12]
    d238:	e51b0008 	ldr	r0, [fp, #-8]
    d23c:	ebffff7c 	bl	d034 <ipc_call_copy_args_Ipc_delete>
    d240:	e1a03000 	mov	r3, r0
}
    d244:	e1a00003 	mov	r0, r3
    d248:	e24bd004 	sub	sp, fp, #4
    d24c:	e8bd8800 	pop	{fp, pc}

0000d250 <ipc_call_copy_args_Ipc_cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    d250:	e92d4800 	push	{fp, lr}
    d254:	e28db004 	add	fp, sp, #4
    d258:	e24dd048 	sub	sp, sp, #72	; 0x48
    d25c:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    d260:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    d264:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d268:	e3530000 	cmp	r3, #0
    d26c:	1a000001 	bne	d278 <ipc_call_copy_args_Ipc_cat+0x28>
    d270:	e3e03000 	mvn	r3, #0
    d274:	ea00006d 	b	d430 <ipc_call_copy_args_Ipc_cat+0x1e0>
    d278:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d27c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    d280:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d284:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    d288:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d28c:	eb000afe 	bl	fe8c <strlen>
    d290:	e1a03000 	mov	r3, r0
    d294:	e2833001 	add	r3, r3, #1
    d298:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    d29c:	e24b3044 	sub	r3, fp, #68	; 0x44
    d2a0:	e1a02003 	mov	r2, r3
    d2a4:	e3a01001 	mov	r1, #1
    d2a8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    d2ac:	eb0002f4 	bl	de84 <new_ipc_msg>
    d2b0:	e1a03000 	mov	r3, r0
    d2b4:	e50b3008 	str	r3, [fp, #-8]
    d2b8:	e51b3008 	ldr	r3, [fp, #-8]
    d2bc:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    d2c0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d2c4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    d2c8:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    d2cc:	eb000aee 	bl	fe8c <strlen>
    d2d0:	e1a03000 	mov	r3, r0
    d2d4:	e2833001 	add	r3, r3, #1
    d2d8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    d2dc:	e3a01000 	mov	r1, #0
    d2e0:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    d2e4:	eb000353 	bl	e038 <ipc_msg_set_nth_arg>
    d2e8:	e3a03001 	mov	r3, #1
    d2ec:	e50b300c 	str	r3, [fp, #-12]
    d2f0:	e51b3008 	ldr	r3, [fp, #-8]
    d2f4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    d2f8:	e3a03005 	mov	r3, #5
    d2fc:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    d300:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d304:	e3530000 	cmp	r3, #0
    d308:	ba000002 	blt	d318 <ipc_call_copy_args_Ipc_cat+0xc8>
    d30c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d310:	e35300ff 	cmp	r3, #255	; 0xff
    d314:	da000001 	ble	d320 <ipc_call_copy_args_Ipc_cat+0xd0>
        return false;
    d318:	e3a03000 	mov	r3, #0
    d31c:	ea000004 	b	d334 <ipc_call_copy_args_Ipc_cat+0xe4>
    msg->header.opcode = opcode;
    d320:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d324:	e6ef2073 	uxtb	r2, r3
    d328:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    d32c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    d330:	e3a03001 	mov	r3, #1
    d334:	e50b300c 	str	r3, [fp, #-12]
    d338:	e51b0008 	ldr	r0, [fp, #-8]
    d33c:	eb0003c5 	bl	e258 <ipc_msg_send_wait>
    d340:	e51b3008 	ldr	r3, [fp, #-8]
    d344:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    d348:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d34c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    d350:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    d354:	eb000acc 	bl	fe8c <strlen>
    d358:	e1a03000 	mov	r3, r0
    d35c:	e2833001 	add	r3, r3, #1
    d360:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    d364:	e3a01000 	mov	r1, #0
    d368:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    d36c:	eb000379 	bl	e158 <ipc_msg_get_nth_arg>
    d370:	e3a03001 	mov	r3, #1
    d374:	e50b300c 	str	r3, [fp, #-12]
    d378:	e3a03000 	mov	r3, #0
    d37c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    d380:	e51b3008 	ldr	r3, [fp, #-8]
    d384:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    d388:	e24b3040 	sub	r3, fp, #64	; 0x40
    d38c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    d390:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d394:	e5d33000 	ldrb	r3, [r3]
    d398:	e2033002 	and	r3, r3, #2
    d39c:	e6ef3073 	uxtb	r3, r3
    d3a0:	e3530000 	cmp	r3, #0
    d3a4:	1a000007 	bne	d3c8 <ipc_call_copy_args_Ipc_cat+0x178>
    d3a8:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    d3ac:	e3403001 	movt	r3, #1
    d3b0:	e3042d84 	movw	r2, #19844	; 0x4d84
    d3b4:	e3402001 	movt	r2, #1
    d3b8:	e3a01074 	mov	r1, #116	; 0x74
    d3bc:	e3040d34 	movw	r0, #19764	; 0x4d34
    d3c0:	e3400001 	movt	r0, #1
    d3c4:	eb0008f7 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    d3c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d3cc:	e2833008 	add	r3, r3, #8
    d3d0:	e3a02004 	mov	r2, #4
    d3d4:	e1a01003 	mov	r1, r3
    d3d8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    d3dc:	eb000945 	bl	f8f8 <memcpy>
    d3e0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d3e4:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    d3e8:	e51b3010 	ldr	r3, [fp, #-16]
    d3ec:	e5933010 	ldr	r3, [r3, #16]
    d3f0:	e51b2010 	ldr	r2, [fp, #-16]
    d3f4:	e5922008 	ldr	r2, [r2, #8]
    d3f8:	e0833002 	add	r3, r3, r2
    d3fc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    d400:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d404:	e5d33000 	ldrb	r3, [r3]
    d408:	e2033004 	and	r3, r3, #4
    d40c:	e6ef3073 	uxtb	r3, r3
    d410:	e3530000 	cmp	r3, #0
    d414:	0a000004 	beq	d42c <ipc_call_copy_args_Ipc_cat+0x1dc>
    return session_free_buf(session, msg->header.len);
    d418:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d41c:	e1d330b2 	ldrh	r3, [r3, #2]
    d420:	e1a01003 	mov	r1, r3
    d424:	e51b0010 	ldr	r0, [fp, #-16]
    d428:	eb000584 	bl	ea40 <session_free_buf>
    d42c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    d430:	e1a00003 	mov	r0, r3
    d434:	e24bd004 	sub	sp, fp, #4
    d438:	e8bd8800 	pop	{fp, pc}

0000d43c <cat>:
int cat(struct Session* session, char* path)
{
    d43c:	e92d4800 	push	{fp, lr}
    d440:	e28db004 	add	fp, sp, #4
    d444:	e24dd008 	sub	sp, sp, #8
    d448:	e50b0008 	str	r0, [fp, #-8]
    d44c:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cat)(session, path);
    d450:	e51b100c 	ldr	r1, [fp, #-12]
    d454:	e51b0008 	ldr	r0, [fp, #-8]
    d458:	ebffff7c 	bl	d250 <ipc_call_copy_args_Ipc_cat>
    d45c:	e1a03000 	mov	r3, r0
}
    d460:	e1a00003 	mov	r0, r3
    d464:	e24bd004 	sub	sp, fp, #4
    d468:	e8bd8800 	pop	{fp, pc}

0000d46c <ipc_call_copy_args_Ipc_open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    d46c:	e92d4800 	push	{fp, lr}
    d470:	e28db004 	add	fp, sp, #4
    d474:	e24dd048 	sub	sp, sp, #72	; 0x48
    d478:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    d47c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    d480:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d484:	e3530000 	cmp	r3, #0
    d488:	1a000001 	bne	d494 <ipc_call_copy_args_Ipc_open+0x28>
    d48c:	e3e03000 	mvn	r3, #0
    d490:	ea00006d 	b	d64c <ipc_call_copy_args_Ipc_open+0x1e0>
    d494:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d498:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    d49c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d4a0:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    d4a4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d4a8:	eb000a77 	bl	fe8c <strlen>
    d4ac:	e1a03000 	mov	r3, r0
    d4b0:	e2833001 	add	r3, r3, #1
    d4b4:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    d4b8:	e24b3044 	sub	r3, fp, #68	; 0x44
    d4bc:	e1a02003 	mov	r2, r3
    d4c0:	e3a01001 	mov	r1, #1
    d4c4:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    d4c8:	eb00026d 	bl	de84 <new_ipc_msg>
    d4cc:	e1a03000 	mov	r3, r0
    d4d0:	e50b3008 	str	r3, [fp, #-8]
    d4d4:	e51b3008 	ldr	r3, [fp, #-8]
    d4d8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    d4dc:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d4e0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    d4e4:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    d4e8:	eb000a67 	bl	fe8c <strlen>
    d4ec:	e1a03000 	mov	r3, r0
    d4f0:	e2833001 	add	r3, r3, #1
    d4f4:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    d4f8:	e3a01000 	mov	r1, #0
    d4fc:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    d500:	eb0002cc 	bl	e038 <ipc_msg_set_nth_arg>
    d504:	e3a03001 	mov	r3, #1
    d508:	e50b300c 	str	r3, [fp, #-12]
    d50c:	e51b3008 	ldr	r3, [fp, #-8]
    d510:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    d514:	e3a03006 	mov	r3, #6
    d518:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    d51c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d520:	e3530000 	cmp	r3, #0
    d524:	ba000002 	blt	d534 <ipc_call_copy_args_Ipc_open+0xc8>
    d528:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d52c:	e35300ff 	cmp	r3, #255	; 0xff
    d530:	da000001 	ble	d53c <ipc_call_copy_args_Ipc_open+0xd0>
        return false;
    d534:	e3a03000 	mov	r3, #0
    d538:	ea000004 	b	d550 <ipc_call_copy_args_Ipc_open+0xe4>
    msg->header.opcode = opcode;
    d53c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d540:	e6ef2073 	uxtb	r2, r3
    d544:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    d548:	e5c32001 	strb	r2, [r3, #1]
    return true;
    d54c:	e3a03001 	mov	r3, #1
    d550:	e50b300c 	str	r3, [fp, #-12]
    d554:	e51b0008 	ldr	r0, [fp, #-8]
    d558:	eb00033e 	bl	e258 <ipc_msg_send_wait>
    d55c:	e51b3008 	ldr	r3, [fp, #-8]
    d560:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    d564:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d568:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    d56c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    d570:	eb000a45 	bl	fe8c <strlen>
    d574:	e1a03000 	mov	r3, r0
    d578:	e2833001 	add	r3, r3, #1
    d57c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    d580:	e3a01000 	mov	r1, #0
    d584:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    d588:	eb0002f2 	bl	e158 <ipc_msg_get_nth_arg>
    d58c:	e3a03001 	mov	r3, #1
    d590:	e50b300c 	str	r3, [fp, #-12]
    d594:	e3a03000 	mov	r3, #0
    d598:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    d59c:	e51b3008 	ldr	r3, [fp, #-8]
    d5a0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    d5a4:	e24b3040 	sub	r3, fp, #64	; 0x40
    d5a8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    d5ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5b0:	e5d33000 	ldrb	r3, [r3]
    d5b4:	e2033002 	and	r3, r3, #2
    d5b8:	e6ef3073 	uxtb	r3, r3
    d5bc:	e3530000 	cmp	r3, #0
    d5c0:	1a000007 	bne	d5e4 <ipc_call_copy_args_Ipc_open+0x178>
    d5c4:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    d5c8:	e3403001 	movt	r3, #1
    d5cc:	e3042d84 	movw	r2, #19844	; 0x4d84
    d5d0:	e3402001 	movt	r2, #1
    d5d4:	e3a01074 	mov	r1, #116	; 0x74
    d5d8:	e3040d34 	movw	r0, #19764	; 0x4d34
    d5dc:	e3400001 	movt	r0, #1
    d5e0:	eb000870 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    d5e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d5e8:	e2833008 	add	r3, r3, #8
    d5ec:	e3a02004 	mov	r2, #4
    d5f0:	e1a01003 	mov	r1, r3
    d5f4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    d5f8:	eb0008be 	bl	f8f8 <memcpy>
    d5fc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d600:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    d604:	e51b3010 	ldr	r3, [fp, #-16]
    d608:	e5933010 	ldr	r3, [r3, #16]
    d60c:	e51b2010 	ldr	r2, [fp, #-16]
    d610:	e5922008 	ldr	r2, [r2, #8]
    d614:	e0833002 	add	r3, r3, r2
    d618:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    d61c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d620:	e5d33000 	ldrb	r3, [r3]
    d624:	e2033004 	and	r3, r3, #4
    d628:	e6ef3073 	uxtb	r3, r3
    d62c:	e3530000 	cmp	r3, #0
    d630:	0a000004 	beq	d648 <ipc_call_copy_args_Ipc_open+0x1dc>
    return session_free_buf(session, msg->header.len);
    d634:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d638:	e1d330b2 	ldrh	r3, [r3, #2]
    d63c:	e1a01003 	mov	r1, r3
    d640:	e51b0010 	ldr	r0, [fp, #-16]
    d644:	eb0004fd 	bl	ea40 <session_free_buf>
    d648:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    d64c:	e1a00003 	mov	r0, r3
    d650:	e24bd004 	sub	sp, fp, #4
    d654:	e8bd8800 	pop	{fp, pc}

0000d658 <open>:
int open(struct Session* session, char* path)
{
    d658:	e92d4800 	push	{fp, lr}
    d65c:	e28db004 	add	fp, sp, #4
    d660:	e24dd008 	sub	sp, sp, #8
    d664:	e50b0008 	str	r0, [fp, #-8]
    d668:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_open)(session, path);
    d66c:	e51b100c 	ldr	r1, [fp, #-12]
    d670:	e51b0008 	ldr	r0, [fp, #-8]
    d674:	ebffff7c 	bl	d46c <ipc_call_copy_args_Ipc_open>
    d678:	e1a03000 	mov	r3, r0
}
    d67c:	e1a00003 	mov	r0, r3
    d680:	e24bd004 	sub	sp, fp, #4
    d684:	e8bd8800 	pop	{fp, pc}

0000d688 <ipc_call_copy_args_Ipc_close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    d688:	e92d4800 	push	{fp, lr}
    d68c:	e28db004 	add	fp, sp, #4
    d690:	e24dd048 	sub	sp, sp, #72	; 0x48
    d694:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    d698:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    d69c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d6a0:	e3530000 	cmp	r3, #0
    d6a4:	1a000001 	bne	d6b0 <ipc_call_copy_args_Ipc_close+0x28>
    d6a8:	e3e03000 	mvn	r3, #0
    d6ac:	ea000064 	b	d844 <ipc_call_copy_args_Ipc_close+0x1bc>
    d6b0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d6b4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    d6b8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d6bc:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    d6c0:	e3a03004 	mov	r3, #4
    d6c4:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    d6c8:	e24b3044 	sub	r3, fp, #68	; 0x44
    d6cc:	e1a02003 	mov	r2, r3
    d6d0:	e3a01001 	mov	r1, #1
    d6d4:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    d6d8:	eb0001e9 	bl	de84 <new_ipc_msg>
    d6dc:	e1a03000 	mov	r3, r0
    d6e0:	e50b3008 	str	r3, [fp, #-8]
    d6e4:	e51b3008 	ldr	r3, [fp, #-8]
    d6e8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    d6ec:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d6f0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    d6f4:	e3a03004 	mov	r3, #4
    d6f8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    d6fc:	e3a01000 	mov	r1, #0
    d700:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    d704:	eb00024b 	bl	e038 <ipc_msg_set_nth_arg>
    d708:	e3a03001 	mov	r3, #1
    d70c:	e50b300c 	str	r3, [fp, #-12]
    d710:	e51b3008 	ldr	r3, [fp, #-8]
    d714:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    d718:	e3a03007 	mov	r3, #7
    d71c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    d720:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d724:	e3530000 	cmp	r3, #0
    d728:	ba000002 	blt	d738 <ipc_call_copy_args_Ipc_close+0xb0>
    d72c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d730:	e35300ff 	cmp	r3, #255	; 0xff
    d734:	da000001 	ble	d740 <ipc_call_copy_args_Ipc_close+0xb8>
        return false;
    d738:	e3a03000 	mov	r3, #0
    d73c:	ea000004 	b	d754 <ipc_call_copy_args_Ipc_close+0xcc>
    msg->header.opcode = opcode;
    d740:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    d744:	e6ef2073 	uxtb	r2, r3
    d748:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    d74c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    d750:	e3a03001 	mov	r3, #1
    d754:	e50b300c 	str	r3, [fp, #-12]
    d758:	e51b0008 	ldr	r0, [fp, #-8]
    d75c:	eb0002bd 	bl	e258 <ipc_msg_send_wait>
    d760:	e51b3008 	ldr	r3, [fp, #-8]
    d764:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    d768:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d76c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    d770:	e3a03004 	mov	r3, #4
    d774:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    d778:	e3a01000 	mov	r1, #0
    d77c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    d780:	eb000274 	bl	e158 <ipc_msg_get_nth_arg>
    d784:	e3a03001 	mov	r3, #1
    d788:	e50b300c 	str	r3, [fp, #-12]
    d78c:	e3a03000 	mov	r3, #0
    d790:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    d794:	e51b3008 	ldr	r3, [fp, #-8]
    d798:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    d79c:	e24b3040 	sub	r3, fp, #64	; 0x40
    d7a0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    d7a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d7a8:	e5d33000 	ldrb	r3, [r3]
    d7ac:	e2033002 	and	r3, r3, #2
    d7b0:	e6ef3073 	uxtb	r3, r3
    d7b4:	e3530000 	cmp	r3, #0
    d7b8:	1a000007 	bne	d7dc <ipc_call_copy_args_Ipc_close+0x154>
    d7bc:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    d7c0:	e3403001 	movt	r3, #1
    d7c4:	e3042d84 	movw	r2, #19844	; 0x4d84
    d7c8:	e3402001 	movt	r2, #1
    d7cc:	e3a01074 	mov	r1, #116	; 0x74
    d7d0:	e3040d34 	movw	r0, #19764	; 0x4d34
    d7d4:	e3400001 	movt	r0, #1
    d7d8:	eb0007f2 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    d7dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d7e0:	e2833008 	add	r3, r3, #8
    d7e4:	e3a02004 	mov	r2, #4
    d7e8:	e1a01003 	mov	r1, r3
    d7ec:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    d7f0:	eb000840 	bl	f8f8 <memcpy>
    d7f4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    d7f8:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    d7fc:	e51b3010 	ldr	r3, [fp, #-16]
    d800:	e5933010 	ldr	r3, [r3, #16]
    d804:	e51b2010 	ldr	r2, [fp, #-16]
    d808:	e5922008 	ldr	r2, [r2, #8]
    d80c:	e0833002 	add	r3, r3, r2
    d810:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    d814:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d818:	e5d33000 	ldrb	r3, [r3]
    d81c:	e2033004 	and	r3, r3, #4
    d820:	e6ef3073 	uxtb	r3, r3
    d824:	e3530000 	cmp	r3, #0
    d828:	0a000004 	beq	d840 <ipc_call_copy_args_Ipc_close+0x1b8>
    return session_free_buf(session, msg->header.len);
    d82c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    d830:	e1d330b2 	ldrh	r3, [r3, #2]
    d834:	e1a01003 	mov	r1, r3
    d838:	e51b0010 	ldr	r0, [fp, #-16]
    d83c:	eb00047f 	bl	ea40 <session_free_buf>
    d840:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    d844:	e1a00003 	mov	r0, r3
    d848:	e24bd004 	sub	sp, fp, #4
    d84c:	e8bd8800 	pop	{fp, pc}

0000d850 <close>:
int close(struct Session* session, int fd)
{
    d850:	e92d4800 	push	{fp, lr}
    d854:	e28db004 	add	fp, sp, #4
    d858:	e24dd008 	sub	sp, sp, #8
    d85c:	e50b0008 	str	r0, [fp, #-8]
    d860:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_close)(session, &fd);
    d864:	e24b300c 	sub	r3, fp, #12
    d868:	e1a01003 	mov	r1, r3
    d86c:	e51b0008 	ldr	r0, [fp, #-8]
    d870:	ebffff84 	bl	d688 <ipc_call_copy_args_Ipc_close>
    d874:	e1a03000 	mov	r3, r0
}
    d878:	e1a00003 	mov	r0, r3
    d87c:	e24bd004 	sub	sp, fp, #4
    d880:	e8bd8800 	pop	{fp, pc}

0000d884 <ipc_call_copy_args_Ipc_read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    d884:	e92d4800 	push	{fp, lr}
    d888:	e28db004 	add	fp, sp, #4
    d88c:	e24dd080 	sub	sp, sp, #128	; 0x80
    d890:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    d894:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    d898:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    d89c:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    d8a0:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    d8a4:	e3530000 	cmp	r3, #0
    d8a8:	1a000001 	bne	d8b4 <ipc_call_copy_args_Ipc_read+0x30>
    d8ac:	e3e03000 	mvn	r3, #0
    d8b0:	ea00009d 	b	db2c <ipc_call_copy_args_Ipc_read+0x2a8>
    d8b4:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    d8b8:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    d8bc:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    d8c0:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    d8c4:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    d8c8:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    d8cc:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    d8d0:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    d8d4:	e59b3004 	ldr	r3, [fp, #4]
    d8d8:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    d8dc:	e3a03004 	mov	r3, #4
    d8e0:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    d8e4:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    d8e8:	e5933000 	ldr	r3, [r3]
    d8ec:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    d8f0:	e3a03004 	mov	r3, #4
    d8f4:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    d8f8:	e3a03004 	mov	r3, #4
    d8fc:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    d900:	e24b3074 	sub	r3, fp, #116	; 0x74
    d904:	e1a02003 	mov	r2, r3
    d908:	e3a01004 	mov	r1, #4
    d90c:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    d910:	eb00015b 	bl	de84 <new_ipc_msg>
    d914:	e1a03000 	mov	r3, r0
    d918:	e50b3008 	str	r3, [fp, #-8]
    d91c:	e51b3008 	ldr	r3, [fp, #-8]
    d920:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    d924:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    d928:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    d92c:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    d930:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    d934:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    d938:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    d93c:	e59b3004 	ldr	r3, [fp, #4]
    d940:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    d944:	e3a03004 	mov	r3, #4
    d948:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    d94c:	e3a01000 	mov	r1, #0
    d950:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d954:	eb0001b7 	bl	e038 <ipc_msg_set_nth_arg>
    d958:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    d95c:	e5933000 	ldr	r3, [r3]
    d960:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    d964:	e3a01001 	mov	r1, #1
    d968:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d96c:	eb0001b1 	bl	e038 <ipc_msg_set_nth_arg>
    d970:	e3a03004 	mov	r3, #4
    d974:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    d978:	e3a01002 	mov	r1, #2
    d97c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d980:	eb0001ac 	bl	e038 <ipc_msg_set_nth_arg>
    d984:	e3a03004 	mov	r3, #4
    d988:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    d98c:	e3a01003 	mov	r1, #3
    d990:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    d994:	eb0001a7 	bl	e038 <ipc_msg_set_nth_arg>
    d998:	e3a03001 	mov	r3, #1
    d99c:	e50b300c 	str	r3, [fp, #-12]
    d9a0:	e51b3008 	ldr	r3, [fp, #-8]
    d9a4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    d9a8:	e3a03008 	mov	r3, #8
    d9ac:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    d9b0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    d9b4:	e3530000 	cmp	r3, #0
    d9b8:	ba000002 	blt	d9c8 <ipc_call_copy_args_Ipc_read+0x144>
    d9bc:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    d9c0:	e35300ff 	cmp	r3, #255	; 0xff
    d9c4:	da000001 	ble	d9d0 <ipc_call_copy_args_Ipc_read+0x14c>
        return false;
    d9c8:	e3a03000 	mov	r3, #0
    d9cc:	ea000004 	b	d9e4 <ipc_call_copy_args_Ipc_read+0x160>
    msg->header.opcode = opcode;
    d9d0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    d9d4:	e6ef2073 	uxtb	r2, r3
    d9d8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    d9dc:	e5c32001 	strb	r2, [r3, #1]
    return true;
    d9e0:	e3a03001 	mov	r3, #1
    d9e4:	e50b300c 	str	r3, [fp, #-12]
    d9e8:	e51b0008 	ldr	r0, [fp, #-8]
    d9ec:	eb000219 	bl	e258 <ipc_msg_send_wait>
    d9f0:	e51b3008 	ldr	r3, [fp, #-8]
    d9f4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    d9f8:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    d9fc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    da00:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    da04:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    da08:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    da0c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    da10:	e59b3004 	ldr	r3, [fp, #4]
    da14:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    da18:	e3a03004 	mov	r3, #4
    da1c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    da20:	e3a01000 	mov	r1, #0
    da24:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    da28:	eb0001ca 	bl	e158 <ipc_msg_get_nth_arg>
    da2c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    da30:	e5933000 	ldr	r3, [r3]
    da34:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    da38:	e3a01001 	mov	r1, #1
    da3c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    da40:	eb0001c4 	bl	e158 <ipc_msg_get_nth_arg>
    da44:	e3a03004 	mov	r3, #4
    da48:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    da4c:	e3a01002 	mov	r1, #2
    da50:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    da54:	eb0001bf 	bl	e158 <ipc_msg_get_nth_arg>
    da58:	e3a03004 	mov	r3, #4
    da5c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    da60:	e3a01003 	mov	r1, #3
    da64:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    da68:	eb0001ba 	bl	e158 <ipc_msg_get_nth_arg>
    da6c:	e3a03001 	mov	r3, #1
    da70:	e50b300c 	str	r3, [fp, #-12]
    da74:	e3a03000 	mov	r3, #0
    da78:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    da7c:	e51b3008 	ldr	r3, [fp, #-8]
    da80:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    da84:	e24b3064 	sub	r3, fp, #100	; 0x64
    da88:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    da8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    da90:	e5d33000 	ldrb	r3, [r3]
    da94:	e2033002 	and	r3, r3, #2
    da98:	e6ef3073 	uxtb	r3, r3
    da9c:	e3530000 	cmp	r3, #0
    daa0:	1a000007 	bne	dac4 <ipc_call_copy_args_Ipc_read+0x240>
    daa4:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    daa8:	e3403001 	movt	r3, #1
    daac:	e3042d84 	movw	r2, #19844	; 0x4d84
    dab0:	e3402001 	movt	r2, #1
    dab4:	e3a01074 	mov	r1, #116	; 0x74
    dab8:	e3040d34 	movw	r0, #19764	; 0x4d34
    dabc:	e3400001 	movt	r0, #1
    dac0:	eb000738 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    dac4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dac8:	e2833008 	add	r3, r3, #8
    dacc:	e3a02004 	mov	r2, #4
    dad0:	e1a01003 	mov	r1, r3
    dad4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    dad8:	eb000786 	bl	f8f8 <memcpy>
    dadc:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    dae0:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    dae4:	e51b3010 	ldr	r3, [fp, #-16]
    dae8:	e5933010 	ldr	r3, [r3, #16]
    daec:	e51b2010 	ldr	r2, [fp, #-16]
    daf0:	e5922008 	ldr	r2, [r2, #8]
    daf4:	e0833002 	add	r3, r3, r2
    daf8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    dafc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    db00:	e5d33000 	ldrb	r3, [r3]
    db04:	e2033004 	and	r3, r3, #4
    db08:	e6ef3073 	uxtb	r3, r3
    db0c:	e3530000 	cmp	r3, #0
    db10:	0a000004 	beq	db28 <ipc_call_copy_args_Ipc_read+0x2a4>
    return session_free_buf(session, msg->header.len);
    db14:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    db18:	e1d330b2 	ldrh	r3, [r3, #2]
    db1c:	e1a01003 	mov	r1, r3
    db20:	e51b0010 	ldr	r0, [fp, #-16]
    db24:	eb0003c5 	bl	ea40 <session_free_buf>
    db28:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    db2c:	e1a00003 	mov	r0, r3
    db30:	e24bd004 	sub	sp, fp, #4
    db34:	e8bd8800 	pop	{fp, pc}

0000db38 <read>:
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    db38:	e92d4800 	push	{fp, lr}
    db3c:	e28db004 	add	fp, sp, #4
    db40:	e24dd018 	sub	sp, sp, #24
    db44:	e50b0008 	str	r0, [fp, #-8]
    db48:	e50b100c 	str	r1, [fp, #-12]
    db4c:	e50b2010 	str	r2, [fp, #-16]
    db50:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    db54:	e24b2014 	sub	r2, fp, #20
    db58:	e24b100c 	sub	r1, fp, #12
    db5c:	e28b3004 	add	r3, fp, #4
    db60:	e58d3000 	str	r3, [sp]
    db64:	e1a03002 	mov	r3, r2
    db68:	e51b2010 	ldr	r2, [fp, #-16]
    db6c:	e51b0008 	ldr	r0, [fp, #-8]
    db70:	ebffff43 	bl	d884 <ipc_call_copy_args_Ipc_read>
    db74:	e1a03000 	mov	r3, r0
}
    db78:	e1a00003 	mov	r0, r3
    db7c:	e24bd004 	sub	sp, fp, #4
    db80:	e8bd8800 	pop	{fp, pc}

0000db84 <ipc_call_copy_args_Ipc_write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    db84:	e92d4800 	push	{fp, lr}
    db88:	e28db004 	add	fp, sp, #4
    db8c:	e24dd080 	sub	sp, sp, #128	; 0x80
    db90:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    db94:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    db98:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    db9c:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    dba0:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    dba4:	e3530000 	cmp	r3, #0
    dba8:	1a000001 	bne	dbb4 <ipc_call_copy_args_Ipc_write+0x30>
    dbac:	e3e03000 	mvn	r3, #0
    dbb0:	ea00009d 	b	de2c <ipc_call_copy_args_Ipc_write+0x2a8>
    dbb4:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    dbb8:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    dbbc:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    dbc0:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    dbc4:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    dbc8:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    dbcc:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    dbd0:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    dbd4:	e59b3004 	ldr	r3, [fp, #4]
    dbd8:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    dbdc:	e3a03004 	mov	r3, #4
    dbe0:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    dbe4:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    dbe8:	e5933000 	ldr	r3, [r3]
    dbec:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    dbf0:	e3a03004 	mov	r3, #4
    dbf4:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    dbf8:	e3a03004 	mov	r3, #4
    dbfc:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    dc00:	e24b3074 	sub	r3, fp, #116	; 0x74
    dc04:	e1a02003 	mov	r2, r3
    dc08:	e3a01004 	mov	r1, #4
    dc0c:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    dc10:	eb00009b 	bl	de84 <new_ipc_msg>
    dc14:	e1a03000 	mov	r3, r0
    dc18:	e50b3008 	str	r3, [fp, #-8]
    dc1c:	e51b3008 	ldr	r3, [fp, #-8]
    dc20:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    dc24:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    dc28:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    dc2c:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    dc30:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    dc34:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    dc38:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    dc3c:	e59b3004 	ldr	r3, [fp, #4]
    dc40:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    dc44:	e3a03004 	mov	r3, #4
    dc48:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    dc4c:	e3a01000 	mov	r1, #0
    dc50:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    dc54:	eb0000f7 	bl	e038 <ipc_msg_set_nth_arg>
    dc58:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    dc5c:	e5933000 	ldr	r3, [r3]
    dc60:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    dc64:	e3a01001 	mov	r1, #1
    dc68:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    dc6c:	eb0000f1 	bl	e038 <ipc_msg_set_nth_arg>
    dc70:	e3a03004 	mov	r3, #4
    dc74:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    dc78:	e3a01002 	mov	r1, #2
    dc7c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    dc80:	eb0000ec 	bl	e038 <ipc_msg_set_nth_arg>
    dc84:	e3a03004 	mov	r3, #4
    dc88:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    dc8c:	e3a01003 	mov	r1, #3
    dc90:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    dc94:	eb0000e7 	bl	e038 <ipc_msg_set_nth_arg>
    dc98:	e3a03001 	mov	r3, #1
    dc9c:	e50b300c 	str	r3, [fp, #-12]
    dca0:	e51b3008 	ldr	r3, [fp, #-8]
    dca4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    dca8:	e3a03009 	mov	r3, #9
    dcac:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    dcb0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    dcb4:	e3530000 	cmp	r3, #0
    dcb8:	ba000002 	blt	dcc8 <ipc_call_copy_args_Ipc_write+0x144>
    dcbc:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    dcc0:	e35300ff 	cmp	r3, #255	; 0xff
    dcc4:	da000001 	ble	dcd0 <ipc_call_copy_args_Ipc_write+0x14c>
        return false;
    dcc8:	e3a03000 	mov	r3, #0
    dccc:	ea000004 	b	dce4 <ipc_call_copy_args_Ipc_write+0x160>
    msg->header.opcode = opcode;
    dcd0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    dcd4:	e6ef2073 	uxtb	r2, r3
    dcd8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    dcdc:	e5c32001 	strb	r2, [r3, #1]
    return true;
    dce0:	e3a03001 	mov	r3, #1
    dce4:	e50b300c 	str	r3, [fp, #-12]
    dce8:	e51b0008 	ldr	r0, [fp, #-8]
    dcec:	eb000159 	bl	e258 <ipc_msg_send_wait>
    dcf0:	e51b3008 	ldr	r3, [fp, #-8]
    dcf4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    dcf8:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    dcfc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    dd00:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    dd04:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    dd08:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    dd0c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    dd10:	e59b3004 	ldr	r3, [fp, #4]
    dd14:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    dd18:	e3a03004 	mov	r3, #4
    dd1c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    dd20:	e3a01000 	mov	r1, #0
    dd24:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    dd28:	eb00010a 	bl	e158 <ipc_msg_get_nth_arg>
    dd2c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    dd30:	e5933000 	ldr	r3, [r3]
    dd34:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    dd38:	e3a01001 	mov	r1, #1
    dd3c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    dd40:	eb000104 	bl	e158 <ipc_msg_get_nth_arg>
    dd44:	e3a03004 	mov	r3, #4
    dd48:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    dd4c:	e3a01002 	mov	r1, #2
    dd50:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    dd54:	eb0000ff 	bl	e158 <ipc_msg_get_nth_arg>
    dd58:	e3a03004 	mov	r3, #4
    dd5c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    dd60:	e3a01003 	mov	r1, #3
    dd64:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    dd68:	eb0000fa 	bl	e158 <ipc_msg_get_nth_arg>
    dd6c:	e3a03001 	mov	r3, #1
    dd70:	e50b300c 	str	r3, [fp, #-12]
    dd74:	e3a03000 	mov	r3, #0
    dd78:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    dd7c:	e51b3008 	ldr	r3, [fp, #-8]
    dd80:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    dd84:	e24b3064 	sub	r3, fp, #100	; 0x64
    dd88:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    dd8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dd90:	e5d33000 	ldrb	r3, [r3]
    dd94:	e2033002 	and	r3, r3, #2
    dd98:	e6ef3073 	uxtb	r3, r3
    dd9c:	e3530000 	cmp	r3, #0
    dda0:	1a000007 	bne	ddc4 <ipc_call_copy_args_Ipc_write+0x240>
    dda4:	e3043d1c 	movw	r3, #19740	; 0x4d1c
    dda8:	e3403001 	movt	r3, #1
    ddac:	e3042d84 	movw	r2, #19844	; 0x4d84
    ddb0:	e3402001 	movt	r2, #1
    ddb4:	e3a01074 	mov	r1, #116	; 0x74
    ddb8:	e3040d34 	movw	r0, #19764	; 0x4d34
    ddbc:	e3400001 	movt	r0, #1
    ddc0:	eb000678 	bl	f7a8 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    ddc4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ddc8:	e2833008 	add	r3, r3, #8
    ddcc:	e3a02004 	mov	r2, #4
    ddd0:	e1a01003 	mov	r1, r3
    ddd4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    ddd8:	eb0006c6 	bl	f8f8 <memcpy>
    dddc:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    dde0:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    dde4:	e51b3010 	ldr	r3, [fp, #-16]
    dde8:	e5933010 	ldr	r3, [r3, #16]
    ddec:	e51b2010 	ldr	r2, [fp, #-16]
    ddf0:	e5922008 	ldr	r2, [r2, #8]
    ddf4:	e0833002 	add	r3, r3, r2
    ddf8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    ddfc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    de00:	e5d33000 	ldrb	r3, [r3]
    de04:	e2033004 	and	r3, r3, #4
    de08:	e6ef3073 	uxtb	r3, r3
    de0c:	e3530000 	cmp	r3, #0
    de10:	0a000004 	beq	de28 <ipc_call_copy_args_Ipc_write+0x2a4>
    return session_free_buf(session, msg->header.len);
    de14:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    de18:	e1d330b2 	ldrh	r3, [r3, #2]
    de1c:	e1a01003 	mov	r1, r3
    de20:	e51b0010 	ldr	r0, [fp, #-16]
    de24:	eb000305 	bl	ea40 <session_free_buf>
    de28:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    de2c:	e1a00003 	mov	r0, r3
    de30:	e24bd004 	sub	sp, fp, #4
    de34:	e8bd8800 	pop	{fp, pc}

0000de38 <write>:
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    de38:	e92d4800 	push	{fp, lr}
    de3c:	e28db004 	add	fp, sp, #4
    de40:	e24dd018 	sub	sp, sp, #24
    de44:	e50b0008 	str	r0, [fp, #-8]
    de48:	e50b100c 	str	r1, [fp, #-12]
    de4c:	e50b2010 	str	r2, [fp, #-16]
    de50:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    de54:	e24b2014 	sub	r2, fp, #20
    de58:	e24b100c 	sub	r1, fp, #12
    de5c:	e28b3004 	add	r3, fp, #4
    de60:	e58d3000 	str	r3, [sp]
    de64:	e1a03002 	mov	r3, r2
    de68:	e51b2010 	ldr	r2, [fp, #-16]
    de6c:	e51b0008 	ldr	r0, [fp, #-8]
    de70:	ebffff43 	bl	db84 <ipc_call_copy_args_Ipc_write>
    de74:	e1a03000 	mov	r3, r0
    de78:	e1a00003 	mov	r0, r3
    de7c:	e24bd004 	sub	sp, fp, #4
    de80:	e8bd8800 	pop	{fp, pc}

0000de84 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    de84:	e92d4800 	push	{fp, lr}
    de88:	e28db004 	add	fp, sp, #4
    de8c:	e24dd030 	sub	sp, sp, #48	; 0x30
    de90:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    de94:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    de98:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    int len = IPC_ARG_INFO_BASE_OFFSET;
    de9c:	e3a0300c 	mov	r3, #12
    dea0:	e50b3008 	str	r3, [fp, #-8]

    int arg_info_offset = len; // start of arg info
    dea4:	e51b3008 	ldr	r3, [fp, #-8]
    dea8:	e50b300c 	str	r3, [fp, #-12]
    len += argc * sizeof(struct IpcArgInfo);
    deac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    deb0:	e1a02103 	lsl	r2, r3, #2
    deb4:	e51b3008 	ldr	r3, [fp, #-8]
    deb8:	e0823003 	add	r3, r2, r3
    debc:	e50b3008 	str	r3, [fp, #-8]

    int arg_buf_offset = len; // start of arg buffer
    dec0:	e51b3008 	ldr	r3, [fp, #-8]
    dec4:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    dec8:	e3a03000 	mov	r3, #0
    decc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    ded0:	ea00000a 	b	df00 <new_ipc_msg+0x7c>
        len += arg_size[i];
    ded4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ded8:	e1a03103 	lsl	r3, r3, #2
    dedc:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    dee0:	e0823003 	add	r3, r2, r3
    dee4:	e5933000 	ldr	r3, [r3]
    dee8:	e51b2008 	ldr	r2, [fp, #-8]
    deec:	e0823003 	add	r3, r2, r3
    def0:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < argc; i++) {
    def4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    def8:	e2833001 	add	r3, r3, #1
    defc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    df00:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    df04:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    df08:	e1520003 	cmp	r2, r3
    df0c:	bafffff0 	blt	ded4 <new_ipc_msg+0x50>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    df10:	e51b1008 	ldr	r1, [fp, #-8]
    df14:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    df18:	eb00026d 	bl	e8d4 <session_alloc_buf>
    df1c:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (buf == NULL) {
    df20:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    df24:	e3530000 	cmp	r3, #0
    df28:	1a000001 	bne	df34 <new_ipc_msg+0xb0>
        return NULL;
    df2c:	e3a03000 	mov	r3, #0
    df30:	ea00003d 	b	e02c <new_ipc_msg+0x1a8>
    }
    buf->header.len = len;
    df34:	e51b3008 	ldr	r3, [fp, #-8]
    df38:	e6ff2073 	uxth	r2, r3
    df3c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    df40:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.done = 0;
    df44:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    df48:	e5d23000 	ldrb	r3, [r2]
    df4c:	e7c1309f 	bfc	r3, #1, #1
    df50:	e5c23000 	strb	r3, [r2]
    buf->header.valid = 0;
    df54:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    df58:	e5d23000 	ldrb	r3, [r2]
    df5c:	e7c0301f 	bfc	r3, #0, #1
    df60:	e5c23000 	strb	r3, [r2]

    for (int i = 0; i < argc; i++) {
    df64:	e3a03000 	mov	r3, #0
    df68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    df6c:	ea00001d 	b	dfe8 <new_ipc_msg+0x164>
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    df70:	e51b300c 	ldr	r3, [fp, #-12]
    df74:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    df78:	e0823003 	add	r3, r2, r3
    df7c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        arg_info->len = arg_size[i];
    df80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    df84:	e1a03103 	lsl	r3, r3, #2
    df88:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    df8c:	e0823003 	add	r3, r2, r3
    df90:	e5933000 	ldr	r3, [r3]
    df94:	e6ff2073 	uxth	r2, r3
    df98:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    df9c:	e1c320b2 	strh	r2, [r3, #2]
        arg_info->offset = arg_buf_offset;
    dfa0:	e51b3010 	ldr	r3, [fp, #-16]
    dfa4:	e6ff2073 	uxth	r2, r3
    dfa8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    dfac:	e1c320b0 	strh	r2, [r3]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    dfb0:	e51b300c 	ldr	r3, [fp, #-12]
    dfb4:	e2833004 	add	r3, r3, #4
    dfb8:	e50b300c 	str	r3, [fp, #-12]
        arg_buf_offset += arg_size[i];
    dfbc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dfc0:	e1a03103 	lsl	r3, r3, #2
    dfc4:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    dfc8:	e0823003 	add	r3, r2, r3
    dfcc:	e5933000 	ldr	r3, [r3]
    dfd0:	e51b2010 	ldr	r2, [fp, #-16]
    dfd4:	e0823003 	add	r3, r2, r3
    dfd8:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    dfdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    dfe0:	e2833001 	add	r3, r3, #1
    dfe4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    dfe8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    dfec:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    dff0:	e1520003 	cmp	r2, r3
    dff4:	baffffdd 	blt	df70 <new_ipc_msg+0xec>
    }
    buf->header.nr_args = argc;
    dff8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    dffc:	e6ef3073 	uxtb	r3, r3
    e000:	e203300f 	and	r3, r3, #15
    e004:	e6ef1073 	uxtb	r1, r3
    e008:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    e00c:	e5d23000 	ldrb	r3, [r2]
    e010:	e7c73211 	bfi	r3, r1, #4, #4
    e014:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
    e018:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    e01c:	e5d23000 	ldrb	r3, [r2]
    e020:	e3833004 	orr	r3, r3, #4
    e024:	e5c23000 	strb	r3, [r2]
    return buf;
    e028:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    e02c:	e1a00003 	mov	r0, r3
    e030:	e24bd004 	sub	sp, fp, #4
    e034:	e8bd8800 	pop	{fp, pc}

0000e038 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    e038:	e92d4800 	push	{fp, lr}
    e03c:	e28db004 	add	fp, sp, #4
    e040:	e24dd020 	sub	sp, sp, #32
    e044:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e048:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    e04c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    e050:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    e054:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e058:	e5d33000 	ldrb	r3, [r3]
    e05c:	e7e33253 	ubfx	r3, r3, #4, #4
    e060:	e6ef3073 	uxtb	r3, r3
    e064:	e1a02003 	mov	r2, r3
    e068:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e06c:	e1520003 	cmp	r2, r3
    e070:	ca00000b 	bgt	e0a4 <ipc_msg_set_nth_arg+0x6c>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
    e074:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e078:	e5d33000 	ldrb	r3, [r3]
    e07c:	e7e33253 	ubfx	r3, r3, #4, #4
    e080:	e6ef3073 	uxtb	r3, r3
    e084:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    e088:	e3041f00 	movw	r1, #20224	; 0x4f00
    e08c:	e3401001 	movt	r1, #1
    e090:	e3040d98 	movw	r0, #19864	; 0x4d98
    e094:	e3400001 	movt	r0, #1
    e098:	ebffe968 	bl	8640 <printf>
        return false;
    e09c:	e3a03000 	mov	r3, #0
    e0a0:	ea000029 	b	e14c <ipc_msg_set_nth_arg+0x114>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    e0a4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e0a8:	e2833003 	add	r3, r3, #3
    e0ac:	e1a03103 	lsl	r3, r3, #2
    e0b0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    e0b4:	e0823003 	add	r3, r2, r3
    e0b8:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    e0bc:	e51b3008 	ldr	r3, [fp, #-8]
    e0c0:	e1d330b2 	ldrh	r3, [r3, #2]
    e0c4:	e1a02003 	mov	r2, r3
    e0c8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e0cc:	e1520003 	cmp	r2, r3
    e0d0:	aa000009 	bge	e0fc <ipc_msg_set_nth_arg+0xc4>
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
    e0d4:	e51b3008 	ldr	r3, [fp, #-8]
    e0d8:	e1d330b2 	ldrh	r3, [r3, #2]
    e0dc:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    e0e0:	e3041f00 	movw	r1, #20224	; 0x4f00
    e0e4:	e3401001 	movt	r1, #1
    e0e8:	e3040dd8 	movw	r0, #19928	; 0x4dd8
    e0ec:	e3400001 	movt	r0, #1
    e0f0:	ebffe952 	bl	8640 <printf>
        return false;
    e0f4:	e3a03000 	mov	r3, #0
    e0f8:	ea000013 	b	e14c <ipc_msg_set_nth_arg+0x114>
    e0fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e100:	e50b3010 	str	r3, [fp, #-16]
    e104:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e108:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    e10c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e110:	e2833003 	add	r3, r3, #3
    e114:	e1a03103 	lsl	r3, r3, #2
    e118:	e51b2010 	ldr	r2, [fp, #-16]
    e11c:	e0823003 	add	r3, r2, r3
    e120:	e1d330b0 	ldrh	r3, [r3]
    e124:	e1a02003 	mov	r2, r3
    e128:	e51b3010 	ldr	r3, [fp, #-16]
    e12c:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    e130:	e50b300c 	str	r3, [fp, #-12]
    memmove(buf, data, len);
    e134:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e138:	e1a02003 	mov	r2, r3
    e13c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    e140:	e51b000c 	ldr	r0, [fp, #-12]
    e144:	eb000630 	bl	fa0c <memmove>
    return true;
    e148:	e3a03001 	mov	r3, #1
}
    e14c:	e1a00003 	mov	r0, r3
    e150:	e24bd004 	sub	sp, fp, #4
    e154:	e8bd8800 	pop	{fp, pc}

0000e158 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    e158:	e92d4800 	push	{fp, lr}
    e15c:	e28db004 	add	fp, sp, #4
    e160:	e24dd020 	sub	sp, sp, #32
    e164:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    e168:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    e16c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    e170:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    e174:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e178:	e5d33000 	ldrb	r3, [r3]
    e17c:	e7e33253 	ubfx	r3, r3, #4, #4
    e180:	e6ef3073 	uxtb	r3, r3
    e184:	e1a02003 	mov	r2, r3
    e188:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e18c:	e1520003 	cmp	r2, r3
    e190:	ca000006 	bgt	e1b0 <ipc_msg_get_nth_arg+0x58>
        printf("[%s] IPC: arg_num out of msg range", __func__);
    e194:	e3041f14 	movw	r1, #20244	; 0x4f14
    e198:	e3401001 	movt	r1, #1
    e19c:	e3040e1c 	movw	r0, #19996	; 0x4e1c
    e1a0:	e3400001 	movt	r0, #1
    e1a4:	ebffe925 	bl	8640 <printf>
        return false;
    e1a8:	e3a03000 	mov	r3, #0
    e1ac:	ea000026 	b	e24c <ipc_msg_get_nth_arg+0xf4>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    e1b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e1b4:	e2833003 	add	r3, r3, #3
    e1b8:	e1a03103 	lsl	r3, r3, #2
    e1bc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    e1c0:	e0823003 	add	r3, r2, r3
    e1c4:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    e1c8:	e51b3008 	ldr	r3, [fp, #-8]
    e1cc:	e1d330b2 	ldrh	r3, [r3, #2]
    e1d0:	e1a02003 	mov	r2, r3
    e1d4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e1d8:	e1520003 	cmp	r2, r3
    e1dc:	aa000006 	bge	e1fc <ipc_msg_get_nth_arg+0xa4>
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    e1e0:	e3041f14 	movw	r1, #20244	; 0x4f14
    e1e4:	e3401001 	movt	r1, #1
    e1e8:	e3040e40 	movw	r0, #20032	; 0x4e40
    e1ec:	e3400001 	movt	r0, #1
    e1f0:	ebffe912 	bl	8640 <printf>
        return false;
    e1f4:	e3a03000 	mov	r3, #0
    e1f8:	ea000013 	b	e24c <ipc_msg_get_nth_arg+0xf4>
    e1fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e200:	e50b3010 	str	r3, [fp, #-16]
    e204:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e208:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    e20c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e210:	e2833003 	add	r3, r3, #3
    e214:	e1a03103 	lsl	r3, r3, #2
    e218:	e51b2010 	ldr	r2, [fp, #-16]
    e21c:	e0823003 	add	r3, r2, r3
    e220:	e1d330b0 	ldrh	r3, [r3]
    e224:	e1a02003 	mov	r2, r3
    e228:	e51b3010 	ldr	r3, [fp, #-16]
    e22c:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    e230:	e50b300c 	str	r3, [fp, #-12]
    memmove(data, buf, len);
    e234:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e238:	e1a02003 	mov	r2, r3
    e23c:	e51b100c 	ldr	r1, [fp, #-12]
    e240:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    e244:	eb0005f0 	bl	fa0c <memmove>
    return true;
    e248:	e3a03001 	mov	r3, #1
}
    e24c:	e1a00003 	mov	r0, r3
    e250:	e24bd004 	sub	sp, fp, #4
    e254:	e8bd8800 	pop	{fp, pc}

0000e258 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    e258:	e92d4800 	push	{fp, lr}
    e25c:	e28db004 	add	fp, sp, #4
    e260:	e24dd008 	sub	sp, sp, #8
    e264:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    e268:	e51b2008 	ldr	r2, [fp, #-8]
    e26c:	e30d3cba 	movw	r3, #56506	; 0xdcba
    e270:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    e274:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    e278:	e51b2008 	ldr	r2, [fp, #-8]
    e27c:	e5d23000 	ldrb	r3, [r2]
    e280:	e3833001 	orr	r3, r3, #1
    e284:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    e288:	e51b2008 	ldr	r2, [fp, #-8]
    e28c:	e5d23000 	ldrb	r3, [r2]
    e290:	e7c1309f 	bfc	r3, #1, #1
    e294:	e5c23000 	strb	r3, [r2]
    while (msg->header.done == 0) {
    e298:	ea000000 	b	e2a0 <ipc_msg_send_wait+0x48>
        /// @todo syscall yield with prio decrease
        yield();
    e29c:	eb00027a 	bl	ec8c <yield>
    while (msg->header.done == 0) {
    e2a0:	e51b3008 	ldr	r3, [fp, #-8]
    e2a4:	e5d33000 	ldrb	r3, [r3]
    e2a8:	e2033002 	and	r3, r3, #2
    e2ac:	e6ef3073 	uxtb	r3, r3
    e2b0:	e3530000 	cmp	r3, #0
    e2b4:	0afffff8 	beq	e29c <ipc_msg_send_wait+0x44>
    }
    assert(msg->header.done == 1);
    e2b8:	e51b3008 	ldr	r3, [fp, #-8]
    e2bc:	e5d33000 	ldrb	r3, [r3]
    e2c0:	e2033002 	and	r3, r3, #2
    e2c4:	e6ef3073 	uxtb	r3, r3
    e2c8:	e3530000 	cmp	r3, #0
    e2cc:	1a000007 	bne	e2f0 <ipc_msg_send_wait+0x98>
    e2d0:	e3043e6c 	movw	r3, #20076	; 0x4e6c
    e2d4:	e3403001 	movt	r3, #1
    e2d8:	e3042f28 	movw	r2, #20264	; 0x4f28
    e2dc:	e3402001 	movt	r2, #1
    e2e0:	e3a0107e 	mov	r1, #126	; 0x7e
    e2e4:	e3040e84 	movw	r0, #20100	; 0x4e84
    e2e8:	e3400001 	movt	r0, #1
    e2ec:	eb00052d 	bl	f7a8 <__assert_func>
}
    e2f0:	e320f000 	nop	{0}
    e2f4:	e24bd004 	sub	sp, fp, #4
    e2f8:	e8bd8800 	pop	{fp, pc}

0000e2fc <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    e2fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    e300:	e28db000 	add	fp, sp, #0
    e304:	e24dd00c 	sub	sp, sp, #12
    e308:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    e30c:	e51b2008 	ldr	r2, [fp, #-8]
    e310:	e30d3cba 	movw	r3, #56506	; 0xdcba
    e314:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    e318:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    e31c:	e51b2008 	ldr	r2, [fp, #-8]
    e320:	e5d23000 	ldrb	r3, [r2]
    e324:	e3833001 	orr	r3, r3, #1
    e328:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    e32c:	e51b2008 	ldr	r2, [fp, #-8]
    e330:	e5d23000 	ldrb	r3, [r2]
    e334:	e7c1309f 	bfc	r3, #1, #1
    e338:	e5c23000 	strb	r3, [r2]
}
    e33c:	e320f000 	nop	{0}
    e340:	e28bd000 	add	sp, fp, #0
    e344:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    e348:	e12fff1e 	bx	lr

0000e34c <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    e34c:	e92d4800 	push	{fp, lr}
    e350:	e28db004 	add	fp, sp, #4
    e354:	e24dd010 	sub	sp, sp, #16
    e358:	e50b0010 	str	r0, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    e35c:	e51b3010 	ldr	r3, [fp, #-16]
    e360:	e5933010 	ldr	r3, [r3, #16]
    e364:	e51b2010 	ldr	r2, [fp, #-16]
    e368:	e5922008 	ldr	r2, [r2, #8]
    e36c:	e0833002 	add	r3, r3, r2
    e370:	e50b3008 	str	r3, [fp, #-8]
    while (msg->header.done == 0) {
    e374:	ea000000 	b	e37c <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield();
    e378:	eb000243 	bl	ec8c <yield>
    while (msg->header.done == 0) {
    e37c:	e51b3008 	ldr	r3, [fp, #-8]
    e380:	e5d33000 	ldrb	r3, [r3]
    e384:	e2033002 	and	r3, r3, #2
    e388:	e6ef3073 	uxtb	r3, r3
    e38c:	e3530000 	cmp	r3, #0
    e390:	0afffff8 	beq	e378 <ipc_session_wait+0x2c>
    }
    assert(msg->header.done == 1);
    e394:	e51b3008 	ldr	r3, [fp, #-8]
    e398:	e5d33000 	ldrb	r3, [r3]
    e39c:	e2033002 	and	r3, r3, #2
    e3a0:	e6ef3073 	uxtb	r3, r3
    e3a4:	e3530000 	cmp	r3, #0
    e3a8:	1a000007 	bne	e3cc <ipc_session_wait+0x80>
    e3ac:	e3043e6c 	movw	r3, #20076	; 0x4e6c
    e3b0:	e3403001 	movt	r3, #1
    e3b4:	e3042f3c 	movw	r2, #20284	; 0x4f3c
    e3b8:	e3402001 	movt	r2, #1
    e3bc:	e3a0108f 	mov	r1, #143	; 0x8f
    e3c0:	e3040e84 	movw	r0, #20100	; 0x4e84
    e3c4:	e3400001 	movt	r0, #1
    e3c8:	eb0004f6 	bl	f7a8 <__assert_func>
    return msg->header.ret_val;
    e3cc:	e51b3008 	ldr	r3, [fp, #-8]
    e3d0:	e5933008 	ldr	r3, [r3, #8]
}
    e3d4:	e1a00003 	mov	r0, r3
    e3d8:	e24bd004 	sub	sp, fp, #4
    e3dc:	e8bd8800 	pop	{fp, pc}

0000e3e0 <cur_session_id>:

static int cur_sess_id = -1;
int cur_session_id(void)
{
    e3e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    e3e4:	e28db000 	add	fp, sp, #0
    return cur_sess_id;
    e3e8:	e305320c 	movw	r3, #21004	; 0x520c
    e3ec:	e3403001 	movt	r3, #1
    e3f0:	e5933000 	ldr	r3, [r3]
}
    e3f4:	e1a00003 	mov	r0, r3
    e3f8:	e28bd000 	add	sp, fp, #0
    e3fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    e400:	e12fff1e 	bx	lr

0000e404 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    e404:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    e408:	e28db000 	add	fp, sp, #0
    session_delayed = true;
    e40c:	e3053bfd 	movw	r3, #23549	; 0x5bfd
    e410:	e3403001 	movt	r3, #1
    e414:	e3a02001 	mov	r2, #1
    e418:	e5c32000 	strb	r2, [r3]
}
    e41c:	e320f000 	nop	{0}
    e420:	e28bd000 	add	sp, fp, #0
    e424:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    e428:	e12fff1e 	bx	lr

0000e42c <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    e42c:	e92d4810 	push	{r4, fp, lr}
    e430:	e28db008 	add	fp, sp, #8
    e434:	e24ddf5d 	sub	sp, sp, #372	; 0x174
    e438:	e50b0178 	str	r0, [fp, #-376]	; 0xfffffe88
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
    e43c:	e24b3e17 	sub	r3, fp, #368	; 0x170
    e440:	e3a01010 	mov	r1, #16
    e444:	e1a00003 	mov	r0, r3
    e448:	eb00023e 	bl	ed48 <poll_session>
        /* handle each session */
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    e44c:	e3a03000 	mov	r3, #0
    e450:	e50b3010 	str	r3, [fp, #-16]
    e454:	ea000102 	b	e864 <ipc_server_loop+0x438>
            if (session_list[i].buf == NULL) {
    e458:	e51b2010 	ldr	r2, [fp, #-16]
    e45c:	e1a03002 	mov	r3, r2
    e460:	e1a03103 	lsl	r3, r3, #2
    e464:	e0833002 	add	r3, r3, r2
    e468:	e1a03103 	lsl	r3, r3, #2
    e46c:	e24b200c 	sub	r2, fp, #12
    e470:	e0823003 	add	r3, r2, r3
    e474:	e2433f55 	sub	r3, r3, #340	; 0x154
    e478:	e5933000 	ldr	r3, [r3]
    e47c:	e3530000 	cmp	r3, #0
    e480:	1a000001 	bne	e48c <ipc_server_loop+0x60>
                yield();
    e484:	eb000200 	bl	ec8c <yield>
                break;
    e488:	ea0000f8 	b	e870 <ipc_server_loop+0x444>
            }
            cur_sess_id = session_list[i].id;
    e48c:	e51b2010 	ldr	r2, [fp, #-16]
    e490:	e1a03002 	mov	r3, r2
    e494:	e1a03103 	lsl	r3, r3, #2
    e498:	e0833002 	add	r3, r3, r2
    e49c:	e1a03103 	lsl	r3, r3, #2
    e4a0:	e24b200c 	sub	r2, fp, #12
    e4a4:	e0823003 	add	r3, r2, r3
    e4a8:	e2433f59 	sub	r3, r3, #356	; 0x164
    e4ac:	e5932000 	ldr	r2, [r3]
    e4b0:	e305320c 	movw	r3, #21004	; 0x520c
    e4b4:	e3403001 	movt	r3, #1
    e4b8:	e5832000 	str	r2, [r3]
            struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
    e4bc:	e51b2010 	ldr	r2, [fp, #-16]
    e4c0:	e1a03002 	mov	r3, r2
    e4c4:	e1a03103 	lsl	r3, r3, #2
    e4c8:	e0833002 	add	r3, r3, r2
    e4cc:	e1a03103 	lsl	r3, r3, #2
    e4d0:	e24b200c 	sub	r2, fp, #12
    e4d4:	e0823003 	add	r3, r2, r3
    e4d8:	e2433f55 	sub	r3, r3, #340	; 0x154
    e4dc:	e5931000 	ldr	r1, [r3]
    e4e0:	e51b2010 	ldr	r2, [fp, #-16]
    e4e4:	e1a03002 	mov	r3, r2
    e4e8:	e1a03103 	lsl	r3, r3, #2
    e4ec:	e0833002 	add	r3, r3, r2
    e4f0:	e1a03103 	lsl	r3, r3, #2
    e4f4:	e24b200c 	sub	r2, fp, #12
    e4f8:	e0823003 	add	r3, r2, r3
    e4fc:	e2433f57 	sub	r3, r3, #348	; 0x15c
    e500:	e5933000 	ldr	r3, [r3]
    e504:	e0813003 	add	r3, r1, r3
    e508:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            /* handle every message in current session
                a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                interfaces[opcode] should explicitly call delay_session() and return to delay this session
            */
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    e50c:	ea0000b9 	b	e7f8 <ipc_server_loop+0x3cc>
                // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
    e510:	e24b1e17 	sub	r1, fp, #368	; 0x170
    e514:	e51b2010 	ldr	r2, [fp, #-16]
    e518:	e1a03002 	mov	r3, r2
    e51c:	e1a03103 	lsl	r3, r3, #2
    e520:	e0833002 	add	r3, r3, r2
    e524:	e1a03103 	lsl	r3, r3, #2
    e528:	e0813003 	add	r3, r1, r3
    e52c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    e530:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e534:	e593200c 	ldr	r2, [r3, #12]
    e538:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e53c:	e5933004 	ldr	r3, [r3, #4]
    e540:	e0822003 	add	r2, r2, r3
    e544:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e548:	e5933008 	ldr	r3, [r3, #8]
    e54c:	e0422003 	sub	r2, r2, r3
    e550:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e554:	e5933004 	ldr	r3, [r3, #4]
    e558:	e1a01003 	mov	r1, r3
    e55c:	e1a00002 	mov	r0, r2
    e560:	eb00031e 	bl	f1e0 <__aeabi_idivmod>
    e564:	e1a03001 	mov	r3, r1
    e568:	e3530000 	cmp	r3, #0
    e56c:	1a000038 	bne	e654 <ipc_server_loop+0x228>
    e570:	e24b1e17 	sub	r1, fp, #368	; 0x170
    e574:	e51b2010 	ldr	r2, [fp, #-16]
    e578:	e1a03002 	mov	r3, r2
    e57c:	e1a03103 	lsl	r3, r3, #2
    e580:	e0833002 	add	r3, r3, r2
    e584:	e1a03103 	lsl	r3, r3, #2
    e588:	e0813003 	add	r3, r1, r3
    e58c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e590:	e1d220b2 	ldrh	r2, [r2, #2]
    e594:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    e598:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    e59c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e5a0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
}

__attribute__((__always_inline__)) static inline int session_remain_capacity(struct Session* session)
{
    return session->capacity - session_used_size(session);
    e5a4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e5a8:	e5934004 	ldr	r4, [r3, #4]
    e5ac:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e5b0:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    e5b4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e5b8:	e593200c 	ldr	r2, [r3, #12]
    e5bc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e5c0:	e5933004 	ldr	r3, [r3, #4]
    e5c4:	e0822003 	add	r2, r2, r3
    e5c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e5cc:	e5933008 	ldr	r3, [r3, #8]
    e5d0:	e0422003 	sub	r2, r2, r3
    e5d4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e5d8:	e5933004 	ldr	r3, [r3, #4]
    e5dc:	e1a01003 	mov	r1, r3
    e5e0:	e1a00002 	mov	r0, r2
    e5e4:	eb0002fd 	bl	f1e0 <__aeabi_idivmod>
    e5e8:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    e5ec:	e0443003 	sub	r3, r4, r3
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    e5f0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    e5f4:	e1520003 	cmp	r2, r3
    e5f8:	da000004 	ble	e610 <ipc_server_loop+0x1e4>
        printf("forward tail with too much size\n");
    e5fc:	e3040e90 	movw	r0, #20112	; 0x4e90
    e600:	e3400001 	movt	r0, #1
    e604:	ebffe80d 	bl	8640 <printf>
        return -1;
    e608:	e3e03000 	mvn	r3, #0
    e60c:	ea00000e 	b	e64c <ipc_server_loop+0x220>
    }
    session->tail = (session->tail + len) % session->capacity;
    e610:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e614:	e593200c 	ldr	r2, [r3, #12]
    e618:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    e61c:	e0822003 	add	r2, r2, r3
    e620:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e624:	e5933004 	ldr	r3, [r3, #4]
    e628:	e1a01003 	mov	r1, r3
    e62c:	e1a00002 	mov	r0, r2
    e630:	eb0002ea 	bl	f1e0 <__aeabi_idivmod>
    e634:	e1a03001 	mov	r3, r1
    e638:	e1a02003 	mov	r2, r3
    e63c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e640:	e583200c 	str	r2, [r3, #12]
    return session->tail;
    e644:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e648:	e593300c 	ldr	r3, [r3, #12]
    e64c:	e3530000 	cmp	r3, #0
    e650:	ba00007b 	blt	e844 <ipc_server_loop+0x418>
                    break;
                }
                if (ipc_node->interfaces[msg->header.opcode]) {
    e654:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e658:	e5d33001 	ldrb	r3, [r3, #1]
    e65c:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    e660:	e1a03103 	lsl	r3, r3, #2
    e664:	e0823003 	add	r3, r2, r3
    e668:	e5933004 	ldr	r3, [r3, #4]
    e66c:	e3530000 	cmp	r3, #0
    e670:	0a000011 	beq	e6bc <ipc_server_loop+0x290>
                    ipc_node->interfaces[msg->header.opcode](msg);
    e674:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e678:	e5d33001 	ldrb	r3, [r3, #1]
    e67c:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    e680:	e1a03103 	lsl	r3, r3, #2
    e684:	e0823003 	add	r3, r2, r3
    e688:	e5933004 	ldr	r3, [r3, #4]
    e68c:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    e690:	e12fff33 	blx	r3
                    // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                    if (session_delayed) {
    e694:	e3053bfd 	movw	r3, #23549	; 0x5bfd
    e698:	e3403001 	movt	r3, #1
    e69c:	e5d33000 	ldrb	r3, [r3]
    e6a0:	e3530000 	cmp	r3, #0
    e6a4:	0a00000f 	beq	e6e8 <ipc_server_loop+0x2bc>
                        session_delayed = false;
    e6a8:	e3053bfd 	movw	r3, #23549	; 0x5bfd
    e6ac:	e3403001 	movt	r3, #1
    e6b0:	e3a02000 	mov	r2, #0
    e6b4:	e5c32000 	strb	r2, [r3]
                        break;
    e6b8:	ea000062 	b	e848 <ipc_server_loop+0x41c>
                    }
                } else {
                    printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
    e6bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e6c0:	e5d33001 	ldrb	r3, [r3, #1]
    e6c4:	e1a01003 	mov	r1, r3
    e6c8:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    e6cc:	e5933000 	ldr	r3, [r3]
    e6d0:	e1a02003 	mov	r2, r3
    e6d4:	e3040eb4 	movw	r0, #20148	; 0x4eb4
    e6d8:	e3400001 	movt	r0, #1
    e6dc:	ebffe7d7 	bl	8640 <printf>
                }
                // finish this message in server's perspective
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    e6e0:	ea000000 	b	e6e8 <ipc_server_loop+0x2bc>
                    yield();
    e6e4:	eb000168 	bl	ec8c <yield>
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    e6e8:	e24b1e17 	sub	r1, fp, #368	; 0x170
    e6ec:	e51b2010 	ldr	r2, [fp, #-16]
    e6f0:	e1a03002 	mov	r3, r2
    e6f4:	e1a03103 	lsl	r3, r3, #2
    e6f8:	e0833002 	add	r3, r3, r2
    e6fc:	e1a03103 	lsl	r3, r3, #2
    e700:	e0813003 	add	r3, r1, r3
    e704:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    e708:	e1d220b2 	ldrh	r2, [r2, #2]
    e70c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    e710:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    if (((session->head + len) % session->capacity) > session->tail) {
    e714:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e718:	e5932008 	ldr	r2, [r3, #8]
    e71c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    e720:	e0822003 	add	r2, r2, r3
    e724:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e728:	e5933004 	ldr	r3, [r3, #4]
    e72c:	e1a01003 	mov	r1, r3
    e730:	e1a00002 	mov	r0, r2
    e734:	eb0002a9 	bl	f1e0 <__aeabi_idivmod>
    e738:	e1a03001 	mov	r3, r1
    e73c:	e1a02003 	mov	r2, r3
    e740:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e744:	e593300c 	ldr	r3, [r3, #12]
    e748:	e1520003 	cmp	r2, r3
    e74c:	da000004 	ble	e764 <ipc_server_loop+0x338>
        printf("forward head with too much size\n");
    e750:	e3040edc 	movw	r0, #20188	; 0x4edc
    e754:	e3400001 	movt	r0, #1
    e758:	ebffe7b8 	bl	8640 <printf>
        return -1;
    e75c:	e3e03000 	mvn	r3, #0
    e760:	ea00000e 	b	e7a0 <ipc_server_loop+0x374>
    session->head = (session->head + len) % session->capacity;
    e764:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e768:	e5932008 	ldr	r2, [r3, #8]
    e76c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    e770:	e0822003 	add	r2, r2, r3
    e774:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e778:	e5933004 	ldr	r3, [r3, #4]
    e77c:	e1a01003 	mov	r1, r3
    e780:	e1a00002 	mov	r0, r2
    e784:	eb000295 	bl	f1e0 <__aeabi_idivmod>
    e788:	e1a03001 	mov	r3, r1
    e78c:	e1a02003 	mov	r2, r3
    e790:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e794:	e5832008 	str	r2, [r3, #8]
    return session->head;
    e798:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    e79c:	e5933008 	ldr	r3, [r3, #8]
    e7a0:	e3530000 	cmp	r3, #0
    e7a4:	baffffce 	blt	e6e4 <ipc_server_loop+0x2b8>
                }
                msg = IPCSESSION_MSG(&session_list[i]);
    e7a8:	e51b2010 	ldr	r2, [fp, #-16]
    e7ac:	e1a03002 	mov	r3, r2
    e7b0:	e1a03103 	lsl	r3, r3, #2
    e7b4:	e0833002 	add	r3, r3, r2
    e7b8:	e1a03103 	lsl	r3, r3, #2
    e7bc:	e24b200c 	sub	r2, fp, #12
    e7c0:	e0823003 	add	r3, r2, r3
    e7c4:	e2433f55 	sub	r3, r3, #340	; 0x154
    e7c8:	e5931000 	ldr	r1, [r3]
    e7cc:	e51b2010 	ldr	r2, [fp, #-16]
    e7d0:	e1a03002 	mov	r3, r2
    e7d4:	e1a03103 	lsl	r3, r3, #2
    e7d8:	e0833002 	add	r3, r3, r2
    e7dc:	e1a03103 	lsl	r3, r3, #2
    e7e0:	e24b200c 	sub	r2, fp, #12
    e7e4:	e0823003 	add	r3, r2, r3
    e7e8:	e2433f57 	sub	r3, r3, #348	; 0x15c
    e7ec:	e5933000 	ldr	r3, [r3]
    e7f0:	e0813003 	add	r3, r1, r3
    e7f4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    e7f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e7fc:	e5932004 	ldr	r2, [r3, #4]
    e800:	e30d3cba 	movw	r3, #56506	; 0xdcba
    e804:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    e808:	e1520003 	cmp	r2, r3
    e80c:	1a00000d 	bne	e848 <ipc_server_loop+0x41c>
    e810:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e814:	e5d33000 	ldrb	r3, [r3]
    e818:	e2033001 	and	r3, r3, #1
    e81c:	e6ef3073 	uxtb	r3, r3
    e820:	e3530000 	cmp	r3, #0
    e824:	0a000007 	beq	e848 <ipc_server_loop+0x41c>
    e828:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e82c:	e5d33000 	ldrb	r3, [r3]
    e830:	e2033002 	and	r3, r3, #2
    e834:	e6ef3073 	uxtb	r3, r3
    e838:	e3530000 	cmp	r3, #0
    e83c:	0affff33 	beq	e510 <ipc_server_loop+0xe4>
    e840:	ea000000 	b	e848 <ipc_server_loop+0x41c>
                    break;
    e844:	e320f000 	nop	{0}
            }
            // stop handle this session
            cur_sess_id = -1;
    e848:	e305320c 	movw	r3, #21004	; 0x520c
    e84c:	e3403001 	movt	r3, #1
    e850:	e3e02000 	mvn	r2, #0
    e854:	e5832000 	str	r2, [r3]
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    e858:	e51b3010 	ldr	r3, [fp, #-16]
    e85c:	e2833001 	add	r3, r3, #1
    e860:	e50b3010 	str	r3, [fp, #-16]
    e864:	e51b3010 	ldr	r3, [fp, #-16]
    e868:	e353000f 	cmp	r3, #15
    e86c:	dafffef9 	ble	e458 <ipc_server_loop+0x2c>
        poll_session(session_list, NR_MAX_SESSION);
    e870:	eafffef1 	b	e43c <ipc_server_loop+0x10>

0000e874 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    e874:	e92d4800 	push	{fp, lr}
    e878:	e28db004 	add	fp, sp, #4
    e87c:	e24dd010 	sub	sp, sp, #16
    e880:	e50b0008 	str	r0, [fp, #-8]
    e884:	e50b100c 	str	r1, [fp, #-12]
    e888:	e50b2010 	str	r2, [fp, #-16]
    return session(_path, _capacity, _session);
    e88c:	e51b2008 	ldr	r2, [fp, #-8]
    e890:	e51b1010 	ldr	r1, [fp, #-16]
    e894:	e51b000c 	ldr	r0, [fp, #-12]
    e898:	eb000118 	bl	ed00 <session>
    e89c:	e1a03000 	mov	r3, r0
}
    e8a0:	e1a00003 	mov	r0, r3
    e8a4:	e24bd004 	sub	sp, fp, #4
    e8a8:	e8bd8800 	pop	{fp, pc}

0000e8ac <free_session>:

int free_session(struct Session* session)
{
    e8ac:	e92d4800 	push	{fp, lr}
    e8b0:	e28db004 	add	fp, sp, #4
    e8b4:	e24dd008 	sub	sp, sp, #8
    e8b8:	e50b0008 	str	r0, [fp, #-8]
    return close_session(session);
    e8bc:	e51b0008 	ldr	r0, [fp, #-8]
    e8c0:	eb000130 	bl	ed88 <close_session>
    e8c4:	e1a03000 	mov	r3, r0
}
    e8c8:	e1a00003 	mov	r0, r3
    e8cc:	e24bd004 	sub	sp, fp, #4
    e8d0:	e8bd8800 	pop	{fp, pc}

0000e8d4 <session_alloc_buf>:

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    e8d4:	e92d4810 	push	{r4, fp, lr}
    e8d8:	e28db008 	add	fp, sp, #8
    e8dc:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    e8e0:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    e8e4:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    e8e8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    e8ec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return session->capacity - session_used_size(session);
    e8f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e8f4:	e5934004 	ldr	r4, [r3, #4]
    e8f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    e8fc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    e900:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e904:	e593200c 	ldr	r2, [r3, #12]
    e908:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e90c:	e5933004 	ldr	r3, [r3, #4]
    e910:	e0822003 	add	r2, r2, r3
    e914:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e918:	e5933008 	ldr	r3, [r3, #8]
    e91c:	e0422003 	sub	r2, r2, r3
    e920:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    e924:	e5933004 	ldr	r3, [r3, #4]
    e928:	e1a01003 	mov	r1, r3
    e92c:	e1a00002 	mov	r0, r2
    e930:	eb00022a 	bl	f1e0 <__aeabi_idivmod>
    e934:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    e938:	e0442003 	sub	r2, r4, r3
    if (len > session_remain_capacity(session)) {
    e93c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    e940:	e1520003 	cmp	r2, r3
    e944:	aa000001 	bge	e950 <session_alloc_buf+0x7c>
        return NULL;
    e948:	e3a03000 	mov	r3, #0
    e94c:	ea000038 	b	ea34 <session_alloc_buf+0x160>
    }
    void* buf = session->buf + session->tail;
    e950:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    e954:	e5933010 	ldr	r3, [r3, #16]
    e958:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    e95c:	e592200c 	ldr	r2, [r2, #12]
    e960:	e0833002 	add	r3, r3, r2
    e964:	e50b3010 	str	r3, [fp, #-16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    e968:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    e96c:	e1a02003 	mov	r2, r3
    e970:	e3a01000 	mov	r1, #0
    e974:	e51b0010 	ldr	r0, [fp, #-16]
    e978:	eb000475 	bl	fb54 <memset>
    e97c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    e980:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    e984:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    e988:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    e98c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    e990:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    e994:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e998:	e5934004 	ldr	r4, [r3, #4]
    e99c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    e9a0:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    e9a4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e9a8:	e593200c 	ldr	r2, [r3, #12]
    e9ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e9b0:	e5933004 	ldr	r3, [r3, #4]
    e9b4:	e0822003 	add	r2, r2, r3
    e9b8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e9bc:	e5933008 	ldr	r3, [r3, #8]
    e9c0:	e0422003 	sub	r2, r2, r3
    e9c4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    e9c8:	e5933004 	ldr	r3, [r3, #4]
    e9cc:	e1a01003 	mov	r1, r3
    e9d0:	e1a00002 	mov	r0, r2
    e9d4:	eb000201 	bl	f1e0 <__aeabi_idivmod>
    e9d8:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    e9dc:	e0443003 	sub	r3, r4, r3
    if (len > session_remain_capacity(session)) {
    e9e0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    e9e4:	e1520003 	cmp	r2, r3
    e9e8:	da000003 	ble	e9fc <session_alloc_buf+0x128>
        printf("forward tail with too much size\n");
    e9ec:	e3040f50 	movw	r0, #20304	; 0x4f50
    e9f0:	e3400001 	movt	r0, #1
    e9f4:	ebffe711 	bl	8640 <printf>
    e9f8:	ea00000c 	b	ea30 <session_alloc_buf+0x15c>
    session->tail = (session->tail + len) % session->capacity;
    e9fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ea00:	e593200c 	ldr	r2, [r3, #12]
    ea04:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    ea08:	e0822003 	add	r2, r2, r3
    ea0c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ea10:	e5933004 	ldr	r3, [r3, #4]
    ea14:	e1a01003 	mov	r1, r3
    ea18:	e1a00002 	mov	r0, r2
    ea1c:	eb0001ef 	bl	f1e0 <__aeabi_idivmod>
    ea20:	e1a03001 	mov	r3, r1
    ea24:	e1a02003 	mov	r2, r3
    ea28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ea2c:	e583200c 	str	r2, [r3, #12]
    session_forward_tail(session, len);
    return buf;
    ea30:	e51b3010 	ldr	r3, [fp, #-16]
}
    ea34:	e1a00003 	mov	r0, r3
    ea38:	e24bd008 	sub	sp, fp, #8
    ea3c:	e8bd8810 	pop	{r4, fp, pc}

0000ea40 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    ea40:	e92d4800 	push	{fp, lr}
    ea44:	e28db004 	add	fp, sp, #4
    ea48:	e24dd018 	sub	sp, sp, #24
    ea4c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    ea50:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    ea54:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ea58:	e50b3008 	str	r3, [fp, #-8]
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    ea5c:	e51b3008 	ldr	r3, [fp, #-8]
    ea60:	e593200c 	ldr	r2, [r3, #12]
    ea64:	e51b3008 	ldr	r3, [fp, #-8]
    ea68:	e5933004 	ldr	r3, [r3, #4]
    ea6c:	e0822003 	add	r2, r2, r3
    ea70:	e51b3008 	ldr	r3, [fp, #-8]
    ea74:	e5933008 	ldr	r3, [r3, #8]
    ea78:	e0422003 	sub	r2, r2, r3
    ea7c:	e51b3008 	ldr	r3, [fp, #-8]
    ea80:	e5933004 	ldr	r3, [r3, #4]
    ea84:	e1a01003 	mov	r1, r3
    ea88:	e1a00002 	mov	r0, r2
    ea8c:	eb0001d3 	bl	f1e0 <__aeabi_idivmod>
    ea90:	e1a03001 	mov	r3, r1
    ea94:	e1a02003 	mov	r2, r3
    if (len > session_used_size(session)) {
    ea98:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ea9c:	e1520003 	cmp	r2, r3
    eaa0:	aa000001 	bge	eaac <session_free_buf+0x6c>
        return false;
    eaa4:	e3a03000 	mov	r3, #0
    eaa8:	ea000031 	b	eb74 <session_free_buf+0x134>
    eaac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    eab0:	e50b300c 	str	r3, [fp, #-12]
    eab4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    eab8:	e50b3010 	str	r3, [fp, #-16]
    if (((session->head + len) % session->capacity) > session->tail) {
    eabc:	e51b300c 	ldr	r3, [fp, #-12]
    eac0:	e5932008 	ldr	r2, [r3, #8]
    eac4:	e51b3010 	ldr	r3, [fp, #-16]
    eac8:	e0822003 	add	r2, r2, r3
    eacc:	e51b300c 	ldr	r3, [fp, #-12]
    ead0:	e5933004 	ldr	r3, [r3, #4]
    ead4:	e1a01003 	mov	r1, r3
    ead8:	e1a00002 	mov	r0, r2
    eadc:	eb0001bf 	bl	f1e0 <__aeabi_idivmod>
    eae0:	e1a03001 	mov	r3, r1
    eae4:	e1a02003 	mov	r2, r3
    eae8:	e51b300c 	ldr	r3, [fp, #-12]
    eaec:	e593300c 	ldr	r3, [r3, #12]
    eaf0:	e1520003 	cmp	r2, r3
    eaf4:	da000004 	ble	eb0c <session_free_buf+0xcc>
        printf("forward head with too much size\n");
    eaf8:	e3040f74 	movw	r0, #20340	; 0x4f74
    eafc:	e3400001 	movt	r0, #1
    eb00:	ebffe6ce 	bl	8640 <printf>
        return -1;
    eb04:	e3e03000 	mvn	r3, #0
    eb08:	ea00000e 	b	eb48 <session_free_buf+0x108>
    session->head = (session->head + len) % session->capacity;
    eb0c:	e51b300c 	ldr	r3, [fp, #-12]
    eb10:	e5932008 	ldr	r2, [r3, #8]
    eb14:	e51b3010 	ldr	r3, [fp, #-16]
    eb18:	e0822003 	add	r2, r2, r3
    eb1c:	e51b300c 	ldr	r3, [fp, #-12]
    eb20:	e5933004 	ldr	r3, [r3, #4]
    eb24:	e1a01003 	mov	r1, r3
    eb28:	e1a00002 	mov	r0, r2
    eb2c:	eb0001ab 	bl	f1e0 <__aeabi_idivmod>
    eb30:	e1a03001 	mov	r3, r1
    eb34:	e1a02003 	mov	r2, r3
    eb38:	e51b300c 	ldr	r3, [fp, #-12]
    eb3c:	e5832008 	str	r2, [r3, #8]
    return session->head;
    eb40:	e51b300c 	ldr	r3, [fp, #-12]
    eb44:	e5933008 	ldr	r3, [r3, #8]
    }
    assert(session_forward_head(session, len) != 1);
    eb48:	e3530001 	cmp	r3, #1
    eb4c:	1a000007 	bne	eb70 <session_free_buf+0x130>
    eb50:	e3043f98 	movw	r3, #20376	; 0x4f98
    eb54:	e3403001 	movt	r3, #1
    eb58:	e3042fcc 	movw	r2, #20428	; 0x4fcc
    eb5c:	e3402001 	movt	r2, #1
    eb60:	e3a01040 	mov	r1, #64	; 0x40
    eb64:	e3040fc0 	movw	r0, #20416	; 0x4fc0
    eb68:	e3400001 	movt	r0, #1
    eb6c:	eb00030d 	bl	f7a8 <__assert_func>
    return true;
    eb70:	e3a03001 	mov	r3, #1
}
    eb74:	e1a00003 	mov	r0, r3
    eb78:	e24bd004 	sub	sp, fp, #4
    eb7c:	e8bd8800 	pop	{fp, pc}

0000eb80 <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    eb80:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    eb84:	e28db014 	add	fp, sp, #20
    eb88:	e24dd018 	sub	sp, sp, #24
    eb8c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    eb90:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    eb94:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    eb98:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    eb9c:	e3e03000 	mvn	r3, #0
    eba0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    eba4:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    eba8:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    ebac:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    ebb0:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    ebb4:	e59b7004 	ldr	r7, [fp, #4]
    ebb8:	e1a0000c 	mov	r0, ip
    ebbc:	e1a0100e 	mov	r1, lr
    ebc0:	e1a02005 	mov	r2, r5
    ebc4:	e1a03006 	mov	r3, r6
    ebc8:	e1a04007 	mov	r4, r7
    ebcc:	ef000000 	svc	0x00000000
    ebd0:	f57ff04f 	dsb	sy
    ebd4:	f57ff06f 	isb	sy
    ebd8:	e1a0c000 	mov	ip, r0
    ebdc:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    ebe0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    ebe4:	e1a00003 	mov	r0, r3
    ebe8:	e24bd014 	sub	sp, fp, #20
    ebec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

0000ebf0 <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    ebf0:	e92d4800 	push	{fp, lr}
    ebf4:	e28db004 	add	fp, sp, #4
    ebf8:	e24dd028 	sub	sp, sp, #40	; 0x28
    ebfc:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    ec00:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    ec04:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    ec08:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    ec0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ec10:	e50b3010 	str	r3, [fp, #-16]
    ec14:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    ec18:	e50b300c 	str	r3, [fp, #-12]
    ec1c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    ec20:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    ec24:	e24b1010 	sub	r1, fp, #16
    ec28:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    ec2c:	e59b0004 	ldr	r0, [fp, #4]
    ec30:	e3a03000 	mov	r3, #0
    ec34:	e58d3000 	str	r3, [sp]
    ec38:	e1a03000 	mov	r3, r0
    ec3c:	e3a00001 	mov	r0, #1
    ec40:	ebffffce 	bl	eb80 <syscall>
    ec44:	e1a03000 	mov	r3, r0
}
    ec48:	e1a00003 	mov	r0, r3
    ec4c:	e24bd004 	sub	sp, fp, #4
    ec50:	e8bd8800 	pop	{fp, pc}

0000ec54 <exit>:

int exit()
{
    ec54:	e92d4800 	push	{fp, lr}
    ec58:	e28db004 	add	fp, sp, #4
    ec5c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    ec60:	e3a03000 	mov	r3, #0
    ec64:	e58d3000 	str	r3, [sp]
    ec68:	e3a03000 	mov	r3, #0
    ec6c:	e3a02000 	mov	r2, #0
    ec70:	e3a01000 	mov	r1, #0
    ec74:	e3a00002 	mov	r0, #2
    ec78:	ebffffc0 	bl	eb80 <syscall>
    ec7c:	e1a03000 	mov	r3, r0
}
    ec80:	e1a00003 	mov	r0, r3
    ec84:	e24bd004 	sub	sp, fp, #4
    ec88:	e8bd8800 	pop	{fp, pc}

0000ec8c <yield>:

int yield()
{
    ec8c:	e92d4800 	push	{fp, lr}
    ec90:	e28db004 	add	fp, sp, #4
    ec94:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    ec98:	e3a03000 	mov	r3, #0
    ec9c:	e58d3000 	str	r3, [sp]
    eca0:	e3a03000 	mov	r3, #0
    eca4:	e3a02000 	mov	r2, #0
    eca8:	e3a01000 	mov	r1, #0
    ecac:	e3a00003 	mov	r0, #3
    ecb0:	ebffffb2 	bl	eb80 <syscall>
    ecb4:	e1a03000 	mov	r3, r0
}
    ecb8:	e1a00003 	mov	r0, r3
    ecbc:	e24bd004 	sub	sp, fp, #4
    ecc0:	e8bd8800 	pop	{fp, pc}

0000ecc4 <register_server>:

int register_server(char* name)
{
    ecc4:	e92d4800 	push	{fp, lr}
    ecc8:	e28db004 	add	fp, sp, #4
    eccc:	e24dd010 	sub	sp, sp, #16
    ecd0:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    ecd4:	e51b1008 	ldr	r1, [fp, #-8]
    ecd8:	e3a03000 	mov	r3, #0
    ecdc:	e58d3000 	str	r3, [sp]
    ece0:	e3a03000 	mov	r3, #0
    ece4:	e3a02000 	mov	r2, #0
    ece8:	e3a00005 	mov	r0, #5
    ecec:	ebffffa3 	bl	eb80 <syscall>
    ecf0:	e1a03000 	mov	r3, r0
}
    ecf4:	e1a00003 	mov	r0, r3
    ecf8:	e24bd004 	sub	sp, fp, #4
    ecfc:	e8bd8800 	pop	{fp, pc}

0000ed00 <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    ed00:	e92d4800 	push	{fp, lr}
    ed04:	e28db004 	add	fp, sp, #4
    ed08:	e24dd018 	sub	sp, sp, #24
    ed0c:	e50b0008 	str	r0, [fp, #-8]
    ed10:	e50b100c 	str	r1, [fp, #-12]
    ed14:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    ed18:	e51b1008 	ldr	r1, [fp, #-8]
    ed1c:	e51b2010 	ldr	r2, [fp, #-16]
    ed20:	e3a03000 	mov	r3, #0
    ed24:	e58d3000 	str	r3, [sp]
    ed28:	e1a03002 	mov	r3, r2
    ed2c:	e51b200c 	ldr	r2, [fp, #-12]
    ed30:	e3a00006 	mov	r0, #6
    ed34:	ebffff91 	bl	eb80 <syscall>
    ed38:	e1a03000 	mov	r3, r0
}
    ed3c:	e1a00003 	mov	r0, r3
    ed40:	e24bd004 	sub	sp, fp, #4
    ed44:	e8bd8800 	pop	{fp, pc}

0000ed48 <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    ed48:	e92d4800 	push	{fp, lr}
    ed4c:	e28db004 	add	fp, sp, #4
    ed50:	e24dd010 	sub	sp, sp, #16
    ed54:	e50b0008 	str	r0, [fp, #-8]
    ed58:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    ed5c:	e51b1008 	ldr	r1, [fp, #-8]
    ed60:	e3a03000 	mov	r3, #0
    ed64:	e58d3000 	str	r3, [sp]
    ed68:	e3a03000 	mov	r3, #0
    ed6c:	e51b200c 	ldr	r2, [fp, #-12]
    ed70:	e3a00007 	mov	r0, #7
    ed74:	ebffff81 	bl	eb80 <syscall>
    ed78:	e1a03000 	mov	r3, r0
}
    ed7c:	e1a00003 	mov	r0, r3
    ed80:	e24bd004 	sub	sp, fp, #4
    ed84:	e8bd8800 	pop	{fp, pc}

0000ed88 <close_session>:

int close_session(struct Session* session)
{
    ed88:	e92d4800 	push	{fp, lr}
    ed8c:	e28db004 	add	fp, sp, #4
    ed90:	e24dd010 	sub	sp, sp, #16
    ed94:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    ed98:	e51b1008 	ldr	r1, [fp, #-8]
    ed9c:	e3a03000 	mov	r3, #0
    eda0:	e58d3000 	str	r3, [sp]
    eda4:	e3a03000 	mov	r3, #0
    eda8:	e3a02000 	mov	r2, #0
    edac:	e3a00008 	mov	r0, #8
    edb0:	ebffff72 	bl	eb80 <syscall>
    edb4:	e1a03000 	mov	r3, r0
}
    edb8:	e1a00003 	mov	r0, r3
    edbc:	e24bd004 	sub	sp, fp, #4
    edc0:	e8bd8800 	pop	{fp, pc}

0000edc4 <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    edc4:	e92d4800 	push	{fp, lr}
    edc8:	e28db004 	add	fp, sp, #4
    edcc:	e24dd010 	sub	sp, sp, #16
    edd0:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    edd4:	e51b2008 	ldr	r2, [fp, #-8]
    edd8:	e3a03000 	mov	r3, #0
    eddc:	e58d3000 	str	r3, [sp]
    ede0:	e3a03000 	mov	r3, #0
    ede4:	e3a01003 	mov	r1, #3
    ede8:	e3a0000a 	mov	r0, #10
    edec:	ebffff63 	bl	eb80 <syscall>
    edf0:	e1a03000 	mov	r3, r0
}
    edf4:	e1a00003 	mov	r0, r3
    edf8:	e24bd004 	sub	sp, fp, #4
    edfc:	e8bd8800 	pop	{fp, pc}

0000ee00 <set_priority>:

int set_priority(sys_state_info* info)
{
    ee00:	e92d4800 	push	{fp, lr}
    ee04:	e28db004 	add	fp, sp, #4
    ee08:	e24dd010 	sub	sp, sp, #16
    ee0c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    ee10:	e51b2008 	ldr	r2, [fp, #-8]
    ee14:	e3a03000 	mov	r3, #0
    ee18:	e58d3000 	str	r3, [sp]
    ee1c:	e3a03000 	mov	r3, #0
    ee20:	e3a01001 	mov	r1, #1
    ee24:	e3a0000a 	mov	r0, #10
    ee28:	ebffff54 	bl	eb80 <syscall>
    ee2c:	e1a03000 	mov	r3, r0
}
    ee30:	e1a00003 	mov	r0, r3
    ee34:	e24bd004 	sub	sp, fp, #4
    ee38:	e8bd8800 	pop	{fp, pc}

0000ee3c <task_heap_base>:

int task_heap_base()
{
    ee3c:	e92d4800 	push	{fp, lr}
    ee40:	e28db004 	add	fp, sp, #4
    ee44:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    ee48:	e3a03000 	mov	r3, #0
    ee4c:	e58d3000 	str	r3, [sp]
    ee50:	e3a03000 	mov	r3, #0
    ee54:	e3a02000 	mov	r2, #0
    ee58:	e3a01002 	mov	r1, #2
    ee5c:	e3a0000a 	mov	r0, #10
    ee60:	ebffff46 	bl	eb80 <syscall>
    ee64:	e1a03000 	mov	r3, r0
}
    ee68:	e1a00003 	mov	r0, r3
    ee6c:	e24bd004 	sub	sp, fp, #4
    ee70:	e8bd8800 	pop	{fp, pc}

0000ee74 <show_task>:

int show_task()
{
    ee74:	e92d4800 	push	{fp, lr}
    ee78:	e28db004 	add	fp, sp, #4
    ee7c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    ee80:	e3a03000 	mov	r3, #0
    ee84:	e58d3000 	str	r3, [sp]
    ee88:	e3a03000 	mov	r3, #0
    ee8c:	e3a02000 	mov	r2, #0
    ee90:	e3a01004 	mov	r1, #4
    ee94:	e3a0000a 	mov	r0, #10
    ee98:	ebffff38 	bl	eb80 <syscall>
    ee9c:	e1a03000 	mov	r3, r0
}
    eea0:	e1a00003 	mov	r0, r3
    eea4:	e24bd004 	sub	sp, fp, #4
    eea8:	e8bd8800 	pop	{fp, pc}

0000eeac <show_mem>:

int show_mem()
{
    eeac:	e92d4800 	push	{fp, lr}
    eeb0:	e28db004 	add	fp, sp, #4
    eeb4:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    eeb8:	e3a03000 	mov	r3, #0
    eebc:	e58d3000 	str	r3, [sp]
    eec0:	e3a03000 	mov	r3, #0
    eec4:	e3a02000 	mov	r2, #0
    eec8:	e3a01005 	mov	r1, #5
    eecc:	e3a0000a 	mov	r0, #10
    eed0:	ebffff2a 	bl	eb80 <syscall>
    eed4:	e1a03000 	mov	r3, r0
}
    eed8:	e1a00003 	mov	r0, r3
    eedc:	e24bd004 	sub	sp, fp, #4
    eee0:	e8bd8800 	pop	{fp, pc}

0000eee4 <show_cpu>:

int show_cpu()
{
    eee4:	e92d4800 	push	{fp, lr}
    eee8:	e28db004 	add	fp, sp, #4
    eeec:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    eef0:	e3a03000 	mov	r3, #0
    eef4:	e58d3000 	str	r3, [sp]
    eef8:	e3a03000 	mov	r3, #0
    eefc:	e3a02000 	mov	r2, #0
    ef00:	e3a01006 	mov	r1, #6
    ef04:	e3a0000a 	mov	r0, #10
    ef08:	ebffff1c 	bl	eb80 <syscall>
    ef0c:	e1a03000 	mov	r3, r0
}
    ef10:	e1a00003 	mov	r0, r3
    ef14:	e24bd004 	sub	sp, fp, #4
    ef18:	e8bd8800 	pop	{fp, pc}

0000ef1c <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    ef1c:	e92d4800 	push	{fp, lr}
    ef20:	e28db004 	add	fp, sp, #4
    ef24:	e24dd018 	sub	sp, sp, #24
    ef28:	e50b0008 	str	r0, [fp, #-8]
    ef2c:	e50b100c 	str	r1, [fp, #-12]
    ef30:	e50b2010 	str	r2, [fp, #-16]
    ef34:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    ef38:	e51b1008 	ldr	r1, [fp, #-8]
    ef3c:	e51b200c 	ldr	r2, [fp, #-12]
    ef40:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    ef44:	e58d3000 	str	r3, [sp]
    ef48:	e51b3010 	ldr	r3, [fp, #-16]
    ef4c:	e3a00004 	mov	r0, #4
    ef50:	ebffff0a 	bl	eb80 <syscall>
    ef54:	e1a03000 	mov	r3, r0
}
    ef58:	e1a00003 	mov	r0, r3
    ef5c:	e24bd004 	sub	sp, fp, #4
    ef60:	e8bd8800 	pop	{fp, pc}

0000ef64 <register_irq>:

int register_irq(int irq, int opcode)
{
    ef64:	e92d4800 	push	{fp, lr}
    ef68:	e28db004 	add	fp, sp, #4
    ef6c:	e24dd010 	sub	sp, sp, #16
    ef70:	e50b0008 	str	r0, [fp, #-8]
    ef74:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    ef78:	e3a03000 	mov	r3, #0
    ef7c:	e58d3000 	str	r3, [sp]
    ef80:	e3a03000 	mov	r3, #0
    ef84:	e51b200c 	ldr	r2, [fp, #-12]
    ef88:	e51b1008 	ldr	r1, [fp, #-8]
    ef8c:	e3a0000b 	mov	r0, #11
    ef90:	ebfffefa 	bl	eb80 <syscall>
    ef94:	e1a03000 	mov	r3, r0
    ef98:	e1a00003 	mov	r0, r3
    ef9c:	e24bd004 	sub	sp, fp, #4
    efa0:	e8bd8800 	pop	{fp, pc}

0000efa4 <__udivsi3>:
    efa4:	e2512001 	subs	r2, r1, #1
    efa8:	012fff1e 	bxeq	lr
    efac:	3a000036 	bcc	f08c <__udivsi3+0xe8>
    efb0:	e1500001 	cmp	r0, r1
    efb4:	9a000022 	bls	f044 <__udivsi3+0xa0>
    efb8:	e1110002 	tst	r1, r2
    efbc:	0a000023 	beq	f050 <__udivsi3+0xac>
    efc0:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    efc4:	01a01181 	lsleq	r1, r1, #3
    efc8:	03a03008 	moveq	r3, #8
    efcc:	13a03001 	movne	r3, #1
    efd0:	e3510201 	cmp	r1, #268435456	; 0x10000000
    efd4:	31510000 	cmpcc	r1, r0
    efd8:	31a01201 	lslcc	r1, r1, #4
    efdc:	31a03203 	lslcc	r3, r3, #4
    efe0:	3afffffa 	bcc	efd0 <__udivsi3+0x2c>
    efe4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    efe8:	31510000 	cmpcc	r1, r0
    efec:	31a01081 	lslcc	r1, r1, #1
    eff0:	31a03083 	lslcc	r3, r3, #1
    eff4:	3afffffa 	bcc	efe4 <__udivsi3+0x40>
    eff8:	e3a02000 	mov	r2, #0
    effc:	e1500001 	cmp	r0, r1
    f000:	20400001 	subcs	r0, r0, r1
    f004:	21822003 	orrcs	r2, r2, r3
    f008:	e15000a1 	cmp	r0, r1, lsr #1
    f00c:	204000a1 	subcs	r0, r0, r1, lsr #1
    f010:	218220a3 	orrcs	r2, r2, r3, lsr #1
    f014:	e1500121 	cmp	r0, r1, lsr #2
    f018:	20400121 	subcs	r0, r0, r1, lsr #2
    f01c:	21822123 	orrcs	r2, r2, r3, lsr #2
    f020:	e15001a1 	cmp	r0, r1, lsr #3
    f024:	204001a1 	subcs	r0, r0, r1, lsr #3
    f028:	218221a3 	orrcs	r2, r2, r3, lsr #3
    f02c:	e3500000 	cmp	r0, #0
    f030:	11b03223 	lsrsne	r3, r3, #4
    f034:	11a01221 	lsrne	r1, r1, #4
    f038:	1affffef 	bne	effc <__udivsi3+0x58>
    f03c:	e1a00002 	mov	r0, r2
    f040:	e12fff1e 	bx	lr
    f044:	03a00001 	moveq	r0, #1
    f048:	13a00000 	movne	r0, #0
    f04c:	e12fff1e 	bx	lr
    f050:	e3510801 	cmp	r1, #65536	; 0x10000
    f054:	21a01821 	lsrcs	r1, r1, #16
    f058:	23a02010 	movcs	r2, #16
    f05c:	33a02000 	movcc	r2, #0
    f060:	e3510c01 	cmp	r1, #256	; 0x100
    f064:	21a01421 	lsrcs	r1, r1, #8
    f068:	22822008 	addcs	r2, r2, #8
    f06c:	e3510010 	cmp	r1, #16
    f070:	21a01221 	lsrcs	r1, r1, #4
    f074:	22822004 	addcs	r2, r2, #4
    f078:	e3510004 	cmp	r1, #4
    f07c:	82822003 	addhi	r2, r2, #3
    f080:	908220a1 	addls	r2, r2, r1, lsr #1
    f084:	e1a00230 	lsr	r0, r0, r2
    f088:	e12fff1e 	bx	lr
    f08c:	e3500000 	cmp	r0, #0
    f090:	13e00000 	mvnne	r0, #0
    f094:	ea000059 	b	f200 <__aeabi_idiv0>

0000f098 <__aeabi_uidivmod>:
    f098:	e3510000 	cmp	r1, #0
    f09c:	0afffffa 	beq	f08c <__udivsi3+0xe8>
    f0a0:	e92d4003 	push	{r0, r1, lr}
    f0a4:	ebffffbe 	bl	efa4 <__udivsi3>
    f0a8:	e8bd4006 	pop	{r1, r2, lr}
    f0ac:	e0030092 	mul	r3, r2, r0
    f0b0:	e0411003 	sub	r1, r1, r3
    f0b4:	e12fff1e 	bx	lr

0000f0b8 <__divsi3>:
    f0b8:	e3510000 	cmp	r1, #0
    f0bc:	0a000043 	beq	f1d0 <.divsi3_skip_div0_test+0x110>

0000f0c0 <.divsi3_skip_div0_test>:
    f0c0:	e020c001 	eor	ip, r0, r1
    f0c4:	42611000 	rsbmi	r1, r1, #0
    f0c8:	e2512001 	subs	r2, r1, #1
    f0cc:	0a000027 	beq	f170 <.divsi3_skip_div0_test+0xb0>
    f0d0:	e1b03000 	movs	r3, r0
    f0d4:	42603000 	rsbmi	r3, r0, #0
    f0d8:	e1530001 	cmp	r3, r1
    f0dc:	9a000026 	bls	f17c <.divsi3_skip_div0_test+0xbc>
    f0e0:	e1110002 	tst	r1, r2
    f0e4:	0a000028 	beq	f18c <.divsi3_skip_div0_test+0xcc>
    f0e8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    f0ec:	01a01181 	lsleq	r1, r1, #3
    f0f0:	03a02008 	moveq	r2, #8
    f0f4:	13a02001 	movne	r2, #1
    f0f8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    f0fc:	31510003 	cmpcc	r1, r3
    f100:	31a01201 	lslcc	r1, r1, #4
    f104:	31a02202 	lslcc	r2, r2, #4
    f108:	3afffffa 	bcc	f0f8 <.divsi3_skip_div0_test+0x38>
    f10c:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    f110:	31510003 	cmpcc	r1, r3
    f114:	31a01081 	lslcc	r1, r1, #1
    f118:	31a02082 	lslcc	r2, r2, #1
    f11c:	3afffffa 	bcc	f10c <.divsi3_skip_div0_test+0x4c>
    f120:	e3a00000 	mov	r0, #0
    f124:	e1530001 	cmp	r3, r1
    f128:	20433001 	subcs	r3, r3, r1
    f12c:	21800002 	orrcs	r0, r0, r2
    f130:	e15300a1 	cmp	r3, r1, lsr #1
    f134:	204330a1 	subcs	r3, r3, r1, lsr #1
    f138:	218000a2 	orrcs	r0, r0, r2, lsr #1
    f13c:	e1530121 	cmp	r3, r1, lsr #2
    f140:	20433121 	subcs	r3, r3, r1, lsr #2
    f144:	21800122 	orrcs	r0, r0, r2, lsr #2
    f148:	e15301a1 	cmp	r3, r1, lsr #3
    f14c:	204331a1 	subcs	r3, r3, r1, lsr #3
    f150:	218001a2 	orrcs	r0, r0, r2, lsr #3
    f154:	e3530000 	cmp	r3, #0
    f158:	11b02222 	lsrsne	r2, r2, #4
    f15c:	11a01221 	lsrne	r1, r1, #4
    f160:	1affffef 	bne	f124 <.divsi3_skip_div0_test+0x64>
    f164:	e35c0000 	cmp	ip, #0
    f168:	42600000 	rsbmi	r0, r0, #0
    f16c:	e12fff1e 	bx	lr
    f170:	e13c0000 	teq	ip, r0
    f174:	42600000 	rsbmi	r0, r0, #0
    f178:	e12fff1e 	bx	lr
    f17c:	33a00000 	movcc	r0, #0
    f180:	01a00fcc 	asreq	r0, ip, #31
    f184:	03800001 	orreq	r0, r0, #1
    f188:	e12fff1e 	bx	lr
    f18c:	e3510801 	cmp	r1, #65536	; 0x10000
    f190:	21a01821 	lsrcs	r1, r1, #16
    f194:	23a02010 	movcs	r2, #16
    f198:	33a02000 	movcc	r2, #0
    f19c:	e3510c01 	cmp	r1, #256	; 0x100
    f1a0:	21a01421 	lsrcs	r1, r1, #8
    f1a4:	22822008 	addcs	r2, r2, #8
    f1a8:	e3510010 	cmp	r1, #16
    f1ac:	21a01221 	lsrcs	r1, r1, #4
    f1b0:	22822004 	addcs	r2, r2, #4
    f1b4:	e3510004 	cmp	r1, #4
    f1b8:	82822003 	addhi	r2, r2, #3
    f1bc:	908220a1 	addls	r2, r2, r1, lsr #1
    f1c0:	e35c0000 	cmp	ip, #0
    f1c4:	e1a00233 	lsr	r0, r3, r2
    f1c8:	42600000 	rsbmi	r0, r0, #0
    f1cc:	e12fff1e 	bx	lr
    f1d0:	e3500000 	cmp	r0, #0
    f1d4:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    f1d8:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    f1dc:	ea000007 	b	f200 <__aeabi_idiv0>

0000f1e0 <__aeabi_idivmod>:
    f1e0:	e3510000 	cmp	r1, #0
    f1e4:	0afffff9 	beq	f1d0 <.divsi3_skip_div0_test+0x110>
    f1e8:	e92d4003 	push	{r0, r1, lr}
    f1ec:	ebffffb3 	bl	f0c0 <.divsi3_skip_div0_test>
    f1f0:	e8bd4006 	pop	{r1, r2, lr}
    f1f4:	e0030092 	mul	r3, r2, r0
    f1f8:	e0411003 	sub	r1, r1, r3
    f1fc:	e12fff1e 	bx	lr

0000f200 <__aeabi_idiv0>:
    f200:	e12fff1e 	bx	lr

0000f204 <__aeabi_frsub>:
    f204:	e2200102 	eor	r0, r0, #-2147483648	; 0x80000000
    f208:	ea000000 	b	f210 <__addsf3>

0000f20c <__aeabi_fsub>:
    f20c:	e2211102 	eor	r1, r1, #-2147483648	; 0x80000000

0000f210 <__addsf3>:
    f210:	e1b02080 	lsls	r2, r0, #1
    f214:	11b03081 	lslsne	r3, r1, #1
    f218:	11320003 	teqne	r2, r3
    f21c:	11f0cc42 	mvnsne	ip, r2, asr #24
    f220:	11f0cc43 	mvnsne	ip, r3, asr #24
    f224:	0a000047 	beq	f348 <__addsf3+0x138>
    f228:	e1a02c22 	lsr	r2, r2, #24
    f22c:	e0723c23 	rsbs	r3, r2, r3, lsr #24
    f230:	c0822003 	addgt	r2, r2, r3
    f234:	c0201001 	eorgt	r1, r0, r1
    f238:	c0210000 	eorgt	r0, r1, r0
    f23c:	c0201001 	eorgt	r1, r0, r1
    f240:	b2633000 	rsblt	r3, r3, #0
    f244:	e3530019 	cmp	r3, #25
    f248:	812fff1e 	bxhi	lr
    f24c:	e3100102 	tst	r0, #-2147483648	; 0x80000000
    f250:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    f254:	e3c004ff 	bic	r0, r0, #-16777216	; 0xff000000
    f258:	12600000 	rsbne	r0, r0, #0
    f25c:	e3110102 	tst	r1, #-2147483648	; 0x80000000
    f260:	e3811502 	orr	r1, r1, #8388608	; 0x800000
    f264:	e3c114ff 	bic	r1, r1, #-16777216	; 0xff000000
    f268:	12611000 	rsbne	r1, r1, #0
    f26c:	e1320003 	teq	r2, r3
    f270:	0a00002e 	beq	f330 <__addsf3+0x120>
    f274:	e2422001 	sub	r2, r2, #1
    f278:	e0900351 	adds	r0, r0, r1, asr r3
    f27c:	e2633020 	rsb	r3, r3, #32
    f280:	e1a01311 	lsl	r1, r1, r3
    f284:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    f288:	5a000001 	bpl	f294 <__addsf3+0x84>
    f28c:	e2711000 	rsbs	r1, r1, #0
    f290:	e2e00000 	rsc	r0, r0, #0
    f294:	e3500502 	cmp	r0, #8388608	; 0x800000
    f298:	3a00000b 	bcc	f2cc <__addsf3+0xbc>
    f29c:	e3500401 	cmp	r0, #16777216	; 0x1000000
    f2a0:	3a000004 	bcc	f2b8 <__addsf3+0xa8>
    f2a4:	e1b000a0 	lsrs	r0, r0, #1
    f2a8:	e1a01061 	rrx	r1, r1
    f2ac:	e2822001 	add	r2, r2, #1
    f2b0:	e35200fe 	cmp	r2, #254	; 0xfe
    f2b4:	2a000038 	bcs	f39c <__addsf3+0x18c>
    f2b8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    f2bc:	e0a00b82 	adc	r0, r0, r2, lsl #23
    f2c0:	03c00001 	biceq	r0, r0, #1
    f2c4:	e1800003 	orr	r0, r0, r3
    f2c8:	e12fff1e 	bx	lr
    f2cc:	e1b01081 	lsls	r1, r1, #1
    f2d0:	e0a00000 	adc	r0, r0, r0
    f2d4:	e3100502 	tst	r0, #8388608	; 0x800000
    f2d8:	e2422001 	sub	r2, r2, #1
    f2dc:	1afffff5 	bne	f2b8 <__addsf3+0xa8>
    f2e0:	e1b0c620 	lsrs	ip, r0, #12
    f2e4:	01a00600 	lsleq	r0, r0, #12
    f2e8:	0242200c 	subeq	r2, r2, #12
    f2ec:	e31008ff 	tst	r0, #16711680	; 0xff0000
    f2f0:	01a00400 	lsleq	r0, r0, #8
    f2f4:	02422008 	subeq	r2, r2, #8
    f2f8:	e310060f 	tst	r0, #15728640	; 0xf00000
    f2fc:	01a00200 	lsleq	r0, r0, #4
    f300:	02422004 	subeq	r2, r2, #4
    f304:	e3100503 	tst	r0, #12582912	; 0xc00000
    f308:	01a00100 	lsleq	r0, r0, #2
    f30c:	02422002 	subeq	r2, r2, #2
    f310:	e3500502 	cmp	r0, #8388608	; 0x800000
    f314:	31a00080 	lslcc	r0, r0, #1
    f318:	e2d22000 	sbcs	r2, r2, #0
    f31c:	a0800b82 	addge	r0, r0, r2, lsl #23
    f320:	b2622000 	rsblt	r2, r2, #0
    f324:	a1800003 	orrge	r0, r0, r3
    f328:	b1830230 	orrlt	r0, r3, r0, lsr r2
    f32c:	e12fff1e 	bx	lr
    f330:	e3320000 	teq	r2, #0
    f334:	e2211502 	eor	r1, r1, #8388608	; 0x800000
    f338:	02200502 	eoreq	r0, r0, #8388608	; 0x800000
    f33c:	02822001 	addeq	r2, r2, #1
    f340:	12433001 	subne	r3, r3, #1
    f344:	eaffffca 	b	f274 <__addsf3+0x64>
    f348:	e1a03081 	lsl	r3, r1, #1
    f34c:	e1f0cc42 	mvns	ip, r2, asr #24
    f350:	11f0cc43 	mvnsne	ip, r3, asr #24
    f354:	0a000013 	beq	f3a8 <__addsf3+0x198>
    f358:	e1320003 	teq	r2, r3
    f35c:	0a000002 	beq	f36c <__addsf3+0x15c>
    f360:	e3320000 	teq	r2, #0
    f364:	01a00001 	moveq	r0, r1
    f368:	e12fff1e 	bx	lr
    f36c:	e1300001 	teq	r0, r1
    f370:	13a00000 	movne	r0, #0
    f374:	112fff1e 	bxne	lr
    f378:	e31204ff 	tst	r2, #-16777216	; 0xff000000
    f37c:	1a000002 	bne	f38c <__addsf3+0x17c>
    f380:	e1b00080 	lsls	r0, r0, #1
    f384:	23800102 	orrcs	r0, r0, #-2147483648	; 0x80000000
    f388:	e12fff1e 	bx	lr
    f38c:	e2922402 	adds	r2, r2, #33554432	; 0x2000000
    f390:	32800502 	addcc	r0, r0, #8388608	; 0x800000
    f394:	312fff1e 	bxcc	lr
    f398:	e2003102 	and	r3, r0, #-2147483648	; 0x80000000
    f39c:	e383047f 	orr	r0, r3, #2130706432	; 0x7f000000
    f3a0:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    f3a4:	e12fff1e 	bx	lr
    f3a8:	e1f02c42 	mvns	r2, r2, asr #24
    f3ac:	11a00001 	movne	r0, r1
    f3b0:	01f03c43 	mvnseq	r3, r3, asr #24
    f3b4:	11a01000 	movne	r1, r0
    f3b8:	e1b02480 	lsls	r2, r0, #9
    f3bc:	01b03481 	lslseq	r3, r1, #9
    f3c0:	01300001 	teqeq	r0, r1
    f3c4:	13800501 	orrne	r0, r0, #4194304	; 0x400000
    f3c8:	e12fff1e 	bx	lr

0000f3cc <__aeabi_ui2f>:
    f3cc:	e3a03000 	mov	r3, #0
    f3d0:	ea000001 	b	f3dc <__aeabi_i2f+0x8>

0000f3d4 <__aeabi_i2f>:
    f3d4:	e2103102 	ands	r3, r0, #-2147483648	; 0x80000000
    f3d8:	42600000 	rsbmi	r0, r0, #0
    f3dc:	e1b0c000 	movs	ip, r0
    f3e0:	012fff1e 	bxeq	lr
    f3e4:	e383344b 	orr	r3, r3, #1258291200	; 0x4b000000
    f3e8:	e1a01000 	mov	r1, r0
    f3ec:	e3a00000 	mov	r0, #0
    f3f0:	ea00000f 	b	f434 <__aeabi_l2f+0x30>

0000f3f4 <__aeabi_ul2f>:
    f3f4:	e1902001 	orrs	r2, r0, r1
    f3f8:	012fff1e 	bxeq	lr
    f3fc:	e3a03000 	mov	r3, #0
    f400:	ea000005 	b	f41c <__aeabi_l2f+0x18>

0000f404 <__aeabi_l2f>:
    f404:	e1902001 	orrs	r2, r0, r1
    f408:	012fff1e 	bxeq	lr
    f40c:	e2113102 	ands	r3, r1, #-2147483648	; 0x80000000
    f410:	5a000001 	bpl	f41c <__aeabi_l2f+0x18>
    f414:	e2700000 	rsbs	r0, r0, #0
    f418:	e2e11000 	rsc	r1, r1, #0
    f41c:	e1b0c001 	movs	ip, r1
    f420:	01a0c000 	moveq	ip, r0
    f424:	01a01000 	moveq	r1, r0
    f428:	03a00000 	moveq	r0, #0
    f42c:	e383345b 	orr	r3, r3, #1526726656	; 0x5b000000
    f430:	02433201 	subeq	r3, r3, #268435456	; 0x10000000
    f434:	e2433502 	sub	r3, r3, #8388608	; 0x800000
    f438:	e3a02017 	mov	r2, #23
    f43c:	e35c0801 	cmp	ip, #65536	; 0x10000
    f440:	21a0c82c 	lsrcs	ip, ip, #16
    f444:	22422010 	subcs	r2, r2, #16
    f448:	e35c0c01 	cmp	ip, #256	; 0x100
    f44c:	21a0c42c 	lsrcs	ip, ip, #8
    f450:	22422008 	subcs	r2, r2, #8
    f454:	e35c0010 	cmp	ip, #16
    f458:	21a0c22c 	lsrcs	ip, ip, #4
    f45c:	22422004 	subcs	r2, r2, #4
    f460:	e35c0004 	cmp	ip, #4
    f464:	22422002 	subcs	r2, r2, #2
    f468:	304220ac 	subcc	r2, r2, ip, lsr #1
    f46c:	e05221ac 	subs	r2, r2, ip, lsr #3
    f470:	e0433b82 	sub	r3, r3, r2, lsl #23
    f474:	ba000006 	blt	f494 <__aeabi_l2f+0x90>
    f478:	e0833211 	add	r3, r3, r1, lsl r2
    f47c:	e1a0c210 	lsl	ip, r0, r2
    f480:	e2622020 	rsb	r2, r2, #32
    f484:	e35c0102 	cmp	ip, #-2147483648	; 0x80000000
    f488:	e0a30230 	adc	r0, r3, r0, lsr r2
    f48c:	03c00001 	biceq	r0, r0, #1
    f490:	e12fff1e 	bx	lr
    f494:	e2822020 	add	r2, r2, #32
    f498:	e1a0c211 	lsl	ip, r1, r2
    f49c:	e2622020 	rsb	r2, r2, #32
    f4a0:	e190008c 	orrs	r0, r0, ip, lsl #1
    f4a4:	e0a30231 	adc	r0, r3, r1, lsr r2
    f4a8:	01c00fac 	biceq	r0, r0, ip, lsr #31
    f4ac:	e12fff1e 	bx	lr

0000f4b0 <__aeabi_fmul>:
    f4b0:	e3a0c0ff 	mov	ip, #255	; 0xff
    f4b4:	e01c2ba0 	ands	r2, ip, r0, lsr #23
    f4b8:	101c3ba1 	andsne	r3, ip, r1, lsr #23
    f4bc:	1132000c 	teqne	r2, ip
    f4c0:	1133000c 	teqne	r3, ip
    f4c4:	0a00003e 	beq	f5c4 <__aeabi_fmul+0x114>
    f4c8:	e0822003 	add	r2, r2, r3
    f4cc:	e020c001 	eor	ip, r0, r1
    f4d0:	e1b00480 	lsls	r0, r0, #9
    f4d4:	11b01481 	lslsne	r1, r1, #9
    f4d8:	0a000010 	beq	f520 <__aeabi_fmul+0x70>
    f4dc:	e3a03302 	mov	r3, #134217728	; 0x8000000
    f4e0:	e18302a0 	orr	r0, r3, r0, lsr #5
    f4e4:	e18312a1 	orr	r1, r3, r1, lsr #5
    f4e8:	e0813190 	umull	r3, r1, r0, r1
    f4ec:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
    f4f0:	e3510502 	cmp	r1, #8388608	; 0x800000
    f4f4:	31a01081 	lslcc	r1, r1, #1
    f4f8:	31811fa3 	orrcc	r1, r1, r3, lsr #31
    f4fc:	31a03083 	lslcc	r3, r3, #1
    f500:	e1800001 	orr	r0, r0, r1
    f504:	e2c2207f 	sbc	r2, r2, #127	; 0x7f
    f508:	e35200fd 	cmp	r2, #253	; 0xfd
    f50c:	8a00000f 	bhi	f550 <__aeabi_fmul+0xa0>
    f510:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
    f514:	e0a00b82 	adc	r0, r0, r2, lsl #23
    f518:	03c00001 	biceq	r0, r0, #1
    f51c:	e12fff1e 	bx	lr
    f520:	e3300000 	teq	r0, #0
    f524:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
    f528:	01a01481 	lsleq	r1, r1, #9
    f52c:	e18c04a0 	orr	r0, ip, r0, lsr #9
    f530:	e18004a1 	orr	r0, r0, r1, lsr #9
    f534:	e252207f 	subs	r2, r2, #127	; 0x7f
    f538:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
    f53c:	c1800b82 	orrgt	r0, r0, r2, lsl #23
    f540:	c12fff1e 	bxgt	lr
    f544:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    f548:	e3a03000 	mov	r3, #0
    f54c:	e2522001 	subs	r2, r2, #1
    f550:	ca000035 	bgt	f62c <__aeabi_fmul+0x17c>
    f554:	e3720019 	cmn	r2, #25
    f558:	d2000102 	andle	r0, r0, #-2147483648	; 0x80000000
    f55c:	d12fff1e 	bxle	lr
    f560:	e2622000 	rsb	r2, r2, #0
    f564:	e1b01080 	lsls	r1, r0, #1
    f568:	e1a01231 	lsr	r1, r1, r2
    f56c:	e2622020 	rsb	r2, r2, #32
    f570:	e1a0c210 	lsl	ip, r0, r2
    f574:	e1b00061 	rrxs	r0, r1
    f578:	e2a00000 	adc	r0, r0, #0
    f57c:	e193308c 	orrs	r3, r3, ip, lsl #1
    f580:	01c00fac 	biceq	r0, r0, ip, lsr #31
    f584:	e12fff1e 	bx	lr
    f588:	e3320000 	teq	r2, #0
    f58c:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
    f590:	01a00080 	lsleq	r0, r0, #1
    f594:	03100502 	tsteq	r0, #8388608	; 0x800000
    f598:	02422001 	subeq	r2, r2, #1
    f59c:	0afffffb 	beq	f590 <__aeabi_fmul+0xe0>
    f5a0:	e180000c 	orr	r0, r0, ip
    f5a4:	e3330000 	teq	r3, #0
    f5a8:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
    f5ac:	01a01081 	lsleq	r1, r1, #1
    f5b0:	03110502 	tsteq	r1, #8388608	; 0x800000
    f5b4:	02433001 	subeq	r3, r3, #1
    f5b8:	0afffffb 	beq	f5ac <__aeabi_fmul+0xfc>
    f5bc:	e181100c 	orr	r1, r1, ip
    f5c0:	eaffffc0 	b	f4c8 <__aeabi_fmul+0x18>
    f5c4:	e00c3ba1 	and	r3, ip, r1, lsr #23
    f5c8:	e132000c 	teq	r2, ip
    f5cc:	1133000c 	teqne	r3, ip
    f5d0:	0a000005 	beq	f5ec <__aeabi_fmul+0x13c>
    f5d4:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
    f5d8:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
    f5dc:	1affffe9 	bne	f588 <__aeabi_fmul+0xd8>
    f5e0:	e0200001 	eor	r0, r0, r1
    f5e4:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
    f5e8:	e12fff1e 	bx	lr
    f5ec:	e3300000 	teq	r0, #0
    f5f0:	13300102 	teqne	r0, #-2147483648	; 0x80000000
    f5f4:	01a00001 	moveq	r0, r1
    f5f8:	13310000 	teqne	r1, #0
    f5fc:	13310102 	teqne	r1, #-2147483648	; 0x80000000
    f600:	0a00000d 	beq	f63c <__aeabi_fmul+0x18c>
    f604:	e132000c 	teq	r2, ip
    f608:	1a000001 	bne	f614 <__aeabi_fmul+0x164>
    f60c:	e1b02480 	lsls	r2, r0, #9
    f610:	1a000009 	bne	f63c <__aeabi_fmul+0x18c>
    f614:	e133000c 	teq	r3, ip
    f618:	1a000002 	bne	f628 <__aeabi_fmul+0x178>
    f61c:	e1b03481 	lsls	r3, r1, #9
    f620:	11a00001 	movne	r0, r1
    f624:	1a000004 	bne	f63c <__aeabi_fmul+0x18c>
    f628:	e0200001 	eor	r0, r0, r1
    f62c:	e2000102 	and	r0, r0, #-2147483648	; 0x80000000
    f630:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
    f634:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    f638:	e12fff1e 	bx	lr
    f63c:	e380047f 	orr	r0, r0, #2130706432	; 0x7f000000
    f640:	e3800503 	orr	r0, r0, #12582912	; 0xc00000
    f644:	e12fff1e 	bx	lr

0000f648 <__aeabi_fdiv>:
    f648:	e3a0c0ff 	mov	ip, #255	; 0xff
    f64c:	e01c2ba0 	ands	r2, ip, r0, lsr #23
    f650:	101c3ba1 	andsne	r3, ip, r1, lsr #23
    f654:	1132000c 	teqne	r2, ip
    f658:	1133000c 	teqne	r3, ip
    f65c:	0a00003a 	beq	f74c <__aeabi_fdiv+0x104>
    f660:	e0422003 	sub	r2, r2, r3
    f664:	e020c001 	eor	ip, r0, r1
    f668:	e1b01481 	lsls	r1, r1, #9
    f66c:	e1a00480 	lsl	r0, r0, #9
    f670:	0a00001c 	beq	f6e8 <__aeabi_fdiv+0xa0>
    f674:	e3a03201 	mov	r3, #268435456	; 0x10000000
    f678:	e1831221 	orr	r1, r3, r1, lsr #4
    f67c:	e1833220 	orr	r3, r3, r0, lsr #4
    f680:	e20c0102 	and	r0, ip, #-2147483648	; 0x80000000
    f684:	e1530001 	cmp	r3, r1
    f688:	31a03083 	lslcc	r3, r3, #1
    f68c:	e2a2207d 	adc	r2, r2, #125	; 0x7d
    f690:	e3a0c502 	mov	ip, #8388608	; 0x800000
    f694:	e1530001 	cmp	r3, r1
    f698:	20433001 	subcs	r3, r3, r1
    f69c:	2180000c 	orrcs	r0, r0, ip
    f6a0:	e15300a1 	cmp	r3, r1, lsr #1
    f6a4:	204330a1 	subcs	r3, r3, r1, lsr #1
    f6a8:	218000ac 	orrcs	r0, r0, ip, lsr #1
    f6ac:	e1530121 	cmp	r3, r1, lsr #2
    f6b0:	20433121 	subcs	r3, r3, r1, lsr #2
    f6b4:	2180012c 	orrcs	r0, r0, ip, lsr #2
    f6b8:	e15301a1 	cmp	r3, r1, lsr #3
    f6bc:	204331a1 	subcs	r3, r3, r1, lsr #3
    f6c0:	218001ac 	orrcs	r0, r0, ip, lsr #3
    f6c4:	e1b03203 	lsls	r3, r3, #4
    f6c8:	11b0c22c 	lsrsne	ip, ip, #4
    f6cc:	1afffff0 	bne	f694 <__aeabi_fdiv+0x4c>
    f6d0:	e35200fd 	cmp	r2, #253	; 0xfd
    f6d4:	8affff9d 	bhi	f550 <__aeabi_fmul+0xa0>
    f6d8:	e1530001 	cmp	r3, r1
    f6dc:	e0a00b82 	adc	r0, r0, r2, lsl #23
    f6e0:	03c00001 	biceq	r0, r0, #1
    f6e4:	e12fff1e 	bx	lr
    f6e8:	e20cc102 	and	ip, ip, #-2147483648	; 0x80000000
    f6ec:	e18c04a0 	orr	r0, ip, r0, lsr #9
    f6f0:	e292207f 	adds	r2, r2, #127	; 0x7f
    f6f4:	c27230ff 	rsbsgt	r3, r2, #255	; 0xff
    f6f8:	c1800b82 	orrgt	r0, r0, r2, lsl #23
    f6fc:	c12fff1e 	bxgt	lr
    f700:	e3800502 	orr	r0, r0, #8388608	; 0x800000
    f704:	e3a03000 	mov	r3, #0
    f708:	e2522001 	subs	r2, r2, #1
    f70c:	eaffff8f 	b	f550 <__aeabi_fmul+0xa0>
    f710:	e3320000 	teq	r2, #0
    f714:	e200c102 	and	ip, r0, #-2147483648	; 0x80000000
    f718:	01a00080 	lsleq	r0, r0, #1
    f71c:	03100502 	tsteq	r0, #8388608	; 0x800000
    f720:	02422001 	subeq	r2, r2, #1
    f724:	0afffffb 	beq	f718 <__aeabi_fdiv+0xd0>
    f728:	e180000c 	orr	r0, r0, ip
    f72c:	e3330000 	teq	r3, #0
    f730:	e201c102 	and	ip, r1, #-2147483648	; 0x80000000
    f734:	01a01081 	lsleq	r1, r1, #1
    f738:	03110502 	tsteq	r1, #8388608	; 0x800000
    f73c:	02433001 	subeq	r3, r3, #1
    f740:	0afffffb 	beq	f734 <__aeabi_fdiv+0xec>
    f744:	e181100c 	orr	r1, r1, ip
    f748:	eaffffc4 	b	f660 <__aeabi_fdiv+0x18>
    f74c:	e00c3ba1 	and	r3, ip, r1, lsr #23
    f750:	e132000c 	teq	r2, ip
    f754:	1a000005 	bne	f770 <__aeabi_fdiv+0x128>
    f758:	e1b02480 	lsls	r2, r0, #9
    f75c:	1affffb6 	bne	f63c <__aeabi_fmul+0x18c>
    f760:	e133000c 	teq	r3, ip
    f764:	1affffaf 	bne	f628 <__aeabi_fmul+0x178>
    f768:	e1a00001 	mov	r0, r1
    f76c:	eaffffb2 	b	f63c <__aeabi_fmul+0x18c>
    f770:	e133000c 	teq	r3, ip
    f774:	1a000003 	bne	f788 <__aeabi_fdiv+0x140>
    f778:	e1b03481 	lsls	r3, r1, #9
    f77c:	0affff97 	beq	f5e0 <__aeabi_fmul+0x130>
    f780:	e1a00001 	mov	r0, r1
    f784:	eaffffac 	b	f63c <__aeabi_fmul+0x18c>
    f788:	e3d0c102 	bics	ip, r0, #-2147483648	; 0x80000000
    f78c:	13d1c102 	bicsne	ip, r1, #-2147483648	; 0x80000000
    f790:	1affffde 	bne	f710 <__aeabi_fdiv+0xc8>
    f794:	e3d02102 	bics	r2, r0, #-2147483648	; 0x80000000
    f798:	1affffa2 	bne	f628 <__aeabi_fmul+0x178>
    f79c:	e3d13102 	bics	r3, r1, #-2147483648	; 0x80000000
    f7a0:	1affff8e 	bne	f5e0 <__aeabi_fmul+0x130>
    f7a4:	eaffffa4 	b	f63c <__aeabi_fmul+0x18c>

0000f7a8 <__assert_func>:
    f7a8:	e59fc038 	ldr	ip, [pc, #56]	; f7e8 <__assert_func+0x40>
    f7ac:	e59c4000 	ldr	r4, [ip]
    f7b0:	e252c000 	subs	ip, r2, #0
    f7b4:	e1a02003 	mov	r2, r3
    f7b8:	059f302c 	ldreq	r3, [pc, #44]	; f7ec <__assert_func+0x44>
    f7bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f7c0:	01a0c003 	moveq	ip, r3
    f7c4:	e1a0e000 	mov	lr, r0
    f7c8:	159f3020 	ldrne	r3, [pc, #32]	; f7f0 <__assert_func+0x48>
    f7cc:	e24dd014 	sub	sp, sp, #20
    f7d0:	e594000c 	ldr	r0, [r4, #12]
    f7d4:	e88d100a 	stm	sp, {r1, r3, ip}
    f7d8:	e1a0300e 	mov	r3, lr
    f7dc:	e59f1010 	ldr	r1, [pc, #16]	; f7f4 <__assert_func+0x4c>
    f7e0:	eb000014 	bl	f838 <fiprintf>
    f7e4:	eb00078b 	bl	11618 <abort>
    f7e8:	00015210 	.word	0x00015210
    f7ec:	00014fec 	.word	0x00014fec
    f7f0:	00014fe0 	.word	0x00014fe0
    f7f4:	00014ff0 	.word	0x00014ff0

0000f7f8 <__assert>:
    f7f8:	e1a03002 	mov	r3, r2
    f7fc:	e92d4010 	push	{r4, lr}
    f800:	e3a02000 	mov	r2, #0
    f804:	ebffffe7 	bl	f7a8 <__assert_func>

0000f808 <_fiprintf_r>:
    f808:	e92d000c 	push	{r2, r3}
    f80c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f810:	e24dd00c 	sub	sp, sp, #12
    f814:	e28dc014 	add	ip, sp, #20
    f818:	e1a0300c 	mov	r3, ip
    f81c:	e59d2010 	ldr	r2, [sp, #16]
    f820:	e58dc004 	str	ip, [sp, #4]
    f824:	eb000226 	bl	100c4 <_vfiprintf_r>
    f828:	e28dd00c 	add	sp, sp, #12
    f82c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    f830:	e28dd008 	add	sp, sp, #8
    f834:	e12fff1e 	bx	lr

0000f838 <fiprintf>:
    f838:	e92d000e 	push	{r1, r2, r3}
    f83c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f840:	e59f202c 	ldr	r2, [pc, #44]	; f874 <fiprintf+0x3c>
    f844:	e24dd008 	sub	sp, sp, #8
    f848:	e28dc010 	add	ip, sp, #16
    f84c:	e1a01000 	mov	r1, r0
    f850:	e1a0300c 	mov	r3, ip
    f854:	e5920000 	ldr	r0, [r2]
    f858:	e59d200c 	ldr	r2, [sp, #12]
    f85c:	e58dc004 	str	ip, [sp, #4]
    f860:	eb000217 	bl	100c4 <_vfiprintf_r>
    f864:	e28dd008 	add	sp, sp, #8
    f868:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    f86c:	e28dd00c 	add	sp, sp, #12
    f870:	e12fff1e 	bx	lr
    f874:	00015210 	.word	0x00015210

0000f878 <__libc_init_array>:
    f878:	e92d4070 	push	{r4, r5, r6, lr}
    f87c:	e59f6064 	ldr	r6, [pc, #100]	; f8e8 <__libc_init_array+0x70>
    f880:	e59f5064 	ldr	r5, [pc, #100]	; f8ec <__libc_init_array+0x74>
    f884:	e0466005 	sub	r6, r6, r5
    f888:	e1b06146 	asrs	r6, r6, #2
    f88c:	13a04000 	movne	r4, #0
    f890:	0a000005 	beq	f8ac <__libc_init_array+0x34>
    f894:	e2844001 	add	r4, r4, #1
    f898:	e4953004 	ldr	r3, [r5], #4
    f89c:	e1a0e00f 	mov	lr, pc
    f8a0:	e12fff13 	bx	r3
    f8a4:	e1560004 	cmp	r6, r4
    f8a8:	1afffff9 	bne	f894 <__libc_init_array+0x1c>
    f8ac:	e59f603c 	ldr	r6, [pc, #60]	; f8f0 <__libc_init_array+0x78>
    f8b0:	e59f503c 	ldr	r5, [pc, #60]	; f8f4 <__libc_init_array+0x7c>
    f8b4:	e0466005 	sub	r6, r6, r5
    f8b8:	ebffe1d0 	bl	8000 <_init>
    f8bc:	e1b06146 	asrs	r6, r6, #2
    f8c0:	13a04000 	movne	r4, #0
    f8c4:	0a000005 	beq	f8e0 <__libc_init_array+0x68>
    f8c8:	e2844001 	add	r4, r4, #1
    f8cc:	e4953004 	ldr	r3, [r5], #4
    f8d0:	e1a0e00f 	mov	lr, pc
    f8d4:	e12fff13 	bx	r3
    f8d8:	e1560004 	cmp	r6, r4
    f8dc:	1afffff9 	bne	f8c8 <__libc_init_array+0x50>
    f8e0:	e8bd4070 	pop	{r4, r5, r6, lr}
    f8e4:	e12fff1e 	bx	lr
    f8e8:	00015194 	.word	0x00015194
    f8ec:	00015194 	.word	0x00015194
    f8f0:	00015198 	.word	0x00015198
    f8f4:	00015194 	.word	0x00015194

0000f8f8 <memcpy>:
    f8f8:	e352000f 	cmp	r2, #15
    f8fc:	8a000009 	bhi	f928 <memcpy+0x30>
    f900:	e3520000 	cmp	r2, #0
    f904:	e1a03000 	mov	r3, r0
    f908:	0a00003c 	beq	fa00 <memcpy+0x108>
    f90c:	e2433001 	sub	r3, r3, #1
    f910:	e0812002 	add	r2, r1, r2
    f914:	e4d1c001 	ldrb	ip, [r1], #1
    f918:	e1510002 	cmp	r1, r2
    f91c:	e5e3c001 	strb	ip, [r3, #1]!
    f920:	1afffffb 	bne	f914 <memcpy+0x1c>
    f924:	e12fff1e 	bx	lr
    f928:	e1813000 	orr	r3, r1, r0
    f92c:	e3130003 	tst	r3, #3
    f930:	1a000030 	bne	f9f8 <memcpy+0x100>
    f934:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    f938:	e1a0e002 	mov	lr, r2
    f93c:	e280c010 	add	ip, r0, #16
    f940:	e2813010 	add	r3, r1, #16
    f944:	e5137010 	ldr	r7, [r3, #-16]
    f948:	e513600c 	ldr	r6, [r3, #-12]
    f94c:	e5135008 	ldr	r5, [r3, #-8]
    f950:	e5134004 	ldr	r4, [r3, #-4]
    f954:	e24ee010 	sub	lr, lr, #16
    f958:	e35e000f 	cmp	lr, #15
    f95c:	e50c7010 	str	r7, [ip, #-16]
    f960:	e50c600c 	str	r6, [ip, #-12]
    f964:	e50c5008 	str	r5, [ip, #-8]
    f968:	e50c4004 	str	r4, [ip, #-4]
    f96c:	e2833010 	add	r3, r3, #16
    f970:	e28cc010 	add	ip, ip, #16
    f974:	8afffff2 	bhi	f944 <memcpy+0x4c>
    f978:	e2423010 	sub	r3, r2, #16
    f97c:	e3c3300f 	bic	r3, r3, #15
    f980:	e202600f 	and	r6, r2, #15
    f984:	e2833010 	add	r3, r3, #16
    f988:	e3560003 	cmp	r6, #3
    f98c:	e0811003 	add	r1, r1, r3
    f990:	e0803003 	add	r3, r0, r3
    f994:	9a00001a 	bls	fa04 <memcpy+0x10c>
    f998:	e1a04001 	mov	r4, r1
    f99c:	e1a0c006 	mov	ip, r6
    f9a0:	e243e004 	sub	lr, r3, #4
    f9a4:	e24cc004 	sub	ip, ip, #4
    f9a8:	e4945004 	ldr	r5, [r4], #4
    f9ac:	e35c0003 	cmp	ip, #3
    f9b0:	e5ae5004 	str	r5, [lr, #4]!
    f9b4:	8afffffa 	bhi	f9a4 <memcpy+0xac>
    f9b8:	e246c004 	sub	ip, r6, #4
    f9bc:	e3ccc003 	bic	ip, ip, #3
    f9c0:	e28cc004 	add	ip, ip, #4
    f9c4:	e081100c 	add	r1, r1, ip
    f9c8:	e083300c 	add	r3, r3, ip
    f9cc:	e2022003 	and	r2, r2, #3
    f9d0:	e3520000 	cmp	r2, #0
    f9d4:	12433001 	subne	r3, r3, #1
    f9d8:	10812002 	addne	r2, r1, r2
    f9dc:	0a000003 	beq	f9f0 <memcpy+0xf8>
    f9e0:	e4d1c001 	ldrb	ip, [r1], #1
    f9e4:	e1510002 	cmp	r1, r2
    f9e8:	e5e3c001 	strb	ip, [r3, #1]!
    f9ec:	1afffffb 	bne	f9e0 <memcpy+0xe8>
    f9f0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    f9f4:	e12fff1e 	bx	lr
    f9f8:	e1a03000 	mov	r3, r0
    f9fc:	eaffffc2 	b	f90c <memcpy+0x14>
    fa00:	e12fff1e 	bx	lr
    fa04:	e1a02006 	mov	r2, r6
    fa08:	eafffff0 	b	f9d0 <memcpy+0xd8>

0000fa0c <memmove>:
    fa0c:	e1500001 	cmp	r0, r1
    fa10:	9a00000a 	bls	fa40 <memmove+0x34>
    fa14:	e0813002 	add	r3, r1, r2
    fa18:	e1500003 	cmp	r0, r3
    fa1c:	2a000007 	bcs	fa40 <memmove+0x34>
    fa20:	e3520000 	cmp	r2, #0
    fa24:	e0802002 	add	r2, r0, r2
    fa28:	012fff1e 	bxeq	lr
    fa2c:	e573c001 	ldrb	ip, [r3, #-1]!
    fa30:	e1510003 	cmp	r1, r3
    fa34:	e562c001 	strb	ip, [r2, #-1]!
    fa38:	1afffffb 	bne	fa2c <memmove+0x20>
    fa3c:	e12fff1e 	bx	lr
    fa40:	e352000f 	cmp	r2, #15
    fa44:	8a000009 	bhi	fa70 <memmove+0x64>
    fa48:	e3520000 	cmp	r2, #0
    fa4c:	e1a03000 	mov	r3, r0
    fa50:	0a00003c 	beq	fb48 <memmove+0x13c>
    fa54:	e2433001 	sub	r3, r3, #1
    fa58:	e0812002 	add	r2, r1, r2
    fa5c:	e4d1c001 	ldrb	ip, [r1], #1
    fa60:	e1520001 	cmp	r2, r1
    fa64:	e5e3c001 	strb	ip, [r3, #1]!
    fa68:	1afffffb 	bne	fa5c <memmove+0x50>
    fa6c:	e12fff1e 	bx	lr
    fa70:	e1813000 	orr	r3, r1, r0
    fa74:	e3130003 	tst	r3, #3
    fa78:	1a000030 	bne	fb40 <memmove+0x134>
    fa7c:	e92d4070 	push	{r4, r5, r6, lr}
    fa80:	e1a0e002 	mov	lr, r2
    fa84:	e280c010 	add	ip, r0, #16
    fa88:	e2813010 	add	r3, r1, #16
    fa8c:	e5134010 	ldr	r4, [r3, #-16]
    fa90:	e50c4010 	str	r4, [ip, #-16]
    fa94:	e513400c 	ldr	r4, [r3, #-12]
    fa98:	e50c400c 	str	r4, [ip, #-12]
    fa9c:	e5134008 	ldr	r4, [r3, #-8]
    faa0:	e50c4008 	str	r4, [ip, #-8]
    faa4:	e24ee010 	sub	lr, lr, #16
    faa8:	e5134004 	ldr	r4, [r3, #-4]
    faac:	e35e000f 	cmp	lr, #15
    fab0:	e50c4004 	str	r4, [ip, #-4]
    fab4:	e2833010 	add	r3, r3, #16
    fab8:	e28cc010 	add	ip, ip, #16
    fabc:	8afffff2 	bhi	fa8c <memmove+0x80>
    fac0:	e2423010 	sub	r3, r2, #16
    fac4:	e3c3300f 	bic	r3, r3, #15
    fac8:	e202600f 	and	r6, r2, #15
    facc:	e2833010 	add	r3, r3, #16
    fad0:	e3560003 	cmp	r6, #3
    fad4:	e0811003 	add	r1, r1, r3
    fad8:	e0803003 	add	r3, r0, r3
    fadc:	9a00001a 	bls	fb4c <memmove+0x140>
    fae0:	e1a04001 	mov	r4, r1
    fae4:	e1a0c006 	mov	ip, r6
    fae8:	e243e004 	sub	lr, r3, #4
    faec:	e24cc004 	sub	ip, ip, #4
    faf0:	e4945004 	ldr	r5, [r4], #4
    faf4:	e35c0003 	cmp	ip, #3
    faf8:	e5ae5004 	str	r5, [lr, #4]!
    fafc:	8afffffa 	bhi	faec <memmove+0xe0>
    fb00:	e246c004 	sub	ip, r6, #4
    fb04:	e3ccc003 	bic	ip, ip, #3
    fb08:	e28cc004 	add	ip, ip, #4
    fb0c:	e081100c 	add	r1, r1, ip
    fb10:	e083300c 	add	r3, r3, ip
    fb14:	e2022003 	and	r2, r2, #3
    fb18:	e3520000 	cmp	r2, #0
    fb1c:	12433001 	subne	r3, r3, #1
    fb20:	10812002 	addne	r2, r1, r2
    fb24:	0a000003 	beq	fb38 <memmove+0x12c>
    fb28:	e4d1c001 	ldrb	ip, [r1], #1
    fb2c:	e1520001 	cmp	r2, r1
    fb30:	e5e3c001 	strb	ip, [r3, #1]!
    fb34:	1afffffb 	bne	fb28 <memmove+0x11c>
    fb38:	e8bd4070 	pop	{r4, r5, r6, lr}
    fb3c:	e12fff1e 	bx	lr
    fb40:	e1a03000 	mov	r3, r0
    fb44:	eaffffc2 	b	fa54 <memmove+0x48>
    fb48:	e12fff1e 	bx	lr
    fb4c:	e1a02006 	mov	r2, r6
    fb50:	eafffff0 	b	fb18 <memmove+0x10c>

0000fb54 <memset>:
    fb54:	e3100003 	tst	r0, #3
    fb58:	0a000040 	beq	fc60 <memset+0x10c>
    fb5c:	e3520000 	cmp	r2, #0
    fb60:	e2422001 	sub	r2, r2, #1
    fb64:	012fff1e 	bxeq	lr
    fb68:	e201c0ff 	and	ip, r1, #255	; 0xff
    fb6c:	e1a03000 	mov	r3, r0
    fb70:	ea000002 	b	fb80 <memset+0x2c>
    fb74:	e2422001 	sub	r2, r2, #1
    fb78:	e3720001 	cmn	r2, #1
    fb7c:	012fff1e 	bxeq	lr
    fb80:	e4c3c001 	strb	ip, [r3], #1
    fb84:	e3130003 	tst	r3, #3
    fb88:	1afffff9 	bne	fb74 <memset+0x20>
    fb8c:	e3520003 	cmp	r2, #3
    fb90:	9a00002a 	bls	fc40 <memset+0xec>
    fb94:	e92d4010 	push	{r4, lr}
    fb98:	e201e0ff 	and	lr, r1, #255	; 0xff
    fb9c:	e18ee40e 	orr	lr, lr, lr, lsl #8
    fba0:	e352000f 	cmp	r2, #15
    fba4:	e18ee80e 	orr	lr, lr, lr, lsl #16
    fba8:	9a000010 	bls	fbf0 <memset+0x9c>
    fbac:	e1a04002 	mov	r4, r2
    fbb0:	e283c010 	add	ip, r3, #16
    fbb4:	e2444010 	sub	r4, r4, #16
    fbb8:	e354000f 	cmp	r4, #15
    fbbc:	e50ce010 	str	lr, [ip, #-16]
    fbc0:	e50ce00c 	str	lr, [ip, #-12]
    fbc4:	e50ce008 	str	lr, [ip, #-8]
    fbc8:	e50ce004 	str	lr, [ip, #-4]
    fbcc:	e28cc010 	add	ip, ip, #16
    fbd0:	8afffff7 	bhi	fbb4 <memset+0x60>
    fbd4:	e242c010 	sub	ip, r2, #16
    fbd8:	e3ccc00f 	bic	ip, ip, #15
    fbdc:	e202200f 	and	r2, r2, #15
    fbe0:	e28cc010 	add	ip, ip, #16
    fbe4:	e3520003 	cmp	r2, #3
    fbe8:	e083300c 	add	r3, r3, ip
    fbec:	9a00000a 	bls	fc1c <memset+0xc8>
    fbf0:	e1a04003 	mov	r4, r3
    fbf4:	e1a0c002 	mov	ip, r2
    fbf8:	e24cc004 	sub	ip, ip, #4
    fbfc:	e35c0003 	cmp	ip, #3
    fc00:	e484e004 	str	lr, [r4], #4
    fc04:	8afffffb 	bhi	fbf8 <memset+0xa4>
    fc08:	e242c004 	sub	ip, r2, #4
    fc0c:	e3ccc003 	bic	ip, ip, #3
    fc10:	e28cc004 	add	ip, ip, #4
    fc14:	e083300c 	add	r3, r3, ip
    fc18:	e2022003 	and	r2, r2, #3
    fc1c:	e3520000 	cmp	r2, #0
    fc20:	0a000004 	beq	fc38 <memset+0xe4>
    fc24:	e20110ff 	and	r1, r1, #255	; 0xff
    fc28:	e0832002 	add	r2, r3, r2
    fc2c:	e4c31001 	strb	r1, [r3], #1
    fc30:	e1520003 	cmp	r2, r3
    fc34:	1afffffc 	bne	fc2c <memset+0xd8>
    fc38:	e8bd4010 	pop	{r4, lr}
    fc3c:	e12fff1e 	bx	lr
    fc40:	e3520000 	cmp	r2, #0
    fc44:	012fff1e 	bxeq	lr
    fc48:	e20110ff 	and	r1, r1, #255	; 0xff
    fc4c:	e0832002 	add	r2, r3, r2
    fc50:	e4c31001 	strb	r1, [r3], #1
    fc54:	e1520003 	cmp	r2, r3
    fc58:	1afffffc 	bne	fc50 <memset+0xfc>
    fc5c:	e12fff1e 	bx	lr
    fc60:	e1a03000 	mov	r3, r0
    fc64:	eaffffc8 	b	fb8c <memset+0x38>

0000fc68 <strcmp>:
    fc68:	e020c001 	eor	ip, r0, r1
    fc6c:	e31c0003 	tst	ip, #3
    fc70:	1a000021 	bne	fcfc <strcmp+0x94>
    fc74:	e210c003 	ands	ip, r0, #3
    fc78:	e3c00003 	bic	r0, r0, #3
    fc7c:	e3c11003 	bic	r1, r1, #3
    fc80:	e4902004 	ldr	r2, [r0], #4
    fc84:	04913004 	ldreq	r3, [r1], #4
    fc88:	0a000006 	beq	fca8 <strcmp+0x40>
    fc8c:	e22cc003 	eor	ip, ip, #3
    fc90:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    fc94:	e1a0c18c 	lsl	ip, ip, #3
    fc98:	e1a0cc33 	lsr	ip, r3, ip
    fc9c:	e4913004 	ldr	r3, [r1], #4
    fca0:	e182200c 	orr	r2, r2, ip
    fca4:	e183300c 	orr	r3, r3, ip
    fca8:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    fcac:	e3a04001 	mov	r4, #1
    fcb0:	e1844404 	orr	r4, r4, r4, lsl #8
    fcb4:	e1844804 	orr	r4, r4, r4, lsl #16
    fcb8:	e042c004 	sub	ip, r2, r4
    fcbc:	e1520003 	cmp	r2, r3
    fcc0:	01ccc002 	biceq	ip, ip, r2
    fcc4:	011c0384 	tsteq	ip, r4, lsl #7
    fcc8:	04902004 	ldreq	r2, [r0], #4
    fccc:	04913004 	ldreq	r3, [r1], #4
    fcd0:	0afffff8 	beq	fcb8 <strcmp+0x50>
    fcd4:	e1a00c02 	lsl	r0, r2, #24
    fcd8:	e1a02422 	lsr	r2, r2, #8
    fcdc:	e3500001 	cmp	r0, #1
    fce0:	21500c03 	cmpcs	r0, r3, lsl #24
    fce4:	01a03423 	lsreq	r3, r3, #8
    fce8:	0afffff9 	beq	fcd4 <strcmp+0x6c>
    fcec:	e20330ff 	and	r3, r3, #255	; 0xff
    fcf0:	e0630c20 	rsb	r0, r3, r0, lsr #24
    fcf4:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    fcf8:	e12fff1e 	bx	lr
    fcfc:	e3100003 	tst	r0, #3
    fd00:	0a000006 	beq	fd20 <strcmp+0xb8>
    fd04:	e4d02001 	ldrb	r2, [r0], #1
    fd08:	e4d13001 	ldrb	r3, [r1], #1
    fd0c:	e3520001 	cmp	r2, #1
    fd10:	21520003 	cmpcs	r2, r3
    fd14:	0afffff8 	beq	fcfc <strcmp+0x94>
    fd18:	e0420003 	sub	r0, r2, r3
    fd1c:	e12fff1e 	bx	lr
    fd20:	e92d0030 	push	{r4, r5}
    fd24:	e3a04001 	mov	r4, #1
    fd28:	e1844404 	orr	r4, r4, r4, lsl #8
    fd2c:	e1844804 	orr	r4, r4, r4, lsl #16
    fd30:	e4902004 	ldr	r2, [r0], #4
    fd34:	e2015003 	and	r5, r1, #3
    fd38:	e3c11003 	bic	r1, r1, #3
    fd3c:	e4913004 	ldr	r3, [r1], #4
    fd40:	e3550002 	cmp	r5, #2
    fd44:	0a000017 	beq	fda8 <strcmp+0x140>
    fd48:	8a00002d 	bhi	fe04 <strcmp+0x19c>
    fd4c:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    fd50:	e1550423 	cmp	r5, r3, lsr #8
    fd54:	e042c004 	sub	ip, r2, r4
    fd58:	e1ccc002 	bic	ip, ip, r2
    fd5c:	1a000007 	bne	fd80 <strcmp+0x118>
    fd60:	e01cc384 	ands	ip, ip, r4, lsl #7
    fd64:	04913004 	ldreq	r3, [r1], #4
    fd68:	1a000006 	bne	fd88 <strcmp+0x120>
    fd6c:	e0255002 	eor	r5, r5, r2
    fd70:	e1550c03 	cmp	r5, r3, lsl #24
    fd74:	1a000008 	bne	fd9c <strcmp+0x134>
    fd78:	e4902004 	ldr	r2, [r0], #4
    fd7c:	eafffff2 	b	fd4c <strcmp+0xe4>
    fd80:	e1a03423 	lsr	r3, r3, #8
    fd84:	ea000036 	b	fe64 <strcmp+0x1fc>
    fd88:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    fd8c:	1a000031 	bne	fe58 <strcmp+0x1f0>
    fd90:	e5d13000 	ldrb	r3, [r1]
    fd94:	e1a05c22 	lsr	r5, r2, #24
    fd98:	ea000031 	b	fe64 <strcmp+0x1fc>
    fd9c:	e1a05c22 	lsr	r5, r2, #24
    fda0:	e20330ff 	and	r3, r3, #255	; 0xff
    fda4:	ea00002e 	b	fe64 <strcmp+0x1fc>
    fda8:	e1a05802 	lsl	r5, r2, #16
    fdac:	e042c004 	sub	ip, r2, r4
    fdb0:	e1a05825 	lsr	r5, r5, #16
    fdb4:	e1ccc002 	bic	ip, ip, r2
    fdb8:	e1550823 	cmp	r5, r3, lsr #16
    fdbc:	1a00000e 	bne	fdfc <strcmp+0x194>
    fdc0:	e01cc384 	ands	ip, ip, r4, lsl #7
    fdc4:	04913004 	ldreq	r3, [r1], #4
    fdc8:	1a000004 	bne	fde0 <strcmp+0x178>
    fdcc:	e0255002 	eor	r5, r5, r2
    fdd0:	e1550803 	cmp	r5, r3, lsl #16
    fdd4:	1a000006 	bne	fdf4 <strcmp+0x18c>
    fdd8:	e4902004 	ldr	r2, [r0], #4
    fddc:	eafffff1 	b	fda8 <strcmp+0x140>
    fde0:	e1b0c80c 	lsls	ip, ip, #16
    fde4:	1a00001b 	bne	fe58 <strcmp+0x1f0>
    fde8:	e1d130b0 	ldrh	r3, [r1]
    fdec:	e1a05822 	lsr	r5, r2, #16
    fdf0:	ea00001b 	b	fe64 <strcmp+0x1fc>
    fdf4:	e1a03803 	lsl	r3, r3, #16
    fdf8:	e1a05822 	lsr	r5, r2, #16
    fdfc:	e1a03823 	lsr	r3, r3, #16
    fe00:	ea000017 	b	fe64 <strcmp+0x1fc>
    fe04:	e20250ff 	and	r5, r2, #255	; 0xff
    fe08:	e1550c23 	cmp	r5, r3, lsr #24
    fe0c:	e042c004 	sub	ip, r2, r4
    fe10:	e1ccc002 	bic	ip, ip, r2
    fe14:	1a000007 	bne	fe38 <strcmp+0x1d0>
    fe18:	e01cc384 	ands	ip, ip, r4, lsl #7
    fe1c:	04913004 	ldreq	r3, [r1], #4
    fe20:	1a000006 	bne	fe40 <strcmp+0x1d8>
    fe24:	e0255002 	eor	r5, r5, r2
    fe28:	e1550403 	cmp	r5, r3, lsl #8
    fe2c:	1a000006 	bne	fe4c <strcmp+0x1e4>
    fe30:	e4902004 	ldr	r2, [r0], #4
    fe34:	eafffff2 	b	fe04 <strcmp+0x19c>
    fe38:	e1a03c23 	lsr	r3, r3, #24
    fe3c:	ea000008 	b	fe64 <strcmp+0x1fc>
    fe40:	e31200ff 	tst	r2, #255	; 0xff
    fe44:	0a000003 	beq	fe58 <strcmp+0x1f0>
    fe48:	e4913004 	ldr	r3, [r1], #4
    fe4c:	e1a05422 	lsr	r5, r2, #8
    fe50:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    fe54:	ea000002 	b	fe64 <strcmp+0x1fc>
    fe58:	e3a00000 	mov	r0, #0
    fe5c:	e8bd0030 	pop	{r4, r5}
    fe60:	e12fff1e 	bx	lr
    fe64:	e20520ff 	and	r2, r5, #255	; 0xff
    fe68:	e20300ff 	and	r0, r3, #255	; 0xff
    fe6c:	e3500001 	cmp	r0, #1
    fe70:	21500002 	cmpcs	r0, r2
    fe74:	01a05425 	lsreq	r5, r5, #8
    fe78:	01a03423 	lsreq	r3, r3, #8
    fe7c:	0afffff8 	beq	fe64 <strcmp+0x1fc>
    fe80:	e0420000 	sub	r0, r2, r0
    fe84:	e8bd0030 	pop	{r4, r5}
    fe88:	e12fff1e 	bx	lr

0000fe8c <strlen>:
    fe8c:	e3c01003 	bic	r1, r0, #3
    fe90:	e2100003 	ands	r0, r0, #3
    fe94:	e2600000 	rsb	r0, r0, #0
    fe98:	e4913004 	ldr	r3, [r1], #4
    fe9c:	e280c004 	add	ip, r0, #4
    fea0:	e1a0c18c 	lsl	ip, ip, #3
    fea4:	e3e02000 	mvn	r2, #0
    fea8:	11833c32 	orrne	r3, r3, r2, lsr ip
    feac:	e3a0c001 	mov	ip, #1
    feb0:	e18cc40c 	orr	ip, ip, ip, lsl #8
    feb4:	e18cc80c 	orr	ip, ip, ip, lsl #16
    feb8:	e043200c 	sub	r2, r3, ip
    febc:	e1c22003 	bic	r2, r2, r3
    fec0:	e012238c 	ands	r2, r2, ip, lsl #7
    fec4:	04913004 	ldreq	r3, [r1], #4
    fec8:	02800004 	addeq	r0, r0, #4
    fecc:	0afffff9 	beq	feb8 <strlen+0x2c>
    fed0:	e31300ff 	tst	r3, #255	; 0xff
    fed4:	12800001 	addne	r0, r0, #1
    fed8:	13130cff 	tstne	r3, #65280	; 0xff00
    fedc:	12800001 	addne	r0, r0, #1
    fee0:	131308ff 	tstne	r3, #16711680	; 0xff0000
    fee4:	12800001 	addne	r0, r0, #1
    fee8:	e12fff1e 	bx	lr

0000feec <strncmp>:
    feec:	e3520000 	cmp	r2, #0
    fef0:	0a000037 	beq	ffd4 <strncmp+0xe8>
    fef4:	e1803001 	orr	r3, r0, r1
    fef8:	e2133003 	ands	r3, r3, #3
    fefc:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    ff00:	1a00001f 	bne	ff84 <strncmp+0x98>
    ff04:	e3520003 	cmp	r2, #3
    ff08:	9a00001d 	bls	ff84 <strncmp+0x98>
    ff0c:	e590c000 	ldr	ip, [r0]
    ff10:	e591e000 	ldr	lr, [r1]
    ff14:	e15c000e 	cmp	ip, lr
    ff18:	1a000019 	bne	ff84 <strncmp+0x98>
    ff1c:	e2522004 	subs	r2, r2, #4
    ff20:	0a00002d 	beq	ffdc <strncmp+0xf0>
    ff24:	e59f50c8 	ldr	r5, [pc, #200]	; fff4 <strncmp+0x108>
    ff28:	e59f60c8 	ldr	r6, [pc, #200]	; fff8 <strncmp+0x10c>
    ff2c:	e08ce005 	add	lr, ip, r5
    ff30:	e1cec00c 	bic	ip, lr, ip
    ff34:	e11c0006 	tst	ip, r6
    ff38:	02800004 	addeq	r0, r0, #4
    ff3c:	02811004 	addeq	r1, r1, #4
    ff40:	0a00000b 	beq	ff74 <strncmp+0x88>
    ff44:	ea000024 	b	ffdc <strncmp+0xf0>
    ff48:	e4903004 	ldr	r3, [r0], #4
    ff4c:	e5914000 	ldr	r4, [r1]
    ff50:	e083c005 	add	ip, r3, r5
    ff54:	e1530004 	cmp	r3, r4
    ff58:	e1ccc003 	bic	ip, ip, r3
    ff5c:	e2811004 	add	r1, r1, #4
    ff60:	1a000020 	bne	ffe8 <strncmp+0xfc>
    ff64:	e2522004 	subs	r2, r2, #4
    ff68:	0a00001b 	beq	ffdc <strncmp+0xf0>
    ff6c:	e11c0006 	tst	ip, r6
    ff70:	1a000019 	bne	ffdc <strncmp+0xf0>
    ff74:	e3520003 	cmp	r2, #3
    ff78:	e1a07000 	mov	r7, r0
    ff7c:	e1a0e001 	mov	lr, r1
    ff80:	8afffff0 	bhi	ff48 <strncmp+0x5c>
    ff84:	e5d03000 	ldrb	r3, [r0]
    ff88:	e5d1c000 	ldrb	ip, [r1]
    ff8c:	e15c0003 	cmp	ip, r3
    ff90:	e2422001 	sub	r2, r2, #1
    ff94:	1a00000b 	bne	ffc8 <strncmp+0xdc>
    ff98:	e3520000 	cmp	r2, #0
    ff9c:	135c0000 	cmpne	ip, #0
    ffa0:	1a000003 	bne	ffb4 <strncmp+0xc8>
    ffa4:	ea00000c 	b	ffdc <strncmp+0xf0>
    ffa8:	e3520000 	cmp	r2, #0
    ffac:	13530000 	cmpne	r3, #0
    ffb0:	0a000009 	beq	ffdc <strncmp+0xf0>
    ffb4:	e5f03001 	ldrb	r3, [r0, #1]!
    ffb8:	e5f1c001 	ldrb	ip, [r1, #1]!
    ffbc:	e153000c 	cmp	r3, ip
    ffc0:	e2422001 	sub	r2, r2, #1
    ffc4:	0afffff7 	beq	ffa8 <strncmp+0xbc>
    ffc8:	e043000c 	sub	r0, r3, ip
    ffcc:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    ffd0:	e12fff1e 	bx	lr
    ffd4:	e1a00002 	mov	r0, r2
    ffd8:	e12fff1e 	bx	lr
    ffdc:	e3a00000 	mov	r0, #0
    ffe0:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    ffe4:	e12fff1e 	bx	lr
    ffe8:	e1a0100e 	mov	r1, lr
    ffec:	e1a00007 	mov	r0, r7
    fff0:	eaffffe3 	b	ff84 <strncmp+0x98>
    fff4:	fefefeff 	.word	0xfefefeff
    fff8:	80808080 	.word	0x80808080

0000fffc <__sprint_r.part.0>:
    fffc:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10000:	e5913064 	ldr	r3, [r1, #100]	; 0x64
   10004:	e3130a02 	tst	r3, #8192	; 0x2000
   10008:	e1a0b002 	mov	fp, r2
   1000c:	0a000024 	beq	100a4 <__sprint_r.part.0+0xa8>
   10010:	e5923008 	ldr	r3, [r2, #8]
   10014:	e5929000 	ldr	r9, [r2]
   10018:	e3530000 	cmp	r3, #0
   1001c:	11a06001 	movne	r6, r1
   10020:	11a07000 	movne	r7, r0
   10024:	12899008 	addne	r9, r9, #8
   10028:	0a00001b 	beq	1009c <__sprint_r.part.0+0xa0>
   1002c:	e519a004 	ldr	sl, [r9, #-4]
   10030:	e5195008 	ldr	r5, [r9, #-8]
   10034:	e1b0812a 	lsrs	r8, sl, #2
   10038:	13a04000 	movne	r4, #0
   1003c:	12455004 	subne	r5, r5, #4
   10040:	1a000002 	bne	10050 <__sprint_r.part.0+0x54>
   10044:	ea00000e 	b	10084 <__sprint_r.part.0+0x88>
   10048:	e1580004 	cmp	r8, r4
   1004c:	0a00000b 	beq	10080 <__sprint_r.part.0+0x84>
   10050:	e1a02006 	mov	r2, r6
   10054:	e5b51004 	ldr	r1, [r5, #4]!
   10058:	e1a00007 	mov	r0, r7
   1005c:	eb000777 	bl	11e40 <_fputwc_r>
   10060:	e3700001 	cmn	r0, #1
   10064:	e2844001 	add	r4, r4, #1
   10068:	1afffff6 	bne	10048 <__sprint_r.part.0+0x4c>
   1006c:	e3a03000 	mov	r3, #0
   10070:	e58b3008 	str	r3, [fp, #8]
   10074:	e58b3004 	str	r3, [fp, #4]
   10078:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   1007c:	e12fff1e 	bx	lr
   10080:	e59b3008 	ldr	r3, [fp, #8]
   10084:	e3caa003 	bic	sl, sl, #3
   10088:	e043300a 	sub	r3, r3, sl
   1008c:	e3530000 	cmp	r3, #0
   10090:	e58b3008 	str	r3, [fp, #8]
   10094:	e2899008 	add	r9, r9, #8
   10098:	1affffe3 	bne	1002c <__sprint_r.part.0+0x30>
   1009c:	e3a00000 	mov	r0, #0
   100a0:	eafffff1 	b	1006c <__sprint_r.part.0+0x70>
   100a4:	eb00089d 	bl	12320 <__sfvwrite_r>
   100a8:	eaffffef 	b	1006c <__sprint_r.part.0+0x70>

000100ac <__sprint_r>:
   100ac:	e5923008 	ldr	r3, [r2, #8]
   100b0:	e3530000 	cmp	r3, #0
   100b4:	1affffd0 	bne	fffc <__sprint_r.part.0>
   100b8:	e5823004 	str	r3, [r2, #4]
   100bc:	e1a00003 	mov	r0, r3
   100c0:	e12fff1e 	bx	lr

000100c4 <_vfiprintf_r>:
   100c4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   100c8:	e1a05003 	mov	r5, r3
   100cc:	e24dd0b4 	sub	sp, sp, #180	; 0xb4
   100d0:	e2503000 	subs	r3, r0, #0
   100d4:	e58d3014 	str	r3, [sp, #20]
   100d8:	e1a0a001 	mov	sl, r1
   100dc:	e1a09002 	mov	r9, r2
   100e0:	e58d5018 	str	r5, [sp, #24]
   100e4:	0a000002 	beq	100f4 <_vfiprintf_r+0x30>
   100e8:	e5933038 	ldr	r3, [r3, #56]	; 0x38
   100ec:	e3530000 	cmp	r3, #0
   100f0:	0a0000cf 	beq	10434 <_vfiprintf_r+0x370>
   100f4:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
   100f8:	e3130001 	tst	r3, #1
   100fc:	e1da30fc 	ldrsh	r3, [sl, #12]
   10100:	e1a01803 	lsl	r1, r3, #16
   10104:	1a0000a7 	bne	103a8 <_vfiprintf_r+0x2e4>
   10108:	e3110402 	tst	r1, #33554432	; 0x2000000
   1010c:	e1a01821 	lsr	r1, r1, #16
   10110:	0a0000a0 	beq	10398 <_vfiprintf_r+0x2d4>
   10114:	e3110a02 	tst	r1, #8192	; 0x2000
   10118:	1a000006 	bne	10138 <_vfiprintf_r+0x74>
   1011c:	e59a2064 	ldr	r2, [sl, #100]	; 0x64
   10120:	e3833a02 	orr	r3, r3, #8192	; 0x2000
   10124:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
   10128:	e1ca30bc 	strh	r3, [sl, #12]
   1012c:	e58a2064 	str	r2, [sl, #100]	; 0x64
   10130:	e1a03803 	lsl	r3, r3, #16
   10134:	e1a01823 	lsr	r1, r3, #16
   10138:	e3110008 	tst	r1, #8
   1013c:	0a0000a0 	beq	103c4 <_vfiprintf_r+0x300>
   10140:	e59a3010 	ldr	r3, [sl, #16]
   10144:	e3530000 	cmp	r3, #0
   10148:	0a00009d 	beq	103c4 <_vfiprintf_r+0x300>
   1014c:	e201301a 	and	r3, r1, #26
   10150:	e353000a 	cmp	r3, #10
   10154:	0a0000a3 	beq	103e8 <_vfiprintf_r+0x324>
   10158:	e3a03000 	mov	r3, #0
   1015c:	e28d8070 	add	r8, sp, #112	; 0x70
   10160:	e1a0b008 	mov	fp, r8
   10164:	e58d302c 	str	r3, [sp, #44]	; 0x2c
   10168:	e58d3008 	str	r3, [sp, #8]
   1016c:	e58d3044 	str	r3, [sp, #68]	; 0x44
   10170:	e58d3040 	str	r3, [sp, #64]	; 0x40
   10174:	e58d803c 	str	r8, [sp, #60]	; 0x3c
   10178:	e58da00c 	str	sl, [sp, #12]
   1017c:	e5d93000 	ldrb	r3, [r9]
   10180:	e3530000 	cmp	r3, #0
   10184:	13530025 	cmpne	r3, #37	; 0x25
   10188:	e1a04009 	mov	r4, r9
   1018c:	0a000013 	beq	101e0 <_vfiprintf_r+0x11c>
   10190:	e5f43001 	ldrb	r3, [r4, #1]!
   10194:	e3530000 	cmp	r3, #0
   10198:	13530025 	cmpne	r3, #37	; 0x25
   1019c:	1afffffb 	bne	10190 <_vfiprintf_r+0xcc>
   101a0:	e0545009 	subs	r5, r4, r9
   101a4:	0a00000d 	beq	101e0 <_vfiprintf_r+0x11c>
   101a8:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
   101ac:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
   101b0:	e2833001 	add	r3, r3, #1
   101b4:	e3530007 	cmp	r3, #7
   101b8:	e0852002 	add	r2, r5, r2
   101bc:	e58b9000 	str	r9, [fp]
   101c0:	e58b5004 	str	r5, [fp, #4]
   101c4:	e58d3040 	str	r3, [sp, #64]	; 0x40
   101c8:	e58d2044 	str	r2, [sp, #68]	; 0x44
   101cc:	d28bb008 	addle	fp, fp, #8
   101d0:	ca000076 	bgt	103b0 <_vfiprintf_r+0x2ec>
   101d4:	e59d3008 	ldr	r3, [sp, #8]
   101d8:	e0833005 	add	r3, r3, r5
   101dc:	e58d3008 	str	r3, [sp, #8]
   101e0:	e5d43000 	ldrb	r3, [r4]
   101e4:	e3530000 	cmp	r3, #0
   101e8:	0a00042f 	beq	112ac <_vfiprintf_r+0x11e8>
   101ec:	e3a01000 	mov	r1, #0
   101f0:	e3a03000 	mov	r3, #0
   101f4:	e3e0a000 	mvn	sl, #0
   101f8:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
   101fc:	e2849001 	add	r9, r4, #1
   10200:	e5d43001 	ldrb	r3, [r4, #1]
   10204:	e1a0c001 	mov	ip, r1
   10208:	e1a00001 	mov	r0, r1
   1020c:	e1a05001 	mov	r5, r1
   10210:	e1a0700a 	mov	r7, sl
   10214:	e3a0e001 	mov	lr, #1
   10218:	e3a0402b 	mov	r4, #43	; 0x2b
   1021c:	e3a06020 	mov	r6, #32
   10220:	e2899001 	add	r9, r9, #1
   10224:	e2432020 	sub	r2, r3, #32
   10228:	e3520058 	cmp	r2, #88	; 0x58
   1022c:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
   10230:	ea000220 	b	10ab8 <_vfiprintf_r+0x9f4>
   10234:	00010aa4 	.word	0x00010aa4
   10238:	00010ab8 	.word	0x00010ab8
   1023c:	00010ab8 	.word	0x00010ab8
   10240:	00010a80 	.word	0x00010a80
   10244:	00010ab8 	.word	0x00010ab8
   10248:	00010ab8 	.word	0x00010ab8
   1024c:	00010ab8 	.word	0x00010ab8
   10250:	00010ab8 	.word	0x00010ab8
   10254:	00010ab8 	.word	0x00010ab8
   10258:	00010ab8 	.word	0x00010ab8
   1025c:	0001043c 	.word	0x0001043c
   10260:	0001088c 	.word	0x0001088c
   10264:	00010ab8 	.word	0x00010ab8
   10268:	00010458 	.word	0x00010458
   1026c:	00010824 	.word	0x00010824
   10270:	00010ab8 	.word	0x00010ab8
   10274:	0001089c 	.word	0x0001089c
   10278:	000108a8 	.word	0x000108a8
   1027c:	000108a8 	.word	0x000108a8
   10280:	000108a8 	.word	0x000108a8
   10284:	000108a8 	.word	0x000108a8
   10288:	000108a8 	.word	0x000108a8
   1028c:	000108a8 	.word	0x000108a8
   10290:	000108a8 	.word	0x000108a8
   10294:	000108a8 	.word	0x000108a8
   10298:	000108a8 	.word	0x000108a8
   1029c:	00010ab8 	.word	0x00010ab8
   102a0:	00010ab8 	.word	0x00010ab8
   102a4:	00010ab8 	.word	0x00010ab8
   102a8:	00010ab8 	.word	0x00010ab8
   102ac:	00010ab8 	.word	0x00010ab8
   102b0:	00010ab8 	.word	0x00010ab8
   102b4:	00010ab8 	.word	0x00010ab8
   102b8:	00010ab8 	.word	0x00010ab8
   102bc:	00010ab8 	.word	0x00010ab8
   102c0:	00010ab8 	.word	0x00010ab8
   102c4:	000108cc 	.word	0x000108cc
   102c8:	00010ab8 	.word	0x00010ab8
   102cc:	00010ab8 	.word	0x00010ab8
   102d0:	00010ab8 	.word	0x00010ab8
   102d4:	00010ab8 	.word	0x00010ab8
   102d8:	00010ab8 	.word	0x00010ab8
   102dc:	00010ab8 	.word	0x00010ab8
   102e0:	00010ab8 	.word	0x00010ab8
   102e4:	00010ab8 	.word	0x00010ab8
   102e8:	00010ab8 	.word	0x00010ab8
   102ec:	00010ab8 	.word	0x00010ab8
   102f0:	00010760 	.word	0x00010760
   102f4:	00010ab8 	.word	0x00010ab8
   102f8:	00010ab8 	.word	0x00010ab8
   102fc:	00010ab8 	.word	0x00010ab8
   10300:	00010ab8 	.word	0x00010ab8
   10304:	00010ab8 	.word	0x00010ab8
   10308:	0001076c 	.word	0x0001076c
   1030c:	00010ab8 	.word	0x00010ab8
   10310:	00010ab8 	.word	0x00010ab8
   10314:	000109d0 	.word	0x000109d0
   10318:	00010ab8 	.word	0x00010ab8
   1031c:	00010ab8 	.word	0x00010ab8
   10320:	00010ab8 	.word	0x00010ab8
   10324:	00010ab8 	.word	0x00010ab8
   10328:	00010ab8 	.word	0x00010ab8
   1032c:	00010ab8 	.word	0x00010ab8
   10330:	00010ab8 	.word	0x00010ab8
   10334:	00010ab8 	.word	0x00010ab8
   10338:	00010ab8 	.word	0x00010ab8
   1033c:	00010ab8 	.word	0x00010ab8
   10340:	00010a44 	.word	0x00010a44
   10344:	000109c0 	.word	0x000109c0
   10348:	00010ab8 	.word	0x00010ab8
   1034c:	00010ab8 	.word	0x00010ab8
   10350:	00010ab8 	.word	0x00010ab8
   10354:	00010864 	.word	0x00010864
   10358:	000109c0 	.word	0x000109c0
   1035c:	00010ab8 	.word	0x00010ab8
   10360:	00010ab8 	.word	0x00010ab8
   10364:	00010870 	.word	0x00010870
   10368:	00010ab8 	.word	0x00010ab8
   1036c:	00010984 	.word	0x00010984
   10370:	00010724 	.word	0x00010724
   10374:	00010778 	.word	0x00010778
   10378:	000107b4 	.word	0x000107b4
   1037c:	00010ab8 	.word	0x00010ab8
   10380:	000107c0 	.word	0x000107c0
   10384:	00010ab8 	.word	0x00010ab8
   10388:	00010464 	.word	0x00010464
   1038c:	00010ab8 	.word	0x00010ab8
   10390:	00010ab8 	.word	0x00010ab8
   10394:	00010a8c 	.word	0x00010a8c
   10398:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
   1039c:	eb000995 	bl	129f8 <__retarget_lock_acquire_recursive>
   103a0:	e1da30fc 	ldrsh	r3, [sl, #12]
   103a4:	e1a01803 	lsl	r1, r3, #16
   103a8:	e1a01821 	lsr	r1, r1, #16
   103ac:	eaffff58 	b	10114 <_vfiprintf_r+0x50>
   103b0:	e3520000 	cmp	r2, #0
   103b4:	1a000314 	bne	1100c <_vfiprintf_r+0xf48>
   103b8:	e58d2040 	str	r2, [sp, #64]	; 0x40
   103bc:	e1a0b008 	mov	fp, r8
   103c0:	eaffff83 	b	101d4 <_vfiprintf_r+0x110>
   103c4:	e1a0100a 	mov	r1, sl
   103c8:	e59d0014 	ldr	r0, [sp, #20]
   103cc:	eb000438 	bl	114b4 <__swsetup_r>
   103d0:	e3500000 	cmp	r0, #0
   103d4:	1a0002f6 	bne	10fb4 <_vfiprintf_r+0xef0>
   103d8:	e1da10bc 	ldrh	r1, [sl, #12]
   103dc:	e201301a 	and	r3, r1, #26
   103e0:	e353000a 	cmp	r3, #10
   103e4:	1affff5b 	bne	10158 <_vfiprintf_r+0x94>
   103e8:	e1da30fe 	ldrsh	r3, [sl, #14]
   103ec:	e3530000 	cmp	r3, #0
   103f0:	baffff58 	blt	10158 <_vfiprintf_r+0x94>
   103f4:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
   103f8:	e3130001 	tst	r3, #1
   103fc:	1a000002 	bne	1040c <_vfiprintf_r+0x348>
   10400:	e3110c02 	tst	r1, #512	; 0x200
   10404:	059a0058 	ldreq	r0, [sl, #88]	; 0x58
   10408:	0b000980 	bleq	12a10 <__retarget_lock_release_recursive>
   1040c:	e1a03005 	mov	r3, r5
   10410:	e1a02009 	mov	r2, r9
   10414:	e1a0100a 	mov	r1, sl
   10418:	e59d0014 	ldr	r0, [sp, #20]
   1041c:	eb0003f0 	bl	113e4 <__sbprintf>
   10420:	e58d0008 	str	r0, [sp, #8]
   10424:	e59d0008 	ldr	r0, [sp, #8]
   10428:	e28dd0b4 	add	sp, sp, #180	; 0xb4
   1042c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10430:	e12fff1e 	bx	lr
   10434:	eb0005a0 	bl	11abc <__sinit>
   10438:	eaffff2d 	b	100f4 <_vfiprintf_r+0x30>
   1043c:	e59d3018 	ldr	r3, [sp, #24]
   10440:	e5930000 	ldr	r0, [r3]
   10444:	e2833004 	add	r3, r3, #4
   10448:	e3500000 	cmp	r0, #0
   1044c:	e58d3018 	str	r3, [sp, #24]
   10450:	aa000001 	bge	1045c <_vfiprintf_r+0x398>
   10454:	e2600000 	rsb	r0, r0, #0
   10458:	e3855004 	orr	r5, r5, #4
   1045c:	e5d93000 	ldrb	r3, [r9]
   10460:	eaffff6e 	b	10220 <_vfiprintf_r+0x15c>
   10464:	e58d001c 	str	r0, [sp, #28]
   10468:	e3150020 	tst	r5, #32
   1046c:	1a00032b 	bne	11120 <_vfiprintf_r+0x105c>
   10470:	e59d2018 	ldr	r2, [sp, #24]
   10474:	e3150010 	tst	r5, #16
   10478:	e1a03002 	mov	r3, r2
   1047c:	1a0002f0 	bne	11044 <_vfiprintf_r+0xf80>
   10480:	e3150040 	tst	r5, #64	; 0x40
   10484:	0a0002ee 	beq	11044 <_vfiprintf_r+0xf80>
   10488:	e3a03001 	mov	r3, #1
   1048c:	e3a07000 	mov	r7, #0
   10490:	e1d260b0 	ldrh	r6, [r2]
   10494:	e2822004 	add	r2, r2, #4
   10498:	e58d2018 	str	r2, [sp, #24]
   1049c:	e3a02000 	mov	r2, #0
   104a0:	e3a04000 	mov	r4, #0
   104a4:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
   104a8:	e37a0001 	cmn	sl, #1
   104ac:	0a00011e 	beq	1092c <_vfiprintf_r+0x868>
   104b0:	e1862007 	orr	r2, r6, r7
   104b4:	e3520000 	cmp	r2, #0
   104b8:	035a0000 	cmpeq	sl, #0
   104bc:	e3c52080 	bic	r2, r5, #128	; 0x80
   104c0:	e58d2004 	str	r2, [sp, #4]
   104c4:	1a000298 	bne	10f2c <_vfiprintf_r+0xe68>
   104c8:	e3530000 	cmp	r3, #0
   104cc:	1a000292 	bne	10f1c <_vfiprintf_r+0xe58>
   104d0:	e2153001 	ands	r3, r5, #1
   104d4:	e58d3010 	str	r3, [sp, #16]
   104d8:	058d8024 	streq	r8, [sp, #36]	; 0x24
   104dc:	13a03030 	movne	r3, #48	; 0x30
   104e0:	128d20b0 	addne	r2, sp, #176	; 0xb0
   104e4:	15623041 	strbne	r3, [r2, #-65]!	; 0xffffffbf
   104e8:	158d2024 	strne	r2, [sp, #36]	; 0x24
   104ec:	e59d3010 	ldr	r3, [sp, #16]
   104f0:	e15a0003 	cmp	sl, r3
   104f4:	a1a0700a 	movge	r7, sl
   104f8:	b1a07003 	movlt	r7, r3
   104fc:	e3540000 	cmp	r4, #0
   10500:	12877001 	addne	r7, r7, #1
   10504:	e59d3004 	ldr	r3, [sp, #4]
   10508:	e2133002 	ands	r3, r3, #2
   1050c:	e58d3020 	str	r3, [sp, #32]
   10510:	e59d3004 	ldr	r3, [sp, #4]
   10514:	12877002 	addne	r7, r7, #2
   10518:	e2136084 	ands	r6, r3, #132	; 0x84
   1051c:	1a00018d 	bne	10b58 <_vfiprintf_r+0xa94>
   10520:	e59d301c 	ldr	r3, [sp, #28]
   10524:	e0434007 	sub	r4, r3, r7
   10528:	e3540000 	cmp	r4, #0
   1052c:	da000189 	ble	10b58 <_vfiprintf_r+0xa94>
   10530:	e3540010 	cmp	r4, #16
   10534:	da000378 	ble	1131c <_vfiprintf_r+0x1258>
   10538:	e1a0e00b 	mov	lr, fp
   1053c:	e3a05010 	mov	r5, #16
   10540:	e1a0b007 	mov	fp, r7
   10544:	e3a03001 	mov	r3, #1
   10548:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
   1054c:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
   10550:	e59d7014 	ldr	r7, [sp, #20]
   10554:	ea000005 	b	10570 <_vfiprintf_r+0x4ac>
   10558:	e28c1002 	add	r1, ip, #2
   1055c:	e1a0c000 	mov	ip, r0
   10560:	e28ee008 	add	lr, lr, #8
   10564:	e2444010 	sub	r4, r4, #16
   10568:	e3540010 	cmp	r4, #16
   1056c:	da00000f 	ble	105b0 <_vfiprintf_r+0x4ec>
   10570:	e28c0001 	add	r0, ip, #1
   10574:	e59f1e38 	ldr	r1, [pc, #3640]	; 113b4 <_vfiprintf_r+0x12f0>
   10578:	e2822010 	add	r2, r2, #16
   1057c:	e3500007 	cmp	r0, #7
   10580:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10584:	e88e0022 	stm	lr, {r1, r5}
   10588:	e58d0040 	str	r0, [sp, #64]	; 0x40
   1058c:	dafffff1 	ble	10558 <_vfiprintf_r+0x494>
   10590:	e3520000 	cmp	r2, #0
   10594:	1a00015b 	bne	10b08 <_vfiprintf_r+0xa44>
   10598:	e2444010 	sub	r4, r4, #16
   1059c:	e3540010 	cmp	r4, #16
   105a0:	e1a0c006 	mov	ip, r6
   105a4:	e1a01003 	mov	r1, r3
   105a8:	e1a0e008 	mov	lr, r8
   105ac:	caffffef 	bgt	10570 <_vfiprintf_r+0x4ac>
   105b0:	e1a0700b 	mov	r7, fp
   105b4:	e1a0b00e 	mov	fp, lr
   105b8:	e59f3df4 	ldr	r3, [pc, #3572]	; 113b4 <_vfiprintf_r+0x12f0>
   105bc:	e3510007 	cmp	r1, #7
   105c0:	e0842002 	add	r2, r4, r2
   105c4:	e88b0018 	stm	fp, {r3, r4}
   105c8:	e58d2044 	str	r2, [sp, #68]	; 0x44
   105cc:	e58d1040 	str	r1, [sp, #64]	; 0x40
   105d0:	d28bb008 	addle	fp, fp, #8
   105d4:	d2810001 	addle	r0, r1, #1
   105d8:	da000161 	ble	10b64 <_vfiprintf_r+0xaa0>
   105dc:	e3520000 	cmp	r2, #0
   105e0:	1a000155 	bne	10b3c <_vfiprintf_r+0xa78>
   105e4:	e5dd1037 	ldrb	r1, [sp, #55]	; 0x37
   105e8:	e3510000 	cmp	r1, #0
   105ec:	0a0002fb 	beq	111e0 <_vfiprintf_r+0x111c>
   105f0:	e3a02001 	mov	r2, #1
   105f4:	e1a0b008 	mov	fp, r8
   105f8:	e1a00002 	mov	r0, r2
   105fc:	e28d1037 	add	r1, sp, #55	; 0x37
   10600:	e58d2074 	str	r2, [sp, #116]	; 0x74
   10604:	e58d1070 	str	r1, [sp, #112]	; 0x70
   10608:	e1a01000 	mov	r1, r0
   1060c:	e28bb008 	add	fp, fp, #8
   10610:	e2800001 	add	r0, r0, #1
   10614:	e59d3020 	ldr	r3, [sp, #32]
   10618:	e3530000 	cmp	r3, #0
   1061c:	0a00016a 	beq	10bcc <_vfiprintf_r+0xb08>
   10620:	e3a01002 	mov	r1, #2
   10624:	e28d3038 	add	r3, sp, #56	; 0x38
   10628:	e0822001 	add	r2, r2, r1
   1062c:	e3500007 	cmp	r0, #7
   10630:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10634:	e58d0040 	str	r0, [sp, #64]	; 0x40
   10638:	e58b1004 	str	r1, [fp, #4]
   1063c:	e58b3000 	str	r3, [fp]
   10640:	da00015e 	ble	10bc0 <_vfiprintf_r+0xafc>
   10644:	e3520000 	cmp	r2, #0
   10648:	1a000292 	bne	11098 <_vfiprintf_r+0xfd4>
   1064c:	e3560080 	cmp	r6, #128	; 0x80
   10650:	e3a00001 	mov	r0, #1
   10654:	e3a01000 	mov	r1, #0
   10658:	e1a0b008 	mov	fp, r8
   1065c:	1a00015c 	bne	10bd4 <_vfiprintf_r+0xb10>
   10660:	e59d301c 	ldr	r3, [sp, #28]
   10664:	e0434007 	sub	r4, r3, r7
   10668:	e3540000 	cmp	r4, #0
   1066c:	da000158 	ble	10bd4 <_vfiprintf_r+0xb10>
   10670:	e3540010 	cmp	r4, #16
   10674:	da00033b 	ble	11368 <_vfiprintf_r+0x12a4>
   10678:	e1a0e00b 	mov	lr, fp
   1067c:	e3a05010 	mov	r5, #16
   10680:	e1a0b007 	mov	fp, r7
   10684:	e3a06001 	mov	r6, #1
   10688:	e1a07004 	mov	r7, r4
   1068c:	e59d4014 	ldr	r4, [sp, #20]
   10690:	ea000005 	b	106ac <_vfiprintf_r+0x5e8>
   10694:	e281c002 	add	ip, r1, #2
   10698:	e1a01000 	mov	r1, r0
   1069c:	e28ee008 	add	lr, lr, #8
   106a0:	e2477010 	sub	r7, r7, #16
   106a4:	e3570010 	cmp	r7, #16
   106a8:	da00000f 	ble	106ec <_vfiprintf_r+0x628>
   106ac:	e2810001 	add	r0, r1, #1
   106b0:	e59f3d00 	ldr	r3, [pc, #3328]	; 113b8 <_vfiprintf_r+0x12f4>
   106b4:	e2822010 	add	r2, r2, #16
   106b8:	e3500007 	cmp	r0, #7
   106bc:	e58d2044 	str	r2, [sp, #68]	; 0x44
   106c0:	e88e0028 	stm	lr, {r3, r5}
   106c4:	e58d0040 	str	r0, [sp, #64]	; 0x40
   106c8:	dafffff1 	ble	10694 <_vfiprintf_r+0x5d0>
   106cc:	e3520000 	cmp	r2, #0
   106d0:	1a000206 	bne	10ef0 <_vfiprintf_r+0xe2c>
   106d4:	e2477010 	sub	r7, r7, #16
   106d8:	e3570010 	cmp	r7, #16
   106dc:	e1a0c006 	mov	ip, r6
   106e0:	e3a01000 	mov	r1, #0
   106e4:	e1a0e008 	mov	lr, r8
   106e8:	caffffef 	bgt	106ac <_vfiprintf_r+0x5e8>
   106ec:	e1a04007 	mov	r4, r7
   106f0:	e1a0700b 	mov	r7, fp
   106f4:	e1a0b00e 	mov	fp, lr
   106f8:	e59f3cb8 	ldr	r3, [pc, #3256]	; 113b8 <_vfiprintf_r+0x12f4>
   106fc:	e0822004 	add	r2, r2, r4
   10700:	e35c0007 	cmp	ip, #7
   10704:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10708:	e88b0018 	stm	fp, {r3, r4}
   1070c:	e58dc040 	str	ip, [sp, #64]	; 0x40
   10710:	ca00026b 	bgt	110c4 <_vfiprintf_r+0x1000>
   10714:	e28bb008 	add	fp, fp, #8
   10718:	e28c0001 	add	r0, ip, #1
   1071c:	e1a0100c 	mov	r1, ip
   10720:	ea00012b 	b	10bd4 <_vfiprintf_r+0xb10>
   10724:	e58d001c 	str	r0, [sp, #28]
   10728:	e3150020 	tst	r5, #32
   1072c:	1a000283 	bne	11140 <_vfiprintf_r+0x107c>
   10730:	e59d2018 	ldr	r2, [sp, #24]
   10734:	e3150010 	tst	r5, #16
   10738:	e1a03002 	mov	r3, r2
   1073c:	1a00023a 	bne	1102c <_vfiprintf_r+0xf68>
   10740:	e3150040 	tst	r5, #64	; 0x40
   10744:	0a000238 	beq	1102c <_vfiprintf_r+0xf68>
   10748:	e1d260b0 	ldrh	r6, [r2]
   1074c:	e2822004 	add	r2, r2, #4
   10750:	e3a03000 	mov	r3, #0
   10754:	e58d2018 	str	r2, [sp, #24]
   10758:	e3a07000 	mov	r7, #0
   1075c:	eaffff4e 	b	1049c <_vfiprintf_r+0x3d8>
   10760:	e58d001c 	str	r0, [sp, #28]
   10764:	e3855010 	orr	r5, r5, #16
   10768:	eaffffee 	b	10728 <_vfiprintf_r+0x664>
   1076c:	e58d001c 	str	r0, [sp, #28]
   10770:	e3855010 	orr	r5, r5, #16
   10774:	eaffff3b 	b	10468 <_vfiprintf_r+0x3a4>
   10778:	e3a03078 	mov	r3, #120	; 0x78
   1077c:	e3a02030 	mov	r2, #48	; 0x30
   10780:	e59d1018 	ldr	r1, [sp, #24]
   10784:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
   10788:	e2813004 	add	r3, r1, #4
   1078c:	e58d3018 	str	r3, [sp, #24]
   10790:	e59f3c24 	ldr	r3, [pc, #3108]	; 113bc <_vfiprintf_r+0x12f8>
   10794:	e58d001c 	str	r0, [sp, #28]
   10798:	e58d302c 	str	r3, [sp, #44]	; 0x2c
   1079c:	e5916000 	ldr	r6, [r1]
   107a0:	e3855002 	orr	r5, r5, #2
   107a4:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
   107a8:	e3a07000 	mov	r7, #0
   107ac:	e3a03002 	mov	r3, #2
   107b0:	eaffff39 	b	1049c <_vfiprintf_r+0x3d8>
   107b4:	e3855020 	orr	r5, r5, #32
   107b8:	e5d93000 	ldrb	r3, [r9]
   107bc:	eafffe97 	b	10220 <_vfiprintf_r+0x15c>
   107c0:	e59d3018 	ldr	r3, [sp, #24]
   107c4:	e5932000 	ldr	r2, [r3]
   107c8:	e58d2024 	str	r2, [sp, #36]	; 0x24
   107cc:	e3520000 	cmp	r2, #0
   107d0:	e3a02000 	mov	r2, #0
   107d4:	e58d001c 	str	r0, [sp, #28]
   107d8:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
   107dc:	e2834004 	add	r4, r3, #4
   107e0:	0a0002d1 	beq	1132c <_vfiprintf_r+0x1268>
   107e4:	e37a0001 	cmn	sl, #1
   107e8:	0a0002b8 	beq	112d0 <_vfiprintf_r+0x120c>
   107ec:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
   107f0:	e1a0200a 	mov	r2, sl
   107f4:	e3a01000 	mov	r1, #0
   107f8:	e1a00006 	mov	r0, r6
   107fc:	eb000aef 	bl	133c0 <memchr>
   10800:	e3500000 	cmp	r0, #0
   10804:	0a0002d1 	beq	11350 <_vfiprintf_r+0x128c>
   10808:	e0403006 	sub	r3, r0, r6
   1080c:	e58d4018 	str	r4, [sp, #24]
   10810:	e58d3010 	str	r3, [sp, #16]
   10814:	e58d5004 	str	r5, [sp, #4]
   10818:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
   1081c:	e3a0a000 	mov	sl, #0
   10820:	eaffff31 	b	104ec <_vfiprintf_r+0x428>
   10824:	e5d93000 	ldrb	r3, [r9]
   10828:	e353002a 	cmp	r3, #42	; 0x2a
   1082c:	e289a001 	add	sl, r9, #1
   10830:	0a0002d5 	beq	1138c <_vfiprintf_r+0x12c8>
   10834:	e2432030 	sub	r2, r3, #48	; 0x30
   10838:	e3520009 	cmp	r2, #9
   1083c:	e1a0900a 	mov	r9, sl
   10840:	e3a0a000 	mov	sl, #0
   10844:	8afffe76 	bhi	10224 <_vfiprintf_r+0x160>
   10848:	e4d93001 	ldrb	r3, [r9], #1
   1084c:	e08aa10a 	add	sl, sl, sl, lsl #2
   10850:	e082a08a 	add	sl, r2, sl, lsl #1
   10854:	e2432030 	sub	r2, r3, #48	; 0x30
   10858:	e3520009 	cmp	r2, #9
   1085c:	9afffff9 	bls	10848 <_vfiprintf_r+0x784>
   10860:	eafffe6f 	b	10224 <_vfiprintf_r+0x160>
   10864:	e3855040 	orr	r5, r5, #64	; 0x40
   10868:	e5d93000 	ldrb	r3, [r9]
   1086c:	eafffe6b 	b	10220 <_vfiprintf_r+0x15c>
   10870:	e5d93000 	ldrb	r3, [r9]
   10874:	e353006c 	cmp	r3, #108	; 0x6c
   10878:	05d93001 	ldrbeq	r3, [r9, #1]
   1087c:	03855020 	orreq	r5, r5, #32
   10880:	02899001 	addeq	r9, r9, #1
   10884:	13855010 	orrne	r5, r5, #16
   10888:	eafffe64 	b	10220 <_vfiprintf_r+0x15c>
   1088c:	e5d93000 	ldrb	r3, [r9]
   10890:	e1a0100e 	mov	r1, lr
   10894:	e1a0c004 	mov	ip, r4
   10898:	eafffe60 	b	10220 <_vfiprintf_r+0x15c>
   1089c:	e3855080 	orr	r5, r5, #128	; 0x80
   108a0:	e5d93000 	ldrb	r3, [r9]
   108a4:	eafffe5d 	b	10220 <_vfiprintf_r+0x15c>
   108a8:	e3a00000 	mov	r0, #0
   108ac:	e2432030 	sub	r2, r3, #48	; 0x30
   108b0:	e4d93001 	ldrb	r3, [r9], #1
   108b4:	e0800100 	add	r0, r0, r0, lsl #2
   108b8:	e0820080 	add	r0, r2, r0, lsl #1
   108bc:	e2432030 	sub	r2, r3, #48	; 0x30
   108c0:	e3520009 	cmp	r2, #9
   108c4:	9afffff9 	bls	108b0 <_vfiprintf_r+0x7ec>
   108c8:	eafffe55 	b	10224 <_vfiprintf_r+0x160>
   108cc:	e3510000 	cmp	r1, #0
   108d0:	e58d001c 	str	r0, [sp, #28]
   108d4:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   108d8:	e3855010 	orr	r5, r5, #16
   108dc:	e3150020 	tst	r5, #32
   108e0:	1a0001ff 	bne	110e4 <_vfiprintf_r+0x1020>
   108e4:	e3150010 	tst	r5, #16
   108e8:	1a00025a 	bne	11258 <_vfiprintf_r+0x1194>
   108ec:	e3150040 	tst	r5, #64	; 0x40
   108f0:	0a000241 	beq	111fc <_vfiprintf_r+0x1138>
   108f4:	e59d3018 	ldr	r3, [sp, #24]
   108f8:	e1d360f0 	ldrsh	r6, [r3]
   108fc:	e2833004 	add	r3, r3, #4
   10900:	e1a07fc6 	asr	r7, r6, #31
   10904:	e58d3018 	str	r3, [sp, #24]
   10908:	e1a02006 	mov	r2, r6
   1090c:	e1a03007 	mov	r3, r7
   10910:	e3520000 	cmp	r2, #0
   10914:	e2d33000 	sbcs	r3, r3, #0
   10918:	ba000229 	blt	111c4 <_vfiprintf_r+0x1100>
   1091c:	e37a0001 	cmn	sl, #1
   10920:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
   10924:	e3a03001 	mov	r3, #1
   10928:	1afffee0 	bne	104b0 <_vfiprintf_r+0x3ec>
   1092c:	e3530001 	cmp	r3, #1
   10930:	0a000180 	beq	10f38 <_vfiprintf_r+0xe74>
   10934:	e3530002 	cmp	r3, #2
   10938:	11a01008 	movne	r1, r8
   1093c:	1a000153 	bne	10e90 <_vfiprintf_r+0xdcc>
   10940:	e1a02008 	mov	r2, r8
   10944:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
   10948:	e1a03226 	lsr	r3, r6, #4
   1094c:	e1833e07 	orr	r3, r3, r7, lsl #28
   10950:	e1a00227 	lsr	r0, r7, #4
   10954:	e206100f 	and	r1, r6, #15
   10958:	e1a07000 	mov	r7, r0
   1095c:	e1a06003 	mov	r6, r3
   10960:	e7dc3001 	ldrb	r3, [ip, r1]
   10964:	e1961007 	orrs	r1, r6, r7
   10968:	e5623001 	strb	r3, [r2, #-1]!
   1096c:	1afffff5 	bne	10948 <_vfiprintf_r+0x884>
   10970:	e0483002 	sub	r3, r8, r2
   10974:	e58d2024 	str	r2, [sp, #36]	; 0x24
   10978:	e58d5004 	str	r5, [sp, #4]
   1097c:	e58d3010 	str	r3, [sp, #16]
   10980:	eafffed9 	b	104ec <_vfiprintf_r+0x428>
   10984:	e3510000 	cmp	r1, #0
   10988:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   1098c:	e3150020 	tst	r5, #32
   10990:	1a00023d 	bne	1128c <_vfiprintf_r+0x11c8>
   10994:	e3150010 	tst	r5, #16
   10998:	1a000053 	bne	10aec <_vfiprintf_r+0xa28>
   1099c:	e3150040 	tst	r5, #64	; 0x40
   109a0:	0a000051 	beq	10aec <_vfiprintf_r+0xa28>
   109a4:	e59d2018 	ldr	r2, [sp, #24]
   109a8:	e5923000 	ldr	r3, [r2]
   109ac:	e2822004 	add	r2, r2, #4
   109b0:	e58d2018 	str	r2, [sp, #24]
   109b4:	e1dd20b8 	ldrh	r2, [sp, #8]
   109b8:	e1c320b0 	strh	r2, [r3]
   109bc:	eafffdee 	b	1017c <_vfiprintf_r+0xb8>
   109c0:	e3510000 	cmp	r1, #0
   109c4:	e58d001c 	str	r0, [sp, #28]
   109c8:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   109cc:	eaffffc2 	b	108dc <_vfiprintf_r+0x818>
   109d0:	e59f29e8 	ldr	r2, [pc, #2536]	; 113c0 <_vfiprintf_r+0x12fc>
   109d4:	e3510000 	cmp	r1, #0
   109d8:	e58d001c 	str	r0, [sp, #28]
   109dc:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   109e0:	e58d202c 	str	r2, [sp, #44]	; 0x2c
   109e4:	e3150020 	tst	r5, #32
   109e8:	e59d2018 	ldr	r2, [sp, #24]
   109ec:	1a0001c5 	bne	11108 <_vfiprintf_r+0x1044>
   109f0:	e3150010 	tst	r5, #16
   109f4:	1a00021a 	bne	11264 <_vfiprintf_r+0x11a0>
   109f8:	e3150040 	tst	r5, #64	; 0x40
   109fc:	13a07000 	movne	r7, #0
   10a00:	03a07000 	moveq	r7, #0
   10a04:	11d260b0 	ldrhne	r6, [r2]
   10a08:	05926000 	ldreq	r6, [r2]
   10a0c:	12822004 	addne	r2, r2, #4
   10a10:	02822004 	addeq	r2, r2, #4
   10a14:	158d2018 	strne	r2, [sp, #24]
   10a18:	058d2018 	streq	r2, [sp, #24]
   10a1c:	e3150001 	tst	r5, #1
   10a20:	0a00016e 	beq	10fe0 <_vfiprintf_r+0xf1c>
   10a24:	e1962007 	orrs	r2, r6, r7
   10a28:	0a00016c 	beq	10fe0 <_vfiprintf_r+0xf1c>
   10a2c:	e3a02030 	mov	r2, #48	; 0x30
   10a30:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
   10a34:	e3855002 	orr	r5, r5, #2
   10a38:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
   10a3c:	e3a03002 	mov	r3, #2
   10a40:	eafffe95 	b	1049c <_vfiprintf_r+0x3d8>
   10a44:	e3a07001 	mov	r7, #1
   10a48:	e3a01000 	mov	r1, #0
   10a4c:	e59d2018 	ldr	r2, [sp, #24]
   10a50:	e5923000 	ldr	r3, [r2]
   10a54:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
   10a58:	e2823004 	add	r3, r2, #4
   10a5c:	e58d3018 	str	r3, [sp, #24]
   10a60:	e28d3048 	add	r3, sp, #72	; 0x48
   10a64:	e58d001c 	str	r0, [sp, #28]
   10a68:	e5cd1037 	strb	r1, [sp, #55]	; 0x37
   10a6c:	e58d7010 	str	r7, [sp, #16]
   10a70:	e58d3024 	str	r3, [sp, #36]	; 0x24
   10a74:	e58d5004 	str	r5, [sp, #4]
   10a78:	e3a0a000 	mov	sl, #0
   10a7c:	eafffea0 	b	10504 <_vfiprintf_r+0x440>
   10a80:	e3855001 	orr	r5, r5, #1
   10a84:	e5d93000 	ldrb	r3, [r9]
   10a88:	eafffde4 	b	10220 <_vfiprintf_r+0x15c>
   10a8c:	e59f2928 	ldr	r2, [pc, #2344]	; 113bc <_vfiprintf_r+0x12f8>
   10a90:	e3510000 	cmp	r1, #0
   10a94:	e58d001c 	str	r0, [sp, #28]
   10a98:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   10a9c:	e58d202c 	str	r2, [sp, #44]	; 0x2c
   10aa0:	eaffffcf 	b	109e4 <_vfiprintf_r+0x920>
   10aa4:	e35c0000 	cmp	ip, #0
   10aa8:	e5d93000 	ldrb	r3, [r9]
   10aac:	01a0100e 	moveq	r1, lr
   10ab0:	01a0c006 	moveq	ip, r6
   10ab4:	eafffdd9 	b	10220 <_vfiprintf_r+0x15c>
   10ab8:	e3510000 	cmp	r1, #0
   10abc:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
   10ac0:	e3530000 	cmp	r3, #0
   10ac4:	e58d001c 	str	r0, [sp, #28]
   10ac8:	0a0001f7 	beq	112ac <_vfiprintf_r+0x11e8>
   10acc:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
   10ad0:	e3a03000 	mov	r3, #0
   10ad4:	e3a07001 	mov	r7, #1
   10ad8:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
   10adc:	e28d3048 	add	r3, sp, #72	; 0x48
   10ae0:	e58d7010 	str	r7, [sp, #16]
   10ae4:	e58d3024 	str	r3, [sp, #36]	; 0x24
   10ae8:	eaffffe1 	b	10a74 <_vfiprintf_r+0x9b0>
   10aec:	e59d2018 	ldr	r2, [sp, #24]
   10af0:	e5923000 	ldr	r3, [r2]
   10af4:	e2822004 	add	r2, r2, #4
   10af8:	e58d2018 	str	r2, [sp, #24]
   10afc:	e59d2008 	ldr	r2, [sp, #8]
   10b00:	e5832000 	str	r2, [r3]
   10b04:	eafffd9c 	b	1017c <_vfiprintf_r+0xb8>
   10b08:	e28d203c 	add	r2, sp, #60	; 0x3c
   10b0c:	e59d100c 	ldr	r1, [sp, #12]
   10b10:	e1a00007 	mov	r0, r7
   10b14:	e58d3028 	str	r3, [sp, #40]	; 0x28
   10b18:	ebfffd37 	bl	fffc <__sprint_r.part.0>
   10b1c:	e3500000 	cmp	r0, #0
   10b20:	1a000114 	bne	10f78 <_vfiprintf_r+0xeb4>
   10b24:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
   10b28:	e1a0e008 	mov	lr, r8
   10b2c:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
   10b30:	e28c1001 	add	r1, ip, #1
   10b34:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
   10b38:	eafffe89 	b	10564 <_vfiprintf_r+0x4a0>
   10b3c:	e28d203c 	add	r2, sp, #60	; 0x3c
   10b40:	e59d100c 	ldr	r1, [sp, #12]
   10b44:	e59d0014 	ldr	r0, [sp, #20]
   10b48:	ebfffd2b 	bl	fffc <__sprint_r.part.0>
   10b4c:	e3500000 	cmp	r0, #0
   10b50:	1a000108 	bne	10f78 <_vfiprintf_r+0xeb4>
   10b54:	e1a0b008 	mov	fp, r8
   10b58:	e28d1040 	add	r1, sp, #64	; 0x40
   10b5c:	e8910006 	ldm	r1, {r1, r2}
   10b60:	e2810001 	add	r0, r1, #1
   10b64:	e5ddc037 	ldrb	ip, [sp, #55]	; 0x37
   10b68:	e35c0000 	cmp	ip, #0
   10b6c:	0afffea8 	beq	10614 <_vfiprintf_r+0x550>
   10b70:	e3a01001 	mov	r1, #1
   10b74:	e28dc037 	add	ip, sp, #55	; 0x37
   10b78:	e0822001 	add	r2, r2, r1
   10b7c:	e3500007 	cmp	r0, #7
   10b80:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10b84:	e58d0040 	str	r0, [sp, #64]	; 0x40
   10b88:	e58b1004 	str	r1, [fp, #4]
   10b8c:	e58bc000 	str	ip, [fp]
   10b90:	dafffe9c 	ble	10608 <_vfiprintf_r+0x544>
   10b94:	e3520000 	cmp	r2, #0
   10b98:	1a000133 	bne	1106c <_vfiprintf_r+0xfa8>
   10b9c:	e59d3020 	ldr	r3, [sp, #32]
   10ba0:	e3530000 	cmp	r3, #0
   10ba4:	0afffea8 	beq	1064c <_vfiprintf_r+0x588>
   10ba8:	e3a02002 	mov	r2, #2
   10bac:	e1a00001 	mov	r0, r1
   10bb0:	e1a0b008 	mov	fp, r8
   10bb4:	e28d3038 	add	r3, sp, #56	; 0x38
   10bb8:	e58d2074 	str	r2, [sp, #116]	; 0x74
   10bbc:	e58d3070 	str	r3, [sp, #112]	; 0x70
   10bc0:	e1a01000 	mov	r1, r0
   10bc4:	e28bb008 	add	fp, fp, #8
   10bc8:	e2800001 	add	r0, r0, #1
   10bcc:	e3560080 	cmp	r6, #128	; 0x80
   10bd0:	0afffea2 	beq	10660 <_vfiprintf_r+0x59c>
   10bd4:	e59d3010 	ldr	r3, [sp, #16]
   10bd8:	e04aa003 	sub	sl, sl, r3
   10bdc:	e35a0000 	cmp	sl, #0
   10be0:	da000057 	ble	10d44 <_vfiprintf_r+0xc80>
   10be4:	e35a0010 	cmp	sl, #16
   10be8:	da000019 	ble	10c54 <_vfiprintf_r+0xb90>
   10bec:	e3a04010 	mov	r4, #16
   10bf0:	e59d5014 	ldr	r5, [sp, #20]
   10bf4:	e59d600c 	ldr	r6, [sp, #12]
   10bf8:	ea000005 	b	10c14 <_vfiprintf_r+0xb50>
   10bfc:	e2810002 	add	r0, r1, #2
   10c00:	e1a01003 	mov	r1, r3
   10c04:	e28bb008 	add	fp, fp, #8
   10c08:	e24aa010 	sub	sl, sl, #16
   10c0c:	e35a0010 	cmp	sl, #16
   10c10:	da00000f 	ble	10c54 <_vfiprintf_r+0xb90>
   10c14:	e2813001 	add	r3, r1, #1
   10c18:	e59f0798 	ldr	r0, [pc, #1944]	; 113b8 <_vfiprintf_r+0x12f4>
   10c1c:	e2822010 	add	r2, r2, #16
   10c20:	e3530007 	cmp	r3, #7
   10c24:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10c28:	e88b0011 	stm	fp, {r0, r4}
   10c2c:	e58d3040 	str	r3, [sp, #64]	; 0x40
   10c30:	dafffff1 	ble	10bfc <_vfiprintf_r+0xb38>
   10c34:	e3520000 	cmp	r2, #0
   10c38:	1a00002c 	bne	10cf0 <_vfiprintf_r+0xc2c>
   10c3c:	e24aa010 	sub	sl, sl, #16
   10c40:	e35a0010 	cmp	sl, #16
   10c44:	e3a00001 	mov	r0, #1
   10c48:	e3a01000 	mov	r1, #0
   10c4c:	e1a0b008 	mov	fp, r8
   10c50:	caffffef 	bgt	10c14 <_vfiprintf_r+0xb50>
   10c54:	e59f375c 	ldr	r3, [pc, #1884]	; 113b8 <_vfiprintf_r+0x12f4>
   10c58:	e3500007 	cmp	r0, #7
   10c5c:	e082200a 	add	r2, r2, sl
   10c60:	e88b0408 	stm	fp, {r3, sl}
   10c64:	e58d0040 	str	r0, [sp, #64]	; 0x40
   10c68:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10c6c:	d28bb008 	addle	fp, fp, #8
   10c70:	d2800001 	addle	r0, r0, #1
   10c74:	da000032 	ble	10d44 <_vfiprintf_r+0xc80>
   10c78:	e3520000 	cmp	r2, #0
   10c7c:	1a000026 	bne	10d1c <_vfiprintf_r+0xc58>
   10c80:	e3a03001 	mov	r3, #1
   10c84:	e1a0b008 	mov	fp, r8
   10c88:	e59d2010 	ldr	r2, [sp, #16]
   10c8c:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
   10c90:	e58d2074 	str	r2, [sp, #116]	; 0x74
   10c94:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10c98:	e58d1070 	str	r1, [sp, #112]	; 0x70
   10c9c:	e58d3040 	str	r3, [sp, #64]	; 0x40
   10ca0:	e28bb008 	add	fp, fp, #8
   10ca4:	e59d3004 	ldr	r3, [sp, #4]
   10ca8:	e3130004 	tst	r3, #4
   10cac:	0a000003 	beq	10cc0 <_vfiprintf_r+0xbfc>
   10cb0:	e59d301c 	ldr	r3, [sp, #28]
   10cb4:	e0434007 	sub	r4, r3, r7
   10cb8:	e3540000 	cmp	r4, #0
   10cbc:	ca000033 	bgt	10d90 <_vfiprintf_r+0xccc>
   10cc0:	e59d3008 	ldr	r3, [sp, #8]
   10cc4:	e59d101c 	ldr	r1, [sp, #28]
   10cc8:	e1510007 	cmp	r1, r7
   10ccc:	a0833001 	addge	r3, r3, r1
   10cd0:	b0833007 	addlt	r3, r3, r7
   10cd4:	e3520000 	cmp	r2, #0
   10cd8:	e58d3008 	str	r3, [sp, #8]
   10cdc:	1a00009f 	bne	10f60 <_vfiprintf_r+0xe9c>
   10ce0:	e3a03000 	mov	r3, #0
   10ce4:	e1a0b008 	mov	fp, r8
   10ce8:	e58d3040 	str	r3, [sp, #64]	; 0x40
   10cec:	eafffd22 	b	1017c <_vfiprintf_r+0xb8>
   10cf0:	e28d203c 	add	r2, sp, #60	; 0x3c
   10cf4:	e1a01006 	mov	r1, r6
   10cf8:	e1a00005 	mov	r0, r5
   10cfc:	ebfffcbe 	bl	fffc <__sprint_r.part.0>
   10d00:	e3500000 	cmp	r0, #0
   10d04:	1a0000f4 	bne	110dc <_vfiprintf_r+0x1018>
   10d08:	e28d1040 	add	r1, sp, #64	; 0x40
   10d0c:	e8910006 	ldm	r1, {r1, r2}
   10d10:	e1a0b008 	mov	fp, r8
   10d14:	e2810001 	add	r0, r1, #1
   10d18:	eaffffba 	b	10c08 <_vfiprintf_r+0xb44>
   10d1c:	e28d203c 	add	r2, sp, #60	; 0x3c
   10d20:	e59d100c 	ldr	r1, [sp, #12]
   10d24:	e59d0014 	ldr	r0, [sp, #20]
   10d28:	ebfffcb3 	bl	fffc <__sprint_r.part.0>
   10d2c:	e3500000 	cmp	r0, #0
   10d30:	1a000090 	bne	10f78 <_vfiprintf_r+0xeb4>
   10d34:	e1a0b008 	mov	fp, r8
   10d38:	e28d0040 	add	r0, sp, #64	; 0x40
   10d3c:	e8900005 	ldm	r0, {r0, r2}
   10d40:	e2800001 	add	r0, r0, #1
   10d44:	e59d3010 	ldr	r3, [sp, #16]
   10d48:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
   10d4c:	e0832002 	add	r2, r3, r2
   10d50:	e3500007 	cmp	r0, #7
   10d54:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10d58:	e88b000a 	stm	fp, {r1, r3}
   10d5c:	e58d0040 	str	r0, [sp, #64]	; 0x40
   10d60:	daffffce 	ble	10ca0 <_vfiprintf_r+0xbdc>
   10d64:	e3520000 	cmp	r2, #0
   10d68:	1a00009e 	bne	10fe8 <_vfiprintf_r+0xf24>
   10d6c:	e59d3004 	ldr	r3, [sp, #4]
   10d70:	e3130004 	tst	r3, #4
   10d74:	e58d2040 	str	r2, [sp, #64]	; 0x40
   10d78:	0a000031 	beq	10e44 <_vfiprintf_r+0xd80>
   10d7c:	e59d301c 	ldr	r3, [sp, #28]
   10d80:	e0434007 	sub	r4, r3, r7
   10d84:	e3540000 	cmp	r4, #0
   10d88:	c1a0b008 	movgt	fp, r8
   10d8c:	da00002c 	ble	10e44 <_vfiprintf_r+0xd80>
   10d90:	e3540010 	cmp	r4, #16
   10d94:	d59d0040 	ldrle	r0, [sp, #64]	; 0x40
   10d98:	d2800001 	addle	r0, r0, #1
   10d9c:	da00001f 	ble	10e20 <_vfiprintf_r+0xd5c>
   10da0:	e1a0c00b 	mov	ip, fp
   10da4:	e3a05010 	mov	r5, #16
   10da8:	e1a0b004 	mov	fp, r4
   10dac:	e3a06001 	mov	r6, #1
   10db0:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
   10db4:	e59da014 	ldr	sl, [sp, #20]
   10db8:	e59d400c 	ldr	r4, [sp, #12]
   10dbc:	ea000005 	b	10dd8 <_vfiprintf_r+0xd14>
   10dc0:	e2810002 	add	r0, r1, #2
   10dc4:	e1a01003 	mov	r1, r3
   10dc8:	e28cc008 	add	ip, ip, #8
   10dcc:	e24bb010 	sub	fp, fp, #16
   10dd0:	e35b0010 	cmp	fp, #16
   10dd4:	da00000f 	ble	10e18 <_vfiprintf_r+0xd54>
   10dd8:	e2813001 	add	r3, r1, #1
   10ddc:	e59f05d0 	ldr	r0, [pc, #1488]	; 113b4 <_vfiprintf_r+0x12f0>
   10de0:	e2822010 	add	r2, r2, #16
   10de4:	e3530007 	cmp	r3, #7
   10de8:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10dec:	e88c0021 	stm	ip, {r0, r5}
   10df0:	e58d3040 	str	r3, [sp, #64]	; 0x40
   10df4:	dafffff1 	ble	10dc0 <_vfiprintf_r+0xcfc>
   10df8:	e3520000 	cmp	r2, #0
   10dfc:	1a000017 	bne	10e60 <_vfiprintf_r+0xd9c>
   10e00:	e24bb010 	sub	fp, fp, #16
   10e04:	e35b0010 	cmp	fp, #16
   10e08:	e1a00006 	mov	r0, r6
   10e0c:	e3a01000 	mov	r1, #0
   10e10:	e1a0c008 	mov	ip, r8
   10e14:	caffffef 	bgt	10dd8 <_vfiprintf_r+0xd14>
   10e18:	e1a0400b 	mov	r4, fp
   10e1c:	e1a0b00c 	mov	fp, ip
   10e20:	e59f358c 	ldr	r3, [pc, #1420]	; 113b4 <_vfiprintf_r+0x12f0>
   10e24:	e0822004 	add	r2, r2, r4
   10e28:	e3500007 	cmp	r0, #7
   10e2c:	e58d2044 	str	r2, [sp, #68]	; 0x44
   10e30:	e88b0018 	stm	fp, {r3, r4}
   10e34:	e58d0040 	str	r0, [sp, #64]	; 0x40
   10e38:	daffffa0 	ble	10cc0 <_vfiprintf_r+0xbfc>
   10e3c:	e3520000 	cmp	r2, #0
   10e40:	1a0000f5 	bne	1121c <_vfiprintf_r+0x1158>
   10e44:	e59d3008 	ldr	r3, [sp, #8]
   10e48:	e59d201c 	ldr	r2, [sp, #28]
   10e4c:	e1520007 	cmp	r2, r7
   10e50:	a0833002 	addge	r3, r3, r2
   10e54:	b0833007 	addlt	r3, r3, r7
   10e58:	e58d3008 	str	r3, [sp, #8]
   10e5c:	eaffff9f 	b	10ce0 <_vfiprintf_r+0xc1c>
   10e60:	e28d203c 	add	r2, sp, #60	; 0x3c
   10e64:	e1a01004 	mov	r1, r4
   10e68:	e1a0000a 	mov	r0, sl
   10e6c:	ebfffc62 	bl	fffc <__sprint_r.part.0>
   10e70:	e3500000 	cmp	r0, #0
   10e74:	1a000113 	bne	112c8 <_vfiprintf_r+0x1204>
   10e78:	e28d1040 	add	r1, sp, #64	; 0x40
   10e7c:	e8910006 	ldm	r1, {r1, r2}
   10e80:	e1a0c008 	mov	ip, r8
   10e84:	e2810001 	add	r0, r1, #1
   10e88:	eaffffcf 	b	10dcc <_vfiprintf_r+0xd08>
   10e8c:	e1a01002 	mov	r1, r2
   10e90:	e1a021a6 	lsr	r2, r6, #3
   10e94:	e1822e87 	orr	r2, r2, r7, lsl #29
   10e98:	e1a001a7 	lsr	r0, r7, #3
   10e9c:	e2063007 	and	r3, r6, #7
   10ea0:	e1a07000 	mov	r7, r0
   10ea4:	e1a06002 	mov	r6, r2
   10ea8:	e2833030 	add	r3, r3, #48	; 0x30
   10eac:	e1962007 	orrs	r2, r6, r7
   10eb0:	e5413001 	strb	r3, [r1, #-1]
   10eb4:	e2412001 	sub	r2, r1, #1
   10eb8:	1afffff3 	bne	10e8c <_vfiprintf_r+0xdc8>
   10ebc:	e3530030 	cmp	r3, #48	; 0x30
   10ec0:	03a03000 	moveq	r3, #0
   10ec4:	12053001 	andne	r3, r5, #1
   10ec8:	e3530000 	cmp	r3, #0
   10ecc:	0a0000e9 	beq	11278 <_vfiprintf_r+0x11b4>
   10ed0:	e3a03030 	mov	r3, #48	; 0x30
   10ed4:	e2411002 	sub	r1, r1, #2
   10ed8:	e58d1024 	str	r1, [sp, #36]	; 0x24
   10edc:	e0481001 	sub	r1, r8, r1
   10ee0:	e58d5004 	str	r5, [sp, #4]
   10ee4:	e58d1010 	str	r1, [sp, #16]
   10ee8:	e5423001 	strb	r3, [r2, #-1]
   10eec:	eafffd7e 	b	104ec <_vfiprintf_r+0x428>
   10ef0:	e28d203c 	add	r2, sp, #60	; 0x3c
   10ef4:	e59d100c 	ldr	r1, [sp, #12]
   10ef8:	e1a00004 	mov	r0, r4
   10efc:	ebfffc3e 	bl	fffc <__sprint_r.part.0>
   10f00:	e3500000 	cmp	r0, #0
   10f04:	1a00001b 	bne	10f78 <_vfiprintf_r+0xeb4>
   10f08:	e28d1040 	add	r1, sp, #64	; 0x40
   10f0c:	e8910006 	ldm	r1, {r1, r2}
   10f10:	e1a0e008 	mov	lr, r8
   10f14:	e281c001 	add	ip, r1, #1
   10f18:	eafffde0 	b	106a0 <_vfiprintf_r+0x5dc>
   10f1c:	e3a03000 	mov	r3, #0
   10f20:	e58d8024 	str	r8, [sp, #36]	; 0x24
   10f24:	e58d3010 	str	r3, [sp, #16]
   10f28:	eafffd6f 	b	104ec <_vfiprintf_r+0x428>
   10f2c:	e3530001 	cmp	r3, #1
   10f30:	e1a05002 	mov	r5, r2
   10f34:	1afffe7e 	bne	10934 <_vfiprintf_r+0x870>
   10f38:	e3570000 	cmp	r7, #0
   10f3c:	03560009 	cmpeq	r6, #9
   10f40:	8a000086 	bhi	11160 <_vfiprintf_r+0x109c>
   10f44:	e28d20b0 	add	r2, sp, #176	; 0xb0
   10f48:	e2866030 	add	r6, r6, #48	; 0x30
   10f4c:	e5626041 	strb	r6, [r2, #-65]!	; 0xffffffbf
   10f50:	e58d5004 	str	r5, [sp, #4]
   10f54:	e58d3010 	str	r3, [sp, #16]
   10f58:	e58d2024 	str	r2, [sp, #36]	; 0x24
   10f5c:	eafffd62 	b	104ec <_vfiprintf_r+0x428>
   10f60:	e28d203c 	add	r2, sp, #60	; 0x3c
   10f64:	e59d100c 	ldr	r1, [sp, #12]
   10f68:	e59d0014 	ldr	r0, [sp, #20]
   10f6c:	ebfffc22 	bl	fffc <__sprint_r.part.0>
   10f70:	e3500000 	cmp	r0, #0
   10f74:	0affff59 	beq	10ce0 <_vfiprintf_r+0xc1c>
   10f78:	e59da00c 	ldr	sl, [sp, #12]
   10f7c:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
   10f80:	e3130001 	tst	r3, #1
   10f84:	e1da30bc 	ldrh	r3, [sl, #12]
   10f88:	1a000001 	bne	10f94 <_vfiprintf_r+0xed0>
   10f8c:	e3130c02 	tst	r3, #512	; 0x200
   10f90:	0a000031 	beq	1105c <_vfiprintf_r+0xf98>
   10f94:	e3130040 	tst	r3, #64	; 0x40
   10f98:	0afffd21 	beq	10424 <_vfiprintf_r+0x360>
   10f9c:	e3e03000 	mvn	r3, #0
   10fa0:	e58d3008 	str	r3, [sp, #8]
   10fa4:	e59d0008 	ldr	r0, [sp, #8]
   10fa8:	e28dd0b4 	add	sp, sp, #180	; 0xb4
   10fac:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10fb0:	e12fff1e 	bx	lr
   10fb4:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
   10fb8:	e3130001 	tst	r3, #1
   10fbc:	1afffff6 	bne	10f9c <_vfiprintf_r+0xed8>
   10fc0:	e1da30bc 	ldrh	r3, [sl, #12]
   10fc4:	e3130c02 	tst	r3, #512	; 0x200
   10fc8:	1afffff3 	bne	10f9c <_vfiprintf_r+0xed8>
   10fcc:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
   10fd0:	eb00068e 	bl	12a10 <__retarget_lock_release_recursive>
   10fd4:	e3e03000 	mvn	r3, #0
   10fd8:	e58d3008 	str	r3, [sp, #8]
   10fdc:	eafffd10 	b	10424 <_vfiprintf_r+0x360>
   10fe0:	e3a03002 	mov	r3, #2
   10fe4:	eafffd2c 	b	1049c <_vfiprintf_r+0x3d8>
   10fe8:	e28d203c 	add	r2, sp, #60	; 0x3c
   10fec:	e59d100c 	ldr	r1, [sp, #12]
   10ff0:	e59d0014 	ldr	r0, [sp, #20]
   10ff4:	ebfffc00 	bl	fffc <__sprint_r.part.0>
   10ff8:	e3500000 	cmp	r0, #0
   10ffc:	1affffdd 	bne	10f78 <_vfiprintf_r+0xeb4>
   11000:	e1a0b008 	mov	fp, r8
   11004:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
   11008:	eaffff25 	b	10ca4 <_vfiprintf_r+0xbe0>
   1100c:	e28d203c 	add	r2, sp, #60	; 0x3c
   11010:	e59d100c 	ldr	r1, [sp, #12]
   11014:	e59d0014 	ldr	r0, [sp, #20]
   11018:	ebfffbf7 	bl	fffc <__sprint_r.part.0>
   1101c:	e3500000 	cmp	r0, #0
   11020:	1affffd4 	bne	10f78 <_vfiprintf_r+0xeb4>
   11024:	e1a0b008 	mov	fp, r8
   11028:	eafffc69 	b	101d4 <_vfiprintf_r+0x110>
   1102c:	e2822004 	add	r2, r2, #4
   11030:	e5936000 	ldr	r6, [r3]
   11034:	e3a07000 	mov	r7, #0
   11038:	e3a03000 	mov	r3, #0
   1103c:	e58d2018 	str	r2, [sp, #24]
   11040:	eafffd15 	b	1049c <_vfiprintf_r+0x3d8>
   11044:	e2822004 	add	r2, r2, #4
   11048:	e5936000 	ldr	r6, [r3]
   1104c:	e3a07000 	mov	r7, #0
   11050:	e3a03001 	mov	r3, #1
   11054:	e58d2018 	str	r2, [sp, #24]
   11058:	eafffd0f 	b	1049c <_vfiprintf_r+0x3d8>
   1105c:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
   11060:	eb00066a 	bl	12a10 <__retarget_lock_release_recursive>
   11064:	e1da30bc 	ldrh	r3, [sl, #12]
   11068:	eaffffc9 	b	10f94 <_vfiprintf_r+0xed0>
   1106c:	e28d203c 	add	r2, sp, #60	; 0x3c
   11070:	e59d100c 	ldr	r1, [sp, #12]
   11074:	e59d0014 	ldr	r0, [sp, #20]
   11078:	ebfffbdf 	bl	fffc <__sprint_r.part.0>
   1107c:	e3500000 	cmp	r0, #0
   11080:	1affffbc 	bne	10f78 <_vfiprintf_r+0xeb4>
   11084:	e28d1040 	add	r1, sp, #64	; 0x40
   11088:	e8910006 	ldm	r1, {r1, r2}
   1108c:	e1a0b008 	mov	fp, r8
   11090:	e2810001 	add	r0, r1, #1
   11094:	eafffd5e 	b	10614 <_vfiprintf_r+0x550>
   11098:	e28d203c 	add	r2, sp, #60	; 0x3c
   1109c:	e59d100c 	ldr	r1, [sp, #12]
   110a0:	e59d0014 	ldr	r0, [sp, #20]
   110a4:	ebfffbd4 	bl	fffc <__sprint_r.part.0>
   110a8:	e3500000 	cmp	r0, #0
   110ac:	1affffb1 	bne	10f78 <_vfiprintf_r+0xeb4>
   110b0:	e28d1040 	add	r1, sp, #64	; 0x40
   110b4:	e8910006 	ldm	r1, {r1, r2}
   110b8:	e1a0b008 	mov	fp, r8
   110bc:	e2810001 	add	r0, r1, #1
   110c0:	eafffec1 	b	10bcc <_vfiprintf_r+0xb08>
   110c4:	e3520000 	cmp	r2, #0
   110c8:	1a000088 	bne	112f0 <_vfiprintf_r+0x122c>
   110cc:	e3a00001 	mov	r0, #1
   110d0:	e3a01000 	mov	r1, #0
   110d4:	e1a0b008 	mov	fp, r8
   110d8:	eafffebd 	b	10bd4 <_vfiprintf_r+0xb10>
   110dc:	e1a0a006 	mov	sl, r6
   110e0:	eaffffa5 	b	10f7c <_vfiprintf_r+0xeb8>
   110e4:	e59d3018 	ldr	r3, [sp, #24]
   110e8:	e2833007 	add	r3, r3, #7
   110ec:	e3c31007 	bic	r1, r3, #7
   110f0:	e891000c 	ldm	r1, {r2, r3}
   110f4:	e2811008 	add	r1, r1, #8
   110f8:	e58d1018 	str	r1, [sp, #24]
   110fc:	e1a06002 	mov	r6, r2
   11100:	e1a07003 	mov	r7, r3
   11104:	eafffe01 	b	10910 <_vfiprintf_r+0x84c>
   11108:	e2822007 	add	r2, r2, #7
   1110c:	e3c22007 	bic	r2, r2, #7
   11110:	e2821008 	add	r1, r2, #8
   11114:	e58d1018 	str	r1, [sp, #24]
   11118:	e89200c0 	ldm	r2, {r6, r7}
   1111c:	eafffe3e 	b	10a1c <_vfiprintf_r+0x958>
   11120:	e59d3018 	ldr	r3, [sp, #24]
   11124:	e2833007 	add	r3, r3, #7
   11128:	e3c33007 	bic	r3, r3, #7
   1112c:	e2832008 	add	r2, r3, #8
   11130:	e89300c0 	ldm	r3, {r6, r7}
   11134:	e58d2018 	str	r2, [sp, #24]
   11138:	e3a03001 	mov	r3, #1
   1113c:	eafffcd6 	b	1049c <_vfiprintf_r+0x3d8>
   11140:	e59d3018 	ldr	r3, [sp, #24]
   11144:	e2833007 	add	r3, r3, #7
   11148:	e3c33007 	bic	r3, r3, #7
   1114c:	e2832008 	add	r2, r3, #8
   11150:	e89300c0 	ldm	r3, {r6, r7}
   11154:	e58d2018 	str	r2, [sp, #24]
   11158:	e3a03000 	mov	r3, #0
   1115c:	eafffcce 	b	1049c <_vfiprintf_r+0x3d8>
   11160:	e58d4004 	str	r4, [sp, #4]
   11164:	e1a04008 	mov	r4, r8
   11168:	e1a00006 	mov	r0, r6
   1116c:	e1a01007 	mov	r1, r7
   11170:	e3a0200a 	mov	r2, #10
   11174:	e3a03000 	mov	r3, #0
   11178:	eb000ccc 	bl	144b0 <__aeabi_uldivmod>
   1117c:	e2822030 	add	r2, r2, #48	; 0x30
   11180:	e5642001 	strb	r2, [r4, #-1]!
   11184:	e1a00006 	mov	r0, r6
   11188:	e1a01007 	mov	r1, r7
   1118c:	e3a03000 	mov	r3, #0
   11190:	e3a0200a 	mov	r2, #10
   11194:	eb000cc5 	bl	144b0 <__aeabi_uldivmod>
   11198:	e1a06000 	mov	r6, r0
   1119c:	e1a07001 	mov	r7, r1
   111a0:	e1963007 	orrs	r3, r6, r7
   111a4:	1affffef 	bne	11168 <_vfiprintf_r+0x10a4>
   111a8:	e1a03004 	mov	r3, r4
   111ac:	e0483003 	sub	r3, r8, r3
   111b0:	e58d4024 	str	r4, [sp, #36]	; 0x24
   111b4:	e58d3010 	str	r3, [sp, #16]
   111b8:	e59d4004 	ldr	r4, [sp, #4]
   111bc:	e58d5004 	str	r5, [sp, #4]
   111c0:	eafffcc9 	b	104ec <_vfiprintf_r+0x428>
   111c4:	e3a0302d 	mov	r3, #45	; 0x2d
   111c8:	e2766000 	rsbs	r6, r6, #0
   111cc:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
   111d0:	e1a04003 	mov	r4, r3
   111d4:	e2e77000 	rsc	r7, r7, #0
   111d8:	e3a03001 	mov	r3, #1
   111dc:	eafffcb1 	b	104a8 <_vfiprintf_r+0x3e4>
   111e0:	e59d3020 	ldr	r3, [sp, #32]
   111e4:	e3530000 	cmp	r3, #0
   111e8:	1a000013 	bne	1123c <_vfiprintf_r+0x1178>
   111ec:	e3a01000 	mov	r1, #0
   111f0:	e3a00001 	mov	r0, #1
   111f4:	e1a0b008 	mov	fp, r8
   111f8:	eafffe75 	b	10bd4 <_vfiprintf_r+0xb10>
   111fc:	e59d1018 	ldr	r1, [sp, #24]
   11200:	e5916000 	ldr	r6, [r1]
   11204:	e2811004 	add	r1, r1, #4
   11208:	e1a07fc6 	asr	r7, r6, #31
   1120c:	e1a02006 	mov	r2, r6
   11210:	e1a03007 	mov	r3, r7
   11214:	e58d1018 	str	r1, [sp, #24]
   11218:	eafffdbc 	b	10910 <_vfiprintf_r+0x84c>
   1121c:	e28d203c 	add	r2, sp, #60	; 0x3c
   11220:	e59d100c 	ldr	r1, [sp, #12]
   11224:	e59d0014 	ldr	r0, [sp, #20]
   11228:	ebfffb73 	bl	fffc <__sprint_r.part.0>
   1122c:	e3500000 	cmp	r0, #0
   11230:	1affff50 	bne	10f78 <_vfiprintf_r+0xeb4>
   11234:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
   11238:	eafffea0 	b	10cc0 <_vfiprintf_r+0xbfc>
   1123c:	e3a02002 	mov	r2, #2
   11240:	e28d3038 	add	r3, sp, #56	; 0x38
   11244:	e58d2074 	str	r2, [sp, #116]	; 0x74
   11248:	e58d3070 	str	r3, [sp, #112]	; 0x70
   1124c:	e3a00001 	mov	r0, #1
   11250:	e1a0b008 	mov	fp, r8
   11254:	eafffe59 	b	10bc0 <_vfiprintf_r+0xafc>
   11258:	e59d3018 	ldr	r3, [sp, #24]
   1125c:	e5936000 	ldr	r6, [r3]
   11260:	eafffda5 	b	108fc <_vfiprintf_r+0x838>
   11264:	e5926000 	ldr	r6, [r2]
   11268:	e2822004 	add	r2, r2, #4
   1126c:	e58d2018 	str	r2, [sp, #24]
   11270:	e3a07000 	mov	r7, #0
   11274:	eafffde8 	b	10a1c <_vfiprintf_r+0x958>
   11278:	e0483002 	sub	r3, r8, r2
   1127c:	e58d5004 	str	r5, [sp, #4]
   11280:	e58d3010 	str	r3, [sp, #16]
   11284:	e58d2024 	str	r2, [sp, #36]	; 0x24
   11288:	eafffc97 	b	104ec <_vfiprintf_r+0x428>
   1128c:	e59d3018 	ldr	r3, [sp, #24]
   11290:	e59d2008 	ldr	r2, [sp, #8]
   11294:	e5931000 	ldr	r1, [r3]
   11298:	e2833004 	add	r3, r3, #4
   1129c:	e58d3018 	str	r3, [sp, #24]
   112a0:	e1a03fc2 	asr	r3, r2, #31
   112a4:	e881000c 	stm	r1, {r2, r3}
   112a8:	eafffbb3 	b	1017c <_vfiprintf_r+0xb8>
   112ac:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
   112b0:	e3530000 	cmp	r3, #0
   112b4:	e59da00c 	ldr	sl, [sp, #12]
   112b8:	1a00002c 	bne	11370 <_vfiprintf_r+0x12ac>
   112bc:	e3a03000 	mov	r3, #0
   112c0:	e58d3040 	str	r3, [sp, #64]	; 0x40
   112c4:	eaffff2c 	b	10f7c <_vfiprintf_r+0xeb8>
   112c8:	e1a0a004 	mov	sl, r4
   112cc:	eaffff2a 	b	10f7c <_vfiprintf_r+0xeb8>
   112d0:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
   112d4:	e58d4018 	str	r4, [sp, #24]
   112d8:	e58d5004 	str	r5, [sp, #4]
   112dc:	ebfffaea 	bl	fe8c <strlen>
   112e0:	e3a0a000 	mov	sl, #0
   112e4:	e58d0010 	str	r0, [sp, #16]
   112e8:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
   112ec:	eafffc7e 	b	104ec <_vfiprintf_r+0x428>
   112f0:	e28d203c 	add	r2, sp, #60	; 0x3c
   112f4:	e59d100c 	ldr	r1, [sp, #12]
   112f8:	e59d0014 	ldr	r0, [sp, #20]
   112fc:	ebfffb3e 	bl	fffc <__sprint_r.part.0>
   11300:	e3500000 	cmp	r0, #0
   11304:	1affff1b 	bne	10f78 <_vfiprintf_r+0xeb4>
   11308:	e28d1040 	add	r1, sp, #64	; 0x40
   1130c:	e8910006 	ldm	r1, {r1, r2}
   11310:	e1a0b008 	mov	fp, r8
   11314:	e2810001 	add	r0, r1, #1
   11318:	eafffe2d 	b	10bd4 <_vfiprintf_r+0xb10>
   1131c:	e28d1040 	add	r1, sp, #64	; 0x40
   11320:	e8910006 	ldm	r1, {r1, r2}
   11324:	e2811001 	add	r1, r1, #1
   11328:	eafffca2 	b	105b8 <_vfiprintf_r+0x4f4>
   1132c:	e35a0006 	cmp	sl, #6
   11330:	31a0300a 	movcc	r3, sl
   11334:	23a03006 	movcs	r3, #6
   11338:	e58d3010 	str	r3, [sp, #16]
   1133c:	e1a07003 	mov	r7, r3
   11340:	e59f307c 	ldr	r3, [pc, #124]	; 113c4 <_vfiprintf_r+0x1300>
   11344:	e58d4018 	str	r4, [sp, #24]
   11348:	e58d3024 	str	r3, [sp, #36]	; 0x24
   1134c:	eafffdc8 	b	10a74 <_vfiprintf_r+0x9b0>
   11350:	e58da010 	str	sl, [sp, #16]
   11354:	e58d4018 	str	r4, [sp, #24]
   11358:	e58d5004 	str	r5, [sp, #4]
   1135c:	e3a0a000 	mov	sl, #0
   11360:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
   11364:	eafffc60 	b	104ec <_vfiprintf_r+0x428>
   11368:	e1a0c000 	mov	ip, r0
   1136c:	eafffce1 	b	106f8 <_vfiprintf_r+0x634>
   11370:	e59d0014 	ldr	r0, [sp, #20]
   11374:	e28d203c 	add	r2, sp, #60	; 0x3c
   11378:	e1a0100a 	mov	r1, sl
   1137c:	ebfffb1e 	bl	fffc <__sprint_r.part.0>
   11380:	e3500000 	cmp	r0, #0
   11384:	0affffcc 	beq	112bc <_vfiprintf_r+0x11f8>
   11388:	eafffefb 	b	10f7c <_vfiprintf_r+0xeb8>
   1138c:	e59d2018 	ldr	r2, [sp, #24]
   11390:	e58da004 	str	sl, [sp, #4]
   11394:	e592a000 	ldr	sl, [r2]
   11398:	e2822004 	add	r2, r2, #4
   1139c:	e15a0007 	cmp	sl, r7
   113a0:	e5d93001 	ldrb	r3, [r9, #1]
   113a4:	b1a0a007 	movlt	sl, r7
   113a8:	e59d9004 	ldr	r9, [sp, #4]
   113ac:	e58d2018 	str	r2, [sp, #24]
   113b0:	eafffb9a 	b	10220 <_vfiprintf_r+0x15c>
   113b4:	00015054 	.word	0x00015054
   113b8:	00015064 	.word	0x00015064
   113bc:	00015038 	.word	0x00015038
   113c0:	00015024 	.word	0x00015024
   113c4:	0001504c 	.word	0x0001504c

000113c8 <vfiprintf>:
   113c8:	e59fc010 	ldr	ip, [pc, #16]	; 113e0 <vfiprintf+0x18>
   113cc:	e1a03002 	mov	r3, r2
   113d0:	e1a02001 	mov	r2, r1
   113d4:	e1a01000 	mov	r1, r0
   113d8:	e59c0000 	ldr	r0, [ip]
   113dc:	eafffb38 	b	100c4 <_vfiprintf_r>
   113e0:	00015210 	.word	0x00015210

000113e4 <__sbprintf>:
   113e4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   113e8:	e1a04001 	mov	r4, r1
   113ec:	e3a0cb01 	mov	ip, #1024	; 0x400
   113f0:	e3a0e000 	mov	lr, #0
   113f4:	e1a06002 	mov	r6, r2
   113f8:	e1a07000 	mov	r7, r0
   113fc:	e1a08003 	mov	r8, r3
   11400:	e24dde46 	sub	sp, sp, #1120	; 0x460
   11404:	e1d430be 	ldrh	r3, [r4, #14]
   11408:	e24dd008 	sub	sp, sp, #8
   1140c:	e1d110bc 	ldrh	r1, [r1, #12]
   11410:	e1cd30be 	strh	r3, [sp, #14]
   11414:	e5943064 	ldr	r3, [r4, #100]	; 0x64
   11418:	e594201c 	ldr	r2, [r4, #28]
   1141c:	e3c11002 	bic	r1, r1, #2
   11420:	e58d3064 	str	r3, [sp, #100]	; 0x64
   11424:	e5943024 	ldr	r3, [r4, #36]	; 0x24
   11428:	e1cd10bc 	strh	r1, [sp, #12]
   1142c:	e28d0058 	add	r0, sp, #88	; 0x58
   11430:	e28d1068 	add	r1, sp, #104	; 0x68
   11434:	e58dc008 	str	ip, [sp, #8]
   11438:	e58dc014 	str	ip, [sp, #20]
   1143c:	e58d201c 	str	r2, [sp, #28]
   11440:	e58d3024 	str	r3, [sp, #36]	; 0x24
   11444:	e58de018 	str	lr, [sp, #24]
   11448:	e58d1000 	str	r1, [sp]
   1144c:	e58d1010 	str	r1, [sp, #16]
   11450:	eb000564 	bl	129e8 <__retarget_lock_init_recursive>
   11454:	e1a02006 	mov	r2, r6
   11458:	e1a03008 	mov	r3, r8
   1145c:	e1a0100d 	mov	r1, sp
   11460:	e1a00007 	mov	r0, r7
   11464:	ebfffb16 	bl	100c4 <_vfiprintf_r>
   11468:	e2506000 	subs	r6, r0, #0
   1146c:	ba000004 	blt	11484 <__sbprintf+0xa0>
   11470:	e1a0100d 	mov	r1, sp
   11474:	e1a00007 	mov	r0, r7
   11478:	eb0000fa 	bl	11868 <_fflush_r>
   1147c:	e3500000 	cmp	r0, #0
   11480:	13e06000 	mvnne	r6, #0
   11484:	e1dd30bc 	ldrh	r3, [sp, #12]
   11488:	e3130040 	tst	r3, #64	; 0x40
   1148c:	11d430bc 	ldrhne	r3, [r4, #12]
   11490:	13833040 	orrne	r3, r3, #64	; 0x40
   11494:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
   11498:	11c430bc 	strhne	r3, [r4, #12]
   1149c:	eb000553 	bl	129f0 <__retarget_lock_close_recursive>
   114a0:	e1a00006 	mov	r0, r6
   114a4:	e28dde46 	add	sp, sp, #1120	; 0x460
   114a8:	e28dd008 	add	sp, sp, #8
   114ac:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   114b0:	e12fff1e 	bx	lr

000114b4 <__swsetup_r>:
   114b4:	e59f3158 	ldr	r3, [pc, #344]	; 11614 <__swsetup_r+0x160>
   114b8:	e5933000 	ldr	r3, [r3]
   114bc:	e3530000 	cmp	r3, #0
   114c0:	e92d4070 	push	{r4, r5, r6, lr}
   114c4:	e1a05000 	mov	r5, r0
   114c8:	e1a04001 	mov	r4, r1
   114cc:	0a000002 	beq	114dc <__swsetup_r+0x28>
   114d0:	e5932038 	ldr	r2, [r3, #56]	; 0x38
   114d4:	e3520000 	cmp	r2, #0
   114d8:	0a000034 	beq	115b0 <__swsetup_r+0xfc>
   114dc:	e1d420fc 	ldrsh	r2, [r4, #12]
   114e0:	e1a03802 	lsl	r3, r2, #16
   114e4:	e3130702 	tst	r3, #524288	; 0x80000
   114e8:	e1a03823 	lsr	r3, r3, #16
   114ec:	0a00000c 	beq	11524 <__swsetup_r+0x70>
   114f0:	e5940010 	ldr	r0, [r4, #16]
   114f4:	e3500000 	cmp	r0, #0
   114f8:	0a000014 	beq	11550 <__swsetup_r+0x9c>
   114fc:	e2132001 	ands	r2, r3, #1
   11500:	1a00001b 	bne	11574 <__swsetup_r+0xc0>
   11504:	e3130002 	tst	r3, #2
   11508:	05942014 	ldreq	r2, [r4, #20]
   1150c:	e3500000 	cmp	r0, #0
   11510:	e5842008 	str	r2, [r4, #8]
   11514:	13a00000 	movne	r0, #0
   11518:	0a00001d 	beq	11594 <__swsetup_r+0xe0>
   1151c:	e8bd4070 	pop	{r4, r5, r6, lr}
   11520:	e12fff1e 	bx	lr
   11524:	e3130010 	tst	r3, #16
   11528:	0a000033 	beq	115fc <__swsetup_r+0x148>
   1152c:	e3130004 	tst	r3, #4
   11530:	1a000021 	bne	115bc <__swsetup_r+0x108>
   11534:	e5940010 	ldr	r0, [r4, #16]
   11538:	e3822008 	orr	r2, r2, #8
   1153c:	e1c420bc 	strh	r2, [r4, #12]
   11540:	e3500000 	cmp	r0, #0
   11544:	e1a02802 	lsl	r2, r2, #16
   11548:	e1a03822 	lsr	r3, r2, #16
   1154c:	1affffea 	bne	114fc <__swsetup_r+0x48>
   11550:	e2032d0a 	and	r2, r3, #640	; 0x280
   11554:	e3520c02 	cmp	r2, #512	; 0x200
   11558:	0affffe7 	beq	114fc <__swsetup_r+0x48>
   1155c:	e1a00005 	mov	r0, r5
   11560:	e1a01004 	mov	r1, r4
   11564:	eb000552 	bl	12ab4 <__smakebuf_r>
   11568:	e1d430bc 	ldrh	r3, [r4, #12]
   1156c:	e5940010 	ldr	r0, [r4, #16]
   11570:	eaffffe1 	b	114fc <__swsetup_r+0x48>
   11574:	e3a02000 	mov	r2, #0
   11578:	e5943014 	ldr	r3, [r4, #20]
   1157c:	e3500000 	cmp	r0, #0
   11580:	e2633000 	rsb	r3, r3, #0
   11584:	e5843018 	str	r3, [r4, #24]
   11588:	e5842008 	str	r2, [r4, #8]
   1158c:	13a00000 	movne	r0, #0
   11590:	1affffe1 	bne	1151c <__swsetup_r+0x68>
   11594:	e1d430fc 	ldrsh	r3, [r4, #12]
   11598:	e3130080 	tst	r3, #128	; 0x80
   1159c:	13833040 	orrne	r3, r3, #64	; 0x40
   115a0:	11c430bc 	strhne	r3, [r4, #12]
   115a4:	13e00000 	mvnne	r0, #0
   115a8:	e8bd4070 	pop	{r4, r5, r6, lr}
   115ac:	e12fff1e 	bx	lr
   115b0:	e1a00003 	mov	r0, r3
   115b4:	eb000140 	bl	11abc <__sinit>
   115b8:	eaffffc7 	b	114dc <__swsetup_r+0x28>
   115bc:	e5941030 	ldr	r1, [r4, #48]	; 0x30
   115c0:	e3510000 	cmp	r1, #0
   115c4:	0a000007 	beq	115e8 <__swsetup_r+0x134>
   115c8:	e2843040 	add	r3, r4, #64	; 0x40
   115cc:	e1510003 	cmp	r1, r3
   115d0:	0a000002 	beq	115e0 <__swsetup_r+0x12c>
   115d4:	e1a00005 	mov	r0, r5
   115d8:	eb000298 	bl	12040 <_free_r>
   115dc:	e1d420fc 	ldrsh	r2, [r4, #12]
   115e0:	e3a03000 	mov	r3, #0
   115e4:	e5843030 	str	r3, [r4, #48]	; 0x30
   115e8:	e3a03000 	mov	r3, #0
   115ec:	e5940010 	ldr	r0, [r4, #16]
   115f0:	e3c22024 	bic	r2, r2, #36	; 0x24
   115f4:	e8840009 	stm	r4, {r0, r3}
   115f8:	eaffffce 	b	11538 <__swsetup_r+0x84>
   115fc:	e3a03009 	mov	r3, #9
   11600:	e3822040 	orr	r2, r2, #64	; 0x40
   11604:	e5853000 	str	r3, [r5]
   11608:	e3e00000 	mvn	r0, #0
   1160c:	e1c420bc 	strh	r2, [r4, #12]
   11610:	eaffffc1 	b	1151c <__swsetup_r+0x68>
   11614:	00015210 	.word	0x00015210

00011618 <abort>:
   11618:	e92d4010 	push	{r4, lr}
   1161c:	e3a00006 	mov	r0, #6
   11620:	eb00097f 	bl	13c24 <raise>
   11624:	e3a00001 	mov	r0, #1
   11628:	eb000c51 	bl	14774 <_exit>

0001162c <__sflush_r>:
   1162c:	e1d130fc 	ldrsh	r3, [r1, #12]
   11630:	e1a02803 	lsl	r2, r3, #16
   11634:	e3120702 	tst	r2, #524288	; 0x80000
   11638:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   1163c:	e1a05001 	mov	r5, r1
   11640:	e1a08000 	mov	r8, r0
   11644:	1a000034 	bne	1171c <__sflush_r+0xf0>
   11648:	e5912004 	ldr	r2, [r1, #4]
   1164c:	e3833b02 	orr	r3, r3, #2048	; 0x800
   11650:	e3520000 	cmp	r2, #0
   11654:	e1c130bc 	strh	r3, [r1, #12]
   11658:	da000050 	ble	117a0 <__sflush_r+0x174>
   1165c:	e5954028 	ldr	r4, [r5, #40]	; 0x28
   11660:	e3540000 	cmp	r4, #0
   11664:	0a000050 	beq	117ac <__sflush_r+0x180>
   11668:	e3a02000 	mov	r2, #0
   1166c:	e1a03803 	lsl	r3, r3, #16
   11670:	e2030201 	and	r0, r3, #268435456	; 0x10000000
   11674:	e1b07820 	lsrs	r7, r0, #16
   11678:	e5986000 	ldr	r6, [r8]
   1167c:	e1a03823 	lsr	r3, r3, #16
   11680:	e5882000 	str	r2, [r8]
   11684:	0a00005e 	beq	11804 <__sflush_r+0x1d8>
   11688:	e5952050 	ldr	r2, [r5, #80]	; 0x50
   1168c:	e3130004 	tst	r3, #4
   11690:	0a000005 	beq	116ac <__sflush_r+0x80>
   11694:	e5951030 	ldr	r1, [r5, #48]	; 0x30
   11698:	e5953004 	ldr	r3, [r5, #4]
   1169c:	e3510000 	cmp	r1, #0
   116a0:	e0422003 	sub	r2, r2, r3
   116a4:	1595303c 	ldrne	r3, [r5, #60]	; 0x3c
   116a8:	10422003 	subne	r2, r2, r3
   116ac:	e3a03000 	mov	r3, #0
   116b0:	e595101c 	ldr	r1, [r5, #28]
   116b4:	e1a00008 	mov	r0, r8
   116b8:	e1a0e00f 	mov	lr, pc
   116bc:	e12fff14 	bx	r4
   116c0:	e3700001 	cmn	r0, #1
   116c4:	0a00003b 	beq	117b8 <__sflush_r+0x18c>
   116c8:	e3a01000 	mov	r1, #0
   116cc:	e1d530fc 	ldrsh	r3, [r5, #12]
   116d0:	e5952010 	ldr	r2, [r5, #16]
   116d4:	e3c33b02 	bic	r3, r3, #2048	; 0x800
   116d8:	e3130a01 	tst	r3, #4096	; 0x1000
   116dc:	e1c530bc 	strh	r3, [r5, #12]
   116e0:	e5851004 	str	r1, [r5, #4]
   116e4:	e5852000 	str	r2, [r5]
   116e8:	1a000043 	bne	117fc <__sflush_r+0x1d0>
   116ec:	e5951030 	ldr	r1, [r5, #48]	; 0x30
   116f0:	e3510000 	cmp	r1, #0
   116f4:	e5886000 	str	r6, [r8]
   116f8:	0a00002b 	beq	117ac <__sflush_r+0x180>
   116fc:	e2853040 	add	r3, r5, #64	; 0x40
   11700:	e1510003 	cmp	r1, r3
   11704:	11a00008 	movne	r0, r8
   11708:	1b00024c 	blne	12040 <_free_r>
   1170c:	e3a00000 	mov	r0, #0
   11710:	e5850030 	str	r0, [r5, #48]	; 0x30
   11714:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11718:	e12fff1e 	bx	lr
   1171c:	e5916010 	ldr	r6, [r1, #16]
   11720:	e3560000 	cmp	r6, #0
   11724:	0a000020 	beq	117ac <__sflush_r+0x180>
   11728:	e1a02822 	lsr	r2, r2, #16
   1172c:	e3120003 	tst	r2, #3
   11730:	13a03000 	movne	r3, #0
   11734:	e5914000 	ldr	r4, [r1]
   11738:	05913014 	ldreq	r3, [r1, #20]
   1173c:	e0444006 	sub	r4, r4, r6
   11740:	e3540000 	cmp	r4, #0
   11744:	e5816000 	str	r6, [r1]
   11748:	e5813008 	str	r3, [r1, #8]
   1174c:	ca000003 	bgt	11760 <__sflush_r+0x134>
   11750:	ea000015 	b	117ac <__sflush_r+0x180>
   11754:	e3540000 	cmp	r4, #0
   11758:	e0866000 	add	r6, r6, r0
   1175c:	da000012 	ble	117ac <__sflush_r+0x180>
   11760:	e1a03004 	mov	r3, r4
   11764:	e5957024 	ldr	r7, [r5, #36]	; 0x24
   11768:	e1a02006 	mov	r2, r6
   1176c:	e595101c 	ldr	r1, [r5, #28]
   11770:	e1a00008 	mov	r0, r8
   11774:	e1a0e00f 	mov	lr, pc
   11778:	e12fff17 	bx	r7
   1177c:	e3500000 	cmp	r0, #0
   11780:	e0444000 	sub	r4, r4, r0
   11784:	cafffff2 	bgt	11754 <__sflush_r+0x128>
   11788:	e3e00000 	mvn	r0, #0
   1178c:	e1d530bc 	ldrh	r3, [r5, #12]
   11790:	e3833040 	orr	r3, r3, #64	; 0x40
   11794:	e1c530bc 	strh	r3, [r5, #12]
   11798:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   1179c:	e12fff1e 	bx	lr
   117a0:	e591203c 	ldr	r2, [r1, #60]	; 0x3c
   117a4:	e3520000 	cmp	r2, #0
   117a8:	caffffab 	bgt	1165c <__sflush_r+0x30>
   117ac:	e3a00000 	mov	r0, #0
   117b0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   117b4:	e12fff1e 	bx	lr
   117b8:	e5981000 	ldr	r1, [r8]
   117bc:	e351001d 	cmp	r1, #29
   117c0:	8afffff0 	bhi	11788 <__sflush_r+0x15c>
   117c4:	e59f3098 	ldr	r3, [pc, #152]	; 11864 <__sflush_r+0x238>
   117c8:	e1e03133 	mvn	r3, r3, lsr r1
   117cc:	e2133001 	ands	r3, r3, #1
   117d0:	1affffec 	bne	11788 <__sflush_r+0x15c>
   117d4:	e1d520fc 	ldrsh	r2, [r5, #12]
   117d8:	e595c010 	ldr	ip, [r5, #16]
   117dc:	e3c22b02 	bic	r2, r2, #2048	; 0x800
   117e0:	e3120a01 	tst	r2, #4096	; 0x1000
   117e4:	e5853004 	str	r3, [r5, #4]
   117e8:	e1c520bc 	strh	r2, [r5, #12]
   117ec:	e585c000 	str	ip, [r5]
   117f0:	0affffbd 	beq	116ec <__sflush_r+0xc0>
   117f4:	e3510000 	cmp	r1, #0
   117f8:	1affffbb 	bne	116ec <__sflush_r+0xc0>
   117fc:	e5850050 	str	r0, [r5, #80]	; 0x50
   11800:	eaffffb9 	b	116ec <__sflush_r+0xc0>
   11804:	e1a02007 	mov	r2, r7
   11808:	e3a03001 	mov	r3, #1
   1180c:	e595101c 	ldr	r1, [r5, #28]
   11810:	e1a00008 	mov	r0, r8
   11814:	e1a0e00f 	mov	lr, pc
   11818:	e12fff14 	bx	r4
   1181c:	e3700001 	cmn	r0, #1
   11820:	e1a02000 	mov	r2, r0
   11824:	0a000002 	beq	11834 <__sflush_r+0x208>
   11828:	e1d530bc 	ldrh	r3, [r5, #12]
   1182c:	e5954028 	ldr	r4, [r5, #40]	; 0x28
   11830:	eaffff95 	b	1168c <__sflush_r+0x60>
   11834:	e5983000 	ldr	r3, [r8]
   11838:	e3530000 	cmp	r3, #0
   1183c:	0afffff9 	beq	11828 <__sflush_r+0x1fc>
   11840:	e3530016 	cmp	r3, #22
   11844:	1353001d 	cmpne	r3, #29
   11848:	11d530bc 	ldrhne	r3, [r5, #12]
   1184c:	13833040 	orrne	r3, r3, #64	; 0x40
   11850:	05886000 	streq	r6, [r8]
   11854:	01a00007 	moveq	r0, r7
   11858:	11a00002 	movne	r0, r2
   1185c:	11c530bc 	strhne	r3, [r5, #12]
   11860:	eaffffcc 	b	11798 <__sflush_r+0x16c>
   11864:	20400001 	.word	0x20400001

00011868 <_fflush_r>:
   11868:	e92d4070 	push	{r4, r5, r6, lr}
   1186c:	e2504000 	subs	r4, r0, #0
   11870:	e1a05001 	mov	r5, r1
   11874:	0a000002 	beq	11884 <_fflush_r+0x1c>
   11878:	e5943038 	ldr	r3, [r4, #56]	; 0x38
   1187c:	e3530000 	cmp	r3, #0
   11880:	0a000015 	beq	118dc <_fflush_r+0x74>
   11884:	e1d500fc 	ldrsh	r0, [r5, #12]
   11888:	e3500000 	cmp	r0, #0
   1188c:	01a04000 	moveq	r4, r0
   11890:	0a00000e 	beq	118d0 <_fflush_r+0x68>
   11894:	e5953064 	ldr	r3, [r5, #100]	; 0x64
   11898:	e3130001 	tst	r3, #1
   1189c:	1a000001 	bne	118a8 <_fflush_r+0x40>
   118a0:	e3100c02 	tst	r0, #512	; 0x200
   118a4:	0a000013 	beq	118f8 <_fflush_r+0x90>
   118a8:	e1a00004 	mov	r0, r4
   118ac:	e1a01005 	mov	r1, r5
   118b0:	ebffff5d 	bl	1162c <__sflush_r>
   118b4:	e5953064 	ldr	r3, [r5, #100]	; 0x64
   118b8:	e3130001 	tst	r3, #1
   118bc:	e1a04000 	mov	r4, r0
   118c0:	1a000002 	bne	118d0 <_fflush_r+0x68>
   118c4:	e1d530bc 	ldrh	r3, [r5, #12]
   118c8:	e3130c02 	tst	r3, #512	; 0x200
   118cc:	0a000004 	beq	118e4 <_fflush_r+0x7c>
   118d0:	e1a00004 	mov	r0, r4
   118d4:	e8bd4070 	pop	{r4, r5, r6, lr}
   118d8:	e12fff1e 	bx	lr
   118dc:	eb000076 	bl	11abc <__sinit>
   118e0:	eaffffe7 	b	11884 <_fflush_r+0x1c>
   118e4:	e5950058 	ldr	r0, [r5, #88]	; 0x58
   118e8:	eb000448 	bl	12a10 <__retarget_lock_release_recursive>
   118ec:	e1a00004 	mov	r0, r4
   118f0:	e8bd4070 	pop	{r4, r5, r6, lr}
   118f4:	e12fff1e 	bx	lr
   118f8:	e5950058 	ldr	r0, [r5, #88]	; 0x58
   118fc:	eb00043d 	bl	129f8 <__retarget_lock_acquire_recursive>
   11900:	eaffffe8 	b	118a8 <_fflush_r+0x40>

00011904 <fflush>:
   11904:	e2501000 	subs	r1, r0, #0
   11908:	159f3020 	ldrne	r3, [pc, #32]	; 11930 <fflush+0x2c>
   1190c:	15930000 	ldrne	r0, [r3]
   11910:	1affffd4 	bne	11868 <_fflush_r>
   11914:	e92d4010 	push	{r4, lr}
   11918:	e59f3014 	ldr	r3, [pc, #20]	; 11934 <fflush+0x30>
   1191c:	e59f1014 	ldr	r1, [pc, #20]	; 11938 <fflush+0x34>
   11920:	e5930000 	ldr	r0, [r3]
   11924:	eb0003d5 	bl	12880 <_fwalk_reent>
   11928:	e8bd4010 	pop	{r4, lr}
   1192c:	e12fff1e 	bx	lr
   11930:	00015210 	.word	0x00015210
   11934:	00015020 	.word	0x00015020
   11938:	00011868 	.word	0x00011868

0001193c <_cleanup_r>:
   1193c:	e92d4010 	push	{r4, lr}
   11940:	e59f1008 	ldr	r1, [pc, #8]	; 11950 <_cleanup_r+0x14>
   11944:	eb0003cd 	bl	12880 <_fwalk_reent>
   11948:	e8bd4010 	pop	{r4, lr}
   1194c:	e12fff1e 	bx	lr
   11950:	0001410c 	.word	0x0001410c

00011954 <std.isra.0>:
   11954:	e3a03000 	mov	r3, #0
   11958:	e92d4010 	push	{r4, lr}
   1195c:	e1a04000 	mov	r4, r0
   11960:	e1c010bc 	strh	r1, [r0, #12]
   11964:	e1c020be 	strh	r2, [r0, #14]
   11968:	e5803000 	str	r3, [r0]
   1196c:	e5803004 	str	r3, [r0, #4]
   11970:	e5803008 	str	r3, [r0, #8]
   11974:	e5803064 	str	r3, [r0, #100]	; 0x64
   11978:	e5803010 	str	r3, [r0, #16]
   1197c:	e5803014 	str	r3, [r0, #20]
   11980:	e5803018 	str	r3, [r0, #24]
   11984:	e1a01003 	mov	r1, r3
   11988:	e3a02008 	mov	r2, #8
   1198c:	e280005c 	add	r0, r0, #92	; 0x5c
   11990:	ebfff86f 	bl	fb54 <memset>
   11994:	e59f002c 	ldr	r0, [pc, #44]	; 119c8 <std.isra.0+0x74>
   11998:	e59f102c 	ldr	r1, [pc, #44]	; 119cc <std.isra.0+0x78>
   1199c:	e59f202c 	ldr	r2, [pc, #44]	; 119d0 <std.isra.0+0x7c>
   119a0:	e59f302c 	ldr	r3, [pc, #44]	; 119d4 <std.isra.0+0x80>
   119a4:	e5840020 	str	r0, [r4, #32]
   119a8:	e584401c 	str	r4, [r4, #28]
   119ac:	e5841024 	str	r1, [r4, #36]	; 0x24
   119b0:	e5842028 	str	r2, [r4, #40]	; 0x28
   119b4:	e584302c 	str	r3, [r4, #44]	; 0x2c
   119b8:	e2840058 	add	r0, r4, #88	; 0x58
   119bc:	eb000409 	bl	129e8 <__retarget_lock_init_recursive>
   119c0:	e8bd4010 	pop	{r4, lr}
   119c4:	e12fff1e 	bx	lr
   119c8:	00013cdc 	.word	0x00013cdc
   119cc:	00013d18 	.word	0x00013d18
   119d0:	00013d70 	.word	0x00013d70
   119d4:	00013da0 	.word	0x00013da0

000119d8 <__fp_lock>:
   119d8:	e5903064 	ldr	r3, [r0, #100]	; 0x64
   119dc:	e3130001 	tst	r3, #1
   119e0:	1a000002 	bne	119f0 <__fp_lock+0x18>
   119e4:	e1d030bc 	ldrh	r3, [r0, #12]
   119e8:	e3130c02 	tst	r3, #512	; 0x200
   119ec:	0a000001 	beq	119f8 <__fp_lock+0x20>
   119f0:	e3a00000 	mov	r0, #0
   119f4:	e12fff1e 	bx	lr
   119f8:	e92d4010 	push	{r4, lr}
   119fc:	e5900058 	ldr	r0, [r0, #88]	; 0x58
   11a00:	eb0003fc 	bl	129f8 <__retarget_lock_acquire_recursive>
   11a04:	e3a00000 	mov	r0, #0
   11a08:	e8bd4010 	pop	{r4, lr}
   11a0c:	e12fff1e 	bx	lr

00011a10 <__fp_unlock>:
   11a10:	e5903064 	ldr	r3, [r0, #100]	; 0x64
   11a14:	e3130001 	tst	r3, #1
   11a18:	1a000002 	bne	11a28 <__fp_unlock+0x18>
   11a1c:	e1d030bc 	ldrh	r3, [r0, #12]
   11a20:	e3130c02 	tst	r3, #512	; 0x200
   11a24:	0a000001 	beq	11a30 <__fp_unlock+0x20>
   11a28:	e3a00000 	mov	r0, #0
   11a2c:	e12fff1e 	bx	lr
   11a30:	e92d4010 	push	{r4, lr}
   11a34:	e5900058 	ldr	r0, [r0, #88]	; 0x58
   11a38:	eb0003f4 	bl	12a10 <__retarget_lock_release_recursive>
   11a3c:	e3a00000 	mov	r0, #0
   11a40:	e8bd4010 	pop	{r4, lr}
   11a44:	e12fff1e 	bx	lr

00011a48 <__sfmoreglue>:
   11a48:	e2412001 	sub	r2, r1, #1
   11a4c:	e92d4070 	push	{r4, r5, r6, lr}
   11a50:	e0824082 	add	r4, r2, r2, lsl #1
   11a54:	e0822104 	add	r2, r2, r4, lsl #2
   11a58:	e1a04182 	lsl	r4, r2, #3
   11a5c:	e1a06001 	mov	r6, r1
   11a60:	e2841074 	add	r1, r4, #116	; 0x74
   11a64:	eb000452 	bl	12bb4 <_malloc_r>
   11a68:	e2505000 	subs	r5, r0, #0
   11a6c:	0a000006 	beq	11a8c <__sfmoreglue+0x44>
   11a70:	e3a01000 	mov	r1, #0
   11a74:	e285000c 	add	r0, r5, #12
   11a78:	e5856004 	str	r6, [r5, #4]
   11a7c:	e2842068 	add	r2, r4, #104	; 0x68
   11a80:	e5851000 	str	r1, [r5]
   11a84:	e5850008 	str	r0, [r5, #8]
   11a88:	ebfff831 	bl	fb54 <memset>
   11a8c:	e1a00005 	mov	r0, r5
   11a90:	e8bd4070 	pop	{r4, r5, r6, lr}
   11a94:	e12fff1e 	bx	lr

00011a98 <_cleanup>:
   11a98:	e92d4010 	push	{r4, lr}
   11a9c:	e59f3010 	ldr	r3, [pc, #16]	; 11ab4 <_cleanup+0x1c>
   11aa0:	e59f1010 	ldr	r1, [pc, #16]	; 11ab8 <_cleanup+0x20>
   11aa4:	e5930000 	ldr	r0, [r3]
   11aa8:	eb000374 	bl	12880 <_fwalk_reent>
   11aac:	e8bd4010 	pop	{r4, lr}
   11ab0:	e12fff1e 	bx	lr
   11ab4:	00015020 	.word	0x00015020
   11ab8:	0001410c 	.word	0x0001410c

00011abc <__sinit>:
   11abc:	e92d4010 	push	{r4, lr}
   11ac0:	e1a04000 	mov	r4, r0
   11ac4:	e59f007c 	ldr	r0, [pc, #124]	; 11b48 <__sinit+0x8c>
   11ac8:	eb0003ca 	bl	129f8 <__retarget_lock_acquire_recursive>
   11acc:	e5942038 	ldr	r2, [r4, #56]	; 0x38
   11ad0:	e3520000 	cmp	r2, #0
   11ad4:	1a000017 	bne	11b38 <__sinit+0x7c>
   11ad8:	e3a00003 	mov	r0, #3
   11adc:	e59f1068 	ldr	r1, [pc, #104]	; 11b4c <__sinit+0x90>
   11ae0:	e2843fbb 	add	r3, r4, #748	; 0x2ec
   11ae4:	e58432e8 	str	r3, [r4, #744]	; 0x2e8
   11ae8:	e58422e0 	str	r2, [r4, #736]	; 0x2e0
   11aec:	e58402e4 	str	r0, [r4, #740]	; 0x2e4
   11af0:	e584103c 	str	r1, [r4, #60]	; 0x3c
   11af4:	e5940004 	ldr	r0, [r4, #4]
   11af8:	e3a01004 	mov	r1, #4
   11afc:	ebffff94 	bl	11954 <std.isra.0>
   11b00:	e5940008 	ldr	r0, [r4, #8]
   11b04:	e3a02001 	mov	r2, #1
   11b08:	e3a01009 	mov	r1, #9
   11b0c:	ebffff90 	bl	11954 <std.isra.0>
   11b10:	e594000c 	ldr	r0, [r4, #12]
   11b14:	e3a02002 	mov	r2, #2
   11b18:	e3a01012 	mov	r1, #18
   11b1c:	ebffff8c 	bl	11954 <std.isra.0>
   11b20:	e3a03001 	mov	r3, #1
   11b24:	e59f001c 	ldr	r0, [pc, #28]	; 11b48 <__sinit+0x8c>
   11b28:	e5843038 	str	r3, [r4, #56]	; 0x38
   11b2c:	eb0003b7 	bl	12a10 <__retarget_lock_release_recursive>
   11b30:	e8bd4010 	pop	{r4, lr}
   11b34:	e12fff1e 	bx	lr
   11b38:	e59f0008 	ldr	r0, [pc, #8]	; 11b48 <__sinit+0x8c>
   11b3c:	eb0003b3 	bl	12a10 <__retarget_lock_release_recursive>
   11b40:	e8bd4010 	pop	{r4, lr}
   11b44:	e12fff1e 	bx	lr
   11b48:	00015ec8 	.word	0x00015ec8
   11b4c:	0001193c 	.word	0x0001193c

00011b50 <__sfp>:
   11b50:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   11b54:	e1a06000 	mov	r6, r0
   11b58:	e59f0108 	ldr	r0, [pc, #264]	; 11c68 <__sfp+0x118>
   11b5c:	eb0003a5 	bl	129f8 <__retarget_lock_acquire_recursive>
   11b60:	e59f3104 	ldr	r3, [pc, #260]	; 11c6c <__sfp+0x11c>
   11b64:	e5935000 	ldr	r5, [r3]
   11b68:	e5953038 	ldr	r3, [r5, #56]	; 0x38
   11b6c:	e3530000 	cmp	r3, #0
   11b70:	0a00002d 	beq	11c2c <__sfp+0xdc>
   11b74:	e3a07004 	mov	r7, #4
   11b78:	e2855e2e 	add	r5, r5, #736	; 0x2e0
   11b7c:	e5953004 	ldr	r3, [r5, #4]
   11b80:	e2533001 	subs	r3, r3, #1
   11b84:	e5954008 	ldr	r4, [r5, #8]
   11b88:	5a000004 	bpl	11ba0 <__sfp+0x50>
   11b8c:	ea000021 	b	11c18 <__sfp+0xc8>
   11b90:	e2433001 	sub	r3, r3, #1
   11b94:	e3730001 	cmn	r3, #1
   11b98:	e2844068 	add	r4, r4, #104	; 0x68
   11b9c:	0a00001d 	beq	11c18 <__sfp+0xc8>
   11ba0:	e1d420fc 	ldrsh	r2, [r4, #12]
   11ba4:	e3520000 	cmp	r2, #0
   11ba8:	1afffff8 	bne	11b90 <__sfp+0x40>
   11bac:	e3a05000 	mov	r5, #0
   11bb0:	e3e02000 	mvn	r2, #0
   11bb4:	e3a03001 	mov	r3, #1
   11bb8:	e1c420be 	strh	r2, [r4, #14]
   11bbc:	e1c430bc 	strh	r3, [r4, #12]
   11bc0:	e2840058 	add	r0, r4, #88	; 0x58
   11bc4:	e5845064 	str	r5, [r4, #100]	; 0x64
   11bc8:	eb000386 	bl	129e8 <__retarget_lock_init_recursive>
   11bcc:	e59f0094 	ldr	r0, [pc, #148]	; 11c68 <__sfp+0x118>
   11bd0:	eb00038e 	bl	12a10 <__retarget_lock_release_recursive>
   11bd4:	e5845000 	str	r5, [r4]
   11bd8:	e5845008 	str	r5, [r4, #8]
   11bdc:	e5845004 	str	r5, [r4, #4]
   11be0:	e5845010 	str	r5, [r4, #16]
   11be4:	e5845014 	str	r5, [r4, #20]
   11be8:	e5845018 	str	r5, [r4, #24]
   11bec:	e1a01005 	mov	r1, r5
   11bf0:	e3a02008 	mov	r2, #8
   11bf4:	e284005c 	add	r0, r4, #92	; 0x5c
   11bf8:	ebfff7d5 	bl	fb54 <memset>
   11bfc:	e5845030 	str	r5, [r4, #48]	; 0x30
   11c00:	e5845034 	str	r5, [r4, #52]	; 0x34
   11c04:	e5845044 	str	r5, [r4, #68]	; 0x44
   11c08:	e5845048 	str	r5, [r4, #72]	; 0x48
   11c0c:	e1a00004 	mov	r0, r4
   11c10:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11c14:	e12fff1e 	bx	lr
   11c18:	e5954000 	ldr	r4, [r5]
   11c1c:	e3540000 	cmp	r4, #0
   11c20:	0a000004 	beq	11c38 <__sfp+0xe8>
   11c24:	e1a05004 	mov	r5, r4
   11c28:	eaffffd3 	b	11b7c <__sfp+0x2c>
   11c2c:	e1a00005 	mov	r0, r5
   11c30:	ebffffa1 	bl	11abc <__sinit>
   11c34:	eaffffce 	b	11b74 <__sfp+0x24>
   11c38:	e1a01007 	mov	r1, r7
   11c3c:	e1a00006 	mov	r0, r6
   11c40:	ebffff80 	bl	11a48 <__sfmoreglue>
   11c44:	e3500000 	cmp	r0, #0
   11c48:	e1a04000 	mov	r4, r0
   11c4c:	e5850000 	str	r0, [r5]
   11c50:	1afffff3 	bne	11c24 <__sfp+0xd4>
   11c54:	e59f000c 	ldr	r0, [pc, #12]	; 11c68 <__sfp+0x118>
   11c58:	eb00036c 	bl	12a10 <__retarget_lock_release_recursive>
   11c5c:	e3a0300c 	mov	r3, #12
   11c60:	e5863000 	str	r3, [r6]
   11c64:	eaffffe8 	b	11c0c <__sfp+0xbc>
   11c68:	00015edc 	.word	0x00015edc
   11c6c:	00015020 	.word	0x00015020

00011c70 <__sfp_lock_acquire>:
   11c70:	e92d4010 	push	{r4, lr}
   11c74:	e59f0008 	ldr	r0, [pc, #8]	; 11c84 <__sfp_lock_acquire+0x14>
   11c78:	eb00035e 	bl	129f8 <__retarget_lock_acquire_recursive>
   11c7c:	e8bd4010 	pop	{r4, lr}
   11c80:	e12fff1e 	bx	lr
   11c84:	00015edc 	.word	0x00015edc

00011c88 <__sfp_lock_release>:
   11c88:	e92d4010 	push	{r4, lr}
   11c8c:	e59f0008 	ldr	r0, [pc, #8]	; 11c9c <__sfp_lock_release+0x14>
   11c90:	eb00035e 	bl	12a10 <__retarget_lock_release_recursive>
   11c94:	e8bd4010 	pop	{r4, lr}
   11c98:	e12fff1e 	bx	lr
   11c9c:	00015edc 	.word	0x00015edc

00011ca0 <__sinit_lock_acquire>:
   11ca0:	e92d4010 	push	{r4, lr}
   11ca4:	e59f0008 	ldr	r0, [pc, #8]	; 11cb4 <__sinit_lock_acquire+0x14>
   11ca8:	eb000352 	bl	129f8 <__retarget_lock_acquire_recursive>
   11cac:	e8bd4010 	pop	{r4, lr}
   11cb0:	e12fff1e 	bx	lr
   11cb4:	00015ec8 	.word	0x00015ec8

00011cb8 <__sinit_lock_release>:
   11cb8:	e92d4010 	push	{r4, lr}
   11cbc:	e59f0008 	ldr	r0, [pc, #8]	; 11ccc <__sinit_lock_release+0x14>
   11cc0:	eb000352 	bl	12a10 <__retarget_lock_release_recursive>
   11cc4:	e8bd4010 	pop	{r4, lr}
   11cc8:	e12fff1e 	bx	lr
   11ccc:	00015ec8 	.word	0x00015ec8

00011cd0 <__fp_lock_all>:
   11cd0:	e92d4010 	push	{r4, lr}
   11cd4:	e59f0018 	ldr	r0, [pc, #24]	; 11cf4 <__fp_lock_all+0x24>
   11cd8:	eb000346 	bl	129f8 <__retarget_lock_acquire_recursive>
   11cdc:	e59f3014 	ldr	r3, [pc, #20]	; 11cf8 <__fp_lock_all+0x28>
   11ce0:	e59f1014 	ldr	r1, [pc, #20]	; 11cfc <__fp_lock_all+0x2c>
   11ce4:	e5930000 	ldr	r0, [r3]
   11ce8:	eb0002c3 	bl	127fc <_fwalk>
   11cec:	e8bd4010 	pop	{r4, lr}
   11cf0:	e12fff1e 	bx	lr
   11cf4:	00015edc 	.word	0x00015edc
   11cf8:	00015210 	.word	0x00015210
   11cfc:	000119d8 	.word	0x000119d8

00011d00 <__fp_unlock_all>:
   11d00:	e92d4010 	push	{r4, lr}
   11d04:	e59f3018 	ldr	r3, [pc, #24]	; 11d24 <__fp_unlock_all+0x24>
   11d08:	e59f1018 	ldr	r1, [pc, #24]	; 11d28 <__fp_unlock_all+0x28>
   11d0c:	e5930000 	ldr	r0, [r3]
   11d10:	eb0002b9 	bl	127fc <_fwalk>
   11d14:	e59f0010 	ldr	r0, [pc, #16]	; 11d2c <__fp_unlock_all+0x2c>
   11d18:	eb00033c 	bl	12a10 <__retarget_lock_release_recursive>
   11d1c:	e8bd4010 	pop	{r4, lr}
   11d20:	e12fff1e 	bx	lr
   11d24:	00015210 	.word	0x00015210
   11d28:	00011a10 	.word	0x00011a10
   11d2c:	00015edc 	.word	0x00015edc

00011d30 <__fputwc>:
   11d30:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
   11d34:	e24dd00c 	sub	sp, sp, #12
   11d38:	e1a08000 	mov	r8, r0
   11d3c:	e1a07001 	mov	r7, r1
   11d40:	e1a04002 	mov	r4, r2
   11d44:	eb00030a 	bl	12974 <__locale_mb_cur_max>
   11d48:	e3500001 	cmp	r0, #1
   11d4c:	0a000030 	beq	11e14 <__fputwc+0xe4>
   11d50:	e284305c 	add	r3, r4, #92	; 0x5c
   11d54:	e1a02007 	mov	r2, r7
   11d58:	e28d1004 	add	r1, sp, #4
   11d5c:	e1a00008 	mov	r0, r8
   11d60:	eb000866 	bl	13f00 <_wcrtomb_r>
   11d64:	e3700001 	cmn	r0, #1
   11d68:	e1a06000 	mov	r6, r0
   11d6c:	0a000022 	beq	11dfc <__fputwc+0xcc>
   11d70:	e3500000 	cmp	r0, #0
   11d74:	15dd1004 	ldrbne	r1, [sp, #4]
   11d78:	0a00002c 	beq	11e30 <__fputwc+0x100>
   11d7c:	e3a05000 	mov	r5, #0
   11d80:	e28d9004 	add	r9, sp, #4
   11d84:	ea000007 	b	11da8 <__fputwc+0x78>
   11d88:	e5943000 	ldr	r3, [r4]
   11d8c:	e2832001 	add	r2, r3, #1
   11d90:	e5842000 	str	r2, [r4]
   11d94:	e5c31000 	strb	r1, [r3]
   11d98:	e2855001 	add	r5, r5, #1
   11d9c:	e1560005 	cmp	r6, r5
   11da0:	9a000022 	bls	11e30 <__fputwc+0x100>
   11da4:	e7d51009 	ldrb	r1, [r5, r9]
   11da8:	e5943008 	ldr	r3, [r4, #8]
   11dac:	e2433001 	sub	r3, r3, #1
   11db0:	e3530000 	cmp	r3, #0
   11db4:	e5843008 	str	r3, [r4, #8]
   11db8:	aafffff2 	bge	11d88 <__fputwc+0x58>
   11dbc:	e5942018 	ldr	r2, [r4, #24]
   11dc0:	e1530002 	cmp	r3, r2
   11dc4:	b3a03000 	movlt	r3, #0
   11dc8:	a3a03001 	movge	r3, #1
   11dcc:	e351000a 	cmp	r1, #10
   11dd0:	03a03000 	moveq	r3, #0
   11dd4:	e3530000 	cmp	r3, #0
   11dd8:	1affffea 	bne	11d88 <__fputwc+0x58>
   11ddc:	e1a02004 	mov	r2, r4
   11de0:	e1a00008 	mov	r0, r8
   11de4:	eb0007f2 	bl	13db4 <__swbuf_r>
   11de8:	e3700001 	cmn	r0, #1
   11dec:	1affffe9 	bne	11d98 <__fputwc+0x68>
   11df0:	e28dd00c 	add	sp, sp, #12
   11df4:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
   11df8:	e12fff1e 	bx	lr
   11dfc:	e1d430bc 	ldrh	r3, [r4, #12]
   11e00:	e3833040 	orr	r3, r3, #64	; 0x40
   11e04:	e1c430bc 	strh	r3, [r4, #12]
   11e08:	e28dd00c 	add	sp, sp, #12
   11e0c:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
   11e10:	e12fff1e 	bx	lr
   11e14:	e2473001 	sub	r3, r7, #1
   11e18:	e35300fe 	cmp	r3, #254	; 0xfe
   11e1c:	8affffcb 	bhi	11d50 <__fputwc+0x20>
   11e20:	e20710ff 	and	r1, r7, #255	; 0xff
   11e24:	e1a06000 	mov	r6, r0
   11e28:	e5cd1004 	strb	r1, [sp, #4]
   11e2c:	eaffffd2 	b	11d7c <__fputwc+0x4c>
   11e30:	e1a00007 	mov	r0, r7
   11e34:	e28dd00c 	add	sp, sp, #12
   11e38:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
   11e3c:	e12fff1e 	bx	lr

00011e40 <_fputwc_r>:
   11e40:	e92d4030 	push	{r4, r5, lr}
   11e44:	e5923064 	ldr	r3, [r2, #100]	; 0x64
   11e48:	e1a04002 	mov	r4, r2
   11e4c:	e1d220fc 	ldrsh	r2, [r2, #12]
   11e50:	e3130001 	tst	r3, #1
   11e54:	e1a03802 	lsl	r3, r2, #16
   11e58:	e24dd00c 	sub	sp, sp, #12
   11e5c:	e1a05000 	mov	r5, r0
   11e60:	11a03823 	lsrne	r3, r3, #16
   11e64:	1a000002 	bne	11e74 <_fputwc_r+0x34>
   11e68:	e3130402 	tst	r3, #33554432	; 0x2000000
   11e6c:	e1a03823 	lsr	r3, r3, #16
   11e70:	0a000019 	beq	11edc <_fputwc_r+0x9c>
   11e74:	e3130a02 	tst	r3, #8192	; 0x2000
   11e78:	05943064 	ldreq	r3, [r4, #100]	; 0x64
   11e7c:	03822a02 	orreq	r2, r2, #8192	; 0x2000
   11e80:	03833a02 	orreq	r3, r3, #8192	; 0x2000
   11e84:	01c420bc 	strheq	r2, [r4, #12]
   11e88:	05843064 	streq	r3, [r4, #100]	; 0x64
   11e8c:	e1a00005 	mov	r0, r5
   11e90:	e1a02004 	mov	r2, r4
   11e94:	ebffffa5 	bl	11d30 <__fputwc>
   11e98:	e5943064 	ldr	r3, [r4, #100]	; 0x64
   11e9c:	e3130001 	tst	r3, #1
   11ea0:	e1a05000 	mov	r5, r0
   11ea4:	1a000002 	bne	11eb4 <_fputwc_r+0x74>
   11ea8:	e1d430bc 	ldrh	r3, [r4, #12]
   11eac:	e3130c02 	tst	r3, #512	; 0x200
   11eb0:	0a000003 	beq	11ec4 <_fputwc_r+0x84>
   11eb4:	e1a00005 	mov	r0, r5
   11eb8:	e28dd00c 	add	sp, sp, #12
   11ebc:	e8bd4030 	pop	{r4, r5, lr}
   11ec0:	e12fff1e 	bx	lr
   11ec4:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   11ec8:	eb0002d0 	bl	12a10 <__retarget_lock_release_recursive>
   11ecc:	e1a00005 	mov	r0, r5
   11ed0:	e28dd00c 	add	sp, sp, #12
   11ed4:	e8bd4030 	pop	{r4, r5, lr}
   11ed8:	e12fff1e 	bx	lr
   11edc:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   11ee0:	e58d1004 	str	r1, [sp, #4]
   11ee4:	eb0002c3 	bl	129f8 <__retarget_lock_acquire_recursive>
   11ee8:	e1d420fc 	ldrsh	r2, [r4, #12]
   11eec:	e1a03802 	lsl	r3, r2, #16
   11ef0:	e1a03823 	lsr	r3, r3, #16
   11ef4:	e59d1004 	ldr	r1, [sp, #4]
   11ef8:	eaffffdd 	b	11e74 <_fputwc_r+0x34>

00011efc <fputwc>:
   11efc:	e59f3038 	ldr	r3, [pc, #56]	; 11f3c <fputwc+0x40>
   11f00:	e92d4070 	push	{r4, r5, r6, lr}
   11f04:	e5934000 	ldr	r4, [r3]
   11f08:	e3540000 	cmp	r4, #0
   11f0c:	e1a05000 	mov	r5, r0
   11f10:	e1a06001 	mov	r6, r1
   11f14:	0a000003 	beq	11f28 <fputwc+0x2c>
   11f18:	e5943038 	ldr	r3, [r4, #56]	; 0x38
   11f1c:	e3530000 	cmp	r3, #0
   11f20:	01a00004 	moveq	r0, r4
   11f24:	0bfffee4 	bleq	11abc <__sinit>
   11f28:	e1a02006 	mov	r2, r6
   11f2c:	e1a01005 	mov	r1, r5
   11f30:	e1a00004 	mov	r0, r4
   11f34:	e8bd4070 	pop	{r4, r5, r6, lr}
   11f38:	eaffffc0 	b	11e40 <_fputwc_r>
   11f3c:	00015210 	.word	0x00015210

00011f40 <_malloc_trim_r>:
   11f40:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   11f44:	e1a04001 	mov	r4, r1
   11f48:	e59f70e4 	ldr	r7, [pc, #228]	; 12034 <_malloc_trim_r+0xf4>
   11f4c:	e1a06000 	mov	r6, r0
   11f50:	eb00055e 	bl	134d0 <__malloc_lock>
   11f54:	e5973008 	ldr	r3, [r7, #8]
   11f58:	e5935004 	ldr	r5, [r3, #4]
   11f5c:	e2641efe 	rsb	r1, r4, #4064	; 0xfe0
   11f60:	e281100f 	add	r1, r1, #15
   11f64:	e3c55003 	bic	r5, r5, #3
   11f68:	e0814005 	add	r4, r1, r5
   11f6c:	e1a04624 	lsr	r4, r4, #12
   11f70:	e2444001 	sub	r4, r4, #1
   11f74:	e1a04604 	lsl	r4, r4, #12
   11f78:	e3540a01 	cmp	r4, #4096	; 0x1000
   11f7c:	ba000006 	blt	11f9c <_malloc_trim_r+0x5c>
   11f80:	e3a01000 	mov	r1, #0
   11f84:	e1a00006 	mov	r0, r6
   11f88:	eb000691 	bl	139d4 <_sbrk_r>
   11f8c:	e5973008 	ldr	r3, [r7, #8]
   11f90:	e0833005 	add	r3, r3, r5
   11f94:	e1500003 	cmp	r0, r3
   11f98:	0a000004 	beq	11fb0 <_malloc_trim_r+0x70>
   11f9c:	e1a00006 	mov	r0, r6
   11fa0:	eb000550 	bl	134e8 <__malloc_unlock>
   11fa4:	e3a00000 	mov	r0, #0
   11fa8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11fac:	e12fff1e 	bx	lr
   11fb0:	e2641000 	rsb	r1, r4, #0
   11fb4:	e1a00006 	mov	r0, r6
   11fb8:	eb000685 	bl	139d4 <_sbrk_r>
   11fbc:	e3700001 	cmn	r0, #1
   11fc0:	0a00000c 	beq	11ff8 <_malloc_trim_r+0xb8>
   11fc4:	e59f206c 	ldr	r2, [pc, #108]	; 12038 <_malloc_trim_r+0xf8>
   11fc8:	e5971008 	ldr	r1, [r7, #8]
   11fcc:	e5923000 	ldr	r3, [r2]
   11fd0:	e0455004 	sub	r5, r5, r4
   11fd4:	e3855001 	orr	r5, r5, #1
   11fd8:	e1a00006 	mov	r0, r6
   11fdc:	e0434004 	sub	r4, r3, r4
   11fe0:	e5815004 	str	r5, [r1, #4]
   11fe4:	e5824000 	str	r4, [r2]
   11fe8:	eb00053e 	bl	134e8 <__malloc_unlock>
   11fec:	e3a00001 	mov	r0, #1
   11ff0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11ff4:	e12fff1e 	bx	lr
   11ff8:	e3a01000 	mov	r1, #0
   11ffc:	e1a00006 	mov	r0, r6
   12000:	eb000673 	bl	139d4 <_sbrk_r>
   12004:	e5972008 	ldr	r2, [r7, #8]
   12008:	e0403002 	sub	r3, r0, r2
   1200c:	e353000f 	cmp	r3, #15
   12010:	daffffe1 	ble	11f9c <_malloc_trim_r+0x5c>
   12014:	e59f1020 	ldr	r1, [pc, #32]	; 1203c <_malloc_trim_r+0xfc>
   12018:	e591c000 	ldr	ip, [r1]
   1201c:	e59f1014 	ldr	r1, [pc, #20]	; 12038 <_malloc_trim_r+0xf8>
   12020:	e3833001 	orr	r3, r3, #1
   12024:	e040000c 	sub	r0, r0, ip
   12028:	e5823004 	str	r3, [r2, #4]
   1202c:	e5810000 	str	r0, [r1]
   12030:	eaffffd9 	b	11f9c <_malloc_trim_r+0x5c>
   12034:	000157ac 	.word	0x000157ac
   12038:	00015c04 	.word	0x00015c04
   1203c:	00015bb4 	.word	0x00015bb4

00012040 <_free_r>:
   12040:	e92d4070 	push	{r4, r5, r6, lr}
   12044:	e2514000 	subs	r4, r1, #0
   12048:	0a000031 	beq	12114 <_free_r+0xd4>
   1204c:	e1a05000 	mov	r5, r0
   12050:	eb00051e 	bl	134d0 <__malloc_lock>
   12054:	e5141004 	ldr	r1, [r4, #-4]
   12058:	e59fe2ac 	ldr	lr, [pc, #684]	; 1230c <_free_r+0x2cc>
   1205c:	e3c13001 	bic	r3, r1, #1
   12060:	e244c008 	sub	ip, r4, #8
   12064:	e08c0003 	add	r0, ip, r3
   12068:	e59e6008 	ldr	r6, [lr, #8]
   1206c:	e5902004 	ldr	r2, [r0, #4]
   12070:	e1500006 	cmp	r0, r6
   12074:	e3c22003 	bic	r2, r2, #3
   12078:	0a00004e 	beq	121b8 <_free_r+0x178>
   1207c:	e3110001 	tst	r1, #1
   12080:	e5802004 	str	r2, [r0, #4]
   12084:	1a000009 	bne	120b0 <_free_r+0x70>
   12088:	e5144008 	ldr	r4, [r4, #-8]
   1208c:	e04cc004 	sub	ip, ip, r4
   12090:	e59c1008 	ldr	r1, [ip, #8]
   12094:	e28e6008 	add	r6, lr, #8
   12098:	e1510006 	cmp	r1, r6
   1209c:	e0833004 	add	r3, r3, r4
   120a0:	0a00005c 	beq	12218 <_free_r+0x1d8>
   120a4:	e59c400c 	ldr	r4, [ip, #12]
   120a8:	e581400c 	str	r4, [r1, #12]
   120ac:	e5841008 	str	r1, [r4, #8]
   120b0:	e0801002 	add	r1, r0, r2
   120b4:	e5911004 	ldr	r1, [r1, #4]
   120b8:	e3110001 	tst	r1, #1
   120bc:	13832001 	orrne	r2, r3, #1
   120c0:	158c2004 	strne	r2, [ip, #4]
   120c4:	178c3003 	strne	r3, [ip, r3]
   120c8:	0a00002c 	beq	12180 <_free_r+0x140>
   120cc:	e3530c02 	cmp	r3, #512	; 0x200
   120d0:	2a000011 	bcs	1211c <_free_r+0xdc>
   120d4:	e3a04001 	mov	r4, #1
   120d8:	e59e0004 	ldr	r0, [lr, #4]
   120dc:	e1a031a3 	lsr	r3, r3, #3
   120e0:	e0832004 	add	r2, r3, r4
   120e4:	e1a03143 	asr	r3, r3, #2
   120e8:	e1803314 	orr	r3, r0, r4, lsl r3
   120ec:	e08e1182 	add	r1, lr, r2, lsl #3
   120f0:	e79e0182 	ldr	r0, [lr, r2, lsl #3]
   120f4:	e2411008 	sub	r1, r1, #8
   120f8:	e58e3004 	str	r3, [lr, #4]
   120fc:	e58c100c 	str	r1, [ip, #12]
   12100:	e58c0008 	str	r0, [ip, #8]
   12104:	e78ec182 	str	ip, [lr, r2, lsl #3]
   12108:	e580c00c 	str	ip, [r0, #12]
   1210c:	e1a00005 	mov	r0, r5
   12110:	eb0004f4 	bl	134e8 <__malloc_unlock>
   12114:	e8bd4070 	pop	{r4, r5, r6, lr}
   12118:	e12fff1e 	bx	lr
   1211c:	e1a024a3 	lsr	r2, r3, #9
   12120:	e3520004 	cmp	r2, #4
   12124:	8a000048 	bhi	1224c <_free_r+0x20c>
   12128:	e1a02323 	lsr	r2, r3, #6
   1212c:	e2824039 	add	r4, r2, #57	; 0x39
   12130:	e1a04184 	lsl	r4, r4, #3
   12134:	e2821038 	add	r1, r2, #56	; 0x38
   12138:	e08e0004 	add	r0, lr, r4
   1213c:	e79e2004 	ldr	r2, [lr, r4]
   12140:	e2400008 	sub	r0, r0, #8
   12144:	e1500002 	cmp	r0, r2
   12148:	0a000045 	beq	12264 <_free_r+0x224>
   1214c:	e5921004 	ldr	r1, [r2, #4]
   12150:	e3c11003 	bic	r1, r1, #3
   12154:	e1530001 	cmp	r3, r1
   12158:	2a00002c 	bcs	12210 <_free_r+0x1d0>
   1215c:	e5922008 	ldr	r2, [r2, #8]
   12160:	e1500002 	cmp	r0, r2
   12164:	1afffff8 	bne	1214c <_free_r+0x10c>
   12168:	e590300c 	ldr	r3, [r0, #12]
   1216c:	e58c300c 	str	r3, [ip, #12]
   12170:	e58c0008 	str	r0, [ip, #8]
   12174:	e583c008 	str	ip, [r3, #8]
   12178:	e580c00c 	str	ip, [r0, #12]
   1217c:	eaffffe2 	b	1210c <_free_r+0xcc>
   12180:	e5901008 	ldr	r1, [r0, #8]
   12184:	e59f4184 	ldr	r4, [pc, #388]	; 12310 <_free_r+0x2d0>
   12188:	e1510004 	cmp	r1, r4
   1218c:	e0833002 	add	r3, r3, r2
   12190:	0a00003a 	beq	12280 <_free_r+0x240>
   12194:	e590000c 	ldr	r0, [r0, #12]
   12198:	e3832001 	orr	r2, r3, #1
   1219c:	e3530c02 	cmp	r3, #512	; 0x200
   121a0:	e581000c 	str	r0, [r1, #12]
   121a4:	e5801008 	str	r1, [r0, #8]
   121a8:	e58c2004 	str	r2, [ip, #4]
   121ac:	e78c3003 	str	r3, [ip, r3]
   121b0:	2affffd9 	bcs	1211c <_free_r+0xdc>
   121b4:	eaffffc6 	b	120d4 <_free_r+0x94>
   121b8:	e3110001 	tst	r1, #1
   121bc:	e0833002 	add	r3, r3, r2
   121c0:	1a000006 	bne	121e0 <_free_r+0x1a0>
   121c4:	e5142008 	ldr	r2, [r4, #-8]
   121c8:	e04cc002 	sub	ip, ip, r2
   121cc:	e28c0008 	add	r0, ip, #8
   121d0:	e8900003 	ldm	r0, {r0, r1}
   121d4:	e580100c 	str	r1, [r0, #12]
   121d8:	e5810008 	str	r0, [r1, #8]
   121dc:	e0833002 	add	r3, r3, r2
   121e0:	e59f212c 	ldr	r2, [pc, #300]	; 12314 <_free_r+0x2d4>
   121e4:	e5921000 	ldr	r1, [r2]
   121e8:	e3832001 	orr	r2, r3, #1
   121ec:	e1530001 	cmp	r3, r1
   121f0:	e58c2004 	str	r2, [ip, #4]
   121f4:	e58ec008 	str	ip, [lr, #8]
   121f8:	3affffc3 	bcc	1210c <_free_r+0xcc>
   121fc:	e59f3114 	ldr	r3, [pc, #276]	; 12318 <_free_r+0x2d8>
   12200:	e1a00005 	mov	r0, r5
   12204:	e5931000 	ldr	r1, [r3]
   12208:	ebffff4c 	bl	11f40 <_malloc_trim_r>
   1220c:	eaffffbe 	b	1210c <_free_r+0xcc>
   12210:	e1a00002 	mov	r0, r2
   12214:	eaffffd3 	b	12168 <_free_r+0x128>
   12218:	e0801002 	add	r1, r0, r2
   1221c:	e5911004 	ldr	r1, [r1, #4]
   12220:	e3110001 	tst	r1, #1
   12224:	1a000034 	bne	122fc <_free_r+0x2bc>
   12228:	e2801008 	add	r1, r0, #8
   1222c:	e0823003 	add	r3, r2, r3
   12230:	e8910006 	ldm	r1, {r1, r2}
   12234:	e3830001 	orr	r0, r3, #1
   12238:	e581200c 	str	r2, [r1, #12]
   1223c:	e5821008 	str	r1, [r2, #8]
   12240:	e58c0004 	str	r0, [ip, #4]
   12244:	e78c3003 	str	r3, [ip, r3]
   12248:	eaffffaf 	b	1210c <_free_r+0xcc>
   1224c:	e3520014 	cmp	r2, #20
   12250:	8a000012 	bhi	122a0 <_free_r+0x260>
   12254:	e282405c 	add	r4, r2, #92	; 0x5c
   12258:	e1a04184 	lsl	r4, r4, #3
   1225c:	e282105b 	add	r1, r2, #91	; 0x5b
   12260:	eaffffb4 	b	12138 <_free_r+0xf8>
   12264:	e3a04001 	mov	r4, #1
   12268:	e59e3004 	ldr	r3, [lr, #4]
   1226c:	e1a02141 	asr	r2, r1, #2
   12270:	e1832214 	orr	r2, r3, r4, lsl r2
   12274:	e58e2004 	str	r2, [lr, #4]
   12278:	e1a03000 	mov	r3, r0
   1227c:	eaffffba 	b	1216c <_free_r+0x12c>
   12280:	e3832001 	orr	r2, r3, #1
   12284:	e58ec014 	str	ip, [lr, #20]
   12288:	e58ec010 	str	ip, [lr, #16]
   1228c:	e58c100c 	str	r1, [ip, #12]
   12290:	e58c1008 	str	r1, [ip, #8]
   12294:	e58c2004 	str	r2, [ip, #4]
   12298:	e78c3003 	str	r3, [ip, r3]
   1229c:	eaffff9a 	b	1210c <_free_r+0xcc>
   122a0:	e3520054 	cmp	r2, #84	; 0x54
   122a4:	8a000004 	bhi	122bc <_free_r+0x27c>
   122a8:	e1a02623 	lsr	r2, r3, #12
   122ac:	e282406f 	add	r4, r2, #111	; 0x6f
   122b0:	e1a04184 	lsl	r4, r4, #3
   122b4:	e282106e 	add	r1, r2, #110	; 0x6e
   122b8:	eaffff9e 	b	12138 <_free_r+0xf8>
   122bc:	e3520f55 	cmp	r2, #340	; 0x154
   122c0:	8a000004 	bhi	122d8 <_free_r+0x298>
   122c4:	e1a027a3 	lsr	r2, r3, #15
   122c8:	e2824078 	add	r4, r2, #120	; 0x78
   122cc:	e1a04184 	lsl	r4, r4, #3
   122d0:	e2821077 	add	r1, r2, #119	; 0x77
   122d4:	eaffff97 	b	12138 <_free_r+0xf8>
   122d8:	e59f103c 	ldr	r1, [pc, #60]	; 1231c <_free_r+0x2dc>
   122dc:	e1520001 	cmp	r2, r1
   122e0:	91a02923 	lsrls	r2, r3, #18
   122e4:	9282407d 	addls	r4, r2, #125	; 0x7d
   122e8:	91a04184 	lslls	r4, r4, #3
   122ec:	9282107c 	addls	r1, r2, #124	; 0x7c
   122f0:	83a04ffe 	movhi	r4, #1016	; 0x3f8
   122f4:	83a0107e 	movhi	r1, #126	; 0x7e
   122f8:	eaffff8e 	b	12138 <_free_r+0xf8>
   122fc:	e3832001 	orr	r2, r3, #1
   12300:	e58c2004 	str	r2, [ip, #4]
   12304:	e5803000 	str	r3, [r0]
   12308:	eaffff7f 	b	1210c <_free_r+0xcc>
   1230c:	000157ac 	.word	0x000157ac
   12310:	000157b4 	.word	0x000157b4
   12314:	00015bb8 	.word	0x00015bb8
   12318:	00015c34 	.word	0x00015c34
   1231c:	00000554 	.word	0x00000554

00012320 <__sfvwrite_r>:
   12320:	e5923008 	ldr	r3, [r2, #8]
   12324:	e3530000 	cmp	r3, #0
   12328:	0a0000cb 	beq	1265c <__sfvwrite_r+0x33c>
   1232c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12330:	e1d130fc 	ldrsh	r3, [r1, #12]
   12334:	e1a03803 	lsl	r3, r3, #16
   12338:	e3130702 	tst	r3, #524288	; 0x80000
   1233c:	e24dd00c 	sub	sp, sp, #12
   12340:	e1a04001 	mov	r4, r1
   12344:	e1a0b000 	mov	fp, r0
   12348:	e1a06002 	mov	r6, r2
   1234c:	e1a0a823 	lsr	sl, r3, #16
   12350:	0a000020 	beq	123d8 <__sfvwrite_r+0xb8>
   12354:	e5912010 	ldr	r2, [r1, #16]
   12358:	e3520000 	cmp	r2, #0
   1235c:	0a00001d 	beq	123d8 <__sfvwrite_r+0xb8>
   12360:	e21a9002 	ands	r9, sl, #2
   12364:	e5965000 	ldr	r5, [r6]
   12368:	0a000025 	beq	12404 <__sfvwrite_r+0xe4>
   1236c:	e3a08000 	mov	r8, #0
   12370:	e1a07008 	mov	r7, r8
   12374:	e59f947c 	ldr	r9, [pc, #1148]	; 127f8 <__sfvwrite_r+0x4d8>
   12378:	e3570000 	cmp	r7, #0
   1237c:	0a00004a 	beq	124ac <__sfvwrite_r+0x18c>
   12380:	e1570009 	cmp	r7, r9
   12384:	31a03007 	movcc	r3, r7
   12388:	21a03009 	movcs	r3, r9
   1238c:	e594a024 	ldr	sl, [r4, #36]	; 0x24
   12390:	e1a02008 	mov	r2, r8
   12394:	e594101c 	ldr	r1, [r4, #28]
   12398:	e1a0000b 	mov	r0, fp
   1239c:	e1a0e00f 	mov	lr, pc
   123a0:	e12fff1a 	bx	sl
   123a4:	e3500000 	cmp	r0, #0
   123a8:	da000089 	ble	125d4 <__sfvwrite_r+0x2b4>
   123ac:	e5963008 	ldr	r3, [r6, #8]
   123b0:	e0433000 	sub	r3, r3, r0
   123b4:	e3530000 	cmp	r3, #0
   123b8:	e0888000 	add	r8, r8, r0
   123bc:	e0477000 	sub	r7, r7, r0
   123c0:	e5863008 	str	r3, [r6, #8]
   123c4:	1affffeb 	bne	12378 <__sfvwrite_r+0x58>
   123c8:	e3a00000 	mov	r0, #0
   123cc:	e28dd00c 	add	sp, sp, #12
   123d0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   123d4:	e12fff1e 	bx	lr
   123d8:	e1a01004 	mov	r1, r4
   123dc:	e1a0000b 	mov	r0, fp
   123e0:	ebfffc33 	bl	114b4 <__swsetup_r>
   123e4:	e3500000 	cmp	r0, #0
   123e8:	1a0000fc 	bne	127e0 <__sfvwrite_r+0x4c0>
   123ec:	e1d430fc 	ldrsh	r3, [r4, #12]
   123f0:	e1a03803 	lsl	r3, r3, #16
   123f4:	e1a0a823 	lsr	sl, r3, #16
   123f8:	e21a9002 	ands	r9, sl, #2
   123fc:	e5965000 	ldr	r5, [r6]
   12400:	1affffd9 	bne	1236c <__sfvwrite_r+0x4c>
   12404:	e21aa001 	ands	sl, sl, #1
   12408:	01a0900a 	moveq	r9, sl
   1240c:	1a000094 	bne	12664 <__sfvwrite_r+0x344>
   12410:	e3590000 	cmp	r9, #0
   12414:	0a000020 	beq	1249c <__sfvwrite_r+0x17c>
   12418:	e3130402 	tst	r3, #33554432	; 0x2000000
   1241c:	e5947008 	ldr	r7, [r4, #8]
   12420:	e1a03823 	lsr	r3, r3, #16
   12424:	0a000024 	beq	124bc <__sfvwrite_r+0x19c>
   12428:	e1590007 	cmp	r9, r7
   1242c:	e1a08007 	mov	r8, r7
   12430:	3a000037 	bcc	12514 <__sfvwrite_r+0x1f4>
   12434:	e3130d12 	tst	r3, #1152	; 0x480
   12438:	1a00003a 	bne	12528 <__sfvwrite_r+0x208>
   1243c:	e1a03009 	mov	r3, r9
   12440:	e5940000 	ldr	r0, [r4]
   12444:	e1a02008 	mov	r2, r8
   12448:	e1a0100a 	mov	r1, sl
   1244c:	e58d3004 	str	r3, [sp, #4]
   12450:	ebfff56d 	bl	fa0c <memmove>
   12454:	e5941008 	ldr	r1, [r4, #8]
   12458:	e5942000 	ldr	r2, [r4]
   1245c:	e0417007 	sub	r7, r1, r7
   12460:	e0828008 	add	r8, r2, r8
   12464:	e5847008 	str	r7, [r4, #8]
   12468:	e5848000 	str	r8, [r4]
   1246c:	e59d3004 	ldr	r3, [sp, #4]
   12470:	e5962008 	ldr	r2, [r6, #8]
   12474:	e0422003 	sub	r2, r2, r3
   12478:	e3520000 	cmp	r2, #0
   1247c:	e08aa003 	add	sl, sl, r3
   12480:	e0499003 	sub	r9, r9, r3
   12484:	e5862008 	str	r2, [r6, #8]
   12488:	0affffce 	beq	123c8 <__sfvwrite_r+0xa8>
   1248c:	e1d430fc 	ldrsh	r3, [r4, #12]
   12490:	e3590000 	cmp	r9, #0
   12494:	e1a03803 	lsl	r3, r3, #16
   12498:	1affffde 	bne	12418 <__sfvwrite_r+0xf8>
   1249c:	e595a000 	ldr	sl, [r5]
   124a0:	e5959004 	ldr	r9, [r5, #4]
   124a4:	e2855008 	add	r5, r5, #8
   124a8:	eaffffd8 	b	12410 <__sfvwrite_r+0xf0>
   124ac:	e5958000 	ldr	r8, [r5]
   124b0:	e5957004 	ldr	r7, [r5, #4]
   124b4:	e2855008 	add	r5, r5, #8
   124b8:	eaffffae 	b	12378 <__sfvwrite_r+0x58>
   124bc:	e5940000 	ldr	r0, [r4]
   124c0:	e5943010 	ldr	r3, [r4, #16]
   124c4:	e1500003 	cmp	r0, r3
   124c8:	8a000002 	bhi	124d8 <__sfvwrite_r+0x1b8>
   124cc:	e5948014 	ldr	r8, [r4, #20]
   124d0:	e1590008 	cmp	r9, r8
   124d4:	2a000045 	bcs	125f0 <__sfvwrite_r+0x2d0>
   124d8:	e1570009 	cmp	r7, r9
   124dc:	21a07009 	movcs	r7, r9
   124e0:	e1a0100a 	mov	r1, sl
   124e4:	e1a02007 	mov	r2, r7
   124e8:	ebfff547 	bl	fa0c <memmove>
   124ec:	e5942008 	ldr	r2, [r4, #8]
   124f0:	e5943000 	ldr	r3, [r4]
   124f4:	e0422007 	sub	r2, r2, r7
   124f8:	e0833007 	add	r3, r3, r7
   124fc:	e3520000 	cmp	r2, #0
   12500:	e5842008 	str	r2, [r4, #8]
   12504:	e5843000 	str	r3, [r4]
   12508:	0a00002c 	beq	125c0 <__sfvwrite_r+0x2a0>
   1250c:	e1a03007 	mov	r3, r7
   12510:	eaffffd6 	b	12470 <__sfvwrite_r+0x150>
   12514:	e1a07009 	mov	r7, r9
   12518:	e1a03009 	mov	r3, r9
   1251c:	e1a08009 	mov	r8, r9
   12520:	e5940000 	ldr	r0, [r4]
   12524:	eaffffc6 	b	12444 <__sfvwrite_r+0x124>
   12528:	e5941010 	ldr	r1, [r4, #16]
   1252c:	e5948000 	ldr	r8, [r4]
   12530:	e5942014 	ldr	r2, [r4, #20]
   12534:	e0488001 	sub	r8, r8, r1
   12538:	e0822082 	add	r2, r2, r2, lsl #1
   1253c:	e2887001 	add	r7, r8, #1
   12540:	e0822fa2 	add	r2, r2, r2, lsr #31
   12544:	e0877009 	add	r7, r7, r9
   12548:	e1a020c2 	asr	r2, r2, #1
   1254c:	e1570002 	cmp	r7, r2
   12550:	91a07002 	movls	r7, r2
   12554:	81a02007 	movhi	r2, r7
   12558:	e3130b01 	tst	r3, #1024	; 0x400
   1255c:	0a000032 	beq	1262c <__sfvwrite_r+0x30c>
   12560:	e1a01002 	mov	r1, r2
   12564:	e1a0000b 	mov	r0, fp
   12568:	eb000191 	bl	12bb4 <_malloc_r>
   1256c:	e2503000 	subs	r3, r0, #0
   12570:	0a00009c 	beq	127e8 <__sfvwrite_r+0x4c8>
   12574:	e1a02008 	mov	r2, r8
   12578:	e5941010 	ldr	r1, [r4, #16]
   1257c:	e58d3004 	str	r3, [sp, #4]
   12580:	ebfff4dc 	bl	f8f8 <memcpy>
   12584:	e1d420bc 	ldrh	r2, [r4, #12]
   12588:	e3c22d12 	bic	r2, r2, #1152	; 0x480
   1258c:	e3822080 	orr	r2, r2, #128	; 0x80
   12590:	e1c420bc 	strh	r2, [r4, #12]
   12594:	e59d3004 	ldr	r3, [sp, #4]
   12598:	e0830008 	add	r0, r3, r8
   1259c:	e0478008 	sub	r8, r7, r8
   125a0:	e5843010 	str	r3, [r4, #16]
   125a4:	e5848008 	str	r8, [r4, #8]
   125a8:	e5847014 	str	r7, [r4, #20]
   125ac:	e5840000 	str	r0, [r4]
   125b0:	e1a07009 	mov	r7, r9
   125b4:	e1a03009 	mov	r3, r9
   125b8:	e1a08009 	mov	r8, r9
   125bc:	eaffffa0 	b	12444 <__sfvwrite_r+0x124>
   125c0:	e1a01004 	mov	r1, r4
   125c4:	e1a0000b 	mov	r0, fp
   125c8:	ebfffca6 	bl	11868 <_fflush_r>
   125cc:	e3500000 	cmp	r0, #0
   125d0:	0affffcd 	beq	1250c <__sfvwrite_r+0x1ec>
   125d4:	e1d430fc 	ldrsh	r3, [r4, #12]
   125d8:	e3e00000 	mvn	r0, #0
   125dc:	e3833040 	orr	r3, r3, #64	; 0x40
   125e0:	e1c430bc 	strh	r3, [r4, #12]
   125e4:	e28dd00c 	add	sp, sp, #12
   125e8:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   125ec:	e12fff1e 	bx	lr
   125f0:	e3790106 	cmn	r9, #-2147483647	; 0x80000001
   125f4:	31a00009 	movcc	r0, r9
   125f8:	23e00102 	mvncs	r0, #-2147483648	; 0x80000000
   125fc:	e1a01008 	mov	r1, r8
   12600:	ebfff2ac 	bl	f0b8 <__divsi3>
   12604:	e5947024 	ldr	r7, [r4, #36]	; 0x24
   12608:	e0030098 	mul	r3, r8, r0
   1260c:	e1a0200a 	mov	r2, sl
   12610:	e594101c 	ldr	r1, [r4, #28]
   12614:	e1a0000b 	mov	r0, fp
   12618:	e1a0e00f 	mov	lr, pc
   1261c:	e12fff17 	bx	r7
   12620:	e2503000 	subs	r3, r0, #0
   12624:	caffff91 	bgt	12470 <__sfvwrite_r+0x150>
   12628:	eaffffe9 	b	125d4 <__sfvwrite_r+0x2b4>
   1262c:	e1a0000b 	mov	r0, fp
   12630:	eb0003b2 	bl	13500 <_realloc_r>
   12634:	e2503000 	subs	r3, r0, #0
   12638:	1affffd6 	bne	12598 <__sfvwrite_r+0x278>
   1263c:	e5941010 	ldr	r1, [r4, #16]
   12640:	e1a0000b 	mov	r0, fp
   12644:	ebfffe7d 	bl	12040 <_free_r>
   12648:	e3a0200c 	mov	r2, #12
   1264c:	e1d430fc 	ldrsh	r3, [r4, #12]
   12650:	e58b2000 	str	r2, [fp]
   12654:	e3c33080 	bic	r3, r3, #128	; 0x80
   12658:	eaffffde 	b	125d8 <__sfvwrite_r+0x2b8>
   1265c:	e3a00000 	mov	r0, #0
   12660:	e12fff1e 	bx	lr
   12664:	e1a00009 	mov	r0, r9
   12668:	e1a0a009 	mov	sl, r9
   1266c:	e1a08009 	mov	r8, r9
   12670:	ea000026 	b	12710 <__sfvwrite_r+0x3f0>
   12674:	e3500000 	cmp	r0, #0
   12678:	0a00002d 	beq	12734 <__sfvwrite_r+0x414>
   1267c:	e1590008 	cmp	r9, r8
   12680:	31a01009 	movcc	r1, r9
   12684:	21a01008 	movcs	r1, r8
   12688:	e5942010 	ldr	r2, [r4, #16]
   1268c:	e594c014 	ldr	ip, [r4, #20]
   12690:	e5943008 	ldr	r3, [r4, #8]
   12694:	e5940000 	ldr	r0, [r4]
   12698:	e08c3003 	add	r3, ip, r3
   1269c:	e1500002 	cmp	r0, r2
   126a0:	93a02000 	movls	r2, #0
   126a4:	83a02001 	movhi	r2, #1
   126a8:	e1510003 	cmp	r1, r3
   126ac:	d3a02000 	movle	r2, #0
   126b0:	e3520000 	cmp	r2, #0
   126b4:	e1a07001 	mov	r7, r1
   126b8:	1a000038 	bne	127a0 <__sfvwrite_r+0x480>
   126bc:	e151000c 	cmp	r1, ip
   126c0:	ba000024 	blt	12758 <__sfvwrite_r+0x438>
   126c4:	e5947024 	ldr	r7, [r4, #36]	; 0x24
   126c8:	e1a0300c 	mov	r3, ip
   126cc:	e1a0200a 	mov	r2, sl
   126d0:	e594101c 	ldr	r1, [r4, #28]
   126d4:	e1a0000b 	mov	r0, fp
   126d8:	e1a0e00f 	mov	lr, pc
   126dc:	e12fff17 	bx	r7
   126e0:	e2507000 	subs	r7, r0, #0
   126e4:	daffffba 	ble	125d4 <__sfvwrite_r+0x2b4>
   126e8:	e0599007 	subs	r9, r9, r7
   126ec:	13a00001 	movne	r0, #1
   126f0:	0a000024 	beq	12788 <__sfvwrite_r+0x468>
   126f4:	e5963008 	ldr	r3, [r6, #8]
   126f8:	e0433007 	sub	r3, r3, r7
   126fc:	e3530000 	cmp	r3, #0
   12700:	e08aa007 	add	sl, sl, r7
   12704:	e0488007 	sub	r8, r8, r7
   12708:	e5863008 	str	r3, [r6, #8]
   1270c:	0affff2d 	beq	123c8 <__sfvwrite_r+0xa8>
   12710:	e3580000 	cmp	r8, #0
   12714:	1affffd6 	bne	12674 <__sfvwrite_r+0x354>
   12718:	e2853008 	add	r3, r5, #8
   1271c:	e5138004 	ldr	r8, [r3, #-4]
   12720:	e3580000 	cmp	r8, #0
   12724:	e1a05003 	mov	r5, r3
   12728:	e513a008 	ldr	sl, [r3, #-8]
   1272c:	e2833008 	add	r3, r3, #8
   12730:	0afffff9 	beq	1271c <__sfvwrite_r+0x3fc>
   12734:	e1a02008 	mov	r2, r8
   12738:	e3a0100a 	mov	r1, #10
   1273c:	e1a0000a 	mov	r0, sl
   12740:	eb00031e 	bl	133c0 <memchr>
   12744:	e3500000 	cmp	r0, #0
   12748:	12800001 	addne	r0, r0, #1
   1274c:	1040900a 	subne	r9, r0, sl
   12750:	02889001 	addeq	r9, r8, #1
   12754:	eaffffc8 	b	1267c <__sfvwrite_r+0x35c>
   12758:	e1a02001 	mov	r2, r1
   1275c:	e1a0100a 	mov	r1, sl
   12760:	ebfff4a9 	bl	fa0c <memmove>
   12764:	e5942008 	ldr	r2, [r4, #8]
   12768:	e5943000 	ldr	r3, [r4]
   1276c:	e0422007 	sub	r2, r2, r7
   12770:	e0833007 	add	r3, r3, r7
   12774:	e0599007 	subs	r9, r9, r7
   12778:	e5842008 	str	r2, [r4, #8]
   1277c:	e5843000 	str	r3, [r4]
   12780:	13a00001 	movne	r0, #1
   12784:	1affffda 	bne	126f4 <__sfvwrite_r+0x3d4>
   12788:	e1a01004 	mov	r1, r4
   1278c:	e1a0000b 	mov	r0, fp
   12790:	ebfffc34 	bl	11868 <_fflush_r>
   12794:	e3500000 	cmp	r0, #0
   12798:	0affffd5 	beq	126f4 <__sfvwrite_r+0x3d4>
   1279c:	eaffff8c 	b	125d4 <__sfvwrite_r+0x2b4>
   127a0:	e1a02003 	mov	r2, r3
   127a4:	e1a0100a 	mov	r1, sl
   127a8:	e58d3004 	str	r3, [sp, #4]
   127ac:	ebfff496 	bl	fa0c <memmove>
   127b0:	e5942000 	ldr	r2, [r4]
   127b4:	e59d3004 	ldr	r3, [sp, #4]
   127b8:	e0822003 	add	r2, r2, r3
   127bc:	e5842000 	str	r2, [r4]
   127c0:	e1a01004 	mov	r1, r4
   127c4:	e1a0000b 	mov	r0, fp
   127c8:	ebfffc26 	bl	11868 <_fflush_r>
   127cc:	e3500000 	cmp	r0, #0
   127d0:	e59d3004 	ldr	r3, [sp, #4]
   127d4:	1affff7e 	bne	125d4 <__sfvwrite_r+0x2b4>
   127d8:	e1a07003 	mov	r7, r3
   127dc:	eaffffc1 	b	126e8 <__sfvwrite_r+0x3c8>
   127e0:	e3e00000 	mvn	r0, #0
   127e4:	eafffef8 	b	123cc <__sfvwrite_r+0xac>
   127e8:	e3a0200c 	mov	r2, #12
   127ec:	e1d430fc 	ldrsh	r3, [r4, #12]
   127f0:	e58b2000 	str	r2, [fp]
   127f4:	eaffff77 	b	125d8 <__sfvwrite_r+0x2b8>
   127f8:	7ffffc00 	.word	0x7ffffc00

000127fc <_fwalk>:
   127fc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   12800:	e2907e2e 	adds	r7, r0, #736	; 0x2e0
   12804:	0a000019 	beq	12870 <_fwalk+0x74>
   12808:	e1a08001 	mov	r8, r1
   1280c:	e3a06000 	mov	r6, #0
   12810:	e5975004 	ldr	r5, [r7, #4]
   12814:	e2555001 	subs	r5, r5, #1
   12818:	e5974008 	ldr	r4, [r7, #8]
   1281c:	4a00000d 	bmi	12858 <_fwalk+0x5c>
   12820:	e1d430bc 	ldrh	r3, [r4, #12]
   12824:	e3530001 	cmp	r3, #1
   12828:	e2455001 	sub	r5, r5, #1
   1282c:	9a000006 	bls	1284c <_fwalk+0x50>
   12830:	e1d430fe 	ldrsh	r3, [r4, #14]
   12834:	e3730001 	cmn	r3, #1
   12838:	0a000003 	beq	1284c <_fwalk+0x50>
   1283c:	e1a00004 	mov	r0, r4
   12840:	e1a0e00f 	mov	lr, pc
   12844:	e12fff18 	bx	r8
   12848:	e1866000 	orr	r6, r6, r0
   1284c:	e3750001 	cmn	r5, #1
   12850:	e2844068 	add	r4, r4, #104	; 0x68
   12854:	1afffff1 	bne	12820 <_fwalk+0x24>
   12858:	e5977000 	ldr	r7, [r7]
   1285c:	e3570000 	cmp	r7, #0
   12860:	1affffea 	bne	12810 <_fwalk+0x14>
   12864:	e1a00006 	mov	r0, r6
   12868:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   1286c:	e12fff1e 	bx	lr
   12870:	e1a06007 	mov	r6, r7
   12874:	e1a00006 	mov	r0, r6
   12878:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   1287c:	e12fff1e 	bx	lr

00012880 <_fwalk_reent>:
   12880:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   12884:	e2906e2e 	adds	r6, r0, #736	; 0x2e0
   12888:	0a00001b 	beq	128fc <_fwalk_reent+0x7c>
   1288c:	e1a08001 	mov	r8, r1
   12890:	e1a07000 	mov	r7, r0
   12894:	e3a09000 	mov	r9, #0
   12898:	e5965004 	ldr	r5, [r6, #4]
   1289c:	e2555001 	subs	r5, r5, #1
   128a0:	e5964008 	ldr	r4, [r6, #8]
   128a4:	4a00000e 	bmi	128e4 <_fwalk_reent+0x64>
   128a8:	e1d430bc 	ldrh	r3, [r4, #12]
   128ac:	e3530001 	cmp	r3, #1
   128b0:	e2455001 	sub	r5, r5, #1
   128b4:	9a000007 	bls	128d8 <_fwalk_reent+0x58>
   128b8:	e1d430fe 	ldrsh	r3, [r4, #14]
   128bc:	e3730001 	cmn	r3, #1
   128c0:	0a000004 	beq	128d8 <_fwalk_reent+0x58>
   128c4:	e1a01004 	mov	r1, r4
   128c8:	e1a00007 	mov	r0, r7
   128cc:	e1a0e00f 	mov	lr, pc
   128d0:	e12fff18 	bx	r8
   128d4:	e1899000 	orr	r9, r9, r0
   128d8:	e3750001 	cmn	r5, #1
   128dc:	e2844068 	add	r4, r4, #104	; 0x68
   128e0:	1afffff0 	bne	128a8 <_fwalk_reent+0x28>
   128e4:	e5966000 	ldr	r6, [r6]
   128e8:	e3560000 	cmp	r6, #0
   128ec:	1affffe9 	bne	12898 <_fwalk_reent+0x18>
   128f0:	e1a00009 	mov	r0, r9
   128f4:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
   128f8:	e12fff1e 	bx	lr
   128fc:	e1a09006 	mov	r9, r6
   12900:	e1a00009 	mov	r0, r9
   12904:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
   12908:	e12fff1e 	bx	lr

0001290c <_setlocale_r>:
   1290c:	e92d4010 	push	{r4, lr}
   12910:	e2524000 	subs	r4, r2, #0
   12914:	0a000004 	beq	1292c <_setlocale_r+0x20>
   12918:	e59f1048 	ldr	r1, [pc, #72]	; 12968 <_setlocale_r+0x5c>
   1291c:	e1a00004 	mov	r0, r4
   12920:	ebfff4d0 	bl	fc68 <strcmp>
   12924:	e3500000 	cmp	r0, #0
   12928:	1a000002 	bne	12938 <_setlocale_r+0x2c>
   1292c:	e59f0038 	ldr	r0, [pc, #56]	; 1296c <_setlocale_r+0x60>
   12930:	e8bd4010 	pop	{r4, lr}
   12934:	e12fff1e 	bx	lr
   12938:	e59f102c 	ldr	r1, [pc, #44]	; 1296c <_setlocale_r+0x60>
   1293c:	e1a00004 	mov	r0, r4
   12940:	ebfff4c8 	bl	fc68 <strcmp>
   12944:	e3500000 	cmp	r0, #0
   12948:	0afffff7 	beq	1292c <_setlocale_r+0x20>
   1294c:	e1a00004 	mov	r0, r4
   12950:	e59f1018 	ldr	r1, [pc, #24]	; 12970 <_setlocale_r+0x64>
   12954:	ebfff4c3 	bl	fc68 <strcmp>
   12958:	e3500000 	cmp	r0, #0
   1295c:	0afffff2 	beq	1292c <_setlocale_r+0x20>
   12960:	e3a00000 	mov	r0, #0
   12964:	eafffff1 	b	12930 <_setlocale_r+0x24>
   12968:	00015078 	.word	0x00015078
   1296c:	00015074 	.word	0x00015074
   12970:	00014fec 	.word	0x00014fec

00012974 <__locale_mb_cur_max>:
   12974:	e59f3018 	ldr	r3, [pc, #24]	; 12994 <__locale_mb_cur_max+0x20>
   12978:	e5933000 	ldr	r3, [r3]
   1297c:	e5933034 	ldr	r3, [r3, #52]	; 0x34
   12980:	e59f2010 	ldr	r2, [pc, #16]	; 12998 <__locale_mb_cur_max+0x24>
   12984:	e3530000 	cmp	r3, #0
   12988:	01a03002 	moveq	r3, r2
   1298c:	e5d30128 	ldrb	r0, [r3, #296]	; 0x128
   12990:	e12fff1e 	bx	lr
   12994:	00015210 	.word	0x00015210
   12998:	00015640 	.word	0x00015640

0001299c <__locale_ctype_ptr_l>:
   1299c:	e59000ec 	ldr	r0, [r0, #236]	; 0xec
   129a0:	e12fff1e 	bx	lr

000129a4 <__locale_ctype_ptr>:
   129a4:	e59f3018 	ldr	r3, [pc, #24]	; 129c4 <__locale_ctype_ptr+0x20>
   129a8:	e5933000 	ldr	r3, [r3]
   129ac:	e5933034 	ldr	r3, [r3, #52]	; 0x34
   129b0:	e59f2010 	ldr	r2, [pc, #16]	; 129c8 <__locale_ctype_ptr+0x24>
   129b4:	e3530000 	cmp	r3, #0
   129b8:	01a03002 	moveq	r3, r2
   129bc:	e59300ec 	ldr	r0, [r3, #236]	; 0xec
   129c0:	e12fff1e 	bx	lr
   129c4:	00015210 	.word	0x00015210
   129c8:	00015640 	.word	0x00015640

000129cc <setlocale>:
   129cc:	e59f300c 	ldr	r3, [pc, #12]	; 129e0 <setlocale+0x14>
   129d0:	e1a02001 	mov	r2, r1
   129d4:	e1a01000 	mov	r1, r0
   129d8:	e5930000 	ldr	r0, [r3]
   129dc:	eaffffca 	b	1290c <_setlocale_r>
   129e0:	00015210 	.word	0x00015210

000129e4 <__retarget_lock_init>:
   129e4:	e12fff1e 	bx	lr

000129e8 <__retarget_lock_init_recursive>:
   129e8:	e12fff1e 	bx	lr

000129ec <__retarget_lock_close>:
   129ec:	e12fff1e 	bx	lr

000129f0 <__retarget_lock_close_recursive>:
   129f0:	e12fff1e 	bx	lr

000129f4 <__retarget_lock_acquire>:
   129f4:	e12fff1e 	bx	lr

000129f8 <__retarget_lock_acquire_recursive>:
   129f8:	e12fff1e 	bx	lr

000129fc <__retarget_lock_try_acquire>:
   129fc:	e3a00001 	mov	r0, #1
   12a00:	e12fff1e 	bx	lr

00012a04 <__retarget_lock_try_acquire_recursive>:
   12a04:	e3a00001 	mov	r0, #1
   12a08:	e12fff1e 	bx	lr

00012a0c <__retarget_lock_release>:
   12a0c:	e12fff1e 	bx	lr

00012a10 <__retarget_lock_release_recursive>:
   12a10:	e12fff1e 	bx	lr

00012a14 <__swhatbuf_r>:
   12a14:	e92d4070 	push	{r4, r5, r6, lr}
   12a18:	e1a04001 	mov	r4, r1
   12a1c:	e1d110fe 	ldrsh	r1, [r1, #14]
   12a20:	e3510000 	cmp	r1, #0
   12a24:	e24dd040 	sub	sp, sp, #64	; 0x40
   12a28:	e1a05002 	mov	r5, r2
   12a2c:	e1a06003 	mov	r6, r3
   12a30:	ba00000f 	blt	12a74 <__swhatbuf_r+0x60>
   12a34:	e28d2004 	add	r2, sp, #4
   12a38:	eb000610 	bl	14280 <_fstat_r>
   12a3c:	e3500000 	cmp	r0, #0
   12a40:	ba00000b 	blt	12a74 <__swhatbuf_r+0x60>
   12a44:	e59d2008 	ldr	r2, [sp, #8]
   12a48:	e2022a0f 	and	r2, r2, #61440	; 0xf000
   12a4c:	e2423a02 	sub	r3, r2, #8192	; 0x2000
   12a50:	e2732000 	rsbs	r2, r3, #0
   12a54:	e0a22003 	adc	r2, r2, r3
   12a58:	e3a00b02 	mov	r0, #2048	; 0x800
   12a5c:	e3a03b01 	mov	r3, #1024	; 0x400
   12a60:	e5862000 	str	r2, [r6]
   12a64:	e5853000 	str	r3, [r5]
   12a68:	e28dd040 	add	sp, sp, #64	; 0x40
   12a6c:	e8bd4070 	pop	{r4, r5, r6, lr}
   12a70:	e12fff1e 	bx	lr
   12a74:	e3a03000 	mov	r3, #0
   12a78:	e1d420bc 	ldrh	r2, [r4, #12]
   12a7c:	e2120080 	ands	r0, r2, #128	; 0x80
   12a80:	e5863000 	str	r3, [r6]
   12a84:	0a000005 	beq	12aa0 <__swhatbuf_r+0x8c>
   12a88:	e3a02040 	mov	r2, #64	; 0x40
   12a8c:	e1a00003 	mov	r0, r3
   12a90:	e5852000 	str	r2, [r5]
   12a94:	e28dd040 	add	sp, sp, #64	; 0x40
   12a98:	e8bd4070 	pop	{r4, r5, r6, lr}
   12a9c:	e12fff1e 	bx	lr
   12aa0:	e3a03b01 	mov	r3, #1024	; 0x400
   12aa4:	e5853000 	str	r3, [r5]
   12aa8:	e28dd040 	add	sp, sp, #64	; 0x40
   12aac:	e8bd4070 	pop	{r4, r5, r6, lr}
   12ab0:	e12fff1e 	bx	lr

00012ab4 <__smakebuf_r>:
   12ab4:	e92d4070 	push	{r4, r5, r6, lr}
   12ab8:	e1d120bc 	ldrh	r2, [r1, #12]
   12abc:	e3120002 	tst	r2, #2
   12ac0:	e24dd008 	sub	sp, sp, #8
   12ac4:	e1a04001 	mov	r4, r1
   12ac8:	0a000007 	beq	12aec <__smakebuf_r+0x38>
   12acc:	e3a01001 	mov	r1, #1
   12ad0:	e2842043 	add	r2, r4, #67	; 0x43
   12ad4:	e5841014 	str	r1, [r4, #20]
   12ad8:	e5842000 	str	r2, [r4]
   12adc:	e5842010 	str	r2, [r4, #16]
   12ae0:	e28dd008 	add	sp, sp, #8
   12ae4:	e8bd4070 	pop	{r4, r5, r6, lr}
   12ae8:	e12fff1e 	bx	lr
   12aec:	e28d3004 	add	r3, sp, #4
   12af0:	e1a0200d 	mov	r2, sp
   12af4:	e1a06000 	mov	r6, r0
   12af8:	ebffffc5 	bl	12a14 <__swhatbuf_r>
   12afc:	e59d1000 	ldr	r1, [sp]
   12b00:	e1a05000 	mov	r5, r0
   12b04:	e1a00006 	mov	r0, r6
   12b08:	eb000029 	bl	12bb4 <_malloc_r>
   12b0c:	e3500000 	cmp	r0, #0
   12b10:	e1d430fc 	ldrsh	r3, [r4, #12]
   12b14:	0a00001a 	beq	12b84 <__smakebuf_r+0xd0>
   12b18:	e59dc004 	ldr	ip, [sp, #4]
   12b1c:	e59f108c 	ldr	r1, [pc, #140]	; 12bb0 <__smakebuf_r+0xfc>
   12b20:	e59d2000 	ldr	r2, [sp]
   12b24:	e3833080 	orr	r3, r3, #128	; 0x80
   12b28:	e35c0000 	cmp	ip, #0
   12b2c:	e586103c 	str	r1, [r6, #60]	; 0x3c
   12b30:	e1c430bc 	strh	r3, [r4, #12]
   12b34:	e5840000 	str	r0, [r4]
   12b38:	e5840010 	str	r0, [r4, #16]
   12b3c:	e5842014 	str	r2, [r4, #20]
   12b40:	1a000004 	bne	12b58 <__smakebuf_r+0xa4>
   12b44:	e1833005 	orr	r3, r3, r5
   12b48:	e1c430bc 	strh	r3, [r4, #12]
   12b4c:	e28dd008 	add	sp, sp, #8
   12b50:	e8bd4070 	pop	{r4, r5, r6, lr}
   12b54:	e12fff1e 	bx	lr
   12b58:	e1a00006 	mov	r0, r6
   12b5c:	e1d410fe 	ldrsh	r1, [r4, #14]
   12b60:	eb0005d7 	bl	142c4 <_isatty_r>
   12b64:	e3500000 	cmp	r0, #0
   12b68:	11d430bc 	ldrhne	r3, [r4, #12]
   12b6c:	13c33003 	bicne	r3, r3, #3
   12b70:	13833001 	orrne	r3, r3, #1
   12b74:	11a03803 	lslne	r3, r3, #16
   12b78:	01d430fc 	ldrsheq	r3, [r4, #12]
   12b7c:	11a03843 	asrne	r3, r3, #16
   12b80:	eaffffef 	b	12b44 <__smakebuf_r+0x90>
   12b84:	e3130c02 	tst	r3, #512	; 0x200
   12b88:	1affffd4 	bne	12ae0 <__smakebuf_r+0x2c>
   12b8c:	e3a01001 	mov	r1, #1
   12b90:	e3c33003 	bic	r3, r3, #3
   12b94:	e2842043 	add	r2, r4, #67	; 0x43
   12b98:	e3833002 	orr	r3, r3, #2
   12b9c:	e1c430bc 	strh	r3, [r4, #12]
   12ba0:	e5841014 	str	r1, [r4, #20]
   12ba4:	e5842000 	str	r2, [r4]
   12ba8:	e5842010 	str	r2, [r4, #16]
   12bac:	eaffffcb 	b	12ae0 <__smakebuf_r+0x2c>
   12bb0:	0001193c 	.word	0x0001193c

00012bb4 <_malloc_r>:
   12bb4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12bb8:	e281600b 	add	r6, r1, #11
   12bbc:	e3560016 	cmp	r6, #22
   12bc0:	e24dd00c 	sub	sp, sp, #12
   12bc4:	e1a05000 	mov	r5, r0
   12bc8:	9a000072 	bls	12d98 <_malloc_r+0x1e4>
   12bcc:	e3c66007 	bic	r6, r6, #7
   12bd0:	e1510006 	cmp	r1, r6
   12bd4:	93a01000 	movls	r1, #0
   12bd8:	83a01001 	movhi	r1, #1
   12bdc:	e1913fa6 	orrs	r3, r1, r6, lsr #31
   12be0:	1a000089 	bne	12e0c <_malloc_r+0x258>
   12be4:	eb000239 	bl	134d0 <__malloc_lock>
   12be8:	e3560f7e 	cmp	r6, #504	; 0x1f8
   12bec:	3a0001c8 	bcc	13314 <_malloc_r+0x760>
   12bf0:	e1b034a6 	lsrs	r3, r6, #9
   12bf4:	0a00008b 	beq	12e28 <_malloc_r+0x274>
   12bf8:	e3530004 	cmp	r3, #4
   12bfc:	8a0000d6 	bhi	12f5c <_malloc_r+0x3a8>
   12c00:	e1a03326 	lsr	r3, r6, #6
   12c04:	e2830039 	add	r0, r3, #57	; 0x39
   12c08:	e283c038 	add	ip, r3, #56	; 0x38
   12c0c:	e1a01180 	lsl	r1, r0, #3
   12c10:	e59f7708 	ldr	r7, [pc, #1800]	; 13320 <_malloc_r+0x76c>
   12c14:	e0871001 	add	r1, r7, r1
   12c18:	e5914004 	ldr	r4, [r1, #4]
   12c1c:	e2411008 	sub	r1, r1, #8
   12c20:	e1510004 	cmp	r1, r4
   12c24:	1a000005 	bne	12c40 <_malloc_r+0x8c>
   12c28:	ea00000a 	b	12c58 <_malloc_r+0xa4>
   12c2c:	e3520000 	cmp	r2, #0
   12c30:	aa000066 	bge	12dd0 <_malloc_r+0x21c>
   12c34:	e594400c 	ldr	r4, [r4, #12]
   12c38:	e1510004 	cmp	r1, r4
   12c3c:	0a000005 	beq	12c58 <_malloc_r+0xa4>
   12c40:	e5943004 	ldr	r3, [r4, #4]
   12c44:	e3c33003 	bic	r3, r3, #3
   12c48:	e0432006 	sub	r2, r3, r6
   12c4c:	e352000f 	cmp	r2, #15
   12c50:	dafffff5 	ble	12c2c <_malloc_r+0x78>
   12c54:	e1a0000c 	mov	r0, ip
   12c58:	e5974010 	ldr	r4, [r7, #16]
   12c5c:	e59fc6c0 	ldr	ip, [pc, #1728]	; 13324 <_malloc_r+0x770>
   12c60:	e154000c 	cmp	r4, ip
   12c64:	05973004 	ldreq	r3, [r7, #4]
   12c68:	0a000018 	beq	12cd0 <_malloc_r+0x11c>
   12c6c:	e5943004 	ldr	r3, [r4, #4]
   12c70:	e3c33003 	bic	r3, r3, #3
   12c74:	e0432006 	sub	r2, r3, r6
   12c78:	e352000f 	cmp	r2, #15
   12c7c:	ca0000da 	bgt	12fec <_malloc_r+0x438>
   12c80:	e3520000 	cmp	r2, #0
   12c84:	e587c014 	str	ip, [r7, #20]
   12c88:	e587c010 	str	ip, [r7, #16]
   12c8c:	aa000069 	bge	12e38 <_malloc_r+0x284>
   12c90:	e3530c02 	cmp	r3, #512	; 0x200
   12c94:	2a0000b9 	bcs	12f80 <_malloc_r+0x3cc>
   12c98:	e3a08001 	mov	r8, #1
   12c9c:	e5972004 	ldr	r2, [r7, #4]
   12ca0:	e1a031a3 	lsr	r3, r3, #3
   12ca4:	e0831008 	add	r1, r3, r8
   12ca8:	e1a03143 	asr	r3, r3, #2
   12cac:	e1823318 	orr	r3, r2, r8, lsl r3
   12cb0:	e087e181 	add	lr, r7, r1, lsl #3
   12cb4:	e7978181 	ldr	r8, [r7, r1, lsl #3]
   12cb8:	e24e2008 	sub	r2, lr, #8
   12cbc:	e584200c 	str	r2, [r4, #12]
   12cc0:	e5848008 	str	r8, [r4, #8]
   12cc4:	e5873004 	str	r3, [r7, #4]
   12cc8:	e7874181 	str	r4, [r7, r1, lsl #3]
   12ccc:	e588400c 	str	r4, [r8, #12]
   12cd0:	e3a01001 	mov	r1, #1
   12cd4:	e1a02140 	asr	r2, r0, #2
   12cd8:	e1a0e211 	lsl	lr, r1, r2
   12cdc:	e15e0003 	cmp	lr, r3
   12ce0:	8a00005f 	bhi	12e64 <_malloc_r+0x2b0>
   12ce4:	e11e0003 	tst	lr, r3
   12ce8:	1a000008 	bne	12d10 <_malloc_r+0x15c>
   12cec:	e1a0e11e 	lsl	lr, lr, r1
   12cf0:	e3c00003 	bic	r0, r0, #3
   12cf4:	e11e0003 	tst	lr, r3
   12cf8:	e2800004 	add	r0, r0, #4
   12cfc:	1a000003 	bne	12d10 <_malloc_r+0x15c>
   12d00:	e1a0e08e 	lsl	lr, lr, #1
   12d04:	e11e0003 	tst	lr, r3
   12d08:	e2800004 	add	r0, r0, #4
   12d0c:	0afffffb 	beq	12d00 <_malloc_r+0x14c>
   12d10:	e0879180 	add	r9, r7, r0, lsl #3
   12d14:	e1a01009 	mov	r1, r9
   12d18:	e1a04000 	mov	r4, r0
   12d1c:	e591800c 	ldr	r8, [r1, #12]
   12d20:	e1510008 	cmp	r1, r8
   12d24:	1a000005 	bne	12d40 <_malloc_r+0x18c>
   12d28:	ea0000bc 	b	13020 <_malloc_r+0x46c>
   12d2c:	e3520000 	cmp	r2, #0
   12d30:	aa0000c4 	bge	13048 <_malloc_r+0x494>
   12d34:	e598800c 	ldr	r8, [r8, #12]
   12d38:	e1510008 	cmp	r1, r8
   12d3c:	0a0000b7 	beq	13020 <_malloc_r+0x46c>
   12d40:	e5983004 	ldr	r3, [r8, #4]
   12d44:	e3c33003 	bic	r3, r3, #3
   12d48:	e0432006 	sub	r2, r3, r6
   12d4c:	e352000f 	cmp	r2, #15
   12d50:	dafffff5 	ble	12d2c <_malloc_r+0x178>
   12d54:	e598100c 	ldr	r1, [r8, #12]
   12d58:	e598e008 	ldr	lr, [r8, #8]
   12d5c:	e3864001 	orr	r4, r6, #1
   12d60:	e5884004 	str	r4, [r8, #4]
   12d64:	e0886006 	add	r6, r8, r6
   12d68:	e3824001 	orr	r4, r2, #1
   12d6c:	e58e100c 	str	r1, [lr, #12]
   12d70:	e1a00005 	mov	r0, r5
   12d74:	e581e008 	str	lr, [r1, #8]
   12d78:	e5876014 	str	r6, [r7, #20]
   12d7c:	e5876010 	str	r6, [r7, #16]
   12d80:	e9861010 	stmib	r6, {r4, ip}
   12d84:	e586c00c 	str	ip, [r6, #12]
   12d88:	e7882003 	str	r2, [r8, r3]
   12d8c:	eb0001d5 	bl	134e8 <__malloc_unlock>
   12d90:	e2884008 	add	r4, r8, #8
   12d94:	ea000018 	b	12dfc <_malloc_r+0x248>
   12d98:	e3510010 	cmp	r1, #16
   12d9c:	8a00001a 	bhi	12e0c <_malloc_r+0x258>
   12da0:	eb0001ca 	bl	134d0 <__malloc_lock>
   12da4:	e3a06010 	mov	r6, #16
   12da8:	e3a03018 	mov	r3, #24
   12dac:	e3a00002 	mov	r0, #2
   12db0:	e59f7568 	ldr	r7, [pc, #1384]	; 13320 <_malloc_r+0x76c>
   12db4:	e0873003 	add	r3, r7, r3
   12db8:	e5934004 	ldr	r4, [r3, #4]
   12dbc:	e2432008 	sub	r2, r3, #8
   12dc0:	e1540002 	cmp	r4, r2
   12dc4:	0a00009a 	beq	13034 <_malloc_r+0x480>
   12dc8:	e5943004 	ldr	r3, [r4, #4]
   12dcc:	e3c33003 	bic	r3, r3, #3
   12dd0:	e0843003 	add	r3, r4, r3
   12dd4:	e5932004 	ldr	r2, [r3, #4]
   12dd8:	e594100c 	ldr	r1, [r4, #12]
   12ddc:	e594c008 	ldr	ip, [r4, #8]
   12de0:	e3822001 	orr	r2, r2, #1
   12de4:	e58c100c 	str	r1, [ip, #12]
   12de8:	e1a00005 	mov	r0, r5
   12dec:	e581c008 	str	ip, [r1, #8]
   12df0:	e5832004 	str	r2, [r3, #4]
   12df4:	eb0001bb 	bl	134e8 <__malloc_unlock>
   12df8:	e2844008 	add	r4, r4, #8
   12dfc:	e1a00004 	mov	r0, r4
   12e00:	e28dd00c 	add	sp, sp, #12
   12e04:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12e08:	e12fff1e 	bx	lr
   12e0c:	e3a04000 	mov	r4, #0
   12e10:	e3a0300c 	mov	r3, #12
   12e14:	e1a00004 	mov	r0, r4
   12e18:	e5853000 	str	r3, [r5]
   12e1c:	e28dd00c 	add	sp, sp, #12
   12e20:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12e24:	e12fff1e 	bx	lr
   12e28:	e3a01c02 	mov	r1, #512	; 0x200
   12e2c:	e3a00040 	mov	r0, #64	; 0x40
   12e30:	e3a0c03f 	mov	ip, #63	; 0x3f
   12e34:	eaffff75 	b	12c10 <_malloc_r+0x5c>
   12e38:	e0843003 	add	r3, r4, r3
   12e3c:	e5932004 	ldr	r2, [r3, #4]
   12e40:	e3822001 	orr	r2, r2, #1
   12e44:	e1a00005 	mov	r0, r5
   12e48:	e5832004 	str	r2, [r3, #4]
   12e4c:	e2844008 	add	r4, r4, #8
   12e50:	eb0001a4 	bl	134e8 <__malloc_unlock>
   12e54:	e1a00004 	mov	r0, r4
   12e58:	e28dd00c 	add	sp, sp, #12
   12e5c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12e60:	e12fff1e 	bx	lr
   12e64:	e5974008 	ldr	r4, [r7, #8]
   12e68:	e5943004 	ldr	r3, [r4, #4]
   12e6c:	e3c39003 	bic	r9, r3, #3
   12e70:	e0493006 	sub	r3, r9, r6
   12e74:	e353000f 	cmp	r3, #15
   12e78:	c3a02000 	movgt	r2, #0
   12e7c:	d3a02001 	movle	r2, #1
   12e80:	e1590006 	cmp	r9, r6
   12e84:	33822001 	orrcc	r2, r2, #1
   12e88:	e3520000 	cmp	r2, #0
   12e8c:	0a000025 	beq	12f28 <_malloc_r+0x374>
   12e90:	e59fa490 	ldr	sl, [pc, #1168]	; 13328 <_malloc_r+0x774>
   12e94:	e59f2490 	ldr	r2, [pc, #1168]	; 1332c <_malloc_r+0x778>
   12e98:	e59a3000 	ldr	r3, [sl]
   12e9c:	e5922000 	ldr	r2, [r2]
   12ea0:	e3730001 	cmn	r3, #1
   12ea4:	e0862002 	add	r2, r6, r2
   12ea8:	12823a01 	addne	r3, r2, #4096	; 0x1000
   12eac:	1283300f 	addne	r3, r3, #15
   12eb0:	13c32eff 	bicne	r2, r3, #4080	; 0xff0
   12eb4:	02822010 	addeq	r2, r2, #16
   12eb8:	13c2200f 	bicne	r2, r2, #15
   12ebc:	e1a01002 	mov	r1, r2
   12ec0:	e1a00005 	mov	r0, r5
   12ec4:	e58d2004 	str	r2, [sp, #4]
   12ec8:	eb0002c1 	bl	139d4 <_sbrk_r>
   12ecc:	e3700001 	cmn	r0, #1
   12ed0:	e1a0b000 	mov	fp, r0
   12ed4:	e59d2004 	ldr	r2, [sp, #4]
   12ed8:	0a000003 	beq	12eec <_malloc_r+0x338>
   12edc:	e0843009 	add	r3, r4, r9
   12ee0:	e1540007 	cmp	r4, r7
   12ee4:	11530000 	cmpne	r3, r0
   12ee8:	9a000084 	bls	13100 <_malloc_r+0x54c>
   12eec:	e5974008 	ldr	r4, [r7, #8]
   12ef0:	e5943004 	ldr	r3, [r4, #4]
   12ef4:	e3c33003 	bic	r3, r3, #3
   12ef8:	e1560003 	cmp	r6, r3
   12efc:	93a02000 	movls	r2, #0
   12f00:	83a02001 	movhi	r2, #1
   12f04:	e0433006 	sub	r3, r3, r6
   12f08:	e353000f 	cmp	r3, #15
   12f0c:	d3822001 	orrle	r2, r2, #1
   12f10:	e3520000 	cmp	r2, #0
   12f14:	0a000003 	beq	12f28 <_malloc_r+0x374>
   12f18:	e1a00005 	mov	r0, r5
   12f1c:	eb000171 	bl	134e8 <__malloc_unlock>
   12f20:	e3a04000 	mov	r4, #0
   12f24:	eaffffb4 	b	12dfc <_malloc_r+0x248>
   12f28:	e3862001 	orr	r2, r6, #1
   12f2c:	e3833001 	orr	r3, r3, #1
   12f30:	e0846006 	add	r6, r4, r6
   12f34:	e5842004 	str	r2, [r4, #4]
   12f38:	e1a00005 	mov	r0, r5
   12f3c:	e5876008 	str	r6, [r7, #8]
   12f40:	e2844008 	add	r4, r4, #8
   12f44:	e5863004 	str	r3, [r6, #4]
   12f48:	eb000166 	bl	134e8 <__malloc_unlock>
   12f4c:	e1a00004 	mov	r0, r4
   12f50:	e28dd00c 	add	sp, sp, #12
   12f54:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   12f58:	e12fff1e 	bx	lr
   12f5c:	e3530014 	cmp	r3, #20
   12f60:	9a000044 	bls	13078 <_malloc_r+0x4c4>
   12f64:	e3530054 	cmp	r3, #84	; 0x54
   12f68:	8a0000a8 	bhi	13210 <_malloc_r+0x65c>
   12f6c:	e1a03626 	lsr	r3, r6, #12
   12f70:	e283006f 	add	r0, r3, #111	; 0x6f
   12f74:	e283c06e 	add	ip, r3, #110	; 0x6e
   12f78:	e1a01180 	lsl	r1, r0, #3
   12f7c:	eaffff23 	b	12c10 <_malloc_r+0x5c>
   12f80:	e1a024a3 	lsr	r2, r3, #9
   12f84:	e3520004 	cmp	r2, #4
   12f88:	9a00003e 	bls	13088 <_malloc_r+0x4d4>
   12f8c:	e3520014 	cmp	r2, #20
   12f90:	8a0000b4 	bhi	13268 <_malloc_r+0x6b4>
   12f94:	e282805c 	add	r8, r2, #92	; 0x5c
   12f98:	e1a08188 	lsl	r8, r8, #3
   12f9c:	e282105b 	add	r1, r2, #91	; 0x5b
   12fa0:	e087e008 	add	lr, r7, r8
   12fa4:	e7972008 	ldr	r2, [r7, r8]
   12fa8:	e24ee008 	sub	lr, lr, #8
   12fac:	e15e0002 	cmp	lr, r2
   12fb0:	0a00009d 	beq	1322c <_malloc_r+0x678>
   12fb4:	e5921004 	ldr	r1, [r2, #4]
   12fb8:	e3c11003 	bic	r1, r1, #3
   12fbc:	e1530001 	cmp	r3, r1
   12fc0:	2a000090 	bcs	13208 <_malloc_r+0x654>
   12fc4:	e5922008 	ldr	r2, [r2, #8]
   12fc8:	e15e0002 	cmp	lr, r2
   12fcc:	1afffff8 	bne	12fb4 <_malloc_r+0x400>
   12fd0:	e59e200c 	ldr	r2, [lr, #12]
   12fd4:	e5973004 	ldr	r3, [r7, #4]
   12fd8:	e584200c 	str	r2, [r4, #12]
   12fdc:	e584e008 	str	lr, [r4, #8]
   12fe0:	e5824008 	str	r4, [r2, #8]
   12fe4:	e58e400c 	str	r4, [lr, #12]
   12fe8:	eaffff38 	b	12cd0 <_malloc_r+0x11c>
   12fec:	e386e001 	orr	lr, r6, #1
   12ff0:	e3821001 	orr	r1, r2, #1
   12ff4:	e0846006 	add	r6, r4, r6
   12ff8:	e584e004 	str	lr, [r4, #4]
   12ffc:	e1a00005 	mov	r0, r5
   13000:	e5876014 	str	r6, [r7, #20]
   13004:	e5876010 	str	r6, [r7, #16]
   13008:	e586c00c 	str	ip, [r6, #12]
   1300c:	e9861002 	stmib	r6, {r1, ip}
   13010:	e7842003 	str	r2, [r4, r3]
   13014:	eb000133 	bl	134e8 <__malloc_unlock>
   13018:	e2844008 	add	r4, r4, #8
   1301c:	eaffff76 	b	12dfc <_malloc_r+0x248>
   13020:	e2844001 	add	r4, r4, #1
   13024:	e3140003 	tst	r4, #3
   13028:	e2811008 	add	r1, r1, #8
   1302c:	1affff3a 	bne	12d1c <_malloc_r+0x168>
   13030:	ea00001d 	b	130ac <_malloc_r+0x4f8>
   13034:	e593400c 	ldr	r4, [r3, #12]
   13038:	e1530004 	cmp	r3, r4
   1303c:	02800002 	addeq	r0, r0, #2
   13040:	0affff04 	beq	12c58 <_malloc_r+0xa4>
   13044:	eaffff5f 	b	12dc8 <_malloc_r+0x214>
   13048:	e1a04008 	mov	r4, r8
   1304c:	e0883003 	add	r3, r8, r3
   13050:	e5932004 	ldr	r2, [r3, #4]
   13054:	e598100c 	ldr	r1, [r8, #12]
   13058:	e5b4c008 	ldr	ip, [r4, #8]!
   1305c:	e3822001 	orr	r2, r2, #1
   13060:	e5832004 	str	r2, [r3, #4]
   13064:	e1a00005 	mov	r0, r5
   13068:	e58c100c 	str	r1, [ip, #12]
   1306c:	e581c008 	str	ip, [r1, #8]
   13070:	eb00011c 	bl	134e8 <__malloc_unlock>
   13074:	eaffff60 	b	12dfc <_malloc_r+0x248>
   13078:	e283005c 	add	r0, r3, #92	; 0x5c
   1307c:	e283c05b 	add	ip, r3, #91	; 0x5b
   13080:	e1a01180 	lsl	r1, r0, #3
   13084:	eafffee1 	b	12c10 <_malloc_r+0x5c>
   13088:	e1a02323 	lsr	r2, r3, #6
   1308c:	e2828039 	add	r8, r2, #57	; 0x39
   13090:	e1a08188 	lsl	r8, r8, #3
   13094:	e2821038 	add	r1, r2, #56	; 0x38
   13098:	eaffffc0 	b	12fa0 <_malloc_r+0x3ec>
   1309c:	e4193008 	ldr	r3, [r9], #-8
   130a0:	e1590003 	cmp	r9, r3
   130a4:	e2400001 	sub	r0, r0, #1
   130a8:	1a000097 	bne	1330c <_malloc_r+0x758>
   130ac:	e3100003 	tst	r0, #3
   130b0:	1afffff9 	bne	1309c <_malloc_r+0x4e8>
   130b4:	e5973004 	ldr	r3, [r7, #4]
   130b8:	e1c3300e 	bic	r3, r3, lr
   130bc:	e5873004 	str	r3, [r7, #4]
   130c0:	e1b0e08e 	lsls	lr, lr, #1
   130c4:	13a02001 	movne	r2, #1
   130c8:	03a02000 	moveq	r2, #0
   130cc:	e15e0003 	cmp	lr, r3
   130d0:	83a02000 	movhi	r2, #0
   130d4:	92022001 	andls	r2, r2, #1
   130d8:	e3520000 	cmp	r2, #0
   130dc:	0affff60 	beq	12e64 <_malloc_r+0x2b0>
   130e0:	e11e0003 	tst	lr, r3
   130e4:	e1a00004 	mov	r0, r4
   130e8:	1affff08 	bne	12d10 <_malloc_r+0x15c>
   130ec:	e1a0e08e 	lsl	lr, lr, #1
   130f0:	e11e0003 	tst	lr, r3
   130f4:	e2800004 	add	r0, r0, #4
   130f8:	0afffffb 	beq	130ec <_malloc_r+0x538>
   130fc:	eaffff03 	b	12d10 <_malloc_r+0x15c>
   13100:	e59f8228 	ldr	r8, [pc, #552]	; 13330 <_malloc_r+0x77c>
   13104:	e5981000 	ldr	r1, [r8]
   13108:	e1530000 	cmp	r3, r0
   1310c:	e0821001 	add	r1, r2, r1
   13110:	e5881000 	str	r1, [r8]
   13114:	0a00005e 	beq	13294 <_malloc_r+0x6e0>
   13118:	e59a0000 	ldr	r0, [sl]
   1311c:	e3700001 	cmn	r0, #1
   13120:	104b3003 	subne	r3, fp, r3
   13124:	10831001 	addne	r1, r3, r1
   13128:	058ab000 	streq	fp, [sl]
   1312c:	15881000 	strne	r1, [r8]
   13130:	e21b1007 	ands	r1, fp, #7
   13134:	03a01a01 	moveq	r1, #4096	; 0x1000
   13138:	12613008 	rsbne	r3, r1, #8
   1313c:	108bb003 	addne	fp, fp, r3
   13140:	e08b2002 	add	r2, fp, r2
   13144:	12611a01 	rsbne	r1, r1, #4096	; 0x1000
   13148:	e1a02a02 	lsl	r2, r2, #20
   1314c:	12811008 	addne	r1, r1, #8
   13150:	e1a02a22 	lsr	r2, r2, #20
   13154:	e041a002 	sub	sl, r1, r2
   13158:	e1a0100a 	mov	r1, sl
   1315c:	e1a00005 	mov	r0, r5
   13160:	eb00021b 	bl	139d4 <_sbrk_r>
   13164:	e3700001 	cmn	r0, #1
   13168:	03a0a000 	moveq	sl, #0
   1316c:	03a03001 	moveq	r3, #1
   13170:	1040300b 	subne	r3, r0, fp
   13174:	e5981000 	ldr	r1, [r8]
   13178:	1083300a 	addne	r3, r3, sl
   1317c:	13833001 	orrne	r3, r3, #1
   13180:	e08a1001 	add	r1, sl, r1
   13184:	e1540007 	cmp	r4, r7
   13188:	e587b008 	str	fp, [r7, #8]
   1318c:	e5881000 	str	r1, [r8]
   13190:	e58b3004 	str	r3, [fp, #4]
   13194:	0a00000f 	beq	131d8 <_malloc_r+0x624>
   13198:	e359000f 	cmp	r9, #15
   1319c:	93a03001 	movls	r3, #1
   131a0:	958b3004 	strls	r3, [fp, #4]
   131a4:	9affff5b 	bls	12f18 <_malloc_r+0x364>
   131a8:	e3a00005 	mov	r0, #5
   131ac:	e5942004 	ldr	r2, [r4, #4]
   131b0:	e249300c 	sub	r3, r9, #12
   131b4:	e3c33007 	bic	r3, r3, #7
   131b8:	e2022001 	and	r2, r2, #1
   131bc:	e1822003 	orr	r2, r2, r3
   131c0:	e353000f 	cmp	r3, #15
   131c4:	e0843003 	add	r3, r4, r3
   131c8:	e5842004 	str	r2, [r4, #4]
   131cc:	e5830004 	str	r0, [r3, #4]
   131d0:	e5830008 	str	r0, [r3, #8]
   131d4:	8a000037 	bhi	132b8 <_malloc_r+0x704>
   131d8:	e59f3154 	ldr	r3, [pc, #340]	; 13334 <_malloc_r+0x780>
   131dc:	e5932000 	ldr	r2, [r3]
   131e0:	e1510002 	cmp	r1, r2
   131e4:	e59f214c 	ldr	r2, [pc, #332]	; 13338 <_malloc_r+0x784>
   131e8:	85831000 	strhi	r1, [r3]
   131ec:	e5974008 	ldr	r4, [r7, #8]
   131f0:	e5923000 	ldr	r3, [r2]
   131f4:	e1510003 	cmp	r1, r3
   131f8:	e5943004 	ldr	r3, [r4, #4]
   131fc:	85821000 	strhi	r1, [r2]
   13200:	e3c33003 	bic	r3, r3, #3
   13204:	eaffff3b 	b	12ef8 <_malloc_r+0x344>
   13208:	e1a0e002 	mov	lr, r2
   1320c:	eaffff6f 	b	12fd0 <_malloc_r+0x41c>
   13210:	e3530f55 	cmp	r3, #340	; 0x154
   13214:	8a00000b 	bhi	13248 <_malloc_r+0x694>
   13218:	e1a037a6 	lsr	r3, r6, #15
   1321c:	e2830078 	add	r0, r3, #120	; 0x78
   13220:	e283c077 	add	ip, r3, #119	; 0x77
   13224:	e1a01180 	lsl	r1, r0, #3
   13228:	eafffe78 	b	12c10 <_malloc_r+0x5c>
   1322c:	e3a08001 	mov	r8, #1
   13230:	e5973004 	ldr	r3, [r7, #4]
   13234:	e1a02141 	asr	r2, r1, #2
   13238:	e1833218 	orr	r3, r3, r8, lsl r2
   1323c:	e5873004 	str	r3, [r7, #4]
   13240:	e1a0200e 	mov	r2, lr
   13244:	eaffff63 	b	12fd8 <_malloc_r+0x424>
   13248:	e59f20ec 	ldr	r2, [pc, #236]	; 1333c <_malloc_r+0x788>
   1324c:	e1530002 	cmp	r3, r2
   13250:	8a00000b 	bhi	13284 <_malloc_r+0x6d0>
   13254:	e1a03926 	lsr	r3, r6, #18
   13258:	e283007d 	add	r0, r3, #125	; 0x7d
   1325c:	e283c07c 	add	ip, r3, #124	; 0x7c
   13260:	e1a01180 	lsl	r1, r0, #3
   13264:	eafffe69 	b	12c10 <_malloc_r+0x5c>
   13268:	e3520054 	cmp	r2, #84	; 0x54
   1326c:	8a000016 	bhi	132cc <_malloc_r+0x718>
   13270:	e1a02623 	lsr	r2, r3, #12
   13274:	e282806f 	add	r8, r2, #111	; 0x6f
   13278:	e1a08188 	lsl	r8, r8, #3
   1327c:	e282106e 	add	r1, r2, #110	; 0x6e
   13280:	eaffff46 	b	12fa0 <_malloc_r+0x3ec>
   13284:	e3a01ffe 	mov	r1, #1016	; 0x3f8
   13288:	e3a0007f 	mov	r0, #127	; 0x7f
   1328c:	e3a0c07e 	mov	ip, #126	; 0x7e
   13290:	eafffe5e 	b	12c10 <_malloc_r+0x5c>
   13294:	e1a00a03 	lsl	r0, r3, #20
   13298:	e1a00a20 	lsr	r0, r0, #20
   1329c:	e3500000 	cmp	r0, #0
   132a0:	1affff9c 	bne	13118 <_malloc_r+0x564>
   132a4:	e0893002 	add	r3, r9, r2
   132a8:	e5972008 	ldr	r2, [r7, #8]
   132ac:	e3833001 	orr	r3, r3, #1
   132b0:	e5823004 	str	r3, [r2, #4]
   132b4:	eaffffc7 	b	131d8 <_malloc_r+0x624>
   132b8:	e2841008 	add	r1, r4, #8
   132bc:	e1a00005 	mov	r0, r5
   132c0:	ebfffb5e 	bl	12040 <_free_r>
   132c4:	e5981000 	ldr	r1, [r8]
   132c8:	eaffffc2 	b	131d8 <_malloc_r+0x624>
   132cc:	e3520f55 	cmp	r2, #340	; 0x154
   132d0:	8a000004 	bhi	132e8 <_malloc_r+0x734>
   132d4:	e1a027a3 	lsr	r2, r3, #15
   132d8:	e2828078 	add	r8, r2, #120	; 0x78
   132dc:	e1a08188 	lsl	r8, r8, #3
   132e0:	e2821077 	add	r1, r2, #119	; 0x77
   132e4:	eaffff2d 	b	12fa0 <_malloc_r+0x3ec>
   132e8:	e59f104c 	ldr	r1, [pc, #76]	; 1333c <_malloc_r+0x788>
   132ec:	e1520001 	cmp	r2, r1
   132f0:	91a02923 	lsrls	r2, r3, #18
   132f4:	9282807d 	addls	r8, r2, #125	; 0x7d
   132f8:	91a08188 	lslls	r8, r8, #3
   132fc:	9282107c 	addls	r1, r2, #124	; 0x7c
   13300:	83a08ffe 	movhi	r8, #1016	; 0x3f8
   13304:	83a0107e 	movhi	r1, #126	; 0x7e
   13308:	eaffff24 	b	12fa0 <_malloc_r+0x3ec>
   1330c:	e5973004 	ldr	r3, [r7, #4]
   13310:	eaffff6a 	b	130c0 <_malloc_r+0x50c>
   13314:	e1a001a6 	lsr	r0, r6, #3
   13318:	e2863008 	add	r3, r6, #8
   1331c:	eafffea3 	b	12db0 <_malloc_r+0x1fc>
   13320:	000157ac 	.word	0x000157ac
   13324:	000157b4 	.word	0x000157b4
   13328:	00015bb4 	.word	0x00015bb4
   1332c:	00015c34 	.word	0x00015c34
   13330:	00015c04 	.word	0x00015c04
   13334:	00015c2c 	.word	0x00015c2c
   13338:	00015c30 	.word	0x00015c30
   1333c:	00000554 	.word	0x00000554

00013340 <_mbtowc_r>:
   13340:	e59fc024 	ldr	ip, [pc, #36]	; 1336c <_mbtowc_r+0x2c>
   13344:	e59cc000 	ldr	ip, [ip]
   13348:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   1334c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   13350:	e59fe018 	ldr	lr, [pc, #24]	; 13370 <_mbtowc_r+0x30>
   13354:	e35c0000 	cmp	ip, #0
   13358:	01a0c00e 	moveq	ip, lr
   1335c:	e59ce0e4 	ldr	lr, [ip, #228]	; 0xe4
   13360:	e1a0c00e 	mov	ip, lr
   13364:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   13368:	e12fff1c 	bx	ip
   1336c:	00015210 	.word	0x00015210
   13370:	00015640 	.word	0x00015640

00013374 <__ascii_mbtowc>:
   13374:	e3510000 	cmp	r1, #0
   13378:	e24dd008 	sub	sp, sp, #8
   1337c:	028d1004 	addeq	r1, sp, #4
   13380:	e3520000 	cmp	r2, #0
   13384:	0a000008 	beq	133ac <__ascii_mbtowc+0x38>
   13388:	e3530000 	cmp	r3, #0
   1338c:	0a000009 	beq	133b8 <__ascii_mbtowc+0x44>
   13390:	e5d23000 	ldrb	r3, [r2]
   13394:	e5813000 	str	r3, [r1]
   13398:	e5d22000 	ldrb	r2, [r2]
   1339c:	e2920000 	adds	r0, r2, #0
   133a0:	13a00001 	movne	r0, #1
   133a4:	e28dd008 	add	sp, sp, #8
   133a8:	e12fff1e 	bx	lr
   133ac:	e1a00002 	mov	r0, r2
   133b0:	e28dd008 	add	sp, sp, #8
   133b4:	e12fff1e 	bx	lr
   133b8:	e3e00001 	mvn	r0, #1
   133bc:	eafffff8 	b	133a4 <__ascii_mbtowc+0x30>

000133c0 <memchr>:
   133c0:	e3100003 	tst	r0, #3
   133c4:	e92d4070 	push	{r4, r5, r6, lr}
   133c8:	e201e0ff 	and	lr, r1, #255	; 0xff
   133cc:	0a000038 	beq	134b4 <memchr+0xf4>
   133d0:	e3520000 	cmp	r2, #0
   133d4:	e242c001 	sub	ip, r2, #1
   133d8:	0a00001e 	beq	13458 <memchr+0x98>
   133dc:	e5d03000 	ldrb	r3, [r0]
   133e0:	e153000e 	cmp	r3, lr
   133e4:	0a00001c 	beq	1345c <memchr+0x9c>
   133e8:	e2803001 	add	r3, r0, #1
   133ec:	ea000005 	b	13408 <memchr+0x48>
   133f0:	e25cc001 	subs	ip, ip, #1
   133f4:	3a000017 	bcc	13458 <memchr+0x98>
   133f8:	e5d02000 	ldrb	r2, [r0]
   133fc:	e152000e 	cmp	r2, lr
   13400:	e2833001 	add	r3, r3, #1
   13404:	0a000014 	beq	1345c <memchr+0x9c>
   13408:	e3130003 	tst	r3, #3
   1340c:	e1a00003 	mov	r0, r3
   13410:	1afffff6 	bne	133f0 <memchr+0x30>
   13414:	e35c0003 	cmp	ip, #3
   13418:	8a000011 	bhi	13464 <memchr+0xa4>
   1341c:	e35c0000 	cmp	ip, #0
   13420:	0a000025 	beq	134bc <memchr+0xfc>
   13424:	e5d03000 	ldrb	r3, [r0]
   13428:	e153000e 	cmp	r3, lr
   1342c:	0a00000a 	beq	1345c <memchr+0x9c>
   13430:	e080c00c 	add	ip, r0, ip
   13434:	e2803001 	add	r3, r0, #1
   13438:	ea000003 	b	1344c <memchr+0x8c>
   1343c:	e5d02000 	ldrb	r2, [r0]
   13440:	e152000e 	cmp	r2, lr
   13444:	e2833001 	add	r3, r3, #1
   13448:	0a000003 	beq	1345c <memchr+0x9c>
   1344c:	e15c0003 	cmp	ip, r3
   13450:	e1a00003 	mov	r0, r3
   13454:	1afffff8 	bne	1343c <memchr+0x7c>
   13458:	e3a00000 	mov	r0, #0
   1345c:	e8bd4070 	pop	{r4, r5, r6, lr}
   13460:	e12fff1e 	bx	lr
   13464:	e59f4058 	ldr	r4, [pc, #88]	; 134c4 <memchr+0x104>
   13468:	e0044401 	and	r4, r4, r1, lsl #8
   1346c:	e184400e 	orr	r4, r4, lr
   13470:	e59f6050 	ldr	r6, [pc, #80]	; 134c8 <memchr+0x108>
   13474:	e59f5050 	ldr	r5, [pc, #80]	; 134cc <memchr+0x10c>
   13478:	e1844804 	orr	r4, r4, r4, lsl #16
   1347c:	e5903000 	ldr	r3, [r0]
   13480:	e0233004 	eor	r3, r3, r4
   13484:	e0832006 	add	r2, r3, r6
   13488:	e1c23003 	bic	r3, r2, r3
   1348c:	e1130005 	tst	r3, r5
   13490:	e1a01000 	mov	r1, r0
   13494:	e2800004 	add	r0, r0, #4
   13498:	1a000003 	bne	134ac <memchr+0xec>
   1349c:	e24cc004 	sub	ip, ip, #4
   134a0:	e35c0003 	cmp	ip, #3
   134a4:	8afffff4 	bhi	1347c <memchr+0xbc>
   134a8:	eaffffdb 	b	1341c <memchr+0x5c>
   134ac:	e1a00001 	mov	r0, r1
   134b0:	eaffffdb 	b	13424 <memchr+0x64>
   134b4:	e1a0c002 	mov	ip, r2
   134b8:	eaffffd5 	b	13414 <memchr+0x54>
   134bc:	e1a0000c 	mov	r0, ip
   134c0:	eaffffe5 	b	1345c <memchr+0x9c>
   134c4:	0000ffff 	.word	0x0000ffff
   134c8:	fefefeff 	.word	0xfefefeff
   134cc:	80808080 	.word	0x80808080

000134d0 <__malloc_lock>:
   134d0:	e92d4010 	push	{r4, lr}
   134d4:	e59f0008 	ldr	r0, [pc, #8]	; 134e4 <__malloc_lock+0x14>
   134d8:	ebfffd46 	bl	129f8 <__retarget_lock_acquire_recursive>
   134dc:	e8bd4010 	pop	{r4, lr}
   134e0:	e12fff1e 	bx	lr
   134e4:	00015ecc 	.word	0x00015ecc

000134e8 <__malloc_unlock>:
   134e8:	e92d4010 	push	{r4, lr}
   134ec:	e59f0008 	ldr	r0, [pc, #8]	; 134fc <__malloc_unlock+0x14>
   134f0:	ebfffd46 	bl	12a10 <__retarget_lock_release_recursive>
   134f4:	e8bd4010 	pop	{r4, lr}
   134f8:	e12fff1e 	bx	lr
   134fc:	00015ecc 	.word	0x00015ecc

00013500 <_realloc_r>:
   13500:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   13504:	e2517000 	subs	r7, r1, #0
   13508:	e24dd00c 	sub	sp, sp, #12
   1350c:	e1a09002 	mov	r9, r2
   13510:	0a00007f 	beq	13714 <_realloc_r+0x214>
   13514:	e289400b 	add	r4, r9, #11
   13518:	e1a08000 	mov	r8, r0
   1351c:	ebffffeb 	bl	134d0 <__malloc_lock>
   13520:	e3540016 	cmp	r4, #22
   13524:	93a02010 	movls	r2, #16
   13528:	93a03000 	movls	r3, #0
   1352c:	91a04002 	movls	r4, r2
   13530:	83c44007 	bichi	r4, r4, #7
   13534:	81a03fa4 	lsrhi	r3, r4, #31
   13538:	81a02004 	movhi	r2, r4
   1353c:	e1540009 	cmp	r4, r9
   13540:	33833001 	orrcc	r3, r3, #1
   13544:	e3530000 	cmp	r3, #0
   13548:	13a0300c 	movne	r3, #12
   1354c:	e5171004 	ldr	r1, [r7, #-4]
   13550:	e2475008 	sub	r5, r7, #8
   13554:	e3c16003 	bic	r6, r1, #3
   13558:	13a09000 	movne	r9, #0
   1355c:	15883000 	strne	r3, [r8]
   13560:	1a00000f 	bne	135a4 <_realloc_r+0xa4>
   13564:	e1560002 	cmp	r6, r2
   13568:	ba000011 	blt	135b4 <_realloc_r+0xb4>
   1356c:	e1a09007 	mov	r9, r7
   13570:	e0463004 	sub	r3, r6, r4
   13574:	e353000f 	cmp	r3, #15
   13578:	8a000056 	bhi	136d8 <_realloc_r+0x1d8>
   1357c:	e5953004 	ldr	r3, [r5, #4]
   13580:	e2033001 	and	r3, r3, #1
   13584:	e1833006 	orr	r3, r3, r6
   13588:	e5853004 	str	r3, [r5, #4]
   1358c:	e0855006 	add	r5, r5, r6
   13590:	e5953004 	ldr	r3, [r5, #4]
   13594:	e3833001 	orr	r3, r3, #1
   13598:	e5853004 	str	r3, [r5, #4]
   1359c:	e1a00008 	mov	r0, r8
   135a0:	ebffffd0 	bl	134e8 <__malloc_unlock>
   135a4:	e1a00009 	mov	r0, r9
   135a8:	e28dd00c 	add	sp, sp, #12
   135ac:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   135b0:	e12fff1e 	bx	lr
   135b4:	e59fb414 	ldr	fp, [pc, #1044]	; 139d0 <_realloc_r+0x4d0>
   135b8:	e59b3008 	ldr	r3, [fp, #8]
   135bc:	e085c006 	add	ip, r5, r6
   135c0:	e15c0003 	cmp	ip, r3
   135c4:	0a0000a5 	beq	13860 <_realloc_r+0x360>
   135c8:	e59c0004 	ldr	r0, [ip, #4]
   135cc:	e3c03001 	bic	r3, r0, #1
   135d0:	e08c3003 	add	r3, ip, r3
   135d4:	e5933004 	ldr	r3, [r3, #4]
   135d8:	e3130001 	tst	r3, #1
   135dc:	0a000032 	beq	136ac <_realloc_r+0x1ac>
   135e0:	e3110001 	tst	r1, #1
   135e4:	0a000088 	beq	1380c <_realloc_r+0x30c>
   135e8:	e1a01009 	mov	r1, r9
   135ec:	e1a00008 	mov	r0, r8
   135f0:	ebfffd6f 	bl	12bb4 <_malloc_r>
   135f4:	e2509000 	subs	r9, r0, #0
   135f8:	0affffe7 	beq	1359c <_realloc_r+0x9c>
   135fc:	e5173004 	ldr	r3, [r7, #-4]
   13600:	e3c33001 	bic	r3, r3, #1
   13604:	e0853003 	add	r3, r5, r3
   13608:	e2492008 	sub	r2, r9, #8
   1360c:	e1520003 	cmp	r2, r3
   13610:	0a0000e3 	beq	139a4 <_realloc_r+0x4a4>
   13614:	e2462004 	sub	r2, r6, #4
   13618:	e3520024 	cmp	r2, #36	; 0x24
   1361c:	8a0000dd 	bhi	13998 <_realloc_r+0x498>
   13620:	e3520013 	cmp	r2, #19
   13624:	91a03009 	movls	r3, r9
   13628:	91a02007 	movls	r2, r7
   1362c:	9a000014 	bls	13684 <_realloc_r+0x184>
   13630:	e5973000 	ldr	r3, [r7]
   13634:	e5893000 	str	r3, [r9]
   13638:	e5973004 	ldr	r3, [r7, #4]
   1363c:	e352001b 	cmp	r2, #27
   13640:	e5893004 	str	r3, [r9, #4]
   13644:	92872008 	addls	r2, r7, #8
   13648:	92893008 	addls	r3, r9, #8
   1364c:	9a00000c 	bls	13684 <_realloc_r+0x184>
   13650:	e5973008 	ldr	r3, [r7, #8]
   13654:	e5893008 	str	r3, [r9, #8]
   13658:	e597300c 	ldr	r3, [r7, #12]
   1365c:	e589300c 	str	r3, [r9, #12]
   13660:	e3520024 	cmp	r2, #36	; 0x24
   13664:	05973010 	ldreq	r3, [r7, #16]
   13668:	05893010 	streq	r3, [r9, #16]
   1366c:	05972014 	ldreq	r2, [r7, #20]
   13670:	12893010 	addne	r3, r9, #16
   13674:	05892014 	streq	r2, [r9, #20]
   13678:	12872010 	addne	r2, r7, #16
   1367c:	02893018 	addeq	r3, r9, #24
   13680:	02872018 	addeq	r2, r7, #24
   13684:	e5921000 	ldr	r1, [r2]
   13688:	e5831000 	str	r1, [r3]
   1368c:	e5921004 	ldr	r1, [r2, #4]
   13690:	e5831004 	str	r1, [r3, #4]
   13694:	e5922008 	ldr	r2, [r2, #8]
   13698:	e5832008 	str	r2, [r3, #8]
   1369c:	e1a01007 	mov	r1, r7
   136a0:	e1a00008 	mov	r0, r8
   136a4:	ebfffa65 	bl	12040 <_free_r>
   136a8:	eaffffbb 	b	1359c <_realloc_r+0x9c>
   136ac:	e3c00003 	bic	r0, r0, #3
   136b0:	e0863000 	add	r3, r6, r0
   136b4:	e1530002 	cmp	r3, r2
   136b8:	ba00001c 	blt	13730 <_realloc_r+0x230>
   136bc:	e28c1008 	add	r1, ip, #8
   136c0:	e8910006 	ldm	r1, {r1, r2}
   136c4:	e1a09007 	mov	r9, r7
   136c8:	e581200c 	str	r2, [r1, #12]
   136cc:	e1a06003 	mov	r6, r3
   136d0:	e5821008 	str	r1, [r2, #8]
   136d4:	eaffffa5 	b	13570 <_realloc_r+0x70>
   136d8:	e5952004 	ldr	r2, [r5, #4]
   136dc:	e2022001 	and	r2, r2, #1
   136e0:	e0851004 	add	r1, r5, r4
   136e4:	e3833001 	orr	r3, r3, #1
   136e8:	e1822004 	orr	r2, r2, r4
   136ec:	e5852004 	str	r2, [r5, #4]
   136f0:	e5813004 	str	r3, [r1, #4]
   136f4:	e0855006 	add	r5, r5, r6
   136f8:	e5953004 	ldr	r3, [r5, #4]
   136fc:	e3833001 	orr	r3, r3, #1
   13700:	e2811008 	add	r1, r1, #8
   13704:	e5853004 	str	r3, [r5, #4]
   13708:	e1a00008 	mov	r0, r8
   1370c:	ebfffa4b 	bl	12040 <_free_r>
   13710:	eaffffa1 	b	1359c <_realloc_r+0x9c>
   13714:	e1a01002 	mov	r1, r2
   13718:	ebfffd25 	bl	12bb4 <_malloc_r>
   1371c:	e1a09000 	mov	r9, r0
   13720:	e1a00009 	mov	r0, r9
   13724:	e28dd00c 	add	sp, sp, #12
   13728:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   1372c:	e12fff1e 	bx	lr
   13730:	e3110001 	tst	r1, #1
   13734:	1affffab 	bne	135e8 <_realloc_r+0xe8>
   13738:	e517a008 	ldr	sl, [r7, #-8]
   1373c:	e045a00a 	sub	sl, r5, sl
   13740:	e59a1004 	ldr	r1, [sl, #4]
   13744:	e3c11003 	bic	r1, r1, #3
   13748:	e0810000 	add	r0, r1, r0
   1374c:	e0803006 	add	r3, r0, r6
   13750:	e1530002 	cmp	r3, r2
   13754:	ba000030 	blt	1381c <_realloc_r+0x31c>
   13758:	e1a0900a 	mov	r9, sl
   1375c:	e28c1008 	add	r1, ip, #8
   13760:	e8910006 	ldm	r1, {r1, r2}
   13764:	e581200c 	str	r2, [r1, #12]
   13768:	e5821008 	str	r1, [r2, #8]
   1376c:	e59a100c 	ldr	r1, [sl, #12]
   13770:	e5b90008 	ldr	r0, [r9, #8]!
   13774:	e2462004 	sub	r2, r6, #4
   13778:	e3520024 	cmp	r2, #36	; 0x24
   1377c:	e580100c 	str	r1, [r0, #12]
   13780:	e5810008 	str	r0, [r1, #8]
   13784:	8a00002f 	bhi	13848 <_realloc_r+0x348>
   13788:	e3520013 	cmp	r2, #19
   1378c:	91a02009 	movls	r2, r9
   13790:	9a000014 	bls	137e8 <_realloc_r+0x2e8>
   13794:	e5971000 	ldr	r1, [r7]
   13798:	e58a1008 	str	r1, [sl, #8]
   1379c:	e5971004 	ldr	r1, [r7, #4]
   137a0:	e352001b 	cmp	r2, #27
   137a4:	e58a100c 	str	r1, [sl, #12]
   137a8:	92877008 	addls	r7, r7, #8
   137ac:	928a2010 	addls	r2, sl, #16
   137b0:	9a00000c 	bls	137e8 <_realloc_r+0x2e8>
   137b4:	e5971008 	ldr	r1, [r7, #8]
   137b8:	e58a1010 	str	r1, [sl, #16]
   137bc:	e597100c 	ldr	r1, [r7, #12]
   137c0:	e58a1014 	str	r1, [sl, #20]
   137c4:	e3520024 	cmp	r2, #36	; 0x24
   137c8:	05972010 	ldreq	r2, [r7, #16]
   137cc:	058a2018 	streq	r2, [sl, #24]
   137d0:	05972014 	ldreq	r2, [r7, #20]
   137d4:	12877010 	addne	r7, r7, #16
   137d8:	058a201c 	streq	r2, [sl, #28]
   137dc:	128a2018 	addne	r2, sl, #24
   137e0:	02877018 	addeq	r7, r7, #24
   137e4:	028a2020 	addeq	r2, sl, #32
   137e8:	e5971000 	ldr	r1, [r7]
   137ec:	e5821000 	str	r1, [r2]
   137f0:	e5971004 	ldr	r1, [r7, #4]
   137f4:	e5821004 	str	r1, [r2, #4]
   137f8:	e5971008 	ldr	r1, [r7, #8]
   137fc:	e1a06003 	mov	r6, r3
   13800:	e1a0500a 	mov	r5, sl
   13804:	e5821008 	str	r1, [r2, #8]
   13808:	eaffff58 	b	13570 <_realloc_r+0x70>
   1380c:	e517a008 	ldr	sl, [r7, #-8]
   13810:	e045a00a 	sub	sl, r5, sl
   13814:	e59a1004 	ldr	r1, [sl, #4]
   13818:	e3c11003 	bic	r1, r1, #3
   1381c:	e0863001 	add	r3, r6, r1
   13820:	e1530002 	cmp	r3, r2
   13824:	baffff6f 	blt	135e8 <_realloc_r+0xe8>
   13828:	e1a0900a 	mov	r9, sl
   1382c:	e59a100c 	ldr	r1, [sl, #12]
   13830:	e5b90008 	ldr	r0, [r9, #8]!
   13834:	e2462004 	sub	r2, r6, #4
   13838:	e3520024 	cmp	r2, #36	; 0x24
   1383c:	e580100c 	str	r1, [r0, #12]
   13840:	e5810008 	str	r0, [r1, #8]
   13844:	9affffcf 	bls	13788 <_realloc_r+0x288>
   13848:	e1a01007 	mov	r1, r7
   1384c:	e1a00009 	mov	r0, r9
   13850:	e1a06003 	mov	r6, r3
   13854:	e1a0500a 	mov	r5, sl
   13858:	ebfff06b 	bl	fa0c <memmove>
   1385c:	eaffff43 	b	13570 <_realloc_r+0x70>
   13860:	e59c3004 	ldr	r3, [ip, #4]
   13864:	e3c33003 	bic	r3, r3, #3
   13868:	e0833006 	add	r3, r3, r6
   1386c:	e2840010 	add	r0, r4, #16
   13870:	e1530000 	cmp	r3, r0
   13874:	aa00003a 	bge	13964 <_realloc_r+0x464>
   13878:	e3110001 	tst	r1, #1
   1387c:	1affff59 	bne	135e8 <_realloc_r+0xe8>
   13880:	e517a008 	ldr	sl, [r7, #-8]
   13884:	e045a00a 	sub	sl, r5, sl
   13888:	e59a1004 	ldr	r1, [sl, #4]
   1388c:	e3c11003 	bic	r1, r1, #3
   13890:	e0813003 	add	r3, r1, r3
   13894:	e1500003 	cmp	r0, r3
   13898:	caffffdf 	bgt	1381c <_realloc_r+0x31c>
   1389c:	e1a0900a 	mov	r9, sl
   138a0:	e59a100c 	ldr	r1, [sl, #12]
   138a4:	e5b90008 	ldr	r0, [r9, #8]!
   138a8:	e2462004 	sub	r2, r6, #4
   138ac:	e3520024 	cmp	r2, #36	; 0x24
   138b0:	e580100c 	str	r1, [r0, #12]
   138b4:	e5810008 	str	r0, [r1, #8]
   138b8:	8a00003e 	bhi	139b8 <_realloc_r+0x4b8>
   138bc:	e3520013 	cmp	r2, #19
   138c0:	91a02009 	movls	r2, r9
   138c4:	9a000014 	bls	1391c <_realloc_r+0x41c>
   138c8:	e5971000 	ldr	r1, [r7]
   138cc:	e58a1008 	str	r1, [sl, #8]
   138d0:	e5971004 	ldr	r1, [r7, #4]
   138d4:	e352001b 	cmp	r2, #27
   138d8:	e58a100c 	str	r1, [sl, #12]
   138dc:	92877008 	addls	r7, r7, #8
   138e0:	928a2010 	addls	r2, sl, #16
   138e4:	9a00000c 	bls	1391c <_realloc_r+0x41c>
   138e8:	e5971008 	ldr	r1, [r7, #8]
   138ec:	e58a1010 	str	r1, [sl, #16]
   138f0:	e597100c 	ldr	r1, [r7, #12]
   138f4:	e58a1014 	str	r1, [sl, #20]
   138f8:	e3520024 	cmp	r2, #36	; 0x24
   138fc:	05972010 	ldreq	r2, [r7, #16]
   13900:	058a2018 	streq	r2, [sl, #24]
   13904:	05972014 	ldreq	r2, [r7, #20]
   13908:	12877010 	addne	r7, r7, #16
   1390c:	058a201c 	streq	r2, [sl, #28]
   13910:	128a2018 	addne	r2, sl, #24
   13914:	02877018 	addeq	r7, r7, #24
   13918:	028a2020 	addeq	r2, sl, #32
   1391c:	e5971000 	ldr	r1, [r7]
   13920:	e5821000 	str	r1, [r2]
   13924:	e5971004 	ldr	r1, [r7, #4]
   13928:	e5821004 	str	r1, [r2, #4]
   1392c:	e5971008 	ldr	r1, [r7, #8]
   13930:	e5821008 	str	r1, [r2, #8]
   13934:	e0433004 	sub	r3, r3, r4
   13938:	e08a2004 	add	r2, sl, r4
   1393c:	e3833001 	orr	r3, r3, #1
   13940:	e58b2008 	str	r2, [fp, #8]
   13944:	e5823004 	str	r3, [r2, #4]
   13948:	e59a3004 	ldr	r3, [sl, #4]
   1394c:	e2033001 	and	r3, r3, #1
   13950:	e1834004 	orr	r4, r3, r4
   13954:	e1a00008 	mov	r0, r8
   13958:	e58a4004 	str	r4, [sl, #4]
   1395c:	ebfffee1 	bl	134e8 <__malloc_unlock>
   13960:	eaffff0f 	b	135a4 <_realloc_r+0xa4>
   13964:	e0433004 	sub	r3, r3, r4
   13968:	e0855004 	add	r5, r5, r4
   1396c:	e3833001 	orr	r3, r3, #1
   13970:	e58b5008 	str	r5, [fp, #8]
   13974:	e5853004 	str	r3, [r5, #4]
   13978:	e5173004 	ldr	r3, [r7, #-4]
   1397c:	e2033001 	and	r3, r3, #1
   13980:	e1834004 	orr	r4, r3, r4
   13984:	e1a00008 	mov	r0, r8
   13988:	e5074004 	str	r4, [r7, #-4]
   1398c:	ebfffed5 	bl	134e8 <__malloc_unlock>
   13990:	e1a09007 	mov	r9, r7
   13994:	eaffff02 	b	135a4 <_realloc_r+0xa4>
   13998:	e1a01007 	mov	r1, r7
   1399c:	ebfff01a 	bl	fa0c <memmove>
   139a0:	eaffff3d 	b	1369c <_realloc_r+0x19c>
   139a4:	e5193004 	ldr	r3, [r9, #-4]
   139a8:	e3c33003 	bic	r3, r3, #3
   139ac:	e0866003 	add	r6, r6, r3
   139b0:	e1a09007 	mov	r9, r7
   139b4:	eafffeed 	b	13570 <_realloc_r+0x70>
   139b8:	e1a01007 	mov	r1, r7
   139bc:	e1a00009 	mov	r0, r9
   139c0:	e58d3004 	str	r3, [sp, #4]
   139c4:	ebfff010 	bl	fa0c <memmove>
   139c8:	e59d3004 	ldr	r3, [sp, #4]
   139cc:	eaffffd8 	b	13934 <_realloc_r+0x434>
   139d0:	000157ac 	.word	0x000157ac

000139d4 <_sbrk_r>:
   139d4:	e3a03000 	mov	r3, #0
   139d8:	e92d4070 	push	{r4, r5, r6, lr}
   139dc:	e59f4030 	ldr	r4, [pc, #48]	; 13a14 <_sbrk_r+0x40>
   139e0:	e1a05000 	mov	r5, r0
   139e4:	e1a00001 	mov	r0, r1
   139e8:	e5843000 	str	r3, [r4]
   139ec:	eb00034f 	bl	14730 <_sbrk>
   139f0:	e3700001 	cmn	r0, #1
   139f4:	0a000001 	beq	13a00 <_sbrk_r+0x2c>
   139f8:	e8bd4070 	pop	{r4, r5, r6, lr}
   139fc:	e12fff1e 	bx	lr
   13a00:	e5943000 	ldr	r3, [r4]
   13a04:	e3530000 	cmp	r3, #0
   13a08:	15853000 	strne	r3, [r5]
   13a0c:	e8bd4070 	pop	{r4, r5, r6, lr}
   13a10:	e12fff1e 	bx	lr
   13a14:	00015ee0 	.word	0x00015ee0

00013a18 <_init_signal_r.part.0>:
   13a18:	e92d4010 	push	{r4, lr}
   13a1c:	e3a01080 	mov	r1, #128	; 0x80
   13a20:	e1a04000 	mov	r4, r0
   13a24:	ebfffc62 	bl	12bb4 <_malloc_r>
   13a28:	e3500000 	cmp	r0, #0
   13a2c:	e58402dc 	str	r0, [r4, #732]	; 0x2dc
   13a30:	0a000008 	beq	13a58 <_init_signal_r.part.0+0x40>
   13a34:	e3a02000 	mov	r2, #0
   13a38:	e2403004 	sub	r3, r0, #4
   13a3c:	e280007c 	add	r0, r0, #124	; 0x7c
   13a40:	e5a32004 	str	r2, [r3, #4]!
   13a44:	e1530000 	cmp	r3, r0
   13a48:	1afffffc 	bne	13a40 <_init_signal_r.part.0+0x28>
   13a4c:	e3a00000 	mov	r0, #0
   13a50:	e8bd4010 	pop	{r4, lr}
   13a54:	e12fff1e 	bx	lr
   13a58:	e3e00000 	mvn	r0, #0
   13a5c:	eafffffb 	b	13a50 <_init_signal_r.part.0+0x38>

00013a60 <_init_signal_r>:
   13a60:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   13a64:	e3530000 	cmp	r3, #0
   13a68:	0a000001 	beq	13a74 <_init_signal_r+0x14>
   13a6c:	e3a00000 	mov	r0, #0
   13a70:	e12fff1e 	bx	lr
   13a74:	eaffffe7 	b	13a18 <_init_signal_r.part.0>

00013a78 <_signal_r>:
   13a78:	e351001f 	cmp	r1, #31
   13a7c:	e1a03000 	mov	r3, r0
   13a80:	8a000005 	bhi	13a9c <_signal_r+0x24>
   13a84:	e590c2dc 	ldr	ip, [r0, #732]	; 0x2dc
   13a88:	e35c0000 	cmp	ip, #0
   13a8c:	0a000006 	beq	13aac <_signal_r+0x34>
   13a90:	e79c0101 	ldr	r0, [ip, r1, lsl #2]
   13a94:	e78c2101 	str	r2, [ip, r1, lsl #2]
   13a98:	e12fff1e 	bx	lr
   13a9c:	e3a02016 	mov	r2, #22
   13aa0:	e3e00000 	mvn	r0, #0
   13aa4:	e5832000 	str	r2, [r3]
   13aa8:	e12fff1e 	bx	lr
   13aac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   13ab0:	e24dd014 	sub	sp, sp, #20
   13ab4:	e98d000e 	stmib	sp, {r1, r2, r3}
   13ab8:	ebffffd6 	bl	13a18 <_init_signal_r.part.0>
   13abc:	e3500000 	cmp	r0, #0
   13ac0:	13e00000 	mvnne	r0, #0
   13ac4:	059d300c 	ldreq	r3, [sp, #12]
   13ac8:	099d0006 	ldmibeq	sp, {r1, r2}
   13acc:	0593c2dc 	ldreq	ip, [r3, #732]	; 0x2dc
   13ad0:	079c0101 	ldreq	r0, [ip, r1, lsl #2]
   13ad4:	078c2101 	streq	r2, [ip, r1, lsl #2]
   13ad8:	e28dd014 	add	sp, sp, #20
   13adc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   13ae0:	e12fff1e 	bx	lr

00013ae4 <_raise_r>:
   13ae4:	e351001f 	cmp	r1, #31
   13ae8:	e92d4020 	push	{r5, lr}
   13aec:	83a03016 	movhi	r3, #22
   13af0:	e1a05000 	mov	r5, r0
   13af4:	e24dd008 	sub	sp, sp, #8
   13af8:	83e00000 	mvnhi	r0, #0
   13afc:	85853000 	strhi	r3, [r5]
   13b00:	8a000012 	bhi	13b50 <_raise_r+0x6c>
   13b04:	e59522dc 	ldr	r2, [r5, #732]	; 0x2dc
   13b08:	e3520000 	cmp	r2, #0
   13b0c:	0a000014 	beq	13b64 <_raise_r+0x80>
   13b10:	e7923101 	ldr	r3, [r2, r1, lsl #2]
   13b14:	e3530000 	cmp	r3, #0
   13b18:	0a000011 	beq	13b64 <_raise_r+0x80>
   13b1c:	e3530001 	cmp	r3, #1
   13b20:	0a00000d 	beq	13b5c <_raise_r+0x78>
   13b24:	e3730001 	cmn	r3, #1
   13b28:	03a03016 	moveq	r3, #22
   13b2c:	03a00001 	moveq	r0, #1
   13b30:	05853000 	streq	r3, [r5]
   13b34:	0a000005 	beq	13b50 <_raise_r+0x6c>
   13b38:	e3a05000 	mov	r5, #0
   13b3c:	e1a00001 	mov	r0, r1
   13b40:	e7825101 	str	r5, [r2, r1, lsl #2]
   13b44:	e1a0e00f 	mov	lr, pc
   13b48:	e12fff13 	bx	r3
   13b4c:	e1a00005 	mov	r0, r5
   13b50:	e28dd008 	add	sp, sp, #8
   13b54:	e8bd4020 	pop	{r5, lr}
   13b58:	e12fff1e 	bx	lr
   13b5c:	e3a00000 	mov	r0, #0
   13b60:	eafffffa 	b	13b50 <_raise_r+0x6c>
   13b64:	e1a00005 	mov	r0, r5
   13b68:	e58d1004 	str	r1, [sp, #4]
   13b6c:	eb000056 	bl	13ccc <_getpid_r>
   13b70:	e59d1004 	ldr	r1, [sp, #4]
   13b74:	e1a02001 	mov	r2, r1
   13b78:	e1a01000 	mov	r1, r0
   13b7c:	e1a00005 	mov	r0, r5
   13b80:	eb000040 	bl	13c88 <_kill_r>
   13b84:	eafffff1 	b	13b50 <_raise_r+0x6c>

00013b88 <__sigtramp_r>:
   13b88:	e351001f 	cmp	r1, #31
   13b8c:	8a000022 	bhi	13c1c <__sigtramp_r+0x94>
   13b90:	e92d4020 	push	{r5, lr}
   13b94:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   13b98:	e3530000 	cmp	r3, #0
   13b9c:	e24dd008 	sub	sp, sp, #8
   13ba0:	e1a05000 	mov	r5, r0
   13ba4:	0a000014 	beq	13bfc <__sigtramp_r+0x74>
   13ba8:	e7932101 	ldr	r2, [r3, r1, lsl #2]
   13bac:	e3520000 	cmp	r2, #0
   13bb0:	e0833101 	add	r3, r3, r1, lsl #2
   13bb4:	0a00000e 	beq	13bf4 <__sigtramp_r+0x6c>
   13bb8:	e3720001 	cmn	r2, #1
   13bbc:	03a00002 	moveq	r0, #2
   13bc0:	0a000008 	beq	13be8 <__sigtramp_r+0x60>
   13bc4:	e3520001 	cmp	r2, #1
   13bc8:	03a00003 	moveq	r0, #3
   13bcc:	0a000005 	beq	13be8 <__sigtramp_r+0x60>
   13bd0:	e3a05000 	mov	r5, #0
   13bd4:	e1a00001 	mov	r0, r1
   13bd8:	e5835000 	str	r5, [r3]
   13bdc:	e1a0e00f 	mov	lr, pc
   13be0:	e12fff12 	bx	r2
   13be4:	e1a00005 	mov	r0, r5
   13be8:	e28dd008 	add	sp, sp, #8
   13bec:	e8bd4020 	pop	{r5, lr}
   13bf0:	e12fff1e 	bx	lr
   13bf4:	e3a00001 	mov	r0, #1
   13bf8:	eafffffa 	b	13be8 <__sigtramp_r+0x60>
   13bfc:	e58d1004 	str	r1, [sp, #4]
   13c00:	ebffff84 	bl	13a18 <_init_signal_r.part.0>
   13c04:	e3500000 	cmp	r0, #0
   13c08:	059532dc 	ldreq	r3, [r5, #732]	; 0x2dc
   13c0c:	059d1004 	ldreq	r1, [sp, #4]
   13c10:	0affffe4 	beq	13ba8 <__sigtramp_r+0x20>
   13c14:	e3e00000 	mvn	r0, #0
   13c18:	eafffff2 	b	13be8 <__sigtramp_r+0x60>
   13c1c:	e3e00000 	mvn	r0, #0
   13c20:	e12fff1e 	bx	lr

00013c24 <raise>:
   13c24:	e59f3008 	ldr	r3, [pc, #8]	; 13c34 <raise+0x10>
   13c28:	e1a01000 	mov	r1, r0
   13c2c:	e5930000 	ldr	r0, [r3]
   13c30:	eaffffab 	b	13ae4 <_raise_r>
   13c34:	00015210 	.word	0x00015210

00013c38 <signal>:
   13c38:	e59f300c 	ldr	r3, [pc, #12]	; 13c4c <signal+0x14>
   13c3c:	e1a02001 	mov	r2, r1
   13c40:	e1a01000 	mov	r1, r0
   13c44:	e5930000 	ldr	r0, [r3]
   13c48:	eaffff8a 	b	13a78 <_signal_r>
   13c4c:	00015210 	.word	0x00015210

00013c50 <_init_signal>:
   13c50:	e59f3018 	ldr	r3, [pc, #24]	; 13c70 <_init_signal+0x20>
   13c54:	e5930000 	ldr	r0, [r3]
   13c58:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   13c5c:	e3530000 	cmp	r3, #0
   13c60:	0a000001 	beq	13c6c <_init_signal+0x1c>
   13c64:	e3a00000 	mov	r0, #0
   13c68:	e12fff1e 	bx	lr
   13c6c:	eaffff69 	b	13a18 <_init_signal_r.part.0>
   13c70:	00015210 	.word	0x00015210

00013c74 <__sigtramp>:
   13c74:	e59f3008 	ldr	r3, [pc, #8]	; 13c84 <__sigtramp+0x10>
   13c78:	e1a01000 	mov	r1, r0
   13c7c:	e5930000 	ldr	r0, [r3]
   13c80:	eaffffc0 	b	13b88 <__sigtramp_r>
   13c84:	00015210 	.word	0x00015210

00013c88 <_kill_r>:
   13c88:	e1a0c001 	mov	ip, r1
   13c8c:	e3a03000 	mov	r3, #0
   13c90:	e92d4070 	push	{r4, r5, r6, lr}
   13c94:	e59f402c 	ldr	r4, [pc, #44]	; 13cc8 <_kill_r+0x40>
   13c98:	e1a05000 	mov	r5, r0
   13c9c:	e1a01002 	mov	r1, r2
   13ca0:	e1a0000c 	mov	r0, ip
   13ca4:	e5843000 	str	r3, [r4]
   13ca8:	eb00028e 	bl	146e8 <_kill>
   13cac:	e3700001 	cmn	r0, #1
   13cb0:	1a000002 	bne	13cc0 <_kill_r+0x38>
   13cb4:	e5943000 	ldr	r3, [r4]
   13cb8:	e3530000 	cmp	r3, #0
   13cbc:	15853000 	strne	r3, [r5]
   13cc0:	e8bd4070 	pop	{r4, r5, r6, lr}
   13cc4:	e12fff1e 	bx	lr
   13cc8:	00015ee0 	.word	0x00015ee0

00013ccc <_getpid_r>:
   13ccc:	e92d4010 	push	{r4, lr}
   13cd0:	eb000278 	bl	146b8 <_getpid>
   13cd4:	e8bd4010 	pop	{r4, lr}
   13cd8:	e12fff1e 	bx	lr

00013cdc <__sread>:
   13cdc:	e92d4010 	push	{r4, lr}
   13ce0:	e1a04001 	mov	r4, r1
   13ce4:	e1d110fe 	ldrsh	r1, [r1, #14]
   13ce8:	eb000196 	bl	14348 <_read_r>
   13cec:	e3500000 	cmp	r0, #0
   13cf0:	a5943050 	ldrge	r3, [r4, #80]	; 0x50
   13cf4:	b1d430bc 	ldrhlt	r3, [r4, #12]
   13cf8:	a0833000 	addge	r3, r3, r0
   13cfc:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
   13d00:	a5843050 	strge	r3, [r4, #80]	; 0x50
   13d04:	b1c430bc 	strhlt	r3, [r4, #12]
   13d08:	e8bd4010 	pop	{r4, lr}
   13d0c:	e12fff1e 	bx	lr

00013d10 <__seofread>:
   13d10:	e3a00000 	mov	r0, #0
   13d14:	e12fff1e 	bx	lr

00013d18 <__swrite>:
   13d18:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   13d1c:	e1a04001 	mov	r4, r1
   13d20:	e1d110fc 	ldrsh	r1, [r1, #12]
   13d24:	e3110c01 	tst	r1, #256	; 0x100
   13d28:	e1a06002 	mov	r6, r2
   13d2c:	e1a07003 	mov	r7, r3
   13d30:	e1a05000 	mov	r5, r0
   13d34:	0a000004 	beq	13d4c <__swrite+0x34>
   13d38:	e1d410fe 	ldrsh	r1, [r4, #14]
   13d3c:	e3a03002 	mov	r3, #2
   13d40:	e3a02000 	mov	r2, #0
   13d44:	eb00016d 	bl	14300 <_lseek_r>
   13d48:	e1d410fc 	ldrsh	r1, [r4, #12]
   13d4c:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
   13d50:	e1c410bc 	strh	r1, [r4, #12]
   13d54:	e1a03007 	mov	r3, r7
   13d58:	e1a02006 	mov	r2, r6
   13d5c:	e1d410fe 	ldrsh	r1, [r4, #14]
   13d60:	e1a00005 	mov	r0, r5
   13d64:	eb0000c7 	bl	14088 <_write_r>
   13d68:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   13d6c:	e12fff1e 	bx	lr

00013d70 <__sseek>:
   13d70:	e92d4010 	push	{r4, lr}
   13d74:	e1a04001 	mov	r4, r1
   13d78:	e1d110fe 	ldrsh	r1, [r1, #14]
   13d7c:	eb00015f 	bl	14300 <_lseek_r>
   13d80:	e1d430bc 	ldrh	r3, [r4, #12]
   13d84:	e3700001 	cmn	r0, #1
   13d88:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
   13d8c:	13833a01 	orrne	r3, r3, #4096	; 0x1000
   13d90:	15840050 	strne	r0, [r4, #80]	; 0x50
   13d94:	e1c430bc 	strh	r3, [r4, #12]
   13d98:	e8bd4010 	pop	{r4, lr}
   13d9c:	e12fff1e 	bx	lr

00013da0 <__sclose>:
   13da0:	e92d4010 	push	{r4, lr}
   13da4:	e1d110fe 	ldrsh	r1, [r1, #14]
   13da8:	eb0000c8 	bl	140d0 <_close_r>
   13dac:	e8bd4010 	pop	{r4, lr}
   13db0:	e12fff1e 	bx	lr

00013db4 <__swbuf_r>:
   13db4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   13db8:	e2506000 	subs	r6, r0, #0
   13dbc:	e1a05001 	mov	r5, r1
   13dc0:	e1a04002 	mov	r4, r2
   13dc4:	0a000002 	beq	13dd4 <__swbuf_r+0x20>
   13dc8:	e5963038 	ldr	r3, [r6, #56]	; 0x38
   13dcc:	e3530000 	cmp	r3, #0
   13dd0:	0a000042 	beq	13ee0 <__swbuf_r+0x12c>
   13dd4:	e1d410fc 	ldrsh	r1, [r4, #12]
   13dd8:	e5940018 	ldr	r0, [r4, #24]
   13ddc:	e1a03801 	lsl	r3, r1, #16
   13de0:	e3130702 	tst	r3, #524288	; 0x80000
   13de4:	e1a02823 	lsr	r2, r3, #16
   13de8:	e5840008 	str	r0, [r4, #8]
   13dec:	0a000022 	beq	13e7c <__swbuf_r+0xc8>
   13df0:	e5943010 	ldr	r3, [r4, #16]
   13df4:	e3530000 	cmp	r3, #0
   13df8:	0a00001f 	beq	13e7c <__swbuf_r+0xc8>
   13dfc:	e3120a02 	tst	r2, #8192	; 0x2000
   13e00:	05942064 	ldreq	r2, [r4, #100]	; 0x64
   13e04:	03c22a02 	biceq	r2, r2, #8192	; 0x2000
   13e08:	03811a02 	orreq	r1, r1, #8192	; 0x2000
   13e0c:	05842064 	streq	r2, [r4, #100]	; 0x64
   13e10:	e5942000 	ldr	r2, [r4]
   13e14:	01c410bc 	strheq	r1, [r4, #12]
   13e18:	e5941014 	ldr	r1, [r4, #20]
   13e1c:	e0423003 	sub	r3, r2, r3
   13e20:	e20550ff 	and	r5, r5, #255	; 0xff
   13e24:	e1530001 	cmp	r3, r1
   13e28:	e1a07005 	mov	r7, r5
   13e2c:	b2833001 	addlt	r3, r3, #1
   13e30:	aa000022 	bge	13ec0 <__swbuf_r+0x10c>
   13e34:	e5941008 	ldr	r1, [r4, #8]
   13e38:	e2820001 	add	r0, r2, #1
   13e3c:	e2411001 	sub	r1, r1, #1
   13e40:	e5841008 	str	r1, [r4, #8]
   13e44:	e5840000 	str	r0, [r4]
   13e48:	e5c25000 	strb	r5, [r2]
   13e4c:	e5942014 	ldr	r2, [r4, #20]
   13e50:	e1520003 	cmp	r2, r3
   13e54:	0a000012 	beq	13ea4 <__swbuf_r+0xf0>
   13e58:	e1d430bc 	ldrh	r3, [r4, #12]
   13e5c:	e355000a 	cmp	r5, #10
   13e60:	13a05000 	movne	r5, #0
   13e64:	02035001 	andeq	r5, r3, #1
   13e68:	e3550000 	cmp	r5, #0
   13e6c:	1a00000c 	bne	13ea4 <__swbuf_r+0xf0>
   13e70:	e1a00007 	mov	r0, r7
   13e74:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   13e78:	e12fff1e 	bx	lr
   13e7c:	e1a01004 	mov	r1, r4
   13e80:	e1a00006 	mov	r0, r6
   13e84:	ebfff58a 	bl	114b4 <__swsetup_r>
   13e88:	e3500000 	cmp	r0, #0
   13e8c:	1a000009 	bne	13eb8 <__swbuf_r+0x104>
   13e90:	e1d410fc 	ldrsh	r1, [r4, #12]
   13e94:	e1a02801 	lsl	r2, r1, #16
   13e98:	e5943010 	ldr	r3, [r4, #16]
   13e9c:	e1a02822 	lsr	r2, r2, #16
   13ea0:	eaffffd5 	b	13dfc <__swbuf_r+0x48>
   13ea4:	e1a01004 	mov	r1, r4
   13ea8:	e1a00006 	mov	r0, r6
   13eac:	ebfff66d 	bl	11868 <_fflush_r>
   13eb0:	e3500000 	cmp	r0, #0
   13eb4:	0affffed 	beq	13e70 <__swbuf_r+0xbc>
   13eb8:	e3e07000 	mvn	r7, #0
   13ebc:	eaffffeb 	b	13e70 <__swbuf_r+0xbc>
   13ec0:	e1a01004 	mov	r1, r4
   13ec4:	e1a00006 	mov	r0, r6
   13ec8:	ebfff666 	bl	11868 <_fflush_r>
   13ecc:	e3500000 	cmp	r0, #0
   13ed0:	1afffff8 	bne	13eb8 <__swbuf_r+0x104>
   13ed4:	e3a03001 	mov	r3, #1
   13ed8:	e5942000 	ldr	r2, [r4]
   13edc:	eaffffd4 	b	13e34 <__swbuf_r+0x80>
   13ee0:	ebfff6f5 	bl	11abc <__sinit>
   13ee4:	eaffffba 	b	13dd4 <__swbuf_r+0x20>

00013ee8 <__swbuf>:
   13ee8:	e59f300c 	ldr	r3, [pc, #12]	; 13efc <__swbuf+0x14>
   13eec:	e1a02001 	mov	r2, r1
   13ef0:	e1a01000 	mov	r1, r0
   13ef4:	e5930000 	ldr	r0, [r3]
   13ef8:	eaffffad 	b	13db4 <__swbuf_r>
   13efc:	00015210 	.word	0x00015210

00013f00 <_wcrtomb_r>:
   13f00:	e92d4070 	push	{r4, r5, r6, lr}
   13f04:	e251c000 	subs	ip, r1, #0
   13f08:	e24dd010 	sub	sp, sp, #16
   13f0c:	e1a05000 	mov	r5, r0
   13f10:	e1a06003 	mov	r6, r3
   13f14:	0a000010 	beq	13f5c <_wcrtomb_r+0x5c>
   13f18:	e59fc06c 	ldr	ip, [pc, #108]	; 13f8c <_wcrtomb_r+0x8c>
   13f1c:	e59cc000 	ldr	ip, [ip]
   13f20:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   13f24:	e59fe064 	ldr	lr, [pc, #100]	; 13f90 <_wcrtomb_r+0x90>
   13f28:	e35c0000 	cmp	ip, #0
   13f2c:	01a0c00e 	moveq	ip, lr
   13f30:	e59c40e0 	ldr	r4, [ip, #224]	; 0xe0
   13f34:	e1a0e00f 	mov	lr, pc
   13f38:	e12fff14 	bx	r4
   13f3c:	e3700001 	cmn	r0, #1
   13f40:	03a02000 	moveq	r2, #0
   13f44:	03a0308a 	moveq	r3, #138	; 0x8a
   13f48:	05862000 	streq	r2, [r6]
   13f4c:	05853000 	streq	r3, [r5]
   13f50:	e28dd010 	add	sp, sp, #16
   13f54:	e8bd4070 	pop	{r4, r5, r6, lr}
   13f58:	e12fff1e 	bx	lr
   13f5c:	e59f2028 	ldr	r2, [pc, #40]	; 13f8c <_wcrtomb_r+0x8c>
   13f60:	e5921000 	ldr	r1, [r2]
   13f64:	e5911034 	ldr	r1, [r1, #52]	; 0x34
   13f68:	e59f2020 	ldr	r2, [pc, #32]	; 13f90 <_wcrtomb_r+0x90>
   13f6c:	e3510000 	cmp	r1, #0
   13f70:	01a01002 	moveq	r1, r2
   13f74:	e1a0200c 	mov	r2, ip
   13f78:	e59140e0 	ldr	r4, [r1, #224]	; 0xe0
   13f7c:	e28d1004 	add	r1, sp, #4
   13f80:	e1a0e00f 	mov	lr, pc
   13f84:	e12fff14 	bx	r4
   13f88:	eaffffeb 	b	13f3c <_wcrtomb_r+0x3c>
   13f8c:	00015210 	.word	0x00015210
   13f90:	00015640 	.word	0x00015640

00013f94 <wcrtomb>:
   13f94:	e92d4070 	push	{r4, r5, r6, lr}
   13f98:	e59f3084 	ldr	r3, [pc, #132]	; 14024 <wcrtomb+0x90>
   13f9c:	e5934000 	ldr	r4, [r3]
   13fa0:	e3500000 	cmp	r0, #0
   13fa4:	e1a05002 	mov	r5, r2
   13fa8:	e24dd010 	sub	sp, sp, #16
   13fac:	e5943034 	ldr	r3, [r4, #52]	; 0x34
   13fb0:	e59f2070 	ldr	r2, [pc, #112]	; 14028 <wcrtomb+0x94>
   13fb4:	0a000010 	beq	13ffc <wcrtomb+0x68>
   13fb8:	e3530000 	cmp	r3, #0
   13fbc:	01a03002 	moveq	r3, r2
   13fc0:	e1a02001 	mov	r2, r1
   13fc4:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   13fc8:	e1a01000 	mov	r1, r0
   13fcc:	e1a03005 	mov	r3, r5
   13fd0:	e1a00004 	mov	r0, r4
   13fd4:	e1a0e00f 	mov	lr, pc
   13fd8:	e12fff16 	bx	r6
   13fdc:	e3700001 	cmn	r0, #1
   13fe0:	03a02000 	moveq	r2, #0
   13fe4:	03a0308a 	moveq	r3, #138	; 0x8a
   13fe8:	05852000 	streq	r2, [r5]
   13fec:	05843000 	streq	r3, [r4]
   13ff0:	e28dd010 	add	sp, sp, #16
   13ff4:	e8bd4070 	pop	{r4, r5, r6, lr}
   13ff8:	e12fff1e 	bx	lr
   13ffc:	e3530000 	cmp	r3, #0
   14000:	01a03002 	moveq	r3, r2
   14004:	e28d1004 	add	r1, sp, #4
   14008:	e1a02000 	mov	r2, r0
   1400c:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   14010:	e1a00004 	mov	r0, r4
   14014:	e1a03005 	mov	r3, r5
   14018:	e1a0e00f 	mov	lr, pc
   1401c:	e12fff16 	bx	r6
   14020:	eaffffed 	b	13fdc <wcrtomb+0x48>
   14024:	00015210 	.word	0x00015210
   14028:	00015640 	.word	0x00015640

0001402c <_wctomb_r>:
   1402c:	e59fc024 	ldr	ip, [pc, #36]	; 14058 <_wctomb_r+0x2c>
   14030:	e59cc000 	ldr	ip, [ip]
   14034:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   14038:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   1403c:	e59fe018 	ldr	lr, [pc, #24]	; 1405c <_wctomb_r+0x30>
   14040:	e35c0000 	cmp	ip, #0
   14044:	01a0c00e 	moveq	ip, lr
   14048:	e59ce0e0 	ldr	lr, [ip, #224]	; 0xe0
   1404c:	e1a0c00e 	mov	ip, lr
   14050:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   14054:	e12fff1c 	bx	ip
   14058:	00015210 	.word	0x00015210
   1405c:	00015640 	.word	0x00015640

00014060 <__ascii_wctomb>:
   14060:	e3510000 	cmp	r1, #0
   14064:	0a000005 	beq	14080 <__ascii_wctomb+0x20>
   14068:	e35200ff 	cmp	r2, #255	; 0xff
   1406c:	83a0308a 	movhi	r3, #138	; 0x8a
   14070:	95c12000 	strbls	r2, [r1]
   14074:	83e01000 	mvnhi	r1, #0
   14078:	93a01001 	movls	r1, #1
   1407c:	85803000 	strhi	r3, [r0]
   14080:	e1a00001 	mov	r0, r1
   14084:	e12fff1e 	bx	lr

00014088 <_write_r>:
   14088:	e92d4070 	push	{r4, r5, r6, lr}
   1408c:	e1a0e001 	mov	lr, r1
   14090:	e3a0c000 	mov	ip, #0
   14094:	e59f4030 	ldr	r4, [pc, #48]	; 140cc <_write_r+0x44>
   14098:	e1a01002 	mov	r1, r2
   1409c:	e1a05000 	mov	r5, r0
   140a0:	e1a02003 	mov	r2, r3
   140a4:	e1a0000e 	mov	r0, lr
   140a8:	e584c000 	str	ip, [r4]
   140ac:	eb0001aa 	bl	1475c <_write>
   140b0:	e3700001 	cmn	r0, #1
   140b4:	1a000002 	bne	140c4 <_write_r+0x3c>
   140b8:	e5943000 	ldr	r3, [r4]
   140bc:	e3530000 	cmp	r3, #0
   140c0:	15853000 	strne	r3, [r5]
   140c4:	e8bd4070 	pop	{r4, r5, r6, lr}
   140c8:	e12fff1e 	bx	lr
   140cc:	00015ee0 	.word	0x00015ee0

000140d0 <_close_r>:
   140d0:	e3a03000 	mov	r3, #0
   140d4:	e92d4070 	push	{r4, r5, r6, lr}
   140d8:	e59f4028 	ldr	r4, [pc, #40]	; 14108 <_close_r+0x38>
   140dc:	e1a05000 	mov	r5, r0
   140e0:	e1a00001 	mov	r0, r1
   140e4:	e5843000 	str	r3, [r4]
   140e8:	eb000166 	bl	14688 <_close>
   140ec:	e3700001 	cmn	r0, #1
   140f0:	1a000002 	bne	14100 <_close_r+0x30>
   140f4:	e5943000 	ldr	r3, [r4]
   140f8:	e3530000 	cmp	r3, #0
   140fc:	15853000 	strne	r3, [r5]
   14100:	e8bd4070 	pop	{r4, r5, r6, lr}
   14104:	e12fff1e 	bx	lr
   14108:	00015ee0 	.word	0x00015ee0

0001410c <_fclose_r>:
   1410c:	e92d4070 	push	{r4, r5, r6, lr}
   14110:	e2514000 	subs	r4, r1, #0
   14114:	0a00000b 	beq	14148 <_fclose_r+0x3c>
   14118:	e3500000 	cmp	r0, #0
   1411c:	e1a06000 	mov	r6, r0
   14120:	0a000002 	beq	14130 <_fclose_r+0x24>
   14124:	e5903038 	ldr	r3, [r0, #56]	; 0x38
   14128:	e3530000 	cmp	r3, #0
   1412c:	0a000038 	beq	14214 <_fclose_r+0x108>
   14130:	e5943064 	ldr	r3, [r4, #100]	; 0x64
   14134:	e3130001 	tst	r3, #1
   14138:	0a000006 	beq	14158 <_fclose_r+0x4c>
   1413c:	e1d430fc 	ldrsh	r3, [r4, #12]
   14140:	e3530000 	cmp	r3, #0
   14144:	1a000006 	bne	14164 <_fclose_r+0x58>
   14148:	e3a05000 	mov	r5, #0
   1414c:	e1a00005 	mov	r0, r5
   14150:	e8bd4070 	pop	{r4, r5, r6, lr}
   14154:	e12fff1e 	bx	lr
   14158:	e1d430bc 	ldrh	r3, [r4, #12]
   1415c:	e3130c02 	tst	r3, #512	; 0x200
   14160:	0a000034 	beq	14238 <_fclose_r+0x12c>
   14164:	e1a01004 	mov	r1, r4
   14168:	e1a00006 	mov	r0, r6
   1416c:	ebfff52e 	bl	1162c <__sflush_r>
   14170:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
   14174:	e3530000 	cmp	r3, #0
   14178:	e1a05000 	mov	r5, r0
   1417c:	0a000005 	beq	14198 <_fclose_r+0x8c>
   14180:	e594101c 	ldr	r1, [r4, #28]
   14184:	e1a00006 	mov	r0, r6
   14188:	e1a0e00f 	mov	lr, pc
   1418c:	e12fff13 	bx	r3
   14190:	e3500000 	cmp	r0, #0
   14194:	b3e05000 	mvnlt	r5, #0
   14198:	e1d430bc 	ldrh	r3, [r4, #12]
   1419c:	e3130080 	tst	r3, #128	; 0x80
   141a0:	1a00001d 	bne	1421c <_fclose_r+0x110>
   141a4:	e5941030 	ldr	r1, [r4, #48]	; 0x30
   141a8:	e3510000 	cmp	r1, #0
   141ac:	0a000005 	beq	141c8 <_fclose_r+0xbc>
   141b0:	e2843040 	add	r3, r4, #64	; 0x40
   141b4:	e1510003 	cmp	r1, r3
   141b8:	11a00006 	movne	r0, r6
   141bc:	1bfff79f 	blne	12040 <_free_r>
   141c0:	e3a03000 	mov	r3, #0
   141c4:	e5843030 	str	r3, [r4, #48]	; 0x30
   141c8:	e5941044 	ldr	r1, [r4, #68]	; 0x44
   141cc:	e3510000 	cmp	r1, #0
   141d0:	0a000003 	beq	141e4 <_fclose_r+0xd8>
   141d4:	e1a00006 	mov	r0, r6
   141d8:	ebfff798 	bl	12040 <_free_r>
   141dc:	e3a03000 	mov	r3, #0
   141e0:	e5843044 	str	r3, [r4, #68]	; 0x44
   141e4:	ebfff6a1 	bl	11c70 <__sfp_lock_acquire>
   141e8:	e3a03000 	mov	r3, #0
   141ec:	e5942064 	ldr	r2, [r4, #100]	; 0x64
   141f0:	e3120001 	tst	r2, #1
   141f4:	e1c430bc 	strh	r3, [r4, #12]
   141f8:	0a00000b 	beq	1422c <_fclose_r+0x120>
   141fc:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   14200:	ebfff9fa 	bl	129f0 <__retarget_lock_close_recursive>
   14204:	ebfff69f 	bl	11c88 <__sfp_lock_release>
   14208:	e1a00005 	mov	r0, r5
   1420c:	e8bd4070 	pop	{r4, r5, r6, lr}
   14210:	e12fff1e 	bx	lr
   14214:	ebfff628 	bl	11abc <__sinit>
   14218:	eaffffc4 	b	14130 <_fclose_r+0x24>
   1421c:	e5941010 	ldr	r1, [r4, #16]
   14220:	e1a00006 	mov	r0, r6
   14224:	ebfff785 	bl	12040 <_free_r>
   14228:	eaffffdd 	b	141a4 <_fclose_r+0x98>
   1422c:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   14230:	ebfff9f6 	bl	12a10 <__retarget_lock_release_recursive>
   14234:	eafffff0 	b	141fc <_fclose_r+0xf0>
   14238:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   1423c:	ebfff9ed 	bl	129f8 <__retarget_lock_acquire_recursive>
   14240:	e1d430fc 	ldrsh	r3, [r4, #12]
   14244:	e3530000 	cmp	r3, #0
   14248:	1affffc5 	bne	14164 <_fclose_r+0x58>
   1424c:	e5945064 	ldr	r5, [r4, #100]	; 0x64
   14250:	e2155001 	ands	r5, r5, #1
   14254:	1affffbb 	bne	14148 <_fclose_r+0x3c>
   14258:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   1425c:	ebfff9eb 	bl	12a10 <__retarget_lock_release_recursive>
   14260:	e1a00005 	mov	r0, r5
   14264:	e8bd4070 	pop	{r4, r5, r6, lr}
   14268:	e12fff1e 	bx	lr

0001426c <fclose>:
   1426c:	e59f3008 	ldr	r3, [pc, #8]	; 1427c <fclose+0x10>
   14270:	e1a01000 	mov	r1, r0
   14274:	e5930000 	ldr	r0, [r3]
   14278:	eaffffa3 	b	1410c <_fclose_r>
   1427c:	00015210 	.word	0x00015210

00014280 <_fstat_r>:
   14280:	e1a0c001 	mov	ip, r1
   14284:	e3a03000 	mov	r3, #0
   14288:	e92d4070 	push	{r4, r5, r6, lr}
   1428c:	e59f402c 	ldr	r4, [pc, #44]	; 142c0 <_fstat_r+0x40>
   14290:	e1a05000 	mov	r5, r0
   14294:	e1a01002 	mov	r1, r2
   14298:	e1a0000c 	mov	r0, ip
   1429c:	e5843000 	str	r3, [r4]
   142a0:	eb0000fe 	bl	146a0 <_fstat>
   142a4:	e3700001 	cmn	r0, #1
   142a8:	1a000002 	bne	142b8 <_fstat_r+0x38>
   142ac:	e5943000 	ldr	r3, [r4]
   142b0:	e3530000 	cmp	r3, #0
   142b4:	15853000 	strne	r3, [r5]
   142b8:	e8bd4070 	pop	{r4, r5, r6, lr}
   142bc:	e12fff1e 	bx	lr
   142c0:	00015ee0 	.word	0x00015ee0

000142c4 <_isatty_r>:
   142c4:	e3a03000 	mov	r3, #0
   142c8:	e92d4070 	push	{r4, r5, r6, lr}
   142cc:	e59f4028 	ldr	r4, [pc, #40]	; 142fc <_isatty_r+0x38>
   142d0:	e1a05000 	mov	r5, r0
   142d4:	e1a00001 	mov	r0, r1
   142d8:	e5843000 	str	r3, [r4]
   142dc:	eb0000fb 	bl	146d0 <_isatty>
   142e0:	e3700001 	cmn	r0, #1
   142e4:	1a000002 	bne	142f4 <_isatty_r+0x30>
   142e8:	e5943000 	ldr	r3, [r4]
   142ec:	e3530000 	cmp	r3, #0
   142f0:	15853000 	strne	r3, [r5]
   142f4:	e8bd4070 	pop	{r4, r5, r6, lr}
   142f8:	e12fff1e 	bx	lr
   142fc:	00015ee0 	.word	0x00015ee0

00014300 <_lseek_r>:
   14300:	e92d4070 	push	{r4, r5, r6, lr}
   14304:	e1a0e001 	mov	lr, r1
   14308:	e3a0c000 	mov	ip, #0
   1430c:	e59f4030 	ldr	r4, [pc, #48]	; 14344 <_lseek_r+0x44>
   14310:	e1a01002 	mov	r1, r2
   14314:	e1a05000 	mov	r5, r0
   14318:	e1a02003 	mov	r2, r3
   1431c:	e1a0000e 	mov	r0, lr
   14320:	e584c000 	str	ip, [r4]
   14324:	eb0000f5 	bl	14700 <_lseek>
   14328:	e3700001 	cmn	r0, #1
   1432c:	1a000002 	bne	1433c <_lseek_r+0x3c>
   14330:	e5943000 	ldr	r3, [r4]
   14334:	e3530000 	cmp	r3, #0
   14338:	15853000 	strne	r3, [r5]
   1433c:	e8bd4070 	pop	{r4, r5, r6, lr}
   14340:	e12fff1e 	bx	lr
   14344:	00015ee0 	.word	0x00015ee0

00014348 <_read_r>:
   14348:	e92d4070 	push	{r4, r5, r6, lr}
   1434c:	e1a0e001 	mov	lr, r1
   14350:	e3a0c000 	mov	ip, #0
   14354:	e59f4030 	ldr	r4, [pc, #48]	; 1438c <_read_r+0x44>
   14358:	e1a01002 	mov	r1, r2
   1435c:	e1a05000 	mov	r5, r0
   14360:	e1a02003 	mov	r2, r3
   14364:	e1a0000e 	mov	r0, lr
   14368:	e584c000 	str	ip, [r4]
   1436c:	eb0000e9 	bl	14718 <_read>
   14370:	e3700001 	cmn	r0, #1
   14374:	1a000002 	bne	14384 <_read_r+0x3c>
   14378:	e5943000 	ldr	r3, [r4]
   1437c:	e3530000 	cmp	r3, #0
   14380:	15853000 	strne	r3, [r5]
   14384:	e8bd4070 	pop	{r4, r5, r6, lr}
   14388:	e12fff1e 	bx	lr
   1438c:	00015ee0 	.word	0x00015ee0

00014390 <cleanup_glue>:
   14390:	e92d4070 	push	{r4, r5, r6, lr}
   14394:	e1a04001 	mov	r4, r1
   14398:	e5911000 	ldr	r1, [r1]
   1439c:	e3510000 	cmp	r1, #0
   143a0:	e1a05000 	mov	r5, r0
   143a4:	1bfffff9 	blne	14390 <cleanup_glue>
   143a8:	e1a01004 	mov	r1, r4
   143ac:	e1a00005 	mov	r0, r5
   143b0:	ebfff722 	bl	12040 <_free_r>
   143b4:	e8bd4070 	pop	{r4, r5, r6, lr}
   143b8:	e12fff1e 	bx	lr

000143bc <_reclaim_reent>:
   143bc:	e59f30e8 	ldr	r3, [pc, #232]	; 144ac <_reclaim_reent+0xf0>
   143c0:	e5933000 	ldr	r3, [r3]
   143c4:	e1530000 	cmp	r3, r0
   143c8:	012fff1e 	bxeq	lr
   143cc:	e590304c 	ldr	r3, [r0, #76]	; 0x4c
   143d0:	e3530000 	cmp	r3, #0
   143d4:	e92d4070 	push	{r4, r5, r6, lr}
   143d8:	e1a05000 	mov	r5, r0
   143dc:	0a00000f 	beq	14420 <_reclaim_reent+0x64>
   143e0:	e3a06000 	mov	r6, #0
   143e4:	e7931006 	ldr	r1, [r3, r6]
   143e8:	e3510000 	cmp	r1, #0
   143ec:	0a000005 	beq	14408 <_reclaim_reent+0x4c>
   143f0:	e5914000 	ldr	r4, [r1]
   143f4:	e1a00005 	mov	r0, r5
   143f8:	ebfff710 	bl	12040 <_free_r>
   143fc:	e2541000 	subs	r1, r4, #0
   14400:	1afffffa 	bne	143f0 <_reclaim_reent+0x34>
   14404:	e595304c 	ldr	r3, [r5, #76]	; 0x4c
   14408:	e2866004 	add	r6, r6, #4
   1440c:	e3560080 	cmp	r6, #128	; 0x80
   14410:	1afffff3 	bne	143e4 <_reclaim_reent+0x28>
   14414:	e1a01003 	mov	r1, r3
   14418:	e1a00005 	mov	r0, r5
   1441c:	ebfff707 	bl	12040 <_free_r>
   14420:	e5951040 	ldr	r1, [r5, #64]	; 0x40
   14424:	e3510000 	cmp	r1, #0
   14428:	11a00005 	movne	r0, r5
   1442c:	1bfff703 	blne	12040 <_free_r>
   14430:	e5951148 	ldr	r1, [r5, #328]	; 0x148
   14434:	e3510000 	cmp	r1, #0
   14438:	0a000008 	beq	14460 <_reclaim_reent+0xa4>
   1443c:	e2856f53 	add	r6, r5, #332	; 0x14c
   14440:	e1510006 	cmp	r1, r6
   14444:	0a000005 	beq	14460 <_reclaim_reent+0xa4>
   14448:	e5914000 	ldr	r4, [r1]
   1444c:	e1a00005 	mov	r0, r5
   14450:	ebfff6fa 	bl	12040 <_free_r>
   14454:	e1560004 	cmp	r6, r4
   14458:	e1a01004 	mov	r1, r4
   1445c:	1afffff9 	bne	14448 <_reclaim_reent+0x8c>
   14460:	e5951054 	ldr	r1, [r5, #84]	; 0x54
   14464:	e3510000 	cmp	r1, #0
   14468:	11a00005 	movne	r0, r5
   1446c:	1bfff6f3 	blne	12040 <_free_r>
   14470:	e5953038 	ldr	r3, [r5, #56]	; 0x38
   14474:	e3530000 	cmp	r3, #0
   14478:	1a000001 	bne	14484 <_reclaim_reent+0xc8>
   1447c:	e8bd4070 	pop	{r4, r5, r6, lr}
   14480:	e12fff1e 	bx	lr
   14484:	e595303c 	ldr	r3, [r5, #60]	; 0x3c
   14488:	e1a00005 	mov	r0, r5
   1448c:	e1a0e00f 	mov	lr, pc
   14490:	e12fff13 	bx	r3
   14494:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
   14498:	e3510000 	cmp	r1, #0
   1449c:	0afffff6 	beq	1447c <_reclaim_reent+0xc0>
   144a0:	e1a00005 	mov	r0, r5
   144a4:	e8bd4070 	pop	{r4, r5, r6, lr}
   144a8:	eaffffb8 	b	14390 <cleanup_glue>
   144ac:	00015210 	.word	0x00015210

000144b0 <__aeabi_uldivmod>:
   144b0:	e3530000 	cmp	r3, #0
   144b4:	03520000 	cmpeq	r2, #0
   144b8:	1a000004 	bne	144d0 <__aeabi_uldivmod+0x20>
   144bc:	e3510000 	cmp	r1, #0
   144c0:	03500000 	cmpeq	r0, #0
   144c4:	13e01000 	mvnne	r1, #0
   144c8:	13e00000 	mvnne	r0, #0
   144cc:	eaffeb4b 	b	f200 <__aeabi_idiv0>
   144d0:	e24dd008 	sub	sp, sp, #8
   144d4:	e92d6000 	push	{sp, lr}
   144d8:	eb000003 	bl	144ec <__udivmoddi4>
   144dc:	e59de004 	ldr	lr, [sp, #4]
   144e0:	e28dd008 	add	sp, sp, #8
   144e4:	e8bd000c 	pop	{r2, r3}
   144e8:	e12fff1e 	bx	lr

000144ec <__udivmoddi4>:
   144ec:	e1510003 	cmp	r1, r3
   144f0:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   144f4:	01500002 	cmpeq	r0, r2
   144f8:	e1a04000 	mov	r4, r0
   144fc:	e1a05001 	mov	r5, r1
   14500:	e59da028 	ldr	sl, [sp, #40]	; 0x28
   14504:	33a00000 	movcc	r0, #0
   14508:	33a01000 	movcc	r1, #0
   1450c:	3a00003d 	bcc	14608 <__udivmoddi4+0x11c>
   14510:	e1a00002 	mov	r0, r2
   14514:	e1a01003 	mov	r1, r3
   14518:	e1a08002 	mov	r8, r2
   1451c:	e1a09003 	mov	r9, r3
   14520:	eb00003c 	bl	14618 <__clzdi2>
   14524:	e1a01005 	mov	r1, r5
   14528:	e1a0b000 	mov	fp, r0
   1452c:	e1a00004 	mov	r0, r4
   14530:	eb000038 	bl	14618 <__clzdi2>
   14534:	e04bb000 	sub	fp, fp, r0
   14538:	e24b2020 	sub	r2, fp, #32
   1453c:	e1a07b19 	lsl	r7, r9, fp
   14540:	e1877218 	orr	r7, r7, r8, lsl r2
   14544:	e26bc020 	rsb	ip, fp, #32
   14548:	e1877c38 	orr	r7, r7, r8, lsr ip
   1454c:	e1550007 	cmp	r5, r7
   14550:	e1a06b18 	lsl	r6, r8, fp
   14554:	01540006 	cmpeq	r4, r6
   14558:	33a00000 	movcc	r0, #0
   1455c:	33a01000 	movcc	r1, #0
   14560:	3a000005 	bcc	1457c <__udivmoddi4+0x90>
   14564:	e3a0e001 	mov	lr, #1
   14568:	e0544006 	subs	r4, r4, r6
   1456c:	e1a0121e 	lsl	r1, lr, r2
   14570:	e1811c3e 	orr	r1, r1, lr, lsr ip
   14574:	e0c55007 	sbc	r5, r5, r7
   14578:	e1a00b1e 	lsl	r0, lr, fp
   1457c:	e35b0000 	cmp	fp, #0
   14580:	0a000020 	beq	14608 <__udivmoddi4+0x11c>
   14584:	e1b070a7 	lsrs	r7, r7, #1
   14588:	e1a06066 	rrx	r6, r6
   1458c:	e1a0e00b 	mov	lr, fp
   14590:	ea000007 	b	145b4 <__udivmoddi4+0xc8>
   14594:	e0544006 	subs	r4, r4, r6
   14598:	e0c55007 	sbc	r5, r5, r7
   1459c:	e0944004 	adds	r4, r4, r4
   145a0:	e0a55005 	adc	r5, r5, r5
   145a4:	e2944001 	adds	r4, r4, #1
   145a8:	e2a55000 	adc	r5, r5, #0
   145ac:	e25ee001 	subs	lr, lr, #1
   145b0:	0a000006 	beq	145d0 <__udivmoddi4+0xe4>
   145b4:	e1550007 	cmp	r5, r7
   145b8:	01540006 	cmpeq	r4, r6
   145bc:	2afffff4 	bcs	14594 <__udivmoddi4+0xa8>
   145c0:	e0944004 	adds	r4, r4, r4
   145c4:	e0a55005 	adc	r5, r5, r5
   145c8:	e25ee001 	subs	lr, lr, #1
   145cc:	1afffff8 	bne	145b4 <__udivmoddi4+0xc8>
   145d0:	e1a0eb34 	lsr	lr, r4, fp
   145d4:	e18eec15 	orr	lr, lr, r5, lsl ip
   145d8:	e18ee235 	orr	lr, lr, r5, lsr r2
   145dc:	e0906004 	adds	r6, r0, r4
   145e0:	e1a0400e 	mov	r4, lr
   145e4:	e0a17005 	adc	r7, r1, r5
   145e8:	e1a01b35 	lsr	r1, r5, fp
   145ec:	e1a05001 	mov	r5, r1
   145f0:	e1a01b11 	lsl	r1, r1, fp
   145f4:	e181121e 	orr	r1, r1, lr, lsl r2
   145f8:	e1a00b1e 	lsl	r0, lr, fp
   145fc:	e1811c3e 	orr	r1, r1, lr, lsr ip
   14600:	e0560000 	subs	r0, r6, r0
   14604:	e0c71001 	sbc	r1, r7, r1
   14608:	e35a0000 	cmp	sl, #0
   1460c:	188a0030 	stmne	sl, {r4, r5}
   14610:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   14614:	e12fff1e 	bx	lr

00014618 <__clzdi2>:
   14618:	e92d4010 	push	{r4, lr}
   1461c:	e3510000 	cmp	r1, #0
   14620:	1a000002 	bne	14630 <__clzdi2+0x18>
   14624:	eb000005 	bl	14640 <__clzsi2>
   14628:	e2800020 	add	r0, r0, #32
   1462c:	ea000001 	b	14638 <__clzdi2+0x20>
   14630:	e1a00001 	mov	r0, r1
   14634:	eb000001 	bl	14640 <__clzsi2>
   14638:	e8bd4010 	pop	{r4, lr}
   1463c:	e12fff1e 	bx	lr

00014640 <__clzsi2>:
   14640:	e3a0101c 	mov	r1, #28
   14644:	e3500801 	cmp	r0, #65536	; 0x10000
   14648:	21a00820 	lsrcs	r0, r0, #16
   1464c:	22411010 	subcs	r1, r1, #16
   14650:	e3500c01 	cmp	r0, #256	; 0x100
   14654:	21a00420 	lsrcs	r0, r0, #8
   14658:	22411008 	subcs	r1, r1, #8
   1465c:	e3500010 	cmp	r0, #16
   14660:	21a00220 	lsrcs	r0, r0, #4
   14664:	22411004 	subcs	r1, r1, #4
   14668:	e28f2008 	add	r2, pc, #8
   1466c:	e7d20000 	ldrb	r0, [r2, r0]
   14670:	e0800001 	add	r0, r0, r1
   14674:	e12fff1e 	bx	lr
   14678:	02020304 	.word	0x02020304
   1467c:	01010101 	.word	0x01010101
	...

00014688 <_close>:
   14688:	e3a02058 	mov	r2, #88	; 0x58
   1468c:	e59f3008 	ldr	r3, [pc, #8]	; 1469c <_close+0x14>
   14690:	e3e00000 	mvn	r0, #0
   14694:	e5832000 	str	r2, [r3]
   14698:	e12fff1e 	bx	lr
   1469c:	00015ee0 	.word	0x00015ee0

000146a0 <_fstat>:
   146a0:	e3a02058 	mov	r2, #88	; 0x58
   146a4:	e59f3008 	ldr	r3, [pc, #8]	; 146b4 <_fstat+0x14>
   146a8:	e3e00000 	mvn	r0, #0
   146ac:	e5832000 	str	r2, [r3]
   146b0:	e12fff1e 	bx	lr
   146b4:	00015ee0 	.word	0x00015ee0

000146b8 <_getpid>:
   146b8:	e3a02058 	mov	r2, #88	; 0x58
   146bc:	e59f3008 	ldr	r3, [pc, #8]	; 146cc <_getpid+0x14>
   146c0:	e3e00000 	mvn	r0, #0
   146c4:	e5832000 	str	r2, [r3]
   146c8:	e12fff1e 	bx	lr
   146cc:	00015ee0 	.word	0x00015ee0

000146d0 <_isatty>:
   146d0:	e3a02058 	mov	r2, #88	; 0x58
   146d4:	e59f3008 	ldr	r3, [pc, #8]	; 146e4 <_isatty+0x14>
   146d8:	e3a00000 	mov	r0, #0
   146dc:	e5832000 	str	r2, [r3]
   146e0:	e12fff1e 	bx	lr
   146e4:	00015ee0 	.word	0x00015ee0

000146e8 <_kill>:
   146e8:	e3a02058 	mov	r2, #88	; 0x58
   146ec:	e59f3008 	ldr	r3, [pc, #8]	; 146fc <_kill+0x14>
   146f0:	e3e00000 	mvn	r0, #0
   146f4:	e5832000 	str	r2, [r3]
   146f8:	e12fff1e 	bx	lr
   146fc:	00015ee0 	.word	0x00015ee0

00014700 <_lseek>:
   14700:	e3a02058 	mov	r2, #88	; 0x58
   14704:	e59f3008 	ldr	r3, [pc, #8]	; 14714 <_lseek+0x14>
   14708:	e3e00000 	mvn	r0, #0
   1470c:	e5832000 	str	r2, [r3]
   14710:	e12fff1e 	bx	lr
   14714:	00015ee0 	.word	0x00015ee0

00014718 <_read>:
   14718:	e3a02058 	mov	r2, #88	; 0x58
   1471c:	e59f3008 	ldr	r3, [pc, #8]	; 1472c <_read+0x14>
   14720:	e3e00000 	mvn	r0, #0
   14724:	e5832000 	str	r2, [r3]
   14728:	e12fff1e 	bx	lr
   1472c:	00015ee0 	.word	0x00015ee0

00014730 <_sbrk>:
   14730:	e59f201c 	ldr	r2, [pc, #28]	; 14754 <_sbrk+0x24>
   14734:	e5923000 	ldr	r3, [r2]
   14738:	e59f1018 	ldr	r1, [pc, #24]	; 14758 <_sbrk+0x28>
   1473c:	e3530000 	cmp	r3, #0
   14740:	01a03001 	moveq	r3, r1
   14744:	e0830000 	add	r0, r3, r0
   14748:	e5820000 	str	r0, [r2]
   1474c:	e1a00003 	mov	r0, r3
   14750:	e12fff1e 	bx	lr
   14754:	00015c38 	.word	0x00015c38
   14758:	00015ee4 	.word	0x00015ee4

0001475c <_write>:
   1475c:	e3a02058 	mov	r2, #88	; 0x58
   14760:	e59f3008 	ldr	r3, [pc, #8]	; 14770 <_write+0x14>
   14764:	e3e00000 	mvn	r0, #0
   14768:	e5832000 	str	r2, [r3]
   1476c:	e12fff1e 	bx	lr
   14770:	00015ee0 	.word	0x00015ee0

00014774 <_exit>:
   14774:	eafffffe 	b	14774 <_exit>

Disassembly of section .fini:

00014778 <_fini>:
   14778:	e1a0c00d 	mov	ip, sp
   1477c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
   14780:	e24cb004 	sub	fp, ip, #4
   14784:	e24bd028 	sub	sp, fp, #40	; 0x28
   14788:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
   1478c:	e12fff1e 	bx	lr
