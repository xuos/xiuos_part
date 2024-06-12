
shell:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
    }
    return len;
}

int main(void)
{
       0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    shell.write = userShellWrite;
       4:	90000003 	adrp	x3, 0 <main>
       8:	91088063 	add	x3, x3, #0x220
{
       c:	910003fd 	mov	x29, sp
      10:	f90013f5 	str	x21, [sp, #32]
    shell.write = userShellWrite;
      14:	b0000095 	adrp	x21, 11000 <__global_locale+0x180>
      18:	912222b5 	add	x21, x21, #0x888
    shell.read = userShellRead;
      1c:	90000004 	adrp	x4, 0 <main>
      20:	9109c084 	add	x4, x4, #0x270
    shell.write = userShellWrite;
      24:	910022a0 	add	x0, x21, #0x8
{
      28:	a90153f3 	stp	x19, x20, [sp, #16]

    shellInit(&shell, shellBuffer, 512);
      2c:	910342a1 	add	x1, x21, #0xd0
      30:	f0000073 	adrp	x19, f000 <_fstat_r+0x40>
      34:	91110273 	add	x19, x19, #0x440

    while (connect_session(&session_fs, "MemFS", 8092) < 0)
      38:	910b42b4 	add	x20, x21, #0x2d0
    shellInit(&shell, shellBuffer, 512);
      3c:	52804002 	mov	w2, #0x200                 	// #512
    shell.write = userShellWrite;
      40:	a90b8c04 	stp	x4, x3, [x0, #184]
    shellInit(&shell, shellBuffer, 512);
      44:	94000f6f 	bl	3e00 <shellInit>
    while (connect_session(&session_fs, "MemFS", 8092) < 0)
      48:	aa1303e1 	mov	x1, x19
      4c:	aa1403e0 	mov	x0, x20
      50:	5283f382 	mov	w2, #0x1f9c                	// #8092
      54:	940019cb 	bl	6780 <connect_session>
      58:	37ffff80 	tbnz	w0, #31, 48 <main+0x48>
        ;
    if (!session_fs.buf) {
      5c:	f9400a80 	ldr	x0, [x20, #16]
      60:	b4000180 	cbz	x0, 90 <main+0x90>
        printf("session connect faield\n");
        return -1;
    }
    shellTask(&shell);
      64:	910022a0 	add	x0, x21, #0x8
      68:	9400138a 	bl	4e90 <shellTask>

    free_session(&session_fs);
      6c:	aa1403e0 	mov	x0, x20
      70:	940019cc 	bl	67a0 <free_session>

    exit(0);
      74:	52800000 	mov	w0, #0x0                   	// #0
      78:	94001a62 	bl	6a00 <exit>
    return 0;
      7c:	52800000 	mov	w0, #0x0                   	// #0
}
      80:	a94153f3 	ldp	x19, x20, [sp, #16]
      84:	f94013f5 	ldr	x21, [sp, #32]
      88:	a8c37bfd 	ldp	x29, x30, [sp], #48
      8c:	d65f03c0 	ret
        printf("session connect faield\n");
      90:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
      94:	91112000 	add	x0, x0, #0x448
      98:	9400071e 	bl	1d10 <printf>
        return -1;
      9c:	12800000 	mov	w0, #0xffffffff            	// #-1
      a0:	17fffff8 	b	80 <main+0x80>
      a4:	d503201f 	nop
      a8:	d503201f 	nop
      ac:	d503201f 	nop

00000000000000b0 <deregister_tm_clones>:
      b0:	b0000080 	adrp	x0, 11000 <__global_locale+0x180>
      b4:	91214000 	add	x0, x0, #0x850
      b8:	b0000081 	adrp	x1, 11000 <__global_locale+0x180>
      bc:	91214021 	add	x1, x1, #0x850
      c0:	eb00003f 	cmp	x1, x0
      c4:	540000c0 	b.eq	dc <deregister_tm_clones+0x2c>  // b.none
      c8:	f0000061 	adrp	x1, f000 <_fstat_r+0x40>
      cc:	f9420c21 	ldr	x1, [x1, #1048]
      d0:	b4000061 	cbz	x1, dc <deregister_tm_clones+0x2c>
      d4:	aa0103f0 	mov	x16, x1
      d8:	d61f0200 	br	x16
      dc:	d65f03c0 	ret

00000000000000e0 <register_tm_clones>:
      e0:	b0000080 	adrp	x0, 11000 <__global_locale+0x180>
      e4:	91214000 	add	x0, x0, #0x850
      e8:	b0000081 	adrp	x1, 11000 <__global_locale+0x180>
      ec:	91214021 	add	x1, x1, #0x850
      f0:	cb000021 	sub	x1, x1, x0
      f4:	d37ffc22 	lsr	x2, x1, #63
      f8:	8b810c41 	add	x1, x2, x1, asr #3
      fc:	9341fc21 	asr	x1, x1, #1
     100:	b40000c1 	cbz	x1, 118 <register_tm_clones+0x38>
     104:	f0000062 	adrp	x2, f000 <_fstat_r+0x40>
     108:	f9421042 	ldr	x2, [x2, #1056]
     10c:	b4000062 	cbz	x2, 118 <register_tm_clones+0x38>
     110:	aa0203f0 	mov	x16, x2
     114:	d61f0200 	br	x16
     118:	d65f03c0 	ret
     11c:	d503201f 	nop

0000000000000120 <__do_global_dtors_aux>:
     120:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     124:	910003fd 	mov	x29, sp
     128:	f9000bf3 	str	x19, [sp, #16]
     12c:	b0000093 	adrp	x19, 11000 <__global_locale+0x180>
     130:	39614260 	ldrb	w0, [x19, #2128]
     134:	35000140 	cbnz	w0, 15c <__do_global_dtors_aux+0x3c>
     138:	97ffffde 	bl	b0 <deregister_tm_clones>
     13c:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     140:	f9421400 	ldr	x0, [x0, #1064]
     144:	b4000080 	cbz	x0, 154 <__do_global_dtors_aux+0x34>
     148:	90000080 	adrp	x0, 10000 <__func__.0+0x10>
     14c:	911bb000 	add	x0, x0, #0x6ec
     150:	d503201f 	nop
     154:	52800020 	mov	w0, #0x1                   	// #1
     158:	39214260 	strb	w0, [x19, #2128]
     15c:	f9400bf3 	ldr	x19, [sp, #16]
     160:	a8c27bfd 	ldp	x29, x30, [sp], #32
     164:	d65f03c0 	ret
     168:	d503201f 	nop
     16c:	d503201f 	nop

0000000000000170 <frame_dummy>:
     170:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     174:	f9421800 	ldr	x0, [x0, #1072]
     178:	b4000140 	cbz	x0, 1a0 <frame_dummy+0x30>
     17c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     180:	b0000081 	adrp	x1, 11000 <__global_locale+0x180>
     184:	90000080 	adrp	x0, 10000 <__func__.0+0x10>
     188:	910003fd 	mov	x29, sp
     18c:	91216021 	add	x1, x1, #0x858
     190:	911bb000 	add	x0, x0, #0x6ec
     194:	d503201f 	nop
     198:	a8c17bfd 	ldp	x29, x30, [sp], #16
     19c:	17ffffd1 	b	e0 <register_tm_clones>
     1a0:	17ffffd0 	b	e0 <register_tm_clones>
     1a4:	d503201f 	nop

00000000000001a8 <_mainCRTStartup>:
     1a8:	58000281 	ldr	x1, 1f8 <_cpu_init_hook+0x4>
     1ac:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     1b0:	9100001f 	mov	sp, x0
     1b4:	d280001d 	mov	x29, #0x0                   	// #0
     1b8:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     1bc:	910003fd 	mov	x29, sp
     1c0:	9400000d 	bl	1f4 <_cpu_init_hook>
     1c4:	580001e0 	ldr	x0, 200 <_cpu_init_hook+0xc>
     1c8:	52800001 	mov	w1, #0x0                   	// #0
     1cc:	580001e2 	ldr	x2, 208 <_cpu_init_hook+0x14>
     1d0:	cb000042 	sub	x2, x2, x0
     1d4:	94001dfb 	bl	79c0 <memset>
     1d8:	580001c0 	ldr	x0, 210 <_cpu_init_hook+0x1c>
     1dc:	94001ce9 	bl	7580 <atexit>
     1e0:	94001d44 	bl	76f0 <__libc_init_array>
     1e4:	d2800000 	mov	x0, #0x0                   	// #0
     1e8:	d2800001 	mov	x1, #0x0                   	// #0
     1ec:	97ffff85 	bl	0 <main>
     1f0:	14001a04 	b	6a00 <exit>

00000000000001f4 <_cpu_init_hook>:
     1f4:	d65f03c0 	ret
	...
     200:	00011850 	.word	0x00011850
     204:	00000000 	.word	0x00000000
     208:	00011f88 	.word	0x00011f88
     20c:	00000000 	.word	0x00000000
     210:	000075a0 	.word	0x000075a0
     214:	00000000 	.word	0x00000000
     218:	d503201f 	.word	0xd503201f
     21c:	d503201f 	.word	0xd503201f

0000000000000220 <userShellWrite>:
{
     220:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     224:	910003fd 	mov	x29, sp
     228:	a9025bf5 	stp	x21, x22, [sp, #32]
    while (length--) {
     22c:	72003c36 	ands	w22, w1, #0xffff
     230:	54000180 	b.eq	260 <userShellWrite+0x40>  // b.none
     234:	8b362015 	add	x21, x0, w22, uxth
     238:	a90153f3 	stp	x19, x20, [sp, #16]
     23c:	f0000074 	adrp	x20, f000 <_fstat_r+0x40>
     240:	9110e294 	add	x20, x20, #0x438
     244:	aa0003f3 	mov	x19, x0
        printf("%c", *data++);
     248:	38401661 	ldrb	w1, [x19], #1
     24c:	aa1403e0 	mov	x0, x20
     250:	940006b0 	bl	1d10 <printf>
    while (length--) {
     254:	eb15027f 	cmp	x19, x21
     258:	54ffff81 	b.ne	248 <userShellWrite+0x28>  // b.any
     25c:	a94153f3 	ldp	x19, x20, [sp, #16]
}
     260:	2a1603e0 	mov	w0, w22
     264:	a9425bf5 	ldp	x21, x22, [sp, #32]
     268:	a8c37bfd 	ldp	x29, x30, [sp], #48
     26c:	d65f03c0 	ret

0000000000000270 <userShellRead>:
{
     270:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     274:	910003fd 	mov	x29, sp
     278:	a9025bf5 	stp	x21, x22, [sp, #32]
    while (length--) {
     27c:	72003c36 	ands	w22, w1, #0xffff
     280:	540002c0 	b.eq	2d8 <userShellRead+0x68>  // b.none
     284:	8b362015 	add	x21, x0, w22, uxth
     288:	a90153f3 	stp	x19, x20, [sp, #16]
     28c:	b0000094 	adrp	x20, 11000 <__global_locale+0x180>
     290:	91222294 	add	x20, x20, #0x888
     294:	aa0003f3 	mov	x19, x0
     298:	14000004 	b	2a8 <userShellRead+0x38>
        *data++ = cur_read;
     29c:	38001661 	strb	w1, [x19], #1
    while (length--) {
     2a0:	eb15027f 	cmp	x19, x21
     2a4:	54000180 	b.eq	2d4 <userShellRead+0x64>  // b.none
        cur_read = getc();
     2a8:	9400003a 	bl	390 <getc>
     2ac:	39000280 	strb	w0, [x20]
     2b0:	12001c01 	and	w1, w0, #0xff
        if (cur_read == 0xff) {
     2b4:	7103fc3f 	cmp	w1, #0xff
     2b8:	54ffff21 	b.ne	29c <userShellRead+0x2c>  // b.any
            yield(SYS_TASK_YIELD_NO_REASON);
     2bc:	52800000 	mov	w0, #0x0                   	// #0
     2c0:	940019d8 	bl	6a20 <yield>
        *data++ = cur_read;
     2c4:	39400281 	ldrb	w1, [x20]
     2c8:	38001661 	strb	w1, [x19], #1
    while (length--) {
     2cc:	eb15027f 	cmp	x19, x21
     2d0:	54fffec1 	b.ne	2a8 <userShellRead+0x38>  // b.any
     2d4:	a94153f3 	ldp	x19, x20, [sp, #16]
}
     2d8:	2a1603e0 	mov	w0, w22
     2dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     2e0:	a8c37bfd 	ldp	x29, x30, [sp], #48
     2e4:	d65f03c0 	ret
     2e8:	d503201f 	nop
     2ec:	d503201f 	nop

00000000000002f0 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     2f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     2f4:	52800020 	mov	w0, #0x1                   	// #1
{
     2f8:	910003fd 	mov	x29, sp
     2fc:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     300:	b0000093 	adrp	x19, 11000 <__global_locale+0x180>
     304:	b94b7261 	ldr	w1, [x19, #2928]
     308:	34000081 	cbz	w1, 318 <init_uart_mmio+0x28>
}
     30c:	f9400bf3 	ldr	x19, [sp, #16]
     310:	a8c27bfd 	ldp	x29, x30, [sp], #32
     314:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     318:	2a0003e3 	mov	w3, w0
     31c:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     320:	52820002 	mov	w2, #0x1000                	// #4096
     324:	aa0103e0 	mov	x0, x1
     328:	94001a1e 	bl	6ba0 <mmap>
     32c:	3100041f 	cmn	w0, #0x1
            return false;
     330:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     334:	54fffec0 	b.eq	30c <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     338:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     33c:	2a0103e0 	mov	w0, w1
        mapped = 1;
     340:	b90b7261 	str	w1, [x19, #2928]
}
     344:	f9400bf3 	ldr	x19, [sp, #16]
     348:	a8c27bfd 	ldp	x29, x30, [sp], #32
     34c:	d65f03c0 	ret

0000000000000350 <putc>:

void putc(char ch)
{
     350:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     354:	7100281f 	cmp	w0, #0xa
     358:	540000c0 	b.eq	370 <putc+0x20>  // b.none
    return in_le32(addr);
     35c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     360:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     364:	362fffe1 	tbz	w1, #5, 360 <putc+0x10>
    out_le32(addr, value);
     368:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     36c:	d65f03c0 	ret
    return in_le32(addr);
     370:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     374:	d503201f 	nop
     378:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     37c:	362fffe1 	tbz	w1, #5, 378 <putc+0x28>
    out_le32(addr, value);
     380:	528001a1 	mov	w1, #0xd                   	// #13
     384:	b9000041 	str	w1, [x2]
}
     388:	17fffff5 	b	35c <putc+0xc>
     38c:	d503201f 	nop

0000000000000390 <getc>:
    return in_le32(addr);
     390:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     394:	d503201f 	nop
     398:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     39c:	3607ffe0 	tbz	w0, #0, 398 <getc+0x8>
    return in_le32(addr);
     3a0:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     3a4:	d65f03c0 	ret
     3a8:	d503201f 	nop
     3ac:	d503201f 	nop

00000000000003b0 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     3b0:	eb03005f 	cmp	x2, x3
{
     3b4:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     3b8:	54000042 	b.cs	3c0 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     3bc:	38226820 	strb	w0, [x1, x2]
    }
}
     3c0:	d65f03c0 	ret
     3c4:	d503201f 	nop
     3c8:	d503201f 	nop
     3cc:	d503201f 	nop

00000000000003d0 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     3d0:	d65f03c0 	ret
     3d4:	d503201f 	nop
     3d8:	d503201f 	nop
     3dc:	d503201f 	nop

00000000000003e0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     3e0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     3e4:	910003fd 	mov	x29, sp
     3e8:	a90153f3 	stp	x19, x20, [sp, #16]
     3ec:	aa0503f3 	mov	x19, x5
     3f0:	aa0203f4 	mov	x20, x2
     3f4:	a9025bf5 	stp	x21, x22, [sp, #32]
     3f8:	aa0003f5 	mov	x21, x0
     3fc:	aa0103f6 	mov	x22, x1
     400:	a90363f7 	stp	x23, x24, [sp, #48]
     404:	aa0203f7 	mov	x23, x2
     408:	aa0403f8 	mov	x24, x4
     40c:	a9046bf9 	stp	x25, x26, [sp, #64]
     410:	2a0703fa 	mov	w26, w7
     414:	2a0603f9 	mov	w25, w6
     418:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     41c:	f240075f 	tst	x26, #0x3
{
     420:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     424:	540001e1 	b.ne	460 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     428:	2a0603e0 	mov	w0, w6
     42c:	aa0203fc 	mov	x28, x2
     430:	cb050014 	sub	x20, x0, x5
     434:	eb0000bf 	cmp	x5, x0
     438:	8b020294 	add	x20, x20, x2
     43c:	54000542 	b.cs	4e4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     440:	aa1c03e2 	mov	x2, x28
     444:	aa1b03e3 	mov	x3, x27
     448:	9100079c 	add	x28, x28, #0x1
     44c:	aa1603e1 	mov	x1, x22
     450:	52800400 	mov	w0, #0x20                  	// #32
     454:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     458:	eb1c029f 	cmp	x20, x28
     45c:	54ffff21 	b.ne	440 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     460:	8b14027c 	add	x28, x19, x20
     464:	b4000133 	cbz	x19, 488 <_out_rev+0xa8>
     468:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     46c:	d1000673 	sub	x19, x19, #0x1
     470:	aa1c03f4 	mov	x20, x28
     474:	aa1b03e3 	mov	x3, x27
     478:	aa1603e1 	mov	x1, x22
     47c:	38736b00 	ldrb	w0, [x24, x19]
     480:	d63f02a0 	blr	x21
    while (len) {
     484:	b5ffff33 	cbnz	x19, 468 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     488:	360801fa 	tbz	w26, #1, 4c4 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     48c:	cb170297 	sub	x23, x20, x23
     490:	2a1903f9 	mov	w25, w25
     494:	eb1902ff 	cmp	x23, x25
     498:	54000162 	b.cs	4c4 <_out_rev+0xe4>  // b.hs, b.nlast
     49c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     4a0:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     4a4:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     4a8:	aa1b03e3 	mov	x3, x27
     4ac:	aa1603e1 	mov	x1, x22
     4b0:	52800400 	mov	w0, #0x20                  	// #32
     4b4:	d63f02a0 	blr	x21
     4b8:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     4bc:	eb1902ff 	cmp	x23, x25
     4c0:	54ffff03 	b.cc	4a0 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     4c4:	aa1403e0 	mov	x0, x20
     4c8:	a94153f3 	ldp	x19, x20, [sp, #16]
     4cc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     4d0:	a94363f7 	ldp	x23, x24, [sp, #48]
     4d4:	a9446bf9 	ldp	x25, x26, [sp, #64]
     4d8:	a94573fb 	ldp	x27, x28, [sp, #80]
     4dc:	a8c67bfd 	ldp	x29, x30, [sp], #96
     4e0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     4e4:	aa0203f4 	mov	x20, x2
     4e8:	17ffffde 	b	460 <_out_rev+0x80>
     4ec:	d503201f 	nop

00000000000004f0 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     4f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     4f4:	aa0603eb 	mov	x11, x6
     4f8:	aa0403e9 	mov	x9, x4
     4fc:	910003fd 	mov	x29, sp
     500:	b9403be8 	ldr	w8, [sp, #56]
     504:	2a0703ef 	mov	w15, w7
     508:	b94033e6 	ldr	w6, [sp, #48]
     50c:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     510:	12160110 	and	w16, w8, #0x400
    if (!value) {
     514:	b5000c64 	cbnz	x4, 6a0 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     518:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     51c:	34000730 	cbz	w16, 600 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     520:	121f0111 	and	w17, w8, #0x2
     524:	37080fc8 	tbnz	w8, #1, 71c <_ntoa_long+0x22c>
    size_t len = 0U;
     528:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     52c:	2a0f03e9 	mov	w9, w15
     530:	f1007cbf 	cmp	x5, #0x1f
     534:	910043e4 	add	x4, sp, #0x10
     538:	1a9f87ea 	cset	w10, ls  // ls = plast
     53c:	eb05013f 	cmp	x9, x5
     540:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     544:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     548:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     54c:	350009c6 	cbnz	w6, 684 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     550:	34000108 	cbz	w8, 570 <_ntoa_long+0x80>
            buf[len++] = '0';
     554:	5280060a 	mov	w10, #0x30                  	// #48
     558:	910004a5 	add	x5, x5, #0x1
     55c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     560:	eb05013f 	cmp	x9, x5
     564:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     568:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     56c:	54ffff69 	b.ls	558 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     570:	340001cc 	cbz	w12, 5a8 <_ntoa_long+0xb8>
     574:	f1007cbf 	cmp	x5, #0x1f
     578:	1a9f87ea 	cset	w10, ls  // ls = plast
     57c:	7100015f 	cmp	w10, #0x0
     580:	2a0603e9 	mov	w9, w6
     584:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     588:	54000109 	b.ls	5a8 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     58c:	5280060a 	mov	w10, #0x30                  	// #48
     590:	910004a5 	add	x5, x5, #0x1
     594:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     598:	eb05013f 	cmp	x9, x5
     59c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     5a0:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5a4:	54ffff69 	b.ls	590 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     5a8:	340001b1 	cbz	w17, 5dc <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     5ac:	350008b0 	cbnz	w16, 6c0 <_ntoa_long+0x1d0>
     5b0:	b50007e5 	cbnz	x5, 6ac <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5b4:	f100417f 	cmp	x11, #0x10
     5b8:	54000f20 	b.eq	79c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5bc:	f100097f 	cmp	x11, #0x2
     5c0:	54000f21 	b.ne	7a4 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     5c4:	52800c48 	mov	w8, #0x62                  	// #98
     5c8:	d2800025 	mov	x5, #0x1                   	// #1
     5cc:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     5d0:	52800608 	mov	w8, #0x30                  	// #48
     5d4:	38256888 	strb	w8, [x4, x5]
     5d8:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     5dc:	f10080bf 	cmp	x5, #0x20
     5e0:	540000a0 	b.eq	5f4 <_ntoa_long+0x104>  // b.none
        if (negative) {
     5e4:	340008d2 	cbz	w18, 6fc <_ntoa_long+0x20c>
            buf[len++] = '-';
     5e8:	528005a8 	mov	w8, #0x2d                  	// #45
     5ec:	38256888 	strb	w8, [x4, x5]
     5f0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     5f4:	97ffff7b 	bl	3e0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     5f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     5fc:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     600:	52800011 	mov	w17, #0x0                   	// #0
     604:	f27b00ff 	tst	x7, #0x20
     608:	52800c24 	mov	w4, #0x61                  	// #97
     60c:	5280082e 	mov	w14, #0x41                  	// #65
     610:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     614:	510029ce 	sub	w14, w14, #0xa
     618:	910043e4 	add	x4, sp, #0x10
     61c:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     620:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     624:	910004a5 	add	x5, x5, #0x1
     628:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     62c:	9b0ba58a 	msub	x10, x12, x11, x9
     630:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     634:	f100255f 	cmp	x10, #0x9
     638:	1100c10a 	add	w10, w8, #0x30
     63c:	0b0e0108 	add	w8, w8, w14
     640:	12001d4a 	and	w10, w10, #0xff
     644:	12001d08 	and	w8, w8, #0xff
     648:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     64c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     650:	eb0b013f 	cmp	x9, x11
            value /= base;
     654:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     658:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     65c:	54fffe29 	b.ls	620 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     660:	370ffa47 	tbnz	w7, #1, 5a8 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     664:	f1007cbf 	cmp	x5, #0x1f
     668:	2a0f03e9 	mov	w9, w15
     66c:	1a9f87ea 	cset	w10, ls  // ls = plast
     670:	eb05013f 	cmp	x9, x5
     674:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     678:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     67c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     680:	34fff686 	cbz	w6, 550 <_ntoa_long+0x60>
     684:	3400048c 	cbz	w12, 714 <_ntoa_long+0x224>
     688:	35000072 	cbnz	w18, 694 <_ntoa_long+0x1a4>
     68c:	721e04ff 	tst	w7, #0xc
     690:	54000040 	b.eq	698 <_ntoa_long+0x1a8>  // b.none
            width--;
     694:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     698:	35fff5e8 	cbnz	w8, 554 <_ntoa_long+0x64>
     69c:	17ffffb8 	b	57c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     6a0:	121c0111 	and	w17, w8, #0x10
     6a4:	2a0803e7 	mov	w7, w8
     6a8:	17ffffd7 	b	604 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     6ac:	eb2f40bf 	cmp	x5, w15, uxtw
     6b0:	54000480 	b.eq	740 <_ntoa_long+0x250>  // b.none
     6b4:	eb2640bf 	cmp	x5, w6, uxtw
     6b8:	54000440 	b.eq	740 <_ntoa_long+0x250>  // b.none
     6bc:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6c0:	f1007cbf 	cmp	x5, #0x1f
     6c4:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6c8:	f100417f 	cmp	x11, #0x10
     6cc:	54000480 	b.eq	75c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6d0:	7100011f 	cmp	w8, #0x0
     6d4:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     6d8:	54000081 	b.ne	6e8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     6dc:	52800c48 	mov	w8, #0x62                  	// #98
     6e0:	38256888 	strb	w8, [x4, x5]
     6e4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     6e8:	f10080bf 	cmp	x5, #0x20
     6ec:	54fff721 	b.ne	5d0 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     6f0:	97ffff3c 	bl	3e0 <_out_rev>
}
     6f4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     6f8:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     6fc:	37100167 	tbnz	w7, #2, 728 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     700:	361ff7a7 	tbz	w7, #3, 5f4 <_ntoa_long+0x104>
            buf[len++] = ' ';
     704:	52800408 	mov	w8, #0x20                  	// #32
     708:	38256888 	strb	w8, [x4, x5]
     70c:	910004a5 	add	x5, x5, #0x1
     710:	17ffffb9 	b	5f4 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     714:	35fff208 	cbnz	w8, 554 <_ntoa_long+0x64>
     718:	17ffffa4 	b	5a8 <_ntoa_long+0xb8>
     71c:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     720:	d2800005 	mov	x5, #0x0                   	// #0
     724:	17ffffb0 	b	5e4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     728:	52800568 	mov	w8, #0x2b                  	// #43
     72c:	38256888 	strb	w8, [x4, x5]
     730:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     734:	97ffff2b 	bl	3e0 <_out_rev>
}
     738:	a8c37bfd 	ldp	x29, x30, [sp], #48
     73c:	d65f03c0 	ret
            if (len && (base == 16U)) {
     740:	f10004aa 	subs	x10, x5, #0x1
                len--;
     744:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     748:	1a9f07e8 	cset	w8, ne  // ne = any
     74c:	7100417f 	cmp	w11, #0x10
     750:	1a9f17e9 	cset	w9, eq  // eq = none
     754:	6a090108 	ands	w8, w8, w9
     758:	54000160 	b.eq	784 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     75c:	721b00e9 	ands	w9, w7, #0x20
     760:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     764:	54000141 	b.ne	78c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     768:	7100013f 	cmp	w9, #0x0
     76c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     770:	54fffbc0 	b.eq	6e8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     774:	52800b08 	mov	w8, #0x58                  	// #88
     778:	38256888 	strb	w8, [x4, x5]
     77c:	910004a5 	add	x5, x5, #0x1
     780:	17ffffda 	b	6e8 <_ntoa_long+0x1f8>
            len--;
     784:	aa0a03e5 	mov	x5, x10
     788:	17ffffce 	b	6c0 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     78c:	52800f08 	mov	w8, #0x78                  	// #120
     790:	38256888 	strb	w8, [x4, x5]
     794:	910004a5 	add	x5, x5, #0x1
     798:	17ffffd4 	b	6e8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     79c:	52800028 	mov	w8, #0x1                   	// #1
     7a0:	17ffffef 	b	75c <_ntoa_long+0x26c>
            buf[len++] = '0';
     7a4:	52800608 	mov	w8, #0x30                  	// #48
     7a8:	d2800025 	mov	x5, #0x1                   	// #1
     7ac:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     7b0:	17ffff8d 	b	5e4 <_ntoa_long+0xf4>
     7b4:	d503201f 	nop
     7b8:	d503201f 	nop
     7bc:	d503201f 	nop

00000000000007c0 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     7c0:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     7c4:	1e602000 	fcmp	d0, d0
{
     7c8:	a9017bfd 	stp	x29, x30, [sp, #16]
     7cc:	910043fd 	add	x29, sp, #0x10
     7d0:	a90253f3 	stp	x19, x20, [sp, #32]
     7d4:	aa0203f3 	mov	x19, x2
     7d8:	2a0603f4 	mov	w20, w6
     7dc:	a9035bf5 	stp	x21, x22, [sp, #48]
     7e0:	2a0503f6 	mov	w22, w5
     7e4:	a90463f7 	stp	x23, x24, [sp, #64]
     7e8:	aa0003f7 	mov	x23, x0
     7ec:	a9056bf9 	stp	x25, x26, [sp, #80]
     7f0:	aa0103f9 	mov	x25, x1
     7f4:	a90673fb 	stp	x27, x28, [sp, #96]
     7f8:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     7fc:	54001361 	b.ne	a68 <_etoa+0x2a8>  // b.any
     800:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     804:	9e670001 	fmov	d1, x0
     808:	1e612010 	fcmpe	d0, d1
     80c:	540012ec 	b.gt	a68 <_etoa+0x2a8>
     810:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     814:	9e670001 	fmov	d1, x0
     818:	1e612010 	fcmpe	d0, d1
     81c:	54001264 	b.mi	a68 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     820:	1e602018 	fcmpe	d0, #0.0
     824:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     828:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     82c:	fd42c817 	ldr	d23, [x0, #1424]
     830:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     834:	fd42cc01 	ldr	d1, [x0, #1432]
     838:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     83c:	fd42d016 	ldr	d22, [x0, #1440]
     840:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     844:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     848:	fd42d406 	ldr	d6, [x0, #1448]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     84c:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     850:	fd42d815 	ldr	d21, [x0, #1456]
     854:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     858:	fd42dc14 	ldr	d20, [x0, #1464]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     85c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     860:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     864:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     868:	1e659002 	fmov	d2, #1.400000000000000000e+01
     86c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     870:	1e631013 	fmov	d19, #6.000000000000000000e+00
     874:	1e601010 	fmov	d16, #2.000000000000000000e+00
     878:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     87c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     880:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     884:	d374f821 	ubfx	x1, x1, #52, #11
     888:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     88c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     890:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     894:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     898:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     89c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     8a0:	1e7838a5 	fsub	d5, d5, d24
     8a4:	1e770884 	fmul	d4, d4, d23
     8a8:	1e7608a5 	fmul	d5, d5, d22
     8ac:	1e612884 	fadd	d4, d4, d1
     8b0:	1e652884 	fadd	d4, d4, d5
     8b4:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     8b8:	1e620301 	scvtf	d1, w24
     8bc:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8c0:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     8c4:	1e632884 	fadd	d4, d4, d3
     8c8:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8cc:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     8d0:	110ffc00 	add	w0, w0, #0x3ff
     8d4:	9e670004 	fmov	d4, x0
     8d8:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8dc:	1e740863 	fmul	d3, d3, d20
     8e0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     8e4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     8e8:	1e613a05 	fsub	d5, d16, d1
     8ec:	1e612821 	fadd	d1, d1, d1
     8f0:	1e621862 	fdiv	d2, d3, d2
     8f4:	1e712842 	fadd	d2, d2, d17
     8f8:	1e621862 	fdiv	d2, d3, d2
     8fc:	1e732842 	fadd	d2, d2, d19
     900:	1e621863 	fdiv	d3, d3, d2
     904:	1e652863 	fadd	d3, d3, d5
     908:	1e631821 	fdiv	d1, d1, d3
     90c:	1e722821 	fadd	d1, d1, d18
     910:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     914:	1e672030 	fcmpe	d1, d7
     918:	54000c4c 	b.gt	aa0 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     91c:	11018f00 	add	w0, w24, #0x63
     920:	7103181f 	cmp	w0, #0xc6
     924:	1a9f97fc 	cset	w28, hi  // hi = pmore
     928:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     92c:	36580134 	tbz	w20, #11, 950 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     930:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     934:	fd42e002 	ldr	d2, [x0, #1472]
     938:	1e6220f0 	fcmpe	d7, d2
     93c:	54000d2a 	b.ge	ae0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     940:	34000084 	cbz	w4, 950 <_etoa+0x190>
                --prec;
     944:	7100007f 	cmp	w3, #0x0
     948:	1a9f07e0 	cset	w0, ne  // ne = any
     94c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     950:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     954:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     958:	4b1c02c5 	sub	w5, w22, w28
     95c:	5280003a 	mov	w26, #0x1                   	// #1
     960:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     964:	7100001f 	cmp	w0, #0x0
     968:	1a9f07e0 	cset	w0, ne  // ne = any
     96c:	b9007fe0 	str	w0, [sp, #124]
     970:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     974:	34000058 	cbz	w24, 97c <_etoa+0x1bc>
        value /= conv.F;
     978:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     97c:	1e602018 	fcmpe	d0, #0.0
     980:	54000ac4 	b.mi	ad8 <_etoa+0x318>  // b.first
     984:	1e6040e0 	fmov	d0, d7
     988:	12147a86 	and	w6, w20, #0xfffff7ff
     98c:	aa1b03e3 	mov	x3, x27
     990:	aa1303e2 	mov	x2, x19
     994:	aa1903e1 	mov	x1, x25
     998:	aa1703e0 	mov	x0, x23
     99c:	94000071 	bl	b60 <_ftoa>
     9a0:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     9a4:	3400051a 	cbz	w26, a44 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     9a8:	f27b029f 	tst	x20, #0x20
     9ac:	528008a1 	mov	w1, #0x45                  	// #69
     9b0:	aa1503e2 	mov	x2, x21
     9b4:	aa1b03e3 	mov	x3, x27
     9b8:	52800ca0 	mov	w0, #0x65                  	// #101
     9bc:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     9c0:	aa1903e1 	mov	x1, x25
     9c4:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     9c8:	7100031f 	cmp	w24, #0x0
     9cc:	528000a0 	mov	w0, #0x5                   	// #5
     9d0:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     9d4:	5100079c 	sub	w28, w28, #0x1
     9d8:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     9dc:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     9e0:	b9000be0 	str	w0, [sp, #8]
     9e4:	93407c84 	sxtw	x4, w4
     9e8:	531f7f05 	lsr	w5, w24, #31
     9ec:	aa1b03e3 	mov	x3, x27
     9f0:	aa1903e1 	mov	x1, x25
     9f4:	aa1703e0 	mov	x0, x23
     9f8:	52800007 	mov	w7, #0x0                   	// #0
     9fc:	d2800146 	mov	x6, #0xa                   	// #10
     a00:	97fffebc 	bl	4f0 <_ntoa_long>
     a04:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     a08:	b9407fe0 	ldr	w0, [sp, #124]
     a0c:	340001c0 	cbz	w0, a44 <_etoa+0x284>
            while (idx - start_idx < width)
     a10:	cb1302b3 	sub	x19, x21, x19
     a14:	eb1302df 	cmp	x22, x19
     a18:	54000169 	b.ls	a44 <_etoa+0x284>  // b.plast
     a1c:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     a20:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     a24:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     a28:	aa1b03e3 	mov	x3, x27
     a2c:	aa1903e1 	mov	x1, x25
     a30:	52800400 	mov	w0, #0x20                  	// #32
     a34:	d63f02e0 	blr	x23
     a38:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     a3c:	eb1302df 	cmp	x22, x19
     a40:	54ffff08 	b.hi	a20 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     a44:	aa1503e0 	mov	x0, x21
     a48:	a9417bfd 	ldp	x29, x30, [sp, #16]
     a4c:	a94253f3 	ldp	x19, x20, [sp, #32]
     a50:	a9435bf5 	ldp	x21, x22, [sp, #48]
     a54:	a94463f7 	ldp	x23, x24, [sp, #64]
     a58:	a9456bf9 	ldp	x25, x26, [sp, #80]
     a5c:	a94673fb 	ldp	x27, x28, [sp, #96]
     a60:	910203ff 	add	sp, sp, #0x80
     a64:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     a68:	2a1403e6 	mov	w6, w20
     a6c:	2a1603e5 	mov	w5, w22
     a70:	aa1b03e3 	mov	x3, x27
     a74:	aa1303e2 	mov	x2, x19
     a78:	aa1903e1 	mov	x1, x25
     a7c:	aa1703e0 	mov	x0, x23
}
     a80:	a9417bfd 	ldp	x29, x30, [sp, #16]
     a84:	a94253f3 	ldp	x19, x20, [sp, #32]
     a88:	a9435bf5 	ldp	x21, x22, [sp, #48]
     a8c:	a94463f7 	ldp	x23, x24, [sp, #64]
     a90:	a9456bf9 	ldp	x25, x26, [sp, #80]
     a94:	a94673fb 	ldp	x27, x28, [sp, #96]
     a98:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     a9c:	14000031 	b	b60 <_ftoa>
        conv.F /= 10;
     aa0:	1e711821 	fdiv	d1, d1, d17
        expval--;
     aa4:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     aa8:	11018f00 	add	w0, w24, #0x63
     aac:	7103181f 	cmp	w0, #0xc6
     ab0:	1a9f97fc 	cset	w28, hi  // hi = pmore
     ab4:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     ab8:	365ff4d4 	tbz	w20, #11, 950 <_etoa+0x190>
     abc:	17ffff9d 	b	930 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     ac0:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     ac4:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     ac8:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     acc:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     ad0:	5280001a 	mov	w26, #0x0                   	// #0
     ad4:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     ad8:	1e6140e7 	fneg	d7, d7
     adc:	17ffffaa 	b	984 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     ae0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     ae4:	f2e825c0 	movk	x0, #0x412e, lsl #48
     ae8:	9e670002 	fmov	d2, x0
     aec:	1e6220f0 	fcmpe	d7, d2
     af0:	54000044 	b.mi	af8 <_etoa+0x338>  // b.first
     af4:	17ffff93 	b	940 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     af8:	6b180080 	subs	w0, w4, w24
     afc:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     b00:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     b04:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     b08:	35000196 	cbnz	w22, b38 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     b0c:	1e602018 	fcmpe	d0, #0.0
     b10:	54fffd84 	b.mi	ac0 <_etoa+0x300>  // b.first
     b14:	12147a86 	and	w6, w20, #0xfffff7ff
     b18:	1e6040e0 	fmov	d0, d7
     b1c:	321600c6 	orr	w6, w6, #0x400
     b20:	aa1b03e3 	mov	x3, x27
     b24:	aa1303e2 	mov	x2, x19
     b28:	aa1903e1 	mov	x1, x25
     b2c:	aa1703e0 	mov	x0, x23
     b30:	52800005 	mov	w5, #0x0                   	// #0
     b34:	17ffffd3 	b	a80 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     b38:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     b3c:	2a1603e5 	mov	w5, w22
     b40:	5280001a 	mov	w26, #0x0                   	// #0
     b44:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     b48:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     b4c:	b9007fff 	str	wzr, [sp, #124]
     b50:	17ffff8b 	b	97c <_etoa+0x1bc>
     b54:	d503201f 	nop
     b58:	d503201f 	nop
     b5c:	d503201f 	nop

0000000000000b60 <_ftoa>:
    if (value != value)
     b60:	1e602000 	fcmp	d0, d0
{
     b64:	2a0603e7 	mov	w7, w6
    if (value != value)
     b68:	54000e01 	b.ne	d28 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     b6c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     b70:	9e6700c1 	fmov	d1, x6
     b74:	1e612010 	fcmpe	d0, d1
     b78:	54001184 	b.mi	da8 <_ftoa+0x248>  // b.first
     b7c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     b80:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     b84:	9e670001 	fmov	d1, x0
     b88:	aa0103f0 	mov	x16, x1
     b8c:	aa0203f1 	mov	x17, x2
     b90:	aa0303f2 	mov	x18, x3
     b94:	1e612010 	fcmpe	d0, d1
     b98:	54000b2c 	b.gt	cfc <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     b9c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     ba0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     ba4:	9e670001 	fmov	d1, x0
     ba8:	1e612010 	fcmpe	d0, d1
     bac:	54000f2c 	b.gt	d90 <_ftoa+0x230>
     bb0:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     bb4:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     bb8:	9e670001 	fmov	d1, x0
     bbc:	1e612010 	fcmpe	d0, d1
     bc0:	54000e84 	b.mi	d90 <_ftoa+0x230>  // b.first
    if (value < 0) {
     bc4:	1e602018 	fcmpe	d0, #0.0
{
     bc8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     bcc:	910003fd 	mov	x29, sp
    if (value < 0) {
     bd0:	54000ca4 	b.mi	d64 <_ftoa+0x204>  // b.first
    bool negative = false;
     bd4:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     bd8:	36500ce7 	tbz	w7, #10, d74 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     bdc:	7100249f 	cmp	w4, #0x9
     be0:	910043ec 	add	x12, sp, #0x10
     be4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     be8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     bec:	54001929 	b.ls	f10 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     bf0:	91000508 	add	x8, x8, #0x1
        prec--;
     bf4:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     bf8:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     bfc:	f1007d1f 	cmp	x8, #0x1f
     c00:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     c04:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     c08:	54ffff48 	b.hi	bf0 <_ftoa+0x90>  // b.pmore
     c0c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     c10:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     c14:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     c18:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     c1c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     c20:	1e620141 	scvtf	d1, w10
     c24:	1e613801 	fsub	d1, d0, d1
     c28:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     c2c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     c30:	9e6301c4 	ucvtf	d4, x14
     c34:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     c38:	1e632030 	fcmpe	d1, d3
     c3c:	5400112c 	b.gt	e60 <_ftoa+0x300>
    } else if (diff < 0.5) {
     c40:	54000084 	b.mi	c50 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     c44:	b500154e 	cbnz	x14, eec <_ftoa+0x38c>
        ++frac;
     c48:	910005ce 	add	x14, x14, #0x1
     c4c:	d503201f 	nop
    if (prec == 0U) {
     c50:	35000b64 	cbnz	w4, dbc <_ftoa+0x25c>
        diff = value - (double)whole;
     c54:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     c58:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     c5c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     c60:	1e622010 	fcmpe	d0, d2
     c64:	540011a4 	b.mi	e98 <_ftoa+0x338>  // b.first
            ++whole;
     c68:	12000140 	and	w0, w10, #0x1
     c6c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     c70:	528ccce1 	mov	w1, #0x6667                	// #26215
     c74:	72acccc1 	movk	w1, #0x6666, lsl #16
     c78:	52800142 	mov	w2, #0xa                   	// #10
     c7c:	d503201f 	nop
     c80:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     c84:	f100811f 	cmp	x8, #0x20
     c88:	54000c20 	b.eq	e0c <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     c8c:	9362fd29 	asr	x9, x9, #34
     c90:	91000508 	add	x8, x8, #0x1
     c94:	4b8a7d29 	sub	w9, w9, w10, asr #31
     c98:	8b080180 	add	x0, x12, x8
     c9c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     ca0:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     ca4:	1100c169 	add	w9, w11, #0x30
     ca8:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     cac:	35fffeaa 	cbnz	w10, c80 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     cb0:	120004e0 	and	w0, w7, #0x3
     cb4:	7100041f 	cmp	w0, #0x1
     cb8:	54000b00 	b.eq	e18 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     cbc:	f1007d1f 	cmp	x8, #0x1f
     cc0:	540000a8 	b.hi	cd4 <_ftoa+0x174>  // b.pmore
        if (negative) {
     cc4:	34000de3 	cbz	w3, e80 <_ftoa+0x320>
            buf[len++] = '-';
     cc8:	528005a0 	mov	w0, #0x2d                  	// #45
     ccc:	38286980 	strb	w0, [x12, x8]
     cd0:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     cd4:	2a0503e6 	mov	w6, w5
     cd8:	aa0c03e4 	mov	x4, x12
     cdc:	aa0803e5 	mov	x5, x8
     ce0:	aa1203e3 	mov	x3, x18
     ce4:	aa1103e2 	mov	x2, x17
     ce8:	aa1003e1 	mov	x1, x16
     cec:	aa0f03e0 	mov	x0, x15
     cf0:	97fffdbc 	bl	3e0 <_out_rev>
}
     cf4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     cf8:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     cfc:	37100207 	tbnz	w7, #2, d3c <_ftoa+0x1dc>
     d00:	d2800060 	mov	x0, #0x3                   	// #3
     d04:	2a0503e6 	mov	w6, w5
     d08:	f0000064 	adrp	x4, f000 <_fstat_r+0x40>
     d0c:	91118084 	add	x4, x4, #0x460
     d10:	aa0003e5 	mov	x5, x0
     d14:	aa1203e3 	mov	x3, x18
     d18:	aa1103e2 	mov	x2, x17
     d1c:	aa1003e1 	mov	x1, x16
     d20:	aa0f03e0 	mov	x0, x15
     d24:	17fffdaf 	b	3e0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     d28:	2a0503e6 	mov	w6, w5
     d2c:	f0000064 	adrp	x4, f000 <_fstat_r+0x40>
     d30:	d2800065 	mov	x5, #0x3                   	// #3
     d34:	9111c084 	add	x4, x4, #0x470
     d38:	17fffdaa 	b	3e0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     d3c:	d2800080 	mov	x0, #0x4                   	// #4
     d40:	2a0503e6 	mov	w6, w5
     d44:	f0000064 	adrp	x4, f000 <_fstat_r+0x40>
     d48:	9111a084 	add	x4, x4, #0x468
     d4c:	aa0003e5 	mov	x5, x0
     d50:	aa1203e3 	mov	x3, x18
     d54:	aa1103e2 	mov	x2, x17
     d58:	aa1003e1 	mov	x1, x16
     d5c:	aa0f03e0 	mov	x0, x15
     d60:	17fffda0 	b	3e0 <_out_rev>
        value = 0 - value;
     d64:	2f00e401 	movi	d1, #0x0
        negative = true;
     d68:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     d6c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     d70:	3757f367 	tbnz	w7, #10, bdc <_ftoa+0x7c>
     d74:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     d78:	910043ec 	add	x12, sp, #0x10
     d7c:	f2e825c0 	movk	x0, #0x412e, lsl #48
     d80:	d2800008 	mov	x8, #0x0                   	// #0
     d84:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     d88:	528000c4 	mov	w4, #0x6                   	// #6
     d8c:	17ffffa3 	b	c18 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     d90:	2a0703e6 	mov	w6, w7
     d94:	aa1203e3 	mov	x3, x18
     d98:	aa1103e2 	mov	x2, x17
     d9c:	aa1003e1 	mov	x1, x16
     da0:	aa0f03e0 	mov	x0, x15
     da4:	17fffe87 	b	7c0 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     da8:	2a0503e6 	mov	w6, w5
     dac:	f0000064 	adrp	x4, f000 <_fstat_r+0x40>
     db0:	d2800085 	mov	x5, #0x4                   	// #4
     db4:	9111e084 	add	x4, x4, #0x478
     db8:	17fffd8a 	b	3e0 <_out_rev>
     dbc:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     dc0:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     dc4:	0b080021 	add	w1, w1, w8
     dc8:	f29999a2 	movk	x2, #0xcccd
     dcc:	1400000d 	b	e00 <_ftoa+0x2a0>
     dd0:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     dd4:	f10025df 	cmp	x14, #0x9
            --count;
     dd8:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     ddc:	91000509 	add	x9, x8, #0x1
     de0:	8b0b096d 	add	x13, x11, x11, lsl #2
     de4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     de8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     dec:	1100c1ab 	add	w11, w13, #0x30
     df0:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     df4:	54000569 	b.ls	ea0 <_ftoa+0x340>  // b.plast
            --count;
     df8:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     dfc:	aa0903e8 	mov	x8, x9
     e00:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     e04:	6b01009f 	cmp	w4, w1
     e08:	54fffe41 	b.ne	dd0 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     e0c:	120004e0 	and	w0, w7, #0x3
     e10:	7100041f 	cmp	w0, #0x1
     e14:	54fff601 	b.ne	cd4 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     e18:	34fff525 	cbz	w5, cbc <_ftoa+0x15c>
     e1c:	35000763 	cbnz	w3, f08 <_ftoa+0x3a8>
     e20:	721e04ff 	tst	w7, #0xc
     e24:	54000721 	b.ne	f08 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e28:	2a0503e1 	mov	w1, w5
     e2c:	eb01011f 	cmp	x8, x1
     e30:	54fff462 	b.cs	cbc <_ftoa+0x15c>  // b.hs, b.nlast
     e34:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     e38:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e3c:	54fff4c8 	b.hi	cd4 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     e40:	91000508 	add	x8, x8, #0x1
     e44:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e48:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     e4c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e50:	54fff360 	b.eq	cbc <_ftoa+0x15c>  // b.none
     e54:	f100811f 	cmp	x8, #0x20
     e58:	54ffff41 	b.ne	e40 <_ftoa+0x2e0>  // b.any
     e5c:	17ffff9e 	b	cd4 <_ftoa+0x174>
        ++frac;
     e60:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
     e64:	9e6301c1 	ucvtf	d1, x14
     e68:	1e622030 	fcmpe	d1, d2
     e6c:	5400004a 	b.ge	e74 <_ftoa+0x314>  // b.tcont
     e70:	17ffff78 	b	c50 <_ftoa+0xf0>
            ++whole;
     e74:	1100054a 	add	w10, w10, #0x1
            frac = 0;
     e78:	d280000e 	mov	x14, #0x0                   	// #0
     e7c:	17ffff75 	b	c50 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
     e80:	371003c7 	tbnz	w7, #2, ef8 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
     e84:	361ff287 	tbz	w7, #3, cd4 <_ftoa+0x174>
            buf[len++] = ' ';
     e88:	52800400 	mov	w0, #0x20                  	// #32
     e8c:	38286980 	strb	w0, [x12, x8]
     e90:	91000508 	add	x8, x8, #0x1
     e94:	17ffff90 	b	cd4 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     e98:	54ffee8c 	b.gt	c68 <_ftoa+0x108>
     e9c:	17ffff75 	b	c70 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ea0:	f100813f 	cmp	x9, #0x20
     ea4:	54000420 	b.eq	f28 <_ftoa+0x3c8>  // b.none
     ea8:	91000901 	add	x1, x8, #0x2
     eac:	51000884 	sub	w4, w4, #0x2
     eb0:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
     eb4:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     eb8:	34000340 	cbz	w0, f20 <_ftoa+0x3c0>
     ebc:	d503201f 	nop
            buf[len++] = '0';
     ec0:	91000529 	add	x9, x9, #0x1
     ec4:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ec8:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
     ecc:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ed0:	540002c0 	b.eq	f28 <_ftoa+0x3c8>  // b.none
     ed4:	eb01013f 	cmp	x9, x1
     ed8:	54ffff41 	b.ne	ec0 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
     edc:	528005c0 	mov	w0, #0x2e                  	// #46
     ee0:	91000428 	add	x8, x1, #0x1
     ee4:	38216980 	strb	w0, [x12, x1]
     ee8:	17ffff62 	b	c70 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
     eec:	3607eb2e 	tbz	w14, #0, c50 <_ftoa+0xf0>
        ++frac;
     ef0:	910005ce 	add	x14, x14, #0x1
     ef4:	17ffff57 	b	c50 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
     ef8:	52800560 	mov	w0, #0x2b                  	// #43
     efc:	38286980 	strb	w0, [x12, x8]
     f00:	91000508 	add	x8, x8, #0x1
     f04:	17ffff74 	b	cd4 <_ftoa+0x174>
            width--;
     f08:	510004a5 	sub	w5, w5, #0x1
     f0c:	17ffffc7 	b	e28 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
     f10:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     f14:	91150000 	add	x0, x0, #0x540
     f18:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
     f1c:	17ffff3f 	b	c18 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f20:	aa0903e1 	mov	x1, x9
     f24:	17ffffee 	b	edc <_ftoa+0x37c>
            buf[len++] = '0';
     f28:	aa0903e8 	mov	x8, x9
     f2c:	17ffffb8 	b	e0c <_ftoa+0x2ac>

0000000000000f30 <_out_char>:
    if (character) {
     f30:	72001c00 	ands	w0, w0, #0xff
     f34:	54000041 	b.ne	f3c <_out_char+0xc>  // b.any
}
     f38:	d65f03c0 	ret
        _putchar(character);
     f3c:	17fffd05 	b	350 <putc>

0000000000000f40 <_out_fct>:
    if (character) {
     f40:	72001c00 	ands	w0, w0, #0xff
     f44:	54000080 	b.eq	f54 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
     f48:	a9400422 	ldp	x2, x1, [x1]
     f4c:	aa0203f0 	mov	x16, x2
     f50:	d61f0200 	br	x16
}
     f54:	d65f03c0 	ret
     f58:	d503201f 	nop
     f5c:	d503201f 	nop

0000000000000f60 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
     f60:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
     f64:	f100003f 	cmp	x1, #0x0
{
     f68:	a9017bfd 	stp	x29, x30, [sp, #16]
     f6c:	910043fd 	add	x29, sp, #0x10
     f70:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
     f74:	90000013 	adrp	x19, 0 <main>
     f78:	910f4273 	add	x19, x19, #0x3d0
{
     f7c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
     f80:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
     f84:	aa0103fa 	mov	x26, x1
     f88:	a90673fb 	stp	x27, x28, [sp, #96]
     f8c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
     f90:	d280001b 	mov	x27, #0x0                   	// #0
     f94:	b9401880 	ldr	w0, [x4, #24]
     f98:	b9007be0 	str	w0, [sp, #120]
     f9c:	f9400480 	ldr	x0, [x4, #8]
     fa0:	f90047e0 	str	x0, [sp, #136]
     fa4:	39400065 	ldrb	w5, [x3]
     fa8:	f9400880 	ldr	x0, [x4, #16]
     fac:	f9004be0 	str	x0, [sp, #144]
     fb0:	b9401c80 	ldr	w0, [x4, #28]
     fb4:	b900abe0 	str	w0, [sp, #168]
     fb8:	f9400094 	ldr	x20, [x4]
     fbc:	34003ae5 	cbz	w5, 1718 <_vsnprintf+0x7b8>
     fc0:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
     fc4:	f0000078 	adrp	x24, f000 <_fstat_r+0x40>
     fc8:	91120300 	add	x0, x24, #0x480
     fcc:	aa0303f9 	mov	x25, x3
     fd0:	f90043e0 	str	x0, [sp, #128]
     fd4:	f0000060 	adrp	x0, f000 <_fstat_r+0x40>
     fd8:	9114a000 	add	x0, x0, #0x528
     fdc:	f9004fe0 	str	x0, [sp, #152]
     fe0:	1400000a 	b	1008 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
     fe4:	91000764 	add	x4, x27, #0x1
     fe8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
     fec:	aa1b03e2 	mov	x2, x27
     ff0:	aa1c03e3 	mov	x3, x28
     ff4:	aa1a03e1 	mov	x1, x26
     ff8:	aa0403fb 	mov	x27, x4
     ffc:	d63f0260 	blr	x19
    while (*format) {
    1000:	39400325 	ldrb	w5, [x25]
    1004:	34000c85 	cbz	w5, 1194 <_vsnprintf+0x234>
            format++;
    1008:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    100c:	710094bf 	cmp	w5, #0x25
    1010:	54fffea1 	b.ne	fe4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    1014:	aa1903e8 	mov	x8, x25
        flags = 0U;
    1018:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    101c:	38401500 	ldrb	w0, [x8], #1
    1020:	7100ac1f 	cmp	w0, #0x2b
    1024:	54000180 	b.eq	1054 <_vsnprintf+0xf4>  // b.none
    1028:	540001c8 	b.hi	1060 <_vsnprintf+0x100>  // b.pmore
    102c:	7100801f 	cmp	w0, #0x20
    1030:	54000260 	b.eq	107c <_vsnprintf+0x11c>  // b.none
    1034:	71008c1f 	cmp	w0, #0x23
    1038:	540002e1 	b.ne	1094 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    103c:	321c00c6 	orr	w6, w6, #0x10
            format++;
    1040:	aa0803f9 	mov	x25, x8
            switch (*format) {
    1044:	aa1903e8 	mov	x8, x25
    1048:	38401500 	ldrb	w0, [x8], #1
    104c:	7100ac1f 	cmp	w0, #0x2b
    1050:	54fffec1 	b.ne	1028 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    1054:	321e00c6 	orr	w6, w6, #0x4
            format++;
    1058:	aa0803f9 	mov	x25, x8
    105c:	17fffffa 	b	1044 <_vsnprintf+0xe4>
            switch (*format) {
    1060:	7100b41f 	cmp	w0, #0x2d
    1064:	54000120 	b.eq	1088 <_vsnprintf+0x128>  // b.none
    1068:	7100c01f 	cmp	w0, #0x30
    106c:	540062c1 	b.ne	1cc4 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    1070:	320000c6 	orr	w6, w6, #0x1
            format++;
    1074:	aa0803f9 	mov	x25, x8
    1078:	17fffff3 	b	1044 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    107c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    1080:	aa0803f9 	mov	x25, x8
    1084:	17fffff0 	b	1044 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    1088:	321f00c6 	orr	w6, w6, #0x2
            format++;
    108c:	aa0803f9 	mov	x25, x8
    1090:	17ffffed 	b	1044 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    1094:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    1098:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    109c:	540002e0 	b.eq	10f8 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    10a0:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    10a4:	7101b01f 	cmp	w0, #0x6c
            format++;
    10a8:	aa0803e4 	mov	x4, x8
        switch (*format) {
    10ac:	54001f20 	b.eq	1490 <_vsnprintf+0x530>  // b.none
    10b0:	54000588 	b.hi	1160 <_vsnprintf+0x200>  // b.pmore
    10b4:	7101a01f 	cmp	w0, #0x68
    10b8:	54001e20 	b.eq	147c <_vsnprintf+0x51c>  // b.none
    10bc:	7101a81f 	cmp	w0, #0x6a
    10c0:	54006241 	b.ne	1d08 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    10c4:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    10c8:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    10cc:	51009402 	sub	w2, w0, #0x25
            format++;
    10d0:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    10d4:	71014c5f 	cmp	w2, #0x53
    10d8:	54000069 	b.ls	10e4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    10dc:	91000764 	add	x4, x27, #0x1
    10e0:	17ffffc3 	b	fec <_vsnprintf+0x8c>
        switch (*format) {
    10e4:	f94043e1 	ldr	x1, [sp, #128]
    10e8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    10ec:	10000062 	adr	x2, 10f8 <_vsnprintf+0x198>
    10f0:	8b21a841 	add	x1, x2, w1, sxth #2
    10f4:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    10f8:	b9407be0 	ldr	w0, [sp, #120]
    10fc:	37f806c0 	tbnz	w0, #31, 11d4 <_vsnprintf+0x274>
    1100:	91002e82 	add	x2, x20, #0xb
    1104:	aa1403e0 	mov	x0, x20
    1108:	927df054 	and	x20, x2, #0xfffffffffffffff8
    110c:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    1110:	36f80078 	tbz	w24, #31, 111c <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    1114:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    1118:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    111c:	39400720 	ldrb	w0, [x25, #1]
            format++;
    1120:	aa0803f9 	mov	x25, x8
    1124:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    1128:	7100b81f 	cmp	w0, #0x2e
    112c:	54fffba1 	b.ne	10a0 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    1130:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    1134:	321600c6 	orr	w6, w6, #0x400
            format++;
    1138:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    113c:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1140:	12001c42 	and	w2, w2, #0xff
    1144:	7100245f 	cmp	w2, #0x9
    1148:	54001b29 	b.ls	14ac <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    114c:	7100a81f 	cmp	w0, #0x2a
    1150:	54002a20 	b.eq	1694 <_vsnprintf+0x734>  // b.none
            format++;
    1154:	aa0803f9 	mov	x25, x8
    1158:	91000508 	add	x8, x8, #0x1
    115c:	17ffffd1 	b	10a0 <_vsnprintf+0x140>
        switch (*format) {
    1160:	7101d01f 	cmp	w0, #0x74
    1164:	54fffb00 	b.eq	10c4 <_vsnprintf+0x164>  // b.none
    1168:	7101e81f 	cmp	w0, #0x7a
    116c:	54fffac0 	b.eq	10c4 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1170:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1174:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1178:	7100245f 	cmp	w2, #0x9
    117c:	54fffb08 	b.hi	10dc <_vsnprintf+0x17c>  // b.pmore
    1180:	f9404fe1 	ldr	x1, [sp, #152]
    1184:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1188:	10000062 	adr	x2, 1194 <_vsnprintf+0x234>
    118c:	8b21a841 	add	x1, x2, w1, sxth #2
    1190:	d61f0020 	br	x1
    1194:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    1198:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    119c:	eb1b039f 	cmp	x28, x27
    11a0:	d1000782 	sub	x2, x28, #0x1
    11a4:	aa1a03e1 	mov	x1, x26
    11a8:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    11ac:	aa1c03e3 	mov	x3, x28
    11b0:	52800000 	mov	w0, #0x0                   	// #0
    11b4:	d63f0260 	blr	x19
}
    11b8:	2a1403e0 	mov	w0, w20
    11bc:	a9417bfd 	ldp	x29, x30, [sp, #16]
    11c0:	a94253f3 	ldp	x19, x20, [sp, #32]
    11c4:	a9456bf9 	ldp	x25, x26, [sp, #80]
    11c8:	a94673fb 	ldp	x27, x28, [sp, #96]
    11cc:	9102c3ff 	add	sp, sp, #0xb0
    11d0:	d65f03c0 	ret
            const int w = va_arg(va, int);
    11d4:	b9407be0 	ldr	w0, [sp, #120]
    11d8:	11002002 	add	w2, w0, #0x8
    11dc:	7100005f 	cmp	w2, #0x0
    11e0:	5400228d 	b.le	1630 <_vsnprintf+0x6d0>
    11e4:	91002e84 	add	x4, x20, #0xb
    11e8:	aa1403e0 	mov	x0, x20
    11ec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    11f0:	b9007be2 	str	w2, [sp, #120]
    11f4:	17ffffc6 	b	110c <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    11f8:	121a7802 	and	w2, w0, #0xffffffdf
    11fc:	7101605f 	cmp	w2, #0x58
    1200:	54001781 	b.ne	14f0 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    1204:	7101601f 	cmp	w0, #0x58
    1208:	54003c81 	b.ne	1998 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    120c:	321b00c6 	orr	w6, w6, #0x20
    1210:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1214:	121c74c6 	and	w6, w6, #0xfffffff3
    1218:	140000c0 	b	1518 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    121c:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    1220:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    1224:	71011c5f 	cmp	w2, #0x47
    1228:	321500c2 	orr	w2, w6, #0x800
    122c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    1230:	7101141f 	cmp	w0, #0x45
    1234:	321b00c0 	orr	w0, w6, #0x20
    1238:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    123c:	b940abe0 	ldr	w0, [sp, #168]
    1240:	37f81c20 	tbnz	w0, #31, 15c4 <_vsnprintf+0x664>
    1244:	91003e82 	add	x2, x20, #0xf
    1248:	aa1403e0 	mov	x0, x20
    124c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1250:	fd400000 	ldr	d0, [x0]
    1254:	aa1b03e2 	mov	x2, x27
    1258:	2a1803e5 	mov	w5, w24
    125c:	2a1703e4 	mov	w4, w23
    1260:	aa1c03e3 	mov	x3, x28
    1264:	aa1a03e1 	mov	x1, x26
    1268:	aa1303e0 	mov	x0, x19
    126c:	97fffd55 	bl	7c0 <_etoa>
    1270:	aa0003fb 	mov	x27, x0
            break;
    1274:	17ffff63 	b	1000 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1278:	7101181f 	cmp	w0, #0x46
    127c:	321b00c0 	orr	w0, w6, #0x20
    1280:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1284:	b940abe0 	ldr	w0, [sp, #168]
    1288:	37f818c0 	tbnz	w0, #31, 15a0 <_vsnprintf+0x640>
    128c:	91003e82 	add	x2, x20, #0xf
    1290:	aa1403e0 	mov	x0, x20
    1294:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1298:	fd400000 	ldr	d0, [x0]
    129c:	aa1b03e2 	mov	x2, x27
    12a0:	2a1803e5 	mov	w5, w24
    12a4:	2a1703e4 	mov	w4, w23
    12a8:	aa1c03e3 	mov	x3, x28
    12ac:	aa1a03e1 	mov	x1, x26
    12b0:	aa1303e0 	mov	x0, x19
    12b4:	97fffe2b 	bl	b60 <_ftoa>
    12b8:	aa0003fb 	mov	x27, x0
            break;
    12bc:	17ffff51 	b	1000 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    12c0:	91000760 	add	x0, x27, #0x1
    12c4:	aa1b03e2 	mov	x2, x27
    12c8:	aa1c03e3 	mov	x3, x28
    12cc:	aa0003fb 	mov	x27, x0
    12d0:	aa1a03e1 	mov	x1, x26
    12d4:	528004a0 	mov	w0, #0x25                  	// #37
    12d8:	d63f0260 	blr	x19
            break;
    12dc:	17ffff49 	b	1000 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    12e0:	52800420 	mov	w0, #0x21                  	// #33
    12e4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    12e8:	b9407be0 	ldr	w0, [sp, #120]
    12ec:	37f817e0 	tbnz	w0, #31, 15e8 <_vsnprintf+0x688>
    12f0:	91003e82 	add	x2, x20, #0xf
    12f4:	aa1403e0 	mov	x0, x20
    12f8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    12fc:	2a1703e7 	mov	w7, w23
    1300:	aa1b03e2 	mov	x2, x27
    1304:	f9400004 	ldr	x4, [x0]
    1308:	52800200 	mov	w0, #0x10                  	// #16
    130c:	b90003e0 	str	w0, [sp]
    1310:	b9000be6 	str	w6, [sp, #8]
    1314:	d2800206 	mov	x6, #0x10                  	// #16
    1318:	52800005 	mov	w5, #0x0                   	// #0
    131c:	aa1c03e3 	mov	x3, x28
    1320:	aa1a03e1 	mov	x1, x26
    1324:	aa1303e0 	mov	x0, x19
    1328:	97fffc72 	bl	4f0 <_ntoa_long>
    132c:	aa0003fb 	mov	x27, x0
            break;
    1330:	17ffff34 	b	1000 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    1334:	a9035bf5 	stp	x21, x22, [sp, #48]
    1338:	36082306 	tbz	w6, #1, 1798 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    133c:	b9407be0 	ldr	w0, [sp, #120]
    1340:	37f82a20 	tbnz	w0, #31, 1884 <_vsnprintf+0x924>
    1344:	91002e82 	add	x2, x20, #0xb
    1348:	aa1403e0 	mov	x0, x20
    134c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1350:	39400000 	ldrb	w0, [x0]
    1354:	aa1b03e2 	mov	x2, x27
    1358:	aa1c03e3 	mov	x3, x28
    135c:	aa1a03e1 	mov	x1, x26
    1360:	91000775 	add	x21, x27, #0x1
    1364:	d63f0260 	blr	x19
                while (l++ < width) {
    1368:	51000b00 	sub	w0, w24, #0x2
    136c:	91000b6a 	add	x10, x27, #0x2
    1370:	7100071f 	cmp	w24, #0x1
    1374:	8b00015b 	add	x27, x10, x0
    1378:	540007c9 	b.ls	1470 <_vsnprintf+0x510>  // b.plast
    137c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1380:	aa1503e2 	mov	x2, x21
    1384:	aa1c03e3 	mov	x3, x28
    1388:	910006b5 	add	x21, x21, #0x1
    138c:	aa1a03e1 	mov	x1, x26
    1390:	52800400 	mov	w0, #0x20                  	// #32
    1394:	d63f0260 	blr	x19
                while (l++ < width) {
    1398:	eb1b02bf 	cmp	x21, x27
    139c:	54ffff21 	b.ne	1380 <_vsnprintf+0x420>  // b.any
    13a0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    13a4:	17ffff17 	b	1000 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    13a8:	b9407be0 	ldr	w0, [sp, #120]
    13ac:	a9035bf5 	stp	x21, x22, [sp, #48]
    13b0:	37f812e0 	tbnz	w0, #31, 160c <_vsnprintf+0x6ac>
    13b4:	91003e82 	add	x2, x20, #0xf
    13b8:	aa1403e0 	mov	x0, x20
    13bc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13c0:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    13c4:	394002a8 	ldrb	w8, [x21]
    13c8:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    13cc:	350017d7 	cbnz	w23, 16c4 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    13d0:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    13d4:	340035c8 	cbz	w8, 1a8c <_vsnprintf+0xb2c>
    13d8:	91000456 	add	x22, x2, #0x1
    13dc:	aa1503e2 	mov	x2, x21
    13e0:	8b1602b6 	add	x22, x21, x22
    13e4:	14000003 	b	13f0 <_vsnprintf+0x490>
    13e8:	eb0202df 	cmp	x22, x2
    13ec:	54001900 	b.eq	170c <_vsnprintf+0x7ac>  // b.none
    13f0:	38401c44 	ldrb	w4, [x2, #1]!
    13f4:	35ffffa4 	cbnz	w4, 13e8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    13f8:	4b150041 	sub	w1, w2, w21
    13fc:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    1400:	121600c1 	and	w1, w6, #0x400
    1404:	b9007fe1 	str	w1, [sp, #124]
    1408:	365000a6 	tbz	w6, #10, 141c <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    140c:	b940a3e1 	ldr	w1, [sp, #160]
    1410:	6b17003f 	cmp	w1, w23
    1414:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    1418:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    141c:	121f00c1 	and	w1, w6, #0x2
    1420:	b900afe1 	str	w1, [sp, #172]
    1424:	36081826 	tbz	w6, #1, 1728 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1428:	34001108 	cbz	w8, 1648 <_vsnprintf+0x6e8>
    142c:	aa1b03e2 	mov	x2, x27
    1430:	cb1b02b6 	sub	x22, x21, x27
    1434:	14000002 	b	143c <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    1438:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    143c:	b9407fe1 	ldr	w1, [sp, #124]
    1440:	34000081 	cbz	w1, 1450 <_vsnprintf+0x4f0>
    1444:	510006e4 	sub	w4, w23, #0x1
    1448:	340016d7 	cbz	w23, 1720 <_vsnprintf+0x7c0>
    144c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    1450:	91000455 	add	x21, x2, #0x1
    1454:	aa1c03e3 	mov	x3, x28
    1458:	aa1a03e1 	mov	x1, x26
    145c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1460:	38756ac0 	ldrb	w0, [x22, x21]
    1464:	35fffea0 	cbnz	w0, 1438 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1468:	b940afe0 	ldr	w0, [sp, #172]
    146c:	35000ec0 	cbnz	w0, 1644 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1470:	aa1503fb 	mov	x27, x21
    1474:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1478:	17fffee2 	b	1000 <_vsnprintf+0xa0>
            if (*format == 'h') {
    147c:	39400720 	ldrb	w0, [x25, #1]
    1480:	7101a01f 	cmp	w0, #0x68
    1484:	540013c0 	b.eq	16fc <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1488:	321900c6 	orr	w6, w6, #0x80
    148c:	17ffff10 	b	10cc <_vsnprintf+0x16c>
            if (*format == 'l') {
    1490:	39400720 	ldrb	w0, [x25, #1]
    1494:	7101b01f 	cmp	w0, #0x6c
    1498:	54ffe181 	b.ne	10c8 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    149c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    14a0:	321804c6 	orr	w6, w6, #0x300
                format++;
    14a4:	91000b24 	add	x4, x25, #0x2
    14a8:	17ffff09 	b	10cc <_vsnprintf+0x16c>
    unsigned int i = 0U;
    14ac:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    14b0:	52800148 	mov	w8, #0xa                   	// #10
    14b4:	d503201f 	nop
    14b8:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    14bc:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    14c0:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    14c4:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    14c8:	12001c42 	and	w2, w2, #0xff
    14cc:	7100245f 	cmp	w2, #0x9
    14d0:	54ffff49 	b.ls	14b8 <_vsnprintf+0x558>  // b.plast
    14d4:	aa0403f9 	mov	x25, x4
    14d8:	91000488 	add	x8, x4, #0x1
    14dc:	17fffef2 	b	10a4 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    14e0:	121a7802 	and	w2, w0, #0xffffffdf
    14e4:	7101605f 	cmp	w2, #0x58
    14e8:	54002580 	b.eq	1998 <_vsnprintf+0xa38>  // b.none
    14ec:	d503201f 	nop
            } else if (*format == 'o') {
    14f0:	7101bc1f 	cmp	w0, #0x6f
    14f4:	540021a0 	b.eq	1928 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    14f8:	7101881f 	cmp	w0, #0x62
    14fc:	54002820 	b.eq	1a00 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    1500:	121b78c6 	and	w6, w6, #0xffffffef
    1504:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    1508:	7101a41f 	cmp	w0, #0x69
    150c:	52800c82 	mov	w2, #0x64                  	// #100
    1510:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    1514:	54ffe801 	b.ne	1214 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    1518:	f27600df 	tst	x6, #0x400
    151c:	121f78c2 	and	w2, w6, #0xfffffffe
    1520:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    1524:	7101a41f 	cmp	w0, #0x69
    1528:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    152c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    1530:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    1534:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    1538:	54000ce1 	b.ne	16d4 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    153c:	35002122 	cbnz	w2, 1960 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1540:	37402306 	tbnz	w6, #8, 19a0 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1544:	37301b26 	tbnz	w6, #6, 18a8 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1548:	36382926 	tbz	w6, #7, 1a6c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    154c:	37f83300 	tbnz	w0, #31, 1bac <_vsnprintf+0xc4c>
    1550:	91002e82 	add	x2, x20, #0xb
    1554:	aa1403e0 	mov	x0, x20
    1558:	927df054 	and	x20, x2, #0xfffffffffffffff8
    155c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1560:	710000bf 	cmp	w5, #0x0
    1564:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1568:	12003c84 	and	w4, w4, #0xffff
    156c:	2a1703e7 	mov	w7, w23
    1570:	531f7ca5 	lsr	w5, w5, #31
    1574:	93407c84 	sxtw	x4, w4
    1578:	aa1b03e2 	mov	x2, x27
    157c:	b9000be6 	str	w6, [sp, #8]
    1580:	aa0803e6 	mov	x6, x8
    1584:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1588:	aa1c03e3 	mov	x3, x28
    158c:	aa1a03e1 	mov	x1, x26
    1590:	aa1303e0 	mov	x0, x19
    1594:	97fffbd7 	bl	4f0 <_ntoa_long>
    1598:	aa0003fb 	mov	x27, x0
            break;
    159c:	17fffe99 	b	1000 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    15a0:	b940abe0 	ldr	w0, [sp, #168]
    15a4:	11004002 	add	w2, w0, #0x10
    15a8:	7100005f 	cmp	w2, #0x0
    15ac:	54001b4d 	b.le	1914 <_vsnprintf+0x9b4>
    15b0:	91003e84 	add	x4, x20, #0xf
    15b4:	aa1403e0 	mov	x0, x20
    15b8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    15bc:	b900abe2 	str	w2, [sp, #168]
    15c0:	17ffff36 	b	1298 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    15c4:	b940abe0 	ldr	w0, [sp, #168]
    15c8:	11004002 	add	w2, w0, #0x10
    15cc:	7100005f 	cmp	w2, #0x0
    15d0:	5400198d 	b.le	1900 <_vsnprintf+0x9a0>
    15d4:	91003e84 	add	x4, x20, #0xf
    15d8:	aa1403e0 	mov	x0, x20
    15dc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    15e0:	b900abe2 	str	w2, [sp, #168]
    15e4:	17ffff1b 	b	1250 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    15e8:	b9407be0 	ldr	w0, [sp, #120]
    15ec:	11002002 	add	w2, w0, #0x8
    15f0:	7100005f 	cmp	w2, #0x0
    15f4:	540017cd 	b.le	18ec <_vsnprintf+0x98c>
    15f8:	91003e84 	add	x4, x20, #0xf
    15fc:	aa1403e0 	mov	x0, x20
    1600:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1604:	b9007be2 	str	w2, [sp, #120]
    1608:	17ffff3d 	b	12fc <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    160c:	b9407be0 	ldr	w0, [sp, #120]
    1610:	11002002 	add	w2, w0, #0x8
    1614:	7100005f 	cmp	w2, #0x0
    1618:	5400160d 	b.le	18d8 <_vsnprintf+0x978>
    161c:	91003e84 	add	x4, x20, #0xf
    1620:	aa1403e0 	mov	x0, x20
    1624:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1628:	b9007be2 	str	w2, [sp, #120]
    162c:	17ffff65 	b	13c0 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    1630:	f94047e1 	ldr	x1, [sp, #136]
    1634:	b9407be0 	ldr	w0, [sp, #120]
    1638:	b9007be2 	str	w2, [sp, #120]
    163c:	8b20c020 	add	x0, x1, w0, sxtw
    1640:	17fffeb3 	b	110c <_vsnprintf+0x1ac>
    1644:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1648:	b940a3e0 	ldr	w0, [sp, #160]
    164c:	6b18001f 	cmp	w0, w24
    1650:	540009e2 	b.cs	178c <_vsnprintf+0x82c>  // b.hs, b.nlast
    1654:	51000704 	sub	w4, w24, #0x1
    1658:	91000776 	add	x22, x27, #0x1
    165c:	4b000084 	sub	w4, w4, w0
    1660:	8b160095 	add	x21, x4, x22
    1664:	14000002 	b	166c <_vsnprintf+0x70c>
    1668:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    166c:	aa1b03e2 	mov	x2, x27
    1670:	aa1c03e3 	mov	x3, x28
    1674:	aa1a03e1 	mov	x1, x26
    1678:	52800400 	mov	w0, #0x20                  	// #32
    167c:	d63f0260 	blr	x19
    1680:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1684:	eb1502df 	cmp	x22, x21
    1688:	54ffff01 	b.ne	1668 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    168c:	aa1503fb 	mov	x27, x21
    1690:	17ffff79 	b	1474 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    1694:	b9407be0 	ldr	w0, [sp, #120]
    1698:	37f80b80 	tbnz	w0, #31, 1808 <_vsnprintf+0x8a8>
    169c:	91002e82 	add	x2, x20, #0xb
    16a0:	aa1403e0 	mov	x0, x20
    16a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    16a8:	b9400007 	ldr	w7, [x0]
                format++;
    16ac:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    16b0:	39400320 	ldrb	w0, [x25]
    16b4:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    16b8:	710000ff 	cmp	w7, #0x0
    16bc:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    16c0:	17fffe79 	b	10a4 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    16c4:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    16c8:	34001e28 	cbz	w8, 1a8c <_vsnprintf+0xb2c>
    16cc:	d1000442 	sub	x2, x2, #0x1
    16d0:	17ffff42 	b	13d8 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    16d4:	35001302 	cbnz	w2, 1934 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    16d8:	37401806 	tbnz	w6, #8, 19d8 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    16dc:	37300ba6 	tbnz	w6, #6, 1850 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    16e0:	36381ba6 	tbz	w6, #7, 1a54 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    16e4:	37f82500 	tbnz	w0, #31, 1b84 <_vsnprintf+0xc24>
    16e8:	aa1403e0 	mov	x0, x20
    16ec:	91002e82 	add	x2, x20, #0xb
    16f0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    16f4:	79400004 	ldrh	w4, [x0]
    16f8:	1400005b 	b	1864 <_vsnprintf+0x904>
        switch (*format) {
    16fc:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    1700:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    1704:	91000b24 	add	x4, x25, #0x2
    1708:	17fffe71 	b	10cc <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    170c:	4b1502c1 	sub	w1, w22, w21
    1710:	b900a3e1 	str	w1, [sp, #160]
    1714:	17ffff3b 	b	1400 <_vsnprintf+0x4a0>
    while (*format) {
    1718:	52800014 	mov	w20, #0x0                   	// #0
    171c:	17fffea0 	b	119c <_vsnprintf+0x23c>
    1720:	aa0203f5 	mov	x21, x2
    1724:	17ffff51 	b	1468 <_vsnprintf+0x508>
                while (l++ < width) {
    1728:	b940a3e1 	ldr	w1, [sp, #160]
    172c:	6b18003f 	cmp	w1, w24
    1730:	11000420 	add	w0, w1, #0x1
    1734:	54002242 	b.cs	1b7c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    1738:	51000700 	sub	w0, w24, #0x1
    173c:	91000776 	add	x22, x27, #0x1
    1740:	4b010000 	sub	w0, w0, w1
    1744:	8b160000 	add	x0, x0, x22
    1748:	f90053e0 	str	x0, [sp, #160]
    174c:	14000002 	b	1754 <_vsnprintf+0x7f4>
    1750:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1754:	aa1b03e2 	mov	x2, x27
    1758:	52800400 	mov	w0, #0x20                  	// #32
    175c:	aa1c03e3 	mov	x3, x28
    1760:	aa1a03e1 	mov	x1, x26
    1764:	d63f0260 	blr	x19
    1768:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    176c:	f94053e0 	ldr	x0, [sp, #160]
    1770:	eb16001f 	cmp	x0, x22
    1774:	54fffee1 	b.ne	1750 <_vsnprintf+0x7f0>  // b.any
    1778:	394002a8 	ldrb	w8, [x21]
    177c:	11000700 	add	w0, w24, #0x1
    1780:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1784:	2a0803e0 	mov	w0, w8
    1788:	35ffe528 	cbnz	w8, 142c <_vsnprintf+0x4cc>
                while (l++ < width) {
    178c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    1790:	aa1503fb 	mov	x27, x21
    1794:	17ffff38 	b	1474 <_vsnprintf+0x514>
                while (l++ < width) {
    1798:	7100071f 	cmp	w24, #0x1
    179c:	54001ec9 	b.ls	1b74 <_vsnprintf+0xc14>  // b.plast
    17a0:	51000b05 	sub	w5, w24, #0x2
    17a4:	91000776 	add	x22, x27, #0x1
    17a8:	8b0502d5 	add	x21, x22, x5
    17ac:	14000002 	b	17b4 <_vsnprintf+0x854>
    17b0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    17b4:	aa1b03e2 	mov	x2, x27
    17b8:	aa1c03e3 	mov	x3, x28
    17bc:	aa1a03e1 	mov	x1, x26
    17c0:	52800400 	mov	w0, #0x20                  	// #32
    17c4:	d63f0260 	blr	x19
    17c8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    17cc:	eb1502df 	cmp	x22, x21
    17d0:	54ffff01 	b.ne	17b0 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    17d4:	b9407be0 	ldr	w0, [sp, #120]
    17d8:	37f802a0 	tbnz	w0, #31, 182c <_vsnprintf+0x8cc>
    17dc:	91002e82 	add	x2, x20, #0xb
    17e0:	aa1403e0 	mov	x0, x20
    17e4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    17e8:	39400000 	ldrb	w0, [x0]
    17ec:	aa1503e2 	mov	x2, x21
    17f0:	910006bb 	add	x27, x21, #0x1
    17f4:	aa1c03e3 	mov	x3, x28
    17f8:	aa1a03e1 	mov	x1, x26
    17fc:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    1800:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1804:	17fffdff 	b	1000 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    1808:	b9407be0 	ldr	w0, [sp, #120]
    180c:	11002002 	add	w2, w0, #0x8
    1810:	7100005f 	cmp	w2, #0x0
    1814:	5400058d 	b.le	18c4 <_vsnprintf+0x964>
    1818:	91002e84 	add	x4, x20, #0xb
    181c:	aa1403e0 	mov	x0, x20
    1820:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1824:	b9007be2 	str	w2, [sp, #120]
    1828:	17ffffa0 	b	16a8 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    182c:	b9407be0 	ldr	w0, [sp, #120]
    1830:	11002002 	add	w2, w0, #0x8
    1834:	7100005f 	cmp	w2, #0x0
    1838:	540016ed 	b.le	1b14 <_vsnprintf+0xbb4>
    183c:	91002e84 	add	x4, x20, #0xb
    1840:	aa1403e0 	mov	x0, x20
    1844:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1848:	b9007be2 	str	w2, [sp, #120]
    184c:	17ffffe7 	b	17e8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1850:	37f81220 	tbnz	w0, #31, 1a94 <_vsnprintf+0xb34>
    1854:	91002e82 	add	x2, x20, #0xb
    1858:	aa1403e0 	mov	x0, x20
    185c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1860:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1864:	2a1703e7 	mov	w7, w23
    1868:	2a0403e4 	mov	w4, w4
    186c:	b9000be6 	str	w6, [sp, #8]
    1870:	aa0803e6 	mov	x6, x8
    1874:	b90003f8 	str	w24, [sp]
    1878:	aa1b03e2 	mov	x2, x27
    187c:	52800005 	mov	w5, #0x0                   	// #0
    1880:	17ffff42 	b	1588 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1884:	b9407be0 	ldr	w0, [sp, #120]
    1888:	11002002 	add	w2, w0, #0x8
    188c:	7100005f 	cmp	w2, #0x0
    1890:	5400138d 	b.le	1b00 <_vsnprintf+0xba0>
    1894:	91002e84 	add	x4, x20, #0xb
    1898:	aa1403e0 	mov	x0, x20
    189c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    18a0:	b9007be2 	str	w2, [sp, #120]
    18a4:	17fffeab 	b	1350 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    18a8:	37f81080 	tbnz	w0, #31, 1ab8 <_vsnprintf+0xb58>
    18ac:	91002e82 	add	x2, x20, #0xb
    18b0:	aa1403e0 	mov	x0, x20
    18b4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    18b8:	39400005 	ldrb	w5, [x0]
    18bc:	2a0503e4 	mov	w4, w5
    18c0:	17ffff2b 	b	156c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    18c4:	f94047e1 	ldr	x1, [sp, #136]
    18c8:	b9407be0 	ldr	w0, [sp, #120]
    18cc:	b9007be2 	str	w2, [sp, #120]
    18d0:	8b20c020 	add	x0, x1, w0, sxtw
    18d4:	17ffff75 	b	16a8 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    18d8:	f94047e1 	ldr	x1, [sp, #136]
    18dc:	b9407be0 	ldr	w0, [sp, #120]
    18e0:	b9007be2 	str	w2, [sp, #120]
    18e4:	8b20c020 	add	x0, x1, w0, sxtw
    18e8:	17fffeb6 	b	13c0 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    18ec:	f94047e1 	ldr	x1, [sp, #136]
    18f0:	b9407be0 	ldr	w0, [sp, #120]
    18f4:	b9007be2 	str	w2, [sp, #120]
    18f8:	8b20c020 	add	x0, x1, w0, sxtw
    18fc:	17fffe80 	b	12fc <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1900:	f9404be1 	ldr	x1, [sp, #144]
    1904:	b940abe0 	ldr	w0, [sp, #168]
    1908:	b900abe2 	str	w2, [sp, #168]
    190c:	8b20c020 	add	x0, x1, w0, sxtw
    1910:	17fffe50 	b	1250 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1914:	f9404be1 	ldr	x1, [sp, #144]
    1918:	b940abe0 	ldr	w0, [sp, #168]
    191c:	b900abe2 	str	w2, [sp, #168]
    1920:	8b20c020 	add	x0, x1, w0, sxtw
    1924:	17fffe5d 	b	1298 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1928:	121c74c6 	and	w6, w6, #0xfffffff3
    192c:	d2800108 	mov	x8, #0x8                   	// #8
    1930:	17fffefa 	b	1518 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1934:	37f807e0 	tbnz	w0, #31, 1a30 <_vsnprintf+0xad0>
    1938:	91003e82 	add	x2, x20, #0xf
    193c:	aa1403e0 	mov	x0, x20
    1940:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1944:	2a1703e7 	mov	w7, w23
    1948:	aa1b03e2 	mov	x2, x27
    194c:	f9400004 	ldr	x4, [x0]
    1950:	b90003f8 	str	w24, [sp]
    1954:	b9000be6 	str	w6, [sp, #8]
    1958:	aa0803e6 	mov	x6, x8
    195c:	17fffe6f 	b	1318 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1960:	37f80560 	tbnz	w0, #31, 1a0c <_vsnprintf+0xaac>
    1964:	91003e82 	add	x2, x20, #0xf
    1968:	aa1403e0 	mov	x0, x20
    196c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1970:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1974:	2a1703e7 	mov	w7, w23
    1978:	aa1b03e2 	mov	x2, x27
    197c:	b90003f8 	str	w24, [sp]
    1980:	f10000bf 	cmp	x5, #0x0
    1984:	b9000be6 	str	w6, [sp, #8]
    1988:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    198c:	aa0803e6 	mov	x6, x8
    1990:	d37ffca5 	lsr	x5, x5, #63
    1994:	17fffe62 	b	131c <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1998:	d2800208 	mov	x8, #0x10                  	// #16
    199c:	17fffedb 	b	1508 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    19a0:	37f80c40 	tbnz	w0, #31, 1b28 <_vsnprintf+0xbc8>
    19a4:	91003e82 	add	x2, x20, #0xf
    19a8:	aa1403e0 	mov	x0, x20
    19ac:	927df054 	and	x20, x2, #0xfffffffffffffff8
    19b0:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    19b4:	2a1703e7 	mov	w7, w23
    19b8:	aa1b03e2 	mov	x2, x27
    19bc:	b90003f8 	str	w24, [sp]
    19c0:	f10000bf 	cmp	x5, #0x0
    19c4:	b9000be6 	str	w6, [sp, #8]
    19c8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    19cc:	aa0803e6 	mov	x6, x8
    19d0:	d37ffca5 	lsr	x5, x5, #63
    19d4:	17fffeed 	b	1588 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    19d8:	37f80820 	tbnz	w0, #31, 1adc <_vsnprintf+0xb7c>
    19dc:	91003e82 	add	x2, x20, #0xf
    19e0:	aa1403e0 	mov	x0, x20
    19e4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    19e8:	2a1703e7 	mov	w7, w23
    19ec:	f9400004 	ldr	x4, [x0]
    19f0:	b90003f8 	str	w24, [sp]
    19f4:	b9000be6 	str	w6, [sp, #8]
    19f8:	aa0803e6 	mov	x6, x8
    19fc:	17ffff9f 	b	1878 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1a00:	121c74c6 	and	w6, w6, #0xfffffff3
    1a04:	d2800048 	mov	x8, #0x2                   	// #2
    1a08:	17fffec4 	b	1518 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1a0c:	b9407be0 	ldr	w0, [sp, #120]
    1a10:	11002002 	add	w2, w0, #0x8
    1a14:	7100005f 	cmp	w2, #0x0
    1a18:	54000a4d 	b.le	1b60 <_vsnprintf+0xc00>
    1a1c:	91003e84 	add	x4, x20, #0xf
    1a20:	aa1403e0 	mov	x0, x20
    1a24:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a28:	b9007be2 	str	w2, [sp, #120]
    1a2c:	17ffffd1 	b	1970 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1a30:	b9407be0 	ldr	w0, [sp, #120]
    1a34:	11002002 	add	w2, w0, #0x8
    1a38:	7100005f 	cmp	w2, #0x0
    1a3c:	5400088d 	b.le	1b4c <_vsnprintf+0xbec>
    1a40:	91003e84 	add	x4, x20, #0xf
    1a44:	aa1403e0 	mov	x0, x20
    1a48:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a4c:	b9007be2 	str	w2, [sp, #120]
    1a50:	17ffffbd 	b	1944 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1a54:	37f80d00 	tbnz	w0, #31, 1bf4 <_vsnprintf+0xc94>
    1a58:	aa1403e0 	mov	x0, x20
    1a5c:	91002e82 	add	x2, x20, #0xb
    1a60:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a64:	b9400004 	ldr	w4, [x0]
    1a68:	17ffff7f 	b	1864 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1a6c:	37f80b20 	tbnz	w0, #31, 1bd0 <_vsnprintf+0xc70>
    1a70:	91002e82 	add	x2, x20, #0xb
    1a74:	aa1403e0 	mov	x0, x20
    1a78:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a7c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1a80:	710000bf 	cmp	w5, #0x0
    1a84:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1a88:	17fffeb9 	b	156c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1a8c:	b900a3ff 	str	wzr, [sp, #160]
    1a90:	17fffe5c 	b	1400 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1a94:	b9407be0 	ldr	w0, [sp, #120]
    1a98:	11002002 	add	w2, w0, #0x8
    1a9c:	7100005f 	cmp	w2, #0x0
    1aa0:	54000bed 	b.le	1c1c <_vsnprintf+0xcbc>
    1aa4:	91002e84 	add	x4, x20, #0xb
    1aa8:	aa1403e0 	mov	x0, x20
    1aac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ab0:	b9007be2 	str	w2, [sp, #120]
    1ab4:	17ffff6b 	b	1860 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1ab8:	b9407be0 	ldr	w0, [sp, #120]
    1abc:	11002002 	add	w2, w0, #0x8
    1ac0:	7100005f 	cmp	w2, #0x0
    1ac4:	54000b6d 	b.le	1c30 <_vsnprintf+0xcd0>
    1ac8:	91002e84 	add	x4, x20, #0xb
    1acc:	aa1403e0 	mov	x0, x20
    1ad0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ad4:	b9007be2 	str	w2, [sp, #120]
    1ad8:	17ffff78 	b	18b8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1adc:	b9407be0 	ldr	w0, [sp, #120]
    1ae0:	11002002 	add	w2, w0, #0x8
    1ae4:	7100005f 	cmp	w2, #0x0
    1ae8:	54000aed 	b.le	1c44 <_vsnprintf+0xce4>
    1aec:	91003e84 	add	x4, x20, #0xf
    1af0:	aa1403e0 	mov	x0, x20
    1af4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1af8:	b9007be2 	str	w2, [sp, #120]
    1afc:	17ffffbb 	b	19e8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1b00:	f94047e1 	ldr	x1, [sp, #136]
    1b04:	b9407be0 	ldr	w0, [sp, #120]
    1b08:	b9007be2 	str	w2, [sp, #120]
    1b0c:	8b20c020 	add	x0, x1, w0, sxtw
    1b10:	17fffe10 	b	1350 <_vsnprintf+0x3f0>
    1b14:	f94047e1 	ldr	x1, [sp, #136]
    1b18:	b9407be0 	ldr	w0, [sp, #120]
    1b1c:	b9007be2 	str	w2, [sp, #120]
    1b20:	8b20c020 	add	x0, x1, w0, sxtw
    1b24:	17ffff31 	b	17e8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1b28:	b9407be0 	ldr	w0, [sp, #120]
    1b2c:	11002002 	add	w2, w0, #0x8
    1b30:	7100005f 	cmp	w2, #0x0
    1b34:	5400092d 	b.le	1c58 <_vsnprintf+0xcf8>
    1b38:	91003e84 	add	x4, x20, #0xf
    1b3c:	aa1403e0 	mov	x0, x20
    1b40:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b44:	b9007be2 	str	w2, [sp, #120]
    1b48:	17ffff9a 	b	19b0 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1b4c:	f94047e1 	ldr	x1, [sp, #136]
    1b50:	b9407be0 	ldr	w0, [sp, #120]
    1b54:	b9007be2 	str	w2, [sp, #120]
    1b58:	8b20c020 	add	x0, x1, w0, sxtw
    1b5c:	17ffff7a 	b	1944 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1b60:	f94047e1 	ldr	x1, [sp, #136]
    1b64:	b9407be0 	ldr	w0, [sp, #120]
    1b68:	b9007be2 	str	w2, [sp, #120]
    1b6c:	8b20c020 	add	x0, x1, w0, sxtw
    1b70:	17ffff80 	b	1970 <_vsnprintf+0xa10>
                while (l++ < width) {
    1b74:	aa1b03f5 	mov	x21, x27
    1b78:	17ffff17 	b	17d4 <_vsnprintf+0x874>
                while (l++ < width) {
    1b7c:	b900a3e0 	str	w0, [sp, #160]
    1b80:	17ffff01 	b	1784 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1b84:	b9407be0 	ldr	w0, [sp, #120]
    1b88:	11002002 	add	w2, w0, #0x8
    1b8c:	7100005f 	cmp	w2, #0x0
    1b90:	5400078d 	b.le	1c80 <_vsnprintf+0xd20>
    1b94:	aa1403e0 	mov	x0, x20
    1b98:	91002e84 	add	x4, x20, #0xb
    1b9c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ba0:	b9007be2 	str	w2, [sp, #120]
    1ba4:	79400004 	ldrh	w4, [x0]
    1ba8:	17ffff2f 	b	1864 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1bac:	b9407be0 	ldr	w0, [sp, #120]
    1bb0:	11002002 	add	w2, w0, #0x8
    1bb4:	7100005f 	cmp	w2, #0x0
    1bb8:	540005ad 	b.le	1c6c <_vsnprintf+0xd0c>
    1bbc:	91002e84 	add	x4, x20, #0xb
    1bc0:	aa1403e0 	mov	x0, x20
    1bc4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bc8:	b9007be2 	str	w2, [sp, #120]
    1bcc:	17fffe64 	b	155c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1bd0:	b9407be0 	ldr	w0, [sp, #120]
    1bd4:	11002002 	add	w2, w0, #0x8
    1bd8:	7100005f 	cmp	w2, #0x0
    1bdc:	540005ed 	b.le	1c98 <_vsnprintf+0xd38>
    1be0:	91002e84 	add	x4, x20, #0xb
    1be4:	aa1403e0 	mov	x0, x20
    1be8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bec:	b9007be2 	str	w2, [sp, #120]
    1bf0:	17ffffa3 	b	1a7c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1bf4:	b9407be0 	ldr	w0, [sp, #120]
    1bf8:	11002002 	add	w2, w0, #0x8
    1bfc:	7100005f 	cmp	w2, #0x0
    1c00:	5400056d 	b.le	1cac <_vsnprintf+0xd4c>
    1c04:	aa1403e0 	mov	x0, x20
    1c08:	91002e84 	add	x4, x20, #0xb
    1c0c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c10:	b9007be2 	str	w2, [sp, #120]
    1c14:	b9400004 	ldr	w4, [x0]
    1c18:	17ffff13 	b	1864 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c1c:	f94047e1 	ldr	x1, [sp, #136]
    1c20:	b9407be0 	ldr	w0, [sp, #120]
    1c24:	b9007be2 	str	w2, [sp, #120]
    1c28:	8b20c020 	add	x0, x1, w0, sxtw
    1c2c:	17ffff0d 	b	1860 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c30:	f94047e1 	ldr	x1, [sp, #136]
    1c34:	b9407be0 	ldr	w0, [sp, #120]
    1c38:	b9007be2 	str	w2, [sp, #120]
    1c3c:	8b20c020 	add	x0, x1, w0, sxtw
    1c40:	17ffff1e 	b	18b8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1c44:	f94047e1 	ldr	x1, [sp, #136]
    1c48:	b9407be0 	ldr	w0, [sp, #120]
    1c4c:	b9007be2 	str	w2, [sp, #120]
    1c50:	8b20c020 	add	x0, x1, w0, sxtw
    1c54:	17ffff65 	b	19e8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1c58:	f94047e1 	ldr	x1, [sp, #136]
    1c5c:	b9407be0 	ldr	w0, [sp, #120]
    1c60:	b9007be2 	str	w2, [sp, #120]
    1c64:	8b20c020 	add	x0, x1, w0, sxtw
    1c68:	17ffff52 	b	19b0 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c6c:	f94047e1 	ldr	x1, [sp, #136]
    1c70:	b9407be0 	ldr	w0, [sp, #120]
    1c74:	b9007be2 	str	w2, [sp, #120]
    1c78:	8b20c020 	add	x0, x1, w0, sxtw
    1c7c:	17fffe38 	b	155c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c80:	f94047e1 	ldr	x1, [sp, #136]
    1c84:	b9407be0 	ldr	w0, [sp, #120]
    1c88:	b9007be2 	str	w2, [sp, #120]
    1c8c:	8b20c020 	add	x0, x1, w0, sxtw
    1c90:	79400004 	ldrh	w4, [x0]
    1c94:	17fffef4 	b	1864 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1c98:	f94047e1 	ldr	x1, [sp, #136]
    1c9c:	b9407be0 	ldr	w0, [sp, #120]
    1ca0:	b9007be2 	str	w2, [sp, #120]
    1ca4:	8b20c020 	add	x0, x1, w0, sxtw
    1ca8:	17ffff75 	b	1a7c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1cac:	f94047e1 	ldr	x1, [sp, #136]
    1cb0:	b9407be0 	ldr	w0, [sp, #120]
    1cb4:	b9007be2 	str	w2, [sp, #120]
    1cb8:	8b20c020 	add	x0, x1, w0, sxtw
    1cbc:	b9400004 	ldr	w4, [x0]
    1cc0:	17fffee9 	b	1864 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1cc4:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1cc8:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1ccc:	12001c42 	and	w2, w2, #0xff
    1cd0:	7100245f 	cmp	w2, #0x9
    1cd4:	54ffa2a8 	b.hi	1128 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1cd8:	52800142 	mov	w2, #0xa                   	// #10
    1cdc:	d503201f 	nop
    1ce0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1ce4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1ce8:	aa0803f9 	mov	x25, x8
    1cec:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1cf0:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1cf4:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1cf8:	12001c84 	and	w4, w4, #0xff
    1cfc:	7100249f 	cmp	w4, #0x9
    1d00:	54ffff09 	b.ls	1ce0 <_vsnprintf+0xd80>  // b.plast
    1d04:	17fffd09 	b	1128 <_vsnprintf+0x1c8>
        switch (*format) {
    1d08:	aa1903e4 	mov	x4, x25
    1d0c:	17fffcf0 	b	10cc <_vsnprintf+0x16c>

0000000000001d10 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1d10:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1d14:	910003fd 	mov	x29, sp
    1d18:	f9000bf3 	str	x19, [sp, #16]
    1d1c:	aa0003f3 	mov	x19, x0
    1d20:	3d801fe0 	str	q0, [sp, #112]
    1d24:	3d8023e1 	str	q1, [sp, #128]
    1d28:	3d8027e2 	str	q2, [sp, #144]
    1d2c:	3d802be3 	str	q3, [sp, #160]
    1d30:	3d802fe4 	str	q4, [sp, #176]
    1d34:	3d8033e5 	str	q5, [sp, #192]
    1d38:	3d8037e6 	str	q6, [sp, #208]
    1d3c:	3d803be7 	str	q7, [sp, #224]
    1d40:	a90f8be1 	stp	x1, x2, [sp, #248]
    1d44:	a91093e3 	stp	x3, x4, [sp, #264]
    1d48:	a9119be5 	stp	x5, x6, [sp, #280]
    1d4c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1d50:	97fff968 	bl	2f0 <init_uart_mmio>
    1d54:	72001c1f 	tst	w0, #0xff
    1d58:	540002e0 	b.eq	1db4 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1d5c:	9103c3e0 	add	x0, sp, #0xf0
    1d60:	9104c3e3 	add	x3, sp, #0x130
    1d64:	9104c3e4 	add	x4, sp, #0x130
    1d68:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1d6c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1d70:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d74:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1d78:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d7c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1d80:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d84:	f0ffffe0 	adrp	x0, 0 <main>
    1d88:	913cc000 	add	x0, x0, #0xf30
    1d8c:	910123e1 	add	x1, sp, #0x48
    1d90:	a94527e8 	ldp	x8, x9, [sp, #80]
    1d94:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1d98:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1d9c:	a90227e8 	stp	x8, x9, [sp, #32]
    1da0:	a9031fe6 	stp	x6, x7, [sp, #48]
    1da4:	97fffc6f 	bl	f60 <_vsnprintf>
    va_end(va);
    return ret;
}
    1da8:	f9400bf3 	ldr	x19, [sp, #16]
    1dac:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1db0:	d65f03c0 	ret
        return -1;
    1db4:	12800000 	mov	w0, #0xffffffff            	// #-1
    1db8:	17fffffc 	b	1da8 <printf+0x98>
    1dbc:	d503201f 	nop

0000000000001dc0 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1dc0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1dc4:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1dc8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1dcc:	910003fd 	mov	x29, sp
    va_start(va, format);
    1dd0:	910343eb 	add	x11, sp, #0xd0
    1dd4:	910403ea 	add	x10, sp, #0x100
    1dd8:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1ddc:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1de0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1de4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1de8:	f0ffffe0 	adrp	x0, 0 <main>
    1dec:	910ec000 	add	x0, x0, #0x3b0
    va_start(va, format);
    1df0:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1df4:	a94337ec 	ldp	x12, x13, [sp, #48]
    1df8:	a90137ec 	stp	x12, x13, [sp, #16]
    1dfc:	a94427e8 	ldp	x8, x9, [sp, #64]
    1e00:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1e04:	3d8017e0 	str	q0, [sp, #80]
    1e08:	3d801be1 	str	q1, [sp, #96]
    1e0c:	3d801fe2 	str	q2, [sp, #112]
    1e10:	3d8023e3 	str	q3, [sp, #128]
    1e14:	3d8027e4 	str	q4, [sp, #144]
    1e18:	3d802be5 	str	q5, [sp, #160]
    1e1c:	3d802fe6 	str	q6, [sp, #176]
    1e20:	3d8033e7 	str	q7, [sp, #192]
    1e24:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e28:	aa0a03e3 	mov	x3, x10
    1e2c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1e30:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e34:	910043e4 	add	x4, sp, #0x10
{
    1e38:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e3c:	97fffc49 	bl	f60 <_vsnprintf>
    va_end(va);
    return ret;
}
    1e40:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1e44:	d65f03c0 	ret
    1e48:	d503201f 	nop
    1e4c:	d503201f 	nop

0000000000001e50 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1e50:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1e54:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1e58:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1e5c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1e60:	910343ea 	add	x10, sp, #0xd0
    1e64:	910403e8 	add	x8, sp, #0x100
    1e68:	a90323e8 	stp	x8, x8, [sp, #48]
{
    1e6c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1e70:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1e74:	f90023ea 	str	x10, [sp, #64]
{
    1e78:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1e7c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1e80:	aa0803e2 	mov	x2, x8
    1e84:	a94337ec 	ldp	x12, x13, [sp, #48]
    1e88:	f0ffffe0 	adrp	x0, 0 <main>
    1e8c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1e90:	910ec000 	add	x0, x0, #0x3b0
    1e94:	a90137ec 	stp	x12, x13, [sp, #16]
    1e98:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1e9c:	3d8017e0 	str	q0, [sp, #80]
    1ea0:	3d801be1 	str	q1, [sp, #96]
    1ea4:	3d801fe2 	str	q2, [sp, #112]
    1ea8:	3d8023e3 	str	q3, [sp, #128]
    1eac:	3d8027e4 	str	q4, [sp, #144]
    1eb0:	3d802be5 	str	q5, [sp, #160]
    1eb4:	3d802fe6 	str	q6, [sp, #176]
    1eb8:	3d8033e7 	str	q7, [sp, #192]
    1ebc:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1ec0:	910043e4 	add	x4, sp, #0x10
    1ec4:	aa0a03e3 	mov	x3, x10
{
    1ec8:	a90e9be5 	stp	x5, x6, [sp, #232]
    1ecc:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1ed0:	97fffc24 	bl	f60 <_vsnprintf>
    va_end(va);
    return ret;
}
    1ed4:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1ed8:	d65f03c0 	ret
    1edc:	d503201f 	nop

0000000000001ee0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    1ee0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ee4:	aa0003e3 	mov	x3, x0
    1ee8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1eec:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ef0:	a9402428 	ldp	x8, x9, [x1]
    1ef4:	910043e4 	add	x4, sp, #0x10
    1ef8:	a9411c26 	ldp	x6, x7, [x1, #16]
    1efc:	f0ffffe0 	adrp	x0, 0 <main>
    1f00:	9100e3e1 	add	x1, sp, #0x38
    1f04:	913cc000 	add	x0, x0, #0xf30
    1f08:	a90127e8 	stp	x8, x9, [sp, #16]
    1f0c:	a9021fe6 	stp	x6, x7, [sp, #32]
    1f10:	97fffc14 	bl	f60 <_vsnprintf>
}
    1f14:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1f18:	d65f03c0 	ret
    1f1c:	d503201f 	nop

0000000000001f20 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    1f20:	aa0303e4 	mov	x4, x3
    1f24:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1f28:	aa0103e5 	mov	x5, x1
    1f2c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    1f30:	a9402488 	ldp	x8, x9, [x4]
    1f34:	aa0003e1 	mov	x1, x0
    1f38:	a9411c86 	ldp	x6, x7, [x4, #16]
    1f3c:	aa0203e3 	mov	x3, x2
    1f40:	910043e4 	add	x4, sp, #0x10
    1f44:	aa0503e2 	mov	x2, x5
    1f48:	f0ffffe0 	adrp	x0, 0 <main>
    1f4c:	910ec000 	add	x0, x0, #0x3b0
    1f50:	a90127e8 	stp	x8, x9, [sp, #16]
    1f54:	a9021fe6 	stp	x6, x7, [sp, #32]
    1f58:	97fffc02 	bl	f60 <_vsnprintf>
}
    1f5c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1f60:	d65f03c0 	ret
    1f64:	d503201f 	nop
    1f68:	d503201f 	nop
    1f6c:	d503201f 	nop

0000000000001f70 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    1f70:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    1f74:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    1f78:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1f7c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1f80:	910443ea 	add	x10, sp, #0x110
    1f84:	910383eb 	add	x11, sp, #0xe0
    1f88:	f90023ea 	str	x10, [sp, #64]
{
    1f8c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1f90:	910443e2 	add	x2, sp, #0x110
    1f94:	f90027e2 	str	x2, [sp, #72]
    1f98:	f9002beb 	str	x11, [sp, #80]
{
    1f9c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    1fa0:	290b23e9 	stp	w9, w8, [sp, #88]
{
    1fa4:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1fa8:	a9443fee 	ldp	x14, x15, [sp, #64]
    1fac:	9100c3e1 	add	x1, sp, #0x30
    1fb0:	a94527e8 	ldp	x8, x9, [sp, #80]
    1fb4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1fb8:	f0ffffe0 	adrp	x0, 0 <main>
    1fbc:	913d0000 	add	x0, x0, #0xf40
    1fc0:	a9013fee 	stp	x14, x15, [sp, #16]
    1fc4:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    1fc8:	f9001bec 	str	x12, [sp, #48]
    1fcc:	f9001feb 	str	x11, [sp, #56]
{
    1fd0:	3d801be0 	str	q0, [sp, #96]
    1fd4:	3d801fe1 	str	q1, [sp, #112]
    1fd8:	3d8023e2 	str	q2, [sp, #128]
    1fdc:	3d8027e3 	str	q3, [sp, #144]
    1fe0:	3d802be4 	str	q4, [sp, #160]
    1fe4:	3d802fe5 	str	q5, [sp, #176]
    1fe8:	3d8033e6 	str	q6, [sp, #192]
    1fec:	3d8037e7 	str	q7, [sp, #208]
    1ff0:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1ff4:	910043e4 	add	x4, sp, #0x10
    1ff8:	aa0a03e3 	mov	x3, x10
{
    1ffc:	a90f9be5 	stp	x5, x6, [sp, #248]
    2000:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2004:	97fffbd7 	bl	f60 <_vsnprintf>
    va_end(va);
    return ret;
    2008:	a8d17bfd 	ldp	x29, x30, [sp], #272
    200c:	d65f03c0 	ret

0000000000002010 <agencyshellRun>:

#if SHELL_EXEC_UNDEF_FUNC == 1
extern int shellExecute(int argc, char* argv[]);
#endif

SHELL_AGENCY_FUNC(shellRun, shellGetCurrent(), (const char*)p1);
    2010:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2014:	910003fd 	mov	x29, sp
    2018:	f9000bf3 	str	x19, [sp, #16]
    201c:	aa0003f3 	mov	x19, x0
    2020:	940000b0 	bl	22e0 <shellGetCurrent>
    2024:	aa1303e1 	mov	x1, x19
    2028:	f9400bf3 	ldr	x19, [sp, #16]
    202c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2030:	14000c08 	b	5050 <shellRun>
    2034:	d503201f 	nop
    2038:	d503201f 	nop
    203c:	d503201f 	nop

0000000000002040 <shellLs>:

/**
 * @brief ls 打印当前路径下所有文件(文件系统调用)
 */
void shellLs(const char* path, ...)
{
    2040:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    if ((uintptr_t*)path == (uintptr_t*)shellLs || *path == '\0') {
    2044:	90000002 	adrp	x2, 2000 <fctprintf+0x90>
    2048:	91010042 	add	x2, x2, #0x40
{
    204c:	910003fd 	mov	x29, sp
    if ((uintptr_t*)path == (uintptr_t*)shellLs || *path == '\0') {
    2050:	eb02001f 	cmp	x0, x2
    2054:	54000180 	b.eq	2084 <shellLs+0x44>  // b.none
    2058:	39400002 	ldrb	w2, [x0]
    205c:	aa0003e1 	mov	x1, x0
        path = ".";
    2060:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2064:	912ee000 	add	x0, x0, #0xbb8
    2068:	7100005f 	cmp	w2, #0x0
    206c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    }
    ls(&session_fs, (char*)path);
    2070:	f0000060 	adrp	x0, 11000 <__global_locale+0x180>
    2074:	912d6000 	add	x0, x0, #0xb58
    2078:	94000da2 	bl	5700 <ls>
}
    207c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2080:	d65f03c0 	ret
        path = ".";
    2084:	b0000061 	adrp	x1, f000 <_fstat_r+0x40>
    2088:	912ee021 	add	x1, x1, #0xbb8
    ls(&session_fs, (char*)path);
    208c:	f0000060 	adrp	x0, 11000 <__global_locale+0x180>
    2090:	912d6000 	add	x0, x0, #0xb58
    2094:	94000d9b 	bl	5700 <ls>
}
    2098:	a8c17bfd 	ldp	x29, x30, [sp], #16
    209c:	d65f03c0 	ret

00000000000020a0 <shellGetCommandName>:
    for (unsigned char i = 0; i < 9; i++) {
    20a0:	f0000064 	adrp	x4, 11000 <__global_locale+0x180>
    20a4:	912de084 	add	x4, x4, #0xb78
    20a8:	aa0403e1 	mov	x1, x4
    20ac:	91002483 	add	x3, x4, #0x9
        buffer[i] = '0';
    20b0:	52800602 	mov	w2, #0x30                  	// #48
    20b4:	d503201f 	nop
    20b8:	38001422 	strb	w2, [x1], #1
    for (unsigned char i = 0; i < 9; i++) {
    20bc:	eb03003f 	cmp	x1, x3
    20c0:	54ffffc1 	b.ne	20b8 <shellGetCommandName+0x18>  // b.any
    if (command->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    20c4:	f9400001 	ldr	x1, [x0]
    20c8:	53082c21 	ubfx	w1, w1, #8, #4
    20cc:	7100043f 	cmp	w1, #0x1
    20d0:	540002e9 	b.ls	212c <shellGetCommandName+0x8c>  // b.plast
    } else if (command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    20d4:	71001c3f 	cmp	w1, #0x7
    20d8:	540002a9 	b.ls	212c <shellGetCommandName+0x8c>  // b.plast
    } else if (command->attr.attrs.type <= SHELL_TYPE_USER) {
    20dc:	7100203f 	cmp	w1, #0x8
    20e0:	54000260 	b.eq	212c <shellGetCommandName+0x8c>  // b.none
        shellToHex(command->data.key.value, buffer);
    20e4:	b9400800 	ldr	w0, [x0, #8]
    buffer[8] = 0;
    20e8:	3900209f 	strb	wzr, [x4, #8]
    while (value) {
    20ec:	340001c0 	cbz	w0, 2124 <shellGetCommandName+0x84>
    unsigned char i = 8;
    20f0:	52800102 	mov	w2, #0x8                   	// #8
    20f4:	d503201f 	nop
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    20f8:	51000442 	sub	w2, w2, #0x1
        byte = value & 0x0000000F;
    20fc:	12000c01 	and	w1, w0, #0xf
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    2100:	92401c43 	and	x3, x2, #0xff
    2104:	7100283f 	cmp	w1, #0xa
    2108:	11015c25 	add	w5, w1, #0x57
    210c:	1100c021 	add	w1, w1, #0x30
    2110:	1a853021 	csel	w1, w1, w5, cc  // cc = lo, ul, last
        value >>= 4;
    2114:	53047c00 	lsr	w0, w0, #4
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    2118:	38236881 	strb	w1, [x4, x3]
    211c:	12001c42 	and	w2, w2, #0xff
    while (value) {
    2120:	35fffec0 	cbnz	w0, 20f8 <shellGetCommandName+0x58>
    unsigned char i = 8;
    2124:	aa0403e0 	mov	x0, x4
}
    2128:	d65f03c0 	ret
        return command->data.user.name;
    212c:	f9400400 	ldr	x0, [x0, #8]
}
    2130:	d65f03c0 	ret
    2134:	d503201f 	nop
    2138:	d503201f 	nop
    213c:	d503201f 	nop

0000000000002140 <shellWritePrompt.part.0.constprop.0>:
    SHELL_ASSERT(shell->write, return 0);
    2140:	f9406004 	ldr	x4, [x0, #192]
    2144:	b4000a84 	cbz	x4, 2294 <shellWritePrompt.part.0.constprop.0+0x154>
static void shellWritePrompt(Shell* shell, unsigned char newline)
    2148:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    while (*p++) {
    214c:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    2150:	91356442 	add	x2, x2, #0xd59
static void shellWritePrompt(Shell* shell, unsigned char newline)
    2154:	910003fd 	mov	x29, sp
    2158:	52800143 	mov	w3, #0xa                   	// #10
    unsigned short count = 0;
    215c:	52800001 	mov	w1, #0x0                   	// #0
static void shellWritePrompt(Shell* shell, unsigned char newline)
    2160:	f9000bf3 	str	x19, [sp, #16]
    2164:	aa0003f3 	mov	x19, x0
    2168:	14000002 	b	2170 <shellWritePrompt.part.0.constprop.0+0x30>
    while (*p++) {
    216c:	39400043 	ldrb	w3, [x2]
        count++;
    2170:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2174:	91000442 	add	x2, x2, #0x1
        count++;
    2178:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    217c:	35ffff83 	cbnz	w3, 216c <shellWritePrompt.part.0.constprop.0+0x2c>
    return shell->write((char*)string, count);
    2180:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2184:	91356000 	add	x0, x0, #0xd58
    2188:	d63f0080 	blr	x4
        shellWriteString(shell, shell->info.user->data.user.name);
    218c:	f9400260 	ldr	x0, [x19]
    SHELL_ASSERT(shell->write, return 0);
    2190:	f9406265 	ldr	x5, [x19, #192]
        shellWriteString(shell, shell->info.user->data.user.name);
    2194:	f9400400 	ldr	x0, [x0, #8]
    SHELL_ASSERT(shell->write, return 0);
    2198:	b4000705 	cbz	x5, 2278 <shellWritePrompt.part.0.constprop.0+0x138>
    while (*p++) {
    219c:	aa0003e2 	mov	x2, x0
    21a0:	38401441 	ldrb	w1, [x2], #1
    21a4:	34000741 	cbz	w1, 228c <shellWritePrompt.part.0.constprop.0+0x14c>
    21a8:	52800024 	mov	w4, #0x1                   	// #1
    21ac:	4b020084 	sub	w4, w4, w2
        count++;
    21b0:	0b020081 	add	w1, w4, w2
    while (*p++) {
    21b4:	38401443 	ldrb	w3, [x2], #1
    21b8:	12003c21 	and	w1, w1, #0xffff
    21bc:	35ffffa3 	cbnz	w3, 21b0 <shellWritePrompt.part.0.constprop.0+0x70>
    return shell->write((char*)string, count);
    21c0:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    21c4:	f9406262 	ldr	x2, [x19, #192]
    21c8:	b4000582 	cbz	x2, 2278 <shellWritePrompt.part.0.constprop.0+0x138>
    return shell->write((char*)string, count);
    21cc:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    21d0:	52800021 	mov	w1, #0x1                   	// #1
    21d4:	912f4000 	add	x0, x0, #0xbd0
    21d8:	d63f0040 	blr	x2
        shellWriteString(shell, shell->info.path ? shell->info.path : "/");
    21dc:	f9400a60 	ldr	x0, [x19, #16]
    SHELL_ASSERT(shell->write, return 0);
    21e0:	f9406265 	ldr	x5, [x19, #192]
        shellWriteString(shell, shell->info.path ? shell->info.path : "/");
    21e4:	b4000420 	cbz	x0, 2268 <shellWritePrompt.part.0.constprop.0+0x128>
    SHELL_ASSERT(shell->write, return 0);
    21e8:	b4000485 	cbz	x5, 2278 <shellWritePrompt.part.0.constprop.0+0x138>
    while (*p++) {
    21ec:	aa0003e2 	mov	x2, x0
    21f0:	38401441 	ldrb	w1, [x2], #1
    21f4:	34000481 	cbz	w1, 2284 <shellWritePrompt.part.0.constprop.0+0x144>
    21f8:	52800024 	mov	w4, #0x1                   	// #1
    21fc:	39400403 	ldrb	w3, [x0, #1]
    2200:	4b020084 	sub	w4, w4, w2
    2204:	14000002 	b	220c <shellWritePrompt.part.0.constprop.0+0xcc>
    2208:	39400043 	ldrb	w3, [x2]
        count++;
    220c:	0b020081 	add	w1, w4, w2
    2210:	91000442 	add	x2, x2, #0x1
    2214:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2218:	35ffff83 	cbnz	w3, 2208 <shellWritePrompt.part.0.constprop.0+0xc8>
    return shell->write((char*)string, count);
    221c:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    2220:	f9406263 	ldr	x3, [x19, #192]
    2224:	b40002a3 	cbz	x3, 2278 <shellWritePrompt.part.0.constprop.0+0x138>
    while (*p++) {
    2228:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    222c:	912f2400 	add	x0, x0, #0xbc9
    2230:	52800402 	mov	w2, #0x20                  	// #32
    unsigned short count = 0;
    2234:	52800001 	mov	w1, #0x0                   	// #0
    2238:	14000002 	b	2240 <shellWritePrompt.part.0.constprop.0+0x100>
    while (*p++) {
    223c:	39400002 	ldrb	w2, [x0]
        count++;
    2240:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2244:	91000400 	add	x0, x0, #0x1
        count++;
    2248:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    224c:	35ffff82 	cbnz	w2, 223c <shellWritePrompt.part.0.constprop.0+0xfc>
}
    2250:	f9400bf3 	ldr	x19, [sp, #16]
    return shell->write((char*)string, count);
    2254:	aa0303f0 	mov	x16, x3
}
    2258:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shell->write((char*)string, count);
    225c:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2260:	912f2000 	add	x0, x0, #0xbc8
    2264:	d61f0200 	br	x16
        shellWriteString(shell, shell->info.path ? shell->info.path : "/");
    2268:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    226c:	912f0000 	add	x0, x0, #0xbc0
    2270:	52800021 	mov	w1, #0x1                   	// #1
    SHELL_ASSERT(shell->write, return 0);
    2274:	b5fffd45 	cbnz	x5, 221c <shellWritePrompt.part.0.constprop.0+0xdc>
}
    2278:	f9400bf3 	ldr	x19, [sp, #16]
    227c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2280:	d65f03c0 	ret
    unsigned short count = 0;
    2284:	52800001 	mov	w1, #0x0                   	// #0
    2288:	17ffffe5 	b	221c <shellWritePrompt.part.0.constprop.0+0xdc>
    228c:	52800001 	mov	w1, #0x0                   	// #0
    2290:	17ffffcc 	b	21c0 <shellWritePrompt.part.0.constprop.0+0x80>
    2294:	d65f03c0 	ret
    2298:	d503201f 	nop
    229c:	d503201f 	nop

00000000000022a0 <shellRemove>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    22a0:	f0000062 	adrp	x2, 11000 <__global_locale+0x180>
    22a4:	912de042 	add	x2, x2, #0xb78
        if (shellList[i] == shell) {
    22a8:	91004042 	add	x2, x2, #0x10
{
    22ac:	d2800001 	mov	x1, #0x0                   	// #0
        if (shellList[i] == shell) {
    22b0:	f8617843 	ldr	x3, [x2, x1, lsl #3]
    22b4:	2a0103e4 	mov	w4, w1
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    22b8:	91000421 	add	x1, x1, #0x1
        if (shellList[i] == shell) {
    22bc:	eb00007f 	cmp	x3, x0
    22c0:	54000080 	b.eq	22d0 <shellRemove+0x30>  // b.none
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    22c4:	f100143f 	cmp	x1, #0x5
    22c8:	54ffff41 	b.ne	22b0 <shellRemove+0x10>  // b.any
}
    22cc:	d65f03c0 	ret
            shellList[i] = NULL;
    22d0:	f824d85f 	str	xzr, [x2, w4, sxtw #3]
}
    22d4:	d65f03c0 	ret
    22d8:	d503201f 	nop
    22dc:	d503201f 	nop

00000000000022e0 <shellGetCurrent>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    22e0:	f0000062 	adrp	x2, 11000 <__global_locale+0x180>
    22e4:	912de042 	add	x2, x2, #0xb78
    22e8:	91004041 	add	x1, x2, #0x10
    22ec:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    22f0:	f9400020 	ldr	x0, [x1]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    22f4:	91002021 	add	x1, x1, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    22f8:	b4000060 	cbz	x0, 2304 <shellGetCurrent+0x24>
    22fc:	3942c003 	ldrb	w3, [x0, #176]
    2300:	37080083 	tbnz	w3, #1, 2310 <shellGetCurrent+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    2304:	eb02003f 	cmp	x1, x2
    2308:	54ffff41 	b.ne	22f0 <shellGetCurrent+0x10>  // b.any
    return NULL;
    230c:	d2800000 	mov	x0, #0x0                   	// #0
}
    2310:	d65f03c0 	ret
    2314:	d503201f 	nop
    2318:	d503201f 	nop
    231c:	d503201f 	nop

0000000000002320 <shellWriteString>:
    SHELL_ASSERT(shell->write, return 0);
    2320:	f9406007 	ldr	x7, [x0, #192]
{
    2324:	aa0103e6 	mov	x6, x1
    SHELL_ASSERT(shell->write, return 0);
    2328:	b40001c7 	cbz	x7, 2360 <shellWriteString+0x40>
    while (*p++) {
    232c:	aa0103e2 	mov	x2, x1
    2330:	38401440 	ldrb	w0, [x2], #1
    2334:	340001a0 	cbz	w0, 2368 <shellWriteString+0x48>
    2338:	52800025 	mov	w5, #0x1                   	// #1
    233c:	4b0200a5 	sub	w5, w5, w2
        count++;
    2340:	0b0200a3 	add	w3, w5, w2
    while (*p++) {
    2344:	38401444 	ldrb	w4, [x2], #1
    2348:	12003c63 	and	w3, w3, #0xffff
    234c:	35ffffa4 	cbnz	w4, 2340 <shellWriteString+0x20>
    return shell->write((char*)string, count);
    2350:	2a0303e1 	mov	w1, w3
    2354:	aa0603e0 	mov	x0, x6
    2358:	aa0703f0 	mov	x16, x7
    235c:	d61f0200 	br	x16
}
    2360:	52800000 	mov	w0, #0x0                   	// #0
    2364:	d65f03c0 	ret
    unsigned short count = 0;
    2368:	52800003 	mov	w3, #0x0                   	// #0
    236c:	17fffff9 	b	2350 <shellWriteString+0x30>

0000000000002370 <shellCheckPermission>:
    return ((!command->attr.attrs.permission
    2370:	39400022 	ldrb	w2, [x1]
        : -1;
    2374:	34000142 	cbz	w2, 239c <shellCheckPermission+0x2c>
                || command->attr.attrs.type == SHELL_TYPE_USER
    2378:	b9400023 	ldr	w3, [x1]
    237c:	12180c63 	and	w3, w3, #0xf00
    2380:	7120007f 	cmp	w3, #0x800
    2384:	540000c0 	b.eq	239c <shellCheckPermission+0x2c>  // b.none
                || (shell->info.user
    2388:	f9400003 	ldr	x3, [x0]
    238c:	b40001a3 	cbz	x3, 23c0 <shellCheckPermission+0x50>
                    && (command->attr.attrs.permission
    2390:	39400063 	ldrb	w3, [x3]
    2394:	6a03005f 	tst	w2, w3
    2398:	54000140 	b.eq	23c0 <shellCheckPermission+0x50>  // b.none
               && (shell->status.isChecked
    239c:	3942c002 	ldrb	w2, [x0, #176]
        : -1;
    23a0:	52800000 	mov	w0, #0x0                   	// #0
               && (shell->status.isChecked
    23a4:	36000042 	tbz	w2, #0, 23ac <shellCheckPermission+0x3c>
}
    23a8:	d65f03c0 	ret
                   || command->attr.attrs.enableUnchecked))
    23ac:	b9400020 	ldr	w0, [x1]
    23b0:	d2740000 	eor	x0, x0, #0x1000
    23b4:	130c3000 	sbfx	w0, w0, #12, #1
    23b8:	13001c00 	sxtb	w0, w0
}
    23bc:	d65f03c0 	ret
        : -1;
    23c0:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    23c4:	d65f03c0 	ret
    23c8:	d503201f 	nop
    23cc:	d503201f 	nop

00000000000023d0 <shellToHex>:
    buffer[8] = 0;
    23d0:	3900203f 	strb	wzr, [x1, #8]
    while (value) {
    23d4:	34000240 	cbz	w0, 241c <shellToHex+0x4c>
    unsigned char i = 8;
    23d8:	52800103 	mov	w3, #0x8                   	// #8
    23dc:	d503201f 	nop
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    23e0:	51000463 	sub	w3, w3, #0x1
        byte = value & 0x0000000F;
    23e4:	12000c02 	and	w2, w0, #0xf
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    23e8:	92401c64 	and	x4, x3, #0xff
    23ec:	7100285f 	cmp	w2, #0xa
    23f0:	11015c45 	add	w5, w2, #0x57
    23f4:	1100c042 	add	w2, w2, #0x30
    23f8:	1a853042 	csel	w2, w2, w5, cc  // cc = lo, ul, last
        value >>= 4;
    23fc:	53047c00 	lsr	w0, w0, #4
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    2400:	38246822 	strb	w2, [x1, x4]
    2404:	12001c63 	and	w3, w3, #0xff
    while (value) {
    2408:	35fffec0 	cbnz	w0, 23e0 <shellToHex+0x10>
    return 8 - i;
    240c:	52800100 	mov	w0, #0x8                   	// #8
    2410:	4b030003 	sub	w3, w0, w3
    2414:	13001c60 	sxtb	w0, w3
}
    2418:	d65f03c0 	ret
    while (value) {
    241c:	52800000 	mov	w0, #0x0                   	// #0
}
    2420:	d65f03c0 	ret
    2424:	d503201f 	nop
    2428:	d503201f 	nop
    242c:	d503201f 	nop

0000000000002430 <shellToDec>:
    buffer[11] = 0;
    2430:	39002c3f 	strb	wzr, [x1, #11]
    2434:	7100001f 	cmp	w0, #0x0
    2438:	5a80a403 	cneg	w3, w0, lt  // lt = tstop
    while (v) {
    243c:	54000320 	b.eq	24a0 <shellToDec+0x70>  // b.none
        buffer[--i] = v % 10 + 48;
    2440:	529999a9 	mov	w9, #0xcccd                	// #52429
    2444:	72b99989 	movk	w9, #0xcccc, lsl #16
    unsigned char i = 11;
    2448:	52800165 	mov	w5, #0xb                   	// #11
        buffer[--i] = v % 10 + 48;
    244c:	52800148 	mov	w8, #0xa                   	// #10
    2450:	9ba97c62 	umull	x2, w3, w9
    2454:	510004a4 	sub	w4, w5, #0x1
    2458:	92401c86 	and	x6, x4, #0xff
    245c:	2a0503e7 	mov	w7, w5
    2460:	12001c85 	and	w5, w4, #0xff
    2464:	d363fc42 	lsr	x2, x2, #35
    2468:	1b088c44 	msub	w4, w2, w8, w3
        v /= 10;
    246c:	2a0203e3 	mov	w3, w2
        buffer[--i] = v % 10 + 48;
    2470:	1100c082 	add	w2, w4, #0x30
    2474:	38266822 	strb	w2, [x1, x6]
    while (v) {
    2478:	35fffec3 	cbnz	w3, 2450 <shellToDec+0x20>
    if (value < 0) {
    247c:	36f800c0 	tbz	w0, #31, 2494 <shellToDec+0x64>
        buffer[--i] = '-';
    2480:	510008e5 	sub	w5, w7, #0x2
    2484:	528005a2 	mov	w2, #0x2d                  	// #45
    2488:	92401ca0 	and	x0, x5, #0xff
    248c:	12001ca5 	and	w5, w5, #0xff
    2490:	38206822 	strb	w2, [x1, x0]
    return 11 - i;
    2494:	52800160 	mov	w0, #0xb                   	// #11
    2498:	4b050000 	sub	w0, w0, w5
}
    249c:	d65f03c0 	ret
        buffer[--i] = '0';
    24a0:	52800600 	mov	w0, #0x30                  	// #48
    24a4:	52800145 	mov	w5, #0xa                   	// #10
    24a8:	39002820 	strb	w0, [x1, #10]
    return 11 - i;
    24ac:	52800160 	mov	w0, #0xb                   	// #11
    24b0:	4b050000 	sub	w0, w0, w5
}
    24b4:	d65f03c0 	ret
    24b8:	d503201f 	nop
    24bc:	d503201f 	nop

00000000000024c0 <shellWriteReturnValue>:
{
    24c0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[12] = "00000000000";
    24c4:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    24c8:	912fc042 	add	x2, x2, #0xbf0
{
    24cc:	910003fd 	mov	x29, sp
    24d0:	a90153f3 	stp	x19, x20, [sp, #16]
    24d4:	aa0003f4 	mov	x20, x0
    24d8:	2a0103f3 	mov	w19, w1
    24dc:	f90013f5 	str	x21, [sp, #32]
    char buffer[12] = "00000000000";
    24e0:	9100c3f5 	add	x21, sp, #0x30
    SHELL_ASSERT(shell->write, return 0);
    24e4:	f9406003 	ldr	x3, [x0, #192]
    char buffer[12] = "00000000000";
    24e8:	f9400040 	ldr	x0, [x2]
    24ec:	f9001be0 	str	x0, [sp, #48]
    24f0:	b9400840 	ldr	w0, [x2, #8]
    24f4:	b9000aa0 	str	w0, [x21, #8]
    SHELL_ASSERT(shell->write, return 0);
    24f8:	b40001c3 	cbz	x3, 2530 <shellWriteReturnValue+0x70>
    while (*p++) {
    24fc:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2500:	912f6400 	add	x0, x0, #0xbd9
    2504:	52800ca2 	mov	w2, #0x65                  	// #101
    unsigned short count = 0;
    2508:	52800001 	mov	w1, #0x0                   	// #0
    250c:	14000002 	b	2514 <shellWriteReturnValue+0x54>
    while (*p++) {
    2510:	39400002 	ldrb	w2, [x0]
        count++;
    2514:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2518:	91000400 	add	x0, x0, #0x1
        count++;
    251c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2520:	35ffff82 	cbnz	w2, 2510 <shellWriteReturnValue+0x50>
    return shell->write((char*)string, count);
    2524:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2528:	912f6000 	add	x0, x0, #0xbd8
    252c:	d63f0060 	blr	x3
    shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    2530:	aa1503e1 	mov	x1, x21
    2534:	2a1303e0 	mov	w0, w19
    2538:	97ffffbe 	bl	2430 <shellToDec>
    253c:	52800161 	mov	w1, #0xb                   	// #11
    SHELL_ASSERT(shell->write, return 0);
    2540:	f9406285 	ldr	x5, [x20, #192]
    shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    2544:	4b208021 	sub	w1, w1, w0, sxtb
    2548:	8b21c2a0 	add	x0, x21, w1, sxtw
    SHELL_ASSERT(shell->write, return 0);
    254c:	b4000385 	cbz	x5, 25bc <shellWriteReturnValue+0xfc>
    while (*p++) {
    2550:	3861caa1 	ldrb	w1, [x21, w1, sxtw]
    2554:	91000402 	add	x2, x0, #0x1
    2558:	340009e1 	cbz	w1, 2694 <shellWriteReturnValue+0x1d4>
    255c:	52800024 	mov	w4, #0x1                   	// #1
    2560:	4b020084 	sub	w4, w4, w2
    2564:	d503201f 	nop
        count++;
    2568:	0b020081 	add	w1, w4, w2
    while (*p++) {
    256c:	38401443 	ldrb	w3, [x2], #1
    2570:	12003c21 	and	w1, w1, #0xffff
    2574:	35ffffa3 	cbnz	w3, 2568 <shellWriteReturnValue+0xa8>
    return shell->write((char*)string, count);
    2578:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    257c:	f9406285 	ldr	x5, [x20, #192]
    2580:	b40001e5 	cbz	x5, 25bc <shellWriteReturnValue+0xfc>
    while (*p++) {
    2584:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2588:	912fa400 	add	x0, x0, #0xbe9
    258c:	52800402 	mov	w2, #0x20                  	// #32
    unsigned short count = 0;
    2590:	52800001 	mov	w1, #0x0                   	// #0
    2594:	14000002 	b	259c <shellWriteReturnValue+0xdc>
    while (*p++) {
    2598:	39400002 	ldrb	w2, [x0]
        count++;
    259c:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    25a0:	91000400 	add	x0, x0, #0x1
        count++;
    25a4:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    25a8:	35ffff82 	cbnz	w2, 2598 <shellWriteReturnValue+0xd8>
    return shell->write((char*)string, count);
    25ac:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    25b0:	912fa000 	add	x0, x0, #0xbe8
    25b4:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    25b8:	f9406285 	ldr	x5, [x20, #192]
    25bc:	aa1503e1 	mov	x1, x21
    25c0:	9100efe2 	add	x2, sp, #0x3b
        buffer[i] = '0';
    25c4:	52800600 	mov	w0, #0x30                  	// #48
    25c8:	38001420 	strb	w0, [x1], #1
    for (short i = 0; i < 11; i++) {
    25cc:	eb02003f 	cmp	x1, x2
    25d0:	54ffffc1 	b.ne	25c8 <shellWriteReturnValue+0x108>  // b.any
    buffer[8] = 0;
    25d4:	3900e3ff 	strb	wzr, [sp, #56]
    shellToHex(value, buffer);
    25d8:	2a1303e1 	mov	w1, w19
    unsigned char i = 8;
    25dc:	52800103 	mov	w3, #0x8                   	// #8
    while (value) {
    25e0:	340001b3 	cbz	w19, 2614 <shellWriteReturnValue+0x154>
    25e4:	d503201f 	nop
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    25e8:	51000463 	sub	w3, w3, #0x1
        byte = value & 0x0000000F;
    25ec:	12000c22 	and	w2, w1, #0xf
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    25f0:	92401c60 	and	x0, x3, #0xff
    25f4:	7100285f 	cmp	w2, #0xa
    25f8:	11015c44 	add	w4, w2, #0x57
    25fc:	1100c042 	add	w2, w2, #0x30
    2600:	1a843042 	csel	w2, w2, w4, cc  // cc = lo, ul, last
        value >>= 4;
    2604:	53047c21 	lsr	w1, w1, #4
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    2608:	38206aa2 	strb	w2, [x21, x0]
    260c:	12001c63 	and	w3, w3, #0xff
    while (value) {
    2610:	35fffec1 	cbnz	w1, 25e8 <shellWriteReturnValue+0x128>
    SHELL_ASSERT(shell->write, return 0);
    2614:	b4000385 	cbz	x5, 2684 <shellWriteReturnValue+0x1c4>
    while (*p++) {
    2618:	3940c3e0 	ldrb	w0, [sp, #48]
    261c:	34000400 	cbz	w0, 269c <shellWriteReturnValue+0x1dc>
    2620:	9100c7e0 	add	x0, sp, #0x31
    2624:	52800023 	mov	w3, #0x1                   	// #1
    2628:	4b000063 	sub	w3, w3, w0
    262c:	d503201f 	nop
        count++;
    2630:	0b000061 	add	w1, w3, w0
    while (*p++) {
    2634:	38401402 	ldrb	w2, [x0], #1
    2638:	12003c21 	and	w1, w1, #0xffff
    263c:	35ffffa2 	cbnz	w2, 2630 <shellWriteReturnValue+0x170>
    return shell->write((char*)string, count);
    2640:	aa1503e0 	mov	x0, x21
    2644:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    2648:	f9406283 	ldr	x3, [x20, #192]
    264c:	b40001c3 	cbz	x3, 2684 <shellWriteReturnValue+0x1c4>
    while (*p++) {
    2650:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2654:	91356400 	add	x0, x0, #0xd59
    2658:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    265c:	52800001 	mov	w1, #0x0                   	// #0
    2660:	14000002 	b	2668 <shellWriteReturnValue+0x1a8>
    while (*p++) {
    2664:	39400002 	ldrb	w2, [x0]
        count++;
    2668:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    266c:	91000400 	add	x0, x0, #0x1
        count++;
    2670:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2674:	35ffff82 	cbnz	w2, 2664 <shellWriteReturnValue+0x1a4>
    return shell->write((char*)string, count);
    2678:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    267c:	91356000 	add	x0, x0, #0xd58
    2680:	d63f0060 	blr	x3
}
    2684:	a94153f3 	ldp	x19, x20, [sp, #16]
    2688:	f94013f5 	ldr	x21, [sp, #32]
    268c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2690:	d65f03c0 	ret
    unsigned short count = 0;
    2694:	52800001 	mov	w1, #0x0                   	// #0
    2698:	17ffffb8 	b	2578 <shellWriteReturnValue+0xb8>
    269c:	52800001 	mov	w1, #0x0                   	// #0
    26a0:	17ffffe8 	b	2640 <shellWriteReturnValue+0x180>
    26a4:	d503201f 	nop
    26a8:	d503201f 	nop
    26ac:	d503201f 	nop

00000000000026b0 <shellListItem>:
{
    26b0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    26b4:	910003fd 	mov	x29, sp
    26b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    26bc:	aa0003f5 	mov	x21, x0
    26c0:	aa0103f6 	mov	x22, x1
    spaceLength = 22 - shellWriteString(shell, shellGetCommandName(item));
    26c4:	aa0103e0 	mov	x0, x1
{
    26c8:	a90153f3 	stp	x19, x20, [sp, #16]
    26cc:	a90363f7 	stp	x23, x24, [sp, #48]
    spaceLength = 22 - shellWriteString(shell, shellGetCommandName(item));
    26d0:	97fffe74 	bl	20a0 <shellGetCommandName>
    SHELL_ASSERT(shell->write, return 0);
    26d4:	f94062a3 	ldr	x3, [x21, #192]
    26d8:	b40017e3 	cbz	x3, 29d4 <shellListItem+0x324>
    while (*p++) {
    26dc:	aa0003e2 	mov	x2, x0
    26e0:	38401441 	ldrb	w1, [x2], #1
    26e4:	34001b81 	cbz	w1, 2a54 <shellListItem+0x3a4>
    26e8:	52800025 	mov	w5, #0x1                   	// #1
    26ec:	4b0200a5 	sub	w5, w5, w2
        count++;
    26f0:	0b0200a1 	add	w1, w5, w2
    while (*p++) {
    26f4:	38401444 	ldrb	w4, [x2], #1
    26f8:	12003c21 	and	w1, w1, #0xffff
    26fc:	35ffffa4 	cbnz	w4, 26f0 <shellListItem+0x40>
    return shell->write((char*)string, count);
    2700:	d63f0060 	blr	x3
    spaceLength = 22 - shellWriteString(shell, shellGetCommandName(item));
    2704:	528002c2 	mov	w2, #0x16                  	// #22
    2708:	4b000042 	sub	w2, w2, w0
    270c:	13003c53 	sxth	w19, w2
    spaceLength = (spaceLength > 0) ? spaceLength : 4;
    2710:	7100027f 	cmp	w19, #0x0
    2714:	540010ac 	b.gt	2928 <shellListItem+0x278>
    shell->write(&data, 1);
    2718:	f94062a3 	ldr	x3, [x21, #192]
    spaceLength = (spaceLength > 0) ? spaceLength : 4;
    271c:	52800093 	mov	w19, #0x4                   	// #4
    2720:	52800417 	mov	w23, #0x20                  	// #32
    2724:	14000002 	b	272c <shellListItem+0x7c>
    shell->write(&data, 1);
    2728:	f94062a3 	ldr	x3, [x21, #192]
        shellWriteByte(shell, ' ');
    272c:	39013ff7 	strb	w23, [sp, #79]
    shell->write(&data, 1);
    2730:	91013fe0 	add	x0, sp, #0x4f
    2734:	52800021 	mov	w1, #0x1                   	// #1
    2738:	d63f0060 	blr	x3
    } while (--spaceLength);
    273c:	51000662 	sub	w2, w19, #0x1
    2740:	72003c54 	ands	w20, w2, #0xffff
    2744:	13003c53 	sxth	w19, w2
    2748:	54ffff01 	b.ne	2728 <shellListItem+0x78>  // b.any
    if (item->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    274c:	f94002c0 	ldr	x0, [x22]
    SHELL_ASSERT(shell->write, return 0);
    2750:	f94062a3 	ldr	x3, [x21, #192]
    if (item->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    2754:	53082c00 	ubfx	w0, w0, #8, #4
    2758:	7100041f 	cmp	w0, #0x1
    275c:	54000f69 	b.ls	2948 <shellListItem+0x298>  // b.plast
    } else if (item->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    2760:	71001c1f 	cmp	w0, #0x7
    2764:	54001109 	b.ls	2984 <shellListItem+0x2d4>  // b.plast
    } else if (item->attr.attrs.type <= SHELL_TYPE_USER) {
    2768:	7100201f 	cmp	w0, #0x8
    276c:	54001560 	b.eq	2a18 <shellListItem+0x368>  // b.none
    } else if (item->attr.attrs.type <= SHELL_TYPE_KEY) {
    2770:	7100241f 	cmp	w0, #0x9
    2774:	54001340 	b.eq	29dc <shellListItem+0x32c>  // b.none
    SHELL_ASSERT(shell->write, return 0);
    2778:	b40003c3 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    277c:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2780:	91308400 	add	x0, x0, #0xc21
    unsigned short count = 0;
    2784:	52800001 	mov	w1, #0x0                   	// #0
    2788:	528009e2 	mov	w2, #0x4f                  	// #79
    278c:	14000002 	b	2794 <shellListItem+0xe4>
    while (*p++) {
    2790:	39400002 	ldrb	w2, [x0]
        count++;
    2794:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2798:	91000400 	add	x0, x0, #0x1
        count++;
    279c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    27a0:	35ffff82 	cbnz	w2, 2790 <shellListItem+0xe0>
    return shell->write((char*)string, count);
    27a4:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    27a8:	91308000 	add	x0, x0, #0xc20
    27ac:	d63f0060 	blr	x3
    SHELL_ASSERT(shell->write, return 0);
    27b0:	f94062a3 	ldr	x3, [x21, #192]
    27b4:	b40001e3 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    27b8:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    27bc:	9130a400 	add	x0, x0, #0xc29
    unsigned short count = 0;
    27c0:	52800001 	mov	w1, #0x0                   	// #0
    27c4:	52800402 	mov	w2, #0x20                  	// #32
    27c8:	14000002 	b	27d0 <shellListItem+0x120>
    while (*p++) {
    27cc:	39400002 	ldrb	w2, [x0]
        count++;
    27d0:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    27d4:	91000400 	add	x0, x0, #0x1
        count++;
    27d8:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    27dc:	35ffff82 	cbnz	w2, 27cc <shellListItem+0x11c>
    return shell->write((char*)string, count);
    27e0:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    27e4:	9130a000 	add	x0, x0, #0xc28
    27e8:	d63f0060 	blr	x3
    shell->write(&data, 1);
    27ec:	f94062a3 	ldr	x3, [x21, #192]
    while (*p++) {
    27f0:	528000f3 	mov	w19, #0x7                   	// #7
        shellWriteByte(shell, item->attr.attrs.permission & (1 << i) ? 'x' : '-');
    27f4:	52800f18 	mov	w24, #0x78                  	// #120
    27f8:	528005b7 	mov	w23, #0x2d                  	// #45
    27fc:	d503201f 	nop
    2800:	394002c2 	ldrb	w2, [x22]
    shell->write(&data, 1);
    2804:	91013fe0 	add	x0, sp, #0x4f
    2808:	52800021 	mov	w1, #0x1                   	// #1
        shellWriteByte(shell, item->attr.attrs.permission & (1 << i) ? 'x' : '-');
    280c:	1ad32842 	asr	w2, w2, w19
    for (signed char i = 7; i >= 0; i--) {
    2810:	51000673 	sub	w19, w19, #0x1
        shellWriteByte(shell, item->attr.attrs.permission & (1 << i) ? 'x' : '-');
    2814:	f240005f 	tst	x2, #0x1
    2818:	1a971302 	csel	w2, w24, w23, ne  // ne = any
    281c:	39013fe2 	strb	w2, [sp, #79]
    shell->write(&data, 1);
    2820:	d63f0060 	blr	x3
    for (signed char i = 7; i >= 0; i--) {
    2824:	3100067f 	cmn	w19, #0x1
    shell->write(&data, 1);
    2828:	f94062a3 	ldr	x3, [x21, #192]
    for (signed char i = 7; i >= 0; i--) {
    282c:	54fffea1 	b.ne	2800 <shellListItem+0x150>  // b.any
    SHELL_ASSERT(shell->write, return 0);
    2830:	b4000c83 	cbz	x3, 29c0 <shellListItem+0x310>
    while (*p++) {
    2834:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2838:	9130a400 	add	x0, x0, #0xc29
    unsigned short count = 0;
    283c:	52800001 	mov	w1, #0x0                   	// #0
    2840:	52800402 	mov	w2, #0x20                  	// #32
    2844:	14000002 	b	284c <shellListItem+0x19c>
    while (*p++) {
    2848:	39400002 	ldrb	w2, [x0]
        count++;
    284c:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2850:	91000400 	add	x0, x0, #0x1
        count++;
    2854:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2858:	35ffff82 	cbnz	w2, 2848 <shellListItem+0x198>
    return shell->write((char*)string, count);
    285c:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2860:	9130a000 	add	x0, x0, #0xc28
    2864:	d63f0060 	blr	x3
    SHELL_ASSERT(shell->write, return 0);
    2868:	f94062a5 	ldr	x5, [x21, #192]
    286c:	b4000aa5 	cbz	x5, 29c0 <shellListItem+0x310>
        return command->data.cmd.desc;
    2870:	f9400ec0 	ldr	x0, [x22, #24]
    while (*p && *p != '\r' && *p != '\n') {
    2874:	39400001 	ldrb	w1, [x0]
    2878:	7100343f 	cmp	w1, #0xd
    287c:	54000608 	b.hi	293c <shellListItem+0x28c>  // b.pmore
    2880:	d2848022 	mov	x2, #0x2401                	// #9217
    2884:	9ac12441 	lsr	x1, x2, x1
    2888:	37000541 	tbnz	w1, #0, 2930 <shellListItem+0x280>
    288c:	aa0003e3 	mov	x3, x0
    2890:	52800001 	mov	w1, #0x0                   	// #0
    2894:	d2848024 	mov	x4, #0x2401                	// #9217
    2898:	38401c62 	ldrb	w2, [x3, #1]!
        count++;
    289c:	11000421 	add	w1, w1, #0x1
    28a0:	12003c21 	and	w1, w1, #0xffff
    while (*p && *p != '\r' && *p != '\n') {
    28a4:	7100345f 	cmp	w2, #0xd
    28a8:	54ffff88 	b.hi	2898 <shellListItem+0x1e8>  // b.pmore
    28ac:	9ac22482 	lsr	x2, x4, x2
    28b0:	3607ff42 	tbz	w2, #0, 2898 <shellListItem+0x1e8>
    if (count > 36) {
    28b4:	7100903f 	cmp	w1, #0x24
    28b8:	540003e9 	b.ls	2934 <shellListItem+0x284>  // b.plast
        shell->write((char*)string, 36);
    28bc:	52800481 	mov	w1, #0x24                  	// #36
    28c0:	d63f00a0 	blr	x5
        shell->write("...", 3);
    28c4:	f94062a2 	ldr	x2, [x21, #192]
    28c8:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    28cc:	9130c000 	add	x0, x0, #0xc30
    28d0:	52800061 	mov	w1, #0x3                   	// #3
    28d4:	d63f0040 	blr	x2
    SHELL_ASSERT(shell->write, return 0);
    28d8:	f94062a2 	ldr	x2, [x21, #192]
    28dc:	b4000722 	cbz	x2, 29c0 <shellListItem+0x310>
    while (*p++) {
    28e0:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    28e4:	91356400 	add	x0, x0, #0xd59
    28e8:	52800141 	mov	w1, #0xa                   	// #10
    28ec:	14000002 	b	28f4 <shellListItem+0x244>
    28f0:	39400001 	ldrb	w1, [x0]
        count++;
    28f4:	11000694 	add	w20, w20, #0x1
    while (*p++) {
    28f8:	91000400 	add	x0, x0, #0x1
        count++;
    28fc:	12003e94 	and	w20, w20, #0xffff
    while (*p++) {
    2900:	35ffff81 	cbnz	w1, 28f0 <shellListItem+0x240>
    return shell->write((char*)string, count);
    2904:	2a1403e1 	mov	w1, w20
    2908:	aa0203f0 	mov	x16, x2
}
    290c:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    2910:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2914:	91356000 	add	x0, x0, #0xd58
}
    2918:	a9425bf5 	ldp	x21, x22, [sp, #32]
    291c:	a94363f7 	ldp	x23, x24, [sp, #48]
    2920:	a8c57bfd 	ldp	x29, x30, [sp], #80
    return shell->write((char*)string, count);
    2924:	d61f0200 	br	x16
    shell->write(&data, 1);
    2928:	f94062a3 	ldr	x3, [x21, #192]
    292c:	17ffff7d 	b	2720 <shellListItem+0x70>
    unsigned short count = 0;
    2930:	52800001 	mov	w1, #0x0                   	// #0
        shell->write((char*)string, count);
    2934:	d63f00a0 	blr	x5
    return count > 36 ? 36 : 39;
    2938:	17ffffe8 	b	28d8 <shellListItem+0x228>
    while (*p && *p != '\r' && *p != '\n') {
    293c:	aa0003e3 	mov	x3, x0
    2940:	52800001 	mov	w1, #0x0                   	// #0
    2944:	17ffffd4 	b	2894 <shellListItem+0x1e4>
    SHELL_ASSERT(shell->write, return 0);
    2948:	b4fff543 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    294c:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2950:	91300400 	add	x0, x0, #0xc01
    unsigned short count = 0;
    2954:	52800001 	mov	w1, #0x0                   	// #0
    2958:	528009a2 	mov	w2, #0x4d                  	// #77
    295c:	14000002 	b	2964 <shellListItem+0x2b4>
    while (*p++) {
    2960:	39400002 	ldrb	w2, [x0]
        count++;
    2964:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2968:	91000400 	add	x0, x0, #0x1
        count++;
    296c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2970:	35ffff82 	cbnz	w2, 2960 <shellListItem+0x2b0>
    return shell->write((char*)string, count);
    2974:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2978:	91300000 	add	x0, x0, #0xc00
    297c:	d63f0060 	blr	x3
    2980:	17ffff8c 	b	27b0 <shellListItem+0x100>
    SHELL_ASSERT(shell->write, return 0);
    2984:	b4fff363 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    2988:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    298c:	91302400 	add	x0, x0, #0xc09
    unsigned short count = 0;
    2990:	52800001 	mov	w1, #0x0                   	// #0
    2994:	52800822 	mov	w2, #0x41                  	// #65
    2998:	14000002 	b	29a0 <shellListItem+0x2f0>
    while (*p++) {
    299c:	39400002 	ldrb	w2, [x0]
        count++;
    29a0:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    29a4:	91000400 	add	x0, x0, #0x1
        count++;
    29a8:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    29ac:	35ffff82 	cbnz	w2, 299c <shellListItem+0x2ec>
    return shell->write((char*)string, count);
    29b0:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    29b4:	91302000 	add	x0, x0, #0xc08
    29b8:	d63f0060 	blr	x3
    29bc:	17ffff7d 	b	27b0 <shellListItem+0x100>
}
    29c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    29c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    29c8:	a94363f7 	ldp	x23, x24, [sp, #48]
    29cc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    29d0:	d65f03c0 	ret
    spaceLength = 22 - shellWriteString(shell, shellGetCommandName(item));
    29d4:	528002d3 	mov	w19, #0x16                  	// #22
    29d8:	17ffff52 	b	2720 <shellListItem+0x70>
    SHELL_ASSERT(shell->write, return 0);
    29dc:	b4fff0a3 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    29e0:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    29e4:	91306400 	add	x0, x0, #0xc19
    unsigned short count = 0;
    29e8:	52800001 	mov	w1, #0x0                   	// #0
    29ec:	528008a2 	mov	w2, #0x45                  	// #69
    29f0:	14000002 	b	29f8 <shellListItem+0x348>
    while (*p++) {
    29f4:	39400002 	ldrb	w2, [x0]
        count++;
    29f8:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    29fc:	91000400 	add	x0, x0, #0x1
        count++;
    2a00:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2a04:	35ffff82 	cbnz	w2, 29f4 <shellListItem+0x344>
    return shell->write((char*)string, count);
    2a08:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2a0c:	91306000 	add	x0, x0, #0xc18
    2a10:	d63f0060 	blr	x3
    2a14:	17ffff67 	b	27b0 <shellListItem+0x100>
    SHELL_ASSERT(shell->write, return 0);
    2a18:	b4ffeec3 	cbz	x3, 27f0 <shellListItem+0x140>
    while (*p++) {
    2a1c:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2a20:	91304400 	add	x0, x0, #0xc11
    unsigned short count = 0;
    2a24:	52800001 	mov	w1, #0x0                   	// #0
    2a28:	52800a62 	mov	w2, #0x53                  	// #83
    2a2c:	14000002 	b	2a34 <shellListItem+0x384>
    while (*p++) {
    2a30:	39400002 	ldrb	w2, [x0]
        count++;
    2a34:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2a38:	91000400 	add	x0, x0, #0x1
        count++;
    2a3c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2a40:	35ffff82 	cbnz	w2, 2a30 <shellListItem+0x380>
    return shell->write((char*)string, count);
    2a44:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2a48:	91304000 	add	x0, x0, #0xc10
    2a4c:	d63f0060 	blr	x3
    2a50:	17ffff58 	b	27b0 <shellListItem+0x100>
    unsigned short count = 0;
    2a54:	52800001 	mov	w1, #0x0                   	// #0
    2a58:	17ffff2a 	b	2700 <shellListItem+0x50>
    2a5c:	d503201f 	nop

0000000000002a60 <shellListCommand>:
{
    2a60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2a64:	910003fd 	mov	x29, sp
    2a68:	a90153f3 	stp	x19, x20, [sp, #16]
    2a6c:	f90013f5 	str	x21, [sp, #32]
    2a70:	aa0003f5 	mov	x21, x0
    SHELL_ASSERT(shell->write, return 0);
    2a74:	f9406003 	ldr	x3, [x0, #192]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    2a78:	f9405014 	ldr	x20, [x0, #160]
    SHELL_ASSERT(shell->write, return 0);
    2a7c:	b40001c3 	cbz	x3, 2ab4 <shellListCommand+0x54>
    while (*p++) {
    2a80:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    2a84:	9130e442 	add	x2, x2, #0xc39
    2a88:	52800140 	mov	w0, #0xa                   	// #10
    unsigned short count = 0;
    2a8c:	52800001 	mov	w1, #0x0                   	// #0
    2a90:	14000002 	b	2a98 <shellListCommand+0x38>
    while (*p++) {
    2a94:	39400040 	ldrb	w0, [x2]
        count++;
    2a98:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2a9c:	91000442 	add	x2, x2, #0x1
        count++;
    2aa0:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2aa4:	35ffff80 	cbnz	w0, 2a94 <shellListCommand+0x34>
    return shell->write((char*)string, count);
    2aa8:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2aac:	9130e000 	add	x0, x0, #0xc38
    2ab0:	d63f0060 	blr	x3
    for (short i = 0; i < shell->commandList.count; i++) {
    2ab4:	794152a4 	ldrh	w4, [x21, #168]
    2ab8:	52800013 	mov	w19, #0x0                   	// #0
    2abc:	350000c4 	cbnz	w4, 2ad4 <shellListCommand+0x74>
    2ac0:	1400001f 	b	2b3c <shellListCommand+0xdc>
    2ac4:	11000673 	add	w19, w19, #0x1
    2ac8:	6b33a09f 	cmp	w4, w19, sxth
    2acc:	13003e73 	sxth	w19, w19
    2ad0:	5400036d 	b.le	2b3c <shellListCommand+0xdc>
        if (base[i].attr.attrs.type <= SHELL_TYPE_CMD_FUNC
    2ad4:	937b7e63 	sbfiz	x3, x19, #5, #32
            shellListItem(shell, &base[i]);
    2ad8:	aa1503e0 	mov	x0, x21
        if (base[i].attr.attrs.type <= SHELL_TYPE_CMD_FUNC
    2adc:	8b030281 	add	x1, x20, x3
    2ae0:	f8636a82 	ldr	x2, [x20, x3]
    2ae4:	53082c42 	ubfx	w2, w2, #8, #4
    2ae8:	7100045f 	cmp	w2, #0x1
    2aec:	54fffec8 	b.hi	2ac4 <shellListCommand+0x64>  // b.pmore
    return ((!command->attr.attrs.permission
    2af0:	38636a82 	ldrb	w2, [x20, x3]
        : -1;
    2af4:	34000142 	cbz	w2, 2b1c <shellListCommand+0xbc>
                || command->attr.attrs.type == SHELL_TYPE_USER
    2af8:	b8636a85 	ldr	w5, [x20, x3]
    2afc:	12180ca5 	and	w5, w5, #0xf00
    2b00:	712000bf 	cmp	w5, #0x800
    2b04:	540000c0 	b.eq	2b1c <shellListCommand+0xbc>  // b.none
                || (shell->info.user
    2b08:	f94002a5 	ldr	x5, [x21]
    2b0c:	b4fffdc5 	cbz	x5, 2ac4 <shellListCommand+0x64>
                    && (command->attr.attrs.permission
    2b10:	394000a5 	ldrb	w5, [x5]
    2b14:	6a05005f 	tst	w2, w5
    2b18:	54fffd60 	b.eq	2ac4 <shellListCommand+0x64>  // b.none
               && (shell->status.isChecked
    2b1c:	3942c2a2 	ldrb	w2, [x21, #176]
    2b20:	36000162 	tbz	w2, #0, 2b4c <shellListCommand+0xec>
            shellListItem(shell, &base[i]);
    2b24:	97fffee3 	bl	26b0 <shellListItem>
    2b28:	11000673 	add	w19, w19, #0x1
    2b2c:	794152a4 	ldrh	w4, [x21, #168]
    for (short i = 0; i < shell->commandList.count; i++) {
    2b30:	6b33a09f 	cmp	w4, w19, sxth
    2b34:	13003e73 	sxth	w19, w19
    2b38:	54fffcec 	b.gt	2ad4 <shellListCommand+0x74>
}
    2b3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2b40:	f94013f5 	ldr	x21, [sp, #32]
    2b44:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2b48:	d65f03c0 	ret
                   || command->attr.attrs.enableUnchecked))
    2b4c:	b8636a82 	ldr	w2, [x20, x3]
    2b50:	3767fea2 	tbnz	w2, #12, 2b24 <shellListCommand+0xc4>
    2b54:	17ffffdc 	b	2ac4 <shellListCommand+0x64>
    2b58:	d503201f 	nop
    2b5c:	d503201f 	nop

0000000000002b60 <shellListVar>:
{
    2b60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2b64:	910003fd 	mov	x29, sp
    2b68:	a90153f3 	stp	x19, x20, [sp, #16]
    2b6c:	f90013f5 	str	x21, [sp, #32]
    2b70:	aa0003f5 	mov	x21, x0
    SHELL_ASSERT(shell->write, return 0);
    2b74:	f9406003 	ldr	x3, [x0, #192]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    2b78:	f9405014 	ldr	x20, [x0, #160]
    SHELL_ASSERT(shell->write, return 0);
    2b7c:	b40001c3 	cbz	x3, 2bb4 <shellListVar+0x54>
    while (*p++) {
    2b80:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    2b84:	91314442 	add	x2, x2, #0xc51
    2b88:	52800140 	mov	w0, #0xa                   	// #10
    unsigned short count = 0;
    2b8c:	52800001 	mov	w1, #0x0                   	// #0
    2b90:	14000002 	b	2b98 <shellListVar+0x38>
    while (*p++) {
    2b94:	39400040 	ldrb	w0, [x2]
        count++;
    2b98:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2b9c:	91000442 	add	x2, x2, #0x1
        count++;
    2ba0:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2ba4:	35ffff80 	cbnz	w0, 2b94 <shellListVar+0x34>
    return shell->write((char*)string, count);
    2ba8:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2bac:	91314000 	add	x0, x0, #0xc50
    2bb0:	d63f0060 	blr	x3
    for (short i = 0; i < shell->commandList.count; i++) {
    2bb4:	794152a4 	ldrh	w4, [x21, #168]
    2bb8:	52800013 	mov	w19, #0x0                   	// #0
    2bbc:	35000104 	cbnz	w4, 2bdc <shellListVar+0x7c>
    2bc0:	14000020 	b	2c40 <shellListVar+0xe0>
            shellListItem(shell, &base[i]);
    2bc4:	97fffebb 	bl	26b0 <shellListItem>
    2bc8:	794152a4 	ldrh	w4, [x21, #168]
    for (short i = 0; i < shell->commandList.count; i++) {
    2bcc:	11000673 	add	w19, w19, #0x1
    2bd0:	6b33a09f 	cmp	w4, w19, sxth
    2bd4:	13003e73 	sxth	w19, w19
    2bd8:	5400034d 	b.le	2c40 <shellListVar+0xe0>
        if (base[i].attr.attrs.type > SHELL_TYPE_CMD_FUNC
    2bdc:	937b7e63 	sbfiz	x3, x19, #5, #32
            shellListItem(shell, &base[i]);
    2be0:	aa1503e0 	mov	x0, x21
        if (base[i].attr.attrs.type > SHELL_TYPE_CMD_FUNC
    2be4:	8b030281 	add	x1, x20, x3
    2be8:	f8636a82 	ldr	x2, [x20, x3]
    2bec:	d3482c42 	ubfx	x2, x2, #8, #4
            && base[i].attr.attrs.type <= SHELL_TYPE_VAR_NODE
    2bf0:	11003842 	add	w2, w2, #0xe
        if (base[i].attr.attrs.type > SHELL_TYPE_CMD_FUNC
    2bf4:	12000c42 	and	w2, w2, #0xf
    2bf8:	7100145f 	cmp	w2, #0x5
    2bfc:	54fffe88 	b.hi	2bcc <shellListVar+0x6c>  // b.pmore
    return ((!command->attr.attrs.permission
    2c00:	38636a82 	ldrb	w2, [x20, x3]
        : -1;
    2c04:	34000142 	cbz	w2, 2c2c <shellListVar+0xcc>
                || command->attr.attrs.type == SHELL_TYPE_USER
    2c08:	b8636a85 	ldr	w5, [x20, x3]
    2c0c:	12180ca5 	and	w5, w5, #0xf00
    2c10:	712000bf 	cmp	w5, #0x800
    2c14:	540000c0 	b.eq	2c2c <shellListVar+0xcc>  // b.none
                || (shell->info.user
    2c18:	f94002a5 	ldr	x5, [x21]
    2c1c:	b4fffd85 	cbz	x5, 2bcc <shellListVar+0x6c>
                    && (command->attr.attrs.permission
    2c20:	394000a5 	ldrb	w5, [x5]
    2c24:	6a05005f 	tst	w2, w5
    2c28:	54fffd20 	b.eq	2bcc <shellListVar+0x6c>  // b.none
               && (shell->status.isChecked
    2c2c:	3942c2a2 	ldrb	w2, [x21, #176]
    2c30:	3707fca2 	tbnz	w2, #0, 2bc4 <shellListVar+0x64>
                   || command->attr.attrs.enableUnchecked))
    2c34:	b8636a82 	ldr	w2, [x20, x3]
    2c38:	3767fc62 	tbnz	w2, #12, 2bc4 <shellListVar+0x64>
    2c3c:	17ffffe4 	b	2bcc <shellListVar+0x6c>
}
    2c40:	a94153f3 	ldp	x19, x20, [sp, #16]
    2c44:	f94013f5 	ldr	x21, [sp, #32]
    2c48:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c4c:	d65f03c0 	ret

0000000000002c50 <shellListUser>:
{
    2c50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2c54:	910003fd 	mov	x29, sp
    2c58:	a90153f3 	stp	x19, x20, [sp, #16]
    2c5c:	f90013f5 	str	x21, [sp, #32]
    2c60:	aa0003f5 	mov	x21, x0
    SHELL_ASSERT(shell->write, return 0);
    2c64:	f9406004 	ldr	x4, [x0, #192]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    2c68:	f9405014 	ldr	x20, [x0, #160]
    SHELL_ASSERT(shell->write, return 0);
    2c6c:	b40001c4 	cbz	x4, 2ca4 <shellListUser+0x54>
    while (*p++) {
    2c70:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    2c74:	91318442 	add	x2, x2, #0xc61
    2c78:	52800143 	mov	w3, #0xa                   	// #10
    unsigned short count = 0;
    2c7c:	52800001 	mov	w1, #0x0                   	// #0
    2c80:	14000002 	b	2c88 <shellListUser+0x38>
    while (*p++) {
    2c84:	39400043 	ldrb	w3, [x2]
        count++;
    2c88:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2c8c:	91000442 	add	x2, x2, #0x1
        count++;
    2c90:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2c94:	35ffff83 	cbnz	w3, 2c84 <shellListUser+0x34>
    return shell->write((char*)string, count);
    2c98:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2c9c:	91318000 	add	x0, x0, #0xc60
    2ca0:	d63f0080 	blr	x4
    for (short i = 0; i < shell->commandList.count; i++) {
    2ca4:	794152a4 	ldrh	w4, [x21, #168]
    2ca8:	52800013 	mov	w19, #0x0                   	// #0
    2cac:	350000c4 	cbnz	w4, 2cc4 <shellListUser+0x74>
    2cb0:	14000016 	b	2d08 <shellListUser+0xb8>
    2cb4:	11000673 	add	w19, w19, #0x1
    2cb8:	6b33a09f 	cmp	w4, w19, sxth
    2cbc:	13003e73 	sxth	w19, w19
    2cc0:	5400024d 	b.le	2d08 <shellListUser+0xb8>
        if (base[i].attr.attrs.type > SHELL_TYPE_VAR_NODE
    2cc4:	937b7e62 	sbfiz	x2, x19, #5, #32
    2cc8:	8b020281 	add	x1, x20, x2
            && base[i].attr.attrs.type <= SHELL_TYPE_USER
    2ccc:	b8626a82 	ldr	w2, [x20, x2]
    2cd0:	12180c42 	and	w2, w2, #0xf00
        if (base[i].attr.attrs.type > SHELL_TYPE_VAR_NODE
    2cd4:	7120005f 	cmp	w2, #0x800
    2cd8:	54fffee1 	b.ne	2cb4 <shellListUser+0x64>  // b.any
            && shellCheckPermission(shell, &base[i]) == 0) {
    2cdc:	aa1503e0 	mov	x0, x21
    2ce0:	97fffda4 	bl	2370 <shellCheckPermission>
    2ce4:	72001c1f 	tst	w0, #0xff
    2ce8:	54fffe61 	b.ne	2cb4 <shellListUser+0x64>  // b.any
            shellListItem(shell, &base[i]);
    2cec:	aa1503e0 	mov	x0, x21
    2cf0:	97fffe70 	bl	26b0 <shellListItem>
    2cf4:	794152a4 	ldrh	w4, [x21, #168]
    for (short i = 0; i < shell->commandList.count; i++) {
    2cf8:	11000673 	add	w19, w19, #0x1
    2cfc:	6b33a09f 	cmp	w4, w19, sxth
    2d00:	13003e73 	sxth	w19, w19
    2d04:	54fffe0c 	b.gt	2cc4 <shellListUser+0x74>
}
    2d08:	a94153f3 	ldp	x19, x20, [sp, #16]
    2d0c:	f94013f5 	ldr	x21, [sp, #32]
    2d10:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2d14:	d65f03c0 	ret
    2d18:	d503201f 	nop
    2d1c:	d503201f 	nop

0000000000002d20 <shellListKey>:
{
    2d20:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2d24:	910003fd 	mov	x29, sp
    2d28:	a90153f3 	stp	x19, x20, [sp, #16]
    2d2c:	f90013f5 	str	x21, [sp, #32]
    2d30:	aa0003f5 	mov	x21, x0
    SHELL_ASSERT(shell->write, return 0);
    2d34:	f9406004 	ldr	x4, [x0, #192]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    2d38:	f9405014 	ldr	x20, [x0, #160]
    SHELL_ASSERT(shell->write, return 0);
    2d3c:	b40001c4 	cbz	x4, 2d74 <shellListKey+0x54>
    while (*p++) {
    2d40:	b0000062 	adrp	x2, f000 <_fstat_r+0x40>
    2d44:	9131c442 	add	x2, x2, #0xc71
    2d48:	52800143 	mov	w3, #0xa                   	// #10
    unsigned short count = 0;
    2d4c:	52800001 	mov	w1, #0x0                   	// #0
    2d50:	14000002 	b	2d58 <shellListKey+0x38>
    while (*p++) {
    2d54:	39400043 	ldrb	w3, [x2]
        count++;
    2d58:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2d5c:	91000442 	add	x2, x2, #0x1
        count++;
    2d60:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2d64:	35ffff83 	cbnz	w3, 2d54 <shellListKey+0x34>
    return shell->write((char*)string, count);
    2d68:	b0000060 	adrp	x0, f000 <_fstat_r+0x40>
    2d6c:	9131c000 	add	x0, x0, #0xc70
    2d70:	d63f0080 	blr	x4
    for (short i = 0; i < shell->commandList.count; i++) {
    2d74:	794152a4 	ldrh	w4, [x21, #168]
    2d78:	52800013 	mov	w19, #0x0                   	// #0
    2d7c:	350000c4 	cbnz	w4, 2d94 <shellListKey+0x74>
    2d80:	14000016 	b	2dd8 <shellListKey+0xb8>
    2d84:	11000673 	add	w19, w19, #0x1
    2d88:	6b33a09f 	cmp	w4, w19, sxth
    2d8c:	13003e73 	sxth	w19, w19
    2d90:	5400024d 	b.le	2dd8 <shellListKey+0xb8>
        if (base[i].attr.attrs.type > SHELL_TYPE_USER
    2d94:	937b7e62 	sbfiz	x2, x19, #5, #32
    2d98:	8b020281 	add	x1, x20, x2
            && base[i].attr.attrs.type <= SHELL_TYPE_KEY
    2d9c:	b8626a82 	ldr	w2, [x20, x2]
    2da0:	12180c42 	and	w2, w2, #0xf00
        if (base[i].attr.attrs.type > SHELL_TYPE_USER
    2da4:	7124005f 	cmp	w2, #0x900
    2da8:	54fffee1 	b.ne	2d84 <shellListKey+0x64>  // b.any
            && shellCheckPermission(shell, &base[i]) == 0) {
    2dac:	aa1503e0 	mov	x0, x21
    2db0:	97fffd70 	bl	2370 <shellCheckPermission>
    2db4:	72001c1f 	tst	w0, #0xff
    2db8:	54fffe61 	b.ne	2d84 <shellListKey+0x64>  // b.any
            shellListItem(shell, &base[i]);
    2dbc:	aa1503e0 	mov	x0, x21
    2dc0:	97fffe3c 	bl	26b0 <shellListItem>
    2dc4:	794152a4 	ldrh	w4, [x21, #168]
    for (short i = 0; i < shell->commandList.count; i++) {
    2dc8:	11000673 	add	w19, w19, #0x1
    2dcc:	6b33a09f 	cmp	w4, w19, sxth
    2dd0:	13003e73 	sxth	w19, w19
    2dd4:	54fffe0c 	b.gt	2d94 <shellListKey+0x74>
}
    2dd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    2ddc:	f94013f5 	ldr	x21, [sp, #32]
    2de0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2de4:	d65f03c0 	ret
    2de8:	d503201f 	nop
    2dec:	d503201f 	nop

0000000000002df0 <shellListAll>:
    shellListCommand(shell);
    2df0:	17ffff1c 	b	2a60 <shellListCommand>
    2df4:	d503201f 	nop
    2df8:	d503201f 	nop
    2dfc:	d503201f 	nop

0000000000002e00 <shellDeleteCommandLine>:
{
    2e00:	12001c21 	and	w1, w1, #0xff
    while (length--) {
    2e04:	34000401 	cbz	w1, 2e84 <shellDeleteCommandLine+0x84>
{
    2e08:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2e0c:	910003fd 	mov	x29, sp
    2e10:	a90153f3 	stp	x19, x20, [sp, #16]
    2e14:	51000433 	sub	w19, w1, #0x1
    2e18:	aa0003f4 	mov	x20, x0
    2e1c:	12001e73 	and	w19, w19, #0xff
    2e20:	a9025bf5 	stp	x21, x22, [sp, #32]
    2e24:	b0000075 	adrp	x21, f000 <_fstat_r+0x40>
    2e28:	913202b5 	add	x21, x21, #0xc80
    2e2c:	b0000076 	adrp	x22, f000 <_fstat_r+0x40>
    SHELL_ASSERT(shell->write, return 0);
    2e30:	f9406284 	ldr	x4, [x20, #192]
    2e34:	b4000184 	cbz	x4, 2e64 <shellDeleteCommandLine+0x64>
    while (*p++) {
    2e38:	913206c2 	add	x2, x22, #0xc81
    2e3c:	52800403 	mov	w3, #0x20                  	// #32
    unsigned short count = 0;
    2e40:	52800001 	mov	w1, #0x0                   	// #0
    2e44:	14000002 	b	2e4c <shellDeleteCommandLine+0x4c>
    while (*p++) {
    2e48:	39400043 	ldrb	w3, [x2]
        count++;
    2e4c:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2e50:	91000442 	add	x2, x2, #0x1
        count++;
    2e54:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2e58:	35ffff83 	cbnz	w3, 2e48 <shellDeleteCommandLine+0x48>
    return shell->write((char*)string, count);
    2e5c:	aa1503e0 	mov	x0, x21
    2e60:	d63f0080 	blr	x4
    while (length--) {
    2e64:	51000673 	sub	w19, w19, #0x1
    2e68:	12001e73 	and	w19, w19, #0xff
    2e6c:	7103fe7f 	cmp	w19, #0xff
    2e70:	54fffe01 	b.ne	2e30 <shellDeleteCommandLine+0x30>  // b.any
}
    2e74:	a94153f3 	ldp	x19, x20, [sp, #16]
    2e78:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2e7c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2e80:	d65f03c0 	ret
    2e84:	d65f03c0 	ret
    2e88:	d503201f 	nop
    2e8c:	d503201f 	nop

0000000000002e90 <shellClearCommandLine>:
{
    2e90:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2e94:	910003fd 	mov	x29, sp
    2e98:	a90153f3 	stp	x19, x20, [sp, #16]
    2e9c:	aa0003f4 	mov	x20, x0
    2ea0:	a9025bf5 	stp	x21, x22, [sp, #32]
    for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    2ea4:	79403000 	ldrh	w0, [x0, #24]
    2ea8:	79403681 	ldrh	w1, [x20, #26]
    2eac:	4b010001 	sub	w1, w0, w1
    2eb0:	13003c33 	sxth	w19, w1
    2eb4:	7100027f 	cmp	w19, #0x0
    2eb8:	5400018d 	b.le	2ee8 <shellClearCommandLine+0x58>
    2ebc:	52800415 	mov	w21, #0x20                  	// #32
    shell->write(&data, 1);
    2ec0:	f9406282 	ldr	x2, [x20, #192]
    2ec4:	3900fff5 	strb	w21, [sp, #63]
    2ec8:	52800021 	mov	w1, #0x1                   	// #1
    2ecc:	9100ffe0 	add	x0, sp, #0x3f
    2ed0:	d63f0040 	blr	x2
    for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    2ed4:	51000661 	sub	w1, w19, #0x1
    2ed8:	72003c3f 	tst	w1, #0xffff
    2edc:	13003c33 	sxth	w19, w1
    2ee0:	54ffff01 	b.ne	2ec0 <shellClearCommandLine+0x30>  // b.any
    shellDeleteCommandLine(shell, shell->parser.length);
    2ee4:	79403280 	ldrh	w0, [x20, #24]
    return shell->write((char*)string, count);
    2ee8:	b0000075 	adrp	x21, f000 <_fstat_r+0x40>
    2eec:	913202b5 	add	x21, x21, #0xc80
    while (length--) {
    2ef0:	72001c13 	ands	w19, w0, #0xff
    while (*p++) {
    2ef4:	b0000076 	adrp	x22, f000 <_fstat_r+0x40>
    while (length--) {
    2ef8:	54000240 	b.eq	2f40 <shellClearCommandLine+0xb0>  // b.none
    2efc:	d503201f 	nop
    SHELL_ASSERT(shell->write, return 0);
    2f00:	f9406284 	ldr	x4, [x20, #192]
    2f04:	b4000184 	cbz	x4, 2f34 <shellClearCommandLine+0xa4>
    while (*p++) {
    2f08:	913206c2 	add	x2, x22, #0xc81
    2f0c:	52800403 	mov	w3, #0x20                  	// #32
    unsigned short count = 0;
    2f10:	52800001 	mov	w1, #0x0                   	// #0
    2f14:	14000002 	b	2f1c <shellClearCommandLine+0x8c>
    while (*p++) {
    2f18:	39400043 	ldrb	w3, [x2]
        count++;
    2f1c:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    2f20:	91000442 	add	x2, x2, #0x1
        count++;
    2f24:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    2f28:	35ffff83 	cbnz	w3, 2f18 <shellClearCommandLine+0x88>
    return shell->write((char*)string, count);
    2f2c:	aa1503e0 	mov	x0, x21
    2f30:	d63f0080 	blr	x4
    while (length--) {
    2f34:	51000661 	sub	w1, w19, #0x1
    2f38:	72001c33 	ands	w19, w1, #0xff
    2f3c:	54fffe21 	b.ne	2f00 <shellClearCommandLine+0x70>  // b.any
}
    2f40:	a94153f3 	ldp	x19, x20, [sp, #16]
    2f44:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2f48:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2f4c:	d65f03c0 	ret

0000000000002f50 <shellInsertByte>:
{
    2f50:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2f54:	12001c25 	and	w5, w1, #0xff
    2f58:	910003fd 	mov	x29, sp
    2f5c:	a90153f3 	stp	x19, x20, [sp, #16]
    2f60:	aa0003f3 	mov	x19, x0
    if (shell->parser.length >= shell->parser.bufferSize - 1) {
    2f64:	7940d001 	ldrh	w1, [x0, #104]
    2f68:	79403000 	ldrh	w0, [x0, #24]
    2f6c:	51000421 	sub	w1, w1, #0x1
    2f70:	6b01001f 	cmp	w0, w1
    2f74:	54000caa 	b.ge	3108 <shellInsertByte+0x1b8>  // b.tcont
    if (shell->parser.cursor == shell->parser.length) {
    2f78:	79403661 	ldrh	w1, [x19, #26]
    2f7c:	6b01001f 	cmp	w0, w1
    2f80:	54000960 	b.eq	30ac <shellInsertByte+0x15c>  // b.none
    } else if (shell->parser.cursor < shell->parser.length) {
    2f84:	540008e9 	b.ls	30a0 <shellInsertByte+0x150>  // b.plast
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    2f88:	4b010000 	sub	w0, w0, w1
    2f8c:	a9025bf5 	stp	x21, x22, [sp, #32]
    2f90:	12003c04 	and	w4, w0, #0xffff
    2f94:	13003c00 	sxth	w0, w0
    2f98:	7100001f 	cmp	w0, #0x0
    2f9c:	5400018d 	b.le	2fcc <shellInsertByte+0x7c>
    2fa0:	4b040004 	sub	w4, w0, w4
    2fa4:	d503201f 	nop
            shell->parser.buffer[shell->parser.cursor + i] = shell->parser.buffer[shell->parser.cursor + i - 1];
    2fa8:	f9401262 	ldr	x2, [x19, #32]
    2fac:	0b000021 	add	w1, w1, w0
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    2fb0:	51000400 	sub	w0, w0, #0x1
    2fb4:	6b00009f 	cmp	w4, w0
            shell->parser.buffer[shell->parser.cursor + i] = shell->parser.buffer[shell->parser.cursor + i - 1];
    2fb8:	8b21c043 	add	x3, x2, w1, sxtw
    2fbc:	385ff063 	ldurb	w3, [x3, #-1]
    2fc0:	3821c843 	strb	w3, [x2, w1, sxtw]
    2fc4:	79403661 	ldrh	w1, [x19, #26]
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    2fc8:	54ffff01 	b.ne	2fa8 <shellInsertByte+0x58>  // b.any
        shell->parser.buffer[shell->parser.cursor++] = data;
    2fcc:	f9401262 	ldr	x2, [x19, #32]
    2fd0:	92403c20 	and	x0, x1, #0xffff
    2fd4:	11000421 	add	w1, w1, #0x1
    2fd8:	79003661 	strh	w1, [x19, #26]
    2fdc:	38206845 	strb	w5, [x2, x0]
        shell->parser.buffer[++shell->parser.length] = 0;
    2fe0:	79403260 	ldrh	w0, [x19, #24]
    2fe4:	f9401261 	ldr	x1, [x19, #32]
    2fe8:	11000400 	add	w0, w0, #0x1
    2fec:	12003c00 	and	w0, w0, #0xffff
    2ff0:	79003260 	strh	w0, [x19, #24]
    2ff4:	92403c00 	and	x0, x0, #0xffff
    2ff8:	3820683f 	strb	wzr, [x1, x0]
        for (short i = shell->parser.cursor - 1; i < shell->parser.length; i++) {
    2ffc:	79403661 	ldrh	w1, [x19, #26]
    3000:	79403260 	ldrh	w0, [x19, #24]
    3004:	51000422 	sub	w2, w1, #0x1
    3008:	13003c54 	sxth	w20, w2
    300c:	6b22a01f 	cmp	w0, w2, sxth
    3010:	5400026d 	b.le	305c <shellInsertByte+0x10c>
    3014:	9100fff5 	add	x21, sp, #0x3f
                shell->status.isChecked ? shell->parser.buffer[i] : '*');
    3018:	3942c263 	ldrb	w3, [x19, #176]
    301c:	93403e84 	sxth	x4, w20
    shell->write(&data, 1);
    3020:	aa1503e0 	mov	x0, x21
    3024:	52800021 	mov	w1, #0x1                   	// #1
            shellWriteByte(shell,
    3028:	52800542 	mov	w2, #0x2a                  	// #42
    302c:	36000063 	tbz	w3, #0, 3038 <shellInsertByte+0xe8>
    3030:	f9401262 	ldr	x2, [x19, #32]
    3034:	38646842 	ldrb	w2, [x2, x4]
    shell->write(&data, 1);
    3038:	f9406263 	ldr	x3, [x19, #192]
    303c:	3900ffe2 	strb	w2, [sp, #63]
    3040:	d63f0060 	blr	x3
        for (short i = shell->parser.cursor - 1; i < shell->parser.length; i++) {
    3044:	79403260 	ldrh	w0, [x19, #24]
    3048:	11000681 	add	w1, w20, #0x1
    304c:	13003c34 	sxth	w20, w1
    3050:	6b21a01f 	cmp	w0, w1, sxth
    3054:	54fffe2c 	b.gt	3018 <shellInsertByte+0xc8>
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    3058:	79403661 	ldrh	w1, [x19, #26]
    305c:	4b010000 	sub	w0, w0, w1
    3060:	13003c14 	sxth	w20, w0
    3064:	7100029f 	cmp	w20, #0x0
    3068:	540001ad 	b.le	309c <shellInsertByte+0x14c>
    306c:	9100fff5 	add	x21, sp, #0x3f
    3070:	52800116 	mov	w22, #0x8                   	// #8
    3074:	d503201f 	nop
    shell->write(&data, 1);
    3078:	f9406262 	ldr	x2, [x19, #192]
    307c:	3900fff6 	strb	w22, [sp, #63]
    3080:	aa1503e0 	mov	x0, x21
    3084:	52800021 	mov	w1, #0x1                   	// #1
    3088:	d63f0040 	blr	x2
        for (short i = shell->parser.length - shell->parser.cursor; i > 0; i--) {
    308c:	51000680 	sub	w0, w20, #0x1
    3090:	72003c1f 	tst	w0, #0xffff
    3094:	13003c14 	sxth	w20, w0
    3098:	54ffff01 	b.ne	3078 <shellInsertByte+0x128>  // b.any
    309c:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
    30a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    30a4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    30a8:	d65f03c0 	ret
        shell->parser.buffer[shell->parser.length++] = data;
    30ac:	f9401263 	ldr	x3, [x19, #32]
    30b0:	92403c02 	and	x2, x0, #0xffff
    30b4:	11000400 	add	w0, w0, #0x1
    30b8:	79003260 	strh	w0, [x19, #24]
        shellWriteByte(shell, shell->status.isChecked ? data : '*');
    30bc:	52800544 	mov	w4, #0x2a                  	// #42
    shell->write(&data, 1);
    30c0:	9100ffe0 	add	x0, sp, #0x3f
        shell->parser.buffer[shell->parser.length++] = data;
    30c4:	38226865 	strb	w5, [x3, x2]
    shell->write(&data, 1);
    30c8:	52800021 	mov	w1, #0x1                   	// #1
        shell->parser.buffer[shell->parser.length] = 0;
    30cc:	79403262 	ldrh	w2, [x19, #24]
    30d0:	f9401263 	ldr	x3, [x19, #32]
    30d4:	3822687f 	strb	wzr, [x3, x2]
        shellWriteByte(shell, shell->status.isChecked ? data : '*');
    30d8:	3942c266 	ldrb	w6, [x19, #176]
        shell->parser.cursor++;
    30dc:	79403662 	ldrh	w2, [x19, #26]
    shell->write(&data, 1);
    30e0:	f9406263 	ldr	x3, [x19, #192]
        shellWriteByte(shell, shell->status.isChecked ? data : '*');
    30e4:	f24000df 	tst	x6, #0x1
    30e8:	1a8410a5 	csel	w5, w5, w4, ne  // ne = any
        shell->parser.cursor++;
    30ec:	11000442 	add	w2, w2, #0x1
    30f0:	79003662 	strh	w2, [x19, #26]
    30f4:	3900ffe5 	strb	w5, [sp, #63]
    shell->write(&data, 1);
    30f8:	d63f0060 	blr	x3
}
    30fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    3100:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3104:	d65f03c0 	ret
    SHELL_ASSERT(shell->write, return 0);
    3108:	f9406263 	ldr	x3, [x19, #192]
    310c:	b4000663 	cbz	x3, 31d8 <shellInsertByte+0x288>
    while (*p++) {
    3110:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3114:	91322400 	add	x0, x0, #0xc89
    3118:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    311c:	52800001 	mov	w1, #0x0                   	// #0
    3120:	14000002 	b	3128 <shellInsertByte+0x1d8>
    while (*p++) {
    3124:	39400002 	ldrb	w2, [x0]
        count++;
    3128:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    312c:	91000400 	add	x0, x0, #0x1
        count++;
    3130:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3134:	35ffff82 	cbnz	w2, 3124 <shellInsertByte+0x1d4>
    return shell->write((char*)string, count);
    3138:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    313c:	91322000 	add	x0, x0, #0xc88
    3140:	d63f0060 	blr	x3
    if (shell->status.isChecked) {
    3144:	3942c260 	ldrb	w0, [x19, #176]
    3148:	36000280 	tbz	w0, #0, 3198 <shellInsertByte+0x248>
    314c:	aa1303e0 	mov	x0, x19
    3150:	97fffbfc 	bl	2140 <shellWritePrompt.part.0.constprop.0>
    SHELL_ASSERT(shell->write, return 0);
    3154:	f9406265 	ldr	x5, [x19, #192]
        shellWriteString(shell, shell->parser.buffer);
    3158:	f9401260 	ldr	x0, [x19, #32]
    SHELL_ASSERT(shell->write, return 0);
    315c:	b4fffa25 	cbz	x5, 30a0 <shellInsertByte+0x150>
    while (*p++) {
    3160:	aa0003e2 	mov	x2, x0
    3164:	38401441 	ldrb	w1, [x2], #1
    3168:	340003e1 	cbz	w1, 31e4 <shellInsertByte+0x294>
    316c:	52800024 	mov	w4, #0x1                   	// #1
    3170:	4b020084 	sub	w4, w4, w2
    3174:	d503201f 	nop
        count++;
    3178:	0b020081 	add	w1, w4, w2
    while (*p++) {
    317c:	38401443 	ldrb	w3, [x2], #1
    3180:	12003c21 	and	w1, w1, #0xffff
    3184:	35ffffa3 	cbnz	w3, 3178 <shellInsertByte+0x228>
}
    3188:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    318c:	aa0503f0 	mov	x16, x5
}
    3190:	a8c47bfd 	ldp	x29, x30, [sp], #64
    return shell->write((char*)string, count);
    3194:	d61f0200 	br	x16
    SHELL_ASSERT(shell->write, return 0);
    3198:	f9406263 	ldr	x3, [x19, #192]
    319c:	b4fff823 	cbz	x3, 30a0 <shellInsertByte+0x150>
    while (*p++) {
    31a0:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    31a4:	9132c400 	add	x0, x0, #0xcb1
    31a8:	52800d82 	mov	w2, #0x6c                  	// #108
    unsigned short count = 0;
    31ac:	52800001 	mov	w1, #0x0                   	// #0
    31b0:	14000002 	b	31b8 <shellInsertByte+0x268>
    while (*p++) {
    31b4:	39400002 	ldrb	w2, [x0]
        count++;
    31b8:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    31bc:	91000400 	add	x0, x0, #0x1
        count++;
    31c0:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    31c4:	35ffff82 	cbnz	w2, 31b4 <shellInsertByte+0x264>
    return shell->write((char*)string, count);
    31c8:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    31cc:	9132c000 	add	x0, x0, #0xcb0
    31d0:	d63f0060 	blr	x3
    31d4:	17ffffe0 	b	3154 <shellInsertByte+0x204>
    if (shell->status.isChecked) {
    31d8:	3942c260 	ldrb	w0, [x19, #176]
    31dc:	3707fb80 	tbnz	w0, #0, 314c <shellInsertByte+0x1fc>
    31e0:	17ffffb0 	b	30a0 <shellInsertByte+0x150>
    unsigned short count = 0;
    31e4:	52800001 	mov	w1, #0x0                   	// #0
    31e8:	17ffffe8 	b	3188 <shellInsertByte+0x238>
    31ec:	d503201f 	nop

00000000000031f0 <shellDeleteByte>:
    if ((shell->parser.cursor == 0 && direction == 1)
    31f0:	79403405 	ldrh	w5, [x0, #26]
{
    31f4:	13001c21 	sxtb	w1, w1
    if ((shell->parser.cursor == 0 && direction == 1)
    31f8:	710000bf 	cmp	w5, #0x0
    31fc:	7a410820 	ccmp	w1, #0x1, #0x0, eq  // eq = none
    3200:	54001000 	b.eq	3400 <shellDeleteByte+0x210>  // b.none
{
    3204:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    3208:	910003fd 	mov	x29, sp
    320c:	a90153f3 	stp	x19, x20, [sp, #16]
    3210:	aa0003f3 	mov	x19, x0
    3214:	a9025bf5 	stp	x21, x22, [sp, #32]
        || (shell->parser.cursor == shell->parser.length && direction == -1)) {
    3218:	79403004 	ldrh	w4, [x0, #24]
    321c:	6b0400bf 	cmp	w5, w4
    3220:	54000ae0 	b.eq	337c <shellDeleteByte+0x18c>  // b.none
    char offset = (direction == -1) ? 1 : 0;
    3224:	3100043f 	cmn	w1, #0x1
        for (short i = offset; i < shell->parser.length - shell->parser.cursor; i++) {
    3228:	4b050086 	sub	w6, w4, w5
    322c:	1a9f17e2 	cset	w2, eq  // eq = none
    3230:	2a0503e3 	mov	w3, w5
    3234:	2a0203e0 	mov	w0, w2
    3238:	6b0200df 	cmp	w6, w2
    323c:	540001ed 	b.le	3278 <shellDeleteByte+0x88>
            shell->parser.buffer[shell->parser.cursor + i - 1] = shell->parser.buffer[shell->parser.cursor + i];
    3240:	f9401264 	ldr	x4, [x19, #32]
    3244:	0b030042 	add	w2, w2, w3
    3248:	11000400 	add	w0, w0, #0x1
    324c:	8b22c083 	add	x3, x4, w2, sxtw
    3250:	3862c884 	ldrb	w4, [x4, w2, sxtw]
    3254:	13003c00 	sxth	w0, w0
        for (short i = offset; i < shell->parser.length - shell->parser.cursor; i++) {
    3258:	2a0003e2 	mov	w2, w0
            shell->parser.buffer[shell->parser.cursor + i - 1] = shell->parser.buffer[shell->parser.cursor + i];
    325c:	381ff064 	sturb	w4, [x3, #-1]
        for (short i = offset; i < shell->parser.length - shell->parser.cursor; i++) {
    3260:	79403663 	ldrh	w3, [x19, #26]
    3264:	79403264 	ldrh	w4, [x19, #24]
    3268:	2a0303e5 	mov	w5, w3
    326c:	4b030086 	sub	w6, w4, w3
    3270:	6b06001f 	cmp	w0, w6
    3274:	54fffe6b 	b.lt	3240 <shellDeleteByte+0x50>  // b.tstop
        shell->parser.length--;
    3278:	51000484 	sub	w4, w4, #0x1
        if (!offset) {
    327c:	3100043f 	cmn	w1, #0x1
        shell->parser.length--;
    3280:	12003c84 	and	w4, w4, #0xffff
    3284:	79003264 	strh	w4, [x19, #24]
        if (!offset) {
    3288:	9100fff5 	add	x21, sp, #0x3f
    328c:	54000160 	b.eq	32b8 <shellDeleteByte+0xc8>  // b.none
    3290:	510004a5 	sub	w5, w5, #0x1
    shell->write(&data, 1);
    3294:	f9406262 	ldr	x2, [x19, #192]
    3298:	52800100 	mov	w0, #0x8                   	// #8
            shell->parser.cursor--;
    329c:	79003665 	strh	w5, [x19, #26]
    shell->write(&data, 1);
    32a0:	9100fff5 	add	x21, sp, #0x3f
    32a4:	3900ffe0 	strb	w0, [sp, #63]
    32a8:	52800021 	mov	w1, #0x1                   	// #1
    32ac:	aa1503e0 	mov	x0, x21
    32b0:	d63f0040 	blr	x2
        shell->parser.buffer[shell->parser.length] = 0;
    32b4:	79403264 	ldrh	w4, [x19, #24]
    32b8:	f9401260 	ldr	x0, [x19, #32]
    32bc:	92403c84 	and	x4, x4, #0xffff
    32c0:	3824681f 	strb	wzr, [x0, x4]
        for (short i = shell->parser.cursor; i < shell->parser.length; i++) {
    32c4:	79c03674 	ldrsh	w20, [x19, #26]
    32c8:	79403260 	ldrh	w0, [x19, #24]
    32cc:	6b00029f 	cmp	w20, w0
    32d0:	540001ea 	b.ge	330c <shellDeleteByte+0x11c>  // b.tcont
    32d4:	d503201f 	nop
            shellWriteByte(shell, shell->parser.buffer[i]);
    32d8:	f9401263 	ldr	x3, [x19, #32]
    32dc:	93403e80 	sxth	x0, w20
    shell->write(&data, 1);
    32e0:	f9406262 	ldr	x2, [x19, #192]
    32e4:	52800021 	mov	w1, #0x1                   	// #1
            shellWriteByte(shell, shell->parser.buffer[i]);
    32e8:	38606863 	ldrb	w3, [x3, x0]
    shell->write(&data, 1);
    32ec:	aa1503e0 	mov	x0, x21
    32f0:	3900ffe3 	strb	w3, [sp, #63]
    32f4:	11000694 	add	w20, w20, #0x1
    32f8:	d63f0040 	blr	x2
        for (short i = shell->parser.cursor; i < shell->parser.length; i++) {
    32fc:	79403260 	ldrh	w0, [x19, #24]
    3300:	6b34a01f 	cmp	w0, w20, sxth
    3304:	13003e94 	sxth	w20, w20
    3308:	54fffe8c 	b.gt	32d8 <shellDeleteByte+0xe8>
    shell->write(&data, 1);
    330c:	f9406262 	ldr	x2, [x19, #192]
    3310:	52800400 	mov	w0, #0x20                  	// #32
    3314:	3900ffe0 	strb	w0, [sp, #63]
    3318:	52800021 	mov	w1, #0x1                   	// #1
    331c:	aa1503e0 	mov	x0, x21
    3320:	52800116 	mov	w22, #0x8                   	// #8
    3324:	d63f0040 	blr	x2
        for (short i = shell->parser.length - shell->parser.cursor + 1; i > 0; i--) {
    3328:	79403674 	ldrh	w20, [x19, #26]
    332c:	79403260 	ldrh	w0, [x19, #24]
    3330:	11000400 	add	w0, w0, #0x1
    3334:	4b140000 	sub	w0, w0, w20
    3338:	13003c14 	sxth	w20, w0
    333c:	7100029f 	cmp	w20, #0x0
    3340:	5400016d 	b.le	336c <shellDeleteByte+0x17c>
    3344:	d503201f 	nop
    shell->write(&data, 1);
    3348:	f9406262 	ldr	x2, [x19, #192]
    334c:	3900fff6 	strb	w22, [sp, #63]
    3350:	aa1503e0 	mov	x0, x21
    3354:	52800021 	mov	w1, #0x1                   	// #1
    3358:	d63f0040 	blr	x2
        for (short i = shell->parser.length - shell->parser.cursor + 1; i > 0; i--) {
    335c:	51000680 	sub	w0, w20, #0x1
    3360:	72003c1f 	tst	w0, #0xffff
    3364:	13003c14 	sxth	w20, w0
    3368:	54ffff01 	b.ne	3348 <shellDeleteByte+0x158>  // b.any
}
    336c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3370:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3374:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3378:	d65f03c0 	ret
        || (shell->parser.cursor == shell->parser.length && direction == -1)) {
    337c:	3100043f 	cmn	w1, #0x1
    3380:	54ffff60 	b.eq	336c <shellDeleteByte+0x17c>  // b.none
    if (shell->parser.cursor == shell->parser.length && direction == 1) {
    3384:	7100043f 	cmp	w1, #0x1
    3388:	54000080 	b.eq	3398 <shellDeleteByte+0x1a8>  // b.none
        shell->parser.length--;
    338c:	510004a5 	sub	w5, w5, #0x1
    3390:	79003005 	strh	w5, [x0, #24]
        if (!offset) {
    3394:	17ffffc0 	b	3294 <shellDeleteByte+0xa4>
        shell->parser.cursor--;
    3398:	510004a0 	sub	w0, w5, #0x1
    339c:	79003660 	strh	w0, [x19, #26]
        shell->parser.length--;
    33a0:	12003c00 	and	w0, w0, #0xffff
    33a4:	79003260 	strh	w0, [x19, #24]
        shell->parser.buffer[shell->parser.length] = 0;
    33a8:	f9401261 	ldr	x1, [x19, #32]
    33ac:	92403c00 	and	x0, x0, #0xffff
    33b0:	3820683f 	strb	wzr, [x1, x0]
    SHELL_ASSERT(shell->write, return 0);
    33b4:	f9406263 	ldr	x3, [x19, #192]
    33b8:	b4fffda3 	cbz	x3, 336c <shellDeleteByte+0x17c>
    while (*p++) {
    33bc:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    33c0:	91320400 	add	x0, x0, #0xc81
    33c4:	52800402 	mov	w2, #0x20                  	// #32
    unsigned short count = 0;
    33c8:	52800001 	mov	w1, #0x0                   	// #0
    33cc:	14000002 	b	33d4 <shellDeleteByte+0x1e4>
    while (*p++) {
    33d0:	39400002 	ldrb	w2, [x0]
        count++;
    33d4:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    33d8:	91000400 	add	x0, x0, #0x1
        count++;
    33dc:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    33e0:	35ffff82 	cbnz	w2, 33d0 <shellDeleteByte+0x1e0>
}
    33e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    33e8:	aa0303f0 	mov	x16, x3
}
    33ec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    return shell->write((char*)string, count);
    33f0:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    33f4:	91320000 	add	x0, x0, #0xc80
}
    33f8:	a8c47bfd 	ldp	x29, x30, [sp], #64
    return shell->write((char*)string, count);
    33fc:	d61f0200 	br	x16
    3400:	d65f03c0 	ret
    3404:	d503201f 	nop
    3408:	d503201f 	nop
    340c:	d503201f 	nop

0000000000003410 <shellSplit>:
{
    3410:	d10043ff 	sub	sp, sp, #0x10
    3414:	13003c84 	sxth	w4, w4
    3418:	aa0003e7 	mov	x7, x0
    for (short i = 0; i < maxNum; i++) {
    341c:	7100009f 	cmp	w4, #0x0
{
    3420:	12003c21 	and	w1, w1, #0xffff
    3424:	12001c63 	and	w3, w3, #0xff
    unsigned char pairedLeft[16] = { 0 };
    3428:	a9007fff 	stp	xzr, xzr, [sp]
    for (short i = 0; i < maxNum; i++) {
    342c:	d2800005 	mov	x5, #0x0                   	// #0
    3430:	540000ed 	b.le	344c <shellSplit+0x3c>
    3434:	d503201f 	nop
        array[i] = NULL;
    3438:	f825785f 	str	xzr, [x2, x5, lsl #3]
    for (short i = 0; i < maxNum; i++) {
    343c:	910004a5 	add	x5, x5, #0x1
    3440:	13003ca0 	sxth	w0, w5
    3444:	6b04001f 	cmp	w0, w4
    3448:	54ffff8b 	b.lt	3438 <shellSplit+0x28>  // b.tstop
    int count = 0;
    344c:	52800000 	mov	w0, #0x0                   	// #0
    for (unsigned short i = 0; i < strLen; i++) {
    3450:	34000a61 	cbz	w1, 359c <shellSplit+0x18c>
                && pairedLeft[pariedCount - 1] == pairedChars[j][0]) {
    3454:	b000006b 	adrp	x11, 10000 <__func__.0+0x10>
    3458:	911c216b 	add	x11, x11, #0x708
    for (unsigned short i = 0; i < strLen; i++) {
    345c:	52800005 	mov	w5, #0x0                   	// #0
    int count = 0;
    3460:	52800000 	mov	w0, #0x0                   	// #0
    unsigned char pariedCount = 0;
    3464:	52800009 	mov	w9, #0x0                   	// #0
    unsigned char record = 1;
    3468:	5280002d 	mov	w13, #0x1                   	// #1
    346c:	1400002d 	b	3520 <shellSplit+0x110>
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    3470:	386668ea 	ldrb	w10, [x7, x6]
    3474:	6b03015f 	cmp	w10, w3
    3478:	540008e0 	b.eq	3594 <shellSplit+0x184>  // b.none
    347c:	3500020d 	cbnz	w13, 34bc <shellSplit+0xac>
            } else if ((string[i] == splitKey || string[i] == ' ') && record == 0) {
    3480:	7100815f 	cmp	w10, #0x20
    3484:	54000821 	b.ne	3588 <shellSplit+0x178>  // b.any
                if (string[i + 1] != ' ') {
    3488:	39400506 	ldrb	w6, [x8, #1]
    for (unsigned short i = 0; i < strLen; i++) {
    348c:	110004a5 	add	w5, w5, #0x1
                string[i] = 0;
    3490:	3900011f 	strb	wzr, [x8]
    for (unsigned short i = 0; i < strLen; i++) {
    3494:	12003ca5 	and	w5, w5, #0xffff
                if (string[i + 1] != ' ') {
    3498:	710080df 	cmp	w6, #0x20
    349c:	54000600 	b.eq	355c <shellSplit+0x14c>  // b.none
    for (unsigned short i = 0; i < strLen; i++) {
    34a0:	6b05003f 	cmp	w1, w5
    34a4:	540007c9 	b.ls	359c <shellSplit+0x18c>  // b.plast
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    34a8:	92403ca6 	and	x6, x5, #0xffff
    34ac:	8b2520ec 	add	x12, x7, w5, uxth
    34b0:	386668ea 	ldrb	w10, [x7, x6]
    34b4:	6b0a007f 	cmp	w3, w10
    34b8:	540000c0 	b.eq	34d0 <shellSplit+0xc0>  // b.none
    34bc:	6b00009f 	cmp	w4, w0
    34c0:	5400072c 	b.gt	35a4 <shellSplit+0x194>
            } else if ((string[i] == splitKey || string[i] == ' ') && record == 0) {
    34c4:	7100815f 	cmp	w10, #0x20
    34c8:	5280002d 	mov	w13, #0x1                   	// #1
    34cc:	540005e1 	b.ne	3588 <shellSplit+0x178>  // b.any
            } else if (string[i] == pairedChars[j][0]) {
    34d0:	386668e8 	ldrb	w8, [x7, x6]
    34d4:	5280002d 	mov	w13, #0x1                   	// #1
    34d8:	3940016a 	ldrb	w10, [x11]
    34dc:	6b0a011f 	cmp	w8, w10
    34e0:	54000081 	b.ne	34f0 <shellSplit+0xe0>  // b.any
                pairedLeft[pariedCount++] = pairedChars[j][0];
    34e4:	1100052a 	add	w10, w9, #0x1
    34e8:	3829cbe8 	strb	w8, [sp, w9, sxtw]
                pariedCount &= 0x0F;
    34ec:	12000d49 	and	w9, w10, #0xf
        if (string[i] == '\\' && string[i + 1] != 0) {
    34f0:	7101711f 	cmp	w8, #0x5c
    34f4:	540000e1 	b.ne	3510 <shellSplit+0x100>  // b.any
    34f8:	8b0600e6 	add	x6, x7, x6
            i++;
    34fc:	110004a8 	add	w8, w5, #0x1
    3500:	12003d08 	and	w8, w8, #0xffff
        if (string[i] == '\\' && string[i + 1] != 0) {
    3504:	394004c6 	ldrb	w6, [x6, #1]
            i++;
    3508:	710000df 	cmp	w6, #0x0
    350c:	1a851105 	csel	w5, w8, w5, ne  // ne = any
    for (unsigned short i = 0; i < strLen; i++) {
    3510:	110004a6 	add	w6, w5, #0x1
    3514:	12003cc5 	and	w5, w6, #0xffff
    3518:	6b26203f 	cmp	w1, w6, uxth
    351c:	54000409 	b.ls	359c <shellSplit+0x18c>  // b.plast
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    3520:	8b2520e8 	add	x8, x7, w5, uxth
    3524:	92403ca6 	and	x6, x5, #0xffff
    3528:	aa0803ec 	mov	x12, x8
        if (pariedCount == 0) {
    352c:	34fffa29 	cbz	w9, 3470 <shellSplit+0x60>
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    3530:	386668e8 	ldrb	w8, [x7, x6]
                && string[i] == pairedChars[j][1]
    3534:	3940056c 	ldrb	w12, [x11, #1]
                && pairedLeft[pariedCount - 1] == pairedChars[j][0]) {
    3538:	3940016a 	ldrb	w10, [x11]
                && string[i] == pairedChars[j][1]
    353c:	6b08019f 	cmp	w12, w8
    3540:	54fffce1 	b.ne	34dc <shellSplit+0xcc>  // b.any
                && pairedLeft[pariedCount - 1] == pairedChars[j][0]) {
    3544:	5100052c 	sub	w12, w9, #0x1
    3548:	386ccbee 	ldrb	w14, [sp, w12, sxtw]
    354c:	6b0a01df 	cmp	w14, w10
    3550:	54fffc61 	b.ne	34dc <shellSplit+0xcc>  // b.any
                --pariedCount;
    3554:	12001d89 	and	w9, w12, #0xff
                break;
    3558:	17ffffe6 	b	34f0 <shellSplit+0xe0>
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    355c:	92403ca6 	and	x6, x5, #0xffff
    for (unsigned short i = 0; i < strLen; i++) {
    3560:	6b05003f 	cmp	w1, w5
    3564:	540001c9 	b.ls	359c <shellSplit+0x18c>  // b.plast
            if (string[i] != splitKey && record == 1 && count < maxNum) {
    3568:	386668ea 	ldrb	w10, [x7, x6]
    356c:	8b2520e8 	add	x8, x7, w5, uxth
    3570:	6b03015f 	cmp	w10, w3
    3574:	54fff8a0 	b.eq	3488 <shellSplit+0x78>  // b.none
            } else if ((string[i] == splitKey || string[i] == ' ') && record == 0) {
    3578:	7100815f 	cmp	w10, #0x20
    357c:	54fff860 	b.eq	3488 <shellSplit+0x78>  // b.none
    3580:	5280000d 	mov	w13, #0x0                   	// #0
    3584:	d503201f 	nop
            } else if (string[i] == pairedChars[j][0]) {
    3588:	386668e8 	ldrb	w8, [x7, x6]
    358c:	3940016a 	ldrb	w10, [x11]
    3590:	17ffffd3 	b	34dc <shellSplit+0xcc>
            } else if ((string[i] == splitKey || string[i] == ' ') && record == 0) {
    3594:	34fff7ad 	cbz	w13, 3488 <shellSplit+0x78>
    3598:	17ffffce 	b	34d0 <shellSplit+0xc0>
}
    359c:	910043ff 	add	sp, sp, #0x10
    35a0:	d65f03c0 	ret
                array[count++] = &(string[i]);
    35a4:	f820d84c 	str	x12, [x2, w0, sxtw #3]
                record = 0;
    35a8:	5280000d 	mov	w13, #0x0                   	// #0
                array[count++] = &(string[i]);
    35ac:	11000400 	add	w0, w0, #0x1
            } else if (string[i] == pairedChars[j][0]) {
    35b0:	386668e8 	ldrb	w8, [x7, x6]
    35b4:	3940016a 	ldrb	w10, [x11]
                record = 0;
    35b8:	17ffffc9 	b	34dc <shellSplit+0xcc>
    35bc:	d503201f 	nop

00000000000035c0 <shellSeekCommand>:
{
    35c0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    35c4:	910003fd 	mov	x29, sp
    35c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    35cc:	a90363f7 	stp	x23, x24, [sp, #48]
    35d0:	aa0103f8 	mov	x24, x1
    35d4:	aa0003f7 	mov	x23, x0
    unsigned short count = shell->commandList.count - ((size_t)base - (size_t)shell->commandList.base) / sizeof(ShellCommand);
    35d8:	f9405001 	ldr	x1, [x0, #160]
    35dc:	79415000 	ldrh	w0, [x0, #168]
    35e0:	cb010041 	sub	x1, x2, x1
    35e4:	d345fc21 	lsr	x1, x1, #5
    35e8:	4b010000 	sub	w0, w0, w1
    for (unsigned short i = 0; i < count; i++) {
    35ec:	72003c00 	ands	w0, w0, #0xffff
    35f0:	54000840 	b.eq	36f8 <shellSeekCommand+0x138>  // b.none
    35f4:	51000400 	sub	w0, w0, #0x1
    35f8:	d0000075 	adrp	x21, 11000 <__global_locale+0x180>
    35fc:	912de2b5 	add	x21, x21, #0xb78
    3600:	a90153f3 	stp	x19, x20, [sp, #16]
    3604:	d37b3c00 	ubfiz	x0, x0, #5, #16
    3608:	91008054 	add	x20, x2, #0x20
    360c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3610:	12003c79 	and	w25, w3, #0xffff
    3614:	aa0203f3 	mov	x19, x2
    3618:	8b140014 	add	x20, x0, x20
            if (strncmp(cmd, name, compareLength) == 0) {
    361c:	92403f3a 	and	x26, x25, #0xffff
    3620:	a90573fb 	stp	x27, x28, [sp, #80]
    3624:	910026bc 	add	x28, x21, #0x9
        buffer[i] = '0';
    3628:	5280061b 	mov	w27, #0x30                  	// #48
    362c:	d503201f 	nop
        if (base[i].attr.attrs.type == SHELL_TYPE_KEY
    3630:	b9400260 	ldr	w0, [x19]
    3634:	aa1303f6 	mov	x22, x19
    3638:	12180c00 	and	w0, w0, #0xf00
    363c:	7124001f 	cmp	w0, #0x900
    3640:	54000500 	b.eq	36e0 <shellSeekCommand+0x120>  // b.none
            || shellCheckPermission(shell, &base[i]) != 0) {
    3644:	aa1303e1 	mov	x1, x19
    3648:	aa1703e0 	mov	x0, x23
    364c:	97fffb49 	bl	2370 <shellCheckPermission>
    3650:	72001c1f 	tst	w0, #0xff
    3654:	54000461 	b.ne	36e0 <shellSeekCommand+0x120>  // b.any
    3658:	aa1503e3 	mov	x3, x21
    365c:	d503201f 	nop
        buffer[i] = '0';
    3660:	3800147b 	strb	w27, [x3], #1
    for (unsigned char i = 0; i < 9; i++) {
    3664:	eb03039f 	cmp	x28, x3
    3668:	54ffffc1 	b.ne	3660 <shellSeekCommand+0xa0>  // b.any
    if (command->attr.attrs.type <= SHELL_TYPE_CMD_FUNC) {
    366c:	f9400260 	ldr	x0, [x19]
    3670:	53082c00 	ubfx	w0, w0, #8, #4
    3674:	7100041f 	cmp	w0, #0x1
    3678:	540004c9 	b.ls	3710 <shellSeekCommand+0x150>  // b.plast
    } else if (command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    367c:	71001c1f 	cmp	w0, #0x7
    3680:	54000489 	b.ls	3710 <shellSeekCommand+0x150>  // b.plast
    } else if (command->attr.attrs.type <= SHELL_TYPE_USER) {
    3684:	7100201f 	cmp	w0, #0x8
    3688:	54000440 	b.eq	3710 <shellSeekCommand+0x150>  // b.none
        shellToHex(command->data.key.value, buffer);
    368c:	b9400a61 	ldr	w1, [x19, #8]
    buffer[8] = 0;
    3690:	390022bf 	strb	wzr, [x21, #8]
    while (value) {
    3694:	340001c1 	cbz	w1, 36cc <shellSeekCommand+0x10c>
    unsigned char i = 8;
    3698:	52800100 	mov	w0, #0x8                   	// #8
    369c:	d503201f 	nop
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    36a0:	51000400 	sub	w0, w0, #0x1
        byte = value & 0x0000000F;
    36a4:	12000c22 	and	w2, w1, #0xf
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    36a8:	92401c03 	and	x3, x0, #0xff
    36ac:	7100285f 	cmp	w2, #0xa
    36b0:	11015c44 	add	w4, w2, #0x57
    36b4:	1100c042 	add	w2, w2, #0x30
    36b8:	1a843042 	csel	w2, w2, w4, cc  // cc = lo, ul, last
        value >>= 4;
    36bc:	53047c21 	lsr	w1, w1, #4
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    36c0:	38236aa2 	strb	w2, [x21, x3]
    36c4:	12001c00 	and	w0, w0, #0xff
    while (value) {
    36c8:	35fffec1 	cbnz	w1, 36a0 <shellSeekCommand+0xe0>
    unsigned char i = 8;
    36cc:	aa1503e1 	mov	x1, x21
        if (!compareLength) {
    36d0:	35000259 	cbnz	w25, 3718 <shellSeekCommand+0x158>
            if (strcmp(cmd, name) == 0) {
    36d4:	aa1803e0 	mov	x0, x24
    36d8:	9400113a 	bl	7bc0 <strcmp>
    36dc:	34000260 	cbz	w0, 3728 <shellSeekCommand+0x168>
    for (unsigned short i = 0; i < count; i++) {
    36e0:	91008273 	add	x19, x19, #0x20
    36e4:	eb13029f 	cmp	x20, x19
    36e8:	54fffa41 	b.ne	3630 <shellSeekCommand+0x70>  // b.any
    36ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    36f0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    36f4:	a94573fb 	ldp	x27, x28, [sp, #80]
    return NULL;
    36f8:	d2800016 	mov	x22, #0x0                   	// #0
}
    36fc:	aa1603e0 	mov	x0, x22
    3700:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3704:	a94363f7 	ldp	x23, x24, [sp, #48]
    3708:	a8c67bfd 	ldp	x29, x30, [sp], #96
    370c:	d65f03c0 	ret
        return command->data.user.name;
    3710:	f9400661 	ldr	x1, [x19, #8]
        if (!compareLength) {
    3714:	34fffe19 	cbz	w25, 36d4 <shellSeekCommand+0x114>
            if (strncmp(cmd, name, compareLength) == 0) {
    3718:	aa1a03e2 	mov	x2, x26
    371c:	aa1803e0 	mov	x0, x24
    3720:	940011bf 	bl	7e1c <strncmp>
    3724:	35fffde0 	cbnz	w0, 36e0 <shellSeekCommand+0x120>
}
    3728:	aa1603e0 	mov	x0, x22
    372c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3730:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3734:	a94363f7 	ldp	x23, x24, [sp, #48]
    3738:	a9446bf9 	ldp	x25, x26, [sp, #64]
    373c:	a94573fb 	ldp	x27, x28, [sp, #80]
    3740:	a8c67bfd 	ldp	x29, x30, [sp], #96
    3744:	d65f03c0 	ret
    3748:	d503201f 	nop
    374c:	d503201f 	nop

0000000000003750 <shellGetVarValue>:
    switch (command->attr.attrs.type) {
    3750:	f9400020 	ldr	x0, [x1]
    3754:	53082c00 	ubfx	w0, w0, #8, #4
    3758:	7100101f 	cmp	w0, #0x4
    375c:	54000300 	b.eq	37bc <shellGetVarValue+0x6c>  // b.none
    3760:	54000169 	b.ls	378c <shellGetVarValue+0x3c>  // b.plast
    3764:	7100181f 	cmp	w0, #0x6
    3768:	54000309 	b.ls	37c8 <shellGetVarValue+0x78>  // b.plast
    376c:	71001c1f 	cmp	w0, #0x7
    3770:	540001c1 	b.ne	37a8 <shellGetVarValue+0x58>  // b.any
    3774:	f9400820 	ldr	x0, [x1, #16]
        int (*func)(void*) = ((ShellNodeVarAttr*)command->data.var.value)->get;
    3778:	f9400401 	ldr	x1, [x0, #8]
        value = func ? func(((ShellNodeVarAttr*)command->data.var.value)->var) : 0;
    377c:	b4000161 	cbz	x1, 37a8 <shellGetVarValue+0x58>
    3780:	f9400000 	ldr	x0, [x0]
    3784:	aa0103f0 	mov	x16, x1
    3788:	d61f0200 	br	x16
    switch (command->attr.attrs.type) {
    378c:	7100081f 	cmp	w0, #0x2
    3790:	54000100 	b.eq	37b0 <shellGetVarValue+0x60>  // b.none
    3794:	71000c1f 	cmp	w0, #0x3
    3798:	54000081 	b.ne	37a8 <shellGetVarValue+0x58>  // b.any
        value = *((short*)(command->data.var.value));
    379c:	f9400820 	ldr	x0, [x1, #16]
    37a0:	79c00000 	ldrsh	w0, [x0]
}
    37a4:	d65f03c0 	ret
        value = func ? func(((ShellNodeVarAttr*)command->data.var.value)->var) : 0;
    37a8:	52800000 	mov	w0, #0x0                   	// #0
}
    37ac:	d65f03c0 	ret
        value = *((int*)(command->data.var.value));
    37b0:	f9400820 	ldr	x0, [x1, #16]
    37b4:	b9400000 	ldr	w0, [x0]
}
    37b8:	d65f03c0 	ret
        value = *((char*)(command->data.var.value));
    37bc:	f9400820 	ldr	x0, [x1, #16]
    37c0:	39400000 	ldrb	w0, [x0]
}
    37c4:	d65f03c0 	ret
        value = (size_t)(command->data.var.value);
    37c8:	b9401020 	ldr	w0, [x1, #16]
}
    37cc:	d65f03c0 	ret

00000000000037d0 <shellShowVar>:
    char buffer[12] = "00000000000";
    37d0:	90000062 	adrp	x2, f000 <_fstat_r+0x40>
    37d4:	912fc042 	add	x2, x2, #0xbf0
{
    37d8:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    37dc:	910003fd 	mov	x29, sp
    char buffer[12] = "00000000000";
    37e0:	f9400043 	ldr	x3, [x2]
{
    37e4:	a9025bf5 	stp	x21, x22, [sp, #32]
    char buffer[12] = "00000000000";
    37e8:	b9400842 	ldr	w2, [x2, #8]
    37ec:	9100c3f6 	add	x22, sp, #0x30
{
    37f0:	a90153f3 	stp	x19, x20, [sp, #16]
    37f4:	aa0003f4 	mov	x20, x0
    37f8:	aa0103f5 	mov	x21, x1
    char buffer[12] = "00000000000";
    37fc:	f9001be3 	str	x3, [sp, #48]
    3800:	b9000ac2 	str	w2, [x22, #8]
    int value = shellGetVarValue(shell, command);
    3804:	97ffffd3 	bl	3750 <shellGetVarValue>
    SHELL_ASSERT(shell->write, return 0);
    3808:	f9406285 	ldr	x5, [x20, #192]
    int value = shellGetVarValue(shell, command);
    380c:	2a0003f3 	mov	w19, w0
    SHELL_ASSERT(shell->write, return 0);
    3810:	b4000385 	cbz	x5, 3880 <shellShowVar+0xb0>
    shellWriteString(shell, command->data.var.name);
    3814:	f94006a0 	ldr	x0, [x21, #8]
    while (*p++) {
    3818:	aa0003e2 	mov	x2, x0
    381c:	38401441 	ldrb	w1, [x2], #1
    3820:	34001281 	cbz	w1, 3a70 <shellShowVar+0x2a0>
    3824:	52800024 	mov	w4, #0x1                   	// #1
    3828:	4b020084 	sub	w4, w4, w2
    382c:	d503201f 	nop
        count++;
    3830:	0b020081 	add	w1, w4, w2
    while (*p++) {
    3834:	38401443 	ldrb	w3, [x2], #1
    3838:	12003c21 	and	w1, w1, #0xffff
    383c:	35ffffa3 	cbnz	w3, 3830 <shellShowVar+0x60>
    return shell->write((char*)string, count);
    3840:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    3844:	f9406283 	ldr	x3, [x20, #192]
    3848:	b40001c3 	cbz	x3, 3880 <shellShowVar+0xb0>
    while (*p++) {
    384c:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3850:	91332400 	add	x0, x0, #0xcc9
    3854:	528007a2 	mov	w2, #0x3d                  	// #61
    unsigned short count = 0;
    3858:	52800001 	mov	w1, #0x0                   	// #0
    385c:	14000002 	b	3864 <shellShowVar+0x94>
    while (*p++) {
    3860:	39400002 	ldrb	w2, [x0]
        count++;
    3864:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3868:	91000400 	add	x0, x0, #0x1
        count++;
    386c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3870:	35ffff82 	cbnz	w2, 3860 <shellShowVar+0x90>
    return shell->write((char*)string, count);
    3874:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3878:	91332000 	add	x0, x0, #0xcc8
    387c:	d63f0060 	blr	x3
    switch (command->attr.attrs.type) {
    3880:	f94002a0 	ldr	x0, [x21]
    3884:	53082c00 	ubfx	w0, w0, #8, #4
    3888:	7100141f 	cmp	w0, #0x5
    388c:	54000b60 	b.eq	39f8 <shellShowVar+0x228>  // b.none
        shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    3890:	aa1603e1 	mov	x1, x22
    3894:	2a1303e0 	mov	w0, w19
    3898:	97fffae6 	bl	2430 <shellToDec>
    389c:	52800161 	mov	w1, #0xb                   	// #11
    SHELL_ASSERT(shell->write, return 0);
    38a0:	f9406285 	ldr	x5, [x20, #192]
        shellWriteString(shell, &buffer[11 - shellToDec(value, buffer)]);
    38a4:	4b208021 	sub	w1, w1, w0, sxtb
    38a8:	8b21c2c0 	add	x0, x22, w1, sxtw
    SHELL_ASSERT(shell->write, return 0);
    38ac:	b4000385 	cbz	x5, 391c <shellShowVar+0x14c>
    while (*p++) {
    38b0:	3861cac1 	ldrb	w1, [x22, w1, sxtw]
    38b4:	91000402 	add	x2, x0, #0x1
    38b8:	34000d41 	cbz	w1, 3a60 <shellShowVar+0x290>
    38bc:	52800024 	mov	w4, #0x1                   	// #1
    38c0:	4b020084 	sub	w4, w4, w2
    38c4:	d503201f 	nop
        count++;
    38c8:	0b020081 	add	w1, w4, w2
    while (*p++) {
    38cc:	38401443 	ldrb	w3, [x2], #1
    38d0:	12003c21 	and	w1, w1, #0xffff
    38d4:	35ffffa3 	cbnz	w3, 38c8 <shellShowVar+0xf8>
    return shell->write((char*)string, count);
    38d8:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    38dc:	f9406285 	ldr	x5, [x20, #192]
    38e0:	b40001e5 	cbz	x5, 391c <shellShowVar+0x14c>
    while (*p++) {
    38e4:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    38e8:	912fa400 	add	x0, x0, #0xbe9
    38ec:	52800402 	mov	w2, #0x20                  	// #32
    unsigned short count = 0;
    38f0:	52800001 	mov	w1, #0x0                   	// #0
    38f4:	14000002 	b	38fc <shellShowVar+0x12c>
    while (*p++) {
    38f8:	39400002 	ldrb	w2, [x0]
        count++;
    38fc:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3900:	91000400 	add	x0, x0, #0x1
        count++;
    3904:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3908:	35ffff82 	cbnz	w2, 38f8 <shellShowVar+0x128>
    return shell->write((char*)string, count);
    390c:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3910:	912fa000 	add	x0, x0, #0xbe8
    3914:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    3918:	f9406285 	ldr	x5, [x20, #192]
    391c:	aa1603e0 	mov	x0, x22
    3920:	9100efe2 	add	x2, sp, #0x3b
            buffer[i] = '0';
    3924:	52800601 	mov	w1, #0x30                  	// #48
    3928:	38001401 	strb	w1, [x0], #1
        for (short i = 0; i < 11; i++) {
    392c:	eb00005f 	cmp	x2, x0
    3930:	54ffffc1 	b.ne	3928 <shellShowVar+0x158>  // b.any
    buffer[8] = 0;
    3934:	3900e3ff 	strb	wzr, [sp, #56]
        shellToHex(value, buffer);
    3938:	2a1303e0 	mov	w0, w19
    unsigned char i = 8;
    393c:	52800102 	mov	w2, #0x8                   	// #8
    while (value) {
    3940:	340001b3 	cbz	w19, 3974 <shellShowVar+0x1a4>
    3944:	d503201f 	nop
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    3948:	51000442 	sub	w2, w2, #0x1
        byte = value & 0x0000000F;
    394c:	12000c01 	and	w1, w0, #0xf
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    3950:	92401c43 	and	x3, x2, #0xff
    3954:	7100283f 	cmp	w1, #0xa
    3958:	11015c24 	add	w4, w1, #0x57
    395c:	1100c021 	add	w1, w1, #0x30
    3960:	1a843021 	csel	w1, w1, w4, cc  // cc = lo, ul, last
        value >>= 4;
    3964:	53047c00 	lsr	w0, w0, #4
        buffer[--i] = (byte > 9) ? (byte + 87) : (byte + 48);
    3968:	38236ac1 	strb	w1, [x22, x3]
    396c:	12001c42 	and	w2, w2, #0xff
    while (value) {
    3970:	35fffec0 	cbnz	w0, 3948 <shellShowVar+0x178>
    SHELL_ASSERT(shell->write, return 0);
    3974:	b4000385 	cbz	x5, 39e4 <shellShowVar+0x214>
    while (*p++) {
    3978:	3940c3e0 	ldrb	w0, [sp, #48]
    397c:	34000760 	cbz	w0, 3a68 <shellShowVar+0x298>
    3980:	9100c7e0 	add	x0, sp, #0x31
    3984:	52800023 	mov	w3, #0x1                   	// #1
    3988:	4b000063 	sub	w3, w3, w0
    398c:	d503201f 	nop
        count++;
    3990:	0b000061 	add	w1, w3, w0
    while (*p++) {
    3994:	38401402 	ldrb	w2, [x0], #1
    3998:	12003c21 	and	w1, w1, #0xffff
    399c:	35ffffa2 	cbnz	w2, 3990 <shellShowVar+0x1c0>
    return shell->write((char*)string, count);
    39a0:	aa1603e0 	mov	x0, x22
    39a4:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    39a8:	f9406283 	ldr	x3, [x20, #192]
    39ac:	b40001c3 	cbz	x3, 39e4 <shellShowVar+0x214>
    while (*p++) {
    39b0:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    39b4:	91356400 	add	x0, x0, #0xd59
    39b8:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    39bc:	52800001 	mov	w1, #0x0                   	// #0
    39c0:	14000002 	b	39c8 <shellShowVar+0x1f8>
    while (*p++) {
    39c4:	39400002 	ldrb	w2, [x0]
        count++;
    39c8:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    39cc:	91000400 	add	x0, x0, #0x1
        count++;
    39d0:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    39d4:	35ffff82 	cbnz	w2, 39c4 <shellShowVar+0x1f4>
    return shell->write((char*)string, count);
    39d8:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    39dc:	91356000 	add	x0, x0, #0xd58
    39e0:	d63f0060 	blr	x3
}
    39e4:	2a1303e0 	mov	w0, w19
    39e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    39ec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    39f0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    39f4:	d65f03c0 	ret
    SHELL_ASSERT(shell->write, return 0);
    39f8:	f9406282 	ldr	x2, [x20, #192]
    39fc:	b4ffff42 	cbz	x2, 39e4 <shellShowVar+0x214>
    return shell->write((char*)string, count);
    3a00:	90000075 	adrp	x21, f000 <_fstat_r+0x40>
    3a04:	913342b5 	add	x21, x21, #0xcd0
    3a08:	aa1503e0 	mov	x0, x21
    3a0c:	52800021 	mov	w1, #0x1                   	// #1
    3a10:	d63f0040 	blr	x2
    SHELL_ASSERT(shell->write, return 0);
    3a14:	f9406284 	ldr	x4, [x20, #192]
        shellWriteString(shell, (char*)(size_t)value);
    3a18:	93407e60 	sxtw	x0, w19
    SHELL_ASSERT(shell->write, return 0);
    3a1c:	b4fffe44 	cbz	x4, 39e4 <shellShowVar+0x214>
    while (*p++) {
    3a20:	aa0003e2 	mov	x2, x0
    3a24:	38401441 	ldrb	w1, [x2], #1
    3a28:	34000281 	cbz	w1, 3a78 <shellShowVar+0x2a8>
    3a2c:	d503201f 	nop
    3a30:	39400043 	ldrb	w3, [x2]
    3a34:	4b000041 	sub	w1, w2, w0
    3a38:	12003c21 	and	w1, w1, #0xffff
    3a3c:	91000442 	add	x2, x2, #0x1
    3a40:	35ffff83 	cbnz	w3, 3a30 <shellShowVar+0x260>
    return shell->write((char*)string, count);
    3a44:	d63f0080 	blr	x4
    SHELL_ASSERT(shell->write, return 0);
    3a48:	f9406282 	ldr	x2, [x20, #192]
    3a4c:	b4fffcc2 	cbz	x2, 39e4 <shellShowVar+0x214>
    return shell->write((char*)string, count);
    3a50:	aa1503e0 	mov	x0, x21
    3a54:	52800021 	mov	w1, #0x1                   	// #1
    3a58:	d63f0040 	blr	x2
    3a5c:	17ffffd3 	b	39a8 <shellShowVar+0x1d8>
    unsigned short count = 0;
    3a60:	52800001 	mov	w1, #0x0                   	// #0
    3a64:	17ffff9d 	b	38d8 <shellShowVar+0x108>
    3a68:	52800001 	mov	w1, #0x0                   	// #0
    3a6c:	17ffffcd 	b	39a0 <shellShowVar+0x1d0>
    3a70:	52800001 	mov	w1, #0x0                   	// #0
    3a74:	17ffff73 	b	3840 <shellShowVar+0x70>
    3a78:	52800001 	mov	w1, #0x0                   	// #0
    3a7c:	17fffff2 	b	3a44 <shellShowVar+0x274>

0000000000003a80 <shellSetVarValue>:
{
    3a80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3a84:	910003fd 	mov	x29, sp
    3a88:	a90153f3 	stp	x19, x20, [sp, #16]
    3a8c:	aa0003f4 	mov	x20, x0
    3a90:	aa0103f3 	mov	x19, x1
    if (command->attr.attrs.readOnly) {
    3a94:	b9400020 	ldr	w0, [x1]
    3a98:	37700440 	tbnz	w0, #14, 3b20 <shellSetVarValue+0xa0>
        switch (command->attr.attrs.type) {
    3a9c:	f9400023 	ldr	x3, [x1]
    3aa0:	53082c63 	ubfx	w3, w3, #8, #4
    3aa4:	7100147f 	cmp	w3, #0x5
    3aa8:	540008c0 	b.eq	3bc0 <shellSetVarValue+0x140>  // b.none
    3aac:	54000188 	b.hi	3adc <shellSetVarValue+0x5c>  // b.pmore
    3ab0:	71000c7f 	cmp	w3, #0x3
    3ab4:	54000800 	b.eq	3bb4 <shellSetVarValue+0x134>  // b.none
    3ab8:	7100107f 	cmp	w3, #0x4
    3abc:	54000281 	b.ne	3b0c <shellSetVarValue+0x8c>  // b.any
            *((char*)(command->data.var.value)) = value;
    3ac0:	f9400820 	ldr	x0, [x1, #16]
    3ac4:	39000002 	strb	w2, [x0]
    return shellShowVar(shell, command);
    3ac8:	aa1303e1 	mov	x1, x19
    3acc:	aa1403e0 	mov	x0, x20
}
    3ad0:	a94153f3 	ldp	x19, x20, [sp, #16]
    3ad4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shellShowVar(shell, command);
    3ad8:	17ffff3e 	b	37d0 <shellShowVar>
        switch (command->attr.attrs.type) {
    3adc:	7100187f 	cmp	w3, #0x6
    3ae0:	540004a0 	b.eq	3b74 <shellSetVarValue+0xf4>  // b.none
    3ae4:	71001c7f 	cmp	w3, #0x7
    3ae8:	54ffff01 	b.ne	3ac8 <shellSetVarValue+0x48>  // b.any
            if (((ShellNodeVarAttr*)command->data.var.value)->set) {
    3aec:	f9400820 	ldr	x0, [x1, #16]
    3af0:	f9400803 	ldr	x3, [x0, #16]
    3af4:	b4fffea3 	cbz	x3, 3ac8 <shellSetVarValue+0x48>
                if (((ShellNodeVarAttr*)command->data.var.value)->var) {
    3af8:	f9400000 	ldr	x0, [x0]
    3afc:	b4000800 	cbz	x0, 3bfc <shellSetVarValue+0x17c>
                    func(((ShellNodeVarAttr*)command->data.var.value)->var, value);
    3b00:	2a0203e1 	mov	w1, w2
    3b04:	d63f0060 	blr	x3
    3b08:	17fffff0 	b	3ac8 <shellSetVarValue+0x48>
        switch (command->attr.attrs.type) {
    3b0c:	7100087f 	cmp	w3, #0x2
    3b10:	54fffdc1 	b.ne	3ac8 <shellSetVarValue+0x48>  // b.any
            *((int*)(command->data.var.value)) = value;
    3b14:	f9400820 	ldr	x0, [x1, #16]
    3b18:	b9000002 	str	w2, [x0]
            break;
    3b1c:	17ffffeb 	b	3ac8 <shellSetVarValue+0x48>
    SHELL_ASSERT(shell->write, return 0);
    3b20:	f9406284 	ldr	x4, [x20, #192]
    3b24:	b4fffd24 	cbz	x4, 3ac8 <shellSetVarValue+0x48>
    while (*p++) {
    3b28:	90000063 	adrp	x3, f000 <_fstat_r+0x40>
    3b2c:	91336463 	add	x3, x3, #0xcd9
    3b30:	52800c20 	mov	w0, #0x61                  	// #97
    unsigned short count = 0;
    3b34:	52800002 	mov	w2, #0x0                   	// #0
    3b38:	14000002 	b	3b40 <shellSetVarValue+0xc0>
    while (*p++) {
    3b3c:	39400060 	ldrb	w0, [x3]
        count++;
    3b40:	11000442 	add	w2, w2, #0x1
    while (*p++) {
    3b44:	91000463 	add	x3, x3, #0x1
        count++;
    3b48:	12003c42 	and	w2, w2, #0xffff
    while (*p++) {
    3b4c:	35ffff80 	cbnz	w0, 3b3c <shellSetVarValue+0xbc>
    return shell->write((char*)string, count);
    3b50:	2a0203e1 	mov	w1, w2
    3b54:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3b58:	91336000 	add	x0, x0, #0xcd8
    3b5c:	d63f0080 	blr	x4
    return shellShowVar(shell, command);
    3b60:	aa1303e1 	mov	x1, x19
    3b64:	aa1403e0 	mov	x0, x20
}
    3b68:	a94153f3 	ldp	x19, x20, [sp, #16]
    3b6c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shellShowVar(shell, command);
    3b70:	17ffff18 	b	37d0 <shellShowVar>
    SHELL_ASSERT(shell->write, return 0);
    3b74:	f9406283 	ldr	x3, [x20, #192]
    3b78:	b4fffa83 	cbz	x3, 3ac8 <shellSetVarValue+0x48>
    while (*p++) {
    3b7c:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3b80:	9133e400 	add	x0, x0, #0xcf9
    3b84:	52800c22 	mov	w2, #0x61                  	// #97
    unsigned short count = 0;
    3b88:	52800001 	mov	w1, #0x0                   	// #0
    3b8c:	14000002 	b	3b94 <shellSetVarValue+0x114>
    while (*p++) {
    3b90:	39400002 	ldrb	w2, [x0]
        count++;
    3b94:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3b98:	91000400 	add	x0, x0, #0x1
        count++;
    3b9c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3ba0:	35ffff82 	cbnz	w2, 3b90 <shellSetVarValue+0x110>
    return shell->write((char*)string, count);
    3ba4:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3ba8:	9133e000 	add	x0, x0, #0xcf8
    3bac:	d63f0060 	blr	x3
    3bb0:	17ffffc6 	b	3ac8 <shellSetVarValue+0x48>
            *((short*)(command->data.var.value)) = value;
    3bb4:	f9400820 	ldr	x0, [x1, #16]
    3bb8:	79000002 	strh	w2, [x0]
            break;
    3bbc:	17ffffc3 	b	3ac8 <shellSetVarValue+0x48>
            shellStringCopy(((char*)(command->data.var.value)), (char*)(size_t)value);
    3bc0:	93407c42 	sxtw	x2, w2
    3bc4:	f9400a64 	ldr	x4, [x19, #16]
    while (*(src + count)) {
    3bc8:	39400041 	ldrb	w1, [x2]
    3bcc:	34000141 	cbz	w1, 3bf4 <shellSetVarValue+0x174>
    unsigned short count = 0;
    3bd0:	52800000 	mov	w0, #0x0                   	// #0
    while (*(src + count)) {
    3bd4:	d2800003 	mov	x3, #0x0                   	// #0
        count++;
    3bd8:	11000400 	add	w0, w0, #0x1
        *(dest + count) = *(src + count);
    3bdc:	38236881 	strb	w1, [x4, x3]
    while (*(src + count)) {
    3be0:	92403c03 	and	x3, x0, #0xffff
        count++;
    3be4:	12003c00 	and	w0, w0, #0xffff
    while (*(src + count)) {
    3be8:	38636841 	ldrb	w1, [x2, x3]
    3bec:	35ffff61 	cbnz	w1, 3bd8 <shellSetVarValue+0x158>
    *(dest + count) = 0;
    3bf0:	8b030084 	add	x4, x4, x3
    3bf4:	3900009f 	strb	wzr, [x4]
    return count;
    3bf8:	17ffffb4 	b	3ac8 <shellSetVarValue+0x48>
                    func(value);
    3bfc:	2a0203e0 	mov	w0, w2
    3c00:	d63f0060 	blr	x3
    3c04:	17ffffb1 	b	3ac8 <shellSetVarValue+0x48>
    3c08:	d503201f 	nop
    3c0c:	d503201f 	nop

0000000000003c10 <shellSetVar>:
{
    3c10:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3c14:	d0000064 	adrp	x4, 11000 <__global_locale+0x180>
    3c18:	912de084 	add	x4, x4, #0xb78
    3c1c:	910003fd 	mov	x29, sp
    3c20:	91004083 	add	x3, x4, #0x10
    3c24:	9100e084 	add	x4, x4, #0x38
    3c28:	a90153f3 	stp	x19, x20, [sp, #16]
    3c2c:	aa0003f4 	mov	x20, x0
    3c30:	f90013f5 	str	x21, [sp, #32]
    3c34:	2a0103f5 	mov	w21, w1
        if (shellList[i] && shellList[i]->status.isActive) {
    3c38:	f9400073 	ldr	x19, [x3]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    3c3c:	91002063 	add	x3, x3, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    3c40:	b4000073 	cbz	x19, 3c4c <shellSetVar+0x3c>
    3c44:	3942c265 	ldrb	w5, [x19, #176]
    3c48:	37080105 	tbnz	w5, #1, 3c68 <shellSetVar+0x58>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    3c4c:	eb03009f 	cmp	x4, x3
    3c50:	54ffff41 	b.ne	3c38 <shellSetVar+0x28>  // b.any
}
    3c54:	52800000 	mov	w0, #0x0                   	// #0
    3c58:	a94153f3 	ldp	x19, x20, [sp, #16]
    3c5c:	f94013f5 	ldr	x21, [sp, #32]
    3c60:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3c64:	d65f03c0 	ret
    ShellCommand* command = shellSeekCommand(shell,
    3c68:	f9405262 	ldr	x2, [x19, #160]
    3c6c:	aa1403e1 	mov	x1, x20
    3c70:	aa1303e0 	mov	x0, x19
    3c74:	52800003 	mov	w3, #0x0                   	// #0
    3c78:	97fffe52 	bl	35c0 <shellSeekCommand>
    3c7c:	aa0003e1 	mov	x1, x0
    if (!command) {
    3c80:	b40005c0 	cbz	x0, 3d38 <shellSetVar+0x128>
    if (command->attr.attrs.type < SHELL_TYPE_VAR_INT
    3c84:	f9400023 	ldr	x3, [x1]
    3c88:	d3482c63 	ubfx	x3, x3, #8, #4
        || command->attr.attrs.type > SHELL_TYPE_VAR_NODE) {
    3c8c:	11003863 	add	w3, w3, #0xe
    if (command->attr.attrs.type < SHELL_TYPE_VAR_INT
    3c90:	12000c63 	and	w3, w3, #0xf
    3c94:	7100147f 	cmp	w3, #0x5
    3c98:	540000e8 	b.hi	3cb4 <shellSetVar+0xa4>  // b.pmore
    return shellSetVarValue(shell, command, value);
    3c9c:	2a1503e2 	mov	w2, w21
    3ca0:	aa1303e0 	mov	x0, x19
}
    3ca4:	a94153f3 	ldp	x19, x20, [sp, #16]
    3ca8:	f94013f5 	ldr	x21, [sp, #32]
    3cac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    return shellSetVarValue(shell, command, value);
    3cb0:	17ffff74 	b	3a80 <shellSetVarValue>
    SHELL_ASSERT(shell->write, return 0);
    3cb4:	f9406264 	ldr	x4, [x19, #192]
    3cb8:	b4fffce4 	cbz	x4, 3c54 <shellSetVar+0x44>
    while (*p++) {
    3cbc:	aa1403e2 	mov	x2, x20
    3cc0:	38401440 	ldrb	w0, [x2], #1
    3cc4:	340005a0 	cbz	w0, 3d78 <shellSetVar+0x168>
    3cc8:	52800023 	mov	w3, #0x1                   	// #1
    3ccc:	4b020063 	sub	w3, w3, w2
        count++;
    3cd0:	0b020061 	add	w1, w3, w2
    while (*p++) {
    3cd4:	38401440 	ldrb	w0, [x2], #1
    3cd8:	12003c21 	and	w1, w1, #0xffff
    3cdc:	35ffffa0 	cbnz	w0, 3cd0 <shellSetVar+0xc0>
    return shell->write((char*)string, count);
    3ce0:	aa1403e0 	mov	x0, x20
    3ce4:	d63f0080 	blr	x4
    SHELL_ASSERT(shell->write, return 0);
    3ce8:	f9406263 	ldr	x3, [x19, #192]
    3cec:	b4fffb43 	cbz	x3, 3c54 <shellSetVar+0x44>
    while (*p++) {
    3cf0:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3cf4:	91348400 	add	x0, x0, #0xd21
    3cf8:	52800d22 	mov	w2, #0x69                  	// #105
    unsigned short count = 0;
    3cfc:	52800001 	mov	w1, #0x0                   	// #0
    3d00:	14000002 	b	3d08 <shellSetVar+0xf8>
    while (*p++) {
    3d04:	39400002 	ldrb	w2, [x0]
        count++;
    3d08:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3d0c:	91000400 	add	x0, x0, #0x1
        count++;
    3d10:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3d14:	35ffff82 	cbnz	w2, 3d04 <shellSetVar+0xf4>
    return shell->write((char*)string, count);
    3d18:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3d1c:	91348000 	add	x0, x0, #0xd20
    3d20:	d63f0060 	blr	x3
}
    3d24:	52800000 	mov	w0, #0x0                   	// #0
    3d28:	a94153f3 	ldp	x19, x20, [sp, #16]
    3d2c:	f94013f5 	ldr	x21, [sp, #32]
    3d30:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3d34:	d65f03c0 	ret
    SHELL_ASSERT(shell->write, return 0);
    3d38:	f9406263 	ldr	x3, [x19, #192]
    3d3c:	b4fff8c3 	cbz	x3, 3c54 <shellSetVar+0x44>
    while (*p++) {
    3d40:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3d44:	91344400 	add	x0, x0, #0xd11
    3d48:	52800c22 	mov	w2, #0x61                  	// #97
    unsigned short count = 0;
    3d4c:	52800001 	mov	w1, #0x0                   	// #0
    3d50:	14000002 	b	3d58 <shellSetVar+0x148>
    while (*p++) {
    3d54:	39400002 	ldrb	w2, [x0]
        count++;
    3d58:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3d5c:	91000400 	add	x0, x0, #0x1
        count++;
    3d60:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3d64:	35ffff82 	cbnz	w2, 3d54 <shellSetVar+0x144>
    return shell->write((char*)string, count);
    3d68:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3d6c:	91344000 	add	x0, x0, #0xd10
    3d70:	d63f0060 	blr	x3
    3d74:	17ffffb8 	b	3c54 <shellSetVar+0x44>
    unsigned short count = 0;
    3d78:	52800001 	mov	w1, #0x0                   	// #0
    3d7c:	17ffffd9 	b	3ce0 <shellSetVar+0xd0>

0000000000003d80 <shellSetUser>:
{
    3d80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3d84:	910003fd 	mov	x29, sp
    3d88:	a90153f3 	stp	x19, x20, [sp, #16]
    3d8c:	aa0003f3 	mov	x19, x0
    shell->info.user = user;
    3d90:	f9000001 	str	x1, [x0]
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    3d94:	f9400820 	ldr	x0, [x1, #16]
        : 1;
    3d98:	b4000080 	cbz	x0, 3da8 <shellSetUser+0x28>
    3d9c:	aa0103f4 	mov	x20, x1
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    3da0:	94000fc8 	bl	7cc0 <strlen>
    3da4:	b5000100 	cbnz	x0, 3dc4 <shellSetUser+0x44>
{
    3da8:	52800021 	mov	w1, #0x1                   	// #1
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    3dac:	3942c260 	ldrb	w0, [x19, #176]
    3db0:	33000020 	bfxil	w0, w1, #0, #1
    3db4:	3902c260 	strb	w0, [x19, #176]
}
    3db8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3dbc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3dc0:	d65f03c0 	ret
        : 1;
    3dc4:	7940d660 	ldrh	w0, [x19, #106]
    3dc8:	52800001 	mov	w1, #0x0                   	// #0
    3dcc:	7100041f 	cmp	w0, #0x1
    3dd0:	54fffee9 	b.ls	3dac <shellSetUser+0x2c>  // b.plast
                                      || strcmp(user->data.user.password, shell->parser.param[1]) != 0))
    3dd4:	f9400a80 	ldr	x0, [x20, #16]
    3dd8:	f9401a61 	ldr	x1, [x19, #48]
    3ddc:	94000f79 	bl	7bc0 <strcmp>
    3de0:	7100001f 	cmp	w0, #0x0
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    3de4:	3942c260 	ldrb	w0, [x19, #176]
                                      || strcmp(user->data.user.password, shell->parser.param[1]) != 0))
    3de8:	1a9f17e1 	cset	w1, eq  // eq = none
    shell->status.isChecked = ((user->data.user.password && strlen(user->data.user.password) != 0)
    3dec:	33000020 	bfxil	w0, w1, #0, #1
    3df0:	3902c260 	strb	w0, [x19, #176]
}
    3df4:	a94153f3 	ldp	x19, x20, [sp, #16]
    3df8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3dfc:	d65f03c0 	ret

0000000000003e00 <shellInit>:
{
    3e00:	12003c42 	and	w2, w2, #0xffff
    shell->parser.bufferSize = size / (SHELL_HISTORY_MAX_NUMBER + 1);
    3e04:	52955564 	mov	w4, #0xaaab                	// #43691
    3e08:	72b55544 	movk	w4, #0xaaaa, lsl #16
{
    3e0c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3e10:	91026005 	add	x5, x0, #0x98
    shell->parser.bufferSize = size / (SHELL_HISTORY_MAX_NUMBER + 1);
    3e14:	9ba47c44 	umull	x4, w2, w4
{
    3e18:	910003fd 	mov	x29, sp
    3e1c:	9101c002 	add	x2, x0, #0x70
    3e20:	f9000bf3 	str	x19, [sp, #16]
    3e24:	aa0003f3 	mov	x19, x0
    shell->parser.bufferSize = size / (SHELL_HISTORY_MAX_NUMBER + 1);
    3e28:	d362fc84 	lsr	x4, x4, #34
    shell->status.isChecked = 1;
    3e2c:	3942c006 	ldrb	w6, [x0, #176]
    3e30:	92403c83 	and	x3, x4, #0xffff
    3e34:	8b030020 	add	x0, x1, x3
    shell->info.user = NULL;
    3e38:	f900027f 	str	xzr, [x19]
    shell->status.isChecked = 1;
    3e3c:	320000c6 	orr	w6, w6, #0x1
    shell->parser.length = 0;
    3e40:	b9001a7f 	str	wzr, [x19, #24]
    shell->parser.buffer = buffer;
    3e44:	f9001261 	str	x1, [x19, #32]
    shell->parser.bufferSize = size / (SHELL_HISTORY_MAX_NUMBER + 1);
    3e48:	7900d264 	strh	w4, [x19, #104]
    shell->history.number = 0;
    3e4c:	b9009a7f 	str	wzr, [x19, #152]
    shell->history.offset = 0;
    3e50:	79013a7f 	strh	wzr, [x19, #156]
    shell->status.isChecked = 1;
    3e54:	3902c266 	strb	w6, [x19, #176]
        shell->history.item[i] = buffer + shell->parser.bufferSize * (i + 1);
    3e58:	f8008440 	str	x0, [x2], #8
    for (short i = 0; i < SHELL_HISTORY_MAX_NUMBER; i++) {
    3e5c:	8b030000 	add	x0, x0, x3
    3e60:	eb05005f 	cmp	x2, x5
    3e64:	54ffffa1 	b.ne	3e58 <shellInit+0x58>  // b.any
    shell->commandList.base = (ShellCommand*)shellCommandList;
    3e68:	d0000060 	adrp	x0, 11000 <__global_locale+0x180>
    3e6c:	912de000 	add	x0, x0, #0xb78
    shell->commandList.count = shellCommandCount;
    3e70:	90000061 	adrp	x1, f000 <_fstat_r+0x40>
    3e74:	79506023 	ldrh	w3, [x1, #2096]
        if (shellList[i] == NULL) {
    3e78:	91004000 	add	x0, x0, #0x10
    shell->commandList.base = (ShellCommand*)shellCommandList;
    3e7c:	90000062 	adrp	x2, f000 <_fstat_r+0x40>
    3e80:	9120e042 	add	x2, x2, #0x838
    shell->commandList.count = shellCommandCount;
    3e84:	d2800001 	mov	x1, #0x0                   	// #0
    shell->commandList.base = (ShellCommand*)shellCommandList;
    3e88:	f9005262 	str	x2, [x19, #160]
    shell->commandList.count = shellCommandCount;
    3e8c:	79015263 	strh	w3, [x19, #168]
        if (shellList[i] == NULL) {
    3e90:	f8617803 	ldr	x3, [x0, x1, lsl #3]
    3e94:	2a0103e4 	mov	w4, w1
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    3e98:	91000421 	add	x1, x1, #0x1
    3e9c:	f100143f 	cmp	x1, #0x5
        if (shellList[i] == NULL) {
    3ea0:	b4000443 	cbz	x3, 3f28 <shellInit+0x128>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    3ea4:	54ffff61 	b.ne	3e90 <shellInit+0x90>  // b.any
    shellSetUser(shell, shellSeekCommand(shell, SHELL_DEFAULT_USER, shell->commandList.base, 0));
    3ea8:	52800003 	mov	w3, #0x0                   	// #0
    3eac:	aa1303e0 	mov	x0, x19
    3eb0:	90000061 	adrp	x1, f000 <_fstat_r+0x40>
    3eb4:	91172021 	add	x1, x1, #0x5c8
    3eb8:	97fffdc2 	bl	35c0 <shellSeekCommand>
    3ebc:	aa0003e1 	mov	x1, x0
    3ec0:	aa1303e0 	mov	x0, x19
    3ec4:	97ffffaf 	bl	3d80 <shellSetUser>
    if (shell->status.isChecked) {
    3ec8:	3942c260 	ldrb	w0, [x19, #176]
    3ecc:	360000a0 	tbz	w0, #0, 3ee0 <shellInit+0xe0>
    3ed0:	aa1303e0 	mov	x0, x19
}
    3ed4:	f9400bf3 	ldr	x19, [sp, #16]
    3ed8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3edc:	17fff899 	b	2140 <shellWritePrompt.part.0.constprop.0>
    SHELL_ASSERT(shell->write, return 0);
    3ee0:	f9406263 	ldr	x3, [x19, #192]
    3ee4:	b4000263 	cbz	x3, 3f30 <shellInit+0x130>
    while (*p++) {
    3ee8:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3eec:	9132c400 	add	x0, x0, #0xcb1
    3ef0:	52800d82 	mov	w2, #0x6c                  	// #108
    unsigned short count = 0;
    3ef4:	52800001 	mov	w1, #0x0                   	// #0
    3ef8:	14000002 	b	3f00 <shellInit+0x100>
    while (*p++) {
    3efc:	39400002 	ldrb	w2, [x0]
        count++;
    3f00:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    3f04:	91000400 	add	x0, x0, #0x1
        count++;
    3f08:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    3f0c:	35ffff82 	cbnz	w2, 3efc <shellInit+0xfc>
}
    3f10:	f9400bf3 	ldr	x19, [sp, #16]
    return shell->write((char*)string, count);
    3f14:	aa0303f0 	mov	x16, x3
}
    3f18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shell->write((char*)string, count);
    3f1c:	90000060 	adrp	x0, f000 <_fstat_r+0x40>
    3f20:	9132c000 	add	x0, x0, #0xcb0
    3f24:	d61f0200 	br	x16
            shellList[i] = shell;
    3f28:	f824d813 	str	x19, [x0, w4, sxtw #3]
            return;
    3f2c:	17ffffdf 	b	3ea8 <shellInit+0xa8>
}
    3f30:	f9400bf3 	ldr	x19, [sp, #16]
    3f34:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3f38:	d65f03c0 	ret
    3f3c:	d503201f 	nop

0000000000003f40 <shellRunCommand>:
{
    3f40:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3f44:	910003fd 	mov	x29, sp
    3f48:	a90153f3 	stp	x19, x20, [sp, #16]
    3f4c:	aa0003f3 	mov	x19, x0
    3f50:	a9025bf5 	stp	x21, x22, [sp, #32]
    3f54:	aa0103f5 	mov	x21, x1
    shell->status.isActive = 1;
    3f58:	3942c002 	ldrb	w2, [x0, #176]
    3f5c:	321f0042 	orr	w2, w2, #0x2
    3f60:	3902c002 	strb	w2, [x0, #176]
    if (command->attr.attrs.type == SHELL_TYPE_CMD_MAIN) {
    3f64:	b9400023 	ldr	w3, [x1]
    3f68:	72180c63 	ands	w3, w3, #0xf00
    3f6c:	54000260 	b.eq	3fb8 <shellRunCommand+0x78>  // b.none
    } else if (command->attr.attrs.type == SHELL_TYPE_CMD_FUNC) {
    3f70:	7104007f 	cmp	w3, #0x100
    3f74:	54000860 	b.eq	4080 <shellRunCommand+0x140>  // b.none
    } else if (command->attr.attrs.type >= SHELL_TYPE_VAR_INT
    3f78:	f9400024 	ldr	x4, [x1]
    3f7c:	d3482c84 	ubfx	x4, x4, #8, #4
        && command->attr.attrs.type <= SHELL_TYPE_VAR_NODE) {
    3f80:	11003884 	add	w4, w4, #0xe
    } else if (command->attr.attrs.type >= SHELL_TYPE_VAR_INT
    3f84:	12000c84 	and	w4, w4, #0xf
    3f88:	7100149f 	cmp	w4, #0x5
    3f8c:	54000669 	b.ls	4058 <shellRunCommand+0x118>  // b.plast
    } else if (command->attr.attrs.type == SHELL_TYPE_USER) {
    3f90:	7120007f 	cmp	w3, #0x800
    3f94:	52800014 	mov	w20, #0x0                   	// #0
    3f98:	54000960 	b.eq	40c4 <shellRunCommand+0x184>  // b.none
    shell->status.isActive = 0;
    3f9c:	121e7842 	and	w2, w2, #0xfffffffd
    3fa0:	3902c262 	strb	w2, [x19, #176]
}
    3fa4:	2a1403e0 	mov	w0, w20
    3fa8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3fac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3fb0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3fb4:	d65f03c0 	ret
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    3fb8:	7940d400 	ldrh	w0, [x0, #106]
    3fbc:	340008a0 	cbz	w0, 40d0 <shellRunCommand+0x190>
    3fc0:	52800016 	mov	w22, #0x0                   	// #0
    3fc4:	d503201f 	nop
        paramLength = strlen(shell->parser.param[i]);
    3fc8:	8b362e74 	add	x20, x19, w22, uxth #3
        if (shell->parser.param[i][0] == '\"') {
    3fcc:	f9401680 	ldr	x0, [x20, #40]
    3fd0:	39400001 	ldrb	w1, [x0]
    3fd4:	7100883f 	cmp	w1, #0x22
    3fd8:	540000a1 	b.ne	3fec <shellRunCommand+0xac>  // b.any
            shell->parser.param[i][0] = 0;
    3fdc:	3900001f 	strb	wzr, [x0]
            shell->parser.param[i] = &shell->parser.param[i][1];
    3fe0:	f9401680 	ldr	x0, [x20, #40]
    3fe4:	91000400 	add	x0, x0, #0x1
    3fe8:	f9001680 	str	x0, [x20, #40]
        paramLength = strlen(shell->parser.param[i]);
    3fec:	94000f35 	bl	7cc0 <strlen>
        if (shell->parser.param[i][paramLength - 1] == '\"') {
    3ff0:	92403c02 	and	x2, x0, #0xffff
    3ff4:	f9401680 	ldr	x0, [x20, #40]
    3ff8:	d1000442 	sub	x2, x2, #0x1
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    3ffc:	110006c1 	add	w1, w22, #0x1
    4000:	12003c36 	and	w22, w1, #0xffff
        if (shell->parser.param[i][paramLength - 1] == '\"') {
    4004:	38626803 	ldrb	w3, [x0, x2]
    4008:	7100887f 	cmp	w3, #0x22
    400c:	54000041 	b.ne	4014 <shellRunCommand+0xd4>  // b.any
            shell->parser.param[i][paramLength - 1] = 0;
    4010:	3822681f 	strb	wzr, [x0, x2]
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    4014:	7940d660 	ldrh	w0, [x19, #106]
    4018:	6b21201f 	cmp	w0, w1, uxth
    401c:	54fffd68 	b.hi	3fc8 <shellRunCommand+0x88>  // b.pmore
        returnValue = func(shell->parser.paramCount, shell->parser.param);
    4020:	f9400aa2 	ldr	x2, [x21, #16]
    4024:	9100a261 	add	x1, x19, #0x28
    4028:	d63f0040 	blr	x2
        if (!command->attr.attrs.disableReturn) {
    402c:	b94002a1 	ldr	w1, [x21]
    4030:	36680321 	tbz	w1, #13, 4094 <shellRunCommand+0x154>
    4034:	3942c262 	ldrb	w2, [x19, #176]
    return returnValue;
    4038:	2a0003f4 	mov	w20, w0
}
    403c:	2a1403e0 	mov	w0, w20
    shell->status.isActive = 0;
    4040:	121e7842 	and	w2, w2, #0xfffffffd
    4044:	3902c262 	strb	w2, [x19, #176]
}
    4048:	a94153f3 	ldp	x19, x20, [sp, #16]
    404c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4050:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4054:	d65f03c0 	ret
        shellShowVar(shell, command);
    4058:	97fffdde 	bl	37d0 <shellShowVar>
    405c:	52800014 	mov	w20, #0x0                   	// #0
    4060:	3942c262 	ldrb	w2, [x19, #176]
}
    4064:	2a1403e0 	mov	w0, w20
    shell->status.isActive = 0;
    4068:	121e7842 	and	w2, w2, #0xfffffffd
    406c:	3902c262 	strb	w2, [x19, #176]
}
    4070:	a94153f3 	ldp	x19, x20, [sp, #16]
    4074:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4078:	a8c37bfd 	ldp	x29, x30, [sp], #48
    407c:	d65f03c0 	ret
        returnValue = shellExtRun(shell,
    4080:	7940d402 	ldrh	w2, [x0, #106]
    4084:	9100a003 	add	x3, x0, #0x28
    4088:	94000526 	bl	5520 <shellExtRun>
        if (!command->attr.attrs.disableReturn) {
    408c:	b94002a1 	ldr	w1, [x21]
    4090:	376ffd21 	tbnz	w1, #13, 4034 <shellRunCommand+0xf4>
            shellWriteReturnValue(shell, returnValue);
    4094:	2a0003e1 	mov	w1, w0
    return returnValue;
    4098:	2a0003f4 	mov	w20, w0
            shellWriteReturnValue(shell, returnValue);
    409c:	aa1303e0 	mov	x0, x19
    40a0:	97fff908 	bl	24c0 <shellWriteReturnValue>
    40a4:	3942c262 	ldrb	w2, [x19, #176]
}
    40a8:	2a1403e0 	mov	w0, w20
    shell->status.isActive = 0;
    40ac:	121e7842 	and	w2, w2, #0xfffffffd
    40b0:	3902c262 	strb	w2, [x19, #176]
}
    40b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    40b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    40bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    40c0:	d65f03c0 	ret
        shellSetUser(shell, command);
    40c4:	97ffff2f 	bl	3d80 <shellSetUser>
    40c8:	3942c262 	ldrb	w2, [x19, #176]
    40cc:	17ffffb4 	b	3f9c <shellRunCommand+0x5c>
    for (unsigned short i = 0; i < shell->parser.paramCount; i++) {
    40d0:	52800000 	mov	w0, #0x0                   	// #0
    40d4:	17ffffd3 	b	4020 <shellRunCommand+0xe0>
    40d8:	d503201f 	nop
    40dc:	d503201f 	nop

00000000000040e0 <shellNormalInput>:
    shell->status.tabFlag = 0;
    40e0:	3942c003 	ldrb	w3, [x0, #176]
    40e4:	121d7863 	and	w3, w3, #0xfffffffb
    40e8:	3902c003 	strb	w3, [x0, #176]
    shellInsertByte(shell, data);
    40ec:	17fffb99 	b	2f50 <shellInsertByte>

00000000000040f0 <shellExec>:
{
    40f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    40f4:	910003fd 	mov	x29, sp
    40f8:	a90153f3 	stp	x19, x20, [sp, #16]
    40fc:	aa0003f3 	mov	x19, x0
    if (shell->parser.length == 0) {
    4100:	79403000 	ldrh	w0, [x0, #24]
    4104:	340001e0 	cbz	w0, 4140 <shellExec+0x50>
    shell->parser.buffer[shell->parser.length] = 0;
    4108:	f9401261 	ldr	x1, [x19, #32]
    410c:	92403c00 	and	x0, x0, #0xffff
    4110:	3820683f 	strb	wzr, [x1, x0]
    if (shell->status.isChecked) {
    4114:	3942c260 	ldrb	w0, [x19, #176]
    4118:	370001a0 	tbnz	w0, #0, 414c <shellExec+0x5c>
    if (strcmp(shell->parser.buffer, shell->info.user->data.user.password) == 0) {
    411c:	f9400261 	ldr	x1, [x19]
    4120:	f9401260 	ldr	x0, [x19, #32]
    4124:	f9400821 	ldr	x1, [x1, #16]
    4128:	94000ea6 	bl	7bc0 <strcmp>
    412c:	35000b80 	cbnz	w0, 429c <shellExec+0x1ac>
        shell->status.isChecked = 1;
    4130:	3942c260 	ldrb	w0, [x19, #176]
    4134:	32000000 	orr	w0, w0, #0x1
    4138:	3902c260 	strb	w0, [x19, #176]
    shell->parser.length = 0;
    413c:	b9001a7f 	str	wzr, [x19, #24]
}
    4140:	a94153f3 	ldp	x19, x20, [sp, #16]
    4144:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4148:	d65f03c0 	ret
    if (shell->history.number > 0
    414c:	79413260 	ldrh	w0, [x19, #152]
    shell->history.offset = 0;
    4150:	79013a7f 	strh	wzr, [x19, #156]
    if (shell->history.number > 0
    4154:	34000600 	cbz	w0, 4214 <shellExec+0x124>
        && strcmp(shell->history.item[(shell->history.record == 0 ? SHELL_HISTORY_MAX_NUMBER : shell->history.record) - 1],
    4158:	79413660 	ldrh	w0, [x19, #154]
    415c:	52800082 	mov	w2, #0x4                   	// #4
    4160:	f9401261 	ldr	x1, [x19, #32]
    4164:	7100001f 	cmp	w0, #0x0
    4168:	51000400 	sub	w0, w0, #0x1
    416c:	1a821000 	csel	w0, w0, w2, ne  // ne = any
    4170:	8b20ce60 	add	x0, x19, w0, sxtw #3
    4174:	f9403800 	ldr	x0, [x0, #112]
    4178:	94000e92 	bl	7bc0 <strcmp>
    417c:	350004c0 	cbnz	w0, 4214 <shellExec+0x124>
    shell->parser.paramCount = shellSplit(shell->parser.buffer, shell->parser.length,
    4180:	79403261 	ldrh	w1, [x19, #24]
        shell->parser.param, ' ', SHELL_PARAMETER_MAX_NUMBER);
    4184:	9100a274 	add	x20, x19, #0x28
    shell->parser.paramCount = shellSplit(shell->parser.buffer, shell->parser.length,
    4188:	f9401260 	ldr	x0, [x19, #32]
    418c:	aa1403e2 	mov	x2, x20
    4190:	52800104 	mov	w4, #0x8                   	// #8
    4194:	52800403 	mov	w3, #0x20                  	// #32
    4198:	97fffc9e 	bl	3410 <shellSplit>
    419c:	12003c00 	and	w0, w0, #0xffff
        shell->parser.length = shell->parser.cursor = 0;
    41a0:	b9001a7f 	str	wzr, [x19, #24]
    shell->parser.paramCount = shellSplit(shell->parser.buffer, shell->parser.length,
    41a4:	7900d660 	strh	w0, [x19, #106]
        if (shell->parser.paramCount == 0) {
    41a8:	34fffcc0 	cbz	w0, 4140 <shellExec+0x50>
    SHELL_ASSERT(shell->write, return 0);
    41ac:	f9406263 	ldr	x3, [x19, #192]
    41b0:	b40001c3 	cbz	x3, 41e8 <shellExec+0xf8>
    while (*p++) {
    41b4:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    41b8:	91356400 	add	x0, x0, #0xd59
    41bc:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    41c0:	52800001 	mov	w1, #0x0                   	// #0
    41c4:	14000002 	b	41cc <shellExec+0xdc>
    while (*p++) {
    41c8:	39400002 	ldrb	w2, [x0]
        count++;
    41cc:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    41d0:	91000400 	add	x0, x0, #0x1
        count++;
    41d4:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    41d8:	35ffff82 	cbnz	w2, 41c8 <shellExec+0xd8>
    return shell->write((char*)string, count);
    41dc:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    41e0:	91356000 	add	x0, x0, #0xd58
    41e4:	d63f0060 	blr	x3
        ShellCommand* command = shellSeekCommand(shell,
    41e8:	f9401661 	ldr	x1, [x19, #40]
    41ec:	aa1303e0 	mov	x0, x19
    41f0:	f9405262 	ldr	x2, [x19, #160]
    41f4:	52800003 	mov	w3, #0x0                   	// #0
    41f8:	97fffcf2 	bl	35c0 <shellSeekCommand>
    41fc:	aa0003e1 	mov	x1, x0
        if (command != NULL) {
    4200:	b4000700 	cbz	x0, 42e0 <shellExec+0x1f0>
            shellRunCommand(shell, command);
    4204:	aa1303e0 	mov	x0, x19
}
    4208:	a94153f3 	ldp	x19, x20, [sp, #16]
    420c:	a8c37bfd 	ldp	x29, x30, [sp], #48
            shellRunCommand(shell, command);
    4210:	17ffff4c 	b	3f40 <shellRunCommand>
    if (shellStringCopy(shell->history.item[shell->history.record],
    4214:	f9401263 	ldr	x3, [x19, #32]
    unsigned short count = 0;
    4218:	52800000 	mov	w0, #0x0                   	// #0
    if (shellStringCopy(shell->history.item[shell->history.record],
    421c:	79413664 	ldrh	w4, [x19, #154]
    while (*(src + count)) {
    4220:	d2800002 	mov	x2, #0x0                   	// #0
    4224:	39400061 	ldrb	w1, [x3]
    if (shellStringCopy(shell->history.item[shell->history.record],
    4228:	91003884 	add	x4, x4, #0xe
    422c:	f8647a64 	ldr	x4, [x19, x4, lsl #3]
    while (*(src + count)) {
    4230:	34000941 	cbz	w1, 4358 <shellExec+0x268>
    4234:	d503201f 	nop
        count++;
    4238:	11000400 	add	w0, w0, #0x1
        *(dest + count) = *(src + count);
    423c:	38226881 	strb	w1, [x4, x2]
    while (*(src + count)) {
    4240:	92403c02 	and	x2, x0, #0xffff
        count++;
    4244:	12003c00 	and	w0, w0, #0xffff
    while (*(src + count)) {
    4248:	38626861 	ldrb	w1, [x3, x2]
    424c:	35ffff61 	cbnz	w1, 4238 <shellExec+0x148>
    *(dest + count) = 0;
    4250:	3822689f 	strb	wzr, [x4, x2]
    if (shellStringCopy(shell->history.item[shell->history.record],
    4254:	34000200 	cbz	w0, 4294 <shellExec+0x1a4>
        shell->history.record++;
    4258:	79413661 	ldrh	w1, [x19, #154]
    425c:	11000421 	add	w1, w1, #0x1
    4260:	12003c21 	and	w1, w1, #0xffff
    4264:	79013661 	strh	w1, [x19, #154]
    if (++shell->history.number > SHELL_HISTORY_MAX_NUMBER) {
    4268:	79413260 	ldrh	w0, [x19, #152]
    426c:	528000a2 	mov	w2, #0x5                   	// #5
    4270:	11000400 	add	w0, w0, #0x1
    4274:	12003c00 	and	w0, w0, #0xffff
    4278:	7100181f 	cmp	w0, #0x6
    427c:	1a823000 	csel	w0, w0, w2, cc  // cc = lo, ul, last
    4280:	79013260 	strh	w0, [x19, #152]
    if (shell->history.record >= SHELL_HISTORY_MAX_NUMBER) {
    4284:	7100103f 	cmp	w1, #0x4
    4288:	54fff7c9 	b.ls	4180 <shellExec+0x90>  // b.plast
        shell->history.record = 0;
    428c:	7901367f 	strh	wzr, [x19, #154]
    4290:	17ffffbc 	b	4180 <shellExec+0x90>
    if (shell->history.record >= SHELL_HISTORY_MAX_NUMBER) {
    4294:	79413661 	ldrh	w1, [x19, #154]
    4298:	17fffff4 	b	4268 <shellExec+0x178>
    SHELL_ASSERT(shell->write, return 0);
    429c:	f9406263 	ldr	x3, [x19, #192]
    42a0:	b4fff4e3 	cbz	x3, 413c <shellExec+0x4c>
    while (*p++) {
    42a4:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    42a8:	91352400 	add	x0, x0, #0xd49
    42ac:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    42b0:	52800001 	mov	w1, #0x0                   	// #0
    42b4:	14000002 	b	42bc <shellExec+0x1cc>
    while (*p++) {
    42b8:	39400002 	ldrb	w2, [x0]
        count++;
    42bc:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    42c0:	91000400 	add	x0, x0, #0x1
        count++;
    42c4:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    42c8:	35ffff82 	cbnz	w2, 42b8 <shellExec+0x1c8>
    return shell->write((char*)string, count);
    42cc:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    42d0:	91352000 	add	x0, x0, #0xd48
    42d4:	d63f0060 	blr	x3
    shell->parser.length = 0;
    42d8:	b9001a7f 	str	wzr, [x19, #24]
    42dc:	17ffff99 	b	4140 <shellExec+0x50>
            shell->parser.param[paramNum] = 0;
    42e0:	a9025bf5 	stp	x21, x22, [sp, #32]
            int paramNum = shell->parser.paramCount > SHELL_PARAMETER_MAX_NUMBER ? SHELL_PARAMETER_MAX_NUMBER : shell->parser.paramCount;
    42e4:	52800102 	mov	w2, #0x8                   	// #8
            fd = open(&session_fs, shell->parser.param[0]);
    42e8:	b0000075 	adrp	x21, 11000 <__global_locale+0x180>
    42ec:	912d62b5 	add	x21, x21, #0xb58
            int paramNum = shell->parser.paramCount > SHELL_PARAMETER_MAX_NUMBER ? SHELL_PARAMETER_MAX_NUMBER : shell->parser.paramCount;
    42f0:	7940d661 	ldrh	w1, [x19, #106]
            fd = open(&session_fs, shell->parser.param[0]);
    42f4:	aa1503e0 	mov	x0, x21
            int paramNum = shell->parser.paramCount > SHELL_PARAMETER_MAX_NUMBER ? SHELL_PARAMETER_MAX_NUMBER : shell->parser.paramCount;
    42f8:	7100203f 	cmp	w1, #0x8
    42fc:	1a829021 	csel	w1, w1, w2, ls  // ls = plast
            shell->parser.param[paramNum] = 0;
    4300:	8b212e61 	add	x1, x19, w1, uxth #3
    4304:	f900143f 	str	xzr, [x1, #40]
            fd = open(&session_fs, shell->parser.param[0]);
    4308:	f9401661 	ldr	x1, [x19, #40]
    430c:	9400063d 	bl	5c00 <open>
    4310:	2a0003f6 	mov	w22, w0
            if (fd < 0) {
    4314:	37f80280 	tbnz	w0, #31, 4364 <shellExec+0x274>
                if (spawn(&session_fs, fd, read, fsize, shell->parser.param[0], shell->parser.param) < 0) {
    4318:	f9401664 	ldr	x4, [x19, #40]
    431c:	2a0003e1 	mov	w1, w0
    4320:	d0000003 	adrp	x3, 6000 <write+0xb0>
    4324:	b0000002 	adrp	x2, 5000 <shellClear+0x20>
    4328:	aa1403e5 	mov	x5, x20
    432c:	91030063 	add	x3, x3, #0xc0
    4330:	91378042 	add	x2, x2, #0xde0
    4334:	aa1503e0 	mov	x0, x21
    4338:	94000976 	bl	6910 <spawn>
    433c:	37f803a0 	tbnz	w0, #31, 43b0 <shellExec+0x2c0>
                close(&session_fs, fd);
    4340:	2a1603e1 	mov	w1, w22
    4344:	aa1503e0 	mov	x0, x21
}
    4348:	a94153f3 	ldp	x19, x20, [sp, #16]
                close(&session_fs, fd);
    434c:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
    4350:	a8c37bfd 	ldp	x29, x30, [sp], #48
                close(&session_fs, fd);
    4354:	1400066b 	b	5d00 <close>
    *(dest + count) = 0;
    4358:	3900009f 	strb	wzr, [x4]
    if (shell->history.record >= SHELL_HISTORY_MAX_NUMBER) {
    435c:	79413661 	ldrh	w1, [x19, #154]
    4360:	17ffffc2 	b	4268 <shellExec+0x178>
    SHELL_ASSERT(shell->write, return 0);
    4364:	f9406263 	ldr	x3, [x19, #192]
    4368:	b4000443 	cbz	x3, 43f0 <shellExec+0x300>
    while (*p++) {
    436c:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4370:	9134c400 	add	x0, x0, #0xd31
    4374:	52800de2 	mov	w2, #0x6f                  	// #111
    unsigned short count = 0;
    4378:	52800001 	mov	w1, #0x0                   	// #0
    437c:	14000002 	b	4384 <shellExec+0x294>
    while (*p++) {
    4380:	39400002 	ldrb	w2, [x0]
        count++;
    4384:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4388:	91000400 	add	x0, x0, #0x1
        count++;
    438c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4390:	35ffff82 	cbnz	w2, 4380 <shellExec+0x290>
}
    4394:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    4398:	aa0303f0 	mov	x16, x3
    439c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    43a0:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    43a4:	9134c000 	add	x0, x0, #0xd30
}
    43a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    return shell->write((char*)string, count);
    43ac:	d61f0200 	br	x16
    SHELL_ASSERT(shell->write, return 0);
    43b0:	f9406263 	ldr	x3, [x19, #192]
    43b4:	b4fffc63 	cbz	x3, 4340 <shellExec+0x250>
    while (*p++) {
    43b8:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    43bc:	9134c400 	add	x0, x0, #0xd31
    43c0:	52800de2 	mov	w2, #0x6f                  	// #111
    unsigned short count = 0;
    43c4:	52800001 	mov	w1, #0x0                   	// #0
    43c8:	14000002 	b	43d0 <shellExec+0x2e0>
    while (*p++) {
    43cc:	39400002 	ldrb	w2, [x0]
        count++;
    43d0:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    43d4:	91000400 	add	x0, x0, #0x1
        count++;
    43d8:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    43dc:	35ffff82 	cbnz	w2, 43cc <shellExec+0x2dc>
    return shell->write((char*)string, count);
    43e0:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    43e4:	9134c000 	add	x0, x0, #0xd30
    43e8:	d63f0060 	blr	x3
    43ec:	17ffffd5 	b	4340 <shellExec+0x250>
    43f0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    43f4:	17ffff53 	b	4140 <shellExec+0x50>
    43f8:	d503201f 	nop
    43fc:	d503201f 	nop

0000000000004400 <shellUp>:
{
    4400:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4404:	910003fd 	mov	x29, sp
    4408:	f9000bf3 	str	x19, [sp, #16]
    440c:	aa0003f3 	mov	x19, x0
        if (shell->history.offset-- <= -((shell->history.number > shell->history.record) ? shell->history.number : shell->history.record)) {
    4410:	79413002 	ldrh	w2, [x0, #152]
    4414:	79413401 	ldrh	w1, [x0, #154]
    4418:	79c13803 	ldrsh	w3, [x0, #156]
    441c:	6b22203f 	cmp	w1, w2, uxth
    4420:	51000464 	sub	w4, w3, #0x1
    4424:	1a822021 	csel	w1, w1, w2, cs  // cs = hs, nlast
    4428:	12003c22 	and	w2, w1, #0xffff
            shell->history.offset = -((shell->history.number > shell->history.record)
    442c:	4b0103e1 	neg	w1, w1
        if (shell->history.offset-- <= -((shell->history.number > shell->history.record) ? shell->history.number : shell->history.record)) {
    4430:	4b0203e2 	neg	w2, w2
            shell->history.offset = -((shell->history.number > shell->history.record)
    4434:	6b02007f 	cmp	w3, w2
    4438:	1a84d021 	csel	w1, w1, w4, le
    443c:	79013801 	strh	w1, [x0, #156]
    shellClearCommandLine(shell);
    4440:	97fffa94 	bl	2e90 <shellClearCommandLine>
    if (shell->history.offset == 0) {
    4444:	79c13a62 	ldrsh	w2, [x19, #156]
    4448:	350000a2 	cbnz	w2, 445c <shellUp+0x5c>
        shell->parser.cursor = shell->parser.length = 0;
    444c:	b9001a7f 	str	wzr, [x19, #24]
}
    4450:	f9400bf3 	ldr	x19, [sp, #16]
    4454:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4458:	d65f03c0 	ret
                 shell->history.item[(shell->history.record + SHELL_HISTORY_MAX_NUMBER
    445c:	79413660 	ldrh	w0, [x19, #154]
                     % SHELL_HISTORY_MAX_NUMBER]))
    4460:	528ccce1 	mov	w1, #0x6667                	// #26215
    4464:	72acccc1 	movk	w1, #0x6666, lsl #16
                 shell->history.item[(shell->history.record + SHELL_HISTORY_MAX_NUMBER
    4468:	11001400 	add	w0, w0, #0x5
                                         + shell->history.offset)
    446c:	0b020000 	add	w0, w0, w2
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    4470:	f9401264 	ldr	x4, [x19, #32]
                     % SHELL_HISTORY_MAX_NUMBER]))
    4474:	9b217c01 	smull	x1, w0, w1
    4478:	9361fc21 	asr	x1, x1, #33
    447c:	4b807c21 	sub	w1, w1, w0, asr #31
    4480:	0b010821 	add	w1, w1, w1, lsl #2
    4484:	4b010000 	sub	w0, w0, w1
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    4488:	8b20ce60 	add	x0, x19, w0, sxtw #3
    448c:	f9403800 	ldr	x0, [x0, #112]
    while (*(src + count)) {
    4490:	39400002 	ldrb	w2, [x0]
    4494:	340003a2 	cbz	w2, 4508 <shellUp+0x108>
    unsigned short count = 0;
    4498:	52800001 	mov	w1, #0x0                   	// #0
    while (*(src + count)) {
    449c:	d2800003 	mov	x3, #0x0                   	// #0
        count++;
    44a0:	11000421 	add	w1, w1, #0x1
        *(dest + count) = *(src + count);
    44a4:	38236882 	strb	w2, [x4, x3]
    while (*(src + count)) {
    44a8:	92403c23 	and	x3, x1, #0xffff
        count++;
    44ac:	12003c21 	and	w1, w1, #0xffff
    while (*(src + count)) {
    44b0:	38636802 	ldrb	w2, [x0, x3]
    44b4:	35ffff62 	cbnz	w2, 44a0 <shellUp+0xa0>
    *(dest + count) = 0;
    44b8:	3823689f 	strb	wzr, [x4, x3]
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    44bc:	79003261 	strh	w1, [x19, #24]
    44c0:	34fffc81 	cbz	w1, 4450 <shellUp+0x50>
    SHELL_ASSERT(shell->write, return 0);
    44c4:	f9406265 	ldr	x5, [x19, #192]
        shell->parser.cursor = shell->parser.length;
    44c8:	79003661 	strh	w1, [x19, #26]
    SHELL_ASSERT(shell->write, return 0);
    44cc:	b4fffc25 	cbz	x5, 4450 <shellUp+0x50>
        shellWriteString(shell, shell->parser.buffer);
    44d0:	f9401260 	ldr	x0, [x19, #32]
    while (*p++) {
    44d4:	aa0003e2 	mov	x2, x0
    44d8:	38401441 	ldrb	w1, [x2], #1
    44dc:	340001c1 	cbz	w1, 4514 <shellUp+0x114>
    44e0:	52800024 	mov	w4, #0x1                   	// #1
    44e4:	4b020084 	sub	w4, w4, w2
        count++;
    44e8:	0b020081 	add	w1, w4, w2
    while (*p++) {
    44ec:	38401443 	ldrb	w3, [x2], #1
    44f0:	12003c21 	and	w1, w1, #0xffff
    44f4:	35ffffa3 	cbnz	w3, 44e8 <shellUp+0xe8>
}
    44f8:	f9400bf3 	ldr	x19, [sp, #16]
    return shell->write((char*)string, count);
    44fc:	aa0503f0 	mov	x16, x5
}
    4500:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shell->write((char*)string, count);
    4504:	d61f0200 	br	x16
    *(dest + count) = 0;
    4508:	3900009f 	strb	wzr, [x4]
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    450c:	7900327f 	strh	wzr, [x19, #24]
    4510:	17ffffd0 	b	4450 <shellUp+0x50>
    unsigned short count = 0;
    4514:	52800001 	mov	w1, #0x0                   	// #0
    4518:	17fffff8 	b	44f8 <shellUp+0xf8>
    451c:	d503201f 	nop

0000000000004520 <shellDown>:
{
    4520:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4524:	910003fd 	mov	x29, sp
    4528:	f9000bf3 	str	x19, [sp, #16]
    452c:	aa0003f3 	mov	x19, x0
        if (++shell->history.offset > 0) {
    4530:	79413801 	ldrh	w1, [x0, #156]
    4534:	11000421 	add	w1, w1, #0x1
    4538:	13003c21 	sxth	w1, w1
    453c:	79013801 	strh	w1, [x0, #156]
    4540:	7100003f 	cmp	w1, #0x0
    4544:	5400066c 	b.gt	4610 <shellDown+0xf0>
    shellClearCommandLine(shell);
    4548:	97fffa52 	bl	2e90 <shellClearCommandLine>
    if (shell->history.offset == 0) {
    454c:	79c13a62 	ldrsh	w2, [x19, #156]
    4550:	34000582 	cbz	w2, 4600 <shellDown+0xe0>
                 shell->history.item[(shell->history.record + SHELL_HISTORY_MAX_NUMBER
    4554:	79413660 	ldrh	w0, [x19, #154]
                     % SHELL_HISTORY_MAX_NUMBER]))
    4558:	528ccce1 	mov	w1, #0x6667                	// #26215
    455c:	72acccc1 	movk	w1, #0x6666, lsl #16
                 shell->history.item[(shell->history.record + SHELL_HISTORY_MAX_NUMBER
    4560:	11001400 	add	w0, w0, #0x5
                                         + shell->history.offset)
    4564:	0b020000 	add	w0, w0, w2
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    4568:	f9401264 	ldr	x4, [x19, #32]
                     % SHELL_HISTORY_MAX_NUMBER]))
    456c:	9b217c01 	smull	x1, w0, w1
    4570:	9361fc21 	asr	x1, x1, #33
    4574:	4b807c21 	sub	w1, w1, w0, asr #31
    4578:	0b010821 	add	w1, w1, w1, lsl #2
    457c:	4b010000 	sub	w0, w0, w1
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    4580:	8b20ce60 	add	x0, x19, w0, sxtw #3
    4584:	f9403803 	ldr	x3, [x0, #112]
    while (*(src + count)) {
    4588:	39400060 	ldrb	w0, [x3]
    458c:	340004a0 	cbz	w0, 4620 <shellDown+0x100>
    unsigned short count = 0;
    4590:	52800001 	mov	w1, #0x0                   	// #0
    while (*(src + count)) {
    4594:	d2800002 	mov	x2, #0x0                   	// #0
        count++;
    4598:	11000421 	add	w1, w1, #0x1
        *(dest + count) = *(src + count);
    459c:	38226880 	strb	w0, [x4, x2]
    while (*(src + count)) {
    45a0:	92403c22 	and	x2, x1, #0xffff
        count++;
    45a4:	12003c21 	and	w1, w1, #0xffff
    while (*(src + count)) {
    45a8:	38626860 	ldrb	w0, [x3, x2]
    45ac:	35ffff60 	cbnz	w0, 4598 <shellDown+0x78>
    *(dest + count) = 0;
    45b0:	3822689f 	strb	wzr, [x4, x2]
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    45b4:	79003261 	strh	w1, [x19, #24]
    45b8:	34000261 	cbz	w1, 4604 <shellDown+0xe4>
    SHELL_ASSERT(shell->write, return 0);
    45bc:	f9406265 	ldr	x5, [x19, #192]
        shell->parser.cursor = shell->parser.length;
    45c0:	79003661 	strh	w1, [x19, #26]
    SHELL_ASSERT(shell->write, return 0);
    45c4:	b4000205 	cbz	x5, 4604 <shellDown+0xe4>
        shellWriteString(shell, shell->parser.buffer);
    45c8:	f9401260 	ldr	x0, [x19, #32]
    while (*p++) {
    45cc:	aa0003e2 	mov	x2, x0
    45d0:	38401441 	ldrb	w1, [x2], #1
    45d4:	340002c1 	cbz	w1, 462c <shellDown+0x10c>
    45d8:	52800024 	mov	w4, #0x1                   	// #1
    45dc:	4b020084 	sub	w4, w4, w2
        count++;
    45e0:	0b020081 	add	w1, w4, w2
    while (*p++) {
    45e4:	38401443 	ldrb	w3, [x2], #1
    45e8:	12003c21 	and	w1, w1, #0xffff
    45ec:	35ffffa3 	cbnz	w3, 45e0 <shellDown+0xc0>
}
    45f0:	f9400bf3 	ldr	x19, [sp, #16]
    return shell->write((char*)string, count);
    45f4:	aa0503f0 	mov	x16, x5
}
    45f8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shell->write((char*)string, count);
    45fc:	d61f0200 	br	x16
        shell->parser.cursor = shell->parser.length = 0;
    4600:	b9001a7f 	str	wzr, [x19, #24]
}
    4604:	f9400bf3 	ldr	x19, [sp, #16]
    4608:	a8c27bfd 	ldp	x29, x30, [sp], #32
    460c:	d65f03c0 	ret
            shell->history.offset = 0;
    4610:	7901381f 	strh	wzr, [x0, #156]
}
    4614:	f9400bf3 	ldr	x19, [sp, #16]
    4618:	a8c27bfd 	ldp	x29, x30, [sp], #32
    461c:	d65f03c0 	ret
    *(dest + count) = 0;
    4620:	3900009f 	strb	wzr, [x4]
        if ((shell->parser.length = shellStringCopy(shell->parser.buffer,
    4624:	7900327f 	strh	wzr, [x19, #24]
    4628:	17fffff7 	b	4604 <shellDown+0xe4>
    unsigned short count = 0;
    462c:	52800001 	mov	w1, #0x0                   	// #0
    4630:	17fffff0 	b	45f0 <shellDown+0xd0>
    4634:	d503201f 	nop
    4638:	d503201f 	nop
    463c:	d503201f 	nop

0000000000004640 <shellRight>:
    if (shell->parser.cursor < shell->parser.length) {
    4640:	79403401 	ldrh	w1, [x0, #26]
    4644:	79403002 	ldrh	w2, [x0, #24]
    4648:	6b01005f 	cmp	w2, w1
    464c:	540001e9 	b.ls	4688 <shellRight+0x48>  // b.plast
{
    4650:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        shellWriteByte(shell, shell->parser.buffer[shell->parser.cursor++]);
    4654:	92403c23 	and	x3, x1, #0xffff
    4658:	11000421 	add	w1, w1, #0x1
{
    465c:	910003fd 	mov	x29, sp
        shellWriteByte(shell, shell->parser.buffer[shell->parser.cursor++]);
    4660:	f9401004 	ldr	x4, [x0, #32]
    4664:	79003401 	strh	w1, [x0, #26]
    shell->write(&data, 1);
    4668:	f9406002 	ldr	x2, [x0, #192]
    466c:	52800021 	mov	w1, #0x1                   	// #1
        shellWriteByte(shell, shell->parser.buffer[shell->parser.cursor++]);
    4670:	38636883 	ldrb	w3, [x4, x3]
    shell->write(&data, 1);
    4674:	91007fe0 	add	x0, sp, #0x1f
    4678:	39007fe3 	strb	w3, [sp, #31]
    467c:	d63f0040 	blr	x2
}
    4680:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4684:	d65f03c0 	ret
    4688:	d65f03c0 	ret
    468c:	d503201f 	nop

0000000000004690 <shellLeft>:
{
    4690:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4694:	910003fd 	mov	x29, sp
    4698:	f9000bf3 	str	x19, [sp, #16]
    469c:	aa0003f3 	mov	x19, x0
    if (shell->parser.cursor > 0) {
    46a0:	79403400 	ldrh	w0, [x0, #26]
    46a4:	34000140 	cbz	w0, 46cc <shellLeft+0x3c>
    shell->write(&data, 1);
    46a8:	f9406262 	ldr	x2, [x19, #192]
    46ac:	52800100 	mov	w0, #0x8                   	// #8
    46b0:	3900bfe0 	strb	w0, [sp, #47]
    46b4:	52800021 	mov	w1, #0x1                   	// #1
    46b8:	9100bfe0 	add	x0, sp, #0x2f
    46bc:	d63f0040 	blr	x2
        shell->parser.cursor--;
    46c0:	79403660 	ldrh	w0, [x19, #26]
    46c4:	51000400 	sub	w0, w0, #0x1
    46c8:	79003660 	strh	w0, [x19, #26]
}
    46cc:	f9400bf3 	ldr	x19, [sp, #16]
    46d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    46d4:	d65f03c0 	ret
    46d8:	d503201f 	nop
    46dc:	d503201f 	nop

00000000000046e0 <shellTab>:
{
    46e0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    46e4:	910003fd 	mov	x29, sp
    46e8:	a90153f3 	stp	x19, x20, [sp, #16]
    46ec:	a9046bf9 	stp	x25, x26, [sp, #64]
    46f0:	aa0003fa 	mov	x26, x0
    if (shell->parser.length == 0) {
    46f4:	79403013 	ldrh	w19, [x0, #24]
    46f8:	340011d3 	cbz	w19, 4930 <shellTab+0x250>
    46fc:	a9025bf5 	stp	x21, x22, [sp, #32]
        shell->parser.buffer[shell->parser.length] = 0;
    4700:	92403e73 	and	x19, x19, #0xffff
    unsigned short maxMatch = shell->parser.bufferSize;
    4704:	7940d016 	ldrh	w22, [x0, #104]
        shell->parser.buffer[shell->parser.length] = 0;
    4708:	f9401000 	ldr	x0, [x0, #32]
    470c:	3833681f 	strb	wzr, [x0, x19]
        for (short i = 0; i < shell->commandList.count; i++) {
    4710:	79415344 	ldrh	w4, [x26, #168]
        ShellCommand* base = (ShellCommand*)shell->commandList.base;
    4714:	f9405353 	ldr	x19, [x26, #160]
        for (short i = 0; i < shell->commandList.count; i++) {
    4718:	34001644 	cbz	w4, 49e0 <shellTab+0x300>
    471c:	52800002 	mov	w2, #0x0                   	// #0
    unsigned short matchNum = 0;
    4720:	52800014 	mov	w20, #0x0                   	// #0
    unsigned short lastMatchIndex = 0;
    4724:	52800015 	mov	w21, #0x0                   	// #0
    4728:	a90363f7 	stp	x23, x24, [sp, #48]
    return shell->write((char*)string, count);
    472c:	f0000057 	adrp	x23, f000 <_fstat_r+0x40>
    4730:	913562f7 	add	x23, x23, #0xd58
    4734:	14000005 	b	4748 <shellTab+0x68>
        for (short i = 0; i < shell->commandList.count; i++) {
    4738:	11000702 	add	w2, w24, #0x1
    473c:	6b22a09f 	cmp	w4, w2, sxth
    4740:	13003c42 	sxth	w2, w2
    4744:	5400044d 	b.le	47cc <shellTab+0xec>
            if (shellCheckPermission(shell, &base[i]) == 0
    4748:	937b7c59 	sbfiz	x25, x2, #5, #32
    474c:	aa1a03e0 	mov	x0, x26
    4750:	8b190279 	add	x25, x19, x25
    4754:	12003c58 	and	w24, w2, #0xffff
    4758:	aa1903e1 	mov	x1, x25
    475c:	97fff705 	bl	2370 <shellCheckPermission>
    4760:	72001c1f 	tst	w0, #0xff
    4764:	54fffea1 	b.ne	4738 <shellTab+0x58>  // b.any
                && shellStringCompare(shell->parser.buffer,
    4768:	f9401347 	ldr	x7, [x26, #32]
                       (char*)shellGetCommandName(&base[i]))
    476c:	aa1903e0 	mov	x0, x25
    4770:	97fff64c 	bl	20a0 <shellGetCommandName>
    unsigned short match = 0;
    4774:	52800006 	mov	w6, #0x0                   	// #0
    while (*(dest + i) && *(src + i)) {
    4778:	d2800003 	mov	x3, #0x0                   	// #0
    477c:	394000e2 	ldrb	w2, [x7]
    4780:	350000a2 	cbnz	w2, 4794 <shellTab+0xb4>
    4784:	1400000a 	b	47ac <shellTab+0xcc>
    4788:	386368e2 	ldrb	w2, [x7, x3]
        match++;
    478c:	12003ca6 	and	w6, w5, #0xffff
    while (*(dest + i) && *(src + i)) {
    4790:	340000e2 	cbz	w2, 47ac <shellTab+0xcc>
    4794:	38636804 	ldrb	w4, [x0, x3]
        match++;
    4798:	110004c5 	add	w5, w6, #0x1
    while (*(dest + i) && *(src + i)) {
    479c:	92403ca3 	and	x3, x5, #0xffff
        if (*(dest + i) != *(src + i)) {
    47a0:	7100009f 	cmp	w4, #0x0
    47a4:	7a421080 	ccmp	w4, w2, #0x0, ne  // ne = any
    47a8:	54ffff00 	b.eq	4788 <shellTab+0xa8>  // b.none
                && shellStringCompare(shell->parser.buffer,
    47ac:	79403340 	ldrh	w0, [x26, #24]
    47b0:	6b06001f 	cmp	w0, w6
    47b4:	540006c0 	b.eq	488c <shellTab+0x1ac>  // b.none
    47b8:	79415344 	ldrh	w4, [x26, #168]
        for (short i = 0; i < shell->commandList.count; i++) {
    47bc:	11000702 	add	w2, w24, #0x1
    47c0:	6b22a09f 	cmp	w4, w2, sxth
    47c4:	13003c42 	sxth	w2, w2
    47c8:	54fffc0c 	b.gt	4748 <shellTab+0x68>
        if (matchNum == 0) {
    47cc:	34000a74 	cbz	w20, 4918 <shellTab+0x238>
        if (matchNum == 1) {
    47d0:	7100069f 	cmp	w20, #0x1
    47d4:	54001000 	b.eq	49d4 <shellTab+0x2f4>  // b.none
                (char*)shellGetCommandName(&base[lastMatchIndex]));
    47d8:	d37b3eb5 	ubfiz	x21, x21, #5, #16
    47dc:	8b150273 	add	x19, x19, x21
    47e0:	aa1303e0 	mov	x0, x19
            shell->parser.length = shellStringCopy(shell->parser.buffer,
    47e4:	f9401346 	ldr	x6, [x26, #32]
                (char*)shellGetCommandName(&base[lastMatchIndex]));
    47e8:	97fff62e 	bl	20a0 <shellGetCommandName>
    while (*(src + count)) {
    47ec:	39400003 	ldrb	w3, [x0]
    unsigned short count = 0;
    47f0:	52800002 	mov	w2, #0x0                   	// #0
    while (*(src + count)) {
    47f4:	34000143 	cbz	w3, 481c <shellTab+0x13c>
    47f8:	d2800004 	mov	x4, #0x0                   	// #0
    47fc:	d503201f 	nop
        count++;
    4800:	11000442 	add	w2, w2, #0x1
        *(dest + count) = *(src + count);
    4804:	382468c3 	strb	w3, [x6, x4]
    while (*(src + count)) {
    4808:	92403c44 	and	x4, x2, #0xffff
        count++;
    480c:	12003c42 	and	w2, w2, #0xffff
    while (*(src + count)) {
    4810:	38646803 	ldrb	w3, [x0, x4]
    4814:	35ffff63 	cbnz	w3, 4800 <shellTab+0x120>
    *(dest + count) = 0;
    4818:	8b0400c6 	add	x6, x6, x4
    481c:	390000df 	strb	wzr, [x6]
        if (matchNum > 1) {
    4820:	7100069f 	cmp	w20, #0x1
            shell->parser.length = shellStringCopy(shell->parser.buffer,
    4824:	79003342 	strh	w2, [x26, #24]
        if (matchNum > 1) {
    4828:	54000941 	b.ne	4950 <shellTab+0x270>  // b.any
        shell->parser.buffer[shell->parser.length] = 0;
    482c:	f9401340 	ldr	x0, [x26, #32]
    4830:	92403c42 	and	x2, x2, #0xffff
    4834:	3822681f 	strb	wzr, [x0, x2]
    SHELL_ASSERT(shell->write, return 0);
    4838:	f9406345 	ldr	x5, [x26, #192]
        shell->parser.cursor = shell->parser.length;
    483c:	79403340 	ldrh	w0, [x26, #24]
    4840:	79003740 	strh	w0, [x26, #26]
    SHELL_ASSERT(shell->write, return 0);
    4844:	b40006a5 	cbz	x5, 4918 <shellTab+0x238>
        shellWriteString(shell, shell->parser.buffer);
    4848:	f9401340 	ldr	x0, [x26, #32]
    while (*p++) {
    484c:	aa0003e2 	mov	x2, x0
    4850:	38401441 	ldrb	w1, [x2], #1
    4854:	34001081 	cbz	w1, 4a64 <shellTab+0x384>
    4858:	52800024 	mov	w4, #0x1                   	// #1
    485c:	4b020084 	sub	w4, w4, w2
        count++;
    4860:	0b020081 	add	w1, w4, w2
    while (*p++) {
    4864:	38401443 	ldrb	w3, [x2], #1
    4868:	12003c21 	and	w1, w1, #0xffff
    486c:	35ffffa3 	cbnz	w3, 4860 <shellTab+0x180>
}
    4870:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    4874:	aa0503f0 	mov	x16, x5
    4878:	a9425bf5 	ldp	x21, x22, [sp, #32]
    487c:	a94363f7 	ldp	x23, x24, [sp, #48]
}
    4880:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4884:	a8c57bfd 	ldp	x29, x30, [sp], #80
    return shell->write((char*)string, count);
    4888:	d61f0200 	br	x16
                if (matchNum != 0) {
    488c:	340003d4 	cbz	w20, 4904 <shellTab+0x224>
                    if (matchNum == 1) {
    4890:	7100069f 	cmp	w20, #0x1
    4894:	54000aa0 	b.eq	49e8 <shellTab+0x308>  // b.none
                    shellListItem(shell, &base[lastMatchIndex]);
    4898:	d37b3eb5 	ubfiz	x21, x21, #5, #16
    489c:	aa1a03e0 	mov	x0, x26
    48a0:	8b150275 	add	x21, x19, x21
    48a4:	aa1503e1 	mov	x1, x21
    48a8:	97fff782 	bl	26b0 <shellListItem>
                    length = shellStringCompare((char*)shellGetCommandName(&base[lastMatchIndex]),
    48ac:	aa1503e0 	mov	x0, x21
    48b0:	97fff5fc 	bl	20a0 <shellGetCommandName>
    48b4:	aa0003e6 	mov	x6, x0
                        (char*)shellGetCommandName(&base[i]));
    48b8:	aa1903e0 	mov	x0, x25
    48bc:	97fff5f9 	bl	20a0 <shellGetCommandName>
    while (*(dest + i) && *(src + i)) {
    48c0:	d2800002 	mov	x2, #0x0                   	// #0
    unsigned short match = 0;
    48c4:	52800005 	mov	w5, #0x0                   	// #0
    while (*(dest + i) && *(src + i)) {
    48c8:	394000c1 	ldrb	w1, [x6]
    48cc:	350000a1 	cbnz	w1, 48e0 <shellTab+0x200>
    48d0:	14000067 	b	4a6c <shellTab+0x38c>
    48d4:	386268c1 	ldrb	w1, [x6, x2]
        match++;
    48d8:	12003c85 	and	w5, w4, #0xffff
    while (*(dest + i) && *(src + i)) {
    48dc:	34000741 	cbz	w1, 49c4 <shellTab+0x2e4>
    48e0:	38626803 	ldrb	w3, [x0, x2]
        match++;
    48e4:	110004a4 	add	w4, w5, #0x1
    while (*(dest + i) && *(src + i)) {
    48e8:	92403c82 	and	x2, x4, #0xffff
        if (*(dest + i) != *(src + i)) {
    48ec:	7100007f 	cmp	w3, #0x0
    48f0:	7a411060 	ccmp	w3, w1, #0x0, ne  // ne = any
    48f4:	54ffff00 	b.eq	48d4 <shellTab+0x1f4>  // b.none
                    maxMatch = (maxMatch > length) ? length : maxMatch;
    48f8:	6b1600bf 	cmp	w5, w22
    48fc:	1a9630b6 	csel	w22, w5, w22, cc  // cc = lo, ul, last
    4900:	12003ed6 	and	w22, w22, #0xffff
                matchNum++;
    4904:	11000694 	add	w20, w20, #0x1
    4908:	79415344 	ldrh	w4, [x26, #168]
    490c:	12003e94 	and	w20, w20, #0xffff
                lastMatchIndex = i;
    4910:	2a1803f5 	mov	w21, w24
    4914:	17ffff89 	b	4738 <shellTab+0x58>
    4918:	a9425bf5 	ldp	x21, x22, [sp, #32]
    491c:	a94363f7 	ldp	x23, x24, [sp, #48]
}
    4920:	a94153f3 	ldp	x19, x20, [sp, #16]
    4924:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4928:	a8c57bfd 	ldp	x29, x30, [sp], #80
    492c:	d65f03c0 	ret
    shellListCommand(shell);
    4930:	97fff84c 	bl	2a60 <shellListCommand>
    if (shell->status.isChecked) {
    4934:	3942c340 	ldrb	w0, [x26, #176]
    4938:	36000200 	tbz	w0, #0, 4978 <shellTab+0x298>
    493c:	aa1a03e0 	mov	x0, x26
}
    4940:	a94153f3 	ldp	x19, x20, [sp, #16]
    4944:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4948:	a8c57bfd 	ldp	x29, x30, [sp], #80
    494c:	17fff5fd 	b	2140 <shellWritePrompt.part.0.constprop.0>
            shellListItem(shell, &base[lastMatchIndex]);
    4950:	aa1a03e0 	mov	x0, x26
    4954:	aa1303e1 	mov	x1, x19
    4958:	97fff756 	bl	26b0 <shellListItem>
    if (shell->status.isChecked) {
    495c:	3942c340 	ldrb	w0, [x26, #176]
    4960:	36000620 	tbz	w0, #0, 4a24 <shellTab+0x344>
    4964:	aa1a03e0 	mov	x0, x26
    4968:	97fff5f6 	bl	2140 <shellWritePrompt.part.0.constprop.0>
            shell->parser.length = maxMatch;
    496c:	2a1603e2 	mov	w2, w22
    4970:	79003356 	strh	w22, [x26, #24]
    4974:	17ffffae 	b	482c <shellTab+0x14c>
    SHELL_ASSERT(shell->write, return 0);
    4978:	f9406342 	ldr	x2, [x26, #192]
    497c:	b4fffd22 	cbz	x2, 4920 <shellTab+0x240>
    while (*p++) {
    4980:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4984:	9132c400 	add	x0, x0, #0xcb1
    4988:	52800d81 	mov	w1, #0x6c                  	// #108
    498c:	14000002 	b	4994 <shellTab+0x2b4>
    4990:	39400001 	ldrb	w1, [x0]
        count++;
    4994:	11000673 	add	w19, w19, #0x1
    while (*p++) {
    4998:	91000400 	add	x0, x0, #0x1
        count++;
    499c:	12003e73 	and	w19, w19, #0xffff
    while (*p++) {
    49a0:	35ffff81 	cbnz	w1, 4990 <shellTab+0x2b0>
    return shell->write((char*)string, count);
    49a4:	2a1303e1 	mov	w1, w19
    49a8:	aa0203f0 	mov	x16, x2
}
    49ac:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    49b0:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    49b4:	9132c000 	add	x0, x0, #0xcb0
}
    49b8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    49bc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    return shell->write((char*)string, count);
    49c0:	d61f0200 	br	x16
                    maxMatch = (maxMatch > length) ? length : maxMatch;
    49c4:	6b0502df 	cmp	w22, w5
    49c8:	1a8532d6 	csel	w22, w22, w5, cc  // cc = lo, ul, last
    49cc:	12003ed6 	and	w22, w22, #0xffff
    49d0:	17ffffcd 	b	4904 <shellTab+0x224>
            shellClearCommandLine(shell);
    49d4:	aa1a03e0 	mov	x0, x26
    49d8:	97fff92e 	bl	2e90 <shellClearCommandLine>
    49dc:	17ffff7f 	b	47d8 <shellTab+0xf8>
    49e0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    49e4:	17ffffcf 	b	4920 <shellTab+0x240>
    SHELL_ASSERT(shell->write, return 0);
    49e8:	f9406343 	ldr	x3, [x26, #192]
    49ec:	b4fff563 	cbz	x3, 4898 <shellTab+0x1b8>
    while (*p++) {
    49f0:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    49f4:	91356400 	add	x0, x0, #0xd59
    49f8:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    49fc:	52800001 	mov	w1, #0x0                   	// #0
    4a00:	14000002 	b	4a08 <shellTab+0x328>
    while (*p++) {
    4a04:	39400002 	ldrb	w2, [x0]
        count++;
    4a08:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4a0c:	91000400 	add	x0, x0, #0x1
        count++;
    4a10:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4a14:	35ffff82 	cbnz	w2, 4a04 <shellTab+0x324>
    return shell->write((char*)string, count);
    4a18:	aa1703e0 	mov	x0, x23
    4a1c:	d63f0060 	blr	x3
    4a20:	17ffff9e 	b	4898 <shellTab+0x1b8>
    SHELL_ASSERT(shell->write, return 0);
    4a24:	f9406343 	ldr	x3, [x26, #192]
    4a28:	b4fffa23 	cbz	x3, 496c <shellTab+0x28c>
    while (*p++) {
    4a2c:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4a30:	9132c400 	add	x0, x0, #0xcb1
    4a34:	52800d82 	mov	w2, #0x6c                  	// #108
    unsigned short count = 0;
    4a38:	52800001 	mov	w1, #0x0                   	// #0
    4a3c:	14000002 	b	4a44 <shellTab+0x364>
    while (*p++) {
    4a40:	39400002 	ldrb	w2, [x0]
        count++;
    4a44:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4a48:	91000400 	add	x0, x0, #0x1
        count++;
    4a4c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4a50:	35ffff82 	cbnz	w2, 4a40 <shellTab+0x360>
    return shell->write((char*)string, count);
    4a54:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4a58:	9132c000 	add	x0, x0, #0xcb0
    4a5c:	d63f0060 	blr	x3
    4a60:	17ffffc3 	b	496c <shellTab+0x28c>
    unsigned short count = 0;
    4a64:	52800001 	mov	w1, #0x0                   	// #0
    4a68:	17ffff82 	b	4870 <shellTab+0x190>
    while (*(dest + i) && *(src + i)) {
    4a6c:	52800016 	mov	w22, #0x0                   	// #0
    4a70:	17ffffa5 	b	4904 <shellTab+0x224>
    4a74:	d503201f 	nop
    4a78:	d503201f 	nop
    4a7c:	d503201f 	nop

0000000000004a80 <shellBackspace>:
    shellDeleteByte(shell, 1);
    4a80:	52800021 	mov	w1, #0x1                   	// #1
    4a84:	17fff9db 	b	31f0 <shellDeleteByte>
    4a88:	d503201f 	nop
    4a8c:	d503201f 	nop

0000000000004a90 <shellDelete>:
    shellDeleteByte(shell, -1);
    4a90:	12800001 	mov	w1, #0xffffffff            	// #-1
    4a94:	17fff9d7 	b	31f0 <shellDeleteByte>
    4a98:	d503201f 	nop
    4a9c:	d503201f 	nop

0000000000004aa0 <shellEnter>:
{
    4aa0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4aa4:	910003fd 	mov	x29, sp
    4aa8:	f9000bf3 	str	x19, [sp, #16]
    4aac:	aa0003f3 	mov	x19, x0
    shellExec(shell);
    4ab0:	97fffd90 	bl	40f0 <shellExec>
    if (shell->status.isChecked) {
    4ab4:	3942c260 	ldrb	w0, [x19, #176]
    4ab8:	360000a0 	tbz	w0, #0, 4acc <shellEnter+0x2c>
    4abc:	aa1303e0 	mov	x0, x19
}
    4ac0:	f9400bf3 	ldr	x19, [sp, #16]
    4ac4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4ac8:	17fff59e 	b	2140 <shellWritePrompt.part.0.constprop.0>
    SHELL_ASSERT(shell->write, return 0);
    4acc:	f9406263 	ldr	x3, [x19, #192]
    4ad0:	b4000223 	cbz	x3, 4b14 <shellEnter+0x74>
    while (*p++) {
    4ad4:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4ad8:	9132c400 	add	x0, x0, #0xcb1
    4adc:	52800d82 	mov	w2, #0x6c                  	// #108
    unsigned short count = 0;
    4ae0:	52800001 	mov	w1, #0x0                   	// #0
    4ae4:	14000002 	b	4aec <shellEnter+0x4c>
    while (*p++) {
    4ae8:	39400002 	ldrb	w2, [x0]
        count++;
    4aec:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4af0:	91000400 	add	x0, x0, #0x1
        count++;
    4af4:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4af8:	35ffff82 	cbnz	w2, 4ae8 <shellEnter+0x48>
}
    4afc:	f9400bf3 	ldr	x19, [sp, #16]
    return shell->write((char*)string, count);
    4b00:	aa0303f0 	mov	x16, x3
}
    4b04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    return shell->write((char*)string, count);
    4b08:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4b0c:	9132c000 	add	x0, x0, #0xcb0
    4b10:	d61f0200 	br	x16
}
    4b14:	f9400bf3 	ldr	x19, [sp, #16]
    4b18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4b1c:	d65f03c0 	ret

0000000000004b20 <shellHelp>:
{
    4b20:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4b24:	b0000063 	adrp	x3, 11000 <__global_locale+0x180>
    4b28:	912de063 	add	x3, x3, #0xb78
    4b2c:	910003fd 	mov	x29, sp
    4b30:	91004062 	add	x2, x3, #0x10
    4b34:	9100e063 	add	x3, x3, #0x38
    4b38:	a90153f3 	stp	x19, x20, [sp, #16]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4b3c:	91002042 	add	x2, x2, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4b40:	f85f8053 	ldur	x19, [x2, #-8]
    4b44:	b4000073 	cbz	x19, 4b50 <shellHelp+0x30>
    4b48:	3942c264 	ldrb	w4, [x19, #176]
    4b4c:	370800c4 	tbnz	w4, #1, 4b64 <shellHelp+0x44>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4b50:	eb03005f 	cmp	x2, x3
    4b54:	54ffff41 	b.ne	4b3c <shellHelp+0x1c>  // b.any
}
    4b58:	a94153f3 	ldp	x19, x20, [sp, #16]
    4b5c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4b60:	d65f03c0 	ret
    if (argc == 1) {
    4b64:	7100041f 	cmp	w0, #0x1
    4b68:	54000c80 	b.eq	4cf8 <shellHelp+0x1d8>  // b.none
    } else if (argc > 1) {
    4b6c:	54ffff6d 	b.le	4b58 <shellHelp+0x38>
    ShellCommand* command = shellSeekCommand(shell,
    4b70:	a9025bf5 	stp	x21, x22, [sp, #32]
    4b74:	52800003 	mov	w3, #0x0                   	// #0
    4b78:	aa1303e0 	mov	x0, x19
    4b7c:	f9400421 	ldr	x1, [x1, #8]
    4b80:	f9405262 	ldr	x2, [x19, #160]
    4b84:	97fffa8f 	bl	35c0 <shellSeekCommand>
    4b88:	aa0003f5 	mov	x21, x0
    SHELL_ASSERT(shell->write, return 0);
    4b8c:	f9406263 	ldr	x3, [x19, #192]
    if (command) {
    4b90:	b4000980 	cbz	x0, 4cc0 <shellHelp+0x1a0>
    SHELL_ASSERT(shell->write, return 0);
    4b94:	b40001c3 	cbz	x3, 4bcc <shellHelp+0xac>
    while (*p++) {
    4b98:	f0000042 	adrp	x2, f000 <_fstat_r+0x40>
    4b9c:	91358442 	add	x2, x2, #0xd61
    4ba0:	52800de0 	mov	w0, #0x6f                  	// #111
    unsigned short count = 0;
    4ba4:	52800001 	mov	w1, #0x0                   	// #0
    4ba8:	14000002 	b	4bb0 <shellHelp+0x90>
    while (*p++) {
    4bac:	39400040 	ldrb	w0, [x2]
        count++;
    4bb0:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4bb4:	91000442 	add	x2, x2, #0x1
        count++;
    4bb8:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4bbc:	35ffff80 	cbnz	w0, 4bac <shellHelp+0x8c>
    return shell->write((char*)string, count);
    4bc0:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4bc4:	91358000 	add	x0, x0, #0xd60
    4bc8:	d63f0060 	blr	x3
        shellWriteString(shell, shellGetCommandName(command));
    4bcc:	aa1503e0 	mov	x0, x21
    4bd0:	97fff534 	bl	20a0 <shellGetCommandName>
    SHELL_ASSERT(shell->write, return 0);
    4bd4:	f9406265 	ldr	x5, [x19, #192]
    4bd8:	b4000985 	cbz	x5, 4d08 <shellHelp+0x1e8>
    while (*p++) {
    4bdc:	aa0003e2 	mov	x2, x0
    4be0:	38401441 	ldrb	w1, [x2], #1
    4be4:	340009a1 	cbz	w1, 4d18 <shellHelp+0x1f8>
    4be8:	52800024 	mov	w4, #0x1                   	// #1
    4bec:	4b020084 	sub	w4, w4, w2
        count++;
    4bf0:	0b020081 	add	w1, w4, w2
    while (*p++) {
    4bf4:	38401443 	ldrb	w3, [x2], #1
    4bf8:	12003c21 	and	w1, w1, #0xffff
    4bfc:	35ffffa3 	cbnz	w3, 4bf0 <shellHelp+0xd0>
    return shell->write((char*)string, count);
    4c00:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    4c04:	f9406263 	ldr	x3, [x19, #192]
    4c08:	b4000803 	cbz	x3, 4d08 <shellHelp+0x1e8>
    while (*p++) {
    4c0c:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4c10:	91356414 	add	x20, x0, #0xd59
    4c14:	aa1403e0 	mov	x0, x20
    4c18:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    4c1c:	52800001 	mov	w1, #0x0                   	// #0
    4c20:	14000002 	b	4c28 <shellHelp+0x108>
    while (*p++) {
    4c24:	39400002 	ldrb	w2, [x0]
        count++;
    4c28:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4c2c:	91000400 	add	x0, x0, #0x1
        count++;
    4c30:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4c34:	35ffff82 	cbnz	w2, 4c24 <shellHelp+0x104>
    return shell->write((char*)string, count);
    4c38:	f0000056 	adrp	x22, f000 <_fstat_r+0x40>
    4c3c:	913562d6 	add	x22, x22, #0xd58
    4c40:	aa1603e0 	mov	x0, x22
    4c44:	d63f0060 	blr	x3
    SHELL_ASSERT(shell->write, return 0);
    4c48:	f9406265 	ldr	x5, [x19, #192]
    4c4c:	b40005e5 	cbz	x5, 4d08 <shellHelp+0x1e8>
        return command->data.cmd.desc;
    4c50:	f9400ea0 	ldr	x0, [x21, #24]
    while (*p++) {
    4c54:	aa0003e2 	mov	x2, x0
    4c58:	38401441 	ldrb	w1, [x2], #1
    4c5c:	340005a1 	cbz	w1, 4d10 <shellHelp+0x1f0>
    4c60:	52800024 	mov	w4, #0x1                   	// #1
    4c64:	4b020084 	sub	w4, w4, w2
        count++;
    4c68:	0b020081 	add	w1, w4, w2
    while (*p++) {
    4c6c:	38401443 	ldrb	w3, [x2], #1
    4c70:	12003c21 	and	w1, w1, #0xffff
    4c74:	35ffffa3 	cbnz	w3, 4c68 <shellHelp+0x148>
    return shell->write((char*)string, count);
    4c78:	d63f00a0 	blr	x5
    SHELL_ASSERT(shell->write, return 0);
    4c7c:	f9406263 	ldr	x3, [x19, #192]
    4c80:	b4000443 	cbz	x3, 4d08 <shellHelp+0x1e8>
    while (*p++) {
    4c84:	aa1403e0 	mov	x0, x20
    4c88:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    4c8c:	52800001 	mov	w1, #0x0                   	// #0
    4c90:	14000002 	b	4c98 <shellHelp+0x178>
    while (*p++) {
    4c94:	39400002 	ldrb	w2, [x0]
        count++;
    4c98:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4c9c:	91000400 	add	x0, x0, #0x1
        count++;
    4ca0:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4ca4:	35ffff82 	cbnz	w2, 4c94 <shellHelp+0x174>
    return shell->write((char*)string, count);
    4ca8:	aa1603e0 	mov	x0, x22
}
    4cac:	a94153f3 	ldp	x19, x20, [sp, #16]
    return shell->write((char*)string, count);
    4cb0:	aa0303f0 	mov	x16, x3
    4cb4:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
    4cb8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    return shell->write((char*)string, count);
    4cbc:	d61f0200 	br	x16
    SHELL_ASSERT(shell->write, return 0);
    4cc0:	b4000243 	cbz	x3, 4d08 <shellHelp+0x1e8>
    while (*p++) {
    4cc4:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4cc8:	9134c400 	add	x0, x0, #0xd31
    4ccc:	52800de2 	mov	w2, #0x6f                  	// #111
    unsigned short count = 0;
    4cd0:	52800001 	mov	w1, #0x0                   	// #0
    4cd4:	14000002 	b	4cdc <shellHelp+0x1bc>
    while (*p++) {
    4cd8:	39400002 	ldrb	w2, [x0]
        count++;
    4cdc:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    4ce0:	91000400 	add	x0, x0, #0x1
        count++;
    4ce4:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    4ce8:	35ffff82 	cbnz	w2, 4cd8 <shellHelp+0x1b8>
    return shell->write((char*)string, count);
    4cec:	f0000040 	adrp	x0, f000 <_fstat_r+0x40>
    4cf0:	9134c000 	add	x0, x0, #0xd30
    4cf4:	17ffffee 	b	4cac <shellHelp+0x18c>
    shellListCommand(shell);
    4cf8:	aa1303e0 	mov	x0, x19
}
    4cfc:	a94153f3 	ldp	x19, x20, [sp, #16]
    4d00:	a8c37bfd 	ldp	x29, x30, [sp], #48
    shellListCommand(shell);
    4d04:	17fff757 	b	2a60 <shellListCommand>
    4d08:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4d0c:	17ffff93 	b	4b58 <shellHelp+0x38>
    unsigned short count = 0;
    4d10:	52800001 	mov	w1, #0x0                   	// #0
    4d14:	17ffffd9 	b	4c78 <shellHelp+0x158>
    4d18:	52800001 	mov	w1, #0x0                   	// #0
    4d1c:	17ffffb9 	b	4c00 <shellHelp+0xe0>

0000000000004d20 <shellHandler>:
{
    4d20:	12001c21 	and	w1, w1, #0xff
    CHECK_DATA(data, return);
    4d24:	7103fc3f 	cmp	w1, #0xff
    4d28:	540007e0 	b.eq	4e24 <shellHandler+0x104>  // b.none
    if ((shell->parser.keyValue & 0x0000FF00) != 0x00000000) {
    4d2c:	b9406c02 	ldr	w2, [x0, #108]
    4d30:	72181c5f 	tst	w2, #0xff00
    4d34:	540008a1 	b.ne	4e48 <shellHandler+0x128>  // b.any
    } else if ((shell->parser.keyValue & 0x00FF0000) != 0x00000000) {
    4d38:	72101c5f 	tst	w2, #0xff0000
    4d3c:	54000761 	b.ne	4e28 <shellHandler+0x108>  // b.any
    } else if ((shell->parser.keyValue & 0xFF000000) != 0x00000000) {
    4d40:	72081c42 	ands	w2, w2, #0xff000000
        keyFilter = 0xFF000000;
    4d44:	5280030a 	mov	w10, #0x18                  	// #24
    4d48:	52800202 	mov	w2, #0x10                  	// #16
    4d4c:	52bfe009 	mov	w9, #0xff000000            	// #-16777216
    4d50:	1a82014a 	csel	w10, w10, w2, eq  // eq = none
    4d54:	1a8903e9 	csel	w9, wzr, w9, eq  // eq = none
    for (short i = 0; i < shell->commandList.count; i++) {
    4d58:	79415008 	ldrh	w8, [x0, #168]
    ShellCommand* base = (ShellCommand*)shell->commandList.base;
    4d5c:	f9405004 	ldr	x4, [x0, #160]
    for (short i = 0; i < shell->commandList.count; i++) {
    4d60:	34000608 	cbz	w8, 4e20 <shellHandler+0x100>
                    || (base[i].data.key.value & (0xFF << (keyByteOffset - 8))) == 0x00000000) {
    4d64:	5100214b 	sub	w11, w10, #0x8
                && (base[i].data.key.value & (0xFF << keyByteOffset)) == (data << keyByteOffset)) {
    4d68:	52801fe3 	mov	w3, #0xff                  	// #255
    4d6c:	1aca206c 	lsl	w12, w3, w10
    for (short i = 0; i < shell->commandList.count; i++) {
    4d70:	52800002 	mov	w2, #0x0                   	// #0
                    || (base[i].data.key.value & (0xFF << (keyByteOffset - 8))) == 0x00000000) {
    4d74:	1acb206b 	lsl	w11, w3, w11
    4d78:	14000005 	b	4d8c <shellHandler+0x6c>
    for (short i = 0; i < shell->commandList.count; i++) {
    4d7c:	11000442 	add	w2, w2, #0x1
    4d80:	6b22a11f 	cmp	w8, w2, sxth
    4d84:	13003c42 	sxth	w2, w2
    4d88:	540004cd 	b.le	4e20 <shellHandler+0x100>
        if (base[i].attr.attrs.type == SHELL_TYPE_KEY
    4d8c:	937b7c43 	sbfiz	x3, x2, #5, #32
    4d90:	8b030087 	add	x7, x4, x3
    4d94:	b8636885 	ldr	w5, [x4, x3]
    4d98:	12180ca6 	and	w6, w5, #0xf00
    4d9c:	712400df 	cmp	w6, #0x900
    4da0:	54fffee1 	b.ne	4d7c <shellHandler+0x5c>  // b.any
    return ((!command->attr.attrs.permission
    4da4:	38636883 	ldrb	w3, [x4, x3]
        : -1;
    4da8:	340000c3 	cbz	w3, 4dc0 <shellHandler+0xa0>
                || (shell->info.user
    4dac:	f9400006 	ldr	x6, [x0]
    4db0:	b4fffe66 	cbz	x6, 4d7c <shellHandler+0x5c>
                    && (command->attr.attrs.permission
    4db4:	394000c6 	ldrb	w6, [x6]
    4db8:	6a06007f 	tst	w3, w6
    4dbc:	54fffe00 	b.eq	4d7c <shellHandler+0x5c>  // b.none
               && (shell->status.isChecked
    4dc0:	3942c003 	ldrb	w3, [x0, #176]
    4dc4:	37000043 	tbnz	w3, #0, 4dcc <shellHandler+0xac>
                   || command->attr.attrs.enableUnchecked))
    4dc8:	3667fda5 	tbz	w5, #12, 4d7c <shellHandler+0x5c>
            if ((base[i].data.key.value & keyFilter) == shell->parser.keyValue
    4dcc:	b94008e3 	ldr	w3, [x7, #8]
    4dd0:	b9406c06 	ldr	w6, [x0, #108]
    4dd4:	0a090065 	and	w5, w3, w9
    4dd8:	6b0600bf 	cmp	w5, w6
    4ddc:	54fffd01 	b.ne	4d7c <shellHandler+0x5c>  // b.any
                && (base[i].data.key.value & (0xFF << keyByteOffset)) == (data << keyByteOffset)) {
    4de0:	0a0c0063 	and	w3, w3, w12
    4de4:	1aca2026 	lsl	w6, w1, w10
    4de8:	6b06007f 	cmp	w3, w6
    4dec:	54fffc81 	b.ne	4d7c <shellHandler+0x5c>  // b.any
                shell->parser.keyValue |= data << keyByteOffset;
    4df0:	2a0300a3 	orr	w3, w5, w3
    4df4:	b9006c03 	str	w3, [x0, #108]
                if (keyByteOffset == 0
    4df8:	340002ea 	cbz	w10, 4e54 <shellHandler+0x134>
                    || (base[i].data.key.value & (0xFF << (keyByteOffset - 8))) == 0x00000000) {
    4dfc:	b94008e1 	ldr	w1, [x7, #8]
    4e00:	6a01017f 	tst	w11, w1
    4e04:	54000280 	b.eq	4e54 <shellHandler+0x134>  // b.none
    4e08:	11000442 	add	w2, w2, #0x1
                data = 0x00;
    4e0c:	52800001 	mov	w1, #0x0                   	// #0
    for (short i = 0; i < shell->commandList.count; i++) {
    4e10:	6b22a11f 	cmp	w8, w2, sxth
    4e14:	13003c42 	sxth	w2, w2
    4e18:	54fffbac 	b.gt	4d8c <shellHandler+0x6c>
    4e1c:	d503201f 	nop
    if (data != 0x00) {
    4e20:	350000a1 	cbnz	w1, 4e34 <shellHandler+0x114>
    4e24:	d65f03c0 	ret
        keyFilter = 0xFFFF0000;
    4e28:	52bfffe9 	mov	w9, #0xffff0000            	// #-65536
        keyByteOffset = 8;
    4e2c:	5280010a 	mov	w10, #0x8                   	// #8
    4e30:	17ffffca 	b	4d58 <shellHandler+0x38>
    shell->status.tabFlag = 0;
    4e34:	3942c002 	ldrb	w2, [x0, #176]
        shell->parser.keyValue = 0x00000000;
    4e38:	b9006c1f 	str	wzr, [x0, #108]
    shell->status.tabFlag = 0;
    4e3c:	121d7842 	and	w2, w2, #0xfffffffb
    4e40:	3902c002 	strb	w2, [x0, #176]
    shellInsertByte(shell, data);
    4e44:	17fff843 	b	2f50 <shellInsertByte>
        keyFilter = 0xFFFFFF00;
    4e48:	12801fe9 	mov	w9, #0xffffff00            	// #-256
        keyByteOffset = 0;
    4e4c:	5280000a 	mov	w10, #0x0                   	// #0
    4e50:	17ffffc2 	b	4d58 <shellHandler+0x38>
                    if (base[i].data.key.function) {
    4e54:	f94008e1 	ldr	x1, [x7, #16]
    4e58:	b4000121 	cbz	x1, 4e7c <shellHandler+0x15c>
{
    4e5c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4e60:	910003fd 	mov	x29, sp
                        base[i].data.key.function(shell);
    4e64:	f9000fe0 	str	x0, [sp, #24]
    4e68:	d63f0020 	blr	x1
    4e6c:	f9400fe0 	ldr	x0, [sp, #24]
                    shell->parser.keyValue = 0x00000000;
    4e70:	b9006c1f 	str	wzr, [x0, #108]
}
    4e74:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4e78:	d65f03c0 	ret
                    shell->parser.keyValue = 0x00000000;
    4e7c:	b9006c1f 	str	wzr, [x0, #108]
    if (data != 0x00) {
    4e80:	d65f03c0 	ret
    4e84:	d503201f 	nop
    4e88:	d503201f 	nop
    4e8c:	d503201f 	nop

0000000000004e90 <shellTask>:
{
    4e90:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4e94:	910003fd 	mov	x29, sp
    4e98:	f9000bf3 	str	x19, [sp, #16]
    4e9c:	aa0003f3 	mov	x19, x0
        if (shell->read && shell->read(&data, 1) == 1) {
    4ea0:	f9405e62 	ldr	x2, [x19, #184]
    4ea4:	b5000042 	cbnz	x2, 4eac <shellTask+0x1c>
    4ea8:	14000000 	b	4ea8 <shellTask+0x18>
    4eac:	9100bfe0 	add	x0, sp, #0x2f
    4eb0:	52800021 	mov	w1, #0x1                   	// #1
    4eb4:	d63f0040 	blr	x2
    4eb8:	13003c00 	sxth	w0, w0
    4ebc:	7100041f 	cmp	w0, #0x1
    4ec0:	54ffff01 	b.ne	4ea0 <shellTask+0x10>  // b.any
            shellHandler(shell, data);
    4ec4:	3940bfe1 	ldrb	w1, [sp, #47]
    4ec8:	aa1303e0 	mov	x0, x19
    4ecc:	97ffff95 	bl	4d20 <shellHandler>
    4ed0:	17fffff4 	b	4ea0 <shellTask+0x10>
    4ed4:	d503201f 	nop
    4ed8:	d503201f 	nop
    4edc:	d503201f 	nop

0000000000004ee0 <shellUsers>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4ee0:	b0000062 	adrp	x2, 11000 <__global_locale+0x180>
    4ee4:	912de042 	add	x2, x2, #0xb78
    4ee8:	91004041 	add	x1, x2, #0x10
    4eec:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    4ef0:	f9400020 	ldr	x0, [x1]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4ef4:	91002021 	add	x1, x1, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4ef8:	b4000060 	cbz	x0, 4f04 <shellUsers+0x24>
    4efc:	3942c003 	ldrb	w3, [x0, #176]
    4f00:	37080083 	tbnz	w3, #1, 4f10 <shellUsers+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f04:	eb02003f 	cmp	x1, x2
    4f08:	54ffff41 	b.ne	4ef0 <shellUsers+0x10>  // b.any
}
    4f0c:	d65f03c0 	ret
        shellListUser(shell);
    4f10:	17fff750 	b	2c50 <shellListUser>
    4f14:	d503201f 	nop
    4f18:	d503201f 	nop
    4f1c:	d503201f 	nop

0000000000004f20 <shellCmds>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f20:	b0000062 	adrp	x2, 11000 <__global_locale+0x180>
    4f24:	912de042 	add	x2, x2, #0xb78
    4f28:	91004041 	add	x1, x2, #0x10
    4f2c:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    4f30:	f9400020 	ldr	x0, [x1]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f34:	91002021 	add	x1, x1, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4f38:	b4000060 	cbz	x0, 4f44 <shellCmds+0x24>
    4f3c:	3942c003 	ldrb	w3, [x0, #176]
    4f40:	37080083 	tbnz	w3, #1, 4f50 <shellCmds+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f44:	eb02003f 	cmp	x1, x2
    4f48:	54ffff41 	b.ne	4f30 <shellCmds+0x10>  // b.any
}
    4f4c:	d65f03c0 	ret
        shellListCommand(shell);
    4f50:	17fff6c4 	b	2a60 <shellListCommand>
    4f54:	d503201f 	nop
    4f58:	d503201f 	nop
    4f5c:	d503201f 	nop

0000000000004f60 <shellVars>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f60:	b0000062 	adrp	x2, 11000 <__global_locale+0x180>
    4f64:	912de042 	add	x2, x2, #0xb78
    4f68:	91004041 	add	x1, x2, #0x10
    4f6c:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    4f70:	f9400020 	ldr	x0, [x1]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f74:	91002021 	add	x1, x1, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4f78:	b4000060 	cbz	x0, 4f84 <shellVars+0x24>
    4f7c:	3942c003 	ldrb	w3, [x0, #176]
    4f80:	37080083 	tbnz	w3, #1, 4f90 <shellVars+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4f84:	eb02003f 	cmp	x1, x2
    4f88:	54ffff41 	b.ne	4f70 <shellVars+0x10>  // b.any
}
    4f8c:	d65f03c0 	ret
        shellListVar(shell);
    4f90:	17fff6f4 	b	2b60 <shellListVar>
    4f94:	d503201f 	nop
    4f98:	d503201f 	nop
    4f9c:	d503201f 	nop

0000000000004fa0 <shellKeys>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4fa0:	b0000062 	adrp	x2, 11000 <__global_locale+0x180>
    4fa4:	912de042 	add	x2, x2, #0xb78
    4fa8:	91004041 	add	x1, x2, #0x10
    4fac:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    4fb0:	f9400020 	ldr	x0, [x1]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4fb4:	91002021 	add	x1, x1, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4fb8:	b4000060 	cbz	x0, 4fc4 <shellKeys+0x24>
    4fbc:	3942c003 	ldrb	w3, [x0, #176]
    4fc0:	37080083 	tbnz	w3, #1, 4fd0 <shellKeys+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4fc4:	eb02003f 	cmp	x1, x2
    4fc8:	54ffff41 	b.ne	4fb0 <shellKeys+0x10>  // b.any
}
    4fcc:	d65f03c0 	ret
        shellListKey(shell);
    4fd0:	17fff754 	b	2d20 <shellListKey>
    4fd4:	d503201f 	nop
    4fd8:	d503201f 	nop
    4fdc:	d503201f 	nop

0000000000004fe0 <shellClear>:
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4fe0:	b0000062 	adrp	x2, 11000 <__global_locale+0x180>
    4fe4:	912de042 	add	x2, x2, #0xb78
    4fe8:	91004040 	add	x0, x2, #0x10
    4fec:	9100e042 	add	x2, x2, #0x38
        if (shellList[i] && shellList[i]->status.isActive) {
    4ff0:	f9400001 	ldr	x1, [x0]
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    4ff4:	91002000 	add	x0, x0, #0x8
        if (shellList[i] && shellList[i]->status.isActive) {
    4ff8:	b4000061 	cbz	x1, 5004 <shellClear+0x24>
    4ffc:	3942c023 	ldrb	w3, [x1, #176]
    5000:	37080083 	tbnz	w3, #1, 5010 <shellClear+0x30>
    for (short i = 0; i < SHELL_MAX_NUMBER; i++) {
    5004:	eb00005f 	cmp	x2, x0
    5008:	54ffff41 	b.ne	4ff0 <shellClear+0x10>  // b.any
}
    500c:	d65f03c0 	ret
    SHELL_ASSERT(shell->write, return 0);
    5010:	f9406023 	ldr	x3, [x1, #192]
    5014:	b4ffffc3 	cbz	x3, 500c <shellClear+0x2c>
    while (*p++) {
    5018:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    501c:	9135e400 	add	x0, x0, #0xd79
    5020:	52800b62 	mov	w2, #0x5b                  	// #91
    unsigned short count = 0;
    5024:	52800001 	mov	w1, #0x0                   	// #0
    5028:	14000002 	b	5030 <shellClear+0x50>
    while (*p++) {
    502c:	39400002 	ldrb	w2, [x0]
        count++;
    5030:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    5034:	91000400 	add	x0, x0, #0x1
        count++;
    5038:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    503c:	35ffff82 	cbnz	w2, 502c <shellClear+0x4c>
    return shell->write((char*)string, count);
    5040:	aa0303f0 	mov	x16, x3
    5044:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5048:	9135e000 	add	x0, x0, #0xd78
    504c:	d61f0200 	br	x16

0000000000005050 <shellRun>:
    SHELL_ASSERT(shell && cmd, return -1);
    5050:	f100001f 	cmp	x0, #0x0
    5054:	fa401824 	ccmp	x1, #0x0, #0x4, ne  // ne = any
    5058:	54000700 	b.eq	5138 <shellRun+0xe8>  // b.none
{
    505c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5060:	910003fd 	mov	x29, sp
    5064:	a90153f3 	stp	x19, x20, [sp, #16]
    5068:	aa0003f4 	mov	x20, x0
    506c:	aa0103f3 	mov	x19, x1
    5070:	f90013f5 	str	x21, [sp, #32]
    if (strlen(cmd) > shell->parser.bufferSize - 1) {
    5074:	aa0103e0 	mov	x0, x1
    char active = shell->status.isActive;
    5078:	f9405a95 	ldr	x21, [x20, #176]
    if (strlen(cmd) > shell->parser.bufferSize - 1) {
    507c:	94000b11 	bl	7cc0 <strlen>
    5080:	7940d281 	ldrh	w1, [x20, #104]
    5084:	51000421 	sub	w1, w1, #0x1
    char active = shell->status.isActive;
    5088:	530106b5 	ubfx	w21, w21, #1, #1
    if (strlen(cmd) > shell->parser.bufferSize - 1) {
    508c:	eb21c01f 	cmp	x0, w1, sxtw
    5090:	54000328 	b.hi	50f4 <shellRun+0xa4>  // b.pmore
    while (*(src + count)) {
    5094:	39400263 	ldrb	w3, [x19]
    unsigned short count = 0;
    5098:	52800002 	mov	w2, #0x0                   	// #0
        shell->parser.length = shellStringCopy(shell->parser.buffer, (char*)cmd);
    509c:	f9401281 	ldr	x1, [x20, #32]
    while (*(src + count)) {
    50a0:	34000123 	cbz	w3, 50c4 <shellRun+0x74>
    50a4:	d2800004 	mov	x4, #0x0                   	// #0
        count++;
    50a8:	11000442 	add	w2, w2, #0x1
        *(dest + count) = *(src + count);
    50ac:	38246823 	strb	w3, [x1, x4]
    while (*(src + count)) {
    50b0:	92403c44 	and	x4, x2, #0xffff
        count++;
    50b4:	12003c42 	and	w2, w2, #0xffff
    while (*(src + count)) {
    50b8:	38646a63 	ldrb	w3, [x19, x4]
    50bc:	35ffff63 	cbnz	w3, 50a8 <shellRun+0x58>
    *(dest + count) = 0;
    50c0:	8b040021 	add	x1, x1, x4
    50c4:	3900003f 	strb	wzr, [x1]
        shellExec(shell);
    50c8:	aa1403e0 	mov	x0, x20
        shell->parser.length = shellStringCopy(shell->parser.buffer, (char*)cmd);
    50cc:	79003282 	strh	w2, [x20, #24]
        shellExec(shell);
    50d0:	97fffc08 	bl	40f0 <shellExec>
        shell->status.isActive = active;
    50d4:	3942c281 	ldrb	w1, [x20, #176]
        return 0;
    50d8:	52800000 	mov	w0, #0x0                   	// #0
        shell->status.isActive = active;
    50dc:	331f02a1 	bfi	w1, w21, #1, #1
    50e0:	3902c281 	strb	w1, [x20, #176]
}
    50e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    50e8:	f94013f5 	ldr	x21, [sp, #32]
    50ec:	a8c37bfd 	ldp	x29, x30, [sp], #48
    50f0:	d65f03c0 	ret
    SHELL_ASSERT(shell->write, return 0);
    50f4:	f9406283 	ldr	x3, [x20, #192]
    50f8:	b40001c3 	cbz	x3, 5130 <shellRun+0xe0>
    while (*p++) {
    50fc:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5100:	91322400 	add	x0, x0, #0xc89
    5104:	52800142 	mov	w2, #0xa                   	// #10
    unsigned short count = 0;
    5108:	52800001 	mov	w1, #0x0                   	// #0
    510c:	14000002 	b	5114 <shellRun+0xc4>
    while (*p++) {
    5110:	39400002 	ldrb	w2, [x0]
        count++;
    5114:	11000421 	add	w1, w1, #0x1
    while (*p++) {
    5118:	91000400 	add	x0, x0, #0x1
        count++;
    511c:	12003c21 	and	w1, w1, #0xffff
    while (*p++) {
    5120:	35ffff82 	cbnz	w2, 5110 <shellRun+0xc0>
    return shell->write((char*)string, count);
    5124:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5128:	91322000 	add	x0, x0, #0xc88
    512c:	d63f0060 	blr	x3
        return -1;
    5130:	12800000 	mov	w0, #0xffffffff            	// #-1
    return shell->write((char*)string, count);
    5134:	17ffffec 	b	50e4 <shellRun+0x94>
    SHELL_ASSERT(shell && cmd, return -1);
    5138:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    513c:	d65f03c0 	ret

0000000000005140 <shellKill>:
    kill(pid);
    5140:	14000640 	b	6a40 <kill>
    5144:	d503201f 	nop
    5148:	d503201f 	nop
    514c:	d503201f 	nop

0000000000005150 <shellCd>:
/**
 * @brief cd 切换到指定路径下(文件系统调用)
 */
void shellCd(const char* path)
{
    cd(&session_fs, (char*)path);
    5150:	aa0003e1 	mov	x1, x0
    5154:	90000062 	adrp	x2, 11000 <__global_locale+0x180>
    5158:	912d6040 	add	x0, x2, #0xb58
    515c:	140001a9 	b	5800 <cd>

0000000000005160 <shellMkdir>:
/**
 * @brief mkdir 创建指定路径的一个目录(文件系统调用)
 */
void shellMkdir(const char* path)
{
    mkdir(&session_fs, (char*)path);
    5160:	aa0003e1 	mov	x1, x0
    5164:	90000062 	adrp	x2, 11000 <__global_locale+0x180>
    5168:	912d6040 	add	x0, x2, #0xb58
    516c:	140001e5 	b	5900 <mkdir>

0000000000005170 <shellRm>:
/**
 * @brief Delete 删除指定路径的一个文件或者目录(文件系统调用)。如果是目录，默认删除目录下全部文件
 */
void shellRm(const char* path)
{
    rm(&session_fs, (char*)path);
    5170:	aa0003e1 	mov	x1, x0
    5174:	90000062 	adrp	x2, 11000 <__global_locale+0x180>
    5178:	912d6040 	add	x0, x2, #0xb58
    517c:	14000221 	b	5a00 <rm>

0000000000005180 <shellCat>:
/**
 * @brief Cat 将指定文件内容在控制台上打印出来(文件系统调用)
 */
void shellCat(const char* path)
{
    cat(&session_fs, (char*)path);
    5180:	aa0003e1 	mov	x1, x0
    5184:	90000062 	adrp	x2, 11000 <__global_locale+0x180>
    5188:	912d6040 	add	x0, x2, #0xb58
    518c:	1400025d 	b	5b00 <cat>

0000000000005190 <shellShowTasks>:
/**
 * @brief 展示内核中全部tasks状态
 */
void shellShowTasks()
{
    show_task();
    5190:	1400066c 	b	6b40 <show_task>
    5194:	d503201f 	nop
    5198:	d503201f 	nop
    519c:	d503201f 	nop

00000000000051a0 <shellShowMemInfo>:
/**
 * @brief 展示当前内存信息
 */
void shellShowMemInfo()
{
    show_mem();
    51a0:	14000670 	b	6b60 <show_mem>
    51a4:	d503201f 	nop
    51a8:	d503201f 	nop
    51ac:	d503201f 	nop

00000000000051b0 <shellShowCpusInfo>:
/**
 * @brief 展示当前cpu状态
 */
void shellShowCpusInfo()
{
    show_cpu();
    51b0:	14000674 	b	6b80 <show_cpu>
    51b4:	d503201f 	nop
    51b8:	d503201f 	nop
    51bc:	d503201f 	nop

00000000000051c0 <shellExtParsePara>:
 * @param string parameter
 * @return unsigned int Analysis result
 */
unsigned int shellExtParsePara(Shell* shell, char* string)
{
    if (*string == '\'' && *(string + 1)) {
    51c0:	39400022 	ldrb	w2, [x1]
    51c4:	71009c5f 	cmp	w2, #0x27
    51c8:	54000360 	b.eq	5234 <shellExtParsePara+0x74>  // b.none
        return (unsigned int)shellExtParseChar(string);
    } else if (*string == '-' || (*string >= '0' && *string <= '9')) {
    51cc:	5100c043 	sub	w3, w2, #0x30
    51d0:	7100b45f 	cmp	w2, #0x2d
    51d4:	12001c63 	and	w3, w3, #0xff
    51d8:	7a491860 	ccmp	w3, #0x9, #0x0, ne  // ne = any
    51dc:	54000889 	b.ls	52ec <shellExtParsePara+0x12c>  // b.plast
        return (unsigned int)shellExtParseNumber(string);
    } else if (*string == '$' && *(string + 1)) {
    51e0:	7100905f 	cmp	w2, #0x24
    51e4:	54000080 	b.eq	51f4 <shellExtParsePara+0x34>  // b.none
        return shellExtParseVar(shell, string);
    } else if (*string) {
    51e8:	35001662 	cbnz	w2, 54b4 <shellExtParsePara+0x2f4>
        return 0;
    51ec:	52800000 	mov	w0, #0x0                   	// #0
        return (unsigned long)shellExtParseString(string);
    }
    return 0;
}
    51f0:	d65f03c0 	ret
    } else if (*string == '$' && *(string + 1)) {
    51f4:	39400423 	ldrb	w3, [x1, #1]
    51f8:	34000223 	cbz	w3, 523c <shellExtParsePara+0x7c>
{
    51fc:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ShellCommand* command = shellSeekCommand(shell,
    5200:	91000421 	add	x1, x1, #0x1
    5204:	52800003 	mov	w3, #0x0                   	// #0
{
    5208:	910003fd 	mov	x29, sp
    520c:	f9000bf3 	str	x19, [sp, #16]
    5210:	aa0003f3 	mov	x19, x0
    ShellCommand* command = shellSeekCommand(shell,
    5214:	f9405002 	ldr	x2, [x0, #160]
    5218:	97fff8ea 	bl	35c0 <shellSeekCommand>
    521c:	aa0003e1 	mov	x1, x0
    if (command) {
    5220:	b4001580 	cbz	x0, 54d0 <shellExtParsePara+0x310>
        return shellGetVarValue(shell, command);
    5224:	aa1303e0 	mov	x0, x19
}
    5228:	f9400bf3 	ldr	x19, [sp, #16]
    522c:	a8c27bfd 	ldp	x29, x30, [sp], #32
        return shellGetVarValue(shell, command);
    5230:	17fff948 	b	3750 <shellGetVarValue>
    if (*string == '\'' && *(string + 1)) {
    5234:	39400420 	ldrb	w0, [x1, #1]
    5238:	35000fc0 	cbnz	w0, 5430 <shellExtParsePara+0x270>
        p = ++string;
    523c:	52800000 	mov	w0, #0x0                   	// #0
    5240:	aa0103e3 	mov	x3, x1
        if (*p == '\\') {
    5244:	7101705f 	cmp	w2, #0x5c
            *(string + index) = shellExtParseChar(p - 1);
    5248:	8b202024 	add	x4, x1, w0, uxth
            value = '\t';
    524c:	52800126 	mov	w6, #0x9                   	// #9
        switch (*(p + 1)) {
    5250:	52800105 	mov	w5, #0x8                   	// #8
        if (*p == '\\') {
    5254:	54000180 	b.eq	5284 <shellExtParsePara+0xc4>  // b.none
        } else if (*p == '\"') {
    5258:	7100885f 	cmp	w2, #0x22
    525c:	54000440 	b.eq	52e4 <shellExtParsePara+0x124>  // b.none
            *(string + index) = *p;
    5260:	39000082 	strb	w2, [x4]
    while (*p) {
    5264:	39400462 	ldrb	w2, [x3, #1]
        index++;
    5268:	11000400 	add	w0, w0, #0x1
    526c:	12003c00 	and	w0, w0, #0xffff
        p++;
    5270:	91000463 	add	x3, x3, #0x1
    while (*p) {
    5274:	34000262 	cbz	w2, 52c0 <shellExtParsePara+0x100>
        if (*p == '\\') {
    5278:	7101705f 	cmp	w2, #0x5c
            *(string + index) = shellExtParseChar(p - 1);
    527c:	8b202024 	add	x4, x1, w0, uxth
        if (*p == '\\') {
    5280:	54fffec1 	b.ne	5258 <shellExtParsePara+0x98>  // b.any
        switch (*(p + 1)) {
    5284:	39400462 	ldrb	w2, [x3, #1]
    5288:	7101b85f 	cmp	w2, #0x6e
    528c:	54000f20 	b.eq	5470 <shellExtParsePara+0x2b0>  // b.none
    5290:	54000209 	b.ls	52d0 <shellExtParsePara+0x110>  // b.plast
    5294:	7101c85f 	cmp	w2, #0x72
    5298:	540005c0 	b.eq	5350 <shellExtParsePara+0x190>  // b.none
            value = '\t';
    529c:	7101d05f 	cmp	w2, #0x74
    52a0:	1a861042 	csel	w2, w2, w6, ne  // ne = any
            p++;
    52a4:	91000463 	add	x3, x3, #0x1
            *(string + index) = shellExtParseChar(p - 1);
    52a8:	39000082 	strb	w2, [x4]
        index++;
    52ac:	11000400 	add	w0, w0, #0x1
    52b0:	12003c00 	and	w0, w0, #0xffff
    while (*p) {
    52b4:	39400462 	ldrb	w2, [x3, #1]
        p++;
    52b8:	91000463 	add	x3, x3, #0x1
    while (*p) {
    52bc:	35fffde2 	cbnz	w2, 5278 <shellExtParsePara+0xb8>
    *(string + index) = 0;
    52c0:	8b202023 	add	x3, x1, w0, uxth
        return (unsigned long)shellExtParseString(string);
    52c4:	2a0103e0 	mov	w0, w1
    *(string + index) = 0;
    52c8:	3900007f 	strb	wzr, [x3]
        return (unsigned long)shellExtParseString(string);
    52cc:	d65f03c0 	ret
        switch (*(p + 1)) {
    52d0:	7100c05f 	cmp	w2, #0x30
    52d4:	540003a0 	b.eq	5348 <shellExtParsePara+0x188>  // b.none
    52d8:	7101885f 	cmp	w2, #0x62
    52dc:	1a851042 	csel	w2, w2, w5, ne  // ne = any
    52e0:	17fffff1 	b	52a4 <shellExtParsePara+0xe4>
            *(string + index) = 0;
    52e4:	3900009f 	strb	wzr, [x4]
    52e8:	17ffffdf 	b	5264 <shellExtParsePara+0xa4>
    if (*string == '-') {
    52ec:	7100b45f 	cmp	w2, #0x2d
    52f0:	54000d80 	b.eq	54a0 <shellExtParsePara+0x2e0>  // b.none
    52f4:	aa0103e3 	mov	x3, x1
    52f8:	d2800004 	mov	x4, #0x0                   	// #0
    signed char sign = 1;
    52fc:	5280002b 	mov	w11, #0x1                   	// #1
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    5300:	7100c05f 	cmp	w2, #0x30
    while (*p++) {
    5304:	91000460 	add	x0, x3, #0x1
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    5308:	54000b80 	b.eq	5478 <shellExtParsePara+0x2b8>  // b.none
    while (*p++) {
    530c:	34000ea2 	cbz	w2, 54e0 <shellExtParsePara+0x320>
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    5310:	39400462 	ldrb	w2, [x3, #1]
    NUM_Type type = NUM_TYPE_INT;
    5314:	5280000a 	mov	w10, #0x0                   	// #0
    5318:	14000004 	b	5328 <shellExtParsePara+0x168>
    while (*p++) {
    531c:	38401402 	ldrb	w2, [x0], #1
    5320:	340001c2 	cbz	w2, 5358 <shellExtParsePara+0x198>
        if (*p == '.' && *(p + 1) != 0) {
    5324:	39400002 	ldrb	w2, [x0]
    5328:	7100b85f 	cmp	w2, #0x2e
    532c:	54ffff81 	b.ne	531c <shellExtParsePara+0x15c>  // b.any
    5330:	39400402 	ldrb	w2, [x0, #1]
    5334:	34ffff42 	cbz	w2, 531c <shellExtParsePara+0x15c>
    5338:	d2800000 	mov	x0, #0x0                   	// #0
            type = NUM_TYPE_FLOAT;
    533c:	5280008a 	mov	w10, #0x4                   	// #4
    5340:	52800148 	mov	w8, #0xa                   	// #10
    5344:	1400000d 	b	5378 <shellExtParsePara+0x1b8>
            value = 0;
    5348:	52800002 	mov	w2, #0x0                   	// #0
    534c:	17ffffd6 	b	52a4 <shellExtParsePara+0xe4>
            value = '\r';
    5350:	528001a2 	mov	w2, #0xd                   	// #13
    5354:	17ffffd4 	b	52a4 <shellExtParsePara+0xe4>
    5358:	51000543 	sub	w3, w10, #0x1
    switch ((char)type) {
    535c:	7100087f 	cmp	w3, #0x2
    5360:	54000c08 	b.hi	54e0 <shellExtParsePara+0x320>  // b.pmore
    5364:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5368:	91362042 	add	x2, x2, #0xd88
    p = string + offset + ((sign == -1) ? 1 : 0);
    536c:	91002040 	add	x0, x2, #0x8
    5370:	38634848 	ldrb	w8, [x2, w3, uxtw]
    5374:	38634800 	ldrb	w0, [x0, w3, uxtw]
    5378:	8b040000 	add	x0, x0, x4
    537c:	8b000025 	add	x5, x1, x0
    while (*p) {
    5380:	38606821 	ldrb	w1, [x1, x0]
    5384:	34fff341 	cbz	w1, 51ec <shellExtParsePara+0x2c>
    unsigned int devide = 0;
    5388:	52800006 	mov	w6, #0x0                   	// #0
    unsigned int valueInt = 0;
    538c:	52800000 	mov	w0, #0x0                   	// #0
        devide *= 10;
    5390:	52800149 	mov	w9, #0xa                   	// #10
    5394:	d503201f 	nop
    if ((code >= '0') && (code <= '9')) {
    5398:	5100c022 	sub	w2, w1, #0x30
    } else if ((code >= 'a') && (code <= 'f')) {
    539c:	51018423 	sub	w3, w1, #0x61
    if ((code >= '0') && (code <= '9')) {
    53a0:	12001c42 	and	w2, w2, #0xff
    } else if ((code >= 'a') && (code <= 'f')) {
    53a4:	12001c63 	and	w3, w3, #0xff
            p++;
    53a8:	910004a5 	add	x5, x5, #0x1
        if (*p == '.') {
    53ac:	7100b83f 	cmp	w1, #0x2e
    53b0:	54000360 	b.eq	541c <shellExtParsePara+0x25c>  // b.none
    } else if ((code >= 'A') && (code <= 'F')) {
    53b4:	51010424 	sub	w4, w1, #0x41
        valueInt = valueInt * radix + shellExtToNum(*p);
    53b8:	1b087c00 	mul	w0, w0, w8
    53bc:	5100dc27 	sub	w7, w1, #0x37
    } else if ((code >= 'A') && (code <= 'F')) {
    53c0:	12001c84 	and	w4, w4, #0xff
    if ((code >= '0') && (code <= '9')) {
    53c4:	7100245f 	cmp	w2, #0x9
    53c8:	54000269 	b.ls	5414 <shellExtParsePara+0x254>  // b.plast
    } else if ((code >= 'a') && (code <= 'f')) {
    53cc:	7100147f 	cmp	w3, #0x5
    53d0:	540002a9 	b.ls	5424 <shellExtParsePara+0x264>  // b.plast
        valueInt = valueInt * radix + shellExtToNum(*p);
    53d4:	7100189f 	cmp	w4, #0x6
    53d8:	0b270007 	add	w7, w0, w7, uxtb
    53dc:	1a8030e0 	csel	w0, w7, w0, cc  // cc = lo, ul, last
        devide *= 10;
    53e0:	1b097cc6 	mul	w6, w6, w9
    while (*p) {
    53e4:	394000a1 	ldrb	w1, [x5]
    53e8:	35fffd81 	cbnz	w1, 5398 <shellExtParsePara+0x1d8>
    if (type == NUM_TYPE_FLOAT && devide != 0) {
    53ec:	710000df 	cmp	w6, #0x0
    53f0:	7a441940 	ccmp	w10, #0x4, #0x0, ne  // ne = any
    53f4:	540003a1 	b.ne	5468 <shellExtParsePara+0x2a8>  // b.any
        valueFloat = (float)valueInt / devide * sign;
    53f8:	1e230000 	ucvtf	s0, w0
    53fc:	1e2300c1 	ucvtf	s1, w6
    5400:	1e220162 	scvtf	s2, w11
    5404:	1e211800 	fdiv	s0, s0, s1
        return *(unsigned int*)(&valueFloat);
    5408:	1e220800 	fmul	s0, s0, s2
    540c:	1e260000 	fmov	w0, s0
    5410:	d65f03c0 	ret
        valueInt = valueInt * radix + shellExtToNum(*p);
    5414:	0b020000 	add	w0, w0, w2
    5418:	17fffff2 	b	53e0 <shellExtParsePara+0x220>
            devide = 1;
    541c:	52800026 	mov	w6, #0x1                   	// #1
    5420:	17fffff1 	b	53e4 <shellExtParsePara+0x224>
        return code - 'a' + 10;
    5424:	51015c21 	sub	w1, w1, #0x57
        valueInt = valueInt * radix + shellExtToNum(*p);
    5428:	0b210000 	add	w0, w0, w1, uxtb
        return code - 'a' + 10;
    542c:	17ffffed 	b	53e0 <shellExtParsePara+0x220>
    if (*p == '\\') {
    5430:	7101701f 	cmp	w0, #0x5c
    5434:	54ffede1 	b.ne	51f0 <shellExtParsePara+0x30>  // b.any
        switch (*(p + 1)) {
    5438:	39400821 	ldrb	w1, [x1, #2]
    543c:	7101b83f 	cmp	w1, #0x6e
    5440:	54000660 	b.eq	550c <shellExtParsePara+0x34c>  // b.none
    5444:	54000568 	b.hi	54f0 <shellExtParsePara+0x330>  // b.pmore
    5448:	7100c03f 	cmp	w1, #0x30
    544c:	52800000 	mov	w0, #0x0                   	// #0
    5450:	54ffed00 	b.eq	51f0 <shellExtParsePara+0x30>  // b.none
    5454:	7101883f 	cmp	w1, #0x62
    5458:	52800100 	mov	w0, #0x8                   	// #8
    545c:	54ffeca0 	b.eq	51f0 <shellExtParsePara+0x30>  // b.none
        return (unsigned int)shellExtParseChar(string);
    5460:	2a0103e0 	mov	w0, w1
            break;
    5464:	d65f03c0 	ret
        return valueInt * sign;
    5468:	1b007d60 	mul	w0, w11, w0
    546c:	d65f03c0 	ret
            value = '\n';
    5470:	52800142 	mov	w2, #0xa                   	// #10
    5474:	17ffff8c 	b	52a4 <shellExtParsePara+0xe4>
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    5478:	39400462 	ldrb	w2, [x3, #1]
        type = NUM_TYPE_HEX;
    547c:	5280006a 	mov	w10, #0x3                   	// #3
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    5480:	121a7843 	and	w3, w2, #0xffffffdf
    5484:	7101607f 	cmp	w3, #0x58
    5488:	12001c63 	and	w3, w3, #0xff
    548c:	54fff4e0 	b.eq	5328 <shellExtParsePara+0x168>  // b.none
        type = NUM_TYPE_OCT;
    5490:	7101087f 	cmp	w3, #0x42
    5494:	1a9f07ea 	cset	w10, ne  // ne = any
    5498:	1100054a 	add	w10, w10, #0x1
    549c:	17ffffa3 	b	5328 <shellExtParsePara+0x168>
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    54a0:	39400422 	ldrb	w2, [x1, #1]
        var + 1,
    54a4:	91000423 	add	x3, x1, #0x1
    if ((*p == '0') && ((*(p + 1) == 'x') || (*(p + 1) == 'X'))) {
    54a8:	d2800024 	mov	x4, #0x1                   	// #1
        sign = -1;
    54ac:	1280000b 	mov	w11, #0xffffffff            	// #-1
    54b0:	17ffff94 	b	5300 <shellExtParsePara+0x140>
    if (*string == '\"') {
    54b4:	7100885f 	cmp	w2, #0x22
        var + 1,
    54b8:	91000423 	add	x3, x1, #0x1
    if (*string == '\"') {
    54bc:	54ffec01 	b.ne	523c <shellExtParsePara+0x7c>  // b.any
    while (*p) {
    54c0:	39400422 	ldrb	w2, [x1, #1]
        p = ++string;
    54c4:	aa0303e1 	mov	x1, x3
    while (*p) {
    54c8:	35ffeba2 	cbnz	w2, 523c <shellExtParsePara+0x7c>
    54cc:	17ffff7e 	b	52c4 <shellExtParsePara+0x104>
        return 0;
    54d0:	52800000 	mov	w0, #0x0                   	// #0
}
    54d4:	f9400bf3 	ldr	x19, [sp, #16]
    54d8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    54dc:	d65f03c0 	ret
    while (*p++) {
    54e0:	d2800000 	mov	x0, #0x0                   	// #0
    54e4:	5280000a 	mov	w10, #0x0                   	// #0
    54e8:	52800148 	mov	w8, #0xa                   	// #10
    54ec:	17ffffa3 	b	5378 <shellExtParsePara+0x1b8>
        switch (*(p + 1)) {
    54f0:	7101c83f 	cmp	w1, #0x72
    54f4:	528001a0 	mov	w0, #0xd                   	// #13
    54f8:	54ffe7c0 	b.eq	51f0 <shellExtParsePara+0x30>  // b.none
    54fc:	7101d03f 	cmp	w1, #0x74
    5500:	52800120 	mov	w0, #0x9                   	// #9
    5504:	54fffae1 	b.ne	5460 <shellExtParsePara+0x2a0>  // b.any
}
    5508:	d65f03c0 	ret
        switch (*(p + 1)) {
    550c:	52800140 	mov	w0, #0xa                   	// #10
    5510:	d65f03c0 	ret
    5514:	d503201f 	nop
    5518:	d503201f 	nop
    551c:	d503201f 	nop

0000000000005520 <shellExtRun>:
 * @param argc Number of parameters
 * @param argv parameter
 * @return int return value
 */
int shellExtRun(Shell* shell, ShellCommand* command, int argc, char* argv[])
{
    5520:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    5524:	910003fd 	mov	x29, sp
    5528:	a9025bf5 	stp	x21, x22, [sp, #32]
    552c:	a90363f7 	stp	x23, x24, [sp, #48]
    5530:	aa0103f7 	mov	x23, x1
    uintptr_t params[8] = { 0 };
    int paramNum = command->attr.attrs.paramNum > (argc - 1) ? command->attr.attrs.paramNum : (argc - 1);
    5534:	f9400035 	ldr	x21, [x1]
    uintptr_t params[8] = { 0 };
    5538:	a9047fff 	stp	xzr, xzr, [sp, #64]
    int paramNum = command->attr.attrs.paramNum > (argc - 1) ? command->attr.attrs.paramNum : (argc - 1);
    553c:	51000441 	sub	w1, w2, #0x1
    uintptr_t params[8] = { 0 };
    5540:	a9057fff 	stp	xzr, xzr, [sp, #80]
    int paramNum = command->attr.attrs.paramNum > (argc - 1) ? command->attr.attrs.paramNum : (argc - 1);
    5544:	53104eb5 	ubfx	w21, w21, #16, #4
    uintptr_t params[8] = { 0 };
    5548:	a9067fff 	stp	xzr, xzr, [sp, #96]
    int paramNum = command->attr.attrs.paramNum > (argc - 1) ? command->attr.attrs.paramNum : (argc - 1);
    554c:	6b0202bf 	cmp	w21, w2
    5550:	1a81a2b5 	csel	w21, w21, w1, ge  // ge = tcont
    uintptr_t params[8] = { 0 };
    5554:	a9077fff 	stp	xzr, xzr, [sp, #112]
    for (int i = 0; i < argc - 1; i++) {
    5558:	7100003f 	cmp	w1, #0x0
    555c:	5400024d 	b.le	55a4 <shellExtRun+0x84>
    5560:	51000842 	sub	w2, w2, #0x2
    5564:	aa0003f6 	mov	x22, x0
    5568:	aa0303f8 	mov	x24, x3
    556c:	a90153f3 	stp	x19, x20, [sp, #16]
    5570:	91000854 	add	x20, x2, #0x2
    5574:	d2800033 	mov	x19, #0x1                   	// #1
        params[i] = shellExtParsePara(shell, argv[i + 1]);
    5578:	f8737b01 	ldr	x1, [x24, x19, lsl #3]
    557c:	aa1603e0 	mov	x0, x22
    5580:	97ffff10 	bl	51c0 <shellExtParsePara>
    5584:	2a0003e0 	mov	w0, w0
    5588:	910103e1 	add	x1, sp, #0x40
    558c:	8b130c21 	add	x1, x1, x19, lsl #3
    for (int i = 0; i < argc - 1; i++) {
    5590:	91000673 	add	x19, x19, #0x1
    5594:	eb14027f 	cmp	x19, x20
        params[i] = shellExtParsePara(shell, argv[i + 1]);
    5598:	f81f8020 	stur	x0, [x1, #-8]
    for (int i = 0; i < argc - 1; i++) {
    559c:	54fffee1 	b.ne	5578 <shellExtRun+0x58>  // b.any
    55a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    }
    switch (paramNum) {
    55a4:	710012bf 	cmp	w21, #0x4
    55a8:	54000640 	b.eq	5670 <shellExtRun+0x150>  // b.none
    55ac:	540001cc 	b.gt	55e4 <shellExtRun+0xc4>
    55b0:	71000abf 	cmp	w21, #0x2
    55b4:	540006e0 	b.eq	5690 <shellExtRun+0x170>  // b.none
    55b8:	5400032d 	b.le	561c <shellExtRun+0xfc>
    55bc:	71000ebf 	cmp	w21, #0x3
    55c0:	54000761 	b.ne	56ac <shellExtRun+0x18c>  // b.any
        // break;
    case 2:
        return command->data.cmd.function(params[0], params[1]);
        // break;
    case 3:
        return command->data.cmd.function(params[0], params[1],
    55c4:	f9400ae3 	ldr	x3, [x23, #16]
        // break;
    default:
        return -1;
        // break;
    }
}
    55c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1],
    55cc:	aa0303f0 	mov	x16, x3
}
    55d0:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1],
    55d4:	a94407e0 	ldp	x0, x1, [sp, #64]
    55d8:	f9402be2 	ldr	x2, [sp, #80]
}
    55dc:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1],
    55e0:	d61f0200 	br	x16
    switch (paramNum) {
    55e4:	71001abf 	cmp	w21, #0x6
    55e8:	540006c0 	b.eq	56c0 <shellExtRun+0x1a0>  // b.none
    55ec:	71001ebf 	cmp	w21, #0x7
    55f0:	540002a1 	b.ne	5644 <shellExtRun+0x124>  // b.any
        return command->data.cmd.function(params[0], params[1],
    55f4:	f9400ae7 	ldr	x7, [x23, #16]
}
    55f8:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1],
    55fc:	aa0703f0 	mov	x16, x7
}
    5600:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1],
    5604:	a94407e0 	ldp	x0, x1, [sp, #64]
    5608:	a9450fe2 	ldp	x2, x3, [sp, #80]
    560c:	a94617e4 	ldp	x4, x5, [sp, #96]
    5610:	f9403be6 	ldr	x6, [sp, #112]
}
    5614:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1],
    5618:	d61f0200 	br	x16
    switch (paramNum) {
    561c:	34000655 	cbz	w21, 56e4 <shellExtRun+0x1c4>
    5620:	710006bf 	cmp	w21, #0x1
    5624:	54000441 	b.ne	56ac <shellExtRun+0x18c>  // b.any
        return command->data.cmd.function(params[0]);
    5628:	f9400ae1 	ldr	x1, [x23, #16]
}
    562c:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0]);
    5630:	aa0103f0 	mov	x16, x1
}
    5634:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0]);
    5638:	f94023e0 	ldr	x0, [sp, #64]
}
    563c:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0]);
    5640:	d61f0200 	br	x16
    switch (paramNum) {
    5644:	710016bf 	cmp	w21, #0x5
    5648:	54000321 	b.ne	56ac <shellExtRun+0x18c>  // b.any
        return command->data.cmd.function(params[0], params[1],
    564c:	f9400ae5 	ldr	x5, [x23, #16]
}
    5650:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1],
    5654:	aa0503f0 	mov	x16, x5
}
    5658:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1],
    565c:	a94407e0 	ldp	x0, x1, [sp, #64]
    5660:	a9450fe2 	ldp	x2, x3, [sp, #80]
    5664:	f94033e4 	ldr	x4, [sp, #96]
}
    5668:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1],
    566c:	d61f0200 	br	x16
        return command->data.cmd.function(params[0], params[1],
    5670:	f9400ae4 	ldr	x4, [x23, #16]
}
    5674:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1],
    5678:	aa0403f0 	mov	x16, x4
}
    567c:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1],
    5680:	a94407e0 	ldp	x0, x1, [sp, #64]
    5684:	a9450fe2 	ldp	x2, x3, [sp, #80]
}
    5688:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1],
    568c:	d61f0200 	br	x16
        return command->data.cmd.function(params[0], params[1]);
    5690:	f9400ae2 	ldr	x2, [x23, #16]
}
    5694:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1]);
    5698:	aa0203f0 	mov	x16, x2
}
    569c:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1]);
    56a0:	a94407e0 	ldp	x0, x1, [sp, #64]
}
    56a4:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1]);
    56a8:	d61f0200 	br	x16
}
    56ac:	12800000 	mov	w0, #0xffffffff            	// #-1
    56b0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    56b4:	a94363f7 	ldp	x23, x24, [sp, #48]
    56b8:	a8c87bfd 	ldp	x29, x30, [sp], #128
    56bc:	d65f03c0 	ret
        return command->data.cmd.function(params[0], params[1],
    56c0:	f9400ae6 	ldr	x6, [x23, #16]
}
    56c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function(params[0], params[1],
    56c8:	aa0603f0 	mov	x16, x6
}
    56cc:	a94363f7 	ldp	x23, x24, [sp, #48]
        return command->data.cmd.function(params[0], params[1],
    56d0:	a94407e0 	ldp	x0, x1, [sp, #64]
    56d4:	a9450fe2 	ldp	x2, x3, [sp, #80]
    56d8:	a94617e4 	ldp	x4, x5, [sp, #96]
}
    56dc:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function(params[0], params[1],
    56e0:	d61f0200 	br	x16
        return command->data.cmd.function();
    56e4:	f9400ae0 	ldr	x0, [x23, #16]
}
    56e8:	a9425bf5 	ldp	x21, x22, [sp, #32]
        return command->data.cmd.function();
    56ec:	aa0003f0 	mov	x16, x0
}
    56f0:	a94363f7 	ldp	x23, x24, [sp, #48]
    56f4:	a8c87bfd 	ldp	x29, x30, [sp], #128
        return command->data.cmd.function();
    56f8:	d61f0200 	br	x16
    56fc:	d503201f 	nop

0000000000005700 <ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    5700:	b40006c0 	cbz	x0, 57d8 <ls+0xd8>
int ls(struct Session* session, char* path)
{
    5704:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5708:	910003fd 	mov	x29, sp
    570c:	a90153f3 	stp	x19, x20, [sp, #16]
    5710:	aa0103f4 	mov	x20, x1
    5714:	f90013f5 	str	x21, [sp, #32]
    5718:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    571c:	aa0103e0 	mov	x0, x1
    5720:	94000968 	bl	7cc0 <strlen>
    5724:	11000403 	add	w3, w0, #0x1
    5728:	9100e3e2 	add	x2, sp, #0x38
    572c:	52800021 	mov	w1, #0x1                   	// #1
    5730:	aa1503e0 	mov	x0, x21
    5734:	b9003be3 	str	w3, [sp, #56]
    5738:	9400029a 	bl	61a0 <new_ipc_msg>
    573c:	aa0003f3 	mov	x19, x0
    5740:	aa1403e0 	mov	x0, x20
    5744:	9400095f 	bl	7cc0 <strlen>
    5748:	aa1403e2 	mov	x2, x20
    574c:	11000403 	add	w3, w0, #0x1
    5750:	52800001 	mov	w1, #0x0                   	// #0
    5754:	aa1303e0 	mov	x0, x19
    5758:	940002d2 	bl	62a0 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
    575c:	52800020 	mov	w0, #0x1                   	// #1
    5760:	39000660 	strb	w0, [x19, #1]
    5764:	aa1303e0 	mov	x0, x19
    5768:	9400033e 	bl	6460 <ipc_msg_send_wait>
    576c:	aa1403e0 	mov	x0, x20
    5770:	94000954 	bl	7cc0 <strlen>
    5774:	aa1403e2 	mov	x2, x20
    5778:	11000403 	add	w3, w0, #0x1
    577c:	52800001 	mov	w1, #0x0                   	// #0
    5780:	aa1303e0 	mov	x0, x19
    5784:	940002ff 	bl	6380 <ipc_msg_get_nth_arg>
    5788:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    578c:	39400260 	ldrb	w0, [x19]
    5790:	36080280 	tbz	w0, #1, 57e0 <ls+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5794:	91002261 	add	x1, x19, #0x8
    5798:	d2800082 	mov	x2, #0x4                   	// #4
    579c:	9100e3e0 	add	x0, sp, #0x38
    57a0:	940007f8 	bl	7780 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    57a4:	b9800aa0 	ldrsw	x0, [x21, #8]
    57a8:	f9400aa1 	ldr	x1, [x21, #16]
    57ac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    57b0:	38606820 	ldrb	w0, [x1, x0]
    57b4:	36100080 	tbz	w0, #2, 57c4 <ls+0xc4>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    57b8:	79400441 	ldrh	w1, [x2, #2]
    57bc:	aa1503e0 	mov	x0, x21
    57c0:	94000434 	bl	6890 <session_free_buf>
    57c4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_ls)(session, path);
}
    57c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    57cc:	f94013f5 	ldr	x21, [sp, #32]
    57d0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    57d4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    57d8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    57dc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    57e0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    57e4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    57e8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    57ec:	91366063 	add	x3, x3, #0xd98
    57f0:	91380042 	add	x2, x2, #0xe00
    57f4:	9136c000 	add	x0, x0, #0xdb0
    57f8:	52800fc1 	mov	w1, #0x7e                  	// #126
    57fc:	94000741 	bl	7500 <__assert_func>

0000000000005800 <cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    5800:	b40006c0 	cbz	x0, 58d8 <cd+0xd8>
int cd(struct Session* session, char* path)
{
    5804:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5808:	910003fd 	mov	x29, sp
    580c:	a90153f3 	stp	x19, x20, [sp, #16]
    5810:	aa0103f4 	mov	x20, x1
    5814:	f90013f5 	str	x21, [sp, #32]
    5818:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    581c:	aa0103e0 	mov	x0, x1
    5820:	94000928 	bl	7cc0 <strlen>
    5824:	11000403 	add	w3, w0, #0x1
    5828:	9100e3e2 	add	x2, sp, #0x38
    582c:	52800021 	mov	w1, #0x1                   	// #1
    5830:	aa1503e0 	mov	x0, x21
    5834:	b9003be3 	str	w3, [sp, #56]
    5838:	9400025a 	bl	61a0 <new_ipc_msg>
    583c:	aa0003f3 	mov	x19, x0
    5840:	aa1403e0 	mov	x0, x20
    5844:	9400091f 	bl	7cc0 <strlen>
    5848:	aa1403e2 	mov	x2, x20
    584c:	11000403 	add	w3, w0, #0x1
    5850:	52800001 	mov	w1, #0x0                   	// #0
    5854:	aa1303e0 	mov	x0, x19
    5858:	94000292 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    585c:	52800040 	mov	w0, #0x2                   	// #2
    5860:	39000660 	strb	w0, [x19, #1]
    5864:	aa1303e0 	mov	x0, x19
    5868:	940002fe 	bl	6460 <ipc_msg_send_wait>
    586c:	aa1403e0 	mov	x0, x20
    5870:	94000914 	bl	7cc0 <strlen>
    5874:	aa1403e2 	mov	x2, x20
    5878:	11000403 	add	w3, w0, #0x1
    587c:	52800001 	mov	w1, #0x0                   	// #0
    5880:	aa1303e0 	mov	x0, x19
    5884:	940002bf 	bl	6380 <ipc_msg_get_nth_arg>
    5888:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    588c:	39400260 	ldrb	w0, [x19]
    5890:	36080280 	tbz	w0, #1, 58e0 <cd+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5894:	91002261 	add	x1, x19, #0x8
    5898:	d2800082 	mov	x2, #0x4                   	// #4
    589c:	9100e3e0 	add	x0, sp, #0x38
    58a0:	940007b8 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    58a4:	b9800aa0 	ldrsw	x0, [x21, #8]
    58a8:	f9400aa1 	ldr	x1, [x21, #16]
    58ac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    58b0:	38606820 	ldrb	w0, [x1, x0]
    58b4:	36100080 	tbz	w0, #2, 58c4 <cd+0xc4>
    return session_free_buf(session, msg->header.len);
    58b8:	79400441 	ldrh	w1, [x2, #2]
    58bc:	aa1503e0 	mov	x0, x21
    58c0:	940003f4 	bl	6890 <session_free_buf>
    58c4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cd)(session, path);
}
    58c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    58cc:	f94013f5 	ldr	x21, [sp, #32]
    58d0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    58d4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    58d8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    58dc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    58e0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    58e4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    58e8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    58ec:	91366063 	add	x3, x3, #0xd98
    58f0:	91380042 	add	x2, x2, #0xe00
    58f4:	9136c000 	add	x0, x0, #0xdb0
    58f8:	52800fc1 	mov	w1, #0x7e                  	// #126
    58fc:	94000701 	bl	7500 <__assert_func>

0000000000005900 <mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    5900:	b40006c0 	cbz	x0, 59d8 <mkdir+0xd8>
int mkdir(struct Session* session, char* path)
{
    5904:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5908:	910003fd 	mov	x29, sp
    590c:	a90153f3 	stp	x19, x20, [sp, #16]
    5910:	aa0103f4 	mov	x20, x1
    5914:	f90013f5 	str	x21, [sp, #32]
    5918:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    591c:	aa0103e0 	mov	x0, x1
    5920:	940008e8 	bl	7cc0 <strlen>
    5924:	11000403 	add	w3, w0, #0x1
    5928:	9100e3e2 	add	x2, sp, #0x38
    592c:	52800021 	mov	w1, #0x1                   	// #1
    5930:	aa1503e0 	mov	x0, x21
    5934:	b9003be3 	str	w3, [sp, #56]
    5938:	9400021a 	bl	61a0 <new_ipc_msg>
    593c:	aa0003f3 	mov	x19, x0
    5940:	aa1403e0 	mov	x0, x20
    5944:	940008df 	bl	7cc0 <strlen>
    5948:	aa1403e2 	mov	x2, x20
    594c:	11000403 	add	w3, w0, #0x1
    5950:	52800001 	mov	w1, #0x0                   	// #0
    5954:	aa1303e0 	mov	x0, x19
    5958:	94000252 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    595c:	52800060 	mov	w0, #0x3                   	// #3
    5960:	39000660 	strb	w0, [x19, #1]
    5964:	aa1303e0 	mov	x0, x19
    5968:	940002be 	bl	6460 <ipc_msg_send_wait>
    596c:	aa1403e0 	mov	x0, x20
    5970:	940008d4 	bl	7cc0 <strlen>
    5974:	aa1403e2 	mov	x2, x20
    5978:	11000403 	add	w3, w0, #0x1
    597c:	52800001 	mov	w1, #0x0                   	// #0
    5980:	aa1303e0 	mov	x0, x19
    5984:	9400027f 	bl	6380 <ipc_msg_get_nth_arg>
    5988:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    598c:	39400260 	ldrb	w0, [x19]
    5990:	36080280 	tbz	w0, #1, 59e0 <mkdir+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5994:	91002261 	add	x1, x19, #0x8
    5998:	d2800082 	mov	x2, #0x4                   	// #4
    599c:	9100e3e0 	add	x0, sp, #0x38
    59a0:	94000778 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    59a4:	b9800aa0 	ldrsw	x0, [x21, #8]
    59a8:	f9400aa1 	ldr	x1, [x21, #16]
    59ac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    59b0:	38606820 	ldrb	w0, [x1, x0]
    59b4:	36100080 	tbz	w0, #2, 59c4 <mkdir+0xc4>
    return session_free_buf(session, msg->header.len);
    59b8:	79400441 	ldrh	w1, [x2, #2]
    59bc:	aa1503e0 	mov	x0, x21
    59c0:	940003b4 	bl	6890 <session_free_buf>
    59c4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_mkdir)(session, path);
}
    59c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    59cc:	f94013f5 	ldr	x21, [sp, #32]
    59d0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    59d4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    59d8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    59dc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    59e0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    59e4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    59e8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    59ec:	91366063 	add	x3, x3, #0xd98
    59f0:	91380042 	add	x2, x2, #0xe00
    59f4:	9136c000 	add	x0, x0, #0xdb0
    59f8:	52800fc1 	mov	w1, #0x7e                  	// #126
    59fc:	940006c1 	bl	7500 <__assert_func>

0000000000005a00 <rm>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    5a00:	b40006c0 	cbz	x0, 5ad8 <rm+0xd8>
int rm(struct Session* session, char* path)
{
    5a04:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5a08:	910003fd 	mov	x29, sp
    5a0c:	a90153f3 	stp	x19, x20, [sp, #16]
    5a10:	aa0103f4 	mov	x20, x1
    5a14:	f90013f5 	str	x21, [sp, #32]
    5a18:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    5a1c:	aa0103e0 	mov	x0, x1
    5a20:	940008a8 	bl	7cc0 <strlen>
    5a24:	11000403 	add	w3, w0, #0x1
    5a28:	9100e3e2 	add	x2, sp, #0x38
    5a2c:	52800021 	mov	w1, #0x1                   	// #1
    5a30:	aa1503e0 	mov	x0, x21
    5a34:	b9003be3 	str	w3, [sp, #56]
    5a38:	940001da 	bl	61a0 <new_ipc_msg>
    5a3c:	aa0003f3 	mov	x19, x0
    5a40:	aa1403e0 	mov	x0, x20
    5a44:	9400089f 	bl	7cc0 <strlen>
    5a48:	aa1403e2 	mov	x2, x20
    5a4c:	11000403 	add	w3, w0, #0x1
    5a50:	52800001 	mov	w1, #0x0                   	// #0
    5a54:	aa1303e0 	mov	x0, x19
    5a58:	94000212 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5a5c:	52800080 	mov	w0, #0x4                   	// #4
    5a60:	39000660 	strb	w0, [x19, #1]
    5a64:	aa1303e0 	mov	x0, x19
    5a68:	9400027e 	bl	6460 <ipc_msg_send_wait>
    5a6c:	aa1403e0 	mov	x0, x20
    5a70:	94000894 	bl	7cc0 <strlen>
    5a74:	aa1403e2 	mov	x2, x20
    5a78:	11000403 	add	w3, w0, #0x1
    5a7c:	52800001 	mov	w1, #0x0                   	// #0
    5a80:	aa1303e0 	mov	x0, x19
    5a84:	9400023f 	bl	6380 <ipc_msg_get_nth_arg>
    5a88:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    5a8c:	39400260 	ldrb	w0, [x19]
    5a90:	36080280 	tbz	w0, #1, 5ae0 <rm+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5a94:	91002261 	add	x1, x19, #0x8
    5a98:	d2800082 	mov	x2, #0x4                   	// #4
    5a9c:	9100e3e0 	add	x0, sp, #0x38
    5aa0:	94000738 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    5aa4:	b9800aa0 	ldrsw	x0, [x21, #8]
    5aa8:	f9400aa1 	ldr	x1, [x21, #16]
    5aac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    5ab0:	38606820 	ldrb	w0, [x1, x0]
    5ab4:	36100080 	tbz	w0, #2, 5ac4 <rm+0xc4>
    return session_free_buf(session, msg->header.len);
    5ab8:	79400441 	ldrh	w1, [x2, #2]
    5abc:	aa1503e0 	mov	x0, x21
    5ac0:	94000374 	bl	6890 <session_free_buf>
    5ac4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_delete)(session, path);
}
    5ac8:	a94153f3 	ldp	x19, x20, [sp, #16]
    5acc:	f94013f5 	ldr	x21, [sp, #32]
    5ad0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    5ad4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    5ad8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    5adc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    5ae0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    5ae4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5ae8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5aec:	91366063 	add	x3, x3, #0xd98
    5af0:	91380042 	add	x2, x2, #0xe00
    5af4:	9136c000 	add	x0, x0, #0xdb0
    5af8:	52800fc1 	mov	w1, #0x7e                  	// #126
    5afc:	94000681 	bl	7500 <__assert_func>

0000000000005b00 <cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    5b00:	b40006c0 	cbz	x0, 5bd8 <cat+0xd8>
int cat(struct Session* session, char* path)
{
    5b04:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5b08:	910003fd 	mov	x29, sp
    5b0c:	a90153f3 	stp	x19, x20, [sp, #16]
    5b10:	aa0103f4 	mov	x20, x1
    5b14:	f90013f5 	str	x21, [sp, #32]
    5b18:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    5b1c:	aa0103e0 	mov	x0, x1
    5b20:	94000868 	bl	7cc0 <strlen>
    5b24:	11000403 	add	w3, w0, #0x1
    5b28:	9100e3e2 	add	x2, sp, #0x38
    5b2c:	52800021 	mov	w1, #0x1                   	// #1
    5b30:	aa1503e0 	mov	x0, x21
    5b34:	b9003be3 	str	w3, [sp, #56]
    5b38:	9400019a 	bl	61a0 <new_ipc_msg>
    5b3c:	aa0003f3 	mov	x19, x0
    5b40:	aa1403e0 	mov	x0, x20
    5b44:	9400085f 	bl	7cc0 <strlen>
    5b48:	aa1403e2 	mov	x2, x20
    5b4c:	11000403 	add	w3, w0, #0x1
    5b50:	52800001 	mov	w1, #0x0                   	// #0
    5b54:	aa1303e0 	mov	x0, x19
    5b58:	940001d2 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5b5c:	528000a0 	mov	w0, #0x5                   	// #5
    5b60:	39000660 	strb	w0, [x19, #1]
    5b64:	aa1303e0 	mov	x0, x19
    5b68:	9400023e 	bl	6460 <ipc_msg_send_wait>
    5b6c:	aa1403e0 	mov	x0, x20
    5b70:	94000854 	bl	7cc0 <strlen>
    5b74:	aa1403e2 	mov	x2, x20
    5b78:	11000403 	add	w3, w0, #0x1
    5b7c:	52800001 	mov	w1, #0x0                   	// #0
    5b80:	aa1303e0 	mov	x0, x19
    5b84:	940001ff 	bl	6380 <ipc_msg_get_nth_arg>
    5b88:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    5b8c:	39400260 	ldrb	w0, [x19]
    5b90:	36080280 	tbz	w0, #1, 5be0 <cat+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5b94:	91002261 	add	x1, x19, #0x8
    5b98:	d2800082 	mov	x2, #0x4                   	// #4
    5b9c:	9100e3e0 	add	x0, sp, #0x38
    5ba0:	940006f8 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    5ba4:	b9800aa0 	ldrsw	x0, [x21, #8]
    5ba8:	f9400aa1 	ldr	x1, [x21, #16]
    5bac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    5bb0:	38606820 	ldrb	w0, [x1, x0]
    5bb4:	36100080 	tbz	w0, #2, 5bc4 <cat+0xc4>
    return session_free_buf(session, msg->header.len);
    5bb8:	79400441 	ldrh	w1, [x2, #2]
    5bbc:	aa1503e0 	mov	x0, x21
    5bc0:	94000334 	bl	6890 <session_free_buf>
    5bc4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cat)(session, path);
}
    5bc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    5bcc:	f94013f5 	ldr	x21, [sp, #32]
    5bd0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    5bd4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    5bd8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    5bdc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    5be0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    5be4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5be8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5bec:	91366063 	add	x3, x3, #0xd98
    5bf0:	91380042 	add	x2, x2, #0xe00
    5bf4:	9136c000 	add	x0, x0, #0xdb0
    5bf8:	52800fc1 	mov	w1, #0x7e                  	// #126
    5bfc:	94000641 	bl	7500 <__assert_func>

0000000000005c00 <open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    5c00:	b40006c0 	cbz	x0, 5cd8 <open+0xd8>
int open(struct Session* session, char* path)
{
    5c04:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    5c08:	910003fd 	mov	x29, sp
    5c0c:	a90153f3 	stp	x19, x20, [sp, #16]
    5c10:	aa0103f4 	mov	x20, x1
    5c14:	f90013f5 	str	x21, [sp, #32]
    5c18:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    5c1c:	aa0103e0 	mov	x0, x1
    5c20:	94000828 	bl	7cc0 <strlen>
    5c24:	11000403 	add	w3, w0, #0x1
    5c28:	9100e3e2 	add	x2, sp, #0x38
    5c2c:	52800021 	mov	w1, #0x1                   	// #1
    5c30:	aa1503e0 	mov	x0, x21
    5c34:	b9003be3 	str	w3, [sp, #56]
    5c38:	9400015a 	bl	61a0 <new_ipc_msg>
    5c3c:	aa0003f3 	mov	x19, x0
    5c40:	aa1403e0 	mov	x0, x20
    5c44:	9400081f 	bl	7cc0 <strlen>
    5c48:	aa1403e2 	mov	x2, x20
    5c4c:	11000403 	add	w3, w0, #0x1
    5c50:	52800001 	mov	w1, #0x0                   	// #0
    5c54:	aa1303e0 	mov	x0, x19
    5c58:	94000192 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5c5c:	528000c0 	mov	w0, #0x6                   	// #6
    5c60:	39000660 	strb	w0, [x19, #1]
    5c64:	aa1303e0 	mov	x0, x19
    5c68:	940001fe 	bl	6460 <ipc_msg_send_wait>
    5c6c:	aa1403e0 	mov	x0, x20
    5c70:	94000814 	bl	7cc0 <strlen>
    5c74:	aa1403e2 	mov	x2, x20
    5c78:	11000403 	add	w3, w0, #0x1
    5c7c:	52800001 	mov	w1, #0x0                   	// #0
    5c80:	aa1303e0 	mov	x0, x19
    5c84:	940001bf 	bl	6380 <ipc_msg_get_nth_arg>
    5c88:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    5c8c:	39400260 	ldrb	w0, [x19]
    5c90:	36080280 	tbz	w0, #1, 5ce0 <open+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5c94:	91002261 	add	x1, x19, #0x8
    5c98:	d2800082 	mov	x2, #0x4                   	// #4
    5c9c:	9100e3e0 	add	x0, sp, #0x38
    5ca0:	940006b8 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    5ca4:	b9800aa0 	ldrsw	x0, [x21, #8]
    5ca8:	f9400aa1 	ldr	x1, [x21, #16]
    5cac:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    5cb0:	38606820 	ldrb	w0, [x1, x0]
    5cb4:	36100080 	tbz	w0, #2, 5cc4 <open+0xc4>
    return session_free_buf(session, msg->header.len);
    5cb8:	79400441 	ldrh	w1, [x2, #2]
    5cbc:	aa1503e0 	mov	x0, x21
    5cc0:	940002f4 	bl	6890 <session_free_buf>
    5cc4:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_open)(session, path);
}
    5cc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    5ccc:	f94013f5 	ldr	x21, [sp, #32]
    5cd0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    5cd4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    5cd8:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    5cdc:	d65f03c0 	ret
    assert(msg->header.done == 1);
    5ce0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    5ce4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5ce8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5cec:	91366063 	add	x3, x3, #0xd98
    5cf0:	91380042 	add	x2, x2, #0xe00
    5cf4:	9136c000 	add	x0, x0, #0xdb0
    5cf8:	52800fc1 	mov	w1, #0x7e                  	// #126
    5cfc:	94000601 	bl	7500 <__assert_func>

0000000000005d00 <close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
int close(struct Session* session, int fd)
{
    5d00:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    5d04:	910003fd 	mov	x29, sp
    5d08:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    5d0c:	b4000560 	cbz	x0, 5db8 <close+0xb8>
    5d10:	910123e2 	add	x2, sp, #0x48
    5d14:	52800021 	mov	w1, #0x1                   	// #1
    5d18:	a90153f3 	stp	x19, x20, [sp, #16]
    5d1c:	aa0003f4 	mov	x20, x0
    5d20:	f90013f5 	str	x21, [sp, #32]
    5d24:	52800095 	mov	w21, #0x4                   	// #4
    5d28:	b9004bf5 	str	w21, [sp, #72]
    5d2c:	9400011d 	bl	61a0 <new_ipc_msg>
    5d30:	aa0003f3 	mov	x19, x0
    5d34:	2a1503e3 	mov	w3, w21
    5d38:	9100f3e2 	add	x2, sp, #0x3c
    5d3c:	52800001 	mov	w1, #0x0                   	// #0
    5d40:	94000158 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5d44:	528000e0 	mov	w0, #0x7                   	// #7
    5d48:	39000660 	strb	w0, [x19, #1]
    5d4c:	aa1303e0 	mov	x0, x19
    5d50:	940001c4 	bl	6460 <ipc_msg_send_wait>
    5d54:	2a1503e3 	mov	w3, w21
    5d58:	9100f3e2 	add	x2, sp, #0x3c
    5d5c:	aa1303e0 	mov	x0, x19
    5d60:	52800001 	mov	w1, #0x0                   	// #0
    5d64:	94000187 	bl	6380 <ipc_msg_get_nth_arg>
    5d68:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    5d6c:	39400260 	ldrb	w0, [x19]
    5d70:	36080280 	tbz	w0, #1, 5dc0 <close+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5d74:	91002261 	add	x1, x19, #0x8
    5d78:	d2800082 	mov	x2, #0x4                   	// #4
    5d7c:	910123e0 	add	x0, sp, #0x48
    5d80:	94000680 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    5d84:	b9800a80 	ldrsw	x0, [x20, #8]
    5d88:	f9400a81 	ldr	x1, [x20, #16]
    5d8c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    5d90:	38606820 	ldrb	w0, [x1, x0]
    5d94:	36100080 	tbz	w0, #2, 5da4 <close+0xa4>
    return session_free_buf(session, msg->header.len);
    5d98:	79400441 	ldrh	w1, [x2, #2]
    5d9c:	aa1403e0 	mov	x0, x20
    5da0:	940002bc 	bl	6890 <session_free_buf>
    5da4:	a94153f3 	ldp	x19, x20, [sp, #16]
    5da8:	b9404be0 	ldr	w0, [sp, #72]
    5dac:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_close)(session, &fd);
}
    5db0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    5db4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    5db8:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_close)(session, &fd);
    5dbc:	17fffffd 	b	5db0 <close+0xb0>
    assert(msg->header.done == 1);
    5dc0:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    5dc4:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5dc8:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5dcc:	91366063 	add	x3, x3, #0xd98
    5dd0:	91380042 	add	x2, x2, #0xe00
    5dd4:	9136c000 	add	x0, x0, #0xdb0
    5dd8:	52800fc1 	mov	w1, #0x7e                  	// #126
    5ddc:	940005c9 	bl	7500 <__assert_func>

0000000000005de0 <read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    5de0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    5de4:	910003fd 	mov	x29, sp
    5de8:	29068fe4 	stp	w4, w3, [sp, #52]
    5dec:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    5df0:	b4000980 	cbz	x0, 5f20 <read+0x140>
    5df4:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    5df8:	a90153f3 	stp	x19, x20, [sp, #16]
    5dfc:	52800094 	mov	w20, #0x4                   	// #4
    5e00:	2a1403e1 	mov	w1, w20
    5e04:	a9025bf5 	stp	x21, x22, [sp, #32]
    5e08:	aa0203f6 	mov	x22, x2
    5e0c:	aa0003f5 	mov	x21, x0
    5e10:	910103e2 	add	x2, sp, #0x40
    5e14:	290813f4 	stp	w20, w4, [sp, #64]
    5e18:	f90027e3 	str	x3, [sp, #72]
    5e1c:	940000e1 	bl	61a0 <new_ipc_msg>
    5e20:	2a1403e3 	mov	w3, w20
    5e24:	aa0003f3 	mov	x19, x0
    5e28:	9100f3e2 	add	x2, sp, #0x3c
    5e2c:	52800001 	mov	w1, #0x0                   	// #0
    5e30:	9400011c 	bl	62a0 <ipc_msg_set_nth_arg>
    5e34:	b94037e3 	ldr	w3, [sp, #52]
    5e38:	aa1603e2 	mov	x2, x22
    5e3c:	52800021 	mov	w1, #0x1                   	// #1
    5e40:	aa1303e0 	mov	x0, x19
    5e44:	94000117 	bl	62a0 <ipc_msg_set_nth_arg>
    5e48:	2a1403e3 	mov	w3, w20
    5e4c:	9100e3e2 	add	x2, sp, #0x38
    5e50:	52800041 	mov	w1, #0x2                   	// #2
    5e54:	aa1303e0 	mov	x0, x19
    5e58:	94000112 	bl	62a0 <ipc_msg_set_nth_arg>
    5e5c:	2a1403e3 	mov	w3, w20
    5e60:	9100d3e2 	add	x2, sp, #0x34
    5e64:	52800061 	mov	w1, #0x3                   	// #3
    5e68:	aa1303e0 	mov	x0, x19
    5e6c:	9400010d 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5e70:	52800100 	mov	w0, #0x8                   	// #8
    5e74:	39000660 	strb	w0, [x19, #1]
    5e78:	aa1303e0 	mov	x0, x19
    5e7c:	94000179 	bl	6460 <ipc_msg_send_wait>
    5e80:	2a1403e3 	mov	w3, w20
    5e84:	9100f3e2 	add	x2, sp, #0x3c
    5e88:	52800001 	mov	w1, #0x0                   	// #0
    5e8c:	aa1303e0 	mov	x0, x19
    5e90:	9400013c 	bl	6380 <ipc_msg_get_nth_arg>
    5e94:	b94037e3 	ldr	w3, [sp, #52]
    5e98:	aa1603e2 	mov	x2, x22
    5e9c:	52800021 	mov	w1, #0x1                   	// #1
    5ea0:	aa1303e0 	mov	x0, x19
    5ea4:	94000137 	bl	6380 <ipc_msg_get_nth_arg>
    5ea8:	2a1403e3 	mov	w3, w20
    5eac:	9100e3e2 	add	x2, sp, #0x38
    5eb0:	52800041 	mov	w1, #0x2                   	// #2
    5eb4:	aa1303e0 	mov	x0, x19
    5eb8:	94000132 	bl	6380 <ipc_msg_get_nth_arg>
    5ebc:	2a1403e3 	mov	w3, w20
    5ec0:	9100d3e2 	add	x2, sp, #0x34
    5ec4:	aa1303e0 	mov	x0, x19
    5ec8:	52800061 	mov	w1, #0x3                   	// #3
    5ecc:	9400012d 	bl	6380 <ipc_msg_get_nth_arg>
    5ed0:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    5ed4:	39400260 	ldrb	w0, [x19]
    5ed8:	36080280 	tbz	w0, #1, 5f28 <read+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    5edc:	91002261 	add	x1, x19, #0x8
    5ee0:	d2800082 	mov	x2, #0x4                   	// #4
    5ee4:	910103e0 	add	x0, sp, #0x40
    5ee8:	94000626 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    5eec:	b9800aa0 	ldrsw	x0, [x21, #8]
    5ef0:	f9400aa1 	ldr	x1, [x21, #16]
    5ef4:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    5ef8:	38606820 	ldrb	w0, [x1, x0]
    5efc:	36100080 	tbz	w0, #2, 5f0c <read+0x12c>
    return session_free_buf(session, msg->header.len);
    5f00:	79400441 	ldrh	w1, [x2, #2]
    5f04:	aa1503e0 	mov	x0, x21
    5f08:	94000262 	bl	6890 <session_free_buf>
    5f0c:	a94153f3 	ldp	x19, x20, [sp, #16]
    5f10:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5f14:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
}
    5f18:	a8c57bfd 	ldp	x29, x30, [sp], #80
    5f1c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    5f20:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    5f24:	17fffffd 	b	5f18 <read+0x138>
    assert(msg->header.done == 1);
    5f28:	d0000043 	adrp	x3, f000 <_fstat_r+0x40>
    5f2c:	d0000042 	adrp	x2, f000 <_fstat_r+0x40>
    5f30:	d0000040 	adrp	x0, f000 <_fstat_r+0x40>
    5f34:	91366063 	add	x3, x3, #0xd98
    5f38:	91380042 	add	x2, x2, #0xe00
    5f3c:	9136c000 	add	x0, x0, #0xdb0
    5f40:	52800fc1 	mov	w1, #0x7e                  	// #126
    5f44:	9400056f 	bl	7500 <__assert_func>
    5f48:	d503201f 	nop
    5f4c:	d503201f 	nop

0000000000005f50 <write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    5f50:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    5f54:	910003fd 	mov	x29, sp
    5f58:	29068fe4 	stp	w4, w3, [sp, #52]
    5f5c:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    5f60:	b4000980 	cbz	x0, 6090 <write+0x140>
    5f64:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    5f68:	a90153f3 	stp	x19, x20, [sp, #16]
    5f6c:	52800094 	mov	w20, #0x4                   	// #4
    5f70:	2a1403e1 	mov	w1, w20
    5f74:	a9025bf5 	stp	x21, x22, [sp, #32]
    5f78:	aa0203f6 	mov	x22, x2
    5f7c:	aa0003f5 	mov	x21, x0
    5f80:	910103e2 	add	x2, sp, #0x40
    5f84:	290813f4 	stp	w20, w4, [sp, #64]
    5f88:	f90027e3 	str	x3, [sp, #72]
    5f8c:	94000085 	bl	61a0 <new_ipc_msg>
    5f90:	2a1403e3 	mov	w3, w20
    5f94:	aa0003f3 	mov	x19, x0
    5f98:	9100f3e2 	add	x2, sp, #0x3c
    5f9c:	52800001 	mov	w1, #0x0                   	// #0
    5fa0:	940000c0 	bl	62a0 <ipc_msg_set_nth_arg>
    5fa4:	b94037e3 	ldr	w3, [sp, #52]
    5fa8:	aa1603e2 	mov	x2, x22
    5fac:	52800021 	mov	w1, #0x1                   	// #1
    5fb0:	aa1303e0 	mov	x0, x19
    5fb4:	940000bb 	bl	62a0 <ipc_msg_set_nth_arg>
    5fb8:	2a1403e3 	mov	w3, w20
    5fbc:	9100e3e2 	add	x2, sp, #0x38
    5fc0:	52800041 	mov	w1, #0x2                   	// #2
    5fc4:	aa1303e0 	mov	x0, x19
    5fc8:	940000b6 	bl	62a0 <ipc_msg_set_nth_arg>
    5fcc:	2a1403e3 	mov	w3, w20
    5fd0:	9100d3e2 	add	x2, sp, #0x34
    5fd4:	52800061 	mov	w1, #0x3                   	// #3
    5fd8:	aa1303e0 	mov	x0, x19
    5fdc:	940000b1 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    5fe0:	52800120 	mov	w0, #0x9                   	// #9
    5fe4:	39000660 	strb	w0, [x19, #1]
    5fe8:	aa1303e0 	mov	x0, x19
    5fec:	9400011d 	bl	6460 <ipc_msg_send_wait>
    5ff0:	2a1403e3 	mov	w3, w20
    5ff4:	9100f3e2 	add	x2, sp, #0x3c
    5ff8:	52800001 	mov	w1, #0x0                   	// #0
    5ffc:	aa1303e0 	mov	x0, x19
    6000:	940000e0 	bl	6380 <ipc_msg_get_nth_arg>
    6004:	b94037e3 	ldr	w3, [sp, #52]
    6008:	aa1603e2 	mov	x2, x22
    600c:	52800021 	mov	w1, #0x1                   	// #1
    6010:	aa1303e0 	mov	x0, x19
    6014:	940000db 	bl	6380 <ipc_msg_get_nth_arg>
    6018:	2a1403e3 	mov	w3, w20
    601c:	9100e3e2 	add	x2, sp, #0x38
    6020:	52800041 	mov	w1, #0x2                   	// #2
    6024:	aa1303e0 	mov	x0, x19
    6028:	940000d6 	bl	6380 <ipc_msg_get_nth_arg>
    602c:	2a1403e3 	mov	w3, w20
    6030:	9100d3e2 	add	x2, sp, #0x34
    6034:	aa1303e0 	mov	x0, x19
    6038:	52800061 	mov	w1, #0x3                   	// #3
    603c:	940000d1 	bl	6380 <ipc_msg_get_nth_arg>
    6040:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    6044:	39400260 	ldrb	w0, [x19]
    6048:	36080280 	tbz	w0, #1, 6098 <write+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    604c:	91002261 	add	x1, x19, #0x8
    6050:	d2800082 	mov	x2, #0x4                   	// #4
    6054:	910103e0 	add	x0, sp, #0x40
    6058:	940005ca 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    605c:	b9800aa0 	ldrsw	x0, [x21, #8]
    6060:	f9400aa1 	ldr	x1, [x21, #16]
    6064:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    6068:	38606820 	ldrb	w0, [x1, x0]
    606c:	36100080 	tbz	w0, #2, 607c <write+0x12c>
    return session_free_buf(session, msg->header.len);
    6070:	79400441 	ldrh	w1, [x2, #2]
    6074:	aa1503e0 	mov	x0, x21
    6078:	94000206 	bl	6890 <session_free_buf>
    607c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6080:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6084:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
}
    6088:	a8c57bfd 	ldp	x29, x30, [sp], #80
    608c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    6090:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    6094:	17fffffd 	b	6088 <write+0x138>
    assert(msg->header.done == 1);
    6098:	b0000043 	adrp	x3, f000 <_fstat_r+0x40>
    609c:	b0000042 	adrp	x2, f000 <_fstat_r+0x40>
    60a0:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    60a4:	91366063 	add	x3, x3, #0xd98
    60a8:	91380042 	add	x2, x2, #0xe00
    60ac:	9136c000 	add	x0, x0, #0xdb0
    60b0:	52800fc1 	mov	w1, #0x7e                  	// #126
    60b4:	94000513 	bl	7500 <__assert_func>
    60b8:	d503201f 	nop
    60bc:	d503201f 	nop

00000000000060c0 <fsize>:

IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
int fsize(struct Session* session, int fd)
{
    60c0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    60c4:	910003fd 	mov	x29, sp
    60c8:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    60cc:	b4000560 	cbz	x0, 6178 <fsize+0xb8>
    60d0:	910123e2 	add	x2, sp, #0x48
    60d4:	52800021 	mov	w1, #0x1                   	// #1
    60d8:	a90153f3 	stp	x19, x20, [sp, #16]
    60dc:	aa0003f4 	mov	x20, x0
    60e0:	f90013f5 	str	x21, [sp, #32]
    60e4:	52800095 	mov	w21, #0x4                   	// #4
    60e8:	b9004bf5 	str	w21, [sp, #72]
    60ec:	9400002d 	bl	61a0 <new_ipc_msg>
    60f0:	aa0003f3 	mov	x19, x0
    60f4:	2a1503e3 	mov	w3, w21
    60f8:	9100f3e2 	add	x2, sp, #0x3c
    60fc:	52800001 	mov	w1, #0x0                   	// #0
    6100:	94000068 	bl	62a0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    6104:	52800140 	mov	w0, #0xa                   	// #10
    6108:	39000660 	strb	w0, [x19, #1]
    610c:	aa1303e0 	mov	x0, x19
    6110:	940000d4 	bl	6460 <ipc_msg_send_wait>
    6114:	2a1503e3 	mov	w3, w21
    6118:	9100f3e2 	add	x2, sp, #0x3c
    611c:	aa1303e0 	mov	x0, x19
    6120:	52800001 	mov	w1, #0x0                   	// #0
    6124:	94000097 	bl	6380 <ipc_msg_get_nth_arg>
    6128:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    612c:	39400260 	ldrb	w0, [x19]
    6130:	36080280 	tbz	w0, #1, 6180 <fsize+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    6134:	91002261 	add	x1, x19, #0x8
    6138:	d2800082 	mov	x2, #0x4                   	// #4
    613c:	910123e0 	add	x0, sp, #0x48
    6140:	94000590 	bl	7780 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    6144:	b9800a80 	ldrsw	x0, [x20, #8]
    6148:	f9400a81 	ldr	x1, [x20, #16]
    614c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    6150:	38606820 	ldrb	w0, [x1, x0]
    6154:	36100080 	tbz	w0, #2, 6164 <fsize+0xa4>
    return session_free_buf(session, msg->header.len);
    6158:	79400441 	ldrh	w1, [x2, #2]
    615c:	aa1403e0 	mov	x0, x20
    6160:	940001cc 	bl	6890 <session_free_buf>
    6164:	a94153f3 	ldp	x19, x20, [sp, #16]
    6168:	b9404be0 	ldr	w0, [sp, #72]
    616c:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_fsize)(session, &fd);
    6170:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6174:	d65f03c0 	ret
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    6178:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_fsize)(session, &fd);
    617c:	17fffffd 	b	6170 <fsize+0xb0>
    assert(msg->header.done == 1);
    6180:	b0000043 	adrp	x3, f000 <_fstat_r+0x40>
    6184:	b0000042 	adrp	x2, f000 <_fstat_r+0x40>
    6188:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    618c:	91366063 	add	x3, x3, #0xd98
    6190:	91380042 	add	x2, x2, #0xe00
    6194:	9136c000 	add	x0, x0, #0xdb0
    6198:	52800fc1 	mov	w1, #0x7e                  	// #126
    619c:	940004d9 	bl	7500 <__assert_func>

00000000000061a0 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    61a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    61a4:	7100003f 	cmp	w1, #0x0
{
    61a8:	910003fd 	mov	x29, sp
    61ac:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    61b0:	528000d4 	mov	w20, #0x6                   	// #6
    61b4:	1b147c34 	mul	w20, w1, w20
{
    61b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    61bc:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    61c0:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    61c4:	5400056d 	b.le	6270 <new_ipc_msg+0xd0>
    61c8:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    61cc:	2a1403f6 	mov	w22, w20
    61d0:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    61d4:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    61d8:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    61dc:	91000442 	add	x2, x2, #0x1
    61e0:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    61e4:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    61e8:	54ffff8c 	b.gt	61d8 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    61ec:	aa0303e0 	mov	x0, x3
    61f0:	2a1603e1 	mov	w1, w22
    61f4:	9400016f 	bl	67b0 <session_alloc_buf>
    if (buf == NULL) {
    61f8:	b40004c0 	cbz	x0, 6290 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    61fc:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    6200:	39400001 	ldrb	w1, [x0]
    6204:	52800182 	mov	w2, #0xc                   	// #12
    6208:	aa1303e3 	mov	x3, x19
    620c:	1b057ea5 	mul	w5, w21, w5
    6210:	121e7421 	and	w1, w1, #0xfffffffc
    6214:	39000001 	strb	w1, [x0]
    6218:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    621c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    6220:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    6224:	b9400064 	ldr	w4, [x3]
    6228:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    622c:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    6230:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    6234:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    6238:	b8404461 	ldr	w1, [x3], #4
    623c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    6240:	54ffff01 	b.ne	6220 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    6244:	39400002 	ldrb	w2, [x0]
    6248:	531c0ea1 	ubfiz	w1, w21, #4, #4
    624c:	321e0021 	orr	w1, w1, #0x4
    6250:	52800163 	mov	w3, #0xb                   	// #11
    6254:	0a030042 	and	w2, w2, w3
    6258:	2a020021 	orr	w1, w1, w2
    625c:	39000001 	strb	w1, [x0]
    return buf;
}
    6260:	a94153f3 	ldp	x19, x20, [sp, #16]
    6264:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6268:	a8c37bfd 	ldp	x29, x30, [sp], #48
    626c:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    6270:	2a1403e1 	mov	w1, w20
    6274:	9400014f 	bl	67b0 <session_alloc_buf>
    if (buf == NULL) {
    6278:	b40000c0 	cbz	x0, 6290 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    627c:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    6280:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    6284:	121e7421 	and	w1, w1, #0xfffffffc
    6288:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    628c:	17ffffee 	b	6244 <new_ipc_msg+0xa4>
        return NULL;
    6290:	d2800000 	mov	x0, #0x0                   	// #0
    6294:	17fffff3 	b	6260 <new_ipc_msg+0xc0>
    6298:	d503201f 	nop
    629c:	d503201f 	nop

00000000000062a0 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    62a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    62a4:	2a0103e4 	mov	w4, w1
    62a8:	aa0203e1 	mov	x1, x2
    62ac:	910003fd 	mov	x29, sp
    62b0:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    62b4:	39400003 	ldrb	w3, [x0]
    62b8:	d3441c63 	ubfx	x3, x3, #4, #4
    62bc:	6b04007f 	cmp	w3, w4
    62c0:	540003ad 	b.le	6334 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    62c4:	528000c5 	mov	w5, #0x6                   	// #6
    62c8:	d2800183 	mov	x3, #0xc                   	// #12
    62cc:	9b250c84 	smaddl	x4, w4, w5, x3
    62d0:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    62d4:	794004a3 	ldrh	w3, [x5, #2]
    62d8:	37f801e2 	tbnz	w2, #31, 6314 <ipc_msg_set_nth_arg+0x74>
    62dc:	6b02007f 	cmp	w3, w2
    62e0:	540001a3 	b.cc	6314 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    62e4:	394010a3 	ldrb	w3, [x5, #4]
    62e8:	37000423 	tbnz	w3, #0, 636c <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    62ec:	78646803 	ldrh	w3, [x0, x4]
    62f0:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    62f4:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    62f8:	b4000301 	cbz	x1, 6358 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    62fc:	121f7863 	and	w3, w3, #0xfffffffe
    6300:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    6304:	9400057f 	bl	7900 <memmove>
    return true;
    6308:	52800020 	mov	w0, #0x1                   	// #1
}
    630c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6310:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    6314:	b0000041 	adrp	x1, f000 <_fstat_r+0x40>
    6318:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    631c:	913e0021 	add	x1, x1, #0xf80
    6320:	91396000 	add	x0, x0, #0xe58
    6324:	97ffee7b 	bl	1d10 <printf>
        return false;
    6328:	52800000 	mov	w0, #0x0                   	// #0
}
    632c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6330:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    6334:	2a0403e2 	mov	w2, w4
    6338:	b0000041 	adrp	x1, f000 <_fstat_r+0x40>
    633c:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    6340:	913e0021 	add	x1, x1, #0xf80
    6344:	91386000 	add	x0, x0, #0xe18
    6348:	97ffee72 	bl	1d10 <printf>
        return false;
    634c:	52800000 	mov	w0, #0x0                   	// #0
}
    6350:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6354:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    6358:	32000063 	orr	w3, w3, #0x1
    635c:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    6360:	94000598 	bl	79c0 <memset>
        return true;
    6364:	52800020 	mov	w0, #0x1                   	// #1
    6368:	17ffffe9 	b	630c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    636c:	d2800000 	mov	x0, #0x0                   	// #0
    6370:	17ffffe1 	b	62f4 <ipc_msg_set_nth_arg+0x54>
    6374:	d503201f 	nop
    6378:	d503201f 	nop
    637c:	d503201f 	nop

0000000000006380 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    6380:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6384:	aa0003e4 	mov	x4, x0
    6388:	910003fd 	mov	x29, sp
    638c:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    6390:	39400005 	ldrb	w5, [x0]
    6394:	d3441ca5 	ubfx	x5, x5, #4, #4
    6398:	6b0100bf 	cmp	w5, w1
    639c:	5400030d 	b.le	63fc <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    63a0:	528000c5 	mov	w5, #0x6                   	// #6
    63a4:	aa0203e0 	mov	x0, x2
    63a8:	d2800182 	mov	x2, #0xc                   	// #12
    63ac:	9b250821 	smaddl	x1, w1, w5, x2
    63b0:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    63b4:	79400445 	ldrh	w5, [x2, #2]
    63b8:	6b0300bf 	cmp	w5, w3
    63bc:	5400036b 	b.lt	6428 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    63c0:	39401042 	ldrb	w2, [x2, #4]
        return true;
    63c4:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    63c8:	360000a2 	tbz	w2, #0, 63dc <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    63cc:	2a1303e0 	mov	w0, w19
    63d0:	f9400bf3 	ldr	x19, [sp, #16]
    63d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    63d8:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    63dc:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    63e0:	93407c62 	sxtw	x2, w3
    63e4:	8b010081 	add	x1, x4, x1
    63e8:	94000546 	bl	7900 <memmove>
}
    63ec:	2a1303e0 	mov	w0, w19
    63f0:	f9400bf3 	ldr	x19, [sp, #16]
    63f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    63f8:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    63fc:	b0000041 	adrp	x1, f000 <_fstat_r+0x40>
    6400:	913e0021 	add	x1, x1, #0xf80
    6404:	91006021 	add	x1, x1, #0x18
        return false;
    6408:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    640c:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    6410:	913a8000 	add	x0, x0, #0xea0
    6414:	97ffee3f 	bl	1d10 <printf>
}
    6418:	2a1303e0 	mov	w0, w19
    641c:	f9400bf3 	ldr	x19, [sp, #16]
    6420:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6424:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    6428:	b0000041 	adrp	x1, f000 <_fstat_r+0x40>
    642c:	913e0021 	add	x1, x1, #0xf80
    6430:	91006021 	add	x1, x1, #0x18
        return false;
    6434:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    6438:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    643c:	913b2000 	add	x0, x0, #0xec8
    6440:	97ffee34 	bl	1d10 <printf>
}
    6444:	2a1303e0 	mov	w0, w19
    6448:	f9400bf3 	ldr	x19, [sp, #16]
    644c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6450:	d65f03c0 	ret
    6454:	d503201f 	nop
    6458:	d503201f 	nop
    645c:	d503201f 	nop

0000000000006460 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    6460:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    6464:	d2800021 	mov	x1, #0x1                   	// #1
    6468:	f2db9741 	movk	x1, #0xdcba, lsl #32
    646c:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    6470:	910003fd 	mov	x29, sp
    6474:	f9000bf3 	str	x19, [sp, #16]
    6478:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    647c:	f9400000 	ldr	x0, [x0]
    6480:	927e7400 	and	x0, x0, #0xfffffffc
    6484:	aa010000 	orr	x0, x0, x1
    6488:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    648c:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    6490:	52800040 	mov	w0, #0x2                   	// #2
    6494:	94000163 	bl	6a20 <yield>
    while (msg->header.done == 0) {
    6498:	39400261 	ldrb	w1, [x19]
    649c:	360fffa1 	tbz	w1, #1, 6490 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    64a0:	f9400bf3 	ldr	x19, [sp, #16]
    64a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    64a8:	d65f03c0 	ret
    64ac:	d503201f 	nop

00000000000064b0 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    64b0:	f9400001 	ldr	x1, [x0]
    64b4:	d2800022 	mov	x2, #0x1                   	// #1
    64b8:	f2db9742 	movk	x2, #0xdcba, lsl #32
    64bc:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    64c0:	927e7421 	and	x1, x1, #0xfffffffc
    64c4:	aa020021 	orr	x1, x1, x2
    64c8:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    64cc:	d65f03c0 	ret

00000000000064d0 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    64d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    64d4:	910003fd 	mov	x29, sp
    64d8:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    64dc:	b9800801 	ldrsw	x1, [x0, #8]
    64e0:	f9400800 	ldr	x0, [x0, #16]
    64e4:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    64e8:	38616800 	ldrb	w0, [x0, x1]
    64ec:	370800a0 	tbnz	w0, #1, 6500 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    64f0:	52800040 	mov	w0, #0x2                   	// #2
    64f4:	9400014b 	bl	6a20 <yield>
    while (msg->header.done == 0) {
    64f8:	39400260 	ldrb	w0, [x19]
    64fc:	360fffa0 	tbz	w0, #1, 64f0 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    6500:	b9400a60 	ldr	w0, [x19, #8]
    6504:	f9400bf3 	ldr	x19, [sp, #16]
    6508:	a8c27bfd 	ldp	x29, x30, [sp], #32
    650c:	d65f03c0 	ret

0000000000006510 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    6510:	d0000040 	adrp	x0, 10000 <__func__.0+0x10>
}
    6514:	b9470c00 	ldr	w0, [x0, #1804]
    6518:	d65f03c0 	ret
    651c:	d503201f 	nop

0000000000006520 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    6520:	f0000040 	adrp	x0, 11000 <__global_locale+0x180>
    6524:	52800021 	mov	w1, #0x1                   	// #1
    6528:	392ec001 	strb	w1, [x0, #2992]
}
    652c:	d65f03c0 	ret

0000000000006530 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    6530:	f0000040 	adrp	x0, 11000 <__global_locale+0x180>
}
    6534:	396ec000 	ldrb	w0, [x0, #2992]
    6538:	d65f03c0 	ret
    653c:	d503201f 	nop

0000000000006540 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    6540:	f0000040 	adrp	x0, 11000 <__global_locale+0x180>
    6544:	f945dc00 	ldr	x0, [x0, #3000]
    6548:	b4000080 	cbz	x0, 6558 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    654c:	39400000 	ldrb	w0, [x0]
    6550:	d3430c00 	ubfx	x0, x0, #3, #1
}
    6554:	d65f03c0 	ret
        return false;
    6558:	52800000 	mov	w0, #0x0                   	// #0
}
    655c:	d65f03c0 	ret

0000000000006560 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    6560:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    6564:	d2806002 	mov	x2, #0x300                 	// #768
    6568:	52800001 	mov	w1, #0x0                   	// #0
{
    656c:	a9007bfd 	stp	x29, x30, [sp]
    6570:	910003fd 	mov	x29, sp
    6574:	a90153f3 	stp	x19, x20, [sp, #16]
    6578:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    657c:	9101c3e0 	add	x0, sp, #0x70
{
    6580:	a9025bf5 	stp	x21, x22, [sp, #32]
    6584:	d0000055 	adrp	x21, 10000 <__func__.0+0x10>
    6588:	911c32b5 	add	x21, x21, #0x70c
    658c:	a90363f7 	stp	x23, x24, [sp, #48]
    6590:	b0000056 	adrp	x22, f000 <_fstat_r+0x40>
    6594:	913c82d6 	add	x22, x22, #0xf20
    6598:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    659c:	529b9754 	mov	w20, #0xdcba                	// #56506
    65a0:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    65a4:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    65a8:	94000506 	bl	79c0 <memset>
    65ac:	f0000044 	adrp	x4, 11000 <__global_locale+0x180>
    65b0:	912ec09c 	add	x28, x4, #0xbb0
    65b4:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    65b8:	913be000 	add	x0, x0, #0xef8
    65bc:	f90037e0 	str	x0, [sp, #104]
    65c0:	b000005b 	adrp	x27, f000 <_fstat_r+0x40>
    65c4:	913d2360 	add	x0, x27, #0xf48
    65c8:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    65cc:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    65d0:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    65d4:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    65d8:	52800401 	mov	w1, #0x20                  	// #32
    65dc:	94000131 	bl	6aa0 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    65e0:	9101c3fb 	add	x27, sp, #0x70
    65e4:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    65e8:	52800019 	mov	w25, #0x0                   	// #0
    65ec:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    65f0:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    65f4:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    65f8:	b4000980 	cbz	x0, 6728 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    65fc:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    6600:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    6604:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    6608:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    660c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    6610:	b9400401 	ldr	w1, [x0, #4]
    6614:	6b14003f 	cmp	w1, w20
    6618:	54000340 	b.eq	6680 <ipc_server_loop+0x120>  // b.none
    661c:	14000039 	b	6700 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    6620:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    6624:	f9400780 	ldr	x0, [x28, #8]
    6628:	39400001 	ldrb	w1, [x0]
    662c:	36080641 	tbz	w1, #1, 66f4 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    6630:	29409b62 	ldp	w2, w6, [x27, #4]
    6634:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    6638:	79400400 	ldrh	w0, [x0, #2]
    663c:	0b010041 	add	w1, w2, w1
    6640:	4b060021 	sub	w1, w1, w6
    6644:	1ac20c25 	sdiv	w5, w1, w2
    6648:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    664c:	6b01001f 	cmp	w0, w1
    6650:	5400078c 	b.gt	6740 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    6654:	0b060000 	add	w0, w0, w6
    6658:	1ac20c01 	sdiv	w1, w0, w2
    665c:	1b028020 	msub	w0, w1, w2, w0
    6660:	b9000b60 	str	w0, [x27, #8]
    6664:	37f804e0 	tbnz	w0, #31, 6700 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    6668:	f9400b61 	ldr	x1, [x27, #16]
    666c:	8b20c020 	add	x0, x1, w0, sxtw
    6670:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    6674:	b9400401 	ldr	w1, [x0, #4]
    6678:	6b14003f 	cmp	w1, w20
    667c:	54000421 	b.ne	6700 <ipc_server_loop+0x1a0>  // b.any
    6680:	39400001 	ldrb	w1, [x0]
    6684:	12000421 	and	w1, w1, #0x3
    6688:	7100043f 	cmp	w1, #0x1
    668c:	540003a1 	b.ne	6700 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    6690:	29409761 	ldp	w1, w5, [x27, #4]
    6694:	b9400f66 	ldr	w6, [x27, #12]
    6698:	0b0100c2 	add	w2, w6, w1
    669c:	4b050042 	sub	w2, w2, w5
    66a0:	1ac10c45 	sdiv	w5, w2, w1
    66a4:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    66a8:	35000122 	cbnz	w2, 66cc <ipc_server_loop+0x16c>
    66ac:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    66b0:	6b01005f 	cmp	w2, w1
    66b4:	5400056c 	b.gt	6760 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    66b8:	0b060042 	add	w2, w2, w6
    66bc:	1ac10c45 	sdiv	w5, w2, w1
    66c0:	1b0188a2 	msub	w2, w5, w1, w2
    66c4:	b9000f62 	str	w2, [x27, #12]
    66c8:	37f801c2 	tbnz	w2, #31, 6700 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    66cc:	39400402 	ldrb	w2, [x0, #1]
    66d0:	39400401 	ldrb	w1, [x0, #1]
    66d4:	8b020e62 	add	x2, x19, x2, lsl #3
    66d8:	f9400442 	ldr	x2, [x2, #8]
    66dc:	b5fffa22 	cbnz	x2, 6620 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    66e0:	f9400262 	ldr	x2, [x19]
    66e4:	aa1603e0 	mov	x0, x22
    66e8:	97ffed8a 	bl	1d10 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    66ec:	f9400780 	ldr	x0, [x28, #8]
    66f0:	17ffffd0 	b	6630 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    66f4:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    66f8:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    66fc:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    6700:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    6704:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    6708:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    670c:	eb1b02ff 	cmp	x23, x27
    6710:	54fff701 	b.ne	65f0 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    6714:	52000340 	eor	w0, w26, #0x1
    6718:	5280003a 	mov	w26, #0x1                   	// #1
    671c:	6a00033f 	tst	w25, w0
    6720:	54fff601 	b.ne	65e0 <ipc_server_loop+0x80>  // b.any
    6724:	17ffffaa 	b	65cc <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    6728:	940000be 	bl	6a20 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    672c:	52000340 	eor	w0, w26, #0x1
    6730:	5280003a 	mov	w26, #0x1                   	// #1
    6734:	6a00033f 	tst	w25, w0
    6738:	54fff541 	b.ne	65e0 <ipc_server_loop+0x80>  // b.any
    673c:	17ffffa4 	b	65cc <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    6740:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    6744:	9100637b 	add	x27, x27, #0x18
    6748:	97ffed72 	bl	1d10 <printf>
                cur_sess_id = -1;
    674c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    6750:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    6754:	eb1b02ff 	cmp	x23, x27
    6758:	54fff4c1 	b.ne	65f0 <ipc_server_loop+0x90>  // b.any
    675c:	17ffffee 	b	6714 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    6760:	f94037e0 	ldr	x0, [sp, #104]
    6764:	9100637b 	add	x27, x27, #0x18
    6768:	97ffed6a 	bl	1d10 <printf>
                cur_sess_id = -1;
    676c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    6770:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    6774:	eb1b02ff 	cmp	x23, x27
    6778:	54fff3c1 	b.ne	65f0 <ipc_server_loop+0x90>  // b.any
    677c:	17ffffe6 	b	6714 <ipc_server_loop+0x1b4>

0000000000006780 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    6780:	aa0003e3 	mov	x3, x0
    6784:	aa0103e0 	mov	x0, x1
    6788:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    678c:	aa0303e2 	mov	x2, x3
    6790:	140000bc 	b	6a80 <session>
    6794:	d503201f 	nop
    6798:	d503201f 	nop
    679c:	d503201f 	nop

00000000000067a0 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    67a0:	140000c8 	b	6ac0 <close_session>
    67a4:	d503201f 	nop
    67a8:	d503201f 	nop
    67ac:	d503201f 	nop

00000000000067b0 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    67b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    67b4:	910003fd 	mov	x29, sp
    67b8:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    67bc:	37f80561 	tbnz	w1, #31, 6868 <session_alloc_buf+0xb8>
    67c0:	a90153f3 	stp	x19, x20, [sp, #16]
    67c4:	2a0103f4 	mov	w20, w1
    67c8:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    67cc:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    67d0:	d2800015 	mov	x21, #0x0                   	// #0
    67d4:	b9400c03 	ldr	w3, [x0, #12]
    67d8:	0b030020 	add	w0, w1, w3
    67dc:	4b020000 	sub	w0, w0, w2
    67e0:	1ac10c02 	sdiv	w2, w0, w1
    67e4:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    67e8:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    67ec:	6b01029f 	cmp	w20, w1
    67f0:	5400032c 	b.gt	6854 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    67f4:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    67f8:	93407e82 	sxtw	x2, w20
    67fc:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    6800:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    6804:	aa1503e0 	mov	x0, x21
    6808:	9400046e 	bl	79c0 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    680c:	29408e60 	ldp	w0, w3, [x19, #4]
    6810:	b9400e61 	ldr	w1, [x19, #12]
    6814:	0b010002 	add	w2, w0, w1
    6818:	4b030043 	sub	w3, w2, w3
    681c:	1ac00c62 	sdiv	w2, w3, w0
    6820:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    6824:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    6828:	6b02029f 	cmp	w20, w2
    682c:	5400028c 	b.gt	687c <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    6830:	0b010294 	add	w20, w20, w1
    6834:	1ac00e81 	sdiv	w1, w20, w0
    6838:	1b00d034 	msub	w20, w1, w0, w20
    683c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    6840:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    6844:	aa1503e0 	mov	x0, x21
    6848:	f94013f5 	ldr	x21, [sp, #32]
    684c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6850:	d65f03c0 	ret
    6854:	aa1503e0 	mov	x0, x21
    6858:	a94153f3 	ldp	x19, x20, [sp, #16]
    685c:	f94013f5 	ldr	x21, [sp, #32]
    6860:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6864:	d65f03c0 	ret
        return NULL;
    6868:	d2800015 	mov	x21, #0x0                   	// #0
}
    686c:	aa1503e0 	mov	x0, x21
    6870:	f94013f5 	ldr	x21, [sp, #32]
    6874:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6878:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    687c:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    6880:	913be000 	add	x0, x0, #0xef8
    6884:	97ffed23 	bl	1d10 <printf>
        return -1;
    6888:	a94153f3 	ldp	x19, x20, [sp, #16]
    688c:	17ffffee 	b	6844 <session_alloc_buf+0x94>

0000000000006890 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    6890:	37f80241 	tbnz	w1, #31, 68d8 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    6894:	29409403 	ldp	w3, w5, [x0, #4]
    6898:	aa0003e2 	mov	x2, x0
    689c:	b9400c00 	ldr	w0, [x0, #12]
    68a0:	0b000060 	add	w0, w3, w0
    68a4:	4b050000 	sub	w0, w0, w5
    68a8:	1ac30c04 	sdiv	w4, w0, w3
    68ac:	1b038080 	msub	w0, w4, w3, w0
    68b0:	6b00003f 	cmp	w1, w0
    68b4:	5400012c 	b.gt	68d8 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    68b8:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    68bc:	52800020 	mov	w0, #0x1                   	// #1
    68c0:	1ac30c24 	sdiv	w4, w1, w3
    68c4:	1b038481 	msub	w1, w4, w3, w1
    68c8:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    68cc:	3100043f 	cmn	w1, #0x1
    68d0:	54000080 	b.eq	68e0 <session_free_buf+0x50>  // b.none
}
    68d4:	d65f03c0 	ret
        return false;
    68d8:	52800000 	mov	w0, #0x0                   	// #0
}
    68dc:	d65f03c0 	ret
{
    68e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    68e4:	b0000043 	adrp	x3, f000 <_fstat_r+0x40>
    68e8:	b0000042 	adrp	x2, f000 <_fstat_r+0x40>
{
    68ec:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    68f0:	b0000040 	adrp	x0, f000 <_fstat_r+0x40>
    68f4:	913ec063 	add	x3, x3, #0xfb0
    68f8:	913fc042 	add	x2, x2, #0xff0
    68fc:	913f8000 	add	x0, x0, #0xfe0
    6900:	52800801 	mov	w1, #0x40                  	// #64
    6904:	940002ff 	bl	7500 <__assert_func>
    6908:	d503201f 	nop
    690c:	d503201f 	nop

0000000000006910 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    6910:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    6914:	910003fd 	mov	x29, sp
    6918:	a90153f3 	stp	x19, x20, [sp, #16]
    691c:	a9025bf5 	stp	x21, x22, [sp, #32]
    6920:	2a0103f6 	mov	w22, w1
    6924:	a90363f7 	stp	x23, x24, [sp, #48]
    6928:	aa0203f8 	mov	x24, x2
    692c:	aa0003f7 	mov	x23, x0
    6930:	a9046bf9 	stp	x25, x26, [sp, #64]
    6934:	aa0403f9 	mov	x25, x4
    6938:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    693c:	d63f0060 	blr	x3
    6940:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    6944:	93407c00 	sxtw	x0, w0
    6948:	94000202 	bl	7150 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    694c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    6950:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    6954:	5400022d 	b.le	6998 <spawn+0x88>
    6958:	52800013 	mov	w19, #0x0                   	// #0
    695c:	f9002bfb 	str	x27, [sp, #80]
    6960:	5282001b 	mov	w27, #0x1000                	// #4096
    6964:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    6968:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    696c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    6970:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    6974:	8b33c2a2 	add	x2, x21, w19, sxtw
    6978:	1a9bd084 	csel	w4, w4, w27, le
    697c:	2a1603e1 	mov	w1, w22
    6980:	aa1703e0 	mov	x0, x23
    6984:	d63f0300 	blr	x24
    6988:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    698c:	6b13029f 	cmp	w20, w19
    6990:	54fffecc 	b.gt	6968 <spawn+0x58>
    6994:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    6998:	aa1a03e3 	mov	x3, x26
    699c:	aa1903e2 	mov	x2, x25
    69a0:	aa1503e1 	mov	x1, x21
    69a4:	d2800004 	mov	x4, #0x0                   	// #0
    69a8:	52800020 	mov	w0, #0x1                   	// #1
    69ac:	940000b9 	bl	6c90 <syscall>
    69b0:	2a0003f3 	mov	w19, w0
    free(img);
    69b4:	aa1503e0 	mov	x0, x21
    69b8:	9400028a 	bl	73e0 <free>
    return ret;
}
    69bc:	2a1303e0 	mov	w0, w19
    69c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    69c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    69c8:	a94363f7 	ldp	x23, x24, [sp, #48]
    69cc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    69d0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    69d4:	d65f03c0 	ret
    69d8:	d503201f 	nop
    69dc:	d503201f 	nop

00000000000069e0 <thread>:

int thread(void* entry, char* name, char** argv)
{
    69e0:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    69e4:	aa0203e3 	mov	x3, x2
    69e8:	aa0003e1 	mov	x1, x0
    69ec:	aa0403e2 	mov	x2, x4
    69f0:	52800120 	mov	w0, #0x9                   	// #9
    69f4:	d2800004 	mov	x4, #0x0                   	// #0
    69f8:	140000a6 	b	6c90 <syscall>
    69fc:	d503201f 	nop

0000000000006a00 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    6a00:	93407c01 	sxtw	x1, w0
    6a04:	d2800004 	mov	x4, #0x0                   	// #0
    6a08:	d2800003 	mov	x3, #0x0                   	// #0
    6a0c:	d2800002 	mov	x2, #0x0                   	// #0
    6a10:	52800040 	mov	w0, #0x2                   	// #2
    6a14:	1400009f 	b	6c90 <syscall>
    6a18:	d503201f 	nop
    6a1c:	d503201f 	nop

0000000000006a20 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    6a20:	2a0003e1 	mov	w1, w0
    6a24:	d2800004 	mov	x4, #0x0                   	// #0
    6a28:	d2800003 	mov	x3, #0x0                   	// #0
    6a2c:	d2800002 	mov	x2, #0x0                   	// #0
    6a30:	52800060 	mov	w0, #0x3                   	// #3
    6a34:	14000097 	b	6c90 <syscall>
    6a38:	d503201f 	nop
    6a3c:	d503201f 	nop

0000000000006a40 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    6a40:	93407c01 	sxtw	x1, w0
    6a44:	d2800004 	mov	x4, #0x0                   	// #0
    6a48:	d2800003 	mov	x3, #0x0                   	// #0
    6a4c:	d2800002 	mov	x2, #0x0                   	// #0
    6a50:	52800180 	mov	w0, #0xc                   	// #12
    6a54:	1400008f 	b	6c90 <syscall>
    6a58:	d503201f 	nop
    6a5c:	d503201f 	nop

0000000000006a60 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    6a60:	aa0003e1 	mov	x1, x0
    6a64:	d2800004 	mov	x4, #0x0                   	// #0
    6a68:	d2800003 	mov	x3, #0x0                   	// #0
    6a6c:	d2800002 	mov	x2, #0x0                   	// #0
    6a70:	528000a0 	mov	w0, #0x5                   	// #5
    6a74:	14000087 	b	6c90 <syscall>
    6a78:	d503201f 	nop
    6a7c:	d503201f 	nop

0000000000006a80 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    6a80:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    6a84:	aa0203e3 	mov	x3, x2
    6a88:	aa0003e1 	mov	x1, x0
    6a8c:	528000c0 	mov	w0, #0x6                   	// #6
    6a90:	93407c82 	sxtw	x2, w4
    6a94:	d2800004 	mov	x4, #0x0                   	// #0
    6a98:	1400007e 	b	6c90 <syscall>
    6a9c:	d503201f 	nop

0000000000006aa0 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    6aa0:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    6aa4:	d2800004 	mov	x4, #0x0                   	// #0
    6aa8:	aa0003e1 	mov	x1, x0
    6aac:	d2800003 	mov	x3, #0x0                   	// #0
    6ab0:	528000e0 	mov	w0, #0x7                   	// #7
    6ab4:	14000077 	b	6c90 <syscall>
    6ab8:	d503201f 	nop
    6abc:	d503201f 	nop

0000000000006ac0 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    6ac0:	aa0003e1 	mov	x1, x0
    6ac4:	d2800004 	mov	x4, #0x0                   	// #0
    6ac8:	d2800003 	mov	x3, #0x0                   	// #0
    6acc:	d2800002 	mov	x2, #0x0                   	// #0
    6ad0:	52800100 	mov	w0, #0x8                   	// #8
    6ad4:	1400006f 	b	6c90 <syscall>
    6ad8:	d503201f 	nop
    6adc:	d503201f 	nop

0000000000006ae0 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    6ae0:	aa0003e2 	mov	x2, x0
    6ae4:	d2800004 	mov	x4, #0x0                   	// #0
    6ae8:	d2800003 	mov	x3, #0x0                   	// #0
    6aec:	d2800061 	mov	x1, #0x3                   	// #3
    6af0:	52800140 	mov	w0, #0xa                   	// #10
    6af4:	14000067 	b	6c90 <syscall>
    6af8:	d503201f 	nop
    6afc:	d503201f 	nop

0000000000006b00 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    6b00:	aa0003e2 	mov	x2, x0
    6b04:	d2800004 	mov	x4, #0x0                   	// #0
    6b08:	d2800003 	mov	x3, #0x0                   	// #0
    6b0c:	d2800021 	mov	x1, #0x1                   	// #1
    6b10:	52800140 	mov	w0, #0xa                   	// #10
    6b14:	1400005f 	b	6c90 <syscall>
    6b18:	d503201f 	nop
    6b1c:	d503201f 	nop

0000000000006b20 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    6b20:	d2800004 	mov	x4, #0x0                   	// #0
    6b24:	d2800003 	mov	x3, #0x0                   	// #0
    6b28:	d2800002 	mov	x2, #0x0                   	// #0
    6b2c:	d2800041 	mov	x1, #0x2                   	// #2
    6b30:	52800140 	mov	w0, #0xa                   	// #10
    6b34:	14000057 	b	6c90 <syscall>
    6b38:	d503201f 	nop
    6b3c:	d503201f 	nop

0000000000006b40 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    6b40:	d2800004 	mov	x4, #0x0                   	// #0
    6b44:	d2800003 	mov	x3, #0x0                   	// #0
    6b48:	d2800002 	mov	x2, #0x0                   	// #0
    6b4c:	d2800081 	mov	x1, #0x4                   	// #4
    6b50:	52800140 	mov	w0, #0xa                   	// #10
    6b54:	1400004f 	b	6c90 <syscall>
    6b58:	d503201f 	nop
    6b5c:	d503201f 	nop

0000000000006b60 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    6b60:	d2800004 	mov	x4, #0x0                   	// #0
    6b64:	d2800003 	mov	x3, #0x0                   	// #0
    6b68:	d2800002 	mov	x2, #0x0                   	// #0
    6b6c:	d28000a1 	mov	x1, #0x5                   	// #5
    6b70:	52800140 	mov	w0, #0xa                   	// #10
    6b74:	14000047 	b	6c90 <syscall>
    6b78:	d503201f 	nop
    6b7c:	d503201f 	nop

0000000000006b80 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    6b80:	d2800004 	mov	x4, #0x0                   	// #0
    6b84:	d2800003 	mov	x3, #0x0                   	// #0
    6b88:	d2800002 	mov	x2, #0x0                   	// #0
    6b8c:	d28000c1 	mov	x1, #0x6                   	// #6
    6b90:	52800140 	mov	w0, #0xa                   	// #10
    6b94:	1400003f 	b	6c90 <syscall>
    6b98:	d503201f 	nop
    6b9c:	d503201f 	nop

0000000000006ba0 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    6ba0:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    6ba4:	92401c64 	and	x4, x3, #0xff
    6ba8:	aa0103e2 	mov	x2, x1
    6bac:	aa0003e1 	mov	x1, x0
    6bb0:	93407ca3 	sxtw	x3, w5
    6bb4:	52800080 	mov	w0, #0x4                   	// #4
    6bb8:	14000036 	b	6c90 <syscall>
    6bbc:	d503201f 	nop

0000000000006bc0 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    6bc0:	93407c22 	sxtw	x2, w1
    6bc4:	d2800004 	mov	x4, #0x0                   	// #0
    6bc8:	93407c01 	sxtw	x1, w0
    6bcc:	d2800003 	mov	x3, #0x0                   	// #0
    6bd0:	52800160 	mov	w0, #0xb                   	// #11
    6bd4:	1400002f 	b	6c90 <syscall>
    6bd8:	d503201f 	nop
    6bdc:	d503201f 	nop

0000000000006be0 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    6be0:	93407c02 	sxtw	x2, w0
    6be4:	d2800004 	mov	x4, #0x0                   	// #0
    6be8:	d2800003 	mov	x3, #0x0                   	// #0
    6bec:	d2800001 	mov	x1, #0x0                   	// #0
    6bf0:	528001a0 	mov	w0, #0xd                   	// #13
    6bf4:	14000027 	b	6c90 <syscall>
    6bf8:	d503201f 	nop
    6bfc:	d503201f 	nop

0000000000006c00 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    6c00:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    6c04:	93407c02 	sxtw	x2, w0
    6c08:	d2800004 	mov	x4, #0x0                   	// #0
{
    6c0c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    6c10:	d2800003 	mov	x3, #0x0                   	// #0
    6c14:	d2800021 	mov	x1, #0x1                   	// #1
    6c18:	528001a0 	mov	w0, #0xd                   	// #13
    6c1c:	9400001d 	bl	6c90 <syscall>
    6c20:	7100001f 	cmp	w0, #0x0
}
    6c24:	1a9f07e0 	cset	w0, ne  // ne = any
    6c28:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6c2c:	d65f03c0 	ret

0000000000006c30 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    6c30:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    6c34:	93407c02 	sxtw	x2, w0
    6c38:	d2800004 	mov	x4, #0x0                   	// #0
{
    6c3c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    6c40:	d2800003 	mov	x3, #0x0                   	// #0
    6c44:	d2800061 	mov	x1, #0x3                   	// #3
    6c48:	528001a0 	mov	w0, #0xd                   	// #13
    6c4c:	94000011 	bl	6c90 <syscall>
    6c50:	7100001f 	cmp	w0, #0x0
}
    6c54:	1a9f07e0 	cset	w0, ne  // ne = any
    6c58:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6c5c:	d65f03c0 	ret

0000000000006c60 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    6c60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    6c64:	93407c02 	sxtw	x2, w0
    6c68:	d2800004 	mov	x4, #0x0                   	// #0
{
    6c6c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    6c70:	d2800003 	mov	x3, #0x0                   	// #0
    6c74:	d2800041 	mov	x1, #0x2                   	// #2
    6c78:	528001a0 	mov	w0, #0xd                   	// #13
    6c7c:	94000005 	bl	6c90 <syscall>
    6c80:	7100001f 	cmp	w0, #0x0
    6c84:	1a9f07e0 	cset	w0, ne  // ne = any
    6c88:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6c8c:	d65f03c0 	ret

0000000000006c90 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    6c90:	2a0003e5 	mov	w5, w0
    6c94:	aa0103e6 	mov	x6, x1
    6c98:	aa0203e7 	mov	x7, x2
    6c9c:	aa0303e8 	mov	x8, x3
    6ca0:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    6ca4:	aa0503e0 	mov	x0, x5
    6ca8:	aa0603e1 	mov	x1, x6
    6cac:	aa0703e2 	mov	x2, x7
    6cb0:	aa0803e3 	mov	x3, x8
    6cb4:	aa0903e4 	mov	x4, x9
    6cb8:	d4000001 	svc	#0x0
    6cbc:	d5033b9f 	dsb	ish
    6cc0:	d5033fdf 	isb
    6cc4:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    6cc8:	2a0503e0 	mov	w0, w5
    6ccc:	d65f03c0 	ret

0000000000006cd0 <insert_node>:
    int list = 0;
    void* search_ptr = ptr;
    void* insert_ptr = NULL;

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6cd0:	f100043f 	cmp	x1, #0x1
    int list = 0;
    6cd4:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6cd8:	540000e9 	b.ls	6cf4 <insert_node+0x24>  // b.plast
    6cdc:	d503201f 	nop
        size >>= 1;
        list++;
    6ce0:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    6ce4:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6ce8:	7100485f 	cmp	w2, #0x12
    6cec:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    6cf0:	54ffff88 	b.hi	6ce0 <insert_node+0x10>  // b.pmore
    }

    // Keep size ascending order and search
    search_ptr = segregated_free_lists[list];
    6cf4:	93407c44 	sxtw	x4, w2
    6cf8:	f0000046 	adrp	x6, 11000 <__global_locale+0x180>
    6cfc:	912f00c6 	add	x6, x6, #0xbc0
    void* insert_ptr = NULL;
    6d00:	d2800005 	mov	x5, #0x0                   	// #0
    search_ptr = segregated_free_lists[list];
    6d04:	f86478c2 	ldr	x2, [x6, x4, lsl #3]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    6d08:	b50000c2 	cbnz	x2, 6d20 <insert_node+0x50>
    6d0c:	14000018 	b	6d6c <insert_node+0x9c>
        insert_ptr = search_ptr;
        search_ptr = PRED(search_ptr);
    6d10:	f9400043 	ldr	x3, [x2]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    6d14:	aa0203e5 	mov	x5, x2
    6d18:	b4000223 	cbz	x3, 6d5c <insert_node+0x8c>
    6d1c:	aa0303e2 	mov	x2, x3
    6d20:	b85fc043 	ldur	w3, [x2, #-4]
    6d24:	927d7063 	and	x3, x3, #0xfffffff8
    6d28:	eb01007f 	cmp	x3, x1
    6d2c:	54ffff23 	b.cc	6d10 <insert_node+0x40>  // b.lo, b.ul, b.last
    }

    // Set predecessor and successor
    if (search_ptr != NULL) {
        if (insert_ptr != NULL) {
    6d30:	b40000c5 	cbz	x5, 6d48 <insert_node+0x78>
            SET_PTR(PRED_PTR(ptr), search_ptr);
    6d34:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    6d38:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    6d3c:	f8004005 	stur	x5, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    6d40:	f90000a0 	str	x0, [x5]
            segregated_free_lists[list] = ptr;
        }
    }

    return;
}
    6d44:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), search_ptr);
    6d48:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    6d4c:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), NULL);
    6d50:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    6d54:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    6d58:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    6d5c:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    6d60:	f8004002 	stur	x2, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    6d64:	f9000040 	str	x0, [x2]
}
    6d68:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    6d6c:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), NULL);
    6d70:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    6d74:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    6d78:	d65f03c0 	ret
    6d7c:	d503201f 	nop

0000000000006d80 <delete_node>:

static void delete_node(void* ptr)
{
    int list = 0;
    size_t size = GET_SIZE(HDRP(ptr));
    6d80:	b85fc001 	ldur	w1, [x0, #-4]
    6d84:	121d7022 	and	w2, w1, #0xfffffff8
    6d88:	927d7021 	and	x1, x1, #0xfffffff8

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6d8c:	7100045f 	cmp	w2, #0x1
    int list = 0;
    6d90:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6d94:	540000c9 	b.ls	6dac <delete_node+0x2c>  // b.plast
        size >>= 1;
        list++;
    6d98:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    6d9c:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    6da0:	7100485f 	cmp	w2, #0x12
    6da4:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    6da8:	54ffff88 	b.hi	6d98 <delete_node+0x18>  // b.pmore
    }

    if (PRED(ptr) != NULL) {
    6dac:	f9400003 	ldr	x3, [x0]
        if (SUCC(ptr) != NULL) {
    6db0:	f8404001 	ldur	x1, [x0, #4]
    if (PRED(ptr) != NULL) {
    6db4:	b40001a3 	cbz	x3, 6de8 <delete_node+0x68>
        if (SUCC(ptr) != NULL) {
    6db8:	b40000c1 	cbz	x1, 6dd0 <delete_node+0x50>
            SET_PTR(SUCC_PTR(PRED(ptr)), SUCC(ptr));
    6dbc:	f8004061 	stur	x1, [x3, #4]
            SET_PTR(PRED_PTR(SUCC(ptr)), PRED(ptr));
    6dc0:	f8404001 	ldur	x1, [x0, #4]
    6dc4:	f9400000 	ldr	x0, [x0]
    6dc8:	f9000020 	str	x0, [x1]
            segregated_free_lists[list] = NULL;
        }
    }

    return;
}
    6dcc:	d65f03c0 	ret
            segregated_free_lists[list] = PRED(ptr);
    6dd0:	f0000041 	adrp	x1, 11000 <__global_locale+0x180>
    6dd4:	912f0021 	add	x1, x1, #0xbc0
            SET_PTR(SUCC_PTR(PRED(ptr)), NULL);
    6dd8:	f800407f 	stur	xzr, [x3, #4]
            segregated_free_lists[list] = PRED(ptr);
    6ddc:	f9400000 	ldr	x0, [x0]
    6de0:	f822d820 	str	x0, [x1, w2, sxtw #3]
}
    6de4:	d65f03c0 	ret
        if (SUCC(ptr) != NULL) {
    6de8:	b4000061 	cbz	x1, 6df4 <delete_node+0x74>
            SET_PTR(PRED_PTR(SUCC(ptr)), NULL);
    6dec:	f900003f 	str	xzr, [x1]
}
    6df0:	d65f03c0 	ret
            segregated_free_lists[list] = NULL;
    6df4:	f0000040 	adrp	x0, 11000 <__global_locale+0x180>
    6df8:	912f0000 	add	x0, x0, #0xbc0
    6dfc:	f822d81f 	str	xzr, [x0, w2, sxtw #3]
}
    6e00:	d65f03c0 	ret
    6e04:	d503201f 	nop
    6e08:	d503201f 	nop
    6e0c:	d503201f 	nop

0000000000006e10 <coalesce>:

static void* coalesce(void* ptr)
{
    6e10:	aa0003e7 	mov	x7, x0
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    6e14:	b85f8000 	ldur	w0, [x0, #-8]
    6e18:	927d7000 	and	x0, x0, #0xfffffff8
    6e1c:	cb0000e0 	sub	x0, x7, x0
    6e20:	b85fc0e2 	ldur	w2, [x7, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    6e24:	927d7045 	and	x5, x2, #0xfffffff8
    6e28:	121d7044 	and	w4, w2, #0xfffffff8
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    6e2c:	b85fc000 	ldur	w0, [x0, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    6e30:	8b0500e3 	add	x3, x7, x5
    6e34:	b85fc062 	ldur	w2, [x3, #-4]
    size_t size = GET_SIZE(HDRP(ptr));

    // Do not coalesce with previous block if the previous block is tagged with Reallocation tag
    if (GET_TAG(HDRP(PREV_BLKP(ptr))))
    6e38:	37080600 	tbnz	w0, #1, 6ef8 <coalesce+0xe8>
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    6e3c:	92400003 	and	x3, x0, #0x1
        prev_alloc = 1;

    if (prev_alloc && next_alloc) { // Case 1
    6e40:	72000041 	ands	w1, w2, #0x1
    6e44:	12000000 	and	w0, w0, #0x1
    6e48:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    6e4c:	54000601 	b.ne	6f0c <coalesce+0xfc>  // b.any
{
    6e50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        return ptr;
    } else if (prev_alloc && !next_alloc) { // Case 2
    6e54:	6a22001f 	bics	wzr, w0, w2
{
    6e58:	910003fd 	mov	x29, sp
    } else if (prev_alloc && !next_alloc) { // Case 2
    6e5c:	540005c1 	b.ne	6f14 <coalesce+0x104>  // b.any
        delete_node(ptr);
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(ptr), PACK(size, 0));
        PUT(FTRP(ptr), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) { // Case 3
    6e60:	52000063 	eor	w3, w3, #0x1
        delete_node(ptr);
    6e64:	aa0703e0 	mov	x0, x7
    } else if (!prev_alloc && next_alloc) { // Case 3
    6e68:	6a03003f 	tst	w1, w3
    6e6c:	540008a0 	b.eq	6f80 <coalesce+0x170>  // b.none
        delete_node(ptr);
    6e70:	97ffffc4 	bl	6d80 <delete_node>
        delete_node(PREV_BLKP(ptr));
    6e74:	b85f80e0 	ldur	w0, [x7, #-8]
    6e78:	927d7000 	and	x0, x0, #0xfffffff8
    6e7c:	cb0000e0 	sub	x0, x7, x0
    6e80:	97ffffc0 	bl	6d80 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
        PUT(FTRP(ptr), PACK(size, 0));
    6e84:	297f00e1 	ldp	w1, w0, [x7, #-8]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    6e88:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    6e8c:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    6e90:	927d7000 	and	x0, x0, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    6e94:	cb010061 	sub	x1, x3, x1
        PUT(FTRP(ptr), PACK(size, 0));
    6e98:	d1002000 	sub	x0, x0, #0x8
    6e9c:	b86168e1 	ldr	w1, [x7, x1]
    6ea0:	b86068e6 	ldr	w6, [x7, x0]
    6ea4:	121d7022 	and	w2, w1, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    6ea8:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    6eac:	0b020084 	add	w4, w4, w2
    6eb0:	121f00c6 	and	w6, w6, #0x2
    6eb4:	2a0400c6 	orr	w6, w6, w4
    6eb8:	b82068e6 	str	w6, [x7, x0]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    6ebc:	8b050021 	add	x1, x1, x5
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    6ec0:	b85f80e0 	ldur	w0, [x7, #-8]
    6ec4:	927d7000 	and	x0, x0, #0xfffffff8
    6ec8:	cb000060 	sub	x0, x3, x0
    6ecc:	b86068e2 	ldr	w2, [x7, x0]
    6ed0:	121f0042 	and	w2, w2, #0x2
        delete_node(ptr);
        delete_node(PREV_BLKP(ptr));
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    6ed4:	2a020082 	orr	w2, w4, w2
    6ed8:	b82068e2 	str	w2, [x7, x0]
        ptr = PREV_BLKP(ptr);
    6edc:	b85f80e0 	ldur	w0, [x7, #-8]
    6ee0:	927d7000 	and	x0, x0, #0xfffffff8
    6ee4:	cb0000e7 	sub	x7, x7, x0
    }

    insert_node(ptr, size);
    6ee8:	aa0703e0 	mov	x0, x7
    6eec:	97ffff79 	bl	6cd0 <insert_node>

    return ptr;
}
    6ef0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6ef4:	d65f03c0 	ret
    if (prev_alloc && next_alloc) { // Case 1
    6ef8:	72000041 	ands	w1, w2, #0x1
    6efc:	52800020 	mov	w0, #0x1                   	// #1
        prev_alloc = 1;
    6f00:	d2800023 	mov	x3, #0x1                   	// #1
    if (prev_alloc && next_alloc) { // Case 1
    6f04:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    6f08:	54fffa40 	b.eq	6e50 <coalesce+0x40>  // b.none
}
    6f0c:	aa0703e0 	mov	x0, x7
    6f10:	d65f03c0 	ret
        delete_node(ptr);
    6f14:	aa0703e0 	mov	x0, x7
    6f18:	97ffff9a 	bl	6d80 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    6f1c:	b85fc0e0 	ldur	w0, [x7, #-4]
    6f20:	927d7000 	and	x0, x0, #0xfffffff8
    6f24:	8b0000e0 	add	x0, x7, x0
    6f28:	97ffff96 	bl	6d80 <delete_node>
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6f2c:	b85fc0e0 	ldur	w0, [x7, #-4]
    6f30:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    6f34:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6f38:	8b0100e1 	add	x1, x7, x1
    6f3c:	b85fc021 	ldur	w1, [x1, #-4]
    6f40:	121d7022 	and	w2, w1, #0xfffffff8
    6f44:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    6f48:	0b020084 	add	w4, w4, w2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6f4c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(ptr), PACK(size, 0));
    6f50:	2a040000 	orr	w0, w0, w4
    6f54:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(size, 0));
    6f58:	927d7000 	and	x0, x0, #0xfffffff8
    6f5c:	d1002000 	sub	x0, x0, #0x8
    6f60:	b86068e2 	ldr	w2, [x7, x0]
    6f64:	121f0042 	and	w2, w2, #0x2
    6f68:	2a040042 	orr	w2, w2, w4
    6f6c:	b82068e2 	str	w2, [x7, x0]
    insert_node(ptr, size);
    6f70:	aa0703e0 	mov	x0, x7
    6f74:	97ffff57 	bl	6cd0 <insert_node>
}
    6f78:	a8c17bfd 	ldp	x29, x30, [sp], #16
    6f7c:	d65f03c0 	ret
        delete_node(ptr);
    6f80:	97ffff80 	bl	6d80 <delete_node>
        delete_node(PREV_BLKP(ptr));
    6f84:	b85f80e0 	ldur	w0, [x7, #-8]
    6f88:	927d7000 	and	x0, x0, #0xfffffff8
    6f8c:	cb0000e0 	sub	x0, x7, x0
    6f90:	97ffff7c 	bl	6d80 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    6f94:	b85fc0e0 	ldur	w0, [x7, #-4]
    6f98:	927d7000 	and	x0, x0, #0xfffffff8
    6f9c:	8b0000e0 	add	x0, x7, x0
    6fa0:	97ffff78 	bl	6d80 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6fa4:	297f04e0 	ldp	w0, w1, [x7, #-8]
    6fa8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    6fac:	927d7000 	and	x0, x0, #0xfffffff8
    6fb0:	927d7021 	and	x1, x1, #0xfffffff8
    6fb4:	cb000063 	sub	x3, x3, x0
    6fb8:	8b0100e1 	add	x1, x7, x1
    6fbc:	b86368e0 	ldr	w0, [x7, x3]
    6fc0:	b85fc021 	ldur	w1, [x1, #-4]
    6fc4:	121d7002 	and	w2, w0, #0xfffffff8
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    6fc8:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6fcc:	121d7021 	and	w1, w1, #0xfffffff8
    6fd0:	0b020021 	add	w1, w1, w2
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    6fd4:	0b040022 	add	w2, w1, w4
    6fd8:	2a020000 	orr	w0, w0, w2
    6fdc:	b82368e0 	str	w0, [x7, x3]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    6fe0:	8b2140a1 	add	x1, x5, w1, uxtw
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    6fe4:	b85fc0e0 	ldur	w0, [x7, #-4]
    6fe8:	927d7000 	and	x0, x0, #0xfffffff8
    6fec:	8b0000e4 	add	x4, x7, x0
    6ff0:	d1002003 	sub	x3, x0, #0x8
    6ff4:	b85fc080 	ldur	w0, [x4, #-4]
    6ff8:	927d7000 	and	x0, x0, #0xfffffff8
    6ffc:	8b030000 	add	x0, x0, x3
    7000:	b86068e4 	ldr	w4, [x7, x0]
    7004:	121f0084 	and	w4, w4, #0x2
    7008:	17ffffb3 	b	6ed4 <coalesce+0xc4>
    700c:	d503201f 	nop

0000000000007010 <mem_sbrk>:
{
    7010:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7014:	910003fd 	mov	x29, sp
    7018:	a90153f3 	stp	x19, x20, [sp, #16]
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    701c:	d0000053 	adrp	x19, 11000 <__global_locale+0x180>
    7020:	912f0273 	add	x19, x19, #0xbc0
{
    7024:	aa0003f4 	mov	x20, x0
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    7028:	a94a0660 	ldp	x0, x1, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    702c:	f9405a62 	ldr	x2, [x19, #176]
    7030:	8b020021 	add	x1, x1, x2
    7034:	cb010003 	sub	x3, x0, x1
    7038:	eb03029f 	cmp	x20, x3
    703c:	540001a9 	b.ls	7070 <mem_sbrk+0x60>  // b.plast
    uintptr_t size_needed = size - (userland_heap_size - requested_heap_size);
    7040:	cb000282 	sub	x2, x20, x0
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    7044:	52800003 	mov	w3, #0x0                   	// #0
    7048:	0b020022 	add	w2, w1, w2
    704c:	d2800001 	mov	x1, #0x0                   	// #0
    7050:	97fffed4 	bl	6ba0 <mmap>
    7054:	93407c00 	sxtw	x0, w0
    if (userland_heap_size - requested_heap_size >= size) {
    7058:	a94a8a61 	ldp	x1, x2, [x19, #168]
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    705c:	f9005260 	str	x0, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    7060:	8b020021 	add	x1, x1, x2
    7064:	cb010003 	sub	x3, x0, x1
    7068:	eb14007f 	cmp	x3, x20
    706c:	54fffea3 	b.cc	7040 <mem_sbrk+0x30>  // b.lo, b.ul, b.last
        requested_heap_size += size;
    7070:	8b020294 	add	x20, x20, x2
}
    7074:	aa0103e0 	mov	x0, x1
        requested_heap_size += size;
    7078:	f9005a74 	str	x20, [x19, #176]
}
    707c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7080:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7084:	d65f03c0 	ret
    7088:	d503201f 	nop
    708c:	d503201f 	nop

0000000000007090 <mm_init>:
    return ptr;
}

static bool malloc_inited = false;
int mm_init(void)
{
    7090:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7094:	910003fd 	mov	x29, sp
    7098:	f9000bf3 	str	x19, [sp, #16]
    // init heap
    userland_heap_base = task_heap_base();
    709c:	d0000053 	adrp	x19, 11000 <__global_locale+0x180>
    70a0:	912f0273 	add	x19, x19, #0xbc0
    70a4:	97fffe9f 	bl	6b20 <task_heap_base>
    70a8:	aa1303e1 	mov	x1, x19
    70ac:	91028262 	add	x2, x19, #0xa0
    70b0:	93407c00 	sxtw	x0, w0
    70b4:	a90a0260 	stp	x0, x0, [x19, #160]
    userland_heap_top = userland_heap_base;
    requested_heap_size = 0;
    70b8:	f9005a7f 	str	xzr, [x19, #176]

    int list;
    char* heap_start; // Pointer to beginning of heap

    // Initialize segregated free lists
    for (list = 0; list < LISTLIMIT; list++) {
    70bc:	d503201f 	nop
        segregated_free_lists[list] = NULL;
    70c0:	f800843f 	str	xzr, [x1], #8
    for (list = 0; list < LISTLIMIT; list++) {
    70c4:	eb02003f 	cmp	x1, x2
    70c8:	54ffffc1 	b.ne	70c0 <mm_init+0x30>  // b.any
    }

    // Allocate memory for the initial empty heap
    if ((long)(heap_start = mem_sbrk(4 * WSIZE)) == -1)
    70cc:	d2800200 	mov	x0, #0x10                  	// #16
    70d0:	97ffffd0 	bl	7010 <mem_sbrk>
    70d4:	aa0003e1 	mov	x1, x0
    70d8:	b100041f 	cmn	x0, #0x1
    70dc:	54000300 	b.eq	713c <mm_init+0xac>  // b.none
        return -1;

    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    PUT_NOTAG(heap_start + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    70e0:	d2800122 	mov	x2, #0x9                   	// #9
    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    70e4:	d2c00120 	mov	x0, #0x900000000           	// #38654705664
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    70e8:	f2c00022 	movk	x2, #0x1, lsl #32
    70ec:	a9000820 	stp	x0, x2, [x1]
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    70f0:	d2800800 	mov	x0, #0x40                  	// #64
    70f4:	97ffffc7 	bl	7010 <mem_sbrk>
    70f8:	b100041f 	cmn	x0, #0x1
    70fc:	54000200 	b.eq	713c <mm_init+0xac>  // b.none
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    7100:	d2800803 	mov	x3, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    7104:	52800804 	mov	w4, #0x40                  	// #64
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    7108:	f2c00023 	movk	x3, #0x1, lsl #32
    insert_node(ptr, asize);
    710c:	d2800801 	mov	x1, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    7110:	b81fc004 	stur	w4, [x0, #-4]
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    7114:	f9001c03 	str	x3, [x0, #56]
    insert_node(ptr, asize);
    7118:	97fffeee 	bl	6cd0 <insert_node>
    return coalesce(ptr);
    711c:	97ffff3d 	bl	6e10 <coalesce>
    PUT_NOTAG(heap_start + (3 * WSIZE), PACK(0, 1)); /* Epilogue header */

    if (extend_heap(INITCHUNKSIZE) == NULL)
    7120:	b40000e0 	cbz	x0, 713c <mm_init+0xac>
        return -1;

    malloc_inited = true;
    7124:	52800021 	mov	w1, #0x1                   	// #1
    return 0;
    7128:	52800000 	mov	w0, #0x0                   	// #0
    malloc_inited = true;
    712c:	3902e261 	strb	w1, [x19, #184]
}
    7130:	f9400bf3 	ldr	x19, [sp, #16]
    7134:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7138:	d65f03c0 	ret
        return -1;
    713c:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    7140:	f9400bf3 	ldr	x19, [sp, #16]
    7144:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7148:	d65f03c0 	ret
    714c:	d503201f 	nop

0000000000007150 <malloc>:

void* malloc(size_t size)
{
    7150:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    7154:	910003fd 	mov	x29, sp
    7158:	a90153f3 	stp	x19, x20, [sp, #16]
    while (!malloc_inited) {
    715c:	d0000054 	adrp	x20, 11000 <__global_locale+0x180>
    7160:	912f0294 	add	x20, x20, #0xbc0
{
    7164:	aa0003f3 	mov	x19, x0
    while (!malloc_inited) {
    7168:	3942e280 	ldrb	w0, [x20, #184]
    716c:	35000080 	cbnz	w0, 717c <malloc+0x2c>
        mm_init();
    7170:	97ffffc8 	bl	7090 <mm_init>
    while (!malloc_inited) {
    7174:	3942e281 	ldrb	w1, [x20, #184]
    7178:	34ffffc1 	cbz	w1, 7170 <malloc+0x20>
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    void* ptr = NULL; /* Pointer */

    // Ignore size 0 cases
    if (size == 0)
    717c:	b4000e73 	cbz	x19, 7348 <malloc+0x1f8>

    // Align block size
    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size + DSIZE);
    7180:	91003e60 	add	x0, x19, #0xf
    7184:	f100227f 	cmp	x19, #0x8
    7188:	927df013 	and	x19, x0, #0xfffffffffffffff8
    718c:	d2800200 	mov	x0, #0x10                  	// #16
    7190:	9a808273 	csel	x19, x19, x0, hi  // hi = pmore
        asize = 2 * DSIZE;
    7194:	d2800002 	mov	x2, #0x0                   	// #0
    7198:	aa1303e3 	mov	x3, x19
    719c:	14000005 	b	71b0 <malloc+0x60>
    }

    int list = 0;
    size_t searchsize = asize;
    // Search for free block in segregated list
    while (list < LISTLIMIT) {
    71a0:	91000442 	add	x2, x2, #0x1
            }
            if (ptr != NULL)
                break;
        }

        searchsize >>= 1;
    71a4:	d341fc63 	lsr	x3, x3, #1
    while (list < LISTLIMIT) {
    71a8:	f100505f 	cmp	x2, #0x14
    71ac:	54000720 	b.eq	7290 <malloc+0x140>  // b.none
        if ((list == LISTLIMIT - 1) || ((searchsize <= 1) && (segregated_free_lists[list] != NULL))) {
    71b0:	f1004c5f 	cmp	x2, #0x13
    71b4:	540006a0 	b.eq	7288 <malloc+0x138>  // b.none
    71b8:	f100047f 	cmp	x3, #0x1
    71bc:	54ffff28 	b.hi	71a0 <malloc+0x50>  // b.pmore
    71c0:	f8627a87 	ldr	x7, [x20, x2, lsl #3]
    71c4:	b4fffee7 	cbz	x7, 71a0 <malloc+0x50>
    71c8:	14000003 	b	71d4 <malloc+0x84>
                ptr = PRED(ptr);
    71cc:	f94000e7 	ldr	x7, [x7]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    71d0:	b4fffe87 	cbz	x7, 71a0 <malloc+0x50>
    71d4:	b85fc0e0 	ldur	w0, [x7, #-4]
    71d8:	927d7001 	and	x1, x0, #0xfffffff8
    71dc:	121d7005 	and	w5, w0, #0xfffffff8
    71e0:	eb13003f 	cmp	x1, x19
    71e4:	54ffff43 	b.cc	71cc <malloc+0x7c>  // b.lo, b.ul, b.last
    71e8:	370fff20 	tbnz	w0, #1, 71cc <malloc+0x7c>
    size_t remainder = ptr_size - asize;
    71ec:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    71f0:	aa0703e0 	mov	x0, x7
    71f4:	97fffee3 	bl	6d80 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    71f8:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    71fc:	f100409f 	cmp	x4, #0x10
    7200:	54000849 	b.ls	7308 <malloc+0x1b8>  // b.plast
    else if (asize >= 100) {
    7204:	f1018e7f 	cmp	x19, #0x63
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    7208:	121f0000 	and	w0, w0, #0x2
    else if (asize >= 100) {
    720c:	54000a88 	b.hi	735c <malloc+0x20c>  // b.pmore
        PUT(HDRP(ptr), PACK(asize, 1));
    7210:	2a130000 	orr	w0, w0, w19
        insert_node(NEXT_BLKP(ptr), remainder);
    7214:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(asize, 1));
    7218:	927d7002 	and	x2, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(asize, 1));
    721c:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(asize, 1));
    7220:	d1002042 	sub	x2, x2, #0x8
        PUT(HDRP(ptr), PACK(asize, 1));
    7224:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(asize, 1));
    7228:	b86268e0 	ldr	w0, [x7, x2]
    722c:	121f0000 	and	w0, w0, #0x2
    7230:	2a130000 	orr	w0, w0, w19
    7234:	32000000 	orr	w0, w0, #0x1
    7238:	b82268e0 	str	w0, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    723c:	b85fc0e0 	ldur	w0, [x7, #-4]
    7240:	927d7000 	and	x0, x0, #0xfffffff8
    7244:	8b0000e0 	add	x0, x7, x0
    7248:	b81fc004 	stur	w4, [x0, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    724c:	b85fc0e0 	ldur	w0, [x7, #-4]
    7250:	927d7000 	and	x0, x0, #0xfffffff8
    7254:	8b0000e0 	add	x0, x7, x0
    7258:	b85fc002 	ldur	w2, [x0, #-4]
    725c:	927d7042 	and	x2, x2, #0xfffffff8
    7260:	8b020000 	add	x0, x0, x2
    7264:	b81f8004 	stur	w4, [x0, #-8]
        insert_node(NEXT_BLKP(ptr), remainder);
    7268:	b85fc0e0 	ldur	w0, [x7, #-4]
    726c:	927d7000 	and	x0, x0, #0xfffffff8
    7270:	8b0000e0 	add	x0, x7, x0
    7274:	97fffe97 	bl	6cd0 <insert_node>
    // Place and divide block
    ptr = place(ptr, asize);

    // Return pointer to newly allocated block
    return ptr;
}
    7278:	aa0703e0 	mov	x0, x7
    727c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7280:	a8c37bfd 	ldp	x29, x30, [sp], #48
    7284:	d65f03c0 	ret
            ptr = segregated_free_lists[list];
    7288:	f9404e87 	ldr	x7, [x20, #152]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    728c:	b5fffa47 	cbnz	x7, 71d4 <malloc+0x84>
        extendsize = MAX(asize, CHUNKSIZE);
    7290:	f140067f 	cmp	x19, #0x1, lsl #12
    7294:	d2820000 	mov	x0, #0x1000                	// #4096
    7298:	9a802260 	csel	x0, x19, x0, cs  // cs = hs, nlast
    729c:	f90013f5 	str	x21, [sp, #32]
    asize = ALIGN(size);
    72a0:	91001c14 	add	x20, x0, #0x7
    72a4:	aa0003f5 	mov	x21, x0
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    72a8:	97ffff5a 	bl	7010 <mem_sbrk>
    72ac:	aa0003e3 	mov	x3, x0
    72b0:	b100041f 	cmn	x0, #0x1
    72b4:	54000480 	b.eq	7344 <malloc+0x1f4>  // b.none
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    72b8:	927d7282 	and	x2, x20, #0xfffffff8
    insert_node(ptr, asize);
    72bc:	aa1503e1 	mov	x1, x21
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    72c0:	8b020062 	add	x2, x3, x2
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    72c4:	b81fc075 	stur	w21, [x3, #-4]
    PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));
    72c8:	52800023 	mov	w3, #0x1                   	// #1
    72cc:	293f0c55 	stp	w21, w3, [x2, #-8]
    insert_node(ptr, asize);
    72d0:	97fffe80 	bl	6cd0 <insert_node>
    return coalesce(ptr);
    72d4:	97fffecf 	bl	6e10 <coalesce>
    72d8:	aa0003e7 	mov	x7, x0
        if ((ptr = extend_heap(extendsize)) == NULL)
    72dc:	b4000340 	cbz	x0, 7344 <malloc+0x1f4>
    72e0:	b85fc001 	ldur	w1, [x0, #-4]
    delete_node(ptr);
    72e4:	aa0703e0 	mov	x0, x7
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    72e8:	f94013f5 	ldr	x21, [sp, #32]
    size_t remainder = ptr_size - asize;
    72ec:	121d7025 	and	w5, w1, #0xfffffff8
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    72f0:	927d7021 	and	x1, x1, #0xfffffff8
    size_t remainder = ptr_size - asize;
    72f4:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    72f8:	97fffea2 	bl	6d80 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    72fc:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    7300:	f100409f 	cmp	x4, #0x10
    7304:	54fff808 	b.hi	7204 <malloc+0xb4>  // b.pmore
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    7308:	121f0000 	and	w0, w0, #0x2
    730c:	2a050000 	orr	w0, w0, w5
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    7310:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    7314:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    7318:	d1002021 	sub	x1, x1, #0x8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    731c:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    7320:	b86168e0 	ldr	w0, [x7, x1]
    7324:	121f0000 	and	w0, w0, #0x2
    7328:	2a050000 	orr	w0, w0, w5
    732c:	32000000 	orr	w0, w0, #0x1
    7330:	b82168e0 	str	w0, [x7, x1]
}
    7334:	aa0703e0 	mov	x0, x7
    7338:	a94153f3 	ldp	x19, x20, [sp, #16]
    733c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    7340:	d65f03c0 	ret
    7344:	f94013f5 	ldr	x21, [sp, #32]
        return NULL;
    7348:	d2800007 	mov	x7, #0x0                   	// #0
}
    734c:	aa0703e0 	mov	x0, x7
    7350:	a94153f3 	ldp	x19, x20, [sp, #16]
    7354:	a8c37bfd 	ldp	x29, x30, [sp], #48
    7358:	d65f03c0 	ret
        PUT(HDRP(ptr), PACK(remainder, 0));
    735c:	2a040000 	orr	w0, w0, w4
    7360:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(remainder, 0));
    7364:	927d7000 	and	x0, x0, #0xfffffff8
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    7368:	32000273 	orr	w19, w19, #0x1
        PUT(FTRP(ptr), PACK(remainder, 0));
    736c:	d1002002 	sub	x2, x0, #0x8
        insert_node(ptr, remainder);
    7370:	aa0703e0 	mov	x0, x7
    7374:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(remainder, 0));
    7378:	b86268e3 	ldr	w3, [x7, x2]
    737c:	121f0063 	and	w3, w3, #0x2
    7380:	2a040063 	orr	w3, w3, w4
    7384:	b82268e3 	str	w3, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    7388:	b85fc0e2 	ldur	w2, [x7, #-4]
    738c:	927d7042 	and	x2, x2, #0xfffffff8
    7390:	8b0200e2 	add	x2, x7, x2
    7394:	b81fc053 	stur	w19, [x2, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    7398:	b85fc0e2 	ldur	w2, [x7, #-4]
    739c:	927d7042 	and	x2, x2, #0xfffffff8
    73a0:	8b0200e2 	add	x2, x7, x2
    73a4:	b85fc043 	ldur	w3, [x2, #-4]
    73a8:	927d7063 	and	x3, x3, #0xfffffff8
    73ac:	8b030042 	add	x2, x2, x3
    73b0:	b81f8053 	stur	w19, [x2, #-8]
        insert_node(ptr, remainder);
    73b4:	97fffe47 	bl	6cd0 <insert_node>
        return NEXT_BLKP(ptr);
    73b8:	b85fc0e0 	ldur	w0, [x7, #-4]
}
    73bc:	a94153f3 	ldp	x19, x20, [sp, #16]
        return NEXT_BLKP(ptr);
    73c0:	927d7000 	and	x0, x0, #0xfffffff8
    73c4:	8b0000e7 	add	x7, x7, x0
}
    73c8:	aa0703e0 	mov	x0, x7
    73cc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    73d0:	d65f03c0 	ret
    73d4:	d503201f 	nop
    73d8:	d503201f 	nop
    73dc:	d503201f 	nop

00000000000073e0 <free>:

void free(void* ptr)
{
    73e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    73e4:	910003fd 	mov	x29, sp
    73e8:	b85fc004 	ldur	w4, [x0, #-4]
    size_t size = GET_SIZE(HDRP(ptr));
    73ec:	927d7081 	and	x1, x4, #0xfffffff8

    REMOVE_RATAG(HDRP(NEXT_BLKP(ptr)));
    73f0:	121d7085 	and	w5, w4, #0xfffffff8
    73f4:	d1001024 	sub	x4, x1, #0x4
    73f8:	b8646802 	ldr	w2, [x0, x4]
    73fc:	121e7842 	and	w2, w2, #0xfffffffd
    7400:	b8246802 	str	w2, [x0, x4]
    PUT(HDRP(ptr), PACK(size, 0));
    7404:	b85fc002 	ldur	w2, [x0, #-4]
    7408:	121f0042 	and	w2, w2, #0x2
    740c:	2a050042 	orr	w2, w2, w5
    7410:	b81fc002 	stur	w2, [x0, #-4]
    PUT(FTRP(ptr), PACK(size, 0));
    7414:	927d7042 	and	x2, x2, #0xfffffff8
    7418:	d1002042 	sub	x2, x2, #0x8
    741c:	b8626804 	ldr	w4, [x0, x2]
    7420:	121f0084 	and	w4, w4, #0x2
    7424:	2a050084 	orr	w4, w4, w5
    7428:	b8226804 	str	w4, [x0, x2]

    insert_node(ptr, size);
    742c:	97fffe29 	bl	6cd0 <insert_node>
    coalesce(ptr);

    return;
}
    7430:	a8c17bfd 	ldp	x29, x30, [sp], #16
    coalesce(ptr);
    7434:	17fffe77 	b	6e10 <coalesce>
    7438:	d503201f 	nop
    743c:	d503201f 	nop

0000000000007440 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    7440:	14000000 	b	7440 <_exit>
    7444:	d503201f 	nop
    7448:	d503201f 	nop
    744c:	d503201f 	nop

0000000000007450 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    7450:	d0000043 	adrp	x3, 11000 <__global_locale+0x180>
    7454:	f9464061 	ldr	x1, [x3, #3200]
    7458:	d0000042 	adrp	x2, 11000 <__global_locale+0x180>
    745c:	913e2042 	add	x2, x2, #0xf88
    7460:	f100003f 	cmp	x1, #0x0
    7464:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    7468:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    746c:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    7470:	f9064062 	str	x2, [x3, #3200]
}
    7474:	d65f03c0 	ret
    7478:	d503201f 	nop
    747c:	d503201f 	nop

0000000000007480 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    7480:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    7484:	d65f03c0 	ret
    7488:	d503201f 	nop
    748c:	d503201f 	nop

0000000000007490 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    7490:	12800000 	mov	w0, #0xffffffff            	// #-1
    7494:	d65f03c0 	ret
    7498:	d503201f 	nop
    749c:	d503201f 	nop

00000000000074a0 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    74a0:	52800000 	mov	w0, #0x0                   	// #0
    74a4:	d65f03c0 	ret
    74a8:	d503201f 	nop
    74ac:	d503201f 	nop

00000000000074b0 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    74b0:	52800020 	mov	w0, #0x1                   	// #1
    74b4:	d65f03c0 	ret
    74b8:	d503201f 	nop
    74bc:	d503201f 	nop

00000000000074c0 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    74c0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    74c4:	d65f03c0 	ret
    74c8:	d503201f 	nop
    74cc:	d503201f 	nop

00000000000074d0 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    74d0:	d2800000 	mov	x0, #0x0                   	// #0
    74d4:	d65f03c0 	ret
    74d8:	d503201f 	nop
    74dc:	d503201f 	nop

00000000000074e0 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    74e0:	12800000 	mov	w0, #0xffffffff            	// #-1
    74e4:	d65f03c0 	ret
    74e8:	d503201f 	nop
    74ec:	d503201f 	nop

00000000000074f0 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    74f0:	52800020 	mov	w0, #0x1                   	// #1
    74f4:	d65f03c0 	ret
    74f8:	d503201f 	nop
    74fc:	d503201f 	nop

0000000000007500 <__assert_func>:
    7500:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    7504:	b0000044 	adrp	x4, 10000 <__func__.0+0x10>
    7508:	aa0003e7 	mov	x7, x0
    750c:	910003fd 	mov	x29, sp
    7510:	f9438885 	ldr	x5, [x4, #1808]
    7514:	aa0203e6 	mov	x6, x2
    7518:	2a0103e4 	mov	w4, w1
    751c:	aa0303e2 	mov	x2, x3
    7520:	f9400ca0 	ldr	x0, [x5, #24]
    7524:	b4000106 	cbz	x6, 7544 <__assert_func+0x44>
    7528:	b0000045 	adrp	x5, 10000 <__func__.0+0x10>
    752c:	910020a5 	add	x5, x5, #0x8
    7530:	aa0703e3 	mov	x3, x7
    7534:	b0000041 	adrp	x1, 10000 <__func__.0+0x10>
    7538:	91006021 	add	x1, x1, #0x18
    753c:	94000049 	bl	7660 <fiprintf>
    7540:	94000ab4 	bl	a010 <abort>
    7544:	90000045 	adrp	x5, f000 <_fstat_r+0x40>
    7548:	9132a0a5 	add	x5, x5, #0xca8
    754c:	aa0503e6 	mov	x6, x5
    7550:	17fffff8 	b	7530 <__assert_func+0x30>
    7554:	d503201f 	nop
    7558:	d503201f 	nop
    755c:	d503201f 	nop

0000000000007560 <__assert>:
    7560:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    7564:	aa0203e3 	mov	x3, x2
    7568:	d2800002 	mov	x2, #0x0                   	// #0
    756c:	910003fd 	mov	x29, sp
    7570:	97ffffe4 	bl	7500 <__assert_func>
    7574:	d503201f 	nop
    7578:	d503201f 	nop
    757c:	d503201f 	nop

0000000000007580 <atexit>:
    7580:	aa0003e1 	mov	x1, x0
    7584:	d2800003 	mov	x3, #0x0                   	// #0
    7588:	d2800002 	mov	x2, #0x0                   	// #0
    758c:	52800000 	mov	w0, #0x0                   	// #0
    7590:	14000aa8 	b	a030 <__register_exitproc>
    7594:	d503201f 	nop
    7598:	d503201f 	nop
    759c:	d503201f 	nop

00000000000075a0 <__libc_fini_array>:
    75a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    75a4:	b0000041 	adrp	x1, 10000 <__func__.0+0x10>
    75a8:	b0000040 	adrp	x0, 10000 <__func__.0+0x10>
    75ac:	910003fd 	mov	x29, sp
    75b0:	a90153f3 	stp	x19, x20, [sp, #16]
    75b4:	f9402433 	ldr	x19, [x1, #72]
    75b8:	f9402814 	ldr	x20, [x0, #80]
    75bc:	cb140273 	sub	x19, x19, x20
    75c0:	9343fe73 	asr	x19, x19, #3
    75c4:	b40000b3 	cbz	x19, 75d8 <__libc_fini_array+0x38>
    75c8:	d1000673 	sub	x19, x19, #0x1
    75cc:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    75d0:	d63f0000 	blr	x0
    75d4:	b5ffffb3 	cbnz	x19, 75c8 <__libc_fini_array+0x28>
    75d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    75dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    75e0:	14001f81 	b	f3e4 <_fini>
    75e4:	d503201f 	nop
    75e8:	d503201f 	nop
    75ec:	d503201f 	nop

00000000000075f0 <_fiprintf_r>:
    75f0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    75f4:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    75f8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    75fc:	910003fd 	mov	x29, sp
    7600:	910343ea 	add	x10, sp, #0xd0
    7604:	910403eb 	add	x11, sp, #0x100
    7608:	a9032feb 	stp	x11, x11, [sp, #48]
    760c:	f90023ea 	str	x10, [sp, #64]
    7610:	290923e9 	stp	w9, w8, [sp, #72]
    7614:	a9432fea 	ldp	x10, x11, [sp, #48]
    7618:	a9012fea 	stp	x10, x11, [sp, #16]
    761c:	a94427e8 	ldp	x8, x9, [sp, #64]
    7620:	a90227e8 	stp	x8, x9, [sp, #32]
    7624:	3d8017e0 	str	q0, [sp, #80]
    7628:	3d801be1 	str	q1, [sp, #96]
    762c:	3d801fe2 	str	q2, [sp, #112]
    7630:	3d8023e3 	str	q3, [sp, #128]
    7634:	3d8027e4 	str	q4, [sp, #144]
    7638:	3d802be5 	str	q5, [sp, #160]
    763c:	3d802fe6 	str	q6, [sp, #176]
    7640:	3d8033e7 	str	q7, [sp, #192]
    7644:	a90d93e3 	stp	x3, x4, [sp, #216]
    7648:	910043e3 	add	x3, sp, #0x10
    764c:	a90e9be5 	stp	x5, x6, [sp, #232]
    7650:	f9007fe7 	str	x7, [sp, #248]
    7654:	940002a3 	bl	80e0 <_vfiprintf_r>
    7658:	a8d07bfd 	ldp	x29, x30, [sp], #256
    765c:	d65f03c0 	ret

0000000000007660 <fiprintf>:
    7660:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    7664:	b0000048 	adrp	x8, 10000 <__func__.0+0x10>
    7668:	aa0003eb 	mov	x11, x0
    766c:	910003fd 	mov	x29, sp
    7670:	910343ec 	add	x12, sp, #0xd0
    7674:	910403ea 	add	x10, sp, #0x100
    7678:	f9438900 	ldr	x0, [x8, #1808]
    767c:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    7680:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    7684:	a9032bea 	stp	x10, x10, [sp, #48]
    7688:	aa0103ea 	mov	x10, x1
    768c:	f90023ec 	str	x12, [sp, #64]
    7690:	aa0b03e1 	mov	x1, x11
    7694:	290923e9 	stp	w9, w8, [sp, #72]
    7698:	a94337ec 	ldp	x12, x13, [sp, #48]
    769c:	a90137ec 	stp	x12, x13, [sp, #16]
    76a0:	a94427e8 	ldp	x8, x9, [sp, #64]
    76a4:	a90227e8 	stp	x8, x9, [sp, #32]
    76a8:	3d8017e0 	str	q0, [sp, #80]
    76ac:	3d801be1 	str	q1, [sp, #96]
    76b0:	3d801fe2 	str	q2, [sp, #112]
    76b4:	3d8023e3 	str	q3, [sp, #128]
    76b8:	3d8027e4 	str	q4, [sp, #144]
    76bc:	3d802be5 	str	q5, [sp, #160]
    76c0:	3d802fe6 	str	q6, [sp, #176]
    76c4:	3d8033e7 	str	q7, [sp, #192]
    76c8:	a90d0fe2 	stp	x2, x3, [sp, #208]
    76cc:	910043e3 	add	x3, sp, #0x10
    76d0:	aa0a03e2 	mov	x2, x10
    76d4:	a90e17e4 	stp	x4, x5, [sp, #224]
    76d8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    76dc:	94000281 	bl	80e0 <_vfiprintf_r>
    76e0:	a8d07bfd 	ldp	x29, x30, [sp], #256
    76e4:	d65f03c0 	ret
    76e8:	d503201f 	nop
    76ec:	d503201f 	nop

00000000000076f0 <__libc_init_array>:
    76f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    76f4:	b0000041 	adrp	x1, 10000 <__func__.0+0x10>
    76f8:	b0000040 	adrp	x0, 10000 <__func__.0+0x10>
    76fc:	910003fd 	mov	x29, sp
    7700:	a90153f3 	stp	x19, x20, [sp, #16]
    7704:	f9403034 	ldr	x20, [x1, #96]
    7708:	f90013f5 	str	x21, [sp, #32]
    770c:	f9403415 	ldr	x21, [x0, #104]
    7710:	cb150294 	sub	x20, x20, x21
    7714:	9343fe94 	asr	x20, x20, #3
    7718:	b40000f4 	cbz	x20, 7734 <__libc_init_array+0x44>
    771c:	d2800013 	mov	x19, #0x0                   	// #0
    7720:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    7724:	91000673 	add	x19, x19, #0x1
    7728:	d63f0000 	blr	x0
    772c:	eb13029f 	cmp	x20, x19
    7730:	54ffff81 	b.ne	7720 <__libc_init_array+0x30>  // b.any
    7734:	940fe233 	bl	400000 <_init>
    7738:	b0000041 	adrp	x1, 10000 <__func__.0+0x10>
    773c:	b0000040 	adrp	x0, 10000 <__func__.0+0x10>
    7740:	f9403834 	ldr	x20, [x1, #112]
    7744:	f9403c15 	ldr	x21, [x0, #120]
    7748:	cb150294 	sub	x20, x20, x21
    774c:	9343fe94 	asr	x20, x20, #3
    7750:	b40000f4 	cbz	x20, 776c <__libc_init_array+0x7c>
    7754:	d2800013 	mov	x19, #0x0                   	// #0
    7758:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    775c:	91000673 	add	x19, x19, #0x1
    7760:	d63f0000 	blr	x0
    7764:	eb13029f 	cmp	x20, x19
    7768:	54ffff81 	b.ne	7758 <__libc_init_array+0x68>  // b.any
    776c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7770:	f94013f5 	ldr	x21, [sp, #32]
    7774:	a8c37bfd 	ldp	x29, x30, [sp], #48
    7778:	d65f03c0 	ret
    777c:	d503201f 	nop

0000000000007780 <memcpy>:
    7780:	f9800020 	prfm	pldl1keep, [x1]
    7784:	8b020024 	add	x4, x1, x2
    7788:	8b020005 	add	x5, x0, x2
    778c:	f100405f 	cmp	x2, #0x10
    7790:	54000209 	b.ls	77d0 <memcpy+0x50>  // b.plast
    7794:	f101805f 	cmp	x2, #0x60
    7798:	54000648 	b.hi	7860 <memcpy+0xe0>  // b.pmore
    779c:	d1000449 	sub	x9, x2, #0x1
    77a0:	a9401c26 	ldp	x6, x7, [x1]
    77a4:	37300469 	tbnz	w9, #6, 7830 <memcpy+0xb0>
    77a8:	a97f348c 	ldp	x12, x13, [x4, #-16]
    77ac:	362800a9 	tbz	w9, #5, 77c0 <memcpy+0x40>
    77b0:	a9412428 	ldp	x8, x9, [x1, #16]
    77b4:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    77b8:	a9012408 	stp	x8, x9, [x0, #16]
    77bc:	a93e2caa 	stp	x10, x11, [x5, #-32]
    77c0:	a9001c06 	stp	x6, x7, [x0]
    77c4:	a93f34ac 	stp	x12, x13, [x5, #-16]
    77c8:	d65f03c0 	ret
    77cc:	d503201f 	nop
    77d0:	f100205f 	cmp	x2, #0x8
    77d4:	540000e3 	b.cc	77f0 <memcpy+0x70>  // b.lo, b.ul, b.last
    77d8:	f9400026 	ldr	x6, [x1]
    77dc:	f85f8087 	ldur	x7, [x4, #-8]
    77e0:	f9000006 	str	x6, [x0]
    77e4:	f81f80a7 	stur	x7, [x5, #-8]
    77e8:	d65f03c0 	ret
    77ec:	d503201f 	nop
    77f0:	361000c2 	tbz	w2, #2, 7808 <memcpy+0x88>
    77f4:	b9400026 	ldr	w6, [x1]
    77f8:	b85fc087 	ldur	w7, [x4, #-4]
    77fc:	b9000006 	str	w6, [x0]
    7800:	b81fc0a7 	stur	w7, [x5, #-4]
    7804:	d65f03c0 	ret
    7808:	b4000102 	cbz	x2, 7828 <memcpy+0xa8>
    780c:	d341fc49 	lsr	x9, x2, #1
    7810:	39400026 	ldrb	w6, [x1]
    7814:	385ff087 	ldurb	w7, [x4, #-1]
    7818:	38696828 	ldrb	w8, [x1, x9]
    781c:	39000006 	strb	w6, [x0]
    7820:	38296808 	strb	w8, [x0, x9]
    7824:	381ff0a7 	sturb	w7, [x5, #-1]
    7828:	d65f03c0 	ret
    782c:	d503201f 	nop
    7830:	a9412428 	ldp	x8, x9, [x1, #16]
    7834:	a9422c2a 	ldp	x10, x11, [x1, #32]
    7838:	a943342c 	ldp	x12, x13, [x1, #48]
    783c:	a97e0881 	ldp	x1, x2, [x4, #-32]
    7840:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    7844:	a9001c06 	stp	x6, x7, [x0]
    7848:	a9012408 	stp	x8, x9, [x0, #16]
    784c:	a9022c0a 	stp	x10, x11, [x0, #32]
    7850:	a903340c 	stp	x12, x13, [x0, #48]
    7854:	a93e08a1 	stp	x1, x2, [x5, #-32]
    7858:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    785c:	d65f03c0 	ret
    7860:	92400c09 	and	x9, x0, #0xf
    7864:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    7868:	a940342c 	ldp	x12, x13, [x1]
    786c:	cb090021 	sub	x1, x1, x9
    7870:	8b090042 	add	x2, x2, x9
    7874:	a9411c26 	ldp	x6, x7, [x1, #16]
    7878:	a900340c 	stp	x12, x13, [x0]
    787c:	a9422428 	ldp	x8, x9, [x1, #32]
    7880:	a9432c2a 	ldp	x10, x11, [x1, #48]
    7884:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    7888:	f1024042 	subs	x2, x2, #0x90
    788c:	54000169 	b.ls	78b8 <memcpy+0x138>  // b.plast
    7890:	a9011c66 	stp	x6, x7, [x3, #16]
    7894:	a9411c26 	ldp	x6, x7, [x1, #16]
    7898:	a9022468 	stp	x8, x9, [x3, #32]
    789c:	a9422428 	ldp	x8, x9, [x1, #32]
    78a0:	a9032c6a 	stp	x10, x11, [x3, #48]
    78a4:	a9432c2a 	ldp	x10, x11, [x1, #48]
    78a8:	a984346c 	stp	x12, x13, [x3, #64]!
    78ac:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    78b0:	f1010042 	subs	x2, x2, #0x40
    78b4:	54fffee8 	b.hi	7890 <memcpy+0x110>  // b.pmore
    78b8:	a97c0881 	ldp	x1, x2, [x4, #-64]
    78bc:	a9011c66 	stp	x6, x7, [x3, #16]
    78c0:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    78c4:	a9022468 	stp	x8, x9, [x3, #32]
    78c8:	a97e2488 	ldp	x8, x9, [x4, #-32]
    78cc:	a9032c6a 	stp	x10, x11, [x3, #48]
    78d0:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    78d4:	a904346c 	stp	x12, x13, [x3, #64]
    78d8:	a93c08a1 	stp	x1, x2, [x5, #-64]
    78dc:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    78e0:	a93e24a8 	stp	x8, x9, [x5, #-32]
    78e4:	a93f2caa 	stp	x10, x11, [x5, #-16]
    78e8:	d65f03c0 	ret
    78ec:	d503201f 	nop
    78f0:	d503201f 	nop
    78f4:	d503201f 	nop
    78f8:	d503201f 	nop
    78fc:	d503201f 	nop

0000000000007900 <memmove>:
    7900:	cb010005 	sub	x5, x0, x1
    7904:	f101805f 	cmp	x2, #0x60
    7908:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    790c:	54fff3a2 	b.cs	7780 <memcpy>  // b.hs, b.nlast
    7910:	b40004c5 	cbz	x5, 79a8 <memmove+0xa8>
    7914:	8b020004 	add	x4, x0, x2
    7918:	8b020023 	add	x3, x1, x2
    791c:	92400c85 	and	x5, x4, #0xf
    7920:	a97f346c 	ldp	x12, x13, [x3, #-16]
    7924:	cb050063 	sub	x3, x3, x5
    7928:	cb050042 	sub	x2, x2, x5
    792c:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    7930:	a93f348c 	stp	x12, x13, [x4, #-16]
    7934:	a97e2468 	ldp	x8, x9, [x3, #-32]
    7938:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    793c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    7940:	cb050084 	sub	x4, x4, x5
    7944:	f1020042 	subs	x2, x2, #0x80
    7948:	54000189 	b.ls	7978 <memmove+0x78>  // b.plast
    794c:	d503201f 	nop
    7950:	a93f1c86 	stp	x6, x7, [x4, #-16]
    7954:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    7958:	a93e2488 	stp	x8, x9, [x4, #-32]
    795c:	a97e2468 	ldp	x8, x9, [x3, #-32]
    7960:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    7964:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    7968:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    796c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    7970:	f1010042 	subs	x2, x2, #0x40
    7974:	54fffee8 	b.hi	7950 <memmove+0x50>  // b.pmore
    7978:	a9431422 	ldp	x2, x5, [x1, #48]
    797c:	a93f1c86 	stp	x6, x7, [x4, #-16]
    7980:	a9421c26 	ldp	x6, x7, [x1, #32]
    7984:	a93e2488 	stp	x8, x9, [x4, #-32]
    7988:	a9412428 	ldp	x8, x9, [x1, #16]
    798c:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    7990:	a9402c2a 	ldp	x10, x11, [x1]
    7994:	a93c348c 	stp	x12, x13, [x4, #-64]
    7998:	a9031402 	stp	x2, x5, [x0, #48]
    799c:	a9021c06 	stp	x6, x7, [x0, #32]
    79a0:	a9012408 	stp	x8, x9, [x0, #16]
    79a4:	a9002c0a 	stp	x10, x11, [x0]
    79a8:	d65f03c0 	ret
    79ac:	d503201f 	nop
    79b0:	d503201f 	nop
    79b4:	d503201f 	nop
    79b8:	d503201f 	nop
    79bc:	d503201f 	nop

00000000000079c0 <memset>:
    79c0:	4e010c20 	dup	v0.16b, w1
    79c4:	8b020004 	add	x4, x0, x2
    79c8:	f101805f 	cmp	x2, #0x60
    79cc:	540003c8 	b.hi	7a44 <memset+0x84>  // b.pmore
    79d0:	f100405f 	cmp	x2, #0x10
    79d4:	54000202 	b.cs	7a14 <memset+0x54>  // b.hs, b.nlast
    79d8:	4e083c01 	mov	x1, v0.d[0]
    79dc:	361800a2 	tbz	w2, #3, 79f0 <memset+0x30>
    79e0:	f9000001 	str	x1, [x0]
    79e4:	f81f8081 	stur	x1, [x4, #-8]
    79e8:	d65f03c0 	ret
    79ec:	d503201f 	nop
    79f0:	36100082 	tbz	w2, #2, 7a00 <memset+0x40>
    79f4:	b9000001 	str	w1, [x0]
    79f8:	b81fc081 	stur	w1, [x4, #-4]
    79fc:	d65f03c0 	ret
    7a00:	b4000082 	cbz	x2, 7a10 <memset+0x50>
    7a04:	39000001 	strb	w1, [x0]
    7a08:	36080042 	tbz	w2, #1, 7a10 <memset+0x50>
    7a0c:	781fe081 	sturh	w1, [x4, #-2]
    7a10:	d65f03c0 	ret
    7a14:	3d800000 	str	q0, [x0]
    7a18:	373000c2 	tbnz	w2, #6, 7a30 <memset+0x70>
    7a1c:	3c9f0080 	stur	q0, [x4, #-16]
    7a20:	36280062 	tbz	w2, #5, 7a2c <memset+0x6c>
    7a24:	3d800400 	str	q0, [x0, #16]
    7a28:	3c9e0080 	stur	q0, [x4, #-32]
    7a2c:	d65f03c0 	ret
    7a30:	3d800400 	str	q0, [x0, #16]
    7a34:	ad010000 	stp	q0, q0, [x0, #32]
    7a38:	ad3f0080 	stp	q0, q0, [x4, #-32]
    7a3c:	d65f03c0 	ret
    7a40:	d503201f 	nop
    7a44:	12001c21 	and	w1, w1, #0xff
    7a48:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    7a4c:	3d800000 	str	q0, [x0]
    7a50:	f104005f 	cmp	x2, #0x100
    7a54:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    7a58:	54000180 	b.eq	7a88 <memset+0xc8>  // b.none
    7a5c:	cb030082 	sub	x2, x4, x3
    7a60:	d1004063 	sub	x3, x3, #0x10
    7a64:	d1014042 	sub	x2, x2, #0x50
    7a68:	ad010060 	stp	q0, q0, [x3, #32]
    7a6c:	ad820060 	stp	q0, q0, [x3, #64]!
    7a70:	f1010042 	subs	x2, x2, #0x40
    7a74:	54ffffa8 	b.hi	7a68 <memset+0xa8>  // b.pmore
    7a78:	ad3e0080 	stp	q0, q0, [x4, #-64]
    7a7c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    7a80:	d65f03c0 	ret
    7a84:	d503201f 	nop
    7a88:	d53b00e5 	mrs	x5, dczid_el0
    7a8c:	3727fe85 	tbnz	w5, #4, 7a5c <memset+0x9c>
    7a90:	12000ca5 	and	w5, w5, #0xf
    7a94:	710010bf 	cmp	w5, #0x4
    7a98:	54000281 	b.ne	7ae8 <memset+0x128>  // b.any
    7a9c:	3d800460 	str	q0, [x3, #16]
    7aa0:	ad010060 	stp	q0, q0, [x3, #32]
    7aa4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    7aa8:	ad020060 	stp	q0, q0, [x3, #64]
    7aac:	ad030060 	stp	q0, q0, [x3, #96]
    7ab0:	cb030082 	sub	x2, x4, x3
    7ab4:	d1040042 	sub	x2, x2, #0x100
    7ab8:	91020063 	add	x3, x3, #0x80
    7abc:	d503201f 	nop
    7ac0:	d50b7423 	dc	zva, x3
    7ac4:	91010063 	add	x3, x3, #0x40
    7ac8:	f1010042 	subs	x2, x2, #0x40
    7acc:	54ffffa8 	b.hi	7ac0 <memset+0x100>  // b.pmore
    7ad0:	ad000060 	stp	q0, q0, [x3]
    7ad4:	ad010060 	stp	q0, q0, [x3, #32]
    7ad8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    7adc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    7ae0:	d65f03c0 	ret
    7ae4:	d503201f 	nop
    7ae8:	710014bf 	cmp	w5, #0x5
    7aec:	54000241 	b.ne	7b34 <memset+0x174>  // b.any
    7af0:	3d800460 	str	q0, [x3, #16]
    7af4:	ad010060 	stp	q0, q0, [x3, #32]
    7af8:	ad020060 	stp	q0, q0, [x3, #64]
    7afc:	ad030060 	stp	q0, q0, [x3, #96]
    7b00:	9279e063 	and	x3, x3, #0xffffffffffffff80
    7b04:	cb030082 	sub	x2, x4, x3
    7b08:	d1040042 	sub	x2, x2, #0x100
    7b0c:	91020063 	add	x3, x3, #0x80
    7b10:	d50b7423 	dc	zva, x3
    7b14:	91020063 	add	x3, x3, #0x80
    7b18:	f1020042 	subs	x2, x2, #0x80
    7b1c:	54ffffa8 	b.hi	7b10 <memset+0x150>  // b.pmore
    7b20:	ad3c0080 	stp	q0, q0, [x4, #-128]
    7b24:	ad3d0080 	stp	q0, q0, [x4, #-96]
    7b28:	ad3e0080 	stp	q0, q0, [x4, #-64]
    7b2c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    7b30:	d65f03c0 	ret
    7b34:	52800086 	mov	w6, #0x4                   	// #4
    7b38:	1ac520c7 	lsl	w7, w6, w5
    7b3c:	910100e5 	add	x5, x7, #0x40
    7b40:	eb05005f 	cmp	x2, x5
    7b44:	54fff8c3 	b.cc	7a5c <memset+0x9c>  // b.lo, b.ul, b.last
    7b48:	d10004e6 	sub	x6, x7, #0x1
    7b4c:	8b070065 	add	x5, x3, x7
    7b50:	91004063 	add	x3, x3, #0x10
    7b54:	eb0300a2 	subs	x2, x5, x3
    7b58:	8a2600a5 	bic	x5, x5, x6
    7b5c:	540000a0 	b.eq	7b70 <memset+0x1b0>  // b.none
    7b60:	ac820060 	stp	q0, q0, [x3], #64
    7b64:	ad3f0060 	stp	q0, q0, [x3, #-32]
    7b68:	f1010042 	subs	x2, x2, #0x40
    7b6c:	54ffffa8 	b.hi	7b60 <memset+0x1a0>  // b.pmore
    7b70:	aa0503e3 	mov	x3, x5
    7b74:	cb050082 	sub	x2, x4, x5
    7b78:	eb070042 	subs	x2, x2, x7
    7b7c:	540000a3 	b.cc	7b90 <memset+0x1d0>  // b.lo, b.ul, b.last
    7b80:	d50b7423 	dc	zva, x3
    7b84:	8b070063 	add	x3, x3, x7
    7b88:	eb070042 	subs	x2, x2, x7
    7b8c:	54ffffa2 	b.cs	7b80 <memset+0x1c0>  // b.hs, b.nlast
    7b90:	8b070042 	add	x2, x2, x7
    7b94:	d1008063 	sub	x3, x3, #0x20
    7b98:	17ffffb6 	b	7a70 <memset+0xb0>
    7b9c:	d503201f 	nop
    7ba0:	d503201f 	nop
    7ba4:	d503201f 	nop
    7ba8:	d503201f 	nop
    7bac:	d503201f 	nop
    7bb0:	d503201f 	nop
    7bb4:	d503201f 	nop
    7bb8:	d503201f 	nop
    7bbc:	d503201f 	nop

0000000000007bc0 <strcmp>:
    7bc0:	ca010007 	eor	x7, x0, x1
    7bc4:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    7bc8:	f24008ff 	tst	x7, #0x7
    7bcc:	540003e1 	b.ne	7c48 <strcmp+0x88>  // b.any
    7bd0:	f2400807 	ands	x7, x0, #0x7
    7bd4:	54000241 	b.ne	7c1c <strcmp+0x5c>  // b.any
    7bd8:	f8408402 	ldr	x2, [x0], #8
    7bdc:	f8408423 	ldr	x3, [x1], #8
    7be0:	cb0a0047 	sub	x7, x2, x10
    7be4:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    7be8:	ca030045 	eor	x5, x2, x3
    7bec:	8a2800e4 	bic	x4, x7, x8
    7bf0:	aa0400a6 	orr	x6, x5, x4
    7bf4:	b4ffff26 	cbz	x6, 7bd8 <strcmp+0x18>
    7bf8:	dac00cc6 	rev	x6, x6
    7bfc:	dac00c42 	rev	x2, x2
    7c00:	dac010cb 	clz	x11, x6
    7c04:	dac00c63 	rev	x3, x3
    7c08:	9acb2042 	lsl	x2, x2, x11
    7c0c:	9acb2063 	lsl	x3, x3, x11
    7c10:	d378fc42 	lsr	x2, x2, #56
    7c14:	cb43e040 	sub	x0, x2, x3, lsr #56
    7c18:	d65f03c0 	ret
    7c1c:	927df000 	and	x0, x0, #0xfffffffffffffff8
    7c20:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7c24:	d37df0e7 	lsl	x7, x7, #3
    7c28:	f8408402 	ldr	x2, [x0], #8
    7c2c:	cb0703e7 	neg	x7, x7
    7c30:	f8408423 	ldr	x3, [x1], #8
    7c34:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    7c38:	9ac72508 	lsr	x8, x8, x7
    7c3c:	aa080042 	orr	x2, x2, x8
    7c40:	aa080063 	orr	x3, x3, x8
    7c44:	17ffffe7 	b	7be0 <strcmp+0x20>
    7c48:	f240081f 	tst	x0, #0x7
    7c4c:	54000100 	b.eq	7c6c <strcmp+0xac>  // b.none
    7c50:	38401402 	ldrb	w2, [x0], #1
    7c54:	38401423 	ldrb	w3, [x1], #1
    7c58:	7100045f 	cmp	w2, #0x1
    7c5c:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    7c60:	540001e1 	b.ne	7c9c <strcmp+0xdc>  // b.any
    7c64:	f240081f 	tst	x0, #0x7
    7c68:	54ffff41 	b.ne	7c50 <strcmp+0x90>  // b.any
    7c6c:	927d2027 	and	x7, x1, #0xff8
    7c70:	d27d20e7 	eor	x7, x7, #0xff8
    7c74:	b4fffee7 	cbz	x7, 7c50 <strcmp+0x90>
    7c78:	f8408402 	ldr	x2, [x0], #8
    7c7c:	f8408423 	ldr	x3, [x1], #8
    7c80:	cb0a0047 	sub	x7, x2, x10
    7c84:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    7c88:	ca030045 	eor	x5, x2, x3
    7c8c:	8a2800e4 	bic	x4, x7, x8
    7c90:	aa0400a6 	orr	x6, x5, x4
    7c94:	b4fffec6 	cbz	x6, 7c6c <strcmp+0xac>
    7c98:	17ffffd8 	b	7bf8 <strcmp+0x38>
    7c9c:	cb030040 	sub	x0, x2, x3
    7ca0:	d65f03c0 	ret
    7ca4:	d503201f 	nop
    7ca8:	d503201f 	nop
    7cac:	d503201f 	nop
    7cb0:	d503201f 	nop
    7cb4:	d503201f 	nop
    7cb8:	d503201f 	nop
    7cbc:	d503201f 	nop

0000000000007cc0 <strlen>:
    7cc0:	92402c04 	and	x4, x0, #0xfff
    7cc4:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    7cc8:	f13fc09f 	cmp	x4, #0xff0
    7ccc:	5400082c 	b.gt	7dd0 <strlen+0x110>
    7cd0:	a9400c02 	ldp	x2, x3, [x0]
    7cd4:	cb080044 	sub	x4, x2, x8
    7cd8:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    7cdc:	cb080066 	sub	x6, x3, x8
    7ce0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    7ce4:	ea250084 	bics	x4, x4, x5
    7ce8:	8a2700c5 	bic	x5, x6, x7
    7cec:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    7cf0:	54000100 	b.eq	7d10 <strlen+0x50>  // b.none
    7cf4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    7cf8:	d2800100 	mov	x0, #0x8                   	// #8
    7cfc:	dac00c84 	rev	x4, x4
    7d00:	dac01084 	clz	x4, x4
    7d04:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    7d08:	8b440c00 	add	x0, x0, x4, lsr #3
    7d0c:	d65f03c0 	ret
    7d10:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    7d14:	d1004021 	sub	x1, x1, #0x10
    7d18:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    7d1c:	cb080044 	sub	x4, x2, x8
    7d20:	cb080066 	sub	x6, x3, x8
    7d24:	aa060085 	orr	x5, x4, x6
    7d28:	ea081cbf 	tst	x5, x8, lsl #7
    7d2c:	54000101 	b.ne	7d4c <strlen+0x8c>  // b.any
    7d30:	a9410c22 	ldp	x2, x3, [x1, #16]
    7d34:	cb080044 	sub	x4, x2, x8
    7d38:	cb080066 	sub	x6, x3, x8
    7d3c:	aa060085 	orr	x5, x4, x6
    7d40:	ea081cbf 	tst	x5, x8, lsl #7
    7d44:	54fffea0 	b.eq	7d18 <strlen+0x58>  // b.none
    7d48:	91004021 	add	x1, x1, #0x10
    7d4c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    7d50:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    7d54:	ea250084 	bics	x4, x4, x5
    7d58:	8a2700c5 	bic	x5, x6, x7
    7d5c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    7d60:	54000120 	b.eq	7d84 <strlen+0xc4>  // b.none
    7d64:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    7d68:	cb000020 	sub	x0, x1, x0
    7d6c:	dac00c84 	rev	x4, x4
    7d70:	91002005 	add	x5, x0, #0x8
    7d74:	dac01084 	clz	x4, x4
    7d78:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    7d7c:	8b440c00 	add	x0, x0, x4, lsr #3
    7d80:	d65f03c0 	ret
    7d84:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    7d88:	cb080044 	sub	x4, x2, x8
    7d8c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    7d90:	cb080066 	sub	x6, x3, x8
    7d94:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    7d98:	ea250084 	bics	x4, x4, x5
    7d9c:	8a2700c5 	bic	x5, x6, x7
    7da0:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    7da4:	54fffe01 	b.ne	7d64 <strlen+0xa4>  // b.any
    7da8:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    7dac:	cb080044 	sub	x4, x2, x8
    7db0:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    7db4:	cb080066 	sub	x6, x3, x8
    7db8:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    7dbc:	ea250084 	bics	x4, x4, x5
    7dc0:	8a2700c5 	bic	x5, x6, x7
    7dc4:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    7dc8:	54fffde0 	b.eq	7d84 <strlen+0xc4>  // b.none
    7dcc:	17ffffe6 	b	7d64 <strlen+0xa4>
    7dd0:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    7dd4:	a9400c22 	ldp	x2, x3, [x1]
    7dd8:	d37df004 	lsl	x4, x0, #3
    7ddc:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    7de0:	9ac420e4 	lsl	x4, x7, x4
    7de4:	b201c084 	orr	x4, x4, #0x8080808080808080
    7de8:	aa240042 	orn	x2, x2, x4
    7dec:	aa240065 	orn	x5, x3, x4
    7df0:	f27d001f 	tst	x0, #0x8
    7df4:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    7df8:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    7dfc:	17ffffc8 	b	7d1c <strlen+0x5c>
    7e00:	d503201f 	nop
    7e04:	d503201f 	nop
    7e08:	d503201f 	nop
    7e0c:	d503201f 	nop
    7e10:	d503201f 	nop
    7e14:	d503201f 	nop
    7e18:	d503201f 	nop

0000000000007e1c <strncmp>:
    7e1c:	b4000d82 	cbz	x2, 7fcc <strncmp+0x1b0>
    7e20:	ca010008 	eor	x8, x0, x1
    7e24:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    7e28:	f240091f 	tst	x8, #0x7
    7e2c:	9240080e 	and	x14, x0, #0x7
    7e30:	54000681 	b.ne	7f00 <strncmp+0xe4>  // b.any
    7e34:	b500040e 	cbnz	x14, 7eb4 <strncmp+0x98>
    7e38:	d100044d 	sub	x13, x2, #0x1
    7e3c:	d343fdad 	lsr	x13, x13, #3
    7e40:	f8408403 	ldr	x3, [x0], #8
    7e44:	f8408424 	ldr	x4, [x1], #8
    7e48:	f10005ad 	subs	x13, x13, #0x1
    7e4c:	cb0b0068 	sub	x8, x3, x11
    7e50:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    7e54:	ca040066 	eor	x6, x3, x4
    7e58:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    7e5c:	ea290105 	bics	x5, x8, x9
    7e60:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    7e64:	54fffee0 	b.eq	7e40 <strncmp+0x24>  // b.none
    7e68:	b6f8012d 	tbz	x13, #63, 7e8c <strncmp+0x70>
    7e6c:	f2400842 	ands	x2, x2, #0x7
    7e70:	540000e0 	b.eq	7e8c <strncmp+0x70>  // b.none
    7e74:	d37df042 	lsl	x2, x2, #3
    7e78:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    7e7c:	9ac221ce 	lsl	x14, x14, x2
    7e80:	8a2e0063 	bic	x3, x3, x14
    7e84:	8a2e0084 	bic	x4, x4, x14
    7e88:	aa0e00a5 	orr	x5, x5, x14
    7e8c:	aa0500c7 	orr	x7, x6, x5
    7e90:	dac00ce7 	rev	x7, x7
    7e94:	dac00c63 	rev	x3, x3
    7e98:	dac010ec 	clz	x12, x7
    7e9c:	dac00c84 	rev	x4, x4
    7ea0:	9acc2063 	lsl	x3, x3, x12
    7ea4:	9acc2084 	lsl	x4, x4, x12
    7ea8:	d378fc63 	lsr	x3, x3, #56
    7eac:	cb44e060 	sub	x0, x3, x4, lsr #56
    7eb0:	d65f03c0 	ret
    7eb4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    7eb8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7ebc:	f8408403 	ldr	x3, [x0], #8
    7ec0:	cb0e0fea 	neg	x10, x14, lsl #3
    7ec4:	f8408424 	ldr	x4, [x1], #8
    7ec8:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    7ecc:	d100044d 	sub	x13, x2, #0x1
    7ed0:	9aca2529 	lsr	x9, x9, x10
    7ed4:	924009aa 	and	x10, x13, #0x7
    7ed8:	d343fdad 	lsr	x13, x13, #3
    7edc:	8b0e0042 	add	x2, x2, x14
    7ee0:	8b0e014a 	add	x10, x10, x14
    7ee4:	aa090063 	orr	x3, x3, x9
    7ee8:	aa090084 	orr	x4, x4, x9
    7eec:	8b4a0dad 	add	x13, x13, x10, lsr #3
    7ef0:	17ffffd6 	b	7e48 <strncmp+0x2c>
    7ef4:	d503201f 	nop
    7ef8:	d503201f 	nop
    7efc:	d503201f 	nop
    7f00:	f100405f 	cmp	x2, #0x10
    7f04:	54000122 	b.cs	7f28 <strncmp+0x10c>  // b.hs, b.nlast
    7f08:	38401403 	ldrb	w3, [x0], #1
    7f0c:	38401424 	ldrb	w4, [x1], #1
    7f10:	f1000442 	subs	x2, x2, #0x1
    7f14:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    7f18:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    7f1c:	54ffff60 	b.eq	7f08 <strncmp+0xec>  // b.none
    7f20:	cb040060 	sub	x0, x3, x4
    7f24:	d65f03c0 	ret
    7f28:	d343fc4d 	lsr	x13, x2, #3
    7f2c:	b400018e 	cbz	x14, 7f5c <strncmp+0x140>
    7f30:	cb0e03ee 	neg	x14, x14
    7f34:	924009ce 	and	x14, x14, #0x7
    7f38:	cb0e0042 	sub	x2, x2, x14
    7f3c:	d343fc4d 	lsr	x13, x2, #3
    7f40:	38401403 	ldrb	w3, [x0], #1
    7f44:	38401424 	ldrb	w4, [x1], #1
    7f48:	7100047f 	cmp	w3, #0x1
    7f4c:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    7f50:	54fffe81 	b.ne	7f20 <strncmp+0x104>  // b.any
    7f54:	f10005ce 	subs	x14, x14, #0x1
    7f58:	54ffff48 	b.hi	7f40 <strncmp+0x124>  // b.pmore
    7f5c:	d280010e 	mov	x14, #0x8                   	// #8
    7f60:	f10005ad 	subs	x13, x13, #0x1
    7f64:	540001c3 	b.cc	7f9c <strncmp+0x180>  // b.lo, b.ul, b.last
    7f68:	927d2029 	and	x9, x1, #0xff8
    7f6c:	d27d2129 	eor	x9, x9, #0xff8
    7f70:	b4fffe89 	cbz	x9, 7f40 <strncmp+0x124>
    7f74:	f8408403 	ldr	x3, [x0], #8
    7f78:	f8408424 	ldr	x4, [x1], #8
    7f7c:	cb0b0068 	sub	x8, x3, x11
    7f80:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    7f84:	ca040066 	eor	x6, x3, x4
    7f88:	ea290105 	bics	x5, x8, x9
    7f8c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    7f90:	54fff7e1 	b.ne	7e8c <strncmp+0x70>  // b.any
    7f94:	f10005ad 	subs	x13, x13, #0x1
    7f98:	54fffe85 	b.pl	7f68 <strncmp+0x14c>  // b.nfrst
    7f9c:	92400842 	and	x2, x2, #0x7
    7fa0:	b4fff762 	cbz	x2, 7e8c <strncmp+0x70>
    7fa4:	d1002000 	sub	x0, x0, #0x8
    7fa8:	d1002021 	sub	x1, x1, #0x8
    7fac:	f8626803 	ldr	x3, [x0, x2]
    7fb0:	f8626824 	ldr	x4, [x1, x2]
    7fb4:	cb0b0068 	sub	x8, x3, x11
    7fb8:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    7fbc:	ca040066 	eor	x6, x3, x4
    7fc0:	ea290105 	bics	x5, x8, x9
    7fc4:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    7fc8:	54fff621 	b.ne	7e8c <strncmp+0x70>  // b.any
    7fcc:	d2800000 	mov	x0, #0x0                   	// #0
    7fd0:	d65f03c0 	ret
    7fd4:	d503201f 	nop
    7fd8:	d503201f 	nop
    7fdc:	d503201f 	nop

0000000000007fe0 <__sprint_r.part.0>:
    7fe0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    7fe4:	910003fd 	mov	x29, sp
    7fe8:	b940ac23 	ldr	w3, [x1, #172]
    7fec:	a90363f7 	stp	x23, x24, [sp, #48]
    7ff0:	aa0203f8 	mov	x24, x2
    7ff4:	36680563 	tbz	w3, #13, 80a0 <__sprint_r.part.0+0xc0>
    7ff8:	a9025bf5 	stp	x21, x22, [sp, #32]
    7ffc:	aa0003f5 	mov	x21, x0
    8000:	f9400840 	ldr	x0, [x2, #16]
    8004:	a90153f3 	stp	x19, x20, [sp, #16]
    8008:	aa0103f4 	mov	x20, x1
    800c:	a9046bf9 	stp	x25, x26, [sp, #64]
    8010:	f940005a 	ldr	x26, [x2]
    8014:	b40003c0 	cbz	x0, 808c <__sprint_r.part.0+0xac>
    8018:	a9406756 	ldp	x22, x25, [x26]
    801c:	d342ff39 	lsr	x25, x25, #2
    8020:	2a1903f7 	mov	w23, w25
    8024:	7100033f 	cmp	w25, #0x0
    8028:	540002ad 	b.le	807c <__sprint_r.part.0+0x9c>
    802c:	d2800013 	mov	x19, #0x0                   	// #0
    8030:	14000003 	b	803c <__sprint_r.part.0+0x5c>
    8034:	6b1302ff 	cmp	w23, w19
    8038:	5400020d 	b.le	8078 <__sprint_r.part.0+0x98>
    803c:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    8040:	aa1403e2 	mov	x2, x20
    8044:	aa1503e0 	mov	x0, x21
    8048:	91000673 	add	x19, x19, #0x1
    804c:	94000a15 	bl	a8a0 <_fputwc_r>
    8050:	3100041f 	cmn	w0, #0x1
    8054:	54ffff01 	b.ne	8034 <__sprint_r.part.0+0x54>  // b.any
    8058:	a94153f3 	ldp	x19, x20, [sp, #16]
    805c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8060:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8064:	b9000b1f 	str	wzr, [x24, #8]
    8068:	f9000b1f 	str	xzr, [x24, #16]
    806c:	a94363f7 	ldp	x23, x24, [sp, #48]
    8070:	a8c57bfd 	ldp	x29, x30, [sp], #80
    8074:	d65f03c0 	ret
    8078:	f9400b00 	ldr	x0, [x24, #16]
    807c:	cb39c800 	sub	x0, x0, w25, sxtw #2
    8080:	f9000b00 	str	x0, [x24, #16]
    8084:	9100435a 	add	x26, x26, #0x10
    8088:	b5fffc80 	cbnz	x0, 8018 <__sprint_r.part.0+0x38>
    808c:	52800000 	mov	w0, #0x0                   	// #0
    8090:	a94153f3 	ldp	x19, x20, [sp, #16]
    8094:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8098:	a9446bf9 	ldp	x25, x26, [sp, #64]
    809c:	17fffff2 	b	8064 <__sprint_r.part.0+0x84>
    80a0:	94000b2c 	bl	ad50 <__sfvwrite_r>
    80a4:	b9000b1f 	str	wzr, [x24, #8]
    80a8:	f9000b1f 	str	xzr, [x24, #16]
    80ac:	a94363f7 	ldp	x23, x24, [sp, #48]
    80b0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    80b4:	d65f03c0 	ret
    80b8:	d503201f 	nop
    80bc:	d503201f 	nop

00000000000080c0 <__sprint_r>:
    80c0:	f9400844 	ldr	x4, [x2, #16]
    80c4:	b4000044 	cbz	x4, 80cc <__sprint_r+0xc>
    80c8:	17ffffc6 	b	7fe0 <__sprint_r.part.0>
    80cc:	52800000 	mov	w0, #0x0                   	// #0
    80d0:	b900085f 	str	wzr, [x2, #8]
    80d4:	d65f03c0 	ret
    80d8:	d503201f 	nop
    80dc:	d503201f 	nop

00000000000080e0 <_vfiprintf_r>:
    80e0:	d10843ff 	sub	sp, sp, #0x210
    80e4:	a9007bfd 	stp	x29, x30, [sp]
    80e8:	910003fd 	mov	x29, sp
    80ec:	a9025bf5 	stp	x21, x22, [sp, #32]
    80f0:	aa0303f5 	mov	x21, x3
    80f4:	f9400063 	ldr	x3, [x3]
    80f8:	f90037e3 	str	x3, [sp, #104]
    80fc:	f94006a3 	ldr	x3, [x21, #8]
    8100:	f90043e3 	str	x3, [sp, #128]
    8104:	b9401aa3 	ldr	w3, [x21, #24]
    8108:	a90153f3 	stp	x19, x20, [sp, #16]
    810c:	aa0003f3 	mov	x19, x0
    8110:	aa0203f4 	mov	x20, x2
    8114:	9103e3e0 	add	x0, sp, #0xf8
    8118:	d2800102 	mov	x2, #0x8                   	// #8
    811c:	a9046bf9 	stp	x25, x26, [sp, #64]
    8120:	aa0103f9 	mov	x25, x1
    8124:	52800001 	mov	w1, #0x0                   	// #0
    8128:	b900b3e3 	str	w3, [sp, #176]
    812c:	97fffe25 	bl	79c0 <memset>
    8130:	b4000073 	cbz	x19, 813c <_vfiprintf_r+0x5c>
    8134:	b9405260 	ldr	w0, [x19, #80]
    8138:	34002020 	cbz	w0, 853c <_vfiprintf_r+0x45c>
    813c:	79c02321 	ldrsh	w1, [x25, #16]
    8140:	12003c20 	and	w0, w1, #0xffff
    8144:	376800e1 	tbnz	w1, #13, 8160 <_vfiprintf_r+0x80>
    8148:	b940af22 	ldr	w2, [x25, #172]
    814c:	32130021 	orr	w1, w1, #0x2000
    8150:	12003c20 	and	w0, w1, #0xffff
    8154:	79002321 	strh	w1, [x25, #16]
    8158:	12127841 	and	w1, w2, #0xffffdfff
    815c:	b900af21 	str	w1, [x25, #172]
    8160:	36180520 	tbz	w0, #3, 8204 <_vfiprintf_r+0x124>
    8164:	f9400f21 	ldr	x1, [x25, #24]
    8168:	b40004e1 	cbz	x1, 8204 <_vfiprintf_r+0x124>
    816c:	52800341 	mov	w1, #0x1a                  	// #26
    8170:	0a010000 	and	w0, w0, w1
    8174:	7100281f 	cmp	w0, #0xa
    8178:	54000580 	b.eq	8228 <_vfiprintf_r+0x148>  // b.none
    817c:	a90573fb 	stp	x27, x28, [sp, #80]
    8180:	910643fc 	add	x28, sp, #0x190
    8184:	90000055 	adrp	x21, 10000 <__func__.0+0x10>
    8188:	aa1c03fb 	mov	x27, x28
    818c:	913a02b5 	add	x21, x21, #0xe80
    8190:	90000040 	adrp	x0, 10000 <__func__.0+0x10>
    8194:	9102e000 	add	x0, x0, #0xb8
    8198:	a90363f7 	stp	x23, x24, [sp, #48]
    819c:	b90067ff 	str	wzr, [sp, #100]
    81a0:	f9003fe0 	str	x0, [sp, #120]
    81a4:	f90047ff 	str	xzr, [sp, #136]
    81a8:	a909ffff 	stp	xzr, xzr, [sp, #152]
    81ac:	f90057ff 	str	xzr, [sp, #168]
    81b0:	f9008bfc 	str	x28, [sp, #272]
    81b4:	b9011bff 	str	wzr, [sp, #280]
    81b8:	f90093ff 	str	xzr, [sp, #288]
    81bc:	aa1403f7 	mov	x23, x20
    81c0:	f94076b6 	ldr	x22, [x21, #232]
    81c4:	94000fa7 	bl	c060 <__locale_mb_cur_max>
    81c8:	9103e3e4 	add	x4, sp, #0xf8
    81cc:	93407c03 	sxtw	x3, w0
    81d0:	aa1703e2 	mov	x2, x23
    81d4:	9103d3e1 	add	x1, sp, #0xf4
    81d8:	aa1303e0 	mov	x0, x19
    81dc:	d63f02c0 	blr	x22
    81e0:	7100001f 	cmp	w0, #0x0
    81e4:	340004a0 	cbz	w0, 8278 <_vfiprintf_r+0x198>
    81e8:	540003ab 	b.lt	825c <_vfiprintf_r+0x17c>  // b.tstop
    81ec:	b940f7e1 	ldr	w1, [sp, #244]
    81f0:	7100943f 	cmp	w1, #0x25
    81f4:	54001720 	b.eq	84d8 <_vfiprintf_r+0x3f8>  // b.none
    81f8:	93407c00 	sxtw	x0, w0
    81fc:	8b0002f7 	add	x23, x23, x0
    8200:	17fffff0 	b	81c0 <_vfiprintf_r+0xe0>
    8204:	aa1903e1 	mov	x1, x25
    8208:	aa1303e0 	mov	x0, x19
    820c:	9400072d 	bl	9ec0 <__swsetup_r>
    8210:	3500b220 	cbnz	w0, 9854 <_vfiprintf_r+0x1774>
    8214:	79402320 	ldrh	w0, [x25, #16]
    8218:	52800341 	mov	w1, #0x1a                  	// #26
    821c:	0a010000 	and	w0, w0, w1
    8220:	7100281f 	cmp	w0, #0xa
    8224:	54fffac1 	b.ne	817c <_vfiprintf_r+0x9c>  // b.any
    8228:	79c02720 	ldrsh	w0, [x25, #18]
    822c:	37fffa80 	tbnz	w0, #31, 817c <_vfiprintf_r+0x9c>
    8230:	a9401ea6 	ldp	x6, x7, [x21]
    8234:	aa1403e2 	mov	x2, x20
    8238:	a94116a4 	ldp	x4, x5, [x21, #16]
    823c:	aa1903e1 	mov	x1, x25
    8240:	aa1303e0 	mov	x0, x19
    8244:	910303e3 	add	x3, sp, #0xc0
    8248:	a90c1fe6 	stp	x6, x7, [sp, #192]
    824c:	a90d17e4 	stp	x4, x5, [sp, #208]
    8250:	9400068c 	bl	9c80 <__sbprintf>
    8254:	b90067e0 	str	w0, [sp, #100]
    8258:	140000b2 	b	8520 <_vfiprintf_r+0x440>
    825c:	9103e3e0 	add	x0, sp, #0xf8
    8260:	d2800102 	mov	x2, #0x8                   	// #8
    8264:	52800001 	mov	w1, #0x0                   	// #0
    8268:	97fffdd6 	bl	79c0 <memset>
    826c:	d2800020 	mov	x0, #0x1                   	// #1
    8270:	8b0002f7 	add	x23, x23, x0
    8274:	17ffffd3 	b	81c0 <_vfiprintf_r+0xe0>
    8278:	2a0003f6 	mov	w22, w0
    827c:	cb1402e0 	sub	x0, x23, x20
    8280:	2a0003f8 	mov	w24, w0
    8284:	34008d60 	cbz	w0, 9430 <_vfiprintf_r+0x1350>
    8288:	f94093e2 	ldr	x2, [sp, #288]
    828c:	93407f01 	sxtw	x1, w24
    8290:	b9411be0 	ldr	w0, [sp, #280]
    8294:	8b020022 	add	x2, x1, x2
    8298:	a9000774 	stp	x20, x1, [x27]
    829c:	11000400 	add	w0, w0, #0x1
    82a0:	b9011be0 	str	w0, [sp, #280]
    82a4:	f90093e2 	str	x2, [sp, #288]
    82a8:	71001c1f 	cmp	w0, #0x7
    82ac:	5400120d 	b.le	84ec <_vfiprintf_r+0x40c>
    82b0:	b4006222 	cbz	x2, 8ef4 <_vfiprintf_r+0xe14>
    82b4:	910443e2 	add	x2, sp, #0x110
    82b8:	aa1903e1 	mov	x1, x25
    82bc:	aa1303e0 	mov	x0, x19
    82c0:	97ffff48 	bl	7fe0 <__sprint_r.part.0>
    82c4:	35001260 	cbnz	w0, 8510 <_vfiprintf_r+0x430>
    82c8:	910643fb 	add	x27, sp, #0x190
    82cc:	b94067e0 	ldr	w0, [sp, #100]
    82d0:	0b180000 	add	w0, w0, w24
    82d4:	b90067e0 	str	w0, [sp, #100]
    82d8:	34008ad6 	cbz	w22, 9430 <_vfiprintf_r+0x1350>
    82dc:	394006e0 	ldrb	w0, [x23, #1]
    82e0:	12800004 	mov	w4, #0xffffffff            	// #-1
    82e4:	910006f4 	add	x20, x23, #0x1
    82e8:	2a0403f6 	mov	w22, w4
    82ec:	5280001c 	mov	w28, #0x0                   	// #0
    82f0:	b90063ff 	str	wzr, [sp, #96]
    82f4:	3903bfff 	strb	wzr, [sp, #239]
    82f8:	91000694 	add	x20, x20, #0x1
    82fc:	51008001 	sub	w1, w0, #0x20
    8300:	7101683f 	cmp	w1, #0x5a
    8304:	54000c49 	b.ls	848c <_vfiprintf_r+0x3ac>  // b.plast
    8308:	34008940 	cbz	w0, 9430 <_vfiprintf_r+0x1350>
    830c:	52800036 	mov	w22, #0x1                   	// #1
    8310:	9104a3fa 	add	x26, sp, #0x128
    8314:	2a1603f7 	mov	w23, w22
    8318:	3903bfff 	strb	wzr, [sp, #239]
    831c:	3904a3e0 	strb	w0, [sp, #296]
    8320:	52800004 	mov	w4, #0x0                   	// #0
    8324:	f9003bff 	str	xzr, [sp, #112]
    8328:	b9411be1 	ldr	w1, [sp, #280]
    832c:	11000ac0 	add	w0, w22, #0x2
    8330:	721f038a 	ands	w10, w28, #0x2
    8334:	52801098 	mov	w24, #0x84                  	// #132
    8338:	11000422 	add	w2, w1, #0x1
    833c:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    8340:	2a0203e8 	mov	w8, w2
    8344:	6a180398 	ands	w24, w28, w24
    8348:	f94093e0 	ldr	x0, [sp, #288]
    834c:	540000a1 	b.ne	8360 <_vfiprintf_r+0x280>  // b.any
    8350:	b94063e3 	ldr	w3, [sp, #96]
    8354:	4b160069 	sub	w9, w3, w22
    8358:	7100013f 	cmp	w9, #0x0
    835c:	5400496c 	b.gt	8c88 <_vfiprintf_r+0xba8>
    8360:	3943bfe2 	ldrb	w2, [sp, #239]
    8364:	340001a2 	cbz	w2, 8398 <_vfiprintf_r+0x2b8>
    8368:	9103bfe1 	add	x1, sp, #0xef
    836c:	91000400 	add	x0, x0, #0x1
    8370:	f9000361 	str	x1, [x27]
    8374:	d2800021 	mov	x1, #0x1                   	// #1
    8378:	f9000761 	str	x1, [x27, #8]
    837c:	b9011be8 	str	w8, [sp, #280]
    8380:	f90093e0 	str	x0, [sp, #288]
    8384:	71001d1f 	cmp	w8, #0x7
    8388:	540044cc 	b.gt	8c20 <_vfiprintf_r+0xb40>
    838c:	2a0803e1 	mov	w1, w8
    8390:	9100437b 	add	x27, x27, #0x10
    8394:	11000508 	add	w8, w8, #0x1
    8398:	340002ca 	cbz	w10, 83f0 <_vfiprintf_r+0x310>
    839c:	91000800 	add	x0, x0, #0x2
    83a0:	9103c3e2 	add	x2, sp, #0xf0
    83a4:	d2800041 	mov	x1, #0x2                   	// #2
    83a8:	a9000762 	stp	x2, x1, [x27]
    83ac:	b9011be8 	str	w8, [sp, #280]
    83b0:	f90093e0 	str	x0, [sp, #288]
    83b4:	71001d1f 	cmp	w8, #0x7
    83b8:	5400460d 	b.le	8c78 <_vfiprintf_r+0xb98>
    83bc:	b4005b20 	cbz	x0, 8f20 <_vfiprintf_r+0xe40>
    83c0:	910443e2 	add	x2, sp, #0x110
    83c4:	aa1903e1 	mov	x1, x25
    83c8:	aa1303e0 	mov	x0, x19
    83cc:	b90093e4 	str	w4, [sp, #144]
    83d0:	97ffff04 	bl	7fe0 <__sprint_r.part.0>
    83d4:	35000940 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    83d8:	b9411be1 	ldr	w1, [sp, #280]
    83dc:	910643fb 	add	x27, sp, #0x190
    83e0:	b94093e4 	ldr	w4, [sp, #144]
    83e4:	f94093e0 	ldr	x0, [sp, #288]
    83e8:	11000428 	add	w8, w1, #0x1
    83ec:	d503201f 	nop
    83f0:	7102031f 	cmp	w24, #0x80
    83f4:	54002f80 	b.eq	89e4 <_vfiprintf_r+0x904>  // b.none
    83f8:	4b170098 	sub	w24, w4, w23
    83fc:	7100031f 	cmp	w24, #0x0
    8400:	540038cc 	b.gt	8b18 <_vfiprintf_r+0xa38>
    8404:	93407ef7 	sxtw	x23, w23
    8408:	a9005f7a 	stp	x26, x23, [x27]
    840c:	8b0002e0 	add	x0, x23, x0
    8410:	b9011be8 	str	w8, [sp, #280]
    8414:	f90093e0 	str	x0, [sp, #288]
    8418:	71001d1f 	cmp	w8, #0x7
    841c:	540029ad 	b.le	8950 <_vfiprintf_r+0x870>
    8420:	b4004ba0 	cbz	x0, 8d94 <_vfiprintf_r+0xcb4>
    8424:	910443e2 	add	x2, sp, #0x110
    8428:	aa1903e1 	mov	x1, x25
    842c:	aa1303e0 	mov	x0, x19
    8430:	97fffeec 	bl	7fe0 <__sprint_r.part.0>
    8434:	35000640 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8438:	f94093e0 	ldr	x0, [sp, #288]
    843c:	910643e5 	add	x5, sp, #0x190
    8440:	361000bc 	tbz	w28, #2, 8454 <_vfiprintf_r+0x374>
    8444:	b94063e1 	ldr	w1, [sp, #96]
    8448:	4b160037 	sub	w23, w1, w22
    844c:	710002ff 	cmp	w23, #0x0
    8450:	54004b0c 	b.gt	8db0 <_vfiprintf_r+0xcd0>
    8454:	b94063e1 	ldr	w1, [sp, #96]
    8458:	6b16003f 	cmp	w1, w22
    845c:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    8460:	b94067e1 	ldr	w1, [sp, #100]
    8464:	0b030021 	add	w1, w1, w3
    8468:	b90067e1 	str	w1, [sp, #100]
    846c:	b5003c60 	cbnz	x0, 8bf8 <_vfiprintf_r+0xb18>
    8470:	f9403be1 	ldr	x1, [sp, #112]
    8474:	b9011bff 	str	wzr, [sp, #280]
    8478:	910643fb 	add	x27, sp, #0x190
    847c:	b4ffea01 	cbz	x1, 81bc <_vfiprintf_r+0xdc>
    8480:	aa1303e0 	mov	x0, x19
    8484:	94000977 	bl	aa60 <_free_r>
    8488:	17ffff4d 	b	81bc <_vfiprintf_r+0xdc>
    848c:	f9403fe2 	ldr	x2, [sp, #120]
    8490:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    8494:	10000062 	adr	x2, 84a0 <_vfiprintf_r+0x3c0>
    8498:	8b21a841 	add	x1, x2, w1, sxth #2
    849c:	d61f0020 	br	x1
    84a0:	5100c001 	sub	w1, w0, #0x30
    84a4:	b90063ff 	str	wzr, [sp, #96]
    84a8:	b94063e0 	ldr	w0, [sp, #96]
    84ac:	0b000802 	add	w2, w0, w0, lsl #2
    84b0:	38401680 	ldrb	w0, [x20], #1
    84b4:	0b020421 	add	w1, w1, w2, lsl #1
    84b8:	b90063e1 	str	w1, [sp, #96]
    84bc:	5100c001 	sub	w1, w0, #0x30
    84c0:	7100243f 	cmp	w1, #0x9
    84c4:	54ffff29 	b.ls	84a8 <_vfiprintf_r+0x3c8>  // b.plast
    84c8:	17ffff8d 	b	82fc <_vfiprintf_r+0x21c>
    84cc:	39400280 	ldrb	w0, [x20]
    84d0:	321c039c 	orr	w28, w28, #0x10
    84d4:	17ffff89 	b	82f8 <_vfiprintf_r+0x218>
    84d8:	2a0003f6 	mov	w22, w0
    84dc:	cb1402e0 	sub	x0, x23, x20
    84e0:	2a0003f8 	mov	w24, w0
    84e4:	34ffefc0 	cbz	w0, 82dc <_vfiprintf_r+0x1fc>
    84e8:	17ffff68 	b	8288 <_vfiprintf_r+0x1a8>
    84ec:	9100437b 	add	x27, x27, #0x10
    84f0:	17ffff77 	b	82cc <_vfiprintf_r+0x1ec>
    84f4:	aa1903f3 	mov	x19, x25
    84f8:	aa1403f9 	mov	x25, x20
    84fc:	f9403be0 	ldr	x0, [sp, #112]
    8500:	b4000080 	cbz	x0, 8510 <_vfiprintf_r+0x430>
    8504:	f9403be1 	ldr	x1, [sp, #112]
    8508:	aa1303e0 	mov	x0, x19
    850c:	94000955 	bl	aa60 <_free_r>
    8510:	79c02320 	ldrsh	w0, [x25, #16]
    8514:	a94363f7 	ldp	x23, x24, [sp, #48]
    8518:	a94573fb 	ldp	x27, x28, [sp, #80]
    851c:	373099c0 	tbnz	w0, #6, 9854 <_vfiprintf_r+0x1774>
    8520:	b94067e0 	ldr	w0, [sp, #100]
    8524:	a9407bfd 	ldp	x29, x30, [sp]
    8528:	a94153f3 	ldp	x19, x20, [sp, #16]
    852c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8530:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8534:	910843ff 	add	sp, sp, #0x210
    8538:	d65f03c0 	ret
    853c:	aa1303e0 	mov	x0, x19
    8540:	94000870 	bl	a700 <__sinit>
    8544:	17fffefe 	b	813c <_vfiprintf_r+0x5c>
    8548:	b940b3e1 	ldr	w1, [sp, #176]
    854c:	2a1603e4 	mov	w4, w22
    8550:	37f856c1 	tbnz	w1, #31, 9028 <_vfiprintf_r+0xf48>
    8554:	f94037e1 	ldr	x1, [sp, #104]
    8558:	91003c38 	add	x24, x1, #0xf
    855c:	927df318 	and	x24, x24, #0xfffffffffffffff8
    8560:	f94037e1 	ldr	x1, [sp, #104]
    8564:	3903bfff 	strb	wzr, [sp, #239]
    8568:	f940003a 	ldr	x26, [x1]
    856c:	b400753a 	cbz	x26, 9410 <_vfiprintf_r+0x1330>
    8570:	71014c1f 	cmp	w0, #0x53
    8574:	54006740 	b.eq	925c <_vfiprintf_r+0x117c>  // b.none
    8578:	3720673c 	tbnz	w28, #4, 925c <_vfiprintf_r+0x117c>
    857c:	3100049f 	cmn	w4, #0x1
    8580:	54009520 	b.eq	9824 <_vfiprintf_r+0x1744>  // b.none
    8584:	93407c82 	sxtw	x2, w4
    8588:	aa1a03e0 	mov	x0, x26
    858c:	52800001 	mov	w1, #0x0                   	// #0
    8590:	b9006be4 	str	w4, [sp, #104]
    8594:	94001324 	bl	d224 <memchr>
    8598:	f9003be0 	str	x0, [sp, #112]
    859c:	b9406be4 	ldr	w4, [sp, #104]
    85a0:	b40090a0 	cbz	x0, 97b4 <_vfiprintf_r+0x16d4>
    85a4:	cb1a0003 	sub	x3, x0, x26
    85a8:	52800004 	mov	w4, #0x0                   	// #0
    85ac:	7100007f 	cmp	w3, #0x0
    85b0:	2a0303f7 	mov	w23, w3
    85b4:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    85b8:	a906fff8 	stp	x24, xzr, [sp, #104]
    85bc:	14000060 	b	873c <_vfiprintf_r+0x65c>
    85c0:	71010c1f 	cmp	w0, #0x43
    85c4:	54000040 	b.eq	85cc <_vfiprintf_r+0x4ec>  // b.none
    85c8:	3620569c 	tbz	w28, #4, 9098 <_vfiprintf_r+0xfb8>
    85cc:	910423e0 	add	x0, sp, #0x108
    85d0:	d2800102 	mov	x2, #0x8                   	// #8
    85d4:	52800001 	mov	w1, #0x0                   	// #0
    85d8:	97fffcfa 	bl	79c0 <memset>
    85dc:	b940b3e0 	ldr	w0, [sp, #176]
    85e0:	37f87a20 	tbnz	w0, #31, 9524 <_vfiprintf_r+0x1444>
    85e4:	f94037e0 	ldr	x0, [sp, #104]
    85e8:	91002c01 	add	x1, x0, #0xb
    85ec:	927df021 	and	x1, x1, #0xfffffffffffffff8
    85f0:	f90037e1 	str	x1, [sp, #104]
    85f4:	b9400002 	ldr	w2, [x0]
    85f8:	9104a3fa 	add	x26, sp, #0x128
    85fc:	910423e3 	add	x3, sp, #0x108
    8600:	aa1a03e1 	mov	x1, x26
    8604:	aa1303e0 	mov	x0, x19
    8608:	940005d2 	bl	9d50 <_wcrtomb_r>
    860c:	2a0003f7 	mov	w23, w0
    8610:	3100041f 	cmn	w0, #0x1
    8614:	54009260 	b.eq	9860 <_vfiprintf_r+0x1780>  // b.none
    8618:	7100001f 	cmp	w0, #0x0
    861c:	3903bfff 	strb	wzr, [sp, #239]
    8620:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    8624:	17ffff3f 	b	8320 <_vfiprintf_r+0x240>
    8628:	b94063e1 	ldr	w1, [sp, #96]
    862c:	f90037e0 	str	x0, [sp, #104]
    8630:	4b0103e1 	neg	w1, w1
    8634:	b90063e1 	str	w1, [sp, #96]
    8638:	39400280 	ldrb	w0, [x20]
    863c:	321e039c 	orr	w28, w28, #0x4
    8640:	17ffff2e 	b	82f8 <_vfiprintf_r+0x218>
    8644:	aa1403e2 	mov	x2, x20
    8648:	38401440 	ldrb	w0, [x2], #1
    864c:	7100a81f 	cmp	w0, #0x2a
    8650:	5400a6a0 	b.eq	9b24 <_vfiprintf_r+0x1a44>  // b.none
    8654:	5100c001 	sub	w1, w0, #0x30
    8658:	aa0203f4 	mov	x20, x2
    865c:	52800016 	mov	w22, #0x0                   	// #0
    8660:	7100243f 	cmp	w1, #0x9
    8664:	54ffe4c8 	b.hi	82fc <_vfiprintf_r+0x21c>  // b.pmore
    8668:	38401680 	ldrb	w0, [x20], #1
    866c:	0b160ac4 	add	w4, w22, w22, lsl #2
    8670:	0b040436 	add	w22, w1, w4, lsl #1
    8674:	5100c001 	sub	w1, w0, #0x30
    8678:	7100243f 	cmp	w1, #0x9
    867c:	54ffff69 	b.ls	8668 <_vfiprintf_r+0x588>  // b.plast
    8680:	17ffff1f 	b	82fc <_vfiprintf_r+0x21c>
    8684:	52800560 	mov	w0, #0x2b                  	// #43
    8688:	3903bfe0 	strb	w0, [sp, #239]
    868c:	39400280 	ldrb	w0, [x20]
    8690:	17ffff1a 	b	82f8 <_vfiprintf_r+0x218>
    8694:	b940b3e0 	ldr	w0, [sp, #176]
    8698:	37f84da0 	tbnz	w0, #31, 904c <_vfiprintf_r+0xf6c>
    869c:	f94037e0 	ldr	x0, [sp, #104]
    86a0:	91002c00 	add	x0, x0, #0xb
    86a4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    86a8:	f94037e1 	ldr	x1, [sp, #104]
    86ac:	b9400021 	ldr	w1, [x1]
    86b0:	b90063e1 	str	w1, [sp, #96]
    86b4:	37fffba1 	tbnz	w1, #31, 8628 <_vfiprintf_r+0x548>
    86b8:	f90037e0 	str	x0, [sp, #104]
    86bc:	39400280 	ldrb	w0, [x20]
    86c0:	17ffff0e 	b	82f8 <_vfiprintf_r+0x218>
    86c4:	2a1603e4 	mov	w4, w22
    86c8:	321c0396 	orr	w22, w28, #0x10
    86cc:	b940b3e0 	ldr	w0, [sp, #176]
    86d0:	37280056 	tbnz	w22, #5, 86d8 <_vfiprintf_r+0x5f8>
    86d4:	36204876 	tbz	w22, #4, 8fe0 <_vfiprintf_r+0xf00>
    86d8:	37f85a40 	tbnz	w0, #31, 9220 <_vfiprintf_r+0x1140>
    86dc:	f94037e1 	ldr	x1, [sp, #104]
    86e0:	91003c20 	add	x0, x1, #0xf
    86e4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    86e8:	f90037e0 	str	x0, [sp, #104]
    86ec:	f9400021 	ldr	x1, [x1]
    86f0:	52800020 	mov	w0, #0x1                   	// #1
    86f4:	3903bfff 	strb	wzr, [sp, #239]
    86f8:	3100049f 	cmn	w4, #0x1
    86fc:	54001320 	b.eq	8960 <_vfiprintf_r+0x880>  // b.none
    8700:	f100003f 	cmp	x1, #0x0
    8704:	12187adc 	and	w28, w22, #0xffffff7f
    8708:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    870c:	54001261 	b.ne	8958 <_vfiprintf_r+0x878>  // b.any
    8710:	35000660 	cbnz	w0, 87dc <_vfiprintf_r+0x6fc>
    8714:	120002d7 	and	w23, w22, #0x1
    8718:	36003f56 	tbz	w22, #0, 8f00 <_vfiprintf_r+0xe20>
    871c:	91062ffa 	add	x26, sp, #0x18b
    8720:	52800600 	mov	w0, #0x30                  	// #48
    8724:	52800004 	mov	w4, #0x0                   	// #0
    8728:	39062fe0 	strb	w0, [sp, #395]
    872c:	d503201f 	nop
    8730:	6b17009f 	cmp	w4, w23
    8734:	f9003bff 	str	xzr, [sp, #112]
    8738:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    873c:	3943bfe0 	ldrb	w0, [sp, #239]
    8740:	7100001f 	cmp	w0, #0x0
    8744:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    8748:	17fffef8 	b	8328 <_vfiprintf_r+0x248>
    874c:	39400280 	ldrb	w0, [x20]
    8750:	3219039c 	orr	w28, w28, #0x80
    8754:	17fffee9 	b	82f8 <_vfiprintf_r+0x218>
    8758:	2a1603e4 	mov	w4, w22
    875c:	321c039c 	orr	w28, w28, #0x10
    8760:	b940b3e0 	ldr	w0, [sp, #176]
    8764:	3728005c 	tbnz	w28, #5, 876c <_vfiprintf_r+0x68c>
    8768:	362042dc 	tbz	w28, #4, 8fc0 <_vfiprintf_r+0xee0>
    876c:	37f85460 	tbnz	w0, #31, 91f8 <_vfiprintf_r+0x1118>
    8770:	f94037e0 	ldr	x0, [sp, #104]
    8774:	91003c01 	add	x1, x0, #0xf
    8778:	927df021 	and	x1, x1, #0xfffffffffffffff8
    877c:	f90037e1 	str	x1, [sp, #104]
    8780:	f9400001 	ldr	x1, [x0]
    8784:	12157b96 	and	w22, w28, #0xfffffbff
    8788:	52800000 	mov	w0, #0x0                   	// #0
    878c:	17ffffda 	b	86f4 <_vfiprintf_r+0x614>
    8790:	2a1603e4 	mov	w4, w22
    8794:	321c039c 	orr	w28, w28, #0x10
    8798:	b940b3e0 	ldr	w0, [sp, #176]
    879c:	3728005c 	tbnz	w28, #5, 87a4 <_vfiprintf_r+0x6c4>
    87a0:	36203ffc 	tbz	w28, #4, 8f9c <_vfiprintf_r+0xebc>
    87a4:	37f85160 	tbnz	w0, #31, 91d0 <_vfiprintf_r+0x10f0>
    87a8:	f94037e0 	ldr	x0, [sp, #104]
    87ac:	91003c01 	add	x1, x0, #0xf
    87b0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    87b4:	f90037e1 	str	x1, [sp, #104]
    87b8:	f9400000 	ldr	x0, [x0]
    87bc:	aa0003e1 	mov	x1, x0
    87c0:	b7f83b80 	tbnz	x0, #63, 8f30 <_vfiprintf_r+0xe50>
    87c4:	3100049f 	cmn	w4, #0x1
    87c8:	540036e0 	b.eq	8ea4 <_vfiprintf_r+0xdc4>  // b.none
    87cc:	7100009f 	cmp	w4, #0x0
    87d0:	12187b9c 	and	w28, w28, #0xffffff7f
    87d4:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    87d8:	54003661 	b.ne	8ea4 <_vfiprintf_r+0xdc4>  // b.any
    87dc:	910633fa 	add	x26, sp, #0x18c
    87e0:	52800004 	mov	w4, #0x0                   	// #0
    87e4:	52800017 	mov	w23, #0x0                   	// #0
    87e8:	17ffffd2 	b	8730 <_vfiprintf_r+0x650>
    87ec:	aa1303e0 	mov	x0, x19
    87f0:	94000adc 	bl	b360 <_localeconv_r>
    87f4:	f9400400 	ldr	x0, [x0, #8]
    87f8:	f90053e0 	str	x0, [sp, #160]
    87fc:	97fffd31 	bl	7cc0 <strlen>
    8800:	aa0003e1 	mov	x1, x0
    8804:	aa0103f7 	mov	x23, x1
    8808:	aa1303e0 	mov	x0, x19
    880c:	f90057e1 	str	x1, [sp, #168]
    8810:	94000ad4 	bl	b360 <_localeconv_r>
    8814:	f9400800 	ldr	x0, [x0, #16]
    8818:	f9004fe0 	str	x0, [sp, #152]
    881c:	f10002ff 	cmp	x23, #0x0
    8820:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    8824:	54003b80 	b.eq	8f94 <_vfiprintf_r+0xeb4>  // b.none
    8828:	39400000 	ldrb	w0, [x0]
    882c:	32160381 	orr	w1, w28, #0x400
    8830:	7100001f 	cmp	w0, #0x0
    8834:	39400280 	ldrb	w0, [x20]
    8838:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    883c:	17fffeaf 	b	82f8 <_vfiprintf_r+0x218>
    8840:	39400280 	ldrb	w0, [x20]
    8844:	3200039c 	orr	w28, w28, #0x1
    8848:	17fffeac 	b	82f8 <_vfiprintf_r+0x218>
    884c:	3943bfe1 	ldrb	w1, [sp, #239]
    8850:	39400280 	ldrb	w0, [x20]
    8854:	35ffd521 	cbnz	w1, 82f8 <_vfiprintf_r+0x218>
    8858:	52800401 	mov	w1, #0x20                  	// #32
    885c:	3903bfe1 	strb	w1, [sp, #239]
    8860:	17fffea6 	b	82f8 <_vfiprintf_r+0x218>
    8864:	b940b3e0 	ldr	w0, [sp, #176]
    8868:	372801bc 	tbnz	w28, #5, 889c <_vfiprintf_r+0x7bc>
    886c:	3720019c 	tbnz	w28, #4, 889c <_vfiprintf_r+0x7bc>
    8870:	37306cfc 	tbnz	w28, #6, 960c <_vfiprintf_r+0x152c>
    8874:	364889bc 	tbz	w28, #9, 99a8 <_vfiprintf_r+0x18c8>
    8878:	37f89040 	tbnz	w0, #31, 9a80 <_vfiprintf_r+0x19a0>
    887c:	f94037e0 	ldr	x0, [sp, #104]
    8880:	91003c01 	add	x1, x0, #0xf
    8884:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8888:	f90037e1 	str	x1, [sp, #104]
    888c:	f9400000 	ldr	x0, [x0]
    8890:	394193e1 	ldrb	w1, [sp, #100]
    8894:	39000001 	strb	w1, [x0]
    8898:	17fffe49 	b	81bc <_vfiprintf_r+0xdc>
    889c:	37f84180 	tbnz	w0, #31, 90cc <_vfiprintf_r+0xfec>
    88a0:	f94037e0 	ldr	x0, [sp, #104]
    88a4:	91003c01 	add	x1, x0, #0xf
    88a8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    88ac:	f90037e1 	str	x1, [sp, #104]
    88b0:	f9400000 	ldr	x0, [x0]
    88b4:	b98067e1 	ldrsw	x1, [sp, #100]
    88b8:	f9000001 	str	x1, [x0]
    88bc:	17fffe40 	b	81bc <_vfiprintf_r+0xdc>
    88c0:	39400280 	ldrb	w0, [x20]
    88c4:	7101b01f 	cmp	w0, #0x6c
    88c8:	54005960 	b.eq	93f4 <_vfiprintf_r+0x1314>  // b.none
    88cc:	321c039c 	orr	w28, w28, #0x10
    88d0:	17fffe8a 	b	82f8 <_vfiprintf_r+0x218>
    88d4:	39400280 	ldrb	w0, [x20]
    88d8:	7101a01f 	cmp	w0, #0x68
    88dc:	54005840 	b.eq	93e4 <_vfiprintf_r+0x1304>  // b.none
    88e0:	321a039c 	orr	w28, w28, #0x40
    88e4:	17fffe85 	b	82f8 <_vfiprintf_r+0x218>
    88e8:	39400280 	ldrb	w0, [x20]
    88ec:	321b039c 	orr	w28, w28, #0x20
    88f0:	17fffe82 	b	82f8 <_vfiprintf_r+0x218>
    88f4:	b940b3e0 	ldr	w0, [sp, #176]
    88f8:	2a1603e4 	mov	w4, w22
    88fc:	37f83ba0 	tbnz	w0, #31, 9070 <_vfiprintf_r+0xf90>
    8900:	f94037e2 	ldr	x2, [sp, #104]
    8904:	91003c40 	add	x0, x2, #0xf
    8908:	927df000 	and	x0, x0, #0xfffffffffffffff8
    890c:	f90037e0 	str	x0, [sp, #104]
    8910:	528f0600 	mov	w0, #0x7830                	// #30768
    8914:	90000041 	adrp	x1, 10000 <__func__.0+0x10>
    8918:	91020021 	add	x1, x1, #0x80
    891c:	321f0396 	orr	w22, w28, #0x2
    8920:	f90047e1 	str	x1, [sp, #136]
    8924:	7901e3e0 	strh	w0, [sp, #240]
    8928:	52800040 	mov	w0, #0x2                   	// #2
    892c:	f9400041 	ldr	x1, [x2]
    8930:	17ffff71 	b	86f4 <_vfiprintf_r+0x614>
    8934:	910643fb 	add	x27, sp, #0x190
    8938:	93407ee0 	sxtw	x0, w23
    893c:	52800021 	mov	w1, #0x1                   	// #1
    8940:	b9011be1 	str	w1, [sp, #280]
    8944:	f90093e0 	str	x0, [sp, #288]
    8948:	a91903fa 	stp	x26, x0, [sp, #400]
    894c:	d503201f 	nop
    8950:	91004365 	add	x5, x27, #0x10
    8954:	17fffebb 	b	8440 <_vfiprintf_r+0x360>
    8958:	2a1c03f6 	mov	w22, w28
    895c:	d503201f 	nop
    8960:	7100041f 	cmp	w0, #0x1
    8964:	54002a20 	b.eq	8ea8 <_vfiprintf_r+0xdc8>  // b.none
    8968:	910633f7 	add	x23, sp, #0x18c
    896c:	aa1703fa 	mov	x26, x23
    8970:	7100081f 	cmp	w0, #0x2
    8974:	54000161 	b.ne	89a0 <_vfiprintf_r+0x8c0>  // b.any
    8978:	f94047e2 	ldr	x2, [sp, #136]
    897c:	d503201f 	nop
    8980:	92400c20 	and	x0, x1, #0xf
    8984:	d344fc21 	lsr	x1, x1, #4
    8988:	38606840 	ldrb	w0, [x2, x0]
    898c:	381fff40 	strb	w0, [x26, #-1]!
    8990:	b5ffff81 	cbnz	x1, 8980 <_vfiprintf_r+0x8a0>
    8994:	4b1a02f7 	sub	w23, w23, w26
    8998:	2a1603fc 	mov	w28, w22
    899c:	17ffff65 	b	8730 <_vfiprintf_r+0x650>
    89a0:	12000820 	and	w0, w1, #0x7
    89a4:	aa1a03e2 	mov	x2, x26
    89a8:	1100c000 	add	w0, w0, #0x30
    89ac:	381fff40 	strb	w0, [x26, #-1]!
    89b0:	d343fc21 	lsr	x1, x1, #3
    89b4:	b5ffff61 	cbnz	x1, 89a0 <_vfiprintf_r+0x8c0>
    89b8:	7100c01f 	cmp	w0, #0x30
    89bc:	1a9f07e0 	cset	w0, ne  // ne = any
    89c0:	6a0002df 	tst	w22, w0
    89c4:	54fffe80 	b.eq	8994 <_vfiprintf_r+0x8b4>  // b.none
    89c8:	d1000842 	sub	x2, x2, #0x2
    89cc:	52800600 	mov	w0, #0x30                  	// #48
    89d0:	2a1603fc 	mov	w28, w22
    89d4:	4b0202f7 	sub	w23, w23, w2
    89d8:	381ff340 	sturb	w0, [x26, #-1]
    89dc:	aa0203fa 	mov	x26, x2
    89e0:	17ffff54 	b	8730 <_vfiprintf_r+0x650>
    89e4:	b94063e2 	ldr	w2, [sp, #96]
    89e8:	4b160058 	sub	w24, w2, w22
    89ec:	7100031f 	cmp	w24, #0x0
    89f0:	54ffd04d 	b.le	83f8 <_vfiprintf_r+0x318>
    89f4:	7100431f 	cmp	w24, #0x10
    89f8:	540073cd 	b.le	9870 <_vfiprintf_r+0x1790>
    89fc:	2a0103e3 	mov	w3, w1
    8a00:	90000049 	adrp	x9, 10000 <__func__.0+0x10>
    8a04:	aa1403e1 	mov	x1, x20
    8a08:	91060129 	add	x9, x9, #0x180
    8a0c:	aa1303f4 	mov	x20, x19
    8a10:	d2800208 	mov	x8, #0x10                  	// #16
    8a14:	2a1803f3 	mov	w19, w24
    8a18:	aa0103f8 	mov	x24, x1
    8a1c:	b90093e4 	str	w4, [sp, #144]
    8a20:	b900b7f6 	str	w22, [sp, #180]
    8a24:	aa1903f6 	mov	x22, x25
    8a28:	aa0903f9 	mov	x25, x9
    8a2c:	14000007 	b	8a48 <_vfiprintf_r+0x968>
    8a30:	1100086a 	add	w10, w3, #0x2
    8a34:	9100437b 	add	x27, x27, #0x10
    8a38:	2a0203e3 	mov	w3, w2
    8a3c:	51004273 	sub	w19, w19, #0x10
    8a40:	7100427f 	cmp	w19, #0x10
    8a44:	540002cd 	b.le	8a9c <_vfiprintf_r+0x9bc>
    8a48:	91004000 	add	x0, x0, #0x10
    8a4c:	11000462 	add	w2, w3, #0x1
    8a50:	a9002379 	stp	x25, x8, [x27]
    8a54:	b9011be2 	str	w2, [sp, #280]
    8a58:	f90093e0 	str	x0, [sp, #288]
    8a5c:	71001c5f 	cmp	w2, #0x7
    8a60:	54fffe8d 	b.le	8a30 <_vfiprintf_r+0x950>
    8a64:	b4000d60 	cbz	x0, 8c10 <_vfiprintf_r+0xb30>
    8a68:	910443e2 	add	x2, sp, #0x110
    8a6c:	aa1603e1 	mov	x1, x22
    8a70:	aa1403e0 	mov	x0, x20
    8a74:	97fffd5b 	bl	7fe0 <__sprint_r.part.0>
    8a78:	35004c60 	cbnz	w0, 9404 <_vfiprintf_r+0x1324>
    8a7c:	b9411be3 	ldr	w3, [sp, #280]
    8a80:	51004273 	sub	w19, w19, #0x10
    8a84:	910643fb 	add	x27, sp, #0x190
    8a88:	d2800208 	mov	x8, #0x10                  	// #16
    8a8c:	1100046a 	add	w10, w3, #0x1
    8a90:	f94093e0 	ldr	x0, [sp, #288]
    8a94:	7100427f 	cmp	w19, #0x10
    8a98:	54fffd8c 	b.gt	8a48 <_vfiprintf_r+0x968>
    8a9c:	aa1803e1 	mov	x1, x24
    8aa0:	aa1903e9 	mov	x9, x25
    8aa4:	b94093e4 	ldr	w4, [sp, #144]
    8aa8:	aa1603f9 	mov	x25, x22
    8aac:	b940b7f6 	ldr	w22, [sp, #180]
    8ab0:	2a1303f8 	mov	w24, w19
    8ab4:	aa1403f3 	mov	x19, x20
    8ab8:	aa0103f4 	mov	x20, x1
    8abc:	93407f01 	sxtw	x1, w24
    8ac0:	a9000769 	stp	x9, x1, [x27]
    8ac4:	8b010000 	add	x0, x0, x1
    8ac8:	b9011bea 	str	w10, [sp, #280]
    8acc:	f90093e0 	str	x0, [sp, #288]
    8ad0:	71001d5f 	cmp	w10, #0x7
    8ad4:	5400258d 	b.le	8f84 <_vfiprintf_r+0xea4>
    8ad8:	b4005920 	cbz	x0, 95fc <_vfiprintf_r+0x151c>
    8adc:	910443e2 	add	x2, sp, #0x110
    8ae0:	aa1903e1 	mov	x1, x25
    8ae4:	aa1303e0 	mov	x0, x19
    8ae8:	b90093e4 	str	w4, [sp, #144]
    8aec:	97fffd3d 	bl	7fe0 <__sprint_r.part.0>
    8af0:	35ffd060 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8af4:	b94093e4 	ldr	w4, [sp, #144]
    8af8:	910643fb 	add	x27, sp, #0x190
    8afc:	b9411be1 	ldr	w1, [sp, #280]
    8b00:	4b170098 	sub	w24, w4, w23
    8b04:	11000428 	add	w8, w1, #0x1
    8b08:	f94093e0 	ldr	x0, [sp, #288]
    8b0c:	7100031f 	cmp	w24, #0x0
    8b10:	54ffc7ad 	b.le	8404 <_vfiprintf_r+0x324>
    8b14:	d503201f 	nop
    8b18:	90000049 	adrp	x9, 10000 <__func__.0+0x10>
    8b1c:	91060129 	add	x9, x9, #0x180
    8b20:	7100431f 	cmp	w24, #0x10
    8b24:	540004ed 	b.le	8bc0 <_vfiprintf_r+0xae0>
    8b28:	2a0103e3 	mov	w3, w1
    8b2c:	d2800204 	mov	x4, #0x10                  	// #16
    8b30:	f9004bf4 	str	x20, [sp, #144]
    8b34:	aa1903f4 	mov	x20, x25
    8b38:	aa1303f9 	mov	x25, x19
    8b3c:	aa0903f3 	mov	x19, x9
    8b40:	14000007 	b	8b5c <_vfiprintf_r+0xa7c>
    8b44:	11000868 	add	w8, w3, #0x2
    8b48:	9100437b 	add	x27, x27, #0x10
    8b4c:	2a0203e3 	mov	w3, w2
    8b50:	51004318 	sub	w24, w24, #0x10
    8b54:	7100431f 	cmp	w24, #0x10
    8b58:	540002cd 	b.le	8bb0 <_vfiprintf_r+0xad0>
    8b5c:	91004000 	add	x0, x0, #0x10
    8b60:	11000462 	add	w2, w3, #0x1
    8b64:	a9001373 	stp	x19, x4, [x27]
    8b68:	b9011be2 	str	w2, [sp, #280]
    8b6c:	f90093e0 	str	x0, [sp, #288]
    8b70:	71001c5f 	cmp	w2, #0x7
    8b74:	54fffe8d 	b.le	8b44 <_vfiprintf_r+0xa64>
    8b78:	b4000380 	cbz	x0, 8be8 <_vfiprintf_r+0xb08>
    8b7c:	910443e2 	add	x2, sp, #0x110
    8b80:	aa1403e1 	mov	x1, x20
    8b84:	aa1903e0 	mov	x0, x25
    8b88:	97fffd16 	bl	7fe0 <__sprint_r.part.0>
    8b8c:	35ffcb40 	cbnz	w0, 84f4 <_vfiprintf_r+0x414>
    8b90:	b9411be3 	ldr	w3, [sp, #280]
    8b94:	51004318 	sub	w24, w24, #0x10
    8b98:	910643fb 	add	x27, sp, #0x190
    8b9c:	d2800204 	mov	x4, #0x10                  	// #16
    8ba0:	11000468 	add	w8, w3, #0x1
    8ba4:	f94093e0 	ldr	x0, [sp, #288]
    8ba8:	7100431f 	cmp	w24, #0x10
    8bac:	54fffd8c 	b.gt	8b5c <_vfiprintf_r+0xa7c>
    8bb0:	aa1303e9 	mov	x9, x19
    8bb4:	aa1903f3 	mov	x19, x25
    8bb8:	aa1403f9 	mov	x25, x20
    8bbc:	f9404bf4 	ldr	x20, [sp, #144]
    8bc0:	93407f18 	sxtw	x24, w24
    8bc4:	8b180000 	add	x0, x0, x24
    8bc8:	a9006369 	stp	x9, x24, [x27]
    8bcc:	b9011be8 	str	w8, [sp, #280]
    8bd0:	f90093e0 	str	x0, [sp, #288]
    8bd4:	71001d1f 	cmp	w8, #0x7
    8bd8:	5400178c 	b.gt	8ec8 <_vfiprintf_r+0xde8>
    8bdc:	9100437b 	add	x27, x27, #0x10
    8be0:	11000508 	add	w8, w8, #0x1
    8be4:	17fffe08 	b	8404 <_vfiprintf_r+0x324>
    8be8:	910643fb 	add	x27, sp, #0x190
    8bec:	52800028 	mov	w8, #0x1                   	// #1
    8bf0:	52800003 	mov	w3, #0x0                   	// #0
    8bf4:	17ffffd7 	b	8b50 <_vfiprintf_r+0xa70>
    8bf8:	910443e2 	add	x2, sp, #0x110
    8bfc:	aa1903e1 	mov	x1, x25
    8c00:	aa1303e0 	mov	x0, x19
    8c04:	97fffcf7 	bl	7fe0 <__sprint_r.part.0>
    8c08:	34ffc340 	cbz	w0, 8470 <_vfiprintf_r+0x390>
    8c0c:	17fffe3c 	b	84fc <_vfiprintf_r+0x41c>
    8c10:	910643fb 	add	x27, sp, #0x190
    8c14:	5280002a 	mov	w10, #0x1                   	// #1
    8c18:	52800003 	mov	w3, #0x0                   	// #0
    8c1c:	17ffff88 	b	8a3c <_vfiprintf_r+0x95c>
    8c20:	b4001760 	cbz	x0, 8f0c <_vfiprintf_r+0xe2c>
    8c24:	910443e2 	add	x2, sp, #0x110
    8c28:	aa1903e1 	mov	x1, x25
    8c2c:	aa1303e0 	mov	x0, x19
    8c30:	b90093ea 	str	w10, [sp, #144]
    8c34:	b900b7e4 	str	w4, [sp, #180]
    8c38:	97fffcea 	bl	7fe0 <__sprint_r.part.0>
    8c3c:	35ffc600 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8c40:	b9411be1 	ldr	w1, [sp, #280]
    8c44:	910643fb 	add	x27, sp, #0x190
    8c48:	b94093ea 	ldr	w10, [sp, #144]
    8c4c:	b940b7e4 	ldr	w4, [sp, #180]
    8c50:	11000428 	add	w8, w1, #0x1
    8c54:	f94093e0 	ldr	x0, [sp, #288]
    8c58:	17fffdd0 	b	8398 <_vfiprintf_r+0x2b8>
    8c5c:	9103c3e0 	add	x0, sp, #0xf0
    8c60:	d2800041 	mov	x1, #0x2                   	// #2
    8c64:	910643fb 	add	x27, sp, #0x190
    8c68:	a91907e0 	stp	x0, x1, [sp, #400]
    8c6c:	aa0103e0 	mov	x0, x1
    8c70:	52800028 	mov	w8, #0x1                   	// #1
    8c74:	d503201f 	nop
    8c78:	2a0803e1 	mov	w1, w8
    8c7c:	9100437b 	add	x27, x27, #0x10
    8c80:	11000428 	add	w8, w1, #0x1
    8c84:	17fffddb 	b	83f0 <_vfiprintf_r+0x310>
    8c88:	7100413f 	cmp	w9, #0x10
    8c8c:	54005c4d 	b.le	9814 <_vfiprintf_r+0x1734>
    8c90:	90000048 	adrp	x8, 10000 <__func__.0+0x10>
    8c94:	9105c108 	add	x8, x8, #0x170
    8c98:	aa1b03e3 	mov	x3, x27
    8c9c:	d280020c 	mov	x12, #0x10                  	// #16
    8ca0:	2a1703fb 	mov	w27, w23
    8ca4:	2a1603f7 	mov	w23, w22
    8ca8:	aa0803f6 	mov	x22, x8
    8cac:	b90093ea 	str	w10, [sp, #144]
    8cb0:	b900b7e4 	str	w4, [sp, #180]
    8cb4:	2a0103e4 	mov	w4, w1
    8cb8:	f9005ff4 	str	x20, [sp, #184]
    8cbc:	aa1903f4 	mov	x20, x25
    8cc0:	2a0903f9 	mov	w25, w9
    8cc4:	14000008 	b	8ce4 <_vfiprintf_r+0xc04>
    8cc8:	1100088b 	add	w11, w4, #0x2
    8ccc:	91004063 	add	x3, x3, #0x10
    8cd0:	2a0203e4 	mov	w4, w2
    8cd4:	51004339 	sub	w25, w25, #0x10
    8cd8:	7100433f 	cmp	w25, #0x10
    8cdc:	540002cd 	b.le	8d34 <_vfiprintf_r+0xc54>
    8ce0:	11000482 	add	w2, w4, #0x1
    8ce4:	91004000 	add	x0, x0, #0x10
    8ce8:	a9003076 	stp	x22, x12, [x3]
    8cec:	b9011be2 	str	w2, [sp, #280]
    8cf0:	f90093e0 	str	x0, [sp, #288]
    8cf4:	71001c5f 	cmp	w2, #0x7
    8cf8:	54fffe8d 	b.le	8cc8 <_vfiprintf_r+0xbe8>
    8cfc:	b4000440 	cbz	x0, 8d84 <_vfiprintf_r+0xca4>
    8d00:	910443e2 	add	x2, sp, #0x110
    8d04:	aa1403e1 	mov	x1, x20
    8d08:	aa1303e0 	mov	x0, x19
    8d0c:	97fffcb5 	bl	7fe0 <__sprint_r.part.0>
    8d10:	35ffbf40 	cbnz	w0, 84f8 <_vfiprintf_r+0x418>
    8d14:	b9411be4 	ldr	w4, [sp, #280]
    8d18:	51004339 	sub	w25, w25, #0x10
    8d1c:	910643e3 	add	x3, sp, #0x190
    8d20:	d280020c 	mov	x12, #0x10                  	// #16
    8d24:	1100048b 	add	w11, w4, #0x1
    8d28:	f94093e0 	ldr	x0, [sp, #288]
    8d2c:	7100433f 	cmp	w25, #0x10
    8d30:	54fffd8c 	b.gt	8ce0 <_vfiprintf_r+0xc00>
    8d34:	2a1903e9 	mov	w9, w25
    8d38:	b94093ea 	ldr	w10, [sp, #144]
    8d3c:	aa1403f9 	mov	x25, x20
    8d40:	b940b7e4 	ldr	w4, [sp, #180]
    8d44:	f9405ff4 	ldr	x20, [sp, #184]
    8d48:	aa1603e8 	mov	x8, x22
    8d4c:	2a1703f6 	mov	w22, w23
    8d50:	2a1b03f7 	mov	w23, w27
    8d54:	aa0303fb 	mov	x27, x3
    8d58:	93407d21 	sxtw	x1, w9
    8d5c:	a9000768 	stp	x8, x1, [x27]
    8d60:	8b010000 	add	x0, x0, x1
    8d64:	b9011beb 	str	w11, [sp, #280]
    8d68:	f90093e0 	str	x0, [sp, #288]
    8d6c:	71001d7f 	cmp	w11, #0x7
    8d70:	54000ecc 	b.gt	8f48 <_vfiprintf_r+0xe68>
    8d74:	9100437b 	add	x27, x27, #0x10
    8d78:	11000568 	add	w8, w11, #0x1
    8d7c:	2a0b03e1 	mov	w1, w11
    8d80:	17fffd78 	b	8360 <_vfiprintf_r+0x280>
    8d84:	910643e3 	add	x3, sp, #0x190
    8d88:	52800004 	mov	w4, #0x0                   	// #0
    8d8c:	5280002b 	mov	w11, #0x1                   	// #1
    8d90:	17ffffd1 	b	8cd4 <_vfiprintf_r+0xbf4>
    8d94:	b9011bff 	str	wzr, [sp, #280]
    8d98:	3610079c 	tbz	w28, #2, 8e88 <_vfiprintf_r+0xda8>
    8d9c:	b94063e1 	ldr	w1, [sp, #96]
    8da0:	4b160037 	sub	w23, w1, w22
    8da4:	710002ff 	cmp	w23, #0x0
    8da8:	5400070d 	b.le	8e88 <_vfiprintf_r+0xda8>
    8dac:	910643e5 	add	x5, sp, #0x190
    8db0:	b9411be2 	ldr	w2, [sp, #280]
    8db4:	710042ff 	cmp	w23, #0x10
    8db8:	5400546d 	b.le	9844 <_vfiprintf_r+0x1764>
    8dbc:	90000048 	adrp	x8, 10000 <__func__.0+0x10>
    8dc0:	9105c108 	add	x8, x8, #0x170
    8dc4:	aa0803fa 	mov	x26, x8
    8dc8:	d2800218 	mov	x24, #0x10                  	// #16
    8dcc:	14000007 	b	8de8 <_vfiprintf_r+0xd08>
    8dd0:	11000844 	add	w4, w2, #0x2
    8dd4:	910040a5 	add	x5, x5, #0x10
    8dd8:	2a0303e2 	mov	w2, w3
    8ddc:	510042f7 	sub	w23, w23, #0x10
    8de0:	710042ff 	cmp	w23, #0x10
    8de4:	540002ad 	b.le	8e38 <_vfiprintf_r+0xd58>
    8de8:	91004000 	add	x0, x0, #0x10
    8dec:	11000443 	add	w3, w2, #0x1
    8df0:	a90060ba 	stp	x26, x24, [x5]
    8df4:	b9011be3 	str	w3, [sp, #280]
    8df8:	f90093e0 	str	x0, [sp, #288]
    8dfc:	71001c7f 	cmp	w3, #0x7
    8e00:	54fffe8d 	b.le	8dd0 <_vfiprintf_r+0xcf0>
    8e04:	b40003a0 	cbz	x0, 8e78 <_vfiprintf_r+0xd98>
    8e08:	910443e2 	add	x2, sp, #0x110
    8e0c:	aa1903e1 	mov	x1, x25
    8e10:	aa1303e0 	mov	x0, x19
    8e14:	97fffc73 	bl	7fe0 <__sprint_r.part.0>
    8e18:	35ffb720 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8e1c:	b9411be2 	ldr	w2, [sp, #280]
    8e20:	510042f7 	sub	w23, w23, #0x10
    8e24:	910643e5 	add	x5, sp, #0x190
    8e28:	11000444 	add	w4, w2, #0x1
    8e2c:	f94093e0 	ldr	x0, [sp, #288]
    8e30:	710042ff 	cmp	w23, #0x10
    8e34:	54fffdac 	b.gt	8de8 <_vfiprintf_r+0xd08>
    8e38:	aa1a03e8 	mov	x8, x26
    8e3c:	93407ef7 	sxtw	x23, w23
    8e40:	a9005ca8 	stp	x8, x23, [x5]
    8e44:	8b170000 	add	x0, x0, x23
    8e48:	b9011be4 	str	w4, [sp, #280]
    8e4c:	f90093e0 	str	x0, [sp, #288]
    8e50:	71001c9f 	cmp	w4, #0x7
    8e54:	54ffb00d 	b.le	8454 <_vfiprintf_r+0x374>
    8e58:	b4000180 	cbz	x0, 8e88 <_vfiprintf_r+0xda8>
    8e5c:	910443e2 	add	x2, sp, #0x110
    8e60:	aa1903e1 	mov	x1, x25
    8e64:	aa1303e0 	mov	x0, x19
    8e68:	97fffc5e 	bl	7fe0 <__sprint_r.part.0>
    8e6c:	35ffb480 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8e70:	f94093e0 	ldr	x0, [sp, #288]
    8e74:	17fffd78 	b	8454 <_vfiprintf_r+0x374>
    8e78:	910643e5 	add	x5, sp, #0x190
    8e7c:	52800024 	mov	w4, #0x1                   	// #1
    8e80:	52800002 	mov	w2, #0x0                   	// #0
    8e84:	17ffffd6 	b	8ddc <_vfiprintf_r+0xcfc>
    8e88:	b94063e0 	ldr	w0, [sp, #96]
    8e8c:	6b16001f 	cmp	w0, w22
    8e90:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    8e94:	b94067e0 	ldr	w0, [sp, #100]
    8e98:	0b030000 	add	w0, w0, w3
    8e9c:	b90067e0 	str	w0, [sp, #100]
    8ea0:	17fffd74 	b	8470 <_vfiprintf_r+0x390>
    8ea4:	2a1c03f6 	mov	w22, w28
    8ea8:	f100243f 	cmp	x1, #0x9
    8eac:	540024c8 	b.hi	9344 <_vfiprintf_r+0x1264>  // b.pmore
    8eb0:	1100c021 	add	w1, w1, #0x30
    8eb4:	2a1603fc 	mov	w28, w22
    8eb8:	91062ffa 	add	x26, sp, #0x18b
    8ebc:	52800037 	mov	w23, #0x1                   	// #1
    8ec0:	39062fe1 	strb	w1, [sp, #395]
    8ec4:	17fffe1b 	b	8730 <_vfiprintf_r+0x650>
    8ec8:	b4ffd360 	cbz	x0, 8934 <_vfiprintf_r+0x854>
    8ecc:	910443e2 	add	x2, sp, #0x110
    8ed0:	aa1903e1 	mov	x1, x25
    8ed4:	aa1303e0 	mov	x0, x19
    8ed8:	97fffc42 	bl	7fe0 <__sprint_r.part.0>
    8edc:	35ffb100 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8ee0:	b9411be8 	ldr	w8, [sp, #280]
    8ee4:	910643fb 	add	x27, sp, #0x190
    8ee8:	f94093e0 	ldr	x0, [sp, #288]
    8eec:	11000508 	add	w8, w8, #0x1
    8ef0:	17fffd45 	b	8404 <_vfiprintf_r+0x324>
    8ef4:	910643fb 	add	x27, sp, #0x190
    8ef8:	b9011bff 	str	wzr, [sp, #280]
    8efc:	17fffcf4 	b	82cc <_vfiprintf_r+0x1ec>
    8f00:	910633fa 	add	x26, sp, #0x18c
    8f04:	52800004 	mov	w4, #0x0                   	// #0
    8f08:	17fffe0a 	b	8730 <_vfiprintf_r+0x650>
    8f0c:	350007ca 	cbnz	w10, 9004 <_vfiprintf_r+0xf24>
    8f10:	910643fb 	add	x27, sp, #0x190
    8f14:	52800001 	mov	w1, #0x0                   	// #0
    8f18:	52800028 	mov	w8, #0x1                   	// #1
    8f1c:	17fffd35 	b	83f0 <_vfiprintf_r+0x310>
    8f20:	910643fb 	add	x27, sp, #0x190
    8f24:	52800028 	mov	w8, #0x1                   	// #1
    8f28:	52800001 	mov	w1, #0x0                   	// #0
    8f2c:	17fffd31 	b	83f0 <_vfiprintf_r+0x310>
    8f30:	528005a0 	mov	w0, #0x2d                  	// #45
    8f34:	cb0103e1 	neg	x1, x1
    8f38:	2a1c03f6 	mov	w22, w28
    8f3c:	3903bfe0 	strb	w0, [sp, #239]
    8f40:	52800020 	mov	w0, #0x1                   	// #1
    8f44:	17fffded 	b	86f8 <_vfiprintf_r+0x618>
    8f48:	b4000d60 	cbz	x0, 90f4 <_vfiprintf_r+0x1014>
    8f4c:	910443e2 	add	x2, sp, #0x110
    8f50:	aa1903e1 	mov	x1, x25
    8f54:	aa1303e0 	mov	x0, x19
    8f58:	b90093ea 	str	w10, [sp, #144]
    8f5c:	b900b7e4 	str	w4, [sp, #180]
    8f60:	97fffc20 	bl	7fe0 <__sprint_r.part.0>
    8f64:	35ffacc0 	cbnz	w0, 84fc <_vfiprintf_r+0x41c>
    8f68:	b9411be1 	ldr	w1, [sp, #280]
    8f6c:	910643fb 	add	x27, sp, #0x190
    8f70:	b94093ea 	ldr	w10, [sp, #144]
    8f74:	b940b7e4 	ldr	w4, [sp, #180]
    8f78:	11000428 	add	w8, w1, #0x1
    8f7c:	f94093e0 	ldr	x0, [sp, #288]
    8f80:	17fffcf8 	b	8360 <_vfiprintf_r+0x280>
    8f84:	9100437b 	add	x27, x27, #0x10
    8f88:	11000548 	add	w8, w10, #0x1
    8f8c:	2a0a03e1 	mov	w1, w10
    8f90:	17fffd1a 	b	83f8 <_vfiprintf_r+0x318>
    8f94:	39400280 	ldrb	w0, [x20]
    8f98:	17fffcd8 	b	82f8 <_vfiprintf_r+0x218>
    8f9c:	36302a9c 	tbz	w28, #6, 94ec <_vfiprintf_r+0x140c>
    8fa0:	37f83d20 	tbnz	w0, #31, 9744 <_vfiprintf_r+0x1664>
    8fa4:	f94037e0 	ldr	x0, [sp, #104]
    8fa8:	91002c01 	add	x1, x0, #0xb
    8fac:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8fb0:	f90037e1 	str	x1, [sp, #104]
    8fb4:	79800001 	ldrsh	x1, [x0]
    8fb8:	aa0103e0 	mov	x0, x1
    8fbc:	17fffe01 	b	87c0 <_vfiprintf_r+0x6e0>
    8fc0:	3630247c 	tbz	w28, #6, 944c <_vfiprintf_r+0x136c>
    8fc4:	37f83960 	tbnz	w0, #31, 96f0 <_vfiprintf_r+0x1610>
    8fc8:	f94037e0 	ldr	x0, [sp, #104]
    8fcc:	91002c01 	add	x1, x0, #0xb
    8fd0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8fd4:	f90037e1 	str	x1, [sp, #104]
    8fd8:	79400001 	ldrh	w1, [x0]
    8fdc:	17fffdea 	b	8784 <_vfiprintf_r+0x6a4>
    8fe0:	36302476 	tbz	w22, #6, 946c <_vfiprintf_r+0x138c>
    8fe4:	37f839c0 	tbnz	w0, #31, 971c <_vfiprintf_r+0x163c>
    8fe8:	f94037e0 	ldr	x0, [sp, #104]
    8fec:	91002c01 	add	x1, x0, #0xb
    8ff0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8ff4:	f90037e1 	str	x1, [sp, #104]
    8ff8:	79400001 	ldrh	w1, [x0]
    8ffc:	52800020 	mov	w0, #0x1                   	// #1
    9000:	17fffdbd 	b	86f4 <_vfiprintf_r+0x614>
    9004:	9103c3e0 	add	x0, sp, #0xf0
    9008:	d2800042 	mov	x2, #0x2                   	// #2
    900c:	910643fb 	add	x27, sp, #0x190
    9010:	52800021 	mov	w1, #0x1                   	// #1
    9014:	a9190be0 	stp	x0, x2, [sp, #400]
    9018:	aa0203e0 	mov	x0, x2
    901c:	17ffff18 	b	8c7c <_vfiprintf_r+0xb9c>
    9020:	2a1603e4 	mov	w4, w22
    9024:	17fffddd 	b	8798 <_vfiprintf_r+0x6b8>
    9028:	b940b3e1 	ldr	w1, [sp, #176]
    902c:	11002021 	add	w1, w1, #0x8
    9030:	7100003f 	cmp	w1, #0x0
    9034:	54002d6d 	b.le	95e0 <_vfiprintf_r+0x1500>
    9038:	f94037e2 	ldr	x2, [sp, #104]
    903c:	b900b3e1 	str	w1, [sp, #176]
    9040:	91003c58 	add	x24, x2, #0xf
    9044:	927df318 	and	x24, x24, #0xfffffffffffffff8
    9048:	17fffd46 	b	8560 <_vfiprintf_r+0x480>
    904c:	b940b3e0 	ldr	w0, [sp, #176]
    9050:	11002001 	add	w1, w0, #0x8
    9054:	7100003f 	cmp	w1, #0x0
    9058:	54002a2d 	b.le	959c <_vfiprintf_r+0x14bc>
    905c:	f94037e0 	ldr	x0, [sp, #104]
    9060:	b900b3e1 	str	w1, [sp, #176]
    9064:	91002c00 	add	x0, x0, #0xb
    9068:	927df000 	and	x0, x0, #0xfffffffffffffff8
    906c:	17fffd8f 	b	86a8 <_vfiprintf_r+0x5c8>
    9070:	b940b3e0 	ldr	w0, [sp, #176]
    9074:	11002000 	add	w0, w0, #0x8
    9078:	7100001f 	cmp	w0, #0x0
    907c:	5400286d 	b.le	9588 <_vfiprintf_r+0x14a8>
    9080:	f94037e2 	ldr	x2, [sp, #104]
    9084:	b900b3e0 	str	w0, [sp, #176]
    9088:	91003c41 	add	x1, x2, #0xf
    908c:	927df020 	and	x0, x1, #0xfffffffffffffff8
    9090:	f90037e0 	str	x0, [sp, #104]
    9094:	17fffe1f 	b	8910 <_vfiprintf_r+0x830>
    9098:	b940b3e0 	ldr	w0, [sp, #176]
    909c:	37f828e0 	tbnz	w0, #31, 95b8 <_vfiprintf_r+0x14d8>
    90a0:	f94037e0 	ldr	x0, [sp, #104]
    90a4:	91002c01 	add	x1, x0, #0xb
    90a8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    90ac:	f90037e1 	str	x1, [sp, #104]
    90b0:	b9400000 	ldr	w0, [x0]
    90b4:	52800036 	mov	w22, #0x1                   	// #1
    90b8:	9104a3fa 	add	x26, sp, #0x128
    90bc:	2a1603f7 	mov	w23, w22
    90c0:	3903bfff 	strb	wzr, [sp, #239]
    90c4:	3904a3e0 	strb	w0, [sp, #296]
    90c8:	17fffc96 	b	8320 <_vfiprintf_r+0x240>
    90cc:	b940b3e0 	ldr	w0, [sp, #176]
    90d0:	11002001 	add	w1, w0, #0x8
    90d4:	7100003f 	cmp	w1, #0x0
    90d8:	5400394d 	b.le	9800 <_vfiprintf_r+0x1720>
    90dc:	f94037e0 	ldr	x0, [sp, #104]
    90e0:	b900b3e1 	str	w1, [sp, #176]
    90e4:	91003c02 	add	x2, x0, #0xf
    90e8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    90ec:	f90037e1 	str	x1, [sp, #104]
    90f0:	17fffdf0 	b	88b0 <_vfiprintf_r+0x7d0>
    90f4:	3943bfe1 	ldrb	w1, [sp, #239]
    90f8:	35002d81 	cbnz	w1, 96a8 <_vfiprintf_r+0x15c8>
    90fc:	35ffdb0a 	cbnz	w10, 8c5c <_vfiprintf_r+0xb7c>
    9100:	910643fb 	add	x27, sp, #0x190
    9104:	52800001 	mov	w1, #0x0                   	// #0
    9108:	52800028 	mov	w8, #0x1                   	// #1
    910c:	17fffcbb 	b	83f8 <_vfiprintf_r+0x318>
    9110:	2a1603e4 	mov	w4, w22
    9114:	2a1c03f6 	mov	w22, w28
    9118:	17fffd6d 	b	86cc <_vfiprintf_r+0x5ec>
    911c:	2a1603e4 	mov	w4, w22
    9120:	f0000021 	adrp	x1, 10000 <__func__.0+0x10>
    9124:	91020021 	add	x1, x1, #0x80
    9128:	f90047e1 	str	x1, [sp, #136]
    912c:	b940b3e1 	ldr	w1, [sp, #176]
    9130:	3728023c 	tbnz	w28, #5, 9174 <_vfiprintf_r+0x1094>
    9134:	3720021c 	tbnz	w28, #4, 9174 <_vfiprintf_r+0x1094>
    9138:	36301b7c 	tbz	w28, #6, 94a4 <_vfiprintf_r+0x13c4>
    913c:	37f82c41 	tbnz	w1, #31, 96c4 <_vfiprintf_r+0x15e4>
    9140:	f94037e1 	ldr	x1, [sp, #104]
    9144:	91002c22 	add	x2, x1, #0xb
    9148:	927df042 	and	x2, x2, #0xfffffffffffffff8
    914c:	79400021 	ldrh	w1, [x1]
    9150:	f90037e2 	str	x2, [sp, #104]
    9154:	1400000e 	b	918c <_vfiprintf_r+0x10ac>
    9158:	f0000021 	adrp	x1, 10000 <__func__.0+0x10>
    915c:	2a1603e4 	mov	w4, w22
    9160:	91026021 	add	x1, x1, #0x98
    9164:	f90047e1 	str	x1, [sp, #136]
    9168:	17fffff1 	b	912c <_vfiprintf_r+0x104c>
    916c:	2a1603e4 	mov	w4, w22
    9170:	17fffd7c 	b	8760 <_vfiprintf_r+0x680>
    9174:	37f801a1 	tbnz	w1, #31, 91a8 <_vfiprintf_r+0x10c8>
    9178:	f94037e1 	ldr	x1, [sp, #104]
    917c:	91003c22 	add	x2, x1, #0xf
    9180:	927df042 	and	x2, x2, #0xfffffffffffffff8
    9184:	f90037e2 	str	x2, [sp, #104]
    9188:	f9400021 	ldr	x1, [x1]
    918c:	f100003f 	cmp	x1, #0x0
    9190:	1a9f07e2 	cset	w2, ne  // ne = any
    9194:	6a02039f 	tst	w28, w2
    9198:	54000581 	b.ne	9248 <_vfiprintf_r+0x1168>  // b.any
    919c:	12157b96 	and	w22, w28, #0xfffffbff
    91a0:	52800040 	mov	w0, #0x2                   	// #2
    91a4:	17fffd54 	b	86f4 <_vfiprintf_r+0x614>
    91a8:	b940b3e1 	ldr	w1, [sp, #176]
    91ac:	11002022 	add	w2, w1, #0x8
    91b0:	7100005f 	cmp	w2, #0x0
    91b4:	540016ed 	b.le	9490 <_vfiprintf_r+0x13b0>
    91b8:	f94037e1 	ldr	x1, [sp, #104]
    91bc:	b900b3e2 	str	w2, [sp, #176]
    91c0:	91003c23 	add	x3, x1, #0xf
    91c4:	927df062 	and	x2, x3, #0xfffffffffffffff8
    91c8:	f90037e2 	str	x2, [sp, #104]
    91cc:	17ffffef 	b	9188 <_vfiprintf_r+0x10a8>
    91d0:	b940b3e0 	ldr	w0, [sp, #176]
    91d4:	11002001 	add	w1, w0, #0x8
    91d8:	7100003f 	cmp	w1, #0x0
    91dc:	540017ed 	b.le	94d8 <_vfiprintf_r+0x13f8>
    91e0:	f94037e0 	ldr	x0, [sp, #104]
    91e4:	b900b3e1 	str	w1, [sp, #176]
    91e8:	91003c02 	add	x2, x0, #0xf
    91ec:	927df041 	and	x1, x2, #0xfffffffffffffff8
    91f0:	f90037e1 	str	x1, [sp, #104]
    91f4:	17fffd71 	b	87b8 <_vfiprintf_r+0x6d8>
    91f8:	b940b3e0 	ldr	w0, [sp, #176]
    91fc:	11002001 	add	w1, w0, #0x8
    9200:	7100003f 	cmp	w1, #0x0
    9204:	5400186d 	b.le	9510 <_vfiprintf_r+0x1430>
    9208:	f94037e0 	ldr	x0, [sp, #104]
    920c:	b900b3e1 	str	w1, [sp, #176]
    9210:	91003c02 	add	x2, x0, #0xf
    9214:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9218:	f90037e1 	str	x1, [sp, #104]
    921c:	17fffd59 	b	8780 <_vfiprintf_r+0x6a0>
    9220:	b940b3e0 	ldr	w0, [sp, #176]
    9224:	11002000 	add	w0, w0, #0x8
    9228:	7100001f 	cmp	w0, #0x0
    922c:	540014cd 	b.le	94c4 <_vfiprintf_r+0x13e4>
    9230:	f94037e1 	ldr	x1, [sp, #104]
    9234:	b900b3e0 	str	w0, [sp, #176]
    9238:	91003c22 	add	x2, x1, #0xf
    923c:	927df040 	and	x0, x2, #0xfffffffffffffff8
    9240:	f90037e0 	str	x0, [sp, #104]
    9244:	17fffd2a 	b	86ec <_vfiprintf_r+0x60c>
    9248:	321f039c 	orr	w28, w28, #0x2
    924c:	3903c7e0 	strb	w0, [sp, #241]
    9250:	52800600 	mov	w0, #0x30                  	// #48
    9254:	3903c3e0 	strb	w0, [sp, #240]
    9258:	17ffffd1 	b	919c <_vfiprintf_r+0x10bc>
    925c:	910403e0 	add	x0, sp, #0x100
    9260:	d2800102 	mov	x2, #0x8                   	// #8
    9264:	52800001 	mov	w1, #0x0                   	// #0
    9268:	b9006be4 	str	w4, [sp, #104]
    926c:	f90087fa 	str	x26, [sp, #264]
    9270:	97fff9d4 	bl	79c0 <memset>
    9274:	b9406be4 	ldr	w4, [sp, #104]
    9278:	3100049f 	cmn	w4, #0x1
    927c:	54001680 	b.eq	954c <_vfiprintf_r+0x146c>  // b.none
    9280:	d2800016 	mov	x22, #0x0                   	// #0
    9284:	52800017 	mov	w23, #0x0                   	// #0
    9288:	aa1603e0 	mov	x0, x22
    928c:	2a1703f6 	mov	w22, w23
    9290:	aa0003f7 	mov	x23, x0
    9294:	f90037f4 	str	x20, [sp, #104]
    9298:	2a0403f4 	mov	w20, w4
    929c:	1400000d 	b	92d0 <_vfiprintf_r+0x11f0>
    92a0:	910403e3 	add	x3, sp, #0x100
    92a4:	9104a3e1 	add	x1, sp, #0x128
    92a8:	aa1303e0 	mov	x0, x19
    92ac:	940002a9 	bl	9d50 <_wcrtomb_r>
    92b0:	3100041f 	cmn	w0, #0x1
    92b4:	54002d60 	b.eq	9860 <_vfiprintf_r+0x1780>  // b.none
    92b8:	0b0002c0 	add	w0, w22, w0
    92bc:	6b14001f 	cmp	w0, w20
    92c0:	540000ec 	b.gt	92dc <_vfiprintf_r+0x11fc>
    92c4:	910012f7 	add	x23, x23, #0x4
    92c8:	54003820 	b.eq	99cc <_vfiprintf_r+0x18ec>  // b.none
    92cc:	2a0003f6 	mov	w22, w0
    92d0:	f94087e0 	ldr	x0, [sp, #264]
    92d4:	b8776802 	ldr	w2, [x0, x23]
    92d8:	35fffe42 	cbnz	w2, 92a0 <_vfiprintf_r+0x11c0>
    92dc:	f94037f4 	ldr	x20, [sp, #104]
    92e0:	2a1603f7 	mov	w23, w22
    92e4:	340014b7 	cbz	w23, 9578 <_vfiprintf_r+0x1498>
    92e8:	71018eff 	cmp	w23, #0x63
    92ec:	540024ac 	b.gt	9780 <_vfiprintf_r+0x16a0>
    92f0:	9104a3fa 	add	x26, sp, #0x128
    92f4:	f9003bff 	str	xzr, [sp, #112]
    92f8:	93407ef6 	sxtw	x22, w23
    92fc:	d2800102 	mov	x2, #0x8                   	// #8
    9300:	52800001 	mov	w1, #0x0                   	// #0
    9304:	910403e0 	add	x0, sp, #0x100
    9308:	97fff9ae 	bl	79c0 <memset>
    930c:	910403e4 	add	x4, sp, #0x100
    9310:	aa1603e3 	mov	x3, x22
    9314:	910423e2 	add	x2, sp, #0x108
    9318:	aa1a03e1 	mov	x1, x26
    931c:	aa1303e0 	mov	x0, x19
    9320:	940002d8 	bl	9e80 <_wcsrtombs_r>
    9324:	eb0002df 	cmp	x22, x0
    9328:	54004761 	b.ne	9c14 <_vfiprintf_r+0x1b34>  // b.any
    932c:	710002ff 	cmp	w23, #0x0
    9330:	52800004 	mov	w4, #0x0                   	// #0
    9334:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    9338:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    933c:	f90037f8 	str	x24, [sp, #104]
    9340:	17fffcff 	b	873c <_vfiprintf_r+0x65c>
    9344:	910633f7 	add	x23, sp, #0x18c
    9348:	121602c6 	and	w6, w22, #0x400
    934c:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    9350:	aa1703e2 	mov	x2, x23
    9354:	aa1403e3 	mov	x3, x20
    9358:	aa1703e5 	mov	x5, x23
    935c:	52800008 	mov	w8, #0x0                   	// #0
    9360:	aa1303f7 	mov	x23, x19
    9364:	f29999bc 	movk	x28, #0xcccd
    9368:	2a0603f3 	mov	w19, w6
    936c:	f9404ff4 	ldr	x20, [sp, #152]
    9370:	14000007 	b	938c <_vfiprintf_r+0x12ac>
    9374:	9bdc7c38 	umulh	x24, x1, x28
    9378:	d343ff18 	lsr	x24, x24, #3
    937c:	f100243f 	cmp	x1, #0x9
    9380:	54000249 	b.ls	93c8 <_vfiprintf_r+0x12e8>  // b.plast
    9384:	aa1803e1 	mov	x1, x24
    9388:	aa1a03e2 	mov	x2, x26
    938c:	9bdc7c38 	umulh	x24, x1, x28
    9390:	11000508 	add	w8, w8, #0x1
    9394:	d100045a 	sub	x26, x2, #0x1
    9398:	d343ff18 	lsr	x24, x24, #3
    939c:	8b180b00 	add	x0, x24, x24, lsl #2
    93a0:	cb000420 	sub	x0, x1, x0, lsl #1
    93a4:	1100c000 	add	w0, w0, #0x30
    93a8:	381ff040 	sturb	w0, [x2, #-1]
    93ac:	34fffe53 	cbz	w19, 9374 <_vfiprintf_r+0x1294>
    93b0:	39400280 	ldrb	w0, [x20]
    93b4:	7103fc1f 	cmp	w0, #0xff
    93b8:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    93bc:	54fffdc1 	b.ne	9374 <_vfiprintf_r+0x1294>  // b.any
    93c0:	f100243f 	cmp	x1, #0x9
    93c4:	54002028 	b.hi	97c8 <_vfiprintf_r+0x16e8>  // b.pmore
    93c8:	aa1703f3 	mov	x19, x23
    93cc:	aa0503f7 	mov	x23, x5
    93d0:	4b1a02f7 	sub	w23, w23, w26
    93d4:	2a1603fc 	mov	w28, w22
    93d8:	f9004ff4 	str	x20, [sp, #152]
    93dc:	aa0303f4 	mov	x20, x3
    93e0:	17fffcd4 	b	8730 <_vfiprintf_r+0x650>
    93e4:	39400680 	ldrb	w0, [x20, #1]
    93e8:	3217039c 	orr	w28, w28, #0x200
    93ec:	91000694 	add	x20, x20, #0x1
    93f0:	17fffbc2 	b	82f8 <_vfiprintf_r+0x218>
    93f4:	39400680 	ldrb	w0, [x20, #1]
    93f8:	321b039c 	orr	w28, w28, #0x20
    93fc:	91000694 	add	x20, x20, #0x1
    9400:	17fffbbe 	b	82f8 <_vfiprintf_r+0x218>
    9404:	aa1403f3 	mov	x19, x20
    9408:	aa1603f9 	mov	x25, x22
    940c:	17fffc3c 	b	84fc <_vfiprintf_r+0x41c>
    9410:	7100189f 	cmp	w4, #0x6
    9414:	528000d7 	mov	w23, #0x6                   	// #6
    9418:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    941c:	f0000027 	adrp	x7, 10000 <__func__.0+0x10>
    9420:	2a1703f6 	mov	w22, w23
    9424:	9102c0fa 	add	x26, x7, #0xb0
    9428:	f90037f8 	str	x24, [sp, #104]
    942c:	17fffbbd 	b	8320 <_vfiprintf_r+0x240>
    9430:	f94093e0 	ldr	x0, [sp, #288]
    9434:	b4ff86e0 	cbz	x0, 8510 <_vfiprintf_r+0x430>
    9438:	aa1303e0 	mov	x0, x19
    943c:	910443e2 	add	x2, sp, #0x110
    9440:	aa1903e1 	mov	x1, x25
    9444:	97fffae7 	bl	7fe0 <__sprint_r.part.0>
    9448:	17fffc32 	b	8510 <_vfiprintf_r+0x430>
    944c:	3648101c 	tbz	w28, #9, 964c <_vfiprintf_r+0x156c>
    9450:	37f822e0 	tbnz	w0, #31, 98ac <_vfiprintf_r+0x17cc>
    9454:	f94037e0 	ldr	x0, [sp, #104]
    9458:	91002c01 	add	x1, x0, #0xb
    945c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9460:	f90037e1 	str	x1, [sp, #104]
    9464:	39400001 	ldrb	w1, [x0]
    9468:	17fffcc7 	b	8784 <_vfiprintf_r+0x6a4>
    946c:	364810f6 	tbz	w22, #9, 9688 <_vfiprintf_r+0x15a8>
    9470:	37f82880 	tbnz	w0, #31, 9980 <_vfiprintf_r+0x18a0>
    9474:	f94037e0 	ldr	x0, [sp, #104]
    9478:	91002c01 	add	x1, x0, #0xb
    947c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9480:	f90037e1 	str	x1, [sp, #104]
    9484:	39400001 	ldrb	w1, [x0]
    9488:	52800020 	mov	w0, #0x1                   	// #1
    948c:	17fffc9a 	b	86f4 <_vfiprintf_r+0x614>
    9490:	f94043e3 	ldr	x3, [sp, #128]
    9494:	b940b3e1 	ldr	w1, [sp, #176]
    9498:	b900b3e2 	str	w2, [sp, #176]
    949c:	8b21c061 	add	x1, x3, w1, sxtw
    94a0:	17ffff3a 	b	9188 <_vfiprintf_r+0x10a8>
    94a4:	36480c7c 	tbz	w28, #9, 9630 <_vfiprintf_r+0x1550>
    94a8:	37f82421 	tbnz	w1, #31, 992c <_vfiprintf_r+0x184c>
    94ac:	f94037e1 	ldr	x1, [sp, #104]
    94b0:	91002c22 	add	x2, x1, #0xb
    94b4:	927df042 	and	x2, x2, #0xfffffffffffffff8
    94b8:	39400021 	ldrb	w1, [x1]
    94bc:	f90037e2 	str	x2, [sp, #104]
    94c0:	17ffff33 	b	918c <_vfiprintf_r+0x10ac>
    94c4:	f94043e2 	ldr	x2, [sp, #128]
    94c8:	b940b3e1 	ldr	w1, [sp, #176]
    94cc:	b900b3e0 	str	w0, [sp, #176]
    94d0:	8b21c041 	add	x1, x2, w1, sxtw
    94d4:	17fffc86 	b	86ec <_vfiprintf_r+0x60c>
    94d8:	f94043e2 	ldr	x2, [sp, #128]
    94dc:	b940b3e0 	ldr	w0, [sp, #176]
    94e0:	b900b3e1 	str	w1, [sp, #176]
    94e4:	8b20c040 	add	x0, x2, w0, sxtw
    94e8:	17fffcb4 	b	87b8 <_vfiprintf_r+0x6d8>
    94ec:	36480bfc 	tbz	w28, #9, 9668 <_vfiprintf_r+0x1588>
    94f0:	37f820a0 	tbnz	w0, #31, 9904 <_vfiprintf_r+0x1824>
    94f4:	f94037e0 	ldr	x0, [sp, #104]
    94f8:	91002c01 	add	x1, x0, #0xb
    94fc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9500:	f90037e1 	str	x1, [sp, #104]
    9504:	39800001 	ldrsb	x1, [x0]
    9508:	aa0103e0 	mov	x0, x1
    950c:	17fffcad 	b	87c0 <_vfiprintf_r+0x6e0>
    9510:	f94043e2 	ldr	x2, [sp, #128]
    9514:	b940b3e0 	ldr	w0, [sp, #176]
    9518:	b900b3e1 	str	w1, [sp, #176]
    951c:	8b20c040 	add	x0, x2, w0, sxtw
    9520:	17fffc98 	b	8780 <_vfiprintf_r+0x6a0>
    9524:	b940b3e0 	ldr	w0, [sp, #176]
    9528:	11002001 	add	w1, w0, #0x8
    952c:	7100003f 	cmp	w1, #0x0
    9530:	540011ed 	b.le	976c <_vfiprintf_r+0x168c>
    9534:	f94037e0 	ldr	x0, [sp, #104]
    9538:	b900b3e1 	str	w1, [sp, #176]
    953c:	91002c02 	add	x2, x0, #0xb
    9540:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9544:	f90037e1 	str	x1, [sp, #104]
    9548:	17fffc2b 	b	85f4 <_vfiprintf_r+0x514>
    954c:	910403e4 	add	x4, sp, #0x100
    9550:	910423e2 	add	x2, sp, #0x108
    9554:	aa1303e0 	mov	x0, x19
    9558:	d2800003 	mov	x3, #0x0                   	// #0
    955c:	d2800001 	mov	x1, #0x0                   	// #0
    9560:	94000248 	bl	9e80 <_wcsrtombs_r>
    9564:	2a0003f7 	mov	w23, w0
    9568:	3100041f 	cmn	w0, #0x1
    956c:	540017a0 	b.eq	9860 <_vfiprintf_r+0x1780>  // b.none
    9570:	f90087fa 	str	x26, [sp, #264]
    9574:	17ffff5c 	b	92e4 <_vfiprintf_r+0x1204>
    9578:	52800016 	mov	w22, #0x0                   	// #0
    957c:	52800004 	mov	w4, #0x0                   	// #0
    9580:	a906fff8 	stp	x24, xzr, [sp, #104]
    9584:	17fffc6e 	b	873c <_vfiprintf_r+0x65c>
    9588:	f94043e2 	ldr	x2, [sp, #128]
    958c:	b940b3e1 	ldr	w1, [sp, #176]
    9590:	b900b3e0 	str	w0, [sp, #176]
    9594:	8b21c042 	add	x2, x2, w1, sxtw
    9598:	17fffcde 	b	8910 <_vfiprintf_r+0x830>
    959c:	f94043e2 	ldr	x2, [sp, #128]
    95a0:	b940b3e0 	ldr	w0, [sp, #176]
    95a4:	b900b3e1 	str	w1, [sp, #176]
    95a8:	8b20c042 	add	x2, x2, w0, sxtw
    95ac:	f94037e0 	ldr	x0, [sp, #104]
    95b0:	f90037e2 	str	x2, [sp, #104]
    95b4:	17fffc3d 	b	86a8 <_vfiprintf_r+0x5c8>
    95b8:	b940b3e0 	ldr	w0, [sp, #176]
    95bc:	11002001 	add	w1, w0, #0x8
    95c0:	7100003f 	cmp	w1, #0x0
    95c4:	54000eed 	b.le	97a0 <_vfiprintf_r+0x16c0>
    95c8:	f94037e0 	ldr	x0, [sp, #104]
    95cc:	b900b3e1 	str	w1, [sp, #176]
    95d0:	91002c02 	add	x2, x0, #0xb
    95d4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    95d8:	f90037e1 	str	x1, [sp, #104]
    95dc:	17fffeb5 	b	90b0 <_vfiprintf_r+0xfd0>
    95e0:	f94043e3 	ldr	x3, [sp, #128]
    95e4:	b940b3e2 	ldr	w2, [sp, #176]
    95e8:	b900b3e1 	str	w1, [sp, #176]
    95ec:	f94037f8 	ldr	x24, [sp, #104]
    95f0:	8b22c062 	add	x2, x3, w2, sxtw
    95f4:	f90037e2 	str	x2, [sp, #104]
    95f8:	17fffbda 	b	8560 <_vfiprintf_r+0x480>
    95fc:	910643fb 	add	x27, sp, #0x190
    9600:	52800028 	mov	w8, #0x1                   	// #1
    9604:	52800001 	mov	w1, #0x0                   	// #0
    9608:	17fffb7c 	b	83f8 <_vfiprintf_r+0x318>
    960c:	37f81e60 	tbnz	w0, #31, 99d8 <_vfiprintf_r+0x18f8>
    9610:	f94037e0 	ldr	x0, [sp, #104]
    9614:	91003c01 	add	x1, x0, #0xf
    9618:	927df021 	and	x1, x1, #0xfffffffffffffff8
    961c:	f90037e1 	str	x1, [sp, #104]
    9620:	f9400000 	ldr	x0, [x0]
    9624:	7940cbe1 	ldrh	w1, [sp, #100]
    9628:	79000001 	strh	w1, [x0]
    962c:	17fffae4 	b	81bc <_vfiprintf_r+0xdc>
    9630:	37f81281 	tbnz	w1, #31, 9880 <_vfiprintf_r+0x17a0>
    9634:	f94037e1 	ldr	x1, [sp, #104]
    9638:	91002c22 	add	x2, x1, #0xb
    963c:	927df042 	and	x2, x2, #0xfffffffffffffff8
    9640:	b9400021 	ldr	w1, [x1]
    9644:	f90037e2 	str	x2, [sp, #104]
    9648:	17fffed1 	b	918c <_vfiprintf_r+0x10ac>
    964c:	37f81460 	tbnz	w0, #31, 98d8 <_vfiprintf_r+0x17f8>
    9650:	f94037e0 	ldr	x0, [sp, #104]
    9654:	91002c01 	add	x1, x0, #0xb
    9658:	927df021 	and	x1, x1, #0xfffffffffffffff8
    965c:	f90037e1 	str	x1, [sp, #104]
    9660:	b9400001 	ldr	w1, [x0]
    9664:	17fffc48 	b	8784 <_vfiprintf_r+0x6a4>
    9668:	37f81cc0 	tbnz	w0, #31, 9a00 <_vfiprintf_r+0x1920>
    966c:	f94037e0 	ldr	x0, [sp, #104]
    9670:	91002c01 	add	x1, x0, #0xb
    9674:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9678:	f90037e1 	str	x1, [sp, #104]
    967c:	b9800001 	ldrsw	x1, [x0]
    9680:	aa0103e0 	mov	x0, x1
    9684:	17fffc4f 	b	87c0 <_vfiprintf_r+0x6e0>
    9688:	37f81680 	tbnz	w0, #31, 9958 <_vfiprintf_r+0x1878>
    968c:	f94037e0 	ldr	x0, [sp, #104]
    9690:	91002c01 	add	x1, x0, #0xb
    9694:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9698:	f90037e1 	str	x1, [sp, #104]
    969c:	b9400001 	ldr	w1, [x0]
    96a0:	52800020 	mov	w0, #0x1                   	// #1
    96a4:	17fffc14 	b	86f4 <_vfiprintf_r+0x614>
    96a8:	9103bfe0 	add	x0, sp, #0xef
    96ac:	910643fb 	add	x27, sp, #0x190
    96b0:	52800028 	mov	w8, #0x1                   	// #1
    96b4:	f900cbe0 	str	x0, [sp, #400]
    96b8:	d2800020 	mov	x0, #0x1                   	// #1
    96bc:	f900cfe0 	str	x0, [sp, #408]
    96c0:	17fffb33 	b	838c <_vfiprintf_r+0x2ac>
    96c4:	b940b3e1 	ldr	w1, [sp, #176]
    96c8:	11002022 	add	w2, w1, #0x8
    96cc:	7100005f 	cmp	w2, #0x0
    96d0:	54001b6d 	b.le	9a3c <_vfiprintf_r+0x195c>
    96d4:	f94037e1 	ldr	x1, [sp, #104]
    96d8:	b900b3e2 	str	w2, [sp, #176]
    96dc:	91002c23 	add	x3, x1, #0xb
    96e0:	927df062 	and	x2, x3, #0xfffffffffffffff8
    96e4:	79400021 	ldrh	w1, [x1]
    96e8:	f90037e2 	str	x2, [sp, #104]
    96ec:	17fffea8 	b	918c <_vfiprintf_r+0x10ac>
    96f0:	b940b3e0 	ldr	w0, [sp, #176]
    96f4:	11002001 	add	w1, w0, #0x8
    96f8:	7100003f 	cmp	w1, #0x0
    96fc:	54001b6d 	b.le	9a68 <_vfiprintf_r+0x1988>
    9700:	f94037e0 	ldr	x0, [sp, #104]
    9704:	b900b3e1 	str	w1, [sp, #176]
    9708:	91002c02 	add	x2, x0, #0xb
    970c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9710:	f90037e1 	str	x1, [sp, #104]
    9714:	79400001 	ldrh	w1, [x0]
    9718:	17fffc1b 	b	8784 <_vfiprintf_r+0x6a4>
    971c:	b940b3e0 	ldr	w0, [sp, #176]
    9720:	11002001 	add	w1, w0, #0x8
    9724:	7100003f 	cmp	w1, #0x0
    9728:	5400196d 	b.le	9a54 <_vfiprintf_r+0x1974>
    972c:	f94037e0 	ldr	x0, [sp, #104]
    9730:	b900b3e1 	str	w1, [sp, #176]
    9734:	91002c02 	add	x2, x0, #0xb
    9738:	927df041 	and	x1, x2, #0xfffffffffffffff8
    973c:	f90037e1 	str	x1, [sp, #104]
    9740:	17fffe2e 	b	8ff8 <_vfiprintf_r+0xf18>
    9744:	b940b3e0 	ldr	w0, [sp, #176]
    9748:	11002001 	add	w1, w0, #0x8
    974c:	7100003f 	cmp	w1, #0x0
    9750:	540016cd 	b.le	9a28 <_vfiprintf_r+0x1948>
    9754:	f94037e0 	ldr	x0, [sp, #104]
    9758:	b900b3e1 	str	w1, [sp, #176]
    975c:	91002c02 	add	x2, x0, #0xb
    9760:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9764:	f90037e1 	str	x1, [sp, #104]
    9768:	17fffe13 	b	8fb4 <_vfiprintf_r+0xed4>
    976c:	f94043e2 	ldr	x2, [sp, #128]
    9770:	b940b3e0 	ldr	w0, [sp, #176]
    9774:	b900b3e1 	str	w1, [sp, #176]
    9778:	8b20c040 	add	x0, x2, w0, sxtw
    977c:	17fffb9e 	b	85f4 <_vfiprintf_r+0x514>
    9780:	110006e1 	add	w1, w23, #0x1
    9784:	aa1303e0 	mov	x0, x19
    9788:	93407c21 	sxtw	x1, w1
    978c:	94000ad5 	bl	c2e0 <_malloc_r>
    9790:	aa0003fa 	mov	x26, x0
    9794:	b4000660 	cbz	x0, 9860 <_vfiprintf_r+0x1780>
    9798:	f9003be0 	str	x0, [sp, #112]
    979c:	17fffed7 	b	92f8 <_vfiprintf_r+0x1218>
    97a0:	f94043e2 	ldr	x2, [sp, #128]
    97a4:	b940b3e0 	ldr	w0, [sp, #176]
    97a8:	b900b3e1 	str	w1, [sp, #176]
    97ac:	8b20c040 	add	x0, x2, w0, sxtw
    97b0:	17fffe40 	b	90b0 <_vfiprintf_r+0xfd0>
    97b4:	2a0403f6 	mov	w22, w4
    97b8:	2a0403f7 	mov	w23, w4
    97bc:	52800004 	mov	w4, #0x0                   	// #0
    97c0:	f90037f8 	str	x24, [sp, #104]
    97c4:	17fffbde 	b	873c <_vfiprintf_r+0x65c>
    97c8:	a94a03e1 	ldp	x1, x0, [sp, #160]
    97cc:	b90073e4 	str	w4, [sp, #112]
    97d0:	a90917e3 	stp	x3, x5, [sp, #144]
    97d4:	cb00035a 	sub	x26, x26, x0
    97d8:	aa0003e2 	mov	x2, x0
    97dc:	aa1a03e0 	mov	x0, x26
    97e0:	940012f4 	bl	e3b0 <strncpy>
    97e4:	39400680 	ldrb	w0, [x20, #1]
    97e8:	52800008 	mov	w8, #0x0                   	// #0
    97ec:	b94073e4 	ldr	w4, [sp, #112]
    97f0:	7100001f 	cmp	w0, #0x0
    97f4:	9a940694 	cinc	x20, x20, ne  // ne = any
    97f8:	a94917e3 	ldp	x3, x5, [sp, #144]
    97fc:	17fffee2 	b	9384 <_vfiprintf_r+0x12a4>
    9800:	f94043e2 	ldr	x2, [sp, #128]
    9804:	b940b3e0 	ldr	w0, [sp, #176]
    9808:	b900b3e1 	str	w1, [sp, #176]
    980c:	8b20c040 	add	x0, x2, w0, sxtw
    9810:	17fffc28 	b	88b0 <_vfiprintf_r+0x7d0>
    9814:	f0000028 	adrp	x8, 10000 <__func__.0+0x10>
    9818:	2a0203eb 	mov	w11, w2
    981c:	9105c108 	add	x8, x8, #0x170
    9820:	17fffd4e 	b	8d58 <_vfiprintf_r+0xc78>
    9824:	aa1a03e0 	mov	x0, x26
    9828:	97fff926 	bl	7cc0 <strlen>
    982c:	7100001f 	cmp	w0, #0x0
    9830:	2a0003f7 	mov	w23, w0
    9834:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    9838:	52800004 	mov	w4, #0x0                   	// #0
    983c:	a906fff8 	stp	x24, xzr, [sp, #104]
    9840:	17fffbbf 	b	873c <_vfiprintf_r+0x65c>
    9844:	f0000028 	adrp	x8, 10000 <__func__.0+0x10>
    9848:	11000444 	add	w4, w2, #0x1
    984c:	9105c108 	add	x8, x8, #0x170
    9850:	17fffd7b 	b	8e3c <_vfiprintf_r+0xd5c>
    9854:	12800000 	mov	w0, #0xffffffff            	// #-1
    9858:	b90067e0 	str	w0, [sp, #100]
    985c:	17fffb31 	b	8520 <_vfiprintf_r+0x440>
    9860:	79c02320 	ldrsh	w0, [x25, #16]
    9864:	321a0000 	orr	w0, w0, #0x40
    9868:	79002320 	strh	w0, [x25, #16]
    986c:	17fffb2a 	b	8514 <_vfiprintf_r+0x434>
    9870:	f0000029 	adrp	x9, 10000 <__func__.0+0x10>
    9874:	2a0803ea 	mov	w10, w8
    9878:	91060129 	add	x9, x9, #0x180
    987c:	17fffc90 	b	8abc <_vfiprintf_r+0x9dc>
    9880:	b940b3e1 	ldr	w1, [sp, #176]
    9884:	11002022 	add	w2, w1, #0x8
    9888:	7100005f 	cmp	w2, #0x0
    988c:	540019cd 	b.le	9bc4 <_vfiprintf_r+0x1ae4>
    9890:	f94037e1 	ldr	x1, [sp, #104]
    9894:	b900b3e2 	str	w2, [sp, #176]
    9898:	91002c23 	add	x3, x1, #0xb
    989c:	927df062 	and	x2, x3, #0xfffffffffffffff8
    98a0:	b9400021 	ldr	w1, [x1]
    98a4:	f90037e2 	str	x2, [sp, #104]
    98a8:	17fffe39 	b	918c <_vfiprintf_r+0x10ac>
    98ac:	b940b3e0 	ldr	w0, [sp, #176]
    98b0:	11002001 	add	w1, w0, #0x8
    98b4:	7100003f 	cmp	w1, #0x0
    98b8:	540010cd 	b.le	9ad0 <_vfiprintf_r+0x19f0>
    98bc:	f94037e0 	ldr	x0, [sp, #104]
    98c0:	b900b3e1 	str	w1, [sp, #176]
    98c4:	91002c02 	add	x2, x0, #0xb
    98c8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    98cc:	f90037e1 	str	x1, [sp, #104]
    98d0:	39400001 	ldrb	w1, [x0]
    98d4:	17fffbac 	b	8784 <_vfiprintf_r+0x6a4>
    98d8:	b940b3e0 	ldr	w0, [sp, #176]
    98dc:	11002001 	add	w1, w0, #0x8
    98e0:	7100003f 	cmp	w1, #0x0
    98e4:	540015ad 	b.le	9b98 <_vfiprintf_r+0x1ab8>
    98e8:	f94037e0 	ldr	x0, [sp, #104]
    98ec:	b900b3e1 	str	w1, [sp, #176]
    98f0:	91002c02 	add	x2, x0, #0xb
    98f4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    98f8:	f90037e1 	str	x1, [sp, #104]
    98fc:	b9400001 	ldr	w1, [x0]
    9900:	17fffba1 	b	8784 <_vfiprintf_r+0x6a4>
    9904:	b940b3e0 	ldr	w0, [sp, #176]
    9908:	11002001 	add	w1, w0, #0x8
    990c:	7100003f 	cmp	w1, #0x0
    9910:	54000f6d 	b.le	9afc <_vfiprintf_r+0x1a1c>
    9914:	f94037e0 	ldr	x0, [sp, #104]
    9918:	b900b3e1 	str	w1, [sp, #176]
    991c:	91002c02 	add	x2, x0, #0xb
    9920:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9924:	f90037e1 	str	x1, [sp, #104]
    9928:	17fffef7 	b	9504 <_vfiprintf_r+0x1424>
    992c:	b940b3e1 	ldr	w1, [sp, #176]
    9930:	11002022 	add	w2, w1, #0x8
    9934:	7100005f 	cmp	w2, #0x0
    9938:	5400152d 	b.le	9bdc <_vfiprintf_r+0x1afc>
    993c:	f94037e1 	ldr	x1, [sp, #104]
    9940:	b900b3e2 	str	w2, [sp, #176]
    9944:	91002c23 	add	x3, x1, #0xb
    9948:	927df062 	and	x2, x3, #0xfffffffffffffff8
    994c:	39400021 	ldrb	w1, [x1]
    9950:	f90037e2 	str	x2, [sp, #104]
    9954:	17fffe0e 	b	918c <_vfiprintf_r+0x10ac>
    9958:	b940b3e0 	ldr	w0, [sp, #176]
    995c:	11002001 	add	w1, w0, #0x8
    9960:	7100003f 	cmp	w1, #0x0
    9964:	5400106d 	b.le	9b70 <_vfiprintf_r+0x1a90>
    9968:	f94037e0 	ldr	x0, [sp, #104]
    996c:	b900b3e1 	str	w1, [sp, #176]
    9970:	91002c02 	add	x2, x0, #0xb
    9974:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9978:	f90037e1 	str	x1, [sp, #104]
    997c:	17ffff48 	b	969c <_vfiprintf_r+0x15bc>
    9980:	b940b3e0 	ldr	w0, [sp, #176]
    9984:	11002001 	add	w1, w0, #0x8
    9988:	7100003f 	cmp	w1, #0x0
    998c:	54000e8d 	b.le	9b5c <_vfiprintf_r+0x1a7c>
    9990:	f94037e0 	ldr	x0, [sp, #104]
    9994:	b900b3e1 	str	w1, [sp, #176]
    9998:	91002c02 	add	x2, x0, #0xb
    999c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    99a0:	f90037e1 	str	x1, [sp, #104]
    99a4:	17fffeb8 	b	9484 <_vfiprintf_r+0x13a4>
    99a8:	37f80800 	tbnz	w0, #31, 9aa8 <_vfiprintf_r+0x19c8>
    99ac:	f94037e0 	ldr	x0, [sp, #104]
    99b0:	91003c01 	add	x1, x0, #0xf
    99b4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    99b8:	f90037e1 	str	x1, [sp, #104]
    99bc:	f9400000 	ldr	x0, [x0]
    99c0:	b94067e1 	ldr	w1, [sp, #100]
    99c4:	b9000001 	str	w1, [x0]
    99c8:	17fff9fd 	b	81bc <_vfiprintf_r+0xdc>
    99cc:	2a1403f7 	mov	w23, w20
    99d0:	f94037f4 	ldr	x20, [sp, #104]
    99d4:	17fffe44 	b	92e4 <_vfiprintf_r+0x1204>
    99d8:	b940b3e0 	ldr	w0, [sp, #176]
    99dc:	11002001 	add	w1, w0, #0x8
    99e0:	7100003f 	cmp	w1, #0x0
    99e4:	54000d0d 	b.le	9b84 <_vfiprintf_r+0x1aa4>
    99e8:	f94037e0 	ldr	x0, [sp, #104]
    99ec:	b900b3e1 	str	w1, [sp, #176]
    99f0:	91003c02 	add	x2, x0, #0xf
    99f4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    99f8:	f90037e1 	str	x1, [sp, #104]
    99fc:	17ffff09 	b	9620 <_vfiprintf_r+0x1540>
    9a00:	b940b3e0 	ldr	w0, [sp, #176]
    9a04:	11002001 	add	w1, w0, #0x8
    9a08:	7100003f 	cmp	w1, #0x0
    9a0c:	540006ed 	b.le	9ae8 <_vfiprintf_r+0x1a08>
    9a10:	f94037e0 	ldr	x0, [sp, #104]
    9a14:	b900b3e1 	str	w1, [sp, #176]
    9a18:	91002c02 	add	x2, x0, #0xb
    9a1c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9a20:	f90037e1 	str	x1, [sp, #104]
    9a24:	17ffff16 	b	967c <_vfiprintf_r+0x159c>
    9a28:	f94043e2 	ldr	x2, [sp, #128]
    9a2c:	b940b3e0 	ldr	w0, [sp, #176]
    9a30:	b900b3e1 	str	w1, [sp, #176]
    9a34:	8b20c040 	add	x0, x2, w0, sxtw
    9a38:	17fffd5f 	b	8fb4 <_vfiprintf_r+0xed4>
    9a3c:	f94043e3 	ldr	x3, [sp, #128]
    9a40:	b940b3e1 	ldr	w1, [sp, #176]
    9a44:	b900b3e2 	str	w2, [sp, #176]
    9a48:	8b21c061 	add	x1, x3, w1, sxtw
    9a4c:	79400021 	ldrh	w1, [x1]
    9a50:	17fffdcf 	b	918c <_vfiprintf_r+0x10ac>
    9a54:	f94043e2 	ldr	x2, [sp, #128]
    9a58:	b940b3e0 	ldr	w0, [sp, #176]
    9a5c:	b900b3e1 	str	w1, [sp, #176]
    9a60:	8b20c040 	add	x0, x2, w0, sxtw
    9a64:	17fffd65 	b	8ff8 <_vfiprintf_r+0xf18>
    9a68:	f94043e2 	ldr	x2, [sp, #128]
    9a6c:	b940b3e0 	ldr	w0, [sp, #176]
    9a70:	b900b3e1 	str	w1, [sp, #176]
    9a74:	8b20c040 	add	x0, x2, w0, sxtw
    9a78:	79400001 	ldrh	w1, [x0]
    9a7c:	17fffb42 	b	8784 <_vfiprintf_r+0x6a4>
    9a80:	b940b3e0 	ldr	w0, [sp, #176]
    9a84:	11002001 	add	w1, w0, #0x8
    9a88:	7100003f 	cmp	w1, #0x0
    9a8c:	5400092d 	b.le	9bb0 <_vfiprintf_r+0x1ad0>
    9a90:	f94037e0 	ldr	x0, [sp, #104]
    9a94:	b900b3e1 	str	w1, [sp, #176]
    9a98:	91003c02 	add	x2, x0, #0xf
    9a9c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9aa0:	f90037e1 	str	x1, [sp, #104]
    9aa4:	17fffb7a 	b	888c <_vfiprintf_r+0x7ac>
    9aa8:	b940b3e0 	ldr	w0, [sp, #176]
    9aac:	11002001 	add	w1, w0, #0x8
    9ab0:	7100003f 	cmp	w1, #0x0
    9ab4:	540002ed 	b.le	9b10 <_vfiprintf_r+0x1a30>
    9ab8:	f94037e0 	ldr	x0, [sp, #104]
    9abc:	b900b3e1 	str	w1, [sp, #176]
    9ac0:	91003c02 	add	x2, x0, #0xf
    9ac4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    9ac8:	f90037e1 	str	x1, [sp, #104]
    9acc:	17ffffbc 	b	99bc <_vfiprintf_r+0x18dc>
    9ad0:	f94043e2 	ldr	x2, [sp, #128]
    9ad4:	b940b3e0 	ldr	w0, [sp, #176]
    9ad8:	b900b3e1 	str	w1, [sp, #176]
    9adc:	8b20c040 	add	x0, x2, w0, sxtw
    9ae0:	39400001 	ldrb	w1, [x0]
    9ae4:	17fffb28 	b	8784 <_vfiprintf_r+0x6a4>
    9ae8:	f94043e2 	ldr	x2, [sp, #128]
    9aec:	b940b3e0 	ldr	w0, [sp, #176]
    9af0:	b900b3e1 	str	w1, [sp, #176]
    9af4:	8b20c040 	add	x0, x2, w0, sxtw
    9af8:	17fffee1 	b	967c <_vfiprintf_r+0x159c>
    9afc:	f94043e2 	ldr	x2, [sp, #128]
    9b00:	b940b3e0 	ldr	w0, [sp, #176]
    9b04:	b900b3e1 	str	w1, [sp, #176]
    9b08:	8b20c040 	add	x0, x2, w0, sxtw
    9b0c:	17fffe7e 	b	9504 <_vfiprintf_r+0x1424>
    9b10:	f94043e2 	ldr	x2, [sp, #128]
    9b14:	b940b3e0 	ldr	w0, [sp, #176]
    9b18:	b900b3e1 	str	w1, [sp, #176]
    9b1c:	8b20c040 	add	x0, x2, w0, sxtw
    9b20:	17ffffa7 	b	99bc <_vfiprintf_r+0x18dc>
    9b24:	b940b3e0 	ldr	w0, [sp, #176]
    9b28:	37f80660 	tbnz	w0, #31, 9bf4 <_vfiprintf_r+0x1b14>
    9b2c:	f94037e1 	ldr	x1, [sp, #104]
    9b30:	91002c21 	add	x1, x1, #0xb
    9b34:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9b38:	f94037e3 	ldr	x3, [sp, #104]
    9b3c:	f90037e1 	str	x1, [sp, #104]
    9b40:	b900b3e0 	str	w0, [sp, #176]
    9b44:	39400680 	ldrb	w0, [x20, #1]
    9b48:	aa0203f4 	mov	x20, x2
    9b4c:	b9400064 	ldr	w4, [x3]
    9b50:	7100009f 	cmp	w4, #0x0
    9b54:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    9b58:	17fff9e8 	b	82f8 <_vfiprintf_r+0x218>
    9b5c:	f94043e2 	ldr	x2, [sp, #128]
    9b60:	b940b3e0 	ldr	w0, [sp, #176]
    9b64:	b900b3e1 	str	w1, [sp, #176]
    9b68:	8b20c040 	add	x0, x2, w0, sxtw
    9b6c:	17fffe46 	b	9484 <_vfiprintf_r+0x13a4>
    9b70:	f94043e2 	ldr	x2, [sp, #128]
    9b74:	b940b3e0 	ldr	w0, [sp, #176]
    9b78:	b900b3e1 	str	w1, [sp, #176]
    9b7c:	8b20c040 	add	x0, x2, w0, sxtw
    9b80:	17fffec7 	b	969c <_vfiprintf_r+0x15bc>
    9b84:	f94043e2 	ldr	x2, [sp, #128]
    9b88:	b940b3e0 	ldr	w0, [sp, #176]
    9b8c:	b900b3e1 	str	w1, [sp, #176]
    9b90:	8b20c040 	add	x0, x2, w0, sxtw
    9b94:	17fffea3 	b	9620 <_vfiprintf_r+0x1540>
    9b98:	f94043e2 	ldr	x2, [sp, #128]
    9b9c:	b940b3e0 	ldr	w0, [sp, #176]
    9ba0:	b900b3e1 	str	w1, [sp, #176]
    9ba4:	8b20c040 	add	x0, x2, w0, sxtw
    9ba8:	b9400001 	ldr	w1, [x0]
    9bac:	17fffaf6 	b	8784 <_vfiprintf_r+0x6a4>
    9bb0:	f94043e2 	ldr	x2, [sp, #128]
    9bb4:	b940b3e0 	ldr	w0, [sp, #176]
    9bb8:	b900b3e1 	str	w1, [sp, #176]
    9bbc:	8b20c040 	add	x0, x2, w0, sxtw
    9bc0:	17fffb33 	b	888c <_vfiprintf_r+0x7ac>
    9bc4:	f94043e3 	ldr	x3, [sp, #128]
    9bc8:	b940b3e1 	ldr	w1, [sp, #176]
    9bcc:	b900b3e2 	str	w2, [sp, #176]
    9bd0:	8b21c061 	add	x1, x3, w1, sxtw
    9bd4:	b9400021 	ldr	w1, [x1]
    9bd8:	17fffd6d 	b	918c <_vfiprintf_r+0x10ac>
    9bdc:	f94043e3 	ldr	x3, [sp, #128]
    9be0:	b940b3e1 	ldr	w1, [sp, #176]
    9be4:	b900b3e2 	str	w2, [sp, #176]
    9be8:	8b21c061 	add	x1, x3, w1, sxtw
    9bec:	39400021 	ldrb	w1, [x1]
    9bf0:	17fffd67 	b	918c <_vfiprintf_r+0x10ac>
    9bf4:	b940b3e0 	ldr	w0, [sp, #176]
    9bf8:	f94037e1 	ldr	x1, [sp, #104]
    9bfc:	11002000 	add	w0, w0, #0x8
    9c00:	7100001f 	cmp	w0, #0x0
    9c04:	5400010d 	b.le	9c24 <_vfiprintf_r+0x1b44>
    9c08:	91002c21 	add	x1, x1, #0xb
    9c0c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9c10:	17ffffca 	b	9b38 <_vfiprintf_r+0x1a58>
    9c14:	79402320 	ldrh	w0, [x25, #16]
    9c18:	321a0000 	orr	w0, w0, #0x40
    9c1c:	79002320 	strh	w0, [x25, #16]
    9c20:	17fffa37 	b	84fc <_vfiprintf_r+0x41c>
    9c24:	f94043e4 	ldr	x4, [sp, #128]
    9c28:	b940b3e3 	ldr	w3, [sp, #176]
    9c2c:	8b23c083 	add	x3, x4, w3, sxtw
    9c30:	f90037e3 	str	x3, [sp, #104]
    9c34:	17ffffc1 	b	9b38 <_vfiprintf_r+0x1a58>
    9c38:	d503201f 	nop
    9c3c:	d503201f 	nop

0000000000009c40 <vfiprintf>:
    9c40:	aa0203e4 	mov	x4, x2
    9c44:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9c48:	f0000023 	adrp	x3, 10000 <__func__.0+0x10>
    9c4c:	910003fd 	mov	x29, sp
    9c50:	a9401c46 	ldp	x6, x7, [x2]
    9c54:	aa0003e8 	mov	x8, x0
    9c58:	a9411484 	ldp	x4, x5, [x4, #16]
    9c5c:	aa0103e2 	mov	x2, x1
    9c60:	f9438860 	ldr	x0, [x3, #1808]
    9c64:	aa0803e1 	mov	x1, x8
    9c68:	910043e3 	add	x3, sp, #0x10
    9c6c:	a9011fe6 	stp	x6, x7, [sp, #16]
    9c70:	a90217e4 	stp	x4, x5, [sp, #32]
    9c74:	97fff91b 	bl	80e0 <_vfiprintf_r>
    9c78:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9c7c:	d65f03c0 	ret

0000000000009c80 <__sbprintf>:
    9c80:	d11403ff 	sub	sp, sp, #0x500
    9c84:	52808005 	mov	w5, #0x400                 	// #1024
    9c88:	910403e6 	add	x6, sp, #0x100
    9c8c:	a9007bfd 	stp	x29, x30, [sp]
    9c90:	910003fd 	mov	x29, sp
    9c94:	a90153f3 	stp	x19, x20, [sp, #16]
    9c98:	aa0103f3 	mov	x19, x1
    9c9c:	aa0303e1 	mov	x1, x3
    9ca0:	9100c3e3 	add	x3, sp, #0x30
    9ca4:	f9002be6 	str	x6, [sp, #80]
    9ca8:	79402264 	ldrh	w4, [x19, #16]
    9cac:	a9403c2e 	ldp	x14, x15, [x1]
    9cb0:	121e7884 	and	w4, w4, #0xfffffffd
    9cb4:	7940266c 	ldrh	w12, [x19, #18]
    9cb8:	a9412428 	ldp	x8, x9, [x1, #16]
    9cbc:	910143e1 	add	x1, sp, #0x50
    9cc0:	f9401a6b 	ldr	x11, [x19, #48]
    9cc4:	b9005fe5 	str	w5, [sp, #92]
    9cc8:	f940226a 	ldr	x10, [x19, #64]
    9ccc:	a9033fee 	stp	x14, x15, [sp, #48]
    9cd0:	b940ae67 	ldr	w7, [x19, #172]
    9cd4:	f90013f5 	str	x21, [sp, #32]
    9cd8:	aa0003f5 	mov	x21, x0
    9cdc:	a90427e8 	stp	x8, x9, [sp, #64]
    9ce0:	7900c3e4 	strh	w4, [sp, #96]
    9ce4:	7900c7ec 	strh	w12, [sp, #98]
    9ce8:	f90037e6 	str	x6, [sp, #104]
    9cec:	b90073e5 	str	w5, [sp, #112]
    9cf0:	b9007bff 	str	wzr, [sp, #120]
    9cf4:	f90043eb 	str	x11, [sp, #128]
    9cf8:	f9004bea 	str	x10, [sp, #144]
    9cfc:	b900ffe7 	str	w7, [sp, #252]
    9d00:	97fff8f8 	bl	80e0 <_vfiprintf_r>
    9d04:	2a0003f4 	mov	w20, w0
    9d08:	37f800c0 	tbnz	w0, #31, 9d20 <__sbprintf+0xa0>
    9d0c:	910143e1 	add	x1, sp, #0x50
    9d10:	aa1503e0 	mov	x0, x21
    9d14:	9400017b 	bl	a300 <_fflush_r>
    9d18:	7100001f 	cmp	w0, #0x0
    9d1c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    9d20:	7940c3e0 	ldrh	w0, [sp, #96]
    9d24:	36300080 	tbz	w0, #6, 9d34 <__sbprintf+0xb4>
    9d28:	79402260 	ldrh	w0, [x19, #16]
    9d2c:	321a0000 	orr	w0, w0, #0x40
    9d30:	79002260 	strh	w0, [x19, #16]
    9d34:	2a1403e0 	mov	w0, w20
    9d38:	a9407bfd 	ldp	x29, x30, [sp]
    9d3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9d40:	f94013f5 	ldr	x21, [sp, #32]
    9d44:	911403ff 	add	sp, sp, #0x500
    9d48:	d65f03c0 	ret
    9d4c:	d503201f 	nop

0000000000009d50 <_wcrtomb_r>:
    9d50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9d54:	91055004 	add	x4, x0, #0x154
    9d58:	910003fd 	mov	x29, sp
    9d5c:	a90153f3 	stp	x19, x20, [sp, #16]
    9d60:	aa0303f3 	mov	x19, x3
    9d64:	f100027f 	cmp	x19, #0x0
    9d68:	f0000023 	adrp	x3, 10000 <__func__.0+0x10>
    9d6c:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    9d70:	aa0003f4 	mov	x20, x0
    9d74:	f947b064 	ldr	x4, [x3, #3936]
    9d78:	aa1303e3 	mov	x3, x19
    9d7c:	b4000121 	cbz	x1, 9da0 <_wcrtomb_r+0x50>
    9d80:	d63f0080 	blr	x4
    9d84:	2a0003e1 	mov	w1, w0
    9d88:	93407c20 	sxtw	x0, w1
    9d8c:	3100043f 	cmn	w1, #0x1
    9d90:	54000160 	b.eq	9dbc <_wcrtomb_r+0x6c>  // b.none
    9d94:	a94153f3 	ldp	x19, x20, [sp, #16]
    9d98:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9d9c:	d65f03c0 	ret
    9da0:	910083e1 	add	x1, sp, #0x20
    9da4:	52800002 	mov	w2, #0x0                   	// #0
    9da8:	d63f0080 	blr	x4
    9dac:	2a0003e1 	mov	w1, w0
    9db0:	93407c20 	sxtw	x0, w1
    9db4:	3100043f 	cmn	w1, #0x1
    9db8:	54fffee1 	b.ne	9d94 <_wcrtomb_r+0x44>  // b.any
    9dbc:	b900027f 	str	wzr, [x19]
    9dc0:	52801141 	mov	w1, #0x8a                  	// #138
    9dc4:	b9000281 	str	w1, [x20]
    9dc8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9dcc:	a94153f3 	ldp	x19, x20, [sp, #16]
    9dd0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9dd4:	d65f03c0 	ret
    9dd8:	d503201f 	nop
    9ddc:	d503201f 	nop

0000000000009de0 <wcrtomb>:
    9de0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9de4:	f0000024 	adrp	x4, 10000 <__func__.0+0x10>
    9de8:	f0000023 	adrp	x3, 10000 <__func__.0+0x10>
    9dec:	910003fd 	mov	x29, sp
    9df0:	a90153f3 	stp	x19, x20, [sp, #16]
    9df4:	f100005f 	cmp	x2, #0x0
    9df8:	f9438894 	ldr	x20, [x4, #1808]
    9dfc:	91055284 	add	x4, x20, #0x154
    9e00:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    9e04:	f947b064 	ldr	x4, [x3, #3936]
    9e08:	b40001a0 	cbz	x0, 9e3c <wcrtomb+0x5c>
    9e0c:	2a0103e2 	mov	w2, w1
    9e10:	aa0003e1 	mov	x1, x0
    9e14:	aa1303e3 	mov	x3, x19
    9e18:	aa1403e0 	mov	x0, x20
    9e1c:	d63f0080 	blr	x4
    9e20:	2a0003e1 	mov	w1, w0
    9e24:	93407c20 	sxtw	x0, w1
    9e28:	3100043f 	cmn	w1, #0x1
    9e2c:	540001a0 	b.eq	9e60 <wcrtomb+0x80>  // b.none
    9e30:	a94153f3 	ldp	x19, x20, [sp, #16]
    9e34:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9e38:	d65f03c0 	ret
    9e3c:	910083e1 	add	x1, sp, #0x20
    9e40:	aa1303e3 	mov	x3, x19
    9e44:	aa1403e0 	mov	x0, x20
    9e48:	52800002 	mov	w2, #0x0                   	// #0
    9e4c:	d63f0080 	blr	x4
    9e50:	2a0003e1 	mov	w1, w0
    9e54:	93407c20 	sxtw	x0, w1
    9e58:	3100043f 	cmn	w1, #0x1
    9e5c:	54fffea1 	b.ne	9e30 <wcrtomb+0x50>  // b.any
    9e60:	b900027f 	str	wzr, [x19]
    9e64:	52801141 	mov	w1, #0x8a                  	// #138
    9e68:	b9000281 	str	w1, [x20]
    9e6c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9e70:	a94153f3 	ldp	x19, x20, [sp, #16]
    9e74:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9e78:	d65f03c0 	ret
    9e7c:	d503201f 	nop

0000000000009e80 <_wcsrtombs_r>:
    9e80:	aa0403e5 	mov	x5, x4
    9e84:	aa0303e4 	mov	x4, x3
    9e88:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    9e8c:	140012cd 	b	e9c0 <_wcsnrtombs_r>

0000000000009e90 <wcsrtombs>:
    9e90:	f0000026 	adrp	x6, 10000 <__func__.0+0x10>
    9e94:	aa0003e4 	mov	x4, x0
    9e98:	aa0103e5 	mov	x5, x1
    9e9c:	aa0403e1 	mov	x1, x4
    9ea0:	f94388c0 	ldr	x0, [x6, #1808]
    9ea4:	aa0203e4 	mov	x4, x2
    9ea8:	aa0503e2 	mov	x2, x5
    9eac:	aa0303e5 	mov	x5, x3
    9eb0:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    9eb4:	140012c3 	b	e9c0 <_wcsnrtombs_r>
    9eb8:	d503201f 	nop
    9ebc:	d503201f 	nop

0000000000009ec0 <__swsetup_r>:
    9ec0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9ec4:	f0000022 	adrp	x2, 10000 <__func__.0+0x10>
    9ec8:	910003fd 	mov	x29, sp
    9ecc:	a90153f3 	stp	x19, x20, [sp, #16]
    9ed0:	aa0003f4 	mov	x20, x0
    9ed4:	aa0103f3 	mov	x19, x1
    9ed8:	f9438840 	ldr	x0, [x2, #1808]
    9edc:	b4000060 	cbz	x0, 9ee8 <__swsetup_r+0x28>
    9ee0:	b9405001 	ldr	w1, [x0, #80]
    9ee4:	340004e1 	cbz	w1, 9f80 <__swsetup_r+0xc0>
    9ee8:	79c02262 	ldrsh	w2, [x19, #16]
    9eec:	12003c41 	and	w1, w2, #0xffff
    9ef0:	36180502 	tbz	w2, #3, 9f90 <__swsetup_r+0xd0>
    9ef4:	f9400e63 	ldr	x3, [x19, #24]
    9ef8:	b40002c3 	cbz	x3, 9f50 <__swsetup_r+0x90>
    9efc:	36000141 	tbz	w1, #0, 9f24 <__swsetup_r+0x64>
    9f00:	b9402260 	ldr	w0, [x19, #32]
    9f04:	b9000e7f 	str	wzr, [x19, #12]
    9f08:	4b0003e0 	neg	w0, w0
    9f0c:	b9002a60 	str	w0, [x19, #40]
    9f10:	52800000 	mov	w0, #0x0                   	// #0
    9f14:	b4000143 	cbz	x3, 9f3c <__swsetup_r+0x7c>
    9f18:	a94153f3 	ldp	x19, x20, [sp, #16]
    9f1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9f20:	d65f03c0 	ret
    9f24:	52800000 	mov	w0, #0x0                   	// #0
    9f28:	37080041 	tbnz	w1, #1, 9f30 <__swsetup_r+0x70>
    9f2c:	b9402260 	ldr	w0, [x19, #32]
    9f30:	b9000e60 	str	w0, [x19, #12]
    9f34:	52800000 	mov	w0, #0x0                   	// #0
    9f38:	b5ffff03 	cbnz	x3, 9f18 <__swsetup_r+0x58>
    9f3c:	363ffee1 	tbz	w1, #7, 9f18 <__swsetup_r+0x58>
    9f40:	321a0042 	orr	w2, w2, #0x40
    9f44:	12800000 	mov	w0, #0xffffffff            	// #-1
    9f48:	79002262 	strh	w2, [x19, #16]
    9f4c:	17fffff3 	b	9f18 <__swsetup_r+0x58>
    9f50:	52805000 	mov	w0, #0x280                 	// #640
    9f54:	0a000020 	and	w0, w1, w0
    9f58:	7108001f 	cmp	w0, #0x200
    9f5c:	54fffd00 	b.eq	9efc <__swsetup_r+0x3c>  // b.none
    9f60:	aa1303e1 	mov	x1, x19
    9f64:	aa1403e0 	mov	x0, x20
    9f68:	9400085a 	bl	c0d0 <__smakebuf_r>
    9f6c:	79c02262 	ldrsh	w2, [x19, #16]
    9f70:	f9400e63 	ldr	x3, [x19, #24]
    9f74:	12003c41 	and	w1, w2, #0xffff
    9f78:	3607fd61 	tbz	w1, #0, 9f24 <__swsetup_r+0x64>
    9f7c:	17ffffe1 	b	9f00 <__swsetup_r+0x40>
    9f80:	940001e0 	bl	a700 <__sinit>
    9f84:	79c02262 	ldrsh	w2, [x19, #16]
    9f88:	12003c41 	and	w1, w2, #0xffff
    9f8c:	371ffb42 	tbnz	w2, #3, 9ef4 <__swsetup_r+0x34>
    9f90:	362002e1 	tbz	w1, #4, 9fec <__swsetup_r+0x12c>
    9f94:	371000e1 	tbnz	w1, #2, 9fb0 <__swsetup_r+0xf0>
    9f98:	f9400e63 	ldr	x3, [x19, #24]
    9f9c:	321d0042 	orr	w2, w2, #0x8
    9fa0:	79002262 	strh	w2, [x19, #16]
    9fa4:	12003c41 	and	w1, w2, #0xffff
    9fa8:	b5fffaa3 	cbnz	x3, 9efc <__swsetup_r+0x3c>
    9fac:	17ffffe9 	b	9f50 <__swsetup_r+0x90>
    9fb0:	f9402e61 	ldr	x1, [x19, #88]
    9fb4:	b4000101 	cbz	x1, 9fd4 <__swsetup_r+0x114>
    9fb8:	9101d260 	add	x0, x19, #0x74
    9fbc:	eb00003f 	cmp	x1, x0
    9fc0:	54000080 	b.eq	9fd0 <__swsetup_r+0x110>  // b.none
    9fc4:	aa1403e0 	mov	x0, x20
    9fc8:	940002a6 	bl	aa60 <_free_r>
    9fcc:	79c02262 	ldrsh	w2, [x19, #16]
    9fd0:	f9002e7f 	str	xzr, [x19, #88]
    9fd4:	f9400e63 	ldr	x3, [x19, #24]
    9fd8:	12800480 	mov	w0, #0xffffffdb            	// #-37
    9fdc:	0a000042 	and	w2, w2, w0
    9fe0:	f9000263 	str	x3, [x19]
    9fe4:	b9000a7f 	str	wzr, [x19, #8]
    9fe8:	17ffffed 	b	9f9c <__swsetup_r+0xdc>
    9fec:	52800120 	mov	w0, #0x9                   	// #9
    9ff0:	b9000280 	str	w0, [x20]
    9ff4:	321a0042 	orr	w2, w2, #0x40
    9ff8:	12800000 	mov	w0, #0xffffffff            	// #-1
    9ffc:	79002262 	strh	w2, [x19, #16]
    a000:	17ffffc6 	b	9f18 <__swsetup_r+0x58>
    a004:	d503201f 	nop
    a008:	d503201f 	nop
    a00c:	d503201f 	nop

000000000000a010 <abort>:
    a010:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a014:	528000c0 	mov	w0, #0x6                   	// #6
    a018:	910003fd 	mov	x29, sp
    a01c:	94000ec1 	bl	db20 <raise>
    a020:	52800020 	mov	w0, #0x1                   	// #1
    a024:	97fff507 	bl	7440 <_exit>
    a028:	d503201f 	nop
    a02c:	d503201f 	nop

000000000000a030 <__register_exitproc>:
    a030:	d0000024 	adrp	x4, 10000 <__func__.0+0x10>
    a034:	f9402c84 	ldr	x4, [x4, #88]
    a038:	f940fc85 	ldr	x5, [x4, #504]
    a03c:	b4000405 	cbz	x5, a0bc <__register_exitproc+0x8c>
    a040:	b94008a4 	ldr	w4, [x5, #8]
    a044:	71007c9f 	cmp	w4, #0x1f
    a048:	5400040c 	b.gt	a0c8 <__register_exitproc+0x98>
    a04c:	93407c86 	sxtw	x6, w4
    a050:	350000e0 	cbnz	w0, a06c <__register_exitproc+0x3c>
    a054:	910008c2 	add	x2, x6, #0x2
    a058:	11000484 	add	w4, w4, #0x1
    a05c:	b90008a4 	str	w4, [x5, #8]
    a060:	52800000 	mov	w0, #0x0                   	// #0
    a064:	f82278a1 	str	x1, [x5, x2, lsl #3]
    a068:	d65f03c0 	ret
    a06c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    a070:	52800028 	mov	w8, #0x1                   	// #1
    a074:	1ac42108 	lsl	w8, w8, w4
    a078:	93407c86 	sxtw	x6, w4
    a07c:	f90088e2 	str	x2, [x7, #272]
    a080:	b94310a2 	ldr	w2, [x5, #784]
    a084:	2a080042 	orr	w2, w2, w8
    a088:	b90310a2 	str	w2, [x5, #784]
    a08c:	f90108e3 	str	x3, [x7, #528]
    a090:	7100081f 	cmp	w0, #0x2
    a094:	54fffe01 	b.ne	a054 <__register_exitproc+0x24>  // b.any
    a098:	b94314a0 	ldr	w0, [x5, #788]
    a09c:	910008c2 	add	x2, x6, #0x2
    a0a0:	11000484 	add	w4, w4, #0x1
    a0a4:	b90008a4 	str	w4, [x5, #8]
    a0a8:	2a080008 	orr	w8, w0, w8
    a0ac:	b90314a8 	str	w8, [x5, #788]
    a0b0:	52800000 	mov	w0, #0x0                   	// #0
    a0b4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    a0b8:	17ffffec 	b	a068 <__register_exitproc+0x38>
    a0bc:	91080085 	add	x5, x4, #0x200
    a0c0:	f900fc85 	str	x5, [x4, #504]
    a0c4:	17ffffdf 	b	a040 <__register_exitproc+0x10>
    a0c8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a0cc:	d65f03c0 	ret

000000000000a0d0 <__sflush_r>:
    a0d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a0d4:	910003fd 	mov	x29, sp
    a0d8:	a9025bf5 	stp	x21, x22, [sp, #32]
    a0dc:	aa0003f6 	mov	x22, x0
    a0e0:	79c02020 	ldrsh	w0, [x1, #16]
    a0e4:	a90153f3 	stp	x19, x20, [sp, #16]
    a0e8:	aa0103f3 	mov	x19, x1
    a0ec:	37180560 	tbnz	w0, #3, a198 <__sflush_r+0xc8>
    a0f0:	32150000 	orr	w0, w0, #0x800
    a0f4:	79002020 	strh	w0, [x1, #16]
    a0f8:	b9400821 	ldr	w1, [x1, #8]
    a0fc:	7100003f 	cmp	w1, #0x0
    a100:	5400092d 	b.le	a224 <__sflush_r+0x154>
    a104:	f9402664 	ldr	x4, [x19, #72]
    a108:	b4000944 	cbz	x4, a230 <__sflush_r+0x160>
    a10c:	b94002d4 	ldr	w20, [x22]
    a110:	12003c01 	and	w1, w0, #0xffff
    a114:	b90002df 	str	wzr, [x22]
    a118:	37600960 	tbnz	w0, #12, a244 <__sflush_r+0x174>
    a11c:	f9401a61 	ldr	x1, [x19, #48]
    a120:	d2800002 	mov	x2, #0x0                   	// #0
    a124:	aa1603e0 	mov	x0, x22
    a128:	52800023 	mov	w3, #0x1                   	// #1
    a12c:	d63f0080 	blr	x4
    a130:	aa0003e2 	mov	x2, x0
    a134:	b100041f 	cmn	x0, #0x1
    a138:	54000d00 	b.eq	a2d8 <__sflush_r+0x208>  // b.none
    a13c:	79402261 	ldrh	w1, [x19, #16]
    a140:	f9402664 	ldr	x4, [x19, #72]
    a144:	361000e1 	tbz	w1, #2, a160 <__sflush_r+0x90>
    a148:	f9402e60 	ldr	x0, [x19, #88]
    a14c:	b9800a61 	ldrsw	x1, [x19, #8]
    a150:	cb010042 	sub	x2, x2, x1
    a154:	b4000060 	cbz	x0, a160 <__sflush_r+0x90>
    a158:	b9807260 	ldrsw	x0, [x19, #112]
    a15c:	cb000042 	sub	x2, x2, x0
    a160:	f9401a61 	ldr	x1, [x19, #48]
    a164:	aa1603e0 	mov	x0, x22
    a168:	52800003 	mov	w3, #0x0                   	// #0
    a16c:	d63f0080 	blr	x4
    a170:	b100041f 	cmn	x0, #0x1
    a174:	540006c1 	b.ne	a24c <__sflush_r+0x17c>  // b.any
    a178:	b94002c2 	ldr	w2, [x22]
    a17c:	7100745f 	cmp	w2, #0x1d
    a180:	54000929 	b.ls	a2a4 <__sflush_r+0x1d4>  // b.plast
    a184:	79c02261 	ldrsh	w1, [x19, #16]
    a188:	321a0021 	orr	w1, w1, #0x40
    a18c:	12800000 	mov	w0, #0xffffffff            	// #-1
    a190:	79002261 	strh	w1, [x19, #16]
    a194:	14000028 	b	a234 <__sflush_r+0x164>
    a198:	f9400c35 	ldr	x21, [x1, #24]
    a19c:	b40004b5 	cbz	x21, a230 <__sflush_r+0x160>
    a1a0:	12003c01 	and	w1, w0, #0xffff
    a1a4:	52800002 	mov	w2, #0x0                   	// #0
    a1a8:	f9400260 	ldr	x0, [x19]
    a1ac:	f9000275 	str	x21, [x19]
    a1b0:	cb150000 	sub	x0, x0, x21
    a1b4:	2a0003f4 	mov	w20, w0
    a1b8:	f240043f 	tst	x1, #0x3
    a1bc:	54000041 	b.ne	a1c4 <__sflush_r+0xf4>  // b.any
    a1c0:	b9402262 	ldr	w2, [x19, #32]
    a1c4:	b9000e62 	str	w2, [x19, #12]
    a1c8:	7100001f 	cmp	w0, #0x0
    a1cc:	540000ac 	b.gt	a1e0 <__sflush_r+0x110>
    a1d0:	14000018 	b	a230 <__sflush_r+0x160>
    a1d4:	8b20c2b5 	add	x21, x21, w0, sxtw
    a1d8:	7100029f 	cmp	w20, #0x0
    a1dc:	540002ad 	b.le	a230 <__sflush_r+0x160>
    a1e0:	f9401a61 	ldr	x1, [x19, #48]
    a1e4:	2a1403e3 	mov	w3, w20
    a1e8:	f9402264 	ldr	x4, [x19, #64]
    a1ec:	aa1503e2 	mov	x2, x21
    a1f0:	aa1603e0 	mov	x0, x22
    a1f4:	d63f0080 	blr	x4
    a1f8:	4b000294 	sub	w20, w20, w0
    a1fc:	7100001f 	cmp	w0, #0x0
    a200:	54fffeac 	b.gt	a1d4 <__sflush_r+0x104>
    a204:	79402261 	ldrh	w1, [x19, #16]
    a208:	12800000 	mov	w0, #0xffffffff            	// #-1
    a20c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a210:	321a0021 	orr	w1, w1, #0x40
    a214:	79002261 	strh	w1, [x19, #16]
    a218:	a94153f3 	ldp	x19, x20, [sp, #16]
    a21c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a220:	d65f03c0 	ret
    a224:	b9407261 	ldr	w1, [x19, #112]
    a228:	7100003f 	cmp	w1, #0x0
    a22c:	54fff6cc 	b.gt	a104 <__sflush_r+0x34>
    a230:	52800000 	mov	w0, #0x0                   	// #0
    a234:	a94153f3 	ldp	x19, x20, [sp, #16]
    a238:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a23c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a240:	d65f03c0 	ret
    a244:	f9404a62 	ldr	x2, [x19, #144]
    a248:	17ffffbf 	b	a144 <__sflush_r+0x74>
    a24c:	79c02261 	ldrsh	w1, [x19, #16]
    a250:	f9400e62 	ldr	x2, [x19, #24]
    a254:	12147821 	and	w1, w1, #0xfffff7ff
    a258:	f9000262 	str	x2, [x19]
    a25c:	b9000a7f 	str	wzr, [x19, #8]
    a260:	79002261 	strh	w1, [x19, #16]
    a264:	36600041 	tbz	w1, #12, a26c <__sflush_r+0x19c>
    a268:	f9004a60 	str	x0, [x19, #144]
    a26c:	f9402e61 	ldr	x1, [x19, #88]
    a270:	b90002d4 	str	w20, [x22]
    a274:	b4fffde1 	cbz	x1, a230 <__sflush_r+0x160>
    a278:	9101d260 	add	x0, x19, #0x74
    a27c:	eb00003f 	cmp	x1, x0
    a280:	54000060 	b.eq	a28c <__sflush_r+0x1bc>  // b.none
    a284:	aa1603e0 	mov	x0, x22
    a288:	940001f6 	bl	aa60 <_free_r>
    a28c:	f9002e7f 	str	xzr, [x19, #88]
    a290:	52800000 	mov	w0, #0x0                   	// #0
    a294:	a94153f3 	ldp	x19, x20, [sp, #16]
    a298:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a29c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a2a0:	d65f03c0 	ret
    a2a4:	d2800023 	mov	x3, #0x1                   	// #1
    a2a8:	79c02261 	ldrsh	w1, [x19, #16]
    a2ac:	f2a40803 	movk	x3, #0x2040, lsl #16
    a2b0:	9ac22463 	lsr	x3, x3, x2
    a2b4:	3607f6a3 	tbz	w3, #0, a188 <__sflush_r+0xb8>
    a2b8:	f9400e63 	ldr	x3, [x19, #24]
    a2bc:	12147821 	and	w1, w1, #0xfffff7ff
    a2c0:	f9000263 	str	x3, [x19]
    a2c4:	b9000a7f 	str	wzr, [x19, #8]
    a2c8:	79002261 	strh	w1, [x19, #16]
    a2cc:	3667fd01 	tbz	w1, #12, a26c <__sflush_r+0x19c>
    a2d0:	35fffce2 	cbnz	w2, a26c <__sflush_r+0x19c>
    a2d4:	17ffffe5 	b	a268 <__sflush_r+0x198>
    a2d8:	b94002c0 	ldr	w0, [x22]
    a2dc:	34fff300 	cbz	w0, a13c <__sflush_r+0x6c>
    a2e0:	7100741f 	cmp	w0, #0x1d
    a2e4:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    a2e8:	54fff8e1 	b.ne	a204 <__sflush_r+0x134>  // b.any
    a2ec:	52800000 	mov	w0, #0x0                   	// #0
    a2f0:	b90002d4 	str	w20, [x22]
    a2f4:	17ffffd0 	b	a234 <__sflush_r+0x164>
    a2f8:	d503201f 	nop
    a2fc:	d503201f 	nop

000000000000a300 <_fflush_r>:
    a300:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a304:	910003fd 	mov	x29, sp
    a308:	f9000bf3 	str	x19, [sp, #16]
    a30c:	aa0003f3 	mov	x19, x0
    a310:	b4000060 	cbz	x0, a31c <_fflush_r+0x1c>
    a314:	b9405002 	ldr	w2, [x0, #80]
    a318:	340000e2 	cbz	w2, a334 <_fflush_r+0x34>
    a31c:	79c02020 	ldrsh	w0, [x1, #16]
    a320:	35000140 	cbnz	w0, a348 <_fflush_r+0x48>
    a324:	52800000 	mov	w0, #0x0                   	// #0
    a328:	f9400bf3 	ldr	x19, [sp, #16]
    a32c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a330:	d65f03c0 	ret
    a334:	f90017e1 	str	x1, [sp, #40]
    a338:	940000f2 	bl	a700 <__sinit>
    a33c:	f94017e1 	ldr	x1, [sp, #40]
    a340:	79c02020 	ldrsh	w0, [x1, #16]
    a344:	34ffff00 	cbz	w0, a324 <_fflush_r+0x24>
    a348:	aa1303e0 	mov	x0, x19
    a34c:	f9400bf3 	ldr	x19, [sp, #16]
    a350:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a354:	17ffff5f 	b	a0d0 <__sflush_r>
    a358:	d503201f 	nop
    a35c:	d503201f 	nop

000000000000a360 <fflush>:
    a360:	b4000340 	cbz	x0, a3c8 <fflush+0x68>
    a364:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a368:	910003fd 	mov	x29, sp
    a36c:	a90153f3 	stp	x19, x20, [sp, #16]
    a370:	aa0003f3 	mov	x19, x0
    a374:	d0000020 	adrp	x0, 10000 <__func__.0+0x10>
    a378:	f9438814 	ldr	x20, [x0, #1808]
    a37c:	b4000074 	cbz	x20, a388 <fflush+0x28>
    a380:	b9405280 	ldr	w0, [x20, #80]
    a384:	34000180 	cbz	w0, a3b4 <fflush+0x54>
    a388:	79c02260 	ldrsh	w0, [x19, #16]
    a38c:	350000a0 	cbnz	w0, a3a0 <fflush+0x40>
    a390:	52800000 	mov	w0, #0x0                   	// #0
    a394:	a94153f3 	ldp	x19, x20, [sp, #16]
    a398:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a39c:	d65f03c0 	ret
    a3a0:	aa1303e1 	mov	x1, x19
    a3a4:	aa1403e0 	mov	x0, x20
    a3a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a3ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a3b0:	17ffff48 	b	a0d0 <__sflush_r>
    a3b4:	aa1403e0 	mov	x0, x20
    a3b8:	940000d2 	bl	a700 <__sinit>
    a3bc:	79c02260 	ldrsh	w0, [x19, #16]
    a3c0:	34fffe80 	cbz	w0, a390 <fflush+0x30>
    a3c4:	17fffff7 	b	a3a0 <fflush+0x40>
    a3c8:	d0000020 	adrp	x0, 10000 <__func__.0+0x10>
    a3cc:	90000001 	adrp	x1, a000 <__swsetup_r+0x140>
    a3d0:	910c0021 	add	x1, x1, #0x300
    a3d4:	f9402c00 	ldr	x0, [x0, #88]
    a3d8:	140003b2 	b	b2a0 <_fwalk_reent>
    a3dc:	d503201f 	nop

000000000000a3e0 <__fp_lock>:
    a3e0:	52800000 	mov	w0, #0x0                   	// #0
    a3e4:	d65f03c0 	ret
    a3e8:	d503201f 	nop
    a3ec:	d503201f 	nop

000000000000a3f0 <_cleanup_r>:
    a3f0:	90000021 	adrp	x1, e000 <strcat+0x60>
    a3f4:	913b8021 	add	x1, x1, #0xee0
    a3f8:	140003aa 	b	b2a0 <_fwalk_reent>
    a3fc:	d503201f 	nop

000000000000a400 <__fp_unlock>:
    a400:	52800000 	mov	w0, #0x0                   	// #0
    a404:	d65f03c0 	ret
    a408:	d503201f 	nop
    a40c:	d503201f 	nop

000000000000a410 <__sinit.part.0>:
    a410:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    a414:	52800065 	mov	w5, #0x3                   	// #3
    a418:	90000001 	adrp	x1, a000 <__swsetup_r+0x140>
    a41c:	910003fd 	mov	x29, sp
    a420:	a9025bf5 	stp	x21, x22, [sp, #32]
    a424:	aa0003f5 	mov	x21, x0
    a428:	9114e2a4 	add	x4, x21, #0x538
    a42c:	a90153f3 	stp	x19, x20, [sp, #16]
    a430:	910fc020 	add	x0, x1, #0x3f0
    a434:	52800083 	mov	w3, #0x4                   	// #4
    a438:	f94006b3 	ldr	x19, [x21, #8]
    a43c:	a90363f7 	stp	x23, x24, [sp, #48]
    a440:	d2800102 	mov	x2, #0x8                   	// #8
    a444:	f90023f9 	str	x25, [sp, #64]
    a448:	52800001 	mov	w1, #0x0                   	// #0
    a44c:	f9002ea0 	str	x0, [x21, #88]
    a450:	91029260 	add	x0, x19, #0xa4
    a454:	f90292bf 	str	xzr, [x21, #1312]
    a458:	f0000018 	adrp	x24, d000 <__eucjp_mbtowc+0xf0>
    a45c:	b9052aa5 	str	w5, [x21, #1320]
    a460:	91398318 	add	x24, x24, #0xe60
    a464:	f9029aa4 	str	x4, [x21, #1328]
    a468:	f0000017 	adrp	x23, d000 <__eucjp_mbtowc+0xf0>
    a46c:	a9007e7f 	stp	xzr, xzr, [x19]
    a470:	913b42f7 	add	x23, x23, #0xed0
    a474:	f0000016 	adrp	x22, d000 <__eucjp_mbtowc+0xf0>
    a478:	b9001263 	str	w3, [x19, #16]
    a47c:	913c82d6 	add	x22, x22, #0xf20
    a480:	f9000e7f 	str	xzr, [x19, #24]
    a484:	f0000019 	adrp	x25, d000 <__eucjp_mbtowc+0xf0>
    a488:	b900227f 	str	wzr, [x19, #32]
    a48c:	91380339 	add	x25, x25, #0xe00
    a490:	b9002a7f 	str	wzr, [x19, #40]
    a494:	b900ae7f 	str	wzr, [x19, #172]
    a498:	97fff54a 	bl	79c0 <memset>
    a49c:	f9400ab4 	ldr	x20, [x21, #16]
    a4a0:	52800123 	mov	w3, #0x9                   	// #9
    a4a4:	a9036673 	stp	x19, x25, [x19, #48]
    a4a8:	72a00023 	movk	w3, #0x1, lsl #16
    a4ac:	91029280 	add	x0, x20, #0xa4
    a4b0:	a9045e78 	stp	x24, x23, [x19, #64]
    a4b4:	d2800102 	mov	x2, #0x8                   	// #8
    a4b8:	52800001 	mov	w1, #0x0                   	// #0
    a4bc:	f9002a76 	str	x22, [x19, #80]
    a4c0:	a9007e9f 	stp	xzr, xzr, [x20]
    a4c4:	b9001283 	str	w3, [x20, #16]
    a4c8:	f9000e9f 	str	xzr, [x20, #24]
    a4cc:	b900229f 	str	wzr, [x20, #32]
    a4d0:	b9002a9f 	str	wzr, [x20, #40]
    a4d4:	b900ae9f 	str	wzr, [x20, #172]
    a4d8:	97fff53a 	bl	79c0 <memset>
    a4dc:	f9400eb3 	ldr	x19, [x21, #24]
    a4e0:	52800243 	mov	w3, #0x12                  	// #18
    a4e4:	a9036694 	stp	x20, x25, [x20, #48]
    a4e8:	72a00043 	movk	w3, #0x2, lsl #16
    a4ec:	91029260 	add	x0, x19, #0xa4
    a4f0:	a9045e98 	stp	x24, x23, [x20, #64]
    a4f4:	d2800102 	mov	x2, #0x8                   	// #8
    a4f8:	52800001 	mov	w1, #0x0                   	// #0
    a4fc:	f9002a96 	str	x22, [x20, #80]
    a500:	a9007e7f 	stp	xzr, xzr, [x19]
    a504:	b9001263 	str	w3, [x19, #16]
    a508:	f9000e7f 	str	xzr, [x19, #24]
    a50c:	b900227f 	str	wzr, [x19, #32]
    a510:	b9002a7f 	str	wzr, [x19, #40]
    a514:	b900ae7f 	str	wzr, [x19, #172]
    a518:	97fff52a 	bl	79c0 <memset>
    a51c:	a9036673 	stp	x19, x25, [x19, #48]
    a520:	52800020 	mov	w0, #0x1                   	// #1
    a524:	a9045e78 	stp	x24, x23, [x19, #64]
    a528:	f9002a76 	str	x22, [x19, #80]
    a52c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a530:	a94363f7 	ldp	x23, x24, [sp, #48]
    a534:	f94023f9 	ldr	x25, [sp, #64]
    a538:	b90052a0 	str	w0, [x21, #80]
    a53c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a540:	a8c57bfd 	ldp	x29, x30, [sp], #80
    a544:	d65f03c0 	ret
    a548:	d503201f 	nop
    a54c:	d503201f 	nop

000000000000a550 <__sfmoreglue>:
    a550:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a554:	52801602 	mov	w2, #0xb0                  	// #176
    a558:	910003fd 	mov	x29, sp
    a55c:	a90153f3 	stp	x19, x20, [sp, #16]
    a560:	51000434 	sub	w20, w1, #0x1
    a564:	f90013f5 	str	x21, [sp, #32]
    a568:	2a0103f5 	mov	w21, w1
    a56c:	9b227e94 	smull	x20, w20, w2
    a570:	91032281 	add	x1, x20, #0xc8
    a574:	9400075b 	bl	c2e0 <_malloc_r>
    a578:	aa0003f3 	mov	x19, x0
    a57c:	b4000100 	cbz	x0, a59c <__sfmoreglue+0x4c>
    a580:	91006000 	add	x0, x0, #0x18
    a584:	f900027f 	str	xzr, [x19]
    a588:	b9000a75 	str	w21, [x19, #8]
    a58c:	9102c282 	add	x2, x20, #0xb0
    a590:	f9000a60 	str	x0, [x19, #16]
    a594:	52800001 	mov	w1, #0x0                   	// #0
    a598:	97fff50a 	bl	79c0 <memset>
    a59c:	aa1303e0 	mov	x0, x19
    a5a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a5a4:	f94013f5 	ldr	x21, [sp, #32]
    a5a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a5ac:	d65f03c0 	ret

000000000000a5b0 <__sfp>:
    a5b0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    a5b4:	d0000021 	adrp	x1, 10000 <__func__.0+0x10>
    a5b8:	910003fd 	mov	x29, sp
    a5bc:	a90153f3 	stp	x19, x20, [sp, #16]
    a5c0:	f9402c34 	ldr	x20, [x1, #88]
    a5c4:	f9001fe0 	str	x0, [sp, #56]
    a5c8:	f90013f5 	str	x21, [sp, #32]
    a5cc:	b9405280 	ldr	w0, [x20, #80]
    a5d0:	34000560 	cbz	w0, a67c <__sfp+0xcc>
    a5d4:	91148294 	add	x20, x20, #0x520
    a5d8:	52800095 	mov	w21, #0x4                   	// #4
    a5dc:	b9400a80 	ldr	w0, [x20, #8]
    a5e0:	f9400a93 	ldr	x19, [x20, #16]
    a5e4:	7100001f 	cmp	w0, #0x0
    a5e8:	5400042d 	b.le	a66c <__sfp+0xbc>
    a5ec:	51000400 	sub	w0, w0, #0x1
    a5f0:	91000400 	add	x0, x0, #0x1
    a5f4:	8b000401 	add	x1, x0, x0, lsl #1
    a5f8:	d37ef421 	lsl	x1, x1, #2
    a5fc:	cb000021 	sub	x1, x1, x0
    a600:	8b011261 	add	x1, x19, x1, lsl #4
    a604:	14000004 	b	a614 <__sfp+0x64>
    a608:	9102c273 	add	x19, x19, #0xb0
    a60c:	eb01027f 	cmp	x19, x1
    a610:	540002e0 	b.eq	a66c <__sfp+0xbc>  // b.none
    a614:	79c02260 	ldrsh	w0, [x19, #16]
    a618:	35ffff80 	cbnz	w0, a608 <__sfp+0x58>
    a61c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    a620:	a9007e7f 	stp	xzr, xzr, [x19]
    a624:	d2800102 	mov	x2, #0x8                   	// #8
    a628:	b9001260 	str	w0, [x19, #16]
    a62c:	52800001 	mov	w1, #0x0                   	// #0
    a630:	f9000e7f 	str	xzr, [x19, #24]
    a634:	91029260 	add	x0, x19, #0xa4
    a638:	b900227f 	str	wzr, [x19, #32]
    a63c:	b9002a7f 	str	wzr, [x19, #40]
    a640:	b900ae7f 	str	wzr, [x19, #172]
    a644:	97fff4df 	bl	79c0 <memset>
    a648:	f9002e7f 	str	xzr, [x19, #88]
    a64c:	b900627f 	str	wzr, [x19, #96]
    a650:	f9003e7f 	str	xzr, [x19, #120]
    a654:	b900827f 	str	wzr, [x19, #128]
    a658:	aa1303e0 	mov	x0, x19
    a65c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a660:	f94013f5 	ldr	x21, [sp, #32]
    a664:	a8c47bfd 	ldp	x29, x30, [sp], #64
    a668:	d65f03c0 	ret
    a66c:	f9400293 	ldr	x19, [x20]
    a670:	b40000d3 	cbz	x19, a688 <__sfp+0xd8>
    a674:	aa1303f4 	mov	x20, x19
    a678:	17ffffd9 	b	a5dc <__sfp+0x2c>
    a67c:	aa1403e0 	mov	x0, x20
    a680:	97ffff64 	bl	a410 <__sinit.part.0>
    a684:	17ffffd4 	b	a5d4 <__sfp+0x24>
    a688:	f9401fe0 	ldr	x0, [sp, #56]
    a68c:	d2805b01 	mov	x1, #0x2d8                 	// #728
    a690:	94000714 	bl	c2e0 <_malloc_r>
    a694:	aa0003f3 	mov	x19, x0
    a698:	b4000160 	cbz	x0, a6c4 <__sfp+0x114>
    a69c:	91006000 	add	x0, x0, #0x18
    a6a0:	f900027f 	str	xzr, [x19]
    a6a4:	b9000a75 	str	w21, [x19, #8]
    a6a8:	d2805802 	mov	x2, #0x2c0                 	// #704
    a6ac:	f9000a60 	str	x0, [x19, #16]
    a6b0:	52800001 	mov	w1, #0x0                   	// #0
    a6b4:	97fff4c3 	bl	79c0 <memset>
    a6b8:	f9000293 	str	x19, [x20]
    a6bc:	aa1303f4 	mov	x20, x19
    a6c0:	17ffffc7 	b	a5dc <__sfp+0x2c>
    a6c4:	f9401fe1 	ldr	x1, [sp, #56]
    a6c8:	f900029f 	str	xzr, [x20]
    a6cc:	52800180 	mov	w0, #0xc                   	// #12
    a6d0:	b9000020 	str	w0, [x1]
    a6d4:	17ffffe1 	b	a658 <__sfp+0xa8>
    a6d8:	d503201f 	nop
    a6dc:	d503201f 	nop

000000000000a6e0 <_cleanup>:
    a6e0:	d0000020 	adrp	x0, 10000 <__func__.0+0x10>
    a6e4:	90000021 	adrp	x1, e000 <strcat+0x60>
    a6e8:	913b8021 	add	x1, x1, #0xee0
    a6ec:	f9402c00 	ldr	x0, [x0, #88]
    a6f0:	140002ec 	b	b2a0 <_fwalk_reent>
    a6f4:	d503201f 	nop
    a6f8:	d503201f 	nop
    a6fc:	d503201f 	nop

000000000000a700 <__sinit>:
    a700:	b9405001 	ldr	w1, [x0, #80]
    a704:	34000041 	cbz	w1, a70c <__sinit+0xc>
    a708:	d65f03c0 	ret
    a70c:	17ffff41 	b	a410 <__sinit.part.0>

000000000000a710 <__sfp_lock_acquire>:
    a710:	d65f03c0 	ret
    a714:	d503201f 	nop
    a718:	d503201f 	nop
    a71c:	d503201f 	nop

000000000000a720 <__sfp_lock_release>:
    a720:	d65f03c0 	ret
    a724:	d503201f 	nop
    a728:	d503201f 	nop
    a72c:	d503201f 	nop

000000000000a730 <__sinit_lock_acquire>:
    a730:	d65f03c0 	ret
    a734:	d503201f 	nop
    a738:	d503201f 	nop
    a73c:	d503201f 	nop

000000000000a740 <__sinit_lock_release>:
    a740:	d65f03c0 	ret
    a744:	d503201f 	nop
    a748:	d503201f 	nop
    a74c:	d503201f 	nop

000000000000a750 <__fp_lock_all>:
    a750:	d0000020 	adrp	x0, 10000 <__func__.0+0x10>
    a754:	90000001 	adrp	x1, a000 <__swsetup_r+0x140>
    a758:	910f8021 	add	x1, x1, #0x3e0
    a75c:	f9438800 	ldr	x0, [x0, #1808]
    a760:	140002a8 	b	b200 <_fwalk>
    a764:	d503201f 	nop
    a768:	d503201f 	nop
    a76c:	d503201f 	nop

000000000000a770 <__fp_unlock_all>:
    a770:	d0000020 	adrp	x0, 10000 <__func__.0+0x10>
    a774:	90000001 	adrp	x1, a000 <__swsetup_r+0x140>
    a778:	91100021 	add	x1, x1, #0x400
    a77c:	f9438800 	ldr	x0, [x0, #1808]
    a780:	140002a0 	b	b200 <_fwalk>
    a784:	d503201f 	nop
    a788:	d503201f 	nop
    a78c:	d503201f 	nop

000000000000a790 <__fputwc>:
    a790:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    a794:	910003fd 	mov	x29, sp
    a798:	a90153f3 	stp	x19, x20, [sp, #16]
    a79c:	aa0203f3 	mov	x19, x2
    a7a0:	a9025bf5 	stp	x21, x22, [sp, #32]
    a7a4:	2a0103f6 	mov	w22, w1
    a7a8:	a90363f7 	stp	x23, x24, [sp, #48]
    a7ac:	aa0003f7 	mov	x23, x0
    a7b0:	9400062c 	bl	c060 <__locale_mb_cur_max>
    a7b4:	7100041f 	cmp	w0, #0x1
    a7b8:	54000081 	b.ne	a7c8 <__fputwc+0x38>  // b.any
    a7bc:	510006c0 	sub	w0, w22, #0x1
    a7c0:	7103f81f 	cmp	w0, #0xfe
    a7c4:	54000509 	b.ls	a864 <__fputwc+0xd4>  // b.plast
    a7c8:	91029263 	add	x3, x19, #0xa4
    a7cc:	2a1603e2 	mov	w2, w22
    a7d0:	910123e1 	add	x1, sp, #0x48
    a7d4:	aa1703e0 	mov	x0, x23
    a7d8:	97fffd5e 	bl	9d50 <_wcrtomb_r>
    a7dc:	aa0003f5 	mov	x21, x0
    a7e0:	b100041f 	cmn	x0, #0x1
    a7e4:	54000540 	b.eq	a88c <__fputwc+0xfc>  // b.none
    a7e8:	b4000460 	cbz	x0, a874 <__fputwc+0xe4>
    a7ec:	394123e1 	ldrb	w1, [sp, #72]
    a7f0:	910123f8 	add	x24, sp, #0x48
    a7f4:	d2800014 	mov	x20, #0x0                   	// #0
    a7f8:	14000009 	b	a81c <__fputwc+0x8c>
    a7fc:	f9400263 	ldr	x3, [x19]
    a800:	91000464 	add	x4, x3, #0x1
    a804:	f9000264 	str	x4, [x19]
    a808:	39000061 	strb	w1, [x3]
    a80c:	91000694 	add	x20, x20, #0x1
    a810:	eb15029f 	cmp	x20, x21
    a814:	54000302 	b.cs	a874 <__fputwc+0xe4>  // b.hs, b.nlast
    a818:	38786a81 	ldrb	w1, [x20, x24]
    a81c:	b9400e63 	ldr	w3, [x19, #12]
    a820:	51000463 	sub	w3, w3, #0x1
    a824:	b9000e63 	str	w3, [x19, #12]
    a828:	36fffea3 	tbz	w3, #31, a7fc <__fputwc+0x6c>
    a82c:	b9402a64 	ldr	w4, [x19, #40]
    a830:	aa1303e2 	mov	x2, x19
    a834:	aa1703e0 	mov	x0, x23
    a838:	6b04007f 	cmp	w3, w4
    a83c:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    a840:	54fffde1 	b.ne	a7fc <__fputwc+0x6c>  // b.any
    a844:	94000f9b 	bl	e6b0 <__swbuf_r>
    a848:	3100041f 	cmn	w0, #0x1
    a84c:	54fffe01 	b.ne	a80c <__fputwc+0x7c>  // b.any
    a850:	a94153f3 	ldp	x19, x20, [sp, #16]
    a854:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a858:	a94363f7 	ldp	x23, x24, [sp, #48]
    a85c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    a860:	d65f03c0 	ret
    a864:	12001ec1 	and	w1, w22, #0xff
    a868:	d2800035 	mov	x21, #0x1                   	// #1
    a86c:	390123e1 	strb	w1, [sp, #72]
    a870:	17ffffe0 	b	a7f0 <__fputwc+0x60>
    a874:	2a1603e0 	mov	w0, w22
    a878:	a94153f3 	ldp	x19, x20, [sp, #16]
    a87c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a880:	a94363f7 	ldp	x23, x24, [sp, #48]
    a884:	a8c57bfd 	ldp	x29, x30, [sp], #80
    a888:	d65f03c0 	ret
    a88c:	79402261 	ldrh	w1, [x19, #16]
    a890:	321a0021 	orr	w1, w1, #0x40
    a894:	79002261 	strh	w1, [x19, #16]
    a898:	17ffffee 	b	a850 <__fputwc+0xc0>
    a89c:	d503201f 	nop

000000000000a8a0 <_fputwc_r>:
    a8a0:	79c02043 	ldrsh	w3, [x2, #16]
    a8a4:	376800c3 	tbnz	w3, #13, a8bc <_fputwc_r+0x1c>
    a8a8:	b940ac44 	ldr	w4, [x2, #172]
    a8ac:	32130063 	orr	w3, w3, #0x2000
    a8b0:	79002043 	strh	w3, [x2, #16]
    a8b4:	32130083 	orr	w3, w4, #0x2000
    a8b8:	b900ac43 	str	w3, [x2, #172]
    a8bc:	17ffffb5 	b	a790 <__fputwc>

000000000000a8c0 <fputwc>:
    a8c0:	d0000023 	adrp	x3, 10000 <__func__.0+0x10>
    a8c4:	aa0103e2 	mov	x2, x1
    a8c8:	2a0003e1 	mov	w1, w0
    a8cc:	f9438860 	ldr	x0, [x3, #1808]
    a8d0:	b4000060 	cbz	x0, a8dc <fputwc+0x1c>
    a8d4:	b9405003 	ldr	w3, [x0, #80]
    a8d8:	34000123 	cbz	w3, a8fc <fputwc+0x3c>
    a8dc:	79c02043 	ldrsh	w3, [x2, #16]
    a8e0:	376800c3 	tbnz	w3, #13, a8f8 <fputwc+0x38>
    a8e4:	b940ac44 	ldr	w4, [x2, #172]
    a8e8:	32130063 	orr	w3, w3, #0x2000
    a8ec:	79002043 	strh	w3, [x2, #16]
    a8f0:	32130083 	orr	w3, w4, #0x2000
    a8f4:	b900ac43 	str	w3, [x2, #172]
    a8f8:	17ffffa6 	b	a790 <__fputwc>
    a8fc:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a900:	910003fd 	mov	x29, sp
    a904:	f9000fe0 	str	x0, [sp, #24]
    a908:	b90027e1 	str	w1, [sp, #36]
    a90c:	f90017e2 	str	x2, [sp, #40]
    a910:	97ffff7c 	bl	a700 <__sinit>
    a914:	f94017e2 	ldr	x2, [sp, #40]
    a918:	b94027e1 	ldr	w1, [sp, #36]
    a91c:	f9400fe0 	ldr	x0, [sp, #24]
    a920:	79c02043 	ldrsh	w3, [x2, #16]
    a924:	376800c3 	tbnz	w3, #13, a93c <fputwc+0x7c>
    a928:	b940ac44 	ldr	w4, [x2, #172]
    a92c:	32130063 	orr	w3, w3, #0x2000
    a930:	79002043 	strh	w3, [x2, #16]
    a934:	32130083 	orr	w3, w4, #0x2000
    a938:	b900ac43 	str	w3, [x2, #172]
    a93c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a940:	17ffff94 	b	a790 <__fputwc>
    a944:	d503201f 	nop
    a948:	d503201f 	nop
    a94c:	d503201f 	nop

000000000000a950 <_malloc_trim_r>:
    a950:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a954:	910003fd 	mov	x29, sp
    a958:	a9025bf5 	stp	x21, x22, [sp, #32]
    a95c:	f0000036 	adrp	x22, 11000 <__global_locale+0x180>
    a960:	9100a2d6 	add	x22, x22, #0x28
    a964:	aa0003f5 	mov	x21, x0
    a968:	a90153f3 	stp	x19, x20, [sp, #16]
    a96c:	aa0103f3 	mov	x19, x1
    a970:	94000a64 	bl	d300 <__malloc_lock>
    a974:	f9400ac0 	ldr	x0, [x22, #16]
    a978:	f9400414 	ldr	x20, [x0, #8]
    a97c:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    a980:	cb130293 	sub	x19, x20, x19
    a984:	913f7e73 	add	x19, x19, #0xfdf
    a988:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    a98c:	d1400673 	sub	x19, x19, #0x1, lsl #12
    a990:	f13ffe7f 	cmp	x19, #0xfff
    a994:	5400010d 	b.le	a9b4 <_malloc_trim_r+0x64>
    a998:	d2800001 	mov	x1, #0x0                   	// #0
    a99c:	aa1503e0 	mov	x0, x21
    a9a0:	94000bb0 	bl	d860 <_sbrk_r>
    a9a4:	f9400ac1 	ldr	x1, [x22, #16]
    a9a8:	8b140021 	add	x1, x1, x20
    a9ac:	eb01001f 	cmp	x0, x1
    a9b0:	54000100 	b.eq	a9d0 <_malloc_trim_r+0x80>  // b.none
    a9b4:	aa1503e0 	mov	x0, x21
    a9b8:	94000a56 	bl	d310 <__malloc_unlock>
    a9bc:	52800000 	mov	w0, #0x0                   	// #0
    a9c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a9c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a9c8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a9cc:	d65f03c0 	ret
    a9d0:	cb1303e1 	neg	x1, x19
    a9d4:	aa1503e0 	mov	x0, x21
    a9d8:	94000ba2 	bl	d860 <_sbrk_r>
    a9dc:	b100041f 	cmn	x0, #0x1
    a9e0:	54000200 	b.eq	aa20 <_malloc_trim_r+0xd0>  // b.none
    a9e4:	f0000022 	adrp	x2, 11000 <__global_locale+0x180>
    a9e8:	cb130294 	sub	x20, x20, x19
    a9ec:	f9400ac3 	ldr	x3, [x22, #16]
    a9f0:	b2400294 	orr	x20, x20, #0x1
    a9f4:	b94f3841 	ldr	w1, [x2, #3896]
    a9f8:	aa1503e0 	mov	x0, x21
    a9fc:	f9000474 	str	x20, [x3, #8]
    aa00:	4b130033 	sub	w19, w1, w19
    aa04:	b90f3853 	str	w19, [x2, #3896]
    aa08:	94000a42 	bl	d310 <__malloc_unlock>
    aa0c:	52800020 	mov	w0, #0x1                   	// #1
    aa10:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa14:	a9425bf5 	ldp	x21, x22, [sp, #32]
    aa18:	a8c37bfd 	ldp	x29, x30, [sp], #48
    aa1c:	d65f03c0 	ret
    aa20:	d2800001 	mov	x1, #0x0                   	// #0
    aa24:	aa1503e0 	mov	x0, x21
    aa28:	94000b8e 	bl	d860 <_sbrk_r>
    aa2c:	f9400ac2 	ldr	x2, [x22, #16]
    aa30:	cb020001 	sub	x1, x0, x2
    aa34:	f1007c3f 	cmp	x1, #0x1f
    aa38:	54fffbed 	b.le	a9b4 <_malloc_trim_r+0x64>
    aa3c:	f0000024 	adrp	x4, 11000 <__global_locale+0x180>
    aa40:	b2400021 	orr	x1, x1, #0x1
    aa44:	f9000441 	str	x1, [x2, #8]
    aa48:	f0000023 	adrp	x3, 11000 <__global_locale+0x180>
    aa4c:	f9441c81 	ldr	x1, [x4, #2104]
    aa50:	cb010000 	sub	x0, x0, x1
    aa54:	b90f3860 	str	w0, [x3, #3896]
    aa58:	17ffffd7 	b	a9b4 <_malloc_trim_r+0x64>
    aa5c:	d503201f 	nop

000000000000aa60 <_free_r>:
    aa60:	b4000a21 	cbz	x1, aba4 <_free_r+0x144>
    aa64:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aa68:	910003fd 	mov	x29, sp
    aa6c:	a90153f3 	stp	x19, x20, [sp, #16]
    aa70:	aa0103f3 	mov	x19, x1
    aa74:	aa0003f4 	mov	x20, x0
    aa78:	94000a22 	bl	d300 <__malloc_lock>
    aa7c:	f85f8265 	ldur	x5, [x19, #-8]
    aa80:	d1004263 	sub	x3, x19, #0x10
    aa84:	f0000020 	adrp	x0, 11000 <__global_locale+0x180>
    aa88:	9100a000 	add	x0, x0, #0x28
    aa8c:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    aa90:	8b020064 	add	x4, x3, x2
    aa94:	f9400806 	ldr	x6, [x0, #16]
    aa98:	f9400481 	ldr	x1, [x4, #8]
    aa9c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    aaa0:	eb0400df 	cmp	x6, x4
    aaa4:	54000c60 	b.eq	ac30 <_free_r+0x1d0>  // b.none
    aaa8:	f9000481 	str	x1, [x4, #8]
    aaac:	8b010086 	add	x6, x4, x1
    aab0:	37000345 	tbnz	w5, #0, ab18 <_free_r+0xb8>
    aab4:	f85f0267 	ldur	x7, [x19, #-16]
    aab8:	f0000025 	adrp	x5, 11000 <__global_locale+0x180>
    aabc:	f94004c6 	ldr	x6, [x6, #8]
    aac0:	cb070063 	sub	x3, x3, x7
    aac4:	8b070042 	add	x2, x2, x7
    aac8:	9100e0a5 	add	x5, x5, #0x38
    aacc:	924000c6 	and	x6, x6, #0x1
    aad0:	f9400867 	ldr	x7, [x3, #16]
    aad4:	eb0500ff 	cmp	x7, x5
    aad8:	54000940 	b.eq	ac00 <_free_r+0x1a0>  // b.none
    aadc:	f9400c68 	ldr	x8, [x3, #24]
    aae0:	f9000ce8 	str	x8, [x7, #24]
    aae4:	f9000907 	str	x7, [x8, #16]
    aae8:	b50001c6 	cbnz	x6, ab20 <_free_r+0xc0>
    aaec:	8b010042 	add	x2, x2, x1
    aaf0:	f9400881 	ldr	x1, [x4, #16]
    aaf4:	b2400046 	orr	x6, x2, #0x1
    aaf8:	eb05003f 	cmp	x1, x5
    aafc:	54000ee0 	b.eq	acd8 <_free_r+0x278>  // b.none
    ab00:	f9400c84 	ldr	x4, [x4, #24]
    ab04:	f9000c24 	str	x4, [x1, #24]
    ab08:	f9000881 	str	x1, [x4, #16]
    ab0c:	f9000466 	str	x6, [x3, #8]
    ab10:	f8226862 	str	x2, [x3, x2]
    ab14:	14000006 	b	ab2c <_free_r+0xcc>
    ab18:	f94004c5 	ldr	x5, [x6, #8]
    ab1c:	36000465 	tbz	w5, #0, aba8 <_free_r+0x148>
    ab20:	b2400041 	orr	x1, x2, #0x1
    ab24:	f9000461 	str	x1, [x3, #8]
    ab28:	f9000082 	str	x2, [x4]
    ab2c:	f107fc5f 	cmp	x2, #0x1ff
    ab30:	54000449 	b.ls	abb8 <_free_r+0x158>  // b.plast
    ab34:	d349fc41 	lsr	x1, x2, #9
    ab38:	f127fc5f 	cmp	x2, #0x9ff
    ab3c:	54000a28 	b.hi	ac80 <_free_r+0x220>  // b.pmore
    ab40:	d346fc41 	lsr	x1, x2, #6
    ab44:	1100e424 	add	w4, w1, #0x39
    ab48:	1100e025 	add	w5, w1, #0x38
    ab4c:	531f7884 	lsl	w4, w4, #1
    ab50:	937d7c84 	sbfiz	x4, x4, #3, #32
    ab54:	8b040004 	add	x4, x0, x4
    ab58:	f85f0481 	ldr	x1, [x4], #-16
    ab5c:	eb01009f 	cmp	x4, x1
    ab60:	54000ae0 	b.eq	acbc <_free_r+0x25c>  // b.none
    ab64:	d503201f 	nop
    ab68:	f9400420 	ldr	x0, [x1, #8]
    ab6c:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    ab70:	eb02001f 	cmp	x0, x2
    ab74:	54000089 	b.ls	ab84 <_free_r+0x124>  // b.plast
    ab78:	f9400821 	ldr	x1, [x1, #16]
    ab7c:	eb01009f 	cmp	x4, x1
    ab80:	54ffff41 	b.ne	ab68 <_free_r+0x108>  // b.any
    ab84:	f9400c24 	ldr	x4, [x1, #24]
    ab88:	a9011061 	stp	x1, x4, [x3, #16]
    ab8c:	aa1403e0 	mov	x0, x20
    ab90:	f9000883 	str	x3, [x4, #16]
    ab94:	f9000c23 	str	x3, [x1, #24]
    ab98:	a94153f3 	ldp	x19, x20, [sp, #16]
    ab9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aba0:	140009dc 	b	d310 <__malloc_unlock>
    aba4:	d65f03c0 	ret
    aba8:	f0000025 	adrp	x5, 11000 <__global_locale+0x180>
    abac:	8b010042 	add	x2, x2, x1
    abb0:	9100e0a5 	add	x5, x5, #0x38
    abb4:	17ffffcf 	b	aaf0 <_free_r+0x90>
    abb8:	d343fc42 	lsr	x2, x2, #3
    abbc:	d2800024 	mov	x4, #0x1                   	// #1
    abc0:	11000441 	add	w1, w2, #0x1
    abc4:	f9400405 	ldr	x5, [x0, #8]
    abc8:	531f7821 	lsl	w1, w1, #1
    abcc:	13027c42 	asr	w2, w2, #2
    abd0:	8b21cc01 	add	x1, x0, w1, sxtw #3
    abd4:	9ac22082 	lsl	x2, x4, x2
    abd8:	aa050042 	orr	x2, x2, x5
    abdc:	f9000402 	str	x2, [x0, #8]
    abe0:	f85f0420 	ldr	x0, [x1], #-16
    abe4:	a9010460 	stp	x0, x1, [x3, #16]
    abe8:	f9000823 	str	x3, [x1, #16]
    abec:	f9000c03 	str	x3, [x0, #24]
    abf0:	aa1403e0 	mov	x0, x20
    abf4:	a94153f3 	ldp	x19, x20, [sp, #16]
    abf8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    abfc:	140009c5 	b	d310 <__malloc_unlock>
    ac00:	b50009c6 	cbnz	x6, ad38 <_free_r+0x2d8>
    ac04:	a9410085 	ldp	x5, x0, [x4, #16]
    ac08:	8b020021 	add	x1, x1, x2
    ac0c:	f9000ca0 	str	x0, [x5, #24]
    ac10:	b2400022 	orr	x2, x1, #0x1
    ac14:	f9000805 	str	x5, [x0, #16]
    ac18:	aa1403e0 	mov	x0, x20
    ac1c:	f9000462 	str	x2, [x3, #8]
    ac20:	f8216861 	str	x1, [x3, x1]
    ac24:	a94153f3 	ldp	x19, x20, [sp, #16]
    ac28:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ac2c:	140009b9 	b	d310 <__malloc_unlock>
    ac30:	8b010041 	add	x1, x2, x1
    ac34:	370000e5 	tbnz	w5, #0, ac50 <_free_r+0x1f0>
    ac38:	f85f0262 	ldur	x2, [x19, #-16]
    ac3c:	cb020063 	sub	x3, x3, x2
    ac40:	8b020021 	add	x1, x1, x2
    ac44:	a9410864 	ldp	x4, x2, [x3, #16]
    ac48:	f9000c82 	str	x2, [x4, #24]
    ac4c:	f9000844 	str	x4, [x2, #16]
    ac50:	f0000022 	adrp	x2, 11000 <__global_locale+0x180>
    ac54:	b2400024 	orr	x4, x1, #0x1
    ac58:	f9000464 	str	x4, [x3, #8]
    ac5c:	f9442042 	ldr	x2, [x2, #2112]
    ac60:	f9000803 	str	x3, [x0, #16]
    ac64:	eb01005f 	cmp	x2, x1
    ac68:	54fffc48 	b.hi	abf0 <_free_r+0x190>  // b.pmore
    ac6c:	f0000021 	adrp	x1, 11000 <__global_locale+0x180>
    ac70:	aa1403e0 	mov	x0, x20
    ac74:	f947b821 	ldr	x1, [x1, #3952]
    ac78:	97ffff36 	bl	a950 <_malloc_trim_r>
    ac7c:	17ffffdd 	b	abf0 <_free_r+0x190>
    ac80:	f100503f 	cmp	x1, #0x14
    ac84:	54000129 	b.ls	aca8 <_free_r+0x248>  // b.plast
    ac88:	f101503f 	cmp	x1, #0x54
    ac8c:	54000308 	b.hi	acec <_free_r+0x28c>  // b.pmore
    ac90:	d34cfc41 	lsr	x1, x2, #12
    ac94:	1101bc24 	add	w4, w1, #0x6f
    ac98:	1101b825 	add	w5, w1, #0x6e
    ac9c:	531f7884 	lsl	w4, w4, #1
    aca0:	937d7c84 	sbfiz	x4, x4, #3, #32
    aca4:	17ffffac 	b	ab54 <_free_r+0xf4>
    aca8:	11017024 	add	w4, w1, #0x5c
    acac:	11016c25 	add	w5, w1, #0x5b
    acb0:	531f7884 	lsl	w4, w4, #1
    acb4:	937d7c84 	sbfiz	x4, x4, #3, #32
    acb8:	17ffffa7 	b	ab54 <_free_r+0xf4>
    acbc:	f9400406 	ldr	x6, [x0, #8]
    acc0:	13027ca5 	asr	w5, w5, #2
    acc4:	d2800022 	mov	x2, #0x1                   	// #1
    acc8:	9ac52045 	lsl	x5, x2, x5
    accc:	aa0600a5 	orr	x5, x5, x6
    acd0:	f9000405 	str	x5, [x0, #8]
    acd4:	17ffffad 	b	ab88 <_free_r+0x128>
    acd8:	a9020c03 	stp	x3, x3, [x0, #32]
    acdc:	a9009466 	stp	x6, x5, [x3, #8]
    ace0:	f9000c65 	str	x5, [x3, #24]
    ace4:	f8226862 	str	x2, [x3, x2]
    ace8:	17ffffc2 	b	abf0 <_free_r+0x190>
    acec:	f105503f 	cmp	x1, #0x154
    acf0:	540000e8 	b.hi	ad0c <_free_r+0x2ac>  // b.pmore
    acf4:	d34ffc41 	lsr	x1, x2, #15
    acf8:	1101e024 	add	w4, w1, #0x78
    acfc:	1101dc25 	add	w5, w1, #0x77
    ad00:	531f7884 	lsl	w4, w4, #1
    ad04:	937d7c84 	sbfiz	x4, x4, #3, #32
    ad08:	17ffff93 	b	ab54 <_free_r+0xf4>
    ad0c:	f115503f 	cmp	x1, #0x554
    ad10:	540000e8 	b.hi	ad2c <_free_r+0x2cc>  // b.pmore
    ad14:	d352fc41 	lsr	x1, x2, #18
    ad18:	1101f424 	add	w4, w1, #0x7d
    ad1c:	1101f025 	add	w5, w1, #0x7c
    ad20:	531f7884 	lsl	w4, w4, #1
    ad24:	937d7c84 	sbfiz	x4, x4, #3, #32
    ad28:	17ffff8b 	b	ab54 <_free_r+0xf4>
    ad2c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    ad30:	52800fc5 	mov	w5, #0x7e                  	// #126
    ad34:	17ffff88 	b	ab54 <_free_r+0xf4>
    ad38:	b2400040 	orr	x0, x2, #0x1
    ad3c:	f9000460 	str	x0, [x3, #8]
    ad40:	f9000082 	str	x2, [x4]
    ad44:	17ffffab 	b	abf0 <_free_r+0x190>
    ad48:	d503201f 	nop
    ad4c:	d503201f 	nop

000000000000ad50 <__sfvwrite_r>:
    ad50:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    ad54:	910003fd 	mov	x29, sp
    ad58:	a90363f7 	stp	x23, x24, [sp, #48]
    ad5c:	aa0003f7 	mov	x23, x0
    ad60:	f9400840 	ldr	x0, [x2, #16]
    ad64:	b4000460 	cbz	x0, adf0 <__sfvwrite_r+0xa0>
    ad68:	79402023 	ldrh	w3, [x1, #16]
    ad6c:	aa0203f8 	mov	x24, x2
    ad70:	a90153f3 	stp	x19, x20, [sp, #16]
    ad74:	aa0103f3 	mov	x19, x1
    ad78:	36180443 	tbz	w3, #3, ae00 <__sfvwrite_r+0xb0>
    ad7c:	f9400c20 	ldr	x0, [x1, #24]
    ad80:	b4000400 	cbz	x0, ae00 <__sfvwrite_r+0xb0>
    ad84:	a9025bf5 	stp	x21, x22, [sp, #32]
    ad88:	a9046bf9 	stp	x25, x26, [sp, #64]
    ad8c:	f9400314 	ldr	x20, [x24]
    ad90:	360804a3 	tbz	w3, #1, ae24 <__sfvwrite_r+0xd4>
    ad94:	d2800016 	mov	x22, #0x0                   	// #0
    ad98:	d2800015 	mov	x21, #0x0                   	// #0
    ad9c:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    ada0:	eb1902bf 	cmp	x21, x25
    ada4:	aa1603e2 	mov	x2, x22
    ada8:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    adac:	aa1703e0 	mov	x0, x23
    adb0:	b4000875 	cbz	x21, aebc <__sfvwrite_r+0x16c>
    adb4:	f9401a61 	ldr	x1, [x19, #48]
    adb8:	f9402264 	ldr	x4, [x19, #64]
    adbc:	d63f0080 	blr	x4
    adc0:	7100001f 	cmp	w0, #0x0
    adc4:	5400206d 	b.le	b1d0 <__sfvwrite_r+0x480>
    adc8:	f9400b01 	ldr	x1, [x24, #16]
    adcc:	93407c00 	sxtw	x0, w0
    add0:	8b0002d6 	add	x22, x22, x0
    add4:	cb0002b5 	sub	x21, x21, x0
    add8:	cb000020 	sub	x0, x1, x0
    addc:	f9000b00 	str	x0, [x24, #16]
    ade0:	b5fffe00 	cbnz	x0, ada0 <__sfvwrite_r+0x50>
    ade4:	a94153f3 	ldp	x19, x20, [sp, #16]
    ade8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    adec:	a9446bf9 	ldp	x25, x26, [sp, #64]
    adf0:	52800000 	mov	w0, #0x0                   	// #0
    adf4:	a94363f7 	ldp	x23, x24, [sp, #48]
    adf8:	a8c67bfd 	ldp	x29, x30, [sp], #96
    adfc:	d65f03c0 	ret
    ae00:	aa1303e1 	mov	x1, x19
    ae04:	aa1703e0 	mov	x0, x23
    ae08:	97fffc2e 	bl	9ec0 <__swsetup_r>
    ae0c:	35001f00 	cbnz	w0, b1ec <__sfvwrite_r+0x49c>
    ae10:	79402263 	ldrh	w3, [x19, #16]
    ae14:	a9025bf5 	stp	x21, x22, [sp, #32]
    ae18:	a9046bf9 	stp	x25, x26, [sp, #64]
    ae1c:	f9400314 	ldr	x20, [x24]
    ae20:	370ffba3 	tbnz	w3, #1, ad94 <__sfvwrite_r+0x44>
    ae24:	a90573fb 	stp	x27, x28, [sp, #80]
    ae28:	37000503 	tbnz	w3, #0, aec8 <__sfvwrite_r+0x178>
    ae2c:	d280001c 	mov	x28, #0x0                   	// #0
    ae30:	d2800015 	mov	x21, #0x0                   	// #0
    ae34:	d503201f 	nop
    ae38:	b40003d5 	cbz	x21, aeb0 <__sfvwrite_r+0x160>
    ae3c:	f9400266 	ldr	x6, [x19]
    ae40:	b9400e7a 	ldr	w26, [x19, #12]
    ae44:	aa0603e0 	mov	x0, x6
    ae48:	36480ac3 	tbz	w3, #9, afa0 <__sfvwrite_r+0x250>
    ae4c:	93407f5b 	sxtw	x27, w26
    ae50:	eb15037f 	cmp	x27, x21
    ae54:	540010c9 	b.ls	b06c <__sfvwrite_r+0x31c>  // b.plast
    ae58:	93407ea1 	sxtw	x1, w21
    ae5c:	aa0103f6 	mov	x22, x1
    ae60:	aa0603e0 	mov	x0, x6
    ae64:	aa0103fb 	mov	x27, x1
    ae68:	2a1503fa 	mov	w26, w21
    ae6c:	aa1b03e2 	mov	x2, x27
    ae70:	aa1c03e1 	mov	x1, x28
    ae74:	97fff2a3 	bl	7900 <memmove>
    ae78:	f9400261 	ldr	x1, [x19]
    ae7c:	b9400e60 	ldr	w0, [x19, #12]
    ae80:	8b1b0022 	add	x2, x1, x27
    ae84:	f9000262 	str	x2, [x19]
    ae88:	4b1a0000 	sub	w0, w0, w26
    ae8c:	b9000e60 	str	w0, [x19, #12]
    ae90:	f9400b00 	ldr	x0, [x24, #16]
    ae94:	8b16039c 	add	x28, x28, x22
    ae98:	cb1602b5 	sub	x21, x21, x22
    ae9c:	cb160016 	sub	x22, x0, x22
    aea0:	f9000b16 	str	x22, [x24, #16]
    aea4:	b40005d6 	cbz	x22, af5c <__sfvwrite_r+0x20c>
    aea8:	79402263 	ldrh	w3, [x19, #16]
    aeac:	b5fffc95 	cbnz	x21, ae3c <__sfvwrite_r+0xec>
    aeb0:	a940569c 	ldp	x28, x21, [x20]
    aeb4:	91004294 	add	x20, x20, #0x10
    aeb8:	17ffffe0 	b	ae38 <__sfvwrite_r+0xe8>
    aebc:	a9405696 	ldp	x22, x21, [x20]
    aec0:	91004294 	add	x20, x20, #0x10
    aec4:	17ffffb7 	b	ada0 <__sfvwrite_r+0x50>
    aec8:	5280001a 	mov	w26, #0x0                   	// #0
    aecc:	52800000 	mov	w0, #0x0                   	// #0
    aed0:	d280001b 	mov	x27, #0x0                   	// #0
    aed4:	d2800019 	mov	x25, #0x0                   	// #0
    aed8:	b40004d9 	cbz	x25, af70 <__sfvwrite_r+0x220>
    aedc:	34000500 	cbz	w0, af7c <__sfvwrite_r+0x22c>
    aee0:	f9400260 	ldr	x0, [x19]
    aee4:	93407f56 	sxtw	x22, w26
    aee8:	f9400e61 	ldr	x1, [x19, #24]
    aeec:	eb1902df 	cmp	x22, x25
    aef0:	b9400e75 	ldr	w21, [x19, #12]
    aef4:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    aef8:	b9402263 	ldr	w3, [x19, #32]
    aefc:	eb01001f 	cmp	x0, x1
    af00:	0b150075 	add	w21, w3, w21
    af04:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    af08:	5400132c 	b.gt	b16c <__sfvwrite_r+0x41c>
    af0c:	6b16007f 	cmp	w3, w22
    af10:	5400116c 	b.gt	b13c <__sfvwrite_r+0x3ec>
    af14:	f9401a61 	ldr	x1, [x19, #48]
    af18:	aa1b03e2 	mov	x2, x27
    af1c:	f9402264 	ldr	x4, [x19, #64]
    af20:	aa1703e0 	mov	x0, x23
    af24:	d63f0080 	blr	x4
    af28:	2a0003f5 	mov	w21, w0
    af2c:	7100001f 	cmp	w0, #0x0
    af30:	5400088d 	b.le	b040 <__sfvwrite_r+0x2f0>
    af34:	6b15035a 	subs	w26, w26, w21
    af38:	52800020 	mov	w0, #0x1                   	// #1
    af3c:	54000f60 	b.eq	b128 <__sfvwrite_r+0x3d8>  // b.none
    af40:	f9400b01 	ldr	x1, [x24, #16]
    af44:	93407eb5 	sxtw	x21, w21
    af48:	8b15037b 	add	x27, x27, x21
    af4c:	cb150339 	sub	x25, x25, x21
    af50:	cb150035 	sub	x21, x1, x21
    af54:	f9000b15 	str	x21, [x24, #16]
    af58:	b5fffc15 	cbnz	x21, aed8 <__sfvwrite_r+0x188>
    af5c:	a94153f3 	ldp	x19, x20, [sp, #16]
    af60:	a9425bf5 	ldp	x21, x22, [sp, #32]
    af64:	a9446bf9 	ldp	x25, x26, [sp, #64]
    af68:	a94573fb 	ldp	x27, x28, [sp, #80]
    af6c:	17ffffa1 	b	adf0 <__sfvwrite_r+0xa0>
    af70:	a940669b 	ldp	x27, x25, [x20]
    af74:	91004294 	add	x20, x20, #0x10
    af78:	b4ffffd9 	cbz	x25, af70 <__sfvwrite_r+0x220>
    af7c:	aa1903e2 	mov	x2, x25
    af80:	aa1b03e0 	mov	x0, x27
    af84:	52800141 	mov	w1, #0xa                   	// #10
    af88:	940008a7 	bl	d224 <memchr>
    af8c:	9100041a 	add	x26, x0, #0x1
    af90:	f100001f 	cmp	x0, #0x0
    af94:	cb1b035a 	sub	x26, x26, x27
    af98:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    af9c:	17ffffd1 	b	aee0 <__sfvwrite_r+0x190>
    afa0:	f9400e60 	ldr	x0, [x19, #24]
    afa4:	eb06001f 	cmp	x0, x6
    afa8:	54000263 	b.cc	aff4 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    afac:	b9402263 	ldr	w3, [x19, #32]
    afb0:	eb23c2bf 	cmp	x21, w3, sxtw
    afb4:	54000203 	b.cc	aff4 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    afb8:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    afbc:	eb0002bf 	cmp	x21, x0
    afc0:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    afc4:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    afc8:	f9401a61 	ldr	x1, [x19, #48]
    afcc:	aa1c03e2 	mov	x2, x28
    afd0:	1ac30c84 	sdiv	w4, w4, w3
    afd4:	aa1703e0 	mov	x0, x23
    afd8:	f9402266 	ldr	x6, [x19, #64]
    afdc:	1b037c83 	mul	w3, w4, w3
    afe0:	d63f00c0 	blr	x6
    afe4:	7100001f 	cmp	w0, #0x0
    afe8:	540002cd 	b.le	b040 <__sfvwrite_r+0x2f0>
    afec:	93407c16 	sxtw	x22, w0
    aff0:	17ffffa8 	b	ae90 <__sfvwrite_r+0x140>
    aff4:	93407f44 	sxtw	x4, w26
    aff8:	aa1c03e1 	mov	x1, x28
    affc:	eb15009f 	cmp	x4, x21
    b000:	aa0603e0 	mov	x0, x6
    b004:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    b008:	93407f56 	sxtw	x22, w26
    b00c:	aa1603e2 	mov	x2, x22
    b010:	97fff23c 	bl	7900 <memmove>
    b014:	f9400261 	ldr	x1, [x19]
    b018:	b9400e60 	ldr	w0, [x19, #12]
    b01c:	8b160021 	add	x1, x1, x22
    b020:	f9000261 	str	x1, [x19]
    b024:	4b1a0004 	sub	w4, w0, w26
    b028:	b9000e64 	str	w4, [x19, #12]
    b02c:	35fff324 	cbnz	w4, ae90 <__sfvwrite_r+0x140>
    b030:	aa1303e1 	mov	x1, x19
    b034:	aa1703e0 	mov	x0, x23
    b038:	97fffcb2 	bl	a300 <_fflush_r>
    b03c:	34fff2a0 	cbz	w0, ae90 <__sfvwrite_r+0x140>
    b040:	a94573fb 	ldp	x27, x28, [sp, #80]
    b044:	79c02261 	ldrsh	w1, [x19, #16]
    b048:	321a0021 	orr	w1, w1, #0x40
    b04c:	79002261 	strh	w1, [x19, #16]
    b050:	12800000 	mov	w0, #0xffffffff            	// #-1
    b054:	a94153f3 	ldp	x19, x20, [sp, #16]
    b058:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b05c:	a94363f7 	ldp	x23, x24, [sp, #48]
    b060:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b064:	a8c67bfd 	ldp	x29, x30, [sp], #96
    b068:	d65f03c0 	ret
    b06c:	93407eb6 	sxtw	x22, w21
    b070:	52809001 	mov	w1, #0x480                 	// #1152
    b074:	6a01007f 	tst	w3, w1
    b078:	54ffefa0 	b.eq	ae6c <__sfvwrite_r+0x11c>  // b.none
    b07c:	b9402267 	ldr	w7, [x19, #32]
    b080:	f9400e61 	ldr	x1, [x19, #24]
    b084:	0b0704e7 	add	w7, w7, w7, lsl #1
    b088:	cb0100d6 	sub	x22, x6, x1
    b08c:	0b477ce7 	add	w7, w7, w7, lsr #31
    b090:	93407ed9 	sxtw	x25, w22
    b094:	13017cfb 	asr	w27, w7, #1
    b098:	91000720 	add	x0, x25, #0x1
    b09c:	8b150000 	add	x0, x0, x21
    b0a0:	93407f62 	sxtw	x2, w27
    b0a4:	eb00005f 	cmp	x2, x0
    b0a8:	54000082 	b.cs	b0b8 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    b0ac:	110006c7 	add	w7, w22, #0x1
    b0b0:	0b1500fb 	add	w27, w7, w21
    b0b4:	93407f62 	sxtw	x2, w27
    b0b8:	36500723 	tbz	w3, #10, b19c <__sfvwrite_r+0x44c>
    b0bc:	aa0203e1 	mov	x1, x2
    b0c0:	aa1703e0 	mov	x0, x23
    b0c4:	94000487 	bl	c2e0 <_malloc_r>
    b0c8:	aa0003fa 	mov	x26, x0
    b0cc:	b4000860 	cbz	x0, b1d8 <__sfvwrite_r+0x488>
    b0d0:	f9400e61 	ldr	x1, [x19, #24]
    b0d4:	aa1903e2 	mov	x2, x25
    b0d8:	97fff1aa 	bl	7780 <memcpy>
    b0dc:	79402260 	ldrh	w0, [x19, #16]
    b0e0:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    b0e4:	0a010000 	and	w0, w0, w1
    b0e8:	32190000 	orr	w0, w0, #0x80
    b0ec:	79002260 	strh	w0, [x19, #16]
    b0f0:	8b190340 	add	x0, x26, x25
    b0f4:	4b160366 	sub	w6, w27, w22
    b0f8:	93407eb6 	sxtw	x22, w21
    b0fc:	f9000260 	str	x0, [x19]
    b100:	b9000e66 	str	w6, [x19, #12]
    b104:	aa1603e1 	mov	x1, x22
    b108:	f9000e7a 	str	x26, [x19, #24]
    b10c:	aa0003e6 	mov	x6, x0
    b110:	b900227b 	str	w27, [x19, #32]
    b114:	2a1503fa 	mov	w26, w21
    b118:	eb1502df 	cmp	x22, x21
    b11c:	54ffea08 	b.hi	ae5c <__sfvwrite_r+0x10c>  // b.pmore
    b120:	aa1603fb 	mov	x27, x22
    b124:	17ffff52 	b	ae6c <__sfvwrite_r+0x11c>
    b128:	aa1303e1 	mov	x1, x19
    b12c:	aa1703e0 	mov	x0, x23
    b130:	97fffc74 	bl	a300 <_fflush_r>
    b134:	34fff060 	cbz	w0, af40 <__sfvwrite_r+0x1f0>
    b138:	17ffffc2 	b	b040 <__sfvwrite_r+0x2f0>
    b13c:	93407edc 	sxtw	x28, w22
    b140:	aa1b03e1 	mov	x1, x27
    b144:	aa1c03e2 	mov	x2, x28
    b148:	97fff1ee 	bl	7900 <memmove>
    b14c:	f9400260 	ldr	x0, [x19]
    b150:	2a1603f5 	mov	w21, w22
    b154:	b9400e61 	ldr	w1, [x19, #12]
    b158:	8b1c0000 	add	x0, x0, x28
    b15c:	f9000260 	str	x0, [x19]
    b160:	4b160036 	sub	w22, w1, w22
    b164:	b9000e76 	str	w22, [x19, #12]
    b168:	17ffff73 	b	af34 <__sfvwrite_r+0x1e4>
    b16c:	93407eb6 	sxtw	x22, w21
    b170:	aa1b03e1 	mov	x1, x27
    b174:	aa1603e2 	mov	x2, x22
    b178:	97fff1e2 	bl	7900 <memmove>
    b17c:	f9400262 	ldr	x2, [x19]
    b180:	aa1303e1 	mov	x1, x19
    b184:	aa1703e0 	mov	x0, x23
    b188:	8b160042 	add	x2, x2, x22
    b18c:	f9000262 	str	x2, [x19]
    b190:	97fffc5c 	bl	a300 <_fflush_r>
    b194:	34ffed00 	cbz	w0, af34 <__sfvwrite_r+0x1e4>
    b198:	17ffffaa 	b	b040 <__sfvwrite_r+0x2f0>
    b19c:	aa1703e0 	mov	x0, x23
    b1a0:	94000860 	bl	d320 <_realloc_r>
    b1a4:	aa0003fa 	mov	x26, x0
    b1a8:	b5fffa40 	cbnz	x0, b0f0 <__sfvwrite_r+0x3a0>
    b1ac:	f9400e61 	ldr	x1, [x19, #24]
    b1b0:	aa1703e0 	mov	x0, x23
    b1b4:	97fffe2b 	bl	aa60 <_free_r>
    b1b8:	79c02261 	ldrsh	w1, [x19, #16]
    b1bc:	52800180 	mov	w0, #0xc                   	// #12
    b1c0:	a94573fb 	ldp	x27, x28, [sp, #80]
    b1c4:	12187821 	and	w1, w1, #0xffffff7f
    b1c8:	b90002e0 	str	w0, [x23]
    b1cc:	17ffff9f 	b	b048 <__sfvwrite_r+0x2f8>
    b1d0:	79c02261 	ldrsh	w1, [x19, #16]
    b1d4:	17ffff9d 	b	b048 <__sfvwrite_r+0x2f8>
    b1d8:	79c02261 	ldrsh	w1, [x19, #16]
    b1dc:	52800180 	mov	w0, #0xc                   	// #12
    b1e0:	a94573fb 	ldp	x27, x28, [sp, #80]
    b1e4:	b90002e0 	str	w0, [x23]
    b1e8:	17ffff98 	b	b048 <__sfvwrite_r+0x2f8>
    b1ec:	12800000 	mov	w0, #0xffffffff            	// #-1
    b1f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    b1f4:	17ffff00 	b	adf4 <__sfvwrite_r+0xa4>
    b1f8:	d503201f 	nop
    b1fc:	d503201f 	nop

000000000000b200 <_fwalk>:
    b200:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    b204:	910003fd 	mov	x29, sp
    b208:	a9025bf5 	stp	x21, x22, [sp, #32]
    b20c:	91148015 	add	x21, x0, #0x520
    b210:	aa0103f6 	mov	x22, x1
    b214:	a90153f3 	stp	x19, x20, [sp, #16]
    b218:	f9001bf7 	str	x23, [sp, #48]
    b21c:	52800017 	mov	w23, #0x0                   	// #0
    b220:	b9400aa0 	ldr	w0, [x21, #8]
    b224:	f9400ab3 	ldr	x19, [x21, #16]
    b228:	7100001f 	cmp	w0, #0x0
    b22c:	5400026d 	b.le	b278 <_fwalk+0x78>
    b230:	51000400 	sub	w0, w0, #0x1
    b234:	91000400 	add	x0, x0, #0x1
    b238:	8b000414 	add	x20, x0, x0, lsl #1
    b23c:	d37ef694 	lsl	x20, x20, #2
    b240:	cb000294 	sub	x20, x20, x0
    b244:	8b141274 	add	x20, x19, x20, lsl #4
    b248:	79402260 	ldrh	w0, [x19, #16]
    b24c:	7100041f 	cmp	w0, #0x1
    b250:	540000e9 	b.ls	b26c <_fwalk+0x6c>  // b.plast
    b254:	79c02662 	ldrsh	w2, [x19, #18]
    b258:	aa1303e0 	mov	x0, x19
    b25c:	3100045f 	cmn	w2, #0x1
    b260:	54000060 	b.eq	b26c <_fwalk+0x6c>  // b.none
    b264:	d63f02c0 	blr	x22
    b268:	2a0002f7 	orr	w23, w23, w0
    b26c:	9102c273 	add	x19, x19, #0xb0
    b270:	eb13029f 	cmp	x20, x19
    b274:	54fffea1 	b.ne	b248 <_fwalk+0x48>  // b.any
    b278:	f94002b5 	ldr	x21, [x21]
    b27c:	b5fffd35 	cbnz	x21, b220 <_fwalk+0x20>
    b280:	2a1703e0 	mov	w0, w23
    b284:	a94153f3 	ldp	x19, x20, [sp, #16]
    b288:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b28c:	f9401bf7 	ldr	x23, [sp, #48]
    b290:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b294:	d65f03c0 	ret
    b298:	d503201f 	nop
    b29c:	d503201f 	nop

000000000000b2a0 <_fwalk_reent>:
    b2a0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    b2a4:	910003fd 	mov	x29, sp
    b2a8:	a9025bf5 	stp	x21, x22, [sp, #32]
    b2ac:	aa0103f6 	mov	x22, x1
    b2b0:	91148015 	add	x21, x0, #0x520
    b2b4:	a90363f7 	stp	x23, x24, [sp, #48]
    b2b8:	aa0003f8 	mov	x24, x0
    b2bc:	52800017 	mov	w23, #0x0                   	// #0
    b2c0:	a90153f3 	stp	x19, x20, [sp, #16]
    b2c4:	d503201f 	nop
    b2c8:	b9400aa2 	ldr	w2, [x21, #8]
    b2cc:	f9400ab3 	ldr	x19, [x21, #16]
    b2d0:	7100005f 	cmp	w2, #0x0
    b2d4:	5400028d 	b.le	b324 <_fwalk_reent+0x84>
    b2d8:	51000442 	sub	w2, w2, #0x1
    b2dc:	91000442 	add	x2, x2, #0x1
    b2e0:	8b020454 	add	x20, x2, x2, lsl #1
    b2e4:	d37ef694 	lsl	x20, x20, #2
    b2e8:	cb020294 	sub	x20, x20, x2
    b2ec:	8b141274 	add	x20, x19, x20, lsl #4
    b2f0:	79402262 	ldrh	w2, [x19, #16]
    b2f4:	7100045f 	cmp	w2, #0x1
    b2f8:	54000109 	b.ls	b318 <_fwalk_reent+0x78>  // b.plast
    b2fc:	79c02662 	ldrsh	w2, [x19, #18]
    b300:	aa1303e1 	mov	x1, x19
    b304:	aa1803e0 	mov	x0, x24
    b308:	3100045f 	cmn	w2, #0x1
    b30c:	54000060 	b.eq	b318 <_fwalk_reent+0x78>  // b.none
    b310:	d63f02c0 	blr	x22
    b314:	2a0002f7 	orr	w23, w23, w0
    b318:	9102c273 	add	x19, x19, #0xb0
    b31c:	eb13029f 	cmp	x20, x19
    b320:	54fffe81 	b.ne	b2f0 <_fwalk_reent+0x50>  // b.any
    b324:	f94002b5 	ldr	x21, [x21]
    b328:	b5fffd15 	cbnz	x21, b2c8 <_fwalk_reent+0x28>
    b32c:	2a1703e0 	mov	w0, w23
    b330:	a94153f3 	ldp	x19, x20, [sp, #16]
    b334:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b338:	a94363f7 	ldp	x23, x24, [sp, #48]
    b33c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b340:	d65f03c0 	ret
    b344:	d503201f 	nop
    b348:	d503201f 	nop
    b34c:	d503201f 	nop

000000000000b350 <__localeconv_l>:
    b350:	91040000 	add	x0, x0, #0x100
    b354:	d65f03c0 	ret
    b358:	d503201f 	nop
    b35c:	d503201f 	nop

000000000000b360 <_localeconv_r>:
    b360:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    b364:	913e0000 	add	x0, x0, #0xf80
    b368:	d65f03c0 	ret
    b36c:	d503201f 	nop

000000000000b370 <localeconv>:
    b370:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    b374:	913e0000 	add	x0, x0, #0xf80
    b378:	d65f03c0 	ret
    b37c:	d503201f 	nop

000000000000b380 <currentlocale>:
    b380:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    b384:	910003fd 	mov	x29, sp
    b388:	a90153f3 	stp	x19, x20, [sp, #16]
    b38c:	b0000034 	adrp	x20, 10000 <__func__.0+0x10>
    b390:	913a0294 	add	x20, x20, #0xe80
    b394:	a9025bf5 	stp	x21, x22, [sp, #32]
    b398:	91010296 	add	x22, x20, #0x40
    b39c:	d0000035 	adrp	x21, 11000 <__global_locale+0x180>
    b3a0:	913242b5 	add	x21, x21, #0xc90
    b3a4:	f9001bf7 	str	x23, [sp, #48]
    b3a8:	91038297 	add	x23, x20, #0xe0
    b3ac:	91008294 	add	x20, x20, #0x20
    b3b0:	aa1603f3 	mov	x19, x22
    b3b4:	aa1503e0 	mov	x0, x21
    b3b8:	aa1403e1 	mov	x1, x20
    b3bc:	94000b51 	bl	e100 <strcpy>
    b3c0:	aa1303e1 	mov	x1, x19
    b3c4:	aa1403e0 	mov	x0, x20
    b3c8:	91008273 	add	x19, x19, #0x20
    b3cc:	97fff1fd 	bl	7bc0 <strcmp>
    b3d0:	35000120 	cbnz	w0, b3f4 <currentlocale+0x74>
    b3d4:	eb17027f 	cmp	x19, x23
    b3d8:	54ffff41 	b.ne	b3c0 <currentlocale+0x40>  // b.any
    b3dc:	aa1503e0 	mov	x0, x21
    b3e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    b3e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b3e8:	f9401bf7 	ldr	x23, [sp, #48]
    b3ec:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b3f0:	d65f03c0 	ret
    b3f4:	90000033 	adrp	x19, f000 <_fstat_r+0x40>
    b3f8:	912f0273 	add	x19, x19, #0xbc0
    b3fc:	aa1303e1 	mov	x1, x19
    b400:	aa1503e0 	mov	x0, x21
    b404:	94000ae7 	bl	dfa0 <strcat>
    b408:	aa1603e1 	mov	x1, x22
    b40c:	aa1503e0 	mov	x0, x21
    b410:	910082d6 	add	x22, x22, #0x20
    b414:	94000ae3 	bl	dfa0 <strcat>
    b418:	eb1702df 	cmp	x22, x23
    b41c:	54ffff01 	b.ne	b3fc <currentlocale+0x7c>  // b.any
    b420:	aa1503e0 	mov	x0, x21
    b424:	a94153f3 	ldp	x19, x20, [sp, #16]
    b428:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b42c:	f9401bf7 	ldr	x23, [sp, #48]
    b430:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b434:	d65f03c0 	ret
    b438:	d503201f 	nop
    b43c:	d503201f 	nop

000000000000b440 <__loadlocale>:
    b440:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    b444:	910003fd 	mov	x29, sp
    b448:	a90153f3 	stp	x19, x20, [sp, #16]
    b44c:	937b7c34 	sbfiz	x20, x1, #5, #32
    b450:	8b140014 	add	x20, x0, x20
    b454:	aa0203f3 	mov	x19, x2
    b458:	a9025bf5 	stp	x21, x22, [sp, #32]
    b45c:	aa0003f6 	mov	x22, x0
    b460:	aa0203e0 	mov	x0, x2
    b464:	a90363f7 	stp	x23, x24, [sp, #48]
    b468:	2a0103f7 	mov	w23, w1
    b46c:	aa1403e1 	mov	x1, x20
    b470:	97fff1d4 	bl	7bc0 <strcmp>
    b474:	350000e0 	cbnz	w0, b490 <__loadlocale+0x50>
    b478:	aa1403e0 	mov	x0, x20
    b47c:	a94153f3 	ldp	x19, x20, [sp, #16]
    b480:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b484:	a94363f7 	ldp	x23, x24, [sp, #48]
    b488:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    b48c:	d65f03c0 	ret
    b490:	aa1303e0 	mov	x0, x19
    b494:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b498:	b0000035 	adrp	x21, 10000 <__func__.0+0x10>
    b49c:	91064021 	add	x1, x1, #0x190
    b4a0:	910662b5 	add	x21, x21, #0x198
    b4a4:	a9046bf9 	stp	x25, x26, [sp, #64]
    b4a8:	97fff1c6 	bl	7bc0 <strcmp>
    b4ac:	34000d80 	cbz	w0, b65c <__loadlocale+0x21c>
    b4b0:	aa1503e1 	mov	x1, x21
    b4b4:	aa1303e0 	mov	x0, x19
    b4b8:	97fff1c2 	bl	7bc0 <strcmp>
    b4bc:	2a0003f5 	mov	w21, w0
    b4c0:	34000be0 	cbz	w0, b63c <__loadlocale+0x1fc>
    b4c4:	39400260 	ldrb	w0, [x19]
    b4c8:	71010c1f 	cmp	w0, #0x43
    b4cc:	54000d00 	b.eq	b66c <__loadlocale+0x22c>  // b.none
    b4d0:	51018400 	sub	w0, w0, #0x61
    b4d4:	12001c00 	and	w0, w0, #0xff
    b4d8:	7100641f 	cmp	w0, #0x19
    b4dc:	54000a08 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b4e0:	39400660 	ldrb	w0, [x19, #1]
    b4e4:	51018400 	sub	w0, w0, #0x61
    b4e8:	12001c00 	and	w0, w0, #0xff
    b4ec:	7100641f 	cmp	w0, #0x19
    b4f0:	54000968 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b4f4:	39400a60 	ldrb	w0, [x19, #2]
    b4f8:	91000a75 	add	x21, x19, #0x2
    b4fc:	51018401 	sub	w1, w0, #0x61
    b500:	12001c21 	and	w1, w1, #0xff
    b504:	7100643f 	cmp	w1, #0x19
    b508:	54000068 	b.hi	b514 <__loadlocale+0xd4>  // b.pmore
    b50c:	39400e60 	ldrb	w0, [x19, #3]
    b510:	91000e75 	add	x21, x19, #0x3
    b514:	71017c1f 	cmp	w0, #0x5f
    b518:	54000d00 	b.eq	b6b8 <__loadlocale+0x278>  // b.none
    b51c:	7100b81f 	cmp	w0, #0x2e
    b520:	54002ec0 	b.eq	baf8 <__loadlocale+0x6b8>  // b.none
    b524:	528017e1 	mov	w1, #0xbf                  	// #191
    b528:	6a01001f 	tst	w0, w1
    b52c:	54000781 	b.ne	b61c <__loadlocale+0x1dc>  // b.any
    b530:	910203f8 	add	x24, sp, #0x80
    b534:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b538:	aa1803e0 	mov	x0, x24
    b53c:	9106a021 	add	x1, x1, #0x1a8
    b540:	94000af0 	bl	e100 <strcpy>
    b544:	394002a0 	ldrb	w0, [x21]
    b548:	7101001f 	cmp	w0, #0x40
    b54c:	54002da0 	b.eq	bb00 <__loadlocale+0x6c0>  // b.none
    b550:	52800019 	mov	w25, #0x0                   	// #0
    b554:	52800015 	mov	w21, #0x0                   	// #0
    b558:	5280001a 	mov	w26, #0x0                   	// #0
    b55c:	394203e1 	ldrb	w1, [sp, #128]
    b560:	51010421 	sub	w1, w1, #0x41
    b564:	7100d03f 	cmp	w1, #0x34
    b568:	540005a8 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b56c:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    b570:	910a8000 	add	x0, x0, #0x2a0
    b574:	a90573fb 	stp	x27, x28, [sp, #80]
    b578:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    b57c:	10000061 	adr	x1, b588 <__loadlocale+0x148>
    b580:	8b20a820 	add	x0, x1, w0, sxth #2
    b584:	d61f0000 	br	x0
    b588:	394207e0 	ldrb	w0, [sp, #129]
    b58c:	121a7800 	and	w0, w0, #0xffffffdf
    b590:	12001c00 	and	w0, w0, #0xff
    b594:	7101401f 	cmp	w0, #0x50
    b598:	54000401 	b.ne	b618 <__loadlocale+0x1d8>  // b.any
    b59c:	d2800042 	mov	x2, #0x2                   	// #2
    b5a0:	aa1803e0 	mov	x0, x24
    b5a4:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b5a8:	9108e021 	add	x1, x1, #0x238
    b5ac:	94000b81 	bl	e3b0 <strncpy>
    b5b0:	9101e3e1 	add	x1, sp, #0x78
    b5b4:	91020be0 	add	x0, sp, #0x82
    b5b8:	52800142 	mov	w2, #0xa                   	// #10
    b5bc:	94000c29 	bl	e660 <strtol>
    b5c0:	f9403fe1 	ldr	x1, [sp, #120]
    b5c4:	39400021 	ldrb	w1, [x1]
    b5c8:	35000281 	cbnz	w1, b618 <__loadlocale+0x1d8>
    b5cc:	f10e901f 	cmp	x0, #0x3a4
    b5d0:	540030a0 	b.eq	bbe4 <__loadlocale+0x7a4>  // b.none
    b5d4:	54002f2c 	b.gt	bbb8 <__loadlocale+0x778>
    b5d8:	f10d881f 	cmp	x0, #0x362
    b5dc:	54002dec 	b.gt	bb98 <__loadlocale+0x758>
    b5e0:	f10d441f 	cmp	x0, #0x351
    b5e4:	54002c8c 	b.gt	bb74 <__loadlocale+0x734>
    b5e8:	f106d41f 	cmp	x0, #0x1b5
    b5ec:	54002da0 	b.eq	bba0 <__loadlocale+0x760>  // b.none
    b5f0:	d10b4000 	sub	x0, x0, #0x2d0
    b5f4:	f100dc1f 	cmp	x0, #0x37
    b5f8:	54000108 	b.hi	b618 <__loadlocale+0x1d8>  // b.pmore
    b5fc:	d2800021 	mov	x1, #0x1                   	// #1
    b600:	d280003c 	mov	x28, #0x1                   	// #1
    b604:	f2a00041 	movk	x1, #0x2, lsl #16
    b608:	9ac02380 	lsl	x0, x28, x0
    b60c:	f2e01001 	movk	x1, #0x80, lsl #48
    b610:	ea01001f 	tst	x0, x1
    b614:	54000e21 	b.ne	b7d8 <__loadlocale+0x398>  // b.any
    b618:	a94573fb 	ldp	x27, x28, [sp, #80]
    b61c:	d2800014 	mov	x20, #0x0                   	// #0
    b620:	aa1403e0 	mov	x0, x20
    b624:	a94153f3 	ldp	x19, x20, [sp, #16]
    b628:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b62c:	a94363f7 	ldp	x23, x24, [sp, #48]
    b630:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b634:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    b638:	d65f03c0 	ret
    b63c:	910203f8 	add	x24, sp, #0x80
    b640:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b644:	aa1803e0 	mov	x0, x24
    b648:	91068021 	add	x1, x1, #0x1a0
    b64c:	52800019 	mov	w25, #0x0                   	// #0
    b650:	5280001a 	mov	w26, #0x0                   	// #0
    b654:	94000aab 	bl	e100 <strcpy>
    b658:	17ffffc1 	b	b55c <__loadlocale+0x11c>
    b65c:	aa1503e1 	mov	x1, x21
    b660:	aa1303e0 	mov	x0, x19
    b664:	94000aa7 	bl	e100 <strcpy>
    b668:	17ffff92 	b	b4b0 <__loadlocale+0x70>
    b66c:	39400660 	ldrb	w0, [x19, #1]
    b670:	5100b400 	sub	w0, w0, #0x2d
    b674:	12001c00 	and	w0, w0, #0xff
    b678:	7100041f 	cmp	w0, #0x1
    b67c:	54fffd08 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b680:	91000a75 	add	x21, x19, #0x2
    b684:	910203f8 	add	x24, sp, #0x80
    b688:	aa1503e1 	mov	x1, x21
    b68c:	aa1803e0 	mov	x0, x24
    b690:	94000a9c 	bl	e100 <strcpy>
    b694:	aa1803e0 	mov	x0, x24
    b698:	52800801 	mov	w1, #0x40                  	// #64
    b69c:	94000a5e 	bl	e014 <strchr>
    b6a0:	b4000040 	cbz	x0, b6a8 <__loadlocale+0x268>
    b6a4:	3900001f 	strb	wzr, [x0]
    b6a8:	aa1803e0 	mov	x0, x24
    b6ac:	97fff185 	bl	7cc0 <strlen>
    b6b0:	8b0002b5 	add	x21, x21, x0
    b6b4:	17ffffa4 	b	b544 <__loadlocale+0x104>
    b6b8:	394006a0 	ldrb	w0, [x21, #1]
    b6bc:	51010400 	sub	w0, w0, #0x41
    b6c0:	12001c00 	and	w0, w0, #0xff
    b6c4:	7100641f 	cmp	w0, #0x19
    b6c8:	54fffaa8 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b6cc:	39400aa0 	ldrb	w0, [x21, #2]
    b6d0:	51010400 	sub	w0, w0, #0x41
    b6d4:	12001c00 	and	w0, w0, #0xff
    b6d8:	7100641f 	cmp	w0, #0x19
    b6dc:	54fffa08 	b.hi	b61c <__loadlocale+0x1dc>  // b.pmore
    b6e0:	39400ea0 	ldrb	w0, [x21, #3]
    b6e4:	91000eb5 	add	x21, x21, #0x3
    b6e8:	17ffff8d 	b	b51c <__loadlocale+0xdc>
    b6ec:	b000003b 	adrp	x27, 10000 <__func__.0+0x10>
    b6f0:	9107837b 	add	x27, x27, #0x1e0
    b6f4:	aa1b03e1 	mov	x1, x27
    b6f8:	aa1803e0 	mov	x0, x24
    b6fc:	94000a0d 	bl	df30 <strcasecmp>
    b700:	340000c0 	cbz	w0, b718 <__loadlocale+0x2d8>
    b704:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b708:	aa1803e0 	mov	x0, x24
    b70c:	9107a021 	add	x1, x1, #0x1e8
    b710:	94000a08 	bl	df30 <strcasecmp>
    b714:	35fff820 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b718:	aa1b03e1 	mov	x1, x27
    b71c:	aa1803e0 	mov	x0, x24
    b720:	94000a78 	bl	e100 <strcpy>
    b724:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    b728:	f0000002 	adrp	x2, e000 <strcat+0x60>
    b72c:	912dc37b 	add	x27, x27, #0xb70
    b730:	9129c042 	add	x2, x2, #0xa70
    b734:	528000dc 	mov	w28, #0x6                   	// #6
    b738:	71000aff 	cmp	w23, #0x2
    b73c:	54001b00 	b.eq	ba9c <__loadlocale+0x65c>  // b.none
    b740:	71001aff 	cmp	w23, #0x6
    b744:	54000081 	b.ne	b754 <__loadlocale+0x314>  // b.any
    b748:	aa1803e1 	mov	x1, x24
    b74c:	91060ac0 	add	x0, x22, #0x182
    b750:	94000a6c 	bl	e100 <strcpy>
    b754:	aa1303e1 	mov	x1, x19
    b758:	aa1403e0 	mov	x0, x20
    b75c:	94000a69 	bl	e100 <strcpy>
    b760:	aa0003f4 	mov	x20, x0
    b764:	aa1403e0 	mov	x0, x20
    b768:	a94153f3 	ldp	x19, x20, [sp, #16]
    b76c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b770:	a94363f7 	ldp	x23, x24, [sp, #48]
    b774:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b778:	a94573fb 	ldp	x27, x28, [sp, #80]
    b77c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    b780:	d65f03c0 	ret
    b784:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b788:	aa1803e0 	mov	x0, x24
    b78c:	910a2021 	add	x1, x1, #0x288
    b790:	d2800062 	mov	x2, #0x3                   	// #3
    b794:	94000ae3 	bl	e320 <strncasecmp>
    b798:	35fff400 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b79c:	39420fe0 	ldrb	w0, [sp, #131]
    b7a0:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b7a4:	910a4021 	add	x1, x1, #0x290
    b7a8:	7100b41f 	cmp	w0, #0x2d
    b7ac:	910283e0 	add	x0, sp, #0xa0
    b7b0:	9a801400 	cinc	x0, x0, eq  // eq = none
    b7b4:	d1007400 	sub	x0, x0, #0x1d
    b7b8:	97fff102 	bl	7bc0 <strcmp>
    b7bc:	35fff2e0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b7c0:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b7c4:	aa1803e0 	mov	x0, x24
    b7c8:	910a6021 	add	x1, x1, #0x298
    b7cc:	d503201f 	nop
    b7d0:	5280003c 	mov	w28, #0x1                   	// #1
    b7d4:	94000a4b 	bl	e100 <strcpy>
    b7d8:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    b7dc:	f0000002 	adrp	x2, e000 <strcat+0x60>
    b7e0:	912c837b 	add	x27, x27, #0xb20
    b7e4:	9128c042 	add	x2, x2, #0xa30
    b7e8:	17ffffd4 	b	b738 <__loadlocale+0x2f8>
    b7ec:	b000003b 	adrp	x27, 10000 <__func__.0+0x10>
    b7f0:	9108437b 	add	x27, x27, #0x210
    b7f4:	aa1b03e1 	mov	x1, x27
    b7f8:	aa1803e0 	mov	x0, x24
    b7fc:	940009cd 	bl	df30 <strcasecmp>
    b800:	35fff0c0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b804:	aa1b03e1 	mov	x1, x27
    b808:	aa1803e0 	mov	x0, x24
    b80c:	94000a3d 	bl	e100 <strcpy>
    b810:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    b814:	f0000002 	adrp	x2, e000 <strcat+0x60>
    b818:	9139037b 	add	x27, x27, #0xe40
    b81c:	912d8042 	add	x2, x2, #0xb60
    b820:	5280005c 	mov	w28, #0x2                   	// #2
    b824:	17ffffc5 	b	b738 <__loadlocale+0x2f8>
    b828:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b82c:	aa1803e0 	mov	x0, x24
    b830:	9109e021 	add	x1, x1, #0x278
    b834:	940009bf 	bl	df30 <strcasecmp>
    b838:	35ffef00 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b83c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b840:	aa1803e0 	mov	x0, x24
    b844:	910a0021 	add	x1, x1, #0x280
    b848:	17ffffe2 	b	b7d0 <__loadlocale+0x390>
    b84c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b850:	aa1803e0 	mov	x0, x24
    b854:	91090021 	add	x1, x1, #0x240
    b858:	d2800082 	mov	x2, #0x4                   	// #4
    b85c:	94000ab1 	bl	e320 <strncasecmp>
    b860:	35ffedc0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b864:	394213e0 	ldrb	w0, [sp, #132]
    b868:	394217e1 	ldrb	w1, [sp, #133]
    b86c:	7100b41f 	cmp	w0, #0x2d
    b870:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    b874:	121a7800 	and	w0, w0, #0xffffffdf
    b878:	12001c00 	and	w0, w0, #0xff
    b87c:	7101481f 	cmp	w0, #0x52
    b880:	54001aa0 	b.eq	bbd4 <__loadlocale+0x794>  // b.none
    b884:	7101541f 	cmp	w0, #0x55
    b888:	54ffec81 	b.ne	b618 <__loadlocale+0x1d8>  // b.any
    b88c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b890:	aa1803e0 	mov	x0, x24
    b894:	91094021 	add	x1, x1, #0x250
    b898:	17ffffce 	b	b7d0 <__loadlocale+0x390>
    b89c:	b000003b 	adrp	x27, 10000 <__func__.0+0x10>
    b8a0:	9107c37b 	add	x27, x27, #0x1f0
    b8a4:	aa1b03e1 	mov	x1, x27
    b8a8:	aa1803e0 	mov	x0, x24
    b8ac:	940009a1 	bl	df30 <strcasecmp>
    b8b0:	35ffeb40 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b8b4:	aa1b03e1 	mov	x1, x27
    b8b8:	aa1803e0 	mov	x0, x24
    b8bc:	94000a11 	bl	e100 <strcpy>
    b8c0:	d000001b 	adrp	x27, d000 <__eucjp_mbtowc+0xf0>
    b8c4:	f0000002 	adrp	x2, e000 <strcat+0x60>
    b8c8:	9101037b 	add	x27, x27, #0x40
    b8cc:	91328042 	add	x2, x2, #0xca0
    b8d0:	5280011c 	mov	w28, #0x8                   	// #8
    b8d4:	17ffff99 	b	b738 <__loadlocale+0x2f8>
    b8d8:	b000003b 	adrp	x27, 10000 <__func__.0+0x10>
    b8dc:	9106837b 	add	x27, x27, #0x1a0
    b8e0:	aa1b03e1 	mov	x1, x27
    b8e4:	aa1803e0 	mov	x0, x24
    b8e8:	94000992 	bl	df30 <strcasecmp>
    b8ec:	35ffe960 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b8f0:	aa1b03e1 	mov	x1, x27
    b8f4:	aa1803e0 	mov	x0, x24
    b8f8:	17ffffb6 	b	b7d0 <__loadlocale+0x390>
    b8fc:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b900:	aa1803e0 	mov	x0, x24
    b904:	91096021 	add	x1, x1, #0x258
    b908:	d2800102 	mov	x2, #0x8                   	// #8
    b90c:	94000a85 	bl	e320 <strncasecmp>
    b910:	35ffe840 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b914:	394223e0 	ldrb	w0, [sp, #136]
    b918:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b91c:	9109a021 	add	x1, x1, #0x268
    b920:	7100b41f 	cmp	w0, #0x2d
    b924:	910283e0 	add	x0, sp, #0xa0
    b928:	9a801400 	cinc	x0, x0, eq  // eq = none
    b92c:	d1006000 	sub	x0, x0, #0x18
    b930:	94000980 	bl	df30 <strcasecmp>
    b934:	35ffe720 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b938:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b93c:	aa1803e0 	mov	x0, x24
    b940:	9109c021 	add	x1, x1, #0x270
    b944:	17ffffa3 	b	b7d0 <__loadlocale+0x390>
    b948:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b94c:	aa1803e0 	mov	x0, x24
    b950:	9107e021 	add	x1, x1, #0x1f8
    b954:	d2800062 	mov	x2, #0x3                   	// #3
    b958:	94000a72 	bl	e320 <strncasecmp>
    b95c:	35ffe5e0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b960:	39420fe0 	ldrb	w0, [sp, #131]
    b964:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b968:	91080021 	add	x1, x1, #0x200
    b96c:	7100b41f 	cmp	w0, #0x2d
    b970:	910283e0 	add	x0, sp, #0xa0
    b974:	9a801400 	cinc	x0, x0, eq  // eq = none
    b978:	d1007400 	sub	x0, x0, #0x1d
    b97c:	9400096d 	bl	df30 <strcasecmp>
    b980:	35ffe4c0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b984:	aa1803e0 	mov	x0, x24
    b988:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b98c:	91082021 	add	x1, x1, #0x208
    b990:	940009dc 	bl	e100 <strcpy>
    b994:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    b998:	f0000002 	adrp	x2, e000 <strcat+0x60>
    b99c:	913c437b 	add	x27, x27, #0xf10
    b9a0:	912fc042 	add	x2, x2, #0xbf0
    b9a4:	5280007c 	mov	w28, #0x3                   	// #3
    b9a8:	17ffff64 	b	b738 <__loadlocale+0x2f8>
    b9ac:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b9b0:	aa1803e0 	mov	x0, x24
    b9b4:	91086021 	add	x1, x1, #0x218
    b9b8:	d2800062 	mov	x2, #0x3                   	// #3
    b9bc:	94000a59 	bl	e320 <strncasecmp>
    b9c0:	35ffe2c0 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b9c4:	39420fe0 	ldrb	w0, [sp, #131]
    b9c8:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    b9cc:	d2800082 	mov	x2, #0x4                   	// #4
    b9d0:	91088021 	add	x1, x1, #0x220
    b9d4:	7100b41f 	cmp	w0, #0x2d
    b9d8:	910283e0 	add	x0, sp, #0xa0
    b9dc:	9a80141b 	cinc	x27, x0, eq  // eq = none
    b9e0:	d100777b 	sub	x27, x27, #0x1d
    b9e4:	aa1b03e0 	mov	x0, x27
    b9e8:	94000a4e 	bl	e320 <strncasecmp>
    b9ec:	35ffe160 	cbnz	w0, b618 <__loadlocale+0x1d8>
    b9f0:	39401360 	ldrb	w0, [x27, #4]
    b9f4:	9101e3e1 	add	x1, sp, #0x78
    b9f8:	52800142 	mov	w2, #0xa                   	// #10
    b9fc:	7100b41f 	cmp	w0, #0x2d
    ba00:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    ba04:	91001000 	add	x0, x0, #0x4
    ba08:	94000b16 	bl	e660 <strtol>
    ba0c:	aa0003e3 	mov	x3, x0
    ba10:	d1000400 	sub	x0, x0, #0x1
    ba14:	f90037e3 	str	x3, [sp, #104]
    ba18:	f1003c1f 	cmp	x0, #0xf
    ba1c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    ba20:	54ffdfc0 	b.eq	b618 <__loadlocale+0x1d8>  // b.none
    ba24:	f9403fe0 	ldr	x0, [sp, #120]
    ba28:	39400000 	ldrb	w0, [x0]
    ba2c:	35ffdf60 	cbnz	w0, b618 <__loadlocale+0x1d8>
    ba30:	aa1803e0 	mov	x0, x24
    ba34:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    ba38:	9108a021 	add	x1, x1, #0x228
    ba3c:	940009b1 	bl	e100 <strcpy>
    ba40:	f94037e3 	ldr	x3, [sp, #104]
    ba44:	910227e4 	add	x4, sp, #0x89
    ba48:	f100287f 	cmp	x3, #0xa
    ba4c:	5400008d 	b.le	ba5c <__loadlocale+0x61c>
    ba50:	91022be4 	add	x4, sp, #0x8a
    ba54:	52800620 	mov	w0, #0x31                  	// #49
    ba58:	390227e0 	strb	w0, [sp, #137]
    ba5c:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    ba60:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    ba64:	f28ccce1 	movk	x1, #0x6667
    ba68:	f0000002 	adrp	x2, e000 <strcat+0x60>
    ba6c:	912c837b 	add	x27, x27, #0xb20
    ba70:	9128c042 	add	x2, x2, #0xa30
    ba74:	9b417c61 	smulh	x1, x3, x1
    ba78:	5280003c 	mov	w28, #0x1                   	// #1
    ba7c:	3900049f 	strb	wzr, [x4, #1]
    ba80:	9342fc21 	asr	x1, x1, #2
    ba84:	cb83fc21 	sub	x1, x1, x3, asr #63
    ba88:	8b010821 	add	x1, x1, x1, lsl #2
    ba8c:	cb010460 	sub	x0, x3, x1, lsl #1
    ba90:	1100c000 	add	w0, w0, #0x30
    ba94:	39000080 	strb	w0, [x4]
    ba98:	17ffff28 	b	b738 <__loadlocale+0x2f8>
    ba9c:	aa1803e1 	mov	x1, x24
    baa0:	91058ac0 	add	x0, x22, #0x162
    baa4:	f90037e2 	str	x2, [sp, #104]
    baa8:	94000996 	bl	e100 <strcpy>
    baac:	f94037e2 	ldr	x2, [sp, #104]
    bab0:	a90e6ec2 	stp	x2, x27, [x22, #224]
    bab4:	aa1803e1 	mov	x1, x24
    bab8:	390582dc 	strb	w28, [x22, #352]
    babc:	aa1603e0 	mov	x0, x22
    bac0:	94000cd4 	bl	ee10 <__set_ctype>
    bac4:	35000139 	cbnz	w25, bae8 <__loadlocale+0x6a8>
    bac8:	7100079f 	cmp	w28, #0x1
    bacc:	520002b5 	eor	w21, w21, #0x1
    bad0:	1a9fd7e0 	cset	w0, gt
    bad4:	6a0002bf 	tst	w21, w0
    bad8:	54000080 	b.eq	bae8 <__loadlocale+0x6a8>  // b.none
    badc:	394203e0 	ldrb	w0, [sp, #128]
    bae0:	7101541f 	cmp	w0, #0x55
    bae4:	1a9f07f9 	cset	w25, ne  // ne = any
    bae8:	7100035f 	cmp	w26, #0x0
    baec:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    baf0:	b900f2d9 	str	w25, [x22, #240]
    baf4:	17ffff18 	b	b754 <__loadlocale+0x314>
    baf8:	910006b5 	add	x21, x21, #0x1
    bafc:	17fffee2 	b	b684 <__loadlocale+0x244>
    bb00:	a90573fb 	stp	x27, x28, [sp, #80]
    bb04:	910006bb 	add	x27, x21, #0x1
    bb08:	aa1b03e0 	mov	x0, x27
    bb0c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bb10:	52800019 	mov	w25, #0x0                   	// #0
    bb14:	9106e021 	add	x1, x1, #0x1b8
    bb18:	5280003a 	mov	w26, #0x1                   	// #1
    bb1c:	97fff029 	bl	7bc0 <strcmp>
    bb20:	2a0003f5 	mov	w21, w0
    bb24:	35000060 	cbnz	w0, bb30 <__loadlocale+0x6f0>
    bb28:	a94573fb 	ldp	x27, x28, [sp, #80]
    bb2c:	17fffe8c 	b	b55c <__loadlocale+0x11c>
    bb30:	aa1b03e0 	mov	x0, x27
    bb34:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bb38:	5280001a 	mov	w26, #0x0                   	// #0
    bb3c:	91072021 	add	x1, x1, #0x1c8
    bb40:	52800035 	mov	w21, #0x1                   	// #1
    bb44:	97fff01f 	bl	7bc0 <strcmp>
    bb48:	2a0003f9 	mov	w25, w0
    bb4c:	34fffee0 	cbz	w0, bb28 <__loadlocale+0x6e8>
    bb50:	aa1b03e0 	mov	x0, x27
    bb54:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bb58:	91076021 	add	x1, x1, #0x1d8
    bb5c:	97fff019 	bl	7bc0 <strcmp>
    bb60:	7100001f 	cmp	w0, #0x0
    bb64:	52800015 	mov	w21, #0x0                   	// #0
    bb68:	1a9f17f9 	cset	w25, eq  // eq = none
    bb6c:	a94573fb 	ldp	x27, x28, [sp, #80]
    bb70:	17fffe7b 	b	b55c <__loadlocale+0x11c>
    bb74:	d10d4800 	sub	x0, x0, #0x352
    bb78:	d280003c 	mov	x28, #0x1                   	// #1
    bb7c:	d28234a1 	mov	x1, #0x11a5                	// #4517
    bb80:	f2a00021 	movk	x1, #0x1, lsl #16
    bb84:	9ac02380 	lsl	x0, x28, x0
    bb88:	ea01001f 	tst	x0, x1
    bb8c:	54ffe261 	b.ne	b7d8 <__loadlocale+0x398>  // b.any
    bb90:	a94573fb 	ldp	x27, x28, [sp, #80]
    bb94:	17fffea2 	b	b61c <__loadlocale+0x1dc>
    bb98:	f10da81f 	cmp	x0, #0x36a
    bb9c:	54ffd3e1 	b.ne	b618 <__loadlocale+0x1d8>  // b.any
    bba0:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    bba4:	f0000002 	adrp	x2, e000 <strcat+0x60>
    bba8:	912c837b 	add	x27, x27, #0xb20
    bbac:	9128c042 	add	x2, x2, #0xa30
    bbb0:	5280003c 	mov	w28, #0x1                   	// #1
    bbb4:	17fffee1 	b	b738 <__loadlocale+0x2f8>
    bbb8:	f111941f 	cmp	x0, #0x465
    bbbc:	54ffff20 	b.eq	bba0 <__loadlocale+0x760>  // b.none
    bbc0:	d1138800 	sub	x0, x0, #0x4e2
    bbc4:	f100201f 	cmp	x0, #0x8
    bbc8:	54fffec9 	b.ls	bba0 <__loadlocale+0x760>  // b.plast
    bbcc:	a94573fb 	ldp	x27, x28, [sp, #80]
    bbd0:	17fffe93 	b	b61c <__loadlocale+0x1dc>
    bbd4:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bbd8:	aa1803e0 	mov	x0, x24
    bbdc:	91092021 	add	x1, x1, #0x248
    bbe0:	17fffefc 	b	b7d0 <__loadlocale+0x390>
    bbe4:	b000001b 	adrp	x27, c000 <_setlocale_r.part.0+0x370>
    bbe8:	f0000002 	adrp	x2, e000 <strcat+0x60>
    bbec:	9139037b 	add	x27, x27, #0xe40
    bbf0:	912d8042 	add	x2, x2, #0xb60
    bbf4:	5280005c 	mov	w28, #0x2                   	// #2
    bbf8:	17fffed0 	b	b738 <__loadlocale+0x2f8>
    bbfc:	d503201f 	nop

000000000000bc00 <__get_locale_env>:
    bc00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bc04:	910003fd 	mov	x29, sp
    bc08:	a90153f3 	stp	x19, x20, [sp, #16]
    bc0c:	2a0103f4 	mov	w20, w1
    bc10:	aa0003f3 	mov	x19, x0
    bc14:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bc18:	910c4021 	add	x1, x1, #0x310
    bc1c:	94000d3d 	bl	f110 <_getenv_r>
    bc20:	b4000060 	cbz	x0, bc2c <__get_locale_env+0x2c>
    bc24:	39400001 	ldrb	w1, [x0]
    bc28:	35000201 	cbnz	w1, bc68 <__get_locale_env+0x68>
    bc2c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bc30:	91148021 	add	x1, x1, #0x520
    bc34:	aa1303e0 	mov	x0, x19
    bc38:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    bc3c:	94000d35 	bl	f110 <_getenv_r>
    bc40:	b4000060 	cbz	x0, bc4c <__get_locale_env+0x4c>
    bc44:	39400001 	ldrb	w1, [x0]
    bc48:	35000101 	cbnz	w1, bc68 <__get_locale_env+0x68>
    bc4c:	b0000021 	adrp	x1, 10000 <__func__.0+0x10>
    bc50:	aa1303e0 	mov	x0, x19
    bc54:	910c6021 	add	x1, x1, #0x318
    bc58:	94000d2e 	bl	f110 <_getenv_r>
    bc5c:	b50000c0 	cbnz	x0, bc74 <__get_locale_env+0x74>
    bc60:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    bc64:	91398000 	add	x0, x0, #0xe60
    bc68:	a94153f3 	ldp	x19, x20, [sp, #16]
    bc6c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bc70:	d65f03c0 	ret
    bc74:	39400001 	ldrb	w1, [x0]
    bc78:	35ffff81 	cbnz	w1, bc68 <__get_locale_env+0x68>
    bc7c:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    bc80:	91398000 	add	x0, x0, #0xe60
    bc84:	17fffff9 	b	bc68 <__get_locale_env+0x68>
    bc88:	d503201f 	nop
    bc8c:	d503201f 	nop

000000000000bc90 <_setlocale_r.part.0>:
    bc90:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    bc94:	910003fd 	mov	x29, sp
    bc98:	a9025bf5 	stp	x21, x22, [sp, #32]
    bc9c:	d0000035 	adrp	x21, 11000 <__global_locale+0x180>
    bca0:	b0000036 	adrp	x22, 10000 <__func__.0+0x10>
    bca4:	9135e2b5 	add	x21, x21, #0xd78
    bca8:	913a02d6 	add	x22, x22, #0xe80
    bcac:	a90153f3 	stp	x19, x20, [sp, #16]
    bcb0:	910082d4 	add	x20, x22, #0x20
    bcb4:	a9046bf9 	stp	x25, x26, [sp, #64]
    bcb8:	910082b9 	add	x25, x21, #0x20
    bcbc:	aa0003fa 	mov	x26, x0
    bcc0:	aa1903f3 	mov	x19, x25
    bcc4:	a90363f7 	stp	x23, x24, [sp, #48]
    bcc8:	aa0203f8 	mov	x24, x2
    bccc:	910382b7 	add	x23, x21, #0xe0
    bcd0:	a90573fb 	stp	x27, x28, [sp, #80]
    bcd4:	2a0103fc 	mov	w28, w1
    bcd8:	aa1403fb 	mov	x27, x20
    bcdc:	d503201f 	nop
    bce0:	aa1b03e1 	mov	x1, x27
    bce4:	aa1303e0 	mov	x0, x19
    bce8:	91008273 	add	x19, x19, #0x20
    bcec:	94000905 	bl	e100 <strcpy>
    bcf0:	9100837b 	add	x27, x27, #0x20
    bcf4:	eb17027f 	cmp	x19, x23
    bcf8:	54ffff41 	b.ne	bce0 <_setlocale_r.part.0+0x50>  // b.any
    bcfc:	39400300 	ldrb	w0, [x24]
    bd00:	350005e0 	cbnz	w0, bdbc <_setlocale_r.part.0+0x12c>
    bd04:	35000edc 	cbnz	w28, bedc <_setlocale_r.part.0+0x24c>
    bd08:	aa1903f7 	mov	x23, x25
    bd0c:	52800033 	mov	w19, #0x1                   	// #1
    bd10:	2a1303e1 	mov	w1, w19
    bd14:	aa1a03e0 	mov	x0, x26
    bd18:	97ffffba 	bl	bc00 <__get_locale_env>
    bd1c:	aa0003f5 	mov	x21, x0
    bd20:	11000673 	add	w19, w19, #0x1
    bd24:	97ffefe7 	bl	7cc0 <strlen>
    bd28:	aa0003e2 	mov	x2, x0
    bd2c:	aa1503e1 	mov	x1, x21
    bd30:	aa1703e0 	mov	x0, x23
    bd34:	f1007c5f 	cmp	x2, #0x1f
    bd38:	54000be8 	b.hi	beb4 <_setlocale_r.part.0+0x224>  // b.pmore
    bd3c:	910082f7 	add	x23, x23, #0x20
    bd40:	940008f0 	bl	e100 <strcpy>
    bd44:	71001e7f 	cmp	w19, #0x7
    bd48:	54fffe41 	b.ne	bd10 <_setlocale_r.part.0+0x80>  // b.any
    bd4c:	d0000038 	adrp	x24, 11000 <__global_locale+0x180>
    bd50:	91396318 	add	x24, x24, #0xe58
    bd54:	91008318 	add	x24, x24, #0x20
    bd58:	aa1903f7 	mov	x23, x25
    bd5c:	aa1803f5 	mov	x21, x24
    bd60:	52800033 	mov	w19, #0x1                   	// #1
    bd64:	d503201f 	nop
    bd68:	aa1403e1 	mov	x1, x20
    bd6c:	aa1503e0 	mov	x0, x21
    bd70:	940008e4 	bl	e100 <strcpy>
    bd74:	aa1703e2 	mov	x2, x23
    bd78:	2a1303e1 	mov	w1, w19
    bd7c:	aa1603e0 	mov	x0, x22
    bd80:	97fffdb0 	bl	b440 <__loadlocale>
    bd84:	b4000c60 	cbz	x0, bf10 <_setlocale_r.part.0+0x280>
    bd88:	11000673 	add	w19, w19, #0x1
    bd8c:	910082b5 	add	x21, x21, #0x20
    bd90:	91008294 	add	x20, x20, #0x20
    bd94:	910082f7 	add	x23, x23, #0x20
    bd98:	71001e7f 	cmp	w19, #0x7
    bd9c:	54fffe61 	b.ne	bd68 <_setlocale_r.part.0+0xd8>  // b.any
    bda0:	a94153f3 	ldp	x19, x20, [sp, #16]
    bda4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bda8:	a94363f7 	ldp	x23, x24, [sp, #48]
    bdac:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bdb0:	a94573fb 	ldp	x27, x28, [sp, #80]
    bdb4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bdb8:	17fffd72 	b	b380 <currentlocale>
    bdbc:	3500057c 	cbnz	w28, be68 <_setlocale_r.part.0+0x1d8>
    bdc0:	aa1803e0 	mov	x0, x24
    bdc4:	528005e1 	mov	w1, #0x2f                  	// #47
    bdc8:	94000893 	bl	e014 <strchr>
    bdcc:	aa0003f3 	mov	x19, x0
    bdd0:	b5000060 	cbnz	x0, bddc <_setlocale_r.part.0+0x14c>
    bdd4:	14000085 	b	bfe8 <_setlocale_r.part.0+0x358>
    bdd8:	91000673 	add	x19, x19, #0x1
    bddc:	39400660 	ldrb	w0, [x19, #1]
    bde0:	7100bc1f 	cmp	w0, #0x2f
    bde4:	54ffffa0 	b.eq	bdd8 <_setlocale_r.part.0+0x148>  // b.none
    bde8:	34000660 	cbz	w0, beb4 <_setlocale_r.part.0+0x224>
    bdec:	aa1903fb 	mov	x27, x25
    bdf0:	52800037 	mov	w23, #0x1                   	// #1
    bdf4:	cb180262 	sub	x2, x19, x24
    bdf8:	71007c5f 	cmp	w2, #0x1f
    bdfc:	540005cc 	b.gt	beb4 <_setlocale_r.part.0+0x224>
    be00:	11000442 	add	w2, w2, #0x1
    be04:	aa1803e1 	mov	x1, x24
    be08:	aa1b03e0 	mov	x0, x27
    be0c:	110006f7 	add	w23, w23, #0x1
    be10:	93407c42 	sxtw	x2, w2
    be14:	9400092b 	bl	e2c0 <strlcpy>
    be18:	39400260 	ldrb	w0, [x19]
    be1c:	7100bc1f 	cmp	w0, #0x2f
    be20:	540000a1 	b.ne	be34 <_setlocale_r.part.0+0x1a4>  // b.any
    be24:	d503201f 	nop
    be28:	38401e60 	ldrb	w0, [x19, #1]!
    be2c:	7100bc1f 	cmp	w0, #0x2f
    be30:	54ffffc0 	b.eq	be28 <_setlocale_r.part.0+0x198>  // b.none
    be34:	34000c00 	cbz	w0, bfb4 <_setlocale_r.part.0+0x324>
    be38:	aa1303e1 	mov	x1, x19
    be3c:	d503201f 	nop
    be40:	38401c20 	ldrb	w0, [x1, #1]!
    be44:	7100bc1f 	cmp	w0, #0x2f
    be48:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    be4c:	54ffffa1 	b.ne	be40 <_setlocale_r.part.0+0x1b0>  // b.any
    be50:	9100837b 	add	x27, x27, #0x20
    be54:	71001eff 	cmp	w23, #0x7
    be58:	54fff7a0 	b.eq	bd4c <_setlocale_r.part.0+0xbc>  // b.none
    be5c:	aa1303f8 	mov	x24, x19
    be60:	aa0103f3 	mov	x19, x1
    be64:	17ffffe4 	b	bdf4 <_setlocale_r.part.0+0x164>
    be68:	aa1803e0 	mov	x0, x24
    be6c:	97ffef95 	bl	7cc0 <strlen>
    be70:	f1007c1f 	cmp	x0, #0x1f
    be74:	54000208 	b.hi	beb4 <_setlocale_r.part.0+0x224>  // b.pmore
    be78:	937b7f80 	sbfiz	x0, x28, #5, #32
    be7c:	aa1803e1 	mov	x1, x24
    be80:	8b0002b5 	add	x21, x21, x0
    be84:	aa1503e0 	mov	x0, x21
    be88:	9400089e 	bl	e100 <strcpy>
    be8c:	aa1503e2 	mov	x2, x21
    be90:	2a1c03e1 	mov	w1, w28
    be94:	aa1603e0 	mov	x0, x22
    be98:	a94153f3 	ldp	x19, x20, [sp, #16]
    be9c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bea0:	a94363f7 	ldp	x23, x24, [sp, #48]
    bea4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bea8:	a94573fb 	ldp	x27, x28, [sp, #80]
    beac:	a8c67bfd 	ldp	x29, x30, [sp], #96
    beb0:	17fffd64 	b	b440 <__loadlocale>
    beb4:	528002c0 	mov	w0, #0x16                  	// #22
    beb8:	b9000340 	str	w0, [x26]
    bebc:	d2800000 	mov	x0, #0x0                   	// #0
    bec0:	a94153f3 	ldp	x19, x20, [sp, #16]
    bec4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bec8:	a94363f7 	ldp	x23, x24, [sp, #48]
    becc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bed0:	a94573fb 	ldp	x27, x28, [sp, #80]
    bed4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bed8:	d65f03c0 	ret
    bedc:	2a1c03e1 	mov	w1, w28
    bee0:	aa1a03e0 	mov	x0, x26
    bee4:	97ffff47 	bl	bc00 <__get_locale_env>
    bee8:	aa0003f3 	mov	x19, x0
    beec:	97ffef75 	bl	7cc0 <strlen>
    bef0:	f1007c1f 	cmp	x0, #0x1f
    bef4:	54fffe08 	b.hi	beb4 <_setlocale_r.part.0+0x224>  // b.pmore
    bef8:	937b7f80 	sbfiz	x0, x28, #5, #32
    befc:	aa1303e1 	mov	x1, x19
    bf00:	8b0002b5 	add	x21, x21, x0
    bf04:	aa1503e0 	mov	x0, x21
    bf08:	9400087e 	bl	e100 <strcpy>
    bf0c:	17ffffe0 	b	be8c <_setlocale_r.part.0+0x1fc>
    bf10:	b0000020 	adrp	x0, 10000 <__func__.0+0x10>
    bf14:	b9400357 	ldr	w23, [x26]
    bf18:	91066015 	add	x21, x0, #0x198
    bf1c:	52800034 	mov	w20, #0x1                   	// #1
    bf20:	6b14027f 	cmp	w19, w20
    bf24:	540000e1 	b.ne	bf40 <_setlocale_r.part.0+0x2b0>  // b.any
    bf28:	1400001a 	b	bf90 <_setlocale_r.part.0+0x300>
    bf2c:	11000694 	add	w20, w20, #0x1
    bf30:	91008339 	add	x25, x25, #0x20
    bf34:	91008318 	add	x24, x24, #0x20
    bf38:	6b14027f 	cmp	w19, w20
    bf3c:	540002a0 	b.eq	bf90 <_setlocale_r.part.0+0x300>  // b.none
    bf40:	aa1803e1 	mov	x1, x24
    bf44:	aa1903e0 	mov	x0, x25
    bf48:	9400086e 	bl	e100 <strcpy>
    bf4c:	aa1903e2 	mov	x2, x25
    bf50:	2a1403e1 	mov	w1, w20
    bf54:	aa1603e0 	mov	x0, x22
    bf58:	97fffd3a 	bl	b440 <__loadlocale>
    bf5c:	b5fffe80 	cbnz	x0, bf2c <_setlocale_r.part.0+0x29c>
    bf60:	aa1503e1 	mov	x1, x21
    bf64:	aa1903e0 	mov	x0, x25
    bf68:	94000866 	bl	e100 <strcpy>
    bf6c:	91008318 	add	x24, x24, #0x20
    bf70:	aa1903e2 	mov	x2, x25
    bf74:	2a1403e1 	mov	w1, w20
    bf78:	aa1603e0 	mov	x0, x22
    bf7c:	11000694 	add	w20, w20, #0x1
    bf80:	97fffd30 	bl	b440 <__loadlocale>
    bf84:	91008339 	add	x25, x25, #0x20
    bf88:	6b14027f 	cmp	w19, w20
    bf8c:	54fffda1 	b.ne	bf40 <_setlocale_r.part.0+0x2b0>  // b.any
    bf90:	b9000357 	str	w23, [x26]
    bf94:	d2800000 	mov	x0, #0x0                   	// #0
    bf98:	a94153f3 	ldp	x19, x20, [sp, #16]
    bf9c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bfa0:	a94363f7 	ldp	x23, x24, [sp, #48]
    bfa4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bfa8:	a94573fb 	ldp	x27, x28, [sp, #80]
    bfac:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bfb0:	d65f03c0 	ret
    bfb4:	71001eff 	cmp	w23, #0x7
    bfb8:	54ffeca0 	b.eq	bd4c <_setlocale_r.part.0+0xbc>  // b.none
    bfbc:	937b7ee0 	sbfiz	x0, x23, #5, #32
    bfc0:	8b0002b5 	add	x21, x21, x0
    bfc4:	d503201f 	nop
    bfc8:	d10082a1 	sub	x1, x21, #0x20
    bfcc:	aa1503e0 	mov	x0, x21
    bfd0:	110006f7 	add	w23, w23, #0x1
    bfd4:	9400084b 	bl	e100 <strcpy>
    bfd8:	910082b5 	add	x21, x21, #0x20
    bfdc:	71001eff 	cmp	w23, #0x7
    bfe0:	54ffff41 	b.ne	bfc8 <_setlocale_r.part.0+0x338>  // b.any
    bfe4:	17ffff5a 	b	bd4c <_setlocale_r.part.0+0xbc>
    bfe8:	aa1803e0 	mov	x0, x24
    bfec:	97ffef35 	bl	7cc0 <strlen>
    bff0:	f1007c1f 	cmp	x0, #0x1f
    bff4:	54fff608 	b.hi	beb4 <_setlocale_r.part.0+0x224>  // b.pmore
    bff8:	aa1903f3 	mov	x19, x25
    bffc:	d503201f 	nop
    c000:	aa1303e0 	mov	x0, x19
    c004:	aa1803e1 	mov	x1, x24
    c008:	91008273 	add	x19, x19, #0x20
    c00c:	9400083d 	bl	e100 <strcpy>
    c010:	eb1302ff 	cmp	x23, x19
    c014:	54ffff61 	b.ne	c000 <_setlocale_r.part.0+0x370>  // b.any
    c018:	17ffff4d 	b	bd4c <_setlocale_r.part.0+0xbc>
    c01c:	d503201f 	nop

000000000000c020 <_setlocale_r>:
    c020:	aa0003e5 	mov	x5, x0
    c024:	7100183f 	cmp	w1, #0x6
    c028:	54000068 	b.hi	c034 <_setlocale_r+0x14>  // b.pmore
    c02c:	b40000c2 	cbz	x2, c044 <_setlocale_r+0x24>
    c030:	17ffff18 	b	bc90 <_setlocale_r.part.0>
    c034:	528002c1 	mov	w1, #0x16                  	// #22
    c038:	d2800000 	mov	x0, #0x0                   	// #0
    c03c:	b90000a1 	str	w1, [x5]
    c040:	d65f03c0 	ret
    c044:	340000c1 	cbz	w1, c05c <_setlocale_r+0x3c>
    c048:	937b7c23 	sbfiz	x3, x1, #5, #32
    c04c:	90000020 	adrp	x0, 10000 <__func__.0+0x10>
    c050:	913a0000 	add	x0, x0, #0xe80
    c054:	8b030000 	add	x0, x0, x3
    c058:	d65f03c0 	ret
    c05c:	17fffcc9 	b	b380 <currentlocale>

000000000000c060 <__locale_mb_cur_max>:
    c060:	90000020 	adrp	x0, 10000 <__func__.0+0x10>
    c064:	397f8000 	ldrb	w0, [x0, #4064]
    c068:	d65f03c0 	ret
    c06c:	d503201f 	nop

000000000000c070 <setlocale>:
    c070:	90000024 	adrp	x4, 10000 <__func__.0+0x10>
    c074:	2a0003e3 	mov	w3, w0
    c078:	aa0103e2 	mov	x2, x1
    c07c:	f9438880 	ldr	x0, [x4, #1808]
    c080:	7100187f 	cmp	w3, #0x6
    c084:	54000088 	b.hi	c094 <setlocale+0x24>  // b.pmore
    c088:	b4000101 	cbz	x1, c0a8 <setlocale+0x38>
    c08c:	2a0303e1 	mov	w1, w3
    c090:	17ffff00 	b	bc90 <_setlocale_r.part.0>
    c094:	528002c1 	mov	w1, #0x16                  	// #22
    c098:	d2800003 	mov	x3, #0x0                   	// #0
    c09c:	b9000001 	str	w1, [x0]
    c0a0:	aa0303e0 	mov	x0, x3
    c0a4:	d65f03c0 	ret
    c0a8:	340000e3 	cbz	w3, c0c4 <setlocale+0x54>
    c0ac:	937b7c63 	sbfiz	x3, x3, #5, #32
    c0b0:	90000020 	adrp	x0, 10000 <__func__.0+0x10>
    c0b4:	913a0000 	add	x0, x0, #0xe80
    c0b8:	8b030003 	add	x3, x0, x3
    c0bc:	aa0303e0 	mov	x0, x3
    c0c0:	d65f03c0 	ret
    c0c4:	17fffcaf 	b	b380 <currentlocale>
    c0c8:	d503201f 	nop
    c0cc:	d503201f 	nop

000000000000c0d0 <__smakebuf_r>:
    c0d0:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    c0d4:	910003fd 	mov	x29, sp
    c0d8:	79402022 	ldrh	w2, [x1, #16]
    c0dc:	a90153f3 	stp	x19, x20, [sp, #16]
    c0e0:	aa0103f3 	mov	x19, x1
    c0e4:	36080122 	tbz	w2, #1, c108 <__smakebuf_r+0x38>
    c0e8:	9101dc20 	add	x0, x1, #0x77
    c0ec:	52800021 	mov	w1, #0x1                   	// #1
    c0f0:	f9000260 	str	x0, [x19]
    c0f4:	f9000e60 	str	x0, [x19, #24]
    c0f8:	b9002261 	str	w1, [x19, #32]
    c0fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    c100:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    c104:	d65f03c0 	ret
    c108:	79c02421 	ldrsh	w1, [x1, #18]
    c10c:	aa0003f4 	mov	x20, x0
    c110:	a9025bf5 	stp	x21, x22, [sp, #32]
    c114:	f9001bf7 	str	x23, [sp, #48]
    c118:	37f80381 	tbnz	w1, #31, c188 <__smakebuf_r+0xb8>
    c11c:	910123e2 	add	x2, sp, #0x48
    c120:	94000ba8 	bl	efc0 <_fstat_r>
    c124:	37f80300 	tbnz	w0, #31, c184 <__smakebuf_r+0xb4>
    c128:	b9404fe0 	ldr	w0, [sp, #76]
    c12c:	d2808016 	mov	x22, #0x400                 	// #1024
    c130:	52810015 	mov	w21, #0x800                 	// #2048
    c134:	aa1603e1 	mov	x1, x22
    c138:	12140c00 	and	w0, w0, #0xf000
    c13c:	7140081f 	cmp	w0, #0x2, lsl #12
    c140:	aa1403e0 	mov	x0, x20
    c144:	1a9f17f7 	cset	w23, eq  // eq = none
    c148:	94000066 	bl	c2e0 <_malloc_r>
    c14c:	b5000320 	cbnz	x0, c1b0 <__smakebuf_r+0xe0>
    c150:	79c02260 	ldrsh	w0, [x19, #16]
    c154:	374805c0 	tbnz	w0, #9, c20c <__smakebuf_r+0x13c>
    c158:	121e7400 	and	w0, w0, #0xfffffffc
    c15c:	9101de61 	add	x1, x19, #0x77
    c160:	321f0000 	orr	w0, w0, #0x2
    c164:	52800022 	mov	w2, #0x1                   	// #1
    c168:	79002260 	strh	w0, [x19, #16]
    c16c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c170:	f9401bf7 	ldr	x23, [sp, #48]
    c174:	f9000261 	str	x1, [x19]
    c178:	f9000e61 	str	x1, [x19, #24]
    c17c:	b9002262 	str	w2, [x19, #32]
    c180:	17ffffdf 	b	c0fc <__smakebuf_r+0x2c>
    c184:	79402262 	ldrh	w2, [x19, #16]
    c188:	f279005f 	tst	x2, #0x80
    c18c:	d2808001 	mov	x1, #0x400                 	// #1024
    c190:	d2800816 	mov	x22, #0x40                  	// #64
    c194:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    c198:	aa1603e1 	mov	x1, x22
    c19c:	aa1403e0 	mov	x0, x20
    c1a0:	52800017 	mov	w23, #0x0                   	// #0
    c1a4:	52800015 	mov	w21, #0x0                   	// #0
    c1a8:	9400004e 	bl	c2e0 <_malloc_r>
    c1ac:	b4fffd20 	cbz	x0, c150 <__smakebuf_r+0x80>
    c1b0:	79c02262 	ldrsh	w2, [x19, #16]
    c1b4:	d0ffffe1 	adrp	x1, a000 <__swsetup_r+0x140>
    c1b8:	910fc021 	add	x1, x1, #0x3f0
    c1bc:	f9002e81 	str	x1, [x20, #88]
    c1c0:	32190042 	orr	w2, w2, #0x80
    c1c4:	f9000260 	str	x0, [x19]
    c1c8:	79002262 	strh	w2, [x19, #16]
    c1cc:	f9000e60 	str	x0, [x19, #24]
    c1d0:	b9002276 	str	w22, [x19, #32]
    c1d4:	35000117 	cbnz	w23, c1f4 <__smakebuf_r+0x124>
    c1d8:	2a150042 	orr	w2, w2, w21
    c1dc:	79002262 	strh	w2, [x19, #16]
    c1e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    c1e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c1e8:	f9401bf7 	ldr	x23, [sp, #48]
    c1ec:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    c1f0:	d65f03c0 	ret
    c1f4:	79c02661 	ldrsh	w1, [x19, #18]
    c1f8:	aa1403e0 	mov	x0, x20
    c1fc:	94000bcd 	bl	f130 <_isatty_r>
    c200:	350000c0 	cbnz	w0, c218 <__smakebuf_r+0x148>
    c204:	79c02262 	ldrsh	w2, [x19, #16]
    c208:	17fffff4 	b	c1d8 <__smakebuf_r+0x108>
    c20c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c210:	f9401bf7 	ldr	x23, [sp, #48]
    c214:	17ffffba 	b	c0fc <__smakebuf_r+0x2c>
    c218:	79402262 	ldrh	w2, [x19, #16]
    c21c:	121e7442 	and	w2, w2, #0xfffffffc
    c220:	32000042 	orr	w2, w2, #0x1
    c224:	13003c42 	sxth	w2, w2
    c228:	17ffffec 	b	c1d8 <__smakebuf_r+0x108>
    c22c:	d503201f 	nop

000000000000c230 <__swhatbuf_r>:
    c230:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    c234:	910003fd 	mov	x29, sp
    c238:	a90153f3 	stp	x19, x20, [sp, #16]
    c23c:	aa0103f3 	mov	x19, x1
    c240:	79c02421 	ldrsh	w1, [x1, #18]
    c244:	f90013f5 	str	x21, [sp, #32]
    c248:	aa0203f4 	mov	x20, x2
    c24c:	aa0303f5 	mov	x21, x3
    c250:	37f80201 	tbnz	w1, #31, c290 <__swhatbuf_r+0x60>
    c254:	9100e3e2 	add	x2, sp, #0x38
    c258:	94000b5a 	bl	efc0 <_fstat_r>
    c25c:	37f801a0 	tbnz	w0, #31, c290 <__swhatbuf_r+0x60>
    c260:	b9403fe1 	ldr	w1, [sp, #60]
    c264:	d2808002 	mov	x2, #0x400                 	// #1024
    c268:	52810000 	mov	w0, #0x800                 	// #2048
    c26c:	12140c21 	and	w1, w1, #0xf000
    c270:	7140083f 	cmp	w1, #0x2, lsl #12
    c274:	1a9f17e1 	cset	w1, eq  // eq = none
    c278:	b90002a1 	str	w1, [x21]
    c27c:	f9000282 	str	x2, [x20]
    c280:	a94153f3 	ldp	x19, x20, [sp, #16]
    c284:	f94013f5 	ldr	x21, [sp, #32]
    c288:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    c28c:	d65f03c0 	ret
    c290:	79c02260 	ldrsh	w0, [x19, #16]
    c294:	b90002bf 	str	wzr, [x21]
    c298:	36380100 	tbz	w0, #7, c2b8 <__swhatbuf_r+0x88>
    c29c:	d2800801 	mov	x1, #0x40                  	// #64
    c2a0:	f9000281 	str	x1, [x20]
    c2a4:	52800000 	mov	w0, #0x0                   	// #0
    c2a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    c2ac:	f94013f5 	ldr	x21, [sp, #32]
    c2b0:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    c2b4:	d65f03c0 	ret
    c2b8:	d2808001 	mov	x1, #0x400                 	// #1024
    c2bc:	f9000281 	str	x1, [x20]
    c2c0:	52800000 	mov	w0, #0x0                   	// #0
    c2c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    c2c8:	f94013f5 	ldr	x21, [sp, #32]
    c2cc:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    c2d0:	d65f03c0 	ret
    c2d4:	d503201f 	nop
    c2d8:	d503201f 	nop
    c2dc:	d503201f 	nop

000000000000c2e0 <_malloc_r>:
    c2e0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    c2e4:	910003fd 	mov	x29, sp
    c2e8:	a90153f3 	stp	x19, x20, [sp, #16]
    c2ec:	91005c33 	add	x19, x1, #0x17
    c2f0:	a9025bf5 	stp	x21, x22, [sp, #32]
    c2f4:	aa0003f5 	mov	x21, x0
    c2f8:	a90363f7 	stp	x23, x24, [sp, #48]
    c2fc:	f100ba7f 	cmp	x19, #0x2e
    c300:	54000c88 	b.hi	c490 <_malloc_r+0x1b0>  // b.pmore
    c304:	f100803f 	cmp	x1, #0x20
    c308:	54002068 	b.hi	c714 <_malloc_r+0x434>  // b.pmore
    c30c:	940003fd 	bl	d300 <__malloc_lock>
    c310:	d2800413 	mov	x19, #0x20                  	// #32
    c314:	d2800a00 	mov	x0, #0x50                  	// #80
    c318:	52800085 	mov	w5, #0x4                   	// #4
    c31c:	b0000034 	adrp	x20, 11000 <__global_locale+0x180>
    c320:	9100a294 	add	x20, x20, #0x28
    c324:	8b000280 	add	x0, x20, x0
    c328:	110008a5 	add	w5, w5, #0x2
    c32c:	d1004000 	sub	x0, x0, #0x10
    c330:	f9400c01 	ldr	x1, [x0, #24]
    c334:	eb00003f 	cmp	x1, x0
    c338:	54002181 	b.ne	c768 <_malloc_r+0x488>  // b.any
    c33c:	f9401284 	ldr	x4, [x20, #32]
    c340:	91004282 	add	x2, x20, #0x10
    c344:	eb02009f 	cmp	x4, x2
    c348:	54000f20 	b.eq	c52c <_malloc_r+0x24c>  // b.none
    c34c:	f9400481 	ldr	x1, [x4, #8]
    c350:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    c354:	cb130023 	sub	x3, x1, x19
    c358:	f1007c7f 	cmp	x3, #0x1f
    c35c:	54002d4c 	b.gt	c904 <_malloc_r+0x624>
    c360:	a9020a82 	stp	x2, x2, [x20, #32]
    c364:	b6f81f23 	tbz	x3, #63, c748 <_malloc_r+0x468>
    c368:	f107fc3f 	cmp	x1, #0x1ff
    c36c:	54002428 	b.hi	c7f0 <_malloc_r+0x510>  // b.pmore
    c370:	d343fc22 	lsr	x2, x1, #3
    c374:	d2800021 	mov	x1, #0x1                   	// #1
    c378:	11000440 	add	w0, w2, #0x1
    c37c:	13027c42 	asr	w2, w2, #2
    c380:	531f7800 	lsl	w0, w0, #1
    c384:	f9400683 	ldr	x3, [x20, #8]
    c388:	8b20ce80 	add	x0, x20, w0, sxtw #3
    c38c:	9ac22021 	lsl	x1, x1, x2
    c390:	aa030021 	orr	x1, x1, x3
    c394:	f85f0402 	ldr	x2, [x0], #-16
    c398:	f9000681 	str	x1, [x20, #8]
    c39c:	a9010082 	stp	x2, x0, [x4, #16]
    c3a0:	f9000804 	str	x4, [x0, #16]
    c3a4:	f9000c44 	str	x4, [x2, #24]
    c3a8:	13027ca2 	asr	w2, w5, #2
    c3ac:	d2800020 	mov	x0, #0x1                   	// #1
    c3b0:	9ac22000 	lsl	x0, x0, x2
    c3b4:	eb01001f 	cmp	x0, x1
    c3b8:	54000c68 	b.hi	c544 <_malloc_r+0x264>  // b.pmore
    c3bc:	ea01001f 	tst	x0, x1
    c3c0:	540000c1 	b.ne	c3d8 <_malloc_r+0xf8>  // b.any
    c3c4:	121e74a5 	and	w5, w5, #0xfffffffc
    c3c8:	d37ff800 	lsl	x0, x0, #1
    c3cc:	110010a5 	add	w5, w5, #0x4
    c3d0:	ea01001f 	tst	x0, x1
    c3d4:	54ffffa0 	b.eq	c3c8 <_malloc_r+0xe8>  // b.none
    c3d8:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    c3dc:	110004a7 	add	w7, w5, #0x1
    c3e0:	2a0503e8 	mov	w8, w5
    c3e4:	531f78e7 	lsl	w7, w7, #1
    c3e8:	8b27cd27 	add	x7, x9, w7, sxtw #3
    c3ec:	8b070287 	add	x7, x20, x7
    c3f0:	aa0703e4 	mov	x4, x7
    c3f4:	f9400c81 	ldr	x1, [x4, #24]
    c3f8:	14000009 	b	c41c <_malloc_r+0x13c>
    c3fc:	f9400422 	ldr	x2, [x1, #8]
    c400:	aa0103e6 	mov	x6, x1
    c404:	f9400c21 	ldr	x1, [x1, #24]
    c408:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    c40c:	cb130043 	sub	x3, x2, x19
    c410:	f1007c7f 	cmp	x3, #0x1f
    c414:	5400238c 	b.gt	c884 <_malloc_r+0x5a4>
    c418:	b6f82563 	tbz	x3, #63, c8c4 <_malloc_r+0x5e4>
    c41c:	eb01009f 	cmp	x4, x1
    c420:	54fffee1 	b.ne	c3fc <_malloc_r+0x11c>  // b.any
    c424:	7100f91f 	cmp	w8, #0x3e
    c428:	540029cd 	b.le	c960 <_malloc_r+0x680>
    c42c:	91004084 	add	x4, x4, #0x10
    c430:	11000508 	add	w8, w8, #0x1
    c434:	f240051f 	tst	x8, #0x3
    c438:	54fffde1 	b.ne	c3f4 <_malloc_r+0x114>  // b.any
    c43c:	14000005 	b	c450 <_malloc_r+0x170>
    c440:	f85f04e1 	ldr	x1, [x7], #-16
    c444:	510004a5 	sub	w5, w5, #0x1
    c448:	eb07003f 	cmp	x1, x7
    c44c:	540035a1 	b.ne	cb00 <_malloc_r+0x820>  // b.any
    c450:	f24004bf 	tst	x5, #0x3
    c454:	54ffff61 	b.ne	c440 <_malloc_r+0x160>  // b.any
    c458:	f9400681 	ldr	x1, [x20, #8]
    c45c:	8a200021 	bic	x1, x1, x0
    c460:	f9000681 	str	x1, [x20, #8]
    c464:	d37ff800 	lsl	x0, x0, #1
    c468:	f100001f 	cmp	x0, #0x0
    c46c:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    c470:	54000089 	b.ls	c480 <_malloc_r+0x1a0>  // b.plast
    c474:	14000034 	b	c544 <_malloc_r+0x264>
    c478:	d37ff800 	lsl	x0, x0, #1
    c47c:	11001108 	add	w8, w8, #0x4
    c480:	ea01001f 	tst	x0, x1
    c484:	54ffffa0 	b.eq	c478 <_malloc_r+0x198>  // b.none
    c488:	2a0803e5 	mov	w5, w8
    c48c:	17ffffd4 	b	c3dc <_malloc_r+0xfc>
    c490:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    c494:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    c498:	eb02027f 	cmp	x19, x2
    c49c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    c4a0:	540013a8 	b.hi	c714 <_malloc_r+0x434>  // b.pmore
    c4a4:	94000397 	bl	d300 <__malloc_lock>
    c4a8:	f107de7f 	cmp	x19, #0x1f7
    c4ac:	54002229 	b.ls	c8f0 <_malloc_r+0x610>  // b.plast
    c4b0:	d349fe60 	lsr	x0, x19, #9
    c4b4:	b4001420 	cbz	x0, c738 <_malloc_r+0x458>
    c4b8:	f100101f 	cmp	x0, #0x4
    c4bc:	54001d08 	b.hi	c85c <_malloc_r+0x57c>  // b.pmore
    c4c0:	d346fe60 	lsr	x0, x19, #6
    c4c4:	1100e405 	add	w5, w0, #0x39
    c4c8:	1100e000 	add	w0, w0, #0x38
    c4cc:	531f78a4 	lsl	w4, w5, #1
    c4d0:	937d7c84 	sbfiz	x4, x4, #3, #32
    c4d4:	b0000034 	adrp	x20, 11000 <__global_locale+0x180>
    c4d8:	9100a294 	add	x20, x20, #0x28
    c4dc:	8b040284 	add	x4, x20, x4
    c4e0:	d1004084 	sub	x4, x4, #0x10
    c4e4:	f9400c81 	ldr	x1, [x4, #24]
    c4e8:	eb01009f 	cmp	x4, x1
    c4ec:	540000c1 	b.ne	c504 <_malloc_r+0x224>  // b.any
    c4f0:	17ffff93 	b	c33c <_malloc_r+0x5c>
    c4f4:	b6f815e3 	tbz	x3, #63, c7b0 <_malloc_r+0x4d0>
    c4f8:	f9400c21 	ldr	x1, [x1, #24]
    c4fc:	eb01009f 	cmp	x4, x1
    c500:	54fff1e0 	b.eq	c33c <_malloc_r+0x5c>  // b.none
    c504:	f9400422 	ldr	x2, [x1, #8]
    c508:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    c50c:	cb130043 	sub	x3, x2, x19
    c510:	f1007c7f 	cmp	x3, #0x1f
    c514:	54ffff0d 	b.le	c4f4 <_malloc_r+0x214>
    c518:	f9401284 	ldr	x4, [x20, #32]
    c51c:	91004282 	add	x2, x20, #0x10
    c520:	2a0003e5 	mov	w5, w0
    c524:	eb02009f 	cmp	x4, x2
    c528:	54fff121 	b.ne	c34c <_malloc_r+0x6c>  // b.any
    c52c:	f9400681 	ldr	x1, [x20, #8]
    c530:	13027ca2 	asr	w2, w5, #2
    c534:	d2800020 	mov	x0, #0x1                   	// #1
    c538:	9ac22000 	lsl	x0, x0, x2
    c53c:	eb01001f 	cmp	x0, x1
    c540:	54fff3e9 	b.ls	c3bc <_malloc_r+0xdc>  // b.plast
    c544:	f9400a97 	ldr	x23, [x20, #16]
    c548:	f94006f6 	ldr	x22, [x23, #8]
    c54c:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    c550:	eb18027f 	cmp	x19, x24
    c554:	cb130300 	sub	x0, x24, x19
    c558:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    c55c:	54000bec 	b.gt	c6d8 <_malloc_r+0x3f8>
    c560:	b0000021 	adrp	x1, 11000 <__global_locale+0x180>
    c564:	a90573fb 	stp	x27, x28, [sp, #80]
    c568:	b000003b 	adrp	x27, 11000 <__global_locale+0x180>
    c56c:	f947b821 	ldr	x1, [x1, #3952]
    c570:	d28203e3 	mov	x3, #0x101f                	// #4127
    c574:	f9441f62 	ldr	x2, [x27, #2104]
    c578:	8b010261 	add	x1, x19, x1
    c57c:	8b030036 	add	x22, x1, x3
    c580:	91008021 	add	x1, x1, #0x20
    c584:	b100045f 	cmn	x2, #0x1
    c588:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    c58c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    c590:	aa1503e0 	mov	x0, x21
    c594:	aa1603e1 	mov	x1, x22
    c598:	a9046bf9 	stp	x25, x26, [sp, #64]
    c59c:	940004b1 	bl	d860 <_sbrk_r>
    c5a0:	8b1802fa 	add	x26, x23, x24
    c5a4:	aa0003f9 	mov	x25, x0
    c5a8:	b100041f 	cmn	x0, #0x1
    c5ac:	54001f20 	b.eq	c990 <_malloc_r+0x6b0>  // b.none
    c5b0:	eb00035f 	cmp	x26, x0
    c5b4:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    c5b8:	54001ec1 	b.ne	c990 <_malloc_r+0x6b0>  // b.any
    c5bc:	b000003c 	adrp	x28, 11000 <__global_locale+0x180>
    c5c0:	b94f3b81 	ldr	w1, [x28, #3896]
    c5c4:	0b160021 	add	w1, w1, w22
    c5c8:	b90f3b81 	str	w1, [x28, #3896]
    c5cc:	eb00035f 	cmp	x26, x0
    c5d0:	54001ce0 	b.eq	c96c <_malloc_r+0x68c>  // b.none
    c5d4:	f9441f60 	ldr	x0, [x27, #2104]
    c5d8:	b100041f 	cmn	x0, #0x1
    c5dc:	54001d60 	b.eq	c988 <_malloc_r+0x6a8>  // b.none
    c5e0:	cb1a033a 	sub	x26, x25, x26
    c5e4:	0b1a0021 	add	w1, w1, w26
    c5e8:	b90f3b81 	str	w1, [x28, #3896]
    c5ec:	f2400f3a 	ands	x26, x25, #0xf
    c5f0:	54001e40 	b.eq	c9b8 <_malloc_r+0x6d8>  // b.none
    c5f4:	cb1a0339 	sub	x25, x25, x26
    c5f8:	d2820201 	mov	x1, #0x1010                	// #4112
    c5fc:	91004339 	add	x25, x25, #0x10
    c600:	cb1a0021 	sub	x1, x1, x26
    c604:	8b16033b 	add	x27, x25, x22
    c608:	aa1503e0 	mov	x0, x21
    c60c:	cb1b0036 	sub	x22, x1, x27
    c610:	92402ed6 	and	x22, x22, #0xfff
    c614:	aa1603e1 	mov	x1, x22
    c618:	94000492 	bl	d860 <_sbrk_r>
    c61c:	b100041f 	cmn	x0, #0x1
    c620:	54002480 	b.eq	cab0 <_malloc_r+0x7d0>  // b.none
    c624:	cb190000 	sub	x0, x0, x25
    c628:	2a1603e2 	mov	w2, w22
    c62c:	8b160016 	add	x22, x0, x22
    c630:	b94f3b81 	ldr	w1, [x28, #3896]
    c634:	b24002d6 	orr	x22, x22, #0x1
    c638:	f9000a99 	str	x25, [x20, #16]
    c63c:	0b010041 	add	w1, w2, w1
    c640:	b90f3b81 	str	w1, [x28, #3896]
    c644:	f9000736 	str	x22, [x25, #8]
    c648:	eb1402ff 	cmp	x23, x20
    c64c:	54002000 	b.eq	ca4c <_malloc_r+0x76c>  // b.none
    c650:	f1007f1f 	cmp	x24, #0x1f
    c654:	54001cc9 	b.ls	c9ec <_malloc_r+0x70c>  // b.plast
    c658:	d1006300 	sub	x0, x24, #0x18
    c65c:	d2800124 	mov	x4, #0x9                   	// #9
    c660:	f94006e2 	ldr	x2, [x23, #8]
    c664:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    c668:	8b0002e3 	add	x3, x23, x0
    c66c:	92400042 	and	x2, x2, #0x1
    c670:	aa000042 	orr	x2, x2, x0
    c674:	f90006e2 	str	x2, [x23, #8]
    c678:	f8008c64 	str	x4, [x3, #8]!
    c67c:	f9000464 	str	x4, [x3, #8]
    c680:	f1007c1f 	cmp	x0, #0x1f
    c684:	54002088 	b.hi	ca94 <_malloc_r+0x7b4>  // b.pmore
    c688:	f9400736 	ldr	x22, [x25, #8]
    c68c:	aa1903f7 	mov	x23, x25
    c690:	b0000020 	adrp	x0, 11000 <__global_locale+0x180>
    c694:	93407c21 	sxtw	x1, w1
    c698:	f947b002 	ldr	x2, [x0, #3936]
    c69c:	eb02003f 	cmp	x1, x2
    c6a0:	54000049 	b.ls	c6a8 <_malloc_r+0x3c8>  // b.plast
    c6a4:	f907b001 	str	x1, [x0, #3936]
    c6a8:	b0000020 	adrp	x0, 11000 <__global_locale+0x180>
    c6ac:	f947b402 	ldr	x2, [x0, #3944]
    c6b0:	eb02003f 	cmp	x1, x2
    c6b4:	54000049 	b.ls	c6bc <_malloc_r+0x3dc>  // b.plast
    c6b8:	f907b401 	str	x1, [x0, #3944]
    c6bc:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    c6c0:	eb00027f 	cmp	x19, x0
    c6c4:	cb130000 	sub	x0, x0, x19
    c6c8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    c6cc:	5400194d 	b.le	c9f4 <_malloc_r+0x714>
    c6d0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    c6d4:	a94573fb 	ldp	x27, x28, [sp, #80]
    c6d8:	8b1302e2 	add	x2, x23, x19
    c6dc:	b2400273 	orr	x19, x19, #0x1
    c6e0:	f90006f3 	str	x19, [x23, #8]
    c6e4:	b2400001 	orr	x1, x0, #0x1
    c6e8:	f9000a82 	str	x2, [x20, #16]
    c6ec:	f9000441 	str	x1, [x2, #8]
    c6f0:	aa1503e0 	mov	x0, x21
    c6f4:	910042f7 	add	x23, x23, #0x10
    c6f8:	94000306 	bl	d310 <__malloc_unlock>
    c6fc:	aa1703e0 	mov	x0, x23
    c700:	a94153f3 	ldp	x19, x20, [sp, #16]
    c704:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c708:	a94363f7 	ldp	x23, x24, [sp, #48]
    c70c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    c710:	d65f03c0 	ret
    c714:	52800180 	mov	w0, #0xc                   	// #12
    c718:	d2800017 	mov	x23, #0x0                   	// #0
    c71c:	b90002a0 	str	w0, [x21]
    c720:	aa1703e0 	mov	x0, x23
    c724:	a94153f3 	ldp	x19, x20, [sp, #16]
    c728:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c72c:	a94363f7 	ldp	x23, x24, [sp, #48]
    c730:	a8c67bfd 	ldp	x29, x30, [sp], #96
    c734:	d65f03c0 	ret
    c738:	d2808004 	mov	x4, #0x400                 	// #1024
    c73c:	52800805 	mov	w5, #0x40                  	// #64
    c740:	528007e0 	mov	w0, #0x3f                  	// #63
    c744:	17ffff64 	b	c4d4 <_malloc_r+0x1f4>
    c748:	8b010081 	add	x1, x4, x1
    c74c:	aa1503e0 	mov	x0, x21
    c750:	91004097 	add	x23, x4, #0x10
    c754:	f9400422 	ldr	x2, [x1, #8]
    c758:	b2400042 	orr	x2, x2, #0x1
    c75c:	f9000422 	str	x2, [x1, #8]
    c760:	940002ec 	bl	d310 <__malloc_unlock>
    c764:	17ffffef 	b	c720 <_malloc_r+0x440>
    c768:	a9409022 	ldp	x2, x4, [x1, #8]
    c76c:	91004037 	add	x23, x1, #0x10
    c770:	f9400c23 	ldr	x3, [x1, #24]
    c774:	aa1503e0 	mov	x0, x21
    c778:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    c77c:	8b020022 	add	x2, x1, x2
    c780:	f9400441 	ldr	x1, [x2, #8]
    c784:	f9000c83 	str	x3, [x4, #24]
    c788:	f9000864 	str	x4, [x3, #16]
    c78c:	b2400021 	orr	x1, x1, #0x1
    c790:	f9000441 	str	x1, [x2, #8]
    c794:	940002df 	bl	d310 <__malloc_unlock>
    c798:	aa1703e0 	mov	x0, x23
    c79c:	a94153f3 	ldp	x19, x20, [sp, #16]
    c7a0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c7a4:	a94363f7 	ldp	x23, x24, [sp, #48]
    c7a8:	a8c67bfd 	ldp	x29, x30, [sp], #96
    c7ac:	d65f03c0 	ret
    c7b0:	8b020022 	add	x2, x1, x2
    c7b4:	91004037 	add	x23, x1, #0x10
    c7b8:	a9410c24 	ldp	x4, x3, [x1, #16]
    c7bc:	aa1503e0 	mov	x0, x21
    c7c0:	f9400441 	ldr	x1, [x2, #8]
    c7c4:	f9000c83 	str	x3, [x4, #24]
    c7c8:	b2400021 	orr	x1, x1, #0x1
    c7cc:	f9000864 	str	x4, [x3, #16]
    c7d0:	f9000441 	str	x1, [x2, #8]
    c7d4:	940002cf 	bl	d310 <__malloc_unlock>
    c7d8:	aa1703e0 	mov	x0, x23
    c7dc:	a94153f3 	ldp	x19, x20, [sp, #16]
    c7e0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c7e4:	a94363f7 	ldp	x23, x24, [sp, #48]
    c7e8:	a8c67bfd 	ldp	x29, x30, [sp], #96
    c7ec:	d65f03c0 	ret
    c7f0:	d349fc20 	lsr	x0, x1, #9
    c7f4:	f127fc3f 	cmp	x1, #0x9ff
    c7f8:	540009e9 	b.ls	c934 <_malloc_r+0x654>  // b.plast
    c7fc:	f100501f 	cmp	x0, #0x14
    c800:	54001068 	b.hi	ca0c <_malloc_r+0x72c>  // b.pmore
    c804:	11017003 	add	w3, w0, #0x5c
    c808:	11016c02 	add	w2, w0, #0x5b
    c80c:	531f7863 	lsl	w3, w3, #1
    c810:	937d7c63 	sbfiz	x3, x3, #3, #32
    c814:	8b030283 	add	x3, x20, x3
    c818:	f85f0460 	ldr	x0, [x3], #-16
    c81c:	eb00007f 	cmp	x3, x0
    c820:	54000be0 	b.eq	c99c <_malloc_r+0x6bc>  // b.none
    c824:	d503201f 	nop
    c828:	f9400402 	ldr	x2, [x0, #8]
    c82c:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    c830:	eb01005f 	cmp	x2, x1
    c834:	54000089 	b.ls	c844 <_malloc_r+0x564>  // b.plast
    c838:	f9400800 	ldr	x0, [x0, #16]
    c83c:	eb00007f 	cmp	x3, x0
    c840:	54ffff41 	b.ne	c828 <_malloc_r+0x548>  // b.any
    c844:	f9400681 	ldr	x1, [x20, #8]
    c848:	f9400c03 	ldr	x3, [x0, #24]
    c84c:	a9010c80 	stp	x0, x3, [x4, #16]
    c850:	f9000864 	str	x4, [x3, #16]
    c854:	f9000c04 	str	x4, [x0, #24]
    c858:	17fffed4 	b	c3a8 <_malloc_r+0xc8>
    c85c:	f100501f 	cmp	x0, #0x14
    c860:	54000769 	b.ls	c94c <_malloc_r+0x66c>  // b.plast
    c864:	f101501f 	cmp	x0, #0x54
    c868:	54000e28 	b.hi	ca2c <_malloc_r+0x74c>  // b.pmore
    c86c:	d34cfe60 	lsr	x0, x19, #12
    c870:	1101bc05 	add	w5, w0, #0x6f
    c874:	1101b800 	add	w0, w0, #0x6e
    c878:	531f78a4 	lsl	w4, w5, #1
    c87c:	937d7c84 	sbfiz	x4, x4, #3, #32
    c880:	17ffff15 	b	c4d4 <_malloc_r+0x1f4>
    c884:	f94008c7 	ldr	x7, [x6, #16]
    c888:	b2400260 	orr	x0, x19, #0x1
    c88c:	f90004c0 	str	x0, [x6, #8]
    c890:	8b1300c4 	add	x4, x6, x19
    c894:	91004285 	add	x5, x20, #0x10
    c898:	b2400068 	orr	x8, x3, #0x1
    c89c:	f9000ce1 	str	x1, [x7, #24]
    c8a0:	910040d7 	add	x23, x6, #0x10
    c8a4:	f9000827 	str	x7, [x1, #16]
    c8a8:	aa1503e0 	mov	x0, x21
    c8ac:	a9021284 	stp	x4, x4, [x20, #32]
    c8b0:	a9009488 	stp	x8, x5, [x4, #8]
    c8b4:	f9000c85 	str	x5, [x4, #24]
    c8b8:	f82268c3 	str	x3, [x6, x2]
    c8bc:	94000295 	bl	d310 <__malloc_unlock>
    c8c0:	17ffff98 	b	c720 <_malloc_r+0x440>
    c8c4:	8b0200c2 	add	x2, x6, x2
    c8c8:	aa0603f7 	mov	x23, x6
    c8cc:	aa1503e0 	mov	x0, x21
    c8d0:	f9400443 	ldr	x3, [x2, #8]
    c8d4:	f8410ee4 	ldr	x4, [x23, #16]!
    c8d8:	b2400063 	orr	x3, x3, #0x1
    c8dc:	f9000443 	str	x3, [x2, #8]
    c8e0:	f9000c81 	str	x1, [x4, #24]
    c8e4:	f9000824 	str	x4, [x1, #16]
    c8e8:	9400028a 	bl	d310 <__malloc_unlock>
    c8ec:	17ffff8d 	b	c720 <_malloc_r+0x440>
    c8f0:	d343fe65 	lsr	x5, x19, #3
    c8f4:	110004a0 	add	w0, w5, #0x1
    c8f8:	531f7800 	lsl	w0, w0, #1
    c8fc:	937d7c00 	sbfiz	x0, x0, #3, #32
    c900:	17fffe87 	b	c31c <_malloc_r+0x3c>
    c904:	8b130085 	add	x5, x4, x19
    c908:	b2400273 	orr	x19, x19, #0x1
    c90c:	f9000493 	str	x19, [x4, #8]
    c910:	b2400066 	orr	x6, x3, #0x1
    c914:	a9021685 	stp	x5, x5, [x20, #32]
    c918:	aa1503e0 	mov	x0, x21
    c91c:	91004097 	add	x23, x4, #0x10
    c920:	a90088a6 	stp	x6, x2, [x5, #8]
    c924:	f9000ca2 	str	x2, [x5, #24]
    c928:	f8216883 	str	x3, [x4, x1]
    c92c:	94000279 	bl	d310 <__malloc_unlock>
    c930:	17ffff7c 	b	c720 <_malloc_r+0x440>
    c934:	d346fc20 	lsr	x0, x1, #6
    c938:	1100e403 	add	w3, w0, #0x39
    c93c:	1100e002 	add	w2, w0, #0x38
    c940:	531f7863 	lsl	w3, w3, #1
    c944:	937d7c63 	sbfiz	x3, x3, #3, #32
    c948:	17ffffb3 	b	c814 <_malloc_r+0x534>
    c94c:	11017005 	add	w5, w0, #0x5c
    c950:	11016c00 	add	w0, w0, #0x5b
    c954:	531f78a4 	lsl	w4, w5, #1
    c958:	937d7c84 	sbfiz	x4, x4, #3, #32
    c95c:	17fffede 	b	c4d4 <_malloc_r+0x1f4>
    c960:	11000508 	add	w8, w8, #0x1
    c964:	91008084 	add	x4, x4, #0x20
    c968:	17fffeb2 	b	c430 <_malloc_r+0x150>
    c96c:	f2402f5f 	tst	x26, #0xfff
    c970:	54ffe321 	b.ne	c5d4 <_malloc_r+0x2f4>  // b.any
    c974:	f9400a97 	ldr	x23, [x20, #16]
    c978:	8b160316 	add	x22, x24, x22
    c97c:	b24002d6 	orr	x22, x22, #0x1
    c980:	f90006f6 	str	x22, [x23, #8]
    c984:	17ffff43 	b	c690 <_malloc_r+0x3b0>
    c988:	f9041f79 	str	x25, [x27, #2104]
    c98c:	17ffff18 	b	c5ec <_malloc_r+0x30c>
    c990:	f9400a97 	ldr	x23, [x20, #16]
    c994:	f94006f6 	ldr	x22, [x23, #8]
    c998:	17ffff49 	b	c6bc <_malloc_r+0x3dc>
    c99c:	f9400686 	ldr	x6, [x20, #8]
    c9a0:	13027c42 	asr	w2, w2, #2
    c9a4:	d2800021 	mov	x1, #0x1                   	// #1
    c9a8:	9ac22021 	lsl	x1, x1, x2
    c9ac:	aa060021 	orr	x1, x1, x6
    c9b0:	f9000681 	str	x1, [x20, #8]
    c9b4:	17ffffa6 	b	c84c <_malloc_r+0x56c>
    c9b8:	8b16033a 	add	x26, x25, x22
    c9bc:	aa1503e0 	mov	x0, x21
    c9c0:	cb1a03fa 	neg	x26, x26
    c9c4:	92402f5a 	and	x26, x26, #0xfff
    c9c8:	aa1a03e1 	mov	x1, x26
    c9cc:	940003a5 	bl	d860 <_sbrk_r>
    c9d0:	52800002 	mov	w2, #0x0                   	// #0
    c9d4:	b100041f 	cmn	x0, #0x1
    c9d8:	54ffe2c0 	b.eq	c630 <_malloc_r+0x350>  // b.none
    c9dc:	cb190000 	sub	x0, x0, x25
    c9e0:	2a1a03e2 	mov	w2, w26
    c9e4:	8b1a0016 	add	x22, x0, x26
    c9e8:	17ffff12 	b	c630 <_malloc_r+0x350>
    c9ec:	d2800020 	mov	x0, #0x1                   	// #1
    c9f0:	f9000720 	str	x0, [x25, #8]
    c9f4:	aa1503e0 	mov	x0, x21
    c9f8:	d2800017 	mov	x23, #0x0                   	// #0
    c9fc:	94000245 	bl	d310 <__malloc_unlock>
    ca00:	a9446bf9 	ldp	x25, x26, [sp, #64]
    ca04:	a94573fb 	ldp	x27, x28, [sp, #80]
    ca08:	17ffff46 	b	c720 <_malloc_r+0x440>
    ca0c:	f101501f 	cmp	x0, #0x54
    ca10:	54000228 	b.hi	ca54 <_malloc_r+0x774>  // b.pmore
    ca14:	d34cfc20 	lsr	x0, x1, #12
    ca18:	1101bc03 	add	w3, w0, #0x6f
    ca1c:	1101b802 	add	w2, w0, #0x6e
    ca20:	531f7863 	lsl	w3, w3, #1
    ca24:	937d7c63 	sbfiz	x3, x3, #3, #32
    ca28:	17ffff7b 	b	c814 <_malloc_r+0x534>
    ca2c:	f105501f 	cmp	x0, #0x154
    ca30:	54000228 	b.hi	ca74 <_malloc_r+0x794>  // b.pmore
    ca34:	d34ffe60 	lsr	x0, x19, #15
    ca38:	1101e005 	add	w5, w0, #0x78
    ca3c:	1101dc00 	add	w0, w0, #0x77
    ca40:	531f78a4 	lsl	w4, w5, #1
    ca44:	937d7c84 	sbfiz	x4, x4, #3, #32
    ca48:	17fffea3 	b	c4d4 <_malloc_r+0x1f4>
    ca4c:	aa1903f7 	mov	x23, x25
    ca50:	17ffff10 	b	c690 <_malloc_r+0x3b0>
    ca54:	f105501f 	cmp	x0, #0x154
    ca58:	54000368 	b.hi	cac4 <_malloc_r+0x7e4>  // b.pmore
    ca5c:	d34ffc20 	lsr	x0, x1, #15
    ca60:	1101e003 	add	w3, w0, #0x78
    ca64:	1101dc02 	add	w2, w0, #0x77
    ca68:	531f7863 	lsl	w3, w3, #1
    ca6c:	937d7c63 	sbfiz	x3, x3, #3, #32
    ca70:	17ffff69 	b	c814 <_malloc_r+0x534>
    ca74:	f115501f 	cmp	x0, #0x554
    ca78:	54000368 	b.hi	cae4 <_malloc_r+0x804>  // b.pmore
    ca7c:	d352fe60 	lsr	x0, x19, #18
    ca80:	1101f405 	add	w5, w0, #0x7d
    ca84:	1101f000 	add	w0, w0, #0x7c
    ca88:	531f78a4 	lsl	w4, w5, #1
    ca8c:	937d7c84 	sbfiz	x4, x4, #3, #32
    ca90:	17fffe91 	b	c4d4 <_malloc_r+0x1f4>
    ca94:	910042e1 	add	x1, x23, #0x10
    ca98:	aa1503e0 	mov	x0, x21
    ca9c:	97fff7f1 	bl	aa60 <_free_r>
    caa0:	f9400a97 	ldr	x23, [x20, #16]
    caa4:	b94f3b81 	ldr	w1, [x28, #3896]
    caa8:	f94006f6 	ldr	x22, [x23, #8]
    caac:	17fffef9 	b	c690 <_malloc_r+0x3b0>
    cab0:	d100435a 	sub	x26, x26, #0x10
    cab4:	52800002 	mov	w2, #0x0                   	// #0
    cab8:	8b1a0376 	add	x22, x27, x26
    cabc:	cb1902d6 	sub	x22, x22, x25
    cac0:	17fffedc 	b	c630 <_malloc_r+0x350>
    cac4:	f115501f 	cmp	x0, #0x554
    cac8:	54000168 	b.hi	caf4 <_malloc_r+0x814>  // b.pmore
    cacc:	d352fc20 	lsr	x0, x1, #18
    cad0:	1101f403 	add	w3, w0, #0x7d
    cad4:	1101f002 	add	w2, w0, #0x7c
    cad8:	531f7863 	lsl	w3, w3, #1
    cadc:	937d7c63 	sbfiz	x3, x3, #3, #32
    cae0:	17ffff4d 	b	c814 <_malloc_r+0x534>
    cae4:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    cae8:	52800fe5 	mov	w5, #0x7f                  	// #127
    caec:	52800fc0 	mov	w0, #0x7e                  	// #126
    caf0:	17fffe79 	b	c4d4 <_malloc_r+0x1f4>
    caf4:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    caf8:	52800fc2 	mov	w2, #0x7e                  	// #126
    cafc:	17ffff46 	b	c814 <_malloc_r+0x534>
    cb00:	f9400681 	ldr	x1, [x20, #8]
    cb04:	17fffe58 	b	c464 <_malloc_r+0x184>
    cb08:	d503201f 	nop
    cb0c:	d503201f 	nop

000000000000cb10 <_mbtowc_r>:
    cb10:	90000025 	adrp	x5, 10000 <__func__.0+0x10>
    cb14:	f947b4a5 	ldr	x5, [x5, #3944]
    cb18:	aa0503f0 	mov	x16, x5
    cb1c:	d61f0200 	br	x16

000000000000cb20 <__ascii_mbtowc>:
    cb20:	d10043ff 	sub	sp, sp, #0x10
    cb24:	f100003f 	cmp	x1, #0x0
    cb28:	910033e0 	add	x0, sp, #0xc
    cb2c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    cb30:	b4000122 	cbz	x2, cb54 <__ascii_mbtowc+0x34>
    cb34:	b4000163 	cbz	x3, cb60 <__ascii_mbtowc+0x40>
    cb38:	39400040 	ldrb	w0, [x2]
    cb3c:	b9000020 	str	w0, [x1]
    cb40:	39400040 	ldrb	w0, [x2]
    cb44:	7100001f 	cmp	w0, #0x0
    cb48:	1a9f07e0 	cset	w0, ne  // ne = any
    cb4c:	910043ff 	add	sp, sp, #0x10
    cb50:	d65f03c0 	ret
    cb54:	52800000 	mov	w0, #0x0                   	// #0
    cb58:	910043ff 	add	sp, sp, #0x10
    cb5c:	d65f03c0 	ret
    cb60:	12800020 	mov	w0, #0xfffffffe            	// #-2
    cb64:	17fffffa 	b	cb4c <__ascii_mbtowc+0x2c>
    cb68:	d503201f 	nop
    cb6c:	d503201f 	nop

000000000000cb70 <__utf8_mbtowc>:
    cb70:	d10043ff 	sub	sp, sp, #0x10
    cb74:	f100003f 	cmp	x1, #0x0
    cb78:	910033e5 	add	x5, sp, #0xc
    cb7c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    cb80:	b4000a02 	cbz	x2, ccc0 <__utf8_mbtowc+0x150>
    cb84:	b40012a3 	cbz	x3, cdd8 <__utf8_mbtowc+0x268>
    cb88:	b9400086 	ldr	w6, [x4]
    cb8c:	aa0003e8 	mov	x8, x0
    cb90:	350003c6 	cbnz	w6, cc08 <__utf8_mbtowc+0x98>
    cb94:	39400040 	ldrb	w0, [x2]
    cb98:	52800025 	mov	w5, #0x1                   	// #1
    cb9c:	340003c0 	cbz	w0, cc14 <__utf8_mbtowc+0xa4>
    cba0:	7101fc1f 	cmp	w0, #0x7f
    cba4:	5400084d 	b.le	ccac <__utf8_mbtowc+0x13c>
    cba8:	51030007 	sub	w7, w0, #0xc0
    cbac:	71007cff 	cmp	w7, #0x1f
    cbb0:	540003a8 	b.hi	cc24 <__utf8_mbtowc+0xb4>  // b.pmore
    cbb4:	39001080 	strb	w0, [x4, #4]
    cbb8:	350000a6 	cbnz	w6, cbcc <__utf8_mbtowc+0x5c>
    cbbc:	52800026 	mov	w6, #0x1                   	// #1
    cbc0:	b9000086 	str	w6, [x4]
    cbc4:	f100047f 	cmp	x3, #0x1
    cbc8:	54001080 	b.eq	cdd8 <__utf8_mbtowc+0x268>  // b.none
    cbcc:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    cbd0:	110004a5 	add	w5, w5, #0x1
    cbd4:	51020043 	sub	w3, w2, #0x80
    cbd8:	7100fc7f 	cmp	w3, #0x3f
    cbdc:	54001068 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cbe0:	7103041f 	cmp	w0, #0xc1
    cbe4:	5400102d 	b.le	cde8 <__utf8_mbtowc+0x278>
    cbe8:	531a1000 	ubfiz	w0, w0, #6, #5
    cbec:	12001442 	and	w2, w2, #0x3f
    cbf0:	b900009f 	str	wzr, [x4]
    cbf4:	2a020002 	orr	w2, w0, w2
    cbf8:	b9000022 	str	w2, [x1]
    cbfc:	2a0503e0 	mov	w0, w5
    cc00:	910043ff 	add	sp, sp, #0x10
    cc04:	d65f03c0 	ret
    cc08:	39401080 	ldrb	w0, [x4, #4]
    cc0c:	52800005 	mov	w5, #0x0                   	// #0
    cc10:	35fffc80 	cbnz	w0, cba0 <__utf8_mbtowc+0x30>
    cc14:	b900003f 	str	wzr, [x1]
    cc18:	b900009f 	str	wzr, [x4]
    cc1c:	910043ff 	add	sp, sp, #0x10
    cc20:	d65f03c0 	ret
    cc24:	51038007 	sub	w7, w0, #0xe0
    cc28:	71003cff 	cmp	w7, #0xf
    cc2c:	54000508 	b.hi	cccc <__utf8_mbtowc+0x15c>  // b.pmore
    cc30:	39001080 	strb	w0, [x4, #4]
    cc34:	34000aa6 	cbz	w6, cd88 <__utf8_mbtowc+0x218>
    cc38:	b100047f 	cmn	x3, #0x1
    cc3c:	9a830463 	cinc	x3, x3, ne  // ne = any
    cc40:	710004df 	cmp	w6, #0x1
    cc44:	54000aa0 	b.eq	cd98 <__utf8_mbtowc+0x228>  // b.none
    cc48:	39401487 	ldrb	w7, [x4, #5]
    cc4c:	7103801f 	cmp	w0, #0xe0
    cc50:	528013e9 	mov	w9, #0x9f                  	// #159
    cc54:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    cc58:	54000c8d 	b.le	cde8 <__utf8_mbtowc+0x278>
    cc5c:	510200e9 	sub	w9, w7, #0x80
    cc60:	7100fd3f 	cmp	w9, #0x3f
    cc64:	54000c28 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cc68:	39001487 	strb	w7, [x4, #5]
    cc6c:	710004df 	cmp	w6, #0x1
    cc70:	54000ac0 	b.eq	cdc8 <__utf8_mbtowc+0x258>  // b.none
    cc74:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    cc78:	110004a5 	add	w5, w5, #0x1
    cc7c:	51020043 	sub	w3, w2, #0x80
    cc80:	7100fc7f 	cmp	w3, #0x3f
    cc84:	54000b28 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cc88:	53140c00 	ubfiz	w0, w0, #12, #4
    cc8c:	531a14e7 	ubfiz	w7, w7, #6, #6
    cc90:	2a070007 	orr	w7, w0, w7
    cc94:	12001442 	and	w2, w2, #0x3f
    cc98:	b900009f 	str	wzr, [x4]
    cc9c:	2a0200e7 	orr	w7, w7, w2
    cca0:	2a0503e0 	mov	w0, w5
    cca4:	b9000027 	str	w7, [x1]
    cca8:	17ffffdd 	b	cc1c <__utf8_mbtowc+0xac>
    ccac:	b900009f 	str	wzr, [x4]
    ccb0:	b9000020 	str	w0, [x1]
    ccb4:	52800020 	mov	w0, #0x1                   	// #1
    ccb8:	910043ff 	add	sp, sp, #0x10
    ccbc:	d65f03c0 	ret
    ccc0:	52800000 	mov	w0, #0x0                   	// #0
    ccc4:	910043ff 	add	sp, sp, #0x10
    ccc8:	d65f03c0 	ret
    cccc:	5103c007 	sub	w7, w0, #0xf0
    ccd0:	710010ff 	cmp	w7, #0x4
    ccd4:	540008a8 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    ccd8:	39001080 	strb	w0, [x4, #4]
    ccdc:	34000666 	cbz	w6, cda8 <__utf8_mbtowc+0x238>
    cce0:	b100047f 	cmn	x3, #0x1
    cce4:	9a830463 	cinc	x3, x3, ne  // ne = any
    cce8:	710004df 	cmp	w6, #0x1
    ccec:	54000660 	b.eq	cdb8 <__utf8_mbtowc+0x248>  // b.none
    ccf0:	39401487 	ldrb	w7, [x4, #5]
    ccf4:	7103c01f 	cmp	w0, #0xf0
    ccf8:	54000740 	b.eq	cde0 <__utf8_mbtowc+0x270>  // b.none
    ccfc:	71023cff 	cmp	w7, #0x8f
    cd00:	52801e89 	mov	w9, #0xf4                  	// #244
    cd04:	7a49c000 	ccmp	w0, w9, #0x0, gt
    cd08:	54000700 	b.eq	cde8 <__utf8_mbtowc+0x278>  // b.none
    cd0c:	510200e9 	sub	w9, w7, #0x80
    cd10:	7100fd3f 	cmp	w9, #0x3f
    cd14:	540006a8 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cd18:	39001487 	strb	w7, [x4, #5]
    cd1c:	710004df 	cmp	w6, #0x1
    cd20:	540006c0 	b.eq	cdf8 <__utf8_mbtowc+0x288>  // b.none
    cd24:	b9400086 	ldr	w6, [x4]
    cd28:	b100047f 	cmn	x3, #0x1
    cd2c:	9a830463 	cinc	x3, x3, ne  // ne = any
    cd30:	710008df 	cmp	w6, #0x2
    cd34:	540006a0 	b.eq	ce08 <__utf8_mbtowc+0x298>  // b.none
    cd38:	39401886 	ldrb	w6, [x4, #6]
    cd3c:	510200c3 	sub	w3, w6, #0x80
    cd40:	7100fc7f 	cmp	w3, #0x3f
    cd44:	54000528 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cd48:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    cd4c:	110004a5 	add	w5, w5, #0x1
    cd50:	51020043 	sub	w3, w2, #0x80
    cd54:	7100fc7f 	cmp	w3, #0x3f
    cd58:	54000488 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    cd5c:	530e0800 	ubfiz	w0, w0, #18, #3
    cd60:	531414e7 	ubfiz	w7, w7, #12, #6
    cd64:	531a14c6 	ubfiz	w6, w6, #6, #6
    cd68:	12001442 	and	w2, w2, #0x3f
    cd6c:	2a070007 	orr	w7, w0, w7
    cd70:	2a0200c6 	orr	w6, w6, w2
    cd74:	2a0600e6 	orr	w6, w7, w6
    cd78:	b9000026 	str	w6, [x1]
    cd7c:	2a0503e0 	mov	w0, w5
    cd80:	b900009f 	str	wzr, [x4]
    cd84:	17ffffa6 	b	cc1c <__utf8_mbtowc+0xac>
    cd88:	52800026 	mov	w6, #0x1                   	// #1
    cd8c:	b9000086 	str	w6, [x4]
    cd90:	f100047f 	cmp	x3, #0x1
    cd94:	54000220 	b.eq	cdd8 <__utf8_mbtowc+0x268>  // b.none
    cd98:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    cd9c:	52800026 	mov	w6, #0x1                   	// #1
    cda0:	0b0600a5 	add	w5, w5, w6
    cda4:	17ffffaa 	b	cc4c <__utf8_mbtowc+0xdc>
    cda8:	52800026 	mov	w6, #0x1                   	// #1
    cdac:	b9000086 	str	w6, [x4]
    cdb0:	f100047f 	cmp	x3, #0x1
    cdb4:	54000120 	b.eq	cdd8 <__utf8_mbtowc+0x268>  // b.none
    cdb8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    cdbc:	52800026 	mov	w6, #0x1                   	// #1
    cdc0:	0b0600a5 	add	w5, w5, w6
    cdc4:	17ffffcc 	b	ccf4 <__utf8_mbtowc+0x184>
    cdc8:	52800046 	mov	w6, #0x2                   	// #2
    cdcc:	b9000086 	str	w6, [x4]
    cdd0:	f100087f 	cmp	x3, #0x2
    cdd4:	54fff501 	b.ne	cc74 <__utf8_mbtowc+0x104>  // b.any
    cdd8:	12800020 	mov	w0, #0xfffffffe            	// #-2
    cddc:	17ffff90 	b	cc1c <__utf8_mbtowc+0xac>
    cde0:	71023cff 	cmp	w7, #0x8f
    cde4:	54fff94c 	b.gt	cd0c <__utf8_mbtowc+0x19c>
    cde8:	52801141 	mov	w1, #0x8a                  	// #138
    cdec:	12800000 	mov	w0, #0xffffffff            	// #-1
    cdf0:	b9000101 	str	w1, [x8]
    cdf4:	17ffff8a 	b	cc1c <__utf8_mbtowc+0xac>
    cdf8:	52800046 	mov	w6, #0x2                   	// #2
    cdfc:	b9000086 	str	w6, [x4]
    ce00:	f100087f 	cmp	x3, #0x2
    ce04:	54fffea0 	b.eq	cdd8 <__utf8_mbtowc+0x268>  // b.none
    ce08:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    ce0c:	110004a5 	add	w5, w5, #0x1
    ce10:	510200c9 	sub	w9, w6, #0x80
    ce14:	7100fd3f 	cmp	w9, #0x3f
    ce18:	54fffe88 	b.hi	cde8 <__utf8_mbtowc+0x278>  // b.pmore
    ce1c:	52800069 	mov	w9, #0x3                   	// #3
    ce20:	b9000089 	str	w9, [x4]
    ce24:	39001886 	strb	w6, [x4, #6]
    ce28:	f1000c7f 	cmp	x3, #0x3
    ce2c:	54fff8e1 	b.ne	cd48 <__utf8_mbtowc+0x1d8>  // b.any
    ce30:	12800020 	mov	w0, #0xfffffffe            	// #-2
    ce34:	17ffff7a 	b	cc1c <__utf8_mbtowc+0xac>
    ce38:	d503201f 	nop
    ce3c:	d503201f 	nop

000000000000ce40 <__sjis_mbtowc>:
    ce40:	d10043ff 	sub	sp, sp, #0x10
    ce44:	f100003f 	cmp	x1, #0x0
    ce48:	910033e5 	add	x5, sp, #0xc
    ce4c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    ce50:	b40004c2 	cbz	x2, cee8 <__sjis_mbtowc+0xa8>
    ce54:	b4000503 	cbz	x3, cef4 <__sjis_mbtowc+0xb4>
    ce58:	aa0003e6 	mov	x6, x0
    ce5c:	b9400080 	ldr	w0, [x4]
    ce60:	39400045 	ldrb	w5, [x2]
    ce64:	35000320 	cbnz	w0, cec8 <__sjis_mbtowc+0x88>
    ce68:	510204a7 	sub	w7, w5, #0x81
    ce6c:	510380a0 	sub	w0, w5, #0xe0
    ce70:	710078ff 	cmp	w7, #0x1e
    ce74:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    ce78:	540002c8 	b.hi	ced0 <__sjis_mbtowc+0x90>  // b.pmore
    ce7c:	52800020 	mov	w0, #0x1                   	// #1
    ce80:	b9000080 	str	w0, [x4]
    ce84:	39001085 	strb	w5, [x4, #4]
    ce88:	f100047f 	cmp	x3, #0x1
    ce8c:	54000340 	b.eq	cef4 <__sjis_mbtowc+0xb4>  // b.none
    ce90:	39400445 	ldrb	w5, [x2, #1]
    ce94:	52800040 	mov	w0, #0x2                   	// #2
    ce98:	510100a3 	sub	w3, w5, #0x40
    ce9c:	510200a2 	sub	w2, w5, #0x80
    cea0:	7100f87f 	cmp	w3, #0x3e
    cea4:	52800f83 	mov	w3, #0x7c                  	// #124
    cea8:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    ceac:	54000288 	b.hi	cefc <__sjis_mbtowc+0xbc>  // b.pmore
    ceb0:	39401082 	ldrb	w2, [x4, #4]
    ceb4:	0b0220a5 	add	w5, w5, w2, lsl #8
    ceb8:	b9000025 	str	w5, [x1]
    cebc:	b900009f 	str	wzr, [x4]
    cec0:	910043ff 	add	sp, sp, #0x10
    cec4:	d65f03c0 	ret
    cec8:	7100041f 	cmp	w0, #0x1
    cecc:	54fffe60 	b.eq	ce98 <__sjis_mbtowc+0x58>  // b.none
    ced0:	b9000025 	str	w5, [x1]
    ced4:	39400040 	ldrb	w0, [x2]
    ced8:	7100001f 	cmp	w0, #0x0
    cedc:	1a9f07e0 	cset	w0, ne  // ne = any
    cee0:	910043ff 	add	sp, sp, #0x10
    cee4:	d65f03c0 	ret
    cee8:	52800000 	mov	w0, #0x0                   	// #0
    ceec:	910043ff 	add	sp, sp, #0x10
    cef0:	d65f03c0 	ret
    cef4:	12800020 	mov	w0, #0xfffffffe            	// #-2
    cef8:	17fffffa 	b	cee0 <__sjis_mbtowc+0xa0>
    cefc:	52801141 	mov	w1, #0x8a                  	// #138
    cf00:	12800000 	mov	w0, #0xffffffff            	// #-1
    cf04:	b90000c1 	str	w1, [x6]
    cf08:	17fffff6 	b	cee0 <__sjis_mbtowc+0xa0>
    cf0c:	d503201f 	nop

000000000000cf10 <__eucjp_mbtowc>:
    cf10:	d10083ff 	sub	sp, sp, #0x20
    cf14:	f100003f 	cmp	x1, #0x0
    cf18:	a90007e0 	stp	x0, x1, [sp]
    cf1c:	910073e0 	add	x0, sp, #0x1c
    cf20:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    cf24:	f94003e6 	ldr	x6, [sp]
    cf28:	b4000702 	cbz	x2, d008 <__eucjp_mbtowc+0xf8>
    cf2c:	b4000783 	cbz	x3, d01c <__eucjp_mbtowc+0x10c>
    cf30:	b9400080 	ldr	w0, [x4]
    cf34:	39400045 	ldrb	w5, [x2]
    cf38:	350004a0 	cbnz	w0, cfcc <__eucjp_mbtowc+0xbc>
    cf3c:	510284a7 	sub	w7, w5, #0xa1
    cf40:	510238a0 	sub	w0, w5, #0x8e
    cf44:	710174ff 	cmp	w7, #0x5d
    cf48:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    cf4c:	54000488 	b.hi	cfdc <__eucjp_mbtowc+0xcc>  // b.pmore
    cf50:	52800020 	mov	w0, #0x1                   	// #1
    cf54:	b9000080 	str	w0, [x4]
    cf58:	39001085 	strb	w5, [x4, #4]
    cf5c:	f100047f 	cmp	x3, #0x1
    cf60:	540005e0 	b.eq	d01c <__eucjp_mbtowc+0x10c>  // b.none
    cf64:	39400445 	ldrb	w5, [x2, #1]
    cf68:	52800040 	mov	w0, #0x2                   	// #2
    cf6c:	510284a7 	sub	w7, w5, #0xa1
    cf70:	710174ff 	cmp	w7, #0x5d
    cf74:	54000588 	b.hi	d024 <__eucjp_mbtowc+0x114>  // b.pmore
    cf78:	39401087 	ldrb	w7, [x4, #4]
    cf7c:	71023cff 	cmp	w7, #0x8f
    cf80:	540003a1 	b.ne	cff4 <__eucjp_mbtowc+0xe4>  // b.any
    cf84:	52800048 	mov	w8, #0x2                   	// #2
    cf88:	93407c07 	sxtw	x7, w0
    cf8c:	b9000088 	str	w8, [x4]
    cf90:	39001485 	strb	w5, [x4, #5]
    cf94:	eb0300ff 	cmp	x7, x3
    cf98:	54000422 	b.cs	d01c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    cf9c:	38676845 	ldrb	w5, [x2, x7]
    cfa0:	11000400 	add	w0, w0, #0x1
    cfa4:	510284a2 	sub	w2, w5, #0xa1
    cfa8:	7101745f 	cmp	w2, #0x5d
    cfac:	540003c8 	b.hi	d024 <__eucjp_mbtowc+0x114>  // b.pmore
    cfb0:	39401482 	ldrb	w2, [x4, #5]
    cfb4:	120018a5 	and	w5, w5, #0x7f
    cfb8:	0b0220a5 	add	w5, w5, w2, lsl #8
    cfbc:	b9000025 	str	w5, [x1]
    cfc0:	b900009f 	str	wzr, [x4]
    cfc4:	910083ff 	add	sp, sp, #0x20
    cfc8:	d65f03c0 	ret
    cfcc:	7100041f 	cmp	w0, #0x1
    cfd0:	54fffce0 	b.eq	cf6c <__eucjp_mbtowc+0x5c>  // b.none
    cfd4:	7100081f 	cmp	w0, #0x2
    cfd8:	540001e0 	b.eq	d014 <__eucjp_mbtowc+0x104>  // b.none
    cfdc:	b9000025 	str	w5, [x1]
    cfe0:	39400040 	ldrb	w0, [x2]
    cfe4:	7100001f 	cmp	w0, #0x0
    cfe8:	1a9f07e0 	cset	w0, ne  // ne = any
    cfec:	910083ff 	add	sp, sp, #0x20
    cff0:	d65f03c0 	ret
    cff4:	0b0720a5 	add	w5, w5, w7, lsl #8
    cff8:	b9000025 	str	w5, [x1]
    cffc:	b900009f 	str	wzr, [x4]
    d000:	910083ff 	add	sp, sp, #0x20
    d004:	d65f03c0 	ret
    d008:	52800000 	mov	w0, #0x0                   	// #0
    d00c:	910083ff 	add	sp, sp, #0x20
    d010:	d65f03c0 	ret
    d014:	52800020 	mov	w0, #0x1                   	// #1
    d018:	17ffffe3 	b	cfa4 <__eucjp_mbtowc+0x94>
    d01c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    d020:	17fffff3 	b	cfec <__eucjp_mbtowc+0xdc>
    d024:	52801141 	mov	w1, #0x8a                  	// #138
    d028:	12800000 	mov	w0, #0xffffffff            	// #-1
    d02c:	b90000c1 	str	w1, [x6]
    d030:	17ffffef 	b	cfec <__eucjp_mbtowc+0xdc>
    d034:	d503201f 	nop
    d038:	d503201f 	nop
    d03c:	d503201f 	nop

000000000000d040 <__jis_mbtowc>:
    d040:	d10043ff 	sub	sp, sp, #0x10
    d044:	f100003f 	cmp	x1, #0x0
    d048:	910033e5 	add	x5, sp, #0xc
    d04c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    d050:	b4000da2 	cbz	x2, d204 <__jis_mbtowc+0x1c4>
    d054:	b4000e43 	cbz	x3, d21c <__jis_mbtowc+0x1dc>
    d058:	39400085 	ldrb	w5, [x4]
    d05c:	f000000c 	adrp	x12, 10000 <__func__.0+0x10>
    d060:	f000000b 	adrp	x11, 10000 <__func__.0+0x10>
    d064:	aa0003ed 	mov	x13, x0
    d068:	9115618c 	add	x12, x12, #0x558
    d06c:	9116816b 	add	x11, x11, #0x5a0
    d070:	aa0203ef 	mov	x15, x2
    d074:	5280000a 	mov	w10, #0x0                   	// #0
    d078:	d2800009 	mov	x9, #0x0                   	// #0
    d07c:	38696847 	ldrb	w7, [x2, x9]
    d080:	8b09004e 	add	x14, x2, x9
    d084:	7100a0ff 	cmp	w7, #0x28
    d088:	54000c60 	b.eq	d214 <__jis_mbtowc+0x1d4>  // b.none
    d08c:	540005a8 	b.hi	d140 <__jis_mbtowc+0x100>  // b.pmore
    d090:	52800006 	mov	w6, #0x0                   	// #0
    d094:	71006cff 	cmp	w7, #0x1b
    d098:	54000080 	b.eq	d0a8 <__jis_mbtowc+0x68>  // b.none
    d09c:	52800026 	mov	w6, #0x1                   	// #1
    d0a0:	710090ff 	cmp	w7, #0x24
    d0a4:	540008c1 	b.ne	d1bc <__jis_mbtowc+0x17c>  // b.any
    d0a8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    d0ac:	8b25c005 	add	x5, x0, w5, sxtw
    d0b0:	8b050180 	add	x0, x12, x5
    d0b4:	8b050165 	add	x5, x11, x5
    d0b8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    d0bc:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    d0c0:	71000d1f 	cmp	w8, #0x3
    d0c4:	540006a0 	b.eq	d198 <__jis_mbtowc+0x158>  // b.none
    d0c8:	540002a8 	b.hi	d11c <__jis_mbtowc+0xdc>  // b.pmore
    d0cc:	7100051f 	cmp	w8, #0x1
    d0d0:	54000840 	b.eq	d1d8 <__jis_mbtowc+0x198>  // b.none
    d0d4:	7100091f 	cmp	w8, #0x2
    d0d8:	54000141 	b.ne	d100 <__jis_mbtowc+0xc0>  // b.any
    d0dc:	52800020 	mov	w0, #0x1                   	// #1
    d0e0:	b9000080 	str	w0, [x4]
    d0e4:	39401082 	ldrb	w2, [x4, #4]
    d0e8:	0b000140 	add	w0, w10, w0
    d0ec:	394001c3 	ldrb	w3, [x14]
    d0f0:	0b022062 	add	w2, w3, w2, lsl #8
    d0f4:	b9000022 	str	w2, [x1]
    d0f8:	910043ff 	add	sp, sp, #0x10
    d0fc:	d65f03c0 	ret
    d100:	35000788 	cbnz	w8, d1f0 <__jis_mbtowc+0x1b0>
    d104:	b900009f 	str	wzr, [x4]
    d108:	11000540 	add	w0, w10, #0x1
    d10c:	394001e2 	ldrb	w2, [x15]
    d110:	b9000022 	str	w2, [x1]
    d114:	910043ff 	add	sp, sp, #0x10
    d118:	d65f03c0 	ret
    d11c:	7100111f 	cmp	w8, #0x4
    d120:	54000400 	b.eq	d1a0 <__jis_mbtowc+0x160>  // b.none
    d124:	7100151f 	cmp	w8, #0x5
    d128:	54000641 	b.ne	d1f0 <__jis_mbtowc+0x1b0>  // b.any
    d12c:	b900009f 	str	wzr, [x4]
    d130:	52800000 	mov	w0, #0x0                   	// #0
    d134:	b900003f 	str	wzr, [x1]
    d138:	910043ff 	add	sp, sp, #0x10
    d13c:	d65f03c0 	ret
    d140:	52800086 	mov	w6, #0x4                   	// #4
    d144:	710108ff 	cmp	w7, #0x42
    d148:	54fffb00 	b.eq	d0a8 <__jis_mbtowc+0x68>  // b.none
    d14c:	528000a6 	mov	w6, #0x5                   	// #5
    d150:	710128ff 	cmp	w7, #0x4a
    d154:	54fffaa0 	b.eq	d0a8 <__jis_mbtowc+0x68>  // b.none
    d158:	52800066 	mov	w6, #0x3                   	// #3
    d15c:	710100ff 	cmp	w7, #0x40
    d160:	54fffa40 	b.eq	d0a8 <__jis_mbtowc+0x68>  // b.none
    d164:	510084e0 	sub	w0, w7, #0x21
    d168:	7101741f 	cmp	w0, #0x5d
    d16c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    d170:	11001cc6 	add	w6, w6, #0x7
    d174:	d503201f 	nop
    d178:	937d7ca0 	sbfiz	x0, x5, #3, #32
    d17c:	8b25c005 	add	x5, x0, w5, sxtw
    d180:	8b050180 	add	x0, x12, x5
    d184:	8b050165 	add	x5, x11, x5
    d188:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    d18c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    d190:	71000d1f 	cmp	w8, #0x3
    d194:	54fff9a1 	b.ne	d0c8 <__jis_mbtowc+0x88>  // b.any
    d198:	91000529 	add	x9, x9, #0x1
    d19c:	8b09004f 	add	x15, x2, x9
    d1a0:	11000549 	add	w9, w10, #0x1
    d1a4:	aa0903ea 	mov	x10, x9
    d1a8:	eb03013f 	cmp	x9, x3
    d1ac:	54fff683 	b.cc	d07c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    d1b0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    d1b4:	b9000085 	str	w5, [x4]
    d1b8:	17ffffd0 	b	d0f8 <__jis_mbtowc+0xb8>
    d1bc:	528000c6 	mov	w6, #0x6                   	// #6
    d1c0:	34fff747 	cbz	w7, d0a8 <__jis_mbtowc+0x68>
    d1c4:	510084e0 	sub	w0, w7, #0x21
    d1c8:	7101741f 	cmp	w0, #0x5d
    d1cc:	1a9f97e6 	cset	w6, hi  // hi = pmore
    d1d0:	11001cc6 	add	w6, w6, #0x7
    d1d4:	17ffffe9 	b	d178 <__jis_mbtowc+0x138>
    d1d8:	11000549 	add	w9, w10, #0x1
    d1dc:	39001087 	strb	w7, [x4, #4]
    d1e0:	aa0903ea 	mov	x10, x9
    d1e4:	eb03013f 	cmp	x9, x3
    d1e8:	54fff4a3 	b.cc	d07c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    d1ec:	17fffff1 	b	d1b0 <__jis_mbtowc+0x170>
    d1f0:	52801141 	mov	w1, #0x8a                  	// #138
    d1f4:	b90001a1 	str	w1, [x13]
    d1f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    d1fc:	910043ff 	add	sp, sp, #0x10
    d200:	d65f03c0 	ret
    d204:	b900009f 	str	wzr, [x4]
    d208:	52800020 	mov	w0, #0x1                   	// #1
    d20c:	910043ff 	add	sp, sp, #0x10
    d210:	d65f03c0 	ret
    d214:	52800046 	mov	w6, #0x2                   	// #2
    d218:	17ffffa4 	b	d0a8 <__jis_mbtowc+0x68>
    d21c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    d220:	17ffffb6 	b	d0f8 <__jis_mbtowc+0xb8>

000000000000d224 <memchr>:
    d224:	b4000682 	cbz	x2, d2f4 <memchr+0xd0>
    d228:	52808025 	mov	w5, #0x401                 	// #1025
    d22c:	72a80205 	movk	w5, #0x4010, lsl #16
    d230:	4e010c20 	dup	v0.16b, w1
    d234:	927be803 	and	x3, x0, #0xffffffffffffffe0
    d238:	4e040ca5 	dup	v5.4s, w5
    d23c:	f2401009 	ands	x9, x0, #0x1f
    d240:	9240104a 	and	x10, x2, #0x1f
    d244:	54000200 	b.eq	d284 <memchr+0x60>  // b.none
    d248:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    d24c:	d1008124 	sub	x4, x9, #0x20
    d250:	ab040042 	adds	x2, x2, x4
    d254:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    d258:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    d25c:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    d260:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    d264:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    d268:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    d26c:	4e083cc6 	mov	x6, v6.d[0]
    d270:	d37ff924 	lsl	x4, x9, #1
    d274:	9ac424c6 	lsr	x6, x6, x4
    d278:	9ac420c6 	lsl	x6, x6, x4
    d27c:	54000229 	b.ls	d2c0 <memchr+0x9c>  // b.plast
    d280:	b50002c6 	cbnz	x6, d2d8 <memchr+0xb4>
    d284:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    d288:	f1008042 	subs	x2, x2, #0x20
    d28c:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    d290:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    d294:	540000a9 	b.ls	d2a8 <memchr+0x84>  // b.plast
    d298:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    d29c:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    d2a0:	4e083cc6 	mov	x6, v6.d[0]
    d2a4:	b4ffff06 	cbz	x6, d284 <memchr+0x60>
    d2a8:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    d2ac:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    d2b0:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    d2b4:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    d2b8:	4e083cc6 	mov	x6, v6.d[0]
    d2bc:	540000e8 	b.hi	d2d8 <memchr+0xb4>  // b.pmore
    d2c0:	8b090144 	add	x4, x10, x9
    d2c4:	92401084 	and	x4, x4, #0x1f
    d2c8:	d1008084 	sub	x4, x4, #0x20
    d2cc:	cb0407e4 	neg	x4, x4, lsl #1
    d2d0:	9ac420c6 	lsl	x6, x6, x4
    d2d4:	9ac424c6 	lsr	x6, x6, x4
    d2d8:	dac000c6 	rbit	x6, x6
    d2dc:	d1008063 	sub	x3, x3, #0x20
    d2e0:	f10000df 	cmp	x6, #0x0
    d2e4:	dac010c6 	clz	x6, x6
    d2e8:	8b460460 	add	x0, x3, x6, lsr #1
    d2ec:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    d2f0:	d65f03c0 	ret
    d2f4:	d2800000 	mov	x0, #0x0                   	// #0
    d2f8:	d65f03c0 	ret
    d2fc:	d503201f 	nop

000000000000d300 <__malloc_lock>:
    d300:	d65f03c0 	ret
    d304:	d503201f 	nop
    d308:	d503201f 	nop
    d30c:	d503201f 	nop

000000000000d310 <__malloc_unlock>:
    d310:	d65f03c0 	ret
    d314:	d503201f 	nop
    d318:	d503201f 	nop
    d31c:	d503201f 	nop

000000000000d320 <_realloc_r>:
    d320:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    d324:	910003fd 	mov	x29, sp
    d328:	a9025bf5 	stp	x21, x22, [sp, #32]
    d32c:	aa0203f5 	mov	x21, x2
    d330:	b40010e1 	cbz	x1, d54c <_realloc_r+0x22c>
    d334:	a90363f7 	stp	x23, x24, [sp, #48]
    d338:	d1004038 	sub	x24, x1, #0x10
    d33c:	aa0003f7 	mov	x23, x0
    d340:	a90153f3 	stp	x19, x20, [sp, #16]
    d344:	aa0103f3 	mov	x19, x1
    d348:	91005eb4 	add	x20, x21, #0x17
    d34c:	a9046bf9 	stp	x25, x26, [sp, #64]
    d350:	97ffffec 	bl	d300 <__malloc_lock>
    d354:	aa1803f9 	mov	x25, x24
    d358:	f9400700 	ldr	x0, [x24, #8]
    d35c:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    d360:	f100ba9f 	cmp	x20, #0x2e
    d364:	54000908 	b.hi	d484 <_realloc_r+0x164>  // b.pmore
    d368:	52800001 	mov	w1, #0x0                   	// #0
    d36c:	7100003f 	cmp	w1, #0x0
    d370:	d2800414 	mov	x20, #0x20                  	// #32
    d374:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    d378:	54000943 	b.cc	d4a0 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    d37c:	eb1402df 	cmp	x22, x20
    d380:	54000b0a 	b.ge	d4e0 <_realloc_r+0x1c0>  // b.tcont
    d384:	90000021 	adrp	x1, 11000 <__global_locale+0x180>
    d388:	a90573fb 	stp	x27, x28, [sp, #80]
    d38c:	9100a03c 	add	x28, x1, #0x28
    d390:	8b160302 	add	x2, x24, x22
    d394:	f9400b83 	ldr	x3, [x28, #16]
    d398:	f9400441 	ldr	x1, [x2, #8]
    d39c:	eb02007f 	cmp	x3, x2
    d3a0:	54000f60 	b.eq	d58c <_realloc_r+0x26c>  // b.none
    d3a4:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    d3a8:	8b030043 	add	x3, x2, x3
    d3ac:	f9400463 	ldr	x3, [x3, #8]
    d3b0:	37000c23 	tbnz	w3, #0, d534 <_realloc_r+0x214>
    d3b4:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    d3b8:	8b0102c3 	add	x3, x22, x1
    d3bc:	eb03029f 	cmp	x20, x3
    d3c0:	5400084d 	b.le	d4c8 <_realloc_r+0x1a8>
    d3c4:	37000180 	tbnz	w0, #0, d3f4 <_realloc_r+0xd4>
    d3c8:	f85f027b 	ldur	x27, [x19, #-16]
    d3cc:	cb1b031b 	sub	x27, x24, x27
    d3d0:	f9400760 	ldr	x0, [x27, #8]
    d3d4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    d3d8:	8b010001 	add	x1, x0, x1
    d3dc:	8b160023 	add	x3, x1, x22
    d3e0:	eb03029f 	cmp	x20, x3
    d3e4:	540019ad 	b.le	d718 <_realloc_r+0x3f8>
    d3e8:	8b0002c3 	add	x3, x22, x0
    d3ec:	eb03029f 	cmp	x20, x3
    d3f0:	5400152d 	b.le	d694 <_realloc_r+0x374>
    d3f4:	aa1503e1 	mov	x1, x21
    d3f8:	aa1703e0 	mov	x0, x23
    d3fc:	97fffbb9 	bl	c2e0 <_malloc_r>
    d400:	aa0003f5 	mov	x21, x0
    d404:	b40002c0 	cbz	x0, d45c <_realloc_r+0x13c>
    d408:	f9400701 	ldr	x1, [x24, #8]
    d40c:	d1004002 	sub	x2, x0, #0x10
    d410:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    d414:	8b010318 	add	x24, x24, x1
    d418:	eb02031f 	cmp	x24, x2
    d41c:	54001200 	b.eq	d65c <_realloc_r+0x33c>  // b.none
    d420:	d10022c2 	sub	x2, x22, #0x8
    d424:	f101205f 	cmp	x2, #0x48
    d428:	54001728 	b.hi	d70c <_realloc_r+0x3ec>  // b.pmore
    d42c:	f1009c5f 	cmp	x2, #0x27
    d430:	54001208 	b.hi	d670 <_realloc_r+0x350>  // b.pmore
    d434:	aa1303e1 	mov	x1, x19
    d438:	f9400022 	ldr	x2, [x1]
    d43c:	f9000002 	str	x2, [x0]
    d440:	f9400422 	ldr	x2, [x1, #8]
    d444:	f9000402 	str	x2, [x0, #8]
    d448:	f9400821 	ldr	x1, [x1, #16]
    d44c:	f9000801 	str	x1, [x0, #16]
    d450:	aa1303e1 	mov	x1, x19
    d454:	aa1703e0 	mov	x0, x23
    d458:	97fff582 	bl	aa60 <_free_r>
    d45c:	aa1703e0 	mov	x0, x23
    d460:	97ffffac 	bl	d310 <__malloc_unlock>
    d464:	aa1503e0 	mov	x0, x21
    d468:	a94153f3 	ldp	x19, x20, [sp, #16]
    d46c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d470:	a94363f7 	ldp	x23, x24, [sp, #48]
    d474:	a9446bf9 	ldp	x25, x26, [sp, #64]
    d478:	a94573fb 	ldp	x27, x28, [sp, #80]
    d47c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    d480:	d65f03c0 	ret
    d484:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    d488:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    d48c:	eb01029f 	cmp	x20, x1
    d490:	1a9f97e1 	cset	w1, hi  // hi = pmore
    d494:	7100003f 	cmp	w1, #0x0
    d498:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    d49c:	54fff702 	b.cs	d37c <_realloc_r+0x5c>  // b.hs, b.nlast
    d4a0:	52800180 	mov	w0, #0xc                   	// #12
    d4a4:	b90002e0 	str	w0, [x23]
    d4a8:	d2800015 	mov	x21, #0x0                   	// #0
    d4ac:	aa1503e0 	mov	x0, x21
    d4b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    d4b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d4b8:	a94363f7 	ldp	x23, x24, [sp, #48]
    d4bc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    d4c0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    d4c4:	d65f03c0 	ret
    d4c8:	a9410041 	ldp	x1, x0, [x2, #16]
    d4cc:	aa0303f6 	mov	x22, x3
    d4d0:	a94573fb 	ldp	x27, x28, [sp, #80]
    d4d4:	f9000c20 	str	x0, [x1, #24]
    d4d8:	f9000801 	str	x1, [x0, #16]
    d4dc:	d503201f 	nop
    d4e0:	f9400721 	ldr	x1, [x25, #8]
    d4e4:	cb1402c0 	sub	x0, x22, x20
    d4e8:	8b160322 	add	x2, x25, x22
    d4ec:	92400021 	and	x1, x1, #0x1
    d4f0:	f1007c1f 	cmp	x0, #0x1f
    d4f4:	54000348 	b.hi	d55c <_realloc_r+0x23c>  // b.pmore
    d4f8:	aa0102c1 	orr	x1, x22, x1
    d4fc:	f9000721 	str	x1, [x25, #8]
    d500:	f9400440 	ldr	x0, [x2, #8]
    d504:	b2400000 	orr	x0, x0, #0x1
    d508:	f9000440 	str	x0, [x2, #8]
    d50c:	aa1703e0 	mov	x0, x23
    d510:	aa1303f5 	mov	x21, x19
    d514:	97ffff7f 	bl	d310 <__malloc_unlock>
    d518:	aa1503e0 	mov	x0, x21
    d51c:	a94153f3 	ldp	x19, x20, [sp, #16]
    d520:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d524:	a94363f7 	ldp	x23, x24, [sp, #48]
    d528:	a9446bf9 	ldp	x25, x26, [sp, #64]
    d52c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    d530:	d65f03c0 	ret
    d534:	3707f600 	tbnz	w0, #0, d3f4 <_realloc_r+0xd4>
    d538:	f85f027b 	ldur	x27, [x19, #-16]
    d53c:	cb1b031b 	sub	x27, x24, x27
    d540:	f9400760 	ldr	x0, [x27, #8]
    d544:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    d548:	17ffffa8 	b	d3e8 <_realloc_r+0xc8>
    d54c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d550:	aa0203e1 	mov	x1, x2
    d554:	a8c67bfd 	ldp	x29, x30, [sp], #96
    d558:	17fffb62 	b	c2e0 <_malloc_r>
    d55c:	8b140324 	add	x4, x25, x20
    d560:	aa010281 	orr	x1, x20, x1
    d564:	f9000721 	str	x1, [x25, #8]
    d568:	b2400003 	orr	x3, x0, #0x1
    d56c:	91004081 	add	x1, x4, #0x10
    d570:	aa1703e0 	mov	x0, x23
    d574:	f9000483 	str	x3, [x4, #8]
    d578:	f9400443 	ldr	x3, [x2, #8]
    d57c:	b2400063 	orr	x3, x3, #0x1
    d580:	f9000443 	str	x3, [x2, #8]
    d584:	97fff537 	bl	aa60 <_free_r>
    d588:	17ffffe1 	b	d50c <_realloc_r+0x1ec>
    d58c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    d590:	91008283 	add	x3, x20, #0x20
    d594:	8b0102c2 	add	x2, x22, x1
    d598:	eb03005f 	cmp	x2, x3
    d59c:	54000eaa 	b.ge	d770 <_realloc_r+0x450>  // b.tcont
    d5a0:	3707f2a0 	tbnz	w0, #0, d3f4 <_realloc_r+0xd4>
    d5a4:	f85f027b 	ldur	x27, [x19, #-16]
    d5a8:	cb1b031b 	sub	x27, x24, x27
    d5ac:	f9400760 	ldr	x0, [x27, #8]
    d5b0:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    d5b4:	8b010001 	add	x1, x0, x1
    d5b8:	8b16003a 	add	x26, x1, x22
    d5bc:	eb1a007f 	cmp	x3, x26
    d5c0:	54fff14c 	b.gt	d3e8 <_realloc_r+0xc8>
    d5c4:	aa1b03f5 	mov	x21, x27
    d5c8:	d10022c2 	sub	x2, x22, #0x8
    d5cc:	f9400f60 	ldr	x0, [x27, #24]
    d5d0:	f8410ea1 	ldr	x1, [x21, #16]!
    d5d4:	f9000c20 	str	x0, [x1, #24]
    d5d8:	f9000801 	str	x1, [x0, #16]
    d5dc:	f101205f 	cmp	x2, #0x48
    d5e0:	54001128 	b.hi	d804 <_realloc_r+0x4e4>  // b.pmore
    d5e4:	aa1503e0 	mov	x0, x21
    d5e8:	f1009c5f 	cmp	x2, #0x27
    d5ec:	54000129 	b.ls	d610 <_realloc_r+0x2f0>  // b.plast
    d5f0:	f9400260 	ldr	x0, [x19]
    d5f4:	f9000b60 	str	x0, [x27, #16]
    d5f8:	f9400660 	ldr	x0, [x19, #8]
    d5fc:	f9000f60 	str	x0, [x27, #24]
    d600:	f100dc5f 	cmp	x2, #0x37
    d604:	54001088 	b.hi	d814 <_realloc_r+0x4f4>  // b.pmore
    d608:	91004273 	add	x19, x19, #0x10
    d60c:	91008360 	add	x0, x27, #0x20
    d610:	f9400261 	ldr	x1, [x19]
    d614:	f9000001 	str	x1, [x0]
    d618:	f9400661 	ldr	x1, [x19, #8]
    d61c:	f9000401 	str	x1, [x0, #8]
    d620:	f9400a61 	ldr	x1, [x19, #16]
    d624:	f9000801 	str	x1, [x0, #16]
    d628:	8b140362 	add	x2, x27, x20
    d62c:	cb140341 	sub	x1, x26, x20
    d630:	f9000b82 	str	x2, [x28, #16]
    d634:	b2400021 	orr	x1, x1, #0x1
    d638:	aa1703e0 	mov	x0, x23
    d63c:	f9000441 	str	x1, [x2, #8]
    d640:	f9400761 	ldr	x1, [x27, #8]
    d644:	92400021 	and	x1, x1, #0x1
    d648:	aa140034 	orr	x20, x1, x20
    d64c:	f9000774 	str	x20, [x27, #8]
    d650:	97ffff30 	bl	d310 <__malloc_unlock>
    d654:	a94573fb 	ldp	x27, x28, [sp, #80]
    d658:	17ffffb0 	b	d518 <_realloc_r+0x1f8>
    d65c:	f9400700 	ldr	x0, [x24, #8]
    d660:	a94573fb 	ldp	x27, x28, [sp, #80]
    d664:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    d668:	8b0002d6 	add	x22, x22, x0
    d66c:	17ffff9d 	b	d4e0 <_realloc_r+0x1c0>
    d670:	f9400260 	ldr	x0, [x19]
    d674:	f90002a0 	str	x0, [x21]
    d678:	f9400660 	ldr	x0, [x19, #8]
    d67c:	f90006a0 	str	x0, [x21, #8]
    d680:	f100dc5f 	cmp	x2, #0x37
    d684:	54000648 	b.hi	d74c <_realloc_r+0x42c>  // b.pmore
    d688:	91004261 	add	x1, x19, #0x10
    d68c:	910042a0 	add	x0, x21, #0x10
    d690:	17ffff6a 	b	d438 <_realloc_r+0x118>
    d694:	aa1b03e0 	mov	x0, x27
    d698:	d10022c2 	sub	x2, x22, #0x8
    d69c:	f8410c04 	ldr	x4, [x0, #16]!
    d6a0:	f9400f61 	ldr	x1, [x27, #24]
    d6a4:	f9000c81 	str	x1, [x4, #24]
    d6a8:	f9000824 	str	x4, [x1, #16]
    d6ac:	f101205f 	cmp	x2, #0x48
    d6b0:	54000408 	b.hi	d730 <_realloc_r+0x410>  // b.pmore
    d6b4:	aa0003e1 	mov	x1, x0
    d6b8:	f1009c5f 	cmp	x2, #0x27
    d6bc:	54000129 	b.ls	d6e0 <_realloc_r+0x3c0>  // b.plast
    d6c0:	f9400261 	ldr	x1, [x19]
    d6c4:	f9000b61 	str	x1, [x27, #16]
    d6c8:	f9400661 	ldr	x1, [x19, #8]
    d6cc:	f9000f61 	str	x1, [x27, #24]
    d6d0:	f100dc5f 	cmp	x2, #0x37
    d6d4:	540006a8 	b.hi	d7a8 <_realloc_r+0x488>  // b.pmore
    d6d8:	91004273 	add	x19, x19, #0x10
    d6dc:	91008361 	add	x1, x27, #0x20
    d6e0:	f9400262 	ldr	x2, [x19]
    d6e4:	aa1b03f9 	mov	x25, x27
    d6e8:	a94573fb 	ldp	x27, x28, [sp, #80]
    d6ec:	f9000022 	str	x2, [x1]
    d6f0:	aa0303f6 	mov	x22, x3
    d6f4:	f9400662 	ldr	x2, [x19, #8]
    d6f8:	f9000422 	str	x2, [x1, #8]
    d6fc:	f9400a62 	ldr	x2, [x19, #16]
    d700:	aa0003f3 	mov	x19, x0
    d704:	f9000822 	str	x2, [x1, #16]
    d708:	17ffff76 	b	d4e0 <_realloc_r+0x1c0>
    d70c:	aa1303e1 	mov	x1, x19
    d710:	97ffe87c 	bl	7900 <memmove>
    d714:	17ffff4f 	b	d450 <_realloc_r+0x130>
    d718:	a9410444 	ldp	x4, x1, [x2, #16]
    d71c:	f9000c81 	str	x1, [x4, #24]
    d720:	aa1b03e0 	mov	x0, x27
    d724:	d10022c2 	sub	x2, x22, #0x8
    d728:	f9000824 	str	x4, [x1, #16]
    d72c:	17ffffdc 	b	d69c <_realloc_r+0x37c>
    d730:	aa1303e1 	mov	x1, x19
    d734:	aa0303f6 	mov	x22, x3
    d738:	aa1b03f9 	mov	x25, x27
    d73c:	aa0003f3 	mov	x19, x0
    d740:	97ffe870 	bl	7900 <memmove>
    d744:	a94573fb 	ldp	x27, x28, [sp, #80]
    d748:	17ffff66 	b	d4e0 <_realloc_r+0x1c0>
    d74c:	f9400a60 	ldr	x0, [x19, #16]
    d750:	f9000aa0 	str	x0, [x21, #16]
    d754:	f9400e60 	ldr	x0, [x19, #24]
    d758:	f9000ea0 	str	x0, [x21, #24]
    d75c:	f101205f 	cmp	x2, #0x48
    d760:	54000360 	b.eq	d7cc <_realloc_r+0x4ac>  // b.none
    d764:	91008261 	add	x1, x19, #0x20
    d768:	910082a0 	add	x0, x21, #0x20
    d76c:	17ffff33 	b	d438 <_realloc_r+0x118>
    d770:	8b140303 	add	x3, x24, x20
    d774:	cb140041 	sub	x1, x2, x20
    d778:	f9000b83 	str	x3, [x28, #16]
    d77c:	b2400021 	orr	x1, x1, #0x1
    d780:	aa1703e0 	mov	x0, x23
    d784:	aa1303f5 	mov	x21, x19
    d788:	f9000461 	str	x1, [x3, #8]
    d78c:	f9400701 	ldr	x1, [x24, #8]
    d790:	92400021 	and	x1, x1, #0x1
    d794:	aa140034 	orr	x20, x1, x20
    d798:	f9000714 	str	x20, [x24, #8]
    d79c:	97fffedd 	bl	d310 <__malloc_unlock>
    d7a0:	a94573fb 	ldp	x27, x28, [sp, #80]
    d7a4:	17ffff5d 	b	d518 <_realloc_r+0x1f8>
    d7a8:	f9400a61 	ldr	x1, [x19, #16]
    d7ac:	f9001361 	str	x1, [x27, #32]
    d7b0:	f9400e61 	ldr	x1, [x19, #24]
    d7b4:	f9001761 	str	x1, [x27, #40]
    d7b8:	f101205f 	cmp	x2, #0x48
    d7bc:	54000160 	b.eq	d7e8 <_realloc_r+0x4c8>  // b.none
    d7c0:	91008273 	add	x19, x19, #0x20
    d7c4:	9100c361 	add	x1, x27, #0x30
    d7c8:	17ffffc6 	b	d6e0 <_realloc_r+0x3c0>
    d7cc:	f9401260 	ldr	x0, [x19, #32]
    d7d0:	f90012a0 	str	x0, [x21, #32]
    d7d4:	9100c261 	add	x1, x19, #0x30
    d7d8:	9100c2a0 	add	x0, x21, #0x30
    d7dc:	f9401662 	ldr	x2, [x19, #40]
    d7e0:	f90016a2 	str	x2, [x21, #40]
    d7e4:	17ffff15 	b	d438 <_realloc_r+0x118>
    d7e8:	f9401261 	ldr	x1, [x19, #32]
    d7ec:	f9001b61 	str	x1, [x27, #48]
    d7f0:	9100c273 	add	x19, x19, #0x30
    d7f4:	91010361 	add	x1, x27, #0x40
    d7f8:	f85f8262 	ldur	x2, [x19, #-8]
    d7fc:	f9001f62 	str	x2, [x27, #56]
    d800:	17ffffb8 	b	d6e0 <_realloc_r+0x3c0>
    d804:	aa1303e1 	mov	x1, x19
    d808:	aa1503e0 	mov	x0, x21
    d80c:	97ffe83d 	bl	7900 <memmove>
    d810:	17ffff86 	b	d628 <_realloc_r+0x308>
    d814:	f9400a60 	ldr	x0, [x19, #16]
    d818:	f9001360 	str	x0, [x27, #32]
    d81c:	f9400e60 	ldr	x0, [x19, #24]
    d820:	f9001760 	str	x0, [x27, #40]
    d824:	f101205f 	cmp	x2, #0x48
    d828:	54000080 	b.eq	d838 <_realloc_r+0x518>  // b.none
    d82c:	91008273 	add	x19, x19, #0x20
    d830:	9100c360 	add	x0, x27, #0x30
    d834:	17ffff77 	b	d610 <_realloc_r+0x2f0>
    d838:	f9401260 	ldr	x0, [x19, #32]
    d83c:	f9001b60 	str	x0, [x27, #48]
    d840:	9100c273 	add	x19, x19, #0x30
    d844:	91010360 	add	x0, x27, #0x40
    d848:	f85f8261 	ldur	x1, [x19, #-8]
    d84c:	f9001f61 	str	x1, [x27, #56]
    d850:	17ffff70 	b	d610 <_realloc_r+0x2f0>
    d854:	d503201f 	nop
    d858:	d503201f 	nop
    d85c:	d503201f 	nop

000000000000d860 <_sbrk_r>:
    d860:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d864:	910003fd 	mov	x29, sp
    d868:	a90153f3 	stp	x19, x20, [sp, #16]
    d86c:	90000034 	adrp	x20, 11000 <__global_locale+0x180>
    d870:	aa0003f3 	mov	x19, x0
    d874:	b90f7a9f 	str	wzr, [x20, #3960]
    d878:	aa0103e0 	mov	x0, x1
    d87c:	97ffe6f5 	bl	7450 <_sbrk>
    d880:	b100041f 	cmn	x0, #0x1
    d884:	54000080 	b.eq	d894 <_sbrk_r+0x34>  // b.none
    d888:	a94153f3 	ldp	x19, x20, [sp, #16]
    d88c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d890:	d65f03c0 	ret
    d894:	b94f7a81 	ldr	w1, [x20, #3960]
    d898:	34ffff81 	cbz	w1, d888 <_sbrk_r+0x28>
    d89c:	b9000261 	str	w1, [x19]
    d8a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    d8a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d8a8:	d65f03c0 	ret
    d8ac:	d503201f 	nop

000000000000d8b0 <_init_signal_r>:
    d8b0:	f9428c01 	ldr	x1, [x0, #1304]
    d8b4:	b4000061 	cbz	x1, d8c0 <_init_signal_r+0x10>
    d8b8:	52800000 	mov	w0, #0x0                   	// #0
    d8bc:	d65f03c0 	ret
    d8c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d8c4:	d2802001 	mov	x1, #0x100                 	// #256
    d8c8:	910003fd 	mov	x29, sp
    d8cc:	f9000bf3 	str	x19, [sp, #16]
    d8d0:	aa0003f3 	mov	x19, x0
    d8d4:	97fffa83 	bl	c2e0 <_malloc_r>
    d8d8:	f9028e60 	str	x0, [x19, #1304]
    d8dc:	b4000140 	cbz	x0, d904 <_init_signal_r+0x54>
    d8e0:	91040001 	add	x1, x0, #0x100
    d8e4:	d503201f 	nop
    d8e8:	f800841f 	str	xzr, [x0], #8
    d8ec:	eb01001f 	cmp	x0, x1
    d8f0:	54ffffc1 	b.ne	d8e8 <_init_signal_r+0x38>  // b.any
    d8f4:	52800000 	mov	w0, #0x0                   	// #0
    d8f8:	f9400bf3 	ldr	x19, [sp, #16]
    d8fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d900:	d65f03c0 	ret
    d904:	12800000 	mov	w0, #0xffffffff            	// #-1
    d908:	17fffffc 	b	d8f8 <_init_signal_r+0x48>
    d90c:	d503201f 	nop

000000000000d910 <_signal_r>:
    d910:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    d914:	910003fd 	mov	x29, sp
    d918:	a90153f3 	stp	x19, x20, [sp, #16]
    d91c:	93407c33 	sxtw	x19, w1
    d920:	aa0003f4 	mov	x20, x0
    d924:	71007e7f 	cmp	w19, #0x1f
    d928:	54000108 	b.hi	d948 <_signal_r+0x38>  // b.pmore
    d92c:	f9428c04 	ldr	x4, [x0, #1304]
    d930:	b4000184 	cbz	x4, d960 <_signal_r+0x50>
    d934:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    d938:	f8337882 	str	x2, [x4, x19, lsl #3]
    d93c:	a94153f3 	ldp	x19, x20, [sp, #16]
    d940:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d944:	d65f03c0 	ret
    d948:	528002c1 	mov	w1, #0x16                  	// #22
    d94c:	b9000281 	str	w1, [x20]
    d950:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    d954:	a94153f3 	ldp	x19, x20, [sp, #16]
    d958:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d95c:	d65f03c0 	ret
    d960:	d2802001 	mov	x1, #0x100                 	// #256
    d964:	f90017e2 	str	x2, [sp, #40]
    d968:	97fffa5e 	bl	c2e0 <_malloc_r>
    d96c:	f9028e80 	str	x0, [x20, #1304]
    d970:	aa0003e4 	mov	x4, x0
    d974:	b4000120 	cbz	x0, d998 <_signal_r+0x88>
    d978:	f94017e2 	ldr	x2, [sp, #40]
    d97c:	aa0003e3 	mov	x3, x0
    d980:	91040001 	add	x1, x0, #0x100
    d984:	d503201f 	nop
    d988:	f800847f 	str	xzr, [x3], #8
    d98c:	eb03003f 	cmp	x1, x3
    d990:	54ffffc1 	b.ne	d988 <_signal_r+0x78>  // b.any
    d994:	17ffffe8 	b	d934 <_signal_r+0x24>
    d998:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    d99c:	17ffffe8 	b	d93c <_signal_r+0x2c>

000000000000d9a0 <_raise_r>:
    d9a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d9a4:	910003fd 	mov	x29, sp
    d9a8:	a90153f3 	stp	x19, x20, [sp, #16]
    d9ac:	aa0003f4 	mov	x20, x0
    d9b0:	71007c3f 	cmp	w1, #0x1f
    d9b4:	54000488 	b.hi	da44 <_raise_r+0xa4>  // b.pmore
    d9b8:	f9428c00 	ldr	x0, [x0, #1304]
    d9bc:	2a0103f3 	mov	w19, w1
    d9c0:	b40001e0 	cbz	x0, d9fc <_raise_r+0x5c>
    d9c4:	93407c22 	sxtw	x2, w1
    d9c8:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    d9cc:	b4000181 	cbz	x1, d9fc <_raise_r+0x5c>
    d9d0:	f100043f 	cmp	x1, #0x1
    d9d4:	54000300 	b.eq	da34 <_raise_r+0x94>  // b.none
    d9d8:	b100043f 	cmn	x1, #0x1
    d9dc:	54000200 	b.eq	da1c <_raise_r+0x7c>  // b.none
    d9e0:	f822781f 	str	xzr, [x0, x2, lsl #3]
    d9e4:	2a1303e0 	mov	w0, w19
    d9e8:	d63f0020 	blr	x1
    d9ec:	52800000 	mov	w0, #0x0                   	// #0
    d9f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    d9f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d9f8:	d65f03c0 	ret
    d9fc:	aa1403e0 	mov	x0, x20
    da00:	940000fc 	bl	ddf0 <_getpid_r>
    da04:	2a1303e2 	mov	w2, w19
    da08:	2a0003e1 	mov	w1, w0
    da0c:	aa1403e0 	mov	x0, x20
    da10:	a94153f3 	ldp	x19, x20, [sp, #16]
    da14:	a8c27bfd 	ldp	x29, x30, [sp], #32
    da18:	140000e2 	b	dda0 <_kill_r>
    da1c:	528002c1 	mov	w1, #0x16                  	// #22
    da20:	b9000281 	str	w1, [x20]
    da24:	52800020 	mov	w0, #0x1                   	// #1
    da28:	a94153f3 	ldp	x19, x20, [sp, #16]
    da2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    da30:	d65f03c0 	ret
    da34:	52800000 	mov	w0, #0x0                   	// #0
    da38:	a94153f3 	ldp	x19, x20, [sp, #16]
    da3c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    da40:	d65f03c0 	ret
    da44:	528002c1 	mov	w1, #0x16                  	// #22
    da48:	12800000 	mov	w0, #0xffffffff            	// #-1
    da4c:	b9000281 	str	w1, [x20]
    da50:	17ffffe8 	b	d9f0 <_raise_r+0x50>
    da54:	d503201f 	nop
    da58:	d503201f 	nop
    da5c:	d503201f 	nop

000000000000da60 <__sigtramp_r>:
    da60:	71007c3f 	cmp	w1, #0x1f
    da64:	540005a8 	b.hi	db18 <__sigtramp_r+0xb8>  // b.pmore
    da68:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    da6c:	910003fd 	mov	x29, sp
    da70:	f9428c03 	ldr	x3, [x0, #1304]
    da74:	a90153f3 	stp	x19, x20, [sp, #16]
    da78:	2a0103f3 	mov	w19, w1
    da7c:	aa0003f4 	mov	x20, x0
    da80:	b4000263 	cbz	x3, dacc <__sigtramp_r+0x6c>
    da84:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    da88:	8b33cc63 	add	x3, x3, w19, sxtw #3
    da8c:	b4000181 	cbz	x1, dabc <__sigtramp_r+0x5c>
    da90:	b100043f 	cmn	x1, #0x1
    da94:	540003a0 	b.eq	db08 <__sigtramp_r+0xa8>  // b.none
    da98:	f100043f 	cmp	x1, #0x1
    da9c:	540002e0 	b.eq	daf8 <__sigtramp_r+0x98>  // b.none
    daa0:	f900007f 	str	xzr, [x3]
    daa4:	2a1303e0 	mov	w0, w19
    daa8:	d63f0020 	blr	x1
    daac:	52800000 	mov	w0, #0x0                   	// #0
    dab0:	a94153f3 	ldp	x19, x20, [sp, #16]
    dab4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dab8:	d65f03c0 	ret
    dabc:	52800020 	mov	w0, #0x1                   	// #1
    dac0:	a94153f3 	ldp	x19, x20, [sp, #16]
    dac4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dac8:	d65f03c0 	ret
    dacc:	d2802001 	mov	x1, #0x100                 	// #256
    dad0:	97fffa04 	bl	c2e0 <_malloc_r>
    dad4:	f9028e80 	str	x0, [x20, #1304]
    dad8:	aa0003e3 	mov	x3, x0
    dadc:	b40001a0 	cbz	x0, db10 <__sigtramp_r+0xb0>
    dae0:	aa0003e2 	mov	x2, x0
    dae4:	91040000 	add	x0, x0, #0x100
    dae8:	f800845f 	str	xzr, [x2], #8
    daec:	eb00005f 	cmp	x2, x0
    daf0:	54ffffc1 	b.ne	dae8 <__sigtramp_r+0x88>  // b.any
    daf4:	17ffffe4 	b	da84 <__sigtramp_r+0x24>
    daf8:	52800060 	mov	w0, #0x3                   	// #3
    dafc:	a94153f3 	ldp	x19, x20, [sp, #16]
    db00:	a8c27bfd 	ldp	x29, x30, [sp], #32
    db04:	d65f03c0 	ret
    db08:	52800040 	mov	w0, #0x2                   	// #2
    db0c:	17ffffe9 	b	dab0 <__sigtramp_r+0x50>
    db10:	12800000 	mov	w0, #0xffffffff            	// #-1
    db14:	17ffffe7 	b	dab0 <__sigtramp_r+0x50>
    db18:	12800000 	mov	w0, #0xffffffff            	// #-1
    db1c:	d65f03c0 	ret

000000000000db20 <raise>:
    db20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    db24:	f0000001 	adrp	x1, 10000 <__func__.0+0x10>
    db28:	910003fd 	mov	x29, sp
    db2c:	a90153f3 	stp	x19, x20, [sp, #16]
    db30:	f9438834 	ldr	x20, [x1, #1808]
    db34:	71007c1f 	cmp	w0, #0x1f
    db38:	54000468 	b.hi	dbc4 <raise+0xa4>  // b.pmore
    db3c:	f9428e82 	ldr	x2, [x20, #1304]
    db40:	2a0003f3 	mov	w19, w0
    db44:	b40001c2 	cbz	x2, db7c <raise+0x5c>
    db48:	93407c03 	sxtw	x3, w0
    db4c:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    db50:	b4000161 	cbz	x1, db7c <raise+0x5c>
    db54:	f100043f 	cmp	x1, #0x1
    db58:	540002e0 	b.eq	dbb4 <raise+0x94>  // b.none
    db5c:	b100043f 	cmn	x1, #0x1
    db60:	540001e0 	b.eq	db9c <raise+0x7c>  // b.none
    db64:	f823785f 	str	xzr, [x2, x3, lsl #3]
    db68:	d63f0020 	blr	x1
    db6c:	52800000 	mov	w0, #0x0                   	// #0
    db70:	a94153f3 	ldp	x19, x20, [sp, #16]
    db74:	a8c27bfd 	ldp	x29, x30, [sp], #32
    db78:	d65f03c0 	ret
    db7c:	aa1403e0 	mov	x0, x20
    db80:	9400009c 	bl	ddf0 <_getpid_r>
    db84:	2a1303e2 	mov	w2, w19
    db88:	2a0003e1 	mov	w1, w0
    db8c:	aa1403e0 	mov	x0, x20
    db90:	a94153f3 	ldp	x19, x20, [sp, #16]
    db94:	a8c27bfd 	ldp	x29, x30, [sp], #32
    db98:	14000082 	b	dda0 <_kill_r>
    db9c:	528002c1 	mov	w1, #0x16                  	// #22
    dba0:	b9000281 	str	w1, [x20]
    dba4:	52800020 	mov	w0, #0x1                   	// #1
    dba8:	a94153f3 	ldp	x19, x20, [sp, #16]
    dbac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dbb0:	d65f03c0 	ret
    dbb4:	52800000 	mov	w0, #0x0                   	// #0
    dbb8:	a94153f3 	ldp	x19, x20, [sp, #16]
    dbbc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dbc0:	d65f03c0 	ret
    dbc4:	528002c1 	mov	w1, #0x16                  	// #22
    dbc8:	12800000 	mov	w0, #0xffffffff            	// #-1
    dbcc:	b9000281 	str	w1, [x20]
    dbd0:	17ffffe8 	b	db70 <raise+0x50>
    dbd4:	d503201f 	nop
    dbd8:	d503201f 	nop
    dbdc:	d503201f 	nop

000000000000dbe0 <signal>:
    dbe0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    dbe4:	f0000002 	adrp	x2, 10000 <__func__.0+0x10>
    dbe8:	910003fd 	mov	x29, sp
    dbec:	a90153f3 	stp	x19, x20, [sp, #16]
    dbf0:	93407c13 	sxtw	x19, w0
    dbf4:	f90013f5 	str	x21, [sp, #32]
    dbf8:	f9438855 	ldr	x21, [x2, #1808]
    dbfc:	71007e7f 	cmp	w19, #0x1f
    dc00:	54000148 	b.hi	dc28 <signal+0x48>  // b.pmore
    dc04:	aa0103f4 	mov	x20, x1
    dc08:	f9428ea1 	ldr	x1, [x21, #1304]
    dc0c:	b40001c1 	cbz	x1, dc44 <signal+0x64>
    dc10:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    dc14:	f8337834 	str	x20, [x1, x19, lsl #3]
    dc18:	a94153f3 	ldp	x19, x20, [sp, #16]
    dc1c:	f94013f5 	ldr	x21, [sp, #32]
    dc20:	a8c37bfd 	ldp	x29, x30, [sp], #48
    dc24:	d65f03c0 	ret
    dc28:	528002c1 	mov	w1, #0x16                  	// #22
    dc2c:	b90002a1 	str	w1, [x21]
    dc30:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    dc34:	a94153f3 	ldp	x19, x20, [sp, #16]
    dc38:	f94013f5 	ldr	x21, [sp, #32]
    dc3c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    dc40:	d65f03c0 	ret
    dc44:	d2802001 	mov	x1, #0x100                 	// #256
    dc48:	aa1503e0 	mov	x0, x21
    dc4c:	97fff9a5 	bl	c2e0 <_malloc_r>
    dc50:	f9028ea0 	str	x0, [x21, #1304]
    dc54:	aa0003e1 	mov	x1, x0
    dc58:	b4000100 	cbz	x0, dc78 <signal+0x98>
    dc5c:	aa0003e2 	mov	x2, x0
    dc60:	91040003 	add	x3, x0, #0x100
    dc64:	d503201f 	nop
    dc68:	f800845f 	str	xzr, [x2], #8
    dc6c:	eb02007f 	cmp	x3, x2
    dc70:	54ffffc1 	b.ne	dc68 <signal+0x88>  // b.any
    dc74:	17ffffe7 	b	dc10 <signal+0x30>
    dc78:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    dc7c:	17ffffe7 	b	dc18 <signal+0x38>

000000000000dc80 <_init_signal>:
    dc80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    dc84:	f0000000 	adrp	x0, 10000 <__func__.0+0x10>
    dc88:	910003fd 	mov	x29, sp
    dc8c:	f9000bf3 	str	x19, [sp, #16]
    dc90:	f9438813 	ldr	x19, [x0, #1808]
    dc94:	f9428e60 	ldr	x0, [x19, #1304]
    dc98:	b40000a0 	cbz	x0, dcac <_init_signal+0x2c>
    dc9c:	52800000 	mov	w0, #0x0                   	// #0
    dca0:	f9400bf3 	ldr	x19, [sp, #16]
    dca4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dca8:	d65f03c0 	ret
    dcac:	aa1303e0 	mov	x0, x19
    dcb0:	d2802001 	mov	x1, #0x100                 	// #256
    dcb4:	97fff98b 	bl	c2e0 <_malloc_r>
    dcb8:	f9028e60 	str	x0, [x19, #1304]
    dcbc:	b40000e0 	cbz	x0, dcd8 <_init_signal+0x58>
    dcc0:	91040001 	add	x1, x0, #0x100
    dcc4:	d503201f 	nop
    dcc8:	f800841f 	str	xzr, [x0], #8
    dccc:	eb01001f 	cmp	x0, x1
    dcd0:	54ffffc1 	b.ne	dcc8 <_init_signal+0x48>  // b.any
    dcd4:	17fffff2 	b	dc9c <_init_signal+0x1c>
    dcd8:	12800000 	mov	w0, #0xffffffff            	// #-1
    dcdc:	17fffff1 	b	dca0 <_init_signal+0x20>

000000000000dce0 <__sigtramp>:
    dce0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    dce4:	f0000001 	adrp	x1, 10000 <__func__.0+0x10>
    dce8:	910003fd 	mov	x29, sp
    dcec:	a90153f3 	stp	x19, x20, [sp, #16]
    dcf0:	f9438834 	ldr	x20, [x1, #1808]
    dcf4:	71007c1f 	cmp	w0, #0x1f
    dcf8:	54000508 	b.hi	dd98 <__sigtramp+0xb8>  // b.pmore
    dcfc:	f9428e82 	ldr	x2, [x20, #1304]
    dd00:	2a0003f3 	mov	w19, w0
    dd04:	b4000262 	cbz	x2, dd50 <__sigtramp+0x70>
    dd08:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    dd0c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    dd10:	b4000181 	cbz	x1, dd40 <__sigtramp+0x60>
    dd14:	b100043f 	cmn	x1, #0x1
    dd18:	540003c0 	b.eq	dd90 <__sigtramp+0xb0>  // b.none
    dd1c:	f100043f 	cmp	x1, #0x1
    dd20:	54000300 	b.eq	dd80 <__sigtramp+0xa0>  // b.none
    dd24:	f900005f 	str	xzr, [x2]
    dd28:	2a1303e0 	mov	w0, w19
    dd2c:	d63f0020 	blr	x1
    dd30:	52800000 	mov	w0, #0x0                   	// #0
    dd34:	a94153f3 	ldp	x19, x20, [sp, #16]
    dd38:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dd3c:	d65f03c0 	ret
    dd40:	52800020 	mov	w0, #0x1                   	// #1
    dd44:	a94153f3 	ldp	x19, x20, [sp, #16]
    dd48:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dd4c:	d65f03c0 	ret
    dd50:	aa1403e0 	mov	x0, x20
    dd54:	d2802001 	mov	x1, #0x100                 	// #256
    dd58:	97fff962 	bl	c2e0 <_malloc_r>
    dd5c:	f9028e80 	str	x0, [x20, #1304]
    dd60:	aa0003e2 	mov	x2, x0
    dd64:	b40001a0 	cbz	x0, dd98 <__sigtramp+0xb8>
    dd68:	aa0003e1 	mov	x1, x0
    dd6c:	91040000 	add	x0, x0, #0x100
    dd70:	f800843f 	str	xzr, [x1], #8
    dd74:	eb00003f 	cmp	x1, x0
    dd78:	54ffffc1 	b.ne	dd70 <__sigtramp+0x90>  // b.any
    dd7c:	17ffffe3 	b	dd08 <__sigtramp+0x28>
    dd80:	52800060 	mov	w0, #0x3                   	// #3
    dd84:	a94153f3 	ldp	x19, x20, [sp, #16]
    dd88:	a8c27bfd 	ldp	x29, x30, [sp], #32
    dd8c:	d65f03c0 	ret
    dd90:	52800040 	mov	w0, #0x2                   	// #2
    dd94:	17ffffe8 	b	dd34 <__sigtramp+0x54>
    dd98:	12800000 	mov	w0, #0xffffffff            	// #-1
    dd9c:	17ffffe6 	b	dd34 <__sigtramp+0x54>

000000000000dda0 <_kill_r>:
    dda0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    dda4:	910003fd 	mov	x29, sp
    dda8:	a90153f3 	stp	x19, x20, [sp, #16]
    ddac:	90000034 	adrp	x20, 11000 <__global_locale+0x180>
    ddb0:	aa0003f3 	mov	x19, x0
    ddb4:	b90f7a9f 	str	wzr, [x20, #3960]
    ddb8:	2a0103e0 	mov	w0, w1
    ddbc:	2a0203e1 	mov	w1, w2
    ddc0:	97ffe5c8 	bl	74e0 <_kill>
    ddc4:	3100041f 	cmn	w0, #0x1
    ddc8:	54000080 	b.eq	ddd8 <_kill_r+0x38>  // b.none
    ddcc:	a94153f3 	ldp	x19, x20, [sp, #16]
    ddd0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ddd4:	d65f03c0 	ret
    ddd8:	b94f7a81 	ldr	w1, [x20, #3960]
    dddc:	34ffff81 	cbz	w1, ddcc <_kill_r+0x2c>
    dde0:	b9000261 	str	w1, [x19]
    dde4:	a94153f3 	ldp	x19, x20, [sp, #16]
    dde8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ddec:	d65f03c0 	ret

000000000000ddf0 <_getpid_r>:
    ddf0:	17ffe5c0 	b	74f0 <_getpid>
    ddf4:	d503201f 	nop
    ddf8:	d503201f 	nop
    ddfc:	d503201f 	nop

000000000000de00 <__sread>:
    de00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    de04:	93407c63 	sxtw	x3, w3
    de08:	910003fd 	mov	x29, sp
    de0c:	f9000bf3 	str	x19, [sp, #16]
    de10:	aa0103f3 	mov	x19, x1
    de14:	79c02421 	ldrsh	w1, [x1, #18]
    de18:	940004f2 	bl	f1e0 <_read_r>
    de1c:	b7f800e0 	tbnz	x0, #63, de38 <__sread+0x38>
    de20:	f9404a61 	ldr	x1, [x19, #144]
    de24:	8b000021 	add	x1, x1, x0
    de28:	f9004a61 	str	x1, [x19, #144]
    de2c:	f9400bf3 	ldr	x19, [sp, #16]
    de30:	a8c27bfd 	ldp	x29, x30, [sp], #32
    de34:	d65f03c0 	ret
    de38:	79402261 	ldrh	w1, [x19, #16]
    de3c:	12137821 	and	w1, w1, #0xffffefff
    de40:	79002261 	strh	w1, [x19, #16]
    de44:	f9400bf3 	ldr	x19, [sp, #16]
    de48:	a8c27bfd 	ldp	x29, x30, [sp], #32
    de4c:	d65f03c0 	ret

000000000000de50 <__seofread>:
    de50:	52800000 	mov	w0, #0x0                   	// #0
    de54:	d65f03c0 	ret
    de58:	d503201f 	nop
    de5c:	d503201f 	nop

000000000000de60 <__swrite>:
    de60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    de64:	910003fd 	mov	x29, sp
    de68:	79c02024 	ldrsh	w4, [x1, #16]
    de6c:	a90153f3 	stp	x19, x20, [sp, #16]
    de70:	aa0103f3 	mov	x19, x1
    de74:	aa0003f4 	mov	x20, x0
    de78:	a9025bf5 	stp	x21, x22, [sp, #32]
    de7c:	aa0203f5 	mov	x21, x2
    de80:	2a0303f6 	mov	w22, w3
    de84:	37400184 	tbnz	w4, #8, deb4 <__swrite+0x54>
    de88:	79c02661 	ldrsh	w1, [x19, #18]
    de8c:	12137884 	and	w4, w4, #0xffffefff
    de90:	79002264 	strh	w4, [x19, #16]
    de94:	93407ec3 	sxtw	x3, w22
    de98:	aa1503e2 	mov	x2, x21
    de9c:	aa1403e0 	mov	x0, x20
    dea0:	940003b0 	bl	ed60 <_write_r>
    dea4:	a94153f3 	ldp	x19, x20, [sp, #16]
    dea8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    deac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    deb0:	d65f03c0 	ret
    deb4:	79c02421 	ldrsh	w1, [x1, #18]
    deb8:	52800043 	mov	w3, #0x2                   	// #2
    debc:	d2800002 	mov	x2, #0x0                   	// #0
    dec0:	940004b0 	bl	f180 <_lseek_r>
    dec4:	79c02264 	ldrsh	w4, [x19, #16]
    dec8:	17fffff0 	b	de88 <__swrite+0x28>
    decc:	d503201f 	nop

000000000000ded0 <__sseek>:
    ded0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ded4:	910003fd 	mov	x29, sp
    ded8:	f9000bf3 	str	x19, [sp, #16]
    dedc:	aa0103f3 	mov	x19, x1
    dee0:	79c02421 	ldrsh	w1, [x1, #18]
    dee4:	940004a7 	bl	f180 <_lseek_r>
    dee8:	79402261 	ldrh	w1, [x19, #16]
    deec:	b100041f 	cmn	x0, #0x1
    def0:	540000e0 	b.eq	df0c <__sseek+0x3c>  // b.none
    def4:	32140021 	orr	w1, w1, #0x1000
    def8:	79002261 	strh	w1, [x19, #16]
    defc:	f9004a60 	str	x0, [x19, #144]
    df00:	f9400bf3 	ldr	x19, [sp, #16]
    df04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    df08:	d65f03c0 	ret
    df0c:	12137821 	and	w1, w1, #0xffffefff
    df10:	79002261 	strh	w1, [x19, #16]
    df14:	f9400bf3 	ldr	x19, [sp, #16]
    df18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    df1c:	d65f03c0 	ret

000000000000df20 <__sclose>:
    df20:	79c02421 	ldrsh	w1, [x1, #18]
    df24:	140003a7 	b	edc0 <_close_r>
    df28:	d503201f 	nop
    df2c:	d503201f 	nop

000000000000df30 <strcasecmp>:
    df30:	f0000006 	adrp	x6, 10000 <__func__.0+0x10>
    df34:	aa0003e8 	mov	x8, x0
    df38:	9117a4c6 	add	x6, x6, #0x5e9
    df3c:	d2800003 	mov	x3, #0x0                   	// #0
    df40:	38636902 	ldrb	w2, [x8, x3]
    df44:	38636820 	ldrb	w0, [x1, x3]
    df48:	91000463 	add	x3, x3, #0x1
    df4c:	92401c45 	and	x5, x2, #0xff
    df50:	11008047 	add	w7, w2, #0x20
    df54:	92401c04 	and	x4, x0, #0xff
    df58:	386568c5 	ldrb	w5, [x6, x5]
    df5c:	386468c4 	ldrb	w4, [x6, x4]
    df60:	120004a5 	and	w5, w5, #0x3
    df64:	710004bf 	cmp	w5, #0x1
    df68:	12000484 	and	w4, w4, #0x3
    df6c:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    df70:	7100049f 	cmp	w4, #0x1
    df74:	540000a0 	b.eq	df88 <strcasecmp+0x58>  // b.none
    df78:	6b000042 	subs	w2, w2, w0
    df7c:	540000e1 	b.ne	df98 <strcasecmp+0x68>  // b.any
    df80:	35fffe00 	cbnz	w0, df40 <strcasecmp+0x10>
    df84:	d65f03c0 	ret
    df88:	11008000 	add	w0, w0, #0x20
    df8c:	6b000040 	subs	w0, w2, w0
    df90:	54fffd80 	b.eq	df40 <strcasecmp+0x10>  // b.none
    df94:	d65f03c0 	ret
    df98:	2a0203e0 	mov	w0, w2
    df9c:	d65f03c0 	ret

000000000000dfa0 <strcat>:
    dfa0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    dfa4:	910003fd 	mov	x29, sp
    dfa8:	f9000bf3 	str	x19, [sp, #16]
    dfac:	aa0003f3 	mov	x19, x0
    dfb0:	f240081f 	tst	x0, #0x7
    dfb4:	540001c1 	b.ne	dfec <strcat+0x4c>  // b.any
    dfb8:	f9400002 	ldr	x2, [x0]
    dfbc:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    dfc0:	f29fdfe4 	movk	x4, #0xfeff
    dfc4:	8b040043 	add	x3, x2, x4
    dfc8:	8a220062 	bic	x2, x3, x2
    dfcc:	f201c05f 	tst	x2, #0x8080808080808080
    dfd0:	540000e1 	b.ne	dfec <strcat+0x4c>  // b.any
    dfd4:	d503201f 	nop
    dfd8:	f8408c02 	ldr	x2, [x0, #8]!
    dfdc:	8b040043 	add	x3, x2, x4
    dfe0:	8a220062 	bic	x2, x3, x2
    dfe4:	f201c05f 	tst	x2, #0x8080808080808080
    dfe8:	54ffff80 	b.eq	dfd8 <strcat+0x38>  // b.none
    dfec:	39400002 	ldrb	w2, [x0]
    dff0:	34000082 	cbz	w2, e000 <strcat+0x60>
    dff4:	d503201f 	nop
    dff8:	38401c02 	ldrb	w2, [x0, #1]!
    dffc:	35ffffe2 	cbnz	w2, dff8 <strcat+0x58>
    e000:	94000040 	bl	e100 <strcpy>
    e004:	aa1303e0 	mov	x0, x19
    e008:	f9400bf3 	ldr	x19, [sp, #16]
    e00c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    e010:	d65f03c0 	ret

000000000000e014 <strchr>:
    e014:	52808024 	mov	w4, #0x401                 	// #1025
    e018:	72a80204 	movk	w4, #0x4010, lsl #16
    e01c:	4e010c20 	dup	v0.16b, w1
    e020:	927be802 	and	x2, x0, #0xffffffffffffffe0
    e024:	4e040c90 	dup	v16.4s, w4
    e028:	f2401003 	ands	x3, x0, #0x1f
    e02c:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    e030:	540002a0 	b.eq	e084 <strchr+0x70>  // b.none
    e034:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    e038:	cb0303e3 	neg	x3, x3
    e03c:	4e209823 	cmeq	v3.16b, v1.16b, #0
    e040:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    e044:	4e209844 	cmeq	v4.16b, v2.16b, #0
    e048:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    e04c:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    e050:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    e054:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    e058:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    e05c:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    e060:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    e064:	d37ff863 	lsl	x3, x3, #1
    e068:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    e06c:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    e070:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    e074:	9ac324a3 	lsr	x3, x5, x3
    e078:	4e083e25 	mov	x5, v17.d[0]
    e07c:	8a2300a3 	bic	x3, x5, x3
    e080:	b50002a3 	cbnz	x3, e0d4 <strchr+0xc0>
    e084:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    e088:	4e209823 	cmeq	v3.16b, v1.16b, #0
    e08c:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    e090:	4e209844 	cmeq	v4.16b, v2.16b, #0
    e094:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    e098:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    e09c:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    e0a0:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    e0a4:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    e0a8:	4e083e23 	mov	x3, v17.d[0]
    e0ac:	b4fffec3 	cbz	x3, e084 <strchr+0x70>
    e0b0:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    e0b4:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    e0b8:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    e0bc:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    e0c0:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    e0c4:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    e0c8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    e0cc:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    e0d0:	4e083e23 	mov	x3, v17.d[0]
    e0d4:	dac00063 	rbit	x3, x3
    e0d8:	d1008042 	sub	x2, x2, #0x20
    e0dc:	dac01063 	clz	x3, x3
    e0e0:	f240007f 	tst	x3, #0x1
    e0e4:	8b430440 	add	x0, x2, x3, lsr #1
    e0e8:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    e0ec:	d65f03c0 	ret
    e0f0:	d503201f 	nop
    e0f4:	d503201f 	nop
    e0f8:	d503201f 	nop
    e0fc:	d503201f 	nop

000000000000e100 <strcpy>:
    e100:	92402c29 	and	x9, x1, #0xfff
    e104:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    e108:	92400c31 	and	x17, x1, #0xf
    e10c:	f13fc13f 	cmp	x9, #0xff0
    e110:	cb1103e8 	neg	x8, x17
    e114:	540008cc 	b.gt	e22c <strcpy+0x12c>
    e118:	a9401424 	ldp	x4, x5, [x1]
    e11c:	cb0c0088 	sub	x8, x4, x12
    e120:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    e124:	ea290106 	bics	x6, x8, x9
    e128:	540001c1 	b.ne	e160 <strcpy+0x60>  // b.any
    e12c:	cb0c00aa 	sub	x10, x5, x12
    e130:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    e134:	ea2b0147 	bics	x7, x10, x11
    e138:	54000440 	b.eq	e1c0 <strcpy+0xc0>  // b.none
    e13c:	dac00ce7 	rev	x7, x7
    e140:	dac010ef 	clz	x15, x7
    e144:	d2800709 	mov	x9, #0x38                  	// #56
    e148:	8b4f0c03 	add	x3, x0, x15, lsr #3
    e14c:	cb0f012f 	sub	x15, x9, x15
    e150:	9acf20a5 	lsl	x5, x5, x15
    e154:	f8001065 	stur	x5, [x3, #1]
    e158:	f9000004 	str	x4, [x0]
    e15c:	d65f03c0 	ret
    e160:	dac00cc6 	rev	x6, x6
    e164:	dac010cf 	clz	x15, x6
    e168:	8b4f0c03 	add	x3, x0, x15, lsr #3
    e16c:	f10061e9 	subs	x9, x15, #0x18
    e170:	540000ab 	b.lt	e184 <strcpy+0x84>  // b.tstop
    e174:	9ac92485 	lsr	x5, x4, x9
    e178:	b81fd065 	stur	w5, [x3, #-3]
    e17c:	b9000004 	str	w4, [x0]
    e180:	d65f03c0 	ret
    e184:	b400004f 	cbz	x15, e18c <strcpy+0x8c>
    e188:	79000004 	strh	w4, [x0]
    e18c:	3900007f 	strb	wzr, [x3]
    e190:	d65f03c0 	ret
    e194:	d503201f 	nop
    e198:	d503201f 	nop
    e19c:	d503201f 	nop
    e1a0:	d503201f 	nop
    e1a4:	d503201f 	nop
    e1a8:	d503201f 	nop
    e1ac:	d503201f 	nop
    e1b0:	d503201f 	nop
    e1b4:	d503201f 	nop
    e1b8:	d503201f 	nop
    e1bc:	d503201f 	nop
    e1c0:	d1004231 	sub	x17, x17, #0x10
    e1c4:	a9001404 	stp	x4, x5, [x0]
    e1c8:	cb110022 	sub	x2, x1, x17
    e1cc:	cb110003 	sub	x3, x0, x17
    e1d0:	14000002 	b	e1d8 <strcpy+0xd8>
    e1d4:	a8811464 	stp	x4, x5, [x3], #16
    e1d8:	a8c11444 	ldp	x4, x5, [x2], #16
    e1dc:	cb0c0088 	sub	x8, x4, x12
    e1e0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    e1e4:	cb0c00aa 	sub	x10, x5, x12
    e1e8:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    e1ec:	8a290106 	bic	x6, x8, x9
    e1f0:	ea2b0147 	bics	x7, x10, x11
    e1f4:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    e1f8:	54fffee0 	b.eq	e1d4 <strcpy+0xd4>  // b.none
    e1fc:	f10000df 	cmp	x6, #0x0
    e200:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    e204:	dac00cc6 	rev	x6, x6
    e208:	dac010cf 	clz	x15, x6
    e20c:	910121e8 	add	x8, x15, #0x48
    e210:	910021ef 	add	x15, x15, #0x8
    e214:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    e218:	8b4f0c42 	add	x2, x2, x15, lsr #3
    e21c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    e220:	a97e1444 	ldp	x4, x5, [x2, #-32]
    e224:	a93f1464 	stp	x4, x5, [x3, #-16]
    e228:	d65f03c0 	ret
    e22c:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    e230:	a9401444 	ldp	x4, x5, [x2]
    e234:	d37df108 	lsl	x8, x8, #3
    e238:	f2400a3f 	tst	x17, #0x7
    e23c:	da9f03e9 	csetm	x9, ne  // ne = any
    e240:	9ac82529 	lsr	x9, x9, x8
    e244:	aa090084 	orr	x4, x4, x9
    e248:	aa0900ae 	orr	x14, x5, x9
    e24c:	f100223f 	cmp	x17, #0x8
    e250:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    e254:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    e258:	cb0c0088 	sub	x8, x4, x12
    e25c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    e260:	cb0c00aa 	sub	x10, x5, x12
    e264:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    e268:	8a290106 	bic	x6, x8, x9
    e26c:	ea2b0147 	bics	x7, x10, x11
    e270:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    e274:	54fff520 	b.eq	e118 <strcpy+0x18>  // b.none
    e278:	d37df228 	lsl	x8, x17, #3
    e27c:	cb110fe9 	neg	x9, x17, lsl #3
    e280:	9ac8248d 	lsr	x13, x4, x8
    e284:	9ac920ab 	lsl	x11, x5, x9
    e288:	9ac824a5 	lsr	x5, x5, x8
    e28c:	aa0d016b 	orr	x11, x11, x13
    e290:	f100223f 	cmp	x17, #0x8
    e294:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    e298:	cb0c0088 	sub	x8, x4, x12
    e29c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    e2a0:	cb0c00aa 	sub	x10, x5, x12
    e2a4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    e2a8:	8a290106 	bic	x6, x8, x9
    e2ac:	b5fff5a6 	cbnz	x6, e160 <strcpy+0x60>
    e2b0:	8a2b0147 	bic	x7, x10, x11
    e2b4:	17ffffa2 	b	e13c <strcpy+0x3c>
    e2b8:	d503201f 	nop
    e2bc:	d503201f 	nop

000000000000e2c0 <strlcpy>:
    e2c0:	aa0003e4 	mov	x4, x0
    e2c4:	aa0103e3 	mov	x3, x1
    e2c8:	b4000202 	cbz	x2, e308 <strlcpy+0x48>
    e2cc:	f100045f 	cmp	x2, #0x1
    e2d0:	54000180 	b.eq	e300 <strlcpy+0x40>  // b.none
    e2d4:	8b020002 	add	x2, x0, x2
    e2d8:	14000003 	b	e2e4 <strlcpy+0x24>
    e2dc:	ab02001f 	cmn	x0, x2
    e2e0:	54000100 	b.eq	e300 <strlcpy+0x40>  // b.none
    e2e4:	38401465 	ldrb	w5, [x3], #1
    e2e8:	38001485 	strb	w5, [x4], #1
    e2ec:	aa2403e0 	mvn	x0, x4
    e2f0:	35ffff65 	cbnz	w5, e2dc <strlcpy+0x1c>
    e2f4:	cb010060 	sub	x0, x3, x1
    e2f8:	d1000400 	sub	x0, x0, #0x1
    e2fc:	d65f03c0 	ret
    e300:	3900009f 	strb	wzr, [x4]
    e304:	d503201f 	nop
    e308:	38401462 	ldrb	w2, [x3], #1
    e30c:	34ffff42 	cbz	w2, e2f4 <strlcpy+0x34>
    e310:	38401462 	ldrb	w2, [x3], #1
    e314:	35ffffa2 	cbnz	w2, e308 <strlcpy+0x48>
    e318:	17fffff7 	b	e2f4 <strlcpy+0x34>
    e31c:	d503201f 	nop

000000000000e320 <strncasecmp>:
    e320:	aa0003e9 	mov	x9, x0
    e324:	b4000382 	cbz	x2, e394 <strncasecmp+0x74>
    e328:	d0000007 	adrp	x7, 10000 <__func__.0+0x10>
    e32c:	d2800004 	mov	x4, #0x0                   	// #0
    e330:	9117a4e7 	add	x7, x7, #0x5e9
    e334:	14000006 	b	e34c <strncasecmp+0x2c>
    e338:	6b000063 	subs	w3, w3, w0
    e33c:	54000301 	b.ne	e39c <strncasecmp+0x7c>  // b.any
    e340:	34000280 	cbz	w0, e390 <strncasecmp+0x70>
    e344:	eb04005f 	cmp	x2, x4
    e348:	54000260 	b.eq	e394 <strncasecmp+0x74>  // b.none
    e34c:	38646923 	ldrb	w3, [x9, x4]
    e350:	38646820 	ldrb	w0, [x1, x4]
    e354:	91000484 	add	x4, x4, #0x1
    e358:	92401c66 	and	x6, x3, #0xff
    e35c:	11008068 	add	w8, w3, #0x20
    e360:	92401c05 	and	x5, x0, #0xff
    e364:	386668e6 	ldrb	w6, [x7, x6]
    e368:	386568e5 	ldrb	w5, [x7, x5]
    e36c:	120004c6 	and	w6, w6, #0x3
    e370:	710004df 	cmp	w6, #0x1
    e374:	120004a5 	and	w5, w5, #0x3
    e378:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    e37c:	710004bf 	cmp	w5, #0x1
    e380:	54fffdc1 	b.ne	e338 <strncasecmp+0x18>  // b.any
    e384:	11008000 	add	w0, w0, #0x20
    e388:	6b000060 	subs	w0, w3, w0
    e38c:	54fffdc0 	b.eq	e344 <strncasecmp+0x24>  // b.none
    e390:	d65f03c0 	ret
    e394:	52800000 	mov	w0, #0x0                   	// #0
    e398:	d65f03c0 	ret
    e39c:	2a0303e0 	mov	w0, w3
    e3a0:	d65f03c0 	ret
    e3a4:	d503201f 	nop
    e3a8:	d503201f 	nop
    e3ac:	d503201f 	nop

000000000000e3b0 <strncpy>:
    e3b0:	aa000023 	orr	x3, x1, x0
    e3b4:	f240087f 	tst	x3, #0x7
    e3b8:	aa0003e3 	mov	x3, x0
    e3bc:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    e3c0:	540002c8 	b.hi	e418 <strncpy+0x68>  // b.pmore
    e3c4:	d1000445 	sub	x5, x2, #0x1
    e3c8:	d2800027 	mov	x7, #0x1                   	// #1
    e3cc:	8b050025 	add	x5, x1, x5
    e3d0:	14000007 	b	e3ec <strncpy+0x3c>
    e3d4:	386468a4 	ldrb	w4, [x5, x4]
    e3d8:	d1000446 	sub	x6, x2, #0x1
    e3dc:	38001424 	strb	w4, [x1], #1
    e3e0:	340000e4 	cbz	w4, e3fc <strncpy+0x4c>
    e3e4:	aa0103e3 	mov	x3, x1
    e3e8:	aa0603e2 	mov	x2, x6
    e3ec:	cb0200e4 	sub	x4, x7, x2
    e3f0:	aa0303e1 	mov	x1, x3
    e3f4:	b5ffff02 	cbnz	x2, e3d4 <strncpy+0x24>
    e3f8:	d65f03c0 	ret
    e3fc:	8b020062 	add	x2, x3, x2
    e400:	b4ffffc6 	cbz	x6, e3f8 <strncpy+0x48>
    e404:	d503201f 	nop
    e408:	3800143f 	strb	wzr, [x1], #1
    e40c:	eb02003f 	cmp	x1, x2
    e410:	54ffffc1 	b.ne	e408 <strncpy+0x58>  // b.any
    e414:	d65f03c0 	ret
    e418:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    e41c:	f29fdfe6 	movk	x6, #0xfeff
    e420:	f9400025 	ldr	x5, [x1]
    e424:	8b0600a4 	add	x4, x5, x6
    e428:	8a250084 	bic	x4, x4, x5
    e42c:	f201c09f 	tst	x4, #0x8080808080808080
    e430:	54fffca1 	b.ne	e3c4 <strncpy+0x14>  // b.any
    e434:	d1002042 	sub	x2, x2, #0x8
    e438:	f8008465 	str	x5, [x3], #8
    e43c:	91002021 	add	x1, x1, #0x8
    e440:	f1001c5f 	cmp	x2, #0x7
    e444:	54fffee8 	b.hi	e420 <strncpy+0x70>  // b.pmore
    e448:	17ffffdf 	b	e3c4 <strncpy+0x14>
    e44c:	d503201f 	nop

000000000000e450 <_strtol_l.part.0>:
    e450:	d0000007 	adrp	x7, 10000 <__func__.0+0x10>
    e454:	aa0003ec 	mov	x12, x0
    e458:	aa0103e6 	mov	x6, x1
    e45c:	9117a4e7 	add	x7, x7, #0x5e9
    e460:	aa0603e8 	mov	x8, x6
    e464:	384014c4 	ldrb	w4, [x6], #1
    e468:	92401c85 	and	x5, x4, #0xff
    e46c:	386568e5 	ldrb	w5, [x7, x5]
    e470:	371fff85 	tbnz	w5, #3, e460 <_strtol_l.part.0+0x10>
    e474:	2a0403e5 	mov	w5, w4
    e478:	7100b49f 	cmp	w4, #0x2d
    e47c:	54000880 	b.eq	e58c <_strtol_l.part.0+0x13c>  // b.none
    e480:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    e484:	5280000d 	mov	w13, #0x0                   	// #0
    e488:	7100ac9f 	cmp	w4, #0x2b
    e48c:	540006a0 	b.eq	e560 <_strtol_l.part.0+0x110>  // b.none
    e490:	721b787f 	tst	w3, #0xffffffef
    e494:	54000121 	b.ne	e4b8 <_strtol_l.part.0+0x68>  // b.any
    e498:	7100c0bf 	cmp	w5, #0x30
    e49c:	54000820 	b.eq	e5a0 <_strtol_l.part.0+0x150>  // b.none
    e4a0:	350000c3 	cbnz	w3, e4b8 <_strtol_l.part.0+0x68>
    e4a4:	d280014a 	mov	x10, #0xa                   	// #10
    e4a8:	2a0a03e3 	mov	w3, w10
    e4ac:	14000004 	b	e4bc <_strtol_l.part.0+0x6c>
    e4b0:	34000903 	cbz	w3, e5d0 <_strtol_l.part.0+0x180>
    e4b4:	d503201f 	nop
    e4b8:	93407c6a 	sxtw	x10, w3
    e4bc:	9aca0968 	udiv	x8, x11, x10
    e4c0:	52800007 	mov	w7, #0x0                   	// #0
    e4c4:	d2800000 	mov	x0, #0x0                   	// #0
    e4c8:	1b0aad09 	msub	w9, w8, w10, w11
    e4cc:	d503201f 	nop
    e4d0:	5100c0a4 	sub	w4, w5, #0x30
    e4d4:	7100249f 	cmp	w4, #0x9
    e4d8:	540000a9 	b.ls	e4ec <_strtol_l.part.0+0x9c>  // b.plast
    e4dc:	510104a4 	sub	w4, w5, #0x41
    e4e0:	7100649f 	cmp	w4, #0x19
    e4e4:	54000208 	b.hi	e524 <_strtol_l.part.0+0xd4>  // b.pmore
    e4e8:	5100dca4 	sub	w4, w5, #0x37
    e4ec:	6b04007f 	cmp	w3, w4
    e4f0:	5400028d 	b.le	e540 <_strtol_l.part.0+0xf0>
    e4f4:	710000ff 	cmp	w7, #0x0
    e4f8:	12800007 	mov	w7, #0xffffffff            	// #-1
    e4fc:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    e500:	540000e3 	b.cc	e51c <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    e504:	eb00011f 	cmp	x8, x0
    e508:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    e50c:	5400008b 	b.lt	e51c <_strtol_l.part.0+0xcc>  // b.tstop
    e510:	93407c84 	sxtw	x4, w4
    e514:	52800027 	mov	w7, #0x1                   	// #1
    e518:	9b0a1000 	madd	x0, x0, x10, x4
    e51c:	384014c5 	ldrb	w5, [x6], #1
    e520:	17ffffec 	b	e4d0 <_strtol_l.part.0+0x80>
    e524:	510184a4 	sub	w4, w5, #0x61
    e528:	7100649f 	cmp	w4, #0x19
    e52c:	540000a8 	b.hi	e540 <_strtol_l.part.0+0xf0>  // b.pmore
    e530:	51015ca4 	sub	w4, w5, #0x57
    e534:	6b04007f 	cmp	w3, w4
    e538:	54fffdec 	b.gt	e4f4 <_strtol_l.part.0+0xa4>
    e53c:	d503201f 	nop
    e540:	310004ff 	cmn	w7, #0x1
    e544:	54000140 	b.eq	e56c <_strtol_l.part.0+0x11c>  // b.none
    e548:	710001bf 	cmp	w13, #0x0
    e54c:	da800400 	cneg	x0, x0, ne  // ne = any
    e550:	b4000062 	cbz	x2, e55c <_strtol_l.part.0+0x10c>
    e554:	350003a7 	cbnz	w7, e5c8 <_strtol_l.part.0+0x178>
    e558:	f9000041 	str	x1, [x2]
    e55c:	d65f03c0 	ret
    e560:	394000c5 	ldrb	w5, [x6]
    e564:	91000906 	add	x6, x8, #0x2
    e568:	17ffffca 	b	e490 <_strtol_l.part.0+0x40>
    e56c:	52800440 	mov	w0, #0x22                  	// #34
    e570:	b9000180 	str	w0, [x12]
    e574:	aa0b03e0 	mov	x0, x11
    e578:	b4ffff22 	cbz	x2, e55c <_strtol_l.part.0+0x10c>
    e57c:	d10004c1 	sub	x1, x6, #0x1
    e580:	aa0b03e0 	mov	x0, x11
    e584:	f9000041 	str	x1, [x2]
    e588:	17fffff5 	b	e55c <_strtol_l.part.0+0x10c>
    e58c:	394000c5 	ldrb	w5, [x6]
    e590:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    e594:	91000906 	add	x6, x8, #0x2
    e598:	5280002d 	mov	w13, #0x1                   	// #1
    e59c:	17ffffbd 	b	e490 <_strtol_l.part.0+0x40>
    e5a0:	394000c0 	ldrb	w0, [x6]
    e5a4:	121a7800 	and	w0, w0, #0xffffffdf
    e5a8:	12001c00 	and	w0, w0, #0xff
    e5ac:	7101601f 	cmp	w0, #0x58
    e5b0:	54fff801 	b.ne	e4b0 <_strtol_l.part.0+0x60>  // b.any
    e5b4:	394004c5 	ldrb	w5, [x6, #1]
    e5b8:	d280020a 	mov	x10, #0x10                  	// #16
    e5bc:	910008c6 	add	x6, x6, #0x2
    e5c0:	2a0a03e3 	mov	w3, w10
    e5c4:	17ffffbe 	b	e4bc <_strtol_l.part.0+0x6c>
    e5c8:	aa0003eb 	mov	x11, x0
    e5cc:	17ffffec 	b	e57c <_strtol_l.part.0+0x12c>
    e5d0:	d280010a 	mov	x10, #0x8                   	// #8
    e5d4:	2a0a03e3 	mov	w3, w10
    e5d8:	17ffffb9 	b	e4bc <_strtol_l.part.0+0x6c>
    e5dc:	d503201f 	nop

000000000000e5e0 <_strtol_r>:
    e5e0:	7100907f 	cmp	w3, #0x24
    e5e4:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    e5e8:	54000040 	b.eq	e5f0 <_strtol_r+0x10>  // b.none
    e5ec:	17ffff99 	b	e450 <_strtol_l.part.0>
    e5f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    e5f4:	910003fd 	mov	x29, sp
    e5f8:	9400020a 	bl	ee20 <__errno>
    e5fc:	528002c1 	mov	w1, #0x16                  	// #22
    e600:	b9000001 	str	w1, [x0]
    e604:	d2800000 	mov	x0, #0x0                   	// #0
    e608:	a8c17bfd 	ldp	x29, x30, [sp], #16
    e60c:	d65f03c0 	ret

000000000000e610 <strtol_l>:
    e610:	7100905f 	cmp	w2, #0x24
    e614:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    e618:	540000e0 	b.eq	e634 <strtol_l+0x24>  // b.none
    e61c:	d0000004 	adrp	x4, 10000 <__func__.0+0x10>
    e620:	2a0203e3 	mov	w3, w2
    e624:	aa0103e2 	mov	x2, x1
    e628:	aa0003e1 	mov	x1, x0
    e62c:	f9438880 	ldr	x0, [x4, #1808]
    e630:	17ffff88 	b	e450 <_strtol_l.part.0>
    e634:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    e638:	910003fd 	mov	x29, sp
    e63c:	940001f9 	bl	ee20 <__errno>
    e640:	528002c1 	mov	w1, #0x16                  	// #22
    e644:	b9000001 	str	w1, [x0]
    e648:	d2800000 	mov	x0, #0x0                   	// #0
    e64c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    e650:	d65f03c0 	ret
    e654:	d503201f 	nop
    e658:	d503201f 	nop
    e65c:	d503201f 	nop

000000000000e660 <strtol>:
    e660:	7100905f 	cmp	w2, #0x24
    e664:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    e668:	540000e0 	b.eq	e684 <strtol+0x24>  // b.none
    e66c:	d0000004 	adrp	x4, 10000 <__func__.0+0x10>
    e670:	2a0203e3 	mov	w3, w2
    e674:	aa0103e2 	mov	x2, x1
    e678:	aa0003e1 	mov	x1, x0
    e67c:	f9438880 	ldr	x0, [x4, #1808]
    e680:	17ffff74 	b	e450 <_strtol_l.part.0>
    e684:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    e688:	910003fd 	mov	x29, sp
    e68c:	940001e5 	bl	ee20 <__errno>
    e690:	528002c1 	mov	w1, #0x16                  	// #22
    e694:	b9000001 	str	w1, [x0]
    e698:	d2800000 	mov	x0, #0x0                   	// #0
    e69c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    e6a0:	d65f03c0 	ret
    e6a4:	d503201f 	nop
    e6a8:	d503201f 	nop
    e6ac:	d503201f 	nop

000000000000e6b0 <__swbuf_r>:
    e6b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    e6b4:	910003fd 	mov	x29, sp
    e6b8:	a90153f3 	stp	x19, x20, [sp, #16]
    e6bc:	2a0103f4 	mov	w20, w1
    e6c0:	aa0203f3 	mov	x19, x2
    e6c4:	a9025bf5 	stp	x21, x22, [sp, #32]
    e6c8:	aa0003f5 	mov	x21, x0
    e6cc:	b4000060 	cbz	x0, e6d8 <__swbuf_r+0x28>
    e6d0:	b9405001 	ldr	w1, [x0, #80]
    e6d4:	340007e1 	cbz	w1, e7d0 <__swbuf_r+0x120>
    e6d8:	79c02260 	ldrsh	w0, [x19, #16]
    e6dc:	b9402a61 	ldr	w1, [x19, #40]
    e6e0:	b9000e61 	str	w1, [x19, #12]
    e6e4:	12003c02 	and	w2, w0, #0xffff
    e6e8:	361803e0 	tbz	w0, #3, e764 <__swbuf_r+0xb4>
    e6ec:	f9400e61 	ldr	x1, [x19, #24]
    e6f0:	b40003a1 	cbz	x1, e764 <__swbuf_r+0xb4>
    e6f4:	12001e96 	and	w22, w20, #0xff
    e6f8:	12001e94 	and	w20, w20, #0xff
    e6fc:	36680482 	tbz	w2, #13, e78c <__swbuf_r+0xdc>
    e700:	f9400260 	ldr	x0, [x19]
    e704:	b9402262 	ldr	w2, [x19, #32]
    e708:	cb010001 	sub	x1, x0, x1
    e70c:	6b01005f 	cmp	w2, w1
    e710:	5400052d 	b.le	e7b4 <__swbuf_r+0x104>
    e714:	11000421 	add	w1, w1, #0x1
    e718:	b9400e62 	ldr	w2, [x19, #12]
    e71c:	91000403 	add	x3, x0, #0x1
    e720:	f9000263 	str	x3, [x19]
    e724:	51000442 	sub	w2, w2, #0x1
    e728:	b9000e62 	str	w2, [x19, #12]
    e72c:	39000016 	strb	w22, [x0]
    e730:	b9402260 	ldr	w0, [x19, #32]
    e734:	6b01001f 	cmp	w0, w1
    e738:	54000500 	b.eq	e7d8 <__swbuf_r+0x128>  // b.none
    e73c:	71002a9f 	cmp	w20, #0xa
    e740:	79402260 	ldrh	w0, [x19, #16]
    e744:	1a9f17e1 	cset	w1, eq  // eq = none
    e748:	6a00003f 	tst	w1, w0
    e74c:	54000461 	b.ne	e7d8 <__swbuf_r+0x128>  // b.any
    e750:	2a1403e0 	mov	w0, w20
    e754:	a94153f3 	ldp	x19, x20, [sp, #16]
    e758:	a9425bf5 	ldp	x21, x22, [sp, #32]
    e75c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    e760:	d65f03c0 	ret
    e764:	aa1303e1 	mov	x1, x19
    e768:	aa1503e0 	mov	x0, x21
    e76c:	97ffedd5 	bl	9ec0 <__swsetup_r>
    e770:	350003c0 	cbnz	w0, e7e8 <__swbuf_r+0x138>
    e774:	79c02260 	ldrsh	w0, [x19, #16]
    e778:	12001e96 	and	w22, w20, #0xff
    e77c:	12001e94 	and	w20, w20, #0xff
    e780:	12003c02 	and	w2, w0, #0xffff
    e784:	f9400e61 	ldr	x1, [x19, #24]
    e788:	376ffbc2 	tbnz	w2, #13, e700 <__swbuf_r+0x50>
    e78c:	b940ae62 	ldr	w2, [x19, #172]
    e790:	32130000 	orr	w0, w0, #0x2000
    e794:	79002260 	strh	w0, [x19, #16]
    e798:	12127840 	and	w0, w2, #0xffffdfff
    e79c:	b900ae60 	str	w0, [x19, #172]
    e7a0:	f9400260 	ldr	x0, [x19]
    e7a4:	b9402262 	ldr	w2, [x19, #32]
    e7a8:	cb010001 	sub	x1, x0, x1
    e7ac:	6b01005f 	cmp	w2, w1
    e7b0:	54fffb2c 	b.gt	e714 <__swbuf_r+0x64>
    e7b4:	aa1303e1 	mov	x1, x19
    e7b8:	aa1503e0 	mov	x0, x21
    e7bc:	97ffeed1 	bl	a300 <_fflush_r>
    e7c0:	35000140 	cbnz	w0, e7e8 <__swbuf_r+0x138>
    e7c4:	52800021 	mov	w1, #0x1                   	// #1
    e7c8:	f9400260 	ldr	x0, [x19]
    e7cc:	17ffffd3 	b	e718 <__swbuf_r+0x68>
    e7d0:	97ffefcc 	bl	a700 <__sinit>
    e7d4:	17ffffc1 	b	e6d8 <__swbuf_r+0x28>
    e7d8:	aa1303e1 	mov	x1, x19
    e7dc:	aa1503e0 	mov	x0, x21
    e7e0:	97ffeec8 	bl	a300 <_fflush_r>
    e7e4:	34fffb60 	cbz	w0, e750 <__swbuf_r+0xa0>
    e7e8:	12800014 	mov	w20, #0xffffffff            	// #-1
    e7ec:	17ffffd9 	b	e750 <__swbuf_r+0xa0>

000000000000e7f0 <__swbuf>:
    e7f0:	d0000003 	adrp	x3, 10000 <__func__.0+0x10>
    e7f4:	aa0103e2 	mov	x2, x1
    e7f8:	2a0003e1 	mov	w1, w0
    e7fc:	f9438860 	ldr	x0, [x3, #1808]
    e800:	17ffffac 	b	e6b0 <__swbuf_r>
    e804:	d503201f 	nop
    e808:	d503201f 	nop
    e80c:	d503201f 	nop

000000000000e810 <_wcsnrtombs_l>:
    e810:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    e814:	f10000bf 	cmp	x5, #0x0
    e818:	910003fd 	mov	x29, sp
    e81c:	a90153f3 	stp	x19, x20, [sp, #16]
    e820:	aa0003f3 	mov	x19, x0
    e824:	91057000 	add	x0, x0, #0x15c
    e828:	a9025bf5 	stp	x21, x22, [sp, #32]
    e82c:	aa0103f4 	mov	x20, x1
    e830:	aa0203f5 	mov	x21, x2
    e834:	a90363f7 	stp	x23, x24, [sp, #48]
    e838:	aa0603f6 	mov	x22, x6
    e83c:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    e840:	a9046bf9 	stp	x25, x26, [sp, #64]
    e844:	a90573fb 	stp	x27, x28, [sp, #80]
    e848:	f940005c 	ldr	x28, [x2]
    e84c:	b4000901 	cbz	x1, e96c <_wcsnrtombs_l+0x15c>
    e850:	aa0403fa 	mov	x26, x4
    e854:	b4000a84 	cbz	x4, e9a4 <_wcsnrtombs_l+0x194>
    e858:	d1000478 	sub	x24, x3, #0x1
    e85c:	b4000a43 	cbz	x3, e9a4 <_wcsnrtombs_l+0x194>
    e860:	d280001b 	mov	x27, #0x0                   	// #0
    e864:	f90037f4 	str	x20, [sp, #104]
    e868:	1400000a 	b	e890 <_wcsnrtombs_l+0x80>
    e86c:	b50003d4 	cbnz	x20, e8e4 <_wcsnrtombs_l+0xd4>
    e870:	b8404780 	ldr	w0, [x28], #4
    e874:	34000640 	cbz	w0, e93c <_wcsnrtombs_l+0x12c>
    e878:	eb1a011f 	cmp	x8, x26
    e87c:	54000982 	b.cs	e9ac <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    e880:	d1000718 	sub	x24, x24, #0x1
    e884:	aa0803fb 	mov	x27, x8
    e888:	b100071f 	cmn	x24, #0x1
    e88c:	540001c0 	b.eq	e8c4 <_wcsnrtombs_l+0xb4>  // b.none
    e890:	b9400382 	ldr	w2, [x28]
    e894:	aa1703e3 	mov	x3, x23
    e898:	f94072c4 	ldr	x4, [x22, #224]
    e89c:	9101c3e1 	add	x1, sp, #0x70
    e8a0:	aa1303e0 	mov	x0, x19
    e8a4:	f94002f9 	ldr	x25, [x23]
    e8a8:	d63f0080 	blr	x4
    e8ac:	3100041f 	cmn	w0, #0x1
    e8b0:	54000620 	b.eq	e974 <_wcsnrtombs_l+0x164>  // b.none
    e8b4:	8b20c368 	add	x8, x27, w0, sxtw
    e8b8:	eb1a011f 	cmp	x8, x26
    e8bc:	54fffd89 	b.ls	e86c <_wcsnrtombs_l+0x5c>  // b.plast
    e8c0:	f90002f9 	str	x25, [x23]
    e8c4:	aa1b03e0 	mov	x0, x27
    e8c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    e8cc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    e8d0:	a94363f7 	ldp	x23, x24, [sp, #48]
    e8d4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    e8d8:	a94573fb 	ldp	x27, x28, [sp, #80]
    e8dc:	a8c87bfd 	ldp	x29, x30, [sp], #128
    e8e0:	d65f03c0 	ret
    e8e4:	7100001f 	cmp	w0, #0x0
    e8e8:	5400020d 	b.le	e928 <_wcsnrtombs_l+0x118>
    e8ec:	f94037e1 	ldr	x1, [sp, #104]
    e8f0:	11000402 	add	w2, w0, #0x1
    e8f4:	d2800027 	mov	x7, #0x1                   	// #1
    e8f8:	d1000421 	sub	x1, x1, #0x1
    e8fc:	d503201f 	nop
    e900:	9101c3e3 	add	x3, sp, #0x70
    e904:	8b070069 	add	x9, x3, x7
    e908:	385ff129 	ldurb	w9, [x9, #-1]
    e90c:	38276829 	strb	w9, [x1, x7]
    e910:	910004e7 	add	x7, x7, #0x1
    e914:	eb0200ff 	cmp	x7, x2
    e918:	54ffff41 	b.ne	e900 <_wcsnrtombs_l+0xf0>  // b.any
    e91c:	f94037e1 	ldr	x1, [sp, #104]
    e920:	8b204020 	add	x0, x1, w0, uxtw
    e924:	f90037e0 	str	x0, [sp, #104]
    e928:	f94002a0 	ldr	x0, [x21]
    e92c:	91001000 	add	x0, x0, #0x4
    e930:	f90002a0 	str	x0, [x21]
    e934:	b8404780 	ldr	w0, [x28], #4
    e938:	35fffa00 	cbnz	w0, e878 <_wcsnrtombs_l+0x68>
    e93c:	b4000054 	cbz	x20, e944 <_wcsnrtombs_l+0x134>
    e940:	f90002bf 	str	xzr, [x21]
    e944:	b90002ff 	str	wzr, [x23]
    e948:	d100051b 	sub	x27, x8, #0x1
    e94c:	aa1b03e0 	mov	x0, x27
    e950:	a94153f3 	ldp	x19, x20, [sp, #16]
    e954:	a9425bf5 	ldp	x21, x22, [sp, #32]
    e958:	a94363f7 	ldp	x23, x24, [sp, #48]
    e95c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    e960:	a94573fb 	ldp	x27, x28, [sp, #80]
    e964:	a8c87bfd 	ldp	x29, x30, [sp], #128
    e968:	d65f03c0 	ret
    e96c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    e970:	17ffffba 	b	e858 <_wcsnrtombs_l+0x48>
    e974:	52801140 	mov	w0, #0x8a                  	// #138
    e978:	b9000260 	str	w0, [x19]
    e97c:	b90002ff 	str	wzr, [x23]
    e980:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    e984:	aa1b03e0 	mov	x0, x27
    e988:	a94153f3 	ldp	x19, x20, [sp, #16]
    e98c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    e990:	a94363f7 	ldp	x23, x24, [sp, #48]
    e994:	a9446bf9 	ldp	x25, x26, [sp, #64]
    e998:	a94573fb 	ldp	x27, x28, [sp, #80]
    e99c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    e9a0:	d65f03c0 	ret
    e9a4:	d280001b 	mov	x27, #0x0                   	// #0
    e9a8:	17ffffc7 	b	e8c4 <_wcsnrtombs_l+0xb4>
    e9ac:	aa0803fb 	mov	x27, x8
    e9b0:	17ffffc5 	b	e8c4 <_wcsnrtombs_l+0xb4>
    e9b4:	d503201f 	nop
    e9b8:	d503201f 	nop
    e9bc:	d503201f 	nop

000000000000e9c0 <_wcsnrtombs_r>:
    e9c0:	d0000000 	adrp	x0, 10000 <__func__.0+0x10>
    e9c4:	d0000006 	adrp	x6, 10000 <__func__.0+0x10>
    e9c8:	913a00c6 	add	x6, x6, #0xe80
    e9cc:	f9438800 	ldr	x0, [x0, #1808]
    e9d0:	17ffff90 	b	e810 <_wcsnrtombs_l>
    e9d4:	d503201f 	nop
    e9d8:	d503201f 	nop
    e9dc:	d503201f 	nop

000000000000e9e0 <wcsnrtombs>:
    e9e0:	d0000006 	adrp	x6, 10000 <__func__.0+0x10>
    e9e4:	aa0003e8 	mov	x8, x0
    e9e8:	aa0103e7 	mov	x7, x1
    e9ec:	aa0203e5 	mov	x5, x2
    e9f0:	f94388c0 	ldr	x0, [x6, #1808]
    e9f4:	aa0303e6 	mov	x6, x3
    e9f8:	aa0803e1 	mov	x1, x8
    e9fc:	aa0503e3 	mov	x3, x5
    ea00:	aa0703e2 	mov	x2, x7
    ea04:	aa0403e5 	mov	x5, x4
    ea08:	aa0603e4 	mov	x4, x6
    ea0c:	d0000006 	adrp	x6, 10000 <__func__.0+0x10>
    ea10:	913a00c6 	add	x6, x6, #0xe80
    ea14:	17ffff7f 	b	e810 <_wcsnrtombs_l>
    ea18:	d503201f 	nop
    ea1c:	d503201f 	nop

000000000000ea20 <_wctomb_r>:
    ea20:	d0000004 	adrp	x4, 10000 <__func__.0+0x10>
    ea24:	f947b084 	ldr	x4, [x4, #3936]
    ea28:	aa0403f0 	mov	x16, x4
    ea2c:	d61f0200 	br	x16

000000000000ea30 <__ascii_wctomb>:
    ea30:	aa0003e3 	mov	x3, x0
    ea34:	b4000141 	cbz	x1, ea5c <__ascii_wctomb+0x2c>
    ea38:	7103fc5f 	cmp	w2, #0xff
    ea3c:	54000088 	b.hi	ea4c <__ascii_wctomb+0x1c>  // b.pmore
    ea40:	52800020 	mov	w0, #0x1                   	// #1
    ea44:	39000022 	strb	w2, [x1]
    ea48:	d65f03c0 	ret
    ea4c:	52801141 	mov	w1, #0x8a                  	// #138
    ea50:	12800000 	mov	w0, #0xffffffff            	// #-1
    ea54:	b9000061 	str	w1, [x3]
    ea58:	d65f03c0 	ret
    ea5c:	52800000 	mov	w0, #0x0                   	// #0
    ea60:	d65f03c0 	ret
    ea64:	d503201f 	nop
    ea68:	d503201f 	nop
    ea6c:	d503201f 	nop

000000000000ea70 <__utf8_wctomb>:
    ea70:	aa0003e3 	mov	x3, x0
    ea74:	b40004e1 	cbz	x1, eb10 <__utf8_wctomb+0xa0>
    ea78:	7101fc5f 	cmp	w2, #0x7f
    ea7c:	54000349 	b.ls	eae4 <__utf8_wctomb+0x74>  // b.plast
    ea80:	51020040 	sub	w0, w2, #0x80
    ea84:	711dfc1f 	cmp	w0, #0x77f
    ea88:	54000349 	b.ls	eaf0 <__utf8_wctomb+0x80>  // b.plast
    ea8c:	51200044 	sub	w4, w2, #0x800
    ea90:	529effe0 	mov	w0, #0xf7ff                	// #63487
    ea94:	6b00009f 	cmp	w4, w0
    ea98:	54000409 	b.ls	eb18 <__utf8_wctomb+0xa8>  // b.plast
    ea9c:	51404044 	sub	w4, w2, #0x10, lsl #12
    eaa0:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    eaa4:	6b00009f 	cmp	w4, w0
    eaa8:	540004e8 	b.hi	eb44 <__utf8_wctomb+0xd4>  // b.pmore
    eaac:	53127c45 	lsr	w5, w2, #18
    eab0:	d34c4444 	ubfx	x4, x2, #12, #6
    eab4:	d3462c43 	ubfx	x3, x2, #6, #6
    eab8:	12001442 	and	w2, w2, #0x3f
    eabc:	321c6ca5 	orr	w5, w5, #0xfffffff0
    eac0:	32196084 	orr	w4, w4, #0xffffff80
    eac4:	32196063 	orr	w3, w3, #0xffffff80
    eac8:	32196042 	orr	w2, w2, #0xffffff80
    eacc:	52800080 	mov	w0, #0x4                   	// #4
    ead0:	39000025 	strb	w5, [x1]
    ead4:	39000424 	strb	w4, [x1, #1]
    ead8:	39000823 	strb	w3, [x1, #2]
    eadc:	39000c22 	strb	w2, [x1, #3]
    eae0:	d65f03c0 	ret
    eae4:	52800020 	mov	w0, #0x1                   	// #1
    eae8:	39000022 	strb	w2, [x1]
    eaec:	d65f03c0 	ret
    eaf0:	53067c43 	lsr	w3, w2, #6
    eaf4:	12001442 	and	w2, w2, #0x3f
    eaf8:	321a6463 	orr	w3, w3, #0xffffffc0
    eafc:	32196042 	orr	w2, w2, #0xffffff80
    eb00:	52800040 	mov	w0, #0x2                   	// #2
    eb04:	39000023 	strb	w3, [x1]
    eb08:	39000422 	strb	w2, [x1, #1]
    eb0c:	d65f03c0 	ret
    eb10:	52800000 	mov	w0, #0x0                   	// #0
    eb14:	d65f03c0 	ret
    eb18:	530c7c44 	lsr	w4, w2, #12
    eb1c:	d3462c43 	ubfx	x3, x2, #6, #6
    eb20:	12001442 	and	w2, w2, #0x3f
    eb24:	321b6884 	orr	w4, w4, #0xffffffe0
    eb28:	32196063 	orr	w3, w3, #0xffffff80
    eb2c:	32196042 	orr	w2, w2, #0xffffff80
    eb30:	52800060 	mov	w0, #0x3                   	// #3
    eb34:	39000024 	strb	w4, [x1]
    eb38:	39000423 	strb	w3, [x1, #1]
    eb3c:	39000822 	strb	w2, [x1, #2]
    eb40:	d65f03c0 	ret
    eb44:	52801141 	mov	w1, #0x8a                  	// #138
    eb48:	12800000 	mov	w0, #0xffffffff            	// #-1
    eb4c:	b9000061 	str	w1, [x3]
    eb50:	d65f03c0 	ret
    eb54:	d503201f 	nop
    eb58:	d503201f 	nop
    eb5c:	d503201f 	nop

000000000000eb60 <__sjis_wctomb>:
    eb60:	aa0003e5 	mov	x5, x0
    eb64:	12001c44 	and	w4, w2, #0xff
    eb68:	d3483c43 	ubfx	x3, x2, #8, #8
    eb6c:	b4000301 	cbz	x1, ebcc <__sjis_wctomb+0x6c>
    eb70:	34000283 	cbz	w3, ebc0 <__sjis_wctomb+0x60>
    eb74:	1101fc60 	add	w0, w3, #0x7f
    eb78:	11008063 	add	w3, w3, #0x20
    eb7c:	12001c00 	and	w0, w0, #0xff
    eb80:	12001c63 	and	w3, w3, #0xff
    eb84:	7100781f 	cmp	w0, #0x1e
    eb88:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    eb8c:	54000248 	b.hi	ebd4 <__sjis_wctomb+0x74>  // b.pmore
    eb90:	51010080 	sub	w0, w4, #0x40
    eb94:	51020084 	sub	w4, w4, #0x80
    eb98:	12001c00 	and	w0, w0, #0xff
    eb9c:	12001c84 	and	w4, w4, #0xff
    eba0:	7100f81f 	cmp	w0, #0x3e
    eba4:	52800f80 	mov	w0, #0x7c                  	// #124
    eba8:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    ebac:	54000148 	b.hi	ebd4 <__sjis_wctomb+0x74>  // b.pmore
    ebb0:	5ac00442 	rev16	w2, w2
    ebb4:	52800040 	mov	w0, #0x2                   	// #2
    ebb8:	79000022 	strh	w2, [x1]
    ebbc:	d65f03c0 	ret
    ebc0:	52800020 	mov	w0, #0x1                   	// #1
    ebc4:	39000024 	strb	w4, [x1]
    ebc8:	d65f03c0 	ret
    ebcc:	52800000 	mov	w0, #0x0                   	// #0
    ebd0:	d65f03c0 	ret
    ebd4:	52801141 	mov	w1, #0x8a                  	// #138
    ebd8:	12800000 	mov	w0, #0xffffffff            	// #-1
    ebdc:	b90000a1 	str	w1, [x5]
    ebe0:	d65f03c0 	ret
    ebe4:	d503201f 	nop
    ebe8:	d503201f 	nop
    ebec:	d503201f 	nop

000000000000ebf0 <__eucjp_wctomb>:
    ebf0:	aa0003e4 	mov	x4, x0
    ebf4:	12001c43 	and	w3, w2, #0xff
    ebf8:	d3483c45 	ubfx	x5, x2, #8, #8
    ebfc:	b4000421 	cbz	x1, ec80 <__eucjp_wctomb+0x90>
    ec00:	34000185 	cbz	w5, ec30 <__eucjp_wctomb+0x40>
    ec04:	11017ca0 	add	w0, w5, #0x5f
    ec08:	1101c8a6 	add	w6, w5, #0x72
    ec0c:	12001c00 	and	w0, w0, #0xff
    ec10:	12001cc6 	and	w6, w6, #0xff
    ec14:	7101741f 	cmp	w0, #0x5d
    ec18:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    ec1c:	54000109 	b.ls	ec3c <__eucjp_wctomb+0x4c>  // b.plast
    ec20:	52801141 	mov	w1, #0x8a                  	// #138
    ec24:	12800000 	mov	w0, #0xffffffff            	// #-1
    ec28:	b9000081 	str	w1, [x4]
    ec2c:	d65f03c0 	ret
    ec30:	52800020 	mov	w0, #0x1                   	// #1
    ec34:	39000023 	strb	w3, [x1]
    ec38:	d65f03c0 	ret
    ec3c:	11017c66 	add	w6, w3, #0x5f
    ec40:	12001cc6 	and	w6, w6, #0xff
    ec44:	710174df 	cmp	w6, #0x5d
    ec48:	54000209 	b.ls	ec88 <__eucjp_wctomb+0x98>  // b.plast
    ec4c:	7101741f 	cmp	w0, #0x5d
    ec50:	54fffe88 	b.hi	ec20 <__eucjp_wctomb+0x30>  // b.pmore
    ec54:	32190063 	orr	w3, w3, #0x80
    ec58:	11017c60 	add	w0, w3, #0x5f
    ec5c:	12001c00 	and	w0, w0, #0xff
    ec60:	7101741f 	cmp	w0, #0x5d
    ec64:	54fffde8 	b.hi	ec20 <__eucjp_wctomb+0x30>  // b.pmore
    ec68:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    ec6c:	52800060 	mov	w0, #0x3                   	// #3
    ec70:	39000022 	strb	w2, [x1]
    ec74:	39000425 	strb	w5, [x1, #1]
    ec78:	39000823 	strb	w3, [x1, #2]
    ec7c:	d65f03c0 	ret
    ec80:	52800000 	mov	w0, #0x0                   	// #0
    ec84:	d65f03c0 	ret
    ec88:	5ac00442 	rev16	w2, w2
    ec8c:	52800040 	mov	w0, #0x2                   	// #2
    ec90:	79000022 	strh	w2, [x1]
    ec94:	d65f03c0 	ret
    ec98:	d503201f 	nop
    ec9c:	d503201f 	nop

000000000000eca0 <__jis_wctomb>:
    eca0:	aa0003e6 	mov	x6, x0
    eca4:	12001c45 	and	w5, w2, #0xff
    eca8:	d3483c44 	ubfx	x4, x2, #8, #8
    ecac:	b40004c1 	cbz	x1, ed44 <__jis_wctomb+0xa4>
    ecb0:	34000304 	cbz	w4, ed10 <__jis_wctomb+0x70>
    ecb4:	51008484 	sub	w4, w4, #0x21
    ecb8:	12001c84 	and	w4, w4, #0xff
    ecbc:	7101749f 	cmp	w4, #0x5d
    ecc0:	54000468 	b.hi	ed4c <__jis_wctomb+0xac>  // b.pmore
    ecc4:	510084a5 	sub	w5, w5, #0x21
    ecc8:	12001ca5 	and	w5, w5, #0xff
    eccc:	710174bf 	cmp	w5, #0x5d
    ecd0:	540003e8 	b.hi	ed4c <__jis_wctomb+0xac>  // b.pmore
    ecd4:	b9400064 	ldr	w4, [x3]
    ecd8:	52800040 	mov	w0, #0x2                   	// #2
    ecdc:	35000144 	cbnz	w4, ed04 <__jis_wctomb+0x64>
    ece0:	aa0103e4 	mov	x4, x1
    ece4:	52800020 	mov	w0, #0x1                   	// #1
    ece8:	b9000060 	str	w0, [x3]
    ecec:	52848365 	mov	w5, #0x241b                	// #9243
    ecf0:	52800843 	mov	w3, #0x42                  	// #66
    ecf4:	528000a0 	mov	w0, #0x5                   	// #5
    ecf8:	78003485 	strh	w5, [x4], #3
    ecfc:	39000823 	strb	w3, [x1, #2]
    ed00:	aa0403e1 	mov	x1, x4
    ed04:	5ac00442 	rev16	w2, w2
    ed08:	79000022 	strh	w2, [x1]
    ed0c:	d65f03c0 	ret
    ed10:	b9400062 	ldr	w2, [x3]
    ed14:	52800020 	mov	w0, #0x1                   	// #1
    ed18:	34000122 	cbz	w2, ed3c <__jis_wctomb+0x9c>
    ed1c:	aa0103e2 	mov	x2, x1
    ed20:	b900007f 	str	wzr, [x3]
    ed24:	52850364 	mov	w4, #0x281b                	// #10267
    ed28:	52800843 	mov	w3, #0x42                  	// #66
    ed2c:	52800080 	mov	w0, #0x4                   	// #4
    ed30:	78003444 	strh	w4, [x2], #3
    ed34:	39000823 	strb	w3, [x1, #2]
    ed38:	aa0203e1 	mov	x1, x2
    ed3c:	39000025 	strb	w5, [x1]
    ed40:	d65f03c0 	ret
    ed44:	52800020 	mov	w0, #0x1                   	// #1
    ed48:	d65f03c0 	ret
    ed4c:	52801141 	mov	w1, #0x8a                  	// #138
    ed50:	12800000 	mov	w0, #0xffffffff            	// #-1
    ed54:	b90000c1 	str	w1, [x6]
    ed58:	d65f03c0 	ret
    ed5c:	d503201f 	nop

000000000000ed60 <_write_r>:
    ed60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ed64:	910003fd 	mov	x29, sp
    ed68:	a90153f3 	stp	x19, x20, [sp, #16]
    ed6c:	f0000014 	adrp	x20, 11000 <__global_locale+0x180>
    ed70:	aa0003f3 	mov	x19, x0
    ed74:	2a0103e0 	mov	w0, w1
    ed78:	aa0203e1 	mov	x1, x2
    ed7c:	b90f7a9f 	str	wzr, [x20, #3960]
    ed80:	aa0303e2 	mov	x2, x3
    ed84:	97ffe1bf 	bl	7480 <_write>
    ed88:	93407c01 	sxtw	x1, w0
    ed8c:	3100041f 	cmn	w0, #0x1
    ed90:	540000a0 	b.eq	eda4 <_write_r+0x44>  // b.none
    ed94:	aa0103e0 	mov	x0, x1
    ed98:	a94153f3 	ldp	x19, x20, [sp, #16]
    ed9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    eda0:	d65f03c0 	ret
    eda4:	b94f7a80 	ldr	w0, [x20, #3960]
    eda8:	34ffff60 	cbz	w0, ed94 <_write_r+0x34>
    edac:	b9000260 	str	w0, [x19]
    edb0:	aa0103e0 	mov	x0, x1
    edb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    edb8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    edbc:	d65f03c0 	ret

000000000000edc0 <_close_r>:
    edc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    edc4:	910003fd 	mov	x29, sp
    edc8:	a90153f3 	stp	x19, x20, [sp, #16]
    edcc:	f0000014 	adrp	x20, 11000 <__global_locale+0x180>
    edd0:	aa0003f3 	mov	x19, x0
    edd4:	b90f7a9f 	str	wzr, [x20, #3960]
    edd8:	2a0103e0 	mov	w0, w1
    eddc:	97ffe1ad 	bl	7490 <_close>
    ede0:	3100041f 	cmn	w0, #0x1
    ede4:	54000080 	b.eq	edf4 <_close_r+0x34>  // b.none
    ede8:	a94153f3 	ldp	x19, x20, [sp, #16]
    edec:	a8c27bfd 	ldp	x29, x30, [sp], #32
    edf0:	d65f03c0 	ret
    edf4:	b94f7a81 	ldr	w1, [x20, #3960]
    edf8:	34ffff81 	cbz	w1, ede8 <_close_r+0x28>
    edfc:	b9000261 	str	w1, [x19]
    ee00:	a94153f3 	ldp	x19, x20, [sp, #16]
    ee04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ee08:	d65f03c0 	ret
    ee0c:	d503201f 	nop

000000000000ee10 <__set_ctype>:
    ee10:	d0000001 	adrp	x1, 10000 <__func__.0+0x10>
    ee14:	9117a021 	add	x1, x1, #0x5e8
    ee18:	f9007c01 	str	x1, [x0, #248]
    ee1c:	d65f03c0 	ret

000000000000ee20 <__errno>:
    ee20:	d0000000 	adrp	x0, 10000 <__func__.0+0x10>
    ee24:	f9438800 	ldr	x0, [x0, #1808]
    ee28:	d65f03c0 	ret
    ee2c:	d503201f 	nop

000000000000ee30 <_fclose_r.part.0>:
    ee30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    ee34:	910003fd 	mov	x29, sp
    ee38:	a90153f3 	stp	x19, x20, [sp, #16]
    ee3c:	aa0103f3 	mov	x19, x1
    ee40:	f90013f5 	str	x21, [sp, #32]
    ee44:	aa0003f5 	mov	x21, x0
    ee48:	97ffeca2 	bl	a0d0 <__sflush_r>
    ee4c:	2a0003f4 	mov	w20, w0
    ee50:	f9402a62 	ldr	x2, [x19, #80]
    ee54:	b40000c2 	cbz	x2, ee6c <_fclose_r.part.0+0x3c>
    ee58:	f9401a61 	ldr	x1, [x19, #48]
    ee5c:	aa1503e0 	mov	x0, x21
    ee60:	d63f0040 	blr	x2
    ee64:	7100001f 	cmp	w0, #0x0
    ee68:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    ee6c:	79402260 	ldrh	w0, [x19, #16]
    ee70:	373802c0 	tbnz	w0, #7, eec8 <_fclose_r.part.0+0x98>
    ee74:	f9402e61 	ldr	x1, [x19, #88]
    ee78:	b40000e1 	cbz	x1, ee94 <_fclose_r.part.0+0x64>
    ee7c:	9101d260 	add	x0, x19, #0x74
    ee80:	eb00003f 	cmp	x1, x0
    ee84:	54000060 	b.eq	ee90 <_fclose_r.part.0+0x60>  // b.none
    ee88:	aa1503e0 	mov	x0, x21
    ee8c:	97ffeef5 	bl	aa60 <_free_r>
    ee90:	f9002e7f 	str	xzr, [x19, #88]
    ee94:	f9403e61 	ldr	x1, [x19, #120]
    ee98:	b4000081 	cbz	x1, eea8 <_fclose_r.part.0+0x78>
    ee9c:	aa1503e0 	mov	x0, x21
    eea0:	97ffeef0 	bl	aa60 <_free_r>
    eea4:	f9003e7f 	str	xzr, [x19, #120]
    eea8:	97ffee1a 	bl	a710 <__sfp_lock_acquire>
    eeac:	7900227f 	strh	wzr, [x19, #16]
    eeb0:	97ffee1c 	bl	a720 <__sfp_lock_release>
    eeb4:	2a1403e0 	mov	w0, w20
    eeb8:	a94153f3 	ldp	x19, x20, [sp, #16]
    eebc:	f94013f5 	ldr	x21, [sp, #32]
    eec0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    eec4:	d65f03c0 	ret
    eec8:	f9400e61 	ldr	x1, [x19, #24]
    eecc:	aa1503e0 	mov	x0, x21
    eed0:	97ffeee4 	bl	aa60 <_free_r>
    eed4:	17ffffe8 	b	ee74 <_fclose_r.part.0+0x44>
    eed8:	d503201f 	nop
    eedc:	d503201f 	nop

000000000000eee0 <_fclose_r>:
    eee0:	b4000301 	cbz	x1, ef40 <_fclose_r+0x60>
    eee4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    eee8:	910003fd 	mov	x29, sp
    eeec:	f9000bf4 	str	x20, [sp, #16]
    eef0:	aa0003f4 	mov	x20, x0
    eef4:	b4000060 	cbz	x0, ef00 <_fclose_r+0x20>
    eef8:	b9405002 	ldr	w2, [x0, #80]
    eefc:	34000162 	cbz	w2, ef28 <_fclose_r+0x48>
    ef00:	79c02020 	ldrsh	w0, [x1, #16]
    ef04:	350000a0 	cbnz	w0, ef18 <_fclose_r+0x38>
    ef08:	52800000 	mov	w0, #0x0                   	// #0
    ef0c:	f9400bf4 	ldr	x20, [sp, #16]
    ef10:	a8c37bfd 	ldp	x29, x30, [sp], #48
    ef14:	d65f03c0 	ret
    ef18:	aa1403e0 	mov	x0, x20
    ef1c:	f9400bf4 	ldr	x20, [sp, #16]
    ef20:	a8c37bfd 	ldp	x29, x30, [sp], #48
    ef24:	17ffffc3 	b	ee30 <_fclose_r.part.0>
    ef28:	f90017e1 	str	x1, [sp, #40]
    ef2c:	97ffedf5 	bl	a700 <__sinit>
    ef30:	f94017e1 	ldr	x1, [sp, #40]
    ef34:	79c02020 	ldrsh	w0, [x1, #16]
    ef38:	34fffe80 	cbz	w0, ef08 <_fclose_r+0x28>
    ef3c:	17fffff7 	b	ef18 <_fclose_r+0x38>
    ef40:	52800000 	mov	w0, #0x0                   	// #0
    ef44:	d65f03c0 	ret
    ef48:	d503201f 	nop
    ef4c:	d503201f 	nop

000000000000ef50 <fclose>:
    ef50:	b4000340 	cbz	x0, efb8 <fclose+0x68>
    ef54:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ef58:	910003fd 	mov	x29, sp
    ef5c:	a90153f3 	stp	x19, x20, [sp, #16]
    ef60:	aa0003f3 	mov	x19, x0
    ef64:	d0000000 	adrp	x0, 10000 <__func__.0+0x10>
    ef68:	f9438814 	ldr	x20, [x0, #1808]
    ef6c:	b4000074 	cbz	x20, ef78 <fclose+0x28>
    ef70:	b9405280 	ldr	w0, [x20, #80]
    ef74:	34000180 	cbz	w0, efa4 <fclose+0x54>
    ef78:	79c02260 	ldrsh	w0, [x19, #16]
    ef7c:	350000a0 	cbnz	w0, ef90 <fclose+0x40>
    ef80:	52800000 	mov	w0, #0x0                   	// #0
    ef84:	a94153f3 	ldp	x19, x20, [sp, #16]
    ef88:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ef8c:	d65f03c0 	ret
    ef90:	aa1303e1 	mov	x1, x19
    ef94:	aa1403e0 	mov	x0, x20
    ef98:	a94153f3 	ldp	x19, x20, [sp, #16]
    ef9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    efa0:	17ffffa4 	b	ee30 <_fclose_r.part.0>
    efa4:	aa1403e0 	mov	x0, x20
    efa8:	97ffedd6 	bl	a700 <__sinit>
    efac:	79c02260 	ldrsh	w0, [x19, #16]
    efb0:	34fffe80 	cbz	w0, ef80 <fclose+0x30>
    efb4:	17fffff7 	b	ef90 <fclose+0x40>
    efb8:	52800000 	mov	w0, #0x0                   	// #0
    efbc:	d65f03c0 	ret

000000000000efc0 <_fstat_r>:
    efc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    efc4:	910003fd 	mov	x29, sp
    efc8:	a90153f3 	stp	x19, x20, [sp, #16]
    efcc:	f0000014 	adrp	x20, 11000 <__global_locale+0x180>
    efd0:	aa0003f3 	mov	x19, x0
    efd4:	b90f7a9f 	str	wzr, [x20, #3960]
    efd8:	2a0103e0 	mov	w0, w1
    efdc:	aa0203e1 	mov	x1, x2
    efe0:	97ffe130 	bl	74a0 <_fstat>
    efe4:	3100041f 	cmn	w0, #0x1
    efe8:	54000080 	b.eq	eff8 <_fstat_r+0x38>  // b.none
    efec:	a94153f3 	ldp	x19, x20, [sp, #16]
    eff0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    eff4:	d65f03c0 	ret
    eff8:	b94f7a81 	ldr	w1, [x20, #3960]
    effc:	34ffff81 	cbz	w1, efec <_fstat_r+0x2c>
    f000:	b9000261 	str	w1, [x19]
    f004:	a94153f3 	ldp	x19, x20, [sp, #16]
    f008:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f00c:	d65f03c0 	ret

000000000000f010 <_findenv_r>:
    f010:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    f014:	910003fd 	mov	x29, sp
    f018:	a90363f7 	stp	x23, x24, [sp, #48]
    f01c:	d0000017 	adrp	x23, 11000 <__global_locale+0x180>
    f020:	aa0103f8 	mov	x24, x1
    f024:	a90153f3 	stp	x19, x20, [sp, #16]
    f028:	a9025bf5 	stp	x21, x22, [sp, #32]
    f02c:	aa0203f5 	mov	x21, x2
    f030:	aa0003f6 	mov	x22, x0
    f034:	940000e7 	bl	f3d0 <__env_lock>
    f038:	f94426f4 	ldr	x20, [x23, #2120]
    f03c:	b40003f4 	cbz	x20, f0b8 <_findenv_r+0xa8>
    f040:	39400303 	ldrb	w3, [x24]
    f044:	aa1803f3 	mov	x19, x24
    f048:	7100f47f 	cmp	w3, #0x3d
    f04c:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    f050:	540000c0 	b.eq	f068 <_findenv_r+0x58>  // b.none
    f054:	d503201f 	nop
    f058:	38401e63 	ldrb	w3, [x19, #1]!
    f05c:	7100f47f 	cmp	w3, #0x3d
    f060:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    f064:	54ffffa1 	b.ne	f058 <_findenv_r+0x48>  // b.any
    f068:	7100f47f 	cmp	w3, #0x3d
    f06c:	54000260 	b.eq	f0b8 <_findenv_r+0xa8>  // b.none
    f070:	f9400280 	ldr	x0, [x20]
    f074:	cb180273 	sub	x19, x19, x24
    f078:	b4000200 	cbz	x0, f0b8 <_findenv_r+0xa8>
    f07c:	93407e73 	sxtw	x19, w19
    f080:	f90023f9 	str	x25, [sp, #64]
    f084:	d503201f 	nop
    f088:	aa1303e2 	mov	x2, x19
    f08c:	aa1803e1 	mov	x1, x24
    f090:	97ffe363 	bl	7e1c <strncmp>
    f094:	350000c0 	cbnz	w0, f0ac <_findenv_r+0x9c>
    f098:	f9400280 	ldr	x0, [x20]
    f09c:	8b130019 	add	x25, x0, x19
    f0a0:	38736800 	ldrb	w0, [x0, x19]
    f0a4:	7100f41f 	cmp	w0, #0x3d
    f0a8:	54000180 	b.eq	f0d8 <_findenv_r+0xc8>  // b.none
    f0ac:	f8408e80 	ldr	x0, [x20, #8]!
    f0b0:	b5fffec0 	cbnz	x0, f088 <_findenv_r+0x78>
    f0b4:	f94023f9 	ldr	x25, [sp, #64]
    f0b8:	aa1603e0 	mov	x0, x22
    f0bc:	940000c9 	bl	f3e0 <__env_unlock>
    f0c0:	d2800000 	mov	x0, #0x0                   	// #0
    f0c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    f0c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    f0cc:	a94363f7 	ldp	x23, x24, [sp, #48]
    f0d0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    f0d4:	d65f03c0 	ret
    f0d8:	f94426e1 	ldr	x1, [x23, #2120]
    f0dc:	aa1603e0 	mov	x0, x22
    f0e0:	cb010281 	sub	x1, x20, x1
    f0e4:	9343fc21 	asr	x1, x1, #3
    f0e8:	b90002a1 	str	w1, [x21]
    f0ec:	940000bd 	bl	f3e0 <__env_unlock>
    f0f0:	91000720 	add	x0, x25, #0x1
    f0f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    f0f8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    f0fc:	a94363f7 	ldp	x23, x24, [sp, #48]
    f100:	f94023f9 	ldr	x25, [sp, #64]
    f104:	a8c57bfd 	ldp	x29, x30, [sp], #80
    f108:	d65f03c0 	ret
    f10c:	d503201f 	nop

000000000000f110 <_getenv_r>:
    f110:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    f114:	910003fd 	mov	x29, sp
    f118:	910073e2 	add	x2, sp, #0x1c
    f11c:	97ffffbd 	bl	f010 <_findenv_r>
    f120:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f124:	d65f03c0 	ret
    f128:	d503201f 	nop
    f12c:	d503201f 	nop

000000000000f130 <_isatty_r>:
    f130:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    f134:	910003fd 	mov	x29, sp
    f138:	a90153f3 	stp	x19, x20, [sp, #16]
    f13c:	d0000014 	adrp	x20, 11000 <__global_locale+0x180>
    f140:	aa0003f3 	mov	x19, x0
    f144:	b90f7a9f 	str	wzr, [x20, #3960]
    f148:	2a0103e0 	mov	w0, w1
    f14c:	97ffe0d9 	bl	74b0 <_isatty>
    f150:	3100041f 	cmn	w0, #0x1
    f154:	54000080 	b.eq	f164 <_isatty_r+0x34>  // b.none
    f158:	a94153f3 	ldp	x19, x20, [sp, #16]
    f15c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f160:	d65f03c0 	ret
    f164:	b94f7a81 	ldr	w1, [x20, #3960]
    f168:	34ffff81 	cbz	w1, f158 <_isatty_r+0x28>
    f16c:	b9000261 	str	w1, [x19]
    f170:	a94153f3 	ldp	x19, x20, [sp, #16]
    f174:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f178:	d65f03c0 	ret
    f17c:	d503201f 	nop

000000000000f180 <_lseek_r>:
    f180:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    f184:	910003fd 	mov	x29, sp
    f188:	a90153f3 	stp	x19, x20, [sp, #16]
    f18c:	d0000014 	adrp	x20, 11000 <__global_locale+0x180>
    f190:	aa0003f3 	mov	x19, x0
    f194:	b90f7a9f 	str	wzr, [x20, #3960]
    f198:	2a0103e0 	mov	w0, w1
    f19c:	aa0203e1 	mov	x1, x2
    f1a0:	2a0303e2 	mov	w2, w3
    f1a4:	97ffe0c7 	bl	74c0 <_lseek>
    f1a8:	b100041f 	cmn	x0, #0x1
    f1ac:	54000080 	b.eq	f1bc <_lseek_r+0x3c>  // b.none
    f1b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    f1b4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f1b8:	d65f03c0 	ret
    f1bc:	b94f7a81 	ldr	w1, [x20, #3960]
    f1c0:	34ffff81 	cbz	w1, f1b0 <_lseek_r+0x30>
    f1c4:	b9000261 	str	w1, [x19]
    f1c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    f1cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f1d0:	d65f03c0 	ret
    f1d4:	d503201f 	nop
    f1d8:	d503201f 	nop
    f1dc:	d503201f 	nop

000000000000f1e0 <_read_r>:
    f1e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    f1e4:	910003fd 	mov	x29, sp
    f1e8:	a90153f3 	stp	x19, x20, [sp, #16]
    f1ec:	d0000014 	adrp	x20, 11000 <__global_locale+0x180>
    f1f0:	aa0003f3 	mov	x19, x0
    f1f4:	2a0103e0 	mov	w0, w1
    f1f8:	aa0203e1 	mov	x1, x2
    f1fc:	b90f7a9f 	str	wzr, [x20, #3960]
    f200:	aa0303e2 	mov	x2, x3
    f204:	97ffe0b3 	bl	74d0 <_read>
    f208:	93407c01 	sxtw	x1, w0
    f20c:	3100041f 	cmn	w0, #0x1
    f210:	540000a0 	b.eq	f224 <_read_r+0x44>  // b.none
    f214:	aa0103e0 	mov	x0, x1
    f218:	a94153f3 	ldp	x19, x20, [sp, #16]
    f21c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f220:	d65f03c0 	ret
    f224:	b94f7a80 	ldr	w0, [x20, #3960]
    f228:	34ffff60 	cbz	w0, f214 <_read_r+0x34>
    f22c:	b9000260 	str	w0, [x19]
    f230:	aa0103e0 	mov	x0, x1
    f234:	a94153f3 	ldp	x19, x20, [sp, #16]
    f238:	a8c27bfd 	ldp	x29, x30, [sp], #32
    f23c:	d65f03c0 	ret

000000000000f240 <cleanup_glue>:
    f240:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    f244:	910003fd 	mov	x29, sp
    f248:	a9025bf5 	stp	x21, x22, [sp, #32]
    f24c:	f9400035 	ldr	x21, [x1]
    f250:	a90153f3 	stp	x19, x20, [sp, #16]
    f254:	aa0103f3 	mov	x19, x1
    f258:	aa0003f4 	mov	x20, x0
    f25c:	b4000275 	cbz	x21, f2a8 <cleanup_glue+0x68>
    f260:	f94002b6 	ldr	x22, [x21]
    f264:	b40001d6 	cbz	x22, f29c <cleanup_glue+0x5c>
    f268:	f9001bf7 	str	x23, [sp, #48]
    f26c:	f94002d7 	ldr	x23, [x22]
    f270:	b40000f7 	cbz	x23, f28c <cleanup_glue+0x4c>
    f274:	f94002e1 	ldr	x1, [x23]
    f278:	b4000041 	cbz	x1, f280 <cleanup_glue+0x40>
    f27c:	97fffff1 	bl	f240 <cleanup_glue>
    f280:	aa1703e1 	mov	x1, x23
    f284:	aa1403e0 	mov	x0, x20
    f288:	97ffedf6 	bl	aa60 <_free_r>
    f28c:	aa1603e1 	mov	x1, x22
    f290:	aa1403e0 	mov	x0, x20
    f294:	97ffedf3 	bl	aa60 <_free_r>
    f298:	f9401bf7 	ldr	x23, [sp, #48]
    f29c:	aa1503e1 	mov	x1, x21
    f2a0:	aa1403e0 	mov	x0, x20
    f2a4:	97ffedef 	bl	aa60 <_free_r>
    f2a8:	aa1303e1 	mov	x1, x19
    f2ac:	aa1403e0 	mov	x0, x20
    f2b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    f2b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    f2b8:	a8c47bfd 	ldp	x29, x30, [sp], #64
    f2bc:	17ffede9 	b	aa60 <_free_r>

000000000000f2c0 <_reclaim_reent>:
    f2c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    f2c4:	b0000001 	adrp	x1, 10000 <__func__.0+0x10>
    f2c8:	910003fd 	mov	x29, sp
    f2cc:	a90153f3 	stp	x19, x20, [sp, #16]
    f2d0:	aa0003f4 	mov	x20, x0
    f2d4:	f9438820 	ldr	x0, [x1, #1808]
    f2d8:	eb14001f 	cmp	x0, x20
    f2dc:	54000500 	b.eq	f37c <_reclaim_reent+0xbc>  // b.none
    f2e0:	f9403e81 	ldr	x1, [x20, #120]
    f2e4:	f90013f5 	str	x21, [sp, #32]
    f2e8:	b40001e1 	cbz	x1, f324 <_reclaim_reent+0x64>
    f2ec:	d2800015 	mov	x21, #0x0                   	// #0
    f2f0:	f8756833 	ldr	x19, [x1, x21]
    f2f4:	b40000f3 	cbz	x19, f310 <_reclaim_reent+0x50>
    f2f8:	aa1303e1 	mov	x1, x19
    f2fc:	aa1403e0 	mov	x0, x20
    f300:	f9400273 	ldr	x19, [x19]
    f304:	97ffedd7 	bl	aa60 <_free_r>
    f308:	b5ffff93 	cbnz	x19, f2f8 <_reclaim_reent+0x38>
    f30c:	f9403e81 	ldr	x1, [x20, #120]
    f310:	910022b5 	add	x21, x21, #0x8
    f314:	f10802bf 	cmp	x21, #0x200
    f318:	54fffec1 	b.ne	f2f0 <_reclaim_reent+0x30>  // b.any
    f31c:	aa1403e0 	mov	x0, x20
    f320:	97ffedd0 	bl	aa60 <_free_r>
    f324:	f9403281 	ldr	x1, [x20, #96]
    f328:	b4000061 	cbz	x1, f334 <_reclaim_reent+0x74>
    f32c:	aa1403e0 	mov	x0, x20
    f330:	97ffedcc 	bl	aa60 <_free_r>
    f334:	f940fe93 	ldr	x19, [x20, #504]
    f338:	b4000153 	cbz	x19, f360 <_reclaim_reent+0xa0>
    f33c:	91080295 	add	x21, x20, #0x200
    f340:	eb15027f 	cmp	x19, x21
    f344:	540000e0 	b.eq	f360 <_reclaim_reent+0xa0>  // b.none
    f348:	aa1303e1 	mov	x1, x19
    f34c:	aa1403e0 	mov	x0, x20
    f350:	f9400273 	ldr	x19, [x19]
    f354:	97ffedc3 	bl	aa60 <_free_r>
    f358:	eb1302bf 	cmp	x21, x19
    f35c:	54ffff61 	b.ne	f348 <_reclaim_reent+0x88>  // b.any
    f360:	f9404681 	ldr	x1, [x20, #136]
    f364:	b4000061 	cbz	x1, f370 <_reclaim_reent+0xb0>
    f368:	aa1403e0 	mov	x0, x20
    f36c:	97ffedbd 	bl	aa60 <_free_r>
    f370:	b9405280 	ldr	w0, [x20, #80]
    f374:	350000a0 	cbnz	w0, f388 <_reclaim_reent+0xc8>
    f378:	f94013f5 	ldr	x21, [sp, #32]
    f37c:	a94153f3 	ldp	x19, x20, [sp, #16]
    f380:	a8c37bfd 	ldp	x29, x30, [sp], #48
    f384:	d65f03c0 	ret
    f388:	f9402e81 	ldr	x1, [x20, #88]
    f38c:	aa1403e0 	mov	x0, x20
    f390:	d63f0020 	blr	x1
    f394:	f9429293 	ldr	x19, [x20, #1312]
    f398:	b4ffff13 	cbz	x19, f378 <_reclaim_reent+0xb8>
    f39c:	f9400261 	ldr	x1, [x19]
    f3a0:	b4000061 	cbz	x1, f3ac <_reclaim_reent+0xec>
    f3a4:	aa1403e0 	mov	x0, x20
    f3a8:	97ffffa6 	bl	f240 <cleanup_glue>
    f3ac:	aa1303e1 	mov	x1, x19
    f3b0:	aa1403e0 	mov	x0, x20
    f3b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    f3b8:	f94013f5 	ldr	x21, [sp, #32]
    f3bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    f3c0:	17ffeda8 	b	aa60 <_free_r>
    f3c4:	d503201f 	nop
    f3c8:	d503201f 	nop
    f3cc:	d503201f 	nop

000000000000f3d0 <__env_lock>:
    f3d0:	d65f03c0 	ret
    f3d4:	d503201f 	nop
    f3d8:	d503201f 	nop
    f3dc:	d503201f 	nop

000000000000f3e0 <__env_unlock>:
    f3e0:	d65f03c0 	ret

Disassembly of section .init:

0000000000400000 <_init>:
  400000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  400004:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
  400008:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
  40000c:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
  400010:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
  400014:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
  400018:	a8c153f3 	ldp	x19, x20, [sp], #16
  40001c:	a8c15bf5 	ldp	x21, x22, [sp], #16
  400020:	a8c163f7 	ldp	x23, x24, [sp], #16
  400024:	a8c16bf9 	ldp	x25, x26, [sp], #16
  400028:	a8c173fb 	ldp	x27, x28, [sp], #16
  40002c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  400030:	d65f03c0 	ret

Disassembly of section .fini:

000000000000f3e4 <_fini>:
    f3e4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    f3e8:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    f3ec:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    f3f0:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    f3f4:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    f3f8:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    f3fc:	a8c153f3 	ldp	x19, x20, [sp], #16
    f400:	a8c15bf5 	ldp	x21, x22, [sp], #16
    f404:	a8c163f7 	ldp	x23, x24, [sp], #16
    f408:	a8c16bf9 	ldp	x25, x26, [sp], #16
    f40c:	a8c173fb 	ldp	x27, x28, [sp], #16
    f410:	a8c17bfd 	ldp	x29, x30, [sp], #16
    f414:	d65f03c0 	ret
