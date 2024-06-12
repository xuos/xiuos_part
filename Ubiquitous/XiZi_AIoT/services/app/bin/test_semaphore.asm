
test_semaphore:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
    exit(0);
    return 0;
}

int main(int argc, char** argv)
{
       0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    printf("Test Semaphore.\n");
       4:	f0000000 	adrp	x0, 3000 <_sbrk_r>
       8:	911c0000 	add	x0, x0, #0x700
{
       c:	910003fd 	mov	x29, sp
      10:	a90153f3 	stp	x19, x20, [sp, #16]
    sem_id = semaphore_new(0);
      14:	f0000014 	adrp	x20, 3000 <_sbrk_r>
{
      18:	f90013f5 	str	x21, [sp, #32]
    printf("Test Semaphore.\n");
      1c:	94000741 	bl	1d20 <printf>
    sem_id = semaphore_new(0);
      20:	52800000 	mov	w0, #0x0                   	// #0
      24:	940008b3 	bl	22f0 <semaphore_new>
      28:	b9092280 	str	w0, [x20, #2336]
    if (sem_id < 0) {
      2c:	37f804a0 	tbnz	w0, #31, c0 <main+0xc0>
        exit(1);
    }

    sum = 0;

    nr_thds = NR_THREADS;
      30:	91248294 	add	x20, x20, #0x920
    char* params[] = { "do_cal", NULL };
      34:	f0000003 	adrp	x3, 3000 <_sbrk_r>
      38:	911ba063 	add	x3, x3, #0x6e8
    nr_thds = NR_THREADS;
      3c:	52800204 	mov	w4, #0x10                  	// #16
    sum = 0;
      40:	90000035 	adrp	x21, 4000 <__malloc_av_+0x6d8>
    if (nr_thds != 0) {
        int tid = thread(do_calculation, "test_sem_thd", params);
      44:	9100c3e2 	add	x2, sp, #0x30
        nr_thds--;
      48:	2a0403f3 	mov	w19, w4
        int tid = thread(do_calculation, "test_sem_thd", params);
      4c:	f0000001 	adrp	x1, 3000 <_sbrk_r>
    sum = 0;
      50:	b908d2bf 	str	wzr, [x21, #2256]
        int tid = thread(do_calculation, "test_sem_thd", params);
      54:	911bc021 	add	x1, x1, #0x6f0
      58:	90000000 	adrp	x0, 0 <main>
      5c:	91094000 	add	x0, x0, #0x250
    nr_thds = NR_THREADS;
      60:	b9000684 	str	w4, [x20, #4]
    char* params[] = { "do_cal", NULL };
      64:	a9037fe3 	stp	x3, xzr, [sp, #48]
        int tid = thread(do_calculation, "test_sem_thd", params);
      68:	94000822 	bl	20f0 <thread>
        nr_thds--;
      6c:	b9400680 	ldr	w0, [x20, #4]
      70:	51000400 	sub	w0, w0, #0x1
      74:	b9000680 	str	w0, [x20, #4]
    }

    for (int i = 0; i < NR_THREADS; i++) {
        semaphore_wait(sem_id);
      78:	b9400280 	ldr	w0, [x20]
      7c:	940008b1 	bl	2340 <semaphore_wait>
    for (int i = 0; i < NR_THREADS; i++) {
      80:	71000673 	subs	w19, w19, #0x1
      84:	54ffffa1 	b.ne	78 <main+0x78>  // b.any
    }

    printf("test thread sum after %d signal: 0x%x\n", NR_THREADS, sum);
      88:	b948d2a2 	ldr	w2, [x21, #2256]
      8c:	52800201 	mov	w1, #0x10                  	// #16
      90:	f0000000 	adrp	x0, 3000 <_sbrk_r>
      94:	911ce000 	add	x0, x0, #0x738
      98:	94000722 	bl	1d20 <printf>

    semaphore_free(sem_id);
      9c:	b9400280 	ldr	w0, [x20]
      a0:	9400089c 	bl	2310 <semaphore_free>
    exit(0);
      a4:	52800000 	mov	w0, #0x0                   	// #0
      a8:	9400081a 	bl	2110 <exit>
    return 0;
}
      ac:	52800000 	mov	w0, #0x0                   	// #0
      b0:	a94153f3 	ldp	x19, x20, [sp, #16]
      b4:	f94013f5 	ldr	x21, [sp, #32]
      b8:	a8c47bfd 	ldp	x29, x30, [sp], #64
      bc:	d65f03c0 	ret
        printf("new a kernel sem failed.\n");
      c0:	f0000000 	adrp	x0, 3000 <_sbrk_r>
      c4:	911c6000 	add	x0, x0, #0x718
      c8:	94000716 	bl	1d20 <printf>
        exit(1);
      cc:	52800020 	mov	w0, #0x1                   	// #1
      d0:	94000810 	bl	2110 <exit>
      d4:	17ffffd7 	b	30 <main+0x30>
      d8:	d503201f 	nop
      dc:	d503201f 	nop

00000000000000e0 <deregister_tm_clones>:
      e0:	90000020 	adrp	x0, 4000 <__malloc_av_+0x6d8>
      e4:	91226000 	add	x0, x0, #0x898
      e8:	90000021 	adrp	x1, 4000 <__malloc_av_+0x6d8>
      ec:	91226021 	add	x1, x1, #0x898
      f0:	eb00003f 	cmp	x1, x0
      f4:	540000c0 	b.eq	10c <deregister_tm_clones+0x2c>  // b.none
      f8:	f0000001 	adrp	x1, 3000 <_sbrk_r>
      fc:	f9435421 	ldr	x1, [x1, #1704]
     100:	b4000061 	cbz	x1, 10c <deregister_tm_clones+0x2c>
     104:	aa0103f0 	mov	x16, x1
     108:	d61f0200 	br	x16
     10c:	d65f03c0 	ret

0000000000000110 <register_tm_clones>:
     110:	90000020 	adrp	x0, 4000 <__malloc_av_+0x6d8>
     114:	91226000 	add	x0, x0, #0x898
     118:	90000021 	adrp	x1, 4000 <__malloc_av_+0x6d8>
     11c:	91226021 	add	x1, x1, #0x898
     120:	cb000021 	sub	x1, x1, x0
     124:	d37ffc22 	lsr	x2, x1, #63
     128:	8b810c41 	add	x1, x2, x1, asr #3
     12c:	9341fc21 	asr	x1, x1, #1
     130:	b40000c1 	cbz	x1, 148 <register_tm_clones+0x38>
     134:	f0000002 	adrp	x2, 3000 <_sbrk_r>
     138:	f9435842 	ldr	x2, [x2, #1712]
     13c:	b4000062 	cbz	x2, 148 <register_tm_clones+0x38>
     140:	aa0203f0 	mov	x16, x2
     144:	d61f0200 	br	x16
     148:	d65f03c0 	ret
     14c:	d503201f 	nop

0000000000000150 <__do_global_dtors_aux>:
     150:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     154:	910003fd 	mov	x29, sp
     158:	f9000bf3 	str	x19, [sp, #16]
     15c:	90000033 	adrp	x19, 4000 <__malloc_av_+0x6d8>
     160:	39626260 	ldrb	w0, [x19, #2200]
     164:	35000140 	cbnz	w0, 18c <__do_global_dtors_aux+0x3c>
     168:	97ffffde 	bl	e0 <deregister_tm_clones>
     16c:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     170:	f9435c00 	ldr	x0, [x0, #1720]
     174:	b4000080 	cbz	x0, 184 <__do_global_dtors_aux+0x34>
     178:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     17c:	91240000 	add	x0, x0, #0x900
     180:	d503201f 	nop
     184:	52800020 	mov	w0, #0x1                   	// #1
     188:	39226260 	strb	w0, [x19, #2200]
     18c:	f9400bf3 	ldr	x19, [sp, #16]
     190:	a8c27bfd 	ldp	x29, x30, [sp], #32
     194:	d65f03c0 	ret
     198:	d503201f 	nop
     19c:	d503201f 	nop

00000000000001a0 <frame_dummy>:
     1a0:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     1a4:	f9436000 	ldr	x0, [x0, #1728]
     1a8:	b4000140 	cbz	x0, 1d0 <frame_dummy+0x30>
     1ac:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     1b0:	90000021 	adrp	x1, 4000 <__malloc_av_+0x6d8>
     1b4:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     1b8:	910003fd 	mov	x29, sp
     1bc:	91228021 	add	x1, x1, #0x8a0
     1c0:	91240000 	add	x0, x0, #0x900
     1c4:	d503201f 	nop
     1c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
     1cc:	17ffffd1 	b	110 <register_tm_clones>
     1d0:	17ffffd0 	b	110 <register_tm_clones>
     1d4:	d503201f 	nop

00000000000001d8 <_mainCRTStartup>:
     1d8:	58000281 	ldr	x1, 228 <_cpu_init_hook+0x4>
     1dc:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     1e0:	9100001f 	mov	sp, x0
     1e4:	d280001d 	mov	x29, #0x0                   	// #0
     1e8:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     1ec:	910003fd 	mov	x29, sp
     1f0:	9400000d 	bl	224 <_cpu_init_hook>
     1f4:	580001e0 	ldr	x0, 230 <_cpu_init_hook+0xc>
     1f8:	52800001 	mov	w1, #0x0                   	// #0
     1fc:	580001e2 	ldr	x2, 238 <_cpu_init_hook+0x14>
     200:	cb000042 	sub	x2, x2, x0
     204:	94000aff 	bl	2e00 <memset>
     208:	580001c0 	ldr	x0, 240 <_cpu_init_hook+0x1c>
     20c:	940008a5 	bl	24a0 <atexit>
     210:	940008c0 	bl	2510 <__libc_init_array>
     214:	d2800000 	mov	x0, #0x0                   	// #0
     218:	d2800001 	mov	x1, #0x0                   	// #0
     21c:	97ffff79 	bl	0 <main>
     220:	140007bc 	b	2110 <exit>

0000000000000224 <_cpu_init_hook>:
     224:	d65f03c0 	ret
	...
     230:	00004898 	.word	0x00004898
     234:	00000000 	.word	0x00000000
     238:	00004928 	.word	0x00004928
     23c:	00000000 	.word	0x00000000
     240:	000024c0 	.word	0x000024c0
     244:	00000000 	.word	0x00000000
     248:	d503201f 	.word	0xd503201f
     24c:	d503201f 	.word	0xd503201f

0000000000000250 <do_calculation>:
{
     250:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
        sum++;
     254:	52a02003 	mov	w3, #0x1000000             	// #16777216
    printf("test semaphore thd signal.\n");
     258:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     25c:	911b2000 	add	x0, x0, #0x6c8
{
     260:	910003fd 	mov	x29, sp
     264:	90000022 	adrp	x2, 4000 <__malloc_av_+0x6d8>
        sum++;
     268:	b948d041 	ldr	w1, [x2, #2256]
{
     26c:	f9000bf3 	str	x19, [sp, #16]
        sum++;
     270:	0b030021 	add	w1, w1, w3
     274:	b908d041 	str	w1, [x2, #2256]
    printf("test semaphore thd signal.\n");
     278:	940006aa 	bl	1d20 <printf>
    semaphore_signal(sem_id);
     27c:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     280:	91248013 	add	x19, x0, #0x920
     284:	b9492000 	ldr	w0, [x0, #2336]
     288:	9400083a 	bl	2370 <semaphore_signal>
    if (nr_thds != 0) {
     28c:	b9400661 	ldr	w1, [x19, #4]
    char* params[] = { "do_cal", NULL };
     290:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     294:	911ba000 	add	x0, x0, #0x6e8
     298:	a9027fe0 	stp	x0, xzr, [sp, #32]
    if (nr_thds != 0) {
     29c:	350000e1 	cbnz	w1, 2b8 <do_calculation+0x68>
    exit(0);
     2a0:	52800000 	mov	w0, #0x0                   	// #0
     2a4:	9400079b 	bl	2110 <exit>
}
     2a8:	52800000 	mov	w0, #0x0                   	// #0
     2ac:	f9400bf3 	ldr	x19, [sp, #16]
     2b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
     2b4:	d65f03c0 	ret
        int tid = thread(do_calculation, "test_sem_thd", params);
     2b8:	910083e2 	add	x2, sp, #0x20
     2bc:	f0000001 	adrp	x1, 3000 <_sbrk_r>
     2c0:	90000000 	adrp	x0, 0 <main>
     2c4:	911bc021 	add	x1, x1, #0x6f0
     2c8:	91094000 	add	x0, x0, #0x250
     2cc:	94000789 	bl	20f0 <thread>
        nr_thds--;
     2d0:	b9400660 	ldr	w0, [x19, #4]
     2d4:	51000400 	sub	w0, w0, #0x1
     2d8:	b9000660 	str	w0, [x19, #4]
    exit(0);
     2dc:	52800000 	mov	w0, #0x0                   	// #0
     2e0:	9400078c 	bl	2110 <exit>
}
     2e4:	52800000 	mov	w0, #0x0                   	// #0
     2e8:	f9400bf3 	ldr	x19, [sp, #16]
     2ec:	a8c37bfd 	ldp	x29, x30, [sp], #48
     2f0:	d65f03c0 	ret
     2f4:	d503201f 	nop
     2f8:	d503201f 	nop
     2fc:	d503201f 	nop

0000000000000300 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     300:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     304:	52800020 	mov	w0, #0x1                   	// #1
{
     308:	910003fd 	mov	x29, sp
     30c:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     310:	90000033 	adrp	x19, 4000 <__malloc_av_+0x6d8>
     314:	b948d661 	ldr	w1, [x19, #2260]
     318:	34000081 	cbz	w1, 328 <init_uart_mmio+0x28>
}
     31c:	f9400bf3 	ldr	x19, [sp, #16]
     320:	a8c27bfd 	ldp	x29, x30, [sp], #32
     324:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     328:	2a0003e3 	mov	w3, w0
     32c:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     330:	52820002 	mov	w2, #0x1000                	// #4096
     334:	aa0103e0 	mov	x0, x1
     338:	940007de 	bl	22b0 <mmap>
     33c:	3100041f 	cmn	w0, #0x1
            return false;
     340:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     344:	54fffec0 	b.eq	31c <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     348:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     34c:	2a0103e0 	mov	w0, w1
        mapped = 1;
     350:	b908d661 	str	w1, [x19, #2260]
}
     354:	f9400bf3 	ldr	x19, [sp, #16]
     358:	a8c27bfd 	ldp	x29, x30, [sp], #32
     35c:	d65f03c0 	ret

0000000000000360 <putc>:

void putc(char ch)
{
     360:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     364:	7100281f 	cmp	w0, #0xa
     368:	540000c0 	b.eq	380 <putc+0x20>  // b.none
    return in_le32(addr);
     36c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     370:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     374:	362fffe1 	tbz	w1, #5, 370 <putc+0x10>
    out_le32(addr, value);
     378:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     37c:	d65f03c0 	ret
    return in_le32(addr);
     380:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     384:	d503201f 	nop
     388:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     38c:	362fffe1 	tbz	w1, #5, 388 <putc+0x28>
    out_le32(addr, value);
     390:	528001a1 	mov	w1, #0xd                   	// #13
     394:	b9000041 	str	w1, [x2]
}
     398:	17fffff5 	b	36c <putc+0xc>
     39c:	d503201f 	nop

00000000000003a0 <getc>:
    return in_le32(addr);
     3a0:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     3a4:	d503201f 	nop
     3a8:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     3ac:	3607ffe0 	tbz	w0, #0, 3a8 <getc+0x8>
    return in_le32(addr);
     3b0:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     3b4:	d65f03c0 	ret
     3b8:	d503201f 	nop
     3bc:	d503201f 	nop

00000000000003c0 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     3c0:	eb03005f 	cmp	x2, x3
{
     3c4:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     3c8:	54000042 	b.cs	3d0 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     3cc:	38226820 	strb	w0, [x1, x2]
    }
}
     3d0:	d65f03c0 	ret
     3d4:	d503201f 	nop
     3d8:	d503201f 	nop
     3dc:	d503201f 	nop

00000000000003e0 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     3e0:	d65f03c0 	ret
     3e4:	d503201f 	nop
     3e8:	d503201f 	nop
     3ec:	d503201f 	nop

00000000000003f0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     3f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     3f4:	910003fd 	mov	x29, sp
     3f8:	a90153f3 	stp	x19, x20, [sp, #16]
     3fc:	aa0503f3 	mov	x19, x5
     400:	aa0203f4 	mov	x20, x2
     404:	a9025bf5 	stp	x21, x22, [sp, #32]
     408:	aa0003f5 	mov	x21, x0
     40c:	aa0103f6 	mov	x22, x1
     410:	a90363f7 	stp	x23, x24, [sp, #48]
     414:	aa0203f7 	mov	x23, x2
     418:	aa0403f8 	mov	x24, x4
     41c:	a9046bf9 	stp	x25, x26, [sp, #64]
     420:	2a0703fa 	mov	w26, w7
     424:	2a0603f9 	mov	w25, w6
     428:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     42c:	f240075f 	tst	x26, #0x3
{
     430:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     434:	540001e1 	b.ne	470 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     438:	2a0603e0 	mov	w0, w6
     43c:	aa0203fc 	mov	x28, x2
     440:	cb050014 	sub	x20, x0, x5
     444:	eb0000bf 	cmp	x5, x0
     448:	8b020294 	add	x20, x20, x2
     44c:	54000542 	b.cs	4f4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     450:	aa1c03e2 	mov	x2, x28
     454:	aa1b03e3 	mov	x3, x27
     458:	9100079c 	add	x28, x28, #0x1
     45c:	aa1603e1 	mov	x1, x22
     460:	52800400 	mov	w0, #0x20                  	// #32
     464:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     468:	eb1c029f 	cmp	x20, x28
     46c:	54ffff21 	b.ne	450 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     470:	8b14027c 	add	x28, x19, x20
     474:	b4000133 	cbz	x19, 498 <_out_rev+0xa8>
     478:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     47c:	d1000673 	sub	x19, x19, #0x1
     480:	aa1c03f4 	mov	x20, x28
     484:	aa1b03e3 	mov	x3, x27
     488:	aa1603e1 	mov	x1, x22
     48c:	38736b00 	ldrb	w0, [x24, x19]
     490:	d63f02a0 	blr	x21
    while (len) {
     494:	b5ffff33 	cbnz	x19, 478 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     498:	360801fa 	tbz	w26, #1, 4d4 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     49c:	cb170297 	sub	x23, x20, x23
     4a0:	2a1903f9 	mov	w25, w25
     4a4:	eb1902ff 	cmp	x23, x25
     4a8:	54000162 	b.cs	4d4 <_out_rev+0xe4>  // b.hs, b.nlast
     4ac:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     4b0:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     4b4:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     4b8:	aa1b03e3 	mov	x3, x27
     4bc:	aa1603e1 	mov	x1, x22
     4c0:	52800400 	mov	w0, #0x20                  	// #32
     4c4:	d63f02a0 	blr	x21
     4c8:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     4cc:	eb1902ff 	cmp	x23, x25
     4d0:	54ffff03 	b.cc	4b0 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     4d4:	aa1403e0 	mov	x0, x20
     4d8:	a94153f3 	ldp	x19, x20, [sp, #16]
     4dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     4e0:	a94363f7 	ldp	x23, x24, [sp, #48]
     4e4:	a9446bf9 	ldp	x25, x26, [sp, #64]
     4e8:	a94573fb 	ldp	x27, x28, [sp, #80]
     4ec:	a8c67bfd 	ldp	x29, x30, [sp], #96
     4f0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     4f4:	aa0203f4 	mov	x20, x2
     4f8:	17ffffde 	b	470 <_out_rev+0x80>
     4fc:	d503201f 	nop

0000000000000500 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     500:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     504:	aa0603eb 	mov	x11, x6
     508:	aa0403e9 	mov	x9, x4
     50c:	910003fd 	mov	x29, sp
     510:	b9403be8 	ldr	w8, [sp, #56]
     514:	2a0703ef 	mov	w15, w7
     518:	b94033e6 	ldr	w6, [sp, #48]
     51c:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     520:	12160110 	and	w16, w8, #0x400
    if (!value) {
     524:	b5000c64 	cbnz	x4, 6b0 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     528:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     52c:	34000730 	cbz	w16, 610 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     530:	121f0111 	and	w17, w8, #0x2
     534:	37080fc8 	tbnz	w8, #1, 72c <_ntoa_long+0x22c>
    size_t len = 0U;
     538:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     53c:	2a0f03e9 	mov	w9, w15
     540:	f1007cbf 	cmp	x5, #0x1f
     544:	910043e4 	add	x4, sp, #0x10
     548:	1a9f87ea 	cset	w10, ls  // ls = plast
     54c:	eb05013f 	cmp	x9, x5
     550:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     554:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     558:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     55c:	350009c6 	cbnz	w6, 694 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     560:	34000108 	cbz	w8, 580 <_ntoa_long+0x80>
            buf[len++] = '0';
     564:	5280060a 	mov	w10, #0x30                  	// #48
     568:	910004a5 	add	x5, x5, #0x1
     56c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     570:	eb05013f 	cmp	x9, x5
     574:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     578:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     57c:	54ffff69 	b.ls	568 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     580:	340001cc 	cbz	w12, 5b8 <_ntoa_long+0xb8>
     584:	f1007cbf 	cmp	x5, #0x1f
     588:	1a9f87ea 	cset	w10, ls  // ls = plast
     58c:	7100015f 	cmp	w10, #0x0
     590:	2a0603e9 	mov	w9, w6
     594:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     598:	54000109 	b.ls	5b8 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     59c:	5280060a 	mov	w10, #0x30                  	// #48
     5a0:	910004a5 	add	x5, x5, #0x1
     5a4:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5a8:	eb05013f 	cmp	x9, x5
     5ac:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     5b0:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5b4:	54ffff69 	b.ls	5a0 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     5b8:	340001b1 	cbz	w17, 5ec <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     5bc:	350008b0 	cbnz	w16, 6d0 <_ntoa_long+0x1d0>
     5c0:	b50007e5 	cbnz	x5, 6bc <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5c4:	f100417f 	cmp	x11, #0x10
     5c8:	54000f20 	b.eq	7ac <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5cc:	f100097f 	cmp	x11, #0x2
     5d0:	54000f21 	b.ne	7b4 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     5d4:	52800c48 	mov	w8, #0x62                  	// #98
     5d8:	d2800025 	mov	x5, #0x1                   	// #1
     5dc:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     5e0:	52800608 	mov	w8, #0x30                  	// #48
     5e4:	38256888 	strb	w8, [x4, x5]
     5e8:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     5ec:	f10080bf 	cmp	x5, #0x20
     5f0:	540000a0 	b.eq	604 <_ntoa_long+0x104>  // b.none
        if (negative) {
     5f4:	340008d2 	cbz	w18, 70c <_ntoa_long+0x20c>
            buf[len++] = '-';
     5f8:	528005a8 	mov	w8, #0x2d                  	// #45
     5fc:	38256888 	strb	w8, [x4, x5]
     600:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     604:	97ffff7b 	bl	3f0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     608:	a8c37bfd 	ldp	x29, x30, [sp], #48
     60c:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     610:	52800011 	mov	w17, #0x0                   	// #0
     614:	f27b00ff 	tst	x7, #0x20
     618:	52800c24 	mov	w4, #0x61                  	// #97
     61c:	5280082e 	mov	w14, #0x41                  	// #65
     620:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     624:	510029ce 	sub	w14, w14, #0xa
     628:	910043e4 	add	x4, sp, #0x10
     62c:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     630:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     634:	910004a5 	add	x5, x5, #0x1
     638:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     63c:	9b0ba58a 	msub	x10, x12, x11, x9
     640:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     644:	f100255f 	cmp	x10, #0x9
     648:	1100c10a 	add	w10, w8, #0x30
     64c:	0b0e0108 	add	w8, w8, w14
     650:	12001d4a 	and	w10, w10, #0xff
     654:	12001d08 	and	w8, w8, #0xff
     658:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     65c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     660:	eb0b013f 	cmp	x9, x11
            value /= base;
     664:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     668:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     66c:	54fffe29 	b.ls	630 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     670:	370ffa47 	tbnz	w7, #1, 5b8 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     674:	f1007cbf 	cmp	x5, #0x1f
     678:	2a0f03e9 	mov	w9, w15
     67c:	1a9f87ea 	cset	w10, ls  // ls = plast
     680:	eb05013f 	cmp	x9, x5
     684:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     688:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     68c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     690:	34fff686 	cbz	w6, 560 <_ntoa_long+0x60>
     694:	3400048c 	cbz	w12, 724 <_ntoa_long+0x224>
     698:	35000072 	cbnz	w18, 6a4 <_ntoa_long+0x1a4>
     69c:	721e04ff 	tst	w7, #0xc
     6a0:	54000040 	b.eq	6a8 <_ntoa_long+0x1a8>  // b.none
            width--;
     6a4:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6a8:	35fff5e8 	cbnz	w8, 564 <_ntoa_long+0x64>
     6ac:	17ffffb8 	b	58c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     6b0:	121c0111 	and	w17, w8, #0x10
     6b4:	2a0803e7 	mov	w7, w8
     6b8:	17ffffd7 	b	614 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     6bc:	eb2f40bf 	cmp	x5, w15, uxtw
     6c0:	54000480 	b.eq	750 <_ntoa_long+0x250>  // b.none
     6c4:	eb2640bf 	cmp	x5, w6, uxtw
     6c8:	54000440 	b.eq	750 <_ntoa_long+0x250>  // b.none
     6cc:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6d0:	f1007cbf 	cmp	x5, #0x1f
     6d4:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6d8:	f100417f 	cmp	x11, #0x10
     6dc:	54000480 	b.eq	76c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6e0:	7100011f 	cmp	w8, #0x0
     6e4:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     6e8:	54000081 	b.ne	6f8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     6ec:	52800c48 	mov	w8, #0x62                  	// #98
     6f0:	38256888 	strb	w8, [x4, x5]
     6f4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     6f8:	f10080bf 	cmp	x5, #0x20
     6fc:	54fff721 	b.ne	5e0 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     700:	97ffff3c 	bl	3f0 <_out_rev>
}
     704:	a8c37bfd 	ldp	x29, x30, [sp], #48
     708:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     70c:	37100167 	tbnz	w7, #2, 738 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     710:	361ff7a7 	tbz	w7, #3, 604 <_ntoa_long+0x104>
            buf[len++] = ' ';
     714:	52800408 	mov	w8, #0x20                  	// #32
     718:	38256888 	strb	w8, [x4, x5]
     71c:	910004a5 	add	x5, x5, #0x1
     720:	17ffffb9 	b	604 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     724:	35fff208 	cbnz	w8, 564 <_ntoa_long+0x64>
     728:	17ffffa4 	b	5b8 <_ntoa_long+0xb8>
     72c:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     730:	d2800005 	mov	x5, #0x0                   	// #0
     734:	17ffffb0 	b	5f4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     738:	52800568 	mov	w8, #0x2b                  	// #43
     73c:	38256888 	strb	w8, [x4, x5]
     740:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     744:	97ffff2b 	bl	3f0 <_out_rev>
}
     748:	a8c37bfd 	ldp	x29, x30, [sp], #48
     74c:	d65f03c0 	ret
            if (len && (base == 16U)) {
     750:	f10004aa 	subs	x10, x5, #0x1
                len--;
     754:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     758:	1a9f07e8 	cset	w8, ne  // ne = any
     75c:	7100417f 	cmp	w11, #0x10
     760:	1a9f17e9 	cset	w9, eq  // eq = none
     764:	6a090108 	ands	w8, w8, w9
     768:	54000160 	b.eq	794 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     76c:	721b00e9 	ands	w9, w7, #0x20
     770:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     774:	54000141 	b.ne	79c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     778:	7100013f 	cmp	w9, #0x0
     77c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     780:	54fffbc0 	b.eq	6f8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     784:	52800b08 	mov	w8, #0x58                  	// #88
     788:	38256888 	strb	w8, [x4, x5]
     78c:	910004a5 	add	x5, x5, #0x1
     790:	17ffffda 	b	6f8 <_ntoa_long+0x1f8>
            len--;
     794:	aa0a03e5 	mov	x5, x10
     798:	17ffffce 	b	6d0 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     79c:	52800f08 	mov	w8, #0x78                  	// #120
     7a0:	38256888 	strb	w8, [x4, x5]
     7a4:	910004a5 	add	x5, x5, #0x1
     7a8:	17ffffd4 	b	6f8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     7ac:	52800028 	mov	w8, #0x1                   	// #1
     7b0:	17ffffef 	b	76c <_ntoa_long+0x26c>
            buf[len++] = '0';
     7b4:	52800608 	mov	w8, #0x30                  	// #48
     7b8:	d2800025 	mov	x5, #0x1                   	// #1
     7bc:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     7c0:	17ffff8d 	b	5f4 <_ntoa_long+0xf4>
     7c4:	d503201f 	nop
     7c8:	d503201f 	nop
     7cc:	d503201f 	nop

00000000000007d0 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     7d0:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     7d4:	1e602000 	fcmp	d0, d0
{
     7d8:	a9017bfd 	stp	x29, x30, [sp, #16]
     7dc:	910043fd 	add	x29, sp, #0x10
     7e0:	a90253f3 	stp	x19, x20, [sp, #32]
     7e4:	aa0203f3 	mov	x19, x2
     7e8:	2a0603f4 	mov	w20, w6
     7ec:	a9035bf5 	stp	x21, x22, [sp, #48]
     7f0:	2a0503f6 	mov	w22, w5
     7f4:	a90463f7 	stp	x23, x24, [sp, #64]
     7f8:	aa0003f7 	mov	x23, x0
     7fc:	a9056bf9 	stp	x25, x26, [sp, #80]
     800:	aa0103f9 	mov	x25, x1
     804:	a90673fb 	stp	x27, x28, [sp, #96]
     808:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     80c:	54001361 	b.ne	a78 <_etoa+0x2a8>  // b.any
     810:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     814:	9e670001 	fmov	d1, x0
     818:	1e612010 	fcmpe	d0, d1
     81c:	540012ec 	b.gt	a78 <_etoa+0x2a8>
     820:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     824:	9e670001 	fmov	d1, x0
     828:	1e612010 	fcmpe	d0, d1
     82c:	54001264 	b.mi	a78 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     830:	1e602018 	fcmpe	d0, #0.0
     834:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     838:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     83c:	fd444817 	ldr	d23, [x0, #2192]
     840:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     844:	fd444c01 	ldr	d1, [x0, #2200]
     848:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     84c:	fd445016 	ldr	d22, [x0, #2208]
     850:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     854:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     858:	fd445406 	ldr	d6, [x0, #2216]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     85c:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     860:	fd445815 	ldr	d21, [x0, #2224]
     864:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     868:	fd445c14 	ldr	d20, [x0, #2232]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     86c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     870:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     874:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     878:	1e659002 	fmov	d2, #1.400000000000000000e+01
     87c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     880:	1e631013 	fmov	d19, #6.000000000000000000e+00
     884:	1e601010 	fmov	d16, #2.000000000000000000e+00
     888:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     88c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     890:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     894:	d374f821 	ubfx	x1, x1, #52, #11
     898:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     89c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     8a0:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     8a4:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     8a8:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     8ac:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     8b0:	1e7838a5 	fsub	d5, d5, d24
     8b4:	1e770884 	fmul	d4, d4, d23
     8b8:	1e7608a5 	fmul	d5, d5, d22
     8bc:	1e612884 	fadd	d4, d4, d1
     8c0:	1e652884 	fadd	d4, d4, d5
     8c4:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     8c8:	1e620301 	scvtf	d1, w24
     8cc:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8d0:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     8d4:	1e632884 	fadd	d4, d4, d3
     8d8:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8dc:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     8e0:	110ffc00 	add	w0, w0, #0x3ff
     8e4:	9e670004 	fmov	d4, x0
     8e8:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     8ec:	1e740863 	fmul	d3, d3, d20
     8f0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     8f4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     8f8:	1e613a05 	fsub	d5, d16, d1
     8fc:	1e612821 	fadd	d1, d1, d1
     900:	1e621862 	fdiv	d2, d3, d2
     904:	1e712842 	fadd	d2, d2, d17
     908:	1e621862 	fdiv	d2, d3, d2
     90c:	1e732842 	fadd	d2, d2, d19
     910:	1e621863 	fdiv	d3, d3, d2
     914:	1e652863 	fadd	d3, d3, d5
     918:	1e631821 	fdiv	d1, d1, d3
     91c:	1e722821 	fadd	d1, d1, d18
     920:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     924:	1e672030 	fcmpe	d1, d7
     928:	54000c4c 	b.gt	ab0 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     92c:	11018f00 	add	w0, w24, #0x63
     930:	7103181f 	cmp	w0, #0xc6
     934:	1a9f97fc 	cset	w28, hi  // hi = pmore
     938:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     93c:	36580134 	tbz	w20, #11, 960 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     940:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     944:	fd446002 	ldr	d2, [x0, #2240]
     948:	1e6220f0 	fcmpe	d7, d2
     94c:	54000d2a 	b.ge	af0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     950:	34000084 	cbz	w4, 960 <_etoa+0x190>
                --prec;
     954:	7100007f 	cmp	w3, #0x0
     958:	1a9f07e0 	cset	w0, ne  // ne = any
     95c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     960:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     964:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     968:	4b1c02c5 	sub	w5, w22, w28
     96c:	5280003a 	mov	w26, #0x1                   	// #1
     970:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     974:	7100001f 	cmp	w0, #0x0
     978:	1a9f07e0 	cset	w0, ne  // ne = any
     97c:	b9007fe0 	str	w0, [sp, #124]
     980:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     984:	34000058 	cbz	w24, 98c <_etoa+0x1bc>
        value /= conv.F;
     988:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     98c:	1e602018 	fcmpe	d0, #0.0
     990:	54000ac4 	b.mi	ae8 <_etoa+0x318>  // b.first
     994:	1e6040e0 	fmov	d0, d7
     998:	12147a86 	and	w6, w20, #0xfffff7ff
     99c:	aa1b03e3 	mov	x3, x27
     9a0:	aa1303e2 	mov	x2, x19
     9a4:	aa1903e1 	mov	x1, x25
     9a8:	aa1703e0 	mov	x0, x23
     9ac:	94000071 	bl	b70 <_ftoa>
     9b0:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     9b4:	3400051a 	cbz	w26, a54 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     9b8:	f27b029f 	tst	x20, #0x20
     9bc:	528008a1 	mov	w1, #0x45                  	// #69
     9c0:	aa1503e2 	mov	x2, x21
     9c4:	aa1b03e3 	mov	x3, x27
     9c8:	52800ca0 	mov	w0, #0x65                  	// #101
     9cc:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     9d0:	aa1903e1 	mov	x1, x25
     9d4:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     9d8:	7100031f 	cmp	w24, #0x0
     9dc:	528000a0 	mov	w0, #0x5                   	// #5
     9e0:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     9e4:	5100079c 	sub	w28, w28, #0x1
     9e8:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     9ec:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     9f0:	b9000be0 	str	w0, [sp, #8]
     9f4:	93407c84 	sxtw	x4, w4
     9f8:	531f7f05 	lsr	w5, w24, #31
     9fc:	aa1b03e3 	mov	x3, x27
     a00:	aa1903e1 	mov	x1, x25
     a04:	aa1703e0 	mov	x0, x23
     a08:	52800007 	mov	w7, #0x0                   	// #0
     a0c:	d2800146 	mov	x6, #0xa                   	// #10
     a10:	97fffebc 	bl	500 <_ntoa_long>
     a14:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     a18:	b9407fe0 	ldr	w0, [sp, #124]
     a1c:	340001c0 	cbz	w0, a54 <_etoa+0x284>
            while (idx - start_idx < width)
     a20:	cb1302b3 	sub	x19, x21, x19
     a24:	eb1302df 	cmp	x22, x19
     a28:	54000169 	b.ls	a54 <_etoa+0x284>  // b.plast
     a2c:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     a30:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     a34:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     a38:	aa1b03e3 	mov	x3, x27
     a3c:	aa1903e1 	mov	x1, x25
     a40:	52800400 	mov	w0, #0x20                  	// #32
     a44:	d63f02e0 	blr	x23
     a48:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     a4c:	eb1302df 	cmp	x22, x19
     a50:	54ffff08 	b.hi	a30 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     a54:	aa1503e0 	mov	x0, x21
     a58:	a9417bfd 	ldp	x29, x30, [sp, #16]
     a5c:	a94253f3 	ldp	x19, x20, [sp, #32]
     a60:	a9435bf5 	ldp	x21, x22, [sp, #48]
     a64:	a94463f7 	ldp	x23, x24, [sp, #64]
     a68:	a9456bf9 	ldp	x25, x26, [sp, #80]
     a6c:	a94673fb 	ldp	x27, x28, [sp, #96]
     a70:	910203ff 	add	sp, sp, #0x80
     a74:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     a78:	2a1403e6 	mov	w6, w20
     a7c:	2a1603e5 	mov	w5, w22
     a80:	aa1b03e3 	mov	x3, x27
     a84:	aa1303e2 	mov	x2, x19
     a88:	aa1903e1 	mov	x1, x25
     a8c:	aa1703e0 	mov	x0, x23
}
     a90:	a9417bfd 	ldp	x29, x30, [sp, #16]
     a94:	a94253f3 	ldp	x19, x20, [sp, #32]
     a98:	a9435bf5 	ldp	x21, x22, [sp, #48]
     a9c:	a94463f7 	ldp	x23, x24, [sp, #64]
     aa0:	a9456bf9 	ldp	x25, x26, [sp, #80]
     aa4:	a94673fb 	ldp	x27, x28, [sp, #96]
     aa8:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     aac:	14000031 	b	b70 <_ftoa>
        conv.F /= 10;
     ab0:	1e711821 	fdiv	d1, d1, d17
        expval--;
     ab4:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     ab8:	11018f00 	add	w0, w24, #0x63
     abc:	7103181f 	cmp	w0, #0xc6
     ac0:	1a9f97fc 	cset	w28, hi  // hi = pmore
     ac4:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     ac8:	365ff4d4 	tbz	w20, #11, 960 <_etoa+0x190>
     acc:	17ffff9d 	b	940 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     ad0:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     ad4:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     ad8:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     adc:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     ae0:	5280001a 	mov	w26, #0x0                   	// #0
     ae4:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     ae8:	1e6140e7 	fneg	d7, d7
     aec:	17ffffaa 	b	994 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     af0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     af4:	f2e825c0 	movk	x0, #0x412e, lsl #48
     af8:	9e670002 	fmov	d2, x0
     afc:	1e6220f0 	fcmpe	d7, d2
     b00:	54000044 	b.mi	b08 <_etoa+0x338>  // b.first
     b04:	17ffff93 	b	950 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     b08:	6b180080 	subs	w0, w4, w24
     b0c:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     b10:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     b14:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     b18:	35000196 	cbnz	w22, b48 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     b1c:	1e602018 	fcmpe	d0, #0.0
     b20:	54fffd84 	b.mi	ad0 <_etoa+0x300>  // b.first
     b24:	12147a86 	and	w6, w20, #0xfffff7ff
     b28:	1e6040e0 	fmov	d0, d7
     b2c:	321600c6 	orr	w6, w6, #0x400
     b30:	aa1b03e3 	mov	x3, x27
     b34:	aa1303e2 	mov	x2, x19
     b38:	aa1903e1 	mov	x1, x25
     b3c:	aa1703e0 	mov	x0, x23
     b40:	52800005 	mov	w5, #0x0                   	// #0
     b44:	17ffffd3 	b	a90 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     b48:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     b4c:	2a1603e5 	mov	w5, w22
     b50:	5280001a 	mov	w26, #0x0                   	// #0
     b54:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     b58:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     b5c:	b9007fff 	str	wzr, [sp, #124]
     b60:	17ffff8b 	b	98c <_etoa+0x1bc>
     b64:	d503201f 	nop
     b68:	d503201f 	nop
     b6c:	d503201f 	nop

0000000000000b70 <_ftoa>:
    if (value != value)
     b70:	1e602000 	fcmp	d0, d0
{
     b74:	2a0603e7 	mov	w7, w6
    if (value != value)
     b78:	54000e01 	b.ne	d38 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     b7c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     b80:	9e6700c1 	fmov	d1, x6
     b84:	1e612010 	fcmpe	d0, d1
     b88:	54001184 	b.mi	db8 <_ftoa+0x248>  // b.first
     b8c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     b90:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     b94:	9e670001 	fmov	d1, x0
     b98:	aa0103f0 	mov	x16, x1
     b9c:	aa0203f1 	mov	x17, x2
     ba0:	aa0303f2 	mov	x18, x3
     ba4:	1e612010 	fcmpe	d0, d1
     ba8:	54000b2c 	b.gt	d0c <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     bac:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     bb0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     bb4:	9e670001 	fmov	d1, x0
     bb8:	1e612010 	fcmpe	d0, d1
     bbc:	54000f2c 	b.gt	da0 <_ftoa+0x230>
     bc0:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     bc4:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     bc8:	9e670001 	fmov	d1, x0
     bcc:	1e612010 	fcmpe	d0, d1
     bd0:	54000e84 	b.mi	da0 <_ftoa+0x230>  // b.first
    if (value < 0) {
     bd4:	1e602018 	fcmpe	d0, #0.0
{
     bd8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     bdc:	910003fd 	mov	x29, sp
    if (value < 0) {
     be0:	54000ca4 	b.mi	d74 <_ftoa+0x204>  // b.first
    bool negative = false;
     be4:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     be8:	36500ce7 	tbz	w7, #10, d84 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     bec:	7100249f 	cmp	w4, #0x9
     bf0:	910043ec 	add	x12, sp, #0x10
     bf4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     bf8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     bfc:	54001929 	b.ls	f20 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     c00:	91000508 	add	x8, x8, #0x1
        prec--;
     c04:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     c08:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     c0c:	f1007d1f 	cmp	x8, #0x1f
     c10:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     c14:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     c18:	54ffff48 	b.hi	c00 <_ftoa+0x90>  // b.pmore
     c1c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     c20:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     c24:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     c28:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     c2c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     c30:	1e620141 	scvtf	d1, w10
     c34:	1e613801 	fsub	d1, d0, d1
     c38:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     c3c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     c40:	9e6301c4 	ucvtf	d4, x14
     c44:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     c48:	1e632030 	fcmpe	d1, d3
     c4c:	5400112c 	b.gt	e70 <_ftoa+0x300>
    } else if (diff < 0.5) {
     c50:	54000084 	b.mi	c60 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     c54:	b500154e 	cbnz	x14, efc <_ftoa+0x38c>
        ++frac;
     c58:	910005ce 	add	x14, x14, #0x1
     c5c:	d503201f 	nop
    if (prec == 0U) {
     c60:	35000b64 	cbnz	w4, dcc <_ftoa+0x25c>
        diff = value - (double)whole;
     c64:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     c68:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     c6c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     c70:	1e622010 	fcmpe	d0, d2
     c74:	540011a4 	b.mi	ea8 <_ftoa+0x338>  // b.first
            ++whole;
     c78:	12000140 	and	w0, w10, #0x1
     c7c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     c80:	528ccce1 	mov	w1, #0x6667                	// #26215
     c84:	72acccc1 	movk	w1, #0x6666, lsl #16
     c88:	52800142 	mov	w2, #0xa                   	// #10
     c8c:	d503201f 	nop
     c90:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     c94:	f100811f 	cmp	x8, #0x20
     c98:	54000c20 	b.eq	e1c <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     c9c:	9362fd29 	asr	x9, x9, #34
     ca0:	91000508 	add	x8, x8, #0x1
     ca4:	4b8a7d29 	sub	w9, w9, w10, asr #31
     ca8:	8b080180 	add	x0, x12, x8
     cac:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     cb0:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     cb4:	1100c169 	add	w9, w11, #0x30
     cb8:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     cbc:	35fffeaa 	cbnz	w10, c90 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     cc0:	120004e0 	and	w0, w7, #0x3
     cc4:	7100041f 	cmp	w0, #0x1
     cc8:	54000b00 	b.eq	e28 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     ccc:	f1007d1f 	cmp	x8, #0x1f
     cd0:	540000a8 	b.hi	ce4 <_ftoa+0x174>  // b.pmore
        if (negative) {
     cd4:	34000de3 	cbz	w3, e90 <_ftoa+0x320>
            buf[len++] = '-';
     cd8:	528005a0 	mov	w0, #0x2d                  	// #45
     cdc:	38286980 	strb	w0, [x12, x8]
     ce0:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     ce4:	2a0503e6 	mov	w6, w5
     ce8:	aa0c03e4 	mov	x4, x12
     cec:	aa0803e5 	mov	x5, x8
     cf0:	aa1203e3 	mov	x3, x18
     cf4:	aa1103e2 	mov	x2, x17
     cf8:	aa1003e1 	mov	x1, x16
     cfc:	aa0f03e0 	mov	x0, x15
     d00:	97fffdbc 	bl	3f0 <_out_rev>
}
     d04:	a8c37bfd 	ldp	x29, x30, [sp], #48
     d08:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     d0c:	37100207 	tbnz	w7, #2, d4c <_ftoa+0x1dc>
     d10:	d2800060 	mov	x0, #0x3                   	// #3
     d14:	2a0503e6 	mov	w6, w5
     d18:	f0000004 	adrp	x4, 3000 <_sbrk_r>
     d1c:	911d8084 	add	x4, x4, #0x760
     d20:	aa0003e5 	mov	x5, x0
     d24:	aa1203e3 	mov	x3, x18
     d28:	aa1103e2 	mov	x2, x17
     d2c:	aa1003e1 	mov	x1, x16
     d30:	aa0f03e0 	mov	x0, x15
     d34:	17fffdaf 	b	3f0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     d38:	2a0503e6 	mov	w6, w5
     d3c:	f0000004 	adrp	x4, 3000 <_sbrk_r>
     d40:	d2800065 	mov	x5, #0x3                   	// #3
     d44:	911dc084 	add	x4, x4, #0x770
     d48:	17fffdaa 	b	3f0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     d4c:	d2800080 	mov	x0, #0x4                   	// #4
     d50:	2a0503e6 	mov	w6, w5
     d54:	f0000004 	adrp	x4, 3000 <_sbrk_r>
     d58:	911da084 	add	x4, x4, #0x768
     d5c:	aa0003e5 	mov	x5, x0
     d60:	aa1203e3 	mov	x3, x18
     d64:	aa1103e2 	mov	x2, x17
     d68:	aa1003e1 	mov	x1, x16
     d6c:	aa0f03e0 	mov	x0, x15
     d70:	17fffda0 	b	3f0 <_out_rev>
        value = 0 - value;
     d74:	2f00e401 	movi	d1, #0x0
        negative = true;
     d78:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     d7c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     d80:	3757f367 	tbnz	w7, #10, bec <_ftoa+0x7c>
     d84:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     d88:	910043ec 	add	x12, sp, #0x10
     d8c:	f2e825c0 	movk	x0, #0x412e, lsl #48
     d90:	d2800008 	mov	x8, #0x0                   	// #0
     d94:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     d98:	528000c4 	mov	w4, #0x6                   	// #6
     d9c:	17ffffa3 	b	c28 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     da0:	2a0703e6 	mov	w6, w7
     da4:	aa1203e3 	mov	x3, x18
     da8:	aa1103e2 	mov	x2, x17
     dac:	aa1003e1 	mov	x1, x16
     db0:	aa0f03e0 	mov	x0, x15
     db4:	17fffe87 	b	7d0 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     db8:	2a0503e6 	mov	w6, w5
     dbc:	f0000004 	adrp	x4, 3000 <_sbrk_r>
     dc0:	d2800085 	mov	x5, #0x4                   	// #4
     dc4:	911de084 	add	x4, x4, #0x778
     dc8:	17fffd8a 	b	3f0 <_out_rev>
     dcc:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     dd0:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     dd4:	0b080021 	add	w1, w1, w8
     dd8:	f29999a2 	movk	x2, #0xcccd
     ddc:	1400000d 	b	e10 <_ftoa+0x2a0>
     de0:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     de4:	f10025df 	cmp	x14, #0x9
            --count;
     de8:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     dec:	91000509 	add	x9, x8, #0x1
     df0:	8b0b096d 	add	x13, x11, x11, lsl #2
     df4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     df8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     dfc:	1100c1ab 	add	w11, w13, #0x30
     e00:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     e04:	54000569 	b.ls	eb0 <_ftoa+0x340>  // b.plast
            --count;
     e08:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     e0c:	aa0903e8 	mov	x8, x9
     e10:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     e14:	6b01009f 	cmp	w4, w1
     e18:	54fffe41 	b.ne	de0 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     e1c:	120004e0 	and	w0, w7, #0x3
     e20:	7100041f 	cmp	w0, #0x1
     e24:	54fff601 	b.ne	ce4 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     e28:	34fff525 	cbz	w5, ccc <_ftoa+0x15c>
     e2c:	35000763 	cbnz	w3, f18 <_ftoa+0x3a8>
     e30:	721e04ff 	tst	w7, #0xc
     e34:	54000721 	b.ne	f18 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e38:	2a0503e1 	mov	w1, w5
     e3c:	eb01011f 	cmp	x8, x1
     e40:	54fff462 	b.cs	ccc <_ftoa+0x15c>  // b.hs, b.nlast
     e44:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     e48:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e4c:	54fff4c8 	b.hi	ce4 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     e50:	91000508 	add	x8, x8, #0x1
     e54:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e58:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     e5c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     e60:	54fff360 	b.eq	ccc <_ftoa+0x15c>  // b.none
     e64:	f100811f 	cmp	x8, #0x20
     e68:	54ffff41 	b.ne	e50 <_ftoa+0x2e0>  // b.any
     e6c:	17ffff9e 	b	ce4 <_ftoa+0x174>
        ++frac;
     e70:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
     e74:	9e6301c1 	ucvtf	d1, x14
     e78:	1e622030 	fcmpe	d1, d2
     e7c:	5400004a 	b.ge	e84 <_ftoa+0x314>  // b.tcont
     e80:	17ffff78 	b	c60 <_ftoa+0xf0>
            ++whole;
     e84:	1100054a 	add	w10, w10, #0x1
            frac = 0;
     e88:	d280000e 	mov	x14, #0x0                   	// #0
     e8c:	17ffff75 	b	c60 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
     e90:	371003c7 	tbnz	w7, #2, f08 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
     e94:	361ff287 	tbz	w7, #3, ce4 <_ftoa+0x174>
            buf[len++] = ' ';
     e98:	52800400 	mov	w0, #0x20                  	// #32
     e9c:	38286980 	strb	w0, [x12, x8]
     ea0:	91000508 	add	x8, x8, #0x1
     ea4:	17ffff90 	b	ce4 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     ea8:	54ffee8c 	b.gt	c78 <_ftoa+0x108>
     eac:	17ffff75 	b	c80 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     eb0:	f100813f 	cmp	x9, #0x20
     eb4:	54000420 	b.eq	f38 <_ftoa+0x3c8>  // b.none
     eb8:	91000901 	add	x1, x8, #0x2
     ebc:	51000884 	sub	w4, w4, #0x2
     ec0:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
     ec4:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ec8:	34000340 	cbz	w0, f30 <_ftoa+0x3c0>
     ecc:	d503201f 	nop
            buf[len++] = '0';
     ed0:	91000529 	add	x9, x9, #0x1
     ed4:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ed8:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
     edc:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     ee0:	540002c0 	b.eq	f38 <_ftoa+0x3c8>  // b.none
     ee4:	eb01013f 	cmp	x9, x1
     ee8:	54ffff41 	b.ne	ed0 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
     eec:	528005c0 	mov	w0, #0x2e                  	// #46
     ef0:	91000428 	add	x8, x1, #0x1
     ef4:	38216980 	strb	w0, [x12, x1]
     ef8:	17ffff62 	b	c80 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
     efc:	3607eb2e 	tbz	w14, #0, c60 <_ftoa+0xf0>
        ++frac;
     f00:	910005ce 	add	x14, x14, #0x1
     f04:	17ffff57 	b	c60 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
     f08:	52800560 	mov	w0, #0x2b                  	// #43
     f0c:	38286980 	strb	w0, [x12, x8]
     f10:	91000508 	add	x8, x8, #0x1
     f14:	17ffff74 	b	ce4 <_ftoa+0x174>
            width--;
     f18:	510004a5 	sub	w5, w5, #0x1
     f1c:	17ffffc7 	b	e38 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
     f20:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     f24:	91210000 	add	x0, x0, #0x840
     f28:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
     f2c:	17ffff3f 	b	c28 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f30:	aa0903e1 	mov	x1, x9
     f34:	17ffffee 	b	eec <_ftoa+0x37c>
            buf[len++] = '0';
     f38:	aa0903e8 	mov	x8, x9
     f3c:	17ffffb8 	b	e1c <_ftoa+0x2ac>

0000000000000f40 <_out_char>:
    if (character) {
     f40:	72001c00 	ands	w0, w0, #0xff
     f44:	54000041 	b.ne	f4c <_out_char+0xc>  // b.any
}
     f48:	d65f03c0 	ret
        _putchar(character);
     f4c:	17fffd05 	b	360 <putc>

0000000000000f50 <_out_fct>:
    if (character) {
     f50:	72001c00 	ands	w0, w0, #0xff
     f54:	54000080 	b.eq	f64 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
     f58:	a9400422 	ldp	x2, x1, [x1]
     f5c:	aa0203f0 	mov	x16, x2
     f60:	d61f0200 	br	x16
}
     f64:	d65f03c0 	ret
     f68:	d503201f 	nop
     f6c:	d503201f 	nop

0000000000000f70 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
     f70:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
     f74:	f100003f 	cmp	x1, #0x0
{
     f78:	a9017bfd 	stp	x29, x30, [sp, #16]
     f7c:	910043fd 	add	x29, sp, #0x10
     f80:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
     f84:	90000013 	adrp	x19, 0 <main>
     f88:	910f8273 	add	x19, x19, #0x3e0
{
     f8c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
     f90:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
     f94:	aa0103fa 	mov	x26, x1
     f98:	a90673fb 	stp	x27, x28, [sp, #96]
     f9c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
     fa0:	d280001b 	mov	x27, #0x0                   	// #0
     fa4:	b9401880 	ldr	w0, [x4, #24]
     fa8:	b9007be0 	str	w0, [sp, #120]
     fac:	f9400480 	ldr	x0, [x4, #8]
     fb0:	f90047e0 	str	x0, [sp, #136]
     fb4:	39400065 	ldrb	w5, [x3]
     fb8:	f9400880 	ldr	x0, [x4, #16]
     fbc:	f9004be0 	str	x0, [sp, #144]
     fc0:	b9401c80 	ldr	w0, [x4, #28]
     fc4:	b900abe0 	str	w0, [sp, #168]
     fc8:	f9400094 	ldr	x20, [x4]
     fcc:	34003ae5 	cbz	w5, 1728 <_vsnprintf+0x7b8>
     fd0:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
     fd4:	f0000018 	adrp	x24, 3000 <_sbrk_r>
     fd8:	911e0300 	add	x0, x24, #0x780
     fdc:	aa0303f9 	mov	x25, x3
     fe0:	f90043e0 	str	x0, [sp, #128]
     fe4:	f0000000 	adrp	x0, 3000 <_sbrk_r>
     fe8:	9120a000 	add	x0, x0, #0x828
     fec:	f9004fe0 	str	x0, [sp, #152]
     ff0:	1400000a 	b	1018 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
     ff4:	91000764 	add	x4, x27, #0x1
     ff8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
     ffc:	aa1b03e2 	mov	x2, x27
    1000:	aa1c03e3 	mov	x3, x28
    1004:	aa1a03e1 	mov	x1, x26
    1008:	aa0403fb 	mov	x27, x4
    100c:	d63f0260 	blr	x19
    while (*format) {
    1010:	39400325 	ldrb	w5, [x25]
    1014:	34000c85 	cbz	w5, 11a4 <_vsnprintf+0x234>
            format++;
    1018:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    101c:	710094bf 	cmp	w5, #0x25
    1020:	54fffea1 	b.ne	ff4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    1024:	aa1903e8 	mov	x8, x25
        flags = 0U;
    1028:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    102c:	38401500 	ldrb	w0, [x8], #1
    1030:	7100ac1f 	cmp	w0, #0x2b
    1034:	54000180 	b.eq	1064 <_vsnprintf+0xf4>  // b.none
    1038:	540001c8 	b.hi	1070 <_vsnprintf+0x100>  // b.pmore
    103c:	7100801f 	cmp	w0, #0x20
    1040:	54000260 	b.eq	108c <_vsnprintf+0x11c>  // b.none
    1044:	71008c1f 	cmp	w0, #0x23
    1048:	540002e1 	b.ne	10a4 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    104c:	321c00c6 	orr	w6, w6, #0x10
            format++;
    1050:	aa0803f9 	mov	x25, x8
            switch (*format) {
    1054:	aa1903e8 	mov	x8, x25
    1058:	38401500 	ldrb	w0, [x8], #1
    105c:	7100ac1f 	cmp	w0, #0x2b
    1060:	54fffec1 	b.ne	1038 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    1064:	321e00c6 	orr	w6, w6, #0x4
            format++;
    1068:	aa0803f9 	mov	x25, x8
    106c:	17fffffa 	b	1054 <_vsnprintf+0xe4>
            switch (*format) {
    1070:	7100b41f 	cmp	w0, #0x2d
    1074:	54000120 	b.eq	1098 <_vsnprintf+0x128>  // b.none
    1078:	7100c01f 	cmp	w0, #0x30
    107c:	540062c1 	b.ne	1cd4 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    1080:	320000c6 	orr	w6, w6, #0x1
            format++;
    1084:	aa0803f9 	mov	x25, x8
    1088:	17fffff3 	b	1054 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    108c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    1090:	aa0803f9 	mov	x25, x8
    1094:	17fffff0 	b	1054 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    1098:	321f00c6 	orr	w6, w6, #0x2
            format++;
    109c:	aa0803f9 	mov	x25, x8
    10a0:	17ffffed 	b	1054 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    10a4:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    10a8:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    10ac:	540002e0 	b.eq	1108 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    10b0:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    10b4:	7101b01f 	cmp	w0, #0x6c
            format++;
    10b8:	aa0803e4 	mov	x4, x8
        switch (*format) {
    10bc:	54001f20 	b.eq	14a0 <_vsnprintf+0x530>  // b.none
    10c0:	54000588 	b.hi	1170 <_vsnprintf+0x200>  // b.pmore
    10c4:	7101a01f 	cmp	w0, #0x68
    10c8:	54001e20 	b.eq	148c <_vsnprintf+0x51c>  // b.none
    10cc:	7101a81f 	cmp	w0, #0x6a
    10d0:	54006241 	b.ne	1d18 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    10d4:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    10d8:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    10dc:	51009402 	sub	w2, w0, #0x25
            format++;
    10e0:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    10e4:	71014c5f 	cmp	w2, #0x53
    10e8:	54000069 	b.ls	10f4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    10ec:	91000764 	add	x4, x27, #0x1
    10f0:	17ffffc3 	b	ffc <_vsnprintf+0x8c>
        switch (*format) {
    10f4:	f94043e1 	ldr	x1, [sp, #128]
    10f8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    10fc:	10000062 	adr	x2, 1108 <_vsnprintf+0x198>
    1100:	8b21a841 	add	x1, x2, w1, sxth #2
    1104:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    1108:	b9407be0 	ldr	w0, [sp, #120]
    110c:	37f806c0 	tbnz	w0, #31, 11e4 <_vsnprintf+0x274>
    1110:	91002e82 	add	x2, x20, #0xb
    1114:	aa1403e0 	mov	x0, x20
    1118:	927df054 	and	x20, x2, #0xfffffffffffffff8
    111c:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    1120:	36f80078 	tbz	w24, #31, 112c <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    1124:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    1128:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    112c:	39400720 	ldrb	w0, [x25, #1]
            format++;
    1130:	aa0803f9 	mov	x25, x8
    1134:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    1138:	7100b81f 	cmp	w0, #0x2e
    113c:	54fffba1 	b.ne	10b0 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    1140:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    1144:	321600c6 	orr	w6, w6, #0x400
            format++;
    1148:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    114c:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1150:	12001c42 	and	w2, w2, #0xff
    1154:	7100245f 	cmp	w2, #0x9
    1158:	54001b29 	b.ls	14bc <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    115c:	7100a81f 	cmp	w0, #0x2a
    1160:	54002a20 	b.eq	16a4 <_vsnprintf+0x734>  // b.none
            format++;
    1164:	aa0803f9 	mov	x25, x8
    1168:	91000508 	add	x8, x8, #0x1
    116c:	17ffffd1 	b	10b0 <_vsnprintf+0x140>
        switch (*format) {
    1170:	7101d01f 	cmp	w0, #0x74
    1174:	54fffb00 	b.eq	10d4 <_vsnprintf+0x164>  // b.none
    1178:	7101e81f 	cmp	w0, #0x7a
    117c:	54fffac0 	b.eq	10d4 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1180:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1184:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1188:	7100245f 	cmp	w2, #0x9
    118c:	54fffb08 	b.hi	10ec <_vsnprintf+0x17c>  // b.pmore
    1190:	f9404fe1 	ldr	x1, [sp, #152]
    1194:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1198:	10000062 	adr	x2, 11a4 <_vsnprintf+0x234>
    119c:	8b21a841 	add	x1, x2, w1, sxth #2
    11a0:	d61f0020 	br	x1
    11a4:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    11a8:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    11ac:	eb1b039f 	cmp	x28, x27
    11b0:	d1000782 	sub	x2, x28, #0x1
    11b4:	aa1a03e1 	mov	x1, x26
    11b8:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    11bc:	aa1c03e3 	mov	x3, x28
    11c0:	52800000 	mov	w0, #0x0                   	// #0
    11c4:	d63f0260 	blr	x19
}
    11c8:	2a1403e0 	mov	w0, w20
    11cc:	a9417bfd 	ldp	x29, x30, [sp, #16]
    11d0:	a94253f3 	ldp	x19, x20, [sp, #32]
    11d4:	a9456bf9 	ldp	x25, x26, [sp, #80]
    11d8:	a94673fb 	ldp	x27, x28, [sp, #96]
    11dc:	9102c3ff 	add	sp, sp, #0xb0
    11e0:	d65f03c0 	ret
            const int w = va_arg(va, int);
    11e4:	b9407be0 	ldr	w0, [sp, #120]
    11e8:	11002002 	add	w2, w0, #0x8
    11ec:	7100005f 	cmp	w2, #0x0
    11f0:	5400228d 	b.le	1640 <_vsnprintf+0x6d0>
    11f4:	91002e84 	add	x4, x20, #0xb
    11f8:	aa1403e0 	mov	x0, x20
    11fc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1200:	b9007be2 	str	w2, [sp, #120]
    1204:	17ffffc6 	b	111c <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    1208:	121a7802 	and	w2, w0, #0xffffffdf
    120c:	7101605f 	cmp	w2, #0x58
    1210:	54001781 	b.ne	1500 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    1214:	7101601f 	cmp	w0, #0x58
    1218:	54003c81 	b.ne	19a8 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    121c:	321b00c6 	orr	w6, w6, #0x20
    1220:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1224:	121c74c6 	and	w6, w6, #0xfffffff3
    1228:	140000c0 	b	1528 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    122c:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    1230:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    1234:	71011c5f 	cmp	w2, #0x47
    1238:	321500c2 	orr	w2, w6, #0x800
    123c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    1240:	7101141f 	cmp	w0, #0x45
    1244:	321b00c0 	orr	w0, w6, #0x20
    1248:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    124c:	b940abe0 	ldr	w0, [sp, #168]
    1250:	37f81c20 	tbnz	w0, #31, 15d4 <_vsnprintf+0x664>
    1254:	91003e82 	add	x2, x20, #0xf
    1258:	aa1403e0 	mov	x0, x20
    125c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1260:	fd400000 	ldr	d0, [x0]
    1264:	aa1b03e2 	mov	x2, x27
    1268:	2a1803e5 	mov	w5, w24
    126c:	2a1703e4 	mov	w4, w23
    1270:	aa1c03e3 	mov	x3, x28
    1274:	aa1a03e1 	mov	x1, x26
    1278:	aa1303e0 	mov	x0, x19
    127c:	97fffd55 	bl	7d0 <_etoa>
    1280:	aa0003fb 	mov	x27, x0
            break;
    1284:	17ffff63 	b	1010 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1288:	7101181f 	cmp	w0, #0x46
    128c:	321b00c0 	orr	w0, w6, #0x20
    1290:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1294:	b940abe0 	ldr	w0, [sp, #168]
    1298:	37f818c0 	tbnz	w0, #31, 15b0 <_vsnprintf+0x640>
    129c:	91003e82 	add	x2, x20, #0xf
    12a0:	aa1403e0 	mov	x0, x20
    12a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    12a8:	fd400000 	ldr	d0, [x0]
    12ac:	aa1b03e2 	mov	x2, x27
    12b0:	2a1803e5 	mov	w5, w24
    12b4:	2a1703e4 	mov	w4, w23
    12b8:	aa1c03e3 	mov	x3, x28
    12bc:	aa1a03e1 	mov	x1, x26
    12c0:	aa1303e0 	mov	x0, x19
    12c4:	97fffe2b 	bl	b70 <_ftoa>
    12c8:	aa0003fb 	mov	x27, x0
            break;
    12cc:	17ffff51 	b	1010 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    12d0:	91000760 	add	x0, x27, #0x1
    12d4:	aa1b03e2 	mov	x2, x27
    12d8:	aa1c03e3 	mov	x3, x28
    12dc:	aa0003fb 	mov	x27, x0
    12e0:	aa1a03e1 	mov	x1, x26
    12e4:	528004a0 	mov	w0, #0x25                  	// #37
    12e8:	d63f0260 	blr	x19
            break;
    12ec:	17ffff49 	b	1010 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    12f0:	52800420 	mov	w0, #0x21                  	// #33
    12f4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    12f8:	b9407be0 	ldr	w0, [sp, #120]
    12fc:	37f817e0 	tbnz	w0, #31, 15f8 <_vsnprintf+0x688>
    1300:	91003e82 	add	x2, x20, #0xf
    1304:	aa1403e0 	mov	x0, x20
    1308:	927df054 	and	x20, x2, #0xfffffffffffffff8
    130c:	2a1703e7 	mov	w7, w23
    1310:	aa1b03e2 	mov	x2, x27
    1314:	f9400004 	ldr	x4, [x0]
    1318:	52800200 	mov	w0, #0x10                  	// #16
    131c:	b90003e0 	str	w0, [sp]
    1320:	b9000be6 	str	w6, [sp, #8]
    1324:	d2800206 	mov	x6, #0x10                  	// #16
    1328:	52800005 	mov	w5, #0x0                   	// #0
    132c:	aa1c03e3 	mov	x3, x28
    1330:	aa1a03e1 	mov	x1, x26
    1334:	aa1303e0 	mov	x0, x19
    1338:	97fffc72 	bl	500 <_ntoa_long>
    133c:	aa0003fb 	mov	x27, x0
            break;
    1340:	17ffff34 	b	1010 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    1344:	a9035bf5 	stp	x21, x22, [sp, #48]
    1348:	36082306 	tbz	w6, #1, 17a8 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    134c:	b9407be0 	ldr	w0, [sp, #120]
    1350:	37f82a20 	tbnz	w0, #31, 1894 <_vsnprintf+0x924>
    1354:	91002e82 	add	x2, x20, #0xb
    1358:	aa1403e0 	mov	x0, x20
    135c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1360:	39400000 	ldrb	w0, [x0]
    1364:	aa1b03e2 	mov	x2, x27
    1368:	aa1c03e3 	mov	x3, x28
    136c:	aa1a03e1 	mov	x1, x26
    1370:	91000775 	add	x21, x27, #0x1
    1374:	d63f0260 	blr	x19
                while (l++ < width) {
    1378:	51000b00 	sub	w0, w24, #0x2
    137c:	91000b6a 	add	x10, x27, #0x2
    1380:	7100071f 	cmp	w24, #0x1
    1384:	8b00015b 	add	x27, x10, x0
    1388:	540007c9 	b.ls	1480 <_vsnprintf+0x510>  // b.plast
    138c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1390:	aa1503e2 	mov	x2, x21
    1394:	aa1c03e3 	mov	x3, x28
    1398:	910006b5 	add	x21, x21, #0x1
    139c:	aa1a03e1 	mov	x1, x26
    13a0:	52800400 	mov	w0, #0x20                  	// #32
    13a4:	d63f0260 	blr	x19
                while (l++ < width) {
    13a8:	eb1b02bf 	cmp	x21, x27
    13ac:	54ffff21 	b.ne	1390 <_vsnprintf+0x420>  // b.any
    13b0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    13b4:	17ffff17 	b	1010 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    13b8:	b9407be0 	ldr	w0, [sp, #120]
    13bc:	a9035bf5 	stp	x21, x22, [sp, #48]
    13c0:	37f812e0 	tbnz	w0, #31, 161c <_vsnprintf+0x6ac>
    13c4:	91003e82 	add	x2, x20, #0xf
    13c8:	aa1403e0 	mov	x0, x20
    13cc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13d0:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    13d4:	394002a8 	ldrb	w8, [x21]
    13d8:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    13dc:	350017d7 	cbnz	w23, 16d4 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    13e0:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    13e4:	340035c8 	cbz	w8, 1a9c <_vsnprintf+0xb2c>
    13e8:	91000456 	add	x22, x2, #0x1
    13ec:	aa1503e2 	mov	x2, x21
    13f0:	8b1602b6 	add	x22, x21, x22
    13f4:	14000003 	b	1400 <_vsnprintf+0x490>
    13f8:	eb0202df 	cmp	x22, x2
    13fc:	54001900 	b.eq	171c <_vsnprintf+0x7ac>  // b.none
    1400:	38401c44 	ldrb	w4, [x2, #1]!
    1404:	35ffffa4 	cbnz	w4, 13f8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    1408:	4b150041 	sub	w1, w2, w21
    140c:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    1410:	121600c1 	and	w1, w6, #0x400
    1414:	b9007fe1 	str	w1, [sp, #124]
    1418:	365000a6 	tbz	w6, #10, 142c <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    141c:	b940a3e1 	ldr	w1, [sp, #160]
    1420:	6b17003f 	cmp	w1, w23
    1424:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    1428:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    142c:	121f00c1 	and	w1, w6, #0x2
    1430:	b900afe1 	str	w1, [sp, #172]
    1434:	36081826 	tbz	w6, #1, 1738 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1438:	34001108 	cbz	w8, 1658 <_vsnprintf+0x6e8>
    143c:	aa1b03e2 	mov	x2, x27
    1440:	cb1b02b6 	sub	x22, x21, x27
    1444:	14000002 	b	144c <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    1448:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    144c:	b9407fe1 	ldr	w1, [sp, #124]
    1450:	34000081 	cbz	w1, 1460 <_vsnprintf+0x4f0>
    1454:	510006e4 	sub	w4, w23, #0x1
    1458:	340016d7 	cbz	w23, 1730 <_vsnprintf+0x7c0>
    145c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    1460:	91000455 	add	x21, x2, #0x1
    1464:	aa1c03e3 	mov	x3, x28
    1468:	aa1a03e1 	mov	x1, x26
    146c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1470:	38756ac0 	ldrb	w0, [x22, x21]
    1474:	35fffea0 	cbnz	w0, 1448 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1478:	b940afe0 	ldr	w0, [sp, #172]
    147c:	35000ec0 	cbnz	w0, 1654 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1480:	aa1503fb 	mov	x27, x21
    1484:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1488:	17fffee2 	b	1010 <_vsnprintf+0xa0>
            if (*format == 'h') {
    148c:	39400720 	ldrb	w0, [x25, #1]
    1490:	7101a01f 	cmp	w0, #0x68
    1494:	540013c0 	b.eq	170c <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1498:	321900c6 	orr	w6, w6, #0x80
    149c:	17ffff10 	b	10dc <_vsnprintf+0x16c>
            if (*format == 'l') {
    14a0:	39400720 	ldrb	w0, [x25, #1]
    14a4:	7101b01f 	cmp	w0, #0x6c
    14a8:	54ffe181 	b.ne	10d8 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    14ac:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    14b0:	321804c6 	orr	w6, w6, #0x300
                format++;
    14b4:	91000b24 	add	x4, x25, #0x2
    14b8:	17ffff09 	b	10dc <_vsnprintf+0x16c>
    unsigned int i = 0U;
    14bc:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    14c0:	52800148 	mov	w8, #0xa                   	// #10
    14c4:	d503201f 	nop
    14c8:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    14cc:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    14d0:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    14d4:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    14d8:	12001c42 	and	w2, w2, #0xff
    14dc:	7100245f 	cmp	w2, #0x9
    14e0:	54ffff49 	b.ls	14c8 <_vsnprintf+0x558>  // b.plast
    14e4:	aa0403f9 	mov	x25, x4
    14e8:	91000488 	add	x8, x4, #0x1
    14ec:	17fffef2 	b	10b4 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    14f0:	121a7802 	and	w2, w0, #0xffffffdf
    14f4:	7101605f 	cmp	w2, #0x58
    14f8:	54002580 	b.eq	19a8 <_vsnprintf+0xa38>  // b.none
    14fc:	d503201f 	nop
            } else if (*format == 'o') {
    1500:	7101bc1f 	cmp	w0, #0x6f
    1504:	540021a0 	b.eq	1938 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    1508:	7101881f 	cmp	w0, #0x62
    150c:	54002820 	b.eq	1a10 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    1510:	121b78c6 	and	w6, w6, #0xffffffef
    1514:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    1518:	7101a41f 	cmp	w0, #0x69
    151c:	52800c82 	mov	w2, #0x64                  	// #100
    1520:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    1524:	54ffe801 	b.ne	1224 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    1528:	f27600df 	tst	x6, #0x400
    152c:	121f78c2 	and	w2, w6, #0xfffffffe
    1530:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    1534:	7101a41f 	cmp	w0, #0x69
    1538:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    153c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    1540:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    1544:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    1548:	54000ce1 	b.ne	16e4 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    154c:	35002122 	cbnz	w2, 1970 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1550:	37402306 	tbnz	w6, #8, 19b0 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1554:	37301b26 	tbnz	w6, #6, 18b8 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1558:	36382926 	tbz	w6, #7, 1a7c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    155c:	37f83300 	tbnz	w0, #31, 1bbc <_vsnprintf+0xc4c>
    1560:	91002e82 	add	x2, x20, #0xb
    1564:	aa1403e0 	mov	x0, x20
    1568:	927df054 	and	x20, x2, #0xfffffffffffffff8
    156c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1570:	710000bf 	cmp	w5, #0x0
    1574:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1578:	12003c84 	and	w4, w4, #0xffff
    157c:	2a1703e7 	mov	w7, w23
    1580:	531f7ca5 	lsr	w5, w5, #31
    1584:	93407c84 	sxtw	x4, w4
    1588:	aa1b03e2 	mov	x2, x27
    158c:	b9000be6 	str	w6, [sp, #8]
    1590:	aa0803e6 	mov	x6, x8
    1594:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1598:	aa1c03e3 	mov	x3, x28
    159c:	aa1a03e1 	mov	x1, x26
    15a0:	aa1303e0 	mov	x0, x19
    15a4:	97fffbd7 	bl	500 <_ntoa_long>
    15a8:	aa0003fb 	mov	x27, x0
            break;
    15ac:	17fffe99 	b	1010 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    15b0:	b940abe0 	ldr	w0, [sp, #168]
    15b4:	11004002 	add	w2, w0, #0x10
    15b8:	7100005f 	cmp	w2, #0x0
    15bc:	54001b4d 	b.le	1924 <_vsnprintf+0x9b4>
    15c0:	91003e84 	add	x4, x20, #0xf
    15c4:	aa1403e0 	mov	x0, x20
    15c8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    15cc:	b900abe2 	str	w2, [sp, #168]
    15d0:	17ffff36 	b	12a8 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    15d4:	b940abe0 	ldr	w0, [sp, #168]
    15d8:	11004002 	add	w2, w0, #0x10
    15dc:	7100005f 	cmp	w2, #0x0
    15e0:	5400198d 	b.le	1910 <_vsnprintf+0x9a0>
    15e4:	91003e84 	add	x4, x20, #0xf
    15e8:	aa1403e0 	mov	x0, x20
    15ec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    15f0:	b900abe2 	str	w2, [sp, #168]
    15f4:	17ffff1b 	b	1260 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    15f8:	b9407be0 	ldr	w0, [sp, #120]
    15fc:	11002002 	add	w2, w0, #0x8
    1600:	7100005f 	cmp	w2, #0x0
    1604:	540017cd 	b.le	18fc <_vsnprintf+0x98c>
    1608:	91003e84 	add	x4, x20, #0xf
    160c:	aa1403e0 	mov	x0, x20
    1610:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1614:	b9007be2 	str	w2, [sp, #120]
    1618:	17ffff3d 	b	130c <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    161c:	b9407be0 	ldr	w0, [sp, #120]
    1620:	11002002 	add	w2, w0, #0x8
    1624:	7100005f 	cmp	w2, #0x0
    1628:	5400160d 	b.le	18e8 <_vsnprintf+0x978>
    162c:	91003e84 	add	x4, x20, #0xf
    1630:	aa1403e0 	mov	x0, x20
    1634:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1638:	b9007be2 	str	w2, [sp, #120]
    163c:	17ffff65 	b	13d0 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    1640:	f94047e1 	ldr	x1, [sp, #136]
    1644:	b9407be0 	ldr	w0, [sp, #120]
    1648:	b9007be2 	str	w2, [sp, #120]
    164c:	8b20c020 	add	x0, x1, w0, sxtw
    1650:	17fffeb3 	b	111c <_vsnprintf+0x1ac>
    1654:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1658:	b940a3e0 	ldr	w0, [sp, #160]
    165c:	6b18001f 	cmp	w0, w24
    1660:	540009e2 	b.cs	179c <_vsnprintf+0x82c>  // b.hs, b.nlast
    1664:	51000704 	sub	w4, w24, #0x1
    1668:	91000776 	add	x22, x27, #0x1
    166c:	4b000084 	sub	w4, w4, w0
    1670:	8b160095 	add	x21, x4, x22
    1674:	14000002 	b	167c <_vsnprintf+0x70c>
    1678:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    167c:	aa1b03e2 	mov	x2, x27
    1680:	aa1c03e3 	mov	x3, x28
    1684:	aa1a03e1 	mov	x1, x26
    1688:	52800400 	mov	w0, #0x20                  	// #32
    168c:	d63f0260 	blr	x19
    1690:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1694:	eb1502df 	cmp	x22, x21
    1698:	54ffff01 	b.ne	1678 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    169c:	aa1503fb 	mov	x27, x21
    16a0:	17ffff79 	b	1484 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    16a4:	b9407be0 	ldr	w0, [sp, #120]
    16a8:	37f80b80 	tbnz	w0, #31, 1818 <_vsnprintf+0x8a8>
    16ac:	91002e82 	add	x2, x20, #0xb
    16b0:	aa1403e0 	mov	x0, x20
    16b4:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    16b8:	b9400007 	ldr	w7, [x0]
                format++;
    16bc:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    16c0:	39400320 	ldrb	w0, [x25]
    16c4:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    16c8:	710000ff 	cmp	w7, #0x0
    16cc:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    16d0:	17fffe79 	b	10b4 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    16d4:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    16d8:	34001e28 	cbz	w8, 1a9c <_vsnprintf+0xb2c>
    16dc:	d1000442 	sub	x2, x2, #0x1
    16e0:	17ffff42 	b	13e8 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    16e4:	35001302 	cbnz	w2, 1944 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    16e8:	37401806 	tbnz	w6, #8, 19e8 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    16ec:	37300ba6 	tbnz	w6, #6, 1860 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    16f0:	36381ba6 	tbz	w6, #7, 1a64 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    16f4:	37f82500 	tbnz	w0, #31, 1b94 <_vsnprintf+0xc24>
    16f8:	aa1403e0 	mov	x0, x20
    16fc:	91002e82 	add	x2, x20, #0xb
    1700:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1704:	79400004 	ldrh	w4, [x0]
    1708:	1400005b 	b	1874 <_vsnprintf+0x904>
        switch (*format) {
    170c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    1710:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    1714:	91000b24 	add	x4, x25, #0x2
    1718:	17fffe71 	b	10dc <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    171c:	4b1502c1 	sub	w1, w22, w21
    1720:	b900a3e1 	str	w1, [sp, #160]
    1724:	17ffff3b 	b	1410 <_vsnprintf+0x4a0>
    while (*format) {
    1728:	52800014 	mov	w20, #0x0                   	// #0
    172c:	17fffea0 	b	11ac <_vsnprintf+0x23c>
    1730:	aa0203f5 	mov	x21, x2
    1734:	17ffff51 	b	1478 <_vsnprintf+0x508>
                while (l++ < width) {
    1738:	b940a3e1 	ldr	w1, [sp, #160]
    173c:	6b18003f 	cmp	w1, w24
    1740:	11000420 	add	w0, w1, #0x1
    1744:	54002242 	b.cs	1b8c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    1748:	51000700 	sub	w0, w24, #0x1
    174c:	91000776 	add	x22, x27, #0x1
    1750:	4b010000 	sub	w0, w0, w1
    1754:	8b160000 	add	x0, x0, x22
    1758:	f90053e0 	str	x0, [sp, #160]
    175c:	14000002 	b	1764 <_vsnprintf+0x7f4>
    1760:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1764:	aa1b03e2 	mov	x2, x27
    1768:	52800400 	mov	w0, #0x20                  	// #32
    176c:	aa1c03e3 	mov	x3, x28
    1770:	aa1a03e1 	mov	x1, x26
    1774:	d63f0260 	blr	x19
    1778:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    177c:	f94053e0 	ldr	x0, [sp, #160]
    1780:	eb16001f 	cmp	x0, x22
    1784:	54fffee1 	b.ne	1760 <_vsnprintf+0x7f0>  // b.any
    1788:	394002a8 	ldrb	w8, [x21]
    178c:	11000700 	add	w0, w24, #0x1
    1790:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1794:	2a0803e0 	mov	w0, w8
    1798:	35ffe528 	cbnz	w8, 143c <_vsnprintf+0x4cc>
                while (l++ < width) {
    179c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    17a0:	aa1503fb 	mov	x27, x21
    17a4:	17ffff38 	b	1484 <_vsnprintf+0x514>
                while (l++ < width) {
    17a8:	7100071f 	cmp	w24, #0x1
    17ac:	54001ec9 	b.ls	1b84 <_vsnprintf+0xc14>  // b.plast
    17b0:	51000b05 	sub	w5, w24, #0x2
    17b4:	91000776 	add	x22, x27, #0x1
    17b8:	8b0502d5 	add	x21, x22, x5
    17bc:	14000002 	b	17c4 <_vsnprintf+0x854>
    17c0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    17c4:	aa1b03e2 	mov	x2, x27
    17c8:	aa1c03e3 	mov	x3, x28
    17cc:	aa1a03e1 	mov	x1, x26
    17d0:	52800400 	mov	w0, #0x20                  	// #32
    17d4:	d63f0260 	blr	x19
    17d8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    17dc:	eb1502df 	cmp	x22, x21
    17e0:	54ffff01 	b.ne	17c0 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    17e4:	b9407be0 	ldr	w0, [sp, #120]
    17e8:	37f802a0 	tbnz	w0, #31, 183c <_vsnprintf+0x8cc>
    17ec:	91002e82 	add	x2, x20, #0xb
    17f0:	aa1403e0 	mov	x0, x20
    17f4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    17f8:	39400000 	ldrb	w0, [x0]
    17fc:	aa1503e2 	mov	x2, x21
    1800:	910006bb 	add	x27, x21, #0x1
    1804:	aa1c03e3 	mov	x3, x28
    1808:	aa1a03e1 	mov	x1, x26
    180c:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    1810:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1814:	17fffdff 	b	1010 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    1818:	b9407be0 	ldr	w0, [sp, #120]
    181c:	11002002 	add	w2, w0, #0x8
    1820:	7100005f 	cmp	w2, #0x0
    1824:	5400058d 	b.le	18d4 <_vsnprintf+0x964>
    1828:	91002e84 	add	x4, x20, #0xb
    182c:	aa1403e0 	mov	x0, x20
    1830:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1834:	b9007be2 	str	w2, [sp, #120]
    1838:	17ffffa0 	b	16b8 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    183c:	b9407be0 	ldr	w0, [sp, #120]
    1840:	11002002 	add	w2, w0, #0x8
    1844:	7100005f 	cmp	w2, #0x0
    1848:	540016ed 	b.le	1b24 <_vsnprintf+0xbb4>
    184c:	91002e84 	add	x4, x20, #0xb
    1850:	aa1403e0 	mov	x0, x20
    1854:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1858:	b9007be2 	str	w2, [sp, #120]
    185c:	17ffffe7 	b	17f8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1860:	37f81220 	tbnz	w0, #31, 1aa4 <_vsnprintf+0xb34>
    1864:	91002e82 	add	x2, x20, #0xb
    1868:	aa1403e0 	mov	x0, x20
    186c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1870:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1874:	2a1703e7 	mov	w7, w23
    1878:	2a0403e4 	mov	w4, w4
    187c:	b9000be6 	str	w6, [sp, #8]
    1880:	aa0803e6 	mov	x6, x8
    1884:	b90003f8 	str	w24, [sp]
    1888:	aa1b03e2 	mov	x2, x27
    188c:	52800005 	mov	w5, #0x0                   	// #0
    1890:	17ffff42 	b	1598 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1894:	b9407be0 	ldr	w0, [sp, #120]
    1898:	11002002 	add	w2, w0, #0x8
    189c:	7100005f 	cmp	w2, #0x0
    18a0:	5400138d 	b.le	1b10 <_vsnprintf+0xba0>
    18a4:	91002e84 	add	x4, x20, #0xb
    18a8:	aa1403e0 	mov	x0, x20
    18ac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    18b0:	b9007be2 	str	w2, [sp, #120]
    18b4:	17fffeab 	b	1360 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    18b8:	37f81080 	tbnz	w0, #31, 1ac8 <_vsnprintf+0xb58>
    18bc:	91002e82 	add	x2, x20, #0xb
    18c0:	aa1403e0 	mov	x0, x20
    18c4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    18c8:	39400005 	ldrb	w5, [x0]
    18cc:	2a0503e4 	mov	w4, w5
    18d0:	17ffff2b 	b	157c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    18d4:	f94047e1 	ldr	x1, [sp, #136]
    18d8:	b9407be0 	ldr	w0, [sp, #120]
    18dc:	b9007be2 	str	w2, [sp, #120]
    18e0:	8b20c020 	add	x0, x1, w0, sxtw
    18e4:	17ffff75 	b	16b8 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    18e8:	f94047e1 	ldr	x1, [sp, #136]
    18ec:	b9407be0 	ldr	w0, [sp, #120]
    18f0:	b9007be2 	str	w2, [sp, #120]
    18f4:	8b20c020 	add	x0, x1, w0, sxtw
    18f8:	17fffeb6 	b	13d0 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    18fc:	f94047e1 	ldr	x1, [sp, #136]
    1900:	b9407be0 	ldr	w0, [sp, #120]
    1904:	b9007be2 	str	w2, [sp, #120]
    1908:	8b20c020 	add	x0, x1, w0, sxtw
    190c:	17fffe80 	b	130c <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1910:	f9404be1 	ldr	x1, [sp, #144]
    1914:	b940abe0 	ldr	w0, [sp, #168]
    1918:	b900abe2 	str	w2, [sp, #168]
    191c:	8b20c020 	add	x0, x1, w0, sxtw
    1920:	17fffe50 	b	1260 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1924:	f9404be1 	ldr	x1, [sp, #144]
    1928:	b940abe0 	ldr	w0, [sp, #168]
    192c:	b900abe2 	str	w2, [sp, #168]
    1930:	8b20c020 	add	x0, x1, w0, sxtw
    1934:	17fffe5d 	b	12a8 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1938:	121c74c6 	and	w6, w6, #0xfffffff3
    193c:	d2800108 	mov	x8, #0x8                   	// #8
    1940:	17fffefa 	b	1528 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1944:	37f807e0 	tbnz	w0, #31, 1a40 <_vsnprintf+0xad0>
    1948:	91003e82 	add	x2, x20, #0xf
    194c:	aa1403e0 	mov	x0, x20
    1950:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1954:	2a1703e7 	mov	w7, w23
    1958:	aa1b03e2 	mov	x2, x27
    195c:	f9400004 	ldr	x4, [x0]
    1960:	b90003f8 	str	w24, [sp]
    1964:	b9000be6 	str	w6, [sp, #8]
    1968:	aa0803e6 	mov	x6, x8
    196c:	17fffe6f 	b	1328 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1970:	37f80560 	tbnz	w0, #31, 1a1c <_vsnprintf+0xaac>
    1974:	91003e82 	add	x2, x20, #0xf
    1978:	aa1403e0 	mov	x0, x20
    197c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1980:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1984:	2a1703e7 	mov	w7, w23
    1988:	aa1b03e2 	mov	x2, x27
    198c:	b90003f8 	str	w24, [sp]
    1990:	f10000bf 	cmp	x5, #0x0
    1994:	b9000be6 	str	w6, [sp, #8]
    1998:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    199c:	aa0803e6 	mov	x6, x8
    19a0:	d37ffca5 	lsr	x5, x5, #63
    19a4:	17fffe62 	b	132c <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    19a8:	d2800208 	mov	x8, #0x10                  	// #16
    19ac:	17fffedb 	b	1518 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    19b0:	37f80c40 	tbnz	w0, #31, 1b38 <_vsnprintf+0xbc8>
    19b4:	91003e82 	add	x2, x20, #0xf
    19b8:	aa1403e0 	mov	x0, x20
    19bc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    19c0:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    19c4:	2a1703e7 	mov	w7, w23
    19c8:	aa1b03e2 	mov	x2, x27
    19cc:	b90003f8 	str	w24, [sp]
    19d0:	f10000bf 	cmp	x5, #0x0
    19d4:	b9000be6 	str	w6, [sp, #8]
    19d8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    19dc:	aa0803e6 	mov	x6, x8
    19e0:	d37ffca5 	lsr	x5, x5, #63
    19e4:	17fffeed 	b	1598 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    19e8:	37f80820 	tbnz	w0, #31, 1aec <_vsnprintf+0xb7c>
    19ec:	91003e82 	add	x2, x20, #0xf
    19f0:	aa1403e0 	mov	x0, x20
    19f4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    19f8:	2a1703e7 	mov	w7, w23
    19fc:	f9400004 	ldr	x4, [x0]
    1a00:	b90003f8 	str	w24, [sp]
    1a04:	b9000be6 	str	w6, [sp, #8]
    1a08:	aa0803e6 	mov	x6, x8
    1a0c:	17ffff9f 	b	1888 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1a10:	121c74c6 	and	w6, w6, #0xfffffff3
    1a14:	d2800048 	mov	x8, #0x2                   	// #2
    1a18:	17fffec4 	b	1528 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1a1c:	b9407be0 	ldr	w0, [sp, #120]
    1a20:	11002002 	add	w2, w0, #0x8
    1a24:	7100005f 	cmp	w2, #0x0
    1a28:	54000a4d 	b.le	1b70 <_vsnprintf+0xc00>
    1a2c:	91003e84 	add	x4, x20, #0xf
    1a30:	aa1403e0 	mov	x0, x20
    1a34:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a38:	b9007be2 	str	w2, [sp, #120]
    1a3c:	17ffffd1 	b	1980 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1a40:	b9407be0 	ldr	w0, [sp, #120]
    1a44:	11002002 	add	w2, w0, #0x8
    1a48:	7100005f 	cmp	w2, #0x0
    1a4c:	5400088d 	b.le	1b5c <_vsnprintf+0xbec>
    1a50:	91003e84 	add	x4, x20, #0xf
    1a54:	aa1403e0 	mov	x0, x20
    1a58:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a5c:	b9007be2 	str	w2, [sp, #120]
    1a60:	17ffffbd 	b	1954 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1a64:	37f80d00 	tbnz	w0, #31, 1c04 <_vsnprintf+0xc94>
    1a68:	aa1403e0 	mov	x0, x20
    1a6c:	91002e82 	add	x2, x20, #0xb
    1a70:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a74:	b9400004 	ldr	w4, [x0]
    1a78:	17ffff7f 	b	1874 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1a7c:	37f80b20 	tbnz	w0, #31, 1be0 <_vsnprintf+0xc70>
    1a80:	91002e82 	add	x2, x20, #0xb
    1a84:	aa1403e0 	mov	x0, x20
    1a88:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a8c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1a90:	710000bf 	cmp	w5, #0x0
    1a94:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1a98:	17fffeb9 	b	157c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1a9c:	b900a3ff 	str	wzr, [sp, #160]
    1aa0:	17fffe5c 	b	1410 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1aa4:	b9407be0 	ldr	w0, [sp, #120]
    1aa8:	11002002 	add	w2, w0, #0x8
    1aac:	7100005f 	cmp	w2, #0x0
    1ab0:	54000bed 	b.le	1c2c <_vsnprintf+0xcbc>
    1ab4:	91002e84 	add	x4, x20, #0xb
    1ab8:	aa1403e0 	mov	x0, x20
    1abc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ac0:	b9007be2 	str	w2, [sp, #120]
    1ac4:	17ffff6b 	b	1870 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1ac8:	b9407be0 	ldr	w0, [sp, #120]
    1acc:	11002002 	add	w2, w0, #0x8
    1ad0:	7100005f 	cmp	w2, #0x0
    1ad4:	54000b6d 	b.le	1c40 <_vsnprintf+0xcd0>
    1ad8:	91002e84 	add	x4, x20, #0xb
    1adc:	aa1403e0 	mov	x0, x20
    1ae0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ae4:	b9007be2 	str	w2, [sp, #120]
    1ae8:	17ffff78 	b	18c8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1aec:	b9407be0 	ldr	w0, [sp, #120]
    1af0:	11002002 	add	w2, w0, #0x8
    1af4:	7100005f 	cmp	w2, #0x0
    1af8:	54000aed 	b.le	1c54 <_vsnprintf+0xce4>
    1afc:	91003e84 	add	x4, x20, #0xf
    1b00:	aa1403e0 	mov	x0, x20
    1b04:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b08:	b9007be2 	str	w2, [sp, #120]
    1b0c:	17ffffbb 	b	19f8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1b10:	f94047e1 	ldr	x1, [sp, #136]
    1b14:	b9407be0 	ldr	w0, [sp, #120]
    1b18:	b9007be2 	str	w2, [sp, #120]
    1b1c:	8b20c020 	add	x0, x1, w0, sxtw
    1b20:	17fffe10 	b	1360 <_vsnprintf+0x3f0>
    1b24:	f94047e1 	ldr	x1, [sp, #136]
    1b28:	b9407be0 	ldr	w0, [sp, #120]
    1b2c:	b9007be2 	str	w2, [sp, #120]
    1b30:	8b20c020 	add	x0, x1, w0, sxtw
    1b34:	17ffff31 	b	17f8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1b38:	b9407be0 	ldr	w0, [sp, #120]
    1b3c:	11002002 	add	w2, w0, #0x8
    1b40:	7100005f 	cmp	w2, #0x0
    1b44:	5400092d 	b.le	1c68 <_vsnprintf+0xcf8>
    1b48:	91003e84 	add	x4, x20, #0xf
    1b4c:	aa1403e0 	mov	x0, x20
    1b50:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b54:	b9007be2 	str	w2, [sp, #120]
    1b58:	17ffff9a 	b	19c0 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1b5c:	f94047e1 	ldr	x1, [sp, #136]
    1b60:	b9407be0 	ldr	w0, [sp, #120]
    1b64:	b9007be2 	str	w2, [sp, #120]
    1b68:	8b20c020 	add	x0, x1, w0, sxtw
    1b6c:	17ffff7a 	b	1954 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1b70:	f94047e1 	ldr	x1, [sp, #136]
    1b74:	b9407be0 	ldr	w0, [sp, #120]
    1b78:	b9007be2 	str	w2, [sp, #120]
    1b7c:	8b20c020 	add	x0, x1, w0, sxtw
    1b80:	17ffff80 	b	1980 <_vsnprintf+0xa10>
                while (l++ < width) {
    1b84:	aa1b03f5 	mov	x21, x27
    1b88:	17ffff17 	b	17e4 <_vsnprintf+0x874>
                while (l++ < width) {
    1b8c:	b900a3e0 	str	w0, [sp, #160]
    1b90:	17ffff01 	b	1794 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1b94:	b9407be0 	ldr	w0, [sp, #120]
    1b98:	11002002 	add	w2, w0, #0x8
    1b9c:	7100005f 	cmp	w2, #0x0
    1ba0:	5400078d 	b.le	1c90 <_vsnprintf+0xd20>
    1ba4:	aa1403e0 	mov	x0, x20
    1ba8:	91002e84 	add	x4, x20, #0xb
    1bac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bb0:	b9007be2 	str	w2, [sp, #120]
    1bb4:	79400004 	ldrh	w4, [x0]
    1bb8:	17ffff2f 	b	1874 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1bbc:	b9407be0 	ldr	w0, [sp, #120]
    1bc0:	11002002 	add	w2, w0, #0x8
    1bc4:	7100005f 	cmp	w2, #0x0
    1bc8:	540005ad 	b.le	1c7c <_vsnprintf+0xd0c>
    1bcc:	91002e84 	add	x4, x20, #0xb
    1bd0:	aa1403e0 	mov	x0, x20
    1bd4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bd8:	b9007be2 	str	w2, [sp, #120]
    1bdc:	17fffe64 	b	156c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1be0:	b9407be0 	ldr	w0, [sp, #120]
    1be4:	11002002 	add	w2, w0, #0x8
    1be8:	7100005f 	cmp	w2, #0x0
    1bec:	540005ed 	b.le	1ca8 <_vsnprintf+0xd38>
    1bf0:	91002e84 	add	x4, x20, #0xb
    1bf4:	aa1403e0 	mov	x0, x20
    1bf8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bfc:	b9007be2 	str	w2, [sp, #120]
    1c00:	17ffffa3 	b	1a8c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1c04:	b9407be0 	ldr	w0, [sp, #120]
    1c08:	11002002 	add	w2, w0, #0x8
    1c0c:	7100005f 	cmp	w2, #0x0
    1c10:	5400056d 	b.le	1cbc <_vsnprintf+0xd4c>
    1c14:	aa1403e0 	mov	x0, x20
    1c18:	91002e84 	add	x4, x20, #0xb
    1c1c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c20:	b9007be2 	str	w2, [sp, #120]
    1c24:	b9400004 	ldr	w4, [x0]
    1c28:	17ffff13 	b	1874 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c2c:	f94047e1 	ldr	x1, [sp, #136]
    1c30:	b9407be0 	ldr	w0, [sp, #120]
    1c34:	b9007be2 	str	w2, [sp, #120]
    1c38:	8b20c020 	add	x0, x1, w0, sxtw
    1c3c:	17ffff0d 	b	1870 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c40:	f94047e1 	ldr	x1, [sp, #136]
    1c44:	b9407be0 	ldr	w0, [sp, #120]
    1c48:	b9007be2 	str	w2, [sp, #120]
    1c4c:	8b20c020 	add	x0, x1, w0, sxtw
    1c50:	17ffff1e 	b	18c8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1c54:	f94047e1 	ldr	x1, [sp, #136]
    1c58:	b9407be0 	ldr	w0, [sp, #120]
    1c5c:	b9007be2 	str	w2, [sp, #120]
    1c60:	8b20c020 	add	x0, x1, w0, sxtw
    1c64:	17ffff65 	b	19f8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1c68:	f94047e1 	ldr	x1, [sp, #136]
    1c6c:	b9407be0 	ldr	w0, [sp, #120]
    1c70:	b9007be2 	str	w2, [sp, #120]
    1c74:	8b20c020 	add	x0, x1, w0, sxtw
    1c78:	17ffff52 	b	19c0 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c7c:	f94047e1 	ldr	x1, [sp, #136]
    1c80:	b9407be0 	ldr	w0, [sp, #120]
    1c84:	b9007be2 	str	w2, [sp, #120]
    1c88:	8b20c020 	add	x0, x1, w0, sxtw
    1c8c:	17fffe38 	b	156c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c90:	f94047e1 	ldr	x1, [sp, #136]
    1c94:	b9407be0 	ldr	w0, [sp, #120]
    1c98:	b9007be2 	str	w2, [sp, #120]
    1c9c:	8b20c020 	add	x0, x1, w0, sxtw
    1ca0:	79400004 	ldrh	w4, [x0]
    1ca4:	17fffef4 	b	1874 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1ca8:	f94047e1 	ldr	x1, [sp, #136]
    1cac:	b9407be0 	ldr	w0, [sp, #120]
    1cb0:	b9007be2 	str	w2, [sp, #120]
    1cb4:	8b20c020 	add	x0, x1, w0, sxtw
    1cb8:	17ffff75 	b	1a8c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1cbc:	f94047e1 	ldr	x1, [sp, #136]
    1cc0:	b9407be0 	ldr	w0, [sp, #120]
    1cc4:	b9007be2 	str	w2, [sp, #120]
    1cc8:	8b20c020 	add	x0, x1, w0, sxtw
    1ccc:	b9400004 	ldr	w4, [x0]
    1cd0:	17fffee9 	b	1874 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1cd4:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1cd8:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1cdc:	12001c42 	and	w2, w2, #0xff
    1ce0:	7100245f 	cmp	w2, #0x9
    1ce4:	54ffa2a8 	b.hi	1138 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1ce8:	52800142 	mov	w2, #0xa                   	// #10
    1cec:	d503201f 	nop
    1cf0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1cf4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1cf8:	aa0803f9 	mov	x25, x8
    1cfc:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1d00:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1d04:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1d08:	12001c84 	and	w4, w4, #0xff
    1d0c:	7100249f 	cmp	w4, #0x9
    1d10:	54ffff09 	b.ls	1cf0 <_vsnprintf+0xd80>  // b.plast
    1d14:	17fffd09 	b	1138 <_vsnprintf+0x1c8>
        switch (*format) {
    1d18:	aa1903e4 	mov	x4, x25
    1d1c:	17fffcf0 	b	10dc <_vsnprintf+0x16c>

0000000000001d20 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1d20:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1d24:	910003fd 	mov	x29, sp
    1d28:	f9000bf3 	str	x19, [sp, #16]
    1d2c:	aa0003f3 	mov	x19, x0
    1d30:	3d801fe0 	str	q0, [sp, #112]
    1d34:	3d8023e1 	str	q1, [sp, #128]
    1d38:	3d8027e2 	str	q2, [sp, #144]
    1d3c:	3d802be3 	str	q3, [sp, #160]
    1d40:	3d802fe4 	str	q4, [sp, #176]
    1d44:	3d8033e5 	str	q5, [sp, #192]
    1d48:	3d8037e6 	str	q6, [sp, #208]
    1d4c:	3d803be7 	str	q7, [sp, #224]
    1d50:	a90f8be1 	stp	x1, x2, [sp, #248]
    1d54:	a91093e3 	stp	x3, x4, [sp, #264]
    1d58:	a9119be5 	stp	x5, x6, [sp, #280]
    1d5c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1d60:	97fff968 	bl	300 <init_uart_mmio>
    1d64:	72001c1f 	tst	w0, #0xff
    1d68:	540002e0 	b.eq	1dc4 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1d6c:	9103c3e0 	add	x0, sp, #0xf0
    1d70:	9104c3e3 	add	x3, sp, #0x130
    1d74:	9104c3e4 	add	x4, sp, #0x130
    1d78:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1d7c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1d80:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d84:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1d88:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d8c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1d90:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1d94:	f0ffffe0 	adrp	x0, 0 <main>
    1d98:	913d0000 	add	x0, x0, #0xf40
    1d9c:	910123e1 	add	x1, sp, #0x48
    1da0:	a94527e8 	ldp	x8, x9, [sp, #80]
    1da4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1da8:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1dac:	a90227e8 	stp	x8, x9, [sp, #32]
    1db0:	a9031fe6 	stp	x6, x7, [sp, #48]
    1db4:	97fffc6f 	bl	f70 <_vsnprintf>
    va_end(va);
    return ret;
}
    1db8:	f9400bf3 	ldr	x19, [sp, #16]
    1dbc:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1dc0:	d65f03c0 	ret
        return -1;
    1dc4:	12800000 	mov	w0, #0xffffffff            	// #-1
    1dc8:	17fffffc 	b	1db8 <printf+0x98>
    1dcc:	d503201f 	nop

0000000000001dd0 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1dd0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1dd4:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1dd8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1ddc:	910003fd 	mov	x29, sp
    va_start(va, format);
    1de0:	910343eb 	add	x11, sp, #0xd0
    1de4:	910403ea 	add	x10, sp, #0x100
    1de8:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1dec:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1df0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1df4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1df8:	f0ffffe0 	adrp	x0, 0 <main>
    1dfc:	910f0000 	add	x0, x0, #0x3c0
    va_start(va, format);
    1e00:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e04:	a94337ec 	ldp	x12, x13, [sp, #48]
    1e08:	a90137ec 	stp	x12, x13, [sp, #16]
    1e0c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1e10:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1e14:	3d8017e0 	str	q0, [sp, #80]
    1e18:	3d801be1 	str	q1, [sp, #96]
    1e1c:	3d801fe2 	str	q2, [sp, #112]
    1e20:	3d8023e3 	str	q3, [sp, #128]
    1e24:	3d8027e4 	str	q4, [sp, #144]
    1e28:	3d802be5 	str	q5, [sp, #160]
    1e2c:	3d802fe6 	str	q6, [sp, #176]
    1e30:	3d8033e7 	str	q7, [sp, #192]
    1e34:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e38:	aa0a03e3 	mov	x3, x10
    1e3c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1e40:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e44:	910043e4 	add	x4, sp, #0x10
{
    1e48:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1e4c:	97fffc49 	bl	f70 <_vsnprintf>
    va_end(va);
    return ret;
}
    1e50:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1e54:	d65f03c0 	ret
    1e58:	d503201f 	nop
    1e5c:	d503201f 	nop

0000000000001e60 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1e60:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1e64:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1e68:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1e6c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1e70:	910343ea 	add	x10, sp, #0xd0
    1e74:	910403e8 	add	x8, sp, #0x100
    1e78:	a90323e8 	stp	x8, x8, [sp, #48]
{
    1e7c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1e80:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1e84:	f90023ea 	str	x10, [sp, #64]
{
    1e88:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1e8c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1e90:	aa0803e2 	mov	x2, x8
    1e94:	a94337ec 	ldp	x12, x13, [sp, #48]
    1e98:	f0ffffe0 	adrp	x0, 0 <main>
    1e9c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1ea0:	910f0000 	add	x0, x0, #0x3c0
    1ea4:	a90137ec 	stp	x12, x13, [sp, #16]
    1ea8:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1eac:	3d8017e0 	str	q0, [sp, #80]
    1eb0:	3d801be1 	str	q1, [sp, #96]
    1eb4:	3d801fe2 	str	q2, [sp, #112]
    1eb8:	3d8023e3 	str	q3, [sp, #128]
    1ebc:	3d8027e4 	str	q4, [sp, #144]
    1ec0:	3d802be5 	str	q5, [sp, #160]
    1ec4:	3d802fe6 	str	q6, [sp, #176]
    1ec8:	3d8033e7 	str	q7, [sp, #192]
    1ecc:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1ed0:	910043e4 	add	x4, sp, #0x10
    1ed4:	aa0a03e3 	mov	x3, x10
{
    1ed8:	a90e9be5 	stp	x5, x6, [sp, #232]
    1edc:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1ee0:	97fffc24 	bl	f70 <_vsnprintf>
    va_end(va);
    return ret;
}
    1ee4:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1ee8:	d65f03c0 	ret
    1eec:	d503201f 	nop

0000000000001ef0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    1ef0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1ef4:	aa0003e3 	mov	x3, x0
    1ef8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1efc:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1f00:	a9402428 	ldp	x8, x9, [x1]
    1f04:	910043e4 	add	x4, sp, #0x10
    1f08:	a9411c26 	ldp	x6, x7, [x1, #16]
    1f0c:	f0ffffe0 	adrp	x0, 0 <main>
    1f10:	9100e3e1 	add	x1, sp, #0x38
    1f14:	913d0000 	add	x0, x0, #0xf40
    1f18:	a90127e8 	stp	x8, x9, [sp, #16]
    1f1c:	a9021fe6 	stp	x6, x7, [sp, #32]
    1f20:	97fffc14 	bl	f70 <_vsnprintf>
}
    1f24:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1f28:	d65f03c0 	ret
    1f2c:	d503201f 	nop

0000000000001f30 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    1f30:	aa0303e4 	mov	x4, x3
    1f34:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1f38:	aa0103e5 	mov	x5, x1
    1f3c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    1f40:	a9402488 	ldp	x8, x9, [x4]
    1f44:	aa0003e1 	mov	x1, x0
    1f48:	a9411c86 	ldp	x6, x7, [x4, #16]
    1f4c:	aa0203e3 	mov	x3, x2
    1f50:	910043e4 	add	x4, sp, #0x10
    1f54:	aa0503e2 	mov	x2, x5
    1f58:	f0ffffe0 	adrp	x0, 0 <main>
    1f5c:	910f0000 	add	x0, x0, #0x3c0
    1f60:	a90127e8 	stp	x8, x9, [sp, #16]
    1f64:	a9021fe6 	stp	x6, x7, [sp, #32]
    1f68:	97fffc02 	bl	f70 <_vsnprintf>
}
    1f6c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1f70:	d65f03c0 	ret
    1f74:	d503201f 	nop
    1f78:	d503201f 	nop
    1f7c:	d503201f 	nop

0000000000001f80 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    1f80:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    1f84:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    1f88:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1f8c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1f90:	910443ea 	add	x10, sp, #0x110
    1f94:	910383eb 	add	x11, sp, #0xe0
    1f98:	f90023ea 	str	x10, [sp, #64]
{
    1f9c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1fa0:	910443e2 	add	x2, sp, #0x110
    1fa4:	f90027e2 	str	x2, [sp, #72]
    1fa8:	f9002beb 	str	x11, [sp, #80]
{
    1fac:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    1fb0:	290b23e9 	stp	w9, w8, [sp, #88]
{
    1fb4:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    1fb8:	a9443fee 	ldp	x14, x15, [sp, #64]
    1fbc:	9100c3e1 	add	x1, sp, #0x30
    1fc0:	a94527e8 	ldp	x8, x9, [sp, #80]
    1fc4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1fc8:	f0ffffe0 	adrp	x0, 0 <main>
    1fcc:	913d4000 	add	x0, x0, #0xf50
    1fd0:	a9013fee 	stp	x14, x15, [sp, #16]
    1fd4:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    1fd8:	f9001bec 	str	x12, [sp, #48]
    1fdc:	f9001feb 	str	x11, [sp, #56]
{
    1fe0:	3d801be0 	str	q0, [sp, #96]
    1fe4:	3d801fe1 	str	q1, [sp, #112]
    1fe8:	3d8023e2 	str	q2, [sp, #128]
    1fec:	3d8027e3 	str	q3, [sp, #144]
    1ff0:	3d802be4 	str	q4, [sp, #160]
    1ff4:	3d802fe5 	str	q5, [sp, #176]
    1ff8:	3d8033e6 	str	q6, [sp, #192]
    1ffc:	3d8037e7 	str	q7, [sp, #208]
    2000:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2004:	910043e4 	add	x4, sp, #0x10
    2008:	aa0a03e3 	mov	x3, x10
{
    200c:	a90f9be5 	stp	x5, x6, [sp, #248]
    2010:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2014:	97fffbd7 	bl	f70 <_vsnprintf>
    va_end(va);
    return ret;
    2018:	a8d17bfd 	ldp	x29, x30, [sp], #272
    201c:	d65f03c0 	ret

0000000000002020 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    2020:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    2024:	910003fd 	mov	x29, sp
    2028:	a90153f3 	stp	x19, x20, [sp, #16]
    202c:	a9025bf5 	stp	x21, x22, [sp, #32]
    2030:	2a0103f6 	mov	w22, w1
    2034:	a90363f7 	stp	x23, x24, [sp, #48]
    2038:	aa0203f8 	mov	x24, x2
    203c:	aa0003f7 	mov	x23, x0
    2040:	a9046bf9 	stp	x25, x26, [sp, #64]
    2044:	aa0403f9 	mov	x25, x4
    2048:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    204c:	d63f0060 	blr	x3
    2050:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    2054:	93407c00 	sxtw	x0, w0
    2058:	94000152 	bl	25a0 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    205c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    2060:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    2064:	5400022d 	b.le	20a8 <spawn+0x88>
    2068:	52800013 	mov	w19, #0x0                   	// #0
    206c:	f9002bfb 	str	x27, [sp, #80]
    2070:	5282001b 	mov	w27, #0x1000                	// #4096
    2074:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2078:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    207c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2080:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    2084:	8b33c2a2 	add	x2, x21, w19, sxtw
    2088:	1a9bd084 	csel	w4, w4, w27, le
    208c:	2a1603e1 	mov	w1, w22
    2090:	aa1703e0 	mov	x0, x23
    2094:	d63f0300 	blr	x24
    2098:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    209c:	6b13029f 	cmp	w20, w19
    20a0:	54fffecc 	b.gt	2078 <spawn+0x58>
    20a4:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    20a8:	aa1a03e3 	mov	x3, x26
    20ac:	aa1903e2 	mov	x2, x25
    20b0:	aa1503e1 	mov	x1, x21
    20b4:	d2800004 	mov	x4, #0x0                   	// #0
    20b8:	52800020 	mov	w0, #0x1                   	// #1
    20bc:	940000b9 	bl	23a0 <syscall>
    20c0:	2a0003f3 	mov	w19, w0
    free(img);
    20c4:	aa1503e0 	mov	x0, x21
    20c8:	9400013a 	bl	25b0 <free>
    return ret;
}
    20cc:	2a1303e0 	mov	w0, w19
    20d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    20d4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    20d8:	a94363f7 	ldp	x23, x24, [sp, #48]
    20dc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    20e0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    20e4:	d65f03c0 	ret
    20e8:	d503201f 	nop
    20ec:	d503201f 	nop

00000000000020f0 <thread>:

int thread(void* entry, char* name, char** argv)
{
    20f0:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    20f4:	aa0203e3 	mov	x3, x2
    20f8:	aa0003e1 	mov	x1, x0
    20fc:	aa0403e2 	mov	x2, x4
    2100:	52800120 	mov	w0, #0x9                   	// #9
    2104:	d2800004 	mov	x4, #0x0                   	// #0
    2108:	140000a6 	b	23a0 <syscall>
    210c:	d503201f 	nop

0000000000002110 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    2110:	93407c01 	sxtw	x1, w0
    2114:	d2800004 	mov	x4, #0x0                   	// #0
    2118:	d2800003 	mov	x3, #0x0                   	// #0
    211c:	d2800002 	mov	x2, #0x0                   	// #0
    2120:	52800040 	mov	w0, #0x2                   	// #2
    2124:	1400009f 	b	23a0 <syscall>
    2128:	d503201f 	nop
    212c:	d503201f 	nop

0000000000002130 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    2130:	2a0003e1 	mov	w1, w0
    2134:	d2800004 	mov	x4, #0x0                   	// #0
    2138:	d2800003 	mov	x3, #0x0                   	// #0
    213c:	d2800002 	mov	x2, #0x0                   	// #0
    2140:	52800060 	mov	w0, #0x3                   	// #3
    2144:	14000097 	b	23a0 <syscall>
    2148:	d503201f 	nop
    214c:	d503201f 	nop

0000000000002150 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    2150:	93407c01 	sxtw	x1, w0
    2154:	d2800004 	mov	x4, #0x0                   	// #0
    2158:	d2800003 	mov	x3, #0x0                   	// #0
    215c:	d2800002 	mov	x2, #0x0                   	// #0
    2160:	52800180 	mov	w0, #0xc                   	// #12
    2164:	1400008f 	b	23a0 <syscall>
    2168:	d503201f 	nop
    216c:	d503201f 	nop

0000000000002170 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    2170:	aa0003e1 	mov	x1, x0
    2174:	d2800004 	mov	x4, #0x0                   	// #0
    2178:	d2800003 	mov	x3, #0x0                   	// #0
    217c:	d2800002 	mov	x2, #0x0                   	// #0
    2180:	528000a0 	mov	w0, #0x5                   	// #5
    2184:	14000087 	b	23a0 <syscall>
    2188:	d503201f 	nop
    218c:	d503201f 	nop

0000000000002190 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    2190:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    2194:	aa0203e3 	mov	x3, x2
    2198:	aa0003e1 	mov	x1, x0
    219c:	528000c0 	mov	w0, #0x6                   	// #6
    21a0:	93407c82 	sxtw	x2, w4
    21a4:	d2800004 	mov	x4, #0x0                   	// #0
    21a8:	1400007e 	b	23a0 <syscall>
    21ac:	d503201f 	nop

00000000000021b0 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    21b0:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    21b4:	d2800004 	mov	x4, #0x0                   	// #0
    21b8:	aa0003e1 	mov	x1, x0
    21bc:	d2800003 	mov	x3, #0x0                   	// #0
    21c0:	528000e0 	mov	w0, #0x7                   	// #7
    21c4:	14000077 	b	23a0 <syscall>
    21c8:	d503201f 	nop
    21cc:	d503201f 	nop

00000000000021d0 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    21d0:	aa0003e1 	mov	x1, x0
    21d4:	d2800004 	mov	x4, #0x0                   	// #0
    21d8:	d2800003 	mov	x3, #0x0                   	// #0
    21dc:	d2800002 	mov	x2, #0x0                   	// #0
    21e0:	52800100 	mov	w0, #0x8                   	// #8
    21e4:	1400006f 	b	23a0 <syscall>
    21e8:	d503201f 	nop
    21ec:	d503201f 	nop

00000000000021f0 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    21f0:	aa0003e2 	mov	x2, x0
    21f4:	d2800004 	mov	x4, #0x0                   	// #0
    21f8:	d2800003 	mov	x3, #0x0                   	// #0
    21fc:	d2800061 	mov	x1, #0x3                   	// #3
    2200:	52800140 	mov	w0, #0xa                   	// #10
    2204:	14000067 	b	23a0 <syscall>
    2208:	d503201f 	nop
    220c:	d503201f 	nop

0000000000002210 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    2210:	aa0003e2 	mov	x2, x0
    2214:	d2800004 	mov	x4, #0x0                   	// #0
    2218:	d2800003 	mov	x3, #0x0                   	// #0
    221c:	d2800021 	mov	x1, #0x1                   	// #1
    2220:	52800140 	mov	w0, #0xa                   	// #10
    2224:	1400005f 	b	23a0 <syscall>
    2228:	d503201f 	nop
    222c:	d503201f 	nop

0000000000002230 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    2230:	d2800004 	mov	x4, #0x0                   	// #0
    2234:	d2800003 	mov	x3, #0x0                   	// #0
    2238:	d2800002 	mov	x2, #0x0                   	// #0
    223c:	d2800041 	mov	x1, #0x2                   	// #2
    2240:	52800140 	mov	w0, #0xa                   	// #10
    2244:	14000057 	b	23a0 <syscall>
    2248:	d503201f 	nop
    224c:	d503201f 	nop

0000000000002250 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    2250:	d2800004 	mov	x4, #0x0                   	// #0
    2254:	d2800003 	mov	x3, #0x0                   	// #0
    2258:	d2800002 	mov	x2, #0x0                   	// #0
    225c:	d2800081 	mov	x1, #0x4                   	// #4
    2260:	52800140 	mov	w0, #0xa                   	// #10
    2264:	1400004f 	b	23a0 <syscall>
    2268:	d503201f 	nop
    226c:	d503201f 	nop

0000000000002270 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    2270:	d2800004 	mov	x4, #0x0                   	// #0
    2274:	d2800003 	mov	x3, #0x0                   	// #0
    2278:	d2800002 	mov	x2, #0x0                   	// #0
    227c:	d28000a1 	mov	x1, #0x5                   	// #5
    2280:	52800140 	mov	w0, #0xa                   	// #10
    2284:	14000047 	b	23a0 <syscall>
    2288:	d503201f 	nop
    228c:	d503201f 	nop

0000000000002290 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    2290:	d2800004 	mov	x4, #0x0                   	// #0
    2294:	d2800003 	mov	x3, #0x0                   	// #0
    2298:	d2800002 	mov	x2, #0x0                   	// #0
    229c:	d28000c1 	mov	x1, #0x6                   	// #6
    22a0:	52800140 	mov	w0, #0xa                   	// #10
    22a4:	1400003f 	b	23a0 <syscall>
    22a8:	d503201f 	nop
    22ac:	d503201f 	nop

00000000000022b0 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    22b0:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    22b4:	92401c64 	and	x4, x3, #0xff
    22b8:	aa0103e2 	mov	x2, x1
    22bc:	aa0003e1 	mov	x1, x0
    22c0:	93407ca3 	sxtw	x3, w5
    22c4:	52800080 	mov	w0, #0x4                   	// #4
    22c8:	14000036 	b	23a0 <syscall>
    22cc:	d503201f 	nop

00000000000022d0 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    22d0:	93407c22 	sxtw	x2, w1
    22d4:	d2800004 	mov	x4, #0x0                   	// #0
    22d8:	93407c01 	sxtw	x1, w0
    22dc:	d2800003 	mov	x3, #0x0                   	// #0
    22e0:	52800160 	mov	w0, #0xb                   	// #11
    22e4:	1400002f 	b	23a0 <syscall>
    22e8:	d503201f 	nop
    22ec:	d503201f 	nop

00000000000022f0 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    22f0:	93407c02 	sxtw	x2, w0
    22f4:	d2800004 	mov	x4, #0x0                   	// #0
    22f8:	d2800003 	mov	x3, #0x0                   	// #0
    22fc:	d2800001 	mov	x1, #0x0                   	// #0
    2300:	528001a0 	mov	w0, #0xd                   	// #13
    2304:	14000027 	b	23a0 <syscall>
    2308:	d503201f 	nop
    230c:	d503201f 	nop

0000000000002310 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    2310:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2314:	93407c02 	sxtw	x2, w0
    2318:	d2800004 	mov	x4, #0x0                   	// #0
{
    231c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2320:	d2800003 	mov	x3, #0x0                   	// #0
    2324:	d2800021 	mov	x1, #0x1                   	// #1
    2328:	528001a0 	mov	w0, #0xd                   	// #13
    232c:	9400001d 	bl	23a0 <syscall>
    2330:	7100001f 	cmp	w0, #0x0
}
    2334:	1a9f07e0 	cset	w0, ne  // ne = any
    2338:	a8c17bfd 	ldp	x29, x30, [sp], #16
    233c:	d65f03c0 	ret

0000000000002340 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    2340:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2344:	93407c02 	sxtw	x2, w0
    2348:	d2800004 	mov	x4, #0x0                   	// #0
{
    234c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2350:	d2800003 	mov	x3, #0x0                   	// #0
    2354:	d2800061 	mov	x1, #0x3                   	// #3
    2358:	528001a0 	mov	w0, #0xd                   	// #13
    235c:	94000011 	bl	23a0 <syscall>
    2360:	7100001f 	cmp	w0, #0x0
}
    2364:	1a9f07e0 	cset	w0, ne  // ne = any
    2368:	a8c17bfd 	ldp	x29, x30, [sp], #16
    236c:	d65f03c0 	ret

0000000000002370 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    2370:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2374:	93407c02 	sxtw	x2, w0
    2378:	d2800004 	mov	x4, #0x0                   	// #0
{
    237c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2380:	d2800003 	mov	x3, #0x0                   	// #0
    2384:	d2800041 	mov	x1, #0x2                   	// #2
    2388:	528001a0 	mov	w0, #0xd                   	// #13
    238c:	94000005 	bl	23a0 <syscall>
    2390:	7100001f 	cmp	w0, #0x0
    2394:	1a9f07e0 	cset	w0, ne  // ne = any
    2398:	a8c17bfd 	ldp	x29, x30, [sp], #16
    239c:	d65f03c0 	ret

00000000000023a0 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    23a0:	2a0003e5 	mov	w5, w0
    23a4:	aa0103e6 	mov	x6, x1
    23a8:	aa0203e7 	mov	x7, x2
    23ac:	aa0303e8 	mov	x8, x3
    23b0:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    23b4:	aa0503e0 	mov	x0, x5
    23b8:	aa0603e1 	mov	x1, x6
    23bc:	aa0703e2 	mov	x2, x7
    23c0:	aa0803e3 	mov	x3, x8
    23c4:	aa0903e4 	mov	x4, x9
    23c8:	d4000001 	svc	#0x0
    23cc:	d5033b9f 	dsb	ish
    23d0:	d5033fdf 	isb
    23d4:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    23d8:	2a0503e0 	mov	w0, w5
    23dc:	d65f03c0 	ret

00000000000023e0 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    23e0:	14000000 	b	23e0 <_exit>
    23e4:	d503201f 	nop
    23e8:	d503201f 	nop
    23ec:	d503201f 	nop

00000000000023f0 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    23f0:	d0000003 	adrp	x3, 4000 <__malloc_av_+0x6d8>
    23f4:	f9446c61 	ldr	x1, [x3, #2264]
    23f8:	d0000002 	adrp	x2, 4000 <__malloc_av_+0x6d8>
    23fc:	9124a042 	add	x2, x2, #0x928
    2400:	f100003f 	cmp	x1, #0x0
    2404:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    2408:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    240c:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    2410:	f9046c62 	str	x2, [x3, #2264]
}
    2414:	d65f03c0 	ret
    2418:	d503201f 	nop
    241c:	d503201f 	nop

0000000000002420 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    2420:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    2424:	d65f03c0 	ret
    2428:	d503201f 	nop
    242c:	d503201f 	nop

0000000000002430 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    2430:	12800000 	mov	w0, #0xffffffff            	// #-1
    2434:	d65f03c0 	ret
    2438:	d503201f 	nop
    243c:	d503201f 	nop

0000000000002440 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    2440:	52800000 	mov	w0, #0x0                   	// #0
    2444:	d65f03c0 	ret
    2448:	d503201f 	nop
    244c:	d503201f 	nop

0000000000002450 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    2450:	52800020 	mov	w0, #0x1                   	// #1
    2454:	d65f03c0 	ret
    2458:	d503201f 	nop
    245c:	d503201f 	nop

0000000000002460 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    2460:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    2464:	d65f03c0 	ret
    2468:	d503201f 	nop
    246c:	d503201f 	nop

0000000000002470 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    2470:	d2800000 	mov	x0, #0x0                   	// #0
    2474:	d65f03c0 	ret
    2478:	d503201f 	nop
    247c:	d503201f 	nop

0000000000002480 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    2480:	12800000 	mov	w0, #0xffffffff            	// #-1
    2484:	d65f03c0 	ret
    2488:	d503201f 	nop
    248c:	d503201f 	nop

0000000000002490 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    2490:	52800020 	mov	w0, #0x1                   	// #1
    2494:	d65f03c0 	ret
    2498:	d503201f 	nop
    249c:	d503201f 	nop

00000000000024a0 <atexit>:
    24a0:	aa0003e1 	mov	x1, x0
    24a4:	d2800003 	mov	x3, #0x0                   	// #0
    24a8:	d2800002 	mov	x2, #0x0                   	// #0
    24ac:	52800000 	mov	w0, #0x0                   	// #0
    24b0:	140002e8 	b	3050 <__register_exitproc>
    24b4:	d503201f 	nop
    24b8:	d503201f 	nop
    24bc:	d503201f 	nop

00000000000024c0 <__libc_fini_array>:
    24c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    24c4:	b0000001 	adrp	x1, 3000 <_sbrk_r>
    24c8:	b0000000 	adrp	x0, 3000 <_sbrk_r>
    24cc:	910003fd 	mov	x29, sp
    24d0:	a90153f3 	stp	x19, x20, [sp, #16]
    24d4:	f9446433 	ldr	x19, [x1, #2248]
    24d8:	f9446814 	ldr	x20, [x0, #2256]
    24dc:	cb140273 	sub	x19, x19, x20
    24e0:	9343fe73 	asr	x19, x19, #3
    24e4:	b40000b3 	cbz	x19, 24f8 <__libc_fini_array+0x38>
    24e8:	d1000673 	sub	x19, x19, #0x1
    24ec:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    24f0:	d63f0000 	blr	x0
    24f4:	b5ffffb3 	cbnz	x19, 24e8 <__libc_fini_array+0x28>
    24f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    24fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2500:	1400045d 	b	3674 <_fini>
    2504:	d503201f 	nop
    2508:	d503201f 	nop
    250c:	d503201f 	nop

0000000000002510 <__libc_init_array>:
    2510:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2514:	b0000001 	adrp	x1, 3000 <_sbrk_r>
    2518:	b0000000 	adrp	x0, 3000 <_sbrk_r>
    251c:	910003fd 	mov	x29, sp
    2520:	a90153f3 	stp	x19, x20, [sp, #16]
    2524:	f9446c34 	ldr	x20, [x1, #2264]
    2528:	f90013f5 	str	x21, [sp, #32]
    252c:	f9447015 	ldr	x21, [x0, #2272]
    2530:	cb150294 	sub	x20, x20, x21
    2534:	9343fe94 	asr	x20, x20, #3
    2538:	b40000f4 	cbz	x20, 2554 <__libc_init_array+0x44>
    253c:	d2800013 	mov	x19, #0x0                   	// #0
    2540:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    2544:	91000673 	add	x19, x19, #0x1
    2548:	d63f0000 	blr	x0
    254c:	eb13029f 	cmp	x20, x19
    2550:	54ffff81 	b.ne	2540 <__libc_init_array+0x30>  // b.any
    2554:	940ff6ab 	bl	400000 <_init>
    2558:	b0000001 	adrp	x1, 3000 <_sbrk_r>
    255c:	b0000000 	adrp	x0, 3000 <_sbrk_r>
    2560:	f9447434 	ldr	x20, [x1, #2280]
    2564:	f9447815 	ldr	x21, [x0, #2288]
    2568:	cb150294 	sub	x20, x20, x21
    256c:	9343fe94 	asr	x20, x20, #3
    2570:	b40000f4 	cbz	x20, 258c <__libc_init_array+0x7c>
    2574:	d2800013 	mov	x19, #0x0                   	// #0
    2578:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    257c:	91000673 	add	x19, x19, #0x1
    2580:	d63f0000 	blr	x0
    2584:	eb13029f 	cmp	x20, x19
    2588:	54ffff81 	b.ne	2578 <__libc_init_array+0x68>  // b.any
    258c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2590:	f94013f5 	ldr	x21, [sp, #32]
    2594:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2598:	d65f03c0 	ret
    259c:	d503201f 	nop

00000000000025a0 <malloc>:
    25a0:	d0000002 	adrp	x2, 4000 <__malloc_av_+0x6d8>
    25a4:	aa0003e1 	mov	x1, x0
    25a8:	f940a440 	ldr	x0, [x2, #328]
    25ac:	14000005 	b	25c0 <_malloc_r>

00000000000025b0 <free>:
    25b0:	d0000002 	adrp	x2, 4000 <__malloc_av_+0x6d8>
    25b4:	aa0003e1 	mov	x1, x0
    25b8:	f940a440 	ldr	x0, [x2, #328]
    25bc:	14000311 	b	3200 <_free_r>

00000000000025c0 <_malloc_r>:
    25c0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    25c4:	910003fd 	mov	x29, sp
    25c8:	a90153f3 	stp	x19, x20, [sp, #16]
    25cc:	91005c33 	add	x19, x1, #0x17
    25d0:	a9025bf5 	stp	x21, x22, [sp, #32]
    25d4:	aa0003f5 	mov	x21, x0
    25d8:	a90363f7 	stp	x23, x24, [sp, #48]
    25dc:	f100ba7f 	cmp	x19, #0x2e
    25e0:	54000c88 	b.hi	2770 <_malloc_r+0x1b0>  // b.pmore
    25e4:	f100803f 	cmp	x1, #0x20
    25e8:	54002068 	b.hi	29f4 <_malloc_r+0x434>  // b.pmore
    25ec:	9400027d 	bl	2fe0 <__malloc_lock>
    25f0:	d2800413 	mov	x19, #0x20                  	// #32
    25f4:	d2800a00 	mov	x0, #0x50                  	// #80
    25f8:	52800085 	mov	w5, #0x4                   	// #4
    25fc:	b0000014 	adrp	x20, 3000 <_sbrk_r>
    2600:	9124a294 	add	x20, x20, #0x928
    2604:	8b000280 	add	x0, x20, x0
    2608:	110008a5 	add	w5, w5, #0x2
    260c:	d1004000 	sub	x0, x0, #0x10
    2610:	f9400c01 	ldr	x1, [x0, #24]
    2614:	eb00003f 	cmp	x1, x0
    2618:	54002181 	b.ne	2a48 <_malloc_r+0x488>  // b.any
    261c:	f9401284 	ldr	x4, [x20, #32]
    2620:	91004282 	add	x2, x20, #0x10
    2624:	eb02009f 	cmp	x4, x2
    2628:	54000f20 	b.eq	280c <_malloc_r+0x24c>  // b.none
    262c:	f9400481 	ldr	x1, [x4, #8]
    2630:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    2634:	cb130023 	sub	x3, x1, x19
    2638:	f1007c7f 	cmp	x3, #0x1f
    263c:	54002d4c 	b.gt	2be4 <_malloc_r+0x624>
    2640:	a9020a82 	stp	x2, x2, [x20, #32]
    2644:	b6f81f23 	tbz	x3, #63, 2a28 <_malloc_r+0x468>
    2648:	f107fc3f 	cmp	x1, #0x1ff
    264c:	54002428 	b.hi	2ad0 <_malloc_r+0x510>  // b.pmore
    2650:	d343fc22 	lsr	x2, x1, #3
    2654:	d2800021 	mov	x1, #0x1                   	// #1
    2658:	11000440 	add	w0, w2, #0x1
    265c:	13027c42 	asr	w2, w2, #2
    2660:	531f7800 	lsl	w0, w0, #1
    2664:	f9400683 	ldr	x3, [x20, #8]
    2668:	8b20ce80 	add	x0, x20, w0, sxtw #3
    266c:	9ac22021 	lsl	x1, x1, x2
    2670:	aa030021 	orr	x1, x1, x3
    2674:	f85f0402 	ldr	x2, [x0], #-16
    2678:	f9000681 	str	x1, [x20, #8]
    267c:	a9010082 	stp	x2, x0, [x4, #16]
    2680:	f9000804 	str	x4, [x0, #16]
    2684:	f9000c44 	str	x4, [x2, #24]
    2688:	13027ca2 	asr	w2, w5, #2
    268c:	d2800020 	mov	x0, #0x1                   	// #1
    2690:	9ac22000 	lsl	x0, x0, x2
    2694:	eb01001f 	cmp	x0, x1
    2698:	54000c68 	b.hi	2824 <_malloc_r+0x264>  // b.pmore
    269c:	ea01001f 	tst	x0, x1
    26a0:	540000c1 	b.ne	26b8 <_malloc_r+0xf8>  // b.any
    26a4:	121e74a5 	and	w5, w5, #0xfffffffc
    26a8:	d37ff800 	lsl	x0, x0, #1
    26ac:	110010a5 	add	w5, w5, #0x4
    26b0:	ea01001f 	tst	x0, x1
    26b4:	54ffffa0 	b.eq	26a8 <_malloc_r+0xe8>  // b.none
    26b8:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    26bc:	110004a7 	add	w7, w5, #0x1
    26c0:	2a0503e8 	mov	w8, w5
    26c4:	531f78e7 	lsl	w7, w7, #1
    26c8:	8b27cd27 	add	x7, x9, w7, sxtw #3
    26cc:	8b070287 	add	x7, x20, x7
    26d0:	aa0703e4 	mov	x4, x7
    26d4:	f9400c81 	ldr	x1, [x4, #24]
    26d8:	14000009 	b	26fc <_malloc_r+0x13c>
    26dc:	f9400422 	ldr	x2, [x1, #8]
    26e0:	aa0103e6 	mov	x6, x1
    26e4:	f9400c21 	ldr	x1, [x1, #24]
    26e8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    26ec:	cb130043 	sub	x3, x2, x19
    26f0:	f1007c7f 	cmp	x3, #0x1f
    26f4:	5400238c 	b.gt	2b64 <_malloc_r+0x5a4>
    26f8:	b6f82563 	tbz	x3, #63, 2ba4 <_malloc_r+0x5e4>
    26fc:	eb01009f 	cmp	x4, x1
    2700:	54fffee1 	b.ne	26dc <_malloc_r+0x11c>  // b.any
    2704:	7100f91f 	cmp	w8, #0x3e
    2708:	540029cd 	b.le	2c40 <_malloc_r+0x680>
    270c:	91004084 	add	x4, x4, #0x10
    2710:	11000508 	add	w8, w8, #0x1
    2714:	f240051f 	tst	x8, #0x3
    2718:	54fffde1 	b.ne	26d4 <_malloc_r+0x114>  // b.any
    271c:	14000005 	b	2730 <_malloc_r+0x170>
    2720:	f85f04e1 	ldr	x1, [x7], #-16
    2724:	510004a5 	sub	w5, w5, #0x1
    2728:	eb07003f 	cmp	x1, x7
    272c:	540035a1 	b.ne	2de0 <_malloc_r+0x820>  // b.any
    2730:	f24004bf 	tst	x5, #0x3
    2734:	54ffff61 	b.ne	2720 <_malloc_r+0x160>  // b.any
    2738:	f9400681 	ldr	x1, [x20, #8]
    273c:	8a200021 	bic	x1, x1, x0
    2740:	f9000681 	str	x1, [x20, #8]
    2744:	d37ff800 	lsl	x0, x0, #1
    2748:	f100001f 	cmp	x0, #0x0
    274c:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    2750:	54000089 	b.ls	2760 <_malloc_r+0x1a0>  // b.plast
    2754:	14000034 	b	2824 <_malloc_r+0x264>
    2758:	d37ff800 	lsl	x0, x0, #1
    275c:	11001108 	add	w8, w8, #0x4
    2760:	ea01001f 	tst	x0, x1
    2764:	54ffffa0 	b.eq	2758 <_malloc_r+0x198>  // b.none
    2768:	2a0803e5 	mov	w5, w8
    276c:	17ffffd4 	b	26bc <_malloc_r+0xfc>
    2770:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    2774:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    2778:	eb02027f 	cmp	x19, x2
    277c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    2780:	540013a8 	b.hi	29f4 <_malloc_r+0x434>  // b.pmore
    2784:	94000217 	bl	2fe0 <__malloc_lock>
    2788:	f107de7f 	cmp	x19, #0x1f7
    278c:	54002229 	b.ls	2bd0 <_malloc_r+0x610>  // b.plast
    2790:	d349fe60 	lsr	x0, x19, #9
    2794:	b4001420 	cbz	x0, 2a18 <_malloc_r+0x458>
    2798:	f100101f 	cmp	x0, #0x4
    279c:	54001d08 	b.hi	2b3c <_malloc_r+0x57c>  // b.pmore
    27a0:	d346fe60 	lsr	x0, x19, #6
    27a4:	1100e405 	add	w5, w0, #0x39
    27a8:	1100e000 	add	w0, w0, #0x38
    27ac:	531f78a4 	lsl	w4, w5, #1
    27b0:	937d7c84 	sbfiz	x4, x4, #3, #32
    27b4:	b0000014 	adrp	x20, 3000 <_sbrk_r>
    27b8:	9124a294 	add	x20, x20, #0x928
    27bc:	8b040284 	add	x4, x20, x4
    27c0:	d1004084 	sub	x4, x4, #0x10
    27c4:	f9400c81 	ldr	x1, [x4, #24]
    27c8:	eb01009f 	cmp	x4, x1
    27cc:	540000c1 	b.ne	27e4 <_malloc_r+0x224>  // b.any
    27d0:	17ffff93 	b	261c <_malloc_r+0x5c>
    27d4:	b6f815e3 	tbz	x3, #63, 2a90 <_malloc_r+0x4d0>
    27d8:	f9400c21 	ldr	x1, [x1, #24]
    27dc:	eb01009f 	cmp	x4, x1
    27e0:	54fff1e0 	b.eq	261c <_malloc_r+0x5c>  // b.none
    27e4:	f9400422 	ldr	x2, [x1, #8]
    27e8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    27ec:	cb130043 	sub	x3, x2, x19
    27f0:	f1007c7f 	cmp	x3, #0x1f
    27f4:	54ffff0d 	b.le	27d4 <_malloc_r+0x214>
    27f8:	f9401284 	ldr	x4, [x20, #32]
    27fc:	91004282 	add	x2, x20, #0x10
    2800:	2a0003e5 	mov	w5, w0
    2804:	eb02009f 	cmp	x4, x2
    2808:	54fff121 	b.ne	262c <_malloc_r+0x6c>  // b.any
    280c:	f9400681 	ldr	x1, [x20, #8]
    2810:	13027ca2 	asr	w2, w5, #2
    2814:	d2800020 	mov	x0, #0x1                   	// #1
    2818:	9ac22000 	lsl	x0, x0, x2
    281c:	eb01001f 	cmp	x0, x1
    2820:	54fff3e9 	b.ls	269c <_malloc_r+0xdc>  // b.plast
    2824:	f9400a97 	ldr	x23, [x20, #16]
    2828:	f94006f6 	ldr	x22, [x23, #8]
    282c:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    2830:	eb18027f 	cmp	x19, x24
    2834:	cb130300 	sub	x0, x24, x19
    2838:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    283c:	54000bec 	b.gt	29b8 <_malloc_r+0x3f8>
    2840:	d0000001 	adrp	x1, 4000 <__malloc_av_+0x6d8>
    2844:	a90573fb 	stp	x27, x28, [sp, #80]
    2848:	d000001b 	adrp	x27, 4000 <__malloc_av_+0x6d8>
    284c:	f9448c21 	ldr	x1, [x1, #2328]
    2850:	d28203e3 	mov	x3, #0x101f                	// #4127
    2854:	f9409f62 	ldr	x2, [x27, #312]
    2858:	8b010261 	add	x1, x19, x1
    285c:	8b030036 	add	x22, x1, x3
    2860:	91008021 	add	x1, x1, #0x20
    2864:	b100045f 	cmn	x2, #0x1
    2868:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    286c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    2870:	aa1503e0 	mov	x0, x21
    2874:	aa1603e1 	mov	x1, x22
    2878:	a9046bf9 	stp	x25, x26, [sp, #64]
    287c:	940001e1 	bl	3000 <_sbrk_r>
    2880:	8b1802fa 	add	x26, x23, x24
    2884:	aa0003f9 	mov	x25, x0
    2888:	b100041f 	cmn	x0, #0x1
    288c:	54001f20 	b.eq	2c70 <_malloc_r+0x6b0>  // b.none
    2890:	eb00035f 	cmp	x26, x0
    2894:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    2898:	54001ec1 	b.ne	2c70 <_malloc_r+0x6b0>  // b.any
    289c:	d000001c 	adrp	x28, 4000 <__malloc_av_+0x6d8>
    28a0:	b948e381 	ldr	w1, [x28, #2272]
    28a4:	0b160021 	add	w1, w1, w22
    28a8:	b908e381 	str	w1, [x28, #2272]
    28ac:	eb00035f 	cmp	x26, x0
    28b0:	54001ce0 	b.eq	2c4c <_malloc_r+0x68c>  // b.none
    28b4:	f9409f60 	ldr	x0, [x27, #312]
    28b8:	b100041f 	cmn	x0, #0x1
    28bc:	54001d60 	b.eq	2c68 <_malloc_r+0x6a8>  // b.none
    28c0:	cb1a033a 	sub	x26, x25, x26
    28c4:	0b1a0021 	add	w1, w1, w26
    28c8:	b908e381 	str	w1, [x28, #2272]
    28cc:	f2400f3a 	ands	x26, x25, #0xf
    28d0:	54001e40 	b.eq	2c98 <_malloc_r+0x6d8>  // b.none
    28d4:	cb1a0339 	sub	x25, x25, x26
    28d8:	d2820201 	mov	x1, #0x1010                	// #4112
    28dc:	91004339 	add	x25, x25, #0x10
    28e0:	cb1a0021 	sub	x1, x1, x26
    28e4:	8b16033b 	add	x27, x25, x22
    28e8:	aa1503e0 	mov	x0, x21
    28ec:	cb1b0036 	sub	x22, x1, x27
    28f0:	92402ed6 	and	x22, x22, #0xfff
    28f4:	aa1603e1 	mov	x1, x22
    28f8:	940001c2 	bl	3000 <_sbrk_r>
    28fc:	b100041f 	cmn	x0, #0x1
    2900:	54002480 	b.eq	2d90 <_malloc_r+0x7d0>  // b.none
    2904:	cb190000 	sub	x0, x0, x25
    2908:	2a1603e2 	mov	w2, w22
    290c:	8b160016 	add	x22, x0, x22
    2910:	b948e381 	ldr	w1, [x28, #2272]
    2914:	b24002d6 	orr	x22, x22, #0x1
    2918:	f9000a99 	str	x25, [x20, #16]
    291c:	0b010041 	add	w1, w2, w1
    2920:	b908e381 	str	w1, [x28, #2272]
    2924:	f9000736 	str	x22, [x25, #8]
    2928:	eb1402ff 	cmp	x23, x20
    292c:	54002000 	b.eq	2d2c <_malloc_r+0x76c>  // b.none
    2930:	f1007f1f 	cmp	x24, #0x1f
    2934:	54001cc9 	b.ls	2ccc <_malloc_r+0x70c>  // b.plast
    2938:	d1006300 	sub	x0, x24, #0x18
    293c:	d2800124 	mov	x4, #0x9                   	// #9
    2940:	f94006e2 	ldr	x2, [x23, #8]
    2944:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    2948:	8b0002e3 	add	x3, x23, x0
    294c:	92400042 	and	x2, x2, #0x1
    2950:	aa000042 	orr	x2, x2, x0
    2954:	f90006e2 	str	x2, [x23, #8]
    2958:	f8008c64 	str	x4, [x3, #8]!
    295c:	f9000464 	str	x4, [x3, #8]
    2960:	f1007c1f 	cmp	x0, #0x1f
    2964:	54002088 	b.hi	2d74 <_malloc_r+0x7b4>  // b.pmore
    2968:	f9400736 	ldr	x22, [x25, #8]
    296c:	aa1903f7 	mov	x23, x25
    2970:	d0000000 	adrp	x0, 4000 <__malloc_av_+0x6d8>
    2974:	93407c21 	sxtw	x1, w1
    2978:	f9448402 	ldr	x2, [x0, #2312]
    297c:	eb02003f 	cmp	x1, x2
    2980:	54000049 	b.ls	2988 <_malloc_r+0x3c8>  // b.plast
    2984:	f9048401 	str	x1, [x0, #2312]
    2988:	d0000000 	adrp	x0, 4000 <__malloc_av_+0x6d8>
    298c:	f9448802 	ldr	x2, [x0, #2320]
    2990:	eb02003f 	cmp	x1, x2
    2994:	54000049 	b.ls	299c <_malloc_r+0x3dc>  // b.plast
    2998:	f9048801 	str	x1, [x0, #2320]
    299c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    29a0:	eb00027f 	cmp	x19, x0
    29a4:	cb130000 	sub	x0, x0, x19
    29a8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    29ac:	5400194d 	b.le	2cd4 <_malloc_r+0x714>
    29b0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    29b4:	a94573fb 	ldp	x27, x28, [sp, #80]
    29b8:	8b1302e2 	add	x2, x23, x19
    29bc:	b2400273 	orr	x19, x19, #0x1
    29c0:	f90006f3 	str	x19, [x23, #8]
    29c4:	b2400001 	orr	x1, x0, #0x1
    29c8:	f9000a82 	str	x2, [x20, #16]
    29cc:	f9000441 	str	x1, [x2, #8]
    29d0:	aa1503e0 	mov	x0, x21
    29d4:	910042f7 	add	x23, x23, #0x10
    29d8:	94000186 	bl	2ff0 <__malloc_unlock>
    29dc:	aa1703e0 	mov	x0, x23
    29e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    29e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    29e8:	a94363f7 	ldp	x23, x24, [sp, #48]
    29ec:	a8c67bfd 	ldp	x29, x30, [sp], #96
    29f0:	d65f03c0 	ret
    29f4:	52800180 	mov	w0, #0xc                   	// #12
    29f8:	d2800017 	mov	x23, #0x0                   	// #0
    29fc:	b90002a0 	str	w0, [x21]
    2a00:	aa1703e0 	mov	x0, x23
    2a04:	a94153f3 	ldp	x19, x20, [sp, #16]
    2a08:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2a0c:	a94363f7 	ldp	x23, x24, [sp, #48]
    2a10:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2a14:	d65f03c0 	ret
    2a18:	d2808004 	mov	x4, #0x400                 	// #1024
    2a1c:	52800805 	mov	w5, #0x40                  	// #64
    2a20:	528007e0 	mov	w0, #0x3f                  	// #63
    2a24:	17ffff64 	b	27b4 <_malloc_r+0x1f4>
    2a28:	8b010081 	add	x1, x4, x1
    2a2c:	aa1503e0 	mov	x0, x21
    2a30:	91004097 	add	x23, x4, #0x10
    2a34:	f9400422 	ldr	x2, [x1, #8]
    2a38:	b2400042 	orr	x2, x2, #0x1
    2a3c:	f9000422 	str	x2, [x1, #8]
    2a40:	9400016c 	bl	2ff0 <__malloc_unlock>
    2a44:	17ffffef 	b	2a00 <_malloc_r+0x440>
    2a48:	a9409022 	ldp	x2, x4, [x1, #8]
    2a4c:	91004037 	add	x23, x1, #0x10
    2a50:	f9400c23 	ldr	x3, [x1, #24]
    2a54:	aa1503e0 	mov	x0, x21
    2a58:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    2a5c:	8b020022 	add	x2, x1, x2
    2a60:	f9400441 	ldr	x1, [x2, #8]
    2a64:	f9000c83 	str	x3, [x4, #24]
    2a68:	f9000864 	str	x4, [x3, #16]
    2a6c:	b2400021 	orr	x1, x1, #0x1
    2a70:	f9000441 	str	x1, [x2, #8]
    2a74:	9400015f 	bl	2ff0 <__malloc_unlock>
    2a78:	aa1703e0 	mov	x0, x23
    2a7c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2a80:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2a84:	a94363f7 	ldp	x23, x24, [sp, #48]
    2a88:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2a8c:	d65f03c0 	ret
    2a90:	8b020022 	add	x2, x1, x2
    2a94:	91004037 	add	x23, x1, #0x10
    2a98:	a9410c24 	ldp	x4, x3, [x1, #16]
    2a9c:	aa1503e0 	mov	x0, x21
    2aa0:	f9400441 	ldr	x1, [x2, #8]
    2aa4:	f9000c83 	str	x3, [x4, #24]
    2aa8:	b2400021 	orr	x1, x1, #0x1
    2aac:	f9000864 	str	x4, [x3, #16]
    2ab0:	f9000441 	str	x1, [x2, #8]
    2ab4:	9400014f 	bl	2ff0 <__malloc_unlock>
    2ab8:	aa1703e0 	mov	x0, x23
    2abc:	a94153f3 	ldp	x19, x20, [sp, #16]
    2ac0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2ac4:	a94363f7 	ldp	x23, x24, [sp, #48]
    2ac8:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2acc:	d65f03c0 	ret
    2ad0:	d349fc20 	lsr	x0, x1, #9
    2ad4:	f127fc3f 	cmp	x1, #0x9ff
    2ad8:	540009e9 	b.ls	2c14 <_malloc_r+0x654>  // b.plast
    2adc:	f100501f 	cmp	x0, #0x14
    2ae0:	54001068 	b.hi	2cec <_malloc_r+0x72c>  // b.pmore
    2ae4:	11017003 	add	w3, w0, #0x5c
    2ae8:	11016c02 	add	w2, w0, #0x5b
    2aec:	531f7863 	lsl	w3, w3, #1
    2af0:	937d7c63 	sbfiz	x3, x3, #3, #32
    2af4:	8b030283 	add	x3, x20, x3
    2af8:	f85f0460 	ldr	x0, [x3], #-16
    2afc:	eb00007f 	cmp	x3, x0
    2b00:	54000be0 	b.eq	2c7c <_malloc_r+0x6bc>  // b.none
    2b04:	d503201f 	nop
    2b08:	f9400402 	ldr	x2, [x0, #8]
    2b0c:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    2b10:	eb01005f 	cmp	x2, x1
    2b14:	54000089 	b.ls	2b24 <_malloc_r+0x564>  // b.plast
    2b18:	f9400800 	ldr	x0, [x0, #16]
    2b1c:	eb00007f 	cmp	x3, x0
    2b20:	54ffff41 	b.ne	2b08 <_malloc_r+0x548>  // b.any
    2b24:	f9400681 	ldr	x1, [x20, #8]
    2b28:	f9400c03 	ldr	x3, [x0, #24]
    2b2c:	a9010c80 	stp	x0, x3, [x4, #16]
    2b30:	f9000864 	str	x4, [x3, #16]
    2b34:	f9000c04 	str	x4, [x0, #24]
    2b38:	17fffed4 	b	2688 <_malloc_r+0xc8>
    2b3c:	f100501f 	cmp	x0, #0x14
    2b40:	54000769 	b.ls	2c2c <_malloc_r+0x66c>  // b.plast
    2b44:	f101501f 	cmp	x0, #0x54
    2b48:	54000e28 	b.hi	2d0c <_malloc_r+0x74c>  // b.pmore
    2b4c:	d34cfe60 	lsr	x0, x19, #12
    2b50:	1101bc05 	add	w5, w0, #0x6f
    2b54:	1101b800 	add	w0, w0, #0x6e
    2b58:	531f78a4 	lsl	w4, w5, #1
    2b5c:	937d7c84 	sbfiz	x4, x4, #3, #32
    2b60:	17ffff15 	b	27b4 <_malloc_r+0x1f4>
    2b64:	f94008c7 	ldr	x7, [x6, #16]
    2b68:	b2400260 	orr	x0, x19, #0x1
    2b6c:	f90004c0 	str	x0, [x6, #8]
    2b70:	8b1300c4 	add	x4, x6, x19
    2b74:	91004285 	add	x5, x20, #0x10
    2b78:	b2400068 	orr	x8, x3, #0x1
    2b7c:	f9000ce1 	str	x1, [x7, #24]
    2b80:	910040d7 	add	x23, x6, #0x10
    2b84:	f9000827 	str	x7, [x1, #16]
    2b88:	aa1503e0 	mov	x0, x21
    2b8c:	a9021284 	stp	x4, x4, [x20, #32]
    2b90:	a9009488 	stp	x8, x5, [x4, #8]
    2b94:	f9000c85 	str	x5, [x4, #24]
    2b98:	f82268c3 	str	x3, [x6, x2]
    2b9c:	94000115 	bl	2ff0 <__malloc_unlock>
    2ba0:	17ffff98 	b	2a00 <_malloc_r+0x440>
    2ba4:	8b0200c2 	add	x2, x6, x2
    2ba8:	aa0603f7 	mov	x23, x6
    2bac:	aa1503e0 	mov	x0, x21
    2bb0:	f9400443 	ldr	x3, [x2, #8]
    2bb4:	f8410ee4 	ldr	x4, [x23, #16]!
    2bb8:	b2400063 	orr	x3, x3, #0x1
    2bbc:	f9000443 	str	x3, [x2, #8]
    2bc0:	f9000c81 	str	x1, [x4, #24]
    2bc4:	f9000824 	str	x4, [x1, #16]
    2bc8:	9400010a 	bl	2ff0 <__malloc_unlock>
    2bcc:	17ffff8d 	b	2a00 <_malloc_r+0x440>
    2bd0:	d343fe65 	lsr	x5, x19, #3
    2bd4:	110004a0 	add	w0, w5, #0x1
    2bd8:	531f7800 	lsl	w0, w0, #1
    2bdc:	937d7c00 	sbfiz	x0, x0, #3, #32
    2be0:	17fffe87 	b	25fc <_malloc_r+0x3c>
    2be4:	8b130085 	add	x5, x4, x19
    2be8:	b2400273 	orr	x19, x19, #0x1
    2bec:	f9000493 	str	x19, [x4, #8]
    2bf0:	b2400066 	orr	x6, x3, #0x1
    2bf4:	a9021685 	stp	x5, x5, [x20, #32]
    2bf8:	aa1503e0 	mov	x0, x21
    2bfc:	91004097 	add	x23, x4, #0x10
    2c00:	a90088a6 	stp	x6, x2, [x5, #8]
    2c04:	f9000ca2 	str	x2, [x5, #24]
    2c08:	f8216883 	str	x3, [x4, x1]
    2c0c:	940000f9 	bl	2ff0 <__malloc_unlock>
    2c10:	17ffff7c 	b	2a00 <_malloc_r+0x440>
    2c14:	d346fc20 	lsr	x0, x1, #6
    2c18:	1100e403 	add	w3, w0, #0x39
    2c1c:	1100e002 	add	w2, w0, #0x38
    2c20:	531f7863 	lsl	w3, w3, #1
    2c24:	937d7c63 	sbfiz	x3, x3, #3, #32
    2c28:	17ffffb3 	b	2af4 <_malloc_r+0x534>
    2c2c:	11017005 	add	w5, w0, #0x5c
    2c30:	11016c00 	add	w0, w0, #0x5b
    2c34:	531f78a4 	lsl	w4, w5, #1
    2c38:	937d7c84 	sbfiz	x4, x4, #3, #32
    2c3c:	17fffede 	b	27b4 <_malloc_r+0x1f4>
    2c40:	11000508 	add	w8, w8, #0x1
    2c44:	91008084 	add	x4, x4, #0x20
    2c48:	17fffeb2 	b	2710 <_malloc_r+0x150>
    2c4c:	f2402f5f 	tst	x26, #0xfff
    2c50:	54ffe321 	b.ne	28b4 <_malloc_r+0x2f4>  // b.any
    2c54:	f9400a97 	ldr	x23, [x20, #16]
    2c58:	8b160316 	add	x22, x24, x22
    2c5c:	b24002d6 	orr	x22, x22, #0x1
    2c60:	f90006f6 	str	x22, [x23, #8]
    2c64:	17ffff43 	b	2970 <_malloc_r+0x3b0>
    2c68:	f9009f79 	str	x25, [x27, #312]
    2c6c:	17ffff18 	b	28cc <_malloc_r+0x30c>
    2c70:	f9400a97 	ldr	x23, [x20, #16]
    2c74:	f94006f6 	ldr	x22, [x23, #8]
    2c78:	17ffff49 	b	299c <_malloc_r+0x3dc>
    2c7c:	f9400686 	ldr	x6, [x20, #8]
    2c80:	13027c42 	asr	w2, w2, #2
    2c84:	d2800021 	mov	x1, #0x1                   	// #1
    2c88:	9ac22021 	lsl	x1, x1, x2
    2c8c:	aa060021 	orr	x1, x1, x6
    2c90:	f9000681 	str	x1, [x20, #8]
    2c94:	17ffffa6 	b	2b2c <_malloc_r+0x56c>
    2c98:	8b16033a 	add	x26, x25, x22
    2c9c:	aa1503e0 	mov	x0, x21
    2ca0:	cb1a03fa 	neg	x26, x26
    2ca4:	92402f5a 	and	x26, x26, #0xfff
    2ca8:	aa1a03e1 	mov	x1, x26
    2cac:	940000d5 	bl	3000 <_sbrk_r>
    2cb0:	52800002 	mov	w2, #0x0                   	// #0
    2cb4:	b100041f 	cmn	x0, #0x1
    2cb8:	54ffe2c0 	b.eq	2910 <_malloc_r+0x350>  // b.none
    2cbc:	cb190000 	sub	x0, x0, x25
    2cc0:	2a1a03e2 	mov	w2, w26
    2cc4:	8b1a0016 	add	x22, x0, x26
    2cc8:	17ffff12 	b	2910 <_malloc_r+0x350>
    2ccc:	d2800020 	mov	x0, #0x1                   	// #1
    2cd0:	f9000720 	str	x0, [x25, #8]
    2cd4:	aa1503e0 	mov	x0, x21
    2cd8:	d2800017 	mov	x23, #0x0                   	// #0
    2cdc:	940000c5 	bl	2ff0 <__malloc_unlock>
    2ce0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2ce4:	a94573fb 	ldp	x27, x28, [sp, #80]
    2ce8:	17ffff46 	b	2a00 <_malloc_r+0x440>
    2cec:	f101501f 	cmp	x0, #0x54
    2cf0:	54000228 	b.hi	2d34 <_malloc_r+0x774>  // b.pmore
    2cf4:	d34cfc20 	lsr	x0, x1, #12
    2cf8:	1101bc03 	add	w3, w0, #0x6f
    2cfc:	1101b802 	add	w2, w0, #0x6e
    2d00:	531f7863 	lsl	w3, w3, #1
    2d04:	937d7c63 	sbfiz	x3, x3, #3, #32
    2d08:	17ffff7b 	b	2af4 <_malloc_r+0x534>
    2d0c:	f105501f 	cmp	x0, #0x154
    2d10:	54000228 	b.hi	2d54 <_malloc_r+0x794>  // b.pmore
    2d14:	d34ffe60 	lsr	x0, x19, #15
    2d18:	1101e005 	add	w5, w0, #0x78
    2d1c:	1101dc00 	add	w0, w0, #0x77
    2d20:	531f78a4 	lsl	w4, w5, #1
    2d24:	937d7c84 	sbfiz	x4, x4, #3, #32
    2d28:	17fffea3 	b	27b4 <_malloc_r+0x1f4>
    2d2c:	aa1903f7 	mov	x23, x25
    2d30:	17ffff10 	b	2970 <_malloc_r+0x3b0>
    2d34:	f105501f 	cmp	x0, #0x154
    2d38:	54000368 	b.hi	2da4 <_malloc_r+0x7e4>  // b.pmore
    2d3c:	d34ffc20 	lsr	x0, x1, #15
    2d40:	1101e003 	add	w3, w0, #0x78
    2d44:	1101dc02 	add	w2, w0, #0x77
    2d48:	531f7863 	lsl	w3, w3, #1
    2d4c:	937d7c63 	sbfiz	x3, x3, #3, #32
    2d50:	17ffff69 	b	2af4 <_malloc_r+0x534>
    2d54:	f115501f 	cmp	x0, #0x554
    2d58:	54000368 	b.hi	2dc4 <_malloc_r+0x804>  // b.pmore
    2d5c:	d352fe60 	lsr	x0, x19, #18
    2d60:	1101f405 	add	w5, w0, #0x7d
    2d64:	1101f000 	add	w0, w0, #0x7c
    2d68:	531f78a4 	lsl	w4, w5, #1
    2d6c:	937d7c84 	sbfiz	x4, x4, #3, #32
    2d70:	17fffe91 	b	27b4 <_malloc_r+0x1f4>
    2d74:	910042e1 	add	x1, x23, #0x10
    2d78:	aa1503e0 	mov	x0, x21
    2d7c:	94000121 	bl	3200 <_free_r>
    2d80:	f9400a97 	ldr	x23, [x20, #16]
    2d84:	b948e381 	ldr	w1, [x28, #2272]
    2d88:	f94006f6 	ldr	x22, [x23, #8]
    2d8c:	17fffef9 	b	2970 <_malloc_r+0x3b0>
    2d90:	d100435a 	sub	x26, x26, #0x10
    2d94:	52800002 	mov	w2, #0x0                   	// #0
    2d98:	8b1a0376 	add	x22, x27, x26
    2d9c:	cb1902d6 	sub	x22, x22, x25
    2da0:	17fffedc 	b	2910 <_malloc_r+0x350>
    2da4:	f115501f 	cmp	x0, #0x554
    2da8:	54000168 	b.hi	2dd4 <_malloc_r+0x814>  // b.pmore
    2dac:	d352fc20 	lsr	x0, x1, #18
    2db0:	1101f403 	add	w3, w0, #0x7d
    2db4:	1101f002 	add	w2, w0, #0x7c
    2db8:	531f7863 	lsl	w3, w3, #1
    2dbc:	937d7c63 	sbfiz	x3, x3, #3, #32
    2dc0:	17ffff4d 	b	2af4 <_malloc_r+0x534>
    2dc4:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    2dc8:	52800fe5 	mov	w5, #0x7f                  	// #127
    2dcc:	52800fc0 	mov	w0, #0x7e                  	// #126
    2dd0:	17fffe79 	b	27b4 <_malloc_r+0x1f4>
    2dd4:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    2dd8:	52800fc2 	mov	w2, #0x7e                  	// #126
    2ddc:	17ffff46 	b	2af4 <_malloc_r+0x534>
    2de0:	f9400681 	ldr	x1, [x20, #8]
    2de4:	17fffe58 	b	2744 <_malloc_r+0x184>
    2de8:	d503201f 	nop
    2dec:	d503201f 	nop
    2df0:	d503201f 	nop
    2df4:	d503201f 	nop
    2df8:	d503201f 	nop
    2dfc:	d503201f 	nop

0000000000002e00 <memset>:
    2e00:	4e010c20 	dup	v0.16b, w1
    2e04:	8b020004 	add	x4, x0, x2
    2e08:	f101805f 	cmp	x2, #0x60
    2e0c:	540003c8 	b.hi	2e84 <memset+0x84>  // b.pmore
    2e10:	f100405f 	cmp	x2, #0x10
    2e14:	54000202 	b.cs	2e54 <memset+0x54>  // b.hs, b.nlast
    2e18:	4e083c01 	mov	x1, v0.d[0]
    2e1c:	361800a2 	tbz	w2, #3, 2e30 <memset+0x30>
    2e20:	f9000001 	str	x1, [x0]
    2e24:	f81f8081 	stur	x1, [x4, #-8]
    2e28:	d65f03c0 	ret
    2e2c:	d503201f 	nop
    2e30:	36100082 	tbz	w2, #2, 2e40 <memset+0x40>
    2e34:	b9000001 	str	w1, [x0]
    2e38:	b81fc081 	stur	w1, [x4, #-4]
    2e3c:	d65f03c0 	ret
    2e40:	b4000082 	cbz	x2, 2e50 <memset+0x50>
    2e44:	39000001 	strb	w1, [x0]
    2e48:	36080042 	tbz	w2, #1, 2e50 <memset+0x50>
    2e4c:	781fe081 	sturh	w1, [x4, #-2]
    2e50:	d65f03c0 	ret
    2e54:	3d800000 	str	q0, [x0]
    2e58:	373000c2 	tbnz	w2, #6, 2e70 <memset+0x70>
    2e5c:	3c9f0080 	stur	q0, [x4, #-16]
    2e60:	36280062 	tbz	w2, #5, 2e6c <memset+0x6c>
    2e64:	3d800400 	str	q0, [x0, #16]
    2e68:	3c9e0080 	stur	q0, [x4, #-32]
    2e6c:	d65f03c0 	ret
    2e70:	3d800400 	str	q0, [x0, #16]
    2e74:	ad010000 	stp	q0, q0, [x0, #32]
    2e78:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2e7c:	d65f03c0 	ret
    2e80:	d503201f 	nop
    2e84:	12001c21 	and	w1, w1, #0xff
    2e88:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    2e8c:	3d800000 	str	q0, [x0]
    2e90:	f104005f 	cmp	x2, #0x100
    2e94:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    2e98:	54000180 	b.eq	2ec8 <memset+0xc8>  // b.none
    2e9c:	cb030082 	sub	x2, x4, x3
    2ea0:	d1004063 	sub	x3, x3, #0x10
    2ea4:	d1014042 	sub	x2, x2, #0x50
    2ea8:	ad010060 	stp	q0, q0, [x3, #32]
    2eac:	ad820060 	stp	q0, q0, [x3, #64]!
    2eb0:	f1010042 	subs	x2, x2, #0x40
    2eb4:	54ffffa8 	b.hi	2ea8 <memset+0xa8>  // b.pmore
    2eb8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2ebc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2ec0:	d65f03c0 	ret
    2ec4:	d503201f 	nop
    2ec8:	d53b00e5 	mrs	x5, dczid_el0
    2ecc:	3727fe85 	tbnz	w5, #4, 2e9c <memset+0x9c>
    2ed0:	12000ca5 	and	w5, w5, #0xf
    2ed4:	710010bf 	cmp	w5, #0x4
    2ed8:	54000281 	b.ne	2f28 <memset+0x128>  // b.any
    2edc:	3d800460 	str	q0, [x3, #16]
    2ee0:	ad010060 	stp	q0, q0, [x3, #32]
    2ee4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    2ee8:	ad020060 	stp	q0, q0, [x3, #64]
    2eec:	ad030060 	stp	q0, q0, [x3, #96]
    2ef0:	cb030082 	sub	x2, x4, x3
    2ef4:	d1040042 	sub	x2, x2, #0x100
    2ef8:	91020063 	add	x3, x3, #0x80
    2efc:	d503201f 	nop
    2f00:	d50b7423 	dc	zva, x3
    2f04:	91010063 	add	x3, x3, #0x40
    2f08:	f1010042 	subs	x2, x2, #0x40
    2f0c:	54ffffa8 	b.hi	2f00 <memset+0x100>  // b.pmore
    2f10:	ad000060 	stp	q0, q0, [x3]
    2f14:	ad010060 	stp	q0, q0, [x3, #32]
    2f18:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2f1c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2f20:	d65f03c0 	ret
    2f24:	d503201f 	nop
    2f28:	710014bf 	cmp	w5, #0x5
    2f2c:	54000241 	b.ne	2f74 <memset+0x174>  // b.any
    2f30:	3d800460 	str	q0, [x3, #16]
    2f34:	ad010060 	stp	q0, q0, [x3, #32]
    2f38:	ad020060 	stp	q0, q0, [x3, #64]
    2f3c:	ad030060 	stp	q0, q0, [x3, #96]
    2f40:	9279e063 	and	x3, x3, #0xffffffffffffff80
    2f44:	cb030082 	sub	x2, x4, x3
    2f48:	d1040042 	sub	x2, x2, #0x100
    2f4c:	91020063 	add	x3, x3, #0x80
    2f50:	d50b7423 	dc	zva, x3
    2f54:	91020063 	add	x3, x3, #0x80
    2f58:	f1020042 	subs	x2, x2, #0x80
    2f5c:	54ffffa8 	b.hi	2f50 <memset+0x150>  // b.pmore
    2f60:	ad3c0080 	stp	q0, q0, [x4, #-128]
    2f64:	ad3d0080 	stp	q0, q0, [x4, #-96]
    2f68:	ad3e0080 	stp	q0, q0, [x4, #-64]
    2f6c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    2f70:	d65f03c0 	ret
    2f74:	52800086 	mov	w6, #0x4                   	// #4
    2f78:	1ac520c7 	lsl	w7, w6, w5
    2f7c:	910100e5 	add	x5, x7, #0x40
    2f80:	eb05005f 	cmp	x2, x5
    2f84:	54fff8c3 	b.cc	2e9c <memset+0x9c>  // b.lo, b.ul, b.last
    2f88:	d10004e6 	sub	x6, x7, #0x1
    2f8c:	8b070065 	add	x5, x3, x7
    2f90:	91004063 	add	x3, x3, #0x10
    2f94:	eb0300a2 	subs	x2, x5, x3
    2f98:	8a2600a5 	bic	x5, x5, x6
    2f9c:	540000a0 	b.eq	2fb0 <memset+0x1b0>  // b.none
    2fa0:	ac820060 	stp	q0, q0, [x3], #64
    2fa4:	ad3f0060 	stp	q0, q0, [x3, #-32]
    2fa8:	f1010042 	subs	x2, x2, #0x40
    2fac:	54ffffa8 	b.hi	2fa0 <memset+0x1a0>  // b.pmore
    2fb0:	aa0503e3 	mov	x3, x5
    2fb4:	cb050082 	sub	x2, x4, x5
    2fb8:	eb070042 	subs	x2, x2, x7
    2fbc:	540000a3 	b.cc	2fd0 <memset+0x1d0>  // b.lo, b.ul, b.last
    2fc0:	d50b7423 	dc	zva, x3
    2fc4:	8b070063 	add	x3, x3, x7
    2fc8:	eb070042 	subs	x2, x2, x7
    2fcc:	54ffffa2 	b.cs	2fc0 <memset+0x1c0>  // b.hs, b.nlast
    2fd0:	8b070042 	add	x2, x2, x7
    2fd4:	d1008063 	sub	x3, x3, #0x20
    2fd8:	17ffffb6 	b	2eb0 <memset+0xb0>
    2fdc:	d503201f 	nop

0000000000002fe0 <__malloc_lock>:
    2fe0:	d65f03c0 	ret
    2fe4:	d503201f 	nop
    2fe8:	d503201f 	nop
    2fec:	d503201f 	nop

0000000000002ff0 <__malloc_unlock>:
    2ff0:	d65f03c0 	ret
    2ff4:	d503201f 	nop
    2ff8:	d503201f 	nop
    2ffc:	d503201f 	nop

0000000000003000 <_sbrk_r>:
    3000:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3004:	910003fd 	mov	x29, sp
    3008:	a90153f3 	stp	x19, x20, [sp, #16]
    300c:	b0000014 	adrp	x20, 4000 <__malloc_av_+0x6d8>
    3010:	aa0003f3 	mov	x19, x0
    3014:	b909229f 	str	wzr, [x20, #2336]
    3018:	aa0103e0 	mov	x0, x1
    301c:	97fffcf5 	bl	23f0 <_sbrk>
    3020:	b100041f 	cmn	x0, #0x1
    3024:	54000080 	b.eq	3034 <_sbrk_r+0x34>  // b.none
    3028:	a94153f3 	ldp	x19, x20, [sp, #16]
    302c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3030:	d65f03c0 	ret
    3034:	b9492281 	ldr	w1, [x20, #2336]
    3038:	34ffff81 	cbz	w1, 3028 <_sbrk_r+0x28>
    303c:	b9000261 	str	w1, [x19]
    3040:	a94153f3 	ldp	x19, x20, [sp, #16]
    3044:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3048:	d65f03c0 	ret
    304c:	d503201f 	nop

0000000000003050 <__register_exitproc>:
    3050:	90000004 	adrp	x4, 3000 <_sbrk_r>
    3054:	f9447c84 	ldr	x4, [x4, #2296]
    3058:	f940fc85 	ldr	x5, [x4, #504]
    305c:	b4000405 	cbz	x5, 30dc <__register_exitproc+0x8c>
    3060:	b94008a4 	ldr	w4, [x5, #8]
    3064:	71007c9f 	cmp	w4, #0x1f
    3068:	5400040c 	b.gt	30e8 <__register_exitproc+0x98>
    306c:	93407c86 	sxtw	x6, w4
    3070:	350000e0 	cbnz	w0, 308c <__register_exitproc+0x3c>
    3074:	910008c2 	add	x2, x6, #0x2
    3078:	11000484 	add	w4, w4, #0x1
    307c:	b90008a4 	str	w4, [x5, #8]
    3080:	52800000 	mov	w0, #0x0                   	// #0
    3084:	f82278a1 	str	x1, [x5, x2, lsl #3]
    3088:	d65f03c0 	ret
    308c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    3090:	52800028 	mov	w8, #0x1                   	// #1
    3094:	1ac42108 	lsl	w8, w8, w4
    3098:	93407c86 	sxtw	x6, w4
    309c:	f90088e2 	str	x2, [x7, #272]
    30a0:	b94310a2 	ldr	w2, [x5, #784]
    30a4:	2a080042 	orr	w2, w2, w8
    30a8:	b90310a2 	str	w2, [x5, #784]
    30ac:	f90108e3 	str	x3, [x7, #528]
    30b0:	7100081f 	cmp	w0, #0x2
    30b4:	54fffe01 	b.ne	3074 <__register_exitproc+0x24>  // b.any
    30b8:	b94314a0 	ldr	w0, [x5, #788]
    30bc:	910008c2 	add	x2, x6, #0x2
    30c0:	11000484 	add	w4, w4, #0x1
    30c4:	b90008a4 	str	w4, [x5, #8]
    30c8:	2a080008 	orr	w8, w0, w8
    30cc:	b90314a8 	str	w8, [x5, #788]
    30d0:	52800000 	mov	w0, #0x0                   	// #0
    30d4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    30d8:	17ffffec 	b	3088 <__register_exitproc+0x38>
    30dc:	91080085 	add	x5, x4, #0x200
    30e0:	f900fc85 	str	x5, [x4, #504]
    30e4:	17ffffdf 	b	3060 <__register_exitproc+0x10>
    30e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    30ec:	d65f03c0 	ret

00000000000030f0 <_malloc_trim_r>:
    30f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    30f4:	910003fd 	mov	x29, sp
    30f8:	a9025bf5 	stp	x21, x22, [sp, #32]
    30fc:	90000016 	adrp	x22, 3000 <_sbrk_r>
    3100:	9124a2d6 	add	x22, x22, #0x928
    3104:	aa0003f5 	mov	x21, x0
    3108:	a90153f3 	stp	x19, x20, [sp, #16]
    310c:	aa0103f3 	mov	x19, x1
    3110:	97ffffb4 	bl	2fe0 <__malloc_lock>
    3114:	f9400ac0 	ldr	x0, [x22, #16]
    3118:	f9400414 	ldr	x20, [x0, #8]
    311c:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    3120:	cb130293 	sub	x19, x20, x19
    3124:	913f7e73 	add	x19, x19, #0xfdf
    3128:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    312c:	d1400673 	sub	x19, x19, #0x1, lsl #12
    3130:	f13ffe7f 	cmp	x19, #0xfff
    3134:	5400010d 	b.le	3154 <_malloc_trim_r+0x64>
    3138:	d2800001 	mov	x1, #0x0                   	// #0
    313c:	aa1503e0 	mov	x0, x21
    3140:	97ffffb0 	bl	3000 <_sbrk_r>
    3144:	f9400ac1 	ldr	x1, [x22, #16]
    3148:	8b140021 	add	x1, x1, x20
    314c:	eb01001f 	cmp	x0, x1
    3150:	54000100 	b.eq	3170 <_malloc_trim_r+0x80>  // b.none
    3154:	aa1503e0 	mov	x0, x21
    3158:	97ffffa6 	bl	2ff0 <__malloc_unlock>
    315c:	52800000 	mov	w0, #0x0                   	// #0
    3160:	a94153f3 	ldp	x19, x20, [sp, #16]
    3164:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3168:	a8c37bfd 	ldp	x29, x30, [sp], #48
    316c:	d65f03c0 	ret
    3170:	cb1303e1 	neg	x1, x19
    3174:	aa1503e0 	mov	x0, x21
    3178:	97ffffa2 	bl	3000 <_sbrk_r>
    317c:	b100041f 	cmn	x0, #0x1
    3180:	54000200 	b.eq	31c0 <_malloc_trim_r+0xd0>  // b.none
    3184:	b0000002 	adrp	x2, 4000 <__malloc_av_+0x6d8>
    3188:	cb130294 	sub	x20, x20, x19
    318c:	f9400ac3 	ldr	x3, [x22, #16]
    3190:	b2400294 	orr	x20, x20, #0x1
    3194:	b948e041 	ldr	w1, [x2, #2272]
    3198:	aa1503e0 	mov	x0, x21
    319c:	f9000474 	str	x20, [x3, #8]
    31a0:	4b130033 	sub	w19, w1, w19
    31a4:	b908e053 	str	w19, [x2, #2272]
    31a8:	97ffff92 	bl	2ff0 <__malloc_unlock>
    31ac:	52800020 	mov	w0, #0x1                   	// #1
    31b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    31b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    31b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    31bc:	d65f03c0 	ret
    31c0:	d2800001 	mov	x1, #0x0                   	// #0
    31c4:	aa1503e0 	mov	x0, x21
    31c8:	97ffff8e 	bl	3000 <_sbrk_r>
    31cc:	f9400ac2 	ldr	x2, [x22, #16]
    31d0:	cb020001 	sub	x1, x0, x2
    31d4:	f1007c3f 	cmp	x1, #0x1f
    31d8:	54fffbed 	b.le	3154 <_malloc_trim_r+0x64>
    31dc:	b0000004 	adrp	x4, 4000 <__malloc_av_+0x6d8>
    31e0:	b2400021 	orr	x1, x1, #0x1
    31e4:	f9000441 	str	x1, [x2, #8]
    31e8:	b0000003 	adrp	x3, 4000 <__malloc_av_+0x6d8>
    31ec:	f9409c81 	ldr	x1, [x4, #312]
    31f0:	cb010000 	sub	x0, x0, x1
    31f4:	b908e060 	str	w0, [x3, #2272]
    31f8:	17ffffd7 	b	3154 <_malloc_trim_r+0x64>
    31fc:	d503201f 	nop

0000000000003200 <_free_r>:
    3200:	b4000a21 	cbz	x1, 3344 <_free_r+0x144>
    3204:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3208:	910003fd 	mov	x29, sp
    320c:	a90153f3 	stp	x19, x20, [sp, #16]
    3210:	aa0103f3 	mov	x19, x1
    3214:	aa0003f4 	mov	x20, x0
    3218:	97ffff72 	bl	2fe0 <__malloc_lock>
    321c:	f85f8265 	ldur	x5, [x19, #-8]
    3220:	d1004263 	sub	x3, x19, #0x10
    3224:	90000000 	adrp	x0, 3000 <_sbrk_r>
    3228:	9124a000 	add	x0, x0, #0x928
    322c:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    3230:	8b020064 	add	x4, x3, x2
    3234:	f9400806 	ldr	x6, [x0, #16]
    3238:	f9400481 	ldr	x1, [x4, #8]
    323c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    3240:	eb0400df 	cmp	x6, x4
    3244:	54000c60 	b.eq	33d0 <_free_r+0x1d0>  // b.none
    3248:	f9000481 	str	x1, [x4, #8]
    324c:	8b010086 	add	x6, x4, x1
    3250:	37000345 	tbnz	w5, #0, 32b8 <_free_r+0xb8>
    3254:	f85f0267 	ldur	x7, [x19, #-16]
    3258:	90000005 	adrp	x5, 3000 <_sbrk_r>
    325c:	f94004c6 	ldr	x6, [x6, #8]
    3260:	cb070063 	sub	x3, x3, x7
    3264:	8b070042 	add	x2, x2, x7
    3268:	9124e0a5 	add	x5, x5, #0x938
    326c:	924000c6 	and	x6, x6, #0x1
    3270:	f9400867 	ldr	x7, [x3, #16]
    3274:	eb0500ff 	cmp	x7, x5
    3278:	54000940 	b.eq	33a0 <_free_r+0x1a0>  // b.none
    327c:	f9400c68 	ldr	x8, [x3, #24]
    3280:	f9000ce8 	str	x8, [x7, #24]
    3284:	f9000907 	str	x7, [x8, #16]
    3288:	b50001c6 	cbnz	x6, 32c0 <_free_r+0xc0>
    328c:	8b010042 	add	x2, x2, x1
    3290:	f9400881 	ldr	x1, [x4, #16]
    3294:	b2400046 	orr	x6, x2, #0x1
    3298:	eb05003f 	cmp	x1, x5
    329c:	54000ee0 	b.eq	3478 <_free_r+0x278>  // b.none
    32a0:	f9400c84 	ldr	x4, [x4, #24]
    32a4:	f9000c24 	str	x4, [x1, #24]
    32a8:	f9000881 	str	x1, [x4, #16]
    32ac:	f9000466 	str	x6, [x3, #8]
    32b0:	f8226862 	str	x2, [x3, x2]
    32b4:	14000006 	b	32cc <_free_r+0xcc>
    32b8:	f94004c5 	ldr	x5, [x6, #8]
    32bc:	36000465 	tbz	w5, #0, 3348 <_free_r+0x148>
    32c0:	b2400041 	orr	x1, x2, #0x1
    32c4:	f9000461 	str	x1, [x3, #8]
    32c8:	f9000082 	str	x2, [x4]
    32cc:	f107fc5f 	cmp	x2, #0x1ff
    32d0:	54000449 	b.ls	3358 <_free_r+0x158>  // b.plast
    32d4:	d349fc41 	lsr	x1, x2, #9
    32d8:	f127fc5f 	cmp	x2, #0x9ff
    32dc:	54000a28 	b.hi	3420 <_free_r+0x220>  // b.pmore
    32e0:	d346fc41 	lsr	x1, x2, #6
    32e4:	1100e424 	add	w4, w1, #0x39
    32e8:	1100e025 	add	w5, w1, #0x38
    32ec:	531f7884 	lsl	w4, w4, #1
    32f0:	937d7c84 	sbfiz	x4, x4, #3, #32
    32f4:	8b040004 	add	x4, x0, x4
    32f8:	f85f0481 	ldr	x1, [x4], #-16
    32fc:	eb01009f 	cmp	x4, x1
    3300:	54000ae0 	b.eq	345c <_free_r+0x25c>  // b.none
    3304:	d503201f 	nop
    3308:	f9400420 	ldr	x0, [x1, #8]
    330c:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    3310:	eb02001f 	cmp	x0, x2
    3314:	54000089 	b.ls	3324 <_free_r+0x124>  // b.plast
    3318:	f9400821 	ldr	x1, [x1, #16]
    331c:	eb01009f 	cmp	x4, x1
    3320:	54ffff41 	b.ne	3308 <_free_r+0x108>  // b.any
    3324:	f9400c24 	ldr	x4, [x1, #24]
    3328:	a9011061 	stp	x1, x4, [x3, #16]
    332c:	aa1403e0 	mov	x0, x20
    3330:	f9000883 	str	x3, [x4, #16]
    3334:	f9000c23 	str	x3, [x1, #24]
    3338:	a94153f3 	ldp	x19, x20, [sp, #16]
    333c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3340:	17ffff2c 	b	2ff0 <__malloc_unlock>
    3344:	d65f03c0 	ret
    3348:	90000005 	adrp	x5, 3000 <_sbrk_r>
    334c:	8b010042 	add	x2, x2, x1
    3350:	9124e0a5 	add	x5, x5, #0x938
    3354:	17ffffcf 	b	3290 <_free_r+0x90>
    3358:	d343fc42 	lsr	x2, x2, #3
    335c:	d2800024 	mov	x4, #0x1                   	// #1
    3360:	11000441 	add	w1, w2, #0x1
    3364:	f9400405 	ldr	x5, [x0, #8]
    3368:	531f7821 	lsl	w1, w1, #1
    336c:	13027c42 	asr	w2, w2, #2
    3370:	8b21cc01 	add	x1, x0, w1, sxtw #3
    3374:	9ac22082 	lsl	x2, x4, x2
    3378:	aa050042 	orr	x2, x2, x5
    337c:	f9000402 	str	x2, [x0, #8]
    3380:	f85f0420 	ldr	x0, [x1], #-16
    3384:	a9010460 	stp	x0, x1, [x3, #16]
    3388:	f9000823 	str	x3, [x1, #16]
    338c:	f9000c03 	str	x3, [x0, #24]
    3390:	aa1403e0 	mov	x0, x20
    3394:	a94153f3 	ldp	x19, x20, [sp, #16]
    3398:	a8c27bfd 	ldp	x29, x30, [sp], #32
    339c:	17ffff15 	b	2ff0 <__malloc_unlock>
    33a0:	b50009c6 	cbnz	x6, 34d8 <_free_r+0x2d8>
    33a4:	a9410085 	ldp	x5, x0, [x4, #16]
    33a8:	8b020021 	add	x1, x1, x2
    33ac:	f9000ca0 	str	x0, [x5, #24]
    33b0:	b2400022 	orr	x2, x1, #0x1
    33b4:	f9000805 	str	x5, [x0, #16]
    33b8:	aa1403e0 	mov	x0, x20
    33bc:	f9000462 	str	x2, [x3, #8]
    33c0:	f8216861 	str	x1, [x3, x1]
    33c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    33c8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    33cc:	17ffff09 	b	2ff0 <__malloc_unlock>
    33d0:	8b010041 	add	x1, x2, x1
    33d4:	370000e5 	tbnz	w5, #0, 33f0 <_free_r+0x1f0>
    33d8:	f85f0262 	ldur	x2, [x19, #-16]
    33dc:	cb020063 	sub	x3, x3, x2
    33e0:	8b020021 	add	x1, x1, x2
    33e4:	a9410864 	ldp	x4, x2, [x3, #16]
    33e8:	f9000c82 	str	x2, [x4, #24]
    33ec:	f9000844 	str	x4, [x2, #16]
    33f0:	b0000002 	adrp	x2, 4000 <__malloc_av_+0x6d8>
    33f4:	b2400024 	orr	x4, x1, #0x1
    33f8:	f9000464 	str	x4, [x3, #8]
    33fc:	f940a042 	ldr	x2, [x2, #320]
    3400:	f9000803 	str	x3, [x0, #16]
    3404:	eb01005f 	cmp	x2, x1
    3408:	54fffc48 	b.hi	3390 <_free_r+0x190>  // b.pmore
    340c:	b0000001 	adrp	x1, 4000 <__malloc_av_+0x6d8>
    3410:	aa1403e0 	mov	x0, x20
    3414:	f9448c21 	ldr	x1, [x1, #2328]
    3418:	97ffff36 	bl	30f0 <_malloc_trim_r>
    341c:	17ffffdd 	b	3390 <_free_r+0x190>
    3420:	f100503f 	cmp	x1, #0x14
    3424:	54000129 	b.ls	3448 <_free_r+0x248>  // b.plast
    3428:	f101503f 	cmp	x1, #0x54
    342c:	54000308 	b.hi	348c <_free_r+0x28c>  // b.pmore
    3430:	d34cfc41 	lsr	x1, x2, #12
    3434:	1101bc24 	add	w4, w1, #0x6f
    3438:	1101b825 	add	w5, w1, #0x6e
    343c:	531f7884 	lsl	w4, w4, #1
    3440:	937d7c84 	sbfiz	x4, x4, #3, #32
    3444:	17ffffac 	b	32f4 <_free_r+0xf4>
    3448:	11017024 	add	w4, w1, #0x5c
    344c:	11016c25 	add	w5, w1, #0x5b
    3450:	531f7884 	lsl	w4, w4, #1
    3454:	937d7c84 	sbfiz	x4, x4, #3, #32
    3458:	17ffffa7 	b	32f4 <_free_r+0xf4>
    345c:	f9400406 	ldr	x6, [x0, #8]
    3460:	13027ca5 	asr	w5, w5, #2
    3464:	d2800022 	mov	x2, #0x1                   	// #1
    3468:	9ac52045 	lsl	x5, x2, x5
    346c:	aa0600a5 	orr	x5, x5, x6
    3470:	f9000405 	str	x5, [x0, #8]
    3474:	17ffffad 	b	3328 <_free_r+0x128>
    3478:	a9020c03 	stp	x3, x3, [x0, #32]
    347c:	a9009466 	stp	x6, x5, [x3, #8]
    3480:	f9000c65 	str	x5, [x3, #24]
    3484:	f8226862 	str	x2, [x3, x2]
    3488:	17ffffc2 	b	3390 <_free_r+0x190>
    348c:	f105503f 	cmp	x1, #0x154
    3490:	540000e8 	b.hi	34ac <_free_r+0x2ac>  // b.pmore
    3494:	d34ffc41 	lsr	x1, x2, #15
    3498:	1101e024 	add	w4, w1, #0x78
    349c:	1101dc25 	add	w5, w1, #0x77
    34a0:	531f7884 	lsl	w4, w4, #1
    34a4:	937d7c84 	sbfiz	x4, x4, #3, #32
    34a8:	17ffff93 	b	32f4 <_free_r+0xf4>
    34ac:	f115503f 	cmp	x1, #0x554
    34b0:	540000e8 	b.hi	34cc <_free_r+0x2cc>  // b.pmore
    34b4:	d352fc41 	lsr	x1, x2, #18
    34b8:	1101f424 	add	w4, w1, #0x7d
    34bc:	1101f025 	add	w5, w1, #0x7c
    34c0:	531f7884 	lsl	w4, w4, #1
    34c4:	937d7c84 	sbfiz	x4, x4, #3, #32
    34c8:	17ffff8b 	b	32f4 <_free_r+0xf4>
    34cc:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    34d0:	52800fc5 	mov	w5, #0x7e                  	// #126
    34d4:	17ffff88 	b	32f4 <_free_r+0xf4>
    34d8:	b2400040 	orr	x0, x2, #0x1
    34dc:	f9000460 	str	x0, [x3, #8]
    34e0:	f9000082 	str	x2, [x4]
    34e4:	17ffffab 	b	3390 <_free_r+0x190>
    34e8:	d503201f 	nop
    34ec:	d503201f 	nop

00000000000034f0 <cleanup_glue>:
    34f0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    34f4:	910003fd 	mov	x29, sp
    34f8:	a9025bf5 	stp	x21, x22, [sp, #32]
    34fc:	f9400035 	ldr	x21, [x1]
    3500:	a90153f3 	stp	x19, x20, [sp, #16]
    3504:	aa0103f3 	mov	x19, x1
    3508:	aa0003f4 	mov	x20, x0
    350c:	b4000275 	cbz	x21, 3558 <cleanup_glue+0x68>
    3510:	f94002b6 	ldr	x22, [x21]
    3514:	b40001d6 	cbz	x22, 354c <cleanup_glue+0x5c>
    3518:	f9001bf7 	str	x23, [sp, #48]
    351c:	f94002d7 	ldr	x23, [x22]
    3520:	b40000f7 	cbz	x23, 353c <cleanup_glue+0x4c>
    3524:	f94002e1 	ldr	x1, [x23]
    3528:	b4000041 	cbz	x1, 3530 <cleanup_glue+0x40>
    352c:	97fffff1 	bl	34f0 <cleanup_glue>
    3530:	aa1703e1 	mov	x1, x23
    3534:	aa1403e0 	mov	x0, x20
    3538:	97ffff32 	bl	3200 <_free_r>
    353c:	aa1603e1 	mov	x1, x22
    3540:	aa1403e0 	mov	x0, x20
    3544:	97ffff2f 	bl	3200 <_free_r>
    3548:	f9401bf7 	ldr	x23, [sp, #48]
    354c:	aa1503e1 	mov	x1, x21
    3550:	aa1403e0 	mov	x0, x20
    3554:	97ffff2b 	bl	3200 <_free_r>
    3558:	aa1303e1 	mov	x1, x19
    355c:	aa1403e0 	mov	x0, x20
    3560:	a94153f3 	ldp	x19, x20, [sp, #16]
    3564:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3568:	a8c47bfd 	ldp	x29, x30, [sp], #64
    356c:	17ffff25 	b	3200 <_free_r>

0000000000003570 <_reclaim_reent>:
    3570:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3574:	b0000001 	adrp	x1, 4000 <__malloc_av_+0x6d8>
    3578:	910003fd 	mov	x29, sp
    357c:	a90153f3 	stp	x19, x20, [sp, #16]
    3580:	aa0003f4 	mov	x20, x0
    3584:	f940a420 	ldr	x0, [x1, #328]
    3588:	eb14001f 	cmp	x0, x20
    358c:	54000500 	b.eq	362c <_reclaim_reent+0xbc>  // b.none
    3590:	f9403e81 	ldr	x1, [x20, #120]
    3594:	f90013f5 	str	x21, [sp, #32]
    3598:	b40001e1 	cbz	x1, 35d4 <_reclaim_reent+0x64>
    359c:	d2800015 	mov	x21, #0x0                   	// #0
    35a0:	f8756833 	ldr	x19, [x1, x21]
    35a4:	b40000f3 	cbz	x19, 35c0 <_reclaim_reent+0x50>
    35a8:	aa1303e1 	mov	x1, x19
    35ac:	aa1403e0 	mov	x0, x20
    35b0:	f9400273 	ldr	x19, [x19]
    35b4:	97ffff13 	bl	3200 <_free_r>
    35b8:	b5ffff93 	cbnz	x19, 35a8 <_reclaim_reent+0x38>
    35bc:	f9403e81 	ldr	x1, [x20, #120]
    35c0:	910022b5 	add	x21, x21, #0x8
    35c4:	f10802bf 	cmp	x21, #0x200
    35c8:	54fffec1 	b.ne	35a0 <_reclaim_reent+0x30>  // b.any
    35cc:	aa1403e0 	mov	x0, x20
    35d0:	97ffff0c 	bl	3200 <_free_r>
    35d4:	f9403281 	ldr	x1, [x20, #96]
    35d8:	b4000061 	cbz	x1, 35e4 <_reclaim_reent+0x74>
    35dc:	aa1403e0 	mov	x0, x20
    35e0:	97ffff08 	bl	3200 <_free_r>
    35e4:	f940fe93 	ldr	x19, [x20, #504]
    35e8:	b4000153 	cbz	x19, 3610 <_reclaim_reent+0xa0>
    35ec:	91080295 	add	x21, x20, #0x200
    35f0:	eb15027f 	cmp	x19, x21
    35f4:	540000e0 	b.eq	3610 <_reclaim_reent+0xa0>  // b.none
    35f8:	aa1303e1 	mov	x1, x19
    35fc:	aa1403e0 	mov	x0, x20
    3600:	f9400273 	ldr	x19, [x19]
    3604:	97fffeff 	bl	3200 <_free_r>
    3608:	eb1302bf 	cmp	x21, x19
    360c:	54ffff61 	b.ne	35f8 <_reclaim_reent+0x88>  // b.any
    3610:	f9404681 	ldr	x1, [x20, #136]
    3614:	b4000061 	cbz	x1, 3620 <_reclaim_reent+0xb0>
    3618:	aa1403e0 	mov	x0, x20
    361c:	97fffef9 	bl	3200 <_free_r>
    3620:	b9405280 	ldr	w0, [x20, #80]
    3624:	350000a0 	cbnz	w0, 3638 <_reclaim_reent+0xc8>
    3628:	f94013f5 	ldr	x21, [sp, #32]
    362c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3630:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3634:	d65f03c0 	ret
    3638:	f9402e81 	ldr	x1, [x20, #88]
    363c:	aa1403e0 	mov	x0, x20
    3640:	d63f0020 	blr	x1
    3644:	f9429293 	ldr	x19, [x20, #1312]
    3648:	b4ffff13 	cbz	x19, 3628 <_reclaim_reent+0xb8>
    364c:	f9400261 	ldr	x1, [x19]
    3650:	b4000061 	cbz	x1, 365c <_reclaim_reent+0xec>
    3654:	aa1403e0 	mov	x0, x20
    3658:	97ffffa6 	bl	34f0 <cleanup_glue>
    365c:	aa1303e1 	mov	x1, x19
    3660:	aa1403e0 	mov	x0, x20
    3664:	a94153f3 	ldp	x19, x20, [sp, #16]
    3668:	f94013f5 	ldr	x21, [sp, #32]
    366c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3670:	17fffee4 	b	3200 <_free_r>

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

0000000000003674 <_fini>:
    3674:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3678:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    367c:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    3680:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    3684:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    3688:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    368c:	a8c153f3 	ldp	x19, x20, [sp], #16
    3690:	a8c15bf5 	ldp	x21, x22, [sp], #16
    3694:	a8c163f7 	ldp	x23, x24, [sp], #16
    3698:	a8c16bf9 	ldp	x25, x26, [sp], #16
    369c:	a8c173fb 	ldp	x27, x28, [sp], #16
    36a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    36a4:	d65f03c0 	ret
