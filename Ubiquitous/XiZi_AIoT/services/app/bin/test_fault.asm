
test_fault:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:

#include "libserial.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
       0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    printf("Test memry error %s.\n", 0x50000000);
       4:	52aa0001 	mov	w1, #0x50000000            	// #1342177280
       8:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
       c:	91162000 	add	x0, x0, #0x588
{
      10:	910003fd 	mov	x29, sp
    printf("Test memry error %s.\n", 0x50000000);
      14:	940006ef 	bl	1bd0 <printf>
    printf("After error computing.\n");
      18:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
      1c:	91168000 	add	x0, x0, #0x5a0
      20:	940006ec 	bl	1bd0 <printf>

    exit(0);
      24:	52800000 	mov	w0, #0x0                   	// #0
      28:	940007e6 	bl	1fc0 <exit>
    return 0;
}
      2c:	52800000 	mov	w0, #0x0                   	// #0
      30:	a8c17bfd 	ldp	x29, x30, [sp], #16
      34:	d65f03c0 	ret
      38:	d503201f 	nop
      3c:	d503201f 	nop

0000000000000040 <deregister_tm_clones>:
      40:	90000020 	adrp	x0, 4000 <impure_data+0x60>
      44:	911ba000 	add	x0, x0, #0x6e8
      48:	90000021 	adrp	x1, 4000 <impure_data+0x60>
      4c:	911ba021 	add	x1, x1, #0x6e8
      50:	eb00003f 	cmp	x1, x0
      54:	540000c0 	b.eq	6c <deregister_tm_clones+0x2c>  // b.none
      58:	f0000001 	adrp	x1, 3000 <_malloc_trim_r+0x50>
      5c:	f942b421 	ldr	x1, [x1, #1384]
      60:	b4000061 	cbz	x1, 6c <deregister_tm_clones+0x2c>
      64:	aa0103f0 	mov	x16, x1
      68:	d61f0200 	br	x16
      6c:	d65f03c0 	ret

0000000000000070 <register_tm_clones>:
      70:	90000020 	adrp	x0, 4000 <impure_data+0x60>
      74:	911ba000 	add	x0, x0, #0x6e8
      78:	90000021 	adrp	x1, 4000 <impure_data+0x60>
      7c:	911ba021 	add	x1, x1, #0x6e8
      80:	cb000021 	sub	x1, x1, x0
      84:	d37ffc22 	lsr	x2, x1, #63
      88:	8b810c41 	add	x1, x2, x1, asr #3
      8c:	9341fc21 	asr	x1, x1, #1
      90:	b40000c1 	cbz	x1, a8 <register_tm_clones+0x38>
      94:	f0000002 	adrp	x2, 3000 <_malloc_trim_r+0x50>
      98:	f942b842 	ldr	x2, [x2, #1392]
      9c:	b4000062 	cbz	x2, a8 <register_tm_clones+0x38>
      a0:	aa0203f0 	mov	x16, x2
      a4:	d61f0200 	br	x16
      a8:	d65f03c0 	ret
      ac:	d503201f 	nop

00000000000000b0 <__do_global_dtors_aux>:
      b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
      b4:	910003fd 	mov	x29, sp
      b8:	f9000bf3 	str	x19, [sp, #16]
      bc:	90000033 	adrp	x19, 4000 <impure_data+0x60>
      c0:	395ba260 	ldrb	w0, [x19, #1768]
      c4:	35000140 	cbnz	w0, ec <__do_global_dtors_aux+0x3c>
      c8:	97ffffde 	bl	40 <deregister_tm_clones>
      cc:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
      d0:	f942bc00 	ldr	x0, [x0, #1400]
      d4:	b4000080 	cbz	x0, e4 <__do_global_dtors_aux+0x34>
      d8:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
      dc:	911d6000 	add	x0, x0, #0x758
      e0:	d503201f 	nop
      e4:	52800020 	mov	w0, #0x1                   	// #1
      e8:	391ba260 	strb	w0, [x19, #1768]
      ec:	f9400bf3 	ldr	x19, [sp, #16]
      f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
      f4:	d65f03c0 	ret
      f8:	d503201f 	nop
      fc:	d503201f 	nop

0000000000000100 <frame_dummy>:
     100:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     104:	f942c000 	ldr	x0, [x0, #1408]
     108:	b4000140 	cbz	x0, 130 <frame_dummy+0x30>
     10c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     110:	90000021 	adrp	x1, 4000 <impure_data+0x60>
     114:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     118:	910003fd 	mov	x29, sp
     11c:	911bc021 	add	x1, x1, #0x6f0
     120:	911d6000 	add	x0, x0, #0x758
     124:	d503201f 	nop
     128:	a8c17bfd 	ldp	x29, x30, [sp], #16
     12c:	17ffffd1 	b	70 <register_tm_clones>
     130:	17ffffd0 	b	70 <register_tm_clones>
     134:	d503201f 	nop

0000000000000138 <_mainCRTStartup>:
     138:	58000281 	ldr	x1, 188 <_cpu_init_hook+0x4>
     13c:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     140:	9100001f 	mov	sp, x0
     144:	d280001d 	mov	x29, #0x0                   	// #0
     148:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     14c:	910003fd 	mov	x29, sp
     150:	9400000d 	bl	184 <_cpu_init_hook>
     154:	580001e0 	ldr	x0, 190 <_cpu_init_hook+0xc>
     158:	52800001 	mov	w1, #0x0                   	// #0
     15c:	580001e2 	ldr	x2, 198 <_cpu_init_hook+0x14>
     160:	cb000042 	sub	x2, x2, x0
     164:	94000ad7 	bl	2cc0 <memset>
     168:	580001c0 	ldr	x0, 1a0 <_cpu_init_hook+0x1c>
     16c:	94000879 	bl	2350 <atexit>
     170:	94000894 	bl	23c0 <__libc_init_array>
     174:	d2800000 	mov	x0, #0x0                   	// #0
     178:	d2800001 	mov	x1, #0x0                   	// #0
     17c:	97ffffa1 	bl	0 <main>
     180:	14000790 	b	1fc0 <exit>

0000000000000184 <_cpu_init_hook>:
     184:	d65f03c0 	ret
	...
     190:	000046e8 	.word	0x000046e8
     194:	00000000 	.word	0x00000000
     198:	00004778 	.word	0x00004778
     19c:	00000000 	.word	0x00000000
     1a0:	00002370 	.word	0x00002370
     1a4:	00000000 	.word	0x00000000
     1a8:	d503201f 	.word	0xd503201f
     1ac:	d503201f 	.word	0xd503201f

00000000000001b0 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     1b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     1b4:	52800020 	mov	w0, #0x1                   	// #1
{
     1b8:	910003fd 	mov	x29, sp
     1bc:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     1c0:	90000033 	adrp	x19, 4000 <impure_data+0x60>
     1c4:	b9472261 	ldr	w1, [x19, #1824]
     1c8:	34000081 	cbz	w1, 1d8 <init_uart_mmio+0x28>
}
     1cc:	f9400bf3 	ldr	x19, [sp, #16]
     1d0:	a8c27bfd 	ldp	x29, x30, [sp], #32
     1d4:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     1d8:	2a0003e3 	mov	w3, w0
     1dc:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     1e0:	52820002 	mov	w2, #0x1000                	// #4096
     1e4:	aa0103e0 	mov	x0, x1
     1e8:	940007de 	bl	2160 <mmap>
     1ec:	3100041f 	cmn	w0, #0x1
            return false;
     1f0:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     1f4:	54fffec0 	b.eq	1cc <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     1f8:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     1fc:	2a0103e0 	mov	w0, w1
        mapped = 1;
     200:	b9072261 	str	w1, [x19, #1824]
}
     204:	f9400bf3 	ldr	x19, [sp, #16]
     208:	a8c27bfd 	ldp	x29, x30, [sp], #32
     20c:	d65f03c0 	ret

0000000000000210 <putc>:

void putc(char ch)
{
     210:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     214:	7100281f 	cmp	w0, #0xa
     218:	540000c0 	b.eq	230 <putc+0x20>  // b.none
    return in_le32(addr);
     21c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     220:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     224:	362fffe1 	tbz	w1, #5, 220 <putc+0x10>
    out_le32(addr, value);
     228:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     22c:	d65f03c0 	ret
    return in_le32(addr);
     230:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     234:	d503201f 	nop
     238:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     23c:	362fffe1 	tbz	w1, #5, 238 <putc+0x28>
    out_le32(addr, value);
     240:	528001a1 	mov	w1, #0xd                   	// #13
     244:	b9000041 	str	w1, [x2]
}
     248:	17fffff5 	b	21c <putc+0xc>
     24c:	d503201f 	nop

0000000000000250 <getc>:
    return in_le32(addr);
     250:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     254:	d503201f 	nop
     258:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     25c:	3607ffe0 	tbz	w0, #0, 258 <getc+0x8>
    return in_le32(addr);
     260:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     264:	d65f03c0 	ret
     268:	d503201f 	nop
     26c:	d503201f 	nop

0000000000000270 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     270:	eb03005f 	cmp	x2, x3
{
     274:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     278:	54000042 	b.cs	280 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     27c:	38226820 	strb	w0, [x1, x2]
    }
}
     280:	d65f03c0 	ret
     284:	d503201f 	nop
     288:	d503201f 	nop
     28c:	d503201f 	nop

0000000000000290 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     290:	d65f03c0 	ret
     294:	d503201f 	nop
     298:	d503201f 	nop
     29c:	d503201f 	nop

00000000000002a0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     2a0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     2a4:	910003fd 	mov	x29, sp
     2a8:	a90153f3 	stp	x19, x20, [sp, #16]
     2ac:	aa0503f3 	mov	x19, x5
     2b0:	aa0203f4 	mov	x20, x2
     2b4:	a9025bf5 	stp	x21, x22, [sp, #32]
     2b8:	aa0003f5 	mov	x21, x0
     2bc:	aa0103f6 	mov	x22, x1
     2c0:	a90363f7 	stp	x23, x24, [sp, #48]
     2c4:	aa0203f7 	mov	x23, x2
     2c8:	aa0403f8 	mov	x24, x4
     2cc:	a9046bf9 	stp	x25, x26, [sp, #64]
     2d0:	2a0703fa 	mov	w26, w7
     2d4:	2a0603f9 	mov	w25, w6
     2d8:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     2dc:	f240075f 	tst	x26, #0x3
{
     2e0:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     2e4:	540001e1 	b.ne	320 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     2e8:	2a0603e0 	mov	w0, w6
     2ec:	aa0203fc 	mov	x28, x2
     2f0:	cb050014 	sub	x20, x0, x5
     2f4:	eb0000bf 	cmp	x5, x0
     2f8:	8b020294 	add	x20, x20, x2
     2fc:	54000542 	b.cs	3a4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     300:	aa1c03e2 	mov	x2, x28
     304:	aa1b03e3 	mov	x3, x27
     308:	9100079c 	add	x28, x28, #0x1
     30c:	aa1603e1 	mov	x1, x22
     310:	52800400 	mov	w0, #0x20                  	// #32
     314:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     318:	eb1c029f 	cmp	x20, x28
     31c:	54ffff21 	b.ne	300 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     320:	8b14027c 	add	x28, x19, x20
     324:	b4000133 	cbz	x19, 348 <_out_rev+0xa8>
     328:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     32c:	d1000673 	sub	x19, x19, #0x1
     330:	aa1c03f4 	mov	x20, x28
     334:	aa1b03e3 	mov	x3, x27
     338:	aa1603e1 	mov	x1, x22
     33c:	38736b00 	ldrb	w0, [x24, x19]
     340:	d63f02a0 	blr	x21
    while (len) {
     344:	b5ffff33 	cbnz	x19, 328 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     348:	360801fa 	tbz	w26, #1, 384 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     34c:	cb170297 	sub	x23, x20, x23
     350:	2a1903f9 	mov	w25, w25
     354:	eb1902ff 	cmp	x23, x25
     358:	54000162 	b.cs	384 <_out_rev+0xe4>  // b.hs, b.nlast
     35c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     360:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     364:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     368:	aa1b03e3 	mov	x3, x27
     36c:	aa1603e1 	mov	x1, x22
     370:	52800400 	mov	w0, #0x20                  	// #32
     374:	d63f02a0 	blr	x21
     378:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     37c:	eb1902ff 	cmp	x23, x25
     380:	54ffff03 	b.cc	360 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     384:	aa1403e0 	mov	x0, x20
     388:	a94153f3 	ldp	x19, x20, [sp, #16]
     38c:	a9425bf5 	ldp	x21, x22, [sp, #32]
     390:	a94363f7 	ldp	x23, x24, [sp, #48]
     394:	a9446bf9 	ldp	x25, x26, [sp, #64]
     398:	a94573fb 	ldp	x27, x28, [sp, #80]
     39c:	a8c67bfd 	ldp	x29, x30, [sp], #96
     3a0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     3a4:	aa0203f4 	mov	x20, x2
     3a8:	17ffffde 	b	320 <_out_rev+0x80>
     3ac:	d503201f 	nop

00000000000003b0 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     3b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     3b4:	aa0603eb 	mov	x11, x6
     3b8:	aa0403e9 	mov	x9, x4
     3bc:	910003fd 	mov	x29, sp
     3c0:	b9403be8 	ldr	w8, [sp, #56]
     3c4:	2a0703ef 	mov	w15, w7
     3c8:	b94033e6 	ldr	w6, [sp, #48]
     3cc:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     3d0:	12160110 	and	w16, w8, #0x400
    if (!value) {
     3d4:	b5000c64 	cbnz	x4, 560 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     3d8:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     3dc:	34000730 	cbz	w16, 4c0 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     3e0:	121f0111 	and	w17, w8, #0x2
     3e4:	37080fc8 	tbnz	w8, #1, 5dc <_ntoa_long+0x22c>
    size_t len = 0U;
     3e8:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     3ec:	2a0f03e9 	mov	w9, w15
     3f0:	f1007cbf 	cmp	x5, #0x1f
     3f4:	910043e4 	add	x4, sp, #0x10
     3f8:	1a9f87ea 	cset	w10, ls  // ls = plast
     3fc:	eb05013f 	cmp	x9, x5
     400:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     404:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     408:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     40c:	350009c6 	cbnz	w6, 544 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     410:	34000108 	cbz	w8, 430 <_ntoa_long+0x80>
            buf[len++] = '0';
     414:	5280060a 	mov	w10, #0x30                  	// #48
     418:	910004a5 	add	x5, x5, #0x1
     41c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     420:	eb05013f 	cmp	x9, x5
     424:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     428:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     42c:	54ffff69 	b.ls	418 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     430:	340001cc 	cbz	w12, 468 <_ntoa_long+0xb8>
     434:	f1007cbf 	cmp	x5, #0x1f
     438:	1a9f87ea 	cset	w10, ls  // ls = plast
     43c:	7100015f 	cmp	w10, #0x0
     440:	2a0603e9 	mov	w9, w6
     444:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     448:	54000109 	b.ls	468 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     44c:	5280060a 	mov	w10, #0x30                  	// #48
     450:	910004a5 	add	x5, x5, #0x1
     454:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     458:	eb05013f 	cmp	x9, x5
     45c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     460:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     464:	54ffff69 	b.ls	450 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     468:	340001b1 	cbz	w17, 49c <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     46c:	350008b0 	cbnz	w16, 580 <_ntoa_long+0x1d0>
     470:	b50007e5 	cbnz	x5, 56c <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     474:	f100417f 	cmp	x11, #0x10
     478:	54000f20 	b.eq	65c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     47c:	f100097f 	cmp	x11, #0x2
     480:	54000f21 	b.ne	664 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     484:	52800c48 	mov	w8, #0x62                  	// #98
     488:	d2800025 	mov	x5, #0x1                   	// #1
     48c:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     490:	52800608 	mov	w8, #0x30                  	// #48
     494:	38256888 	strb	w8, [x4, x5]
     498:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     49c:	f10080bf 	cmp	x5, #0x20
     4a0:	540000a0 	b.eq	4b4 <_ntoa_long+0x104>  // b.none
        if (negative) {
     4a4:	340008d2 	cbz	w18, 5bc <_ntoa_long+0x20c>
            buf[len++] = '-';
     4a8:	528005a8 	mov	w8, #0x2d                  	// #45
     4ac:	38256888 	strb	w8, [x4, x5]
     4b0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     4b4:	97ffff7b 	bl	2a0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     4b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     4bc:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     4c0:	52800011 	mov	w17, #0x0                   	// #0
     4c4:	f27b00ff 	tst	x7, #0x20
     4c8:	52800c24 	mov	w4, #0x61                  	// #97
     4cc:	5280082e 	mov	w14, #0x41                  	// #65
     4d0:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     4d4:	510029ce 	sub	w14, w14, #0xa
     4d8:	910043e4 	add	x4, sp, #0x10
     4dc:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     4e0:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     4e4:	910004a5 	add	x5, x5, #0x1
     4e8:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     4ec:	9b0ba58a 	msub	x10, x12, x11, x9
     4f0:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     4f4:	f100255f 	cmp	x10, #0x9
     4f8:	1100c10a 	add	w10, w8, #0x30
     4fc:	0b0e0108 	add	w8, w8, w14
     500:	12001d4a 	and	w10, w10, #0xff
     504:	12001d08 	and	w8, w8, #0xff
     508:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     50c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     510:	eb0b013f 	cmp	x9, x11
            value /= base;
     514:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     518:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     51c:	54fffe29 	b.ls	4e0 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     520:	370ffa47 	tbnz	w7, #1, 468 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     524:	f1007cbf 	cmp	x5, #0x1f
     528:	2a0f03e9 	mov	w9, w15
     52c:	1a9f87ea 	cset	w10, ls  // ls = plast
     530:	eb05013f 	cmp	x9, x5
     534:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     538:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     53c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     540:	34fff686 	cbz	w6, 410 <_ntoa_long+0x60>
     544:	3400048c 	cbz	w12, 5d4 <_ntoa_long+0x224>
     548:	35000072 	cbnz	w18, 554 <_ntoa_long+0x1a4>
     54c:	721e04ff 	tst	w7, #0xc
     550:	54000040 	b.eq	558 <_ntoa_long+0x1a8>  // b.none
            width--;
     554:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     558:	35fff5e8 	cbnz	w8, 414 <_ntoa_long+0x64>
     55c:	17ffffb8 	b	43c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     560:	121c0111 	and	w17, w8, #0x10
     564:	2a0803e7 	mov	w7, w8
     568:	17ffffd7 	b	4c4 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     56c:	eb2f40bf 	cmp	x5, w15, uxtw
     570:	54000480 	b.eq	600 <_ntoa_long+0x250>  // b.none
     574:	eb2640bf 	cmp	x5, w6, uxtw
     578:	54000440 	b.eq	600 <_ntoa_long+0x250>  // b.none
     57c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     580:	f1007cbf 	cmp	x5, #0x1f
     584:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     588:	f100417f 	cmp	x11, #0x10
     58c:	54000480 	b.eq	61c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     590:	7100011f 	cmp	w8, #0x0
     594:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     598:	54000081 	b.ne	5a8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     59c:	52800c48 	mov	w8, #0x62                  	// #98
     5a0:	38256888 	strb	w8, [x4, x5]
     5a4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     5a8:	f10080bf 	cmp	x5, #0x20
     5ac:	54fff721 	b.ne	490 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     5b0:	97ffff3c 	bl	2a0 <_out_rev>
}
     5b4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     5b8:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     5bc:	37100167 	tbnz	w7, #2, 5e8 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     5c0:	361ff7a7 	tbz	w7, #3, 4b4 <_ntoa_long+0x104>
            buf[len++] = ' ';
     5c4:	52800408 	mov	w8, #0x20                  	// #32
     5c8:	38256888 	strb	w8, [x4, x5]
     5cc:	910004a5 	add	x5, x5, #0x1
     5d0:	17ffffb9 	b	4b4 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5d4:	35fff208 	cbnz	w8, 414 <_ntoa_long+0x64>
     5d8:	17ffffa4 	b	468 <_ntoa_long+0xb8>
     5dc:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     5e0:	d2800005 	mov	x5, #0x0                   	// #0
     5e4:	17ffffb0 	b	4a4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     5e8:	52800568 	mov	w8, #0x2b                  	// #43
     5ec:	38256888 	strb	w8, [x4, x5]
     5f0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     5f4:	97ffff2b 	bl	2a0 <_out_rev>
}
     5f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     5fc:	d65f03c0 	ret
            if (len && (base == 16U)) {
     600:	f10004aa 	subs	x10, x5, #0x1
                len--;
     604:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     608:	1a9f07e8 	cset	w8, ne  // ne = any
     60c:	7100417f 	cmp	w11, #0x10
     610:	1a9f17e9 	cset	w9, eq  // eq = none
     614:	6a090108 	ands	w8, w8, w9
     618:	54000160 	b.eq	644 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     61c:	721b00e9 	ands	w9, w7, #0x20
     620:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     624:	54000141 	b.ne	64c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     628:	7100013f 	cmp	w9, #0x0
     62c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     630:	54fffbc0 	b.eq	5a8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     634:	52800b08 	mov	w8, #0x58                  	// #88
     638:	38256888 	strb	w8, [x4, x5]
     63c:	910004a5 	add	x5, x5, #0x1
     640:	17ffffda 	b	5a8 <_ntoa_long+0x1f8>
            len--;
     644:	aa0a03e5 	mov	x5, x10
     648:	17ffffce 	b	580 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     64c:	52800f08 	mov	w8, #0x78                  	// #120
     650:	38256888 	strb	w8, [x4, x5]
     654:	910004a5 	add	x5, x5, #0x1
     658:	17ffffd4 	b	5a8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     65c:	52800028 	mov	w8, #0x1                   	// #1
     660:	17ffffef 	b	61c <_ntoa_long+0x26c>
            buf[len++] = '0';
     664:	52800608 	mov	w8, #0x30                  	// #48
     668:	d2800025 	mov	x5, #0x1                   	// #1
     66c:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     670:	17ffff8d 	b	4a4 <_ntoa_long+0xf4>
     674:	d503201f 	nop
     678:	d503201f 	nop
     67c:	d503201f 	nop

0000000000000680 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     680:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     684:	1e602000 	fcmp	d0, d0
{
     688:	a9017bfd 	stp	x29, x30, [sp, #16]
     68c:	910043fd 	add	x29, sp, #0x10
     690:	a90253f3 	stp	x19, x20, [sp, #32]
     694:	aa0203f3 	mov	x19, x2
     698:	2a0603f4 	mov	w20, w6
     69c:	a9035bf5 	stp	x21, x22, [sp, #48]
     6a0:	2a0503f6 	mov	w22, w5
     6a4:	a90463f7 	stp	x23, x24, [sp, #64]
     6a8:	aa0003f7 	mov	x23, x0
     6ac:	a9056bf9 	stp	x25, x26, [sp, #80]
     6b0:	aa0103f9 	mov	x25, x1
     6b4:	a90673fb 	stp	x27, x28, [sp, #96]
     6b8:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     6bc:	54001361 	b.ne	928 <_etoa+0x2a8>  // b.any
     6c0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     6c4:	9e670001 	fmov	d1, x0
     6c8:	1e612010 	fcmpe	d0, d1
     6cc:	540012ec 	b.gt	928 <_etoa+0x2a8>
     6d0:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     6d4:	9e670001 	fmov	d1, x0
     6d8:	1e612010 	fcmpe	d0, d1
     6dc:	54001264 	b.mi	928 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     6e0:	1e602018 	fcmpe	d0, #0.0
     6e4:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     6e8:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     6ec:	fd437417 	ldr	d23, [x0, #1768]
     6f0:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     6f4:	fd437801 	ldr	d1, [x0, #1776]
     6f8:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     6fc:	fd437c16 	ldr	d22, [x0, #1784]
     700:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     704:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     708:	fd438006 	ldr	d6, [x0, #1792]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     70c:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     710:	fd438415 	ldr	d21, [x0, #1800]
     714:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     718:	fd438814 	ldr	d20, [x0, #1808]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     71c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     720:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     724:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     728:	1e659002 	fmov	d2, #1.400000000000000000e+01
     72c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     730:	1e631013 	fmov	d19, #6.000000000000000000e+00
     734:	1e601010 	fmov	d16, #2.000000000000000000e+00
     738:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     73c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     740:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     744:	d374f821 	ubfx	x1, x1, #52, #11
     748:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     74c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     750:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     754:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     758:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     75c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     760:	1e7838a5 	fsub	d5, d5, d24
     764:	1e770884 	fmul	d4, d4, d23
     768:	1e7608a5 	fmul	d5, d5, d22
     76c:	1e612884 	fadd	d4, d4, d1
     770:	1e652884 	fadd	d4, d4, d5
     774:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     778:	1e620301 	scvtf	d1, w24
     77c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     780:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     784:	1e632884 	fadd	d4, d4, d3
     788:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     78c:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     790:	110ffc00 	add	w0, w0, #0x3ff
     794:	9e670004 	fmov	d4, x0
     798:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     79c:	1e740863 	fmul	d3, d3, d20
     7a0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     7a4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     7a8:	1e613a05 	fsub	d5, d16, d1
     7ac:	1e612821 	fadd	d1, d1, d1
     7b0:	1e621862 	fdiv	d2, d3, d2
     7b4:	1e712842 	fadd	d2, d2, d17
     7b8:	1e621862 	fdiv	d2, d3, d2
     7bc:	1e732842 	fadd	d2, d2, d19
     7c0:	1e621863 	fdiv	d3, d3, d2
     7c4:	1e652863 	fadd	d3, d3, d5
     7c8:	1e631821 	fdiv	d1, d1, d3
     7cc:	1e722821 	fadd	d1, d1, d18
     7d0:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     7d4:	1e672030 	fcmpe	d1, d7
     7d8:	54000c4c 	b.gt	960 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     7dc:	11018f00 	add	w0, w24, #0x63
     7e0:	7103181f 	cmp	w0, #0xc6
     7e4:	1a9f97fc 	cset	w28, hi  // hi = pmore
     7e8:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     7ec:	36580134 	tbz	w20, #11, 810 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     7f0:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     7f4:	fd438c02 	ldr	d2, [x0, #1816]
     7f8:	1e6220f0 	fcmpe	d7, d2
     7fc:	54000d2a 	b.ge	9a0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     800:	34000084 	cbz	w4, 810 <_etoa+0x190>
                --prec;
     804:	7100007f 	cmp	w3, #0x0
     808:	1a9f07e0 	cset	w0, ne  // ne = any
     80c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     810:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     814:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     818:	4b1c02c5 	sub	w5, w22, w28
     81c:	5280003a 	mov	w26, #0x1                   	// #1
     820:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     824:	7100001f 	cmp	w0, #0x0
     828:	1a9f07e0 	cset	w0, ne  // ne = any
     82c:	b9007fe0 	str	w0, [sp, #124]
     830:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     834:	34000058 	cbz	w24, 83c <_etoa+0x1bc>
        value /= conv.F;
     838:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     83c:	1e602018 	fcmpe	d0, #0.0
     840:	54000ac4 	b.mi	998 <_etoa+0x318>  // b.first
     844:	1e6040e0 	fmov	d0, d7
     848:	12147a86 	and	w6, w20, #0xfffff7ff
     84c:	aa1b03e3 	mov	x3, x27
     850:	aa1303e2 	mov	x2, x19
     854:	aa1903e1 	mov	x1, x25
     858:	aa1703e0 	mov	x0, x23
     85c:	94000071 	bl	a20 <_ftoa>
     860:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     864:	3400051a 	cbz	w26, 904 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     868:	f27b029f 	tst	x20, #0x20
     86c:	528008a1 	mov	w1, #0x45                  	// #69
     870:	aa1503e2 	mov	x2, x21
     874:	aa1b03e3 	mov	x3, x27
     878:	52800ca0 	mov	w0, #0x65                  	// #101
     87c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     880:	aa1903e1 	mov	x1, x25
     884:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     888:	7100031f 	cmp	w24, #0x0
     88c:	528000a0 	mov	w0, #0x5                   	// #5
     890:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     894:	5100079c 	sub	w28, w28, #0x1
     898:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     89c:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     8a0:	b9000be0 	str	w0, [sp, #8]
     8a4:	93407c84 	sxtw	x4, w4
     8a8:	531f7f05 	lsr	w5, w24, #31
     8ac:	aa1b03e3 	mov	x3, x27
     8b0:	aa1903e1 	mov	x1, x25
     8b4:	aa1703e0 	mov	x0, x23
     8b8:	52800007 	mov	w7, #0x0                   	// #0
     8bc:	d2800146 	mov	x6, #0xa                   	// #10
     8c0:	97fffebc 	bl	3b0 <_ntoa_long>
     8c4:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     8c8:	b9407fe0 	ldr	w0, [sp, #124]
     8cc:	340001c0 	cbz	w0, 904 <_etoa+0x284>
            while (idx - start_idx < width)
     8d0:	cb1302b3 	sub	x19, x21, x19
     8d4:	eb1302df 	cmp	x22, x19
     8d8:	54000169 	b.ls	904 <_etoa+0x284>  // b.plast
     8dc:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     8e0:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     8e4:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     8e8:	aa1b03e3 	mov	x3, x27
     8ec:	aa1903e1 	mov	x1, x25
     8f0:	52800400 	mov	w0, #0x20                  	// #32
     8f4:	d63f02e0 	blr	x23
     8f8:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     8fc:	eb1302df 	cmp	x22, x19
     900:	54ffff08 	b.hi	8e0 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     904:	aa1503e0 	mov	x0, x21
     908:	a9417bfd 	ldp	x29, x30, [sp, #16]
     90c:	a94253f3 	ldp	x19, x20, [sp, #32]
     910:	a9435bf5 	ldp	x21, x22, [sp, #48]
     914:	a94463f7 	ldp	x23, x24, [sp, #64]
     918:	a9456bf9 	ldp	x25, x26, [sp, #80]
     91c:	a94673fb 	ldp	x27, x28, [sp, #96]
     920:	910203ff 	add	sp, sp, #0x80
     924:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     928:	2a1403e6 	mov	w6, w20
     92c:	2a1603e5 	mov	w5, w22
     930:	aa1b03e3 	mov	x3, x27
     934:	aa1303e2 	mov	x2, x19
     938:	aa1903e1 	mov	x1, x25
     93c:	aa1703e0 	mov	x0, x23
}
     940:	a9417bfd 	ldp	x29, x30, [sp, #16]
     944:	a94253f3 	ldp	x19, x20, [sp, #32]
     948:	a9435bf5 	ldp	x21, x22, [sp, #48]
     94c:	a94463f7 	ldp	x23, x24, [sp, #64]
     950:	a9456bf9 	ldp	x25, x26, [sp, #80]
     954:	a94673fb 	ldp	x27, x28, [sp, #96]
     958:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     95c:	14000031 	b	a20 <_ftoa>
        conv.F /= 10;
     960:	1e711821 	fdiv	d1, d1, d17
        expval--;
     964:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     968:	11018f00 	add	w0, w24, #0x63
     96c:	7103181f 	cmp	w0, #0xc6
     970:	1a9f97fc 	cset	w28, hi  // hi = pmore
     974:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     978:	365ff4d4 	tbz	w20, #11, 810 <_etoa+0x190>
     97c:	17ffff9d 	b	7f0 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     980:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     984:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     988:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     98c:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     990:	5280001a 	mov	w26, #0x0                   	// #0
     994:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     998:	1e6140e7 	fneg	d7, d7
     99c:	17ffffaa 	b	844 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     9a0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     9a4:	f2e825c0 	movk	x0, #0x412e, lsl #48
     9a8:	9e670002 	fmov	d2, x0
     9ac:	1e6220f0 	fcmpe	d7, d2
     9b0:	54000044 	b.mi	9b8 <_etoa+0x338>  // b.first
     9b4:	17ffff93 	b	800 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     9b8:	6b180080 	subs	w0, w4, w24
     9bc:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     9c0:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     9c4:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     9c8:	35000196 	cbnz	w22, 9f8 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     9cc:	1e602018 	fcmpe	d0, #0.0
     9d0:	54fffd84 	b.mi	980 <_etoa+0x300>  // b.first
     9d4:	12147a86 	and	w6, w20, #0xfffff7ff
     9d8:	1e6040e0 	fmov	d0, d7
     9dc:	321600c6 	orr	w6, w6, #0x400
     9e0:	aa1b03e3 	mov	x3, x27
     9e4:	aa1303e2 	mov	x2, x19
     9e8:	aa1903e1 	mov	x1, x25
     9ec:	aa1703e0 	mov	x0, x23
     9f0:	52800005 	mov	w5, #0x0                   	// #0
     9f4:	17ffffd3 	b	940 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     9f8:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     9fc:	2a1603e5 	mov	w5, w22
     a00:	5280001a 	mov	w26, #0x0                   	// #0
     a04:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     a08:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     a0c:	b9007fff 	str	wzr, [sp, #124]
     a10:	17ffff8b 	b	83c <_etoa+0x1bc>
     a14:	d503201f 	nop
     a18:	d503201f 	nop
     a1c:	d503201f 	nop

0000000000000a20 <_ftoa>:
    if (value != value)
     a20:	1e602000 	fcmp	d0, d0
{
     a24:	2a0603e7 	mov	w7, w6
    if (value != value)
     a28:	54000e01 	b.ne	be8 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     a2c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     a30:	9e6700c1 	fmov	d1, x6
     a34:	1e612010 	fcmpe	d0, d1
     a38:	54001184 	b.mi	c68 <_ftoa+0x248>  // b.first
     a3c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     a40:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     a44:	9e670001 	fmov	d1, x0
     a48:	aa0103f0 	mov	x16, x1
     a4c:	aa0203f1 	mov	x17, x2
     a50:	aa0303f2 	mov	x18, x3
     a54:	1e612010 	fcmpe	d0, d1
     a58:	54000b2c 	b.gt	bbc <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     a5c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     a60:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     a64:	9e670001 	fmov	d1, x0
     a68:	1e612010 	fcmpe	d0, d1
     a6c:	54000f2c 	b.gt	c50 <_ftoa+0x230>
     a70:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     a74:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     a78:	9e670001 	fmov	d1, x0
     a7c:	1e612010 	fcmpe	d0, d1
     a80:	54000e84 	b.mi	c50 <_ftoa+0x230>  // b.first
    if (value < 0) {
     a84:	1e602018 	fcmpe	d0, #0.0
{
     a88:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     a8c:	910003fd 	mov	x29, sp
    if (value < 0) {
     a90:	54000ca4 	b.mi	c24 <_ftoa+0x204>  // b.first
    bool negative = false;
     a94:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     a98:	36500ce7 	tbz	w7, #10, c34 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     a9c:	7100249f 	cmp	w4, #0x9
     aa0:	910043ec 	add	x12, sp, #0x10
     aa4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     aa8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     aac:	54001929 	b.ls	dd0 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     ab0:	91000508 	add	x8, x8, #0x1
        prec--;
     ab4:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     ab8:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     abc:	f1007d1f 	cmp	x8, #0x1f
     ac0:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     ac4:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     ac8:	54ffff48 	b.hi	ab0 <_ftoa+0x90>  // b.pmore
     acc:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     ad0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     ad4:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     ad8:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     adc:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     ae0:	1e620141 	scvtf	d1, w10
     ae4:	1e613801 	fsub	d1, d0, d1
     ae8:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     aec:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     af0:	9e6301c4 	ucvtf	d4, x14
     af4:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     af8:	1e632030 	fcmpe	d1, d3
     afc:	5400112c 	b.gt	d20 <_ftoa+0x300>
    } else if (diff < 0.5) {
     b00:	54000084 	b.mi	b10 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     b04:	b500154e 	cbnz	x14, dac <_ftoa+0x38c>
        ++frac;
     b08:	910005ce 	add	x14, x14, #0x1
     b0c:	d503201f 	nop
    if (prec == 0U) {
     b10:	35000b64 	cbnz	w4, c7c <_ftoa+0x25c>
        diff = value - (double)whole;
     b14:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     b18:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     b1c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     b20:	1e622010 	fcmpe	d0, d2
     b24:	540011a4 	b.mi	d58 <_ftoa+0x338>  // b.first
            ++whole;
     b28:	12000140 	and	w0, w10, #0x1
     b2c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     b30:	528ccce1 	mov	w1, #0x6667                	// #26215
     b34:	72acccc1 	movk	w1, #0x6666, lsl #16
     b38:	52800142 	mov	w2, #0xa                   	// #10
     b3c:	d503201f 	nop
     b40:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     b44:	f100811f 	cmp	x8, #0x20
     b48:	54000c20 	b.eq	ccc <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     b4c:	9362fd29 	asr	x9, x9, #34
     b50:	91000508 	add	x8, x8, #0x1
     b54:	4b8a7d29 	sub	w9, w9, w10, asr #31
     b58:	8b080180 	add	x0, x12, x8
     b5c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     b60:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     b64:	1100c169 	add	w9, w11, #0x30
     b68:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     b6c:	35fffeaa 	cbnz	w10, b40 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     b70:	120004e0 	and	w0, w7, #0x3
     b74:	7100041f 	cmp	w0, #0x1
     b78:	54000b00 	b.eq	cd8 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     b7c:	f1007d1f 	cmp	x8, #0x1f
     b80:	540000a8 	b.hi	b94 <_ftoa+0x174>  // b.pmore
        if (negative) {
     b84:	34000de3 	cbz	w3, d40 <_ftoa+0x320>
            buf[len++] = '-';
     b88:	528005a0 	mov	w0, #0x2d                  	// #45
     b8c:	38286980 	strb	w0, [x12, x8]
     b90:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     b94:	2a0503e6 	mov	w6, w5
     b98:	aa0c03e4 	mov	x4, x12
     b9c:	aa0803e5 	mov	x5, x8
     ba0:	aa1203e3 	mov	x3, x18
     ba4:	aa1103e2 	mov	x2, x17
     ba8:	aa1003e1 	mov	x1, x16
     bac:	aa0f03e0 	mov	x0, x15
     bb0:	97fffdbc 	bl	2a0 <_out_rev>
}
     bb4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     bb8:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     bbc:	37100207 	tbnz	w7, #2, bfc <_ftoa+0x1dc>
     bc0:	d2800060 	mov	x0, #0x3                   	// #3
     bc4:	2a0503e6 	mov	w6, w5
     bc8:	f0000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
     bcc:	9116e084 	add	x4, x4, #0x5b8
     bd0:	aa0003e5 	mov	x5, x0
     bd4:	aa1203e3 	mov	x3, x18
     bd8:	aa1103e2 	mov	x2, x17
     bdc:	aa1003e1 	mov	x1, x16
     be0:	aa0f03e0 	mov	x0, x15
     be4:	17fffdaf 	b	2a0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     be8:	2a0503e6 	mov	w6, w5
     bec:	f0000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
     bf0:	d2800065 	mov	x5, #0x3                   	// #3
     bf4:	91172084 	add	x4, x4, #0x5c8
     bf8:	17fffdaa 	b	2a0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     bfc:	d2800080 	mov	x0, #0x4                   	// #4
     c00:	2a0503e6 	mov	w6, w5
     c04:	f0000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
     c08:	91170084 	add	x4, x4, #0x5c0
     c0c:	aa0003e5 	mov	x5, x0
     c10:	aa1203e3 	mov	x3, x18
     c14:	aa1103e2 	mov	x2, x17
     c18:	aa1003e1 	mov	x1, x16
     c1c:	aa0f03e0 	mov	x0, x15
     c20:	17fffda0 	b	2a0 <_out_rev>
        value = 0 - value;
     c24:	2f00e401 	movi	d1, #0x0
        negative = true;
     c28:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     c2c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     c30:	3757f367 	tbnz	w7, #10, a9c <_ftoa+0x7c>
     c34:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     c38:	910043ec 	add	x12, sp, #0x10
     c3c:	f2e825c0 	movk	x0, #0x412e, lsl #48
     c40:	d2800008 	mov	x8, #0x0                   	// #0
     c44:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     c48:	528000c4 	mov	w4, #0x6                   	// #6
     c4c:	17ffffa3 	b	ad8 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     c50:	2a0703e6 	mov	w6, w7
     c54:	aa1203e3 	mov	x3, x18
     c58:	aa1103e2 	mov	x2, x17
     c5c:	aa1003e1 	mov	x1, x16
     c60:	aa0f03e0 	mov	x0, x15
     c64:	17fffe87 	b	680 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     c68:	2a0503e6 	mov	w6, w5
     c6c:	f0000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
     c70:	d2800085 	mov	x5, #0x4                   	// #4
     c74:	91174084 	add	x4, x4, #0x5d0
     c78:	17fffd8a 	b	2a0 <_out_rev>
     c7c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     c80:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     c84:	0b080021 	add	w1, w1, w8
     c88:	f29999a2 	movk	x2, #0xcccd
     c8c:	1400000d 	b	cc0 <_ftoa+0x2a0>
     c90:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     c94:	f10025df 	cmp	x14, #0x9
            --count;
     c98:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     c9c:	91000509 	add	x9, x8, #0x1
     ca0:	8b0b096d 	add	x13, x11, x11, lsl #2
     ca4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     ca8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     cac:	1100c1ab 	add	w11, w13, #0x30
     cb0:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     cb4:	54000569 	b.ls	d60 <_ftoa+0x340>  // b.plast
            --count;
     cb8:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     cbc:	aa0903e8 	mov	x8, x9
     cc0:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     cc4:	6b01009f 	cmp	w4, w1
     cc8:	54fffe41 	b.ne	c90 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     ccc:	120004e0 	and	w0, w7, #0x3
     cd0:	7100041f 	cmp	w0, #0x1
     cd4:	54fff601 	b.ne	b94 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     cd8:	34fff525 	cbz	w5, b7c <_ftoa+0x15c>
     cdc:	35000763 	cbnz	w3, dc8 <_ftoa+0x3a8>
     ce0:	721e04ff 	tst	w7, #0xc
     ce4:	54000721 	b.ne	dc8 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     ce8:	2a0503e1 	mov	w1, w5
     cec:	eb01011f 	cmp	x8, x1
     cf0:	54fff462 	b.cs	b7c <_ftoa+0x15c>  // b.hs, b.nlast
     cf4:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     cf8:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     cfc:	54fff4c8 	b.hi	b94 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     d00:	91000508 	add	x8, x8, #0x1
     d04:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     d08:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     d0c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     d10:	54fff360 	b.eq	b7c <_ftoa+0x15c>  // b.none
     d14:	f100811f 	cmp	x8, #0x20
     d18:	54ffff41 	b.ne	d00 <_ftoa+0x2e0>  // b.any
     d1c:	17ffff9e 	b	b94 <_ftoa+0x174>
        ++frac;
     d20:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
     d24:	9e6301c1 	ucvtf	d1, x14
     d28:	1e622030 	fcmpe	d1, d2
     d2c:	5400004a 	b.ge	d34 <_ftoa+0x314>  // b.tcont
     d30:	17ffff78 	b	b10 <_ftoa+0xf0>
            ++whole;
     d34:	1100054a 	add	w10, w10, #0x1
            frac = 0;
     d38:	d280000e 	mov	x14, #0x0                   	// #0
     d3c:	17ffff75 	b	b10 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
     d40:	371003c7 	tbnz	w7, #2, db8 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
     d44:	361ff287 	tbz	w7, #3, b94 <_ftoa+0x174>
            buf[len++] = ' ';
     d48:	52800400 	mov	w0, #0x20                  	// #32
     d4c:	38286980 	strb	w0, [x12, x8]
     d50:	91000508 	add	x8, x8, #0x1
     d54:	17ffff90 	b	b94 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     d58:	54ffee8c 	b.gt	b28 <_ftoa+0x108>
     d5c:	17ffff75 	b	b30 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     d60:	f100813f 	cmp	x9, #0x20
     d64:	54000420 	b.eq	de8 <_ftoa+0x3c8>  // b.none
     d68:	91000901 	add	x1, x8, #0x2
     d6c:	51000884 	sub	w4, w4, #0x2
     d70:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
     d74:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     d78:	34000340 	cbz	w0, de0 <_ftoa+0x3c0>
     d7c:	d503201f 	nop
            buf[len++] = '0';
     d80:	91000529 	add	x9, x9, #0x1
     d84:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     d88:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
     d8c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     d90:	540002c0 	b.eq	de8 <_ftoa+0x3c8>  // b.none
     d94:	eb01013f 	cmp	x9, x1
     d98:	54ffff41 	b.ne	d80 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
     d9c:	528005c0 	mov	w0, #0x2e                  	// #46
     da0:	91000428 	add	x8, x1, #0x1
     da4:	38216980 	strb	w0, [x12, x1]
     da8:	17ffff62 	b	b30 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
     dac:	3607eb2e 	tbz	w14, #0, b10 <_ftoa+0xf0>
        ++frac;
     db0:	910005ce 	add	x14, x14, #0x1
     db4:	17ffff57 	b	b10 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
     db8:	52800560 	mov	w0, #0x2b                  	// #43
     dbc:	38286980 	strb	w0, [x12, x8]
     dc0:	91000508 	add	x8, x8, #0x1
     dc4:	17ffff74 	b	b94 <_ftoa+0x174>
            width--;
     dc8:	510004a5 	sub	w5, w5, #0x1
     dcc:	17ffffc7 	b	ce8 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
     dd0:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     dd4:	911a6000 	add	x0, x0, #0x698
     dd8:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
     ddc:	17ffff3f 	b	ad8 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     de0:	aa0903e1 	mov	x1, x9
     de4:	17ffffee 	b	d9c <_ftoa+0x37c>
            buf[len++] = '0';
     de8:	aa0903e8 	mov	x8, x9
     dec:	17ffffb8 	b	ccc <_ftoa+0x2ac>

0000000000000df0 <_out_char>:
    if (character) {
     df0:	72001c00 	ands	w0, w0, #0xff
     df4:	54000041 	b.ne	dfc <_out_char+0xc>  // b.any
}
     df8:	d65f03c0 	ret
        _putchar(character);
     dfc:	17fffd05 	b	210 <putc>

0000000000000e00 <_out_fct>:
    if (character) {
     e00:	72001c00 	ands	w0, w0, #0xff
     e04:	54000080 	b.eq	e14 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
     e08:	a9400422 	ldp	x2, x1, [x1]
     e0c:	aa0203f0 	mov	x16, x2
     e10:	d61f0200 	br	x16
}
     e14:	d65f03c0 	ret
     e18:	d503201f 	nop
     e1c:	d503201f 	nop

0000000000000e20 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
     e20:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
     e24:	f100003f 	cmp	x1, #0x0
{
     e28:	a9017bfd 	stp	x29, x30, [sp, #16]
     e2c:	910043fd 	add	x29, sp, #0x10
     e30:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
     e34:	90000013 	adrp	x19, 0 <main>
     e38:	910a4273 	add	x19, x19, #0x290
{
     e3c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
     e40:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
     e44:	aa0103fa 	mov	x26, x1
     e48:	a90673fb 	stp	x27, x28, [sp, #96]
     e4c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
     e50:	d280001b 	mov	x27, #0x0                   	// #0
     e54:	b9401880 	ldr	w0, [x4, #24]
     e58:	b9007be0 	str	w0, [sp, #120]
     e5c:	f9400480 	ldr	x0, [x4, #8]
     e60:	f90047e0 	str	x0, [sp, #136]
     e64:	39400065 	ldrb	w5, [x3]
     e68:	f9400880 	ldr	x0, [x4, #16]
     e6c:	f9004be0 	str	x0, [sp, #144]
     e70:	b9401c80 	ldr	w0, [x4, #28]
     e74:	b900abe0 	str	w0, [sp, #168]
     e78:	f9400094 	ldr	x20, [x4]
     e7c:	34003ae5 	cbz	w5, 15d8 <_vsnprintf+0x7b8>
     e80:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
     e84:	f0000018 	adrp	x24, 3000 <_malloc_trim_r+0x50>
     e88:	91176300 	add	x0, x24, #0x5d8
     e8c:	aa0303f9 	mov	x25, x3
     e90:	f90043e0 	str	x0, [sp, #128]
     e94:	f0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
     e98:	911a0000 	add	x0, x0, #0x680
     e9c:	f9004fe0 	str	x0, [sp, #152]
     ea0:	1400000a 	b	ec8 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
     ea4:	91000764 	add	x4, x27, #0x1
     ea8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
     eac:	aa1b03e2 	mov	x2, x27
     eb0:	aa1c03e3 	mov	x3, x28
     eb4:	aa1a03e1 	mov	x1, x26
     eb8:	aa0403fb 	mov	x27, x4
     ebc:	d63f0260 	blr	x19
    while (*format) {
     ec0:	39400325 	ldrb	w5, [x25]
     ec4:	34000c85 	cbz	w5, 1054 <_vsnprintf+0x234>
            format++;
     ec8:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
     ecc:	710094bf 	cmp	w5, #0x25
     ed0:	54fffea1 	b.ne	ea4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
     ed4:	aa1903e8 	mov	x8, x25
        flags = 0U;
     ed8:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
     edc:	38401500 	ldrb	w0, [x8], #1
     ee0:	7100ac1f 	cmp	w0, #0x2b
     ee4:	54000180 	b.eq	f14 <_vsnprintf+0xf4>  // b.none
     ee8:	540001c8 	b.hi	f20 <_vsnprintf+0x100>  // b.pmore
     eec:	7100801f 	cmp	w0, #0x20
     ef0:	54000260 	b.eq	f3c <_vsnprintf+0x11c>  // b.none
     ef4:	71008c1f 	cmp	w0, #0x23
     ef8:	540002e1 	b.ne	f54 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
     efc:	321c00c6 	orr	w6, w6, #0x10
            format++;
     f00:	aa0803f9 	mov	x25, x8
            switch (*format) {
     f04:	aa1903e8 	mov	x8, x25
     f08:	38401500 	ldrb	w0, [x8], #1
     f0c:	7100ac1f 	cmp	w0, #0x2b
     f10:	54fffec1 	b.ne	ee8 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
     f14:	321e00c6 	orr	w6, w6, #0x4
            format++;
     f18:	aa0803f9 	mov	x25, x8
     f1c:	17fffffa 	b	f04 <_vsnprintf+0xe4>
            switch (*format) {
     f20:	7100b41f 	cmp	w0, #0x2d
     f24:	54000120 	b.eq	f48 <_vsnprintf+0x128>  // b.none
     f28:	7100c01f 	cmp	w0, #0x30
     f2c:	540062c1 	b.ne	1b84 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
     f30:	320000c6 	orr	w6, w6, #0x1
            format++;
     f34:	aa0803f9 	mov	x25, x8
     f38:	17fffff3 	b	f04 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
     f3c:	321d00c6 	orr	w6, w6, #0x8
            format++;
     f40:	aa0803f9 	mov	x25, x8
     f44:	17fffff0 	b	f04 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
     f48:	321f00c6 	orr	w6, w6, #0x2
            format++;
     f4c:	aa0803f9 	mov	x25, x8
     f50:	17ffffed 	b	f04 <_vsnprintf+0xe4>
        } else if (*format == '*') {
     f54:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
     f58:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
     f5c:	540002e0 	b.eq	fb8 <_vsnprintf+0x198>  // b.none
        precision = 0U;
     f60:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
     f64:	7101b01f 	cmp	w0, #0x6c
            format++;
     f68:	aa0803e4 	mov	x4, x8
        switch (*format) {
     f6c:	54001f20 	b.eq	1350 <_vsnprintf+0x530>  // b.none
     f70:	54000588 	b.hi	1020 <_vsnprintf+0x200>  // b.pmore
     f74:	7101a01f 	cmp	w0, #0x68
     f78:	54001e20 	b.eq	133c <_vsnprintf+0x51c>  // b.none
     f7c:	7101a81f 	cmp	w0, #0x6a
     f80:	54006241 	b.ne	1bc8 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
     f84:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
     f88:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
     f8c:	51009402 	sub	w2, w0, #0x25
            format++;
     f90:	91000499 	add	x25, x4, #0x1
        switch (*format) {
     f94:	71014c5f 	cmp	w2, #0x53
     f98:	54000069 	b.ls	fa4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
     f9c:	91000764 	add	x4, x27, #0x1
     fa0:	17ffffc3 	b	eac <_vsnprintf+0x8c>
        switch (*format) {
     fa4:	f94043e1 	ldr	x1, [sp, #128]
     fa8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
     fac:	10000062 	adr	x2, fb8 <_vsnprintf+0x198>
     fb0:	8b21a841 	add	x1, x2, w1, sxth #2
     fb4:	d61f0020 	br	x1
            const int w = va_arg(va, int);
     fb8:	b9407be0 	ldr	w0, [sp, #120]
     fbc:	37f806c0 	tbnz	w0, #31, 1094 <_vsnprintf+0x274>
     fc0:	91002e82 	add	x2, x20, #0xb
     fc4:	aa1403e0 	mov	x0, x20
     fc8:	927df054 	and	x20, x2, #0xfffffffffffffff8
     fcc:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
     fd0:	36f80078 	tbz	w24, #31, fdc <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
     fd4:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
     fd8:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
     fdc:	39400720 	ldrb	w0, [x25, #1]
            format++;
     fe0:	aa0803f9 	mov	x25, x8
     fe4:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
     fe8:	7100b81f 	cmp	w0, #0x2e
     fec:	54fffba1 	b.ne	f60 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
     ff0:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
     ff4:	321600c6 	orr	w6, w6, #0x400
            format++;
     ff8:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
     ffc:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1000:	12001c42 	and	w2, w2, #0xff
    1004:	7100245f 	cmp	w2, #0x9
    1008:	54001b29 	b.ls	136c <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    100c:	7100a81f 	cmp	w0, #0x2a
    1010:	54002a20 	b.eq	1554 <_vsnprintf+0x734>  // b.none
            format++;
    1014:	aa0803f9 	mov	x25, x8
    1018:	91000508 	add	x8, x8, #0x1
    101c:	17ffffd1 	b	f60 <_vsnprintf+0x140>
        switch (*format) {
    1020:	7101d01f 	cmp	w0, #0x74
    1024:	54fffb00 	b.eq	f84 <_vsnprintf+0x164>  // b.none
    1028:	7101e81f 	cmp	w0, #0x7a
    102c:	54fffac0 	b.eq	f84 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1030:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1034:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1038:	7100245f 	cmp	w2, #0x9
    103c:	54fffb08 	b.hi	f9c <_vsnprintf+0x17c>  // b.pmore
    1040:	f9404fe1 	ldr	x1, [sp, #152]
    1044:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1048:	10000062 	adr	x2, 1054 <_vsnprintf+0x234>
    104c:	8b21a841 	add	x1, x2, w1, sxth #2
    1050:	d61f0020 	br	x1
    1054:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    1058:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    105c:	eb1b039f 	cmp	x28, x27
    1060:	d1000782 	sub	x2, x28, #0x1
    1064:	aa1a03e1 	mov	x1, x26
    1068:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    106c:	aa1c03e3 	mov	x3, x28
    1070:	52800000 	mov	w0, #0x0                   	// #0
    1074:	d63f0260 	blr	x19
}
    1078:	2a1403e0 	mov	w0, w20
    107c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1080:	a94253f3 	ldp	x19, x20, [sp, #32]
    1084:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1088:	a94673fb 	ldp	x27, x28, [sp, #96]
    108c:	9102c3ff 	add	sp, sp, #0xb0
    1090:	d65f03c0 	ret
            const int w = va_arg(va, int);
    1094:	b9407be0 	ldr	w0, [sp, #120]
    1098:	11002002 	add	w2, w0, #0x8
    109c:	7100005f 	cmp	w2, #0x0
    10a0:	5400228d 	b.le	14f0 <_vsnprintf+0x6d0>
    10a4:	91002e84 	add	x4, x20, #0xb
    10a8:	aa1403e0 	mov	x0, x20
    10ac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    10b0:	b9007be2 	str	w2, [sp, #120]
    10b4:	17ffffc6 	b	fcc <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    10b8:	121a7802 	and	w2, w0, #0xffffffdf
    10bc:	7101605f 	cmp	w2, #0x58
    10c0:	54001781 	b.ne	13b0 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    10c4:	7101601f 	cmp	w0, #0x58
    10c8:	54003c81 	b.ne	1858 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    10cc:	321b00c6 	orr	w6, w6, #0x20
    10d0:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    10d4:	121c74c6 	and	w6, w6, #0xfffffff3
    10d8:	140000c0 	b	13d8 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    10dc:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    10e0:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    10e4:	71011c5f 	cmp	w2, #0x47
    10e8:	321500c2 	orr	w2, w6, #0x800
    10ec:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    10f0:	7101141f 	cmp	w0, #0x45
    10f4:	321b00c0 	orr	w0, w6, #0x20
    10f8:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    10fc:	b940abe0 	ldr	w0, [sp, #168]
    1100:	37f81c20 	tbnz	w0, #31, 1484 <_vsnprintf+0x664>
    1104:	91003e82 	add	x2, x20, #0xf
    1108:	aa1403e0 	mov	x0, x20
    110c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1110:	fd400000 	ldr	d0, [x0]
    1114:	aa1b03e2 	mov	x2, x27
    1118:	2a1803e5 	mov	w5, w24
    111c:	2a1703e4 	mov	w4, w23
    1120:	aa1c03e3 	mov	x3, x28
    1124:	aa1a03e1 	mov	x1, x26
    1128:	aa1303e0 	mov	x0, x19
    112c:	97fffd55 	bl	680 <_etoa>
    1130:	aa0003fb 	mov	x27, x0
            break;
    1134:	17ffff63 	b	ec0 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1138:	7101181f 	cmp	w0, #0x46
    113c:	321b00c0 	orr	w0, w6, #0x20
    1140:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1144:	b940abe0 	ldr	w0, [sp, #168]
    1148:	37f818c0 	tbnz	w0, #31, 1460 <_vsnprintf+0x640>
    114c:	91003e82 	add	x2, x20, #0xf
    1150:	aa1403e0 	mov	x0, x20
    1154:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1158:	fd400000 	ldr	d0, [x0]
    115c:	aa1b03e2 	mov	x2, x27
    1160:	2a1803e5 	mov	w5, w24
    1164:	2a1703e4 	mov	w4, w23
    1168:	aa1c03e3 	mov	x3, x28
    116c:	aa1a03e1 	mov	x1, x26
    1170:	aa1303e0 	mov	x0, x19
    1174:	97fffe2b 	bl	a20 <_ftoa>
    1178:	aa0003fb 	mov	x27, x0
            break;
    117c:	17ffff51 	b	ec0 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    1180:	91000760 	add	x0, x27, #0x1
    1184:	aa1b03e2 	mov	x2, x27
    1188:	aa1c03e3 	mov	x3, x28
    118c:	aa0003fb 	mov	x27, x0
    1190:	aa1a03e1 	mov	x1, x26
    1194:	528004a0 	mov	w0, #0x25                  	// #37
    1198:	d63f0260 	blr	x19
            break;
    119c:	17ffff49 	b	ec0 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    11a0:	52800420 	mov	w0, #0x21                  	// #33
    11a4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    11a8:	b9407be0 	ldr	w0, [sp, #120]
    11ac:	37f817e0 	tbnz	w0, #31, 14a8 <_vsnprintf+0x688>
    11b0:	91003e82 	add	x2, x20, #0xf
    11b4:	aa1403e0 	mov	x0, x20
    11b8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    11bc:	2a1703e7 	mov	w7, w23
    11c0:	aa1b03e2 	mov	x2, x27
    11c4:	f9400004 	ldr	x4, [x0]
    11c8:	52800200 	mov	w0, #0x10                  	// #16
    11cc:	b90003e0 	str	w0, [sp]
    11d0:	b9000be6 	str	w6, [sp, #8]
    11d4:	d2800206 	mov	x6, #0x10                  	// #16
    11d8:	52800005 	mov	w5, #0x0                   	// #0
    11dc:	aa1c03e3 	mov	x3, x28
    11e0:	aa1a03e1 	mov	x1, x26
    11e4:	aa1303e0 	mov	x0, x19
    11e8:	97fffc72 	bl	3b0 <_ntoa_long>
    11ec:	aa0003fb 	mov	x27, x0
            break;
    11f0:	17ffff34 	b	ec0 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    11f4:	a9035bf5 	stp	x21, x22, [sp, #48]
    11f8:	36082306 	tbz	w6, #1, 1658 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    11fc:	b9407be0 	ldr	w0, [sp, #120]
    1200:	37f82a20 	tbnz	w0, #31, 1744 <_vsnprintf+0x924>
    1204:	91002e82 	add	x2, x20, #0xb
    1208:	aa1403e0 	mov	x0, x20
    120c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1210:	39400000 	ldrb	w0, [x0]
    1214:	aa1b03e2 	mov	x2, x27
    1218:	aa1c03e3 	mov	x3, x28
    121c:	aa1a03e1 	mov	x1, x26
    1220:	91000775 	add	x21, x27, #0x1
    1224:	d63f0260 	blr	x19
                while (l++ < width) {
    1228:	51000b00 	sub	w0, w24, #0x2
    122c:	91000b6a 	add	x10, x27, #0x2
    1230:	7100071f 	cmp	w24, #0x1
    1234:	8b00015b 	add	x27, x10, x0
    1238:	540007c9 	b.ls	1330 <_vsnprintf+0x510>  // b.plast
    123c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1240:	aa1503e2 	mov	x2, x21
    1244:	aa1c03e3 	mov	x3, x28
    1248:	910006b5 	add	x21, x21, #0x1
    124c:	aa1a03e1 	mov	x1, x26
    1250:	52800400 	mov	w0, #0x20                  	// #32
    1254:	d63f0260 	blr	x19
                while (l++ < width) {
    1258:	eb1b02bf 	cmp	x21, x27
    125c:	54ffff21 	b.ne	1240 <_vsnprintf+0x420>  // b.any
    1260:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1264:	17ffff17 	b	ec0 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    1268:	b9407be0 	ldr	w0, [sp, #120]
    126c:	a9035bf5 	stp	x21, x22, [sp, #48]
    1270:	37f812e0 	tbnz	w0, #31, 14cc <_vsnprintf+0x6ac>
    1274:	91003e82 	add	x2, x20, #0xf
    1278:	aa1403e0 	mov	x0, x20
    127c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1280:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    1284:	394002a8 	ldrb	w8, [x21]
    1288:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    128c:	350017d7 	cbnz	w23, 1584 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    1290:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    1294:	340035c8 	cbz	w8, 194c <_vsnprintf+0xb2c>
    1298:	91000456 	add	x22, x2, #0x1
    129c:	aa1503e2 	mov	x2, x21
    12a0:	8b1602b6 	add	x22, x21, x22
    12a4:	14000003 	b	12b0 <_vsnprintf+0x490>
    12a8:	eb0202df 	cmp	x22, x2
    12ac:	54001900 	b.eq	15cc <_vsnprintf+0x7ac>  // b.none
    12b0:	38401c44 	ldrb	w4, [x2, #1]!
    12b4:	35ffffa4 	cbnz	w4, 12a8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    12b8:	4b150041 	sub	w1, w2, w21
    12bc:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    12c0:	121600c1 	and	w1, w6, #0x400
    12c4:	b9007fe1 	str	w1, [sp, #124]
    12c8:	365000a6 	tbz	w6, #10, 12dc <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    12cc:	b940a3e1 	ldr	w1, [sp, #160]
    12d0:	6b17003f 	cmp	w1, w23
    12d4:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    12d8:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    12dc:	121f00c1 	and	w1, w6, #0x2
    12e0:	b900afe1 	str	w1, [sp, #172]
    12e4:	36081826 	tbz	w6, #1, 15e8 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    12e8:	34001108 	cbz	w8, 1508 <_vsnprintf+0x6e8>
    12ec:	aa1b03e2 	mov	x2, x27
    12f0:	cb1b02b6 	sub	x22, x21, x27
    12f4:	14000002 	b	12fc <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    12f8:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    12fc:	b9407fe1 	ldr	w1, [sp, #124]
    1300:	34000081 	cbz	w1, 1310 <_vsnprintf+0x4f0>
    1304:	510006e4 	sub	w4, w23, #0x1
    1308:	340016d7 	cbz	w23, 15e0 <_vsnprintf+0x7c0>
    130c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    1310:	91000455 	add	x21, x2, #0x1
    1314:	aa1c03e3 	mov	x3, x28
    1318:	aa1a03e1 	mov	x1, x26
    131c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1320:	38756ac0 	ldrb	w0, [x22, x21]
    1324:	35fffea0 	cbnz	w0, 12f8 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1328:	b940afe0 	ldr	w0, [sp, #172]
    132c:	35000ec0 	cbnz	w0, 1504 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1330:	aa1503fb 	mov	x27, x21
    1334:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1338:	17fffee2 	b	ec0 <_vsnprintf+0xa0>
            if (*format == 'h') {
    133c:	39400720 	ldrb	w0, [x25, #1]
    1340:	7101a01f 	cmp	w0, #0x68
    1344:	540013c0 	b.eq	15bc <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1348:	321900c6 	orr	w6, w6, #0x80
    134c:	17ffff10 	b	f8c <_vsnprintf+0x16c>
            if (*format == 'l') {
    1350:	39400720 	ldrb	w0, [x25, #1]
    1354:	7101b01f 	cmp	w0, #0x6c
    1358:	54ffe181 	b.ne	f88 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    135c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    1360:	321804c6 	orr	w6, w6, #0x300
                format++;
    1364:	91000b24 	add	x4, x25, #0x2
    1368:	17ffff09 	b	f8c <_vsnprintf+0x16c>
    unsigned int i = 0U;
    136c:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1370:	52800148 	mov	w8, #0xa                   	// #10
    1374:	d503201f 	nop
    1378:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    137c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    1380:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1384:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    1388:	12001c42 	and	w2, w2, #0xff
    138c:	7100245f 	cmp	w2, #0x9
    1390:	54ffff49 	b.ls	1378 <_vsnprintf+0x558>  // b.plast
    1394:	aa0403f9 	mov	x25, x4
    1398:	91000488 	add	x8, x4, #0x1
    139c:	17fffef2 	b	f64 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    13a0:	121a7802 	and	w2, w0, #0xffffffdf
    13a4:	7101605f 	cmp	w2, #0x58
    13a8:	54002580 	b.eq	1858 <_vsnprintf+0xa38>  // b.none
    13ac:	d503201f 	nop
            } else if (*format == 'o') {
    13b0:	7101bc1f 	cmp	w0, #0x6f
    13b4:	540021a0 	b.eq	17e8 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    13b8:	7101881f 	cmp	w0, #0x62
    13bc:	54002820 	b.eq	18c0 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    13c0:	121b78c6 	and	w6, w6, #0xffffffef
    13c4:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    13c8:	7101a41f 	cmp	w0, #0x69
    13cc:	52800c82 	mov	w2, #0x64                  	// #100
    13d0:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    13d4:	54ffe801 	b.ne	10d4 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    13d8:	f27600df 	tst	x6, #0x400
    13dc:	121f78c2 	and	w2, w6, #0xfffffffe
    13e0:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    13e4:	7101a41f 	cmp	w0, #0x69
    13e8:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    13ec:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    13f0:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    13f4:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    13f8:	54000ce1 	b.ne	1594 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    13fc:	35002122 	cbnz	w2, 1820 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1400:	37402306 	tbnz	w6, #8, 1860 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1404:	37301b26 	tbnz	w6, #6, 1768 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1408:	36382926 	tbz	w6, #7, 192c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    140c:	37f83300 	tbnz	w0, #31, 1a6c <_vsnprintf+0xc4c>
    1410:	91002e82 	add	x2, x20, #0xb
    1414:	aa1403e0 	mov	x0, x20
    1418:	927df054 	and	x20, x2, #0xfffffffffffffff8
    141c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1420:	710000bf 	cmp	w5, #0x0
    1424:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1428:	12003c84 	and	w4, w4, #0xffff
    142c:	2a1703e7 	mov	w7, w23
    1430:	531f7ca5 	lsr	w5, w5, #31
    1434:	93407c84 	sxtw	x4, w4
    1438:	aa1b03e2 	mov	x2, x27
    143c:	b9000be6 	str	w6, [sp, #8]
    1440:	aa0803e6 	mov	x6, x8
    1444:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1448:	aa1c03e3 	mov	x3, x28
    144c:	aa1a03e1 	mov	x1, x26
    1450:	aa1303e0 	mov	x0, x19
    1454:	97fffbd7 	bl	3b0 <_ntoa_long>
    1458:	aa0003fb 	mov	x27, x0
            break;
    145c:	17fffe99 	b	ec0 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1460:	b940abe0 	ldr	w0, [sp, #168]
    1464:	11004002 	add	w2, w0, #0x10
    1468:	7100005f 	cmp	w2, #0x0
    146c:	54001b4d 	b.le	17d4 <_vsnprintf+0x9b4>
    1470:	91003e84 	add	x4, x20, #0xf
    1474:	aa1403e0 	mov	x0, x20
    1478:	927df094 	and	x20, x4, #0xfffffffffffffff8
    147c:	b900abe2 	str	w2, [sp, #168]
    1480:	17ffff36 	b	1158 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1484:	b940abe0 	ldr	w0, [sp, #168]
    1488:	11004002 	add	w2, w0, #0x10
    148c:	7100005f 	cmp	w2, #0x0
    1490:	5400198d 	b.le	17c0 <_vsnprintf+0x9a0>
    1494:	91003e84 	add	x4, x20, #0xf
    1498:	aa1403e0 	mov	x0, x20
    149c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    14a0:	b900abe2 	str	w2, [sp, #168]
    14a4:	17ffff1b 	b	1110 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    14a8:	b9407be0 	ldr	w0, [sp, #120]
    14ac:	11002002 	add	w2, w0, #0x8
    14b0:	7100005f 	cmp	w2, #0x0
    14b4:	540017cd 	b.le	17ac <_vsnprintf+0x98c>
    14b8:	91003e84 	add	x4, x20, #0xf
    14bc:	aa1403e0 	mov	x0, x20
    14c0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    14c4:	b9007be2 	str	w2, [sp, #120]
    14c8:	17ffff3d 	b	11bc <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    14cc:	b9407be0 	ldr	w0, [sp, #120]
    14d0:	11002002 	add	w2, w0, #0x8
    14d4:	7100005f 	cmp	w2, #0x0
    14d8:	5400160d 	b.le	1798 <_vsnprintf+0x978>
    14dc:	91003e84 	add	x4, x20, #0xf
    14e0:	aa1403e0 	mov	x0, x20
    14e4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    14e8:	b9007be2 	str	w2, [sp, #120]
    14ec:	17ffff65 	b	1280 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    14f0:	f94047e1 	ldr	x1, [sp, #136]
    14f4:	b9407be0 	ldr	w0, [sp, #120]
    14f8:	b9007be2 	str	w2, [sp, #120]
    14fc:	8b20c020 	add	x0, x1, w0, sxtw
    1500:	17fffeb3 	b	fcc <_vsnprintf+0x1ac>
    1504:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1508:	b940a3e0 	ldr	w0, [sp, #160]
    150c:	6b18001f 	cmp	w0, w24
    1510:	540009e2 	b.cs	164c <_vsnprintf+0x82c>  // b.hs, b.nlast
    1514:	51000704 	sub	w4, w24, #0x1
    1518:	91000776 	add	x22, x27, #0x1
    151c:	4b000084 	sub	w4, w4, w0
    1520:	8b160095 	add	x21, x4, x22
    1524:	14000002 	b	152c <_vsnprintf+0x70c>
    1528:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    152c:	aa1b03e2 	mov	x2, x27
    1530:	aa1c03e3 	mov	x3, x28
    1534:	aa1a03e1 	mov	x1, x26
    1538:	52800400 	mov	w0, #0x20                  	// #32
    153c:	d63f0260 	blr	x19
    1540:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1544:	eb1502df 	cmp	x22, x21
    1548:	54ffff01 	b.ne	1528 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    154c:	aa1503fb 	mov	x27, x21
    1550:	17ffff79 	b	1334 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    1554:	b9407be0 	ldr	w0, [sp, #120]
    1558:	37f80b80 	tbnz	w0, #31, 16c8 <_vsnprintf+0x8a8>
    155c:	91002e82 	add	x2, x20, #0xb
    1560:	aa1403e0 	mov	x0, x20
    1564:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1568:	b9400007 	ldr	w7, [x0]
                format++;
    156c:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    1570:	39400320 	ldrb	w0, [x25]
    1574:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1578:	710000ff 	cmp	w7, #0x0
    157c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    1580:	17fffe79 	b	f64 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    1584:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    1588:	34001e28 	cbz	w8, 194c <_vsnprintf+0xb2c>
    158c:	d1000442 	sub	x2, x2, #0x1
    1590:	17ffff42 	b	1298 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    1594:	35001302 	cbnz	w2, 17f4 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    1598:	37401806 	tbnz	w6, #8, 1898 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    159c:	37300ba6 	tbnz	w6, #6, 1710 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    15a0:	36381ba6 	tbz	w6, #7, 1914 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    15a4:	37f82500 	tbnz	w0, #31, 1a44 <_vsnprintf+0xc24>
    15a8:	aa1403e0 	mov	x0, x20
    15ac:	91002e82 	add	x2, x20, #0xb
    15b0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    15b4:	79400004 	ldrh	w4, [x0]
    15b8:	1400005b 	b	1724 <_vsnprintf+0x904>
        switch (*format) {
    15bc:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    15c0:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    15c4:	91000b24 	add	x4, x25, #0x2
    15c8:	17fffe71 	b	f8c <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    15cc:	4b1502c1 	sub	w1, w22, w21
    15d0:	b900a3e1 	str	w1, [sp, #160]
    15d4:	17ffff3b 	b	12c0 <_vsnprintf+0x4a0>
    while (*format) {
    15d8:	52800014 	mov	w20, #0x0                   	// #0
    15dc:	17fffea0 	b	105c <_vsnprintf+0x23c>
    15e0:	aa0203f5 	mov	x21, x2
    15e4:	17ffff51 	b	1328 <_vsnprintf+0x508>
                while (l++ < width) {
    15e8:	b940a3e1 	ldr	w1, [sp, #160]
    15ec:	6b18003f 	cmp	w1, w24
    15f0:	11000420 	add	w0, w1, #0x1
    15f4:	54002242 	b.cs	1a3c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    15f8:	51000700 	sub	w0, w24, #0x1
    15fc:	91000776 	add	x22, x27, #0x1
    1600:	4b010000 	sub	w0, w0, w1
    1604:	8b160000 	add	x0, x0, x22
    1608:	f90053e0 	str	x0, [sp, #160]
    160c:	14000002 	b	1614 <_vsnprintf+0x7f4>
    1610:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1614:	aa1b03e2 	mov	x2, x27
    1618:	52800400 	mov	w0, #0x20                  	// #32
    161c:	aa1c03e3 	mov	x3, x28
    1620:	aa1a03e1 	mov	x1, x26
    1624:	d63f0260 	blr	x19
    1628:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    162c:	f94053e0 	ldr	x0, [sp, #160]
    1630:	eb16001f 	cmp	x0, x22
    1634:	54fffee1 	b.ne	1610 <_vsnprintf+0x7f0>  // b.any
    1638:	394002a8 	ldrb	w8, [x21]
    163c:	11000700 	add	w0, w24, #0x1
    1640:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1644:	2a0803e0 	mov	w0, w8
    1648:	35ffe528 	cbnz	w8, 12ec <_vsnprintf+0x4cc>
                while (l++ < width) {
    164c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    1650:	aa1503fb 	mov	x27, x21
    1654:	17ffff38 	b	1334 <_vsnprintf+0x514>
                while (l++ < width) {
    1658:	7100071f 	cmp	w24, #0x1
    165c:	54001ec9 	b.ls	1a34 <_vsnprintf+0xc14>  // b.plast
    1660:	51000b05 	sub	w5, w24, #0x2
    1664:	91000776 	add	x22, x27, #0x1
    1668:	8b0502d5 	add	x21, x22, x5
    166c:	14000002 	b	1674 <_vsnprintf+0x854>
    1670:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1674:	aa1b03e2 	mov	x2, x27
    1678:	aa1c03e3 	mov	x3, x28
    167c:	aa1a03e1 	mov	x1, x26
    1680:	52800400 	mov	w0, #0x20                  	// #32
    1684:	d63f0260 	blr	x19
    1688:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    168c:	eb1502df 	cmp	x22, x21
    1690:	54ffff01 	b.ne	1670 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1694:	b9407be0 	ldr	w0, [sp, #120]
    1698:	37f802a0 	tbnz	w0, #31, 16ec <_vsnprintf+0x8cc>
    169c:	91002e82 	add	x2, x20, #0xb
    16a0:	aa1403e0 	mov	x0, x20
    16a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    16a8:	39400000 	ldrb	w0, [x0]
    16ac:	aa1503e2 	mov	x2, x21
    16b0:	910006bb 	add	x27, x21, #0x1
    16b4:	aa1c03e3 	mov	x3, x28
    16b8:	aa1a03e1 	mov	x1, x26
    16bc:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    16c0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    16c4:	17fffdff 	b	ec0 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    16c8:	b9407be0 	ldr	w0, [sp, #120]
    16cc:	11002002 	add	w2, w0, #0x8
    16d0:	7100005f 	cmp	w2, #0x0
    16d4:	5400058d 	b.le	1784 <_vsnprintf+0x964>
    16d8:	91002e84 	add	x4, x20, #0xb
    16dc:	aa1403e0 	mov	x0, x20
    16e0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    16e4:	b9007be2 	str	w2, [sp, #120]
    16e8:	17ffffa0 	b	1568 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    16ec:	b9407be0 	ldr	w0, [sp, #120]
    16f0:	11002002 	add	w2, w0, #0x8
    16f4:	7100005f 	cmp	w2, #0x0
    16f8:	540016ed 	b.le	19d4 <_vsnprintf+0xbb4>
    16fc:	91002e84 	add	x4, x20, #0xb
    1700:	aa1403e0 	mov	x0, x20
    1704:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1708:	b9007be2 	str	w2, [sp, #120]
    170c:	17ffffe7 	b	16a8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1710:	37f81220 	tbnz	w0, #31, 1954 <_vsnprintf+0xb34>
    1714:	91002e82 	add	x2, x20, #0xb
    1718:	aa1403e0 	mov	x0, x20
    171c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1720:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1724:	2a1703e7 	mov	w7, w23
    1728:	2a0403e4 	mov	w4, w4
    172c:	b9000be6 	str	w6, [sp, #8]
    1730:	aa0803e6 	mov	x6, x8
    1734:	b90003f8 	str	w24, [sp]
    1738:	aa1b03e2 	mov	x2, x27
    173c:	52800005 	mov	w5, #0x0                   	// #0
    1740:	17ffff42 	b	1448 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1744:	b9407be0 	ldr	w0, [sp, #120]
    1748:	11002002 	add	w2, w0, #0x8
    174c:	7100005f 	cmp	w2, #0x0
    1750:	5400138d 	b.le	19c0 <_vsnprintf+0xba0>
    1754:	91002e84 	add	x4, x20, #0xb
    1758:	aa1403e0 	mov	x0, x20
    175c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1760:	b9007be2 	str	w2, [sp, #120]
    1764:	17fffeab 	b	1210 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1768:	37f81080 	tbnz	w0, #31, 1978 <_vsnprintf+0xb58>
    176c:	91002e82 	add	x2, x20, #0xb
    1770:	aa1403e0 	mov	x0, x20
    1774:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1778:	39400005 	ldrb	w5, [x0]
    177c:	2a0503e4 	mov	w4, w5
    1780:	17ffff2b 	b	142c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    1784:	f94047e1 	ldr	x1, [sp, #136]
    1788:	b9407be0 	ldr	w0, [sp, #120]
    178c:	b9007be2 	str	w2, [sp, #120]
    1790:	8b20c020 	add	x0, x1, w0, sxtw
    1794:	17ffff75 	b	1568 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    1798:	f94047e1 	ldr	x1, [sp, #136]
    179c:	b9407be0 	ldr	w0, [sp, #120]
    17a0:	b9007be2 	str	w2, [sp, #120]
    17a4:	8b20c020 	add	x0, x1, w0, sxtw
    17a8:	17fffeb6 	b	1280 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    17ac:	f94047e1 	ldr	x1, [sp, #136]
    17b0:	b9407be0 	ldr	w0, [sp, #120]
    17b4:	b9007be2 	str	w2, [sp, #120]
    17b8:	8b20c020 	add	x0, x1, w0, sxtw
    17bc:	17fffe80 	b	11bc <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    17c0:	f9404be1 	ldr	x1, [sp, #144]
    17c4:	b940abe0 	ldr	w0, [sp, #168]
    17c8:	b900abe2 	str	w2, [sp, #168]
    17cc:	8b20c020 	add	x0, x1, w0, sxtw
    17d0:	17fffe50 	b	1110 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    17d4:	f9404be1 	ldr	x1, [sp, #144]
    17d8:	b940abe0 	ldr	w0, [sp, #168]
    17dc:	b900abe2 	str	w2, [sp, #168]
    17e0:	8b20c020 	add	x0, x1, w0, sxtw
    17e4:	17fffe5d 	b	1158 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    17e8:	121c74c6 	and	w6, w6, #0xfffffff3
    17ec:	d2800108 	mov	x8, #0x8                   	// #8
    17f0:	17fffefa 	b	13d8 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    17f4:	37f807e0 	tbnz	w0, #31, 18f0 <_vsnprintf+0xad0>
    17f8:	91003e82 	add	x2, x20, #0xf
    17fc:	aa1403e0 	mov	x0, x20
    1800:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1804:	2a1703e7 	mov	w7, w23
    1808:	aa1b03e2 	mov	x2, x27
    180c:	f9400004 	ldr	x4, [x0]
    1810:	b90003f8 	str	w24, [sp]
    1814:	b9000be6 	str	w6, [sp, #8]
    1818:	aa0803e6 	mov	x6, x8
    181c:	17fffe6f 	b	11d8 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1820:	37f80560 	tbnz	w0, #31, 18cc <_vsnprintf+0xaac>
    1824:	91003e82 	add	x2, x20, #0xf
    1828:	aa1403e0 	mov	x0, x20
    182c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1830:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1834:	2a1703e7 	mov	w7, w23
    1838:	aa1b03e2 	mov	x2, x27
    183c:	b90003f8 	str	w24, [sp]
    1840:	f10000bf 	cmp	x5, #0x0
    1844:	b9000be6 	str	w6, [sp, #8]
    1848:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    184c:	aa0803e6 	mov	x6, x8
    1850:	d37ffca5 	lsr	x5, x5, #63
    1854:	17fffe62 	b	11dc <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1858:	d2800208 	mov	x8, #0x10                  	// #16
    185c:	17fffedb 	b	13c8 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    1860:	37f80c40 	tbnz	w0, #31, 19e8 <_vsnprintf+0xbc8>
    1864:	91003e82 	add	x2, x20, #0xf
    1868:	aa1403e0 	mov	x0, x20
    186c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1870:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1874:	2a1703e7 	mov	w7, w23
    1878:	aa1b03e2 	mov	x2, x27
    187c:	b90003f8 	str	w24, [sp]
    1880:	f10000bf 	cmp	x5, #0x0
    1884:	b9000be6 	str	w6, [sp, #8]
    1888:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    188c:	aa0803e6 	mov	x6, x8
    1890:	d37ffca5 	lsr	x5, x5, #63
    1894:	17fffeed 	b	1448 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1898:	37f80820 	tbnz	w0, #31, 199c <_vsnprintf+0xb7c>
    189c:	91003e82 	add	x2, x20, #0xf
    18a0:	aa1403e0 	mov	x0, x20
    18a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    18a8:	2a1703e7 	mov	w7, w23
    18ac:	f9400004 	ldr	x4, [x0]
    18b0:	b90003f8 	str	w24, [sp]
    18b4:	b9000be6 	str	w6, [sp, #8]
    18b8:	aa0803e6 	mov	x6, x8
    18bc:	17ffff9f 	b	1738 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    18c0:	121c74c6 	and	w6, w6, #0xfffffff3
    18c4:	d2800048 	mov	x8, #0x2                   	// #2
    18c8:	17fffec4 	b	13d8 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    18cc:	b9407be0 	ldr	w0, [sp, #120]
    18d0:	11002002 	add	w2, w0, #0x8
    18d4:	7100005f 	cmp	w2, #0x0
    18d8:	54000a4d 	b.le	1a20 <_vsnprintf+0xc00>
    18dc:	91003e84 	add	x4, x20, #0xf
    18e0:	aa1403e0 	mov	x0, x20
    18e4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    18e8:	b9007be2 	str	w2, [sp, #120]
    18ec:	17ffffd1 	b	1830 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    18f0:	b9407be0 	ldr	w0, [sp, #120]
    18f4:	11002002 	add	w2, w0, #0x8
    18f8:	7100005f 	cmp	w2, #0x0
    18fc:	5400088d 	b.le	1a0c <_vsnprintf+0xbec>
    1900:	91003e84 	add	x4, x20, #0xf
    1904:	aa1403e0 	mov	x0, x20
    1908:	927df094 	and	x20, x4, #0xfffffffffffffff8
    190c:	b9007be2 	str	w2, [sp, #120]
    1910:	17ffffbd 	b	1804 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1914:	37f80d00 	tbnz	w0, #31, 1ab4 <_vsnprintf+0xc94>
    1918:	aa1403e0 	mov	x0, x20
    191c:	91002e82 	add	x2, x20, #0xb
    1920:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1924:	b9400004 	ldr	w4, [x0]
    1928:	17ffff7f 	b	1724 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    192c:	37f80b20 	tbnz	w0, #31, 1a90 <_vsnprintf+0xc70>
    1930:	91002e82 	add	x2, x20, #0xb
    1934:	aa1403e0 	mov	x0, x20
    1938:	927df054 	and	x20, x2, #0xfffffffffffffff8
    193c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1940:	710000bf 	cmp	w5, #0x0
    1944:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1948:	17fffeb9 	b	142c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    194c:	b900a3ff 	str	wzr, [sp, #160]
    1950:	17fffe5c 	b	12c0 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1954:	b9407be0 	ldr	w0, [sp, #120]
    1958:	11002002 	add	w2, w0, #0x8
    195c:	7100005f 	cmp	w2, #0x0
    1960:	54000bed 	b.le	1adc <_vsnprintf+0xcbc>
    1964:	91002e84 	add	x4, x20, #0xb
    1968:	aa1403e0 	mov	x0, x20
    196c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1970:	b9007be2 	str	w2, [sp, #120]
    1974:	17ffff6b 	b	1720 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1978:	b9407be0 	ldr	w0, [sp, #120]
    197c:	11002002 	add	w2, w0, #0x8
    1980:	7100005f 	cmp	w2, #0x0
    1984:	54000b6d 	b.le	1af0 <_vsnprintf+0xcd0>
    1988:	91002e84 	add	x4, x20, #0xb
    198c:	aa1403e0 	mov	x0, x20
    1990:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1994:	b9007be2 	str	w2, [sp, #120]
    1998:	17ffff78 	b	1778 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    199c:	b9407be0 	ldr	w0, [sp, #120]
    19a0:	11002002 	add	w2, w0, #0x8
    19a4:	7100005f 	cmp	w2, #0x0
    19a8:	54000aed 	b.le	1b04 <_vsnprintf+0xce4>
    19ac:	91003e84 	add	x4, x20, #0xf
    19b0:	aa1403e0 	mov	x0, x20
    19b4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19b8:	b9007be2 	str	w2, [sp, #120]
    19bc:	17ffffbb 	b	18a8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    19c0:	f94047e1 	ldr	x1, [sp, #136]
    19c4:	b9407be0 	ldr	w0, [sp, #120]
    19c8:	b9007be2 	str	w2, [sp, #120]
    19cc:	8b20c020 	add	x0, x1, w0, sxtw
    19d0:	17fffe10 	b	1210 <_vsnprintf+0x3f0>
    19d4:	f94047e1 	ldr	x1, [sp, #136]
    19d8:	b9407be0 	ldr	w0, [sp, #120]
    19dc:	b9007be2 	str	w2, [sp, #120]
    19e0:	8b20c020 	add	x0, x1, w0, sxtw
    19e4:	17ffff31 	b	16a8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    19e8:	b9407be0 	ldr	w0, [sp, #120]
    19ec:	11002002 	add	w2, w0, #0x8
    19f0:	7100005f 	cmp	w2, #0x0
    19f4:	5400092d 	b.le	1b18 <_vsnprintf+0xcf8>
    19f8:	91003e84 	add	x4, x20, #0xf
    19fc:	aa1403e0 	mov	x0, x20
    1a00:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a04:	b9007be2 	str	w2, [sp, #120]
    1a08:	17ffff9a 	b	1870 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1a0c:	f94047e1 	ldr	x1, [sp, #136]
    1a10:	b9407be0 	ldr	w0, [sp, #120]
    1a14:	b9007be2 	str	w2, [sp, #120]
    1a18:	8b20c020 	add	x0, x1, w0, sxtw
    1a1c:	17ffff7a 	b	1804 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1a20:	f94047e1 	ldr	x1, [sp, #136]
    1a24:	b9407be0 	ldr	w0, [sp, #120]
    1a28:	b9007be2 	str	w2, [sp, #120]
    1a2c:	8b20c020 	add	x0, x1, w0, sxtw
    1a30:	17ffff80 	b	1830 <_vsnprintf+0xa10>
                while (l++ < width) {
    1a34:	aa1b03f5 	mov	x21, x27
    1a38:	17ffff17 	b	1694 <_vsnprintf+0x874>
                while (l++ < width) {
    1a3c:	b900a3e0 	str	w0, [sp, #160]
    1a40:	17ffff01 	b	1644 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1a44:	b9407be0 	ldr	w0, [sp, #120]
    1a48:	11002002 	add	w2, w0, #0x8
    1a4c:	7100005f 	cmp	w2, #0x0
    1a50:	5400078d 	b.le	1b40 <_vsnprintf+0xd20>
    1a54:	aa1403e0 	mov	x0, x20
    1a58:	91002e84 	add	x4, x20, #0xb
    1a5c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a60:	b9007be2 	str	w2, [sp, #120]
    1a64:	79400004 	ldrh	w4, [x0]
    1a68:	17ffff2f 	b	1724 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1a6c:	b9407be0 	ldr	w0, [sp, #120]
    1a70:	11002002 	add	w2, w0, #0x8
    1a74:	7100005f 	cmp	w2, #0x0
    1a78:	540005ad 	b.le	1b2c <_vsnprintf+0xd0c>
    1a7c:	91002e84 	add	x4, x20, #0xb
    1a80:	aa1403e0 	mov	x0, x20
    1a84:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a88:	b9007be2 	str	w2, [sp, #120]
    1a8c:	17fffe64 	b	141c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1a90:	b9407be0 	ldr	w0, [sp, #120]
    1a94:	11002002 	add	w2, w0, #0x8
    1a98:	7100005f 	cmp	w2, #0x0
    1a9c:	540005ed 	b.le	1b58 <_vsnprintf+0xd38>
    1aa0:	91002e84 	add	x4, x20, #0xb
    1aa4:	aa1403e0 	mov	x0, x20
    1aa8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1aac:	b9007be2 	str	w2, [sp, #120]
    1ab0:	17ffffa3 	b	193c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1ab4:	b9407be0 	ldr	w0, [sp, #120]
    1ab8:	11002002 	add	w2, w0, #0x8
    1abc:	7100005f 	cmp	w2, #0x0
    1ac0:	5400056d 	b.le	1b6c <_vsnprintf+0xd4c>
    1ac4:	aa1403e0 	mov	x0, x20
    1ac8:	91002e84 	add	x4, x20, #0xb
    1acc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ad0:	b9007be2 	str	w2, [sp, #120]
    1ad4:	b9400004 	ldr	w4, [x0]
    1ad8:	17ffff13 	b	1724 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1adc:	f94047e1 	ldr	x1, [sp, #136]
    1ae0:	b9407be0 	ldr	w0, [sp, #120]
    1ae4:	b9007be2 	str	w2, [sp, #120]
    1ae8:	8b20c020 	add	x0, x1, w0, sxtw
    1aec:	17ffff0d 	b	1720 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1af0:	f94047e1 	ldr	x1, [sp, #136]
    1af4:	b9407be0 	ldr	w0, [sp, #120]
    1af8:	b9007be2 	str	w2, [sp, #120]
    1afc:	8b20c020 	add	x0, x1, w0, sxtw
    1b00:	17ffff1e 	b	1778 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1b04:	f94047e1 	ldr	x1, [sp, #136]
    1b08:	b9407be0 	ldr	w0, [sp, #120]
    1b0c:	b9007be2 	str	w2, [sp, #120]
    1b10:	8b20c020 	add	x0, x1, w0, sxtw
    1b14:	17ffff65 	b	18a8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1b18:	f94047e1 	ldr	x1, [sp, #136]
    1b1c:	b9407be0 	ldr	w0, [sp, #120]
    1b20:	b9007be2 	str	w2, [sp, #120]
    1b24:	8b20c020 	add	x0, x1, w0, sxtw
    1b28:	17ffff52 	b	1870 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1b2c:	f94047e1 	ldr	x1, [sp, #136]
    1b30:	b9407be0 	ldr	w0, [sp, #120]
    1b34:	b9007be2 	str	w2, [sp, #120]
    1b38:	8b20c020 	add	x0, x1, w0, sxtw
    1b3c:	17fffe38 	b	141c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1b40:	f94047e1 	ldr	x1, [sp, #136]
    1b44:	b9407be0 	ldr	w0, [sp, #120]
    1b48:	b9007be2 	str	w2, [sp, #120]
    1b4c:	8b20c020 	add	x0, x1, w0, sxtw
    1b50:	79400004 	ldrh	w4, [x0]
    1b54:	17fffef4 	b	1724 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1b58:	f94047e1 	ldr	x1, [sp, #136]
    1b5c:	b9407be0 	ldr	w0, [sp, #120]
    1b60:	b9007be2 	str	w2, [sp, #120]
    1b64:	8b20c020 	add	x0, x1, w0, sxtw
    1b68:	17ffff75 	b	193c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1b6c:	f94047e1 	ldr	x1, [sp, #136]
    1b70:	b9407be0 	ldr	w0, [sp, #120]
    1b74:	b9007be2 	str	w2, [sp, #120]
    1b78:	8b20c020 	add	x0, x1, w0, sxtw
    1b7c:	b9400004 	ldr	w4, [x0]
    1b80:	17fffee9 	b	1724 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1b84:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1b88:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1b8c:	12001c42 	and	w2, w2, #0xff
    1b90:	7100245f 	cmp	w2, #0x9
    1b94:	54ffa2a8 	b.hi	fe8 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1b98:	52800142 	mov	w2, #0xa                   	// #10
    1b9c:	d503201f 	nop
    1ba0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1ba4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1ba8:	aa0803f9 	mov	x25, x8
    1bac:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1bb0:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1bb4:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1bb8:	12001c84 	and	w4, w4, #0xff
    1bbc:	7100249f 	cmp	w4, #0x9
    1bc0:	54ffff09 	b.ls	1ba0 <_vsnprintf+0xd80>  // b.plast
    1bc4:	17fffd09 	b	fe8 <_vsnprintf+0x1c8>
        switch (*format) {
    1bc8:	aa1903e4 	mov	x4, x25
    1bcc:	17fffcf0 	b	f8c <_vsnprintf+0x16c>

0000000000001bd0 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1bd0:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1bd4:	910003fd 	mov	x29, sp
    1bd8:	f9000bf3 	str	x19, [sp, #16]
    1bdc:	aa0003f3 	mov	x19, x0
    1be0:	3d801fe0 	str	q0, [sp, #112]
    1be4:	3d8023e1 	str	q1, [sp, #128]
    1be8:	3d8027e2 	str	q2, [sp, #144]
    1bec:	3d802be3 	str	q3, [sp, #160]
    1bf0:	3d802fe4 	str	q4, [sp, #176]
    1bf4:	3d8033e5 	str	q5, [sp, #192]
    1bf8:	3d8037e6 	str	q6, [sp, #208]
    1bfc:	3d803be7 	str	q7, [sp, #224]
    1c00:	a90f8be1 	stp	x1, x2, [sp, #248]
    1c04:	a91093e3 	stp	x3, x4, [sp, #264]
    1c08:	a9119be5 	stp	x5, x6, [sp, #280]
    1c0c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1c10:	97fff968 	bl	1b0 <init_uart_mmio>
    1c14:	72001c1f 	tst	w0, #0xff
    1c18:	540002e0 	b.eq	1c74 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1c1c:	9103c3e0 	add	x0, sp, #0xf0
    1c20:	9104c3e3 	add	x3, sp, #0x130
    1c24:	9104c3e4 	add	x4, sp, #0x130
    1c28:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1c2c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1c30:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1c34:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1c38:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1c3c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1c40:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1c44:	f0ffffe0 	adrp	x0, 0 <main>
    1c48:	9137c000 	add	x0, x0, #0xdf0
    1c4c:	910123e1 	add	x1, sp, #0x48
    1c50:	a94527e8 	ldp	x8, x9, [sp, #80]
    1c54:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1c58:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1c5c:	a90227e8 	stp	x8, x9, [sp, #32]
    1c60:	a9031fe6 	stp	x6, x7, [sp, #48]
    1c64:	97fffc6f 	bl	e20 <_vsnprintf>
    va_end(va);
    return ret;
}
    1c68:	f9400bf3 	ldr	x19, [sp, #16]
    1c6c:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1c70:	d65f03c0 	ret
        return -1;
    1c74:	12800000 	mov	w0, #0xffffffff            	// #-1
    1c78:	17fffffc 	b	1c68 <printf+0x98>
    1c7c:	d503201f 	nop

0000000000001c80 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1c80:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1c84:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1c88:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1c8c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1c90:	910343eb 	add	x11, sp, #0xd0
    1c94:	910403ea 	add	x10, sp, #0x100
    1c98:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1c9c:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ca0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1ca4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ca8:	f0ffffe0 	adrp	x0, 0 <main>
    1cac:	9109c000 	add	x0, x0, #0x270
    va_start(va, format);
    1cb0:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1cb4:	a94337ec 	ldp	x12, x13, [sp, #48]
    1cb8:	a90137ec 	stp	x12, x13, [sp, #16]
    1cbc:	a94427e8 	ldp	x8, x9, [sp, #64]
    1cc0:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1cc4:	3d8017e0 	str	q0, [sp, #80]
    1cc8:	3d801be1 	str	q1, [sp, #96]
    1ccc:	3d801fe2 	str	q2, [sp, #112]
    1cd0:	3d8023e3 	str	q3, [sp, #128]
    1cd4:	3d8027e4 	str	q4, [sp, #144]
    1cd8:	3d802be5 	str	q5, [sp, #160]
    1cdc:	3d802fe6 	str	q6, [sp, #176]
    1ce0:	3d8033e7 	str	q7, [sp, #192]
    1ce4:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ce8:	aa0a03e3 	mov	x3, x10
    1cec:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1cf0:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1cf4:	910043e4 	add	x4, sp, #0x10
{
    1cf8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1cfc:	97fffc49 	bl	e20 <_vsnprintf>
    va_end(va);
    return ret;
}
    1d00:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1d04:	d65f03c0 	ret
    1d08:	d503201f 	nop
    1d0c:	d503201f 	nop

0000000000001d10 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1d10:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1d14:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1d18:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1d1c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1d20:	910343ea 	add	x10, sp, #0xd0
    1d24:	910403e8 	add	x8, sp, #0x100
    1d28:	a90323e8 	stp	x8, x8, [sp, #48]
{
    1d2c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1d30:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1d34:	f90023ea 	str	x10, [sp, #64]
{
    1d38:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1d3c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1d40:	aa0803e2 	mov	x2, x8
    1d44:	a94337ec 	ldp	x12, x13, [sp, #48]
    1d48:	f0ffffe0 	adrp	x0, 0 <main>
    1d4c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1d50:	9109c000 	add	x0, x0, #0x270
    1d54:	a90137ec 	stp	x12, x13, [sp, #16]
    1d58:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1d5c:	3d8017e0 	str	q0, [sp, #80]
    1d60:	3d801be1 	str	q1, [sp, #96]
    1d64:	3d801fe2 	str	q2, [sp, #112]
    1d68:	3d8023e3 	str	q3, [sp, #128]
    1d6c:	3d8027e4 	str	q4, [sp, #144]
    1d70:	3d802be5 	str	q5, [sp, #160]
    1d74:	3d802fe6 	str	q6, [sp, #176]
    1d78:	3d8033e7 	str	q7, [sp, #192]
    1d7c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1d80:	910043e4 	add	x4, sp, #0x10
    1d84:	aa0a03e3 	mov	x3, x10
{
    1d88:	a90e9be5 	stp	x5, x6, [sp, #232]
    1d8c:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1d90:	97fffc24 	bl	e20 <_vsnprintf>
    va_end(va);
    return ret;
}
    1d94:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1d98:	d65f03c0 	ret
    1d9c:	d503201f 	nop

0000000000001da0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    1da0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1da4:	aa0003e3 	mov	x3, x0
    1da8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1dac:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1db0:	a9402428 	ldp	x8, x9, [x1]
    1db4:	910043e4 	add	x4, sp, #0x10
    1db8:	a9411c26 	ldp	x6, x7, [x1, #16]
    1dbc:	f0ffffe0 	adrp	x0, 0 <main>
    1dc0:	9100e3e1 	add	x1, sp, #0x38
    1dc4:	9137c000 	add	x0, x0, #0xdf0
    1dc8:	a90127e8 	stp	x8, x9, [sp, #16]
    1dcc:	a9021fe6 	stp	x6, x7, [sp, #32]
    1dd0:	97fffc14 	bl	e20 <_vsnprintf>
}
    1dd4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1dd8:	d65f03c0 	ret
    1ddc:	d503201f 	nop

0000000000001de0 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    1de0:	aa0303e4 	mov	x4, x3
    1de4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1de8:	aa0103e5 	mov	x5, x1
    1dec:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    1df0:	a9402488 	ldp	x8, x9, [x4]
    1df4:	aa0003e1 	mov	x1, x0
    1df8:	a9411c86 	ldp	x6, x7, [x4, #16]
    1dfc:	aa0203e3 	mov	x3, x2
    1e00:	910043e4 	add	x4, sp, #0x10
    1e04:	aa0503e2 	mov	x2, x5
    1e08:	f0ffffe0 	adrp	x0, 0 <main>
    1e0c:	9109c000 	add	x0, x0, #0x270
    1e10:	a90127e8 	stp	x8, x9, [sp, #16]
    1e14:	a9021fe6 	stp	x6, x7, [sp, #32]
    1e18:	97fffc02 	bl	e20 <_vsnprintf>
}
    1e1c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1e20:	d65f03c0 	ret
    1e24:	d503201f 	nop
    1e28:	d503201f 	nop
    1e2c:	d503201f 	nop

0000000000001e30 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    1e30:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    1e34:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    1e38:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1e3c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1e40:	910443ea 	add	x10, sp, #0x110
    1e44:	910383eb 	add	x11, sp, #0xe0
    1e48:	f90023ea 	str	x10, [sp, #64]
{
    1e4c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1e50:	910443e2 	add	x2, sp, #0x110
    1e54:	f90027e2 	str	x2, [sp, #72]
    1e58:	f9002beb 	str	x11, [sp, #80]
{
    1e5c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    1e60:	290b23e9 	stp	w9, w8, [sp, #88]
{
    1e64:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1e68:	a9443fee 	ldp	x14, x15, [sp, #64]
    1e6c:	9100c3e1 	add	x1, sp, #0x30
    1e70:	a94527e8 	ldp	x8, x9, [sp, #80]
    1e74:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1e78:	f0ffffe0 	adrp	x0, 0 <main>
    1e7c:	91380000 	add	x0, x0, #0xe00
    1e80:	a9013fee 	stp	x14, x15, [sp, #16]
    1e84:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    1e88:	f9001bec 	str	x12, [sp, #48]
    1e8c:	f9001feb 	str	x11, [sp, #56]
{
    1e90:	3d801be0 	str	q0, [sp, #96]
    1e94:	3d801fe1 	str	q1, [sp, #112]
    1e98:	3d8023e2 	str	q2, [sp, #128]
    1e9c:	3d8027e3 	str	q3, [sp, #144]
    1ea0:	3d802be4 	str	q4, [sp, #160]
    1ea4:	3d802fe5 	str	q5, [sp, #176]
    1ea8:	3d8033e6 	str	q6, [sp, #192]
    1eac:	3d8037e7 	str	q7, [sp, #208]
    1eb0:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1eb4:	910043e4 	add	x4, sp, #0x10
    1eb8:	aa0a03e3 	mov	x3, x10
{
    1ebc:	a90f9be5 	stp	x5, x6, [sp, #248]
    1ec0:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1ec4:	97fffbd7 	bl	e20 <_vsnprintf>
    va_end(va);
    return ret;
    1ec8:	a8d17bfd 	ldp	x29, x30, [sp], #272
    1ecc:	d65f03c0 	ret

0000000000001ed0 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    1ed0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    1ed4:	910003fd 	mov	x29, sp
    1ed8:	a90153f3 	stp	x19, x20, [sp, #16]
    1edc:	a9025bf5 	stp	x21, x22, [sp, #32]
    1ee0:	2a0103f6 	mov	w22, w1
    1ee4:	a90363f7 	stp	x23, x24, [sp, #48]
    1ee8:	aa0203f8 	mov	x24, x2
    1eec:	aa0003f7 	mov	x23, x0
    1ef0:	a9046bf9 	stp	x25, x26, [sp, #64]
    1ef4:	aa0403f9 	mov	x25, x4
    1ef8:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    1efc:	d63f0060 	blr	x3
    1f00:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    1f04:	93407c00 	sxtw	x0, w0
    1f08:	94000152 	bl	2450 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    1f0c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    1f10:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    1f14:	5400022d 	b.le	1f58 <spawn+0x88>
    1f18:	52800013 	mov	w19, #0x0                   	// #0
    1f1c:	f9002bfb 	str	x27, [sp, #80]
    1f20:	5282001b 	mov	w27, #0x1000                	// #4096
    1f24:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    1f28:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    1f2c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    1f30:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    1f34:	8b33c2a2 	add	x2, x21, w19, sxtw
    1f38:	1a9bd084 	csel	w4, w4, w27, le
    1f3c:	2a1603e1 	mov	w1, w22
    1f40:	aa1703e0 	mov	x0, x23
    1f44:	d63f0300 	blr	x24
    1f48:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    1f4c:	6b13029f 	cmp	w20, w19
    1f50:	54fffecc 	b.gt	1f28 <spawn+0x58>
    1f54:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    1f58:	aa1a03e3 	mov	x3, x26
    1f5c:	aa1903e2 	mov	x2, x25
    1f60:	aa1503e1 	mov	x1, x21
    1f64:	d2800004 	mov	x4, #0x0                   	// #0
    1f68:	52800020 	mov	w0, #0x1                   	// #1
    1f6c:	940000b9 	bl	2250 <syscall>
    1f70:	2a0003f3 	mov	w19, w0
    free(img);
    1f74:	aa1503e0 	mov	x0, x21
    1f78:	9400013a 	bl	2460 <free>
    return ret;
}
    1f7c:	2a1303e0 	mov	w0, w19
    1f80:	a94153f3 	ldp	x19, x20, [sp, #16]
    1f84:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1f88:	a94363f7 	ldp	x23, x24, [sp, #48]
    1f8c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    1f90:	a8c67bfd 	ldp	x29, x30, [sp], #96
    1f94:	d65f03c0 	ret
    1f98:	d503201f 	nop
    1f9c:	d503201f 	nop

0000000000001fa0 <thread>:

int thread(void* entry, char* name, char** argv)
{
    1fa0:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    1fa4:	aa0203e3 	mov	x3, x2
    1fa8:	aa0003e1 	mov	x1, x0
    1fac:	aa0403e2 	mov	x2, x4
    1fb0:	52800120 	mov	w0, #0x9                   	// #9
    1fb4:	d2800004 	mov	x4, #0x0                   	// #0
    1fb8:	140000a6 	b	2250 <syscall>
    1fbc:	d503201f 	nop

0000000000001fc0 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    1fc0:	93407c01 	sxtw	x1, w0
    1fc4:	d2800004 	mov	x4, #0x0                   	// #0
    1fc8:	d2800003 	mov	x3, #0x0                   	// #0
    1fcc:	d2800002 	mov	x2, #0x0                   	// #0
    1fd0:	52800040 	mov	w0, #0x2                   	// #2
    1fd4:	1400009f 	b	2250 <syscall>
    1fd8:	d503201f 	nop
    1fdc:	d503201f 	nop

0000000000001fe0 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    1fe0:	2a0003e1 	mov	w1, w0
    1fe4:	d2800004 	mov	x4, #0x0                   	// #0
    1fe8:	d2800003 	mov	x3, #0x0                   	// #0
    1fec:	d2800002 	mov	x2, #0x0                   	// #0
    1ff0:	52800060 	mov	w0, #0x3                   	// #3
    1ff4:	14000097 	b	2250 <syscall>
    1ff8:	d503201f 	nop
    1ffc:	d503201f 	nop

0000000000002000 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    2000:	93407c01 	sxtw	x1, w0
    2004:	d2800004 	mov	x4, #0x0                   	// #0
    2008:	d2800003 	mov	x3, #0x0                   	// #0
    200c:	d2800002 	mov	x2, #0x0                   	// #0
    2010:	52800180 	mov	w0, #0xc                   	// #12
    2014:	1400008f 	b	2250 <syscall>
    2018:	d503201f 	nop
    201c:	d503201f 	nop

0000000000002020 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    2020:	aa0003e1 	mov	x1, x0
    2024:	d2800004 	mov	x4, #0x0                   	// #0
    2028:	d2800003 	mov	x3, #0x0                   	// #0
    202c:	d2800002 	mov	x2, #0x0                   	// #0
    2030:	528000a0 	mov	w0, #0x5                   	// #5
    2034:	14000087 	b	2250 <syscall>
    2038:	d503201f 	nop
    203c:	d503201f 	nop

0000000000002040 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    2040:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    2044:	aa0203e3 	mov	x3, x2
    2048:	aa0003e1 	mov	x1, x0
    204c:	528000c0 	mov	w0, #0x6                   	// #6
    2050:	93407c82 	sxtw	x2, w4
    2054:	d2800004 	mov	x4, #0x0                   	// #0
    2058:	1400007e 	b	2250 <syscall>
    205c:	d503201f 	nop

0000000000002060 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    2060:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    2064:	d2800004 	mov	x4, #0x0                   	// #0
    2068:	aa0003e1 	mov	x1, x0
    206c:	d2800003 	mov	x3, #0x0                   	// #0
    2070:	528000e0 	mov	w0, #0x7                   	// #7
    2074:	14000077 	b	2250 <syscall>
    2078:	d503201f 	nop
    207c:	d503201f 	nop

0000000000002080 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    2080:	aa0003e1 	mov	x1, x0
    2084:	d2800004 	mov	x4, #0x0                   	// #0
    2088:	d2800003 	mov	x3, #0x0                   	// #0
    208c:	d2800002 	mov	x2, #0x0                   	// #0
    2090:	52800100 	mov	w0, #0x8                   	// #8
    2094:	1400006f 	b	2250 <syscall>
    2098:	d503201f 	nop
    209c:	d503201f 	nop

00000000000020a0 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    20a0:	aa0003e2 	mov	x2, x0
    20a4:	d2800004 	mov	x4, #0x0                   	// #0
    20a8:	d2800003 	mov	x3, #0x0                   	// #0
    20ac:	d2800061 	mov	x1, #0x3                   	// #3
    20b0:	52800140 	mov	w0, #0xa                   	// #10
    20b4:	14000067 	b	2250 <syscall>
    20b8:	d503201f 	nop
    20bc:	d503201f 	nop

00000000000020c0 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    20c0:	aa0003e2 	mov	x2, x0
    20c4:	d2800004 	mov	x4, #0x0                   	// #0
    20c8:	d2800003 	mov	x3, #0x0                   	// #0
    20cc:	d2800021 	mov	x1, #0x1                   	// #1
    20d0:	52800140 	mov	w0, #0xa                   	// #10
    20d4:	1400005f 	b	2250 <syscall>
    20d8:	d503201f 	nop
    20dc:	d503201f 	nop

00000000000020e0 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    20e0:	d2800004 	mov	x4, #0x0                   	// #0
    20e4:	d2800003 	mov	x3, #0x0                   	// #0
    20e8:	d2800002 	mov	x2, #0x0                   	// #0
    20ec:	d2800041 	mov	x1, #0x2                   	// #2
    20f0:	52800140 	mov	w0, #0xa                   	// #10
    20f4:	14000057 	b	2250 <syscall>
    20f8:	d503201f 	nop
    20fc:	d503201f 	nop

0000000000002100 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    2100:	d2800004 	mov	x4, #0x0                   	// #0
    2104:	d2800003 	mov	x3, #0x0                   	// #0
    2108:	d2800002 	mov	x2, #0x0                   	// #0
    210c:	d2800081 	mov	x1, #0x4                   	// #4
    2110:	52800140 	mov	w0, #0xa                   	// #10
    2114:	1400004f 	b	2250 <syscall>
    2118:	d503201f 	nop
    211c:	d503201f 	nop

0000000000002120 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    2120:	d2800004 	mov	x4, #0x0                   	// #0
    2124:	d2800003 	mov	x3, #0x0                   	// #0
    2128:	d2800002 	mov	x2, #0x0                   	// #0
    212c:	d28000a1 	mov	x1, #0x5                   	// #5
    2130:	52800140 	mov	w0, #0xa                   	// #10
    2134:	14000047 	b	2250 <syscall>
    2138:	d503201f 	nop
    213c:	d503201f 	nop

0000000000002140 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    2140:	d2800004 	mov	x4, #0x0                   	// #0
    2144:	d2800003 	mov	x3, #0x0                   	// #0
    2148:	d2800002 	mov	x2, #0x0                   	// #0
    214c:	d28000c1 	mov	x1, #0x6                   	// #6
    2150:	52800140 	mov	w0, #0xa                   	// #10
    2154:	1400003f 	b	2250 <syscall>
    2158:	d503201f 	nop
    215c:	d503201f 	nop

0000000000002160 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    2160:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    2164:	92401c64 	and	x4, x3, #0xff
    2168:	aa0103e2 	mov	x2, x1
    216c:	aa0003e1 	mov	x1, x0
    2170:	93407ca3 	sxtw	x3, w5
    2174:	52800080 	mov	w0, #0x4                   	// #4
    2178:	14000036 	b	2250 <syscall>
    217c:	d503201f 	nop

0000000000002180 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    2180:	93407c22 	sxtw	x2, w1
    2184:	d2800004 	mov	x4, #0x0                   	// #0
    2188:	93407c01 	sxtw	x1, w0
    218c:	d2800003 	mov	x3, #0x0                   	// #0
    2190:	52800160 	mov	w0, #0xb                   	// #11
    2194:	1400002f 	b	2250 <syscall>
    2198:	d503201f 	nop
    219c:	d503201f 	nop

00000000000021a0 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    21a0:	93407c02 	sxtw	x2, w0
    21a4:	d2800004 	mov	x4, #0x0                   	// #0
    21a8:	d2800003 	mov	x3, #0x0                   	// #0
    21ac:	d2800001 	mov	x1, #0x0                   	// #0
    21b0:	528001a0 	mov	w0, #0xd                   	// #13
    21b4:	14000027 	b	2250 <syscall>
    21b8:	d503201f 	nop
    21bc:	d503201f 	nop

00000000000021c0 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    21c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    21c4:	93407c02 	sxtw	x2, w0
    21c8:	d2800004 	mov	x4, #0x0                   	// #0
{
    21cc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    21d0:	d2800003 	mov	x3, #0x0                   	// #0
    21d4:	d2800021 	mov	x1, #0x1                   	// #1
    21d8:	528001a0 	mov	w0, #0xd                   	// #13
    21dc:	9400001d 	bl	2250 <syscall>
    21e0:	7100001f 	cmp	w0, #0x0
}
    21e4:	1a9f07e0 	cset	w0, ne  // ne = any
    21e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    21ec:	d65f03c0 	ret

00000000000021f0 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    21f0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    21f4:	93407c02 	sxtw	x2, w0
    21f8:	d2800004 	mov	x4, #0x0                   	// #0
{
    21fc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2200:	d2800003 	mov	x3, #0x0                   	// #0
    2204:	d2800061 	mov	x1, #0x3                   	// #3
    2208:	528001a0 	mov	w0, #0xd                   	// #13
    220c:	94000011 	bl	2250 <syscall>
    2210:	7100001f 	cmp	w0, #0x0
}
    2214:	1a9f07e0 	cset	w0, ne  // ne = any
    2218:	a8c17bfd 	ldp	x29, x30, [sp], #16
    221c:	d65f03c0 	ret

0000000000002220 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    2220:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2224:	93407c02 	sxtw	x2, w0
    2228:	d2800004 	mov	x4, #0x0                   	// #0
{
    222c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2230:	d2800003 	mov	x3, #0x0                   	// #0
    2234:	d2800041 	mov	x1, #0x2                   	// #2
    2238:	528001a0 	mov	w0, #0xd                   	// #13
    223c:	94000005 	bl	2250 <syscall>
    2240:	7100001f 	cmp	w0, #0x0
    2244:	1a9f07e0 	cset	w0, ne  // ne = any
    2248:	a8c17bfd 	ldp	x29, x30, [sp], #16
    224c:	d65f03c0 	ret

0000000000002250 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    2250:	2a0003e5 	mov	w5, w0
    2254:	aa0103e6 	mov	x6, x1
    2258:	aa0203e7 	mov	x7, x2
    225c:	aa0303e8 	mov	x8, x3
    2260:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    2264:	aa0503e0 	mov	x0, x5
    2268:	aa0603e1 	mov	x1, x6
    226c:	aa0703e2 	mov	x2, x7
    2270:	aa0803e3 	mov	x3, x8
    2274:	aa0903e4 	mov	x4, x9
    2278:	d4000001 	svc	#0x0
    227c:	d5033b9f 	dsb	ish
    2280:	d5033fdf 	isb
    2284:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    2288:	2a0503e0 	mov	w0, w5
    228c:	d65f03c0 	ret

0000000000002290 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    2290:	14000000 	b	2290 <_exit>
    2294:	d503201f 	nop
    2298:	d503201f 	nop
    229c:	d503201f 	nop

00000000000022a0 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    22a0:	d0000003 	adrp	x3, 4000 <impure_data+0x60>
    22a4:	f9439461 	ldr	x1, [x3, #1832]
    22a8:	d0000002 	adrp	x2, 4000 <impure_data+0x60>
    22ac:	911de042 	add	x2, x2, #0x778
    22b0:	f100003f 	cmp	x1, #0x0
    22b4:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    22b8:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    22bc:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    22c0:	f9039462 	str	x2, [x3, #1832]
}
    22c4:	d65f03c0 	ret
    22c8:	d503201f 	nop
    22cc:	d503201f 	nop

00000000000022d0 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    22d0:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    22d4:	d65f03c0 	ret
    22d8:	d503201f 	nop
    22dc:	d503201f 	nop

00000000000022e0 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    22e0:	12800000 	mov	w0, #0xffffffff            	// #-1
    22e4:	d65f03c0 	ret
    22e8:	d503201f 	nop
    22ec:	d503201f 	nop

00000000000022f0 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    22f0:	52800000 	mov	w0, #0x0                   	// #0
    22f4:	d65f03c0 	ret
    22f8:	d503201f 	nop
    22fc:	d503201f 	nop

0000000000002300 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    2300:	52800020 	mov	w0, #0x1                   	// #1
    2304:	d65f03c0 	ret
    2308:	d503201f 	nop
    230c:	d503201f 	nop

0000000000002310 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    2310:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    2314:	d65f03c0 	ret
    2318:	d503201f 	nop
    231c:	d503201f 	nop

0000000000002320 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    2320:	d2800000 	mov	x0, #0x0                   	// #0
    2324:	d65f03c0 	ret
    2328:	d503201f 	nop
    232c:	d503201f 	nop

0000000000002330 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    2330:	12800000 	mov	w0, #0xffffffff            	// #-1
    2334:	d65f03c0 	ret
    2338:	d503201f 	nop
    233c:	d503201f 	nop

0000000000002340 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    2340:	52800020 	mov	w0, #0x1                   	// #1
    2344:	d65f03c0 	ret
    2348:	d503201f 	nop
    234c:	d503201f 	nop

0000000000002350 <atexit>:
    2350:	aa0003e1 	mov	x1, x0
    2354:	d2800003 	mov	x3, #0x0                   	// #0
    2358:	d2800002 	mov	x2, #0x0                   	// #0
    235c:	52800000 	mov	w0, #0x0                   	// #0
    2360:	140002ec 	b	2f10 <__register_exitproc>
    2364:	d503201f 	nop
    2368:	d503201f 	nop
    236c:	d503201f 	nop

0000000000002370 <__libc_fini_array>:
    2370:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2374:	b0000001 	adrp	x1, 3000 <_malloc_trim_r+0x50>
    2378:	b0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
    237c:	910003fd 	mov	x29, sp
    2380:	a90153f3 	stp	x19, x20, [sp, #16]
    2384:	f9439033 	ldr	x19, [x1, #1824]
    2388:	f9439414 	ldr	x20, [x0, #1832]
    238c:	cb140273 	sub	x19, x19, x20
    2390:	9343fe73 	asr	x19, x19, #3
    2394:	b40000b3 	cbz	x19, 23a8 <__libc_fini_array+0x38>
    2398:	d1000673 	sub	x19, x19, #0x1
    239c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    23a0:	d63f0000 	blr	x0
    23a4:	b5ffffb3 	cbnz	x19, 2398 <__libc_fini_array+0x28>
    23a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    23ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    23b0:	14000461 	b	3534 <_fini>
    23b4:	d503201f 	nop
    23b8:	d503201f 	nop
    23bc:	d503201f 	nop

00000000000023c0 <__libc_init_array>:
    23c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    23c4:	b0000001 	adrp	x1, 3000 <_malloc_trim_r+0x50>
    23c8:	b0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
    23cc:	910003fd 	mov	x29, sp
    23d0:	a90153f3 	stp	x19, x20, [sp, #16]
    23d4:	f9439834 	ldr	x20, [x1, #1840]
    23d8:	f90013f5 	str	x21, [sp, #32]
    23dc:	f9439c15 	ldr	x21, [x0, #1848]
    23e0:	cb150294 	sub	x20, x20, x21
    23e4:	9343fe94 	asr	x20, x20, #3
    23e8:	b40000f4 	cbz	x20, 2404 <__libc_init_array+0x44>
    23ec:	d2800013 	mov	x19, #0x0                   	// #0
    23f0:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    23f4:	91000673 	add	x19, x19, #0x1
    23f8:	d63f0000 	blr	x0
    23fc:	eb13029f 	cmp	x20, x19
    2400:	54ffff81 	b.ne	23f0 <__libc_init_array+0x30>  // b.any
    2404:	940ff6ff 	bl	400000 <_init>
    2408:	b0000001 	adrp	x1, 3000 <_malloc_trim_r+0x50>
    240c:	b0000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
    2410:	f943a034 	ldr	x20, [x1, #1856]
    2414:	f943a415 	ldr	x21, [x0, #1864]
    2418:	cb150294 	sub	x20, x20, x21
    241c:	9343fe94 	asr	x20, x20, #3
    2420:	b40000f4 	cbz	x20, 243c <__libc_init_array+0x7c>
    2424:	d2800013 	mov	x19, #0x0                   	// #0
    2428:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    242c:	91000673 	add	x19, x19, #0x1
    2430:	d63f0000 	blr	x0
    2434:	eb13029f 	cmp	x20, x19
    2438:	54ffff81 	b.ne	2428 <__libc_init_array+0x68>  // b.any
    243c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2440:	f94013f5 	ldr	x21, [sp, #32]
    2444:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2448:	d65f03c0 	ret
    244c:	d503201f 	nop

0000000000002450 <malloc>:
    2450:	b0000002 	adrp	x2, 3000 <_malloc_trim_r+0x50>
    2454:	aa0003e1 	mov	x1, x0
    2458:	f947cc40 	ldr	x0, [x2, #3992]
    245c:	14000005 	b	2470 <_malloc_r>

0000000000002460 <free>:
    2460:	b0000002 	adrp	x2, 3000 <_malloc_trim_r+0x50>
    2464:	aa0003e1 	mov	x1, x0
    2468:	f947cc40 	ldr	x0, [x2, #3992]
    246c:	14000315 	b	30c0 <_free_r>

0000000000002470 <_malloc_r>:
    2470:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    2474:	910003fd 	mov	x29, sp
    2478:	a90153f3 	stp	x19, x20, [sp, #16]
    247c:	91005c33 	add	x19, x1, #0x17
    2480:	a9025bf5 	stp	x21, x22, [sp, #32]
    2484:	aa0003f5 	mov	x21, x0
    2488:	a90363f7 	stp	x23, x24, [sp, #48]
    248c:	f100ba7f 	cmp	x19, #0x2e
    2490:	54000c88 	b.hi	2620 <_malloc_r+0x1b0>  // b.pmore
    2494:	f100803f 	cmp	x1, #0x20
    2498:	54002068 	b.hi	28a4 <_malloc_r+0x434>  // b.pmore
    249c:	94000281 	bl	2ea0 <__malloc_lock>
    24a0:	d2800413 	mov	x19, #0x20                  	// #32
    24a4:	d2800a00 	mov	x0, #0x50                  	// #80
    24a8:	52800085 	mov	w5, #0x4                   	// #4
    24ac:	b0000014 	adrp	x20, 3000 <_malloc_trim_r+0x50>
    24b0:	911de294 	add	x20, x20, #0x778
    24b4:	8b000280 	add	x0, x20, x0
    24b8:	110008a5 	add	w5, w5, #0x2
    24bc:	d1004000 	sub	x0, x0, #0x10
    24c0:	f9400c01 	ldr	x1, [x0, #24]
    24c4:	eb00003f 	cmp	x1, x0
    24c8:	54002181 	b.ne	28f8 <_malloc_r+0x488>  // b.any
    24cc:	f9401284 	ldr	x4, [x20, #32]
    24d0:	91004282 	add	x2, x20, #0x10
    24d4:	eb02009f 	cmp	x4, x2
    24d8:	54000f20 	b.eq	26bc <_malloc_r+0x24c>  // b.none
    24dc:	f9400481 	ldr	x1, [x4, #8]
    24e0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    24e4:	cb130023 	sub	x3, x1, x19
    24e8:	f1007c7f 	cmp	x3, #0x1f
    24ec:	54002d4c 	b.gt	2a94 <_malloc_r+0x624>
    24f0:	a9020a82 	stp	x2, x2, [x20, #32]
    24f4:	b6f81f23 	tbz	x3, #63, 28d8 <_malloc_r+0x468>
    24f8:	f107fc3f 	cmp	x1, #0x1ff
    24fc:	54002428 	b.hi	2980 <_malloc_r+0x510>  // b.pmore
    2500:	d343fc22 	lsr	x2, x1, #3
    2504:	d2800021 	mov	x1, #0x1                   	// #1
    2508:	11000440 	add	w0, w2, #0x1
    250c:	13027c42 	asr	w2, w2, #2
    2510:	531f7800 	lsl	w0, w0, #1
    2514:	f9400683 	ldr	x3, [x20, #8]
    2518:	8b20ce80 	add	x0, x20, w0, sxtw #3
    251c:	9ac22021 	lsl	x1, x1, x2
    2520:	aa030021 	orr	x1, x1, x3
    2524:	f85f0402 	ldr	x2, [x0], #-16
    2528:	f9000681 	str	x1, [x20, #8]
    252c:	a9010082 	stp	x2, x0, [x4, #16]
    2530:	f9000804 	str	x4, [x0, #16]
    2534:	f9000c44 	str	x4, [x2, #24]
    2538:	13027ca2 	asr	w2, w5, #2
    253c:	d2800020 	mov	x0, #0x1                   	// #1
    2540:	9ac22000 	lsl	x0, x0, x2
    2544:	eb01001f 	cmp	x0, x1
    2548:	54000c68 	b.hi	26d4 <_malloc_r+0x264>  // b.pmore
    254c:	ea01001f 	tst	x0, x1
    2550:	540000c1 	b.ne	2568 <_malloc_r+0xf8>  // b.any
    2554:	121e74a5 	and	w5, w5, #0xfffffffc
    2558:	d37ff800 	lsl	x0, x0, #1
    255c:	110010a5 	add	w5, w5, #0x4
    2560:	ea01001f 	tst	x0, x1
    2564:	54ffffa0 	b.eq	2558 <_malloc_r+0xe8>  // b.none
    2568:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    256c:	110004a7 	add	w7, w5, #0x1
    2570:	2a0503e8 	mov	w8, w5
    2574:	531f78e7 	lsl	w7, w7, #1
    2578:	8b27cd27 	add	x7, x9, w7, sxtw #3
    257c:	8b070287 	add	x7, x20, x7
    2580:	aa0703e4 	mov	x4, x7
    2584:	f9400c81 	ldr	x1, [x4, #24]
    2588:	14000009 	b	25ac <_malloc_r+0x13c>
    258c:	f9400422 	ldr	x2, [x1, #8]
    2590:	aa0103e6 	mov	x6, x1
    2594:	f9400c21 	ldr	x1, [x1, #24]
    2598:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    259c:	cb130043 	sub	x3, x2, x19
    25a0:	f1007c7f 	cmp	x3, #0x1f
    25a4:	5400238c 	b.gt	2a14 <_malloc_r+0x5a4>
    25a8:	b6f82563 	tbz	x3, #63, 2a54 <_malloc_r+0x5e4>
    25ac:	eb01009f 	cmp	x4, x1
    25b0:	54fffee1 	b.ne	258c <_malloc_r+0x11c>  // b.any
    25b4:	7100f91f 	cmp	w8, #0x3e
    25b8:	540029cd 	b.le	2af0 <_malloc_r+0x680>
    25bc:	91004084 	add	x4, x4, #0x10
    25c0:	11000508 	add	w8, w8, #0x1
    25c4:	f240051f 	tst	x8, #0x3
    25c8:	54fffde1 	b.ne	2584 <_malloc_r+0x114>  // b.any
    25cc:	14000005 	b	25e0 <_malloc_r+0x170>
    25d0:	f85f04e1 	ldr	x1, [x7], #-16
    25d4:	510004a5 	sub	w5, w5, #0x1
    25d8:	eb07003f 	cmp	x1, x7
    25dc:	540035a1 	b.ne	2c90 <_malloc_r+0x820>  // b.any
    25e0:	f24004bf 	tst	x5, #0x3
    25e4:	54ffff61 	b.ne	25d0 <_malloc_r+0x160>  // b.any
    25e8:	f9400681 	ldr	x1, [x20, #8]
    25ec:	8a200021 	bic	x1, x1, x0
    25f0:	f9000681 	str	x1, [x20, #8]
    25f4:	d37ff800 	lsl	x0, x0, #1
    25f8:	f100001f 	cmp	x0, #0x0
    25fc:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    2600:	54000089 	b.ls	2610 <_malloc_r+0x1a0>  // b.plast
    2604:	14000034 	b	26d4 <_malloc_r+0x264>
    2608:	d37ff800 	lsl	x0, x0, #1
    260c:	11001108 	add	w8, w8, #0x4
    2610:	ea01001f 	tst	x0, x1
    2614:	54ffffa0 	b.eq	2608 <_malloc_r+0x198>  // b.none
    2618:	2a0803e5 	mov	w5, w8
    261c:	17ffffd4 	b	256c <_malloc_r+0xfc>
    2620:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    2624:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    2628:	eb02027f 	cmp	x19, x2
    262c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    2630:	540013a8 	b.hi	28a4 <_malloc_r+0x434>  // b.pmore
    2634:	9400021b 	bl	2ea0 <__malloc_lock>
    2638:	f107de7f 	cmp	x19, #0x1f7
    263c:	54002229 	b.ls	2a80 <_malloc_r+0x610>  // b.plast
    2640:	d349fe60 	lsr	x0, x19, #9
    2644:	b4001420 	cbz	x0, 28c8 <_malloc_r+0x458>
    2648:	f100101f 	cmp	x0, #0x4
    264c:	54001d08 	b.hi	29ec <_malloc_r+0x57c>  // b.pmore
    2650:	d346fe60 	lsr	x0, x19, #6
    2654:	1100e405 	add	w5, w0, #0x39
    2658:	1100e000 	add	w0, w0, #0x38
    265c:	531f78a4 	lsl	w4, w5, #1
    2660:	937d7c84 	sbfiz	x4, x4, #3, #32
    2664:	b0000014 	adrp	x20, 3000 <_malloc_trim_r+0x50>
    2668:	911de294 	add	x20, x20, #0x778
    266c:	8b040284 	add	x4, x20, x4
    2670:	d1004084 	sub	x4, x4, #0x10
    2674:	f9400c81 	ldr	x1, [x4, #24]
    2678:	eb01009f 	cmp	x4, x1
    267c:	540000c1 	b.ne	2694 <_malloc_r+0x224>  // b.any
    2680:	17ffff93 	b	24cc <_malloc_r+0x5c>
    2684:	b6f815e3 	tbz	x3, #63, 2940 <_malloc_r+0x4d0>
    2688:	f9400c21 	ldr	x1, [x1, #24]
    268c:	eb01009f 	cmp	x4, x1
    2690:	54fff1e0 	b.eq	24cc <_malloc_r+0x5c>  // b.none
    2694:	f9400422 	ldr	x2, [x1, #8]
    2698:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    269c:	cb130043 	sub	x3, x2, x19
    26a0:	f1007c7f 	cmp	x3, #0x1f
    26a4:	54ffff0d 	b.le	2684 <_malloc_r+0x214>
    26a8:	f9401284 	ldr	x4, [x20, #32]
    26ac:	91004282 	add	x2, x20, #0x10
    26b0:	2a0003e5 	mov	w5, w0
    26b4:	eb02009f 	cmp	x4, x2
    26b8:	54fff121 	b.ne	24dc <_malloc_r+0x6c>  // b.any
    26bc:	f9400681 	ldr	x1, [x20, #8]
    26c0:	13027ca2 	asr	w2, w5, #2
    26c4:	d2800020 	mov	x0, #0x1                   	// #1
    26c8:	9ac22000 	lsl	x0, x0, x2
    26cc:	eb01001f 	cmp	x0, x1
    26d0:	54fff3e9 	b.ls	254c <_malloc_r+0xdc>  // b.plast
    26d4:	f9400a97 	ldr	x23, [x20, #16]
    26d8:	f94006f6 	ldr	x22, [x23, #8]
    26dc:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    26e0:	eb18027f 	cmp	x19, x24
    26e4:	cb130300 	sub	x0, x24, x19
    26e8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    26ec:	54000bec 	b.gt	2868 <_malloc_r+0x3f8>
    26f0:	d0000001 	adrp	x1, 4000 <impure_data+0x60>
    26f4:	a90573fb 	stp	x27, x28, [sp, #80]
    26f8:	b000001b 	adrp	x27, 3000 <_malloc_trim_r+0x50>
    26fc:	f943b421 	ldr	x1, [x1, #1896]
    2700:	d28203e3 	mov	x3, #0x101f                	// #4127
    2704:	f947c762 	ldr	x2, [x27, #3976]
    2708:	8b010261 	add	x1, x19, x1
    270c:	8b030036 	add	x22, x1, x3
    2710:	91008021 	add	x1, x1, #0x20
    2714:	b100045f 	cmn	x2, #0x1
    2718:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    271c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    2720:	aa1503e0 	mov	x0, x21
    2724:	aa1603e1 	mov	x1, x22
    2728:	a9046bf9 	stp	x25, x26, [sp, #64]
    272c:	940001e5 	bl	2ec0 <_sbrk_r>
    2730:	8b1802fa 	add	x26, x23, x24
    2734:	aa0003f9 	mov	x25, x0
    2738:	b100041f 	cmn	x0, #0x1
    273c:	54001f20 	b.eq	2b20 <_malloc_r+0x6b0>  // b.none
    2740:	eb00035f 	cmp	x26, x0
    2744:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    2748:	54001ec1 	b.ne	2b20 <_malloc_r+0x6b0>  // b.any
    274c:	d000001c 	adrp	x28, 4000 <impure_data+0x60>
    2750:	b9473381 	ldr	w1, [x28, #1840]
    2754:	0b160021 	add	w1, w1, w22
    2758:	b9073381 	str	w1, [x28, #1840]
    275c:	eb00035f 	cmp	x26, x0
    2760:	54001ce0 	b.eq	2afc <_malloc_r+0x68c>  // b.none
    2764:	f947c760 	ldr	x0, [x27, #3976]
    2768:	b100041f 	cmn	x0, #0x1
    276c:	54001d60 	b.eq	2b18 <_malloc_r+0x6a8>  // b.none
    2770:	cb1a033a 	sub	x26, x25, x26
    2774:	0b1a0021 	add	w1, w1, w26
    2778:	b9073381 	str	w1, [x28, #1840]
    277c:	f2400f3a 	ands	x26, x25, #0xf
    2780:	54001e40 	b.eq	2b48 <_malloc_r+0x6d8>  // b.none
    2784:	cb1a0339 	sub	x25, x25, x26
    2788:	d2820201 	mov	x1, #0x1010                	// #4112
    278c:	91004339 	add	x25, x25, #0x10
    2790:	cb1a0021 	sub	x1, x1, x26
    2794:	8b16033b 	add	x27, x25, x22
    2798:	aa1503e0 	mov	x0, x21
    279c:	cb1b0036 	sub	x22, x1, x27
    27a0:	92402ed6 	and	x22, x22, #0xfff
    27a4:	aa1603e1 	mov	x1, x22
    27a8:	940001c6 	bl	2ec0 <_sbrk_r>
    27ac:	b100041f 	cmn	x0, #0x1
    27b0:	54002480 	b.eq	2c40 <_malloc_r+0x7d0>  // b.none
    27b4:	cb190000 	sub	x0, x0, x25
    27b8:	2a1603e2 	mov	w2, w22
    27bc:	8b160016 	add	x22, x0, x22
    27c0:	b9473381 	ldr	w1, [x28, #1840]
    27c4:	b24002d6 	orr	x22, x22, #0x1
    27c8:	f9000a99 	str	x25, [x20, #16]
    27cc:	0b010041 	add	w1, w2, w1
    27d0:	b9073381 	str	w1, [x28, #1840]
    27d4:	f9000736 	str	x22, [x25, #8]
    27d8:	eb1402ff 	cmp	x23, x20
    27dc:	54002000 	b.eq	2bdc <_malloc_r+0x76c>  // b.none
    27e0:	f1007f1f 	cmp	x24, #0x1f
    27e4:	54001cc9 	b.ls	2b7c <_malloc_r+0x70c>  // b.plast
    27e8:	d1006300 	sub	x0, x24, #0x18
    27ec:	d2800124 	mov	x4, #0x9                   	// #9
    27f0:	f94006e2 	ldr	x2, [x23, #8]
    27f4:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    27f8:	8b0002e3 	add	x3, x23, x0
    27fc:	92400042 	and	x2, x2, #0x1
    2800:	aa000042 	orr	x2, x2, x0
    2804:	f90006e2 	str	x2, [x23, #8]
    2808:	f8008c64 	str	x4, [x3, #8]!
    280c:	f9000464 	str	x4, [x3, #8]
    2810:	f1007c1f 	cmp	x0, #0x1f
    2814:	54002088 	b.hi	2c24 <_malloc_r+0x7b4>  // b.pmore
    2818:	f9400736 	ldr	x22, [x25, #8]
    281c:	aa1903f7 	mov	x23, x25
    2820:	d0000000 	adrp	x0, 4000 <impure_data+0x60>
    2824:	93407c21 	sxtw	x1, w1
    2828:	f943ac02 	ldr	x2, [x0, #1880]
    282c:	eb02003f 	cmp	x1, x2
    2830:	54000049 	b.ls	2838 <_malloc_r+0x3c8>  // b.plast
    2834:	f903ac01 	str	x1, [x0, #1880]
    2838:	d0000000 	adrp	x0, 4000 <impure_data+0x60>
    283c:	f943b002 	ldr	x2, [x0, #1888]
    2840:	eb02003f 	cmp	x1, x2
    2844:	54000049 	b.ls	284c <_malloc_r+0x3dc>  // b.plast
    2848:	f903b001 	str	x1, [x0, #1888]
    284c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    2850:	eb00027f 	cmp	x19, x0
    2854:	cb130000 	sub	x0, x0, x19
    2858:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    285c:	5400194d 	b.le	2b84 <_malloc_r+0x714>
    2860:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2864:	a94573fb 	ldp	x27, x28, [sp, #80]
    2868:	8b1302e2 	add	x2, x23, x19
    286c:	b2400273 	orr	x19, x19, #0x1
    2870:	f90006f3 	str	x19, [x23, #8]
    2874:	b2400001 	orr	x1, x0, #0x1
    2878:	f9000a82 	str	x2, [x20, #16]
    287c:	f9000441 	str	x1, [x2, #8]
    2880:	aa1503e0 	mov	x0, x21
    2884:	910042f7 	add	x23, x23, #0x10
    2888:	9400018a 	bl	2eb0 <__malloc_unlock>
    288c:	aa1703e0 	mov	x0, x23
    2890:	a94153f3 	ldp	x19, x20, [sp, #16]
    2894:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2898:	a94363f7 	ldp	x23, x24, [sp, #48]
    289c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    28a0:	d65f03c0 	ret
    28a4:	52800180 	mov	w0, #0xc                   	// #12
    28a8:	d2800017 	mov	x23, #0x0                   	// #0
    28ac:	b90002a0 	str	w0, [x21]
    28b0:	aa1703e0 	mov	x0, x23
    28b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    28b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    28bc:	a94363f7 	ldp	x23, x24, [sp, #48]
    28c0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    28c4:	d65f03c0 	ret
    28c8:	d2808004 	mov	x4, #0x400                 	// #1024
    28cc:	52800805 	mov	w5, #0x40                  	// #64
    28d0:	528007e0 	mov	w0, #0x3f                  	// #63
    28d4:	17ffff64 	b	2664 <_malloc_r+0x1f4>
    28d8:	8b010081 	add	x1, x4, x1
    28dc:	aa1503e0 	mov	x0, x21
    28e0:	91004097 	add	x23, x4, #0x10
    28e4:	f9400422 	ldr	x2, [x1, #8]
    28e8:	b2400042 	orr	x2, x2, #0x1
    28ec:	f9000422 	str	x2, [x1, #8]
    28f0:	94000170 	bl	2eb0 <__malloc_unlock>
    28f4:	17ffffef 	b	28b0 <_malloc_r+0x440>
    28f8:	a9409022 	ldp	x2, x4, [x1, #8]
    28fc:	91004037 	add	x23, x1, #0x10
    2900:	f9400c23 	ldr	x3, [x1, #24]
    2904:	aa1503e0 	mov	x0, x21
    2908:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    290c:	8b020022 	add	x2, x1, x2
    2910:	f9400441 	ldr	x1, [x2, #8]
    2914:	f9000c83 	str	x3, [x4, #24]
    2918:	f9000864 	str	x4, [x3, #16]
    291c:	b2400021 	orr	x1, x1, #0x1
    2920:	f9000441 	str	x1, [x2, #8]
    2924:	94000163 	bl	2eb0 <__malloc_unlock>
    2928:	aa1703e0 	mov	x0, x23
    292c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2930:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2934:	a94363f7 	ldp	x23, x24, [sp, #48]
    2938:	a8c67bfd 	ldp	x29, x30, [sp], #96
    293c:	d65f03c0 	ret
    2940:	8b020022 	add	x2, x1, x2
    2944:	91004037 	add	x23, x1, #0x10
    2948:	a9410c24 	ldp	x4, x3, [x1, #16]
    294c:	aa1503e0 	mov	x0, x21
    2950:	f9400441 	ldr	x1, [x2, #8]
    2954:	f9000c83 	str	x3, [x4, #24]
    2958:	b2400021 	orr	x1, x1, #0x1
    295c:	f9000864 	str	x4, [x3, #16]
    2960:	f9000441 	str	x1, [x2, #8]
    2964:	94000153 	bl	2eb0 <__malloc_unlock>
    2968:	aa1703e0 	mov	x0, x23
    296c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2970:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2974:	a94363f7 	ldp	x23, x24, [sp, #48]
    2978:	a8c67bfd 	ldp	x29, x30, [sp], #96
    297c:	d65f03c0 	ret
    2980:	d349fc20 	lsr	x0, x1, #9
    2984:	f127fc3f 	cmp	x1, #0x9ff
    2988:	540009e9 	b.ls	2ac4 <_malloc_r+0x654>  // b.plast
    298c:	f100501f 	cmp	x0, #0x14
    2990:	54001068 	b.hi	2b9c <_malloc_r+0x72c>  // b.pmore
    2994:	11017003 	add	w3, w0, #0x5c
    2998:	11016c02 	add	w2, w0, #0x5b
    299c:	531f7863 	lsl	w3, w3, #1
    29a0:	937d7c63 	sbfiz	x3, x3, #3, #32
    29a4:	8b030283 	add	x3, x20, x3
    29a8:	f85f0460 	ldr	x0, [x3], #-16
    29ac:	eb00007f 	cmp	x3, x0
    29b0:	54000be0 	b.eq	2b2c <_malloc_r+0x6bc>  // b.none
    29b4:	d503201f 	nop
    29b8:	f9400402 	ldr	x2, [x0, #8]
    29bc:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    29c0:	eb01005f 	cmp	x2, x1
    29c4:	54000089 	b.ls	29d4 <_malloc_r+0x564>  // b.plast
    29c8:	f9400800 	ldr	x0, [x0, #16]
    29cc:	eb00007f 	cmp	x3, x0
    29d0:	54ffff41 	b.ne	29b8 <_malloc_r+0x548>  // b.any
    29d4:	f9400681 	ldr	x1, [x20, #8]
    29d8:	f9400c03 	ldr	x3, [x0, #24]
    29dc:	a9010c80 	stp	x0, x3, [x4, #16]
    29e0:	f9000864 	str	x4, [x3, #16]
    29e4:	f9000c04 	str	x4, [x0, #24]
    29e8:	17fffed4 	b	2538 <_malloc_r+0xc8>
    29ec:	f100501f 	cmp	x0, #0x14
    29f0:	54000769 	b.ls	2adc <_malloc_r+0x66c>  // b.plast
    29f4:	f101501f 	cmp	x0, #0x54
    29f8:	54000e28 	b.hi	2bbc <_malloc_r+0x74c>  // b.pmore
    29fc:	d34cfe60 	lsr	x0, x19, #12
    2a00:	1101bc05 	add	w5, w0, #0x6f
    2a04:	1101b800 	add	w0, w0, #0x6e
    2a08:	531f78a4 	lsl	w4, w5, #1
    2a0c:	937d7c84 	sbfiz	x4, x4, #3, #32
    2a10:	17ffff15 	b	2664 <_malloc_r+0x1f4>
    2a14:	f94008c7 	ldr	x7, [x6, #16]
    2a18:	b2400260 	orr	x0, x19, #0x1
    2a1c:	f90004c0 	str	x0, [x6, #8]
    2a20:	8b1300c4 	add	x4, x6, x19
    2a24:	91004285 	add	x5, x20, #0x10
    2a28:	b2400068 	orr	x8, x3, #0x1
    2a2c:	f9000ce1 	str	x1, [x7, #24]
    2a30:	910040d7 	add	x23, x6, #0x10
    2a34:	f9000827 	str	x7, [x1, #16]
    2a38:	aa1503e0 	mov	x0, x21
    2a3c:	a9021284 	stp	x4, x4, [x20, #32]
    2a40:	a9009488 	stp	x8, x5, [x4, #8]
    2a44:	f9000c85 	str	x5, [x4, #24]
    2a48:	f82268c3 	str	x3, [x6, x2]
    2a4c:	94000119 	bl	2eb0 <__malloc_unlock>
    2a50:	17ffff98 	b	28b0 <_malloc_r+0x440>
    2a54:	8b0200c2 	add	x2, x6, x2
    2a58:	aa0603f7 	mov	x23, x6
    2a5c:	aa1503e0 	mov	x0, x21
    2a60:	f9400443 	ldr	x3, [x2, #8]
    2a64:	f8410ee4 	ldr	x4, [x23, #16]!
    2a68:	b2400063 	orr	x3, x3, #0x1
    2a6c:	f9000443 	str	x3, [x2, #8]
    2a70:	f9000c81 	str	x1, [x4, #24]
    2a74:	f9000824 	str	x4, [x1, #16]
    2a78:	9400010e 	bl	2eb0 <__malloc_unlock>
    2a7c:	17ffff8d 	b	28b0 <_malloc_r+0x440>
    2a80:	d343fe65 	lsr	x5, x19, #3
    2a84:	110004a0 	add	w0, w5, #0x1
    2a88:	531f7800 	lsl	w0, w0, #1
    2a8c:	937d7c00 	sbfiz	x0, x0, #3, #32
    2a90:	17fffe87 	b	24ac <_malloc_r+0x3c>
    2a94:	8b130085 	add	x5, x4, x19
    2a98:	b2400273 	orr	x19, x19, #0x1
    2a9c:	f9000493 	str	x19, [x4, #8]
    2aa0:	b2400066 	orr	x6, x3, #0x1
    2aa4:	a9021685 	stp	x5, x5, [x20, #32]
    2aa8:	aa1503e0 	mov	x0, x21
    2aac:	91004097 	add	x23, x4, #0x10
    2ab0:	a90088a6 	stp	x6, x2, [x5, #8]
    2ab4:	f9000ca2 	str	x2, [x5, #24]
    2ab8:	f8216883 	str	x3, [x4, x1]
    2abc:	940000fd 	bl	2eb0 <__malloc_unlock>
    2ac0:	17ffff7c 	b	28b0 <_malloc_r+0x440>
    2ac4:	d346fc20 	lsr	x0, x1, #6
    2ac8:	1100e403 	add	w3, w0, #0x39
    2acc:	1100e002 	add	w2, w0, #0x38
    2ad0:	531f7863 	lsl	w3, w3, #1
    2ad4:	937d7c63 	sbfiz	x3, x3, #3, #32
    2ad8:	17ffffb3 	b	29a4 <_malloc_r+0x534>
    2adc:	11017005 	add	w5, w0, #0x5c
    2ae0:	11016c00 	add	w0, w0, #0x5b
    2ae4:	531f78a4 	lsl	w4, w5, #1
    2ae8:	937d7c84 	sbfiz	x4, x4, #3, #32
    2aec:	17fffede 	b	2664 <_malloc_r+0x1f4>
    2af0:	11000508 	add	w8, w8, #0x1
    2af4:	91008084 	add	x4, x4, #0x20
    2af8:	17fffeb2 	b	25c0 <_malloc_r+0x150>
    2afc:	f2402f5f 	tst	x26, #0xfff
    2b00:	54ffe321 	b.ne	2764 <_malloc_r+0x2f4>  // b.any
    2b04:	f9400a97 	ldr	x23, [x20, #16]
    2b08:	8b160316 	add	x22, x24, x22
    2b0c:	b24002d6 	orr	x22, x22, #0x1
    2b10:	f90006f6 	str	x22, [x23, #8]
    2b14:	17ffff43 	b	2820 <_malloc_r+0x3b0>
    2b18:	f907c779 	str	x25, [x27, #3976]
    2b1c:	17ffff18 	b	277c <_malloc_r+0x30c>
    2b20:	f9400a97 	ldr	x23, [x20, #16]
    2b24:	f94006f6 	ldr	x22, [x23, #8]
    2b28:	17ffff49 	b	284c <_malloc_r+0x3dc>
    2b2c:	f9400686 	ldr	x6, [x20, #8]
    2b30:	13027c42 	asr	w2, w2, #2
    2b34:	d2800021 	mov	x1, #0x1                   	// #1
    2b38:	9ac22021 	lsl	x1, x1, x2
    2b3c:	aa060021 	orr	x1, x1, x6
    2b40:	f9000681 	str	x1, [x20, #8]
    2b44:	17ffffa6 	b	29dc <_malloc_r+0x56c>
    2b48:	8b16033a 	add	x26, x25, x22
    2b4c:	aa1503e0 	mov	x0, x21
    2b50:	cb1a03fa 	neg	x26, x26
    2b54:	92402f5a 	and	x26, x26, #0xfff
    2b58:	aa1a03e1 	mov	x1, x26
    2b5c:	940000d9 	bl	2ec0 <_sbrk_r>
    2b60:	52800002 	mov	w2, #0x0                   	// #0
    2b64:	b100041f 	cmn	x0, #0x1
    2b68:	54ffe2c0 	b.eq	27c0 <_malloc_r+0x350>  // b.none
    2b6c:	cb190000 	sub	x0, x0, x25
    2b70:	2a1a03e2 	mov	w2, w26
    2b74:	8b1a0016 	add	x22, x0, x26
    2b78:	17ffff12 	b	27c0 <_malloc_r+0x350>
    2b7c:	d2800020 	mov	x0, #0x1                   	// #1
    2b80:	f9000720 	str	x0, [x25, #8]
    2b84:	aa1503e0 	mov	x0, x21
    2b88:	d2800017 	mov	x23, #0x0                   	// #0
    2b8c:	940000c9 	bl	2eb0 <__malloc_unlock>
    2b90:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2b94:	a94573fb 	ldp	x27, x28, [sp, #80]
    2b98:	17ffff46 	b	28b0 <_malloc_r+0x440>
    2b9c:	f101501f 	cmp	x0, #0x54
    2ba0:	54000228 	b.hi	2be4 <_malloc_r+0x774>  // b.pmore
    2ba4:	d34cfc20 	lsr	x0, x1, #12
    2ba8:	1101bc03 	add	w3, w0, #0x6f
    2bac:	1101b802 	add	w2, w0, #0x6e
    2bb0:	531f7863 	lsl	w3, w3, #1
    2bb4:	937d7c63 	sbfiz	x3, x3, #3, #32
    2bb8:	17ffff7b 	b	29a4 <_malloc_r+0x534>
    2bbc:	f105501f 	cmp	x0, #0x154
    2bc0:	54000228 	b.hi	2c04 <_malloc_r+0x794>  // b.pmore
    2bc4:	d34ffe60 	lsr	x0, x19, #15
    2bc8:	1101e005 	add	w5, w0, #0x78
    2bcc:	1101dc00 	add	w0, w0, #0x77
    2bd0:	531f78a4 	lsl	w4, w5, #1
    2bd4:	937d7c84 	sbfiz	x4, x4, #3, #32
    2bd8:	17fffea3 	b	2664 <_malloc_r+0x1f4>
    2bdc:	aa1903f7 	mov	x23, x25
    2be0:	17ffff10 	b	2820 <_malloc_r+0x3b0>
    2be4:	f105501f 	cmp	x0, #0x154
    2be8:	54000368 	b.hi	2c54 <_malloc_r+0x7e4>  // b.pmore
    2bec:	d34ffc20 	lsr	x0, x1, #15
    2bf0:	1101e003 	add	w3, w0, #0x78
    2bf4:	1101dc02 	add	w2, w0, #0x77
    2bf8:	531f7863 	lsl	w3, w3, #1
    2bfc:	937d7c63 	sbfiz	x3, x3, #3, #32
    2c00:	17ffff69 	b	29a4 <_malloc_r+0x534>
    2c04:	f115501f 	cmp	x0, #0x554
    2c08:	54000368 	b.hi	2c74 <_malloc_r+0x804>  // b.pmore
    2c0c:	d352fe60 	lsr	x0, x19, #18
    2c10:	1101f405 	add	w5, w0, #0x7d
    2c14:	1101f000 	add	w0, w0, #0x7c
    2c18:	531f78a4 	lsl	w4, w5, #1
    2c1c:	937d7c84 	sbfiz	x4, x4, #3, #32
    2c20:	17fffe91 	b	2664 <_malloc_r+0x1f4>
    2c24:	910042e1 	add	x1, x23, #0x10
    2c28:	aa1503e0 	mov	x0, x21
    2c2c:	94000125 	bl	30c0 <_free_r>
    2c30:	f9400a97 	ldr	x23, [x20, #16]
    2c34:	b9473381 	ldr	w1, [x28, #1840]
    2c38:	f94006f6 	ldr	x22, [x23, #8]
    2c3c:	17fffef9 	b	2820 <_malloc_r+0x3b0>
    2c40:	d100435a 	sub	x26, x26, #0x10
    2c44:	52800002 	mov	w2, #0x0                   	// #0
    2c48:	8b1a0376 	add	x22, x27, x26
    2c4c:	cb1902d6 	sub	x22, x22, x25
    2c50:	17fffedc 	b	27c0 <_malloc_r+0x350>
    2c54:	f115501f 	cmp	x0, #0x554
    2c58:	54000168 	b.hi	2c84 <_malloc_r+0x814>  // b.pmore
    2c5c:	d352fc20 	lsr	x0, x1, #18
    2c60:	1101f403 	add	w3, w0, #0x7d
    2c64:	1101f002 	add	w2, w0, #0x7c
    2c68:	531f7863 	lsl	w3, w3, #1
    2c6c:	937d7c63 	sbfiz	x3, x3, #3, #32
    2c70:	17ffff4d 	b	29a4 <_malloc_r+0x534>
    2c74:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    2c78:	52800fe5 	mov	w5, #0x7f                  	// #127
    2c7c:	52800fc0 	mov	w0, #0x7e                  	// #126
    2c80:	17fffe79 	b	2664 <_malloc_r+0x1f4>
    2c84:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    2c88:	52800fc2 	mov	w2, #0x7e                  	// #126
    2c8c:	17ffff46 	b	29a4 <_malloc_r+0x534>
    2c90:	f9400681 	ldr	x1, [x20, #8]
    2c94:	17fffe58 	b	25f4 <_malloc_r+0x184>
    2c98:	d503201f 	nop
    2c9c:	d503201f 	nop
    2ca0:	d503201f 	nop
    2ca4:	d503201f 	nop
    2ca8:	d503201f 	nop
    2cac:	d503201f 	nop
    2cb0:	d503201f 	nop
    2cb4:	d503201f 	nop
    2cb8:	d503201f 	nop
    2cbc:	d503201f 	nop

0000000000002cc0 <memset>:
    2cc0:	4e010c20 	dup	v0.16b, w1
    2cc4:	8b020004 	add	x4, x0, x2
    2cc8:	f101805f 	cmp	x2, #0x60
    2ccc:	540003c8 	b.hi	2d44 <memset+0x84>  // b.pmore
    2cd0:	f100405f 	cmp	x2, #0x10
    2cd4:	54000202 	b.cs	2d14 <memset+0x54>  // b.hs, b.nlast
    2cd8:	4e083c01 	mov	x1, v0.d[0]
    2cdc:	361800a2 	tbz	w2, #3, 2cf0 <memset+0x30>
    2ce0:	f9000001 	str	x1, [x0]
    2ce4:	f81f8081 	stur	x1, [x4, #-8]
    2ce8:	d65f03c0 	ret
    2cec:	d503201f 	nop
    2cf0:	36100082 	tbz	w2, #2, 2d00 <memset+0x40>
    2cf4:	b9000001 	str	w1, [x0]
    2cf8:	b81fc081 	stur	w1, [x4, #-4]
    2cfc:	d65f03c0 	ret
    2d00:	b4000082 	cbz	x2, 2d10 <memset+0x50>
    2d04:	39000001 	strb	w1, [x0]
    2d08:	36080042 	tbz	w2, #1, 2d10 <memset+0x50>
    2d0c:	781fe081 	sturh	w1, [x4, #-2]
    2d10:	d65f03c0 	ret
    2d14:	3d800000 	str	q0, [x0]
    2d18:	373000c2 	tbnz	w2, #6, 2d30 <memset+0x70>
    2d1c:	3c9f0080 	stur	q0, [x4, #-16]
    2d20:	36280062 	tbz	w2, #5, 2d2c <memset+0x6c>
    2d24:	3d800400 	str	q0, [x0, #16]
    2d28:	3c9e0080 	stur	q0, [x4, #-32]
    2d2c:	d65f03c0 	ret
    2d30:	3d800400 	str	q0, [x0, #16]
    2d34:	ad010000 	stp	q0, q0, [x0, #32]
    2d38:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2d3c:	d65f03c0 	ret
    2d40:	d503201f 	nop
    2d44:	12001c21 	and	w1, w1, #0xff
    2d48:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    2d4c:	3d800000 	str	q0, [x0]
    2d50:	f104005f 	cmp	x2, #0x100
    2d54:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    2d58:	54000180 	b.eq	2d88 <memset+0xc8>  // b.none
    2d5c:	cb030082 	sub	x2, x4, x3
    2d60:	d1004063 	sub	x3, x3, #0x10
    2d64:	d1014042 	sub	x2, x2, #0x50
    2d68:	ad010060 	stp	q0, q0, [x3, #32]
    2d6c:	ad820060 	stp	q0, q0, [x3, #64]!
    2d70:	f1010042 	subs	x2, x2, #0x40
    2d74:	54ffffa8 	b.hi	2d68 <memset+0xa8>  // b.pmore
    2d78:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2d7c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2d80:	d65f03c0 	ret
    2d84:	d503201f 	nop
    2d88:	d53b00e5 	mrs	x5, dczid_el0
    2d8c:	3727fe85 	tbnz	w5, #4, 2d5c <memset+0x9c>
    2d90:	12000ca5 	and	w5, w5, #0xf
    2d94:	710010bf 	cmp	w5, #0x4
    2d98:	54000281 	b.ne	2de8 <memset+0x128>  // b.any
    2d9c:	3d800460 	str	q0, [x3, #16]
    2da0:	ad010060 	stp	q0, q0, [x3, #32]
    2da4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    2da8:	ad020060 	stp	q0, q0, [x3, #64]
    2dac:	ad030060 	stp	q0, q0, [x3, #96]
    2db0:	cb030082 	sub	x2, x4, x3
    2db4:	d1040042 	sub	x2, x2, #0x100
    2db8:	91020063 	add	x3, x3, #0x80
    2dbc:	d503201f 	nop
    2dc0:	d50b7423 	dc	zva, x3
    2dc4:	91010063 	add	x3, x3, #0x40
    2dc8:	f1010042 	subs	x2, x2, #0x40
    2dcc:	54ffffa8 	b.hi	2dc0 <memset+0x100>  // b.pmore
    2dd0:	ad000060 	stp	q0, q0, [x3]
    2dd4:	ad010060 	stp	q0, q0, [x3, #32]
    2dd8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2ddc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2de0:	d65f03c0 	ret
    2de4:	d503201f 	nop
    2de8:	710014bf 	cmp	w5, #0x5
    2dec:	54000241 	b.ne	2e34 <memset+0x174>  // b.any
    2df0:	3d800460 	str	q0, [x3, #16]
    2df4:	ad010060 	stp	q0, q0, [x3, #32]
    2df8:	ad020060 	stp	q0, q0, [x3, #64]
    2dfc:	ad030060 	stp	q0, q0, [x3, #96]
    2e00:	9279e063 	and	x3, x3, #0xffffffffffffff80
    2e04:	cb030082 	sub	x2, x4, x3
    2e08:	d1040042 	sub	x2, x2, #0x100
    2e0c:	91020063 	add	x3, x3, #0x80
    2e10:	d50b7423 	dc	zva, x3
    2e14:	91020063 	add	x3, x3, #0x80
    2e18:	f1020042 	subs	x2, x2, #0x80
    2e1c:	54ffffa8 	b.hi	2e10 <memset+0x150>  // b.pmore
    2e20:	ad3c0080 	stp	q0, q0, [x4, #-128]
    2e24:	ad3d0080 	stp	q0, q0, [x4, #-96]
    2e28:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2e2c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2e30:	d65f03c0 	ret
    2e34:	52800086 	mov	w6, #0x4                   	// #4
    2e38:	1ac520c7 	lsl	w7, w6, w5
    2e3c:	910100e5 	add	x5, x7, #0x40
    2e40:	eb05005f 	cmp	x2, x5
    2e44:	54fff8c3 	b.cc	2d5c <memset+0x9c>  // b.lo, b.ul, b.last
    2e48:	d10004e6 	sub	x6, x7, #0x1
    2e4c:	8b070065 	add	x5, x3, x7
    2e50:	91004063 	add	x3, x3, #0x10
    2e54:	eb0300a2 	subs	x2, x5, x3
    2e58:	8a2600a5 	bic	x5, x5, x6
    2e5c:	540000a0 	b.eq	2e70 <memset+0x1b0>  // b.none
    2e60:	ac820060 	stp	q0, q0, [x3], #64
    2e64:	ad3f0060 	stp	q0, q0, [x3, #-32]
    2e68:	f1010042 	subs	x2, x2, #0x40
    2e6c:	54ffffa8 	b.hi	2e60 <memset+0x1a0>  // b.pmore
    2e70:	aa0503e3 	mov	x3, x5
    2e74:	cb050082 	sub	x2, x4, x5
    2e78:	eb070042 	subs	x2, x2, x7
    2e7c:	540000a3 	b.cc	2e90 <memset+0x1d0>  // b.lo, b.ul, b.last
    2e80:	d50b7423 	dc	zva, x3
    2e84:	8b070063 	add	x3, x3, x7
    2e88:	eb070042 	subs	x2, x2, x7
    2e8c:	54ffffa2 	b.cs	2e80 <memset+0x1c0>  // b.hs, b.nlast
    2e90:	8b070042 	add	x2, x2, x7
    2e94:	d1008063 	sub	x3, x3, #0x20
    2e98:	17ffffb6 	b	2d70 <memset+0xb0>
    2e9c:	d503201f 	nop

0000000000002ea0 <__malloc_lock>:
    2ea0:	d65f03c0 	ret
    2ea4:	d503201f 	nop
    2ea8:	d503201f 	nop
    2eac:	d503201f 	nop

0000000000002eb0 <__malloc_unlock>:
    2eb0:	d65f03c0 	ret
    2eb4:	d503201f 	nop
    2eb8:	d503201f 	nop
    2ebc:	d503201f 	nop

0000000000002ec0 <_sbrk_r>:
    2ec0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2ec4:	910003fd 	mov	x29, sp
    2ec8:	a90153f3 	stp	x19, x20, [sp, #16]
    2ecc:	d0000014 	adrp	x20, 4000 <impure_data+0x60>
    2ed0:	aa0003f3 	mov	x19, x0
    2ed4:	b907729f 	str	wzr, [x20, #1904]
    2ed8:	aa0103e0 	mov	x0, x1
    2edc:	97fffcf1 	bl	22a0 <_sbrk>
    2ee0:	b100041f 	cmn	x0, #0x1
    2ee4:	54000080 	b.eq	2ef4 <_sbrk_r+0x34>  // b.none
    2ee8:	a94153f3 	ldp	x19, x20, [sp, #16]
    2eec:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2ef0:	d65f03c0 	ret
    2ef4:	b9477281 	ldr	w1, [x20, #1904]
    2ef8:	34ffff81 	cbz	w1, 2ee8 <_sbrk_r+0x28>
    2efc:	b9000261 	str	w1, [x19]
    2f00:	a94153f3 	ldp	x19, x20, [sp, #16]
    2f04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2f08:	d65f03c0 	ret
    2f0c:	d503201f 	nop

0000000000002f10 <__register_exitproc>:
    2f10:	b0000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
    2f14:	f943a884 	ldr	x4, [x4, #1872]
    2f18:	f940fc85 	ldr	x5, [x4, #504]
    2f1c:	b4000405 	cbz	x5, 2f9c <__register_exitproc+0x8c>
    2f20:	b94008a4 	ldr	w4, [x5, #8]
    2f24:	71007c9f 	cmp	w4, #0x1f
    2f28:	5400040c 	b.gt	2fa8 <__register_exitproc+0x98>
    2f2c:	93407c86 	sxtw	x6, w4
    2f30:	350000e0 	cbnz	w0, 2f4c <__register_exitproc+0x3c>
    2f34:	910008c2 	add	x2, x6, #0x2
    2f38:	11000484 	add	w4, w4, #0x1
    2f3c:	b90008a4 	str	w4, [x5, #8]
    2f40:	52800000 	mov	w0, #0x0                   	// #0
    2f44:	f82278a1 	str	x1, [x5, x2, lsl #3]
    2f48:	d65f03c0 	ret
    2f4c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    2f50:	52800028 	mov	w8, #0x1                   	// #1
    2f54:	1ac42108 	lsl	w8, w8, w4
    2f58:	93407c86 	sxtw	x6, w4
    2f5c:	f90088e2 	str	x2, [x7, #272]
    2f60:	b94310a2 	ldr	w2, [x5, #784]
    2f64:	2a080042 	orr	w2, w2, w8
    2f68:	b90310a2 	str	w2, [x5, #784]
    2f6c:	f90108e3 	str	x3, [x7, #528]
    2f70:	7100081f 	cmp	w0, #0x2
    2f74:	54fffe01 	b.ne	2f34 <__register_exitproc+0x24>  // b.any
    2f78:	b94314a0 	ldr	w0, [x5, #788]
    2f7c:	910008c2 	add	x2, x6, #0x2
    2f80:	11000484 	add	w4, w4, #0x1
    2f84:	b90008a4 	str	w4, [x5, #8]
    2f88:	2a080008 	orr	w8, w0, w8
    2f8c:	b90314a8 	str	w8, [x5, #788]
    2f90:	52800000 	mov	w0, #0x0                   	// #0
    2f94:	f82278a1 	str	x1, [x5, x2, lsl #3]
    2f98:	17ffffec 	b	2f48 <__register_exitproc+0x38>
    2f9c:	91080085 	add	x5, x4, #0x200
    2fa0:	f900fc85 	str	x5, [x4, #504]
    2fa4:	17ffffdf 	b	2f20 <__register_exitproc+0x10>
    2fa8:	12800000 	mov	w0, #0xffffffff            	// #-1
    2fac:	d65f03c0 	ret

0000000000002fb0 <_malloc_trim_r>:
    2fb0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2fb4:	910003fd 	mov	x29, sp
    2fb8:	a9025bf5 	stp	x21, x22, [sp, #32]
    2fbc:	b0000016 	adrp	x22, 3000 <_malloc_trim_r+0x50>
    2fc0:	911de2d6 	add	x22, x22, #0x778
    2fc4:	aa0003f5 	mov	x21, x0
    2fc8:	a90153f3 	stp	x19, x20, [sp, #16]
    2fcc:	aa0103f3 	mov	x19, x1
    2fd0:	97ffffb4 	bl	2ea0 <__malloc_lock>
    2fd4:	f9400ac0 	ldr	x0, [x22, #16]
    2fd8:	f9400414 	ldr	x20, [x0, #8]
    2fdc:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    2fe0:	cb130293 	sub	x19, x20, x19
    2fe4:	913f7e73 	add	x19, x19, #0xfdf
    2fe8:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    2fec:	d1400673 	sub	x19, x19, #0x1, lsl #12
    2ff0:	f13ffe7f 	cmp	x19, #0xfff
    2ff4:	5400010d 	b.le	3014 <_malloc_trim_r+0x64>
    2ff8:	d2800001 	mov	x1, #0x0                   	// #0
    2ffc:	aa1503e0 	mov	x0, x21
    3000:	97ffffb0 	bl	2ec0 <_sbrk_r>
    3004:	f9400ac1 	ldr	x1, [x22, #16]
    3008:	8b140021 	add	x1, x1, x20
    300c:	eb01001f 	cmp	x0, x1
    3010:	54000100 	b.eq	3030 <_malloc_trim_r+0x80>  // b.none
    3014:	aa1503e0 	mov	x0, x21
    3018:	97ffffa6 	bl	2eb0 <__malloc_unlock>
    301c:	52800000 	mov	w0, #0x0                   	// #0
    3020:	a94153f3 	ldp	x19, x20, [sp, #16]
    3024:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3028:	a8c37bfd 	ldp	x29, x30, [sp], #48
    302c:	d65f03c0 	ret
    3030:	cb1303e1 	neg	x1, x19
    3034:	aa1503e0 	mov	x0, x21
    3038:	97ffffa2 	bl	2ec0 <_sbrk_r>
    303c:	b100041f 	cmn	x0, #0x1
    3040:	54000200 	b.eq	3080 <_malloc_trim_r+0xd0>  // b.none
    3044:	b0000002 	adrp	x2, 4000 <impure_data+0x60>
    3048:	cb130294 	sub	x20, x20, x19
    304c:	f9400ac3 	ldr	x3, [x22, #16]
    3050:	b2400294 	orr	x20, x20, #0x1
    3054:	b9473041 	ldr	w1, [x2, #1840]
    3058:	aa1503e0 	mov	x0, x21
    305c:	f9000474 	str	x20, [x3, #8]
    3060:	4b130033 	sub	w19, w1, w19
    3064:	b9073053 	str	w19, [x2, #1840]
    3068:	97ffff92 	bl	2eb0 <__malloc_unlock>
    306c:	52800020 	mov	w0, #0x1                   	// #1
    3070:	a94153f3 	ldp	x19, x20, [sp, #16]
    3074:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3078:	a8c37bfd 	ldp	x29, x30, [sp], #48
    307c:	d65f03c0 	ret
    3080:	d2800001 	mov	x1, #0x0                   	// #0
    3084:	aa1503e0 	mov	x0, x21
    3088:	97ffff8e 	bl	2ec0 <_sbrk_r>
    308c:	f9400ac2 	ldr	x2, [x22, #16]
    3090:	cb020001 	sub	x1, x0, x2
    3094:	f1007c3f 	cmp	x1, #0x1f
    3098:	54fffbed 	b.le	3014 <_malloc_trim_r+0x64>
    309c:	90000004 	adrp	x4, 3000 <_malloc_trim_r+0x50>
    30a0:	b2400021 	orr	x1, x1, #0x1
    30a4:	f9000441 	str	x1, [x2, #8]
    30a8:	b0000003 	adrp	x3, 4000 <impure_data+0x60>
    30ac:	f947c481 	ldr	x1, [x4, #3976]
    30b0:	cb010000 	sub	x0, x0, x1
    30b4:	b9073060 	str	w0, [x3, #1840]
    30b8:	17ffffd7 	b	3014 <_malloc_trim_r+0x64>
    30bc:	d503201f 	nop

00000000000030c0 <_free_r>:
    30c0:	b4000a21 	cbz	x1, 3204 <_free_r+0x144>
    30c4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    30c8:	910003fd 	mov	x29, sp
    30cc:	a90153f3 	stp	x19, x20, [sp, #16]
    30d0:	aa0103f3 	mov	x19, x1
    30d4:	aa0003f4 	mov	x20, x0
    30d8:	97ffff72 	bl	2ea0 <__malloc_lock>
    30dc:	f85f8265 	ldur	x5, [x19, #-8]
    30e0:	d1004263 	sub	x3, x19, #0x10
    30e4:	90000000 	adrp	x0, 3000 <_malloc_trim_r+0x50>
    30e8:	911de000 	add	x0, x0, #0x778
    30ec:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    30f0:	8b020064 	add	x4, x3, x2
    30f4:	f9400806 	ldr	x6, [x0, #16]
    30f8:	f9400481 	ldr	x1, [x4, #8]
    30fc:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    3100:	eb0400df 	cmp	x6, x4
    3104:	54000c60 	b.eq	3290 <_free_r+0x1d0>  // b.none
    3108:	f9000481 	str	x1, [x4, #8]
    310c:	8b010086 	add	x6, x4, x1
    3110:	37000345 	tbnz	w5, #0, 3178 <_free_r+0xb8>
    3114:	f85f0267 	ldur	x7, [x19, #-16]
    3118:	90000005 	adrp	x5, 3000 <_malloc_trim_r+0x50>
    311c:	f94004c6 	ldr	x6, [x6, #8]
    3120:	cb070063 	sub	x3, x3, x7
    3124:	8b070042 	add	x2, x2, x7
    3128:	911e20a5 	add	x5, x5, #0x788
    312c:	924000c6 	and	x6, x6, #0x1
    3130:	f9400867 	ldr	x7, [x3, #16]
    3134:	eb0500ff 	cmp	x7, x5
    3138:	54000940 	b.eq	3260 <_free_r+0x1a0>  // b.none
    313c:	f9400c68 	ldr	x8, [x3, #24]
    3140:	f9000ce8 	str	x8, [x7, #24]
    3144:	f9000907 	str	x7, [x8, #16]
    3148:	b50001c6 	cbnz	x6, 3180 <_free_r+0xc0>
    314c:	8b010042 	add	x2, x2, x1
    3150:	f9400881 	ldr	x1, [x4, #16]
    3154:	b2400046 	orr	x6, x2, #0x1
    3158:	eb05003f 	cmp	x1, x5
    315c:	54000ee0 	b.eq	3338 <_free_r+0x278>  // b.none
    3160:	f9400c84 	ldr	x4, [x4, #24]
    3164:	f9000c24 	str	x4, [x1, #24]
    3168:	f9000881 	str	x1, [x4, #16]
    316c:	f9000466 	str	x6, [x3, #8]
    3170:	f8226862 	str	x2, [x3, x2]
    3174:	14000006 	b	318c <_free_r+0xcc>
    3178:	f94004c5 	ldr	x5, [x6, #8]
    317c:	36000465 	tbz	w5, #0, 3208 <_free_r+0x148>
    3180:	b2400041 	orr	x1, x2, #0x1
    3184:	f9000461 	str	x1, [x3, #8]
    3188:	f9000082 	str	x2, [x4]
    318c:	f107fc5f 	cmp	x2, #0x1ff
    3190:	54000449 	b.ls	3218 <_free_r+0x158>  // b.plast
    3194:	d349fc41 	lsr	x1, x2, #9
    3198:	f127fc5f 	cmp	x2, #0x9ff
    319c:	54000a28 	b.hi	32e0 <_free_r+0x220>  // b.pmore
    31a0:	d346fc41 	lsr	x1, x2, #6
    31a4:	1100e424 	add	w4, w1, #0x39
    31a8:	1100e025 	add	w5, w1, #0x38
    31ac:	531f7884 	lsl	w4, w4, #1
    31b0:	937d7c84 	sbfiz	x4, x4, #3, #32
    31b4:	8b040004 	add	x4, x0, x4
    31b8:	f85f0481 	ldr	x1, [x4], #-16
    31bc:	eb01009f 	cmp	x4, x1
    31c0:	54000ae0 	b.eq	331c <_free_r+0x25c>  // b.none
    31c4:	d503201f 	nop
    31c8:	f9400420 	ldr	x0, [x1, #8]
    31cc:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    31d0:	eb02001f 	cmp	x0, x2
    31d4:	54000089 	b.ls	31e4 <_free_r+0x124>  // b.plast
    31d8:	f9400821 	ldr	x1, [x1, #16]
    31dc:	eb01009f 	cmp	x4, x1
    31e0:	54ffff41 	b.ne	31c8 <_free_r+0x108>  // b.any
    31e4:	f9400c24 	ldr	x4, [x1, #24]
    31e8:	a9011061 	stp	x1, x4, [x3, #16]
    31ec:	aa1403e0 	mov	x0, x20
    31f0:	f9000883 	str	x3, [x4, #16]
    31f4:	f9000c23 	str	x3, [x1, #24]
    31f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    31fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3200:	17ffff2c 	b	2eb0 <__malloc_unlock>
    3204:	d65f03c0 	ret
    3208:	90000005 	adrp	x5, 3000 <_malloc_trim_r+0x50>
    320c:	8b010042 	add	x2, x2, x1
    3210:	911e20a5 	add	x5, x5, #0x788
    3214:	17ffffcf 	b	3150 <_free_r+0x90>
    3218:	d343fc42 	lsr	x2, x2, #3
    321c:	d2800024 	mov	x4, #0x1                   	// #1
    3220:	11000441 	add	w1, w2, #0x1
    3224:	f9400405 	ldr	x5, [x0, #8]
    3228:	531f7821 	lsl	w1, w1, #1
    322c:	13027c42 	asr	w2, w2, #2
    3230:	8b21cc01 	add	x1, x0, w1, sxtw #3
    3234:	9ac22082 	lsl	x2, x4, x2
    3238:	aa050042 	orr	x2, x2, x5
    323c:	f9000402 	str	x2, [x0, #8]
    3240:	f85f0420 	ldr	x0, [x1], #-16
    3244:	a9010460 	stp	x0, x1, [x3, #16]
    3248:	f9000823 	str	x3, [x1, #16]
    324c:	f9000c03 	str	x3, [x0, #24]
    3250:	aa1403e0 	mov	x0, x20
    3254:	a94153f3 	ldp	x19, x20, [sp, #16]
    3258:	a8c27bfd 	ldp	x29, x30, [sp], #32
    325c:	17ffff15 	b	2eb0 <__malloc_unlock>
    3260:	b50009c6 	cbnz	x6, 3398 <_free_r+0x2d8>
    3264:	a9410085 	ldp	x5, x0, [x4, #16]
    3268:	8b020021 	add	x1, x1, x2
    326c:	f9000ca0 	str	x0, [x5, #24]
    3270:	b2400022 	orr	x2, x1, #0x1
    3274:	f9000805 	str	x5, [x0, #16]
    3278:	aa1403e0 	mov	x0, x20
    327c:	f9000462 	str	x2, [x3, #8]
    3280:	f8216861 	str	x1, [x3, x1]
    3284:	a94153f3 	ldp	x19, x20, [sp, #16]
    3288:	a8c27bfd 	ldp	x29, x30, [sp], #32
    328c:	17ffff09 	b	2eb0 <__malloc_unlock>
    3290:	8b010041 	add	x1, x2, x1
    3294:	370000e5 	tbnz	w5, #0, 32b0 <_free_r+0x1f0>
    3298:	f85f0262 	ldur	x2, [x19, #-16]
    329c:	cb020063 	sub	x3, x3, x2
    32a0:	8b020021 	add	x1, x1, x2
    32a4:	a9410864 	ldp	x4, x2, [x3, #16]
    32a8:	f9000c82 	str	x2, [x4, #24]
    32ac:	f9000844 	str	x4, [x2, #16]
    32b0:	90000002 	adrp	x2, 3000 <_malloc_trim_r+0x50>
    32b4:	b2400024 	orr	x4, x1, #0x1
    32b8:	f9000464 	str	x4, [x3, #8]
    32bc:	f947c842 	ldr	x2, [x2, #3984]
    32c0:	f9000803 	str	x3, [x0, #16]
    32c4:	eb01005f 	cmp	x2, x1
    32c8:	54fffc48 	b.hi	3250 <_free_r+0x190>  // b.pmore
    32cc:	b0000001 	adrp	x1, 4000 <impure_data+0x60>
    32d0:	aa1403e0 	mov	x0, x20
    32d4:	f943b421 	ldr	x1, [x1, #1896]
    32d8:	97ffff36 	bl	2fb0 <_malloc_trim_r>
    32dc:	17ffffdd 	b	3250 <_free_r+0x190>
    32e0:	f100503f 	cmp	x1, #0x14
    32e4:	54000129 	b.ls	3308 <_free_r+0x248>  // b.plast
    32e8:	f101503f 	cmp	x1, #0x54
    32ec:	54000308 	b.hi	334c <_free_r+0x28c>  // b.pmore
    32f0:	d34cfc41 	lsr	x1, x2, #12
    32f4:	1101bc24 	add	w4, w1, #0x6f
    32f8:	1101b825 	add	w5, w1, #0x6e
    32fc:	531f7884 	lsl	w4, w4, #1
    3300:	937d7c84 	sbfiz	x4, x4, #3, #32
    3304:	17ffffac 	b	31b4 <_free_r+0xf4>
    3308:	11017024 	add	w4, w1, #0x5c
    330c:	11016c25 	add	w5, w1, #0x5b
    3310:	531f7884 	lsl	w4, w4, #1
    3314:	937d7c84 	sbfiz	x4, x4, #3, #32
    3318:	17ffffa7 	b	31b4 <_free_r+0xf4>
    331c:	f9400406 	ldr	x6, [x0, #8]
    3320:	13027ca5 	asr	w5, w5, #2
    3324:	d2800022 	mov	x2, #0x1                   	// #1
    3328:	9ac52045 	lsl	x5, x2, x5
    332c:	aa0600a5 	orr	x5, x5, x6
    3330:	f9000405 	str	x5, [x0, #8]
    3334:	17ffffad 	b	31e8 <_free_r+0x128>
    3338:	a9020c03 	stp	x3, x3, [x0, #32]
    333c:	a9009466 	stp	x6, x5, [x3, #8]
    3340:	f9000c65 	str	x5, [x3, #24]
    3344:	f8226862 	str	x2, [x3, x2]
    3348:	17ffffc2 	b	3250 <_free_r+0x190>
    334c:	f105503f 	cmp	x1, #0x154
    3350:	540000e8 	b.hi	336c <_free_r+0x2ac>  // b.pmore
    3354:	d34ffc41 	lsr	x1, x2, #15
    3358:	1101e024 	add	w4, w1, #0x78
    335c:	1101dc25 	add	w5, w1, #0x77
    3360:	531f7884 	lsl	w4, w4, #1
    3364:	937d7c84 	sbfiz	x4, x4, #3, #32
    3368:	17ffff93 	b	31b4 <_free_r+0xf4>
    336c:	f115503f 	cmp	x1, #0x554
    3370:	540000e8 	b.hi	338c <_free_r+0x2cc>  // b.pmore
    3374:	d352fc41 	lsr	x1, x2, #18
    3378:	1101f424 	add	w4, w1, #0x7d
    337c:	1101f025 	add	w5, w1, #0x7c
    3380:	531f7884 	lsl	w4, w4, #1
    3384:	937d7c84 	sbfiz	x4, x4, #3, #32
    3388:	17ffff8b 	b	31b4 <_free_r+0xf4>
    338c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    3390:	52800fc5 	mov	w5, #0x7e                  	// #126
    3394:	17ffff88 	b	31b4 <_free_r+0xf4>
    3398:	b2400040 	orr	x0, x2, #0x1
    339c:	f9000460 	str	x0, [x3, #8]
    33a0:	f9000082 	str	x2, [x4]
    33a4:	17ffffab 	b	3250 <_free_r+0x190>
    33a8:	d503201f 	nop
    33ac:	d503201f 	nop

00000000000033b0 <cleanup_glue>:
    33b0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    33b4:	910003fd 	mov	x29, sp
    33b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    33bc:	f9400035 	ldr	x21, [x1]
    33c0:	a90153f3 	stp	x19, x20, [sp, #16]
    33c4:	aa0103f3 	mov	x19, x1
    33c8:	aa0003f4 	mov	x20, x0
    33cc:	b4000275 	cbz	x21, 3418 <cleanup_glue+0x68>
    33d0:	f94002b6 	ldr	x22, [x21]
    33d4:	b40001d6 	cbz	x22, 340c <cleanup_glue+0x5c>
    33d8:	f9001bf7 	str	x23, [sp, #48]
    33dc:	f94002d7 	ldr	x23, [x22]
    33e0:	b40000f7 	cbz	x23, 33fc <cleanup_glue+0x4c>
    33e4:	f94002e1 	ldr	x1, [x23]
    33e8:	b4000041 	cbz	x1, 33f0 <cleanup_glue+0x40>
    33ec:	97fffff1 	bl	33b0 <cleanup_glue>
    33f0:	aa1703e1 	mov	x1, x23
    33f4:	aa1403e0 	mov	x0, x20
    33f8:	97ffff32 	bl	30c0 <_free_r>
    33fc:	aa1603e1 	mov	x1, x22
    3400:	aa1403e0 	mov	x0, x20
    3404:	97ffff2f 	bl	30c0 <_free_r>
    3408:	f9401bf7 	ldr	x23, [sp, #48]
    340c:	aa1503e1 	mov	x1, x21
    3410:	aa1403e0 	mov	x0, x20
    3414:	97ffff2b 	bl	30c0 <_free_r>
    3418:	aa1303e1 	mov	x1, x19
    341c:	aa1403e0 	mov	x0, x20
    3420:	a94153f3 	ldp	x19, x20, [sp, #16]
    3424:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3428:	a8c47bfd 	ldp	x29, x30, [sp], #64
    342c:	17ffff25 	b	30c0 <_free_r>

0000000000003430 <_reclaim_reent>:
    3430:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3434:	90000001 	adrp	x1, 3000 <_malloc_trim_r+0x50>
    3438:	910003fd 	mov	x29, sp
    343c:	a90153f3 	stp	x19, x20, [sp, #16]
    3440:	aa0003f4 	mov	x20, x0
    3444:	f947cc20 	ldr	x0, [x1, #3992]
    3448:	eb14001f 	cmp	x0, x20
    344c:	54000500 	b.eq	34ec <_reclaim_reent+0xbc>  // b.none
    3450:	f9403e81 	ldr	x1, [x20, #120]
    3454:	f90013f5 	str	x21, [sp, #32]
    3458:	b40001e1 	cbz	x1, 3494 <_reclaim_reent+0x64>
    345c:	d2800015 	mov	x21, #0x0                   	// #0
    3460:	f8756833 	ldr	x19, [x1, x21]
    3464:	b40000f3 	cbz	x19, 3480 <_reclaim_reent+0x50>
    3468:	aa1303e1 	mov	x1, x19
    346c:	aa1403e0 	mov	x0, x20
    3470:	f9400273 	ldr	x19, [x19]
    3474:	97ffff13 	bl	30c0 <_free_r>
    3478:	b5ffff93 	cbnz	x19, 3468 <_reclaim_reent+0x38>
    347c:	f9403e81 	ldr	x1, [x20, #120]
    3480:	910022b5 	add	x21, x21, #0x8
    3484:	f10802bf 	cmp	x21, #0x200
    3488:	54fffec1 	b.ne	3460 <_reclaim_reent+0x30>  // b.any
    348c:	aa1403e0 	mov	x0, x20
    3490:	97ffff0c 	bl	30c0 <_free_r>
    3494:	f9403281 	ldr	x1, [x20, #96]
    3498:	b4000061 	cbz	x1, 34a4 <_reclaim_reent+0x74>
    349c:	aa1403e0 	mov	x0, x20
    34a0:	97ffff08 	bl	30c0 <_free_r>
    34a4:	f940fe93 	ldr	x19, [x20, #504]
    34a8:	b4000153 	cbz	x19, 34d0 <_reclaim_reent+0xa0>
    34ac:	91080295 	add	x21, x20, #0x200
    34b0:	eb15027f 	cmp	x19, x21
    34b4:	540000e0 	b.eq	34d0 <_reclaim_reent+0xa0>  // b.none
    34b8:	aa1303e1 	mov	x1, x19
    34bc:	aa1403e0 	mov	x0, x20
    34c0:	f9400273 	ldr	x19, [x19]
    34c4:	97fffeff 	bl	30c0 <_free_r>
    34c8:	eb1302bf 	cmp	x21, x19
    34cc:	54ffff61 	b.ne	34b8 <_reclaim_reent+0x88>  // b.any
    34d0:	f9404681 	ldr	x1, [x20, #136]
    34d4:	b4000061 	cbz	x1, 34e0 <_reclaim_reent+0xb0>
    34d8:	aa1403e0 	mov	x0, x20
    34dc:	97fffef9 	bl	30c0 <_free_r>
    34e0:	b9405280 	ldr	w0, [x20, #80]
    34e4:	350000a0 	cbnz	w0, 34f8 <_reclaim_reent+0xc8>
    34e8:	f94013f5 	ldr	x21, [sp, #32]
    34ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    34f0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    34f4:	d65f03c0 	ret
    34f8:	f9402e81 	ldr	x1, [x20, #88]
    34fc:	aa1403e0 	mov	x0, x20
    3500:	d63f0020 	blr	x1
    3504:	f9429293 	ldr	x19, [x20, #1312]
    3508:	b4ffff13 	cbz	x19, 34e8 <_reclaim_reent+0xb8>
    350c:	f9400261 	ldr	x1, [x19]
    3510:	b4000061 	cbz	x1, 351c <_reclaim_reent+0xec>
    3514:	aa1403e0 	mov	x0, x20
    3518:	97ffffa6 	bl	33b0 <cleanup_glue>
    351c:	aa1303e1 	mov	x1, x19
    3520:	aa1403e0 	mov	x0, x20
    3524:	a94153f3 	ldp	x19, x20, [sp, #16]
    3528:	f94013f5 	ldr	x21, [sp, #32]
    352c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3530:	17fffee4 	b	30c0 <_free_r>

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

0000000000003534 <_fini>:
    3534:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3538:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    353c:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    3540:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    3544:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    3548:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    354c:	a8c153f3 	ldp	x19, x20, [sp], #16
    3550:	a8c15bf5 	ldp	x21, x22, [sp], #16
    3554:	a8c163f7 	ldp	x23, x24, [sp], #16
    3558:	a8c16bf9 	ldp	x25, x26, [sp], #16
    355c:	a8c173fb 	ldp	x27, x28, [sp], #16
    3560:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3564:	d65f03c0 	ret
