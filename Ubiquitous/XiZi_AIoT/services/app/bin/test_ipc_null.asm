
test_ipc_null:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
}

// client thread
int server_thread(int argc, char** argv);
int main(int argc, char** argv)
{
       0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
       4:	910003fd 	mov	x29, sp
       8:	a90153f3 	stp	x19, x20, [sp, #16]
       c:	f0000053 	adrp	x19, b000 <pow10.0+0x80>
      10:	91242273 	add	x19, x19, #0x908
    struct Session session;
    bool server_enabled = false;
      14:	52800014 	mov	w20, #0x0                   	// #0
{
      18:	f90013f5 	str	x21, [sp, #32]
    while (connect_session(&session, test_null_server_name, 4096) < 0) {
        if (!server_enabled) {
            char* server_param[] = { test_null_server_name, NULL };
            if (thread(server_thread, test_null_server_name, server_param) >= 0) {
      1c:	90000000 	adrp	x0, 0 <main>
      20:	910c4015 	add	x21, x0, #0x310
    while (connect_session(&session, test_null_server_name, 4096) < 0) {
      24:	14000002 	b	2c <main+0x2c>
        if (!server_enabled) {
      28:	340003b4 	cbz	w20, 9c <main+0x9c>
    while (connect_session(&session, test_null_server_name, 4096) < 0) {
      2c:	aa1303e1 	mov	x1, x19
      30:	910123e0 	add	x0, sp, #0x48
      34:	52820002 	mov	w2, #0x1000                	// #4096
      38:	94000ac6 	bl	2b50 <connect_session>
      3c:	37ffff60 	tbnz	w0, #31, 28 <main+0x28>
                server_enabled = true;
            }
        }
    }

    printf("[%s] Call using NULL ptr.\n", test_null_client_name);
      40:	91204273 	add	x19, x19, #0x810
      44:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
      48:	aa1303e1 	mov	x1, x19
      4c:	9138c000 	add	x0, x0, #0xe30
      50:	94000798 	bl	1eb0 <printf>
    return IPC_CALL(Ipc_test_null)(session, ptr);
      54:	910123e0 	add	x0, sp, #0x48
      58:	d2800001 	mov	x1, #0x0                   	// #0
      5c:	94000075 	bl	230 <ipc_call_copy_args_Ipc_test_null>
    test_null(&session, NULL);
    printf("[%s] Call using non-NULL ptr.\n", test_null_client_name);
      60:	aa1303e1 	mov	x1, x19
      64:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
      68:	91394000 	add	x0, x0, #0xe50
      6c:	94000791 	bl	1eb0 <printf>
    return IPC_CALL(Ipc_test_null)(session, ptr);
      70:	b0000061 	adrp	x1, d000 <__malloc_av_+0x780>
      74:	910aa021 	add	x1, x1, #0x2a8
      78:	910123e0 	add	x0, sp, #0x48
      7c:	9400006d 	bl	230 <ipc_call_copy_args_Ipc_test_null>
    test_null(&session, buf);

    exit(0);
      80:	52800000 	mov	w0, #0x0                   	// #0
      84:	94000887 	bl	22a0 <exit>
    return 0;
}
      88:	52800000 	mov	w0, #0x0                   	// #0
      8c:	a94153f3 	ldp	x19, x20, [sp, #16]
      90:	f94013f5 	ldr	x21, [sp, #32]
      94:	a8c67bfd 	ldp	x29, x30, [sp], #96
      98:	d65f03c0 	ret
            if (thread(server_thread, test_null_server_name, server_param) >= 0) {
      9c:	9100e3e2 	add	x2, sp, #0x38
      a0:	aa1303e1 	mov	x1, x19
      a4:	aa1503e0 	mov	x0, x21
            char* server_param[] = { test_null_server_name, NULL };
      a8:	a903fff3 	stp	x19, xzr, [sp, #56]
            if (thread(server_thread, test_null_server_name, server_param) >= 0) {
      ac:	94000875 	bl	2280 <thread>
      b0:	2a2003f4 	mvn	w20, w0
      b4:	531f7e94 	lsr	w20, w20, #31
      b8:	17ffffdd 	b	2c <main+0x2c>
      bc:	d503201f 	nop

00000000000000c0 <deregister_tm_clones>:
      c0:	b0000060 	adrp	x0, d000 <__malloc_av_+0x780>
      c4:	9109c000 	add	x0, x0, #0x270
      c8:	b0000061 	adrp	x1, d000 <__malloc_av_+0x780>
      cc:	9109c021 	add	x1, x1, #0x270
      d0:	eb00003f 	cmp	x1, x0
      d4:	540000c0 	b.eq	ec <deregister_tm_clones+0x2c>  // b.none
      d8:	d0000041 	adrp	x1, a000 <__swbuf_r+0xb0>
      dc:	f9469421 	ldr	x1, [x1, #3368]
      e0:	b4000061 	cbz	x1, ec <deregister_tm_clones+0x2c>
      e4:	aa0103f0 	mov	x16, x1
      e8:	d61f0200 	br	x16
      ec:	d65f03c0 	ret

00000000000000f0 <register_tm_clones>:
      f0:	b0000060 	adrp	x0, d000 <__malloc_av_+0x780>
      f4:	9109c000 	add	x0, x0, #0x270
      f8:	b0000061 	adrp	x1, d000 <__malloc_av_+0x780>
      fc:	9109c021 	add	x1, x1, #0x270
     100:	cb000021 	sub	x1, x1, x0
     104:	d37ffc22 	lsr	x2, x1, #63
     108:	8b810c41 	add	x1, x2, x1, asr #3
     10c:	9341fc21 	asr	x1, x1, #1
     110:	b40000c1 	cbz	x1, 128 <register_tm_clones+0x38>
     114:	d0000042 	adrp	x2, a000 <__swbuf_r+0xb0>
     118:	f9469842 	ldr	x2, [x2, #3376]
     11c:	b4000062 	cbz	x2, 128 <register_tm_clones+0x38>
     120:	aa0203f0 	mov	x16, x2
     124:	d61f0200 	br	x16
     128:	d65f03c0 	ret
     12c:	d503201f 	nop

0000000000000130 <__do_global_dtors_aux>:
     130:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     134:	910003fd 	mov	x29, sp
     138:	f9000bf3 	str	x19, [sp, #16]
     13c:	b0000073 	adrp	x19, d000 <__malloc_av_+0x780>
     140:	3949c260 	ldrb	w0, [x19, #624]
     144:	35000140 	cbnz	w0, 16c <__do_global_dtors_aux+0x3c>
     148:	97ffffde 	bl	c0 <deregister_tm_clones>
     14c:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     150:	f9469c00 	ldr	x0, [x0, #3384]
     154:	b4000080 	cbz	x0, 164 <__do_global_dtors_aux+0x34>
     158:	f0000040 	adrp	x0, b000 <pow10.0+0x80>
     15c:	9123b000 	add	x0, x0, #0x8ec
     160:	d503201f 	nop
     164:	52800020 	mov	w0, #0x1                   	// #1
     168:	3909c260 	strb	w0, [x19, #624]
     16c:	f9400bf3 	ldr	x19, [sp, #16]
     170:	a8c27bfd 	ldp	x29, x30, [sp], #32
     174:	d65f03c0 	ret
     178:	d503201f 	nop
     17c:	d503201f 	nop

0000000000000180 <frame_dummy>:
     180:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     184:	f946a000 	ldr	x0, [x0, #3392]
     188:	b4000140 	cbz	x0, 1b0 <frame_dummy+0x30>
     18c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     190:	b0000061 	adrp	x1, d000 <__malloc_av_+0x780>
     194:	f0000040 	adrp	x0, b000 <pow10.0+0x80>
     198:	910003fd 	mov	x29, sp
     19c:	9109e021 	add	x1, x1, #0x278
     1a0:	9123b000 	add	x0, x0, #0x8ec
     1a4:	d503201f 	nop
     1a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
     1ac:	17ffffd1 	b	f0 <register_tm_clones>
     1b0:	17ffffd0 	b	f0 <register_tm_clones>
     1b4:	d503201f 	nop

00000000000001b8 <_mainCRTStartup>:
     1b8:	58000281 	ldr	x1, 208 <_cpu_init_hook+0x4>
     1bc:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     1c0:	9100001f 	mov	sp, x0
     1c4:	d280001d 	mov	x29, #0x0                   	// #0
     1c8:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     1cc:	910003fd 	mov	x29, sp
     1d0:	9400000d 	bl	204 <_cpu_init_hook>
     1d4:	580001e0 	ldr	x0, 210 <_cpu_init_hook+0xc>
     1d8:	52800001 	mov	w1, #0x0                   	// #0
     1dc:	580001e2 	ldr	x2, 218 <_cpu_init_hook+0x14>
     1e0:	cb000042 	sub	x2, x2, x0
     1e4:	94000e37 	bl	3ac0 <memset>
     1e8:	580001c0 	ldr	x0, 220 <_cpu_init_hook+0x1c>
     1ec:	94000b0d 	bl	2e20 <atexit>
     1f0:	94000b68 	bl	2f90 <__libc_init_array>
     1f4:	d2800000 	mov	x0, #0x0                   	// #0
     1f8:	d2800001 	mov	x1, #0x0                   	// #0
     1fc:	97ffff81 	bl	0 <main>
     200:	14000828 	b	22a0 <exit>

0000000000000204 <_cpu_init_hook>:
     204:	d65f03c0 	ret
	...
     210:	0000d270 	.word	0x0000d270
     214:	00000000 	.word	0x00000000
     218:	0000d5e8 	.word	0x0000d5e8
     21c:	00000000 	.word	0x00000000
     220:	00002e40 	.word	0x00002e40
     224:	00000000 	.word	0x00000000
     228:	d503201f 	.word	0xd503201f
     22c:	d503201f 	.word	0xd503201f

0000000000000230 <ipc_call_copy_args_Ipc_test_null>:
IPC_INTERFACE(Ipc_test_null, 1, ptr, sizeof(buf));
     230:	b40005c0 	cbz	x0, 2e8 <ipc_call_copy_args_Ipc_test_null+0xb8>
     234:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     238:	910003fd 	mov	x29, sp
     23c:	9100e3e2 	add	x2, sp, #0x38
     240:	a90153f3 	stp	x19, x20, [sp, #16]
     244:	aa0003f4 	mov	x20, x0
     248:	a9025bf5 	stp	x21, x22, [sp, #32]
     24c:	aa0103f5 	mov	x21, x1
     250:	52800416 	mov	w22, #0x20                  	// #32
     254:	52800021 	mov	w1, #0x1                   	// #1
     258:	b9003bf6 	str	w22, [sp, #56]
     25c:	940008c5 	bl	2570 <new_ipc_msg>
     260:	aa0003f3 	mov	x19, x0
     264:	2a1603e3 	mov	w3, w22
     268:	aa1503e2 	mov	x2, x21
     26c:	52800001 	mov	w1, #0x0                   	// #0
     270:	94000900 	bl	2670 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
     274:	52800021 	mov	w1, #0x1                   	// #1
     278:	39000661 	strb	w1, [x19, #1]
     27c:	aa1303e0 	mov	x0, x19
     280:	9400096c 	bl	2830 <ipc_msg_send_wait>
     284:	2a1603e3 	mov	w3, w22
     288:	aa1503e2 	mov	x2, x21
     28c:	aa1303e0 	mov	x0, x19
     290:	52800001 	mov	w1, #0x0                   	// #0
     294:	9400092f 	bl	2750 <ipc_msg_get_nth_arg>
     298:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     29c:	39400260 	ldrb	w0, [x19]
     2a0:	36080280 	tbz	w0, #1, 2f0 <ipc_call_copy_args_Ipc_test_null+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     2a4:	91002261 	add	x1, x19, #0x8
     2a8:	d2800082 	mov	x2, #0x4                   	// #4
     2ac:	9100e3e0 	add	x0, sp, #0x38
     2b0:	94000d74 	bl	3880 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     2b4:	b9800a80 	ldrsw	x0, [x20, #8]
     2b8:	f9400a81 	ldr	x1, [x20, #16]
     2bc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     2c0:	38606820 	ldrb	w0, [x1, x0]
     2c4:	36100080 	tbz	w0, #2, 2d4 <ipc_call_copy_args_Ipc_test_null+0xa4>
        return false;
    }
    return session_free_buf(session, msg->header.len);
     2c8:	79400441 	ldrh	w1, [x2, #2]
     2cc:	aa1403e0 	mov	x0, x20
     2d0:	94000a64 	bl	2c60 <session_free_buf>
     2d4:	b9403be0 	ldr	w0, [sp, #56]
     2d8:	a94153f3 	ldp	x19, x20, [sp, #16]
     2dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     2e0:	a8c47bfd 	ldp	x29, x30, [sp], #64
     2e4:	d65f03c0 	ret
     2e8:	12800000 	mov	w0, #0xffffffff            	// #-1
     2ec:	d65f03c0 	ret
    assert(msg->header.done == 1);
     2f0:	d0000043 	adrp	x3, a000 <__swbuf_r+0xb0>
     2f4:	d0000042 	adrp	x2, a000 <__swbuf_r+0xb0>
     2f8:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     2fc:	91352063 	add	x3, x3, #0xd48
     300:	9139c042 	add	x2, x2, #0xe70
     304:	91358000 	add	x0, x0, #0xd60
     308:	52800fc1 	mov	w1, #0x7e                  	// #126
     30c:	94000aa5 	bl	2da0 <__assert_func>

0000000000000310 <server_thread>:
IPC_SERVER_INTERFACE(Ipc_test_null, 1);
IPC_SERVER_REGISTER_INTERFACES(IpcTestNull, 1, Ipc_test_null);

// server threads
int server_thread(int argc, char** argv)
{
     310:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     314:	910003fd 	mov	x29, sp
     318:	f9000bf3 	str	x19, [sp, #16]
    if (register_server(test_null_server_name) < 0) {
     31c:	f0000053 	adrp	x19, b000 <pow10.0+0x80>
     320:	91242273 	add	x19, x19, #0x908
     324:	aa1303e0 	mov	x0, x19
     328:	940007f6 	bl	2300 <register_server>
     32c:	37f80120 	tbnz	w0, #31, 350 <server_thread+0x40>
        printf("[%s] Register %s server failed.\n", test_null_server_name, test_null_server_name);
        exit(1);
        return 1;
    }
    ipc_server_loop(&IpcTestNull);
     330:	91004260 	add	x0, x19, #0x10
     334:	9400097f 	bl	2930 <ipc_server_loop>

    exit(0);
     338:	52800000 	mov	w0, #0x0                   	// #0
     33c:	940007d9 	bl	22a0 <exit>
    return 0;
     340:	52800000 	mov	w0, #0x0                   	// #0
}
     344:	f9400bf3 	ldr	x19, [sp, #16]
     348:	a8c27bfd 	ldp	x29, x30, [sp], #32
     34c:	d65f03c0 	ret
        printf("[%s] Register %s server failed.\n", test_null_server_name, test_null_server_name);
     350:	aa1303e2 	mov	x2, x19
     354:	aa1303e1 	mov	x1, x19
     358:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     35c:	9136c000 	add	x0, x0, #0xdb0
     360:	940006d4 	bl	1eb0 <printf>
        exit(1);
     364:	52800020 	mov	w0, #0x1                   	// #1
     368:	940007ce 	bl	22a0 <exit>
     36c:	52800020 	mov	w0, #0x1                   	// #1
}
     370:	f9400bf3 	ldr	x19, [sp, #16]
     374:	a8c27bfd 	ldp	x29, x30, [sp], #32
     378:	d65f03c0 	ret
     37c:	d503201f 	nop

0000000000000380 <ipc_serve_Ipc_test_null>:
IPC_SERVER_INTERFACE(Ipc_test_null, 1);
     380:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
        printf("[%s]: A NULL ptr ipc call.\n", test_null_server_name);
     384:	f0000041 	adrp	x1, b000 <pow10.0+0x80>
IPC_SERVER_INTERFACE(Ipc_test_null, 1);
     388:	910003fd 	mov	x29, sp
     38c:	f9000bf3 	str	x19, [sp, #16]
     390:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     394:	39404000 	ldrb	w0, [x0, #16]
     398:	370002c0 	tbnz	w0, #0, 3f0 <ipc_serve_Ipc_test_null+0x70>
        printf("[%s]: A non-NULL ptr ipc call.\n", test_null_server_name);
     39c:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     3a0:	91242021 	add	x1, x1, #0x908
     3a4:	9137e000 	add	x0, x0, #0xdf8
     3a8:	940006c2 	bl	1eb0 <printf>
IPC_SERVER_INTERFACE(Ipc_test_null, 1);
     3ac:	b9002fff 	str	wzr, [sp, #44]
     3b0:	94000954 	bl	2900 <is_cur_session_delayed>
     3b4:	72001c1f 	tst	w0, #0xff
     3b8:	54000141 	b.ne	3e0 <ipc_serve_Ipc_test_null+0x60>  // b.any
    assert(msg->header.valid == 1);
     3bc:	39400260 	ldrb	w0, [x19]
     3c0:	36000220 	tbz	w0, #0, 404 <ipc_serve_Ipc_test_null+0x84>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     3c4:	9100b3e1 	add	x1, sp, #0x2c
     3c8:	91002260 	add	x0, x19, #0x8
     3cc:	d2800082 	mov	x2, #0x4                   	// #4
     3d0:	94000d2c 	bl	3880 <memcpy>
     3d4:	39400260 	ldrb	w0, [x19]
     3d8:	321f0000 	orr	w0, w0, #0x2
     3dc:	39000260 	strb	w0, [x19]
     3e0:	52800000 	mov	w0, #0x0                   	// #0
     3e4:	f9400bf3 	ldr	x19, [sp, #16]
     3e8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     3ec:	d65f03c0 	ret
        printf("[%s]: A NULL ptr ipc call.\n", test_null_server_name);
     3f0:	91242021 	add	x1, x1, #0x908
     3f4:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     3f8:	91376000 	add	x0, x0, #0xdd8
     3fc:	940006ad 	bl	1eb0 <printf>
     400:	17ffffeb 	b	3ac <ipc_serve_Ipc_test_null+0x2c>
    assert(msg->header.valid == 1);
     404:	d0000042 	adrp	x2, a000 <__swbuf_r+0xb0>
     408:	9139c042 	add	x2, x2, #0xe70
     40c:	d0000043 	adrp	x3, a000 <__swbuf_r+0xb0>
     410:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     414:	91006042 	add	x2, x2, #0x18
     418:	91386063 	add	x3, x3, #0xe18
     41c:	91358000 	add	x0, x0, #0xd60
     420:	52801101 	mov	w1, #0x88                  	// #136
     424:	94000a5f 	bl	2da0 <__assert_func>
     428:	d503201f 	nop
     42c:	d503201f 	nop

0000000000000430 <test_null>:
    return IPC_CALL(Ipc_test_null)(session, ptr);
     430:	17ffff80 	b	230 <ipc_call_copy_args_Ipc_test_null>
     434:	d503201f 	nop
     438:	d503201f 	nop
     43c:	d503201f 	nop

0000000000000440 <ipc_do_serve_Ipc_test_null>:
{
     440:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        printf("[%s]: A NULL ptr ipc call.\n", test_null_server_name);
     444:	f0000041 	adrp	x1, b000 <pow10.0+0x80>
{
     448:	910003fd 	mov	x29, sp
    if (ptr == NULL) {
     44c:	b4000100 	cbz	x0, 46c <ipc_do_serve_Ipc_test_null+0x2c>
        printf("[%s]: A non-NULL ptr ipc call.\n", test_null_server_name);
     450:	91242021 	add	x1, x1, #0x908
     454:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     458:	9137e000 	add	x0, x0, #0xdf8
     45c:	94000695 	bl	1eb0 <printf>
}
     460:	52800000 	mov	w0, #0x0                   	// #0
     464:	a8c17bfd 	ldp	x29, x30, [sp], #16
     468:	d65f03c0 	ret
        printf("[%s]: A NULL ptr ipc call.\n", test_null_server_name);
     46c:	91242021 	add	x1, x1, #0x908
     470:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     474:	91376000 	add	x0, x0, #0xdd8
     478:	9400068e 	bl	1eb0 <printf>
}
     47c:	52800000 	mov	w0, #0x0                   	// #0
     480:	a8c17bfd 	ldp	x29, x30, [sp], #16
     484:	d65f03c0 	ret
     488:	d503201f 	nop
     48c:	d503201f 	nop

0000000000000490 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     490:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     494:	52800020 	mov	w0, #0x1                   	// #1
{
     498:	910003fd 	mov	x29, sp
     49c:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     4a0:	b0000073 	adrp	x19, d000 <__malloc_av_+0x780>
     4a4:	b942ca61 	ldr	w1, [x19, #712]
     4a8:	34000081 	cbz	w1, 4b8 <init_uart_mmio+0x28>
}
     4ac:	f9400bf3 	ldr	x19, [sp, #16]
     4b0:	a8c27bfd 	ldp	x29, x30, [sp], #32
     4b4:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     4b8:	2a0003e3 	mov	w3, w0
     4bc:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     4c0:	52820002 	mov	w2, #0x1000                	// #4096
     4c4:	aa0103e0 	mov	x0, x1
     4c8:	940007de 	bl	2440 <mmap>
     4cc:	3100041f 	cmn	w0, #0x1
            return false;
     4d0:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     4d4:	54fffec0 	b.eq	4ac <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     4d8:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     4dc:	2a0103e0 	mov	w0, w1
        mapped = 1;
     4e0:	b902ca61 	str	w1, [x19, #712]
}
     4e4:	f9400bf3 	ldr	x19, [sp, #16]
     4e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
     4ec:	d65f03c0 	ret

00000000000004f0 <putc>:

void putc(char ch)
{
     4f0:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     4f4:	7100281f 	cmp	w0, #0xa
     4f8:	540000c0 	b.eq	510 <putc+0x20>  // b.none
    return in_le32(addr);
     4fc:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     500:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     504:	362fffe1 	tbz	w1, #5, 500 <putc+0x10>
    out_le32(addr, value);
     508:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     50c:	d65f03c0 	ret
    return in_le32(addr);
     510:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     514:	d503201f 	nop
     518:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     51c:	362fffe1 	tbz	w1, #5, 518 <putc+0x28>
    out_le32(addr, value);
     520:	528001a1 	mov	w1, #0xd                   	// #13
     524:	b9000041 	str	w1, [x2]
}
     528:	17fffff5 	b	4fc <putc+0xc>
     52c:	d503201f 	nop

0000000000000530 <getc>:
    return in_le32(addr);
     530:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     534:	d503201f 	nop
     538:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     53c:	3607ffe0 	tbz	w0, #0, 538 <getc+0x8>
    return in_le32(addr);
     540:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     544:	d65f03c0 	ret
     548:	d503201f 	nop
     54c:	d503201f 	nop

0000000000000550 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     550:	eb03005f 	cmp	x2, x3
{
     554:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     558:	54000042 	b.cs	560 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     55c:	38226820 	strb	w0, [x1, x2]
    }
}
     560:	d65f03c0 	ret
     564:	d503201f 	nop
     568:	d503201f 	nop
     56c:	d503201f 	nop

0000000000000570 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     570:	d65f03c0 	ret
     574:	d503201f 	nop
     578:	d503201f 	nop
     57c:	d503201f 	nop

0000000000000580 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     580:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     584:	910003fd 	mov	x29, sp
     588:	a90153f3 	stp	x19, x20, [sp, #16]
     58c:	aa0503f3 	mov	x19, x5
     590:	aa0203f4 	mov	x20, x2
     594:	a9025bf5 	stp	x21, x22, [sp, #32]
     598:	aa0003f5 	mov	x21, x0
     59c:	aa0103f6 	mov	x22, x1
     5a0:	a90363f7 	stp	x23, x24, [sp, #48]
     5a4:	aa0203f7 	mov	x23, x2
     5a8:	aa0403f8 	mov	x24, x4
     5ac:	a9046bf9 	stp	x25, x26, [sp, #64]
     5b0:	2a0703fa 	mov	w26, w7
     5b4:	2a0603f9 	mov	w25, w6
     5b8:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     5bc:	f240075f 	tst	x26, #0x3
{
     5c0:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     5c4:	540001e1 	b.ne	600 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     5c8:	2a0603e0 	mov	w0, w6
     5cc:	aa0203fc 	mov	x28, x2
     5d0:	cb050014 	sub	x20, x0, x5
     5d4:	eb0000bf 	cmp	x5, x0
     5d8:	8b020294 	add	x20, x20, x2
     5dc:	54000542 	b.cs	684 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     5e0:	aa1c03e2 	mov	x2, x28
     5e4:	aa1b03e3 	mov	x3, x27
     5e8:	9100079c 	add	x28, x28, #0x1
     5ec:	aa1603e1 	mov	x1, x22
     5f0:	52800400 	mov	w0, #0x20                  	// #32
     5f4:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     5f8:	eb1c029f 	cmp	x20, x28
     5fc:	54ffff21 	b.ne	5e0 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     600:	8b14027c 	add	x28, x19, x20
     604:	b4000133 	cbz	x19, 628 <_out_rev+0xa8>
     608:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     60c:	d1000673 	sub	x19, x19, #0x1
     610:	aa1c03f4 	mov	x20, x28
     614:	aa1b03e3 	mov	x3, x27
     618:	aa1603e1 	mov	x1, x22
     61c:	38736b00 	ldrb	w0, [x24, x19]
     620:	d63f02a0 	blr	x21
    while (len) {
     624:	b5ffff33 	cbnz	x19, 608 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     628:	360801fa 	tbz	w26, #1, 664 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     62c:	cb170297 	sub	x23, x20, x23
     630:	2a1903f9 	mov	w25, w25
     634:	eb1902ff 	cmp	x23, x25
     638:	54000162 	b.cs	664 <_out_rev+0xe4>  // b.hs, b.nlast
     63c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     640:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     644:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     648:	aa1b03e3 	mov	x3, x27
     64c:	aa1603e1 	mov	x1, x22
     650:	52800400 	mov	w0, #0x20                  	// #32
     654:	d63f02a0 	blr	x21
     658:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     65c:	eb1902ff 	cmp	x23, x25
     660:	54ffff03 	b.cc	640 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     664:	aa1403e0 	mov	x0, x20
     668:	a94153f3 	ldp	x19, x20, [sp, #16]
     66c:	a9425bf5 	ldp	x21, x22, [sp, #32]
     670:	a94363f7 	ldp	x23, x24, [sp, #48]
     674:	a9446bf9 	ldp	x25, x26, [sp, #64]
     678:	a94573fb 	ldp	x27, x28, [sp, #80]
     67c:	a8c67bfd 	ldp	x29, x30, [sp], #96
     680:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     684:	aa0203f4 	mov	x20, x2
     688:	17ffffde 	b	600 <_out_rev+0x80>
     68c:	d503201f 	nop

0000000000000690 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     690:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     694:	aa0603eb 	mov	x11, x6
     698:	aa0403e9 	mov	x9, x4
     69c:	910003fd 	mov	x29, sp
     6a0:	b9403be8 	ldr	w8, [sp, #56]
     6a4:	2a0703ef 	mov	w15, w7
     6a8:	b94033e6 	ldr	w6, [sp, #48]
     6ac:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     6b0:	12160110 	and	w16, w8, #0x400
    if (!value) {
     6b4:	b5000c64 	cbnz	x4, 840 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     6b8:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     6bc:	34000730 	cbz	w16, 7a0 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     6c0:	121f0111 	and	w17, w8, #0x2
     6c4:	37080fc8 	tbnz	w8, #1, 8bc <_ntoa_long+0x22c>
    size_t len = 0U;
     6c8:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6cc:	2a0f03e9 	mov	w9, w15
     6d0:	f1007cbf 	cmp	x5, #0x1f
     6d4:	910043e4 	add	x4, sp, #0x10
     6d8:	1a9f87ea 	cset	w10, ls  // ls = plast
     6dc:	eb05013f 	cmp	x9, x5
     6e0:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     6e4:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6e8:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     6ec:	350009c6 	cbnz	w6, 824 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     6f0:	34000108 	cbz	w8, 710 <_ntoa_long+0x80>
            buf[len++] = '0';
     6f4:	5280060a 	mov	w10, #0x30                  	// #48
     6f8:	910004a5 	add	x5, x5, #0x1
     6fc:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     700:	eb05013f 	cmp	x9, x5
     704:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     708:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     70c:	54ffff69 	b.ls	6f8 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     710:	340001cc 	cbz	w12, 748 <_ntoa_long+0xb8>
     714:	f1007cbf 	cmp	x5, #0x1f
     718:	1a9f87ea 	cset	w10, ls  // ls = plast
     71c:	7100015f 	cmp	w10, #0x0
     720:	2a0603e9 	mov	w9, w6
     724:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     728:	54000109 	b.ls	748 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     72c:	5280060a 	mov	w10, #0x30                  	// #48
     730:	910004a5 	add	x5, x5, #0x1
     734:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     738:	eb05013f 	cmp	x9, x5
     73c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     740:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     744:	54ffff69 	b.ls	730 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     748:	340001b1 	cbz	w17, 77c <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     74c:	350008b0 	cbnz	w16, 860 <_ntoa_long+0x1d0>
     750:	b50007e5 	cbnz	x5, 84c <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     754:	f100417f 	cmp	x11, #0x10
     758:	54000f20 	b.eq	93c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     75c:	f100097f 	cmp	x11, #0x2
     760:	54000f21 	b.ne	944 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     764:	52800c48 	mov	w8, #0x62                  	// #98
     768:	d2800025 	mov	x5, #0x1                   	// #1
     76c:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     770:	52800608 	mov	w8, #0x30                  	// #48
     774:	38256888 	strb	w8, [x4, x5]
     778:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     77c:	f10080bf 	cmp	x5, #0x20
     780:	540000a0 	b.eq	794 <_ntoa_long+0x104>  // b.none
        if (negative) {
     784:	340008d2 	cbz	w18, 89c <_ntoa_long+0x20c>
            buf[len++] = '-';
     788:	528005a8 	mov	w8, #0x2d                  	// #45
     78c:	38256888 	strb	w8, [x4, x5]
     790:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     794:	97ffff7b 	bl	580 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     798:	a8c37bfd 	ldp	x29, x30, [sp], #48
     79c:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     7a0:	52800011 	mov	w17, #0x0                   	// #0
     7a4:	f27b00ff 	tst	x7, #0x20
     7a8:	52800c24 	mov	w4, #0x61                  	// #97
     7ac:	5280082e 	mov	w14, #0x41                  	// #65
     7b0:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     7b4:	510029ce 	sub	w14, w14, #0xa
     7b8:	910043e4 	add	x4, sp, #0x10
     7bc:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     7c0:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     7c4:	910004a5 	add	x5, x5, #0x1
     7c8:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     7cc:	9b0ba58a 	msub	x10, x12, x11, x9
     7d0:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     7d4:	f100255f 	cmp	x10, #0x9
     7d8:	1100c10a 	add	w10, w8, #0x30
     7dc:	0b0e0108 	add	w8, w8, w14
     7e0:	12001d4a 	and	w10, w10, #0xff
     7e4:	12001d08 	and	w8, w8, #0xff
     7e8:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     7ec:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     7f0:	eb0b013f 	cmp	x9, x11
            value /= base;
     7f4:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     7f8:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     7fc:	54fffe29 	b.ls	7c0 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     800:	370ffa47 	tbnz	w7, #1, 748 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     804:	f1007cbf 	cmp	x5, #0x1f
     808:	2a0f03e9 	mov	w9, w15
     80c:	1a9f87ea 	cset	w10, ls  // ls = plast
     810:	eb05013f 	cmp	x9, x5
     814:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     818:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     81c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     820:	34fff686 	cbz	w6, 6f0 <_ntoa_long+0x60>
     824:	3400048c 	cbz	w12, 8b4 <_ntoa_long+0x224>
     828:	35000072 	cbnz	w18, 834 <_ntoa_long+0x1a4>
     82c:	721e04ff 	tst	w7, #0xc
     830:	54000040 	b.eq	838 <_ntoa_long+0x1a8>  // b.none
            width--;
     834:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     838:	35fff5e8 	cbnz	w8, 6f4 <_ntoa_long+0x64>
     83c:	17ffffb8 	b	71c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     840:	121c0111 	and	w17, w8, #0x10
     844:	2a0803e7 	mov	w7, w8
     848:	17ffffd7 	b	7a4 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     84c:	eb2f40bf 	cmp	x5, w15, uxtw
     850:	54000480 	b.eq	8e0 <_ntoa_long+0x250>  // b.none
     854:	eb2640bf 	cmp	x5, w6, uxtw
     858:	54000440 	b.eq	8e0 <_ntoa_long+0x250>  // b.none
     85c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     860:	f1007cbf 	cmp	x5, #0x1f
     864:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     868:	f100417f 	cmp	x11, #0x10
     86c:	54000480 	b.eq	8fc <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     870:	7100011f 	cmp	w8, #0x0
     874:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     878:	54000081 	b.ne	888 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     87c:	52800c48 	mov	w8, #0x62                  	// #98
     880:	38256888 	strb	w8, [x4, x5]
     884:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     888:	f10080bf 	cmp	x5, #0x20
     88c:	54fff721 	b.ne	770 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     890:	97ffff3c 	bl	580 <_out_rev>
}
     894:	a8c37bfd 	ldp	x29, x30, [sp], #48
     898:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     89c:	37100167 	tbnz	w7, #2, 8c8 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     8a0:	361ff7a7 	tbz	w7, #3, 794 <_ntoa_long+0x104>
            buf[len++] = ' ';
     8a4:	52800408 	mov	w8, #0x20                  	// #32
     8a8:	38256888 	strb	w8, [x4, x5]
     8ac:	910004a5 	add	x5, x5, #0x1
     8b0:	17ffffb9 	b	794 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     8b4:	35fff208 	cbnz	w8, 6f4 <_ntoa_long+0x64>
     8b8:	17ffffa4 	b	748 <_ntoa_long+0xb8>
     8bc:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     8c0:	d2800005 	mov	x5, #0x0                   	// #0
     8c4:	17ffffb0 	b	784 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     8c8:	52800568 	mov	w8, #0x2b                  	// #43
     8cc:	38256888 	strb	w8, [x4, x5]
     8d0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     8d4:	97ffff2b 	bl	580 <_out_rev>
}
     8d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     8dc:	d65f03c0 	ret
            if (len && (base == 16U)) {
     8e0:	f10004aa 	subs	x10, x5, #0x1
                len--;
     8e4:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     8e8:	1a9f07e8 	cset	w8, ne  // ne = any
     8ec:	7100417f 	cmp	w11, #0x10
     8f0:	1a9f17e9 	cset	w9, eq  // eq = none
     8f4:	6a090108 	ands	w8, w8, w9
     8f8:	54000160 	b.eq	924 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     8fc:	721b00e9 	ands	w9, w7, #0x20
     900:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     904:	54000141 	b.ne	92c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     908:	7100013f 	cmp	w9, #0x0
     90c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     910:	54fffbc0 	b.eq	888 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     914:	52800b08 	mov	w8, #0x58                  	// #88
     918:	38256888 	strb	w8, [x4, x5]
     91c:	910004a5 	add	x5, x5, #0x1
     920:	17ffffda 	b	888 <_ntoa_long+0x1f8>
            len--;
     924:	aa0a03e5 	mov	x5, x10
     928:	17ffffce 	b	860 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     92c:	52800f08 	mov	w8, #0x78                  	// #120
     930:	38256888 	strb	w8, [x4, x5]
     934:	910004a5 	add	x5, x5, #0x1
     938:	17ffffd4 	b	888 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     93c:	52800028 	mov	w8, #0x1                   	// #1
     940:	17ffffef 	b	8fc <_ntoa_long+0x26c>
            buf[len++] = '0';
     944:	52800608 	mov	w8, #0x30                  	// #48
     948:	d2800025 	mov	x5, #0x1                   	// #1
     94c:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     950:	17ffff8d 	b	784 <_ntoa_long+0xf4>
     954:	d503201f 	nop
     958:	d503201f 	nop
     95c:	d503201f 	nop

0000000000000960 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     960:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     964:	1e602000 	fcmp	d0, d0
{
     968:	a9017bfd 	stp	x29, x30, [sp, #16]
     96c:	910043fd 	add	x29, sp, #0x10
     970:	a90253f3 	stp	x19, x20, [sp, #32]
     974:	aa0203f3 	mov	x19, x2
     978:	2a0603f4 	mov	w20, w6
     97c:	a9035bf5 	stp	x21, x22, [sp, #48]
     980:	2a0503f6 	mov	w22, w5
     984:	a90463f7 	stp	x23, x24, [sp, #64]
     988:	aa0003f7 	mov	x23, x0
     98c:	a9056bf9 	stp	x25, x26, [sp, #80]
     990:	aa0103f9 	mov	x25, x1
     994:	a90673fb 	stp	x27, x28, [sp, #96]
     998:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     99c:	54001361 	b.ne	c08 <_etoa+0x2a8>  // b.any
     9a0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     9a4:	9e670001 	fmov	d1, x0
     9a8:	1e612010 	fcmpe	d0, d1
     9ac:	540012ec 	b.gt	c08 <_etoa+0x2a8>
     9b0:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     9b4:	9e670001 	fmov	d1, x0
     9b8:	1e612010 	fcmpe	d0, d1
     9bc:	54001264 	b.mi	c08 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     9c0:	1e602018 	fcmpe	d0, #0.0
     9c4:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     9c8:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9cc:	fd47e817 	ldr	d23, [x0, #4048]
     9d0:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9d4:	fd47ec01 	ldr	d1, [x0, #4056]
     9d8:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9dc:	fd47f016 	ldr	d22, [x0, #4064]
     9e0:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     9e4:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9e8:	fd47f406 	ldr	d6, [x0, #4072]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     9ec:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9f0:	fd47f815 	ldr	d21, [x0, #4080]
     9f4:	d0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
     9f8:	fd47fc14 	ldr	d20, [x0, #4088]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     9fc:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     a00:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     a04:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     a08:	1e659002 	fmov	d2, #1.400000000000000000e+01
     a0c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     a10:	1e631013 	fmov	d19, #6.000000000000000000e+00
     a14:	1e601010 	fmov	d16, #2.000000000000000000e+00
     a18:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     a1c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     a20:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     a24:	d374f821 	ubfx	x1, x1, #52, #11
     a28:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     a2c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     a30:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     a34:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     a38:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     a3c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     a40:	1e7838a5 	fsub	d5, d5, d24
     a44:	1e770884 	fmul	d4, d4, d23
     a48:	1e7608a5 	fmul	d5, d5, d22
     a4c:	1e612884 	fadd	d4, d4, d1
     a50:	1e652884 	fadd	d4, d4, d5
     a54:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     a58:	1e620301 	scvtf	d1, w24
     a5c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a60:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     a64:	1e632884 	fadd	d4, d4, d3
     a68:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a6c:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     a70:	110ffc00 	add	w0, w0, #0x3ff
     a74:	9e670004 	fmov	d4, x0
     a78:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     a7c:	1e740863 	fmul	d3, d3, d20
     a80:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     a84:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     a88:	1e613a05 	fsub	d5, d16, d1
     a8c:	1e612821 	fadd	d1, d1, d1
     a90:	1e621862 	fdiv	d2, d3, d2
     a94:	1e712842 	fadd	d2, d2, d17
     a98:	1e621862 	fdiv	d2, d3, d2
     a9c:	1e732842 	fadd	d2, d2, d19
     aa0:	1e621863 	fdiv	d3, d3, d2
     aa4:	1e652863 	fadd	d3, d3, d5
     aa8:	1e631821 	fdiv	d1, d1, d3
     aac:	1e722821 	fadd	d1, d1, d18
     ab0:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     ab4:	1e672030 	fcmpe	d1, d7
     ab8:	54000c4c 	b.gt	c40 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     abc:	11018f00 	add	w0, w24, #0x63
     ac0:	7103181f 	cmp	w0, #0xc6
     ac4:	1a9f97fc 	cset	w28, hi  // hi = pmore
     ac8:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     acc:	36580134 	tbz	w20, #11, af0 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     ad0:	f0000040 	adrp	x0, b000 <pow10.0+0x80>
     ad4:	fd400002 	ldr	d2, [x0]
     ad8:	1e6220f0 	fcmpe	d7, d2
     adc:	54000d2a 	b.ge	c80 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     ae0:	34000084 	cbz	w4, af0 <_etoa+0x190>
                --prec;
     ae4:	7100007f 	cmp	w3, #0x0
     ae8:	1a9f07e0 	cset	w0, ne  // ne = any
     aec:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     af0:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     af4:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     af8:	4b1c02c5 	sub	w5, w22, w28
     afc:	5280003a 	mov	w26, #0x1                   	// #1
     b00:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     b04:	7100001f 	cmp	w0, #0x0
     b08:	1a9f07e0 	cset	w0, ne  // ne = any
     b0c:	b9007fe0 	str	w0, [sp, #124]
     b10:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     b14:	34000058 	cbz	w24, b1c <_etoa+0x1bc>
        value /= conv.F;
     b18:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     b1c:	1e602018 	fcmpe	d0, #0.0
     b20:	54000ac4 	b.mi	c78 <_etoa+0x318>  // b.first
     b24:	1e6040e0 	fmov	d0, d7
     b28:	12147a86 	and	w6, w20, #0xfffff7ff
     b2c:	aa1b03e3 	mov	x3, x27
     b30:	aa1303e2 	mov	x2, x19
     b34:	aa1903e1 	mov	x1, x25
     b38:	aa1703e0 	mov	x0, x23
     b3c:	94000071 	bl	d00 <_ftoa>
     b40:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     b44:	3400051a 	cbz	w26, be4 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     b48:	f27b029f 	tst	x20, #0x20
     b4c:	528008a1 	mov	w1, #0x45                  	// #69
     b50:	aa1503e2 	mov	x2, x21
     b54:	aa1b03e3 	mov	x3, x27
     b58:	52800ca0 	mov	w0, #0x65                  	// #101
     b5c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     b60:	aa1903e1 	mov	x1, x25
     b64:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     b68:	7100031f 	cmp	w24, #0x0
     b6c:	528000a0 	mov	w0, #0x5                   	// #5
     b70:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     b74:	5100079c 	sub	w28, w28, #0x1
     b78:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     b7c:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     b80:	b9000be0 	str	w0, [sp, #8]
     b84:	93407c84 	sxtw	x4, w4
     b88:	531f7f05 	lsr	w5, w24, #31
     b8c:	aa1b03e3 	mov	x3, x27
     b90:	aa1903e1 	mov	x1, x25
     b94:	aa1703e0 	mov	x0, x23
     b98:	52800007 	mov	w7, #0x0                   	// #0
     b9c:	d2800146 	mov	x6, #0xa                   	// #10
     ba0:	97fffebc 	bl	690 <_ntoa_long>
     ba4:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     ba8:	b9407fe0 	ldr	w0, [sp, #124]
     bac:	340001c0 	cbz	w0, be4 <_etoa+0x284>
            while (idx - start_idx < width)
     bb0:	cb1302b3 	sub	x19, x21, x19
     bb4:	eb1302df 	cmp	x22, x19
     bb8:	54000169 	b.ls	be4 <_etoa+0x284>  // b.plast
     bbc:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     bc0:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     bc4:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     bc8:	aa1b03e3 	mov	x3, x27
     bcc:	aa1903e1 	mov	x1, x25
     bd0:	52800400 	mov	w0, #0x20                  	// #32
     bd4:	d63f02e0 	blr	x23
     bd8:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     bdc:	eb1302df 	cmp	x22, x19
     be0:	54ffff08 	b.hi	bc0 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     be4:	aa1503e0 	mov	x0, x21
     be8:	a9417bfd 	ldp	x29, x30, [sp, #16]
     bec:	a94253f3 	ldp	x19, x20, [sp, #32]
     bf0:	a9435bf5 	ldp	x21, x22, [sp, #48]
     bf4:	a94463f7 	ldp	x23, x24, [sp, #64]
     bf8:	a9456bf9 	ldp	x25, x26, [sp, #80]
     bfc:	a94673fb 	ldp	x27, x28, [sp, #96]
     c00:	910203ff 	add	sp, sp, #0x80
     c04:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     c08:	2a1403e6 	mov	w6, w20
     c0c:	2a1603e5 	mov	w5, w22
     c10:	aa1b03e3 	mov	x3, x27
     c14:	aa1303e2 	mov	x2, x19
     c18:	aa1903e1 	mov	x1, x25
     c1c:	aa1703e0 	mov	x0, x23
}
     c20:	a9417bfd 	ldp	x29, x30, [sp, #16]
     c24:	a94253f3 	ldp	x19, x20, [sp, #32]
     c28:	a9435bf5 	ldp	x21, x22, [sp, #48]
     c2c:	a94463f7 	ldp	x23, x24, [sp, #64]
     c30:	a9456bf9 	ldp	x25, x26, [sp, #80]
     c34:	a94673fb 	ldp	x27, x28, [sp, #96]
     c38:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     c3c:	14000031 	b	d00 <_ftoa>
        conv.F /= 10;
     c40:	1e711821 	fdiv	d1, d1, d17
        expval--;
     c44:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     c48:	11018f00 	add	w0, w24, #0x63
     c4c:	7103181f 	cmp	w0, #0xc6
     c50:	1a9f97fc 	cset	w28, hi  // hi = pmore
     c54:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     c58:	365ff4d4 	tbz	w20, #11, af0 <_etoa+0x190>
     c5c:	17ffff9d 	b	ad0 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     c60:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     c64:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     c68:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     c6c:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     c70:	5280001a 	mov	w26, #0x0                   	// #0
     c74:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     c78:	1e6140e7 	fneg	d7, d7
     c7c:	17ffffaa 	b	b24 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     c80:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     c84:	f2e825c0 	movk	x0, #0x412e, lsl #48
     c88:	9e670002 	fmov	d2, x0
     c8c:	1e6220f0 	fcmpe	d7, d2
     c90:	54000044 	b.mi	c98 <_etoa+0x338>  // b.first
     c94:	17ffff93 	b	ae0 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     c98:	6b180080 	subs	w0, w4, w24
     c9c:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     ca0:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     ca4:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     ca8:	35000196 	cbnz	w22, cd8 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     cac:	1e602018 	fcmpe	d0, #0.0
     cb0:	54fffd84 	b.mi	c60 <_etoa+0x300>  // b.first
     cb4:	12147a86 	and	w6, w20, #0xfffff7ff
     cb8:	1e6040e0 	fmov	d0, d7
     cbc:	321600c6 	orr	w6, w6, #0x400
     cc0:	aa1b03e3 	mov	x3, x27
     cc4:	aa1303e2 	mov	x2, x19
     cc8:	aa1903e1 	mov	x1, x25
     ccc:	aa1703e0 	mov	x0, x23
     cd0:	52800005 	mov	w5, #0x0                   	// #0
     cd4:	17ffffd3 	b	c20 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     cd8:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     cdc:	2a1603e5 	mov	w5, w22
     ce0:	5280001a 	mov	w26, #0x0                   	// #0
     ce4:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     ce8:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     cec:	b9007fff 	str	wzr, [sp, #124]
     cf0:	17ffff8b 	b	b1c <_etoa+0x1bc>
     cf4:	d503201f 	nop
     cf8:	d503201f 	nop
     cfc:	d503201f 	nop

0000000000000d00 <_ftoa>:
    if (value != value)
     d00:	1e602000 	fcmp	d0, d0
{
     d04:	2a0603e7 	mov	w7, w6
    if (value != value)
     d08:	54000e01 	b.ne	ec8 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     d0c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     d10:	9e6700c1 	fmov	d1, x6
     d14:	1e612010 	fcmpe	d0, d1
     d18:	54001184 	b.mi	f48 <_ftoa+0x248>  // b.first
     d1c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     d20:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     d24:	9e670001 	fmov	d1, x0
     d28:	aa0103f0 	mov	x16, x1
     d2c:	aa0203f1 	mov	x17, x2
     d30:	aa0303f2 	mov	x18, x3
     d34:	1e612010 	fcmpe	d0, d1
     d38:	54000b2c 	b.gt	e9c <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     d3c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     d40:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     d44:	9e670001 	fmov	d1, x0
     d48:	1e612010 	fcmpe	d0, d1
     d4c:	54000f2c 	b.gt	f30 <_ftoa+0x230>
     d50:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     d54:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     d58:	9e670001 	fmov	d1, x0
     d5c:	1e612010 	fcmpe	d0, d1
     d60:	54000e84 	b.mi	f30 <_ftoa+0x230>  // b.first
    if (value < 0) {
     d64:	1e602018 	fcmpe	d0, #0.0
{
     d68:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     d6c:	910003fd 	mov	x29, sp
    if (value < 0) {
     d70:	54000ca4 	b.mi	f04 <_ftoa+0x204>  // b.first
    bool negative = false;
     d74:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     d78:	36500ce7 	tbz	w7, #10, f14 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d7c:	7100249f 	cmp	w4, #0x9
     d80:	910043ec 	add	x12, sp, #0x10
     d84:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     d88:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d8c:	54001929 	b.ls	10b0 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     d90:	91000508 	add	x8, x8, #0x1
        prec--;
     d94:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     d98:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     d9c:	f1007d1f 	cmp	x8, #0x1f
     da0:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     da4:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     da8:	54ffff48 	b.hi	d90 <_ftoa+0x90>  // b.pmore
     dac:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     db0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     db4:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     db8:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     dbc:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
     dc0:	1e620141 	scvtf	d1, w10
     dc4:	1e613801 	fsub	d1, d0, d1
     dc8:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
     dcc:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
     dd0:	9e6301c4 	ucvtf	d4, x14
     dd4:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
     dd8:	1e632030 	fcmpe	d1, d3
     ddc:	5400112c 	b.gt	1000 <_ftoa+0x300>
    } else if (diff < 0.5) {
     de0:	54000084 	b.mi	df0 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
     de4:	b500154e 	cbnz	x14, 108c <_ftoa+0x38c>
        ++frac;
     de8:	910005ce 	add	x14, x14, #0x1
     dec:	d503201f 	nop
    if (prec == 0U) {
     df0:	35000b64 	cbnz	w4, f5c <_ftoa+0x25c>
        diff = value - (double)whole;
     df4:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     df8:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
     dfc:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
     e00:	1e622010 	fcmpe	d0, d2
     e04:	540011a4 	b.mi	1038 <_ftoa+0x338>  // b.first
            ++whole;
     e08:	12000140 	and	w0, w10, #0x1
     e0c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
     e10:	528ccce1 	mov	w1, #0x6667                	// #26215
     e14:	72acccc1 	movk	w1, #0x6666, lsl #16
     e18:	52800142 	mov	w2, #0xa                   	// #10
     e1c:	d503201f 	nop
     e20:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
     e24:	f100811f 	cmp	x8, #0x20
     e28:	54000c20 	b.eq	fac <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
     e2c:	9362fd29 	asr	x9, x9, #34
     e30:	91000508 	add	x8, x8, #0x1
     e34:	4b8a7d29 	sub	w9, w9, w10, asr #31
     e38:	8b080180 	add	x0, x12, x8
     e3c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
     e40:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
     e44:	1100c169 	add	w9, w11, #0x30
     e48:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
     e4c:	35fffeaa 	cbnz	w10, e20 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     e50:	120004e0 	and	w0, w7, #0x3
     e54:	7100041f 	cmp	w0, #0x1
     e58:	54000b00 	b.eq	fb8 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
     e5c:	f1007d1f 	cmp	x8, #0x1f
     e60:	540000a8 	b.hi	e74 <_ftoa+0x174>  // b.pmore
        if (negative) {
     e64:	34000de3 	cbz	w3, 1020 <_ftoa+0x320>
            buf[len++] = '-';
     e68:	528005a0 	mov	w0, #0x2d                  	// #45
     e6c:	38286980 	strb	w0, [x12, x8]
     e70:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     e74:	2a0503e6 	mov	w6, w5
     e78:	aa0c03e4 	mov	x4, x12
     e7c:	aa0803e5 	mov	x5, x8
     e80:	aa1203e3 	mov	x3, x18
     e84:	aa1103e2 	mov	x2, x17
     e88:	aa1003e1 	mov	x1, x16
     e8c:	aa0f03e0 	mov	x0, x15
     e90:	97fffdbc 	bl	580 <_out_rev>
}
     e94:	a8c37bfd 	ldp	x29, x30, [sp], #48
     e98:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     e9c:	37100207 	tbnz	w7, #2, edc <_ftoa+0x1dc>
     ea0:	d2800060 	mov	x0, #0x3                   	// #3
     ea4:	2a0503e6 	mov	w6, w5
     ea8:	d0000044 	adrp	x4, a000 <__swbuf_r+0xb0>
     eac:	913a8084 	add	x4, x4, #0xea0
     eb0:	aa0003e5 	mov	x5, x0
     eb4:	aa1203e3 	mov	x3, x18
     eb8:	aa1103e2 	mov	x2, x17
     ebc:	aa1003e1 	mov	x1, x16
     ec0:	aa0f03e0 	mov	x0, x15
     ec4:	17fffdaf 	b	580 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
     ec8:	2a0503e6 	mov	w6, w5
     ecc:	d0000044 	adrp	x4, a000 <__swbuf_r+0xb0>
     ed0:	d2800065 	mov	x5, #0x3                   	// #3
     ed4:	913ac084 	add	x4, x4, #0xeb0
     ed8:	17fffdaa 	b	580 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
     edc:	d2800080 	mov	x0, #0x4                   	// #4
     ee0:	2a0503e6 	mov	w6, w5
     ee4:	d0000044 	adrp	x4, a000 <__swbuf_r+0xb0>
     ee8:	913aa084 	add	x4, x4, #0xea8
     eec:	aa0003e5 	mov	x5, x0
     ef0:	aa1203e3 	mov	x3, x18
     ef4:	aa1103e2 	mov	x2, x17
     ef8:	aa1003e1 	mov	x1, x16
     efc:	aa0f03e0 	mov	x0, x15
     f00:	17fffda0 	b	580 <_out_rev>
        value = 0 - value;
     f04:	2f00e401 	movi	d1, #0x0
        negative = true;
     f08:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
     f0c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
     f10:	3757f367 	tbnz	w7, #10, d7c <_ftoa+0x7c>
     f14:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     f18:	910043ec 	add	x12, sp, #0x10
     f1c:	f2e825c0 	movk	x0, #0x412e, lsl #48
     f20:	d2800008 	mov	x8, #0x0                   	// #0
     f24:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     f28:	528000c4 	mov	w4, #0x6                   	// #6
     f2c:	17ffffa3 	b	db8 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
     f30:	2a0703e6 	mov	w6, w7
     f34:	aa1203e3 	mov	x3, x18
     f38:	aa1103e2 	mov	x2, x17
     f3c:	aa1003e1 	mov	x1, x16
     f40:	aa0f03e0 	mov	x0, x15
     f44:	17fffe87 	b	960 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
     f48:	2a0503e6 	mov	w6, w5
     f4c:	d0000044 	adrp	x4, a000 <__swbuf_r+0xb0>
     f50:	d2800085 	mov	x5, #0x4                   	// #4
     f54:	913ae084 	add	x4, x4, #0xeb8
     f58:	17fffd8a 	b	580 <_out_rev>
     f5c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
     f60:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
     f64:	0b080021 	add	w1, w1, w8
     f68:	f29999a2 	movk	x2, #0xcccd
     f6c:	1400000d 	b	fa0 <_ftoa+0x2a0>
     f70:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
     f74:	f10025df 	cmp	x14, #0x9
            --count;
     f78:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
     f7c:	91000509 	add	x9, x8, #0x1
     f80:	8b0b096d 	add	x13, x11, x11, lsl #2
     f84:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
     f88:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
     f8c:	1100c1ab 	add	w11, w13, #0x30
     f90:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
     f94:	54000569 	b.ls	1040 <_ftoa+0x340>  // b.plast
            --count;
     f98:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
     f9c:	aa0903e8 	mov	x8, x9
     fa0:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
     fa4:	6b01009f 	cmp	w4, w1
     fa8:	54fffe41 	b.ne	f70 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
     fac:	120004e0 	and	w0, w7, #0x3
     fb0:	7100041f 	cmp	w0, #0x1
     fb4:	54fff601 	b.ne	e74 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     fb8:	34fff525 	cbz	w5, e5c <_ftoa+0x15c>
     fbc:	35000763 	cbnz	w3, 10a8 <_ftoa+0x3a8>
     fc0:	721e04ff 	tst	w7, #0xc
     fc4:	54000721 	b.ne	10a8 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     fc8:	2a0503e1 	mov	w1, w5
     fcc:	eb01011f 	cmp	x8, x1
     fd0:	54fff462 	b.cs	e5c <_ftoa+0x15c>  // b.hs, b.nlast
     fd4:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
     fd8:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     fdc:	54fff4c8 	b.hi	e74 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
     fe0:	91000508 	add	x8, x8, #0x1
     fe4:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     fe8:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
     fec:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
     ff0:	54fff360 	b.eq	e5c <_ftoa+0x15c>  // b.none
     ff4:	f100811f 	cmp	x8, #0x20
     ff8:	54ffff41 	b.ne	fe0 <_ftoa+0x2e0>  // b.any
     ffc:	17ffff9e 	b	e74 <_ftoa+0x174>
        ++frac;
    1000:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
    1004:	9e6301c1 	ucvtf	d1, x14
    1008:	1e622030 	fcmpe	d1, d2
    100c:	5400004a 	b.ge	1014 <_ftoa+0x314>  // b.tcont
    1010:	17ffff78 	b	df0 <_ftoa+0xf0>
            ++whole;
    1014:	1100054a 	add	w10, w10, #0x1
            frac = 0;
    1018:	d280000e 	mov	x14, #0x0                   	// #0
    101c:	17ffff75 	b	df0 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
    1020:	371003c7 	tbnz	w7, #2, 1098 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
    1024:	361ff287 	tbz	w7, #3, e74 <_ftoa+0x174>
            buf[len++] = ' ';
    1028:	52800400 	mov	w0, #0x20                  	// #32
    102c:	38286980 	strb	w0, [x12, x8]
    1030:	91000508 	add	x8, x8, #0x1
    1034:	17ffff90 	b	e74 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1038:	54ffee8c 	b.gt	e08 <_ftoa+0x108>
    103c:	17ffff75 	b	e10 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1040:	f100813f 	cmp	x9, #0x20
    1044:	54000420 	b.eq	10c8 <_ftoa+0x3c8>  // b.none
    1048:	91000901 	add	x1, x8, #0x2
    104c:	51000884 	sub	w4, w4, #0x2
    1050:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
    1054:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1058:	34000340 	cbz	w0, 10c0 <_ftoa+0x3c0>
    105c:	d503201f 	nop
            buf[len++] = '0';
    1060:	91000529 	add	x9, x9, #0x1
    1064:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1068:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
    106c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1070:	540002c0 	b.eq	10c8 <_ftoa+0x3c8>  // b.none
    1074:	eb01013f 	cmp	x9, x1
    1078:	54ffff41 	b.ne	1060 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
    107c:	528005c0 	mov	w0, #0x2e                  	// #46
    1080:	91000428 	add	x8, x1, #0x1
    1084:	38216980 	strb	w0, [x12, x1]
    1088:	17ffff62 	b	e10 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
    108c:	3607eb2e 	tbz	w14, #0, df0 <_ftoa+0xf0>
        ++frac;
    1090:	910005ce 	add	x14, x14, #0x1
    1094:	17ffff57 	b	df0 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
    1098:	52800560 	mov	w0, #0x2b                  	// #43
    109c:	38286980 	strb	w0, [x12, x8]
    10a0:	91000508 	add	x8, x8, #0x1
    10a4:	17ffff74 	b	e74 <_ftoa+0x174>
            width--;
    10a8:	510004a5 	sub	w5, w5, #0x1
    10ac:	17ffffc7 	b	fc8 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
    10b0:	b0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
    10b4:	913e0000 	add	x0, x0, #0xf80
    10b8:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
    10bc:	17ffff3f 	b	db8 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    10c0:	aa0903e1 	mov	x1, x9
    10c4:	17ffffee 	b	107c <_ftoa+0x37c>
            buf[len++] = '0';
    10c8:	aa0903e8 	mov	x8, x9
    10cc:	17ffffb8 	b	fac <_ftoa+0x2ac>

00000000000010d0 <_out_char>:
    if (character) {
    10d0:	72001c00 	ands	w0, w0, #0xff
    10d4:	54000041 	b.ne	10dc <_out_char+0xc>  // b.any
}
    10d8:	d65f03c0 	ret
        _putchar(character);
    10dc:	17fffd05 	b	4f0 <putc>

00000000000010e0 <_out_fct>:
    if (character) {
    10e0:	72001c00 	ands	w0, w0, #0xff
    10e4:	54000080 	b.eq	10f4 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    10e8:	a9400422 	ldp	x2, x1, [x1]
    10ec:	aa0203f0 	mov	x16, x2
    10f0:	d61f0200 	br	x16
}
    10f4:	d65f03c0 	ret
    10f8:	d503201f 	nop
    10fc:	d503201f 	nop

0000000000001100 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    1100:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    1104:	f100003f 	cmp	x1, #0x0
{
    1108:	a9017bfd 	stp	x29, x30, [sp, #16]
    110c:	910043fd 	add	x29, sp, #0x10
    1110:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    1114:	f0fffff3 	adrp	x19, 0 <main>
    1118:	9115c273 	add	x19, x19, #0x570
{
    111c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    1120:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    1124:	aa0103fa 	mov	x26, x1
    1128:	a90673fb 	stp	x27, x28, [sp, #96]
    112c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    1130:	d280001b 	mov	x27, #0x0                   	// #0
    1134:	b9401880 	ldr	w0, [x4, #24]
    1138:	b9007be0 	str	w0, [sp, #120]
    113c:	f9400480 	ldr	x0, [x4, #8]
    1140:	f90047e0 	str	x0, [sp, #136]
    1144:	39400065 	ldrb	w5, [x3]
    1148:	f9400880 	ldr	x0, [x4, #16]
    114c:	f9004be0 	str	x0, [sp, #144]
    1150:	b9401c80 	ldr	w0, [x4, #28]
    1154:	b900abe0 	str	w0, [sp, #168]
    1158:	f9400094 	ldr	x20, [x4]
    115c:	34003ae5 	cbz	w5, 18b8 <_vsnprintf+0x7b8>
    1160:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    1164:	b0000058 	adrp	x24, a000 <__swbuf_r+0xb0>
    1168:	913b0300 	add	x0, x24, #0xec0
    116c:	aa0303f9 	mov	x25, x3
    1170:	f90043e0 	str	x0, [sp, #128]
    1174:	b0000040 	adrp	x0, a000 <__swbuf_r+0xb0>
    1178:	913da000 	add	x0, x0, #0xf68
    117c:	f9004fe0 	str	x0, [sp, #152]
    1180:	1400000a 	b	11a8 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    1184:	91000764 	add	x4, x27, #0x1
    1188:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    118c:	aa1b03e2 	mov	x2, x27
    1190:	aa1c03e3 	mov	x3, x28
    1194:	aa1a03e1 	mov	x1, x26
    1198:	aa0403fb 	mov	x27, x4
    119c:	d63f0260 	blr	x19
    while (*format) {
    11a0:	39400325 	ldrb	w5, [x25]
    11a4:	34000c85 	cbz	w5, 1334 <_vsnprintf+0x234>
            format++;
    11a8:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    11ac:	710094bf 	cmp	w5, #0x25
    11b0:	54fffea1 	b.ne	1184 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    11b4:	aa1903e8 	mov	x8, x25
        flags = 0U;
    11b8:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    11bc:	38401500 	ldrb	w0, [x8], #1
    11c0:	7100ac1f 	cmp	w0, #0x2b
    11c4:	54000180 	b.eq	11f4 <_vsnprintf+0xf4>  // b.none
    11c8:	540001c8 	b.hi	1200 <_vsnprintf+0x100>  // b.pmore
    11cc:	7100801f 	cmp	w0, #0x20
    11d0:	54000260 	b.eq	121c <_vsnprintf+0x11c>  // b.none
    11d4:	71008c1f 	cmp	w0, #0x23
    11d8:	540002e1 	b.ne	1234 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    11dc:	321c00c6 	orr	w6, w6, #0x10
            format++;
    11e0:	aa0803f9 	mov	x25, x8
            switch (*format) {
    11e4:	aa1903e8 	mov	x8, x25
    11e8:	38401500 	ldrb	w0, [x8], #1
    11ec:	7100ac1f 	cmp	w0, #0x2b
    11f0:	54fffec1 	b.ne	11c8 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    11f4:	321e00c6 	orr	w6, w6, #0x4
            format++;
    11f8:	aa0803f9 	mov	x25, x8
    11fc:	17fffffa 	b	11e4 <_vsnprintf+0xe4>
            switch (*format) {
    1200:	7100b41f 	cmp	w0, #0x2d
    1204:	54000120 	b.eq	1228 <_vsnprintf+0x128>  // b.none
    1208:	7100c01f 	cmp	w0, #0x30
    120c:	540062c1 	b.ne	1e64 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    1210:	320000c6 	orr	w6, w6, #0x1
            format++;
    1214:	aa0803f9 	mov	x25, x8
    1218:	17fffff3 	b	11e4 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    121c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    1220:	aa0803f9 	mov	x25, x8
    1224:	17fffff0 	b	11e4 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    1228:	321f00c6 	orr	w6, w6, #0x2
            format++;
    122c:	aa0803f9 	mov	x25, x8
    1230:	17ffffed 	b	11e4 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    1234:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    1238:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    123c:	540002e0 	b.eq	1298 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    1240:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    1244:	7101b01f 	cmp	w0, #0x6c
            format++;
    1248:	aa0803e4 	mov	x4, x8
        switch (*format) {
    124c:	54001f20 	b.eq	1630 <_vsnprintf+0x530>  // b.none
    1250:	54000588 	b.hi	1300 <_vsnprintf+0x200>  // b.pmore
    1254:	7101a01f 	cmp	w0, #0x68
    1258:	54001e20 	b.eq	161c <_vsnprintf+0x51c>  // b.none
    125c:	7101a81f 	cmp	w0, #0x6a
    1260:	54006241 	b.ne	1ea8 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    1264:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    1268:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    126c:	51009402 	sub	w2, w0, #0x25
            format++;
    1270:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    1274:	71014c5f 	cmp	w2, #0x53
    1278:	54000069 	b.ls	1284 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    127c:	91000764 	add	x4, x27, #0x1
    1280:	17ffffc3 	b	118c <_vsnprintf+0x8c>
        switch (*format) {
    1284:	f94043e1 	ldr	x1, [sp, #128]
    1288:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    128c:	10000062 	adr	x2, 1298 <_vsnprintf+0x198>
    1290:	8b21a841 	add	x1, x2, w1, sxth #2
    1294:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    1298:	b9407be0 	ldr	w0, [sp, #120]
    129c:	37f806c0 	tbnz	w0, #31, 1374 <_vsnprintf+0x274>
    12a0:	91002e82 	add	x2, x20, #0xb
    12a4:	aa1403e0 	mov	x0, x20
    12a8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    12ac:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    12b0:	36f80078 	tbz	w24, #31, 12bc <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    12b4:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    12b8:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    12bc:	39400720 	ldrb	w0, [x25, #1]
            format++;
    12c0:	aa0803f9 	mov	x25, x8
    12c4:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    12c8:	7100b81f 	cmp	w0, #0x2e
    12cc:	54fffba1 	b.ne	1240 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    12d0:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    12d4:	321600c6 	orr	w6, w6, #0x400
            format++;
    12d8:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    12dc:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    12e0:	12001c42 	and	w2, w2, #0xff
    12e4:	7100245f 	cmp	w2, #0x9
    12e8:	54001b29 	b.ls	164c <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    12ec:	7100a81f 	cmp	w0, #0x2a
    12f0:	54002a20 	b.eq	1834 <_vsnprintf+0x734>  // b.none
            format++;
    12f4:	aa0803f9 	mov	x25, x8
    12f8:	91000508 	add	x8, x8, #0x1
    12fc:	17ffffd1 	b	1240 <_vsnprintf+0x140>
        switch (*format) {
    1300:	7101d01f 	cmp	w0, #0x74
    1304:	54fffb00 	b.eq	1264 <_vsnprintf+0x164>  // b.none
    1308:	7101e81f 	cmp	w0, #0x7a
    130c:	54fffac0 	b.eq	1264 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1310:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1314:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1318:	7100245f 	cmp	w2, #0x9
    131c:	54fffb08 	b.hi	127c <_vsnprintf+0x17c>  // b.pmore
    1320:	f9404fe1 	ldr	x1, [sp, #152]
    1324:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1328:	10000062 	adr	x2, 1334 <_vsnprintf+0x234>
    132c:	8b21a841 	add	x1, x2, w1, sxth #2
    1330:	d61f0020 	br	x1
    1334:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    1338:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    133c:	eb1b039f 	cmp	x28, x27
    1340:	d1000782 	sub	x2, x28, #0x1
    1344:	aa1a03e1 	mov	x1, x26
    1348:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    134c:	aa1c03e3 	mov	x3, x28
    1350:	52800000 	mov	w0, #0x0                   	// #0
    1354:	d63f0260 	blr	x19
}
    1358:	2a1403e0 	mov	w0, w20
    135c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1360:	a94253f3 	ldp	x19, x20, [sp, #32]
    1364:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1368:	a94673fb 	ldp	x27, x28, [sp, #96]
    136c:	9102c3ff 	add	sp, sp, #0xb0
    1370:	d65f03c0 	ret
            const int w = va_arg(va, int);
    1374:	b9407be0 	ldr	w0, [sp, #120]
    1378:	11002002 	add	w2, w0, #0x8
    137c:	7100005f 	cmp	w2, #0x0
    1380:	5400228d 	b.le	17d0 <_vsnprintf+0x6d0>
    1384:	91002e84 	add	x4, x20, #0xb
    1388:	aa1403e0 	mov	x0, x20
    138c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1390:	b9007be2 	str	w2, [sp, #120]
    1394:	17ffffc6 	b	12ac <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    1398:	121a7802 	and	w2, w0, #0xffffffdf
    139c:	7101605f 	cmp	w2, #0x58
    13a0:	54001781 	b.ne	1690 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    13a4:	7101601f 	cmp	w0, #0x58
    13a8:	54003c81 	b.ne	1b38 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    13ac:	321b00c6 	orr	w6, w6, #0x20
    13b0:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    13b4:	121c74c6 	and	w6, w6, #0xfffffff3
    13b8:	140000c0 	b	16b8 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    13bc:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    13c0:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    13c4:	71011c5f 	cmp	w2, #0x47
    13c8:	321500c2 	orr	w2, w6, #0x800
    13cc:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    13d0:	7101141f 	cmp	w0, #0x45
    13d4:	321b00c0 	orr	w0, w6, #0x20
    13d8:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    13dc:	b940abe0 	ldr	w0, [sp, #168]
    13e0:	37f81c20 	tbnz	w0, #31, 1764 <_vsnprintf+0x664>
    13e4:	91003e82 	add	x2, x20, #0xf
    13e8:	aa1403e0 	mov	x0, x20
    13ec:	927df054 	and	x20, x2, #0xfffffffffffffff8
    13f0:	fd400000 	ldr	d0, [x0]
    13f4:	aa1b03e2 	mov	x2, x27
    13f8:	2a1803e5 	mov	w5, w24
    13fc:	2a1703e4 	mov	w4, w23
    1400:	aa1c03e3 	mov	x3, x28
    1404:	aa1a03e1 	mov	x1, x26
    1408:	aa1303e0 	mov	x0, x19
    140c:	97fffd55 	bl	960 <_etoa>
    1410:	aa0003fb 	mov	x27, x0
            break;
    1414:	17ffff63 	b	11a0 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1418:	7101181f 	cmp	w0, #0x46
    141c:	321b00c0 	orr	w0, w6, #0x20
    1420:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1424:	b940abe0 	ldr	w0, [sp, #168]
    1428:	37f818c0 	tbnz	w0, #31, 1740 <_vsnprintf+0x640>
    142c:	91003e82 	add	x2, x20, #0xf
    1430:	aa1403e0 	mov	x0, x20
    1434:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1438:	fd400000 	ldr	d0, [x0]
    143c:	aa1b03e2 	mov	x2, x27
    1440:	2a1803e5 	mov	w5, w24
    1444:	2a1703e4 	mov	w4, w23
    1448:	aa1c03e3 	mov	x3, x28
    144c:	aa1a03e1 	mov	x1, x26
    1450:	aa1303e0 	mov	x0, x19
    1454:	97fffe2b 	bl	d00 <_ftoa>
    1458:	aa0003fb 	mov	x27, x0
            break;
    145c:	17ffff51 	b	11a0 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    1460:	91000760 	add	x0, x27, #0x1
    1464:	aa1b03e2 	mov	x2, x27
    1468:	aa1c03e3 	mov	x3, x28
    146c:	aa0003fb 	mov	x27, x0
    1470:	aa1a03e1 	mov	x1, x26
    1474:	528004a0 	mov	w0, #0x25                  	// #37
    1478:	d63f0260 	blr	x19
            break;
    147c:	17ffff49 	b	11a0 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    1480:	52800420 	mov	w0, #0x21                  	// #33
    1484:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1488:	b9407be0 	ldr	w0, [sp, #120]
    148c:	37f817e0 	tbnz	w0, #31, 1788 <_vsnprintf+0x688>
    1490:	91003e82 	add	x2, x20, #0xf
    1494:	aa1403e0 	mov	x0, x20
    1498:	927df054 	and	x20, x2, #0xfffffffffffffff8
    149c:	2a1703e7 	mov	w7, w23
    14a0:	aa1b03e2 	mov	x2, x27
    14a4:	f9400004 	ldr	x4, [x0]
    14a8:	52800200 	mov	w0, #0x10                  	// #16
    14ac:	b90003e0 	str	w0, [sp]
    14b0:	b9000be6 	str	w6, [sp, #8]
    14b4:	d2800206 	mov	x6, #0x10                  	// #16
    14b8:	52800005 	mov	w5, #0x0                   	// #0
    14bc:	aa1c03e3 	mov	x3, x28
    14c0:	aa1a03e1 	mov	x1, x26
    14c4:	aa1303e0 	mov	x0, x19
    14c8:	97fffc72 	bl	690 <_ntoa_long>
    14cc:	aa0003fb 	mov	x27, x0
            break;
    14d0:	17ffff34 	b	11a0 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    14d4:	a9035bf5 	stp	x21, x22, [sp, #48]
    14d8:	36082306 	tbz	w6, #1, 1938 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    14dc:	b9407be0 	ldr	w0, [sp, #120]
    14e0:	37f82a20 	tbnz	w0, #31, 1a24 <_vsnprintf+0x924>
    14e4:	91002e82 	add	x2, x20, #0xb
    14e8:	aa1403e0 	mov	x0, x20
    14ec:	927df054 	and	x20, x2, #0xfffffffffffffff8
    14f0:	39400000 	ldrb	w0, [x0]
    14f4:	aa1b03e2 	mov	x2, x27
    14f8:	aa1c03e3 	mov	x3, x28
    14fc:	aa1a03e1 	mov	x1, x26
    1500:	91000775 	add	x21, x27, #0x1
    1504:	d63f0260 	blr	x19
                while (l++ < width) {
    1508:	51000b00 	sub	w0, w24, #0x2
    150c:	91000b6a 	add	x10, x27, #0x2
    1510:	7100071f 	cmp	w24, #0x1
    1514:	8b00015b 	add	x27, x10, x0
    1518:	540007c9 	b.ls	1610 <_vsnprintf+0x510>  // b.plast
    151c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1520:	aa1503e2 	mov	x2, x21
    1524:	aa1c03e3 	mov	x3, x28
    1528:	910006b5 	add	x21, x21, #0x1
    152c:	aa1a03e1 	mov	x1, x26
    1530:	52800400 	mov	w0, #0x20                  	// #32
    1534:	d63f0260 	blr	x19
                while (l++ < width) {
    1538:	eb1b02bf 	cmp	x21, x27
    153c:	54ffff21 	b.ne	1520 <_vsnprintf+0x420>  // b.any
    1540:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1544:	17ffff17 	b	11a0 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    1548:	b9407be0 	ldr	w0, [sp, #120]
    154c:	a9035bf5 	stp	x21, x22, [sp, #48]
    1550:	37f812e0 	tbnz	w0, #31, 17ac <_vsnprintf+0x6ac>
    1554:	91003e82 	add	x2, x20, #0xf
    1558:	aa1403e0 	mov	x0, x20
    155c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1560:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    1564:	394002a8 	ldrb	w8, [x21]
    1568:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    156c:	350017d7 	cbnz	w23, 1864 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    1570:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    1574:	340035c8 	cbz	w8, 1c2c <_vsnprintf+0xb2c>
    1578:	91000456 	add	x22, x2, #0x1
    157c:	aa1503e2 	mov	x2, x21
    1580:	8b1602b6 	add	x22, x21, x22
    1584:	14000003 	b	1590 <_vsnprintf+0x490>
    1588:	eb0202df 	cmp	x22, x2
    158c:	54001900 	b.eq	18ac <_vsnprintf+0x7ac>  // b.none
    1590:	38401c44 	ldrb	w4, [x2, #1]!
    1594:	35ffffa4 	cbnz	w4, 1588 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    1598:	4b150041 	sub	w1, w2, w21
    159c:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    15a0:	121600c1 	and	w1, w6, #0x400
    15a4:	b9007fe1 	str	w1, [sp, #124]
    15a8:	365000a6 	tbz	w6, #10, 15bc <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    15ac:	b940a3e1 	ldr	w1, [sp, #160]
    15b0:	6b17003f 	cmp	w1, w23
    15b4:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    15b8:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    15bc:	121f00c1 	and	w1, w6, #0x2
    15c0:	b900afe1 	str	w1, [sp, #172]
    15c4:	36081826 	tbz	w6, #1, 18c8 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    15c8:	34001108 	cbz	w8, 17e8 <_vsnprintf+0x6e8>
    15cc:	aa1b03e2 	mov	x2, x27
    15d0:	cb1b02b6 	sub	x22, x21, x27
    15d4:	14000002 	b	15dc <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    15d8:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    15dc:	b9407fe1 	ldr	w1, [sp, #124]
    15e0:	34000081 	cbz	w1, 15f0 <_vsnprintf+0x4f0>
    15e4:	510006e4 	sub	w4, w23, #0x1
    15e8:	340016d7 	cbz	w23, 18c0 <_vsnprintf+0x7c0>
    15ec:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    15f0:	91000455 	add	x21, x2, #0x1
    15f4:	aa1c03e3 	mov	x3, x28
    15f8:	aa1a03e1 	mov	x1, x26
    15fc:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1600:	38756ac0 	ldrb	w0, [x22, x21]
    1604:	35fffea0 	cbnz	w0, 15d8 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1608:	b940afe0 	ldr	w0, [sp, #172]
    160c:	35000ec0 	cbnz	w0, 17e4 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1610:	aa1503fb 	mov	x27, x21
    1614:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1618:	17fffee2 	b	11a0 <_vsnprintf+0xa0>
            if (*format == 'h') {
    161c:	39400720 	ldrb	w0, [x25, #1]
    1620:	7101a01f 	cmp	w0, #0x68
    1624:	540013c0 	b.eq	189c <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1628:	321900c6 	orr	w6, w6, #0x80
    162c:	17ffff10 	b	126c <_vsnprintf+0x16c>
            if (*format == 'l') {
    1630:	39400720 	ldrb	w0, [x25, #1]
    1634:	7101b01f 	cmp	w0, #0x6c
    1638:	54ffe181 	b.ne	1268 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    163c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    1640:	321804c6 	orr	w6, w6, #0x300
                format++;
    1644:	91000b24 	add	x4, x25, #0x2
    1648:	17ffff09 	b	126c <_vsnprintf+0x16c>
    unsigned int i = 0U;
    164c:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1650:	52800148 	mov	w8, #0xa                   	// #10
    1654:	d503201f 	nop
    1658:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    165c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    1660:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1664:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    1668:	12001c42 	and	w2, w2, #0xff
    166c:	7100245f 	cmp	w2, #0x9
    1670:	54ffff49 	b.ls	1658 <_vsnprintf+0x558>  // b.plast
    1674:	aa0403f9 	mov	x25, x4
    1678:	91000488 	add	x8, x4, #0x1
    167c:	17fffef2 	b	1244 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    1680:	121a7802 	and	w2, w0, #0xffffffdf
    1684:	7101605f 	cmp	w2, #0x58
    1688:	54002580 	b.eq	1b38 <_vsnprintf+0xa38>  // b.none
    168c:	d503201f 	nop
            } else if (*format == 'o') {
    1690:	7101bc1f 	cmp	w0, #0x6f
    1694:	540021a0 	b.eq	1ac8 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    1698:	7101881f 	cmp	w0, #0x62
    169c:	54002820 	b.eq	1ba0 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    16a0:	121b78c6 	and	w6, w6, #0xffffffef
    16a4:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    16a8:	7101a41f 	cmp	w0, #0x69
    16ac:	52800c82 	mov	w2, #0x64                  	// #100
    16b0:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    16b4:	54ffe801 	b.ne	13b4 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    16b8:	f27600df 	tst	x6, #0x400
    16bc:	121f78c2 	and	w2, w6, #0xfffffffe
    16c0:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    16c4:	7101a41f 	cmp	w0, #0x69
    16c8:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    16cc:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    16d0:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    16d4:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    16d8:	54000ce1 	b.ne	1874 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    16dc:	35002122 	cbnz	w2, 1b00 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    16e0:	37402306 	tbnz	w6, #8, 1b40 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    16e4:	37301b26 	tbnz	w6, #6, 1a48 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    16e8:	36382926 	tbz	w6, #7, 1c0c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    16ec:	37f83300 	tbnz	w0, #31, 1d4c <_vsnprintf+0xc4c>
    16f0:	91002e82 	add	x2, x20, #0xb
    16f4:	aa1403e0 	mov	x0, x20
    16f8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    16fc:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1700:	710000bf 	cmp	w5, #0x0
    1704:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1708:	12003c84 	and	w4, w4, #0xffff
    170c:	2a1703e7 	mov	w7, w23
    1710:	531f7ca5 	lsr	w5, w5, #31
    1714:	93407c84 	sxtw	x4, w4
    1718:	aa1b03e2 	mov	x2, x27
    171c:	b9000be6 	str	w6, [sp, #8]
    1720:	aa0803e6 	mov	x6, x8
    1724:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1728:	aa1c03e3 	mov	x3, x28
    172c:	aa1a03e1 	mov	x1, x26
    1730:	aa1303e0 	mov	x0, x19
    1734:	97fffbd7 	bl	690 <_ntoa_long>
    1738:	aa0003fb 	mov	x27, x0
            break;
    173c:	17fffe99 	b	11a0 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1740:	b940abe0 	ldr	w0, [sp, #168]
    1744:	11004002 	add	w2, w0, #0x10
    1748:	7100005f 	cmp	w2, #0x0
    174c:	54001b4d 	b.le	1ab4 <_vsnprintf+0x9b4>
    1750:	91003e84 	add	x4, x20, #0xf
    1754:	aa1403e0 	mov	x0, x20
    1758:	927df094 	and	x20, x4, #0xfffffffffffffff8
    175c:	b900abe2 	str	w2, [sp, #168]
    1760:	17ffff36 	b	1438 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1764:	b940abe0 	ldr	w0, [sp, #168]
    1768:	11004002 	add	w2, w0, #0x10
    176c:	7100005f 	cmp	w2, #0x0
    1770:	5400198d 	b.le	1aa0 <_vsnprintf+0x9a0>
    1774:	91003e84 	add	x4, x20, #0xf
    1778:	aa1403e0 	mov	x0, x20
    177c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1780:	b900abe2 	str	w2, [sp, #168]
    1784:	17ffff1b 	b	13f0 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1788:	b9407be0 	ldr	w0, [sp, #120]
    178c:	11002002 	add	w2, w0, #0x8
    1790:	7100005f 	cmp	w2, #0x0
    1794:	540017cd 	b.le	1a8c <_vsnprintf+0x98c>
    1798:	91003e84 	add	x4, x20, #0xf
    179c:	aa1403e0 	mov	x0, x20
    17a0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    17a4:	b9007be2 	str	w2, [sp, #120]
    17a8:	17ffff3d 	b	149c <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    17ac:	b9407be0 	ldr	w0, [sp, #120]
    17b0:	11002002 	add	w2, w0, #0x8
    17b4:	7100005f 	cmp	w2, #0x0
    17b8:	5400160d 	b.le	1a78 <_vsnprintf+0x978>
    17bc:	91003e84 	add	x4, x20, #0xf
    17c0:	aa1403e0 	mov	x0, x20
    17c4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    17c8:	b9007be2 	str	w2, [sp, #120]
    17cc:	17ffff65 	b	1560 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    17d0:	f94047e1 	ldr	x1, [sp, #136]
    17d4:	b9407be0 	ldr	w0, [sp, #120]
    17d8:	b9007be2 	str	w2, [sp, #120]
    17dc:	8b20c020 	add	x0, x1, w0, sxtw
    17e0:	17fffeb3 	b	12ac <_vsnprintf+0x1ac>
    17e4:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    17e8:	b940a3e0 	ldr	w0, [sp, #160]
    17ec:	6b18001f 	cmp	w0, w24
    17f0:	540009e2 	b.cs	192c <_vsnprintf+0x82c>  // b.hs, b.nlast
    17f4:	51000704 	sub	w4, w24, #0x1
    17f8:	91000776 	add	x22, x27, #0x1
    17fc:	4b000084 	sub	w4, w4, w0
    1800:	8b160095 	add	x21, x4, x22
    1804:	14000002 	b	180c <_vsnprintf+0x70c>
    1808:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    180c:	aa1b03e2 	mov	x2, x27
    1810:	aa1c03e3 	mov	x3, x28
    1814:	aa1a03e1 	mov	x1, x26
    1818:	52800400 	mov	w0, #0x20                  	// #32
    181c:	d63f0260 	blr	x19
    1820:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1824:	eb1502df 	cmp	x22, x21
    1828:	54ffff01 	b.ne	1808 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    182c:	aa1503fb 	mov	x27, x21
    1830:	17ffff79 	b	1614 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    1834:	b9407be0 	ldr	w0, [sp, #120]
    1838:	37f80b80 	tbnz	w0, #31, 19a8 <_vsnprintf+0x8a8>
    183c:	91002e82 	add	x2, x20, #0xb
    1840:	aa1403e0 	mov	x0, x20
    1844:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1848:	b9400007 	ldr	w7, [x0]
                format++;
    184c:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    1850:	39400320 	ldrb	w0, [x25]
    1854:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1858:	710000ff 	cmp	w7, #0x0
    185c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    1860:	17fffe79 	b	1244 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    1864:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    1868:	34001e28 	cbz	w8, 1c2c <_vsnprintf+0xb2c>
    186c:	d1000442 	sub	x2, x2, #0x1
    1870:	17ffff42 	b	1578 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    1874:	35001302 	cbnz	w2, 1ad4 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    1878:	37401806 	tbnz	w6, #8, 1b78 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    187c:	37300ba6 	tbnz	w6, #6, 19f0 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    1880:	36381ba6 	tbz	w6, #7, 1bf4 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1884:	37f82500 	tbnz	w0, #31, 1d24 <_vsnprintf+0xc24>
    1888:	aa1403e0 	mov	x0, x20
    188c:	91002e82 	add	x2, x20, #0xb
    1890:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1894:	79400004 	ldrh	w4, [x0]
    1898:	1400005b 	b	1a04 <_vsnprintf+0x904>
        switch (*format) {
    189c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    18a0:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    18a4:	91000b24 	add	x4, x25, #0x2
    18a8:	17fffe71 	b	126c <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    18ac:	4b1502c1 	sub	w1, w22, w21
    18b0:	b900a3e1 	str	w1, [sp, #160]
    18b4:	17ffff3b 	b	15a0 <_vsnprintf+0x4a0>
    while (*format) {
    18b8:	52800014 	mov	w20, #0x0                   	// #0
    18bc:	17fffea0 	b	133c <_vsnprintf+0x23c>
    18c0:	aa0203f5 	mov	x21, x2
    18c4:	17ffff51 	b	1608 <_vsnprintf+0x508>
                while (l++ < width) {
    18c8:	b940a3e1 	ldr	w1, [sp, #160]
    18cc:	6b18003f 	cmp	w1, w24
    18d0:	11000420 	add	w0, w1, #0x1
    18d4:	54002242 	b.cs	1d1c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    18d8:	51000700 	sub	w0, w24, #0x1
    18dc:	91000776 	add	x22, x27, #0x1
    18e0:	4b010000 	sub	w0, w0, w1
    18e4:	8b160000 	add	x0, x0, x22
    18e8:	f90053e0 	str	x0, [sp, #160]
    18ec:	14000002 	b	18f4 <_vsnprintf+0x7f4>
    18f0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    18f4:	aa1b03e2 	mov	x2, x27
    18f8:	52800400 	mov	w0, #0x20                  	// #32
    18fc:	aa1c03e3 	mov	x3, x28
    1900:	aa1a03e1 	mov	x1, x26
    1904:	d63f0260 	blr	x19
    1908:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    190c:	f94053e0 	ldr	x0, [sp, #160]
    1910:	eb16001f 	cmp	x0, x22
    1914:	54fffee1 	b.ne	18f0 <_vsnprintf+0x7f0>  // b.any
    1918:	394002a8 	ldrb	w8, [x21]
    191c:	11000700 	add	w0, w24, #0x1
    1920:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1924:	2a0803e0 	mov	w0, w8
    1928:	35ffe528 	cbnz	w8, 15cc <_vsnprintf+0x4cc>
                while (l++ < width) {
    192c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    1930:	aa1503fb 	mov	x27, x21
    1934:	17ffff38 	b	1614 <_vsnprintf+0x514>
                while (l++ < width) {
    1938:	7100071f 	cmp	w24, #0x1
    193c:	54001ec9 	b.ls	1d14 <_vsnprintf+0xc14>  // b.plast
    1940:	51000b05 	sub	w5, w24, #0x2
    1944:	91000776 	add	x22, x27, #0x1
    1948:	8b0502d5 	add	x21, x22, x5
    194c:	14000002 	b	1954 <_vsnprintf+0x854>
    1950:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1954:	aa1b03e2 	mov	x2, x27
    1958:	aa1c03e3 	mov	x3, x28
    195c:	aa1a03e1 	mov	x1, x26
    1960:	52800400 	mov	w0, #0x20                  	// #32
    1964:	d63f0260 	blr	x19
    1968:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    196c:	eb1502df 	cmp	x22, x21
    1970:	54ffff01 	b.ne	1950 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1974:	b9407be0 	ldr	w0, [sp, #120]
    1978:	37f802a0 	tbnz	w0, #31, 19cc <_vsnprintf+0x8cc>
    197c:	91002e82 	add	x2, x20, #0xb
    1980:	aa1403e0 	mov	x0, x20
    1984:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1988:	39400000 	ldrb	w0, [x0]
    198c:	aa1503e2 	mov	x2, x21
    1990:	910006bb 	add	x27, x21, #0x1
    1994:	aa1c03e3 	mov	x3, x28
    1998:	aa1a03e1 	mov	x1, x26
    199c:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    19a0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    19a4:	17fffdff 	b	11a0 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    19a8:	b9407be0 	ldr	w0, [sp, #120]
    19ac:	11002002 	add	w2, w0, #0x8
    19b0:	7100005f 	cmp	w2, #0x0
    19b4:	5400058d 	b.le	1a64 <_vsnprintf+0x964>
    19b8:	91002e84 	add	x4, x20, #0xb
    19bc:	aa1403e0 	mov	x0, x20
    19c0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19c4:	b9007be2 	str	w2, [sp, #120]
    19c8:	17ffffa0 	b	1848 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    19cc:	b9407be0 	ldr	w0, [sp, #120]
    19d0:	11002002 	add	w2, w0, #0x8
    19d4:	7100005f 	cmp	w2, #0x0
    19d8:	540016ed 	b.le	1cb4 <_vsnprintf+0xbb4>
    19dc:	91002e84 	add	x4, x20, #0xb
    19e0:	aa1403e0 	mov	x0, x20
    19e4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19e8:	b9007be2 	str	w2, [sp, #120]
    19ec:	17ffffe7 	b	1988 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    19f0:	37f81220 	tbnz	w0, #31, 1c34 <_vsnprintf+0xb34>
    19f4:	91002e82 	add	x2, x20, #0xb
    19f8:	aa1403e0 	mov	x0, x20
    19fc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a00:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1a04:	2a1703e7 	mov	w7, w23
    1a08:	2a0403e4 	mov	w4, w4
    1a0c:	b9000be6 	str	w6, [sp, #8]
    1a10:	aa0803e6 	mov	x6, x8
    1a14:	b90003f8 	str	w24, [sp]
    1a18:	aa1b03e2 	mov	x2, x27
    1a1c:	52800005 	mov	w5, #0x0                   	// #0
    1a20:	17ffff42 	b	1728 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1a24:	b9407be0 	ldr	w0, [sp, #120]
    1a28:	11002002 	add	w2, w0, #0x8
    1a2c:	7100005f 	cmp	w2, #0x0
    1a30:	5400138d 	b.le	1ca0 <_vsnprintf+0xba0>
    1a34:	91002e84 	add	x4, x20, #0xb
    1a38:	aa1403e0 	mov	x0, x20
    1a3c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a40:	b9007be2 	str	w2, [sp, #120]
    1a44:	17fffeab 	b	14f0 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1a48:	37f81080 	tbnz	w0, #31, 1c58 <_vsnprintf+0xb58>
    1a4c:	91002e82 	add	x2, x20, #0xb
    1a50:	aa1403e0 	mov	x0, x20
    1a54:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1a58:	39400005 	ldrb	w5, [x0]
    1a5c:	2a0503e4 	mov	w4, w5
    1a60:	17ffff2b 	b	170c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    1a64:	f94047e1 	ldr	x1, [sp, #136]
    1a68:	b9407be0 	ldr	w0, [sp, #120]
    1a6c:	b9007be2 	str	w2, [sp, #120]
    1a70:	8b20c020 	add	x0, x1, w0, sxtw
    1a74:	17ffff75 	b	1848 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    1a78:	f94047e1 	ldr	x1, [sp, #136]
    1a7c:	b9407be0 	ldr	w0, [sp, #120]
    1a80:	b9007be2 	str	w2, [sp, #120]
    1a84:	8b20c020 	add	x0, x1, w0, sxtw
    1a88:	17fffeb6 	b	1560 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1a8c:	f94047e1 	ldr	x1, [sp, #136]
    1a90:	b9407be0 	ldr	w0, [sp, #120]
    1a94:	b9007be2 	str	w2, [sp, #120]
    1a98:	8b20c020 	add	x0, x1, w0, sxtw
    1a9c:	17fffe80 	b	149c <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1aa0:	f9404be1 	ldr	x1, [sp, #144]
    1aa4:	b940abe0 	ldr	w0, [sp, #168]
    1aa8:	b900abe2 	str	w2, [sp, #168]
    1aac:	8b20c020 	add	x0, x1, w0, sxtw
    1ab0:	17fffe50 	b	13f0 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1ab4:	f9404be1 	ldr	x1, [sp, #144]
    1ab8:	b940abe0 	ldr	w0, [sp, #168]
    1abc:	b900abe2 	str	w2, [sp, #168]
    1ac0:	8b20c020 	add	x0, x1, w0, sxtw
    1ac4:	17fffe5d 	b	1438 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1ac8:	121c74c6 	and	w6, w6, #0xfffffff3
    1acc:	d2800108 	mov	x8, #0x8                   	// #8
    1ad0:	17fffefa 	b	16b8 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1ad4:	37f807e0 	tbnz	w0, #31, 1bd0 <_vsnprintf+0xad0>
    1ad8:	91003e82 	add	x2, x20, #0xf
    1adc:	aa1403e0 	mov	x0, x20
    1ae0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1ae4:	2a1703e7 	mov	w7, w23
    1ae8:	aa1b03e2 	mov	x2, x27
    1aec:	f9400004 	ldr	x4, [x0]
    1af0:	b90003f8 	str	w24, [sp]
    1af4:	b9000be6 	str	w6, [sp, #8]
    1af8:	aa0803e6 	mov	x6, x8
    1afc:	17fffe6f 	b	14b8 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1b00:	37f80560 	tbnz	w0, #31, 1bac <_vsnprintf+0xaac>
    1b04:	91003e82 	add	x2, x20, #0xf
    1b08:	aa1403e0 	mov	x0, x20
    1b0c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b10:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1b14:	2a1703e7 	mov	w7, w23
    1b18:	aa1b03e2 	mov	x2, x27
    1b1c:	b90003f8 	str	w24, [sp]
    1b20:	f10000bf 	cmp	x5, #0x0
    1b24:	b9000be6 	str	w6, [sp, #8]
    1b28:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1b2c:	aa0803e6 	mov	x6, x8
    1b30:	d37ffca5 	lsr	x5, x5, #63
    1b34:	17fffe62 	b	14bc <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1b38:	d2800208 	mov	x8, #0x10                  	// #16
    1b3c:	17fffedb 	b	16a8 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    1b40:	37f80c40 	tbnz	w0, #31, 1cc8 <_vsnprintf+0xbc8>
    1b44:	91003e82 	add	x2, x20, #0xf
    1b48:	aa1403e0 	mov	x0, x20
    1b4c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b50:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1b54:	2a1703e7 	mov	w7, w23
    1b58:	aa1b03e2 	mov	x2, x27
    1b5c:	b90003f8 	str	w24, [sp]
    1b60:	f10000bf 	cmp	x5, #0x0
    1b64:	b9000be6 	str	w6, [sp, #8]
    1b68:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1b6c:	aa0803e6 	mov	x6, x8
    1b70:	d37ffca5 	lsr	x5, x5, #63
    1b74:	17fffeed 	b	1728 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1b78:	37f80820 	tbnz	w0, #31, 1c7c <_vsnprintf+0xb7c>
    1b7c:	91003e82 	add	x2, x20, #0xf
    1b80:	aa1403e0 	mov	x0, x20
    1b84:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1b88:	2a1703e7 	mov	w7, w23
    1b8c:	f9400004 	ldr	x4, [x0]
    1b90:	b90003f8 	str	w24, [sp]
    1b94:	b9000be6 	str	w6, [sp, #8]
    1b98:	aa0803e6 	mov	x6, x8
    1b9c:	17ffff9f 	b	1a18 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1ba0:	121c74c6 	and	w6, w6, #0xfffffff3
    1ba4:	d2800048 	mov	x8, #0x2                   	// #2
    1ba8:	17fffec4 	b	16b8 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1bac:	b9407be0 	ldr	w0, [sp, #120]
    1bb0:	11002002 	add	w2, w0, #0x8
    1bb4:	7100005f 	cmp	w2, #0x0
    1bb8:	54000a4d 	b.le	1d00 <_vsnprintf+0xc00>
    1bbc:	91003e84 	add	x4, x20, #0xf
    1bc0:	aa1403e0 	mov	x0, x20
    1bc4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bc8:	b9007be2 	str	w2, [sp, #120]
    1bcc:	17ffffd1 	b	1b10 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1bd0:	b9407be0 	ldr	w0, [sp, #120]
    1bd4:	11002002 	add	w2, w0, #0x8
    1bd8:	7100005f 	cmp	w2, #0x0
    1bdc:	5400088d 	b.le	1cec <_vsnprintf+0xbec>
    1be0:	91003e84 	add	x4, x20, #0xf
    1be4:	aa1403e0 	mov	x0, x20
    1be8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1bec:	b9007be2 	str	w2, [sp, #120]
    1bf0:	17ffffbd 	b	1ae4 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1bf4:	37f80d00 	tbnz	w0, #31, 1d94 <_vsnprintf+0xc94>
    1bf8:	aa1403e0 	mov	x0, x20
    1bfc:	91002e82 	add	x2, x20, #0xb
    1c00:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1c04:	b9400004 	ldr	w4, [x0]
    1c08:	17ffff7f 	b	1a04 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1c0c:	37f80b20 	tbnz	w0, #31, 1d70 <_vsnprintf+0xc70>
    1c10:	91002e82 	add	x2, x20, #0xb
    1c14:	aa1403e0 	mov	x0, x20
    1c18:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1c1c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1c20:	710000bf 	cmp	w5, #0x0
    1c24:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1c28:	17fffeb9 	b	170c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1c2c:	b900a3ff 	str	wzr, [sp, #160]
    1c30:	17fffe5c 	b	15a0 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c34:	b9407be0 	ldr	w0, [sp, #120]
    1c38:	11002002 	add	w2, w0, #0x8
    1c3c:	7100005f 	cmp	w2, #0x0
    1c40:	54000bed 	b.le	1dbc <_vsnprintf+0xcbc>
    1c44:	91002e84 	add	x4, x20, #0xb
    1c48:	aa1403e0 	mov	x0, x20
    1c4c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c50:	b9007be2 	str	w2, [sp, #120]
    1c54:	17ffff6b 	b	1a00 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c58:	b9407be0 	ldr	w0, [sp, #120]
    1c5c:	11002002 	add	w2, w0, #0x8
    1c60:	7100005f 	cmp	w2, #0x0
    1c64:	54000b6d 	b.le	1dd0 <_vsnprintf+0xcd0>
    1c68:	91002e84 	add	x4, x20, #0xb
    1c6c:	aa1403e0 	mov	x0, x20
    1c70:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c74:	b9007be2 	str	w2, [sp, #120]
    1c78:	17ffff78 	b	1a58 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1c7c:	b9407be0 	ldr	w0, [sp, #120]
    1c80:	11002002 	add	w2, w0, #0x8
    1c84:	7100005f 	cmp	w2, #0x0
    1c88:	54000aed 	b.le	1de4 <_vsnprintf+0xce4>
    1c8c:	91003e84 	add	x4, x20, #0xf
    1c90:	aa1403e0 	mov	x0, x20
    1c94:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c98:	b9007be2 	str	w2, [sp, #120]
    1c9c:	17ffffbb 	b	1b88 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1ca0:	f94047e1 	ldr	x1, [sp, #136]
    1ca4:	b9407be0 	ldr	w0, [sp, #120]
    1ca8:	b9007be2 	str	w2, [sp, #120]
    1cac:	8b20c020 	add	x0, x1, w0, sxtw
    1cb0:	17fffe10 	b	14f0 <_vsnprintf+0x3f0>
    1cb4:	f94047e1 	ldr	x1, [sp, #136]
    1cb8:	b9407be0 	ldr	w0, [sp, #120]
    1cbc:	b9007be2 	str	w2, [sp, #120]
    1cc0:	8b20c020 	add	x0, x1, w0, sxtw
    1cc4:	17ffff31 	b	1988 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1cc8:	b9407be0 	ldr	w0, [sp, #120]
    1ccc:	11002002 	add	w2, w0, #0x8
    1cd0:	7100005f 	cmp	w2, #0x0
    1cd4:	5400092d 	b.le	1df8 <_vsnprintf+0xcf8>
    1cd8:	91003e84 	add	x4, x20, #0xf
    1cdc:	aa1403e0 	mov	x0, x20
    1ce0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ce4:	b9007be2 	str	w2, [sp, #120]
    1ce8:	17ffff9a 	b	1b50 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1cec:	f94047e1 	ldr	x1, [sp, #136]
    1cf0:	b9407be0 	ldr	w0, [sp, #120]
    1cf4:	b9007be2 	str	w2, [sp, #120]
    1cf8:	8b20c020 	add	x0, x1, w0, sxtw
    1cfc:	17ffff7a 	b	1ae4 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1d00:	f94047e1 	ldr	x1, [sp, #136]
    1d04:	b9407be0 	ldr	w0, [sp, #120]
    1d08:	b9007be2 	str	w2, [sp, #120]
    1d0c:	8b20c020 	add	x0, x1, w0, sxtw
    1d10:	17ffff80 	b	1b10 <_vsnprintf+0xa10>
                while (l++ < width) {
    1d14:	aa1b03f5 	mov	x21, x27
    1d18:	17ffff17 	b	1974 <_vsnprintf+0x874>
                while (l++ < width) {
    1d1c:	b900a3e0 	str	w0, [sp, #160]
    1d20:	17ffff01 	b	1924 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1d24:	b9407be0 	ldr	w0, [sp, #120]
    1d28:	11002002 	add	w2, w0, #0x8
    1d2c:	7100005f 	cmp	w2, #0x0
    1d30:	5400078d 	b.le	1e20 <_vsnprintf+0xd20>
    1d34:	aa1403e0 	mov	x0, x20
    1d38:	91002e84 	add	x4, x20, #0xb
    1d3c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d40:	b9007be2 	str	w2, [sp, #120]
    1d44:	79400004 	ldrh	w4, [x0]
    1d48:	17ffff2f 	b	1a04 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1d4c:	b9407be0 	ldr	w0, [sp, #120]
    1d50:	11002002 	add	w2, w0, #0x8
    1d54:	7100005f 	cmp	w2, #0x0
    1d58:	540005ad 	b.le	1e0c <_vsnprintf+0xd0c>
    1d5c:	91002e84 	add	x4, x20, #0xb
    1d60:	aa1403e0 	mov	x0, x20
    1d64:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d68:	b9007be2 	str	w2, [sp, #120]
    1d6c:	17fffe64 	b	16fc <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1d70:	b9407be0 	ldr	w0, [sp, #120]
    1d74:	11002002 	add	w2, w0, #0x8
    1d78:	7100005f 	cmp	w2, #0x0
    1d7c:	540005ed 	b.le	1e38 <_vsnprintf+0xd38>
    1d80:	91002e84 	add	x4, x20, #0xb
    1d84:	aa1403e0 	mov	x0, x20
    1d88:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1d8c:	b9007be2 	str	w2, [sp, #120]
    1d90:	17ffffa3 	b	1c1c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1d94:	b9407be0 	ldr	w0, [sp, #120]
    1d98:	11002002 	add	w2, w0, #0x8
    1d9c:	7100005f 	cmp	w2, #0x0
    1da0:	5400056d 	b.le	1e4c <_vsnprintf+0xd4c>
    1da4:	aa1403e0 	mov	x0, x20
    1da8:	91002e84 	add	x4, x20, #0xb
    1dac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1db0:	b9007be2 	str	w2, [sp, #120]
    1db4:	b9400004 	ldr	w4, [x0]
    1db8:	17ffff13 	b	1a04 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1dbc:	f94047e1 	ldr	x1, [sp, #136]
    1dc0:	b9407be0 	ldr	w0, [sp, #120]
    1dc4:	b9007be2 	str	w2, [sp, #120]
    1dc8:	8b20c020 	add	x0, x1, w0, sxtw
    1dcc:	17ffff0d 	b	1a00 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1dd0:	f94047e1 	ldr	x1, [sp, #136]
    1dd4:	b9407be0 	ldr	w0, [sp, #120]
    1dd8:	b9007be2 	str	w2, [sp, #120]
    1ddc:	8b20c020 	add	x0, x1, w0, sxtw
    1de0:	17ffff1e 	b	1a58 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1de4:	f94047e1 	ldr	x1, [sp, #136]
    1de8:	b9407be0 	ldr	w0, [sp, #120]
    1dec:	b9007be2 	str	w2, [sp, #120]
    1df0:	8b20c020 	add	x0, x1, w0, sxtw
    1df4:	17ffff65 	b	1b88 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    1df8:	f94047e1 	ldr	x1, [sp, #136]
    1dfc:	b9407be0 	ldr	w0, [sp, #120]
    1e00:	b9007be2 	str	w2, [sp, #120]
    1e04:	8b20c020 	add	x0, x1, w0, sxtw
    1e08:	17ffff52 	b	1b50 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1e0c:	f94047e1 	ldr	x1, [sp, #136]
    1e10:	b9407be0 	ldr	w0, [sp, #120]
    1e14:	b9007be2 	str	w2, [sp, #120]
    1e18:	8b20c020 	add	x0, x1, w0, sxtw
    1e1c:	17fffe38 	b	16fc <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1e20:	f94047e1 	ldr	x1, [sp, #136]
    1e24:	b9407be0 	ldr	w0, [sp, #120]
    1e28:	b9007be2 	str	w2, [sp, #120]
    1e2c:	8b20c020 	add	x0, x1, w0, sxtw
    1e30:	79400004 	ldrh	w4, [x0]
    1e34:	17fffef4 	b	1a04 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1e38:	f94047e1 	ldr	x1, [sp, #136]
    1e3c:	b9407be0 	ldr	w0, [sp, #120]
    1e40:	b9007be2 	str	w2, [sp, #120]
    1e44:	8b20c020 	add	x0, x1, w0, sxtw
    1e48:	17ffff75 	b	1c1c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1e4c:	f94047e1 	ldr	x1, [sp, #136]
    1e50:	b9407be0 	ldr	w0, [sp, #120]
    1e54:	b9007be2 	str	w2, [sp, #120]
    1e58:	8b20c020 	add	x0, x1, w0, sxtw
    1e5c:	b9400004 	ldr	w4, [x0]
    1e60:	17fffee9 	b	1a04 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    1e64:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    1e68:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    1e6c:	12001c42 	and	w2, w2, #0xff
    1e70:	7100245f 	cmp	w2, #0x9
    1e74:	54ffa2a8 	b.hi	12c8 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e78:	52800142 	mov	w2, #0xa                   	// #10
    1e7c:	d503201f 	nop
    1e80:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    1e84:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e88:	aa0803f9 	mov	x25, x8
    1e8c:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    1e90:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1e94:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    1e98:	12001c84 	and	w4, w4, #0xff
    1e9c:	7100249f 	cmp	w4, #0x9
    1ea0:	54ffff09 	b.ls	1e80 <_vsnprintf+0xd80>  // b.plast
    1ea4:	17fffd09 	b	12c8 <_vsnprintf+0x1c8>
        switch (*format) {
    1ea8:	aa1903e4 	mov	x4, x25
    1eac:	17fffcf0 	b	126c <_vsnprintf+0x16c>

0000000000001eb0 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    1eb0:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    1eb4:	910003fd 	mov	x29, sp
    1eb8:	f9000bf3 	str	x19, [sp, #16]
    1ebc:	aa0003f3 	mov	x19, x0
    1ec0:	3d801fe0 	str	q0, [sp, #112]
    1ec4:	3d8023e1 	str	q1, [sp, #128]
    1ec8:	3d8027e2 	str	q2, [sp, #144]
    1ecc:	3d802be3 	str	q3, [sp, #160]
    1ed0:	3d802fe4 	str	q4, [sp, #176]
    1ed4:	3d8033e5 	str	q5, [sp, #192]
    1ed8:	3d8037e6 	str	q6, [sp, #208]
    1edc:	3d803be7 	str	q7, [sp, #224]
    1ee0:	a90f8be1 	stp	x1, x2, [sp, #248]
    1ee4:	a91093e3 	stp	x3, x4, [sp, #264]
    1ee8:	a9119be5 	stp	x5, x6, [sp, #280]
    1eec:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    1ef0:	97fff968 	bl	490 <init_uart_mmio>
    1ef4:	72001c1f 	tst	w0, #0xff
    1ef8:	540002e0 	b.eq	1f54 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    1efc:	9103c3e0 	add	x0, sp, #0xf0
    1f00:	9104c3e3 	add	x3, sp, #0x130
    1f04:	9104c3e4 	add	x4, sp, #0x130
    1f08:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    1f0c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    1f10:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1f14:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    1f18:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1f1c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    1f20:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    1f24:	90000000 	adrp	x0, 1000 <_ftoa+0x300>
    1f28:	91034000 	add	x0, x0, #0xd0
    1f2c:	910123e1 	add	x1, sp, #0x48
    1f30:	a94527e8 	ldp	x8, x9, [sp, #80]
    1f34:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    1f38:	a9461fe6 	ldp	x6, x7, [sp, #96]
    1f3c:	a90227e8 	stp	x8, x9, [sp, #32]
    1f40:	a9031fe6 	stp	x6, x7, [sp, #48]
    1f44:	97fffc6f 	bl	1100 <_vsnprintf>
    va_end(va);
    return ret;
}
    1f48:	f9400bf3 	ldr	x19, [sp, #16]
    1f4c:	a8d37bfd 	ldp	x29, x30, [sp], #304
    1f50:	d65f03c0 	ret
        return -1;
    1f54:	12800000 	mov	w0, #0xffffffff            	// #-1
    1f58:	17fffffc 	b	1f48 <printf+0x98>
    1f5c:	d503201f 	nop

0000000000001f60 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    1f60:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1f64:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    1f68:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    1f6c:	910003fd 	mov	x29, sp
    va_start(va, format);
    1f70:	910343eb 	add	x11, sp, #0xd0
    1f74:	910403ea 	add	x10, sp, #0x100
    1f78:	a9032bea 	stp	x10, x10, [sp, #48]
{
    1f7c:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f80:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    1f84:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f88:	f0ffffe0 	adrp	x0, 0 <main>
    1f8c:	91154000 	add	x0, x0, #0x550
    va_start(va, format);
    1f90:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1f94:	a94337ec 	ldp	x12, x13, [sp, #48]
    1f98:	a90137ec 	stp	x12, x13, [sp, #16]
    1f9c:	a94427e8 	ldp	x8, x9, [sp, #64]
    1fa0:	a90227e8 	stp	x8, x9, [sp, #32]
{
    1fa4:	3d8017e0 	str	q0, [sp, #80]
    1fa8:	3d801be1 	str	q1, [sp, #96]
    1fac:	3d801fe2 	str	q2, [sp, #112]
    1fb0:	3d8023e3 	str	q3, [sp, #128]
    1fb4:	3d8027e4 	str	q4, [sp, #144]
    1fb8:	3d802be5 	str	q5, [sp, #160]
    1fbc:	3d802fe6 	str	q6, [sp, #176]
    1fc0:	3d8033e7 	str	q7, [sp, #192]
    1fc4:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1fc8:	aa0a03e3 	mov	x3, x10
    1fcc:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    1fd0:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1fd4:	910043e4 	add	x4, sp, #0x10
{
    1fd8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    1fdc:	97fffc49 	bl	1100 <_vsnprintf>
    va_end(va);
    return ret;
}
    1fe0:	a8d07bfd 	ldp	x29, x30, [sp], #256
    1fe4:	d65f03c0 	ret
    1fe8:	d503201f 	nop
    1fec:	d503201f 	nop

0000000000001ff0 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    1ff0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    1ff4:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    1ff8:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    1ffc:	910003fd 	mov	x29, sp
    va_start(va, format);
    2000:	910343ea 	add	x10, sp, #0xd0
    2004:	910403e8 	add	x8, sp, #0x100
    2008:	a90323e8 	stp	x8, x8, [sp, #48]
{
    200c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2010:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    2014:	f90023ea 	str	x10, [sp, #64]
{
    2018:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    201c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2020:	aa0803e2 	mov	x2, x8
    2024:	a94337ec 	ldp	x12, x13, [sp, #48]
    2028:	d0ffffe0 	adrp	x0, 0 <main>
    202c:	a94427e8 	ldp	x8, x9, [sp, #64]
    2030:	91154000 	add	x0, x0, #0x550
    2034:	a90137ec 	stp	x12, x13, [sp, #16]
    2038:	a90227e8 	stp	x8, x9, [sp, #32]
{
    203c:	3d8017e0 	str	q0, [sp, #80]
    2040:	3d801be1 	str	q1, [sp, #96]
    2044:	3d801fe2 	str	q2, [sp, #112]
    2048:	3d8023e3 	str	q3, [sp, #128]
    204c:	3d8027e4 	str	q4, [sp, #144]
    2050:	3d802be5 	str	q5, [sp, #160]
    2054:	3d802fe6 	str	q6, [sp, #176]
    2058:	3d8033e7 	str	q7, [sp, #192]
    205c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2060:	910043e4 	add	x4, sp, #0x10
    2064:	aa0a03e3 	mov	x3, x10
{
    2068:	a90e9be5 	stp	x5, x6, [sp, #232]
    206c:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2070:	97fffc24 	bl	1100 <_vsnprintf>
    va_end(va);
    return ret;
}
    2074:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2078:	d65f03c0 	ret
    207c:	d503201f 	nop

0000000000002080 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    2080:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2084:	aa0003e3 	mov	x3, x0
    2088:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    208c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2090:	a9402428 	ldp	x8, x9, [x1]
    2094:	910043e4 	add	x4, sp, #0x10
    2098:	a9411c26 	ldp	x6, x7, [x1, #16]
    209c:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0x300>
    20a0:	9100e3e1 	add	x1, sp, #0x38
    20a4:	91034000 	add	x0, x0, #0xd0
    20a8:	a90127e8 	stp	x8, x9, [sp, #16]
    20ac:	a9021fe6 	stp	x6, x7, [sp, #32]
    20b0:	97fffc14 	bl	1100 <_vsnprintf>
}
    20b4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    20b8:	d65f03c0 	ret
    20bc:	d503201f 	nop

00000000000020c0 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    20c0:	aa0303e4 	mov	x4, x3
    20c4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    20c8:	aa0103e5 	mov	x5, x1
    20cc:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    20d0:	a9402488 	ldp	x8, x9, [x4]
    20d4:	aa0003e1 	mov	x1, x0
    20d8:	a9411c86 	ldp	x6, x7, [x4, #16]
    20dc:	aa0203e3 	mov	x3, x2
    20e0:	910043e4 	add	x4, sp, #0x10
    20e4:	aa0503e2 	mov	x2, x5
    20e8:	d0ffffe0 	adrp	x0, 0 <main>
    20ec:	91154000 	add	x0, x0, #0x550
    20f0:	a90127e8 	stp	x8, x9, [sp, #16]
    20f4:	a9021fe6 	stp	x6, x7, [sp, #32]
    20f8:	97fffc02 	bl	1100 <_vsnprintf>
}
    20fc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2100:	d65f03c0 	ret
    2104:	d503201f 	nop
    2108:	d503201f 	nop
    210c:	d503201f 	nop

0000000000002110 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    2110:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    2114:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    2118:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    211c:	910003fd 	mov	x29, sp
    va_start(va, format);
    2120:	910443ea 	add	x10, sp, #0x110
    2124:	910383eb 	add	x11, sp, #0xe0
    2128:	f90023ea 	str	x10, [sp, #64]
{
    212c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    2130:	910443e2 	add	x2, sp, #0x110
    2134:	f90027e2 	str	x2, [sp, #72]
    2138:	f9002beb 	str	x11, [sp, #80]
{
    213c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    2140:	290b23e9 	stp	w9, w8, [sp, #88]
{
    2144:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2148:	a9443fee 	ldp	x14, x15, [sp, #64]
    214c:	9100c3e1 	add	x1, sp, #0x30
    2150:	a94527e8 	ldp	x8, x9, [sp, #80]
    2154:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2158:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0x300>
    215c:	91038000 	add	x0, x0, #0xe0
    2160:	a9013fee 	stp	x14, x15, [sp, #16]
    2164:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    2168:	f9001bec 	str	x12, [sp, #48]
    216c:	f9001feb 	str	x11, [sp, #56]
{
    2170:	3d801be0 	str	q0, [sp, #96]
    2174:	3d801fe1 	str	q1, [sp, #112]
    2178:	3d8023e2 	str	q2, [sp, #128]
    217c:	3d8027e3 	str	q3, [sp, #144]
    2180:	3d802be4 	str	q4, [sp, #160]
    2184:	3d802fe5 	str	q5, [sp, #176]
    2188:	3d8033e6 	str	q6, [sp, #192]
    218c:	3d8037e7 	str	q7, [sp, #208]
    2190:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2194:	910043e4 	add	x4, sp, #0x10
    2198:	aa0a03e3 	mov	x3, x10
{
    219c:	a90f9be5 	stp	x5, x6, [sp, #248]
    21a0:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    21a4:	97fffbd7 	bl	1100 <_vsnprintf>
    va_end(va);
    return ret;
    21a8:	a8d17bfd 	ldp	x29, x30, [sp], #272
    21ac:	d65f03c0 	ret

00000000000021b0 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    21b0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    21b4:	910003fd 	mov	x29, sp
    21b8:	a90153f3 	stp	x19, x20, [sp, #16]
    21bc:	a9025bf5 	stp	x21, x22, [sp, #32]
    21c0:	2a0103f6 	mov	w22, w1
    21c4:	a90363f7 	stp	x23, x24, [sp, #48]
    21c8:	aa0203f8 	mov	x24, x2
    21cc:	aa0003f7 	mov	x23, x0
    21d0:	a9046bf9 	stp	x25, x26, [sp, #64]
    21d4:	aa0403f9 	mov	x25, x4
    21d8:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    21dc:	d63f0060 	blr	x3
    21e0:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    21e4:	93407c00 	sxtw	x0, w0
    21e8:	9400038e 	bl	3020 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    21ec:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    21f0:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    21f4:	5400022d 	b.le	2238 <spawn+0x88>
    21f8:	52800013 	mov	w19, #0x0                   	// #0
    21fc:	f9002bfb 	str	x27, [sp, #80]
    2200:	5282001b 	mov	w27, #0x1000                	// #4096
    2204:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2208:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    220c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2210:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    2214:	8b33c2a2 	add	x2, x21, w19, sxtw
    2218:	1a9bd084 	csel	w4, w4, w27, le
    221c:	2a1603e1 	mov	w1, w22
    2220:	aa1703e0 	mov	x0, x23
    2224:	d63f0300 	blr	x24
    2228:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    222c:	6b13029f 	cmp	w20, w19
    2230:	54fffecc 	b.gt	2208 <spawn+0x58>
    2234:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    2238:	aa1a03e3 	mov	x3, x26
    223c:	aa1903e2 	mov	x2, x25
    2240:	aa1503e1 	mov	x1, x21
    2244:	d2800004 	mov	x4, #0x0                   	// #0
    2248:	52800020 	mov	w0, #0x1                   	// #1
    224c:	940000b9 	bl	2530 <syscall>
    2250:	2a0003f3 	mov	w19, w0
    free(img);
    2254:	aa1503e0 	mov	x0, x21
    2258:	94000376 	bl	3030 <free>
    return ret;
}
    225c:	2a1303e0 	mov	w0, w19
    2260:	a94153f3 	ldp	x19, x20, [sp, #16]
    2264:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2268:	a94363f7 	ldp	x23, x24, [sp, #48]
    226c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    2270:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2274:	d65f03c0 	ret
    2278:	d503201f 	nop
    227c:	d503201f 	nop

0000000000002280 <thread>:

int thread(void* entry, char* name, char** argv)
{
    2280:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    2284:	aa0203e3 	mov	x3, x2
    2288:	aa0003e1 	mov	x1, x0
    228c:	aa0403e2 	mov	x2, x4
    2290:	52800120 	mov	w0, #0x9                   	// #9
    2294:	d2800004 	mov	x4, #0x0                   	// #0
    2298:	140000a6 	b	2530 <syscall>
    229c:	d503201f 	nop

00000000000022a0 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    22a0:	93407c01 	sxtw	x1, w0
    22a4:	d2800004 	mov	x4, #0x0                   	// #0
    22a8:	d2800003 	mov	x3, #0x0                   	// #0
    22ac:	d2800002 	mov	x2, #0x0                   	// #0
    22b0:	52800040 	mov	w0, #0x2                   	// #2
    22b4:	1400009f 	b	2530 <syscall>
    22b8:	d503201f 	nop
    22bc:	d503201f 	nop

00000000000022c0 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    22c0:	2a0003e1 	mov	w1, w0
    22c4:	d2800004 	mov	x4, #0x0                   	// #0
    22c8:	d2800003 	mov	x3, #0x0                   	// #0
    22cc:	d2800002 	mov	x2, #0x0                   	// #0
    22d0:	52800060 	mov	w0, #0x3                   	// #3
    22d4:	14000097 	b	2530 <syscall>
    22d8:	d503201f 	nop
    22dc:	d503201f 	nop

00000000000022e0 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    22e0:	93407c01 	sxtw	x1, w0
    22e4:	d2800004 	mov	x4, #0x0                   	// #0
    22e8:	d2800003 	mov	x3, #0x0                   	// #0
    22ec:	d2800002 	mov	x2, #0x0                   	// #0
    22f0:	52800180 	mov	w0, #0xc                   	// #12
    22f4:	1400008f 	b	2530 <syscall>
    22f8:	d503201f 	nop
    22fc:	d503201f 	nop

0000000000002300 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    2300:	aa0003e1 	mov	x1, x0
    2304:	d2800004 	mov	x4, #0x0                   	// #0
    2308:	d2800003 	mov	x3, #0x0                   	// #0
    230c:	d2800002 	mov	x2, #0x0                   	// #0
    2310:	528000a0 	mov	w0, #0x5                   	// #5
    2314:	14000087 	b	2530 <syscall>
    2318:	d503201f 	nop
    231c:	d503201f 	nop

0000000000002320 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    2320:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    2324:	aa0203e3 	mov	x3, x2
    2328:	aa0003e1 	mov	x1, x0
    232c:	528000c0 	mov	w0, #0x6                   	// #6
    2330:	93407c82 	sxtw	x2, w4
    2334:	d2800004 	mov	x4, #0x0                   	// #0
    2338:	1400007e 	b	2530 <syscall>
    233c:	d503201f 	nop

0000000000002340 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    2340:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    2344:	d2800004 	mov	x4, #0x0                   	// #0
    2348:	aa0003e1 	mov	x1, x0
    234c:	d2800003 	mov	x3, #0x0                   	// #0
    2350:	528000e0 	mov	w0, #0x7                   	// #7
    2354:	14000077 	b	2530 <syscall>
    2358:	d503201f 	nop
    235c:	d503201f 	nop

0000000000002360 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    2360:	aa0003e1 	mov	x1, x0
    2364:	d2800004 	mov	x4, #0x0                   	// #0
    2368:	d2800003 	mov	x3, #0x0                   	// #0
    236c:	d2800002 	mov	x2, #0x0                   	// #0
    2370:	52800100 	mov	w0, #0x8                   	// #8
    2374:	1400006f 	b	2530 <syscall>
    2378:	d503201f 	nop
    237c:	d503201f 	nop

0000000000002380 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    2380:	aa0003e2 	mov	x2, x0
    2384:	d2800004 	mov	x4, #0x0                   	// #0
    2388:	d2800003 	mov	x3, #0x0                   	// #0
    238c:	d2800061 	mov	x1, #0x3                   	// #3
    2390:	52800140 	mov	w0, #0xa                   	// #10
    2394:	14000067 	b	2530 <syscall>
    2398:	d503201f 	nop
    239c:	d503201f 	nop

00000000000023a0 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    23a0:	aa0003e2 	mov	x2, x0
    23a4:	d2800004 	mov	x4, #0x0                   	// #0
    23a8:	d2800003 	mov	x3, #0x0                   	// #0
    23ac:	d2800021 	mov	x1, #0x1                   	// #1
    23b0:	52800140 	mov	w0, #0xa                   	// #10
    23b4:	1400005f 	b	2530 <syscall>
    23b8:	d503201f 	nop
    23bc:	d503201f 	nop

00000000000023c0 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    23c0:	d2800004 	mov	x4, #0x0                   	// #0
    23c4:	d2800003 	mov	x3, #0x0                   	// #0
    23c8:	d2800002 	mov	x2, #0x0                   	// #0
    23cc:	d2800041 	mov	x1, #0x2                   	// #2
    23d0:	52800140 	mov	w0, #0xa                   	// #10
    23d4:	14000057 	b	2530 <syscall>
    23d8:	d503201f 	nop
    23dc:	d503201f 	nop

00000000000023e0 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    23e0:	d2800004 	mov	x4, #0x0                   	// #0
    23e4:	d2800003 	mov	x3, #0x0                   	// #0
    23e8:	d2800002 	mov	x2, #0x0                   	// #0
    23ec:	d2800081 	mov	x1, #0x4                   	// #4
    23f0:	52800140 	mov	w0, #0xa                   	// #10
    23f4:	1400004f 	b	2530 <syscall>
    23f8:	d503201f 	nop
    23fc:	d503201f 	nop

0000000000002400 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    2400:	d2800004 	mov	x4, #0x0                   	// #0
    2404:	d2800003 	mov	x3, #0x0                   	// #0
    2408:	d2800002 	mov	x2, #0x0                   	// #0
    240c:	d28000a1 	mov	x1, #0x5                   	// #5
    2410:	52800140 	mov	w0, #0xa                   	// #10
    2414:	14000047 	b	2530 <syscall>
    2418:	d503201f 	nop
    241c:	d503201f 	nop

0000000000002420 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    2420:	d2800004 	mov	x4, #0x0                   	// #0
    2424:	d2800003 	mov	x3, #0x0                   	// #0
    2428:	d2800002 	mov	x2, #0x0                   	// #0
    242c:	d28000c1 	mov	x1, #0x6                   	// #6
    2430:	52800140 	mov	w0, #0xa                   	// #10
    2434:	1400003f 	b	2530 <syscall>
    2438:	d503201f 	nop
    243c:	d503201f 	nop

0000000000002440 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    2440:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    2444:	92401c64 	and	x4, x3, #0xff
    2448:	aa0103e2 	mov	x2, x1
    244c:	aa0003e1 	mov	x1, x0
    2450:	93407ca3 	sxtw	x3, w5
    2454:	52800080 	mov	w0, #0x4                   	// #4
    2458:	14000036 	b	2530 <syscall>
    245c:	d503201f 	nop

0000000000002460 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    2460:	93407c22 	sxtw	x2, w1
    2464:	d2800004 	mov	x4, #0x0                   	// #0
    2468:	93407c01 	sxtw	x1, w0
    246c:	d2800003 	mov	x3, #0x0                   	// #0
    2470:	52800160 	mov	w0, #0xb                   	// #11
    2474:	1400002f 	b	2530 <syscall>
    2478:	d503201f 	nop
    247c:	d503201f 	nop

0000000000002480 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    2480:	93407c02 	sxtw	x2, w0
    2484:	d2800004 	mov	x4, #0x0                   	// #0
    2488:	d2800003 	mov	x3, #0x0                   	// #0
    248c:	d2800001 	mov	x1, #0x0                   	// #0
    2490:	528001a0 	mov	w0, #0xd                   	// #13
    2494:	14000027 	b	2530 <syscall>
    2498:	d503201f 	nop
    249c:	d503201f 	nop

00000000000024a0 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    24a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    24a4:	93407c02 	sxtw	x2, w0
    24a8:	d2800004 	mov	x4, #0x0                   	// #0
{
    24ac:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    24b0:	d2800003 	mov	x3, #0x0                   	// #0
    24b4:	d2800021 	mov	x1, #0x1                   	// #1
    24b8:	528001a0 	mov	w0, #0xd                   	// #13
    24bc:	9400001d 	bl	2530 <syscall>
    24c0:	7100001f 	cmp	w0, #0x0
}
    24c4:	1a9f07e0 	cset	w0, ne  // ne = any
    24c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    24cc:	d65f03c0 	ret

00000000000024d0 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    24d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    24d4:	93407c02 	sxtw	x2, w0
    24d8:	d2800004 	mov	x4, #0x0                   	// #0
{
    24dc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    24e0:	d2800003 	mov	x3, #0x0                   	// #0
    24e4:	d2800061 	mov	x1, #0x3                   	// #3
    24e8:	528001a0 	mov	w0, #0xd                   	// #13
    24ec:	94000011 	bl	2530 <syscall>
    24f0:	7100001f 	cmp	w0, #0x0
}
    24f4:	1a9f07e0 	cset	w0, ne  // ne = any
    24f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    24fc:	d65f03c0 	ret

0000000000002500 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    2500:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2504:	93407c02 	sxtw	x2, w0
    2508:	d2800004 	mov	x4, #0x0                   	// #0
{
    250c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2510:	d2800003 	mov	x3, #0x0                   	// #0
    2514:	d2800041 	mov	x1, #0x2                   	// #2
    2518:	528001a0 	mov	w0, #0xd                   	// #13
    251c:	94000005 	bl	2530 <syscall>
    2520:	7100001f 	cmp	w0, #0x0
    2524:	1a9f07e0 	cset	w0, ne  // ne = any
    2528:	a8c17bfd 	ldp	x29, x30, [sp], #16
    252c:	d65f03c0 	ret

0000000000002530 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    2530:	2a0003e5 	mov	w5, w0
    2534:	aa0103e6 	mov	x6, x1
    2538:	aa0203e7 	mov	x7, x2
    253c:	aa0303e8 	mov	x8, x3
    2540:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    2544:	aa0503e0 	mov	x0, x5
    2548:	aa0603e1 	mov	x1, x6
    254c:	aa0703e2 	mov	x2, x7
    2550:	aa0803e3 	mov	x3, x8
    2554:	aa0903e4 	mov	x4, x9
    2558:	d4000001 	svc	#0x0
    255c:	d5033b9f 	dsb	ish
    2560:	d5033fdf 	isb
    2564:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    2568:	2a0503e0 	mov	w0, w5
    256c:	d65f03c0 	ret

0000000000002570 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    2570:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    2574:	7100003f 	cmp	w1, #0x0
{
    2578:	910003fd 	mov	x29, sp
    257c:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    2580:	528000d4 	mov	w20, #0x6                   	// #6
    2584:	1b147c34 	mul	w20, w1, w20
{
    2588:	a9025bf5 	stp	x21, x22, [sp, #32]
    258c:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    2590:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    2594:	5400056d 	b.le	2640 <new_ipc_msg+0xd0>
    2598:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    259c:	2a1403f6 	mov	w22, w20
    25a0:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    25a4:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    25a8:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    25ac:	91000442 	add	x2, x2, #0x1
    25b0:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    25b4:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    25b8:	54ffff8c 	b.gt	25a8 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    25bc:	aa0303e0 	mov	x0, x3
    25c0:	2a1603e1 	mov	w1, w22
    25c4:	9400016f 	bl	2b80 <session_alloc_buf>
    if (buf == NULL) {
    25c8:	b40004c0 	cbz	x0, 2660 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    25cc:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    25d0:	39400001 	ldrb	w1, [x0]
    25d4:	52800182 	mov	w2, #0xc                   	// #12
    25d8:	aa1303e3 	mov	x3, x19
    25dc:	1b057ea5 	mul	w5, w21, w5
    25e0:	121e7421 	and	w1, w1, #0xfffffffc
    25e4:	39000001 	strb	w1, [x0]
    25e8:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    25ec:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    25f0:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    25f4:	b9400064 	ldr	w4, [x3]
    25f8:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    25fc:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    2600:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    2604:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    2608:	b8404461 	ldr	w1, [x3], #4
    260c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    2610:	54ffff01 	b.ne	25f0 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    2614:	39400002 	ldrb	w2, [x0]
    2618:	531c0ea1 	ubfiz	w1, w21, #4, #4
    261c:	321e0021 	orr	w1, w1, #0x4
    2620:	52800163 	mov	w3, #0xb                   	// #11
    2624:	0a030042 	and	w2, w2, w3
    2628:	2a020021 	orr	w1, w1, w2
    262c:	39000001 	strb	w1, [x0]
    return buf;
}
    2630:	a94153f3 	ldp	x19, x20, [sp, #16]
    2634:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2638:	a8c37bfd 	ldp	x29, x30, [sp], #48
    263c:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    2640:	2a1403e1 	mov	w1, w20
    2644:	9400014f 	bl	2b80 <session_alloc_buf>
    if (buf == NULL) {
    2648:	b40000c0 	cbz	x0, 2660 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    264c:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    2650:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    2654:	121e7421 	and	w1, w1, #0xfffffffc
    2658:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    265c:	17ffffee 	b	2614 <new_ipc_msg+0xa4>
        return NULL;
    2660:	d2800000 	mov	x0, #0x0                   	// #0
    2664:	17fffff3 	b	2630 <new_ipc_msg+0xc0>
    2668:	d503201f 	nop
    266c:	d503201f 	nop

0000000000002670 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    2670:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    2674:	2a0103e4 	mov	w4, w1
    2678:	aa0203e1 	mov	x1, x2
    267c:	910003fd 	mov	x29, sp
    2680:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    2684:	39400003 	ldrb	w3, [x0]
    2688:	d3441c63 	ubfx	x3, x3, #4, #4
    268c:	6b04007f 	cmp	w3, w4
    2690:	540003ad 	b.le	2704 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    2694:	528000c5 	mov	w5, #0x6                   	// #6
    2698:	d2800183 	mov	x3, #0xc                   	// #12
    269c:	9b250c84 	smaddl	x4, w4, w5, x3
    26a0:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    26a4:	794004a3 	ldrh	w3, [x5, #2]
    26a8:	37f801e2 	tbnz	w2, #31, 26e4 <ipc_msg_set_nth_arg+0x74>
    26ac:	6b02007f 	cmp	w3, w2
    26b0:	540001a3 	b.cc	26e4 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    26b4:	394010a3 	ldrb	w3, [x5, #4]
    26b8:	37000423 	tbnz	w3, #0, 273c <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    26bc:	78646803 	ldrh	w3, [x0, x4]
    26c0:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    26c4:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    26c8:	b4000301 	cbz	x1, 2728 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    26cc:	121f7863 	and	w3, w3, #0xfffffffe
    26d0:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    26d4:	940004cb 	bl	3a00 <memmove>
    return true;
    26d8:	52800020 	mov	w0, #0x1                   	// #1
}
    26dc:	a8c17bfd 	ldp	x29, x30, [sp], #16
    26e0:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    26e4:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    26e8:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    26ec:	9105c021 	add	x1, x1, #0x170
    26f0:	91012000 	add	x0, x0, #0x48
    26f4:	97fffdef 	bl	1eb0 <printf>
        return false;
    26f8:	52800000 	mov	w0, #0x0                   	// #0
}
    26fc:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2700:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    2704:	2a0403e2 	mov	w2, w4
    2708:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    270c:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2710:	9105c021 	add	x1, x1, #0x170
    2714:	91002000 	add	x0, x0, #0x8
    2718:	97fffde6 	bl	1eb0 <printf>
        return false;
    271c:	52800000 	mov	w0, #0x0                   	// #0
}
    2720:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2724:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    2728:	32000063 	orr	w3, w3, #0x1
    272c:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    2730:	940004e4 	bl	3ac0 <memset>
        return true;
    2734:	52800020 	mov	w0, #0x1                   	// #1
    2738:	17ffffe9 	b	26dc <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    273c:	d2800000 	mov	x0, #0x0                   	// #0
    2740:	17ffffe1 	b	26c4 <ipc_msg_set_nth_arg+0x54>
    2744:	d503201f 	nop
    2748:	d503201f 	nop
    274c:	d503201f 	nop

0000000000002750 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    2750:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2754:	aa0003e4 	mov	x4, x0
    2758:	910003fd 	mov	x29, sp
    275c:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    2760:	39400005 	ldrb	w5, [x0]
    2764:	d3441ca5 	ubfx	x5, x5, #4, #4
    2768:	6b0100bf 	cmp	w5, w1
    276c:	5400030d 	b.le	27cc <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    2770:	528000c5 	mov	w5, #0x6                   	// #6
    2774:	aa0203e0 	mov	x0, x2
    2778:	d2800182 	mov	x2, #0xc                   	// #12
    277c:	9b250821 	smaddl	x1, w1, w5, x2
    2780:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    2784:	79400445 	ldrh	w5, [x2, #2]
    2788:	6b0300bf 	cmp	w5, w3
    278c:	5400036b 	b.lt	27f8 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    2790:	39401042 	ldrb	w2, [x2, #4]
        return true;
    2794:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    2798:	360000a2 	tbz	w2, #0, 27ac <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    279c:	2a1303e0 	mov	w0, w19
    27a0:	f9400bf3 	ldr	x19, [sp, #16]
    27a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    27a8:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    27ac:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    27b0:	93407c62 	sxtw	x2, w3
    27b4:	8b010081 	add	x1, x4, x1
    27b8:	94000492 	bl	3a00 <memmove>
}
    27bc:	2a1303e0 	mov	w0, w19
    27c0:	f9400bf3 	ldr	x19, [sp, #16]
    27c4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    27c8:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    27cc:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    27d0:	9105c021 	add	x1, x1, #0x170
    27d4:	91006021 	add	x1, x1, #0x18
        return false;
    27d8:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    27dc:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    27e0:	91024000 	add	x0, x0, #0x90
    27e4:	97fffdb3 	bl	1eb0 <printf>
}
    27e8:	2a1303e0 	mov	w0, w19
    27ec:	f9400bf3 	ldr	x19, [sp, #16]
    27f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    27f4:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    27f8:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    27fc:	9105c021 	add	x1, x1, #0x170
    2800:	91006021 	add	x1, x1, #0x18
        return false;
    2804:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    2808:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    280c:	9102e000 	add	x0, x0, #0xb8
    2810:	97fffda8 	bl	1eb0 <printf>
}
    2814:	2a1303e0 	mov	w0, w19
    2818:	f9400bf3 	ldr	x19, [sp, #16]
    281c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2820:	d65f03c0 	ret
    2824:	d503201f 	nop
    2828:	d503201f 	nop
    282c:	d503201f 	nop

0000000000002830 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    2830:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    2834:	d2800021 	mov	x1, #0x1                   	// #1
    2838:	f2db9741 	movk	x1, #0xdcba, lsl #32
    283c:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    2840:	910003fd 	mov	x29, sp
    2844:	f9000bf3 	str	x19, [sp, #16]
    2848:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    284c:	f9400000 	ldr	x0, [x0]
    2850:	927e7400 	and	x0, x0, #0xfffffffc
    2854:	aa010000 	orr	x0, x0, x1
    2858:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    285c:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    2860:	52800040 	mov	w0, #0x2                   	// #2
    2864:	97fffe97 	bl	22c0 <yield>
    while (msg->header.done == 0) {
    2868:	39400261 	ldrb	w1, [x19]
    286c:	360fffa1 	tbz	w1, #1, 2860 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    2870:	f9400bf3 	ldr	x19, [sp, #16]
    2874:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2878:	d65f03c0 	ret
    287c:	d503201f 	nop

0000000000002880 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    2880:	f9400001 	ldr	x1, [x0]
    2884:	d2800022 	mov	x2, #0x1                   	// #1
    2888:	f2db9742 	movk	x2, #0xdcba, lsl #32
    288c:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    2890:	927e7421 	and	x1, x1, #0xfffffffc
    2894:	aa020021 	orr	x1, x1, x2
    2898:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    289c:	d65f03c0 	ret

00000000000028a0 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    28a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    28a4:	910003fd 	mov	x29, sp
    28a8:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    28ac:	b9800801 	ldrsw	x1, [x0, #8]
    28b0:	f9400800 	ldr	x0, [x0, #16]
    28b4:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    28b8:	38616800 	ldrb	w0, [x0, x1]
    28bc:	370800a0 	tbnz	w0, #1, 28d0 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    28c0:	52800040 	mov	w0, #0x2                   	// #2
    28c4:	97fffe7f 	bl	22c0 <yield>
    while (msg->header.done == 0) {
    28c8:	39400260 	ldrb	w0, [x19]
    28cc:	360fffa0 	tbz	w0, #1, 28c0 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    28d0:	b9400a60 	ldr	w0, [x19, #8]
    28d4:	f9400bf3 	ldr	x19, [sp, #16]
    28d8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    28dc:	d65f03c0 	ret

00000000000028e0 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    28e0:	d0000040 	adrp	x0, c000 <IpcTestNull+0x6e8>
}
    28e4:	b9412800 	ldr	w0, [x0, #296]
    28e8:	d65f03c0 	ret
    28ec:	d503201f 	nop

00000000000028f0 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    28f0:	f0000040 	adrp	x0, d000 <__malloc_av_+0x780>
    28f4:	52800021 	mov	w1, #0x1                   	// #1
    28f8:	390b4001 	strb	w1, [x0, #720]
}
    28fc:	d65f03c0 	ret

0000000000002900 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    2900:	f0000040 	adrp	x0, d000 <__malloc_av_+0x780>
}
    2904:	394b4000 	ldrb	w0, [x0, #720]
    2908:	d65f03c0 	ret
    290c:	d503201f 	nop

0000000000002910 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    2910:	f0000040 	adrp	x0, d000 <__malloc_av_+0x780>
    2914:	f9416c00 	ldr	x0, [x0, #728]
    2918:	b4000080 	cbz	x0, 2928 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    291c:	39400000 	ldrb	w0, [x0]
    2920:	d3430c00 	ubfx	x0, x0, #3, #1
}
    2924:	d65f03c0 	ret
        return false;
    2928:	52800000 	mov	w0, #0x0                   	// #0
}
    292c:	d65f03c0 	ret

0000000000002930 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    2930:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    2934:	d2806002 	mov	x2, #0x300                 	// #768
    2938:	52800001 	mov	w1, #0x0                   	// #0
{
    293c:	a9007bfd 	stp	x29, x30, [sp]
    2940:	910003fd 	mov	x29, sp
    2944:	a90153f3 	stp	x19, x20, [sp, #16]
    2948:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    294c:	9101c3e0 	add	x0, sp, #0x70
{
    2950:	a9025bf5 	stp	x21, x22, [sp, #32]
    2954:	d0000055 	adrp	x21, c000 <IpcTestNull+0x6e8>
    2958:	9104a2b5 	add	x21, x21, #0x128
    295c:	a90363f7 	stp	x23, x24, [sp, #48]
    2960:	b0000056 	adrp	x22, b000 <pow10.0+0x80>
    2964:	910442d6 	add	x22, x22, #0x110
    2968:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    296c:	529b9754 	mov	w20, #0xdcba                	// #56506
    2970:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    2974:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    2978:	94000452 	bl	3ac0 <memset>
    297c:	f0000044 	adrp	x4, d000 <__malloc_av_+0x780>
    2980:	910b409c 	add	x28, x4, #0x2d0
    2984:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2988:	9103a000 	add	x0, x0, #0xe8
    298c:	f90037e0 	str	x0, [sp, #104]
    2990:	b000005b 	adrp	x27, b000 <pow10.0+0x80>
    2994:	9104e360 	add	x0, x27, #0x138
    2998:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    299c:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    29a0:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    29a4:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    29a8:	52800401 	mov	w1, #0x20                  	// #32
    29ac:	97fffe65 	bl	2340 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    29b0:	9101c3fb 	add	x27, sp, #0x70
    29b4:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    29b8:	52800019 	mov	w25, #0x0                   	// #0
    29bc:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    29c0:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    29c4:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    29c8:	b4000980 	cbz	x0, 2af8 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    29cc:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    29d0:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    29d4:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    29d8:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    29dc:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    29e0:	b9400401 	ldr	w1, [x0, #4]
    29e4:	6b14003f 	cmp	w1, w20
    29e8:	54000340 	b.eq	2a50 <ipc_server_loop+0x120>  // b.none
    29ec:	14000039 	b	2ad0 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    29f0:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    29f4:	f9400780 	ldr	x0, [x28, #8]
    29f8:	39400001 	ldrb	w1, [x0]
    29fc:	36080641 	tbz	w1, #1, 2ac4 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2a00:	29409b62 	ldp	w2, w6, [x27, #4]
    2a04:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2a08:	79400400 	ldrh	w0, [x0, #2]
    2a0c:	0b010041 	add	w1, w2, w1
    2a10:	4b060021 	sub	w1, w1, w6
    2a14:	1ac20c25 	sdiv	w5, w1, w2
    2a18:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    2a1c:	6b01001f 	cmp	w0, w1
    2a20:	5400078c 	b.gt	2b10 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    2a24:	0b060000 	add	w0, w0, w6
    2a28:	1ac20c01 	sdiv	w1, w0, w2
    2a2c:	1b028020 	msub	w0, w1, w2, w0
    2a30:	b9000b60 	str	w0, [x27, #8]
    2a34:	37f804e0 	tbnz	w0, #31, 2ad0 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2a38:	f9400b61 	ldr	x1, [x27, #16]
    2a3c:	8b20c020 	add	x0, x1, w0, sxtw
    2a40:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    2a44:	b9400401 	ldr	w1, [x0, #4]
    2a48:	6b14003f 	cmp	w1, w20
    2a4c:	54000421 	b.ne	2ad0 <ipc_server_loop+0x1a0>  // b.any
    2a50:	39400001 	ldrb	w1, [x0]
    2a54:	12000421 	and	w1, w1, #0x3
    2a58:	7100043f 	cmp	w1, #0x1
    2a5c:	540003a1 	b.ne	2ad0 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2a60:	29409761 	ldp	w1, w5, [x27, #4]
    2a64:	b9400f66 	ldr	w6, [x27, #12]
    2a68:	0b0100c2 	add	w2, w6, w1
    2a6c:	4b050042 	sub	w2, w2, w5
    2a70:	1ac10c45 	sdiv	w5, w2, w1
    2a74:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2a78:	35000122 	cbnz	w2, 2a9c <ipc_server_loop+0x16c>
    2a7c:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    2a80:	6b01005f 	cmp	w2, w1
    2a84:	5400056c 	b.gt	2b30 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    2a88:	0b060042 	add	w2, w2, w6
    2a8c:	1ac10c45 	sdiv	w5, w2, w1
    2a90:	1b0188a2 	msub	w2, w5, w1, w2
    2a94:	b9000f62 	str	w2, [x27, #12]
    2a98:	37f801c2 	tbnz	w2, #31, 2ad0 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    2a9c:	39400402 	ldrb	w2, [x0, #1]
    2aa0:	39400401 	ldrb	w1, [x0, #1]
    2aa4:	8b020e62 	add	x2, x19, x2, lsl #3
    2aa8:	f9400442 	ldr	x2, [x2, #8]
    2aac:	b5fffa22 	cbnz	x2, 29f0 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    2ab0:	f9400262 	ldr	x2, [x19]
    2ab4:	aa1603e0 	mov	x0, x22
    2ab8:	97fffcfe 	bl	1eb0 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2abc:	f9400780 	ldr	x0, [x28, #8]
    2ac0:	17ffffd0 	b	2a00 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    2ac4:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    2ac8:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    2acc:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    2ad0:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2ad4:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    2ad8:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2adc:	eb1b02ff 	cmp	x23, x27
    2ae0:	54fff701 	b.ne	29c0 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2ae4:	52000340 	eor	w0, w26, #0x1
    2ae8:	5280003a 	mov	w26, #0x1                   	// #1
    2aec:	6a00033f 	tst	w25, w0
    2af0:	54fff601 	b.ne	29b0 <ipc_server_loop+0x80>  // b.any
    2af4:	17ffffaa 	b	299c <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    2af8:	97fffdf2 	bl	22c0 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2afc:	52000340 	eor	w0, w26, #0x1
    2b00:	5280003a 	mov	w26, #0x1                   	// #1
    2b04:	6a00033f 	tst	w25, w0
    2b08:	54fff541 	b.ne	29b0 <ipc_server_loop+0x80>  // b.any
    2b0c:	17ffffa4 	b	299c <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    2b10:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2b14:	9100637b 	add	x27, x27, #0x18
    2b18:	97fffce6 	bl	1eb0 <printf>
                cur_sess_id = -1;
    2b1c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    2b20:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2b24:	eb1b02ff 	cmp	x23, x27
    2b28:	54fff4c1 	b.ne	29c0 <ipc_server_loop+0x90>  // b.any
    2b2c:	17ffffee 	b	2ae4 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    2b30:	f94037e0 	ldr	x0, [sp, #104]
    2b34:	9100637b 	add	x27, x27, #0x18
    2b38:	97fffcde 	bl	1eb0 <printf>
                cur_sess_id = -1;
    2b3c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    2b40:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2b44:	eb1b02ff 	cmp	x23, x27
    2b48:	54fff3c1 	b.ne	29c0 <ipc_server_loop+0x90>  // b.any
    2b4c:	17ffffe6 	b	2ae4 <ipc_server_loop+0x1b4>

0000000000002b50 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    2b50:	aa0003e3 	mov	x3, x0
    2b54:	aa0103e0 	mov	x0, x1
    2b58:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    2b5c:	aa0303e2 	mov	x2, x3
    2b60:	17fffdf0 	b	2320 <session>
    2b64:	d503201f 	nop
    2b68:	d503201f 	nop
    2b6c:	d503201f 	nop

0000000000002b70 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    2b70:	17fffdfc 	b	2360 <close_session>
    2b74:	d503201f 	nop
    2b78:	d503201f 	nop
    2b7c:	d503201f 	nop

0000000000002b80 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    2b80:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2b84:	910003fd 	mov	x29, sp
    2b88:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    2b8c:	37f80561 	tbnz	w1, #31, 2c38 <session_alloc_buf+0xb8>
    2b90:	a90153f3 	stp	x19, x20, [sp, #16]
    2b94:	2a0103f4 	mov	w20, w1
    2b98:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2b9c:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    2ba0:	d2800015 	mov	x21, #0x0                   	// #0
    2ba4:	b9400c03 	ldr	w3, [x0, #12]
    2ba8:	0b030020 	add	w0, w1, w3
    2bac:	4b020000 	sub	w0, w0, w2
    2bb0:	1ac10c02 	sdiv	w2, w0, w1
    2bb4:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    2bb8:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    2bbc:	6b01029f 	cmp	w20, w1
    2bc0:	5400032c 	b.gt	2c24 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2bc4:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    2bc8:	93407e82 	sxtw	x2, w20
    2bcc:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2bd0:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    2bd4:	aa1503e0 	mov	x0, x21
    2bd8:	940003ba 	bl	3ac0 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2bdc:	29408e60 	ldp	w0, w3, [x19, #4]
    2be0:	b9400e61 	ldr	w1, [x19, #12]
    2be4:	0b010002 	add	w2, w0, w1
    2be8:	4b030043 	sub	w3, w2, w3
    2bec:	1ac00c62 	sdiv	w2, w3, w0
    2bf0:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    2bf4:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    2bf8:	6b02029f 	cmp	w20, w2
    2bfc:	5400028c 	b.gt	2c4c <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    2c00:	0b010294 	add	w20, w20, w1
    2c04:	1ac00e81 	sdiv	w1, w20, w0
    2c08:	1b00d034 	msub	w20, w1, w0, w20
    2c0c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    2c10:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    2c14:	aa1503e0 	mov	x0, x21
    2c18:	f94013f5 	ldr	x21, [sp, #32]
    2c1c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c20:	d65f03c0 	ret
    2c24:	aa1503e0 	mov	x0, x21
    2c28:	a94153f3 	ldp	x19, x20, [sp, #16]
    2c2c:	f94013f5 	ldr	x21, [sp, #32]
    2c30:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c34:	d65f03c0 	ret
        return NULL;
    2c38:	d2800015 	mov	x21, #0x0                   	// #0
}
    2c3c:	aa1503e0 	mov	x0, x21
    2c40:	f94013f5 	ldr	x21, [sp, #32]
    2c44:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c48:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    2c4c:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2c50:	9103a000 	add	x0, x0, #0xe8
    2c54:	97fffc97 	bl	1eb0 <printf>
        return -1;
    2c58:	a94153f3 	ldp	x19, x20, [sp, #16]
    2c5c:	17ffffee 	b	2c14 <session_alloc_buf+0x94>

0000000000002c60 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    2c60:	37f80241 	tbnz	w1, #31, 2ca8 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2c64:	29409403 	ldp	w3, w5, [x0, #4]
    2c68:	aa0003e2 	mov	x2, x0
    2c6c:	b9400c00 	ldr	w0, [x0, #12]
    2c70:	0b000060 	add	w0, w3, w0
    2c74:	4b050000 	sub	w0, w0, w5
    2c78:	1ac30c04 	sdiv	w4, w0, w3
    2c7c:	1b038080 	msub	w0, w4, w3, w0
    2c80:	6b00003f 	cmp	w1, w0
    2c84:	5400012c 	b.gt	2ca8 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    2c88:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    2c8c:	52800020 	mov	w0, #0x1                   	// #1
    2c90:	1ac30c24 	sdiv	w4, w1, w3
    2c94:	1b038481 	msub	w1, w4, w3, w1
    2c98:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    2c9c:	3100043f 	cmn	w1, #0x1
    2ca0:	54000080 	b.eq	2cb0 <session_free_buf+0x50>  // b.none
}
    2ca4:	d65f03c0 	ret
        return false;
    2ca8:	52800000 	mov	w0, #0x0                   	// #0
}
    2cac:	d65f03c0 	ret
{
    2cb0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    2cb4:	b0000043 	adrp	x3, b000 <pow10.0+0x80>
    2cb8:	b0000042 	adrp	x2, b000 <pow10.0+0x80>
{
    2cbc:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    2cc0:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2cc4:	91068063 	add	x3, x3, #0x1a0
    2cc8:	91078042 	add	x2, x2, #0x1e0
    2ccc:	91074000 	add	x0, x0, #0x1d0
    2cd0:	52800801 	mov	w1, #0x40                  	// #64
    2cd4:	94000033 	bl	2da0 <__assert_func>
    2cd8:	d503201f 	nop
    2cdc:	d503201f 	nop

0000000000002ce0 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    2ce0:	14000000 	b	2ce0 <_exit>
    2ce4:	d503201f 	nop
    2ce8:	d503201f 	nop
    2cec:	d503201f 	nop

0000000000002cf0 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    2cf0:	f0000043 	adrp	x3, d000 <__malloc_av_+0x780>
    2cf4:	f9417061 	ldr	x1, [x3, #736]
    2cf8:	f0000042 	adrp	x2, d000 <__malloc_av_+0x780>
    2cfc:	9117a042 	add	x2, x2, #0x5e8
    2d00:	f100003f 	cmp	x1, #0x0
    2d04:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    2d08:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    2d0c:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    2d10:	f9017062 	str	x2, [x3, #736]
}
    2d14:	d65f03c0 	ret
    2d18:	d503201f 	nop
    2d1c:	d503201f 	nop

0000000000002d20 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    2d20:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    2d24:	d65f03c0 	ret
    2d28:	d503201f 	nop
    2d2c:	d503201f 	nop

0000000000002d30 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    2d30:	12800000 	mov	w0, #0xffffffff            	// #-1
    2d34:	d65f03c0 	ret
    2d38:	d503201f 	nop
    2d3c:	d503201f 	nop

0000000000002d40 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    2d40:	52800000 	mov	w0, #0x0                   	// #0
    2d44:	d65f03c0 	ret
    2d48:	d503201f 	nop
    2d4c:	d503201f 	nop

0000000000002d50 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    2d50:	52800020 	mov	w0, #0x1                   	// #1
    2d54:	d65f03c0 	ret
    2d58:	d503201f 	nop
    2d5c:	d503201f 	nop

0000000000002d60 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    2d60:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    2d64:	d65f03c0 	ret
    2d68:	d503201f 	nop
    2d6c:	d503201f 	nop

0000000000002d70 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    2d70:	d2800000 	mov	x0, #0x0                   	// #0
    2d74:	d65f03c0 	ret
    2d78:	d503201f 	nop
    2d7c:	d503201f 	nop

0000000000002d80 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    2d80:	12800000 	mov	w0, #0xffffffff            	// #-1
    2d84:	d65f03c0 	ret
    2d88:	d503201f 	nop
    2d8c:	d503201f 	nop

0000000000002d90 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    2d90:	52800020 	mov	w0, #0x1                   	// #1
    2d94:	d65f03c0 	ret
    2d98:	d503201f 	nop
    2d9c:	d503201f 	nop

0000000000002da0 <__assert_func>:
    2da0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    2da4:	d0000044 	adrp	x4, c000 <IpcTestNull+0x6e8>
    2da8:	aa0003e7 	mov	x7, x0
    2dac:	910003fd 	mov	x29, sp
    2db0:	f9409885 	ldr	x5, [x4, #304]
    2db4:	aa0203e6 	mov	x6, x2
    2db8:	2a0103e4 	mov	w4, w1
    2dbc:	aa0303e2 	mov	x2, x3
    2dc0:	f9400ca0 	ldr	x0, [x5, #24]
    2dc4:	b4000106 	cbz	x6, 2de4 <__assert_func+0x44>
    2dc8:	b0000045 	adrp	x5, b000 <pow10.0+0x80>
    2dcc:	9107e0a5 	add	x5, x5, #0x1f8
    2dd0:	aa0703e3 	mov	x3, x7
    2dd4:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    2dd8:	91082021 	add	x1, x1, #0x208
    2ddc:	94000049 	bl	2f00 <fiprintf>
    2de0:	94000bd8 	bl	5d40 <abort>
    2de4:	90000045 	adrp	x5, a000 <__swbuf_r+0xb0>
    2de8:	913740a5 	add	x5, x5, #0xdd0
    2dec:	aa0503e6 	mov	x6, x5
    2df0:	17fffff8 	b	2dd0 <__assert_func+0x30>
    2df4:	d503201f 	nop
    2df8:	d503201f 	nop
    2dfc:	d503201f 	nop

0000000000002e00 <__assert>:
    2e00:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    2e04:	aa0203e3 	mov	x3, x2
    2e08:	d2800002 	mov	x2, #0x0                   	// #0
    2e0c:	910003fd 	mov	x29, sp
    2e10:	97ffffe4 	bl	2da0 <__assert_func>
    2e14:	d503201f 	nop
    2e18:	d503201f 	nop
    2e1c:	d503201f 	nop

0000000000002e20 <atexit>:
    2e20:	aa0003e1 	mov	x1, x0
    2e24:	d2800003 	mov	x3, #0x0                   	// #0
    2e28:	d2800002 	mov	x2, #0x0                   	// #0
    2e2c:	52800000 	mov	w0, #0x0                   	// #0
    2e30:	14000bcc 	b	5d60 <__register_exitproc>
    2e34:	d503201f 	nop
    2e38:	d503201f 	nop
    2e3c:	d503201f 	nop

0000000000002e40 <__libc_fini_array>:
    2e40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2e44:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    2e48:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2e4c:	910003fd 	mov	x29, sp
    2e50:	a90153f3 	stp	x19, x20, [sp, #16]
    2e54:	f9411c33 	ldr	x19, [x1, #568]
    2e58:	f9412014 	ldr	x20, [x0, #576]
    2e5c:	cb140273 	sub	x19, x19, x20
    2e60:	9343fe73 	asr	x19, x19, #3
    2e64:	b40000b3 	cbz	x19, 2e78 <__libc_fini_array+0x38>
    2e68:	d1000673 	sub	x19, x19, #0x1
    2e6c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    2e70:	d63f0000 	blr	x0
    2e74:	b5ffffb3 	cbnz	x19, 2e68 <__libc_fini_array+0x28>
    2e78:	a94153f3 	ldp	x19, x20, [sp, #16]
    2e7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2e80:	14001f9d 	b	acf4 <_fini>
    2e84:	d503201f 	nop
    2e88:	d503201f 	nop
    2e8c:	d503201f 	nop

0000000000002e90 <_fiprintf_r>:
    2e90:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    2e94:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    2e98:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    2e9c:	910003fd 	mov	x29, sp
    2ea0:	910343ea 	add	x10, sp, #0xd0
    2ea4:	910403eb 	add	x11, sp, #0x100
    2ea8:	a9032feb 	stp	x11, x11, [sp, #48]
    2eac:	f90023ea 	str	x10, [sp, #64]
    2eb0:	290923e9 	stp	w9, w8, [sp, #72]
    2eb4:	a9432fea 	ldp	x10, x11, [sp, #48]
    2eb8:	a9012fea 	stp	x10, x11, [sp, #16]
    2ebc:	a94427e8 	ldp	x8, x9, [sp, #64]
    2ec0:	a90227e8 	stp	x8, x9, [sp, #32]
    2ec4:	3d8017e0 	str	q0, [sp, #80]
    2ec8:	3d801be1 	str	q1, [sp, #96]
    2ecc:	3d801fe2 	str	q2, [sp, #112]
    2ed0:	3d8023e3 	str	q3, [sp, #128]
    2ed4:	3d8027e4 	str	q4, [sp, #144]
    2ed8:	3d802be5 	str	q5, [sp, #160]
    2edc:	3d802fe6 	str	q6, [sp, #176]
    2ee0:	3d8033e7 	str	q7, [sp, #192]
    2ee4:	a90d93e3 	stp	x3, x4, [sp, #216]
    2ee8:	910043e3 	add	x3, sp, #0x10
    2eec:	a90e9be5 	stp	x5, x6, [sp, #232]
    2ef0:	f9007fe7 	str	x7, [sp, #248]
    2ef4:	940003c7 	bl	3e10 <_vfiprintf_r>
    2ef8:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2efc:	d65f03c0 	ret

0000000000002f00 <fiprintf>:
    2f00:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    2f04:	d0000048 	adrp	x8, c000 <IpcTestNull+0x6e8>
    2f08:	aa0003eb 	mov	x11, x0
    2f0c:	910003fd 	mov	x29, sp
    2f10:	910343ec 	add	x12, sp, #0xd0
    2f14:	910403ea 	add	x10, sp, #0x100
    2f18:	f9409900 	ldr	x0, [x8, #304]
    2f1c:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    2f20:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    2f24:	a9032bea 	stp	x10, x10, [sp, #48]
    2f28:	aa0103ea 	mov	x10, x1
    2f2c:	f90023ec 	str	x12, [sp, #64]
    2f30:	aa0b03e1 	mov	x1, x11
    2f34:	290923e9 	stp	w9, w8, [sp, #72]
    2f38:	a94337ec 	ldp	x12, x13, [sp, #48]
    2f3c:	a90137ec 	stp	x12, x13, [sp, #16]
    2f40:	a94427e8 	ldp	x8, x9, [sp, #64]
    2f44:	a90227e8 	stp	x8, x9, [sp, #32]
    2f48:	3d8017e0 	str	q0, [sp, #80]
    2f4c:	3d801be1 	str	q1, [sp, #96]
    2f50:	3d801fe2 	str	q2, [sp, #112]
    2f54:	3d8023e3 	str	q3, [sp, #128]
    2f58:	3d8027e4 	str	q4, [sp, #144]
    2f5c:	3d802be5 	str	q5, [sp, #160]
    2f60:	3d802fe6 	str	q6, [sp, #176]
    2f64:	3d8033e7 	str	q7, [sp, #192]
    2f68:	a90d0fe2 	stp	x2, x3, [sp, #208]
    2f6c:	910043e3 	add	x3, sp, #0x10
    2f70:	aa0a03e2 	mov	x2, x10
    2f74:	a90e17e4 	stp	x4, x5, [sp, #224]
    2f78:	a90f1fe6 	stp	x6, x7, [sp, #240]
    2f7c:	940003a5 	bl	3e10 <_vfiprintf_r>
    2f80:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2f84:	d65f03c0 	ret
    2f88:	d503201f 	nop
    2f8c:	d503201f 	nop

0000000000002f90 <__libc_init_array>:
    2f90:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2f94:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    2f98:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2f9c:	910003fd 	mov	x29, sp
    2fa0:	a90153f3 	stp	x19, x20, [sp, #16]
    2fa4:	f9412834 	ldr	x20, [x1, #592]
    2fa8:	f90013f5 	str	x21, [sp, #32]
    2fac:	f9412c15 	ldr	x21, [x0, #600]
    2fb0:	cb150294 	sub	x20, x20, x21
    2fb4:	9343fe94 	asr	x20, x20, #3
    2fb8:	b40000f4 	cbz	x20, 2fd4 <__libc_init_array+0x44>
    2fbc:	d2800013 	mov	x19, #0x0                   	// #0
    2fc0:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    2fc4:	91000673 	add	x19, x19, #0x1
    2fc8:	d63f0000 	blr	x0
    2fcc:	eb13029f 	cmp	x20, x19
    2fd0:	54ffff81 	b.ne	2fc0 <__libc_init_array+0x30>  // b.any
    2fd4:	940ff40b 	bl	400000 <_init>
    2fd8:	b0000041 	adrp	x1, b000 <pow10.0+0x80>
    2fdc:	b0000040 	adrp	x0, b000 <pow10.0+0x80>
    2fe0:	f9413034 	ldr	x20, [x1, #608]
    2fe4:	f9413415 	ldr	x21, [x0, #616]
    2fe8:	cb150294 	sub	x20, x20, x21
    2fec:	9343fe94 	asr	x20, x20, #3
    2ff0:	b40000f4 	cbz	x20, 300c <__libc_init_array+0x7c>
    2ff4:	d2800013 	mov	x19, #0x0                   	// #0
    2ff8:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    2ffc:	91000673 	add	x19, x19, #0x1
    3000:	d63f0000 	blr	x0
    3004:	eb13029f 	cmp	x20, x19
    3008:	54ffff81 	b.ne	2ff8 <__libc_init_array+0x68>  // b.any
    300c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3010:	f94013f5 	ldr	x21, [sp, #32]
    3014:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3018:	d65f03c0 	ret
    301c:	d503201f 	nop

0000000000003020 <malloc>:
    3020:	b0000042 	adrp	x2, c000 <IpcTestNull+0x6e8>
    3024:	aa0003e1 	mov	x1, x0
    3028:	f9409840 	ldr	x0, [x2, #304]
    302c:	14000005 	b	3040 <_malloc_r>

0000000000003030 <free>:
    3030:	b0000042 	adrp	x2, c000 <IpcTestNull+0x6e8>
    3034:	aa0003e1 	mov	x1, x0
    3038:	f9409840 	ldr	x0, [x2, #304]
    303c:	14000dd5 	b	6790 <_free_r>

0000000000003040 <_malloc_r>:
    3040:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    3044:	910003fd 	mov	x29, sp
    3048:	a90153f3 	stp	x19, x20, [sp, #16]
    304c:	91005c33 	add	x19, x1, #0x17
    3050:	a9025bf5 	stp	x21, x22, [sp, #32]
    3054:	aa0003f5 	mov	x21, x0
    3058:	a90363f7 	stp	x23, x24, [sp, #48]
    305c:	f100ba7f 	cmp	x19, #0x2e
    3060:	54000c88 	b.hi	31f0 <_malloc_r+0x1b0>  // b.pmore
    3064:	f100803f 	cmp	x1, #0x20
    3068:	54002068 	b.hi	3474 <_malloc_r+0x434>  // b.pmore
    306c:	9400030d 	bl	3ca0 <__malloc_lock>
    3070:	d2800413 	mov	x19, #0x20                  	// #32
    3074:	d2800a00 	mov	x0, #0x50                  	// #80
    3078:	52800085 	mov	w5, #0x4                   	// #4
    307c:	b0000054 	adrp	x20, c000 <IpcTestNull+0x6e8>
    3080:	91220294 	add	x20, x20, #0x880
    3084:	8b000280 	add	x0, x20, x0
    3088:	110008a5 	add	w5, w5, #0x2
    308c:	d1004000 	sub	x0, x0, #0x10
    3090:	f9400c01 	ldr	x1, [x0, #24]
    3094:	eb00003f 	cmp	x1, x0
    3098:	54002181 	b.ne	34c8 <_malloc_r+0x488>  // b.any
    309c:	f9401284 	ldr	x4, [x20, #32]
    30a0:	91004282 	add	x2, x20, #0x10
    30a4:	eb02009f 	cmp	x4, x2
    30a8:	54000f20 	b.eq	328c <_malloc_r+0x24c>  // b.none
    30ac:	f9400481 	ldr	x1, [x4, #8]
    30b0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    30b4:	cb130023 	sub	x3, x1, x19
    30b8:	f1007c7f 	cmp	x3, #0x1f
    30bc:	54002d4c 	b.gt	3664 <_malloc_r+0x624>
    30c0:	a9020a82 	stp	x2, x2, [x20, #32]
    30c4:	b6f81f23 	tbz	x3, #63, 34a8 <_malloc_r+0x468>
    30c8:	f107fc3f 	cmp	x1, #0x1ff
    30cc:	54002428 	b.hi	3550 <_malloc_r+0x510>  // b.pmore
    30d0:	d343fc22 	lsr	x2, x1, #3
    30d4:	d2800021 	mov	x1, #0x1                   	// #1
    30d8:	11000440 	add	w0, w2, #0x1
    30dc:	13027c42 	asr	w2, w2, #2
    30e0:	531f7800 	lsl	w0, w0, #1
    30e4:	f9400683 	ldr	x3, [x20, #8]
    30e8:	8b20ce80 	add	x0, x20, w0, sxtw #3
    30ec:	9ac22021 	lsl	x1, x1, x2
    30f0:	aa030021 	orr	x1, x1, x3
    30f4:	f85f0402 	ldr	x2, [x0], #-16
    30f8:	f9000681 	str	x1, [x20, #8]
    30fc:	a9010082 	stp	x2, x0, [x4, #16]
    3100:	f9000804 	str	x4, [x0, #16]
    3104:	f9000c44 	str	x4, [x2, #24]
    3108:	13027ca2 	asr	w2, w5, #2
    310c:	d2800020 	mov	x0, #0x1                   	// #1
    3110:	9ac22000 	lsl	x0, x0, x2
    3114:	eb01001f 	cmp	x0, x1
    3118:	54000c68 	b.hi	32a4 <_malloc_r+0x264>  // b.pmore
    311c:	ea01001f 	tst	x0, x1
    3120:	540000c1 	b.ne	3138 <_malloc_r+0xf8>  // b.any
    3124:	121e74a5 	and	w5, w5, #0xfffffffc
    3128:	d37ff800 	lsl	x0, x0, #1
    312c:	110010a5 	add	w5, w5, #0x4
    3130:	ea01001f 	tst	x0, x1
    3134:	54ffffa0 	b.eq	3128 <_malloc_r+0xe8>  // b.none
    3138:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    313c:	110004a7 	add	w7, w5, #0x1
    3140:	2a0503e8 	mov	w8, w5
    3144:	531f78e7 	lsl	w7, w7, #1
    3148:	8b27cd27 	add	x7, x9, w7, sxtw #3
    314c:	8b070287 	add	x7, x20, x7
    3150:	aa0703e4 	mov	x4, x7
    3154:	f9400c81 	ldr	x1, [x4, #24]
    3158:	14000009 	b	317c <_malloc_r+0x13c>
    315c:	f9400422 	ldr	x2, [x1, #8]
    3160:	aa0103e6 	mov	x6, x1
    3164:	f9400c21 	ldr	x1, [x1, #24]
    3168:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    316c:	cb130043 	sub	x3, x2, x19
    3170:	f1007c7f 	cmp	x3, #0x1f
    3174:	5400238c 	b.gt	35e4 <_malloc_r+0x5a4>
    3178:	b6f82563 	tbz	x3, #63, 3624 <_malloc_r+0x5e4>
    317c:	eb01009f 	cmp	x4, x1
    3180:	54fffee1 	b.ne	315c <_malloc_r+0x11c>  // b.any
    3184:	7100f91f 	cmp	w8, #0x3e
    3188:	540029cd 	b.le	36c0 <_malloc_r+0x680>
    318c:	91004084 	add	x4, x4, #0x10
    3190:	11000508 	add	w8, w8, #0x1
    3194:	f240051f 	tst	x8, #0x3
    3198:	54fffde1 	b.ne	3154 <_malloc_r+0x114>  // b.any
    319c:	14000005 	b	31b0 <_malloc_r+0x170>
    31a0:	f85f04e1 	ldr	x1, [x7], #-16
    31a4:	510004a5 	sub	w5, w5, #0x1
    31a8:	eb07003f 	cmp	x1, x7
    31ac:	540035a1 	b.ne	3860 <_malloc_r+0x820>  // b.any
    31b0:	f24004bf 	tst	x5, #0x3
    31b4:	54ffff61 	b.ne	31a0 <_malloc_r+0x160>  // b.any
    31b8:	f9400681 	ldr	x1, [x20, #8]
    31bc:	8a200021 	bic	x1, x1, x0
    31c0:	f9000681 	str	x1, [x20, #8]
    31c4:	d37ff800 	lsl	x0, x0, #1
    31c8:	f100001f 	cmp	x0, #0x0
    31cc:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    31d0:	54000089 	b.ls	31e0 <_malloc_r+0x1a0>  // b.plast
    31d4:	14000034 	b	32a4 <_malloc_r+0x264>
    31d8:	d37ff800 	lsl	x0, x0, #1
    31dc:	11001108 	add	w8, w8, #0x4
    31e0:	ea01001f 	tst	x0, x1
    31e4:	54ffffa0 	b.eq	31d8 <_malloc_r+0x198>  // b.none
    31e8:	2a0803e5 	mov	w5, w8
    31ec:	17ffffd4 	b	313c <_malloc_r+0xfc>
    31f0:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    31f4:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    31f8:	eb02027f 	cmp	x19, x2
    31fc:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    3200:	540013a8 	b.hi	3474 <_malloc_r+0x434>  // b.pmore
    3204:	940002a7 	bl	3ca0 <__malloc_lock>
    3208:	f107de7f 	cmp	x19, #0x1f7
    320c:	54002229 	b.ls	3650 <_malloc_r+0x610>  // b.plast
    3210:	d349fe60 	lsr	x0, x19, #9
    3214:	b4001420 	cbz	x0, 3498 <_malloc_r+0x458>
    3218:	f100101f 	cmp	x0, #0x4
    321c:	54001d08 	b.hi	35bc <_malloc_r+0x57c>  // b.pmore
    3220:	d346fe60 	lsr	x0, x19, #6
    3224:	1100e405 	add	w5, w0, #0x39
    3228:	1100e000 	add	w0, w0, #0x38
    322c:	531f78a4 	lsl	w4, w5, #1
    3230:	937d7c84 	sbfiz	x4, x4, #3, #32
    3234:	b0000054 	adrp	x20, c000 <IpcTestNull+0x6e8>
    3238:	91220294 	add	x20, x20, #0x880
    323c:	8b040284 	add	x4, x20, x4
    3240:	d1004084 	sub	x4, x4, #0x10
    3244:	f9400c81 	ldr	x1, [x4, #24]
    3248:	eb01009f 	cmp	x4, x1
    324c:	540000c1 	b.ne	3264 <_malloc_r+0x224>  // b.any
    3250:	17ffff93 	b	309c <_malloc_r+0x5c>
    3254:	b6f815e3 	tbz	x3, #63, 3510 <_malloc_r+0x4d0>
    3258:	f9400c21 	ldr	x1, [x1, #24]
    325c:	eb01009f 	cmp	x4, x1
    3260:	54fff1e0 	b.eq	309c <_malloc_r+0x5c>  // b.none
    3264:	f9400422 	ldr	x2, [x1, #8]
    3268:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    326c:	cb130043 	sub	x3, x2, x19
    3270:	f1007c7f 	cmp	x3, #0x1f
    3274:	54ffff0d 	b.le	3254 <_malloc_r+0x214>
    3278:	f9401284 	ldr	x4, [x20, #32]
    327c:	91004282 	add	x2, x20, #0x10
    3280:	2a0003e5 	mov	w5, w0
    3284:	eb02009f 	cmp	x4, x2
    3288:	54fff121 	b.ne	30ac <_malloc_r+0x6c>  // b.any
    328c:	f9400681 	ldr	x1, [x20, #8]
    3290:	13027ca2 	asr	w2, w5, #2
    3294:	d2800020 	mov	x0, #0x1                   	// #1
    3298:	9ac22000 	lsl	x0, x0, x2
    329c:	eb01001f 	cmp	x0, x1
    32a0:	54fff3e9 	b.ls	311c <_malloc_r+0xdc>  // b.plast
    32a4:	f9400a97 	ldr	x23, [x20, #16]
    32a8:	f94006f6 	ldr	x22, [x23, #8]
    32ac:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    32b0:	eb18027f 	cmp	x19, x24
    32b4:	cb130300 	sub	x0, x24, x19
    32b8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    32bc:	54000bec 	b.gt	3438 <_malloc_r+0x3f8>
    32c0:	d0000041 	adrp	x1, d000 <__malloc_av_+0x780>
    32c4:	a90573fb 	stp	x27, x28, [sp, #80]
    32c8:	d000005b 	adrp	x27, d000 <__malloc_av_+0x780>
    32cc:	f9419021 	ldr	x1, [x1, #800]
    32d0:	d28203e3 	mov	x3, #0x101f                	// #4127
    32d4:	f9404b62 	ldr	x2, [x27, #144]
    32d8:	8b010261 	add	x1, x19, x1
    32dc:	8b030036 	add	x22, x1, x3
    32e0:	91008021 	add	x1, x1, #0x20
    32e4:	b100045f 	cmn	x2, #0x1
    32e8:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    32ec:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    32f0:	aa1503e0 	mov	x0, x21
    32f4:	aa1603e1 	mov	x1, x22
    32f8:	a9046bf9 	stp	x25, x26, [sp, #64]
    32fc:	94000271 	bl	3cc0 <_sbrk_r>
    3300:	8b1802fa 	add	x26, x23, x24
    3304:	aa0003f9 	mov	x25, x0
    3308:	b100041f 	cmn	x0, #0x1
    330c:	54001f20 	b.eq	36f0 <_malloc_r+0x6b0>  // b.none
    3310:	eb00035f 	cmp	x26, x0
    3314:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    3318:	54001ec1 	b.ne	36f0 <_malloc_r+0x6b0>  // b.any
    331c:	d000005c 	adrp	x28, d000 <__malloc_av_+0x780>
    3320:	b942eb81 	ldr	w1, [x28, #744]
    3324:	0b160021 	add	w1, w1, w22
    3328:	b902eb81 	str	w1, [x28, #744]
    332c:	eb00035f 	cmp	x26, x0
    3330:	54001ce0 	b.eq	36cc <_malloc_r+0x68c>  // b.none
    3334:	f9404b60 	ldr	x0, [x27, #144]
    3338:	b100041f 	cmn	x0, #0x1
    333c:	54001d60 	b.eq	36e8 <_malloc_r+0x6a8>  // b.none
    3340:	cb1a033a 	sub	x26, x25, x26
    3344:	0b1a0021 	add	w1, w1, w26
    3348:	b902eb81 	str	w1, [x28, #744]
    334c:	f2400f3a 	ands	x26, x25, #0xf
    3350:	54001e40 	b.eq	3718 <_malloc_r+0x6d8>  // b.none
    3354:	cb1a0339 	sub	x25, x25, x26
    3358:	d2820201 	mov	x1, #0x1010                	// #4112
    335c:	91004339 	add	x25, x25, #0x10
    3360:	cb1a0021 	sub	x1, x1, x26
    3364:	8b16033b 	add	x27, x25, x22
    3368:	aa1503e0 	mov	x0, x21
    336c:	cb1b0036 	sub	x22, x1, x27
    3370:	92402ed6 	and	x22, x22, #0xfff
    3374:	aa1603e1 	mov	x1, x22
    3378:	94000252 	bl	3cc0 <_sbrk_r>
    337c:	b100041f 	cmn	x0, #0x1
    3380:	54002480 	b.eq	3810 <_malloc_r+0x7d0>  // b.none
    3384:	cb190000 	sub	x0, x0, x25
    3388:	2a1603e2 	mov	w2, w22
    338c:	8b160016 	add	x22, x0, x22
    3390:	b942eb81 	ldr	w1, [x28, #744]
    3394:	b24002d6 	orr	x22, x22, #0x1
    3398:	f9000a99 	str	x25, [x20, #16]
    339c:	0b010041 	add	w1, w2, w1
    33a0:	b902eb81 	str	w1, [x28, #744]
    33a4:	f9000736 	str	x22, [x25, #8]
    33a8:	eb1402ff 	cmp	x23, x20
    33ac:	54002000 	b.eq	37ac <_malloc_r+0x76c>  // b.none
    33b0:	f1007f1f 	cmp	x24, #0x1f
    33b4:	54001cc9 	b.ls	374c <_malloc_r+0x70c>  // b.plast
    33b8:	d1006300 	sub	x0, x24, #0x18
    33bc:	d2800124 	mov	x4, #0x9                   	// #9
    33c0:	f94006e2 	ldr	x2, [x23, #8]
    33c4:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    33c8:	8b0002e3 	add	x3, x23, x0
    33cc:	92400042 	and	x2, x2, #0x1
    33d0:	aa000042 	orr	x2, x2, x0
    33d4:	f90006e2 	str	x2, [x23, #8]
    33d8:	f8008c64 	str	x4, [x3, #8]!
    33dc:	f9000464 	str	x4, [x3, #8]
    33e0:	f1007c1f 	cmp	x0, #0x1f
    33e4:	54002088 	b.hi	37f4 <_malloc_r+0x7b4>  // b.pmore
    33e8:	f9400736 	ldr	x22, [x25, #8]
    33ec:	aa1903f7 	mov	x23, x25
    33f0:	d0000040 	adrp	x0, d000 <__malloc_av_+0x780>
    33f4:	93407c21 	sxtw	x1, w1
    33f8:	f9418802 	ldr	x2, [x0, #784]
    33fc:	eb02003f 	cmp	x1, x2
    3400:	54000049 	b.ls	3408 <_malloc_r+0x3c8>  // b.plast
    3404:	f9018801 	str	x1, [x0, #784]
    3408:	d0000040 	adrp	x0, d000 <__malloc_av_+0x780>
    340c:	f9418c02 	ldr	x2, [x0, #792]
    3410:	eb02003f 	cmp	x1, x2
    3414:	54000049 	b.ls	341c <_malloc_r+0x3dc>  // b.plast
    3418:	f9018c01 	str	x1, [x0, #792]
    341c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    3420:	eb00027f 	cmp	x19, x0
    3424:	cb130000 	sub	x0, x0, x19
    3428:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    342c:	5400194d 	b.le	3754 <_malloc_r+0x714>
    3430:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3434:	a94573fb 	ldp	x27, x28, [sp, #80]
    3438:	8b1302e2 	add	x2, x23, x19
    343c:	b2400273 	orr	x19, x19, #0x1
    3440:	f90006f3 	str	x19, [x23, #8]
    3444:	b2400001 	orr	x1, x0, #0x1
    3448:	f9000a82 	str	x2, [x20, #16]
    344c:	f9000441 	str	x1, [x2, #8]
    3450:	aa1503e0 	mov	x0, x21
    3454:	910042f7 	add	x23, x23, #0x10
    3458:	94000216 	bl	3cb0 <__malloc_unlock>
    345c:	aa1703e0 	mov	x0, x23
    3460:	a94153f3 	ldp	x19, x20, [sp, #16]
    3464:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3468:	a94363f7 	ldp	x23, x24, [sp, #48]
    346c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    3470:	d65f03c0 	ret
    3474:	52800180 	mov	w0, #0xc                   	// #12
    3478:	d2800017 	mov	x23, #0x0                   	// #0
    347c:	b90002a0 	str	w0, [x21]
    3480:	aa1703e0 	mov	x0, x23
    3484:	a94153f3 	ldp	x19, x20, [sp, #16]
    3488:	a9425bf5 	ldp	x21, x22, [sp, #32]
    348c:	a94363f7 	ldp	x23, x24, [sp, #48]
    3490:	a8c67bfd 	ldp	x29, x30, [sp], #96
    3494:	d65f03c0 	ret
    3498:	d2808004 	mov	x4, #0x400                 	// #1024
    349c:	52800805 	mov	w5, #0x40                  	// #64
    34a0:	528007e0 	mov	w0, #0x3f                  	// #63
    34a4:	17ffff64 	b	3234 <_malloc_r+0x1f4>
    34a8:	8b010081 	add	x1, x4, x1
    34ac:	aa1503e0 	mov	x0, x21
    34b0:	91004097 	add	x23, x4, #0x10
    34b4:	f9400422 	ldr	x2, [x1, #8]
    34b8:	b2400042 	orr	x2, x2, #0x1
    34bc:	f9000422 	str	x2, [x1, #8]
    34c0:	940001fc 	bl	3cb0 <__malloc_unlock>
    34c4:	17ffffef 	b	3480 <_malloc_r+0x440>
    34c8:	a9409022 	ldp	x2, x4, [x1, #8]
    34cc:	91004037 	add	x23, x1, #0x10
    34d0:	f9400c23 	ldr	x3, [x1, #24]
    34d4:	aa1503e0 	mov	x0, x21
    34d8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    34dc:	8b020022 	add	x2, x1, x2
    34e0:	f9400441 	ldr	x1, [x2, #8]
    34e4:	f9000c83 	str	x3, [x4, #24]
    34e8:	f9000864 	str	x4, [x3, #16]
    34ec:	b2400021 	orr	x1, x1, #0x1
    34f0:	f9000441 	str	x1, [x2, #8]
    34f4:	940001ef 	bl	3cb0 <__malloc_unlock>
    34f8:	aa1703e0 	mov	x0, x23
    34fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    3500:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3504:	a94363f7 	ldp	x23, x24, [sp, #48]
    3508:	a8c67bfd 	ldp	x29, x30, [sp], #96
    350c:	d65f03c0 	ret
    3510:	8b020022 	add	x2, x1, x2
    3514:	91004037 	add	x23, x1, #0x10
    3518:	a9410c24 	ldp	x4, x3, [x1, #16]
    351c:	aa1503e0 	mov	x0, x21
    3520:	f9400441 	ldr	x1, [x2, #8]
    3524:	f9000c83 	str	x3, [x4, #24]
    3528:	b2400021 	orr	x1, x1, #0x1
    352c:	f9000864 	str	x4, [x3, #16]
    3530:	f9000441 	str	x1, [x2, #8]
    3534:	940001df 	bl	3cb0 <__malloc_unlock>
    3538:	aa1703e0 	mov	x0, x23
    353c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3540:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3544:	a94363f7 	ldp	x23, x24, [sp, #48]
    3548:	a8c67bfd 	ldp	x29, x30, [sp], #96
    354c:	d65f03c0 	ret
    3550:	d349fc20 	lsr	x0, x1, #9
    3554:	f127fc3f 	cmp	x1, #0x9ff
    3558:	540009e9 	b.ls	3694 <_malloc_r+0x654>  // b.plast
    355c:	f100501f 	cmp	x0, #0x14
    3560:	54001068 	b.hi	376c <_malloc_r+0x72c>  // b.pmore
    3564:	11017003 	add	w3, w0, #0x5c
    3568:	11016c02 	add	w2, w0, #0x5b
    356c:	531f7863 	lsl	w3, w3, #1
    3570:	937d7c63 	sbfiz	x3, x3, #3, #32
    3574:	8b030283 	add	x3, x20, x3
    3578:	f85f0460 	ldr	x0, [x3], #-16
    357c:	eb00007f 	cmp	x3, x0
    3580:	54000be0 	b.eq	36fc <_malloc_r+0x6bc>  // b.none
    3584:	d503201f 	nop
    3588:	f9400402 	ldr	x2, [x0, #8]
    358c:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    3590:	eb01005f 	cmp	x2, x1
    3594:	54000089 	b.ls	35a4 <_malloc_r+0x564>  // b.plast
    3598:	f9400800 	ldr	x0, [x0, #16]
    359c:	eb00007f 	cmp	x3, x0
    35a0:	54ffff41 	b.ne	3588 <_malloc_r+0x548>  // b.any
    35a4:	f9400681 	ldr	x1, [x20, #8]
    35a8:	f9400c03 	ldr	x3, [x0, #24]
    35ac:	a9010c80 	stp	x0, x3, [x4, #16]
    35b0:	f9000864 	str	x4, [x3, #16]
    35b4:	f9000c04 	str	x4, [x0, #24]
    35b8:	17fffed4 	b	3108 <_malloc_r+0xc8>
    35bc:	f100501f 	cmp	x0, #0x14
    35c0:	54000769 	b.ls	36ac <_malloc_r+0x66c>  // b.plast
    35c4:	f101501f 	cmp	x0, #0x54
    35c8:	54000e28 	b.hi	378c <_malloc_r+0x74c>  // b.pmore
    35cc:	d34cfe60 	lsr	x0, x19, #12
    35d0:	1101bc05 	add	w5, w0, #0x6f
    35d4:	1101b800 	add	w0, w0, #0x6e
    35d8:	531f78a4 	lsl	w4, w5, #1
    35dc:	937d7c84 	sbfiz	x4, x4, #3, #32
    35e0:	17ffff15 	b	3234 <_malloc_r+0x1f4>
    35e4:	f94008c7 	ldr	x7, [x6, #16]
    35e8:	b2400260 	orr	x0, x19, #0x1
    35ec:	f90004c0 	str	x0, [x6, #8]
    35f0:	8b1300c4 	add	x4, x6, x19
    35f4:	91004285 	add	x5, x20, #0x10
    35f8:	b2400068 	orr	x8, x3, #0x1
    35fc:	f9000ce1 	str	x1, [x7, #24]
    3600:	910040d7 	add	x23, x6, #0x10
    3604:	f9000827 	str	x7, [x1, #16]
    3608:	aa1503e0 	mov	x0, x21
    360c:	a9021284 	stp	x4, x4, [x20, #32]
    3610:	a9009488 	stp	x8, x5, [x4, #8]
    3614:	f9000c85 	str	x5, [x4, #24]
    3618:	f82268c3 	str	x3, [x6, x2]
    361c:	940001a5 	bl	3cb0 <__malloc_unlock>
    3620:	17ffff98 	b	3480 <_malloc_r+0x440>
    3624:	8b0200c2 	add	x2, x6, x2
    3628:	aa0603f7 	mov	x23, x6
    362c:	aa1503e0 	mov	x0, x21
    3630:	f9400443 	ldr	x3, [x2, #8]
    3634:	f8410ee4 	ldr	x4, [x23, #16]!
    3638:	b2400063 	orr	x3, x3, #0x1
    363c:	f9000443 	str	x3, [x2, #8]
    3640:	f9000c81 	str	x1, [x4, #24]
    3644:	f9000824 	str	x4, [x1, #16]
    3648:	9400019a 	bl	3cb0 <__malloc_unlock>
    364c:	17ffff8d 	b	3480 <_malloc_r+0x440>
    3650:	d343fe65 	lsr	x5, x19, #3
    3654:	110004a0 	add	w0, w5, #0x1
    3658:	531f7800 	lsl	w0, w0, #1
    365c:	937d7c00 	sbfiz	x0, x0, #3, #32
    3660:	17fffe87 	b	307c <_malloc_r+0x3c>
    3664:	8b130085 	add	x5, x4, x19
    3668:	b2400273 	orr	x19, x19, #0x1
    366c:	f9000493 	str	x19, [x4, #8]
    3670:	b2400066 	orr	x6, x3, #0x1
    3674:	a9021685 	stp	x5, x5, [x20, #32]
    3678:	aa1503e0 	mov	x0, x21
    367c:	91004097 	add	x23, x4, #0x10
    3680:	a90088a6 	stp	x6, x2, [x5, #8]
    3684:	f9000ca2 	str	x2, [x5, #24]
    3688:	f8216883 	str	x3, [x4, x1]
    368c:	94000189 	bl	3cb0 <__malloc_unlock>
    3690:	17ffff7c 	b	3480 <_malloc_r+0x440>
    3694:	d346fc20 	lsr	x0, x1, #6
    3698:	1100e403 	add	w3, w0, #0x39
    369c:	1100e002 	add	w2, w0, #0x38
    36a0:	531f7863 	lsl	w3, w3, #1
    36a4:	937d7c63 	sbfiz	x3, x3, #3, #32
    36a8:	17ffffb3 	b	3574 <_malloc_r+0x534>
    36ac:	11017005 	add	w5, w0, #0x5c
    36b0:	11016c00 	add	w0, w0, #0x5b
    36b4:	531f78a4 	lsl	w4, w5, #1
    36b8:	937d7c84 	sbfiz	x4, x4, #3, #32
    36bc:	17fffede 	b	3234 <_malloc_r+0x1f4>
    36c0:	11000508 	add	w8, w8, #0x1
    36c4:	91008084 	add	x4, x4, #0x20
    36c8:	17fffeb2 	b	3190 <_malloc_r+0x150>
    36cc:	f2402f5f 	tst	x26, #0xfff
    36d0:	54ffe321 	b.ne	3334 <_malloc_r+0x2f4>  // b.any
    36d4:	f9400a97 	ldr	x23, [x20, #16]
    36d8:	8b160316 	add	x22, x24, x22
    36dc:	b24002d6 	orr	x22, x22, #0x1
    36e0:	f90006f6 	str	x22, [x23, #8]
    36e4:	17ffff43 	b	33f0 <_malloc_r+0x3b0>
    36e8:	f9004b79 	str	x25, [x27, #144]
    36ec:	17ffff18 	b	334c <_malloc_r+0x30c>
    36f0:	f9400a97 	ldr	x23, [x20, #16]
    36f4:	f94006f6 	ldr	x22, [x23, #8]
    36f8:	17ffff49 	b	341c <_malloc_r+0x3dc>
    36fc:	f9400686 	ldr	x6, [x20, #8]
    3700:	13027c42 	asr	w2, w2, #2
    3704:	d2800021 	mov	x1, #0x1                   	// #1
    3708:	9ac22021 	lsl	x1, x1, x2
    370c:	aa060021 	orr	x1, x1, x6
    3710:	f9000681 	str	x1, [x20, #8]
    3714:	17ffffa6 	b	35ac <_malloc_r+0x56c>
    3718:	8b16033a 	add	x26, x25, x22
    371c:	aa1503e0 	mov	x0, x21
    3720:	cb1a03fa 	neg	x26, x26
    3724:	92402f5a 	and	x26, x26, #0xfff
    3728:	aa1a03e1 	mov	x1, x26
    372c:	94000165 	bl	3cc0 <_sbrk_r>
    3730:	52800002 	mov	w2, #0x0                   	// #0
    3734:	b100041f 	cmn	x0, #0x1
    3738:	54ffe2c0 	b.eq	3390 <_malloc_r+0x350>  // b.none
    373c:	cb190000 	sub	x0, x0, x25
    3740:	2a1a03e2 	mov	w2, w26
    3744:	8b1a0016 	add	x22, x0, x26
    3748:	17ffff12 	b	3390 <_malloc_r+0x350>
    374c:	d2800020 	mov	x0, #0x1                   	// #1
    3750:	f9000720 	str	x0, [x25, #8]
    3754:	aa1503e0 	mov	x0, x21
    3758:	d2800017 	mov	x23, #0x0                   	// #0
    375c:	94000155 	bl	3cb0 <__malloc_unlock>
    3760:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3764:	a94573fb 	ldp	x27, x28, [sp, #80]
    3768:	17ffff46 	b	3480 <_malloc_r+0x440>
    376c:	f101501f 	cmp	x0, #0x54
    3770:	54000228 	b.hi	37b4 <_malloc_r+0x774>  // b.pmore
    3774:	d34cfc20 	lsr	x0, x1, #12
    3778:	1101bc03 	add	w3, w0, #0x6f
    377c:	1101b802 	add	w2, w0, #0x6e
    3780:	531f7863 	lsl	w3, w3, #1
    3784:	937d7c63 	sbfiz	x3, x3, #3, #32
    3788:	17ffff7b 	b	3574 <_malloc_r+0x534>
    378c:	f105501f 	cmp	x0, #0x154
    3790:	54000228 	b.hi	37d4 <_malloc_r+0x794>  // b.pmore
    3794:	d34ffe60 	lsr	x0, x19, #15
    3798:	1101e005 	add	w5, w0, #0x78
    379c:	1101dc00 	add	w0, w0, #0x77
    37a0:	531f78a4 	lsl	w4, w5, #1
    37a4:	937d7c84 	sbfiz	x4, x4, #3, #32
    37a8:	17fffea3 	b	3234 <_malloc_r+0x1f4>
    37ac:	aa1903f7 	mov	x23, x25
    37b0:	17ffff10 	b	33f0 <_malloc_r+0x3b0>
    37b4:	f105501f 	cmp	x0, #0x154
    37b8:	54000368 	b.hi	3824 <_malloc_r+0x7e4>  // b.pmore
    37bc:	d34ffc20 	lsr	x0, x1, #15
    37c0:	1101e003 	add	w3, w0, #0x78
    37c4:	1101dc02 	add	w2, w0, #0x77
    37c8:	531f7863 	lsl	w3, w3, #1
    37cc:	937d7c63 	sbfiz	x3, x3, #3, #32
    37d0:	17ffff69 	b	3574 <_malloc_r+0x534>
    37d4:	f115501f 	cmp	x0, #0x554
    37d8:	54000368 	b.hi	3844 <_malloc_r+0x804>  // b.pmore
    37dc:	d352fe60 	lsr	x0, x19, #18
    37e0:	1101f405 	add	w5, w0, #0x7d
    37e4:	1101f000 	add	w0, w0, #0x7c
    37e8:	531f78a4 	lsl	w4, w5, #1
    37ec:	937d7c84 	sbfiz	x4, x4, #3, #32
    37f0:	17fffe91 	b	3234 <_malloc_r+0x1f4>
    37f4:	910042e1 	add	x1, x23, #0x10
    37f8:	aa1503e0 	mov	x0, x21
    37fc:	94000be5 	bl	6790 <_free_r>
    3800:	f9400a97 	ldr	x23, [x20, #16]
    3804:	b942eb81 	ldr	w1, [x28, #744]
    3808:	f94006f6 	ldr	x22, [x23, #8]
    380c:	17fffef9 	b	33f0 <_malloc_r+0x3b0>
    3810:	d100435a 	sub	x26, x26, #0x10
    3814:	52800002 	mov	w2, #0x0                   	// #0
    3818:	8b1a0376 	add	x22, x27, x26
    381c:	cb1902d6 	sub	x22, x22, x25
    3820:	17fffedc 	b	3390 <_malloc_r+0x350>
    3824:	f115501f 	cmp	x0, #0x554
    3828:	54000168 	b.hi	3854 <_malloc_r+0x814>  // b.pmore
    382c:	d352fc20 	lsr	x0, x1, #18
    3830:	1101f403 	add	w3, w0, #0x7d
    3834:	1101f002 	add	w2, w0, #0x7c
    3838:	531f7863 	lsl	w3, w3, #1
    383c:	937d7c63 	sbfiz	x3, x3, #3, #32
    3840:	17ffff4d 	b	3574 <_malloc_r+0x534>
    3844:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    3848:	52800fe5 	mov	w5, #0x7f                  	// #127
    384c:	52800fc0 	mov	w0, #0x7e                  	// #126
    3850:	17fffe79 	b	3234 <_malloc_r+0x1f4>
    3854:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    3858:	52800fc2 	mov	w2, #0x7e                  	// #126
    385c:	17ffff46 	b	3574 <_malloc_r+0x534>
    3860:	f9400681 	ldr	x1, [x20, #8]
    3864:	17fffe58 	b	31c4 <_malloc_r+0x184>
    3868:	d503201f 	nop
    386c:	d503201f 	nop
    3870:	d503201f 	nop
    3874:	d503201f 	nop
    3878:	d503201f 	nop
    387c:	d503201f 	nop

0000000000003880 <memcpy>:
    3880:	f9800020 	prfm	pldl1keep, [x1]
    3884:	8b020024 	add	x4, x1, x2
    3888:	8b020005 	add	x5, x0, x2
    388c:	f100405f 	cmp	x2, #0x10
    3890:	54000209 	b.ls	38d0 <memcpy+0x50>  // b.plast
    3894:	f101805f 	cmp	x2, #0x60
    3898:	54000648 	b.hi	3960 <memcpy+0xe0>  // b.pmore
    389c:	d1000449 	sub	x9, x2, #0x1
    38a0:	a9401c26 	ldp	x6, x7, [x1]
    38a4:	37300469 	tbnz	w9, #6, 3930 <memcpy+0xb0>
    38a8:	a97f348c 	ldp	x12, x13, [x4, #-16]
    38ac:	362800a9 	tbz	w9, #5, 38c0 <memcpy+0x40>
    38b0:	a9412428 	ldp	x8, x9, [x1, #16]
    38b4:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    38b8:	a9012408 	stp	x8, x9, [x0, #16]
    38bc:	a93e2caa 	stp	x10, x11, [x5, #-32]
    38c0:	a9001c06 	stp	x6, x7, [x0]
    38c4:	a93f34ac 	stp	x12, x13, [x5, #-16]
    38c8:	d65f03c0 	ret
    38cc:	d503201f 	nop
    38d0:	f100205f 	cmp	x2, #0x8
    38d4:	540000e3 	b.cc	38f0 <memcpy+0x70>  // b.lo, b.ul, b.last
    38d8:	f9400026 	ldr	x6, [x1]
    38dc:	f85f8087 	ldur	x7, [x4, #-8]
    38e0:	f9000006 	str	x6, [x0]
    38e4:	f81f80a7 	stur	x7, [x5, #-8]
    38e8:	d65f03c0 	ret
    38ec:	d503201f 	nop
    38f0:	361000c2 	tbz	w2, #2, 3908 <memcpy+0x88>
    38f4:	b9400026 	ldr	w6, [x1]
    38f8:	b85fc087 	ldur	w7, [x4, #-4]
    38fc:	b9000006 	str	w6, [x0]
    3900:	b81fc0a7 	stur	w7, [x5, #-4]
    3904:	d65f03c0 	ret
    3908:	b4000102 	cbz	x2, 3928 <memcpy+0xa8>
    390c:	d341fc49 	lsr	x9, x2, #1
    3910:	39400026 	ldrb	w6, [x1]
    3914:	385ff087 	ldurb	w7, [x4, #-1]
    3918:	38696828 	ldrb	w8, [x1, x9]
    391c:	39000006 	strb	w6, [x0]
    3920:	38296808 	strb	w8, [x0, x9]
    3924:	381ff0a7 	sturb	w7, [x5, #-1]
    3928:	d65f03c0 	ret
    392c:	d503201f 	nop
    3930:	a9412428 	ldp	x8, x9, [x1, #16]
    3934:	a9422c2a 	ldp	x10, x11, [x1, #32]
    3938:	a943342c 	ldp	x12, x13, [x1, #48]
    393c:	a97e0881 	ldp	x1, x2, [x4, #-32]
    3940:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    3944:	a9001c06 	stp	x6, x7, [x0]
    3948:	a9012408 	stp	x8, x9, [x0, #16]
    394c:	a9022c0a 	stp	x10, x11, [x0, #32]
    3950:	a903340c 	stp	x12, x13, [x0, #48]
    3954:	a93e08a1 	stp	x1, x2, [x5, #-32]
    3958:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    395c:	d65f03c0 	ret
    3960:	92400c09 	and	x9, x0, #0xf
    3964:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3968:	a940342c 	ldp	x12, x13, [x1]
    396c:	cb090021 	sub	x1, x1, x9
    3970:	8b090042 	add	x2, x2, x9
    3974:	a9411c26 	ldp	x6, x7, [x1, #16]
    3978:	a900340c 	stp	x12, x13, [x0]
    397c:	a9422428 	ldp	x8, x9, [x1, #32]
    3980:	a9432c2a 	ldp	x10, x11, [x1, #48]
    3984:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    3988:	f1024042 	subs	x2, x2, #0x90
    398c:	54000169 	b.ls	39b8 <memcpy+0x138>  // b.plast
    3990:	a9011c66 	stp	x6, x7, [x3, #16]
    3994:	a9411c26 	ldp	x6, x7, [x1, #16]
    3998:	a9022468 	stp	x8, x9, [x3, #32]
    399c:	a9422428 	ldp	x8, x9, [x1, #32]
    39a0:	a9032c6a 	stp	x10, x11, [x3, #48]
    39a4:	a9432c2a 	ldp	x10, x11, [x1, #48]
    39a8:	a984346c 	stp	x12, x13, [x3, #64]!
    39ac:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    39b0:	f1010042 	subs	x2, x2, #0x40
    39b4:	54fffee8 	b.hi	3990 <memcpy+0x110>  // b.pmore
    39b8:	a97c0881 	ldp	x1, x2, [x4, #-64]
    39bc:	a9011c66 	stp	x6, x7, [x3, #16]
    39c0:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    39c4:	a9022468 	stp	x8, x9, [x3, #32]
    39c8:	a97e2488 	ldp	x8, x9, [x4, #-32]
    39cc:	a9032c6a 	stp	x10, x11, [x3, #48]
    39d0:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    39d4:	a904346c 	stp	x12, x13, [x3, #64]
    39d8:	a93c08a1 	stp	x1, x2, [x5, #-64]
    39dc:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    39e0:	a93e24a8 	stp	x8, x9, [x5, #-32]
    39e4:	a93f2caa 	stp	x10, x11, [x5, #-16]
    39e8:	d65f03c0 	ret
    39ec:	d503201f 	nop
    39f0:	d503201f 	nop
    39f4:	d503201f 	nop
    39f8:	d503201f 	nop
    39fc:	d503201f 	nop

0000000000003a00 <memmove>:
    3a00:	cb010005 	sub	x5, x0, x1
    3a04:	f101805f 	cmp	x2, #0x60
    3a08:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    3a0c:	54fff3a2 	b.cs	3880 <memcpy>  // b.hs, b.nlast
    3a10:	b40004c5 	cbz	x5, 3aa8 <memmove+0xa8>
    3a14:	8b020004 	add	x4, x0, x2
    3a18:	8b020023 	add	x3, x1, x2
    3a1c:	92400c85 	and	x5, x4, #0xf
    3a20:	a97f346c 	ldp	x12, x13, [x3, #-16]
    3a24:	cb050063 	sub	x3, x3, x5
    3a28:	cb050042 	sub	x2, x2, x5
    3a2c:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3a30:	a93f348c 	stp	x12, x13, [x4, #-16]
    3a34:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3a38:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3a3c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3a40:	cb050084 	sub	x4, x4, x5
    3a44:	f1020042 	subs	x2, x2, #0x80
    3a48:	54000189 	b.ls	3a78 <memmove+0x78>  // b.plast
    3a4c:	d503201f 	nop
    3a50:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3a54:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3a58:	a93e2488 	stp	x8, x9, [x4, #-32]
    3a5c:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3a60:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3a64:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3a68:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    3a6c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3a70:	f1010042 	subs	x2, x2, #0x40
    3a74:	54fffee8 	b.hi	3a50 <memmove+0x50>  // b.pmore
    3a78:	a9431422 	ldp	x2, x5, [x1, #48]
    3a7c:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3a80:	a9421c26 	ldp	x6, x7, [x1, #32]
    3a84:	a93e2488 	stp	x8, x9, [x4, #-32]
    3a88:	a9412428 	ldp	x8, x9, [x1, #16]
    3a8c:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3a90:	a9402c2a 	ldp	x10, x11, [x1]
    3a94:	a93c348c 	stp	x12, x13, [x4, #-64]
    3a98:	a9031402 	stp	x2, x5, [x0, #48]
    3a9c:	a9021c06 	stp	x6, x7, [x0, #32]
    3aa0:	a9012408 	stp	x8, x9, [x0, #16]
    3aa4:	a9002c0a 	stp	x10, x11, [x0]
    3aa8:	d65f03c0 	ret
    3aac:	d503201f 	nop
    3ab0:	d503201f 	nop
    3ab4:	d503201f 	nop
    3ab8:	d503201f 	nop
    3abc:	d503201f 	nop

0000000000003ac0 <memset>:
    3ac0:	4e010c20 	dup	v0.16b, w1
    3ac4:	8b020004 	add	x4, x0, x2
    3ac8:	f101805f 	cmp	x2, #0x60
    3acc:	540003c8 	b.hi	3b44 <memset+0x84>  // b.pmore
    3ad0:	f100405f 	cmp	x2, #0x10
    3ad4:	54000202 	b.cs	3b14 <memset+0x54>  // b.hs, b.nlast
    3ad8:	4e083c01 	mov	x1, v0.d[0]
    3adc:	361800a2 	tbz	w2, #3, 3af0 <memset+0x30>
    3ae0:	f9000001 	str	x1, [x0]
    3ae4:	f81f8081 	stur	x1, [x4, #-8]
    3ae8:	d65f03c0 	ret
    3aec:	d503201f 	nop
    3af0:	36100082 	tbz	w2, #2, 3b00 <memset+0x40>
    3af4:	b9000001 	str	w1, [x0]
    3af8:	b81fc081 	stur	w1, [x4, #-4]
    3afc:	d65f03c0 	ret
    3b00:	b4000082 	cbz	x2, 3b10 <memset+0x50>
    3b04:	39000001 	strb	w1, [x0]
    3b08:	36080042 	tbz	w2, #1, 3b10 <memset+0x50>
    3b0c:	781fe081 	sturh	w1, [x4, #-2]
    3b10:	d65f03c0 	ret
    3b14:	3d800000 	str	q0, [x0]
    3b18:	373000c2 	tbnz	w2, #6, 3b30 <memset+0x70>
    3b1c:	3c9f0080 	stur	q0, [x4, #-16]
    3b20:	36280062 	tbz	w2, #5, 3b2c <memset+0x6c>
    3b24:	3d800400 	str	q0, [x0, #16]
    3b28:	3c9e0080 	stur	q0, [x4, #-32]
    3b2c:	d65f03c0 	ret
    3b30:	3d800400 	str	q0, [x0, #16]
    3b34:	ad010000 	stp	q0, q0, [x0, #32]
    3b38:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3b3c:	d65f03c0 	ret
    3b40:	d503201f 	nop
    3b44:	12001c21 	and	w1, w1, #0xff
    3b48:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3b4c:	3d800000 	str	q0, [x0]
    3b50:	f104005f 	cmp	x2, #0x100
    3b54:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    3b58:	54000180 	b.eq	3b88 <memset+0xc8>  // b.none
    3b5c:	cb030082 	sub	x2, x4, x3
    3b60:	d1004063 	sub	x3, x3, #0x10
    3b64:	d1014042 	sub	x2, x2, #0x50
    3b68:	ad010060 	stp	q0, q0, [x3, #32]
    3b6c:	ad820060 	stp	q0, q0, [x3, #64]!
    3b70:	f1010042 	subs	x2, x2, #0x40
    3b74:	54ffffa8 	b.hi	3b68 <memset+0xa8>  // b.pmore
    3b78:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3b7c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3b80:	d65f03c0 	ret
    3b84:	d503201f 	nop
    3b88:	d53b00e5 	mrs	x5, dczid_el0
    3b8c:	3727fe85 	tbnz	w5, #4, 3b5c <memset+0x9c>
    3b90:	12000ca5 	and	w5, w5, #0xf
    3b94:	710010bf 	cmp	w5, #0x4
    3b98:	54000281 	b.ne	3be8 <memset+0x128>  // b.any
    3b9c:	3d800460 	str	q0, [x3, #16]
    3ba0:	ad010060 	stp	q0, q0, [x3, #32]
    3ba4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    3ba8:	ad020060 	stp	q0, q0, [x3, #64]
    3bac:	ad030060 	stp	q0, q0, [x3, #96]
    3bb0:	cb030082 	sub	x2, x4, x3
    3bb4:	d1040042 	sub	x2, x2, #0x100
    3bb8:	91020063 	add	x3, x3, #0x80
    3bbc:	d503201f 	nop
    3bc0:	d50b7423 	dc	zva, x3
    3bc4:	91010063 	add	x3, x3, #0x40
    3bc8:	f1010042 	subs	x2, x2, #0x40
    3bcc:	54ffffa8 	b.hi	3bc0 <memset+0x100>  // b.pmore
    3bd0:	ad000060 	stp	q0, q0, [x3]
    3bd4:	ad010060 	stp	q0, q0, [x3, #32]
    3bd8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3bdc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3be0:	d65f03c0 	ret
    3be4:	d503201f 	nop
    3be8:	710014bf 	cmp	w5, #0x5
    3bec:	54000241 	b.ne	3c34 <memset+0x174>  // b.any
    3bf0:	3d800460 	str	q0, [x3, #16]
    3bf4:	ad010060 	stp	q0, q0, [x3, #32]
    3bf8:	ad020060 	stp	q0, q0, [x3, #64]
    3bfc:	ad030060 	stp	q0, q0, [x3, #96]
    3c00:	9279e063 	and	x3, x3, #0xffffffffffffff80
    3c04:	cb030082 	sub	x2, x4, x3
    3c08:	d1040042 	sub	x2, x2, #0x100
    3c0c:	91020063 	add	x3, x3, #0x80
    3c10:	d50b7423 	dc	zva, x3
    3c14:	91020063 	add	x3, x3, #0x80
    3c18:	f1020042 	subs	x2, x2, #0x80
    3c1c:	54ffffa8 	b.hi	3c10 <memset+0x150>  // b.pmore
    3c20:	ad3c0080 	stp	q0, q0, [x4, #-128]
    3c24:	ad3d0080 	stp	q0, q0, [x4, #-96]
    3c28:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3c2c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3c30:	d65f03c0 	ret
    3c34:	52800086 	mov	w6, #0x4                   	// #4
    3c38:	1ac520c7 	lsl	w7, w6, w5
    3c3c:	910100e5 	add	x5, x7, #0x40
    3c40:	eb05005f 	cmp	x2, x5
    3c44:	54fff8c3 	b.cc	3b5c <memset+0x9c>  // b.lo, b.ul, b.last
    3c48:	d10004e6 	sub	x6, x7, #0x1
    3c4c:	8b070065 	add	x5, x3, x7
    3c50:	91004063 	add	x3, x3, #0x10
    3c54:	eb0300a2 	subs	x2, x5, x3
    3c58:	8a2600a5 	bic	x5, x5, x6
    3c5c:	540000a0 	b.eq	3c70 <memset+0x1b0>  // b.none
    3c60:	ac820060 	stp	q0, q0, [x3], #64
    3c64:	ad3f0060 	stp	q0, q0, [x3, #-32]
    3c68:	f1010042 	subs	x2, x2, #0x40
    3c6c:	54ffffa8 	b.hi	3c60 <memset+0x1a0>  // b.pmore
    3c70:	aa0503e3 	mov	x3, x5
    3c74:	cb050082 	sub	x2, x4, x5
    3c78:	eb070042 	subs	x2, x2, x7
    3c7c:	540000a3 	b.cc	3c90 <memset+0x1d0>  // b.lo, b.ul, b.last
    3c80:	d50b7423 	dc	zva, x3
    3c84:	8b070063 	add	x3, x3, x7
    3c88:	eb070042 	subs	x2, x2, x7
    3c8c:	54ffffa2 	b.cs	3c80 <memset+0x1c0>  // b.hs, b.nlast
    3c90:	8b070042 	add	x2, x2, x7
    3c94:	d1008063 	sub	x3, x3, #0x20
    3c98:	17ffffb6 	b	3b70 <memset+0xb0>
    3c9c:	d503201f 	nop

0000000000003ca0 <__malloc_lock>:
    3ca0:	d65f03c0 	ret
    3ca4:	d503201f 	nop
    3ca8:	d503201f 	nop
    3cac:	d503201f 	nop

0000000000003cb0 <__malloc_unlock>:
    3cb0:	d65f03c0 	ret
    3cb4:	d503201f 	nop
    3cb8:	d503201f 	nop
    3cbc:	d503201f 	nop

0000000000003cc0 <_sbrk_r>:
    3cc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3cc4:	910003fd 	mov	x29, sp
    3cc8:	a90153f3 	stp	x19, x20, [sp, #16]
    3ccc:	d0000054 	adrp	x20, d000 <__malloc_av_+0x780>
    3cd0:	aa0003f3 	mov	x19, x0
    3cd4:	b905da9f 	str	wzr, [x20, #1496]
    3cd8:	aa0103e0 	mov	x0, x1
    3cdc:	97fffc05 	bl	2cf0 <_sbrk>
    3ce0:	b100041f 	cmn	x0, #0x1
    3ce4:	54000080 	b.eq	3cf4 <_sbrk_r+0x34>  // b.none
    3ce8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3cec:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3cf0:	d65f03c0 	ret
    3cf4:	b945da81 	ldr	w1, [x20, #1496]
    3cf8:	34ffff81 	cbz	w1, 3ce8 <_sbrk_r+0x28>
    3cfc:	b9000261 	str	w1, [x19]
    3d00:	a94153f3 	ldp	x19, x20, [sp, #16]
    3d04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3d08:	d65f03c0 	ret
    3d0c:	d503201f 	nop

0000000000003d10 <__sprint_r.part.0>:
    3d10:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    3d14:	910003fd 	mov	x29, sp
    3d18:	b940ac23 	ldr	w3, [x1, #172]
    3d1c:	a90363f7 	stp	x23, x24, [sp, #48]
    3d20:	aa0203f8 	mov	x24, x2
    3d24:	36680563 	tbz	w3, #13, 3dd0 <__sprint_r.part.0+0xc0>
    3d28:	a9025bf5 	stp	x21, x22, [sp, #32]
    3d2c:	aa0003f5 	mov	x21, x0
    3d30:	f9400840 	ldr	x0, [x2, #16]
    3d34:	a90153f3 	stp	x19, x20, [sp, #16]
    3d38:	aa0103f4 	mov	x20, x1
    3d3c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3d40:	f940005a 	ldr	x26, [x2]
    3d44:	b40003c0 	cbz	x0, 3dbc <__sprint_r.part.0+0xac>
    3d48:	a9406756 	ldp	x22, x25, [x26]
    3d4c:	d342ff39 	lsr	x25, x25, #2
    3d50:	2a1903f7 	mov	w23, w25
    3d54:	7100033f 	cmp	w25, #0x0
    3d58:	540002ad 	b.le	3dac <__sprint_r.part.0+0x9c>
    3d5c:	d2800013 	mov	x19, #0x0                   	// #0
    3d60:	14000003 	b	3d6c <__sprint_r.part.0+0x5c>
    3d64:	6b1302ff 	cmp	w23, w19
    3d68:	5400020d 	b.le	3da8 <__sprint_r.part.0+0x98>
    3d6c:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    3d70:	aa1403e2 	mov	x2, x20
    3d74:	aa1503e0 	mov	x0, x21
    3d78:	91000673 	add	x19, x19, #0x1
    3d7c:	94000a15 	bl	65d0 <_fputwc_r>
    3d80:	3100041f 	cmn	w0, #0x1
    3d84:	54ffff01 	b.ne	3d64 <__sprint_r.part.0+0x54>  // b.any
    3d88:	a94153f3 	ldp	x19, x20, [sp, #16]
    3d8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3d90:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3d94:	b9000b1f 	str	wzr, [x24, #8]
    3d98:	f9000b1f 	str	xzr, [x24, #16]
    3d9c:	a94363f7 	ldp	x23, x24, [sp, #48]
    3da0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3da4:	d65f03c0 	ret
    3da8:	f9400b00 	ldr	x0, [x24, #16]
    3dac:	cb39c800 	sub	x0, x0, w25, sxtw #2
    3db0:	f9000b00 	str	x0, [x24, #16]
    3db4:	9100435a 	add	x26, x26, #0x10
    3db8:	b5fffc80 	cbnz	x0, 3d48 <__sprint_r.part.0+0x38>
    3dbc:	52800000 	mov	w0, #0x0                   	// #0
    3dc0:	a94153f3 	ldp	x19, x20, [sp, #16]
    3dc4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3dc8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3dcc:	17fffff2 	b	3d94 <__sprint_r.part.0+0x84>
    3dd0:	94000b2c 	bl	6a80 <__sfvwrite_r>
    3dd4:	b9000b1f 	str	wzr, [x24, #8]
    3dd8:	f9000b1f 	str	xzr, [x24, #16]
    3ddc:	a94363f7 	ldp	x23, x24, [sp, #48]
    3de0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3de4:	d65f03c0 	ret
    3de8:	d503201f 	nop
    3dec:	d503201f 	nop

0000000000003df0 <__sprint_r>:
    3df0:	f9400844 	ldr	x4, [x2, #16]
    3df4:	b4000044 	cbz	x4, 3dfc <__sprint_r+0xc>
    3df8:	17ffffc6 	b	3d10 <__sprint_r.part.0>
    3dfc:	52800000 	mov	w0, #0x0                   	// #0
    3e00:	b900085f 	str	wzr, [x2, #8]
    3e04:	d65f03c0 	ret
    3e08:	d503201f 	nop
    3e0c:	d503201f 	nop

0000000000003e10 <_vfiprintf_r>:
    3e10:	d10843ff 	sub	sp, sp, #0x210
    3e14:	a9007bfd 	stp	x29, x30, [sp]
    3e18:	910003fd 	mov	x29, sp
    3e1c:	a9025bf5 	stp	x21, x22, [sp, #32]
    3e20:	aa0303f5 	mov	x21, x3
    3e24:	f9400063 	ldr	x3, [x3]
    3e28:	f90037e3 	str	x3, [sp, #104]
    3e2c:	f94006a3 	ldr	x3, [x21, #8]
    3e30:	f90043e3 	str	x3, [sp, #128]
    3e34:	b9401aa3 	ldr	w3, [x21, #24]
    3e38:	a90153f3 	stp	x19, x20, [sp, #16]
    3e3c:	aa0003f3 	mov	x19, x0
    3e40:	aa0203f4 	mov	x20, x2
    3e44:	9103e3e0 	add	x0, sp, #0xf8
    3e48:	d2800102 	mov	x2, #0x8                   	// #8
    3e4c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3e50:	aa0103f9 	mov	x25, x1
    3e54:	52800001 	mov	w1, #0x0                   	// #0
    3e58:	b900b3e3 	str	w3, [sp, #176]
    3e5c:	97ffff19 	bl	3ac0 <memset>
    3e60:	b4000073 	cbz	x19, 3e6c <_vfiprintf_r+0x5c>
    3e64:	b9405260 	ldr	w0, [x19, #80]
    3e68:	34002020 	cbz	w0, 426c <_vfiprintf_r+0x45c>
    3e6c:	79c02321 	ldrsh	w1, [x25, #16]
    3e70:	12003c20 	and	w0, w1, #0xffff
    3e74:	376800e1 	tbnz	w1, #13, 3e90 <_vfiprintf_r+0x80>
    3e78:	b940af22 	ldr	w2, [x25, #172]
    3e7c:	32130021 	orr	w1, w1, #0x2000
    3e80:	12003c20 	and	w0, w1, #0xffff
    3e84:	79002321 	strh	w1, [x25, #16]
    3e88:	12127841 	and	w1, w2, #0xffffdfff
    3e8c:	b900af21 	str	w1, [x25, #172]
    3e90:	36180520 	tbz	w0, #3, 3f34 <_vfiprintf_r+0x124>
    3e94:	f9400f21 	ldr	x1, [x25, #24]
    3e98:	b40004e1 	cbz	x1, 3f34 <_vfiprintf_r+0x124>
    3e9c:	52800341 	mov	w1, #0x1a                  	// #26
    3ea0:	0a010000 	and	w0, w0, w1
    3ea4:	7100281f 	cmp	w0, #0xa
    3ea8:	54000580 	b.eq	3f58 <_vfiprintf_r+0x148>  // b.none
    3eac:	a90573fb 	stp	x27, x28, [sp, #80]
    3eb0:	910643fc 	add	x28, sp, #0x190
    3eb4:	d0000055 	adrp	x21, d000 <__malloc_av_+0x780>
    3eb8:	aa1c03fb 	mov	x27, x28
    3ebc:	910302b5 	add	x21, x21, #0xc0
    3ec0:	90000040 	adrp	x0, b000 <pow10.0+0x80>
    3ec4:	910aa000 	add	x0, x0, #0x2a8
    3ec8:	a90363f7 	stp	x23, x24, [sp, #48]
    3ecc:	b90067ff 	str	wzr, [sp, #100]
    3ed0:	f9003fe0 	str	x0, [sp, #120]
    3ed4:	f90047ff 	str	xzr, [sp, #136]
    3ed8:	a909ffff 	stp	xzr, xzr, [sp, #152]
    3edc:	f90057ff 	str	xzr, [sp, #168]
    3ee0:	f9008bfc 	str	x28, [sp, #272]
    3ee4:	b9011bff 	str	wzr, [sp, #280]
    3ee8:	f90093ff 	str	xzr, [sp, #288]
    3eec:	aa1403f7 	mov	x23, x20
    3ef0:	f94076b6 	ldr	x22, [x21, #232]
    3ef4:	94000fa7 	bl	7d90 <__locale_mb_cur_max>
    3ef8:	9103e3e4 	add	x4, sp, #0xf8
    3efc:	93407c03 	sxtw	x3, w0
    3f00:	aa1703e2 	mov	x2, x23
    3f04:	9103d3e1 	add	x1, sp, #0xf4
    3f08:	aa1303e0 	mov	x0, x19
    3f0c:	d63f02c0 	blr	x22
    3f10:	7100001f 	cmp	w0, #0x0
    3f14:	340004a0 	cbz	w0, 3fa8 <_vfiprintf_r+0x198>
    3f18:	540003ab 	b.lt	3f8c <_vfiprintf_r+0x17c>  // b.tstop
    3f1c:	b940f7e1 	ldr	w1, [sp, #244]
    3f20:	7100943f 	cmp	w1, #0x25
    3f24:	54001720 	b.eq	4208 <_vfiprintf_r+0x3f8>  // b.none
    3f28:	93407c00 	sxtw	x0, w0
    3f2c:	8b0002f7 	add	x23, x23, x0
    3f30:	17fffff0 	b	3ef0 <_vfiprintf_r+0xe0>
    3f34:	aa1903e1 	mov	x1, x25
    3f38:	aa1303e0 	mov	x0, x19
    3f3c:	9400072d 	bl	5bf0 <__swsetup_r>
    3f40:	3500b220 	cbnz	w0, 5584 <_vfiprintf_r+0x1774>
    3f44:	79402320 	ldrh	w0, [x25, #16]
    3f48:	52800341 	mov	w1, #0x1a                  	// #26
    3f4c:	0a010000 	and	w0, w0, w1
    3f50:	7100281f 	cmp	w0, #0xa
    3f54:	54fffac1 	b.ne	3eac <_vfiprintf_r+0x9c>  // b.any
    3f58:	79c02720 	ldrsh	w0, [x25, #18]
    3f5c:	37fffa80 	tbnz	w0, #31, 3eac <_vfiprintf_r+0x9c>
    3f60:	a9401ea6 	ldp	x6, x7, [x21]
    3f64:	aa1403e2 	mov	x2, x20
    3f68:	a94116a4 	ldp	x4, x5, [x21, #16]
    3f6c:	aa1903e1 	mov	x1, x25
    3f70:	aa1303e0 	mov	x0, x19
    3f74:	910303e3 	add	x3, sp, #0xc0
    3f78:	a90c1fe6 	stp	x6, x7, [sp, #192]
    3f7c:	a90d17e4 	stp	x4, x5, [sp, #208]
    3f80:	9400068c 	bl	59b0 <__sbprintf>
    3f84:	b90067e0 	str	w0, [sp, #100]
    3f88:	140000b2 	b	4250 <_vfiprintf_r+0x440>
    3f8c:	9103e3e0 	add	x0, sp, #0xf8
    3f90:	d2800102 	mov	x2, #0x8                   	// #8
    3f94:	52800001 	mov	w1, #0x0                   	// #0
    3f98:	97fffeca 	bl	3ac0 <memset>
    3f9c:	d2800020 	mov	x0, #0x1                   	// #1
    3fa0:	8b0002f7 	add	x23, x23, x0
    3fa4:	17ffffd3 	b	3ef0 <_vfiprintf_r+0xe0>
    3fa8:	2a0003f6 	mov	w22, w0
    3fac:	cb1402e0 	sub	x0, x23, x20
    3fb0:	2a0003f8 	mov	w24, w0
    3fb4:	34008d60 	cbz	w0, 5160 <_vfiprintf_r+0x1350>
    3fb8:	f94093e2 	ldr	x2, [sp, #288]
    3fbc:	93407f01 	sxtw	x1, w24
    3fc0:	b9411be0 	ldr	w0, [sp, #280]
    3fc4:	8b020022 	add	x2, x1, x2
    3fc8:	a9000774 	stp	x20, x1, [x27]
    3fcc:	11000400 	add	w0, w0, #0x1
    3fd0:	b9011be0 	str	w0, [sp, #280]
    3fd4:	f90093e2 	str	x2, [sp, #288]
    3fd8:	71001c1f 	cmp	w0, #0x7
    3fdc:	5400120d 	b.le	421c <_vfiprintf_r+0x40c>
    3fe0:	b4006222 	cbz	x2, 4c24 <_vfiprintf_r+0xe14>
    3fe4:	910443e2 	add	x2, sp, #0x110
    3fe8:	aa1903e1 	mov	x1, x25
    3fec:	aa1303e0 	mov	x0, x19
    3ff0:	97ffff48 	bl	3d10 <__sprint_r.part.0>
    3ff4:	35001260 	cbnz	w0, 4240 <_vfiprintf_r+0x430>
    3ff8:	910643fb 	add	x27, sp, #0x190
    3ffc:	b94067e0 	ldr	w0, [sp, #100]
    4000:	0b180000 	add	w0, w0, w24
    4004:	b90067e0 	str	w0, [sp, #100]
    4008:	34008ad6 	cbz	w22, 5160 <_vfiprintf_r+0x1350>
    400c:	394006e0 	ldrb	w0, [x23, #1]
    4010:	12800004 	mov	w4, #0xffffffff            	// #-1
    4014:	910006f4 	add	x20, x23, #0x1
    4018:	2a0403f6 	mov	w22, w4
    401c:	5280001c 	mov	w28, #0x0                   	// #0
    4020:	b90063ff 	str	wzr, [sp, #96]
    4024:	3903bfff 	strb	wzr, [sp, #239]
    4028:	91000694 	add	x20, x20, #0x1
    402c:	51008001 	sub	w1, w0, #0x20
    4030:	7101683f 	cmp	w1, #0x5a
    4034:	54000c49 	b.ls	41bc <_vfiprintf_r+0x3ac>  // b.plast
    4038:	34008940 	cbz	w0, 5160 <_vfiprintf_r+0x1350>
    403c:	52800036 	mov	w22, #0x1                   	// #1
    4040:	9104a3fa 	add	x26, sp, #0x128
    4044:	2a1603f7 	mov	w23, w22
    4048:	3903bfff 	strb	wzr, [sp, #239]
    404c:	3904a3e0 	strb	w0, [sp, #296]
    4050:	52800004 	mov	w4, #0x0                   	// #0
    4054:	f9003bff 	str	xzr, [sp, #112]
    4058:	b9411be1 	ldr	w1, [sp, #280]
    405c:	11000ac0 	add	w0, w22, #0x2
    4060:	721f038a 	ands	w10, w28, #0x2
    4064:	52801098 	mov	w24, #0x84                  	// #132
    4068:	11000422 	add	w2, w1, #0x1
    406c:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    4070:	2a0203e8 	mov	w8, w2
    4074:	6a180398 	ands	w24, w28, w24
    4078:	f94093e0 	ldr	x0, [sp, #288]
    407c:	540000a1 	b.ne	4090 <_vfiprintf_r+0x280>  // b.any
    4080:	b94063e3 	ldr	w3, [sp, #96]
    4084:	4b160069 	sub	w9, w3, w22
    4088:	7100013f 	cmp	w9, #0x0
    408c:	5400496c 	b.gt	49b8 <_vfiprintf_r+0xba8>
    4090:	3943bfe2 	ldrb	w2, [sp, #239]
    4094:	340001a2 	cbz	w2, 40c8 <_vfiprintf_r+0x2b8>
    4098:	9103bfe1 	add	x1, sp, #0xef
    409c:	91000400 	add	x0, x0, #0x1
    40a0:	f9000361 	str	x1, [x27]
    40a4:	d2800021 	mov	x1, #0x1                   	// #1
    40a8:	f9000761 	str	x1, [x27, #8]
    40ac:	b9011be8 	str	w8, [sp, #280]
    40b0:	f90093e0 	str	x0, [sp, #288]
    40b4:	71001d1f 	cmp	w8, #0x7
    40b8:	540044cc 	b.gt	4950 <_vfiprintf_r+0xb40>
    40bc:	2a0803e1 	mov	w1, w8
    40c0:	9100437b 	add	x27, x27, #0x10
    40c4:	11000508 	add	w8, w8, #0x1
    40c8:	340002ca 	cbz	w10, 4120 <_vfiprintf_r+0x310>
    40cc:	91000800 	add	x0, x0, #0x2
    40d0:	9103c3e2 	add	x2, sp, #0xf0
    40d4:	d2800041 	mov	x1, #0x2                   	// #2
    40d8:	a9000762 	stp	x2, x1, [x27]
    40dc:	b9011be8 	str	w8, [sp, #280]
    40e0:	f90093e0 	str	x0, [sp, #288]
    40e4:	71001d1f 	cmp	w8, #0x7
    40e8:	5400460d 	b.le	49a8 <_vfiprintf_r+0xb98>
    40ec:	b4005b20 	cbz	x0, 4c50 <_vfiprintf_r+0xe40>
    40f0:	910443e2 	add	x2, sp, #0x110
    40f4:	aa1903e1 	mov	x1, x25
    40f8:	aa1303e0 	mov	x0, x19
    40fc:	b90093e4 	str	w4, [sp, #144]
    4100:	97ffff04 	bl	3d10 <__sprint_r.part.0>
    4104:	35000940 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4108:	b9411be1 	ldr	w1, [sp, #280]
    410c:	910643fb 	add	x27, sp, #0x190
    4110:	b94093e4 	ldr	w4, [sp, #144]
    4114:	f94093e0 	ldr	x0, [sp, #288]
    4118:	11000428 	add	w8, w1, #0x1
    411c:	d503201f 	nop
    4120:	7102031f 	cmp	w24, #0x80
    4124:	54002f80 	b.eq	4714 <_vfiprintf_r+0x904>  // b.none
    4128:	4b170098 	sub	w24, w4, w23
    412c:	7100031f 	cmp	w24, #0x0
    4130:	540038cc 	b.gt	4848 <_vfiprintf_r+0xa38>
    4134:	93407ef7 	sxtw	x23, w23
    4138:	a9005f7a 	stp	x26, x23, [x27]
    413c:	8b0002e0 	add	x0, x23, x0
    4140:	b9011be8 	str	w8, [sp, #280]
    4144:	f90093e0 	str	x0, [sp, #288]
    4148:	71001d1f 	cmp	w8, #0x7
    414c:	540029ad 	b.le	4680 <_vfiprintf_r+0x870>
    4150:	b4004ba0 	cbz	x0, 4ac4 <_vfiprintf_r+0xcb4>
    4154:	910443e2 	add	x2, sp, #0x110
    4158:	aa1903e1 	mov	x1, x25
    415c:	aa1303e0 	mov	x0, x19
    4160:	97fffeec 	bl	3d10 <__sprint_r.part.0>
    4164:	35000640 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4168:	f94093e0 	ldr	x0, [sp, #288]
    416c:	910643e5 	add	x5, sp, #0x190
    4170:	361000bc 	tbz	w28, #2, 4184 <_vfiprintf_r+0x374>
    4174:	b94063e1 	ldr	w1, [sp, #96]
    4178:	4b160037 	sub	w23, w1, w22
    417c:	710002ff 	cmp	w23, #0x0
    4180:	54004b0c 	b.gt	4ae0 <_vfiprintf_r+0xcd0>
    4184:	b94063e1 	ldr	w1, [sp, #96]
    4188:	6b16003f 	cmp	w1, w22
    418c:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    4190:	b94067e1 	ldr	w1, [sp, #100]
    4194:	0b030021 	add	w1, w1, w3
    4198:	b90067e1 	str	w1, [sp, #100]
    419c:	b5003c60 	cbnz	x0, 4928 <_vfiprintf_r+0xb18>
    41a0:	f9403be1 	ldr	x1, [sp, #112]
    41a4:	b9011bff 	str	wzr, [sp, #280]
    41a8:	910643fb 	add	x27, sp, #0x190
    41ac:	b4ffea01 	cbz	x1, 3eec <_vfiprintf_r+0xdc>
    41b0:	aa1303e0 	mov	x0, x19
    41b4:	94000977 	bl	6790 <_free_r>
    41b8:	17ffff4d 	b	3eec <_vfiprintf_r+0xdc>
    41bc:	f9403fe2 	ldr	x2, [sp, #120]
    41c0:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    41c4:	10000062 	adr	x2, 41d0 <_vfiprintf_r+0x3c0>
    41c8:	8b21a841 	add	x1, x2, w1, sxth #2
    41cc:	d61f0020 	br	x1
    41d0:	5100c001 	sub	w1, w0, #0x30
    41d4:	b90063ff 	str	wzr, [sp, #96]
    41d8:	b94063e0 	ldr	w0, [sp, #96]
    41dc:	0b000802 	add	w2, w0, w0, lsl #2
    41e0:	38401680 	ldrb	w0, [x20], #1
    41e4:	0b020421 	add	w1, w1, w2, lsl #1
    41e8:	b90063e1 	str	w1, [sp, #96]
    41ec:	5100c001 	sub	w1, w0, #0x30
    41f0:	7100243f 	cmp	w1, #0x9
    41f4:	54ffff29 	b.ls	41d8 <_vfiprintf_r+0x3c8>  // b.plast
    41f8:	17ffff8d 	b	402c <_vfiprintf_r+0x21c>
    41fc:	39400280 	ldrb	w0, [x20]
    4200:	321c039c 	orr	w28, w28, #0x10
    4204:	17ffff89 	b	4028 <_vfiprintf_r+0x218>
    4208:	2a0003f6 	mov	w22, w0
    420c:	cb1402e0 	sub	x0, x23, x20
    4210:	2a0003f8 	mov	w24, w0
    4214:	34ffefc0 	cbz	w0, 400c <_vfiprintf_r+0x1fc>
    4218:	17ffff68 	b	3fb8 <_vfiprintf_r+0x1a8>
    421c:	9100437b 	add	x27, x27, #0x10
    4220:	17ffff77 	b	3ffc <_vfiprintf_r+0x1ec>
    4224:	aa1903f3 	mov	x19, x25
    4228:	aa1403f9 	mov	x25, x20
    422c:	f9403be0 	ldr	x0, [sp, #112]
    4230:	b4000080 	cbz	x0, 4240 <_vfiprintf_r+0x430>
    4234:	f9403be1 	ldr	x1, [sp, #112]
    4238:	aa1303e0 	mov	x0, x19
    423c:	94000955 	bl	6790 <_free_r>
    4240:	79c02320 	ldrsh	w0, [x25, #16]
    4244:	a94363f7 	ldp	x23, x24, [sp, #48]
    4248:	a94573fb 	ldp	x27, x28, [sp, #80]
    424c:	373099c0 	tbnz	w0, #6, 5584 <_vfiprintf_r+0x1774>
    4250:	b94067e0 	ldr	w0, [sp, #100]
    4254:	a9407bfd 	ldp	x29, x30, [sp]
    4258:	a94153f3 	ldp	x19, x20, [sp, #16]
    425c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4260:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4264:	910843ff 	add	sp, sp, #0x210
    4268:	d65f03c0 	ret
    426c:	aa1303e0 	mov	x0, x19
    4270:	94000870 	bl	6430 <__sinit>
    4274:	17fffefe 	b	3e6c <_vfiprintf_r+0x5c>
    4278:	b940b3e1 	ldr	w1, [sp, #176]
    427c:	2a1603e4 	mov	w4, w22
    4280:	37f856c1 	tbnz	w1, #31, 4d58 <_vfiprintf_r+0xf48>
    4284:	f94037e1 	ldr	x1, [sp, #104]
    4288:	91003c38 	add	x24, x1, #0xf
    428c:	927df318 	and	x24, x24, #0xfffffffffffffff8
    4290:	f94037e1 	ldr	x1, [sp, #104]
    4294:	3903bfff 	strb	wzr, [sp, #239]
    4298:	f940003a 	ldr	x26, [x1]
    429c:	b400753a 	cbz	x26, 5140 <_vfiprintf_r+0x1330>
    42a0:	71014c1f 	cmp	w0, #0x53
    42a4:	54006740 	b.eq	4f8c <_vfiprintf_r+0x117c>  // b.none
    42a8:	3720673c 	tbnz	w28, #4, 4f8c <_vfiprintf_r+0x117c>
    42ac:	3100049f 	cmn	w4, #0x1
    42b0:	54009520 	b.eq	5554 <_vfiprintf_r+0x1744>  // b.none
    42b4:	93407c82 	sxtw	x2, w4
    42b8:	aa1a03e0 	mov	x0, x26
    42bc:	52800001 	mov	w1, #0x0                   	// #0
    42c0:	b9006be4 	str	w4, [sp, #104]
    42c4:	94001118 	bl	8724 <memchr>
    42c8:	f9003be0 	str	x0, [sp, #112]
    42cc:	b9406be4 	ldr	w4, [sp, #104]
    42d0:	b40090a0 	cbz	x0, 54e4 <_vfiprintf_r+0x16d4>
    42d4:	cb1a0003 	sub	x3, x0, x26
    42d8:	52800004 	mov	w4, #0x0                   	// #0
    42dc:	7100007f 	cmp	w3, #0x0
    42e0:	2a0303f7 	mov	w23, w3
    42e4:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    42e8:	a906fff8 	stp	x24, xzr, [sp, #104]
    42ec:	14000060 	b	446c <_vfiprintf_r+0x65c>
    42f0:	71010c1f 	cmp	w0, #0x43
    42f4:	54000040 	b.eq	42fc <_vfiprintf_r+0x4ec>  // b.none
    42f8:	3620569c 	tbz	w28, #4, 4dc8 <_vfiprintf_r+0xfb8>
    42fc:	910423e0 	add	x0, sp, #0x108
    4300:	d2800102 	mov	x2, #0x8                   	// #8
    4304:	52800001 	mov	w1, #0x0                   	// #0
    4308:	97fffdee 	bl	3ac0 <memset>
    430c:	b940b3e0 	ldr	w0, [sp, #176]
    4310:	37f87a20 	tbnz	w0, #31, 5254 <_vfiprintf_r+0x1444>
    4314:	f94037e0 	ldr	x0, [sp, #104]
    4318:	91002c01 	add	x1, x0, #0xb
    431c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4320:	f90037e1 	str	x1, [sp, #104]
    4324:	b9400002 	ldr	w2, [x0]
    4328:	9104a3fa 	add	x26, sp, #0x128
    432c:	910423e3 	add	x3, sp, #0x108
    4330:	aa1a03e1 	mov	x1, x26
    4334:	aa1303e0 	mov	x0, x19
    4338:	940005d2 	bl	5a80 <_wcrtomb_r>
    433c:	2a0003f7 	mov	w23, w0
    4340:	3100041f 	cmn	w0, #0x1
    4344:	54009260 	b.eq	5590 <_vfiprintf_r+0x1780>  // b.none
    4348:	7100001f 	cmp	w0, #0x0
    434c:	3903bfff 	strb	wzr, [sp, #239]
    4350:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    4354:	17ffff3f 	b	4050 <_vfiprintf_r+0x240>
    4358:	b94063e1 	ldr	w1, [sp, #96]
    435c:	f90037e0 	str	x0, [sp, #104]
    4360:	4b0103e1 	neg	w1, w1
    4364:	b90063e1 	str	w1, [sp, #96]
    4368:	39400280 	ldrb	w0, [x20]
    436c:	321e039c 	orr	w28, w28, #0x4
    4370:	17ffff2e 	b	4028 <_vfiprintf_r+0x218>
    4374:	aa1403e2 	mov	x2, x20
    4378:	38401440 	ldrb	w0, [x2], #1
    437c:	7100a81f 	cmp	w0, #0x2a
    4380:	5400a6a0 	b.eq	5854 <_vfiprintf_r+0x1a44>  // b.none
    4384:	5100c001 	sub	w1, w0, #0x30
    4388:	aa0203f4 	mov	x20, x2
    438c:	52800016 	mov	w22, #0x0                   	// #0
    4390:	7100243f 	cmp	w1, #0x9
    4394:	54ffe4c8 	b.hi	402c <_vfiprintf_r+0x21c>  // b.pmore
    4398:	38401680 	ldrb	w0, [x20], #1
    439c:	0b160ac4 	add	w4, w22, w22, lsl #2
    43a0:	0b040436 	add	w22, w1, w4, lsl #1
    43a4:	5100c001 	sub	w1, w0, #0x30
    43a8:	7100243f 	cmp	w1, #0x9
    43ac:	54ffff69 	b.ls	4398 <_vfiprintf_r+0x588>  // b.plast
    43b0:	17ffff1f 	b	402c <_vfiprintf_r+0x21c>
    43b4:	52800560 	mov	w0, #0x2b                  	// #43
    43b8:	3903bfe0 	strb	w0, [sp, #239]
    43bc:	39400280 	ldrb	w0, [x20]
    43c0:	17ffff1a 	b	4028 <_vfiprintf_r+0x218>
    43c4:	b940b3e0 	ldr	w0, [sp, #176]
    43c8:	37f84da0 	tbnz	w0, #31, 4d7c <_vfiprintf_r+0xf6c>
    43cc:	f94037e0 	ldr	x0, [sp, #104]
    43d0:	91002c00 	add	x0, x0, #0xb
    43d4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    43d8:	f94037e1 	ldr	x1, [sp, #104]
    43dc:	b9400021 	ldr	w1, [x1]
    43e0:	b90063e1 	str	w1, [sp, #96]
    43e4:	37fffba1 	tbnz	w1, #31, 4358 <_vfiprintf_r+0x548>
    43e8:	f90037e0 	str	x0, [sp, #104]
    43ec:	39400280 	ldrb	w0, [x20]
    43f0:	17ffff0e 	b	4028 <_vfiprintf_r+0x218>
    43f4:	2a1603e4 	mov	w4, w22
    43f8:	321c0396 	orr	w22, w28, #0x10
    43fc:	b940b3e0 	ldr	w0, [sp, #176]
    4400:	37280056 	tbnz	w22, #5, 4408 <_vfiprintf_r+0x5f8>
    4404:	36204876 	tbz	w22, #4, 4d10 <_vfiprintf_r+0xf00>
    4408:	37f85a40 	tbnz	w0, #31, 4f50 <_vfiprintf_r+0x1140>
    440c:	f94037e1 	ldr	x1, [sp, #104]
    4410:	91003c20 	add	x0, x1, #0xf
    4414:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4418:	f90037e0 	str	x0, [sp, #104]
    441c:	f9400021 	ldr	x1, [x1]
    4420:	52800020 	mov	w0, #0x1                   	// #1
    4424:	3903bfff 	strb	wzr, [sp, #239]
    4428:	3100049f 	cmn	w4, #0x1
    442c:	54001320 	b.eq	4690 <_vfiprintf_r+0x880>  // b.none
    4430:	f100003f 	cmp	x1, #0x0
    4434:	12187adc 	and	w28, w22, #0xffffff7f
    4438:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    443c:	54001261 	b.ne	4688 <_vfiprintf_r+0x878>  // b.any
    4440:	35000660 	cbnz	w0, 450c <_vfiprintf_r+0x6fc>
    4444:	120002d7 	and	w23, w22, #0x1
    4448:	36003f56 	tbz	w22, #0, 4c30 <_vfiprintf_r+0xe20>
    444c:	91062ffa 	add	x26, sp, #0x18b
    4450:	52800600 	mov	w0, #0x30                  	// #48
    4454:	52800004 	mov	w4, #0x0                   	// #0
    4458:	39062fe0 	strb	w0, [sp, #395]
    445c:	d503201f 	nop
    4460:	6b17009f 	cmp	w4, w23
    4464:	f9003bff 	str	xzr, [sp, #112]
    4468:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    446c:	3943bfe0 	ldrb	w0, [sp, #239]
    4470:	7100001f 	cmp	w0, #0x0
    4474:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    4478:	17fffef8 	b	4058 <_vfiprintf_r+0x248>
    447c:	39400280 	ldrb	w0, [x20]
    4480:	3219039c 	orr	w28, w28, #0x80
    4484:	17fffee9 	b	4028 <_vfiprintf_r+0x218>
    4488:	2a1603e4 	mov	w4, w22
    448c:	321c039c 	orr	w28, w28, #0x10
    4490:	b940b3e0 	ldr	w0, [sp, #176]
    4494:	3728005c 	tbnz	w28, #5, 449c <_vfiprintf_r+0x68c>
    4498:	362042dc 	tbz	w28, #4, 4cf0 <_vfiprintf_r+0xee0>
    449c:	37f85460 	tbnz	w0, #31, 4f28 <_vfiprintf_r+0x1118>
    44a0:	f94037e0 	ldr	x0, [sp, #104]
    44a4:	91003c01 	add	x1, x0, #0xf
    44a8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    44ac:	f90037e1 	str	x1, [sp, #104]
    44b0:	f9400001 	ldr	x1, [x0]
    44b4:	12157b96 	and	w22, w28, #0xfffffbff
    44b8:	52800000 	mov	w0, #0x0                   	// #0
    44bc:	17ffffda 	b	4424 <_vfiprintf_r+0x614>
    44c0:	2a1603e4 	mov	w4, w22
    44c4:	321c039c 	orr	w28, w28, #0x10
    44c8:	b940b3e0 	ldr	w0, [sp, #176]
    44cc:	3728005c 	tbnz	w28, #5, 44d4 <_vfiprintf_r+0x6c4>
    44d0:	36203ffc 	tbz	w28, #4, 4ccc <_vfiprintf_r+0xebc>
    44d4:	37f85160 	tbnz	w0, #31, 4f00 <_vfiprintf_r+0x10f0>
    44d8:	f94037e0 	ldr	x0, [sp, #104]
    44dc:	91003c01 	add	x1, x0, #0xf
    44e0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    44e4:	f90037e1 	str	x1, [sp, #104]
    44e8:	f9400000 	ldr	x0, [x0]
    44ec:	aa0003e1 	mov	x1, x0
    44f0:	b7f83b80 	tbnz	x0, #63, 4c60 <_vfiprintf_r+0xe50>
    44f4:	3100049f 	cmn	w4, #0x1
    44f8:	540036e0 	b.eq	4bd4 <_vfiprintf_r+0xdc4>  // b.none
    44fc:	7100009f 	cmp	w4, #0x0
    4500:	12187b9c 	and	w28, w28, #0xffffff7f
    4504:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    4508:	54003661 	b.ne	4bd4 <_vfiprintf_r+0xdc4>  // b.any
    450c:	910633fa 	add	x26, sp, #0x18c
    4510:	52800004 	mov	w4, #0x0                   	// #0
    4514:	52800017 	mov	w23, #0x0                   	// #0
    4518:	17ffffd2 	b	4460 <_vfiprintf_r+0x650>
    451c:	aa1303e0 	mov	x0, x19
    4520:	94000adc 	bl	7090 <_localeconv_r>
    4524:	f9400400 	ldr	x0, [x0, #8]
    4528:	f90053e0 	str	x0, [sp, #160]
    452c:	94001555 	bl	9a80 <strlen>
    4530:	aa0003e1 	mov	x1, x0
    4534:	aa0103f7 	mov	x23, x1
    4538:	aa1303e0 	mov	x0, x19
    453c:	f90057e1 	str	x1, [sp, #168]
    4540:	94000ad4 	bl	7090 <_localeconv_r>
    4544:	f9400800 	ldr	x0, [x0, #16]
    4548:	f9004fe0 	str	x0, [sp, #152]
    454c:	f10002ff 	cmp	x23, #0x0
    4550:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    4554:	54003b80 	b.eq	4cc4 <_vfiprintf_r+0xeb4>  // b.none
    4558:	39400000 	ldrb	w0, [x0]
    455c:	32160381 	orr	w1, w28, #0x400
    4560:	7100001f 	cmp	w0, #0x0
    4564:	39400280 	ldrb	w0, [x20]
    4568:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    456c:	17fffeaf 	b	4028 <_vfiprintf_r+0x218>
    4570:	39400280 	ldrb	w0, [x20]
    4574:	3200039c 	orr	w28, w28, #0x1
    4578:	17fffeac 	b	4028 <_vfiprintf_r+0x218>
    457c:	3943bfe1 	ldrb	w1, [sp, #239]
    4580:	39400280 	ldrb	w0, [x20]
    4584:	35ffd521 	cbnz	w1, 4028 <_vfiprintf_r+0x218>
    4588:	52800401 	mov	w1, #0x20                  	// #32
    458c:	3903bfe1 	strb	w1, [sp, #239]
    4590:	17fffea6 	b	4028 <_vfiprintf_r+0x218>
    4594:	b940b3e0 	ldr	w0, [sp, #176]
    4598:	372801bc 	tbnz	w28, #5, 45cc <_vfiprintf_r+0x7bc>
    459c:	3720019c 	tbnz	w28, #4, 45cc <_vfiprintf_r+0x7bc>
    45a0:	37306cfc 	tbnz	w28, #6, 533c <_vfiprintf_r+0x152c>
    45a4:	364889bc 	tbz	w28, #9, 56d8 <_vfiprintf_r+0x18c8>
    45a8:	37f89040 	tbnz	w0, #31, 57b0 <_vfiprintf_r+0x19a0>
    45ac:	f94037e0 	ldr	x0, [sp, #104]
    45b0:	91003c01 	add	x1, x0, #0xf
    45b4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    45b8:	f90037e1 	str	x1, [sp, #104]
    45bc:	f9400000 	ldr	x0, [x0]
    45c0:	394193e1 	ldrb	w1, [sp, #100]
    45c4:	39000001 	strb	w1, [x0]
    45c8:	17fffe49 	b	3eec <_vfiprintf_r+0xdc>
    45cc:	37f84180 	tbnz	w0, #31, 4dfc <_vfiprintf_r+0xfec>
    45d0:	f94037e0 	ldr	x0, [sp, #104]
    45d4:	91003c01 	add	x1, x0, #0xf
    45d8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    45dc:	f90037e1 	str	x1, [sp, #104]
    45e0:	f9400000 	ldr	x0, [x0]
    45e4:	b98067e1 	ldrsw	x1, [sp, #100]
    45e8:	f9000001 	str	x1, [x0]
    45ec:	17fffe40 	b	3eec <_vfiprintf_r+0xdc>
    45f0:	39400280 	ldrb	w0, [x20]
    45f4:	7101b01f 	cmp	w0, #0x6c
    45f8:	54005960 	b.eq	5124 <_vfiprintf_r+0x1314>  // b.none
    45fc:	321c039c 	orr	w28, w28, #0x10
    4600:	17fffe8a 	b	4028 <_vfiprintf_r+0x218>
    4604:	39400280 	ldrb	w0, [x20]
    4608:	7101a01f 	cmp	w0, #0x68
    460c:	54005840 	b.eq	5114 <_vfiprintf_r+0x1304>  // b.none
    4610:	321a039c 	orr	w28, w28, #0x40
    4614:	17fffe85 	b	4028 <_vfiprintf_r+0x218>
    4618:	39400280 	ldrb	w0, [x20]
    461c:	321b039c 	orr	w28, w28, #0x20
    4620:	17fffe82 	b	4028 <_vfiprintf_r+0x218>
    4624:	b940b3e0 	ldr	w0, [sp, #176]
    4628:	2a1603e4 	mov	w4, w22
    462c:	37f83ba0 	tbnz	w0, #31, 4da0 <_vfiprintf_r+0xf90>
    4630:	f94037e2 	ldr	x2, [sp, #104]
    4634:	91003c40 	add	x0, x2, #0xf
    4638:	927df000 	and	x0, x0, #0xfffffffffffffff8
    463c:	f90037e0 	str	x0, [sp, #104]
    4640:	528f0600 	mov	w0, #0x7830                	// #30768
    4644:	f0000021 	adrp	x1, b000 <pow10.0+0x80>
    4648:	9109c021 	add	x1, x1, #0x270
    464c:	321f0396 	orr	w22, w28, #0x2
    4650:	f90047e1 	str	x1, [sp, #136]
    4654:	7901e3e0 	strh	w0, [sp, #240]
    4658:	52800040 	mov	w0, #0x2                   	// #2
    465c:	f9400041 	ldr	x1, [x2]
    4660:	17ffff71 	b	4424 <_vfiprintf_r+0x614>
    4664:	910643fb 	add	x27, sp, #0x190
    4668:	93407ee0 	sxtw	x0, w23
    466c:	52800021 	mov	w1, #0x1                   	// #1
    4670:	b9011be1 	str	w1, [sp, #280]
    4674:	f90093e0 	str	x0, [sp, #288]
    4678:	a91903fa 	stp	x26, x0, [sp, #400]
    467c:	d503201f 	nop
    4680:	91004365 	add	x5, x27, #0x10
    4684:	17fffebb 	b	4170 <_vfiprintf_r+0x360>
    4688:	2a1c03f6 	mov	w22, w28
    468c:	d503201f 	nop
    4690:	7100041f 	cmp	w0, #0x1
    4694:	54002a20 	b.eq	4bd8 <_vfiprintf_r+0xdc8>  // b.none
    4698:	910633f7 	add	x23, sp, #0x18c
    469c:	aa1703fa 	mov	x26, x23
    46a0:	7100081f 	cmp	w0, #0x2
    46a4:	54000161 	b.ne	46d0 <_vfiprintf_r+0x8c0>  // b.any
    46a8:	f94047e2 	ldr	x2, [sp, #136]
    46ac:	d503201f 	nop
    46b0:	92400c20 	and	x0, x1, #0xf
    46b4:	d344fc21 	lsr	x1, x1, #4
    46b8:	38606840 	ldrb	w0, [x2, x0]
    46bc:	381fff40 	strb	w0, [x26, #-1]!
    46c0:	b5ffff81 	cbnz	x1, 46b0 <_vfiprintf_r+0x8a0>
    46c4:	4b1a02f7 	sub	w23, w23, w26
    46c8:	2a1603fc 	mov	w28, w22
    46cc:	17ffff65 	b	4460 <_vfiprintf_r+0x650>
    46d0:	12000820 	and	w0, w1, #0x7
    46d4:	aa1a03e2 	mov	x2, x26
    46d8:	1100c000 	add	w0, w0, #0x30
    46dc:	381fff40 	strb	w0, [x26, #-1]!
    46e0:	d343fc21 	lsr	x1, x1, #3
    46e4:	b5ffff61 	cbnz	x1, 46d0 <_vfiprintf_r+0x8c0>
    46e8:	7100c01f 	cmp	w0, #0x30
    46ec:	1a9f07e0 	cset	w0, ne  // ne = any
    46f0:	6a0002df 	tst	w22, w0
    46f4:	54fffe80 	b.eq	46c4 <_vfiprintf_r+0x8b4>  // b.none
    46f8:	d1000842 	sub	x2, x2, #0x2
    46fc:	52800600 	mov	w0, #0x30                  	// #48
    4700:	2a1603fc 	mov	w28, w22
    4704:	4b0202f7 	sub	w23, w23, w2
    4708:	381ff340 	sturb	w0, [x26, #-1]
    470c:	aa0203fa 	mov	x26, x2
    4710:	17ffff54 	b	4460 <_vfiprintf_r+0x650>
    4714:	b94063e2 	ldr	w2, [sp, #96]
    4718:	4b160058 	sub	w24, w2, w22
    471c:	7100031f 	cmp	w24, #0x0
    4720:	54ffd04d 	b.le	4128 <_vfiprintf_r+0x318>
    4724:	7100431f 	cmp	w24, #0x10
    4728:	540073cd 	b.le	55a0 <_vfiprintf_r+0x1790>
    472c:	2a0103e3 	mov	w3, w1
    4730:	f0000029 	adrp	x9, b000 <pow10.0+0x80>
    4734:	aa1403e1 	mov	x1, x20
    4738:	910dc129 	add	x9, x9, #0x370
    473c:	aa1303f4 	mov	x20, x19
    4740:	d2800208 	mov	x8, #0x10                  	// #16
    4744:	2a1803f3 	mov	w19, w24
    4748:	aa0103f8 	mov	x24, x1
    474c:	b90093e4 	str	w4, [sp, #144]
    4750:	b900b7f6 	str	w22, [sp, #180]
    4754:	aa1903f6 	mov	x22, x25
    4758:	aa0903f9 	mov	x25, x9
    475c:	14000007 	b	4778 <_vfiprintf_r+0x968>
    4760:	1100086a 	add	w10, w3, #0x2
    4764:	9100437b 	add	x27, x27, #0x10
    4768:	2a0203e3 	mov	w3, w2
    476c:	51004273 	sub	w19, w19, #0x10
    4770:	7100427f 	cmp	w19, #0x10
    4774:	540002cd 	b.le	47cc <_vfiprintf_r+0x9bc>
    4778:	91004000 	add	x0, x0, #0x10
    477c:	11000462 	add	w2, w3, #0x1
    4780:	a9002379 	stp	x25, x8, [x27]
    4784:	b9011be2 	str	w2, [sp, #280]
    4788:	f90093e0 	str	x0, [sp, #288]
    478c:	71001c5f 	cmp	w2, #0x7
    4790:	54fffe8d 	b.le	4760 <_vfiprintf_r+0x950>
    4794:	b4000d60 	cbz	x0, 4940 <_vfiprintf_r+0xb30>
    4798:	910443e2 	add	x2, sp, #0x110
    479c:	aa1603e1 	mov	x1, x22
    47a0:	aa1403e0 	mov	x0, x20
    47a4:	97fffd5b 	bl	3d10 <__sprint_r.part.0>
    47a8:	35004c60 	cbnz	w0, 5134 <_vfiprintf_r+0x1324>
    47ac:	b9411be3 	ldr	w3, [sp, #280]
    47b0:	51004273 	sub	w19, w19, #0x10
    47b4:	910643fb 	add	x27, sp, #0x190
    47b8:	d2800208 	mov	x8, #0x10                  	// #16
    47bc:	1100046a 	add	w10, w3, #0x1
    47c0:	f94093e0 	ldr	x0, [sp, #288]
    47c4:	7100427f 	cmp	w19, #0x10
    47c8:	54fffd8c 	b.gt	4778 <_vfiprintf_r+0x968>
    47cc:	aa1803e1 	mov	x1, x24
    47d0:	aa1903e9 	mov	x9, x25
    47d4:	b94093e4 	ldr	w4, [sp, #144]
    47d8:	aa1603f9 	mov	x25, x22
    47dc:	b940b7f6 	ldr	w22, [sp, #180]
    47e0:	2a1303f8 	mov	w24, w19
    47e4:	aa1403f3 	mov	x19, x20
    47e8:	aa0103f4 	mov	x20, x1
    47ec:	93407f01 	sxtw	x1, w24
    47f0:	a9000769 	stp	x9, x1, [x27]
    47f4:	8b010000 	add	x0, x0, x1
    47f8:	b9011bea 	str	w10, [sp, #280]
    47fc:	f90093e0 	str	x0, [sp, #288]
    4800:	71001d5f 	cmp	w10, #0x7
    4804:	5400258d 	b.le	4cb4 <_vfiprintf_r+0xea4>
    4808:	b4005920 	cbz	x0, 532c <_vfiprintf_r+0x151c>
    480c:	910443e2 	add	x2, sp, #0x110
    4810:	aa1903e1 	mov	x1, x25
    4814:	aa1303e0 	mov	x0, x19
    4818:	b90093e4 	str	w4, [sp, #144]
    481c:	97fffd3d 	bl	3d10 <__sprint_r.part.0>
    4820:	35ffd060 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4824:	b94093e4 	ldr	w4, [sp, #144]
    4828:	910643fb 	add	x27, sp, #0x190
    482c:	b9411be1 	ldr	w1, [sp, #280]
    4830:	4b170098 	sub	w24, w4, w23
    4834:	11000428 	add	w8, w1, #0x1
    4838:	f94093e0 	ldr	x0, [sp, #288]
    483c:	7100031f 	cmp	w24, #0x0
    4840:	54ffc7ad 	b.le	4134 <_vfiprintf_r+0x324>
    4844:	d503201f 	nop
    4848:	f0000029 	adrp	x9, b000 <pow10.0+0x80>
    484c:	910dc129 	add	x9, x9, #0x370
    4850:	7100431f 	cmp	w24, #0x10
    4854:	540004ed 	b.le	48f0 <_vfiprintf_r+0xae0>
    4858:	2a0103e3 	mov	w3, w1
    485c:	d2800204 	mov	x4, #0x10                  	// #16
    4860:	f9004bf4 	str	x20, [sp, #144]
    4864:	aa1903f4 	mov	x20, x25
    4868:	aa1303f9 	mov	x25, x19
    486c:	aa0903f3 	mov	x19, x9
    4870:	14000007 	b	488c <_vfiprintf_r+0xa7c>
    4874:	11000868 	add	w8, w3, #0x2
    4878:	9100437b 	add	x27, x27, #0x10
    487c:	2a0203e3 	mov	w3, w2
    4880:	51004318 	sub	w24, w24, #0x10
    4884:	7100431f 	cmp	w24, #0x10
    4888:	540002cd 	b.le	48e0 <_vfiprintf_r+0xad0>
    488c:	91004000 	add	x0, x0, #0x10
    4890:	11000462 	add	w2, w3, #0x1
    4894:	a9001373 	stp	x19, x4, [x27]
    4898:	b9011be2 	str	w2, [sp, #280]
    489c:	f90093e0 	str	x0, [sp, #288]
    48a0:	71001c5f 	cmp	w2, #0x7
    48a4:	54fffe8d 	b.le	4874 <_vfiprintf_r+0xa64>
    48a8:	b4000380 	cbz	x0, 4918 <_vfiprintf_r+0xb08>
    48ac:	910443e2 	add	x2, sp, #0x110
    48b0:	aa1403e1 	mov	x1, x20
    48b4:	aa1903e0 	mov	x0, x25
    48b8:	97fffd16 	bl	3d10 <__sprint_r.part.0>
    48bc:	35ffcb40 	cbnz	w0, 4224 <_vfiprintf_r+0x414>
    48c0:	b9411be3 	ldr	w3, [sp, #280]
    48c4:	51004318 	sub	w24, w24, #0x10
    48c8:	910643fb 	add	x27, sp, #0x190
    48cc:	d2800204 	mov	x4, #0x10                  	// #16
    48d0:	11000468 	add	w8, w3, #0x1
    48d4:	f94093e0 	ldr	x0, [sp, #288]
    48d8:	7100431f 	cmp	w24, #0x10
    48dc:	54fffd8c 	b.gt	488c <_vfiprintf_r+0xa7c>
    48e0:	aa1303e9 	mov	x9, x19
    48e4:	aa1903f3 	mov	x19, x25
    48e8:	aa1403f9 	mov	x25, x20
    48ec:	f9404bf4 	ldr	x20, [sp, #144]
    48f0:	93407f18 	sxtw	x24, w24
    48f4:	8b180000 	add	x0, x0, x24
    48f8:	a9006369 	stp	x9, x24, [x27]
    48fc:	b9011be8 	str	w8, [sp, #280]
    4900:	f90093e0 	str	x0, [sp, #288]
    4904:	71001d1f 	cmp	w8, #0x7
    4908:	5400178c 	b.gt	4bf8 <_vfiprintf_r+0xde8>
    490c:	9100437b 	add	x27, x27, #0x10
    4910:	11000508 	add	w8, w8, #0x1
    4914:	17fffe08 	b	4134 <_vfiprintf_r+0x324>
    4918:	910643fb 	add	x27, sp, #0x190
    491c:	52800028 	mov	w8, #0x1                   	// #1
    4920:	52800003 	mov	w3, #0x0                   	// #0
    4924:	17ffffd7 	b	4880 <_vfiprintf_r+0xa70>
    4928:	910443e2 	add	x2, sp, #0x110
    492c:	aa1903e1 	mov	x1, x25
    4930:	aa1303e0 	mov	x0, x19
    4934:	97fffcf7 	bl	3d10 <__sprint_r.part.0>
    4938:	34ffc340 	cbz	w0, 41a0 <_vfiprintf_r+0x390>
    493c:	17fffe3c 	b	422c <_vfiprintf_r+0x41c>
    4940:	910643fb 	add	x27, sp, #0x190
    4944:	5280002a 	mov	w10, #0x1                   	// #1
    4948:	52800003 	mov	w3, #0x0                   	// #0
    494c:	17ffff88 	b	476c <_vfiprintf_r+0x95c>
    4950:	b4001760 	cbz	x0, 4c3c <_vfiprintf_r+0xe2c>
    4954:	910443e2 	add	x2, sp, #0x110
    4958:	aa1903e1 	mov	x1, x25
    495c:	aa1303e0 	mov	x0, x19
    4960:	b90093ea 	str	w10, [sp, #144]
    4964:	b900b7e4 	str	w4, [sp, #180]
    4968:	97fffcea 	bl	3d10 <__sprint_r.part.0>
    496c:	35ffc600 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4970:	b9411be1 	ldr	w1, [sp, #280]
    4974:	910643fb 	add	x27, sp, #0x190
    4978:	b94093ea 	ldr	w10, [sp, #144]
    497c:	b940b7e4 	ldr	w4, [sp, #180]
    4980:	11000428 	add	w8, w1, #0x1
    4984:	f94093e0 	ldr	x0, [sp, #288]
    4988:	17fffdd0 	b	40c8 <_vfiprintf_r+0x2b8>
    498c:	9103c3e0 	add	x0, sp, #0xf0
    4990:	d2800041 	mov	x1, #0x2                   	// #2
    4994:	910643fb 	add	x27, sp, #0x190
    4998:	a91907e0 	stp	x0, x1, [sp, #400]
    499c:	aa0103e0 	mov	x0, x1
    49a0:	52800028 	mov	w8, #0x1                   	// #1
    49a4:	d503201f 	nop
    49a8:	2a0803e1 	mov	w1, w8
    49ac:	9100437b 	add	x27, x27, #0x10
    49b0:	11000428 	add	w8, w1, #0x1
    49b4:	17fffddb 	b	4120 <_vfiprintf_r+0x310>
    49b8:	7100413f 	cmp	w9, #0x10
    49bc:	54005c4d 	b.le	5544 <_vfiprintf_r+0x1734>
    49c0:	f0000028 	adrp	x8, b000 <pow10.0+0x80>
    49c4:	910d8108 	add	x8, x8, #0x360
    49c8:	aa1b03e3 	mov	x3, x27
    49cc:	d280020c 	mov	x12, #0x10                  	// #16
    49d0:	2a1703fb 	mov	w27, w23
    49d4:	2a1603f7 	mov	w23, w22
    49d8:	aa0803f6 	mov	x22, x8
    49dc:	b90093ea 	str	w10, [sp, #144]
    49e0:	b900b7e4 	str	w4, [sp, #180]
    49e4:	2a0103e4 	mov	w4, w1
    49e8:	f9005ff4 	str	x20, [sp, #184]
    49ec:	aa1903f4 	mov	x20, x25
    49f0:	2a0903f9 	mov	w25, w9
    49f4:	14000008 	b	4a14 <_vfiprintf_r+0xc04>
    49f8:	1100088b 	add	w11, w4, #0x2
    49fc:	91004063 	add	x3, x3, #0x10
    4a00:	2a0203e4 	mov	w4, w2
    4a04:	51004339 	sub	w25, w25, #0x10
    4a08:	7100433f 	cmp	w25, #0x10
    4a0c:	540002cd 	b.le	4a64 <_vfiprintf_r+0xc54>
    4a10:	11000482 	add	w2, w4, #0x1
    4a14:	91004000 	add	x0, x0, #0x10
    4a18:	a9003076 	stp	x22, x12, [x3]
    4a1c:	b9011be2 	str	w2, [sp, #280]
    4a20:	f90093e0 	str	x0, [sp, #288]
    4a24:	71001c5f 	cmp	w2, #0x7
    4a28:	54fffe8d 	b.le	49f8 <_vfiprintf_r+0xbe8>
    4a2c:	b4000440 	cbz	x0, 4ab4 <_vfiprintf_r+0xca4>
    4a30:	910443e2 	add	x2, sp, #0x110
    4a34:	aa1403e1 	mov	x1, x20
    4a38:	aa1303e0 	mov	x0, x19
    4a3c:	97fffcb5 	bl	3d10 <__sprint_r.part.0>
    4a40:	35ffbf40 	cbnz	w0, 4228 <_vfiprintf_r+0x418>
    4a44:	b9411be4 	ldr	w4, [sp, #280]
    4a48:	51004339 	sub	w25, w25, #0x10
    4a4c:	910643e3 	add	x3, sp, #0x190
    4a50:	d280020c 	mov	x12, #0x10                  	// #16
    4a54:	1100048b 	add	w11, w4, #0x1
    4a58:	f94093e0 	ldr	x0, [sp, #288]
    4a5c:	7100433f 	cmp	w25, #0x10
    4a60:	54fffd8c 	b.gt	4a10 <_vfiprintf_r+0xc00>
    4a64:	2a1903e9 	mov	w9, w25
    4a68:	b94093ea 	ldr	w10, [sp, #144]
    4a6c:	aa1403f9 	mov	x25, x20
    4a70:	b940b7e4 	ldr	w4, [sp, #180]
    4a74:	f9405ff4 	ldr	x20, [sp, #184]
    4a78:	aa1603e8 	mov	x8, x22
    4a7c:	2a1703f6 	mov	w22, w23
    4a80:	2a1b03f7 	mov	w23, w27
    4a84:	aa0303fb 	mov	x27, x3
    4a88:	93407d21 	sxtw	x1, w9
    4a8c:	a9000768 	stp	x8, x1, [x27]
    4a90:	8b010000 	add	x0, x0, x1
    4a94:	b9011beb 	str	w11, [sp, #280]
    4a98:	f90093e0 	str	x0, [sp, #288]
    4a9c:	71001d7f 	cmp	w11, #0x7
    4aa0:	54000ecc 	b.gt	4c78 <_vfiprintf_r+0xe68>
    4aa4:	9100437b 	add	x27, x27, #0x10
    4aa8:	11000568 	add	w8, w11, #0x1
    4aac:	2a0b03e1 	mov	w1, w11
    4ab0:	17fffd78 	b	4090 <_vfiprintf_r+0x280>
    4ab4:	910643e3 	add	x3, sp, #0x190
    4ab8:	52800004 	mov	w4, #0x0                   	// #0
    4abc:	5280002b 	mov	w11, #0x1                   	// #1
    4ac0:	17ffffd1 	b	4a04 <_vfiprintf_r+0xbf4>
    4ac4:	b9011bff 	str	wzr, [sp, #280]
    4ac8:	3610079c 	tbz	w28, #2, 4bb8 <_vfiprintf_r+0xda8>
    4acc:	b94063e1 	ldr	w1, [sp, #96]
    4ad0:	4b160037 	sub	w23, w1, w22
    4ad4:	710002ff 	cmp	w23, #0x0
    4ad8:	5400070d 	b.le	4bb8 <_vfiprintf_r+0xda8>
    4adc:	910643e5 	add	x5, sp, #0x190
    4ae0:	b9411be2 	ldr	w2, [sp, #280]
    4ae4:	710042ff 	cmp	w23, #0x10
    4ae8:	5400546d 	b.le	5574 <_vfiprintf_r+0x1764>
    4aec:	f0000028 	adrp	x8, b000 <pow10.0+0x80>
    4af0:	910d8108 	add	x8, x8, #0x360
    4af4:	aa0803fa 	mov	x26, x8
    4af8:	d2800218 	mov	x24, #0x10                  	// #16
    4afc:	14000007 	b	4b18 <_vfiprintf_r+0xd08>
    4b00:	11000844 	add	w4, w2, #0x2
    4b04:	910040a5 	add	x5, x5, #0x10
    4b08:	2a0303e2 	mov	w2, w3
    4b0c:	510042f7 	sub	w23, w23, #0x10
    4b10:	710042ff 	cmp	w23, #0x10
    4b14:	540002ad 	b.le	4b68 <_vfiprintf_r+0xd58>
    4b18:	91004000 	add	x0, x0, #0x10
    4b1c:	11000443 	add	w3, w2, #0x1
    4b20:	a90060ba 	stp	x26, x24, [x5]
    4b24:	b9011be3 	str	w3, [sp, #280]
    4b28:	f90093e0 	str	x0, [sp, #288]
    4b2c:	71001c7f 	cmp	w3, #0x7
    4b30:	54fffe8d 	b.le	4b00 <_vfiprintf_r+0xcf0>
    4b34:	b40003a0 	cbz	x0, 4ba8 <_vfiprintf_r+0xd98>
    4b38:	910443e2 	add	x2, sp, #0x110
    4b3c:	aa1903e1 	mov	x1, x25
    4b40:	aa1303e0 	mov	x0, x19
    4b44:	97fffc73 	bl	3d10 <__sprint_r.part.0>
    4b48:	35ffb720 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4b4c:	b9411be2 	ldr	w2, [sp, #280]
    4b50:	510042f7 	sub	w23, w23, #0x10
    4b54:	910643e5 	add	x5, sp, #0x190
    4b58:	11000444 	add	w4, w2, #0x1
    4b5c:	f94093e0 	ldr	x0, [sp, #288]
    4b60:	710042ff 	cmp	w23, #0x10
    4b64:	54fffdac 	b.gt	4b18 <_vfiprintf_r+0xd08>
    4b68:	aa1a03e8 	mov	x8, x26
    4b6c:	93407ef7 	sxtw	x23, w23
    4b70:	a9005ca8 	stp	x8, x23, [x5]
    4b74:	8b170000 	add	x0, x0, x23
    4b78:	b9011be4 	str	w4, [sp, #280]
    4b7c:	f90093e0 	str	x0, [sp, #288]
    4b80:	71001c9f 	cmp	w4, #0x7
    4b84:	54ffb00d 	b.le	4184 <_vfiprintf_r+0x374>
    4b88:	b4000180 	cbz	x0, 4bb8 <_vfiprintf_r+0xda8>
    4b8c:	910443e2 	add	x2, sp, #0x110
    4b90:	aa1903e1 	mov	x1, x25
    4b94:	aa1303e0 	mov	x0, x19
    4b98:	97fffc5e 	bl	3d10 <__sprint_r.part.0>
    4b9c:	35ffb480 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4ba0:	f94093e0 	ldr	x0, [sp, #288]
    4ba4:	17fffd78 	b	4184 <_vfiprintf_r+0x374>
    4ba8:	910643e5 	add	x5, sp, #0x190
    4bac:	52800024 	mov	w4, #0x1                   	// #1
    4bb0:	52800002 	mov	w2, #0x0                   	// #0
    4bb4:	17ffffd6 	b	4b0c <_vfiprintf_r+0xcfc>
    4bb8:	b94063e0 	ldr	w0, [sp, #96]
    4bbc:	6b16001f 	cmp	w0, w22
    4bc0:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    4bc4:	b94067e0 	ldr	w0, [sp, #100]
    4bc8:	0b030000 	add	w0, w0, w3
    4bcc:	b90067e0 	str	w0, [sp, #100]
    4bd0:	17fffd74 	b	41a0 <_vfiprintf_r+0x390>
    4bd4:	2a1c03f6 	mov	w22, w28
    4bd8:	f100243f 	cmp	x1, #0x9
    4bdc:	540024c8 	b.hi	5074 <_vfiprintf_r+0x1264>  // b.pmore
    4be0:	1100c021 	add	w1, w1, #0x30
    4be4:	2a1603fc 	mov	w28, w22
    4be8:	91062ffa 	add	x26, sp, #0x18b
    4bec:	52800037 	mov	w23, #0x1                   	// #1
    4bf0:	39062fe1 	strb	w1, [sp, #395]
    4bf4:	17fffe1b 	b	4460 <_vfiprintf_r+0x650>
    4bf8:	b4ffd360 	cbz	x0, 4664 <_vfiprintf_r+0x854>
    4bfc:	910443e2 	add	x2, sp, #0x110
    4c00:	aa1903e1 	mov	x1, x25
    4c04:	aa1303e0 	mov	x0, x19
    4c08:	97fffc42 	bl	3d10 <__sprint_r.part.0>
    4c0c:	35ffb100 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4c10:	b9411be8 	ldr	w8, [sp, #280]
    4c14:	910643fb 	add	x27, sp, #0x190
    4c18:	f94093e0 	ldr	x0, [sp, #288]
    4c1c:	11000508 	add	w8, w8, #0x1
    4c20:	17fffd45 	b	4134 <_vfiprintf_r+0x324>
    4c24:	910643fb 	add	x27, sp, #0x190
    4c28:	b9011bff 	str	wzr, [sp, #280]
    4c2c:	17fffcf4 	b	3ffc <_vfiprintf_r+0x1ec>
    4c30:	910633fa 	add	x26, sp, #0x18c
    4c34:	52800004 	mov	w4, #0x0                   	// #0
    4c38:	17fffe0a 	b	4460 <_vfiprintf_r+0x650>
    4c3c:	350007ca 	cbnz	w10, 4d34 <_vfiprintf_r+0xf24>
    4c40:	910643fb 	add	x27, sp, #0x190
    4c44:	52800001 	mov	w1, #0x0                   	// #0
    4c48:	52800028 	mov	w8, #0x1                   	// #1
    4c4c:	17fffd35 	b	4120 <_vfiprintf_r+0x310>
    4c50:	910643fb 	add	x27, sp, #0x190
    4c54:	52800028 	mov	w8, #0x1                   	// #1
    4c58:	52800001 	mov	w1, #0x0                   	// #0
    4c5c:	17fffd31 	b	4120 <_vfiprintf_r+0x310>
    4c60:	528005a0 	mov	w0, #0x2d                  	// #45
    4c64:	cb0103e1 	neg	x1, x1
    4c68:	2a1c03f6 	mov	w22, w28
    4c6c:	3903bfe0 	strb	w0, [sp, #239]
    4c70:	52800020 	mov	w0, #0x1                   	// #1
    4c74:	17fffded 	b	4428 <_vfiprintf_r+0x618>
    4c78:	b4000d60 	cbz	x0, 4e24 <_vfiprintf_r+0x1014>
    4c7c:	910443e2 	add	x2, sp, #0x110
    4c80:	aa1903e1 	mov	x1, x25
    4c84:	aa1303e0 	mov	x0, x19
    4c88:	b90093ea 	str	w10, [sp, #144]
    4c8c:	b900b7e4 	str	w4, [sp, #180]
    4c90:	97fffc20 	bl	3d10 <__sprint_r.part.0>
    4c94:	35ffacc0 	cbnz	w0, 422c <_vfiprintf_r+0x41c>
    4c98:	b9411be1 	ldr	w1, [sp, #280]
    4c9c:	910643fb 	add	x27, sp, #0x190
    4ca0:	b94093ea 	ldr	w10, [sp, #144]
    4ca4:	b940b7e4 	ldr	w4, [sp, #180]
    4ca8:	11000428 	add	w8, w1, #0x1
    4cac:	f94093e0 	ldr	x0, [sp, #288]
    4cb0:	17fffcf8 	b	4090 <_vfiprintf_r+0x280>
    4cb4:	9100437b 	add	x27, x27, #0x10
    4cb8:	11000548 	add	w8, w10, #0x1
    4cbc:	2a0a03e1 	mov	w1, w10
    4cc0:	17fffd1a 	b	4128 <_vfiprintf_r+0x318>
    4cc4:	39400280 	ldrb	w0, [x20]
    4cc8:	17fffcd8 	b	4028 <_vfiprintf_r+0x218>
    4ccc:	36302a9c 	tbz	w28, #6, 521c <_vfiprintf_r+0x140c>
    4cd0:	37f83d20 	tbnz	w0, #31, 5474 <_vfiprintf_r+0x1664>
    4cd4:	f94037e0 	ldr	x0, [sp, #104]
    4cd8:	91002c01 	add	x1, x0, #0xb
    4cdc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4ce0:	f90037e1 	str	x1, [sp, #104]
    4ce4:	79800001 	ldrsh	x1, [x0]
    4ce8:	aa0103e0 	mov	x0, x1
    4cec:	17fffe01 	b	44f0 <_vfiprintf_r+0x6e0>
    4cf0:	3630247c 	tbz	w28, #6, 517c <_vfiprintf_r+0x136c>
    4cf4:	37f83960 	tbnz	w0, #31, 5420 <_vfiprintf_r+0x1610>
    4cf8:	f94037e0 	ldr	x0, [sp, #104]
    4cfc:	91002c01 	add	x1, x0, #0xb
    4d00:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d04:	f90037e1 	str	x1, [sp, #104]
    4d08:	79400001 	ldrh	w1, [x0]
    4d0c:	17fffdea 	b	44b4 <_vfiprintf_r+0x6a4>
    4d10:	36302476 	tbz	w22, #6, 519c <_vfiprintf_r+0x138c>
    4d14:	37f839c0 	tbnz	w0, #31, 544c <_vfiprintf_r+0x163c>
    4d18:	f94037e0 	ldr	x0, [sp, #104]
    4d1c:	91002c01 	add	x1, x0, #0xb
    4d20:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d24:	f90037e1 	str	x1, [sp, #104]
    4d28:	79400001 	ldrh	w1, [x0]
    4d2c:	52800020 	mov	w0, #0x1                   	// #1
    4d30:	17fffdbd 	b	4424 <_vfiprintf_r+0x614>
    4d34:	9103c3e0 	add	x0, sp, #0xf0
    4d38:	d2800042 	mov	x2, #0x2                   	// #2
    4d3c:	910643fb 	add	x27, sp, #0x190
    4d40:	52800021 	mov	w1, #0x1                   	// #1
    4d44:	a9190be0 	stp	x0, x2, [sp, #400]
    4d48:	aa0203e0 	mov	x0, x2
    4d4c:	17ffff18 	b	49ac <_vfiprintf_r+0xb9c>
    4d50:	2a1603e4 	mov	w4, w22
    4d54:	17fffddd 	b	44c8 <_vfiprintf_r+0x6b8>
    4d58:	b940b3e1 	ldr	w1, [sp, #176]
    4d5c:	11002021 	add	w1, w1, #0x8
    4d60:	7100003f 	cmp	w1, #0x0
    4d64:	54002d6d 	b.le	5310 <_vfiprintf_r+0x1500>
    4d68:	f94037e2 	ldr	x2, [sp, #104]
    4d6c:	b900b3e1 	str	w1, [sp, #176]
    4d70:	91003c58 	add	x24, x2, #0xf
    4d74:	927df318 	and	x24, x24, #0xfffffffffffffff8
    4d78:	17fffd46 	b	4290 <_vfiprintf_r+0x480>
    4d7c:	b940b3e0 	ldr	w0, [sp, #176]
    4d80:	11002001 	add	w1, w0, #0x8
    4d84:	7100003f 	cmp	w1, #0x0
    4d88:	54002a2d 	b.le	52cc <_vfiprintf_r+0x14bc>
    4d8c:	f94037e0 	ldr	x0, [sp, #104]
    4d90:	b900b3e1 	str	w1, [sp, #176]
    4d94:	91002c00 	add	x0, x0, #0xb
    4d98:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4d9c:	17fffd8f 	b	43d8 <_vfiprintf_r+0x5c8>
    4da0:	b940b3e0 	ldr	w0, [sp, #176]
    4da4:	11002000 	add	w0, w0, #0x8
    4da8:	7100001f 	cmp	w0, #0x0
    4dac:	5400286d 	b.le	52b8 <_vfiprintf_r+0x14a8>
    4db0:	f94037e2 	ldr	x2, [sp, #104]
    4db4:	b900b3e0 	str	w0, [sp, #176]
    4db8:	91003c41 	add	x1, x2, #0xf
    4dbc:	927df020 	and	x0, x1, #0xfffffffffffffff8
    4dc0:	f90037e0 	str	x0, [sp, #104]
    4dc4:	17fffe1f 	b	4640 <_vfiprintf_r+0x830>
    4dc8:	b940b3e0 	ldr	w0, [sp, #176]
    4dcc:	37f828e0 	tbnz	w0, #31, 52e8 <_vfiprintf_r+0x14d8>
    4dd0:	f94037e0 	ldr	x0, [sp, #104]
    4dd4:	91002c01 	add	x1, x0, #0xb
    4dd8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4ddc:	f90037e1 	str	x1, [sp, #104]
    4de0:	b9400000 	ldr	w0, [x0]
    4de4:	52800036 	mov	w22, #0x1                   	// #1
    4de8:	9104a3fa 	add	x26, sp, #0x128
    4dec:	2a1603f7 	mov	w23, w22
    4df0:	3903bfff 	strb	wzr, [sp, #239]
    4df4:	3904a3e0 	strb	w0, [sp, #296]
    4df8:	17fffc96 	b	4050 <_vfiprintf_r+0x240>
    4dfc:	b940b3e0 	ldr	w0, [sp, #176]
    4e00:	11002001 	add	w1, w0, #0x8
    4e04:	7100003f 	cmp	w1, #0x0
    4e08:	5400394d 	b.le	5530 <_vfiprintf_r+0x1720>
    4e0c:	f94037e0 	ldr	x0, [sp, #104]
    4e10:	b900b3e1 	str	w1, [sp, #176]
    4e14:	91003c02 	add	x2, x0, #0xf
    4e18:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4e1c:	f90037e1 	str	x1, [sp, #104]
    4e20:	17fffdf0 	b	45e0 <_vfiprintf_r+0x7d0>
    4e24:	3943bfe1 	ldrb	w1, [sp, #239]
    4e28:	35002d81 	cbnz	w1, 53d8 <_vfiprintf_r+0x15c8>
    4e2c:	35ffdb0a 	cbnz	w10, 498c <_vfiprintf_r+0xb7c>
    4e30:	910643fb 	add	x27, sp, #0x190
    4e34:	52800001 	mov	w1, #0x0                   	// #0
    4e38:	52800028 	mov	w8, #0x1                   	// #1
    4e3c:	17fffcbb 	b	4128 <_vfiprintf_r+0x318>
    4e40:	2a1603e4 	mov	w4, w22
    4e44:	2a1c03f6 	mov	w22, w28
    4e48:	17fffd6d 	b	43fc <_vfiprintf_r+0x5ec>
    4e4c:	2a1603e4 	mov	w4, w22
    4e50:	f0000021 	adrp	x1, b000 <pow10.0+0x80>
    4e54:	9109c021 	add	x1, x1, #0x270
    4e58:	f90047e1 	str	x1, [sp, #136]
    4e5c:	b940b3e1 	ldr	w1, [sp, #176]
    4e60:	3728023c 	tbnz	w28, #5, 4ea4 <_vfiprintf_r+0x1094>
    4e64:	3720021c 	tbnz	w28, #4, 4ea4 <_vfiprintf_r+0x1094>
    4e68:	36301b7c 	tbz	w28, #6, 51d4 <_vfiprintf_r+0x13c4>
    4e6c:	37f82c41 	tbnz	w1, #31, 53f4 <_vfiprintf_r+0x15e4>
    4e70:	f94037e1 	ldr	x1, [sp, #104]
    4e74:	91002c22 	add	x2, x1, #0xb
    4e78:	927df042 	and	x2, x2, #0xfffffffffffffff8
    4e7c:	79400021 	ldrh	w1, [x1]
    4e80:	f90037e2 	str	x2, [sp, #104]
    4e84:	1400000e 	b	4ebc <_vfiprintf_r+0x10ac>
    4e88:	f0000021 	adrp	x1, b000 <pow10.0+0x80>
    4e8c:	2a1603e4 	mov	w4, w22
    4e90:	910a2021 	add	x1, x1, #0x288
    4e94:	f90047e1 	str	x1, [sp, #136]
    4e98:	17fffff1 	b	4e5c <_vfiprintf_r+0x104c>
    4e9c:	2a1603e4 	mov	w4, w22
    4ea0:	17fffd7c 	b	4490 <_vfiprintf_r+0x680>
    4ea4:	37f801a1 	tbnz	w1, #31, 4ed8 <_vfiprintf_r+0x10c8>
    4ea8:	f94037e1 	ldr	x1, [sp, #104]
    4eac:	91003c22 	add	x2, x1, #0xf
    4eb0:	927df042 	and	x2, x2, #0xfffffffffffffff8
    4eb4:	f90037e2 	str	x2, [sp, #104]
    4eb8:	f9400021 	ldr	x1, [x1]
    4ebc:	f100003f 	cmp	x1, #0x0
    4ec0:	1a9f07e2 	cset	w2, ne  // ne = any
    4ec4:	6a02039f 	tst	w28, w2
    4ec8:	54000581 	b.ne	4f78 <_vfiprintf_r+0x1168>  // b.any
    4ecc:	12157b96 	and	w22, w28, #0xfffffbff
    4ed0:	52800040 	mov	w0, #0x2                   	// #2
    4ed4:	17fffd54 	b	4424 <_vfiprintf_r+0x614>
    4ed8:	b940b3e1 	ldr	w1, [sp, #176]
    4edc:	11002022 	add	w2, w1, #0x8
    4ee0:	7100005f 	cmp	w2, #0x0
    4ee4:	540016ed 	b.le	51c0 <_vfiprintf_r+0x13b0>
    4ee8:	f94037e1 	ldr	x1, [sp, #104]
    4eec:	b900b3e2 	str	w2, [sp, #176]
    4ef0:	91003c23 	add	x3, x1, #0xf
    4ef4:	927df062 	and	x2, x3, #0xfffffffffffffff8
    4ef8:	f90037e2 	str	x2, [sp, #104]
    4efc:	17ffffef 	b	4eb8 <_vfiprintf_r+0x10a8>
    4f00:	b940b3e0 	ldr	w0, [sp, #176]
    4f04:	11002001 	add	w1, w0, #0x8
    4f08:	7100003f 	cmp	w1, #0x0
    4f0c:	540017ed 	b.le	5208 <_vfiprintf_r+0x13f8>
    4f10:	f94037e0 	ldr	x0, [sp, #104]
    4f14:	b900b3e1 	str	w1, [sp, #176]
    4f18:	91003c02 	add	x2, x0, #0xf
    4f1c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4f20:	f90037e1 	str	x1, [sp, #104]
    4f24:	17fffd71 	b	44e8 <_vfiprintf_r+0x6d8>
    4f28:	b940b3e0 	ldr	w0, [sp, #176]
    4f2c:	11002001 	add	w1, w0, #0x8
    4f30:	7100003f 	cmp	w1, #0x0
    4f34:	5400186d 	b.le	5240 <_vfiprintf_r+0x1430>
    4f38:	f94037e0 	ldr	x0, [sp, #104]
    4f3c:	b900b3e1 	str	w1, [sp, #176]
    4f40:	91003c02 	add	x2, x0, #0xf
    4f44:	927df041 	and	x1, x2, #0xfffffffffffffff8
    4f48:	f90037e1 	str	x1, [sp, #104]
    4f4c:	17fffd59 	b	44b0 <_vfiprintf_r+0x6a0>
    4f50:	b940b3e0 	ldr	w0, [sp, #176]
    4f54:	11002000 	add	w0, w0, #0x8
    4f58:	7100001f 	cmp	w0, #0x0
    4f5c:	540014cd 	b.le	51f4 <_vfiprintf_r+0x13e4>
    4f60:	f94037e1 	ldr	x1, [sp, #104]
    4f64:	b900b3e0 	str	w0, [sp, #176]
    4f68:	91003c22 	add	x2, x1, #0xf
    4f6c:	927df040 	and	x0, x2, #0xfffffffffffffff8
    4f70:	f90037e0 	str	x0, [sp, #104]
    4f74:	17fffd2a 	b	441c <_vfiprintf_r+0x60c>
    4f78:	321f039c 	orr	w28, w28, #0x2
    4f7c:	3903c7e0 	strb	w0, [sp, #241]
    4f80:	52800600 	mov	w0, #0x30                  	// #48
    4f84:	3903c3e0 	strb	w0, [sp, #240]
    4f88:	17ffffd1 	b	4ecc <_vfiprintf_r+0x10bc>
    4f8c:	910403e0 	add	x0, sp, #0x100
    4f90:	d2800102 	mov	x2, #0x8                   	// #8
    4f94:	52800001 	mov	w1, #0x0                   	// #0
    4f98:	b9006be4 	str	w4, [sp, #104]
    4f9c:	f90087fa 	str	x26, [sp, #264]
    4fa0:	97fffac8 	bl	3ac0 <memset>
    4fa4:	b9406be4 	ldr	w4, [sp, #104]
    4fa8:	3100049f 	cmn	w4, #0x1
    4fac:	54001680 	b.eq	527c <_vfiprintf_r+0x146c>  // b.none
    4fb0:	d2800016 	mov	x22, #0x0                   	// #0
    4fb4:	52800017 	mov	w23, #0x0                   	// #0
    4fb8:	aa1603e0 	mov	x0, x22
    4fbc:	2a1703f6 	mov	w22, w23
    4fc0:	aa0003f7 	mov	x23, x0
    4fc4:	f90037f4 	str	x20, [sp, #104]
    4fc8:	2a0403f4 	mov	w20, w4
    4fcc:	1400000d 	b	5000 <_vfiprintf_r+0x11f0>
    4fd0:	910403e3 	add	x3, sp, #0x100
    4fd4:	9104a3e1 	add	x1, sp, #0x128
    4fd8:	aa1303e0 	mov	x0, x19
    4fdc:	940002a9 	bl	5a80 <_wcrtomb_r>
    4fe0:	3100041f 	cmn	w0, #0x1
    4fe4:	54002d60 	b.eq	5590 <_vfiprintf_r+0x1780>  // b.none
    4fe8:	0b0002c0 	add	w0, w22, w0
    4fec:	6b14001f 	cmp	w0, w20
    4ff0:	540000ec 	b.gt	500c <_vfiprintf_r+0x11fc>
    4ff4:	910012f7 	add	x23, x23, #0x4
    4ff8:	54003820 	b.eq	56fc <_vfiprintf_r+0x18ec>  // b.none
    4ffc:	2a0003f6 	mov	w22, w0
    5000:	f94087e0 	ldr	x0, [sp, #264]
    5004:	b8776802 	ldr	w2, [x0, x23]
    5008:	35fffe42 	cbnz	w2, 4fd0 <_vfiprintf_r+0x11c0>
    500c:	f94037f4 	ldr	x20, [sp, #104]
    5010:	2a1603f7 	mov	w23, w22
    5014:	340014b7 	cbz	w23, 52a8 <_vfiprintf_r+0x1498>
    5018:	71018eff 	cmp	w23, #0x63
    501c:	540024ac 	b.gt	54b0 <_vfiprintf_r+0x16a0>
    5020:	9104a3fa 	add	x26, sp, #0x128
    5024:	f9003bff 	str	xzr, [sp, #112]
    5028:	93407ef6 	sxtw	x22, w23
    502c:	d2800102 	mov	x2, #0x8                   	// #8
    5030:	52800001 	mov	w1, #0x0                   	// #0
    5034:	910403e0 	add	x0, sp, #0x100
    5038:	97fffaa2 	bl	3ac0 <memset>
    503c:	910403e4 	add	x4, sp, #0x100
    5040:	aa1603e3 	mov	x3, x22
    5044:	910423e2 	add	x2, sp, #0x108
    5048:	aa1a03e1 	mov	x1, x26
    504c:	aa1303e0 	mov	x0, x19
    5050:	940002d8 	bl	5bb0 <_wcsrtombs_r>
    5054:	eb0002df 	cmp	x22, x0
    5058:	54004761 	b.ne	5944 <_vfiprintf_r+0x1b34>  // b.any
    505c:	710002ff 	cmp	w23, #0x0
    5060:	52800004 	mov	w4, #0x0                   	// #0
    5064:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    5068:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    506c:	f90037f8 	str	x24, [sp, #104]
    5070:	17fffcff 	b	446c <_vfiprintf_r+0x65c>
    5074:	910633f7 	add	x23, sp, #0x18c
    5078:	121602c6 	and	w6, w22, #0x400
    507c:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    5080:	aa1703e2 	mov	x2, x23
    5084:	aa1403e3 	mov	x3, x20
    5088:	aa1703e5 	mov	x5, x23
    508c:	52800008 	mov	w8, #0x0                   	// #0
    5090:	aa1303f7 	mov	x23, x19
    5094:	f29999bc 	movk	x28, #0xcccd
    5098:	2a0603f3 	mov	w19, w6
    509c:	f9404ff4 	ldr	x20, [sp, #152]
    50a0:	14000007 	b	50bc <_vfiprintf_r+0x12ac>
    50a4:	9bdc7c38 	umulh	x24, x1, x28
    50a8:	d343ff18 	lsr	x24, x24, #3
    50ac:	f100243f 	cmp	x1, #0x9
    50b0:	54000249 	b.ls	50f8 <_vfiprintf_r+0x12e8>  // b.plast
    50b4:	aa1803e1 	mov	x1, x24
    50b8:	aa1a03e2 	mov	x2, x26
    50bc:	9bdc7c38 	umulh	x24, x1, x28
    50c0:	11000508 	add	w8, w8, #0x1
    50c4:	d100045a 	sub	x26, x2, #0x1
    50c8:	d343ff18 	lsr	x24, x24, #3
    50cc:	8b180b00 	add	x0, x24, x24, lsl #2
    50d0:	cb000420 	sub	x0, x1, x0, lsl #1
    50d4:	1100c000 	add	w0, w0, #0x30
    50d8:	381ff040 	sturb	w0, [x2, #-1]
    50dc:	34fffe53 	cbz	w19, 50a4 <_vfiprintf_r+0x1294>
    50e0:	39400280 	ldrb	w0, [x20]
    50e4:	7103fc1f 	cmp	w0, #0xff
    50e8:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    50ec:	54fffdc1 	b.ne	50a4 <_vfiprintf_r+0x1294>  // b.any
    50f0:	f100243f 	cmp	x1, #0x9
    50f4:	54002028 	b.hi	54f8 <_vfiprintf_r+0x16e8>  // b.pmore
    50f8:	aa1703f3 	mov	x19, x23
    50fc:	aa0503f7 	mov	x23, x5
    5100:	4b1a02f7 	sub	w23, w23, w26
    5104:	2a1603fc 	mov	w28, w22
    5108:	f9004ff4 	str	x20, [sp, #152]
    510c:	aa0303f4 	mov	x20, x3
    5110:	17fffcd4 	b	4460 <_vfiprintf_r+0x650>
    5114:	39400680 	ldrb	w0, [x20, #1]
    5118:	3217039c 	orr	w28, w28, #0x200
    511c:	91000694 	add	x20, x20, #0x1
    5120:	17fffbc2 	b	4028 <_vfiprintf_r+0x218>
    5124:	39400680 	ldrb	w0, [x20, #1]
    5128:	321b039c 	orr	w28, w28, #0x20
    512c:	91000694 	add	x20, x20, #0x1
    5130:	17fffbbe 	b	4028 <_vfiprintf_r+0x218>
    5134:	aa1403f3 	mov	x19, x20
    5138:	aa1603f9 	mov	x25, x22
    513c:	17fffc3c 	b	422c <_vfiprintf_r+0x41c>
    5140:	7100189f 	cmp	w4, #0x6
    5144:	528000d7 	mov	w23, #0x6                   	// #6
    5148:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    514c:	d0000027 	adrp	x7, b000 <pow10.0+0x80>
    5150:	2a1703f6 	mov	w22, w23
    5154:	910a80fa 	add	x26, x7, #0x2a0
    5158:	f90037f8 	str	x24, [sp, #104]
    515c:	17fffbbd 	b	4050 <_vfiprintf_r+0x240>
    5160:	f94093e0 	ldr	x0, [sp, #288]
    5164:	b4ff86e0 	cbz	x0, 4240 <_vfiprintf_r+0x430>
    5168:	aa1303e0 	mov	x0, x19
    516c:	910443e2 	add	x2, sp, #0x110
    5170:	aa1903e1 	mov	x1, x25
    5174:	97fffae7 	bl	3d10 <__sprint_r.part.0>
    5178:	17fffc32 	b	4240 <_vfiprintf_r+0x430>
    517c:	3648101c 	tbz	w28, #9, 537c <_vfiprintf_r+0x156c>
    5180:	37f822e0 	tbnz	w0, #31, 55dc <_vfiprintf_r+0x17cc>
    5184:	f94037e0 	ldr	x0, [sp, #104]
    5188:	91002c01 	add	x1, x0, #0xb
    518c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5190:	f90037e1 	str	x1, [sp, #104]
    5194:	39400001 	ldrb	w1, [x0]
    5198:	17fffcc7 	b	44b4 <_vfiprintf_r+0x6a4>
    519c:	364810f6 	tbz	w22, #9, 53b8 <_vfiprintf_r+0x15a8>
    51a0:	37f82880 	tbnz	w0, #31, 56b0 <_vfiprintf_r+0x18a0>
    51a4:	f94037e0 	ldr	x0, [sp, #104]
    51a8:	91002c01 	add	x1, x0, #0xb
    51ac:	927df021 	and	x1, x1, #0xfffffffffffffff8
    51b0:	f90037e1 	str	x1, [sp, #104]
    51b4:	39400001 	ldrb	w1, [x0]
    51b8:	52800020 	mov	w0, #0x1                   	// #1
    51bc:	17fffc9a 	b	4424 <_vfiprintf_r+0x614>
    51c0:	f94043e3 	ldr	x3, [sp, #128]
    51c4:	b940b3e1 	ldr	w1, [sp, #176]
    51c8:	b900b3e2 	str	w2, [sp, #176]
    51cc:	8b21c061 	add	x1, x3, w1, sxtw
    51d0:	17ffff3a 	b	4eb8 <_vfiprintf_r+0x10a8>
    51d4:	36480c7c 	tbz	w28, #9, 5360 <_vfiprintf_r+0x1550>
    51d8:	37f82421 	tbnz	w1, #31, 565c <_vfiprintf_r+0x184c>
    51dc:	f94037e1 	ldr	x1, [sp, #104]
    51e0:	91002c22 	add	x2, x1, #0xb
    51e4:	927df042 	and	x2, x2, #0xfffffffffffffff8
    51e8:	39400021 	ldrb	w1, [x1]
    51ec:	f90037e2 	str	x2, [sp, #104]
    51f0:	17ffff33 	b	4ebc <_vfiprintf_r+0x10ac>
    51f4:	f94043e2 	ldr	x2, [sp, #128]
    51f8:	b940b3e1 	ldr	w1, [sp, #176]
    51fc:	b900b3e0 	str	w0, [sp, #176]
    5200:	8b21c041 	add	x1, x2, w1, sxtw
    5204:	17fffc86 	b	441c <_vfiprintf_r+0x60c>
    5208:	f94043e2 	ldr	x2, [sp, #128]
    520c:	b940b3e0 	ldr	w0, [sp, #176]
    5210:	b900b3e1 	str	w1, [sp, #176]
    5214:	8b20c040 	add	x0, x2, w0, sxtw
    5218:	17fffcb4 	b	44e8 <_vfiprintf_r+0x6d8>
    521c:	36480bfc 	tbz	w28, #9, 5398 <_vfiprintf_r+0x1588>
    5220:	37f820a0 	tbnz	w0, #31, 5634 <_vfiprintf_r+0x1824>
    5224:	f94037e0 	ldr	x0, [sp, #104]
    5228:	91002c01 	add	x1, x0, #0xb
    522c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5230:	f90037e1 	str	x1, [sp, #104]
    5234:	39800001 	ldrsb	x1, [x0]
    5238:	aa0103e0 	mov	x0, x1
    523c:	17fffcad 	b	44f0 <_vfiprintf_r+0x6e0>
    5240:	f94043e2 	ldr	x2, [sp, #128]
    5244:	b940b3e0 	ldr	w0, [sp, #176]
    5248:	b900b3e1 	str	w1, [sp, #176]
    524c:	8b20c040 	add	x0, x2, w0, sxtw
    5250:	17fffc98 	b	44b0 <_vfiprintf_r+0x6a0>
    5254:	b940b3e0 	ldr	w0, [sp, #176]
    5258:	11002001 	add	w1, w0, #0x8
    525c:	7100003f 	cmp	w1, #0x0
    5260:	540011ed 	b.le	549c <_vfiprintf_r+0x168c>
    5264:	f94037e0 	ldr	x0, [sp, #104]
    5268:	b900b3e1 	str	w1, [sp, #176]
    526c:	91002c02 	add	x2, x0, #0xb
    5270:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5274:	f90037e1 	str	x1, [sp, #104]
    5278:	17fffc2b 	b	4324 <_vfiprintf_r+0x514>
    527c:	910403e4 	add	x4, sp, #0x100
    5280:	910423e2 	add	x2, sp, #0x108
    5284:	aa1303e0 	mov	x0, x19
    5288:	d2800003 	mov	x3, #0x0                   	// #0
    528c:	d2800001 	mov	x1, #0x0                   	// #0
    5290:	94000248 	bl	5bb0 <_wcsrtombs_r>
    5294:	2a0003f7 	mov	w23, w0
    5298:	3100041f 	cmn	w0, #0x1
    529c:	540017a0 	b.eq	5590 <_vfiprintf_r+0x1780>  // b.none
    52a0:	f90087fa 	str	x26, [sp, #264]
    52a4:	17ffff5c 	b	5014 <_vfiprintf_r+0x1204>
    52a8:	52800016 	mov	w22, #0x0                   	// #0
    52ac:	52800004 	mov	w4, #0x0                   	// #0
    52b0:	a906fff8 	stp	x24, xzr, [sp, #104]
    52b4:	17fffc6e 	b	446c <_vfiprintf_r+0x65c>
    52b8:	f94043e2 	ldr	x2, [sp, #128]
    52bc:	b940b3e1 	ldr	w1, [sp, #176]
    52c0:	b900b3e0 	str	w0, [sp, #176]
    52c4:	8b21c042 	add	x2, x2, w1, sxtw
    52c8:	17fffcde 	b	4640 <_vfiprintf_r+0x830>
    52cc:	f94043e2 	ldr	x2, [sp, #128]
    52d0:	b940b3e0 	ldr	w0, [sp, #176]
    52d4:	b900b3e1 	str	w1, [sp, #176]
    52d8:	8b20c042 	add	x2, x2, w0, sxtw
    52dc:	f94037e0 	ldr	x0, [sp, #104]
    52e0:	f90037e2 	str	x2, [sp, #104]
    52e4:	17fffc3d 	b	43d8 <_vfiprintf_r+0x5c8>
    52e8:	b940b3e0 	ldr	w0, [sp, #176]
    52ec:	11002001 	add	w1, w0, #0x8
    52f0:	7100003f 	cmp	w1, #0x0
    52f4:	54000eed 	b.le	54d0 <_vfiprintf_r+0x16c0>
    52f8:	f94037e0 	ldr	x0, [sp, #104]
    52fc:	b900b3e1 	str	w1, [sp, #176]
    5300:	91002c02 	add	x2, x0, #0xb
    5304:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5308:	f90037e1 	str	x1, [sp, #104]
    530c:	17fffeb5 	b	4de0 <_vfiprintf_r+0xfd0>
    5310:	f94043e3 	ldr	x3, [sp, #128]
    5314:	b940b3e2 	ldr	w2, [sp, #176]
    5318:	b900b3e1 	str	w1, [sp, #176]
    531c:	f94037f8 	ldr	x24, [sp, #104]
    5320:	8b22c062 	add	x2, x3, w2, sxtw
    5324:	f90037e2 	str	x2, [sp, #104]
    5328:	17fffbda 	b	4290 <_vfiprintf_r+0x480>
    532c:	910643fb 	add	x27, sp, #0x190
    5330:	52800028 	mov	w8, #0x1                   	// #1
    5334:	52800001 	mov	w1, #0x0                   	// #0
    5338:	17fffb7c 	b	4128 <_vfiprintf_r+0x318>
    533c:	37f81e60 	tbnz	w0, #31, 5708 <_vfiprintf_r+0x18f8>
    5340:	f94037e0 	ldr	x0, [sp, #104]
    5344:	91003c01 	add	x1, x0, #0xf
    5348:	927df021 	and	x1, x1, #0xfffffffffffffff8
    534c:	f90037e1 	str	x1, [sp, #104]
    5350:	f9400000 	ldr	x0, [x0]
    5354:	7940cbe1 	ldrh	w1, [sp, #100]
    5358:	79000001 	strh	w1, [x0]
    535c:	17fffae4 	b	3eec <_vfiprintf_r+0xdc>
    5360:	37f81281 	tbnz	w1, #31, 55b0 <_vfiprintf_r+0x17a0>
    5364:	f94037e1 	ldr	x1, [sp, #104]
    5368:	91002c22 	add	x2, x1, #0xb
    536c:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5370:	b9400021 	ldr	w1, [x1]
    5374:	f90037e2 	str	x2, [sp, #104]
    5378:	17fffed1 	b	4ebc <_vfiprintf_r+0x10ac>
    537c:	37f81460 	tbnz	w0, #31, 5608 <_vfiprintf_r+0x17f8>
    5380:	f94037e0 	ldr	x0, [sp, #104]
    5384:	91002c01 	add	x1, x0, #0xb
    5388:	927df021 	and	x1, x1, #0xfffffffffffffff8
    538c:	f90037e1 	str	x1, [sp, #104]
    5390:	b9400001 	ldr	w1, [x0]
    5394:	17fffc48 	b	44b4 <_vfiprintf_r+0x6a4>
    5398:	37f81cc0 	tbnz	w0, #31, 5730 <_vfiprintf_r+0x1920>
    539c:	f94037e0 	ldr	x0, [sp, #104]
    53a0:	91002c01 	add	x1, x0, #0xb
    53a4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53a8:	f90037e1 	str	x1, [sp, #104]
    53ac:	b9800001 	ldrsw	x1, [x0]
    53b0:	aa0103e0 	mov	x0, x1
    53b4:	17fffc4f 	b	44f0 <_vfiprintf_r+0x6e0>
    53b8:	37f81680 	tbnz	w0, #31, 5688 <_vfiprintf_r+0x1878>
    53bc:	f94037e0 	ldr	x0, [sp, #104]
    53c0:	91002c01 	add	x1, x0, #0xb
    53c4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53c8:	f90037e1 	str	x1, [sp, #104]
    53cc:	b9400001 	ldr	w1, [x0]
    53d0:	52800020 	mov	w0, #0x1                   	// #1
    53d4:	17fffc14 	b	4424 <_vfiprintf_r+0x614>
    53d8:	9103bfe0 	add	x0, sp, #0xef
    53dc:	910643fb 	add	x27, sp, #0x190
    53e0:	52800028 	mov	w8, #0x1                   	// #1
    53e4:	f900cbe0 	str	x0, [sp, #400]
    53e8:	d2800020 	mov	x0, #0x1                   	// #1
    53ec:	f900cfe0 	str	x0, [sp, #408]
    53f0:	17fffb33 	b	40bc <_vfiprintf_r+0x2ac>
    53f4:	b940b3e1 	ldr	w1, [sp, #176]
    53f8:	11002022 	add	w2, w1, #0x8
    53fc:	7100005f 	cmp	w2, #0x0
    5400:	54001b6d 	b.le	576c <_vfiprintf_r+0x195c>
    5404:	f94037e1 	ldr	x1, [sp, #104]
    5408:	b900b3e2 	str	w2, [sp, #176]
    540c:	91002c23 	add	x3, x1, #0xb
    5410:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5414:	79400021 	ldrh	w1, [x1]
    5418:	f90037e2 	str	x2, [sp, #104]
    541c:	17fffea8 	b	4ebc <_vfiprintf_r+0x10ac>
    5420:	b940b3e0 	ldr	w0, [sp, #176]
    5424:	11002001 	add	w1, w0, #0x8
    5428:	7100003f 	cmp	w1, #0x0
    542c:	54001b6d 	b.le	5798 <_vfiprintf_r+0x1988>
    5430:	f94037e0 	ldr	x0, [sp, #104]
    5434:	b900b3e1 	str	w1, [sp, #176]
    5438:	91002c02 	add	x2, x0, #0xb
    543c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5440:	f90037e1 	str	x1, [sp, #104]
    5444:	79400001 	ldrh	w1, [x0]
    5448:	17fffc1b 	b	44b4 <_vfiprintf_r+0x6a4>
    544c:	b940b3e0 	ldr	w0, [sp, #176]
    5450:	11002001 	add	w1, w0, #0x8
    5454:	7100003f 	cmp	w1, #0x0
    5458:	5400196d 	b.le	5784 <_vfiprintf_r+0x1974>
    545c:	f94037e0 	ldr	x0, [sp, #104]
    5460:	b900b3e1 	str	w1, [sp, #176]
    5464:	91002c02 	add	x2, x0, #0xb
    5468:	927df041 	and	x1, x2, #0xfffffffffffffff8
    546c:	f90037e1 	str	x1, [sp, #104]
    5470:	17fffe2e 	b	4d28 <_vfiprintf_r+0xf18>
    5474:	b940b3e0 	ldr	w0, [sp, #176]
    5478:	11002001 	add	w1, w0, #0x8
    547c:	7100003f 	cmp	w1, #0x0
    5480:	540016cd 	b.le	5758 <_vfiprintf_r+0x1948>
    5484:	f94037e0 	ldr	x0, [sp, #104]
    5488:	b900b3e1 	str	w1, [sp, #176]
    548c:	91002c02 	add	x2, x0, #0xb
    5490:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5494:	f90037e1 	str	x1, [sp, #104]
    5498:	17fffe13 	b	4ce4 <_vfiprintf_r+0xed4>
    549c:	f94043e2 	ldr	x2, [sp, #128]
    54a0:	b940b3e0 	ldr	w0, [sp, #176]
    54a4:	b900b3e1 	str	w1, [sp, #176]
    54a8:	8b20c040 	add	x0, x2, w0, sxtw
    54ac:	17fffb9e 	b	4324 <_vfiprintf_r+0x514>
    54b0:	110006e1 	add	w1, w23, #0x1
    54b4:	aa1303e0 	mov	x0, x19
    54b8:	93407c21 	sxtw	x1, w1
    54bc:	97fff6e1 	bl	3040 <_malloc_r>
    54c0:	aa0003fa 	mov	x26, x0
    54c4:	b4000660 	cbz	x0, 5590 <_vfiprintf_r+0x1780>
    54c8:	f9003be0 	str	x0, [sp, #112]
    54cc:	17fffed7 	b	5028 <_vfiprintf_r+0x1218>
    54d0:	f94043e2 	ldr	x2, [sp, #128]
    54d4:	b940b3e0 	ldr	w0, [sp, #176]
    54d8:	b900b3e1 	str	w1, [sp, #176]
    54dc:	8b20c040 	add	x0, x2, w0, sxtw
    54e0:	17fffe40 	b	4de0 <_vfiprintf_r+0xfd0>
    54e4:	2a0403f6 	mov	w22, w4
    54e8:	2a0403f7 	mov	w23, w4
    54ec:	52800004 	mov	w4, #0x0                   	// #0
    54f0:	f90037f8 	str	x24, [sp, #104]
    54f4:	17fffbde 	b	446c <_vfiprintf_r+0x65c>
    54f8:	a94a03e1 	ldp	x1, x0, [sp, #160]
    54fc:	b90073e4 	str	w4, [sp, #112]
    5500:	a90917e3 	stp	x3, x5, [sp, #144]
    5504:	cb00035a 	sub	x26, x26, x0
    5508:	aa0003e2 	mov	x2, x0
    550c:	aa1a03e0 	mov	x0, x26
    5510:	940011d0 	bl	9c50 <strncpy>
    5514:	39400680 	ldrb	w0, [x20, #1]
    5518:	52800008 	mov	w8, #0x0                   	// #0
    551c:	b94073e4 	ldr	w4, [sp, #112]
    5520:	7100001f 	cmp	w0, #0x0
    5524:	9a940694 	cinc	x20, x20, ne  // ne = any
    5528:	a94917e3 	ldp	x3, x5, [sp, #144]
    552c:	17fffee2 	b	50b4 <_vfiprintf_r+0x12a4>
    5530:	f94043e2 	ldr	x2, [sp, #128]
    5534:	b940b3e0 	ldr	w0, [sp, #176]
    5538:	b900b3e1 	str	w1, [sp, #176]
    553c:	8b20c040 	add	x0, x2, w0, sxtw
    5540:	17fffc28 	b	45e0 <_vfiprintf_r+0x7d0>
    5544:	d0000028 	adrp	x8, b000 <pow10.0+0x80>
    5548:	2a0203eb 	mov	w11, w2
    554c:	910d8108 	add	x8, x8, #0x360
    5550:	17fffd4e 	b	4a88 <_vfiprintf_r+0xc78>
    5554:	aa1a03e0 	mov	x0, x26
    5558:	9400114a 	bl	9a80 <strlen>
    555c:	7100001f 	cmp	w0, #0x0
    5560:	2a0003f7 	mov	w23, w0
    5564:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    5568:	52800004 	mov	w4, #0x0                   	// #0
    556c:	a906fff8 	stp	x24, xzr, [sp, #104]
    5570:	17fffbbf 	b	446c <_vfiprintf_r+0x65c>
    5574:	d0000028 	adrp	x8, b000 <pow10.0+0x80>
    5578:	11000444 	add	w4, w2, #0x1
    557c:	910d8108 	add	x8, x8, #0x360
    5580:	17fffd7b 	b	4b6c <_vfiprintf_r+0xd5c>
    5584:	12800000 	mov	w0, #0xffffffff            	// #-1
    5588:	b90067e0 	str	w0, [sp, #100]
    558c:	17fffb31 	b	4250 <_vfiprintf_r+0x440>
    5590:	79c02320 	ldrsh	w0, [x25, #16]
    5594:	321a0000 	orr	w0, w0, #0x40
    5598:	79002320 	strh	w0, [x25, #16]
    559c:	17fffb2a 	b	4244 <_vfiprintf_r+0x434>
    55a0:	d0000029 	adrp	x9, b000 <pow10.0+0x80>
    55a4:	2a0803ea 	mov	w10, w8
    55a8:	910dc129 	add	x9, x9, #0x370
    55ac:	17fffc90 	b	47ec <_vfiprintf_r+0x9dc>
    55b0:	b940b3e1 	ldr	w1, [sp, #176]
    55b4:	11002022 	add	w2, w1, #0x8
    55b8:	7100005f 	cmp	w2, #0x0
    55bc:	540019cd 	b.le	58f4 <_vfiprintf_r+0x1ae4>
    55c0:	f94037e1 	ldr	x1, [sp, #104]
    55c4:	b900b3e2 	str	w2, [sp, #176]
    55c8:	91002c23 	add	x3, x1, #0xb
    55cc:	927df062 	and	x2, x3, #0xfffffffffffffff8
    55d0:	b9400021 	ldr	w1, [x1]
    55d4:	f90037e2 	str	x2, [sp, #104]
    55d8:	17fffe39 	b	4ebc <_vfiprintf_r+0x10ac>
    55dc:	b940b3e0 	ldr	w0, [sp, #176]
    55e0:	11002001 	add	w1, w0, #0x8
    55e4:	7100003f 	cmp	w1, #0x0
    55e8:	540010cd 	b.le	5800 <_vfiprintf_r+0x19f0>
    55ec:	f94037e0 	ldr	x0, [sp, #104]
    55f0:	b900b3e1 	str	w1, [sp, #176]
    55f4:	91002c02 	add	x2, x0, #0xb
    55f8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    55fc:	f90037e1 	str	x1, [sp, #104]
    5600:	39400001 	ldrb	w1, [x0]
    5604:	17fffbac 	b	44b4 <_vfiprintf_r+0x6a4>
    5608:	b940b3e0 	ldr	w0, [sp, #176]
    560c:	11002001 	add	w1, w0, #0x8
    5610:	7100003f 	cmp	w1, #0x0
    5614:	540015ad 	b.le	58c8 <_vfiprintf_r+0x1ab8>
    5618:	f94037e0 	ldr	x0, [sp, #104]
    561c:	b900b3e1 	str	w1, [sp, #176]
    5620:	91002c02 	add	x2, x0, #0xb
    5624:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5628:	f90037e1 	str	x1, [sp, #104]
    562c:	b9400001 	ldr	w1, [x0]
    5630:	17fffba1 	b	44b4 <_vfiprintf_r+0x6a4>
    5634:	b940b3e0 	ldr	w0, [sp, #176]
    5638:	11002001 	add	w1, w0, #0x8
    563c:	7100003f 	cmp	w1, #0x0
    5640:	54000f6d 	b.le	582c <_vfiprintf_r+0x1a1c>
    5644:	f94037e0 	ldr	x0, [sp, #104]
    5648:	b900b3e1 	str	w1, [sp, #176]
    564c:	91002c02 	add	x2, x0, #0xb
    5650:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5654:	f90037e1 	str	x1, [sp, #104]
    5658:	17fffef7 	b	5234 <_vfiprintf_r+0x1424>
    565c:	b940b3e1 	ldr	w1, [sp, #176]
    5660:	11002022 	add	w2, w1, #0x8
    5664:	7100005f 	cmp	w2, #0x0
    5668:	5400152d 	b.le	590c <_vfiprintf_r+0x1afc>
    566c:	f94037e1 	ldr	x1, [sp, #104]
    5670:	b900b3e2 	str	w2, [sp, #176]
    5674:	91002c23 	add	x3, x1, #0xb
    5678:	927df062 	and	x2, x3, #0xfffffffffffffff8
    567c:	39400021 	ldrb	w1, [x1]
    5680:	f90037e2 	str	x2, [sp, #104]
    5684:	17fffe0e 	b	4ebc <_vfiprintf_r+0x10ac>
    5688:	b940b3e0 	ldr	w0, [sp, #176]
    568c:	11002001 	add	w1, w0, #0x8
    5690:	7100003f 	cmp	w1, #0x0
    5694:	5400106d 	b.le	58a0 <_vfiprintf_r+0x1a90>
    5698:	f94037e0 	ldr	x0, [sp, #104]
    569c:	b900b3e1 	str	w1, [sp, #176]
    56a0:	91002c02 	add	x2, x0, #0xb
    56a4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56a8:	f90037e1 	str	x1, [sp, #104]
    56ac:	17ffff48 	b	53cc <_vfiprintf_r+0x15bc>
    56b0:	b940b3e0 	ldr	w0, [sp, #176]
    56b4:	11002001 	add	w1, w0, #0x8
    56b8:	7100003f 	cmp	w1, #0x0
    56bc:	54000e8d 	b.le	588c <_vfiprintf_r+0x1a7c>
    56c0:	f94037e0 	ldr	x0, [sp, #104]
    56c4:	b900b3e1 	str	w1, [sp, #176]
    56c8:	91002c02 	add	x2, x0, #0xb
    56cc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56d0:	f90037e1 	str	x1, [sp, #104]
    56d4:	17fffeb8 	b	51b4 <_vfiprintf_r+0x13a4>
    56d8:	37f80800 	tbnz	w0, #31, 57d8 <_vfiprintf_r+0x19c8>
    56dc:	f94037e0 	ldr	x0, [sp, #104]
    56e0:	91003c01 	add	x1, x0, #0xf
    56e4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    56e8:	f90037e1 	str	x1, [sp, #104]
    56ec:	f9400000 	ldr	x0, [x0]
    56f0:	b94067e1 	ldr	w1, [sp, #100]
    56f4:	b9000001 	str	w1, [x0]
    56f8:	17fff9fd 	b	3eec <_vfiprintf_r+0xdc>
    56fc:	2a1403f7 	mov	w23, w20
    5700:	f94037f4 	ldr	x20, [sp, #104]
    5704:	17fffe44 	b	5014 <_vfiprintf_r+0x1204>
    5708:	b940b3e0 	ldr	w0, [sp, #176]
    570c:	11002001 	add	w1, w0, #0x8
    5710:	7100003f 	cmp	w1, #0x0
    5714:	54000d0d 	b.le	58b4 <_vfiprintf_r+0x1aa4>
    5718:	f94037e0 	ldr	x0, [sp, #104]
    571c:	b900b3e1 	str	w1, [sp, #176]
    5720:	91003c02 	add	x2, x0, #0xf
    5724:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5728:	f90037e1 	str	x1, [sp, #104]
    572c:	17ffff09 	b	5350 <_vfiprintf_r+0x1540>
    5730:	b940b3e0 	ldr	w0, [sp, #176]
    5734:	11002001 	add	w1, w0, #0x8
    5738:	7100003f 	cmp	w1, #0x0
    573c:	540006ed 	b.le	5818 <_vfiprintf_r+0x1a08>
    5740:	f94037e0 	ldr	x0, [sp, #104]
    5744:	b900b3e1 	str	w1, [sp, #176]
    5748:	91002c02 	add	x2, x0, #0xb
    574c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5750:	f90037e1 	str	x1, [sp, #104]
    5754:	17ffff16 	b	53ac <_vfiprintf_r+0x159c>
    5758:	f94043e2 	ldr	x2, [sp, #128]
    575c:	b940b3e0 	ldr	w0, [sp, #176]
    5760:	b900b3e1 	str	w1, [sp, #176]
    5764:	8b20c040 	add	x0, x2, w0, sxtw
    5768:	17fffd5f 	b	4ce4 <_vfiprintf_r+0xed4>
    576c:	f94043e3 	ldr	x3, [sp, #128]
    5770:	b940b3e1 	ldr	w1, [sp, #176]
    5774:	b900b3e2 	str	w2, [sp, #176]
    5778:	8b21c061 	add	x1, x3, w1, sxtw
    577c:	79400021 	ldrh	w1, [x1]
    5780:	17fffdcf 	b	4ebc <_vfiprintf_r+0x10ac>
    5784:	f94043e2 	ldr	x2, [sp, #128]
    5788:	b940b3e0 	ldr	w0, [sp, #176]
    578c:	b900b3e1 	str	w1, [sp, #176]
    5790:	8b20c040 	add	x0, x2, w0, sxtw
    5794:	17fffd65 	b	4d28 <_vfiprintf_r+0xf18>
    5798:	f94043e2 	ldr	x2, [sp, #128]
    579c:	b940b3e0 	ldr	w0, [sp, #176]
    57a0:	b900b3e1 	str	w1, [sp, #176]
    57a4:	8b20c040 	add	x0, x2, w0, sxtw
    57a8:	79400001 	ldrh	w1, [x0]
    57ac:	17fffb42 	b	44b4 <_vfiprintf_r+0x6a4>
    57b0:	b940b3e0 	ldr	w0, [sp, #176]
    57b4:	11002001 	add	w1, w0, #0x8
    57b8:	7100003f 	cmp	w1, #0x0
    57bc:	5400092d 	b.le	58e0 <_vfiprintf_r+0x1ad0>
    57c0:	f94037e0 	ldr	x0, [sp, #104]
    57c4:	b900b3e1 	str	w1, [sp, #176]
    57c8:	91003c02 	add	x2, x0, #0xf
    57cc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    57d0:	f90037e1 	str	x1, [sp, #104]
    57d4:	17fffb7a 	b	45bc <_vfiprintf_r+0x7ac>
    57d8:	b940b3e0 	ldr	w0, [sp, #176]
    57dc:	11002001 	add	w1, w0, #0x8
    57e0:	7100003f 	cmp	w1, #0x0
    57e4:	540002ed 	b.le	5840 <_vfiprintf_r+0x1a30>
    57e8:	f94037e0 	ldr	x0, [sp, #104]
    57ec:	b900b3e1 	str	w1, [sp, #176]
    57f0:	91003c02 	add	x2, x0, #0xf
    57f4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    57f8:	f90037e1 	str	x1, [sp, #104]
    57fc:	17ffffbc 	b	56ec <_vfiprintf_r+0x18dc>
    5800:	f94043e2 	ldr	x2, [sp, #128]
    5804:	b940b3e0 	ldr	w0, [sp, #176]
    5808:	b900b3e1 	str	w1, [sp, #176]
    580c:	8b20c040 	add	x0, x2, w0, sxtw
    5810:	39400001 	ldrb	w1, [x0]
    5814:	17fffb28 	b	44b4 <_vfiprintf_r+0x6a4>
    5818:	f94043e2 	ldr	x2, [sp, #128]
    581c:	b940b3e0 	ldr	w0, [sp, #176]
    5820:	b900b3e1 	str	w1, [sp, #176]
    5824:	8b20c040 	add	x0, x2, w0, sxtw
    5828:	17fffee1 	b	53ac <_vfiprintf_r+0x159c>
    582c:	f94043e2 	ldr	x2, [sp, #128]
    5830:	b940b3e0 	ldr	w0, [sp, #176]
    5834:	b900b3e1 	str	w1, [sp, #176]
    5838:	8b20c040 	add	x0, x2, w0, sxtw
    583c:	17fffe7e 	b	5234 <_vfiprintf_r+0x1424>
    5840:	f94043e2 	ldr	x2, [sp, #128]
    5844:	b940b3e0 	ldr	w0, [sp, #176]
    5848:	b900b3e1 	str	w1, [sp, #176]
    584c:	8b20c040 	add	x0, x2, w0, sxtw
    5850:	17ffffa7 	b	56ec <_vfiprintf_r+0x18dc>
    5854:	b940b3e0 	ldr	w0, [sp, #176]
    5858:	37f80660 	tbnz	w0, #31, 5924 <_vfiprintf_r+0x1b14>
    585c:	f94037e1 	ldr	x1, [sp, #104]
    5860:	91002c21 	add	x1, x1, #0xb
    5864:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5868:	f94037e3 	ldr	x3, [sp, #104]
    586c:	f90037e1 	str	x1, [sp, #104]
    5870:	b900b3e0 	str	w0, [sp, #176]
    5874:	39400680 	ldrb	w0, [x20, #1]
    5878:	aa0203f4 	mov	x20, x2
    587c:	b9400064 	ldr	w4, [x3]
    5880:	7100009f 	cmp	w4, #0x0
    5884:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    5888:	17fff9e8 	b	4028 <_vfiprintf_r+0x218>
    588c:	f94043e2 	ldr	x2, [sp, #128]
    5890:	b940b3e0 	ldr	w0, [sp, #176]
    5894:	b900b3e1 	str	w1, [sp, #176]
    5898:	8b20c040 	add	x0, x2, w0, sxtw
    589c:	17fffe46 	b	51b4 <_vfiprintf_r+0x13a4>
    58a0:	f94043e2 	ldr	x2, [sp, #128]
    58a4:	b940b3e0 	ldr	w0, [sp, #176]
    58a8:	b900b3e1 	str	w1, [sp, #176]
    58ac:	8b20c040 	add	x0, x2, w0, sxtw
    58b0:	17fffec7 	b	53cc <_vfiprintf_r+0x15bc>
    58b4:	f94043e2 	ldr	x2, [sp, #128]
    58b8:	b940b3e0 	ldr	w0, [sp, #176]
    58bc:	b900b3e1 	str	w1, [sp, #176]
    58c0:	8b20c040 	add	x0, x2, w0, sxtw
    58c4:	17fffea3 	b	5350 <_vfiprintf_r+0x1540>
    58c8:	f94043e2 	ldr	x2, [sp, #128]
    58cc:	b940b3e0 	ldr	w0, [sp, #176]
    58d0:	b900b3e1 	str	w1, [sp, #176]
    58d4:	8b20c040 	add	x0, x2, w0, sxtw
    58d8:	b9400001 	ldr	w1, [x0]
    58dc:	17fffaf6 	b	44b4 <_vfiprintf_r+0x6a4>
    58e0:	f94043e2 	ldr	x2, [sp, #128]
    58e4:	b940b3e0 	ldr	w0, [sp, #176]
    58e8:	b900b3e1 	str	w1, [sp, #176]
    58ec:	8b20c040 	add	x0, x2, w0, sxtw
    58f0:	17fffb33 	b	45bc <_vfiprintf_r+0x7ac>
    58f4:	f94043e3 	ldr	x3, [sp, #128]
    58f8:	b940b3e1 	ldr	w1, [sp, #176]
    58fc:	b900b3e2 	str	w2, [sp, #176]
    5900:	8b21c061 	add	x1, x3, w1, sxtw
    5904:	b9400021 	ldr	w1, [x1]
    5908:	17fffd6d 	b	4ebc <_vfiprintf_r+0x10ac>
    590c:	f94043e3 	ldr	x3, [sp, #128]
    5910:	b940b3e1 	ldr	w1, [sp, #176]
    5914:	b900b3e2 	str	w2, [sp, #176]
    5918:	8b21c061 	add	x1, x3, w1, sxtw
    591c:	39400021 	ldrb	w1, [x1]
    5920:	17fffd67 	b	4ebc <_vfiprintf_r+0x10ac>
    5924:	b940b3e0 	ldr	w0, [sp, #176]
    5928:	f94037e1 	ldr	x1, [sp, #104]
    592c:	11002000 	add	w0, w0, #0x8
    5930:	7100001f 	cmp	w0, #0x0
    5934:	5400010d 	b.le	5954 <_vfiprintf_r+0x1b44>
    5938:	91002c21 	add	x1, x1, #0xb
    593c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5940:	17ffffca 	b	5868 <_vfiprintf_r+0x1a58>
    5944:	79402320 	ldrh	w0, [x25, #16]
    5948:	321a0000 	orr	w0, w0, #0x40
    594c:	79002320 	strh	w0, [x25, #16]
    5950:	17fffa37 	b	422c <_vfiprintf_r+0x41c>
    5954:	f94043e4 	ldr	x4, [sp, #128]
    5958:	b940b3e3 	ldr	w3, [sp, #176]
    595c:	8b23c083 	add	x3, x4, w3, sxtw
    5960:	f90037e3 	str	x3, [sp, #104]
    5964:	17ffffc1 	b	5868 <_vfiprintf_r+0x1a58>
    5968:	d503201f 	nop
    596c:	d503201f 	nop

0000000000005970 <vfiprintf>:
    5970:	aa0203e4 	mov	x4, x2
    5974:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5978:	f0000023 	adrp	x3, c000 <IpcTestNull+0x6e8>
    597c:	910003fd 	mov	x29, sp
    5980:	a9401c46 	ldp	x6, x7, [x2]
    5984:	aa0003e8 	mov	x8, x0
    5988:	a9411484 	ldp	x4, x5, [x4, #16]
    598c:	aa0103e2 	mov	x2, x1
    5990:	f9409860 	ldr	x0, [x3, #304]
    5994:	aa0803e1 	mov	x1, x8
    5998:	910043e3 	add	x3, sp, #0x10
    599c:	a9011fe6 	stp	x6, x7, [sp, #16]
    59a0:	a90217e4 	stp	x4, x5, [sp, #32]
    59a4:	97fff91b 	bl	3e10 <_vfiprintf_r>
    59a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    59ac:	d65f03c0 	ret

00000000000059b0 <__sbprintf>:
    59b0:	d11403ff 	sub	sp, sp, #0x500
    59b4:	52808005 	mov	w5, #0x400                 	// #1024
    59b8:	910403e6 	add	x6, sp, #0x100
    59bc:	a9007bfd 	stp	x29, x30, [sp]
    59c0:	910003fd 	mov	x29, sp
    59c4:	a90153f3 	stp	x19, x20, [sp, #16]
    59c8:	aa0103f3 	mov	x19, x1
    59cc:	aa0303e1 	mov	x1, x3
    59d0:	9100c3e3 	add	x3, sp, #0x30
    59d4:	f9002be6 	str	x6, [sp, #80]
    59d8:	79402264 	ldrh	w4, [x19, #16]
    59dc:	a9403c2e 	ldp	x14, x15, [x1]
    59e0:	121e7884 	and	w4, w4, #0xfffffffd
    59e4:	7940266c 	ldrh	w12, [x19, #18]
    59e8:	a9412428 	ldp	x8, x9, [x1, #16]
    59ec:	910143e1 	add	x1, sp, #0x50
    59f0:	f9401a6b 	ldr	x11, [x19, #48]
    59f4:	b9005fe5 	str	w5, [sp, #92]
    59f8:	f940226a 	ldr	x10, [x19, #64]
    59fc:	a9033fee 	stp	x14, x15, [sp, #48]
    5a00:	b940ae67 	ldr	w7, [x19, #172]
    5a04:	f90013f5 	str	x21, [sp, #32]
    5a08:	aa0003f5 	mov	x21, x0
    5a0c:	a90427e8 	stp	x8, x9, [sp, #64]
    5a10:	7900c3e4 	strh	w4, [sp, #96]
    5a14:	7900c7ec 	strh	w12, [sp, #98]
    5a18:	f90037e6 	str	x6, [sp, #104]
    5a1c:	b90073e5 	str	w5, [sp, #112]
    5a20:	b9007bff 	str	wzr, [sp, #120]
    5a24:	f90043eb 	str	x11, [sp, #128]
    5a28:	f9004bea 	str	x10, [sp, #144]
    5a2c:	b900ffe7 	str	w7, [sp, #252]
    5a30:	97fff8f8 	bl	3e10 <_vfiprintf_r>
    5a34:	2a0003f4 	mov	w20, w0
    5a38:	37f800c0 	tbnz	w0, #31, 5a50 <__sbprintf+0xa0>
    5a3c:	910143e1 	add	x1, sp, #0x50
    5a40:	aa1503e0 	mov	x0, x21
    5a44:	9400017b 	bl	6030 <_fflush_r>
    5a48:	7100001f 	cmp	w0, #0x0
    5a4c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    5a50:	7940c3e0 	ldrh	w0, [sp, #96]
    5a54:	36300080 	tbz	w0, #6, 5a64 <__sbprintf+0xb4>
    5a58:	79402260 	ldrh	w0, [x19, #16]
    5a5c:	321a0000 	orr	w0, w0, #0x40
    5a60:	79002260 	strh	w0, [x19, #16]
    5a64:	2a1403e0 	mov	w0, w20
    5a68:	a9407bfd 	ldp	x29, x30, [sp]
    5a6c:	a94153f3 	ldp	x19, x20, [sp, #16]
    5a70:	f94013f5 	ldr	x21, [sp, #32]
    5a74:	911403ff 	add	sp, sp, #0x500
    5a78:	d65f03c0 	ret
    5a7c:	d503201f 	nop

0000000000005a80 <_wcrtomb_r>:
    5a80:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5a84:	91055004 	add	x4, x0, #0x154
    5a88:	910003fd 	mov	x29, sp
    5a8c:	a90153f3 	stp	x19, x20, [sp, #16]
    5a90:	aa0303f3 	mov	x19, x3
    5a94:	f100027f 	cmp	x19, #0x0
    5a98:	90000043 	adrp	x3, d000 <__malloc_av_+0x780>
    5a9c:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    5aa0:	aa0003f4 	mov	x20, x0
    5aa4:	f940d064 	ldr	x4, [x3, #416]
    5aa8:	aa1303e3 	mov	x3, x19
    5aac:	b4000121 	cbz	x1, 5ad0 <_wcrtomb_r+0x50>
    5ab0:	d63f0080 	blr	x4
    5ab4:	2a0003e1 	mov	w1, w0
    5ab8:	93407c20 	sxtw	x0, w1
    5abc:	3100043f 	cmn	w1, #0x1
    5ac0:	54000160 	b.eq	5aec <_wcrtomb_r+0x6c>  // b.none
    5ac4:	a94153f3 	ldp	x19, x20, [sp, #16]
    5ac8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5acc:	d65f03c0 	ret
    5ad0:	910083e1 	add	x1, sp, #0x20
    5ad4:	52800002 	mov	w2, #0x0                   	// #0
    5ad8:	d63f0080 	blr	x4
    5adc:	2a0003e1 	mov	w1, w0
    5ae0:	93407c20 	sxtw	x0, w1
    5ae4:	3100043f 	cmn	w1, #0x1
    5ae8:	54fffee1 	b.ne	5ac4 <_wcrtomb_r+0x44>  // b.any
    5aec:	b900027f 	str	wzr, [x19]
    5af0:	52801141 	mov	w1, #0x8a                  	// #138
    5af4:	b9000281 	str	w1, [x20]
    5af8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5afc:	a94153f3 	ldp	x19, x20, [sp, #16]
    5b00:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5b04:	d65f03c0 	ret
    5b08:	d503201f 	nop
    5b0c:	d503201f 	nop

0000000000005b10 <wcrtomb>:
    5b10:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5b14:	f0000024 	adrp	x4, c000 <IpcTestNull+0x6e8>
    5b18:	90000043 	adrp	x3, d000 <__malloc_av_+0x780>
    5b1c:	910003fd 	mov	x29, sp
    5b20:	a90153f3 	stp	x19, x20, [sp, #16]
    5b24:	f100005f 	cmp	x2, #0x0
    5b28:	f9409894 	ldr	x20, [x4, #304]
    5b2c:	91055284 	add	x4, x20, #0x154
    5b30:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    5b34:	f940d064 	ldr	x4, [x3, #416]
    5b38:	b40001a0 	cbz	x0, 5b6c <wcrtomb+0x5c>
    5b3c:	2a0103e2 	mov	w2, w1
    5b40:	aa0003e1 	mov	x1, x0
    5b44:	aa1303e3 	mov	x3, x19
    5b48:	aa1403e0 	mov	x0, x20
    5b4c:	d63f0080 	blr	x4
    5b50:	2a0003e1 	mov	w1, w0
    5b54:	93407c20 	sxtw	x0, w1
    5b58:	3100043f 	cmn	w1, #0x1
    5b5c:	540001a0 	b.eq	5b90 <wcrtomb+0x80>  // b.none
    5b60:	a94153f3 	ldp	x19, x20, [sp, #16]
    5b64:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5b68:	d65f03c0 	ret
    5b6c:	910083e1 	add	x1, sp, #0x20
    5b70:	aa1303e3 	mov	x3, x19
    5b74:	aa1403e0 	mov	x0, x20
    5b78:	52800002 	mov	w2, #0x0                   	// #0
    5b7c:	d63f0080 	blr	x4
    5b80:	2a0003e1 	mov	w1, w0
    5b84:	93407c20 	sxtw	x0, w1
    5b88:	3100043f 	cmn	w1, #0x1
    5b8c:	54fffea1 	b.ne	5b60 <wcrtomb+0x50>  // b.any
    5b90:	b900027f 	str	wzr, [x19]
    5b94:	52801141 	mov	w1, #0x8a                  	// #138
    5b98:	b9000281 	str	w1, [x20]
    5b9c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5ba0:	a94153f3 	ldp	x19, x20, [sp, #16]
    5ba4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5ba8:	d65f03c0 	ret
    5bac:	d503201f 	nop

0000000000005bb0 <_wcsrtombs_r>:
    5bb0:	aa0403e5 	mov	x5, x4
    5bb4:	aa0303e4 	mov	x4, x3
    5bb8:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5bbc:	140011a9 	b	a260 <_wcsnrtombs_r>

0000000000005bc0 <wcsrtombs>:
    5bc0:	f0000026 	adrp	x6, c000 <IpcTestNull+0x6e8>
    5bc4:	aa0003e4 	mov	x4, x0
    5bc8:	aa0103e5 	mov	x5, x1
    5bcc:	aa0403e1 	mov	x1, x4
    5bd0:	f94098c0 	ldr	x0, [x6, #304]
    5bd4:	aa0203e4 	mov	x4, x2
    5bd8:	aa0503e2 	mov	x2, x5
    5bdc:	aa0303e5 	mov	x5, x3
    5be0:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5be4:	1400119f 	b	a260 <_wcsnrtombs_r>
    5be8:	d503201f 	nop
    5bec:	d503201f 	nop

0000000000005bf0 <__swsetup_r>:
    5bf0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    5bf4:	f0000022 	adrp	x2, c000 <IpcTestNull+0x6e8>
    5bf8:	910003fd 	mov	x29, sp
    5bfc:	a90153f3 	stp	x19, x20, [sp, #16]
    5c00:	aa0003f4 	mov	x20, x0
    5c04:	aa0103f3 	mov	x19, x1
    5c08:	f9409840 	ldr	x0, [x2, #304]
    5c0c:	b4000060 	cbz	x0, 5c18 <__swsetup_r+0x28>
    5c10:	b9405001 	ldr	w1, [x0, #80]
    5c14:	340004e1 	cbz	w1, 5cb0 <__swsetup_r+0xc0>
    5c18:	79c02262 	ldrsh	w2, [x19, #16]
    5c1c:	12003c41 	and	w1, w2, #0xffff
    5c20:	36180502 	tbz	w2, #3, 5cc0 <__swsetup_r+0xd0>
    5c24:	f9400e63 	ldr	x3, [x19, #24]
    5c28:	b40002c3 	cbz	x3, 5c80 <__swsetup_r+0x90>
    5c2c:	36000141 	tbz	w1, #0, 5c54 <__swsetup_r+0x64>
    5c30:	b9402260 	ldr	w0, [x19, #32]
    5c34:	b9000e7f 	str	wzr, [x19, #12]
    5c38:	4b0003e0 	neg	w0, w0
    5c3c:	b9002a60 	str	w0, [x19, #40]
    5c40:	52800000 	mov	w0, #0x0                   	// #0
    5c44:	b4000143 	cbz	x3, 5c6c <__swsetup_r+0x7c>
    5c48:	a94153f3 	ldp	x19, x20, [sp, #16]
    5c4c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5c50:	d65f03c0 	ret
    5c54:	52800000 	mov	w0, #0x0                   	// #0
    5c58:	37080041 	tbnz	w1, #1, 5c60 <__swsetup_r+0x70>
    5c5c:	b9402260 	ldr	w0, [x19, #32]
    5c60:	b9000e60 	str	w0, [x19, #12]
    5c64:	52800000 	mov	w0, #0x0                   	// #0
    5c68:	b5ffff03 	cbnz	x3, 5c48 <__swsetup_r+0x58>
    5c6c:	363ffee1 	tbz	w1, #7, 5c48 <__swsetup_r+0x58>
    5c70:	321a0042 	orr	w2, w2, #0x40
    5c74:	12800000 	mov	w0, #0xffffffff            	// #-1
    5c78:	79002262 	strh	w2, [x19, #16]
    5c7c:	17fffff3 	b	5c48 <__swsetup_r+0x58>
    5c80:	52805000 	mov	w0, #0x280                 	// #640
    5c84:	0a000020 	and	w0, w1, w0
    5c88:	7108001f 	cmp	w0, #0x200
    5c8c:	54fffd00 	b.eq	5c2c <__swsetup_r+0x3c>  // b.none
    5c90:	aa1303e1 	mov	x1, x19
    5c94:	aa1403e0 	mov	x0, x20
    5c98:	9400085a 	bl	7e00 <__smakebuf_r>
    5c9c:	79c02262 	ldrsh	w2, [x19, #16]
    5ca0:	f9400e63 	ldr	x3, [x19, #24]
    5ca4:	12003c41 	and	w1, w2, #0xffff
    5ca8:	3607fd61 	tbz	w1, #0, 5c54 <__swsetup_r+0x64>
    5cac:	17ffffe1 	b	5c30 <__swsetup_r+0x40>
    5cb0:	940001e0 	bl	6430 <__sinit>
    5cb4:	79c02262 	ldrsh	w2, [x19, #16]
    5cb8:	12003c41 	and	w1, w2, #0xffff
    5cbc:	371ffb42 	tbnz	w2, #3, 5c24 <__swsetup_r+0x34>
    5cc0:	362002e1 	tbz	w1, #4, 5d1c <__swsetup_r+0x12c>
    5cc4:	371000e1 	tbnz	w1, #2, 5ce0 <__swsetup_r+0xf0>
    5cc8:	f9400e63 	ldr	x3, [x19, #24]
    5ccc:	321d0042 	orr	w2, w2, #0x8
    5cd0:	79002262 	strh	w2, [x19, #16]
    5cd4:	12003c41 	and	w1, w2, #0xffff
    5cd8:	b5fffaa3 	cbnz	x3, 5c2c <__swsetup_r+0x3c>
    5cdc:	17ffffe9 	b	5c80 <__swsetup_r+0x90>
    5ce0:	f9402e61 	ldr	x1, [x19, #88]
    5ce4:	b4000101 	cbz	x1, 5d04 <__swsetup_r+0x114>
    5ce8:	9101d260 	add	x0, x19, #0x74
    5cec:	eb00003f 	cmp	x1, x0
    5cf0:	54000080 	b.eq	5d00 <__swsetup_r+0x110>  // b.none
    5cf4:	aa1403e0 	mov	x0, x20
    5cf8:	940002a6 	bl	6790 <_free_r>
    5cfc:	79c02262 	ldrsh	w2, [x19, #16]
    5d00:	f9002e7f 	str	xzr, [x19, #88]
    5d04:	f9400e63 	ldr	x3, [x19, #24]
    5d08:	12800480 	mov	w0, #0xffffffdb            	// #-37
    5d0c:	0a000042 	and	w2, w2, w0
    5d10:	f9000263 	str	x3, [x19]
    5d14:	b9000a7f 	str	wzr, [x19, #8]
    5d18:	17ffffed 	b	5ccc <__swsetup_r+0xdc>
    5d1c:	52800120 	mov	w0, #0x9                   	// #9
    5d20:	b9000280 	str	w0, [x20]
    5d24:	321a0042 	orr	w2, w2, #0x40
    5d28:	12800000 	mov	w0, #0xffffffff            	// #-1
    5d2c:	79002262 	strh	w2, [x19, #16]
    5d30:	17ffffc6 	b	5c48 <__swsetup_r+0x58>
    5d34:	d503201f 	nop
    5d38:	d503201f 	nop
    5d3c:	d503201f 	nop

0000000000005d40 <abort>:
    5d40:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5d44:	528000c0 	mov	w0, #0x6                   	// #6
    5d48:	910003fd 	mov	x29, sp
    5d4c:	94000cfd 	bl	9140 <raise>
    5d50:	52800020 	mov	w0, #0x1                   	// #1
    5d54:	97fff3e3 	bl	2ce0 <_exit>
    5d58:	d503201f 	nop
    5d5c:	d503201f 	nop

0000000000005d60 <__register_exitproc>:
    5d60:	d0000024 	adrp	x4, b000 <pow10.0+0x80>
    5d64:	f9412484 	ldr	x4, [x4, #584]
    5d68:	f940fc85 	ldr	x5, [x4, #504]
    5d6c:	b4000405 	cbz	x5, 5dec <__register_exitproc+0x8c>
    5d70:	b94008a4 	ldr	w4, [x5, #8]
    5d74:	71007c9f 	cmp	w4, #0x1f
    5d78:	5400040c 	b.gt	5df8 <__register_exitproc+0x98>
    5d7c:	93407c86 	sxtw	x6, w4
    5d80:	350000e0 	cbnz	w0, 5d9c <__register_exitproc+0x3c>
    5d84:	910008c2 	add	x2, x6, #0x2
    5d88:	11000484 	add	w4, w4, #0x1
    5d8c:	b90008a4 	str	w4, [x5, #8]
    5d90:	52800000 	mov	w0, #0x0                   	// #0
    5d94:	f82278a1 	str	x1, [x5, x2, lsl #3]
    5d98:	d65f03c0 	ret
    5d9c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    5da0:	52800028 	mov	w8, #0x1                   	// #1
    5da4:	1ac42108 	lsl	w8, w8, w4
    5da8:	93407c86 	sxtw	x6, w4
    5dac:	f90088e2 	str	x2, [x7, #272]
    5db0:	b94310a2 	ldr	w2, [x5, #784]
    5db4:	2a080042 	orr	w2, w2, w8
    5db8:	b90310a2 	str	w2, [x5, #784]
    5dbc:	f90108e3 	str	x3, [x7, #528]
    5dc0:	7100081f 	cmp	w0, #0x2
    5dc4:	54fffe01 	b.ne	5d84 <__register_exitproc+0x24>  // b.any
    5dc8:	b94314a0 	ldr	w0, [x5, #788]
    5dcc:	910008c2 	add	x2, x6, #0x2
    5dd0:	11000484 	add	w4, w4, #0x1
    5dd4:	b90008a4 	str	w4, [x5, #8]
    5dd8:	2a080008 	orr	w8, w0, w8
    5ddc:	b90314a8 	str	w8, [x5, #788]
    5de0:	52800000 	mov	w0, #0x0                   	// #0
    5de4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    5de8:	17ffffec 	b	5d98 <__register_exitproc+0x38>
    5dec:	91080085 	add	x5, x4, #0x200
    5df0:	f900fc85 	str	x5, [x4, #504]
    5df4:	17ffffdf 	b	5d70 <__register_exitproc+0x10>
    5df8:	12800000 	mov	w0, #0xffffffff            	// #-1
    5dfc:	d65f03c0 	ret

0000000000005e00 <__sflush_r>:
    5e00:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5e04:	910003fd 	mov	x29, sp
    5e08:	a9025bf5 	stp	x21, x22, [sp, #32]
    5e0c:	aa0003f6 	mov	x22, x0
    5e10:	79c02020 	ldrsh	w0, [x1, #16]
    5e14:	a90153f3 	stp	x19, x20, [sp, #16]
    5e18:	aa0103f3 	mov	x19, x1
    5e1c:	37180560 	tbnz	w0, #3, 5ec8 <__sflush_r+0xc8>
    5e20:	32150000 	orr	w0, w0, #0x800
    5e24:	79002020 	strh	w0, [x1, #16]
    5e28:	b9400821 	ldr	w1, [x1, #8]
    5e2c:	7100003f 	cmp	w1, #0x0
    5e30:	5400092d 	b.le	5f54 <__sflush_r+0x154>
    5e34:	f9402664 	ldr	x4, [x19, #72]
    5e38:	b4000944 	cbz	x4, 5f60 <__sflush_r+0x160>
    5e3c:	b94002d4 	ldr	w20, [x22]
    5e40:	12003c01 	and	w1, w0, #0xffff
    5e44:	b90002df 	str	wzr, [x22]
    5e48:	37600960 	tbnz	w0, #12, 5f74 <__sflush_r+0x174>
    5e4c:	f9401a61 	ldr	x1, [x19, #48]
    5e50:	d2800002 	mov	x2, #0x0                   	// #0
    5e54:	aa1603e0 	mov	x0, x22
    5e58:	52800023 	mov	w3, #0x1                   	// #1
    5e5c:	d63f0080 	blr	x4
    5e60:	aa0003e2 	mov	x2, x0
    5e64:	b100041f 	cmn	x0, #0x1
    5e68:	54000d00 	b.eq	6008 <__sflush_r+0x208>  // b.none
    5e6c:	79402261 	ldrh	w1, [x19, #16]
    5e70:	f9402664 	ldr	x4, [x19, #72]
    5e74:	361000e1 	tbz	w1, #2, 5e90 <__sflush_r+0x90>
    5e78:	f9402e60 	ldr	x0, [x19, #88]
    5e7c:	b9800a61 	ldrsw	x1, [x19, #8]
    5e80:	cb010042 	sub	x2, x2, x1
    5e84:	b4000060 	cbz	x0, 5e90 <__sflush_r+0x90>
    5e88:	b9807260 	ldrsw	x0, [x19, #112]
    5e8c:	cb000042 	sub	x2, x2, x0
    5e90:	f9401a61 	ldr	x1, [x19, #48]
    5e94:	aa1603e0 	mov	x0, x22
    5e98:	52800003 	mov	w3, #0x0                   	// #0
    5e9c:	d63f0080 	blr	x4
    5ea0:	b100041f 	cmn	x0, #0x1
    5ea4:	540006c1 	b.ne	5f7c <__sflush_r+0x17c>  // b.any
    5ea8:	b94002c2 	ldr	w2, [x22]
    5eac:	7100745f 	cmp	w2, #0x1d
    5eb0:	54000929 	b.ls	5fd4 <__sflush_r+0x1d4>  // b.plast
    5eb4:	79c02261 	ldrsh	w1, [x19, #16]
    5eb8:	321a0021 	orr	w1, w1, #0x40
    5ebc:	12800000 	mov	w0, #0xffffffff            	// #-1
    5ec0:	79002261 	strh	w1, [x19, #16]
    5ec4:	14000028 	b	5f64 <__sflush_r+0x164>
    5ec8:	f9400c35 	ldr	x21, [x1, #24]
    5ecc:	b40004b5 	cbz	x21, 5f60 <__sflush_r+0x160>
    5ed0:	12003c01 	and	w1, w0, #0xffff
    5ed4:	52800002 	mov	w2, #0x0                   	// #0
    5ed8:	f9400260 	ldr	x0, [x19]
    5edc:	f9000275 	str	x21, [x19]
    5ee0:	cb150000 	sub	x0, x0, x21
    5ee4:	2a0003f4 	mov	w20, w0
    5ee8:	f240043f 	tst	x1, #0x3
    5eec:	54000041 	b.ne	5ef4 <__sflush_r+0xf4>  // b.any
    5ef0:	b9402262 	ldr	w2, [x19, #32]
    5ef4:	b9000e62 	str	w2, [x19, #12]
    5ef8:	7100001f 	cmp	w0, #0x0
    5efc:	540000ac 	b.gt	5f10 <__sflush_r+0x110>
    5f00:	14000018 	b	5f60 <__sflush_r+0x160>
    5f04:	8b20c2b5 	add	x21, x21, w0, sxtw
    5f08:	7100029f 	cmp	w20, #0x0
    5f0c:	540002ad 	b.le	5f60 <__sflush_r+0x160>
    5f10:	f9401a61 	ldr	x1, [x19, #48]
    5f14:	2a1403e3 	mov	w3, w20
    5f18:	f9402264 	ldr	x4, [x19, #64]
    5f1c:	aa1503e2 	mov	x2, x21
    5f20:	aa1603e0 	mov	x0, x22
    5f24:	d63f0080 	blr	x4
    5f28:	4b000294 	sub	w20, w20, w0
    5f2c:	7100001f 	cmp	w0, #0x0
    5f30:	54fffeac 	b.gt	5f04 <__sflush_r+0x104>
    5f34:	79402261 	ldrh	w1, [x19, #16]
    5f38:	12800000 	mov	w0, #0xffffffff            	// #-1
    5f3c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5f40:	321a0021 	orr	w1, w1, #0x40
    5f44:	79002261 	strh	w1, [x19, #16]
    5f48:	a94153f3 	ldp	x19, x20, [sp, #16]
    5f4c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5f50:	d65f03c0 	ret
    5f54:	b9407261 	ldr	w1, [x19, #112]
    5f58:	7100003f 	cmp	w1, #0x0
    5f5c:	54fff6cc 	b.gt	5e34 <__sflush_r+0x34>
    5f60:	52800000 	mov	w0, #0x0                   	// #0
    5f64:	a94153f3 	ldp	x19, x20, [sp, #16]
    5f68:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5f6c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5f70:	d65f03c0 	ret
    5f74:	f9404a62 	ldr	x2, [x19, #144]
    5f78:	17ffffbf 	b	5e74 <__sflush_r+0x74>
    5f7c:	79c02261 	ldrsh	w1, [x19, #16]
    5f80:	f9400e62 	ldr	x2, [x19, #24]
    5f84:	12147821 	and	w1, w1, #0xfffff7ff
    5f88:	f9000262 	str	x2, [x19]
    5f8c:	b9000a7f 	str	wzr, [x19, #8]
    5f90:	79002261 	strh	w1, [x19, #16]
    5f94:	36600041 	tbz	w1, #12, 5f9c <__sflush_r+0x19c>
    5f98:	f9004a60 	str	x0, [x19, #144]
    5f9c:	f9402e61 	ldr	x1, [x19, #88]
    5fa0:	b90002d4 	str	w20, [x22]
    5fa4:	b4fffde1 	cbz	x1, 5f60 <__sflush_r+0x160>
    5fa8:	9101d260 	add	x0, x19, #0x74
    5fac:	eb00003f 	cmp	x1, x0
    5fb0:	54000060 	b.eq	5fbc <__sflush_r+0x1bc>  // b.none
    5fb4:	aa1603e0 	mov	x0, x22
    5fb8:	940001f6 	bl	6790 <_free_r>
    5fbc:	f9002e7f 	str	xzr, [x19, #88]
    5fc0:	52800000 	mov	w0, #0x0                   	// #0
    5fc4:	a94153f3 	ldp	x19, x20, [sp, #16]
    5fc8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    5fcc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5fd0:	d65f03c0 	ret
    5fd4:	d2800023 	mov	x3, #0x1                   	// #1
    5fd8:	79c02261 	ldrsh	w1, [x19, #16]
    5fdc:	f2a40803 	movk	x3, #0x2040, lsl #16
    5fe0:	9ac22463 	lsr	x3, x3, x2
    5fe4:	3607f6a3 	tbz	w3, #0, 5eb8 <__sflush_r+0xb8>
    5fe8:	f9400e63 	ldr	x3, [x19, #24]
    5fec:	12147821 	and	w1, w1, #0xfffff7ff
    5ff0:	f9000263 	str	x3, [x19]
    5ff4:	b9000a7f 	str	wzr, [x19, #8]
    5ff8:	79002261 	strh	w1, [x19, #16]
    5ffc:	3667fd01 	tbz	w1, #12, 5f9c <__sflush_r+0x19c>
    6000:	35fffce2 	cbnz	w2, 5f9c <__sflush_r+0x19c>
    6004:	17ffffe5 	b	5f98 <__sflush_r+0x198>
    6008:	b94002c0 	ldr	w0, [x22]
    600c:	34fff300 	cbz	w0, 5e6c <__sflush_r+0x6c>
    6010:	7100741f 	cmp	w0, #0x1d
    6014:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    6018:	54fff8e1 	b.ne	5f34 <__sflush_r+0x134>  // b.any
    601c:	52800000 	mov	w0, #0x0                   	// #0
    6020:	b90002d4 	str	w20, [x22]
    6024:	17ffffd0 	b	5f64 <__sflush_r+0x164>
    6028:	d503201f 	nop
    602c:	d503201f 	nop

0000000000006030 <_fflush_r>:
    6030:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6034:	910003fd 	mov	x29, sp
    6038:	f9000bf3 	str	x19, [sp, #16]
    603c:	aa0003f3 	mov	x19, x0
    6040:	b4000060 	cbz	x0, 604c <_fflush_r+0x1c>
    6044:	b9405002 	ldr	w2, [x0, #80]
    6048:	340000e2 	cbz	w2, 6064 <_fflush_r+0x34>
    604c:	79c02020 	ldrsh	w0, [x1, #16]
    6050:	35000140 	cbnz	w0, 6078 <_fflush_r+0x48>
    6054:	52800000 	mov	w0, #0x0                   	// #0
    6058:	f9400bf3 	ldr	x19, [sp, #16]
    605c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6060:	d65f03c0 	ret
    6064:	f90017e1 	str	x1, [sp, #40]
    6068:	940000f2 	bl	6430 <__sinit>
    606c:	f94017e1 	ldr	x1, [sp, #40]
    6070:	79c02020 	ldrsh	w0, [x1, #16]
    6074:	34ffff00 	cbz	w0, 6054 <_fflush_r+0x24>
    6078:	aa1303e0 	mov	x0, x19
    607c:	f9400bf3 	ldr	x19, [sp, #16]
    6080:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6084:	17ffff5f 	b	5e00 <__sflush_r>
    6088:	d503201f 	nop
    608c:	d503201f 	nop

0000000000006090 <fflush>:
    6090:	b4000340 	cbz	x0, 60f8 <fflush+0x68>
    6094:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6098:	910003fd 	mov	x29, sp
    609c:	a90153f3 	stp	x19, x20, [sp, #16]
    60a0:	aa0003f3 	mov	x19, x0
    60a4:	d0000020 	adrp	x0, c000 <IpcTestNull+0x6e8>
    60a8:	f9409814 	ldr	x20, [x0, #304]
    60ac:	b4000074 	cbz	x20, 60b8 <fflush+0x28>
    60b0:	b9405280 	ldr	w0, [x20, #80]
    60b4:	34000180 	cbz	w0, 60e4 <fflush+0x54>
    60b8:	79c02260 	ldrsh	w0, [x19, #16]
    60bc:	350000a0 	cbnz	w0, 60d0 <fflush+0x40>
    60c0:	52800000 	mov	w0, #0x0                   	// #0
    60c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    60c8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    60cc:	d65f03c0 	ret
    60d0:	aa1303e1 	mov	x1, x19
    60d4:	aa1403e0 	mov	x0, x20
    60d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    60dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    60e0:	17ffff48 	b	5e00 <__sflush_r>
    60e4:	aa1403e0 	mov	x0, x20
    60e8:	940000d2 	bl	6430 <__sinit>
    60ec:	79c02260 	ldrsh	w0, [x19, #16]
    60f0:	34fffe80 	cbz	w0, 60c0 <fflush+0x30>
    60f4:	17fffff7 	b	60d0 <fflush+0x40>
    60f8:	b0000020 	adrp	x0, b000 <pow10.0+0x80>
    60fc:	90000001 	adrp	x1, 6000 <__sflush_r+0x200>
    6100:	9100c021 	add	x1, x1, #0x30
    6104:	f9412400 	ldr	x0, [x0, #584]
    6108:	140003b2 	b	6fd0 <_fwalk_reent>
    610c:	d503201f 	nop

0000000000006110 <__fp_lock>:
    6110:	52800000 	mov	w0, #0x0                   	// #0
    6114:	d65f03c0 	ret
    6118:	d503201f 	nop
    611c:	d503201f 	nop

0000000000006120 <_cleanup_r>:
    6120:	90000021 	adrp	x1, a000 <__swbuf_r+0xb0>
    6124:	911e0021 	add	x1, x1, #0x780
    6128:	140003aa 	b	6fd0 <_fwalk_reent>
    612c:	d503201f 	nop

0000000000006130 <__fp_unlock>:
    6130:	52800000 	mov	w0, #0x0                   	// #0
    6134:	d65f03c0 	ret
    6138:	d503201f 	nop
    613c:	d503201f 	nop

0000000000006140 <__sinit.part.0>:
    6140:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6144:	52800065 	mov	w5, #0x3                   	// #3
    6148:	90000001 	adrp	x1, 6000 <__sflush_r+0x200>
    614c:	910003fd 	mov	x29, sp
    6150:	a9025bf5 	stp	x21, x22, [sp, #32]
    6154:	aa0003f5 	mov	x21, x0
    6158:	9114e2a4 	add	x4, x21, #0x538
    615c:	a90153f3 	stp	x19, x20, [sp, #16]
    6160:	91048020 	add	x0, x1, #0x120
    6164:	52800083 	mov	w3, #0x4                   	// #4
    6168:	f94006b3 	ldr	x19, [x21, #8]
    616c:	a90363f7 	stp	x23, x24, [sp, #48]
    6170:	d2800102 	mov	x2, #0x8                   	// #8
    6174:	f90023f9 	str	x25, [sp, #64]
    6178:	52800001 	mov	w1, #0x0                   	// #0
    617c:	f9002ea0 	str	x0, [x21, #88]
    6180:	91029260 	add	x0, x19, #0xa4
    6184:	f90292bf 	str	xzr, [x21, #1312]
    6188:	f0000018 	adrp	x24, 9000 <_raise_r+0x40>
    618c:	b9052aa5 	str	w5, [x21, #1320]
    6190:	91120318 	add	x24, x24, #0x480
    6194:	f9029aa4 	str	x4, [x21, #1328]
    6198:	f0000017 	adrp	x23, 9000 <_raise_r+0x40>
    619c:	a9007e7f 	stp	xzr, xzr, [x19]
    61a0:	9113c2f7 	add	x23, x23, #0x4f0
    61a4:	f0000016 	adrp	x22, 9000 <_raise_r+0x40>
    61a8:	b9001263 	str	w3, [x19, #16]
    61ac:	911502d6 	add	x22, x22, #0x540
    61b0:	f9000e7f 	str	xzr, [x19, #24]
    61b4:	f0000019 	adrp	x25, 9000 <_raise_r+0x40>
    61b8:	b900227f 	str	wzr, [x19, #32]
    61bc:	91108339 	add	x25, x25, #0x420
    61c0:	b9002a7f 	str	wzr, [x19, #40]
    61c4:	b900ae7f 	str	wzr, [x19, #172]
    61c8:	97fff63e 	bl	3ac0 <memset>
    61cc:	f9400ab4 	ldr	x20, [x21, #16]
    61d0:	52800123 	mov	w3, #0x9                   	// #9
    61d4:	a9036673 	stp	x19, x25, [x19, #48]
    61d8:	72a00023 	movk	w3, #0x1, lsl #16
    61dc:	91029280 	add	x0, x20, #0xa4
    61e0:	a9045e78 	stp	x24, x23, [x19, #64]
    61e4:	d2800102 	mov	x2, #0x8                   	// #8
    61e8:	52800001 	mov	w1, #0x0                   	// #0
    61ec:	f9002a76 	str	x22, [x19, #80]
    61f0:	a9007e9f 	stp	xzr, xzr, [x20]
    61f4:	b9001283 	str	w3, [x20, #16]
    61f8:	f9000e9f 	str	xzr, [x20, #24]
    61fc:	b900229f 	str	wzr, [x20, #32]
    6200:	b9002a9f 	str	wzr, [x20, #40]
    6204:	b900ae9f 	str	wzr, [x20, #172]
    6208:	97fff62e 	bl	3ac0 <memset>
    620c:	f9400eb3 	ldr	x19, [x21, #24]
    6210:	52800243 	mov	w3, #0x12                  	// #18
    6214:	a9036694 	stp	x20, x25, [x20, #48]
    6218:	72a00043 	movk	w3, #0x2, lsl #16
    621c:	91029260 	add	x0, x19, #0xa4
    6220:	a9045e98 	stp	x24, x23, [x20, #64]
    6224:	d2800102 	mov	x2, #0x8                   	// #8
    6228:	52800001 	mov	w1, #0x0                   	// #0
    622c:	f9002a96 	str	x22, [x20, #80]
    6230:	a9007e7f 	stp	xzr, xzr, [x19]
    6234:	b9001263 	str	w3, [x19, #16]
    6238:	f9000e7f 	str	xzr, [x19, #24]
    623c:	b900227f 	str	wzr, [x19, #32]
    6240:	b9002a7f 	str	wzr, [x19, #40]
    6244:	b900ae7f 	str	wzr, [x19, #172]
    6248:	97fff61e 	bl	3ac0 <memset>
    624c:	a9036673 	stp	x19, x25, [x19, #48]
    6250:	52800020 	mov	w0, #0x1                   	// #1
    6254:	a9045e78 	stp	x24, x23, [x19, #64]
    6258:	f9002a76 	str	x22, [x19, #80]
    625c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6260:	a94363f7 	ldp	x23, x24, [sp, #48]
    6264:	f94023f9 	ldr	x25, [sp, #64]
    6268:	b90052a0 	str	w0, [x21, #80]
    626c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6270:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6274:	d65f03c0 	ret
    6278:	d503201f 	nop
    627c:	d503201f 	nop

0000000000006280 <__sfmoreglue>:
    6280:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6284:	52801602 	mov	w2, #0xb0                  	// #176
    6288:	910003fd 	mov	x29, sp
    628c:	a90153f3 	stp	x19, x20, [sp, #16]
    6290:	51000434 	sub	w20, w1, #0x1
    6294:	f90013f5 	str	x21, [sp, #32]
    6298:	2a0103f5 	mov	w21, w1
    629c:	9b227e94 	smull	x20, w20, w2
    62a0:	91032281 	add	x1, x20, #0xc8
    62a4:	97fff367 	bl	3040 <_malloc_r>
    62a8:	aa0003f3 	mov	x19, x0
    62ac:	b4000100 	cbz	x0, 62cc <__sfmoreglue+0x4c>
    62b0:	91006000 	add	x0, x0, #0x18
    62b4:	f900027f 	str	xzr, [x19]
    62b8:	b9000a75 	str	w21, [x19, #8]
    62bc:	9102c282 	add	x2, x20, #0xb0
    62c0:	f9000a60 	str	x0, [x19, #16]
    62c4:	52800001 	mov	w1, #0x0                   	// #0
    62c8:	97fff5fe 	bl	3ac0 <memset>
    62cc:	aa1303e0 	mov	x0, x19
    62d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    62d4:	f94013f5 	ldr	x21, [sp, #32]
    62d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    62dc:	d65f03c0 	ret

00000000000062e0 <__sfp>:
    62e0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    62e4:	b0000021 	adrp	x1, b000 <pow10.0+0x80>
    62e8:	910003fd 	mov	x29, sp
    62ec:	a90153f3 	stp	x19, x20, [sp, #16]
    62f0:	f9412434 	ldr	x20, [x1, #584]
    62f4:	f9001fe0 	str	x0, [sp, #56]
    62f8:	f90013f5 	str	x21, [sp, #32]
    62fc:	b9405280 	ldr	w0, [x20, #80]
    6300:	34000560 	cbz	w0, 63ac <__sfp+0xcc>
    6304:	91148294 	add	x20, x20, #0x520
    6308:	52800095 	mov	w21, #0x4                   	// #4
    630c:	b9400a80 	ldr	w0, [x20, #8]
    6310:	f9400a93 	ldr	x19, [x20, #16]
    6314:	7100001f 	cmp	w0, #0x0
    6318:	5400042d 	b.le	639c <__sfp+0xbc>
    631c:	51000400 	sub	w0, w0, #0x1
    6320:	91000400 	add	x0, x0, #0x1
    6324:	8b000401 	add	x1, x0, x0, lsl #1
    6328:	d37ef421 	lsl	x1, x1, #2
    632c:	cb000021 	sub	x1, x1, x0
    6330:	8b011261 	add	x1, x19, x1, lsl #4
    6334:	14000004 	b	6344 <__sfp+0x64>
    6338:	9102c273 	add	x19, x19, #0xb0
    633c:	eb01027f 	cmp	x19, x1
    6340:	540002e0 	b.eq	639c <__sfp+0xbc>  // b.none
    6344:	79c02260 	ldrsh	w0, [x19, #16]
    6348:	35ffff80 	cbnz	w0, 6338 <__sfp+0x58>
    634c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    6350:	a9007e7f 	stp	xzr, xzr, [x19]
    6354:	d2800102 	mov	x2, #0x8                   	// #8
    6358:	b9001260 	str	w0, [x19, #16]
    635c:	52800001 	mov	w1, #0x0                   	// #0
    6360:	f9000e7f 	str	xzr, [x19, #24]
    6364:	91029260 	add	x0, x19, #0xa4
    6368:	b900227f 	str	wzr, [x19, #32]
    636c:	b9002a7f 	str	wzr, [x19, #40]
    6370:	b900ae7f 	str	wzr, [x19, #172]
    6374:	97fff5d3 	bl	3ac0 <memset>
    6378:	f9002e7f 	str	xzr, [x19, #88]
    637c:	b900627f 	str	wzr, [x19, #96]
    6380:	f9003e7f 	str	xzr, [x19, #120]
    6384:	b900827f 	str	wzr, [x19, #128]
    6388:	aa1303e0 	mov	x0, x19
    638c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6390:	f94013f5 	ldr	x21, [sp, #32]
    6394:	a8c47bfd 	ldp	x29, x30, [sp], #64
    6398:	d65f03c0 	ret
    639c:	f9400293 	ldr	x19, [x20]
    63a0:	b40000d3 	cbz	x19, 63b8 <__sfp+0xd8>
    63a4:	aa1303f4 	mov	x20, x19
    63a8:	17ffffd9 	b	630c <__sfp+0x2c>
    63ac:	aa1403e0 	mov	x0, x20
    63b0:	97ffff64 	bl	6140 <__sinit.part.0>
    63b4:	17ffffd4 	b	6304 <__sfp+0x24>
    63b8:	f9401fe0 	ldr	x0, [sp, #56]
    63bc:	d2805b01 	mov	x1, #0x2d8                 	// #728
    63c0:	97fff320 	bl	3040 <_malloc_r>
    63c4:	aa0003f3 	mov	x19, x0
    63c8:	b4000160 	cbz	x0, 63f4 <__sfp+0x114>
    63cc:	91006000 	add	x0, x0, #0x18
    63d0:	f900027f 	str	xzr, [x19]
    63d4:	b9000a75 	str	w21, [x19, #8]
    63d8:	d2805802 	mov	x2, #0x2c0                 	// #704
    63dc:	f9000a60 	str	x0, [x19, #16]
    63e0:	52800001 	mov	w1, #0x0                   	// #0
    63e4:	97fff5b7 	bl	3ac0 <memset>
    63e8:	f9000293 	str	x19, [x20]
    63ec:	aa1303f4 	mov	x20, x19
    63f0:	17ffffc7 	b	630c <__sfp+0x2c>
    63f4:	f9401fe1 	ldr	x1, [sp, #56]
    63f8:	f900029f 	str	xzr, [x20]
    63fc:	52800180 	mov	w0, #0xc                   	// #12
    6400:	b9000020 	str	w0, [x1]
    6404:	17ffffe1 	b	6388 <__sfp+0xa8>
    6408:	d503201f 	nop
    640c:	d503201f 	nop

0000000000006410 <_cleanup>:
    6410:	b0000020 	adrp	x0, b000 <pow10.0+0x80>
    6414:	90000021 	adrp	x1, a000 <__swbuf_r+0xb0>
    6418:	911e0021 	add	x1, x1, #0x780
    641c:	f9412400 	ldr	x0, [x0, #584]
    6420:	140002ec 	b	6fd0 <_fwalk_reent>
    6424:	d503201f 	nop
    6428:	d503201f 	nop
    642c:	d503201f 	nop

0000000000006430 <__sinit>:
    6430:	b9405001 	ldr	w1, [x0, #80]
    6434:	34000041 	cbz	w1, 643c <__sinit+0xc>
    6438:	d65f03c0 	ret
    643c:	17ffff41 	b	6140 <__sinit.part.0>

0000000000006440 <__sfp_lock_acquire>:
    6440:	d65f03c0 	ret
    6444:	d503201f 	nop
    6448:	d503201f 	nop
    644c:	d503201f 	nop

0000000000006450 <__sfp_lock_release>:
    6450:	d65f03c0 	ret
    6454:	d503201f 	nop
    6458:	d503201f 	nop
    645c:	d503201f 	nop

0000000000006460 <__sinit_lock_acquire>:
    6460:	d65f03c0 	ret
    6464:	d503201f 	nop
    6468:	d503201f 	nop
    646c:	d503201f 	nop

0000000000006470 <__sinit_lock_release>:
    6470:	d65f03c0 	ret
    6474:	d503201f 	nop
    6478:	d503201f 	nop
    647c:	d503201f 	nop

0000000000006480 <__fp_lock_all>:
    6480:	d0000020 	adrp	x0, c000 <IpcTestNull+0x6e8>
    6484:	90000001 	adrp	x1, 6000 <__sflush_r+0x200>
    6488:	91044021 	add	x1, x1, #0x110
    648c:	f9409800 	ldr	x0, [x0, #304]
    6490:	140002a8 	b	6f30 <_fwalk>
    6494:	d503201f 	nop
    6498:	d503201f 	nop
    649c:	d503201f 	nop

00000000000064a0 <__fp_unlock_all>:
    64a0:	d0000020 	adrp	x0, c000 <IpcTestNull+0x6e8>
    64a4:	90000001 	adrp	x1, 6000 <__sflush_r+0x200>
    64a8:	9104c021 	add	x1, x1, #0x130
    64ac:	f9409800 	ldr	x0, [x0, #304]
    64b0:	140002a0 	b	6f30 <_fwalk>
    64b4:	d503201f 	nop
    64b8:	d503201f 	nop
    64bc:	d503201f 	nop

00000000000064c0 <__fputwc>:
    64c0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    64c4:	910003fd 	mov	x29, sp
    64c8:	a90153f3 	stp	x19, x20, [sp, #16]
    64cc:	aa0203f3 	mov	x19, x2
    64d0:	a9025bf5 	stp	x21, x22, [sp, #32]
    64d4:	2a0103f6 	mov	w22, w1
    64d8:	a90363f7 	stp	x23, x24, [sp, #48]
    64dc:	aa0003f7 	mov	x23, x0
    64e0:	9400062c 	bl	7d90 <__locale_mb_cur_max>
    64e4:	7100041f 	cmp	w0, #0x1
    64e8:	54000081 	b.ne	64f8 <__fputwc+0x38>  // b.any
    64ec:	510006c0 	sub	w0, w22, #0x1
    64f0:	7103f81f 	cmp	w0, #0xfe
    64f4:	54000509 	b.ls	6594 <__fputwc+0xd4>  // b.plast
    64f8:	91029263 	add	x3, x19, #0xa4
    64fc:	2a1603e2 	mov	w2, w22
    6500:	910123e1 	add	x1, sp, #0x48
    6504:	aa1703e0 	mov	x0, x23
    6508:	97fffd5e 	bl	5a80 <_wcrtomb_r>
    650c:	aa0003f5 	mov	x21, x0
    6510:	b100041f 	cmn	x0, #0x1
    6514:	54000540 	b.eq	65bc <__fputwc+0xfc>  // b.none
    6518:	b4000460 	cbz	x0, 65a4 <__fputwc+0xe4>
    651c:	394123e1 	ldrb	w1, [sp, #72]
    6520:	910123f8 	add	x24, sp, #0x48
    6524:	d2800014 	mov	x20, #0x0                   	// #0
    6528:	14000009 	b	654c <__fputwc+0x8c>
    652c:	f9400263 	ldr	x3, [x19]
    6530:	91000464 	add	x4, x3, #0x1
    6534:	f9000264 	str	x4, [x19]
    6538:	39000061 	strb	w1, [x3]
    653c:	91000694 	add	x20, x20, #0x1
    6540:	eb15029f 	cmp	x20, x21
    6544:	54000302 	b.cs	65a4 <__fputwc+0xe4>  // b.hs, b.nlast
    6548:	38786a81 	ldrb	w1, [x20, x24]
    654c:	b9400e63 	ldr	w3, [x19, #12]
    6550:	51000463 	sub	w3, w3, #0x1
    6554:	b9000e63 	str	w3, [x19, #12]
    6558:	36fffea3 	tbz	w3, #31, 652c <__fputwc+0x6c>
    655c:	b9402a64 	ldr	w4, [x19, #40]
    6560:	aa1303e2 	mov	x2, x19
    6564:	aa1703e0 	mov	x0, x23
    6568:	6b04007f 	cmp	w3, w4
    656c:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    6570:	54fffde1 	b.ne	652c <__fputwc+0x6c>  // b.any
    6574:	94000e77 	bl	9f50 <__swbuf_r>
    6578:	3100041f 	cmn	w0, #0x1
    657c:	54fffe01 	b.ne	653c <__fputwc+0x7c>  // b.any
    6580:	a94153f3 	ldp	x19, x20, [sp, #16]
    6584:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6588:	a94363f7 	ldp	x23, x24, [sp, #48]
    658c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6590:	d65f03c0 	ret
    6594:	12001ec1 	and	w1, w22, #0xff
    6598:	d2800035 	mov	x21, #0x1                   	// #1
    659c:	390123e1 	strb	w1, [sp, #72]
    65a0:	17ffffe0 	b	6520 <__fputwc+0x60>
    65a4:	2a1603e0 	mov	w0, w22
    65a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    65ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    65b0:	a94363f7 	ldp	x23, x24, [sp, #48]
    65b4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    65b8:	d65f03c0 	ret
    65bc:	79402261 	ldrh	w1, [x19, #16]
    65c0:	321a0021 	orr	w1, w1, #0x40
    65c4:	79002261 	strh	w1, [x19, #16]
    65c8:	17ffffee 	b	6580 <__fputwc+0xc0>
    65cc:	d503201f 	nop

00000000000065d0 <_fputwc_r>:
    65d0:	79c02043 	ldrsh	w3, [x2, #16]
    65d4:	376800c3 	tbnz	w3, #13, 65ec <_fputwc_r+0x1c>
    65d8:	b940ac44 	ldr	w4, [x2, #172]
    65dc:	32130063 	orr	w3, w3, #0x2000
    65e0:	79002043 	strh	w3, [x2, #16]
    65e4:	32130083 	orr	w3, w4, #0x2000
    65e8:	b900ac43 	str	w3, [x2, #172]
    65ec:	17ffffb5 	b	64c0 <__fputwc>

00000000000065f0 <fputwc>:
    65f0:	d0000023 	adrp	x3, c000 <IpcTestNull+0x6e8>
    65f4:	aa0103e2 	mov	x2, x1
    65f8:	2a0003e1 	mov	w1, w0
    65fc:	f9409860 	ldr	x0, [x3, #304]
    6600:	b4000060 	cbz	x0, 660c <fputwc+0x1c>
    6604:	b9405003 	ldr	w3, [x0, #80]
    6608:	34000123 	cbz	w3, 662c <fputwc+0x3c>
    660c:	79c02043 	ldrsh	w3, [x2, #16]
    6610:	376800c3 	tbnz	w3, #13, 6628 <fputwc+0x38>
    6614:	b940ac44 	ldr	w4, [x2, #172]
    6618:	32130063 	orr	w3, w3, #0x2000
    661c:	79002043 	strh	w3, [x2, #16]
    6620:	32130083 	orr	w3, w4, #0x2000
    6624:	b900ac43 	str	w3, [x2, #172]
    6628:	17ffffa6 	b	64c0 <__fputwc>
    662c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6630:	910003fd 	mov	x29, sp
    6634:	f9000fe0 	str	x0, [sp, #24]
    6638:	b90027e1 	str	w1, [sp, #36]
    663c:	f90017e2 	str	x2, [sp, #40]
    6640:	97ffff7c 	bl	6430 <__sinit>
    6644:	f94017e2 	ldr	x2, [sp, #40]
    6648:	b94027e1 	ldr	w1, [sp, #36]
    664c:	f9400fe0 	ldr	x0, [sp, #24]
    6650:	79c02043 	ldrsh	w3, [x2, #16]
    6654:	376800c3 	tbnz	w3, #13, 666c <fputwc+0x7c>
    6658:	b940ac44 	ldr	w4, [x2, #172]
    665c:	32130063 	orr	w3, w3, #0x2000
    6660:	79002043 	strh	w3, [x2, #16]
    6664:	32130083 	orr	w3, w4, #0x2000
    6668:	b900ac43 	str	w3, [x2, #172]
    666c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6670:	17ffff94 	b	64c0 <__fputwc>
    6674:	d503201f 	nop
    6678:	d503201f 	nop
    667c:	d503201f 	nop

0000000000006680 <_malloc_trim_r>:
    6680:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6684:	910003fd 	mov	x29, sp
    6688:	a9025bf5 	stp	x21, x22, [sp, #32]
    668c:	d0000036 	adrp	x22, c000 <IpcTestNull+0x6e8>
    6690:	912202d6 	add	x22, x22, #0x880
    6694:	aa0003f5 	mov	x21, x0
    6698:	a90153f3 	stp	x19, x20, [sp, #16]
    669c:	aa0103f3 	mov	x19, x1
    66a0:	97fff580 	bl	3ca0 <__malloc_lock>
    66a4:	f9400ac0 	ldr	x0, [x22, #16]
    66a8:	f9400414 	ldr	x20, [x0, #8]
    66ac:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    66b0:	cb130293 	sub	x19, x20, x19
    66b4:	913f7e73 	add	x19, x19, #0xfdf
    66b8:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    66bc:	d1400673 	sub	x19, x19, #0x1, lsl #12
    66c0:	f13ffe7f 	cmp	x19, #0xfff
    66c4:	5400010d 	b.le	66e4 <_malloc_trim_r+0x64>
    66c8:	d2800001 	mov	x1, #0x0                   	// #0
    66cc:	aa1503e0 	mov	x0, x21
    66d0:	97fff57c 	bl	3cc0 <_sbrk_r>
    66d4:	f9400ac1 	ldr	x1, [x22, #16]
    66d8:	8b140021 	add	x1, x1, x20
    66dc:	eb01001f 	cmp	x0, x1
    66e0:	54000100 	b.eq	6700 <_malloc_trim_r+0x80>  // b.none
    66e4:	aa1503e0 	mov	x0, x21
    66e8:	97fff572 	bl	3cb0 <__malloc_unlock>
    66ec:	52800000 	mov	w0, #0x0                   	// #0
    66f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    66f4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    66f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    66fc:	d65f03c0 	ret
    6700:	cb1303e1 	neg	x1, x19
    6704:	aa1503e0 	mov	x0, x21
    6708:	97fff56e 	bl	3cc0 <_sbrk_r>
    670c:	b100041f 	cmn	x0, #0x1
    6710:	54000200 	b.eq	6750 <_malloc_trim_r+0xd0>  // b.none
    6714:	f0000022 	adrp	x2, d000 <__malloc_av_+0x780>
    6718:	cb130294 	sub	x20, x20, x19
    671c:	f9400ac3 	ldr	x3, [x22, #16]
    6720:	b2400294 	orr	x20, x20, #0x1
    6724:	b942e841 	ldr	w1, [x2, #744]
    6728:	aa1503e0 	mov	x0, x21
    672c:	f9000474 	str	x20, [x3, #8]
    6730:	4b130033 	sub	w19, w1, w19
    6734:	b902e853 	str	w19, [x2, #744]
    6738:	97fff55e 	bl	3cb0 <__malloc_unlock>
    673c:	52800020 	mov	w0, #0x1                   	// #1
    6740:	a94153f3 	ldp	x19, x20, [sp, #16]
    6744:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6748:	a8c37bfd 	ldp	x29, x30, [sp], #48
    674c:	d65f03c0 	ret
    6750:	d2800001 	mov	x1, #0x0                   	// #0
    6754:	aa1503e0 	mov	x0, x21
    6758:	97fff55a 	bl	3cc0 <_sbrk_r>
    675c:	f9400ac2 	ldr	x2, [x22, #16]
    6760:	cb020001 	sub	x1, x0, x2
    6764:	f1007c3f 	cmp	x1, #0x1f
    6768:	54fffbed 	b.le	66e4 <_malloc_trim_r+0x64>
    676c:	f0000024 	adrp	x4, d000 <__malloc_av_+0x780>
    6770:	b2400021 	orr	x1, x1, #0x1
    6774:	f9000441 	str	x1, [x2, #8]
    6778:	f0000023 	adrp	x3, d000 <__malloc_av_+0x780>
    677c:	f9404881 	ldr	x1, [x4, #144]
    6780:	cb010000 	sub	x0, x0, x1
    6784:	b902e860 	str	w0, [x3, #744]
    6788:	17ffffd7 	b	66e4 <_malloc_trim_r+0x64>
    678c:	d503201f 	nop

0000000000006790 <_free_r>:
    6790:	b4000a21 	cbz	x1, 68d4 <_free_r+0x144>
    6794:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6798:	910003fd 	mov	x29, sp
    679c:	a90153f3 	stp	x19, x20, [sp, #16]
    67a0:	aa0103f3 	mov	x19, x1
    67a4:	aa0003f4 	mov	x20, x0
    67a8:	97fff53e 	bl	3ca0 <__malloc_lock>
    67ac:	f85f8265 	ldur	x5, [x19, #-8]
    67b0:	d1004263 	sub	x3, x19, #0x10
    67b4:	d0000020 	adrp	x0, c000 <IpcTestNull+0x6e8>
    67b8:	91220000 	add	x0, x0, #0x880
    67bc:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    67c0:	8b020064 	add	x4, x3, x2
    67c4:	f9400806 	ldr	x6, [x0, #16]
    67c8:	f9400481 	ldr	x1, [x4, #8]
    67cc:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    67d0:	eb0400df 	cmp	x6, x4
    67d4:	54000c60 	b.eq	6960 <_free_r+0x1d0>  // b.none
    67d8:	f9000481 	str	x1, [x4, #8]
    67dc:	8b010086 	add	x6, x4, x1
    67e0:	37000345 	tbnz	w5, #0, 6848 <_free_r+0xb8>
    67e4:	f85f0267 	ldur	x7, [x19, #-16]
    67e8:	d0000025 	adrp	x5, c000 <IpcTestNull+0x6e8>
    67ec:	f94004c6 	ldr	x6, [x6, #8]
    67f0:	cb070063 	sub	x3, x3, x7
    67f4:	8b070042 	add	x2, x2, x7
    67f8:	912240a5 	add	x5, x5, #0x890
    67fc:	924000c6 	and	x6, x6, #0x1
    6800:	f9400867 	ldr	x7, [x3, #16]
    6804:	eb0500ff 	cmp	x7, x5
    6808:	54000940 	b.eq	6930 <_free_r+0x1a0>  // b.none
    680c:	f9400c68 	ldr	x8, [x3, #24]
    6810:	f9000ce8 	str	x8, [x7, #24]
    6814:	f9000907 	str	x7, [x8, #16]
    6818:	b50001c6 	cbnz	x6, 6850 <_free_r+0xc0>
    681c:	8b010042 	add	x2, x2, x1
    6820:	f9400881 	ldr	x1, [x4, #16]
    6824:	b2400046 	orr	x6, x2, #0x1
    6828:	eb05003f 	cmp	x1, x5
    682c:	54000ee0 	b.eq	6a08 <_free_r+0x278>  // b.none
    6830:	f9400c84 	ldr	x4, [x4, #24]
    6834:	f9000c24 	str	x4, [x1, #24]
    6838:	f9000881 	str	x1, [x4, #16]
    683c:	f9000466 	str	x6, [x3, #8]
    6840:	f8226862 	str	x2, [x3, x2]
    6844:	14000006 	b	685c <_free_r+0xcc>
    6848:	f94004c5 	ldr	x5, [x6, #8]
    684c:	36000465 	tbz	w5, #0, 68d8 <_free_r+0x148>
    6850:	b2400041 	orr	x1, x2, #0x1
    6854:	f9000461 	str	x1, [x3, #8]
    6858:	f9000082 	str	x2, [x4]
    685c:	f107fc5f 	cmp	x2, #0x1ff
    6860:	54000449 	b.ls	68e8 <_free_r+0x158>  // b.plast
    6864:	d349fc41 	lsr	x1, x2, #9
    6868:	f127fc5f 	cmp	x2, #0x9ff
    686c:	54000a28 	b.hi	69b0 <_free_r+0x220>  // b.pmore
    6870:	d346fc41 	lsr	x1, x2, #6
    6874:	1100e424 	add	w4, w1, #0x39
    6878:	1100e025 	add	w5, w1, #0x38
    687c:	531f7884 	lsl	w4, w4, #1
    6880:	937d7c84 	sbfiz	x4, x4, #3, #32
    6884:	8b040004 	add	x4, x0, x4
    6888:	f85f0481 	ldr	x1, [x4], #-16
    688c:	eb01009f 	cmp	x4, x1
    6890:	54000ae0 	b.eq	69ec <_free_r+0x25c>  // b.none
    6894:	d503201f 	nop
    6898:	f9400420 	ldr	x0, [x1, #8]
    689c:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    68a0:	eb02001f 	cmp	x0, x2
    68a4:	54000089 	b.ls	68b4 <_free_r+0x124>  // b.plast
    68a8:	f9400821 	ldr	x1, [x1, #16]
    68ac:	eb01009f 	cmp	x4, x1
    68b0:	54ffff41 	b.ne	6898 <_free_r+0x108>  // b.any
    68b4:	f9400c24 	ldr	x4, [x1, #24]
    68b8:	a9011061 	stp	x1, x4, [x3, #16]
    68bc:	aa1403e0 	mov	x0, x20
    68c0:	f9000883 	str	x3, [x4, #16]
    68c4:	f9000c23 	str	x3, [x1, #24]
    68c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    68cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    68d0:	17fff4f8 	b	3cb0 <__malloc_unlock>
    68d4:	d65f03c0 	ret
    68d8:	d0000025 	adrp	x5, c000 <IpcTestNull+0x6e8>
    68dc:	8b010042 	add	x2, x2, x1
    68e0:	912240a5 	add	x5, x5, #0x890
    68e4:	17ffffcf 	b	6820 <_free_r+0x90>
    68e8:	d343fc42 	lsr	x2, x2, #3
    68ec:	d2800024 	mov	x4, #0x1                   	// #1
    68f0:	11000441 	add	w1, w2, #0x1
    68f4:	f9400405 	ldr	x5, [x0, #8]
    68f8:	531f7821 	lsl	w1, w1, #1
    68fc:	13027c42 	asr	w2, w2, #2
    6900:	8b21cc01 	add	x1, x0, w1, sxtw #3
    6904:	9ac22082 	lsl	x2, x4, x2
    6908:	aa050042 	orr	x2, x2, x5
    690c:	f9000402 	str	x2, [x0, #8]
    6910:	f85f0420 	ldr	x0, [x1], #-16
    6914:	a9010460 	stp	x0, x1, [x3, #16]
    6918:	f9000823 	str	x3, [x1, #16]
    691c:	f9000c03 	str	x3, [x0, #24]
    6920:	aa1403e0 	mov	x0, x20
    6924:	a94153f3 	ldp	x19, x20, [sp, #16]
    6928:	a8c27bfd 	ldp	x29, x30, [sp], #32
    692c:	17fff4e1 	b	3cb0 <__malloc_unlock>
    6930:	b50009c6 	cbnz	x6, 6a68 <_free_r+0x2d8>
    6934:	a9410085 	ldp	x5, x0, [x4, #16]
    6938:	8b020021 	add	x1, x1, x2
    693c:	f9000ca0 	str	x0, [x5, #24]
    6940:	b2400022 	orr	x2, x1, #0x1
    6944:	f9000805 	str	x5, [x0, #16]
    6948:	aa1403e0 	mov	x0, x20
    694c:	f9000462 	str	x2, [x3, #8]
    6950:	f8216861 	str	x1, [x3, x1]
    6954:	a94153f3 	ldp	x19, x20, [sp, #16]
    6958:	a8c27bfd 	ldp	x29, x30, [sp], #32
    695c:	17fff4d5 	b	3cb0 <__malloc_unlock>
    6960:	8b010041 	add	x1, x2, x1
    6964:	370000e5 	tbnz	w5, #0, 6980 <_free_r+0x1f0>
    6968:	f85f0262 	ldur	x2, [x19, #-16]
    696c:	cb020063 	sub	x3, x3, x2
    6970:	8b020021 	add	x1, x1, x2
    6974:	a9410864 	ldp	x4, x2, [x3, #16]
    6978:	f9000c82 	str	x2, [x4, #24]
    697c:	f9000844 	str	x4, [x2, #16]
    6980:	f0000022 	adrp	x2, d000 <__malloc_av_+0x780>
    6984:	b2400024 	orr	x4, x1, #0x1
    6988:	f9000464 	str	x4, [x3, #8]
    698c:	f9404c42 	ldr	x2, [x2, #152]
    6990:	f9000803 	str	x3, [x0, #16]
    6994:	eb01005f 	cmp	x2, x1
    6998:	54fffc48 	b.hi	6920 <_free_r+0x190>  // b.pmore
    699c:	f0000021 	adrp	x1, d000 <__malloc_av_+0x780>
    69a0:	aa1403e0 	mov	x0, x20
    69a4:	f9419021 	ldr	x1, [x1, #800]
    69a8:	97ffff36 	bl	6680 <_malloc_trim_r>
    69ac:	17ffffdd 	b	6920 <_free_r+0x190>
    69b0:	f100503f 	cmp	x1, #0x14
    69b4:	54000129 	b.ls	69d8 <_free_r+0x248>  // b.plast
    69b8:	f101503f 	cmp	x1, #0x54
    69bc:	54000308 	b.hi	6a1c <_free_r+0x28c>  // b.pmore
    69c0:	d34cfc41 	lsr	x1, x2, #12
    69c4:	1101bc24 	add	w4, w1, #0x6f
    69c8:	1101b825 	add	w5, w1, #0x6e
    69cc:	531f7884 	lsl	w4, w4, #1
    69d0:	937d7c84 	sbfiz	x4, x4, #3, #32
    69d4:	17ffffac 	b	6884 <_free_r+0xf4>
    69d8:	11017024 	add	w4, w1, #0x5c
    69dc:	11016c25 	add	w5, w1, #0x5b
    69e0:	531f7884 	lsl	w4, w4, #1
    69e4:	937d7c84 	sbfiz	x4, x4, #3, #32
    69e8:	17ffffa7 	b	6884 <_free_r+0xf4>
    69ec:	f9400406 	ldr	x6, [x0, #8]
    69f0:	13027ca5 	asr	w5, w5, #2
    69f4:	d2800022 	mov	x2, #0x1                   	// #1
    69f8:	9ac52045 	lsl	x5, x2, x5
    69fc:	aa0600a5 	orr	x5, x5, x6
    6a00:	f9000405 	str	x5, [x0, #8]
    6a04:	17ffffad 	b	68b8 <_free_r+0x128>
    6a08:	a9020c03 	stp	x3, x3, [x0, #32]
    6a0c:	a9009466 	stp	x6, x5, [x3, #8]
    6a10:	f9000c65 	str	x5, [x3, #24]
    6a14:	f8226862 	str	x2, [x3, x2]
    6a18:	17ffffc2 	b	6920 <_free_r+0x190>
    6a1c:	f105503f 	cmp	x1, #0x154
    6a20:	540000e8 	b.hi	6a3c <_free_r+0x2ac>  // b.pmore
    6a24:	d34ffc41 	lsr	x1, x2, #15
    6a28:	1101e024 	add	w4, w1, #0x78
    6a2c:	1101dc25 	add	w5, w1, #0x77
    6a30:	531f7884 	lsl	w4, w4, #1
    6a34:	937d7c84 	sbfiz	x4, x4, #3, #32
    6a38:	17ffff93 	b	6884 <_free_r+0xf4>
    6a3c:	f115503f 	cmp	x1, #0x554
    6a40:	540000e8 	b.hi	6a5c <_free_r+0x2cc>  // b.pmore
    6a44:	d352fc41 	lsr	x1, x2, #18
    6a48:	1101f424 	add	w4, w1, #0x7d
    6a4c:	1101f025 	add	w5, w1, #0x7c
    6a50:	531f7884 	lsl	w4, w4, #1
    6a54:	937d7c84 	sbfiz	x4, x4, #3, #32
    6a58:	17ffff8b 	b	6884 <_free_r+0xf4>
    6a5c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    6a60:	52800fc5 	mov	w5, #0x7e                  	// #126
    6a64:	17ffff88 	b	6884 <_free_r+0xf4>
    6a68:	b2400040 	orr	x0, x2, #0x1
    6a6c:	f9000460 	str	x0, [x3, #8]
    6a70:	f9000082 	str	x2, [x4]
    6a74:	17ffffab 	b	6920 <_free_r+0x190>
    6a78:	d503201f 	nop
    6a7c:	d503201f 	nop

0000000000006a80 <__sfvwrite_r>:
    6a80:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    6a84:	910003fd 	mov	x29, sp
    6a88:	a90363f7 	stp	x23, x24, [sp, #48]
    6a8c:	aa0003f7 	mov	x23, x0
    6a90:	f9400840 	ldr	x0, [x2, #16]
    6a94:	b4000460 	cbz	x0, 6b20 <__sfvwrite_r+0xa0>
    6a98:	79402023 	ldrh	w3, [x1, #16]
    6a9c:	aa0203f8 	mov	x24, x2
    6aa0:	a90153f3 	stp	x19, x20, [sp, #16]
    6aa4:	aa0103f3 	mov	x19, x1
    6aa8:	36180443 	tbz	w3, #3, 6b30 <__sfvwrite_r+0xb0>
    6aac:	f9400c20 	ldr	x0, [x1, #24]
    6ab0:	b4000400 	cbz	x0, 6b30 <__sfvwrite_r+0xb0>
    6ab4:	a9025bf5 	stp	x21, x22, [sp, #32]
    6ab8:	a9046bf9 	stp	x25, x26, [sp, #64]
    6abc:	f9400314 	ldr	x20, [x24]
    6ac0:	360804a3 	tbz	w3, #1, 6b54 <__sfvwrite_r+0xd4>
    6ac4:	d2800016 	mov	x22, #0x0                   	// #0
    6ac8:	d2800015 	mov	x21, #0x0                   	// #0
    6acc:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    6ad0:	eb1902bf 	cmp	x21, x25
    6ad4:	aa1603e2 	mov	x2, x22
    6ad8:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    6adc:	aa1703e0 	mov	x0, x23
    6ae0:	b4000875 	cbz	x21, 6bec <__sfvwrite_r+0x16c>
    6ae4:	f9401a61 	ldr	x1, [x19, #48]
    6ae8:	f9402264 	ldr	x4, [x19, #64]
    6aec:	d63f0080 	blr	x4
    6af0:	7100001f 	cmp	w0, #0x0
    6af4:	5400206d 	b.le	6f00 <__sfvwrite_r+0x480>
    6af8:	f9400b01 	ldr	x1, [x24, #16]
    6afc:	93407c00 	sxtw	x0, w0
    6b00:	8b0002d6 	add	x22, x22, x0
    6b04:	cb0002b5 	sub	x21, x21, x0
    6b08:	cb000020 	sub	x0, x1, x0
    6b0c:	f9000b00 	str	x0, [x24, #16]
    6b10:	b5fffe00 	cbnz	x0, 6ad0 <__sfvwrite_r+0x50>
    6b14:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b18:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6b1c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6b20:	52800000 	mov	w0, #0x0                   	// #0
    6b24:	a94363f7 	ldp	x23, x24, [sp, #48]
    6b28:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6b2c:	d65f03c0 	ret
    6b30:	aa1303e1 	mov	x1, x19
    6b34:	aa1703e0 	mov	x0, x23
    6b38:	97fffc2e 	bl	5bf0 <__swsetup_r>
    6b3c:	35001f00 	cbnz	w0, 6f1c <__sfvwrite_r+0x49c>
    6b40:	79402263 	ldrh	w3, [x19, #16]
    6b44:	a9025bf5 	stp	x21, x22, [sp, #32]
    6b48:	a9046bf9 	stp	x25, x26, [sp, #64]
    6b4c:	f9400314 	ldr	x20, [x24]
    6b50:	370ffba3 	tbnz	w3, #1, 6ac4 <__sfvwrite_r+0x44>
    6b54:	a90573fb 	stp	x27, x28, [sp, #80]
    6b58:	37000503 	tbnz	w3, #0, 6bf8 <__sfvwrite_r+0x178>
    6b5c:	d280001c 	mov	x28, #0x0                   	// #0
    6b60:	d2800015 	mov	x21, #0x0                   	// #0
    6b64:	d503201f 	nop
    6b68:	b40003d5 	cbz	x21, 6be0 <__sfvwrite_r+0x160>
    6b6c:	f9400266 	ldr	x6, [x19]
    6b70:	b9400e7a 	ldr	w26, [x19, #12]
    6b74:	aa0603e0 	mov	x0, x6
    6b78:	36480ac3 	tbz	w3, #9, 6cd0 <__sfvwrite_r+0x250>
    6b7c:	93407f5b 	sxtw	x27, w26
    6b80:	eb15037f 	cmp	x27, x21
    6b84:	540010c9 	b.ls	6d9c <__sfvwrite_r+0x31c>  // b.plast
    6b88:	93407ea1 	sxtw	x1, w21
    6b8c:	aa0103f6 	mov	x22, x1
    6b90:	aa0603e0 	mov	x0, x6
    6b94:	aa0103fb 	mov	x27, x1
    6b98:	2a1503fa 	mov	w26, w21
    6b9c:	aa1b03e2 	mov	x2, x27
    6ba0:	aa1c03e1 	mov	x1, x28
    6ba4:	97fff397 	bl	3a00 <memmove>
    6ba8:	f9400261 	ldr	x1, [x19]
    6bac:	b9400e60 	ldr	w0, [x19, #12]
    6bb0:	8b1b0022 	add	x2, x1, x27
    6bb4:	f9000262 	str	x2, [x19]
    6bb8:	4b1a0000 	sub	w0, w0, w26
    6bbc:	b9000e60 	str	w0, [x19, #12]
    6bc0:	f9400b00 	ldr	x0, [x24, #16]
    6bc4:	8b16039c 	add	x28, x28, x22
    6bc8:	cb1602b5 	sub	x21, x21, x22
    6bcc:	cb160016 	sub	x22, x0, x22
    6bd0:	f9000b16 	str	x22, [x24, #16]
    6bd4:	b40005d6 	cbz	x22, 6c8c <__sfvwrite_r+0x20c>
    6bd8:	79402263 	ldrh	w3, [x19, #16]
    6bdc:	b5fffc95 	cbnz	x21, 6b6c <__sfvwrite_r+0xec>
    6be0:	a940569c 	ldp	x28, x21, [x20]
    6be4:	91004294 	add	x20, x20, #0x10
    6be8:	17ffffe0 	b	6b68 <__sfvwrite_r+0xe8>
    6bec:	a9405696 	ldp	x22, x21, [x20]
    6bf0:	91004294 	add	x20, x20, #0x10
    6bf4:	17ffffb7 	b	6ad0 <__sfvwrite_r+0x50>
    6bf8:	5280001a 	mov	w26, #0x0                   	// #0
    6bfc:	52800000 	mov	w0, #0x0                   	// #0
    6c00:	d280001b 	mov	x27, #0x0                   	// #0
    6c04:	d2800019 	mov	x25, #0x0                   	// #0
    6c08:	b40004d9 	cbz	x25, 6ca0 <__sfvwrite_r+0x220>
    6c0c:	34000500 	cbz	w0, 6cac <__sfvwrite_r+0x22c>
    6c10:	f9400260 	ldr	x0, [x19]
    6c14:	93407f56 	sxtw	x22, w26
    6c18:	f9400e61 	ldr	x1, [x19, #24]
    6c1c:	eb1902df 	cmp	x22, x25
    6c20:	b9400e75 	ldr	w21, [x19, #12]
    6c24:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    6c28:	b9402263 	ldr	w3, [x19, #32]
    6c2c:	eb01001f 	cmp	x0, x1
    6c30:	0b150075 	add	w21, w3, w21
    6c34:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    6c38:	5400132c 	b.gt	6e9c <__sfvwrite_r+0x41c>
    6c3c:	6b16007f 	cmp	w3, w22
    6c40:	5400116c 	b.gt	6e6c <__sfvwrite_r+0x3ec>
    6c44:	f9401a61 	ldr	x1, [x19, #48]
    6c48:	aa1b03e2 	mov	x2, x27
    6c4c:	f9402264 	ldr	x4, [x19, #64]
    6c50:	aa1703e0 	mov	x0, x23
    6c54:	d63f0080 	blr	x4
    6c58:	2a0003f5 	mov	w21, w0
    6c5c:	7100001f 	cmp	w0, #0x0
    6c60:	5400088d 	b.le	6d70 <__sfvwrite_r+0x2f0>
    6c64:	6b15035a 	subs	w26, w26, w21
    6c68:	52800020 	mov	w0, #0x1                   	// #1
    6c6c:	54000f60 	b.eq	6e58 <__sfvwrite_r+0x3d8>  // b.none
    6c70:	f9400b01 	ldr	x1, [x24, #16]
    6c74:	93407eb5 	sxtw	x21, w21
    6c78:	8b15037b 	add	x27, x27, x21
    6c7c:	cb150339 	sub	x25, x25, x21
    6c80:	cb150035 	sub	x21, x1, x21
    6c84:	f9000b15 	str	x21, [x24, #16]
    6c88:	b5fffc15 	cbnz	x21, 6c08 <__sfvwrite_r+0x188>
    6c8c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6c90:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6c94:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6c98:	a94573fb 	ldp	x27, x28, [sp, #80]
    6c9c:	17ffffa1 	b	6b20 <__sfvwrite_r+0xa0>
    6ca0:	a940669b 	ldp	x27, x25, [x20]
    6ca4:	91004294 	add	x20, x20, #0x10
    6ca8:	b4ffffd9 	cbz	x25, 6ca0 <__sfvwrite_r+0x220>
    6cac:	aa1903e2 	mov	x2, x25
    6cb0:	aa1b03e0 	mov	x0, x27
    6cb4:	52800141 	mov	w1, #0xa                   	// #10
    6cb8:	9400069b 	bl	8724 <memchr>
    6cbc:	9100041a 	add	x26, x0, #0x1
    6cc0:	f100001f 	cmp	x0, #0x0
    6cc4:	cb1b035a 	sub	x26, x26, x27
    6cc8:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    6ccc:	17ffffd1 	b	6c10 <__sfvwrite_r+0x190>
    6cd0:	f9400e60 	ldr	x0, [x19, #24]
    6cd4:	eb06001f 	cmp	x0, x6
    6cd8:	54000263 	b.cc	6d24 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6cdc:	b9402263 	ldr	w3, [x19, #32]
    6ce0:	eb23c2bf 	cmp	x21, w3, sxtw
    6ce4:	54000203 	b.cc	6d24 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6ce8:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    6cec:	eb0002bf 	cmp	x21, x0
    6cf0:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    6cf4:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    6cf8:	f9401a61 	ldr	x1, [x19, #48]
    6cfc:	aa1c03e2 	mov	x2, x28
    6d00:	1ac30c84 	sdiv	w4, w4, w3
    6d04:	aa1703e0 	mov	x0, x23
    6d08:	f9402266 	ldr	x6, [x19, #64]
    6d0c:	1b037c83 	mul	w3, w4, w3
    6d10:	d63f00c0 	blr	x6
    6d14:	7100001f 	cmp	w0, #0x0
    6d18:	540002cd 	b.le	6d70 <__sfvwrite_r+0x2f0>
    6d1c:	93407c16 	sxtw	x22, w0
    6d20:	17ffffa8 	b	6bc0 <__sfvwrite_r+0x140>
    6d24:	93407f44 	sxtw	x4, w26
    6d28:	aa1c03e1 	mov	x1, x28
    6d2c:	eb15009f 	cmp	x4, x21
    6d30:	aa0603e0 	mov	x0, x6
    6d34:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    6d38:	93407f56 	sxtw	x22, w26
    6d3c:	aa1603e2 	mov	x2, x22
    6d40:	97fff330 	bl	3a00 <memmove>
    6d44:	f9400261 	ldr	x1, [x19]
    6d48:	b9400e60 	ldr	w0, [x19, #12]
    6d4c:	8b160021 	add	x1, x1, x22
    6d50:	f9000261 	str	x1, [x19]
    6d54:	4b1a0004 	sub	w4, w0, w26
    6d58:	b9000e64 	str	w4, [x19, #12]
    6d5c:	35fff324 	cbnz	w4, 6bc0 <__sfvwrite_r+0x140>
    6d60:	aa1303e1 	mov	x1, x19
    6d64:	aa1703e0 	mov	x0, x23
    6d68:	97fffcb2 	bl	6030 <_fflush_r>
    6d6c:	34fff2a0 	cbz	w0, 6bc0 <__sfvwrite_r+0x140>
    6d70:	a94573fb 	ldp	x27, x28, [sp, #80]
    6d74:	79c02261 	ldrsh	w1, [x19, #16]
    6d78:	321a0021 	orr	w1, w1, #0x40
    6d7c:	79002261 	strh	w1, [x19, #16]
    6d80:	12800000 	mov	w0, #0xffffffff            	// #-1
    6d84:	a94153f3 	ldp	x19, x20, [sp, #16]
    6d88:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6d8c:	a94363f7 	ldp	x23, x24, [sp, #48]
    6d90:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6d94:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6d98:	d65f03c0 	ret
    6d9c:	93407eb6 	sxtw	x22, w21
    6da0:	52809001 	mov	w1, #0x480                 	// #1152
    6da4:	6a01007f 	tst	w3, w1
    6da8:	54ffefa0 	b.eq	6b9c <__sfvwrite_r+0x11c>  // b.none
    6dac:	b9402267 	ldr	w7, [x19, #32]
    6db0:	f9400e61 	ldr	x1, [x19, #24]
    6db4:	0b0704e7 	add	w7, w7, w7, lsl #1
    6db8:	cb0100d6 	sub	x22, x6, x1
    6dbc:	0b477ce7 	add	w7, w7, w7, lsr #31
    6dc0:	93407ed9 	sxtw	x25, w22
    6dc4:	13017cfb 	asr	w27, w7, #1
    6dc8:	91000720 	add	x0, x25, #0x1
    6dcc:	8b150000 	add	x0, x0, x21
    6dd0:	93407f62 	sxtw	x2, w27
    6dd4:	eb00005f 	cmp	x2, x0
    6dd8:	54000082 	b.cs	6de8 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    6ddc:	110006c7 	add	w7, w22, #0x1
    6de0:	0b1500fb 	add	w27, w7, w21
    6de4:	93407f62 	sxtw	x2, w27
    6de8:	36500723 	tbz	w3, #10, 6ecc <__sfvwrite_r+0x44c>
    6dec:	aa0203e1 	mov	x1, x2
    6df0:	aa1703e0 	mov	x0, x23
    6df4:	97fff093 	bl	3040 <_malloc_r>
    6df8:	aa0003fa 	mov	x26, x0
    6dfc:	b4000860 	cbz	x0, 6f08 <__sfvwrite_r+0x488>
    6e00:	f9400e61 	ldr	x1, [x19, #24]
    6e04:	aa1903e2 	mov	x2, x25
    6e08:	97fff29e 	bl	3880 <memcpy>
    6e0c:	79402260 	ldrh	w0, [x19, #16]
    6e10:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    6e14:	0a010000 	and	w0, w0, w1
    6e18:	32190000 	orr	w0, w0, #0x80
    6e1c:	79002260 	strh	w0, [x19, #16]
    6e20:	8b190340 	add	x0, x26, x25
    6e24:	4b160366 	sub	w6, w27, w22
    6e28:	93407eb6 	sxtw	x22, w21
    6e2c:	f9000260 	str	x0, [x19]
    6e30:	b9000e66 	str	w6, [x19, #12]
    6e34:	aa1603e1 	mov	x1, x22
    6e38:	f9000e7a 	str	x26, [x19, #24]
    6e3c:	aa0003e6 	mov	x6, x0
    6e40:	b900227b 	str	w27, [x19, #32]
    6e44:	2a1503fa 	mov	w26, w21
    6e48:	eb1502df 	cmp	x22, x21
    6e4c:	54ffea08 	b.hi	6b8c <__sfvwrite_r+0x10c>  // b.pmore
    6e50:	aa1603fb 	mov	x27, x22
    6e54:	17ffff52 	b	6b9c <__sfvwrite_r+0x11c>
    6e58:	aa1303e1 	mov	x1, x19
    6e5c:	aa1703e0 	mov	x0, x23
    6e60:	97fffc74 	bl	6030 <_fflush_r>
    6e64:	34fff060 	cbz	w0, 6c70 <__sfvwrite_r+0x1f0>
    6e68:	17ffffc2 	b	6d70 <__sfvwrite_r+0x2f0>
    6e6c:	93407edc 	sxtw	x28, w22
    6e70:	aa1b03e1 	mov	x1, x27
    6e74:	aa1c03e2 	mov	x2, x28
    6e78:	97fff2e2 	bl	3a00 <memmove>
    6e7c:	f9400260 	ldr	x0, [x19]
    6e80:	2a1603f5 	mov	w21, w22
    6e84:	b9400e61 	ldr	w1, [x19, #12]
    6e88:	8b1c0000 	add	x0, x0, x28
    6e8c:	f9000260 	str	x0, [x19]
    6e90:	4b160036 	sub	w22, w1, w22
    6e94:	b9000e76 	str	w22, [x19, #12]
    6e98:	17ffff73 	b	6c64 <__sfvwrite_r+0x1e4>
    6e9c:	93407eb6 	sxtw	x22, w21
    6ea0:	aa1b03e1 	mov	x1, x27
    6ea4:	aa1603e2 	mov	x2, x22
    6ea8:	97fff2d6 	bl	3a00 <memmove>
    6eac:	f9400262 	ldr	x2, [x19]
    6eb0:	aa1303e1 	mov	x1, x19
    6eb4:	aa1703e0 	mov	x0, x23
    6eb8:	8b160042 	add	x2, x2, x22
    6ebc:	f9000262 	str	x2, [x19]
    6ec0:	97fffc5c 	bl	6030 <_fflush_r>
    6ec4:	34ffed00 	cbz	w0, 6c64 <__sfvwrite_r+0x1e4>
    6ec8:	17ffffaa 	b	6d70 <__sfvwrite_r+0x2f0>
    6ecc:	aa1703e0 	mov	x0, x23
    6ed0:	9400064c 	bl	8800 <_realloc_r>
    6ed4:	aa0003fa 	mov	x26, x0
    6ed8:	b5fffa40 	cbnz	x0, 6e20 <__sfvwrite_r+0x3a0>
    6edc:	f9400e61 	ldr	x1, [x19, #24]
    6ee0:	aa1703e0 	mov	x0, x23
    6ee4:	97fffe2b 	bl	6790 <_free_r>
    6ee8:	79c02261 	ldrsh	w1, [x19, #16]
    6eec:	52800180 	mov	w0, #0xc                   	// #12
    6ef0:	a94573fb 	ldp	x27, x28, [sp, #80]
    6ef4:	12187821 	and	w1, w1, #0xffffff7f
    6ef8:	b90002e0 	str	w0, [x23]
    6efc:	17ffff9f 	b	6d78 <__sfvwrite_r+0x2f8>
    6f00:	79c02261 	ldrsh	w1, [x19, #16]
    6f04:	17ffff9d 	b	6d78 <__sfvwrite_r+0x2f8>
    6f08:	79c02261 	ldrsh	w1, [x19, #16]
    6f0c:	52800180 	mov	w0, #0xc                   	// #12
    6f10:	a94573fb 	ldp	x27, x28, [sp, #80]
    6f14:	b90002e0 	str	w0, [x23]
    6f18:	17ffff98 	b	6d78 <__sfvwrite_r+0x2f8>
    6f1c:	12800000 	mov	w0, #0xffffffff            	// #-1
    6f20:	a94153f3 	ldp	x19, x20, [sp, #16]
    6f24:	17ffff00 	b	6b24 <__sfvwrite_r+0xa4>
    6f28:	d503201f 	nop
    6f2c:	d503201f 	nop

0000000000006f30 <_fwalk>:
    6f30:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6f34:	910003fd 	mov	x29, sp
    6f38:	a9025bf5 	stp	x21, x22, [sp, #32]
    6f3c:	91148015 	add	x21, x0, #0x520
    6f40:	aa0103f6 	mov	x22, x1
    6f44:	a90153f3 	stp	x19, x20, [sp, #16]
    6f48:	f9001bf7 	str	x23, [sp, #48]
    6f4c:	52800017 	mov	w23, #0x0                   	// #0
    6f50:	b9400aa0 	ldr	w0, [x21, #8]
    6f54:	f9400ab3 	ldr	x19, [x21, #16]
    6f58:	7100001f 	cmp	w0, #0x0
    6f5c:	5400026d 	b.le	6fa8 <_fwalk+0x78>
    6f60:	51000400 	sub	w0, w0, #0x1
    6f64:	91000400 	add	x0, x0, #0x1
    6f68:	8b000414 	add	x20, x0, x0, lsl #1
    6f6c:	d37ef694 	lsl	x20, x20, #2
    6f70:	cb000294 	sub	x20, x20, x0
    6f74:	8b141274 	add	x20, x19, x20, lsl #4
    6f78:	79402260 	ldrh	w0, [x19, #16]
    6f7c:	7100041f 	cmp	w0, #0x1
    6f80:	540000e9 	b.ls	6f9c <_fwalk+0x6c>  // b.plast
    6f84:	79c02662 	ldrsh	w2, [x19, #18]
    6f88:	aa1303e0 	mov	x0, x19
    6f8c:	3100045f 	cmn	w2, #0x1
    6f90:	54000060 	b.eq	6f9c <_fwalk+0x6c>  // b.none
    6f94:	d63f02c0 	blr	x22
    6f98:	2a0002f7 	orr	w23, w23, w0
    6f9c:	9102c273 	add	x19, x19, #0xb0
    6fa0:	eb13029f 	cmp	x20, x19
    6fa4:	54fffea1 	b.ne	6f78 <_fwalk+0x48>  // b.any
    6fa8:	f94002b5 	ldr	x21, [x21]
    6fac:	b5fffd35 	cbnz	x21, 6f50 <_fwalk+0x20>
    6fb0:	2a1703e0 	mov	w0, w23
    6fb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    6fb8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6fbc:	f9401bf7 	ldr	x23, [sp, #48]
    6fc0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    6fc4:	d65f03c0 	ret
    6fc8:	d503201f 	nop
    6fcc:	d503201f 	nop

0000000000006fd0 <_fwalk_reent>:
    6fd0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6fd4:	910003fd 	mov	x29, sp
    6fd8:	a9025bf5 	stp	x21, x22, [sp, #32]
    6fdc:	aa0103f6 	mov	x22, x1
    6fe0:	91148015 	add	x21, x0, #0x520
    6fe4:	a90363f7 	stp	x23, x24, [sp, #48]
    6fe8:	aa0003f8 	mov	x24, x0
    6fec:	52800017 	mov	w23, #0x0                   	// #0
    6ff0:	a90153f3 	stp	x19, x20, [sp, #16]
    6ff4:	d503201f 	nop
    6ff8:	b9400aa2 	ldr	w2, [x21, #8]
    6ffc:	f9400ab3 	ldr	x19, [x21, #16]
    7000:	7100005f 	cmp	w2, #0x0
    7004:	5400028d 	b.le	7054 <_fwalk_reent+0x84>
    7008:	51000442 	sub	w2, w2, #0x1
    700c:	91000442 	add	x2, x2, #0x1
    7010:	8b020454 	add	x20, x2, x2, lsl #1
    7014:	d37ef694 	lsl	x20, x20, #2
    7018:	cb020294 	sub	x20, x20, x2
    701c:	8b141274 	add	x20, x19, x20, lsl #4
    7020:	79402262 	ldrh	w2, [x19, #16]
    7024:	7100045f 	cmp	w2, #0x1
    7028:	54000109 	b.ls	7048 <_fwalk_reent+0x78>  // b.plast
    702c:	79c02662 	ldrsh	w2, [x19, #18]
    7030:	aa1303e1 	mov	x1, x19
    7034:	aa1803e0 	mov	x0, x24
    7038:	3100045f 	cmn	w2, #0x1
    703c:	54000060 	b.eq	7048 <_fwalk_reent+0x78>  // b.none
    7040:	d63f02c0 	blr	x22
    7044:	2a0002f7 	orr	w23, w23, w0
    7048:	9102c273 	add	x19, x19, #0xb0
    704c:	eb13029f 	cmp	x20, x19
    7050:	54fffe81 	b.ne	7020 <_fwalk_reent+0x50>  // b.any
    7054:	f94002b5 	ldr	x21, [x21]
    7058:	b5fffd15 	cbnz	x21, 6ff8 <_fwalk_reent+0x28>
    705c:	2a1703e0 	mov	w0, w23
    7060:	a94153f3 	ldp	x19, x20, [sp, #16]
    7064:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7068:	a94363f7 	ldp	x23, x24, [sp, #48]
    706c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7070:	d65f03c0 	ret
    7074:	d503201f 	nop
    7078:	d503201f 	nop
    707c:	d503201f 	nop

0000000000007080 <__localeconv_l>:
    7080:	91040000 	add	x0, x0, #0x100
    7084:	d65f03c0 	ret
    7088:	d503201f 	nop
    708c:	d503201f 	nop

0000000000007090 <_localeconv_r>:
    7090:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    7094:	91070000 	add	x0, x0, #0x1c0
    7098:	d65f03c0 	ret
    709c:	d503201f 	nop

00000000000070a0 <localeconv>:
    70a0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    70a4:	91070000 	add	x0, x0, #0x1c0
    70a8:	d65f03c0 	ret
    70ac:	d503201f 	nop

00000000000070b0 <currentlocale>:
    70b0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    70b4:	910003fd 	mov	x29, sp
    70b8:	a90153f3 	stp	x19, x20, [sp, #16]
    70bc:	d0000034 	adrp	x20, d000 <__malloc_av_+0x780>
    70c0:	91030294 	add	x20, x20, #0xc0
    70c4:	a9025bf5 	stp	x21, x22, [sp, #32]
    70c8:	91010296 	add	x22, x20, #0x40
    70cc:	d0000035 	adrp	x21, d000 <__malloc_av_+0x780>
    70d0:	910cc2b5 	add	x21, x21, #0x330
    70d4:	f9001bf7 	str	x23, [sp, #48]
    70d8:	91038297 	add	x23, x20, #0xe0
    70dc:	91008294 	add	x20, x20, #0x20
    70e0:	aa1603f3 	mov	x19, x22
    70e4:	aa1503e0 	mov	x0, x21
    70e8:	aa1403e1 	mov	x1, x20
    70ec:	940009d5 	bl	9840 <strcpy>
    70f0:	aa1303e1 	mov	x1, x19
    70f4:	aa1403e0 	mov	x0, x20
    70f8:	91008273 	add	x19, x19, #0x20
    70fc:	94000991 	bl	9740 <strcmp>
    7100:	35000120 	cbnz	w0, 7124 <currentlocale+0x74>
    7104:	eb17027f 	cmp	x19, x23
    7108:	54ffff41 	b.ne	70f0 <currentlocale+0x40>  // b.any
    710c:	aa1503e0 	mov	x0, x21
    7110:	a94153f3 	ldp	x19, x20, [sp, #16]
    7114:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7118:	f9401bf7 	ldr	x23, [sp, #48]
    711c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7120:	d65f03c0 	ret
    7124:	90000033 	adrp	x19, b000 <pow10.0+0x80>
    7128:	910e0273 	add	x19, x19, #0x380
    712c:	aa1303e1 	mov	x1, x19
    7130:	aa1503e0 	mov	x0, x21
    7134:	94000923 	bl	95c0 <strcat>
    7138:	aa1603e1 	mov	x1, x22
    713c:	aa1503e0 	mov	x0, x21
    7140:	910082d6 	add	x22, x22, #0x20
    7144:	9400091f 	bl	95c0 <strcat>
    7148:	eb1702df 	cmp	x22, x23
    714c:	54ffff01 	b.ne	712c <currentlocale+0x7c>  // b.any
    7150:	aa1503e0 	mov	x0, x21
    7154:	a94153f3 	ldp	x19, x20, [sp, #16]
    7158:	a9425bf5 	ldp	x21, x22, [sp, #32]
    715c:	f9401bf7 	ldr	x23, [sp, #48]
    7160:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7164:	d65f03c0 	ret
    7168:	d503201f 	nop
    716c:	d503201f 	nop

0000000000007170 <__loadlocale>:
    7170:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    7174:	910003fd 	mov	x29, sp
    7178:	a90153f3 	stp	x19, x20, [sp, #16]
    717c:	937b7c34 	sbfiz	x20, x1, #5, #32
    7180:	8b140014 	add	x20, x0, x20
    7184:	aa0203f3 	mov	x19, x2
    7188:	a9025bf5 	stp	x21, x22, [sp, #32]
    718c:	aa0003f6 	mov	x22, x0
    7190:	aa0203e0 	mov	x0, x2
    7194:	a90363f7 	stp	x23, x24, [sp, #48]
    7198:	2a0103f7 	mov	w23, w1
    719c:	aa1403e1 	mov	x1, x20
    71a0:	94000968 	bl	9740 <strcmp>
    71a4:	350000e0 	cbnz	w0, 71c0 <__loadlocale+0x50>
    71a8:	aa1403e0 	mov	x0, x20
    71ac:	a94153f3 	ldp	x19, x20, [sp, #16]
    71b0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    71b4:	a94363f7 	ldp	x23, x24, [sp, #48]
    71b8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    71bc:	d65f03c0 	ret
    71c0:	aa1303e0 	mov	x0, x19
    71c4:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    71c8:	90000035 	adrp	x21, b000 <pow10.0+0x80>
    71cc:	910e2021 	add	x1, x1, #0x388
    71d0:	910e42b5 	add	x21, x21, #0x390
    71d4:	a9046bf9 	stp	x25, x26, [sp, #64]
    71d8:	9400095a 	bl	9740 <strcmp>
    71dc:	34000d80 	cbz	w0, 738c <__loadlocale+0x21c>
    71e0:	aa1503e1 	mov	x1, x21
    71e4:	aa1303e0 	mov	x0, x19
    71e8:	94000956 	bl	9740 <strcmp>
    71ec:	2a0003f5 	mov	w21, w0
    71f0:	34000be0 	cbz	w0, 736c <__loadlocale+0x1fc>
    71f4:	39400260 	ldrb	w0, [x19]
    71f8:	71010c1f 	cmp	w0, #0x43
    71fc:	54000d00 	b.eq	739c <__loadlocale+0x22c>  // b.none
    7200:	51018400 	sub	w0, w0, #0x61
    7204:	12001c00 	and	w0, w0, #0xff
    7208:	7100641f 	cmp	w0, #0x19
    720c:	54000a08 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    7210:	39400660 	ldrb	w0, [x19, #1]
    7214:	51018400 	sub	w0, w0, #0x61
    7218:	12001c00 	and	w0, w0, #0xff
    721c:	7100641f 	cmp	w0, #0x19
    7220:	54000968 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    7224:	39400a60 	ldrb	w0, [x19, #2]
    7228:	91000a75 	add	x21, x19, #0x2
    722c:	51018401 	sub	w1, w0, #0x61
    7230:	12001c21 	and	w1, w1, #0xff
    7234:	7100643f 	cmp	w1, #0x19
    7238:	54000068 	b.hi	7244 <__loadlocale+0xd4>  // b.pmore
    723c:	39400e60 	ldrb	w0, [x19, #3]
    7240:	91000e75 	add	x21, x19, #0x3
    7244:	71017c1f 	cmp	w0, #0x5f
    7248:	54000d00 	b.eq	73e8 <__loadlocale+0x278>  // b.none
    724c:	7100b81f 	cmp	w0, #0x2e
    7250:	54002ec0 	b.eq	7828 <__loadlocale+0x6b8>  // b.none
    7254:	528017e1 	mov	w1, #0xbf                  	// #191
    7258:	6a01001f 	tst	w0, w1
    725c:	54000781 	b.ne	734c <__loadlocale+0x1dc>  // b.any
    7260:	910203f8 	add	x24, sp, #0x80
    7264:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7268:	aa1803e0 	mov	x0, x24
    726c:	910e8021 	add	x1, x1, #0x3a0
    7270:	94000974 	bl	9840 <strcpy>
    7274:	394002a0 	ldrb	w0, [x21]
    7278:	7101001f 	cmp	w0, #0x40
    727c:	54002da0 	b.eq	7830 <__loadlocale+0x6c0>  // b.none
    7280:	52800019 	mov	w25, #0x0                   	// #0
    7284:	52800015 	mov	w21, #0x0                   	// #0
    7288:	5280001a 	mov	w26, #0x0                   	// #0
    728c:	394203e1 	ldrb	w1, [sp, #128]
    7290:	51010421 	sub	w1, w1, #0x41
    7294:	7100d03f 	cmp	w1, #0x34
    7298:	540005a8 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    729c:	90000020 	adrp	x0, b000 <pow10.0+0x80>
    72a0:	91126000 	add	x0, x0, #0x498
    72a4:	a90573fb 	stp	x27, x28, [sp, #80]
    72a8:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    72ac:	10000061 	adr	x1, 72b8 <__loadlocale+0x148>
    72b0:	8b20a820 	add	x0, x1, w0, sxth #2
    72b4:	d61f0000 	br	x0
    72b8:	394207e0 	ldrb	w0, [sp, #129]
    72bc:	121a7800 	and	w0, w0, #0xffffffdf
    72c0:	12001c00 	and	w0, w0, #0xff
    72c4:	7101401f 	cmp	w0, #0x50
    72c8:	54000401 	b.ne	7348 <__loadlocale+0x1d8>  // b.any
    72cc:	d2800042 	mov	x2, #0x2                   	// #2
    72d0:	aa1803e0 	mov	x0, x24
    72d4:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    72d8:	9110c021 	add	x1, x1, #0x430
    72dc:	94000a5d 	bl	9c50 <strncpy>
    72e0:	9101e3e1 	add	x1, sp, #0x78
    72e4:	91020be0 	add	x0, sp, #0x82
    72e8:	52800142 	mov	w2, #0xa                   	// #10
    72ec:	94000b05 	bl	9f00 <strtol>
    72f0:	f9403fe1 	ldr	x1, [sp, #120]
    72f4:	39400021 	ldrb	w1, [x1]
    72f8:	35000281 	cbnz	w1, 7348 <__loadlocale+0x1d8>
    72fc:	f10e901f 	cmp	x0, #0x3a4
    7300:	540030a0 	b.eq	7914 <__loadlocale+0x7a4>  // b.none
    7304:	54002f2c 	b.gt	78e8 <__loadlocale+0x778>
    7308:	f10d881f 	cmp	x0, #0x362
    730c:	54002dec 	b.gt	78c8 <__loadlocale+0x758>
    7310:	f10d441f 	cmp	x0, #0x351
    7314:	54002c8c 	b.gt	78a4 <__loadlocale+0x734>
    7318:	f106d41f 	cmp	x0, #0x1b5
    731c:	54002da0 	b.eq	78d0 <__loadlocale+0x760>  // b.none
    7320:	d10b4000 	sub	x0, x0, #0x2d0
    7324:	f100dc1f 	cmp	x0, #0x37
    7328:	54000108 	b.hi	7348 <__loadlocale+0x1d8>  // b.pmore
    732c:	d2800021 	mov	x1, #0x1                   	// #1
    7330:	d280003c 	mov	x28, #0x1                   	// #1
    7334:	f2a00041 	movk	x1, #0x2, lsl #16
    7338:	9ac02380 	lsl	x0, x28, x0
    733c:	f2e01001 	movk	x1, #0x80, lsl #48
    7340:	ea01001f 	tst	x0, x1
    7344:	54000e21 	b.ne	7508 <__loadlocale+0x398>  // b.any
    7348:	a94573fb 	ldp	x27, x28, [sp, #80]
    734c:	d2800014 	mov	x20, #0x0                   	// #0
    7350:	aa1403e0 	mov	x0, x20
    7354:	a94153f3 	ldp	x19, x20, [sp, #16]
    7358:	a9425bf5 	ldp	x21, x22, [sp, #32]
    735c:	a94363f7 	ldp	x23, x24, [sp, #48]
    7360:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7364:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7368:	d65f03c0 	ret
    736c:	910203f8 	add	x24, sp, #0x80
    7370:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7374:	aa1803e0 	mov	x0, x24
    7378:	910e6021 	add	x1, x1, #0x398
    737c:	52800019 	mov	w25, #0x0                   	// #0
    7380:	5280001a 	mov	w26, #0x0                   	// #0
    7384:	9400092f 	bl	9840 <strcpy>
    7388:	17ffffc1 	b	728c <__loadlocale+0x11c>
    738c:	aa1503e1 	mov	x1, x21
    7390:	aa1303e0 	mov	x0, x19
    7394:	9400092b 	bl	9840 <strcpy>
    7398:	17ffff92 	b	71e0 <__loadlocale+0x70>
    739c:	39400660 	ldrb	w0, [x19, #1]
    73a0:	5100b400 	sub	w0, w0, #0x2d
    73a4:	12001c00 	and	w0, w0, #0xff
    73a8:	7100041f 	cmp	w0, #0x1
    73ac:	54fffd08 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    73b0:	91000a75 	add	x21, x19, #0x2
    73b4:	910203f8 	add	x24, sp, #0x80
    73b8:	aa1503e1 	mov	x1, x21
    73bc:	aa1803e0 	mov	x0, x24
    73c0:	94000920 	bl	9840 <strcpy>
    73c4:	aa1803e0 	mov	x0, x24
    73c8:	52800801 	mov	w1, #0x40                  	// #64
    73cc:	9400089a 	bl	9634 <strchr>
    73d0:	b4000040 	cbz	x0, 73d8 <__loadlocale+0x268>
    73d4:	3900001f 	strb	wzr, [x0]
    73d8:	aa1803e0 	mov	x0, x24
    73dc:	940009a9 	bl	9a80 <strlen>
    73e0:	8b0002b5 	add	x21, x21, x0
    73e4:	17ffffa4 	b	7274 <__loadlocale+0x104>
    73e8:	394006a0 	ldrb	w0, [x21, #1]
    73ec:	51010400 	sub	w0, w0, #0x41
    73f0:	12001c00 	and	w0, w0, #0xff
    73f4:	7100641f 	cmp	w0, #0x19
    73f8:	54fffaa8 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    73fc:	39400aa0 	ldrb	w0, [x21, #2]
    7400:	51010400 	sub	w0, w0, #0x41
    7404:	12001c00 	and	w0, w0, #0xff
    7408:	7100641f 	cmp	w0, #0x19
    740c:	54fffa08 	b.hi	734c <__loadlocale+0x1dc>  // b.pmore
    7410:	39400ea0 	ldrb	w0, [x21, #3]
    7414:	91000eb5 	add	x21, x21, #0x3
    7418:	17ffff8d 	b	724c <__loadlocale+0xdc>
    741c:	9000003b 	adrp	x27, b000 <pow10.0+0x80>
    7420:	910f637b 	add	x27, x27, #0x3d8
    7424:	aa1b03e1 	mov	x1, x27
    7428:	aa1803e0 	mov	x0, x24
    742c:	94000849 	bl	9550 <strcasecmp>
    7430:	340000c0 	cbz	w0, 7448 <__loadlocale+0x2d8>
    7434:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7438:	aa1803e0 	mov	x0, x24
    743c:	910f8021 	add	x1, x1, #0x3e0
    7440:	94000844 	bl	9550 <strcasecmp>
    7444:	35fff820 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7448:	aa1b03e1 	mov	x1, x27
    744c:	aa1803e0 	mov	x0, x24
    7450:	940008fc 	bl	9840 <strcpy>
    7454:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    7458:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    745c:	9101c37b 	add	x27, x27, #0x70
    7460:	910c4042 	add	x2, x2, #0x310
    7464:	528000dc 	mov	w28, #0x6                   	// #6
    7468:	71000aff 	cmp	w23, #0x2
    746c:	54001b00 	b.eq	77cc <__loadlocale+0x65c>  // b.none
    7470:	71001aff 	cmp	w23, #0x6
    7474:	54000081 	b.ne	7484 <__loadlocale+0x314>  // b.any
    7478:	aa1803e1 	mov	x1, x24
    747c:	91060ac0 	add	x0, x22, #0x182
    7480:	940008f0 	bl	9840 <strcpy>
    7484:	aa1303e1 	mov	x1, x19
    7488:	aa1403e0 	mov	x0, x20
    748c:	940008ed 	bl	9840 <strcpy>
    7490:	aa0003f4 	mov	x20, x0
    7494:	aa1403e0 	mov	x0, x20
    7498:	a94153f3 	ldp	x19, x20, [sp, #16]
    749c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    74a0:	a94363f7 	ldp	x23, x24, [sp, #48]
    74a4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    74a8:	a94573fb 	ldp	x27, x28, [sp, #80]
    74ac:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    74b0:	d65f03c0 	ret
    74b4:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    74b8:	aa1803e0 	mov	x0, x24
    74bc:	91120021 	add	x1, x1, #0x480
    74c0:	d2800062 	mov	x2, #0x3                   	// #3
    74c4:	940009bf 	bl	9bc0 <strncasecmp>
    74c8:	35fff400 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    74cc:	39420fe0 	ldrb	w0, [sp, #131]
    74d0:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    74d4:	91122021 	add	x1, x1, #0x488
    74d8:	7100b41f 	cmp	w0, #0x2d
    74dc:	910283e0 	add	x0, sp, #0xa0
    74e0:	9a801400 	cinc	x0, x0, eq  // eq = none
    74e4:	d1007400 	sub	x0, x0, #0x1d
    74e8:	94000896 	bl	9740 <strcmp>
    74ec:	35fff2e0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    74f0:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    74f4:	aa1803e0 	mov	x0, x24
    74f8:	91124021 	add	x1, x1, #0x490
    74fc:	d503201f 	nop
    7500:	5280003c 	mov	w28, #0x1                   	// #1
    7504:	940008cf 	bl	9840 <strcpy>
    7508:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    750c:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    7510:	9100837b 	add	x27, x27, #0x20
    7514:	910b4042 	add	x2, x2, #0x2d0
    7518:	17ffffd4 	b	7468 <__loadlocale+0x2f8>
    751c:	9000003b 	adrp	x27, b000 <pow10.0+0x80>
    7520:	9110237b 	add	x27, x27, #0x408
    7524:	aa1b03e1 	mov	x1, x27
    7528:	aa1803e0 	mov	x0, x24
    752c:	94000809 	bl	9550 <strcasecmp>
    7530:	35fff0c0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7534:	aa1b03e1 	mov	x1, x27
    7538:	aa1803e0 	mov	x0, x24
    753c:	940008c1 	bl	9840 <strcpy>
    7540:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    7544:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    7548:	910d037b 	add	x27, x27, #0x340
    754c:	91100042 	add	x2, x2, #0x400
    7550:	5280005c 	mov	w28, #0x2                   	// #2
    7554:	17ffffc5 	b	7468 <__loadlocale+0x2f8>
    7558:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    755c:	aa1803e0 	mov	x0, x24
    7560:	9111c021 	add	x1, x1, #0x470
    7564:	940007fb 	bl	9550 <strcasecmp>
    7568:	35ffef00 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    756c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7570:	aa1803e0 	mov	x0, x24
    7574:	9111e021 	add	x1, x1, #0x478
    7578:	17ffffe2 	b	7500 <__loadlocale+0x390>
    757c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7580:	aa1803e0 	mov	x0, x24
    7584:	9110e021 	add	x1, x1, #0x438
    7588:	d2800082 	mov	x2, #0x4                   	// #4
    758c:	9400098d 	bl	9bc0 <strncasecmp>
    7590:	35ffedc0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7594:	394213e0 	ldrb	w0, [sp, #132]
    7598:	394217e1 	ldrb	w1, [sp, #133]
    759c:	7100b41f 	cmp	w0, #0x2d
    75a0:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    75a4:	121a7800 	and	w0, w0, #0xffffffdf
    75a8:	12001c00 	and	w0, w0, #0xff
    75ac:	7101481f 	cmp	w0, #0x52
    75b0:	54001aa0 	b.eq	7904 <__loadlocale+0x794>  // b.none
    75b4:	7101541f 	cmp	w0, #0x55
    75b8:	54ffec81 	b.ne	7348 <__loadlocale+0x1d8>  // b.any
    75bc:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    75c0:	aa1803e0 	mov	x0, x24
    75c4:	91112021 	add	x1, x1, #0x448
    75c8:	17ffffce 	b	7500 <__loadlocale+0x390>
    75cc:	9000003b 	adrp	x27, b000 <pow10.0+0x80>
    75d0:	910fa37b 	add	x27, x27, #0x3e8
    75d4:	aa1b03e1 	mov	x1, x27
    75d8:	aa1803e0 	mov	x0, x24
    75dc:	940007dd 	bl	9550 <strcasecmp>
    75e0:	35ffeb40 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    75e4:	aa1b03e1 	mov	x1, x27
    75e8:	aa1803e0 	mov	x0, x24
    75ec:	94000895 	bl	9840 <strcpy>
    75f0:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    75f4:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    75f8:	9115037b 	add	x27, x27, #0x540
    75fc:	91150042 	add	x2, x2, #0x540
    7600:	5280011c 	mov	w28, #0x8                   	// #8
    7604:	17ffff99 	b	7468 <__loadlocale+0x2f8>
    7608:	9000003b 	adrp	x27, b000 <pow10.0+0x80>
    760c:	910e637b 	add	x27, x27, #0x398
    7610:	aa1b03e1 	mov	x1, x27
    7614:	aa1803e0 	mov	x0, x24
    7618:	940007ce 	bl	9550 <strcasecmp>
    761c:	35ffe960 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7620:	aa1b03e1 	mov	x1, x27
    7624:	aa1803e0 	mov	x0, x24
    7628:	17ffffb6 	b	7500 <__loadlocale+0x390>
    762c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7630:	aa1803e0 	mov	x0, x24
    7634:	91114021 	add	x1, x1, #0x450
    7638:	d2800102 	mov	x2, #0x8                   	// #8
    763c:	94000961 	bl	9bc0 <strncasecmp>
    7640:	35ffe840 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7644:	394223e0 	ldrb	w0, [sp, #136]
    7648:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    764c:	91118021 	add	x1, x1, #0x460
    7650:	7100b41f 	cmp	w0, #0x2d
    7654:	910283e0 	add	x0, sp, #0xa0
    7658:	9a801400 	cinc	x0, x0, eq  // eq = none
    765c:	d1006000 	sub	x0, x0, #0x18
    7660:	940007bc 	bl	9550 <strcasecmp>
    7664:	35ffe720 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7668:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    766c:	aa1803e0 	mov	x0, x24
    7670:	9111a021 	add	x1, x1, #0x468
    7674:	17ffffa3 	b	7500 <__loadlocale+0x390>
    7678:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    767c:	aa1803e0 	mov	x0, x24
    7680:	910fc021 	add	x1, x1, #0x3f0
    7684:	d2800062 	mov	x2, #0x3                   	// #3
    7688:	9400094e 	bl	9bc0 <strncasecmp>
    768c:	35ffe5e0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7690:	39420fe0 	ldrb	w0, [sp, #131]
    7694:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7698:	910fe021 	add	x1, x1, #0x3f8
    769c:	7100b41f 	cmp	w0, #0x2d
    76a0:	910283e0 	add	x0, sp, #0xa0
    76a4:	9a801400 	cinc	x0, x0, eq  // eq = none
    76a8:	d1007400 	sub	x0, x0, #0x1d
    76ac:	940007a9 	bl	9550 <strcasecmp>
    76b0:	35ffe4c0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    76b4:	aa1803e0 	mov	x0, x24
    76b8:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    76bc:	91100021 	add	x1, x1, #0x400
    76c0:	94000860 	bl	9840 <strcpy>
    76c4:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    76c8:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    76cc:	9110437b 	add	x27, x27, #0x410
    76d0:	91124042 	add	x2, x2, #0x490
    76d4:	5280007c 	mov	w28, #0x3                   	// #3
    76d8:	17ffff64 	b	7468 <__loadlocale+0x2f8>
    76dc:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    76e0:	aa1803e0 	mov	x0, x24
    76e4:	91104021 	add	x1, x1, #0x410
    76e8:	d2800062 	mov	x2, #0x3                   	// #3
    76ec:	94000935 	bl	9bc0 <strncasecmp>
    76f0:	35ffe2c0 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    76f4:	39420fe0 	ldrb	w0, [sp, #131]
    76f8:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    76fc:	d2800082 	mov	x2, #0x4                   	// #4
    7700:	91106021 	add	x1, x1, #0x418
    7704:	7100b41f 	cmp	w0, #0x2d
    7708:	910283e0 	add	x0, sp, #0xa0
    770c:	9a80141b 	cinc	x27, x0, eq  // eq = none
    7710:	d100777b 	sub	x27, x27, #0x1d
    7714:	aa1b03e0 	mov	x0, x27
    7718:	9400092a 	bl	9bc0 <strncasecmp>
    771c:	35ffe160 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7720:	39401360 	ldrb	w0, [x27, #4]
    7724:	9101e3e1 	add	x1, sp, #0x78
    7728:	52800142 	mov	w2, #0xa                   	// #10
    772c:	7100b41f 	cmp	w0, #0x2d
    7730:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    7734:	91001000 	add	x0, x0, #0x4
    7738:	940009f2 	bl	9f00 <strtol>
    773c:	aa0003e3 	mov	x3, x0
    7740:	d1000400 	sub	x0, x0, #0x1
    7744:	f90037e3 	str	x3, [sp, #104]
    7748:	f1003c1f 	cmp	x0, #0xf
    774c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    7750:	54ffdfc0 	b.eq	7348 <__loadlocale+0x1d8>  // b.none
    7754:	f9403fe0 	ldr	x0, [sp, #120]
    7758:	39400000 	ldrb	w0, [x0]
    775c:	35ffdf60 	cbnz	w0, 7348 <__loadlocale+0x1d8>
    7760:	aa1803e0 	mov	x0, x24
    7764:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7768:	91108021 	add	x1, x1, #0x420
    776c:	94000835 	bl	9840 <strcpy>
    7770:	f94037e3 	ldr	x3, [sp, #104]
    7774:	910227e4 	add	x4, sp, #0x89
    7778:	f100287f 	cmp	x3, #0xa
    777c:	5400008d 	b.le	778c <__loadlocale+0x61c>
    7780:	91022be4 	add	x4, sp, #0x8a
    7784:	52800620 	mov	w0, #0x31                  	// #49
    7788:	390227e0 	strb	w0, [sp, #137]
    778c:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    7790:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    7794:	f28ccce1 	movk	x1, #0x6667
    7798:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    779c:	9100837b 	add	x27, x27, #0x20
    77a0:	910b4042 	add	x2, x2, #0x2d0
    77a4:	9b417c61 	smulh	x1, x3, x1
    77a8:	5280003c 	mov	w28, #0x1                   	// #1
    77ac:	3900049f 	strb	wzr, [x4, #1]
    77b0:	9342fc21 	asr	x1, x1, #2
    77b4:	cb83fc21 	sub	x1, x1, x3, asr #63
    77b8:	8b010821 	add	x1, x1, x1, lsl #2
    77bc:	cb010460 	sub	x0, x3, x1, lsl #1
    77c0:	1100c000 	add	w0, w0, #0x30
    77c4:	39000080 	strb	w0, [x4]
    77c8:	17ffff28 	b	7468 <__loadlocale+0x2f8>
    77cc:	aa1803e1 	mov	x1, x24
    77d0:	91058ac0 	add	x0, x22, #0x162
    77d4:	f90037e2 	str	x2, [sp, #104]
    77d8:	9400081a 	bl	9840 <strcpy>
    77dc:	f94037e2 	ldr	x2, [sp, #104]
    77e0:	a90e6ec2 	stp	x2, x27, [x22, #224]
    77e4:	aa1803e1 	mov	x1, x24
    77e8:	390582dc 	strb	w28, [x22, #352]
    77ec:	aa1603e0 	mov	x0, x22
    77f0:	94000bb0 	bl	a6b0 <__set_ctype>
    77f4:	35000139 	cbnz	w25, 7818 <__loadlocale+0x6a8>
    77f8:	7100079f 	cmp	w28, #0x1
    77fc:	520002b5 	eor	w21, w21, #0x1
    7800:	1a9fd7e0 	cset	w0, gt
    7804:	6a0002bf 	tst	w21, w0
    7808:	54000080 	b.eq	7818 <__loadlocale+0x6a8>  // b.none
    780c:	394203e0 	ldrb	w0, [sp, #128]
    7810:	7101541f 	cmp	w0, #0x55
    7814:	1a9f07f9 	cset	w25, ne  // ne = any
    7818:	7100035f 	cmp	w26, #0x0
    781c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    7820:	b900f2d9 	str	w25, [x22, #240]
    7824:	17ffff18 	b	7484 <__loadlocale+0x314>
    7828:	910006b5 	add	x21, x21, #0x1
    782c:	17fffee2 	b	73b4 <__loadlocale+0x244>
    7830:	a90573fb 	stp	x27, x28, [sp, #80]
    7834:	910006bb 	add	x27, x21, #0x1
    7838:	aa1b03e0 	mov	x0, x27
    783c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7840:	52800019 	mov	w25, #0x0                   	// #0
    7844:	910ec021 	add	x1, x1, #0x3b0
    7848:	5280003a 	mov	w26, #0x1                   	// #1
    784c:	940007bd 	bl	9740 <strcmp>
    7850:	2a0003f5 	mov	w21, w0
    7854:	35000060 	cbnz	w0, 7860 <__loadlocale+0x6f0>
    7858:	a94573fb 	ldp	x27, x28, [sp, #80]
    785c:	17fffe8c 	b	728c <__loadlocale+0x11c>
    7860:	aa1b03e0 	mov	x0, x27
    7864:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7868:	5280001a 	mov	w26, #0x0                   	// #0
    786c:	910f0021 	add	x1, x1, #0x3c0
    7870:	52800035 	mov	w21, #0x1                   	// #1
    7874:	940007b3 	bl	9740 <strcmp>
    7878:	2a0003f9 	mov	w25, w0
    787c:	34fffee0 	cbz	w0, 7858 <__loadlocale+0x6e8>
    7880:	aa1b03e0 	mov	x0, x27
    7884:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7888:	910f4021 	add	x1, x1, #0x3d0
    788c:	940007ad 	bl	9740 <strcmp>
    7890:	7100001f 	cmp	w0, #0x0
    7894:	52800015 	mov	w21, #0x0                   	// #0
    7898:	1a9f17f9 	cset	w25, eq  // eq = none
    789c:	a94573fb 	ldp	x27, x28, [sp, #80]
    78a0:	17fffe7b 	b	728c <__loadlocale+0x11c>
    78a4:	d10d4800 	sub	x0, x0, #0x352
    78a8:	d280003c 	mov	x28, #0x1                   	// #1
    78ac:	d28234a1 	mov	x1, #0x11a5                	// #4517
    78b0:	f2a00021 	movk	x1, #0x1, lsl #16
    78b4:	9ac02380 	lsl	x0, x28, x0
    78b8:	ea01001f 	tst	x0, x1
    78bc:	54ffe261 	b.ne	7508 <__loadlocale+0x398>  // b.any
    78c0:	a94573fb 	ldp	x27, x28, [sp, #80]
    78c4:	17fffea2 	b	734c <__loadlocale+0x1dc>
    78c8:	f10da81f 	cmp	x0, #0x36a
    78cc:	54ffd3e1 	b.ne	7348 <__loadlocale+0x1d8>  // b.any
    78d0:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    78d4:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    78d8:	9100837b 	add	x27, x27, #0x20
    78dc:	910b4042 	add	x2, x2, #0x2d0
    78e0:	5280003c 	mov	w28, #0x1                   	// #1
    78e4:	17fffee1 	b	7468 <__loadlocale+0x2f8>
    78e8:	f111941f 	cmp	x0, #0x465
    78ec:	54ffff20 	b.eq	78d0 <__loadlocale+0x760>  // b.none
    78f0:	d1138800 	sub	x0, x0, #0x4e2
    78f4:	f100201f 	cmp	x0, #0x8
    78f8:	54fffec9 	b.ls	78d0 <__loadlocale+0x760>  // b.plast
    78fc:	a94573fb 	ldp	x27, x28, [sp, #80]
    7900:	17fffe93 	b	734c <__loadlocale+0x1dc>
    7904:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7908:	aa1803e0 	mov	x0, x24
    790c:	91110021 	add	x1, x1, #0x440
    7910:	17fffefc 	b	7500 <__loadlocale+0x390>
    7914:	b000001b 	adrp	x27, 8000 <__swhatbuf_r+0xa0>
    7918:	f0000002 	adrp	x2, a000 <__swbuf_r+0xb0>
    791c:	910d037b 	add	x27, x27, #0x340
    7920:	91100042 	add	x2, x2, #0x400
    7924:	5280005c 	mov	w28, #0x2                   	// #2
    7928:	17fffed0 	b	7468 <__loadlocale+0x2f8>
    792c:	d503201f 	nop

0000000000007930 <__get_locale_env>:
    7930:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7934:	910003fd 	mov	x29, sp
    7938:	a90153f3 	stp	x19, x20, [sp, #16]
    793c:	2a0103f4 	mov	w20, w1
    7940:	aa0003f3 	mov	x19, x0
    7944:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7948:	91142021 	add	x1, x1, #0x508
    794c:	94000c19 	bl	a9b0 <_getenv_r>
    7950:	b4000060 	cbz	x0, 795c <__get_locale_env+0x2c>
    7954:	39400001 	ldrb	w1, [x0]
    7958:	35000201 	cbnz	w1, 7998 <__get_locale_env+0x68>
    795c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7960:	911c8021 	add	x1, x1, #0x720
    7964:	aa1303e0 	mov	x0, x19
    7968:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    796c:	94000c11 	bl	a9b0 <_getenv_r>
    7970:	b4000060 	cbz	x0, 797c <__get_locale_env+0x4c>
    7974:	39400001 	ldrb	w1, [x0]
    7978:	35000101 	cbnz	w1, 7998 <__get_locale_env+0x68>
    797c:	90000021 	adrp	x1, b000 <pow10.0+0x80>
    7980:	aa1303e0 	mov	x0, x19
    7984:	91144021 	add	x1, x1, #0x510
    7988:	94000c0a 	bl	a9b0 <_getenv_r>
    798c:	b50000c0 	cbnz	x0, 79a4 <__get_locale_env+0x74>
    7990:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    7994:	91028000 	add	x0, x0, #0xa0
    7998:	a94153f3 	ldp	x19, x20, [sp, #16]
    799c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    79a0:	d65f03c0 	ret
    79a4:	39400001 	ldrb	w1, [x0]
    79a8:	35ffff81 	cbnz	w1, 7998 <__get_locale_env+0x68>
    79ac:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    79b0:	91028000 	add	x0, x0, #0xa0
    79b4:	17fffff9 	b	7998 <__get_locale_env+0x68>
    79b8:	d503201f 	nop
    79bc:	d503201f 	nop

00000000000079c0 <_setlocale_r.part.0>:
    79c0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    79c4:	910003fd 	mov	x29, sp
    79c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    79cc:	d0000035 	adrp	x21, d000 <__malloc_av_+0x780>
    79d0:	d0000036 	adrp	x22, d000 <__malloc_av_+0x780>
    79d4:	911062b5 	add	x21, x21, #0x418
    79d8:	910302d6 	add	x22, x22, #0xc0
    79dc:	a90153f3 	stp	x19, x20, [sp, #16]
    79e0:	910082d4 	add	x20, x22, #0x20
    79e4:	a9046bf9 	stp	x25, x26, [sp, #64]
    79e8:	910082b9 	add	x25, x21, #0x20
    79ec:	aa0003fa 	mov	x26, x0
    79f0:	aa1903f3 	mov	x19, x25
    79f4:	a90363f7 	stp	x23, x24, [sp, #48]
    79f8:	aa0203f8 	mov	x24, x2
    79fc:	910382b7 	add	x23, x21, #0xe0
    7a00:	a90573fb 	stp	x27, x28, [sp, #80]
    7a04:	2a0103fc 	mov	w28, w1
    7a08:	aa1403fb 	mov	x27, x20
    7a0c:	d503201f 	nop
    7a10:	aa1b03e1 	mov	x1, x27
    7a14:	aa1303e0 	mov	x0, x19
    7a18:	91008273 	add	x19, x19, #0x20
    7a1c:	94000789 	bl	9840 <strcpy>
    7a20:	9100837b 	add	x27, x27, #0x20
    7a24:	eb17027f 	cmp	x19, x23
    7a28:	54ffff41 	b.ne	7a10 <_setlocale_r.part.0+0x50>  // b.any
    7a2c:	39400300 	ldrb	w0, [x24]
    7a30:	350005e0 	cbnz	w0, 7aec <_setlocale_r.part.0+0x12c>
    7a34:	35000edc 	cbnz	w28, 7c0c <_setlocale_r.part.0+0x24c>
    7a38:	aa1903f7 	mov	x23, x25
    7a3c:	52800033 	mov	w19, #0x1                   	// #1
    7a40:	2a1303e1 	mov	w1, w19
    7a44:	aa1a03e0 	mov	x0, x26
    7a48:	97ffffba 	bl	7930 <__get_locale_env>
    7a4c:	aa0003f5 	mov	x21, x0
    7a50:	11000673 	add	w19, w19, #0x1
    7a54:	9400080b 	bl	9a80 <strlen>
    7a58:	aa0003e2 	mov	x2, x0
    7a5c:	aa1503e1 	mov	x1, x21
    7a60:	aa1703e0 	mov	x0, x23
    7a64:	f1007c5f 	cmp	x2, #0x1f
    7a68:	54000be8 	b.hi	7be4 <_setlocale_r.part.0+0x224>  // b.pmore
    7a6c:	910082f7 	add	x23, x23, #0x20
    7a70:	94000774 	bl	9840 <strcpy>
    7a74:	71001e7f 	cmp	w19, #0x7
    7a78:	54fffe41 	b.ne	7a40 <_setlocale_r.part.0+0x80>  // b.any
    7a7c:	d0000038 	adrp	x24, d000 <__malloc_av_+0x780>
    7a80:	9113e318 	add	x24, x24, #0x4f8
    7a84:	91008318 	add	x24, x24, #0x20
    7a88:	aa1903f7 	mov	x23, x25
    7a8c:	aa1803f5 	mov	x21, x24
    7a90:	52800033 	mov	w19, #0x1                   	// #1
    7a94:	d503201f 	nop
    7a98:	aa1403e1 	mov	x1, x20
    7a9c:	aa1503e0 	mov	x0, x21
    7aa0:	94000768 	bl	9840 <strcpy>
    7aa4:	aa1703e2 	mov	x2, x23
    7aa8:	2a1303e1 	mov	w1, w19
    7aac:	aa1603e0 	mov	x0, x22
    7ab0:	97fffdb0 	bl	7170 <__loadlocale>
    7ab4:	b4000c60 	cbz	x0, 7c40 <_setlocale_r.part.0+0x280>
    7ab8:	11000673 	add	w19, w19, #0x1
    7abc:	910082b5 	add	x21, x21, #0x20
    7ac0:	91008294 	add	x20, x20, #0x20
    7ac4:	910082f7 	add	x23, x23, #0x20
    7ac8:	71001e7f 	cmp	w19, #0x7
    7acc:	54fffe61 	b.ne	7a98 <_setlocale_r.part.0+0xd8>  // b.any
    7ad0:	a94153f3 	ldp	x19, x20, [sp, #16]
    7ad4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7ad8:	a94363f7 	ldp	x23, x24, [sp, #48]
    7adc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7ae0:	a94573fb 	ldp	x27, x28, [sp, #80]
    7ae4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7ae8:	17fffd72 	b	70b0 <currentlocale>
    7aec:	3500057c 	cbnz	w28, 7b98 <_setlocale_r.part.0+0x1d8>
    7af0:	aa1803e0 	mov	x0, x24
    7af4:	528005e1 	mov	w1, #0x2f                  	// #47
    7af8:	940006cf 	bl	9634 <strchr>
    7afc:	aa0003f3 	mov	x19, x0
    7b00:	b5000060 	cbnz	x0, 7b0c <_setlocale_r.part.0+0x14c>
    7b04:	14000085 	b	7d18 <_setlocale_r.part.0+0x358>
    7b08:	91000673 	add	x19, x19, #0x1
    7b0c:	39400660 	ldrb	w0, [x19, #1]
    7b10:	7100bc1f 	cmp	w0, #0x2f
    7b14:	54ffffa0 	b.eq	7b08 <_setlocale_r.part.0+0x148>  // b.none
    7b18:	34000660 	cbz	w0, 7be4 <_setlocale_r.part.0+0x224>
    7b1c:	aa1903fb 	mov	x27, x25
    7b20:	52800037 	mov	w23, #0x1                   	// #1
    7b24:	cb180262 	sub	x2, x19, x24
    7b28:	71007c5f 	cmp	w2, #0x1f
    7b2c:	540005cc 	b.gt	7be4 <_setlocale_r.part.0+0x224>
    7b30:	11000442 	add	w2, w2, #0x1
    7b34:	aa1803e1 	mov	x1, x24
    7b38:	aa1b03e0 	mov	x0, x27
    7b3c:	110006f7 	add	w23, w23, #0x1
    7b40:	93407c42 	sxtw	x2, w2
    7b44:	940007af 	bl	9a00 <strlcpy>
    7b48:	39400260 	ldrb	w0, [x19]
    7b4c:	7100bc1f 	cmp	w0, #0x2f
    7b50:	540000a1 	b.ne	7b64 <_setlocale_r.part.0+0x1a4>  // b.any
    7b54:	d503201f 	nop
    7b58:	38401e60 	ldrb	w0, [x19, #1]!
    7b5c:	7100bc1f 	cmp	w0, #0x2f
    7b60:	54ffffc0 	b.eq	7b58 <_setlocale_r.part.0+0x198>  // b.none
    7b64:	34000c00 	cbz	w0, 7ce4 <_setlocale_r.part.0+0x324>
    7b68:	aa1303e1 	mov	x1, x19
    7b6c:	d503201f 	nop
    7b70:	38401c20 	ldrb	w0, [x1, #1]!
    7b74:	7100bc1f 	cmp	w0, #0x2f
    7b78:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    7b7c:	54ffffa1 	b.ne	7b70 <_setlocale_r.part.0+0x1b0>  // b.any
    7b80:	9100837b 	add	x27, x27, #0x20
    7b84:	71001eff 	cmp	w23, #0x7
    7b88:	54fff7a0 	b.eq	7a7c <_setlocale_r.part.0+0xbc>  // b.none
    7b8c:	aa1303f8 	mov	x24, x19
    7b90:	aa0103f3 	mov	x19, x1
    7b94:	17ffffe4 	b	7b24 <_setlocale_r.part.0+0x164>
    7b98:	aa1803e0 	mov	x0, x24
    7b9c:	940007b9 	bl	9a80 <strlen>
    7ba0:	f1007c1f 	cmp	x0, #0x1f
    7ba4:	54000208 	b.hi	7be4 <_setlocale_r.part.0+0x224>  // b.pmore
    7ba8:	937b7f80 	sbfiz	x0, x28, #5, #32
    7bac:	aa1803e1 	mov	x1, x24
    7bb0:	8b0002b5 	add	x21, x21, x0
    7bb4:	aa1503e0 	mov	x0, x21
    7bb8:	94000722 	bl	9840 <strcpy>
    7bbc:	aa1503e2 	mov	x2, x21
    7bc0:	2a1c03e1 	mov	w1, w28
    7bc4:	aa1603e0 	mov	x0, x22
    7bc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    7bcc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7bd0:	a94363f7 	ldp	x23, x24, [sp, #48]
    7bd4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7bd8:	a94573fb 	ldp	x27, x28, [sp, #80]
    7bdc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7be0:	17fffd64 	b	7170 <__loadlocale>
    7be4:	528002c0 	mov	w0, #0x16                  	// #22
    7be8:	b9000340 	str	w0, [x26]
    7bec:	d2800000 	mov	x0, #0x0                   	// #0
    7bf0:	a94153f3 	ldp	x19, x20, [sp, #16]
    7bf4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7bf8:	a94363f7 	ldp	x23, x24, [sp, #48]
    7bfc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7c00:	a94573fb 	ldp	x27, x28, [sp, #80]
    7c04:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7c08:	d65f03c0 	ret
    7c0c:	2a1c03e1 	mov	w1, w28
    7c10:	aa1a03e0 	mov	x0, x26
    7c14:	97ffff47 	bl	7930 <__get_locale_env>
    7c18:	aa0003f3 	mov	x19, x0
    7c1c:	94000799 	bl	9a80 <strlen>
    7c20:	f1007c1f 	cmp	x0, #0x1f
    7c24:	54fffe08 	b.hi	7be4 <_setlocale_r.part.0+0x224>  // b.pmore
    7c28:	937b7f80 	sbfiz	x0, x28, #5, #32
    7c2c:	aa1303e1 	mov	x1, x19
    7c30:	8b0002b5 	add	x21, x21, x0
    7c34:	aa1503e0 	mov	x0, x21
    7c38:	94000702 	bl	9840 <strcpy>
    7c3c:	17ffffe0 	b	7bbc <_setlocale_r.part.0+0x1fc>
    7c40:	90000020 	adrp	x0, b000 <pow10.0+0x80>
    7c44:	b9400357 	ldr	w23, [x26]
    7c48:	910e4015 	add	x21, x0, #0x390
    7c4c:	52800034 	mov	w20, #0x1                   	// #1
    7c50:	6b14027f 	cmp	w19, w20
    7c54:	540000e1 	b.ne	7c70 <_setlocale_r.part.0+0x2b0>  // b.any
    7c58:	1400001a 	b	7cc0 <_setlocale_r.part.0+0x300>
    7c5c:	11000694 	add	w20, w20, #0x1
    7c60:	91008339 	add	x25, x25, #0x20
    7c64:	91008318 	add	x24, x24, #0x20
    7c68:	6b14027f 	cmp	w19, w20
    7c6c:	540002a0 	b.eq	7cc0 <_setlocale_r.part.0+0x300>  // b.none
    7c70:	aa1803e1 	mov	x1, x24
    7c74:	aa1903e0 	mov	x0, x25
    7c78:	940006f2 	bl	9840 <strcpy>
    7c7c:	aa1903e2 	mov	x2, x25
    7c80:	2a1403e1 	mov	w1, w20
    7c84:	aa1603e0 	mov	x0, x22
    7c88:	97fffd3a 	bl	7170 <__loadlocale>
    7c8c:	b5fffe80 	cbnz	x0, 7c5c <_setlocale_r.part.0+0x29c>
    7c90:	aa1503e1 	mov	x1, x21
    7c94:	aa1903e0 	mov	x0, x25
    7c98:	940006ea 	bl	9840 <strcpy>
    7c9c:	91008318 	add	x24, x24, #0x20
    7ca0:	aa1903e2 	mov	x2, x25
    7ca4:	2a1403e1 	mov	w1, w20
    7ca8:	aa1603e0 	mov	x0, x22
    7cac:	11000694 	add	w20, w20, #0x1
    7cb0:	97fffd30 	bl	7170 <__loadlocale>
    7cb4:	91008339 	add	x25, x25, #0x20
    7cb8:	6b14027f 	cmp	w19, w20
    7cbc:	54fffda1 	b.ne	7c70 <_setlocale_r.part.0+0x2b0>  // b.any
    7cc0:	b9000357 	str	w23, [x26]
    7cc4:	d2800000 	mov	x0, #0x0                   	// #0
    7cc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    7ccc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7cd0:	a94363f7 	ldp	x23, x24, [sp, #48]
    7cd4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7cd8:	a94573fb 	ldp	x27, x28, [sp, #80]
    7cdc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7ce0:	d65f03c0 	ret
    7ce4:	71001eff 	cmp	w23, #0x7
    7ce8:	54ffeca0 	b.eq	7a7c <_setlocale_r.part.0+0xbc>  // b.none
    7cec:	937b7ee0 	sbfiz	x0, x23, #5, #32
    7cf0:	8b0002b5 	add	x21, x21, x0
    7cf4:	d503201f 	nop
    7cf8:	d10082a1 	sub	x1, x21, #0x20
    7cfc:	aa1503e0 	mov	x0, x21
    7d00:	110006f7 	add	w23, w23, #0x1
    7d04:	940006cf 	bl	9840 <strcpy>
    7d08:	910082b5 	add	x21, x21, #0x20
    7d0c:	71001eff 	cmp	w23, #0x7
    7d10:	54ffff41 	b.ne	7cf8 <_setlocale_r.part.0+0x338>  // b.any
    7d14:	17ffff5a 	b	7a7c <_setlocale_r.part.0+0xbc>
    7d18:	aa1803e0 	mov	x0, x24
    7d1c:	94000759 	bl	9a80 <strlen>
    7d20:	f1007c1f 	cmp	x0, #0x1f
    7d24:	54fff608 	b.hi	7be4 <_setlocale_r.part.0+0x224>  // b.pmore
    7d28:	aa1903f3 	mov	x19, x25
    7d2c:	d503201f 	nop
    7d30:	aa1303e0 	mov	x0, x19
    7d34:	aa1803e1 	mov	x1, x24
    7d38:	91008273 	add	x19, x19, #0x20
    7d3c:	940006c1 	bl	9840 <strcpy>
    7d40:	eb1302ff 	cmp	x23, x19
    7d44:	54ffff61 	b.ne	7d30 <_setlocale_r.part.0+0x370>  // b.any
    7d48:	17ffff4d 	b	7a7c <_setlocale_r.part.0+0xbc>
    7d4c:	d503201f 	nop

0000000000007d50 <_setlocale_r>:
    7d50:	aa0003e5 	mov	x5, x0
    7d54:	7100183f 	cmp	w1, #0x6
    7d58:	54000068 	b.hi	7d64 <_setlocale_r+0x14>  // b.pmore
    7d5c:	b40000c2 	cbz	x2, 7d74 <_setlocale_r+0x24>
    7d60:	17ffff18 	b	79c0 <_setlocale_r.part.0>
    7d64:	528002c1 	mov	w1, #0x16                  	// #22
    7d68:	d2800000 	mov	x0, #0x0                   	// #0
    7d6c:	b90000a1 	str	w1, [x5]
    7d70:	d65f03c0 	ret
    7d74:	340000c1 	cbz	w1, 7d8c <_setlocale_r+0x3c>
    7d78:	937b7c23 	sbfiz	x3, x1, #5, #32
    7d7c:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    7d80:	91030000 	add	x0, x0, #0xc0
    7d84:	8b030000 	add	x0, x0, x3
    7d88:	d65f03c0 	ret
    7d8c:	17fffcc9 	b	70b0 <currentlocale>

0000000000007d90 <__locale_mb_cur_max>:
    7d90:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    7d94:	39488000 	ldrb	w0, [x0, #544]
    7d98:	d65f03c0 	ret
    7d9c:	d503201f 	nop

0000000000007da0 <setlocale>:
    7da0:	b0000024 	adrp	x4, c000 <IpcTestNull+0x6e8>
    7da4:	2a0003e3 	mov	w3, w0
    7da8:	aa0103e2 	mov	x2, x1
    7dac:	f9409880 	ldr	x0, [x4, #304]
    7db0:	7100187f 	cmp	w3, #0x6
    7db4:	54000088 	b.hi	7dc4 <setlocale+0x24>  // b.pmore
    7db8:	b4000101 	cbz	x1, 7dd8 <setlocale+0x38>
    7dbc:	2a0303e1 	mov	w1, w3
    7dc0:	17ffff00 	b	79c0 <_setlocale_r.part.0>
    7dc4:	528002c1 	mov	w1, #0x16                  	// #22
    7dc8:	d2800003 	mov	x3, #0x0                   	// #0
    7dcc:	b9000001 	str	w1, [x0]
    7dd0:	aa0303e0 	mov	x0, x3
    7dd4:	d65f03c0 	ret
    7dd8:	340000e3 	cbz	w3, 7df4 <setlocale+0x54>
    7ddc:	937b7c63 	sbfiz	x3, x3, #5, #32
    7de0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x780>
    7de4:	91030000 	add	x0, x0, #0xc0
    7de8:	8b030003 	add	x3, x0, x3
    7dec:	aa0303e0 	mov	x0, x3
    7df0:	d65f03c0 	ret
    7df4:	17fffcaf 	b	70b0 <currentlocale>
    7df8:	d503201f 	nop
    7dfc:	d503201f 	nop

0000000000007e00 <__smakebuf_r>:
    7e00:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    7e04:	910003fd 	mov	x29, sp
    7e08:	79402022 	ldrh	w2, [x1, #16]
    7e0c:	a90153f3 	stp	x19, x20, [sp, #16]
    7e10:	aa0103f3 	mov	x19, x1
    7e14:	36080122 	tbz	w2, #1, 7e38 <__smakebuf_r+0x38>
    7e18:	9101dc20 	add	x0, x1, #0x77
    7e1c:	52800021 	mov	w1, #0x1                   	// #1
    7e20:	f9000260 	str	x0, [x19]
    7e24:	f9000e60 	str	x0, [x19, #24]
    7e28:	b9002261 	str	w1, [x19, #32]
    7e2c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7e30:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    7e34:	d65f03c0 	ret
    7e38:	79c02421 	ldrsh	w1, [x1, #18]
    7e3c:	aa0003f4 	mov	x20, x0
    7e40:	a9025bf5 	stp	x21, x22, [sp, #32]
    7e44:	f9001bf7 	str	x23, [sp, #48]
    7e48:	37f80381 	tbnz	w1, #31, 7eb8 <__smakebuf_r+0xb8>
    7e4c:	910123e2 	add	x2, sp, #0x48
    7e50:	94000a84 	bl	a860 <_fstat_r>
    7e54:	37f80300 	tbnz	w0, #31, 7eb4 <__smakebuf_r+0xb4>
    7e58:	b9404fe0 	ldr	w0, [sp, #76]
    7e5c:	d2808016 	mov	x22, #0x400                 	// #1024
    7e60:	52810015 	mov	w21, #0x800                 	// #2048
    7e64:	aa1603e1 	mov	x1, x22
    7e68:	12140c00 	and	w0, w0, #0xf000
    7e6c:	7140081f 	cmp	w0, #0x2, lsl #12
    7e70:	aa1403e0 	mov	x0, x20
    7e74:	1a9f17f7 	cset	w23, eq  // eq = none
    7e78:	97ffec72 	bl	3040 <_malloc_r>
    7e7c:	b5000320 	cbnz	x0, 7ee0 <__smakebuf_r+0xe0>
    7e80:	79c02260 	ldrsh	w0, [x19, #16]
    7e84:	374805c0 	tbnz	w0, #9, 7f3c <__smakebuf_r+0x13c>
    7e88:	121e7400 	and	w0, w0, #0xfffffffc
    7e8c:	9101de61 	add	x1, x19, #0x77
    7e90:	321f0000 	orr	w0, w0, #0x2
    7e94:	52800022 	mov	w2, #0x1                   	// #1
    7e98:	79002260 	strh	w0, [x19, #16]
    7e9c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7ea0:	f9401bf7 	ldr	x23, [sp, #48]
    7ea4:	f9000261 	str	x1, [x19]
    7ea8:	f9000e61 	str	x1, [x19, #24]
    7eac:	b9002262 	str	w2, [x19, #32]
    7eb0:	17ffffdf 	b	7e2c <__smakebuf_r+0x2c>
    7eb4:	79402262 	ldrh	w2, [x19, #16]
    7eb8:	f279005f 	tst	x2, #0x80
    7ebc:	d2808001 	mov	x1, #0x400                 	// #1024
    7ec0:	d2800816 	mov	x22, #0x40                  	// #64
    7ec4:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    7ec8:	aa1603e1 	mov	x1, x22
    7ecc:	aa1403e0 	mov	x0, x20
    7ed0:	52800017 	mov	w23, #0x0                   	// #0
    7ed4:	52800015 	mov	w21, #0x0                   	// #0
    7ed8:	97ffec5a 	bl	3040 <_malloc_r>
    7edc:	b4fffd20 	cbz	x0, 7e80 <__smakebuf_r+0x80>
    7ee0:	79c02262 	ldrsh	w2, [x19, #16]
    7ee4:	f0ffffe1 	adrp	x1, 6000 <__sflush_r+0x200>
    7ee8:	91048021 	add	x1, x1, #0x120
    7eec:	f9002e81 	str	x1, [x20, #88]
    7ef0:	32190042 	orr	w2, w2, #0x80
    7ef4:	f9000260 	str	x0, [x19]
    7ef8:	79002262 	strh	w2, [x19, #16]
    7efc:	f9000e60 	str	x0, [x19, #24]
    7f00:	b9002276 	str	w22, [x19, #32]
    7f04:	35000117 	cbnz	w23, 7f24 <__smakebuf_r+0x124>
    7f08:	2a150042 	orr	w2, w2, w21
    7f0c:	79002262 	strh	w2, [x19, #16]
    7f10:	a94153f3 	ldp	x19, x20, [sp, #16]
    7f14:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f18:	f9401bf7 	ldr	x23, [sp, #48]
    7f1c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    7f20:	d65f03c0 	ret
    7f24:	79c02661 	ldrsh	w1, [x19, #18]
    7f28:	aa1403e0 	mov	x0, x20
    7f2c:	94000aa9 	bl	a9d0 <_isatty_r>
    7f30:	350000c0 	cbnz	w0, 7f48 <__smakebuf_r+0x148>
    7f34:	79c02262 	ldrsh	w2, [x19, #16]
    7f38:	17fffff4 	b	7f08 <__smakebuf_r+0x108>
    7f3c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f40:	f9401bf7 	ldr	x23, [sp, #48]
    7f44:	17ffffba 	b	7e2c <__smakebuf_r+0x2c>
    7f48:	79402262 	ldrh	w2, [x19, #16]
    7f4c:	121e7442 	and	w2, w2, #0xfffffffc
    7f50:	32000042 	orr	w2, w2, #0x1
    7f54:	13003c42 	sxth	w2, w2
    7f58:	17ffffec 	b	7f08 <__smakebuf_r+0x108>
    7f5c:	d503201f 	nop

0000000000007f60 <__swhatbuf_r>:
    7f60:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    7f64:	910003fd 	mov	x29, sp
    7f68:	a90153f3 	stp	x19, x20, [sp, #16]
    7f6c:	aa0103f3 	mov	x19, x1
    7f70:	79c02421 	ldrsh	w1, [x1, #18]
    7f74:	f90013f5 	str	x21, [sp, #32]
    7f78:	aa0203f4 	mov	x20, x2
    7f7c:	aa0303f5 	mov	x21, x3
    7f80:	37f80201 	tbnz	w1, #31, 7fc0 <__swhatbuf_r+0x60>
    7f84:	9100e3e2 	add	x2, sp, #0x38
    7f88:	94000a36 	bl	a860 <_fstat_r>
    7f8c:	37f801a0 	tbnz	w0, #31, 7fc0 <__swhatbuf_r+0x60>
    7f90:	b9403fe1 	ldr	w1, [sp, #60]
    7f94:	d2808002 	mov	x2, #0x400                 	// #1024
    7f98:	52810000 	mov	w0, #0x800                 	// #2048
    7f9c:	12140c21 	and	w1, w1, #0xf000
    7fa0:	7140083f 	cmp	w1, #0x2, lsl #12
    7fa4:	1a9f17e1 	cset	w1, eq  // eq = none
    7fa8:	b90002a1 	str	w1, [x21]
    7fac:	f9000282 	str	x2, [x20]
    7fb0:	a94153f3 	ldp	x19, x20, [sp, #16]
    7fb4:	f94013f5 	ldr	x21, [sp, #32]
    7fb8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7fbc:	d65f03c0 	ret
    7fc0:	79c02260 	ldrsh	w0, [x19, #16]
    7fc4:	b90002bf 	str	wzr, [x21]
    7fc8:	36380100 	tbz	w0, #7, 7fe8 <__swhatbuf_r+0x88>
    7fcc:	d2800801 	mov	x1, #0x40                  	// #64
    7fd0:	f9000281 	str	x1, [x20]
    7fd4:	52800000 	mov	w0, #0x0                   	// #0
    7fd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    7fdc:	f94013f5 	ldr	x21, [sp, #32]
    7fe0:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7fe4:	d65f03c0 	ret
    7fe8:	d2808001 	mov	x1, #0x400                 	// #1024
    7fec:	f9000281 	str	x1, [x20]
    7ff0:	52800000 	mov	w0, #0x0                   	// #0
    7ff4:	a94153f3 	ldp	x19, x20, [sp, #16]
    7ff8:	f94013f5 	ldr	x21, [sp, #32]
    7ffc:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8000:	d65f03c0 	ret
    8004:	d503201f 	nop
    8008:	d503201f 	nop
    800c:	d503201f 	nop

0000000000008010 <_mbtowc_r>:
    8010:	b0000025 	adrp	x5, d000 <__malloc_av_+0x780>
    8014:	f940d4a5 	ldr	x5, [x5, #424]
    8018:	aa0503f0 	mov	x16, x5
    801c:	d61f0200 	br	x16

0000000000008020 <__ascii_mbtowc>:
    8020:	d10043ff 	sub	sp, sp, #0x10
    8024:	f100003f 	cmp	x1, #0x0
    8028:	910033e0 	add	x0, sp, #0xc
    802c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    8030:	b4000122 	cbz	x2, 8054 <__ascii_mbtowc+0x34>
    8034:	b4000163 	cbz	x3, 8060 <__ascii_mbtowc+0x40>
    8038:	39400040 	ldrb	w0, [x2]
    803c:	b9000020 	str	w0, [x1]
    8040:	39400040 	ldrb	w0, [x2]
    8044:	7100001f 	cmp	w0, #0x0
    8048:	1a9f07e0 	cset	w0, ne  // ne = any
    804c:	910043ff 	add	sp, sp, #0x10
    8050:	d65f03c0 	ret
    8054:	52800000 	mov	w0, #0x0                   	// #0
    8058:	910043ff 	add	sp, sp, #0x10
    805c:	d65f03c0 	ret
    8060:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8064:	17fffffa 	b	804c <__ascii_mbtowc+0x2c>
    8068:	d503201f 	nop
    806c:	d503201f 	nop

0000000000008070 <__utf8_mbtowc>:
    8070:	d10043ff 	sub	sp, sp, #0x10
    8074:	f100003f 	cmp	x1, #0x0
    8078:	910033e5 	add	x5, sp, #0xc
    807c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8080:	b4000a02 	cbz	x2, 81c0 <__utf8_mbtowc+0x150>
    8084:	b40012a3 	cbz	x3, 82d8 <__utf8_mbtowc+0x268>
    8088:	b9400086 	ldr	w6, [x4]
    808c:	aa0003e8 	mov	x8, x0
    8090:	350003c6 	cbnz	w6, 8108 <__utf8_mbtowc+0x98>
    8094:	39400040 	ldrb	w0, [x2]
    8098:	52800025 	mov	w5, #0x1                   	// #1
    809c:	340003c0 	cbz	w0, 8114 <__utf8_mbtowc+0xa4>
    80a0:	7101fc1f 	cmp	w0, #0x7f
    80a4:	5400084d 	b.le	81ac <__utf8_mbtowc+0x13c>
    80a8:	51030007 	sub	w7, w0, #0xc0
    80ac:	71007cff 	cmp	w7, #0x1f
    80b0:	540003a8 	b.hi	8124 <__utf8_mbtowc+0xb4>  // b.pmore
    80b4:	39001080 	strb	w0, [x4, #4]
    80b8:	350000a6 	cbnz	w6, 80cc <__utf8_mbtowc+0x5c>
    80bc:	52800026 	mov	w6, #0x1                   	// #1
    80c0:	b9000086 	str	w6, [x4]
    80c4:	f100047f 	cmp	x3, #0x1
    80c8:	54001080 	b.eq	82d8 <__utf8_mbtowc+0x268>  // b.none
    80cc:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    80d0:	110004a5 	add	w5, w5, #0x1
    80d4:	51020043 	sub	w3, w2, #0x80
    80d8:	7100fc7f 	cmp	w3, #0x3f
    80dc:	54001068 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    80e0:	7103041f 	cmp	w0, #0xc1
    80e4:	5400102d 	b.le	82e8 <__utf8_mbtowc+0x278>
    80e8:	531a1000 	ubfiz	w0, w0, #6, #5
    80ec:	12001442 	and	w2, w2, #0x3f
    80f0:	b900009f 	str	wzr, [x4]
    80f4:	2a020002 	orr	w2, w0, w2
    80f8:	b9000022 	str	w2, [x1]
    80fc:	2a0503e0 	mov	w0, w5
    8100:	910043ff 	add	sp, sp, #0x10
    8104:	d65f03c0 	ret
    8108:	39401080 	ldrb	w0, [x4, #4]
    810c:	52800005 	mov	w5, #0x0                   	// #0
    8110:	35fffc80 	cbnz	w0, 80a0 <__utf8_mbtowc+0x30>
    8114:	b900003f 	str	wzr, [x1]
    8118:	b900009f 	str	wzr, [x4]
    811c:	910043ff 	add	sp, sp, #0x10
    8120:	d65f03c0 	ret
    8124:	51038007 	sub	w7, w0, #0xe0
    8128:	71003cff 	cmp	w7, #0xf
    812c:	54000508 	b.hi	81cc <__utf8_mbtowc+0x15c>  // b.pmore
    8130:	39001080 	strb	w0, [x4, #4]
    8134:	34000aa6 	cbz	w6, 8288 <__utf8_mbtowc+0x218>
    8138:	b100047f 	cmn	x3, #0x1
    813c:	9a830463 	cinc	x3, x3, ne  // ne = any
    8140:	710004df 	cmp	w6, #0x1
    8144:	54000aa0 	b.eq	8298 <__utf8_mbtowc+0x228>  // b.none
    8148:	39401487 	ldrb	w7, [x4, #5]
    814c:	7103801f 	cmp	w0, #0xe0
    8150:	528013e9 	mov	w9, #0x9f                  	// #159
    8154:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    8158:	54000c8d 	b.le	82e8 <__utf8_mbtowc+0x278>
    815c:	510200e9 	sub	w9, w7, #0x80
    8160:	7100fd3f 	cmp	w9, #0x3f
    8164:	54000c28 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    8168:	39001487 	strb	w7, [x4, #5]
    816c:	710004df 	cmp	w6, #0x1
    8170:	54000ac0 	b.eq	82c8 <__utf8_mbtowc+0x258>  // b.none
    8174:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    8178:	110004a5 	add	w5, w5, #0x1
    817c:	51020043 	sub	w3, w2, #0x80
    8180:	7100fc7f 	cmp	w3, #0x3f
    8184:	54000b28 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    8188:	53140c00 	ubfiz	w0, w0, #12, #4
    818c:	531a14e7 	ubfiz	w7, w7, #6, #6
    8190:	2a070007 	orr	w7, w0, w7
    8194:	12001442 	and	w2, w2, #0x3f
    8198:	b900009f 	str	wzr, [x4]
    819c:	2a0200e7 	orr	w7, w7, w2
    81a0:	2a0503e0 	mov	w0, w5
    81a4:	b9000027 	str	w7, [x1]
    81a8:	17ffffdd 	b	811c <__utf8_mbtowc+0xac>
    81ac:	b900009f 	str	wzr, [x4]
    81b0:	b9000020 	str	w0, [x1]
    81b4:	52800020 	mov	w0, #0x1                   	// #1
    81b8:	910043ff 	add	sp, sp, #0x10
    81bc:	d65f03c0 	ret
    81c0:	52800000 	mov	w0, #0x0                   	// #0
    81c4:	910043ff 	add	sp, sp, #0x10
    81c8:	d65f03c0 	ret
    81cc:	5103c007 	sub	w7, w0, #0xf0
    81d0:	710010ff 	cmp	w7, #0x4
    81d4:	540008a8 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    81d8:	39001080 	strb	w0, [x4, #4]
    81dc:	34000666 	cbz	w6, 82a8 <__utf8_mbtowc+0x238>
    81e0:	b100047f 	cmn	x3, #0x1
    81e4:	9a830463 	cinc	x3, x3, ne  // ne = any
    81e8:	710004df 	cmp	w6, #0x1
    81ec:	54000660 	b.eq	82b8 <__utf8_mbtowc+0x248>  // b.none
    81f0:	39401487 	ldrb	w7, [x4, #5]
    81f4:	7103c01f 	cmp	w0, #0xf0
    81f8:	54000740 	b.eq	82e0 <__utf8_mbtowc+0x270>  // b.none
    81fc:	71023cff 	cmp	w7, #0x8f
    8200:	52801e89 	mov	w9, #0xf4                  	// #244
    8204:	7a49c000 	ccmp	w0, w9, #0x0, gt
    8208:	54000700 	b.eq	82e8 <__utf8_mbtowc+0x278>  // b.none
    820c:	510200e9 	sub	w9, w7, #0x80
    8210:	7100fd3f 	cmp	w9, #0x3f
    8214:	540006a8 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    8218:	39001487 	strb	w7, [x4, #5]
    821c:	710004df 	cmp	w6, #0x1
    8220:	540006c0 	b.eq	82f8 <__utf8_mbtowc+0x288>  // b.none
    8224:	b9400086 	ldr	w6, [x4]
    8228:	b100047f 	cmn	x3, #0x1
    822c:	9a830463 	cinc	x3, x3, ne  // ne = any
    8230:	710008df 	cmp	w6, #0x2
    8234:	540006a0 	b.eq	8308 <__utf8_mbtowc+0x298>  // b.none
    8238:	39401886 	ldrb	w6, [x4, #6]
    823c:	510200c3 	sub	w3, w6, #0x80
    8240:	7100fc7f 	cmp	w3, #0x3f
    8244:	54000528 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    8248:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    824c:	110004a5 	add	w5, w5, #0x1
    8250:	51020043 	sub	w3, w2, #0x80
    8254:	7100fc7f 	cmp	w3, #0x3f
    8258:	54000488 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    825c:	530e0800 	ubfiz	w0, w0, #18, #3
    8260:	531414e7 	ubfiz	w7, w7, #12, #6
    8264:	531a14c6 	ubfiz	w6, w6, #6, #6
    8268:	12001442 	and	w2, w2, #0x3f
    826c:	2a070007 	orr	w7, w0, w7
    8270:	2a0200c6 	orr	w6, w6, w2
    8274:	2a0600e6 	orr	w6, w7, w6
    8278:	b9000026 	str	w6, [x1]
    827c:	2a0503e0 	mov	w0, w5
    8280:	b900009f 	str	wzr, [x4]
    8284:	17ffffa6 	b	811c <__utf8_mbtowc+0xac>
    8288:	52800026 	mov	w6, #0x1                   	// #1
    828c:	b9000086 	str	w6, [x4]
    8290:	f100047f 	cmp	x3, #0x1
    8294:	54000220 	b.eq	82d8 <__utf8_mbtowc+0x268>  // b.none
    8298:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    829c:	52800026 	mov	w6, #0x1                   	// #1
    82a0:	0b0600a5 	add	w5, w5, w6
    82a4:	17ffffaa 	b	814c <__utf8_mbtowc+0xdc>
    82a8:	52800026 	mov	w6, #0x1                   	// #1
    82ac:	b9000086 	str	w6, [x4]
    82b0:	f100047f 	cmp	x3, #0x1
    82b4:	54000120 	b.eq	82d8 <__utf8_mbtowc+0x268>  // b.none
    82b8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    82bc:	52800026 	mov	w6, #0x1                   	// #1
    82c0:	0b0600a5 	add	w5, w5, w6
    82c4:	17ffffcc 	b	81f4 <__utf8_mbtowc+0x184>
    82c8:	52800046 	mov	w6, #0x2                   	// #2
    82cc:	b9000086 	str	w6, [x4]
    82d0:	f100087f 	cmp	x3, #0x2
    82d4:	54fff501 	b.ne	8174 <__utf8_mbtowc+0x104>  // b.any
    82d8:	12800020 	mov	w0, #0xfffffffe            	// #-2
    82dc:	17ffff90 	b	811c <__utf8_mbtowc+0xac>
    82e0:	71023cff 	cmp	w7, #0x8f
    82e4:	54fff94c 	b.gt	820c <__utf8_mbtowc+0x19c>
    82e8:	52801141 	mov	w1, #0x8a                  	// #138
    82ec:	12800000 	mov	w0, #0xffffffff            	// #-1
    82f0:	b9000101 	str	w1, [x8]
    82f4:	17ffff8a 	b	811c <__utf8_mbtowc+0xac>
    82f8:	52800046 	mov	w6, #0x2                   	// #2
    82fc:	b9000086 	str	w6, [x4]
    8300:	f100087f 	cmp	x3, #0x2
    8304:	54fffea0 	b.eq	82d8 <__utf8_mbtowc+0x268>  // b.none
    8308:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    830c:	110004a5 	add	w5, w5, #0x1
    8310:	510200c9 	sub	w9, w6, #0x80
    8314:	7100fd3f 	cmp	w9, #0x3f
    8318:	54fffe88 	b.hi	82e8 <__utf8_mbtowc+0x278>  // b.pmore
    831c:	52800069 	mov	w9, #0x3                   	// #3
    8320:	b9000089 	str	w9, [x4]
    8324:	39001886 	strb	w6, [x4, #6]
    8328:	f1000c7f 	cmp	x3, #0x3
    832c:	54fff8e1 	b.ne	8248 <__utf8_mbtowc+0x1d8>  // b.any
    8330:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8334:	17ffff7a 	b	811c <__utf8_mbtowc+0xac>
    8338:	d503201f 	nop
    833c:	d503201f 	nop

0000000000008340 <__sjis_mbtowc>:
    8340:	d10043ff 	sub	sp, sp, #0x10
    8344:	f100003f 	cmp	x1, #0x0
    8348:	910033e5 	add	x5, sp, #0xc
    834c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8350:	b40004c2 	cbz	x2, 83e8 <__sjis_mbtowc+0xa8>
    8354:	b4000503 	cbz	x3, 83f4 <__sjis_mbtowc+0xb4>
    8358:	aa0003e6 	mov	x6, x0
    835c:	b9400080 	ldr	w0, [x4]
    8360:	39400045 	ldrb	w5, [x2]
    8364:	35000320 	cbnz	w0, 83c8 <__sjis_mbtowc+0x88>
    8368:	510204a7 	sub	w7, w5, #0x81
    836c:	510380a0 	sub	w0, w5, #0xe0
    8370:	710078ff 	cmp	w7, #0x1e
    8374:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    8378:	540002c8 	b.hi	83d0 <__sjis_mbtowc+0x90>  // b.pmore
    837c:	52800020 	mov	w0, #0x1                   	// #1
    8380:	b9000080 	str	w0, [x4]
    8384:	39001085 	strb	w5, [x4, #4]
    8388:	f100047f 	cmp	x3, #0x1
    838c:	54000340 	b.eq	83f4 <__sjis_mbtowc+0xb4>  // b.none
    8390:	39400445 	ldrb	w5, [x2, #1]
    8394:	52800040 	mov	w0, #0x2                   	// #2
    8398:	510100a3 	sub	w3, w5, #0x40
    839c:	510200a2 	sub	w2, w5, #0x80
    83a0:	7100f87f 	cmp	w3, #0x3e
    83a4:	52800f83 	mov	w3, #0x7c                  	// #124
    83a8:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    83ac:	54000288 	b.hi	83fc <__sjis_mbtowc+0xbc>  // b.pmore
    83b0:	39401082 	ldrb	w2, [x4, #4]
    83b4:	0b0220a5 	add	w5, w5, w2, lsl #8
    83b8:	b9000025 	str	w5, [x1]
    83bc:	b900009f 	str	wzr, [x4]
    83c0:	910043ff 	add	sp, sp, #0x10
    83c4:	d65f03c0 	ret
    83c8:	7100041f 	cmp	w0, #0x1
    83cc:	54fffe60 	b.eq	8398 <__sjis_mbtowc+0x58>  // b.none
    83d0:	b9000025 	str	w5, [x1]
    83d4:	39400040 	ldrb	w0, [x2]
    83d8:	7100001f 	cmp	w0, #0x0
    83dc:	1a9f07e0 	cset	w0, ne  // ne = any
    83e0:	910043ff 	add	sp, sp, #0x10
    83e4:	d65f03c0 	ret
    83e8:	52800000 	mov	w0, #0x0                   	// #0
    83ec:	910043ff 	add	sp, sp, #0x10
    83f0:	d65f03c0 	ret
    83f4:	12800020 	mov	w0, #0xfffffffe            	// #-2
    83f8:	17fffffa 	b	83e0 <__sjis_mbtowc+0xa0>
    83fc:	52801141 	mov	w1, #0x8a                  	// #138
    8400:	12800000 	mov	w0, #0xffffffff            	// #-1
    8404:	b90000c1 	str	w1, [x6]
    8408:	17fffff6 	b	83e0 <__sjis_mbtowc+0xa0>
    840c:	d503201f 	nop

0000000000008410 <__eucjp_mbtowc>:
    8410:	d10083ff 	sub	sp, sp, #0x20
    8414:	f100003f 	cmp	x1, #0x0
    8418:	a90007e0 	stp	x0, x1, [sp]
    841c:	910073e0 	add	x0, sp, #0x1c
    8420:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    8424:	f94003e6 	ldr	x6, [sp]
    8428:	b4000702 	cbz	x2, 8508 <__eucjp_mbtowc+0xf8>
    842c:	b4000783 	cbz	x3, 851c <__eucjp_mbtowc+0x10c>
    8430:	b9400080 	ldr	w0, [x4]
    8434:	39400045 	ldrb	w5, [x2]
    8438:	350004a0 	cbnz	w0, 84cc <__eucjp_mbtowc+0xbc>
    843c:	510284a7 	sub	w7, w5, #0xa1
    8440:	510238a0 	sub	w0, w5, #0x8e
    8444:	710174ff 	cmp	w7, #0x5d
    8448:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    844c:	54000488 	b.hi	84dc <__eucjp_mbtowc+0xcc>  // b.pmore
    8450:	52800020 	mov	w0, #0x1                   	// #1
    8454:	b9000080 	str	w0, [x4]
    8458:	39001085 	strb	w5, [x4, #4]
    845c:	f100047f 	cmp	x3, #0x1
    8460:	540005e0 	b.eq	851c <__eucjp_mbtowc+0x10c>  // b.none
    8464:	39400445 	ldrb	w5, [x2, #1]
    8468:	52800040 	mov	w0, #0x2                   	// #2
    846c:	510284a7 	sub	w7, w5, #0xa1
    8470:	710174ff 	cmp	w7, #0x5d
    8474:	54000588 	b.hi	8524 <__eucjp_mbtowc+0x114>  // b.pmore
    8478:	39401087 	ldrb	w7, [x4, #4]
    847c:	71023cff 	cmp	w7, #0x8f
    8480:	540003a1 	b.ne	84f4 <__eucjp_mbtowc+0xe4>  // b.any
    8484:	52800048 	mov	w8, #0x2                   	// #2
    8488:	93407c07 	sxtw	x7, w0
    848c:	b9000088 	str	w8, [x4]
    8490:	39001485 	strb	w5, [x4, #5]
    8494:	eb0300ff 	cmp	x7, x3
    8498:	54000422 	b.cs	851c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    849c:	38676845 	ldrb	w5, [x2, x7]
    84a0:	11000400 	add	w0, w0, #0x1
    84a4:	510284a2 	sub	w2, w5, #0xa1
    84a8:	7101745f 	cmp	w2, #0x5d
    84ac:	540003c8 	b.hi	8524 <__eucjp_mbtowc+0x114>  // b.pmore
    84b0:	39401482 	ldrb	w2, [x4, #5]
    84b4:	120018a5 	and	w5, w5, #0x7f
    84b8:	0b0220a5 	add	w5, w5, w2, lsl #8
    84bc:	b9000025 	str	w5, [x1]
    84c0:	b900009f 	str	wzr, [x4]
    84c4:	910083ff 	add	sp, sp, #0x20
    84c8:	d65f03c0 	ret
    84cc:	7100041f 	cmp	w0, #0x1
    84d0:	54fffce0 	b.eq	846c <__eucjp_mbtowc+0x5c>  // b.none
    84d4:	7100081f 	cmp	w0, #0x2
    84d8:	540001e0 	b.eq	8514 <__eucjp_mbtowc+0x104>  // b.none
    84dc:	b9000025 	str	w5, [x1]
    84e0:	39400040 	ldrb	w0, [x2]
    84e4:	7100001f 	cmp	w0, #0x0
    84e8:	1a9f07e0 	cset	w0, ne  // ne = any
    84ec:	910083ff 	add	sp, sp, #0x20
    84f0:	d65f03c0 	ret
    84f4:	0b0720a5 	add	w5, w5, w7, lsl #8
    84f8:	b9000025 	str	w5, [x1]
    84fc:	b900009f 	str	wzr, [x4]
    8500:	910083ff 	add	sp, sp, #0x20
    8504:	d65f03c0 	ret
    8508:	52800000 	mov	w0, #0x0                   	// #0
    850c:	910083ff 	add	sp, sp, #0x20
    8510:	d65f03c0 	ret
    8514:	52800020 	mov	w0, #0x1                   	// #1
    8518:	17ffffe3 	b	84a4 <__eucjp_mbtowc+0x94>
    851c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8520:	17fffff3 	b	84ec <__eucjp_mbtowc+0xdc>
    8524:	52801141 	mov	w1, #0x8a                  	// #138
    8528:	12800000 	mov	w0, #0xffffffff            	// #-1
    852c:	b90000c1 	str	w1, [x6]
    8530:	17ffffef 	b	84ec <__eucjp_mbtowc+0xdc>
    8534:	d503201f 	nop
    8538:	d503201f 	nop
    853c:	d503201f 	nop

0000000000008540 <__jis_mbtowc>:
    8540:	d10043ff 	sub	sp, sp, #0x10
    8544:	f100003f 	cmp	x1, #0x0
    8548:	910033e5 	add	x5, sp, #0xc
    854c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8550:	b4000da2 	cbz	x2, 8704 <__jis_mbtowc+0x1c4>
    8554:	b4000e43 	cbz	x3, 871c <__jis_mbtowc+0x1dc>
    8558:	39400085 	ldrb	w5, [x4]
    855c:	f000000c 	adrp	x12, b000 <pow10.0+0x80>
    8560:	f000000b 	adrp	x11, b000 <pow10.0+0x80>
    8564:	aa0003ed 	mov	x13, x0
    8568:	911d618c 	add	x12, x12, #0x758
    856c:	911e816b 	add	x11, x11, #0x7a0
    8570:	aa0203ef 	mov	x15, x2
    8574:	5280000a 	mov	w10, #0x0                   	// #0
    8578:	d2800009 	mov	x9, #0x0                   	// #0
    857c:	38696847 	ldrb	w7, [x2, x9]
    8580:	8b09004e 	add	x14, x2, x9
    8584:	7100a0ff 	cmp	w7, #0x28
    8588:	54000c60 	b.eq	8714 <__jis_mbtowc+0x1d4>  // b.none
    858c:	540005a8 	b.hi	8640 <__jis_mbtowc+0x100>  // b.pmore
    8590:	52800006 	mov	w6, #0x0                   	// #0
    8594:	71006cff 	cmp	w7, #0x1b
    8598:	54000080 	b.eq	85a8 <__jis_mbtowc+0x68>  // b.none
    859c:	52800026 	mov	w6, #0x1                   	// #1
    85a0:	710090ff 	cmp	w7, #0x24
    85a4:	540008c1 	b.ne	86bc <__jis_mbtowc+0x17c>  // b.any
    85a8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    85ac:	8b25c005 	add	x5, x0, w5, sxtw
    85b0:	8b050180 	add	x0, x12, x5
    85b4:	8b050165 	add	x5, x11, x5
    85b8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    85bc:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    85c0:	71000d1f 	cmp	w8, #0x3
    85c4:	540006a0 	b.eq	8698 <__jis_mbtowc+0x158>  // b.none
    85c8:	540002a8 	b.hi	861c <__jis_mbtowc+0xdc>  // b.pmore
    85cc:	7100051f 	cmp	w8, #0x1
    85d0:	54000840 	b.eq	86d8 <__jis_mbtowc+0x198>  // b.none
    85d4:	7100091f 	cmp	w8, #0x2
    85d8:	54000141 	b.ne	8600 <__jis_mbtowc+0xc0>  // b.any
    85dc:	52800020 	mov	w0, #0x1                   	// #1
    85e0:	b9000080 	str	w0, [x4]
    85e4:	39401082 	ldrb	w2, [x4, #4]
    85e8:	0b000140 	add	w0, w10, w0
    85ec:	394001c3 	ldrb	w3, [x14]
    85f0:	0b022062 	add	w2, w3, w2, lsl #8
    85f4:	b9000022 	str	w2, [x1]
    85f8:	910043ff 	add	sp, sp, #0x10
    85fc:	d65f03c0 	ret
    8600:	35000788 	cbnz	w8, 86f0 <__jis_mbtowc+0x1b0>
    8604:	b900009f 	str	wzr, [x4]
    8608:	11000540 	add	w0, w10, #0x1
    860c:	394001e2 	ldrb	w2, [x15]
    8610:	b9000022 	str	w2, [x1]
    8614:	910043ff 	add	sp, sp, #0x10
    8618:	d65f03c0 	ret
    861c:	7100111f 	cmp	w8, #0x4
    8620:	54000400 	b.eq	86a0 <__jis_mbtowc+0x160>  // b.none
    8624:	7100151f 	cmp	w8, #0x5
    8628:	54000641 	b.ne	86f0 <__jis_mbtowc+0x1b0>  // b.any
    862c:	b900009f 	str	wzr, [x4]
    8630:	52800000 	mov	w0, #0x0                   	// #0
    8634:	b900003f 	str	wzr, [x1]
    8638:	910043ff 	add	sp, sp, #0x10
    863c:	d65f03c0 	ret
    8640:	52800086 	mov	w6, #0x4                   	// #4
    8644:	710108ff 	cmp	w7, #0x42
    8648:	54fffb00 	b.eq	85a8 <__jis_mbtowc+0x68>  // b.none
    864c:	528000a6 	mov	w6, #0x5                   	// #5
    8650:	710128ff 	cmp	w7, #0x4a
    8654:	54fffaa0 	b.eq	85a8 <__jis_mbtowc+0x68>  // b.none
    8658:	52800066 	mov	w6, #0x3                   	// #3
    865c:	710100ff 	cmp	w7, #0x40
    8660:	54fffa40 	b.eq	85a8 <__jis_mbtowc+0x68>  // b.none
    8664:	510084e0 	sub	w0, w7, #0x21
    8668:	7101741f 	cmp	w0, #0x5d
    866c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    8670:	11001cc6 	add	w6, w6, #0x7
    8674:	d503201f 	nop
    8678:	937d7ca0 	sbfiz	x0, x5, #3, #32
    867c:	8b25c005 	add	x5, x0, w5, sxtw
    8680:	8b050180 	add	x0, x12, x5
    8684:	8b050165 	add	x5, x11, x5
    8688:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    868c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    8690:	71000d1f 	cmp	w8, #0x3
    8694:	54fff9a1 	b.ne	85c8 <__jis_mbtowc+0x88>  // b.any
    8698:	91000529 	add	x9, x9, #0x1
    869c:	8b09004f 	add	x15, x2, x9
    86a0:	11000549 	add	w9, w10, #0x1
    86a4:	aa0903ea 	mov	x10, x9
    86a8:	eb03013f 	cmp	x9, x3
    86ac:	54fff683 	b.cc	857c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    86b0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    86b4:	b9000085 	str	w5, [x4]
    86b8:	17ffffd0 	b	85f8 <__jis_mbtowc+0xb8>
    86bc:	528000c6 	mov	w6, #0x6                   	// #6
    86c0:	34fff747 	cbz	w7, 85a8 <__jis_mbtowc+0x68>
    86c4:	510084e0 	sub	w0, w7, #0x21
    86c8:	7101741f 	cmp	w0, #0x5d
    86cc:	1a9f97e6 	cset	w6, hi  // hi = pmore
    86d0:	11001cc6 	add	w6, w6, #0x7
    86d4:	17ffffe9 	b	8678 <__jis_mbtowc+0x138>
    86d8:	11000549 	add	w9, w10, #0x1
    86dc:	39001087 	strb	w7, [x4, #4]
    86e0:	aa0903ea 	mov	x10, x9
    86e4:	eb03013f 	cmp	x9, x3
    86e8:	54fff4a3 	b.cc	857c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    86ec:	17fffff1 	b	86b0 <__jis_mbtowc+0x170>
    86f0:	52801141 	mov	w1, #0x8a                  	// #138
    86f4:	b90001a1 	str	w1, [x13]
    86f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    86fc:	910043ff 	add	sp, sp, #0x10
    8700:	d65f03c0 	ret
    8704:	b900009f 	str	wzr, [x4]
    8708:	52800020 	mov	w0, #0x1                   	// #1
    870c:	910043ff 	add	sp, sp, #0x10
    8710:	d65f03c0 	ret
    8714:	52800046 	mov	w6, #0x2                   	// #2
    8718:	17ffffa4 	b	85a8 <__jis_mbtowc+0x68>
    871c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8720:	17ffffb6 	b	85f8 <__jis_mbtowc+0xb8>

0000000000008724 <memchr>:
    8724:	b4000682 	cbz	x2, 87f4 <memchr+0xd0>
    8728:	52808025 	mov	w5, #0x401                 	// #1025
    872c:	72a80205 	movk	w5, #0x4010, lsl #16
    8730:	4e010c20 	dup	v0.16b, w1
    8734:	927be803 	and	x3, x0, #0xffffffffffffffe0
    8738:	4e040ca5 	dup	v5.4s, w5
    873c:	f2401009 	ands	x9, x0, #0x1f
    8740:	9240104a 	and	x10, x2, #0x1f
    8744:	54000200 	b.eq	8784 <memchr+0x60>  // b.none
    8748:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    874c:	d1008124 	sub	x4, x9, #0x20
    8750:	ab040042 	adds	x2, x2, x4
    8754:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    8758:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    875c:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    8760:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    8764:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    8768:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    876c:	4e083cc6 	mov	x6, v6.d[0]
    8770:	d37ff924 	lsl	x4, x9, #1
    8774:	9ac424c6 	lsr	x6, x6, x4
    8778:	9ac420c6 	lsl	x6, x6, x4
    877c:	54000229 	b.ls	87c0 <memchr+0x9c>  // b.plast
    8780:	b50002c6 	cbnz	x6, 87d8 <memchr+0xb4>
    8784:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    8788:	f1008042 	subs	x2, x2, #0x20
    878c:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    8790:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    8794:	540000a9 	b.ls	87a8 <memchr+0x84>  // b.plast
    8798:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    879c:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    87a0:	4e083cc6 	mov	x6, v6.d[0]
    87a4:	b4ffff06 	cbz	x6, 8784 <memchr+0x60>
    87a8:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    87ac:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    87b0:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    87b4:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    87b8:	4e083cc6 	mov	x6, v6.d[0]
    87bc:	540000e8 	b.hi	87d8 <memchr+0xb4>  // b.pmore
    87c0:	8b090144 	add	x4, x10, x9
    87c4:	92401084 	and	x4, x4, #0x1f
    87c8:	d1008084 	sub	x4, x4, #0x20
    87cc:	cb0407e4 	neg	x4, x4, lsl #1
    87d0:	9ac420c6 	lsl	x6, x6, x4
    87d4:	9ac424c6 	lsr	x6, x6, x4
    87d8:	dac000c6 	rbit	x6, x6
    87dc:	d1008063 	sub	x3, x3, #0x20
    87e0:	f10000df 	cmp	x6, #0x0
    87e4:	dac010c6 	clz	x6, x6
    87e8:	8b460460 	add	x0, x3, x6, lsr #1
    87ec:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    87f0:	d65f03c0 	ret
    87f4:	d2800000 	mov	x0, #0x0                   	// #0
    87f8:	d65f03c0 	ret
    87fc:	d503201f 	nop

0000000000008800 <_realloc_r>:
    8800:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8804:	910003fd 	mov	x29, sp
    8808:	a9025bf5 	stp	x21, x22, [sp, #32]
    880c:	aa0203f5 	mov	x21, x2
    8810:	b40010e1 	cbz	x1, 8a2c <_realloc_r+0x22c>
    8814:	a90363f7 	stp	x23, x24, [sp, #48]
    8818:	d1004038 	sub	x24, x1, #0x10
    881c:	aa0003f7 	mov	x23, x0
    8820:	a90153f3 	stp	x19, x20, [sp, #16]
    8824:	aa0103f3 	mov	x19, x1
    8828:	91005eb4 	add	x20, x21, #0x17
    882c:	a9046bf9 	stp	x25, x26, [sp, #64]
    8830:	97ffed1c 	bl	3ca0 <__malloc_lock>
    8834:	aa1803f9 	mov	x25, x24
    8838:	f9400700 	ldr	x0, [x24, #8]
    883c:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    8840:	f100ba9f 	cmp	x20, #0x2e
    8844:	54000908 	b.hi	8964 <_realloc_r+0x164>  // b.pmore
    8848:	52800001 	mov	w1, #0x0                   	// #0
    884c:	7100003f 	cmp	w1, #0x0
    8850:	d2800414 	mov	x20, #0x20                  	// #32
    8854:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    8858:	54000943 	b.cc	8980 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    885c:	eb1402df 	cmp	x22, x20
    8860:	54000b0a 	b.ge	89c0 <_realloc_r+0x1c0>  // b.tcont
    8864:	90000021 	adrp	x1, c000 <IpcTestNull+0x6e8>
    8868:	a90573fb 	stp	x27, x28, [sp, #80]
    886c:	9122003c 	add	x28, x1, #0x880
    8870:	8b160302 	add	x2, x24, x22
    8874:	f9400b83 	ldr	x3, [x28, #16]
    8878:	f9400441 	ldr	x1, [x2, #8]
    887c:	eb02007f 	cmp	x3, x2
    8880:	54000f60 	b.eq	8a6c <_realloc_r+0x26c>  // b.none
    8884:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    8888:	8b030043 	add	x3, x2, x3
    888c:	f9400463 	ldr	x3, [x3, #8]
    8890:	37000c23 	tbnz	w3, #0, 8a14 <_realloc_r+0x214>
    8894:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    8898:	8b0102c3 	add	x3, x22, x1
    889c:	eb03029f 	cmp	x20, x3
    88a0:	5400084d 	b.le	89a8 <_realloc_r+0x1a8>
    88a4:	37000180 	tbnz	w0, #0, 88d4 <_realloc_r+0xd4>
    88a8:	f85f027b 	ldur	x27, [x19, #-16]
    88ac:	cb1b031b 	sub	x27, x24, x27
    88b0:	f9400760 	ldr	x0, [x27, #8]
    88b4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    88b8:	8b010001 	add	x1, x0, x1
    88bc:	8b160023 	add	x3, x1, x22
    88c0:	eb03029f 	cmp	x20, x3
    88c4:	540019ad 	b.le	8bf8 <_realloc_r+0x3f8>
    88c8:	8b0002c3 	add	x3, x22, x0
    88cc:	eb03029f 	cmp	x20, x3
    88d0:	5400152d 	b.le	8b74 <_realloc_r+0x374>
    88d4:	aa1503e1 	mov	x1, x21
    88d8:	aa1703e0 	mov	x0, x23
    88dc:	97ffe9d9 	bl	3040 <_malloc_r>
    88e0:	aa0003f5 	mov	x21, x0
    88e4:	b40002c0 	cbz	x0, 893c <_realloc_r+0x13c>
    88e8:	f9400701 	ldr	x1, [x24, #8]
    88ec:	d1004002 	sub	x2, x0, #0x10
    88f0:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    88f4:	8b010318 	add	x24, x24, x1
    88f8:	eb02031f 	cmp	x24, x2
    88fc:	54001200 	b.eq	8b3c <_realloc_r+0x33c>  // b.none
    8900:	d10022c2 	sub	x2, x22, #0x8
    8904:	f101205f 	cmp	x2, #0x48
    8908:	54001728 	b.hi	8bec <_realloc_r+0x3ec>  // b.pmore
    890c:	f1009c5f 	cmp	x2, #0x27
    8910:	54001208 	b.hi	8b50 <_realloc_r+0x350>  // b.pmore
    8914:	aa1303e1 	mov	x1, x19
    8918:	f9400022 	ldr	x2, [x1]
    891c:	f9000002 	str	x2, [x0]
    8920:	f9400422 	ldr	x2, [x1, #8]
    8924:	f9000402 	str	x2, [x0, #8]
    8928:	f9400821 	ldr	x1, [x1, #16]
    892c:	f9000801 	str	x1, [x0, #16]
    8930:	aa1303e1 	mov	x1, x19
    8934:	aa1703e0 	mov	x0, x23
    8938:	97fff796 	bl	6790 <_free_r>
    893c:	aa1703e0 	mov	x0, x23
    8940:	97ffecdc 	bl	3cb0 <__malloc_unlock>
    8944:	aa1503e0 	mov	x0, x21
    8948:	a94153f3 	ldp	x19, x20, [sp, #16]
    894c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8950:	a94363f7 	ldp	x23, x24, [sp, #48]
    8954:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8958:	a94573fb 	ldp	x27, x28, [sp, #80]
    895c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8960:	d65f03c0 	ret
    8964:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    8968:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    896c:	eb01029f 	cmp	x20, x1
    8970:	1a9f97e1 	cset	w1, hi  // hi = pmore
    8974:	7100003f 	cmp	w1, #0x0
    8978:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    897c:	54fff702 	b.cs	885c <_realloc_r+0x5c>  // b.hs, b.nlast
    8980:	52800180 	mov	w0, #0xc                   	// #12
    8984:	b90002e0 	str	w0, [x23]
    8988:	d2800015 	mov	x21, #0x0                   	// #0
    898c:	aa1503e0 	mov	x0, x21
    8990:	a94153f3 	ldp	x19, x20, [sp, #16]
    8994:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8998:	a94363f7 	ldp	x23, x24, [sp, #48]
    899c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    89a0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    89a4:	d65f03c0 	ret
    89a8:	a9410041 	ldp	x1, x0, [x2, #16]
    89ac:	aa0303f6 	mov	x22, x3
    89b0:	a94573fb 	ldp	x27, x28, [sp, #80]
    89b4:	f9000c20 	str	x0, [x1, #24]
    89b8:	f9000801 	str	x1, [x0, #16]
    89bc:	d503201f 	nop
    89c0:	f9400721 	ldr	x1, [x25, #8]
    89c4:	cb1402c0 	sub	x0, x22, x20
    89c8:	8b160322 	add	x2, x25, x22
    89cc:	92400021 	and	x1, x1, #0x1
    89d0:	f1007c1f 	cmp	x0, #0x1f
    89d4:	54000348 	b.hi	8a3c <_realloc_r+0x23c>  // b.pmore
    89d8:	aa0102c1 	orr	x1, x22, x1
    89dc:	f9000721 	str	x1, [x25, #8]
    89e0:	f9400440 	ldr	x0, [x2, #8]
    89e4:	b2400000 	orr	x0, x0, #0x1
    89e8:	f9000440 	str	x0, [x2, #8]
    89ec:	aa1703e0 	mov	x0, x23
    89f0:	aa1303f5 	mov	x21, x19
    89f4:	97ffecaf 	bl	3cb0 <__malloc_unlock>
    89f8:	aa1503e0 	mov	x0, x21
    89fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    8a00:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8a04:	a94363f7 	ldp	x23, x24, [sp, #48]
    8a08:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8a0c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8a10:	d65f03c0 	ret
    8a14:	3707f600 	tbnz	w0, #0, 88d4 <_realloc_r+0xd4>
    8a18:	f85f027b 	ldur	x27, [x19, #-16]
    8a1c:	cb1b031b 	sub	x27, x24, x27
    8a20:	f9400760 	ldr	x0, [x27, #8]
    8a24:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8a28:	17ffffa8 	b	88c8 <_realloc_r+0xc8>
    8a2c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8a30:	aa0203e1 	mov	x1, x2
    8a34:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8a38:	17ffe982 	b	3040 <_malloc_r>
    8a3c:	8b140324 	add	x4, x25, x20
    8a40:	aa010281 	orr	x1, x20, x1
    8a44:	f9000721 	str	x1, [x25, #8]
    8a48:	b2400003 	orr	x3, x0, #0x1
    8a4c:	91004081 	add	x1, x4, #0x10
    8a50:	aa1703e0 	mov	x0, x23
    8a54:	f9000483 	str	x3, [x4, #8]
    8a58:	f9400443 	ldr	x3, [x2, #8]
    8a5c:	b2400063 	orr	x3, x3, #0x1
    8a60:	f9000443 	str	x3, [x2, #8]
    8a64:	97fff74b 	bl	6790 <_free_r>
    8a68:	17ffffe1 	b	89ec <_realloc_r+0x1ec>
    8a6c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    8a70:	91008283 	add	x3, x20, #0x20
    8a74:	8b0102c2 	add	x2, x22, x1
    8a78:	eb03005f 	cmp	x2, x3
    8a7c:	54000eaa 	b.ge	8c50 <_realloc_r+0x450>  // b.tcont
    8a80:	3707f2a0 	tbnz	w0, #0, 88d4 <_realloc_r+0xd4>
    8a84:	f85f027b 	ldur	x27, [x19, #-16]
    8a88:	cb1b031b 	sub	x27, x24, x27
    8a8c:	f9400760 	ldr	x0, [x27, #8]
    8a90:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8a94:	8b010001 	add	x1, x0, x1
    8a98:	8b16003a 	add	x26, x1, x22
    8a9c:	eb1a007f 	cmp	x3, x26
    8aa0:	54fff14c 	b.gt	88c8 <_realloc_r+0xc8>
    8aa4:	aa1b03f5 	mov	x21, x27
    8aa8:	d10022c2 	sub	x2, x22, #0x8
    8aac:	f9400f60 	ldr	x0, [x27, #24]
    8ab0:	f8410ea1 	ldr	x1, [x21, #16]!
    8ab4:	f9000c20 	str	x0, [x1, #24]
    8ab8:	f9000801 	str	x1, [x0, #16]
    8abc:	f101205f 	cmp	x2, #0x48
    8ac0:	54001128 	b.hi	8ce4 <_realloc_r+0x4e4>  // b.pmore
    8ac4:	aa1503e0 	mov	x0, x21
    8ac8:	f1009c5f 	cmp	x2, #0x27
    8acc:	54000129 	b.ls	8af0 <_realloc_r+0x2f0>  // b.plast
    8ad0:	f9400260 	ldr	x0, [x19]
    8ad4:	f9000b60 	str	x0, [x27, #16]
    8ad8:	f9400660 	ldr	x0, [x19, #8]
    8adc:	f9000f60 	str	x0, [x27, #24]
    8ae0:	f100dc5f 	cmp	x2, #0x37
    8ae4:	54001088 	b.hi	8cf4 <_realloc_r+0x4f4>  // b.pmore
    8ae8:	91004273 	add	x19, x19, #0x10
    8aec:	91008360 	add	x0, x27, #0x20
    8af0:	f9400261 	ldr	x1, [x19]
    8af4:	f9000001 	str	x1, [x0]
    8af8:	f9400661 	ldr	x1, [x19, #8]
    8afc:	f9000401 	str	x1, [x0, #8]
    8b00:	f9400a61 	ldr	x1, [x19, #16]
    8b04:	f9000801 	str	x1, [x0, #16]
    8b08:	8b140362 	add	x2, x27, x20
    8b0c:	cb140341 	sub	x1, x26, x20
    8b10:	f9000b82 	str	x2, [x28, #16]
    8b14:	b2400021 	orr	x1, x1, #0x1
    8b18:	aa1703e0 	mov	x0, x23
    8b1c:	f9000441 	str	x1, [x2, #8]
    8b20:	f9400761 	ldr	x1, [x27, #8]
    8b24:	92400021 	and	x1, x1, #0x1
    8b28:	aa140034 	orr	x20, x1, x20
    8b2c:	f9000774 	str	x20, [x27, #8]
    8b30:	97ffec60 	bl	3cb0 <__malloc_unlock>
    8b34:	a94573fb 	ldp	x27, x28, [sp, #80]
    8b38:	17ffffb0 	b	89f8 <_realloc_r+0x1f8>
    8b3c:	f9400700 	ldr	x0, [x24, #8]
    8b40:	a94573fb 	ldp	x27, x28, [sp, #80]
    8b44:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8b48:	8b0002d6 	add	x22, x22, x0
    8b4c:	17ffff9d 	b	89c0 <_realloc_r+0x1c0>
    8b50:	f9400260 	ldr	x0, [x19]
    8b54:	f90002a0 	str	x0, [x21]
    8b58:	f9400660 	ldr	x0, [x19, #8]
    8b5c:	f90006a0 	str	x0, [x21, #8]
    8b60:	f100dc5f 	cmp	x2, #0x37
    8b64:	54000648 	b.hi	8c2c <_realloc_r+0x42c>  // b.pmore
    8b68:	91004261 	add	x1, x19, #0x10
    8b6c:	910042a0 	add	x0, x21, #0x10
    8b70:	17ffff6a 	b	8918 <_realloc_r+0x118>
    8b74:	aa1b03e0 	mov	x0, x27
    8b78:	d10022c2 	sub	x2, x22, #0x8
    8b7c:	f8410c04 	ldr	x4, [x0, #16]!
    8b80:	f9400f61 	ldr	x1, [x27, #24]
    8b84:	f9000c81 	str	x1, [x4, #24]
    8b88:	f9000824 	str	x4, [x1, #16]
    8b8c:	f101205f 	cmp	x2, #0x48
    8b90:	54000408 	b.hi	8c10 <_realloc_r+0x410>  // b.pmore
    8b94:	aa0003e1 	mov	x1, x0
    8b98:	f1009c5f 	cmp	x2, #0x27
    8b9c:	54000129 	b.ls	8bc0 <_realloc_r+0x3c0>  // b.plast
    8ba0:	f9400261 	ldr	x1, [x19]
    8ba4:	f9000b61 	str	x1, [x27, #16]
    8ba8:	f9400661 	ldr	x1, [x19, #8]
    8bac:	f9000f61 	str	x1, [x27, #24]
    8bb0:	f100dc5f 	cmp	x2, #0x37
    8bb4:	540006a8 	b.hi	8c88 <_realloc_r+0x488>  // b.pmore
    8bb8:	91004273 	add	x19, x19, #0x10
    8bbc:	91008361 	add	x1, x27, #0x20
    8bc0:	f9400262 	ldr	x2, [x19]
    8bc4:	aa1b03f9 	mov	x25, x27
    8bc8:	a94573fb 	ldp	x27, x28, [sp, #80]
    8bcc:	f9000022 	str	x2, [x1]
    8bd0:	aa0303f6 	mov	x22, x3
    8bd4:	f9400662 	ldr	x2, [x19, #8]
    8bd8:	f9000422 	str	x2, [x1, #8]
    8bdc:	f9400a62 	ldr	x2, [x19, #16]
    8be0:	aa0003f3 	mov	x19, x0
    8be4:	f9000822 	str	x2, [x1, #16]
    8be8:	17ffff76 	b	89c0 <_realloc_r+0x1c0>
    8bec:	aa1303e1 	mov	x1, x19
    8bf0:	97ffeb84 	bl	3a00 <memmove>
    8bf4:	17ffff4f 	b	8930 <_realloc_r+0x130>
    8bf8:	a9410444 	ldp	x4, x1, [x2, #16]
    8bfc:	f9000c81 	str	x1, [x4, #24]
    8c00:	aa1b03e0 	mov	x0, x27
    8c04:	d10022c2 	sub	x2, x22, #0x8
    8c08:	f9000824 	str	x4, [x1, #16]
    8c0c:	17ffffdc 	b	8b7c <_realloc_r+0x37c>
    8c10:	aa1303e1 	mov	x1, x19
    8c14:	aa0303f6 	mov	x22, x3
    8c18:	aa1b03f9 	mov	x25, x27
    8c1c:	aa0003f3 	mov	x19, x0
    8c20:	97ffeb78 	bl	3a00 <memmove>
    8c24:	a94573fb 	ldp	x27, x28, [sp, #80]
    8c28:	17ffff66 	b	89c0 <_realloc_r+0x1c0>
    8c2c:	f9400a60 	ldr	x0, [x19, #16]
    8c30:	f9000aa0 	str	x0, [x21, #16]
    8c34:	f9400e60 	ldr	x0, [x19, #24]
    8c38:	f9000ea0 	str	x0, [x21, #24]
    8c3c:	f101205f 	cmp	x2, #0x48
    8c40:	54000360 	b.eq	8cac <_realloc_r+0x4ac>  // b.none
    8c44:	91008261 	add	x1, x19, #0x20
    8c48:	910082a0 	add	x0, x21, #0x20
    8c4c:	17ffff33 	b	8918 <_realloc_r+0x118>
    8c50:	8b140303 	add	x3, x24, x20
    8c54:	cb140041 	sub	x1, x2, x20
    8c58:	f9000b83 	str	x3, [x28, #16]
    8c5c:	b2400021 	orr	x1, x1, #0x1
    8c60:	aa1703e0 	mov	x0, x23
    8c64:	aa1303f5 	mov	x21, x19
    8c68:	f9000461 	str	x1, [x3, #8]
    8c6c:	f9400701 	ldr	x1, [x24, #8]
    8c70:	92400021 	and	x1, x1, #0x1
    8c74:	aa140034 	orr	x20, x1, x20
    8c78:	f9000714 	str	x20, [x24, #8]
    8c7c:	97ffec0d 	bl	3cb0 <__malloc_unlock>
    8c80:	a94573fb 	ldp	x27, x28, [sp, #80]
    8c84:	17ffff5d 	b	89f8 <_realloc_r+0x1f8>
    8c88:	f9400a61 	ldr	x1, [x19, #16]
    8c8c:	f9001361 	str	x1, [x27, #32]
    8c90:	f9400e61 	ldr	x1, [x19, #24]
    8c94:	f9001761 	str	x1, [x27, #40]
    8c98:	f101205f 	cmp	x2, #0x48
    8c9c:	54000160 	b.eq	8cc8 <_realloc_r+0x4c8>  // b.none
    8ca0:	91008273 	add	x19, x19, #0x20
    8ca4:	9100c361 	add	x1, x27, #0x30
    8ca8:	17ffffc6 	b	8bc0 <_realloc_r+0x3c0>
    8cac:	f9401260 	ldr	x0, [x19, #32]
    8cb0:	f90012a0 	str	x0, [x21, #32]
    8cb4:	9100c261 	add	x1, x19, #0x30
    8cb8:	9100c2a0 	add	x0, x21, #0x30
    8cbc:	f9401662 	ldr	x2, [x19, #40]
    8cc0:	f90016a2 	str	x2, [x21, #40]
    8cc4:	17ffff15 	b	8918 <_realloc_r+0x118>
    8cc8:	f9401261 	ldr	x1, [x19, #32]
    8ccc:	f9001b61 	str	x1, [x27, #48]
    8cd0:	9100c273 	add	x19, x19, #0x30
    8cd4:	91010361 	add	x1, x27, #0x40
    8cd8:	f85f8262 	ldur	x2, [x19, #-8]
    8cdc:	f9001f62 	str	x2, [x27, #56]
    8ce0:	17ffffb8 	b	8bc0 <_realloc_r+0x3c0>
    8ce4:	aa1303e1 	mov	x1, x19
    8ce8:	aa1503e0 	mov	x0, x21
    8cec:	97ffeb45 	bl	3a00 <memmove>
    8cf0:	17ffff86 	b	8b08 <_realloc_r+0x308>
    8cf4:	f9400a60 	ldr	x0, [x19, #16]
    8cf8:	f9001360 	str	x0, [x27, #32]
    8cfc:	f9400e60 	ldr	x0, [x19, #24]
    8d00:	f9001760 	str	x0, [x27, #40]
    8d04:	f101205f 	cmp	x2, #0x48
    8d08:	54000080 	b.eq	8d18 <_realloc_r+0x518>  // b.none
    8d0c:	91008273 	add	x19, x19, #0x20
    8d10:	9100c360 	add	x0, x27, #0x30
    8d14:	17ffff77 	b	8af0 <_realloc_r+0x2f0>
    8d18:	f9401260 	ldr	x0, [x19, #32]
    8d1c:	f9001b60 	str	x0, [x27, #48]
    8d20:	9100c273 	add	x19, x19, #0x30
    8d24:	91010360 	add	x0, x27, #0x40
    8d28:	f85f8261 	ldur	x1, [x19, #-8]
    8d2c:	f9001f61 	str	x1, [x27, #56]
    8d30:	17ffff70 	b	8af0 <_realloc_r+0x2f0>
    8d34:	d503201f 	nop
    8d38:	d503201f 	nop
    8d3c:	d503201f 	nop

0000000000008d40 <cleanup_glue>:
    8d40:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    8d44:	910003fd 	mov	x29, sp
    8d48:	a9025bf5 	stp	x21, x22, [sp, #32]
    8d4c:	f9400035 	ldr	x21, [x1]
    8d50:	a90153f3 	stp	x19, x20, [sp, #16]
    8d54:	aa0103f3 	mov	x19, x1
    8d58:	aa0003f4 	mov	x20, x0
    8d5c:	b4000275 	cbz	x21, 8da8 <cleanup_glue+0x68>
    8d60:	f94002b6 	ldr	x22, [x21]
    8d64:	b40001d6 	cbz	x22, 8d9c <cleanup_glue+0x5c>
    8d68:	f9001bf7 	str	x23, [sp, #48]
    8d6c:	f94002d7 	ldr	x23, [x22]
    8d70:	b40000f7 	cbz	x23, 8d8c <cleanup_glue+0x4c>
    8d74:	f94002e1 	ldr	x1, [x23]
    8d78:	b4000041 	cbz	x1, 8d80 <cleanup_glue+0x40>
    8d7c:	97fffff1 	bl	8d40 <cleanup_glue>
    8d80:	aa1703e1 	mov	x1, x23
    8d84:	aa1403e0 	mov	x0, x20
    8d88:	97fff682 	bl	6790 <_free_r>
    8d8c:	aa1603e1 	mov	x1, x22
    8d90:	aa1403e0 	mov	x0, x20
    8d94:	97fff67f 	bl	6790 <_free_r>
    8d98:	f9401bf7 	ldr	x23, [sp, #48]
    8d9c:	aa1503e1 	mov	x1, x21
    8da0:	aa1403e0 	mov	x0, x20
    8da4:	97fff67b 	bl	6790 <_free_r>
    8da8:	aa1303e1 	mov	x1, x19
    8dac:	aa1403e0 	mov	x0, x20
    8db0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8db4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8db8:	a8c47bfd 	ldp	x29, x30, [sp], #64
    8dbc:	17fff675 	b	6790 <_free_r>

0000000000008dc0 <_reclaim_reent>:
    8dc0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8dc4:	90000021 	adrp	x1, c000 <IpcTestNull+0x6e8>
    8dc8:	910003fd 	mov	x29, sp
    8dcc:	a90153f3 	stp	x19, x20, [sp, #16]
    8dd0:	aa0003f4 	mov	x20, x0
    8dd4:	f9409820 	ldr	x0, [x1, #304]
    8dd8:	eb14001f 	cmp	x0, x20
    8ddc:	54000500 	b.eq	8e7c <_reclaim_reent+0xbc>  // b.none
    8de0:	f9403e81 	ldr	x1, [x20, #120]
    8de4:	f90013f5 	str	x21, [sp, #32]
    8de8:	b40001e1 	cbz	x1, 8e24 <_reclaim_reent+0x64>
    8dec:	d2800015 	mov	x21, #0x0                   	// #0
    8df0:	f8756833 	ldr	x19, [x1, x21]
    8df4:	b40000f3 	cbz	x19, 8e10 <_reclaim_reent+0x50>
    8df8:	aa1303e1 	mov	x1, x19
    8dfc:	aa1403e0 	mov	x0, x20
    8e00:	f9400273 	ldr	x19, [x19]
    8e04:	97fff663 	bl	6790 <_free_r>
    8e08:	b5ffff93 	cbnz	x19, 8df8 <_reclaim_reent+0x38>
    8e0c:	f9403e81 	ldr	x1, [x20, #120]
    8e10:	910022b5 	add	x21, x21, #0x8
    8e14:	f10802bf 	cmp	x21, #0x200
    8e18:	54fffec1 	b.ne	8df0 <_reclaim_reent+0x30>  // b.any
    8e1c:	aa1403e0 	mov	x0, x20
    8e20:	97fff65c 	bl	6790 <_free_r>
    8e24:	f9403281 	ldr	x1, [x20, #96]
    8e28:	b4000061 	cbz	x1, 8e34 <_reclaim_reent+0x74>
    8e2c:	aa1403e0 	mov	x0, x20
    8e30:	97fff658 	bl	6790 <_free_r>
    8e34:	f940fe93 	ldr	x19, [x20, #504]
    8e38:	b4000153 	cbz	x19, 8e60 <_reclaim_reent+0xa0>
    8e3c:	91080295 	add	x21, x20, #0x200
    8e40:	eb15027f 	cmp	x19, x21
    8e44:	540000e0 	b.eq	8e60 <_reclaim_reent+0xa0>  // b.none
    8e48:	aa1303e1 	mov	x1, x19
    8e4c:	aa1403e0 	mov	x0, x20
    8e50:	f9400273 	ldr	x19, [x19]
    8e54:	97fff64f 	bl	6790 <_free_r>
    8e58:	eb1302bf 	cmp	x21, x19
    8e5c:	54ffff61 	b.ne	8e48 <_reclaim_reent+0x88>  // b.any
    8e60:	f9404681 	ldr	x1, [x20, #136]
    8e64:	b4000061 	cbz	x1, 8e70 <_reclaim_reent+0xb0>
    8e68:	aa1403e0 	mov	x0, x20
    8e6c:	97fff649 	bl	6790 <_free_r>
    8e70:	b9405280 	ldr	w0, [x20, #80]
    8e74:	350000a0 	cbnz	w0, 8e88 <_reclaim_reent+0xc8>
    8e78:	f94013f5 	ldr	x21, [sp, #32]
    8e7c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8e80:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8e84:	d65f03c0 	ret
    8e88:	f9402e81 	ldr	x1, [x20, #88]
    8e8c:	aa1403e0 	mov	x0, x20
    8e90:	d63f0020 	blr	x1
    8e94:	f9429293 	ldr	x19, [x20, #1312]
    8e98:	b4ffff13 	cbz	x19, 8e78 <_reclaim_reent+0xb8>
    8e9c:	f9400261 	ldr	x1, [x19]
    8ea0:	b4000061 	cbz	x1, 8eac <_reclaim_reent+0xec>
    8ea4:	aa1403e0 	mov	x0, x20
    8ea8:	97ffffa6 	bl	8d40 <cleanup_glue>
    8eac:	aa1303e1 	mov	x1, x19
    8eb0:	aa1403e0 	mov	x0, x20
    8eb4:	a94153f3 	ldp	x19, x20, [sp, #16]
    8eb8:	f94013f5 	ldr	x21, [sp, #32]
    8ebc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8ec0:	17fff634 	b	6790 <_free_r>
    8ec4:	d503201f 	nop
    8ec8:	d503201f 	nop
    8ecc:	d503201f 	nop

0000000000008ed0 <_init_signal_r>:
    8ed0:	f9428c01 	ldr	x1, [x0, #1304]
    8ed4:	b4000061 	cbz	x1, 8ee0 <_init_signal_r+0x10>
    8ed8:	52800000 	mov	w0, #0x0                   	// #0
    8edc:	d65f03c0 	ret
    8ee0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    8ee4:	d2802001 	mov	x1, #0x100                 	// #256
    8ee8:	910003fd 	mov	x29, sp
    8eec:	f9000bf3 	str	x19, [sp, #16]
    8ef0:	aa0003f3 	mov	x19, x0
    8ef4:	97ffe853 	bl	3040 <_malloc_r>
    8ef8:	f9028e60 	str	x0, [x19, #1304]
    8efc:	b4000140 	cbz	x0, 8f24 <_init_signal_r+0x54>
    8f00:	91040001 	add	x1, x0, #0x100
    8f04:	d503201f 	nop
    8f08:	f800841f 	str	xzr, [x0], #8
    8f0c:	eb01001f 	cmp	x0, x1
    8f10:	54ffffc1 	b.ne	8f08 <_init_signal_r+0x38>  // b.any
    8f14:	52800000 	mov	w0, #0x0                   	// #0
    8f18:	f9400bf3 	ldr	x19, [sp, #16]
    8f1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    8f20:	d65f03c0 	ret
    8f24:	12800000 	mov	w0, #0xffffffff            	// #-1
    8f28:	17fffffc 	b	8f18 <_init_signal_r+0x48>
    8f2c:	d503201f 	nop

0000000000008f30 <_signal_r>:
    8f30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8f34:	910003fd 	mov	x29, sp
    8f38:	a90153f3 	stp	x19, x20, [sp, #16]
    8f3c:	93407c33 	sxtw	x19, w1
    8f40:	aa0003f4 	mov	x20, x0
    8f44:	71007e7f 	cmp	w19, #0x1f
    8f48:	54000108 	b.hi	8f68 <_signal_r+0x38>  // b.pmore
    8f4c:	f9428c04 	ldr	x4, [x0, #1304]
    8f50:	b4000184 	cbz	x4, 8f80 <_signal_r+0x50>
    8f54:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    8f58:	f8337882 	str	x2, [x4, x19, lsl #3]
    8f5c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8f60:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8f64:	d65f03c0 	ret
    8f68:	528002c1 	mov	w1, #0x16                  	// #22
    8f6c:	b9000281 	str	w1, [x20]
    8f70:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    8f74:	a94153f3 	ldp	x19, x20, [sp, #16]
    8f78:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8f7c:	d65f03c0 	ret
    8f80:	d2802001 	mov	x1, #0x100                 	// #256
    8f84:	f90017e2 	str	x2, [sp, #40]
    8f88:	97ffe82e 	bl	3040 <_malloc_r>
    8f8c:	f9028e80 	str	x0, [x20, #1304]
    8f90:	aa0003e4 	mov	x4, x0
    8f94:	b4000120 	cbz	x0, 8fb8 <_signal_r+0x88>
    8f98:	f94017e2 	ldr	x2, [sp, #40]
    8f9c:	aa0003e3 	mov	x3, x0
    8fa0:	91040001 	add	x1, x0, #0x100
    8fa4:	d503201f 	nop
    8fa8:	f800847f 	str	xzr, [x3], #8
    8fac:	eb03003f 	cmp	x1, x3
    8fb0:	54ffffc1 	b.ne	8fa8 <_signal_r+0x78>  // b.any
    8fb4:	17ffffe8 	b	8f54 <_signal_r+0x24>
    8fb8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    8fbc:	17ffffe8 	b	8f5c <_signal_r+0x2c>

0000000000008fc0 <_raise_r>:
    8fc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    8fc4:	910003fd 	mov	x29, sp
    8fc8:	a90153f3 	stp	x19, x20, [sp, #16]
    8fcc:	aa0003f4 	mov	x20, x0
    8fd0:	71007c3f 	cmp	w1, #0x1f
    8fd4:	54000488 	b.hi	9064 <_raise_r+0xa4>  // b.pmore
    8fd8:	f9428c00 	ldr	x0, [x0, #1304]
    8fdc:	2a0103f3 	mov	w19, w1
    8fe0:	b40001e0 	cbz	x0, 901c <_raise_r+0x5c>
    8fe4:	93407c22 	sxtw	x2, w1
    8fe8:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    8fec:	b4000181 	cbz	x1, 901c <_raise_r+0x5c>
    8ff0:	f100043f 	cmp	x1, #0x1
    8ff4:	54000300 	b.eq	9054 <_raise_r+0x94>  // b.none
    8ff8:	b100043f 	cmn	x1, #0x1
    8ffc:	54000200 	b.eq	903c <_raise_r+0x7c>  // b.none
    9000:	f822781f 	str	xzr, [x0, x2, lsl #3]
    9004:	2a1303e0 	mov	w0, w19
    9008:	d63f0020 	blr	x1
    900c:	52800000 	mov	w0, #0x0                   	// #0
    9010:	a94153f3 	ldp	x19, x20, [sp, #16]
    9014:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9018:	d65f03c0 	ret
    901c:	aa1403e0 	mov	x0, x20
    9020:	940000fc 	bl	9410 <_getpid_r>
    9024:	2a1303e2 	mov	w2, w19
    9028:	2a0003e1 	mov	w1, w0
    902c:	aa1403e0 	mov	x0, x20
    9030:	a94153f3 	ldp	x19, x20, [sp, #16]
    9034:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9038:	140000e2 	b	93c0 <_kill_r>
    903c:	528002c1 	mov	w1, #0x16                  	// #22
    9040:	b9000281 	str	w1, [x20]
    9044:	52800020 	mov	w0, #0x1                   	// #1
    9048:	a94153f3 	ldp	x19, x20, [sp, #16]
    904c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9050:	d65f03c0 	ret
    9054:	52800000 	mov	w0, #0x0                   	// #0
    9058:	a94153f3 	ldp	x19, x20, [sp, #16]
    905c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9060:	d65f03c0 	ret
    9064:	528002c1 	mov	w1, #0x16                  	// #22
    9068:	12800000 	mov	w0, #0xffffffff            	// #-1
    906c:	b9000281 	str	w1, [x20]
    9070:	17ffffe8 	b	9010 <_raise_r+0x50>
    9074:	d503201f 	nop
    9078:	d503201f 	nop
    907c:	d503201f 	nop

0000000000009080 <__sigtramp_r>:
    9080:	71007c3f 	cmp	w1, #0x1f
    9084:	540005a8 	b.hi	9138 <__sigtramp_r+0xb8>  // b.pmore
    9088:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    908c:	910003fd 	mov	x29, sp
    9090:	f9428c03 	ldr	x3, [x0, #1304]
    9094:	a90153f3 	stp	x19, x20, [sp, #16]
    9098:	2a0103f3 	mov	w19, w1
    909c:	aa0003f4 	mov	x20, x0
    90a0:	b4000263 	cbz	x3, 90ec <__sigtramp_r+0x6c>
    90a4:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    90a8:	8b33cc63 	add	x3, x3, w19, sxtw #3
    90ac:	b4000181 	cbz	x1, 90dc <__sigtramp_r+0x5c>
    90b0:	b100043f 	cmn	x1, #0x1
    90b4:	540003a0 	b.eq	9128 <__sigtramp_r+0xa8>  // b.none
    90b8:	f100043f 	cmp	x1, #0x1
    90bc:	540002e0 	b.eq	9118 <__sigtramp_r+0x98>  // b.none
    90c0:	f900007f 	str	xzr, [x3]
    90c4:	2a1303e0 	mov	w0, w19
    90c8:	d63f0020 	blr	x1
    90cc:	52800000 	mov	w0, #0x0                   	// #0
    90d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    90d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    90d8:	d65f03c0 	ret
    90dc:	52800020 	mov	w0, #0x1                   	// #1
    90e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    90e4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    90e8:	d65f03c0 	ret
    90ec:	d2802001 	mov	x1, #0x100                 	// #256
    90f0:	97ffe7d4 	bl	3040 <_malloc_r>
    90f4:	f9028e80 	str	x0, [x20, #1304]
    90f8:	aa0003e3 	mov	x3, x0
    90fc:	b40001a0 	cbz	x0, 9130 <__sigtramp_r+0xb0>
    9100:	aa0003e2 	mov	x2, x0
    9104:	91040000 	add	x0, x0, #0x100
    9108:	f800845f 	str	xzr, [x2], #8
    910c:	eb00005f 	cmp	x2, x0
    9110:	54ffffc1 	b.ne	9108 <__sigtramp_r+0x88>  // b.any
    9114:	17ffffe4 	b	90a4 <__sigtramp_r+0x24>
    9118:	52800060 	mov	w0, #0x3                   	// #3
    911c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9120:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9124:	d65f03c0 	ret
    9128:	52800040 	mov	w0, #0x2                   	// #2
    912c:	17ffffe9 	b	90d0 <__sigtramp_r+0x50>
    9130:	12800000 	mov	w0, #0xffffffff            	// #-1
    9134:	17ffffe7 	b	90d0 <__sigtramp_r+0x50>
    9138:	12800000 	mov	w0, #0xffffffff            	// #-1
    913c:	d65f03c0 	ret

0000000000009140 <raise>:
    9140:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9144:	f0000001 	adrp	x1, c000 <IpcTestNull+0x6e8>
    9148:	910003fd 	mov	x29, sp
    914c:	a90153f3 	stp	x19, x20, [sp, #16]
    9150:	f9409834 	ldr	x20, [x1, #304]
    9154:	71007c1f 	cmp	w0, #0x1f
    9158:	54000468 	b.hi	91e4 <raise+0xa4>  // b.pmore
    915c:	f9428e82 	ldr	x2, [x20, #1304]
    9160:	2a0003f3 	mov	w19, w0
    9164:	b40001c2 	cbz	x2, 919c <raise+0x5c>
    9168:	93407c03 	sxtw	x3, w0
    916c:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    9170:	b4000161 	cbz	x1, 919c <raise+0x5c>
    9174:	f100043f 	cmp	x1, #0x1
    9178:	540002e0 	b.eq	91d4 <raise+0x94>  // b.none
    917c:	b100043f 	cmn	x1, #0x1
    9180:	540001e0 	b.eq	91bc <raise+0x7c>  // b.none
    9184:	f823785f 	str	xzr, [x2, x3, lsl #3]
    9188:	d63f0020 	blr	x1
    918c:	52800000 	mov	w0, #0x0                   	// #0
    9190:	a94153f3 	ldp	x19, x20, [sp, #16]
    9194:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9198:	d65f03c0 	ret
    919c:	aa1403e0 	mov	x0, x20
    91a0:	9400009c 	bl	9410 <_getpid_r>
    91a4:	2a1303e2 	mov	w2, w19
    91a8:	2a0003e1 	mov	w1, w0
    91ac:	aa1403e0 	mov	x0, x20
    91b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    91b4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    91b8:	14000082 	b	93c0 <_kill_r>
    91bc:	528002c1 	mov	w1, #0x16                  	// #22
    91c0:	b9000281 	str	w1, [x20]
    91c4:	52800020 	mov	w0, #0x1                   	// #1
    91c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    91cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    91d0:	d65f03c0 	ret
    91d4:	52800000 	mov	w0, #0x0                   	// #0
    91d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    91dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    91e0:	d65f03c0 	ret
    91e4:	528002c1 	mov	w1, #0x16                  	// #22
    91e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    91ec:	b9000281 	str	w1, [x20]
    91f0:	17ffffe8 	b	9190 <raise+0x50>
    91f4:	d503201f 	nop
    91f8:	d503201f 	nop
    91fc:	d503201f 	nop

0000000000009200 <signal>:
    9200:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9204:	f0000002 	adrp	x2, c000 <IpcTestNull+0x6e8>
    9208:	910003fd 	mov	x29, sp
    920c:	a90153f3 	stp	x19, x20, [sp, #16]
    9210:	93407c13 	sxtw	x19, w0
    9214:	f90013f5 	str	x21, [sp, #32]
    9218:	f9409855 	ldr	x21, [x2, #304]
    921c:	71007e7f 	cmp	w19, #0x1f
    9220:	54000148 	b.hi	9248 <signal+0x48>  // b.pmore
    9224:	aa0103f4 	mov	x20, x1
    9228:	f9428ea1 	ldr	x1, [x21, #1304]
    922c:	b40001c1 	cbz	x1, 9264 <signal+0x64>
    9230:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    9234:	f8337834 	str	x20, [x1, x19, lsl #3]
    9238:	a94153f3 	ldp	x19, x20, [sp, #16]
    923c:	f94013f5 	ldr	x21, [sp, #32]
    9240:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9244:	d65f03c0 	ret
    9248:	528002c1 	mov	w1, #0x16                  	// #22
    924c:	b90002a1 	str	w1, [x21]
    9250:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9254:	a94153f3 	ldp	x19, x20, [sp, #16]
    9258:	f94013f5 	ldr	x21, [sp, #32]
    925c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9260:	d65f03c0 	ret
    9264:	d2802001 	mov	x1, #0x100                 	// #256
    9268:	aa1503e0 	mov	x0, x21
    926c:	97ffe775 	bl	3040 <_malloc_r>
    9270:	f9028ea0 	str	x0, [x21, #1304]
    9274:	aa0003e1 	mov	x1, x0
    9278:	b4000100 	cbz	x0, 9298 <signal+0x98>
    927c:	aa0003e2 	mov	x2, x0
    9280:	91040003 	add	x3, x0, #0x100
    9284:	d503201f 	nop
    9288:	f800845f 	str	xzr, [x2], #8
    928c:	eb02007f 	cmp	x3, x2
    9290:	54ffffc1 	b.ne	9288 <signal+0x88>  // b.any
    9294:	17ffffe7 	b	9230 <signal+0x30>
    9298:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    929c:	17ffffe7 	b	9238 <signal+0x38>

00000000000092a0 <_init_signal>:
    92a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    92a4:	f0000000 	adrp	x0, c000 <IpcTestNull+0x6e8>
    92a8:	910003fd 	mov	x29, sp
    92ac:	f9000bf3 	str	x19, [sp, #16]
    92b0:	f9409813 	ldr	x19, [x0, #304]
    92b4:	f9428e60 	ldr	x0, [x19, #1304]
    92b8:	b40000a0 	cbz	x0, 92cc <_init_signal+0x2c>
    92bc:	52800000 	mov	w0, #0x0                   	// #0
    92c0:	f9400bf3 	ldr	x19, [sp, #16]
    92c4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    92c8:	d65f03c0 	ret
    92cc:	aa1303e0 	mov	x0, x19
    92d0:	d2802001 	mov	x1, #0x100                 	// #256
    92d4:	97ffe75b 	bl	3040 <_malloc_r>
    92d8:	f9028e60 	str	x0, [x19, #1304]
    92dc:	b40000e0 	cbz	x0, 92f8 <_init_signal+0x58>
    92e0:	91040001 	add	x1, x0, #0x100
    92e4:	d503201f 	nop
    92e8:	f800841f 	str	xzr, [x0], #8
    92ec:	eb01001f 	cmp	x0, x1
    92f0:	54ffffc1 	b.ne	92e8 <_init_signal+0x48>  // b.any
    92f4:	17fffff2 	b	92bc <_init_signal+0x1c>
    92f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    92fc:	17fffff1 	b	92c0 <_init_signal+0x20>

0000000000009300 <__sigtramp>:
    9300:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9304:	f0000001 	adrp	x1, c000 <IpcTestNull+0x6e8>
    9308:	910003fd 	mov	x29, sp
    930c:	a90153f3 	stp	x19, x20, [sp, #16]
    9310:	f9409834 	ldr	x20, [x1, #304]
    9314:	71007c1f 	cmp	w0, #0x1f
    9318:	54000508 	b.hi	93b8 <__sigtramp+0xb8>  // b.pmore
    931c:	f9428e82 	ldr	x2, [x20, #1304]
    9320:	2a0003f3 	mov	w19, w0
    9324:	b4000262 	cbz	x2, 9370 <__sigtramp+0x70>
    9328:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    932c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    9330:	b4000181 	cbz	x1, 9360 <__sigtramp+0x60>
    9334:	b100043f 	cmn	x1, #0x1
    9338:	540003c0 	b.eq	93b0 <__sigtramp+0xb0>  // b.none
    933c:	f100043f 	cmp	x1, #0x1
    9340:	54000300 	b.eq	93a0 <__sigtramp+0xa0>  // b.none
    9344:	f900005f 	str	xzr, [x2]
    9348:	2a1303e0 	mov	w0, w19
    934c:	d63f0020 	blr	x1
    9350:	52800000 	mov	w0, #0x0                   	// #0
    9354:	a94153f3 	ldp	x19, x20, [sp, #16]
    9358:	a8c27bfd 	ldp	x29, x30, [sp], #32
    935c:	d65f03c0 	ret
    9360:	52800020 	mov	w0, #0x1                   	// #1
    9364:	a94153f3 	ldp	x19, x20, [sp, #16]
    9368:	a8c27bfd 	ldp	x29, x30, [sp], #32
    936c:	d65f03c0 	ret
    9370:	aa1403e0 	mov	x0, x20
    9374:	d2802001 	mov	x1, #0x100                 	// #256
    9378:	97ffe732 	bl	3040 <_malloc_r>
    937c:	f9028e80 	str	x0, [x20, #1304]
    9380:	aa0003e2 	mov	x2, x0
    9384:	b40001a0 	cbz	x0, 93b8 <__sigtramp+0xb8>
    9388:	aa0003e1 	mov	x1, x0
    938c:	91040000 	add	x0, x0, #0x100
    9390:	f800843f 	str	xzr, [x1], #8
    9394:	eb00003f 	cmp	x1, x0
    9398:	54ffffc1 	b.ne	9390 <__sigtramp+0x90>  // b.any
    939c:	17ffffe3 	b	9328 <__sigtramp+0x28>
    93a0:	52800060 	mov	w0, #0x3                   	// #3
    93a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    93a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    93ac:	d65f03c0 	ret
    93b0:	52800040 	mov	w0, #0x2                   	// #2
    93b4:	17ffffe8 	b	9354 <__sigtramp+0x54>
    93b8:	12800000 	mov	w0, #0xffffffff            	// #-1
    93bc:	17ffffe6 	b	9354 <__sigtramp+0x54>

00000000000093c0 <_kill_r>:
    93c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    93c4:	910003fd 	mov	x29, sp
    93c8:	a90153f3 	stp	x19, x20, [sp, #16]
    93cc:	90000034 	adrp	x20, d000 <__malloc_av_+0x780>
    93d0:	aa0003f3 	mov	x19, x0
    93d4:	b905da9f 	str	wzr, [x20, #1496]
    93d8:	2a0103e0 	mov	w0, w1
    93dc:	2a0203e1 	mov	w1, w2
    93e0:	97ffe668 	bl	2d80 <_kill>
    93e4:	3100041f 	cmn	w0, #0x1
    93e8:	54000080 	b.eq	93f8 <_kill_r+0x38>  // b.none
    93ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    93f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    93f4:	d65f03c0 	ret
    93f8:	b945da81 	ldr	w1, [x20, #1496]
    93fc:	34ffff81 	cbz	w1, 93ec <_kill_r+0x2c>
    9400:	b9000261 	str	w1, [x19]
    9404:	a94153f3 	ldp	x19, x20, [sp, #16]
    9408:	a8c27bfd 	ldp	x29, x30, [sp], #32
    940c:	d65f03c0 	ret

0000000000009410 <_getpid_r>:
    9410:	17ffe660 	b	2d90 <_getpid>
    9414:	d503201f 	nop
    9418:	d503201f 	nop
    941c:	d503201f 	nop

0000000000009420 <__sread>:
    9420:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9424:	93407c63 	sxtw	x3, w3
    9428:	910003fd 	mov	x29, sp
    942c:	f9000bf3 	str	x19, [sp, #16]
    9430:	aa0103f3 	mov	x19, x1
    9434:	79c02421 	ldrsh	w1, [x1, #18]
    9438:	94000592 	bl	aa80 <_read_r>
    943c:	b7f800e0 	tbnz	x0, #63, 9458 <__sread+0x38>
    9440:	f9404a61 	ldr	x1, [x19, #144]
    9444:	8b000021 	add	x1, x1, x0
    9448:	f9004a61 	str	x1, [x19, #144]
    944c:	f9400bf3 	ldr	x19, [sp, #16]
    9450:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9454:	d65f03c0 	ret
    9458:	79402261 	ldrh	w1, [x19, #16]
    945c:	12137821 	and	w1, w1, #0xffffefff
    9460:	79002261 	strh	w1, [x19, #16]
    9464:	f9400bf3 	ldr	x19, [sp, #16]
    9468:	a8c27bfd 	ldp	x29, x30, [sp], #32
    946c:	d65f03c0 	ret

0000000000009470 <__seofread>:
    9470:	52800000 	mov	w0, #0x0                   	// #0
    9474:	d65f03c0 	ret
    9478:	d503201f 	nop
    947c:	d503201f 	nop

0000000000009480 <__swrite>:
    9480:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9484:	910003fd 	mov	x29, sp
    9488:	79c02024 	ldrsh	w4, [x1, #16]
    948c:	a90153f3 	stp	x19, x20, [sp, #16]
    9490:	aa0103f3 	mov	x19, x1
    9494:	aa0003f4 	mov	x20, x0
    9498:	a9025bf5 	stp	x21, x22, [sp, #32]
    949c:	aa0203f5 	mov	x21, x2
    94a0:	2a0303f6 	mov	w22, w3
    94a4:	37400184 	tbnz	w4, #8, 94d4 <__swrite+0x54>
    94a8:	79c02661 	ldrsh	w1, [x19, #18]
    94ac:	12137884 	and	w4, w4, #0xffffefff
    94b0:	79002264 	strh	w4, [x19, #16]
    94b4:	93407ec3 	sxtw	x3, w22
    94b8:	aa1503e2 	mov	x2, x21
    94bc:	aa1403e0 	mov	x0, x20
    94c0:	94000450 	bl	a600 <_write_r>
    94c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    94c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    94cc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    94d0:	d65f03c0 	ret
    94d4:	79c02421 	ldrsh	w1, [x1, #18]
    94d8:	52800043 	mov	w3, #0x2                   	// #2
    94dc:	d2800002 	mov	x2, #0x0                   	// #0
    94e0:	94000550 	bl	aa20 <_lseek_r>
    94e4:	79c02264 	ldrsh	w4, [x19, #16]
    94e8:	17fffff0 	b	94a8 <__swrite+0x28>
    94ec:	d503201f 	nop

00000000000094f0 <__sseek>:
    94f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    94f4:	910003fd 	mov	x29, sp
    94f8:	f9000bf3 	str	x19, [sp, #16]
    94fc:	aa0103f3 	mov	x19, x1
    9500:	79c02421 	ldrsh	w1, [x1, #18]
    9504:	94000547 	bl	aa20 <_lseek_r>
    9508:	79402261 	ldrh	w1, [x19, #16]
    950c:	b100041f 	cmn	x0, #0x1
    9510:	540000e0 	b.eq	952c <__sseek+0x3c>  // b.none
    9514:	32140021 	orr	w1, w1, #0x1000
    9518:	79002261 	strh	w1, [x19, #16]
    951c:	f9004a60 	str	x0, [x19, #144]
    9520:	f9400bf3 	ldr	x19, [sp, #16]
    9524:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9528:	d65f03c0 	ret
    952c:	12137821 	and	w1, w1, #0xffffefff
    9530:	79002261 	strh	w1, [x19, #16]
    9534:	f9400bf3 	ldr	x19, [sp, #16]
    9538:	a8c27bfd 	ldp	x29, x30, [sp], #32
    953c:	d65f03c0 	ret

0000000000009540 <__sclose>:
    9540:	79c02421 	ldrsh	w1, [x1, #18]
    9544:	14000447 	b	a660 <_close_r>
    9548:	d503201f 	nop
    954c:	d503201f 	nop

0000000000009550 <strcasecmp>:
    9550:	d0000006 	adrp	x6, b000 <pow10.0+0x80>
    9554:	aa0003e8 	mov	x8, x0
    9558:	911fa4c6 	add	x6, x6, #0x7e9
    955c:	d2800003 	mov	x3, #0x0                   	// #0
    9560:	38636902 	ldrb	w2, [x8, x3]
    9564:	38636820 	ldrb	w0, [x1, x3]
    9568:	91000463 	add	x3, x3, #0x1
    956c:	92401c45 	and	x5, x2, #0xff
    9570:	11008047 	add	w7, w2, #0x20
    9574:	92401c04 	and	x4, x0, #0xff
    9578:	386568c5 	ldrb	w5, [x6, x5]
    957c:	386468c4 	ldrb	w4, [x6, x4]
    9580:	120004a5 	and	w5, w5, #0x3
    9584:	710004bf 	cmp	w5, #0x1
    9588:	12000484 	and	w4, w4, #0x3
    958c:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    9590:	7100049f 	cmp	w4, #0x1
    9594:	540000a0 	b.eq	95a8 <strcasecmp+0x58>  // b.none
    9598:	6b000042 	subs	w2, w2, w0
    959c:	540000e1 	b.ne	95b8 <strcasecmp+0x68>  // b.any
    95a0:	35fffe00 	cbnz	w0, 9560 <strcasecmp+0x10>
    95a4:	d65f03c0 	ret
    95a8:	11008000 	add	w0, w0, #0x20
    95ac:	6b000040 	subs	w0, w2, w0
    95b0:	54fffd80 	b.eq	9560 <strcasecmp+0x10>  // b.none
    95b4:	d65f03c0 	ret
    95b8:	2a0203e0 	mov	w0, w2
    95bc:	d65f03c0 	ret

00000000000095c0 <strcat>:
    95c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    95c4:	910003fd 	mov	x29, sp
    95c8:	f9000bf3 	str	x19, [sp, #16]
    95cc:	aa0003f3 	mov	x19, x0
    95d0:	f240081f 	tst	x0, #0x7
    95d4:	540001c1 	b.ne	960c <strcat+0x4c>  // b.any
    95d8:	f9400002 	ldr	x2, [x0]
    95dc:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    95e0:	f29fdfe4 	movk	x4, #0xfeff
    95e4:	8b040043 	add	x3, x2, x4
    95e8:	8a220062 	bic	x2, x3, x2
    95ec:	f201c05f 	tst	x2, #0x8080808080808080
    95f0:	540000e1 	b.ne	960c <strcat+0x4c>  // b.any
    95f4:	d503201f 	nop
    95f8:	f8408c02 	ldr	x2, [x0, #8]!
    95fc:	8b040043 	add	x3, x2, x4
    9600:	8a220062 	bic	x2, x3, x2
    9604:	f201c05f 	tst	x2, #0x8080808080808080
    9608:	54ffff80 	b.eq	95f8 <strcat+0x38>  // b.none
    960c:	39400002 	ldrb	w2, [x0]
    9610:	34000082 	cbz	w2, 9620 <strcat+0x60>
    9614:	d503201f 	nop
    9618:	38401c02 	ldrb	w2, [x0, #1]!
    961c:	35ffffe2 	cbnz	w2, 9618 <strcat+0x58>
    9620:	94000088 	bl	9840 <strcpy>
    9624:	aa1303e0 	mov	x0, x19
    9628:	f9400bf3 	ldr	x19, [sp, #16]
    962c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9630:	d65f03c0 	ret

0000000000009634 <strchr>:
    9634:	52808024 	mov	w4, #0x401                 	// #1025
    9638:	72a80204 	movk	w4, #0x4010, lsl #16
    963c:	4e010c20 	dup	v0.16b, w1
    9640:	927be802 	and	x2, x0, #0xffffffffffffffe0
    9644:	4e040c90 	dup	v16.4s, w4
    9648:	f2401003 	ands	x3, x0, #0x1f
    964c:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    9650:	540002a0 	b.eq	96a4 <strchr+0x70>  // b.none
    9654:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    9658:	cb0303e3 	neg	x3, x3
    965c:	4e209823 	cmeq	v3.16b, v1.16b, #0
    9660:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    9664:	4e209844 	cmeq	v4.16b, v2.16b, #0
    9668:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    966c:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    9670:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    9674:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    9678:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    967c:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    9680:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9684:	d37ff863 	lsl	x3, x3, #1
    9688:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    968c:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    9690:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9694:	9ac324a3 	lsr	x3, x5, x3
    9698:	4e083e25 	mov	x5, v17.d[0]
    969c:	8a2300a3 	bic	x3, x5, x3
    96a0:	b50002a3 	cbnz	x3, 96f4 <strchr+0xc0>
    96a4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    96a8:	4e209823 	cmeq	v3.16b, v1.16b, #0
    96ac:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    96b0:	4e209844 	cmeq	v4.16b, v2.16b, #0
    96b4:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    96b8:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    96bc:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    96c0:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    96c4:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    96c8:	4e083e23 	mov	x3, v17.d[0]
    96cc:	b4fffec3 	cbz	x3, 96a4 <strchr+0x70>
    96d0:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    96d4:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    96d8:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    96dc:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    96e0:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    96e4:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    96e8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    96ec:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    96f0:	4e083e23 	mov	x3, v17.d[0]
    96f4:	dac00063 	rbit	x3, x3
    96f8:	d1008042 	sub	x2, x2, #0x20
    96fc:	dac01063 	clz	x3, x3
    9700:	f240007f 	tst	x3, #0x1
    9704:	8b430440 	add	x0, x2, x3, lsr #1
    9708:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    970c:	d65f03c0 	ret
    9710:	d503201f 	nop
    9714:	d503201f 	nop
    9718:	d503201f 	nop
    971c:	d503201f 	nop
    9720:	d503201f 	nop
    9724:	d503201f 	nop
    9728:	d503201f 	nop
    972c:	d503201f 	nop
    9730:	d503201f 	nop
    9734:	d503201f 	nop
    9738:	d503201f 	nop
    973c:	d503201f 	nop

0000000000009740 <strcmp>:
    9740:	ca010007 	eor	x7, x0, x1
    9744:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    9748:	f24008ff 	tst	x7, #0x7
    974c:	540003e1 	b.ne	97c8 <strcmp+0x88>  // b.any
    9750:	f2400807 	ands	x7, x0, #0x7
    9754:	54000241 	b.ne	979c <strcmp+0x5c>  // b.any
    9758:	f8408402 	ldr	x2, [x0], #8
    975c:	f8408423 	ldr	x3, [x1], #8
    9760:	cb0a0047 	sub	x7, x2, x10
    9764:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    9768:	ca030045 	eor	x5, x2, x3
    976c:	8a2800e4 	bic	x4, x7, x8
    9770:	aa0400a6 	orr	x6, x5, x4
    9774:	b4ffff26 	cbz	x6, 9758 <strcmp+0x18>
    9778:	dac00cc6 	rev	x6, x6
    977c:	dac00c42 	rev	x2, x2
    9780:	dac010cb 	clz	x11, x6
    9784:	dac00c63 	rev	x3, x3
    9788:	9acb2042 	lsl	x2, x2, x11
    978c:	9acb2063 	lsl	x3, x3, x11
    9790:	d378fc42 	lsr	x2, x2, #56
    9794:	cb43e040 	sub	x0, x2, x3, lsr #56
    9798:	d65f03c0 	ret
    979c:	927df000 	and	x0, x0, #0xfffffffffffffff8
    97a0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    97a4:	d37df0e7 	lsl	x7, x7, #3
    97a8:	f8408402 	ldr	x2, [x0], #8
    97ac:	cb0703e7 	neg	x7, x7
    97b0:	f8408423 	ldr	x3, [x1], #8
    97b4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    97b8:	9ac72508 	lsr	x8, x8, x7
    97bc:	aa080042 	orr	x2, x2, x8
    97c0:	aa080063 	orr	x3, x3, x8
    97c4:	17ffffe7 	b	9760 <strcmp+0x20>
    97c8:	f240081f 	tst	x0, #0x7
    97cc:	54000100 	b.eq	97ec <strcmp+0xac>  // b.none
    97d0:	38401402 	ldrb	w2, [x0], #1
    97d4:	38401423 	ldrb	w3, [x1], #1
    97d8:	7100045f 	cmp	w2, #0x1
    97dc:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    97e0:	540001e1 	b.ne	981c <strcmp+0xdc>  // b.any
    97e4:	f240081f 	tst	x0, #0x7
    97e8:	54ffff41 	b.ne	97d0 <strcmp+0x90>  // b.any
    97ec:	927d2027 	and	x7, x1, #0xff8
    97f0:	d27d20e7 	eor	x7, x7, #0xff8
    97f4:	b4fffee7 	cbz	x7, 97d0 <strcmp+0x90>
    97f8:	f8408402 	ldr	x2, [x0], #8
    97fc:	f8408423 	ldr	x3, [x1], #8
    9800:	cb0a0047 	sub	x7, x2, x10
    9804:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    9808:	ca030045 	eor	x5, x2, x3
    980c:	8a2800e4 	bic	x4, x7, x8
    9810:	aa0400a6 	orr	x6, x5, x4
    9814:	b4fffec6 	cbz	x6, 97ec <strcmp+0xac>
    9818:	17ffffd8 	b	9778 <strcmp+0x38>
    981c:	cb030040 	sub	x0, x2, x3
    9820:	d65f03c0 	ret
    9824:	d503201f 	nop
    9828:	d503201f 	nop
    982c:	d503201f 	nop
    9830:	d503201f 	nop
    9834:	d503201f 	nop
    9838:	d503201f 	nop
    983c:	d503201f 	nop

0000000000009840 <strcpy>:
    9840:	92402c29 	and	x9, x1, #0xfff
    9844:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    9848:	92400c31 	and	x17, x1, #0xf
    984c:	f13fc13f 	cmp	x9, #0xff0
    9850:	cb1103e8 	neg	x8, x17
    9854:	540008cc 	b.gt	996c <strcpy+0x12c>
    9858:	a9401424 	ldp	x4, x5, [x1]
    985c:	cb0c0088 	sub	x8, x4, x12
    9860:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9864:	ea290106 	bics	x6, x8, x9
    9868:	540001c1 	b.ne	98a0 <strcpy+0x60>  // b.any
    986c:	cb0c00aa 	sub	x10, x5, x12
    9870:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9874:	ea2b0147 	bics	x7, x10, x11
    9878:	54000440 	b.eq	9900 <strcpy+0xc0>  // b.none
    987c:	dac00ce7 	rev	x7, x7
    9880:	dac010ef 	clz	x15, x7
    9884:	d2800709 	mov	x9, #0x38                  	// #56
    9888:	8b4f0c03 	add	x3, x0, x15, lsr #3
    988c:	cb0f012f 	sub	x15, x9, x15
    9890:	9acf20a5 	lsl	x5, x5, x15
    9894:	f8001065 	stur	x5, [x3, #1]
    9898:	f9000004 	str	x4, [x0]
    989c:	d65f03c0 	ret
    98a0:	dac00cc6 	rev	x6, x6
    98a4:	dac010cf 	clz	x15, x6
    98a8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    98ac:	f10061e9 	subs	x9, x15, #0x18
    98b0:	540000ab 	b.lt	98c4 <strcpy+0x84>  // b.tstop
    98b4:	9ac92485 	lsr	x5, x4, x9
    98b8:	b81fd065 	stur	w5, [x3, #-3]
    98bc:	b9000004 	str	w4, [x0]
    98c0:	d65f03c0 	ret
    98c4:	b400004f 	cbz	x15, 98cc <strcpy+0x8c>
    98c8:	79000004 	strh	w4, [x0]
    98cc:	3900007f 	strb	wzr, [x3]
    98d0:	d65f03c0 	ret
    98d4:	d503201f 	nop
    98d8:	d503201f 	nop
    98dc:	d503201f 	nop
    98e0:	d503201f 	nop
    98e4:	d503201f 	nop
    98e8:	d503201f 	nop
    98ec:	d503201f 	nop
    98f0:	d503201f 	nop
    98f4:	d503201f 	nop
    98f8:	d503201f 	nop
    98fc:	d503201f 	nop
    9900:	d1004231 	sub	x17, x17, #0x10
    9904:	a9001404 	stp	x4, x5, [x0]
    9908:	cb110022 	sub	x2, x1, x17
    990c:	cb110003 	sub	x3, x0, x17
    9910:	14000002 	b	9918 <strcpy+0xd8>
    9914:	a8811464 	stp	x4, x5, [x3], #16
    9918:	a8c11444 	ldp	x4, x5, [x2], #16
    991c:	cb0c0088 	sub	x8, x4, x12
    9920:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9924:	cb0c00aa 	sub	x10, x5, x12
    9928:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    992c:	8a290106 	bic	x6, x8, x9
    9930:	ea2b0147 	bics	x7, x10, x11
    9934:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    9938:	54fffee0 	b.eq	9914 <strcpy+0xd4>  // b.none
    993c:	f10000df 	cmp	x6, #0x0
    9940:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    9944:	dac00cc6 	rev	x6, x6
    9948:	dac010cf 	clz	x15, x6
    994c:	910121e8 	add	x8, x15, #0x48
    9950:	910021ef 	add	x15, x15, #0x8
    9954:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    9958:	8b4f0c42 	add	x2, x2, x15, lsr #3
    995c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    9960:	a97e1444 	ldp	x4, x5, [x2, #-32]
    9964:	a93f1464 	stp	x4, x5, [x3, #-16]
    9968:	d65f03c0 	ret
    996c:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    9970:	a9401444 	ldp	x4, x5, [x2]
    9974:	d37df108 	lsl	x8, x8, #3
    9978:	f2400a3f 	tst	x17, #0x7
    997c:	da9f03e9 	csetm	x9, ne  // ne = any
    9980:	9ac82529 	lsr	x9, x9, x8
    9984:	aa090084 	orr	x4, x4, x9
    9988:	aa0900ae 	orr	x14, x5, x9
    998c:	f100223f 	cmp	x17, #0x8
    9990:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    9994:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    9998:	cb0c0088 	sub	x8, x4, x12
    999c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    99a0:	cb0c00aa 	sub	x10, x5, x12
    99a4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    99a8:	8a290106 	bic	x6, x8, x9
    99ac:	ea2b0147 	bics	x7, x10, x11
    99b0:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    99b4:	54fff520 	b.eq	9858 <strcpy+0x18>  // b.none
    99b8:	d37df228 	lsl	x8, x17, #3
    99bc:	cb110fe9 	neg	x9, x17, lsl #3
    99c0:	9ac8248d 	lsr	x13, x4, x8
    99c4:	9ac920ab 	lsl	x11, x5, x9
    99c8:	9ac824a5 	lsr	x5, x5, x8
    99cc:	aa0d016b 	orr	x11, x11, x13
    99d0:	f100223f 	cmp	x17, #0x8
    99d4:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    99d8:	cb0c0088 	sub	x8, x4, x12
    99dc:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    99e0:	cb0c00aa 	sub	x10, x5, x12
    99e4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    99e8:	8a290106 	bic	x6, x8, x9
    99ec:	b5fff5a6 	cbnz	x6, 98a0 <strcpy+0x60>
    99f0:	8a2b0147 	bic	x7, x10, x11
    99f4:	17ffffa2 	b	987c <strcpy+0x3c>
    99f8:	d503201f 	nop
    99fc:	d503201f 	nop

0000000000009a00 <strlcpy>:
    9a00:	aa0003e4 	mov	x4, x0
    9a04:	aa0103e3 	mov	x3, x1
    9a08:	b4000202 	cbz	x2, 9a48 <strlcpy+0x48>
    9a0c:	f100045f 	cmp	x2, #0x1
    9a10:	54000180 	b.eq	9a40 <strlcpy+0x40>  // b.none
    9a14:	8b020002 	add	x2, x0, x2
    9a18:	14000003 	b	9a24 <strlcpy+0x24>
    9a1c:	ab02001f 	cmn	x0, x2
    9a20:	54000100 	b.eq	9a40 <strlcpy+0x40>  // b.none
    9a24:	38401465 	ldrb	w5, [x3], #1
    9a28:	38001485 	strb	w5, [x4], #1
    9a2c:	aa2403e0 	mvn	x0, x4
    9a30:	35ffff65 	cbnz	w5, 9a1c <strlcpy+0x1c>
    9a34:	cb010060 	sub	x0, x3, x1
    9a38:	d1000400 	sub	x0, x0, #0x1
    9a3c:	d65f03c0 	ret
    9a40:	3900009f 	strb	wzr, [x4]
    9a44:	d503201f 	nop
    9a48:	38401462 	ldrb	w2, [x3], #1
    9a4c:	34ffff42 	cbz	w2, 9a34 <strlcpy+0x34>
    9a50:	38401462 	ldrb	w2, [x3], #1
    9a54:	35ffffa2 	cbnz	w2, 9a48 <strlcpy+0x48>
    9a58:	17fffff7 	b	9a34 <strlcpy+0x34>
    9a5c:	d503201f 	nop
    9a60:	d503201f 	nop
    9a64:	d503201f 	nop
    9a68:	d503201f 	nop
    9a6c:	d503201f 	nop
    9a70:	d503201f 	nop
    9a74:	d503201f 	nop
    9a78:	d503201f 	nop
    9a7c:	d503201f 	nop

0000000000009a80 <strlen>:
    9a80:	92402c04 	and	x4, x0, #0xfff
    9a84:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    9a88:	f13fc09f 	cmp	x4, #0xff0
    9a8c:	5400082c 	b.gt	9b90 <strlen+0x110>
    9a90:	a9400c02 	ldp	x2, x3, [x0]
    9a94:	cb080044 	sub	x4, x2, x8
    9a98:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9a9c:	cb080066 	sub	x6, x3, x8
    9aa0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9aa4:	ea250084 	bics	x4, x4, x5
    9aa8:	8a2700c5 	bic	x5, x6, x7
    9aac:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9ab0:	54000100 	b.eq	9ad0 <strlen+0x50>  // b.none
    9ab4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    9ab8:	d2800100 	mov	x0, #0x8                   	// #8
    9abc:	dac00c84 	rev	x4, x4
    9ac0:	dac01084 	clz	x4, x4
    9ac4:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    9ac8:	8b440c00 	add	x0, x0, x4, lsr #3
    9acc:	d65f03c0 	ret
    9ad0:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    9ad4:	d1004021 	sub	x1, x1, #0x10
    9ad8:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    9adc:	cb080044 	sub	x4, x2, x8
    9ae0:	cb080066 	sub	x6, x3, x8
    9ae4:	aa060085 	orr	x5, x4, x6
    9ae8:	ea081cbf 	tst	x5, x8, lsl #7
    9aec:	54000101 	b.ne	9b0c <strlen+0x8c>  // b.any
    9af0:	a9410c22 	ldp	x2, x3, [x1, #16]
    9af4:	cb080044 	sub	x4, x2, x8
    9af8:	cb080066 	sub	x6, x3, x8
    9afc:	aa060085 	orr	x5, x4, x6
    9b00:	ea081cbf 	tst	x5, x8, lsl #7
    9b04:	54fffea0 	b.eq	9ad8 <strlen+0x58>  // b.none
    9b08:	91004021 	add	x1, x1, #0x10
    9b0c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9b10:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9b14:	ea250084 	bics	x4, x4, x5
    9b18:	8a2700c5 	bic	x5, x6, x7
    9b1c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9b20:	54000120 	b.eq	9b44 <strlen+0xc4>  // b.none
    9b24:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    9b28:	cb000020 	sub	x0, x1, x0
    9b2c:	dac00c84 	rev	x4, x4
    9b30:	91002005 	add	x5, x0, #0x8
    9b34:	dac01084 	clz	x4, x4
    9b38:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    9b3c:	8b440c00 	add	x0, x0, x4, lsr #3
    9b40:	d65f03c0 	ret
    9b44:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    9b48:	cb080044 	sub	x4, x2, x8
    9b4c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9b50:	cb080066 	sub	x6, x3, x8
    9b54:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9b58:	ea250084 	bics	x4, x4, x5
    9b5c:	8a2700c5 	bic	x5, x6, x7
    9b60:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9b64:	54fffe01 	b.ne	9b24 <strlen+0xa4>  // b.any
    9b68:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    9b6c:	cb080044 	sub	x4, x2, x8
    9b70:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9b74:	cb080066 	sub	x6, x3, x8
    9b78:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9b7c:	ea250084 	bics	x4, x4, x5
    9b80:	8a2700c5 	bic	x5, x6, x7
    9b84:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9b88:	54fffde0 	b.eq	9b44 <strlen+0xc4>  // b.none
    9b8c:	17ffffe6 	b	9b24 <strlen+0xa4>
    9b90:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    9b94:	a9400c22 	ldp	x2, x3, [x1]
    9b98:	d37df004 	lsl	x4, x0, #3
    9b9c:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    9ba0:	9ac420e4 	lsl	x4, x7, x4
    9ba4:	b201c084 	orr	x4, x4, #0x8080808080808080
    9ba8:	aa240042 	orn	x2, x2, x4
    9bac:	aa240065 	orn	x5, x3, x4
    9bb0:	f27d001f 	tst	x0, #0x8
    9bb4:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    9bb8:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    9bbc:	17ffffc8 	b	9adc <strlen+0x5c>

0000000000009bc0 <strncasecmp>:
    9bc0:	aa0003e9 	mov	x9, x0
    9bc4:	b4000382 	cbz	x2, 9c34 <strncasecmp+0x74>
    9bc8:	d0000007 	adrp	x7, b000 <pow10.0+0x80>
    9bcc:	d2800004 	mov	x4, #0x0                   	// #0
    9bd0:	911fa4e7 	add	x7, x7, #0x7e9
    9bd4:	14000006 	b	9bec <strncasecmp+0x2c>
    9bd8:	6b000063 	subs	w3, w3, w0
    9bdc:	54000301 	b.ne	9c3c <strncasecmp+0x7c>  // b.any
    9be0:	34000280 	cbz	w0, 9c30 <strncasecmp+0x70>
    9be4:	eb04005f 	cmp	x2, x4
    9be8:	54000260 	b.eq	9c34 <strncasecmp+0x74>  // b.none
    9bec:	38646923 	ldrb	w3, [x9, x4]
    9bf0:	38646820 	ldrb	w0, [x1, x4]
    9bf4:	91000484 	add	x4, x4, #0x1
    9bf8:	92401c66 	and	x6, x3, #0xff
    9bfc:	11008068 	add	w8, w3, #0x20
    9c00:	92401c05 	and	x5, x0, #0xff
    9c04:	386668e6 	ldrb	w6, [x7, x6]
    9c08:	386568e5 	ldrb	w5, [x7, x5]
    9c0c:	120004c6 	and	w6, w6, #0x3
    9c10:	710004df 	cmp	w6, #0x1
    9c14:	120004a5 	and	w5, w5, #0x3
    9c18:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    9c1c:	710004bf 	cmp	w5, #0x1
    9c20:	54fffdc1 	b.ne	9bd8 <strncasecmp+0x18>  // b.any
    9c24:	11008000 	add	w0, w0, #0x20
    9c28:	6b000060 	subs	w0, w3, w0
    9c2c:	54fffdc0 	b.eq	9be4 <strncasecmp+0x24>  // b.none
    9c30:	d65f03c0 	ret
    9c34:	52800000 	mov	w0, #0x0                   	// #0
    9c38:	d65f03c0 	ret
    9c3c:	2a0303e0 	mov	w0, w3
    9c40:	d65f03c0 	ret
    9c44:	d503201f 	nop
    9c48:	d503201f 	nop
    9c4c:	d503201f 	nop

0000000000009c50 <strncpy>:
    9c50:	aa000023 	orr	x3, x1, x0
    9c54:	f240087f 	tst	x3, #0x7
    9c58:	aa0003e3 	mov	x3, x0
    9c5c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    9c60:	540002c8 	b.hi	9cb8 <strncpy+0x68>  // b.pmore
    9c64:	d1000445 	sub	x5, x2, #0x1
    9c68:	d2800027 	mov	x7, #0x1                   	// #1
    9c6c:	8b050025 	add	x5, x1, x5
    9c70:	14000007 	b	9c8c <strncpy+0x3c>
    9c74:	386468a4 	ldrb	w4, [x5, x4]
    9c78:	d1000446 	sub	x6, x2, #0x1
    9c7c:	38001424 	strb	w4, [x1], #1
    9c80:	340000e4 	cbz	w4, 9c9c <strncpy+0x4c>
    9c84:	aa0103e3 	mov	x3, x1
    9c88:	aa0603e2 	mov	x2, x6
    9c8c:	cb0200e4 	sub	x4, x7, x2
    9c90:	aa0303e1 	mov	x1, x3
    9c94:	b5ffff02 	cbnz	x2, 9c74 <strncpy+0x24>
    9c98:	d65f03c0 	ret
    9c9c:	8b020062 	add	x2, x3, x2
    9ca0:	b4ffffc6 	cbz	x6, 9c98 <strncpy+0x48>
    9ca4:	d503201f 	nop
    9ca8:	3800143f 	strb	wzr, [x1], #1
    9cac:	eb02003f 	cmp	x1, x2
    9cb0:	54ffffc1 	b.ne	9ca8 <strncpy+0x58>  // b.any
    9cb4:	d65f03c0 	ret
    9cb8:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    9cbc:	f29fdfe6 	movk	x6, #0xfeff
    9cc0:	f9400025 	ldr	x5, [x1]
    9cc4:	8b0600a4 	add	x4, x5, x6
    9cc8:	8a250084 	bic	x4, x4, x5
    9ccc:	f201c09f 	tst	x4, #0x8080808080808080
    9cd0:	54fffca1 	b.ne	9c64 <strncpy+0x14>  // b.any
    9cd4:	d1002042 	sub	x2, x2, #0x8
    9cd8:	f8008465 	str	x5, [x3], #8
    9cdc:	91002021 	add	x1, x1, #0x8
    9ce0:	f1001c5f 	cmp	x2, #0x7
    9ce4:	54fffee8 	b.hi	9cc0 <strncpy+0x70>  // b.pmore
    9ce8:	17ffffdf 	b	9c64 <strncpy+0x14>
    9cec:	d503201f 	nop

0000000000009cf0 <_strtol_l.part.0>:
    9cf0:	d0000007 	adrp	x7, b000 <pow10.0+0x80>
    9cf4:	aa0003ec 	mov	x12, x0
    9cf8:	aa0103e6 	mov	x6, x1
    9cfc:	911fa4e7 	add	x7, x7, #0x7e9
    9d00:	aa0603e8 	mov	x8, x6
    9d04:	384014c4 	ldrb	w4, [x6], #1
    9d08:	92401c85 	and	x5, x4, #0xff
    9d0c:	386568e5 	ldrb	w5, [x7, x5]
    9d10:	371fff85 	tbnz	w5, #3, 9d00 <_strtol_l.part.0+0x10>
    9d14:	2a0403e5 	mov	w5, w4
    9d18:	7100b49f 	cmp	w4, #0x2d
    9d1c:	54000880 	b.eq	9e2c <_strtol_l.part.0+0x13c>  // b.none
    9d20:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    9d24:	5280000d 	mov	w13, #0x0                   	// #0
    9d28:	7100ac9f 	cmp	w4, #0x2b
    9d2c:	540006a0 	b.eq	9e00 <_strtol_l.part.0+0x110>  // b.none
    9d30:	721b787f 	tst	w3, #0xffffffef
    9d34:	54000121 	b.ne	9d58 <_strtol_l.part.0+0x68>  // b.any
    9d38:	7100c0bf 	cmp	w5, #0x30
    9d3c:	54000820 	b.eq	9e40 <_strtol_l.part.0+0x150>  // b.none
    9d40:	350000c3 	cbnz	w3, 9d58 <_strtol_l.part.0+0x68>
    9d44:	d280014a 	mov	x10, #0xa                   	// #10
    9d48:	2a0a03e3 	mov	w3, w10
    9d4c:	14000004 	b	9d5c <_strtol_l.part.0+0x6c>
    9d50:	34000903 	cbz	w3, 9e70 <_strtol_l.part.0+0x180>
    9d54:	d503201f 	nop
    9d58:	93407c6a 	sxtw	x10, w3
    9d5c:	9aca0968 	udiv	x8, x11, x10
    9d60:	52800007 	mov	w7, #0x0                   	// #0
    9d64:	d2800000 	mov	x0, #0x0                   	// #0
    9d68:	1b0aad09 	msub	w9, w8, w10, w11
    9d6c:	d503201f 	nop
    9d70:	5100c0a4 	sub	w4, w5, #0x30
    9d74:	7100249f 	cmp	w4, #0x9
    9d78:	540000a9 	b.ls	9d8c <_strtol_l.part.0+0x9c>  // b.plast
    9d7c:	510104a4 	sub	w4, w5, #0x41
    9d80:	7100649f 	cmp	w4, #0x19
    9d84:	54000208 	b.hi	9dc4 <_strtol_l.part.0+0xd4>  // b.pmore
    9d88:	5100dca4 	sub	w4, w5, #0x37
    9d8c:	6b04007f 	cmp	w3, w4
    9d90:	5400028d 	b.le	9de0 <_strtol_l.part.0+0xf0>
    9d94:	710000ff 	cmp	w7, #0x0
    9d98:	12800007 	mov	w7, #0xffffffff            	// #-1
    9d9c:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    9da0:	540000e3 	b.cc	9dbc <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    9da4:	eb00011f 	cmp	x8, x0
    9da8:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    9dac:	5400008b 	b.lt	9dbc <_strtol_l.part.0+0xcc>  // b.tstop
    9db0:	93407c84 	sxtw	x4, w4
    9db4:	52800027 	mov	w7, #0x1                   	// #1
    9db8:	9b0a1000 	madd	x0, x0, x10, x4
    9dbc:	384014c5 	ldrb	w5, [x6], #1
    9dc0:	17ffffec 	b	9d70 <_strtol_l.part.0+0x80>
    9dc4:	510184a4 	sub	w4, w5, #0x61
    9dc8:	7100649f 	cmp	w4, #0x19
    9dcc:	540000a8 	b.hi	9de0 <_strtol_l.part.0+0xf0>  // b.pmore
    9dd0:	51015ca4 	sub	w4, w5, #0x57
    9dd4:	6b04007f 	cmp	w3, w4
    9dd8:	54fffdec 	b.gt	9d94 <_strtol_l.part.0+0xa4>
    9ddc:	d503201f 	nop
    9de0:	310004ff 	cmn	w7, #0x1
    9de4:	54000140 	b.eq	9e0c <_strtol_l.part.0+0x11c>  // b.none
    9de8:	710001bf 	cmp	w13, #0x0
    9dec:	da800400 	cneg	x0, x0, ne  // ne = any
    9df0:	b4000062 	cbz	x2, 9dfc <_strtol_l.part.0+0x10c>
    9df4:	350003a7 	cbnz	w7, 9e68 <_strtol_l.part.0+0x178>
    9df8:	f9000041 	str	x1, [x2]
    9dfc:	d65f03c0 	ret
    9e00:	394000c5 	ldrb	w5, [x6]
    9e04:	91000906 	add	x6, x8, #0x2
    9e08:	17ffffca 	b	9d30 <_strtol_l.part.0+0x40>
    9e0c:	52800440 	mov	w0, #0x22                  	// #34
    9e10:	b9000180 	str	w0, [x12]
    9e14:	aa0b03e0 	mov	x0, x11
    9e18:	b4ffff22 	cbz	x2, 9dfc <_strtol_l.part.0+0x10c>
    9e1c:	d10004c1 	sub	x1, x6, #0x1
    9e20:	aa0b03e0 	mov	x0, x11
    9e24:	f9000041 	str	x1, [x2]
    9e28:	17fffff5 	b	9dfc <_strtol_l.part.0+0x10c>
    9e2c:	394000c5 	ldrb	w5, [x6]
    9e30:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    9e34:	91000906 	add	x6, x8, #0x2
    9e38:	5280002d 	mov	w13, #0x1                   	// #1
    9e3c:	17ffffbd 	b	9d30 <_strtol_l.part.0+0x40>
    9e40:	394000c0 	ldrb	w0, [x6]
    9e44:	121a7800 	and	w0, w0, #0xffffffdf
    9e48:	12001c00 	and	w0, w0, #0xff
    9e4c:	7101601f 	cmp	w0, #0x58
    9e50:	54fff801 	b.ne	9d50 <_strtol_l.part.0+0x60>  // b.any
    9e54:	394004c5 	ldrb	w5, [x6, #1]
    9e58:	d280020a 	mov	x10, #0x10                  	// #16
    9e5c:	910008c6 	add	x6, x6, #0x2
    9e60:	2a0a03e3 	mov	w3, w10
    9e64:	17ffffbe 	b	9d5c <_strtol_l.part.0+0x6c>
    9e68:	aa0003eb 	mov	x11, x0
    9e6c:	17ffffec 	b	9e1c <_strtol_l.part.0+0x12c>
    9e70:	d280010a 	mov	x10, #0x8                   	// #8
    9e74:	2a0a03e3 	mov	w3, w10
    9e78:	17ffffb9 	b	9d5c <_strtol_l.part.0+0x6c>
    9e7c:	d503201f 	nop

0000000000009e80 <_strtol_r>:
    9e80:	7100907f 	cmp	w3, #0x24
    9e84:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    9e88:	54000040 	b.eq	9e90 <_strtol_r+0x10>  // b.none
    9e8c:	17ffff99 	b	9cf0 <_strtol_l.part.0>
    9e90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    9e94:	910003fd 	mov	x29, sp
    9e98:	9400020a 	bl	a6c0 <__errno>
    9e9c:	528002c1 	mov	w1, #0x16                  	// #22
    9ea0:	b9000001 	str	w1, [x0]
    9ea4:	d2800000 	mov	x0, #0x0                   	// #0
    9ea8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    9eac:	d65f03c0 	ret

0000000000009eb0 <strtol_l>:
    9eb0:	7100905f 	cmp	w2, #0x24
    9eb4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    9eb8:	540000e0 	b.eq	9ed4 <strtol_l+0x24>  // b.none
    9ebc:	f0000004 	adrp	x4, c000 <IpcTestNull+0x6e8>
    9ec0:	2a0203e3 	mov	w3, w2
    9ec4:	aa0103e2 	mov	x2, x1
    9ec8:	aa0003e1 	mov	x1, x0
    9ecc:	f9409880 	ldr	x0, [x4, #304]
    9ed0:	17ffff88 	b	9cf0 <_strtol_l.part.0>
    9ed4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    9ed8:	910003fd 	mov	x29, sp
    9edc:	940001f9 	bl	a6c0 <__errno>
    9ee0:	528002c1 	mov	w1, #0x16                  	// #22
    9ee4:	b9000001 	str	w1, [x0]
    9ee8:	d2800000 	mov	x0, #0x0                   	// #0
    9eec:	a8c17bfd 	ldp	x29, x30, [sp], #16
    9ef0:	d65f03c0 	ret
    9ef4:	d503201f 	nop
    9ef8:	d503201f 	nop
    9efc:	d503201f 	nop

0000000000009f00 <strtol>:
    9f00:	7100905f 	cmp	w2, #0x24
    9f04:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    9f08:	540000e0 	b.eq	9f24 <strtol+0x24>  // b.none
    9f0c:	f0000004 	adrp	x4, c000 <IpcTestNull+0x6e8>
    9f10:	2a0203e3 	mov	w3, w2
    9f14:	aa0103e2 	mov	x2, x1
    9f18:	aa0003e1 	mov	x1, x0
    9f1c:	f9409880 	ldr	x0, [x4, #304]
    9f20:	17ffff74 	b	9cf0 <_strtol_l.part.0>
    9f24:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    9f28:	910003fd 	mov	x29, sp
    9f2c:	940001e5 	bl	a6c0 <__errno>
    9f30:	528002c1 	mov	w1, #0x16                  	// #22
    9f34:	b9000001 	str	w1, [x0]
    9f38:	d2800000 	mov	x0, #0x0                   	// #0
    9f3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    9f40:	d65f03c0 	ret
    9f44:	d503201f 	nop
    9f48:	d503201f 	nop
    9f4c:	d503201f 	nop

0000000000009f50 <__swbuf_r>:
    9f50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9f54:	910003fd 	mov	x29, sp
    9f58:	a90153f3 	stp	x19, x20, [sp, #16]
    9f5c:	2a0103f4 	mov	w20, w1
    9f60:	aa0203f3 	mov	x19, x2
    9f64:	a9025bf5 	stp	x21, x22, [sp, #32]
    9f68:	aa0003f5 	mov	x21, x0
    9f6c:	b4000060 	cbz	x0, 9f78 <__swbuf_r+0x28>
    9f70:	b9405001 	ldr	w1, [x0, #80]
    9f74:	340007e1 	cbz	w1, a070 <__swbuf_r+0x120>
    9f78:	79c02260 	ldrsh	w0, [x19, #16]
    9f7c:	b9402a61 	ldr	w1, [x19, #40]
    9f80:	b9000e61 	str	w1, [x19, #12]
    9f84:	12003c02 	and	w2, w0, #0xffff
    9f88:	361803e0 	tbz	w0, #3, a004 <__swbuf_r+0xb4>
    9f8c:	f9400e61 	ldr	x1, [x19, #24]
    9f90:	b40003a1 	cbz	x1, a004 <__swbuf_r+0xb4>
    9f94:	12001e96 	and	w22, w20, #0xff
    9f98:	12001e94 	and	w20, w20, #0xff
    9f9c:	36680482 	tbz	w2, #13, a02c <__swbuf_r+0xdc>
    9fa0:	f9400260 	ldr	x0, [x19]
    9fa4:	b9402262 	ldr	w2, [x19, #32]
    9fa8:	cb010001 	sub	x1, x0, x1
    9fac:	6b01005f 	cmp	w2, w1
    9fb0:	5400052d 	b.le	a054 <__swbuf_r+0x104>
    9fb4:	11000421 	add	w1, w1, #0x1
    9fb8:	b9400e62 	ldr	w2, [x19, #12]
    9fbc:	91000403 	add	x3, x0, #0x1
    9fc0:	f9000263 	str	x3, [x19]
    9fc4:	51000442 	sub	w2, w2, #0x1
    9fc8:	b9000e62 	str	w2, [x19, #12]
    9fcc:	39000016 	strb	w22, [x0]
    9fd0:	b9402260 	ldr	w0, [x19, #32]
    9fd4:	6b01001f 	cmp	w0, w1
    9fd8:	54000500 	b.eq	a078 <__swbuf_r+0x128>  // b.none
    9fdc:	71002a9f 	cmp	w20, #0xa
    9fe0:	79402260 	ldrh	w0, [x19, #16]
    9fe4:	1a9f17e1 	cset	w1, eq  // eq = none
    9fe8:	6a00003f 	tst	w1, w0
    9fec:	54000461 	b.ne	a078 <__swbuf_r+0x128>  // b.any
    9ff0:	2a1403e0 	mov	w0, w20
    9ff4:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ff8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9ffc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a000:	d65f03c0 	ret
    a004:	aa1303e1 	mov	x1, x19
    a008:	aa1503e0 	mov	x0, x21
    a00c:	97ffeef9 	bl	5bf0 <__swsetup_r>
    a010:	350003c0 	cbnz	w0, a088 <__swbuf_r+0x138>
    a014:	79c02260 	ldrsh	w0, [x19, #16]
    a018:	12001e96 	and	w22, w20, #0xff
    a01c:	12001e94 	and	w20, w20, #0xff
    a020:	12003c02 	and	w2, w0, #0xffff
    a024:	f9400e61 	ldr	x1, [x19, #24]
    a028:	376ffbc2 	tbnz	w2, #13, 9fa0 <__swbuf_r+0x50>
    a02c:	b940ae62 	ldr	w2, [x19, #172]
    a030:	32130000 	orr	w0, w0, #0x2000
    a034:	79002260 	strh	w0, [x19, #16]
    a038:	12127840 	and	w0, w2, #0xffffdfff
    a03c:	b900ae60 	str	w0, [x19, #172]
    a040:	f9400260 	ldr	x0, [x19]
    a044:	b9402262 	ldr	w2, [x19, #32]
    a048:	cb010001 	sub	x1, x0, x1
    a04c:	6b01005f 	cmp	w2, w1
    a050:	54fffb2c 	b.gt	9fb4 <__swbuf_r+0x64>
    a054:	aa1303e1 	mov	x1, x19
    a058:	aa1503e0 	mov	x0, x21
    a05c:	97ffeff5 	bl	6030 <_fflush_r>
    a060:	35000140 	cbnz	w0, a088 <__swbuf_r+0x138>
    a064:	52800021 	mov	w1, #0x1                   	// #1
    a068:	f9400260 	ldr	x0, [x19]
    a06c:	17ffffd3 	b	9fb8 <__swbuf_r+0x68>
    a070:	97fff0f0 	bl	6430 <__sinit>
    a074:	17ffffc1 	b	9f78 <__swbuf_r+0x28>
    a078:	aa1303e1 	mov	x1, x19
    a07c:	aa1503e0 	mov	x0, x21
    a080:	97ffefec 	bl	6030 <_fflush_r>
    a084:	34fffb60 	cbz	w0, 9ff0 <__swbuf_r+0xa0>
    a088:	12800014 	mov	w20, #0xffffffff            	// #-1
    a08c:	17ffffd9 	b	9ff0 <__swbuf_r+0xa0>

000000000000a090 <__swbuf>:
    a090:	d0000003 	adrp	x3, c000 <IpcTestNull+0x6e8>
    a094:	aa0103e2 	mov	x2, x1
    a098:	2a0003e1 	mov	w1, w0
    a09c:	f9409860 	ldr	x0, [x3, #304]
    a0a0:	17ffffac 	b	9f50 <__swbuf_r>
    a0a4:	d503201f 	nop
    a0a8:	d503201f 	nop
    a0ac:	d503201f 	nop

000000000000a0b0 <_wcsnrtombs_l>:
    a0b0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    a0b4:	f10000bf 	cmp	x5, #0x0
    a0b8:	910003fd 	mov	x29, sp
    a0bc:	a90153f3 	stp	x19, x20, [sp, #16]
    a0c0:	aa0003f3 	mov	x19, x0
    a0c4:	91057000 	add	x0, x0, #0x15c
    a0c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    a0cc:	aa0103f4 	mov	x20, x1
    a0d0:	aa0203f5 	mov	x21, x2
    a0d4:	a90363f7 	stp	x23, x24, [sp, #48]
    a0d8:	aa0603f6 	mov	x22, x6
    a0dc:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    a0e0:	a9046bf9 	stp	x25, x26, [sp, #64]
    a0e4:	a90573fb 	stp	x27, x28, [sp, #80]
    a0e8:	f940005c 	ldr	x28, [x2]
    a0ec:	b4000901 	cbz	x1, a20c <_wcsnrtombs_l+0x15c>
    a0f0:	aa0403fa 	mov	x26, x4
    a0f4:	b4000a84 	cbz	x4, a244 <_wcsnrtombs_l+0x194>
    a0f8:	d1000478 	sub	x24, x3, #0x1
    a0fc:	b4000a43 	cbz	x3, a244 <_wcsnrtombs_l+0x194>
    a100:	d280001b 	mov	x27, #0x0                   	// #0
    a104:	f90037f4 	str	x20, [sp, #104]
    a108:	1400000a 	b	a130 <_wcsnrtombs_l+0x80>
    a10c:	b50003d4 	cbnz	x20, a184 <_wcsnrtombs_l+0xd4>
    a110:	b8404780 	ldr	w0, [x28], #4
    a114:	34000640 	cbz	w0, a1dc <_wcsnrtombs_l+0x12c>
    a118:	eb1a011f 	cmp	x8, x26
    a11c:	54000982 	b.cs	a24c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    a120:	d1000718 	sub	x24, x24, #0x1
    a124:	aa0803fb 	mov	x27, x8
    a128:	b100071f 	cmn	x24, #0x1
    a12c:	540001c0 	b.eq	a164 <_wcsnrtombs_l+0xb4>  // b.none
    a130:	b9400382 	ldr	w2, [x28]
    a134:	aa1703e3 	mov	x3, x23
    a138:	f94072c4 	ldr	x4, [x22, #224]
    a13c:	9101c3e1 	add	x1, sp, #0x70
    a140:	aa1303e0 	mov	x0, x19
    a144:	f94002f9 	ldr	x25, [x23]
    a148:	d63f0080 	blr	x4
    a14c:	3100041f 	cmn	w0, #0x1
    a150:	54000620 	b.eq	a214 <_wcsnrtombs_l+0x164>  // b.none
    a154:	8b20c368 	add	x8, x27, w0, sxtw
    a158:	eb1a011f 	cmp	x8, x26
    a15c:	54fffd89 	b.ls	a10c <_wcsnrtombs_l+0x5c>  // b.plast
    a160:	f90002f9 	str	x25, [x23]
    a164:	aa1b03e0 	mov	x0, x27
    a168:	a94153f3 	ldp	x19, x20, [sp, #16]
    a16c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a170:	a94363f7 	ldp	x23, x24, [sp, #48]
    a174:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a178:	a94573fb 	ldp	x27, x28, [sp, #80]
    a17c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a180:	d65f03c0 	ret
    a184:	7100001f 	cmp	w0, #0x0
    a188:	5400020d 	b.le	a1c8 <_wcsnrtombs_l+0x118>
    a18c:	f94037e1 	ldr	x1, [sp, #104]
    a190:	11000402 	add	w2, w0, #0x1
    a194:	d2800027 	mov	x7, #0x1                   	// #1
    a198:	d1000421 	sub	x1, x1, #0x1
    a19c:	d503201f 	nop
    a1a0:	9101c3e3 	add	x3, sp, #0x70
    a1a4:	8b070069 	add	x9, x3, x7
    a1a8:	385ff129 	ldurb	w9, [x9, #-1]
    a1ac:	38276829 	strb	w9, [x1, x7]
    a1b0:	910004e7 	add	x7, x7, #0x1
    a1b4:	eb0200ff 	cmp	x7, x2
    a1b8:	54ffff41 	b.ne	a1a0 <_wcsnrtombs_l+0xf0>  // b.any
    a1bc:	f94037e1 	ldr	x1, [sp, #104]
    a1c0:	8b204020 	add	x0, x1, w0, uxtw
    a1c4:	f90037e0 	str	x0, [sp, #104]
    a1c8:	f94002a0 	ldr	x0, [x21]
    a1cc:	91001000 	add	x0, x0, #0x4
    a1d0:	f90002a0 	str	x0, [x21]
    a1d4:	b8404780 	ldr	w0, [x28], #4
    a1d8:	35fffa00 	cbnz	w0, a118 <_wcsnrtombs_l+0x68>
    a1dc:	b4000054 	cbz	x20, a1e4 <_wcsnrtombs_l+0x134>
    a1e0:	f90002bf 	str	xzr, [x21]
    a1e4:	b90002ff 	str	wzr, [x23]
    a1e8:	d100051b 	sub	x27, x8, #0x1
    a1ec:	aa1b03e0 	mov	x0, x27
    a1f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a1f4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a1f8:	a94363f7 	ldp	x23, x24, [sp, #48]
    a1fc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a200:	a94573fb 	ldp	x27, x28, [sp, #80]
    a204:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a208:	d65f03c0 	ret
    a20c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    a210:	17ffffba 	b	a0f8 <_wcsnrtombs_l+0x48>
    a214:	52801140 	mov	w0, #0x8a                  	// #138
    a218:	b9000260 	str	w0, [x19]
    a21c:	b90002ff 	str	wzr, [x23]
    a220:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    a224:	aa1b03e0 	mov	x0, x27
    a228:	a94153f3 	ldp	x19, x20, [sp, #16]
    a22c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a230:	a94363f7 	ldp	x23, x24, [sp, #48]
    a234:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a238:	a94573fb 	ldp	x27, x28, [sp, #80]
    a23c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a240:	d65f03c0 	ret
    a244:	d280001b 	mov	x27, #0x0                   	// #0
    a248:	17ffffc7 	b	a164 <_wcsnrtombs_l+0xb4>
    a24c:	aa0803fb 	mov	x27, x8
    a250:	17ffffc5 	b	a164 <_wcsnrtombs_l+0xb4>
    a254:	d503201f 	nop
    a258:	d503201f 	nop
    a25c:	d503201f 	nop

000000000000a260 <_wcsnrtombs_r>:
    a260:	d0000000 	adrp	x0, c000 <IpcTestNull+0x6e8>
    a264:	f0000006 	adrp	x6, d000 <__malloc_av_+0x780>
    a268:	910300c6 	add	x6, x6, #0xc0
    a26c:	f9409800 	ldr	x0, [x0, #304]
    a270:	17ffff90 	b	a0b0 <_wcsnrtombs_l>
    a274:	d503201f 	nop
    a278:	d503201f 	nop
    a27c:	d503201f 	nop

000000000000a280 <wcsnrtombs>:
    a280:	d0000006 	adrp	x6, c000 <IpcTestNull+0x6e8>
    a284:	aa0003e8 	mov	x8, x0
    a288:	aa0103e7 	mov	x7, x1
    a28c:	aa0203e5 	mov	x5, x2
    a290:	f94098c0 	ldr	x0, [x6, #304]
    a294:	aa0303e6 	mov	x6, x3
    a298:	aa0803e1 	mov	x1, x8
    a29c:	aa0503e3 	mov	x3, x5
    a2a0:	aa0703e2 	mov	x2, x7
    a2a4:	aa0403e5 	mov	x5, x4
    a2a8:	aa0603e4 	mov	x4, x6
    a2ac:	f0000006 	adrp	x6, d000 <__malloc_av_+0x780>
    a2b0:	910300c6 	add	x6, x6, #0xc0
    a2b4:	17ffff7f 	b	a0b0 <_wcsnrtombs_l>
    a2b8:	d503201f 	nop
    a2bc:	d503201f 	nop

000000000000a2c0 <_wctomb_r>:
    a2c0:	f0000004 	adrp	x4, d000 <__malloc_av_+0x780>
    a2c4:	f940d084 	ldr	x4, [x4, #416]
    a2c8:	aa0403f0 	mov	x16, x4
    a2cc:	d61f0200 	br	x16

000000000000a2d0 <__ascii_wctomb>:
    a2d0:	aa0003e3 	mov	x3, x0
    a2d4:	b4000141 	cbz	x1, a2fc <__ascii_wctomb+0x2c>
    a2d8:	7103fc5f 	cmp	w2, #0xff
    a2dc:	54000088 	b.hi	a2ec <__ascii_wctomb+0x1c>  // b.pmore
    a2e0:	52800020 	mov	w0, #0x1                   	// #1
    a2e4:	39000022 	strb	w2, [x1]
    a2e8:	d65f03c0 	ret
    a2ec:	52801141 	mov	w1, #0x8a                  	// #138
    a2f0:	12800000 	mov	w0, #0xffffffff            	// #-1
    a2f4:	b9000061 	str	w1, [x3]
    a2f8:	d65f03c0 	ret
    a2fc:	52800000 	mov	w0, #0x0                   	// #0
    a300:	d65f03c0 	ret
    a304:	d503201f 	nop
    a308:	d503201f 	nop
    a30c:	d503201f 	nop

000000000000a310 <__utf8_wctomb>:
    a310:	aa0003e3 	mov	x3, x0
    a314:	b40004e1 	cbz	x1, a3b0 <__utf8_wctomb+0xa0>
    a318:	7101fc5f 	cmp	w2, #0x7f
    a31c:	54000349 	b.ls	a384 <__utf8_wctomb+0x74>  // b.plast
    a320:	51020040 	sub	w0, w2, #0x80
    a324:	711dfc1f 	cmp	w0, #0x77f
    a328:	54000349 	b.ls	a390 <__utf8_wctomb+0x80>  // b.plast
    a32c:	51200044 	sub	w4, w2, #0x800
    a330:	529effe0 	mov	w0, #0xf7ff                	// #63487
    a334:	6b00009f 	cmp	w4, w0
    a338:	54000409 	b.ls	a3b8 <__utf8_wctomb+0xa8>  // b.plast
    a33c:	51404044 	sub	w4, w2, #0x10, lsl #12
    a340:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    a344:	6b00009f 	cmp	w4, w0
    a348:	540004e8 	b.hi	a3e4 <__utf8_wctomb+0xd4>  // b.pmore
    a34c:	53127c45 	lsr	w5, w2, #18
    a350:	d34c4444 	ubfx	x4, x2, #12, #6
    a354:	d3462c43 	ubfx	x3, x2, #6, #6
    a358:	12001442 	and	w2, w2, #0x3f
    a35c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    a360:	32196084 	orr	w4, w4, #0xffffff80
    a364:	32196063 	orr	w3, w3, #0xffffff80
    a368:	32196042 	orr	w2, w2, #0xffffff80
    a36c:	52800080 	mov	w0, #0x4                   	// #4
    a370:	39000025 	strb	w5, [x1]
    a374:	39000424 	strb	w4, [x1, #1]
    a378:	39000823 	strb	w3, [x1, #2]
    a37c:	39000c22 	strb	w2, [x1, #3]
    a380:	d65f03c0 	ret
    a384:	52800020 	mov	w0, #0x1                   	// #1
    a388:	39000022 	strb	w2, [x1]
    a38c:	d65f03c0 	ret
    a390:	53067c43 	lsr	w3, w2, #6
    a394:	12001442 	and	w2, w2, #0x3f
    a398:	321a6463 	orr	w3, w3, #0xffffffc0
    a39c:	32196042 	orr	w2, w2, #0xffffff80
    a3a0:	52800040 	mov	w0, #0x2                   	// #2
    a3a4:	39000023 	strb	w3, [x1]
    a3a8:	39000422 	strb	w2, [x1, #1]
    a3ac:	d65f03c0 	ret
    a3b0:	52800000 	mov	w0, #0x0                   	// #0
    a3b4:	d65f03c0 	ret
    a3b8:	530c7c44 	lsr	w4, w2, #12
    a3bc:	d3462c43 	ubfx	x3, x2, #6, #6
    a3c0:	12001442 	and	w2, w2, #0x3f
    a3c4:	321b6884 	orr	w4, w4, #0xffffffe0
    a3c8:	32196063 	orr	w3, w3, #0xffffff80
    a3cc:	32196042 	orr	w2, w2, #0xffffff80
    a3d0:	52800060 	mov	w0, #0x3                   	// #3
    a3d4:	39000024 	strb	w4, [x1]
    a3d8:	39000423 	strb	w3, [x1, #1]
    a3dc:	39000822 	strb	w2, [x1, #2]
    a3e0:	d65f03c0 	ret
    a3e4:	52801141 	mov	w1, #0x8a                  	// #138
    a3e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a3ec:	b9000061 	str	w1, [x3]
    a3f0:	d65f03c0 	ret
    a3f4:	d503201f 	nop
    a3f8:	d503201f 	nop
    a3fc:	d503201f 	nop

000000000000a400 <__sjis_wctomb>:
    a400:	aa0003e5 	mov	x5, x0
    a404:	12001c44 	and	w4, w2, #0xff
    a408:	d3483c43 	ubfx	x3, x2, #8, #8
    a40c:	b4000301 	cbz	x1, a46c <__sjis_wctomb+0x6c>
    a410:	34000283 	cbz	w3, a460 <__sjis_wctomb+0x60>
    a414:	1101fc60 	add	w0, w3, #0x7f
    a418:	11008063 	add	w3, w3, #0x20
    a41c:	12001c00 	and	w0, w0, #0xff
    a420:	12001c63 	and	w3, w3, #0xff
    a424:	7100781f 	cmp	w0, #0x1e
    a428:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    a42c:	54000248 	b.hi	a474 <__sjis_wctomb+0x74>  // b.pmore
    a430:	51010080 	sub	w0, w4, #0x40
    a434:	51020084 	sub	w4, w4, #0x80
    a438:	12001c00 	and	w0, w0, #0xff
    a43c:	12001c84 	and	w4, w4, #0xff
    a440:	7100f81f 	cmp	w0, #0x3e
    a444:	52800f80 	mov	w0, #0x7c                  	// #124
    a448:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    a44c:	54000148 	b.hi	a474 <__sjis_wctomb+0x74>  // b.pmore
    a450:	5ac00442 	rev16	w2, w2
    a454:	52800040 	mov	w0, #0x2                   	// #2
    a458:	79000022 	strh	w2, [x1]
    a45c:	d65f03c0 	ret
    a460:	52800020 	mov	w0, #0x1                   	// #1
    a464:	39000024 	strb	w4, [x1]
    a468:	d65f03c0 	ret
    a46c:	52800000 	mov	w0, #0x0                   	// #0
    a470:	d65f03c0 	ret
    a474:	52801141 	mov	w1, #0x8a                  	// #138
    a478:	12800000 	mov	w0, #0xffffffff            	// #-1
    a47c:	b90000a1 	str	w1, [x5]
    a480:	d65f03c0 	ret
    a484:	d503201f 	nop
    a488:	d503201f 	nop
    a48c:	d503201f 	nop

000000000000a490 <__eucjp_wctomb>:
    a490:	aa0003e4 	mov	x4, x0
    a494:	12001c43 	and	w3, w2, #0xff
    a498:	d3483c45 	ubfx	x5, x2, #8, #8
    a49c:	b4000421 	cbz	x1, a520 <__eucjp_wctomb+0x90>
    a4a0:	34000185 	cbz	w5, a4d0 <__eucjp_wctomb+0x40>
    a4a4:	11017ca0 	add	w0, w5, #0x5f
    a4a8:	1101c8a6 	add	w6, w5, #0x72
    a4ac:	12001c00 	and	w0, w0, #0xff
    a4b0:	12001cc6 	and	w6, w6, #0xff
    a4b4:	7101741f 	cmp	w0, #0x5d
    a4b8:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    a4bc:	54000109 	b.ls	a4dc <__eucjp_wctomb+0x4c>  // b.plast
    a4c0:	52801141 	mov	w1, #0x8a                  	// #138
    a4c4:	12800000 	mov	w0, #0xffffffff            	// #-1
    a4c8:	b9000081 	str	w1, [x4]
    a4cc:	d65f03c0 	ret
    a4d0:	52800020 	mov	w0, #0x1                   	// #1
    a4d4:	39000023 	strb	w3, [x1]
    a4d8:	d65f03c0 	ret
    a4dc:	11017c66 	add	w6, w3, #0x5f
    a4e0:	12001cc6 	and	w6, w6, #0xff
    a4e4:	710174df 	cmp	w6, #0x5d
    a4e8:	54000209 	b.ls	a528 <__eucjp_wctomb+0x98>  // b.plast
    a4ec:	7101741f 	cmp	w0, #0x5d
    a4f0:	54fffe88 	b.hi	a4c0 <__eucjp_wctomb+0x30>  // b.pmore
    a4f4:	32190063 	orr	w3, w3, #0x80
    a4f8:	11017c60 	add	w0, w3, #0x5f
    a4fc:	12001c00 	and	w0, w0, #0xff
    a500:	7101741f 	cmp	w0, #0x5d
    a504:	54fffde8 	b.hi	a4c0 <__eucjp_wctomb+0x30>  // b.pmore
    a508:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    a50c:	52800060 	mov	w0, #0x3                   	// #3
    a510:	39000022 	strb	w2, [x1]
    a514:	39000425 	strb	w5, [x1, #1]
    a518:	39000823 	strb	w3, [x1, #2]
    a51c:	d65f03c0 	ret
    a520:	52800000 	mov	w0, #0x0                   	// #0
    a524:	d65f03c0 	ret
    a528:	5ac00442 	rev16	w2, w2
    a52c:	52800040 	mov	w0, #0x2                   	// #2
    a530:	79000022 	strh	w2, [x1]
    a534:	d65f03c0 	ret
    a538:	d503201f 	nop
    a53c:	d503201f 	nop

000000000000a540 <__jis_wctomb>:
    a540:	aa0003e6 	mov	x6, x0
    a544:	12001c45 	and	w5, w2, #0xff
    a548:	d3483c44 	ubfx	x4, x2, #8, #8
    a54c:	b40004c1 	cbz	x1, a5e4 <__jis_wctomb+0xa4>
    a550:	34000304 	cbz	w4, a5b0 <__jis_wctomb+0x70>
    a554:	51008484 	sub	w4, w4, #0x21
    a558:	12001c84 	and	w4, w4, #0xff
    a55c:	7101749f 	cmp	w4, #0x5d
    a560:	54000468 	b.hi	a5ec <__jis_wctomb+0xac>  // b.pmore
    a564:	510084a5 	sub	w5, w5, #0x21
    a568:	12001ca5 	and	w5, w5, #0xff
    a56c:	710174bf 	cmp	w5, #0x5d
    a570:	540003e8 	b.hi	a5ec <__jis_wctomb+0xac>  // b.pmore
    a574:	b9400064 	ldr	w4, [x3]
    a578:	52800040 	mov	w0, #0x2                   	// #2
    a57c:	35000144 	cbnz	w4, a5a4 <__jis_wctomb+0x64>
    a580:	aa0103e4 	mov	x4, x1
    a584:	52800020 	mov	w0, #0x1                   	// #1
    a588:	b9000060 	str	w0, [x3]
    a58c:	52848365 	mov	w5, #0x241b                	// #9243
    a590:	52800843 	mov	w3, #0x42                  	// #66
    a594:	528000a0 	mov	w0, #0x5                   	// #5
    a598:	78003485 	strh	w5, [x4], #3
    a59c:	39000823 	strb	w3, [x1, #2]
    a5a0:	aa0403e1 	mov	x1, x4
    a5a4:	5ac00442 	rev16	w2, w2
    a5a8:	79000022 	strh	w2, [x1]
    a5ac:	d65f03c0 	ret
    a5b0:	b9400062 	ldr	w2, [x3]
    a5b4:	52800020 	mov	w0, #0x1                   	// #1
    a5b8:	34000122 	cbz	w2, a5dc <__jis_wctomb+0x9c>
    a5bc:	aa0103e2 	mov	x2, x1
    a5c0:	b900007f 	str	wzr, [x3]
    a5c4:	52850364 	mov	w4, #0x281b                	// #10267
    a5c8:	52800843 	mov	w3, #0x42                  	// #66
    a5cc:	52800080 	mov	w0, #0x4                   	// #4
    a5d0:	78003444 	strh	w4, [x2], #3
    a5d4:	39000823 	strb	w3, [x1, #2]
    a5d8:	aa0203e1 	mov	x1, x2
    a5dc:	39000025 	strb	w5, [x1]
    a5e0:	d65f03c0 	ret
    a5e4:	52800020 	mov	w0, #0x1                   	// #1
    a5e8:	d65f03c0 	ret
    a5ec:	52801141 	mov	w1, #0x8a                  	// #138
    a5f0:	12800000 	mov	w0, #0xffffffff            	// #-1
    a5f4:	b90000c1 	str	w1, [x6]
    a5f8:	d65f03c0 	ret
    a5fc:	d503201f 	nop

000000000000a600 <_write_r>:
    a600:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a604:	910003fd 	mov	x29, sp
    a608:	a90153f3 	stp	x19, x20, [sp, #16]
    a60c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    a610:	aa0003f3 	mov	x19, x0
    a614:	2a0103e0 	mov	w0, w1
    a618:	aa0203e1 	mov	x1, x2
    a61c:	b905da9f 	str	wzr, [x20, #1496]
    a620:	aa0303e2 	mov	x2, x3
    a624:	97ffe1bf 	bl	2d20 <_write>
    a628:	93407c01 	sxtw	x1, w0
    a62c:	3100041f 	cmn	w0, #0x1
    a630:	540000a0 	b.eq	a644 <_write_r+0x44>  // b.none
    a634:	aa0103e0 	mov	x0, x1
    a638:	a94153f3 	ldp	x19, x20, [sp, #16]
    a63c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a640:	d65f03c0 	ret
    a644:	b945da80 	ldr	w0, [x20, #1496]
    a648:	34ffff60 	cbz	w0, a634 <_write_r+0x34>
    a64c:	b9000260 	str	w0, [x19]
    a650:	aa0103e0 	mov	x0, x1
    a654:	a94153f3 	ldp	x19, x20, [sp, #16]
    a658:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a65c:	d65f03c0 	ret

000000000000a660 <_close_r>:
    a660:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a664:	910003fd 	mov	x29, sp
    a668:	a90153f3 	stp	x19, x20, [sp, #16]
    a66c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    a670:	aa0003f3 	mov	x19, x0
    a674:	b905da9f 	str	wzr, [x20, #1496]
    a678:	2a0103e0 	mov	w0, w1
    a67c:	97ffe1ad 	bl	2d30 <_close>
    a680:	3100041f 	cmn	w0, #0x1
    a684:	54000080 	b.eq	a694 <_close_r+0x34>  // b.none
    a688:	a94153f3 	ldp	x19, x20, [sp, #16]
    a68c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a690:	d65f03c0 	ret
    a694:	b945da81 	ldr	w1, [x20, #1496]
    a698:	34ffff81 	cbz	w1, a688 <_close_r+0x28>
    a69c:	b9000261 	str	w1, [x19]
    a6a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a6a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a6a8:	d65f03c0 	ret
    a6ac:	d503201f 	nop

000000000000a6b0 <__set_ctype>:
    a6b0:	b0000001 	adrp	x1, b000 <pow10.0+0x80>
    a6b4:	911fa021 	add	x1, x1, #0x7e8
    a6b8:	f9007c01 	str	x1, [x0, #248]
    a6bc:	d65f03c0 	ret

000000000000a6c0 <__errno>:
    a6c0:	d0000000 	adrp	x0, c000 <IpcTestNull+0x6e8>
    a6c4:	f9409800 	ldr	x0, [x0, #304]
    a6c8:	d65f03c0 	ret
    a6cc:	d503201f 	nop

000000000000a6d0 <_fclose_r.part.0>:
    a6d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a6d4:	910003fd 	mov	x29, sp
    a6d8:	a90153f3 	stp	x19, x20, [sp, #16]
    a6dc:	aa0103f3 	mov	x19, x1
    a6e0:	f90013f5 	str	x21, [sp, #32]
    a6e4:	aa0003f5 	mov	x21, x0
    a6e8:	97ffedc6 	bl	5e00 <__sflush_r>
    a6ec:	2a0003f4 	mov	w20, w0
    a6f0:	f9402a62 	ldr	x2, [x19, #80]
    a6f4:	b40000c2 	cbz	x2, a70c <_fclose_r.part.0+0x3c>
    a6f8:	f9401a61 	ldr	x1, [x19, #48]
    a6fc:	aa1503e0 	mov	x0, x21
    a700:	d63f0040 	blr	x2
    a704:	7100001f 	cmp	w0, #0x0
    a708:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    a70c:	79402260 	ldrh	w0, [x19, #16]
    a710:	373802c0 	tbnz	w0, #7, a768 <_fclose_r.part.0+0x98>
    a714:	f9402e61 	ldr	x1, [x19, #88]
    a718:	b40000e1 	cbz	x1, a734 <_fclose_r.part.0+0x64>
    a71c:	9101d260 	add	x0, x19, #0x74
    a720:	eb00003f 	cmp	x1, x0
    a724:	54000060 	b.eq	a730 <_fclose_r.part.0+0x60>  // b.none
    a728:	aa1503e0 	mov	x0, x21
    a72c:	97fff019 	bl	6790 <_free_r>
    a730:	f9002e7f 	str	xzr, [x19, #88]
    a734:	f9403e61 	ldr	x1, [x19, #120]
    a738:	b4000081 	cbz	x1, a748 <_fclose_r.part.0+0x78>
    a73c:	aa1503e0 	mov	x0, x21
    a740:	97fff014 	bl	6790 <_free_r>
    a744:	f9003e7f 	str	xzr, [x19, #120]
    a748:	97ffef3e 	bl	6440 <__sfp_lock_acquire>
    a74c:	7900227f 	strh	wzr, [x19, #16]
    a750:	97ffef40 	bl	6450 <__sfp_lock_release>
    a754:	2a1403e0 	mov	w0, w20
    a758:	a94153f3 	ldp	x19, x20, [sp, #16]
    a75c:	f94013f5 	ldr	x21, [sp, #32]
    a760:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a764:	d65f03c0 	ret
    a768:	f9400e61 	ldr	x1, [x19, #24]
    a76c:	aa1503e0 	mov	x0, x21
    a770:	97fff008 	bl	6790 <_free_r>
    a774:	17ffffe8 	b	a714 <_fclose_r.part.0+0x44>
    a778:	d503201f 	nop
    a77c:	d503201f 	nop

000000000000a780 <_fclose_r>:
    a780:	b4000301 	cbz	x1, a7e0 <_fclose_r+0x60>
    a784:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a788:	910003fd 	mov	x29, sp
    a78c:	f9000bf4 	str	x20, [sp, #16]
    a790:	aa0003f4 	mov	x20, x0
    a794:	b4000060 	cbz	x0, a7a0 <_fclose_r+0x20>
    a798:	b9405002 	ldr	w2, [x0, #80]
    a79c:	34000162 	cbz	w2, a7c8 <_fclose_r+0x48>
    a7a0:	79c02020 	ldrsh	w0, [x1, #16]
    a7a4:	350000a0 	cbnz	w0, a7b8 <_fclose_r+0x38>
    a7a8:	52800000 	mov	w0, #0x0                   	// #0
    a7ac:	f9400bf4 	ldr	x20, [sp, #16]
    a7b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a7b4:	d65f03c0 	ret
    a7b8:	aa1403e0 	mov	x0, x20
    a7bc:	f9400bf4 	ldr	x20, [sp, #16]
    a7c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a7c4:	17ffffc3 	b	a6d0 <_fclose_r.part.0>
    a7c8:	f90017e1 	str	x1, [sp, #40]
    a7cc:	97ffef19 	bl	6430 <__sinit>
    a7d0:	f94017e1 	ldr	x1, [sp, #40]
    a7d4:	79c02020 	ldrsh	w0, [x1, #16]
    a7d8:	34fffe80 	cbz	w0, a7a8 <_fclose_r+0x28>
    a7dc:	17fffff7 	b	a7b8 <_fclose_r+0x38>
    a7e0:	52800000 	mov	w0, #0x0                   	// #0
    a7e4:	d65f03c0 	ret
    a7e8:	d503201f 	nop
    a7ec:	d503201f 	nop

000000000000a7f0 <fclose>:
    a7f0:	b4000340 	cbz	x0, a858 <fclose+0x68>
    a7f4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a7f8:	910003fd 	mov	x29, sp
    a7fc:	a90153f3 	stp	x19, x20, [sp, #16]
    a800:	aa0003f3 	mov	x19, x0
    a804:	d0000000 	adrp	x0, c000 <IpcTestNull+0x6e8>
    a808:	f9409814 	ldr	x20, [x0, #304]
    a80c:	b4000074 	cbz	x20, a818 <fclose+0x28>
    a810:	b9405280 	ldr	w0, [x20, #80]
    a814:	34000180 	cbz	w0, a844 <fclose+0x54>
    a818:	79c02260 	ldrsh	w0, [x19, #16]
    a81c:	350000a0 	cbnz	w0, a830 <fclose+0x40>
    a820:	52800000 	mov	w0, #0x0                   	// #0
    a824:	a94153f3 	ldp	x19, x20, [sp, #16]
    a828:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a82c:	d65f03c0 	ret
    a830:	aa1303e1 	mov	x1, x19
    a834:	aa1403e0 	mov	x0, x20
    a838:	a94153f3 	ldp	x19, x20, [sp, #16]
    a83c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a840:	17ffffa4 	b	a6d0 <_fclose_r.part.0>
    a844:	aa1403e0 	mov	x0, x20
    a848:	97ffeefa 	bl	6430 <__sinit>
    a84c:	79c02260 	ldrsh	w0, [x19, #16]
    a850:	34fffe80 	cbz	w0, a820 <fclose+0x30>
    a854:	17fffff7 	b	a830 <fclose+0x40>
    a858:	52800000 	mov	w0, #0x0                   	// #0
    a85c:	d65f03c0 	ret

000000000000a860 <_fstat_r>:
    a860:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a864:	910003fd 	mov	x29, sp
    a868:	a90153f3 	stp	x19, x20, [sp, #16]
    a86c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    a870:	aa0003f3 	mov	x19, x0
    a874:	b905da9f 	str	wzr, [x20, #1496]
    a878:	2a0103e0 	mov	w0, w1
    a87c:	aa0203e1 	mov	x1, x2
    a880:	97ffe130 	bl	2d40 <_fstat>
    a884:	3100041f 	cmn	w0, #0x1
    a888:	54000080 	b.eq	a898 <_fstat_r+0x38>  // b.none
    a88c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a890:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a894:	d65f03c0 	ret
    a898:	b945da81 	ldr	w1, [x20, #1496]
    a89c:	34ffff81 	cbz	w1, a88c <_fstat_r+0x2c>
    a8a0:	b9000261 	str	w1, [x19]
    a8a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a8ac:	d65f03c0 	ret

000000000000a8b0 <_findenv_r>:
    a8b0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    a8b4:	910003fd 	mov	x29, sp
    a8b8:	a90363f7 	stp	x23, x24, [sp, #48]
    a8bc:	f0000017 	adrp	x23, d000 <__malloc_av_+0x780>
    a8c0:	aa0103f8 	mov	x24, x1
    a8c4:	a90153f3 	stp	x19, x20, [sp, #16]
    a8c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    a8cc:	aa0203f5 	mov	x21, x2
    a8d0:	aa0003f6 	mov	x22, x0
    a8d4:	94000103 	bl	ace0 <__env_lock>
    a8d8:	f94136f4 	ldr	x20, [x23, #616]
    a8dc:	b40003f4 	cbz	x20, a958 <_findenv_r+0xa8>
    a8e0:	39400303 	ldrb	w3, [x24]
    a8e4:	aa1803f3 	mov	x19, x24
    a8e8:	7100f47f 	cmp	w3, #0x3d
    a8ec:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    a8f0:	540000c0 	b.eq	a908 <_findenv_r+0x58>  // b.none
    a8f4:	d503201f 	nop
    a8f8:	38401e63 	ldrb	w3, [x19, #1]!
    a8fc:	7100f47f 	cmp	w3, #0x3d
    a900:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    a904:	54ffffa1 	b.ne	a8f8 <_findenv_r+0x48>  // b.any
    a908:	7100f47f 	cmp	w3, #0x3d
    a90c:	54000260 	b.eq	a958 <_findenv_r+0xa8>  // b.none
    a910:	f9400280 	ldr	x0, [x20]
    a914:	cb180273 	sub	x19, x19, x24
    a918:	b4000200 	cbz	x0, a958 <_findenv_r+0xa8>
    a91c:	93407e73 	sxtw	x19, w19
    a920:	f90023f9 	str	x25, [sp, #64]
    a924:	d503201f 	nop
    a928:	aa1303e2 	mov	x2, x19
    a92c:	aa1803e1 	mov	x1, x24
    a930:	9400007b 	bl	ab1c <strncmp>
    a934:	350000c0 	cbnz	w0, a94c <_findenv_r+0x9c>
    a938:	f9400280 	ldr	x0, [x20]
    a93c:	8b130019 	add	x25, x0, x19
    a940:	38736800 	ldrb	w0, [x0, x19]
    a944:	7100f41f 	cmp	w0, #0x3d
    a948:	54000180 	b.eq	a978 <_findenv_r+0xc8>  // b.none
    a94c:	f8408e80 	ldr	x0, [x20, #8]!
    a950:	b5fffec0 	cbnz	x0, a928 <_findenv_r+0x78>
    a954:	f94023f9 	ldr	x25, [sp, #64]
    a958:	aa1603e0 	mov	x0, x22
    a95c:	940000e5 	bl	acf0 <__env_unlock>
    a960:	d2800000 	mov	x0, #0x0                   	// #0
    a964:	a94153f3 	ldp	x19, x20, [sp, #16]
    a968:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a96c:	a94363f7 	ldp	x23, x24, [sp, #48]
    a970:	a8c57bfd 	ldp	x29, x30, [sp], #80
    a974:	d65f03c0 	ret
    a978:	f94136e1 	ldr	x1, [x23, #616]
    a97c:	aa1603e0 	mov	x0, x22
    a980:	cb010281 	sub	x1, x20, x1
    a984:	9343fc21 	asr	x1, x1, #3
    a988:	b90002a1 	str	w1, [x21]
    a98c:	940000d9 	bl	acf0 <__env_unlock>
    a990:	91000720 	add	x0, x25, #0x1
    a994:	a94153f3 	ldp	x19, x20, [sp, #16]
    a998:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a99c:	a94363f7 	ldp	x23, x24, [sp, #48]
    a9a0:	f94023f9 	ldr	x25, [sp, #64]
    a9a4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    a9a8:	d65f03c0 	ret
    a9ac:	d503201f 	nop

000000000000a9b0 <_getenv_r>:
    a9b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a9b4:	910003fd 	mov	x29, sp
    a9b8:	910073e2 	add	x2, sp, #0x1c
    a9bc:	97ffffbd 	bl	a8b0 <_findenv_r>
    a9c0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a9c4:	d65f03c0 	ret
    a9c8:	d503201f 	nop
    a9cc:	d503201f 	nop

000000000000a9d0 <_isatty_r>:
    a9d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a9d4:	910003fd 	mov	x29, sp
    a9d8:	a90153f3 	stp	x19, x20, [sp, #16]
    a9dc:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    a9e0:	aa0003f3 	mov	x19, x0
    a9e4:	b905da9f 	str	wzr, [x20, #1496]
    a9e8:	2a0103e0 	mov	w0, w1
    a9ec:	97ffe0d9 	bl	2d50 <_isatty>
    a9f0:	3100041f 	cmn	w0, #0x1
    a9f4:	54000080 	b.eq	aa04 <_isatty_r+0x34>  // b.none
    a9f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a9fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa00:	d65f03c0 	ret
    aa04:	b945da81 	ldr	w1, [x20, #1496]
    aa08:	34ffff81 	cbz	w1, a9f8 <_isatty_r+0x28>
    aa0c:	b9000261 	str	w1, [x19]
    aa10:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa14:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa18:	d65f03c0 	ret
    aa1c:	d503201f 	nop

000000000000aa20 <_lseek_r>:
    aa20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aa24:	910003fd 	mov	x29, sp
    aa28:	a90153f3 	stp	x19, x20, [sp, #16]
    aa2c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    aa30:	aa0003f3 	mov	x19, x0
    aa34:	b905da9f 	str	wzr, [x20, #1496]
    aa38:	2a0103e0 	mov	w0, w1
    aa3c:	aa0203e1 	mov	x1, x2
    aa40:	2a0303e2 	mov	w2, w3
    aa44:	97ffe0c7 	bl	2d60 <_lseek>
    aa48:	b100041f 	cmn	x0, #0x1
    aa4c:	54000080 	b.eq	aa5c <_lseek_r+0x3c>  // b.none
    aa50:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa54:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa58:	d65f03c0 	ret
    aa5c:	b945da81 	ldr	w1, [x20, #1496]
    aa60:	34ffff81 	cbz	w1, aa50 <_lseek_r+0x30>
    aa64:	b9000261 	str	w1, [x19]
    aa68:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa6c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa70:	d65f03c0 	ret
    aa74:	d503201f 	nop
    aa78:	d503201f 	nop
    aa7c:	d503201f 	nop

000000000000aa80 <_read_r>:
    aa80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aa84:	910003fd 	mov	x29, sp
    aa88:	a90153f3 	stp	x19, x20, [sp, #16]
    aa8c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x780>
    aa90:	aa0003f3 	mov	x19, x0
    aa94:	2a0103e0 	mov	w0, w1
    aa98:	aa0203e1 	mov	x1, x2
    aa9c:	b905da9f 	str	wzr, [x20, #1496]
    aaa0:	aa0303e2 	mov	x2, x3
    aaa4:	97ffe0b3 	bl	2d70 <_read>
    aaa8:	93407c01 	sxtw	x1, w0
    aaac:	3100041f 	cmn	w0, #0x1
    aab0:	540000a0 	b.eq	aac4 <_read_r+0x44>  // b.none
    aab4:	aa0103e0 	mov	x0, x1
    aab8:	a94153f3 	ldp	x19, x20, [sp, #16]
    aabc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aac0:	d65f03c0 	ret
    aac4:	b945da80 	ldr	w0, [x20, #1496]
    aac8:	34ffff60 	cbz	w0, aab4 <_read_r+0x34>
    aacc:	b9000260 	str	w0, [x19]
    aad0:	aa0103e0 	mov	x0, x1
    aad4:	a94153f3 	ldp	x19, x20, [sp, #16]
    aad8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aadc:	d65f03c0 	ret
    aae0:	d503201f 	nop
    aae4:	d503201f 	nop
    aae8:	d503201f 	nop
    aaec:	d503201f 	nop
    aaf0:	d503201f 	nop
    aaf4:	d503201f 	nop
    aaf8:	d503201f 	nop
    aafc:	d503201f 	nop
    ab00:	d503201f 	nop
    ab04:	d503201f 	nop
    ab08:	d503201f 	nop
    ab0c:	d503201f 	nop
    ab10:	d503201f 	nop
    ab14:	d503201f 	nop
    ab18:	d503201f 	nop

000000000000ab1c <strncmp>:
    ab1c:	b4000d82 	cbz	x2, accc <strncmp+0x1b0>
    ab20:	ca010008 	eor	x8, x0, x1
    ab24:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    ab28:	f240091f 	tst	x8, #0x7
    ab2c:	9240080e 	and	x14, x0, #0x7
    ab30:	54000681 	b.ne	ac00 <strncmp+0xe4>  // b.any
    ab34:	b500040e 	cbnz	x14, abb4 <strncmp+0x98>
    ab38:	d100044d 	sub	x13, x2, #0x1
    ab3c:	d343fdad 	lsr	x13, x13, #3
    ab40:	f8408403 	ldr	x3, [x0], #8
    ab44:	f8408424 	ldr	x4, [x1], #8
    ab48:	f10005ad 	subs	x13, x13, #0x1
    ab4c:	cb0b0068 	sub	x8, x3, x11
    ab50:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    ab54:	ca040066 	eor	x6, x3, x4
    ab58:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    ab5c:	ea290105 	bics	x5, x8, x9
    ab60:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    ab64:	54fffee0 	b.eq	ab40 <strncmp+0x24>  // b.none
    ab68:	b6f8012d 	tbz	x13, #63, ab8c <strncmp+0x70>
    ab6c:	f2400842 	ands	x2, x2, #0x7
    ab70:	540000e0 	b.eq	ab8c <strncmp+0x70>  // b.none
    ab74:	d37df042 	lsl	x2, x2, #3
    ab78:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    ab7c:	9ac221ce 	lsl	x14, x14, x2
    ab80:	8a2e0063 	bic	x3, x3, x14
    ab84:	8a2e0084 	bic	x4, x4, x14
    ab88:	aa0e00a5 	orr	x5, x5, x14
    ab8c:	aa0500c7 	orr	x7, x6, x5
    ab90:	dac00ce7 	rev	x7, x7
    ab94:	dac00c63 	rev	x3, x3
    ab98:	dac010ec 	clz	x12, x7
    ab9c:	dac00c84 	rev	x4, x4
    aba0:	9acc2063 	lsl	x3, x3, x12
    aba4:	9acc2084 	lsl	x4, x4, x12
    aba8:	d378fc63 	lsr	x3, x3, #56
    abac:	cb44e060 	sub	x0, x3, x4, lsr #56
    abb0:	d65f03c0 	ret
    abb4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    abb8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    abbc:	f8408403 	ldr	x3, [x0], #8
    abc0:	cb0e0fea 	neg	x10, x14, lsl #3
    abc4:	f8408424 	ldr	x4, [x1], #8
    abc8:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    abcc:	d100044d 	sub	x13, x2, #0x1
    abd0:	9aca2529 	lsr	x9, x9, x10
    abd4:	924009aa 	and	x10, x13, #0x7
    abd8:	d343fdad 	lsr	x13, x13, #3
    abdc:	8b0e0042 	add	x2, x2, x14
    abe0:	8b0e014a 	add	x10, x10, x14
    abe4:	aa090063 	orr	x3, x3, x9
    abe8:	aa090084 	orr	x4, x4, x9
    abec:	8b4a0dad 	add	x13, x13, x10, lsr #3
    abf0:	17ffffd6 	b	ab48 <strncmp+0x2c>
    abf4:	d503201f 	nop
    abf8:	d503201f 	nop
    abfc:	d503201f 	nop
    ac00:	f100405f 	cmp	x2, #0x10
    ac04:	54000122 	b.cs	ac28 <strncmp+0x10c>  // b.hs, b.nlast
    ac08:	38401403 	ldrb	w3, [x0], #1
    ac0c:	38401424 	ldrb	w4, [x1], #1
    ac10:	f1000442 	subs	x2, x2, #0x1
    ac14:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    ac18:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    ac1c:	54ffff60 	b.eq	ac08 <strncmp+0xec>  // b.none
    ac20:	cb040060 	sub	x0, x3, x4
    ac24:	d65f03c0 	ret
    ac28:	d343fc4d 	lsr	x13, x2, #3
    ac2c:	b400018e 	cbz	x14, ac5c <strncmp+0x140>
    ac30:	cb0e03ee 	neg	x14, x14
    ac34:	924009ce 	and	x14, x14, #0x7
    ac38:	cb0e0042 	sub	x2, x2, x14
    ac3c:	d343fc4d 	lsr	x13, x2, #3
    ac40:	38401403 	ldrb	w3, [x0], #1
    ac44:	38401424 	ldrb	w4, [x1], #1
    ac48:	7100047f 	cmp	w3, #0x1
    ac4c:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    ac50:	54fffe81 	b.ne	ac20 <strncmp+0x104>  // b.any
    ac54:	f10005ce 	subs	x14, x14, #0x1
    ac58:	54ffff48 	b.hi	ac40 <strncmp+0x124>  // b.pmore
    ac5c:	d280010e 	mov	x14, #0x8                   	// #8
    ac60:	f10005ad 	subs	x13, x13, #0x1
    ac64:	540001c3 	b.cc	ac9c <strncmp+0x180>  // b.lo, b.ul, b.last
    ac68:	927d2029 	and	x9, x1, #0xff8
    ac6c:	d27d2129 	eor	x9, x9, #0xff8
    ac70:	b4fffe89 	cbz	x9, ac40 <strncmp+0x124>
    ac74:	f8408403 	ldr	x3, [x0], #8
    ac78:	f8408424 	ldr	x4, [x1], #8
    ac7c:	cb0b0068 	sub	x8, x3, x11
    ac80:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    ac84:	ca040066 	eor	x6, x3, x4
    ac88:	ea290105 	bics	x5, x8, x9
    ac8c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    ac90:	54fff7e1 	b.ne	ab8c <strncmp+0x70>  // b.any
    ac94:	f10005ad 	subs	x13, x13, #0x1
    ac98:	54fffe85 	b.pl	ac68 <strncmp+0x14c>  // b.nfrst
    ac9c:	92400842 	and	x2, x2, #0x7
    aca0:	b4fff762 	cbz	x2, ab8c <strncmp+0x70>
    aca4:	d1002000 	sub	x0, x0, #0x8
    aca8:	d1002021 	sub	x1, x1, #0x8
    acac:	f8626803 	ldr	x3, [x0, x2]
    acb0:	f8626824 	ldr	x4, [x1, x2]
    acb4:	cb0b0068 	sub	x8, x3, x11
    acb8:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    acbc:	ca040066 	eor	x6, x3, x4
    acc0:	ea290105 	bics	x5, x8, x9
    acc4:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    acc8:	54fff621 	b.ne	ab8c <strncmp+0x70>  // b.any
    accc:	d2800000 	mov	x0, #0x0                   	// #0
    acd0:	d65f03c0 	ret
    acd4:	d503201f 	nop
    acd8:	d503201f 	nop
    acdc:	d503201f 	nop

000000000000ace0 <__env_lock>:
    ace0:	d65f03c0 	ret
    ace4:	d503201f 	nop
    ace8:	d503201f 	nop
    acec:	d503201f 	nop

000000000000acf0 <__env_unlock>:
    acf0:	d65f03c0 	ret

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

000000000000acf4 <_fini>:
    acf4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    acf8:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    acfc:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    ad00:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    ad04:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ad08:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ad0c:	a8c153f3 	ldp	x19, x20, [sp], #16
    ad10:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ad14:	a8c163f7 	ldp	x23, x24, [sp], #16
    ad18:	a8c16bf9 	ldp	x25, x26, [sp], #16
    ad1c:	a8c173fb 	ldp	x27, x28, [sp], #16
    ad20:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ad24:	d65f03c0 	ret
