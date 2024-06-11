
simple_server:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
IPC_SERVER_INTERFACE(Ipc_add, 2);
IPC_SERVER_INTERFACE(Ipc_hello_string, 2);
IPC_SERVER_REGISTER_INTERFACES(IpcSimpleServer, 2, Ipc_hello_string, Ipc_add);

int main(int argc, char* argv[])
{
       0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
       4:	910003fd 	mov	x29, sp
       8:	f9000bf3 	str	x19, [sp, #16]
    if (register_server("SimpleServer") < 0) {
       c:	f0000053 	adrp	x19, b000 <_findenv_r+0x10>
      10:	9119c273 	add	x19, x19, #0x670
      14:	aa1303e0 	mov	x0, x19
      18:	94000b02 	bl	2c20 <register_server>
      1c:	37f80160 	tbnz	w0, #31, 48 <main+0x48>
        printf("register server name: %s failed.\n", "SimpleServer");
        exit(1);
    }
    ipc_server_loop(&IpcSimpleServer);
      20:	90000060 	adrp	x0, c000 <JIS_state_table+0x10>
      24:	91056000 	add	x0, x0, #0x158
      28:	91006000 	add	x0, x0, #0x18
      2c:	94000919 	bl	2490 <ipc_server_loop>

    // never reached
    exit(0);
      30:	52800000 	mov	w0, #0x0                   	// #0
      34:	94000ae3 	bl	2bc0 <exit>
    return 0;
}
      38:	52800000 	mov	w0, #0x0                   	// #0
      3c:	f9400bf3 	ldr	x19, [sp, #16]
      40:	a8c27bfd 	ldp	x29, x30, [sp], #32
      44:	d65f03c0 	ret
        printf("register server name: %s failed.\n", "SimpleServer");
      48:	aa1303e1 	mov	x1, x19
      4c:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
      50:	911a0000 	add	x0, x0, #0x680
      54:	9400075f 	bl	1dd0 <printf>
        exit(1);
      58:	52800020 	mov	w0, #0x1                   	// #1
      5c:	94000ad9 	bl	2bc0 <exit>
      60:	17fffff0 	b	20 <main+0x20>
      64:	d503201f 	nop
      68:	d503201f 	nop
      6c:	d503201f 	nop

0000000000000070 <deregister_tm_clones>:
      70:	b0000060 	adrp	x0, d000 <impure_data+0x680>
      74:	912ae000 	add	x0, x0, #0xab8
      78:	b0000061 	adrp	x1, d000 <impure_data+0x680>
      7c:	912ae021 	add	x1, x1, #0xab8
      80:	eb00003f 	cmp	x1, x0
      84:	540000c0 	b.eq	9c <deregister_tm_clones+0x2c>  // b.none
      88:	f0000041 	adrp	x1, b000 <_findenv_r+0x10>
      8c:	f942f421 	ldr	x1, [x1, #1512]
      90:	b4000061 	cbz	x1, 9c <deregister_tm_clones+0x2c>
      94:	aa0103f0 	mov	x16, x1
      98:	d61f0200 	br	x16
      9c:	d65f03c0 	ret

00000000000000a0 <register_tm_clones>:
      a0:	b0000060 	adrp	x0, d000 <impure_data+0x680>
      a4:	912ae000 	add	x0, x0, #0xab8
      a8:	b0000061 	adrp	x1, d000 <impure_data+0x680>
      ac:	912ae021 	add	x1, x1, #0xab8
      b0:	cb000021 	sub	x1, x1, x0
      b4:	d37ffc22 	lsr	x2, x1, #63
      b8:	8b810c41 	add	x1, x2, x1, asr #3
      bc:	9341fc21 	asr	x1, x1, #1
      c0:	b40000c1 	cbz	x1, d8 <register_tm_clones+0x38>
      c4:	f0000042 	adrp	x2, b000 <_findenv_r+0x10>
      c8:	f942f842 	ldr	x2, [x2, #1520]
      cc:	b4000062 	cbz	x2, d8 <register_tm_clones+0x38>
      d0:	aa0203f0 	mov	x16, x2
      d4:	d61f0200 	br	x16
      d8:	d65f03c0 	ret
      dc:	d503201f 	nop

00000000000000e0 <__do_global_dtors_aux>:
      e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
      e4:	910003fd 	mov	x29, sp
      e8:	f9000bf3 	str	x19, [sp, #16]
      ec:	b0000073 	adrp	x19, d000 <impure_data+0x680>
      f0:	396ae260 	ldrb	w0, [x19, #2744]
      f4:	35000140 	cbnz	w0, 11c <__do_global_dtors_aux+0x3c>
      f8:	97ffffde 	bl	70 <deregister_tm_clones>
      fc:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     100:	f942fc00 	ldr	x0, [x0, #1528]
     104:	b4000080 	cbz	x0, 114 <__do_global_dtors_aux+0x34>
     108:	90000060 	adrp	x0, c000 <JIS_state_table+0x10>
     10c:	9104f000 	add	x0, x0, #0x13c
     110:	d503201f 	nop
     114:	52800020 	mov	w0, #0x1                   	// #1
     118:	392ae260 	strb	w0, [x19, #2744]
     11c:	f9400bf3 	ldr	x19, [sp, #16]
     120:	a8c27bfd 	ldp	x29, x30, [sp], #32
     124:	d65f03c0 	ret
     128:	d503201f 	nop
     12c:	d503201f 	nop

0000000000000130 <frame_dummy>:
     130:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     134:	f9430000 	ldr	x0, [x0, #1536]
     138:	b4000140 	cbz	x0, 160 <frame_dummy+0x30>
     13c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     140:	b0000061 	adrp	x1, d000 <impure_data+0x680>
     144:	90000060 	adrp	x0, c000 <JIS_state_table+0x10>
     148:	910003fd 	mov	x29, sp
     14c:	912b0021 	add	x1, x1, #0xac0
     150:	9104f000 	add	x0, x0, #0x13c
     154:	d503201f 	nop
     158:	a8c17bfd 	ldp	x29, x30, [sp], #16
     15c:	17ffffd1 	b	a0 <register_tm_clones>
     160:	17ffffd0 	b	a0 <register_tm_clones>
     164:	d503201f 	nop

0000000000000168 <_mainCRTStartup>:
     168:	58000281 	ldr	x1, 1b8 <_cpu_init_hook+0x4>
     16c:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     170:	9100001f 	mov	sp, x0
     174:	d280001d 	mov	x29, #0x0                   	// #0
     178:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     17c:	910003fd 	mov	x29, sp
     180:	9400000d 	bl	1b4 <_cpu_init_hook>
     184:	580001e0 	ldr	x0, 1c0 <_cpu_init_hook+0xc>
     188:	52800001 	mov	w1, #0x0                   	// #0
     18c:	580001e2 	ldr	x2, 1c8 <_cpu_init_hook+0x14>
     190:	cb000042 	sub	x2, x2, x0
     194:	94000e7b 	bl	3b80 <memset>
     198:	580001c0 	ldr	x0, 1d0 <_cpu_init_hook+0x1c>
     19c:	94000d69 	bl	3740 <atexit>
     1a0:	94000dc4 	bl	38b0 <__libc_init_array>
     1a4:	d2800000 	mov	x0, #0x0                   	// #0
     1a8:	d2800001 	mov	x1, #0x0                   	// #0
     1ac:	97ffff95 	bl	0 <main>
     1b0:	14000a84 	b	2bc0 <exit>

00000000000001b4 <_cpu_init_hook>:
     1b4:	d65f03c0 	ret
	...
     1c0:	0000dab8 	.word	0x0000dab8
     1c4:	00000000 	.word	0x00000000
     1c8:	0000ded0 	.word	0x0000ded0
     1cc:	00000000 	.word	0x00000000
     1d0:	00003760 	.word	0x00003760
     1d4:	00000000 	.word	0x00000000
     1d8:	d503201f 	.word	0xd503201f
     1dc:	d503201f 	.word	0xd503201f

00000000000001e0 <ipc_serve_Ipc_add>:
IPC_SERVER_INTERFACE(Ipc_add, 2);
     1e0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     1e4:	910003fd 	mov	x29, sp
     1e8:	f9000bf3 	str	x19, [sp, #16]
     1ec:	aa0003f3 	mov	x19, x0
/// @param msg
/// @param arg_num start with 0 for first arg
/// @return
__attribute__((__always_inline__)) static inline void* ipc_msg_get_nth_arg_buf(struct IpcMsg* msg, int arg_num)
{
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     1f0:	39404000 	ldrb	w0, [x0, #16]
     1f4:	37000340 	tbnz	w0, #0, 25c <ipc_serve_Ipc_add+0x7c>
        return NULL;
    }

    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     1f8:	79401a60 	ldrh	w0, [x19, #12]
     1fc:	8b000260 	add	x0, x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     200:	39405a61 	ldrb	w1, [x19, #22]
     204:	37000401 	tbnz	w1, #0, 284 <ipc_serve_Ipc_add+0xa4>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     208:	79402662 	ldrh	w2, [x19, #18]
    return *a + *b;
     20c:	b9400001 	ldr	w1, [x0]
     210:	b8626a60 	ldr	w0, [x19, x2]
     214:	0b010000 	add	w0, w0, w1
IPC_SERVER_INTERFACE(Ipc_add, 2);
     218:	b9002fe0 	str	w0, [sp, #44]
     21c:	94000891 	bl	2460 <is_cur_session_delayed>
     220:	72001c1f 	tst	w0, #0xff
     224:	54000141 	b.ne	24c <ipc_serve_Ipc_add+0x6c>  // b.any
/// @brief set return val of ipc call after serve, used by server
/// @param msg
/// @param ret_val
__attribute__((__always_inline__)) static inline void ipc_msg_set_return(struct IpcMsg* msg, int32_t* ret_val)
{
    assert(msg->header.valid == 1);
     228:	39400260 	ldrb	w0, [x19]
     22c:	360001c0 	tbz	w0, #0, 264 <ipc_serve_Ipc_add+0x84>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     230:	9100b3e1 	add	x1, sp, #0x2c
     234:	91002260 	add	x0, x19, #0x8
     238:	d2800082 	mov	x2, #0x4                   	// #4
     23c:	94000dc1 	bl	3940 <memcpy>
     240:	39400260 	ldrb	w0, [x19]
     244:	321f0000 	orr	w0, w0, #0x2
     248:	39000260 	strb	w0, [x19]
     24c:	52800000 	mov	w0, #0x0                   	// #0
     250:	f9400bf3 	ldr	x19, [sp, #16]
     254:	a8c37bfd 	ldp	x29, x30, [sp], #48
     258:	d65f03c0 	ret
        return NULL;
     25c:	d2800000 	mov	x0, #0x0                   	// #0
     260:	17ffffe8 	b	200 <ipc_serve_Ipc_add+0x20>
    assert(msg->header.valid == 1);
     264:	f0000043 	adrp	x3, b000 <_findenv_r+0x10>
     268:	f0000042 	adrp	x2, b000 <_findenv_r+0x10>
     26c:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     270:	91182063 	add	x3, x3, #0x608
     274:	911aa042 	add	x2, x2, #0x6a8
     278:	91188000 	add	x0, x0, #0x620
     27c:	52801101 	mov	w1, #0x88                  	// #136
     280:	94000d10 	bl	36c0 <__assert_func>
    return *a + *b;
     284:	d2800000 	mov	x0, #0x0                   	// #0
     288:	b9400000 	ldr	w0, [x0]
     28c:	d4207d00 	brk	#0x3e8

0000000000000290 <ipc_serve_Ipc_hello_string>:
IPC_SERVER_INTERFACE(Ipc_hello_string, 2);
     290:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     294:	910003fd 	mov	x29, sp
     298:	f9000bf3 	str	x19, [sp, #16]
     29c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     2a0:	39404000 	ldrb	w0, [x0, #16]
     2a4:	370003e0 	tbnz	w0, #0, 320 <ipc_serve_Ipc_hello_string+0x90>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     2a8:	79401a60 	ldrh	w0, [x19, #12]
     2ac:	8b000260 	add	x0, x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     2b0:	39405a61 	ldrb	w1, [x19, #22]
     2b4:	370004a1 	tbnz	w1, #0, 348 <ipc_serve_Ipc_hello_string+0xb8>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     2b8:	79402662 	ldrh	w2, [x19, #18]
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     2bc:	528002e3 	mov	w3, #0x17                  	// #23
    memcpy(buf, hello_string, copy_len);
     2c0:	90000061 	adrp	x1, c000 <JIS_state_table+0x10>
     2c4:	91056021 	add	x1, x1, #0x158
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     2c8:	b8626a62 	ldr	w2, [x19, x2]
     2cc:	6b03005f 	cmp	w2, w3
     2d0:	1a833042 	csel	w2, w2, w3, cc  // cc = lo, ul, last
    memcpy(buf, hello_string, copy_len);
     2d4:	93407c42 	sxtw	x2, w2
     2d8:	94000d9a 	bl	3940 <memcpy>
IPC_SERVER_INTERFACE(Ipc_hello_string, 2);
     2dc:	b9002fff 	str	wzr, [sp, #44]
     2e0:	94000860 	bl	2460 <is_cur_session_delayed>
     2e4:	72001c1f 	tst	w0, #0xff
     2e8:	54000141 	b.ne	310 <ipc_serve_Ipc_hello_string+0x80>  // b.any
    assert(msg->header.valid == 1);
     2ec:	39400260 	ldrb	w0, [x19]
     2f0:	360001c0 	tbz	w0, #0, 328 <ipc_serve_Ipc_hello_string+0x98>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     2f4:	9100b3e1 	add	x1, sp, #0x2c
     2f8:	91002260 	add	x0, x19, #0x8
     2fc:	d2800082 	mov	x2, #0x4                   	// #4
     300:	94000d90 	bl	3940 <memcpy>
     304:	39400260 	ldrb	w0, [x19]
     308:	321f0000 	orr	w0, w0, #0x2
     30c:	39000260 	strb	w0, [x19]
     310:	52800000 	mov	w0, #0x0                   	// #0
     314:	f9400bf3 	ldr	x19, [sp, #16]
     318:	a8c37bfd 	ldp	x29, x30, [sp], #48
     31c:	d65f03c0 	ret
        return NULL;
     320:	d2800000 	mov	x0, #0x0                   	// #0
     324:	17ffffe3 	b	2b0 <ipc_serve_Ipc_hello_string+0x20>
    assert(msg->header.valid == 1);
     328:	f0000043 	adrp	x3, b000 <_findenv_r+0x10>
     32c:	f0000042 	adrp	x2, b000 <_findenv_r+0x10>
     330:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     334:	91182063 	add	x3, x3, #0x608
     338:	911aa042 	add	x2, x2, #0x6a8
     33c:	91188000 	add	x0, x0, #0x620
     340:	52801101 	mov	w1, #0x88                  	// #136
     344:	94000cdf 	bl	36c0 <__assert_func>
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     348:	d2800000 	mov	x0, #0x0                   	// #0
     34c:	b9400000 	ldr	w0, [x0]
     350:	d4207d00 	brk	#0x3e8
     354:	d503201f 	nop
     358:	d503201f 	nop
     35c:	d503201f 	nop

0000000000000360 <ipc_do_serve_Ipc_add>:
    return *a + *b;
     360:	b9400002 	ldr	w2, [x0]
     364:	b9400020 	ldr	w0, [x1]
}
     368:	0b000040 	add	w0, w2, w0
     36c:	d65f03c0 	ret

0000000000000370 <ipc_do_serve_Ipc_hello_string>:
{
     370:	aa0103e2 	mov	x2, x1
     374:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     378:	528002e3 	mov	w3, #0x17                  	// #23
{
     37c:	910003fd 	mov	x29, sp
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     380:	b9400042 	ldr	w2, [x2]
    memcpy(buf, hello_string, copy_len);
     384:	90000061 	adrp	x1, c000 <JIS_state_table+0x10>
     388:	91056021 	add	x1, x1, #0x158
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
     38c:	6b03005f 	cmp	w2, w3
     390:	1a833042 	csel	w2, w2, w3, cc  // cc = lo, ul, last
    memcpy(buf, hello_string, copy_len);
     394:	93407c42 	sxtw	x2, w2
     398:	94000d6a 	bl	3940 <memcpy>
}
     39c:	52800000 	mov	w0, #0x0                   	// #0
     3a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
     3a4:	d65f03c0 	ret
     3a8:	d503201f 	nop
     3ac:	d503201f 	nop

00000000000003b0 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     3b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     3b4:	52800020 	mov	w0, #0x1                   	// #1
{
     3b8:	910003fd 	mov	x29, sp
     3bc:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     3c0:	b0000073 	adrp	x19, d000 <impure_data+0x680>
     3c4:	b94af261 	ldr	w1, [x19, #2800]
     3c8:	34000081 	cbz	w1, 3d8 <init_uart_mmio+0x28>
}
     3cc:	f9400bf3 	ldr	x19, [sp, #16]
     3d0:	a8c27bfd 	ldp	x29, x30, [sp], #32
     3d4:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     3d8:	2a0003e3 	mov	w3, w0
     3dc:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     3e0:	52820002 	mov	w2, #0x1000                	// #4096
     3e4:	aa0103e0 	mov	x0, x1
     3e8:	94000a5e 	bl	2d60 <mmap>
     3ec:	3100041f 	cmn	w0, #0x1
            return false;
     3f0:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     3f4:	54fffec0 	b.eq	3cc <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     3f8:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     3fc:	2a0103e0 	mov	w0, w1
        mapped = 1;
     400:	b90af261 	str	w1, [x19, #2800]
}
     404:	f9400bf3 	ldr	x19, [sp, #16]
     408:	a8c27bfd 	ldp	x29, x30, [sp], #32
     40c:	d65f03c0 	ret

0000000000000410 <putc>:

void putc(char ch)
{
     410:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     414:	7100281f 	cmp	w0, #0xa
     418:	540000c0 	b.eq	430 <putc+0x20>  // b.none
    return in_le32(addr);
     41c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     420:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     424:	362fffe1 	tbz	w1, #5, 420 <putc+0x10>
    out_le32(addr, value);
     428:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     42c:	d65f03c0 	ret
    return in_le32(addr);
     430:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     434:	d503201f 	nop
     438:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     43c:	362fffe1 	tbz	w1, #5, 438 <putc+0x28>
    out_le32(addr, value);
     440:	528001a1 	mov	w1, #0xd                   	// #13
     444:	b9000041 	str	w1, [x2]
}
     448:	17fffff5 	b	41c <putc+0xc>
     44c:	d503201f 	nop

0000000000000450 <getc>:
    return in_le32(addr);
     450:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     454:	d503201f 	nop
     458:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     45c:	3607ffe0 	tbz	w0, #0, 458 <getc+0x8>
    return in_le32(addr);
     460:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     464:	d65f03c0 	ret
     468:	d503201f 	nop
     46c:	d503201f 	nop

0000000000000470 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     470:	eb03005f 	cmp	x2, x3
{
     474:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     478:	54000042 	b.cs	480 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     47c:	38226820 	strb	w0, [x1, x2]
    }
}
     480:	d65f03c0 	ret
     484:	d503201f 	nop
     488:	d503201f 	nop
     48c:	d503201f 	nop

0000000000000490 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     490:	d65f03c0 	ret
     494:	d503201f 	nop
     498:	d503201f 	nop
     49c:	d503201f 	nop

00000000000004a0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     4a0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     4a4:	910003fd 	mov	x29, sp
     4a8:	a90153f3 	stp	x19, x20, [sp, #16]
     4ac:	aa0503f3 	mov	x19, x5
     4b0:	aa0203f4 	mov	x20, x2
     4b4:	a9025bf5 	stp	x21, x22, [sp, #32]
     4b8:	aa0003f5 	mov	x21, x0
     4bc:	aa0103f6 	mov	x22, x1
     4c0:	a90363f7 	stp	x23, x24, [sp, #48]
     4c4:	aa0203f7 	mov	x23, x2
     4c8:	aa0403f8 	mov	x24, x4
     4cc:	a9046bf9 	stp	x25, x26, [sp, #64]
     4d0:	2a0703fa 	mov	w26, w7
     4d4:	2a0603f9 	mov	w25, w6
     4d8:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     4dc:	f240075f 	tst	x26, #0x3
{
     4e0:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     4e4:	540001e1 	b.ne	520 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     4e8:	2a0603e0 	mov	w0, w6
     4ec:	aa0203fc 	mov	x28, x2
     4f0:	cb050014 	sub	x20, x0, x5
     4f4:	eb0000bf 	cmp	x5, x0
     4f8:	8b020294 	add	x20, x20, x2
     4fc:	54000542 	b.cs	5a4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     500:	aa1c03e2 	mov	x2, x28
     504:	aa1b03e3 	mov	x3, x27
     508:	9100079c 	add	x28, x28, #0x1
     50c:	aa1603e1 	mov	x1, x22
     510:	52800400 	mov	w0, #0x20                  	// #32
     514:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     518:	eb1c029f 	cmp	x20, x28
     51c:	54ffff21 	b.ne	500 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     520:	8b14027c 	add	x28, x19, x20
     524:	b4000133 	cbz	x19, 548 <_out_rev+0xa8>
     528:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     52c:	d1000673 	sub	x19, x19, #0x1
     530:	aa1c03f4 	mov	x20, x28
     534:	aa1b03e3 	mov	x3, x27
     538:	aa1603e1 	mov	x1, x22
     53c:	38736b00 	ldrb	w0, [x24, x19]
     540:	d63f02a0 	blr	x21
    while (len) {
     544:	b5ffff33 	cbnz	x19, 528 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     548:	360801fa 	tbz	w26, #1, 584 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     54c:	cb170297 	sub	x23, x20, x23
     550:	2a1903f9 	mov	w25, w25
     554:	eb1902ff 	cmp	x23, x25
     558:	54000162 	b.cs	584 <_out_rev+0xe4>  // b.hs, b.nlast
     55c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     560:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     564:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     568:	aa1b03e3 	mov	x3, x27
     56c:	aa1603e1 	mov	x1, x22
     570:	52800400 	mov	w0, #0x20                  	// #32
     574:	d63f02a0 	blr	x21
     578:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     57c:	eb1902ff 	cmp	x23, x25
     580:	54ffff03 	b.cc	560 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     584:	aa1403e0 	mov	x0, x20
     588:	a94153f3 	ldp	x19, x20, [sp, #16]
     58c:	a9425bf5 	ldp	x21, x22, [sp, #32]
     590:	a94363f7 	ldp	x23, x24, [sp, #48]
     594:	a9446bf9 	ldp	x25, x26, [sp, #64]
     598:	a94573fb 	ldp	x27, x28, [sp, #80]
     59c:	a8c67bfd 	ldp	x29, x30, [sp], #96
     5a0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     5a4:	aa0203f4 	mov	x20, x2
     5a8:	17ffffde 	b	520 <_out_rev+0x80>
     5ac:	d503201f 	nop

00000000000005b0 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     5b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     5b4:	aa0603eb 	mov	x11, x6
     5b8:	aa0403e9 	mov	x9, x4
     5bc:	910003fd 	mov	x29, sp
     5c0:	b9403be8 	ldr	w8, [sp, #56]
     5c4:	2a0703ef 	mov	w15, w7
     5c8:	b94033e6 	ldr	w6, [sp, #48]
     5cc:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     5d0:	12160110 	and	w16, w8, #0x400
    if (!value) {
     5d4:	b5000c64 	cbnz	x4, 760 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     5d8:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     5dc:	34000730 	cbz	w16, 6c0 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     5e0:	121f0111 	and	w17, w8, #0x2
     5e4:	37080fc8 	tbnz	w8, #1, 7dc <_ntoa_long+0x22c>
    size_t len = 0U;
     5e8:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     5ec:	2a0f03e9 	mov	w9, w15
     5f0:	f1007cbf 	cmp	x5, #0x1f
     5f4:	910043e4 	add	x4, sp, #0x10
     5f8:	1a9f87ea 	cset	w10, ls  // ls = plast
     5fc:	eb05013f 	cmp	x9, x5
     600:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     604:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     608:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     60c:	350009c6 	cbnz	w6, 744 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     610:	34000108 	cbz	w8, 630 <_ntoa_long+0x80>
            buf[len++] = '0';
     614:	5280060a 	mov	w10, #0x30                  	// #48
     618:	910004a5 	add	x5, x5, #0x1
     61c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     620:	eb05013f 	cmp	x9, x5
     624:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     628:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     62c:	54ffff69 	b.ls	618 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     630:	340001cc 	cbz	w12, 668 <_ntoa_long+0xb8>
     634:	f1007cbf 	cmp	x5, #0x1f
     638:	1a9f87ea 	cset	w10, ls  // ls = plast
     63c:	7100015f 	cmp	w10, #0x0
     640:	2a0603e9 	mov	w9, w6
     644:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     648:	54000109 	b.ls	668 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     64c:	5280060a 	mov	w10, #0x30                  	// #48
     650:	910004a5 	add	x5, x5, #0x1
     654:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     658:	eb05013f 	cmp	x9, x5
     65c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     660:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     664:	54ffff69 	b.ls	650 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     668:	340001b1 	cbz	w17, 69c <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     66c:	350008b0 	cbnz	w16, 780 <_ntoa_long+0x1d0>
     670:	b50007e5 	cbnz	x5, 76c <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     674:	f100417f 	cmp	x11, #0x10
     678:	54000f20 	b.eq	85c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     67c:	f100097f 	cmp	x11, #0x2
     680:	54000f21 	b.ne	864 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     684:	52800c48 	mov	w8, #0x62                  	// #98
     688:	d2800025 	mov	x5, #0x1                   	// #1
     68c:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     690:	52800608 	mov	w8, #0x30                  	// #48
     694:	38256888 	strb	w8, [x4, x5]
     698:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     69c:	f10080bf 	cmp	x5, #0x20
     6a0:	540000a0 	b.eq	6b4 <_ntoa_long+0x104>  // b.none
        if (negative) {
     6a4:	340008d2 	cbz	w18, 7bc <_ntoa_long+0x20c>
            buf[len++] = '-';
     6a8:	528005a8 	mov	w8, #0x2d                  	// #45
     6ac:	38256888 	strb	w8, [x4, x5]
     6b0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     6b4:	97ffff7b 	bl	4a0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     6b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     6bc:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     6c0:	52800011 	mov	w17, #0x0                   	// #0
     6c4:	f27b00ff 	tst	x7, #0x20
     6c8:	52800c24 	mov	w4, #0x61                  	// #97
     6cc:	5280082e 	mov	w14, #0x41                  	// #65
     6d0:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     6d4:	510029ce 	sub	w14, w14, #0xa
     6d8:	910043e4 	add	x4, sp, #0x10
     6dc:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     6e0:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     6e4:	910004a5 	add	x5, x5, #0x1
     6e8:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     6ec:	9b0ba58a 	msub	x10, x12, x11, x9
     6f0:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     6f4:	f100255f 	cmp	x10, #0x9
     6f8:	1100c10a 	add	w10, w8, #0x30
     6fc:	0b0e0108 	add	w8, w8, w14
     700:	12001d4a 	and	w10, w10, #0xff
     704:	12001d08 	and	w8, w8, #0xff
     708:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     70c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     710:	eb0b013f 	cmp	x9, x11
            value /= base;
     714:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     718:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     71c:	54fffe29 	b.ls	6e0 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     720:	370ffa47 	tbnz	w7, #1, 668 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     724:	f1007cbf 	cmp	x5, #0x1f
     728:	2a0f03e9 	mov	w9, w15
     72c:	1a9f87ea 	cset	w10, ls  // ls = plast
     730:	eb05013f 	cmp	x9, x5
     734:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     738:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     73c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     740:	34fff686 	cbz	w6, 610 <_ntoa_long+0x60>
     744:	3400048c 	cbz	w12, 7d4 <_ntoa_long+0x224>
     748:	35000072 	cbnz	w18, 754 <_ntoa_long+0x1a4>
     74c:	721e04ff 	tst	w7, #0xc
     750:	54000040 	b.eq	758 <_ntoa_long+0x1a8>  // b.none
            width--;
     754:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     758:	35fff5e8 	cbnz	w8, 614 <_ntoa_long+0x64>
     75c:	17ffffb8 	b	63c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     760:	121c0111 	and	w17, w8, #0x10
     764:	2a0803e7 	mov	w7, w8
     768:	17ffffd7 	b	6c4 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     76c:	eb2f40bf 	cmp	x5, w15, uxtw
     770:	54000480 	b.eq	800 <_ntoa_long+0x250>  // b.none
     774:	eb2640bf 	cmp	x5, w6, uxtw
     778:	54000440 	b.eq	800 <_ntoa_long+0x250>  // b.none
     77c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     780:	f1007cbf 	cmp	x5, #0x1f
     784:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     788:	f100417f 	cmp	x11, #0x10
     78c:	54000480 	b.eq	81c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     790:	7100011f 	cmp	w8, #0x0
     794:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     798:	54000081 	b.ne	7a8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     79c:	52800c48 	mov	w8, #0x62                  	// #98
     7a0:	38256888 	strb	w8, [x4, x5]
     7a4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     7a8:	f10080bf 	cmp	x5, #0x20
     7ac:	54fff721 	b.ne	690 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     7b0:	97ffff3c 	bl	4a0 <_out_rev>
}
     7b4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     7b8:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     7bc:	37100167 	tbnz	w7, #2, 7e8 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     7c0:	361ff7a7 	tbz	w7, #3, 6b4 <_ntoa_long+0x104>
            buf[len++] = ' ';
     7c4:	52800408 	mov	w8, #0x20                  	// #32
     7c8:	38256888 	strb	w8, [x4, x5]
     7cc:	910004a5 	add	x5, x5, #0x1
     7d0:	17ffffb9 	b	6b4 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     7d4:	35fff208 	cbnz	w8, 614 <_ntoa_long+0x64>
     7d8:	17ffffa4 	b	668 <_ntoa_long+0xb8>
     7dc:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     7e0:	d2800005 	mov	x5, #0x0                   	// #0
     7e4:	17ffffb0 	b	6a4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     7e8:	52800568 	mov	w8, #0x2b                  	// #43
     7ec:	38256888 	strb	w8, [x4, x5]
     7f0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     7f4:	97ffff2b 	bl	4a0 <_out_rev>
}
     7f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     7fc:	d65f03c0 	ret
            if (len && (base == 16U)) {
     800:	f10004aa 	subs	x10, x5, #0x1
                len--;
     804:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     808:	1a9f07e8 	cset	w8, ne  // ne = any
     80c:	7100417f 	cmp	w11, #0x10
     810:	1a9f17e9 	cset	w9, eq  // eq = none
     814:	6a090108 	ands	w8, w8, w9
     818:	54000160 	b.eq	844 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     81c:	721b00e9 	ands	w9, w7, #0x20
     820:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     824:	54000141 	b.ne	84c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     828:	7100013f 	cmp	w9, #0x0
     82c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     830:	54fffbc0 	b.eq	7a8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     834:	52800b08 	mov	w8, #0x58                  	// #88
     838:	38256888 	strb	w8, [x4, x5]
     83c:	910004a5 	add	x5, x5, #0x1
     840:	17ffffda 	b	7a8 <_ntoa_long+0x1f8>
            len--;
     844:	aa0a03e5 	mov	x5, x10
     848:	17ffffce 	b	780 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     84c:	52800f08 	mov	w8, #0x78                  	// #120
     850:	38256888 	strb	w8, [x4, x5]
     854:	910004a5 	add	x5, x5, #0x1
     858:	17ffffd4 	b	7a8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     85c:	52800028 	mov	w8, #0x1                   	// #1
     860:	17ffffef 	b	81c <_ntoa_long+0x26c>
            buf[len++] = '0';
     864:	52800608 	mov	w8, #0x30                  	// #48
     868:	d2800025 	mov	x5, #0x1                   	// #1
     86c:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     870:	17ffff8d 	b	6a4 <_ntoa_long+0xf4>
     874:	d503201f 	nop
     878:	d503201f 	nop
     87c:	d503201f 	nop

0000000000000880 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     880:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     884:	1e602000 	fcmp	d0, d0
{
     888:	a9017bfd 	stp	x29, x30, [sp, #16]
     88c:	910043fd 	add	x29, sp, #0x10
     890:	a90253f3 	stp	x19, x20, [sp, #32]
     894:	aa0203f3 	mov	x19, x2
     898:	2a0603f4 	mov	w20, w6
     89c:	a9035bf5 	stp	x21, x22, [sp, #48]
     8a0:	2a0503f6 	mov	w22, w5
     8a4:	a90463f7 	stp	x23, x24, [sp, #64]
     8a8:	aa0003f7 	mov	x23, x0
     8ac:	a9056bf9 	stp	x25, x26, [sp, #80]
     8b0:	aa0103f9 	mov	x25, x1
     8b4:	a90673fb 	stp	x27, x28, [sp, #96]
     8b8:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     8bc:	54001361 	b.ne	b28 <_etoa+0x2a8>  // b.any
     8c0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     8c4:	9e670001 	fmov	d1, x0
     8c8:	1e612010 	fcmpe	d0, d1
     8cc:	540012ec 	b.gt	b28 <_etoa+0x2a8>
     8d0:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     8d4:	9e670001 	fmov	d1, x0
     8d8:	1e612010 	fcmpe	d0, d1
     8dc:	54001264 	b.mi	b28 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     8e0:	1e602018 	fcmpe	d0, #0.0
     8e4:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     8e8:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     8ec:	fd43f817 	ldr	d23, [x0, #2032]
     8f0:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     8f4:	fd43fc01 	ldr	d1, [x0, #2040]
     8f8:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     8fc:	fd440016 	ldr	d22, [x0, #2048]
     900:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     904:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     908:	fd440406 	ldr	d6, [x0, #2056]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     90c:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     910:	fd440815 	ldr	d21, [x0, #2064]
     914:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     918:	fd440c14 	ldr	d20, [x0, #2072]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     91c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     920:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     924:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     928:	1e659002 	fmov	d2, #1.400000000000000000e+01
     92c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     930:	1e631013 	fmov	d19, #6.000000000000000000e+00
     934:	1e601010 	fmov	d16, #2.000000000000000000e+00
     938:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     93c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     940:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     944:	d374f821 	ubfx	x1, x1, #52, #11
     948:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     94c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     950:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     954:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     958:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     95c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     960:	1e7838a5 	fsub	d5, d5, d24
     964:	1e770884 	fmul	d4, d4, d23
     968:	1e7608a5 	fmul	d5, d5, d22
     96c:	1e612884 	fadd	d4, d4, d1
     970:	1e652884 	fadd	d4, d4, d5
     974:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     978:	1e620301 	scvtf	d1, w24
     97c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     980:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     984:	1e632884 	fadd	d4, d4, d3
     988:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     98c:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     990:	110ffc00 	add	w0, w0, #0x3ff
     994:	9e670004 	fmov	d4, x0
     998:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     99c:	1e740863 	fmul	d3, d3, d20
     9a0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     9a4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     9a8:	1e613a05 	fsub	d5, d16, d1
     9ac:	1e612821 	fadd	d1, d1, d1
     9b0:	1e621862 	fdiv	d2, d3, d2
     9b4:	1e712842 	fadd	d2, d2, d17
     9b8:	1e621862 	fdiv	d2, d3, d2
     9bc:	1e732842 	fadd	d2, d2, d19
     9c0:	1e621863 	fdiv	d3, d3, d2
     9c4:	1e652863 	fadd	d3, d3, d5
     9c8:	1e631821 	fdiv	d1, d1, d3
     9cc:	1e722821 	fadd	d1, d1, d18
     9d0:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     9d4:	1e672030 	fcmpe	d1, d7
     9d8:	54000c4c 	b.gt	b60 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     9dc:	11018f00 	add	w0, w24, #0x63
     9e0:	7103181f 	cmp	w0, #0xc6
     9e4:	1a9f97fc 	cset	w28, hi  // hi = pmore
     9e8:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     9ec:	36580134 	tbz	w20, #11, a10 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     9f0:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     9f4:	fd441002 	ldr	d2, [x0, #2080]
     9f8:	1e6220f0 	fcmpe	d7, d2
     9fc:	54000d2a 	b.ge	ba0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     a00:	34000084 	cbz	w4, a10 <_etoa+0x190>
                --prec;
     a04:	7100007f 	cmp	w3, #0x0
     a08:	1a9f07e0 	cset	w0, ne  // ne = any
     a0c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     a10:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     a14:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     a18:	4b1c02c5 	sub	w5, w22, w28
     a1c:	5280003a 	mov	w26, #0x1                   	// #1
     a20:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     a24:	7100001f 	cmp	w0, #0x0
     a28:	1a9f07e0 	cset	w0, ne  // ne = any
     a2c:	b9007fe0 	str	w0, [sp, #124]
     a30:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     a34:	34000058 	cbz	w24, a3c <_etoa+0x1bc>
        value /= conv.F;
     a38:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     a3c:	1e602018 	fcmpe	d0, #0.0
     a40:	54000ac4 	b.mi	b98 <_etoa+0x318>  // b.first
     a44:	1e6040e0 	fmov	d0, d7
     a48:	12147a86 	and	w6, w20, #0xfffff7ff
     a4c:	aa1b03e3 	mov	x3, x27
     a50:	aa1303e2 	mov	x2, x19
     a54:	aa1903e1 	mov	x1, x25
     a58:	aa1703e0 	mov	x0, x23
     a5c:	94000071 	bl	c20 <_ftoa>
     a60:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     a64:	3400051a 	cbz	w26, b04 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     a68:	f27b029f 	tst	x20, #0x20
     a6c:	528008a1 	mov	w1, #0x45                  	// #69
     a70:	aa1503e2 	mov	x2, x21
     a74:	aa1b03e3 	mov	x3, x27
     a78:	52800ca0 	mov	w0, #0x65                  	// #101
     a7c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     a80:	aa1903e1 	mov	x1, x25
     a84:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     a88:	7100031f 	cmp	w24, #0x0
     a8c:	528000a0 	mov	w0, #0x5                   	// #5
     a90:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     a94:	5100079c 	sub	w28, w28, #0x1
     a98:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     a9c:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     aa0:	b9000be0 	str	w0, [sp, #8]
     aa4:	93407c84 	sxtw	x4, w4
     aa8:	531f7f05 	lsr	w5, w24, #31
     aac:	aa1b03e3 	mov	x3, x27
     ab0:	aa1903e1 	mov	x1, x25
     ab4:	aa1703e0 	mov	x0, x23
     ab8:	52800007 	mov	w7, #0x0                   	// #0
     abc:	d2800146 	mov	x6, #0xa                   	// #10
     ac0:	97fffebc 	bl	5b0 <_ntoa_long>
     ac4:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     ac8:	b9407fe0 	ldr	w0, [sp, #124]
     acc:	340001c0 	cbz	w0, b04 <_etoa+0x284>
            while (idx - start_idx < width)
     ad0:	cb1302b3 	sub	x19, x21, x19
     ad4:	eb1302df 	cmp	x22, x19
     ad8:	54000169 	b.ls	b04 <_etoa+0x284>  // b.plast
     adc:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     ae0:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     ae4:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     ae8:	aa1b03e3 	mov	x3, x27
     aec:	aa1903e1 	mov	x1, x25
     af0:	52800400 	mov	w0, #0x20                  	// #32
     af4:	d63f02e0 	blr	x23
     af8:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     afc:	eb1302df 	cmp	x22, x19
     b00:	54ffff08 	b.hi	ae0 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     b04:	aa1503e0 	mov	x0, x21
     b08:	a9417bfd 	ldp	x29, x30, [sp, #16]
     b0c:	a94253f3 	ldp	x19, x20, [sp, #32]
     b10:	a9435bf5 	ldp	x21, x22, [sp, #48]
     b14:	a94463f7 	ldp	x23, x24, [sp, #64]
     b18:	a9456bf9 	ldp	x25, x26, [sp, #80]
     b1c:	a94673fb 	ldp	x27, x28, [sp, #96]
     b20:	910203ff 	add	sp, sp, #0x80
     b24:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     b28:	2a1403e6 	mov	w6, w20
     b2c:	2a1603e5 	mov	w5, w22
     b30:	aa1b03e3 	mov	x3, x27
     b34:	aa1303e2 	mov	x2, x19
     b38:	aa1903e1 	mov	x1, x25
     b3c:	aa1703e0 	mov	x0, x23
}
     b40:	a9417bfd 	ldp	x29, x30, [sp, #16]
     b44:	a94253f3 	ldp	x19, x20, [sp, #32]
     b48:	a9435bf5 	ldp	x21, x22, [sp, #48]
     b4c:	a94463f7 	ldp	x23, x24, [sp, #64]
     b50:	a9456bf9 	ldp	x25, x26, [sp, #80]
     b54:	a94673fb 	ldp	x27, x28, [sp, #96]
     b58:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     b5c:	14000031 	b	c20 <_ftoa>
        conv.F /= 10;
     b60:	1e711821 	fdiv	d1, d1, d17
        expval--;
     b64:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     b68:	11018f00 	add	w0, w24, #0x63
     b6c:	7103181f 	cmp	w0, #0xc6
     b70:	1a9f97fc 	cset	w28, hi  // hi = pmore
     b74:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     b78:	365ff4d4 	tbz	w20, #11, a10 <_etoa+0x190>
     b7c:	17ffff9d 	b	9f0 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     b80:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     b84:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     b88:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     b8c:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     b90:	5280001a 	mov	w26, #0x0                   	// #0
     b94:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     b98:	1e6140e7 	fneg	d7, d7
     b9c:	17ffffaa 	b	a44 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     ba0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     ba4:	f2e825c0 	movk	x0, #0x412e, lsl #48
     ba8:	9e670002 	fmov	d2, x0
     bac:	1e6220f0 	fcmpe	d7, d2
     bb0:	54000044 	b.mi	bb8 <_etoa+0x338>  // b.first
     bb4:	17ffff93 	b	a00 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     bb8:	6b180080 	subs	w0, w4, w24
     bbc:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     bc0:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     bc4:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     bc8:	35000196 	cbnz	w22, bf8 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     bcc:	1e602018 	fcmpe	d0, #0.0
     bd0:	54fffd84 	b.mi	b80 <_etoa+0x300>  // b.first
     bd4:	12147a86 	and	w6, w20, #0xfffff7ff
     bd8:	1e6040e0 	fmov	d0, d7
     bdc:	321600c6 	orr	w6, w6, #0x400
     be0:	aa1b03e3 	mov	x3, x27
     be4:	aa1303e2 	mov	x2, x19
     be8:	aa1903e1 	mov	x1, x25
     bec:	aa1703e0 	mov	x0, x23
     bf0:	52800005 	mov	w5, #0x0                   	// #0
     bf4:	17ffffd3 	b	b40 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     bf8:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     bfc:	2a1603e5 	mov	w5, w22
     c00:	5280001a 	mov	w26, #0x0                   	// #0
     c04:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     c08:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     c0c:	b9007fff 	str	wzr, [sp, #124]
     c10:	17ffff8b 	b	a3c <_etoa+0x1bc>
     c14:	d503201f 	nop
     c18:	d503201f 	nop
     c1c:	d503201f 	nop

0000000000000c20 <_ftoa>:
    if (value != value)
     c20:	1e602000 	fcmp	d0, d0
{
     c24:	2a0603e7 	mov	w7, w6
    if (value != value)
     c28:	54000e01 	b.ne	de8 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     c2c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     c30:	9e6700c1 	fmov	d1, x6
     c34:	1e612010 	fcmpe	d0, d1
     c38:	54001184 	b.mi	e68 <_ftoa+0x248>  // b.first
     c3c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     c40:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     c44:	9e670001 	fmov	d1, x0
     c48:	aa0103f0 	mov	x16, x1
     c4c:	aa0203f1 	mov	x17, x2
     c50:	aa0303f2 	mov	x18, x3
     c54:	1e612010 	fcmpe	d0, d1
     c58:	54000b2c 	b.gt	dbc <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     c5c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     c60:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     c64:	9e670001 	fmov	d1, x0
     c68:	1e612010 	fcmpe	d0, d1
     c6c:	54000f2c 	b.gt	e50 <_ftoa+0x230>
     c70:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     c74:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     c78:	9e670001 	fmov	d1, x0
     c7c:	1e612010 	fcmpe	d0, d1
     c80:	54000e84 	b.mi	e50 <_ftoa+0x230>  // b.first
    if (value < 0) {
     c84:	1e602018 	fcmpe	d0, #0.0
{
     c88:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     c8c:	910003fd 	mov	x29, sp
    if (value < 0) {
     c90:	54000ca4 	b.mi	e24 <_ftoa+0x204>  // b.first
    bool negative = false;
     c94:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     c98:	36500ce7 	tbz	w7, #10, e34 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     c9c:	7100249f 	cmp	w4, #0x9
     ca0:	910043ec 	add	x12, sp, #0x10
     ca4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     ca8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     cac:	54001929 	b.ls	fd0 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     cb0:	91000508 	add	x8, x8, #0x1
        prec--;
     cb4:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     cb8:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     cbc:	f1007d1f 	cmp	x8, #0x1f
     cc0:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     cc4:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     cc8:	54ffff48 	b.hi	cb0 <_ftoa+0x90>  // b.pmore
     ccc:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     cd0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     cd4:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     cd8:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     cdc:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     ce0:	1e620141 	scvtf	d1, w10
     ce4:	1e613801 	fsub	d1, d0, d1
     ce8:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     cec:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     cf0:	9e6301c4 	ucvtf	d4, x14
     cf4:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     cf8:	1e632030 	fcmpe	d1, d3
     cfc:	5400112c 	b.gt	f20 <_ftoa+0x300>
    } else if (diff < 0.5) {
     d00:	54000084 	b.mi	d10 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     d04:	b500154e 	cbnz	x14, fac <_ftoa+0x38c>
        ++frac;
     d08:	910005ce 	add	x14, x14, #0x1
     d0c:	d503201f 	nop
    if (prec == 0U) {
     d10:	35000b64 	cbnz	w4, e7c <_ftoa+0x25c>
        diff = value - (double)whole;
     d14:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     d18:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     d1c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     d20:	1e622010 	fcmpe	d0, d2
     d24:	540011a4 	b.mi	f58 <_ftoa+0x338>  // b.first
            ++whole;
     d28:	12000140 	and	w0, w10, #0x1
     d2c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     d30:	528ccce1 	mov	w1, #0x6667                	// #26215
     d34:	72acccc1 	movk	w1, #0x6666, lsl #16
     d38:	52800142 	mov	w2, #0xa                   	// #10
     d3c:	d503201f 	nop
     d40:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     d44:	f100811f 	cmp	x8, #0x20
     d48:	54000c20 	b.eq	ecc <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     d4c:	9362fd29 	asr	x9, x9, #34
     d50:	91000508 	add	x8, x8, #0x1
     d54:	4b8a7d29 	sub	w9, w9, w10, asr #31
     d58:	8b080180 	add	x0, x12, x8
     d5c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     d60:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     d64:	1100c169 	add	w9, w11, #0x30
     d68:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     d6c:	35fffeaa 	cbnz	w10, d40 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     d70:	120004e0 	and	w0, w7, #0x3
     d74:	7100041f 	cmp	w0, #0x1
     d78:	54000b00 	b.eq	ed8 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     d7c:	f1007d1f 	cmp	x8, #0x1f
     d80:	540000a8 	b.hi	d94 <_ftoa+0x174>  // b.pmore
        if (negative) {
     d84:	34000de3 	cbz	w3, f40 <_ftoa+0x320>
            buf[len++] = '-';
     d88:	528005a0 	mov	w0, #0x2d                  	// #45
     d8c:	38286980 	strb	w0, [x12, x8]
     d90:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     d94:	2a0503e6 	mov	w6, w5
     d98:	aa0c03e4 	mov	x4, x12
     d9c:	aa0803e5 	mov	x5, x8
     da0:	aa1203e3 	mov	x3, x18
     da4:	aa1103e2 	mov	x2, x17
     da8:	aa1003e1 	mov	x1, x16
     dac:	aa0f03e0 	mov	x0, x15
     db0:	97fffdbc 	bl	4a0 <_out_rev>
}
     db4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     db8:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     dbc:	37100207 	tbnz	w7, #2, dfc <_ftoa+0x1dc>
     dc0:	d2800060 	mov	x0, #0x3                   	// #3
     dc4:	2a0503e6 	mov	w6, w5
     dc8:	f0000044 	adrp	x4, b000 <_findenv_r+0x10>
     dcc:	911b0084 	add	x4, x4, #0x6c0
     dd0:	aa0003e5 	mov	x5, x0
     dd4:	aa1203e3 	mov	x3, x18
     dd8:	aa1103e2 	mov	x2, x17
     ddc:	aa1003e1 	mov	x1, x16
     de0:	aa0f03e0 	mov	x0, x15
     de4:	17fffdaf 	b	4a0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     de8:	2a0503e6 	mov	w6, w5
     dec:	f0000044 	adrp	x4, b000 <_findenv_r+0x10>
     df0:	d2800065 	mov	x5, #0x3                   	// #3
     df4:	911b4084 	add	x4, x4, #0x6d0
     df8:	17fffdaa 	b	4a0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     dfc:	d2800080 	mov	x0, #0x4                   	// #4
     e00:	2a0503e6 	mov	w6, w5
     e04:	f0000044 	adrp	x4, b000 <_findenv_r+0x10>
     e08:	911b2084 	add	x4, x4, #0x6c8
     e0c:	aa0003e5 	mov	x5, x0
     e10:	aa1203e3 	mov	x3, x18
     e14:	aa1103e2 	mov	x2, x17
     e18:	aa1003e1 	mov	x1, x16
     e1c:	aa0f03e0 	mov	x0, x15
     e20:	17fffda0 	b	4a0 <_out_rev>
        value = 0 - value;
     e24:	2f00e401 	movi	d1, #0x0
        negative = true;
     e28:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     e2c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     e30:	3757f367 	tbnz	w7, #10, c9c <_ftoa+0x7c>
     e34:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     e38:	910043ec 	add	x12, sp, #0x10
     e3c:	f2e825c0 	movk	x0, #0x412e, lsl #48
     e40:	d2800008 	mov	x8, #0x0                   	// #0
     e44:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     e48:	528000c4 	mov	w4, #0x6                   	// #6
     e4c:	17ffffa3 	b	cd8 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     e50:	2a0703e6 	mov	w6, w7
     e54:	aa1203e3 	mov	x3, x18
     e58:	aa1103e2 	mov	x2, x17
     e5c:	aa1003e1 	mov	x1, x16
     e60:	aa0f03e0 	mov	x0, x15
     e64:	17fffe87 	b	880 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     e68:	2a0503e6 	mov	w6, w5
     e6c:	f0000044 	adrp	x4, b000 <_findenv_r+0x10>
     e70:	d2800085 	mov	x5, #0x4                   	// #4
     e74:	911b6084 	add	x4, x4, #0x6d8
     e78:	17fffd8a 	b	4a0 <_out_rev>
     e7c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     e80:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     e84:	0b080021 	add	w1, w1, w8
     e88:	f29999a2 	movk	x2, #0xcccd
     e8c:	1400000d 	b	ec0 <_ftoa+0x2a0>
     e90:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     e94:	f10025df 	cmp	x14, #0x9
            --count;
     e98:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     e9c:	91000509 	add	x9, x8, #0x1
     ea0:	8b0b096d 	add	x13, x11, x11, lsl #2
     ea4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     ea8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     eac:	1100c1ab 	add	w11, w13, #0x30
     eb0:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     eb4:	54000569 	b.ls	f60 <_ftoa+0x340>  // b.plast
            --count;
     eb8:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     ebc:	aa0903e8 	mov	x8, x9
     ec0:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     ec4:	6b01009f 	cmp	w4, w1
     ec8:	54fffe41 	b.ne	e90 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     ecc:	120004e0 	and	w0, w7, #0x3
     ed0:	7100041f 	cmp	w0, #0x1
     ed4:	54fff601 	b.ne	d94 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     ed8:	34fff525 	cbz	w5, d7c <_ftoa+0x15c>
     edc:	35000763 	cbnz	w3, fc8 <_ftoa+0x3a8>
     ee0:	721e04ff 	tst	w7, #0xc
     ee4:	54000721 	b.ne	fc8 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     ee8:	2a0503e1 	mov	w1, w5
     eec:	eb01011f 	cmp	x8, x1
     ef0:	54fff462 	b.cs	d7c <_ftoa+0x15c>  // b.hs, b.nlast
     ef4:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     ef8:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     efc:	54fff4c8 	b.hi	d94 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     f00:	91000508 	add	x8, x8, #0x1
     f04:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     f08:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     f0c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     f10:	54fff360 	b.eq	d7c <_ftoa+0x15c>  // b.none
     f14:	f100811f 	cmp	x8, #0x20
     f18:	54ffff41 	b.ne	f00 <_ftoa+0x2e0>  // b.any
     f1c:	17ffff9e 	b	d94 <_ftoa+0x174>
        ++frac;
     f20:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
     f24:	9e6301c1 	ucvtf	d1, x14
     f28:	1e622030 	fcmpe	d1, d2
     f2c:	5400004a 	b.ge	f34 <_ftoa+0x314>  // b.tcont
     f30:	17ffff78 	b	d10 <_ftoa+0xf0>
            ++whole;
     f34:	1100054a 	add	w10, w10, #0x1
            frac = 0;
     f38:	d280000e 	mov	x14, #0x0                   	// #0
     f3c:	17ffff75 	b	d10 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
     f40:	371003c7 	tbnz	w7, #2, fb8 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
     f44:	361ff287 	tbz	w7, #3, d94 <_ftoa+0x174>
            buf[len++] = ' ';
     f48:	52800400 	mov	w0, #0x20                  	// #32
     f4c:	38286980 	strb	w0, [x12, x8]
     f50:	91000508 	add	x8, x8, #0x1
     f54:	17ffff90 	b	d94 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     f58:	54ffee8c 	b.gt	d28 <_ftoa+0x108>
     f5c:	17ffff75 	b	d30 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f60:	f100813f 	cmp	x9, #0x20
     f64:	54000420 	b.eq	fe8 <_ftoa+0x3c8>  // b.none
     f68:	91000901 	add	x1, x8, #0x2
     f6c:	51000884 	sub	w4, w4, #0x2
     f70:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
     f74:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f78:	34000340 	cbz	w0, fe0 <_ftoa+0x3c0>
     f7c:	d503201f 	nop
            buf[len++] = '0';
     f80:	91000529 	add	x9, x9, #0x1
     f84:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f88:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
     f8c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     f90:	540002c0 	b.eq	fe8 <_ftoa+0x3c8>  // b.none
     f94:	eb01013f 	cmp	x9, x1
     f98:	54ffff41 	b.ne	f80 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
     f9c:	528005c0 	mov	w0, #0x2e                  	// #46
     fa0:	91000428 	add	x8, x1, #0x1
     fa4:	38216980 	strb	w0, [x12, x1]
     fa8:	17ffff62 	b	d30 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
     fac:	3607eb2e 	tbz	w14, #0, d10 <_ftoa+0xf0>
        ++frac;
     fb0:	910005ce 	add	x14, x14, #0x1
     fb4:	17ffff57 	b	d10 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
     fb8:	52800560 	mov	w0, #0x2b                  	// #43
     fbc:	38286980 	strb	w0, [x12, x8]
     fc0:	91000508 	add	x8, x8, #0x1
     fc4:	17ffff74 	b	d94 <_ftoa+0x174>
            width--;
     fc8:	510004a5 	sub	w5, w5, #0x1
     fcc:	17ffffc7 	b	ee8 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
     fd0:	f0000040 	adrp	x0, b000 <_findenv_r+0x10>
     fd4:	911e8000 	add	x0, x0, #0x7a0
     fd8:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
     fdc:	17ffff3f 	b	cd8 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
     fe0:	aa0903e1 	mov	x1, x9
     fe4:	17ffffee 	b	f9c <_ftoa+0x37c>
            buf[len++] = '0';
     fe8:	aa0903e8 	mov	x8, x9
     fec:	17ffffb8 	b	ecc <_ftoa+0x2ac>

0000000000000ff0 <_out_char>:
    if (character) {
     ff0:	72001c00 	ands	w0, w0, #0xff
     ff4:	54000041 	b.ne	ffc <_out_char+0xc>  // b.any
}
     ff8:	d65f03c0 	ret
        _putchar(character);
     ffc:	17fffd05 	b	410 <putc>

0000000000001000 <_out_fct>:
    if (character) {
    1000:	72001c00 	ands	w0, w0, #0xff
    1004:	54000080 	b.eq	1014 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    1008:	a9400422 	ldp	x2, x1, [x1]
    100c:	aa0203f0 	mov	x16, x2
    1010:	d61f0200 	br	x16
}
    1014:	d65f03c0 	ret
    1018:	d503201f 	nop
    101c:	d503201f 	nop

0000000000001020 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    1020:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    1024:	f100003f 	cmp	x1, #0x0
{
    1028:	a9017bfd 	stp	x29, x30, [sp, #16]
    102c:	910043fd 	add	x29, sp, #0x10
    1030:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    1034:	f0fffff3 	adrp	x19, 0 <main>
    1038:	91124273 	add	x19, x19, #0x490
{
    103c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    1040:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    1044:	aa0103fa 	mov	x26, x1
    1048:	a90673fb 	stp	x27, x28, [sp, #96]
    104c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    1050:	d280001b 	mov	x27, #0x0                   	// #0
    1054:	b9401880 	ldr	w0, [x4, #24]
    1058:	b9007be0 	str	w0, [sp, #120]
    105c:	f9400480 	ldr	x0, [x4, #8]
    1060:	f90047e0 	str	x0, [sp, #136]
    1064:	39400065 	ldrb	w5, [x3]
    1068:	f9400880 	ldr	x0, [x4, #16]
    106c:	f9004be0 	str	x0, [sp, #144]
    1070:	b9401c80 	ldr	w0, [x4, #28]
    1074:	b900abe0 	str	w0, [sp, #168]
    1078:	f9400094 	ldr	x20, [x4]
    107c:	34003ae5 	cbz	w5, 17d8 <_vsnprintf+0x7b8>
    1080:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    1084:	d0000058 	adrp	x24, b000 <_findenv_r+0x10>
    1088:	911b8300 	add	x0, x24, #0x6e0
    108c:	aa0303f9 	mov	x25, x3
    1090:	f90043e0 	str	x0, [sp, #128]
    1094:	d0000040 	adrp	x0, b000 <_findenv_r+0x10>
    1098:	911e2000 	add	x0, x0, #0x788
    109c:	f9004fe0 	str	x0, [sp, #152]
    10a0:	1400000a 	b	10c8 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    10a4:	91000764 	add	x4, x27, #0x1
    10a8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    10ac:	aa1b03e2 	mov	x2, x27
    10b0:	aa1c03e3 	mov	x3, x28
    10b4:	aa1a03e1 	mov	x1, x26
    10b8:	aa0403fb 	mov	x27, x4
    10bc:	d63f0260 	blr	x19
    while (*format) {
    10c0:	39400325 	ldrb	w5, [x25]
    10c4:	34000c85 	cbz	w5, 1254 <_vsnprintf+0x234>
            format++;
    10c8:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    10cc:	710094bf 	cmp	w5, #0x25
    10d0:	54fffea1 	b.ne	10a4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    10d4:	aa1903e8 	mov	x8, x25
        flags = 0U;
    10d8:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    10dc:	38401500 	ldrb	w0, [x8], #1
    10e0:	7100ac1f 	cmp	w0, #0x2b
    10e4:	54000180 	b.eq	1114 <_vsnprintf+0xf4>  // b.none
    10e8:	540001c8 	b.hi	1120 <_vsnprintf+0x100>  // b.pmore
    10ec:	7100801f 	cmp	w0, #0x20
    10f0:	54000260 	b.eq	113c <_vsnprintf+0x11c>  // b.none
    10f4:	71008c1f 	cmp	w0, #0x23
    10f8:	540002e1 	b.ne	1154 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    10fc:	321c00c6 	orr	w6, w6, #0x10
            format++;
    1100:	aa0803f9 	mov	x25, x8
            switch (*format) {
    1104:	aa1903e8 	mov	x8, x25
    1108:	38401500 	ldrb	w0, [x8], #1
    110c:	7100ac1f 	cmp	w0, #0x2b
    1110:	54fffec1 	b.ne	10e8 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    1114:	321e00c6 	orr	w6, w6, #0x4
            format++;
    1118:	aa0803f9 	mov	x25, x8
    111c:	17fffffa 	b	1104 <_vsnprintf+0xe4>
            switch (*format) {
    1120:	7100b41f 	cmp	w0, #0x2d
    1124:	54000120 	b.eq	1148 <_vsnprintf+0x128>  // b.none
    1128:	7100c01f 	cmp	w0, #0x30
    112c:	540062c1 	b.ne	1d84 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    1130:	320000c6 	orr	w6, w6, #0x1
            format++;
    1134:	aa0803f9 	mov	x25, x8
    1138:	17fffff3 	b	1104 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    113c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    1140:	aa0803f9 	mov	x25, x8
    1144:	17fffff0 	b	1104 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    1148:	321f00c6 	orr	w6, w6, #0x2
            format++;
    114c:	aa0803f9 	mov	x25, x8
    1150:	17ffffed 	b	1104 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    1154:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    1158:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    115c:	540002e0 	b.eq	11b8 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    1160:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    1164:	7101b01f 	cmp	w0, #0x6c
            format++;
    1168:	aa0803e4 	mov	x4, x8
        switch (*format) {
    116c:	54001f20 	b.eq	1550 <_vsnprintf+0x530>  // b.none
    1170:	54000588 	b.hi	1220 <_vsnprintf+0x200>  // b.pmore
    1174:	7101a01f 	cmp	w0, #0x68
    1178:	54001e20 	b.eq	153c <_vsnprintf+0x51c>  // b.none
    117c:	7101a81f 	cmp	w0, #0x6a
    1180:	54006241 	b.ne	1dc8 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    1184:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    1188:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    118c:	51009402 	sub	w2, w0, #0x25
            format++;
    1190:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    1194:	71014c5f 	cmp	w2, #0x53
    1198:	54000069 	b.ls	11a4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    119c:	91000764 	add	x4, x27, #0x1
    11a0:	17ffffc3 	b	10ac <_vsnprintf+0x8c>
        switch (*format) {
    11a4:	f94043e1 	ldr	x1, [sp, #128]
    11a8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    11ac:	10000062 	adr	x2, 11b8 <_vsnprintf+0x198>
    11b0:	8b21a841 	add	x1, x2, w1, sxth #2
    11b4:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    11b8:	b9407be0 	ldr	w0, [sp, #120]
    11bc:	37f806c0 	tbnz	w0, #31, 1294 <_vsnprintf+0x274>
    11c0:	91002e82 	add	x2, x20, #0xb
    11c4:	aa1403e0 	mov	x0, x20
    11c8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    11cc:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    11d0:	36f80078 	tbz	w24, #31, 11dc <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    11d4:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    11d8:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    11dc:	39400720 	ldrb	w0, [x25, #1]
            format++;
    11e0:	aa0803f9 	mov	x25, x8
    11e4:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    11e8:	7100b81f 	cmp	w0, #0x2e
    11ec:	54fffba1 	b.ne	1160 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    11f0:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    11f4:	321600c6 	orr	w6, w6, #0x400
            format++;
    11f8:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    11fc:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1200:	12001c42 	and	w2, w2, #0xff
    1204:	7100245f 	cmp	w2, #0x9
    1208:	54001b29 	b.ls	156c <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    120c:	7100a81f 	cmp	w0, #0x2a
    1210:	54002a20 	b.eq	1754 <_vsnprintf+0x734>  // b.none
            format++;
    1214:	aa0803f9 	mov	x25, x8
    1218:	91000508 	add	x8, x8, #0x1
    121c:	17ffffd1 	b	1160 <_vsnprintf+0x140>
        switch (*format) {
    1220:	7101d01f 	cmp	w0, #0x74
    1224:	54fffb00 	b.eq	1184 <_vsnprintf+0x164>  // b.none
    1228:	7101e81f 	cmp	w0, #0x7a
    122c:	54fffac0 	b.eq	1184 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1230:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1234:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1238:	7100245f 	cmp	w2, #0x9
    123c:	54fffb08 	b.hi	119c <_vsnprintf+0x17c>  // b.pmore
    1240:	f9404fe1 	ldr	x1, [sp, #152]
    1244:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1248:	10000062 	adr	x2, 1254 <_vsnprintf+0x234>
    124c:	8b21a841 	add	x1, x2, w1, sxth #2
    1250:	d61f0020 	br	x1
    1254:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    1258:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    125c:	eb1b039f 	cmp	x28, x27
    1260:	d1000782 	sub	x2, x28, #0x1
    1264:	aa1a03e1 	mov	x1, x26
    1268:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    126c:	aa1c03e3 	mov	x3, x28
    1270:	52800000 	mov	w0, #0x0                   	// #0
    1274:	d63f0260 	blr	x19
}
    1278:	2a1403e0 	mov	w0, w20
    127c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1280:	a94253f3 	ldp	x19, x20, [sp, #32]
    1284:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1288:	a94673fb 	ldp	x27, x28, [sp, #96]
    128c:	9102c3ff 	add	sp, sp, #0xb0
    1290:	d65f03c0 	ret
            const int w = va_arg(va, int);
    1294:	b9407be0 	ldr	w0, [sp, #120]
    1298:	11002002 	add	w2, w0, #0x8
    129c:	7100005f 	cmp	w2, #0x0
    12a0:	5400228d 	b.le	16f0 <_vsnprintf+0x6d0>
    12a4:	91002e84 	add	x4, x20, #0xb
    12a8:	aa1403e0 	mov	x0, x20
    12ac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    12b0:	b9007be2 	str	w2, [sp, #120]
    12b4:	17ffffc6 	b	11cc <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    12b8:	121a7802 	and	w2, w0, #0xffffffdf
    12bc:	7101605f 	cmp	w2, #0x58
    12c0:	54001781 	b.ne	15b0 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    12c4:	7101601f 	cmp	w0, #0x58
    12c8:	54003c81 	b.ne	1a58 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    12cc:	321b00c6 	orr	w6, w6, #0x20
    12d0:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    12d4:	121c74c6 	and	w6, w6, #0xfffffff3
    12d8:	140000c0 	b	15d8 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    12dc:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    12e0:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    12e4:	71011c5f 	cmp	w2, #0x47
    12e8:	321500c2 	orr	w2, w6, #0x800
    12ec:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    12f0:	7101141f 	cmp	w0, #0x45
    12f4:	321b00c0 	orr	w0, w6, #0x20
    12f8:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    12fc:	b940abe0 	ldr	w0, [sp, #168]
    1300:	37f81c20 	tbnz	w0, #31, 1684 <_vsnprintf+0x664>
    1304:	91003e82 	add	x2, x20, #0xf
    1308:	aa1403e0 	mov	x0, x20
    130c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1310:	fd400000 	ldr	d0, [x0]
    1314:	aa1b03e2 	mov	x2, x27
    1318:	2a1803e5 	mov	w5, w24
    131c:	2a1703e4 	mov	w4, w23
    1320:	aa1c03e3 	mov	x3, x28
    1324:	aa1a03e1 	mov	x1, x26
    1328:	aa1303e0 	mov	x0, x19
    132c:	97fffd55 	bl	880 <_etoa>
    1330:	aa0003fb 	mov	x27, x0
            break;
    1334:	17ffff63 	b	10c0 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1338:	7101181f 	cmp	w0, #0x46
    133c:	321b00c0 	orr	w0, w6, #0x20
    1340:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1344:	b940abe0 	ldr	w0, [sp, #168]
    1348:	37f818c0 	tbnz	w0, #31, 1660 <_vsnprintf+0x640>
    134c:	91003e82 	add	x2, x20, #0xf
    1350:	aa1403e0 	mov	x0, x20
    1354:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1358:	fd400000 	ldr	d0, [x0]
    135c:	aa1b03e2 	mov	x2, x27
    1360:	2a1803e5 	mov	w5, w24
    1364:	2a1703e4 	mov	w4, w23
    1368:	aa1c03e3 	mov	x3, x28
    136c:	aa1a03e1 	mov	x1, x26
    1370:	aa1303e0 	mov	x0, x19
    1374:	97fffe2b 	bl	c20 <_ftoa>
    1378:	aa0003fb 	mov	x27, x0
            break;
    137c:	17ffff51 	b	10c0 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    1380:	91000760 	add	x0, x27, #0x1
    1384:	aa1b03e2 	mov	x2, x27
    1388:	aa1c03e3 	mov	x3, x28
    138c:	aa0003fb 	mov	x27, x0
    1390:	aa1a03e1 	mov	x1, x26
    1394:	528004a0 	mov	w0, #0x25                  	// #37
    1398:	d63f0260 	blr	x19
            break;
    139c:	17ffff49 	b	10c0 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    13a0:	52800420 	mov	w0, #0x21                  	// #33
    13a4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    13a8:	b9407be0 	ldr	w0, [sp, #120]
    13ac:	37f817e0 	tbnz	w0, #31, 16a8 <_vsnprintf+0x688>
    13b0:	91003e82 	add	x2, x20, #0xf
    13b4:	aa1403e0 	mov	x0, x20
    13b8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13bc:	2a1703e7 	mov	w7, w23
    13c0:	aa1b03e2 	mov	x2, x27
    13c4:	f9400004 	ldr	x4, [x0]
    13c8:	52800200 	mov	w0, #0x10                  	// #16
    13cc:	b90003e0 	str	w0, [sp]
    13d0:	b9000be6 	str	w6, [sp, #8]
    13d4:	d2800206 	mov	x6, #0x10                  	// #16
    13d8:	52800005 	mov	w5, #0x0                   	// #0
    13dc:	aa1c03e3 	mov	x3, x28
    13e0:	aa1a03e1 	mov	x1, x26
    13e4:	aa1303e0 	mov	x0, x19
    13e8:	97fffc72 	bl	5b0 <_ntoa_long>
    13ec:	aa0003fb 	mov	x27, x0
            break;
    13f0:	17ffff34 	b	10c0 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    13f4:	a9035bf5 	stp	x21, x22, [sp, #48]
    13f8:	36082306 	tbz	w6, #1, 1858 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    13fc:	b9407be0 	ldr	w0, [sp, #120]
    1400:	37f82a20 	tbnz	w0, #31, 1944 <_vsnprintf+0x924>
    1404:	91002e82 	add	x2, x20, #0xb
    1408:	aa1403e0 	mov	x0, x20
    140c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1410:	39400000 	ldrb	w0, [x0]
    1414:	aa1b03e2 	mov	x2, x27
    1418:	aa1c03e3 	mov	x3, x28
    141c:	aa1a03e1 	mov	x1, x26
    1420:	91000775 	add	x21, x27, #0x1
    1424:	d63f0260 	blr	x19
                while (l++ < width) {
    1428:	51000b00 	sub	w0, w24, #0x2
    142c:	91000b6a 	add	x10, x27, #0x2
    1430:	7100071f 	cmp	w24, #0x1
    1434:	8b00015b 	add	x27, x10, x0
    1438:	540007c9 	b.ls	1530 <_vsnprintf+0x510>  // b.plast
    143c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1440:	aa1503e2 	mov	x2, x21
    1444:	aa1c03e3 	mov	x3, x28
    1448:	910006b5 	add	x21, x21, #0x1
    144c:	aa1a03e1 	mov	x1, x26
    1450:	52800400 	mov	w0, #0x20                  	// #32
    1454:	d63f0260 	blr	x19
                while (l++ < width) {
    1458:	eb1b02bf 	cmp	x21, x27
    145c:	54ffff21 	b.ne	1440 <_vsnprintf+0x420>  // b.any
    1460:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1464:	17ffff17 	b	10c0 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    1468:	b9407be0 	ldr	w0, [sp, #120]
    146c:	a9035bf5 	stp	x21, x22, [sp, #48]
    1470:	37f812e0 	tbnz	w0, #31, 16cc <_vsnprintf+0x6ac>
    1474:	91003e82 	add	x2, x20, #0xf
    1478:	aa1403e0 	mov	x0, x20
    147c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1480:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    1484:	394002a8 	ldrb	w8, [x21]
    1488:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    148c:	350017d7 	cbnz	w23, 1784 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    1490:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    1494:	340035c8 	cbz	w8, 1b4c <_vsnprintf+0xb2c>
    1498:	91000456 	add	x22, x2, #0x1
    149c:	aa1503e2 	mov	x2, x21
    14a0:	8b1602b6 	add	x22, x21, x22
    14a4:	14000003 	b	14b0 <_vsnprintf+0x490>
    14a8:	eb0202df 	cmp	x22, x2
    14ac:	54001900 	b.eq	17cc <_vsnprintf+0x7ac>  // b.none
    14b0:	38401c44 	ldrb	w4, [x2, #1]!
    14b4:	35ffffa4 	cbnz	w4, 14a8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    14b8:	4b150041 	sub	w1, w2, w21
    14bc:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    14c0:	121600c1 	and	w1, w6, #0x400
    14c4:	b9007fe1 	str	w1, [sp, #124]
    14c8:	365000a6 	tbz	w6, #10, 14dc <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    14cc:	b940a3e1 	ldr	w1, [sp, #160]
    14d0:	6b17003f 	cmp	w1, w23
    14d4:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    14d8:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    14dc:	121f00c1 	and	w1, w6, #0x2
    14e0:	b900afe1 	str	w1, [sp, #172]
    14e4:	36081826 	tbz	w6, #1, 17e8 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    14e8:	34001108 	cbz	w8, 1708 <_vsnprintf+0x6e8>
    14ec:	aa1b03e2 	mov	x2, x27
    14f0:	cb1b02b6 	sub	x22, x21, x27
    14f4:	14000002 	b	14fc <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    14f8:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    14fc:	b9407fe1 	ldr	w1, [sp, #124]
    1500:	34000081 	cbz	w1, 1510 <_vsnprintf+0x4f0>
    1504:	510006e4 	sub	w4, w23, #0x1
    1508:	340016d7 	cbz	w23, 17e0 <_vsnprintf+0x7c0>
    150c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    1510:	91000455 	add	x21, x2, #0x1
    1514:	aa1c03e3 	mov	x3, x28
    1518:	aa1a03e1 	mov	x1, x26
    151c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1520:	38756ac0 	ldrb	w0, [x22, x21]
    1524:	35fffea0 	cbnz	w0, 14f8 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1528:	b940afe0 	ldr	w0, [sp, #172]
    152c:	35000ec0 	cbnz	w0, 1704 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1530:	aa1503fb 	mov	x27, x21
    1534:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1538:	17fffee2 	b	10c0 <_vsnprintf+0xa0>
            if (*format == 'h') {
    153c:	39400720 	ldrb	w0, [x25, #1]
    1540:	7101a01f 	cmp	w0, #0x68
    1544:	540013c0 	b.eq	17bc <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1548:	321900c6 	orr	w6, w6, #0x80
    154c:	17ffff10 	b	118c <_vsnprintf+0x16c>
            if (*format == 'l') {
    1550:	39400720 	ldrb	w0, [x25, #1]
    1554:	7101b01f 	cmp	w0, #0x6c
    1558:	54ffe181 	b.ne	1188 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    155c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    1560:	321804c6 	orr	w6, w6, #0x300
                format++;
    1564:	91000b24 	add	x4, x25, #0x2
    1568:	17ffff09 	b	118c <_vsnprintf+0x16c>
    unsigned int i = 0U;
    156c:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1570:	52800148 	mov	w8, #0xa                   	// #10
    1574:	d503201f 	nop
    1578:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    157c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    1580:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1584:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    1588:	12001c42 	and	w2, w2, #0xff
    158c:	7100245f 	cmp	w2, #0x9
    1590:	54ffff49 	b.ls	1578 <_vsnprintf+0x558>  // b.plast
    1594:	aa0403f9 	mov	x25, x4
    1598:	91000488 	add	x8, x4, #0x1
    159c:	17fffef2 	b	1164 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    15a0:	121a7802 	and	w2, w0, #0xffffffdf
    15a4:	7101605f 	cmp	w2, #0x58
    15a8:	54002580 	b.eq	1a58 <_vsnprintf+0xa38>  // b.none
    15ac:	d503201f 	nop
            } else if (*format == 'o') {
    15b0:	7101bc1f 	cmp	w0, #0x6f
    15b4:	540021a0 	b.eq	19e8 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    15b8:	7101881f 	cmp	w0, #0x62
    15bc:	54002820 	b.eq	1ac0 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    15c0:	121b78c6 	and	w6, w6, #0xffffffef
    15c4:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    15c8:	7101a41f 	cmp	w0, #0x69
    15cc:	52800c82 	mov	w2, #0x64                  	// #100
    15d0:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    15d4:	54ffe801 	b.ne	12d4 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    15d8:	f27600df 	tst	x6, #0x400
    15dc:	121f78c2 	and	w2, w6, #0xfffffffe
    15e0:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    15e4:	7101a41f 	cmp	w0, #0x69
    15e8:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    15ec:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    15f0:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    15f4:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    15f8:	54000ce1 	b.ne	1794 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    15fc:	35002122 	cbnz	w2, 1a20 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1600:	37402306 	tbnz	w6, #8, 1a60 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1604:	37301b26 	tbnz	w6, #6, 1968 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1608:	36382926 	tbz	w6, #7, 1b2c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    160c:	37f83300 	tbnz	w0, #31, 1c6c <_vsnprintf+0xc4c>
    1610:	91002e82 	add	x2, x20, #0xb
    1614:	aa1403e0 	mov	x0, x20
    1618:	927df054 	and	x20, x2, #0xfffffffffffffff8
    161c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1620:	710000bf 	cmp	w5, #0x0
    1624:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1628:	12003c84 	and	w4, w4, #0xffff
    162c:	2a1703e7 	mov	w7, w23
    1630:	531f7ca5 	lsr	w5, w5, #31
    1634:	93407c84 	sxtw	x4, w4
    1638:	aa1b03e2 	mov	x2, x27
    163c:	b9000be6 	str	w6, [sp, #8]
    1640:	aa0803e6 	mov	x6, x8
    1644:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1648:	aa1c03e3 	mov	x3, x28
    164c:	aa1a03e1 	mov	x1, x26
    1650:	aa1303e0 	mov	x0, x19
    1654:	97fffbd7 	bl	5b0 <_ntoa_long>
    1658:	aa0003fb 	mov	x27, x0
            break;
    165c:	17fffe99 	b	10c0 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1660:	b940abe0 	ldr	w0, [sp, #168]
    1664:	11004002 	add	w2, w0, #0x10
    1668:	7100005f 	cmp	w2, #0x0
    166c:	54001b4d 	b.le	19d4 <_vsnprintf+0x9b4>
    1670:	91003e84 	add	x4, x20, #0xf
    1674:	aa1403e0 	mov	x0, x20
    1678:	927df094 	and	x20, x4, #0xfffffffffffffff8
    167c:	b900abe2 	str	w2, [sp, #168]
    1680:	17ffff36 	b	1358 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1684:	b940abe0 	ldr	w0, [sp, #168]
    1688:	11004002 	add	w2, w0, #0x10
    168c:	7100005f 	cmp	w2, #0x0
    1690:	5400198d 	b.le	19c0 <_vsnprintf+0x9a0>
    1694:	91003e84 	add	x4, x20, #0xf
    1698:	aa1403e0 	mov	x0, x20
    169c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    16a0:	b900abe2 	str	w2, [sp, #168]
    16a4:	17ffff1b 	b	1310 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    16a8:	b9407be0 	ldr	w0, [sp, #120]
    16ac:	11002002 	add	w2, w0, #0x8
    16b0:	7100005f 	cmp	w2, #0x0
    16b4:	540017cd 	b.le	19ac <_vsnprintf+0x98c>
    16b8:	91003e84 	add	x4, x20, #0xf
    16bc:	aa1403e0 	mov	x0, x20
    16c0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    16c4:	b9007be2 	str	w2, [sp, #120]
    16c8:	17ffff3d 	b	13bc <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    16cc:	b9407be0 	ldr	w0, [sp, #120]
    16d0:	11002002 	add	w2, w0, #0x8
    16d4:	7100005f 	cmp	w2, #0x0
    16d8:	5400160d 	b.le	1998 <_vsnprintf+0x978>
    16dc:	91003e84 	add	x4, x20, #0xf
    16e0:	aa1403e0 	mov	x0, x20
    16e4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    16e8:	b9007be2 	str	w2, [sp, #120]
    16ec:	17ffff65 	b	1480 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    16f0:	f94047e1 	ldr	x1, [sp, #136]
    16f4:	b9407be0 	ldr	w0, [sp, #120]
    16f8:	b9007be2 	str	w2, [sp, #120]
    16fc:	8b20c020 	add	x0, x1, w0, sxtw
    1700:	17fffeb3 	b	11cc <_vsnprintf+0x1ac>
    1704:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1708:	b940a3e0 	ldr	w0, [sp, #160]
    170c:	6b18001f 	cmp	w0, w24
    1710:	540009e2 	b.cs	184c <_vsnprintf+0x82c>  // b.hs, b.nlast
    1714:	51000704 	sub	w4, w24, #0x1
    1718:	91000776 	add	x22, x27, #0x1
    171c:	4b000084 	sub	w4, w4, w0
    1720:	8b160095 	add	x21, x4, x22
    1724:	14000002 	b	172c <_vsnprintf+0x70c>
    1728:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    172c:	aa1b03e2 	mov	x2, x27
    1730:	aa1c03e3 	mov	x3, x28
    1734:	aa1a03e1 	mov	x1, x26
    1738:	52800400 	mov	w0, #0x20                  	// #32
    173c:	d63f0260 	blr	x19
    1740:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1744:	eb1502df 	cmp	x22, x21
    1748:	54ffff01 	b.ne	1728 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    174c:	aa1503fb 	mov	x27, x21
    1750:	17ffff79 	b	1534 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    1754:	b9407be0 	ldr	w0, [sp, #120]
    1758:	37f80b80 	tbnz	w0, #31, 18c8 <_vsnprintf+0x8a8>
    175c:	91002e82 	add	x2, x20, #0xb
    1760:	aa1403e0 	mov	x0, x20
    1764:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1768:	b9400007 	ldr	w7, [x0]
                format++;
    176c:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    1770:	39400320 	ldrb	w0, [x25]
    1774:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1778:	710000ff 	cmp	w7, #0x0
    177c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    1780:	17fffe79 	b	1164 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    1784:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    1788:	34001e28 	cbz	w8, 1b4c <_vsnprintf+0xb2c>
    178c:	d1000442 	sub	x2, x2, #0x1
    1790:	17ffff42 	b	1498 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    1794:	35001302 	cbnz	w2, 19f4 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    1798:	37401806 	tbnz	w6, #8, 1a98 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    179c:	37300ba6 	tbnz	w6, #6, 1910 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    17a0:	36381ba6 	tbz	w6, #7, 1b14 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    17a4:	37f82500 	tbnz	w0, #31, 1c44 <_vsnprintf+0xc24>
    17a8:	aa1403e0 	mov	x0, x20
    17ac:	91002e82 	add	x2, x20, #0xb
    17b0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    17b4:	79400004 	ldrh	w4, [x0]
    17b8:	1400005b 	b	1924 <_vsnprintf+0x904>
        switch (*format) {
    17bc:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    17c0:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    17c4:	91000b24 	add	x4, x25, #0x2
    17c8:	17fffe71 	b	118c <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    17cc:	4b1502c1 	sub	w1, w22, w21
    17d0:	b900a3e1 	str	w1, [sp, #160]
    17d4:	17ffff3b 	b	14c0 <_vsnprintf+0x4a0>
    while (*format) {
    17d8:	52800014 	mov	w20, #0x0                   	// #0
    17dc:	17fffea0 	b	125c <_vsnprintf+0x23c>
    17e0:	aa0203f5 	mov	x21, x2
    17e4:	17ffff51 	b	1528 <_vsnprintf+0x508>
                while (l++ < width) {
    17e8:	b940a3e1 	ldr	w1, [sp, #160]
    17ec:	6b18003f 	cmp	w1, w24
    17f0:	11000420 	add	w0, w1, #0x1
    17f4:	54002242 	b.cs	1c3c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    17f8:	51000700 	sub	w0, w24, #0x1
    17fc:	91000776 	add	x22, x27, #0x1
    1800:	4b010000 	sub	w0, w0, w1
    1804:	8b160000 	add	x0, x0, x22
    1808:	f90053e0 	str	x0, [sp, #160]
    180c:	14000002 	b	1814 <_vsnprintf+0x7f4>
    1810:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1814:	aa1b03e2 	mov	x2, x27
    1818:	52800400 	mov	w0, #0x20                  	// #32
    181c:	aa1c03e3 	mov	x3, x28
    1820:	aa1a03e1 	mov	x1, x26
    1824:	d63f0260 	blr	x19
    1828:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    182c:	f94053e0 	ldr	x0, [sp, #160]
    1830:	eb16001f 	cmp	x0, x22
    1834:	54fffee1 	b.ne	1810 <_vsnprintf+0x7f0>  // b.any
    1838:	394002a8 	ldrb	w8, [x21]
    183c:	11000700 	add	w0, w24, #0x1
    1840:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1844:	2a0803e0 	mov	w0, w8
    1848:	35ffe528 	cbnz	w8, 14ec <_vsnprintf+0x4cc>
                while (l++ < width) {
    184c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    1850:	aa1503fb 	mov	x27, x21
    1854:	17ffff38 	b	1534 <_vsnprintf+0x514>
                while (l++ < width) {
    1858:	7100071f 	cmp	w24, #0x1
    185c:	54001ec9 	b.ls	1c34 <_vsnprintf+0xc14>  // b.plast
    1860:	51000b05 	sub	w5, w24, #0x2
    1864:	91000776 	add	x22, x27, #0x1
    1868:	8b0502d5 	add	x21, x22, x5
    186c:	14000002 	b	1874 <_vsnprintf+0x854>
    1870:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1874:	aa1b03e2 	mov	x2, x27
    1878:	aa1c03e3 	mov	x3, x28
    187c:	aa1a03e1 	mov	x1, x26
    1880:	52800400 	mov	w0, #0x20                  	// #32
    1884:	d63f0260 	blr	x19
    1888:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    188c:	eb1502df 	cmp	x22, x21
    1890:	54ffff01 	b.ne	1870 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1894:	b9407be0 	ldr	w0, [sp, #120]
    1898:	37f802a0 	tbnz	w0, #31, 18ec <_vsnprintf+0x8cc>
    189c:	91002e82 	add	x2, x20, #0xb
    18a0:	aa1403e0 	mov	x0, x20
    18a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    18a8:	39400000 	ldrb	w0, [x0]
    18ac:	aa1503e2 	mov	x2, x21
    18b0:	910006bb 	add	x27, x21, #0x1
    18b4:	aa1c03e3 	mov	x3, x28
    18b8:	aa1a03e1 	mov	x1, x26
    18bc:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    18c0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    18c4:	17fffdff 	b	10c0 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    18c8:	b9407be0 	ldr	w0, [sp, #120]
    18cc:	11002002 	add	w2, w0, #0x8
    18d0:	7100005f 	cmp	w2, #0x0
    18d4:	5400058d 	b.le	1984 <_vsnprintf+0x964>
    18d8:	91002e84 	add	x4, x20, #0xb
    18dc:	aa1403e0 	mov	x0, x20
    18e0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    18e4:	b9007be2 	str	w2, [sp, #120]
    18e8:	17ffffa0 	b	1768 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    18ec:	b9407be0 	ldr	w0, [sp, #120]
    18f0:	11002002 	add	w2, w0, #0x8
    18f4:	7100005f 	cmp	w2, #0x0
    18f8:	540016ed 	b.le	1bd4 <_vsnprintf+0xbb4>
    18fc:	91002e84 	add	x4, x20, #0xb
    1900:	aa1403e0 	mov	x0, x20
    1904:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1908:	b9007be2 	str	w2, [sp, #120]
    190c:	17ffffe7 	b	18a8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1910:	37f81220 	tbnz	w0, #31, 1b54 <_vsnprintf+0xb34>
    1914:	91002e82 	add	x2, x20, #0xb
    1918:	aa1403e0 	mov	x0, x20
    191c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1920:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1924:	2a1703e7 	mov	w7, w23
    1928:	2a0403e4 	mov	w4, w4
    192c:	b9000be6 	str	w6, [sp, #8]
    1930:	aa0803e6 	mov	x6, x8
    1934:	b90003f8 	str	w24, [sp]
    1938:	aa1b03e2 	mov	x2, x27
    193c:	52800005 	mov	w5, #0x0                   	// #0
    1940:	17ffff42 	b	1648 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1944:	b9407be0 	ldr	w0, [sp, #120]
    1948:	11002002 	add	w2, w0, #0x8
    194c:	7100005f 	cmp	w2, #0x0
    1950:	5400138d 	b.le	1bc0 <_vsnprintf+0xba0>
    1954:	91002e84 	add	x4, x20, #0xb
    1958:	aa1403e0 	mov	x0, x20
    195c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1960:	b9007be2 	str	w2, [sp, #120]
    1964:	17fffeab 	b	1410 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1968:	37f81080 	tbnz	w0, #31, 1b78 <_vsnprintf+0xb58>
    196c:	91002e82 	add	x2, x20, #0xb
    1970:	aa1403e0 	mov	x0, x20
    1974:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1978:	39400005 	ldrb	w5, [x0]
    197c:	2a0503e4 	mov	w4, w5
    1980:	17ffff2b 	b	162c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    1984:	f94047e1 	ldr	x1, [sp, #136]
    1988:	b9407be0 	ldr	w0, [sp, #120]
    198c:	b9007be2 	str	w2, [sp, #120]
    1990:	8b20c020 	add	x0, x1, w0, sxtw
    1994:	17ffff75 	b	1768 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    1998:	f94047e1 	ldr	x1, [sp, #136]
    199c:	b9407be0 	ldr	w0, [sp, #120]
    19a0:	b9007be2 	str	w2, [sp, #120]
    19a4:	8b20c020 	add	x0, x1, w0, sxtw
    19a8:	17fffeb6 	b	1480 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    19ac:	f94047e1 	ldr	x1, [sp, #136]
    19b0:	b9407be0 	ldr	w0, [sp, #120]
    19b4:	b9007be2 	str	w2, [sp, #120]
    19b8:	8b20c020 	add	x0, x1, w0, sxtw
    19bc:	17fffe80 	b	13bc <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    19c0:	f9404be1 	ldr	x1, [sp, #144]
    19c4:	b940abe0 	ldr	w0, [sp, #168]
    19c8:	b900abe2 	str	w2, [sp, #168]
    19cc:	8b20c020 	add	x0, x1, w0, sxtw
    19d0:	17fffe50 	b	1310 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    19d4:	f9404be1 	ldr	x1, [sp, #144]
    19d8:	b940abe0 	ldr	w0, [sp, #168]
    19dc:	b900abe2 	str	w2, [sp, #168]
    19e0:	8b20c020 	add	x0, x1, w0, sxtw
    19e4:	17fffe5d 	b	1358 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    19e8:	121c74c6 	and	w6, w6, #0xfffffff3
    19ec:	d2800108 	mov	x8, #0x8                   	// #8
    19f0:	17fffefa 	b	15d8 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    19f4:	37f807e0 	tbnz	w0, #31, 1af0 <_vsnprintf+0xad0>
    19f8:	91003e82 	add	x2, x20, #0xf
    19fc:	aa1403e0 	mov	x0, x20
    1a00:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a04:	2a1703e7 	mov	w7, w23
    1a08:	aa1b03e2 	mov	x2, x27
    1a0c:	f9400004 	ldr	x4, [x0]
    1a10:	b90003f8 	str	w24, [sp]
    1a14:	b9000be6 	str	w6, [sp, #8]
    1a18:	aa0803e6 	mov	x6, x8
    1a1c:	17fffe6f 	b	13d8 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1a20:	37f80560 	tbnz	w0, #31, 1acc <_vsnprintf+0xaac>
    1a24:	91003e82 	add	x2, x20, #0xf
    1a28:	aa1403e0 	mov	x0, x20
    1a2c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a30:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1a34:	2a1703e7 	mov	w7, w23
    1a38:	aa1b03e2 	mov	x2, x27
    1a3c:	b90003f8 	str	w24, [sp]
    1a40:	f10000bf 	cmp	x5, #0x0
    1a44:	b9000be6 	str	w6, [sp, #8]
    1a48:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1a4c:	aa0803e6 	mov	x6, x8
    1a50:	d37ffca5 	lsr	x5, x5, #63
    1a54:	17fffe62 	b	13dc <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1a58:	d2800208 	mov	x8, #0x10                  	// #16
    1a5c:	17fffedb 	b	15c8 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    1a60:	37f80c40 	tbnz	w0, #31, 1be8 <_vsnprintf+0xbc8>
    1a64:	91003e82 	add	x2, x20, #0xf
    1a68:	aa1403e0 	mov	x0, x20
    1a6c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a70:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1a74:	2a1703e7 	mov	w7, w23
    1a78:	aa1b03e2 	mov	x2, x27
    1a7c:	b90003f8 	str	w24, [sp]
    1a80:	f10000bf 	cmp	x5, #0x0
    1a84:	b9000be6 	str	w6, [sp, #8]
    1a88:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1a8c:	aa0803e6 	mov	x6, x8
    1a90:	d37ffca5 	lsr	x5, x5, #63
    1a94:	17fffeed 	b	1648 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1a98:	37f80820 	tbnz	w0, #31, 1b9c <_vsnprintf+0xb7c>
    1a9c:	91003e82 	add	x2, x20, #0xf
    1aa0:	aa1403e0 	mov	x0, x20
    1aa4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1aa8:	2a1703e7 	mov	w7, w23
    1aac:	f9400004 	ldr	x4, [x0]
    1ab0:	b90003f8 	str	w24, [sp]
    1ab4:	b9000be6 	str	w6, [sp, #8]
    1ab8:	aa0803e6 	mov	x6, x8
    1abc:	17ffff9f 	b	1938 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1ac0:	121c74c6 	and	w6, w6, #0xfffffff3
    1ac4:	d2800048 	mov	x8, #0x2                   	// #2
    1ac8:	17fffec4 	b	15d8 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1acc:	b9407be0 	ldr	w0, [sp, #120]
    1ad0:	11002002 	add	w2, w0, #0x8
    1ad4:	7100005f 	cmp	w2, #0x0
    1ad8:	54000a4d 	b.le	1c20 <_vsnprintf+0xc00>
    1adc:	91003e84 	add	x4, x20, #0xf
    1ae0:	aa1403e0 	mov	x0, x20
    1ae4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ae8:	b9007be2 	str	w2, [sp, #120]
    1aec:	17ffffd1 	b	1a30 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1af0:	b9407be0 	ldr	w0, [sp, #120]
    1af4:	11002002 	add	w2, w0, #0x8
    1af8:	7100005f 	cmp	w2, #0x0
    1afc:	5400088d 	b.le	1c0c <_vsnprintf+0xbec>
    1b00:	91003e84 	add	x4, x20, #0xf
    1b04:	aa1403e0 	mov	x0, x20
    1b08:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b0c:	b9007be2 	str	w2, [sp, #120]
    1b10:	17ffffbd 	b	1a04 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1b14:	37f80d00 	tbnz	w0, #31, 1cb4 <_vsnprintf+0xc94>
    1b18:	aa1403e0 	mov	x0, x20
    1b1c:	91002e82 	add	x2, x20, #0xb
    1b20:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b24:	b9400004 	ldr	w4, [x0]
    1b28:	17ffff7f 	b	1924 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1b2c:	37f80b20 	tbnz	w0, #31, 1c90 <_vsnprintf+0xc70>
    1b30:	91002e82 	add	x2, x20, #0xb
    1b34:	aa1403e0 	mov	x0, x20
    1b38:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b3c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1b40:	710000bf 	cmp	w5, #0x0
    1b44:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1b48:	17fffeb9 	b	162c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1b4c:	b900a3ff 	str	wzr, [sp, #160]
    1b50:	17fffe5c 	b	14c0 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1b54:	b9407be0 	ldr	w0, [sp, #120]
    1b58:	11002002 	add	w2, w0, #0x8
    1b5c:	7100005f 	cmp	w2, #0x0
    1b60:	54000bed 	b.le	1cdc <_vsnprintf+0xcbc>
    1b64:	91002e84 	add	x4, x20, #0xb
    1b68:	aa1403e0 	mov	x0, x20
    1b6c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b70:	b9007be2 	str	w2, [sp, #120]
    1b74:	17ffff6b 	b	1920 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1b78:	b9407be0 	ldr	w0, [sp, #120]
    1b7c:	11002002 	add	w2, w0, #0x8
    1b80:	7100005f 	cmp	w2, #0x0
    1b84:	54000b6d 	b.le	1cf0 <_vsnprintf+0xcd0>
    1b88:	91002e84 	add	x4, x20, #0xb
    1b8c:	aa1403e0 	mov	x0, x20
    1b90:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1b94:	b9007be2 	str	w2, [sp, #120]
    1b98:	17ffff78 	b	1978 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1b9c:	b9407be0 	ldr	w0, [sp, #120]
    1ba0:	11002002 	add	w2, w0, #0x8
    1ba4:	7100005f 	cmp	w2, #0x0
    1ba8:	54000aed 	b.le	1d04 <_vsnprintf+0xce4>
    1bac:	91003e84 	add	x4, x20, #0xf
    1bb0:	aa1403e0 	mov	x0, x20
    1bb4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bb8:	b9007be2 	str	w2, [sp, #120]
    1bbc:	17ffffbb 	b	1aa8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1bc0:	f94047e1 	ldr	x1, [sp, #136]
    1bc4:	b9407be0 	ldr	w0, [sp, #120]
    1bc8:	b9007be2 	str	w2, [sp, #120]
    1bcc:	8b20c020 	add	x0, x1, w0, sxtw
    1bd0:	17fffe10 	b	1410 <_vsnprintf+0x3f0>
    1bd4:	f94047e1 	ldr	x1, [sp, #136]
    1bd8:	b9407be0 	ldr	w0, [sp, #120]
    1bdc:	b9007be2 	str	w2, [sp, #120]
    1be0:	8b20c020 	add	x0, x1, w0, sxtw
    1be4:	17ffff31 	b	18a8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1be8:	b9407be0 	ldr	w0, [sp, #120]
    1bec:	11002002 	add	w2, w0, #0x8
    1bf0:	7100005f 	cmp	w2, #0x0
    1bf4:	5400092d 	b.le	1d18 <_vsnprintf+0xcf8>
    1bf8:	91003e84 	add	x4, x20, #0xf
    1bfc:	aa1403e0 	mov	x0, x20
    1c00:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c04:	b9007be2 	str	w2, [sp, #120]
    1c08:	17ffff9a 	b	1a70 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1c0c:	f94047e1 	ldr	x1, [sp, #136]
    1c10:	b9407be0 	ldr	w0, [sp, #120]
    1c14:	b9007be2 	str	w2, [sp, #120]
    1c18:	8b20c020 	add	x0, x1, w0, sxtw
    1c1c:	17ffff7a 	b	1a04 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1c20:	f94047e1 	ldr	x1, [sp, #136]
    1c24:	b9407be0 	ldr	w0, [sp, #120]
    1c28:	b9007be2 	str	w2, [sp, #120]
    1c2c:	8b20c020 	add	x0, x1, w0, sxtw
    1c30:	17ffff80 	b	1a30 <_vsnprintf+0xa10>
                while (l++ < width) {
    1c34:	aa1b03f5 	mov	x21, x27
    1c38:	17ffff17 	b	1894 <_vsnprintf+0x874>
                while (l++ < width) {
    1c3c:	b900a3e0 	str	w0, [sp, #160]
    1c40:	17ffff01 	b	1844 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c44:	b9407be0 	ldr	w0, [sp, #120]
    1c48:	11002002 	add	w2, w0, #0x8
    1c4c:	7100005f 	cmp	w2, #0x0
    1c50:	5400078d 	b.le	1d40 <_vsnprintf+0xd20>
    1c54:	aa1403e0 	mov	x0, x20
    1c58:	91002e84 	add	x4, x20, #0xb
    1c5c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c60:	b9007be2 	str	w2, [sp, #120]
    1c64:	79400004 	ldrh	w4, [x0]
    1c68:	17ffff2f 	b	1924 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c6c:	b9407be0 	ldr	w0, [sp, #120]
    1c70:	11002002 	add	w2, w0, #0x8
    1c74:	7100005f 	cmp	w2, #0x0
    1c78:	540005ad 	b.le	1d2c <_vsnprintf+0xd0c>
    1c7c:	91002e84 	add	x4, x20, #0xb
    1c80:	aa1403e0 	mov	x0, x20
    1c84:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c88:	b9007be2 	str	w2, [sp, #120]
    1c8c:	17fffe64 	b	161c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1c90:	b9407be0 	ldr	w0, [sp, #120]
    1c94:	11002002 	add	w2, w0, #0x8
    1c98:	7100005f 	cmp	w2, #0x0
    1c9c:	540005ed 	b.le	1d58 <_vsnprintf+0xd38>
    1ca0:	91002e84 	add	x4, x20, #0xb
    1ca4:	aa1403e0 	mov	x0, x20
    1ca8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1cac:	b9007be2 	str	w2, [sp, #120]
    1cb0:	17ffffa3 	b	1b3c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1cb4:	b9407be0 	ldr	w0, [sp, #120]
    1cb8:	11002002 	add	w2, w0, #0x8
    1cbc:	7100005f 	cmp	w2, #0x0
    1cc0:	5400056d 	b.le	1d6c <_vsnprintf+0xd4c>
    1cc4:	aa1403e0 	mov	x0, x20
    1cc8:	91002e84 	add	x4, x20, #0xb
    1ccc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1cd0:	b9007be2 	str	w2, [sp, #120]
    1cd4:	b9400004 	ldr	w4, [x0]
    1cd8:	17ffff13 	b	1924 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1cdc:	f94047e1 	ldr	x1, [sp, #136]
    1ce0:	b9407be0 	ldr	w0, [sp, #120]
    1ce4:	b9007be2 	str	w2, [sp, #120]
    1ce8:	8b20c020 	add	x0, x1, w0, sxtw
    1cec:	17ffff0d 	b	1920 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1cf0:	f94047e1 	ldr	x1, [sp, #136]
    1cf4:	b9407be0 	ldr	w0, [sp, #120]
    1cf8:	b9007be2 	str	w2, [sp, #120]
    1cfc:	8b20c020 	add	x0, x1, w0, sxtw
    1d00:	17ffff1e 	b	1978 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1d04:	f94047e1 	ldr	x1, [sp, #136]
    1d08:	b9407be0 	ldr	w0, [sp, #120]
    1d0c:	b9007be2 	str	w2, [sp, #120]
    1d10:	8b20c020 	add	x0, x1, w0, sxtw
    1d14:	17ffff65 	b	1aa8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1d18:	f94047e1 	ldr	x1, [sp, #136]
    1d1c:	b9407be0 	ldr	w0, [sp, #120]
    1d20:	b9007be2 	str	w2, [sp, #120]
    1d24:	8b20c020 	add	x0, x1, w0, sxtw
    1d28:	17ffff52 	b	1a70 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1d2c:	f94047e1 	ldr	x1, [sp, #136]
    1d30:	b9407be0 	ldr	w0, [sp, #120]
    1d34:	b9007be2 	str	w2, [sp, #120]
    1d38:	8b20c020 	add	x0, x1, w0, sxtw
    1d3c:	17fffe38 	b	161c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1d40:	f94047e1 	ldr	x1, [sp, #136]
    1d44:	b9407be0 	ldr	w0, [sp, #120]
    1d48:	b9007be2 	str	w2, [sp, #120]
    1d4c:	8b20c020 	add	x0, x1, w0, sxtw
    1d50:	79400004 	ldrh	w4, [x0]
    1d54:	17fffef4 	b	1924 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1d58:	f94047e1 	ldr	x1, [sp, #136]
    1d5c:	b9407be0 	ldr	w0, [sp, #120]
    1d60:	b9007be2 	str	w2, [sp, #120]
    1d64:	8b20c020 	add	x0, x1, w0, sxtw
    1d68:	17ffff75 	b	1b3c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1d6c:	f94047e1 	ldr	x1, [sp, #136]
    1d70:	b9407be0 	ldr	w0, [sp, #120]
    1d74:	b9007be2 	str	w2, [sp, #120]
    1d78:	8b20c020 	add	x0, x1, w0, sxtw
    1d7c:	b9400004 	ldr	w4, [x0]
    1d80:	17fffee9 	b	1924 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1d84:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1d88:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1d8c:	12001c42 	and	w2, w2, #0xff
    1d90:	7100245f 	cmp	w2, #0x9
    1d94:	54ffa2a8 	b.hi	11e8 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1d98:	52800142 	mov	w2, #0xa                   	// #10
    1d9c:	d503201f 	nop
    1da0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1da4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1da8:	aa0803f9 	mov	x25, x8
    1dac:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1db0:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1db4:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1db8:	12001c84 	and	w4, w4, #0xff
    1dbc:	7100249f 	cmp	w4, #0x9
    1dc0:	54ffff09 	b.ls	1da0 <_vsnprintf+0xd80>  // b.plast
    1dc4:	17fffd09 	b	11e8 <_vsnprintf+0x1c8>
        switch (*format) {
    1dc8:	aa1903e4 	mov	x4, x25
    1dcc:	17fffcf0 	b	118c <_vsnprintf+0x16c>

0000000000001dd0 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1dd0:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1dd4:	910003fd 	mov	x29, sp
    1dd8:	f9000bf3 	str	x19, [sp, #16]
    1ddc:	aa0003f3 	mov	x19, x0
    1de0:	3d801fe0 	str	q0, [sp, #112]
    1de4:	3d8023e1 	str	q1, [sp, #128]
    1de8:	3d8027e2 	str	q2, [sp, #144]
    1dec:	3d802be3 	str	q3, [sp, #160]
    1df0:	3d802fe4 	str	q4, [sp, #176]
    1df4:	3d8033e5 	str	q5, [sp, #192]
    1df8:	3d8037e6 	str	q6, [sp, #208]
    1dfc:	3d803be7 	str	q7, [sp, #224]
    1e00:	a90f8be1 	stp	x1, x2, [sp, #248]
    1e04:	a91093e3 	stp	x3, x4, [sp, #264]
    1e08:	a9119be5 	stp	x5, x6, [sp, #280]
    1e0c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1e10:	97fff968 	bl	3b0 <init_uart_mmio>
    1e14:	72001c1f 	tst	w0, #0xff
    1e18:	540002e0 	b.eq	1e74 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1e1c:	9103c3e0 	add	x0, sp, #0xf0
    1e20:	9104c3e3 	add	x3, sp, #0x130
    1e24:	9104c3e4 	add	x4, sp, #0x130
    1e28:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1e2c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1e30:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1e34:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1e38:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1e3c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1e40:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1e44:	f0ffffe0 	adrp	x0, 0 <main>
    1e48:	913fc000 	add	x0, x0, #0xff0
    1e4c:	910123e1 	add	x1, sp, #0x48
    1e50:	a94527e8 	ldp	x8, x9, [sp, #80]
    1e54:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1e58:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1e5c:	a90227e8 	stp	x8, x9, [sp, #32]
    1e60:	a9031fe6 	stp	x6, x7, [sp, #48]
    1e64:	97fffc6f 	bl	1020 <_vsnprintf>
    va_end(va);
    return ret;
}
    1e68:	f9400bf3 	ldr	x19, [sp, #16]
    1e6c:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1e70:	d65f03c0 	ret
        return -1;
    1e74:	12800000 	mov	w0, #0xffffffff            	// #-1
    1e78:	17fffffc 	b	1e68 <printf+0x98>
    1e7c:	d503201f 	nop

0000000000001e80 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1e80:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1e84:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1e88:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1e8c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1e90:	910343eb 	add	x11, sp, #0xd0
    1e94:	910403ea 	add	x10, sp, #0x100
    1e98:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1e9c:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ea0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1ea4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ea8:	f0ffffe0 	adrp	x0, 0 <main>
    1eac:	9111c000 	add	x0, x0, #0x470
    va_start(va, format);
    1eb0:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1eb4:	a94337ec 	ldp	x12, x13, [sp, #48]
    1eb8:	a90137ec 	stp	x12, x13, [sp, #16]
    1ebc:	a94427e8 	ldp	x8, x9, [sp, #64]
    1ec0:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1ec4:	3d8017e0 	str	q0, [sp, #80]
    1ec8:	3d801be1 	str	q1, [sp, #96]
    1ecc:	3d801fe2 	str	q2, [sp, #112]
    1ed0:	3d8023e3 	str	q3, [sp, #128]
    1ed4:	3d8027e4 	str	q4, [sp, #144]
    1ed8:	3d802be5 	str	q5, [sp, #160]
    1edc:	3d802fe6 	str	q6, [sp, #176]
    1ee0:	3d8033e7 	str	q7, [sp, #192]
    1ee4:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ee8:	aa0a03e3 	mov	x3, x10
    1eec:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1ef0:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1ef4:	910043e4 	add	x4, sp, #0x10
{
    1ef8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1efc:	97fffc49 	bl	1020 <_vsnprintf>
    va_end(va);
    return ret;
}
    1f00:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1f04:	d65f03c0 	ret
    1f08:	d503201f 	nop
    1f0c:	d503201f 	nop

0000000000001f10 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1f10:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1f14:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1f18:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1f1c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1f20:	910343ea 	add	x10, sp, #0xd0
    1f24:	910403e8 	add	x8, sp, #0x100
    1f28:	a90323e8 	stp	x8, x8, [sp, #48]
{
    1f2c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1f30:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1f34:	f90023ea 	str	x10, [sp, #64]
{
    1f38:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    1f3c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1f40:	aa0803e2 	mov	x2, x8
    1f44:	a94337ec 	ldp	x12, x13, [sp, #48]
    1f48:	f0ffffe0 	adrp	x0, 0 <main>
    1f4c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1f50:	9111c000 	add	x0, x0, #0x470
    1f54:	a90137ec 	stp	x12, x13, [sp, #16]
    1f58:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1f5c:	3d8017e0 	str	q0, [sp, #80]
    1f60:	3d801be1 	str	q1, [sp, #96]
    1f64:	3d801fe2 	str	q2, [sp, #112]
    1f68:	3d8023e3 	str	q3, [sp, #128]
    1f6c:	3d8027e4 	str	q4, [sp, #144]
    1f70:	3d802be5 	str	q5, [sp, #160]
    1f74:	3d802fe6 	str	q6, [sp, #176]
    1f78:	3d8033e7 	str	q7, [sp, #192]
    1f7c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1f80:	910043e4 	add	x4, sp, #0x10
    1f84:	aa0a03e3 	mov	x3, x10
{
    1f88:	a90e9be5 	stp	x5, x6, [sp, #232]
    1f8c:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    1f90:	97fffc24 	bl	1020 <_vsnprintf>
    va_end(va);
    return ret;
}
    1f94:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1f98:	d65f03c0 	ret
    1f9c:	d503201f 	nop

0000000000001fa0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    1fa0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1fa4:	aa0003e3 	mov	x3, x0
    1fa8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1fac:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1fb0:	a9402428 	ldp	x8, x9, [x1]
    1fb4:	910043e4 	add	x4, sp, #0x10
    1fb8:	a9411c26 	ldp	x6, x7, [x1, #16]
    1fbc:	f0ffffe0 	adrp	x0, 0 <main>
    1fc0:	9100e3e1 	add	x1, sp, #0x38
    1fc4:	913fc000 	add	x0, x0, #0xff0
    1fc8:	a90127e8 	stp	x8, x9, [sp, #16]
    1fcc:	a9021fe6 	stp	x6, x7, [sp, #32]
    1fd0:	97fffc14 	bl	1020 <_vsnprintf>
}
    1fd4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1fd8:	d65f03c0 	ret
    1fdc:	d503201f 	nop

0000000000001fe0 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    1fe0:	aa0303e4 	mov	x4, x3
    1fe4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1fe8:	aa0103e5 	mov	x5, x1
    1fec:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    1ff0:	a9402488 	ldp	x8, x9, [x4]
    1ff4:	aa0003e1 	mov	x1, x0
    1ff8:	a9411c86 	ldp	x6, x7, [x4, #16]
    1ffc:	aa0203e3 	mov	x3, x2
    2000:	910043e4 	add	x4, sp, #0x10
    2004:	aa0503e2 	mov	x2, x5
    2008:	d0ffffe0 	adrp	x0, 0 <main>
    200c:	9111c000 	add	x0, x0, #0x470
    2010:	a90127e8 	stp	x8, x9, [sp, #16]
    2014:	a9021fe6 	stp	x6, x7, [sp, #32]
    2018:	97fffc02 	bl	1020 <_vsnprintf>
}
    201c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2020:	d65f03c0 	ret
    2024:	d503201f 	nop
    2028:	d503201f 	nop
    202c:	d503201f 	nop

0000000000002030 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    2030:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    2034:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    2038:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    203c:	910003fd 	mov	x29, sp
    va_start(va, format);
    2040:	910443ea 	add	x10, sp, #0x110
    2044:	910383eb 	add	x11, sp, #0xe0
    2048:	f90023ea 	str	x10, [sp, #64]
{
    204c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    2050:	910443e2 	add	x2, sp, #0x110
    2054:	f90027e2 	str	x2, [sp, #72]
    2058:	f9002beb 	str	x11, [sp, #80]
{
    205c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    2060:	290b23e9 	stp	w9, w8, [sp, #88]
{
    2064:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2068:	a9443fee 	ldp	x14, x15, [sp, #64]
    206c:	9100c3e1 	add	x1, sp, #0x30
    2070:	a94527e8 	ldp	x8, x9, [sp, #80]
    2074:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2078:	f0ffffe0 	adrp	x0, 1000 <_out_fct>
    207c:	91000000 	add	x0, x0, #0x0
    2080:	a9013fee 	stp	x14, x15, [sp, #16]
    2084:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    2088:	f9001bec 	str	x12, [sp, #48]
    208c:	f9001feb 	str	x11, [sp, #56]
{
    2090:	3d801be0 	str	q0, [sp, #96]
    2094:	3d801fe1 	str	q1, [sp, #112]
    2098:	3d8023e2 	str	q2, [sp, #128]
    209c:	3d8027e3 	str	q3, [sp, #144]
    20a0:	3d802be4 	str	q4, [sp, #160]
    20a4:	3d802fe5 	str	q5, [sp, #176]
    20a8:	3d8033e6 	str	q6, [sp, #192]
    20ac:	3d8037e7 	str	q7, [sp, #208]
    20b0:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    20b4:	910043e4 	add	x4, sp, #0x10
    20b8:	aa0a03e3 	mov	x3, x10
{
    20bc:	a90f9be5 	stp	x5, x6, [sp, #248]
    20c0:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    20c4:	97fffbd7 	bl	1020 <_vsnprintf>
    va_end(va);
    return ret;
    20c8:	a8d17bfd 	ldp	x29, x30, [sp], #272
    20cc:	d65f03c0 	ret

00000000000020d0 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    20d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    20d4:	7100003f 	cmp	w1, #0x0
{
    20d8:	910003fd 	mov	x29, sp
    20dc:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    20e0:	528000d4 	mov	w20, #0x6                   	// #6
    20e4:	1b147c34 	mul	w20, w1, w20
{
    20e8:	a9025bf5 	stp	x21, x22, [sp, #32]
    20ec:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    20f0:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    20f4:	5400056d 	b.le	21a0 <new_ipc_msg+0xd0>
    20f8:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    20fc:	2a1403f6 	mov	w22, w20
    2100:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    2104:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    2108:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    210c:	91000442 	add	x2, x2, #0x1
    2110:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    2114:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    2118:	54ffff8c 	b.gt	2108 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    211c:	aa0303e0 	mov	x0, x3
    2120:	2a1603e1 	mov	w1, w22
    2124:	9400016f 	bl	26e0 <session_alloc_buf>
    if (buf == NULL) {
    2128:	b40004c0 	cbz	x0, 21c0 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    212c:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    2130:	39400001 	ldrb	w1, [x0]
    2134:	52800182 	mov	w2, #0xc                   	// #12
    2138:	aa1303e3 	mov	x3, x19
    213c:	1b057ea5 	mul	w5, w21, w5
    2140:	121e7421 	and	w1, w1, #0xfffffffc
    2144:	39000001 	strb	w1, [x0]
    2148:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    214c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    2150:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    2154:	b9400064 	ldr	w4, [x3]
    2158:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    215c:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    2160:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    2164:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    2168:	b8404461 	ldr	w1, [x3], #4
    216c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    2170:	54ffff01 	b.ne	2150 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    2174:	39400002 	ldrb	w2, [x0]
    2178:	531c0ea1 	ubfiz	w1, w21, #4, #4
    217c:	321e0021 	orr	w1, w1, #0x4
    2180:	52800163 	mov	w3, #0xb                   	// #11
    2184:	0a030042 	and	w2, w2, w3
    2188:	2a020021 	orr	w1, w1, w2
    218c:	39000001 	strb	w1, [x0]
    return buf;
}
    2190:	a94153f3 	ldp	x19, x20, [sp, #16]
    2194:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2198:	a8c37bfd 	ldp	x29, x30, [sp], #48
    219c:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    21a0:	2a1403e1 	mov	w1, w20
    21a4:	9400014f 	bl	26e0 <session_alloc_buf>
    if (buf == NULL) {
    21a8:	b40000c0 	cbz	x0, 21c0 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    21ac:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    21b0:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    21b4:	121e7421 	and	w1, w1, #0xfffffffc
    21b8:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    21bc:	17ffffee 	b	2174 <new_ipc_msg+0xa4>
        return NULL;
    21c0:	d2800000 	mov	x0, #0x0                   	// #0
    21c4:	17fffff3 	b	2190 <new_ipc_msg+0xc0>
    21c8:	d503201f 	nop
    21cc:	d503201f 	nop

00000000000021d0 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    21d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    21d4:	2a0103e4 	mov	w4, w1
    21d8:	aa0203e1 	mov	x1, x2
    21dc:	910003fd 	mov	x29, sp
    21e0:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    21e4:	39400003 	ldrb	w3, [x0]
    21e8:	d3441c63 	ubfx	x3, x3, #4, #4
    21ec:	6b04007f 	cmp	w3, w4
    21f0:	540003ad 	b.le	2264 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    21f4:	528000c5 	mov	w5, #0x6                   	// #6
    21f8:	d2800183 	mov	x3, #0xc                   	// #12
    21fc:	9b250c84 	smaddl	x4, w4, w5, x3
    2200:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    2204:	794004a3 	ldrh	w3, [x5, #2]
    2208:	37f801e2 	tbnz	w2, #31, 2244 <ipc_msg_set_nth_arg+0x74>
    220c:	6b02007f 	cmp	w3, w2
    2210:	540001a3 	b.cc	2244 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    2214:	394010a3 	ldrb	w3, [x5, #4]
    2218:	37000423 	tbnz	w3, #0, 229c <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    221c:	78646803 	ldrh	w3, [x0, x4]
    2220:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    2224:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    2228:	b4000301 	cbz	x1, 2288 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    222c:	121f7863 	and	w3, w3, #0xfffffffe
    2230:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    2234:	94000623 	bl	3ac0 <memmove>
    return true;
    2238:	52800020 	mov	w0, #0x1                   	// #1
}
    223c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2240:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    2244:	b0000041 	adrp	x1, b000 <_findenv_r+0x10>
    2248:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    224c:	91264021 	add	x1, x1, #0x990
    2250:	9121a000 	add	x0, x0, #0x868
    2254:	97fffedf 	bl	1dd0 <printf>
        return false;
    2258:	52800000 	mov	w0, #0x0                   	// #0
}
    225c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2260:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    2264:	2a0403e2 	mov	w2, w4
    2268:	b0000041 	adrp	x1, b000 <_findenv_r+0x10>
    226c:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    2270:	91264021 	add	x1, x1, #0x990
    2274:	9120a000 	add	x0, x0, #0x828
    2278:	97fffed6 	bl	1dd0 <printf>
        return false;
    227c:	52800000 	mov	w0, #0x0                   	// #0
}
    2280:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2284:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    2288:	32000063 	orr	w3, w3, #0x1
    228c:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    2290:	9400063c 	bl	3b80 <memset>
        return true;
    2294:	52800020 	mov	w0, #0x1                   	// #1
    2298:	17ffffe9 	b	223c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    229c:	d2800000 	mov	x0, #0x0                   	// #0
    22a0:	17ffffe1 	b	2224 <ipc_msg_set_nth_arg+0x54>
    22a4:	d503201f 	nop
    22a8:	d503201f 	nop
    22ac:	d503201f 	nop

00000000000022b0 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    22b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    22b4:	aa0003e4 	mov	x4, x0
    22b8:	910003fd 	mov	x29, sp
    22bc:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    22c0:	39400005 	ldrb	w5, [x0]
    22c4:	d3441ca5 	ubfx	x5, x5, #4, #4
    22c8:	6b0100bf 	cmp	w5, w1
    22cc:	5400030d 	b.le	232c <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    22d0:	528000c5 	mov	w5, #0x6                   	// #6
    22d4:	aa0203e0 	mov	x0, x2
    22d8:	d2800182 	mov	x2, #0xc                   	// #12
    22dc:	9b250821 	smaddl	x1, w1, w5, x2
    22e0:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    22e4:	79400445 	ldrh	w5, [x2, #2]
    22e8:	6b0300bf 	cmp	w5, w3
    22ec:	5400036b 	b.lt	2358 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    22f0:	39401042 	ldrb	w2, [x2, #4]
        return true;
    22f4:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    22f8:	360000a2 	tbz	w2, #0, 230c <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    22fc:	2a1303e0 	mov	w0, w19
    2300:	f9400bf3 	ldr	x19, [sp, #16]
    2304:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2308:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    230c:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    2310:	93407c62 	sxtw	x2, w3
    2314:	8b010081 	add	x1, x4, x1
    2318:	940005ea 	bl	3ac0 <memmove>
}
    231c:	2a1303e0 	mov	w0, w19
    2320:	f9400bf3 	ldr	x19, [sp, #16]
    2324:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2328:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    232c:	b0000041 	adrp	x1, b000 <_findenv_r+0x10>
    2330:	91264021 	add	x1, x1, #0x990
    2334:	91006021 	add	x1, x1, #0x18
        return false;
    2338:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    233c:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    2340:	9122c000 	add	x0, x0, #0x8b0
    2344:	97fffea3 	bl	1dd0 <printf>
}
    2348:	2a1303e0 	mov	w0, w19
    234c:	f9400bf3 	ldr	x19, [sp, #16]
    2350:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2354:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    2358:	b0000041 	adrp	x1, b000 <_findenv_r+0x10>
    235c:	91264021 	add	x1, x1, #0x990
    2360:	91006021 	add	x1, x1, #0x18
        return false;
    2364:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    2368:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    236c:	91236000 	add	x0, x0, #0x8d8
    2370:	97fffe98 	bl	1dd0 <printf>
}
    2374:	2a1303e0 	mov	w0, w19
    2378:	f9400bf3 	ldr	x19, [sp, #16]
    237c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2380:	d65f03c0 	ret
    2384:	d503201f 	nop
    2388:	d503201f 	nop
    238c:	d503201f 	nop

0000000000002390 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    2390:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    2394:	d2800021 	mov	x1, #0x1                   	// #1
    2398:	f2db9741 	movk	x1, #0xdcba, lsl #32
    239c:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    23a0:	910003fd 	mov	x29, sp
    23a4:	f9000bf3 	str	x19, [sp, #16]
    23a8:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    23ac:	f9400000 	ldr	x0, [x0]
    23b0:	927e7400 	and	x0, x0, #0xfffffffc
    23b4:	aa010000 	orr	x0, x0, x1
    23b8:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    23bc:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    23c0:	52800040 	mov	w0, #0x2                   	// #2
    23c4:	94000207 	bl	2be0 <yield>
    while (msg->header.done == 0) {
    23c8:	39400261 	ldrb	w1, [x19]
    23cc:	360fffa1 	tbz	w1, #1, 23c0 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    23d0:	f9400bf3 	ldr	x19, [sp, #16]
    23d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    23d8:	d65f03c0 	ret
    23dc:	d503201f 	nop

00000000000023e0 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    23e0:	f9400001 	ldr	x1, [x0]
    23e4:	d2800022 	mov	x2, #0x1                   	// #1
    23e8:	f2db9742 	movk	x2, #0xdcba, lsl #32
    23ec:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    23f0:	927e7421 	and	x1, x1, #0xfffffffc
    23f4:	aa020021 	orr	x1, x1, x2
    23f8:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    23fc:	d65f03c0 	ret

0000000000002400 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    2400:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2404:	910003fd 	mov	x29, sp
    2408:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    240c:	b9800801 	ldrsw	x1, [x0, #8]
    2410:	f9400800 	ldr	x0, [x0, #16]
    2414:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    2418:	38616800 	ldrb	w0, [x0, x1]
    241c:	370800a0 	tbnz	w0, #1, 2430 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    2420:	52800040 	mov	w0, #0x2                   	// #2
    2424:	940001ef 	bl	2be0 <yield>
    while (msg->header.done == 0) {
    2428:	39400260 	ldrb	w0, [x19]
    242c:	360fffa0 	tbz	w0, #1, 2420 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    2430:	b9400a60 	ldr	w0, [x19, #8]
    2434:	f9400bf3 	ldr	x19, [sp, #16]
    2438:	a8c27bfd 	ldp	x29, x30, [sp], #32
    243c:	d65f03c0 	ret

0000000000002440 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    2440:	d0000040 	adrp	x0, c000 <JIS_state_table+0x10>
}
    2444:	b9497000 	ldr	w0, [x0, #2416]
    2448:	d65f03c0 	ret
    244c:	d503201f 	nop

0000000000002450 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    2450:	f0000040 	adrp	x0, d000 <impure_data+0x680>
    2454:	52800021 	mov	w1, #0x1                   	// #1
    2458:	392be001 	strb	w1, [x0, #2808]
}
    245c:	d65f03c0 	ret

0000000000002460 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    2460:	f0000040 	adrp	x0, d000 <impure_data+0x680>
}
    2464:	396be000 	ldrb	w0, [x0, #2808]
    2468:	d65f03c0 	ret
    246c:	d503201f 	nop

0000000000002470 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    2470:	f0000040 	adrp	x0, d000 <impure_data+0x680>
    2474:	f9458000 	ldr	x0, [x0, #2816]
    2478:	b4000080 	cbz	x0, 2488 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    247c:	39400000 	ldrb	w0, [x0]
    2480:	d3430c00 	ubfx	x0, x0, #3, #1
}
    2484:	d65f03c0 	ret
        return false;
    2488:	52800000 	mov	w0, #0x0                   	// #0
}
    248c:	d65f03c0 	ret

0000000000002490 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    2490:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    2494:	d2806002 	mov	x2, #0x300                 	// #768
    2498:	52800001 	mov	w1, #0x0                   	// #0
{
    249c:	a9007bfd 	stp	x29, x30, [sp]
    24a0:	910003fd 	mov	x29, sp
    24a4:	a90153f3 	stp	x19, x20, [sp, #16]
    24a8:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    24ac:	9101c3e0 	add	x0, sp, #0x70
{
    24b0:	a9025bf5 	stp	x21, x22, [sp, #32]
    24b4:	d0000055 	adrp	x21, c000 <JIS_state_table+0x10>
    24b8:	9125c2b5 	add	x21, x21, #0x970
    24bc:	a90363f7 	stp	x23, x24, [sp, #48]
    24c0:	b0000056 	adrp	x22, b000 <_findenv_r+0x10>
    24c4:	9124c2d6 	add	x22, x22, #0x930
    24c8:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    24cc:	529b9754 	mov	w20, #0xdcba                	// #56506
    24d0:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    24d4:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    24d8:	940005aa 	bl	3b80 <memset>
    24dc:	f0000044 	adrp	x4, d000 <impure_data+0x680>
    24e0:	912be09c 	add	x28, x4, #0xaf8
    24e4:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    24e8:	91242000 	add	x0, x0, #0x908
    24ec:	f90037e0 	str	x0, [sp, #104]
    24f0:	b000005b 	adrp	x27, b000 <_findenv_r+0x10>
    24f4:	91256360 	add	x0, x27, #0x958
    24f8:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    24fc:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2500:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    2504:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    2508:	52800401 	mov	w1, #0x20                  	// #32
    250c:	940001d5 	bl	2c60 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2510:	9101c3fb 	add	x27, sp, #0x70
    2514:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    2518:	52800019 	mov	w25, #0x0                   	// #0
    251c:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    2520:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    2524:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    2528:	b4000980 	cbz	x0, 2658 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    252c:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    2530:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2534:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    2538:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    253c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    2540:	b9400401 	ldr	w1, [x0, #4]
    2544:	6b14003f 	cmp	w1, w20
    2548:	54000340 	b.eq	25b0 <ipc_server_loop+0x120>  // b.none
    254c:	14000039 	b	2630 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    2550:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    2554:	f9400780 	ldr	x0, [x28, #8]
    2558:	39400001 	ldrb	w1, [x0]
    255c:	36080641 	tbz	w1, #1, 2624 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2560:	29409b62 	ldp	w2, w6, [x27, #4]
    2564:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2568:	79400400 	ldrh	w0, [x0, #2]
    256c:	0b010041 	add	w1, w2, w1
    2570:	4b060021 	sub	w1, w1, w6
    2574:	1ac20c25 	sdiv	w5, w1, w2
    2578:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    257c:	6b01001f 	cmp	w0, w1
    2580:	5400078c 	b.gt	2670 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    2584:	0b060000 	add	w0, w0, w6
    2588:	1ac20c01 	sdiv	w1, w0, w2
    258c:	1b028020 	msub	w0, w1, w2, w0
    2590:	b9000b60 	str	w0, [x27, #8]
    2594:	37f804e0 	tbnz	w0, #31, 2630 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2598:	f9400b61 	ldr	x1, [x27, #16]
    259c:	8b20c020 	add	x0, x1, w0, sxtw
    25a0:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    25a4:	b9400401 	ldr	w1, [x0, #4]
    25a8:	6b14003f 	cmp	w1, w20
    25ac:	54000421 	b.ne	2630 <ipc_server_loop+0x1a0>  // b.any
    25b0:	39400001 	ldrb	w1, [x0]
    25b4:	12000421 	and	w1, w1, #0x3
    25b8:	7100043f 	cmp	w1, #0x1
    25bc:	540003a1 	b.ne	2630 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    25c0:	29409761 	ldp	w1, w5, [x27, #4]
    25c4:	b9400f66 	ldr	w6, [x27, #12]
    25c8:	0b0100c2 	add	w2, w6, w1
    25cc:	4b050042 	sub	w2, w2, w5
    25d0:	1ac10c45 	sdiv	w5, w2, w1
    25d4:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    25d8:	35000122 	cbnz	w2, 25fc <ipc_server_loop+0x16c>
    25dc:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    25e0:	6b01005f 	cmp	w2, w1
    25e4:	5400056c 	b.gt	2690 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    25e8:	0b060042 	add	w2, w2, w6
    25ec:	1ac10c45 	sdiv	w5, w2, w1
    25f0:	1b0188a2 	msub	w2, w5, w1, w2
    25f4:	b9000f62 	str	w2, [x27, #12]
    25f8:	37f801c2 	tbnz	w2, #31, 2630 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    25fc:	39400402 	ldrb	w2, [x0, #1]
    2600:	39400401 	ldrb	w1, [x0, #1]
    2604:	8b020e62 	add	x2, x19, x2, lsl #3
    2608:	f9400442 	ldr	x2, [x2, #8]
    260c:	b5fffa22 	cbnz	x2, 2550 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    2610:	f9400262 	ldr	x2, [x19]
    2614:	aa1603e0 	mov	x0, x22
    2618:	97fffdee 	bl	1dd0 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    261c:	f9400780 	ldr	x0, [x28, #8]
    2620:	17ffffd0 	b	2560 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    2624:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    2628:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    262c:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    2630:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2634:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    2638:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    263c:	eb1b02ff 	cmp	x23, x27
    2640:	54fff701 	b.ne	2520 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2644:	52000340 	eor	w0, w26, #0x1
    2648:	5280003a 	mov	w26, #0x1                   	// #1
    264c:	6a00033f 	tst	w25, w0
    2650:	54fff601 	b.ne	2510 <ipc_server_loop+0x80>  // b.any
    2654:	17ffffaa 	b	24fc <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    2658:	94000162 	bl	2be0 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    265c:	52000340 	eor	w0, w26, #0x1
    2660:	5280003a 	mov	w26, #0x1                   	// #1
    2664:	6a00033f 	tst	w25, w0
    2668:	54fff541 	b.ne	2510 <ipc_server_loop+0x80>  // b.any
    266c:	17ffffa4 	b	24fc <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    2670:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2674:	9100637b 	add	x27, x27, #0x18
    2678:	97fffdd6 	bl	1dd0 <printf>
                cur_sess_id = -1;
    267c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    2680:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2684:	eb1b02ff 	cmp	x23, x27
    2688:	54fff4c1 	b.ne	2520 <ipc_server_loop+0x90>  // b.any
    268c:	17ffffee 	b	2644 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    2690:	f94037e0 	ldr	x0, [sp, #104]
    2694:	9100637b 	add	x27, x27, #0x18
    2698:	97fffdce 	bl	1dd0 <printf>
                cur_sess_id = -1;
    269c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    26a0:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    26a4:	eb1b02ff 	cmp	x23, x27
    26a8:	54fff3c1 	b.ne	2520 <ipc_server_loop+0x90>  // b.any
    26ac:	17ffffe6 	b	2644 <ipc_server_loop+0x1b4>

00000000000026b0 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    26b0:	aa0003e3 	mov	x3, x0
    26b4:	aa0103e0 	mov	x0, x1
    26b8:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    26bc:	aa0303e2 	mov	x2, x3
    26c0:	14000160 	b	2c40 <session>
    26c4:	d503201f 	nop
    26c8:	d503201f 	nop
    26cc:	d503201f 	nop

00000000000026d0 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    26d0:	1400016c 	b	2c80 <close_session>
    26d4:	d503201f 	nop
    26d8:	d503201f 	nop
    26dc:	d503201f 	nop

00000000000026e0 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    26e0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    26e4:	910003fd 	mov	x29, sp
    26e8:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    26ec:	37f80561 	tbnz	w1, #31, 2798 <session_alloc_buf+0xb8>
    26f0:	a90153f3 	stp	x19, x20, [sp, #16]
    26f4:	2a0103f4 	mov	w20, w1
    26f8:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    26fc:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    2700:	d2800015 	mov	x21, #0x0                   	// #0
    2704:	b9400c03 	ldr	w3, [x0, #12]
    2708:	0b030020 	add	w0, w1, w3
    270c:	4b020000 	sub	w0, w0, w2
    2710:	1ac10c02 	sdiv	w2, w0, w1
    2714:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    2718:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    271c:	6b01029f 	cmp	w20, w1
    2720:	5400032c 	b.gt	2784 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2724:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    2728:	93407e82 	sxtw	x2, w20
    272c:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2730:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    2734:	aa1503e0 	mov	x0, x21
    2738:	94000512 	bl	3b80 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    273c:	29408e60 	ldp	w0, w3, [x19, #4]
    2740:	b9400e61 	ldr	w1, [x19, #12]
    2744:	0b010002 	add	w2, w0, w1
    2748:	4b030043 	sub	w3, w2, w3
    274c:	1ac00c62 	sdiv	w2, w3, w0
    2750:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    2754:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    2758:	6b02029f 	cmp	w20, w2
    275c:	5400028c 	b.gt	27ac <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    2760:	0b010294 	add	w20, w20, w1
    2764:	1ac00e81 	sdiv	w1, w20, w0
    2768:	1b00d034 	msub	w20, w1, w0, w20
    276c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    2770:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    2774:	aa1503e0 	mov	x0, x21
    2778:	f94013f5 	ldr	x21, [sp, #32]
    277c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2780:	d65f03c0 	ret
    2784:	aa1503e0 	mov	x0, x21
    2788:	a94153f3 	ldp	x19, x20, [sp, #16]
    278c:	f94013f5 	ldr	x21, [sp, #32]
    2790:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2794:	d65f03c0 	ret
        return NULL;
    2798:	d2800015 	mov	x21, #0x0                   	// #0
}
    279c:	aa1503e0 	mov	x0, x21
    27a0:	f94013f5 	ldr	x21, [sp, #32]
    27a4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    27a8:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    27ac:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    27b0:	91242000 	add	x0, x0, #0x908
    27b4:	97fffd87 	bl	1dd0 <printf>
        return -1;
    27b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    27bc:	17ffffee 	b	2774 <session_alloc_buf+0x94>

00000000000027c0 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    27c0:	37f80241 	tbnz	w1, #31, 2808 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    27c4:	29409403 	ldp	w3, w5, [x0, #4]
    27c8:	aa0003e2 	mov	x2, x0
    27cc:	b9400c00 	ldr	w0, [x0, #12]
    27d0:	0b000060 	add	w0, w3, w0
    27d4:	4b050000 	sub	w0, w0, w5
    27d8:	1ac30c04 	sdiv	w4, w0, w3
    27dc:	1b038080 	msub	w0, w4, w3, w0
    27e0:	6b00003f 	cmp	w1, w0
    27e4:	5400012c 	b.gt	2808 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    27e8:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    27ec:	52800020 	mov	w0, #0x1                   	// #1
    27f0:	1ac30c24 	sdiv	w4, w1, w3
    27f4:	1b038481 	msub	w1, w4, w3, w1
    27f8:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    27fc:	3100043f 	cmn	w1, #0x1
    2800:	54000080 	b.eq	2810 <session_free_buf+0x50>  // b.none
}
    2804:	d65f03c0 	ret
        return false;
    2808:	52800000 	mov	w0, #0x0                   	// #0
}
    280c:	d65f03c0 	ret
{
    2810:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    2814:	b0000043 	adrp	x3, b000 <_findenv_r+0x10>
    2818:	b0000042 	adrp	x2, b000 <_findenv_r+0x10>
{
    281c:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    2820:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    2824:	91270063 	add	x3, x3, #0x9c0
    2828:	91280042 	add	x2, x2, #0xa00
    282c:	9127c000 	add	x0, x0, #0x9f0
    2830:	52800801 	mov	w1, #0x40                  	// #64
    2834:	940003a3 	bl	36c0 <__assert_func>
    2838:	d503201f 	nop
    283c:	d503201f 	nop

0000000000002840 <add>:
 */
#include "simple_service.h"

IPC_INTERFACE(Ipc_add, 2, a, b, sizeof(int), sizeof(int));
int add(struct Session* session, int a, int b)
{
    2840:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2844:	910003fd 	mov	x29, sp
    2848:	290507e2 	stp	w2, w1, [sp, #40]
IPC_INTERFACE(Ipc_add, 2, a, b, sizeof(int), sizeof(int));
    284c:	b4000660 	cbz	x0, 2918 <add+0xd8>
    2850:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    2854:	9100e3e2 	add	x2, sp, #0x38
    2858:	52800041 	mov	w1, #0x2                   	// #2
    285c:	a90153f3 	stp	x19, x20, [sp, #16]
    2860:	aa0003f4 	mov	x20, x0
    2864:	f9001fe3 	str	x3, [sp, #56]
    2868:	97fffe1a 	bl	20d0 <new_ipc_msg>
    286c:	aa0003f3 	mov	x19, x0
    2870:	9100b3e2 	add	x2, sp, #0x2c
    2874:	52800083 	mov	w3, #0x4                   	// #4
    2878:	52800001 	mov	w1, #0x0                   	// #0
    287c:	97fffe55 	bl	21d0 <ipc_msg_set_nth_arg>
    2880:	9100a3e2 	add	x2, sp, #0x28
    2884:	52800083 	mov	w3, #0x4                   	// #4
    2888:	52800021 	mov	w1, #0x1                   	// #1
    288c:	aa1303e0 	mov	x0, x19
    2890:	97fffe50 	bl	21d0 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
    2894:	52800020 	mov	w0, #0x1                   	// #1
    2898:	39000660 	strb	w0, [x19, #1]
    289c:	aa1303e0 	mov	x0, x19
    28a0:	97fffebc 	bl	2390 <ipc_msg_send_wait>
    28a4:	9100b3e2 	add	x2, sp, #0x2c
    28a8:	52800083 	mov	w3, #0x4                   	// #4
    28ac:	52800001 	mov	w1, #0x0                   	// #0
    28b0:	aa1303e0 	mov	x0, x19
    28b4:	97fffe7f 	bl	22b0 <ipc_msg_get_nth_arg>
    28b8:	9100a3e2 	add	x2, sp, #0x28
    28bc:	aa1303e0 	mov	x0, x19
    28c0:	52800083 	mov	w3, #0x4                   	// #4
    28c4:	52800021 	mov	w1, #0x1                   	// #1
    28c8:	97fffe7a 	bl	22b0 <ipc_msg_get_nth_arg>
    28cc:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    28d0:	39400260 	ldrb	w0, [x19]
    28d4:	36080260 	tbz	w0, #1, 2920 <add+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    28d8:	91002261 	add	x1, x19, #0x8
    28dc:	d2800082 	mov	x2, #0x4                   	// #4
    28e0:	9100e3e0 	add	x0, sp, #0x38
    28e4:	94000417 	bl	3940 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    28e8:	b9800a80 	ldrsw	x0, [x20, #8]
    28ec:	f9400a81 	ldr	x1, [x20, #16]
    28f0:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    28f4:	38606820 	ldrb	w0, [x1, x0]
    28f8:	36100080 	tbz	w0, #2, 2908 <add+0xc8>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    28fc:	79400441 	ldrh	w1, [x2, #2]
    2900:	aa1403e0 	mov	x0, x20
    2904:	97ffffaf 	bl	27c0 <session_free_buf>
    2908:	a94153f3 	ldp	x19, x20, [sp, #16]
    290c:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_add)(session, &a, &b);
}
    2910:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2914:	d65f03c0 	ret
IPC_INTERFACE(Ipc_add, 2, a, b, sizeof(int), sizeof(int));
    2918:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_add)(session, &a, &b);
    291c:	17fffffd 	b	2910 <add+0xd0>
    assert(msg->header.done == 1);
    2920:	b0000043 	adrp	x3, b000 <_findenv_r+0x10>
    2924:	b0000042 	adrp	x2, b000 <_findenv_r+0x10>
    2928:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    292c:	91286063 	add	x3, x3, #0xa18
    2930:	9128c042 	add	x2, x2, #0xa30
    2934:	91188000 	add	x0, x0, #0x620
    2938:	52800fc1 	mov	w1, #0x7e                  	// #126
    293c:	94000361 	bl	36c0 <__assert_func>

0000000000002940 <hello_string>:

IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
int hello_string(struct Session* session, char* buf, int len)
{
    2940:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2944:	910003fd 	mov	x29, sp
    2948:	b9003fe2 	str	w2, [sp, #60]
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    294c:	b40006e0 	cbz	x0, 2a28 <hello_string+0xe8>
    2950:	2a0203e3 	mov	w3, w2
    2954:	910123e2 	add	x2, sp, #0x48
    2958:	a90153f3 	stp	x19, x20, [sp, #16]
    295c:	aa0003f4 	mov	x20, x0
    2960:	a9025bf5 	stp	x21, x22, [sp, #32]
    2964:	aa0103f5 	mov	x21, x1
    2968:	52800096 	mov	w22, #0x4                   	// #4
    296c:	52800041 	mov	w1, #0x2                   	// #2
    2970:	29095be3 	stp	w3, w22, [sp, #72]
    2974:	97fffdd7 	bl	20d0 <new_ipc_msg>
    2978:	aa0003f3 	mov	x19, x0
    297c:	b9403fe3 	ldr	w3, [sp, #60]
    2980:	aa1503e2 	mov	x2, x21
    2984:	52800001 	mov	w1, #0x0                   	// #0
    2988:	97fffe12 	bl	21d0 <ipc_msg_set_nth_arg>
    298c:	2a1603e3 	mov	w3, w22
    2990:	9100f3e2 	add	x2, sp, #0x3c
    2994:	52800021 	mov	w1, #0x1                   	// #1
    2998:	aa1303e0 	mov	x0, x19
    299c:	97fffe0d 	bl	21d0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    29a0:	52800040 	mov	w0, #0x2                   	// #2
    29a4:	39000660 	strb	w0, [x19, #1]
    29a8:	aa1303e0 	mov	x0, x19
    29ac:	97fffe79 	bl	2390 <ipc_msg_send_wait>
    29b0:	b9403fe3 	ldr	w3, [sp, #60]
    29b4:	aa1503e2 	mov	x2, x21
    29b8:	52800001 	mov	w1, #0x0                   	// #0
    29bc:	aa1303e0 	mov	x0, x19
    29c0:	97fffe3c 	bl	22b0 <ipc_msg_get_nth_arg>
    29c4:	2a1603e3 	mov	w3, w22
    29c8:	9100f3e2 	add	x2, sp, #0x3c
    29cc:	aa1303e0 	mov	x0, x19
    29d0:	52800021 	mov	w1, #0x1                   	// #1
    29d4:	97fffe37 	bl	22b0 <ipc_msg_get_nth_arg>
    29d8:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    29dc:	39400260 	ldrb	w0, [x19]
    29e0:	36080280 	tbz	w0, #1, 2a30 <hello_string+0xf0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    29e4:	91002261 	add	x1, x19, #0x8
    29e8:	d2800082 	mov	x2, #0x4                   	// #4
    29ec:	910123e0 	add	x0, sp, #0x48
    29f0:	940003d4 	bl	3940 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    29f4:	b9800a80 	ldrsw	x0, [x20, #8]
    29f8:	f9400a81 	ldr	x1, [x20, #16]
    29fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    2a00:	38606820 	ldrb	w0, [x1, x0]
    2a04:	36100080 	tbz	w0, #2, 2a14 <hello_string+0xd4>
    return session_free_buf(session, msg->header.len);
    2a08:	79400441 	ldrh	w1, [x2, #2]
    2a0c:	aa1403e0 	mov	x0, x20
    2a10:	97ffff6c 	bl	27c0 <session_free_buf>
    2a14:	a94153f3 	ldp	x19, x20, [sp, #16]
    2a18:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2a1c:	b9404be0 	ldr	w0, [sp, #72]
    return IPC_CALL(Ipc_hello_string)(session, buf, &len);
}
    2a20:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2a24:	d65f03c0 	ret
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    2a28:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_hello_string)(session, buf, &len);
    2a2c:	17fffffd 	b	2a20 <hello_string+0xe0>
    assert(msg->header.done == 1);
    2a30:	b0000043 	adrp	x3, b000 <_findenv_r+0x10>
    2a34:	b0000042 	adrp	x2, b000 <_findenv_r+0x10>
    2a38:	b0000040 	adrp	x0, b000 <_findenv_r+0x10>
    2a3c:	91286063 	add	x3, x3, #0xa18
    2a40:	9128c042 	add	x2, x2, #0xa30
    2a44:	91188000 	add	x0, x0, #0x620
    2a48:	52800fc1 	mov	w1, #0x7e                  	// #126
    2a4c:	9400031d 	bl	36c0 <__assert_func>

0000000000002a50 <hello_string_nowait>:

struct IpcMsg* hello_string_nowait(struct Session* session, char** buf, int len)
{
    2a50:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    2a54:	52800083 	mov	w3, #0x4                   	// #4
{
    2a58:	910003fd 	mov	x29, sp
    2a5c:	a90153f3 	stp	x19, x20, [sp, #16]
    2a60:	aa0103f4 	mov	x20, x1
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    2a64:	52800041 	mov	w1, #0x2                   	// #2
{
    2a68:	b9002fe2 	str	w2, [sp, #44]
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    2a6c:	29070fe2 	stp	w2, w3, [sp, #56]
    2a70:	9100e3e2 	add	x2, sp, #0x38
    2a74:	97fffd97 	bl	20d0 <new_ipc_msg>
    2a78:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    2a7c:	39404000 	ldrb	w0, [x0, #16]
    2a80:	37000220 	tbnz	w0, #0, 2ac4 <hello_string_nowait+0x74>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    2a84:	79401a60 	ldrh	w0, [x19, #12]
    2a88:	8b000260 	add	x0, x19, x0
    struct IpcMsg* msg = IPC_CREATE_MSG_FUNC(Ipc_hello_string)(session, *buf, &len);
    *buf = ipc_msg_get_nth_arg_buf(msg, 0);
    2a8c:	f9000280 	str	x0, [x20]
    ipc_msg_set_nth_arg(msg, 1, &len, sizeof(int));
    2a90:	9100b3e2 	add	x2, sp, #0x2c
    2a94:	52800083 	mov	w3, #0x4                   	// #4
    2a98:	52800021 	mov	w1, #0x1                   	// #1
    2a9c:	aa1303e0 	mov	x0, x19
    2aa0:	97fffdcc 	bl	21d0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    2aa4:	52800040 	mov	w0, #0x2                   	// #2
    2aa8:	39000660 	strb	w0, [x19, #1]
    ipc_msg_set_opcode(msg, Ipc_hello_string);
    ipc_msg_send_nowait(msg);
    2aac:	aa1303e0 	mov	x0, x19
    2ab0:	97fffe4c 	bl	23e0 <ipc_msg_send_nowait>
    return msg;
}
    2ab4:	aa1303e0 	mov	x0, x19
    2ab8:	a94153f3 	ldp	x19, x20, [sp, #16]
    2abc:	a8c47bfd 	ldp	x29, x30, [sp], #64
    2ac0:	d65f03c0 	ret
        return NULL;
    2ac4:	d2800000 	mov	x0, #0x0                   	// #0
    2ac8:	17fffff1 	b	2a8c <hello_string_nowait+0x3c>
    2acc:	d503201f 	nop

0000000000002ad0 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    2ad0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    2ad4:	910003fd 	mov	x29, sp
    2ad8:	a90153f3 	stp	x19, x20, [sp, #16]
    2adc:	a9025bf5 	stp	x21, x22, [sp, #32]
    2ae0:	2a0103f6 	mov	w22, w1
    2ae4:	a90363f7 	stp	x23, x24, [sp, #48]
    2ae8:	aa0203f8 	mov	x24, x2
    2aec:	aa0003f7 	mov	x23, x0
    2af0:	a9046bf9 	stp	x25, x26, [sp, #64]
    2af4:	aa0403f9 	mov	x25, x4
    2af8:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    2afc:	d63f0060 	blr	x3
    2b00:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    2b04:	93407c00 	sxtw	x0, w0
    2b08:	94000202 	bl	3310 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    2b0c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    2b10:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    2b14:	5400022d 	b.le	2b58 <spawn+0x88>
    2b18:	52800013 	mov	w19, #0x0                   	// #0
    2b1c:	f9002bfb 	str	x27, [sp, #80]
    2b20:	5282001b 	mov	w27, #0x1000                	// #4096
    2b24:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2b28:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    2b2c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2b30:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    2b34:	8b33c2a2 	add	x2, x21, w19, sxtw
    2b38:	1a9bd084 	csel	w4, w4, w27, le
    2b3c:	2a1603e1 	mov	w1, w22
    2b40:	aa1703e0 	mov	x0, x23
    2b44:	d63f0300 	blr	x24
    2b48:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    2b4c:	6b13029f 	cmp	w20, w19
    2b50:	54fffecc 	b.gt	2b28 <spawn+0x58>
    2b54:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    2b58:	aa1a03e3 	mov	x3, x26
    2b5c:	aa1903e2 	mov	x2, x25
    2b60:	aa1503e1 	mov	x1, x21
    2b64:	d2800004 	mov	x4, #0x0                   	// #0
    2b68:	52800020 	mov	w0, #0x1                   	// #1
    2b6c:	940000b9 	bl	2e50 <syscall>
    2b70:	2a0003f3 	mov	w19, w0
    free(img);
    2b74:	aa1503e0 	mov	x0, x21
    2b78:	9400028a 	bl	35a0 <free>
    return ret;
}
    2b7c:	2a1303e0 	mov	w0, w19
    2b80:	a94153f3 	ldp	x19, x20, [sp, #16]
    2b84:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2b88:	a94363f7 	ldp	x23, x24, [sp, #48]
    2b8c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2b90:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2b94:	d65f03c0 	ret
    2b98:	d503201f 	nop
    2b9c:	d503201f 	nop

0000000000002ba0 <thread>:

int thread(void* entry, char* name, char** argv)
{
    2ba0:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    2ba4:	aa0203e3 	mov	x3, x2
    2ba8:	aa0003e1 	mov	x1, x0
    2bac:	aa0403e2 	mov	x2, x4
    2bb0:	52800120 	mov	w0, #0x9                   	// #9
    2bb4:	d2800004 	mov	x4, #0x0                   	// #0
    2bb8:	140000a6 	b	2e50 <syscall>
    2bbc:	d503201f 	nop

0000000000002bc0 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    2bc0:	93407c01 	sxtw	x1, w0
    2bc4:	d2800004 	mov	x4, #0x0                   	// #0
    2bc8:	d2800003 	mov	x3, #0x0                   	// #0
    2bcc:	d2800002 	mov	x2, #0x0                   	// #0
    2bd0:	52800040 	mov	w0, #0x2                   	// #2
    2bd4:	1400009f 	b	2e50 <syscall>
    2bd8:	d503201f 	nop
    2bdc:	d503201f 	nop

0000000000002be0 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    2be0:	2a0003e1 	mov	w1, w0
    2be4:	d2800004 	mov	x4, #0x0                   	// #0
    2be8:	d2800003 	mov	x3, #0x0                   	// #0
    2bec:	d2800002 	mov	x2, #0x0                   	// #0
    2bf0:	52800060 	mov	w0, #0x3                   	// #3
    2bf4:	14000097 	b	2e50 <syscall>
    2bf8:	d503201f 	nop
    2bfc:	d503201f 	nop

0000000000002c00 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    2c00:	93407c01 	sxtw	x1, w0
    2c04:	d2800004 	mov	x4, #0x0                   	// #0
    2c08:	d2800003 	mov	x3, #0x0                   	// #0
    2c0c:	d2800002 	mov	x2, #0x0                   	// #0
    2c10:	52800180 	mov	w0, #0xc                   	// #12
    2c14:	1400008f 	b	2e50 <syscall>
    2c18:	d503201f 	nop
    2c1c:	d503201f 	nop

0000000000002c20 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    2c20:	aa0003e1 	mov	x1, x0
    2c24:	d2800004 	mov	x4, #0x0                   	// #0
    2c28:	d2800003 	mov	x3, #0x0                   	// #0
    2c2c:	d2800002 	mov	x2, #0x0                   	// #0
    2c30:	528000a0 	mov	w0, #0x5                   	// #5
    2c34:	14000087 	b	2e50 <syscall>
    2c38:	d503201f 	nop
    2c3c:	d503201f 	nop

0000000000002c40 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    2c40:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    2c44:	aa0203e3 	mov	x3, x2
    2c48:	aa0003e1 	mov	x1, x0
    2c4c:	528000c0 	mov	w0, #0x6                   	// #6
    2c50:	93407c82 	sxtw	x2, w4
    2c54:	d2800004 	mov	x4, #0x0                   	// #0
    2c58:	1400007e 	b	2e50 <syscall>
    2c5c:	d503201f 	nop

0000000000002c60 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    2c60:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    2c64:	d2800004 	mov	x4, #0x0                   	// #0
    2c68:	aa0003e1 	mov	x1, x0
    2c6c:	d2800003 	mov	x3, #0x0                   	// #0
    2c70:	528000e0 	mov	w0, #0x7                   	// #7
    2c74:	14000077 	b	2e50 <syscall>
    2c78:	d503201f 	nop
    2c7c:	d503201f 	nop

0000000000002c80 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    2c80:	aa0003e1 	mov	x1, x0
    2c84:	d2800004 	mov	x4, #0x0                   	// #0
    2c88:	d2800003 	mov	x3, #0x0                   	// #0
    2c8c:	d2800002 	mov	x2, #0x0                   	// #0
    2c90:	52800100 	mov	w0, #0x8                   	// #8
    2c94:	1400006f 	b	2e50 <syscall>
    2c98:	d503201f 	nop
    2c9c:	d503201f 	nop

0000000000002ca0 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    2ca0:	aa0003e2 	mov	x2, x0
    2ca4:	d2800004 	mov	x4, #0x0                   	// #0
    2ca8:	d2800003 	mov	x3, #0x0                   	// #0
    2cac:	d2800061 	mov	x1, #0x3                   	// #3
    2cb0:	52800140 	mov	w0, #0xa                   	// #10
    2cb4:	14000067 	b	2e50 <syscall>
    2cb8:	d503201f 	nop
    2cbc:	d503201f 	nop

0000000000002cc0 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    2cc0:	aa0003e2 	mov	x2, x0
    2cc4:	d2800004 	mov	x4, #0x0                   	// #0
    2cc8:	d2800003 	mov	x3, #0x0                   	// #0
    2ccc:	d2800021 	mov	x1, #0x1                   	// #1
    2cd0:	52800140 	mov	w0, #0xa                   	// #10
    2cd4:	1400005f 	b	2e50 <syscall>
    2cd8:	d503201f 	nop
    2cdc:	d503201f 	nop

0000000000002ce0 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    2ce0:	d2800004 	mov	x4, #0x0                   	// #0
    2ce4:	d2800003 	mov	x3, #0x0                   	// #0
    2ce8:	d2800002 	mov	x2, #0x0                   	// #0
    2cec:	d2800041 	mov	x1, #0x2                   	// #2
    2cf0:	52800140 	mov	w0, #0xa                   	// #10
    2cf4:	14000057 	b	2e50 <syscall>
    2cf8:	d503201f 	nop
    2cfc:	d503201f 	nop

0000000000002d00 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    2d00:	d2800004 	mov	x4, #0x0                   	// #0
    2d04:	d2800003 	mov	x3, #0x0                   	// #0
    2d08:	d2800002 	mov	x2, #0x0                   	// #0
    2d0c:	d2800081 	mov	x1, #0x4                   	// #4
    2d10:	52800140 	mov	w0, #0xa                   	// #10
    2d14:	1400004f 	b	2e50 <syscall>
    2d18:	d503201f 	nop
    2d1c:	d503201f 	nop

0000000000002d20 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    2d20:	d2800004 	mov	x4, #0x0                   	// #0
    2d24:	d2800003 	mov	x3, #0x0                   	// #0
    2d28:	d2800002 	mov	x2, #0x0                   	// #0
    2d2c:	d28000a1 	mov	x1, #0x5                   	// #5
    2d30:	52800140 	mov	w0, #0xa                   	// #10
    2d34:	14000047 	b	2e50 <syscall>
    2d38:	d503201f 	nop
    2d3c:	d503201f 	nop

0000000000002d40 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    2d40:	d2800004 	mov	x4, #0x0                   	// #0
    2d44:	d2800003 	mov	x3, #0x0                   	// #0
    2d48:	d2800002 	mov	x2, #0x0                   	// #0
    2d4c:	d28000c1 	mov	x1, #0x6                   	// #6
    2d50:	52800140 	mov	w0, #0xa                   	// #10
    2d54:	1400003f 	b	2e50 <syscall>
    2d58:	d503201f 	nop
    2d5c:	d503201f 	nop

0000000000002d60 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    2d60:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    2d64:	92401c64 	and	x4, x3, #0xff
    2d68:	aa0103e2 	mov	x2, x1
    2d6c:	aa0003e1 	mov	x1, x0
    2d70:	93407ca3 	sxtw	x3, w5
    2d74:	52800080 	mov	w0, #0x4                   	// #4
    2d78:	14000036 	b	2e50 <syscall>
    2d7c:	d503201f 	nop

0000000000002d80 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    2d80:	93407c22 	sxtw	x2, w1
    2d84:	d2800004 	mov	x4, #0x0                   	// #0
    2d88:	93407c01 	sxtw	x1, w0
    2d8c:	d2800003 	mov	x3, #0x0                   	// #0
    2d90:	52800160 	mov	w0, #0xb                   	// #11
    2d94:	1400002f 	b	2e50 <syscall>
    2d98:	d503201f 	nop
    2d9c:	d503201f 	nop

0000000000002da0 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    2da0:	93407c02 	sxtw	x2, w0
    2da4:	d2800004 	mov	x4, #0x0                   	// #0
    2da8:	d2800003 	mov	x3, #0x0                   	// #0
    2dac:	d2800001 	mov	x1, #0x0                   	// #0
    2db0:	528001a0 	mov	w0, #0xd                   	// #13
    2db4:	14000027 	b	2e50 <syscall>
    2db8:	d503201f 	nop
    2dbc:	d503201f 	nop

0000000000002dc0 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    2dc0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2dc4:	93407c02 	sxtw	x2, w0
    2dc8:	d2800004 	mov	x4, #0x0                   	// #0
{
    2dcc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    2dd0:	d2800003 	mov	x3, #0x0                   	// #0
    2dd4:	d2800021 	mov	x1, #0x1                   	// #1
    2dd8:	528001a0 	mov	w0, #0xd                   	// #13
    2ddc:	9400001d 	bl	2e50 <syscall>
    2de0:	7100001f 	cmp	w0, #0x0
}
    2de4:	1a9f07e0 	cset	w0, ne  // ne = any
    2de8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2dec:	d65f03c0 	ret

0000000000002df0 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    2df0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2df4:	93407c02 	sxtw	x2, w0
    2df8:	d2800004 	mov	x4, #0x0                   	// #0
{
    2dfc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2e00:	d2800003 	mov	x3, #0x0                   	// #0
    2e04:	d2800061 	mov	x1, #0x3                   	// #3
    2e08:	528001a0 	mov	w0, #0xd                   	// #13
    2e0c:	94000011 	bl	2e50 <syscall>
    2e10:	7100001f 	cmp	w0, #0x0
}
    2e14:	1a9f07e0 	cset	w0, ne  // ne = any
    2e18:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2e1c:	d65f03c0 	ret

0000000000002e20 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    2e20:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2e24:	93407c02 	sxtw	x2, w0
    2e28:	d2800004 	mov	x4, #0x0                   	// #0
{
    2e2c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2e30:	d2800003 	mov	x3, #0x0                   	// #0
    2e34:	d2800041 	mov	x1, #0x2                   	// #2
    2e38:	528001a0 	mov	w0, #0xd                   	// #13
    2e3c:	94000005 	bl	2e50 <syscall>
    2e40:	7100001f 	cmp	w0, #0x0
    2e44:	1a9f07e0 	cset	w0, ne  // ne = any
    2e48:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2e4c:	d65f03c0 	ret

0000000000002e50 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    2e50:	2a0003e5 	mov	w5, w0
    2e54:	aa0103e6 	mov	x6, x1
    2e58:	aa0203e7 	mov	x7, x2
    2e5c:	aa0303e8 	mov	x8, x3
    2e60:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    2e64:	aa0503e0 	mov	x0, x5
    2e68:	aa0603e1 	mov	x1, x6
    2e6c:	aa0703e2 	mov	x2, x7
    2e70:	aa0803e3 	mov	x3, x8
    2e74:	aa0903e4 	mov	x4, x9
    2e78:	d4000001 	svc	#0x0
    2e7c:	d5033b9f 	dsb	ish
    2e80:	d5033fdf 	isb
    2e84:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    2e88:	2a0503e0 	mov	w0, w5
    2e8c:	d65f03c0 	ret

0000000000002e90 <insert_node>:
    int list = 0;
    void* search_ptr = ptr;
    void* insert_ptr = NULL;

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2e90:	f100043f 	cmp	x1, #0x1
    int list = 0;
    2e94:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2e98:	540000e9 	b.ls	2eb4 <insert_node+0x24>  // b.plast
    2e9c:	d503201f 	nop
        size >>= 1;
        list++;
    2ea0:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    2ea4:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2ea8:	7100485f 	cmp	w2, #0x12
    2eac:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    2eb0:	54ffff88 	b.hi	2ea0 <insert_node+0x10>  // b.pmore
    }

    // Keep size ascending order and search
    search_ptr = segregated_free_lists[list];
    2eb4:	93407c44 	sxtw	x4, w2
    2eb8:	f0000046 	adrp	x6, d000 <impure_data+0x680>
    2ebc:	912c20c6 	add	x6, x6, #0xb08
    void* insert_ptr = NULL;
    2ec0:	d2800005 	mov	x5, #0x0                   	// #0
    search_ptr = segregated_free_lists[list];
    2ec4:	f86478c2 	ldr	x2, [x6, x4, lsl #3]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    2ec8:	b50000c2 	cbnz	x2, 2ee0 <insert_node+0x50>
    2ecc:	14000018 	b	2f2c <insert_node+0x9c>
        insert_ptr = search_ptr;
        search_ptr = PRED(search_ptr);
    2ed0:	f9400043 	ldr	x3, [x2]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    2ed4:	aa0203e5 	mov	x5, x2
    2ed8:	b4000223 	cbz	x3, 2f1c <insert_node+0x8c>
    2edc:	aa0303e2 	mov	x2, x3
    2ee0:	b85fc043 	ldur	w3, [x2, #-4]
    2ee4:	927d7063 	and	x3, x3, #0xfffffff8
    2ee8:	eb01007f 	cmp	x3, x1
    2eec:	54ffff23 	b.cc	2ed0 <insert_node+0x40>  // b.lo, b.ul, b.last
    }

    // Set predecessor and successor
    if (search_ptr != NULL) {
        if (insert_ptr != NULL) {
    2ef0:	b40000c5 	cbz	x5, 2f08 <insert_node+0x78>
            SET_PTR(PRED_PTR(ptr), search_ptr);
    2ef4:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    2ef8:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    2efc:	f8004005 	stur	x5, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    2f00:	f90000a0 	str	x0, [x5]
            segregated_free_lists[list] = ptr;
        }
    }

    return;
}
    2f04:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), search_ptr);
    2f08:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    2f0c:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), NULL);
    2f10:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    2f14:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    2f18:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    2f1c:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    2f20:	f8004002 	stur	x2, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    2f24:	f9000040 	str	x0, [x2]
}
    2f28:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    2f2c:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), NULL);
    2f30:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    2f34:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    2f38:	d65f03c0 	ret
    2f3c:	d503201f 	nop

0000000000002f40 <delete_node>:

static void delete_node(void* ptr)
{
    int list = 0;
    size_t size = GET_SIZE(HDRP(ptr));
    2f40:	b85fc001 	ldur	w1, [x0, #-4]
    2f44:	121d7022 	and	w2, w1, #0xfffffff8
    2f48:	927d7021 	and	x1, x1, #0xfffffff8

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2f4c:	7100045f 	cmp	w2, #0x1
    int list = 0;
    2f50:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2f54:	540000c9 	b.ls	2f6c <delete_node+0x2c>  // b.plast
        size >>= 1;
        list++;
    2f58:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    2f5c:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    2f60:	7100485f 	cmp	w2, #0x12
    2f64:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    2f68:	54ffff88 	b.hi	2f58 <delete_node+0x18>  // b.pmore
    }

    if (PRED(ptr) != NULL) {
    2f6c:	f9400003 	ldr	x3, [x0]
        if (SUCC(ptr) != NULL) {
    2f70:	f8404001 	ldur	x1, [x0, #4]
    if (PRED(ptr) != NULL) {
    2f74:	b40001a3 	cbz	x3, 2fa8 <delete_node+0x68>
        if (SUCC(ptr) != NULL) {
    2f78:	b40000c1 	cbz	x1, 2f90 <delete_node+0x50>
            SET_PTR(SUCC_PTR(PRED(ptr)), SUCC(ptr));
    2f7c:	f8004061 	stur	x1, [x3, #4]
            SET_PTR(PRED_PTR(SUCC(ptr)), PRED(ptr));
    2f80:	f8404001 	ldur	x1, [x0, #4]
    2f84:	f9400000 	ldr	x0, [x0]
    2f88:	f9000020 	str	x0, [x1]
            segregated_free_lists[list] = NULL;
        }
    }

    return;
}
    2f8c:	d65f03c0 	ret
            segregated_free_lists[list] = PRED(ptr);
    2f90:	f0000041 	adrp	x1, d000 <impure_data+0x680>
    2f94:	912c2021 	add	x1, x1, #0xb08
            SET_PTR(SUCC_PTR(PRED(ptr)), NULL);
    2f98:	f800407f 	stur	xzr, [x3, #4]
            segregated_free_lists[list] = PRED(ptr);
    2f9c:	f9400000 	ldr	x0, [x0]
    2fa0:	f822d820 	str	x0, [x1, w2, sxtw #3]
}
    2fa4:	d65f03c0 	ret
        if (SUCC(ptr) != NULL) {
    2fa8:	b4000061 	cbz	x1, 2fb4 <delete_node+0x74>
            SET_PTR(PRED_PTR(SUCC(ptr)), NULL);
    2fac:	f900003f 	str	xzr, [x1]
}
    2fb0:	d65f03c0 	ret
            segregated_free_lists[list] = NULL;
    2fb4:	f0000040 	adrp	x0, d000 <impure_data+0x680>
    2fb8:	912c2000 	add	x0, x0, #0xb08
    2fbc:	f822d81f 	str	xzr, [x0, w2, sxtw #3]
}
    2fc0:	d65f03c0 	ret
    2fc4:	d503201f 	nop
    2fc8:	d503201f 	nop
    2fcc:	d503201f 	nop

0000000000002fd0 <coalesce>:

static void* coalesce(void* ptr)
{
    2fd0:	aa0003e7 	mov	x7, x0
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    2fd4:	b85f8000 	ldur	w0, [x0, #-8]
    2fd8:	927d7000 	and	x0, x0, #0xfffffff8
    2fdc:	cb0000e0 	sub	x0, x7, x0
    2fe0:	b85fc0e2 	ldur	w2, [x7, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    2fe4:	927d7045 	and	x5, x2, #0xfffffff8
    2fe8:	121d7044 	and	w4, w2, #0xfffffff8
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    2fec:	b85fc000 	ldur	w0, [x0, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    2ff0:	8b0500e3 	add	x3, x7, x5
    2ff4:	b85fc062 	ldur	w2, [x3, #-4]
    size_t size = GET_SIZE(HDRP(ptr));

    // Do not coalesce with previous block if the previous block is tagged with Reallocation tag
    if (GET_TAG(HDRP(PREV_BLKP(ptr))))
    2ff8:	37080600 	tbnz	w0, #1, 30b8 <coalesce+0xe8>
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    2ffc:	92400003 	and	x3, x0, #0x1
        prev_alloc = 1;

    if (prev_alloc && next_alloc) { // Case 1
    3000:	72000041 	ands	w1, w2, #0x1
    3004:	12000000 	and	w0, w0, #0x1
    3008:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    300c:	54000601 	b.ne	30cc <coalesce+0xfc>  // b.any
{
    3010:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        return ptr;
    } else if (prev_alloc && !next_alloc) { // Case 2
    3014:	6a22001f 	bics	wzr, w0, w2
{
    3018:	910003fd 	mov	x29, sp
    } else if (prev_alloc && !next_alloc) { // Case 2
    301c:	540005c1 	b.ne	30d4 <coalesce+0x104>  // b.any
        delete_node(ptr);
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(ptr), PACK(size, 0));
        PUT(FTRP(ptr), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) { // Case 3
    3020:	52000063 	eor	w3, w3, #0x1
        delete_node(ptr);
    3024:	aa0703e0 	mov	x0, x7
    } else if (!prev_alloc && next_alloc) { // Case 3
    3028:	6a03003f 	tst	w1, w3
    302c:	540008a0 	b.eq	3140 <coalesce+0x170>  // b.none
        delete_node(ptr);
    3030:	97ffffc4 	bl	2f40 <delete_node>
        delete_node(PREV_BLKP(ptr));
    3034:	b85f80e0 	ldur	w0, [x7, #-8]
    3038:	927d7000 	and	x0, x0, #0xfffffff8
    303c:	cb0000e0 	sub	x0, x7, x0
    3040:	97ffffc0 	bl	2f40 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
        PUT(FTRP(ptr), PACK(size, 0));
    3044:	297f00e1 	ldp	w1, w0, [x7, #-8]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3048:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    304c:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    3050:	927d7000 	and	x0, x0, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3054:	cb010061 	sub	x1, x3, x1
        PUT(FTRP(ptr), PACK(size, 0));
    3058:	d1002000 	sub	x0, x0, #0x8
    305c:	b86168e1 	ldr	w1, [x7, x1]
    3060:	b86068e6 	ldr	w6, [x7, x0]
    3064:	121d7022 	and	w2, w1, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3068:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    306c:	0b020084 	add	w4, w4, w2
    3070:	121f00c6 	and	w6, w6, #0x2
    3074:	2a0400c6 	orr	w6, w6, w4
    3078:	b82068e6 	str	w6, [x7, x0]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    307c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3080:	b85f80e0 	ldur	w0, [x7, #-8]
    3084:	927d7000 	and	x0, x0, #0xfffffff8
    3088:	cb000060 	sub	x0, x3, x0
    308c:	b86068e2 	ldr	w2, [x7, x0]
    3090:	121f0042 	and	w2, w2, #0x2
        delete_node(ptr);
        delete_node(PREV_BLKP(ptr));
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    3094:	2a020082 	orr	w2, w4, w2
    3098:	b82068e2 	str	w2, [x7, x0]
        ptr = PREV_BLKP(ptr);
    309c:	b85f80e0 	ldur	w0, [x7, #-8]
    30a0:	927d7000 	and	x0, x0, #0xfffffff8
    30a4:	cb0000e7 	sub	x7, x7, x0
    }

    insert_node(ptr, size);
    30a8:	aa0703e0 	mov	x0, x7
    30ac:	97ffff79 	bl	2e90 <insert_node>

    return ptr;
}
    30b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    30b4:	d65f03c0 	ret
    if (prev_alloc && next_alloc) { // Case 1
    30b8:	72000041 	ands	w1, w2, #0x1
    30bc:	52800020 	mov	w0, #0x1                   	// #1
        prev_alloc = 1;
    30c0:	d2800023 	mov	x3, #0x1                   	// #1
    if (prev_alloc && next_alloc) { // Case 1
    30c4:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    30c8:	54fffa40 	b.eq	3010 <coalesce+0x40>  // b.none
}
    30cc:	aa0703e0 	mov	x0, x7
    30d0:	d65f03c0 	ret
        delete_node(ptr);
    30d4:	aa0703e0 	mov	x0, x7
    30d8:	97ffff9a 	bl	2f40 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    30dc:	b85fc0e0 	ldur	w0, [x7, #-4]
    30e0:	927d7000 	and	x0, x0, #0xfffffff8
    30e4:	8b0000e0 	add	x0, x7, x0
    30e8:	97ffff96 	bl	2f40 <delete_node>
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    30ec:	b85fc0e0 	ldur	w0, [x7, #-4]
    30f0:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    30f4:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    30f8:	8b0100e1 	add	x1, x7, x1
    30fc:	b85fc021 	ldur	w1, [x1, #-4]
    3100:	121d7022 	and	w2, w1, #0xfffffff8
    3104:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    3108:	0b020084 	add	w4, w4, w2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    310c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(ptr), PACK(size, 0));
    3110:	2a040000 	orr	w0, w0, w4
    3114:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(size, 0));
    3118:	927d7000 	and	x0, x0, #0xfffffff8
    311c:	d1002000 	sub	x0, x0, #0x8
    3120:	b86068e2 	ldr	w2, [x7, x0]
    3124:	121f0042 	and	w2, w2, #0x2
    3128:	2a040042 	orr	w2, w2, w4
    312c:	b82068e2 	str	w2, [x7, x0]
    insert_node(ptr, size);
    3130:	aa0703e0 	mov	x0, x7
    3134:	97ffff57 	bl	2e90 <insert_node>
}
    3138:	a8c17bfd 	ldp	x29, x30, [sp], #16
    313c:	d65f03c0 	ret
        delete_node(ptr);
    3140:	97ffff80 	bl	2f40 <delete_node>
        delete_node(PREV_BLKP(ptr));
    3144:	b85f80e0 	ldur	w0, [x7, #-8]
    3148:	927d7000 	and	x0, x0, #0xfffffff8
    314c:	cb0000e0 	sub	x0, x7, x0
    3150:	97ffff7c 	bl	2f40 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    3154:	b85fc0e0 	ldur	w0, [x7, #-4]
    3158:	927d7000 	and	x0, x0, #0xfffffff8
    315c:	8b0000e0 	add	x0, x7, x0
    3160:	97ffff78 	bl	2f40 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3164:	297f04e0 	ldp	w0, w1, [x7, #-8]
    3168:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    316c:	927d7000 	and	x0, x0, #0xfffffff8
    3170:	927d7021 	and	x1, x1, #0xfffffff8
    3174:	cb000063 	sub	x3, x3, x0
    3178:	8b0100e1 	add	x1, x7, x1
    317c:	b86368e0 	ldr	w0, [x7, x3]
    3180:	b85fc021 	ldur	w1, [x1, #-4]
    3184:	121d7002 	and	w2, w0, #0xfffffff8
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3188:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    318c:	121d7021 	and	w1, w1, #0xfffffff8
    3190:	0b020021 	add	w1, w1, w2
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3194:	0b040022 	add	w2, w1, w4
    3198:	2a020000 	orr	w0, w0, w2
    319c:	b82368e0 	str	w0, [x7, x3]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    31a0:	8b2140a1 	add	x1, x5, w1, uxtw
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    31a4:	b85fc0e0 	ldur	w0, [x7, #-4]
    31a8:	927d7000 	and	x0, x0, #0xfffffff8
    31ac:	8b0000e4 	add	x4, x7, x0
    31b0:	d1002003 	sub	x3, x0, #0x8
    31b4:	b85fc080 	ldur	w0, [x4, #-4]
    31b8:	927d7000 	and	x0, x0, #0xfffffff8
    31bc:	8b030000 	add	x0, x0, x3
    31c0:	b86068e4 	ldr	w4, [x7, x0]
    31c4:	121f0084 	and	w4, w4, #0x2
    31c8:	17ffffb3 	b	3094 <coalesce+0xc4>
    31cc:	d503201f 	nop

00000000000031d0 <mem_sbrk>:
{
    31d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    31d4:	910003fd 	mov	x29, sp
    31d8:	a90153f3 	stp	x19, x20, [sp, #16]
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    31dc:	d0000053 	adrp	x19, d000 <impure_data+0x680>
    31e0:	912c2273 	add	x19, x19, #0xb08
{
    31e4:	aa0003f4 	mov	x20, x0
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    31e8:	a94a0660 	ldp	x0, x1, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    31ec:	f9405a62 	ldr	x2, [x19, #176]
    31f0:	8b020021 	add	x1, x1, x2
    31f4:	cb010003 	sub	x3, x0, x1
    31f8:	eb03029f 	cmp	x20, x3
    31fc:	540001a9 	b.ls	3230 <mem_sbrk+0x60>  // b.plast
    uintptr_t size_needed = size - (userland_heap_size - requested_heap_size);
    3200:	cb000282 	sub	x2, x20, x0
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    3204:	52800003 	mov	w3, #0x0                   	// #0
    3208:	0b020022 	add	w2, w1, w2
    320c:	d2800001 	mov	x1, #0x0                   	// #0
    3210:	97fffed4 	bl	2d60 <mmap>
    3214:	93407c00 	sxtw	x0, w0
    if (userland_heap_size - requested_heap_size >= size) {
    3218:	a94a8a61 	ldp	x1, x2, [x19, #168]
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    321c:	f9005260 	str	x0, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    3220:	8b020021 	add	x1, x1, x2
    3224:	cb010003 	sub	x3, x0, x1
    3228:	eb14007f 	cmp	x3, x20
    322c:	54fffea3 	b.cc	3200 <mem_sbrk+0x30>  // b.lo, b.ul, b.last
        requested_heap_size += size;
    3230:	8b020294 	add	x20, x20, x2
}
    3234:	aa0103e0 	mov	x0, x1
        requested_heap_size += size;
    3238:	f9005a74 	str	x20, [x19, #176]
}
    323c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3240:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3244:	d65f03c0 	ret
    3248:	d503201f 	nop
    324c:	d503201f 	nop

0000000000003250 <mm_init>:
    return ptr;
}

static bool malloc_inited = false;
int mm_init(void)
{
    3250:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3254:	910003fd 	mov	x29, sp
    3258:	f9000bf3 	str	x19, [sp, #16]
    // init heap
    userland_heap_base = task_heap_base();
    325c:	d0000053 	adrp	x19, d000 <impure_data+0x680>
    3260:	912c2273 	add	x19, x19, #0xb08
    3264:	97fffe9f 	bl	2ce0 <task_heap_base>
    3268:	aa1303e1 	mov	x1, x19
    326c:	91028262 	add	x2, x19, #0xa0
    3270:	93407c00 	sxtw	x0, w0
    3274:	a90a0260 	stp	x0, x0, [x19, #160]
    userland_heap_top = userland_heap_base;
    requested_heap_size = 0;
    3278:	f9005a7f 	str	xzr, [x19, #176]

    int list;
    char* heap_start; // Pointer to beginning of heap

    // Initialize segregated free lists
    for (list = 0; list < LISTLIMIT; list++) {
    327c:	d503201f 	nop
        segregated_free_lists[list] = NULL;
    3280:	f800843f 	str	xzr, [x1], #8
    for (list = 0; list < LISTLIMIT; list++) {
    3284:	eb02003f 	cmp	x1, x2
    3288:	54ffffc1 	b.ne	3280 <mm_init+0x30>  // b.any
    }

    // Allocate memory for the initial empty heap
    if ((long)(heap_start = mem_sbrk(4 * WSIZE)) == -1)
    328c:	d2800200 	mov	x0, #0x10                  	// #16
    3290:	97ffffd0 	bl	31d0 <mem_sbrk>
    3294:	aa0003e1 	mov	x1, x0
    3298:	b100041f 	cmn	x0, #0x1
    329c:	54000300 	b.eq	32fc <mm_init+0xac>  // b.none
        return -1;

    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    PUT_NOTAG(heap_start + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    32a0:	d2800122 	mov	x2, #0x9                   	// #9
    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    32a4:	d2c00120 	mov	x0, #0x900000000           	// #38654705664
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    32a8:	f2c00022 	movk	x2, #0x1, lsl #32
    32ac:	a9000820 	stp	x0, x2, [x1]
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    32b0:	d2800800 	mov	x0, #0x40                  	// #64
    32b4:	97ffffc7 	bl	31d0 <mem_sbrk>
    32b8:	b100041f 	cmn	x0, #0x1
    32bc:	54000200 	b.eq	32fc <mm_init+0xac>  // b.none
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    32c0:	d2800803 	mov	x3, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    32c4:	52800804 	mov	w4, #0x40                  	// #64
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    32c8:	f2c00023 	movk	x3, #0x1, lsl #32
    insert_node(ptr, asize);
    32cc:	d2800801 	mov	x1, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    32d0:	b81fc004 	stur	w4, [x0, #-4]
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    32d4:	f9001c03 	str	x3, [x0, #56]
    insert_node(ptr, asize);
    32d8:	97fffeee 	bl	2e90 <insert_node>
    return coalesce(ptr);
    32dc:	97ffff3d 	bl	2fd0 <coalesce>
    PUT_NOTAG(heap_start + (3 * WSIZE), PACK(0, 1)); /* Epilogue header */

    if (extend_heap(INITCHUNKSIZE) == NULL)
    32e0:	b40000e0 	cbz	x0, 32fc <mm_init+0xac>
        return -1;

    malloc_inited = true;
    32e4:	52800021 	mov	w1, #0x1                   	// #1
    return 0;
    32e8:	52800000 	mov	w0, #0x0                   	// #0
    malloc_inited = true;
    32ec:	3902e261 	strb	w1, [x19, #184]
}
    32f0:	f9400bf3 	ldr	x19, [sp, #16]
    32f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    32f8:	d65f03c0 	ret
        return -1;
    32fc:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    3300:	f9400bf3 	ldr	x19, [sp, #16]
    3304:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3308:	d65f03c0 	ret
    330c:	d503201f 	nop

0000000000003310 <malloc>:

void* malloc(size_t size)
{
    3310:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3314:	910003fd 	mov	x29, sp
    3318:	a90153f3 	stp	x19, x20, [sp, #16]
    while (!malloc_inited) {
    331c:	d0000054 	adrp	x20, d000 <impure_data+0x680>
    3320:	912c2294 	add	x20, x20, #0xb08
{
    3324:	aa0003f3 	mov	x19, x0
    while (!malloc_inited) {
    3328:	3942e280 	ldrb	w0, [x20, #184]
    332c:	35000080 	cbnz	w0, 333c <malloc+0x2c>
        mm_init();
    3330:	97ffffc8 	bl	3250 <mm_init>
    while (!malloc_inited) {
    3334:	3942e281 	ldrb	w1, [x20, #184]
    3338:	34ffffc1 	cbz	w1, 3330 <malloc+0x20>
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    void* ptr = NULL; /* Pointer */

    // Ignore size 0 cases
    if (size == 0)
    333c:	b4000e73 	cbz	x19, 3508 <malloc+0x1f8>

    // Align block size
    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size + DSIZE);
    3340:	91003e60 	add	x0, x19, #0xf
    3344:	f100227f 	cmp	x19, #0x8
    3348:	927df013 	and	x19, x0, #0xfffffffffffffff8
    334c:	d2800200 	mov	x0, #0x10                  	// #16
    3350:	9a808273 	csel	x19, x19, x0, hi  // hi = pmore
        asize = 2 * DSIZE;
    3354:	d2800002 	mov	x2, #0x0                   	// #0
    3358:	aa1303e3 	mov	x3, x19
    335c:	14000005 	b	3370 <malloc+0x60>
    }

    int list = 0;
    size_t searchsize = asize;
    // Search for free block in segregated list
    while (list < LISTLIMIT) {
    3360:	91000442 	add	x2, x2, #0x1
            }
            if (ptr != NULL)
                break;
        }

        searchsize >>= 1;
    3364:	d341fc63 	lsr	x3, x3, #1
    while (list < LISTLIMIT) {
    3368:	f100505f 	cmp	x2, #0x14
    336c:	54000720 	b.eq	3450 <malloc+0x140>  // b.none
        if ((list == LISTLIMIT - 1) || ((searchsize <= 1) && (segregated_free_lists[list] != NULL))) {
    3370:	f1004c5f 	cmp	x2, #0x13
    3374:	540006a0 	b.eq	3448 <malloc+0x138>  // b.none
    3378:	f100047f 	cmp	x3, #0x1
    337c:	54ffff28 	b.hi	3360 <malloc+0x50>  // b.pmore
    3380:	f8627a87 	ldr	x7, [x20, x2, lsl #3]
    3384:	b4fffee7 	cbz	x7, 3360 <malloc+0x50>
    3388:	14000003 	b	3394 <malloc+0x84>
                ptr = PRED(ptr);
    338c:	f94000e7 	ldr	x7, [x7]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    3390:	b4fffe87 	cbz	x7, 3360 <malloc+0x50>
    3394:	b85fc0e0 	ldur	w0, [x7, #-4]
    3398:	927d7001 	and	x1, x0, #0xfffffff8
    339c:	121d7005 	and	w5, w0, #0xfffffff8
    33a0:	eb13003f 	cmp	x1, x19
    33a4:	54ffff43 	b.cc	338c <malloc+0x7c>  // b.lo, b.ul, b.last
    33a8:	370fff20 	tbnz	w0, #1, 338c <malloc+0x7c>
    size_t remainder = ptr_size - asize;
    33ac:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    33b0:	aa0703e0 	mov	x0, x7
    33b4:	97fffee3 	bl	2f40 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    33b8:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    33bc:	f100409f 	cmp	x4, #0x10
    33c0:	54000849 	b.ls	34c8 <malloc+0x1b8>  // b.plast
    else if (asize >= 100) {
    33c4:	f1018e7f 	cmp	x19, #0x63
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    33c8:	121f0000 	and	w0, w0, #0x2
    else if (asize >= 100) {
    33cc:	54000a88 	b.hi	351c <malloc+0x20c>  // b.pmore
        PUT(HDRP(ptr), PACK(asize, 1));
    33d0:	2a130000 	orr	w0, w0, w19
        insert_node(NEXT_BLKP(ptr), remainder);
    33d4:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(asize, 1));
    33d8:	927d7002 	and	x2, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(asize, 1));
    33dc:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(asize, 1));
    33e0:	d1002042 	sub	x2, x2, #0x8
        PUT(HDRP(ptr), PACK(asize, 1));
    33e4:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(asize, 1));
    33e8:	b86268e0 	ldr	w0, [x7, x2]
    33ec:	121f0000 	and	w0, w0, #0x2
    33f0:	2a130000 	orr	w0, w0, w19
    33f4:	32000000 	orr	w0, w0, #0x1
    33f8:	b82268e0 	str	w0, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    33fc:	b85fc0e0 	ldur	w0, [x7, #-4]
    3400:	927d7000 	and	x0, x0, #0xfffffff8
    3404:	8b0000e0 	add	x0, x7, x0
    3408:	b81fc004 	stur	w4, [x0, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    340c:	b85fc0e0 	ldur	w0, [x7, #-4]
    3410:	927d7000 	and	x0, x0, #0xfffffff8
    3414:	8b0000e0 	add	x0, x7, x0
    3418:	b85fc002 	ldur	w2, [x0, #-4]
    341c:	927d7042 	and	x2, x2, #0xfffffff8
    3420:	8b020000 	add	x0, x0, x2
    3424:	b81f8004 	stur	w4, [x0, #-8]
        insert_node(NEXT_BLKP(ptr), remainder);
    3428:	b85fc0e0 	ldur	w0, [x7, #-4]
    342c:	927d7000 	and	x0, x0, #0xfffffff8
    3430:	8b0000e0 	add	x0, x7, x0
    3434:	97fffe97 	bl	2e90 <insert_node>
    // Place and divide block
    ptr = place(ptr, asize);

    // Return pointer to newly allocated block
    return ptr;
}
    3438:	aa0703e0 	mov	x0, x7
    343c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3440:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3444:	d65f03c0 	ret
            ptr = segregated_free_lists[list];
    3448:	f9404e87 	ldr	x7, [x20, #152]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    344c:	b5fffa47 	cbnz	x7, 3394 <malloc+0x84>
        extendsize = MAX(asize, CHUNKSIZE);
    3450:	f140067f 	cmp	x19, #0x1, lsl #12
    3454:	d2820000 	mov	x0, #0x1000                	// #4096
    3458:	9a802260 	csel	x0, x19, x0, cs  // cs = hs, nlast
    345c:	f90013f5 	str	x21, [sp, #32]
    asize = ALIGN(size);
    3460:	91001c14 	add	x20, x0, #0x7
    3464:	aa0003f5 	mov	x21, x0
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    3468:	97ffff5a 	bl	31d0 <mem_sbrk>
    346c:	aa0003e3 	mov	x3, x0
    3470:	b100041f 	cmn	x0, #0x1
    3474:	54000480 	b.eq	3504 <malloc+0x1f4>  // b.none
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3478:	927d7282 	and	x2, x20, #0xfffffff8
    insert_node(ptr, asize);
    347c:	aa1503e1 	mov	x1, x21
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3480:	8b020062 	add	x2, x3, x2
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3484:	b81fc075 	stur	w21, [x3, #-4]
    PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));
    3488:	52800023 	mov	w3, #0x1                   	// #1
    348c:	293f0c55 	stp	w21, w3, [x2, #-8]
    insert_node(ptr, asize);
    3490:	97fffe80 	bl	2e90 <insert_node>
    return coalesce(ptr);
    3494:	97fffecf 	bl	2fd0 <coalesce>
    3498:	aa0003e7 	mov	x7, x0
        if ((ptr = extend_heap(extendsize)) == NULL)
    349c:	b4000340 	cbz	x0, 3504 <malloc+0x1f4>
    34a0:	b85fc001 	ldur	w1, [x0, #-4]
    delete_node(ptr);
    34a4:	aa0703e0 	mov	x0, x7
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    34a8:	f94013f5 	ldr	x21, [sp, #32]
    size_t remainder = ptr_size - asize;
    34ac:	121d7025 	and	w5, w1, #0xfffffff8
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    34b0:	927d7021 	and	x1, x1, #0xfffffff8
    size_t remainder = ptr_size - asize;
    34b4:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    34b8:	97fffea2 	bl	2f40 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    34bc:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    34c0:	f100409f 	cmp	x4, #0x10
    34c4:	54fff808 	b.hi	33c4 <malloc+0xb4>  // b.pmore
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    34c8:	121f0000 	and	w0, w0, #0x2
    34cc:	2a050000 	orr	w0, w0, w5
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    34d0:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    34d4:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    34d8:	d1002021 	sub	x1, x1, #0x8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    34dc:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    34e0:	b86168e0 	ldr	w0, [x7, x1]
    34e4:	121f0000 	and	w0, w0, #0x2
    34e8:	2a050000 	orr	w0, w0, w5
    34ec:	32000000 	orr	w0, w0, #0x1
    34f0:	b82168e0 	str	w0, [x7, x1]
}
    34f4:	aa0703e0 	mov	x0, x7
    34f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    34fc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3500:	d65f03c0 	ret
    3504:	f94013f5 	ldr	x21, [sp, #32]
        return NULL;
    3508:	d2800007 	mov	x7, #0x0                   	// #0
}
    350c:	aa0703e0 	mov	x0, x7
    3510:	a94153f3 	ldp	x19, x20, [sp, #16]
    3514:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3518:	d65f03c0 	ret
        PUT(HDRP(ptr), PACK(remainder, 0));
    351c:	2a040000 	orr	w0, w0, w4
    3520:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(remainder, 0));
    3524:	927d7000 	and	x0, x0, #0xfffffff8
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3528:	32000273 	orr	w19, w19, #0x1
        PUT(FTRP(ptr), PACK(remainder, 0));
    352c:	d1002002 	sub	x2, x0, #0x8
        insert_node(ptr, remainder);
    3530:	aa0703e0 	mov	x0, x7
    3534:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(remainder, 0));
    3538:	b86268e3 	ldr	w3, [x7, x2]
    353c:	121f0063 	and	w3, w3, #0x2
    3540:	2a040063 	orr	w3, w3, w4
    3544:	b82268e3 	str	w3, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3548:	b85fc0e2 	ldur	w2, [x7, #-4]
    354c:	927d7042 	and	x2, x2, #0xfffffff8
    3550:	8b0200e2 	add	x2, x7, x2
    3554:	b81fc053 	stur	w19, [x2, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3558:	b85fc0e2 	ldur	w2, [x7, #-4]
    355c:	927d7042 	and	x2, x2, #0xfffffff8
    3560:	8b0200e2 	add	x2, x7, x2
    3564:	b85fc043 	ldur	w3, [x2, #-4]
    3568:	927d7063 	and	x3, x3, #0xfffffff8
    356c:	8b030042 	add	x2, x2, x3
    3570:	b81f8053 	stur	w19, [x2, #-8]
        insert_node(ptr, remainder);
    3574:	97fffe47 	bl	2e90 <insert_node>
        return NEXT_BLKP(ptr);
    3578:	b85fc0e0 	ldur	w0, [x7, #-4]
}
    357c:	a94153f3 	ldp	x19, x20, [sp, #16]
        return NEXT_BLKP(ptr);
    3580:	927d7000 	and	x0, x0, #0xfffffff8
    3584:	8b0000e7 	add	x7, x7, x0
}
    3588:	aa0703e0 	mov	x0, x7
    358c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3590:	d65f03c0 	ret
    3594:	d503201f 	nop
    3598:	d503201f 	nop
    359c:	d503201f 	nop

00000000000035a0 <free>:

void free(void* ptr)
{
    35a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    35a4:	910003fd 	mov	x29, sp
    35a8:	b85fc004 	ldur	w4, [x0, #-4]
    size_t size = GET_SIZE(HDRP(ptr));
    35ac:	927d7081 	and	x1, x4, #0xfffffff8

    REMOVE_RATAG(HDRP(NEXT_BLKP(ptr)));
    35b0:	121d7085 	and	w5, w4, #0xfffffff8
    35b4:	d1001024 	sub	x4, x1, #0x4
    35b8:	b8646802 	ldr	w2, [x0, x4]
    35bc:	121e7842 	and	w2, w2, #0xfffffffd
    35c0:	b8246802 	str	w2, [x0, x4]
    PUT(HDRP(ptr), PACK(size, 0));
    35c4:	b85fc002 	ldur	w2, [x0, #-4]
    35c8:	121f0042 	and	w2, w2, #0x2
    35cc:	2a050042 	orr	w2, w2, w5
    35d0:	b81fc002 	stur	w2, [x0, #-4]
    PUT(FTRP(ptr), PACK(size, 0));
    35d4:	927d7042 	and	x2, x2, #0xfffffff8
    35d8:	d1002042 	sub	x2, x2, #0x8
    35dc:	b8626804 	ldr	w4, [x0, x2]
    35e0:	121f0084 	and	w4, w4, #0x2
    35e4:	2a050084 	orr	w4, w4, w5
    35e8:	b8226804 	str	w4, [x0, x2]

    insert_node(ptr, size);
    35ec:	97fffe29 	bl	2e90 <insert_node>
    coalesce(ptr);

    return;
}
    35f0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    coalesce(ptr);
    35f4:	17fffe77 	b	2fd0 <coalesce>
    35f8:	d503201f 	nop
    35fc:	d503201f 	nop

0000000000003600 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    3600:	14000000 	b	3600 <_exit>
    3604:	d503201f 	nop
    3608:	d503201f 	nop
    360c:	d503201f 	nop

0000000000003610 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    3610:	d0000043 	adrp	x3, d000 <impure_data+0x680>
    3614:	f945e461 	ldr	x1, [x3, #3016]
    3618:	d0000042 	adrp	x2, d000 <impure_data+0x680>
    361c:	913b4042 	add	x2, x2, #0xed0
    3620:	f100003f 	cmp	x1, #0x0
    3624:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    3628:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    362c:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    3630:	f905e462 	str	x2, [x3, #3016]
}
    3634:	d65f03c0 	ret
    3638:	d503201f 	nop
    363c:	d503201f 	nop

0000000000003640 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    3640:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    3644:	d65f03c0 	ret
    3648:	d503201f 	nop
    364c:	d503201f 	nop

0000000000003650 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    3650:	12800000 	mov	w0, #0xffffffff            	// #-1
    3654:	d65f03c0 	ret
    3658:	d503201f 	nop
    365c:	d503201f 	nop

0000000000003660 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    3660:	52800000 	mov	w0, #0x0                   	// #0
    3664:	d65f03c0 	ret
    3668:	d503201f 	nop
    366c:	d503201f 	nop

0000000000003670 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    3670:	52800020 	mov	w0, #0x1                   	// #1
    3674:	d65f03c0 	ret
    3678:	d503201f 	nop
    367c:	d503201f 	nop

0000000000003680 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    3680:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    3684:	d65f03c0 	ret
    3688:	d503201f 	nop
    368c:	d503201f 	nop

0000000000003690 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    3690:	d2800000 	mov	x0, #0x0                   	// #0
    3694:	d65f03c0 	ret
    3698:	d503201f 	nop
    369c:	d503201f 	nop

00000000000036a0 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    36a0:	12800000 	mov	w0, #0xffffffff            	// #-1
    36a4:	d65f03c0 	ret
    36a8:	d503201f 	nop
    36ac:	d503201f 	nop

00000000000036b0 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    36b0:	52800020 	mov	w0, #0x1                   	// #1
    36b4:	d65f03c0 	ret
    36b8:	d503201f 	nop
    36bc:	d503201f 	nop

00000000000036c0 <__assert_func>:
    36c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    36c4:	b0000044 	adrp	x4, c000 <JIS_state_table+0x10>
    36c8:	aa0003e7 	mov	x7, x0
    36cc:	910003fd 	mov	x29, sp
    36d0:	f944bc85 	ldr	x5, [x4, #2424]
    36d4:	aa0203e6 	mov	x6, x2
    36d8:	2a0103e4 	mov	w4, w1
    36dc:	aa0303e2 	mov	x2, x3
    36e0:	f9400ca0 	ldr	x0, [x5, #24]
    36e4:	b4000106 	cbz	x6, 3704 <__assert_func+0x44>
    36e8:	90000045 	adrp	x5, b000 <_findenv_r+0x10>
    36ec:	912920a5 	add	x5, x5, #0xa48
    36f0:	aa0703e3 	mov	x3, x7
    36f4:	90000041 	adrp	x1, b000 <_findenv_r+0x10>
    36f8:	91296021 	add	x1, x1, #0xa58
    36fc:	94000049 	bl	3820 <fiprintf>
    3700:	940009a4 	bl	5d90 <abort>
    3704:	90000045 	adrp	x5, b000 <_findenv_r+0x10>
    3708:	9124a0a5 	add	x5, x5, #0x928
    370c:	aa0503e6 	mov	x6, x5
    3710:	17fffff8 	b	36f0 <__assert_func+0x30>
    3714:	d503201f 	nop
    3718:	d503201f 	nop
    371c:	d503201f 	nop

0000000000003720 <__assert>:
    3720:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3724:	aa0203e3 	mov	x3, x2
    3728:	d2800002 	mov	x2, #0x0                   	// #0
    372c:	910003fd 	mov	x29, sp
    3730:	97ffffe4 	bl	36c0 <__assert_func>
    3734:	d503201f 	nop
    3738:	d503201f 	nop
    373c:	d503201f 	nop

0000000000003740 <atexit>:
    3740:	aa0003e1 	mov	x1, x0
    3744:	d2800003 	mov	x3, #0x0                   	// #0
    3748:	d2800002 	mov	x2, #0x0                   	// #0
    374c:	52800000 	mov	w0, #0x0                   	// #0
    3750:	14000998 	b	5db0 <__register_exitproc>
    3754:	d503201f 	nop
    3758:	d503201f 	nop
    375c:	d503201f 	nop

0000000000003760 <__libc_fini_array>:
    3760:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3764:	90000041 	adrp	x1, b000 <_findenv_r+0x10>
    3768:	90000040 	adrp	x0, b000 <_findenv_r+0x10>
    376c:	910003fd 	mov	x29, sp
    3770:	a90153f3 	stp	x19, x20, [sp, #16]
    3774:	f9454433 	ldr	x19, [x1, #2696]
    3778:	f9454814 	ldr	x20, [x0, #2704]
    377c:	cb140273 	sub	x19, x19, x20
    3780:	9343fe73 	asr	x19, x19, #3
    3784:	b40000b3 	cbz	x19, 3798 <__libc_fini_array+0x38>
    3788:	d1000673 	sub	x19, x19, #0x1
    378c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    3790:	d63f0000 	blr	x0
    3794:	b5ffffb3 	cbnz	x19, 3788 <__libc_fini_array+0x28>
    3798:	a94153f3 	ldp	x19, x20, [sp, #16]
    379c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    37a0:	14001f85 	b	b5b4 <_fini>
    37a4:	d503201f 	nop
    37a8:	d503201f 	nop
    37ac:	d503201f 	nop

00000000000037b0 <_fiprintf_r>:
    37b0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    37b4:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    37b8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    37bc:	910003fd 	mov	x29, sp
    37c0:	910343ea 	add	x10, sp, #0xd0
    37c4:	910403eb 	add	x11, sp, #0x100
    37c8:	a9032feb 	stp	x11, x11, [sp, #48]
    37cc:	f90023ea 	str	x10, [sp, #64]
    37d0:	290923e9 	stp	w9, w8, [sp, #72]
    37d4:	a9432fea 	ldp	x10, x11, [sp, #48]
    37d8:	a9012fea 	stp	x10, x11, [sp, #16]
    37dc:	a94427e8 	ldp	x8, x9, [sp, #64]
    37e0:	a90227e8 	stp	x8, x9, [sp, #32]
    37e4:	3d8017e0 	str	q0, [sp, #80]
    37e8:	3d801be1 	str	q1, [sp, #96]
    37ec:	3d801fe2 	str	q2, [sp, #112]
    37f0:	3d8023e3 	str	q3, [sp, #128]
    37f4:	3d8027e4 	str	q4, [sp, #144]
    37f8:	3d802be5 	str	q5, [sp, #160]
    37fc:	3d802fe6 	str	q6, [sp, #176]
    3800:	3d8033e7 	str	q7, [sp, #192]
    3804:	a90d93e3 	stp	x3, x4, [sp, #216]
    3808:	910043e3 	add	x3, sp, #0x10
    380c:	a90e9be5 	stp	x5, x6, [sp, #232]
    3810:	f9007fe7 	str	x7, [sp, #248]
    3814:	94000193 	bl	3e60 <_vfiprintf_r>
    3818:	a8d07bfd 	ldp	x29, x30, [sp], #256
    381c:	d65f03c0 	ret

0000000000003820 <fiprintf>:
    3820:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    3824:	b0000048 	adrp	x8, c000 <JIS_state_table+0x10>
    3828:	aa0003eb 	mov	x11, x0
    382c:	910003fd 	mov	x29, sp
    3830:	910343ec 	add	x12, sp, #0xd0
    3834:	910403ea 	add	x10, sp, #0x100
    3838:	f944bd00 	ldr	x0, [x8, #2424]
    383c:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    3840:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    3844:	a9032bea 	stp	x10, x10, [sp, #48]
    3848:	aa0103ea 	mov	x10, x1
    384c:	f90023ec 	str	x12, [sp, #64]
    3850:	aa0b03e1 	mov	x1, x11
    3854:	290923e9 	stp	w9, w8, [sp, #72]
    3858:	a94337ec 	ldp	x12, x13, [sp, #48]
    385c:	a90137ec 	stp	x12, x13, [sp, #16]
    3860:	a94427e8 	ldp	x8, x9, [sp, #64]
    3864:	a90227e8 	stp	x8, x9, [sp, #32]
    3868:	3d8017e0 	str	q0, [sp, #80]
    386c:	3d801be1 	str	q1, [sp, #96]
    3870:	3d801fe2 	str	q2, [sp, #112]
    3874:	3d8023e3 	str	q3, [sp, #128]
    3878:	3d8027e4 	str	q4, [sp, #144]
    387c:	3d802be5 	str	q5, [sp, #160]
    3880:	3d802fe6 	str	q6, [sp, #176]
    3884:	3d8033e7 	str	q7, [sp, #192]
    3888:	a90d0fe2 	stp	x2, x3, [sp, #208]
    388c:	910043e3 	add	x3, sp, #0x10
    3890:	aa0a03e2 	mov	x2, x10
    3894:	a90e17e4 	stp	x4, x5, [sp, #224]
    3898:	a90f1fe6 	stp	x6, x7, [sp, #240]
    389c:	94000171 	bl	3e60 <_vfiprintf_r>
    38a0:	a8d07bfd 	ldp	x29, x30, [sp], #256
    38a4:	d65f03c0 	ret
    38a8:	d503201f 	nop
    38ac:	d503201f 	nop

00000000000038b0 <__libc_init_array>:
    38b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    38b4:	90000041 	adrp	x1, b000 <_findenv_r+0x10>
    38b8:	90000040 	adrp	x0, b000 <_findenv_r+0x10>
    38bc:	910003fd 	mov	x29, sp
    38c0:	a90153f3 	stp	x19, x20, [sp, #16]
    38c4:	f9455034 	ldr	x20, [x1, #2720]
    38c8:	f90013f5 	str	x21, [sp, #32]
    38cc:	f9455415 	ldr	x21, [x0, #2728]
    38d0:	cb150294 	sub	x20, x20, x21
    38d4:	9343fe94 	asr	x20, x20, #3
    38d8:	b40000f4 	cbz	x20, 38f4 <__libc_init_array+0x44>
    38dc:	d2800013 	mov	x19, #0x0                   	// #0
    38e0:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    38e4:	91000673 	add	x19, x19, #0x1
    38e8:	d63f0000 	blr	x0
    38ec:	eb13029f 	cmp	x20, x19
    38f0:	54ffff81 	b.ne	38e0 <__libc_init_array+0x30>  // b.any
    38f4:	940ff1c3 	bl	400000 <_init>
    38f8:	90000041 	adrp	x1, b000 <_findenv_r+0x10>
    38fc:	90000040 	adrp	x0, b000 <_findenv_r+0x10>
    3900:	f9455834 	ldr	x20, [x1, #2736]
    3904:	f9455c15 	ldr	x21, [x0, #2744]
    3908:	cb150294 	sub	x20, x20, x21
    390c:	9343fe94 	asr	x20, x20, #3
    3910:	b40000f4 	cbz	x20, 392c <__libc_init_array+0x7c>
    3914:	d2800013 	mov	x19, #0x0                   	// #0
    3918:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    391c:	91000673 	add	x19, x19, #0x1
    3920:	d63f0000 	blr	x0
    3924:	eb13029f 	cmp	x20, x19
    3928:	54ffff81 	b.ne	3918 <__libc_init_array+0x68>  // b.any
    392c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3930:	f94013f5 	ldr	x21, [sp, #32]
    3934:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3938:	d65f03c0 	ret
    393c:	d503201f 	nop

0000000000003940 <memcpy>:
    3940:	f9800020 	prfm	pldl1keep, [x1]
    3944:	8b020024 	add	x4, x1, x2
    3948:	8b020005 	add	x5, x0, x2
    394c:	f100405f 	cmp	x2, #0x10
    3950:	54000209 	b.ls	3990 <memcpy+0x50>  // b.plast
    3954:	f101805f 	cmp	x2, #0x60
    3958:	54000648 	b.hi	3a20 <memcpy+0xe0>  // b.pmore
    395c:	d1000449 	sub	x9, x2, #0x1
    3960:	a9401c26 	ldp	x6, x7, [x1]
    3964:	37300469 	tbnz	w9, #6, 39f0 <memcpy+0xb0>
    3968:	a97f348c 	ldp	x12, x13, [x4, #-16]
    396c:	362800a9 	tbz	w9, #5, 3980 <memcpy+0x40>
    3970:	a9412428 	ldp	x8, x9, [x1, #16]
    3974:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    3978:	a9012408 	stp	x8, x9, [x0, #16]
    397c:	a93e2caa 	stp	x10, x11, [x5, #-32]
    3980:	a9001c06 	stp	x6, x7, [x0]
    3984:	a93f34ac 	stp	x12, x13, [x5, #-16]
    3988:	d65f03c0 	ret
    398c:	d503201f 	nop
    3990:	f100205f 	cmp	x2, #0x8
    3994:	540000e3 	b.cc	39b0 <memcpy+0x70>  // b.lo, b.ul, b.last
    3998:	f9400026 	ldr	x6, [x1]
    399c:	f85f8087 	ldur	x7, [x4, #-8]
    39a0:	f9000006 	str	x6, [x0]
    39a4:	f81f80a7 	stur	x7, [x5, #-8]
    39a8:	d65f03c0 	ret
    39ac:	d503201f 	nop
    39b0:	361000c2 	tbz	w2, #2, 39c8 <memcpy+0x88>
    39b4:	b9400026 	ldr	w6, [x1]
    39b8:	b85fc087 	ldur	w7, [x4, #-4]
    39bc:	b9000006 	str	w6, [x0]
    39c0:	b81fc0a7 	stur	w7, [x5, #-4]
    39c4:	d65f03c0 	ret
    39c8:	b4000102 	cbz	x2, 39e8 <memcpy+0xa8>
    39cc:	d341fc49 	lsr	x9, x2, #1
    39d0:	39400026 	ldrb	w6, [x1]
    39d4:	385ff087 	ldurb	w7, [x4, #-1]
    39d8:	38696828 	ldrb	w8, [x1, x9]
    39dc:	39000006 	strb	w6, [x0]
    39e0:	38296808 	strb	w8, [x0, x9]
    39e4:	381ff0a7 	sturb	w7, [x5, #-1]
    39e8:	d65f03c0 	ret
    39ec:	d503201f 	nop
    39f0:	a9412428 	ldp	x8, x9, [x1, #16]
    39f4:	a9422c2a 	ldp	x10, x11, [x1, #32]
    39f8:	a943342c 	ldp	x12, x13, [x1, #48]
    39fc:	a97e0881 	ldp	x1, x2, [x4, #-32]
    3a00:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    3a04:	a9001c06 	stp	x6, x7, [x0]
    3a08:	a9012408 	stp	x8, x9, [x0, #16]
    3a0c:	a9022c0a 	stp	x10, x11, [x0, #32]
    3a10:	a903340c 	stp	x12, x13, [x0, #48]
    3a14:	a93e08a1 	stp	x1, x2, [x5, #-32]
    3a18:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    3a1c:	d65f03c0 	ret
    3a20:	92400c09 	and	x9, x0, #0xf
    3a24:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3a28:	a940342c 	ldp	x12, x13, [x1]
    3a2c:	cb090021 	sub	x1, x1, x9
    3a30:	8b090042 	add	x2, x2, x9
    3a34:	a9411c26 	ldp	x6, x7, [x1, #16]
    3a38:	a900340c 	stp	x12, x13, [x0]
    3a3c:	a9422428 	ldp	x8, x9, [x1, #32]
    3a40:	a9432c2a 	ldp	x10, x11, [x1, #48]
    3a44:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    3a48:	f1024042 	subs	x2, x2, #0x90
    3a4c:	54000169 	b.ls	3a78 <memcpy+0x138>  // b.plast
    3a50:	a9011c66 	stp	x6, x7, [x3, #16]
    3a54:	a9411c26 	ldp	x6, x7, [x1, #16]
    3a58:	a9022468 	stp	x8, x9, [x3, #32]
    3a5c:	a9422428 	ldp	x8, x9, [x1, #32]
    3a60:	a9032c6a 	stp	x10, x11, [x3, #48]
    3a64:	a9432c2a 	ldp	x10, x11, [x1, #48]
    3a68:	a984346c 	stp	x12, x13, [x3, #64]!
    3a6c:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    3a70:	f1010042 	subs	x2, x2, #0x40
    3a74:	54fffee8 	b.hi	3a50 <memcpy+0x110>  // b.pmore
    3a78:	a97c0881 	ldp	x1, x2, [x4, #-64]
    3a7c:	a9011c66 	stp	x6, x7, [x3, #16]
    3a80:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    3a84:	a9022468 	stp	x8, x9, [x3, #32]
    3a88:	a97e2488 	ldp	x8, x9, [x4, #-32]
    3a8c:	a9032c6a 	stp	x10, x11, [x3, #48]
    3a90:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    3a94:	a904346c 	stp	x12, x13, [x3, #64]
    3a98:	a93c08a1 	stp	x1, x2, [x5, #-64]
    3a9c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    3aa0:	a93e24a8 	stp	x8, x9, [x5, #-32]
    3aa4:	a93f2caa 	stp	x10, x11, [x5, #-16]
    3aa8:	d65f03c0 	ret
    3aac:	d503201f 	nop
    3ab0:	d503201f 	nop
    3ab4:	d503201f 	nop
    3ab8:	d503201f 	nop
    3abc:	d503201f 	nop

0000000000003ac0 <memmove>:
    3ac0:	cb010005 	sub	x5, x0, x1
    3ac4:	f101805f 	cmp	x2, #0x60
    3ac8:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    3acc:	54fff3a2 	b.cs	3940 <memcpy>  // b.hs, b.nlast
    3ad0:	b40004c5 	cbz	x5, 3b68 <memmove+0xa8>
    3ad4:	8b020004 	add	x4, x0, x2
    3ad8:	8b020023 	add	x3, x1, x2
    3adc:	92400c85 	and	x5, x4, #0xf
    3ae0:	a97f346c 	ldp	x12, x13, [x3, #-16]
    3ae4:	cb050063 	sub	x3, x3, x5
    3ae8:	cb050042 	sub	x2, x2, x5
    3aec:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3af0:	a93f348c 	stp	x12, x13, [x4, #-16]
    3af4:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3af8:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3afc:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3b00:	cb050084 	sub	x4, x4, x5
    3b04:	f1020042 	subs	x2, x2, #0x80
    3b08:	54000189 	b.ls	3b38 <memmove+0x78>  // b.plast
    3b0c:	d503201f 	nop
    3b10:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3b14:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3b18:	a93e2488 	stp	x8, x9, [x4, #-32]
    3b1c:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3b20:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3b24:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3b28:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    3b2c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3b30:	f1010042 	subs	x2, x2, #0x40
    3b34:	54fffee8 	b.hi	3b10 <memmove+0x50>  // b.pmore
    3b38:	a9431422 	ldp	x2, x5, [x1, #48]
    3b3c:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3b40:	a9421c26 	ldp	x6, x7, [x1, #32]
    3b44:	a93e2488 	stp	x8, x9, [x4, #-32]
    3b48:	a9412428 	ldp	x8, x9, [x1, #16]
    3b4c:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3b50:	a9402c2a 	ldp	x10, x11, [x1]
    3b54:	a93c348c 	stp	x12, x13, [x4, #-64]
    3b58:	a9031402 	stp	x2, x5, [x0, #48]
    3b5c:	a9021c06 	stp	x6, x7, [x0, #32]
    3b60:	a9012408 	stp	x8, x9, [x0, #16]
    3b64:	a9002c0a 	stp	x10, x11, [x0]
    3b68:	d65f03c0 	ret
    3b6c:	d503201f 	nop
    3b70:	d503201f 	nop
    3b74:	d503201f 	nop
    3b78:	d503201f 	nop
    3b7c:	d503201f 	nop

0000000000003b80 <memset>:
    3b80:	4e010c20 	dup	v0.16b, w1
    3b84:	8b020004 	add	x4, x0, x2
    3b88:	f101805f 	cmp	x2, #0x60
    3b8c:	540003c8 	b.hi	3c04 <memset+0x84>  // b.pmore
    3b90:	f100405f 	cmp	x2, #0x10
    3b94:	54000202 	b.cs	3bd4 <memset+0x54>  // b.hs, b.nlast
    3b98:	4e083c01 	mov	x1, v0.d[0]
    3b9c:	361800a2 	tbz	w2, #3, 3bb0 <memset+0x30>
    3ba0:	f9000001 	str	x1, [x0]
    3ba4:	f81f8081 	stur	x1, [x4, #-8]
    3ba8:	d65f03c0 	ret
    3bac:	d503201f 	nop
    3bb0:	36100082 	tbz	w2, #2, 3bc0 <memset+0x40>
    3bb4:	b9000001 	str	w1, [x0]
    3bb8:	b81fc081 	stur	w1, [x4, #-4]
    3bbc:	d65f03c0 	ret
    3bc0:	b4000082 	cbz	x2, 3bd0 <memset+0x50>
    3bc4:	39000001 	strb	w1, [x0]
    3bc8:	36080042 	tbz	w2, #1, 3bd0 <memset+0x50>
    3bcc:	781fe081 	sturh	w1, [x4, #-2]
    3bd0:	d65f03c0 	ret
    3bd4:	3d800000 	str	q0, [x0]
    3bd8:	373000c2 	tbnz	w2, #6, 3bf0 <memset+0x70>
    3bdc:	3c9f0080 	stur	q0, [x4, #-16]
    3be0:	36280062 	tbz	w2, #5, 3bec <memset+0x6c>
    3be4:	3d800400 	str	q0, [x0, #16]
    3be8:	3c9e0080 	stur	q0, [x4, #-32]
    3bec:	d65f03c0 	ret
    3bf0:	3d800400 	str	q0, [x0, #16]
    3bf4:	ad010000 	stp	q0, q0, [x0, #32]
    3bf8:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3bfc:	d65f03c0 	ret
    3c00:	d503201f 	nop
    3c04:	12001c21 	and	w1, w1, #0xff
    3c08:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3c0c:	3d800000 	str	q0, [x0]
    3c10:	f104005f 	cmp	x2, #0x100
    3c14:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    3c18:	54000180 	b.eq	3c48 <memset+0xc8>  // b.none
    3c1c:	cb030082 	sub	x2, x4, x3
    3c20:	d1004063 	sub	x3, x3, #0x10
    3c24:	d1014042 	sub	x2, x2, #0x50
    3c28:	ad010060 	stp	q0, q0, [x3, #32]
    3c2c:	ad820060 	stp	q0, q0, [x3, #64]!
    3c30:	f1010042 	subs	x2, x2, #0x40
    3c34:	54ffffa8 	b.hi	3c28 <memset+0xa8>  // b.pmore
    3c38:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3c3c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3c40:	d65f03c0 	ret
    3c44:	d503201f 	nop
    3c48:	d53b00e5 	mrs	x5, dczid_el0
    3c4c:	3727fe85 	tbnz	w5, #4, 3c1c <memset+0x9c>
    3c50:	12000ca5 	and	w5, w5, #0xf
    3c54:	710010bf 	cmp	w5, #0x4
    3c58:	54000281 	b.ne	3ca8 <memset+0x128>  // b.any
    3c5c:	3d800460 	str	q0, [x3, #16]
    3c60:	ad010060 	stp	q0, q0, [x3, #32]
    3c64:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    3c68:	ad020060 	stp	q0, q0, [x3, #64]
    3c6c:	ad030060 	stp	q0, q0, [x3, #96]
    3c70:	cb030082 	sub	x2, x4, x3
    3c74:	d1040042 	sub	x2, x2, #0x100
    3c78:	91020063 	add	x3, x3, #0x80
    3c7c:	d503201f 	nop
    3c80:	d50b7423 	dc	zva, x3
    3c84:	91010063 	add	x3, x3, #0x40
    3c88:	f1010042 	subs	x2, x2, #0x40
    3c8c:	54ffffa8 	b.hi	3c80 <memset+0x100>  // b.pmore
    3c90:	ad000060 	stp	q0, q0, [x3]
    3c94:	ad010060 	stp	q0, q0, [x3, #32]
    3c98:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3c9c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3ca0:	d65f03c0 	ret
    3ca4:	d503201f 	nop
    3ca8:	710014bf 	cmp	w5, #0x5
    3cac:	54000241 	b.ne	3cf4 <memset+0x174>  // b.any
    3cb0:	3d800460 	str	q0, [x3, #16]
    3cb4:	ad010060 	stp	q0, q0, [x3, #32]
    3cb8:	ad020060 	stp	q0, q0, [x3, #64]
    3cbc:	ad030060 	stp	q0, q0, [x3, #96]
    3cc0:	9279e063 	and	x3, x3, #0xffffffffffffff80
    3cc4:	cb030082 	sub	x2, x4, x3
    3cc8:	d1040042 	sub	x2, x2, #0x100
    3ccc:	91020063 	add	x3, x3, #0x80
    3cd0:	d50b7423 	dc	zva, x3
    3cd4:	91020063 	add	x3, x3, #0x80
    3cd8:	f1020042 	subs	x2, x2, #0x80
    3cdc:	54ffffa8 	b.hi	3cd0 <memset+0x150>  // b.pmore
    3ce0:	ad3c0080 	stp	q0, q0, [x4, #-128]
    3ce4:	ad3d0080 	stp	q0, q0, [x4, #-96]
    3ce8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3cec:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3cf0:	d65f03c0 	ret
    3cf4:	52800086 	mov	w6, #0x4                   	// #4
    3cf8:	1ac520c7 	lsl	w7, w6, w5
    3cfc:	910100e5 	add	x5, x7, #0x40
    3d00:	eb05005f 	cmp	x2, x5
    3d04:	54fff8c3 	b.cc	3c1c <memset+0x9c>  // b.lo, b.ul, b.last
    3d08:	d10004e6 	sub	x6, x7, #0x1
    3d0c:	8b070065 	add	x5, x3, x7
    3d10:	91004063 	add	x3, x3, #0x10
    3d14:	eb0300a2 	subs	x2, x5, x3
    3d18:	8a2600a5 	bic	x5, x5, x6
    3d1c:	540000a0 	b.eq	3d30 <memset+0x1b0>  // b.none
    3d20:	ac820060 	stp	q0, q0, [x3], #64
    3d24:	ad3f0060 	stp	q0, q0, [x3, #-32]
    3d28:	f1010042 	subs	x2, x2, #0x40
    3d2c:	54ffffa8 	b.hi	3d20 <memset+0x1a0>  // b.pmore
    3d30:	aa0503e3 	mov	x3, x5
    3d34:	cb050082 	sub	x2, x4, x5
    3d38:	eb070042 	subs	x2, x2, x7
    3d3c:	540000a3 	b.cc	3d50 <memset+0x1d0>  // b.lo, b.ul, b.last
    3d40:	d50b7423 	dc	zva, x3
    3d44:	8b070063 	add	x3, x3, x7
    3d48:	eb070042 	subs	x2, x2, x7
    3d4c:	54ffffa2 	b.cs	3d40 <memset+0x1c0>  // b.hs, b.nlast
    3d50:	8b070042 	add	x2, x2, x7
    3d54:	d1008063 	sub	x3, x3, #0x20
    3d58:	17ffffb6 	b	3c30 <memset+0xb0>
    3d5c:	d503201f 	nop

0000000000003d60 <__sprint_r.part.0>:
    3d60:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    3d64:	910003fd 	mov	x29, sp
    3d68:	b940ac23 	ldr	w3, [x1, #172]
    3d6c:	a90363f7 	stp	x23, x24, [sp, #48]
    3d70:	aa0203f8 	mov	x24, x2
    3d74:	36680563 	tbz	w3, #13, 3e20 <__sprint_r.part.0+0xc0>
    3d78:	a9025bf5 	stp	x21, x22, [sp, #32]
    3d7c:	aa0003f5 	mov	x21, x0
    3d80:	f9400840 	ldr	x0, [x2, #16]
    3d84:	a90153f3 	stp	x19, x20, [sp, #16]
    3d88:	aa0103f4 	mov	x20, x1
    3d8c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3d90:	f940005a 	ldr	x26, [x2]
    3d94:	b40003c0 	cbz	x0, 3e0c <__sprint_r.part.0+0xac>
    3d98:	a9406756 	ldp	x22, x25, [x26]
    3d9c:	d342ff39 	lsr	x25, x25, #2
    3da0:	2a1903f7 	mov	w23, w25
    3da4:	7100033f 	cmp	w25, #0x0
    3da8:	540002ad 	b.le	3dfc <__sprint_r.part.0+0x9c>
    3dac:	d2800013 	mov	x19, #0x0                   	// #0
    3db0:	14000003 	b	3dbc <__sprint_r.part.0+0x5c>
    3db4:	6b1302ff 	cmp	w23, w19
    3db8:	5400020d 	b.le	3df8 <__sprint_r.part.0+0x98>
    3dbc:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    3dc0:	aa1403e2 	mov	x2, x20
    3dc4:	aa1503e0 	mov	x0, x21
    3dc8:	91000673 	add	x19, x19, #0x1
    3dcc:	94000a15 	bl	6620 <_fputwc_r>
    3dd0:	3100041f 	cmn	w0, #0x1
    3dd4:	54ffff01 	b.ne	3db4 <__sprint_r.part.0+0x54>  // b.any
    3dd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3ddc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3de0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3de4:	b9000b1f 	str	wzr, [x24, #8]
    3de8:	f9000b1f 	str	xzr, [x24, #16]
    3dec:	a94363f7 	ldp	x23, x24, [sp, #48]
    3df0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3df4:	d65f03c0 	ret
    3df8:	f9400b00 	ldr	x0, [x24, #16]
    3dfc:	cb39c800 	sub	x0, x0, w25, sxtw #2
    3e00:	f9000b00 	str	x0, [x24, #16]
    3e04:	9100435a 	add	x26, x26, #0x10
    3e08:	b5fffc80 	cbnz	x0, 3d98 <__sprint_r.part.0+0x38>
    3e0c:	52800000 	mov	w0, #0x0                   	// #0
    3e10:	a94153f3 	ldp	x19, x20, [sp, #16]
    3e14:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3e18:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3e1c:	17fffff2 	b	3de4 <__sprint_r.part.0+0x84>
    3e20:	94000b2c 	bl	6ad0 <__sfvwrite_r>
    3e24:	b9000b1f 	str	wzr, [x24, #8]
    3e28:	f9000b1f 	str	xzr, [x24, #16]
    3e2c:	a94363f7 	ldp	x23, x24, [sp, #48]
    3e30:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3e34:	d65f03c0 	ret
    3e38:	d503201f 	nop
    3e3c:	d503201f 	nop

0000000000003e40 <__sprint_r>:
    3e40:	f9400844 	ldr	x4, [x2, #16]
    3e44:	b4000044 	cbz	x4, 3e4c <__sprint_r+0xc>
    3e48:	17ffffc6 	b	3d60 <__sprint_r.part.0>
    3e4c:	52800000 	mov	w0, #0x0                   	// #0
    3e50:	b900085f 	str	wzr, [x2, #8]
    3e54:	d65f03c0 	ret
    3e58:	d503201f 	nop
    3e5c:	d503201f 	nop

0000000000003e60 <_vfiprintf_r>:
    3e60:	d10843ff 	sub	sp, sp, #0x210
    3e64:	a9007bfd 	stp	x29, x30, [sp]
    3e68:	910003fd 	mov	x29, sp
    3e6c:	a9025bf5 	stp	x21, x22, [sp, #32]
    3e70:	aa0303f5 	mov	x21, x3
    3e74:	f9400063 	ldr	x3, [x3]
    3e78:	f90037e3 	str	x3, [sp, #104]
    3e7c:	f94006a3 	ldr	x3, [x21, #8]
    3e80:	f90043e3 	str	x3, [sp, #128]
    3e84:	b9401aa3 	ldr	w3, [x21, #24]
    3e88:	a90153f3 	stp	x19, x20, [sp, #16]
    3e8c:	aa0003f3 	mov	x19, x0
    3e90:	aa0203f4 	mov	x20, x2
    3e94:	9103e3e0 	add	x0, sp, #0xf8
    3e98:	d2800102 	mov	x2, #0x8                   	// #8
    3e9c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3ea0:	aa0103f9 	mov	x25, x1
    3ea4:	52800001 	mov	w1, #0x0                   	// #0
    3ea8:	b900b3e3 	str	w3, [sp, #176]
    3eac:	97ffff35 	bl	3b80 <memset>
    3eb0:	b4000073 	cbz	x19, 3ebc <_vfiprintf_r+0x5c>
    3eb4:	b9405260 	ldr	w0, [x19, #80]
    3eb8:	34002020 	cbz	w0, 42bc <_vfiprintf_r+0x45c>
    3ebc:	79c02321 	ldrsh	w1, [x25, #16]
    3ec0:	12003c20 	and	w0, w1, #0xffff
    3ec4:	376800e1 	tbnz	w1, #13, 3ee0 <_vfiprintf_r+0x80>
    3ec8:	b940af22 	ldr	w2, [x25, #172]
    3ecc:	32130021 	orr	w1, w1, #0x2000
    3ed0:	12003c20 	and	w0, w1, #0xffff
    3ed4:	79002321 	strh	w1, [x25, #16]
    3ed8:	12127841 	and	w1, w2, #0xffffdfff
    3edc:	b900af21 	str	w1, [x25, #172]
    3ee0:	36180520 	tbz	w0, #3, 3f84 <_vfiprintf_r+0x124>
    3ee4:	f9400f21 	ldr	x1, [x25, #24]
    3ee8:	b40004e1 	cbz	x1, 3f84 <_vfiprintf_r+0x124>
    3eec:	52800341 	mov	w1, #0x1a                  	// #26
    3ef0:	0a010000 	and	w0, w0, w1
    3ef4:	7100281f 	cmp	w0, #0xa
    3ef8:	54000580 	b.eq	3fa8 <_vfiprintf_r+0x148>  // b.none
    3efc:	a90573fb 	stp	x27, x28, [sp, #80]
    3f00:	910643fc 	add	x28, sp, #0x190
    3f04:	d0000055 	adrp	x21, d000 <impure_data+0x680>
    3f08:	aa1c03fb 	mov	x27, x28
    3f0c:	9103a2b5 	add	x21, x21, #0xe8
    3f10:	90000040 	adrp	x0, b000 <_findenv_r+0x10>
    3f14:	912be000 	add	x0, x0, #0xaf8
    3f18:	a90363f7 	stp	x23, x24, [sp, #48]
    3f1c:	b90067ff 	str	wzr, [sp, #100]
    3f20:	f9003fe0 	str	x0, [sp, #120]
    3f24:	f90047ff 	str	xzr, [sp, #136]
    3f28:	a909ffff 	stp	xzr, xzr, [sp, #152]
    3f2c:	f90057ff 	str	xzr, [sp, #168]
    3f30:	f9008bfc 	str	x28, [sp, #272]
    3f34:	b9011bff 	str	wzr, [sp, #280]
    3f38:	f90093ff 	str	xzr, [sp, #288]
    3f3c:	aa1403f7 	mov	x23, x20
    3f40:	f94076b6 	ldr	x22, [x21, #232]
    3f44:	94000fa7 	bl	7de0 <__locale_mb_cur_max>
    3f48:	9103e3e4 	add	x4, sp, #0xf8
    3f4c:	93407c03 	sxtw	x3, w0
    3f50:	aa1703e2 	mov	x2, x23
    3f54:	9103d3e1 	add	x1, sp, #0xf4
    3f58:	aa1303e0 	mov	x0, x19
    3f5c:	d63f02c0 	blr	x22
    3f60:	7100001f 	cmp	w0, #0x0
    3f64:	340004a0 	cbz	w0, 3ff8 <_vfiprintf_r+0x198>
    3f68:	540003ab 	b.lt	3fdc <_vfiprintf_r+0x17c>  // b.tstop
    3f6c:	b940f7e1 	ldr	w1, [sp, #244]
    3f70:	7100943f 	cmp	w1, #0x25
    3f74:	54001720 	b.eq	4258 <_vfiprintf_r+0x3f8>  // b.none
    3f78:	93407c00 	sxtw	x0, w0
    3f7c:	8b0002f7 	add	x23, x23, x0
    3f80:	17fffff0 	b	3f40 <_vfiprintf_r+0xe0>
    3f84:	aa1903e1 	mov	x1, x25
    3f88:	aa1303e0 	mov	x0, x19
    3f8c:	9400072d 	bl	5c40 <__swsetup_r>
    3f90:	3500b220 	cbnz	w0, 55d4 <_vfiprintf_r+0x1774>
    3f94:	79402320 	ldrh	w0, [x25, #16]
    3f98:	52800341 	mov	w1, #0x1a                  	// #26
    3f9c:	0a010000 	and	w0, w0, w1
    3fa0:	7100281f 	cmp	w0, #0xa
    3fa4:	54fffac1 	b.ne	3efc <_vfiprintf_r+0x9c>  // b.any
    3fa8:	79c02720 	ldrsh	w0, [x25, #18]
    3fac:	37fffa80 	tbnz	w0, #31, 3efc <_vfiprintf_r+0x9c>
    3fb0:	a9401ea6 	ldp	x6, x7, [x21]
    3fb4:	aa1403e2 	mov	x2, x20
    3fb8:	a94116a4 	ldp	x4, x5, [x21, #16]
    3fbc:	aa1903e1 	mov	x1, x25
    3fc0:	aa1303e0 	mov	x0, x19
    3fc4:	910303e3 	add	x3, sp, #0xc0
    3fc8:	a90c1fe6 	stp	x6, x7, [sp, #192]
    3fcc:	a90d17e4 	stp	x4, x5, [sp, #208]
    3fd0:	9400068c 	bl	5a00 <__sbprintf>
    3fd4:	b90067e0 	str	w0, [sp, #100]
    3fd8:	140000b2 	b	42a0 <_vfiprintf_r+0x440>
    3fdc:	9103e3e0 	add	x0, sp, #0xf8
    3fe0:	d2800102 	mov	x2, #0x8                   	// #8
    3fe4:	52800001 	mov	w1, #0x0                   	// #0
    3fe8:	97fffee6 	bl	3b80 <memset>
    3fec:	d2800020 	mov	x0, #0x1                   	// #1
    3ff0:	8b0002f7 	add	x23, x23, x0
    3ff4:	17ffffd3 	b	3f40 <_vfiprintf_r+0xe0>
    3ff8:	2a0003f6 	mov	w22, w0
    3ffc:	cb1402e0 	sub	x0, x23, x20
    4000:	2a0003f8 	mov	w24, w0
    4004:	34008d60 	cbz	w0, 51b0 <_vfiprintf_r+0x1350>
    4008:	f94093e2 	ldr	x2, [sp, #288]
    400c:	93407f01 	sxtw	x1, w24
    4010:	b9411be0 	ldr	w0, [sp, #280]
    4014:	8b020022 	add	x2, x1, x2
    4018:	a9000774 	stp	x20, x1, [x27]
    401c:	11000400 	add	w0, w0, #0x1
    4020:	b9011be0 	str	w0, [sp, #280]
    4024:	f90093e2 	str	x2, [sp, #288]
    4028:	71001c1f 	cmp	w0, #0x7
    402c:	5400120d 	b.le	426c <_vfiprintf_r+0x40c>
    4030:	b4006222 	cbz	x2, 4c74 <_vfiprintf_r+0xe14>
    4034:	910443e2 	add	x2, sp, #0x110
    4038:	aa1903e1 	mov	x1, x25
    403c:	aa1303e0 	mov	x0, x19
    4040:	97ffff48 	bl	3d60 <__sprint_r.part.0>
    4044:	35001260 	cbnz	w0, 4290 <_vfiprintf_r+0x430>
    4048:	910643fb 	add	x27, sp, #0x190
    404c:	b94067e0 	ldr	w0, [sp, #100]
    4050:	0b180000 	add	w0, w0, w24
    4054:	b90067e0 	str	w0, [sp, #100]
    4058:	34008ad6 	cbz	w22, 51b0 <_vfiprintf_r+0x1350>
    405c:	394006e0 	ldrb	w0, [x23, #1]
    4060:	12800004 	mov	w4, #0xffffffff            	// #-1
    4064:	910006f4 	add	x20, x23, #0x1
    4068:	2a0403f6 	mov	w22, w4
    406c:	5280001c 	mov	w28, #0x0                   	// #0
    4070:	b90063ff 	str	wzr, [sp, #96]
    4074:	3903bfff 	strb	wzr, [sp, #239]
    4078:	91000694 	add	x20, x20, #0x1
    407c:	51008001 	sub	w1, w0, #0x20
    4080:	7101683f 	cmp	w1, #0x5a
    4084:	54000c49 	b.ls	420c <_vfiprintf_r+0x3ac>  // b.plast
    4088:	34008940 	cbz	w0, 51b0 <_vfiprintf_r+0x1350>
    408c:	52800036 	mov	w22, #0x1                   	// #1
    4090:	9104a3fa 	add	x26, sp, #0x128
    4094:	2a1603f7 	mov	w23, w22
    4098:	3903bfff 	strb	wzr, [sp, #239]
    409c:	3904a3e0 	strb	w0, [sp, #296]
    40a0:	52800004 	mov	w4, #0x0                   	// #0
    40a4:	f9003bff 	str	xzr, [sp, #112]
    40a8:	b9411be1 	ldr	w1, [sp, #280]
    40ac:	11000ac0 	add	w0, w22, #0x2
    40b0:	721f038a 	ands	w10, w28, #0x2
    40b4:	52801098 	mov	w24, #0x84                  	// #132
    40b8:	11000422 	add	w2, w1, #0x1
    40bc:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    40c0:	2a0203e8 	mov	w8, w2
    40c4:	6a180398 	ands	w24, w28, w24
    40c8:	f94093e0 	ldr	x0, [sp, #288]
    40cc:	540000a1 	b.ne	40e0 <_vfiprintf_r+0x280>  // b.any
    40d0:	b94063e3 	ldr	w3, [sp, #96]
    40d4:	4b160069 	sub	w9, w3, w22
    40d8:	7100013f 	cmp	w9, #0x0
    40dc:	5400496c 	b.gt	4a08 <_vfiprintf_r+0xba8>
    40e0:	3943bfe2 	ldrb	w2, [sp, #239]
    40e4:	340001a2 	cbz	w2, 4118 <_vfiprintf_r+0x2b8>
    40e8:	9103bfe1 	add	x1, sp, #0xef
    40ec:	91000400 	add	x0, x0, #0x1
    40f0:	f9000361 	str	x1, [x27]
    40f4:	d2800021 	mov	x1, #0x1                   	// #1
    40f8:	f9000761 	str	x1, [x27, #8]
    40fc:	b9011be8 	str	w8, [sp, #280]
    4100:	f90093e0 	str	x0, [sp, #288]
    4104:	71001d1f 	cmp	w8, #0x7
    4108:	540044cc 	b.gt	49a0 <_vfiprintf_r+0xb40>
    410c:	2a0803e1 	mov	w1, w8
    4110:	9100437b 	add	x27, x27, #0x10
    4114:	11000508 	add	w8, w8, #0x1
    4118:	340002ca 	cbz	w10, 4170 <_vfiprintf_r+0x310>
    411c:	91000800 	add	x0, x0, #0x2
    4120:	9103c3e2 	add	x2, sp, #0xf0
    4124:	d2800041 	mov	x1, #0x2                   	// #2
    4128:	a9000762 	stp	x2, x1, [x27]
    412c:	b9011be8 	str	w8, [sp, #280]
    4130:	f90093e0 	str	x0, [sp, #288]
    4134:	71001d1f 	cmp	w8, #0x7
    4138:	5400460d 	b.le	49f8 <_vfiprintf_r+0xb98>
    413c:	b4005b20 	cbz	x0, 4ca0 <_vfiprintf_r+0xe40>
    4140:	910443e2 	add	x2, sp, #0x110
    4144:	aa1903e1 	mov	x1, x25
    4148:	aa1303e0 	mov	x0, x19
    414c:	b90093e4 	str	w4, [sp, #144]
    4150:	97ffff04 	bl	3d60 <__sprint_r.part.0>
    4154:	35000940 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4158:	b9411be1 	ldr	w1, [sp, #280]
    415c:	910643fb 	add	x27, sp, #0x190
    4160:	b94093e4 	ldr	w4, [sp, #144]
    4164:	f94093e0 	ldr	x0, [sp, #288]
    4168:	11000428 	add	w8, w1, #0x1
    416c:	d503201f 	nop
    4170:	7102031f 	cmp	w24, #0x80
    4174:	54002f80 	b.eq	4764 <_vfiprintf_r+0x904>  // b.none
    4178:	4b170098 	sub	w24, w4, w23
    417c:	7100031f 	cmp	w24, #0x0
    4180:	540038cc 	b.gt	4898 <_vfiprintf_r+0xa38>
    4184:	93407ef7 	sxtw	x23, w23
    4188:	a9005f7a 	stp	x26, x23, [x27]
    418c:	8b0002e0 	add	x0, x23, x0
    4190:	b9011be8 	str	w8, [sp, #280]
    4194:	f90093e0 	str	x0, [sp, #288]
    4198:	71001d1f 	cmp	w8, #0x7
    419c:	540029ad 	b.le	46d0 <_vfiprintf_r+0x870>
    41a0:	b4004ba0 	cbz	x0, 4b14 <_vfiprintf_r+0xcb4>
    41a4:	910443e2 	add	x2, sp, #0x110
    41a8:	aa1903e1 	mov	x1, x25
    41ac:	aa1303e0 	mov	x0, x19
    41b0:	97fffeec 	bl	3d60 <__sprint_r.part.0>
    41b4:	35000640 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    41b8:	f94093e0 	ldr	x0, [sp, #288]
    41bc:	910643e5 	add	x5, sp, #0x190
    41c0:	361000bc 	tbz	w28, #2, 41d4 <_vfiprintf_r+0x374>
    41c4:	b94063e1 	ldr	w1, [sp, #96]
    41c8:	4b160037 	sub	w23, w1, w22
    41cc:	710002ff 	cmp	w23, #0x0
    41d0:	54004b0c 	b.gt	4b30 <_vfiprintf_r+0xcd0>
    41d4:	b94063e1 	ldr	w1, [sp, #96]
    41d8:	6b16003f 	cmp	w1, w22
    41dc:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    41e0:	b94067e1 	ldr	w1, [sp, #100]
    41e4:	0b030021 	add	w1, w1, w3
    41e8:	b90067e1 	str	w1, [sp, #100]
    41ec:	b5003c60 	cbnz	x0, 4978 <_vfiprintf_r+0xb18>
    41f0:	f9403be1 	ldr	x1, [sp, #112]
    41f4:	b9011bff 	str	wzr, [sp, #280]
    41f8:	910643fb 	add	x27, sp, #0x190
    41fc:	b4ffea01 	cbz	x1, 3f3c <_vfiprintf_r+0xdc>
    4200:	aa1303e0 	mov	x0, x19
    4204:	94000977 	bl	67e0 <_free_r>
    4208:	17ffff4d 	b	3f3c <_vfiprintf_r+0xdc>
    420c:	f9403fe2 	ldr	x2, [sp, #120]
    4210:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    4214:	10000062 	adr	x2, 4220 <_vfiprintf_r+0x3c0>
    4218:	8b21a841 	add	x1, x2, w1, sxth #2
    421c:	d61f0020 	br	x1
    4220:	5100c001 	sub	w1, w0, #0x30
    4224:	b90063ff 	str	wzr, [sp, #96]
    4228:	b94063e0 	ldr	w0, [sp, #96]
    422c:	0b000802 	add	w2, w0, w0, lsl #2
    4230:	38401680 	ldrb	w0, [x20], #1
    4234:	0b020421 	add	w1, w1, w2, lsl #1
    4238:	b90063e1 	str	w1, [sp, #96]
    423c:	5100c001 	sub	w1, w0, #0x30
    4240:	7100243f 	cmp	w1, #0x9
    4244:	54ffff29 	b.ls	4228 <_vfiprintf_r+0x3c8>  // b.plast
    4248:	17ffff8d 	b	407c <_vfiprintf_r+0x21c>
    424c:	39400280 	ldrb	w0, [x20]
    4250:	321c039c 	orr	w28, w28, #0x10
    4254:	17ffff89 	b	4078 <_vfiprintf_r+0x218>
    4258:	2a0003f6 	mov	w22, w0
    425c:	cb1402e0 	sub	x0, x23, x20
    4260:	2a0003f8 	mov	w24, w0
    4264:	34ffefc0 	cbz	w0, 405c <_vfiprintf_r+0x1fc>
    4268:	17ffff68 	b	4008 <_vfiprintf_r+0x1a8>
    426c:	9100437b 	add	x27, x27, #0x10
    4270:	17ffff77 	b	404c <_vfiprintf_r+0x1ec>
    4274:	aa1903f3 	mov	x19, x25
    4278:	aa1403f9 	mov	x25, x20
    427c:	f9403be0 	ldr	x0, [sp, #112]
    4280:	b4000080 	cbz	x0, 4290 <_vfiprintf_r+0x430>
    4284:	f9403be1 	ldr	x1, [sp, #112]
    4288:	aa1303e0 	mov	x0, x19
    428c:	94000955 	bl	67e0 <_free_r>
    4290:	79c02320 	ldrsh	w0, [x25, #16]
    4294:	a94363f7 	ldp	x23, x24, [sp, #48]
    4298:	a94573fb 	ldp	x27, x28, [sp, #80]
    429c:	373099c0 	tbnz	w0, #6, 55d4 <_vfiprintf_r+0x1774>
    42a0:	b94067e0 	ldr	w0, [sp, #100]
    42a4:	a9407bfd 	ldp	x29, x30, [sp]
    42a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    42ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    42b0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    42b4:	910843ff 	add	sp, sp, #0x210
    42b8:	d65f03c0 	ret
    42bc:	aa1303e0 	mov	x0, x19
    42c0:	94000870 	bl	6480 <__sinit>
    42c4:	17fffefe 	b	3ebc <_vfiprintf_r+0x5c>
    42c8:	b940b3e1 	ldr	w1, [sp, #176]
    42cc:	2a1603e4 	mov	w4, w22
    42d0:	37f856c1 	tbnz	w1, #31, 4da8 <_vfiprintf_r+0xf48>
    42d4:	f94037e1 	ldr	x1, [sp, #104]
    42d8:	91003c38 	add	x24, x1, #0xf
    42dc:	927df318 	and	x24, x24, #0xfffffffffffffff8
    42e0:	f94037e1 	ldr	x1, [sp, #104]
    42e4:	3903bfff 	strb	wzr, [sp, #239]
    42e8:	f940003a 	ldr	x26, [x1]
    42ec:	b400753a 	cbz	x26, 5190 <_vfiprintf_r+0x1330>
    42f0:	71014c1f 	cmp	w0, #0x53
    42f4:	54006740 	b.eq	4fdc <_vfiprintf_r+0x117c>  // b.none
    42f8:	3720673c 	tbnz	w28, #4, 4fdc <_vfiprintf_r+0x117c>
    42fc:	3100049f 	cmn	w4, #0x1
    4300:	54009520 	b.eq	55a4 <_vfiprintf_r+0x1744>  // b.none
    4304:	93407c82 	sxtw	x2, w4
    4308:	aa1a03e0 	mov	x0, x26
    430c:	52800001 	mov	w1, #0x0                   	// #0
    4310:	b9006be4 	str	w4, [sp, #104]
    4314:	94001324 	bl	8fa4 <memchr>
    4318:	f9003be0 	str	x0, [sp, #112]
    431c:	b9406be4 	ldr	w4, [sp, #104]
    4320:	b40090a0 	cbz	x0, 5534 <_vfiprintf_r+0x16d4>
    4324:	cb1a0003 	sub	x3, x0, x26
    4328:	52800004 	mov	w4, #0x0                   	// #0
    432c:	7100007f 	cmp	w3, #0x0
    4330:	2a0303f7 	mov	w23, w3
    4334:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    4338:	a906fff8 	stp	x24, xzr, [sp, #104]
    433c:	14000060 	b	44bc <_vfiprintf_r+0x65c>
    4340:	71010c1f 	cmp	w0, #0x43
    4344:	54000040 	b.eq	434c <_vfiprintf_r+0x4ec>  // b.none
    4348:	3620569c 	tbz	w28, #4, 4e18 <_vfiprintf_r+0xfb8>
    434c:	910423e0 	add	x0, sp, #0x108
    4350:	d2800102 	mov	x2, #0x8                   	// #8
    4354:	52800001 	mov	w1, #0x0                   	// #0
    4358:	97fffe0a 	bl	3b80 <memset>
    435c:	b940b3e0 	ldr	w0, [sp, #176]
    4360:	37f87a20 	tbnz	w0, #31, 52a4 <_vfiprintf_r+0x1444>
    4364:	f94037e0 	ldr	x0, [sp, #104]
    4368:	91002c01 	add	x1, x0, #0xb
    436c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4370:	f90037e1 	str	x1, [sp, #104]
    4374:	b9400002 	ldr	w2, [x0]
    4378:	9104a3fa 	add	x26, sp, #0x128
    437c:	910423e3 	add	x3, sp, #0x108
    4380:	aa1a03e1 	mov	x1, x26
    4384:	aa1303e0 	mov	x0, x19
    4388:	940005d2 	bl	5ad0 <_wcrtomb_r>
    438c:	2a0003f7 	mov	w23, w0
    4390:	3100041f 	cmn	w0, #0x1
    4394:	54009260 	b.eq	55e0 <_vfiprintf_r+0x1780>  // b.none
    4398:	7100001f 	cmp	w0, #0x0
    439c:	3903bfff 	strb	wzr, [sp, #239]
    43a0:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    43a4:	17ffff3f 	b	40a0 <_vfiprintf_r+0x240>
    43a8:	b94063e1 	ldr	w1, [sp, #96]
    43ac:	f90037e0 	str	x0, [sp, #104]
    43b0:	4b0103e1 	neg	w1, w1
    43b4:	b90063e1 	str	w1, [sp, #96]
    43b8:	39400280 	ldrb	w0, [x20]
    43bc:	321e039c 	orr	w28, w28, #0x4
    43c0:	17ffff2e 	b	4078 <_vfiprintf_r+0x218>
    43c4:	aa1403e2 	mov	x2, x20
    43c8:	38401440 	ldrb	w0, [x2], #1
    43cc:	7100a81f 	cmp	w0, #0x2a
    43d0:	5400a6a0 	b.eq	58a4 <_vfiprintf_r+0x1a44>  // b.none
    43d4:	5100c001 	sub	w1, w0, #0x30
    43d8:	aa0203f4 	mov	x20, x2
    43dc:	52800016 	mov	w22, #0x0                   	// #0
    43e0:	7100243f 	cmp	w1, #0x9
    43e4:	54ffe4c8 	b.hi	407c <_vfiprintf_r+0x21c>  // b.pmore
    43e8:	38401680 	ldrb	w0, [x20], #1
    43ec:	0b160ac4 	add	w4, w22, w22, lsl #2
    43f0:	0b040436 	add	w22, w1, w4, lsl #1
    43f4:	5100c001 	sub	w1, w0, #0x30
    43f8:	7100243f 	cmp	w1, #0x9
    43fc:	54ffff69 	b.ls	43e8 <_vfiprintf_r+0x588>  // b.plast
    4400:	17ffff1f 	b	407c <_vfiprintf_r+0x21c>
    4404:	52800560 	mov	w0, #0x2b                  	// #43
    4408:	3903bfe0 	strb	w0, [sp, #239]
    440c:	39400280 	ldrb	w0, [x20]
    4410:	17ffff1a 	b	4078 <_vfiprintf_r+0x218>
    4414:	b940b3e0 	ldr	w0, [sp, #176]
    4418:	37f84da0 	tbnz	w0, #31, 4dcc <_vfiprintf_r+0xf6c>
    441c:	f94037e0 	ldr	x0, [sp, #104]
    4420:	91002c00 	add	x0, x0, #0xb
    4424:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4428:	f94037e1 	ldr	x1, [sp, #104]
    442c:	b9400021 	ldr	w1, [x1]
    4430:	b90063e1 	str	w1, [sp, #96]
    4434:	37fffba1 	tbnz	w1, #31, 43a8 <_vfiprintf_r+0x548>
    4438:	f90037e0 	str	x0, [sp, #104]
    443c:	39400280 	ldrb	w0, [x20]
    4440:	17ffff0e 	b	4078 <_vfiprintf_r+0x218>
    4444:	2a1603e4 	mov	w4, w22
    4448:	321c0396 	orr	w22, w28, #0x10
    444c:	b940b3e0 	ldr	w0, [sp, #176]
    4450:	37280056 	tbnz	w22, #5, 4458 <_vfiprintf_r+0x5f8>
    4454:	36204876 	tbz	w22, #4, 4d60 <_vfiprintf_r+0xf00>
    4458:	37f85a40 	tbnz	w0, #31, 4fa0 <_vfiprintf_r+0x1140>
    445c:	f94037e1 	ldr	x1, [sp, #104]
    4460:	91003c20 	add	x0, x1, #0xf
    4464:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4468:	f90037e0 	str	x0, [sp, #104]
    446c:	f9400021 	ldr	x1, [x1]
    4470:	52800020 	mov	w0, #0x1                   	// #1
    4474:	3903bfff 	strb	wzr, [sp, #239]
    4478:	3100049f 	cmn	w4, #0x1
    447c:	54001320 	b.eq	46e0 <_vfiprintf_r+0x880>  // b.none
    4480:	f100003f 	cmp	x1, #0x0
    4484:	12187adc 	and	w28, w22, #0xffffff7f
    4488:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    448c:	54001261 	b.ne	46d8 <_vfiprintf_r+0x878>  // b.any
    4490:	35000660 	cbnz	w0, 455c <_vfiprintf_r+0x6fc>
    4494:	120002d7 	and	w23, w22, #0x1
    4498:	36003f56 	tbz	w22, #0, 4c80 <_vfiprintf_r+0xe20>
    449c:	91062ffa 	add	x26, sp, #0x18b
    44a0:	52800600 	mov	w0, #0x30                  	// #48
    44a4:	52800004 	mov	w4, #0x0                   	// #0
    44a8:	39062fe0 	strb	w0, [sp, #395]
    44ac:	d503201f 	nop
    44b0:	6b17009f 	cmp	w4, w23
    44b4:	f9003bff 	str	xzr, [sp, #112]
    44b8:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    44bc:	3943bfe0 	ldrb	w0, [sp, #239]
    44c0:	7100001f 	cmp	w0, #0x0
    44c4:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    44c8:	17fffef8 	b	40a8 <_vfiprintf_r+0x248>
    44cc:	39400280 	ldrb	w0, [x20]
    44d0:	3219039c 	orr	w28, w28, #0x80
    44d4:	17fffee9 	b	4078 <_vfiprintf_r+0x218>
    44d8:	2a1603e4 	mov	w4, w22
    44dc:	321c039c 	orr	w28, w28, #0x10
    44e0:	b940b3e0 	ldr	w0, [sp, #176]
    44e4:	3728005c 	tbnz	w28, #5, 44ec <_vfiprintf_r+0x68c>
    44e8:	362042dc 	tbz	w28, #4, 4d40 <_vfiprintf_r+0xee0>
    44ec:	37f85460 	tbnz	w0, #31, 4f78 <_vfiprintf_r+0x1118>
    44f0:	f94037e0 	ldr	x0, [sp, #104]
    44f4:	91003c01 	add	x1, x0, #0xf
    44f8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    44fc:	f90037e1 	str	x1, [sp, #104]
    4500:	f9400001 	ldr	x1, [x0]
    4504:	12157b96 	and	w22, w28, #0xfffffbff
    4508:	52800000 	mov	w0, #0x0                   	// #0
    450c:	17ffffda 	b	4474 <_vfiprintf_r+0x614>
    4510:	2a1603e4 	mov	w4, w22
    4514:	321c039c 	orr	w28, w28, #0x10
    4518:	b940b3e0 	ldr	w0, [sp, #176]
    451c:	3728005c 	tbnz	w28, #5, 4524 <_vfiprintf_r+0x6c4>
    4520:	36203ffc 	tbz	w28, #4, 4d1c <_vfiprintf_r+0xebc>
    4524:	37f85160 	tbnz	w0, #31, 4f50 <_vfiprintf_r+0x10f0>
    4528:	f94037e0 	ldr	x0, [sp, #104]
    452c:	91003c01 	add	x1, x0, #0xf
    4530:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4534:	f90037e1 	str	x1, [sp, #104]
    4538:	f9400000 	ldr	x0, [x0]
    453c:	aa0003e1 	mov	x1, x0
    4540:	b7f83b80 	tbnz	x0, #63, 4cb0 <_vfiprintf_r+0xe50>
    4544:	3100049f 	cmn	w4, #0x1
    4548:	540036e0 	b.eq	4c24 <_vfiprintf_r+0xdc4>  // b.none
    454c:	7100009f 	cmp	w4, #0x0
    4550:	12187b9c 	and	w28, w28, #0xffffff7f
    4554:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    4558:	54003661 	b.ne	4c24 <_vfiprintf_r+0xdc4>  // b.any
    455c:	910633fa 	add	x26, sp, #0x18c
    4560:	52800004 	mov	w4, #0x0                   	// #0
    4564:	52800017 	mov	w23, #0x0                   	// #0
    4568:	17ffffd2 	b	44b0 <_vfiprintf_r+0x650>
    456c:	aa1303e0 	mov	x0, x19
    4570:	94000adc 	bl	70e0 <_localeconv_r>
    4574:	f9400400 	ldr	x0, [x0, #8]
    4578:	f90053e0 	str	x0, [sp, #160]
    457c:	94001711 	bl	a1c0 <strlen>
    4580:	aa0003e1 	mov	x1, x0
    4584:	aa0103f7 	mov	x23, x1
    4588:	aa1303e0 	mov	x0, x19
    458c:	f90057e1 	str	x1, [sp, #168]
    4590:	94000ad4 	bl	70e0 <_localeconv_r>
    4594:	f9400800 	ldr	x0, [x0, #16]
    4598:	f9004fe0 	str	x0, [sp, #152]
    459c:	f10002ff 	cmp	x23, #0x0
    45a0:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    45a4:	54003b80 	b.eq	4d14 <_vfiprintf_r+0xeb4>  // b.none
    45a8:	39400000 	ldrb	w0, [x0]
    45ac:	32160381 	orr	w1, w28, #0x400
    45b0:	7100001f 	cmp	w0, #0x0
    45b4:	39400280 	ldrb	w0, [x20]
    45b8:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    45bc:	17fffeaf 	b	4078 <_vfiprintf_r+0x218>
    45c0:	39400280 	ldrb	w0, [x20]
    45c4:	3200039c 	orr	w28, w28, #0x1
    45c8:	17fffeac 	b	4078 <_vfiprintf_r+0x218>
    45cc:	3943bfe1 	ldrb	w1, [sp, #239]
    45d0:	39400280 	ldrb	w0, [x20]
    45d4:	35ffd521 	cbnz	w1, 4078 <_vfiprintf_r+0x218>
    45d8:	52800401 	mov	w1, #0x20                  	// #32
    45dc:	3903bfe1 	strb	w1, [sp, #239]
    45e0:	17fffea6 	b	4078 <_vfiprintf_r+0x218>
    45e4:	b940b3e0 	ldr	w0, [sp, #176]
    45e8:	372801bc 	tbnz	w28, #5, 461c <_vfiprintf_r+0x7bc>
    45ec:	3720019c 	tbnz	w28, #4, 461c <_vfiprintf_r+0x7bc>
    45f0:	37306cfc 	tbnz	w28, #6, 538c <_vfiprintf_r+0x152c>
    45f4:	364889bc 	tbz	w28, #9, 5728 <_vfiprintf_r+0x18c8>
    45f8:	37f89040 	tbnz	w0, #31, 5800 <_vfiprintf_r+0x19a0>
    45fc:	f94037e0 	ldr	x0, [sp, #104]
    4600:	91003c01 	add	x1, x0, #0xf
    4604:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4608:	f90037e1 	str	x1, [sp, #104]
    460c:	f9400000 	ldr	x0, [x0]
    4610:	394193e1 	ldrb	w1, [sp, #100]
    4614:	39000001 	strb	w1, [x0]
    4618:	17fffe49 	b	3f3c <_vfiprintf_r+0xdc>
    461c:	37f84180 	tbnz	w0, #31, 4e4c <_vfiprintf_r+0xfec>
    4620:	f94037e0 	ldr	x0, [sp, #104]
    4624:	91003c01 	add	x1, x0, #0xf
    4628:	927df021 	and	x1, x1, #0xfffffffffffffff8
    462c:	f90037e1 	str	x1, [sp, #104]
    4630:	f9400000 	ldr	x0, [x0]
    4634:	b98067e1 	ldrsw	x1, [sp, #100]
    4638:	f9000001 	str	x1, [x0]
    463c:	17fffe40 	b	3f3c <_vfiprintf_r+0xdc>
    4640:	39400280 	ldrb	w0, [x20]
    4644:	7101b01f 	cmp	w0, #0x6c
    4648:	54005960 	b.eq	5174 <_vfiprintf_r+0x1314>  // b.none
    464c:	321c039c 	orr	w28, w28, #0x10
    4650:	17fffe8a 	b	4078 <_vfiprintf_r+0x218>
    4654:	39400280 	ldrb	w0, [x20]
    4658:	7101a01f 	cmp	w0, #0x68
    465c:	54005840 	b.eq	5164 <_vfiprintf_r+0x1304>  // b.none
    4660:	321a039c 	orr	w28, w28, #0x40
    4664:	17fffe85 	b	4078 <_vfiprintf_r+0x218>
    4668:	39400280 	ldrb	w0, [x20]
    466c:	321b039c 	orr	w28, w28, #0x20
    4670:	17fffe82 	b	4078 <_vfiprintf_r+0x218>
    4674:	b940b3e0 	ldr	w0, [sp, #176]
    4678:	2a1603e4 	mov	w4, w22
    467c:	37f83ba0 	tbnz	w0, #31, 4df0 <_vfiprintf_r+0xf90>
    4680:	f94037e2 	ldr	x2, [sp, #104]
    4684:	91003c40 	add	x0, x2, #0xf
    4688:	927df000 	and	x0, x0, #0xfffffffffffffff8
    468c:	f90037e0 	str	x0, [sp, #104]
    4690:	528f0600 	mov	w0, #0x7830                	// #30768
    4694:	f0000021 	adrp	x1, b000 <_findenv_r+0x10>
    4698:	912b0021 	add	x1, x1, #0xac0
    469c:	321f0396 	orr	w22, w28, #0x2
    46a0:	f90047e1 	str	x1, [sp, #136]
    46a4:	7901e3e0 	strh	w0, [sp, #240]
    46a8:	52800040 	mov	w0, #0x2                   	// #2
    46ac:	f9400041 	ldr	x1, [x2]
    46b0:	17ffff71 	b	4474 <_vfiprintf_r+0x614>
    46b4:	910643fb 	add	x27, sp, #0x190
    46b8:	93407ee0 	sxtw	x0, w23
    46bc:	52800021 	mov	w1, #0x1                   	// #1
    46c0:	b9011be1 	str	w1, [sp, #280]
    46c4:	f90093e0 	str	x0, [sp, #288]
    46c8:	a91903fa 	stp	x26, x0, [sp, #400]
    46cc:	d503201f 	nop
    46d0:	91004365 	add	x5, x27, #0x10
    46d4:	17fffebb 	b	41c0 <_vfiprintf_r+0x360>
    46d8:	2a1c03f6 	mov	w22, w28
    46dc:	d503201f 	nop
    46e0:	7100041f 	cmp	w0, #0x1
    46e4:	54002a20 	b.eq	4c28 <_vfiprintf_r+0xdc8>  // b.none
    46e8:	910633f7 	add	x23, sp, #0x18c
    46ec:	aa1703fa 	mov	x26, x23
    46f0:	7100081f 	cmp	w0, #0x2
    46f4:	54000161 	b.ne	4720 <_vfiprintf_r+0x8c0>  // b.any
    46f8:	f94047e2 	ldr	x2, [sp, #136]
    46fc:	d503201f 	nop
    4700:	92400c20 	and	x0, x1, #0xf
    4704:	d344fc21 	lsr	x1, x1, #4
    4708:	38606840 	ldrb	w0, [x2, x0]
    470c:	381fff40 	strb	w0, [x26, #-1]!
    4710:	b5ffff81 	cbnz	x1, 4700 <_vfiprintf_r+0x8a0>
    4714:	4b1a02f7 	sub	w23, w23, w26
    4718:	2a1603fc 	mov	w28, w22
    471c:	17ffff65 	b	44b0 <_vfiprintf_r+0x650>
    4720:	12000820 	and	w0, w1, #0x7
    4724:	aa1a03e2 	mov	x2, x26
    4728:	1100c000 	add	w0, w0, #0x30
    472c:	381fff40 	strb	w0, [x26, #-1]!
    4730:	d343fc21 	lsr	x1, x1, #3
    4734:	b5ffff61 	cbnz	x1, 4720 <_vfiprintf_r+0x8c0>
    4738:	7100c01f 	cmp	w0, #0x30
    473c:	1a9f07e0 	cset	w0, ne  // ne = any
    4740:	6a0002df 	tst	w22, w0
    4744:	54fffe80 	b.eq	4714 <_vfiprintf_r+0x8b4>  // b.none
    4748:	d1000842 	sub	x2, x2, #0x2
    474c:	52800600 	mov	w0, #0x30                  	// #48
    4750:	2a1603fc 	mov	w28, w22
    4754:	4b0202f7 	sub	w23, w23, w2
    4758:	381ff340 	sturb	w0, [x26, #-1]
    475c:	aa0203fa 	mov	x26, x2
    4760:	17ffff54 	b	44b0 <_vfiprintf_r+0x650>
    4764:	b94063e2 	ldr	w2, [sp, #96]
    4768:	4b160058 	sub	w24, w2, w22
    476c:	7100031f 	cmp	w24, #0x0
    4770:	54ffd04d 	b.le	4178 <_vfiprintf_r+0x318>
    4774:	7100431f 	cmp	w24, #0x10
    4778:	540073cd 	b.le	55f0 <_vfiprintf_r+0x1790>
    477c:	2a0103e3 	mov	w3, w1
    4780:	f0000029 	adrp	x9, b000 <_findenv_r+0x10>
    4784:	aa1403e1 	mov	x1, x20
    4788:	912f0129 	add	x9, x9, #0xbc0
    478c:	aa1303f4 	mov	x20, x19
    4790:	d2800208 	mov	x8, #0x10                  	// #16
    4794:	2a1803f3 	mov	w19, w24
    4798:	aa0103f8 	mov	x24, x1
    479c:	b90093e4 	str	w4, [sp, #144]
    47a0:	b900b7f6 	str	w22, [sp, #180]
    47a4:	aa1903f6 	mov	x22, x25
    47a8:	aa0903f9 	mov	x25, x9
    47ac:	14000007 	b	47c8 <_vfiprintf_r+0x968>
    47b0:	1100086a 	add	w10, w3, #0x2
    47b4:	9100437b 	add	x27, x27, #0x10
    47b8:	2a0203e3 	mov	w3, w2
    47bc:	51004273 	sub	w19, w19, #0x10
    47c0:	7100427f 	cmp	w19, #0x10
    47c4:	540002cd 	b.le	481c <_vfiprintf_r+0x9bc>
    47c8:	91004000 	add	x0, x0, #0x10
    47cc:	11000462 	add	w2, w3, #0x1
    47d0:	a9002379 	stp	x25, x8, [x27]
    47d4:	b9011be2 	str	w2, [sp, #280]
    47d8:	f90093e0 	str	x0, [sp, #288]
    47dc:	71001c5f 	cmp	w2, #0x7
    47e0:	54fffe8d 	b.le	47b0 <_vfiprintf_r+0x950>
    47e4:	b4000d60 	cbz	x0, 4990 <_vfiprintf_r+0xb30>
    47e8:	910443e2 	add	x2, sp, #0x110
    47ec:	aa1603e1 	mov	x1, x22
    47f0:	aa1403e0 	mov	x0, x20
    47f4:	97fffd5b 	bl	3d60 <__sprint_r.part.0>
    47f8:	35004c60 	cbnz	w0, 5184 <_vfiprintf_r+0x1324>
    47fc:	b9411be3 	ldr	w3, [sp, #280]
    4800:	51004273 	sub	w19, w19, #0x10
    4804:	910643fb 	add	x27, sp, #0x190
    4808:	d2800208 	mov	x8, #0x10                  	// #16
    480c:	1100046a 	add	w10, w3, #0x1
    4810:	f94093e0 	ldr	x0, [sp, #288]
    4814:	7100427f 	cmp	w19, #0x10
    4818:	54fffd8c 	b.gt	47c8 <_vfiprintf_r+0x968>
    481c:	aa1803e1 	mov	x1, x24
    4820:	aa1903e9 	mov	x9, x25
    4824:	b94093e4 	ldr	w4, [sp, #144]
    4828:	aa1603f9 	mov	x25, x22
    482c:	b940b7f6 	ldr	w22, [sp, #180]
    4830:	2a1303f8 	mov	w24, w19
    4834:	aa1403f3 	mov	x19, x20
    4838:	aa0103f4 	mov	x20, x1
    483c:	93407f01 	sxtw	x1, w24
    4840:	a9000769 	stp	x9, x1, [x27]
    4844:	8b010000 	add	x0, x0, x1
    4848:	b9011bea 	str	w10, [sp, #280]
    484c:	f90093e0 	str	x0, [sp, #288]
    4850:	71001d5f 	cmp	w10, #0x7
    4854:	5400258d 	b.le	4d04 <_vfiprintf_r+0xea4>
    4858:	b4005920 	cbz	x0, 537c <_vfiprintf_r+0x151c>
    485c:	910443e2 	add	x2, sp, #0x110
    4860:	aa1903e1 	mov	x1, x25
    4864:	aa1303e0 	mov	x0, x19
    4868:	b90093e4 	str	w4, [sp, #144]
    486c:	97fffd3d 	bl	3d60 <__sprint_r.part.0>
    4870:	35ffd060 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4874:	b94093e4 	ldr	w4, [sp, #144]
    4878:	910643fb 	add	x27, sp, #0x190
    487c:	b9411be1 	ldr	w1, [sp, #280]
    4880:	4b170098 	sub	w24, w4, w23
    4884:	11000428 	add	w8, w1, #0x1
    4888:	f94093e0 	ldr	x0, [sp, #288]
    488c:	7100031f 	cmp	w24, #0x0
    4890:	54ffc7ad 	b.le	4184 <_vfiprintf_r+0x324>
    4894:	d503201f 	nop
    4898:	f0000029 	adrp	x9, b000 <_findenv_r+0x10>
    489c:	912f0129 	add	x9, x9, #0xbc0
    48a0:	7100431f 	cmp	w24, #0x10
    48a4:	540004ed 	b.le	4940 <_vfiprintf_r+0xae0>
    48a8:	2a0103e3 	mov	w3, w1
    48ac:	d2800204 	mov	x4, #0x10                  	// #16
    48b0:	f9004bf4 	str	x20, [sp, #144]
    48b4:	aa1903f4 	mov	x20, x25
    48b8:	aa1303f9 	mov	x25, x19
    48bc:	aa0903f3 	mov	x19, x9
    48c0:	14000007 	b	48dc <_vfiprintf_r+0xa7c>
    48c4:	11000868 	add	w8, w3, #0x2
    48c8:	9100437b 	add	x27, x27, #0x10
    48cc:	2a0203e3 	mov	w3, w2
    48d0:	51004318 	sub	w24, w24, #0x10
    48d4:	7100431f 	cmp	w24, #0x10
    48d8:	540002cd 	b.le	4930 <_vfiprintf_r+0xad0>
    48dc:	91004000 	add	x0, x0, #0x10
    48e0:	11000462 	add	w2, w3, #0x1
    48e4:	a9001373 	stp	x19, x4, [x27]
    48e8:	b9011be2 	str	w2, [sp, #280]
    48ec:	f90093e0 	str	x0, [sp, #288]
    48f0:	71001c5f 	cmp	w2, #0x7
    48f4:	54fffe8d 	b.le	48c4 <_vfiprintf_r+0xa64>
    48f8:	b4000380 	cbz	x0, 4968 <_vfiprintf_r+0xb08>
    48fc:	910443e2 	add	x2, sp, #0x110
    4900:	aa1403e1 	mov	x1, x20
    4904:	aa1903e0 	mov	x0, x25
    4908:	97fffd16 	bl	3d60 <__sprint_r.part.0>
    490c:	35ffcb40 	cbnz	w0, 4274 <_vfiprintf_r+0x414>
    4910:	b9411be3 	ldr	w3, [sp, #280]
    4914:	51004318 	sub	w24, w24, #0x10
    4918:	910643fb 	add	x27, sp, #0x190
    491c:	d2800204 	mov	x4, #0x10                  	// #16
    4920:	11000468 	add	w8, w3, #0x1
    4924:	f94093e0 	ldr	x0, [sp, #288]
    4928:	7100431f 	cmp	w24, #0x10
    492c:	54fffd8c 	b.gt	48dc <_vfiprintf_r+0xa7c>
    4930:	aa1303e9 	mov	x9, x19
    4934:	aa1903f3 	mov	x19, x25
    4938:	aa1403f9 	mov	x25, x20
    493c:	f9404bf4 	ldr	x20, [sp, #144]
    4940:	93407f18 	sxtw	x24, w24
    4944:	8b180000 	add	x0, x0, x24
    4948:	a9006369 	stp	x9, x24, [x27]
    494c:	b9011be8 	str	w8, [sp, #280]
    4950:	f90093e0 	str	x0, [sp, #288]
    4954:	71001d1f 	cmp	w8, #0x7
    4958:	5400178c 	b.gt	4c48 <_vfiprintf_r+0xde8>
    495c:	9100437b 	add	x27, x27, #0x10
    4960:	11000508 	add	w8, w8, #0x1
    4964:	17fffe08 	b	4184 <_vfiprintf_r+0x324>
    4968:	910643fb 	add	x27, sp, #0x190
    496c:	52800028 	mov	w8, #0x1                   	// #1
    4970:	52800003 	mov	w3, #0x0                   	// #0
    4974:	17ffffd7 	b	48d0 <_vfiprintf_r+0xa70>
    4978:	910443e2 	add	x2, sp, #0x110
    497c:	aa1903e1 	mov	x1, x25
    4980:	aa1303e0 	mov	x0, x19
    4984:	97fffcf7 	bl	3d60 <__sprint_r.part.0>
    4988:	34ffc340 	cbz	w0, 41f0 <_vfiprintf_r+0x390>
    498c:	17fffe3c 	b	427c <_vfiprintf_r+0x41c>
    4990:	910643fb 	add	x27, sp, #0x190
    4994:	5280002a 	mov	w10, #0x1                   	// #1
    4998:	52800003 	mov	w3, #0x0                   	// #0
    499c:	17ffff88 	b	47bc <_vfiprintf_r+0x95c>
    49a0:	b4001760 	cbz	x0, 4c8c <_vfiprintf_r+0xe2c>
    49a4:	910443e2 	add	x2, sp, #0x110
    49a8:	aa1903e1 	mov	x1, x25
    49ac:	aa1303e0 	mov	x0, x19
    49b0:	b90093ea 	str	w10, [sp, #144]
    49b4:	b900b7e4 	str	w4, [sp, #180]
    49b8:	97fffcea 	bl	3d60 <__sprint_r.part.0>
    49bc:	35ffc600 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    49c0:	b9411be1 	ldr	w1, [sp, #280]
    49c4:	910643fb 	add	x27, sp, #0x190
    49c8:	b94093ea 	ldr	w10, [sp, #144]
    49cc:	b940b7e4 	ldr	w4, [sp, #180]
    49d0:	11000428 	add	w8, w1, #0x1
    49d4:	f94093e0 	ldr	x0, [sp, #288]
    49d8:	17fffdd0 	b	4118 <_vfiprintf_r+0x2b8>
    49dc:	9103c3e0 	add	x0, sp, #0xf0
    49e0:	d2800041 	mov	x1, #0x2                   	// #2
    49e4:	910643fb 	add	x27, sp, #0x190
    49e8:	a91907e0 	stp	x0, x1, [sp, #400]
    49ec:	aa0103e0 	mov	x0, x1
    49f0:	52800028 	mov	w8, #0x1                   	// #1
    49f4:	d503201f 	nop
    49f8:	2a0803e1 	mov	w1, w8
    49fc:	9100437b 	add	x27, x27, #0x10
    4a00:	11000428 	add	w8, w1, #0x1
    4a04:	17fffddb 	b	4170 <_vfiprintf_r+0x310>
    4a08:	7100413f 	cmp	w9, #0x10
    4a0c:	54005c4d 	b.le	5594 <_vfiprintf_r+0x1734>
    4a10:	f0000028 	adrp	x8, b000 <_findenv_r+0x10>
    4a14:	912ec108 	add	x8, x8, #0xbb0
    4a18:	aa1b03e3 	mov	x3, x27
    4a1c:	d280020c 	mov	x12, #0x10                  	// #16
    4a20:	2a1703fb 	mov	w27, w23
    4a24:	2a1603f7 	mov	w23, w22
    4a28:	aa0803f6 	mov	x22, x8
    4a2c:	b90093ea 	str	w10, [sp, #144]
    4a30:	b900b7e4 	str	w4, [sp, #180]
    4a34:	2a0103e4 	mov	w4, w1
    4a38:	f9005ff4 	str	x20, [sp, #184]
    4a3c:	aa1903f4 	mov	x20, x25
    4a40:	2a0903f9 	mov	w25, w9
    4a44:	14000008 	b	4a64 <_vfiprintf_r+0xc04>
    4a48:	1100088b 	add	w11, w4, #0x2
    4a4c:	91004063 	add	x3, x3, #0x10
    4a50:	2a0203e4 	mov	w4, w2
    4a54:	51004339 	sub	w25, w25, #0x10
    4a58:	7100433f 	cmp	w25, #0x10
    4a5c:	540002cd 	b.le	4ab4 <_vfiprintf_r+0xc54>
    4a60:	11000482 	add	w2, w4, #0x1
    4a64:	91004000 	add	x0, x0, #0x10
    4a68:	a9003076 	stp	x22, x12, [x3]
    4a6c:	b9011be2 	str	w2, [sp, #280]
    4a70:	f90093e0 	str	x0, [sp, #288]
    4a74:	71001c5f 	cmp	w2, #0x7
    4a78:	54fffe8d 	b.le	4a48 <_vfiprintf_r+0xbe8>
    4a7c:	b4000440 	cbz	x0, 4b04 <_vfiprintf_r+0xca4>
    4a80:	910443e2 	add	x2, sp, #0x110
    4a84:	aa1403e1 	mov	x1, x20
    4a88:	aa1303e0 	mov	x0, x19
    4a8c:	97fffcb5 	bl	3d60 <__sprint_r.part.0>
    4a90:	35ffbf40 	cbnz	w0, 4278 <_vfiprintf_r+0x418>
    4a94:	b9411be4 	ldr	w4, [sp, #280]
    4a98:	51004339 	sub	w25, w25, #0x10
    4a9c:	910643e3 	add	x3, sp, #0x190
    4aa0:	d280020c 	mov	x12, #0x10                  	// #16
    4aa4:	1100048b 	add	w11, w4, #0x1
    4aa8:	f94093e0 	ldr	x0, [sp, #288]
    4aac:	7100433f 	cmp	w25, #0x10
    4ab0:	54fffd8c 	b.gt	4a60 <_vfiprintf_r+0xc00>
    4ab4:	2a1903e9 	mov	w9, w25
    4ab8:	b94093ea 	ldr	w10, [sp, #144]
    4abc:	aa1403f9 	mov	x25, x20
    4ac0:	b940b7e4 	ldr	w4, [sp, #180]
    4ac4:	f9405ff4 	ldr	x20, [sp, #184]
    4ac8:	aa1603e8 	mov	x8, x22
    4acc:	2a1703f6 	mov	w22, w23
    4ad0:	2a1b03f7 	mov	w23, w27
    4ad4:	aa0303fb 	mov	x27, x3
    4ad8:	93407d21 	sxtw	x1, w9
    4adc:	a9000768 	stp	x8, x1, [x27]
    4ae0:	8b010000 	add	x0, x0, x1
    4ae4:	b9011beb 	str	w11, [sp, #280]
    4ae8:	f90093e0 	str	x0, [sp, #288]
    4aec:	71001d7f 	cmp	w11, #0x7
    4af0:	54000ecc 	b.gt	4cc8 <_vfiprintf_r+0xe68>
    4af4:	9100437b 	add	x27, x27, #0x10
    4af8:	11000568 	add	w8, w11, #0x1
    4afc:	2a0b03e1 	mov	w1, w11
    4b00:	17fffd78 	b	40e0 <_vfiprintf_r+0x280>
    4b04:	910643e3 	add	x3, sp, #0x190
    4b08:	52800004 	mov	w4, #0x0                   	// #0
    4b0c:	5280002b 	mov	w11, #0x1                   	// #1
    4b10:	17ffffd1 	b	4a54 <_vfiprintf_r+0xbf4>
    4b14:	b9011bff 	str	wzr, [sp, #280]
    4b18:	3610079c 	tbz	w28, #2, 4c08 <_vfiprintf_r+0xda8>
    4b1c:	b94063e1 	ldr	w1, [sp, #96]
    4b20:	4b160037 	sub	w23, w1, w22
    4b24:	710002ff 	cmp	w23, #0x0
    4b28:	5400070d 	b.le	4c08 <_vfiprintf_r+0xda8>
    4b2c:	910643e5 	add	x5, sp, #0x190
    4b30:	b9411be2 	ldr	w2, [sp, #280]
    4b34:	710042ff 	cmp	w23, #0x10
    4b38:	5400546d 	b.le	55c4 <_vfiprintf_r+0x1764>
    4b3c:	f0000028 	adrp	x8, b000 <_findenv_r+0x10>
    4b40:	912ec108 	add	x8, x8, #0xbb0
    4b44:	aa0803fa 	mov	x26, x8
    4b48:	d2800218 	mov	x24, #0x10                  	// #16
    4b4c:	14000007 	b	4b68 <_vfiprintf_r+0xd08>
    4b50:	11000844 	add	w4, w2, #0x2
    4b54:	910040a5 	add	x5, x5, #0x10
    4b58:	2a0303e2 	mov	w2, w3
    4b5c:	510042f7 	sub	w23, w23, #0x10
    4b60:	710042ff 	cmp	w23, #0x10
    4b64:	540002ad 	b.le	4bb8 <_vfiprintf_r+0xd58>
    4b68:	91004000 	add	x0, x0, #0x10
    4b6c:	11000443 	add	w3, w2, #0x1
    4b70:	a90060ba 	stp	x26, x24, [x5]
    4b74:	b9011be3 	str	w3, [sp, #280]
    4b78:	f90093e0 	str	x0, [sp, #288]
    4b7c:	71001c7f 	cmp	w3, #0x7
    4b80:	54fffe8d 	b.le	4b50 <_vfiprintf_r+0xcf0>
    4b84:	b40003a0 	cbz	x0, 4bf8 <_vfiprintf_r+0xd98>
    4b88:	910443e2 	add	x2, sp, #0x110
    4b8c:	aa1903e1 	mov	x1, x25
    4b90:	aa1303e0 	mov	x0, x19
    4b94:	97fffc73 	bl	3d60 <__sprint_r.part.0>
    4b98:	35ffb720 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4b9c:	b9411be2 	ldr	w2, [sp, #280]
    4ba0:	510042f7 	sub	w23, w23, #0x10
    4ba4:	910643e5 	add	x5, sp, #0x190
    4ba8:	11000444 	add	w4, w2, #0x1
    4bac:	f94093e0 	ldr	x0, [sp, #288]
    4bb0:	710042ff 	cmp	w23, #0x10
    4bb4:	54fffdac 	b.gt	4b68 <_vfiprintf_r+0xd08>
    4bb8:	aa1a03e8 	mov	x8, x26
    4bbc:	93407ef7 	sxtw	x23, w23
    4bc0:	a9005ca8 	stp	x8, x23, [x5]
    4bc4:	8b170000 	add	x0, x0, x23
    4bc8:	b9011be4 	str	w4, [sp, #280]
    4bcc:	f90093e0 	str	x0, [sp, #288]
    4bd0:	71001c9f 	cmp	w4, #0x7
    4bd4:	54ffb00d 	b.le	41d4 <_vfiprintf_r+0x374>
    4bd8:	b4000180 	cbz	x0, 4c08 <_vfiprintf_r+0xda8>
    4bdc:	910443e2 	add	x2, sp, #0x110
    4be0:	aa1903e1 	mov	x1, x25
    4be4:	aa1303e0 	mov	x0, x19
    4be8:	97fffc5e 	bl	3d60 <__sprint_r.part.0>
    4bec:	35ffb480 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4bf0:	f94093e0 	ldr	x0, [sp, #288]
    4bf4:	17fffd78 	b	41d4 <_vfiprintf_r+0x374>
    4bf8:	910643e5 	add	x5, sp, #0x190
    4bfc:	52800024 	mov	w4, #0x1                   	// #1
    4c00:	52800002 	mov	w2, #0x0                   	// #0
    4c04:	17ffffd6 	b	4b5c <_vfiprintf_r+0xcfc>
    4c08:	b94063e0 	ldr	w0, [sp, #96]
    4c0c:	6b16001f 	cmp	w0, w22
    4c10:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    4c14:	b94067e0 	ldr	w0, [sp, #100]
    4c18:	0b030000 	add	w0, w0, w3
    4c1c:	b90067e0 	str	w0, [sp, #100]
    4c20:	17fffd74 	b	41f0 <_vfiprintf_r+0x390>
    4c24:	2a1c03f6 	mov	w22, w28
    4c28:	f100243f 	cmp	x1, #0x9
    4c2c:	540024c8 	b.hi	50c4 <_vfiprintf_r+0x1264>  // b.pmore
    4c30:	1100c021 	add	w1, w1, #0x30
    4c34:	2a1603fc 	mov	w28, w22
    4c38:	91062ffa 	add	x26, sp, #0x18b
    4c3c:	52800037 	mov	w23, #0x1                   	// #1
    4c40:	39062fe1 	strb	w1, [sp, #395]
    4c44:	17fffe1b 	b	44b0 <_vfiprintf_r+0x650>
    4c48:	b4ffd360 	cbz	x0, 46b4 <_vfiprintf_r+0x854>
    4c4c:	910443e2 	add	x2, sp, #0x110
    4c50:	aa1903e1 	mov	x1, x25
    4c54:	aa1303e0 	mov	x0, x19
    4c58:	97fffc42 	bl	3d60 <__sprint_r.part.0>
    4c5c:	35ffb100 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4c60:	b9411be8 	ldr	w8, [sp, #280]
    4c64:	910643fb 	add	x27, sp, #0x190
    4c68:	f94093e0 	ldr	x0, [sp, #288]
    4c6c:	11000508 	add	w8, w8, #0x1
    4c70:	17fffd45 	b	4184 <_vfiprintf_r+0x324>
    4c74:	910643fb 	add	x27, sp, #0x190
    4c78:	b9011bff 	str	wzr, [sp, #280]
    4c7c:	17fffcf4 	b	404c <_vfiprintf_r+0x1ec>
    4c80:	910633fa 	add	x26, sp, #0x18c
    4c84:	52800004 	mov	w4, #0x0                   	// #0
    4c88:	17fffe0a 	b	44b0 <_vfiprintf_r+0x650>
    4c8c:	350007ca 	cbnz	w10, 4d84 <_vfiprintf_r+0xf24>
    4c90:	910643fb 	add	x27, sp, #0x190
    4c94:	52800001 	mov	w1, #0x0                   	// #0
    4c98:	52800028 	mov	w8, #0x1                   	// #1
    4c9c:	17fffd35 	b	4170 <_vfiprintf_r+0x310>
    4ca0:	910643fb 	add	x27, sp, #0x190
    4ca4:	52800028 	mov	w8, #0x1                   	// #1
    4ca8:	52800001 	mov	w1, #0x0                   	// #0
    4cac:	17fffd31 	b	4170 <_vfiprintf_r+0x310>
    4cb0:	528005a0 	mov	w0, #0x2d                  	// #45
    4cb4:	cb0103e1 	neg	x1, x1
    4cb8:	2a1c03f6 	mov	w22, w28
    4cbc:	3903bfe0 	strb	w0, [sp, #239]
    4cc0:	52800020 	mov	w0, #0x1                   	// #1
    4cc4:	17fffded 	b	4478 <_vfiprintf_r+0x618>
    4cc8:	b4000d60 	cbz	x0, 4e74 <_vfiprintf_r+0x1014>
    4ccc:	910443e2 	add	x2, sp, #0x110
    4cd0:	aa1903e1 	mov	x1, x25
    4cd4:	aa1303e0 	mov	x0, x19
    4cd8:	b90093ea 	str	w10, [sp, #144]
    4cdc:	b900b7e4 	str	w4, [sp, #180]
    4ce0:	97fffc20 	bl	3d60 <__sprint_r.part.0>
    4ce4:	35ffacc0 	cbnz	w0, 427c <_vfiprintf_r+0x41c>
    4ce8:	b9411be1 	ldr	w1, [sp, #280]
    4cec:	910643fb 	add	x27, sp, #0x190
    4cf0:	b94093ea 	ldr	w10, [sp, #144]
    4cf4:	b940b7e4 	ldr	w4, [sp, #180]
    4cf8:	11000428 	add	w8, w1, #0x1
    4cfc:	f94093e0 	ldr	x0, [sp, #288]
    4d00:	17fffcf8 	b	40e0 <_vfiprintf_r+0x280>
    4d04:	9100437b 	add	x27, x27, #0x10
    4d08:	11000548 	add	w8, w10, #0x1
    4d0c:	2a0a03e1 	mov	w1, w10
    4d10:	17fffd1a 	b	4178 <_vfiprintf_r+0x318>
    4d14:	39400280 	ldrb	w0, [x20]
    4d18:	17fffcd8 	b	4078 <_vfiprintf_r+0x218>
    4d1c:	36302a9c 	tbz	w28, #6, 526c <_vfiprintf_r+0x140c>
    4d20:	37f83d20 	tbnz	w0, #31, 54c4 <_vfiprintf_r+0x1664>
    4d24:	f94037e0 	ldr	x0, [sp, #104]
    4d28:	91002c01 	add	x1, x0, #0xb
    4d2c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d30:	f90037e1 	str	x1, [sp, #104]
    4d34:	79800001 	ldrsh	x1, [x0]
    4d38:	aa0103e0 	mov	x0, x1
    4d3c:	17fffe01 	b	4540 <_vfiprintf_r+0x6e0>
    4d40:	3630247c 	tbz	w28, #6, 51cc <_vfiprintf_r+0x136c>
    4d44:	37f83960 	tbnz	w0, #31, 5470 <_vfiprintf_r+0x1610>
    4d48:	f94037e0 	ldr	x0, [sp, #104]
    4d4c:	91002c01 	add	x1, x0, #0xb
    4d50:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d54:	f90037e1 	str	x1, [sp, #104]
    4d58:	79400001 	ldrh	w1, [x0]
    4d5c:	17fffdea 	b	4504 <_vfiprintf_r+0x6a4>
    4d60:	36302476 	tbz	w22, #6, 51ec <_vfiprintf_r+0x138c>
    4d64:	37f839c0 	tbnz	w0, #31, 549c <_vfiprintf_r+0x163c>
    4d68:	f94037e0 	ldr	x0, [sp, #104]
    4d6c:	91002c01 	add	x1, x0, #0xb
    4d70:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d74:	f90037e1 	str	x1, [sp, #104]
    4d78:	79400001 	ldrh	w1, [x0]
    4d7c:	52800020 	mov	w0, #0x1                   	// #1
    4d80:	17fffdbd 	b	4474 <_vfiprintf_r+0x614>
    4d84:	9103c3e0 	add	x0, sp, #0xf0
    4d88:	d2800042 	mov	x2, #0x2                   	// #2
    4d8c:	910643fb 	add	x27, sp, #0x190
    4d90:	52800021 	mov	w1, #0x1                   	// #1
    4d94:	a9190be0 	stp	x0, x2, [sp, #400]
    4d98:	aa0203e0 	mov	x0, x2
    4d9c:	17ffff18 	b	49fc <_vfiprintf_r+0xb9c>
    4da0:	2a1603e4 	mov	w4, w22
    4da4:	17fffddd 	b	4518 <_vfiprintf_r+0x6b8>
    4da8:	b940b3e1 	ldr	w1, [sp, #176]
    4dac:	11002021 	add	w1, w1, #0x8
    4db0:	7100003f 	cmp	w1, #0x0
    4db4:	54002d6d 	b.le	5360 <_vfiprintf_r+0x1500>
    4db8:	f94037e2 	ldr	x2, [sp, #104]
    4dbc:	b900b3e1 	str	w1, [sp, #176]
    4dc0:	91003c58 	add	x24, x2, #0xf
    4dc4:	927df318 	and	x24, x24, #0xfffffffffffffff8
    4dc8:	17fffd46 	b	42e0 <_vfiprintf_r+0x480>
    4dcc:	b940b3e0 	ldr	w0, [sp, #176]
    4dd0:	11002001 	add	w1, w0, #0x8
    4dd4:	7100003f 	cmp	w1, #0x0
    4dd8:	54002a2d 	b.le	531c <_vfiprintf_r+0x14bc>
    4ddc:	f94037e0 	ldr	x0, [sp, #104]
    4de0:	b900b3e1 	str	w1, [sp, #176]
    4de4:	91002c00 	add	x0, x0, #0xb
    4de8:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4dec:	17fffd8f 	b	4428 <_vfiprintf_r+0x5c8>
    4df0:	b940b3e0 	ldr	w0, [sp, #176]
    4df4:	11002000 	add	w0, w0, #0x8
    4df8:	7100001f 	cmp	w0, #0x0
    4dfc:	5400286d 	b.le	5308 <_vfiprintf_r+0x14a8>
    4e00:	f94037e2 	ldr	x2, [sp, #104]
    4e04:	b900b3e0 	str	w0, [sp, #176]
    4e08:	91003c41 	add	x1, x2, #0xf
    4e0c:	927df020 	and	x0, x1, #0xfffffffffffffff8
    4e10:	f90037e0 	str	x0, [sp, #104]
    4e14:	17fffe1f 	b	4690 <_vfiprintf_r+0x830>
    4e18:	b940b3e0 	ldr	w0, [sp, #176]
    4e1c:	37f828e0 	tbnz	w0, #31, 5338 <_vfiprintf_r+0x14d8>
    4e20:	f94037e0 	ldr	x0, [sp, #104]
    4e24:	91002c01 	add	x1, x0, #0xb
    4e28:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4e2c:	f90037e1 	str	x1, [sp, #104]
    4e30:	b9400000 	ldr	w0, [x0]
    4e34:	52800036 	mov	w22, #0x1                   	// #1
    4e38:	9104a3fa 	add	x26, sp, #0x128
    4e3c:	2a1603f7 	mov	w23, w22
    4e40:	3903bfff 	strb	wzr, [sp, #239]
    4e44:	3904a3e0 	strb	w0, [sp, #296]
    4e48:	17fffc96 	b	40a0 <_vfiprintf_r+0x240>
    4e4c:	b940b3e0 	ldr	w0, [sp, #176]
    4e50:	11002001 	add	w1, w0, #0x8
    4e54:	7100003f 	cmp	w1, #0x0
    4e58:	5400394d 	b.le	5580 <_vfiprintf_r+0x1720>
    4e5c:	f94037e0 	ldr	x0, [sp, #104]
    4e60:	b900b3e1 	str	w1, [sp, #176]
    4e64:	91003c02 	add	x2, x0, #0xf
    4e68:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4e6c:	f90037e1 	str	x1, [sp, #104]
    4e70:	17fffdf0 	b	4630 <_vfiprintf_r+0x7d0>
    4e74:	3943bfe1 	ldrb	w1, [sp, #239]
    4e78:	35002d81 	cbnz	w1, 5428 <_vfiprintf_r+0x15c8>
    4e7c:	35ffdb0a 	cbnz	w10, 49dc <_vfiprintf_r+0xb7c>
    4e80:	910643fb 	add	x27, sp, #0x190
    4e84:	52800001 	mov	w1, #0x0                   	// #0
    4e88:	52800028 	mov	w8, #0x1                   	// #1
    4e8c:	17fffcbb 	b	4178 <_vfiprintf_r+0x318>
    4e90:	2a1603e4 	mov	w4, w22
    4e94:	2a1c03f6 	mov	w22, w28
    4e98:	17fffd6d 	b	444c <_vfiprintf_r+0x5ec>
    4e9c:	2a1603e4 	mov	w4, w22
    4ea0:	f0000021 	adrp	x1, b000 <_findenv_r+0x10>
    4ea4:	912b0021 	add	x1, x1, #0xac0
    4ea8:	f90047e1 	str	x1, [sp, #136]
    4eac:	b940b3e1 	ldr	w1, [sp, #176]
    4eb0:	3728023c 	tbnz	w28, #5, 4ef4 <_vfiprintf_r+0x1094>
    4eb4:	3720021c 	tbnz	w28, #4, 4ef4 <_vfiprintf_r+0x1094>
    4eb8:	36301b7c 	tbz	w28, #6, 5224 <_vfiprintf_r+0x13c4>
    4ebc:	37f82c41 	tbnz	w1, #31, 5444 <_vfiprintf_r+0x15e4>
    4ec0:	f94037e1 	ldr	x1, [sp, #104]
    4ec4:	91002c22 	add	x2, x1, #0xb
    4ec8:	927df042 	and	x2, x2, #0xfffffffffffffff8
    4ecc:	79400021 	ldrh	w1, [x1]
    4ed0:	f90037e2 	str	x2, [sp, #104]
    4ed4:	1400000e 	b	4f0c <_vfiprintf_r+0x10ac>
    4ed8:	f0000021 	adrp	x1, b000 <_findenv_r+0x10>
    4edc:	2a1603e4 	mov	w4, w22
    4ee0:	912b6021 	add	x1, x1, #0xad8
    4ee4:	f90047e1 	str	x1, [sp, #136]
    4ee8:	17fffff1 	b	4eac <_vfiprintf_r+0x104c>
    4eec:	2a1603e4 	mov	w4, w22
    4ef0:	17fffd7c 	b	44e0 <_vfiprintf_r+0x680>
    4ef4:	37f801a1 	tbnz	w1, #31, 4f28 <_vfiprintf_r+0x10c8>
    4ef8:	f94037e1 	ldr	x1, [sp, #104]
    4efc:	91003c22 	add	x2, x1, #0xf
    4f00:	927df042 	and	x2, x2, #0xfffffffffffffff8
    4f04:	f90037e2 	str	x2, [sp, #104]
    4f08:	f9400021 	ldr	x1, [x1]
    4f0c:	f100003f 	cmp	x1, #0x0
    4f10:	1a9f07e2 	cset	w2, ne  // ne = any
    4f14:	6a02039f 	tst	w28, w2
    4f18:	54000581 	b.ne	4fc8 <_vfiprintf_r+0x1168>  // b.any
    4f1c:	12157b96 	and	w22, w28, #0xfffffbff
    4f20:	52800040 	mov	w0, #0x2                   	// #2
    4f24:	17fffd54 	b	4474 <_vfiprintf_r+0x614>
    4f28:	b940b3e1 	ldr	w1, [sp, #176]
    4f2c:	11002022 	add	w2, w1, #0x8
    4f30:	7100005f 	cmp	w2, #0x0
    4f34:	540016ed 	b.le	5210 <_vfiprintf_r+0x13b0>
    4f38:	f94037e1 	ldr	x1, [sp, #104]
    4f3c:	b900b3e2 	str	w2, [sp, #176]
    4f40:	91003c23 	add	x3, x1, #0xf
    4f44:	927df062 	and	x2, x3, #0xfffffffffffffff8
    4f48:	f90037e2 	str	x2, [sp, #104]
    4f4c:	17ffffef 	b	4f08 <_vfiprintf_r+0x10a8>
    4f50:	b940b3e0 	ldr	w0, [sp, #176]
    4f54:	11002001 	add	w1, w0, #0x8
    4f58:	7100003f 	cmp	w1, #0x0
    4f5c:	540017ed 	b.le	5258 <_vfiprintf_r+0x13f8>
    4f60:	f94037e0 	ldr	x0, [sp, #104]
    4f64:	b900b3e1 	str	w1, [sp, #176]
    4f68:	91003c02 	add	x2, x0, #0xf
    4f6c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4f70:	f90037e1 	str	x1, [sp, #104]
    4f74:	17fffd71 	b	4538 <_vfiprintf_r+0x6d8>
    4f78:	b940b3e0 	ldr	w0, [sp, #176]
    4f7c:	11002001 	add	w1, w0, #0x8
    4f80:	7100003f 	cmp	w1, #0x0
    4f84:	5400186d 	b.le	5290 <_vfiprintf_r+0x1430>
    4f88:	f94037e0 	ldr	x0, [sp, #104]
    4f8c:	b900b3e1 	str	w1, [sp, #176]
    4f90:	91003c02 	add	x2, x0, #0xf
    4f94:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4f98:	f90037e1 	str	x1, [sp, #104]
    4f9c:	17fffd59 	b	4500 <_vfiprintf_r+0x6a0>
    4fa0:	b940b3e0 	ldr	w0, [sp, #176]
    4fa4:	11002000 	add	w0, w0, #0x8
    4fa8:	7100001f 	cmp	w0, #0x0
    4fac:	540014cd 	b.le	5244 <_vfiprintf_r+0x13e4>
    4fb0:	f94037e1 	ldr	x1, [sp, #104]
    4fb4:	b900b3e0 	str	w0, [sp, #176]
    4fb8:	91003c22 	add	x2, x1, #0xf
    4fbc:	927df040 	and	x0, x2, #0xfffffffffffffff8
    4fc0:	f90037e0 	str	x0, [sp, #104]
    4fc4:	17fffd2a 	b	446c <_vfiprintf_r+0x60c>
    4fc8:	321f039c 	orr	w28, w28, #0x2
    4fcc:	3903c7e0 	strb	w0, [sp, #241]
    4fd0:	52800600 	mov	w0, #0x30                  	// #48
    4fd4:	3903c3e0 	strb	w0, [sp, #240]
    4fd8:	17ffffd1 	b	4f1c <_vfiprintf_r+0x10bc>
    4fdc:	910403e0 	add	x0, sp, #0x100
    4fe0:	d2800102 	mov	x2, #0x8                   	// #8
    4fe4:	52800001 	mov	w1, #0x0                   	// #0
    4fe8:	b9006be4 	str	w4, [sp, #104]
    4fec:	f90087fa 	str	x26, [sp, #264]
    4ff0:	97fffae4 	bl	3b80 <memset>
    4ff4:	b9406be4 	ldr	w4, [sp, #104]
    4ff8:	3100049f 	cmn	w4, #0x1
    4ffc:	54001680 	b.eq	52cc <_vfiprintf_r+0x146c>  // b.none
    5000:	d2800016 	mov	x22, #0x0                   	// #0
    5004:	52800017 	mov	w23, #0x0                   	// #0
    5008:	aa1603e0 	mov	x0, x22
    500c:	2a1703f6 	mov	w22, w23
    5010:	aa0003f7 	mov	x23, x0
    5014:	f90037f4 	str	x20, [sp, #104]
    5018:	2a0403f4 	mov	w20, w4
    501c:	1400000d 	b	5050 <_vfiprintf_r+0x11f0>
    5020:	910403e3 	add	x3, sp, #0x100
    5024:	9104a3e1 	add	x1, sp, #0x128
    5028:	aa1303e0 	mov	x0, x19
    502c:	940002a9 	bl	5ad0 <_wcrtomb_r>
    5030:	3100041f 	cmn	w0, #0x1
    5034:	54002d60 	b.eq	55e0 <_vfiprintf_r+0x1780>  // b.none
    5038:	0b0002c0 	add	w0, w22, w0
    503c:	6b14001f 	cmp	w0, w20
    5040:	540000ec 	b.gt	505c <_vfiprintf_r+0x11fc>
    5044:	910012f7 	add	x23, x23, #0x4
    5048:	54003820 	b.eq	574c <_vfiprintf_r+0x18ec>  // b.none
    504c:	2a0003f6 	mov	w22, w0
    5050:	f94087e0 	ldr	x0, [sp, #264]
    5054:	b8776802 	ldr	w2, [x0, x23]
    5058:	35fffe42 	cbnz	w2, 5020 <_vfiprintf_r+0x11c0>
    505c:	f94037f4 	ldr	x20, [sp, #104]
    5060:	2a1603f7 	mov	w23, w22
    5064:	340014b7 	cbz	w23, 52f8 <_vfiprintf_r+0x1498>
    5068:	71018eff 	cmp	w23, #0x63
    506c:	540024ac 	b.gt	5500 <_vfiprintf_r+0x16a0>
    5070:	9104a3fa 	add	x26, sp, #0x128
    5074:	f9003bff 	str	xzr, [sp, #112]
    5078:	93407ef6 	sxtw	x22, w23
    507c:	d2800102 	mov	x2, #0x8                   	// #8
    5080:	52800001 	mov	w1, #0x0                   	// #0
    5084:	910403e0 	add	x0, sp, #0x100
    5088:	97fffabe 	bl	3b80 <memset>
    508c:	910403e4 	add	x4, sp, #0x100
    5090:	aa1603e3 	mov	x3, x22
    5094:	910423e2 	add	x2, sp, #0x108
    5098:	aa1a03e1 	mov	x1, x26
    509c:	aa1303e0 	mov	x0, x19
    50a0:	940002d8 	bl	5c00 <_wcsrtombs_r>
    50a4:	eb0002df 	cmp	x22, x0
    50a8:	54004761 	b.ne	5994 <_vfiprintf_r+0x1b34>  // b.any
    50ac:	710002ff 	cmp	w23, #0x0
    50b0:	52800004 	mov	w4, #0x0                   	// #0
    50b4:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    50b8:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    50bc:	f90037f8 	str	x24, [sp, #104]
    50c0:	17fffcff 	b	44bc <_vfiprintf_r+0x65c>
    50c4:	910633f7 	add	x23, sp, #0x18c
    50c8:	121602c6 	and	w6, w22, #0x400
    50cc:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    50d0:	aa1703e2 	mov	x2, x23
    50d4:	aa1403e3 	mov	x3, x20
    50d8:	aa1703e5 	mov	x5, x23
    50dc:	52800008 	mov	w8, #0x0                   	// #0
    50e0:	aa1303f7 	mov	x23, x19
    50e4:	f29999bc 	movk	x28, #0xcccd
    50e8:	2a0603f3 	mov	w19, w6
    50ec:	f9404ff4 	ldr	x20, [sp, #152]
    50f0:	14000007 	b	510c <_vfiprintf_r+0x12ac>
    50f4:	9bdc7c38 	umulh	x24, x1, x28
    50f8:	d343ff18 	lsr	x24, x24, #3
    50fc:	f100243f 	cmp	x1, #0x9
    5100:	54000249 	b.ls	5148 <_vfiprintf_r+0x12e8>  // b.plast
    5104:	aa1803e1 	mov	x1, x24
    5108:	aa1a03e2 	mov	x2, x26
    510c:	9bdc7c38 	umulh	x24, x1, x28
    5110:	11000508 	add	w8, w8, #0x1
    5114:	d100045a 	sub	x26, x2, #0x1
    5118:	d343ff18 	lsr	x24, x24, #3
    511c:	8b180b00 	add	x0, x24, x24, lsl #2
    5120:	cb000420 	sub	x0, x1, x0, lsl #1
    5124:	1100c000 	add	w0, w0, #0x30
    5128:	381ff040 	sturb	w0, [x2, #-1]
    512c:	34fffe53 	cbz	w19, 50f4 <_vfiprintf_r+0x1294>
    5130:	39400280 	ldrb	w0, [x20]
    5134:	7103fc1f 	cmp	w0, #0xff
    5138:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    513c:	54fffdc1 	b.ne	50f4 <_vfiprintf_r+0x1294>  // b.any
    5140:	f100243f 	cmp	x1, #0x9
    5144:	54002028 	b.hi	5548 <_vfiprintf_r+0x16e8>  // b.pmore
    5148:	aa1703f3 	mov	x19, x23
    514c:	aa0503f7 	mov	x23, x5
    5150:	4b1a02f7 	sub	w23, w23, w26
    5154:	2a1603fc 	mov	w28, w22
    5158:	f9004ff4 	str	x20, [sp, #152]
    515c:	aa0303f4 	mov	x20, x3
    5160:	17fffcd4 	b	44b0 <_vfiprintf_r+0x650>
    5164:	39400680 	ldrb	w0, [x20, #1]
    5168:	3217039c 	orr	w28, w28, #0x200
    516c:	91000694 	add	x20, x20, #0x1
    5170:	17fffbc2 	b	4078 <_vfiprintf_r+0x218>
    5174:	39400680 	ldrb	w0, [x20, #1]
    5178:	321b039c 	orr	w28, w28, #0x20
    517c:	91000694 	add	x20, x20, #0x1
    5180:	17fffbbe 	b	4078 <_vfiprintf_r+0x218>
    5184:	aa1403f3 	mov	x19, x20
    5188:	aa1603f9 	mov	x25, x22
    518c:	17fffc3c 	b	427c <_vfiprintf_r+0x41c>
    5190:	7100189f 	cmp	w4, #0x6
    5194:	528000d7 	mov	w23, #0x6                   	// #6
    5198:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    519c:	d0000027 	adrp	x7, b000 <_findenv_r+0x10>
    51a0:	2a1703f6 	mov	w22, w23
    51a4:	912bc0fa 	add	x26, x7, #0xaf0
    51a8:	f90037f8 	str	x24, [sp, #104]
    51ac:	17fffbbd 	b	40a0 <_vfiprintf_r+0x240>
    51b0:	f94093e0 	ldr	x0, [sp, #288]
    51b4:	b4ff86e0 	cbz	x0, 4290 <_vfiprintf_r+0x430>
    51b8:	aa1303e0 	mov	x0, x19
    51bc:	910443e2 	add	x2, sp, #0x110
    51c0:	aa1903e1 	mov	x1, x25
    51c4:	97fffae7 	bl	3d60 <__sprint_r.part.0>
    51c8:	17fffc32 	b	4290 <_vfiprintf_r+0x430>
    51cc:	3648101c 	tbz	w28, #9, 53cc <_vfiprintf_r+0x156c>
    51d0:	37f822e0 	tbnz	w0, #31, 562c <_vfiprintf_r+0x17cc>
    51d4:	f94037e0 	ldr	x0, [sp, #104]
    51d8:	91002c01 	add	x1, x0, #0xb
    51dc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    51e0:	f90037e1 	str	x1, [sp, #104]
    51e4:	39400001 	ldrb	w1, [x0]
    51e8:	17fffcc7 	b	4504 <_vfiprintf_r+0x6a4>
    51ec:	364810f6 	tbz	w22, #9, 5408 <_vfiprintf_r+0x15a8>
    51f0:	37f82880 	tbnz	w0, #31, 5700 <_vfiprintf_r+0x18a0>
    51f4:	f94037e0 	ldr	x0, [sp, #104]
    51f8:	91002c01 	add	x1, x0, #0xb
    51fc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5200:	f90037e1 	str	x1, [sp, #104]
    5204:	39400001 	ldrb	w1, [x0]
    5208:	52800020 	mov	w0, #0x1                   	// #1
    520c:	17fffc9a 	b	4474 <_vfiprintf_r+0x614>
    5210:	f94043e3 	ldr	x3, [sp, #128]
    5214:	b940b3e1 	ldr	w1, [sp, #176]
    5218:	b900b3e2 	str	w2, [sp, #176]
    521c:	8b21c061 	add	x1, x3, w1, sxtw
    5220:	17ffff3a 	b	4f08 <_vfiprintf_r+0x10a8>
    5224:	36480c7c 	tbz	w28, #9, 53b0 <_vfiprintf_r+0x1550>
    5228:	37f82421 	tbnz	w1, #31, 56ac <_vfiprintf_r+0x184c>
    522c:	f94037e1 	ldr	x1, [sp, #104]
    5230:	91002c22 	add	x2, x1, #0xb
    5234:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5238:	39400021 	ldrb	w1, [x1]
    523c:	f90037e2 	str	x2, [sp, #104]
    5240:	17ffff33 	b	4f0c <_vfiprintf_r+0x10ac>
    5244:	f94043e2 	ldr	x2, [sp, #128]
    5248:	b940b3e1 	ldr	w1, [sp, #176]
    524c:	b900b3e0 	str	w0, [sp, #176]
    5250:	8b21c041 	add	x1, x2, w1, sxtw
    5254:	17fffc86 	b	446c <_vfiprintf_r+0x60c>
    5258:	f94043e2 	ldr	x2, [sp, #128]
    525c:	b940b3e0 	ldr	w0, [sp, #176]
    5260:	b900b3e1 	str	w1, [sp, #176]
    5264:	8b20c040 	add	x0, x2, w0, sxtw
    5268:	17fffcb4 	b	4538 <_vfiprintf_r+0x6d8>
    526c:	36480bfc 	tbz	w28, #9, 53e8 <_vfiprintf_r+0x1588>
    5270:	37f820a0 	tbnz	w0, #31, 5684 <_vfiprintf_r+0x1824>
    5274:	f94037e0 	ldr	x0, [sp, #104]
    5278:	91002c01 	add	x1, x0, #0xb
    527c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5280:	f90037e1 	str	x1, [sp, #104]
    5284:	39800001 	ldrsb	x1, [x0]
    5288:	aa0103e0 	mov	x0, x1
    528c:	17fffcad 	b	4540 <_vfiprintf_r+0x6e0>
    5290:	f94043e2 	ldr	x2, [sp, #128]
    5294:	b940b3e0 	ldr	w0, [sp, #176]
    5298:	b900b3e1 	str	w1, [sp, #176]
    529c:	8b20c040 	add	x0, x2, w0, sxtw
    52a0:	17fffc98 	b	4500 <_vfiprintf_r+0x6a0>
    52a4:	b940b3e0 	ldr	w0, [sp, #176]
    52a8:	11002001 	add	w1, w0, #0x8
    52ac:	7100003f 	cmp	w1, #0x0
    52b0:	540011ed 	b.le	54ec <_vfiprintf_r+0x168c>
    52b4:	f94037e0 	ldr	x0, [sp, #104]
    52b8:	b900b3e1 	str	w1, [sp, #176]
    52bc:	91002c02 	add	x2, x0, #0xb
    52c0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    52c4:	f90037e1 	str	x1, [sp, #104]
    52c8:	17fffc2b 	b	4374 <_vfiprintf_r+0x514>
    52cc:	910403e4 	add	x4, sp, #0x100
    52d0:	910423e2 	add	x2, sp, #0x108
    52d4:	aa1303e0 	mov	x0, x19
    52d8:	d2800003 	mov	x3, #0x0                   	// #0
    52dc:	d2800001 	mov	x1, #0x0                   	// #0
    52e0:	94000248 	bl	5c00 <_wcsrtombs_r>
    52e4:	2a0003f7 	mov	w23, w0
    52e8:	3100041f 	cmn	w0, #0x1
    52ec:	540017a0 	b.eq	55e0 <_vfiprintf_r+0x1780>  // b.none
    52f0:	f90087fa 	str	x26, [sp, #264]
    52f4:	17ffff5c 	b	5064 <_vfiprintf_r+0x1204>
    52f8:	52800016 	mov	w22, #0x0                   	// #0
    52fc:	52800004 	mov	w4, #0x0                   	// #0
    5300:	a906fff8 	stp	x24, xzr, [sp, #104]
    5304:	17fffc6e 	b	44bc <_vfiprintf_r+0x65c>
    5308:	f94043e2 	ldr	x2, [sp, #128]
    530c:	b940b3e1 	ldr	w1, [sp, #176]
    5310:	b900b3e0 	str	w0, [sp, #176]
    5314:	8b21c042 	add	x2, x2, w1, sxtw
    5318:	17fffcde 	b	4690 <_vfiprintf_r+0x830>
    531c:	f94043e2 	ldr	x2, [sp, #128]
    5320:	b940b3e0 	ldr	w0, [sp, #176]
    5324:	b900b3e1 	str	w1, [sp, #176]
    5328:	8b20c042 	add	x2, x2, w0, sxtw
    532c:	f94037e0 	ldr	x0, [sp, #104]
    5330:	f90037e2 	str	x2, [sp, #104]
    5334:	17fffc3d 	b	4428 <_vfiprintf_r+0x5c8>
    5338:	b940b3e0 	ldr	w0, [sp, #176]
    533c:	11002001 	add	w1, w0, #0x8
    5340:	7100003f 	cmp	w1, #0x0
    5344:	54000eed 	b.le	5520 <_vfiprintf_r+0x16c0>
    5348:	f94037e0 	ldr	x0, [sp, #104]
    534c:	b900b3e1 	str	w1, [sp, #176]
    5350:	91002c02 	add	x2, x0, #0xb
    5354:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5358:	f90037e1 	str	x1, [sp, #104]
    535c:	17fffeb5 	b	4e30 <_vfiprintf_r+0xfd0>
    5360:	f94043e3 	ldr	x3, [sp, #128]
    5364:	b940b3e2 	ldr	w2, [sp, #176]
    5368:	b900b3e1 	str	w1, [sp, #176]
    536c:	f94037f8 	ldr	x24, [sp, #104]
    5370:	8b22c062 	add	x2, x3, w2, sxtw
    5374:	f90037e2 	str	x2, [sp, #104]
    5378:	17fffbda 	b	42e0 <_vfiprintf_r+0x480>
    537c:	910643fb 	add	x27, sp, #0x190
    5380:	52800028 	mov	w8, #0x1                   	// #1
    5384:	52800001 	mov	w1, #0x0                   	// #0
    5388:	17fffb7c 	b	4178 <_vfiprintf_r+0x318>
    538c:	37f81e60 	tbnz	w0, #31, 5758 <_vfiprintf_r+0x18f8>
    5390:	f94037e0 	ldr	x0, [sp, #104]
    5394:	91003c01 	add	x1, x0, #0xf
    5398:	927df021 	and	x1, x1, #0xfffffffffffffff8
    539c:	f90037e1 	str	x1, [sp, #104]
    53a0:	f9400000 	ldr	x0, [x0]
    53a4:	7940cbe1 	ldrh	w1, [sp, #100]
    53a8:	79000001 	strh	w1, [x0]
    53ac:	17fffae4 	b	3f3c <_vfiprintf_r+0xdc>
    53b0:	37f81281 	tbnz	w1, #31, 5600 <_vfiprintf_r+0x17a0>
    53b4:	f94037e1 	ldr	x1, [sp, #104]
    53b8:	91002c22 	add	x2, x1, #0xb
    53bc:	927df042 	and	x2, x2, #0xfffffffffffffff8
    53c0:	b9400021 	ldr	w1, [x1]
    53c4:	f90037e2 	str	x2, [sp, #104]
    53c8:	17fffed1 	b	4f0c <_vfiprintf_r+0x10ac>
    53cc:	37f81460 	tbnz	w0, #31, 5658 <_vfiprintf_r+0x17f8>
    53d0:	f94037e0 	ldr	x0, [sp, #104]
    53d4:	91002c01 	add	x1, x0, #0xb
    53d8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53dc:	f90037e1 	str	x1, [sp, #104]
    53e0:	b9400001 	ldr	w1, [x0]
    53e4:	17fffc48 	b	4504 <_vfiprintf_r+0x6a4>
    53e8:	37f81cc0 	tbnz	w0, #31, 5780 <_vfiprintf_r+0x1920>
    53ec:	f94037e0 	ldr	x0, [sp, #104]
    53f0:	91002c01 	add	x1, x0, #0xb
    53f4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53f8:	f90037e1 	str	x1, [sp, #104]
    53fc:	b9800001 	ldrsw	x1, [x0]
    5400:	aa0103e0 	mov	x0, x1
    5404:	17fffc4f 	b	4540 <_vfiprintf_r+0x6e0>
    5408:	37f81680 	tbnz	w0, #31, 56d8 <_vfiprintf_r+0x1878>
    540c:	f94037e0 	ldr	x0, [sp, #104]
    5410:	91002c01 	add	x1, x0, #0xb
    5414:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5418:	f90037e1 	str	x1, [sp, #104]
    541c:	b9400001 	ldr	w1, [x0]
    5420:	52800020 	mov	w0, #0x1                   	// #1
    5424:	17fffc14 	b	4474 <_vfiprintf_r+0x614>
    5428:	9103bfe0 	add	x0, sp, #0xef
    542c:	910643fb 	add	x27, sp, #0x190
    5430:	52800028 	mov	w8, #0x1                   	// #1
    5434:	f900cbe0 	str	x0, [sp, #400]
    5438:	d2800020 	mov	x0, #0x1                   	// #1
    543c:	f900cfe0 	str	x0, [sp, #408]
    5440:	17fffb33 	b	410c <_vfiprintf_r+0x2ac>
    5444:	b940b3e1 	ldr	w1, [sp, #176]
    5448:	11002022 	add	w2, w1, #0x8
    544c:	7100005f 	cmp	w2, #0x0
    5450:	54001b6d 	b.le	57bc <_vfiprintf_r+0x195c>
    5454:	f94037e1 	ldr	x1, [sp, #104]
    5458:	b900b3e2 	str	w2, [sp, #176]
    545c:	91002c23 	add	x3, x1, #0xb
    5460:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5464:	79400021 	ldrh	w1, [x1]
    5468:	f90037e2 	str	x2, [sp, #104]
    546c:	17fffea8 	b	4f0c <_vfiprintf_r+0x10ac>
    5470:	b940b3e0 	ldr	w0, [sp, #176]
    5474:	11002001 	add	w1, w0, #0x8
    5478:	7100003f 	cmp	w1, #0x0
    547c:	54001b6d 	b.le	57e8 <_vfiprintf_r+0x1988>
    5480:	f94037e0 	ldr	x0, [sp, #104]
    5484:	b900b3e1 	str	w1, [sp, #176]
    5488:	91002c02 	add	x2, x0, #0xb
    548c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5490:	f90037e1 	str	x1, [sp, #104]
    5494:	79400001 	ldrh	w1, [x0]
    5498:	17fffc1b 	b	4504 <_vfiprintf_r+0x6a4>
    549c:	b940b3e0 	ldr	w0, [sp, #176]
    54a0:	11002001 	add	w1, w0, #0x8
    54a4:	7100003f 	cmp	w1, #0x0
    54a8:	5400196d 	b.le	57d4 <_vfiprintf_r+0x1974>
    54ac:	f94037e0 	ldr	x0, [sp, #104]
    54b0:	b900b3e1 	str	w1, [sp, #176]
    54b4:	91002c02 	add	x2, x0, #0xb
    54b8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    54bc:	f90037e1 	str	x1, [sp, #104]
    54c0:	17fffe2e 	b	4d78 <_vfiprintf_r+0xf18>
    54c4:	b940b3e0 	ldr	w0, [sp, #176]
    54c8:	11002001 	add	w1, w0, #0x8
    54cc:	7100003f 	cmp	w1, #0x0
    54d0:	540016cd 	b.le	57a8 <_vfiprintf_r+0x1948>
    54d4:	f94037e0 	ldr	x0, [sp, #104]
    54d8:	b900b3e1 	str	w1, [sp, #176]
    54dc:	91002c02 	add	x2, x0, #0xb
    54e0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    54e4:	f90037e1 	str	x1, [sp, #104]
    54e8:	17fffe13 	b	4d34 <_vfiprintf_r+0xed4>
    54ec:	f94043e2 	ldr	x2, [sp, #128]
    54f0:	b940b3e0 	ldr	w0, [sp, #176]
    54f4:	b900b3e1 	str	w1, [sp, #176]
    54f8:	8b20c040 	add	x0, x2, w0, sxtw
    54fc:	17fffb9e 	b	4374 <_vfiprintf_r+0x514>
    5500:	110006e1 	add	w1, w23, #0x1
    5504:	aa1303e0 	mov	x0, x19
    5508:	93407c21 	sxtw	x1, w1
    550c:	94000ad5 	bl	8060 <_malloc_r>
    5510:	aa0003fa 	mov	x26, x0
    5514:	b4000660 	cbz	x0, 55e0 <_vfiprintf_r+0x1780>
    5518:	f9003be0 	str	x0, [sp, #112]
    551c:	17fffed7 	b	5078 <_vfiprintf_r+0x1218>
    5520:	f94043e2 	ldr	x2, [sp, #128]
    5524:	b940b3e0 	ldr	w0, [sp, #176]
    5528:	b900b3e1 	str	w1, [sp, #176]
    552c:	8b20c040 	add	x0, x2, w0, sxtw
    5530:	17fffe40 	b	4e30 <_vfiprintf_r+0xfd0>
    5534:	2a0403f6 	mov	w22, w4
    5538:	2a0403f7 	mov	w23, w4
    553c:	52800004 	mov	w4, #0x0                   	// #0
    5540:	f90037f8 	str	x24, [sp, #104]
    5544:	17fffbde 	b	44bc <_vfiprintf_r+0x65c>
    5548:	a94a03e1 	ldp	x1, x0, [sp, #160]
    554c:	b90073e4 	str	w4, [sp, #112]
    5550:	a90917e3 	stp	x3, x5, [sp, #144]
    5554:	cb00035a 	sub	x26, x26, x0
    5558:	aa0003e2 	mov	x2, x0
    555c:	aa1a03e0 	mov	x0, x26
    5560:	9400138c 	bl	a390 <strncpy>
    5564:	39400680 	ldrb	w0, [x20, #1]
    5568:	52800008 	mov	w8, #0x0                   	// #0
    556c:	b94073e4 	ldr	w4, [sp, #112]
    5570:	7100001f 	cmp	w0, #0x0
    5574:	9a940694 	cinc	x20, x20, ne  // ne = any
    5578:	a94917e3 	ldp	x3, x5, [sp, #144]
    557c:	17fffee2 	b	5104 <_vfiprintf_r+0x12a4>
    5580:	f94043e2 	ldr	x2, [sp, #128]
    5584:	b940b3e0 	ldr	w0, [sp, #176]
    5588:	b900b3e1 	str	w1, [sp, #176]
    558c:	8b20c040 	add	x0, x2, w0, sxtw
    5590:	17fffc28 	b	4630 <_vfiprintf_r+0x7d0>
    5594:	d0000028 	adrp	x8, b000 <_findenv_r+0x10>
    5598:	2a0203eb 	mov	w11, w2
    559c:	912ec108 	add	x8, x8, #0xbb0
    55a0:	17fffd4e 	b	4ad8 <_vfiprintf_r+0xc78>
    55a4:	aa1a03e0 	mov	x0, x26
    55a8:	94001306 	bl	a1c0 <strlen>
    55ac:	7100001f 	cmp	w0, #0x0
    55b0:	2a0003f7 	mov	w23, w0
    55b4:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    55b8:	52800004 	mov	w4, #0x0                   	// #0
    55bc:	a906fff8 	stp	x24, xzr, [sp, #104]
    55c0:	17fffbbf 	b	44bc <_vfiprintf_r+0x65c>
    55c4:	d0000028 	adrp	x8, b000 <_findenv_r+0x10>
    55c8:	11000444 	add	w4, w2, #0x1
    55cc:	912ec108 	add	x8, x8, #0xbb0
    55d0:	17fffd7b 	b	4bbc <_vfiprintf_r+0xd5c>
    55d4:	12800000 	mov	w0, #0xffffffff            	// #-1
    55d8:	b90067e0 	str	w0, [sp, #100]
    55dc:	17fffb31 	b	42a0 <_vfiprintf_r+0x440>
    55e0:	79c02320 	ldrsh	w0, [x25, #16]
    55e4:	321a0000 	orr	w0, w0, #0x40
    55e8:	79002320 	strh	w0, [x25, #16]
    55ec:	17fffb2a 	b	4294 <_vfiprintf_r+0x434>
    55f0:	d0000029 	adrp	x9, b000 <_findenv_r+0x10>
    55f4:	2a0803ea 	mov	w10, w8
    55f8:	912f0129 	add	x9, x9, #0xbc0
    55fc:	17fffc90 	b	483c <_vfiprintf_r+0x9dc>
    5600:	b940b3e1 	ldr	w1, [sp, #176]
    5604:	11002022 	add	w2, w1, #0x8
    5608:	7100005f 	cmp	w2, #0x0
    560c:	540019cd 	b.le	5944 <_vfiprintf_r+0x1ae4>
    5610:	f94037e1 	ldr	x1, [sp, #104]
    5614:	b900b3e2 	str	w2, [sp, #176]
    5618:	91002c23 	add	x3, x1, #0xb
    561c:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5620:	b9400021 	ldr	w1, [x1]
    5624:	f90037e2 	str	x2, [sp, #104]
    5628:	17fffe39 	b	4f0c <_vfiprintf_r+0x10ac>
    562c:	b940b3e0 	ldr	w0, [sp, #176]
    5630:	11002001 	add	w1, w0, #0x8
    5634:	7100003f 	cmp	w1, #0x0
    5638:	540010cd 	b.le	5850 <_vfiprintf_r+0x19f0>
    563c:	f94037e0 	ldr	x0, [sp, #104]
    5640:	b900b3e1 	str	w1, [sp, #176]
    5644:	91002c02 	add	x2, x0, #0xb
    5648:	927df041 	and	x1, x2, #0xfffffffffffffff8
    564c:	f90037e1 	str	x1, [sp, #104]
    5650:	39400001 	ldrb	w1, [x0]
    5654:	17fffbac 	b	4504 <_vfiprintf_r+0x6a4>
    5658:	b940b3e0 	ldr	w0, [sp, #176]
    565c:	11002001 	add	w1, w0, #0x8
    5660:	7100003f 	cmp	w1, #0x0
    5664:	540015ad 	b.le	5918 <_vfiprintf_r+0x1ab8>
    5668:	f94037e0 	ldr	x0, [sp, #104]
    566c:	b900b3e1 	str	w1, [sp, #176]
    5670:	91002c02 	add	x2, x0, #0xb
    5674:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5678:	f90037e1 	str	x1, [sp, #104]
    567c:	b9400001 	ldr	w1, [x0]
    5680:	17fffba1 	b	4504 <_vfiprintf_r+0x6a4>
    5684:	b940b3e0 	ldr	w0, [sp, #176]
    5688:	11002001 	add	w1, w0, #0x8
    568c:	7100003f 	cmp	w1, #0x0
    5690:	54000f6d 	b.le	587c <_vfiprintf_r+0x1a1c>
    5694:	f94037e0 	ldr	x0, [sp, #104]
    5698:	b900b3e1 	str	w1, [sp, #176]
    569c:	91002c02 	add	x2, x0, #0xb
    56a0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56a4:	f90037e1 	str	x1, [sp, #104]
    56a8:	17fffef7 	b	5284 <_vfiprintf_r+0x1424>
    56ac:	b940b3e1 	ldr	w1, [sp, #176]
    56b0:	11002022 	add	w2, w1, #0x8
    56b4:	7100005f 	cmp	w2, #0x0
    56b8:	5400152d 	b.le	595c <_vfiprintf_r+0x1afc>
    56bc:	f94037e1 	ldr	x1, [sp, #104]
    56c0:	b900b3e2 	str	w2, [sp, #176]
    56c4:	91002c23 	add	x3, x1, #0xb
    56c8:	927df062 	and	x2, x3, #0xfffffffffffffff8
    56cc:	39400021 	ldrb	w1, [x1]
    56d0:	f90037e2 	str	x2, [sp, #104]
    56d4:	17fffe0e 	b	4f0c <_vfiprintf_r+0x10ac>
    56d8:	b940b3e0 	ldr	w0, [sp, #176]
    56dc:	11002001 	add	w1, w0, #0x8
    56e0:	7100003f 	cmp	w1, #0x0
    56e4:	5400106d 	b.le	58f0 <_vfiprintf_r+0x1a90>
    56e8:	f94037e0 	ldr	x0, [sp, #104]
    56ec:	b900b3e1 	str	w1, [sp, #176]
    56f0:	91002c02 	add	x2, x0, #0xb
    56f4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56f8:	f90037e1 	str	x1, [sp, #104]
    56fc:	17ffff48 	b	541c <_vfiprintf_r+0x15bc>
    5700:	b940b3e0 	ldr	w0, [sp, #176]
    5704:	11002001 	add	w1, w0, #0x8
    5708:	7100003f 	cmp	w1, #0x0
    570c:	54000e8d 	b.le	58dc <_vfiprintf_r+0x1a7c>
    5710:	f94037e0 	ldr	x0, [sp, #104]
    5714:	b900b3e1 	str	w1, [sp, #176]
    5718:	91002c02 	add	x2, x0, #0xb
    571c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5720:	f90037e1 	str	x1, [sp, #104]
    5724:	17fffeb8 	b	5204 <_vfiprintf_r+0x13a4>
    5728:	37f80800 	tbnz	w0, #31, 5828 <_vfiprintf_r+0x19c8>
    572c:	f94037e0 	ldr	x0, [sp, #104]
    5730:	91003c01 	add	x1, x0, #0xf
    5734:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5738:	f90037e1 	str	x1, [sp, #104]
    573c:	f9400000 	ldr	x0, [x0]
    5740:	b94067e1 	ldr	w1, [sp, #100]
    5744:	b9000001 	str	w1, [x0]
    5748:	17fff9fd 	b	3f3c <_vfiprintf_r+0xdc>
    574c:	2a1403f7 	mov	w23, w20
    5750:	f94037f4 	ldr	x20, [sp, #104]
    5754:	17fffe44 	b	5064 <_vfiprintf_r+0x1204>
    5758:	b940b3e0 	ldr	w0, [sp, #176]
    575c:	11002001 	add	w1, w0, #0x8
    5760:	7100003f 	cmp	w1, #0x0
    5764:	54000d0d 	b.le	5904 <_vfiprintf_r+0x1aa4>
    5768:	f94037e0 	ldr	x0, [sp, #104]
    576c:	b900b3e1 	str	w1, [sp, #176]
    5770:	91003c02 	add	x2, x0, #0xf
    5774:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5778:	f90037e1 	str	x1, [sp, #104]
    577c:	17ffff09 	b	53a0 <_vfiprintf_r+0x1540>
    5780:	b940b3e0 	ldr	w0, [sp, #176]
    5784:	11002001 	add	w1, w0, #0x8
    5788:	7100003f 	cmp	w1, #0x0
    578c:	540006ed 	b.le	5868 <_vfiprintf_r+0x1a08>
    5790:	f94037e0 	ldr	x0, [sp, #104]
    5794:	b900b3e1 	str	w1, [sp, #176]
    5798:	91002c02 	add	x2, x0, #0xb
    579c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    57a0:	f90037e1 	str	x1, [sp, #104]
    57a4:	17ffff16 	b	53fc <_vfiprintf_r+0x159c>
    57a8:	f94043e2 	ldr	x2, [sp, #128]
    57ac:	b940b3e0 	ldr	w0, [sp, #176]
    57b0:	b900b3e1 	str	w1, [sp, #176]
    57b4:	8b20c040 	add	x0, x2, w0, sxtw
    57b8:	17fffd5f 	b	4d34 <_vfiprintf_r+0xed4>
    57bc:	f94043e3 	ldr	x3, [sp, #128]
    57c0:	b940b3e1 	ldr	w1, [sp, #176]
    57c4:	b900b3e2 	str	w2, [sp, #176]
    57c8:	8b21c061 	add	x1, x3, w1, sxtw
    57cc:	79400021 	ldrh	w1, [x1]
    57d0:	17fffdcf 	b	4f0c <_vfiprintf_r+0x10ac>
    57d4:	f94043e2 	ldr	x2, [sp, #128]
    57d8:	b940b3e0 	ldr	w0, [sp, #176]
    57dc:	b900b3e1 	str	w1, [sp, #176]
    57e0:	8b20c040 	add	x0, x2, w0, sxtw
    57e4:	17fffd65 	b	4d78 <_vfiprintf_r+0xf18>
    57e8:	f94043e2 	ldr	x2, [sp, #128]
    57ec:	b940b3e0 	ldr	w0, [sp, #176]
    57f0:	b900b3e1 	str	w1, [sp, #176]
    57f4:	8b20c040 	add	x0, x2, w0, sxtw
    57f8:	79400001 	ldrh	w1, [x0]
    57fc:	17fffb42 	b	4504 <_vfiprintf_r+0x6a4>
    5800:	b940b3e0 	ldr	w0, [sp, #176]
    5804:	11002001 	add	w1, w0, #0x8
    5808:	7100003f 	cmp	w1, #0x0
    580c:	5400092d 	b.le	5930 <_vfiprintf_r+0x1ad0>
    5810:	f94037e0 	ldr	x0, [sp, #104]
    5814:	b900b3e1 	str	w1, [sp, #176]
    5818:	91003c02 	add	x2, x0, #0xf
    581c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5820:	f90037e1 	str	x1, [sp, #104]
    5824:	17fffb7a 	b	460c <_vfiprintf_r+0x7ac>
    5828:	b940b3e0 	ldr	w0, [sp, #176]
    582c:	11002001 	add	w1, w0, #0x8
    5830:	7100003f 	cmp	w1, #0x0
    5834:	540002ed 	b.le	5890 <_vfiprintf_r+0x1a30>
    5838:	f94037e0 	ldr	x0, [sp, #104]
    583c:	b900b3e1 	str	w1, [sp, #176]
    5840:	91003c02 	add	x2, x0, #0xf
    5844:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5848:	f90037e1 	str	x1, [sp, #104]
    584c:	17ffffbc 	b	573c <_vfiprintf_r+0x18dc>
    5850:	f94043e2 	ldr	x2, [sp, #128]
    5854:	b940b3e0 	ldr	w0, [sp, #176]
    5858:	b900b3e1 	str	w1, [sp, #176]
    585c:	8b20c040 	add	x0, x2, w0, sxtw
    5860:	39400001 	ldrb	w1, [x0]
    5864:	17fffb28 	b	4504 <_vfiprintf_r+0x6a4>
    5868:	f94043e2 	ldr	x2, [sp, #128]
    586c:	b940b3e0 	ldr	w0, [sp, #176]
    5870:	b900b3e1 	str	w1, [sp, #176]
    5874:	8b20c040 	add	x0, x2, w0, sxtw
    5878:	17fffee1 	b	53fc <_vfiprintf_r+0x159c>
    587c:	f94043e2 	ldr	x2, [sp, #128]
    5880:	b940b3e0 	ldr	w0, [sp, #176]
    5884:	b900b3e1 	str	w1, [sp, #176]
    5888:	8b20c040 	add	x0, x2, w0, sxtw
    588c:	17fffe7e 	b	5284 <_vfiprintf_r+0x1424>
    5890:	f94043e2 	ldr	x2, [sp, #128]
    5894:	b940b3e0 	ldr	w0, [sp, #176]
    5898:	b900b3e1 	str	w1, [sp, #176]
    589c:	8b20c040 	add	x0, x2, w0, sxtw
    58a0:	17ffffa7 	b	573c <_vfiprintf_r+0x18dc>
    58a4:	b940b3e0 	ldr	w0, [sp, #176]
    58a8:	37f80660 	tbnz	w0, #31, 5974 <_vfiprintf_r+0x1b14>
    58ac:	f94037e1 	ldr	x1, [sp, #104]
    58b0:	91002c21 	add	x1, x1, #0xb
    58b4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    58b8:	f94037e3 	ldr	x3, [sp, #104]
    58bc:	f90037e1 	str	x1, [sp, #104]
    58c0:	b900b3e0 	str	w0, [sp, #176]
    58c4:	39400680 	ldrb	w0, [x20, #1]
    58c8:	aa0203f4 	mov	x20, x2
    58cc:	b9400064 	ldr	w4, [x3]
    58d0:	7100009f 	cmp	w4, #0x0
    58d4:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    58d8:	17fff9e8 	b	4078 <_vfiprintf_r+0x218>
    58dc:	f94043e2 	ldr	x2, [sp, #128]
    58e0:	b940b3e0 	ldr	w0, [sp, #176]
    58e4:	b900b3e1 	str	w1, [sp, #176]
    58e8:	8b20c040 	add	x0, x2, w0, sxtw
    58ec:	17fffe46 	b	5204 <_vfiprintf_r+0x13a4>
    58f0:	f94043e2 	ldr	x2, [sp, #128]
    58f4:	b940b3e0 	ldr	w0, [sp, #176]
    58f8:	b900b3e1 	str	w1, [sp, #176]
    58fc:	8b20c040 	add	x0, x2, w0, sxtw
    5900:	17fffec7 	b	541c <_vfiprintf_r+0x15bc>
    5904:	f94043e2 	ldr	x2, [sp, #128]
    5908:	b940b3e0 	ldr	w0, [sp, #176]
    590c:	b900b3e1 	str	w1, [sp, #176]
    5910:	8b20c040 	add	x0, x2, w0, sxtw
    5914:	17fffea3 	b	53a0 <_vfiprintf_r+0x1540>
    5918:	f94043e2 	ldr	x2, [sp, #128]
    591c:	b940b3e0 	ldr	w0, [sp, #176]
    5920:	b900b3e1 	str	w1, [sp, #176]
    5924:	8b20c040 	add	x0, x2, w0, sxtw
    5928:	b9400001 	ldr	w1, [x0]
    592c:	17fffaf6 	b	4504 <_vfiprintf_r+0x6a4>
    5930:	f94043e2 	ldr	x2, [sp, #128]
    5934:	b940b3e0 	ldr	w0, [sp, #176]
    5938:	b900b3e1 	str	w1, [sp, #176]
    593c:	8b20c040 	add	x0, x2, w0, sxtw
    5940:	17fffb33 	b	460c <_vfiprintf_r+0x7ac>
    5944:	f94043e3 	ldr	x3, [sp, #128]
    5948:	b940b3e1 	ldr	w1, [sp, #176]
    594c:	b900b3e2 	str	w2, [sp, #176]
    5950:	8b21c061 	add	x1, x3, w1, sxtw
    5954:	b9400021 	ldr	w1, [x1]
    5958:	17fffd6d 	b	4f0c <_vfiprintf_r+0x10ac>
    595c:	f94043e3 	ldr	x3, [sp, #128]
    5960:	b940b3e1 	ldr	w1, [sp, #176]
    5964:	b900b3e2 	str	w2, [sp, #176]
    5968:	8b21c061 	add	x1, x3, w1, sxtw
    596c:	39400021 	ldrb	w1, [x1]
    5970:	17fffd67 	b	4f0c <_vfiprintf_r+0x10ac>
    5974:	b940b3e0 	ldr	w0, [sp, #176]
    5978:	f94037e1 	ldr	x1, [sp, #104]
    597c:	11002000 	add	w0, w0, #0x8
    5980:	7100001f 	cmp	w0, #0x0
    5984:	5400010d 	b.le	59a4 <_vfiprintf_r+0x1b44>
    5988:	91002c21 	add	x1, x1, #0xb
    598c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5990:	17ffffca 	b	58b8 <_vfiprintf_r+0x1a58>
    5994:	79402320 	ldrh	w0, [x25, #16]
    5998:	321a0000 	orr	w0, w0, #0x40
    599c:	79002320 	strh	w0, [x25, #16]
    59a0:	17fffa37 	b	427c <_vfiprintf_r+0x41c>
    59a4:	f94043e4 	ldr	x4, [sp, #128]
    59a8:	b940b3e3 	ldr	w3, [sp, #176]
    59ac:	8b23c083 	add	x3, x4, w3, sxtw
    59b0:	f90037e3 	str	x3, [sp, #104]
    59b4:	17ffffc1 	b	58b8 <_vfiprintf_r+0x1a58>
    59b8:	d503201f 	nop
    59bc:	d503201f 	nop

00000000000059c0 <vfiprintf>:
    59c0:	aa0203e4 	mov	x4, x2
    59c4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    59c8:	f0000023 	adrp	x3, c000 <JIS_state_table+0x10>
    59cc:	910003fd 	mov	x29, sp
    59d0:	a9401c46 	ldp	x6, x7, [x2]
    59d4:	aa0003e8 	mov	x8, x0
    59d8:	a9411484 	ldp	x4, x5, [x4, #16]
    59dc:	aa0103e2 	mov	x2, x1
    59e0:	f944bc60 	ldr	x0, [x3, #2424]
    59e4:	aa0803e1 	mov	x1, x8
    59e8:	910043e3 	add	x3, sp, #0x10
    59ec:	a9011fe6 	stp	x6, x7, [sp, #16]
    59f0:	a90217e4 	stp	x4, x5, [sp, #32]
    59f4:	97fff91b 	bl	3e60 <_vfiprintf_r>
    59f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    59fc:	d65f03c0 	ret

0000000000005a00 <__sbprintf>:
    5a00:	d11403ff 	sub	sp, sp, #0x500
    5a04:	52808005 	mov	w5, #0x400                 	// #1024
    5a08:	910403e6 	add	x6, sp, #0x100
    5a0c:	a9007bfd 	stp	x29, x30, [sp]
    5a10:	910003fd 	mov	x29, sp
    5a14:	a90153f3 	stp	x19, x20, [sp, #16]
    5a18:	aa0103f3 	mov	x19, x1
    5a1c:	aa0303e1 	mov	x1, x3
    5a20:	9100c3e3 	add	x3, sp, #0x30
    5a24:	f9002be6 	str	x6, [sp, #80]
    5a28:	79402264 	ldrh	w4, [x19, #16]
    5a2c:	a9403c2e 	ldp	x14, x15, [x1]
    5a30:	121e7884 	and	w4, w4, #0xfffffffd
    5a34:	7940266c 	ldrh	w12, [x19, #18]
    5a38:	a9412428 	ldp	x8, x9, [x1, #16]
    5a3c:	910143e1 	add	x1, sp, #0x50
    5a40:	f9401a6b 	ldr	x11, [x19, #48]
    5a44:	b9005fe5 	str	w5, [sp, #92]
    5a48:	f940226a 	ldr	x10, [x19, #64]
    5a4c:	a9033fee 	stp	x14, x15, [sp, #48]
    5a50:	b940ae67 	ldr	w7, [x19, #172]
    5a54:	f90013f5 	str	x21, [sp, #32]
    5a58:	aa0003f5 	mov	x21, x0
    5a5c:	a90427e8 	stp	x8, x9, [sp, #64]
    5a60:	7900c3e4 	strh	w4, [sp, #96]
    5a64:	7900c7ec 	strh	w12, [sp, #98]
    5a68:	f90037e6 	str	x6, [sp, #104]
    5a6c:	b90073e5 	str	w5, [sp, #112]
    5a70:	b9007bff 	str	wzr, [sp, #120]
    5a74:	f90043eb 	str	x11, [sp, #128]
    5a78:	f9004bea 	str	x10, [sp, #144]
    5a7c:	b900ffe7 	str	w7, [sp, #252]
    5a80:	97fff8f8 	bl	3e60 <_vfiprintf_r>
    5a84:	2a0003f4 	mov	w20, w0
    5a88:	37f800c0 	tbnz	w0, #31, 5aa0 <__sbprintf+0xa0>
    5a8c:	910143e1 	add	x1, sp, #0x50
    5a90:	aa1503e0 	mov	x0, x21
    5a94:	9400017b 	bl	6080 <_fflush_r>
    5a98:	7100001f 	cmp	w0, #0x0
    5a9c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    5aa0:	7940c3e0 	ldrh	w0, [sp, #96]
    5aa4:	36300080 	tbz	w0, #6, 5ab4 <__sbprintf+0xb4>
    5aa8:	79402260 	ldrh	w0, [x19, #16]
    5aac:	321a0000 	orr	w0, w0, #0x40
    5ab0:	79002260 	strh	w0, [x19, #16]
    5ab4:	2a1403e0 	mov	w0, w20
    5ab8:	a9407bfd 	ldp	x29, x30, [sp]
    5abc:	a94153f3 	ldp	x19, x20, [sp, #16]
    5ac0:	f94013f5 	ldr	x21, [sp, #32]
    5ac4:	911403ff 	add	sp, sp, #0x500
    5ac8:	d65f03c0 	ret
    5acc:	d503201f 	nop

0000000000005ad0 <_wcrtomb_r>:
    5ad0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5ad4:	91055004 	add	x4, x0, #0x154
    5ad8:	910003fd 	mov	x29, sp
    5adc:	a90153f3 	stp	x19, x20, [sp, #16]
    5ae0:	aa0303f3 	mov	x19, x3
    5ae4:	f100027f 	cmp	x19, #0x0
    5ae8:	90000043 	adrp	x3, d000 <impure_data+0x680>
    5aec:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    5af0:	aa0003f4 	mov	x20, x0
    5af4:	f940e464 	ldr	x4, [x3, #456]
    5af8:	aa1303e3 	mov	x3, x19
    5afc:	b4000121 	cbz	x1, 5b20 <_wcrtomb_r+0x50>
    5b00:	d63f0080 	blr	x4
    5b04:	2a0003e1 	mov	w1, w0
    5b08:	93407c20 	sxtw	x0, w1
    5b0c:	3100043f 	cmn	w1, #0x1
    5b10:	54000160 	b.eq	5b3c <_wcrtomb_r+0x6c>  // b.none
    5b14:	a94153f3 	ldp	x19, x20, [sp, #16]
    5b18:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5b1c:	d65f03c0 	ret
    5b20:	910083e1 	add	x1, sp, #0x20
    5b24:	52800002 	mov	w2, #0x0                   	// #0
    5b28:	d63f0080 	blr	x4
    5b2c:	2a0003e1 	mov	w1, w0
    5b30:	93407c20 	sxtw	x0, w1
    5b34:	3100043f 	cmn	w1, #0x1
    5b38:	54fffee1 	b.ne	5b14 <_wcrtomb_r+0x44>  // b.any
    5b3c:	b900027f 	str	wzr, [x19]
    5b40:	52801141 	mov	w1, #0x8a                  	// #138
    5b44:	b9000281 	str	w1, [x20]
    5b48:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5b4c:	a94153f3 	ldp	x19, x20, [sp, #16]
    5b50:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5b54:	d65f03c0 	ret
    5b58:	d503201f 	nop
    5b5c:	d503201f 	nop

0000000000005b60 <wcrtomb>:
    5b60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5b64:	f0000024 	adrp	x4, c000 <JIS_state_table+0x10>
    5b68:	90000043 	adrp	x3, d000 <impure_data+0x680>
    5b6c:	910003fd 	mov	x29, sp
    5b70:	a90153f3 	stp	x19, x20, [sp, #16]
    5b74:	f100005f 	cmp	x2, #0x0
    5b78:	f944bc94 	ldr	x20, [x4, #2424]
    5b7c:	91055284 	add	x4, x20, #0x154
    5b80:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    5b84:	f940e464 	ldr	x4, [x3, #456]
    5b88:	b40001a0 	cbz	x0, 5bbc <wcrtomb+0x5c>
    5b8c:	2a0103e2 	mov	w2, w1
    5b90:	aa0003e1 	mov	x1, x0
    5b94:	aa1303e3 	mov	x3, x19
    5b98:	aa1403e0 	mov	x0, x20
    5b9c:	d63f0080 	blr	x4
    5ba0:	2a0003e1 	mov	w1, w0
    5ba4:	93407c20 	sxtw	x0, w1
    5ba8:	3100043f 	cmn	w1, #0x1
    5bac:	540001a0 	b.eq	5be0 <wcrtomb+0x80>  // b.none
    5bb0:	a94153f3 	ldp	x19, x20, [sp, #16]
    5bb4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5bb8:	d65f03c0 	ret
    5bbc:	910083e1 	add	x1, sp, #0x20
    5bc0:	aa1303e3 	mov	x3, x19
    5bc4:	aa1403e0 	mov	x0, x20
    5bc8:	52800002 	mov	w2, #0x0                   	// #0
    5bcc:	d63f0080 	blr	x4
    5bd0:	2a0003e1 	mov	w1, w0
    5bd4:	93407c20 	sxtw	x0, w1
    5bd8:	3100043f 	cmn	w1, #0x1
    5bdc:	54fffea1 	b.ne	5bb0 <wcrtomb+0x50>  // b.any
    5be0:	b900027f 	str	wzr, [x19]
    5be4:	52801141 	mov	w1, #0x8a                  	// #138
    5be8:	b9000281 	str	w1, [x20]
    5bec:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5bf0:	a94153f3 	ldp	x19, x20, [sp, #16]
    5bf4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5bf8:	d65f03c0 	ret
    5bfc:	d503201f 	nop

0000000000005c00 <_wcsrtombs_r>:
    5c00:	aa0403e5 	mov	x5, x4
    5c04:	aa0303e4 	mov	x4, x3
    5c08:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5c0c:	14001365 	b	a9a0 <_wcsnrtombs_r>

0000000000005c10 <wcsrtombs>:
    5c10:	f0000026 	adrp	x6, c000 <JIS_state_table+0x10>
    5c14:	aa0003e4 	mov	x4, x0
    5c18:	aa0103e5 	mov	x5, x1
    5c1c:	aa0403e1 	mov	x1, x4
    5c20:	f944bcc0 	ldr	x0, [x6, #2424]
    5c24:	aa0203e4 	mov	x4, x2
    5c28:	aa0503e2 	mov	x2, x5
    5c2c:	aa0303e5 	mov	x5, x3
    5c30:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5c34:	1400135b 	b	a9a0 <_wcsnrtombs_r>
    5c38:	d503201f 	nop
    5c3c:	d503201f 	nop

0000000000005c40 <__swsetup_r>:
    5c40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    5c44:	f0000022 	adrp	x2, c000 <JIS_state_table+0x10>
    5c48:	910003fd 	mov	x29, sp
    5c4c:	a90153f3 	stp	x19, x20, [sp, #16]
    5c50:	aa0003f4 	mov	x20, x0
    5c54:	aa0103f3 	mov	x19, x1
    5c58:	f944bc40 	ldr	x0, [x2, #2424]
    5c5c:	b4000060 	cbz	x0, 5c68 <__swsetup_r+0x28>
    5c60:	b9405001 	ldr	w1, [x0, #80]
    5c64:	340004e1 	cbz	w1, 5d00 <__swsetup_r+0xc0>
    5c68:	79c02262 	ldrsh	w2, [x19, #16]
    5c6c:	12003c41 	and	w1, w2, #0xffff
    5c70:	36180502 	tbz	w2, #3, 5d10 <__swsetup_r+0xd0>
    5c74:	f9400e63 	ldr	x3, [x19, #24]
    5c78:	b40002c3 	cbz	x3, 5cd0 <__swsetup_r+0x90>
    5c7c:	36000141 	tbz	w1, #0, 5ca4 <__swsetup_r+0x64>
    5c80:	b9402260 	ldr	w0, [x19, #32]
    5c84:	b9000e7f 	str	wzr, [x19, #12]
    5c88:	4b0003e0 	neg	w0, w0
    5c8c:	b9002a60 	str	w0, [x19, #40]
    5c90:	52800000 	mov	w0, #0x0                   	// #0
    5c94:	b4000143 	cbz	x3, 5cbc <__swsetup_r+0x7c>
    5c98:	a94153f3 	ldp	x19, x20, [sp, #16]
    5c9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5ca0:	d65f03c0 	ret
    5ca4:	52800000 	mov	w0, #0x0                   	// #0
    5ca8:	37080041 	tbnz	w1, #1, 5cb0 <__swsetup_r+0x70>
    5cac:	b9402260 	ldr	w0, [x19, #32]
    5cb0:	b9000e60 	str	w0, [x19, #12]
    5cb4:	52800000 	mov	w0, #0x0                   	// #0
    5cb8:	b5ffff03 	cbnz	x3, 5c98 <__swsetup_r+0x58>
    5cbc:	363ffee1 	tbz	w1, #7, 5c98 <__swsetup_r+0x58>
    5cc0:	321a0042 	orr	w2, w2, #0x40
    5cc4:	12800000 	mov	w0, #0xffffffff            	// #-1
    5cc8:	79002262 	strh	w2, [x19, #16]
    5ccc:	17fffff3 	b	5c98 <__swsetup_r+0x58>
    5cd0:	52805000 	mov	w0, #0x280                 	// #640
    5cd4:	0a000020 	and	w0, w1, w0
    5cd8:	7108001f 	cmp	w0, #0x200
    5cdc:	54fffd00 	b.eq	5c7c <__swsetup_r+0x3c>  // b.none
    5ce0:	aa1303e1 	mov	x1, x19
    5ce4:	aa1403e0 	mov	x0, x20
    5ce8:	9400085a 	bl	7e50 <__smakebuf_r>
    5cec:	79c02262 	ldrsh	w2, [x19, #16]
    5cf0:	f9400e63 	ldr	x3, [x19, #24]
    5cf4:	12003c41 	and	w1, w2, #0xffff
    5cf8:	3607fd61 	tbz	w1, #0, 5ca4 <__swsetup_r+0x64>
    5cfc:	17ffffe1 	b	5c80 <__swsetup_r+0x40>
    5d00:	940001e0 	bl	6480 <__sinit>
    5d04:	79c02262 	ldrsh	w2, [x19, #16]
    5d08:	12003c41 	and	w1, w2, #0xffff
    5d0c:	371ffb42 	tbnz	w2, #3, 5c74 <__swsetup_r+0x34>
    5d10:	362002e1 	tbz	w1, #4, 5d6c <__swsetup_r+0x12c>
    5d14:	371000e1 	tbnz	w1, #2, 5d30 <__swsetup_r+0xf0>
    5d18:	f9400e63 	ldr	x3, [x19, #24]
    5d1c:	321d0042 	orr	w2, w2, #0x8
    5d20:	79002262 	strh	w2, [x19, #16]
    5d24:	12003c41 	and	w1, w2, #0xffff
    5d28:	b5fffaa3 	cbnz	x3, 5c7c <__swsetup_r+0x3c>
    5d2c:	17ffffe9 	b	5cd0 <__swsetup_r+0x90>
    5d30:	f9402e61 	ldr	x1, [x19, #88]
    5d34:	b4000101 	cbz	x1, 5d54 <__swsetup_r+0x114>
    5d38:	9101d260 	add	x0, x19, #0x74
    5d3c:	eb00003f 	cmp	x1, x0
    5d40:	54000080 	b.eq	5d50 <__swsetup_r+0x110>  // b.none
    5d44:	aa1403e0 	mov	x0, x20
    5d48:	940002a6 	bl	67e0 <_free_r>
    5d4c:	79c02262 	ldrsh	w2, [x19, #16]
    5d50:	f9002e7f 	str	xzr, [x19, #88]
    5d54:	f9400e63 	ldr	x3, [x19, #24]
    5d58:	12800480 	mov	w0, #0xffffffdb            	// #-37
    5d5c:	0a000042 	and	w2, w2, w0
    5d60:	f9000263 	str	x3, [x19]
    5d64:	b9000a7f 	str	wzr, [x19, #8]
    5d68:	17ffffed 	b	5d1c <__swsetup_r+0xdc>
    5d6c:	52800120 	mov	w0, #0x9                   	// #9
    5d70:	b9000280 	str	w0, [x20]
    5d74:	321a0042 	orr	w2, w2, #0x40
    5d78:	12800000 	mov	w0, #0xffffffff            	// #-1
    5d7c:	79002262 	strh	w2, [x19, #16]
    5d80:	17ffffc6 	b	5c98 <__swsetup_r+0x58>
    5d84:	d503201f 	nop
    5d88:	d503201f 	nop
    5d8c:	d503201f 	nop

0000000000005d90 <abort>:
    5d90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5d94:	528000c0 	mov	w0, #0x6                   	// #6
    5d98:	910003fd 	mov	x29, sp
    5d9c:	94000ec1 	bl	98a0 <raise>
    5da0:	52800020 	mov	w0, #0x1                   	// #1
    5da4:	97fff617 	bl	3600 <_exit>
    5da8:	d503201f 	nop
    5dac:	d503201f 	nop

0000000000005db0 <__register_exitproc>:
    5db0:	d0000024 	adrp	x4, b000 <_findenv_r+0x10>
    5db4:	f9454c84 	ldr	x4, [x4, #2712]
    5db8:	f940fc85 	ldr	x5, [x4, #504]
    5dbc:	b4000405 	cbz	x5, 5e3c <__register_exitproc+0x8c>
    5dc0:	b94008a4 	ldr	w4, [x5, #8]
    5dc4:	71007c9f 	cmp	w4, #0x1f
    5dc8:	5400040c 	b.gt	5e48 <__register_exitproc+0x98>
    5dcc:	93407c86 	sxtw	x6, w4
    5dd0:	350000e0 	cbnz	w0, 5dec <__register_exitproc+0x3c>
    5dd4:	910008c2 	add	x2, x6, #0x2
    5dd8:	11000484 	add	w4, w4, #0x1
    5ddc:	b90008a4 	str	w4, [x5, #8]
    5de0:	52800000 	mov	w0, #0x0                   	// #0
    5de4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    5de8:	d65f03c0 	ret
    5dec:	8b24cca7 	add	x7, x5, w4, sxtw #3
    5df0:	52800028 	mov	w8, #0x1                   	// #1
    5df4:	1ac42108 	lsl	w8, w8, w4
    5df8:	93407c86 	sxtw	x6, w4
    5dfc:	f90088e2 	str	x2, [x7, #272]
    5e00:	b94310a2 	ldr	w2, [x5, #784]
    5e04:	2a080042 	orr	w2, w2, w8
    5e08:	b90310a2 	str	w2, [x5, #784]
    5e0c:	f90108e3 	str	x3, [x7, #528]
    5e10:	7100081f 	cmp	w0, #0x2
    5e14:	54fffe01 	b.ne	5dd4 <__register_exitproc+0x24>  // b.any
    5e18:	b94314a0 	ldr	w0, [x5, #788]
    5e1c:	910008c2 	add	x2, x6, #0x2
    5e20:	11000484 	add	w4, w4, #0x1
    5e24:	b90008a4 	str	w4, [x5, #8]
    5e28:	2a080008 	orr	w8, w0, w8
    5e2c:	b90314a8 	str	w8, [x5, #788]
    5e30:	52800000 	mov	w0, #0x0                   	// #0
    5e34:	f82278a1 	str	x1, [x5, x2, lsl #3]
    5e38:	17ffffec 	b	5de8 <__register_exitproc+0x38>
    5e3c:	91080085 	add	x5, x4, #0x200
    5e40:	f900fc85 	str	x5, [x4, #504]
    5e44:	17ffffdf 	b	5dc0 <__register_exitproc+0x10>
    5e48:	12800000 	mov	w0, #0xffffffff            	// #-1
    5e4c:	d65f03c0 	ret

0000000000005e50 <__sflush_r>:
    5e50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5e54:	910003fd 	mov	x29, sp
    5e58:	a9025bf5 	stp	x21, x22, [sp, #32]
    5e5c:	aa0003f6 	mov	x22, x0
    5e60:	79c02020 	ldrsh	w0, [x1, #16]
    5e64:	a90153f3 	stp	x19, x20, [sp, #16]
    5e68:	aa0103f3 	mov	x19, x1
    5e6c:	37180560 	tbnz	w0, #3, 5f18 <__sflush_r+0xc8>
    5e70:	32150000 	orr	w0, w0, #0x800
    5e74:	79002020 	strh	w0, [x1, #16]
    5e78:	b9400821 	ldr	w1, [x1, #8]
    5e7c:	7100003f 	cmp	w1, #0x0
    5e80:	5400092d 	b.le	5fa4 <__sflush_r+0x154>
    5e84:	f9402664 	ldr	x4, [x19, #72]
    5e88:	b4000944 	cbz	x4, 5fb0 <__sflush_r+0x160>
    5e8c:	b94002d4 	ldr	w20, [x22]
    5e90:	12003c01 	and	w1, w0, #0xffff
    5e94:	b90002df 	str	wzr, [x22]
    5e98:	37600960 	tbnz	w0, #12, 5fc4 <__sflush_r+0x174>
    5e9c:	f9401a61 	ldr	x1, [x19, #48]
    5ea0:	d2800002 	mov	x2, #0x0                   	// #0
    5ea4:	aa1603e0 	mov	x0, x22
    5ea8:	52800023 	mov	w3, #0x1                   	// #1
    5eac:	d63f0080 	blr	x4
    5eb0:	aa0003e2 	mov	x2, x0
    5eb4:	b100041f 	cmn	x0, #0x1
    5eb8:	54000d00 	b.eq	6058 <__sflush_r+0x208>  // b.none
    5ebc:	79402261 	ldrh	w1, [x19, #16]
    5ec0:	f9402664 	ldr	x4, [x19, #72]
    5ec4:	361000e1 	tbz	w1, #2, 5ee0 <__sflush_r+0x90>
    5ec8:	f9402e60 	ldr	x0, [x19, #88]
    5ecc:	b9800a61 	ldrsw	x1, [x19, #8]
    5ed0:	cb010042 	sub	x2, x2, x1
    5ed4:	b4000060 	cbz	x0, 5ee0 <__sflush_r+0x90>
    5ed8:	b9807260 	ldrsw	x0, [x19, #112]
    5edc:	cb000042 	sub	x2, x2, x0
    5ee0:	f9401a61 	ldr	x1, [x19, #48]
    5ee4:	aa1603e0 	mov	x0, x22
    5ee8:	52800003 	mov	w3, #0x0                   	// #0
    5eec:	d63f0080 	blr	x4
    5ef0:	b100041f 	cmn	x0, #0x1
    5ef4:	540006c1 	b.ne	5fcc <__sflush_r+0x17c>  // b.any
    5ef8:	b94002c2 	ldr	w2, [x22]
    5efc:	7100745f 	cmp	w2, #0x1d
    5f00:	54000929 	b.ls	6024 <__sflush_r+0x1d4>  // b.plast
    5f04:	79c02261 	ldrsh	w1, [x19, #16]
    5f08:	321a0021 	orr	w1, w1, #0x40
    5f0c:	12800000 	mov	w0, #0xffffffff            	// #-1
    5f10:	79002261 	strh	w1, [x19, #16]
    5f14:	14000028 	b	5fb4 <__sflush_r+0x164>
    5f18:	f9400c35 	ldr	x21, [x1, #24]
    5f1c:	b40004b5 	cbz	x21, 5fb0 <__sflush_r+0x160>
    5f20:	12003c01 	and	w1, w0, #0xffff
    5f24:	52800002 	mov	w2, #0x0                   	// #0
    5f28:	f9400260 	ldr	x0, [x19]
    5f2c:	f9000275 	str	x21, [x19]
    5f30:	cb150000 	sub	x0, x0, x21
    5f34:	2a0003f4 	mov	w20, w0
    5f38:	f240043f 	tst	x1, #0x3
    5f3c:	54000041 	b.ne	5f44 <__sflush_r+0xf4>  // b.any
    5f40:	b9402262 	ldr	w2, [x19, #32]
    5f44:	b9000e62 	str	w2, [x19, #12]
    5f48:	7100001f 	cmp	w0, #0x0
    5f4c:	540000ac 	b.gt	5f60 <__sflush_r+0x110>
    5f50:	14000018 	b	5fb0 <__sflush_r+0x160>
    5f54:	8b20c2b5 	add	x21, x21, w0, sxtw
    5f58:	7100029f 	cmp	w20, #0x0
    5f5c:	540002ad 	b.le	5fb0 <__sflush_r+0x160>
    5f60:	f9401a61 	ldr	x1, [x19, #48]
    5f64:	2a1403e3 	mov	w3, w20
    5f68:	f9402264 	ldr	x4, [x19, #64]
    5f6c:	aa1503e2 	mov	x2, x21
    5f70:	aa1603e0 	mov	x0, x22
    5f74:	d63f0080 	blr	x4
    5f78:	4b000294 	sub	w20, w20, w0
    5f7c:	7100001f 	cmp	w0, #0x0
    5f80:	54fffeac 	b.gt	5f54 <__sflush_r+0x104>
    5f84:	79402261 	ldrh	w1, [x19, #16]
    5f88:	12800000 	mov	w0, #0xffffffff            	// #-1
    5f8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5f90:	321a0021 	orr	w1, w1, #0x40
    5f94:	79002261 	strh	w1, [x19, #16]
    5f98:	a94153f3 	ldp	x19, x20, [sp, #16]
    5f9c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5fa0:	d65f03c0 	ret
    5fa4:	b9407261 	ldr	w1, [x19, #112]
    5fa8:	7100003f 	cmp	w1, #0x0
    5fac:	54fff6cc 	b.gt	5e84 <__sflush_r+0x34>
    5fb0:	52800000 	mov	w0, #0x0                   	// #0
    5fb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    5fb8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5fbc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5fc0:	d65f03c0 	ret
    5fc4:	f9404a62 	ldr	x2, [x19, #144]
    5fc8:	17ffffbf 	b	5ec4 <__sflush_r+0x74>
    5fcc:	79c02261 	ldrsh	w1, [x19, #16]
    5fd0:	f9400e62 	ldr	x2, [x19, #24]
    5fd4:	12147821 	and	w1, w1, #0xfffff7ff
    5fd8:	f9000262 	str	x2, [x19]
    5fdc:	b9000a7f 	str	wzr, [x19, #8]
    5fe0:	79002261 	strh	w1, [x19, #16]
    5fe4:	36600041 	tbz	w1, #12, 5fec <__sflush_r+0x19c>
    5fe8:	f9004a60 	str	x0, [x19, #144]
    5fec:	f9402e61 	ldr	x1, [x19, #88]
    5ff0:	b90002d4 	str	w20, [x22]
    5ff4:	b4fffde1 	cbz	x1, 5fb0 <__sflush_r+0x160>
    5ff8:	9101d260 	add	x0, x19, #0x74
    5ffc:	eb00003f 	cmp	x1, x0
    6000:	54000060 	b.eq	600c <__sflush_r+0x1bc>  // b.none
    6004:	aa1603e0 	mov	x0, x22
    6008:	940001f6 	bl	67e0 <_free_r>
    600c:	f9002e7f 	str	xzr, [x19, #88]
    6010:	52800000 	mov	w0, #0x0                   	// #0
    6014:	a94153f3 	ldp	x19, x20, [sp, #16]
    6018:	a9425bf5 	ldp	x21, x22, [sp, #32]
    601c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6020:	d65f03c0 	ret
    6024:	d2800023 	mov	x3, #0x1                   	// #1
    6028:	79c02261 	ldrsh	w1, [x19, #16]
    602c:	f2a40803 	movk	x3, #0x2040, lsl #16
    6030:	9ac22463 	lsr	x3, x3, x2
    6034:	3607f6a3 	tbz	w3, #0, 5f08 <__sflush_r+0xb8>
    6038:	f9400e63 	ldr	x3, [x19, #24]
    603c:	12147821 	and	w1, w1, #0xfffff7ff
    6040:	f9000263 	str	x3, [x19]
    6044:	b9000a7f 	str	wzr, [x19, #8]
    6048:	79002261 	strh	w1, [x19, #16]
    604c:	3667fd01 	tbz	w1, #12, 5fec <__sflush_r+0x19c>
    6050:	35fffce2 	cbnz	w2, 5fec <__sflush_r+0x19c>
    6054:	17ffffe5 	b	5fe8 <__sflush_r+0x198>
    6058:	b94002c0 	ldr	w0, [x22]
    605c:	34fff300 	cbz	w0, 5ebc <__sflush_r+0x6c>
    6060:	7100741f 	cmp	w0, #0x1d
    6064:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    6068:	54fff8e1 	b.ne	5f84 <__sflush_r+0x134>  // b.any
    606c:	52800000 	mov	w0, #0x0                   	// #0
    6070:	b90002d4 	str	w20, [x22]
    6074:	17ffffd0 	b	5fb4 <__sflush_r+0x164>
    6078:	d503201f 	nop
    607c:	d503201f 	nop

0000000000006080 <_fflush_r>:
    6080:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6084:	910003fd 	mov	x29, sp
    6088:	f9000bf3 	str	x19, [sp, #16]
    608c:	aa0003f3 	mov	x19, x0
    6090:	b4000060 	cbz	x0, 609c <_fflush_r+0x1c>
    6094:	b9405002 	ldr	w2, [x0, #80]
    6098:	340000e2 	cbz	w2, 60b4 <_fflush_r+0x34>
    609c:	79c02020 	ldrsh	w0, [x1, #16]
    60a0:	35000140 	cbnz	w0, 60c8 <_fflush_r+0x48>
    60a4:	52800000 	mov	w0, #0x0                   	// #0
    60a8:	f9400bf3 	ldr	x19, [sp, #16]
    60ac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    60b0:	d65f03c0 	ret
    60b4:	f90017e1 	str	x1, [sp, #40]
    60b8:	940000f2 	bl	6480 <__sinit>
    60bc:	f94017e1 	ldr	x1, [sp, #40]
    60c0:	79c02020 	ldrsh	w0, [x1, #16]
    60c4:	34ffff00 	cbz	w0, 60a4 <_fflush_r+0x24>
    60c8:	aa1303e0 	mov	x0, x19
    60cc:	f9400bf3 	ldr	x19, [sp, #16]
    60d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    60d4:	17ffff5f 	b	5e50 <__sflush_r>
    60d8:	d503201f 	nop
    60dc:	d503201f 	nop

00000000000060e0 <fflush>:
    60e0:	b4000340 	cbz	x0, 6148 <fflush+0x68>
    60e4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    60e8:	910003fd 	mov	x29, sp
    60ec:	a90153f3 	stp	x19, x20, [sp, #16]
    60f0:	aa0003f3 	mov	x19, x0
    60f4:	d0000020 	adrp	x0, c000 <JIS_state_table+0x10>
    60f8:	f944bc14 	ldr	x20, [x0, #2424]
    60fc:	b4000074 	cbz	x20, 6108 <fflush+0x28>
    6100:	b9405280 	ldr	w0, [x20, #80]
    6104:	34000180 	cbz	w0, 6134 <fflush+0x54>
    6108:	79c02260 	ldrsh	w0, [x19, #16]
    610c:	350000a0 	cbnz	w0, 6120 <fflush+0x40>
    6110:	52800000 	mov	w0, #0x0                   	// #0
    6114:	a94153f3 	ldp	x19, x20, [sp, #16]
    6118:	a8c27bfd 	ldp	x29, x30, [sp], #32
    611c:	d65f03c0 	ret
    6120:	aa1303e1 	mov	x1, x19
    6124:	aa1403e0 	mov	x0, x20
    6128:	a94153f3 	ldp	x19, x20, [sp, #16]
    612c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6130:	17ffff48 	b	5e50 <__sflush_r>
    6134:	aa1403e0 	mov	x0, x20
    6138:	940000d2 	bl	6480 <__sinit>
    613c:	79c02260 	ldrsh	w0, [x19, #16]
    6140:	34fffe80 	cbz	w0, 6110 <fflush+0x30>
    6144:	17fffff7 	b	6120 <fflush+0x40>
    6148:	b0000020 	adrp	x0, b000 <_findenv_r+0x10>
    614c:	90000001 	adrp	x1, 6000 <__sflush_r+0x1b0>
    6150:	91020021 	add	x1, x1, #0x80
    6154:	f9454c00 	ldr	x0, [x0, #2712]
    6158:	140003b2 	b	7020 <_fwalk_reent>
    615c:	d503201f 	nop

0000000000006160 <__fp_lock>:
    6160:	52800000 	mov	w0, #0x0                   	// #0
    6164:	d65f03c0 	ret
    6168:	d503201f 	nop
    616c:	d503201f 	nop

0000000000006170 <_cleanup_r>:
    6170:	90000021 	adrp	x1, a000 <strcpy+0x80>
    6174:	913b0021 	add	x1, x1, #0xec0
    6178:	140003aa 	b	7020 <_fwalk_reent>
    617c:	d503201f 	nop

0000000000006180 <__fp_unlock>:
    6180:	52800000 	mov	w0, #0x0                   	// #0
    6184:	d65f03c0 	ret
    6188:	d503201f 	nop
    618c:	d503201f 	nop

0000000000006190 <__sinit.part.0>:
    6190:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6194:	52800065 	mov	w5, #0x3                   	// #3
    6198:	90000001 	adrp	x1, 6000 <__sflush_r+0x1b0>
    619c:	910003fd 	mov	x29, sp
    61a0:	a9025bf5 	stp	x21, x22, [sp, #32]
    61a4:	aa0003f5 	mov	x21, x0
    61a8:	9114e2a4 	add	x4, x21, #0x538
    61ac:	a90153f3 	stp	x19, x20, [sp, #16]
    61b0:	9105c020 	add	x0, x1, #0x170
    61b4:	52800083 	mov	w3, #0x4                   	// #4
    61b8:	f94006b3 	ldr	x19, [x21, #8]
    61bc:	a90363f7 	stp	x23, x24, [sp, #48]
    61c0:	d2800102 	mov	x2, #0x8                   	// #8
    61c4:	f90023f9 	str	x25, [sp, #64]
    61c8:	52800001 	mov	w1, #0x0                   	// #0
    61cc:	f9002ea0 	str	x0, [x21, #88]
    61d0:	91029260 	add	x0, x19, #0xa4
    61d4:	f90292bf 	str	xzr, [x21, #1312]
    61d8:	f0000018 	adrp	x24, 9000 <memchr+0x5c>
    61dc:	b9052aa5 	str	w5, [x21, #1320]
    61e0:	912f8318 	add	x24, x24, #0xbe0
    61e4:	f9029aa4 	str	x4, [x21, #1328]
    61e8:	f0000017 	adrp	x23, 9000 <memchr+0x5c>
    61ec:	a9007e7f 	stp	xzr, xzr, [x19]
    61f0:	913142f7 	add	x23, x23, #0xc50
    61f4:	f0000016 	adrp	x22, 9000 <memchr+0x5c>
    61f8:	b9001263 	str	w3, [x19, #16]
    61fc:	913282d6 	add	x22, x22, #0xca0
    6200:	f9000e7f 	str	xzr, [x19, #24]
    6204:	f0000019 	adrp	x25, 9000 <memchr+0x5c>
    6208:	b900227f 	str	wzr, [x19, #32]
    620c:	912e0339 	add	x25, x25, #0xb80
    6210:	b9002a7f 	str	wzr, [x19, #40]
    6214:	b900ae7f 	str	wzr, [x19, #172]
    6218:	97fff65a 	bl	3b80 <memset>
    621c:	f9400ab4 	ldr	x20, [x21, #16]
    6220:	52800123 	mov	w3, #0x9                   	// #9
    6224:	a9036673 	stp	x19, x25, [x19, #48]
    6228:	72a00023 	movk	w3, #0x1, lsl #16
    622c:	91029280 	add	x0, x20, #0xa4
    6230:	a9045e78 	stp	x24, x23, [x19, #64]
    6234:	d2800102 	mov	x2, #0x8                   	// #8
    6238:	52800001 	mov	w1, #0x0                   	// #0
    623c:	f9002a76 	str	x22, [x19, #80]
    6240:	a9007e9f 	stp	xzr, xzr, [x20]
    6244:	b9001283 	str	w3, [x20, #16]
    6248:	f9000e9f 	str	xzr, [x20, #24]
    624c:	b900229f 	str	wzr, [x20, #32]
    6250:	b9002a9f 	str	wzr, [x20, #40]
    6254:	b900ae9f 	str	wzr, [x20, #172]
    6258:	97fff64a 	bl	3b80 <memset>
    625c:	f9400eb3 	ldr	x19, [x21, #24]
    6260:	52800243 	mov	w3, #0x12                  	// #18
    6264:	a9036694 	stp	x20, x25, [x20, #48]
    6268:	72a00043 	movk	w3, #0x2, lsl #16
    626c:	91029260 	add	x0, x19, #0xa4
    6270:	a9045e98 	stp	x24, x23, [x20, #64]
    6274:	d2800102 	mov	x2, #0x8                   	// #8
    6278:	52800001 	mov	w1, #0x0                   	// #0
    627c:	f9002a96 	str	x22, [x20, #80]
    6280:	a9007e7f 	stp	xzr, xzr, [x19]
    6284:	b9001263 	str	w3, [x19, #16]
    6288:	f9000e7f 	str	xzr, [x19, #24]
    628c:	b900227f 	str	wzr, [x19, #32]
    6290:	b9002a7f 	str	wzr, [x19, #40]
    6294:	b900ae7f 	str	wzr, [x19, #172]
    6298:	97fff63a 	bl	3b80 <memset>
    629c:	a9036673 	stp	x19, x25, [x19, #48]
    62a0:	52800020 	mov	w0, #0x1                   	// #1
    62a4:	a9045e78 	stp	x24, x23, [x19, #64]
    62a8:	f9002a76 	str	x22, [x19, #80]
    62ac:	a94153f3 	ldp	x19, x20, [sp, #16]
    62b0:	a94363f7 	ldp	x23, x24, [sp, #48]
    62b4:	f94023f9 	ldr	x25, [sp, #64]
    62b8:	b90052a0 	str	w0, [x21, #80]
    62bc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    62c0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    62c4:	d65f03c0 	ret
    62c8:	d503201f 	nop
    62cc:	d503201f 	nop

00000000000062d0 <__sfmoreglue>:
    62d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    62d4:	52801602 	mov	w2, #0xb0                  	// #176
    62d8:	910003fd 	mov	x29, sp
    62dc:	a90153f3 	stp	x19, x20, [sp, #16]
    62e0:	51000434 	sub	w20, w1, #0x1
    62e4:	f90013f5 	str	x21, [sp, #32]
    62e8:	2a0103f5 	mov	w21, w1
    62ec:	9b227e94 	smull	x20, w20, w2
    62f0:	91032281 	add	x1, x20, #0xc8
    62f4:	9400075b 	bl	8060 <_malloc_r>
    62f8:	aa0003f3 	mov	x19, x0
    62fc:	b4000100 	cbz	x0, 631c <__sfmoreglue+0x4c>
    6300:	91006000 	add	x0, x0, #0x18
    6304:	f900027f 	str	xzr, [x19]
    6308:	b9000a75 	str	w21, [x19, #8]
    630c:	9102c282 	add	x2, x20, #0xb0
    6310:	f9000a60 	str	x0, [x19, #16]
    6314:	52800001 	mov	w1, #0x0                   	// #0
    6318:	97fff61a 	bl	3b80 <memset>
    631c:	aa1303e0 	mov	x0, x19
    6320:	a94153f3 	ldp	x19, x20, [sp, #16]
    6324:	f94013f5 	ldr	x21, [sp, #32]
    6328:	a8c37bfd 	ldp	x29, x30, [sp], #48
    632c:	d65f03c0 	ret

0000000000006330 <__sfp>:
    6330:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6334:	b0000021 	adrp	x1, b000 <_findenv_r+0x10>
    6338:	910003fd 	mov	x29, sp
    633c:	a90153f3 	stp	x19, x20, [sp, #16]
    6340:	f9454c34 	ldr	x20, [x1, #2712]
    6344:	f9001fe0 	str	x0, [sp, #56]
    6348:	f90013f5 	str	x21, [sp, #32]
    634c:	b9405280 	ldr	w0, [x20, #80]
    6350:	34000560 	cbz	w0, 63fc <__sfp+0xcc>
    6354:	91148294 	add	x20, x20, #0x520
    6358:	52800095 	mov	w21, #0x4                   	// #4
    635c:	b9400a80 	ldr	w0, [x20, #8]
    6360:	f9400a93 	ldr	x19, [x20, #16]
    6364:	7100001f 	cmp	w0, #0x0
    6368:	5400042d 	b.le	63ec <__sfp+0xbc>
    636c:	51000400 	sub	w0, w0, #0x1
    6370:	91000400 	add	x0, x0, #0x1
    6374:	8b000401 	add	x1, x0, x0, lsl #1
    6378:	d37ef421 	lsl	x1, x1, #2
    637c:	cb000021 	sub	x1, x1, x0
    6380:	8b011261 	add	x1, x19, x1, lsl #4
    6384:	14000004 	b	6394 <__sfp+0x64>
    6388:	9102c273 	add	x19, x19, #0xb0
    638c:	eb01027f 	cmp	x19, x1
    6390:	540002e0 	b.eq	63ec <__sfp+0xbc>  // b.none
    6394:	79c02260 	ldrsh	w0, [x19, #16]
    6398:	35ffff80 	cbnz	w0, 6388 <__sfp+0x58>
    639c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    63a0:	a9007e7f 	stp	xzr, xzr, [x19]
    63a4:	d2800102 	mov	x2, #0x8                   	// #8
    63a8:	b9001260 	str	w0, [x19, #16]
    63ac:	52800001 	mov	w1, #0x0                   	// #0
    63b0:	f9000e7f 	str	xzr, [x19, #24]
    63b4:	91029260 	add	x0, x19, #0xa4
    63b8:	b900227f 	str	wzr, [x19, #32]
    63bc:	b9002a7f 	str	wzr, [x19, #40]
    63c0:	b900ae7f 	str	wzr, [x19, #172]
    63c4:	97fff5ef 	bl	3b80 <memset>
    63c8:	f9002e7f 	str	xzr, [x19, #88]
    63cc:	b900627f 	str	wzr, [x19, #96]
    63d0:	f9003e7f 	str	xzr, [x19, #120]
    63d4:	b900827f 	str	wzr, [x19, #128]
    63d8:	aa1303e0 	mov	x0, x19
    63dc:	a94153f3 	ldp	x19, x20, [sp, #16]
    63e0:	f94013f5 	ldr	x21, [sp, #32]
    63e4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    63e8:	d65f03c0 	ret
    63ec:	f9400293 	ldr	x19, [x20]
    63f0:	b40000d3 	cbz	x19, 6408 <__sfp+0xd8>
    63f4:	aa1303f4 	mov	x20, x19
    63f8:	17ffffd9 	b	635c <__sfp+0x2c>
    63fc:	aa1403e0 	mov	x0, x20
    6400:	97ffff64 	bl	6190 <__sinit.part.0>
    6404:	17ffffd4 	b	6354 <__sfp+0x24>
    6408:	f9401fe0 	ldr	x0, [sp, #56]
    640c:	d2805b01 	mov	x1, #0x2d8                 	// #728
    6410:	94000714 	bl	8060 <_malloc_r>
    6414:	aa0003f3 	mov	x19, x0
    6418:	b4000160 	cbz	x0, 6444 <__sfp+0x114>
    641c:	91006000 	add	x0, x0, #0x18
    6420:	f900027f 	str	xzr, [x19]
    6424:	b9000a75 	str	w21, [x19, #8]
    6428:	d2805802 	mov	x2, #0x2c0                 	// #704
    642c:	f9000a60 	str	x0, [x19, #16]
    6430:	52800001 	mov	w1, #0x0                   	// #0
    6434:	97fff5d3 	bl	3b80 <memset>
    6438:	f9000293 	str	x19, [x20]
    643c:	aa1303f4 	mov	x20, x19
    6440:	17ffffc7 	b	635c <__sfp+0x2c>
    6444:	f9401fe1 	ldr	x1, [sp, #56]
    6448:	f900029f 	str	xzr, [x20]
    644c:	52800180 	mov	w0, #0xc                   	// #12
    6450:	b9000020 	str	w0, [x1]
    6454:	17ffffe1 	b	63d8 <__sfp+0xa8>
    6458:	d503201f 	nop
    645c:	d503201f 	nop

0000000000006460 <_cleanup>:
    6460:	b0000020 	adrp	x0, b000 <_findenv_r+0x10>
    6464:	90000021 	adrp	x1, a000 <strcpy+0x80>
    6468:	913b0021 	add	x1, x1, #0xec0
    646c:	f9454c00 	ldr	x0, [x0, #2712]
    6470:	140002ec 	b	7020 <_fwalk_reent>
    6474:	d503201f 	nop
    6478:	d503201f 	nop
    647c:	d503201f 	nop

0000000000006480 <__sinit>:
    6480:	b9405001 	ldr	w1, [x0, #80]
    6484:	34000041 	cbz	w1, 648c <__sinit+0xc>
    6488:	d65f03c0 	ret
    648c:	17ffff41 	b	6190 <__sinit.part.0>

0000000000006490 <__sfp_lock_acquire>:
    6490:	d65f03c0 	ret
    6494:	d503201f 	nop
    6498:	d503201f 	nop
    649c:	d503201f 	nop

00000000000064a0 <__sfp_lock_release>:
    64a0:	d65f03c0 	ret
    64a4:	d503201f 	nop
    64a8:	d503201f 	nop
    64ac:	d503201f 	nop

00000000000064b0 <__sinit_lock_acquire>:
    64b0:	d65f03c0 	ret
    64b4:	d503201f 	nop
    64b8:	d503201f 	nop
    64bc:	d503201f 	nop

00000000000064c0 <__sinit_lock_release>:
    64c0:	d65f03c0 	ret
    64c4:	d503201f 	nop
    64c8:	d503201f 	nop
    64cc:	d503201f 	nop

00000000000064d0 <__fp_lock_all>:
    64d0:	d0000020 	adrp	x0, c000 <JIS_state_table+0x10>
    64d4:	90000001 	adrp	x1, 6000 <__sflush_r+0x1b0>
    64d8:	91058021 	add	x1, x1, #0x160
    64dc:	f944bc00 	ldr	x0, [x0, #2424]
    64e0:	140002a8 	b	6f80 <_fwalk>
    64e4:	d503201f 	nop
    64e8:	d503201f 	nop
    64ec:	d503201f 	nop

00000000000064f0 <__fp_unlock_all>:
    64f0:	d0000020 	adrp	x0, c000 <JIS_state_table+0x10>
    64f4:	90000001 	adrp	x1, 6000 <__sflush_r+0x1b0>
    64f8:	91060021 	add	x1, x1, #0x180
    64fc:	f944bc00 	ldr	x0, [x0, #2424]
    6500:	140002a0 	b	6f80 <_fwalk>
    6504:	d503201f 	nop
    6508:	d503201f 	nop
    650c:	d503201f 	nop

0000000000006510 <__fputwc>:
    6510:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6514:	910003fd 	mov	x29, sp
    6518:	a90153f3 	stp	x19, x20, [sp, #16]
    651c:	aa0203f3 	mov	x19, x2
    6520:	a9025bf5 	stp	x21, x22, [sp, #32]
    6524:	2a0103f6 	mov	w22, w1
    6528:	a90363f7 	stp	x23, x24, [sp, #48]
    652c:	aa0003f7 	mov	x23, x0
    6530:	9400062c 	bl	7de0 <__locale_mb_cur_max>
    6534:	7100041f 	cmp	w0, #0x1
    6538:	54000081 	b.ne	6548 <__fputwc+0x38>  // b.any
    653c:	510006c0 	sub	w0, w22, #0x1
    6540:	7103f81f 	cmp	w0, #0xfe
    6544:	54000509 	b.ls	65e4 <__fputwc+0xd4>  // b.plast
    6548:	91029263 	add	x3, x19, #0xa4
    654c:	2a1603e2 	mov	w2, w22
    6550:	910123e1 	add	x1, sp, #0x48
    6554:	aa1703e0 	mov	x0, x23
    6558:	97fffd5e 	bl	5ad0 <_wcrtomb_r>
    655c:	aa0003f5 	mov	x21, x0
    6560:	b100041f 	cmn	x0, #0x1
    6564:	54000540 	b.eq	660c <__fputwc+0xfc>  // b.none
    6568:	b4000460 	cbz	x0, 65f4 <__fputwc+0xe4>
    656c:	394123e1 	ldrb	w1, [sp, #72]
    6570:	910123f8 	add	x24, sp, #0x48
    6574:	d2800014 	mov	x20, #0x0                   	// #0
    6578:	14000009 	b	659c <__fputwc+0x8c>
    657c:	f9400263 	ldr	x3, [x19]
    6580:	91000464 	add	x4, x3, #0x1
    6584:	f9000264 	str	x4, [x19]
    6588:	39000061 	strb	w1, [x3]
    658c:	91000694 	add	x20, x20, #0x1
    6590:	eb15029f 	cmp	x20, x21
    6594:	54000302 	b.cs	65f4 <__fputwc+0xe4>  // b.hs, b.nlast
    6598:	38786a81 	ldrb	w1, [x20, x24]
    659c:	b9400e63 	ldr	w3, [x19, #12]
    65a0:	51000463 	sub	w3, w3, #0x1
    65a4:	b9000e63 	str	w3, [x19, #12]
    65a8:	36fffea3 	tbz	w3, #31, 657c <__fputwc+0x6c>
    65ac:	b9402a64 	ldr	w4, [x19, #40]
    65b0:	aa1303e2 	mov	x2, x19
    65b4:	aa1703e0 	mov	x0, x23
    65b8:	6b04007f 	cmp	w3, w4
    65bc:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    65c0:	54fffde1 	b.ne	657c <__fputwc+0x6c>  // b.any
    65c4:	94001033 	bl	a690 <__swbuf_r>
    65c8:	3100041f 	cmn	w0, #0x1
    65cc:	54fffe01 	b.ne	658c <__fputwc+0x7c>  // b.any
    65d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    65d4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    65d8:	a94363f7 	ldp	x23, x24, [sp, #48]
    65dc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    65e0:	d65f03c0 	ret
    65e4:	12001ec1 	and	w1, w22, #0xff
    65e8:	d2800035 	mov	x21, #0x1                   	// #1
    65ec:	390123e1 	strb	w1, [sp, #72]
    65f0:	17ffffe0 	b	6570 <__fputwc+0x60>
    65f4:	2a1603e0 	mov	w0, w22
    65f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    65fc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6600:	a94363f7 	ldp	x23, x24, [sp, #48]
    6604:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6608:	d65f03c0 	ret
    660c:	79402261 	ldrh	w1, [x19, #16]
    6610:	321a0021 	orr	w1, w1, #0x40
    6614:	79002261 	strh	w1, [x19, #16]
    6618:	17ffffee 	b	65d0 <__fputwc+0xc0>
    661c:	d503201f 	nop

0000000000006620 <_fputwc_r>:
    6620:	79c02043 	ldrsh	w3, [x2, #16]
    6624:	376800c3 	tbnz	w3, #13, 663c <_fputwc_r+0x1c>
    6628:	b940ac44 	ldr	w4, [x2, #172]
    662c:	32130063 	orr	w3, w3, #0x2000
    6630:	79002043 	strh	w3, [x2, #16]
    6634:	32130083 	orr	w3, w4, #0x2000
    6638:	b900ac43 	str	w3, [x2, #172]
    663c:	17ffffb5 	b	6510 <__fputwc>

0000000000006640 <fputwc>:
    6640:	d0000023 	adrp	x3, c000 <JIS_state_table+0x10>
    6644:	aa0103e2 	mov	x2, x1
    6648:	2a0003e1 	mov	w1, w0
    664c:	f944bc60 	ldr	x0, [x3, #2424]
    6650:	b4000060 	cbz	x0, 665c <fputwc+0x1c>
    6654:	b9405003 	ldr	w3, [x0, #80]
    6658:	34000123 	cbz	w3, 667c <fputwc+0x3c>
    665c:	79c02043 	ldrsh	w3, [x2, #16]
    6660:	376800c3 	tbnz	w3, #13, 6678 <fputwc+0x38>
    6664:	b940ac44 	ldr	w4, [x2, #172]
    6668:	32130063 	orr	w3, w3, #0x2000
    666c:	79002043 	strh	w3, [x2, #16]
    6670:	32130083 	orr	w3, w4, #0x2000
    6674:	b900ac43 	str	w3, [x2, #172]
    6678:	17ffffa6 	b	6510 <__fputwc>
    667c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6680:	910003fd 	mov	x29, sp
    6684:	f9000fe0 	str	x0, [sp, #24]
    6688:	b90027e1 	str	w1, [sp, #36]
    668c:	f90017e2 	str	x2, [sp, #40]
    6690:	97ffff7c 	bl	6480 <__sinit>
    6694:	f94017e2 	ldr	x2, [sp, #40]
    6698:	b94027e1 	ldr	w1, [sp, #36]
    669c:	f9400fe0 	ldr	x0, [sp, #24]
    66a0:	79c02043 	ldrsh	w3, [x2, #16]
    66a4:	376800c3 	tbnz	w3, #13, 66bc <fputwc+0x7c>
    66a8:	b940ac44 	ldr	w4, [x2, #172]
    66ac:	32130063 	orr	w3, w3, #0x2000
    66b0:	79002043 	strh	w3, [x2, #16]
    66b4:	32130083 	orr	w3, w4, #0x2000
    66b8:	b900ac43 	str	w3, [x2, #172]
    66bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    66c0:	17ffff94 	b	6510 <__fputwc>
    66c4:	d503201f 	nop
    66c8:	d503201f 	nop
    66cc:	d503201f 	nop

00000000000066d0 <_malloc_trim_r>:
    66d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    66d4:	910003fd 	mov	x29, sp
    66d8:	a9025bf5 	stp	x21, x22, [sp, #32]
    66dc:	f0000036 	adrp	x22, d000 <impure_data+0x680>
    66e0:	910a42d6 	add	x22, x22, #0x290
    66e4:	aa0003f5 	mov	x21, x0
    66e8:	a90153f3 	stp	x19, x20, [sp, #16]
    66ec:	aa0103f3 	mov	x19, x1
    66f0:	94000a64 	bl	9080 <__malloc_lock>
    66f4:	f9400ac0 	ldr	x0, [x22, #16]
    66f8:	f9400414 	ldr	x20, [x0, #8]
    66fc:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    6700:	cb130293 	sub	x19, x20, x19
    6704:	913f7e73 	add	x19, x19, #0xfdf
    6708:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    670c:	d1400673 	sub	x19, x19, #0x1, lsl #12
    6710:	f13ffe7f 	cmp	x19, #0xfff
    6714:	5400010d 	b.le	6734 <_malloc_trim_r+0x64>
    6718:	d2800001 	mov	x1, #0x0                   	// #0
    671c:	aa1503e0 	mov	x0, x21
    6720:	94000bb0 	bl	95e0 <_sbrk_r>
    6724:	f9400ac1 	ldr	x1, [x22, #16]
    6728:	8b140021 	add	x1, x1, x20
    672c:	eb01001f 	cmp	x0, x1
    6730:	54000100 	b.eq	6750 <_malloc_trim_r+0x80>  // b.none
    6734:	aa1503e0 	mov	x0, x21
    6738:	94000a56 	bl	9090 <__malloc_unlock>
    673c:	52800000 	mov	w0, #0x0                   	// #0
    6740:	a94153f3 	ldp	x19, x20, [sp, #16]
    6744:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6748:	a8c37bfd 	ldp	x29, x30, [sp], #48
    674c:	d65f03c0 	ret
    6750:	cb1303e1 	neg	x1, x19
    6754:	aa1503e0 	mov	x0, x21
    6758:	94000ba2 	bl	95e0 <_sbrk_r>
    675c:	b100041f 	cmn	x0, #0x1
    6760:	54000200 	b.eq	67a0 <_malloc_trim_r+0xd0>  // b.none
    6764:	f0000022 	adrp	x2, d000 <impure_data+0x680>
    6768:	cb130294 	sub	x20, x20, x19
    676c:	f9400ac3 	ldr	x3, [x22, #16]
    6770:	b2400294 	orr	x20, x20, #0x1
    6774:	b94e8041 	ldr	w1, [x2, #3712]
    6778:	aa1503e0 	mov	x0, x21
    677c:	f9000474 	str	x20, [x3, #8]
    6780:	4b130033 	sub	w19, w1, w19
    6784:	b90e8053 	str	w19, [x2, #3712]
    6788:	94000a42 	bl	9090 <__malloc_unlock>
    678c:	52800020 	mov	w0, #0x1                   	// #1
    6790:	a94153f3 	ldp	x19, x20, [sp, #16]
    6794:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6798:	a8c37bfd 	ldp	x29, x30, [sp], #48
    679c:	d65f03c0 	ret
    67a0:	d2800001 	mov	x1, #0x0                   	// #0
    67a4:	aa1503e0 	mov	x0, x21
    67a8:	94000b8e 	bl	95e0 <_sbrk_r>
    67ac:	f9400ac2 	ldr	x2, [x22, #16]
    67b0:	cb020001 	sub	x1, x0, x2
    67b4:	f1007c3f 	cmp	x1, #0x1f
    67b8:	54fffbed 	b.le	6734 <_malloc_trim_r+0x64>
    67bc:	f0000024 	adrp	x4, d000 <impure_data+0x680>
    67c0:	b2400021 	orr	x1, x1, #0x1
    67c4:	f9000441 	str	x1, [x2, #8]
    67c8:	f0000023 	adrp	x3, d000 <impure_data+0x680>
    67cc:	f9455081 	ldr	x1, [x4, #2720]
    67d0:	cb010000 	sub	x0, x0, x1
    67d4:	b90e8060 	str	w0, [x3, #3712]
    67d8:	17ffffd7 	b	6734 <_malloc_trim_r+0x64>
    67dc:	d503201f 	nop

00000000000067e0 <_free_r>:
    67e0:	b4000a21 	cbz	x1, 6924 <_free_r+0x144>
    67e4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    67e8:	910003fd 	mov	x29, sp
    67ec:	a90153f3 	stp	x19, x20, [sp, #16]
    67f0:	aa0103f3 	mov	x19, x1
    67f4:	aa0003f4 	mov	x20, x0
    67f8:	94000a22 	bl	9080 <__malloc_lock>
    67fc:	f85f8265 	ldur	x5, [x19, #-8]
    6800:	d1004263 	sub	x3, x19, #0x10
    6804:	f0000020 	adrp	x0, d000 <impure_data+0x680>
    6808:	910a4000 	add	x0, x0, #0x290
    680c:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    6810:	8b020064 	add	x4, x3, x2
    6814:	f9400806 	ldr	x6, [x0, #16]
    6818:	f9400481 	ldr	x1, [x4, #8]
    681c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    6820:	eb0400df 	cmp	x6, x4
    6824:	54000c60 	b.eq	69b0 <_free_r+0x1d0>  // b.none
    6828:	f9000481 	str	x1, [x4, #8]
    682c:	8b010086 	add	x6, x4, x1
    6830:	37000345 	tbnz	w5, #0, 6898 <_free_r+0xb8>
    6834:	f85f0267 	ldur	x7, [x19, #-16]
    6838:	f0000025 	adrp	x5, d000 <impure_data+0x680>
    683c:	f94004c6 	ldr	x6, [x6, #8]
    6840:	cb070063 	sub	x3, x3, x7
    6844:	8b070042 	add	x2, x2, x7
    6848:	910a80a5 	add	x5, x5, #0x2a0
    684c:	924000c6 	and	x6, x6, #0x1
    6850:	f9400867 	ldr	x7, [x3, #16]
    6854:	eb0500ff 	cmp	x7, x5
    6858:	54000940 	b.eq	6980 <_free_r+0x1a0>  // b.none
    685c:	f9400c68 	ldr	x8, [x3, #24]
    6860:	f9000ce8 	str	x8, [x7, #24]
    6864:	f9000907 	str	x7, [x8, #16]
    6868:	b50001c6 	cbnz	x6, 68a0 <_free_r+0xc0>
    686c:	8b010042 	add	x2, x2, x1
    6870:	f9400881 	ldr	x1, [x4, #16]
    6874:	b2400046 	orr	x6, x2, #0x1
    6878:	eb05003f 	cmp	x1, x5
    687c:	54000ee0 	b.eq	6a58 <_free_r+0x278>  // b.none
    6880:	f9400c84 	ldr	x4, [x4, #24]
    6884:	f9000c24 	str	x4, [x1, #24]
    6888:	f9000881 	str	x1, [x4, #16]
    688c:	f9000466 	str	x6, [x3, #8]
    6890:	f8226862 	str	x2, [x3, x2]
    6894:	14000006 	b	68ac <_free_r+0xcc>
    6898:	f94004c5 	ldr	x5, [x6, #8]
    689c:	36000465 	tbz	w5, #0, 6928 <_free_r+0x148>
    68a0:	b2400041 	orr	x1, x2, #0x1
    68a4:	f9000461 	str	x1, [x3, #8]
    68a8:	f9000082 	str	x2, [x4]
    68ac:	f107fc5f 	cmp	x2, #0x1ff
    68b0:	54000449 	b.ls	6938 <_free_r+0x158>  // b.plast
    68b4:	d349fc41 	lsr	x1, x2, #9
    68b8:	f127fc5f 	cmp	x2, #0x9ff
    68bc:	54000a28 	b.hi	6a00 <_free_r+0x220>  // b.pmore
    68c0:	d346fc41 	lsr	x1, x2, #6
    68c4:	1100e424 	add	w4, w1, #0x39
    68c8:	1100e025 	add	w5, w1, #0x38
    68cc:	531f7884 	lsl	w4, w4, #1
    68d0:	937d7c84 	sbfiz	x4, x4, #3, #32
    68d4:	8b040004 	add	x4, x0, x4
    68d8:	f85f0481 	ldr	x1, [x4], #-16
    68dc:	eb01009f 	cmp	x4, x1
    68e0:	54000ae0 	b.eq	6a3c <_free_r+0x25c>  // b.none
    68e4:	d503201f 	nop
    68e8:	f9400420 	ldr	x0, [x1, #8]
    68ec:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    68f0:	eb02001f 	cmp	x0, x2
    68f4:	54000089 	b.ls	6904 <_free_r+0x124>  // b.plast
    68f8:	f9400821 	ldr	x1, [x1, #16]
    68fc:	eb01009f 	cmp	x4, x1
    6900:	54ffff41 	b.ne	68e8 <_free_r+0x108>  // b.any
    6904:	f9400c24 	ldr	x4, [x1, #24]
    6908:	a9011061 	stp	x1, x4, [x3, #16]
    690c:	aa1403e0 	mov	x0, x20
    6910:	f9000883 	str	x3, [x4, #16]
    6914:	f9000c23 	str	x3, [x1, #24]
    6918:	a94153f3 	ldp	x19, x20, [sp, #16]
    691c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6920:	140009dc 	b	9090 <__malloc_unlock>
    6924:	d65f03c0 	ret
    6928:	f0000025 	adrp	x5, d000 <impure_data+0x680>
    692c:	8b010042 	add	x2, x2, x1
    6930:	910a80a5 	add	x5, x5, #0x2a0
    6934:	17ffffcf 	b	6870 <_free_r+0x90>
    6938:	d343fc42 	lsr	x2, x2, #3
    693c:	d2800024 	mov	x4, #0x1                   	// #1
    6940:	11000441 	add	w1, w2, #0x1
    6944:	f9400405 	ldr	x5, [x0, #8]
    6948:	531f7821 	lsl	w1, w1, #1
    694c:	13027c42 	asr	w2, w2, #2
    6950:	8b21cc01 	add	x1, x0, w1, sxtw #3
    6954:	9ac22082 	lsl	x2, x4, x2
    6958:	aa050042 	orr	x2, x2, x5
    695c:	f9000402 	str	x2, [x0, #8]
    6960:	f85f0420 	ldr	x0, [x1], #-16
    6964:	a9010460 	stp	x0, x1, [x3, #16]
    6968:	f9000823 	str	x3, [x1, #16]
    696c:	f9000c03 	str	x3, [x0, #24]
    6970:	aa1403e0 	mov	x0, x20
    6974:	a94153f3 	ldp	x19, x20, [sp, #16]
    6978:	a8c27bfd 	ldp	x29, x30, [sp], #32
    697c:	140009c5 	b	9090 <__malloc_unlock>
    6980:	b50009c6 	cbnz	x6, 6ab8 <_free_r+0x2d8>
    6984:	a9410085 	ldp	x5, x0, [x4, #16]
    6988:	8b020021 	add	x1, x1, x2
    698c:	f9000ca0 	str	x0, [x5, #24]
    6990:	b2400022 	orr	x2, x1, #0x1
    6994:	f9000805 	str	x5, [x0, #16]
    6998:	aa1403e0 	mov	x0, x20
    699c:	f9000462 	str	x2, [x3, #8]
    69a0:	f8216861 	str	x1, [x3, x1]
    69a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    69a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    69ac:	140009b9 	b	9090 <__malloc_unlock>
    69b0:	8b010041 	add	x1, x2, x1
    69b4:	370000e5 	tbnz	w5, #0, 69d0 <_free_r+0x1f0>
    69b8:	f85f0262 	ldur	x2, [x19, #-16]
    69bc:	cb020063 	sub	x3, x3, x2
    69c0:	8b020021 	add	x1, x1, x2
    69c4:	a9410864 	ldp	x4, x2, [x3, #16]
    69c8:	f9000c82 	str	x2, [x4, #24]
    69cc:	f9000844 	str	x4, [x2, #16]
    69d0:	f0000022 	adrp	x2, d000 <impure_data+0x680>
    69d4:	b2400024 	orr	x4, x1, #0x1
    69d8:	f9000464 	str	x4, [x3, #8]
    69dc:	f9455442 	ldr	x2, [x2, #2728]
    69e0:	f9000803 	str	x3, [x0, #16]
    69e4:	eb01005f 	cmp	x2, x1
    69e8:	54fffc48 	b.hi	6970 <_free_r+0x190>  // b.pmore
    69ec:	f0000021 	adrp	x1, d000 <impure_data+0x680>
    69f0:	aa1403e0 	mov	x0, x20
    69f4:	f9475c21 	ldr	x1, [x1, #3768]
    69f8:	97ffff36 	bl	66d0 <_malloc_trim_r>
    69fc:	17ffffdd 	b	6970 <_free_r+0x190>
    6a00:	f100503f 	cmp	x1, #0x14
    6a04:	54000129 	b.ls	6a28 <_free_r+0x248>  // b.plast
    6a08:	f101503f 	cmp	x1, #0x54
    6a0c:	54000308 	b.hi	6a6c <_free_r+0x28c>  // b.pmore
    6a10:	d34cfc41 	lsr	x1, x2, #12
    6a14:	1101bc24 	add	w4, w1, #0x6f
    6a18:	1101b825 	add	w5, w1, #0x6e
    6a1c:	531f7884 	lsl	w4, w4, #1
    6a20:	937d7c84 	sbfiz	x4, x4, #3, #32
    6a24:	17ffffac 	b	68d4 <_free_r+0xf4>
    6a28:	11017024 	add	w4, w1, #0x5c
    6a2c:	11016c25 	add	w5, w1, #0x5b
    6a30:	531f7884 	lsl	w4, w4, #1
    6a34:	937d7c84 	sbfiz	x4, x4, #3, #32
    6a38:	17ffffa7 	b	68d4 <_free_r+0xf4>
    6a3c:	f9400406 	ldr	x6, [x0, #8]
    6a40:	13027ca5 	asr	w5, w5, #2
    6a44:	d2800022 	mov	x2, #0x1                   	// #1
    6a48:	9ac52045 	lsl	x5, x2, x5
    6a4c:	aa0600a5 	orr	x5, x5, x6
    6a50:	f9000405 	str	x5, [x0, #8]
    6a54:	17ffffad 	b	6908 <_free_r+0x128>
    6a58:	a9020c03 	stp	x3, x3, [x0, #32]
    6a5c:	a9009466 	stp	x6, x5, [x3, #8]
    6a60:	f9000c65 	str	x5, [x3, #24]
    6a64:	f8226862 	str	x2, [x3, x2]
    6a68:	17ffffc2 	b	6970 <_free_r+0x190>
    6a6c:	f105503f 	cmp	x1, #0x154
    6a70:	540000e8 	b.hi	6a8c <_free_r+0x2ac>  // b.pmore
    6a74:	d34ffc41 	lsr	x1, x2, #15
    6a78:	1101e024 	add	w4, w1, #0x78
    6a7c:	1101dc25 	add	w5, w1, #0x77
    6a80:	531f7884 	lsl	w4, w4, #1
    6a84:	937d7c84 	sbfiz	x4, x4, #3, #32
    6a88:	17ffff93 	b	68d4 <_free_r+0xf4>
    6a8c:	f115503f 	cmp	x1, #0x554
    6a90:	540000e8 	b.hi	6aac <_free_r+0x2cc>  // b.pmore
    6a94:	d352fc41 	lsr	x1, x2, #18
    6a98:	1101f424 	add	w4, w1, #0x7d
    6a9c:	1101f025 	add	w5, w1, #0x7c
    6aa0:	531f7884 	lsl	w4, w4, #1
    6aa4:	937d7c84 	sbfiz	x4, x4, #3, #32
    6aa8:	17ffff8b 	b	68d4 <_free_r+0xf4>
    6aac:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    6ab0:	52800fc5 	mov	w5, #0x7e                  	// #126
    6ab4:	17ffff88 	b	68d4 <_free_r+0xf4>
    6ab8:	b2400040 	orr	x0, x2, #0x1
    6abc:	f9000460 	str	x0, [x3, #8]
    6ac0:	f9000082 	str	x2, [x4]
    6ac4:	17ffffab 	b	6970 <_free_r+0x190>
    6ac8:	d503201f 	nop
    6acc:	d503201f 	nop

0000000000006ad0 <__sfvwrite_r>:
    6ad0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    6ad4:	910003fd 	mov	x29, sp
    6ad8:	a90363f7 	stp	x23, x24, [sp, #48]
    6adc:	aa0003f7 	mov	x23, x0
    6ae0:	f9400840 	ldr	x0, [x2, #16]
    6ae4:	b4000460 	cbz	x0, 6b70 <__sfvwrite_r+0xa0>
    6ae8:	79402023 	ldrh	w3, [x1, #16]
    6aec:	aa0203f8 	mov	x24, x2
    6af0:	a90153f3 	stp	x19, x20, [sp, #16]
    6af4:	aa0103f3 	mov	x19, x1
    6af8:	36180443 	tbz	w3, #3, 6b80 <__sfvwrite_r+0xb0>
    6afc:	f9400c20 	ldr	x0, [x1, #24]
    6b00:	b4000400 	cbz	x0, 6b80 <__sfvwrite_r+0xb0>
    6b04:	a9025bf5 	stp	x21, x22, [sp, #32]
    6b08:	a9046bf9 	stp	x25, x26, [sp, #64]
    6b0c:	f9400314 	ldr	x20, [x24]
    6b10:	360804a3 	tbz	w3, #1, 6ba4 <__sfvwrite_r+0xd4>
    6b14:	d2800016 	mov	x22, #0x0                   	// #0
    6b18:	d2800015 	mov	x21, #0x0                   	// #0
    6b1c:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    6b20:	eb1902bf 	cmp	x21, x25
    6b24:	aa1603e2 	mov	x2, x22
    6b28:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    6b2c:	aa1703e0 	mov	x0, x23
    6b30:	b4000875 	cbz	x21, 6c3c <__sfvwrite_r+0x16c>
    6b34:	f9401a61 	ldr	x1, [x19, #48]
    6b38:	f9402264 	ldr	x4, [x19, #64]
    6b3c:	d63f0080 	blr	x4
    6b40:	7100001f 	cmp	w0, #0x0
    6b44:	5400206d 	b.le	6f50 <__sfvwrite_r+0x480>
    6b48:	f9400b01 	ldr	x1, [x24, #16]
    6b4c:	93407c00 	sxtw	x0, w0
    6b50:	8b0002d6 	add	x22, x22, x0
    6b54:	cb0002b5 	sub	x21, x21, x0
    6b58:	cb000020 	sub	x0, x1, x0
    6b5c:	f9000b00 	str	x0, [x24, #16]
    6b60:	b5fffe00 	cbnz	x0, 6b20 <__sfvwrite_r+0x50>
    6b64:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b68:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6b6c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6b70:	52800000 	mov	w0, #0x0                   	// #0
    6b74:	a94363f7 	ldp	x23, x24, [sp, #48]
    6b78:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6b7c:	d65f03c0 	ret
    6b80:	aa1303e1 	mov	x1, x19
    6b84:	aa1703e0 	mov	x0, x23
    6b88:	97fffc2e 	bl	5c40 <__swsetup_r>
    6b8c:	35001f00 	cbnz	w0, 6f6c <__sfvwrite_r+0x49c>
    6b90:	79402263 	ldrh	w3, [x19, #16]
    6b94:	a9025bf5 	stp	x21, x22, [sp, #32]
    6b98:	a9046bf9 	stp	x25, x26, [sp, #64]
    6b9c:	f9400314 	ldr	x20, [x24]
    6ba0:	370ffba3 	tbnz	w3, #1, 6b14 <__sfvwrite_r+0x44>
    6ba4:	a90573fb 	stp	x27, x28, [sp, #80]
    6ba8:	37000503 	tbnz	w3, #0, 6c48 <__sfvwrite_r+0x178>
    6bac:	d280001c 	mov	x28, #0x0                   	// #0
    6bb0:	d2800015 	mov	x21, #0x0                   	// #0
    6bb4:	d503201f 	nop
    6bb8:	b40003d5 	cbz	x21, 6c30 <__sfvwrite_r+0x160>
    6bbc:	f9400266 	ldr	x6, [x19]
    6bc0:	b9400e7a 	ldr	w26, [x19, #12]
    6bc4:	aa0603e0 	mov	x0, x6
    6bc8:	36480ac3 	tbz	w3, #9, 6d20 <__sfvwrite_r+0x250>
    6bcc:	93407f5b 	sxtw	x27, w26
    6bd0:	eb15037f 	cmp	x27, x21
    6bd4:	540010c9 	b.ls	6dec <__sfvwrite_r+0x31c>  // b.plast
    6bd8:	93407ea1 	sxtw	x1, w21
    6bdc:	aa0103f6 	mov	x22, x1
    6be0:	aa0603e0 	mov	x0, x6
    6be4:	aa0103fb 	mov	x27, x1
    6be8:	2a1503fa 	mov	w26, w21
    6bec:	aa1b03e2 	mov	x2, x27
    6bf0:	aa1c03e1 	mov	x1, x28
    6bf4:	97fff3b3 	bl	3ac0 <memmove>
    6bf8:	f9400261 	ldr	x1, [x19]
    6bfc:	b9400e60 	ldr	w0, [x19, #12]
    6c00:	8b1b0022 	add	x2, x1, x27
    6c04:	f9000262 	str	x2, [x19]
    6c08:	4b1a0000 	sub	w0, w0, w26
    6c0c:	b9000e60 	str	w0, [x19, #12]
    6c10:	f9400b00 	ldr	x0, [x24, #16]
    6c14:	8b16039c 	add	x28, x28, x22
    6c18:	cb1602b5 	sub	x21, x21, x22
    6c1c:	cb160016 	sub	x22, x0, x22
    6c20:	f9000b16 	str	x22, [x24, #16]
    6c24:	b40005d6 	cbz	x22, 6cdc <__sfvwrite_r+0x20c>
    6c28:	79402263 	ldrh	w3, [x19, #16]
    6c2c:	b5fffc95 	cbnz	x21, 6bbc <__sfvwrite_r+0xec>
    6c30:	a940569c 	ldp	x28, x21, [x20]
    6c34:	91004294 	add	x20, x20, #0x10
    6c38:	17ffffe0 	b	6bb8 <__sfvwrite_r+0xe8>
    6c3c:	a9405696 	ldp	x22, x21, [x20]
    6c40:	91004294 	add	x20, x20, #0x10
    6c44:	17ffffb7 	b	6b20 <__sfvwrite_r+0x50>
    6c48:	5280001a 	mov	w26, #0x0                   	// #0
    6c4c:	52800000 	mov	w0, #0x0                   	// #0
    6c50:	d280001b 	mov	x27, #0x0                   	// #0
    6c54:	d2800019 	mov	x25, #0x0                   	// #0
    6c58:	b40004d9 	cbz	x25, 6cf0 <__sfvwrite_r+0x220>
    6c5c:	34000500 	cbz	w0, 6cfc <__sfvwrite_r+0x22c>
    6c60:	f9400260 	ldr	x0, [x19]
    6c64:	93407f56 	sxtw	x22, w26
    6c68:	f9400e61 	ldr	x1, [x19, #24]
    6c6c:	eb1902df 	cmp	x22, x25
    6c70:	b9400e75 	ldr	w21, [x19, #12]
    6c74:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    6c78:	b9402263 	ldr	w3, [x19, #32]
    6c7c:	eb01001f 	cmp	x0, x1
    6c80:	0b150075 	add	w21, w3, w21
    6c84:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    6c88:	5400132c 	b.gt	6eec <__sfvwrite_r+0x41c>
    6c8c:	6b16007f 	cmp	w3, w22
    6c90:	5400116c 	b.gt	6ebc <__sfvwrite_r+0x3ec>
    6c94:	f9401a61 	ldr	x1, [x19, #48]
    6c98:	aa1b03e2 	mov	x2, x27
    6c9c:	f9402264 	ldr	x4, [x19, #64]
    6ca0:	aa1703e0 	mov	x0, x23
    6ca4:	d63f0080 	blr	x4
    6ca8:	2a0003f5 	mov	w21, w0
    6cac:	7100001f 	cmp	w0, #0x0
    6cb0:	5400088d 	b.le	6dc0 <__sfvwrite_r+0x2f0>
    6cb4:	6b15035a 	subs	w26, w26, w21
    6cb8:	52800020 	mov	w0, #0x1                   	// #1
    6cbc:	54000f60 	b.eq	6ea8 <__sfvwrite_r+0x3d8>  // b.none
    6cc0:	f9400b01 	ldr	x1, [x24, #16]
    6cc4:	93407eb5 	sxtw	x21, w21
    6cc8:	8b15037b 	add	x27, x27, x21
    6ccc:	cb150339 	sub	x25, x25, x21
    6cd0:	cb150035 	sub	x21, x1, x21
    6cd4:	f9000b15 	str	x21, [x24, #16]
    6cd8:	b5fffc15 	cbnz	x21, 6c58 <__sfvwrite_r+0x188>
    6cdc:	a94153f3 	ldp	x19, x20, [sp, #16]
    6ce0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6ce4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6ce8:	a94573fb 	ldp	x27, x28, [sp, #80]
    6cec:	17ffffa1 	b	6b70 <__sfvwrite_r+0xa0>
    6cf0:	a940669b 	ldp	x27, x25, [x20]
    6cf4:	91004294 	add	x20, x20, #0x10
    6cf8:	b4ffffd9 	cbz	x25, 6cf0 <__sfvwrite_r+0x220>
    6cfc:	aa1903e2 	mov	x2, x25
    6d00:	aa1b03e0 	mov	x0, x27
    6d04:	52800141 	mov	w1, #0xa                   	// #10
    6d08:	940008a7 	bl	8fa4 <memchr>
    6d0c:	9100041a 	add	x26, x0, #0x1
    6d10:	f100001f 	cmp	x0, #0x0
    6d14:	cb1b035a 	sub	x26, x26, x27
    6d18:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    6d1c:	17ffffd1 	b	6c60 <__sfvwrite_r+0x190>
    6d20:	f9400e60 	ldr	x0, [x19, #24]
    6d24:	eb06001f 	cmp	x0, x6
    6d28:	54000263 	b.cc	6d74 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6d2c:	b9402263 	ldr	w3, [x19, #32]
    6d30:	eb23c2bf 	cmp	x21, w3, sxtw
    6d34:	54000203 	b.cc	6d74 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6d38:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    6d3c:	eb0002bf 	cmp	x21, x0
    6d40:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    6d44:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    6d48:	f9401a61 	ldr	x1, [x19, #48]
    6d4c:	aa1c03e2 	mov	x2, x28
    6d50:	1ac30c84 	sdiv	w4, w4, w3
    6d54:	aa1703e0 	mov	x0, x23
    6d58:	f9402266 	ldr	x6, [x19, #64]
    6d5c:	1b037c83 	mul	w3, w4, w3
    6d60:	d63f00c0 	blr	x6
    6d64:	7100001f 	cmp	w0, #0x0
    6d68:	540002cd 	b.le	6dc0 <__sfvwrite_r+0x2f0>
    6d6c:	93407c16 	sxtw	x22, w0
    6d70:	17ffffa8 	b	6c10 <__sfvwrite_r+0x140>
    6d74:	93407f44 	sxtw	x4, w26
    6d78:	aa1c03e1 	mov	x1, x28
    6d7c:	eb15009f 	cmp	x4, x21
    6d80:	aa0603e0 	mov	x0, x6
    6d84:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    6d88:	93407f56 	sxtw	x22, w26
    6d8c:	aa1603e2 	mov	x2, x22
    6d90:	97fff34c 	bl	3ac0 <memmove>
    6d94:	f9400261 	ldr	x1, [x19]
    6d98:	b9400e60 	ldr	w0, [x19, #12]
    6d9c:	8b160021 	add	x1, x1, x22
    6da0:	f9000261 	str	x1, [x19]
    6da4:	4b1a0004 	sub	w4, w0, w26
    6da8:	b9000e64 	str	w4, [x19, #12]
    6dac:	35fff324 	cbnz	w4, 6c10 <__sfvwrite_r+0x140>
    6db0:	aa1303e1 	mov	x1, x19
    6db4:	aa1703e0 	mov	x0, x23
    6db8:	97fffcb2 	bl	6080 <_fflush_r>
    6dbc:	34fff2a0 	cbz	w0, 6c10 <__sfvwrite_r+0x140>
    6dc0:	a94573fb 	ldp	x27, x28, [sp, #80]
    6dc4:	79c02261 	ldrsh	w1, [x19, #16]
    6dc8:	321a0021 	orr	w1, w1, #0x40
    6dcc:	79002261 	strh	w1, [x19, #16]
    6dd0:	12800000 	mov	w0, #0xffffffff            	// #-1
    6dd4:	a94153f3 	ldp	x19, x20, [sp, #16]
    6dd8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6ddc:	a94363f7 	ldp	x23, x24, [sp, #48]
    6de0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6de4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6de8:	d65f03c0 	ret
    6dec:	93407eb6 	sxtw	x22, w21
    6df0:	52809001 	mov	w1, #0x480                 	// #1152
    6df4:	6a01007f 	tst	w3, w1
    6df8:	54ffefa0 	b.eq	6bec <__sfvwrite_r+0x11c>  // b.none
    6dfc:	b9402267 	ldr	w7, [x19, #32]
    6e00:	f9400e61 	ldr	x1, [x19, #24]
    6e04:	0b0704e7 	add	w7, w7, w7, lsl #1
    6e08:	cb0100d6 	sub	x22, x6, x1
    6e0c:	0b477ce7 	add	w7, w7, w7, lsr #31
    6e10:	93407ed9 	sxtw	x25, w22
    6e14:	13017cfb 	asr	w27, w7, #1
    6e18:	91000720 	add	x0, x25, #0x1
    6e1c:	8b150000 	add	x0, x0, x21
    6e20:	93407f62 	sxtw	x2, w27
    6e24:	eb00005f 	cmp	x2, x0
    6e28:	54000082 	b.cs	6e38 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    6e2c:	110006c7 	add	w7, w22, #0x1
    6e30:	0b1500fb 	add	w27, w7, w21
    6e34:	93407f62 	sxtw	x2, w27
    6e38:	36500723 	tbz	w3, #10, 6f1c <__sfvwrite_r+0x44c>
    6e3c:	aa0203e1 	mov	x1, x2
    6e40:	aa1703e0 	mov	x0, x23
    6e44:	94000487 	bl	8060 <_malloc_r>
    6e48:	aa0003fa 	mov	x26, x0
    6e4c:	b4000860 	cbz	x0, 6f58 <__sfvwrite_r+0x488>
    6e50:	f9400e61 	ldr	x1, [x19, #24]
    6e54:	aa1903e2 	mov	x2, x25
    6e58:	97fff2ba 	bl	3940 <memcpy>
    6e5c:	79402260 	ldrh	w0, [x19, #16]
    6e60:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    6e64:	0a010000 	and	w0, w0, w1
    6e68:	32190000 	orr	w0, w0, #0x80
    6e6c:	79002260 	strh	w0, [x19, #16]
    6e70:	8b190340 	add	x0, x26, x25
    6e74:	4b160366 	sub	w6, w27, w22
    6e78:	93407eb6 	sxtw	x22, w21
    6e7c:	f9000260 	str	x0, [x19]
    6e80:	b9000e66 	str	w6, [x19, #12]
    6e84:	aa1603e1 	mov	x1, x22
    6e88:	f9000e7a 	str	x26, [x19, #24]
    6e8c:	aa0003e6 	mov	x6, x0
    6e90:	b900227b 	str	w27, [x19, #32]
    6e94:	2a1503fa 	mov	w26, w21
    6e98:	eb1502df 	cmp	x22, x21
    6e9c:	54ffea08 	b.hi	6bdc <__sfvwrite_r+0x10c>  // b.pmore
    6ea0:	aa1603fb 	mov	x27, x22
    6ea4:	17ffff52 	b	6bec <__sfvwrite_r+0x11c>
    6ea8:	aa1303e1 	mov	x1, x19
    6eac:	aa1703e0 	mov	x0, x23
    6eb0:	97fffc74 	bl	6080 <_fflush_r>
    6eb4:	34fff060 	cbz	w0, 6cc0 <__sfvwrite_r+0x1f0>
    6eb8:	17ffffc2 	b	6dc0 <__sfvwrite_r+0x2f0>
    6ebc:	93407edc 	sxtw	x28, w22
    6ec0:	aa1b03e1 	mov	x1, x27
    6ec4:	aa1c03e2 	mov	x2, x28
    6ec8:	97fff2fe 	bl	3ac0 <memmove>
    6ecc:	f9400260 	ldr	x0, [x19]
    6ed0:	2a1603f5 	mov	w21, w22
    6ed4:	b9400e61 	ldr	w1, [x19, #12]
    6ed8:	8b1c0000 	add	x0, x0, x28
    6edc:	f9000260 	str	x0, [x19]
    6ee0:	4b160036 	sub	w22, w1, w22
    6ee4:	b9000e76 	str	w22, [x19, #12]
    6ee8:	17ffff73 	b	6cb4 <__sfvwrite_r+0x1e4>
    6eec:	93407eb6 	sxtw	x22, w21
    6ef0:	aa1b03e1 	mov	x1, x27
    6ef4:	aa1603e2 	mov	x2, x22
    6ef8:	97fff2f2 	bl	3ac0 <memmove>
    6efc:	f9400262 	ldr	x2, [x19]
    6f00:	aa1303e1 	mov	x1, x19
    6f04:	aa1703e0 	mov	x0, x23
    6f08:	8b160042 	add	x2, x2, x22
    6f0c:	f9000262 	str	x2, [x19]
    6f10:	97fffc5c 	bl	6080 <_fflush_r>
    6f14:	34ffed00 	cbz	w0, 6cb4 <__sfvwrite_r+0x1e4>
    6f18:	17ffffaa 	b	6dc0 <__sfvwrite_r+0x2f0>
    6f1c:	aa1703e0 	mov	x0, x23
    6f20:	94000860 	bl	90a0 <_realloc_r>
    6f24:	aa0003fa 	mov	x26, x0
    6f28:	b5fffa40 	cbnz	x0, 6e70 <__sfvwrite_r+0x3a0>
    6f2c:	f9400e61 	ldr	x1, [x19, #24]
    6f30:	aa1703e0 	mov	x0, x23
    6f34:	97fffe2b 	bl	67e0 <_free_r>
    6f38:	79c02261 	ldrsh	w1, [x19, #16]
    6f3c:	52800180 	mov	w0, #0xc                   	// #12
    6f40:	a94573fb 	ldp	x27, x28, [sp, #80]
    6f44:	12187821 	and	w1, w1, #0xffffff7f
    6f48:	b90002e0 	str	w0, [x23]
    6f4c:	17ffff9f 	b	6dc8 <__sfvwrite_r+0x2f8>
    6f50:	79c02261 	ldrsh	w1, [x19, #16]
    6f54:	17ffff9d 	b	6dc8 <__sfvwrite_r+0x2f8>
    6f58:	79c02261 	ldrsh	w1, [x19, #16]
    6f5c:	52800180 	mov	w0, #0xc                   	// #12
    6f60:	a94573fb 	ldp	x27, x28, [sp, #80]
    6f64:	b90002e0 	str	w0, [x23]
    6f68:	17ffff98 	b	6dc8 <__sfvwrite_r+0x2f8>
    6f6c:	12800000 	mov	w0, #0xffffffff            	// #-1
    6f70:	a94153f3 	ldp	x19, x20, [sp, #16]
    6f74:	17ffff00 	b	6b74 <__sfvwrite_r+0xa4>
    6f78:	d503201f 	nop
    6f7c:	d503201f 	nop

0000000000006f80 <_fwalk>:
    6f80:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6f84:	910003fd 	mov	x29, sp
    6f88:	a9025bf5 	stp	x21, x22, [sp, #32]
    6f8c:	91148015 	add	x21, x0, #0x520
    6f90:	aa0103f6 	mov	x22, x1
    6f94:	a90153f3 	stp	x19, x20, [sp, #16]
    6f98:	f9001bf7 	str	x23, [sp, #48]
    6f9c:	52800017 	mov	w23, #0x0                   	// #0
    6fa0:	b9400aa0 	ldr	w0, [x21, #8]
    6fa4:	f9400ab3 	ldr	x19, [x21, #16]
    6fa8:	7100001f 	cmp	w0, #0x0
    6fac:	5400026d 	b.le	6ff8 <_fwalk+0x78>
    6fb0:	51000400 	sub	w0, w0, #0x1
    6fb4:	91000400 	add	x0, x0, #0x1
    6fb8:	8b000414 	add	x20, x0, x0, lsl #1
    6fbc:	d37ef694 	lsl	x20, x20, #2
    6fc0:	cb000294 	sub	x20, x20, x0
    6fc4:	8b141274 	add	x20, x19, x20, lsl #4
    6fc8:	79402260 	ldrh	w0, [x19, #16]
    6fcc:	7100041f 	cmp	w0, #0x1
    6fd0:	540000e9 	b.ls	6fec <_fwalk+0x6c>  // b.plast
    6fd4:	79c02662 	ldrsh	w2, [x19, #18]
    6fd8:	aa1303e0 	mov	x0, x19
    6fdc:	3100045f 	cmn	w2, #0x1
    6fe0:	54000060 	b.eq	6fec <_fwalk+0x6c>  // b.none
    6fe4:	d63f02c0 	blr	x22
    6fe8:	2a0002f7 	orr	w23, w23, w0
    6fec:	9102c273 	add	x19, x19, #0xb0
    6ff0:	eb13029f 	cmp	x20, x19
    6ff4:	54fffea1 	b.ne	6fc8 <_fwalk+0x48>  // b.any
    6ff8:	f94002b5 	ldr	x21, [x21]
    6ffc:	b5fffd35 	cbnz	x21, 6fa0 <_fwalk+0x20>
    7000:	2a1703e0 	mov	w0, w23
    7004:	a94153f3 	ldp	x19, x20, [sp, #16]
    7008:	a9425bf5 	ldp	x21, x22, [sp, #32]
    700c:	f9401bf7 	ldr	x23, [sp, #48]
    7010:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7014:	d65f03c0 	ret
    7018:	d503201f 	nop
    701c:	d503201f 	nop

0000000000007020 <_fwalk_reent>:
    7020:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7024:	910003fd 	mov	x29, sp
    7028:	a9025bf5 	stp	x21, x22, [sp, #32]
    702c:	aa0103f6 	mov	x22, x1
    7030:	91148015 	add	x21, x0, #0x520
    7034:	a90363f7 	stp	x23, x24, [sp, #48]
    7038:	aa0003f8 	mov	x24, x0
    703c:	52800017 	mov	w23, #0x0                   	// #0
    7040:	a90153f3 	stp	x19, x20, [sp, #16]
    7044:	d503201f 	nop
    7048:	b9400aa2 	ldr	w2, [x21, #8]
    704c:	f9400ab3 	ldr	x19, [x21, #16]
    7050:	7100005f 	cmp	w2, #0x0
    7054:	5400028d 	b.le	70a4 <_fwalk_reent+0x84>
    7058:	51000442 	sub	w2, w2, #0x1
    705c:	91000442 	add	x2, x2, #0x1
    7060:	8b020454 	add	x20, x2, x2, lsl #1
    7064:	d37ef694 	lsl	x20, x20, #2
    7068:	cb020294 	sub	x20, x20, x2
    706c:	8b141274 	add	x20, x19, x20, lsl #4
    7070:	79402262 	ldrh	w2, [x19, #16]
    7074:	7100045f 	cmp	w2, #0x1
    7078:	54000109 	b.ls	7098 <_fwalk_reent+0x78>  // b.plast
    707c:	79c02662 	ldrsh	w2, [x19, #18]
    7080:	aa1303e1 	mov	x1, x19
    7084:	aa1803e0 	mov	x0, x24
    7088:	3100045f 	cmn	w2, #0x1
    708c:	54000060 	b.eq	7098 <_fwalk_reent+0x78>  // b.none
    7090:	d63f02c0 	blr	x22
    7094:	2a0002f7 	orr	w23, w23, w0
    7098:	9102c273 	add	x19, x19, #0xb0
    709c:	eb13029f 	cmp	x20, x19
    70a0:	54fffe81 	b.ne	7070 <_fwalk_reent+0x50>  // b.any
    70a4:	f94002b5 	ldr	x21, [x21]
    70a8:	b5fffd15 	cbnz	x21, 7048 <_fwalk_reent+0x28>
    70ac:	2a1703e0 	mov	w0, w23
    70b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    70b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    70b8:	a94363f7 	ldp	x23, x24, [sp, #48]
    70bc:	a8c47bfd 	ldp	x29, x30, [sp], #64
    70c0:	d65f03c0 	ret
    70c4:	d503201f 	nop
    70c8:	d503201f 	nop
    70cc:	d503201f 	nop

00000000000070d0 <__localeconv_l>:
    70d0:	91040000 	add	x0, x0, #0x100
    70d4:	d65f03c0 	ret
    70d8:	d503201f 	nop
    70dc:	d503201f 	nop

00000000000070e0 <_localeconv_r>:
    70e0:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    70e4:	9107a000 	add	x0, x0, #0x1e8
    70e8:	d65f03c0 	ret
    70ec:	d503201f 	nop

00000000000070f0 <localeconv>:
    70f0:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    70f4:	9107a000 	add	x0, x0, #0x1e8
    70f8:	d65f03c0 	ret
    70fc:	d503201f 	nop

0000000000007100 <currentlocale>:
    7100:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7104:	910003fd 	mov	x29, sp
    7108:	a90153f3 	stp	x19, x20, [sp, #16]
    710c:	d0000034 	adrp	x20, d000 <impure_data+0x680>
    7110:	9103a294 	add	x20, x20, #0xe8
    7114:	a9025bf5 	stp	x21, x22, [sp, #32]
    7118:	91010296 	add	x22, x20, #0x40
    711c:	d0000035 	adrp	x21, d000 <impure_data+0x680>
    7120:	912f62b5 	add	x21, x21, #0xbd8
    7124:	f9001bf7 	str	x23, [sp, #48]
    7128:	91038297 	add	x23, x20, #0xe0
    712c:	91008294 	add	x20, x20, #0x20
    7130:	aa1603f3 	mov	x19, x22
    7134:	aa1503e0 	mov	x0, x21
    7138:	aa1403e1 	mov	x1, x20
    713c:	94000b91 	bl	9f80 <strcpy>
    7140:	aa1303e1 	mov	x1, x19
    7144:	aa1403e0 	mov	x0, x20
    7148:	91008273 	add	x19, x19, #0x20
    714c:	94000b4d 	bl	9e80 <strcmp>
    7150:	35000120 	cbnz	w0, 7174 <currentlocale+0x74>
    7154:	eb17027f 	cmp	x19, x23
    7158:	54ffff41 	b.ne	7140 <currentlocale+0x40>  // b.any
    715c:	aa1503e0 	mov	x0, x21
    7160:	a94153f3 	ldp	x19, x20, [sp, #16]
    7164:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7168:	f9401bf7 	ldr	x23, [sp, #48]
    716c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7170:	d65f03c0 	ret
    7174:	90000033 	adrp	x19, b000 <_findenv_r+0x10>
    7178:	912f4273 	add	x19, x19, #0xbd0
    717c:	aa1303e1 	mov	x1, x19
    7180:	aa1503e0 	mov	x0, x21
    7184:	94000ae7 	bl	9d20 <strcat>
    7188:	aa1603e1 	mov	x1, x22
    718c:	aa1503e0 	mov	x0, x21
    7190:	910082d6 	add	x22, x22, #0x20
    7194:	94000ae3 	bl	9d20 <strcat>
    7198:	eb1702df 	cmp	x22, x23
    719c:	54ffff01 	b.ne	717c <currentlocale+0x7c>  // b.any
    71a0:	aa1503e0 	mov	x0, x21
    71a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    71a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    71ac:	f9401bf7 	ldr	x23, [sp, #48]
    71b0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    71b4:	d65f03c0 	ret
    71b8:	d503201f 	nop
    71bc:	d503201f 	nop

00000000000071c0 <__loadlocale>:
    71c0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    71c4:	910003fd 	mov	x29, sp
    71c8:	a90153f3 	stp	x19, x20, [sp, #16]
    71cc:	937b7c34 	sbfiz	x20, x1, #5, #32
    71d0:	8b140014 	add	x20, x0, x20
    71d4:	aa0203f3 	mov	x19, x2
    71d8:	a9025bf5 	stp	x21, x22, [sp, #32]
    71dc:	aa0003f6 	mov	x22, x0
    71e0:	aa0203e0 	mov	x0, x2
    71e4:	a90363f7 	stp	x23, x24, [sp, #48]
    71e8:	2a0103f7 	mov	w23, w1
    71ec:	aa1403e1 	mov	x1, x20
    71f0:	94000b24 	bl	9e80 <strcmp>
    71f4:	350000e0 	cbnz	w0, 7210 <__loadlocale+0x50>
    71f8:	aa1403e0 	mov	x0, x20
    71fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    7200:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7204:	a94363f7 	ldp	x23, x24, [sp, #48]
    7208:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    720c:	d65f03c0 	ret
    7210:	aa1303e0 	mov	x0, x19
    7214:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7218:	90000035 	adrp	x21, b000 <_findenv_r+0x10>
    721c:	912f6021 	add	x1, x1, #0xbd8
    7220:	912f82b5 	add	x21, x21, #0xbe0
    7224:	a9046bf9 	stp	x25, x26, [sp, #64]
    7228:	94000b16 	bl	9e80 <strcmp>
    722c:	34000d80 	cbz	w0, 73dc <__loadlocale+0x21c>
    7230:	aa1503e1 	mov	x1, x21
    7234:	aa1303e0 	mov	x0, x19
    7238:	94000b12 	bl	9e80 <strcmp>
    723c:	2a0003f5 	mov	w21, w0
    7240:	34000be0 	cbz	w0, 73bc <__loadlocale+0x1fc>
    7244:	39400260 	ldrb	w0, [x19]
    7248:	71010c1f 	cmp	w0, #0x43
    724c:	54000d00 	b.eq	73ec <__loadlocale+0x22c>  // b.none
    7250:	51018400 	sub	w0, w0, #0x61
    7254:	12001c00 	and	w0, w0, #0xff
    7258:	7100641f 	cmp	w0, #0x19
    725c:	54000a08 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    7260:	39400660 	ldrb	w0, [x19, #1]
    7264:	51018400 	sub	w0, w0, #0x61
    7268:	12001c00 	and	w0, w0, #0xff
    726c:	7100641f 	cmp	w0, #0x19
    7270:	54000968 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    7274:	39400a60 	ldrb	w0, [x19, #2]
    7278:	91000a75 	add	x21, x19, #0x2
    727c:	51018401 	sub	w1, w0, #0x61
    7280:	12001c21 	and	w1, w1, #0xff
    7284:	7100643f 	cmp	w1, #0x19
    7288:	54000068 	b.hi	7294 <__loadlocale+0xd4>  // b.pmore
    728c:	39400e60 	ldrb	w0, [x19, #3]
    7290:	91000e75 	add	x21, x19, #0x3
    7294:	71017c1f 	cmp	w0, #0x5f
    7298:	54000d00 	b.eq	7438 <__loadlocale+0x278>  // b.none
    729c:	7100b81f 	cmp	w0, #0x2e
    72a0:	54002ec0 	b.eq	7878 <__loadlocale+0x6b8>  // b.none
    72a4:	528017e1 	mov	w1, #0xbf                  	// #191
    72a8:	6a01001f 	tst	w0, w1
    72ac:	54000781 	b.ne	739c <__loadlocale+0x1dc>  // b.any
    72b0:	910203f8 	add	x24, sp, #0x80
    72b4:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    72b8:	aa1803e0 	mov	x0, x24
    72bc:	912fc021 	add	x1, x1, #0xbf0
    72c0:	94000b30 	bl	9f80 <strcpy>
    72c4:	394002a0 	ldrb	w0, [x21]
    72c8:	7101001f 	cmp	w0, #0x40
    72cc:	54002da0 	b.eq	7880 <__loadlocale+0x6c0>  // b.none
    72d0:	52800019 	mov	w25, #0x0                   	// #0
    72d4:	52800015 	mov	w21, #0x0                   	// #0
    72d8:	5280001a 	mov	w26, #0x0                   	// #0
    72dc:	394203e1 	ldrb	w1, [sp, #128]
    72e0:	51010421 	sub	w1, w1, #0x41
    72e4:	7100d03f 	cmp	w1, #0x34
    72e8:	540005a8 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    72ec:	90000020 	adrp	x0, b000 <_findenv_r+0x10>
    72f0:	9133a000 	add	x0, x0, #0xce8
    72f4:	a90573fb 	stp	x27, x28, [sp, #80]
    72f8:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    72fc:	10000061 	adr	x1, 7308 <__loadlocale+0x148>
    7300:	8b20a820 	add	x0, x1, w0, sxth #2
    7304:	d61f0000 	br	x0
    7308:	394207e0 	ldrb	w0, [sp, #129]
    730c:	121a7800 	and	w0, w0, #0xffffffdf
    7310:	12001c00 	and	w0, w0, #0xff
    7314:	7101401f 	cmp	w0, #0x50
    7318:	54000401 	b.ne	7398 <__loadlocale+0x1d8>  // b.any
    731c:	d2800042 	mov	x2, #0x2                   	// #2
    7320:	aa1803e0 	mov	x0, x24
    7324:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7328:	91320021 	add	x1, x1, #0xc80
    732c:	94000c19 	bl	a390 <strncpy>
    7330:	9101e3e1 	add	x1, sp, #0x78
    7334:	91020be0 	add	x0, sp, #0x82
    7338:	52800142 	mov	w2, #0xa                   	// #10
    733c:	94000cc1 	bl	a640 <strtol>
    7340:	f9403fe1 	ldr	x1, [sp, #120]
    7344:	39400021 	ldrb	w1, [x1]
    7348:	35000281 	cbnz	w1, 7398 <__loadlocale+0x1d8>
    734c:	f10e901f 	cmp	x0, #0x3a4
    7350:	540030a0 	b.eq	7964 <__loadlocale+0x7a4>  // b.none
    7354:	54002f2c 	b.gt	7938 <__loadlocale+0x778>
    7358:	f10d881f 	cmp	x0, #0x362
    735c:	54002dec 	b.gt	7918 <__loadlocale+0x758>
    7360:	f10d441f 	cmp	x0, #0x351
    7364:	54002c8c 	b.gt	78f4 <__loadlocale+0x734>
    7368:	f106d41f 	cmp	x0, #0x1b5
    736c:	54002da0 	b.eq	7920 <__loadlocale+0x760>  // b.none
    7370:	d10b4000 	sub	x0, x0, #0x2d0
    7374:	f100dc1f 	cmp	x0, #0x37
    7378:	54000108 	b.hi	7398 <__loadlocale+0x1d8>  // b.pmore
    737c:	d2800021 	mov	x1, #0x1                   	// #1
    7380:	d280003c 	mov	x28, #0x1                   	// #1
    7384:	f2a00041 	movk	x1, #0x2, lsl #16
    7388:	9ac02380 	lsl	x0, x28, x0
    738c:	f2e01001 	movk	x1, #0x80, lsl #48
    7390:	ea01001f 	tst	x0, x1
    7394:	54000e21 	b.ne	7558 <__loadlocale+0x398>  // b.any
    7398:	a94573fb 	ldp	x27, x28, [sp, #80]
    739c:	d2800014 	mov	x20, #0x0                   	// #0
    73a0:	aa1403e0 	mov	x0, x20
    73a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    73a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    73ac:	a94363f7 	ldp	x23, x24, [sp, #48]
    73b0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    73b4:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    73b8:	d65f03c0 	ret
    73bc:	910203f8 	add	x24, sp, #0x80
    73c0:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    73c4:	aa1803e0 	mov	x0, x24
    73c8:	912fa021 	add	x1, x1, #0xbe8
    73cc:	52800019 	mov	w25, #0x0                   	// #0
    73d0:	5280001a 	mov	w26, #0x0                   	// #0
    73d4:	94000aeb 	bl	9f80 <strcpy>
    73d8:	17ffffc1 	b	72dc <__loadlocale+0x11c>
    73dc:	aa1503e1 	mov	x1, x21
    73e0:	aa1303e0 	mov	x0, x19
    73e4:	94000ae7 	bl	9f80 <strcpy>
    73e8:	17ffff92 	b	7230 <__loadlocale+0x70>
    73ec:	39400660 	ldrb	w0, [x19, #1]
    73f0:	5100b400 	sub	w0, w0, #0x2d
    73f4:	12001c00 	and	w0, w0, #0xff
    73f8:	7100041f 	cmp	w0, #0x1
    73fc:	54fffd08 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    7400:	91000a75 	add	x21, x19, #0x2
    7404:	910203f8 	add	x24, sp, #0x80
    7408:	aa1503e1 	mov	x1, x21
    740c:	aa1803e0 	mov	x0, x24
    7410:	94000adc 	bl	9f80 <strcpy>
    7414:	aa1803e0 	mov	x0, x24
    7418:	52800801 	mov	w1, #0x40                  	// #64
    741c:	94000a5e 	bl	9d94 <strchr>
    7420:	b4000040 	cbz	x0, 7428 <__loadlocale+0x268>
    7424:	3900001f 	strb	wzr, [x0]
    7428:	aa1803e0 	mov	x0, x24
    742c:	94000b65 	bl	a1c0 <strlen>
    7430:	8b0002b5 	add	x21, x21, x0
    7434:	17ffffa4 	b	72c4 <__loadlocale+0x104>
    7438:	394006a0 	ldrb	w0, [x21, #1]
    743c:	51010400 	sub	w0, w0, #0x41
    7440:	12001c00 	and	w0, w0, #0xff
    7444:	7100641f 	cmp	w0, #0x19
    7448:	54fffaa8 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    744c:	39400aa0 	ldrb	w0, [x21, #2]
    7450:	51010400 	sub	w0, w0, #0x41
    7454:	12001c00 	and	w0, w0, #0xff
    7458:	7100641f 	cmp	w0, #0x19
    745c:	54fffa08 	b.hi	739c <__loadlocale+0x1dc>  // b.pmore
    7460:	39400ea0 	ldrb	w0, [x21, #3]
    7464:	91000eb5 	add	x21, x21, #0x3
    7468:	17ffff8d 	b	729c <__loadlocale+0xdc>
    746c:	9000003b 	adrp	x27, b000 <_findenv_r+0x10>
    7470:	9130a37b 	add	x27, x27, #0xc28
    7474:	aa1b03e1 	mov	x1, x27
    7478:	aa1803e0 	mov	x0, x24
    747c:	94000a0d 	bl	9cb0 <strcasecmp>
    7480:	340000c0 	cbz	w0, 7498 <__loadlocale+0x2d8>
    7484:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7488:	aa1803e0 	mov	x0, x24
    748c:	9130c021 	add	x1, x1, #0xc30
    7490:	94000a08 	bl	9cb0 <strcasecmp>
    7494:	35fff820 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7498:	aa1b03e1 	mov	x1, x27
    749c:	aa1803e0 	mov	x0, x24
    74a0:	94000ab8 	bl	9f80 <strcpy>
    74a4:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    74a8:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    74ac:	9123c37b 	add	x27, x27, #0x8f0
    74b0:	91294042 	add	x2, x2, #0xa50
    74b4:	528000dc 	mov	w28, #0x6                   	// #6
    74b8:	71000aff 	cmp	w23, #0x2
    74bc:	54001b00 	b.eq	781c <__loadlocale+0x65c>  // b.none
    74c0:	71001aff 	cmp	w23, #0x6
    74c4:	54000081 	b.ne	74d4 <__loadlocale+0x314>  // b.any
    74c8:	aa1803e1 	mov	x1, x24
    74cc:	91060ac0 	add	x0, x22, #0x182
    74d0:	94000aac 	bl	9f80 <strcpy>
    74d4:	aa1303e1 	mov	x1, x19
    74d8:	aa1403e0 	mov	x0, x20
    74dc:	94000aa9 	bl	9f80 <strcpy>
    74e0:	aa0003f4 	mov	x20, x0
    74e4:	aa1403e0 	mov	x0, x20
    74e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    74ec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    74f0:	a94363f7 	ldp	x23, x24, [sp, #48]
    74f4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    74f8:	a94573fb 	ldp	x27, x28, [sp, #80]
    74fc:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7500:	d65f03c0 	ret
    7504:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7508:	aa1803e0 	mov	x0, x24
    750c:	91334021 	add	x1, x1, #0xcd0
    7510:	d2800062 	mov	x2, #0x3                   	// #3
    7514:	94000b7b 	bl	a300 <strncasecmp>
    7518:	35fff400 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    751c:	39420fe0 	ldrb	w0, [sp, #131]
    7520:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7524:	91336021 	add	x1, x1, #0xcd8
    7528:	7100b41f 	cmp	w0, #0x2d
    752c:	910283e0 	add	x0, sp, #0xa0
    7530:	9a801400 	cinc	x0, x0, eq  // eq = none
    7534:	d1007400 	sub	x0, x0, #0x1d
    7538:	94000a52 	bl	9e80 <strcmp>
    753c:	35fff2e0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7540:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7544:	aa1803e0 	mov	x0, x24
    7548:	91338021 	add	x1, x1, #0xce0
    754c:	d503201f 	nop
    7550:	5280003c 	mov	w28, #0x1                   	// #1
    7554:	94000a8b 	bl	9f80 <strcpy>
    7558:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    755c:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    7560:	9122837b 	add	x27, x27, #0x8a0
    7564:	91284042 	add	x2, x2, #0xa10
    7568:	17ffffd4 	b	74b8 <__loadlocale+0x2f8>
    756c:	9000003b 	adrp	x27, b000 <_findenv_r+0x10>
    7570:	9131637b 	add	x27, x27, #0xc58
    7574:	aa1b03e1 	mov	x1, x27
    7578:	aa1803e0 	mov	x0, x24
    757c:	940009cd 	bl	9cb0 <strcasecmp>
    7580:	35fff0c0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7584:	aa1b03e1 	mov	x1, x27
    7588:	aa1803e0 	mov	x0, x24
    758c:	94000a7d 	bl	9f80 <strcpy>
    7590:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    7594:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    7598:	912f037b 	add	x27, x27, #0xbc0
    759c:	912d0042 	add	x2, x2, #0xb40
    75a0:	5280005c 	mov	w28, #0x2                   	// #2
    75a4:	17ffffc5 	b	74b8 <__loadlocale+0x2f8>
    75a8:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    75ac:	aa1803e0 	mov	x0, x24
    75b0:	91330021 	add	x1, x1, #0xcc0
    75b4:	940009bf 	bl	9cb0 <strcasecmp>
    75b8:	35ffef00 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    75bc:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    75c0:	aa1803e0 	mov	x0, x24
    75c4:	91332021 	add	x1, x1, #0xcc8
    75c8:	17ffffe2 	b	7550 <__loadlocale+0x390>
    75cc:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    75d0:	aa1803e0 	mov	x0, x24
    75d4:	91322021 	add	x1, x1, #0xc88
    75d8:	d2800082 	mov	x2, #0x4                   	// #4
    75dc:	94000b49 	bl	a300 <strncasecmp>
    75e0:	35ffedc0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    75e4:	394213e0 	ldrb	w0, [sp, #132]
    75e8:	394217e1 	ldrb	w1, [sp, #133]
    75ec:	7100b41f 	cmp	w0, #0x2d
    75f0:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    75f4:	121a7800 	and	w0, w0, #0xffffffdf
    75f8:	12001c00 	and	w0, w0, #0xff
    75fc:	7101481f 	cmp	w0, #0x52
    7600:	54001aa0 	b.eq	7954 <__loadlocale+0x794>  // b.none
    7604:	7101541f 	cmp	w0, #0x55
    7608:	54ffec81 	b.ne	7398 <__loadlocale+0x1d8>  // b.any
    760c:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7610:	aa1803e0 	mov	x0, x24
    7614:	91326021 	add	x1, x1, #0xc98
    7618:	17ffffce 	b	7550 <__loadlocale+0x390>
    761c:	9000003b 	adrp	x27, b000 <_findenv_r+0x10>
    7620:	9130e37b 	add	x27, x27, #0xc38
    7624:	aa1b03e1 	mov	x1, x27
    7628:	aa1803e0 	mov	x0, x24
    762c:	940009a1 	bl	9cb0 <strcasecmp>
    7630:	35ffeb40 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7634:	aa1b03e1 	mov	x1, x27
    7638:	aa1803e0 	mov	x0, x24
    763c:	94000a51 	bl	9f80 <strcpy>
    7640:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    7644:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    7648:	9137037b 	add	x27, x27, #0xdc0
    764c:	91320042 	add	x2, x2, #0xc80
    7650:	5280011c 	mov	w28, #0x8                   	// #8
    7654:	17ffff99 	b	74b8 <__loadlocale+0x2f8>
    7658:	9000003b 	adrp	x27, b000 <_findenv_r+0x10>
    765c:	912fa37b 	add	x27, x27, #0xbe8
    7660:	aa1b03e1 	mov	x1, x27
    7664:	aa1803e0 	mov	x0, x24
    7668:	94000992 	bl	9cb0 <strcasecmp>
    766c:	35ffe960 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7670:	aa1b03e1 	mov	x1, x27
    7674:	aa1803e0 	mov	x0, x24
    7678:	17ffffb6 	b	7550 <__loadlocale+0x390>
    767c:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7680:	aa1803e0 	mov	x0, x24
    7684:	91328021 	add	x1, x1, #0xca0
    7688:	d2800102 	mov	x2, #0x8                   	// #8
    768c:	94000b1d 	bl	a300 <strncasecmp>
    7690:	35ffe840 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7694:	394223e0 	ldrb	w0, [sp, #136]
    7698:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    769c:	9132c021 	add	x1, x1, #0xcb0
    76a0:	7100b41f 	cmp	w0, #0x2d
    76a4:	910283e0 	add	x0, sp, #0xa0
    76a8:	9a801400 	cinc	x0, x0, eq  // eq = none
    76ac:	d1006000 	sub	x0, x0, #0x18
    76b0:	94000980 	bl	9cb0 <strcasecmp>
    76b4:	35ffe720 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    76b8:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    76bc:	aa1803e0 	mov	x0, x24
    76c0:	9132e021 	add	x1, x1, #0xcb8
    76c4:	17ffffa3 	b	7550 <__loadlocale+0x390>
    76c8:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    76cc:	aa1803e0 	mov	x0, x24
    76d0:	91310021 	add	x1, x1, #0xc40
    76d4:	d2800062 	mov	x2, #0x3                   	// #3
    76d8:	94000b0a 	bl	a300 <strncasecmp>
    76dc:	35ffe5e0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    76e0:	39420fe0 	ldrb	w0, [sp, #131]
    76e4:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    76e8:	91312021 	add	x1, x1, #0xc48
    76ec:	7100b41f 	cmp	w0, #0x2d
    76f0:	910283e0 	add	x0, sp, #0xa0
    76f4:	9a801400 	cinc	x0, x0, eq  // eq = none
    76f8:	d1007400 	sub	x0, x0, #0x1d
    76fc:	9400096d 	bl	9cb0 <strcasecmp>
    7700:	35ffe4c0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7704:	aa1803e0 	mov	x0, x24
    7708:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    770c:	91314021 	add	x1, x1, #0xc50
    7710:	94000a1c 	bl	9f80 <strcpy>
    7714:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    7718:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    771c:	9132437b 	add	x27, x27, #0xc90
    7720:	912f4042 	add	x2, x2, #0xbd0
    7724:	5280007c 	mov	w28, #0x3                   	// #3
    7728:	17ffff64 	b	74b8 <__loadlocale+0x2f8>
    772c:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7730:	aa1803e0 	mov	x0, x24
    7734:	91318021 	add	x1, x1, #0xc60
    7738:	d2800062 	mov	x2, #0x3                   	// #3
    773c:	94000af1 	bl	a300 <strncasecmp>
    7740:	35ffe2c0 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7744:	39420fe0 	ldrb	w0, [sp, #131]
    7748:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    774c:	d2800082 	mov	x2, #0x4                   	// #4
    7750:	9131a021 	add	x1, x1, #0xc68
    7754:	7100b41f 	cmp	w0, #0x2d
    7758:	910283e0 	add	x0, sp, #0xa0
    775c:	9a80141b 	cinc	x27, x0, eq  // eq = none
    7760:	d100777b 	sub	x27, x27, #0x1d
    7764:	aa1b03e0 	mov	x0, x27
    7768:	94000ae6 	bl	a300 <strncasecmp>
    776c:	35ffe160 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    7770:	39401360 	ldrb	w0, [x27, #4]
    7774:	9101e3e1 	add	x1, sp, #0x78
    7778:	52800142 	mov	w2, #0xa                   	// #10
    777c:	7100b41f 	cmp	w0, #0x2d
    7780:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    7784:	91001000 	add	x0, x0, #0x4
    7788:	94000bae 	bl	a640 <strtol>
    778c:	aa0003e3 	mov	x3, x0
    7790:	d1000400 	sub	x0, x0, #0x1
    7794:	f90037e3 	str	x3, [sp, #104]
    7798:	f1003c1f 	cmp	x0, #0xf
    779c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    77a0:	54ffdfc0 	b.eq	7398 <__loadlocale+0x1d8>  // b.none
    77a4:	f9403fe0 	ldr	x0, [sp, #120]
    77a8:	39400000 	ldrb	w0, [x0]
    77ac:	35ffdf60 	cbnz	w0, 7398 <__loadlocale+0x1d8>
    77b0:	aa1803e0 	mov	x0, x24
    77b4:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    77b8:	9131c021 	add	x1, x1, #0xc70
    77bc:	940009f1 	bl	9f80 <strcpy>
    77c0:	f94037e3 	ldr	x3, [sp, #104]
    77c4:	910227e4 	add	x4, sp, #0x89
    77c8:	f100287f 	cmp	x3, #0xa
    77cc:	5400008d 	b.le	77dc <__loadlocale+0x61c>
    77d0:	91022be4 	add	x4, sp, #0x8a
    77d4:	52800620 	mov	w0, #0x31                  	// #49
    77d8:	390227e0 	strb	w0, [sp, #137]
    77dc:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    77e0:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    77e4:	f28ccce1 	movk	x1, #0x6667
    77e8:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    77ec:	9122837b 	add	x27, x27, #0x8a0
    77f0:	91284042 	add	x2, x2, #0xa10
    77f4:	9b417c61 	smulh	x1, x3, x1
    77f8:	5280003c 	mov	w28, #0x1                   	// #1
    77fc:	3900049f 	strb	wzr, [x4, #1]
    7800:	9342fc21 	asr	x1, x1, #2
    7804:	cb83fc21 	sub	x1, x1, x3, asr #63
    7808:	8b010821 	add	x1, x1, x1, lsl #2
    780c:	cb010460 	sub	x0, x3, x1, lsl #1
    7810:	1100c000 	add	w0, w0, #0x30
    7814:	39000080 	strb	w0, [x4]
    7818:	17ffff28 	b	74b8 <__loadlocale+0x2f8>
    781c:	aa1803e1 	mov	x1, x24
    7820:	91058ac0 	add	x0, x22, #0x162
    7824:	f90037e2 	str	x2, [sp, #104]
    7828:	940009d6 	bl	9f80 <strcpy>
    782c:	f94037e2 	ldr	x2, [sp, #104]
    7830:	a90e6ec2 	stp	x2, x27, [x22, #224]
    7834:	aa1803e1 	mov	x1, x24
    7838:	390582dc 	strb	w28, [x22, #352]
    783c:	aa1603e0 	mov	x0, x22
    7840:	94000d6c 	bl	adf0 <__set_ctype>
    7844:	35000139 	cbnz	w25, 7868 <__loadlocale+0x6a8>
    7848:	7100079f 	cmp	w28, #0x1
    784c:	520002b5 	eor	w21, w21, #0x1
    7850:	1a9fd7e0 	cset	w0, gt
    7854:	6a0002bf 	tst	w21, w0
    7858:	54000080 	b.eq	7868 <__loadlocale+0x6a8>  // b.none
    785c:	394203e0 	ldrb	w0, [sp, #128]
    7860:	7101541f 	cmp	w0, #0x55
    7864:	1a9f07f9 	cset	w25, ne  // ne = any
    7868:	7100035f 	cmp	w26, #0x0
    786c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    7870:	b900f2d9 	str	w25, [x22, #240]
    7874:	17ffff18 	b	74d4 <__loadlocale+0x314>
    7878:	910006b5 	add	x21, x21, #0x1
    787c:	17fffee2 	b	7404 <__loadlocale+0x244>
    7880:	a90573fb 	stp	x27, x28, [sp, #80]
    7884:	910006bb 	add	x27, x21, #0x1
    7888:	aa1b03e0 	mov	x0, x27
    788c:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7890:	52800019 	mov	w25, #0x0                   	// #0
    7894:	91300021 	add	x1, x1, #0xc00
    7898:	5280003a 	mov	w26, #0x1                   	// #1
    789c:	94000979 	bl	9e80 <strcmp>
    78a0:	2a0003f5 	mov	w21, w0
    78a4:	35000060 	cbnz	w0, 78b0 <__loadlocale+0x6f0>
    78a8:	a94573fb 	ldp	x27, x28, [sp, #80]
    78ac:	17fffe8c 	b	72dc <__loadlocale+0x11c>
    78b0:	aa1b03e0 	mov	x0, x27
    78b4:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    78b8:	5280001a 	mov	w26, #0x0                   	// #0
    78bc:	91304021 	add	x1, x1, #0xc10
    78c0:	52800035 	mov	w21, #0x1                   	// #1
    78c4:	9400096f 	bl	9e80 <strcmp>
    78c8:	2a0003f9 	mov	w25, w0
    78cc:	34fffee0 	cbz	w0, 78a8 <__loadlocale+0x6e8>
    78d0:	aa1b03e0 	mov	x0, x27
    78d4:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    78d8:	91308021 	add	x1, x1, #0xc20
    78dc:	94000969 	bl	9e80 <strcmp>
    78e0:	7100001f 	cmp	w0, #0x0
    78e4:	52800015 	mov	w21, #0x0                   	// #0
    78e8:	1a9f17f9 	cset	w25, eq  // eq = none
    78ec:	a94573fb 	ldp	x27, x28, [sp, #80]
    78f0:	17fffe7b 	b	72dc <__loadlocale+0x11c>
    78f4:	d10d4800 	sub	x0, x0, #0x352
    78f8:	d280003c 	mov	x28, #0x1                   	// #1
    78fc:	d28234a1 	mov	x1, #0x11a5                	// #4517
    7900:	f2a00021 	movk	x1, #0x1, lsl #16
    7904:	9ac02380 	lsl	x0, x28, x0
    7908:	ea01001f 	tst	x0, x1
    790c:	54ffe261 	b.ne	7558 <__loadlocale+0x398>  // b.any
    7910:	a94573fb 	ldp	x27, x28, [sp, #80]
    7914:	17fffea2 	b	739c <__loadlocale+0x1dc>
    7918:	f10da81f 	cmp	x0, #0x36a
    791c:	54ffd3e1 	b.ne	7398 <__loadlocale+0x1d8>  // b.any
    7920:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    7924:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    7928:	9122837b 	add	x27, x27, #0x8a0
    792c:	91284042 	add	x2, x2, #0xa10
    7930:	5280003c 	mov	w28, #0x1                   	// #1
    7934:	17fffee1 	b	74b8 <__loadlocale+0x2f8>
    7938:	f111941f 	cmp	x0, #0x465
    793c:	54ffff20 	b.eq	7920 <__loadlocale+0x760>  // b.none
    7940:	d1138800 	sub	x0, x0, #0x4e2
    7944:	f100201f 	cmp	x0, #0x8
    7948:	54fffec9 	b.ls	7920 <__loadlocale+0x760>  // b.plast
    794c:	a94573fb 	ldp	x27, x28, [sp, #80]
    7950:	17fffe93 	b	739c <__loadlocale+0x1dc>
    7954:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7958:	aa1803e0 	mov	x0, x24
    795c:	91324021 	add	x1, x1, #0xc90
    7960:	17fffefc 	b	7550 <__loadlocale+0x390>
    7964:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0x50>
    7968:	f0000002 	adrp	x2, a000 <strcpy+0x80>
    796c:	912f037b 	add	x27, x27, #0xbc0
    7970:	912d0042 	add	x2, x2, #0xb40
    7974:	5280005c 	mov	w28, #0x2                   	// #2
    7978:	17fffed0 	b	74b8 <__loadlocale+0x2f8>
    797c:	d503201f 	nop

0000000000007980 <__get_locale_env>:
    7980:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7984:	910003fd 	mov	x29, sp
    7988:	a90153f3 	stp	x19, x20, [sp, #16]
    798c:	2a0103f4 	mov	w20, w1
    7990:	aa0003f3 	mov	x19, x0
    7994:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    7998:	91356021 	add	x1, x1, #0xd58
    799c:	94000dd5 	bl	b0f0 <_getenv_r>
    79a0:	b4000060 	cbz	x0, 79ac <__get_locale_env+0x2c>
    79a4:	39400001 	ldrb	w1, [x0]
    79a8:	35000201 	cbnz	w1, 79e8 <__get_locale_env+0x68>
    79ac:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    79b0:	913dc021 	add	x1, x1, #0xf70
    79b4:	aa1303e0 	mov	x0, x19
    79b8:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    79bc:	94000dcd 	bl	b0f0 <_getenv_r>
    79c0:	b4000060 	cbz	x0, 79cc <__get_locale_env+0x4c>
    79c4:	39400001 	ldrb	w1, [x0]
    79c8:	35000101 	cbnz	w1, 79e8 <__get_locale_env+0x68>
    79cc:	90000021 	adrp	x1, b000 <_findenv_r+0x10>
    79d0:	aa1303e0 	mov	x0, x19
    79d4:	91358021 	add	x1, x1, #0xd60
    79d8:	94000dc6 	bl	b0f0 <_getenv_r>
    79dc:	b50000c0 	cbnz	x0, 79f4 <__get_locale_env+0x74>
    79e0:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    79e4:	91032000 	add	x0, x0, #0xc8
    79e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    79ec:	a8c27bfd 	ldp	x29, x30, [sp], #32
    79f0:	d65f03c0 	ret
    79f4:	39400001 	ldrb	w1, [x0]
    79f8:	35ffff81 	cbnz	w1, 79e8 <__get_locale_env+0x68>
    79fc:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    7a00:	91032000 	add	x0, x0, #0xc8
    7a04:	17fffff9 	b	79e8 <__get_locale_env+0x68>
    7a08:	d503201f 	nop
    7a0c:	d503201f 	nop

0000000000007a10 <_setlocale_r.part.0>:
    7a10:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    7a14:	910003fd 	mov	x29, sp
    7a18:	a9025bf5 	stp	x21, x22, [sp, #32]
    7a1c:	d0000035 	adrp	x21, d000 <impure_data+0x680>
    7a20:	d0000036 	adrp	x22, d000 <impure_data+0x680>
    7a24:	913302b5 	add	x21, x21, #0xcc0
    7a28:	9103a2d6 	add	x22, x22, #0xe8
    7a2c:	a90153f3 	stp	x19, x20, [sp, #16]
    7a30:	910082d4 	add	x20, x22, #0x20
    7a34:	a9046bf9 	stp	x25, x26, [sp, #64]
    7a38:	910082b9 	add	x25, x21, #0x20
    7a3c:	aa0003fa 	mov	x26, x0
    7a40:	aa1903f3 	mov	x19, x25
    7a44:	a90363f7 	stp	x23, x24, [sp, #48]
    7a48:	aa0203f8 	mov	x24, x2
    7a4c:	910382b7 	add	x23, x21, #0xe0
    7a50:	a90573fb 	stp	x27, x28, [sp, #80]
    7a54:	2a0103fc 	mov	w28, w1
    7a58:	aa1403fb 	mov	x27, x20
    7a5c:	d503201f 	nop
    7a60:	aa1b03e1 	mov	x1, x27
    7a64:	aa1303e0 	mov	x0, x19
    7a68:	91008273 	add	x19, x19, #0x20
    7a6c:	94000945 	bl	9f80 <strcpy>
    7a70:	9100837b 	add	x27, x27, #0x20
    7a74:	eb17027f 	cmp	x19, x23
    7a78:	54ffff41 	b.ne	7a60 <_setlocale_r.part.0+0x50>  // b.any
    7a7c:	39400300 	ldrb	w0, [x24]
    7a80:	350005e0 	cbnz	w0, 7b3c <_setlocale_r.part.0+0x12c>
    7a84:	35000edc 	cbnz	w28, 7c5c <_setlocale_r.part.0+0x24c>
    7a88:	aa1903f7 	mov	x23, x25
    7a8c:	52800033 	mov	w19, #0x1                   	// #1
    7a90:	2a1303e1 	mov	w1, w19
    7a94:	aa1a03e0 	mov	x0, x26
    7a98:	97ffffba 	bl	7980 <__get_locale_env>
    7a9c:	aa0003f5 	mov	x21, x0
    7aa0:	11000673 	add	w19, w19, #0x1
    7aa4:	940009c7 	bl	a1c0 <strlen>
    7aa8:	aa0003e2 	mov	x2, x0
    7aac:	aa1503e1 	mov	x1, x21
    7ab0:	aa1703e0 	mov	x0, x23
    7ab4:	f1007c5f 	cmp	x2, #0x1f
    7ab8:	54000be8 	b.hi	7c34 <_setlocale_r.part.0+0x224>  // b.pmore
    7abc:	910082f7 	add	x23, x23, #0x20
    7ac0:	94000930 	bl	9f80 <strcpy>
    7ac4:	71001e7f 	cmp	w19, #0x7
    7ac8:	54fffe41 	b.ne	7a90 <_setlocale_r.part.0+0x80>  // b.any
    7acc:	d0000038 	adrp	x24, d000 <impure_data+0x680>
    7ad0:	91368318 	add	x24, x24, #0xda0
    7ad4:	91008318 	add	x24, x24, #0x20
    7ad8:	aa1903f7 	mov	x23, x25
    7adc:	aa1803f5 	mov	x21, x24
    7ae0:	52800033 	mov	w19, #0x1                   	// #1
    7ae4:	d503201f 	nop
    7ae8:	aa1403e1 	mov	x1, x20
    7aec:	aa1503e0 	mov	x0, x21
    7af0:	94000924 	bl	9f80 <strcpy>
    7af4:	aa1703e2 	mov	x2, x23
    7af8:	2a1303e1 	mov	w1, w19
    7afc:	aa1603e0 	mov	x0, x22
    7b00:	97fffdb0 	bl	71c0 <__loadlocale>
    7b04:	b4000c60 	cbz	x0, 7c90 <_setlocale_r.part.0+0x280>
    7b08:	11000673 	add	w19, w19, #0x1
    7b0c:	910082b5 	add	x21, x21, #0x20
    7b10:	91008294 	add	x20, x20, #0x20
    7b14:	910082f7 	add	x23, x23, #0x20
    7b18:	71001e7f 	cmp	w19, #0x7
    7b1c:	54fffe61 	b.ne	7ae8 <_setlocale_r.part.0+0xd8>  // b.any
    7b20:	a94153f3 	ldp	x19, x20, [sp, #16]
    7b24:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7b28:	a94363f7 	ldp	x23, x24, [sp, #48]
    7b2c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7b30:	a94573fb 	ldp	x27, x28, [sp, #80]
    7b34:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7b38:	17fffd72 	b	7100 <currentlocale>
    7b3c:	3500057c 	cbnz	w28, 7be8 <_setlocale_r.part.0+0x1d8>
    7b40:	aa1803e0 	mov	x0, x24
    7b44:	528005e1 	mov	w1, #0x2f                  	// #47
    7b48:	94000893 	bl	9d94 <strchr>
    7b4c:	aa0003f3 	mov	x19, x0
    7b50:	b5000060 	cbnz	x0, 7b5c <_setlocale_r.part.0+0x14c>
    7b54:	14000085 	b	7d68 <_setlocale_r.part.0+0x358>
    7b58:	91000673 	add	x19, x19, #0x1
    7b5c:	39400660 	ldrb	w0, [x19, #1]
    7b60:	7100bc1f 	cmp	w0, #0x2f
    7b64:	54ffffa0 	b.eq	7b58 <_setlocale_r.part.0+0x148>  // b.none
    7b68:	34000660 	cbz	w0, 7c34 <_setlocale_r.part.0+0x224>
    7b6c:	aa1903fb 	mov	x27, x25
    7b70:	52800037 	mov	w23, #0x1                   	// #1
    7b74:	cb180262 	sub	x2, x19, x24
    7b78:	71007c5f 	cmp	w2, #0x1f
    7b7c:	540005cc 	b.gt	7c34 <_setlocale_r.part.0+0x224>
    7b80:	11000442 	add	w2, w2, #0x1
    7b84:	aa1803e1 	mov	x1, x24
    7b88:	aa1b03e0 	mov	x0, x27
    7b8c:	110006f7 	add	w23, w23, #0x1
    7b90:	93407c42 	sxtw	x2, w2
    7b94:	9400096b 	bl	a140 <strlcpy>
    7b98:	39400260 	ldrb	w0, [x19]
    7b9c:	7100bc1f 	cmp	w0, #0x2f
    7ba0:	540000a1 	b.ne	7bb4 <_setlocale_r.part.0+0x1a4>  // b.any
    7ba4:	d503201f 	nop
    7ba8:	38401e60 	ldrb	w0, [x19, #1]!
    7bac:	7100bc1f 	cmp	w0, #0x2f
    7bb0:	54ffffc0 	b.eq	7ba8 <_setlocale_r.part.0+0x198>  // b.none
    7bb4:	34000c00 	cbz	w0, 7d34 <_setlocale_r.part.0+0x324>
    7bb8:	aa1303e1 	mov	x1, x19
    7bbc:	d503201f 	nop
    7bc0:	38401c20 	ldrb	w0, [x1, #1]!
    7bc4:	7100bc1f 	cmp	w0, #0x2f
    7bc8:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    7bcc:	54ffffa1 	b.ne	7bc0 <_setlocale_r.part.0+0x1b0>  // b.any
    7bd0:	9100837b 	add	x27, x27, #0x20
    7bd4:	71001eff 	cmp	w23, #0x7
    7bd8:	54fff7a0 	b.eq	7acc <_setlocale_r.part.0+0xbc>  // b.none
    7bdc:	aa1303f8 	mov	x24, x19
    7be0:	aa0103f3 	mov	x19, x1
    7be4:	17ffffe4 	b	7b74 <_setlocale_r.part.0+0x164>
    7be8:	aa1803e0 	mov	x0, x24
    7bec:	94000975 	bl	a1c0 <strlen>
    7bf0:	f1007c1f 	cmp	x0, #0x1f
    7bf4:	54000208 	b.hi	7c34 <_setlocale_r.part.0+0x224>  // b.pmore
    7bf8:	937b7f80 	sbfiz	x0, x28, #5, #32
    7bfc:	aa1803e1 	mov	x1, x24
    7c00:	8b0002b5 	add	x21, x21, x0
    7c04:	aa1503e0 	mov	x0, x21
    7c08:	940008de 	bl	9f80 <strcpy>
    7c0c:	aa1503e2 	mov	x2, x21
    7c10:	2a1c03e1 	mov	w1, w28
    7c14:	aa1603e0 	mov	x0, x22
    7c18:	a94153f3 	ldp	x19, x20, [sp, #16]
    7c1c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7c20:	a94363f7 	ldp	x23, x24, [sp, #48]
    7c24:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7c28:	a94573fb 	ldp	x27, x28, [sp, #80]
    7c2c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7c30:	17fffd64 	b	71c0 <__loadlocale>
    7c34:	528002c0 	mov	w0, #0x16                  	// #22
    7c38:	b9000340 	str	w0, [x26]
    7c3c:	d2800000 	mov	x0, #0x0                   	// #0
    7c40:	a94153f3 	ldp	x19, x20, [sp, #16]
    7c44:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7c48:	a94363f7 	ldp	x23, x24, [sp, #48]
    7c4c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7c50:	a94573fb 	ldp	x27, x28, [sp, #80]
    7c54:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7c58:	d65f03c0 	ret
    7c5c:	2a1c03e1 	mov	w1, w28
    7c60:	aa1a03e0 	mov	x0, x26
    7c64:	97ffff47 	bl	7980 <__get_locale_env>
    7c68:	aa0003f3 	mov	x19, x0
    7c6c:	94000955 	bl	a1c0 <strlen>
    7c70:	f1007c1f 	cmp	x0, #0x1f
    7c74:	54fffe08 	b.hi	7c34 <_setlocale_r.part.0+0x224>  // b.pmore
    7c78:	937b7f80 	sbfiz	x0, x28, #5, #32
    7c7c:	aa1303e1 	mov	x1, x19
    7c80:	8b0002b5 	add	x21, x21, x0
    7c84:	aa1503e0 	mov	x0, x21
    7c88:	940008be 	bl	9f80 <strcpy>
    7c8c:	17ffffe0 	b	7c0c <_setlocale_r.part.0+0x1fc>
    7c90:	90000020 	adrp	x0, b000 <_findenv_r+0x10>
    7c94:	b9400357 	ldr	w23, [x26]
    7c98:	912f8015 	add	x21, x0, #0xbe0
    7c9c:	52800034 	mov	w20, #0x1                   	// #1
    7ca0:	6b14027f 	cmp	w19, w20
    7ca4:	540000e1 	b.ne	7cc0 <_setlocale_r.part.0+0x2b0>  // b.any
    7ca8:	1400001a 	b	7d10 <_setlocale_r.part.0+0x300>
    7cac:	11000694 	add	w20, w20, #0x1
    7cb0:	91008339 	add	x25, x25, #0x20
    7cb4:	91008318 	add	x24, x24, #0x20
    7cb8:	6b14027f 	cmp	w19, w20
    7cbc:	540002a0 	b.eq	7d10 <_setlocale_r.part.0+0x300>  // b.none
    7cc0:	aa1803e1 	mov	x1, x24
    7cc4:	aa1903e0 	mov	x0, x25
    7cc8:	940008ae 	bl	9f80 <strcpy>
    7ccc:	aa1903e2 	mov	x2, x25
    7cd0:	2a1403e1 	mov	w1, w20
    7cd4:	aa1603e0 	mov	x0, x22
    7cd8:	97fffd3a 	bl	71c0 <__loadlocale>
    7cdc:	b5fffe80 	cbnz	x0, 7cac <_setlocale_r.part.0+0x29c>
    7ce0:	aa1503e1 	mov	x1, x21
    7ce4:	aa1903e0 	mov	x0, x25
    7ce8:	940008a6 	bl	9f80 <strcpy>
    7cec:	91008318 	add	x24, x24, #0x20
    7cf0:	aa1903e2 	mov	x2, x25
    7cf4:	2a1403e1 	mov	w1, w20
    7cf8:	aa1603e0 	mov	x0, x22
    7cfc:	11000694 	add	w20, w20, #0x1
    7d00:	97fffd30 	bl	71c0 <__loadlocale>
    7d04:	91008339 	add	x25, x25, #0x20
    7d08:	6b14027f 	cmp	w19, w20
    7d0c:	54fffda1 	b.ne	7cc0 <_setlocale_r.part.0+0x2b0>  // b.any
    7d10:	b9000357 	str	w23, [x26]
    7d14:	d2800000 	mov	x0, #0x0                   	// #0
    7d18:	a94153f3 	ldp	x19, x20, [sp, #16]
    7d1c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7d20:	a94363f7 	ldp	x23, x24, [sp, #48]
    7d24:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7d28:	a94573fb 	ldp	x27, x28, [sp, #80]
    7d2c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7d30:	d65f03c0 	ret
    7d34:	71001eff 	cmp	w23, #0x7
    7d38:	54ffeca0 	b.eq	7acc <_setlocale_r.part.0+0xbc>  // b.none
    7d3c:	937b7ee0 	sbfiz	x0, x23, #5, #32
    7d40:	8b0002b5 	add	x21, x21, x0
    7d44:	d503201f 	nop
    7d48:	d10082a1 	sub	x1, x21, #0x20
    7d4c:	aa1503e0 	mov	x0, x21
    7d50:	110006f7 	add	w23, w23, #0x1
    7d54:	9400088b 	bl	9f80 <strcpy>
    7d58:	910082b5 	add	x21, x21, #0x20
    7d5c:	71001eff 	cmp	w23, #0x7
    7d60:	54ffff41 	b.ne	7d48 <_setlocale_r.part.0+0x338>  // b.any
    7d64:	17ffff5a 	b	7acc <_setlocale_r.part.0+0xbc>
    7d68:	aa1803e0 	mov	x0, x24
    7d6c:	94000915 	bl	a1c0 <strlen>
    7d70:	f1007c1f 	cmp	x0, #0x1f
    7d74:	54fff608 	b.hi	7c34 <_setlocale_r.part.0+0x224>  // b.pmore
    7d78:	aa1903f3 	mov	x19, x25
    7d7c:	d503201f 	nop
    7d80:	aa1303e0 	mov	x0, x19
    7d84:	aa1803e1 	mov	x1, x24
    7d88:	91008273 	add	x19, x19, #0x20
    7d8c:	9400087d 	bl	9f80 <strcpy>
    7d90:	eb1302ff 	cmp	x23, x19
    7d94:	54ffff61 	b.ne	7d80 <_setlocale_r.part.0+0x370>  // b.any
    7d98:	17ffff4d 	b	7acc <_setlocale_r.part.0+0xbc>
    7d9c:	d503201f 	nop

0000000000007da0 <_setlocale_r>:
    7da0:	aa0003e5 	mov	x5, x0
    7da4:	7100183f 	cmp	w1, #0x6
    7da8:	54000068 	b.hi	7db4 <_setlocale_r+0x14>  // b.pmore
    7dac:	b40000c2 	cbz	x2, 7dc4 <_setlocale_r+0x24>
    7db0:	17ffff18 	b	7a10 <_setlocale_r.part.0>
    7db4:	528002c1 	mov	w1, #0x16                  	// #22
    7db8:	d2800000 	mov	x0, #0x0                   	// #0
    7dbc:	b90000a1 	str	w1, [x5]
    7dc0:	d65f03c0 	ret
    7dc4:	340000c1 	cbz	w1, 7ddc <_setlocale_r+0x3c>
    7dc8:	937b7c23 	sbfiz	x3, x1, #5, #32
    7dcc:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    7dd0:	9103a000 	add	x0, x0, #0xe8
    7dd4:	8b030000 	add	x0, x0, x3
    7dd8:	d65f03c0 	ret
    7ddc:	17fffcc9 	b	7100 <currentlocale>

0000000000007de0 <__locale_mb_cur_max>:
    7de0:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    7de4:	39492000 	ldrb	w0, [x0, #584]
    7de8:	d65f03c0 	ret
    7dec:	d503201f 	nop

0000000000007df0 <setlocale>:
    7df0:	b0000024 	adrp	x4, c000 <JIS_state_table+0x10>
    7df4:	2a0003e3 	mov	w3, w0
    7df8:	aa0103e2 	mov	x2, x1
    7dfc:	f944bc80 	ldr	x0, [x4, #2424]
    7e00:	7100187f 	cmp	w3, #0x6
    7e04:	54000088 	b.hi	7e14 <setlocale+0x24>  // b.pmore
    7e08:	b4000101 	cbz	x1, 7e28 <setlocale+0x38>
    7e0c:	2a0303e1 	mov	w1, w3
    7e10:	17ffff00 	b	7a10 <_setlocale_r.part.0>
    7e14:	528002c1 	mov	w1, #0x16                  	// #22
    7e18:	d2800003 	mov	x3, #0x0                   	// #0
    7e1c:	b9000001 	str	w1, [x0]
    7e20:	aa0303e0 	mov	x0, x3
    7e24:	d65f03c0 	ret
    7e28:	340000e3 	cbz	w3, 7e44 <setlocale+0x54>
    7e2c:	937b7c63 	sbfiz	x3, x3, #5, #32
    7e30:	d0000020 	adrp	x0, d000 <impure_data+0x680>
    7e34:	9103a000 	add	x0, x0, #0xe8
    7e38:	8b030003 	add	x3, x0, x3
    7e3c:	aa0303e0 	mov	x0, x3
    7e40:	d65f03c0 	ret
    7e44:	17fffcaf 	b	7100 <currentlocale>
    7e48:	d503201f 	nop
    7e4c:	d503201f 	nop

0000000000007e50 <__smakebuf_r>:
    7e50:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    7e54:	910003fd 	mov	x29, sp
    7e58:	79402022 	ldrh	w2, [x1, #16]
    7e5c:	a90153f3 	stp	x19, x20, [sp, #16]
    7e60:	aa0103f3 	mov	x19, x1
    7e64:	36080122 	tbz	w2, #1, 7e88 <__smakebuf_r+0x38>
    7e68:	9101dc20 	add	x0, x1, #0x77
    7e6c:	52800021 	mov	w1, #0x1                   	// #1
    7e70:	f9000260 	str	x0, [x19]
    7e74:	f9000e60 	str	x0, [x19, #24]
    7e78:	b9002261 	str	w1, [x19, #32]
    7e7c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7e80:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    7e84:	d65f03c0 	ret
    7e88:	79c02421 	ldrsh	w1, [x1, #18]
    7e8c:	aa0003f4 	mov	x20, x0
    7e90:	a9025bf5 	stp	x21, x22, [sp, #32]
    7e94:	f9001bf7 	str	x23, [sp, #48]
    7e98:	37f80381 	tbnz	w1, #31, 7f08 <__smakebuf_r+0xb8>
    7e9c:	910123e2 	add	x2, sp, #0x48
    7ea0:	94000c40 	bl	afa0 <_fstat_r>
    7ea4:	37f80300 	tbnz	w0, #31, 7f04 <__smakebuf_r+0xb4>
    7ea8:	b9404fe0 	ldr	w0, [sp, #76]
    7eac:	d2808016 	mov	x22, #0x400                 	// #1024
    7eb0:	52810015 	mov	w21, #0x800                 	// #2048
    7eb4:	aa1603e1 	mov	x1, x22
    7eb8:	12140c00 	and	w0, w0, #0xf000
    7ebc:	7140081f 	cmp	w0, #0x2, lsl #12
    7ec0:	aa1403e0 	mov	x0, x20
    7ec4:	1a9f17f7 	cset	w23, eq  // eq = none
    7ec8:	94000066 	bl	8060 <_malloc_r>
    7ecc:	b5000320 	cbnz	x0, 7f30 <__smakebuf_r+0xe0>
    7ed0:	79c02260 	ldrsh	w0, [x19, #16]
    7ed4:	374805c0 	tbnz	w0, #9, 7f8c <__smakebuf_r+0x13c>
    7ed8:	121e7400 	and	w0, w0, #0xfffffffc
    7edc:	9101de61 	add	x1, x19, #0x77
    7ee0:	321f0000 	orr	w0, w0, #0x2
    7ee4:	52800022 	mov	w2, #0x1                   	// #1
    7ee8:	79002260 	strh	w0, [x19, #16]
    7eec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7ef0:	f9401bf7 	ldr	x23, [sp, #48]
    7ef4:	f9000261 	str	x1, [x19]
    7ef8:	f9000e61 	str	x1, [x19, #24]
    7efc:	b9002262 	str	w2, [x19, #32]
    7f00:	17ffffdf 	b	7e7c <__smakebuf_r+0x2c>
    7f04:	79402262 	ldrh	w2, [x19, #16]
    7f08:	f279005f 	tst	x2, #0x80
    7f0c:	d2808001 	mov	x1, #0x400                 	// #1024
    7f10:	d2800816 	mov	x22, #0x40                  	// #64
    7f14:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    7f18:	aa1603e1 	mov	x1, x22
    7f1c:	aa1403e0 	mov	x0, x20
    7f20:	52800017 	mov	w23, #0x0                   	// #0
    7f24:	52800015 	mov	w21, #0x0                   	// #0
    7f28:	9400004e 	bl	8060 <_malloc_r>
    7f2c:	b4fffd20 	cbz	x0, 7ed0 <__smakebuf_r+0x80>
    7f30:	79c02262 	ldrsh	w2, [x19, #16]
    7f34:	f0ffffe1 	adrp	x1, 6000 <__sflush_r+0x1b0>
    7f38:	9105c021 	add	x1, x1, #0x170
    7f3c:	f9002e81 	str	x1, [x20, #88]
    7f40:	32190042 	orr	w2, w2, #0x80
    7f44:	f9000260 	str	x0, [x19]
    7f48:	79002262 	strh	w2, [x19, #16]
    7f4c:	f9000e60 	str	x0, [x19, #24]
    7f50:	b9002276 	str	w22, [x19, #32]
    7f54:	35000117 	cbnz	w23, 7f74 <__smakebuf_r+0x124>
    7f58:	2a150042 	orr	w2, w2, w21
    7f5c:	79002262 	strh	w2, [x19, #16]
    7f60:	a94153f3 	ldp	x19, x20, [sp, #16]
    7f64:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f68:	f9401bf7 	ldr	x23, [sp, #48]
    7f6c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    7f70:	d65f03c0 	ret
    7f74:	79c02661 	ldrsh	w1, [x19, #18]
    7f78:	aa1403e0 	mov	x0, x20
    7f7c:	94000c65 	bl	b110 <_isatty_r>
    7f80:	350000c0 	cbnz	w0, 7f98 <__smakebuf_r+0x148>
    7f84:	79c02262 	ldrsh	w2, [x19, #16]
    7f88:	17fffff4 	b	7f58 <__smakebuf_r+0x108>
    7f8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f90:	f9401bf7 	ldr	x23, [sp, #48]
    7f94:	17ffffba 	b	7e7c <__smakebuf_r+0x2c>
    7f98:	79402262 	ldrh	w2, [x19, #16]
    7f9c:	121e7442 	and	w2, w2, #0xfffffffc
    7fa0:	32000042 	orr	w2, w2, #0x1
    7fa4:	13003c42 	sxth	w2, w2
    7fa8:	17ffffec 	b	7f58 <__smakebuf_r+0x108>
    7fac:	d503201f 	nop

0000000000007fb0 <__swhatbuf_r>:
    7fb0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    7fb4:	910003fd 	mov	x29, sp
    7fb8:	a90153f3 	stp	x19, x20, [sp, #16]
    7fbc:	aa0103f3 	mov	x19, x1
    7fc0:	79c02421 	ldrsh	w1, [x1, #18]
    7fc4:	f90013f5 	str	x21, [sp, #32]
    7fc8:	aa0203f4 	mov	x20, x2
    7fcc:	aa0303f5 	mov	x21, x3
    7fd0:	37f80201 	tbnz	w1, #31, 8010 <__swhatbuf_r+0x60>
    7fd4:	9100e3e2 	add	x2, sp, #0x38
    7fd8:	94000bf2 	bl	afa0 <_fstat_r>
    7fdc:	37f801a0 	tbnz	w0, #31, 8010 <__swhatbuf_r+0x60>
    7fe0:	b9403fe1 	ldr	w1, [sp, #60]
    7fe4:	d2808002 	mov	x2, #0x400                 	// #1024
    7fe8:	52810000 	mov	w0, #0x800                 	// #2048
    7fec:	12140c21 	and	w1, w1, #0xf000
    7ff0:	7140083f 	cmp	w1, #0x2, lsl #12
    7ff4:	1a9f17e1 	cset	w1, eq  // eq = none
    7ff8:	b90002a1 	str	w1, [x21]
    7ffc:	f9000282 	str	x2, [x20]
    8000:	a94153f3 	ldp	x19, x20, [sp, #16]
    8004:	f94013f5 	ldr	x21, [sp, #32]
    8008:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    800c:	d65f03c0 	ret
    8010:	79c02260 	ldrsh	w0, [x19, #16]
    8014:	b90002bf 	str	wzr, [x21]
    8018:	36380100 	tbz	w0, #7, 8038 <__swhatbuf_r+0x88>
    801c:	d2800801 	mov	x1, #0x40                  	// #64
    8020:	f9000281 	str	x1, [x20]
    8024:	52800000 	mov	w0, #0x0                   	// #0
    8028:	a94153f3 	ldp	x19, x20, [sp, #16]
    802c:	f94013f5 	ldr	x21, [sp, #32]
    8030:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8034:	d65f03c0 	ret
    8038:	d2808001 	mov	x1, #0x400                 	// #1024
    803c:	f9000281 	str	x1, [x20]
    8040:	52800000 	mov	w0, #0x0                   	// #0
    8044:	a94153f3 	ldp	x19, x20, [sp, #16]
    8048:	f94013f5 	ldr	x21, [sp, #32]
    804c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8050:	d65f03c0 	ret
    8054:	d503201f 	nop
    8058:	d503201f 	nop
    805c:	d503201f 	nop

0000000000008060 <_malloc_r>:
    8060:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8064:	910003fd 	mov	x29, sp
    8068:	a90153f3 	stp	x19, x20, [sp, #16]
    806c:	91005c33 	add	x19, x1, #0x17
    8070:	a9025bf5 	stp	x21, x22, [sp, #32]
    8074:	aa0003f5 	mov	x21, x0
    8078:	a90363f7 	stp	x23, x24, [sp, #48]
    807c:	f100ba7f 	cmp	x19, #0x2e
    8080:	54000c88 	b.hi	8210 <_malloc_r+0x1b0>  // b.pmore
    8084:	f100803f 	cmp	x1, #0x20
    8088:	54002068 	b.hi	8494 <_malloc_r+0x434>  // b.pmore
    808c:	940003fd 	bl	9080 <__malloc_lock>
    8090:	d2800413 	mov	x19, #0x20                  	// #32
    8094:	d2800a00 	mov	x0, #0x50                  	// #80
    8098:	52800085 	mov	w5, #0x4                   	// #4
    809c:	b0000034 	adrp	x20, d000 <impure_data+0x680>
    80a0:	910a4294 	add	x20, x20, #0x290
    80a4:	8b000280 	add	x0, x20, x0
    80a8:	110008a5 	add	w5, w5, #0x2
    80ac:	d1004000 	sub	x0, x0, #0x10
    80b0:	f9400c01 	ldr	x1, [x0, #24]
    80b4:	eb00003f 	cmp	x1, x0
    80b8:	54002181 	b.ne	84e8 <_malloc_r+0x488>  // b.any
    80bc:	f9401284 	ldr	x4, [x20, #32]
    80c0:	91004282 	add	x2, x20, #0x10
    80c4:	eb02009f 	cmp	x4, x2
    80c8:	54000f20 	b.eq	82ac <_malloc_r+0x24c>  // b.none
    80cc:	f9400481 	ldr	x1, [x4, #8]
    80d0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    80d4:	cb130023 	sub	x3, x1, x19
    80d8:	f1007c7f 	cmp	x3, #0x1f
    80dc:	54002d4c 	b.gt	8684 <_malloc_r+0x624>
    80e0:	a9020a82 	stp	x2, x2, [x20, #32]
    80e4:	b6f81f23 	tbz	x3, #63, 84c8 <_malloc_r+0x468>
    80e8:	f107fc3f 	cmp	x1, #0x1ff
    80ec:	54002428 	b.hi	8570 <_malloc_r+0x510>  // b.pmore
    80f0:	d343fc22 	lsr	x2, x1, #3
    80f4:	d2800021 	mov	x1, #0x1                   	// #1
    80f8:	11000440 	add	w0, w2, #0x1
    80fc:	13027c42 	asr	w2, w2, #2
    8100:	531f7800 	lsl	w0, w0, #1
    8104:	f9400683 	ldr	x3, [x20, #8]
    8108:	8b20ce80 	add	x0, x20, w0, sxtw #3
    810c:	9ac22021 	lsl	x1, x1, x2
    8110:	aa030021 	orr	x1, x1, x3
    8114:	f85f0402 	ldr	x2, [x0], #-16
    8118:	f9000681 	str	x1, [x20, #8]
    811c:	a9010082 	stp	x2, x0, [x4, #16]
    8120:	f9000804 	str	x4, [x0, #16]
    8124:	f9000c44 	str	x4, [x2, #24]
    8128:	13027ca2 	asr	w2, w5, #2
    812c:	d2800020 	mov	x0, #0x1                   	// #1
    8130:	9ac22000 	lsl	x0, x0, x2
    8134:	eb01001f 	cmp	x0, x1
    8138:	54000c68 	b.hi	82c4 <_malloc_r+0x264>  // b.pmore
    813c:	ea01001f 	tst	x0, x1
    8140:	540000c1 	b.ne	8158 <_malloc_r+0xf8>  // b.any
    8144:	121e74a5 	and	w5, w5, #0xfffffffc
    8148:	d37ff800 	lsl	x0, x0, #1
    814c:	110010a5 	add	w5, w5, #0x4
    8150:	ea01001f 	tst	x0, x1
    8154:	54ffffa0 	b.eq	8148 <_malloc_r+0xe8>  // b.none
    8158:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    815c:	110004a7 	add	w7, w5, #0x1
    8160:	2a0503e8 	mov	w8, w5
    8164:	531f78e7 	lsl	w7, w7, #1
    8168:	8b27cd27 	add	x7, x9, w7, sxtw #3
    816c:	8b070287 	add	x7, x20, x7
    8170:	aa0703e4 	mov	x4, x7
    8174:	f9400c81 	ldr	x1, [x4, #24]
    8178:	14000009 	b	819c <_malloc_r+0x13c>
    817c:	f9400422 	ldr	x2, [x1, #8]
    8180:	aa0103e6 	mov	x6, x1
    8184:	f9400c21 	ldr	x1, [x1, #24]
    8188:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    818c:	cb130043 	sub	x3, x2, x19
    8190:	f1007c7f 	cmp	x3, #0x1f
    8194:	5400238c 	b.gt	8604 <_malloc_r+0x5a4>
    8198:	b6f82563 	tbz	x3, #63, 8644 <_malloc_r+0x5e4>
    819c:	eb01009f 	cmp	x4, x1
    81a0:	54fffee1 	b.ne	817c <_malloc_r+0x11c>  // b.any
    81a4:	7100f91f 	cmp	w8, #0x3e
    81a8:	540029cd 	b.le	86e0 <_malloc_r+0x680>
    81ac:	91004084 	add	x4, x4, #0x10
    81b0:	11000508 	add	w8, w8, #0x1
    81b4:	f240051f 	tst	x8, #0x3
    81b8:	54fffde1 	b.ne	8174 <_malloc_r+0x114>  // b.any
    81bc:	14000005 	b	81d0 <_malloc_r+0x170>
    81c0:	f85f04e1 	ldr	x1, [x7], #-16
    81c4:	510004a5 	sub	w5, w5, #0x1
    81c8:	eb07003f 	cmp	x1, x7
    81cc:	540035a1 	b.ne	8880 <_malloc_r+0x820>  // b.any
    81d0:	f24004bf 	tst	x5, #0x3
    81d4:	54ffff61 	b.ne	81c0 <_malloc_r+0x160>  // b.any
    81d8:	f9400681 	ldr	x1, [x20, #8]
    81dc:	8a200021 	bic	x1, x1, x0
    81e0:	f9000681 	str	x1, [x20, #8]
    81e4:	d37ff800 	lsl	x0, x0, #1
    81e8:	f100001f 	cmp	x0, #0x0
    81ec:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    81f0:	54000089 	b.ls	8200 <_malloc_r+0x1a0>  // b.plast
    81f4:	14000034 	b	82c4 <_malloc_r+0x264>
    81f8:	d37ff800 	lsl	x0, x0, #1
    81fc:	11001108 	add	w8, w8, #0x4
    8200:	ea01001f 	tst	x0, x1
    8204:	54ffffa0 	b.eq	81f8 <_malloc_r+0x198>  // b.none
    8208:	2a0803e5 	mov	w5, w8
    820c:	17ffffd4 	b	815c <_malloc_r+0xfc>
    8210:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    8214:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    8218:	eb02027f 	cmp	x19, x2
    821c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    8220:	540013a8 	b.hi	8494 <_malloc_r+0x434>  // b.pmore
    8224:	94000397 	bl	9080 <__malloc_lock>
    8228:	f107de7f 	cmp	x19, #0x1f7
    822c:	54002229 	b.ls	8670 <_malloc_r+0x610>  // b.plast
    8230:	d349fe60 	lsr	x0, x19, #9
    8234:	b4001420 	cbz	x0, 84b8 <_malloc_r+0x458>
    8238:	f100101f 	cmp	x0, #0x4
    823c:	54001d08 	b.hi	85dc <_malloc_r+0x57c>  // b.pmore
    8240:	d346fe60 	lsr	x0, x19, #6
    8244:	1100e405 	add	w5, w0, #0x39
    8248:	1100e000 	add	w0, w0, #0x38
    824c:	531f78a4 	lsl	w4, w5, #1
    8250:	937d7c84 	sbfiz	x4, x4, #3, #32
    8254:	b0000034 	adrp	x20, d000 <impure_data+0x680>
    8258:	910a4294 	add	x20, x20, #0x290
    825c:	8b040284 	add	x4, x20, x4
    8260:	d1004084 	sub	x4, x4, #0x10
    8264:	f9400c81 	ldr	x1, [x4, #24]
    8268:	eb01009f 	cmp	x4, x1
    826c:	540000c1 	b.ne	8284 <_malloc_r+0x224>  // b.any
    8270:	17ffff93 	b	80bc <_malloc_r+0x5c>
    8274:	b6f815e3 	tbz	x3, #63, 8530 <_malloc_r+0x4d0>
    8278:	f9400c21 	ldr	x1, [x1, #24]
    827c:	eb01009f 	cmp	x4, x1
    8280:	54fff1e0 	b.eq	80bc <_malloc_r+0x5c>  // b.none
    8284:	f9400422 	ldr	x2, [x1, #8]
    8288:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    828c:	cb130043 	sub	x3, x2, x19
    8290:	f1007c7f 	cmp	x3, #0x1f
    8294:	54ffff0d 	b.le	8274 <_malloc_r+0x214>
    8298:	f9401284 	ldr	x4, [x20, #32]
    829c:	91004282 	add	x2, x20, #0x10
    82a0:	2a0003e5 	mov	w5, w0
    82a4:	eb02009f 	cmp	x4, x2
    82a8:	54fff121 	b.ne	80cc <_malloc_r+0x6c>  // b.any
    82ac:	f9400681 	ldr	x1, [x20, #8]
    82b0:	13027ca2 	asr	w2, w5, #2
    82b4:	d2800020 	mov	x0, #0x1                   	// #1
    82b8:	9ac22000 	lsl	x0, x0, x2
    82bc:	eb01001f 	cmp	x0, x1
    82c0:	54fff3e9 	b.ls	813c <_malloc_r+0xdc>  // b.plast
    82c4:	f9400a97 	ldr	x23, [x20, #16]
    82c8:	f94006f6 	ldr	x22, [x23, #8]
    82cc:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    82d0:	eb18027f 	cmp	x19, x24
    82d4:	cb130300 	sub	x0, x24, x19
    82d8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    82dc:	54000bec 	b.gt	8458 <_malloc_r+0x3f8>
    82e0:	b0000021 	adrp	x1, d000 <impure_data+0x680>
    82e4:	a90573fb 	stp	x27, x28, [sp, #80]
    82e8:	b000003b 	adrp	x27, d000 <impure_data+0x680>
    82ec:	f9475c21 	ldr	x1, [x1, #3768]
    82f0:	d28203e3 	mov	x3, #0x101f                	// #4127
    82f4:	f9455362 	ldr	x2, [x27, #2720]
    82f8:	8b010261 	add	x1, x19, x1
    82fc:	8b030036 	add	x22, x1, x3
    8300:	91008021 	add	x1, x1, #0x20
    8304:	b100045f 	cmn	x2, #0x1
    8308:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    830c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    8310:	aa1503e0 	mov	x0, x21
    8314:	aa1603e1 	mov	x1, x22
    8318:	a9046bf9 	stp	x25, x26, [sp, #64]
    831c:	940004b1 	bl	95e0 <_sbrk_r>
    8320:	8b1802fa 	add	x26, x23, x24
    8324:	aa0003f9 	mov	x25, x0
    8328:	b100041f 	cmn	x0, #0x1
    832c:	54001f20 	b.eq	8710 <_malloc_r+0x6b0>  // b.none
    8330:	eb00035f 	cmp	x26, x0
    8334:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    8338:	54001ec1 	b.ne	8710 <_malloc_r+0x6b0>  // b.any
    833c:	b000003c 	adrp	x28, d000 <impure_data+0x680>
    8340:	b94e8381 	ldr	w1, [x28, #3712]
    8344:	0b160021 	add	w1, w1, w22
    8348:	b90e8381 	str	w1, [x28, #3712]
    834c:	eb00035f 	cmp	x26, x0
    8350:	54001ce0 	b.eq	86ec <_malloc_r+0x68c>  // b.none
    8354:	f9455360 	ldr	x0, [x27, #2720]
    8358:	b100041f 	cmn	x0, #0x1
    835c:	54001d60 	b.eq	8708 <_malloc_r+0x6a8>  // b.none
    8360:	cb1a033a 	sub	x26, x25, x26
    8364:	0b1a0021 	add	w1, w1, w26
    8368:	b90e8381 	str	w1, [x28, #3712]
    836c:	f2400f3a 	ands	x26, x25, #0xf
    8370:	54001e40 	b.eq	8738 <_malloc_r+0x6d8>  // b.none
    8374:	cb1a0339 	sub	x25, x25, x26
    8378:	d2820201 	mov	x1, #0x1010                	// #4112
    837c:	91004339 	add	x25, x25, #0x10
    8380:	cb1a0021 	sub	x1, x1, x26
    8384:	8b16033b 	add	x27, x25, x22
    8388:	aa1503e0 	mov	x0, x21
    838c:	cb1b0036 	sub	x22, x1, x27
    8390:	92402ed6 	and	x22, x22, #0xfff
    8394:	aa1603e1 	mov	x1, x22
    8398:	94000492 	bl	95e0 <_sbrk_r>
    839c:	b100041f 	cmn	x0, #0x1
    83a0:	54002480 	b.eq	8830 <_malloc_r+0x7d0>  // b.none
    83a4:	cb190000 	sub	x0, x0, x25
    83a8:	2a1603e2 	mov	w2, w22
    83ac:	8b160016 	add	x22, x0, x22
    83b0:	b94e8381 	ldr	w1, [x28, #3712]
    83b4:	b24002d6 	orr	x22, x22, #0x1
    83b8:	f9000a99 	str	x25, [x20, #16]
    83bc:	0b010041 	add	w1, w2, w1
    83c0:	b90e8381 	str	w1, [x28, #3712]
    83c4:	f9000736 	str	x22, [x25, #8]
    83c8:	eb1402ff 	cmp	x23, x20
    83cc:	54002000 	b.eq	87cc <_malloc_r+0x76c>  // b.none
    83d0:	f1007f1f 	cmp	x24, #0x1f
    83d4:	54001cc9 	b.ls	876c <_malloc_r+0x70c>  // b.plast
    83d8:	d1006300 	sub	x0, x24, #0x18
    83dc:	d2800124 	mov	x4, #0x9                   	// #9
    83e0:	f94006e2 	ldr	x2, [x23, #8]
    83e4:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    83e8:	8b0002e3 	add	x3, x23, x0
    83ec:	92400042 	and	x2, x2, #0x1
    83f0:	aa000042 	orr	x2, x2, x0
    83f4:	f90006e2 	str	x2, [x23, #8]
    83f8:	f8008c64 	str	x4, [x3, #8]!
    83fc:	f9000464 	str	x4, [x3, #8]
    8400:	f1007c1f 	cmp	x0, #0x1f
    8404:	54002088 	b.hi	8814 <_malloc_r+0x7b4>  // b.pmore
    8408:	f9400736 	ldr	x22, [x25, #8]
    840c:	aa1903f7 	mov	x23, x25
    8410:	b0000020 	adrp	x0, d000 <impure_data+0x680>
    8414:	93407c21 	sxtw	x1, w1
    8418:	f9475402 	ldr	x2, [x0, #3752]
    841c:	eb02003f 	cmp	x1, x2
    8420:	54000049 	b.ls	8428 <_malloc_r+0x3c8>  // b.plast
    8424:	f9075401 	str	x1, [x0, #3752]
    8428:	b0000020 	adrp	x0, d000 <impure_data+0x680>
    842c:	f9475802 	ldr	x2, [x0, #3760]
    8430:	eb02003f 	cmp	x1, x2
    8434:	54000049 	b.ls	843c <_malloc_r+0x3dc>  // b.plast
    8438:	f9075801 	str	x1, [x0, #3760]
    843c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    8440:	eb00027f 	cmp	x19, x0
    8444:	cb130000 	sub	x0, x0, x19
    8448:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    844c:	5400194d 	b.le	8774 <_malloc_r+0x714>
    8450:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8454:	a94573fb 	ldp	x27, x28, [sp, #80]
    8458:	8b1302e2 	add	x2, x23, x19
    845c:	b2400273 	orr	x19, x19, #0x1
    8460:	f90006f3 	str	x19, [x23, #8]
    8464:	b2400001 	orr	x1, x0, #0x1
    8468:	f9000a82 	str	x2, [x20, #16]
    846c:	f9000441 	str	x1, [x2, #8]
    8470:	aa1503e0 	mov	x0, x21
    8474:	910042f7 	add	x23, x23, #0x10
    8478:	94000306 	bl	9090 <__malloc_unlock>
    847c:	aa1703e0 	mov	x0, x23
    8480:	a94153f3 	ldp	x19, x20, [sp, #16]
    8484:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8488:	a94363f7 	ldp	x23, x24, [sp, #48]
    848c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8490:	d65f03c0 	ret
    8494:	52800180 	mov	w0, #0xc                   	// #12
    8498:	d2800017 	mov	x23, #0x0                   	// #0
    849c:	b90002a0 	str	w0, [x21]
    84a0:	aa1703e0 	mov	x0, x23
    84a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    84a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    84ac:	a94363f7 	ldp	x23, x24, [sp, #48]
    84b0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    84b4:	d65f03c0 	ret
    84b8:	d2808004 	mov	x4, #0x400                 	// #1024
    84bc:	52800805 	mov	w5, #0x40                  	// #64
    84c0:	528007e0 	mov	w0, #0x3f                  	// #63
    84c4:	17ffff64 	b	8254 <_malloc_r+0x1f4>
    84c8:	8b010081 	add	x1, x4, x1
    84cc:	aa1503e0 	mov	x0, x21
    84d0:	91004097 	add	x23, x4, #0x10
    84d4:	f9400422 	ldr	x2, [x1, #8]
    84d8:	b2400042 	orr	x2, x2, #0x1
    84dc:	f9000422 	str	x2, [x1, #8]
    84e0:	940002ec 	bl	9090 <__malloc_unlock>
    84e4:	17ffffef 	b	84a0 <_malloc_r+0x440>
    84e8:	a9409022 	ldp	x2, x4, [x1, #8]
    84ec:	91004037 	add	x23, x1, #0x10
    84f0:	f9400c23 	ldr	x3, [x1, #24]
    84f4:	aa1503e0 	mov	x0, x21
    84f8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    84fc:	8b020022 	add	x2, x1, x2
    8500:	f9400441 	ldr	x1, [x2, #8]
    8504:	f9000c83 	str	x3, [x4, #24]
    8508:	f9000864 	str	x4, [x3, #16]
    850c:	b2400021 	orr	x1, x1, #0x1
    8510:	f9000441 	str	x1, [x2, #8]
    8514:	940002df 	bl	9090 <__malloc_unlock>
    8518:	aa1703e0 	mov	x0, x23
    851c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8520:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8524:	a94363f7 	ldp	x23, x24, [sp, #48]
    8528:	a8c67bfd 	ldp	x29, x30, [sp], #96
    852c:	d65f03c0 	ret
    8530:	8b020022 	add	x2, x1, x2
    8534:	91004037 	add	x23, x1, #0x10
    8538:	a9410c24 	ldp	x4, x3, [x1, #16]
    853c:	aa1503e0 	mov	x0, x21
    8540:	f9400441 	ldr	x1, [x2, #8]
    8544:	f9000c83 	str	x3, [x4, #24]
    8548:	b2400021 	orr	x1, x1, #0x1
    854c:	f9000864 	str	x4, [x3, #16]
    8550:	f9000441 	str	x1, [x2, #8]
    8554:	940002cf 	bl	9090 <__malloc_unlock>
    8558:	aa1703e0 	mov	x0, x23
    855c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8560:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8564:	a94363f7 	ldp	x23, x24, [sp, #48]
    8568:	a8c67bfd 	ldp	x29, x30, [sp], #96
    856c:	d65f03c0 	ret
    8570:	d349fc20 	lsr	x0, x1, #9
    8574:	f127fc3f 	cmp	x1, #0x9ff
    8578:	540009e9 	b.ls	86b4 <_malloc_r+0x654>  // b.plast
    857c:	f100501f 	cmp	x0, #0x14
    8580:	54001068 	b.hi	878c <_malloc_r+0x72c>  // b.pmore
    8584:	11017003 	add	w3, w0, #0x5c
    8588:	11016c02 	add	w2, w0, #0x5b
    858c:	531f7863 	lsl	w3, w3, #1
    8590:	937d7c63 	sbfiz	x3, x3, #3, #32
    8594:	8b030283 	add	x3, x20, x3
    8598:	f85f0460 	ldr	x0, [x3], #-16
    859c:	eb00007f 	cmp	x3, x0
    85a0:	54000be0 	b.eq	871c <_malloc_r+0x6bc>  // b.none
    85a4:	d503201f 	nop
    85a8:	f9400402 	ldr	x2, [x0, #8]
    85ac:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    85b0:	eb01005f 	cmp	x2, x1
    85b4:	54000089 	b.ls	85c4 <_malloc_r+0x564>  // b.plast
    85b8:	f9400800 	ldr	x0, [x0, #16]
    85bc:	eb00007f 	cmp	x3, x0
    85c0:	54ffff41 	b.ne	85a8 <_malloc_r+0x548>  // b.any
    85c4:	f9400681 	ldr	x1, [x20, #8]
    85c8:	f9400c03 	ldr	x3, [x0, #24]
    85cc:	a9010c80 	stp	x0, x3, [x4, #16]
    85d0:	f9000864 	str	x4, [x3, #16]
    85d4:	f9000c04 	str	x4, [x0, #24]
    85d8:	17fffed4 	b	8128 <_malloc_r+0xc8>
    85dc:	f100501f 	cmp	x0, #0x14
    85e0:	54000769 	b.ls	86cc <_malloc_r+0x66c>  // b.plast
    85e4:	f101501f 	cmp	x0, #0x54
    85e8:	54000e28 	b.hi	87ac <_malloc_r+0x74c>  // b.pmore
    85ec:	d34cfe60 	lsr	x0, x19, #12
    85f0:	1101bc05 	add	w5, w0, #0x6f
    85f4:	1101b800 	add	w0, w0, #0x6e
    85f8:	531f78a4 	lsl	w4, w5, #1
    85fc:	937d7c84 	sbfiz	x4, x4, #3, #32
    8600:	17ffff15 	b	8254 <_malloc_r+0x1f4>
    8604:	f94008c7 	ldr	x7, [x6, #16]
    8608:	b2400260 	orr	x0, x19, #0x1
    860c:	f90004c0 	str	x0, [x6, #8]
    8610:	8b1300c4 	add	x4, x6, x19
    8614:	91004285 	add	x5, x20, #0x10
    8618:	b2400068 	orr	x8, x3, #0x1
    861c:	f9000ce1 	str	x1, [x7, #24]
    8620:	910040d7 	add	x23, x6, #0x10
    8624:	f9000827 	str	x7, [x1, #16]
    8628:	aa1503e0 	mov	x0, x21
    862c:	a9021284 	stp	x4, x4, [x20, #32]
    8630:	a9009488 	stp	x8, x5, [x4, #8]
    8634:	f9000c85 	str	x5, [x4, #24]
    8638:	f82268c3 	str	x3, [x6, x2]
    863c:	94000295 	bl	9090 <__malloc_unlock>
    8640:	17ffff98 	b	84a0 <_malloc_r+0x440>
    8644:	8b0200c2 	add	x2, x6, x2
    8648:	aa0603f7 	mov	x23, x6
    864c:	aa1503e0 	mov	x0, x21
    8650:	f9400443 	ldr	x3, [x2, #8]
    8654:	f8410ee4 	ldr	x4, [x23, #16]!
    8658:	b2400063 	orr	x3, x3, #0x1
    865c:	f9000443 	str	x3, [x2, #8]
    8660:	f9000c81 	str	x1, [x4, #24]
    8664:	f9000824 	str	x4, [x1, #16]
    8668:	9400028a 	bl	9090 <__malloc_unlock>
    866c:	17ffff8d 	b	84a0 <_malloc_r+0x440>
    8670:	d343fe65 	lsr	x5, x19, #3
    8674:	110004a0 	add	w0, w5, #0x1
    8678:	531f7800 	lsl	w0, w0, #1
    867c:	937d7c00 	sbfiz	x0, x0, #3, #32
    8680:	17fffe87 	b	809c <_malloc_r+0x3c>
    8684:	8b130085 	add	x5, x4, x19
    8688:	b2400273 	orr	x19, x19, #0x1
    868c:	f9000493 	str	x19, [x4, #8]
    8690:	b2400066 	orr	x6, x3, #0x1
    8694:	a9021685 	stp	x5, x5, [x20, #32]
    8698:	aa1503e0 	mov	x0, x21
    869c:	91004097 	add	x23, x4, #0x10
    86a0:	a90088a6 	stp	x6, x2, [x5, #8]
    86a4:	f9000ca2 	str	x2, [x5, #24]
    86a8:	f8216883 	str	x3, [x4, x1]
    86ac:	94000279 	bl	9090 <__malloc_unlock>
    86b0:	17ffff7c 	b	84a0 <_malloc_r+0x440>
    86b4:	d346fc20 	lsr	x0, x1, #6
    86b8:	1100e403 	add	w3, w0, #0x39
    86bc:	1100e002 	add	w2, w0, #0x38
    86c0:	531f7863 	lsl	w3, w3, #1
    86c4:	937d7c63 	sbfiz	x3, x3, #3, #32
    86c8:	17ffffb3 	b	8594 <_malloc_r+0x534>
    86cc:	11017005 	add	w5, w0, #0x5c
    86d0:	11016c00 	add	w0, w0, #0x5b
    86d4:	531f78a4 	lsl	w4, w5, #1
    86d8:	937d7c84 	sbfiz	x4, x4, #3, #32
    86dc:	17fffede 	b	8254 <_malloc_r+0x1f4>
    86e0:	11000508 	add	w8, w8, #0x1
    86e4:	91008084 	add	x4, x4, #0x20
    86e8:	17fffeb2 	b	81b0 <_malloc_r+0x150>
    86ec:	f2402f5f 	tst	x26, #0xfff
    86f0:	54ffe321 	b.ne	8354 <_malloc_r+0x2f4>  // b.any
    86f4:	f9400a97 	ldr	x23, [x20, #16]
    86f8:	8b160316 	add	x22, x24, x22
    86fc:	b24002d6 	orr	x22, x22, #0x1
    8700:	f90006f6 	str	x22, [x23, #8]
    8704:	17ffff43 	b	8410 <_malloc_r+0x3b0>
    8708:	f9055379 	str	x25, [x27, #2720]
    870c:	17ffff18 	b	836c <_malloc_r+0x30c>
    8710:	f9400a97 	ldr	x23, [x20, #16]
    8714:	f94006f6 	ldr	x22, [x23, #8]
    8718:	17ffff49 	b	843c <_malloc_r+0x3dc>
    871c:	f9400686 	ldr	x6, [x20, #8]
    8720:	13027c42 	asr	w2, w2, #2
    8724:	d2800021 	mov	x1, #0x1                   	// #1
    8728:	9ac22021 	lsl	x1, x1, x2
    872c:	aa060021 	orr	x1, x1, x6
    8730:	f9000681 	str	x1, [x20, #8]
    8734:	17ffffa6 	b	85cc <_malloc_r+0x56c>
    8738:	8b16033a 	add	x26, x25, x22
    873c:	aa1503e0 	mov	x0, x21
    8740:	cb1a03fa 	neg	x26, x26
    8744:	92402f5a 	and	x26, x26, #0xfff
    8748:	aa1a03e1 	mov	x1, x26
    874c:	940003a5 	bl	95e0 <_sbrk_r>
    8750:	52800002 	mov	w2, #0x0                   	// #0
    8754:	b100041f 	cmn	x0, #0x1
    8758:	54ffe2c0 	b.eq	83b0 <_malloc_r+0x350>  // b.none
    875c:	cb190000 	sub	x0, x0, x25
    8760:	2a1a03e2 	mov	w2, w26
    8764:	8b1a0016 	add	x22, x0, x26
    8768:	17ffff12 	b	83b0 <_malloc_r+0x350>
    876c:	d2800020 	mov	x0, #0x1                   	// #1
    8770:	f9000720 	str	x0, [x25, #8]
    8774:	aa1503e0 	mov	x0, x21
    8778:	d2800017 	mov	x23, #0x0                   	// #0
    877c:	94000245 	bl	9090 <__malloc_unlock>
    8780:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8784:	a94573fb 	ldp	x27, x28, [sp, #80]
    8788:	17ffff46 	b	84a0 <_malloc_r+0x440>
    878c:	f101501f 	cmp	x0, #0x54
    8790:	54000228 	b.hi	87d4 <_malloc_r+0x774>  // b.pmore
    8794:	d34cfc20 	lsr	x0, x1, #12
    8798:	1101bc03 	add	w3, w0, #0x6f
    879c:	1101b802 	add	w2, w0, #0x6e
    87a0:	531f7863 	lsl	w3, w3, #1
    87a4:	937d7c63 	sbfiz	x3, x3, #3, #32
    87a8:	17ffff7b 	b	8594 <_malloc_r+0x534>
    87ac:	f105501f 	cmp	x0, #0x154
    87b0:	54000228 	b.hi	87f4 <_malloc_r+0x794>  // b.pmore
    87b4:	d34ffe60 	lsr	x0, x19, #15
    87b8:	1101e005 	add	w5, w0, #0x78
    87bc:	1101dc00 	add	w0, w0, #0x77
    87c0:	531f78a4 	lsl	w4, w5, #1
    87c4:	937d7c84 	sbfiz	x4, x4, #3, #32
    87c8:	17fffea3 	b	8254 <_malloc_r+0x1f4>
    87cc:	aa1903f7 	mov	x23, x25
    87d0:	17ffff10 	b	8410 <_malloc_r+0x3b0>
    87d4:	f105501f 	cmp	x0, #0x154
    87d8:	54000368 	b.hi	8844 <_malloc_r+0x7e4>  // b.pmore
    87dc:	d34ffc20 	lsr	x0, x1, #15
    87e0:	1101e003 	add	w3, w0, #0x78
    87e4:	1101dc02 	add	w2, w0, #0x77
    87e8:	531f7863 	lsl	w3, w3, #1
    87ec:	937d7c63 	sbfiz	x3, x3, #3, #32
    87f0:	17ffff69 	b	8594 <_malloc_r+0x534>
    87f4:	f115501f 	cmp	x0, #0x554
    87f8:	54000368 	b.hi	8864 <_malloc_r+0x804>  // b.pmore
    87fc:	d352fe60 	lsr	x0, x19, #18
    8800:	1101f405 	add	w5, w0, #0x7d
    8804:	1101f000 	add	w0, w0, #0x7c
    8808:	531f78a4 	lsl	w4, w5, #1
    880c:	937d7c84 	sbfiz	x4, x4, #3, #32
    8810:	17fffe91 	b	8254 <_malloc_r+0x1f4>
    8814:	910042e1 	add	x1, x23, #0x10
    8818:	aa1503e0 	mov	x0, x21
    881c:	97fff7f1 	bl	67e0 <_free_r>
    8820:	f9400a97 	ldr	x23, [x20, #16]
    8824:	b94e8381 	ldr	w1, [x28, #3712]
    8828:	f94006f6 	ldr	x22, [x23, #8]
    882c:	17fffef9 	b	8410 <_malloc_r+0x3b0>
    8830:	d100435a 	sub	x26, x26, #0x10
    8834:	52800002 	mov	w2, #0x0                   	// #0
    8838:	8b1a0376 	add	x22, x27, x26
    883c:	cb1902d6 	sub	x22, x22, x25
    8840:	17fffedc 	b	83b0 <_malloc_r+0x350>
    8844:	f115501f 	cmp	x0, #0x554
    8848:	54000168 	b.hi	8874 <_malloc_r+0x814>  // b.pmore
    884c:	d352fc20 	lsr	x0, x1, #18
    8850:	1101f403 	add	w3, w0, #0x7d
    8854:	1101f002 	add	w2, w0, #0x7c
    8858:	531f7863 	lsl	w3, w3, #1
    885c:	937d7c63 	sbfiz	x3, x3, #3, #32
    8860:	17ffff4d 	b	8594 <_malloc_r+0x534>
    8864:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    8868:	52800fe5 	mov	w5, #0x7f                  	// #127
    886c:	52800fc0 	mov	w0, #0x7e                  	// #126
    8870:	17fffe79 	b	8254 <_malloc_r+0x1f4>
    8874:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    8878:	52800fc2 	mov	w2, #0x7e                  	// #126
    887c:	17ffff46 	b	8594 <_malloc_r+0x534>
    8880:	f9400681 	ldr	x1, [x20, #8]
    8884:	17fffe58 	b	81e4 <_malloc_r+0x184>
    8888:	d503201f 	nop
    888c:	d503201f 	nop

0000000000008890 <_mbtowc_r>:
    8890:	b0000025 	adrp	x5, d000 <impure_data+0x680>
    8894:	f940e8a5 	ldr	x5, [x5, #464]
    8898:	aa0503f0 	mov	x16, x5
    889c:	d61f0200 	br	x16

00000000000088a0 <__ascii_mbtowc>:
    88a0:	d10043ff 	sub	sp, sp, #0x10
    88a4:	f100003f 	cmp	x1, #0x0
    88a8:	910033e0 	add	x0, sp, #0xc
    88ac:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    88b0:	b4000122 	cbz	x2, 88d4 <__ascii_mbtowc+0x34>
    88b4:	b4000163 	cbz	x3, 88e0 <__ascii_mbtowc+0x40>
    88b8:	39400040 	ldrb	w0, [x2]
    88bc:	b9000020 	str	w0, [x1]
    88c0:	39400040 	ldrb	w0, [x2]
    88c4:	7100001f 	cmp	w0, #0x0
    88c8:	1a9f07e0 	cset	w0, ne  // ne = any
    88cc:	910043ff 	add	sp, sp, #0x10
    88d0:	d65f03c0 	ret
    88d4:	52800000 	mov	w0, #0x0                   	// #0
    88d8:	910043ff 	add	sp, sp, #0x10
    88dc:	d65f03c0 	ret
    88e0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    88e4:	17fffffa 	b	88cc <__ascii_mbtowc+0x2c>
    88e8:	d503201f 	nop
    88ec:	d503201f 	nop

00000000000088f0 <__utf8_mbtowc>:
    88f0:	d10043ff 	sub	sp, sp, #0x10
    88f4:	f100003f 	cmp	x1, #0x0
    88f8:	910033e5 	add	x5, sp, #0xc
    88fc:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8900:	b4000a02 	cbz	x2, 8a40 <__utf8_mbtowc+0x150>
    8904:	b40012a3 	cbz	x3, 8b58 <__utf8_mbtowc+0x268>
    8908:	b9400086 	ldr	w6, [x4]
    890c:	aa0003e8 	mov	x8, x0
    8910:	350003c6 	cbnz	w6, 8988 <__utf8_mbtowc+0x98>
    8914:	39400040 	ldrb	w0, [x2]
    8918:	52800025 	mov	w5, #0x1                   	// #1
    891c:	340003c0 	cbz	w0, 8994 <__utf8_mbtowc+0xa4>
    8920:	7101fc1f 	cmp	w0, #0x7f
    8924:	5400084d 	b.le	8a2c <__utf8_mbtowc+0x13c>
    8928:	51030007 	sub	w7, w0, #0xc0
    892c:	71007cff 	cmp	w7, #0x1f
    8930:	540003a8 	b.hi	89a4 <__utf8_mbtowc+0xb4>  // b.pmore
    8934:	39001080 	strb	w0, [x4, #4]
    8938:	350000a6 	cbnz	w6, 894c <__utf8_mbtowc+0x5c>
    893c:	52800026 	mov	w6, #0x1                   	// #1
    8940:	b9000086 	str	w6, [x4]
    8944:	f100047f 	cmp	x3, #0x1
    8948:	54001080 	b.eq	8b58 <__utf8_mbtowc+0x268>  // b.none
    894c:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    8950:	110004a5 	add	w5, w5, #0x1
    8954:	51020043 	sub	w3, w2, #0x80
    8958:	7100fc7f 	cmp	w3, #0x3f
    895c:	54001068 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8960:	7103041f 	cmp	w0, #0xc1
    8964:	5400102d 	b.le	8b68 <__utf8_mbtowc+0x278>
    8968:	531a1000 	ubfiz	w0, w0, #6, #5
    896c:	12001442 	and	w2, w2, #0x3f
    8970:	b900009f 	str	wzr, [x4]
    8974:	2a020002 	orr	w2, w0, w2
    8978:	b9000022 	str	w2, [x1]
    897c:	2a0503e0 	mov	w0, w5
    8980:	910043ff 	add	sp, sp, #0x10
    8984:	d65f03c0 	ret
    8988:	39401080 	ldrb	w0, [x4, #4]
    898c:	52800005 	mov	w5, #0x0                   	// #0
    8990:	35fffc80 	cbnz	w0, 8920 <__utf8_mbtowc+0x30>
    8994:	b900003f 	str	wzr, [x1]
    8998:	b900009f 	str	wzr, [x4]
    899c:	910043ff 	add	sp, sp, #0x10
    89a0:	d65f03c0 	ret
    89a4:	51038007 	sub	w7, w0, #0xe0
    89a8:	71003cff 	cmp	w7, #0xf
    89ac:	54000508 	b.hi	8a4c <__utf8_mbtowc+0x15c>  // b.pmore
    89b0:	39001080 	strb	w0, [x4, #4]
    89b4:	34000aa6 	cbz	w6, 8b08 <__utf8_mbtowc+0x218>
    89b8:	b100047f 	cmn	x3, #0x1
    89bc:	9a830463 	cinc	x3, x3, ne  // ne = any
    89c0:	710004df 	cmp	w6, #0x1
    89c4:	54000aa0 	b.eq	8b18 <__utf8_mbtowc+0x228>  // b.none
    89c8:	39401487 	ldrb	w7, [x4, #5]
    89cc:	7103801f 	cmp	w0, #0xe0
    89d0:	528013e9 	mov	w9, #0x9f                  	// #159
    89d4:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    89d8:	54000c8d 	b.le	8b68 <__utf8_mbtowc+0x278>
    89dc:	510200e9 	sub	w9, w7, #0x80
    89e0:	7100fd3f 	cmp	w9, #0x3f
    89e4:	54000c28 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    89e8:	39001487 	strb	w7, [x4, #5]
    89ec:	710004df 	cmp	w6, #0x1
    89f0:	54000ac0 	b.eq	8b48 <__utf8_mbtowc+0x258>  // b.none
    89f4:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    89f8:	110004a5 	add	w5, w5, #0x1
    89fc:	51020043 	sub	w3, w2, #0x80
    8a00:	7100fc7f 	cmp	w3, #0x3f
    8a04:	54000b28 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8a08:	53140c00 	ubfiz	w0, w0, #12, #4
    8a0c:	531a14e7 	ubfiz	w7, w7, #6, #6
    8a10:	2a070007 	orr	w7, w0, w7
    8a14:	12001442 	and	w2, w2, #0x3f
    8a18:	b900009f 	str	wzr, [x4]
    8a1c:	2a0200e7 	orr	w7, w7, w2
    8a20:	2a0503e0 	mov	w0, w5
    8a24:	b9000027 	str	w7, [x1]
    8a28:	17ffffdd 	b	899c <__utf8_mbtowc+0xac>
    8a2c:	b900009f 	str	wzr, [x4]
    8a30:	b9000020 	str	w0, [x1]
    8a34:	52800020 	mov	w0, #0x1                   	// #1
    8a38:	910043ff 	add	sp, sp, #0x10
    8a3c:	d65f03c0 	ret
    8a40:	52800000 	mov	w0, #0x0                   	// #0
    8a44:	910043ff 	add	sp, sp, #0x10
    8a48:	d65f03c0 	ret
    8a4c:	5103c007 	sub	w7, w0, #0xf0
    8a50:	710010ff 	cmp	w7, #0x4
    8a54:	540008a8 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8a58:	39001080 	strb	w0, [x4, #4]
    8a5c:	34000666 	cbz	w6, 8b28 <__utf8_mbtowc+0x238>
    8a60:	b100047f 	cmn	x3, #0x1
    8a64:	9a830463 	cinc	x3, x3, ne  // ne = any
    8a68:	710004df 	cmp	w6, #0x1
    8a6c:	54000660 	b.eq	8b38 <__utf8_mbtowc+0x248>  // b.none
    8a70:	39401487 	ldrb	w7, [x4, #5]
    8a74:	7103c01f 	cmp	w0, #0xf0
    8a78:	54000740 	b.eq	8b60 <__utf8_mbtowc+0x270>  // b.none
    8a7c:	71023cff 	cmp	w7, #0x8f
    8a80:	52801e89 	mov	w9, #0xf4                  	// #244
    8a84:	7a49c000 	ccmp	w0, w9, #0x0, gt
    8a88:	54000700 	b.eq	8b68 <__utf8_mbtowc+0x278>  // b.none
    8a8c:	510200e9 	sub	w9, w7, #0x80
    8a90:	7100fd3f 	cmp	w9, #0x3f
    8a94:	540006a8 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8a98:	39001487 	strb	w7, [x4, #5]
    8a9c:	710004df 	cmp	w6, #0x1
    8aa0:	540006c0 	b.eq	8b78 <__utf8_mbtowc+0x288>  // b.none
    8aa4:	b9400086 	ldr	w6, [x4]
    8aa8:	b100047f 	cmn	x3, #0x1
    8aac:	9a830463 	cinc	x3, x3, ne  // ne = any
    8ab0:	710008df 	cmp	w6, #0x2
    8ab4:	540006a0 	b.eq	8b88 <__utf8_mbtowc+0x298>  // b.none
    8ab8:	39401886 	ldrb	w6, [x4, #6]
    8abc:	510200c3 	sub	w3, w6, #0x80
    8ac0:	7100fc7f 	cmp	w3, #0x3f
    8ac4:	54000528 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8ac8:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    8acc:	110004a5 	add	w5, w5, #0x1
    8ad0:	51020043 	sub	w3, w2, #0x80
    8ad4:	7100fc7f 	cmp	w3, #0x3f
    8ad8:	54000488 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8adc:	530e0800 	ubfiz	w0, w0, #18, #3
    8ae0:	531414e7 	ubfiz	w7, w7, #12, #6
    8ae4:	531a14c6 	ubfiz	w6, w6, #6, #6
    8ae8:	12001442 	and	w2, w2, #0x3f
    8aec:	2a070007 	orr	w7, w0, w7
    8af0:	2a0200c6 	orr	w6, w6, w2
    8af4:	2a0600e6 	orr	w6, w7, w6
    8af8:	b9000026 	str	w6, [x1]
    8afc:	2a0503e0 	mov	w0, w5
    8b00:	b900009f 	str	wzr, [x4]
    8b04:	17ffffa6 	b	899c <__utf8_mbtowc+0xac>
    8b08:	52800026 	mov	w6, #0x1                   	// #1
    8b0c:	b9000086 	str	w6, [x4]
    8b10:	f100047f 	cmp	x3, #0x1
    8b14:	54000220 	b.eq	8b58 <__utf8_mbtowc+0x268>  // b.none
    8b18:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    8b1c:	52800026 	mov	w6, #0x1                   	// #1
    8b20:	0b0600a5 	add	w5, w5, w6
    8b24:	17ffffaa 	b	89cc <__utf8_mbtowc+0xdc>
    8b28:	52800026 	mov	w6, #0x1                   	// #1
    8b2c:	b9000086 	str	w6, [x4]
    8b30:	f100047f 	cmp	x3, #0x1
    8b34:	54000120 	b.eq	8b58 <__utf8_mbtowc+0x268>  // b.none
    8b38:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    8b3c:	52800026 	mov	w6, #0x1                   	// #1
    8b40:	0b0600a5 	add	w5, w5, w6
    8b44:	17ffffcc 	b	8a74 <__utf8_mbtowc+0x184>
    8b48:	52800046 	mov	w6, #0x2                   	// #2
    8b4c:	b9000086 	str	w6, [x4]
    8b50:	f100087f 	cmp	x3, #0x2
    8b54:	54fff501 	b.ne	89f4 <__utf8_mbtowc+0x104>  // b.any
    8b58:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8b5c:	17ffff90 	b	899c <__utf8_mbtowc+0xac>
    8b60:	71023cff 	cmp	w7, #0x8f
    8b64:	54fff94c 	b.gt	8a8c <__utf8_mbtowc+0x19c>
    8b68:	52801141 	mov	w1, #0x8a                  	// #138
    8b6c:	12800000 	mov	w0, #0xffffffff            	// #-1
    8b70:	b9000101 	str	w1, [x8]
    8b74:	17ffff8a 	b	899c <__utf8_mbtowc+0xac>
    8b78:	52800046 	mov	w6, #0x2                   	// #2
    8b7c:	b9000086 	str	w6, [x4]
    8b80:	f100087f 	cmp	x3, #0x2
    8b84:	54fffea0 	b.eq	8b58 <__utf8_mbtowc+0x268>  // b.none
    8b88:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    8b8c:	110004a5 	add	w5, w5, #0x1
    8b90:	510200c9 	sub	w9, w6, #0x80
    8b94:	7100fd3f 	cmp	w9, #0x3f
    8b98:	54fffe88 	b.hi	8b68 <__utf8_mbtowc+0x278>  // b.pmore
    8b9c:	52800069 	mov	w9, #0x3                   	// #3
    8ba0:	b9000089 	str	w9, [x4]
    8ba4:	39001886 	strb	w6, [x4, #6]
    8ba8:	f1000c7f 	cmp	x3, #0x3
    8bac:	54fff8e1 	b.ne	8ac8 <__utf8_mbtowc+0x1d8>  // b.any
    8bb0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8bb4:	17ffff7a 	b	899c <__utf8_mbtowc+0xac>
    8bb8:	d503201f 	nop
    8bbc:	d503201f 	nop

0000000000008bc0 <__sjis_mbtowc>:
    8bc0:	d10043ff 	sub	sp, sp, #0x10
    8bc4:	f100003f 	cmp	x1, #0x0
    8bc8:	910033e5 	add	x5, sp, #0xc
    8bcc:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8bd0:	b40004c2 	cbz	x2, 8c68 <__sjis_mbtowc+0xa8>
    8bd4:	b4000503 	cbz	x3, 8c74 <__sjis_mbtowc+0xb4>
    8bd8:	aa0003e6 	mov	x6, x0
    8bdc:	b9400080 	ldr	w0, [x4]
    8be0:	39400045 	ldrb	w5, [x2]
    8be4:	35000320 	cbnz	w0, 8c48 <__sjis_mbtowc+0x88>
    8be8:	510204a7 	sub	w7, w5, #0x81
    8bec:	510380a0 	sub	w0, w5, #0xe0
    8bf0:	710078ff 	cmp	w7, #0x1e
    8bf4:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    8bf8:	540002c8 	b.hi	8c50 <__sjis_mbtowc+0x90>  // b.pmore
    8bfc:	52800020 	mov	w0, #0x1                   	// #1
    8c00:	b9000080 	str	w0, [x4]
    8c04:	39001085 	strb	w5, [x4, #4]
    8c08:	f100047f 	cmp	x3, #0x1
    8c0c:	54000340 	b.eq	8c74 <__sjis_mbtowc+0xb4>  // b.none
    8c10:	39400445 	ldrb	w5, [x2, #1]
    8c14:	52800040 	mov	w0, #0x2                   	// #2
    8c18:	510100a3 	sub	w3, w5, #0x40
    8c1c:	510200a2 	sub	w2, w5, #0x80
    8c20:	7100f87f 	cmp	w3, #0x3e
    8c24:	52800f83 	mov	w3, #0x7c                  	// #124
    8c28:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    8c2c:	54000288 	b.hi	8c7c <__sjis_mbtowc+0xbc>  // b.pmore
    8c30:	39401082 	ldrb	w2, [x4, #4]
    8c34:	0b0220a5 	add	w5, w5, w2, lsl #8
    8c38:	b9000025 	str	w5, [x1]
    8c3c:	b900009f 	str	wzr, [x4]
    8c40:	910043ff 	add	sp, sp, #0x10
    8c44:	d65f03c0 	ret
    8c48:	7100041f 	cmp	w0, #0x1
    8c4c:	54fffe60 	b.eq	8c18 <__sjis_mbtowc+0x58>  // b.none
    8c50:	b9000025 	str	w5, [x1]
    8c54:	39400040 	ldrb	w0, [x2]
    8c58:	7100001f 	cmp	w0, #0x0
    8c5c:	1a9f07e0 	cset	w0, ne  // ne = any
    8c60:	910043ff 	add	sp, sp, #0x10
    8c64:	d65f03c0 	ret
    8c68:	52800000 	mov	w0, #0x0                   	// #0
    8c6c:	910043ff 	add	sp, sp, #0x10
    8c70:	d65f03c0 	ret
    8c74:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8c78:	17fffffa 	b	8c60 <__sjis_mbtowc+0xa0>
    8c7c:	52801141 	mov	w1, #0x8a                  	// #138
    8c80:	12800000 	mov	w0, #0xffffffff            	// #-1
    8c84:	b90000c1 	str	w1, [x6]
    8c88:	17fffff6 	b	8c60 <__sjis_mbtowc+0xa0>
    8c8c:	d503201f 	nop

0000000000008c90 <__eucjp_mbtowc>:
    8c90:	d10083ff 	sub	sp, sp, #0x20
    8c94:	f100003f 	cmp	x1, #0x0
    8c98:	a90007e0 	stp	x0, x1, [sp]
    8c9c:	910073e0 	add	x0, sp, #0x1c
    8ca0:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    8ca4:	f94003e6 	ldr	x6, [sp]
    8ca8:	b4000702 	cbz	x2, 8d88 <__eucjp_mbtowc+0xf8>
    8cac:	b4000783 	cbz	x3, 8d9c <__eucjp_mbtowc+0x10c>
    8cb0:	b9400080 	ldr	w0, [x4]
    8cb4:	39400045 	ldrb	w5, [x2]
    8cb8:	350004a0 	cbnz	w0, 8d4c <__eucjp_mbtowc+0xbc>
    8cbc:	510284a7 	sub	w7, w5, #0xa1
    8cc0:	510238a0 	sub	w0, w5, #0x8e
    8cc4:	710174ff 	cmp	w7, #0x5d
    8cc8:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    8ccc:	54000488 	b.hi	8d5c <__eucjp_mbtowc+0xcc>  // b.pmore
    8cd0:	52800020 	mov	w0, #0x1                   	// #1
    8cd4:	b9000080 	str	w0, [x4]
    8cd8:	39001085 	strb	w5, [x4, #4]
    8cdc:	f100047f 	cmp	x3, #0x1
    8ce0:	540005e0 	b.eq	8d9c <__eucjp_mbtowc+0x10c>  // b.none
    8ce4:	39400445 	ldrb	w5, [x2, #1]
    8ce8:	52800040 	mov	w0, #0x2                   	// #2
    8cec:	510284a7 	sub	w7, w5, #0xa1
    8cf0:	710174ff 	cmp	w7, #0x5d
    8cf4:	54000588 	b.hi	8da4 <__eucjp_mbtowc+0x114>  // b.pmore
    8cf8:	39401087 	ldrb	w7, [x4, #4]
    8cfc:	71023cff 	cmp	w7, #0x8f
    8d00:	540003a1 	b.ne	8d74 <__eucjp_mbtowc+0xe4>  // b.any
    8d04:	52800048 	mov	w8, #0x2                   	// #2
    8d08:	93407c07 	sxtw	x7, w0
    8d0c:	b9000088 	str	w8, [x4]
    8d10:	39001485 	strb	w5, [x4, #5]
    8d14:	eb0300ff 	cmp	x7, x3
    8d18:	54000422 	b.cs	8d9c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    8d1c:	38676845 	ldrb	w5, [x2, x7]
    8d20:	11000400 	add	w0, w0, #0x1
    8d24:	510284a2 	sub	w2, w5, #0xa1
    8d28:	7101745f 	cmp	w2, #0x5d
    8d2c:	540003c8 	b.hi	8da4 <__eucjp_mbtowc+0x114>  // b.pmore
    8d30:	39401482 	ldrb	w2, [x4, #5]
    8d34:	120018a5 	and	w5, w5, #0x7f
    8d38:	0b0220a5 	add	w5, w5, w2, lsl #8
    8d3c:	b9000025 	str	w5, [x1]
    8d40:	b900009f 	str	wzr, [x4]
    8d44:	910083ff 	add	sp, sp, #0x20
    8d48:	d65f03c0 	ret
    8d4c:	7100041f 	cmp	w0, #0x1
    8d50:	54fffce0 	b.eq	8cec <__eucjp_mbtowc+0x5c>  // b.none
    8d54:	7100081f 	cmp	w0, #0x2
    8d58:	540001e0 	b.eq	8d94 <__eucjp_mbtowc+0x104>  // b.none
    8d5c:	b9000025 	str	w5, [x1]
    8d60:	39400040 	ldrb	w0, [x2]
    8d64:	7100001f 	cmp	w0, #0x0
    8d68:	1a9f07e0 	cset	w0, ne  // ne = any
    8d6c:	910083ff 	add	sp, sp, #0x20
    8d70:	d65f03c0 	ret
    8d74:	0b0720a5 	add	w5, w5, w7, lsl #8
    8d78:	b9000025 	str	w5, [x1]
    8d7c:	b900009f 	str	wzr, [x4]
    8d80:	910083ff 	add	sp, sp, #0x20
    8d84:	d65f03c0 	ret
    8d88:	52800000 	mov	w0, #0x0                   	// #0
    8d8c:	910083ff 	add	sp, sp, #0x20
    8d90:	d65f03c0 	ret
    8d94:	52800020 	mov	w0, #0x1                   	// #1
    8d98:	17ffffe3 	b	8d24 <__eucjp_mbtowc+0x94>
    8d9c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8da0:	17fffff3 	b	8d6c <__eucjp_mbtowc+0xdc>
    8da4:	52801141 	mov	w1, #0x8a                  	// #138
    8da8:	12800000 	mov	w0, #0xffffffff            	// #-1
    8dac:	b90000c1 	str	w1, [x6]
    8db0:	17ffffef 	b	8d6c <__eucjp_mbtowc+0xdc>
    8db4:	d503201f 	nop
    8db8:	d503201f 	nop
    8dbc:	d503201f 	nop

0000000000008dc0 <__jis_mbtowc>:
    8dc0:	d10043ff 	sub	sp, sp, #0x10
    8dc4:	f100003f 	cmp	x1, #0x0
    8dc8:	910033e5 	add	x5, sp, #0xc
    8dcc:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8dd0:	b4000da2 	cbz	x2, 8f84 <__jis_mbtowc+0x1c4>
    8dd4:	b4000e43 	cbz	x3, 8f9c <__jis_mbtowc+0x1dc>
    8dd8:	39400085 	ldrb	w5, [x4]
    8ddc:	f000000c 	adrp	x12, b000 <_findenv_r+0x10>
    8de0:	f000000b 	adrp	x11, b000 <_findenv_r+0x10>
    8de4:	aa0003ed 	mov	x13, x0
    8de8:	913ea18c 	add	x12, x12, #0xfa8
    8dec:	913fc16b 	add	x11, x11, #0xff0
    8df0:	aa0203ef 	mov	x15, x2
    8df4:	5280000a 	mov	w10, #0x0                   	// #0
    8df8:	d2800009 	mov	x9, #0x0                   	// #0
    8dfc:	38696847 	ldrb	w7, [x2, x9]
    8e00:	8b09004e 	add	x14, x2, x9
    8e04:	7100a0ff 	cmp	w7, #0x28
    8e08:	54000c60 	b.eq	8f94 <__jis_mbtowc+0x1d4>  // b.none
    8e0c:	540005a8 	b.hi	8ec0 <__jis_mbtowc+0x100>  // b.pmore
    8e10:	52800006 	mov	w6, #0x0                   	// #0
    8e14:	71006cff 	cmp	w7, #0x1b
    8e18:	54000080 	b.eq	8e28 <__jis_mbtowc+0x68>  // b.none
    8e1c:	52800026 	mov	w6, #0x1                   	// #1
    8e20:	710090ff 	cmp	w7, #0x24
    8e24:	540008c1 	b.ne	8f3c <__jis_mbtowc+0x17c>  // b.any
    8e28:	937d7ca0 	sbfiz	x0, x5, #3, #32
    8e2c:	8b25c005 	add	x5, x0, w5, sxtw
    8e30:	8b050180 	add	x0, x12, x5
    8e34:	8b050165 	add	x5, x11, x5
    8e38:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    8e3c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    8e40:	71000d1f 	cmp	w8, #0x3
    8e44:	540006a0 	b.eq	8f18 <__jis_mbtowc+0x158>  // b.none
    8e48:	540002a8 	b.hi	8e9c <__jis_mbtowc+0xdc>  // b.pmore
    8e4c:	7100051f 	cmp	w8, #0x1
    8e50:	54000840 	b.eq	8f58 <__jis_mbtowc+0x198>  // b.none
    8e54:	7100091f 	cmp	w8, #0x2
    8e58:	54000141 	b.ne	8e80 <__jis_mbtowc+0xc0>  // b.any
    8e5c:	52800020 	mov	w0, #0x1                   	// #1
    8e60:	b9000080 	str	w0, [x4]
    8e64:	39401082 	ldrb	w2, [x4, #4]
    8e68:	0b000140 	add	w0, w10, w0
    8e6c:	394001c3 	ldrb	w3, [x14]
    8e70:	0b022062 	add	w2, w3, w2, lsl #8
    8e74:	b9000022 	str	w2, [x1]
    8e78:	910043ff 	add	sp, sp, #0x10
    8e7c:	d65f03c0 	ret
    8e80:	35000788 	cbnz	w8, 8f70 <__jis_mbtowc+0x1b0>
    8e84:	b900009f 	str	wzr, [x4]
    8e88:	11000540 	add	w0, w10, #0x1
    8e8c:	394001e2 	ldrb	w2, [x15]
    8e90:	b9000022 	str	w2, [x1]
    8e94:	910043ff 	add	sp, sp, #0x10
    8e98:	d65f03c0 	ret
    8e9c:	7100111f 	cmp	w8, #0x4
    8ea0:	54000400 	b.eq	8f20 <__jis_mbtowc+0x160>  // b.none
    8ea4:	7100151f 	cmp	w8, #0x5
    8ea8:	54000641 	b.ne	8f70 <__jis_mbtowc+0x1b0>  // b.any
    8eac:	b900009f 	str	wzr, [x4]
    8eb0:	52800000 	mov	w0, #0x0                   	// #0
    8eb4:	b900003f 	str	wzr, [x1]
    8eb8:	910043ff 	add	sp, sp, #0x10
    8ebc:	d65f03c0 	ret
    8ec0:	52800086 	mov	w6, #0x4                   	// #4
    8ec4:	710108ff 	cmp	w7, #0x42
    8ec8:	54fffb00 	b.eq	8e28 <__jis_mbtowc+0x68>  // b.none
    8ecc:	528000a6 	mov	w6, #0x5                   	// #5
    8ed0:	710128ff 	cmp	w7, #0x4a
    8ed4:	54fffaa0 	b.eq	8e28 <__jis_mbtowc+0x68>  // b.none
    8ed8:	52800066 	mov	w6, #0x3                   	// #3
    8edc:	710100ff 	cmp	w7, #0x40
    8ee0:	54fffa40 	b.eq	8e28 <__jis_mbtowc+0x68>  // b.none
    8ee4:	510084e0 	sub	w0, w7, #0x21
    8ee8:	7101741f 	cmp	w0, #0x5d
    8eec:	1a9f97e6 	cset	w6, hi  // hi = pmore
    8ef0:	11001cc6 	add	w6, w6, #0x7
    8ef4:	d503201f 	nop
    8ef8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    8efc:	8b25c005 	add	x5, x0, w5, sxtw
    8f00:	8b050180 	add	x0, x12, x5
    8f04:	8b050165 	add	x5, x11, x5
    8f08:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    8f0c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    8f10:	71000d1f 	cmp	w8, #0x3
    8f14:	54fff9a1 	b.ne	8e48 <__jis_mbtowc+0x88>  // b.any
    8f18:	91000529 	add	x9, x9, #0x1
    8f1c:	8b09004f 	add	x15, x2, x9
    8f20:	11000549 	add	w9, w10, #0x1
    8f24:	aa0903ea 	mov	x10, x9
    8f28:	eb03013f 	cmp	x9, x3
    8f2c:	54fff683 	b.cc	8dfc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    8f30:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8f34:	b9000085 	str	w5, [x4]
    8f38:	17ffffd0 	b	8e78 <__jis_mbtowc+0xb8>
    8f3c:	528000c6 	mov	w6, #0x6                   	// #6
    8f40:	34fff747 	cbz	w7, 8e28 <__jis_mbtowc+0x68>
    8f44:	510084e0 	sub	w0, w7, #0x21
    8f48:	7101741f 	cmp	w0, #0x5d
    8f4c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    8f50:	11001cc6 	add	w6, w6, #0x7
    8f54:	17ffffe9 	b	8ef8 <__jis_mbtowc+0x138>
    8f58:	11000549 	add	w9, w10, #0x1
    8f5c:	39001087 	strb	w7, [x4, #4]
    8f60:	aa0903ea 	mov	x10, x9
    8f64:	eb03013f 	cmp	x9, x3
    8f68:	54fff4a3 	b.cc	8dfc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    8f6c:	17fffff1 	b	8f30 <__jis_mbtowc+0x170>
    8f70:	52801141 	mov	w1, #0x8a                  	// #138
    8f74:	b90001a1 	str	w1, [x13]
    8f78:	12800000 	mov	w0, #0xffffffff            	// #-1
    8f7c:	910043ff 	add	sp, sp, #0x10
    8f80:	d65f03c0 	ret
    8f84:	b900009f 	str	wzr, [x4]
    8f88:	52800020 	mov	w0, #0x1                   	// #1
    8f8c:	910043ff 	add	sp, sp, #0x10
    8f90:	d65f03c0 	ret
    8f94:	52800046 	mov	w6, #0x2                   	// #2
    8f98:	17ffffa4 	b	8e28 <__jis_mbtowc+0x68>
    8f9c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8fa0:	17ffffb6 	b	8e78 <__jis_mbtowc+0xb8>

0000000000008fa4 <memchr>:
    8fa4:	b4000682 	cbz	x2, 9074 <memchr+0xd0>
    8fa8:	52808025 	mov	w5, #0x401                 	// #1025
    8fac:	72a80205 	movk	w5, #0x4010, lsl #16
    8fb0:	4e010c20 	dup	v0.16b, w1
    8fb4:	927be803 	and	x3, x0, #0xffffffffffffffe0
    8fb8:	4e040ca5 	dup	v5.4s, w5
    8fbc:	f2401009 	ands	x9, x0, #0x1f
    8fc0:	9240104a 	and	x10, x2, #0x1f
    8fc4:	54000200 	b.eq	9004 <memchr+0x60>  // b.none
    8fc8:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    8fcc:	d1008124 	sub	x4, x9, #0x20
    8fd0:	ab040042 	adds	x2, x2, x4
    8fd4:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    8fd8:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    8fdc:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    8fe0:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    8fe4:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    8fe8:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    8fec:	4e083cc6 	mov	x6, v6.d[0]
    8ff0:	d37ff924 	lsl	x4, x9, #1
    8ff4:	9ac424c6 	lsr	x6, x6, x4
    8ff8:	9ac420c6 	lsl	x6, x6, x4
    8ffc:	54000229 	b.ls	9040 <memchr+0x9c>  // b.plast
    9000:	b50002c6 	cbnz	x6, 9058 <memchr+0xb4>
    9004:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    9008:	f1008042 	subs	x2, x2, #0x20
    900c:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    9010:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    9014:	540000a9 	b.ls	9028 <memchr+0x84>  // b.plast
    9018:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    901c:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    9020:	4e083cc6 	mov	x6, v6.d[0]
    9024:	b4ffff06 	cbz	x6, 9004 <memchr+0x60>
    9028:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    902c:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    9030:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    9034:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    9038:	4e083cc6 	mov	x6, v6.d[0]
    903c:	540000e8 	b.hi	9058 <memchr+0xb4>  // b.pmore
    9040:	8b090144 	add	x4, x10, x9
    9044:	92401084 	and	x4, x4, #0x1f
    9048:	d1008084 	sub	x4, x4, #0x20
    904c:	cb0407e4 	neg	x4, x4, lsl #1
    9050:	9ac420c6 	lsl	x6, x6, x4
    9054:	9ac424c6 	lsr	x6, x6, x4
    9058:	dac000c6 	rbit	x6, x6
    905c:	d1008063 	sub	x3, x3, #0x20
    9060:	f10000df 	cmp	x6, #0x0
    9064:	dac010c6 	clz	x6, x6
    9068:	8b460460 	add	x0, x3, x6, lsr #1
    906c:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    9070:	d65f03c0 	ret
    9074:	d2800000 	mov	x0, #0x0                   	// #0
    9078:	d65f03c0 	ret
    907c:	d503201f 	nop

0000000000009080 <__malloc_lock>:
    9080:	d65f03c0 	ret
    9084:	d503201f 	nop
    9088:	d503201f 	nop
    908c:	d503201f 	nop

0000000000009090 <__malloc_unlock>:
    9090:	d65f03c0 	ret
    9094:	d503201f 	nop
    9098:	d503201f 	nop
    909c:	d503201f 	nop

00000000000090a0 <_realloc_r>:
    90a0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    90a4:	910003fd 	mov	x29, sp
    90a8:	a9025bf5 	stp	x21, x22, [sp, #32]
    90ac:	aa0203f5 	mov	x21, x2
    90b0:	b40010e1 	cbz	x1, 92cc <_realloc_r+0x22c>
    90b4:	a90363f7 	stp	x23, x24, [sp, #48]
    90b8:	d1004038 	sub	x24, x1, #0x10
    90bc:	aa0003f7 	mov	x23, x0
    90c0:	a90153f3 	stp	x19, x20, [sp, #16]
    90c4:	aa0103f3 	mov	x19, x1
    90c8:	91005eb4 	add	x20, x21, #0x17
    90cc:	a9046bf9 	stp	x25, x26, [sp, #64]
    90d0:	97ffffec 	bl	9080 <__malloc_lock>
    90d4:	aa1803f9 	mov	x25, x24
    90d8:	f9400700 	ldr	x0, [x24, #8]
    90dc:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    90e0:	f100ba9f 	cmp	x20, #0x2e
    90e4:	54000908 	b.hi	9204 <_realloc_r+0x164>  // b.pmore
    90e8:	52800001 	mov	w1, #0x0                   	// #0
    90ec:	7100003f 	cmp	w1, #0x0
    90f0:	d2800414 	mov	x20, #0x20                  	// #32
    90f4:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    90f8:	54000943 	b.cc	9220 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    90fc:	eb1402df 	cmp	x22, x20
    9100:	54000b0a 	b.ge	9260 <_realloc_r+0x1c0>  // b.tcont
    9104:	90000021 	adrp	x1, d000 <impure_data+0x680>
    9108:	a90573fb 	stp	x27, x28, [sp, #80]
    910c:	910a403c 	add	x28, x1, #0x290
    9110:	8b160302 	add	x2, x24, x22
    9114:	f9400b83 	ldr	x3, [x28, #16]
    9118:	f9400441 	ldr	x1, [x2, #8]
    911c:	eb02007f 	cmp	x3, x2
    9120:	54000f60 	b.eq	930c <_realloc_r+0x26c>  // b.none
    9124:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    9128:	8b030043 	add	x3, x2, x3
    912c:	f9400463 	ldr	x3, [x3, #8]
    9130:	37000c23 	tbnz	w3, #0, 92b4 <_realloc_r+0x214>
    9134:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    9138:	8b0102c3 	add	x3, x22, x1
    913c:	eb03029f 	cmp	x20, x3
    9140:	5400084d 	b.le	9248 <_realloc_r+0x1a8>
    9144:	37000180 	tbnz	w0, #0, 9174 <_realloc_r+0xd4>
    9148:	f85f027b 	ldur	x27, [x19, #-16]
    914c:	cb1b031b 	sub	x27, x24, x27
    9150:	f9400760 	ldr	x0, [x27, #8]
    9154:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9158:	8b010001 	add	x1, x0, x1
    915c:	8b160023 	add	x3, x1, x22
    9160:	eb03029f 	cmp	x20, x3
    9164:	540019ad 	b.le	9498 <_realloc_r+0x3f8>
    9168:	8b0002c3 	add	x3, x22, x0
    916c:	eb03029f 	cmp	x20, x3
    9170:	5400152d 	b.le	9414 <_realloc_r+0x374>
    9174:	aa1503e1 	mov	x1, x21
    9178:	aa1703e0 	mov	x0, x23
    917c:	97fffbb9 	bl	8060 <_malloc_r>
    9180:	aa0003f5 	mov	x21, x0
    9184:	b40002c0 	cbz	x0, 91dc <_realloc_r+0x13c>
    9188:	f9400701 	ldr	x1, [x24, #8]
    918c:	d1004002 	sub	x2, x0, #0x10
    9190:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    9194:	8b010318 	add	x24, x24, x1
    9198:	eb02031f 	cmp	x24, x2
    919c:	54001200 	b.eq	93dc <_realloc_r+0x33c>  // b.none
    91a0:	d10022c2 	sub	x2, x22, #0x8
    91a4:	f101205f 	cmp	x2, #0x48
    91a8:	54001728 	b.hi	948c <_realloc_r+0x3ec>  // b.pmore
    91ac:	f1009c5f 	cmp	x2, #0x27
    91b0:	54001208 	b.hi	93f0 <_realloc_r+0x350>  // b.pmore
    91b4:	aa1303e1 	mov	x1, x19
    91b8:	f9400022 	ldr	x2, [x1]
    91bc:	f9000002 	str	x2, [x0]
    91c0:	f9400422 	ldr	x2, [x1, #8]
    91c4:	f9000402 	str	x2, [x0, #8]
    91c8:	f9400821 	ldr	x1, [x1, #16]
    91cc:	f9000801 	str	x1, [x0, #16]
    91d0:	aa1303e1 	mov	x1, x19
    91d4:	aa1703e0 	mov	x0, x23
    91d8:	97fff582 	bl	67e0 <_free_r>
    91dc:	aa1703e0 	mov	x0, x23
    91e0:	97ffffac 	bl	9090 <__malloc_unlock>
    91e4:	aa1503e0 	mov	x0, x21
    91e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    91ec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    91f0:	a94363f7 	ldp	x23, x24, [sp, #48]
    91f4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    91f8:	a94573fb 	ldp	x27, x28, [sp, #80]
    91fc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9200:	d65f03c0 	ret
    9204:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    9208:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    920c:	eb01029f 	cmp	x20, x1
    9210:	1a9f97e1 	cset	w1, hi  // hi = pmore
    9214:	7100003f 	cmp	w1, #0x0
    9218:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    921c:	54fff702 	b.cs	90fc <_realloc_r+0x5c>  // b.hs, b.nlast
    9220:	52800180 	mov	w0, #0xc                   	// #12
    9224:	b90002e0 	str	w0, [x23]
    9228:	d2800015 	mov	x21, #0x0                   	// #0
    922c:	aa1503e0 	mov	x0, x21
    9230:	a94153f3 	ldp	x19, x20, [sp, #16]
    9234:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9238:	a94363f7 	ldp	x23, x24, [sp, #48]
    923c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9240:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9244:	d65f03c0 	ret
    9248:	a9410041 	ldp	x1, x0, [x2, #16]
    924c:	aa0303f6 	mov	x22, x3
    9250:	a94573fb 	ldp	x27, x28, [sp, #80]
    9254:	f9000c20 	str	x0, [x1, #24]
    9258:	f9000801 	str	x1, [x0, #16]
    925c:	d503201f 	nop
    9260:	f9400721 	ldr	x1, [x25, #8]
    9264:	cb1402c0 	sub	x0, x22, x20
    9268:	8b160322 	add	x2, x25, x22
    926c:	92400021 	and	x1, x1, #0x1
    9270:	f1007c1f 	cmp	x0, #0x1f
    9274:	54000348 	b.hi	92dc <_realloc_r+0x23c>  // b.pmore
    9278:	aa0102c1 	orr	x1, x22, x1
    927c:	f9000721 	str	x1, [x25, #8]
    9280:	f9400440 	ldr	x0, [x2, #8]
    9284:	b2400000 	orr	x0, x0, #0x1
    9288:	f9000440 	str	x0, [x2, #8]
    928c:	aa1703e0 	mov	x0, x23
    9290:	aa1303f5 	mov	x21, x19
    9294:	97ffff7f 	bl	9090 <__malloc_unlock>
    9298:	aa1503e0 	mov	x0, x21
    929c:	a94153f3 	ldp	x19, x20, [sp, #16]
    92a0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    92a4:	a94363f7 	ldp	x23, x24, [sp, #48]
    92a8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    92ac:	a8c67bfd 	ldp	x29, x30, [sp], #96
    92b0:	d65f03c0 	ret
    92b4:	3707f600 	tbnz	w0, #0, 9174 <_realloc_r+0xd4>
    92b8:	f85f027b 	ldur	x27, [x19, #-16]
    92bc:	cb1b031b 	sub	x27, x24, x27
    92c0:	f9400760 	ldr	x0, [x27, #8]
    92c4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    92c8:	17ffffa8 	b	9168 <_realloc_r+0xc8>
    92cc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    92d0:	aa0203e1 	mov	x1, x2
    92d4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    92d8:	17fffb62 	b	8060 <_malloc_r>
    92dc:	8b140324 	add	x4, x25, x20
    92e0:	aa010281 	orr	x1, x20, x1
    92e4:	f9000721 	str	x1, [x25, #8]
    92e8:	b2400003 	orr	x3, x0, #0x1
    92ec:	91004081 	add	x1, x4, #0x10
    92f0:	aa1703e0 	mov	x0, x23
    92f4:	f9000483 	str	x3, [x4, #8]
    92f8:	f9400443 	ldr	x3, [x2, #8]
    92fc:	b2400063 	orr	x3, x3, #0x1
    9300:	f9000443 	str	x3, [x2, #8]
    9304:	97fff537 	bl	67e0 <_free_r>
    9308:	17ffffe1 	b	928c <_realloc_r+0x1ec>
    930c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    9310:	91008283 	add	x3, x20, #0x20
    9314:	8b0102c2 	add	x2, x22, x1
    9318:	eb03005f 	cmp	x2, x3
    931c:	54000eaa 	b.ge	94f0 <_realloc_r+0x450>  // b.tcont
    9320:	3707f2a0 	tbnz	w0, #0, 9174 <_realloc_r+0xd4>
    9324:	f85f027b 	ldur	x27, [x19, #-16]
    9328:	cb1b031b 	sub	x27, x24, x27
    932c:	f9400760 	ldr	x0, [x27, #8]
    9330:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9334:	8b010001 	add	x1, x0, x1
    9338:	8b16003a 	add	x26, x1, x22
    933c:	eb1a007f 	cmp	x3, x26
    9340:	54fff14c 	b.gt	9168 <_realloc_r+0xc8>
    9344:	aa1b03f5 	mov	x21, x27
    9348:	d10022c2 	sub	x2, x22, #0x8
    934c:	f9400f60 	ldr	x0, [x27, #24]
    9350:	f8410ea1 	ldr	x1, [x21, #16]!
    9354:	f9000c20 	str	x0, [x1, #24]
    9358:	f9000801 	str	x1, [x0, #16]
    935c:	f101205f 	cmp	x2, #0x48
    9360:	54001128 	b.hi	9584 <_realloc_r+0x4e4>  // b.pmore
    9364:	aa1503e0 	mov	x0, x21
    9368:	f1009c5f 	cmp	x2, #0x27
    936c:	54000129 	b.ls	9390 <_realloc_r+0x2f0>  // b.plast
    9370:	f9400260 	ldr	x0, [x19]
    9374:	f9000b60 	str	x0, [x27, #16]
    9378:	f9400660 	ldr	x0, [x19, #8]
    937c:	f9000f60 	str	x0, [x27, #24]
    9380:	f100dc5f 	cmp	x2, #0x37
    9384:	54001088 	b.hi	9594 <_realloc_r+0x4f4>  // b.pmore
    9388:	91004273 	add	x19, x19, #0x10
    938c:	91008360 	add	x0, x27, #0x20
    9390:	f9400261 	ldr	x1, [x19]
    9394:	f9000001 	str	x1, [x0]
    9398:	f9400661 	ldr	x1, [x19, #8]
    939c:	f9000401 	str	x1, [x0, #8]
    93a0:	f9400a61 	ldr	x1, [x19, #16]
    93a4:	f9000801 	str	x1, [x0, #16]
    93a8:	8b140362 	add	x2, x27, x20
    93ac:	cb140341 	sub	x1, x26, x20
    93b0:	f9000b82 	str	x2, [x28, #16]
    93b4:	b2400021 	orr	x1, x1, #0x1
    93b8:	aa1703e0 	mov	x0, x23
    93bc:	f9000441 	str	x1, [x2, #8]
    93c0:	f9400761 	ldr	x1, [x27, #8]
    93c4:	92400021 	and	x1, x1, #0x1
    93c8:	aa140034 	orr	x20, x1, x20
    93cc:	f9000774 	str	x20, [x27, #8]
    93d0:	97ffff30 	bl	9090 <__malloc_unlock>
    93d4:	a94573fb 	ldp	x27, x28, [sp, #80]
    93d8:	17ffffb0 	b	9298 <_realloc_r+0x1f8>
    93dc:	f9400700 	ldr	x0, [x24, #8]
    93e0:	a94573fb 	ldp	x27, x28, [sp, #80]
    93e4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    93e8:	8b0002d6 	add	x22, x22, x0
    93ec:	17ffff9d 	b	9260 <_realloc_r+0x1c0>
    93f0:	f9400260 	ldr	x0, [x19]
    93f4:	f90002a0 	str	x0, [x21]
    93f8:	f9400660 	ldr	x0, [x19, #8]
    93fc:	f90006a0 	str	x0, [x21, #8]
    9400:	f100dc5f 	cmp	x2, #0x37
    9404:	54000648 	b.hi	94cc <_realloc_r+0x42c>  // b.pmore
    9408:	91004261 	add	x1, x19, #0x10
    940c:	910042a0 	add	x0, x21, #0x10
    9410:	17ffff6a 	b	91b8 <_realloc_r+0x118>
    9414:	aa1b03e0 	mov	x0, x27
    9418:	d10022c2 	sub	x2, x22, #0x8
    941c:	f8410c04 	ldr	x4, [x0, #16]!
    9420:	f9400f61 	ldr	x1, [x27, #24]
    9424:	f9000c81 	str	x1, [x4, #24]
    9428:	f9000824 	str	x4, [x1, #16]
    942c:	f101205f 	cmp	x2, #0x48
    9430:	54000408 	b.hi	94b0 <_realloc_r+0x410>  // b.pmore
    9434:	aa0003e1 	mov	x1, x0
    9438:	f1009c5f 	cmp	x2, #0x27
    943c:	54000129 	b.ls	9460 <_realloc_r+0x3c0>  // b.plast
    9440:	f9400261 	ldr	x1, [x19]
    9444:	f9000b61 	str	x1, [x27, #16]
    9448:	f9400661 	ldr	x1, [x19, #8]
    944c:	f9000f61 	str	x1, [x27, #24]
    9450:	f100dc5f 	cmp	x2, #0x37
    9454:	540006a8 	b.hi	9528 <_realloc_r+0x488>  // b.pmore
    9458:	91004273 	add	x19, x19, #0x10
    945c:	91008361 	add	x1, x27, #0x20
    9460:	f9400262 	ldr	x2, [x19]
    9464:	aa1b03f9 	mov	x25, x27
    9468:	a94573fb 	ldp	x27, x28, [sp, #80]
    946c:	f9000022 	str	x2, [x1]
    9470:	aa0303f6 	mov	x22, x3
    9474:	f9400662 	ldr	x2, [x19, #8]
    9478:	f9000422 	str	x2, [x1, #8]
    947c:	f9400a62 	ldr	x2, [x19, #16]
    9480:	aa0003f3 	mov	x19, x0
    9484:	f9000822 	str	x2, [x1, #16]
    9488:	17ffff76 	b	9260 <_realloc_r+0x1c0>
    948c:	aa1303e1 	mov	x1, x19
    9490:	97ffe98c 	bl	3ac0 <memmove>
    9494:	17ffff4f 	b	91d0 <_realloc_r+0x130>
    9498:	a9410444 	ldp	x4, x1, [x2, #16]
    949c:	f9000c81 	str	x1, [x4, #24]
    94a0:	aa1b03e0 	mov	x0, x27
    94a4:	d10022c2 	sub	x2, x22, #0x8
    94a8:	f9000824 	str	x4, [x1, #16]
    94ac:	17ffffdc 	b	941c <_realloc_r+0x37c>
    94b0:	aa1303e1 	mov	x1, x19
    94b4:	aa0303f6 	mov	x22, x3
    94b8:	aa1b03f9 	mov	x25, x27
    94bc:	aa0003f3 	mov	x19, x0
    94c0:	97ffe980 	bl	3ac0 <memmove>
    94c4:	a94573fb 	ldp	x27, x28, [sp, #80]
    94c8:	17ffff66 	b	9260 <_realloc_r+0x1c0>
    94cc:	f9400a60 	ldr	x0, [x19, #16]
    94d0:	f9000aa0 	str	x0, [x21, #16]
    94d4:	f9400e60 	ldr	x0, [x19, #24]
    94d8:	f9000ea0 	str	x0, [x21, #24]
    94dc:	f101205f 	cmp	x2, #0x48
    94e0:	54000360 	b.eq	954c <_realloc_r+0x4ac>  // b.none
    94e4:	91008261 	add	x1, x19, #0x20
    94e8:	910082a0 	add	x0, x21, #0x20
    94ec:	17ffff33 	b	91b8 <_realloc_r+0x118>
    94f0:	8b140303 	add	x3, x24, x20
    94f4:	cb140041 	sub	x1, x2, x20
    94f8:	f9000b83 	str	x3, [x28, #16]
    94fc:	b2400021 	orr	x1, x1, #0x1
    9500:	aa1703e0 	mov	x0, x23
    9504:	aa1303f5 	mov	x21, x19
    9508:	f9000461 	str	x1, [x3, #8]
    950c:	f9400701 	ldr	x1, [x24, #8]
    9510:	92400021 	and	x1, x1, #0x1
    9514:	aa140034 	orr	x20, x1, x20
    9518:	f9000714 	str	x20, [x24, #8]
    951c:	97fffedd 	bl	9090 <__malloc_unlock>
    9520:	a94573fb 	ldp	x27, x28, [sp, #80]
    9524:	17ffff5d 	b	9298 <_realloc_r+0x1f8>
    9528:	f9400a61 	ldr	x1, [x19, #16]
    952c:	f9001361 	str	x1, [x27, #32]
    9530:	f9400e61 	ldr	x1, [x19, #24]
    9534:	f9001761 	str	x1, [x27, #40]
    9538:	f101205f 	cmp	x2, #0x48
    953c:	54000160 	b.eq	9568 <_realloc_r+0x4c8>  // b.none
    9540:	91008273 	add	x19, x19, #0x20
    9544:	9100c361 	add	x1, x27, #0x30
    9548:	17ffffc6 	b	9460 <_realloc_r+0x3c0>
    954c:	f9401260 	ldr	x0, [x19, #32]
    9550:	f90012a0 	str	x0, [x21, #32]
    9554:	9100c261 	add	x1, x19, #0x30
    9558:	9100c2a0 	add	x0, x21, #0x30
    955c:	f9401662 	ldr	x2, [x19, #40]
    9560:	f90016a2 	str	x2, [x21, #40]
    9564:	17ffff15 	b	91b8 <_realloc_r+0x118>
    9568:	f9401261 	ldr	x1, [x19, #32]
    956c:	f9001b61 	str	x1, [x27, #48]
    9570:	9100c273 	add	x19, x19, #0x30
    9574:	91010361 	add	x1, x27, #0x40
    9578:	f85f8262 	ldur	x2, [x19, #-8]
    957c:	f9001f62 	str	x2, [x27, #56]
    9580:	17ffffb8 	b	9460 <_realloc_r+0x3c0>
    9584:	aa1303e1 	mov	x1, x19
    9588:	aa1503e0 	mov	x0, x21
    958c:	97ffe94d 	bl	3ac0 <memmove>
    9590:	17ffff86 	b	93a8 <_realloc_r+0x308>
    9594:	f9400a60 	ldr	x0, [x19, #16]
    9598:	f9001360 	str	x0, [x27, #32]
    959c:	f9400e60 	ldr	x0, [x19, #24]
    95a0:	f9001760 	str	x0, [x27, #40]
    95a4:	f101205f 	cmp	x2, #0x48
    95a8:	54000080 	b.eq	95b8 <_realloc_r+0x518>  // b.none
    95ac:	91008273 	add	x19, x19, #0x20
    95b0:	9100c360 	add	x0, x27, #0x30
    95b4:	17ffff77 	b	9390 <_realloc_r+0x2f0>
    95b8:	f9401260 	ldr	x0, [x19, #32]
    95bc:	f9001b60 	str	x0, [x27, #48]
    95c0:	9100c273 	add	x19, x19, #0x30
    95c4:	91010360 	add	x0, x27, #0x40
    95c8:	f85f8261 	ldur	x1, [x19, #-8]
    95cc:	f9001f61 	str	x1, [x27, #56]
    95d0:	17ffff70 	b	9390 <_realloc_r+0x2f0>
    95d4:	d503201f 	nop
    95d8:	d503201f 	nop
    95dc:	d503201f 	nop

00000000000095e0 <_sbrk_r>:
    95e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    95e4:	910003fd 	mov	x29, sp
    95e8:	a90153f3 	stp	x19, x20, [sp, #16]
    95ec:	90000034 	adrp	x20, d000 <impure_data+0x680>
    95f0:	aa0003f3 	mov	x19, x0
    95f4:	b90ec29f 	str	wzr, [x20, #3776]
    95f8:	aa0103e0 	mov	x0, x1
    95fc:	97ffe805 	bl	3610 <_sbrk>
    9600:	b100041f 	cmn	x0, #0x1
    9604:	54000080 	b.eq	9614 <_sbrk_r+0x34>  // b.none
    9608:	a94153f3 	ldp	x19, x20, [sp, #16]
    960c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9610:	d65f03c0 	ret
    9614:	b94ec281 	ldr	w1, [x20, #3776]
    9618:	34ffff81 	cbz	w1, 9608 <_sbrk_r+0x28>
    961c:	b9000261 	str	w1, [x19]
    9620:	a94153f3 	ldp	x19, x20, [sp, #16]
    9624:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9628:	d65f03c0 	ret
    962c:	d503201f 	nop

0000000000009630 <_init_signal_r>:
    9630:	f9428c01 	ldr	x1, [x0, #1304]
    9634:	b4000061 	cbz	x1, 9640 <_init_signal_r+0x10>
    9638:	52800000 	mov	w0, #0x0                   	// #0
    963c:	d65f03c0 	ret
    9640:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9644:	d2802001 	mov	x1, #0x100                 	// #256
    9648:	910003fd 	mov	x29, sp
    964c:	f9000bf3 	str	x19, [sp, #16]
    9650:	aa0003f3 	mov	x19, x0
    9654:	97fffa83 	bl	8060 <_malloc_r>
    9658:	f9028e60 	str	x0, [x19, #1304]
    965c:	b4000140 	cbz	x0, 9684 <_init_signal_r+0x54>
    9660:	91040001 	add	x1, x0, #0x100
    9664:	d503201f 	nop
    9668:	f800841f 	str	xzr, [x0], #8
    966c:	eb01001f 	cmp	x0, x1
    9670:	54ffffc1 	b.ne	9668 <_init_signal_r+0x38>  // b.any
    9674:	52800000 	mov	w0, #0x0                   	// #0
    9678:	f9400bf3 	ldr	x19, [sp, #16]
    967c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9680:	d65f03c0 	ret
    9684:	12800000 	mov	w0, #0xffffffff            	// #-1
    9688:	17fffffc 	b	9678 <_init_signal_r+0x48>
    968c:	d503201f 	nop

0000000000009690 <_signal_r>:
    9690:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9694:	910003fd 	mov	x29, sp
    9698:	a90153f3 	stp	x19, x20, [sp, #16]
    969c:	93407c33 	sxtw	x19, w1
    96a0:	aa0003f4 	mov	x20, x0
    96a4:	71007e7f 	cmp	w19, #0x1f
    96a8:	54000108 	b.hi	96c8 <_signal_r+0x38>  // b.pmore
    96ac:	f9428c04 	ldr	x4, [x0, #1304]
    96b0:	b4000184 	cbz	x4, 96e0 <_signal_r+0x50>
    96b4:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    96b8:	f8337882 	str	x2, [x4, x19, lsl #3]
    96bc:	a94153f3 	ldp	x19, x20, [sp, #16]
    96c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    96c4:	d65f03c0 	ret
    96c8:	528002c1 	mov	w1, #0x16                  	// #22
    96cc:	b9000281 	str	w1, [x20]
    96d0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    96d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    96d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    96dc:	d65f03c0 	ret
    96e0:	d2802001 	mov	x1, #0x100                 	// #256
    96e4:	f90017e2 	str	x2, [sp, #40]
    96e8:	97fffa5e 	bl	8060 <_malloc_r>
    96ec:	f9028e80 	str	x0, [x20, #1304]
    96f0:	aa0003e4 	mov	x4, x0
    96f4:	b4000120 	cbz	x0, 9718 <_signal_r+0x88>
    96f8:	f94017e2 	ldr	x2, [sp, #40]
    96fc:	aa0003e3 	mov	x3, x0
    9700:	91040001 	add	x1, x0, #0x100
    9704:	d503201f 	nop
    9708:	f800847f 	str	xzr, [x3], #8
    970c:	eb03003f 	cmp	x1, x3
    9710:	54ffffc1 	b.ne	9708 <_signal_r+0x78>  // b.any
    9714:	17ffffe8 	b	96b4 <_signal_r+0x24>
    9718:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    971c:	17ffffe8 	b	96bc <_signal_r+0x2c>

0000000000009720 <_raise_r>:
    9720:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9724:	910003fd 	mov	x29, sp
    9728:	a90153f3 	stp	x19, x20, [sp, #16]
    972c:	aa0003f4 	mov	x20, x0
    9730:	71007c3f 	cmp	w1, #0x1f
    9734:	54000488 	b.hi	97c4 <_raise_r+0xa4>  // b.pmore
    9738:	f9428c00 	ldr	x0, [x0, #1304]
    973c:	2a0103f3 	mov	w19, w1
    9740:	b40001e0 	cbz	x0, 977c <_raise_r+0x5c>
    9744:	93407c22 	sxtw	x2, w1
    9748:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    974c:	b4000181 	cbz	x1, 977c <_raise_r+0x5c>
    9750:	f100043f 	cmp	x1, #0x1
    9754:	54000300 	b.eq	97b4 <_raise_r+0x94>  // b.none
    9758:	b100043f 	cmn	x1, #0x1
    975c:	54000200 	b.eq	979c <_raise_r+0x7c>  // b.none
    9760:	f822781f 	str	xzr, [x0, x2, lsl #3]
    9764:	2a1303e0 	mov	w0, w19
    9768:	d63f0020 	blr	x1
    976c:	52800000 	mov	w0, #0x0                   	// #0
    9770:	a94153f3 	ldp	x19, x20, [sp, #16]
    9774:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9778:	d65f03c0 	ret
    977c:	aa1403e0 	mov	x0, x20
    9780:	940000fc 	bl	9b70 <_getpid_r>
    9784:	2a1303e2 	mov	w2, w19
    9788:	2a0003e1 	mov	w1, w0
    978c:	aa1403e0 	mov	x0, x20
    9790:	a94153f3 	ldp	x19, x20, [sp, #16]
    9794:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9798:	140000e2 	b	9b20 <_kill_r>
    979c:	528002c1 	mov	w1, #0x16                  	// #22
    97a0:	b9000281 	str	w1, [x20]
    97a4:	52800020 	mov	w0, #0x1                   	// #1
    97a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    97ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    97b0:	d65f03c0 	ret
    97b4:	52800000 	mov	w0, #0x0                   	// #0
    97b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    97bc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    97c0:	d65f03c0 	ret
    97c4:	528002c1 	mov	w1, #0x16                  	// #22
    97c8:	12800000 	mov	w0, #0xffffffff            	// #-1
    97cc:	b9000281 	str	w1, [x20]
    97d0:	17ffffe8 	b	9770 <_raise_r+0x50>
    97d4:	d503201f 	nop
    97d8:	d503201f 	nop
    97dc:	d503201f 	nop

00000000000097e0 <__sigtramp_r>:
    97e0:	71007c3f 	cmp	w1, #0x1f
    97e4:	540005a8 	b.hi	9898 <__sigtramp_r+0xb8>  // b.pmore
    97e8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    97ec:	910003fd 	mov	x29, sp
    97f0:	f9428c03 	ldr	x3, [x0, #1304]
    97f4:	a90153f3 	stp	x19, x20, [sp, #16]
    97f8:	2a0103f3 	mov	w19, w1
    97fc:	aa0003f4 	mov	x20, x0
    9800:	b4000263 	cbz	x3, 984c <__sigtramp_r+0x6c>
    9804:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    9808:	8b33cc63 	add	x3, x3, w19, sxtw #3
    980c:	b4000181 	cbz	x1, 983c <__sigtramp_r+0x5c>
    9810:	b100043f 	cmn	x1, #0x1
    9814:	540003a0 	b.eq	9888 <__sigtramp_r+0xa8>  // b.none
    9818:	f100043f 	cmp	x1, #0x1
    981c:	540002e0 	b.eq	9878 <__sigtramp_r+0x98>  // b.none
    9820:	f900007f 	str	xzr, [x3]
    9824:	2a1303e0 	mov	w0, w19
    9828:	d63f0020 	blr	x1
    982c:	52800000 	mov	w0, #0x0                   	// #0
    9830:	a94153f3 	ldp	x19, x20, [sp, #16]
    9834:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9838:	d65f03c0 	ret
    983c:	52800020 	mov	w0, #0x1                   	// #1
    9840:	a94153f3 	ldp	x19, x20, [sp, #16]
    9844:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9848:	d65f03c0 	ret
    984c:	d2802001 	mov	x1, #0x100                 	// #256
    9850:	97fffa04 	bl	8060 <_malloc_r>
    9854:	f9028e80 	str	x0, [x20, #1304]
    9858:	aa0003e3 	mov	x3, x0
    985c:	b40001a0 	cbz	x0, 9890 <__sigtramp_r+0xb0>
    9860:	aa0003e2 	mov	x2, x0
    9864:	91040000 	add	x0, x0, #0x100
    9868:	f800845f 	str	xzr, [x2], #8
    986c:	eb00005f 	cmp	x2, x0
    9870:	54ffffc1 	b.ne	9868 <__sigtramp_r+0x88>  // b.any
    9874:	17ffffe4 	b	9804 <__sigtramp_r+0x24>
    9878:	52800060 	mov	w0, #0x3                   	// #3
    987c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9880:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9884:	d65f03c0 	ret
    9888:	52800040 	mov	w0, #0x2                   	// #2
    988c:	17ffffe9 	b	9830 <__sigtramp_r+0x50>
    9890:	12800000 	mov	w0, #0xffffffff            	// #-1
    9894:	17ffffe7 	b	9830 <__sigtramp_r+0x50>
    9898:	12800000 	mov	w0, #0xffffffff            	// #-1
    989c:	d65f03c0 	ret

00000000000098a0 <raise>:
    98a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    98a4:	f0000001 	adrp	x1, c000 <JIS_state_table+0x10>
    98a8:	910003fd 	mov	x29, sp
    98ac:	a90153f3 	stp	x19, x20, [sp, #16]
    98b0:	f944bc34 	ldr	x20, [x1, #2424]
    98b4:	71007c1f 	cmp	w0, #0x1f
    98b8:	54000468 	b.hi	9944 <raise+0xa4>  // b.pmore
    98bc:	f9428e82 	ldr	x2, [x20, #1304]
    98c0:	2a0003f3 	mov	w19, w0
    98c4:	b40001c2 	cbz	x2, 98fc <raise+0x5c>
    98c8:	93407c03 	sxtw	x3, w0
    98cc:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    98d0:	b4000161 	cbz	x1, 98fc <raise+0x5c>
    98d4:	f100043f 	cmp	x1, #0x1
    98d8:	540002e0 	b.eq	9934 <raise+0x94>  // b.none
    98dc:	b100043f 	cmn	x1, #0x1
    98e0:	540001e0 	b.eq	991c <raise+0x7c>  // b.none
    98e4:	f823785f 	str	xzr, [x2, x3, lsl #3]
    98e8:	d63f0020 	blr	x1
    98ec:	52800000 	mov	w0, #0x0                   	// #0
    98f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    98f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    98f8:	d65f03c0 	ret
    98fc:	aa1403e0 	mov	x0, x20
    9900:	9400009c 	bl	9b70 <_getpid_r>
    9904:	2a1303e2 	mov	w2, w19
    9908:	2a0003e1 	mov	w1, w0
    990c:	aa1403e0 	mov	x0, x20
    9910:	a94153f3 	ldp	x19, x20, [sp, #16]
    9914:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9918:	14000082 	b	9b20 <_kill_r>
    991c:	528002c1 	mov	w1, #0x16                  	// #22
    9920:	b9000281 	str	w1, [x20]
    9924:	52800020 	mov	w0, #0x1                   	// #1
    9928:	a94153f3 	ldp	x19, x20, [sp, #16]
    992c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9930:	d65f03c0 	ret
    9934:	52800000 	mov	w0, #0x0                   	// #0
    9938:	a94153f3 	ldp	x19, x20, [sp, #16]
    993c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9940:	d65f03c0 	ret
    9944:	528002c1 	mov	w1, #0x16                  	// #22
    9948:	12800000 	mov	w0, #0xffffffff            	// #-1
    994c:	b9000281 	str	w1, [x20]
    9950:	17ffffe8 	b	98f0 <raise+0x50>
    9954:	d503201f 	nop
    9958:	d503201f 	nop
    995c:	d503201f 	nop

0000000000009960 <signal>:
    9960:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9964:	f0000002 	adrp	x2, c000 <JIS_state_table+0x10>
    9968:	910003fd 	mov	x29, sp
    996c:	a90153f3 	stp	x19, x20, [sp, #16]
    9970:	93407c13 	sxtw	x19, w0
    9974:	f90013f5 	str	x21, [sp, #32]
    9978:	f944bc55 	ldr	x21, [x2, #2424]
    997c:	71007e7f 	cmp	w19, #0x1f
    9980:	54000148 	b.hi	99a8 <signal+0x48>  // b.pmore
    9984:	aa0103f4 	mov	x20, x1
    9988:	f9428ea1 	ldr	x1, [x21, #1304]
    998c:	b40001c1 	cbz	x1, 99c4 <signal+0x64>
    9990:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    9994:	f8337834 	str	x20, [x1, x19, lsl #3]
    9998:	a94153f3 	ldp	x19, x20, [sp, #16]
    999c:	f94013f5 	ldr	x21, [sp, #32]
    99a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    99a4:	d65f03c0 	ret
    99a8:	528002c1 	mov	w1, #0x16                  	// #22
    99ac:	b90002a1 	str	w1, [x21]
    99b0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    99b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    99b8:	f94013f5 	ldr	x21, [sp, #32]
    99bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    99c0:	d65f03c0 	ret
    99c4:	d2802001 	mov	x1, #0x100                 	// #256
    99c8:	aa1503e0 	mov	x0, x21
    99cc:	97fff9a5 	bl	8060 <_malloc_r>
    99d0:	f9028ea0 	str	x0, [x21, #1304]
    99d4:	aa0003e1 	mov	x1, x0
    99d8:	b4000100 	cbz	x0, 99f8 <signal+0x98>
    99dc:	aa0003e2 	mov	x2, x0
    99e0:	91040003 	add	x3, x0, #0x100
    99e4:	d503201f 	nop
    99e8:	f800845f 	str	xzr, [x2], #8
    99ec:	eb02007f 	cmp	x3, x2
    99f0:	54ffffc1 	b.ne	99e8 <signal+0x88>  // b.any
    99f4:	17ffffe7 	b	9990 <signal+0x30>
    99f8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    99fc:	17ffffe7 	b	9998 <signal+0x38>

0000000000009a00 <_init_signal>:
    9a00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9a04:	f0000000 	adrp	x0, c000 <JIS_state_table+0x10>
    9a08:	910003fd 	mov	x29, sp
    9a0c:	f9000bf3 	str	x19, [sp, #16]
    9a10:	f944bc13 	ldr	x19, [x0, #2424]
    9a14:	f9428e60 	ldr	x0, [x19, #1304]
    9a18:	b40000a0 	cbz	x0, 9a2c <_init_signal+0x2c>
    9a1c:	52800000 	mov	w0, #0x0                   	// #0
    9a20:	f9400bf3 	ldr	x19, [sp, #16]
    9a24:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9a28:	d65f03c0 	ret
    9a2c:	aa1303e0 	mov	x0, x19
    9a30:	d2802001 	mov	x1, #0x100                 	// #256
    9a34:	97fff98b 	bl	8060 <_malloc_r>
    9a38:	f9028e60 	str	x0, [x19, #1304]
    9a3c:	b40000e0 	cbz	x0, 9a58 <_init_signal+0x58>
    9a40:	91040001 	add	x1, x0, #0x100
    9a44:	d503201f 	nop
    9a48:	f800841f 	str	xzr, [x0], #8
    9a4c:	eb01001f 	cmp	x0, x1
    9a50:	54ffffc1 	b.ne	9a48 <_init_signal+0x48>  // b.any
    9a54:	17fffff2 	b	9a1c <_init_signal+0x1c>
    9a58:	12800000 	mov	w0, #0xffffffff            	// #-1
    9a5c:	17fffff1 	b	9a20 <_init_signal+0x20>

0000000000009a60 <__sigtramp>:
    9a60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9a64:	f0000001 	adrp	x1, c000 <JIS_state_table+0x10>
    9a68:	910003fd 	mov	x29, sp
    9a6c:	a90153f3 	stp	x19, x20, [sp, #16]
    9a70:	f944bc34 	ldr	x20, [x1, #2424]
    9a74:	71007c1f 	cmp	w0, #0x1f
    9a78:	54000508 	b.hi	9b18 <__sigtramp+0xb8>  // b.pmore
    9a7c:	f9428e82 	ldr	x2, [x20, #1304]
    9a80:	2a0003f3 	mov	w19, w0
    9a84:	b4000262 	cbz	x2, 9ad0 <__sigtramp+0x70>
    9a88:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    9a8c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    9a90:	b4000181 	cbz	x1, 9ac0 <__sigtramp+0x60>
    9a94:	b100043f 	cmn	x1, #0x1
    9a98:	540003c0 	b.eq	9b10 <__sigtramp+0xb0>  // b.none
    9a9c:	f100043f 	cmp	x1, #0x1
    9aa0:	54000300 	b.eq	9b00 <__sigtramp+0xa0>  // b.none
    9aa4:	f900005f 	str	xzr, [x2]
    9aa8:	2a1303e0 	mov	w0, w19
    9aac:	d63f0020 	blr	x1
    9ab0:	52800000 	mov	w0, #0x0                   	// #0
    9ab4:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ab8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9abc:	d65f03c0 	ret
    9ac0:	52800020 	mov	w0, #0x1                   	// #1
    9ac4:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ac8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9acc:	d65f03c0 	ret
    9ad0:	aa1403e0 	mov	x0, x20
    9ad4:	d2802001 	mov	x1, #0x100                 	// #256
    9ad8:	97fff962 	bl	8060 <_malloc_r>
    9adc:	f9028e80 	str	x0, [x20, #1304]
    9ae0:	aa0003e2 	mov	x2, x0
    9ae4:	b40001a0 	cbz	x0, 9b18 <__sigtramp+0xb8>
    9ae8:	aa0003e1 	mov	x1, x0
    9aec:	91040000 	add	x0, x0, #0x100
    9af0:	f800843f 	str	xzr, [x1], #8
    9af4:	eb00003f 	cmp	x1, x0
    9af8:	54ffffc1 	b.ne	9af0 <__sigtramp+0x90>  // b.any
    9afc:	17ffffe3 	b	9a88 <__sigtramp+0x28>
    9b00:	52800060 	mov	w0, #0x3                   	// #3
    9b04:	a94153f3 	ldp	x19, x20, [sp, #16]
    9b08:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9b0c:	d65f03c0 	ret
    9b10:	52800040 	mov	w0, #0x2                   	// #2
    9b14:	17ffffe8 	b	9ab4 <__sigtramp+0x54>
    9b18:	12800000 	mov	w0, #0xffffffff            	// #-1
    9b1c:	17ffffe6 	b	9ab4 <__sigtramp+0x54>

0000000000009b20 <_kill_r>:
    9b20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9b24:	910003fd 	mov	x29, sp
    9b28:	a90153f3 	stp	x19, x20, [sp, #16]
    9b2c:	90000034 	adrp	x20, d000 <impure_data+0x680>
    9b30:	aa0003f3 	mov	x19, x0
    9b34:	b90ec29f 	str	wzr, [x20, #3776]
    9b38:	2a0103e0 	mov	w0, w1
    9b3c:	2a0203e1 	mov	w1, w2
    9b40:	97ffe6d8 	bl	36a0 <_kill>
    9b44:	3100041f 	cmn	w0, #0x1
    9b48:	54000080 	b.eq	9b58 <_kill_r+0x38>  // b.none
    9b4c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9b50:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9b54:	d65f03c0 	ret
    9b58:	b94ec281 	ldr	w1, [x20, #3776]
    9b5c:	34ffff81 	cbz	w1, 9b4c <_kill_r+0x2c>
    9b60:	b9000261 	str	w1, [x19]
    9b64:	a94153f3 	ldp	x19, x20, [sp, #16]
    9b68:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9b6c:	d65f03c0 	ret

0000000000009b70 <_getpid_r>:
    9b70:	17ffe6d0 	b	36b0 <_getpid>
    9b74:	d503201f 	nop
    9b78:	d503201f 	nop
    9b7c:	d503201f 	nop

0000000000009b80 <__sread>:
    9b80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9b84:	93407c63 	sxtw	x3, w3
    9b88:	910003fd 	mov	x29, sp
    9b8c:	f9000bf3 	str	x19, [sp, #16]
    9b90:	aa0103f3 	mov	x19, x1
    9b94:	79c02421 	ldrsh	w1, [x1, #18]
    9b98:	9400058a 	bl	b1c0 <_read_r>
    9b9c:	b7f800e0 	tbnz	x0, #63, 9bb8 <__sread+0x38>
    9ba0:	f9404a61 	ldr	x1, [x19, #144]
    9ba4:	8b000021 	add	x1, x1, x0
    9ba8:	f9004a61 	str	x1, [x19, #144]
    9bac:	f9400bf3 	ldr	x19, [sp, #16]
    9bb0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9bb4:	d65f03c0 	ret
    9bb8:	79402261 	ldrh	w1, [x19, #16]
    9bbc:	12137821 	and	w1, w1, #0xffffefff
    9bc0:	79002261 	strh	w1, [x19, #16]
    9bc4:	f9400bf3 	ldr	x19, [sp, #16]
    9bc8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9bcc:	d65f03c0 	ret

0000000000009bd0 <__seofread>:
    9bd0:	52800000 	mov	w0, #0x0                   	// #0
    9bd4:	d65f03c0 	ret
    9bd8:	d503201f 	nop
    9bdc:	d503201f 	nop

0000000000009be0 <__swrite>:
    9be0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9be4:	910003fd 	mov	x29, sp
    9be8:	79c02024 	ldrsh	w4, [x1, #16]
    9bec:	a90153f3 	stp	x19, x20, [sp, #16]
    9bf0:	aa0103f3 	mov	x19, x1
    9bf4:	aa0003f4 	mov	x20, x0
    9bf8:	a9025bf5 	stp	x21, x22, [sp, #32]
    9bfc:	aa0203f5 	mov	x21, x2
    9c00:	2a0303f6 	mov	w22, w3
    9c04:	37400184 	tbnz	w4, #8, 9c34 <__swrite+0x54>
    9c08:	79c02661 	ldrsh	w1, [x19, #18]
    9c0c:	12137884 	and	w4, w4, #0xffffefff
    9c10:	79002264 	strh	w4, [x19, #16]
    9c14:	93407ec3 	sxtw	x3, w22
    9c18:	aa1503e2 	mov	x2, x21
    9c1c:	aa1403e0 	mov	x0, x20
    9c20:	94000448 	bl	ad40 <_write_r>
    9c24:	a94153f3 	ldp	x19, x20, [sp, #16]
    9c28:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9c2c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9c30:	d65f03c0 	ret
    9c34:	79c02421 	ldrsh	w1, [x1, #18]
    9c38:	52800043 	mov	w3, #0x2                   	// #2
    9c3c:	d2800002 	mov	x2, #0x0                   	// #0
    9c40:	94000548 	bl	b160 <_lseek_r>
    9c44:	79c02264 	ldrsh	w4, [x19, #16]
    9c48:	17fffff0 	b	9c08 <__swrite+0x28>
    9c4c:	d503201f 	nop

0000000000009c50 <__sseek>:
    9c50:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9c54:	910003fd 	mov	x29, sp
    9c58:	f9000bf3 	str	x19, [sp, #16]
    9c5c:	aa0103f3 	mov	x19, x1
    9c60:	79c02421 	ldrsh	w1, [x1, #18]
    9c64:	9400053f 	bl	b160 <_lseek_r>
    9c68:	79402261 	ldrh	w1, [x19, #16]
    9c6c:	b100041f 	cmn	x0, #0x1
    9c70:	540000e0 	b.eq	9c8c <__sseek+0x3c>  // b.none
    9c74:	32140021 	orr	w1, w1, #0x1000
    9c78:	79002261 	strh	w1, [x19, #16]
    9c7c:	f9004a60 	str	x0, [x19, #144]
    9c80:	f9400bf3 	ldr	x19, [sp, #16]
    9c84:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9c88:	d65f03c0 	ret
    9c8c:	12137821 	and	w1, w1, #0xffffefff
    9c90:	79002261 	strh	w1, [x19, #16]
    9c94:	f9400bf3 	ldr	x19, [sp, #16]
    9c98:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9c9c:	d65f03c0 	ret

0000000000009ca0 <__sclose>:
    9ca0:	79c02421 	ldrsh	w1, [x1, #18]
    9ca4:	1400043f 	b	ada0 <_close_r>
    9ca8:	d503201f 	nop
    9cac:	d503201f 	nop

0000000000009cb0 <strcasecmp>:
    9cb0:	f0000006 	adrp	x6, c000 <JIS_state_table+0x10>
    9cb4:	aa0003e8 	mov	x8, x0
    9cb8:	9100e4c6 	add	x6, x6, #0x39
    9cbc:	d2800003 	mov	x3, #0x0                   	// #0
    9cc0:	38636902 	ldrb	w2, [x8, x3]
    9cc4:	38636820 	ldrb	w0, [x1, x3]
    9cc8:	91000463 	add	x3, x3, #0x1
    9ccc:	92401c45 	and	x5, x2, #0xff
    9cd0:	11008047 	add	w7, w2, #0x20
    9cd4:	92401c04 	and	x4, x0, #0xff
    9cd8:	386568c5 	ldrb	w5, [x6, x5]
    9cdc:	386468c4 	ldrb	w4, [x6, x4]
    9ce0:	120004a5 	and	w5, w5, #0x3
    9ce4:	710004bf 	cmp	w5, #0x1
    9ce8:	12000484 	and	w4, w4, #0x3
    9cec:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    9cf0:	7100049f 	cmp	w4, #0x1
    9cf4:	540000a0 	b.eq	9d08 <strcasecmp+0x58>  // b.none
    9cf8:	6b000042 	subs	w2, w2, w0
    9cfc:	540000e1 	b.ne	9d18 <strcasecmp+0x68>  // b.any
    9d00:	35fffe00 	cbnz	w0, 9cc0 <strcasecmp+0x10>
    9d04:	d65f03c0 	ret
    9d08:	11008000 	add	w0, w0, #0x20
    9d0c:	6b000040 	subs	w0, w2, w0
    9d10:	54fffd80 	b.eq	9cc0 <strcasecmp+0x10>  // b.none
    9d14:	d65f03c0 	ret
    9d18:	2a0203e0 	mov	w0, w2
    9d1c:	d65f03c0 	ret

0000000000009d20 <strcat>:
    9d20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9d24:	910003fd 	mov	x29, sp
    9d28:	f9000bf3 	str	x19, [sp, #16]
    9d2c:	aa0003f3 	mov	x19, x0
    9d30:	f240081f 	tst	x0, #0x7
    9d34:	540001c1 	b.ne	9d6c <strcat+0x4c>  // b.any
    9d38:	f9400002 	ldr	x2, [x0]
    9d3c:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    9d40:	f29fdfe4 	movk	x4, #0xfeff
    9d44:	8b040043 	add	x3, x2, x4
    9d48:	8a220062 	bic	x2, x3, x2
    9d4c:	f201c05f 	tst	x2, #0x8080808080808080
    9d50:	540000e1 	b.ne	9d6c <strcat+0x4c>  // b.any
    9d54:	d503201f 	nop
    9d58:	f8408c02 	ldr	x2, [x0, #8]!
    9d5c:	8b040043 	add	x3, x2, x4
    9d60:	8a220062 	bic	x2, x3, x2
    9d64:	f201c05f 	tst	x2, #0x8080808080808080
    9d68:	54ffff80 	b.eq	9d58 <strcat+0x38>  // b.none
    9d6c:	39400002 	ldrb	w2, [x0]
    9d70:	34000082 	cbz	w2, 9d80 <strcat+0x60>
    9d74:	d503201f 	nop
    9d78:	38401c02 	ldrb	w2, [x0, #1]!
    9d7c:	35ffffe2 	cbnz	w2, 9d78 <strcat+0x58>
    9d80:	94000080 	bl	9f80 <strcpy>
    9d84:	aa1303e0 	mov	x0, x19
    9d88:	f9400bf3 	ldr	x19, [sp, #16]
    9d8c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9d90:	d65f03c0 	ret

0000000000009d94 <strchr>:
    9d94:	52808024 	mov	w4, #0x401                 	// #1025
    9d98:	72a80204 	movk	w4, #0x4010, lsl #16
    9d9c:	4e010c20 	dup	v0.16b, w1
    9da0:	927be802 	and	x2, x0, #0xffffffffffffffe0
    9da4:	4e040c90 	dup	v16.4s, w4
    9da8:	f2401003 	ands	x3, x0, #0x1f
    9dac:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    9db0:	540002a0 	b.eq	9e04 <strchr+0x70>  // b.none
    9db4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    9db8:	cb0303e3 	neg	x3, x3
    9dbc:	4e209823 	cmeq	v3.16b, v1.16b, #0
    9dc0:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    9dc4:	4e209844 	cmeq	v4.16b, v2.16b, #0
    9dc8:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    9dcc:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    9dd0:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    9dd4:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    9dd8:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    9ddc:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    9de0:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9de4:	d37ff863 	lsl	x3, x3, #1
    9de8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9dec:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    9df0:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9df4:	9ac324a3 	lsr	x3, x5, x3
    9df8:	4e083e25 	mov	x5, v17.d[0]
    9dfc:	8a2300a3 	bic	x3, x5, x3
    9e00:	b50002a3 	cbnz	x3, 9e54 <strchr+0xc0>
    9e04:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    9e08:	4e209823 	cmeq	v3.16b, v1.16b, #0
    9e0c:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    9e10:	4e209844 	cmeq	v4.16b, v2.16b, #0
    9e14:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    9e18:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    9e1c:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9e20:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    9e24:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    9e28:	4e083e23 	mov	x3, v17.d[0]
    9e2c:	b4fffec3 	cbz	x3, 9e04 <strchr+0x70>
    9e30:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    9e34:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    9e38:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    9e3c:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    9e40:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    9e44:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9e48:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9e4c:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9e50:	4e083e23 	mov	x3, v17.d[0]
    9e54:	dac00063 	rbit	x3, x3
    9e58:	d1008042 	sub	x2, x2, #0x20
    9e5c:	dac01063 	clz	x3, x3
    9e60:	f240007f 	tst	x3, #0x1
    9e64:	8b430440 	add	x0, x2, x3, lsr #1
    9e68:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    9e6c:	d65f03c0 	ret
    9e70:	d503201f 	nop
    9e74:	d503201f 	nop
    9e78:	d503201f 	nop
    9e7c:	d503201f 	nop

0000000000009e80 <strcmp>:
    9e80:	ca010007 	eor	x7, x0, x1
    9e84:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    9e88:	f24008ff 	tst	x7, #0x7
    9e8c:	540003e1 	b.ne	9f08 <strcmp+0x88>  // b.any
    9e90:	f2400807 	ands	x7, x0, #0x7
    9e94:	54000241 	b.ne	9edc <strcmp+0x5c>  // b.any
    9e98:	f8408402 	ldr	x2, [x0], #8
    9e9c:	f8408423 	ldr	x3, [x1], #8
    9ea0:	cb0a0047 	sub	x7, x2, x10
    9ea4:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    9ea8:	ca030045 	eor	x5, x2, x3
    9eac:	8a2800e4 	bic	x4, x7, x8
    9eb0:	aa0400a6 	orr	x6, x5, x4
    9eb4:	b4ffff26 	cbz	x6, 9e98 <strcmp+0x18>
    9eb8:	dac00cc6 	rev	x6, x6
    9ebc:	dac00c42 	rev	x2, x2
    9ec0:	dac010cb 	clz	x11, x6
    9ec4:	dac00c63 	rev	x3, x3
    9ec8:	9acb2042 	lsl	x2, x2, x11
    9ecc:	9acb2063 	lsl	x3, x3, x11
    9ed0:	d378fc42 	lsr	x2, x2, #56
    9ed4:	cb43e040 	sub	x0, x2, x3, lsr #56
    9ed8:	d65f03c0 	ret
    9edc:	927df000 	and	x0, x0, #0xfffffffffffffff8
    9ee0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    9ee4:	d37df0e7 	lsl	x7, x7, #3
    9ee8:	f8408402 	ldr	x2, [x0], #8
    9eec:	cb0703e7 	neg	x7, x7
    9ef0:	f8408423 	ldr	x3, [x1], #8
    9ef4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    9ef8:	9ac72508 	lsr	x8, x8, x7
    9efc:	aa080042 	orr	x2, x2, x8
    9f00:	aa080063 	orr	x3, x3, x8
    9f04:	17ffffe7 	b	9ea0 <strcmp+0x20>
    9f08:	f240081f 	tst	x0, #0x7
    9f0c:	54000100 	b.eq	9f2c <strcmp+0xac>  // b.none
    9f10:	38401402 	ldrb	w2, [x0], #1
    9f14:	38401423 	ldrb	w3, [x1], #1
    9f18:	7100045f 	cmp	w2, #0x1
    9f1c:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    9f20:	540001e1 	b.ne	9f5c <strcmp+0xdc>  // b.any
    9f24:	f240081f 	tst	x0, #0x7
    9f28:	54ffff41 	b.ne	9f10 <strcmp+0x90>  // b.any
    9f2c:	927d2027 	and	x7, x1, #0xff8
    9f30:	d27d20e7 	eor	x7, x7, #0xff8
    9f34:	b4fffee7 	cbz	x7, 9f10 <strcmp+0x90>
    9f38:	f8408402 	ldr	x2, [x0], #8
    9f3c:	f8408423 	ldr	x3, [x1], #8
    9f40:	cb0a0047 	sub	x7, x2, x10
    9f44:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    9f48:	ca030045 	eor	x5, x2, x3
    9f4c:	8a2800e4 	bic	x4, x7, x8
    9f50:	aa0400a6 	orr	x6, x5, x4
    9f54:	b4fffec6 	cbz	x6, 9f2c <strcmp+0xac>
    9f58:	17ffffd8 	b	9eb8 <strcmp+0x38>
    9f5c:	cb030040 	sub	x0, x2, x3
    9f60:	d65f03c0 	ret
    9f64:	d503201f 	nop
    9f68:	d503201f 	nop
    9f6c:	d503201f 	nop
    9f70:	d503201f 	nop
    9f74:	d503201f 	nop
    9f78:	d503201f 	nop
    9f7c:	d503201f 	nop

0000000000009f80 <strcpy>:
    9f80:	92402c29 	and	x9, x1, #0xfff
    9f84:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    9f88:	92400c31 	and	x17, x1, #0xf
    9f8c:	f13fc13f 	cmp	x9, #0xff0
    9f90:	cb1103e8 	neg	x8, x17
    9f94:	540008cc 	b.gt	a0ac <strcpy+0x12c>
    9f98:	a9401424 	ldp	x4, x5, [x1]
    9f9c:	cb0c0088 	sub	x8, x4, x12
    9fa0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9fa4:	ea290106 	bics	x6, x8, x9
    9fa8:	540001c1 	b.ne	9fe0 <strcpy+0x60>  // b.any
    9fac:	cb0c00aa 	sub	x10, x5, x12
    9fb0:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9fb4:	ea2b0147 	bics	x7, x10, x11
    9fb8:	54000440 	b.eq	a040 <strcpy+0xc0>  // b.none
    9fbc:	dac00ce7 	rev	x7, x7
    9fc0:	dac010ef 	clz	x15, x7
    9fc4:	d2800709 	mov	x9, #0x38                  	// #56
    9fc8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    9fcc:	cb0f012f 	sub	x15, x9, x15
    9fd0:	9acf20a5 	lsl	x5, x5, x15
    9fd4:	f8001065 	stur	x5, [x3, #1]
    9fd8:	f9000004 	str	x4, [x0]
    9fdc:	d65f03c0 	ret
    9fe0:	dac00cc6 	rev	x6, x6
    9fe4:	dac010cf 	clz	x15, x6
    9fe8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    9fec:	f10061e9 	subs	x9, x15, #0x18
    9ff0:	540000ab 	b.lt	a004 <strcpy+0x84>  // b.tstop
    9ff4:	9ac92485 	lsr	x5, x4, x9
    9ff8:	b81fd065 	stur	w5, [x3, #-3]
    9ffc:	b9000004 	str	w4, [x0]
    a000:	d65f03c0 	ret
    a004:	b400004f 	cbz	x15, a00c <strcpy+0x8c>
    a008:	79000004 	strh	w4, [x0]
    a00c:	3900007f 	strb	wzr, [x3]
    a010:	d65f03c0 	ret
    a014:	d503201f 	nop
    a018:	d503201f 	nop
    a01c:	d503201f 	nop
    a020:	d503201f 	nop
    a024:	d503201f 	nop
    a028:	d503201f 	nop
    a02c:	d503201f 	nop
    a030:	d503201f 	nop
    a034:	d503201f 	nop
    a038:	d503201f 	nop
    a03c:	d503201f 	nop
    a040:	d1004231 	sub	x17, x17, #0x10
    a044:	a9001404 	stp	x4, x5, [x0]
    a048:	cb110022 	sub	x2, x1, x17
    a04c:	cb110003 	sub	x3, x0, x17
    a050:	14000002 	b	a058 <strcpy+0xd8>
    a054:	a8811464 	stp	x4, x5, [x3], #16
    a058:	a8c11444 	ldp	x4, x5, [x2], #16
    a05c:	cb0c0088 	sub	x8, x4, x12
    a060:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a064:	cb0c00aa 	sub	x10, x5, x12
    a068:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a06c:	8a290106 	bic	x6, x8, x9
    a070:	ea2b0147 	bics	x7, x10, x11
    a074:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    a078:	54fffee0 	b.eq	a054 <strcpy+0xd4>  // b.none
    a07c:	f10000df 	cmp	x6, #0x0
    a080:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    a084:	dac00cc6 	rev	x6, x6
    a088:	dac010cf 	clz	x15, x6
    a08c:	910121e8 	add	x8, x15, #0x48
    a090:	910021ef 	add	x15, x15, #0x8
    a094:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    a098:	8b4f0c42 	add	x2, x2, x15, lsr #3
    a09c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    a0a0:	a97e1444 	ldp	x4, x5, [x2, #-32]
    a0a4:	a93f1464 	stp	x4, x5, [x3, #-16]
    a0a8:	d65f03c0 	ret
    a0ac:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    a0b0:	a9401444 	ldp	x4, x5, [x2]
    a0b4:	d37df108 	lsl	x8, x8, #3
    a0b8:	f2400a3f 	tst	x17, #0x7
    a0bc:	da9f03e9 	csetm	x9, ne  // ne = any
    a0c0:	9ac82529 	lsr	x9, x9, x8
    a0c4:	aa090084 	orr	x4, x4, x9
    a0c8:	aa0900ae 	orr	x14, x5, x9
    a0cc:	f100223f 	cmp	x17, #0x8
    a0d0:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    a0d4:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    a0d8:	cb0c0088 	sub	x8, x4, x12
    a0dc:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a0e0:	cb0c00aa 	sub	x10, x5, x12
    a0e4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a0e8:	8a290106 	bic	x6, x8, x9
    a0ec:	ea2b0147 	bics	x7, x10, x11
    a0f0:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    a0f4:	54fff520 	b.eq	9f98 <strcpy+0x18>  // b.none
    a0f8:	d37df228 	lsl	x8, x17, #3
    a0fc:	cb110fe9 	neg	x9, x17, lsl #3
    a100:	9ac8248d 	lsr	x13, x4, x8
    a104:	9ac920ab 	lsl	x11, x5, x9
    a108:	9ac824a5 	lsr	x5, x5, x8
    a10c:	aa0d016b 	orr	x11, x11, x13
    a110:	f100223f 	cmp	x17, #0x8
    a114:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    a118:	cb0c0088 	sub	x8, x4, x12
    a11c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a120:	cb0c00aa 	sub	x10, x5, x12
    a124:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a128:	8a290106 	bic	x6, x8, x9
    a12c:	b5fff5a6 	cbnz	x6, 9fe0 <strcpy+0x60>
    a130:	8a2b0147 	bic	x7, x10, x11
    a134:	17ffffa2 	b	9fbc <strcpy+0x3c>
    a138:	d503201f 	nop
    a13c:	d503201f 	nop

000000000000a140 <strlcpy>:
    a140:	aa0003e4 	mov	x4, x0
    a144:	aa0103e3 	mov	x3, x1
    a148:	b4000202 	cbz	x2, a188 <strlcpy+0x48>
    a14c:	f100045f 	cmp	x2, #0x1
    a150:	54000180 	b.eq	a180 <strlcpy+0x40>  // b.none
    a154:	8b020002 	add	x2, x0, x2
    a158:	14000003 	b	a164 <strlcpy+0x24>
    a15c:	ab02001f 	cmn	x0, x2
    a160:	54000100 	b.eq	a180 <strlcpy+0x40>  // b.none
    a164:	38401465 	ldrb	w5, [x3], #1
    a168:	38001485 	strb	w5, [x4], #1
    a16c:	aa2403e0 	mvn	x0, x4
    a170:	35ffff65 	cbnz	w5, a15c <strlcpy+0x1c>
    a174:	cb010060 	sub	x0, x3, x1
    a178:	d1000400 	sub	x0, x0, #0x1
    a17c:	d65f03c0 	ret
    a180:	3900009f 	strb	wzr, [x4]
    a184:	d503201f 	nop
    a188:	38401462 	ldrb	w2, [x3], #1
    a18c:	34ffff42 	cbz	w2, a174 <strlcpy+0x34>
    a190:	38401462 	ldrb	w2, [x3], #1
    a194:	35ffffa2 	cbnz	w2, a188 <strlcpy+0x48>
    a198:	17fffff7 	b	a174 <strlcpy+0x34>
    a19c:	d503201f 	nop
    a1a0:	d503201f 	nop
    a1a4:	d503201f 	nop
    a1a8:	d503201f 	nop
    a1ac:	d503201f 	nop
    a1b0:	d503201f 	nop
    a1b4:	d503201f 	nop
    a1b8:	d503201f 	nop
    a1bc:	d503201f 	nop

000000000000a1c0 <strlen>:
    a1c0:	92402c04 	and	x4, x0, #0xfff
    a1c4:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    a1c8:	f13fc09f 	cmp	x4, #0xff0
    a1cc:	5400082c 	b.gt	a2d0 <strlen+0x110>
    a1d0:	a9400c02 	ldp	x2, x3, [x0]
    a1d4:	cb080044 	sub	x4, x2, x8
    a1d8:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    a1dc:	cb080066 	sub	x6, x3, x8
    a1e0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    a1e4:	ea250084 	bics	x4, x4, x5
    a1e8:	8a2700c5 	bic	x5, x6, x7
    a1ec:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    a1f0:	54000100 	b.eq	a210 <strlen+0x50>  // b.none
    a1f4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    a1f8:	d2800100 	mov	x0, #0x8                   	// #8
    a1fc:	dac00c84 	rev	x4, x4
    a200:	dac01084 	clz	x4, x4
    a204:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    a208:	8b440c00 	add	x0, x0, x4, lsr #3
    a20c:	d65f03c0 	ret
    a210:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    a214:	d1004021 	sub	x1, x1, #0x10
    a218:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    a21c:	cb080044 	sub	x4, x2, x8
    a220:	cb080066 	sub	x6, x3, x8
    a224:	aa060085 	orr	x5, x4, x6
    a228:	ea081cbf 	tst	x5, x8, lsl #7
    a22c:	54000101 	b.ne	a24c <strlen+0x8c>  // b.any
    a230:	a9410c22 	ldp	x2, x3, [x1, #16]
    a234:	cb080044 	sub	x4, x2, x8
    a238:	cb080066 	sub	x6, x3, x8
    a23c:	aa060085 	orr	x5, x4, x6
    a240:	ea081cbf 	tst	x5, x8, lsl #7
    a244:	54fffea0 	b.eq	a218 <strlen+0x58>  // b.none
    a248:	91004021 	add	x1, x1, #0x10
    a24c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    a250:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    a254:	ea250084 	bics	x4, x4, x5
    a258:	8a2700c5 	bic	x5, x6, x7
    a25c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    a260:	54000120 	b.eq	a284 <strlen+0xc4>  // b.none
    a264:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    a268:	cb000020 	sub	x0, x1, x0
    a26c:	dac00c84 	rev	x4, x4
    a270:	91002005 	add	x5, x0, #0x8
    a274:	dac01084 	clz	x4, x4
    a278:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    a27c:	8b440c00 	add	x0, x0, x4, lsr #3
    a280:	d65f03c0 	ret
    a284:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    a288:	cb080044 	sub	x4, x2, x8
    a28c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    a290:	cb080066 	sub	x6, x3, x8
    a294:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    a298:	ea250084 	bics	x4, x4, x5
    a29c:	8a2700c5 	bic	x5, x6, x7
    a2a0:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    a2a4:	54fffe01 	b.ne	a264 <strlen+0xa4>  // b.any
    a2a8:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    a2ac:	cb080044 	sub	x4, x2, x8
    a2b0:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    a2b4:	cb080066 	sub	x6, x3, x8
    a2b8:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    a2bc:	ea250084 	bics	x4, x4, x5
    a2c0:	8a2700c5 	bic	x5, x6, x7
    a2c4:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    a2c8:	54fffde0 	b.eq	a284 <strlen+0xc4>  // b.none
    a2cc:	17ffffe6 	b	a264 <strlen+0xa4>
    a2d0:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    a2d4:	a9400c22 	ldp	x2, x3, [x1]
    a2d8:	d37df004 	lsl	x4, x0, #3
    a2dc:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    a2e0:	9ac420e4 	lsl	x4, x7, x4
    a2e4:	b201c084 	orr	x4, x4, #0x8080808080808080
    a2e8:	aa240042 	orn	x2, x2, x4
    a2ec:	aa240065 	orn	x5, x3, x4
    a2f0:	f27d001f 	tst	x0, #0x8
    a2f4:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    a2f8:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    a2fc:	17ffffc8 	b	a21c <strlen+0x5c>

000000000000a300 <strncasecmp>:
    a300:	aa0003e9 	mov	x9, x0
    a304:	b4000382 	cbz	x2, a374 <strncasecmp+0x74>
    a308:	d0000007 	adrp	x7, c000 <JIS_state_table+0x10>
    a30c:	d2800004 	mov	x4, #0x0                   	// #0
    a310:	9100e4e7 	add	x7, x7, #0x39
    a314:	14000006 	b	a32c <strncasecmp+0x2c>
    a318:	6b000063 	subs	w3, w3, w0
    a31c:	54000301 	b.ne	a37c <strncasecmp+0x7c>  // b.any
    a320:	34000280 	cbz	w0, a370 <strncasecmp+0x70>
    a324:	eb04005f 	cmp	x2, x4
    a328:	54000260 	b.eq	a374 <strncasecmp+0x74>  // b.none
    a32c:	38646923 	ldrb	w3, [x9, x4]
    a330:	38646820 	ldrb	w0, [x1, x4]
    a334:	91000484 	add	x4, x4, #0x1
    a338:	92401c66 	and	x6, x3, #0xff
    a33c:	11008068 	add	w8, w3, #0x20
    a340:	92401c05 	and	x5, x0, #0xff
    a344:	386668e6 	ldrb	w6, [x7, x6]
    a348:	386568e5 	ldrb	w5, [x7, x5]
    a34c:	120004c6 	and	w6, w6, #0x3
    a350:	710004df 	cmp	w6, #0x1
    a354:	120004a5 	and	w5, w5, #0x3
    a358:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    a35c:	710004bf 	cmp	w5, #0x1
    a360:	54fffdc1 	b.ne	a318 <strncasecmp+0x18>  // b.any
    a364:	11008000 	add	w0, w0, #0x20
    a368:	6b000060 	subs	w0, w3, w0
    a36c:	54fffdc0 	b.eq	a324 <strncasecmp+0x24>  // b.none
    a370:	d65f03c0 	ret
    a374:	52800000 	mov	w0, #0x0                   	// #0
    a378:	d65f03c0 	ret
    a37c:	2a0303e0 	mov	w0, w3
    a380:	d65f03c0 	ret
    a384:	d503201f 	nop
    a388:	d503201f 	nop
    a38c:	d503201f 	nop

000000000000a390 <strncpy>:
    a390:	aa000023 	orr	x3, x1, x0
    a394:	f240087f 	tst	x3, #0x7
    a398:	aa0003e3 	mov	x3, x0
    a39c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    a3a0:	540002c8 	b.hi	a3f8 <strncpy+0x68>  // b.pmore
    a3a4:	d1000445 	sub	x5, x2, #0x1
    a3a8:	d2800027 	mov	x7, #0x1                   	// #1
    a3ac:	8b050025 	add	x5, x1, x5
    a3b0:	14000007 	b	a3cc <strncpy+0x3c>
    a3b4:	386468a4 	ldrb	w4, [x5, x4]
    a3b8:	d1000446 	sub	x6, x2, #0x1
    a3bc:	38001424 	strb	w4, [x1], #1
    a3c0:	340000e4 	cbz	w4, a3dc <strncpy+0x4c>
    a3c4:	aa0103e3 	mov	x3, x1
    a3c8:	aa0603e2 	mov	x2, x6
    a3cc:	cb0200e4 	sub	x4, x7, x2
    a3d0:	aa0303e1 	mov	x1, x3
    a3d4:	b5ffff02 	cbnz	x2, a3b4 <strncpy+0x24>
    a3d8:	d65f03c0 	ret
    a3dc:	8b020062 	add	x2, x3, x2
    a3e0:	b4ffffc6 	cbz	x6, a3d8 <strncpy+0x48>
    a3e4:	d503201f 	nop
    a3e8:	3800143f 	strb	wzr, [x1], #1
    a3ec:	eb02003f 	cmp	x1, x2
    a3f0:	54ffffc1 	b.ne	a3e8 <strncpy+0x58>  // b.any
    a3f4:	d65f03c0 	ret
    a3f8:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    a3fc:	f29fdfe6 	movk	x6, #0xfeff
    a400:	f9400025 	ldr	x5, [x1]
    a404:	8b0600a4 	add	x4, x5, x6
    a408:	8a250084 	bic	x4, x4, x5
    a40c:	f201c09f 	tst	x4, #0x8080808080808080
    a410:	54fffca1 	b.ne	a3a4 <strncpy+0x14>  // b.any
    a414:	d1002042 	sub	x2, x2, #0x8
    a418:	f8008465 	str	x5, [x3], #8
    a41c:	91002021 	add	x1, x1, #0x8
    a420:	f1001c5f 	cmp	x2, #0x7
    a424:	54fffee8 	b.hi	a400 <strncpy+0x70>  // b.pmore
    a428:	17ffffdf 	b	a3a4 <strncpy+0x14>
    a42c:	d503201f 	nop

000000000000a430 <_strtol_l.part.0>:
    a430:	d0000007 	adrp	x7, c000 <JIS_state_table+0x10>
    a434:	aa0003ec 	mov	x12, x0
    a438:	aa0103e6 	mov	x6, x1
    a43c:	9100e4e7 	add	x7, x7, #0x39
    a440:	aa0603e8 	mov	x8, x6
    a444:	384014c4 	ldrb	w4, [x6], #1
    a448:	92401c85 	and	x5, x4, #0xff
    a44c:	386568e5 	ldrb	w5, [x7, x5]
    a450:	371fff85 	tbnz	w5, #3, a440 <_strtol_l.part.0+0x10>
    a454:	2a0403e5 	mov	w5, w4
    a458:	7100b49f 	cmp	w4, #0x2d
    a45c:	54000880 	b.eq	a56c <_strtol_l.part.0+0x13c>  // b.none
    a460:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    a464:	5280000d 	mov	w13, #0x0                   	// #0
    a468:	7100ac9f 	cmp	w4, #0x2b
    a46c:	540006a0 	b.eq	a540 <_strtol_l.part.0+0x110>  // b.none
    a470:	721b787f 	tst	w3, #0xffffffef
    a474:	54000121 	b.ne	a498 <_strtol_l.part.0+0x68>  // b.any
    a478:	7100c0bf 	cmp	w5, #0x30
    a47c:	54000820 	b.eq	a580 <_strtol_l.part.0+0x150>  // b.none
    a480:	350000c3 	cbnz	w3, a498 <_strtol_l.part.0+0x68>
    a484:	d280014a 	mov	x10, #0xa                   	// #10
    a488:	2a0a03e3 	mov	w3, w10
    a48c:	14000004 	b	a49c <_strtol_l.part.0+0x6c>
    a490:	34000903 	cbz	w3, a5b0 <_strtol_l.part.0+0x180>
    a494:	d503201f 	nop
    a498:	93407c6a 	sxtw	x10, w3
    a49c:	9aca0968 	udiv	x8, x11, x10
    a4a0:	52800007 	mov	w7, #0x0                   	// #0
    a4a4:	d2800000 	mov	x0, #0x0                   	// #0
    a4a8:	1b0aad09 	msub	w9, w8, w10, w11
    a4ac:	d503201f 	nop
    a4b0:	5100c0a4 	sub	w4, w5, #0x30
    a4b4:	7100249f 	cmp	w4, #0x9
    a4b8:	540000a9 	b.ls	a4cc <_strtol_l.part.0+0x9c>  // b.plast
    a4bc:	510104a4 	sub	w4, w5, #0x41
    a4c0:	7100649f 	cmp	w4, #0x19
    a4c4:	54000208 	b.hi	a504 <_strtol_l.part.0+0xd4>  // b.pmore
    a4c8:	5100dca4 	sub	w4, w5, #0x37
    a4cc:	6b04007f 	cmp	w3, w4
    a4d0:	5400028d 	b.le	a520 <_strtol_l.part.0+0xf0>
    a4d4:	710000ff 	cmp	w7, #0x0
    a4d8:	12800007 	mov	w7, #0xffffffff            	// #-1
    a4dc:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    a4e0:	540000e3 	b.cc	a4fc <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    a4e4:	eb00011f 	cmp	x8, x0
    a4e8:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    a4ec:	5400008b 	b.lt	a4fc <_strtol_l.part.0+0xcc>  // b.tstop
    a4f0:	93407c84 	sxtw	x4, w4
    a4f4:	52800027 	mov	w7, #0x1                   	// #1
    a4f8:	9b0a1000 	madd	x0, x0, x10, x4
    a4fc:	384014c5 	ldrb	w5, [x6], #1
    a500:	17ffffec 	b	a4b0 <_strtol_l.part.0+0x80>
    a504:	510184a4 	sub	w4, w5, #0x61
    a508:	7100649f 	cmp	w4, #0x19
    a50c:	540000a8 	b.hi	a520 <_strtol_l.part.0+0xf0>  // b.pmore
    a510:	51015ca4 	sub	w4, w5, #0x57
    a514:	6b04007f 	cmp	w3, w4
    a518:	54fffdec 	b.gt	a4d4 <_strtol_l.part.0+0xa4>
    a51c:	d503201f 	nop
    a520:	310004ff 	cmn	w7, #0x1
    a524:	54000140 	b.eq	a54c <_strtol_l.part.0+0x11c>  // b.none
    a528:	710001bf 	cmp	w13, #0x0
    a52c:	da800400 	cneg	x0, x0, ne  // ne = any
    a530:	b4000062 	cbz	x2, a53c <_strtol_l.part.0+0x10c>
    a534:	350003a7 	cbnz	w7, a5a8 <_strtol_l.part.0+0x178>
    a538:	f9000041 	str	x1, [x2]
    a53c:	d65f03c0 	ret
    a540:	394000c5 	ldrb	w5, [x6]
    a544:	91000906 	add	x6, x8, #0x2
    a548:	17ffffca 	b	a470 <_strtol_l.part.0+0x40>
    a54c:	52800440 	mov	w0, #0x22                  	// #34
    a550:	b9000180 	str	w0, [x12]
    a554:	aa0b03e0 	mov	x0, x11
    a558:	b4ffff22 	cbz	x2, a53c <_strtol_l.part.0+0x10c>
    a55c:	d10004c1 	sub	x1, x6, #0x1
    a560:	aa0b03e0 	mov	x0, x11
    a564:	f9000041 	str	x1, [x2]
    a568:	17fffff5 	b	a53c <_strtol_l.part.0+0x10c>
    a56c:	394000c5 	ldrb	w5, [x6]
    a570:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    a574:	91000906 	add	x6, x8, #0x2
    a578:	5280002d 	mov	w13, #0x1                   	// #1
    a57c:	17ffffbd 	b	a470 <_strtol_l.part.0+0x40>
    a580:	394000c0 	ldrb	w0, [x6]
    a584:	121a7800 	and	w0, w0, #0xffffffdf
    a588:	12001c00 	and	w0, w0, #0xff
    a58c:	7101601f 	cmp	w0, #0x58
    a590:	54fff801 	b.ne	a490 <_strtol_l.part.0+0x60>  // b.any
    a594:	394004c5 	ldrb	w5, [x6, #1]
    a598:	d280020a 	mov	x10, #0x10                  	// #16
    a59c:	910008c6 	add	x6, x6, #0x2
    a5a0:	2a0a03e3 	mov	w3, w10
    a5a4:	17ffffbe 	b	a49c <_strtol_l.part.0+0x6c>
    a5a8:	aa0003eb 	mov	x11, x0
    a5ac:	17ffffec 	b	a55c <_strtol_l.part.0+0x12c>
    a5b0:	d280010a 	mov	x10, #0x8                   	// #8
    a5b4:	2a0a03e3 	mov	w3, w10
    a5b8:	17ffffb9 	b	a49c <_strtol_l.part.0+0x6c>
    a5bc:	d503201f 	nop

000000000000a5c0 <_strtol_r>:
    a5c0:	7100907f 	cmp	w3, #0x24
    a5c4:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    a5c8:	54000040 	b.eq	a5d0 <_strtol_r+0x10>  // b.none
    a5cc:	17ffff99 	b	a430 <_strtol_l.part.0>
    a5d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a5d4:	910003fd 	mov	x29, sp
    a5d8:	9400020a 	bl	ae00 <__errno>
    a5dc:	528002c1 	mov	w1, #0x16                  	// #22
    a5e0:	b9000001 	str	w1, [x0]
    a5e4:	d2800000 	mov	x0, #0x0                   	// #0
    a5e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a5ec:	d65f03c0 	ret

000000000000a5f0 <strtol_l>:
    a5f0:	7100905f 	cmp	w2, #0x24
    a5f4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    a5f8:	540000e0 	b.eq	a614 <strtol_l+0x24>  // b.none
    a5fc:	d0000004 	adrp	x4, c000 <JIS_state_table+0x10>
    a600:	2a0203e3 	mov	w3, w2
    a604:	aa0103e2 	mov	x2, x1
    a608:	aa0003e1 	mov	x1, x0
    a60c:	f944bc80 	ldr	x0, [x4, #2424]
    a610:	17ffff88 	b	a430 <_strtol_l.part.0>
    a614:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a618:	910003fd 	mov	x29, sp
    a61c:	940001f9 	bl	ae00 <__errno>
    a620:	528002c1 	mov	w1, #0x16                  	// #22
    a624:	b9000001 	str	w1, [x0]
    a628:	d2800000 	mov	x0, #0x0                   	// #0
    a62c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a630:	d65f03c0 	ret
    a634:	d503201f 	nop
    a638:	d503201f 	nop
    a63c:	d503201f 	nop

000000000000a640 <strtol>:
    a640:	7100905f 	cmp	w2, #0x24
    a644:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    a648:	540000e0 	b.eq	a664 <strtol+0x24>  // b.none
    a64c:	d0000004 	adrp	x4, c000 <JIS_state_table+0x10>
    a650:	2a0203e3 	mov	w3, w2
    a654:	aa0103e2 	mov	x2, x1
    a658:	aa0003e1 	mov	x1, x0
    a65c:	f944bc80 	ldr	x0, [x4, #2424]
    a660:	17ffff74 	b	a430 <_strtol_l.part.0>
    a664:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a668:	910003fd 	mov	x29, sp
    a66c:	940001e5 	bl	ae00 <__errno>
    a670:	528002c1 	mov	w1, #0x16                  	// #22
    a674:	b9000001 	str	w1, [x0]
    a678:	d2800000 	mov	x0, #0x0                   	// #0
    a67c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a680:	d65f03c0 	ret
    a684:	d503201f 	nop
    a688:	d503201f 	nop
    a68c:	d503201f 	nop

000000000000a690 <__swbuf_r>:
    a690:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a694:	910003fd 	mov	x29, sp
    a698:	a90153f3 	stp	x19, x20, [sp, #16]
    a69c:	2a0103f4 	mov	w20, w1
    a6a0:	aa0203f3 	mov	x19, x2
    a6a4:	a9025bf5 	stp	x21, x22, [sp, #32]
    a6a8:	aa0003f5 	mov	x21, x0
    a6ac:	b4000060 	cbz	x0, a6b8 <__swbuf_r+0x28>
    a6b0:	b9405001 	ldr	w1, [x0, #80]
    a6b4:	340007e1 	cbz	w1, a7b0 <__swbuf_r+0x120>
    a6b8:	79c02260 	ldrsh	w0, [x19, #16]
    a6bc:	b9402a61 	ldr	w1, [x19, #40]
    a6c0:	b9000e61 	str	w1, [x19, #12]
    a6c4:	12003c02 	and	w2, w0, #0xffff
    a6c8:	361803e0 	tbz	w0, #3, a744 <__swbuf_r+0xb4>
    a6cc:	f9400e61 	ldr	x1, [x19, #24]
    a6d0:	b40003a1 	cbz	x1, a744 <__swbuf_r+0xb4>
    a6d4:	12001e96 	and	w22, w20, #0xff
    a6d8:	12001e94 	and	w20, w20, #0xff
    a6dc:	36680482 	tbz	w2, #13, a76c <__swbuf_r+0xdc>
    a6e0:	f9400260 	ldr	x0, [x19]
    a6e4:	b9402262 	ldr	w2, [x19, #32]
    a6e8:	cb010001 	sub	x1, x0, x1
    a6ec:	6b01005f 	cmp	w2, w1
    a6f0:	5400052d 	b.le	a794 <__swbuf_r+0x104>
    a6f4:	11000421 	add	w1, w1, #0x1
    a6f8:	b9400e62 	ldr	w2, [x19, #12]
    a6fc:	91000403 	add	x3, x0, #0x1
    a700:	f9000263 	str	x3, [x19]
    a704:	51000442 	sub	w2, w2, #0x1
    a708:	b9000e62 	str	w2, [x19, #12]
    a70c:	39000016 	strb	w22, [x0]
    a710:	b9402260 	ldr	w0, [x19, #32]
    a714:	6b01001f 	cmp	w0, w1
    a718:	54000500 	b.eq	a7b8 <__swbuf_r+0x128>  // b.none
    a71c:	71002a9f 	cmp	w20, #0xa
    a720:	79402260 	ldrh	w0, [x19, #16]
    a724:	1a9f17e1 	cset	w1, eq  // eq = none
    a728:	6a00003f 	tst	w1, w0
    a72c:	54000461 	b.ne	a7b8 <__swbuf_r+0x128>  // b.any
    a730:	2a1403e0 	mov	w0, w20
    a734:	a94153f3 	ldp	x19, x20, [sp, #16]
    a738:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a73c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a740:	d65f03c0 	ret
    a744:	aa1303e1 	mov	x1, x19
    a748:	aa1503e0 	mov	x0, x21
    a74c:	97ffed3d 	bl	5c40 <__swsetup_r>
    a750:	350003c0 	cbnz	w0, a7c8 <__swbuf_r+0x138>
    a754:	79c02260 	ldrsh	w0, [x19, #16]
    a758:	12001e96 	and	w22, w20, #0xff
    a75c:	12001e94 	and	w20, w20, #0xff
    a760:	12003c02 	and	w2, w0, #0xffff
    a764:	f9400e61 	ldr	x1, [x19, #24]
    a768:	376ffbc2 	tbnz	w2, #13, a6e0 <__swbuf_r+0x50>
    a76c:	b940ae62 	ldr	w2, [x19, #172]
    a770:	32130000 	orr	w0, w0, #0x2000
    a774:	79002260 	strh	w0, [x19, #16]
    a778:	12127840 	and	w0, w2, #0xffffdfff
    a77c:	b900ae60 	str	w0, [x19, #172]
    a780:	f9400260 	ldr	x0, [x19]
    a784:	b9402262 	ldr	w2, [x19, #32]
    a788:	cb010001 	sub	x1, x0, x1
    a78c:	6b01005f 	cmp	w2, w1
    a790:	54fffb2c 	b.gt	a6f4 <__swbuf_r+0x64>
    a794:	aa1303e1 	mov	x1, x19
    a798:	aa1503e0 	mov	x0, x21
    a79c:	97ffee39 	bl	6080 <_fflush_r>
    a7a0:	35000140 	cbnz	w0, a7c8 <__swbuf_r+0x138>
    a7a4:	52800021 	mov	w1, #0x1                   	// #1
    a7a8:	f9400260 	ldr	x0, [x19]
    a7ac:	17ffffd3 	b	a6f8 <__swbuf_r+0x68>
    a7b0:	97ffef34 	bl	6480 <__sinit>
    a7b4:	17ffffc1 	b	a6b8 <__swbuf_r+0x28>
    a7b8:	aa1303e1 	mov	x1, x19
    a7bc:	aa1503e0 	mov	x0, x21
    a7c0:	97ffee30 	bl	6080 <_fflush_r>
    a7c4:	34fffb60 	cbz	w0, a730 <__swbuf_r+0xa0>
    a7c8:	12800014 	mov	w20, #0xffffffff            	// #-1
    a7cc:	17ffffd9 	b	a730 <__swbuf_r+0xa0>

000000000000a7d0 <__swbuf>:
    a7d0:	d0000003 	adrp	x3, c000 <JIS_state_table+0x10>
    a7d4:	aa0103e2 	mov	x2, x1
    a7d8:	2a0003e1 	mov	w1, w0
    a7dc:	f944bc60 	ldr	x0, [x3, #2424]
    a7e0:	17ffffac 	b	a690 <__swbuf_r>
    a7e4:	d503201f 	nop
    a7e8:	d503201f 	nop
    a7ec:	d503201f 	nop

000000000000a7f0 <_wcsnrtombs_l>:
    a7f0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    a7f4:	f10000bf 	cmp	x5, #0x0
    a7f8:	910003fd 	mov	x29, sp
    a7fc:	a90153f3 	stp	x19, x20, [sp, #16]
    a800:	aa0003f3 	mov	x19, x0
    a804:	91057000 	add	x0, x0, #0x15c
    a808:	a9025bf5 	stp	x21, x22, [sp, #32]
    a80c:	aa0103f4 	mov	x20, x1
    a810:	aa0203f5 	mov	x21, x2
    a814:	a90363f7 	stp	x23, x24, [sp, #48]
    a818:	aa0603f6 	mov	x22, x6
    a81c:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    a820:	a9046bf9 	stp	x25, x26, [sp, #64]
    a824:	a90573fb 	stp	x27, x28, [sp, #80]
    a828:	f940005c 	ldr	x28, [x2]
    a82c:	b4000901 	cbz	x1, a94c <_wcsnrtombs_l+0x15c>
    a830:	aa0403fa 	mov	x26, x4
    a834:	b4000a84 	cbz	x4, a984 <_wcsnrtombs_l+0x194>
    a838:	d1000478 	sub	x24, x3, #0x1
    a83c:	b4000a43 	cbz	x3, a984 <_wcsnrtombs_l+0x194>
    a840:	d280001b 	mov	x27, #0x0                   	// #0
    a844:	f90037f4 	str	x20, [sp, #104]
    a848:	1400000a 	b	a870 <_wcsnrtombs_l+0x80>
    a84c:	b50003d4 	cbnz	x20, a8c4 <_wcsnrtombs_l+0xd4>
    a850:	b8404780 	ldr	w0, [x28], #4
    a854:	34000640 	cbz	w0, a91c <_wcsnrtombs_l+0x12c>
    a858:	eb1a011f 	cmp	x8, x26
    a85c:	54000982 	b.cs	a98c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    a860:	d1000718 	sub	x24, x24, #0x1
    a864:	aa0803fb 	mov	x27, x8
    a868:	b100071f 	cmn	x24, #0x1
    a86c:	540001c0 	b.eq	a8a4 <_wcsnrtombs_l+0xb4>  // b.none
    a870:	b9400382 	ldr	w2, [x28]
    a874:	aa1703e3 	mov	x3, x23
    a878:	f94072c4 	ldr	x4, [x22, #224]
    a87c:	9101c3e1 	add	x1, sp, #0x70
    a880:	aa1303e0 	mov	x0, x19
    a884:	f94002f9 	ldr	x25, [x23]
    a888:	d63f0080 	blr	x4
    a88c:	3100041f 	cmn	w0, #0x1
    a890:	54000620 	b.eq	a954 <_wcsnrtombs_l+0x164>  // b.none
    a894:	8b20c368 	add	x8, x27, w0, sxtw
    a898:	eb1a011f 	cmp	x8, x26
    a89c:	54fffd89 	b.ls	a84c <_wcsnrtombs_l+0x5c>  // b.plast
    a8a0:	f90002f9 	str	x25, [x23]
    a8a4:	aa1b03e0 	mov	x0, x27
    a8a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a8b0:	a94363f7 	ldp	x23, x24, [sp, #48]
    a8b4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a8b8:	a94573fb 	ldp	x27, x28, [sp, #80]
    a8bc:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a8c0:	d65f03c0 	ret
    a8c4:	7100001f 	cmp	w0, #0x0
    a8c8:	5400020d 	b.le	a908 <_wcsnrtombs_l+0x118>
    a8cc:	f94037e1 	ldr	x1, [sp, #104]
    a8d0:	11000402 	add	w2, w0, #0x1
    a8d4:	d2800027 	mov	x7, #0x1                   	// #1
    a8d8:	d1000421 	sub	x1, x1, #0x1
    a8dc:	d503201f 	nop
    a8e0:	9101c3e3 	add	x3, sp, #0x70
    a8e4:	8b070069 	add	x9, x3, x7
    a8e8:	385ff129 	ldurb	w9, [x9, #-1]
    a8ec:	38276829 	strb	w9, [x1, x7]
    a8f0:	910004e7 	add	x7, x7, #0x1
    a8f4:	eb0200ff 	cmp	x7, x2
    a8f8:	54ffff41 	b.ne	a8e0 <_wcsnrtombs_l+0xf0>  // b.any
    a8fc:	f94037e1 	ldr	x1, [sp, #104]
    a900:	8b204020 	add	x0, x1, w0, uxtw
    a904:	f90037e0 	str	x0, [sp, #104]
    a908:	f94002a0 	ldr	x0, [x21]
    a90c:	91001000 	add	x0, x0, #0x4
    a910:	f90002a0 	str	x0, [x21]
    a914:	b8404780 	ldr	w0, [x28], #4
    a918:	35fffa00 	cbnz	w0, a858 <_wcsnrtombs_l+0x68>
    a91c:	b4000054 	cbz	x20, a924 <_wcsnrtombs_l+0x134>
    a920:	f90002bf 	str	xzr, [x21]
    a924:	b90002ff 	str	wzr, [x23]
    a928:	d100051b 	sub	x27, x8, #0x1
    a92c:	aa1b03e0 	mov	x0, x27
    a930:	a94153f3 	ldp	x19, x20, [sp, #16]
    a934:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a938:	a94363f7 	ldp	x23, x24, [sp, #48]
    a93c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a940:	a94573fb 	ldp	x27, x28, [sp, #80]
    a944:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a948:	d65f03c0 	ret
    a94c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    a950:	17ffffba 	b	a838 <_wcsnrtombs_l+0x48>
    a954:	52801140 	mov	w0, #0x8a                  	// #138
    a958:	b9000260 	str	w0, [x19]
    a95c:	b90002ff 	str	wzr, [x23]
    a960:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    a964:	aa1b03e0 	mov	x0, x27
    a968:	a94153f3 	ldp	x19, x20, [sp, #16]
    a96c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a970:	a94363f7 	ldp	x23, x24, [sp, #48]
    a974:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a978:	a94573fb 	ldp	x27, x28, [sp, #80]
    a97c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a980:	d65f03c0 	ret
    a984:	d280001b 	mov	x27, #0x0                   	// #0
    a988:	17ffffc7 	b	a8a4 <_wcsnrtombs_l+0xb4>
    a98c:	aa0803fb 	mov	x27, x8
    a990:	17ffffc5 	b	a8a4 <_wcsnrtombs_l+0xb4>
    a994:	d503201f 	nop
    a998:	d503201f 	nop
    a99c:	d503201f 	nop

000000000000a9a0 <_wcsnrtombs_r>:
    a9a0:	d0000000 	adrp	x0, c000 <JIS_state_table+0x10>
    a9a4:	f0000006 	adrp	x6, d000 <impure_data+0x680>
    a9a8:	9103a0c6 	add	x6, x6, #0xe8
    a9ac:	f944bc00 	ldr	x0, [x0, #2424]
    a9b0:	17ffff90 	b	a7f0 <_wcsnrtombs_l>
    a9b4:	d503201f 	nop
    a9b8:	d503201f 	nop
    a9bc:	d503201f 	nop

000000000000a9c0 <wcsnrtombs>:
    a9c0:	d0000006 	adrp	x6, c000 <JIS_state_table+0x10>
    a9c4:	aa0003e8 	mov	x8, x0
    a9c8:	aa0103e7 	mov	x7, x1
    a9cc:	aa0203e5 	mov	x5, x2
    a9d0:	f944bcc0 	ldr	x0, [x6, #2424]
    a9d4:	aa0303e6 	mov	x6, x3
    a9d8:	aa0803e1 	mov	x1, x8
    a9dc:	aa0503e3 	mov	x3, x5
    a9e0:	aa0703e2 	mov	x2, x7
    a9e4:	aa0403e5 	mov	x5, x4
    a9e8:	aa0603e4 	mov	x4, x6
    a9ec:	f0000006 	adrp	x6, d000 <impure_data+0x680>
    a9f0:	9103a0c6 	add	x6, x6, #0xe8
    a9f4:	17ffff7f 	b	a7f0 <_wcsnrtombs_l>
    a9f8:	d503201f 	nop
    a9fc:	d503201f 	nop

000000000000aa00 <_wctomb_r>:
    aa00:	f0000004 	adrp	x4, d000 <impure_data+0x680>
    aa04:	f940e484 	ldr	x4, [x4, #456]
    aa08:	aa0403f0 	mov	x16, x4
    aa0c:	d61f0200 	br	x16

000000000000aa10 <__ascii_wctomb>:
    aa10:	aa0003e3 	mov	x3, x0
    aa14:	b4000141 	cbz	x1, aa3c <__ascii_wctomb+0x2c>
    aa18:	7103fc5f 	cmp	w2, #0xff
    aa1c:	54000088 	b.hi	aa2c <__ascii_wctomb+0x1c>  // b.pmore
    aa20:	52800020 	mov	w0, #0x1                   	// #1
    aa24:	39000022 	strb	w2, [x1]
    aa28:	d65f03c0 	ret
    aa2c:	52801141 	mov	w1, #0x8a                  	// #138
    aa30:	12800000 	mov	w0, #0xffffffff            	// #-1
    aa34:	b9000061 	str	w1, [x3]
    aa38:	d65f03c0 	ret
    aa3c:	52800000 	mov	w0, #0x0                   	// #0
    aa40:	d65f03c0 	ret
    aa44:	d503201f 	nop
    aa48:	d503201f 	nop
    aa4c:	d503201f 	nop

000000000000aa50 <__utf8_wctomb>:
    aa50:	aa0003e3 	mov	x3, x0
    aa54:	b40004e1 	cbz	x1, aaf0 <__utf8_wctomb+0xa0>
    aa58:	7101fc5f 	cmp	w2, #0x7f
    aa5c:	54000349 	b.ls	aac4 <__utf8_wctomb+0x74>  // b.plast
    aa60:	51020040 	sub	w0, w2, #0x80
    aa64:	711dfc1f 	cmp	w0, #0x77f
    aa68:	54000349 	b.ls	aad0 <__utf8_wctomb+0x80>  // b.plast
    aa6c:	51200044 	sub	w4, w2, #0x800
    aa70:	529effe0 	mov	w0, #0xf7ff                	// #63487
    aa74:	6b00009f 	cmp	w4, w0
    aa78:	54000409 	b.ls	aaf8 <__utf8_wctomb+0xa8>  // b.plast
    aa7c:	51404044 	sub	w4, w2, #0x10, lsl #12
    aa80:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    aa84:	6b00009f 	cmp	w4, w0
    aa88:	540004e8 	b.hi	ab24 <__utf8_wctomb+0xd4>  // b.pmore
    aa8c:	53127c45 	lsr	w5, w2, #18
    aa90:	d34c4444 	ubfx	x4, x2, #12, #6
    aa94:	d3462c43 	ubfx	x3, x2, #6, #6
    aa98:	12001442 	and	w2, w2, #0x3f
    aa9c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    aaa0:	32196084 	orr	w4, w4, #0xffffff80
    aaa4:	32196063 	orr	w3, w3, #0xffffff80
    aaa8:	32196042 	orr	w2, w2, #0xffffff80
    aaac:	52800080 	mov	w0, #0x4                   	// #4
    aab0:	39000025 	strb	w5, [x1]
    aab4:	39000424 	strb	w4, [x1, #1]
    aab8:	39000823 	strb	w3, [x1, #2]
    aabc:	39000c22 	strb	w2, [x1, #3]
    aac0:	d65f03c0 	ret
    aac4:	52800020 	mov	w0, #0x1                   	// #1
    aac8:	39000022 	strb	w2, [x1]
    aacc:	d65f03c0 	ret
    aad0:	53067c43 	lsr	w3, w2, #6
    aad4:	12001442 	and	w2, w2, #0x3f
    aad8:	321a6463 	orr	w3, w3, #0xffffffc0
    aadc:	32196042 	orr	w2, w2, #0xffffff80
    aae0:	52800040 	mov	w0, #0x2                   	// #2
    aae4:	39000023 	strb	w3, [x1]
    aae8:	39000422 	strb	w2, [x1, #1]
    aaec:	d65f03c0 	ret
    aaf0:	52800000 	mov	w0, #0x0                   	// #0
    aaf4:	d65f03c0 	ret
    aaf8:	530c7c44 	lsr	w4, w2, #12
    aafc:	d3462c43 	ubfx	x3, x2, #6, #6
    ab00:	12001442 	and	w2, w2, #0x3f
    ab04:	321b6884 	orr	w4, w4, #0xffffffe0
    ab08:	32196063 	orr	w3, w3, #0xffffff80
    ab0c:	32196042 	orr	w2, w2, #0xffffff80
    ab10:	52800060 	mov	w0, #0x3                   	// #3
    ab14:	39000024 	strb	w4, [x1]
    ab18:	39000423 	strb	w3, [x1, #1]
    ab1c:	39000822 	strb	w2, [x1, #2]
    ab20:	d65f03c0 	ret
    ab24:	52801141 	mov	w1, #0x8a                  	// #138
    ab28:	12800000 	mov	w0, #0xffffffff            	// #-1
    ab2c:	b9000061 	str	w1, [x3]
    ab30:	d65f03c0 	ret
    ab34:	d503201f 	nop
    ab38:	d503201f 	nop
    ab3c:	d503201f 	nop

000000000000ab40 <__sjis_wctomb>:
    ab40:	aa0003e5 	mov	x5, x0
    ab44:	12001c44 	and	w4, w2, #0xff
    ab48:	d3483c43 	ubfx	x3, x2, #8, #8
    ab4c:	b4000301 	cbz	x1, abac <__sjis_wctomb+0x6c>
    ab50:	34000283 	cbz	w3, aba0 <__sjis_wctomb+0x60>
    ab54:	1101fc60 	add	w0, w3, #0x7f
    ab58:	11008063 	add	w3, w3, #0x20
    ab5c:	12001c00 	and	w0, w0, #0xff
    ab60:	12001c63 	and	w3, w3, #0xff
    ab64:	7100781f 	cmp	w0, #0x1e
    ab68:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    ab6c:	54000248 	b.hi	abb4 <__sjis_wctomb+0x74>  // b.pmore
    ab70:	51010080 	sub	w0, w4, #0x40
    ab74:	51020084 	sub	w4, w4, #0x80
    ab78:	12001c00 	and	w0, w0, #0xff
    ab7c:	12001c84 	and	w4, w4, #0xff
    ab80:	7100f81f 	cmp	w0, #0x3e
    ab84:	52800f80 	mov	w0, #0x7c                  	// #124
    ab88:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    ab8c:	54000148 	b.hi	abb4 <__sjis_wctomb+0x74>  // b.pmore
    ab90:	5ac00442 	rev16	w2, w2
    ab94:	52800040 	mov	w0, #0x2                   	// #2
    ab98:	79000022 	strh	w2, [x1]
    ab9c:	d65f03c0 	ret
    aba0:	52800020 	mov	w0, #0x1                   	// #1
    aba4:	39000024 	strb	w4, [x1]
    aba8:	d65f03c0 	ret
    abac:	52800000 	mov	w0, #0x0                   	// #0
    abb0:	d65f03c0 	ret
    abb4:	52801141 	mov	w1, #0x8a                  	// #138
    abb8:	12800000 	mov	w0, #0xffffffff            	// #-1
    abbc:	b90000a1 	str	w1, [x5]
    abc0:	d65f03c0 	ret
    abc4:	d503201f 	nop
    abc8:	d503201f 	nop
    abcc:	d503201f 	nop

000000000000abd0 <__eucjp_wctomb>:
    abd0:	aa0003e4 	mov	x4, x0
    abd4:	12001c43 	and	w3, w2, #0xff
    abd8:	d3483c45 	ubfx	x5, x2, #8, #8
    abdc:	b4000421 	cbz	x1, ac60 <__eucjp_wctomb+0x90>
    abe0:	34000185 	cbz	w5, ac10 <__eucjp_wctomb+0x40>
    abe4:	11017ca0 	add	w0, w5, #0x5f
    abe8:	1101c8a6 	add	w6, w5, #0x72
    abec:	12001c00 	and	w0, w0, #0xff
    abf0:	12001cc6 	and	w6, w6, #0xff
    abf4:	7101741f 	cmp	w0, #0x5d
    abf8:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    abfc:	54000109 	b.ls	ac1c <__eucjp_wctomb+0x4c>  // b.plast
    ac00:	52801141 	mov	w1, #0x8a                  	// #138
    ac04:	12800000 	mov	w0, #0xffffffff            	// #-1
    ac08:	b9000081 	str	w1, [x4]
    ac0c:	d65f03c0 	ret
    ac10:	52800020 	mov	w0, #0x1                   	// #1
    ac14:	39000023 	strb	w3, [x1]
    ac18:	d65f03c0 	ret
    ac1c:	11017c66 	add	w6, w3, #0x5f
    ac20:	12001cc6 	and	w6, w6, #0xff
    ac24:	710174df 	cmp	w6, #0x5d
    ac28:	54000209 	b.ls	ac68 <__eucjp_wctomb+0x98>  // b.plast
    ac2c:	7101741f 	cmp	w0, #0x5d
    ac30:	54fffe88 	b.hi	ac00 <__eucjp_wctomb+0x30>  // b.pmore
    ac34:	32190063 	orr	w3, w3, #0x80
    ac38:	11017c60 	add	w0, w3, #0x5f
    ac3c:	12001c00 	and	w0, w0, #0xff
    ac40:	7101741f 	cmp	w0, #0x5d
    ac44:	54fffde8 	b.hi	ac00 <__eucjp_wctomb+0x30>  // b.pmore
    ac48:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    ac4c:	52800060 	mov	w0, #0x3                   	// #3
    ac50:	39000022 	strb	w2, [x1]
    ac54:	39000425 	strb	w5, [x1, #1]
    ac58:	39000823 	strb	w3, [x1, #2]
    ac5c:	d65f03c0 	ret
    ac60:	52800000 	mov	w0, #0x0                   	// #0
    ac64:	d65f03c0 	ret
    ac68:	5ac00442 	rev16	w2, w2
    ac6c:	52800040 	mov	w0, #0x2                   	// #2
    ac70:	79000022 	strh	w2, [x1]
    ac74:	d65f03c0 	ret
    ac78:	d503201f 	nop
    ac7c:	d503201f 	nop

000000000000ac80 <__jis_wctomb>:
    ac80:	aa0003e6 	mov	x6, x0
    ac84:	12001c45 	and	w5, w2, #0xff
    ac88:	d3483c44 	ubfx	x4, x2, #8, #8
    ac8c:	b40004c1 	cbz	x1, ad24 <__jis_wctomb+0xa4>
    ac90:	34000304 	cbz	w4, acf0 <__jis_wctomb+0x70>
    ac94:	51008484 	sub	w4, w4, #0x21
    ac98:	12001c84 	and	w4, w4, #0xff
    ac9c:	7101749f 	cmp	w4, #0x5d
    aca0:	54000468 	b.hi	ad2c <__jis_wctomb+0xac>  // b.pmore
    aca4:	510084a5 	sub	w5, w5, #0x21
    aca8:	12001ca5 	and	w5, w5, #0xff
    acac:	710174bf 	cmp	w5, #0x5d
    acb0:	540003e8 	b.hi	ad2c <__jis_wctomb+0xac>  // b.pmore
    acb4:	b9400064 	ldr	w4, [x3]
    acb8:	52800040 	mov	w0, #0x2                   	// #2
    acbc:	35000144 	cbnz	w4, ace4 <__jis_wctomb+0x64>
    acc0:	aa0103e4 	mov	x4, x1
    acc4:	52800020 	mov	w0, #0x1                   	// #1
    acc8:	b9000060 	str	w0, [x3]
    accc:	52848365 	mov	w5, #0x241b                	// #9243
    acd0:	52800843 	mov	w3, #0x42                  	// #66
    acd4:	528000a0 	mov	w0, #0x5                   	// #5
    acd8:	78003485 	strh	w5, [x4], #3
    acdc:	39000823 	strb	w3, [x1, #2]
    ace0:	aa0403e1 	mov	x1, x4
    ace4:	5ac00442 	rev16	w2, w2
    ace8:	79000022 	strh	w2, [x1]
    acec:	d65f03c0 	ret
    acf0:	b9400062 	ldr	w2, [x3]
    acf4:	52800020 	mov	w0, #0x1                   	// #1
    acf8:	34000122 	cbz	w2, ad1c <__jis_wctomb+0x9c>
    acfc:	aa0103e2 	mov	x2, x1
    ad00:	b900007f 	str	wzr, [x3]
    ad04:	52850364 	mov	w4, #0x281b                	// #10267
    ad08:	52800843 	mov	w3, #0x42                  	// #66
    ad0c:	52800080 	mov	w0, #0x4                   	// #4
    ad10:	78003444 	strh	w4, [x2], #3
    ad14:	39000823 	strb	w3, [x1, #2]
    ad18:	aa0203e1 	mov	x1, x2
    ad1c:	39000025 	strb	w5, [x1]
    ad20:	d65f03c0 	ret
    ad24:	52800020 	mov	w0, #0x1                   	// #1
    ad28:	d65f03c0 	ret
    ad2c:	52801141 	mov	w1, #0x8a                  	// #138
    ad30:	12800000 	mov	w0, #0xffffffff            	// #-1
    ad34:	b90000c1 	str	w1, [x6]
    ad38:	d65f03c0 	ret
    ad3c:	d503201f 	nop

000000000000ad40 <_write_r>:
    ad40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ad44:	910003fd 	mov	x29, sp
    ad48:	a90153f3 	stp	x19, x20, [sp, #16]
    ad4c:	f0000014 	adrp	x20, d000 <impure_data+0x680>
    ad50:	aa0003f3 	mov	x19, x0
    ad54:	2a0103e0 	mov	w0, w1
    ad58:	aa0203e1 	mov	x1, x2
    ad5c:	b90ec29f 	str	wzr, [x20, #3776]
    ad60:	aa0303e2 	mov	x2, x3
    ad64:	97ffe237 	bl	3640 <_write>
    ad68:	93407c01 	sxtw	x1, w0
    ad6c:	3100041f 	cmn	w0, #0x1
    ad70:	540000a0 	b.eq	ad84 <_write_r+0x44>  // b.none
    ad74:	aa0103e0 	mov	x0, x1
    ad78:	a94153f3 	ldp	x19, x20, [sp, #16]
    ad7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ad80:	d65f03c0 	ret
    ad84:	b94ec280 	ldr	w0, [x20, #3776]
    ad88:	34ffff60 	cbz	w0, ad74 <_write_r+0x34>
    ad8c:	b9000260 	str	w0, [x19]
    ad90:	aa0103e0 	mov	x0, x1
    ad94:	a94153f3 	ldp	x19, x20, [sp, #16]
    ad98:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ad9c:	d65f03c0 	ret

000000000000ada0 <_close_r>:
    ada0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ada4:	910003fd 	mov	x29, sp
    ada8:	a90153f3 	stp	x19, x20, [sp, #16]
    adac:	f0000014 	adrp	x20, d000 <impure_data+0x680>
    adb0:	aa0003f3 	mov	x19, x0
    adb4:	b90ec29f 	str	wzr, [x20, #3776]
    adb8:	2a0103e0 	mov	w0, w1
    adbc:	97ffe225 	bl	3650 <_close>
    adc0:	3100041f 	cmn	w0, #0x1
    adc4:	54000080 	b.eq	add4 <_close_r+0x34>  // b.none
    adc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    adcc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    add0:	d65f03c0 	ret
    add4:	b94ec281 	ldr	w1, [x20, #3776]
    add8:	34ffff81 	cbz	w1, adc8 <_close_r+0x28>
    addc:	b9000261 	str	w1, [x19]
    ade0:	a94153f3 	ldp	x19, x20, [sp, #16]
    ade4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ade8:	d65f03c0 	ret
    adec:	d503201f 	nop

000000000000adf0 <__set_ctype>:
    adf0:	d0000001 	adrp	x1, c000 <JIS_state_table+0x10>
    adf4:	9100e021 	add	x1, x1, #0x38
    adf8:	f9007c01 	str	x1, [x0, #248]
    adfc:	d65f03c0 	ret

000000000000ae00 <__errno>:
    ae00:	d0000000 	adrp	x0, c000 <JIS_state_table+0x10>
    ae04:	f944bc00 	ldr	x0, [x0, #2424]
    ae08:	d65f03c0 	ret
    ae0c:	d503201f 	nop

000000000000ae10 <_fclose_r.part.0>:
    ae10:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    ae14:	910003fd 	mov	x29, sp
    ae18:	a90153f3 	stp	x19, x20, [sp, #16]
    ae1c:	aa0103f3 	mov	x19, x1
    ae20:	f90013f5 	str	x21, [sp, #32]
    ae24:	aa0003f5 	mov	x21, x0
    ae28:	97ffec0a 	bl	5e50 <__sflush_r>
    ae2c:	2a0003f4 	mov	w20, w0
    ae30:	f9402a62 	ldr	x2, [x19, #80]
    ae34:	b40000c2 	cbz	x2, ae4c <_fclose_r.part.0+0x3c>
    ae38:	f9401a61 	ldr	x1, [x19, #48]
    ae3c:	aa1503e0 	mov	x0, x21
    ae40:	d63f0040 	blr	x2
    ae44:	7100001f 	cmp	w0, #0x0
    ae48:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    ae4c:	79402260 	ldrh	w0, [x19, #16]
    ae50:	373802c0 	tbnz	w0, #7, aea8 <_fclose_r.part.0+0x98>
    ae54:	f9402e61 	ldr	x1, [x19, #88]
    ae58:	b40000e1 	cbz	x1, ae74 <_fclose_r.part.0+0x64>
    ae5c:	9101d260 	add	x0, x19, #0x74
    ae60:	eb00003f 	cmp	x1, x0
    ae64:	54000060 	b.eq	ae70 <_fclose_r.part.0+0x60>  // b.none
    ae68:	aa1503e0 	mov	x0, x21
    ae6c:	97ffee5d 	bl	67e0 <_free_r>
    ae70:	f9002e7f 	str	xzr, [x19, #88]
    ae74:	f9403e61 	ldr	x1, [x19, #120]
    ae78:	b4000081 	cbz	x1, ae88 <_fclose_r.part.0+0x78>
    ae7c:	aa1503e0 	mov	x0, x21
    ae80:	97ffee58 	bl	67e0 <_free_r>
    ae84:	f9003e7f 	str	xzr, [x19, #120]
    ae88:	97ffed82 	bl	6490 <__sfp_lock_acquire>
    ae8c:	7900227f 	strh	wzr, [x19, #16]
    ae90:	97ffed84 	bl	64a0 <__sfp_lock_release>
    ae94:	2a1403e0 	mov	w0, w20
    ae98:	a94153f3 	ldp	x19, x20, [sp, #16]
    ae9c:	f94013f5 	ldr	x21, [sp, #32]
    aea0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    aea4:	d65f03c0 	ret
    aea8:	f9400e61 	ldr	x1, [x19, #24]
    aeac:	aa1503e0 	mov	x0, x21
    aeb0:	97ffee4c 	bl	67e0 <_free_r>
    aeb4:	17ffffe8 	b	ae54 <_fclose_r.part.0+0x44>
    aeb8:	d503201f 	nop
    aebc:	d503201f 	nop

000000000000aec0 <_fclose_r>:
    aec0:	b4000301 	cbz	x1, af20 <_fclose_r+0x60>
    aec4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    aec8:	910003fd 	mov	x29, sp
    aecc:	f9000bf4 	str	x20, [sp, #16]
    aed0:	aa0003f4 	mov	x20, x0
    aed4:	b4000060 	cbz	x0, aee0 <_fclose_r+0x20>
    aed8:	b9405002 	ldr	w2, [x0, #80]
    aedc:	34000162 	cbz	w2, af08 <_fclose_r+0x48>
    aee0:	79c02020 	ldrsh	w0, [x1, #16]
    aee4:	350000a0 	cbnz	w0, aef8 <_fclose_r+0x38>
    aee8:	52800000 	mov	w0, #0x0                   	// #0
    aeec:	f9400bf4 	ldr	x20, [sp, #16]
    aef0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    aef4:	d65f03c0 	ret
    aef8:	aa1403e0 	mov	x0, x20
    aefc:	f9400bf4 	ldr	x20, [sp, #16]
    af00:	a8c37bfd 	ldp	x29, x30, [sp], #48
    af04:	17ffffc3 	b	ae10 <_fclose_r.part.0>
    af08:	f90017e1 	str	x1, [sp, #40]
    af0c:	97ffed5d 	bl	6480 <__sinit>
    af10:	f94017e1 	ldr	x1, [sp, #40]
    af14:	79c02020 	ldrsh	w0, [x1, #16]
    af18:	34fffe80 	cbz	w0, aee8 <_fclose_r+0x28>
    af1c:	17fffff7 	b	aef8 <_fclose_r+0x38>
    af20:	52800000 	mov	w0, #0x0                   	// #0
    af24:	d65f03c0 	ret
    af28:	d503201f 	nop
    af2c:	d503201f 	nop

000000000000af30 <fclose>:
    af30:	b4000340 	cbz	x0, af98 <fclose+0x68>
    af34:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    af38:	910003fd 	mov	x29, sp
    af3c:	a90153f3 	stp	x19, x20, [sp, #16]
    af40:	aa0003f3 	mov	x19, x0
    af44:	d0000000 	adrp	x0, c000 <JIS_state_table+0x10>
    af48:	f944bc14 	ldr	x20, [x0, #2424]
    af4c:	b4000074 	cbz	x20, af58 <fclose+0x28>
    af50:	b9405280 	ldr	w0, [x20, #80]
    af54:	34000180 	cbz	w0, af84 <fclose+0x54>
    af58:	79c02260 	ldrsh	w0, [x19, #16]
    af5c:	350000a0 	cbnz	w0, af70 <fclose+0x40>
    af60:	52800000 	mov	w0, #0x0                   	// #0
    af64:	a94153f3 	ldp	x19, x20, [sp, #16]
    af68:	a8c27bfd 	ldp	x29, x30, [sp], #32
    af6c:	d65f03c0 	ret
    af70:	aa1303e1 	mov	x1, x19
    af74:	aa1403e0 	mov	x0, x20
    af78:	a94153f3 	ldp	x19, x20, [sp, #16]
    af7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    af80:	17ffffa4 	b	ae10 <_fclose_r.part.0>
    af84:	aa1403e0 	mov	x0, x20
    af88:	97ffed3e 	bl	6480 <__sinit>
    af8c:	79c02260 	ldrsh	w0, [x19, #16]
    af90:	34fffe80 	cbz	w0, af60 <fclose+0x30>
    af94:	17fffff7 	b	af70 <fclose+0x40>
    af98:	52800000 	mov	w0, #0x0                   	// #0
    af9c:	d65f03c0 	ret

000000000000afa0 <_fstat_r>:
    afa0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    afa4:	910003fd 	mov	x29, sp
    afa8:	a90153f3 	stp	x19, x20, [sp, #16]
    afac:	f0000014 	adrp	x20, d000 <impure_data+0x680>
    afb0:	aa0003f3 	mov	x19, x0
    afb4:	b90ec29f 	str	wzr, [x20, #3776]
    afb8:	2a0103e0 	mov	w0, w1
    afbc:	aa0203e1 	mov	x1, x2
    afc0:	97ffe1a8 	bl	3660 <_fstat>
    afc4:	3100041f 	cmn	w0, #0x1
    afc8:	54000080 	b.eq	afd8 <_fstat_r+0x38>  // b.none
    afcc:	a94153f3 	ldp	x19, x20, [sp, #16]
    afd0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    afd4:	d65f03c0 	ret
    afd8:	b94ec281 	ldr	w1, [x20, #3776]
    afdc:	34ffff81 	cbz	w1, afcc <_fstat_r+0x2c>
    afe0:	b9000261 	str	w1, [x19]
    afe4:	a94153f3 	ldp	x19, x20, [sp, #16]
    afe8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    afec:	d65f03c0 	ret

000000000000aff0 <_findenv_r>:
    aff0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    aff4:	910003fd 	mov	x29, sp
    aff8:	a90363f7 	stp	x23, x24, [sp, #48]
    affc:	f0000017 	adrp	x23, d000 <impure_data+0x680>
    b000:	aa0103f8 	mov	x24, x1
    b004:	a90153f3 	stp	x19, x20, [sp, #16]
    b008:	a9025bf5 	stp	x21, x22, [sp, #32]
    b00c:	aa0203f5 	mov	x21, x2
    b010:	aa0003f6 	mov	x22, x0
    b014:	94000163 	bl	b5a0 <__env_lock>
    b018:	f9455af4 	ldr	x20, [x23, #2736]
    b01c:	b40003f4 	cbz	x20, b098 <_findenv_r+0xa8>
    b020:	39400303 	ldrb	w3, [x24]
    b024:	aa1803f3 	mov	x19, x24
    b028:	7100f47f 	cmp	w3, #0x3d
    b02c:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    b030:	540000c0 	b.eq	b048 <_findenv_r+0x58>  // b.none
    b034:	d503201f 	nop
    b038:	38401e63 	ldrb	w3, [x19, #1]!
    b03c:	7100f47f 	cmp	w3, #0x3d
    b040:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    b044:	54ffffa1 	b.ne	b038 <_findenv_r+0x48>  // b.any
    b048:	7100f47f 	cmp	w3, #0x3d
    b04c:	54000260 	b.eq	b098 <_findenv_r+0xa8>  // b.none
    b050:	f9400280 	ldr	x0, [x20]
    b054:	cb180273 	sub	x19, x19, x24
    b058:	b4000200 	cbz	x0, b098 <_findenv_r+0xa8>
    b05c:	93407e73 	sxtw	x19, w19
    b060:	f90023f9 	str	x25, [sp, #64]
    b064:	d503201f 	nop
    b068:	aa1303e2 	mov	x2, x19
    b06c:	aa1803e1 	mov	x1, x24
    b070:	940000db 	bl	b3dc <strncmp>
    b074:	350000c0 	cbnz	w0, b08c <_findenv_r+0x9c>
    b078:	f9400280 	ldr	x0, [x20]
    b07c:	8b130019 	add	x25, x0, x19
    b080:	38736800 	ldrb	w0, [x0, x19]
    b084:	7100f41f 	cmp	w0, #0x3d
    b088:	54000180 	b.eq	b0b8 <_findenv_r+0xc8>  // b.none
    b08c:	f8408e80 	ldr	x0, [x20, #8]!
    b090:	b5fffec0 	cbnz	x0, b068 <_findenv_r+0x78>
    b094:	f94023f9 	ldr	x25, [sp, #64]
    b098:	aa1603e0 	mov	x0, x22
    b09c:	94000145 	bl	b5b0 <__env_unlock>
    b0a0:	d2800000 	mov	x0, #0x0                   	// #0
    b0a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b0a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b0ac:	a94363f7 	ldp	x23, x24, [sp, #48]
    b0b0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    b0b4:	d65f03c0 	ret
    b0b8:	f9455ae1 	ldr	x1, [x23, #2736]
    b0bc:	aa1603e0 	mov	x0, x22
    b0c0:	cb010281 	sub	x1, x20, x1
    b0c4:	9343fc21 	asr	x1, x1, #3
    b0c8:	b90002a1 	str	w1, [x21]
    b0cc:	94000139 	bl	b5b0 <__env_unlock>
    b0d0:	91000720 	add	x0, x25, #0x1
    b0d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b0d8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b0dc:	a94363f7 	ldp	x23, x24, [sp, #48]
    b0e0:	f94023f9 	ldr	x25, [sp, #64]
    b0e4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    b0e8:	d65f03c0 	ret
    b0ec:	d503201f 	nop

000000000000b0f0 <_getenv_r>:
    b0f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b0f4:	910003fd 	mov	x29, sp
    b0f8:	910073e2 	add	x2, sp, #0x1c
    b0fc:	97ffffbd 	bl	aff0 <_findenv_r>
    b100:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b104:	d65f03c0 	ret
    b108:	d503201f 	nop
    b10c:	d503201f 	nop

000000000000b110 <_isatty_r>:
    b110:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b114:	910003fd 	mov	x29, sp
    b118:	a90153f3 	stp	x19, x20, [sp, #16]
    b11c:	d0000014 	adrp	x20, d000 <impure_data+0x680>
    b120:	aa0003f3 	mov	x19, x0
    b124:	b90ec29f 	str	wzr, [x20, #3776]
    b128:	2a0103e0 	mov	w0, w1
    b12c:	97ffe151 	bl	3670 <_isatty>
    b130:	3100041f 	cmn	w0, #0x1
    b134:	54000080 	b.eq	b144 <_isatty_r+0x34>  // b.none
    b138:	a94153f3 	ldp	x19, x20, [sp, #16]
    b13c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b140:	d65f03c0 	ret
    b144:	b94ec281 	ldr	w1, [x20, #3776]
    b148:	34ffff81 	cbz	w1, b138 <_isatty_r+0x28>
    b14c:	b9000261 	str	w1, [x19]
    b150:	a94153f3 	ldp	x19, x20, [sp, #16]
    b154:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b158:	d65f03c0 	ret
    b15c:	d503201f 	nop

000000000000b160 <_lseek_r>:
    b160:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b164:	910003fd 	mov	x29, sp
    b168:	a90153f3 	stp	x19, x20, [sp, #16]
    b16c:	d0000014 	adrp	x20, d000 <impure_data+0x680>
    b170:	aa0003f3 	mov	x19, x0
    b174:	b90ec29f 	str	wzr, [x20, #3776]
    b178:	2a0103e0 	mov	w0, w1
    b17c:	aa0203e1 	mov	x1, x2
    b180:	2a0303e2 	mov	w2, w3
    b184:	97ffe13f 	bl	3680 <_lseek>
    b188:	b100041f 	cmn	x0, #0x1
    b18c:	54000080 	b.eq	b19c <_lseek_r+0x3c>  // b.none
    b190:	a94153f3 	ldp	x19, x20, [sp, #16]
    b194:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b198:	d65f03c0 	ret
    b19c:	b94ec281 	ldr	w1, [x20, #3776]
    b1a0:	34ffff81 	cbz	w1, b190 <_lseek_r+0x30>
    b1a4:	b9000261 	str	w1, [x19]
    b1a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    b1ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b1b0:	d65f03c0 	ret
    b1b4:	d503201f 	nop
    b1b8:	d503201f 	nop
    b1bc:	d503201f 	nop

000000000000b1c0 <_read_r>:
    b1c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b1c4:	910003fd 	mov	x29, sp
    b1c8:	a90153f3 	stp	x19, x20, [sp, #16]
    b1cc:	d0000014 	adrp	x20, d000 <impure_data+0x680>
    b1d0:	aa0003f3 	mov	x19, x0
    b1d4:	2a0103e0 	mov	w0, w1
    b1d8:	aa0203e1 	mov	x1, x2
    b1dc:	b90ec29f 	str	wzr, [x20, #3776]
    b1e0:	aa0303e2 	mov	x2, x3
    b1e4:	97ffe12b 	bl	3690 <_read>
    b1e8:	93407c01 	sxtw	x1, w0
    b1ec:	3100041f 	cmn	w0, #0x1
    b1f0:	540000a0 	b.eq	b204 <_read_r+0x44>  // b.none
    b1f4:	aa0103e0 	mov	x0, x1
    b1f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    b1fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b200:	d65f03c0 	ret
    b204:	b94ec280 	ldr	w0, [x20, #3776]
    b208:	34ffff60 	cbz	w0, b1f4 <_read_r+0x34>
    b20c:	b9000260 	str	w0, [x19]
    b210:	aa0103e0 	mov	x0, x1
    b214:	a94153f3 	ldp	x19, x20, [sp, #16]
    b218:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b21c:	d65f03c0 	ret

000000000000b220 <cleanup_glue>:
    b220:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    b224:	910003fd 	mov	x29, sp
    b228:	a9025bf5 	stp	x21, x22, [sp, #32]
    b22c:	f9400035 	ldr	x21, [x1]
    b230:	a90153f3 	stp	x19, x20, [sp, #16]
    b234:	aa0103f3 	mov	x19, x1
    b238:	aa0003f4 	mov	x20, x0
    b23c:	b4000275 	cbz	x21, b288 <cleanup_glue+0x68>
    b240:	f94002b6 	ldr	x22, [x21]
    b244:	b40001d6 	cbz	x22, b27c <cleanup_glue+0x5c>
    b248:	f9001bf7 	str	x23, [sp, #48]
    b24c:	f94002d7 	ldr	x23, [x22]
    b250:	b40000f7 	cbz	x23, b26c <cleanup_glue+0x4c>
    b254:	f94002e1 	ldr	x1, [x23]
    b258:	b4000041 	cbz	x1, b260 <cleanup_glue+0x40>
    b25c:	97fffff1 	bl	b220 <cleanup_glue>
    b260:	aa1703e1 	mov	x1, x23
    b264:	aa1403e0 	mov	x0, x20
    b268:	97ffed5e 	bl	67e0 <_free_r>
    b26c:	aa1603e1 	mov	x1, x22
    b270:	aa1403e0 	mov	x0, x20
    b274:	97ffed5b 	bl	67e0 <_free_r>
    b278:	f9401bf7 	ldr	x23, [sp, #48]
    b27c:	aa1503e1 	mov	x1, x21
    b280:	aa1403e0 	mov	x0, x20
    b284:	97ffed57 	bl	67e0 <_free_r>
    b288:	aa1303e1 	mov	x1, x19
    b28c:	aa1403e0 	mov	x0, x20
    b290:	a94153f3 	ldp	x19, x20, [sp, #16]
    b294:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b298:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b29c:	17ffed51 	b	67e0 <_free_r>

000000000000b2a0 <_reclaim_reent>:
    b2a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    b2a4:	b0000001 	adrp	x1, c000 <JIS_state_table+0x10>
    b2a8:	910003fd 	mov	x29, sp
    b2ac:	a90153f3 	stp	x19, x20, [sp, #16]
    b2b0:	aa0003f4 	mov	x20, x0
    b2b4:	f944bc20 	ldr	x0, [x1, #2424]
    b2b8:	eb14001f 	cmp	x0, x20
    b2bc:	54000500 	b.eq	b35c <_reclaim_reent+0xbc>  // b.none
    b2c0:	f9403e81 	ldr	x1, [x20, #120]
    b2c4:	f90013f5 	str	x21, [sp, #32]
    b2c8:	b40001e1 	cbz	x1, b304 <_reclaim_reent+0x64>
    b2cc:	d2800015 	mov	x21, #0x0                   	// #0
    b2d0:	f8756833 	ldr	x19, [x1, x21]
    b2d4:	b40000f3 	cbz	x19, b2f0 <_reclaim_reent+0x50>
    b2d8:	aa1303e1 	mov	x1, x19
    b2dc:	aa1403e0 	mov	x0, x20
    b2e0:	f9400273 	ldr	x19, [x19]
    b2e4:	97ffed3f 	bl	67e0 <_free_r>
    b2e8:	b5ffff93 	cbnz	x19, b2d8 <_reclaim_reent+0x38>
    b2ec:	f9403e81 	ldr	x1, [x20, #120]
    b2f0:	910022b5 	add	x21, x21, #0x8
    b2f4:	f10802bf 	cmp	x21, #0x200
    b2f8:	54fffec1 	b.ne	b2d0 <_reclaim_reent+0x30>  // b.any
    b2fc:	aa1403e0 	mov	x0, x20
    b300:	97ffed38 	bl	67e0 <_free_r>
    b304:	f9403281 	ldr	x1, [x20, #96]
    b308:	b4000061 	cbz	x1, b314 <_reclaim_reent+0x74>
    b30c:	aa1403e0 	mov	x0, x20
    b310:	97ffed34 	bl	67e0 <_free_r>
    b314:	f940fe93 	ldr	x19, [x20, #504]
    b318:	b4000153 	cbz	x19, b340 <_reclaim_reent+0xa0>
    b31c:	91080295 	add	x21, x20, #0x200
    b320:	eb15027f 	cmp	x19, x21
    b324:	540000e0 	b.eq	b340 <_reclaim_reent+0xa0>  // b.none
    b328:	aa1303e1 	mov	x1, x19
    b32c:	aa1403e0 	mov	x0, x20
    b330:	f9400273 	ldr	x19, [x19]
    b334:	97ffed2b 	bl	67e0 <_free_r>
    b338:	eb1302bf 	cmp	x21, x19
    b33c:	54ffff61 	b.ne	b328 <_reclaim_reent+0x88>  // b.any
    b340:	f9404681 	ldr	x1, [x20, #136]
    b344:	b4000061 	cbz	x1, b350 <_reclaim_reent+0xb0>
    b348:	aa1403e0 	mov	x0, x20
    b34c:	97ffed25 	bl	67e0 <_free_r>
    b350:	b9405280 	ldr	w0, [x20, #80]
    b354:	350000a0 	cbnz	w0, b368 <_reclaim_reent+0xc8>
    b358:	f94013f5 	ldr	x21, [sp, #32]
    b35c:	a94153f3 	ldp	x19, x20, [sp, #16]
    b360:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b364:	d65f03c0 	ret
    b368:	f9402e81 	ldr	x1, [x20, #88]
    b36c:	aa1403e0 	mov	x0, x20
    b370:	d63f0020 	blr	x1
    b374:	f9429293 	ldr	x19, [x20, #1312]
    b378:	b4ffff13 	cbz	x19, b358 <_reclaim_reent+0xb8>
    b37c:	f9400261 	ldr	x1, [x19]
    b380:	b4000061 	cbz	x1, b38c <_reclaim_reent+0xec>
    b384:	aa1403e0 	mov	x0, x20
    b388:	97ffffa6 	bl	b220 <cleanup_glue>
    b38c:	aa1303e1 	mov	x1, x19
    b390:	aa1403e0 	mov	x0, x20
    b394:	a94153f3 	ldp	x19, x20, [sp, #16]
    b398:	f94013f5 	ldr	x21, [sp, #32]
    b39c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b3a0:	17ffed10 	b	67e0 <_free_r>
    b3a4:	d503201f 	nop
    b3a8:	d503201f 	nop
    b3ac:	d503201f 	nop
    b3b0:	d503201f 	nop
    b3b4:	d503201f 	nop
    b3b8:	d503201f 	nop
    b3bc:	d503201f 	nop
    b3c0:	d503201f 	nop
    b3c4:	d503201f 	nop
    b3c8:	d503201f 	nop
    b3cc:	d503201f 	nop
    b3d0:	d503201f 	nop
    b3d4:	d503201f 	nop
    b3d8:	d503201f 	nop

000000000000b3dc <strncmp>:
    b3dc:	b4000d82 	cbz	x2, b58c <strncmp+0x1b0>
    b3e0:	ca010008 	eor	x8, x0, x1
    b3e4:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    b3e8:	f240091f 	tst	x8, #0x7
    b3ec:	9240080e 	and	x14, x0, #0x7
    b3f0:	54000681 	b.ne	b4c0 <strncmp+0xe4>  // b.any
    b3f4:	b500040e 	cbnz	x14, b474 <strncmp+0x98>
    b3f8:	d100044d 	sub	x13, x2, #0x1
    b3fc:	d343fdad 	lsr	x13, x13, #3
    b400:	f8408403 	ldr	x3, [x0], #8
    b404:	f8408424 	ldr	x4, [x1], #8
    b408:	f10005ad 	subs	x13, x13, #0x1
    b40c:	cb0b0068 	sub	x8, x3, x11
    b410:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    b414:	ca040066 	eor	x6, x3, x4
    b418:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    b41c:	ea290105 	bics	x5, x8, x9
    b420:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    b424:	54fffee0 	b.eq	b400 <strncmp+0x24>  // b.none
    b428:	b6f8012d 	tbz	x13, #63, b44c <strncmp+0x70>
    b42c:	f2400842 	ands	x2, x2, #0x7
    b430:	540000e0 	b.eq	b44c <strncmp+0x70>  // b.none
    b434:	d37df042 	lsl	x2, x2, #3
    b438:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    b43c:	9ac221ce 	lsl	x14, x14, x2
    b440:	8a2e0063 	bic	x3, x3, x14
    b444:	8a2e0084 	bic	x4, x4, x14
    b448:	aa0e00a5 	orr	x5, x5, x14
    b44c:	aa0500c7 	orr	x7, x6, x5
    b450:	dac00ce7 	rev	x7, x7
    b454:	dac00c63 	rev	x3, x3
    b458:	dac010ec 	clz	x12, x7
    b45c:	dac00c84 	rev	x4, x4
    b460:	9acc2063 	lsl	x3, x3, x12
    b464:	9acc2084 	lsl	x4, x4, x12
    b468:	d378fc63 	lsr	x3, x3, #56
    b46c:	cb44e060 	sub	x0, x3, x4, lsr #56
    b470:	d65f03c0 	ret
    b474:	927df000 	and	x0, x0, #0xfffffffffffffff8
    b478:	927df021 	and	x1, x1, #0xfffffffffffffff8
    b47c:	f8408403 	ldr	x3, [x0], #8
    b480:	cb0e0fea 	neg	x10, x14, lsl #3
    b484:	f8408424 	ldr	x4, [x1], #8
    b488:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    b48c:	d100044d 	sub	x13, x2, #0x1
    b490:	9aca2529 	lsr	x9, x9, x10
    b494:	924009aa 	and	x10, x13, #0x7
    b498:	d343fdad 	lsr	x13, x13, #3
    b49c:	8b0e0042 	add	x2, x2, x14
    b4a0:	8b0e014a 	add	x10, x10, x14
    b4a4:	aa090063 	orr	x3, x3, x9
    b4a8:	aa090084 	orr	x4, x4, x9
    b4ac:	8b4a0dad 	add	x13, x13, x10, lsr #3
    b4b0:	17ffffd6 	b	b408 <strncmp+0x2c>
    b4b4:	d503201f 	nop
    b4b8:	d503201f 	nop
    b4bc:	d503201f 	nop
    b4c0:	f100405f 	cmp	x2, #0x10
    b4c4:	54000122 	b.cs	b4e8 <strncmp+0x10c>  // b.hs, b.nlast
    b4c8:	38401403 	ldrb	w3, [x0], #1
    b4cc:	38401424 	ldrb	w4, [x1], #1
    b4d0:	f1000442 	subs	x2, x2, #0x1
    b4d4:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    b4d8:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    b4dc:	54ffff60 	b.eq	b4c8 <strncmp+0xec>  // b.none
    b4e0:	cb040060 	sub	x0, x3, x4
    b4e4:	d65f03c0 	ret
    b4e8:	d343fc4d 	lsr	x13, x2, #3
    b4ec:	b400018e 	cbz	x14, b51c <strncmp+0x140>
    b4f0:	cb0e03ee 	neg	x14, x14
    b4f4:	924009ce 	and	x14, x14, #0x7
    b4f8:	cb0e0042 	sub	x2, x2, x14
    b4fc:	d343fc4d 	lsr	x13, x2, #3
    b500:	38401403 	ldrb	w3, [x0], #1
    b504:	38401424 	ldrb	w4, [x1], #1
    b508:	7100047f 	cmp	w3, #0x1
    b50c:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    b510:	54fffe81 	b.ne	b4e0 <strncmp+0x104>  // b.any
    b514:	f10005ce 	subs	x14, x14, #0x1
    b518:	54ffff48 	b.hi	b500 <strncmp+0x124>  // b.pmore
    b51c:	d280010e 	mov	x14, #0x8                   	// #8
    b520:	f10005ad 	subs	x13, x13, #0x1
    b524:	540001c3 	b.cc	b55c <strncmp+0x180>  // b.lo, b.ul, b.last
    b528:	927d2029 	and	x9, x1, #0xff8
    b52c:	d27d2129 	eor	x9, x9, #0xff8
    b530:	b4fffe89 	cbz	x9, b500 <strncmp+0x124>
    b534:	f8408403 	ldr	x3, [x0], #8
    b538:	f8408424 	ldr	x4, [x1], #8
    b53c:	cb0b0068 	sub	x8, x3, x11
    b540:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    b544:	ca040066 	eor	x6, x3, x4
    b548:	ea290105 	bics	x5, x8, x9
    b54c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    b550:	54fff7e1 	b.ne	b44c <strncmp+0x70>  // b.any
    b554:	f10005ad 	subs	x13, x13, #0x1
    b558:	54fffe85 	b.pl	b528 <strncmp+0x14c>  // b.nfrst
    b55c:	92400842 	and	x2, x2, #0x7
    b560:	b4fff762 	cbz	x2, b44c <strncmp+0x70>
    b564:	d1002000 	sub	x0, x0, #0x8
    b568:	d1002021 	sub	x1, x1, #0x8
    b56c:	f8626803 	ldr	x3, [x0, x2]
    b570:	f8626824 	ldr	x4, [x1, x2]
    b574:	cb0b0068 	sub	x8, x3, x11
    b578:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    b57c:	ca040066 	eor	x6, x3, x4
    b580:	ea290105 	bics	x5, x8, x9
    b584:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    b588:	54fff621 	b.ne	b44c <strncmp+0x70>  // b.any
    b58c:	d2800000 	mov	x0, #0x0                   	// #0
    b590:	d65f03c0 	ret
    b594:	d503201f 	nop
    b598:	d503201f 	nop
    b59c:	d503201f 	nop

000000000000b5a0 <__env_lock>:
    b5a0:	d65f03c0 	ret
    b5a4:	d503201f 	nop
    b5a8:	d503201f 	nop
    b5ac:	d503201f 	nop

000000000000b5b0 <__env_unlock>:
    b5b0:	d65f03c0 	ret

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

000000000000b5b4 <_fini>:
    b5b4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    b5b8:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    b5bc:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    b5c0:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    b5c4:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    b5c8:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    b5cc:	a8c153f3 	ldp	x19, x20, [sp], #16
    b5d0:	a8c15bf5 	ldp	x21, x22, [sp], #16
    b5d4:	a8c163f7 	ldp	x23, x24, [sp], #16
    b5d8:	a8c16bf9 	ldp	x25, x26, [sp], #16
    b5dc:	a8c173fb 	ldp	x27, x28, [sp], #16
    b5e0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    b5e4:	d65f03c0 	ret
