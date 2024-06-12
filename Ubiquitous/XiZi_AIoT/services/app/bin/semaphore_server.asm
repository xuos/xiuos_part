
semaphore_server:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
IPC_SERVER_INTERFACE(Ipc_sem_wait, 2);
IPC_SERVER_REGISTER_INTERFACES(IpcSemaphoreServer, 4, //
    Ipc_sem_create, Ipc_sem_delete, Ipc_sem_signal, Ipc_sem_wait);

int main(int argc, char** argv)
{
       0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    /// @todo support custom server name
    static char default_server_name[] = "DefaultSemaphoreServer";

    char* server_name = default_server_name;
    if (argc == 2) {
       4:	7100081f 	cmp	w0, #0x2
{
       8:	910003fd 	mov	x29, sp
       c:	a90153f3 	stp	x19, x20, [sp, #16]
      10:	f0000053 	adrp	x19, b000 <_fini+0xcc>
      14:	912a4273 	add	x19, x19, #0xa90
    char* server_name = default_server_name;
      18:	aa1303f4 	mov	x20, x19
    if (argc == 2) {
      1c:	54000041 	b.ne	24 <main+0x24>  // b.any
        server_name = argv[1];
      20:	f9400434 	ldr	x20, [x1, #8]
    }

    if (register_server(server_name) < 0) {
      24:	aa1403e0 	mov	x0, x20
      28:	94000946 	bl	2540 <register_server>
      2c:	37f80200 	tbnz	w0, #31, 6c <main+0x6c>
      30:	b0000060 	adrp	x0, d000 <__malloc_av_+0x600>
      34:	9110a000 	add	x0, x0, #0x428
      38:	91040001 	add	x1, x0, #0x100
      3c:	d503201f 	nop
        printf("[%s] Register server failed.\n", server_name);
        exit(1);
    }

    for (int idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
        sem_pool[idx].valid = false;
      40:	3800841f 	strb	wzr, [x0], #8
    for (int idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
      44:	eb01001f 	cmp	x0, x1
      48:	54ffffc1 	b.ne	40 <main+0x40>  // b.any
    }

    ipc_server_loop(&IpcSemaphoreServer);
      4c:	91006260 	add	x0, x19, #0x18
      50:	94000ac8 	bl	2b70 <ipc_server_loop>

    // never reaching here
    exit(0);
      54:	52800000 	mov	w0, #0x0                   	// #0
      58:	94000922 	bl	24e0 <exit>
    return 0;
      5c:	52800000 	mov	w0, #0x0                   	// #0
      60:	a94153f3 	ldp	x19, x20, [sp, #16]
      64:	a8c27bfd 	ldp	x29, x30, [sp], #32
      68:	d65f03c0 	ret
        printf("[%s] Register server failed.\n", server_name);
      6c:	aa1403e1 	mov	x1, x20
      70:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
      74:	913fc000 	add	x0, x0, #0xff0
      78:	9400081e 	bl	20f0 <printf>
        exit(1);
      7c:	52800020 	mov	w0, #0x1                   	// #1
      80:	94000918 	bl	24e0 <exit>
      84:	17ffffeb 	b	30 <main+0x30>
      88:	d503201f 	nop
      8c:	d503201f 	nop

0000000000000090 <deregister_tm_clones>:
      90:	b0000060 	adrp	x0, d000 <__malloc_av_+0x600>
      94:	910fc000 	add	x0, x0, #0x3f0
      98:	b0000061 	adrp	x1, d000 <__malloc_av_+0x600>
      9c:	910fc021 	add	x1, x1, #0x3f0
      a0:	eb00003f 	cmp	x1, x0
      a4:	540000c0 	b.eq	bc <deregister_tm_clones+0x2c>  // b.none
      a8:	d0000041 	adrp	x1, a000 <_strtol_l.part.0+0xd0>
      ac:	f947b421 	ldr	x1, [x1, #3944]
      b0:	b4000061 	cbz	x1, bc <deregister_tm_clones+0x2c>
      b4:	aa0103f0 	mov	x16, x1
      b8:	d61f0200 	br	x16
      bc:	d65f03c0 	ret

00000000000000c0 <register_tm_clones>:
      c0:	b0000060 	adrp	x0, d000 <__malloc_av_+0x600>
      c4:	910fc000 	add	x0, x0, #0x3f0
      c8:	b0000061 	adrp	x1, d000 <__malloc_av_+0x600>
      cc:	910fc021 	add	x1, x1, #0x3f0
      d0:	cb000021 	sub	x1, x1, x0
      d4:	d37ffc22 	lsr	x2, x1, #63
      d8:	8b810c41 	add	x1, x2, x1, asr #3
      dc:	9341fc21 	asr	x1, x1, #1
      e0:	b40000c1 	cbz	x1, f8 <register_tm_clones+0x38>
      e4:	d0000042 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
      e8:	f947b842 	ldr	x2, [x2, #3952]
      ec:	b4000062 	cbz	x2, f8 <register_tm_clones+0x38>
      f0:	aa0203f0 	mov	x16, x2
      f4:	d61f0200 	br	x16
      f8:	d65f03c0 	ret
      fc:	d503201f 	nop

0000000000000100 <__do_global_dtors_aux>:
     100:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     104:	910003fd 	mov	x29, sp
     108:	f9000bf3 	str	x19, [sp, #16]
     10c:	b0000073 	adrp	x19, d000 <__malloc_av_+0x600>
     110:	394fc260 	ldrb	w0, [x19, #1008]
     114:	35000140 	cbnz	w0, 13c <__do_global_dtors_aux+0x3c>
     118:	97ffffde 	bl	90 <deregister_tm_clones>
     11c:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     120:	f947bc00 	ldr	x0, [x0, #3960]
     124:	b4000080 	cbz	x0, 134 <__do_global_dtors_aux+0x34>
     128:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     12c:	9129d000 	add	x0, x0, #0xa74
     130:	d503201f 	nop
     134:	52800020 	mov	w0, #0x1                   	// #1
     138:	390fc260 	strb	w0, [x19, #1008]
     13c:	f9400bf3 	ldr	x19, [sp, #16]
     140:	a8c27bfd 	ldp	x29, x30, [sp], #32
     144:	d65f03c0 	ret
     148:	d503201f 	nop
     14c:	d503201f 	nop

0000000000000150 <frame_dummy>:
     150:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     154:	f947c000 	ldr	x0, [x0, #3968]
     158:	b4000140 	cbz	x0, 180 <frame_dummy+0x30>
     15c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     160:	b0000061 	adrp	x1, d000 <__malloc_av_+0x600>
     164:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     168:	910003fd 	mov	x29, sp
     16c:	910fe021 	add	x1, x1, #0x3f8
     170:	9129d000 	add	x0, x0, #0xa74
     174:	d503201f 	nop
     178:	a8c17bfd 	ldp	x29, x30, [sp], #16
     17c:	17ffffd1 	b	c0 <register_tm_clones>
     180:	17ffffd0 	b	c0 <register_tm_clones>
     184:	d503201f 	nop

0000000000000188 <_mainCRTStartup>:
     188:	58000281 	ldr	x1, 1d8 <_cpu_init_hook+0x4>
     18c:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     190:	9100001f 	mov	sp, x0
     194:	d280001d 	mov	x29, #0x0                   	// #0
     198:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     19c:	910003fd 	mov	x29, sp
     1a0:	9400000d 	bl	1d4 <_cpu_init_hook>
     1a4:	580001e0 	ldr	x0, 1e0 <_cpu_init_hook+0xc>
     1a8:	52800001 	mov	w1, #0x0                   	// #0
     1ac:	580001e2 	ldr	x2, 1e8 <_cpu_init_hook+0x14>
     1b0:	cb000042 	sub	x2, x2, x0
     1b4:	94000ed3 	bl	3d00 <memset>
     1b8:	580001c0 	ldr	x0, 1f0 <_cpu_init_hook+0x1c>
     1bc:	94000ba9 	bl	3060 <atexit>
     1c0:	94000c04 	bl	31d0 <__libc_init_array>
     1c4:	d2800000 	mov	x0, #0x0                   	// #0
     1c8:	d2800001 	mov	x1, #0x0                   	// #0
     1cc:	97ffff8d 	bl	0 <main>
     1d0:	140008c4 	b	24e0 <exit>

00000000000001d4 <_cpu_init_hook>:
     1d4:	d65f03c0 	ret
	...
     1e0:	0000d3f0 	.word	0x0000d3f0
     1e4:	00000000 	.word	0x00000000
     1e8:	0000d848 	.word	0x0000d848
     1ec:	00000000 	.word	0x00000000
     1f0:	00003080 	.word	0x00003080
     1f4:	00000000 	.word	0x00000000
     1f8:	d503201f 	.word	0xd503201f
     1fc:	d503201f 	.word	0xd503201f

0000000000000200 <ipc_serve_Ipc_sem_delete>:
IPC_SERVER_INTERFACE(Ipc_sem_delete, 1);
     200:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     204:	910003fd 	mov	x29, sp
     208:	f9000bf3 	str	x19, [sp, #16]
     20c:	aa0003f3 	mov	x19, x0
/// @param msg
/// @param arg_num start with 0 for first arg
/// @return
__attribute__((__always_inline__)) static inline void* ipc_msg_get_nth_arg_buf(struct IpcMsg* msg, int arg_num)
{
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     210:	39404000 	ldrb	w0, [x0, #16]
     214:	370004c0 	tbnz	w0, #0, 2ac <ipc_serve_Ipc_sem_delete+0xac>
        return NULL;
    }

    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     218:	79401a60 	ldrh	w0, [x19, #12]
        return SEMAPHORE_ERR;
     21c:	12800001 	mov	w1, #0xffffffff            	// #-1
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     220:	b8606a60 	ldr	w0, [x19, x0]
     224:	7100801f 	cmp	w0, #0x20
     228:	54000108 	b.hi	248 <ipc_serve_Ipc_sem_delete+0x48>  // b.pmore
    if (!sem_pool[*sem].valid) {
     22c:	d37d7c00 	ubfiz	x0, x0, #3, #32
     230:	b0000062 	adrp	x2, d000 <__malloc_av_+0x600>
     234:	9110a042 	add	x2, x2, #0x428
     238:	38606843 	ldrb	w3, [x2, x0]
     23c:	34000063 	cbz	w3, 248 <ipc_serve_Ipc_sem_delete+0x48>
    return SEMAPHORE_SUC;
     240:	52800021 	mov	w1, #0x1                   	// #1
    sem_pool[*sem].valid = false;
     244:	3820685f 	strb	wzr, [x2, x0]
IPC_SERVER_INTERFACE(Ipc_sem_delete, 1);
     248:	b9002fe1 	str	w1, [sp, #44]
     24c:	94000a3d 	bl	2b40 <is_cur_session_delayed>
     250:	72001c1f 	tst	w0, #0xff
     254:	54000141 	b.ne	27c <ipc_serve_Ipc_sem_delete+0x7c>  // b.any
/// @brief set return val of ipc call after serve, used by server
/// @param msg
/// @param ret_val
__attribute__((__always_inline__)) static inline void ipc_msg_set_return(struct IpcMsg* msg, int32_t* ret_val)
{
    assert(msg->header.valid == 1);
     258:	39400260 	ldrb	w0, [x19]
     25c:	36000180 	tbz	w0, #0, 28c <ipc_serve_Ipc_sem_delete+0x8c>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     260:	9100b3e1 	add	x1, sp, #0x2c
     264:	91002260 	add	x0, x19, #0x8
     268:	d2800082 	mov	x2, #0x4                   	// #4
     26c:	94000e15 	bl	3ac0 <memcpy>
     270:	39400260 	ldrb	w0, [x19]
     274:	321f0000 	orr	w0, w0, #0x2
     278:	39000260 	strb	w0, [x19]
     27c:	52800000 	mov	w0, #0x0                   	// #0
     280:	f9400bf3 	ldr	x19, [sp, #16]
     284:	a8c37bfd 	ldp	x29, x30, [sp], #48
     288:	d65f03c0 	ret
    assert(msg->header.valid == 1);
     28c:	d0000043 	adrp	x3, a000 <_strtol_l.part.0+0xd0>
     290:	f0000042 	adrp	x2, b000 <_fini+0xcc>
     294:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     298:	913e2063 	add	x3, x3, #0xf88
     29c:	91004042 	add	x2, x2, #0x10
     2a0:	913e8000 	add	x0, x0, #0xfa0
     2a4:	52801101 	mov	w1, #0x88                  	// #136
     2a8:	94000b4e 	bl	2fe0 <__assert_func>
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     2ac:	d2800000 	mov	x0, #0x0                   	// #0
     2b0:	b9400000 	ldr	w0, [x0]
     2b4:	d4207d00 	brk	#0x3e8
     2b8:	d503201f 	nop
     2bc:	d503201f 	nop

00000000000002c0 <ipc_serve_Ipc_sem_signal>:
IPC_SERVER_INTERFACE(Ipc_sem_signal, 1);
     2c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     2c4:	910003fd 	mov	x29, sp
     2c8:	f9000bf3 	str	x19, [sp, #16]
     2cc:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     2d0:	39404000 	ldrb	w0, [x0, #16]
     2d4:	37000540 	tbnz	w0, #0, 37c <ipc_serve_Ipc_sem_signal+0xbc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     2d8:	79401a60 	ldrh	w0, [x19, #12]
        return SEMAPHORE_ERR;
     2dc:	12800001 	mov	w1, #0xffffffff            	// #-1
    if (*sem < 0 || *sem >= MAX_SUPPORT_SEMAPHORES) {
     2e0:	b8606a60 	ldr	w0, [x19, x0]
     2e4:	71007c1f 	cmp	w0, #0x1f
     2e8:	54000188 	b.hi	318 <ipc_serve_Ipc_sem_signal+0x58>  // b.pmore
    if (!sem_pool[*sem].valid) {
     2ec:	d37d7c00 	ubfiz	x0, x0, #3, #32
     2f0:	b0000062 	adrp	x2, d000 <__malloc_av_+0x600>
     2f4:	9110a042 	add	x2, x2, #0x428
     2f8:	8b000043 	add	x3, x2, x0
     2fc:	38606840 	ldrb	w0, [x2, x0]
     300:	340000c0 	cbz	w0, 318 <ipc_serve_Ipc_sem_signal+0x58>
    sem_pool[*sem].count++;
     304:	b9400460 	ldr	w0, [x3, #4]
    return SEMAPHORE_SUC;
     308:	52800021 	mov	w1, #0x1                   	// #1
    sem_pool[*sem].count++;
     30c:	0b010000 	add	w0, w0, w1
     310:	b9000460 	str	w0, [x3, #4]
    return SEMAPHORE_SUC;
     314:	d503201f 	nop
IPC_SERVER_INTERFACE(Ipc_sem_signal, 1);
     318:	b9002fe1 	str	w1, [sp, #44]
     31c:	94000a09 	bl	2b40 <is_cur_session_delayed>
     320:	72001c1f 	tst	w0, #0xff
     324:	54000141 	b.ne	34c <ipc_serve_Ipc_sem_signal+0x8c>  // b.any
    assert(msg->header.valid == 1);
     328:	39400260 	ldrb	w0, [x19]
     32c:	36000180 	tbz	w0, #0, 35c <ipc_serve_Ipc_sem_signal+0x9c>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     330:	9100b3e1 	add	x1, sp, #0x2c
     334:	91002260 	add	x0, x19, #0x8
     338:	d2800082 	mov	x2, #0x4                   	// #4
     33c:	94000de1 	bl	3ac0 <memcpy>
     340:	39400260 	ldrb	w0, [x19]
     344:	321f0000 	orr	w0, w0, #0x2
     348:	39000260 	strb	w0, [x19]
     34c:	52800000 	mov	w0, #0x0                   	// #0
     350:	f9400bf3 	ldr	x19, [sp, #16]
     354:	a8c37bfd 	ldp	x29, x30, [sp], #48
     358:	d65f03c0 	ret
    assert(msg->header.valid == 1);
     35c:	d0000043 	adrp	x3, a000 <_strtol_l.part.0+0xd0>
     360:	f0000042 	adrp	x2, b000 <_fini+0xcc>
     364:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     368:	913e2063 	add	x3, x3, #0xf88
     36c:	91004042 	add	x2, x2, #0x10
     370:	913e8000 	add	x0, x0, #0xfa0
     374:	52801101 	mov	w1, #0x88                  	// #136
     378:	94000b1a 	bl	2fe0 <__assert_func>
    if (*sem < 0 || *sem >= MAX_SUPPORT_SEMAPHORES) {
     37c:	d2800000 	mov	x0, #0x0                   	// #0
     380:	b9400000 	ldr	w0, [x0]
     384:	d4207d00 	brk	#0x3e8
     388:	d503201f 	nop
     38c:	d503201f 	nop

0000000000000390 <ipc_serve_Ipc_sem_create>:
IPC_SERVER_INTERFACE(Ipc_sem_create, 2);
     390:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     394:	910003fd 	mov	x29, sp
     398:	f9000bf3 	str	x19, [sp, #16]
     39c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     3a0:	39404000 	ldrb	w0, [x0, #16]
     3a4:	370005e0 	tbnz	w0, #0, 460 <ipc_serve_Ipc_sem_create+0xd0>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     3a8:	79401a64 	ldrh	w4, [x19, #12]
     3ac:	8b040264 	add	x4, x19, x4
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     3b0:	39405a60 	ldrb	w0, [x19, #22]
     3b4:	37000520 	tbnz	w0, #0, 458 <ipc_serve_Ipc_sem_create+0xc8>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     3b8:	79402665 	ldrh	w5, [x19, #18]
     3bc:	8b050265 	add	x5, x19, x5
    for (idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
     3c0:	b0000060 	adrp	x0, d000 <__malloc_av_+0x600>
     3c4:	9110a000 	add	x0, x0, #0x428
     3c8:	aa0003e2 	mov	x2, x0
     3cc:	52800001 	mov	w1, #0x0                   	// #0
     3d0:	14000005 	b	3e4 <ipc_serve_Ipc_sem_create+0x54>
     3d4:	11000421 	add	w1, w1, #0x1
     3d8:	91002042 	add	x2, x2, #0x8
     3dc:	7100803f 	cmp	w1, #0x20
     3e0:	54000380 	b.eq	450 <ipc_serve_Ipc_sem_create+0xc0>  // b.none
        if (!sem_pool[idx].valid) {
     3e4:	39400043 	ldrb	w3, [x2]
     3e8:	35ffff63 	cbnz	w3, 3d4 <ipc_serve_Ipc_sem_create+0x44>
    sem_pool[idx].valid = true;
     3ec:	937d7c22 	sbfiz	x2, x1, #3, #32
     3f0:	52800027 	mov	w7, #0x1                   	// #1
     3f4:	8b020006 	add	x6, x0, x2
    return SEMAPHORE_SUC;
     3f8:	52800023 	mov	w3, #0x1                   	// #1
    sem_pool[idx].valid = true;
     3fc:	38226807 	strb	w7, [x0, x2]
    sem_pool[idx].count = *count;
     400:	b94000a0 	ldr	w0, [x5]
     404:	b90004c0 	str	w0, [x6, #4]
    *sem = idx;
     408:	b9000081 	str	w1, [x4]
IPC_SERVER_INTERFACE(Ipc_sem_create, 2);
     40c:	b9002fe3 	str	w3, [sp, #44]
     410:	940009cc 	bl	2b40 <is_cur_session_delayed>
     414:	72001c1f 	tst	w0, #0xff
     418:	54000141 	b.ne	440 <ipc_serve_Ipc_sem_create+0xb0>  // b.any
    assert(msg->header.valid == 1);
     41c:	39400260 	ldrb	w0, [x19]
     420:	36000240 	tbz	w0, #0, 468 <ipc_serve_Ipc_sem_create+0xd8>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     424:	9100b3e1 	add	x1, sp, #0x2c
     428:	91002260 	add	x0, x19, #0x8
     42c:	d2800082 	mov	x2, #0x4                   	// #4
     430:	94000da4 	bl	3ac0 <memcpy>
     434:	39400260 	ldrb	w0, [x19]
     438:	321f0000 	orr	w0, w0, #0x2
     43c:	39000260 	strb	w0, [x19]
     440:	52800000 	mov	w0, #0x0                   	// #0
     444:	f9400bf3 	ldr	x19, [sp, #16]
     448:	a8c37bfd 	ldp	x29, x30, [sp], #48
     44c:	d65f03c0 	ret
        return SEMAPHORE_ERR;
     450:	12800003 	mov	w3, #0xffffffff            	// #-1
     454:	17ffffee 	b	40c <ipc_serve_Ipc_sem_create+0x7c>
        return NULL;
     458:	d2800005 	mov	x5, #0x0                   	// #0
     45c:	17ffffd9 	b	3c0 <ipc_serve_Ipc_sem_create+0x30>
     460:	d2800004 	mov	x4, #0x0                   	// #0
     464:	17ffffd3 	b	3b0 <ipc_serve_Ipc_sem_create+0x20>
    assert(msg->header.valid == 1);
     468:	d0000043 	adrp	x3, a000 <_strtol_l.part.0+0xd0>
     46c:	f0000042 	adrp	x2, b000 <_fini+0xcc>
     470:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     474:	913e2063 	add	x3, x3, #0xf88
     478:	91004042 	add	x2, x2, #0x10
     47c:	913e8000 	add	x0, x0, #0xfa0
     480:	52801101 	mov	w1, #0x88                  	// #136
     484:	94000ad7 	bl	2fe0 <__assert_func>
     488:	d503201f 	nop
     48c:	d503201f 	nop

0000000000000490 <ipc_serve_Ipc_sem_wait>:
IPC_SERVER_INTERFACE(Ipc_sem_wait, 2);
     490:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     494:	910003fd 	mov	x29, sp
     498:	a90153f3 	stp	x19, x20, [sp, #16]
     49c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     4a0:	39404000 	ldrb	w0, [x0, #16]
     4a4:	370005e0 	tbnz	w0, #0, 560 <ipc_serve_Ipc_sem_wait+0xd0>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     4a8:	79401a60 	ldrh	w0, [x19, #12]
        return SEMAPHORE_ERR;
     4ac:	12800014 	mov	w20, #0xffffffff            	// #-1
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     4b0:	b8606a60 	ldr	w0, [x19, x0]
     4b4:	7100801f 	cmp	w0, #0x20
     4b8:	540001e8 	b.hi	4f4 <ipc_serve_Ipc_sem_wait+0x64>  // b.pmore
    if (!sem_pool[*sem].valid || sem_pool[*sem].count > 0) {
     4bc:	d37d7c02 	ubfiz	x2, x0, #3, #32
     4c0:	b0000061 	adrp	x1, d000 <__malloc_av_+0x600>
     4c4:	9110a021 	add	x1, x1, #0x428
     4c8:	2a0003e0 	mov	w0, w0
     4cc:	8b020024 	add	x4, x1, x2
     4d0:	38626823 	ldrb	w3, [x1, x2]
     4d4:	b9400482 	ldr	w2, [x4, #4]
     4d8:	34000063 	cbz	w3, 4e4 <ipc_serve_Ipc_sem_wait+0x54>
     4dc:	7100005f 	cmp	w2, #0x0
     4e0:	540002cd 	b.le	538 <ipc_serve_Ipc_sem_wait+0xa8>
        sem_pool[*sem].count--;
     4e4:	8b000c20 	add	x0, x1, x0, lsl #3
     4e8:	51000442 	sub	w2, w2, #0x1
        return SEMAPHORE_SUC;
     4ec:	52800034 	mov	w20, #0x1                   	// #1
        sem_pool[*sem].count--;
     4f0:	b9000402 	str	w2, [x0, #4]
IPC_SERVER_INTERFACE(Ipc_sem_wait, 2);
     4f4:	b9002ff4 	str	w20, [sp, #44]
     4f8:	94000992 	bl	2b40 <is_cur_session_delayed>
     4fc:	72001c1f 	tst	w0, #0xff
     500:	54000141 	b.ne	528 <ipc_serve_Ipc_sem_wait+0x98>  // b.any
    assert(msg->header.valid == 1);
     504:	39400260 	ldrb	w0, [x19]
     508:	360001c0 	tbz	w0, #0, 540 <ipc_serve_Ipc_sem_wait+0xb0>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     50c:	9100b3e1 	add	x1, sp, #0x2c
     510:	91002260 	add	x0, x19, #0x8
     514:	d2800082 	mov	x2, #0x4                   	// #4
     518:	94000d6a 	bl	3ac0 <memcpy>
     51c:	39400260 	ldrb	w0, [x19]
     520:	321f0000 	orr	w0, w0, #0x2
     524:	39000260 	strb	w0, [x19]
     528:	52800000 	mov	w0, #0x0                   	// #0
     52c:	a94153f3 	ldp	x19, x20, [sp, #16]
     530:	a8c37bfd 	ldp	x29, x30, [sp], #48
     534:	d65f03c0 	ret
    delay_session();
     538:	9400097e 	bl	2b30 <delay_session>
    return SEMAPHORE_ERR;
     53c:	17ffffee 	b	4f4 <ipc_serve_Ipc_sem_wait+0x64>
    assert(msg->header.valid == 1);
     540:	d0000043 	adrp	x3, a000 <_strtol_l.part.0+0xd0>
     544:	f0000042 	adrp	x2, b000 <_fini+0xcc>
     548:	d0000040 	adrp	x0, a000 <_strtol_l.part.0+0xd0>
     54c:	913e2063 	add	x3, x3, #0xf88
     550:	91004042 	add	x2, x2, #0x10
     554:	913e8000 	add	x0, x0, #0xfa0
     558:	52801101 	mov	w1, #0x88                  	// #136
     55c:	94000aa1 	bl	2fe0 <__assert_func>
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     560:	d2800000 	mov	x0, #0x0                   	// #0
     564:	b9400000 	ldr	w0, [x0]
     568:	d4207d00 	brk	#0x3e8
     56c:	d503201f 	nop

0000000000000570 <ipc_do_serve_Ipc_sem_create>:
    for (idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
     570:	b0000065 	adrp	x5, d000 <__malloc_av_+0x600>
     574:	9110a0a5 	add	x5, x5, #0x428
{
     578:	aa0003e6 	mov	x6, x0
     57c:	aa0503e2 	mov	x2, x5
    for (idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
     580:	52800003 	mov	w3, #0x0                   	// #0
     584:	14000004 	b	594 <ipc_do_serve_Ipc_sem_create+0x24>
     588:	11000463 	add	w3, w3, #0x1
     58c:	7100807f 	cmp	w3, #0x20
     590:	540001a0 	b.eq	5c4 <ipc_do_serve_Ipc_sem_create+0x54>  // b.none
        if (!sem_pool[idx].valid) {
     594:	39400044 	ldrb	w4, [x2]
    for (idx = 0; idx < MAX_SUPPORT_SEMAPHORES; idx++) {
     598:	91002042 	add	x2, x2, #0x8
        if (!sem_pool[idx].valid) {
     59c:	35ffff64 	cbnz	w4, 588 <ipc_do_serve_Ipc_sem_create+0x18>
    sem_pool[idx].valid = true;
     5a0:	937d7c62 	sbfiz	x2, x3, #3, #32
     5a4:	52800027 	mov	w7, #0x1                   	// #1
     5a8:	8b0200a4 	add	x4, x5, x2
    return SEMAPHORE_SUC;
     5ac:	52800020 	mov	w0, #0x1                   	// #1
    sem_pool[idx].valid = true;
     5b0:	382268a7 	strb	w7, [x5, x2]
    sem_pool[idx].count = *count;
     5b4:	b9400021 	ldr	w1, [x1]
     5b8:	b9000481 	str	w1, [x4, #4]
    *sem = idx;
     5bc:	b90000c3 	str	w3, [x6]
}
     5c0:	d65f03c0 	ret
        return SEMAPHORE_ERR;
     5c4:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     5c8:	d65f03c0 	ret
     5cc:	d503201f 	nop

00000000000005d0 <ipc_do_serve_Ipc_sem_delete>:
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     5d0:	b9400000 	ldr	w0, [x0]
     5d4:	7100801f 	cmp	w0, #0x20
     5d8:	54000148 	b.hi	600 <ipc_do_serve_Ipc_sem_delete+0x30>  // b.pmore
    if (!sem_pool[*sem].valid) {
     5dc:	d37d7c01 	ubfiz	x1, x0, #3, #32
     5e0:	b0000062 	adrp	x2, d000 <__malloc_av_+0x600>
     5e4:	9110a042 	add	x2, x2, #0x428
        return SEMAPHORE_ERR;
     5e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    if (!sem_pool[*sem].valid) {
     5ec:	38616843 	ldrb	w3, [x2, x1]
     5f0:	34000063 	cbz	w3, 5fc <ipc_do_serve_Ipc_sem_delete+0x2c>
    return SEMAPHORE_SUC;
     5f4:	52800020 	mov	w0, #0x1                   	// #1
    sem_pool[*sem].valid = false;
     5f8:	3821685f 	strb	wzr, [x2, x1]
}
     5fc:	d65f03c0 	ret
        return SEMAPHORE_ERR;
     600:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     604:	d65f03c0 	ret
     608:	d503201f 	nop
     60c:	d503201f 	nop

0000000000000610 <ipc_do_serve_Ipc_sem_wait>:
    if (*sem < 0 || *sem > MAX_SUPPORT_SEMAPHORES) {
     610:	b9400000 	ldr	w0, [x0]
     614:	7100801f 	cmp	w0, #0x20
     618:	54000208 	b.hi	658 <ipc_do_serve_Ipc_sem_wait+0x48>  // b.pmore
    if (!sem_pool[*sem].valid || sem_pool[*sem].count > 0) {
     61c:	d37d7c02 	ubfiz	x2, x0, #3, #32
     620:	b0000061 	adrp	x1, d000 <__malloc_av_+0x600>
     624:	9110a021 	add	x1, x1, #0x428
     628:	2a0003e0 	mov	w0, w0
     62c:	8b020024 	add	x4, x1, x2
     630:	38626823 	ldrb	w3, [x1, x2]
     634:	b9400482 	ldr	w2, [x4, #4]
     638:	34000063 	cbz	w3, 644 <ipc_do_serve_Ipc_sem_wait+0x34>
     63c:	7100005f 	cmp	w2, #0x0
     640:	5400010d 	b.le	660 <ipc_do_serve_Ipc_sem_wait+0x50>
        sem_pool[*sem].count--;
     644:	8b000c21 	add	x1, x1, x0, lsl #3
     648:	51000442 	sub	w2, w2, #0x1
        return SEMAPHORE_SUC;
     64c:	52800020 	mov	w0, #0x1                   	// #1
        sem_pool[*sem].count--;
     650:	b9000422 	str	w2, [x1, #4]
        return SEMAPHORE_SUC;
     654:	d65f03c0 	ret
        return SEMAPHORE_ERR;
     658:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     65c:	d65f03c0 	ret
{
     660:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     664:	910003fd 	mov	x29, sp
    delay_session();
     668:	94000932 	bl	2b30 <delay_session>
    return SEMAPHORE_ERR;
     66c:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     670:	a8c17bfd 	ldp	x29, x30, [sp], #16
     674:	d65f03c0 	ret
     678:	d503201f 	nop
     67c:	d503201f 	nop

0000000000000680 <ipc_do_serve_Ipc_sem_signal>:
    if (*sem < 0 || *sem >= MAX_SUPPORT_SEMAPHORES) {
     680:	b9400000 	ldr	w0, [x0]
     684:	71007c1f 	cmp	w0, #0x1f
     688:	540001a8 	b.hi	6bc <ipc_do_serve_Ipc_sem_signal+0x3c>  // b.pmore
    if (!sem_pool[*sem].valid) {
     68c:	d37d7c01 	ubfiz	x1, x0, #3, #32
     690:	b0000062 	adrp	x2, d000 <__malloc_av_+0x600>
     694:	9110a042 	add	x2, x2, #0x428
        return SEMAPHORE_ERR;
     698:	12800000 	mov	w0, #0xffffffff            	// #-1
    if (!sem_pool[*sem].valid) {
     69c:	8b010043 	add	x3, x2, x1
     6a0:	38616841 	ldrb	w1, [x2, x1]
     6a4:	340000a1 	cbz	w1, 6b8 <ipc_do_serve_Ipc_sem_signal+0x38>
    sem_pool[*sem].count++;
     6a8:	b9400461 	ldr	w1, [x3, #4]
    return SEMAPHORE_SUC;
     6ac:	52800020 	mov	w0, #0x1                   	// #1
    sem_pool[*sem].count++;
     6b0:	0b000021 	add	w1, w1, w0
     6b4:	b9000461 	str	w1, [x3, #4]
}
     6b8:	d65f03c0 	ret
        return SEMAPHORE_ERR;
     6bc:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     6c0:	d65f03c0 	ret
     6c4:	d503201f 	nop
     6c8:	d503201f 	nop
     6cc:	d503201f 	nop

00000000000006d0 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
     6d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
     6d4:	52800020 	mov	w0, #0x1                   	// #1
{
     6d8:	910003fd 	mov	x29, sp
     6dc:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
     6e0:	b0000073 	adrp	x19, d000 <__malloc_av_+0x600>
     6e4:	b9452a61 	ldr	w1, [x19, #1320]
     6e8:	34000081 	cbz	w1, 6f8 <init_uart_mmio+0x28>
}
     6ec:	f9400bf3 	ldr	x19, [sp, #16]
     6f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
     6f4:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     6f8:	2a0003e3 	mov	w3, w0
     6fc:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     700:	52820002 	mov	w2, #0x1000                	// #4096
     704:	aa0103e0 	mov	x0, x1
     708:	940007de 	bl	2680 <mmap>
     70c:	3100041f 	cmn	w0, #0x1
            return false;
     710:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
     714:	54fffec0 	b.eq	6ec <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
     718:	52800021 	mov	w1, #0x1                   	// #1
    return true;
     71c:	2a0103e0 	mov	w0, w1
        mapped = 1;
     720:	b9052a61 	str	w1, [x19, #1320]
}
     724:	f9400bf3 	ldr	x19, [sp, #16]
     728:	a8c27bfd 	ldp	x29, x30, [sp], #32
     72c:	d65f03c0 	ret

0000000000000730 <putc>:

void putc(char ch)
{
     730:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
     734:	7100281f 	cmp	w0, #0xa
     738:	540000c0 	b.eq	750 <putc+0x20>  // b.none
    return in_le32(addr);
     73c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     740:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     744:	362fffe1 	tbz	w1, #5, 740 <putc+0x10>
    out_le32(addr, value);
     748:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
     74c:	d65f03c0 	ret
    return in_le32(addr);
     750:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
     754:	d503201f 	nop
     758:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
     75c:	362fffe1 	tbz	w1, #5, 758 <putc+0x28>
    out_le32(addr, value);
     760:	528001a1 	mov	w1, #0xd                   	// #13
     764:	b9000041 	str	w1, [x2]
}
     768:	17fffff5 	b	73c <putc+0xc>
     76c:	d503201f 	nop

0000000000000770 <getc>:
    return in_le32(addr);
     770:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
     774:	d503201f 	nop
     778:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
     77c:	3607ffe0 	tbz	w0, #0, 778 <getc+0x8>
    return in_le32(addr);
     780:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
     784:	d65f03c0 	ret
     788:	d503201f 	nop
     78c:	d503201f 	nop

0000000000000790 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
     790:	eb03005f 	cmp	x2, x3
{
     794:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
     798:	54000042 	b.cs	7a0 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
     79c:	38226820 	strb	w0, [x1, x2]
    }
}
     7a0:	d65f03c0 	ret
     7a4:	d503201f 	nop
     7a8:	d503201f 	nop
     7ac:	d503201f 	nop

00000000000007b0 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
     7b0:	d65f03c0 	ret
     7b4:	d503201f 	nop
     7b8:	d503201f 	nop
     7bc:	d503201f 	nop

00000000000007c0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
     7c0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
     7c4:	910003fd 	mov	x29, sp
     7c8:	a90153f3 	stp	x19, x20, [sp, #16]
     7cc:	aa0503f3 	mov	x19, x5
     7d0:	aa0203f4 	mov	x20, x2
     7d4:	a9025bf5 	stp	x21, x22, [sp, #32]
     7d8:	aa0003f5 	mov	x21, x0
     7dc:	aa0103f6 	mov	x22, x1
     7e0:	a90363f7 	stp	x23, x24, [sp, #48]
     7e4:	aa0203f7 	mov	x23, x2
     7e8:	aa0403f8 	mov	x24, x4
     7ec:	a9046bf9 	stp	x25, x26, [sp, #64]
     7f0:	2a0703fa 	mov	w26, w7
     7f4:	2a0603f9 	mov	w25, w6
     7f8:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     7fc:	f240075f 	tst	x26, #0x3
{
     800:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
     804:	540001e1 	b.ne	840 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
     808:	2a0603e0 	mov	w0, w6
     80c:	aa0203fc 	mov	x28, x2
     810:	cb050014 	sub	x20, x0, x5
     814:	eb0000bf 	cmp	x5, x0
     818:	8b020294 	add	x20, x20, x2
     81c:	54000542 	b.cs	8c4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
     820:	aa1c03e2 	mov	x2, x28
     824:	aa1b03e3 	mov	x3, x27
     828:	9100079c 	add	x28, x28, #0x1
     82c:	aa1603e1 	mov	x1, x22
     830:	52800400 	mov	w0, #0x20                  	// #32
     834:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
     838:	eb1c029f 	cmp	x20, x28
     83c:	54ffff21 	b.ne	820 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
     840:	8b14027c 	add	x28, x19, x20
     844:	b4000133 	cbz	x19, 868 <_out_rev+0xa8>
     848:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
     84c:	d1000673 	sub	x19, x19, #0x1
     850:	aa1c03f4 	mov	x20, x28
     854:	aa1b03e3 	mov	x3, x27
     858:	aa1603e1 	mov	x1, x22
     85c:	38736b00 	ldrb	w0, [x24, x19]
     860:	d63f02a0 	blr	x21
    while (len) {
     864:	b5ffff33 	cbnz	x19, 848 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
     868:	360801fa 	tbz	w26, #1, 8a4 <_out_rev+0xe4>
        while (idx - start_idx < width) {
     86c:	cb170297 	sub	x23, x20, x23
     870:	2a1903f9 	mov	w25, w25
     874:	eb1902ff 	cmp	x23, x25
     878:	54000162 	b.cs	8a4 <_out_rev+0xe4>  // b.hs, b.nlast
     87c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
     880:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
     884:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
     888:	aa1b03e3 	mov	x3, x27
     88c:	aa1603e1 	mov	x1, x22
     890:	52800400 	mov	w0, #0x20                  	// #32
     894:	d63f02a0 	blr	x21
     898:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
     89c:	eb1902ff 	cmp	x23, x25
     8a0:	54ffff03 	b.cc	880 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
     8a4:	aa1403e0 	mov	x0, x20
     8a8:	a94153f3 	ldp	x19, x20, [sp, #16]
     8ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
     8b0:	a94363f7 	ldp	x23, x24, [sp, #48]
     8b4:	a9446bf9 	ldp	x25, x26, [sp, #64]
     8b8:	a94573fb 	ldp	x27, x28, [sp, #80]
     8bc:	a8c67bfd 	ldp	x29, x30, [sp], #96
     8c0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
     8c4:	aa0203f4 	mov	x20, x2
     8c8:	17ffffde 	b	840 <_out_rev+0x80>
     8cc:	d503201f 	nop

00000000000008d0 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
     8d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     8d4:	aa0603eb 	mov	x11, x6
     8d8:	aa0403e9 	mov	x9, x4
     8dc:	910003fd 	mov	x29, sp
     8e0:	b9403be8 	ldr	w8, [sp, #56]
     8e4:	2a0703ef 	mov	w15, w7
     8e8:	b94033e6 	ldr	w6, [sp, #48]
     8ec:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
     8f0:	12160110 	and	w16, w8, #0x400
    if (!value) {
     8f4:	b5000c64 	cbnz	x4, a80 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
     8f8:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
     8fc:	34000730 	cbz	w16, 9e0 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
     900:	121f0111 	and	w17, w8, #0x2
     904:	37080fc8 	tbnz	w8, #1, afc <_ntoa_long+0x22c>
    size_t len = 0U;
     908:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     90c:	2a0f03e9 	mov	w9, w15
     910:	f1007cbf 	cmp	x5, #0x1f
     914:	910043e4 	add	x4, sp, #0x10
     918:	1a9f87ea 	cset	w10, ls  // ls = plast
     91c:	eb05013f 	cmp	x9, x5
     920:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     924:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     928:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     92c:	350009c6 	cbnz	w6, a64 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     930:	34000108 	cbz	w8, 950 <_ntoa_long+0x80>
            buf[len++] = '0';
     934:	5280060a 	mov	w10, #0x30                  	// #48
     938:	910004a5 	add	x5, x5, #0x1
     93c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     940:	eb05013f 	cmp	x9, x5
     944:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     948:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     94c:	54ffff69 	b.ls	938 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     950:	340001cc 	cbz	w12, 988 <_ntoa_long+0xb8>
     954:	f1007cbf 	cmp	x5, #0x1f
     958:	1a9f87ea 	cset	w10, ls  // ls = plast
     95c:	7100015f 	cmp	w10, #0x0
     960:	2a0603e9 	mov	w9, w6
     964:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
     968:	54000109 	b.ls	988 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
     96c:	5280060a 	mov	w10, #0x30                  	// #48
     970:	910004a5 	add	x5, x5, #0x1
     974:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     978:	eb05013f 	cmp	x9, x5
     97c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
     980:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     984:	54ffff69 	b.ls	970 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
     988:	340001b1 	cbz	w17, 9bc <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     98c:	350008b0 	cbnz	w16, aa0 <_ntoa_long+0x1d0>
     990:	b50007e5 	cbnz	x5, a8c <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     994:	f100417f 	cmp	x11, #0x10
     998:	54000f20 	b.eq	b7c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     99c:	f100097f 	cmp	x11, #0x2
     9a0:	54000f21 	b.ne	b84 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
     9a4:	52800c48 	mov	w8, #0x62                  	// #98
     9a8:	d2800025 	mov	x5, #0x1                   	// #1
     9ac:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
     9b0:	52800608 	mov	w8, #0x30                  	// #48
     9b4:	38256888 	strb	w8, [x4, x5]
     9b8:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     9bc:	f10080bf 	cmp	x5, #0x20
     9c0:	540000a0 	b.eq	9d4 <_ntoa_long+0x104>  // b.none
        if (negative) {
     9c4:	340008d2 	cbz	w18, adc <_ntoa_long+0x20c>
            buf[len++] = '-';
     9c8:	528005a8 	mov	w8, #0x2d                  	// #45
     9cc:	38256888 	strb	w8, [x4, x5]
     9d0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     9d4:	97ffff7b 	bl	7c0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
     9d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     9dc:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
     9e0:	52800011 	mov	w17, #0x0                   	// #0
     9e4:	f27b00ff 	tst	x7, #0x20
     9e8:	52800c24 	mov	w4, #0x61                  	// #97
     9ec:	5280082e 	mov	w14, #0x41                  	// #65
     9f0:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     9f4:	510029ce 	sub	w14, w14, #0xa
     9f8:	910043e4 	add	x4, sp, #0x10
     9fc:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
     a00:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     a04:	910004a5 	add	x5, x5, #0x1
     a08:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
     a0c:	9b0ba58a 	msub	x10, x12, x11, x9
     a10:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
     a14:	f100255f 	cmp	x10, #0x9
     a18:	1100c10a 	add	w10, w8, #0x30
     a1c:	0b0e0108 	add	w8, w8, w14
     a20:	12001d4a 	and	w10, w10, #0xff
     a24:	12001d08 	and	w8, w8, #0xff
     a28:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
     a2c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     a30:	eb0b013f 	cmp	x9, x11
            value /= base;
     a34:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
     a38:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
     a3c:	54fffe29 	b.ls	a00 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
     a40:	370ffa47 	tbnz	w7, #1, 988 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     a44:	f1007cbf 	cmp	x5, #0x1f
     a48:	2a0f03e9 	mov	w9, w15
     a4c:	1a9f87ea 	cset	w10, ls  // ls = plast
     a50:	eb05013f 	cmp	x9, x5
     a54:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     a58:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     a5c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
     a60:	34fff686 	cbz	w6, 930 <_ntoa_long+0x60>
     a64:	3400048c 	cbz	w12, af4 <_ntoa_long+0x224>
     a68:	35000072 	cbnz	w18, a74 <_ntoa_long+0x1a4>
     a6c:	721e04ff 	tst	w7, #0xc
     a70:	54000040 	b.eq	a78 <_ntoa_long+0x1a8>  // b.none
            width--;
     a74:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     a78:	35fff5e8 	cbnz	w8, 934 <_ntoa_long+0x64>
     a7c:	17ffffb8 	b	95c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
     a80:	121c0111 	and	w17, w8, #0x10
     a84:	2a0803e7 	mov	w7, w8
     a88:	17ffffd7 	b	9e4 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
     a8c:	eb2f40bf 	cmp	x5, w15, uxtw
     a90:	54000480 	b.eq	b20 <_ntoa_long+0x250>  // b.none
     a94:	eb2640bf 	cmp	x5, w6, uxtw
     a98:	54000440 	b.eq	b20 <_ntoa_long+0x250>  // b.none
     a9c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     aa0:	f1007cbf 	cmp	x5, #0x1f
     aa4:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     aa8:	f100417f 	cmp	x11, #0x10
     aac:	54000480 	b.eq	b3c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     ab0:	7100011f 	cmp	w8, #0x0
     ab4:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
     ab8:	54000081 	b.ne	ac8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
     abc:	52800c48 	mov	w8, #0x62                  	// #98
     ac0:	38256888 	strb	w8, [x4, x5]
     ac4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
     ac8:	f10080bf 	cmp	x5, #0x20
     acc:	54fff721 	b.ne	9b0 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     ad0:	97ffff3c 	bl	7c0 <_out_rev>
}
     ad4:	a8c37bfd 	ldp	x29, x30, [sp], #48
     ad8:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
     adc:	37100167 	tbnz	w7, #2, b08 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
     ae0:	361ff7a7 	tbz	w7, #3, 9d4 <_ntoa_long+0x104>
            buf[len++] = ' ';
     ae4:	52800408 	mov	w8, #0x20                  	// #32
     ae8:	38256888 	strb	w8, [x4, x5]
     aec:	910004a5 	add	x5, x5, #0x1
     af0:	17ffffb9 	b	9d4 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     af4:	35fff208 	cbnz	w8, 934 <_ntoa_long+0x64>
     af8:	17ffffa4 	b	988 <_ntoa_long+0xb8>
     afc:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
     b00:	d2800005 	mov	x5, #0x0                   	// #0
     b04:	17ffffb0 	b	9c4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
     b08:	52800568 	mov	w8, #0x2b                  	// #43
     b0c:	38256888 	strb	w8, [x4, x5]
     b10:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
     b14:	97ffff2b 	bl	7c0 <_out_rev>
}
     b18:	a8c37bfd 	ldp	x29, x30, [sp], #48
     b1c:	d65f03c0 	ret
            if (len && (base == 16U)) {
     b20:	f10004aa 	subs	x10, x5, #0x1
                len--;
     b24:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
     b28:	1a9f07e8 	cset	w8, ne  // ne = any
     b2c:	7100417f 	cmp	w11, #0x10
     b30:	1a9f17e9 	cset	w9, eq  // eq = none
     b34:	6a090108 	ands	w8, w8, w9
     b38:	54000160 	b.eq	b64 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     b3c:	721b00e9 	ands	w9, w7, #0x20
     b40:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
     b44:	54000141 	b.ne	b6c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     b48:	7100013f 	cmp	w9, #0x0
     b4c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
     b50:	54fffbc0 	b.eq	ac8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
     b54:	52800b08 	mov	w8, #0x58                  	// #88
     b58:	38256888 	strb	w8, [x4, x5]
     b5c:	910004a5 	add	x5, x5, #0x1
     b60:	17ffffda 	b	ac8 <_ntoa_long+0x1f8>
            len--;
     b64:	aa0a03e5 	mov	x5, x10
     b68:	17ffffce 	b	aa0 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
     b6c:	52800f08 	mov	w8, #0x78                  	// #120
     b70:	38256888 	strb	w8, [x4, x5]
     b74:	910004a5 	add	x5, x5, #0x1
     b78:	17ffffd4 	b	ac8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
     b7c:	52800028 	mov	w8, #0x1                   	// #1
     b80:	17ffffef 	b	b3c <_ntoa_long+0x26c>
            buf[len++] = '0';
     b84:	52800608 	mov	w8, #0x30                  	// #48
     b88:	d2800025 	mov	x5, #0x1                   	// #1
     b8c:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
     b90:	17ffff8d 	b	9c4 <_ntoa_long+0xf4>
     b94:	d503201f 	nop
     b98:	d503201f 	nop
     b9c:	d503201f 	nop

0000000000000ba0 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
     ba0:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     ba4:	1e602000 	fcmp	d0, d0
{
     ba8:	a9017bfd 	stp	x29, x30, [sp, #16]
     bac:	910043fd 	add	x29, sp, #0x10
     bb0:	a90253f3 	stp	x19, x20, [sp, #32]
     bb4:	aa0203f3 	mov	x19, x2
     bb8:	2a0603f4 	mov	w20, w6
     bbc:	a9035bf5 	stp	x21, x22, [sp, #48]
     bc0:	2a0503f6 	mov	w22, w5
     bc4:	a90463f7 	stp	x23, x24, [sp, #64]
     bc8:	aa0003f7 	mov	x23, x0
     bcc:	a9056bf9 	stp	x25, x26, [sp, #80]
     bd0:	aa0103f9 	mov	x25, x1
     bd4:	a90673fb 	stp	x27, x28, [sp, #96]
     bd8:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
     bdc:	54001361 	b.ne	e48 <_etoa+0x2a8>  // b.any
     be0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     be4:	9e670001 	fmov	d1, x0
     be8:	1e612010 	fcmpe	d0, d1
     bec:	540012ec 	b.gt	e48 <_etoa+0x2a8>
     bf0:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
     bf4:	9e670001 	fmov	d1, x0
     bf8:	1e612010 	fcmpe	d0, d1
     bfc:	54001264 	b.mi	e48 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
     c00:	1e602018 	fcmpe	d0, #0.0
     c04:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     c08:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c0c:	fd40ac17 	ldr	d23, [x0, #344]
     c10:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c14:	fd40b001 	ldr	d1, [x0, #352]
     c18:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c1c:	fd40b416 	ldr	d22, [x0, #360]
     c20:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     c24:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c28:	fd40b806 	ldr	d6, [x0, #368]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     c2c:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c30:	fd40bc15 	ldr	d21, [x0, #376]
     c34:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     c38:	fd40c014 	ldr	d20, [x0, #384]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     c3c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
     c40:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     c44:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     c48:	1e659002 	fmov	d2, #1.400000000000000000e+01
     c4c:	1e649011 	fmov	d17, #1.000000000000000000e+01
     c50:	1e631013 	fmov	d19, #6.000000000000000000e+00
     c54:	1e601010 	fmov	d16, #2.000000000000000000e+00
     c58:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     c5c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     c60:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
     c64:	d374f821 	ubfx	x1, x1, #52, #11
     c68:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
     c6c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
     c70:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     c74:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     c78:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
     c7c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
     c80:	1e7838a5 	fsub	d5, d5, d24
     c84:	1e770884 	fmul	d4, d4, d23
     c88:	1e7608a5 	fmul	d5, d5, d22
     c8c:	1e612884 	fadd	d4, d4, d1
     c90:	1e652884 	fadd	d4, d4, d5
     c94:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     c98:	1e620301 	scvtf	d1, w24
     c9c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     ca0:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
     ca4:	1e632884 	fadd	d4, d4, d3
     ca8:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     cac:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
     cb0:	110ffc00 	add	w0, w0, #0x3ff
     cb4:	9e670004 	fmov	d4, x0
     cb8:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
     cbc:	1e740863 	fmul	d3, d3, d20
     cc0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
     cc4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
     cc8:	1e613a05 	fsub	d5, d16, d1
     ccc:	1e612821 	fadd	d1, d1, d1
     cd0:	1e621862 	fdiv	d2, d3, d2
     cd4:	1e712842 	fadd	d2, d2, d17
     cd8:	1e621862 	fdiv	d2, d3, d2
     cdc:	1e732842 	fadd	d2, d2, d19
     ce0:	1e621863 	fdiv	d3, d3, d2
     ce4:	1e652863 	fadd	d3, d3, d5
     ce8:	1e631821 	fdiv	d1, d1, d3
     cec:	1e722821 	fadd	d1, d1, d18
     cf0:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
     cf4:	1e672030 	fcmpe	d1, d7
     cf8:	54000c4c 	b.gt	e80 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     cfc:	11018f00 	add	w0, w24, #0x63
     d00:	7103181f 	cmp	w0, #0xc6
     d04:	1a9f97fc 	cset	w28, hi  // hi = pmore
     d08:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
     d0c:	36580134 	tbz	w20, #11, d30 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
     d10:	f0000040 	adrp	x0, b000 <_fini+0xcc>
     d14:	fd40c402 	ldr	d2, [x0, #392]
     d18:	1e6220f0 	fcmpe	d7, d2
     d1c:	54000d2a 	b.ge	ec0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
     d20:	34000084 	cbz	w4, d30 <_etoa+0x190>
                --prec;
     d24:	7100007f 	cmp	w3, #0x0
     d28:	1a9f07e0 	cset	w0, ne  // ne = any
     d2c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
     d30:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
     d34:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
     d38:	4b1c02c5 	sub	w5, w22, w28
     d3c:	5280003a 	mov	w26, #0x1                   	// #1
     d40:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
     d44:	7100001f 	cmp	w0, #0x0
     d48:	1a9f07e0 	cset	w0, ne  // ne = any
     d4c:	b9007fe0 	str	w0, [sp, #124]
     d50:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
     d54:	34000058 	cbz	w24, d5c <_etoa+0x1bc>
        value /= conv.F;
     d58:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     d5c:	1e602018 	fcmpe	d0, #0.0
     d60:	54000ac4 	b.mi	eb8 <_etoa+0x318>  // b.first
     d64:	1e6040e0 	fmov	d0, d7
     d68:	12147a86 	and	w6, w20, #0xfffff7ff
     d6c:	aa1b03e3 	mov	x3, x27
     d70:	aa1303e2 	mov	x2, x19
     d74:	aa1903e1 	mov	x1, x25
     d78:	aa1703e0 	mov	x0, x23
     d7c:	94000071 	bl	f40 <_ftoa>
     d80:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
     d84:	3400051a 	cbz	w26, e24 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     d88:	f27b029f 	tst	x20, #0x20
     d8c:	528008a1 	mov	w1, #0x45                  	// #69
     d90:	aa1503e2 	mov	x2, x21
     d94:	aa1b03e3 	mov	x3, x27
     d98:	52800ca0 	mov	w0, #0x65                  	// #101
     d9c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
     da0:	aa1903e1 	mov	x1, x25
     da4:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     da8:	7100031f 	cmp	w24, #0x0
     dac:	528000a0 	mov	w0, #0x5                   	// #5
     db0:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
     db4:	5100079c 	sub	w28, w28, #0x1
     db8:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
     dbc:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
     dc0:	b9000be0 	str	w0, [sp, #8]
     dc4:	93407c84 	sxtw	x4, w4
     dc8:	531f7f05 	lsr	w5, w24, #31
     dcc:	aa1b03e3 	mov	x3, x27
     dd0:	aa1903e1 	mov	x1, x25
     dd4:	aa1703e0 	mov	x0, x23
     dd8:	52800007 	mov	w7, #0x0                   	// #0
     ddc:	d2800146 	mov	x6, #0xa                   	// #10
     de0:	97fffebc 	bl	8d0 <_ntoa_long>
     de4:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
     de8:	b9407fe0 	ldr	w0, [sp, #124]
     dec:	340001c0 	cbz	w0, e24 <_etoa+0x284>
            while (idx - start_idx < width)
     df0:	cb1302b3 	sub	x19, x21, x19
     df4:	eb1302df 	cmp	x22, x19
     df8:	54000169 	b.ls	e24 <_etoa+0x284>  // b.plast
     dfc:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
     e00:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
     e04:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
     e08:	aa1b03e3 	mov	x3, x27
     e0c:	aa1903e1 	mov	x1, x25
     e10:	52800400 	mov	w0, #0x20                  	// #32
     e14:	d63f02e0 	blr	x23
     e18:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
     e1c:	eb1302df 	cmp	x22, x19
     e20:	54ffff08 	b.hi	e00 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
     e24:	aa1503e0 	mov	x0, x21
     e28:	a9417bfd 	ldp	x29, x30, [sp, #16]
     e2c:	a94253f3 	ldp	x19, x20, [sp, #32]
     e30:	a9435bf5 	ldp	x21, x22, [sp, #48]
     e34:	a94463f7 	ldp	x23, x24, [sp, #64]
     e38:	a9456bf9 	ldp	x25, x26, [sp, #80]
     e3c:	a94673fb 	ldp	x27, x28, [sp, #96]
     e40:	910203ff 	add	sp, sp, #0x80
     e44:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
     e48:	2a1403e6 	mov	w6, w20
     e4c:	2a1603e5 	mov	w5, w22
     e50:	aa1b03e3 	mov	x3, x27
     e54:	aa1303e2 	mov	x2, x19
     e58:	aa1903e1 	mov	x1, x25
     e5c:	aa1703e0 	mov	x0, x23
}
     e60:	a9417bfd 	ldp	x29, x30, [sp, #16]
     e64:	a94253f3 	ldp	x19, x20, [sp, #32]
     e68:	a9435bf5 	ldp	x21, x22, [sp, #48]
     e6c:	a94463f7 	ldp	x23, x24, [sp, #64]
     e70:	a9456bf9 	ldp	x25, x26, [sp, #80]
     e74:	a94673fb 	ldp	x27, x28, [sp, #96]
     e78:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     e7c:	14000031 	b	f40 <_ftoa>
        conv.F /= 10;
     e80:	1e711821 	fdiv	d1, d1, d17
        expval--;
     e84:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
     e88:	11018f00 	add	w0, w24, #0x63
     e8c:	7103181f 	cmp	w0, #0xc6
     e90:	1a9f97fc 	cset	w28, hi  // hi = pmore
     e94:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
     e98:	365ff4d4 	tbz	w20, #11, d30 <_etoa+0x190>
     e9c:	17ffff9d 	b	d10 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     ea0:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
     ea4:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
     ea8:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
     eac:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
     eb0:	5280001a 	mov	w26, #0x0                   	// #0
     eb4:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     eb8:	1e6140e7 	fneg	d7, d7
     ebc:	17ffffaa 	b	d64 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
     ec0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
     ec4:	f2e825c0 	movk	x0, #0x412e, lsl #48
     ec8:	9e670002 	fmov	d2, x0
     ecc:	1e6220f0 	fcmpe	d7, d2
     ed0:	54000044 	b.mi	ed8 <_etoa+0x338>  // b.first
     ed4:	17ffff93 	b	d20 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
     ed8:	6b180080 	subs	w0, w4, w24
     edc:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     ee0:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
     ee4:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
     ee8:	35000196 	cbnz	w22, f18 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
     eec:	1e602018 	fcmpe	d0, #0.0
     ef0:	54fffd84 	b.mi	ea0 <_etoa+0x300>  // b.first
     ef4:	12147a86 	and	w6, w20, #0xfffff7ff
     ef8:	1e6040e0 	fmov	d0, d7
     efc:	321600c6 	orr	w6, w6, #0x400
     f00:	aa1b03e3 	mov	x3, x27
     f04:	aa1303e2 	mov	x2, x19
     f08:	aa1903e1 	mov	x1, x25
     f0c:	aa1703e0 	mov	x0, x23
     f10:	52800005 	mov	w5, #0x0                   	// #0
     f14:	17ffffd3 	b	e60 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
     f18:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
     f1c:	2a1603e5 	mov	w5, w22
     f20:	5280001a 	mov	w26, #0x0                   	// #0
     f24:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
     f28:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
     f2c:	b9007fff 	str	wzr, [sp, #124]
     f30:	17ffff8b 	b	d5c <_etoa+0x1bc>
     f34:	d503201f 	nop
     f38:	d503201f 	nop
     f3c:	d503201f 	nop

0000000000000f40 <_ftoa>:
    if (value != value)
     f40:	1e602000 	fcmp	d0, d0
{
     f44:	2a0603e7 	mov	w7, w6
    if (value != value)
     f48:	54000e01 	b.ne	1108 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
     f4c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
     f50:	9e6700c1 	fmov	d1, x6
     f54:	1e612010 	fcmpe	d0, d1
     f58:	54001184 	b.mi	1188 <_ftoa+0x248>  // b.first
     f5c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
     f60:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
     f64:	9e670001 	fmov	d1, x0
     f68:	aa0103f0 	mov	x16, x1
     f6c:	aa0203f1 	mov	x17, x2
     f70:	aa0303f2 	mov	x18, x3
     f74:	1e612010 	fcmpe	d0, d1
     f78:	54000b2c 	b.gt	10dc <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
     f7c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     f80:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     f84:	9e670001 	fmov	d1, x0
     f88:	1e612010 	fcmpe	d0, d1
     f8c:	54000f2c 	b.gt	1170 <_ftoa+0x230>
     f90:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     f94:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
     f98:	9e670001 	fmov	d1, x0
     f9c:	1e612010 	fcmpe	d0, d1
     fa0:	54000e84 	b.mi	1170 <_ftoa+0x230>  // b.first
    if (value < 0) {
     fa4:	1e602018 	fcmpe	d0, #0.0
{
     fa8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     fac:	910003fd 	mov	x29, sp
    if (value < 0) {
     fb0:	54000ca4 	b.mi	1144 <_ftoa+0x204>  // b.first
    bool negative = false;
     fb4:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
     fb8:	36500ce7 	tbz	w7, #10, 1154 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     fbc:	7100249f 	cmp	w4, #0x9
     fc0:	910043ec 	add	x12, sp, #0x10
     fc4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
     fc8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     fcc:	54001929 	b.ls	12f0 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
     fd0:	91000508 	add	x8, x8, #0x1
        prec--;
     fd4:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
     fd8:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     fdc:	f1007d1f 	cmp	x8, #0x1f
     fe0:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
     fe4:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
     fe8:	54ffff48 	b.hi	fd0 <_ftoa+0x90>  // b.pmore
     fec:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
     ff0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
     ff4:	9e670002 	fmov	d2, x0
    int whole = (int)value;
     ff8:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
     ffc:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
    1000:	1e620141 	scvtf	d1, w10
    1004:	1e613801 	fsub	d1, d0, d1
    1008:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
    100c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
    1010:	9e6301c4 	ucvtf	d4, x14
    1014:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
    1018:	1e632030 	fcmpe	d1, d3
    101c:	5400112c 	b.gt	1240 <_ftoa+0x300>
    } else if (diff < 0.5) {
    1020:	54000084 	b.mi	1030 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
    1024:	b500154e 	cbnz	x14, 12cc <_ftoa+0x38c>
        ++frac;
    1028:	910005ce 	add	x14, x14, #0x1
    102c:	d503201f 	nop
    if (prec == 0U) {
    1030:	35000b64 	cbnz	w4, 119c <_ftoa+0x25c>
        diff = value - (double)whole;
    1034:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1038:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
    103c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1040:	1e622010 	fcmpe	d0, d2
    1044:	540011a4 	b.mi	1278 <_ftoa+0x338>  // b.first
            ++whole;
    1048:	12000140 	and	w0, w10, #0x1
    104c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
    1050:	528ccce1 	mov	w1, #0x6667                	// #26215
    1054:	72acccc1 	movk	w1, #0x6666, lsl #16
    1058:	52800142 	mov	w2, #0xa                   	// #10
    105c:	d503201f 	nop
    1060:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
    1064:	f100811f 	cmp	x8, #0x20
    1068:	54000c20 	b.eq	11ec <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
    106c:	9362fd29 	asr	x9, x9, #34
    1070:	91000508 	add	x8, x8, #0x1
    1074:	4b8a7d29 	sub	w9, w9, w10, asr #31
    1078:	8b080180 	add	x0, x12, x8
    107c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
    1080:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
    1084:	1100c169 	add	w9, w11, #0x30
    1088:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
    108c:	35fffeaa 	cbnz	w10, 1060 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    1090:	120004e0 	and	w0, w7, #0x3
    1094:	7100041f 	cmp	w0, #0x1
    1098:	54000b00 	b.eq	11f8 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
    109c:	f1007d1f 	cmp	x8, #0x1f
    10a0:	540000a8 	b.hi	10b4 <_ftoa+0x174>  // b.pmore
        if (negative) {
    10a4:	34000de3 	cbz	w3, 1260 <_ftoa+0x320>
            buf[len++] = '-';
    10a8:	528005a0 	mov	w0, #0x2d                  	// #45
    10ac:	38286980 	strb	w0, [x12, x8]
    10b0:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    10b4:	2a0503e6 	mov	w6, w5
    10b8:	aa0c03e4 	mov	x4, x12
    10bc:	aa0803e5 	mov	x5, x8
    10c0:	aa1203e3 	mov	x3, x18
    10c4:	aa1103e2 	mov	x2, x17
    10c8:	aa1003e1 	mov	x1, x16
    10cc:	aa0f03e0 	mov	x0, x15
    10d0:	97fffdbc 	bl	7c0 <_out_rev>
}
    10d4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    10d8:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    10dc:	37100207 	tbnz	w7, #2, 111c <_ftoa+0x1dc>
    10e0:	d2800060 	mov	x0, #0x3                   	// #3
    10e4:	2a0503e6 	mov	w6, w5
    10e8:	d0000044 	adrp	x4, b000 <_fini+0xcc>
    10ec:	9100a084 	add	x4, x4, #0x28
    10f0:	aa0003e5 	mov	x5, x0
    10f4:	aa1203e3 	mov	x3, x18
    10f8:	aa1103e2 	mov	x2, x17
    10fc:	aa1003e1 	mov	x1, x16
    1100:	aa0f03e0 	mov	x0, x15
    1104:	17fffdaf 	b	7c0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
    1108:	2a0503e6 	mov	w6, w5
    110c:	d0000044 	adrp	x4, b000 <_fini+0xcc>
    1110:	d2800065 	mov	x5, #0x3                   	// #3
    1114:	9100e084 	add	x4, x4, #0x38
    1118:	17fffdaa 	b	7c0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    111c:	d2800080 	mov	x0, #0x4                   	// #4
    1120:	2a0503e6 	mov	w6, w5
    1124:	d0000044 	adrp	x4, b000 <_fini+0xcc>
    1128:	9100c084 	add	x4, x4, #0x30
    112c:	aa0003e5 	mov	x5, x0
    1130:	aa1203e3 	mov	x3, x18
    1134:	aa1103e2 	mov	x2, x17
    1138:	aa1003e1 	mov	x1, x16
    113c:	aa0f03e0 	mov	x0, x15
    1140:	17fffda0 	b	7c0 <_out_rev>
        value = 0 - value;
    1144:	2f00e401 	movi	d1, #0x0
        negative = true;
    1148:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
    114c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
    1150:	3757f367 	tbnz	w7, #10, fbc <_ftoa+0x7c>
    1154:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    1158:	910043ec 	add	x12, sp, #0x10
    115c:	f2e825c0 	movk	x0, #0x412e, lsl #48
    1160:	d2800008 	mov	x8, #0x0                   	// #0
    1164:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    1168:	528000c4 	mov	w4, #0x6                   	// #6
    116c:	17ffffa3 	b	ff8 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
    1170:	2a0703e6 	mov	w6, w7
    1174:	aa1203e3 	mov	x3, x18
    1178:	aa1103e2 	mov	x2, x17
    117c:	aa1003e1 	mov	x1, x16
    1180:	aa0f03e0 	mov	x0, x15
    1184:	17fffe87 	b	ba0 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
    1188:	2a0503e6 	mov	w6, w5
    118c:	d0000044 	adrp	x4, b000 <_fini+0xcc>
    1190:	d2800085 	mov	x5, #0x4                   	// #4
    1194:	91010084 	add	x4, x4, #0x40
    1198:	17fffd8a 	b	7c0 <_out_rev>
    119c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
    11a0:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
    11a4:	0b080021 	add	w1, w1, w8
    11a8:	f29999a2 	movk	x2, #0xcccd
    11ac:	1400000d 	b	11e0 <_ftoa+0x2a0>
    11b0:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
    11b4:	f10025df 	cmp	x14, #0x9
            --count;
    11b8:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
    11bc:	91000509 	add	x9, x8, #0x1
    11c0:	8b0b096d 	add	x13, x11, x11, lsl #2
    11c4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
    11c8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
    11cc:	1100c1ab 	add	w11, w13, #0x30
    11d0:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
    11d4:	54000569 	b.ls	1280 <_ftoa+0x340>  // b.plast
            --count;
    11d8:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
    11dc:	aa0903e8 	mov	x8, x9
    11e0:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
    11e4:	6b01009f 	cmp	w4, w1
    11e8:	54fffe41 	b.ne	11b0 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    11ec:	120004e0 	and	w0, w7, #0x3
    11f0:	7100041f 	cmp	w0, #0x1
    11f4:	54fff601 	b.ne	10b4 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    11f8:	34fff525 	cbz	w5, 109c <_ftoa+0x15c>
    11fc:	35000763 	cbnz	w3, 12e8 <_ftoa+0x3a8>
    1200:	721e04ff 	tst	w7, #0xc
    1204:	54000721 	b.ne	12e8 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1208:	2a0503e1 	mov	w1, w5
    120c:	eb01011f 	cmp	x8, x1
    1210:	54fff462 	b.cs	109c <_ftoa+0x15c>  // b.hs, b.nlast
    1214:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
    1218:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    121c:	54fff4c8 	b.hi	10b4 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
    1220:	91000508 	add	x8, x8, #0x1
    1224:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1228:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
    122c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1230:	54fff360 	b.eq	109c <_ftoa+0x15c>  // b.none
    1234:	f100811f 	cmp	x8, #0x20
    1238:	54ffff41 	b.ne	1220 <_ftoa+0x2e0>  // b.any
    123c:	17ffff9e 	b	10b4 <_ftoa+0x174>
        ++frac;
    1240:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
    1244:	9e6301c1 	ucvtf	d1, x14
    1248:	1e622030 	fcmpe	d1, d2
    124c:	5400004a 	b.ge	1254 <_ftoa+0x314>  // b.tcont
    1250:	17ffff78 	b	1030 <_ftoa+0xf0>
            ++whole;
    1254:	1100054a 	add	w10, w10, #0x1
            frac = 0;
    1258:	d280000e 	mov	x14, #0x0                   	// #0
    125c:	17ffff75 	b	1030 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
    1260:	371003c7 	tbnz	w7, #2, 12d8 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
    1264:	361ff287 	tbz	w7, #3, 10b4 <_ftoa+0x174>
            buf[len++] = ' ';
    1268:	52800400 	mov	w0, #0x20                  	// #32
    126c:	38286980 	strb	w0, [x12, x8]
    1270:	91000508 	add	x8, x8, #0x1
    1274:	17ffff90 	b	10b4 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1278:	54ffee8c 	b.gt	1048 <_ftoa+0x108>
    127c:	17ffff75 	b	1050 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1280:	f100813f 	cmp	x9, #0x20
    1284:	54000420 	b.eq	1308 <_ftoa+0x3c8>  // b.none
    1288:	91000901 	add	x1, x8, #0x2
    128c:	51000884 	sub	w4, w4, #0x2
    1290:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
    1294:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1298:	34000340 	cbz	w0, 1300 <_ftoa+0x3c0>
    129c:	d503201f 	nop
            buf[len++] = '0';
    12a0:	91000529 	add	x9, x9, #0x1
    12a4:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    12a8:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
    12ac:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    12b0:	540002c0 	b.eq	1308 <_ftoa+0x3c8>  // b.none
    12b4:	eb01013f 	cmp	x9, x1
    12b8:	54ffff41 	b.ne	12a0 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
    12bc:	528005c0 	mov	w0, #0x2e                  	// #46
    12c0:	91000428 	add	x8, x1, #0x1
    12c4:	38216980 	strb	w0, [x12, x1]
    12c8:	17ffff62 	b	1050 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
    12cc:	3607eb2e 	tbz	w14, #0, 1030 <_ftoa+0xf0>
        ++frac;
    12d0:	910005ce 	add	x14, x14, #0x1
    12d4:	17ffff57 	b	1030 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
    12d8:	52800560 	mov	w0, #0x2b                  	// #43
    12dc:	38286980 	strb	w0, [x12, x8]
    12e0:	91000508 	add	x8, x8, #0x1
    12e4:	17ffff74 	b	10b4 <_ftoa+0x174>
            width--;
    12e8:	510004a5 	sub	w5, w5, #0x1
    12ec:	17ffffc7 	b	1208 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
    12f0:	d0000040 	adrp	x0, b000 <_fini+0xcc>
    12f4:	91042000 	add	x0, x0, #0x108
    12f8:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
    12fc:	17ffff3f 	b	ff8 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    1300:	aa0903e1 	mov	x1, x9
    1304:	17ffffee 	b	12bc <_ftoa+0x37c>
            buf[len++] = '0';
    1308:	aa0903e8 	mov	x8, x9
    130c:	17ffffb8 	b	11ec <_ftoa+0x2ac>

0000000000001310 <_out_char>:
    if (character) {
    1310:	72001c00 	ands	w0, w0, #0xff
    1314:	54000041 	b.ne	131c <_out_char+0xc>  // b.any
}
    1318:	d65f03c0 	ret
        _putchar(character);
    131c:	17fffd05 	b	730 <putc>

0000000000001320 <_out_fct>:
    if (character) {
    1320:	72001c00 	ands	w0, w0, #0xff
    1324:	54000080 	b.eq	1334 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    1328:	a9400422 	ldp	x2, x1, [x1]
    132c:	aa0203f0 	mov	x16, x2
    1330:	d61f0200 	br	x16
}
    1334:	d65f03c0 	ret
    1338:	d503201f 	nop
    133c:	d503201f 	nop

0000000000001340 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    1340:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    1344:	f100003f 	cmp	x1, #0x0
{
    1348:	a9017bfd 	stp	x29, x30, [sp, #16]
    134c:	910043fd 	add	x29, sp, #0x10
    1350:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    1354:	f0fffff3 	adrp	x19, 0 <main>
    1358:	911ec273 	add	x19, x19, #0x7b0
{
    135c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    1360:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    1364:	aa0103fa 	mov	x26, x1
    1368:	a90673fb 	stp	x27, x28, [sp, #96]
    136c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    1370:	d280001b 	mov	x27, #0x0                   	// #0
    1374:	b9401880 	ldr	w0, [x4, #24]
    1378:	b9007be0 	str	w0, [sp, #120]
    137c:	f9400480 	ldr	x0, [x4, #8]
    1380:	f90047e0 	str	x0, [sp, #136]
    1384:	39400065 	ldrb	w5, [x3]
    1388:	f9400880 	ldr	x0, [x4, #16]
    138c:	f9004be0 	str	x0, [sp, #144]
    1390:	b9401c80 	ldr	w0, [x4, #28]
    1394:	b900abe0 	str	w0, [sp, #168]
    1398:	f9400094 	ldr	x20, [x4]
    139c:	34003ae5 	cbz	w5, 1af8 <_vsnprintf+0x7b8>
    13a0:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    13a4:	d0000058 	adrp	x24, b000 <_fini+0xcc>
    13a8:	91012300 	add	x0, x24, #0x48
    13ac:	aa0303f9 	mov	x25, x3
    13b0:	f90043e0 	str	x0, [sp, #128]
    13b4:	d0000040 	adrp	x0, b000 <_fini+0xcc>
    13b8:	9103c000 	add	x0, x0, #0xf0
    13bc:	f9004fe0 	str	x0, [sp, #152]
    13c0:	1400000a 	b	13e8 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    13c4:	91000764 	add	x4, x27, #0x1
    13c8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    13cc:	aa1b03e2 	mov	x2, x27
    13d0:	aa1c03e3 	mov	x3, x28
    13d4:	aa1a03e1 	mov	x1, x26
    13d8:	aa0403fb 	mov	x27, x4
    13dc:	d63f0260 	blr	x19
    while (*format) {
    13e0:	39400325 	ldrb	w5, [x25]
    13e4:	34000c85 	cbz	w5, 1574 <_vsnprintf+0x234>
            format++;
    13e8:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    13ec:	710094bf 	cmp	w5, #0x25
    13f0:	54fffea1 	b.ne	13c4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    13f4:	aa1903e8 	mov	x8, x25
        flags = 0U;
    13f8:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    13fc:	38401500 	ldrb	w0, [x8], #1
    1400:	7100ac1f 	cmp	w0, #0x2b
    1404:	54000180 	b.eq	1434 <_vsnprintf+0xf4>  // b.none
    1408:	540001c8 	b.hi	1440 <_vsnprintf+0x100>  // b.pmore
    140c:	7100801f 	cmp	w0, #0x20
    1410:	54000260 	b.eq	145c <_vsnprintf+0x11c>  // b.none
    1414:	71008c1f 	cmp	w0, #0x23
    1418:	540002e1 	b.ne	1474 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    141c:	321c00c6 	orr	w6, w6, #0x10
            format++;
    1420:	aa0803f9 	mov	x25, x8
            switch (*format) {
    1424:	aa1903e8 	mov	x8, x25
    1428:	38401500 	ldrb	w0, [x8], #1
    142c:	7100ac1f 	cmp	w0, #0x2b
    1430:	54fffec1 	b.ne	1408 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    1434:	321e00c6 	orr	w6, w6, #0x4
            format++;
    1438:	aa0803f9 	mov	x25, x8
    143c:	17fffffa 	b	1424 <_vsnprintf+0xe4>
            switch (*format) {
    1440:	7100b41f 	cmp	w0, #0x2d
    1444:	54000120 	b.eq	1468 <_vsnprintf+0x128>  // b.none
    1448:	7100c01f 	cmp	w0, #0x30
    144c:	540062c1 	b.ne	20a4 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    1450:	320000c6 	orr	w6, w6, #0x1
            format++;
    1454:	aa0803f9 	mov	x25, x8
    1458:	17fffff3 	b	1424 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    145c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    1460:	aa0803f9 	mov	x25, x8
    1464:	17fffff0 	b	1424 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    1468:	321f00c6 	orr	w6, w6, #0x2
            format++;
    146c:	aa0803f9 	mov	x25, x8
    1470:	17ffffed 	b	1424 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    1474:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    1478:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    147c:	540002e0 	b.eq	14d8 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    1480:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    1484:	7101b01f 	cmp	w0, #0x6c
            format++;
    1488:	aa0803e4 	mov	x4, x8
        switch (*format) {
    148c:	54001f20 	b.eq	1870 <_vsnprintf+0x530>  // b.none
    1490:	54000588 	b.hi	1540 <_vsnprintf+0x200>  // b.pmore
    1494:	7101a01f 	cmp	w0, #0x68
    1498:	54001e20 	b.eq	185c <_vsnprintf+0x51c>  // b.none
    149c:	7101a81f 	cmp	w0, #0x6a
    14a0:	54006241 	b.ne	20e8 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    14a4:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    14a8:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    14ac:	51009402 	sub	w2, w0, #0x25
            format++;
    14b0:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    14b4:	71014c5f 	cmp	w2, #0x53
    14b8:	54000069 	b.ls	14c4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    14bc:	91000764 	add	x4, x27, #0x1
    14c0:	17ffffc3 	b	13cc <_vsnprintf+0x8c>
        switch (*format) {
    14c4:	f94043e1 	ldr	x1, [sp, #128]
    14c8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    14cc:	10000062 	adr	x2, 14d8 <_vsnprintf+0x198>
    14d0:	8b21a841 	add	x1, x2, w1, sxth #2
    14d4:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    14d8:	b9407be0 	ldr	w0, [sp, #120]
    14dc:	37f806c0 	tbnz	w0, #31, 15b4 <_vsnprintf+0x274>
    14e0:	91002e82 	add	x2, x20, #0xb
    14e4:	aa1403e0 	mov	x0, x20
    14e8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    14ec:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    14f0:	36f80078 	tbz	w24, #31, 14fc <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    14f4:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    14f8:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    14fc:	39400720 	ldrb	w0, [x25, #1]
            format++;
    1500:	aa0803f9 	mov	x25, x8
    1504:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    1508:	7100b81f 	cmp	w0, #0x2e
    150c:	54fffba1 	b.ne	1480 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    1510:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    1514:	321600c6 	orr	w6, w6, #0x400
            format++;
    1518:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    151c:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    1520:	12001c42 	and	w2, w2, #0xff
    1524:	7100245f 	cmp	w2, #0x9
    1528:	54001b29 	b.ls	188c <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    152c:	7100a81f 	cmp	w0, #0x2a
    1530:	54002a20 	b.eq	1a74 <_vsnprintf+0x734>  // b.none
            format++;
    1534:	aa0803f9 	mov	x25, x8
    1538:	91000508 	add	x8, x8, #0x1
    153c:	17ffffd1 	b	1480 <_vsnprintf+0x140>
        switch (*format) {
    1540:	7101d01f 	cmp	w0, #0x74
    1544:	54fffb00 	b.eq	14a4 <_vsnprintf+0x164>  // b.none
    1548:	7101e81f 	cmp	w0, #0x7a
    154c:	54fffac0 	b.eq	14a4 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    1550:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    1554:	aa0803f9 	mov	x25, x8
        switch (*format) {
    1558:	7100245f 	cmp	w2, #0x9
    155c:	54fffb08 	b.hi	14bc <_vsnprintf+0x17c>  // b.pmore
    1560:	f9404fe1 	ldr	x1, [sp, #152]
    1564:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    1568:	10000062 	adr	x2, 1574 <_vsnprintf+0x234>
    156c:	8b21a841 	add	x1, x2, w1, sxth #2
    1570:	d61f0020 	br	x1
    1574:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    1578:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    157c:	eb1b039f 	cmp	x28, x27
    1580:	d1000782 	sub	x2, x28, #0x1
    1584:	aa1a03e1 	mov	x1, x26
    1588:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    158c:	aa1c03e3 	mov	x3, x28
    1590:	52800000 	mov	w0, #0x0                   	// #0
    1594:	d63f0260 	blr	x19
}
    1598:	2a1403e0 	mov	w0, w20
    159c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    15a0:	a94253f3 	ldp	x19, x20, [sp, #32]
    15a4:	a9456bf9 	ldp	x25, x26, [sp, #80]
    15a8:	a94673fb 	ldp	x27, x28, [sp, #96]
    15ac:	9102c3ff 	add	sp, sp, #0xb0
    15b0:	d65f03c0 	ret
            const int w = va_arg(va, int);
    15b4:	b9407be0 	ldr	w0, [sp, #120]
    15b8:	11002002 	add	w2, w0, #0x8
    15bc:	7100005f 	cmp	w2, #0x0
    15c0:	5400228d 	b.le	1a10 <_vsnprintf+0x6d0>
    15c4:	91002e84 	add	x4, x20, #0xb
    15c8:	aa1403e0 	mov	x0, x20
    15cc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    15d0:	b9007be2 	str	w2, [sp, #120]
    15d4:	17ffffc6 	b	14ec <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    15d8:	121a7802 	and	w2, w0, #0xffffffdf
    15dc:	7101605f 	cmp	w2, #0x58
    15e0:	54001781 	b.ne	18d0 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    15e4:	7101601f 	cmp	w0, #0x58
    15e8:	54003c81 	b.ne	1d78 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    15ec:	321b00c6 	orr	w6, w6, #0x20
    15f0:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    15f4:	121c74c6 	and	w6, w6, #0xfffffff3
    15f8:	140000c0 	b	18f8 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    15fc:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    1600:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    1604:	71011c5f 	cmp	w2, #0x47
    1608:	321500c2 	orr	w2, w6, #0x800
    160c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    1610:	7101141f 	cmp	w0, #0x45
    1614:	321b00c0 	orr	w0, w6, #0x20
    1618:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    161c:	b940abe0 	ldr	w0, [sp, #168]
    1620:	37f81c20 	tbnz	w0, #31, 19a4 <_vsnprintf+0x664>
    1624:	91003e82 	add	x2, x20, #0xf
    1628:	aa1403e0 	mov	x0, x20
    162c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1630:	fd400000 	ldr	d0, [x0]
    1634:	aa1b03e2 	mov	x2, x27
    1638:	2a1803e5 	mov	w5, w24
    163c:	2a1703e4 	mov	w4, w23
    1640:	aa1c03e3 	mov	x3, x28
    1644:	aa1a03e1 	mov	x1, x26
    1648:	aa1303e0 	mov	x0, x19
    164c:	97fffd55 	bl	ba0 <_etoa>
    1650:	aa0003fb 	mov	x27, x0
            break;
    1654:	17ffff63 	b	13e0 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    1658:	7101181f 	cmp	w0, #0x46
    165c:	321b00c0 	orr	w0, w6, #0x20
    1660:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1664:	b940abe0 	ldr	w0, [sp, #168]
    1668:	37f818c0 	tbnz	w0, #31, 1980 <_vsnprintf+0x640>
    166c:	91003e82 	add	x2, x20, #0xf
    1670:	aa1403e0 	mov	x0, x20
    1674:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1678:	fd400000 	ldr	d0, [x0]
    167c:	aa1b03e2 	mov	x2, x27
    1680:	2a1803e5 	mov	w5, w24
    1684:	2a1703e4 	mov	w4, w23
    1688:	aa1c03e3 	mov	x3, x28
    168c:	aa1a03e1 	mov	x1, x26
    1690:	aa1303e0 	mov	x0, x19
    1694:	97fffe2b 	bl	f40 <_ftoa>
    1698:	aa0003fb 	mov	x27, x0
            break;
    169c:	17ffff51 	b	13e0 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    16a0:	91000760 	add	x0, x27, #0x1
    16a4:	aa1b03e2 	mov	x2, x27
    16a8:	aa1c03e3 	mov	x3, x28
    16ac:	aa0003fb 	mov	x27, x0
    16b0:	aa1a03e1 	mov	x1, x26
    16b4:	528004a0 	mov	w0, #0x25                  	// #37
    16b8:	d63f0260 	blr	x19
            break;
    16bc:	17ffff49 	b	13e0 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    16c0:	52800420 	mov	w0, #0x21                  	// #33
    16c4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    16c8:	b9407be0 	ldr	w0, [sp, #120]
    16cc:	37f817e0 	tbnz	w0, #31, 19c8 <_vsnprintf+0x688>
    16d0:	91003e82 	add	x2, x20, #0xf
    16d4:	aa1403e0 	mov	x0, x20
    16d8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    16dc:	2a1703e7 	mov	w7, w23
    16e0:	aa1b03e2 	mov	x2, x27
    16e4:	f9400004 	ldr	x4, [x0]
    16e8:	52800200 	mov	w0, #0x10                  	// #16
    16ec:	b90003e0 	str	w0, [sp]
    16f0:	b9000be6 	str	w6, [sp, #8]
    16f4:	d2800206 	mov	x6, #0x10                  	// #16
    16f8:	52800005 	mov	w5, #0x0                   	// #0
    16fc:	aa1c03e3 	mov	x3, x28
    1700:	aa1a03e1 	mov	x1, x26
    1704:	aa1303e0 	mov	x0, x19
    1708:	97fffc72 	bl	8d0 <_ntoa_long>
    170c:	aa0003fb 	mov	x27, x0
            break;
    1710:	17ffff34 	b	13e0 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    1714:	a9035bf5 	stp	x21, x22, [sp, #48]
    1718:	36082306 	tbz	w6, #1, 1b78 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    171c:	b9407be0 	ldr	w0, [sp, #120]
    1720:	37f82a20 	tbnz	w0, #31, 1c64 <_vsnprintf+0x924>
    1724:	91002e82 	add	x2, x20, #0xb
    1728:	aa1403e0 	mov	x0, x20
    172c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1730:	39400000 	ldrb	w0, [x0]
    1734:	aa1b03e2 	mov	x2, x27
    1738:	aa1c03e3 	mov	x3, x28
    173c:	aa1a03e1 	mov	x1, x26
    1740:	91000775 	add	x21, x27, #0x1
    1744:	d63f0260 	blr	x19
                while (l++ < width) {
    1748:	51000b00 	sub	w0, w24, #0x2
    174c:	91000b6a 	add	x10, x27, #0x2
    1750:	7100071f 	cmp	w24, #0x1
    1754:	8b00015b 	add	x27, x10, x0
    1758:	540007c9 	b.ls	1850 <_vsnprintf+0x510>  // b.plast
    175c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    1760:	aa1503e2 	mov	x2, x21
    1764:	aa1c03e3 	mov	x3, x28
    1768:	910006b5 	add	x21, x21, #0x1
    176c:	aa1a03e1 	mov	x1, x26
    1770:	52800400 	mov	w0, #0x20                  	// #32
    1774:	d63f0260 	blr	x19
                while (l++ < width) {
    1778:	eb1b02bf 	cmp	x21, x27
    177c:	54ffff21 	b.ne	1760 <_vsnprintf+0x420>  // b.any
    1780:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1784:	17ffff17 	b	13e0 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    1788:	b9407be0 	ldr	w0, [sp, #120]
    178c:	a9035bf5 	stp	x21, x22, [sp, #48]
    1790:	37f812e0 	tbnz	w0, #31, 19ec <_vsnprintf+0x6ac>
    1794:	91003e82 	add	x2, x20, #0xf
    1798:	aa1403e0 	mov	x0, x20
    179c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    17a0:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    17a4:	394002a8 	ldrb	w8, [x21]
    17a8:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    17ac:	350017d7 	cbnz	w23, 1aa4 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    17b0:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    17b4:	340035c8 	cbz	w8, 1e6c <_vsnprintf+0xb2c>
    17b8:	91000456 	add	x22, x2, #0x1
    17bc:	aa1503e2 	mov	x2, x21
    17c0:	8b1602b6 	add	x22, x21, x22
    17c4:	14000003 	b	17d0 <_vsnprintf+0x490>
    17c8:	eb0202df 	cmp	x22, x2
    17cc:	54001900 	b.eq	1aec <_vsnprintf+0x7ac>  // b.none
    17d0:	38401c44 	ldrb	w4, [x2, #1]!
    17d4:	35ffffa4 	cbnz	w4, 17c8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    17d8:	4b150041 	sub	w1, w2, w21
    17dc:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    17e0:	121600c1 	and	w1, w6, #0x400
    17e4:	b9007fe1 	str	w1, [sp, #124]
    17e8:	365000a6 	tbz	w6, #10, 17fc <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    17ec:	b940a3e1 	ldr	w1, [sp, #160]
    17f0:	6b17003f 	cmp	w1, w23
    17f4:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    17f8:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    17fc:	121f00c1 	and	w1, w6, #0x2
    1800:	b900afe1 	str	w1, [sp, #172]
    1804:	36081826 	tbz	w6, #1, 1b08 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1808:	34001108 	cbz	w8, 1a28 <_vsnprintf+0x6e8>
    180c:	aa1b03e2 	mov	x2, x27
    1810:	cb1b02b6 	sub	x22, x21, x27
    1814:	14000002 	b	181c <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    1818:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    181c:	b9407fe1 	ldr	w1, [sp, #124]
    1820:	34000081 	cbz	w1, 1830 <_vsnprintf+0x4f0>
    1824:	510006e4 	sub	w4, w23, #0x1
    1828:	340016d7 	cbz	w23, 1b00 <_vsnprintf+0x7c0>
    182c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    1830:	91000455 	add	x21, x2, #0x1
    1834:	aa1c03e3 	mov	x3, x28
    1838:	aa1a03e1 	mov	x1, x26
    183c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1840:	38756ac0 	ldrb	w0, [x22, x21]
    1844:	35fffea0 	cbnz	w0, 1818 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    1848:	b940afe0 	ldr	w0, [sp, #172]
    184c:	35000ec0 	cbnz	w0, 1a24 <_vsnprintf+0x6e4>
                while (l++ < width) {
    1850:	aa1503fb 	mov	x27, x21
    1854:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1858:	17fffee2 	b	13e0 <_vsnprintf+0xa0>
            if (*format == 'h') {
    185c:	39400720 	ldrb	w0, [x25, #1]
    1860:	7101a01f 	cmp	w0, #0x68
    1864:	540013c0 	b.eq	1adc <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    1868:	321900c6 	orr	w6, w6, #0x80
    186c:	17ffff10 	b	14ac <_vsnprintf+0x16c>
            if (*format == 'l') {
    1870:	39400720 	ldrb	w0, [x25, #1]
    1874:	7101b01f 	cmp	w0, #0x6c
    1878:	54ffe181 	b.ne	14a8 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    187c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    1880:	321804c6 	orr	w6, w6, #0x300
                format++;
    1884:	91000b24 	add	x4, x25, #0x2
    1888:	17ffff09 	b	14ac <_vsnprintf+0x16c>
    unsigned int i = 0U;
    188c:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    1890:	52800148 	mov	w8, #0xa                   	// #10
    1894:	d503201f 	nop
    1898:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    189c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    18a0:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    18a4:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    18a8:	12001c42 	and	w2, w2, #0xff
    18ac:	7100245f 	cmp	w2, #0x9
    18b0:	54ffff49 	b.ls	1898 <_vsnprintf+0x558>  // b.plast
    18b4:	aa0403f9 	mov	x25, x4
    18b8:	91000488 	add	x8, x4, #0x1
    18bc:	17fffef2 	b	1484 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    18c0:	121a7802 	and	w2, w0, #0xffffffdf
    18c4:	7101605f 	cmp	w2, #0x58
    18c8:	54002580 	b.eq	1d78 <_vsnprintf+0xa38>  // b.none
    18cc:	d503201f 	nop
            } else if (*format == 'o') {
    18d0:	7101bc1f 	cmp	w0, #0x6f
    18d4:	540021a0 	b.eq	1d08 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    18d8:	7101881f 	cmp	w0, #0x62
    18dc:	54002820 	b.eq	1de0 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    18e0:	121b78c6 	and	w6, w6, #0xffffffef
    18e4:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    18e8:	7101a41f 	cmp	w0, #0x69
    18ec:	52800c82 	mov	w2, #0x64                  	// #100
    18f0:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    18f4:	54ffe801 	b.ne	15f4 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    18f8:	f27600df 	tst	x6, #0x400
    18fc:	121f78c2 	and	w2, w6, #0xfffffffe
    1900:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    1904:	7101a41f 	cmp	w0, #0x69
    1908:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    190c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    1910:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    1914:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    1918:	54000ce1 	b.ne	1ab4 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    191c:	35002122 	cbnz	w2, 1d40 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    1920:	37402306 	tbnz	w6, #8, 1d80 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1924:	37301b26 	tbnz	w6, #6, 1c88 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    1928:	36382926 	tbz	w6, #7, 1e4c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    192c:	37f83300 	tbnz	w0, #31, 1f8c <_vsnprintf+0xc4c>
    1930:	91002e82 	add	x2, x20, #0xb
    1934:	aa1403e0 	mov	x0, x20
    1938:	927df054 	and	x20, x2, #0xfffffffffffffff8
    193c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1940:	710000bf 	cmp	w5, #0x0
    1944:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1948:	12003c84 	and	w4, w4, #0xffff
    194c:	2a1703e7 	mov	w7, w23
    1950:	531f7ca5 	lsr	w5, w5, #31
    1954:	93407c84 	sxtw	x4, w4
    1958:	aa1b03e2 	mov	x2, x27
    195c:	b9000be6 	str	w6, [sp, #8]
    1960:	aa0803e6 	mov	x6, x8
    1964:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1968:	aa1c03e3 	mov	x3, x28
    196c:	aa1a03e1 	mov	x1, x26
    1970:	aa1303e0 	mov	x0, x19
    1974:	97fffbd7 	bl	8d0 <_ntoa_long>
    1978:	aa0003fb 	mov	x27, x0
            break;
    197c:	17fffe99 	b	13e0 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1980:	b940abe0 	ldr	w0, [sp, #168]
    1984:	11004002 	add	w2, w0, #0x10
    1988:	7100005f 	cmp	w2, #0x0
    198c:	54001b4d 	b.le	1cf4 <_vsnprintf+0x9b4>
    1990:	91003e84 	add	x4, x20, #0xf
    1994:	aa1403e0 	mov	x0, x20
    1998:	927df094 	and	x20, x4, #0xfffffffffffffff8
    199c:	b900abe2 	str	w2, [sp, #168]
    19a0:	17ffff36 	b	1678 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    19a4:	b940abe0 	ldr	w0, [sp, #168]
    19a8:	11004002 	add	w2, w0, #0x10
    19ac:	7100005f 	cmp	w2, #0x0
    19b0:	5400198d 	b.le	1ce0 <_vsnprintf+0x9a0>
    19b4:	91003e84 	add	x4, x20, #0xf
    19b8:	aa1403e0 	mov	x0, x20
    19bc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19c0:	b900abe2 	str	w2, [sp, #168]
    19c4:	17ffff1b 	b	1630 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    19c8:	b9407be0 	ldr	w0, [sp, #120]
    19cc:	11002002 	add	w2, w0, #0x8
    19d0:	7100005f 	cmp	w2, #0x0
    19d4:	540017cd 	b.le	1ccc <_vsnprintf+0x98c>
    19d8:	91003e84 	add	x4, x20, #0xf
    19dc:	aa1403e0 	mov	x0, x20
    19e0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    19e4:	b9007be2 	str	w2, [sp, #120]
    19e8:	17ffff3d 	b	16dc <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    19ec:	b9407be0 	ldr	w0, [sp, #120]
    19f0:	11002002 	add	w2, w0, #0x8
    19f4:	7100005f 	cmp	w2, #0x0
    19f8:	5400160d 	b.le	1cb8 <_vsnprintf+0x978>
    19fc:	91003e84 	add	x4, x20, #0xf
    1a00:	aa1403e0 	mov	x0, x20
    1a04:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1a08:	b9007be2 	str	w2, [sp, #120]
    1a0c:	17ffff65 	b	17a0 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    1a10:	f94047e1 	ldr	x1, [sp, #136]
    1a14:	b9407be0 	ldr	w0, [sp, #120]
    1a18:	b9007be2 	str	w2, [sp, #120]
    1a1c:	8b20c020 	add	x0, x1, w0, sxtw
    1a20:	17fffeb3 	b	14ec <_vsnprintf+0x1ac>
    1a24:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    1a28:	b940a3e0 	ldr	w0, [sp, #160]
    1a2c:	6b18001f 	cmp	w0, w24
    1a30:	540009e2 	b.cs	1b6c <_vsnprintf+0x82c>  // b.hs, b.nlast
    1a34:	51000704 	sub	w4, w24, #0x1
    1a38:	91000776 	add	x22, x27, #0x1
    1a3c:	4b000084 	sub	w4, w4, w0
    1a40:	8b160095 	add	x21, x4, x22
    1a44:	14000002 	b	1a4c <_vsnprintf+0x70c>
    1a48:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1a4c:	aa1b03e2 	mov	x2, x27
    1a50:	aa1c03e3 	mov	x3, x28
    1a54:	aa1a03e1 	mov	x1, x26
    1a58:	52800400 	mov	w0, #0x20                  	// #32
    1a5c:	d63f0260 	blr	x19
    1a60:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1a64:	eb1502df 	cmp	x22, x21
    1a68:	54ffff01 	b.ne	1a48 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    1a6c:	aa1503fb 	mov	x27, x21
    1a70:	17ffff79 	b	1854 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    1a74:	b9407be0 	ldr	w0, [sp, #120]
    1a78:	37f80b80 	tbnz	w0, #31, 1be8 <_vsnprintf+0x8a8>
    1a7c:	91002e82 	add	x2, x20, #0xb
    1a80:	aa1403e0 	mov	x0, x20
    1a84:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1a88:	b9400007 	ldr	w7, [x0]
                format++;
    1a8c:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    1a90:	39400320 	ldrb	w0, [x25]
    1a94:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    1a98:	710000ff 	cmp	w7, #0x0
    1a9c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    1aa0:	17fffe79 	b	1484 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    1aa4:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    1aa8:	34001e28 	cbz	w8, 1e6c <_vsnprintf+0xb2c>
    1aac:	d1000442 	sub	x2, x2, #0x1
    1ab0:	17ffff42 	b	17b8 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    1ab4:	35001302 	cbnz	w2, 1d14 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    1ab8:	37401806 	tbnz	w6, #8, 1db8 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1abc:	37300ba6 	tbnz	w6, #6, 1c30 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    1ac0:	36381ba6 	tbz	w6, #7, 1e34 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1ac4:	37f82500 	tbnz	w0, #31, 1f64 <_vsnprintf+0xc24>
    1ac8:	aa1403e0 	mov	x0, x20
    1acc:	91002e82 	add	x2, x20, #0xb
    1ad0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1ad4:	79400004 	ldrh	w4, [x0]
    1ad8:	1400005b 	b	1c44 <_vsnprintf+0x904>
        switch (*format) {
    1adc:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    1ae0:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    1ae4:	91000b24 	add	x4, x25, #0x2
    1ae8:	17fffe71 	b	14ac <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    1aec:	4b1502c1 	sub	w1, w22, w21
    1af0:	b900a3e1 	str	w1, [sp, #160]
    1af4:	17ffff3b 	b	17e0 <_vsnprintf+0x4a0>
    while (*format) {
    1af8:	52800014 	mov	w20, #0x0                   	// #0
    1afc:	17fffea0 	b	157c <_vsnprintf+0x23c>
    1b00:	aa0203f5 	mov	x21, x2
    1b04:	17ffff51 	b	1848 <_vsnprintf+0x508>
                while (l++ < width) {
    1b08:	b940a3e1 	ldr	w1, [sp, #160]
    1b0c:	6b18003f 	cmp	w1, w24
    1b10:	11000420 	add	w0, w1, #0x1
    1b14:	54002242 	b.cs	1f5c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    1b18:	51000700 	sub	w0, w24, #0x1
    1b1c:	91000776 	add	x22, x27, #0x1
    1b20:	4b010000 	sub	w0, w0, w1
    1b24:	8b160000 	add	x0, x0, x22
    1b28:	f90053e0 	str	x0, [sp, #160]
    1b2c:	14000002 	b	1b34 <_vsnprintf+0x7f4>
    1b30:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1b34:	aa1b03e2 	mov	x2, x27
    1b38:	52800400 	mov	w0, #0x20                  	// #32
    1b3c:	aa1c03e3 	mov	x3, x28
    1b40:	aa1a03e1 	mov	x1, x26
    1b44:	d63f0260 	blr	x19
    1b48:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1b4c:	f94053e0 	ldr	x0, [sp, #160]
    1b50:	eb16001f 	cmp	x0, x22
    1b54:	54fffee1 	b.ne	1b30 <_vsnprintf+0x7f0>  // b.any
    1b58:	394002a8 	ldrb	w8, [x21]
    1b5c:	11000700 	add	w0, w24, #0x1
    1b60:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    1b64:	2a0803e0 	mov	w0, w8
    1b68:	35ffe528 	cbnz	w8, 180c <_vsnprintf+0x4cc>
                while (l++ < width) {
    1b6c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    1b70:	aa1503fb 	mov	x27, x21
    1b74:	17ffff38 	b	1854 <_vsnprintf+0x514>
                while (l++ < width) {
    1b78:	7100071f 	cmp	w24, #0x1
    1b7c:	54001ec9 	b.ls	1f54 <_vsnprintf+0xc14>  // b.plast
    1b80:	51000b05 	sub	w5, w24, #0x2
    1b84:	91000776 	add	x22, x27, #0x1
    1b88:	8b0502d5 	add	x21, x22, x5
    1b8c:	14000002 	b	1b94 <_vsnprintf+0x854>
    1b90:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    1b94:	aa1b03e2 	mov	x2, x27
    1b98:	aa1c03e3 	mov	x3, x28
    1b9c:	aa1a03e1 	mov	x1, x26
    1ba0:	52800400 	mov	w0, #0x20                  	// #32
    1ba4:	d63f0260 	blr	x19
    1ba8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    1bac:	eb1502df 	cmp	x22, x21
    1bb0:	54ffff01 	b.ne	1b90 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1bb4:	b9407be0 	ldr	w0, [sp, #120]
    1bb8:	37f802a0 	tbnz	w0, #31, 1c0c <_vsnprintf+0x8cc>
    1bbc:	91002e82 	add	x2, x20, #0xb
    1bc0:	aa1403e0 	mov	x0, x20
    1bc4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1bc8:	39400000 	ldrb	w0, [x0]
    1bcc:	aa1503e2 	mov	x2, x21
    1bd0:	910006bb 	add	x27, x21, #0x1
    1bd4:	aa1c03e3 	mov	x3, x28
    1bd8:	aa1a03e1 	mov	x1, x26
    1bdc:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    1be0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1be4:	17fffdff 	b	13e0 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    1be8:	b9407be0 	ldr	w0, [sp, #120]
    1bec:	11002002 	add	w2, w0, #0x8
    1bf0:	7100005f 	cmp	w2, #0x0
    1bf4:	5400058d 	b.le	1ca4 <_vsnprintf+0x964>
    1bf8:	91002e84 	add	x4, x20, #0xb
    1bfc:	aa1403e0 	mov	x0, x20
    1c00:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c04:	b9007be2 	str	w2, [sp, #120]
    1c08:	17ffffa0 	b	1a88 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1c0c:	b9407be0 	ldr	w0, [sp, #120]
    1c10:	11002002 	add	w2, w0, #0x8
    1c14:	7100005f 	cmp	w2, #0x0
    1c18:	540016ed 	b.le	1ef4 <_vsnprintf+0xbb4>
    1c1c:	91002e84 	add	x4, x20, #0xb
    1c20:	aa1403e0 	mov	x0, x20
    1c24:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c28:	b9007be2 	str	w2, [sp, #120]
    1c2c:	17ffffe7 	b	1bc8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1c30:	37f81220 	tbnz	w0, #31, 1e74 <_vsnprintf+0xb34>
    1c34:	91002e82 	add	x2, x20, #0xb
    1c38:	aa1403e0 	mov	x0, x20
    1c3c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1c40:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    1c44:	2a1703e7 	mov	w7, w23
    1c48:	2a0403e4 	mov	w4, w4
    1c4c:	b9000be6 	str	w6, [sp, #8]
    1c50:	aa0803e6 	mov	x6, x8
    1c54:	b90003f8 	str	w24, [sp]
    1c58:	aa1b03e2 	mov	x2, x27
    1c5c:	52800005 	mov	w5, #0x0                   	// #0
    1c60:	17ffff42 	b	1968 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1c64:	b9407be0 	ldr	w0, [sp, #120]
    1c68:	11002002 	add	w2, w0, #0x8
    1c6c:	7100005f 	cmp	w2, #0x0
    1c70:	5400138d 	b.le	1ee0 <_vsnprintf+0xba0>
    1c74:	91002e84 	add	x4, x20, #0xb
    1c78:	aa1403e0 	mov	x0, x20
    1c7c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1c80:	b9007be2 	str	w2, [sp, #120]
    1c84:	17fffeab 	b	1730 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1c88:	37f81080 	tbnz	w0, #31, 1e98 <_vsnprintf+0xb58>
    1c8c:	91002e82 	add	x2, x20, #0xb
    1c90:	aa1403e0 	mov	x0, x20
    1c94:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1c98:	39400005 	ldrb	w5, [x0]
    1c9c:	2a0503e4 	mov	w4, w5
    1ca0:	17ffff2b 	b	194c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    1ca4:	f94047e1 	ldr	x1, [sp, #136]
    1ca8:	b9407be0 	ldr	w0, [sp, #120]
    1cac:	b9007be2 	str	w2, [sp, #120]
    1cb0:	8b20c020 	add	x0, x1, w0, sxtw
    1cb4:	17ffff75 	b	1a88 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    1cb8:	f94047e1 	ldr	x1, [sp, #136]
    1cbc:	b9407be0 	ldr	w0, [sp, #120]
    1cc0:	b9007be2 	str	w2, [sp, #120]
    1cc4:	8b20c020 	add	x0, x1, w0, sxtw
    1cc8:	17fffeb6 	b	17a0 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    1ccc:	f94047e1 	ldr	x1, [sp, #136]
    1cd0:	b9407be0 	ldr	w0, [sp, #120]
    1cd4:	b9007be2 	str	w2, [sp, #120]
    1cd8:	8b20c020 	add	x0, x1, w0, sxtw
    1cdc:	17fffe80 	b	16dc <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1ce0:	f9404be1 	ldr	x1, [sp, #144]
    1ce4:	b940abe0 	ldr	w0, [sp, #168]
    1ce8:	b900abe2 	str	w2, [sp, #168]
    1cec:	8b20c020 	add	x0, x1, w0, sxtw
    1cf0:	17fffe50 	b	1630 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    1cf4:	f9404be1 	ldr	x1, [sp, #144]
    1cf8:	b940abe0 	ldr	w0, [sp, #168]
    1cfc:	b900abe2 	str	w2, [sp, #168]
    1d00:	8b20c020 	add	x0, x1, w0, sxtw
    1d04:	17fffe5d 	b	1678 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1d08:	121c74c6 	and	w6, w6, #0xfffffff3
    1d0c:	d2800108 	mov	x8, #0x8                   	// #8
    1d10:	17fffefa 	b	18f8 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1d14:	37f807e0 	tbnz	w0, #31, 1e10 <_vsnprintf+0xad0>
    1d18:	91003e82 	add	x2, x20, #0xf
    1d1c:	aa1403e0 	mov	x0, x20
    1d20:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1d24:	2a1703e7 	mov	w7, w23
    1d28:	aa1b03e2 	mov	x2, x27
    1d2c:	f9400004 	ldr	x4, [x0]
    1d30:	b90003f8 	str	w24, [sp]
    1d34:	b9000be6 	str	w6, [sp, #8]
    1d38:	aa0803e6 	mov	x6, x8
    1d3c:	17fffe6f 	b	16f8 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    1d40:	37f80560 	tbnz	w0, #31, 1dec <_vsnprintf+0xaac>
    1d44:	91003e82 	add	x2, x20, #0xf
    1d48:	aa1403e0 	mov	x0, x20
    1d4c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1d50:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1d54:	2a1703e7 	mov	w7, w23
    1d58:	aa1b03e2 	mov	x2, x27
    1d5c:	b90003f8 	str	w24, [sp]
    1d60:	f10000bf 	cmp	x5, #0x0
    1d64:	b9000be6 	str	w6, [sp, #8]
    1d68:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1d6c:	aa0803e6 	mov	x6, x8
    1d70:	d37ffca5 	lsr	x5, x5, #63
    1d74:	17fffe62 	b	16fc <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    1d78:	d2800208 	mov	x8, #0x10                  	// #16
    1d7c:	17fffedb 	b	18e8 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    1d80:	37f80c40 	tbnz	w0, #31, 1f08 <_vsnprintf+0xbc8>
    1d84:	91003e82 	add	x2, x20, #0xf
    1d88:	aa1403e0 	mov	x0, x20
    1d8c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1d90:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1d94:	2a1703e7 	mov	w7, w23
    1d98:	aa1b03e2 	mov	x2, x27
    1d9c:	b90003f8 	str	w24, [sp]
    1da0:	f10000bf 	cmp	x5, #0x0
    1da4:	b9000be6 	str	w6, [sp, #8]
    1da8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    1dac:	aa0803e6 	mov	x6, x8
    1db0:	d37ffca5 	lsr	x5, x5, #63
    1db4:	17fffeed 	b	1968 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1db8:	37f80820 	tbnz	w0, #31, 1ebc <_vsnprintf+0xb7c>
    1dbc:	91003e82 	add	x2, x20, #0xf
    1dc0:	aa1403e0 	mov	x0, x20
    1dc4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1dc8:	2a1703e7 	mov	w7, w23
    1dcc:	f9400004 	ldr	x4, [x0]
    1dd0:	b90003f8 	str	w24, [sp]
    1dd4:	b9000be6 	str	w6, [sp, #8]
    1dd8:	aa0803e6 	mov	x6, x8
    1ddc:	17ffff9f 	b	1c58 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    1de0:	121c74c6 	and	w6, w6, #0xfffffff3
    1de4:	d2800048 	mov	x8, #0x2                   	// #2
    1de8:	17fffec4 	b	18f8 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    1dec:	b9407be0 	ldr	w0, [sp, #120]
    1df0:	11002002 	add	w2, w0, #0x8
    1df4:	7100005f 	cmp	w2, #0x0
    1df8:	54000a4d 	b.le	1f40 <_vsnprintf+0xc00>
    1dfc:	91003e84 	add	x4, x20, #0xf
    1e00:	aa1403e0 	mov	x0, x20
    1e04:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1e08:	b9007be2 	str	w2, [sp, #120]
    1e0c:	17ffffd1 	b	1d50 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1e10:	b9407be0 	ldr	w0, [sp, #120]
    1e14:	11002002 	add	w2, w0, #0x8
    1e18:	7100005f 	cmp	w2, #0x0
    1e1c:	5400088d 	b.le	1f2c <_vsnprintf+0xbec>
    1e20:	91003e84 	add	x4, x20, #0xf
    1e24:	aa1403e0 	mov	x0, x20
    1e28:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1e2c:	b9007be2 	str	w2, [sp, #120]
    1e30:	17ffffbd 	b	1d24 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    1e34:	37f80d00 	tbnz	w0, #31, 1fd4 <_vsnprintf+0xc94>
    1e38:	aa1403e0 	mov	x0, x20
    1e3c:	91002e82 	add	x2, x20, #0xb
    1e40:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1e44:	b9400004 	ldr	w4, [x0]
    1e48:	17ffff7f 	b	1c44 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    1e4c:	37f80b20 	tbnz	w0, #31, 1fb0 <_vsnprintf+0xc70>
    1e50:	91002e82 	add	x2, x20, #0xb
    1e54:	aa1403e0 	mov	x0, x20
    1e58:	927df054 	and	x20, x2, #0xfffffffffffffff8
    1e5c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    1e60:	710000bf 	cmp	w5, #0x0
    1e64:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    1e68:	17fffeb9 	b	194c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    1e6c:	b900a3ff 	str	wzr, [sp, #160]
    1e70:	17fffe5c 	b	17e0 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1e74:	b9407be0 	ldr	w0, [sp, #120]
    1e78:	11002002 	add	w2, w0, #0x8
    1e7c:	7100005f 	cmp	w2, #0x0
    1e80:	54000bed 	b.le	1ffc <_vsnprintf+0xcbc>
    1e84:	91002e84 	add	x4, x20, #0xb
    1e88:	aa1403e0 	mov	x0, x20
    1e8c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1e90:	b9007be2 	str	w2, [sp, #120]
    1e94:	17ffff6b 	b	1c40 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1e98:	b9407be0 	ldr	w0, [sp, #120]
    1e9c:	11002002 	add	w2, w0, #0x8
    1ea0:	7100005f 	cmp	w2, #0x0
    1ea4:	54000b6d 	b.le	2010 <_vsnprintf+0xcd0>
    1ea8:	91002e84 	add	x4, x20, #0xb
    1eac:	aa1403e0 	mov	x0, x20
    1eb0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1eb4:	b9007be2 	str	w2, [sp, #120]
    1eb8:	17ffff78 	b	1c98 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    1ebc:	b9407be0 	ldr	w0, [sp, #120]
    1ec0:	11002002 	add	w2, w0, #0x8
    1ec4:	7100005f 	cmp	w2, #0x0
    1ec8:	54000aed 	b.le	2024 <_vsnprintf+0xce4>
    1ecc:	91003e84 	add	x4, x20, #0xf
    1ed0:	aa1403e0 	mov	x0, x20
    1ed4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ed8:	b9007be2 	str	w2, [sp, #120]
    1edc:	17ffffbb 	b	1dc8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    1ee0:	f94047e1 	ldr	x1, [sp, #136]
    1ee4:	b9407be0 	ldr	w0, [sp, #120]
    1ee8:	b9007be2 	str	w2, [sp, #120]
    1eec:	8b20c020 	add	x0, x1, w0, sxtw
    1ef0:	17fffe10 	b	1730 <_vsnprintf+0x3f0>
    1ef4:	f94047e1 	ldr	x1, [sp, #136]
    1ef8:	b9407be0 	ldr	w0, [sp, #120]
    1efc:	b9007be2 	str	w2, [sp, #120]
    1f00:	8b20c020 	add	x0, x1, w0, sxtw
    1f04:	17ffff31 	b	1bc8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    1f08:	b9407be0 	ldr	w0, [sp, #120]
    1f0c:	11002002 	add	w2, w0, #0x8
    1f10:	7100005f 	cmp	w2, #0x0
    1f14:	5400092d 	b.le	2038 <_vsnprintf+0xcf8>
    1f18:	91003e84 	add	x4, x20, #0xf
    1f1c:	aa1403e0 	mov	x0, x20
    1f20:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1f24:	b9007be2 	str	w2, [sp, #120]
    1f28:	17ffff9a 	b	1d90 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    1f2c:	f94047e1 	ldr	x1, [sp, #136]
    1f30:	b9407be0 	ldr	w0, [sp, #120]
    1f34:	b9007be2 	str	w2, [sp, #120]
    1f38:	8b20c020 	add	x0, x1, w0, sxtw
    1f3c:	17ffff7a 	b	1d24 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    1f40:	f94047e1 	ldr	x1, [sp, #136]
    1f44:	b9407be0 	ldr	w0, [sp, #120]
    1f48:	b9007be2 	str	w2, [sp, #120]
    1f4c:	8b20c020 	add	x0, x1, w0, sxtw
    1f50:	17ffff80 	b	1d50 <_vsnprintf+0xa10>
                while (l++ < width) {
    1f54:	aa1b03f5 	mov	x21, x27
    1f58:	17ffff17 	b	1bb4 <_vsnprintf+0x874>
                while (l++ < width) {
    1f5c:	b900a3e0 	str	w0, [sp, #160]
    1f60:	17ffff01 	b	1b64 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1f64:	b9407be0 	ldr	w0, [sp, #120]
    1f68:	11002002 	add	w2, w0, #0x8
    1f6c:	7100005f 	cmp	w2, #0x0
    1f70:	5400078d 	b.le	2060 <_vsnprintf+0xd20>
    1f74:	aa1403e0 	mov	x0, x20
    1f78:	91002e84 	add	x4, x20, #0xb
    1f7c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1f80:	b9007be2 	str	w2, [sp, #120]
    1f84:	79400004 	ldrh	w4, [x0]
    1f88:	17ffff2f 	b	1c44 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    1f8c:	b9407be0 	ldr	w0, [sp, #120]
    1f90:	11002002 	add	w2, w0, #0x8
    1f94:	7100005f 	cmp	w2, #0x0
    1f98:	540005ad 	b.le	204c <_vsnprintf+0xd0c>
    1f9c:	91002e84 	add	x4, x20, #0xb
    1fa0:	aa1403e0 	mov	x0, x20
    1fa4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1fa8:	b9007be2 	str	w2, [sp, #120]
    1fac:	17fffe64 	b	193c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    1fb0:	b9407be0 	ldr	w0, [sp, #120]
    1fb4:	11002002 	add	w2, w0, #0x8
    1fb8:	7100005f 	cmp	w2, #0x0
    1fbc:	540005ed 	b.le	2078 <_vsnprintf+0xd38>
    1fc0:	91002e84 	add	x4, x20, #0xb
    1fc4:	aa1403e0 	mov	x0, x20
    1fc8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1fcc:	b9007be2 	str	w2, [sp, #120]
    1fd0:	17ffffa3 	b	1e5c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    1fd4:	b9407be0 	ldr	w0, [sp, #120]
    1fd8:	11002002 	add	w2, w0, #0x8
    1fdc:	7100005f 	cmp	w2, #0x0
    1fe0:	5400056d 	b.le	208c <_vsnprintf+0xd4c>
    1fe4:	aa1403e0 	mov	x0, x20
    1fe8:	91002e84 	add	x4, x20, #0xb
    1fec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    1ff0:	b9007be2 	str	w2, [sp, #120]
    1ff4:	b9400004 	ldr	w4, [x0]
    1ff8:	17ffff13 	b	1c44 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    1ffc:	f94047e1 	ldr	x1, [sp, #136]
    2000:	b9407be0 	ldr	w0, [sp, #120]
    2004:	b9007be2 	str	w2, [sp, #120]
    2008:	8b20c020 	add	x0, x1, w0, sxtw
    200c:	17ffff0d 	b	1c40 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2010:	f94047e1 	ldr	x1, [sp, #136]
    2014:	b9407be0 	ldr	w0, [sp, #120]
    2018:	b9007be2 	str	w2, [sp, #120]
    201c:	8b20c020 	add	x0, x1, w0, sxtw
    2020:	17ffff1e 	b	1c98 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    2024:	f94047e1 	ldr	x1, [sp, #136]
    2028:	b9407be0 	ldr	w0, [sp, #120]
    202c:	b9007be2 	str	w2, [sp, #120]
    2030:	8b20c020 	add	x0, x1, w0, sxtw
    2034:	17ffff65 	b	1dc8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    2038:	f94047e1 	ldr	x1, [sp, #136]
    203c:	b9407be0 	ldr	w0, [sp, #120]
    2040:	b9007be2 	str	w2, [sp, #120]
    2044:	8b20c020 	add	x0, x1, w0, sxtw
    2048:	17ffff52 	b	1d90 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    204c:	f94047e1 	ldr	x1, [sp, #136]
    2050:	b9407be0 	ldr	w0, [sp, #120]
    2054:	b9007be2 	str	w2, [sp, #120]
    2058:	8b20c020 	add	x0, x1, w0, sxtw
    205c:	17fffe38 	b	193c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2060:	f94047e1 	ldr	x1, [sp, #136]
    2064:	b9407be0 	ldr	w0, [sp, #120]
    2068:	b9007be2 	str	w2, [sp, #120]
    206c:	8b20c020 	add	x0, x1, w0, sxtw
    2070:	79400004 	ldrh	w4, [x0]
    2074:	17fffef4 	b	1c44 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    2078:	f94047e1 	ldr	x1, [sp, #136]
    207c:	b9407be0 	ldr	w0, [sp, #120]
    2080:	b9007be2 	str	w2, [sp, #120]
    2084:	8b20c020 	add	x0, x1, w0, sxtw
    2088:	17ffff75 	b	1e5c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    208c:	f94047e1 	ldr	x1, [sp, #136]
    2090:	b9407be0 	ldr	w0, [sp, #120]
    2094:	b9007be2 	str	w2, [sp, #120]
    2098:	8b20c020 	add	x0, x1, w0, sxtw
    209c:	b9400004 	ldr	w4, [x0]
    20a0:	17fffee9 	b	1c44 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    20a4:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    20a8:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    20ac:	12001c42 	and	w2, w2, #0xff
    20b0:	7100245f 	cmp	w2, #0x9
    20b4:	54ffa2a8 	b.hi	1508 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    20b8:	52800142 	mov	w2, #0xa                   	// #10
    20bc:	d503201f 	nop
    20c0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    20c4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    20c8:	aa0803f9 	mov	x25, x8
    20cc:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    20d0:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    20d4:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    20d8:	12001c84 	and	w4, w4, #0xff
    20dc:	7100249f 	cmp	w4, #0x9
    20e0:	54ffff09 	b.ls	20c0 <_vsnprintf+0xd80>  // b.plast
    20e4:	17fffd09 	b	1508 <_vsnprintf+0x1c8>
        switch (*format) {
    20e8:	aa1903e4 	mov	x4, x25
    20ec:	17fffcf0 	b	14ac <_vsnprintf+0x16c>

00000000000020f0 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    20f0:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    20f4:	910003fd 	mov	x29, sp
    20f8:	f9000bf3 	str	x19, [sp, #16]
    20fc:	aa0003f3 	mov	x19, x0
    2100:	3d801fe0 	str	q0, [sp, #112]
    2104:	3d8023e1 	str	q1, [sp, #128]
    2108:	3d8027e2 	str	q2, [sp, #144]
    210c:	3d802be3 	str	q3, [sp, #160]
    2110:	3d802fe4 	str	q4, [sp, #176]
    2114:	3d8033e5 	str	q5, [sp, #192]
    2118:	3d8037e6 	str	q6, [sp, #208]
    211c:	3d803be7 	str	q7, [sp, #224]
    2120:	a90f8be1 	stp	x1, x2, [sp, #248]
    2124:	a91093e3 	stp	x3, x4, [sp, #264]
    2128:	a9119be5 	stp	x5, x6, [sp, #280]
    212c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    2130:	97fff968 	bl	6d0 <init_uart_mmio>
    2134:	72001c1f 	tst	w0, #0xff
    2138:	540002e0 	b.eq	2194 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    213c:	9103c3e0 	add	x0, sp, #0xf0
    2140:	9104c3e3 	add	x3, sp, #0x130
    2144:	9104c3e4 	add	x4, sp, #0x130
    2148:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    214c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    2150:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2154:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    2158:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    215c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    2160:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2164:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0xc0>
    2168:	910c4000 	add	x0, x0, #0x310
    216c:	910123e1 	add	x1, sp, #0x48
    2170:	a94527e8 	ldp	x8, x9, [sp, #80]
    2174:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2178:	a9461fe6 	ldp	x6, x7, [sp, #96]
    217c:	a90227e8 	stp	x8, x9, [sp, #32]
    2180:	a9031fe6 	stp	x6, x7, [sp, #48]
    2184:	97fffc6f 	bl	1340 <_vsnprintf>
    va_end(va);
    return ret;
}
    2188:	f9400bf3 	ldr	x19, [sp, #16]
    218c:	a8d37bfd 	ldp	x29, x30, [sp], #304
    2190:	d65f03c0 	ret
        return -1;
    2194:	12800000 	mov	w0, #0xffffffff            	// #-1
    2198:	17fffffc 	b	2188 <printf+0x98>
    219c:	d503201f 	nop

00000000000021a0 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    21a0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    21a4:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    21a8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    21ac:	910003fd 	mov	x29, sp
    va_start(va, format);
    21b0:	910343eb 	add	x11, sp, #0xd0
    21b4:	910403ea 	add	x10, sp, #0x100
    21b8:	a9032bea 	stp	x10, x10, [sp, #48]
{
    21bc:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    21c0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    21c4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    21c8:	d0ffffe0 	adrp	x0, 0 <main>
    21cc:	911e4000 	add	x0, x0, #0x790
    va_start(va, format);
    21d0:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    21d4:	a94337ec 	ldp	x12, x13, [sp, #48]
    21d8:	a90137ec 	stp	x12, x13, [sp, #16]
    21dc:	a94427e8 	ldp	x8, x9, [sp, #64]
    21e0:	a90227e8 	stp	x8, x9, [sp, #32]
{
    21e4:	3d8017e0 	str	q0, [sp, #80]
    21e8:	3d801be1 	str	q1, [sp, #96]
    21ec:	3d801fe2 	str	q2, [sp, #112]
    21f0:	3d8023e3 	str	q3, [sp, #128]
    21f4:	3d8027e4 	str	q4, [sp, #144]
    21f8:	3d802be5 	str	q5, [sp, #160]
    21fc:	3d802fe6 	str	q6, [sp, #176]
    2200:	3d8033e7 	str	q7, [sp, #192]
    2204:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2208:	aa0a03e3 	mov	x3, x10
    220c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    2210:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2214:	910043e4 	add	x4, sp, #0x10
{
    2218:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    221c:	97fffc49 	bl	1340 <_vsnprintf>
    va_end(va);
    return ret;
}
    2220:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2224:	d65f03c0 	ret
    2228:	d503201f 	nop
    222c:	d503201f 	nop

0000000000002230 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    2230:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    2234:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    2238:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    223c:	910003fd 	mov	x29, sp
    va_start(va, format);
    2240:	910343ea 	add	x10, sp, #0xd0
    2244:	910403e8 	add	x8, sp, #0x100
    2248:	a90323e8 	stp	x8, x8, [sp, #48]
{
    224c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2250:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    2254:	f90023ea 	str	x10, [sp, #64]
{
    2258:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    225c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2260:	aa0803e2 	mov	x2, x8
    2264:	a94337ec 	ldp	x12, x13, [sp, #48]
    2268:	d0ffffe0 	adrp	x0, 0 <main>
    226c:	a94427e8 	ldp	x8, x9, [sp, #64]
    2270:	911e4000 	add	x0, x0, #0x790
    2274:	a90137ec 	stp	x12, x13, [sp, #16]
    2278:	a90227e8 	stp	x8, x9, [sp, #32]
{
    227c:	3d8017e0 	str	q0, [sp, #80]
    2280:	3d801be1 	str	q1, [sp, #96]
    2284:	3d801fe2 	str	q2, [sp, #112]
    2288:	3d8023e3 	str	q3, [sp, #128]
    228c:	3d8027e4 	str	q4, [sp, #144]
    2290:	3d802be5 	str	q5, [sp, #160]
    2294:	3d802fe6 	str	q6, [sp, #176]
    2298:	3d8033e7 	str	q7, [sp, #192]
    229c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    22a0:	910043e4 	add	x4, sp, #0x10
    22a4:	aa0a03e3 	mov	x3, x10
{
    22a8:	a90e9be5 	stp	x5, x6, [sp, #232]
    22ac:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    22b0:	97fffc24 	bl	1340 <_vsnprintf>
    va_end(va);
    return ret;
}
    22b4:	a8d07bfd 	ldp	x29, x30, [sp], #256
    22b8:	d65f03c0 	ret
    22bc:	d503201f 	nop

00000000000022c0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    22c0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    22c4:	aa0003e3 	mov	x3, x0
    22c8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    22cc:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    22d0:	a9402428 	ldp	x8, x9, [x1]
    22d4:	910043e4 	add	x4, sp, #0x10
    22d8:	a9411c26 	ldp	x6, x7, [x1, #16]
    22dc:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0xc0>
    22e0:	9100e3e1 	add	x1, sp, #0x38
    22e4:	910c4000 	add	x0, x0, #0x310
    22e8:	a90127e8 	stp	x8, x9, [sp, #16]
    22ec:	a9021fe6 	stp	x6, x7, [sp, #32]
    22f0:	97fffc14 	bl	1340 <_vsnprintf>
}
    22f4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    22f8:	d65f03c0 	ret
    22fc:	d503201f 	nop

0000000000002300 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    2300:	aa0303e4 	mov	x4, x3
    2304:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2308:	aa0103e5 	mov	x5, x1
    230c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    2310:	a9402488 	ldp	x8, x9, [x4]
    2314:	aa0003e1 	mov	x1, x0
    2318:	a9411c86 	ldp	x6, x7, [x4, #16]
    231c:	aa0203e3 	mov	x3, x2
    2320:	910043e4 	add	x4, sp, #0x10
    2324:	aa0503e2 	mov	x2, x5
    2328:	d0ffffe0 	adrp	x0, 0 <main>
    232c:	911e4000 	add	x0, x0, #0x790
    2330:	a90127e8 	stp	x8, x9, [sp, #16]
    2334:	a9021fe6 	stp	x6, x7, [sp, #32]
    2338:	97fffc02 	bl	1340 <_vsnprintf>
}
    233c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2340:	d65f03c0 	ret
    2344:	d503201f 	nop
    2348:	d503201f 	nop
    234c:	d503201f 	nop

0000000000002350 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    2350:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    2354:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    2358:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    235c:	910003fd 	mov	x29, sp
    va_start(va, format);
    2360:	910443ea 	add	x10, sp, #0x110
    2364:	910383eb 	add	x11, sp, #0xe0
    2368:	f90023ea 	str	x10, [sp, #64]
{
    236c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    2370:	910443e2 	add	x2, sp, #0x110
    2374:	f90027e2 	str	x2, [sp, #72]
    2378:	f9002beb 	str	x11, [sp, #80]
{
    237c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    2380:	290b23e9 	stp	w9, w8, [sp, #88]
{
    2384:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    2388:	a9443fee 	ldp	x14, x15, [sp, #64]
    238c:	9100c3e1 	add	x1, sp, #0x30
    2390:	a94527e8 	ldp	x8, x9, [sp, #80]
    2394:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2398:	f0ffffe0 	adrp	x0, 1000 <_ftoa+0xc0>
    239c:	910c8000 	add	x0, x0, #0x320
    23a0:	a9013fee 	stp	x14, x15, [sp, #16]
    23a4:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    23a8:	f9001bec 	str	x12, [sp, #48]
    23ac:	f9001feb 	str	x11, [sp, #56]
{
    23b0:	3d801be0 	str	q0, [sp, #96]
    23b4:	3d801fe1 	str	q1, [sp, #112]
    23b8:	3d8023e2 	str	q2, [sp, #128]
    23bc:	3d8027e3 	str	q3, [sp, #144]
    23c0:	3d802be4 	str	q4, [sp, #160]
    23c4:	3d802fe5 	str	q5, [sp, #176]
    23c8:	3d8033e6 	str	q6, [sp, #192]
    23cc:	3d8037e7 	str	q7, [sp, #208]
    23d0:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    23d4:	910043e4 	add	x4, sp, #0x10
    23d8:	aa0a03e3 	mov	x3, x10
{
    23dc:	a90f9be5 	stp	x5, x6, [sp, #248]
    23e0:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    23e4:	97fffbd7 	bl	1340 <_vsnprintf>
    va_end(va);
    return ret;
    23e8:	a8d17bfd 	ldp	x29, x30, [sp], #272
    23ec:	d65f03c0 	ret

00000000000023f0 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    23f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    23f4:	910003fd 	mov	x29, sp
    23f8:	a90153f3 	stp	x19, x20, [sp, #16]
    23fc:	a9025bf5 	stp	x21, x22, [sp, #32]
    2400:	2a0103f6 	mov	w22, w1
    2404:	a90363f7 	stp	x23, x24, [sp, #48]
    2408:	aa0203f8 	mov	x24, x2
    240c:	aa0003f7 	mov	x23, x0
    2410:	a9046bf9 	stp	x25, x26, [sp, #64]
    2414:	aa0403f9 	mov	x25, x4
    2418:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    241c:	d63f0060 	blr	x3
    2420:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    2424:	93407c00 	sxtw	x0, w0
    2428:	9400038e 	bl	3260 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    242c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    2430:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    2434:	5400022d 	b.le	2478 <spawn+0x88>
    2438:	52800013 	mov	w19, #0x0                   	// #0
    243c:	f9002bfb 	str	x27, [sp, #80]
    2440:	5282001b 	mov	w27, #0x1000                	// #4096
    2444:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2448:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    244c:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    2450:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    2454:	8b33c2a2 	add	x2, x21, w19, sxtw
    2458:	1a9bd084 	csel	w4, w4, w27, le
    245c:	2a1603e1 	mov	w1, w22
    2460:	aa1703e0 	mov	x0, x23
    2464:	d63f0300 	blr	x24
    2468:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    246c:	6b13029f 	cmp	w20, w19
    2470:	54fffecc 	b.gt	2448 <spawn+0x58>
    2474:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    2478:	aa1a03e3 	mov	x3, x26
    247c:	aa1903e2 	mov	x2, x25
    2480:	aa1503e1 	mov	x1, x21
    2484:	d2800004 	mov	x4, #0x0                   	// #0
    2488:	52800020 	mov	w0, #0x1                   	// #1
    248c:	940000b9 	bl	2770 <syscall>
    2490:	2a0003f3 	mov	w19, w0
    free(img);
    2494:	aa1503e0 	mov	x0, x21
    2498:	94000376 	bl	3270 <free>
    return ret;
}
    249c:	2a1303e0 	mov	w0, w19
    24a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    24a4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    24a8:	a94363f7 	ldp	x23, x24, [sp, #48]
    24ac:	a9446bf9 	ldp	x25, x26, [sp, #64]
    24b0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    24b4:	d65f03c0 	ret
    24b8:	d503201f 	nop
    24bc:	d503201f 	nop

00000000000024c0 <thread>:

int thread(void* entry, char* name, char** argv)
{
    24c0:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    24c4:	aa0203e3 	mov	x3, x2
    24c8:	aa0003e1 	mov	x1, x0
    24cc:	aa0403e2 	mov	x2, x4
    24d0:	52800120 	mov	w0, #0x9                   	// #9
    24d4:	d2800004 	mov	x4, #0x0                   	// #0
    24d8:	140000a6 	b	2770 <syscall>
    24dc:	d503201f 	nop

00000000000024e0 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    24e0:	93407c01 	sxtw	x1, w0
    24e4:	d2800004 	mov	x4, #0x0                   	// #0
    24e8:	d2800003 	mov	x3, #0x0                   	// #0
    24ec:	d2800002 	mov	x2, #0x0                   	// #0
    24f0:	52800040 	mov	w0, #0x2                   	// #2
    24f4:	1400009f 	b	2770 <syscall>
    24f8:	d503201f 	nop
    24fc:	d503201f 	nop

0000000000002500 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    2500:	2a0003e1 	mov	w1, w0
    2504:	d2800004 	mov	x4, #0x0                   	// #0
    2508:	d2800003 	mov	x3, #0x0                   	// #0
    250c:	d2800002 	mov	x2, #0x0                   	// #0
    2510:	52800060 	mov	w0, #0x3                   	// #3
    2514:	14000097 	b	2770 <syscall>
    2518:	d503201f 	nop
    251c:	d503201f 	nop

0000000000002520 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    2520:	93407c01 	sxtw	x1, w0
    2524:	d2800004 	mov	x4, #0x0                   	// #0
    2528:	d2800003 	mov	x3, #0x0                   	// #0
    252c:	d2800002 	mov	x2, #0x0                   	// #0
    2530:	52800180 	mov	w0, #0xc                   	// #12
    2534:	1400008f 	b	2770 <syscall>
    2538:	d503201f 	nop
    253c:	d503201f 	nop

0000000000002540 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    2540:	aa0003e1 	mov	x1, x0
    2544:	d2800004 	mov	x4, #0x0                   	// #0
    2548:	d2800003 	mov	x3, #0x0                   	// #0
    254c:	d2800002 	mov	x2, #0x0                   	// #0
    2550:	528000a0 	mov	w0, #0x5                   	// #5
    2554:	14000087 	b	2770 <syscall>
    2558:	d503201f 	nop
    255c:	d503201f 	nop

0000000000002560 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    2560:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    2564:	aa0203e3 	mov	x3, x2
    2568:	aa0003e1 	mov	x1, x0
    256c:	528000c0 	mov	w0, #0x6                   	// #6
    2570:	93407c82 	sxtw	x2, w4
    2574:	d2800004 	mov	x4, #0x0                   	// #0
    2578:	1400007e 	b	2770 <syscall>
    257c:	d503201f 	nop

0000000000002580 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    2580:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    2584:	d2800004 	mov	x4, #0x0                   	// #0
    2588:	aa0003e1 	mov	x1, x0
    258c:	d2800003 	mov	x3, #0x0                   	// #0
    2590:	528000e0 	mov	w0, #0x7                   	// #7
    2594:	14000077 	b	2770 <syscall>
    2598:	d503201f 	nop
    259c:	d503201f 	nop

00000000000025a0 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    25a0:	aa0003e1 	mov	x1, x0
    25a4:	d2800004 	mov	x4, #0x0                   	// #0
    25a8:	d2800003 	mov	x3, #0x0                   	// #0
    25ac:	d2800002 	mov	x2, #0x0                   	// #0
    25b0:	52800100 	mov	w0, #0x8                   	// #8
    25b4:	1400006f 	b	2770 <syscall>
    25b8:	d503201f 	nop
    25bc:	d503201f 	nop

00000000000025c0 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    25c0:	aa0003e2 	mov	x2, x0
    25c4:	d2800004 	mov	x4, #0x0                   	// #0
    25c8:	d2800003 	mov	x3, #0x0                   	// #0
    25cc:	d2800061 	mov	x1, #0x3                   	// #3
    25d0:	52800140 	mov	w0, #0xa                   	// #10
    25d4:	14000067 	b	2770 <syscall>
    25d8:	d503201f 	nop
    25dc:	d503201f 	nop

00000000000025e0 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    25e0:	aa0003e2 	mov	x2, x0
    25e4:	d2800004 	mov	x4, #0x0                   	// #0
    25e8:	d2800003 	mov	x3, #0x0                   	// #0
    25ec:	d2800021 	mov	x1, #0x1                   	// #1
    25f0:	52800140 	mov	w0, #0xa                   	// #10
    25f4:	1400005f 	b	2770 <syscall>
    25f8:	d503201f 	nop
    25fc:	d503201f 	nop

0000000000002600 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    2600:	d2800004 	mov	x4, #0x0                   	// #0
    2604:	d2800003 	mov	x3, #0x0                   	// #0
    2608:	d2800002 	mov	x2, #0x0                   	// #0
    260c:	d2800041 	mov	x1, #0x2                   	// #2
    2610:	52800140 	mov	w0, #0xa                   	// #10
    2614:	14000057 	b	2770 <syscall>
    2618:	d503201f 	nop
    261c:	d503201f 	nop

0000000000002620 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    2620:	d2800004 	mov	x4, #0x0                   	// #0
    2624:	d2800003 	mov	x3, #0x0                   	// #0
    2628:	d2800002 	mov	x2, #0x0                   	// #0
    262c:	d2800081 	mov	x1, #0x4                   	// #4
    2630:	52800140 	mov	w0, #0xa                   	// #10
    2634:	1400004f 	b	2770 <syscall>
    2638:	d503201f 	nop
    263c:	d503201f 	nop

0000000000002640 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    2640:	d2800004 	mov	x4, #0x0                   	// #0
    2644:	d2800003 	mov	x3, #0x0                   	// #0
    2648:	d2800002 	mov	x2, #0x0                   	// #0
    264c:	d28000a1 	mov	x1, #0x5                   	// #5
    2650:	52800140 	mov	w0, #0xa                   	// #10
    2654:	14000047 	b	2770 <syscall>
    2658:	d503201f 	nop
    265c:	d503201f 	nop

0000000000002660 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    2660:	d2800004 	mov	x4, #0x0                   	// #0
    2664:	d2800003 	mov	x3, #0x0                   	// #0
    2668:	d2800002 	mov	x2, #0x0                   	// #0
    266c:	d28000c1 	mov	x1, #0x6                   	// #6
    2670:	52800140 	mov	w0, #0xa                   	// #10
    2674:	1400003f 	b	2770 <syscall>
    2678:	d503201f 	nop
    267c:	d503201f 	nop

0000000000002680 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    2680:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    2684:	92401c64 	and	x4, x3, #0xff
    2688:	aa0103e2 	mov	x2, x1
    268c:	aa0003e1 	mov	x1, x0
    2690:	93407ca3 	sxtw	x3, w5
    2694:	52800080 	mov	w0, #0x4                   	// #4
    2698:	14000036 	b	2770 <syscall>
    269c:	d503201f 	nop

00000000000026a0 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    26a0:	93407c22 	sxtw	x2, w1
    26a4:	d2800004 	mov	x4, #0x0                   	// #0
    26a8:	93407c01 	sxtw	x1, w0
    26ac:	d2800003 	mov	x3, #0x0                   	// #0
    26b0:	52800160 	mov	w0, #0xb                   	// #11
    26b4:	1400002f 	b	2770 <syscall>
    26b8:	d503201f 	nop
    26bc:	d503201f 	nop

00000000000026c0 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    26c0:	93407c02 	sxtw	x2, w0
    26c4:	d2800004 	mov	x4, #0x0                   	// #0
    26c8:	d2800003 	mov	x3, #0x0                   	// #0
    26cc:	d2800001 	mov	x1, #0x0                   	// #0
    26d0:	528001a0 	mov	w0, #0xd                   	// #13
    26d4:	14000027 	b	2770 <syscall>
    26d8:	d503201f 	nop
    26dc:	d503201f 	nop

00000000000026e0 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    26e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    26e4:	93407c02 	sxtw	x2, w0
    26e8:	d2800004 	mov	x4, #0x0                   	// #0
{
    26ec:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    26f0:	d2800003 	mov	x3, #0x0                   	// #0
    26f4:	d2800021 	mov	x1, #0x1                   	// #1
    26f8:	528001a0 	mov	w0, #0xd                   	// #13
    26fc:	9400001d 	bl	2770 <syscall>
    2700:	7100001f 	cmp	w0, #0x0
}
    2704:	1a9f07e0 	cset	w0, ne  // ne = any
    2708:	a8c17bfd 	ldp	x29, x30, [sp], #16
    270c:	d65f03c0 	ret

0000000000002710 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    2710:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2714:	93407c02 	sxtw	x2, w0
    2718:	d2800004 	mov	x4, #0x0                   	// #0
{
    271c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    2720:	d2800003 	mov	x3, #0x0                   	// #0
    2724:	d2800061 	mov	x1, #0x3                   	// #3
    2728:	528001a0 	mov	w0, #0xd                   	// #13
    272c:	94000011 	bl	2770 <syscall>
    2730:	7100001f 	cmp	w0, #0x0
}
    2734:	1a9f07e0 	cset	w0, ne  // ne = any
    2738:	a8c17bfd 	ldp	x29, x30, [sp], #16
    273c:	d65f03c0 	ret

0000000000002740 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    2740:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2744:	93407c02 	sxtw	x2, w0
    2748:	d2800004 	mov	x4, #0x0                   	// #0
{
    274c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    2750:	d2800003 	mov	x3, #0x0                   	// #0
    2754:	d2800041 	mov	x1, #0x2                   	// #2
    2758:	528001a0 	mov	w0, #0xd                   	// #13
    275c:	94000005 	bl	2770 <syscall>
    2760:	7100001f 	cmp	w0, #0x0
    2764:	1a9f07e0 	cset	w0, ne  // ne = any
    2768:	a8c17bfd 	ldp	x29, x30, [sp], #16
    276c:	d65f03c0 	ret

0000000000002770 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    2770:	2a0003e5 	mov	w5, w0
    2774:	aa0103e6 	mov	x6, x1
    2778:	aa0203e7 	mov	x7, x2
    277c:	aa0303e8 	mov	x8, x3
    2780:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    2784:	aa0503e0 	mov	x0, x5
    2788:	aa0603e1 	mov	x1, x6
    278c:	aa0703e2 	mov	x2, x7
    2790:	aa0803e3 	mov	x3, x8
    2794:	aa0903e4 	mov	x4, x9
    2798:	d4000001 	svc	#0x0
    279c:	d5033b9f 	dsb	ish
    27a0:	d5033fdf 	isb
    27a4:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    27a8:	2a0503e0 	mov	w0, w5
    27ac:	d65f03c0 	ret

00000000000027b0 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    27b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    27b4:	7100003f 	cmp	w1, #0x0
{
    27b8:	910003fd 	mov	x29, sp
    27bc:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    27c0:	528000d4 	mov	w20, #0x6                   	// #6
    27c4:	1b147c34 	mul	w20, w1, w20
{
    27c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    27cc:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    27d0:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    27d4:	5400056d 	b.le	2880 <new_ipc_msg+0xd0>
    27d8:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    27dc:	2a1403f6 	mov	w22, w20
    27e0:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    27e4:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    27e8:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    27ec:	91000442 	add	x2, x2, #0x1
    27f0:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    27f4:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    27f8:	54ffff8c 	b.gt	27e8 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    27fc:	aa0303e0 	mov	x0, x3
    2800:	2a1603e1 	mov	w1, w22
    2804:	9400016f 	bl	2dc0 <session_alloc_buf>
    if (buf == NULL) {
    2808:	b40004c0 	cbz	x0, 28a0 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    280c:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    2810:	39400001 	ldrb	w1, [x0]
    2814:	52800182 	mov	w2, #0xc                   	// #12
    2818:	aa1303e3 	mov	x3, x19
    281c:	1b057ea5 	mul	w5, w21, w5
    2820:	121e7421 	and	w1, w1, #0xfffffffc
    2824:	39000001 	strb	w1, [x0]
    2828:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    282c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    2830:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    2834:	b9400064 	ldr	w4, [x3]
    2838:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    283c:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    2840:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    2844:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    2848:	b8404461 	ldr	w1, [x3], #4
    284c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    2850:	54ffff01 	b.ne	2830 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    2854:	39400002 	ldrb	w2, [x0]
    2858:	531c0ea1 	ubfiz	w1, w21, #4, #4
    285c:	321e0021 	orr	w1, w1, #0x4
    2860:	52800163 	mov	w3, #0xb                   	// #11
    2864:	0a030042 	and	w2, w2, w3
    2868:	2a020021 	orr	w1, w1, w2
    286c:	39000001 	strb	w1, [x0]
    return buf;
}
    2870:	a94153f3 	ldp	x19, x20, [sp, #16]
    2874:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2878:	a8c37bfd 	ldp	x29, x30, [sp], #48
    287c:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    2880:	2a1403e1 	mov	w1, w20
    2884:	9400014f 	bl	2dc0 <session_alloc_buf>
    if (buf == NULL) {
    2888:	b40000c0 	cbz	x0, 28a0 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    288c:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    2890:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    2894:	121e7421 	and	w1, w1, #0xfffffffc
    2898:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    289c:	17ffffee 	b	2854 <new_ipc_msg+0xa4>
        return NULL;
    28a0:	d2800000 	mov	x0, #0x0                   	// #0
    28a4:	17fffff3 	b	2870 <new_ipc_msg+0xc0>
    28a8:	d503201f 	nop
    28ac:	d503201f 	nop

00000000000028b0 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    28b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    28b4:	2a0103e4 	mov	w4, w1
    28b8:	aa0203e1 	mov	x1, x2
    28bc:	910003fd 	mov	x29, sp
    28c0:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    28c4:	39400003 	ldrb	w3, [x0]
    28c8:	d3441c63 	ubfx	x3, x3, #4, #4
    28cc:	6b04007f 	cmp	w3, w4
    28d0:	540003ad 	b.le	2944 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    28d4:	528000c5 	mov	w5, #0x6                   	// #6
    28d8:	d2800183 	mov	x3, #0xc                   	// #12
    28dc:	9b250c84 	smaddl	x4, w4, w5, x3
    28e0:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    28e4:	794004a3 	ldrh	w3, [x5, #2]
    28e8:	37f801e2 	tbnz	w2, #31, 2924 <ipc_msg_set_nth_arg+0x74>
    28ec:	6b02007f 	cmp	w3, w2
    28f0:	540001a3 	b.cc	2924 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    28f4:	394010a3 	ldrb	w3, [x5, #4]
    28f8:	37000423 	tbnz	w3, #0, 297c <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    28fc:	78646803 	ldrh	w3, [x0, x4]
    2900:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    2904:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    2908:	b4000301 	cbz	x1, 2968 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    290c:	121f7863 	and	w3, w3, #0xfffffffe
    2910:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    2914:	940004cb 	bl	3c40 <memmove>
    return true;
    2918:	52800020 	mov	w0, #0x1                   	// #1
}
    291c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2920:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    2924:	b0000041 	adrp	x1, b000 <_fini+0xcc>
    2928:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    292c:	910be021 	add	x1, x1, #0x2f8
    2930:	91074000 	add	x0, x0, #0x1d0
    2934:	97fffdef 	bl	20f0 <printf>
        return false;
    2938:	52800000 	mov	w0, #0x0                   	// #0
}
    293c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2940:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    2944:	2a0403e2 	mov	w2, w4
    2948:	b0000041 	adrp	x1, b000 <_fini+0xcc>
    294c:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2950:	910be021 	add	x1, x1, #0x2f8
    2954:	91064000 	add	x0, x0, #0x190
    2958:	97fffde6 	bl	20f0 <printf>
        return false;
    295c:	52800000 	mov	w0, #0x0                   	// #0
}
    2960:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2964:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    2968:	32000063 	orr	w3, w3, #0x1
    296c:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    2970:	940004e4 	bl	3d00 <memset>
        return true;
    2974:	52800020 	mov	w0, #0x1                   	// #1
    2978:	17ffffe9 	b	291c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    297c:	d2800000 	mov	x0, #0x0                   	// #0
    2980:	17ffffe1 	b	2904 <ipc_msg_set_nth_arg+0x54>
    2984:	d503201f 	nop
    2988:	d503201f 	nop
    298c:	d503201f 	nop

0000000000002990 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    2990:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2994:	aa0003e4 	mov	x4, x0
    2998:	910003fd 	mov	x29, sp
    299c:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    29a0:	39400005 	ldrb	w5, [x0]
    29a4:	d3441ca5 	ubfx	x5, x5, #4, #4
    29a8:	6b0100bf 	cmp	w5, w1
    29ac:	5400030d 	b.le	2a0c <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    29b0:	528000c5 	mov	w5, #0x6                   	// #6
    29b4:	aa0203e0 	mov	x0, x2
    29b8:	d2800182 	mov	x2, #0xc                   	// #12
    29bc:	9b250821 	smaddl	x1, w1, w5, x2
    29c0:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    29c4:	79400445 	ldrh	w5, [x2, #2]
    29c8:	6b0300bf 	cmp	w5, w3
    29cc:	5400036b 	b.lt	2a38 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    29d0:	39401042 	ldrb	w2, [x2, #4]
        return true;
    29d4:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    29d8:	360000a2 	tbz	w2, #0, 29ec <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    29dc:	2a1303e0 	mov	w0, w19
    29e0:	f9400bf3 	ldr	x19, [sp, #16]
    29e4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    29e8:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    29ec:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    29f0:	93407c62 	sxtw	x2, w3
    29f4:	8b010081 	add	x1, x4, x1
    29f8:	94000492 	bl	3c40 <memmove>
}
    29fc:	2a1303e0 	mov	w0, w19
    2a00:	f9400bf3 	ldr	x19, [sp, #16]
    2a04:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2a08:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    2a0c:	b0000041 	adrp	x1, b000 <_fini+0xcc>
    2a10:	910be021 	add	x1, x1, #0x2f8
    2a14:	91006021 	add	x1, x1, #0x18
        return false;
    2a18:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    2a1c:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2a20:	91086000 	add	x0, x0, #0x218
    2a24:	97fffdb3 	bl	20f0 <printf>
}
    2a28:	2a1303e0 	mov	w0, w19
    2a2c:	f9400bf3 	ldr	x19, [sp, #16]
    2a30:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2a34:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    2a38:	b0000041 	adrp	x1, b000 <_fini+0xcc>
    2a3c:	910be021 	add	x1, x1, #0x2f8
    2a40:	91006021 	add	x1, x1, #0x18
        return false;
    2a44:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    2a48:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2a4c:	91090000 	add	x0, x0, #0x240
    2a50:	97fffda8 	bl	20f0 <printf>
}
    2a54:	2a1303e0 	mov	w0, w19
    2a58:	f9400bf3 	ldr	x19, [sp, #16]
    2a5c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2a60:	d65f03c0 	ret
    2a64:	d503201f 	nop
    2a68:	d503201f 	nop
    2a6c:	d503201f 	nop

0000000000002a70 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    2a70:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    2a74:	d2800021 	mov	x1, #0x1                   	// #1
    2a78:	f2db9741 	movk	x1, #0xdcba, lsl #32
    2a7c:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    2a80:	910003fd 	mov	x29, sp
    2a84:	f9000bf3 	str	x19, [sp, #16]
    2a88:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    2a8c:	f9400000 	ldr	x0, [x0]
    2a90:	927e7400 	and	x0, x0, #0xfffffffc
    2a94:	aa010000 	orr	x0, x0, x1
    2a98:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    2a9c:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    2aa0:	52800040 	mov	w0, #0x2                   	// #2
    2aa4:	97fffe97 	bl	2500 <yield>
    while (msg->header.done == 0) {
    2aa8:	39400261 	ldrb	w1, [x19]
    2aac:	360fffa1 	tbz	w1, #1, 2aa0 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    2ab0:	f9400bf3 	ldr	x19, [sp, #16]
    2ab4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2ab8:	d65f03c0 	ret
    2abc:	d503201f 	nop

0000000000002ac0 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    2ac0:	f9400001 	ldr	x1, [x0]
    2ac4:	d2800022 	mov	x2, #0x1                   	// #1
    2ac8:	f2db9742 	movk	x2, #0xdcba, lsl #32
    2acc:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    2ad0:	927e7421 	and	x1, x1, #0xfffffffc
    2ad4:	aa020021 	orr	x1, x1, x2
    2ad8:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    2adc:	d65f03c0 	ret

0000000000002ae0 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    2ae0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    2ae4:	910003fd 	mov	x29, sp
    2ae8:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    2aec:	b9800801 	ldrsw	x1, [x0, #8]
    2af0:	f9400800 	ldr	x0, [x0, #16]
    2af4:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    2af8:	38616800 	ldrb	w0, [x0, x1]
    2afc:	370800a0 	tbnz	w0, #1, 2b10 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    2b00:	52800040 	mov	w0, #0x2                   	// #2
    2b04:	97fffe7f 	bl	2500 <yield>
    while (msg->header.done == 0) {
    2b08:	39400260 	ldrb	w0, [x19]
    2b0c:	360fffa0 	tbz	w0, #1, 2b00 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    2b10:	b9400a60 	ldr	w0, [x19, #8]
    2b14:	f9400bf3 	ldr	x19, [sp, #16]
    2b18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2b1c:	d65f03c0 	ret

0000000000002b20 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    2b20:	d0000040 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
}
    2b24:	b942a800 	ldr	w0, [x0, #680]
    2b28:	d65f03c0 	ret
    2b2c:	d503201f 	nop

0000000000002b30 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    2b30:	f0000040 	adrp	x0, d000 <__malloc_av_+0x600>
    2b34:	52800021 	mov	w1, #0x1                   	// #1
    2b38:	3914c001 	strb	w1, [x0, #1328]
}
    2b3c:	d65f03c0 	ret

0000000000002b40 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    2b40:	f0000040 	adrp	x0, d000 <__malloc_av_+0x600>
}
    2b44:	3954c000 	ldrb	w0, [x0, #1328]
    2b48:	d65f03c0 	ret
    2b4c:	d503201f 	nop

0000000000002b50 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    2b50:	f0000040 	adrp	x0, d000 <__malloc_av_+0x600>
    2b54:	f9429c00 	ldr	x0, [x0, #1336]
    2b58:	b4000080 	cbz	x0, 2b68 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    2b5c:	39400000 	ldrb	w0, [x0]
    2b60:	d3430c00 	ubfx	x0, x0, #3, #1
}
    2b64:	d65f03c0 	ret
        return false;
    2b68:	52800000 	mov	w0, #0x0                   	// #0
}
    2b6c:	d65f03c0 	ret

0000000000002b70 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    2b70:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    2b74:	d2806002 	mov	x2, #0x300                 	// #768
    2b78:	52800001 	mov	w1, #0x0                   	// #0
{
    2b7c:	a9007bfd 	stp	x29, x30, [sp]
    2b80:	910003fd 	mov	x29, sp
    2b84:	a90153f3 	stp	x19, x20, [sp, #16]
    2b88:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    2b8c:	9101c3e0 	add	x0, sp, #0x70
{
    2b90:	a9025bf5 	stp	x21, x22, [sp, #32]
    2b94:	d0000055 	adrp	x21, c000 <IpcSemaphoreServer+0x558>
    2b98:	910aa2b5 	add	x21, x21, #0x2a8
    2b9c:	a90363f7 	stp	x23, x24, [sp, #48]
    2ba0:	b0000056 	adrp	x22, b000 <_fini+0xcc>
    2ba4:	910a62d6 	add	x22, x22, #0x298
    2ba8:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    2bac:	529b9754 	mov	w20, #0xdcba                	// #56506
    2bb0:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    2bb4:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    2bb8:	94000452 	bl	3d00 <memset>
    2bbc:	f0000044 	adrp	x4, d000 <__malloc_av_+0x600>
    2bc0:	9114c09c 	add	x28, x4, #0x530
    2bc4:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2bc8:	9109c000 	add	x0, x0, #0x270
    2bcc:	f90037e0 	str	x0, [sp, #104]
    2bd0:	b000005b 	adrp	x27, b000 <_fini+0xcc>
    2bd4:	910b0360 	add	x0, x27, #0x2c0
    2bd8:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    2bdc:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2be0:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    2be4:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    2be8:	52800401 	mov	w1, #0x20                  	// #32
    2bec:	97fffe65 	bl	2580 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2bf0:	9101c3fb 	add	x27, sp, #0x70
    2bf4:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    2bf8:	52800019 	mov	w25, #0x0                   	// #0
    2bfc:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    2c00:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    2c04:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    2c08:	b4000980 	cbz	x0, 2d38 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2c0c:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    2c10:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2c14:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    2c18:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2c1c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    2c20:	b9400401 	ldr	w1, [x0, #4]
    2c24:	6b14003f 	cmp	w1, w20
    2c28:	54000340 	b.eq	2c90 <ipc_server_loop+0x120>  // b.none
    2c2c:	14000039 	b	2d10 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    2c30:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    2c34:	f9400780 	ldr	x0, [x28, #8]
    2c38:	39400001 	ldrb	w1, [x0]
    2c3c:	36080641 	tbz	w1, #1, 2d04 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2c40:	29409b62 	ldp	w2, w6, [x27, #4]
    2c44:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2c48:	79400400 	ldrh	w0, [x0, #2]
    2c4c:	0b010041 	add	w1, w2, w1
    2c50:	4b060021 	sub	w1, w1, w6
    2c54:	1ac20c25 	sdiv	w5, w1, w2
    2c58:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    2c5c:	6b01001f 	cmp	w0, w1
    2c60:	5400078c 	b.gt	2d50 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    2c64:	0b060000 	add	w0, w0, w6
    2c68:	1ac20c01 	sdiv	w1, w0, w2
    2c6c:	1b028020 	msub	w0, w1, w2, w0
    2c70:	b9000b60 	str	w0, [x27, #8]
    2c74:	37f804e0 	tbnz	w0, #31, 2d10 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    2c78:	f9400b61 	ldr	x1, [x27, #16]
    2c7c:	8b20c020 	add	x0, x1, w0, sxtw
    2c80:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    2c84:	b9400401 	ldr	w1, [x0, #4]
    2c88:	6b14003f 	cmp	w1, w20
    2c8c:	54000421 	b.ne	2d10 <ipc_server_loop+0x1a0>  // b.any
    2c90:	39400001 	ldrb	w1, [x0]
    2c94:	12000421 	and	w1, w1, #0x3
    2c98:	7100043f 	cmp	w1, #0x1
    2c9c:	540003a1 	b.ne	2d10 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2ca0:	29409761 	ldp	w1, w5, [x27, #4]
    2ca4:	b9400f66 	ldr	w6, [x27, #12]
    2ca8:	0b0100c2 	add	w2, w6, w1
    2cac:	4b050042 	sub	w2, w2, w5
    2cb0:	1ac10c45 	sdiv	w5, w2, w1
    2cb4:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2cb8:	35000122 	cbnz	w2, 2cdc <ipc_server_loop+0x16c>
    2cbc:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    2cc0:	6b01005f 	cmp	w2, w1
    2cc4:	5400056c 	b.gt	2d70 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    2cc8:	0b060042 	add	w2, w2, w6
    2ccc:	1ac10c45 	sdiv	w5, w2, w1
    2cd0:	1b0188a2 	msub	w2, w5, w1, w2
    2cd4:	b9000f62 	str	w2, [x27, #12]
    2cd8:	37f801c2 	tbnz	w2, #31, 2d10 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    2cdc:	39400402 	ldrb	w2, [x0, #1]
    2ce0:	39400401 	ldrb	w1, [x0, #1]
    2ce4:	8b020e62 	add	x2, x19, x2, lsl #3
    2ce8:	f9400442 	ldr	x2, [x2, #8]
    2cec:	b5fffa22 	cbnz	x2, 2c30 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    2cf0:	f9400262 	ldr	x2, [x19]
    2cf4:	aa1603e0 	mov	x0, x22
    2cf8:	97fffcfe 	bl	20f0 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    2cfc:	f9400780 	ldr	x0, [x28, #8]
    2d00:	17ffffd0 	b	2c40 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    2d04:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    2d08:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    2d0c:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    2d10:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2d14:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    2d18:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2d1c:	eb1b02ff 	cmp	x23, x27
    2d20:	54fff701 	b.ne	2c00 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2d24:	52000340 	eor	w0, w26, #0x1
    2d28:	5280003a 	mov	w26, #0x1                   	// #1
    2d2c:	6a00033f 	tst	w25, w0
    2d30:	54fff601 	b.ne	2bf0 <ipc_server_loop+0x80>  // b.any
    2d34:	17ffffaa 	b	2bdc <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    2d38:	97fffdf2 	bl	2500 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    2d3c:	52000340 	eor	w0, w26, #0x1
    2d40:	5280003a 	mov	w26, #0x1                   	// #1
    2d44:	6a00033f 	tst	w25, w0
    2d48:	54fff541 	b.ne	2bf0 <ipc_server_loop+0x80>  // b.any
    2d4c:	17ffffa4 	b	2bdc <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    2d50:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2d54:	9100637b 	add	x27, x27, #0x18
    2d58:	97fffce6 	bl	20f0 <printf>
                cur_sess_id = -1;
    2d5c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    2d60:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2d64:	eb1b02ff 	cmp	x23, x27
    2d68:	54fff4c1 	b.ne	2c00 <ipc_server_loop+0x90>  // b.any
    2d6c:	17ffffee 	b	2d24 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    2d70:	f94037e0 	ldr	x0, [sp, #104]
    2d74:	9100637b 	add	x27, x27, #0x18
    2d78:	97fffcde 	bl	20f0 <printf>
                cur_sess_id = -1;
    2d7c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    2d80:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    2d84:	eb1b02ff 	cmp	x23, x27
    2d88:	54fff3c1 	b.ne	2c00 <ipc_server_loop+0x90>  // b.any
    2d8c:	17ffffe6 	b	2d24 <ipc_server_loop+0x1b4>

0000000000002d90 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    2d90:	aa0003e3 	mov	x3, x0
    2d94:	aa0103e0 	mov	x0, x1
    2d98:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    2d9c:	aa0303e2 	mov	x2, x3
    2da0:	17fffdf0 	b	2560 <session>
    2da4:	d503201f 	nop
    2da8:	d503201f 	nop
    2dac:	d503201f 	nop

0000000000002db0 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    2db0:	17fffdfc 	b	25a0 <close_session>
    2db4:	d503201f 	nop
    2db8:	d503201f 	nop
    2dbc:	d503201f 	nop

0000000000002dc0 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    2dc0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2dc4:	910003fd 	mov	x29, sp
    2dc8:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    2dcc:	37f80561 	tbnz	w1, #31, 2e78 <session_alloc_buf+0xb8>
    2dd0:	a90153f3 	stp	x19, x20, [sp, #16]
    2dd4:	2a0103f4 	mov	w20, w1
    2dd8:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2ddc:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    2de0:	d2800015 	mov	x21, #0x0                   	// #0
    2de4:	b9400c03 	ldr	w3, [x0, #12]
    2de8:	0b030020 	add	w0, w1, w3
    2dec:	4b020000 	sub	w0, w0, w2
    2df0:	1ac10c02 	sdiv	w2, w0, w1
    2df4:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    2df8:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    2dfc:	6b01029f 	cmp	w20, w1
    2e00:	5400032c 	b.gt	2e64 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2e04:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    2e08:	93407e82 	sxtw	x2, w20
    2e0c:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    2e10:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    2e14:	aa1503e0 	mov	x0, x21
    2e18:	940003ba 	bl	3d00 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2e1c:	29408e60 	ldp	w0, w3, [x19, #4]
    2e20:	b9400e61 	ldr	w1, [x19, #12]
    2e24:	0b010002 	add	w2, w0, w1
    2e28:	4b030043 	sub	w3, w2, w3
    2e2c:	1ac00c62 	sdiv	w2, w3, w0
    2e30:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    2e34:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    2e38:	6b02029f 	cmp	w20, w2
    2e3c:	5400028c 	b.gt	2e8c <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    2e40:	0b010294 	add	w20, w20, w1
    2e44:	1ac00e81 	sdiv	w1, w20, w0
    2e48:	1b00d034 	msub	w20, w1, w0, w20
    2e4c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    2e50:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    2e54:	aa1503e0 	mov	x0, x21
    2e58:	f94013f5 	ldr	x21, [sp, #32]
    2e5c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2e60:	d65f03c0 	ret
    2e64:	aa1503e0 	mov	x0, x21
    2e68:	a94153f3 	ldp	x19, x20, [sp, #16]
    2e6c:	f94013f5 	ldr	x21, [sp, #32]
    2e70:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2e74:	d65f03c0 	ret
        return NULL;
    2e78:	d2800015 	mov	x21, #0x0                   	// #0
}
    2e7c:	aa1503e0 	mov	x0, x21
    2e80:	f94013f5 	ldr	x21, [sp, #32]
    2e84:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2e88:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    2e8c:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2e90:	9109c000 	add	x0, x0, #0x270
    2e94:	97fffc97 	bl	20f0 <printf>
        return -1;
    2e98:	a94153f3 	ldp	x19, x20, [sp, #16]
    2e9c:	17ffffee 	b	2e54 <session_alloc_buf+0x94>

0000000000002ea0 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    2ea0:	37f80241 	tbnz	w1, #31, 2ee8 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    2ea4:	29409403 	ldp	w3, w5, [x0, #4]
    2ea8:	aa0003e2 	mov	x2, x0
    2eac:	b9400c00 	ldr	w0, [x0, #12]
    2eb0:	0b000060 	add	w0, w3, w0
    2eb4:	4b050000 	sub	w0, w0, w5
    2eb8:	1ac30c04 	sdiv	w4, w0, w3
    2ebc:	1b038080 	msub	w0, w4, w3, w0
    2ec0:	6b00003f 	cmp	w1, w0
    2ec4:	5400012c 	b.gt	2ee8 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    2ec8:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    2ecc:	52800020 	mov	w0, #0x1                   	// #1
    2ed0:	1ac30c24 	sdiv	w4, w1, w3
    2ed4:	1b038481 	msub	w1, w4, w3, w1
    2ed8:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    2edc:	3100043f 	cmn	w1, #0x1
    2ee0:	54000080 	b.eq	2ef0 <session_free_buf+0x50>  // b.none
}
    2ee4:	d65f03c0 	ret
        return false;
    2ee8:	52800000 	mov	w0, #0x0                   	// #0
}
    2eec:	d65f03c0 	ret
{
    2ef0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    2ef4:	b0000043 	adrp	x3, b000 <_fini+0xcc>
    2ef8:	b0000042 	adrp	x2, b000 <_fini+0xcc>
{
    2efc:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    2f00:	b0000040 	adrp	x0, b000 <_fini+0xcc>
    2f04:	910ca063 	add	x3, x3, #0x328
    2f08:	910da042 	add	x2, x2, #0x368
    2f0c:	910d6000 	add	x0, x0, #0x358
    2f10:	52800801 	mov	w1, #0x40                  	// #64
    2f14:	94000033 	bl	2fe0 <__assert_func>
    2f18:	d503201f 	nop
    2f1c:	d503201f 	nop

0000000000002f20 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    2f20:	14000000 	b	2f20 <_exit>
    2f24:	d503201f 	nop
    2f28:	d503201f 	nop
    2f2c:	d503201f 	nop

0000000000002f30 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    2f30:	f0000043 	adrp	x3, d000 <__malloc_av_+0x600>
    2f34:	f942a061 	ldr	x1, [x3, #1344]
    2f38:	f0000042 	adrp	x2, d000 <__malloc_av_+0x600>
    2f3c:	91212042 	add	x2, x2, #0x848
    2f40:	f100003f 	cmp	x1, #0x0
    2f44:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    2f48:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    2f4c:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    2f50:	f902a062 	str	x2, [x3, #1344]
}
    2f54:	d65f03c0 	ret
    2f58:	d503201f 	nop
    2f5c:	d503201f 	nop

0000000000002f60 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    2f60:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    2f64:	d65f03c0 	ret
    2f68:	d503201f 	nop
    2f6c:	d503201f 	nop

0000000000002f70 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    2f70:	12800000 	mov	w0, #0xffffffff            	// #-1
    2f74:	d65f03c0 	ret
    2f78:	d503201f 	nop
    2f7c:	d503201f 	nop

0000000000002f80 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    2f80:	52800000 	mov	w0, #0x0                   	// #0
    2f84:	d65f03c0 	ret
    2f88:	d503201f 	nop
    2f8c:	d503201f 	nop

0000000000002f90 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    2f90:	52800020 	mov	w0, #0x1                   	// #1
    2f94:	d65f03c0 	ret
    2f98:	d503201f 	nop
    2f9c:	d503201f 	nop

0000000000002fa0 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    2fa0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    2fa4:	d65f03c0 	ret
    2fa8:	d503201f 	nop
    2fac:	d503201f 	nop

0000000000002fb0 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    2fb0:	d2800000 	mov	x0, #0x0                   	// #0
    2fb4:	d65f03c0 	ret
    2fb8:	d503201f 	nop
    2fbc:	d503201f 	nop

0000000000002fc0 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    2fc0:	12800000 	mov	w0, #0xffffffff            	// #-1
    2fc4:	d65f03c0 	ret
    2fc8:	d503201f 	nop
    2fcc:	d503201f 	nop

0000000000002fd0 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    2fd0:	52800020 	mov	w0, #0x1                   	// #1
    2fd4:	d65f03c0 	ret
    2fd8:	d503201f 	nop
    2fdc:	d503201f 	nop

0000000000002fe0 <__assert_func>:
    2fe0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    2fe4:	d0000044 	adrp	x4, c000 <IpcSemaphoreServer+0x558>
    2fe8:	aa0003e7 	mov	x7, x0
    2fec:	910003fd 	mov	x29, sp
    2ff0:	f9415885 	ldr	x5, [x4, #688]
    2ff4:	aa0203e6 	mov	x6, x2
    2ff8:	2a0103e4 	mov	w4, w1
    2ffc:	aa0303e2 	mov	x2, x3
    3000:	f9400ca0 	ldr	x0, [x5, #24]
    3004:	b4000106 	cbz	x6, 3024 <__assert_func+0x44>
    3008:	90000045 	adrp	x5, b000 <_fini+0xcc>
    300c:	910e00a5 	add	x5, x5, #0x380
    3010:	aa0703e3 	mov	x3, x7
    3014:	90000041 	adrp	x1, b000 <_fini+0xcc>
    3018:	910e4021 	add	x1, x1, #0x390
    301c:	94000049 	bl	3140 <fiprintf>
    3020:	94000bd8 	bl	5f80 <abort>
    3024:	90000045 	adrp	x5, b000 <_fini+0xcc>
    3028:	910a40a5 	add	x5, x5, #0x290
    302c:	aa0503e6 	mov	x6, x5
    3030:	17fffff8 	b	3010 <__assert_func+0x30>
    3034:	d503201f 	nop
    3038:	d503201f 	nop
    303c:	d503201f 	nop

0000000000003040 <__assert>:
    3040:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3044:	aa0203e3 	mov	x3, x2
    3048:	d2800002 	mov	x2, #0x0                   	// #0
    304c:	910003fd 	mov	x29, sp
    3050:	97ffffe4 	bl	2fe0 <__assert_func>
    3054:	d503201f 	nop
    3058:	d503201f 	nop
    305c:	d503201f 	nop

0000000000003060 <atexit>:
    3060:	aa0003e1 	mov	x1, x0
    3064:	d2800003 	mov	x3, #0x0                   	// #0
    3068:	d2800002 	mov	x2, #0x0                   	// #0
    306c:	52800000 	mov	w0, #0x0                   	// #0
    3070:	14000bcc 	b	5fa0 <__register_exitproc>
    3074:	d503201f 	nop
    3078:	d503201f 	nop
    307c:	d503201f 	nop

0000000000003080 <__libc_fini_array>:
    3080:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3084:	90000041 	adrp	x1, b000 <_fini+0xcc>
    3088:	90000040 	adrp	x0, b000 <_fini+0xcc>
    308c:	910003fd 	mov	x29, sp
    3090:	a90153f3 	stp	x19, x20, [sp, #16]
    3094:	f941e033 	ldr	x19, [x1, #960]
    3098:	f941e414 	ldr	x20, [x0, #968]
    309c:	cb140273 	sub	x19, x19, x20
    30a0:	9343fe73 	asr	x19, x19, #3
    30a4:	b40000b3 	cbz	x19, 30b8 <__libc_fini_array+0x38>
    30a8:	d1000673 	sub	x19, x19, #0x1
    30ac:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    30b0:	d63f0000 	blr	x0
    30b4:	b5ffffb3 	cbnz	x19, 30a8 <__libc_fini_array+0x28>
    30b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    30bc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    30c0:	14001f9d 	b	af34 <_fini>
    30c4:	d503201f 	nop
    30c8:	d503201f 	nop
    30cc:	d503201f 	nop

00000000000030d0 <_fiprintf_r>:
    30d0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    30d4:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    30d8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    30dc:	910003fd 	mov	x29, sp
    30e0:	910343ea 	add	x10, sp, #0xd0
    30e4:	910403eb 	add	x11, sp, #0x100
    30e8:	a9032feb 	stp	x11, x11, [sp, #48]
    30ec:	f90023ea 	str	x10, [sp, #64]
    30f0:	290923e9 	stp	w9, w8, [sp, #72]
    30f4:	a9432fea 	ldp	x10, x11, [sp, #48]
    30f8:	a9012fea 	stp	x10, x11, [sp, #16]
    30fc:	a94427e8 	ldp	x8, x9, [sp, #64]
    3100:	a90227e8 	stp	x8, x9, [sp, #32]
    3104:	3d8017e0 	str	q0, [sp, #80]
    3108:	3d801be1 	str	q1, [sp, #96]
    310c:	3d801fe2 	str	q2, [sp, #112]
    3110:	3d8023e3 	str	q3, [sp, #128]
    3114:	3d8027e4 	str	q4, [sp, #144]
    3118:	3d802be5 	str	q5, [sp, #160]
    311c:	3d802fe6 	str	q6, [sp, #176]
    3120:	3d8033e7 	str	q7, [sp, #192]
    3124:	a90d93e3 	stp	x3, x4, [sp, #216]
    3128:	910043e3 	add	x3, sp, #0x10
    312c:	a90e9be5 	stp	x5, x6, [sp, #232]
    3130:	f9007fe7 	str	x7, [sp, #248]
    3134:	940003c7 	bl	4050 <_vfiprintf_r>
    3138:	a8d07bfd 	ldp	x29, x30, [sp], #256
    313c:	d65f03c0 	ret

0000000000003140 <fiprintf>:
    3140:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    3144:	b0000048 	adrp	x8, c000 <IpcSemaphoreServer+0x558>
    3148:	aa0003eb 	mov	x11, x0
    314c:	910003fd 	mov	x29, sp
    3150:	910343ec 	add	x12, sp, #0xd0
    3154:	910403ea 	add	x10, sp, #0x100
    3158:	f9415900 	ldr	x0, [x8, #688]
    315c:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    3160:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    3164:	a9032bea 	stp	x10, x10, [sp, #48]
    3168:	aa0103ea 	mov	x10, x1
    316c:	f90023ec 	str	x12, [sp, #64]
    3170:	aa0b03e1 	mov	x1, x11
    3174:	290923e9 	stp	w9, w8, [sp, #72]
    3178:	a94337ec 	ldp	x12, x13, [sp, #48]
    317c:	a90137ec 	stp	x12, x13, [sp, #16]
    3180:	a94427e8 	ldp	x8, x9, [sp, #64]
    3184:	a90227e8 	stp	x8, x9, [sp, #32]
    3188:	3d8017e0 	str	q0, [sp, #80]
    318c:	3d801be1 	str	q1, [sp, #96]
    3190:	3d801fe2 	str	q2, [sp, #112]
    3194:	3d8023e3 	str	q3, [sp, #128]
    3198:	3d8027e4 	str	q4, [sp, #144]
    319c:	3d802be5 	str	q5, [sp, #160]
    31a0:	3d802fe6 	str	q6, [sp, #176]
    31a4:	3d8033e7 	str	q7, [sp, #192]
    31a8:	a90d0fe2 	stp	x2, x3, [sp, #208]
    31ac:	910043e3 	add	x3, sp, #0x10
    31b0:	aa0a03e2 	mov	x2, x10
    31b4:	a90e17e4 	stp	x4, x5, [sp, #224]
    31b8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    31bc:	940003a5 	bl	4050 <_vfiprintf_r>
    31c0:	a8d07bfd 	ldp	x29, x30, [sp], #256
    31c4:	d65f03c0 	ret
    31c8:	d503201f 	nop
    31cc:	d503201f 	nop

00000000000031d0 <__libc_init_array>:
    31d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    31d4:	90000041 	adrp	x1, b000 <_fini+0xcc>
    31d8:	90000040 	adrp	x0, b000 <_fini+0xcc>
    31dc:	910003fd 	mov	x29, sp
    31e0:	a90153f3 	stp	x19, x20, [sp, #16]
    31e4:	f941ec34 	ldr	x20, [x1, #984]
    31e8:	f90013f5 	str	x21, [sp, #32]
    31ec:	f941f015 	ldr	x21, [x0, #992]
    31f0:	cb150294 	sub	x20, x20, x21
    31f4:	9343fe94 	asr	x20, x20, #3
    31f8:	b40000f4 	cbz	x20, 3214 <__libc_init_array+0x44>
    31fc:	d2800013 	mov	x19, #0x0                   	// #0
    3200:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    3204:	91000673 	add	x19, x19, #0x1
    3208:	d63f0000 	blr	x0
    320c:	eb13029f 	cmp	x20, x19
    3210:	54ffff81 	b.ne	3200 <__libc_init_array+0x30>  // b.any
    3214:	940ff37b 	bl	400000 <_init>
    3218:	90000041 	adrp	x1, b000 <_fini+0xcc>
    321c:	90000040 	adrp	x0, b000 <_fini+0xcc>
    3220:	f941f434 	ldr	x20, [x1, #1000]
    3224:	f941f815 	ldr	x21, [x0, #1008]
    3228:	cb150294 	sub	x20, x20, x21
    322c:	9343fe94 	asr	x20, x20, #3
    3230:	b40000f4 	cbz	x20, 324c <__libc_init_array+0x7c>
    3234:	d2800013 	mov	x19, #0x0                   	// #0
    3238:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    323c:	91000673 	add	x19, x19, #0x1
    3240:	d63f0000 	blr	x0
    3244:	eb13029f 	cmp	x20, x19
    3248:	54ffff81 	b.ne	3238 <__libc_init_array+0x68>  // b.any
    324c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3250:	f94013f5 	ldr	x21, [sp, #32]
    3254:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3258:	d65f03c0 	ret
    325c:	d503201f 	nop

0000000000003260 <malloc>:
    3260:	b0000042 	adrp	x2, c000 <IpcSemaphoreServer+0x558>
    3264:	aa0003e1 	mov	x1, x0
    3268:	f9415840 	ldr	x0, [x2, #688]
    326c:	14000005 	b	3280 <_malloc_r>

0000000000003270 <free>:
    3270:	b0000042 	adrp	x2, c000 <IpcSemaphoreServer+0x558>
    3274:	aa0003e1 	mov	x1, x0
    3278:	f9415840 	ldr	x0, [x2, #688]
    327c:	14000dd5 	b	69d0 <_free_r>

0000000000003280 <_malloc_r>:
    3280:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    3284:	910003fd 	mov	x29, sp
    3288:	a90153f3 	stp	x19, x20, [sp, #16]
    328c:	91005c33 	add	x19, x1, #0x17
    3290:	a9025bf5 	stp	x21, x22, [sp, #32]
    3294:	aa0003f5 	mov	x21, x0
    3298:	a90363f7 	stp	x23, x24, [sp, #48]
    329c:	f100ba7f 	cmp	x19, #0x2e
    32a0:	54000c88 	b.hi	3430 <_malloc_r+0x1b0>  // b.pmore
    32a4:	f100803f 	cmp	x1, #0x20
    32a8:	54002068 	b.hi	36b4 <_malloc_r+0x434>  // b.pmore
    32ac:	9400030d 	bl	3ee0 <__malloc_lock>
    32b0:	d2800413 	mov	x19, #0x20                  	// #32
    32b4:	d2800a00 	mov	x0, #0x50                  	// #80
    32b8:	52800085 	mov	w5, #0x4                   	// #4
    32bc:	b0000054 	adrp	x20, c000 <IpcSemaphoreServer+0x558>
    32c0:	91280294 	add	x20, x20, #0xa00
    32c4:	8b000280 	add	x0, x20, x0
    32c8:	110008a5 	add	w5, w5, #0x2
    32cc:	d1004000 	sub	x0, x0, #0x10
    32d0:	f9400c01 	ldr	x1, [x0, #24]
    32d4:	eb00003f 	cmp	x1, x0
    32d8:	54002181 	b.ne	3708 <_malloc_r+0x488>  // b.any
    32dc:	f9401284 	ldr	x4, [x20, #32]
    32e0:	91004282 	add	x2, x20, #0x10
    32e4:	eb02009f 	cmp	x4, x2
    32e8:	54000f20 	b.eq	34cc <_malloc_r+0x24c>  // b.none
    32ec:	f9400481 	ldr	x1, [x4, #8]
    32f0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    32f4:	cb130023 	sub	x3, x1, x19
    32f8:	f1007c7f 	cmp	x3, #0x1f
    32fc:	54002d4c 	b.gt	38a4 <_malloc_r+0x624>
    3300:	a9020a82 	stp	x2, x2, [x20, #32]
    3304:	b6f81f23 	tbz	x3, #63, 36e8 <_malloc_r+0x468>
    3308:	f107fc3f 	cmp	x1, #0x1ff
    330c:	54002428 	b.hi	3790 <_malloc_r+0x510>  // b.pmore
    3310:	d343fc22 	lsr	x2, x1, #3
    3314:	d2800021 	mov	x1, #0x1                   	// #1
    3318:	11000440 	add	w0, w2, #0x1
    331c:	13027c42 	asr	w2, w2, #2
    3320:	531f7800 	lsl	w0, w0, #1
    3324:	f9400683 	ldr	x3, [x20, #8]
    3328:	8b20ce80 	add	x0, x20, w0, sxtw #3
    332c:	9ac22021 	lsl	x1, x1, x2
    3330:	aa030021 	orr	x1, x1, x3
    3334:	f85f0402 	ldr	x2, [x0], #-16
    3338:	f9000681 	str	x1, [x20, #8]
    333c:	a9010082 	stp	x2, x0, [x4, #16]
    3340:	f9000804 	str	x4, [x0, #16]
    3344:	f9000c44 	str	x4, [x2, #24]
    3348:	13027ca2 	asr	w2, w5, #2
    334c:	d2800020 	mov	x0, #0x1                   	// #1
    3350:	9ac22000 	lsl	x0, x0, x2
    3354:	eb01001f 	cmp	x0, x1
    3358:	54000c68 	b.hi	34e4 <_malloc_r+0x264>  // b.pmore
    335c:	ea01001f 	tst	x0, x1
    3360:	540000c1 	b.ne	3378 <_malloc_r+0xf8>  // b.any
    3364:	121e74a5 	and	w5, w5, #0xfffffffc
    3368:	d37ff800 	lsl	x0, x0, #1
    336c:	110010a5 	add	w5, w5, #0x4
    3370:	ea01001f 	tst	x0, x1
    3374:	54ffffa0 	b.eq	3368 <_malloc_r+0xe8>  // b.none
    3378:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    337c:	110004a7 	add	w7, w5, #0x1
    3380:	2a0503e8 	mov	w8, w5
    3384:	531f78e7 	lsl	w7, w7, #1
    3388:	8b27cd27 	add	x7, x9, w7, sxtw #3
    338c:	8b070287 	add	x7, x20, x7
    3390:	aa0703e4 	mov	x4, x7
    3394:	f9400c81 	ldr	x1, [x4, #24]
    3398:	14000009 	b	33bc <_malloc_r+0x13c>
    339c:	f9400422 	ldr	x2, [x1, #8]
    33a0:	aa0103e6 	mov	x6, x1
    33a4:	f9400c21 	ldr	x1, [x1, #24]
    33a8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    33ac:	cb130043 	sub	x3, x2, x19
    33b0:	f1007c7f 	cmp	x3, #0x1f
    33b4:	5400238c 	b.gt	3824 <_malloc_r+0x5a4>
    33b8:	b6f82563 	tbz	x3, #63, 3864 <_malloc_r+0x5e4>
    33bc:	eb01009f 	cmp	x4, x1
    33c0:	54fffee1 	b.ne	339c <_malloc_r+0x11c>  // b.any
    33c4:	7100f91f 	cmp	w8, #0x3e
    33c8:	540029cd 	b.le	3900 <_malloc_r+0x680>
    33cc:	91004084 	add	x4, x4, #0x10
    33d0:	11000508 	add	w8, w8, #0x1
    33d4:	f240051f 	tst	x8, #0x3
    33d8:	54fffde1 	b.ne	3394 <_malloc_r+0x114>  // b.any
    33dc:	14000005 	b	33f0 <_malloc_r+0x170>
    33e0:	f85f04e1 	ldr	x1, [x7], #-16
    33e4:	510004a5 	sub	w5, w5, #0x1
    33e8:	eb07003f 	cmp	x1, x7
    33ec:	540035a1 	b.ne	3aa0 <_malloc_r+0x820>  // b.any
    33f0:	f24004bf 	tst	x5, #0x3
    33f4:	54ffff61 	b.ne	33e0 <_malloc_r+0x160>  // b.any
    33f8:	f9400681 	ldr	x1, [x20, #8]
    33fc:	8a200021 	bic	x1, x1, x0
    3400:	f9000681 	str	x1, [x20, #8]
    3404:	d37ff800 	lsl	x0, x0, #1
    3408:	f100001f 	cmp	x0, #0x0
    340c:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    3410:	54000089 	b.ls	3420 <_malloc_r+0x1a0>  // b.plast
    3414:	14000034 	b	34e4 <_malloc_r+0x264>
    3418:	d37ff800 	lsl	x0, x0, #1
    341c:	11001108 	add	w8, w8, #0x4
    3420:	ea01001f 	tst	x0, x1
    3424:	54ffffa0 	b.eq	3418 <_malloc_r+0x198>  // b.none
    3428:	2a0803e5 	mov	w5, w8
    342c:	17ffffd4 	b	337c <_malloc_r+0xfc>
    3430:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    3434:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    3438:	eb02027f 	cmp	x19, x2
    343c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    3440:	540013a8 	b.hi	36b4 <_malloc_r+0x434>  // b.pmore
    3444:	940002a7 	bl	3ee0 <__malloc_lock>
    3448:	f107de7f 	cmp	x19, #0x1f7
    344c:	54002229 	b.ls	3890 <_malloc_r+0x610>  // b.plast
    3450:	d349fe60 	lsr	x0, x19, #9
    3454:	b4001420 	cbz	x0, 36d8 <_malloc_r+0x458>
    3458:	f100101f 	cmp	x0, #0x4
    345c:	54001d08 	b.hi	37fc <_malloc_r+0x57c>  // b.pmore
    3460:	d346fe60 	lsr	x0, x19, #6
    3464:	1100e405 	add	w5, w0, #0x39
    3468:	1100e000 	add	w0, w0, #0x38
    346c:	531f78a4 	lsl	w4, w5, #1
    3470:	937d7c84 	sbfiz	x4, x4, #3, #32
    3474:	b0000054 	adrp	x20, c000 <IpcSemaphoreServer+0x558>
    3478:	91280294 	add	x20, x20, #0xa00
    347c:	8b040284 	add	x4, x20, x4
    3480:	d1004084 	sub	x4, x4, #0x10
    3484:	f9400c81 	ldr	x1, [x4, #24]
    3488:	eb01009f 	cmp	x4, x1
    348c:	540000c1 	b.ne	34a4 <_malloc_r+0x224>  // b.any
    3490:	17ffff93 	b	32dc <_malloc_r+0x5c>
    3494:	b6f815e3 	tbz	x3, #63, 3750 <_malloc_r+0x4d0>
    3498:	f9400c21 	ldr	x1, [x1, #24]
    349c:	eb01009f 	cmp	x4, x1
    34a0:	54fff1e0 	b.eq	32dc <_malloc_r+0x5c>  // b.none
    34a4:	f9400422 	ldr	x2, [x1, #8]
    34a8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    34ac:	cb130043 	sub	x3, x2, x19
    34b0:	f1007c7f 	cmp	x3, #0x1f
    34b4:	54ffff0d 	b.le	3494 <_malloc_r+0x214>
    34b8:	f9401284 	ldr	x4, [x20, #32]
    34bc:	91004282 	add	x2, x20, #0x10
    34c0:	2a0003e5 	mov	w5, w0
    34c4:	eb02009f 	cmp	x4, x2
    34c8:	54fff121 	b.ne	32ec <_malloc_r+0x6c>  // b.any
    34cc:	f9400681 	ldr	x1, [x20, #8]
    34d0:	13027ca2 	asr	w2, w5, #2
    34d4:	d2800020 	mov	x0, #0x1                   	// #1
    34d8:	9ac22000 	lsl	x0, x0, x2
    34dc:	eb01001f 	cmp	x0, x1
    34e0:	54fff3e9 	b.ls	335c <_malloc_r+0xdc>  // b.plast
    34e4:	f9400a97 	ldr	x23, [x20, #16]
    34e8:	f94006f6 	ldr	x22, [x23, #8]
    34ec:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    34f0:	eb18027f 	cmp	x19, x24
    34f4:	cb130300 	sub	x0, x24, x19
    34f8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    34fc:	54000bec 	b.gt	3678 <_malloc_r+0x3f8>
    3500:	d0000041 	adrp	x1, d000 <__malloc_av_+0x600>
    3504:	a90573fb 	stp	x27, x28, [sp, #80]
    3508:	d000005b 	adrp	x27, d000 <__malloc_av_+0x600>
    350c:	f942c021 	ldr	x1, [x1, #1408]
    3510:	d28203e3 	mov	x3, #0x101f                	// #4127
    3514:	f9410b62 	ldr	x2, [x27, #528]
    3518:	8b010261 	add	x1, x19, x1
    351c:	8b030036 	add	x22, x1, x3
    3520:	91008021 	add	x1, x1, #0x20
    3524:	b100045f 	cmn	x2, #0x1
    3528:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    352c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    3530:	aa1503e0 	mov	x0, x21
    3534:	aa1603e1 	mov	x1, x22
    3538:	a9046bf9 	stp	x25, x26, [sp, #64]
    353c:	94000271 	bl	3f00 <_sbrk_r>
    3540:	8b1802fa 	add	x26, x23, x24
    3544:	aa0003f9 	mov	x25, x0
    3548:	b100041f 	cmn	x0, #0x1
    354c:	54001f20 	b.eq	3930 <_malloc_r+0x6b0>  // b.none
    3550:	eb00035f 	cmp	x26, x0
    3554:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    3558:	54001ec1 	b.ne	3930 <_malloc_r+0x6b0>  // b.any
    355c:	d000005c 	adrp	x28, d000 <__malloc_av_+0x600>
    3560:	b9454b81 	ldr	w1, [x28, #1352]
    3564:	0b160021 	add	w1, w1, w22
    3568:	b9054b81 	str	w1, [x28, #1352]
    356c:	eb00035f 	cmp	x26, x0
    3570:	54001ce0 	b.eq	390c <_malloc_r+0x68c>  // b.none
    3574:	f9410b60 	ldr	x0, [x27, #528]
    3578:	b100041f 	cmn	x0, #0x1
    357c:	54001d60 	b.eq	3928 <_malloc_r+0x6a8>  // b.none
    3580:	cb1a033a 	sub	x26, x25, x26
    3584:	0b1a0021 	add	w1, w1, w26
    3588:	b9054b81 	str	w1, [x28, #1352]
    358c:	f2400f3a 	ands	x26, x25, #0xf
    3590:	54001e40 	b.eq	3958 <_malloc_r+0x6d8>  // b.none
    3594:	cb1a0339 	sub	x25, x25, x26
    3598:	d2820201 	mov	x1, #0x1010                	// #4112
    359c:	91004339 	add	x25, x25, #0x10
    35a0:	cb1a0021 	sub	x1, x1, x26
    35a4:	8b16033b 	add	x27, x25, x22
    35a8:	aa1503e0 	mov	x0, x21
    35ac:	cb1b0036 	sub	x22, x1, x27
    35b0:	92402ed6 	and	x22, x22, #0xfff
    35b4:	aa1603e1 	mov	x1, x22
    35b8:	94000252 	bl	3f00 <_sbrk_r>
    35bc:	b100041f 	cmn	x0, #0x1
    35c0:	54002480 	b.eq	3a50 <_malloc_r+0x7d0>  // b.none
    35c4:	cb190000 	sub	x0, x0, x25
    35c8:	2a1603e2 	mov	w2, w22
    35cc:	8b160016 	add	x22, x0, x22
    35d0:	b9454b81 	ldr	w1, [x28, #1352]
    35d4:	b24002d6 	orr	x22, x22, #0x1
    35d8:	f9000a99 	str	x25, [x20, #16]
    35dc:	0b010041 	add	w1, w2, w1
    35e0:	b9054b81 	str	w1, [x28, #1352]
    35e4:	f9000736 	str	x22, [x25, #8]
    35e8:	eb1402ff 	cmp	x23, x20
    35ec:	54002000 	b.eq	39ec <_malloc_r+0x76c>  // b.none
    35f0:	f1007f1f 	cmp	x24, #0x1f
    35f4:	54001cc9 	b.ls	398c <_malloc_r+0x70c>  // b.plast
    35f8:	d1006300 	sub	x0, x24, #0x18
    35fc:	d2800124 	mov	x4, #0x9                   	// #9
    3600:	f94006e2 	ldr	x2, [x23, #8]
    3604:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    3608:	8b0002e3 	add	x3, x23, x0
    360c:	92400042 	and	x2, x2, #0x1
    3610:	aa000042 	orr	x2, x2, x0
    3614:	f90006e2 	str	x2, [x23, #8]
    3618:	f8008c64 	str	x4, [x3, #8]!
    361c:	f9000464 	str	x4, [x3, #8]
    3620:	f1007c1f 	cmp	x0, #0x1f
    3624:	54002088 	b.hi	3a34 <_malloc_r+0x7b4>  // b.pmore
    3628:	f9400736 	ldr	x22, [x25, #8]
    362c:	aa1903f7 	mov	x23, x25
    3630:	d0000040 	adrp	x0, d000 <__malloc_av_+0x600>
    3634:	93407c21 	sxtw	x1, w1
    3638:	f942b802 	ldr	x2, [x0, #1392]
    363c:	eb02003f 	cmp	x1, x2
    3640:	54000049 	b.ls	3648 <_malloc_r+0x3c8>  // b.plast
    3644:	f902b801 	str	x1, [x0, #1392]
    3648:	d0000040 	adrp	x0, d000 <__malloc_av_+0x600>
    364c:	f942bc02 	ldr	x2, [x0, #1400]
    3650:	eb02003f 	cmp	x1, x2
    3654:	54000049 	b.ls	365c <_malloc_r+0x3dc>  // b.plast
    3658:	f902bc01 	str	x1, [x0, #1400]
    365c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    3660:	eb00027f 	cmp	x19, x0
    3664:	cb130000 	sub	x0, x0, x19
    3668:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    366c:	5400194d 	b.le	3994 <_malloc_r+0x714>
    3670:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3674:	a94573fb 	ldp	x27, x28, [sp, #80]
    3678:	8b1302e2 	add	x2, x23, x19
    367c:	b2400273 	orr	x19, x19, #0x1
    3680:	f90006f3 	str	x19, [x23, #8]
    3684:	b2400001 	orr	x1, x0, #0x1
    3688:	f9000a82 	str	x2, [x20, #16]
    368c:	f9000441 	str	x1, [x2, #8]
    3690:	aa1503e0 	mov	x0, x21
    3694:	910042f7 	add	x23, x23, #0x10
    3698:	94000216 	bl	3ef0 <__malloc_unlock>
    369c:	aa1703e0 	mov	x0, x23
    36a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    36a4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    36a8:	a94363f7 	ldp	x23, x24, [sp, #48]
    36ac:	a8c67bfd 	ldp	x29, x30, [sp], #96
    36b0:	d65f03c0 	ret
    36b4:	52800180 	mov	w0, #0xc                   	// #12
    36b8:	d2800017 	mov	x23, #0x0                   	// #0
    36bc:	b90002a0 	str	w0, [x21]
    36c0:	aa1703e0 	mov	x0, x23
    36c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    36c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    36cc:	a94363f7 	ldp	x23, x24, [sp, #48]
    36d0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    36d4:	d65f03c0 	ret
    36d8:	d2808004 	mov	x4, #0x400                 	// #1024
    36dc:	52800805 	mov	w5, #0x40                  	// #64
    36e0:	528007e0 	mov	w0, #0x3f                  	// #63
    36e4:	17ffff64 	b	3474 <_malloc_r+0x1f4>
    36e8:	8b010081 	add	x1, x4, x1
    36ec:	aa1503e0 	mov	x0, x21
    36f0:	91004097 	add	x23, x4, #0x10
    36f4:	f9400422 	ldr	x2, [x1, #8]
    36f8:	b2400042 	orr	x2, x2, #0x1
    36fc:	f9000422 	str	x2, [x1, #8]
    3700:	940001fc 	bl	3ef0 <__malloc_unlock>
    3704:	17ffffef 	b	36c0 <_malloc_r+0x440>
    3708:	a9409022 	ldp	x2, x4, [x1, #8]
    370c:	91004037 	add	x23, x1, #0x10
    3710:	f9400c23 	ldr	x3, [x1, #24]
    3714:	aa1503e0 	mov	x0, x21
    3718:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    371c:	8b020022 	add	x2, x1, x2
    3720:	f9400441 	ldr	x1, [x2, #8]
    3724:	f9000c83 	str	x3, [x4, #24]
    3728:	f9000864 	str	x4, [x3, #16]
    372c:	b2400021 	orr	x1, x1, #0x1
    3730:	f9000441 	str	x1, [x2, #8]
    3734:	940001ef 	bl	3ef0 <__malloc_unlock>
    3738:	aa1703e0 	mov	x0, x23
    373c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3740:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3744:	a94363f7 	ldp	x23, x24, [sp, #48]
    3748:	a8c67bfd 	ldp	x29, x30, [sp], #96
    374c:	d65f03c0 	ret
    3750:	8b020022 	add	x2, x1, x2
    3754:	91004037 	add	x23, x1, #0x10
    3758:	a9410c24 	ldp	x4, x3, [x1, #16]
    375c:	aa1503e0 	mov	x0, x21
    3760:	f9400441 	ldr	x1, [x2, #8]
    3764:	f9000c83 	str	x3, [x4, #24]
    3768:	b2400021 	orr	x1, x1, #0x1
    376c:	f9000864 	str	x4, [x3, #16]
    3770:	f9000441 	str	x1, [x2, #8]
    3774:	940001df 	bl	3ef0 <__malloc_unlock>
    3778:	aa1703e0 	mov	x0, x23
    377c:	a94153f3 	ldp	x19, x20, [sp, #16]
    3780:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3784:	a94363f7 	ldp	x23, x24, [sp, #48]
    3788:	a8c67bfd 	ldp	x29, x30, [sp], #96
    378c:	d65f03c0 	ret
    3790:	d349fc20 	lsr	x0, x1, #9
    3794:	f127fc3f 	cmp	x1, #0x9ff
    3798:	540009e9 	b.ls	38d4 <_malloc_r+0x654>  // b.plast
    379c:	f100501f 	cmp	x0, #0x14
    37a0:	54001068 	b.hi	39ac <_malloc_r+0x72c>  // b.pmore
    37a4:	11017003 	add	w3, w0, #0x5c
    37a8:	11016c02 	add	w2, w0, #0x5b
    37ac:	531f7863 	lsl	w3, w3, #1
    37b0:	937d7c63 	sbfiz	x3, x3, #3, #32
    37b4:	8b030283 	add	x3, x20, x3
    37b8:	f85f0460 	ldr	x0, [x3], #-16
    37bc:	eb00007f 	cmp	x3, x0
    37c0:	54000be0 	b.eq	393c <_malloc_r+0x6bc>  // b.none
    37c4:	d503201f 	nop
    37c8:	f9400402 	ldr	x2, [x0, #8]
    37cc:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    37d0:	eb01005f 	cmp	x2, x1
    37d4:	54000089 	b.ls	37e4 <_malloc_r+0x564>  // b.plast
    37d8:	f9400800 	ldr	x0, [x0, #16]
    37dc:	eb00007f 	cmp	x3, x0
    37e0:	54ffff41 	b.ne	37c8 <_malloc_r+0x548>  // b.any
    37e4:	f9400681 	ldr	x1, [x20, #8]
    37e8:	f9400c03 	ldr	x3, [x0, #24]
    37ec:	a9010c80 	stp	x0, x3, [x4, #16]
    37f0:	f9000864 	str	x4, [x3, #16]
    37f4:	f9000c04 	str	x4, [x0, #24]
    37f8:	17fffed4 	b	3348 <_malloc_r+0xc8>
    37fc:	f100501f 	cmp	x0, #0x14
    3800:	54000769 	b.ls	38ec <_malloc_r+0x66c>  // b.plast
    3804:	f101501f 	cmp	x0, #0x54
    3808:	54000e28 	b.hi	39cc <_malloc_r+0x74c>  // b.pmore
    380c:	d34cfe60 	lsr	x0, x19, #12
    3810:	1101bc05 	add	w5, w0, #0x6f
    3814:	1101b800 	add	w0, w0, #0x6e
    3818:	531f78a4 	lsl	w4, w5, #1
    381c:	937d7c84 	sbfiz	x4, x4, #3, #32
    3820:	17ffff15 	b	3474 <_malloc_r+0x1f4>
    3824:	f94008c7 	ldr	x7, [x6, #16]
    3828:	b2400260 	orr	x0, x19, #0x1
    382c:	f90004c0 	str	x0, [x6, #8]
    3830:	8b1300c4 	add	x4, x6, x19
    3834:	91004285 	add	x5, x20, #0x10
    3838:	b2400068 	orr	x8, x3, #0x1
    383c:	f9000ce1 	str	x1, [x7, #24]
    3840:	910040d7 	add	x23, x6, #0x10
    3844:	f9000827 	str	x7, [x1, #16]
    3848:	aa1503e0 	mov	x0, x21
    384c:	a9021284 	stp	x4, x4, [x20, #32]
    3850:	a9009488 	stp	x8, x5, [x4, #8]
    3854:	f9000c85 	str	x5, [x4, #24]
    3858:	f82268c3 	str	x3, [x6, x2]
    385c:	940001a5 	bl	3ef0 <__malloc_unlock>
    3860:	17ffff98 	b	36c0 <_malloc_r+0x440>
    3864:	8b0200c2 	add	x2, x6, x2
    3868:	aa0603f7 	mov	x23, x6
    386c:	aa1503e0 	mov	x0, x21
    3870:	f9400443 	ldr	x3, [x2, #8]
    3874:	f8410ee4 	ldr	x4, [x23, #16]!
    3878:	b2400063 	orr	x3, x3, #0x1
    387c:	f9000443 	str	x3, [x2, #8]
    3880:	f9000c81 	str	x1, [x4, #24]
    3884:	f9000824 	str	x4, [x1, #16]
    3888:	9400019a 	bl	3ef0 <__malloc_unlock>
    388c:	17ffff8d 	b	36c0 <_malloc_r+0x440>
    3890:	d343fe65 	lsr	x5, x19, #3
    3894:	110004a0 	add	w0, w5, #0x1
    3898:	531f7800 	lsl	w0, w0, #1
    389c:	937d7c00 	sbfiz	x0, x0, #3, #32
    38a0:	17fffe87 	b	32bc <_malloc_r+0x3c>
    38a4:	8b130085 	add	x5, x4, x19
    38a8:	b2400273 	orr	x19, x19, #0x1
    38ac:	f9000493 	str	x19, [x4, #8]
    38b0:	b2400066 	orr	x6, x3, #0x1
    38b4:	a9021685 	stp	x5, x5, [x20, #32]
    38b8:	aa1503e0 	mov	x0, x21
    38bc:	91004097 	add	x23, x4, #0x10
    38c0:	a90088a6 	stp	x6, x2, [x5, #8]
    38c4:	f9000ca2 	str	x2, [x5, #24]
    38c8:	f8216883 	str	x3, [x4, x1]
    38cc:	94000189 	bl	3ef0 <__malloc_unlock>
    38d0:	17ffff7c 	b	36c0 <_malloc_r+0x440>
    38d4:	d346fc20 	lsr	x0, x1, #6
    38d8:	1100e403 	add	w3, w0, #0x39
    38dc:	1100e002 	add	w2, w0, #0x38
    38e0:	531f7863 	lsl	w3, w3, #1
    38e4:	937d7c63 	sbfiz	x3, x3, #3, #32
    38e8:	17ffffb3 	b	37b4 <_malloc_r+0x534>
    38ec:	11017005 	add	w5, w0, #0x5c
    38f0:	11016c00 	add	w0, w0, #0x5b
    38f4:	531f78a4 	lsl	w4, w5, #1
    38f8:	937d7c84 	sbfiz	x4, x4, #3, #32
    38fc:	17fffede 	b	3474 <_malloc_r+0x1f4>
    3900:	11000508 	add	w8, w8, #0x1
    3904:	91008084 	add	x4, x4, #0x20
    3908:	17fffeb2 	b	33d0 <_malloc_r+0x150>
    390c:	f2402f5f 	tst	x26, #0xfff
    3910:	54ffe321 	b.ne	3574 <_malloc_r+0x2f4>  // b.any
    3914:	f9400a97 	ldr	x23, [x20, #16]
    3918:	8b160316 	add	x22, x24, x22
    391c:	b24002d6 	orr	x22, x22, #0x1
    3920:	f90006f6 	str	x22, [x23, #8]
    3924:	17ffff43 	b	3630 <_malloc_r+0x3b0>
    3928:	f9010b79 	str	x25, [x27, #528]
    392c:	17ffff18 	b	358c <_malloc_r+0x30c>
    3930:	f9400a97 	ldr	x23, [x20, #16]
    3934:	f94006f6 	ldr	x22, [x23, #8]
    3938:	17ffff49 	b	365c <_malloc_r+0x3dc>
    393c:	f9400686 	ldr	x6, [x20, #8]
    3940:	13027c42 	asr	w2, w2, #2
    3944:	d2800021 	mov	x1, #0x1                   	// #1
    3948:	9ac22021 	lsl	x1, x1, x2
    394c:	aa060021 	orr	x1, x1, x6
    3950:	f9000681 	str	x1, [x20, #8]
    3954:	17ffffa6 	b	37ec <_malloc_r+0x56c>
    3958:	8b16033a 	add	x26, x25, x22
    395c:	aa1503e0 	mov	x0, x21
    3960:	cb1a03fa 	neg	x26, x26
    3964:	92402f5a 	and	x26, x26, #0xfff
    3968:	aa1a03e1 	mov	x1, x26
    396c:	94000165 	bl	3f00 <_sbrk_r>
    3970:	52800002 	mov	w2, #0x0                   	// #0
    3974:	b100041f 	cmn	x0, #0x1
    3978:	54ffe2c0 	b.eq	35d0 <_malloc_r+0x350>  // b.none
    397c:	cb190000 	sub	x0, x0, x25
    3980:	2a1a03e2 	mov	w2, w26
    3984:	8b1a0016 	add	x22, x0, x26
    3988:	17ffff12 	b	35d0 <_malloc_r+0x350>
    398c:	d2800020 	mov	x0, #0x1                   	// #1
    3990:	f9000720 	str	x0, [x25, #8]
    3994:	aa1503e0 	mov	x0, x21
    3998:	d2800017 	mov	x23, #0x0                   	// #0
    399c:	94000155 	bl	3ef0 <__malloc_unlock>
    39a0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    39a4:	a94573fb 	ldp	x27, x28, [sp, #80]
    39a8:	17ffff46 	b	36c0 <_malloc_r+0x440>
    39ac:	f101501f 	cmp	x0, #0x54
    39b0:	54000228 	b.hi	39f4 <_malloc_r+0x774>  // b.pmore
    39b4:	d34cfc20 	lsr	x0, x1, #12
    39b8:	1101bc03 	add	w3, w0, #0x6f
    39bc:	1101b802 	add	w2, w0, #0x6e
    39c0:	531f7863 	lsl	w3, w3, #1
    39c4:	937d7c63 	sbfiz	x3, x3, #3, #32
    39c8:	17ffff7b 	b	37b4 <_malloc_r+0x534>
    39cc:	f105501f 	cmp	x0, #0x154
    39d0:	54000228 	b.hi	3a14 <_malloc_r+0x794>  // b.pmore
    39d4:	d34ffe60 	lsr	x0, x19, #15
    39d8:	1101e005 	add	w5, w0, #0x78
    39dc:	1101dc00 	add	w0, w0, #0x77
    39e0:	531f78a4 	lsl	w4, w5, #1
    39e4:	937d7c84 	sbfiz	x4, x4, #3, #32
    39e8:	17fffea3 	b	3474 <_malloc_r+0x1f4>
    39ec:	aa1903f7 	mov	x23, x25
    39f0:	17ffff10 	b	3630 <_malloc_r+0x3b0>
    39f4:	f105501f 	cmp	x0, #0x154
    39f8:	54000368 	b.hi	3a64 <_malloc_r+0x7e4>  // b.pmore
    39fc:	d34ffc20 	lsr	x0, x1, #15
    3a00:	1101e003 	add	w3, w0, #0x78
    3a04:	1101dc02 	add	w2, w0, #0x77
    3a08:	531f7863 	lsl	w3, w3, #1
    3a0c:	937d7c63 	sbfiz	x3, x3, #3, #32
    3a10:	17ffff69 	b	37b4 <_malloc_r+0x534>
    3a14:	f115501f 	cmp	x0, #0x554
    3a18:	54000368 	b.hi	3a84 <_malloc_r+0x804>  // b.pmore
    3a1c:	d352fe60 	lsr	x0, x19, #18
    3a20:	1101f405 	add	w5, w0, #0x7d
    3a24:	1101f000 	add	w0, w0, #0x7c
    3a28:	531f78a4 	lsl	w4, w5, #1
    3a2c:	937d7c84 	sbfiz	x4, x4, #3, #32
    3a30:	17fffe91 	b	3474 <_malloc_r+0x1f4>
    3a34:	910042e1 	add	x1, x23, #0x10
    3a38:	aa1503e0 	mov	x0, x21
    3a3c:	94000be5 	bl	69d0 <_free_r>
    3a40:	f9400a97 	ldr	x23, [x20, #16]
    3a44:	b9454b81 	ldr	w1, [x28, #1352]
    3a48:	f94006f6 	ldr	x22, [x23, #8]
    3a4c:	17fffef9 	b	3630 <_malloc_r+0x3b0>
    3a50:	d100435a 	sub	x26, x26, #0x10
    3a54:	52800002 	mov	w2, #0x0                   	// #0
    3a58:	8b1a0376 	add	x22, x27, x26
    3a5c:	cb1902d6 	sub	x22, x22, x25
    3a60:	17fffedc 	b	35d0 <_malloc_r+0x350>
    3a64:	f115501f 	cmp	x0, #0x554
    3a68:	54000168 	b.hi	3a94 <_malloc_r+0x814>  // b.pmore
    3a6c:	d352fc20 	lsr	x0, x1, #18
    3a70:	1101f403 	add	w3, w0, #0x7d
    3a74:	1101f002 	add	w2, w0, #0x7c
    3a78:	531f7863 	lsl	w3, w3, #1
    3a7c:	937d7c63 	sbfiz	x3, x3, #3, #32
    3a80:	17ffff4d 	b	37b4 <_malloc_r+0x534>
    3a84:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    3a88:	52800fe5 	mov	w5, #0x7f                  	// #127
    3a8c:	52800fc0 	mov	w0, #0x7e                  	// #126
    3a90:	17fffe79 	b	3474 <_malloc_r+0x1f4>
    3a94:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    3a98:	52800fc2 	mov	w2, #0x7e                  	// #126
    3a9c:	17ffff46 	b	37b4 <_malloc_r+0x534>
    3aa0:	f9400681 	ldr	x1, [x20, #8]
    3aa4:	17fffe58 	b	3404 <_malloc_r+0x184>
    3aa8:	d503201f 	nop
    3aac:	d503201f 	nop
    3ab0:	d503201f 	nop
    3ab4:	d503201f 	nop
    3ab8:	d503201f 	nop
    3abc:	d503201f 	nop

0000000000003ac0 <memcpy>:
    3ac0:	f9800020 	prfm	pldl1keep, [x1]
    3ac4:	8b020024 	add	x4, x1, x2
    3ac8:	8b020005 	add	x5, x0, x2
    3acc:	f100405f 	cmp	x2, #0x10
    3ad0:	54000209 	b.ls	3b10 <memcpy+0x50>  // b.plast
    3ad4:	f101805f 	cmp	x2, #0x60
    3ad8:	54000648 	b.hi	3ba0 <memcpy+0xe0>  // b.pmore
    3adc:	d1000449 	sub	x9, x2, #0x1
    3ae0:	a9401c26 	ldp	x6, x7, [x1]
    3ae4:	37300469 	tbnz	w9, #6, 3b70 <memcpy+0xb0>
    3ae8:	a97f348c 	ldp	x12, x13, [x4, #-16]
    3aec:	362800a9 	tbz	w9, #5, 3b00 <memcpy+0x40>
    3af0:	a9412428 	ldp	x8, x9, [x1, #16]
    3af4:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    3af8:	a9012408 	stp	x8, x9, [x0, #16]
    3afc:	a93e2caa 	stp	x10, x11, [x5, #-32]
    3b00:	a9001c06 	stp	x6, x7, [x0]
    3b04:	a93f34ac 	stp	x12, x13, [x5, #-16]
    3b08:	d65f03c0 	ret
    3b0c:	d503201f 	nop
    3b10:	f100205f 	cmp	x2, #0x8
    3b14:	540000e3 	b.cc	3b30 <memcpy+0x70>  // b.lo, b.ul, b.last
    3b18:	f9400026 	ldr	x6, [x1]
    3b1c:	f85f8087 	ldur	x7, [x4, #-8]
    3b20:	f9000006 	str	x6, [x0]
    3b24:	f81f80a7 	stur	x7, [x5, #-8]
    3b28:	d65f03c0 	ret
    3b2c:	d503201f 	nop
    3b30:	361000c2 	tbz	w2, #2, 3b48 <memcpy+0x88>
    3b34:	b9400026 	ldr	w6, [x1]
    3b38:	b85fc087 	ldur	w7, [x4, #-4]
    3b3c:	b9000006 	str	w6, [x0]
    3b40:	b81fc0a7 	stur	w7, [x5, #-4]
    3b44:	d65f03c0 	ret
    3b48:	b4000102 	cbz	x2, 3b68 <memcpy+0xa8>
    3b4c:	d341fc49 	lsr	x9, x2, #1
    3b50:	39400026 	ldrb	w6, [x1]
    3b54:	385ff087 	ldurb	w7, [x4, #-1]
    3b58:	38696828 	ldrb	w8, [x1, x9]
    3b5c:	39000006 	strb	w6, [x0]
    3b60:	38296808 	strb	w8, [x0, x9]
    3b64:	381ff0a7 	sturb	w7, [x5, #-1]
    3b68:	d65f03c0 	ret
    3b6c:	d503201f 	nop
    3b70:	a9412428 	ldp	x8, x9, [x1, #16]
    3b74:	a9422c2a 	ldp	x10, x11, [x1, #32]
    3b78:	a943342c 	ldp	x12, x13, [x1, #48]
    3b7c:	a97e0881 	ldp	x1, x2, [x4, #-32]
    3b80:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    3b84:	a9001c06 	stp	x6, x7, [x0]
    3b88:	a9012408 	stp	x8, x9, [x0, #16]
    3b8c:	a9022c0a 	stp	x10, x11, [x0, #32]
    3b90:	a903340c 	stp	x12, x13, [x0, #48]
    3b94:	a93e08a1 	stp	x1, x2, [x5, #-32]
    3b98:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    3b9c:	d65f03c0 	ret
    3ba0:	92400c09 	and	x9, x0, #0xf
    3ba4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3ba8:	a940342c 	ldp	x12, x13, [x1]
    3bac:	cb090021 	sub	x1, x1, x9
    3bb0:	8b090042 	add	x2, x2, x9
    3bb4:	a9411c26 	ldp	x6, x7, [x1, #16]
    3bb8:	a900340c 	stp	x12, x13, [x0]
    3bbc:	a9422428 	ldp	x8, x9, [x1, #32]
    3bc0:	a9432c2a 	ldp	x10, x11, [x1, #48]
    3bc4:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    3bc8:	f1024042 	subs	x2, x2, #0x90
    3bcc:	54000169 	b.ls	3bf8 <memcpy+0x138>  // b.plast
    3bd0:	a9011c66 	stp	x6, x7, [x3, #16]
    3bd4:	a9411c26 	ldp	x6, x7, [x1, #16]
    3bd8:	a9022468 	stp	x8, x9, [x3, #32]
    3bdc:	a9422428 	ldp	x8, x9, [x1, #32]
    3be0:	a9032c6a 	stp	x10, x11, [x3, #48]
    3be4:	a9432c2a 	ldp	x10, x11, [x1, #48]
    3be8:	a984346c 	stp	x12, x13, [x3, #64]!
    3bec:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    3bf0:	f1010042 	subs	x2, x2, #0x40
    3bf4:	54fffee8 	b.hi	3bd0 <memcpy+0x110>  // b.pmore
    3bf8:	a97c0881 	ldp	x1, x2, [x4, #-64]
    3bfc:	a9011c66 	stp	x6, x7, [x3, #16]
    3c00:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    3c04:	a9022468 	stp	x8, x9, [x3, #32]
    3c08:	a97e2488 	ldp	x8, x9, [x4, #-32]
    3c0c:	a9032c6a 	stp	x10, x11, [x3, #48]
    3c10:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    3c14:	a904346c 	stp	x12, x13, [x3, #64]
    3c18:	a93c08a1 	stp	x1, x2, [x5, #-64]
    3c1c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    3c20:	a93e24a8 	stp	x8, x9, [x5, #-32]
    3c24:	a93f2caa 	stp	x10, x11, [x5, #-16]
    3c28:	d65f03c0 	ret
    3c2c:	d503201f 	nop
    3c30:	d503201f 	nop
    3c34:	d503201f 	nop
    3c38:	d503201f 	nop
    3c3c:	d503201f 	nop

0000000000003c40 <memmove>:
    3c40:	cb010005 	sub	x5, x0, x1
    3c44:	f101805f 	cmp	x2, #0x60
    3c48:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    3c4c:	54fff3a2 	b.cs	3ac0 <memcpy>  // b.hs, b.nlast
    3c50:	b40004c5 	cbz	x5, 3ce8 <memmove+0xa8>
    3c54:	8b020004 	add	x4, x0, x2
    3c58:	8b020023 	add	x3, x1, x2
    3c5c:	92400c85 	and	x5, x4, #0xf
    3c60:	a97f346c 	ldp	x12, x13, [x3, #-16]
    3c64:	cb050063 	sub	x3, x3, x5
    3c68:	cb050042 	sub	x2, x2, x5
    3c6c:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3c70:	a93f348c 	stp	x12, x13, [x4, #-16]
    3c74:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3c78:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3c7c:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3c80:	cb050084 	sub	x4, x4, x5
    3c84:	f1020042 	subs	x2, x2, #0x80
    3c88:	54000189 	b.ls	3cb8 <memmove+0x78>  // b.plast
    3c8c:	d503201f 	nop
    3c90:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3c94:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    3c98:	a93e2488 	stp	x8, x9, [x4, #-32]
    3c9c:	a97e2468 	ldp	x8, x9, [x3, #-32]
    3ca0:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3ca4:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    3ca8:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    3cac:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    3cb0:	f1010042 	subs	x2, x2, #0x40
    3cb4:	54fffee8 	b.hi	3c90 <memmove+0x50>  // b.pmore
    3cb8:	a9431422 	ldp	x2, x5, [x1, #48]
    3cbc:	a93f1c86 	stp	x6, x7, [x4, #-16]
    3cc0:	a9421c26 	ldp	x6, x7, [x1, #32]
    3cc4:	a93e2488 	stp	x8, x9, [x4, #-32]
    3cc8:	a9412428 	ldp	x8, x9, [x1, #16]
    3ccc:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    3cd0:	a9402c2a 	ldp	x10, x11, [x1]
    3cd4:	a93c348c 	stp	x12, x13, [x4, #-64]
    3cd8:	a9031402 	stp	x2, x5, [x0, #48]
    3cdc:	a9021c06 	stp	x6, x7, [x0, #32]
    3ce0:	a9012408 	stp	x8, x9, [x0, #16]
    3ce4:	a9002c0a 	stp	x10, x11, [x0]
    3ce8:	d65f03c0 	ret
    3cec:	d503201f 	nop
    3cf0:	d503201f 	nop
    3cf4:	d503201f 	nop
    3cf8:	d503201f 	nop
    3cfc:	d503201f 	nop

0000000000003d00 <memset>:
    3d00:	4e010c20 	dup	v0.16b, w1
    3d04:	8b020004 	add	x4, x0, x2
    3d08:	f101805f 	cmp	x2, #0x60
    3d0c:	540003c8 	b.hi	3d84 <memset+0x84>  // b.pmore
    3d10:	f100405f 	cmp	x2, #0x10
    3d14:	54000202 	b.cs	3d54 <memset+0x54>  // b.hs, b.nlast
    3d18:	4e083c01 	mov	x1, v0.d[0]
    3d1c:	361800a2 	tbz	w2, #3, 3d30 <memset+0x30>
    3d20:	f9000001 	str	x1, [x0]
    3d24:	f81f8081 	stur	x1, [x4, #-8]
    3d28:	d65f03c0 	ret
    3d2c:	d503201f 	nop
    3d30:	36100082 	tbz	w2, #2, 3d40 <memset+0x40>
    3d34:	b9000001 	str	w1, [x0]
    3d38:	b81fc081 	stur	w1, [x4, #-4]
    3d3c:	d65f03c0 	ret
    3d40:	b4000082 	cbz	x2, 3d50 <memset+0x50>
    3d44:	39000001 	strb	w1, [x0]
    3d48:	36080042 	tbz	w2, #1, 3d50 <memset+0x50>
    3d4c:	781fe081 	sturh	w1, [x4, #-2]
    3d50:	d65f03c0 	ret
    3d54:	3d800000 	str	q0, [x0]
    3d58:	373000c2 	tbnz	w2, #6, 3d70 <memset+0x70>
    3d5c:	3c9f0080 	stur	q0, [x4, #-16]
    3d60:	36280062 	tbz	w2, #5, 3d6c <memset+0x6c>
    3d64:	3d800400 	str	q0, [x0, #16]
    3d68:	3c9e0080 	stur	q0, [x4, #-32]
    3d6c:	d65f03c0 	ret
    3d70:	3d800400 	str	q0, [x0, #16]
    3d74:	ad010000 	stp	q0, q0, [x0, #32]
    3d78:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3d7c:	d65f03c0 	ret
    3d80:	d503201f 	nop
    3d84:	12001c21 	and	w1, w1, #0xff
    3d88:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    3d8c:	3d800000 	str	q0, [x0]
    3d90:	f104005f 	cmp	x2, #0x100
    3d94:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    3d98:	54000180 	b.eq	3dc8 <memset+0xc8>  // b.none
    3d9c:	cb030082 	sub	x2, x4, x3
    3da0:	d1004063 	sub	x3, x3, #0x10
    3da4:	d1014042 	sub	x2, x2, #0x50
    3da8:	ad010060 	stp	q0, q0, [x3, #32]
    3dac:	ad820060 	stp	q0, q0, [x3, #64]!
    3db0:	f1010042 	subs	x2, x2, #0x40
    3db4:	54ffffa8 	b.hi	3da8 <memset+0xa8>  // b.pmore
    3db8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3dbc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3dc0:	d65f03c0 	ret
    3dc4:	d503201f 	nop
    3dc8:	d53b00e5 	mrs	x5, dczid_el0
    3dcc:	3727fe85 	tbnz	w5, #4, 3d9c <memset+0x9c>
    3dd0:	12000ca5 	and	w5, w5, #0xf
    3dd4:	710010bf 	cmp	w5, #0x4
    3dd8:	54000281 	b.ne	3e28 <memset+0x128>  // b.any
    3ddc:	3d800460 	str	q0, [x3, #16]
    3de0:	ad010060 	stp	q0, q0, [x3, #32]
    3de4:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    3de8:	ad020060 	stp	q0, q0, [x3, #64]
    3dec:	ad030060 	stp	q0, q0, [x3, #96]
    3df0:	cb030082 	sub	x2, x4, x3
    3df4:	d1040042 	sub	x2, x2, #0x100
    3df8:	91020063 	add	x3, x3, #0x80
    3dfc:	d503201f 	nop
    3e00:	d50b7423 	dc	zva, x3
    3e04:	91010063 	add	x3, x3, #0x40
    3e08:	f1010042 	subs	x2, x2, #0x40
    3e0c:	54ffffa8 	b.hi	3e00 <memset+0x100>  // b.pmore
    3e10:	ad000060 	stp	q0, q0, [x3]
    3e14:	ad010060 	stp	q0, q0, [x3, #32]
    3e18:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3e1c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3e20:	d65f03c0 	ret
    3e24:	d503201f 	nop
    3e28:	710014bf 	cmp	w5, #0x5
    3e2c:	54000241 	b.ne	3e74 <memset+0x174>  // b.any
    3e30:	3d800460 	str	q0, [x3, #16]
    3e34:	ad010060 	stp	q0, q0, [x3, #32]
    3e38:	ad020060 	stp	q0, q0, [x3, #64]
    3e3c:	ad030060 	stp	q0, q0, [x3, #96]
    3e40:	9279e063 	and	x3, x3, #0xffffffffffffff80
    3e44:	cb030082 	sub	x2, x4, x3
    3e48:	d1040042 	sub	x2, x2, #0x100
    3e4c:	91020063 	add	x3, x3, #0x80
    3e50:	d50b7423 	dc	zva, x3
    3e54:	91020063 	add	x3, x3, #0x80
    3e58:	f1020042 	subs	x2, x2, #0x80
    3e5c:	54ffffa8 	b.hi	3e50 <memset+0x150>  // b.pmore
    3e60:	ad3c0080 	stp	q0, q0, [x4, #-128]
    3e64:	ad3d0080 	stp	q0, q0, [x4, #-96]
    3e68:	ad3e0080 	stp	q0, q0, [x4, #-64]
    3e6c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    3e70:	d65f03c0 	ret
    3e74:	52800086 	mov	w6, #0x4                   	// #4
    3e78:	1ac520c7 	lsl	w7, w6, w5
    3e7c:	910100e5 	add	x5, x7, #0x40
    3e80:	eb05005f 	cmp	x2, x5
    3e84:	54fff8c3 	b.cc	3d9c <memset+0x9c>  // b.lo, b.ul, b.last
    3e88:	d10004e6 	sub	x6, x7, #0x1
    3e8c:	8b070065 	add	x5, x3, x7
    3e90:	91004063 	add	x3, x3, #0x10
    3e94:	eb0300a2 	subs	x2, x5, x3
    3e98:	8a2600a5 	bic	x5, x5, x6
    3e9c:	540000a0 	b.eq	3eb0 <memset+0x1b0>  // b.none
    3ea0:	ac820060 	stp	q0, q0, [x3], #64
    3ea4:	ad3f0060 	stp	q0, q0, [x3, #-32]
    3ea8:	f1010042 	subs	x2, x2, #0x40
    3eac:	54ffffa8 	b.hi	3ea0 <memset+0x1a0>  // b.pmore
    3eb0:	aa0503e3 	mov	x3, x5
    3eb4:	cb050082 	sub	x2, x4, x5
    3eb8:	eb070042 	subs	x2, x2, x7
    3ebc:	540000a3 	b.cc	3ed0 <memset+0x1d0>  // b.lo, b.ul, b.last
    3ec0:	d50b7423 	dc	zva, x3
    3ec4:	8b070063 	add	x3, x3, x7
    3ec8:	eb070042 	subs	x2, x2, x7
    3ecc:	54ffffa2 	b.cs	3ec0 <memset+0x1c0>  // b.hs, b.nlast
    3ed0:	8b070042 	add	x2, x2, x7
    3ed4:	d1008063 	sub	x3, x3, #0x20
    3ed8:	17ffffb6 	b	3db0 <memset+0xb0>
    3edc:	d503201f 	nop

0000000000003ee0 <__malloc_lock>:
    3ee0:	d65f03c0 	ret
    3ee4:	d503201f 	nop
    3ee8:	d503201f 	nop
    3eec:	d503201f 	nop

0000000000003ef0 <__malloc_unlock>:
    3ef0:	d65f03c0 	ret
    3ef4:	d503201f 	nop
    3ef8:	d503201f 	nop
    3efc:	d503201f 	nop

0000000000003f00 <_sbrk_r>:
    3f00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3f04:	910003fd 	mov	x29, sp
    3f08:	a90153f3 	stp	x19, x20, [sp, #16]
    3f0c:	d0000054 	adrp	x20, d000 <__malloc_av_+0x600>
    3f10:	aa0003f3 	mov	x19, x0
    3f14:	b9083a9f 	str	wzr, [x20, #2104]
    3f18:	aa0103e0 	mov	x0, x1
    3f1c:	97fffc05 	bl	2f30 <_sbrk>
    3f20:	b100041f 	cmn	x0, #0x1
    3f24:	54000080 	b.eq	3f34 <_sbrk_r+0x34>  // b.none
    3f28:	a94153f3 	ldp	x19, x20, [sp, #16]
    3f2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3f30:	d65f03c0 	ret
    3f34:	b9483a81 	ldr	w1, [x20, #2104]
    3f38:	34ffff81 	cbz	w1, 3f28 <_sbrk_r+0x28>
    3f3c:	b9000261 	str	w1, [x19]
    3f40:	a94153f3 	ldp	x19, x20, [sp, #16]
    3f44:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3f48:	d65f03c0 	ret
    3f4c:	d503201f 	nop

0000000000003f50 <__sprint_r.part.0>:
    3f50:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    3f54:	910003fd 	mov	x29, sp
    3f58:	b940ac23 	ldr	w3, [x1, #172]
    3f5c:	a90363f7 	stp	x23, x24, [sp, #48]
    3f60:	aa0203f8 	mov	x24, x2
    3f64:	36680563 	tbz	w3, #13, 4010 <__sprint_r.part.0+0xc0>
    3f68:	a9025bf5 	stp	x21, x22, [sp, #32]
    3f6c:	aa0003f5 	mov	x21, x0
    3f70:	f9400840 	ldr	x0, [x2, #16]
    3f74:	a90153f3 	stp	x19, x20, [sp, #16]
    3f78:	aa0103f4 	mov	x20, x1
    3f7c:	a9046bf9 	stp	x25, x26, [sp, #64]
    3f80:	f940005a 	ldr	x26, [x2]
    3f84:	b40003c0 	cbz	x0, 3ffc <__sprint_r.part.0+0xac>
    3f88:	a9406756 	ldp	x22, x25, [x26]
    3f8c:	d342ff39 	lsr	x25, x25, #2
    3f90:	2a1903f7 	mov	w23, w25
    3f94:	7100033f 	cmp	w25, #0x0
    3f98:	540002ad 	b.le	3fec <__sprint_r.part.0+0x9c>
    3f9c:	d2800013 	mov	x19, #0x0                   	// #0
    3fa0:	14000003 	b	3fac <__sprint_r.part.0+0x5c>
    3fa4:	6b1302ff 	cmp	w23, w19
    3fa8:	5400020d 	b.le	3fe8 <__sprint_r.part.0+0x98>
    3fac:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    3fb0:	aa1403e2 	mov	x2, x20
    3fb4:	aa1503e0 	mov	x0, x21
    3fb8:	91000673 	add	x19, x19, #0x1
    3fbc:	94000a15 	bl	6810 <_fputwc_r>
    3fc0:	3100041f 	cmn	w0, #0x1
    3fc4:	54ffff01 	b.ne	3fa4 <__sprint_r.part.0+0x54>  // b.any
    3fc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3fcc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3fd0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3fd4:	b9000b1f 	str	wzr, [x24, #8]
    3fd8:	f9000b1f 	str	xzr, [x24, #16]
    3fdc:	a94363f7 	ldp	x23, x24, [sp, #48]
    3fe0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    3fe4:	d65f03c0 	ret
    3fe8:	f9400b00 	ldr	x0, [x24, #16]
    3fec:	cb39c800 	sub	x0, x0, w25, sxtw #2
    3ff0:	f9000b00 	str	x0, [x24, #16]
    3ff4:	9100435a 	add	x26, x26, #0x10
    3ff8:	b5fffc80 	cbnz	x0, 3f88 <__sprint_r.part.0+0x38>
    3ffc:	52800000 	mov	w0, #0x0                   	// #0
    4000:	a94153f3 	ldp	x19, x20, [sp, #16]
    4004:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4008:	a9446bf9 	ldp	x25, x26, [sp, #64]
    400c:	17fffff2 	b	3fd4 <__sprint_r.part.0+0x84>
    4010:	94000b2c 	bl	6cc0 <__sfvwrite_r>
    4014:	b9000b1f 	str	wzr, [x24, #8]
    4018:	f9000b1f 	str	xzr, [x24, #16]
    401c:	a94363f7 	ldp	x23, x24, [sp, #48]
    4020:	a8c57bfd 	ldp	x29, x30, [sp], #80
    4024:	d65f03c0 	ret
    4028:	d503201f 	nop
    402c:	d503201f 	nop

0000000000004030 <__sprint_r>:
    4030:	f9400844 	ldr	x4, [x2, #16]
    4034:	b4000044 	cbz	x4, 403c <__sprint_r+0xc>
    4038:	17ffffc6 	b	3f50 <__sprint_r.part.0>
    403c:	52800000 	mov	w0, #0x0                   	// #0
    4040:	b900085f 	str	wzr, [x2, #8]
    4044:	d65f03c0 	ret
    4048:	d503201f 	nop
    404c:	d503201f 	nop

0000000000004050 <_vfiprintf_r>:
    4050:	d10843ff 	sub	sp, sp, #0x210
    4054:	a9007bfd 	stp	x29, x30, [sp]
    4058:	910003fd 	mov	x29, sp
    405c:	a9025bf5 	stp	x21, x22, [sp, #32]
    4060:	aa0303f5 	mov	x21, x3
    4064:	f9400063 	ldr	x3, [x3]
    4068:	f90037e3 	str	x3, [sp, #104]
    406c:	f94006a3 	ldr	x3, [x21, #8]
    4070:	f90043e3 	str	x3, [sp, #128]
    4074:	b9401aa3 	ldr	w3, [x21, #24]
    4078:	a90153f3 	stp	x19, x20, [sp, #16]
    407c:	aa0003f3 	mov	x19, x0
    4080:	aa0203f4 	mov	x20, x2
    4084:	9103e3e0 	add	x0, sp, #0xf8
    4088:	d2800102 	mov	x2, #0x8                   	// #8
    408c:	a9046bf9 	stp	x25, x26, [sp, #64]
    4090:	aa0103f9 	mov	x25, x1
    4094:	52800001 	mov	w1, #0x0                   	// #0
    4098:	b900b3e3 	str	w3, [sp, #176]
    409c:	97ffff19 	bl	3d00 <memset>
    40a0:	b4000073 	cbz	x19, 40ac <_vfiprintf_r+0x5c>
    40a4:	b9405260 	ldr	w0, [x19, #80]
    40a8:	34002020 	cbz	w0, 44ac <_vfiprintf_r+0x45c>
    40ac:	79c02321 	ldrsh	w1, [x25, #16]
    40b0:	12003c20 	and	w0, w1, #0xffff
    40b4:	376800e1 	tbnz	w1, #13, 40d0 <_vfiprintf_r+0x80>
    40b8:	b940af22 	ldr	w2, [x25, #172]
    40bc:	32130021 	orr	w1, w1, #0x2000
    40c0:	12003c20 	and	w0, w1, #0xffff
    40c4:	79002321 	strh	w1, [x25, #16]
    40c8:	12127841 	and	w1, w2, #0xffffdfff
    40cc:	b900af21 	str	w1, [x25, #172]
    40d0:	36180520 	tbz	w0, #3, 4174 <_vfiprintf_r+0x124>
    40d4:	f9400f21 	ldr	x1, [x25, #24]
    40d8:	b40004e1 	cbz	x1, 4174 <_vfiprintf_r+0x124>
    40dc:	52800341 	mov	w1, #0x1a                  	// #26
    40e0:	0a010000 	and	w0, w0, w1
    40e4:	7100281f 	cmp	w0, #0xa
    40e8:	54000580 	b.eq	4198 <_vfiprintf_r+0x148>  // b.none
    40ec:	a90573fb 	stp	x27, x28, [sp, #80]
    40f0:	910643fc 	add	x28, sp, #0x190
    40f4:	b0000055 	adrp	x21, d000 <__malloc_av_+0x600>
    40f8:	aa1c03fb 	mov	x27, x28
    40fc:	910902b5 	add	x21, x21, #0x240
    4100:	f0000020 	adrp	x0, b000 <_fini+0xcc>
    4104:	9110c000 	add	x0, x0, #0x430
    4108:	a90363f7 	stp	x23, x24, [sp, #48]
    410c:	b90067ff 	str	wzr, [sp, #100]
    4110:	f9003fe0 	str	x0, [sp, #120]
    4114:	f90047ff 	str	xzr, [sp, #136]
    4118:	a909ffff 	stp	xzr, xzr, [sp, #152]
    411c:	f90057ff 	str	xzr, [sp, #168]
    4120:	f9008bfc 	str	x28, [sp, #272]
    4124:	b9011bff 	str	wzr, [sp, #280]
    4128:	f90093ff 	str	xzr, [sp, #288]
    412c:	aa1403f7 	mov	x23, x20
    4130:	f94076b6 	ldr	x22, [x21, #232]
    4134:	94000fa7 	bl	7fd0 <__locale_mb_cur_max>
    4138:	9103e3e4 	add	x4, sp, #0xf8
    413c:	93407c03 	sxtw	x3, w0
    4140:	aa1703e2 	mov	x2, x23
    4144:	9103d3e1 	add	x1, sp, #0xf4
    4148:	aa1303e0 	mov	x0, x19
    414c:	d63f02c0 	blr	x22
    4150:	7100001f 	cmp	w0, #0x0
    4154:	340004a0 	cbz	w0, 41e8 <_vfiprintf_r+0x198>
    4158:	540003ab 	b.lt	41cc <_vfiprintf_r+0x17c>  // b.tstop
    415c:	b940f7e1 	ldr	w1, [sp, #244]
    4160:	7100943f 	cmp	w1, #0x25
    4164:	54001720 	b.eq	4448 <_vfiprintf_r+0x3f8>  // b.none
    4168:	93407c00 	sxtw	x0, w0
    416c:	8b0002f7 	add	x23, x23, x0
    4170:	17fffff0 	b	4130 <_vfiprintf_r+0xe0>
    4174:	aa1903e1 	mov	x1, x25
    4178:	aa1303e0 	mov	x0, x19
    417c:	9400072d 	bl	5e30 <__swsetup_r>
    4180:	3500b220 	cbnz	w0, 57c4 <_vfiprintf_r+0x1774>
    4184:	79402320 	ldrh	w0, [x25, #16]
    4188:	52800341 	mov	w1, #0x1a                  	// #26
    418c:	0a010000 	and	w0, w0, w1
    4190:	7100281f 	cmp	w0, #0xa
    4194:	54fffac1 	b.ne	40ec <_vfiprintf_r+0x9c>  // b.any
    4198:	79c02720 	ldrsh	w0, [x25, #18]
    419c:	37fffa80 	tbnz	w0, #31, 40ec <_vfiprintf_r+0x9c>
    41a0:	a9401ea6 	ldp	x6, x7, [x21]
    41a4:	aa1403e2 	mov	x2, x20
    41a8:	a94116a4 	ldp	x4, x5, [x21, #16]
    41ac:	aa1903e1 	mov	x1, x25
    41b0:	aa1303e0 	mov	x0, x19
    41b4:	910303e3 	add	x3, sp, #0xc0
    41b8:	a90c1fe6 	stp	x6, x7, [sp, #192]
    41bc:	a90d17e4 	stp	x4, x5, [sp, #208]
    41c0:	9400068c 	bl	5bf0 <__sbprintf>
    41c4:	b90067e0 	str	w0, [sp, #100]
    41c8:	140000b2 	b	4490 <_vfiprintf_r+0x440>
    41cc:	9103e3e0 	add	x0, sp, #0xf8
    41d0:	d2800102 	mov	x2, #0x8                   	// #8
    41d4:	52800001 	mov	w1, #0x0                   	// #0
    41d8:	97fffeca 	bl	3d00 <memset>
    41dc:	d2800020 	mov	x0, #0x1                   	// #1
    41e0:	8b0002f7 	add	x23, x23, x0
    41e4:	17ffffd3 	b	4130 <_vfiprintf_r+0xe0>
    41e8:	2a0003f6 	mov	w22, w0
    41ec:	cb1402e0 	sub	x0, x23, x20
    41f0:	2a0003f8 	mov	w24, w0
    41f4:	34008d60 	cbz	w0, 53a0 <_vfiprintf_r+0x1350>
    41f8:	f94093e2 	ldr	x2, [sp, #288]
    41fc:	93407f01 	sxtw	x1, w24
    4200:	b9411be0 	ldr	w0, [sp, #280]
    4204:	8b020022 	add	x2, x1, x2
    4208:	a9000774 	stp	x20, x1, [x27]
    420c:	11000400 	add	w0, w0, #0x1
    4210:	b9011be0 	str	w0, [sp, #280]
    4214:	f90093e2 	str	x2, [sp, #288]
    4218:	71001c1f 	cmp	w0, #0x7
    421c:	5400120d 	b.le	445c <_vfiprintf_r+0x40c>
    4220:	b4006222 	cbz	x2, 4e64 <_vfiprintf_r+0xe14>
    4224:	910443e2 	add	x2, sp, #0x110
    4228:	aa1903e1 	mov	x1, x25
    422c:	aa1303e0 	mov	x0, x19
    4230:	97ffff48 	bl	3f50 <__sprint_r.part.0>
    4234:	35001260 	cbnz	w0, 4480 <_vfiprintf_r+0x430>
    4238:	910643fb 	add	x27, sp, #0x190
    423c:	b94067e0 	ldr	w0, [sp, #100]
    4240:	0b180000 	add	w0, w0, w24
    4244:	b90067e0 	str	w0, [sp, #100]
    4248:	34008ad6 	cbz	w22, 53a0 <_vfiprintf_r+0x1350>
    424c:	394006e0 	ldrb	w0, [x23, #1]
    4250:	12800004 	mov	w4, #0xffffffff            	// #-1
    4254:	910006f4 	add	x20, x23, #0x1
    4258:	2a0403f6 	mov	w22, w4
    425c:	5280001c 	mov	w28, #0x0                   	// #0
    4260:	b90063ff 	str	wzr, [sp, #96]
    4264:	3903bfff 	strb	wzr, [sp, #239]
    4268:	91000694 	add	x20, x20, #0x1
    426c:	51008001 	sub	w1, w0, #0x20
    4270:	7101683f 	cmp	w1, #0x5a
    4274:	54000c49 	b.ls	43fc <_vfiprintf_r+0x3ac>  // b.plast
    4278:	34008940 	cbz	w0, 53a0 <_vfiprintf_r+0x1350>
    427c:	52800036 	mov	w22, #0x1                   	// #1
    4280:	9104a3fa 	add	x26, sp, #0x128
    4284:	2a1603f7 	mov	w23, w22
    4288:	3903bfff 	strb	wzr, [sp, #239]
    428c:	3904a3e0 	strb	w0, [sp, #296]
    4290:	52800004 	mov	w4, #0x0                   	// #0
    4294:	f9003bff 	str	xzr, [sp, #112]
    4298:	b9411be1 	ldr	w1, [sp, #280]
    429c:	11000ac0 	add	w0, w22, #0x2
    42a0:	721f038a 	ands	w10, w28, #0x2
    42a4:	52801098 	mov	w24, #0x84                  	// #132
    42a8:	11000422 	add	w2, w1, #0x1
    42ac:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    42b0:	2a0203e8 	mov	w8, w2
    42b4:	6a180398 	ands	w24, w28, w24
    42b8:	f94093e0 	ldr	x0, [sp, #288]
    42bc:	540000a1 	b.ne	42d0 <_vfiprintf_r+0x280>  // b.any
    42c0:	b94063e3 	ldr	w3, [sp, #96]
    42c4:	4b160069 	sub	w9, w3, w22
    42c8:	7100013f 	cmp	w9, #0x0
    42cc:	5400496c 	b.gt	4bf8 <_vfiprintf_r+0xba8>
    42d0:	3943bfe2 	ldrb	w2, [sp, #239]
    42d4:	340001a2 	cbz	w2, 4308 <_vfiprintf_r+0x2b8>
    42d8:	9103bfe1 	add	x1, sp, #0xef
    42dc:	91000400 	add	x0, x0, #0x1
    42e0:	f9000361 	str	x1, [x27]
    42e4:	d2800021 	mov	x1, #0x1                   	// #1
    42e8:	f9000761 	str	x1, [x27, #8]
    42ec:	b9011be8 	str	w8, [sp, #280]
    42f0:	f90093e0 	str	x0, [sp, #288]
    42f4:	71001d1f 	cmp	w8, #0x7
    42f8:	540044cc 	b.gt	4b90 <_vfiprintf_r+0xb40>
    42fc:	2a0803e1 	mov	w1, w8
    4300:	9100437b 	add	x27, x27, #0x10
    4304:	11000508 	add	w8, w8, #0x1
    4308:	340002ca 	cbz	w10, 4360 <_vfiprintf_r+0x310>
    430c:	91000800 	add	x0, x0, #0x2
    4310:	9103c3e2 	add	x2, sp, #0xf0
    4314:	d2800041 	mov	x1, #0x2                   	// #2
    4318:	a9000762 	stp	x2, x1, [x27]
    431c:	b9011be8 	str	w8, [sp, #280]
    4320:	f90093e0 	str	x0, [sp, #288]
    4324:	71001d1f 	cmp	w8, #0x7
    4328:	5400460d 	b.le	4be8 <_vfiprintf_r+0xb98>
    432c:	b4005b20 	cbz	x0, 4e90 <_vfiprintf_r+0xe40>
    4330:	910443e2 	add	x2, sp, #0x110
    4334:	aa1903e1 	mov	x1, x25
    4338:	aa1303e0 	mov	x0, x19
    433c:	b90093e4 	str	w4, [sp, #144]
    4340:	97ffff04 	bl	3f50 <__sprint_r.part.0>
    4344:	35000940 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4348:	b9411be1 	ldr	w1, [sp, #280]
    434c:	910643fb 	add	x27, sp, #0x190
    4350:	b94093e4 	ldr	w4, [sp, #144]
    4354:	f94093e0 	ldr	x0, [sp, #288]
    4358:	11000428 	add	w8, w1, #0x1
    435c:	d503201f 	nop
    4360:	7102031f 	cmp	w24, #0x80
    4364:	54002f80 	b.eq	4954 <_vfiprintf_r+0x904>  // b.none
    4368:	4b170098 	sub	w24, w4, w23
    436c:	7100031f 	cmp	w24, #0x0
    4370:	540038cc 	b.gt	4a88 <_vfiprintf_r+0xa38>
    4374:	93407ef7 	sxtw	x23, w23
    4378:	a9005f7a 	stp	x26, x23, [x27]
    437c:	8b0002e0 	add	x0, x23, x0
    4380:	b9011be8 	str	w8, [sp, #280]
    4384:	f90093e0 	str	x0, [sp, #288]
    4388:	71001d1f 	cmp	w8, #0x7
    438c:	540029ad 	b.le	48c0 <_vfiprintf_r+0x870>
    4390:	b4004ba0 	cbz	x0, 4d04 <_vfiprintf_r+0xcb4>
    4394:	910443e2 	add	x2, sp, #0x110
    4398:	aa1903e1 	mov	x1, x25
    439c:	aa1303e0 	mov	x0, x19
    43a0:	97fffeec 	bl	3f50 <__sprint_r.part.0>
    43a4:	35000640 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    43a8:	f94093e0 	ldr	x0, [sp, #288]
    43ac:	910643e5 	add	x5, sp, #0x190
    43b0:	361000bc 	tbz	w28, #2, 43c4 <_vfiprintf_r+0x374>
    43b4:	b94063e1 	ldr	w1, [sp, #96]
    43b8:	4b160037 	sub	w23, w1, w22
    43bc:	710002ff 	cmp	w23, #0x0
    43c0:	54004b0c 	b.gt	4d20 <_vfiprintf_r+0xcd0>
    43c4:	b94063e1 	ldr	w1, [sp, #96]
    43c8:	6b16003f 	cmp	w1, w22
    43cc:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    43d0:	b94067e1 	ldr	w1, [sp, #100]
    43d4:	0b030021 	add	w1, w1, w3
    43d8:	b90067e1 	str	w1, [sp, #100]
    43dc:	b5003c60 	cbnz	x0, 4b68 <_vfiprintf_r+0xb18>
    43e0:	f9403be1 	ldr	x1, [sp, #112]
    43e4:	b9011bff 	str	wzr, [sp, #280]
    43e8:	910643fb 	add	x27, sp, #0x190
    43ec:	b4ffea01 	cbz	x1, 412c <_vfiprintf_r+0xdc>
    43f0:	aa1303e0 	mov	x0, x19
    43f4:	94000977 	bl	69d0 <_free_r>
    43f8:	17ffff4d 	b	412c <_vfiprintf_r+0xdc>
    43fc:	f9403fe2 	ldr	x2, [sp, #120]
    4400:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    4404:	10000062 	adr	x2, 4410 <_vfiprintf_r+0x3c0>
    4408:	8b21a841 	add	x1, x2, w1, sxth #2
    440c:	d61f0020 	br	x1
    4410:	5100c001 	sub	w1, w0, #0x30
    4414:	b90063ff 	str	wzr, [sp, #96]
    4418:	b94063e0 	ldr	w0, [sp, #96]
    441c:	0b000802 	add	w2, w0, w0, lsl #2
    4420:	38401680 	ldrb	w0, [x20], #1
    4424:	0b020421 	add	w1, w1, w2, lsl #1
    4428:	b90063e1 	str	w1, [sp, #96]
    442c:	5100c001 	sub	w1, w0, #0x30
    4430:	7100243f 	cmp	w1, #0x9
    4434:	54ffff29 	b.ls	4418 <_vfiprintf_r+0x3c8>  // b.plast
    4438:	17ffff8d 	b	426c <_vfiprintf_r+0x21c>
    443c:	39400280 	ldrb	w0, [x20]
    4440:	321c039c 	orr	w28, w28, #0x10
    4444:	17ffff89 	b	4268 <_vfiprintf_r+0x218>
    4448:	2a0003f6 	mov	w22, w0
    444c:	cb1402e0 	sub	x0, x23, x20
    4450:	2a0003f8 	mov	w24, w0
    4454:	34ffefc0 	cbz	w0, 424c <_vfiprintf_r+0x1fc>
    4458:	17ffff68 	b	41f8 <_vfiprintf_r+0x1a8>
    445c:	9100437b 	add	x27, x27, #0x10
    4460:	17ffff77 	b	423c <_vfiprintf_r+0x1ec>
    4464:	aa1903f3 	mov	x19, x25
    4468:	aa1403f9 	mov	x25, x20
    446c:	f9403be0 	ldr	x0, [sp, #112]
    4470:	b4000080 	cbz	x0, 4480 <_vfiprintf_r+0x430>
    4474:	f9403be1 	ldr	x1, [sp, #112]
    4478:	aa1303e0 	mov	x0, x19
    447c:	94000955 	bl	69d0 <_free_r>
    4480:	79c02320 	ldrsh	w0, [x25, #16]
    4484:	a94363f7 	ldp	x23, x24, [sp, #48]
    4488:	a94573fb 	ldp	x27, x28, [sp, #80]
    448c:	373099c0 	tbnz	w0, #6, 57c4 <_vfiprintf_r+0x1774>
    4490:	b94067e0 	ldr	w0, [sp, #100]
    4494:	a9407bfd 	ldp	x29, x30, [sp]
    4498:	a94153f3 	ldp	x19, x20, [sp, #16]
    449c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    44a0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    44a4:	910843ff 	add	sp, sp, #0x210
    44a8:	d65f03c0 	ret
    44ac:	aa1303e0 	mov	x0, x19
    44b0:	94000870 	bl	6670 <__sinit>
    44b4:	17fffefe 	b	40ac <_vfiprintf_r+0x5c>
    44b8:	b940b3e1 	ldr	w1, [sp, #176]
    44bc:	2a1603e4 	mov	w4, w22
    44c0:	37f856c1 	tbnz	w1, #31, 4f98 <_vfiprintf_r+0xf48>
    44c4:	f94037e1 	ldr	x1, [sp, #104]
    44c8:	91003c38 	add	x24, x1, #0xf
    44cc:	927df318 	and	x24, x24, #0xfffffffffffffff8
    44d0:	f94037e1 	ldr	x1, [sp, #104]
    44d4:	3903bfff 	strb	wzr, [sp, #239]
    44d8:	f940003a 	ldr	x26, [x1]
    44dc:	b400753a 	cbz	x26, 5380 <_vfiprintf_r+0x1330>
    44e0:	71014c1f 	cmp	w0, #0x53
    44e4:	54006740 	b.eq	51cc <_vfiprintf_r+0x117c>  // b.none
    44e8:	3720673c 	tbnz	w28, #4, 51cc <_vfiprintf_r+0x117c>
    44ec:	3100049f 	cmn	w4, #0x1
    44f0:	54009520 	b.eq	5794 <_vfiprintf_r+0x1744>  // b.none
    44f4:	93407c82 	sxtw	x2, w4
    44f8:	aa1a03e0 	mov	x0, x26
    44fc:	52800001 	mov	w1, #0x0                   	// #0
    4500:	b9006be4 	str	w4, [sp, #104]
    4504:	94001118 	bl	8964 <memchr>
    4508:	f9003be0 	str	x0, [sp, #112]
    450c:	b9406be4 	ldr	w4, [sp, #104]
    4510:	b40090a0 	cbz	x0, 5724 <_vfiprintf_r+0x16d4>
    4514:	cb1a0003 	sub	x3, x0, x26
    4518:	52800004 	mov	w4, #0x0                   	// #0
    451c:	7100007f 	cmp	w3, #0x0
    4520:	2a0303f7 	mov	w23, w3
    4524:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    4528:	a906fff8 	stp	x24, xzr, [sp, #104]
    452c:	14000060 	b	46ac <_vfiprintf_r+0x65c>
    4530:	71010c1f 	cmp	w0, #0x43
    4534:	54000040 	b.eq	453c <_vfiprintf_r+0x4ec>  // b.none
    4538:	3620569c 	tbz	w28, #4, 5008 <_vfiprintf_r+0xfb8>
    453c:	910423e0 	add	x0, sp, #0x108
    4540:	d2800102 	mov	x2, #0x8                   	// #8
    4544:	52800001 	mov	w1, #0x0                   	// #0
    4548:	97fffdee 	bl	3d00 <memset>
    454c:	b940b3e0 	ldr	w0, [sp, #176]
    4550:	37f87a20 	tbnz	w0, #31, 5494 <_vfiprintf_r+0x1444>
    4554:	f94037e0 	ldr	x0, [sp, #104]
    4558:	91002c01 	add	x1, x0, #0xb
    455c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4560:	f90037e1 	str	x1, [sp, #104]
    4564:	b9400002 	ldr	w2, [x0]
    4568:	9104a3fa 	add	x26, sp, #0x128
    456c:	910423e3 	add	x3, sp, #0x108
    4570:	aa1a03e1 	mov	x1, x26
    4574:	aa1303e0 	mov	x0, x19
    4578:	940005d2 	bl	5cc0 <_wcrtomb_r>
    457c:	2a0003f7 	mov	w23, w0
    4580:	3100041f 	cmn	w0, #0x1
    4584:	54009260 	b.eq	57d0 <_vfiprintf_r+0x1780>  // b.none
    4588:	7100001f 	cmp	w0, #0x0
    458c:	3903bfff 	strb	wzr, [sp, #239]
    4590:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    4594:	17ffff3f 	b	4290 <_vfiprintf_r+0x240>
    4598:	b94063e1 	ldr	w1, [sp, #96]
    459c:	f90037e0 	str	x0, [sp, #104]
    45a0:	4b0103e1 	neg	w1, w1
    45a4:	b90063e1 	str	w1, [sp, #96]
    45a8:	39400280 	ldrb	w0, [x20]
    45ac:	321e039c 	orr	w28, w28, #0x4
    45b0:	17ffff2e 	b	4268 <_vfiprintf_r+0x218>
    45b4:	aa1403e2 	mov	x2, x20
    45b8:	38401440 	ldrb	w0, [x2], #1
    45bc:	7100a81f 	cmp	w0, #0x2a
    45c0:	5400a6a0 	b.eq	5a94 <_vfiprintf_r+0x1a44>  // b.none
    45c4:	5100c001 	sub	w1, w0, #0x30
    45c8:	aa0203f4 	mov	x20, x2
    45cc:	52800016 	mov	w22, #0x0                   	// #0
    45d0:	7100243f 	cmp	w1, #0x9
    45d4:	54ffe4c8 	b.hi	426c <_vfiprintf_r+0x21c>  // b.pmore
    45d8:	38401680 	ldrb	w0, [x20], #1
    45dc:	0b160ac4 	add	w4, w22, w22, lsl #2
    45e0:	0b040436 	add	w22, w1, w4, lsl #1
    45e4:	5100c001 	sub	w1, w0, #0x30
    45e8:	7100243f 	cmp	w1, #0x9
    45ec:	54ffff69 	b.ls	45d8 <_vfiprintf_r+0x588>  // b.plast
    45f0:	17ffff1f 	b	426c <_vfiprintf_r+0x21c>
    45f4:	52800560 	mov	w0, #0x2b                  	// #43
    45f8:	3903bfe0 	strb	w0, [sp, #239]
    45fc:	39400280 	ldrb	w0, [x20]
    4600:	17ffff1a 	b	4268 <_vfiprintf_r+0x218>
    4604:	b940b3e0 	ldr	w0, [sp, #176]
    4608:	37f84da0 	tbnz	w0, #31, 4fbc <_vfiprintf_r+0xf6c>
    460c:	f94037e0 	ldr	x0, [sp, #104]
    4610:	91002c00 	add	x0, x0, #0xb
    4614:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4618:	f94037e1 	ldr	x1, [sp, #104]
    461c:	b9400021 	ldr	w1, [x1]
    4620:	b90063e1 	str	w1, [sp, #96]
    4624:	37fffba1 	tbnz	w1, #31, 4598 <_vfiprintf_r+0x548>
    4628:	f90037e0 	str	x0, [sp, #104]
    462c:	39400280 	ldrb	w0, [x20]
    4630:	17ffff0e 	b	4268 <_vfiprintf_r+0x218>
    4634:	2a1603e4 	mov	w4, w22
    4638:	321c0396 	orr	w22, w28, #0x10
    463c:	b940b3e0 	ldr	w0, [sp, #176]
    4640:	37280056 	tbnz	w22, #5, 4648 <_vfiprintf_r+0x5f8>
    4644:	36204876 	tbz	w22, #4, 4f50 <_vfiprintf_r+0xf00>
    4648:	37f85a40 	tbnz	w0, #31, 5190 <_vfiprintf_r+0x1140>
    464c:	f94037e1 	ldr	x1, [sp, #104]
    4650:	91003c20 	add	x0, x1, #0xf
    4654:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4658:	f90037e0 	str	x0, [sp, #104]
    465c:	f9400021 	ldr	x1, [x1]
    4660:	52800020 	mov	w0, #0x1                   	// #1
    4664:	3903bfff 	strb	wzr, [sp, #239]
    4668:	3100049f 	cmn	w4, #0x1
    466c:	54001320 	b.eq	48d0 <_vfiprintf_r+0x880>  // b.none
    4670:	f100003f 	cmp	x1, #0x0
    4674:	12187adc 	and	w28, w22, #0xffffff7f
    4678:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    467c:	54001261 	b.ne	48c8 <_vfiprintf_r+0x878>  // b.any
    4680:	35000660 	cbnz	w0, 474c <_vfiprintf_r+0x6fc>
    4684:	120002d7 	and	w23, w22, #0x1
    4688:	36003f56 	tbz	w22, #0, 4e70 <_vfiprintf_r+0xe20>
    468c:	91062ffa 	add	x26, sp, #0x18b
    4690:	52800600 	mov	w0, #0x30                  	// #48
    4694:	52800004 	mov	w4, #0x0                   	// #0
    4698:	39062fe0 	strb	w0, [sp, #395]
    469c:	d503201f 	nop
    46a0:	6b17009f 	cmp	w4, w23
    46a4:	f9003bff 	str	xzr, [sp, #112]
    46a8:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    46ac:	3943bfe0 	ldrb	w0, [sp, #239]
    46b0:	7100001f 	cmp	w0, #0x0
    46b4:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    46b8:	17fffef8 	b	4298 <_vfiprintf_r+0x248>
    46bc:	39400280 	ldrb	w0, [x20]
    46c0:	3219039c 	orr	w28, w28, #0x80
    46c4:	17fffee9 	b	4268 <_vfiprintf_r+0x218>
    46c8:	2a1603e4 	mov	w4, w22
    46cc:	321c039c 	orr	w28, w28, #0x10
    46d0:	b940b3e0 	ldr	w0, [sp, #176]
    46d4:	3728005c 	tbnz	w28, #5, 46dc <_vfiprintf_r+0x68c>
    46d8:	362042dc 	tbz	w28, #4, 4f30 <_vfiprintf_r+0xee0>
    46dc:	37f85460 	tbnz	w0, #31, 5168 <_vfiprintf_r+0x1118>
    46e0:	f94037e0 	ldr	x0, [sp, #104]
    46e4:	91003c01 	add	x1, x0, #0xf
    46e8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    46ec:	f90037e1 	str	x1, [sp, #104]
    46f0:	f9400001 	ldr	x1, [x0]
    46f4:	12157b96 	and	w22, w28, #0xfffffbff
    46f8:	52800000 	mov	w0, #0x0                   	// #0
    46fc:	17ffffda 	b	4664 <_vfiprintf_r+0x614>
    4700:	2a1603e4 	mov	w4, w22
    4704:	321c039c 	orr	w28, w28, #0x10
    4708:	b940b3e0 	ldr	w0, [sp, #176]
    470c:	3728005c 	tbnz	w28, #5, 4714 <_vfiprintf_r+0x6c4>
    4710:	36203ffc 	tbz	w28, #4, 4f0c <_vfiprintf_r+0xebc>
    4714:	37f85160 	tbnz	w0, #31, 5140 <_vfiprintf_r+0x10f0>
    4718:	f94037e0 	ldr	x0, [sp, #104]
    471c:	91003c01 	add	x1, x0, #0xf
    4720:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4724:	f90037e1 	str	x1, [sp, #104]
    4728:	f9400000 	ldr	x0, [x0]
    472c:	aa0003e1 	mov	x1, x0
    4730:	b7f83b80 	tbnz	x0, #63, 4ea0 <_vfiprintf_r+0xe50>
    4734:	3100049f 	cmn	w4, #0x1
    4738:	540036e0 	b.eq	4e14 <_vfiprintf_r+0xdc4>  // b.none
    473c:	7100009f 	cmp	w4, #0x0
    4740:	12187b9c 	and	w28, w28, #0xffffff7f
    4744:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    4748:	54003661 	b.ne	4e14 <_vfiprintf_r+0xdc4>  // b.any
    474c:	910633fa 	add	x26, sp, #0x18c
    4750:	52800004 	mov	w4, #0x0                   	// #0
    4754:	52800017 	mov	w23, #0x0                   	// #0
    4758:	17ffffd2 	b	46a0 <_vfiprintf_r+0x650>
    475c:	aa1303e0 	mov	x0, x19
    4760:	94000adc 	bl	72d0 <_localeconv_r>
    4764:	f9400400 	ldr	x0, [x0, #8]
    4768:	f90053e0 	str	x0, [sp, #160]
    476c:	94001555 	bl	9cc0 <strlen>
    4770:	aa0003e1 	mov	x1, x0
    4774:	aa0103f7 	mov	x23, x1
    4778:	aa1303e0 	mov	x0, x19
    477c:	f90057e1 	str	x1, [sp, #168]
    4780:	94000ad4 	bl	72d0 <_localeconv_r>
    4784:	f9400800 	ldr	x0, [x0, #16]
    4788:	f9004fe0 	str	x0, [sp, #152]
    478c:	f10002ff 	cmp	x23, #0x0
    4790:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    4794:	54003b80 	b.eq	4f04 <_vfiprintf_r+0xeb4>  // b.none
    4798:	39400000 	ldrb	w0, [x0]
    479c:	32160381 	orr	w1, w28, #0x400
    47a0:	7100001f 	cmp	w0, #0x0
    47a4:	39400280 	ldrb	w0, [x20]
    47a8:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    47ac:	17fffeaf 	b	4268 <_vfiprintf_r+0x218>
    47b0:	39400280 	ldrb	w0, [x20]
    47b4:	3200039c 	orr	w28, w28, #0x1
    47b8:	17fffeac 	b	4268 <_vfiprintf_r+0x218>
    47bc:	3943bfe1 	ldrb	w1, [sp, #239]
    47c0:	39400280 	ldrb	w0, [x20]
    47c4:	35ffd521 	cbnz	w1, 4268 <_vfiprintf_r+0x218>
    47c8:	52800401 	mov	w1, #0x20                  	// #32
    47cc:	3903bfe1 	strb	w1, [sp, #239]
    47d0:	17fffea6 	b	4268 <_vfiprintf_r+0x218>
    47d4:	b940b3e0 	ldr	w0, [sp, #176]
    47d8:	372801bc 	tbnz	w28, #5, 480c <_vfiprintf_r+0x7bc>
    47dc:	3720019c 	tbnz	w28, #4, 480c <_vfiprintf_r+0x7bc>
    47e0:	37306cfc 	tbnz	w28, #6, 557c <_vfiprintf_r+0x152c>
    47e4:	364889bc 	tbz	w28, #9, 5918 <_vfiprintf_r+0x18c8>
    47e8:	37f89040 	tbnz	w0, #31, 59f0 <_vfiprintf_r+0x19a0>
    47ec:	f94037e0 	ldr	x0, [sp, #104]
    47f0:	91003c01 	add	x1, x0, #0xf
    47f4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    47f8:	f90037e1 	str	x1, [sp, #104]
    47fc:	f9400000 	ldr	x0, [x0]
    4800:	394193e1 	ldrb	w1, [sp, #100]
    4804:	39000001 	strb	w1, [x0]
    4808:	17fffe49 	b	412c <_vfiprintf_r+0xdc>
    480c:	37f84180 	tbnz	w0, #31, 503c <_vfiprintf_r+0xfec>
    4810:	f94037e0 	ldr	x0, [sp, #104]
    4814:	91003c01 	add	x1, x0, #0xf
    4818:	927df021 	and	x1, x1, #0xfffffffffffffff8
    481c:	f90037e1 	str	x1, [sp, #104]
    4820:	f9400000 	ldr	x0, [x0]
    4824:	b98067e1 	ldrsw	x1, [sp, #100]
    4828:	f9000001 	str	x1, [x0]
    482c:	17fffe40 	b	412c <_vfiprintf_r+0xdc>
    4830:	39400280 	ldrb	w0, [x20]
    4834:	7101b01f 	cmp	w0, #0x6c
    4838:	54005960 	b.eq	5364 <_vfiprintf_r+0x1314>  // b.none
    483c:	321c039c 	orr	w28, w28, #0x10
    4840:	17fffe8a 	b	4268 <_vfiprintf_r+0x218>
    4844:	39400280 	ldrb	w0, [x20]
    4848:	7101a01f 	cmp	w0, #0x68
    484c:	54005840 	b.eq	5354 <_vfiprintf_r+0x1304>  // b.none
    4850:	321a039c 	orr	w28, w28, #0x40
    4854:	17fffe85 	b	4268 <_vfiprintf_r+0x218>
    4858:	39400280 	ldrb	w0, [x20]
    485c:	321b039c 	orr	w28, w28, #0x20
    4860:	17fffe82 	b	4268 <_vfiprintf_r+0x218>
    4864:	b940b3e0 	ldr	w0, [sp, #176]
    4868:	2a1603e4 	mov	w4, w22
    486c:	37f83ba0 	tbnz	w0, #31, 4fe0 <_vfiprintf_r+0xf90>
    4870:	f94037e2 	ldr	x2, [sp, #104]
    4874:	91003c40 	add	x0, x2, #0xf
    4878:	927df000 	and	x0, x0, #0xfffffffffffffff8
    487c:	f90037e0 	str	x0, [sp, #104]
    4880:	528f0600 	mov	w0, #0x7830                	// #30768
    4884:	f0000021 	adrp	x1, b000 <_fini+0xcc>
    4888:	910fe021 	add	x1, x1, #0x3f8
    488c:	321f0396 	orr	w22, w28, #0x2
    4890:	f90047e1 	str	x1, [sp, #136]
    4894:	7901e3e0 	strh	w0, [sp, #240]
    4898:	52800040 	mov	w0, #0x2                   	// #2
    489c:	f9400041 	ldr	x1, [x2]
    48a0:	17ffff71 	b	4664 <_vfiprintf_r+0x614>
    48a4:	910643fb 	add	x27, sp, #0x190
    48a8:	93407ee0 	sxtw	x0, w23
    48ac:	52800021 	mov	w1, #0x1                   	// #1
    48b0:	b9011be1 	str	w1, [sp, #280]
    48b4:	f90093e0 	str	x0, [sp, #288]
    48b8:	a91903fa 	stp	x26, x0, [sp, #400]
    48bc:	d503201f 	nop
    48c0:	91004365 	add	x5, x27, #0x10
    48c4:	17fffebb 	b	43b0 <_vfiprintf_r+0x360>
    48c8:	2a1c03f6 	mov	w22, w28
    48cc:	d503201f 	nop
    48d0:	7100041f 	cmp	w0, #0x1
    48d4:	54002a20 	b.eq	4e18 <_vfiprintf_r+0xdc8>  // b.none
    48d8:	910633f7 	add	x23, sp, #0x18c
    48dc:	aa1703fa 	mov	x26, x23
    48e0:	7100081f 	cmp	w0, #0x2
    48e4:	54000161 	b.ne	4910 <_vfiprintf_r+0x8c0>  // b.any
    48e8:	f94047e2 	ldr	x2, [sp, #136]
    48ec:	d503201f 	nop
    48f0:	92400c20 	and	x0, x1, #0xf
    48f4:	d344fc21 	lsr	x1, x1, #4
    48f8:	38606840 	ldrb	w0, [x2, x0]
    48fc:	381fff40 	strb	w0, [x26, #-1]!
    4900:	b5ffff81 	cbnz	x1, 48f0 <_vfiprintf_r+0x8a0>
    4904:	4b1a02f7 	sub	w23, w23, w26
    4908:	2a1603fc 	mov	w28, w22
    490c:	17ffff65 	b	46a0 <_vfiprintf_r+0x650>
    4910:	12000820 	and	w0, w1, #0x7
    4914:	aa1a03e2 	mov	x2, x26
    4918:	1100c000 	add	w0, w0, #0x30
    491c:	381fff40 	strb	w0, [x26, #-1]!
    4920:	d343fc21 	lsr	x1, x1, #3
    4924:	b5ffff61 	cbnz	x1, 4910 <_vfiprintf_r+0x8c0>
    4928:	7100c01f 	cmp	w0, #0x30
    492c:	1a9f07e0 	cset	w0, ne  // ne = any
    4930:	6a0002df 	tst	w22, w0
    4934:	54fffe80 	b.eq	4904 <_vfiprintf_r+0x8b4>  // b.none
    4938:	d1000842 	sub	x2, x2, #0x2
    493c:	52800600 	mov	w0, #0x30                  	// #48
    4940:	2a1603fc 	mov	w28, w22
    4944:	4b0202f7 	sub	w23, w23, w2
    4948:	381ff340 	sturb	w0, [x26, #-1]
    494c:	aa0203fa 	mov	x26, x2
    4950:	17ffff54 	b	46a0 <_vfiprintf_r+0x650>
    4954:	b94063e2 	ldr	w2, [sp, #96]
    4958:	4b160058 	sub	w24, w2, w22
    495c:	7100031f 	cmp	w24, #0x0
    4960:	54ffd04d 	b.le	4368 <_vfiprintf_r+0x318>
    4964:	7100431f 	cmp	w24, #0x10
    4968:	540073cd 	b.le	57e0 <_vfiprintf_r+0x1790>
    496c:	2a0103e3 	mov	w3, w1
    4970:	f0000029 	adrp	x9, b000 <_fini+0xcc>
    4974:	aa1403e1 	mov	x1, x20
    4978:	9113e129 	add	x9, x9, #0x4f8
    497c:	aa1303f4 	mov	x20, x19
    4980:	d2800208 	mov	x8, #0x10                  	// #16
    4984:	2a1803f3 	mov	w19, w24
    4988:	aa0103f8 	mov	x24, x1
    498c:	b90093e4 	str	w4, [sp, #144]
    4990:	b900b7f6 	str	w22, [sp, #180]
    4994:	aa1903f6 	mov	x22, x25
    4998:	aa0903f9 	mov	x25, x9
    499c:	14000007 	b	49b8 <_vfiprintf_r+0x968>
    49a0:	1100086a 	add	w10, w3, #0x2
    49a4:	9100437b 	add	x27, x27, #0x10
    49a8:	2a0203e3 	mov	w3, w2
    49ac:	51004273 	sub	w19, w19, #0x10
    49b0:	7100427f 	cmp	w19, #0x10
    49b4:	540002cd 	b.le	4a0c <_vfiprintf_r+0x9bc>
    49b8:	91004000 	add	x0, x0, #0x10
    49bc:	11000462 	add	w2, w3, #0x1
    49c0:	a9002379 	stp	x25, x8, [x27]
    49c4:	b9011be2 	str	w2, [sp, #280]
    49c8:	f90093e0 	str	x0, [sp, #288]
    49cc:	71001c5f 	cmp	w2, #0x7
    49d0:	54fffe8d 	b.le	49a0 <_vfiprintf_r+0x950>
    49d4:	b4000d60 	cbz	x0, 4b80 <_vfiprintf_r+0xb30>
    49d8:	910443e2 	add	x2, sp, #0x110
    49dc:	aa1603e1 	mov	x1, x22
    49e0:	aa1403e0 	mov	x0, x20
    49e4:	97fffd5b 	bl	3f50 <__sprint_r.part.0>
    49e8:	35004c60 	cbnz	w0, 5374 <_vfiprintf_r+0x1324>
    49ec:	b9411be3 	ldr	w3, [sp, #280]
    49f0:	51004273 	sub	w19, w19, #0x10
    49f4:	910643fb 	add	x27, sp, #0x190
    49f8:	d2800208 	mov	x8, #0x10                  	// #16
    49fc:	1100046a 	add	w10, w3, #0x1
    4a00:	f94093e0 	ldr	x0, [sp, #288]
    4a04:	7100427f 	cmp	w19, #0x10
    4a08:	54fffd8c 	b.gt	49b8 <_vfiprintf_r+0x968>
    4a0c:	aa1803e1 	mov	x1, x24
    4a10:	aa1903e9 	mov	x9, x25
    4a14:	b94093e4 	ldr	w4, [sp, #144]
    4a18:	aa1603f9 	mov	x25, x22
    4a1c:	b940b7f6 	ldr	w22, [sp, #180]
    4a20:	2a1303f8 	mov	w24, w19
    4a24:	aa1403f3 	mov	x19, x20
    4a28:	aa0103f4 	mov	x20, x1
    4a2c:	93407f01 	sxtw	x1, w24
    4a30:	a9000769 	stp	x9, x1, [x27]
    4a34:	8b010000 	add	x0, x0, x1
    4a38:	b9011bea 	str	w10, [sp, #280]
    4a3c:	f90093e0 	str	x0, [sp, #288]
    4a40:	71001d5f 	cmp	w10, #0x7
    4a44:	5400258d 	b.le	4ef4 <_vfiprintf_r+0xea4>
    4a48:	b4005920 	cbz	x0, 556c <_vfiprintf_r+0x151c>
    4a4c:	910443e2 	add	x2, sp, #0x110
    4a50:	aa1903e1 	mov	x1, x25
    4a54:	aa1303e0 	mov	x0, x19
    4a58:	b90093e4 	str	w4, [sp, #144]
    4a5c:	97fffd3d 	bl	3f50 <__sprint_r.part.0>
    4a60:	35ffd060 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4a64:	b94093e4 	ldr	w4, [sp, #144]
    4a68:	910643fb 	add	x27, sp, #0x190
    4a6c:	b9411be1 	ldr	w1, [sp, #280]
    4a70:	4b170098 	sub	w24, w4, w23
    4a74:	11000428 	add	w8, w1, #0x1
    4a78:	f94093e0 	ldr	x0, [sp, #288]
    4a7c:	7100031f 	cmp	w24, #0x0
    4a80:	54ffc7ad 	b.le	4374 <_vfiprintf_r+0x324>
    4a84:	d503201f 	nop
    4a88:	f0000029 	adrp	x9, b000 <_fini+0xcc>
    4a8c:	9113e129 	add	x9, x9, #0x4f8
    4a90:	7100431f 	cmp	w24, #0x10
    4a94:	540004ed 	b.le	4b30 <_vfiprintf_r+0xae0>
    4a98:	2a0103e3 	mov	w3, w1
    4a9c:	d2800204 	mov	x4, #0x10                  	// #16
    4aa0:	f9004bf4 	str	x20, [sp, #144]
    4aa4:	aa1903f4 	mov	x20, x25
    4aa8:	aa1303f9 	mov	x25, x19
    4aac:	aa0903f3 	mov	x19, x9
    4ab0:	14000007 	b	4acc <_vfiprintf_r+0xa7c>
    4ab4:	11000868 	add	w8, w3, #0x2
    4ab8:	9100437b 	add	x27, x27, #0x10
    4abc:	2a0203e3 	mov	w3, w2
    4ac0:	51004318 	sub	w24, w24, #0x10
    4ac4:	7100431f 	cmp	w24, #0x10
    4ac8:	540002cd 	b.le	4b20 <_vfiprintf_r+0xad0>
    4acc:	91004000 	add	x0, x0, #0x10
    4ad0:	11000462 	add	w2, w3, #0x1
    4ad4:	a9001373 	stp	x19, x4, [x27]
    4ad8:	b9011be2 	str	w2, [sp, #280]
    4adc:	f90093e0 	str	x0, [sp, #288]
    4ae0:	71001c5f 	cmp	w2, #0x7
    4ae4:	54fffe8d 	b.le	4ab4 <_vfiprintf_r+0xa64>
    4ae8:	b4000380 	cbz	x0, 4b58 <_vfiprintf_r+0xb08>
    4aec:	910443e2 	add	x2, sp, #0x110
    4af0:	aa1403e1 	mov	x1, x20
    4af4:	aa1903e0 	mov	x0, x25
    4af8:	97fffd16 	bl	3f50 <__sprint_r.part.0>
    4afc:	35ffcb40 	cbnz	w0, 4464 <_vfiprintf_r+0x414>
    4b00:	b9411be3 	ldr	w3, [sp, #280]
    4b04:	51004318 	sub	w24, w24, #0x10
    4b08:	910643fb 	add	x27, sp, #0x190
    4b0c:	d2800204 	mov	x4, #0x10                  	// #16
    4b10:	11000468 	add	w8, w3, #0x1
    4b14:	f94093e0 	ldr	x0, [sp, #288]
    4b18:	7100431f 	cmp	w24, #0x10
    4b1c:	54fffd8c 	b.gt	4acc <_vfiprintf_r+0xa7c>
    4b20:	aa1303e9 	mov	x9, x19
    4b24:	aa1903f3 	mov	x19, x25
    4b28:	aa1403f9 	mov	x25, x20
    4b2c:	f9404bf4 	ldr	x20, [sp, #144]
    4b30:	93407f18 	sxtw	x24, w24
    4b34:	8b180000 	add	x0, x0, x24
    4b38:	a9006369 	stp	x9, x24, [x27]
    4b3c:	b9011be8 	str	w8, [sp, #280]
    4b40:	f90093e0 	str	x0, [sp, #288]
    4b44:	71001d1f 	cmp	w8, #0x7
    4b48:	5400178c 	b.gt	4e38 <_vfiprintf_r+0xde8>
    4b4c:	9100437b 	add	x27, x27, #0x10
    4b50:	11000508 	add	w8, w8, #0x1
    4b54:	17fffe08 	b	4374 <_vfiprintf_r+0x324>
    4b58:	910643fb 	add	x27, sp, #0x190
    4b5c:	52800028 	mov	w8, #0x1                   	// #1
    4b60:	52800003 	mov	w3, #0x0                   	// #0
    4b64:	17ffffd7 	b	4ac0 <_vfiprintf_r+0xa70>
    4b68:	910443e2 	add	x2, sp, #0x110
    4b6c:	aa1903e1 	mov	x1, x25
    4b70:	aa1303e0 	mov	x0, x19
    4b74:	97fffcf7 	bl	3f50 <__sprint_r.part.0>
    4b78:	34ffc340 	cbz	w0, 43e0 <_vfiprintf_r+0x390>
    4b7c:	17fffe3c 	b	446c <_vfiprintf_r+0x41c>
    4b80:	910643fb 	add	x27, sp, #0x190
    4b84:	5280002a 	mov	w10, #0x1                   	// #1
    4b88:	52800003 	mov	w3, #0x0                   	// #0
    4b8c:	17ffff88 	b	49ac <_vfiprintf_r+0x95c>
    4b90:	b4001760 	cbz	x0, 4e7c <_vfiprintf_r+0xe2c>
    4b94:	910443e2 	add	x2, sp, #0x110
    4b98:	aa1903e1 	mov	x1, x25
    4b9c:	aa1303e0 	mov	x0, x19
    4ba0:	b90093ea 	str	w10, [sp, #144]
    4ba4:	b900b7e4 	str	w4, [sp, #180]
    4ba8:	97fffcea 	bl	3f50 <__sprint_r.part.0>
    4bac:	35ffc600 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4bb0:	b9411be1 	ldr	w1, [sp, #280]
    4bb4:	910643fb 	add	x27, sp, #0x190
    4bb8:	b94093ea 	ldr	w10, [sp, #144]
    4bbc:	b940b7e4 	ldr	w4, [sp, #180]
    4bc0:	11000428 	add	w8, w1, #0x1
    4bc4:	f94093e0 	ldr	x0, [sp, #288]
    4bc8:	17fffdd0 	b	4308 <_vfiprintf_r+0x2b8>
    4bcc:	9103c3e0 	add	x0, sp, #0xf0
    4bd0:	d2800041 	mov	x1, #0x2                   	// #2
    4bd4:	910643fb 	add	x27, sp, #0x190
    4bd8:	a91907e0 	stp	x0, x1, [sp, #400]
    4bdc:	aa0103e0 	mov	x0, x1
    4be0:	52800028 	mov	w8, #0x1                   	// #1
    4be4:	d503201f 	nop
    4be8:	2a0803e1 	mov	w1, w8
    4bec:	9100437b 	add	x27, x27, #0x10
    4bf0:	11000428 	add	w8, w1, #0x1
    4bf4:	17fffddb 	b	4360 <_vfiprintf_r+0x310>
    4bf8:	7100413f 	cmp	w9, #0x10
    4bfc:	54005c4d 	b.le	5784 <_vfiprintf_r+0x1734>
    4c00:	f0000028 	adrp	x8, b000 <_fini+0xcc>
    4c04:	9113a108 	add	x8, x8, #0x4e8
    4c08:	aa1b03e3 	mov	x3, x27
    4c0c:	d280020c 	mov	x12, #0x10                  	// #16
    4c10:	2a1703fb 	mov	w27, w23
    4c14:	2a1603f7 	mov	w23, w22
    4c18:	aa0803f6 	mov	x22, x8
    4c1c:	b90093ea 	str	w10, [sp, #144]
    4c20:	b900b7e4 	str	w4, [sp, #180]
    4c24:	2a0103e4 	mov	w4, w1
    4c28:	f9005ff4 	str	x20, [sp, #184]
    4c2c:	aa1903f4 	mov	x20, x25
    4c30:	2a0903f9 	mov	w25, w9
    4c34:	14000008 	b	4c54 <_vfiprintf_r+0xc04>
    4c38:	1100088b 	add	w11, w4, #0x2
    4c3c:	91004063 	add	x3, x3, #0x10
    4c40:	2a0203e4 	mov	w4, w2
    4c44:	51004339 	sub	w25, w25, #0x10
    4c48:	7100433f 	cmp	w25, #0x10
    4c4c:	540002cd 	b.le	4ca4 <_vfiprintf_r+0xc54>
    4c50:	11000482 	add	w2, w4, #0x1
    4c54:	91004000 	add	x0, x0, #0x10
    4c58:	a9003076 	stp	x22, x12, [x3]
    4c5c:	b9011be2 	str	w2, [sp, #280]
    4c60:	f90093e0 	str	x0, [sp, #288]
    4c64:	71001c5f 	cmp	w2, #0x7
    4c68:	54fffe8d 	b.le	4c38 <_vfiprintf_r+0xbe8>
    4c6c:	b4000440 	cbz	x0, 4cf4 <_vfiprintf_r+0xca4>
    4c70:	910443e2 	add	x2, sp, #0x110
    4c74:	aa1403e1 	mov	x1, x20
    4c78:	aa1303e0 	mov	x0, x19
    4c7c:	97fffcb5 	bl	3f50 <__sprint_r.part.0>
    4c80:	35ffbf40 	cbnz	w0, 4468 <_vfiprintf_r+0x418>
    4c84:	b9411be4 	ldr	w4, [sp, #280]
    4c88:	51004339 	sub	w25, w25, #0x10
    4c8c:	910643e3 	add	x3, sp, #0x190
    4c90:	d280020c 	mov	x12, #0x10                  	// #16
    4c94:	1100048b 	add	w11, w4, #0x1
    4c98:	f94093e0 	ldr	x0, [sp, #288]
    4c9c:	7100433f 	cmp	w25, #0x10
    4ca0:	54fffd8c 	b.gt	4c50 <_vfiprintf_r+0xc00>
    4ca4:	2a1903e9 	mov	w9, w25
    4ca8:	b94093ea 	ldr	w10, [sp, #144]
    4cac:	aa1403f9 	mov	x25, x20
    4cb0:	b940b7e4 	ldr	w4, [sp, #180]
    4cb4:	f9405ff4 	ldr	x20, [sp, #184]
    4cb8:	aa1603e8 	mov	x8, x22
    4cbc:	2a1703f6 	mov	w22, w23
    4cc0:	2a1b03f7 	mov	w23, w27
    4cc4:	aa0303fb 	mov	x27, x3
    4cc8:	93407d21 	sxtw	x1, w9
    4ccc:	a9000768 	stp	x8, x1, [x27]
    4cd0:	8b010000 	add	x0, x0, x1
    4cd4:	b9011beb 	str	w11, [sp, #280]
    4cd8:	f90093e0 	str	x0, [sp, #288]
    4cdc:	71001d7f 	cmp	w11, #0x7
    4ce0:	54000ecc 	b.gt	4eb8 <_vfiprintf_r+0xe68>
    4ce4:	9100437b 	add	x27, x27, #0x10
    4ce8:	11000568 	add	w8, w11, #0x1
    4cec:	2a0b03e1 	mov	w1, w11
    4cf0:	17fffd78 	b	42d0 <_vfiprintf_r+0x280>
    4cf4:	910643e3 	add	x3, sp, #0x190
    4cf8:	52800004 	mov	w4, #0x0                   	// #0
    4cfc:	5280002b 	mov	w11, #0x1                   	// #1
    4d00:	17ffffd1 	b	4c44 <_vfiprintf_r+0xbf4>
    4d04:	b9011bff 	str	wzr, [sp, #280]
    4d08:	3610079c 	tbz	w28, #2, 4df8 <_vfiprintf_r+0xda8>
    4d0c:	b94063e1 	ldr	w1, [sp, #96]
    4d10:	4b160037 	sub	w23, w1, w22
    4d14:	710002ff 	cmp	w23, #0x0
    4d18:	5400070d 	b.le	4df8 <_vfiprintf_r+0xda8>
    4d1c:	910643e5 	add	x5, sp, #0x190
    4d20:	b9411be2 	ldr	w2, [sp, #280]
    4d24:	710042ff 	cmp	w23, #0x10
    4d28:	5400546d 	b.le	57b4 <_vfiprintf_r+0x1764>
    4d2c:	f0000028 	adrp	x8, b000 <_fini+0xcc>
    4d30:	9113a108 	add	x8, x8, #0x4e8
    4d34:	aa0803fa 	mov	x26, x8
    4d38:	d2800218 	mov	x24, #0x10                  	// #16
    4d3c:	14000007 	b	4d58 <_vfiprintf_r+0xd08>
    4d40:	11000844 	add	w4, w2, #0x2
    4d44:	910040a5 	add	x5, x5, #0x10
    4d48:	2a0303e2 	mov	w2, w3
    4d4c:	510042f7 	sub	w23, w23, #0x10
    4d50:	710042ff 	cmp	w23, #0x10
    4d54:	540002ad 	b.le	4da8 <_vfiprintf_r+0xd58>
    4d58:	91004000 	add	x0, x0, #0x10
    4d5c:	11000443 	add	w3, w2, #0x1
    4d60:	a90060ba 	stp	x26, x24, [x5]
    4d64:	b9011be3 	str	w3, [sp, #280]
    4d68:	f90093e0 	str	x0, [sp, #288]
    4d6c:	71001c7f 	cmp	w3, #0x7
    4d70:	54fffe8d 	b.le	4d40 <_vfiprintf_r+0xcf0>
    4d74:	b40003a0 	cbz	x0, 4de8 <_vfiprintf_r+0xd98>
    4d78:	910443e2 	add	x2, sp, #0x110
    4d7c:	aa1903e1 	mov	x1, x25
    4d80:	aa1303e0 	mov	x0, x19
    4d84:	97fffc73 	bl	3f50 <__sprint_r.part.0>
    4d88:	35ffb720 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4d8c:	b9411be2 	ldr	w2, [sp, #280]
    4d90:	510042f7 	sub	w23, w23, #0x10
    4d94:	910643e5 	add	x5, sp, #0x190
    4d98:	11000444 	add	w4, w2, #0x1
    4d9c:	f94093e0 	ldr	x0, [sp, #288]
    4da0:	710042ff 	cmp	w23, #0x10
    4da4:	54fffdac 	b.gt	4d58 <_vfiprintf_r+0xd08>
    4da8:	aa1a03e8 	mov	x8, x26
    4dac:	93407ef7 	sxtw	x23, w23
    4db0:	a9005ca8 	stp	x8, x23, [x5]
    4db4:	8b170000 	add	x0, x0, x23
    4db8:	b9011be4 	str	w4, [sp, #280]
    4dbc:	f90093e0 	str	x0, [sp, #288]
    4dc0:	71001c9f 	cmp	w4, #0x7
    4dc4:	54ffb00d 	b.le	43c4 <_vfiprintf_r+0x374>
    4dc8:	b4000180 	cbz	x0, 4df8 <_vfiprintf_r+0xda8>
    4dcc:	910443e2 	add	x2, sp, #0x110
    4dd0:	aa1903e1 	mov	x1, x25
    4dd4:	aa1303e0 	mov	x0, x19
    4dd8:	97fffc5e 	bl	3f50 <__sprint_r.part.0>
    4ddc:	35ffb480 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4de0:	f94093e0 	ldr	x0, [sp, #288]
    4de4:	17fffd78 	b	43c4 <_vfiprintf_r+0x374>
    4de8:	910643e5 	add	x5, sp, #0x190
    4dec:	52800024 	mov	w4, #0x1                   	// #1
    4df0:	52800002 	mov	w2, #0x0                   	// #0
    4df4:	17ffffd6 	b	4d4c <_vfiprintf_r+0xcfc>
    4df8:	b94063e0 	ldr	w0, [sp, #96]
    4dfc:	6b16001f 	cmp	w0, w22
    4e00:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    4e04:	b94067e0 	ldr	w0, [sp, #100]
    4e08:	0b030000 	add	w0, w0, w3
    4e0c:	b90067e0 	str	w0, [sp, #100]
    4e10:	17fffd74 	b	43e0 <_vfiprintf_r+0x390>
    4e14:	2a1c03f6 	mov	w22, w28
    4e18:	f100243f 	cmp	x1, #0x9
    4e1c:	540024c8 	b.hi	52b4 <_vfiprintf_r+0x1264>  // b.pmore
    4e20:	1100c021 	add	w1, w1, #0x30
    4e24:	2a1603fc 	mov	w28, w22
    4e28:	91062ffa 	add	x26, sp, #0x18b
    4e2c:	52800037 	mov	w23, #0x1                   	// #1
    4e30:	39062fe1 	strb	w1, [sp, #395]
    4e34:	17fffe1b 	b	46a0 <_vfiprintf_r+0x650>
    4e38:	b4ffd360 	cbz	x0, 48a4 <_vfiprintf_r+0x854>
    4e3c:	910443e2 	add	x2, sp, #0x110
    4e40:	aa1903e1 	mov	x1, x25
    4e44:	aa1303e0 	mov	x0, x19
    4e48:	97fffc42 	bl	3f50 <__sprint_r.part.0>
    4e4c:	35ffb100 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4e50:	b9411be8 	ldr	w8, [sp, #280]
    4e54:	910643fb 	add	x27, sp, #0x190
    4e58:	f94093e0 	ldr	x0, [sp, #288]
    4e5c:	11000508 	add	w8, w8, #0x1
    4e60:	17fffd45 	b	4374 <_vfiprintf_r+0x324>
    4e64:	910643fb 	add	x27, sp, #0x190
    4e68:	b9011bff 	str	wzr, [sp, #280]
    4e6c:	17fffcf4 	b	423c <_vfiprintf_r+0x1ec>
    4e70:	910633fa 	add	x26, sp, #0x18c
    4e74:	52800004 	mov	w4, #0x0                   	// #0
    4e78:	17fffe0a 	b	46a0 <_vfiprintf_r+0x650>
    4e7c:	350007ca 	cbnz	w10, 4f74 <_vfiprintf_r+0xf24>
    4e80:	910643fb 	add	x27, sp, #0x190
    4e84:	52800001 	mov	w1, #0x0                   	// #0
    4e88:	52800028 	mov	w8, #0x1                   	// #1
    4e8c:	17fffd35 	b	4360 <_vfiprintf_r+0x310>
    4e90:	910643fb 	add	x27, sp, #0x190
    4e94:	52800028 	mov	w8, #0x1                   	// #1
    4e98:	52800001 	mov	w1, #0x0                   	// #0
    4e9c:	17fffd31 	b	4360 <_vfiprintf_r+0x310>
    4ea0:	528005a0 	mov	w0, #0x2d                  	// #45
    4ea4:	cb0103e1 	neg	x1, x1
    4ea8:	2a1c03f6 	mov	w22, w28
    4eac:	3903bfe0 	strb	w0, [sp, #239]
    4eb0:	52800020 	mov	w0, #0x1                   	// #1
    4eb4:	17fffded 	b	4668 <_vfiprintf_r+0x618>
    4eb8:	b4000d60 	cbz	x0, 5064 <_vfiprintf_r+0x1014>
    4ebc:	910443e2 	add	x2, sp, #0x110
    4ec0:	aa1903e1 	mov	x1, x25
    4ec4:	aa1303e0 	mov	x0, x19
    4ec8:	b90093ea 	str	w10, [sp, #144]
    4ecc:	b900b7e4 	str	w4, [sp, #180]
    4ed0:	97fffc20 	bl	3f50 <__sprint_r.part.0>
    4ed4:	35ffacc0 	cbnz	w0, 446c <_vfiprintf_r+0x41c>
    4ed8:	b9411be1 	ldr	w1, [sp, #280]
    4edc:	910643fb 	add	x27, sp, #0x190
    4ee0:	b94093ea 	ldr	w10, [sp, #144]
    4ee4:	b940b7e4 	ldr	w4, [sp, #180]
    4ee8:	11000428 	add	w8, w1, #0x1
    4eec:	f94093e0 	ldr	x0, [sp, #288]
    4ef0:	17fffcf8 	b	42d0 <_vfiprintf_r+0x280>
    4ef4:	9100437b 	add	x27, x27, #0x10
    4ef8:	11000548 	add	w8, w10, #0x1
    4efc:	2a0a03e1 	mov	w1, w10
    4f00:	17fffd1a 	b	4368 <_vfiprintf_r+0x318>
    4f04:	39400280 	ldrb	w0, [x20]
    4f08:	17fffcd8 	b	4268 <_vfiprintf_r+0x218>
    4f0c:	36302a9c 	tbz	w28, #6, 545c <_vfiprintf_r+0x140c>
    4f10:	37f83d20 	tbnz	w0, #31, 56b4 <_vfiprintf_r+0x1664>
    4f14:	f94037e0 	ldr	x0, [sp, #104]
    4f18:	91002c01 	add	x1, x0, #0xb
    4f1c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4f20:	f90037e1 	str	x1, [sp, #104]
    4f24:	79800001 	ldrsh	x1, [x0]
    4f28:	aa0103e0 	mov	x0, x1
    4f2c:	17fffe01 	b	4730 <_vfiprintf_r+0x6e0>
    4f30:	3630247c 	tbz	w28, #6, 53bc <_vfiprintf_r+0x136c>
    4f34:	37f83960 	tbnz	w0, #31, 5660 <_vfiprintf_r+0x1610>
    4f38:	f94037e0 	ldr	x0, [sp, #104]
    4f3c:	91002c01 	add	x1, x0, #0xb
    4f40:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4f44:	f90037e1 	str	x1, [sp, #104]
    4f48:	79400001 	ldrh	w1, [x0]
    4f4c:	17fffdea 	b	46f4 <_vfiprintf_r+0x6a4>
    4f50:	36302476 	tbz	w22, #6, 53dc <_vfiprintf_r+0x138c>
    4f54:	37f839c0 	tbnz	w0, #31, 568c <_vfiprintf_r+0x163c>
    4f58:	f94037e0 	ldr	x0, [sp, #104]
    4f5c:	91002c01 	add	x1, x0, #0xb
    4f60:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4f64:	f90037e1 	str	x1, [sp, #104]
    4f68:	79400001 	ldrh	w1, [x0]
    4f6c:	52800020 	mov	w0, #0x1                   	// #1
    4f70:	17fffdbd 	b	4664 <_vfiprintf_r+0x614>
    4f74:	9103c3e0 	add	x0, sp, #0xf0
    4f78:	d2800042 	mov	x2, #0x2                   	// #2
    4f7c:	910643fb 	add	x27, sp, #0x190
    4f80:	52800021 	mov	w1, #0x1                   	// #1
    4f84:	a9190be0 	stp	x0, x2, [sp, #400]
    4f88:	aa0203e0 	mov	x0, x2
    4f8c:	17ffff18 	b	4bec <_vfiprintf_r+0xb9c>
    4f90:	2a1603e4 	mov	w4, w22
    4f94:	17fffddd 	b	4708 <_vfiprintf_r+0x6b8>
    4f98:	b940b3e1 	ldr	w1, [sp, #176]
    4f9c:	11002021 	add	w1, w1, #0x8
    4fa0:	7100003f 	cmp	w1, #0x0
    4fa4:	54002d6d 	b.le	5550 <_vfiprintf_r+0x1500>
    4fa8:	f94037e2 	ldr	x2, [sp, #104]
    4fac:	b900b3e1 	str	w1, [sp, #176]
    4fb0:	91003c58 	add	x24, x2, #0xf
    4fb4:	927df318 	and	x24, x24, #0xfffffffffffffff8
    4fb8:	17fffd46 	b	44d0 <_vfiprintf_r+0x480>
    4fbc:	b940b3e0 	ldr	w0, [sp, #176]
    4fc0:	11002001 	add	w1, w0, #0x8
    4fc4:	7100003f 	cmp	w1, #0x0
    4fc8:	54002a2d 	b.le	550c <_vfiprintf_r+0x14bc>
    4fcc:	f94037e0 	ldr	x0, [sp, #104]
    4fd0:	b900b3e1 	str	w1, [sp, #176]
    4fd4:	91002c00 	add	x0, x0, #0xb
    4fd8:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4fdc:	17fffd8f 	b	4618 <_vfiprintf_r+0x5c8>
    4fe0:	b940b3e0 	ldr	w0, [sp, #176]
    4fe4:	11002000 	add	w0, w0, #0x8
    4fe8:	7100001f 	cmp	w0, #0x0
    4fec:	5400286d 	b.le	54f8 <_vfiprintf_r+0x14a8>
    4ff0:	f94037e2 	ldr	x2, [sp, #104]
    4ff4:	b900b3e0 	str	w0, [sp, #176]
    4ff8:	91003c41 	add	x1, x2, #0xf
    4ffc:	927df020 	and	x0, x1, #0xfffffffffffffff8
    5000:	f90037e0 	str	x0, [sp, #104]
    5004:	17fffe1f 	b	4880 <_vfiprintf_r+0x830>
    5008:	b940b3e0 	ldr	w0, [sp, #176]
    500c:	37f828e0 	tbnz	w0, #31, 5528 <_vfiprintf_r+0x14d8>
    5010:	f94037e0 	ldr	x0, [sp, #104]
    5014:	91002c01 	add	x1, x0, #0xb
    5018:	927df021 	and	x1, x1, #0xfffffffffffffff8
    501c:	f90037e1 	str	x1, [sp, #104]
    5020:	b9400000 	ldr	w0, [x0]
    5024:	52800036 	mov	w22, #0x1                   	// #1
    5028:	9104a3fa 	add	x26, sp, #0x128
    502c:	2a1603f7 	mov	w23, w22
    5030:	3903bfff 	strb	wzr, [sp, #239]
    5034:	3904a3e0 	strb	w0, [sp, #296]
    5038:	17fffc96 	b	4290 <_vfiprintf_r+0x240>
    503c:	b940b3e0 	ldr	w0, [sp, #176]
    5040:	11002001 	add	w1, w0, #0x8
    5044:	7100003f 	cmp	w1, #0x0
    5048:	5400394d 	b.le	5770 <_vfiprintf_r+0x1720>
    504c:	f94037e0 	ldr	x0, [sp, #104]
    5050:	b900b3e1 	str	w1, [sp, #176]
    5054:	91003c02 	add	x2, x0, #0xf
    5058:	927df041 	and	x1, x2, #0xfffffffffffffff8
    505c:	f90037e1 	str	x1, [sp, #104]
    5060:	17fffdf0 	b	4820 <_vfiprintf_r+0x7d0>
    5064:	3943bfe1 	ldrb	w1, [sp, #239]
    5068:	35002d81 	cbnz	w1, 5618 <_vfiprintf_r+0x15c8>
    506c:	35ffdb0a 	cbnz	w10, 4bcc <_vfiprintf_r+0xb7c>
    5070:	910643fb 	add	x27, sp, #0x190
    5074:	52800001 	mov	w1, #0x0                   	// #0
    5078:	52800028 	mov	w8, #0x1                   	// #1
    507c:	17fffcbb 	b	4368 <_vfiprintf_r+0x318>
    5080:	2a1603e4 	mov	w4, w22
    5084:	2a1c03f6 	mov	w22, w28
    5088:	17fffd6d 	b	463c <_vfiprintf_r+0x5ec>
    508c:	2a1603e4 	mov	w4, w22
    5090:	d0000021 	adrp	x1, b000 <_fini+0xcc>
    5094:	910fe021 	add	x1, x1, #0x3f8
    5098:	f90047e1 	str	x1, [sp, #136]
    509c:	b940b3e1 	ldr	w1, [sp, #176]
    50a0:	3728023c 	tbnz	w28, #5, 50e4 <_vfiprintf_r+0x1094>
    50a4:	3720021c 	tbnz	w28, #4, 50e4 <_vfiprintf_r+0x1094>
    50a8:	36301b7c 	tbz	w28, #6, 5414 <_vfiprintf_r+0x13c4>
    50ac:	37f82c41 	tbnz	w1, #31, 5634 <_vfiprintf_r+0x15e4>
    50b0:	f94037e1 	ldr	x1, [sp, #104]
    50b4:	91002c22 	add	x2, x1, #0xb
    50b8:	927df042 	and	x2, x2, #0xfffffffffffffff8
    50bc:	79400021 	ldrh	w1, [x1]
    50c0:	f90037e2 	str	x2, [sp, #104]
    50c4:	1400000e 	b	50fc <_vfiprintf_r+0x10ac>
    50c8:	d0000021 	adrp	x1, b000 <_fini+0xcc>
    50cc:	2a1603e4 	mov	w4, w22
    50d0:	91104021 	add	x1, x1, #0x410
    50d4:	f90047e1 	str	x1, [sp, #136]
    50d8:	17fffff1 	b	509c <_vfiprintf_r+0x104c>
    50dc:	2a1603e4 	mov	w4, w22
    50e0:	17fffd7c 	b	46d0 <_vfiprintf_r+0x680>
    50e4:	37f801a1 	tbnz	w1, #31, 5118 <_vfiprintf_r+0x10c8>
    50e8:	f94037e1 	ldr	x1, [sp, #104]
    50ec:	91003c22 	add	x2, x1, #0xf
    50f0:	927df042 	and	x2, x2, #0xfffffffffffffff8
    50f4:	f90037e2 	str	x2, [sp, #104]
    50f8:	f9400021 	ldr	x1, [x1]
    50fc:	f100003f 	cmp	x1, #0x0
    5100:	1a9f07e2 	cset	w2, ne  // ne = any
    5104:	6a02039f 	tst	w28, w2
    5108:	54000581 	b.ne	51b8 <_vfiprintf_r+0x1168>  // b.any
    510c:	12157b96 	and	w22, w28, #0xfffffbff
    5110:	52800040 	mov	w0, #0x2                   	// #2
    5114:	17fffd54 	b	4664 <_vfiprintf_r+0x614>
    5118:	b940b3e1 	ldr	w1, [sp, #176]
    511c:	11002022 	add	w2, w1, #0x8
    5120:	7100005f 	cmp	w2, #0x0
    5124:	540016ed 	b.le	5400 <_vfiprintf_r+0x13b0>
    5128:	f94037e1 	ldr	x1, [sp, #104]
    512c:	b900b3e2 	str	w2, [sp, #176]
    5130:	91003c23 	add	x3, x1, #0xf
    5134:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5138:	f90037e2 	str	x2, [sp, #104]
    513c:	17ffffef 	b	50f8 <_vfiprintf_r+0x10a8>
    5140:	b940b3e0 	ldr	w0, [sp, #176]
    5144:	11002001 	add	w1, w0, #0x8
    5148:	7100003f 	cmp	w1, #0x0
    514c:	540017ed 	b.le	5448 <_vfiprintf_r+0x13f8>
    5150:	f94037e0 	ldr	x0, [sp, #104]
    5154:	b900b3e1 	str	w1, [sp, #176]
    5158:	91003c02 	add	x2, x0, #0xf
    515c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5160:	f90037e1 	str	x1, [sp, #104]
    5164:	17fffd71 	b	4728 <_vfiprintf_r+0x6d8>
    5168:	b940b3e0 	ldr	w0, [sp, #176]
    516c:	11002001 	add	w1, w0, #0x8
    5170:	7100003f 	cmp	w1, #0x0
    5174:	5400186d 	b.le	5480 <_vfiprintf_r+0x1430>
    5178:	f94037e0 	ldr	x0, [sp, #104]
    517c:	b900b3e1 	str	w1, [sp, #176]
    5180:	91003c02 	add	x2, x0, #0xf
    5184:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5188:	f90037e1 	str	x1, [sp, #104]
    518c:	17fffd59 	b	46f0 <_vfiprintf_r+0x6a0>
    5190:	b940b3e0 	ldr	w0, [sp, #176]
    5194:	11002000 	add	w0, w0, #0x8
    5198:	7100001f 	cmp	w0, #0x0
    519c:	540014cd 	b.le	5434 <_vfiprintf_r+0x13e4>
    51a0:	f94037e1 	ldr	x1, [sp, #104]
    51a4:	b900b3e0 	str	w0, [sp, #176]
    51a8:	91003c22 	add	x2, x1, #0xf
    51ac:	927df040 	and	x0, x2, #0xfffffffffffffff8
    51b0:	f90037e0 	str	x0, [sp, #104]
    51b4:	17fffd2a 	b	465c <_vfiprintf_r+0x60c>
    51b8:	321f039c 	orr	w28, w28, #0x2
    51bc:	3903c7e0 	strb	w0, [sp, #241]
    51c0:	52800600 	mov	w0, #0x30                  	// #48
    51c4:	3903c3e0 	strb	w0, [sp, #240]
    51c8:	17ffffd1 	b	510c <_vfiprintf_r+0x10bc>
    51cc:	910403e0 	add	x0, sp, #0x100
    51d0:	d2800102 	mov	x2, #0x8                   	// #8
    51d4:	52800001 	mov	w1, #0x0                   	// #0
    51d8:	b9006be4 	str	w4, [sp, #104]
    51dc:	f90087fa 	str	x26, [sp, #264]
    51e0:	97fffac8 	bl	3d00 <memset>
    51e4:	b9406be4 	ldr	w4, [sp, #104]
    51e8:	3100049f 	cmn	w4, #0x1
    51ec:	54001680 	b.eq	54bc <_vfiprintf_r+0x146c>  // b.none
    51f0:	d2800016 	mov	x22, #0x0                   	// #0
    51f4:	52800017 	mov	w23, #0x0                   	// #0
    51f8:	aa1603e0 	mov	x0, x22
    51fc:	2a1703f6 	mov	w22, w23
    5200:	aa0003f7 	mov	x23, x0
    5204:	f90037f4 	str	x20, [sp, #104]
    5208:	2a0403f4 	mov	w20, w4
    520c:	1400000d 	b	5240 <_vfiprintf_r+0x11f0>
    5210:	910403e3 	add	x3, sp, #0x100
    5214:	9104a3e1 	add	x1, sp, #0x128
    5218:	aa1303e0 	mov	x0, x19
    521c:	940002a9 	bl	5cc0 <_wcrtomb_r>
    5220:	3100041f 	cmn	w0, #0x1
    5224:	54002d60 	b.eq	57d0 <_vfiprintf_r+0x1780>  // b.none
    5228:	0b0002c0 	add	w0, w22, w0
    522c:	6b14001f 	cmp	w0, w20
    5230:	540000ec 	b.gt	524c <_vfiprintf_r+0x11fc>
    5234:	910012f7 	add	x23, x23, #0x4
    5238:	54003820 	b.eq	593c <_vfiprintf_r+0x18ec>  // b.none
    523c:	2a0003f6 	mov	w22, w0
    5240:	f94087e0 	ldr	x0, [sp, #264]
    5244:	b8776802 	ldr	w2, [x0, x23]
    5248:	35fffe42 	cbnz	w2, 5210 <_vfiprintf_r+0x11c0>
    524c:	f94037f4 	ldr	x20, [sp, #104]
    5250:	2a1603f7 	mov	w23, w22
    5254:	340014b7 	cbz	w23, 54e8 <_vfiprintf_r+0x1498>
    5258:	71018eff 	cmp	w23, #0x63
    525c:	540024ac 	b.gt	56f0 <_vfiprintf_r+0x16a0>
    5260:	9104a3fa 	add	x26, sp, #0x128
    5264:	f9003bff 	str	xzr, [sp, #112]
    5268:	93407ef6 	sxtw	x22, w23
    526c:	d2800102 	mov	x2, #0x8                   	// #8
    5270:	52800001 	mov	w1, #0x0                   	// #0
    5274:	910403e0 	add	x0, sp, #0x100
    5278:	97fffaa2 	bl	3d00 <memset>
    527c:	910403e4 	add	x4, sp, #0x100
    5280:	aa1603e3 	mov	x3, x22
    5284:	910423e2 	add	x2, sp, #0x108
    5288:	aa1a03e1 	mov	x1, x26
    528c:	aa1303e0 	mov	x0, x19
    5290:	940002d8 	bl	5df0 <_wcsrtombs_r>
    5294:	eb0002df 	cmp	x22, x0
    5298:	54004761 	b.ne	5b84 <_vfiprintf_r+0x1b34>  // b.any
    529c:	710002ff 	cmp	w23, #0x0
    52a0:	52800004 	mov	w4, #0x0                   	// #0
    52a4:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    52a8:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    52ac:	f90037f8 	str	x24, [sp, #104]
    52b0:	17fffcff 	b	46ac <_vfiprintf_r+0x65c>
    52b4:	910633f7 	add	x23, sp, #0x18c
    52b8:	121602c6 	and	w6, w22, #0x400
    52bc:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    52c0:	aa1703e2 	mov	x2, x23
    52c4:	aa1403e3 	mov	x3, x20
    52c8:	aa1703e5 	mov	x5, x23
    52cc:	52800008 	mov	w8, #0x0                   	// #0
    52d0:	aa1303f7 	mov	x23, x19
    52d4:	f29999bc 	movk	x28, #0xcccd
    52d8:	2a0603f3 	mov	w19, w6
    52dc:	f9404ff4 	ldr	x20, [sp, #152]
    52e0:	14000007 	b	52fc <_vfiprintf_r+0x12ac>
    52e4:	9bdc7c38 	umulh	x24, x1, x28
    52e8:	d343ff18 	lsr	x24, x24, #3
    52ec:	f100243f 	cmp	x1, #0x9
    52f0:	54000249 	b.ls	5338 <_vfiprintf_r+0x12e8>  // b.plast
    52f4:	aa1803e1 	mov	x1, x24
    52f8:	aa1a03e2 	mov	x2, x26
    52fc:	9bdc7c38 	umulh	x24, x1, x28
    5300:	11000508 	add	w8, w8, #0x1
    5304:	d100045a 	sub	x26, x2, #0x1
    5308:	d343ff18 	lsr	x24, x24, #3
    530c:	8b180b00 	add	x0, x24, x24, lsl #2
    5310:	cb000420 	sub	x0, x1, x0, lsl #1
    5314:	1100c000 	add	w0, w0, #0x30
    5318:	381ff040 	sturb	w0, [x2, #-1]
    531c:	34fffe53 	cbz	w19, 52e4 <_vfiprintf_r+0x1294>
    5320:	39400280 	ldrb	w0, [x20]
    5324:	7103fc1f 	cmp	w0, #0xff
    5328:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    532c:	54fffdc1 	b.ne	52e4 <_vfiprintf_r+0x1294>  // b.any
    5330:	f100243f 	cmp	x1, #0x9
    5334:	54002028 	b.hi	5738 <_vfiprintf_r+0x16e8>  // b.pmore
    5338:	aa1703f3 	mov	x19, x23
    533c:	aa0503f7 	mov	x23, x5
    5340:	4b1a02f7 	sub	w23, w23, w26
    5344:	2a1603fc 	mov	w28, w22
    5348:	f9004ff4 	str	x20, [sp, #152]
    534c:	aa0303f4 	mov	x20, x3
    5350:	17fffcd4 	b	46a0 <_vfiprintf_r+0x650>
    5354:	39400680 	ldrb	w0, [x20, #1]
    5358:	3217039c 	orr	w28, w28, #0x200
    535c:	91000694 	add	x20, x20, #0x1
    5360:	17fffbc2 	b	4268 <_vfiprintf_r+0x218>
    5364:	39400680 	ldrb	w0, [x20, #1]
    5368:	321b039c 	orr	w28, w28, #0x20
    536c:	91000694 	add	x20, x20, #0x1
    5370:	17fffbbe 	b	4268 <_vfiprintf_r+0x218>
    5374:	aa1403f3 	mov	x19, x20
    5378:	aa1603f9 	mov	x25, x22
    537c:	17fffc3c 	b	446c <_vfiprintf_r+0x41c>
    5380:	7100189f 	cmp	w4, #0x6
    5384:	528000d7 	mov	w23, #0x6                   	// #6
    5388:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    538c:	d0000027 	adrp	x7, b000 <_fini+0xcc>
    5390:	2a1703f6 	mov	w22, w23
    5394:	9110a0fa 	add	x26, x7, #0x428
    5398:	f90037f8 	str	x24, [sp, #104]
    539c:	17fffbbd 	b	4290 <_vfiprintf_r+0x240>
    53a0:	f94093e0 	ldr	x0, [sp, #288]
    53a4:	b4ff86e0 	cbz	x0, 4480 <_vfiprintf_r+0x430>
    53a8:	aa1303e0 	mov	x0, x19
    53ac:	910443e2 	add	x2, sp, #0x110
    53b0:	aa1903e1 	mov	x1, x25
    53b4:	97fffae7 	bl	3f50 <__sprint_r.part.0>
    53b8:	17fffc32 	b	4480 <_vfiprintf_r+0x430>
    53bc:	3648101c 	tbz	w28, #9, 55bc <_vfiprintf_r+0x156c>
    53c0:	37f822e0 	tbnz	w0, #31, 581c <_vfiprintf_r+0x17cc>
    53c4:	f94037e0 	ldr	x0, [sp, #104]
    53c8:	91002c01 	add	x1, x0, #0xb
    53cc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53d0:	f90037e1 	str	x1, [sp, #104]
    53d4:	39400001 	ldrb	w1, [x0]
    53d8:	17fffcc7 	b	46f4 <_vfiprintf_r+0x6a4>
    53dc:	364810f6 	tbz	w22, #9, 55f8 <_vfiprintf_r+0x15a8>
    53e0:	37f82880 	tbnz	w0, #31, 58f0 <_vfiprintf_r+0x18a0>
    53e4:	f94037e0 	ldr	x0, [sp, #104]
    53e8:	91002c01 	add	x1, x0, #0xb
    53ec:	927df021 	and	x1, x1, #0xfffffffffffffff8
    53f0:	f90037e1 	str	x1, [sp, #104]
    53f4:	39400001 	ldrb	w1, [x0]
    53f8:	52800020 	mov	w0, #0x1                   	// #1
    53fc:	17fffc9a 	b	4664 <_vfiprintf_r+0x614>
    5400:	f94043e3 	ldr	x3, [sp, #128]
    5404:	b940b3e1 	ldr	w1, [sp, #176]
    5408:	b900b3e2 	str	w2, [sp, #176]
    540c:	8b21c061 	add	x1, x3, w1, sxtw
    5410:	17ffff3a 	b	50f8 <_vfiprintf_r+0x10a8>
    5414:	36480c7c 	tbz	w28, #9, 55a0 <_vfiprintf_r+0x1550>
    5418:	37f82421 	tbnz	w1, #31, 589c <_vfiprintf_r+0x184c>
    541c:	f94037e1 	ldr	x1, [sp, #104]
    5420:	91002c22 	add	x2, x1, #0xb
    5424:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5428:	39400021 	ldrb	w1, [x1]
    542c:	f90037e2 	str	x2, [sp, #104]
    5430:	17ffff33 	b	50fc <_vfiprintf_r+0x10ac>
    5434:	f94043e2 	ldr	x2, [sp, #128]
    5438:	b940b3e1 	ldr	w1, [sp, #176]
    543c:	b900b3e0 	str	w0, [sp, #176]
    5440:	8b21c041 	add	x1, x2, w1, sxtw
    5444:	17fffc86 	b	465c <_vfiprintf_r+0x60c>
    5448:	f94043e2 	ldr	x2, [sp, #128]
    544c:	b940b3e0 	ldr	w0, [sp, #176]
    5450:	b900b3e1 	str	w1, [sp, #176]
    5454:	8b20c040 	add	x0, x2, w0, sxtw
    5458:	17fffcb4 	b	4728 <_vfiprintf_r+0x6d8>
    545c:	36480bfc 	tbz	w28, #9, 55d8 <_vfiprintf_r+0x1588>
    5460:	37f820a0 	tbnz	w0, #31, 5874 <_vfiprintf_r+0x1824>
    5464:	f94037e0 	ldr	x0, [sp, #104]
    5468:	91002c01 	add	x1, x0, #0xb
    546c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5470:	f90037e1 	str	x1, [sp, #104]
    5474:	39800001 	ldrsb	x1, [x0]
    5478:	aa0103e0 	mov	x0, x1
    547c:	17fffcad 	b	4730 <_vfiprintf_r+0x6e0>
    5480:	f94043e2 	ldr	x2, [sp, #128]
    5484:	b940b3e0 	ldr	w0, [sp, #176]
    5488:	b900b3e1 	str	w1, [sp, #176]
    548c:	8b20c040 	add	x0, x2, w0, sxtw
    5490:	17fffc98 	b	46f0 <_vfiprintf_r+0x6a0>
    5494:	b940b3e0 	ldr	w0, [sp, #176]
    5498:	11002001 	add	w1, w0, #0x8
    549c:	7100003f 	cmp	w1, #0x0
    54a0:	540011ed 	b.le	56dc <_vfiprintf_r+0x168c>
    54a4:	f94037e0 	ldr	x0, [sp, #104]
    54a8:	b900b3e1 	str	w1, [sp, #176]
    54ac:	91002c02 	add	x2, x0, #0xb
    54b0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    54b4:	f90037e1 	str	x1, [sp, #104]
    54b8:	17fffc2b 	b	4564 <_vfiprintf_r+0x514>
    54bc:	910403e4 	add	x4, sp, #0x100
    54c0:	910423e2 	add	x2, sp, #0x108
    54c4:	aa1303e0 	mov	x0, x19
    54c8:	d2800003 	mov	x3, #0x0                   	// #0
    54cc:	d2800001 	mov	x1, #0x0                   	// #0
    54d0:	94000248 	bl	5df0 <_wcsrtombs_r>
    54d4:	2a0003f7 	mov	w23, w0
    54d8:	3100041f 	cmn	w0, #0x1
    54dc:	540017a0 	b.eq	57d0 <_vfiprintf_r+0x1780>  // b.none
    54e0:	f90087fa 	str	x26, [sp, #264]
    54e4:	17ffff5c 	b	5254 <_vfiprintf_r+0x1204>
    54e8:	52800016 	mov	w22, #0x0                   	// #0
    54ec:	52800004 	mov	w4, #0x0                   	// #0
    54f0:	a906fff8 	stp	x24, xzr, [sp, #104]
    54f4:	17fffc6e 	b	46ac <_vfiprintf_r+0x65c>
    54f8:	f94043e2 	ldr	x2, [sp, #128]
    54fc:	b940b3e1 	ldr	w1, [sp, #176]
    5500:	b900b3e0 	str	w0, [sp, #176]
    5504:	8b21c042 	add	x2, x2, w1, sxtw
    5508:	17fffcde 	b	4880 <_vfiprintf_r+0x830>
    550c:	f94043e2 	ldr	x2, [sp, #128]
    5510:	b940b3e0 	ldr	w0, [sp, #176]
    5514:	b900b3e1 	str	w1, [sp, #176]
    5518:	8b20c042 	add	x2, x2, w0, sxtw
    551c:	f94037e0 	ldr	x0, [sp, #104]
    5520:	f90037e2 	str	x2, [sp, #104]
    5524:	17fffc3d 	b	4618 <_vfiprintf_r+0x5c8>
    5528:	b940b3e0 	ldr	w0, [sp, #176]
    552c:	11002001 	add	w1, w0, #0x8
    5530:	7100003f 	cmp	w1, #0x0
    5534:	54000eed 	b.le	5710 <_vfiprintf_r+0x16c0>
    5538:	f94037e0 	ldr	x0, [sp, #104]
    553c:	b900b3e1 	str	w1, [sp, #176]
    5540:	91002c02 	add	x2, x0, #0xb
    5544:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5548:	f90037e1 	str	x1, [sp, #104]
    554c:	17fffeb5 	b	5020 <_vfiprintf_r+0xfd0>
    5550:	f94043e3 	ldr	x3, [sp, #128]
    5554:	b940b3e2 	ldr	w2, [sp, #176]
    5558:	b900b3e1 	str	w1, [sp, #176]
    555c:	f94037f8 	ldr	x24, [sp, #104]
    5560:	8b22c062 	add	x2, x3, w2, sxtw
    5564:	f90037e2 	str	x2, [sp, #104]
    5568:	17fffbda 	b	44d0 <_vfiprintf_r+0x480>
    556c:	910643fb 	add	x27, sp, #0x190
    5570:	52800028 	mov	w8, #0x1                   	// #1
    5574:	52800001 	mov	w1, #0x0                   	// #0
    5578:	17fffb7c 	b	4368 <_vfiprintf_r+0x318>
    557c:	37f81e60 	tbnz	w0, #31, 5948 <_vfiprintf_r+0x18f8>
    5580:	f94037e0 	ldr	x0, [sp, #104]
    5584:	91003c01 	add	x1, x0, #0xf
    5588:	927df021 	and	x1, x1, #0xfffffffffffffff8
    558c:	f90037e1 	str	x1, [sp, #104]
    5590:	f9400000 	ldr	x0, [x0]
    5594:	7940cbe1 	ldrh	w1, [sp, #100]
    5598:	79000001 	strh	w1, [x0]
    559c:	17fffae4 	b	412c <_vfiprintf_r+0xdc>
    55a0:	37f81281 	tbnz	w1, #31, 57f0 <_vfiprintf_r+0x17a0>
    55a4:	f94037e1 	ldr	x1, [sp, #104]
    55a8:	91002c22 	add	x2, x1, #0xb
    55ac:	927df042 	and	x2, x2, #0xfffffffffffffff8
    55b0:	b9400021 	ldr	w1, [x1]
    55b4:	f90037e2 	str	x2, [sp, #104]
    55b8:	17fffed1 	b	50fc <_vfiprintf_r+0x10ac>
    55bc:	37f81460 	tbnz	w0, #31, 5848 <_vfiprintf_r+0x17f8>
    55c0:	f94037e0 	ldr	x0, [sp, #104]
    55c4:	91002c01 	add	x1, x0, #0xb
    55c8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    55cc:	f90037e1 	str	x1, [sp, #104]
    55d0:	b9400001 	ldr	w1, [x0]
    55d4:	17fffc48 	b	46f4 <_vfiprintf_r+0x6a4>
    55d8:	37f81cc0 	tbnz	w0, #31, 5970 <_vfiprintf_r+0x1920>
    55dc:	f94037e0 	ldr	x0, [sp, #104]
    55e0:	91002c01 	add	x1, x0, #0xb
    55e4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    55e8:	f90037e1 	str	x1, [sp, #104]
    55ec:	b9800001 	ldrsw	x1, [x0]
    55f0:	aa0103e0 	mov	x0, x1
    55f4:	17fffc4f 	b	4730 <_vfiprintf_r+0x6e0>
    55f8:	37f81680 	tbnz	w0, #31, 58c8 <_vfiprintf_r+0x1878>
    55fc:	f94037e0 	ldr	x0, [sp, #104]
    5600:	91002c01 	add	x1, x0, #0xb
    5604:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5608:	f90037e1 	str	x1, [sp, #104]
    560c:	b9400001 	ldr	w1, [x0]
    5610:	52800020 	mov	w0, #0x1                   	// #1
    5614:	17fffc14 	b	4664 <_vfiprintf_r+0x614>
    5618:	9103bfe0 	add	x0, sp, #0xef
    561c:	910643fb 	add	x27, sp, #0x190
    5620:	52800028 	mov	w8, #0x1                   	// #1
    5624:	f900cbe0 	str	x0, [sp, #400]
    5628:	d2800020 	mov	x0, #0x1                   	// #1
    562c:	f900cfe0 	str	x0, [sp, #408]
    5630:	17fffb33 	b	42fc <_vfiprintf_r+0x2ac>
    5634:	b940b3e1 	ldr	w1, [sp, #176]
    5638:	11002022 	add	w2, w1, #0x8
    563c:	7100005f 	cmp	w2, #0x0
    5640:	54001b6d 	b.le	59ac <_vfiprintf_r+0x195c>
    5644:	f94037e1 	ldr	x1, [sp, #104]
    5648:	b900b3e2 	str	w2, [sp, #176]
    564c:	91002c23 	add	x3, x1, #0xb
    5650:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5654:	79400021 	ldrh	w1, [x1]
    5658:	f90037e2 	str	x2, [sp, #104]
    565c:	17fffea8 	b	50fc <_vfiprintf_r+0x10ac>
    5660:	b940b3e0 	ldr	w0, [sp, #176]
    5664:	11002001 	add	w1, w0, #0x8
    5668:	7100003f 	cmp	w1, #0x0
    566c:	54001b6d 	b.le	59d8 <_vfiprintf_r+0x1988>
    5670:	f94037e0 	ldr	x0, [sp, #104]
    5674:	b900b3e1 	str	w1, [sp, #176]
    5678:	91002c02 	add	x2, x0, #0xb
    567c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5680:	f90037e1 	str	x1, [sp, #104]
    5684:	79400001 	ldrh	w1, [x0]
    5688:	17fffc1b 	b	46f4 <_vfiprintf_r+0x6a4>
    568c:	b940b3e0 	ldr	w0, [sp, #176]
    5690:	11002001 	add	w1, w0, #0x8
    5694:	7100003f 	cmp	w1, #0x0
    5698:	5400196d 	b.le	59c4 <_vfiprintf_r+0x1974>
    569c:	f94037e0 	ldr	x0, [sp, #104]
    56a0:	b900b3e1 	str	w1, [sp, #176]
    56a4:	91002c02 	add	x2, x0, #0xb
    56a8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56ac:	f90037e1 	str	x1, [sp, #104]
    56b0:	17fffe2e 	b	4f68 <_vfiprintf_r+0xf18>
    56b4:	b940b3e0 	ldr	w0, [sp, #176]
    56b8:	11002001 	add	w1, w0, #0x8
    56bc:	7100003f 	cmp	w1, #0x0
    56c0:	540016cd 	b.le	5998 <_vfiprintf_r+0x1948>
    56c4:	f94037e0 	ldr	x0, [sp, #104]
    56c8:	b900b3e1 	str	w1, [sp, #176]
    56cc:	91002c02 	add	x2, x0, #0xb
    56d0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    56d4:	f90037e1 	str	x1, [sp, #104]
    56d8:	17fffe13 	b	4f24 <_vfiprintf_r+0xed4>
    56dc:	f94043e2 	ldr	x2, [sp, #128]
    56e0:	b940b3e0 	ldr	w0, [sp, #176]
    56e4:	b900b3e1 	str	w1, [sp, #176]
    56e8:	8b20c040 	add	x0, x2, w0, sxtw
    56ec:	17fffb9e 	b	4564 <_vfiprintf_r+0x514>
    56f0:	110006e1 	add	w1, w23, #0x1
    56f4:	aa1303e0 	mov	x0, x19
    56f8:	93407c21 	sxtw	x1, w1
    56fc:	97fff6e1 	bl	3280 <_malloc_r>
    5700:	aa0003fa 	mov	x26, x0
    5704:	b4000660 	cbz	x0, 57d0 <_vfiprintf_r+0x1780>
    5708:	f9003be0 	str	x0, [sp, #112]
    570c:	17fffed7 	b	5268 <_vfiprintf_r+0x1218>
    5710:	f94043e2 	ldr	x2, [sp, #128]
    5714:	b940b3e0 	ldr	w0, [sp, #176]
    5718:	b900b3e1 	str	w1, [sp, #176]
    571c:	8b20c040 	add	x0, x2, w0, sxtw
    5720:	17fffe40 	b	5020 <_vfiprintf_r+0xfd0>
    5724:	2a0403f6 	mov	w22, w4
    5728:	2a0403f7 	mov	w23, w4
    572c:	52800004 	mov	w4, #0x0                   	// #0
    5730:	f90037f8 	str	x24, [sp, #104]
    5734:	17fffbde 	b	46ac <_vfiprintf_r+0x65c>
    5738:	a94a03e1 	ldp	x1, x0, [sp, #160]
    573c:	b90073e4 	str	w4, [sp, #112]
    5740:	a90917e3 	stp	x3, x5, [sp, #144]
    5744:	cb00035a 	sub	x26, x26, x0
    5748:	aa0003e2 	mov	x2, x0
    574c:	aa1a03e0 	mov	x0, x26
    5750:	940011d0 	bl	9e90 <strncpy>
    5754:	39400680 	ldrb	w0, [x20, #1]
    5758:	52800008 	mov	w8, #0x0                   	// #0
    575c:	b94073e4 	ldr	w4, [sp, #112]
    5760:	7100001f 	cmp	w0, #0x0
    5764:	9a940694 	cinc	x20, x20, ne  // ne = any
    5768:	a94917e3 	ldp	x3, x5, [sp, #144]
    576c:	17fffee2 	b	52f4 <_vfiprintf_r+0x12a4>
    5770:	f94043e2 	ldr	x2, [sp, #128]
    5774:	b940b3e0 	ldr	w0, [sp, #176]
    5778:	b900b3e1 	str	w1, [sp, #176]
    577c:	8b20c040 	add	x0, x2, w0, sxtw
    5780:	17fffc28 	b	4820 <_vfiprintf_r+0x7d0>
    5784:	d0000028 	adrp	x8, b000 <_fini+0xcc>
    5788:	2a0203eb 	mov	w11, w2
    578c:	9113a108 	add	x8, x8, #0x4e8
    5790:	17fffd4e 	b	4cc8 <_vfiprintf_r+0xc78>
    5794:	aa1a03e0 	mov	x0, x26
    5798:	9400114a 	bl	9cc0 <strlen>
    579c:	7100001f 	cmp	w0, #0x0
    57a0:	2a0003f7 	mov	w23, w0
    57a4:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    57a8:	52800004 	mov	w4, #0x0                   	// #0
    57ac:	a906fff8 	stp	x24, xzr, [sp, #104]
    57b0:	17fffbbf 	b	46ac <_vfiprintf_r+0x65c>
    57b4:	d0000028 	adrp	x8, b000 <_fini+0xcc>
    57b8:	11000444 	add	w4, w2, #0x1
    57bc:	9113a108 	add	x8, x8, #0x4e8
    57c0:	17fffd7b 	b	4dac <_vfiprintf_r+0xd5c>
    57c4:	12800000 	mov	w0, #0xffffffff            	// #-1
    57c8:	b90067e0 	str	w0, [sp, #100]
    57cc:	17fffb31 	b	4490 <_vfiprintf_r+0x440>
    57d0:	79c02320 	ldrsh	w0, [x25, #16]
    57d4:	321a0000 	orr	w0, w0, #0x40
    57d8:	79002320 	strh	w0, [x25, #16]
    57dc:	17fffb2a 	b	4484 <_vfiprintf_r+0x434>
    57e0:	d0000029 	adrp	x9, b000 <_fini+0xcc>
    57e4:	2a0803ea 	mov	w10, w8
    57e8:	9113e129 	add	x9, x9, #0x4f8
    57ec:	17fffc90 	b	4a2c <_vfiprintf_r+0x9dc>
    57f0:	b940b3e1 	ldr	w1, [sp, #176]
    57f4:	11002022 	add	w2, w1, #0x8
    57f8:	7100005f 	cmp	w2, #0x0
    57fc:	540019cd 	b.le	5b34 <_vfiprintf_r+0x1ae4>
    5800:	f94037e1 	ldr	x1, [sp, #104]
    5804:	b900b3e2 	str	w2, [sp, #176]
    5808:	91002c23 	add	x3, x1, #0xb
    580c:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5810:	b9400021 	ldr	w1, [x1]
    5814:	f90037e2 	str	x2, [sp, #104]
    5818:	17fffe39 	b	50fc <_vfiprintf_r+0x10ac>
    581c:	b940b3e0 	ldr	w0, [sp, #176]
    5820:	11002001 	add	w1, w0, #0x8
    5824:	7100003f 	cmp	w1, #0x0
    5828:	540010cd 	b.le	5a40 <_vfiprintf_r+0x19f0>
    582c:	f94037e0 	ldr	x0, [sp, #104]
    5830:	b900b3e1 	str	w1, [sp, #176]
    5834:	91002c02 	add	x2, x0, #0xb
    5838:	927df041 	and	x1, x2, #0xfffffffffffffff8
    583c:	f90037e1 	str	x1, [sp, #104]
    5840:	39400001 	ldrb	w1, [x0]
    5844:	17fffbac 	b	46f4 <_vfiprintf_r+0x6a4>
    5848:	b940b3e0 	ldr	w0, [sp, #176]
    584c:	11002001 	add	w1, w0, #0x8
    5850:	7100003f 	cmp	w1, #0x0
    5854:	540015ad 	b.le	5b08 <_vfiprintf_r+0x1ab8>
    5858:	f94037e0 	ldr	x0, [sp, #104]
    585c:	b900b3e1 	str	w1, [sp, #176]
    5860:	91002c02 	add	x2, x0, #0xb
    5864:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5868:	f90037e1 	str	x1, [sp, #104]
    586c:	b9400001 	ldr	w1, [x0]
    5870:	17fffba1 	b	46f4 <_vfiprintf_r+0x6a4>
    5874:	b940b3e0 	ldr	w0, [sp, #176]
    5878:	11002001 	add	w1, w0, #0x8
    587c:	7100003f 	cmp	w1, #0x0
    5880:	54000f6d 	b.le	5a6c <_vfiprintf_r+0x1a1c>
    5884:	f94037e0 	ldr	x0, [sp, #104]
    5888:	b900b3e1 	str	w1, [sp, #176]
    588c:	91002c02 	add	x2, x0, #0xb
    5890:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5894:	f90037e1 	str	x1, [sp, #104]
    5898:	17fffef7 	b	5474 <_vfiprintf_r+0x1424>
    589c:	b940b3e1 	ldr	w1, [sp, #176]
    58a0:	11002022 	add	w2, w1, #0x8
    58a4:	7100005f 	cmp	w2, #0x0
    58a8:	5400152d 	b.le	5b4c <_vfiprintf_r+0x1afc>
    58ac:	f94037e1 	ldr	x1, [sp, #104]
    58b0:	b900b3e2 	str	w2, [sp, #176]
    58b4:	91002c23 	add	x3, x1, #0xb
    58b8:	927df062 	and	x2, x3, #0xfffffffffffffff8
    58bc:	39400021 	ldrb	w1, [x1]
    58c0:	f90037e2 	str	x2, [sp, #104]
    58c4:	17fffe0e 	b	50fc <_vfiprintf_r+0x10ac>
    58c8:	b940b3e0 	ldr	w0, [sp, #176]
    58cc:	11002001 	add	w1, w0, #0x8
    58d0:	7100003f 	cmp	w1, #0x0
    58d4:	5400106d 	b.le	5ae0 <_vfiprintf_r+0x1a90>
    58d8:	f94037e0 	ldr	x0, [sp, #104]
    58dc:	b900b3e1 	str	w1, [sp, #176]
    58e0:	91002c02 	add	x2, x0, #0xb
    58e4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    58e8:	f90037e1 	str	x1, [sp, #104]
    58ec:	17ffff48 	b	560c <_vfiprintf_r+0x15bc>
    58f0:	b940b3e0 	ldr	w0, [sp, #176]
    58f4:	11002001 	add	w1, w0, #0x8
    58f8:	7100003f 	cmp	w1, #0x0
    58fc:	54000e8d 	b.le	5acc <_vfiprintf_r+0x1a7c>
    5900:	f94037e0 	ldr	x0, [sp, #104]
    5904:	b900b3e1 	str	w1, [sp, #176]
    5908:	91002c02 	add	x2, x0, #0xb
    590c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5910:	f90037e1 	str	x1, [sp, #104]
    5914:	17fffeb8 	b	53f4 <_vfiprintf_r+0x13a4>
    5918:	37f80800 	tbnz	w0, #31, 5a18 <_vfiprintf_r+0x19c8>
    591c:	f94037e0 	ldr	x0, [sp, #104]
    5920:	91003c01 	add	x1, x0, #0xf
    5924:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5928:	f90037e1 	str	x1, [sp, #104]
    592c:	f9400000 	ldr	x0, [x0]
    5930:	b94067e1 	ldr	w1, [sp, #100]
    5934:	b9000001 	str	w1, [x0]
    5938:	17fff9fd 	b	412c <_vfiprintf_r+0xdc>
    593c:	2a1403f7 	mov	w23, w20
    5940:	f94037f4 	ldr	x20, [sp, #104]
    5944:	17fffe44 	b	5254 <_vfiprintf_r+0x1204>
    5948:	b940b3e0 	ldr	w0, [sp, #176]
    594c:	11002001 	add	w1, w0, #0x8
    5950:	7100003f 	cmp	w1, #0x0
    5954:	54000d0d 	b.le	5af4 <_vfiprintf_r+0x1aa4>
    5958:	f94037e0 	ldr	x0, [sp, #104]
    595c:	b900b3e1 	str	w1, [sp, #176]
    5960:	91003c02 	add	x2, x0, #0xf
    5964:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5968:	f90037e1 	str	x1, [sp, #104]
    596c:	17ffff09 	b	5590 <_vfiprintf_r+0x1540>
    5970:	b940b3e0 	ldr	w0, [sp, #176]
    5974:	11002001 	add	w1, w0, #0x8
    5978:	7100003f 	cmp	w1, #0x0
    597c:	540006ed 	b.le	5a58 <_vfiprintf_r+0x1a08>
    5980:	f94037e0 	ldr	x0, [sp, #104]
    5984:	b900b3e1 	str	w1, [sp, #176]
    5988:	91002c02 	add	x2, x0, #0xb
    598c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5990:	f90037e1 	str	x1, [sp, #104]
    5994:	17ffff16 	b	55ec <_vfiprintf_r+0x159c>
    5998:	f94043e2 	ldr	x2, [sp, #128]
    599c:	b940b3e0 	ldr	w0, [sp, #176]
    59a0:	b900b3e1 	str	w1, [sp, #176]
    59a4:	8b20c040 	add	x0, x2, w0, sxtw
    59a8:	17fffd5f 	b	4f24 <_vfiprintf_r+0xed4>
    59ac:	f94043e3 	ldr	x3, [sp, #128]
    59b0:	b940b3e1 	ldr	w1, [sp, #176]
    59b4:	b900b3e2 	str	w2, [sp, #176]
    59b8:	8b21c061 	add	x1, x3, w1, sxtw
    59bc:	79400021 	ldrh	w1, [x1]
    59c0:	17fffdcf 	b	50fc <_vfiprintf_r+0x10ac>
    59c4:	f94043e2 	ldr	x2, [sp, #128]
    59c8:	b940b3e0 	ldr	w0, [sp, #176]
    59cc:	b900b3e1 	str	w1, [sp, #176]
    59d0:	8b20c040 	add	x0, x2, w0, sxtw
    59d4:	17fffd65 	b	4f68 <_vfiprintf_r+0xf18>
    59d8:	f94043e2 	ldr	x2, [sp, #128]
    59dc:	b940b3e0 	ldr	w0, [sp, #176]
    59e0:	b900b3e1 	str	w1, [sp, #176]
    59e4:	8b20c040 	add	x0, x2, w0, sxtw
    59e8:	79400001 	ldrh	w1, [x0]
    59ec:	17fffb42 	b	46f4 <_vfiprintf_r+0x6a4>
    59f0:	b940b3e0 	ldr	w0, [sp, #176]
    59f4:	11002001 	add	w1, w0, #0x8
    59f8:	7100003f 	cmp	w1, #0x0
    59fc:	5400092d 	b.le	5b20 <_vfiprintf_r+0x1ad0>
    5a00:	f94037e0 	ldr	x0, [sp, #104]
    5a04:	b900b3e1 	str	w1, [sp, #176]
    5a08:	91003c02 	add	x2, x0, #0xf
    5a0c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5a10:	f90037e1 	str	x1, [sp, #104]
    5a14:	17fffb7a 	b	47fc <_vfiprintf_r+0x7ac>
    5a18:	b940b3e0 	ldr	w0, [sp, #176]
    5a1c:	11002001 	add	w1, w0, #0x8
    5a20:	7100003f 	cmp	w1, #0x0
    5a24:	540002ed 	b.le	5a80 <_vfiprintf_r+0x1a30>
    5a28:	f94037e0 	ldr	x0, [sp, #104]
    5a2c:	b900b3e1 	str	w1, [sp, #176]
    5a30:	91003c02 	add	x2, x0, #0xf
    5a34:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5a38:	f90037e1 	str	x1, [sp, #104]
    5a3c:	17ffffbc 	b	592c <_vfiprintf_r+0x18dc>
    5a40:	f94043e2 	ldr	x2, [sp, #128]
    5a44:	b940b3e0 	ldr	w0, [sp, #176]
    5a48:	b900b3e1 	str	w1, [sp, #176]
    5a4c:	8b20c040 	add	x0, x2, w0, sxtw
    5a50:	39400001 	ldrb	w1, [x0]
    5a54:	17fffb28 	b	46f4 <_vfiprintf_r+0x6a4>
    5a58:	f94043e2 	ldr	x2, [sp, #128]
    5a5c:	b940b3e0 	ldr	w0, [sp, #176]
    5a60:	b900b3e1 	str	w1, [sp, #176]
    5a64:	8b20c040 	add	x0, x2, w0, sxtw
    5a68:	17fffee1 	b	55ec <_vfiprintf_r+0x159c>
    5a6c:	f94043e2 	ldr	x2, [sp, #128]
    5a70:	b940b3e0 	ldr	w0, [sp, #176]
    5a74:	b900b3e1 	str	w1, [sp, #176]
    5a78:	8b20c040 	add	x0, x2, w0, sxtw
    5a7c:	17fffe7e 	b	5474 <_vfiprintf_r+0x1424>
    5a80:	f94043e2 	ldr	x2, [sp, #128]
    5a84:	b940b3e0 	ldr	w0, [sp, #176]
    5a88:	b900b3e1 	str	w1, [sp, #176]
    5a8c:	8b20c040 	add	x0, x2, w0, sxtw
    5a90:	17ffffa7 	b	592c <_vfiprintf_r+0x18dc>
    5a94:	b940b3e0 	ldr	w0, [sp, #176]
    5a98:	37f80660 	tbnz	w0, #31, 5b64 <_vfiprintf_r+0x1b14>
    5a9c:	f94037e1 	ldr	x1, [sp, #104]
    5aa0:	91002c21 	add	x1, x1, #0xb
    5aa4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5aa8:	f94037e3 	ldr	x3, [sp, #104]
    5aac:	f90037e1 	str	x1, [sp, #104]
    5ab0:	b900b3e0 	str	w0, [sp, #176]
    5ab4:	39400680 	ldrb	w0, [x20, #1]
    5ab8:	aa0203f4 	mov	x20, x2
    5abc:	b9400064 	ldr	w4, [x3]
    5ac0:	7100009f 	cmp	w4, #0x0
    5ac4:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    5ac8:	17fff9e8 	b	4268 <_vfiprintf_r+0x218>
    5acc:	f94043e2 	ldr	x2, [sp, #128]
    5ad0:	b940b3e0 	ldr	w0, [sp, #176]
    5ad4:	b900b3e1 	str	w1, [sp, #176]
    5ad8:	8b20c040 	add	x0, x2, w0, sxtw
    5adc:	17fffe46 	b	53f4 <_vfiprintf_r+0x13a4>
    5ae0:	f94043e2 	ldr	x2, [sp, #128]
    5ae4:	b940b3e0 	ldr	w0, [sp, #176]
    5ae8:	b900b3e1 	str	w1, [sp, #176]
    5aec:	8b20c040 	add	x0, x2, w0, sxtw
    5af0:	17fffec7 	b	560c <_vfiprintf_r+0x15bc>
    5af4:	f94043e2 	ldr	x2, [sp, #128]
    5af8:	b940b3e0 	ldr	w0, [sp, #176]
    5afc:	b900b3e1 	str	w1, [sp, #176]
    5b00:	8b20c040 	add	x0, x2, w0, sxtw
    5b04:	17fffea3 	b	5590 <_vfiprintf_r+0x1540>
    5b08:	f94043e2 	ldr	x2, [sp, #128]
    5b0c:	b940b3e0 	ldr	w0, [sp, #176]
    5b10:	b900b3e1 	str	w1, [sp, #176]
    5b14:	8b20c040 	add	x0, x2, w0, sxtw
    5b18:	b9400001 	ldr	w1, [x0]
    5b1c:	17fffaf6 	b	46f4 <_vfiprintf_r+0x6a4>
    5b20:	f94043e2 	ldr	x2, [sp, #128]
    5b24:	b940b3e0 	ldr	w0, [sp, #176]
    5b28:	b900b3e1 	str	w1, [sp, #176]
    5b2c:	8b20c040 	add	x0, x2, w0, sxtw
    5b30:	17fffb33 	b	47fc <_vfiprintf_r+0x7ac>
    5b34:	f94043e3 	ldr	x3, [sp, #128]
    5b38:	b940b3e1 	ldr	w1, [sp, #176]
    5b3c:	b900b3e2 	str	w2, [sp, #176]
    5b40:	8b21c061 	add	x1, x3, w1, sxtw
    5b44:	b9400021 	ldr	w1, [x1]
    5b48:	17fffd6d 	b	50fc <_vfiprintf_r+0x10ac>
    5b4c:	f94043e3 	ldr	x3, [sp, #128]
    5b50:	b940b3e1 	ldr	w1, [sp, #176]
    5b54:	b900b3e2 	str	w2, [sp, #176]
    5b58:	8b21c061 	add	x1, x3, w1, sxtw
    5b5c:	39400021 	ldrb	w1, [x1]
    5b60:	17fffd67 	b	50fc <_vfiprintf_r+0x10ac>
    5b64:	b940b3e0 	ldr	w0, [sp, #176]
    5b68:	f94037e1 	ldr	x1, [sp, #104]
    5b6c:	11002000 	add	w0, w0, #0x8
    5b70:	7100001f 	cmp	w0, #0x0
    5b74:	5400010d 	b.le	5b94 <_vfiprintf_r+0x1b44>
    5b78:	91002c21 	add	x1, x1, #0xb
    5b7c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5b80:	17ffffca 	b	5aa8 <_vfiprintf_r+0x1a58>
    5b84:	79402320 	ldrh	w0, [x25, #16]
    5b88:	321a0000 	orr	w0, w0, #0x40
    5b8c:	79002320 	strh	w0, [x25, #16]
    5b90:	17fffa37 	b	446c <_vfiprintf_r+0x41c>
    5b94:	f94043e4 	ldr	x4, [sp, #128]
    5b98:	b940b3e3 	ldr	w3, [sp, #176]
    5b9c:	8b23c083 	add	x3, x4, w3, sxtw
    5ba0:	f90037e3 	str	x3, [sp, #104]
    5ba4:	17ffffc1 	b	5aa8 <_vfiprintf_r+0x1a58>
    5ba8:	d503201f 	nop
    5bac:	d503201f 	nop

0000000000005bb0 <vfiprintf>:
    5bb0:	aa0203e4 	mov	x4, x2
    5bb4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5bb8:	f0000023 	adrp	x3, c000 <IpcSemaphoreServer+0x558>
    5bbc:	910003fd 	mov	x29, sp
    5bc0:	a9401c46 	ldp	x6, x7, [x2]
    5bc4:	aa0003e8 	mov	x8, x0
    5bc8:	a9411484 	ldp	x4, x5, [x4, #16]
    5bcc:	aa0103e2 	mov	x2, x1
    5bd0:	f9415860 	ldr	x0, [x3, #688]
    5bd4:	aa0803e1 	mov	x1, x8
    5bd8:	910043e3 	add	x3, sp, #0x10
    5bdc:	a9011fe6 	stp	x6, x7, [sp, #16]
    5be0:	a90217e4 	stp	x4, x5, [sp, #32]
    5be4:	97fff91b 	bl	4050 <_vfiprintf_r>
    5be8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5bec:	d65f03c0 	ret

0000000000005bf0 <__sbprintf>:
    5bf0:	d11403ff 	sub	sp, sp, #0x500
    5bf4:	52808005 	mov	w5, #0x400                 	// #1024
    5bf8:	910403e6 	add	x6, sp, #0x100
    5bfc:	a9007bfd 	stp	x29, x30, [sp]
    5c00:	910003fd 	mov	x29, sp
    5c04:	a90153f3 	stp	x19, x20, [sp, #16]
    5c08:	aa0103f3 	mov	x19, x1
    5c0c:	aa0303e1 	mov	x1, x3
    5c10:	9100c3e3 	add	x3, sp, #0x30
    5c14:	f9002be6 	str	x6, [sp, #80]
    5c18:	79402264 	ldrh	w4, [x19, #16]
    5c1c:	a9403c2e 	ldp	x14, x15, [x1]
    5c20:	121e7884 	and	w4, w4, #0xfffffffd
    5c24:	7940266c 	ldrh	w12, [x19, #18]
    5c28:	a9412428 	ldp	x8, x9, [x1, #16]
    5c2c:	910143e1 	add	x1, sp, #0x50
    5c30:	f9401a6b 	ldr	x11, [x19, #48]
    5c34:	b9005fe5 	str	w5, [sp, #92]
    5c38:	f940226a 	ldr	x10, [x19, #64]
    5c3c:	a9033fee 	stp	x14, x15, [sp, #48]
    5c40:	b940ae67 	ldr	w7, [x19, #172]
    5c44:	f90013f5 	str	x21, [sp, #32]
    5c48:	aa0003f5 	mov	x21, x0
    5c4c:	a90427e8 	stp	x8, x9, [sp, #64]
    5c50:	7900c3e4 	strh	w4, [sp, #96]
    5c54:	7900c7ec 	strh	w12, [sp, #98]
    5c58:	f90037e6 	str	x6, [sp, #104]
    5c5c:	b90073e5 	str	w5, [sp, #112]
    5c60:	b9007bff 	str	wzr, [sp, #120]
    5c64:	f90043eb 	str	x11, [sp, #128]
    5c68:	f9004bea 	str	x10, [sp, #144]
    5c6c:	b900ffe7 	str	w7, [sp, #252]
    5c70:	97fff8f8 	bl	4050 <_vfiprintf_r>
    5c74:	2a0003f4 	mov	w20, w0
    5c78:	37f800c0 	tbnz	w0, #31, 5c90 <__sbprintf+0xa0>
    5c7c:	910143e1 	add	x1, sp, #0x50
    5c80:	aa1503e0 	mov	x0, x21
    5c84:	9400017b 	bl	6270 <_fflush_r>
    5c88:	7100001f 	cmp	w0, #0x0
    5c8c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    5c90:	7940c3e0 	ldrh	w0, [sp, #96]
    5c94:	36300080 	tbz	w0, #6, 5ca4 <__sbprintf+0xb4>
    5c98:	79402260 	ldrh	w0, [x19, #16]
    5c9c:	321a0000 	orr	w0, w0, #0x40
    5ca0:	79002260 	strh	w0, [x19, #16]
    5ca4:	2a1403e0 	mov	w0, w20
    5ca8:	a9407bfd 	ldp	x29, x30, [sp]
    5cac:	a94153f3 	ldp	x19, x20, [sp, #16]
    5cb0:	f94013f5 	ldr	x21, [sp, #32]
    5cb4:	911403ff 	add	sp, sp, #0x500
    5cb8:	d65f03c0 	ret
    5cbc:	d503201f 	nop

0000000000005cc0 <_wcrtomb_r>:
    5cc0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5cc4:	91055004 	add	x4, x0, #0x154
    5cc8:	910003fd 	mov	x29, sp
    5ccc:	a90153f3 	stp	x19, x20, [sp, #16]
    5cd0:	aa0303f3 	mov	x19, x3
    5cd4:	f100027f 	cmp	x19, #0x0
    5cd8:	90000043 	adrp	x3, d000 <__malloc_av_+0x600>
    5cdc:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    5ce0:	aa0003f4 	mov	x20, x0
    5ce4:	f9419064 	ldr	x4, [x3, #800]
    5ce8:	aa1303e3 	mov	x3, x19
    5cec:	b4000121 	cbz	x1, 5d10 <_wcrtomb_r+0x50>
    5cf0:	d63f0080 	blr	x4
    5cf4:	2a0003e1 	mov	w1, w0
    5cf8:	93407c20 	sxtw	x0, w1
    5cfc:	3100043f 	cmn	w1, #0x1
    5d00:	54000160 	b.eq	5d2c <_wcrtomb_r+0x6c>  // b.none
    5d04:	a94153f3 	ldp	x19, x20, [sp, #16]
    5d08:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5d0c:	d65f03c0 	ret
    5d10:	910083e1 	add	x1, sp, #0x20
    5d14:	52800002 	mov	w2, #0x0                   	// #0
    5d18:	d63f0080 	blr	x4
    5d1c:	2a0003e1 	mov	w1, w0
    5d20:	93407c20 	sxtw	x0, w1
    5d24:	3100043f 	cmn	w1, #0x1
    5d28:	54fffee1 	b.ne	5d04 <_wcrtomb_r+0x44>  // b.any
    5d2c:	b900027f 	str	wzr, [x19]
    5d30:	52801141 	mov	w1, #0x8a                  	// #138
    5d34:	b9000281 	str	w1, [x20]
    5d38:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5d3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    5d40:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5d44:	d65f03c0 	ret
    5d48:	d503201f 	nop
    5d4c:	d503201f 	nop

0000000000005d50 <wcrtomb>:
    5d50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5d54:	f0000024 	adrp	x4, c000 <IpcSemaphoreServer+0x558>
    5d58:	90000043 	adrp	x3, d000 <__malloc_av_+0x600>
    5d5c:	910003fd 	mov	x29, sp
    5d60:	a90153f3 	stp	x19, x20, [sp, #16]
    5d64:	f100005f 	cmp	x2, #0x0
    5d68:	f9415894 	ldr	x20, [x4, #688]
    5d6c:	91055284 	add	x4, x20, #0x154
    5d70:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    5d74:	f9419064 	ldr	x4, [x3, #800]
    5d78:	b40001a0 	cbz	x0, 5dac <wcrtomb+0x5c>
    5d7c:	2a0103e2 	mov	w2, w1
    5d80:	aa0003e1 	mov	x1, x0
    5d84:	aa1303e3 	mov	x3, x19
    5d88:	aa1403e0 	mov	x0, x20
    5d8c:	d63f0080 	blr	x4
    5d90:	2a0003e1 	mov	w1, w0
    5d94:	93407c20 	sxtw	x0, w1
    5d98:	3100043f 	cmn	w1, #0x1
    5d9c:	540001a0 	b.eq	5dd0 <wcrtomb+0x80>  // b.none
    5da0:	a94153f3 	ldp	x19, x20, [sp, #16]
    5da4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5da8:	d65f03c0 	ret
    5dac:	910083e1 	add	x1, sp, #0x20
    5db0:	aa1303e3 	mov	x3, x19
    5db4:	aa1403e0 	mov	x0, x20
    5db8:	52800002 	mov	w2, #0x0                   	// #0
    5dbc:	d63f0080 	blr	x4
    5dc0:	2a0003e1 	mov	w1, w0
    5dc4:	93407c20 	sxtw	x0, w1
    5dc8:	3100043f 	cmn	w1, #0x1
    5dcc:	54fffea1 	b.ne	5da0 <wcrtomb+0x50>  // b.any
    5dd0:	b900027f 	str	wzr, [x19]
    5dd4:	52801141 	mov	w1, #0x8a                  	// #138
    5dd8:	b9000281 	str	w1, [x20]
    5ddc:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5de0:	a94153f3 	ldp	x19, x20, [sp, #16]
    5de4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5de8:	d65f03c0 	ret
    5dec:	d503201f 	nop

0000000000005df0 <_wcsrtombs_r>:
    5df0:	aa0403e5 	mov	x5, x4
    5df4:	aa0303e4 	mov	x4, x3
    5df8:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5dfc:	140011a9 	b	a4a0 <_wcsnrtombs_r>

0000000000005e00 <wcsrtombs>:
    5e00:	f0000026 	adrp	x6, c000 <IpcSemaphoreServer+0x558>
    5e04:	aa0003e4 	mov	x4, x0
    5e08:	aa0103e5 	mov	x5, x1
    5e0c:	aa0403e1 	mov	x1, x4
    5e10:	f94158c0 	ldr	x0, [x6, #688]
    5e14:	aa0203e4 	mov	x4, x2
    5e18:	aa0503e2 	mov	x2, x5
    5e1c:	aa0303e5 	mov	x5, x3
    5e20:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    5e24:	1400119f 	b	a4a0 <_wcsnrtombs_r>
    5e28:	d503201f 	nop
    5e2c:	d503201f 	nop

0000000000005e30 <__swsetup_r>:
    5e30:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    5e34:	f0000022 	adrp	x2, c000 <IpcSemaphoreServer+0x558>
    5e38:	910003fd 	mov	x29, sp
    5e3c:	a90153f3 	stp	x19, x20, [sp, #16]
    5e40:	aa0003f4 	mov	x20, x0
    5e44:	aa0103f3 	mov	x19, x1
    5e48:	f9415840 	ldr	x0, [x2, #688]
    5e4c:	b4000060 	cbz	x0, 5e58 <__swsetup_r+0x28>
    5e50:	b9405001 	ldr	w1, [x0, #80]
    5e54:	340004e1 	cbz	w1, 5ef0 <__swsetup_r+0xc0>
    5e58:	79c02262 	ldrsh	w2, [x19, #16]
    5e5c:	12003c41 	and	w1, w2, #0xffff
    5e60:	36180502 	tbz	w2, #3, 5f00 <__swsetup_r+0xd0>
    5e64:	f9400e63 	ldr	x3, [x19, #24]
    5e68:	b40002c3 	cbz	x3, 5ec0 <__swsetup_r+0x90>
    5e6c:	36000141 	tbz	w1, #0, 5e94 <__swsetup_r+0x64>
    5e70:	b9402260 	ldr	w0, [x19, #32]
    5e74:	b9000e7f 	str	wzr, [x19, #12]
    5e78:	4b0003e0 	neg	w0, w0
    5e7c:	b9002a60 	str	w0, [x19, #40]
    5e80:	52800000 	mov	w0, #0x0                   	// #0
    5e84:	b4000143 	cbz	x3, 5eac <__swsetup_r+0x7c>
    5e88:	a94153f3 	ldp	x19, x20, [sp, #16]
    5e8c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5e90:	d65f03c0 	ret
    5e94:	52800000 	mov	w0, #0x0                   	// #0
    5e98:	37080041 	tbnz	w1, #1, 5ea0 <__swsetup_r+0x70>
    5e9c:	b9402260 	ldr	w0, [x19, #32]
    5ea0:	b9000e60 	str	w0, [x19, #12]
    5ea4:	52800000 	mov	w0, #0x0                   	// #0
    5ea8:	b5ffff03 	cbnz	x3, 5e88 <__swsetup_r+0x58>
    5eac:	363ffee1 	tbz	w1, #7, 5e88 <__swsetup_r+0x58>
    5eb0:	321a0042 	orr	w2, w2, #0x40
    5eb4:	12800000 	mov	w0, #0xffffffff            	// #-1
    5eb8:	79002262 	strh	w2, [x19, #16]
    5ebc:	17fffff3 	b	5e88 <__swsetup_r+0x58>
    5ec0:	52805000 	mov	w0, #0x280                 	// #640
    5ec4:	0a000020 	and	w0, w1, w0
    5ec8:	7108001f 	cmp	w0, #0x200
    5ecc:	54fffd00 	b.eq	5e6c <__swsetup_r+0x3c>  // b.none
    5ed0:	aa1303e1 	mov	x1, x19
    5ed4:	aa1403e0 	mov	x0, x20
    5ed8:	9400085a 	bl	8040 <__smakebuf_r>
    5edc:	79c02262 	ldrsh	w2, [x19, #16]
    5ee0:	f9400e63 	ldr	x3, [x19, #24]
    5ee4:	12003c41 	and	w1, w2, #0xffff
    5ee8:	3607fd61 	tbz	w1, #0, 5e94 <__swsetup_r+0x64>
    5eec:	17ffffe1 	b	5e70 <__swsetup_r+0x40>
    5ef0:	940001e0 	bl	6670 <__sinit>
    5ef4:	79c02262 	ldrsh	w2, [x19, #16]
    5ef8:	12003c41 	and	w1, w2, #0xffff
    5efc:	371ffb42 	tbnz	w2, #3, 5e64 <__swsetup_r+0x34>
    5f00:	362002e1 	tbz	w1, #4, 5f5c <__swsetup_r+0x12c>
    5f04:	371000e1 	tbnz	w1, #2, 5f20 <__swsetup_r+0xf0>
    5f08:	f9400e63 	ldr	x3, [x19, #24]
    5f0c:	321d0042 	orr	w2, w2, #0x8
    5f10:	79002262 	strh	w2, [x19, #16]
    5f14:	12003c41 	and	w1, w2, #0xffff
    5f18:	b5fffaa3 	cbnz	x3, 5e6c <__swsetup_r+0x3c>
    5f1c:	17ffffe9 	b	5ec0 <__swsetup_r+0x90>
    5f20:	f9402e61 	ldr	x1, [x19, #88]
    5f24:	b4000101 	cbz	x1, 5f44 <__swsetup_r+0x114>
    5f28:	9101d260 	add	x0, x19, #0x74
    5f2c:	eb00003f 	cmp	x1, x0
    5f30:	54000080 	b.eq	5f40 <__swsetup_r+0x110>  // b.none
    5f34:	aa1403e0 	mov	x0, x20
    5f38:	940002a6 	bl	69d0 <_free_r>
    5f3c:	79c02262 	ldrsh	w2, [x19, #16]
    5f40:	f9002e7f 	str	xzr, [x19, #88]
    5f44:	f9400e63 	ldr	x3, [x19, #24]
    5f48:	12800480 	mov	w0, #0xffffffdb            	// #-37
    5f4c:	0a000042 	and	w2, w2, w0
    5f50:	f9000263 	str	x3, [x19]
    5f54:	b9000a7f 	str	wzr, [x19, #8]
    5f58:	17ffffed 	b	5f0c <__swsetup_r+0xdc>
    5f5c:	52800120 	mov	w0, #0x9                   	// #9
    5f60:	b9000280 	str	w0, [x20]
    5f64:	321a0042 	orr	w2, w2, #0x40
    5f68:	12800000 	mov	w0, #0xffffffff            	// #-1
    5f6c:	79002262 	strh	w2, [x19, #16]
    5f70:	17ffffc6 	b	5e88 <__swsetup_r+0x58>
    5f74:	d503201f 	nop
    5f78:	d503201f 	nop
    5f7c:	d503201f 	nop

0000000000005f80 <abort>:
    5f80:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5f84:	528000c0 	mov	w0, #0x6                   	// #6
    5f88:	910003fd 	mov	x29, sp
    5f8c:	94000cfd 	bl	9380 <raise>
    5f90:	52800020 	mov	w0, #0x1                   	// #1
    5f94:	97fff3e3 	bl	2f20 <_exit>
    5f98:	d503201f 	nop
    5f9c:	d503201f 	nop

0000000000005fa0 <__register_exitproc>:
    5fa0:	d0000024 	adrp	x4, b000 <_fini+0xcc>
    5fa4:	f941e884 	ldr	x4, [x4, #976]
    5fa8:	f940fc85 	ldr	x5, [x4, #504]
    5fac:	b4000405 	cbz	x5, 602c <__register_exitproc+0x8c>
    5fb0:	b94008a4 	ldr	w4, [x5, #8]
    5fb4:	71007c9f 	cmp	w4, #0x1f
    5fb8:	5400040c 	b.gt	6038 <__register_exitproc+0x98>
    5fbc:	93407c86 	sxtw	x6, w4
    5fc0:	350000e0 	cbnz	w0, 5fdc <__register_exitproc+0x3c>
    5fc4:	910008c2 	add	x2, x6, #0x2
    5fc8:	11000484 	add	w4, w4, #0x1
    5fcc:	b90008a4 	str	w4, [x5, #8]
    5fd0:	52800000 	mov	w0, #0x0                   	// #0
    5fd4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    5fd8:	d65f03c0 	ret
    5fdc:	8b24cca7 	add	x7, x5, w4, sxtw #3
    5fe0:	52800028 	mov	w8, #0x1                   	// #1
    5fe4:	1ac42108 	lsl	w8, w8, w4
    5fe8:	93407c86 	sxtw	x6, w4
    5fec:	f90088e2 	str	x2, [x7, #272]
    5ff0:	b94310a2 	ldr	w2, [x5, #784]
    5ff4:	2a080042 	orr	w2, w2, w8
    5ff8:	b90310a2 	str	w2, [x5, #784]
    5ffc:	f90108e3 	str	x3, [x7, #528]
    6000:	7100081f 	cmp	w0, #0x2
    6004:	54fffe01 	b.ne	5fc4 <__register_exitproc+0x24>  // b.any
    6008:	b94314a0 	ldr	w0, [x5, #788]
    600c:	910008c2 	add	x2, x6, #0x2
    6010:	11000484 	add	w4, w4, #0x1
    6014:	b90008a4 	str	w4, [x5, #8]
    6018:	2a080008 	orr	w8, w0, w8
    601c:	b90314a8 	str	w8, [x5, #788]
    6020:	52800000 	mov	w0, #0x0                   	// #0
    6024:	f82278a1 	str	x1, [x5, x2, lsl #3]
    6028:	17ffffec 	b	5fd8 <__register_exitproc+0x38>
    602c:	91080085 	add	x5, x4, #0x200
    6030:	f900fc85 	str	x5, [x4, #504]
    6034:	17ffffdf 	b	5fb0 <__register_exitproc+0x10>
    6038:	12800000 	mov	w0, #0xffffffff            	// #-1
    603c:	d65f03c0 	ret

0000000000006040 <__sflush_r>:
    6040:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6044:	910003fd 	mov	x29, sp
    6048:	a9025bf5 	stp	x21, x22, [sp, #32]
    604c:	aa0003f6 	mov	x22, x0
    6050:	79c02020 	ldrsh	w0, [x1, #16]
    6054:	a90153f3 	stp	x19, x20, [sp, #16]
    6058:	aa0103f3 	mov	x19, x1
    605c:	37180560 	tbnz	w0, #3, 6108 <__sflush_r+0xc8>
    6060:	32150000 	orr	w0, w0, #0x800
    6064:	79002020 	strh	w0, [x1, #16]
    6068:	b9400821 	ldr	w1, [x1, #8]
    606c:	7100003f 	cmp	w1, #0x0
    6070:	5400092d 	b.le	6194 <__sflush_r+0x154>
    6074:	f9402664 	ldr	x4, [x19, #72]
    6078:	b4000944 	cbz	x4, 61a0 <__sflush_r+0x160>
    607c:	b94002d4 	ldr	w20, [x22]
    6080:	12003c01 	and	w1, w0, #0xffff
    6084:	b90002df 	str	wzr, [x22]
    6088:	37600960 	tbnz	w0, #12, 61b4 <__sflush_r+0x174>
    608c:	f9401a61 	ldr	x1, [x19, #48]
    6090:	d2800002 	mov	x2, #0x0                   	// #0
    6094:	aa1603e0 	mov	x0, x22
    6098:	52800023 	mov	w3, #0x1                   	// #1
    609c:	d63f0080 	blr	x4
    60a0:	aa0003e2 	mov	x2, x0
    60a4:	b100041f 	cmn	x0, #0x1
    60a8:	54000d00 	b.eq	6248 <__sflush_r+0x208>  // b.none
    60ac:	79402261 	ldrh	w1, [x19, #16]
    60b0:	f9402664 	ldr	x4, [x19, #72]
    60b4:	361000e1 	tbz	w1, #2, 60d0 <__sflush_r+0x90>
    60b8:	f9402e60 	ldr	x0, [x19, #88]
    60bc:	b9800a61 	ldrsw	x1, [x19, #8]
    60c0:	cb010042 	sub	x2, x2, x1
    60c4:	b4000060 	cbz	x0, 60d0 <__sflush_r+0x90>
    60c8:	b9807260 	ldrsw	x0, [x19, #112]
    60cc:	cb000042 	sub	x2, x2, x0
    60d0:	f9401a61 	ldr	x1, [x19, #48]
    60d4:	aa1603e0 	mov	x0, x22
    60d8:	52800003 	mov	w3, #0x0                   	// #0
    60dc:	d63f0080 	blr	x4
    60e0:	b100041f 	cmn	x0, #0x1
    60e4:	540006c1 	b.ne	61bc <__sflush_r+0x17c>  // b.any
    60e8:	b94002c2 	ldr	w2, [x22]
    60ec:	7100745f 	cmp	w2, #0x1d
    60f0:	54000929 	b.ls	6214 <__sflush_r+0x1d4>  // b.plast
    60f4:	79c02261 	ldrsh	w1, [x19, #16]
    60f8:	321a0021 	orr	w1, w1, #0x40
    60fc:	12800000 	mov	w0, #0xffffffff            	// #-1
    6100:	79002261 	strh	w1, [x19, #16]
    6104:	14000028 	b	61a4 <__sflush_r+0x164>
    6108:	f9400c35 	ldr	x21, [x1, #24]
    610c:	b40004b5 	cbz	x21, 61a0 <__sflush_r+0x160>
    6110:	12003c01 	and	w1, w0, #0xffff
    6114:	52800002 	mov	w2, #0x0                   	// #0
    6118:	f9400260 	ldr	x0, [x19]
    611c:	f9000275 	str	x21, [x19]
    6120:	cb150000 	sub	x0, x0, x21
    6124:	2a0003f4 	mov	w20, w0
    6128:	f240043f 	tst	x1, #0x3
    612c:	54000041 	b.ne	6134 <__sflush_r+0xf4>  // b.any
    6130:	b9402262 	ldr	w2, [x19, #32]
    6134:	b9000e62 	str	w2, [x19, #12]
    6138:	7100001f 	cmp	w0, #0x0
    613c:	540000ac 	b.gt	6150 <__sflush_r+0x110>
    6140:	14000018 	b	61a0 <__sflush_r+0x160>
    6144:	8b20c2b5 	add	x21, x21, w0, sxtw
    6148:	7100029f 	cmp	w20, #0x0
    614c:	540002ad 	b.le	61a0 <__sflush_r+0x160>
    6150:	f9401a61 	ldr	x1, [x19, #48]
    6154:	2a1403e3 	mov	w3, w20
    6158:	f9402264 	ldr	x4, [x19, #64]
    615c:	aa1503e2 	mov	x2, x21
    6160:	aa1603e0 	mov	x0, x22
    6164:	d63f0080 	blr	x4
    6168:	4b000294 	sub	w20, w20, w0
    616c:	7100001f 	cmp	w0, #0x0
    6170:	54fffeac 	b.gt	6144 <__sflush_r+0x104>
    6174:	79402261 	ldrh	w1, [x19, #16]
    6178:	12800000 	mov	w0, #0xffffffff            	// #-1
    617c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6180:	321a0021 	orr	w1, w1, #0x40
    6184:	79002261 	strh	w1, [x19, #16]
    6188:	a94153f3 	ldp	x19, x20, [sp, #16]
    618c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6190:	d65f03c0 	ret
    6194:	b9407261 	ldr	w1, [x19, #112]
    6198:	7100003f 	cmp	w1, #0x0
    619c:	54fff6cc 	b.gt	6074 <__sflush_r+0x34>
    61a0:	52800000 	mov	w0, #0x0                   	// #0
    61a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    61a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    61ac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    61b0:	d65f03c0 	ret
    61b4:	f9404a62 	ldr	x2, [x19, #144]
    61b8:	17ffffbf 	b	60b4 <__sflush_r+0x74>
    61bc:	79c02261 	ldrsh	w1, [x19, #16]
    61c0:	f9400e62 	ldr	x2, [x19, #24]
    61c4:	12147821 	and	w1, w1, #0xfffff7ff
    61c8:	f9000262 	str	x2, [x19]
    61cc:	b9000a7f 	str	wzr, [x19, #8]
    61d0:	79002261 	strh	w1, [x19, #16]
    61d4:	36600041 	tbz	w1, #12, 61dc <__sflush_r+0x19c>
    61d8:	f9004a60 	str	x0, [x19, #144]
    61dc:	f9402e61 	ldr	x1, [x19, #88]
    61e0:	b90002d4 	str	w20, [x22]
    61e4:	b4fffde1 	cbz	x1, 61a0 <__sflush_r+0x160>
    61e8:	9101d260 	add	x0, x19, #0x74
    61ec:	eb00003f 	cmp	x1, x0
    61f0:	54000060 	b.eq	61fc <__sflush_r+0x1bc>  // b.none
    61f4:	aa1603e0 	mov	x0, x22
    61f8:	940001f6 	bl	69d0 <_free_r>
    61fc:	f9002e7f 	str	xzr, [x19, #88]
    6200:	52800000 	mov	w0, #0x0                   	// #0
    6204:	a94153f3 	ldp	x19, x20, [sp, #16]
    6208:	a9425bf5 	ldp	x21, x22, [sp, #32]
    620c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6210:	d65f03c0 	ret
    6214:	d2800023 	mov	x3, #0x1                   	// #1
    6218:	79c02261 	ldrsh	w1, [x19, #16]
    621c:	f2a40803 	movk	x3, #0x2040, lsl #16
    6220:	9ac22463 	lsr	x3, x3, x2
    6224:	3607f6a3 	tbz	w3, #0, 60f8 <__sflush_r+0xb8>
    6228:	f9400e63 	ldr	x3, [x19, #24]
    622c:	12147821 	and	w1, w1, #0xfffff7ff
    6230:	f9000263 	str	x3, [x19]
    6234:	b9000a7f 	str	wzr, [x19, #8]
    6238:	79002261 	strh	w1, [x19, #16]
    623c:	3667fd01 	tbz	w1, #12, 61dc <__sflush_r+0x19c>
    6240:	35fffce2 	cbnz	w2, 61dc <__sflush_r+0x19c>
    6244:	17ffffe5 	b	61d8 <__sflush_r+0x198>
    6248:	b94002c0 	ldr	w0, [x22]
    624c:	34fff300 	cbz	w0, 60ac <__sflush_r+0x6c>
    6250:	7100741f 	cmp	w0, #0x1d
    6254:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    6258:	54fff8e1 	b.ne	6174 <__sflush_r+0x134>  // b.any
    625c:	52800000 	mov	w0, #0x0                   	// #0
    6260:	b90002d4 	str	w20, [x22]
    6264:	17ffffd0 	b	61a4 <__sflush_r+0x164>
    6268:	d503201f 	nop
    626c:	d503201f 	nop

0000000000006270 <_fflush_r>:
    6270:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6274:	910003fd 	mov	x29, sp
    6278:	f9000bf3 	str	x19, [sp, #16]
    627c:	aa0003f3 	mov	x19, x0
    6280:	b4000060 	cbz	x0, 628c <_fflush_r+0x1c>
    6284:	b9405002 	ldr	w2, [x0, #80]
    6288:	340000e2 	cbz	w2, 62a4 <_fflush_r+0x34>
    628c:	79c02020 	ldrsh	w0, [x1, #16]
    6290:	35000140 	cbnz	w0, 62b8 <_fflush_r+0x48>
    6294:	52800000 	mov	w0, #0x0                   	// #0
    6298:	f9400bf3 	ldr	x19, [sp, #16]
    629c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    62a0:	d65f03c0 	ret
    62a4:	f90017e1 	str	x1, [sp, #40]
    62a8:	940000f2 	bl	6670 <__sinit>
    62ac:	f94017e1 	ldr	x1, [sp, #40]
    62b0:	79c02020 	ldrsh	w0, [x1, #16]
    62b4:	34ffff00 	cbz	w0, 6294 <_fflush_r+0x24>
    62b8:	aa1303e0 	mov	x0, x19
    62bc:	f9400bf3 	ldr	x19, [sp, #16]
    62c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    62c4:	17ffff5f 	b	6040 <__sflush_r>
    62c8:	d503201f 	nop
    62cc:	d503201f 	nop

00000000000062d0 <fflush>:
    62d0:	b4000340 	cbz	x0, 6338 <fflush+0x68>
    62d4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    62d8:	910003fd 	mov	x29, sp
    62dc:	a90153f3 	stp	x19, x20, [sp, #16]
    62e0:	aa0003f3 	mov	x19, x0
    62e4:	d0000020 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    62e8:	f9415814 	ldr	x20, [x0, #688]
    62ec:	b4000074 	cbz	x20, 62f8 <fflush+0x28>
    62f0:	b9405280 	ldr	w0, [x20, #80]
    62f4:	34000180 	cbz	w0, 6324 <fflush+0x54>
    62f8:	79c02260 	ldrsh	w0, [x19, #16]
    62fc:	350000a0 	cbnz	w0, 6310 <fflush+0x40>
    6300:	52800000 	mov	w0, #0x0                   	// #0
    6304:	a94153f3 	ldp	x19, x20, [sp, #16]
    6308:	a8c27bfd 	ldp	x29, x30, [sp], #32
    630c:	d65f03c0 	ret
    6310:	aa1303e1 	mov	x1, x19
    6314:	aa1403e0 	mov	x0, x20
    6318:	a94153f3 	ldp	x19, x20, [sp, #16]
    631c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6320:	17ffff48 	b	6040 <__sflush_r>
    6324:	aa1403e0 	mov	x0, x20
    6328:	940000d2 	bl	6670 <__sinit>
    632c:	79c02260 	ldrsh	w0, [x19, #16]
    6330:	34fffe80 	cbz	w0, 6300 <fflush+0x30>
    6334:	17fffff7 	b	6310 <fflush+0x40>
    6338:	b0000020 	adrp	x0, b000 <_fini+0xcc>
    633c:	90000001 	adrp	x1, 6000 <__register_exitproc+0x60>
    6340:	9109c021 	add	x1, x1, #0x270
    6344:	f941e800 	ldr	x0, [x0, #976]
    6348:	140003b2 	b	7210 <_fwalk_reent>
    634c:	d503201f 	nop

0000000000006350 <__fp_lock>:
    6350:	52800000 	mov	w0, #0x0                   	// #0
    6354:	d65f03c0 	ret
    6358:	d503201f 	nop
    635c:	d503201f 	nop

0000000000006360 <_cleanup_r>:
    6360:	90000021 	adrp	x1, a000 <_strtol_l.part.0+0xd0>
    6364:	91270021 	add	x1, x1, #0x9c0
    6368:	140003aa 	b	7210 <_fwalk_reent>
    636c:	d503201f 	nop

0000000000006370 <__fp_unlock>:
    6370:	52800000 	mov	w0, #0x0                   	// #0
    6374:	d65f03c0 	ret
    6378:	d503201f 	nop
    637c:	d503201f 	nop

0000000000006380 <__sinit.part.0>:
    6380:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6384:	52800065 	mov	w5, #0x3                   	// #3
    6388:	90000001 	adrp	x1, 6000 <__register_exitproc+0x60>
    638c:	910003fd 	mov	x29, sp
    6390:	a9025bf5 	stp	x21, x22, [sp, #32]
    6394:	aa0003f5 	mov	x21, x0
    6398:	9114e2a4 	add	x4, x21, #0x538
    639c:	a90153f3 	stp	x19, x20, [sp, #16]
    63a0:	910d8020 	add	x0, x1, #0x360
    63a4:	52800083 	mov	w3, #0x4                   	// #4
    63a8:	f94006b3 	ldr	x19, [x21, #8]
    63ac:	a90363f7 	stp	x23, x24, [sp, #48]
    63b0:	d2800102 	mov	x2, #0x8                   	// #8
    63b4:	f90023f9 	str	x25, [sp, #64]
    63b8:	52800001 	mov	w1, #0x0                   	// #0
    63bc:	f9002ea0 	str	x0, [x21, #88]
    63c0:	91029260 	add	x0, x19, #0xa4
    63c4:	f90292bf 	str	xzr, [x21, #1312]
    63c8:	f0000018 	adrp	x24, 9000 <_reclaim_reent>
    63cc:	b9052aa5 	str	w5, [x21, #1320]
    63d0:	911b0318 	add	x24, x24, #0x6c0
    63d4:	f9029aa4 	str	x4, [x21, #1328]
    63d8:	f0000017 	adrp	x23, 9000 <_reclaim_reent>
    63dc:	a9007e7f 	stp	xzr, xzr, [x19]
    63e0:	911cc2f7 	add	x23, x23, #0x730
    63e4:	f0000016 	adrp	x22, 9000 <_reclaim_reent>
    63e8:	b9001263 	str	w3, [x19, #16]
    63ec:	911e02d6 	add	x22, x22, #0x780
    63f0:	f9000e7f 	str	xzr, [x19, #24]
    63f4:	f0000019 	adrp	x25, 9000 <_reclaim_reent>
    63f8:	b900227f 	str	wzr, [x19, #32]
    63fc:	91198339 	add	x25, x25, #0x660
    6400:	b9002a7f 	str	wzr, [x19, #40]
    6404:	b900ae7f 	str	wzr, [x19, #172]
    6408:	97fff63e 	bl	3d00 <memset>
    640c:	f9400ab4 	ldr	x20, [x21, #16]
    6410:	52800123 	mov	w3, #0x9                   	// #9
    6414:	a9036673 	stp	x19, x25, [x19, #48]
    6418:	72a00023 	movk	w3, #0x1, lsl #16
    641c:	91029280 	add	x0, x20, #0xa4
    6420:	a9045e78 	stp	x24, x23, [x19, #64]
    6424:	d2800102 	mov	x2, #0x8                   	// #8
    6428:	52800001 	mov	w1, #0x0                   	// #0
    642c:	f9002a76 	str	x22, [x19, #80]
    6430:	a9007e9f 	stp	xzr, xzr, [x20]
    6434:	b9001283 	str	w3, [x20, #16]
    6438:	f9000e9f 	str	xzr, [x20, #24]
    643c:	b900229f 	str	wzr, [x20, #32]
    6440:	b9002a9f 	str	wzr, [x20, #40]
    6444:	b900ae9f 	str	wzr, [x20, #172]
    6448:	97fff62e 	bl	3d00 <memset>
    644c:	f9400eb3 	ldr	x19, [x21, #24]
    6450:	52800243 	mov	w3, #0x12                  	// #18
    6454:	a9036694 	stp	x20, x25, [x20, #48]
    6458:	72a00043 	movk	w3, #0x2, lsl #16
    645c:	91029260 	add	x0, x19, #0xa4
    6460:	a9045e98 	stp	x24, x23, [x20, #64]
    6464:	d2800102 	mov	x2, #0x8                   	// #8
    6468:	52800001 	mov	w1, #0x0                   	// #0
    646c:	f9002a96 	str	x22, [x20, #80]
    6470:	a9007e7f 	stp	xzr, xzr, [x19]
    6474:	b9001263 	str	w3, [x19, #16]
    6478:	f9000e7f 	str	xzr, [x19, #24]
    647c:	b900227f 	str	wzr, [x19, #32]
    6480:	b9002a7f 	str	wzr, [x19, #40]
    6484:	b900ae7f 	str	wzr, [x19, #172]
    6488:	97fff61e 	bl	3d00 <memset>
    648c:	a9036673 	stp	x19, x25, [x19, #48]
    6490:	52800020 	mov	w0, #0x1                   	// #1
    6494:	a9045e78 	stp	x24, x23, [x19, #64]
    6498:	f9002a76 	str	x22, [x19, #80]
    649c:	a94153f3 	ldp	x19, x20, [sp, #16]
    64a0:	a94363f7 	ldp	x23, x24, [sp, #48]
    64a4:	f94023f9 	ldr	x25, [sp, #64]
    64a8:	b90052a0 	str	w0, [x21, #80]
    64ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    64b0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    64b4:	d65f03c0 	ret
    64b8:	d503201f 	nop
    64bc:	d503201f 	nop

00000000000064c0 <__sfmoreglue>:
    64c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    64c4:	52801602 	mov	w2, #0xb0                  	// #176
    64c8:	910003fd 	mov	x29, sp
    64cc:	a90153f3 	stp	x19, x20, [sp, #16]
    64d0:	51000434 	sub	w20, w1, #0x1
    64d4:	f90013f5 	str	x21, [sp, #32]
    64d8:	2a0103f5 	mov	w21, w1
    64dc:	9b227e94 	smull	x20, w20, w2
    64e0:	91032281 	add	x1, x20, #0xc8
    64e4:	97fff367 	bl	3280 <_malloc_r>
    64e8:	aa0003f3 	mov	x19, x0
    64ec:	b4000100 	cbz	x0, 650c <__sfmoreglue+0x4c>
    64f0:	91006000 	add	x0, x0, #0x18
    64f4:	f900027f 	str	xzr, [x19]
    64f8:	b9000a75 	str	w21, [x19, #8]
    64fc:	9102c282 	add	x2, x20, #0xb0
    6500:	f9000a60 	str	x0, [x19, #16]
    6504:	52800001 	mov	w1, #0x0                   	// #0
    6508:	97fff5fe 	bl	3d00 <memset>
    650c:	aa1303e0 	mov	x0, x19
    6510:	a94153f3 	ldp	x19, x20, [sp, #16]
    6514:	f94013f5 	ldr	x21, [sp, #32]
    6518:	a8c37bfd 	ldp	x29, x30, [sp], #48
    651c:	d65f03c0 	ret

0000000000006520 <__sfp>:
    6520:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6524:	b0000021 	adrp	x1, b000 <_fini+0xcc>
    6528:	910003fd 	mov	x29, sp
    652c:	a90153f3 	stp	x19, x20, [sp, #16]
    6530:	f941e834 	ldr	x20, [x1, #976]
    6534:	f9001fe0 	str	x0, [sp, #56]
    6538:	f90013f5 	str	x21, [sp, #32]
    653c:	b9405280 	ldr	w0, [x20, #80]
    6540:	34000560 	cbz	w0, 65ec <__sfp+0xcc>
    6544:	91148294 	add	x20, x20, #0x520
    6548:	52800095 	mov	w21, #0x4                   	// #4
    654c:	b9400a80 	ldr	w0, [x20, #8]
    6550:	f9400a93 	ldr	x19, [x20, #16]
    6554:	7100001f 	cmp	w0, #0x0
    6558:	5400042d 	b.le	65dc <__sfp+0xbc>
    655c:	51000400 	sub	w0, w0, #0x1
    6560:	91000400 	add	x0, x0, #0x1
    6564:	8b000401 	add	x1, x0, x0, lsl #1
    6568:	d37ef421 	lsl	x1, x1, #2
    656c:	cb000021 	sub	x1, x1, x0
    6570:	8b011261 	add	x1, x19, x1, lsl #4
    6574:	14000004 	b	6584 <__sfp+0x64>
    6578:	9102c273 	add	x19, x19, #0xb0
    657c:	eb01027f 	cmp	x19, x1
    6580:	540002e0 	b.eq	65dc <__sfp+0xbc>  // b.none
    6584:	79c02260 	ldrsh	w0, [x19, #16]
    6588:	35ffff80 	cbnz	w0, 6578 <__sfp+0x58>
    658c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    6590:	a9007e7f 	stp	xzr, xzr, [x19]
    6594:	d2800102 	mov	x2, #0x8                   	// #8
    6598:	b9001260 	str	w0, [x19, #16]
    659c:	52800001 	mov	w1, #0x0                   	// #0
    65a0:	f9000e7f 	str	xzr, [x19, #24]
    65a4:	91029260 	add	x0, x19, #0xa4
    65a8:	b900227f 	str	wzr, [x19, #32]
    65ac:	b9002a7f 	str	wzr, [x19, #40]
    65b0:	b900ae7f 	str	wzr, [x19, #172]
    65b4:	97fff5d3 	bl	3d00 <memset>
    65b8:	f9002e7f 	str	xzr, [x19, #88]
    65bc:	b900627f 	str	wzr, [x19, #96]
    65c0:	f9003e7f 	str	xzr, [x19, #120]
    65c4:	b900827f 	str	wzr, [x19, #128]
    65c8:	aa1303e0 	mov	x0, x19
    65cc:	a94153f3 	ldp	x19, x20, [sp, #16]
    65d0:	f94013f5 	ldr	x21, [sp, #32]
    65d4:	a8c47bfd 	ldp	x29, x30, [sp], #64
    65d8:	d65f03c0 	ret
    65dc:	f9400293 	ldr	x19, [x20]
    65e0:	b40000d3 	cbz	x19, 65f8 <__sfp+0xd8>
    65e4:	aa1303f4 	mov	x20, x19
    65e8:	17ffffd9 	b	654c <__sfp+0x2c>
    65ec:	aa1403e0 	mov	x0, x20
    65f0:	97ffff64 	bl	6380 <__sinit.part.0>
    65f4:	17ffffd4 	b	6544 <__sfp+0x24>
    65f8:	f9401fe0 	ldr	x0, [sp, #56]
    65fc:	d2805b01 	mov	x1, #0x2d8                 	// #728
    6600:	97fff320 	bl	3280 <_malloc_r>
    6604:	aa0003f3 	mov	x19, x0
    6608:	b4000160 	cbz	x0, 6634 <__sfp+0x114>
    660c:	91006000 	add	x0, x0, #0x18
    6610:	f900027f 	str	xzr, [x19]
    6614:	b9000a75 	str	w21, [x19, #8]
    6618:	d2805802 	mov	x2, #0x2c0                 	// #704
    661c:	f9000a60 	str	x0, [x19, #16]
    6620:	52800001 	mov	w1, #0x0                   	// #0
    6624:	97fff5b7 	bl	3d00 <memset>
    6628:	f9000293 	str	x19, [x20]
    662c:	aa1303f4 	mov	x20, x19
    6630:	17ffffc7 	b	654c <__sfp+0x2c>
    6634:	f9401fe1 	ldr	x1, [sp, #56]
    6638:	f900029f 	str	xzr, [x20]
    663c:	52800180 	mov	w0, #0xc                   	// #12
    6640:	b9000020 	str	w0, [x1]
    6644:	17ffffe1 	b	65c8 <__sfp+0xa8>
    6648:	d503201f 	nop
    664c:	d503201f 	nop

0000000000006650 <_cleanup>:
    6650:	b0000020 	adrp	x0, b000 <_fini+0xcc>
    6654:	90000021 	adrp	x1, a000 <_strtol_l.part.0+0xd0>
    6658:	91270021 	add	x1, x1, #0x9c0
    665c:	f941e800 	ldr	x0, [x0, #976]
    6660:	140002ec 	b	7210 <_fwalk_reent>
    6664:	d503201f 	nop
    6668:	d503201f 	nop
    666c:	d503201f 	nop

0000000000006670 <__sinit>:
    6670:	b9405001 	ldr	w1, [x0, #80]
    6674:	34000041 	cbz	w1, 667c <__sinit+0xc>
    6678:	d65f03c0 	ret
    667c:	17ffff41 	b	6380 <__sinit.part.0>

0000000000006680 <__sfp_lock_acquire>:
    6680:	d65f03c0 	ret
    6684:	d503201f 	nop
    6688:	d503201f 	nop
    668c:	d503201f 	nop

0000000000006690 <__sfp_lock_release>:
    6690:	d65f03c0 	ret
    6694:	d503201f 	nop
    6698:	d503201f 	nop
    669c:	d503201f 	nop

00000000000066a0 <__sinit_lock_acquire>:
    66a0:	d65f03c0 	ret
    66a4:	d503201f 	nop
    66a8:	d503201f 	nop
    66ac:	d503201f 	nop

00000000000066b0 <__sinit_lock_release>:
    66b0:	d65f03c0 	ret
    66b4:	d503201f 	nop
    66b8:	d503201f 	nop
    66bc:	d503201f 	nop

00000000000066c0 <__fp_lock_all>:
    66c0:	d0000020 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    66c4:	90000001 	adrp	x1, 6000 <__register_exitproc+0x60>
    66c8:	910d4021 	add	x1, x1, #0x350
    66cc:	f9415800 	ldr	x0, [x0, #688]
    66d0:	140002a8 	b	7170 <_fwalk>
    66d4:	d503201f 	nop
    66d8:	d503201f 	nop
    66dc:	d503201f 	nop

00000000000066e0 <__fp_unlock_all>:
    66e0:	d0000020 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    66e4:	90000001 	adrp	x1, 6000 <__register_exitproc+0x60>
    66e8:	910dc021 	add	x1, x1, #0x370
    66ec:	f9415800 	ldr	x0, [x0, #688]
    66f0:	140002a0 	b	7170 <_fwalk>
    66f4:	d503201f 	nop
    66f8:	d503201f 	nop
    66fc:	d503201f 	nop

0000000000006700 <__fputwc>:
    6700:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6704:	910003fd 	mov	x29, sp
    6708:	a90153f3 	stp	x19, x20, [sp, #16]
    670c:	aa0203f3 	mov	x19, x2
    6710:	a9025bf5 	stp	x21, x22, [sp, #32]
    6714:	2a0103f6 	mov	w22, w1
    6718:	a90363f7 	stp	x23, x24, [sp, #48]
    671c:	aa0003f7 	mov	x23, x0
    6720:	9400062c 	bl	7fd0 <__locale_mb_cur_max>
    6724:	7100041f 	cmp	w0, #0x1
    6728:	54000081 	b.ne	6738 <__fputwc+0x38>  // b.any
    672c:	510006c0 	sub	w0, w22, #0x1
    6730:	7103f81f 	cmp	w0, #0xfe
    6734:	54000509 	b.ls	67d4 <__fputwc+0xd4>  // b.plast
    6738:	91029263 	add	x3, x19, #0xa4
    673c:	2a1603e2 	mov	w2, w22
    6740:	910123e1 	add	x1, sp, #0x48
    6744:	aa1703e0 	mov	x0, x23
    6748:	97fffd5e 	bl	5cc0 <_wcrtomb_r>
    674c:	aa0003f5 	mov	x21, x0
    6750:	b100041f 	cmn	x0, #0x1
    6754:	54000540 	b.eq	67fc <__fputwc+0xfc>  // b.none
    6758:	b4000460 	cbz	x0, 67e4 <__fputwc+0xe4>
    675c:	394123e1 	ldrb	w1, [sp, #72]
    6760:	910123f8 	add	x24, sp, #0x48
    6764:	d2800014 	mov	x20, #0x0                   	// #0
    6768:	14000009 	b	678c <__fputwc+0x8c>
    676c:	f9400263 	ldr	x3, [x19]
    6770:	91000464 	add	x4, x3, #0x1
    6774:	f9000264 	str	x4, [x19]
    6778:	39000061 	strb	w1, [x3]
    677c:	91000694 	add	x20, x20, #0x1
    6780:	eb15029f 	cmp	x20, x21
    6784:	54000302 	b.cs	67e4 <__fputwc+0xe4>  // b.hs, b.nlast
    6788:	38786a81 	ldrb	w1, [x20, x24]
    678c:	b9400e63 	ldr	w3, [x19, #12]
    6790:	51000463 	sub	w3, w3, #0x1
    6794:	b9000e63 	str	w3, [x19, #12]
    6798:	36fffea3 	tbz	w3, #31, 676c <__fputwc+0x6c>
    679c:	b9402a64 	ldr	w4, [x19, #40]
    67a0:	aa1303e2 	mov	x2, x19
    67a4:	aa1703e0 	mov	x0, x23
    67a8:	6b04007f 	cmp	w3, w4
    67ac:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    67b0:	54fffde1 	b.ne	676c <__fputwc+0x6c>  // b.any
    67b4:	94000e77 	bl	a190 <__swbuf_r>
    67b8:	3100041f 	cmn	w0, #0x1
    67bc:	54fffe01 	b.ne	677c <__fputwc+0x7c>  // b.any
    67c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    67c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    67c8:	a94363f7 	ldp	x23, x24, [sp, #48]
    67cc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    67d0:	d65f03c0 	ret
    67d4:	12001ec1 	and	w1, w22, #0xff
    67d8:	d2800035 	mov	x21, #0x1                   	// #1
    67dc:	390123e1 	strb	w1, [sp, #72]
    67e0:	17ffffe0 	b	6760 <__fputwc+0x60>
    67e4:	2a1603e0 	mov	w0, w22
    67e8:	a94153f3 	ldp	x19, x20, [sp, #16]
    67ec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    67f0:	a94363f7 	ldp	x23, x24, [sp, #48]
    67f4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    67f8:	d65f03c0 	ret
    67fc:	79402261 	ldrh	w1, [x19, #16]
    6800:	321a0021 	orr	w1, w1, #0x40
    6804:	79002261 	strh	w1, [x19, #16]
    6808:	17ffffee 	b	67c0 <__fputwc+0xc0>
    680c:	d503201f 	nop

0000000000006810 <_fputwc_r>:
    6810:	79c02043 	ldrsh	w3, [x2, #16]
    6814:	376800c3 	tbnz	w3, #13, 682c <_fputwc_r+0x1c>
    6818:	b940ac44 	ldr	w4, [x2, #172]
    681c:	32130063 	orr	w3, w3, #0x2000
    6820:	79002043 	strh	w3, [x2, #16]
    6824:	32130083 	orr	w3, w4, #0x2000
    6828:	b900ac43 	str	w3, [x2, #172]
    682c:	17ffffb5 	b	6700 <__fputwc>

0000000000006830 <fputwc>:
    6830:	d0000023 	adrp	x3, c000 <IpcSemaphoreServer+0x558>
    6834:	aa0103e2 	mov	x2, x1
    6838:	2a0003e1 	mov	w1, w0
    683c:	f9415860 	ldr	x0, [x3, #688]
    6840:	b4000060 	cbz	x0, 684c <fputwc+0x1c>
    6844:	b9405003 	ldr	w3, [x0, #80]
    6848:	34000123 	cbz	w3, 686c <fputwc+0x3c>
    684c:	79c02043 	ldrsh	w3, [x2, #16]
    6850:	376800c3 	tbnz	w3, #13, 6868 <fputwc+0x38>
    6854:	b940ac44 	ldr	w4, [x2, #172]
    6858:	32130063 	orr	w3, w3, #0x2000
    685c:	79002043 	strh	w3, [x2, #16]
    6860:	32130083 	orr	w3, w4, #0x2000
    6864:	b900ac43 	str	w3, [x2, #172]
    6868:	17ffffa6 	b	6700 <__fputwc>
    686c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6870:	910003fd 	mov	x29, sp
    6874:	f9000fe0 	str	x0, [sp, #24]
    6878:	b90027e1 	str	w1, [sp, #36]
    687c:	f90017e2 	str	x2, [sp, #40]
    6880:	97ffff7c 	bl	6670 <__sinit>
    6884:	f94017e2 	ldr	x2, [sp, #40]
    6888:	b94027e1 	ldr	w1, [sp, #36]
    688c:	f9400fe0 	ldr	x0, [sp, #24]
    6890:	79c02043 	ldrsh	w3, [x2, #16]
    6894:	376800c3 	tbnz	w3, #13, 68ac <fputwc+0x7c>
    6898:	b940ac44 	ldr	w4, [x2, #172]
    689c:	32130063 	orr	w3, w3, #0x2000
    68a0:	79002043 	strh	w3, [x2, #16]
    68a4:	32130083 	orr	w3, w4, #0x2000
    68a8:	b900ac43 	str	w3, [x2, #172]
    68ac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    68b0:	17ffff94 	b	6700 <__fputwc>
    68b4:	d503201f 	nop
    68b8:	d503201f 	nop
    68bc:	d503201f 	nop

00000000000068c0 <_malloc_trim_r>:
    68c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    68c4:	910003fd 	mov	x29, sp
    68c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    68cc:	d0000036 	adrp	x22, c000 <IpcSemaphoreServer+0x558>
    68d0:	912802d6 	add	x22, x22, #0xa00
    68d4:	aa0003f5 	mov	x21, x0
    68d8:	a90153f3 	stp	x19, x20, [sp, #16]
    68dc:	aa0103f3 	mov	x19, x1
    68e0:	97fff580 	bl	3ee0 <__malloc_lock>
    68e4:	f9400ac0 	ldr	x0, [x22, #16]
    68e8:	f9400414 	ldr	x20, [x0, #8]
    68ec:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    68f0:	cb130293 	sub	x19, x20, x19
    68f4:	913f7e73 	add	x19, x19, #0xfdf
    68f8:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    68fc:	d1400673 	sub	x19, x19, #0x1, lsl #12
    6900:	f13ffe7f 	cmp	x19, #0xfff
    6904:	5400010d 	b.le	6924 <_malloc_trim_r+0x64>
    6908:	d2800001 	mov	x1, #0x0                   	// #0
    690c:	aa1503e0 	mov	x0, x21
    6910:	97fff57c 	bl	3f00 <_sbrk_r>
    6914:	f9400ac1 	ldr	x1, [x22, #16]
    6918:	8b140021 	add	x1, x1, x20
    691c:	eb01001f 	cmp	x0, x1
    6920:	54000100 	b.eq	6940 <_malloc_trim_r+0x80>  // b.none
    6924:	aa1503e0 	mov	x0, x21
    6928:	97fff572 	bl	3ef0 <__malloc_unlock>
    692c:	52800000 	mov	w0, #0x0                   	// #0
    6930:	a94153f3 	ldp	x19, x20, [sp, #16]
    6934:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6938:	a8c37bfd 	ldp	x29, x30, [sp], #48
    693c:	d65f03c0 	ret
    6940:	cb1303e1 	neg	x1, x19
    6944:	aa1503e0 	mov	x0, x21
    6948:	97fff56e 	bl	3f00 <_sbrk_r>
    694c:	b100041f 	cmn	x0, #0x1
    6950:	54000200 	b.eq	6990 <_malloc_trim_r+0xd0>  // b.none
    6954:	f0000022 	adrp	x2, d000 <__malloc_av_+0x600>
    6958:	cb130294 	sub	x20, x20, x19
    695c:	f9400ac3 	ldr	x3, [x22, #16]
    6960:	b2400294 	orr	x20, x20, #0x1
    6964:	b9454841 	ldr	w1, [x2, #1352]
    6968:	aa1503e0 	mov	x0, x21
    696c:	f9000474 	str	x20, [x3, #8]
    6970:	4b130033 	sub	w19, w1, w19
    6974:	b9054853 	str	w19, [x2, #1352]
    6978:	97fff55e 	bl	3ef0 <__malloc_unlock>
    697c:	52800020 	mov	w0, #0x1                   	// #1
    6980:	a94153f3 	ldp	x19, x20, [sp, #16]
    6984:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6988:	a8c37bfd 	ldp	x29, x30, [sp], #48
    698c:	d65f03c0 	ret
    6990:	d2800001 	mov	x1, #0x0                   	// #0
    6994:	aa1503e0 	mov	x0, x21
    6998:	97fff55a 	bl	3f00 <_sbrk_r>
    699c:	f9400ac2 	ldr	x2, [x22, #16]
    69a0:	cb020001 	sub	x1, x0, x2
    69a4:	f1007c3f 	cmp	x1, #0x1f
    69a8:	54fffbed 	b.le	6924 <_malloc_trim_r+0x64>
    69ac:	f0000024 	adrp	x4, d000 <__malloc_av_+0x600>
    69b0:	b2400021 	orr	x1, x1, #0x1
    69b4:	f9000441 	str	x1, [x2, #8]
    69b8:	f0000023 	adrp	x3, d000 <__malloc_av_+0x600>
    69bc:	f9410881 	ldr	x1, [x4, #528]
    69c0:	cb010000 	sub	x0, x0, x1
    69c4:	b9054860 	str	w0, [x3, #1352]
    69c8:	17ffffd7 	b	6924 <_malloc_trim_r+0x64>
    69cc:	d503201f 	nop

00000000000069d0 <_free_r>:
    69d0:	b4000a21 	cbz	x1, 6b14 <_free_r+0x144>
    69d4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    69d8:	910003fd 	mov	x29, sp
    69dc:	a90153f3 	stp	x19, x20, [sp, #16]
    69e0:	aa0103f3 	mov	x19, x1
    69e4:	aa0003f4 	mov	x20, x0
    69e8:	97fff53e 	bl	3ee0 <__malloc_lock>
    69ec:	f85f8265 	ldur	x5, [x19, #-8]
    69f0:	d1004263 	sub	x3, x19, #0x10
    69f4:	d0000020 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    69f8:	91280000 	add	x0, x0, #0xa00
    69fc:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    6a00:	8b020064 	add	x4, x3, x2
    6a04:	f9400806 	ldr	x6, [x0, #16]
    6a08:	f9400481 	ldr	x1, [x4, #8]
    6a0c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    6a10:	eb0400df 	cmp	x6, x4
    6a14:	54000c60 	b.eq	6ba0 <_free_r+0x1d0>  // b.none
    6a18:	f9000481 	str	x1, [x4, #8]
    6a1c:	8b010086 	add	x6, x4, x1
    6a20:	37000345 	tbnz	w5, #0, 6a88 <_free_r+0xb8>
    6a24:	f85f0267 	ldur	x7, [x19, #-16]
    6a28:	d0000025 	adrp	x5, c000 <IpcSemaphoreServer+0x558>
    6a2c:	f94004c6 	ldr	x6, [x6, #8]
    6a30:	cb070063 	sub	x3, x3, x7
    6a34:	8b070042 	add	x2, x2, x7
    6a38:	912840a5 	add	x5, x5, #0xa10
    6a3c:	924000c6 	and	x6, x6, #0x1
    6a40:	f9400867 	ldr	x7, [x3, #16]
    6a44:	eb0500ff 	cmp	x7, x5
    6a48:	54000940 	b.eq	6b70 <_free_r+0x1a0>  // b.none
    6a4c:	f9400c68 	ldr	x8, [x3, #24]
    6a50:	f9000ce8 	str	x8, [x7, #24]
    6a54:	f9000907 	str	x7, [x8, #16]
    6a58:	b50001c6 	cbnz	x6, 6a90 <_free_r+0xc0>
    6a5c:	8b010042 	add	x2, x2, x1
    6a60:	f9400881 	ldr	x1, [x4, #16]
    6a64:	b2400046 	orr	x6, x2, #0x1
    6a68:	eb05003f 	cmp	x1, x5
    6a6c:	54000ee0 	b.eq	6c48 <_free_r+0x278>  // b.none
    6a70:	f9400c84 	ldr	x4, [x4, #24]
    6a74:	f9000c24 	str	x4, [x1, #24]
    6a78:	f9000881 	str	x1, [x4, #16]
    6a7c:	f9000466 	str	x6, [x3, #8]
    6a80:	f8226862 	str	x2, [x3, x2]
    6a84:	14000006 	b	6a9c <_free_r+0xcc>
    6a88:	f94004c5 	ldr	x5, [x6, #8]
    6a8c:	36000465 	tbz	w5, #0, 6b18 <_free_r+0x148>
    6a90:	b2400041 	orr	x1, x2, #0x1
    6a94:	f9000461 	str	x1, [x3, #8]
    6a98:	f9000082 	str	x2, [x4]
    6a9c:	f107fc5f 	cmp	x2, #0x1ff
    6aa0:	54000449 	b.ls	6b28 <_free_r+0x158>  // b.plast
    6aa4:	d349fc41 	lsr	x1, x2, #9
    6aa8:	f127fc5f 	cmp	x2, #0x9ff
    6aac:	54000a28 	b.hi	6bf0 <_free_r+0x220>  // b.pmore
    6ab0:	d346fc41 	lsr	x1, x2, #6
    6ab4:	1100e424 	add	w4, w1, #0x39
    6ab8:	1100e025 	add	w5, w1, #0x38
    6abc:	531f7884 	lsl	w4, w4, #1
    6ac0:	937d7c84 	sbfiz	x4, x4, #3, #32
    6ac4:	8b040004 	add	x4, x0, x4
    6ac8:	f85f0481 	ldr	x1, [x4], #-16
    6acc:	eb01009f 	cmp	x4, x1
    6ad0:	54000ae0 	b.eq	6c2c <_free_r+0x25c>  // b.none
    6ad4:	d503201f 	nop
    6ad8:	f9400420 	ldr	x0, [x1, #8]
    6adc:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    6ae0:	eb02001f 	cmp	x0, x2
    6ae4:	54000089 	b.ls	6af4 <_free_r+0x124>  // b.plast
    6ae8:	f9400821 	ldr	x1, [x1, #16]
    6aec:	eb01009f 	cmp	x4, x1
    6af0:	54ffff41 	b.ne	6ad8 <_free_r+0x108>  // b.any
    6af4:	f9400c24 	ldr	x4, [x1, #24]
    6af8:	a9011061 	stp	x1, x4, [x3, #16]
    6afc:	aa1403e0 	mov	x0, x20
    6b00:	f9000883 	str	x3, [x4, #16]
    6b04:	f9000c23 	str	x3, [x1, #24]
    6b08:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b0c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6b10:	17fff4f8 	b	3ef0 <__malloc_unlock>
    6b14:	d65f03c0 	ret
    6b18:	d0000025 	adrp	x5, c000 <IpcSemaphoreServer+0x558>
    6b1c:	8b010042 	add	x2, x2, x1
    6b20:	912840a5 	add	x5, x5, #0xa10
    6b24:	17ffffcf 	b	6a60 <_free_r+0x90>
    6b28:	d343fc42 	lsr	x2, x2, #3
    6b2c:	d2800024 	mov	x4, #0x1                   	// #1
    6b30:	11000441 	add	w1, w2, #0x1
    6b34:	f9400405 	ldr	x5, [x0, #8]
    6b38:	531f7821 	lsl	w1, w1, #1
    6b3c:	13027c42 	asr	w2, w2, #2
    6b40:	8b21cc01 	add	x1, x0, w1, sxtw #3
    6b44:	9ac22082 	lsl	x2, x4, x2
    6b48:	aa050042 	orr	x2, x2, x5
    6b4c:	f9000402 	str	x2, [x0, #8]
    6b50:	f85f0420 	ldr	x0, [x1], #-16
    6b54:	a9010460 	stp	x0, x1, [x3, #16]
    6b58:	f9000823 	str	x3, [x1, #16]
    6b5c:	f9000c03 	str	x3, [x0, #24]
    6b60:	aa1403e0 	mov	x0, x20
    6b64:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b68:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6b6c:	17fff4e1 	b	3ef0 <__malloc_unlock>
    6b70:	b50009c6 	cbnz	x6, 6ca8 <_free_r+0x2d8>
    6b74:	a9410085 	ldp	x5, x0, [x4, #16]
    6b78:	8b020021 	add	x1, x1, x2
    6b7c:	f9000ca0 	str	x0, [x5, #24]
    6b80:	b2400022 	orr	x2, x1, #0x1
    6b84:	f9000805 	str	x5, [x0, #16]
    6b88:	aa1403e0 	mov	x0, x20
    6b8c:	f9000462 	str	x2, [x3, #8]
    6b90:	f8216861 	str	x1, [x3, x1]
    6b94:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b98:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6b9c:	17fff4d5 	b	3ef0 <__malloc_unlock>
    6ba0:	8b010041 	add	x1, x2, x1
    6ba4:	370000e5 	tbnz	w5, #0, 6bc0 <_free_r+0x1f0>
    6ba8:	f85f0262 	ldur	x2, [x19, #-16]
    6bac:	cb020063 	sub	x3, x3, x2
    6bb0:	8b020021 	add	x1, x1, x2
    6bb4:	a9410864 	ldp	x4, x2, [x3, #16]
    6bb8:	f9000c82 	str	x2, [x4, #24]
    6bbc:	f9000844 	str	x4, [x2, #16]
    6bc0:	f0000022 	adrp	x2, d000 <__malloc_av_+0x600>
    6bc4:	b2400024 	orr	x4, x1, #0x1
    6bc8:	f9000464 	str	x4, [x3, #8]
    6bcc:	f9410c42 	ldr	x2, [x2, #536]
    6bd0:	f9000803 	str	x3, [x0, #16]
    6bd4:	eb01005f 	cmp	x2, x1
    6bd8:	54fffc48 	b.hi	6b60 <_free_r+0x190>  // b.pmore
    6bdc:	f0000021 	adrp	x1, d000 <__malloc_av_+0x600>
    6be0:	aa1403e0 	mov	x0, x20
    6be4:	f942c021 	ldr	x1, [x1, #1408]
    6be8:	97ffff36 	bl	68c0 <_malloc_trim_r>
    6bec:	17ffffdd 	b	6b60 <_free_r+0x190>
    6bf0:	f100503f 	cmp	x1, #0x14
    6bf4:	54000129 	b.ls	6c18 <_free_r+0x248>  // b.plast
    6bf8:	f101503f 	cmp	x1, #0x54
    6bfc:	54000308 	b.hi	6c5c <_free_r+0x28c>  // b.pmore
    6c00:	d34cfc41 	lsr	x1, x2, #12
    6c04:	1101bc24 	add	w4, w1, #0x6f
    6c08:	1101b825 	add	w5, w1, #0x6e
    6c0c:	531f7884 	lsl	w4, w4, #1
    6c10:	937d7c84 	sbfiz	x4, x4, #3, #32
    6c14:	17ffffac 	b	6ac4 <_free_r+0xf4>
    6c18:	11017024 	add	w4, w1, #0x5c
    6c1c:	11016c25 	add	w5, w1, #0x5b
    6c20:	531f7884 	lsl	w4, w4, #1
    6c24:	937d7c84 	sbfiz	x4, x4, #3, #32
    6c28:	17ffffa7 	b	6ac4 <_free_r+0xf4>
    6c2c:	f9400406 	ldr	x6, [x0, #8]
    6c30:	13027ca5 	asr	w5, w5, #2
    6c34:	d2800022 	mov	x2, #0x1                   	// #1
    6c38:	9ac52045 	lsl	x5, x2, x5
    6c3c:	aa0600a5 	orr	x5, x5, x6
    6c40:	f9000405 	str	x5, [x0, #8]
    6c44:	17ffffad 	b	6af8 <_free_r+0x128>
    6c48:	a9020c03 	stp	x3, x3, [x0, #32]
    6c4c:	a9009466 	stp	x6, x5, [x3, #8]
    6c50:	f9000c65 	str	x5, [x3, #24]
    6c54:	f8226862 	str	x2, [x3, x2]
    6c58:	17ffffc2 	b	6b60 <_free_r+0x190>
    6c5c:	f105503f 	cmp	x1, #0x154
    6c60:	540000e8 	b.hi	6c7c <_free_r+0x2ac>  // b.pmore
    6c64:	d34ffc41 	lsr	x1, x2, #15
    6c68:	1101e024 	add	w4, w1, #0x78
    6c6c:	1101dc25 	add	w5, w1, #0x77
    6c70:	531f7884 	lsl	w4, w4, #1
    6c74:	937d7c84 	sbfiz	x4, x4, #3, #32
    6c78:	17ffff93 	b	6ac4 <_free_r+0xf4>
    6c7c:	f115503f 	cmp	x1, #0x554
    6c80:	540000e8 	b.hi	6c9c <_free_r+0x2cc>  // b.pmore
    6c84:	d352fc41 	lsr	x1, x2, #18
    6c88:	1101f424 	add	w4, w1, #0x7d
    6c8c:	1101f025 	add	w5, w1, #0x7c
    6c90:	531f7884 	lsl	w4, w4, #1
    6c94:	937d7c84 	sbfiz	x4, x4, #3, #32
    6c98:	17ffff8b 	b	6ac4 <_free_r+0xf4>
    6c9c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    6ca0:	52800fc5 	mov	w5, #0x7e                  	// #126
    6ca4:	17ffff88 	b	6ac4 <_free_r+0xf4>
    6ca8:	b2400040 	orr	x0, x2, #0x1
    6cac:	f9000460 	str	x0, [x3, #8]
    6cb0:	f9000082 	str	x2, [x4]
    6cb4:	17ffffab 	b	6b60 <_free_r+0x190>
    6cb8:	d503201f 	nop
    6cbc:	d503201f 	nop

0000000000006cc0 <__sfvwrite_r>:
    6cc0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    6cc4:	910003fd 	mov	x29, sp
    6cc8:	a90363f7 	stp	x23, x24, [sp, #48]
    6ccc:	aa0003f7 	mov	x23, x0
    6cd0:	f9400840 	ldr	x0, [x2, #16]
    6cd4:	b4000460 	cbz	x0, 6d60 <__sfvwrite_r+0xa0>
    6cd8:	79402023 	ldrh	w3, [x1, #16]
    6cdc:	aa0203f8 	mov	x24, x2
    6ce0:	a90153f3 	stp	x19, x20, [sp, #16]
    6ce4:	aa0103f3 	mov	x19, x1
    6ce8:	36180443 	tbz	w3, #3, 6d70 <__sfvwrite_r+0xb0>
    6cec:	f9400c20 	ldr	x0, [x1, #24]
    6cf0:	b4000400 	cbz	x0, 6d70 <__sfvwrite_r+0xb0>
    6cf4:	a9025bf5 	stp	x21, x22, [sp, #32]
    6cf8:	a9046bf9 	stp	x25, x26, [sp, #64]
    6cfc:	f9400314 	ldr	x20, [x24]
    6d00:	360804a3 	tbz	w3, #1, 6d94 <__sfvwrite_r+0xd4>
    6d04:	d2800016 	mov	x22, #0x0                   	// #0
    6d08:	d2800015 	mov	x21, #0x0                   	// #0
    6d0c:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    6d10:	eb1902bf 	cmp	x21, x25
    6d14:	aa1603e2 	mov	x2, x22
    6d18:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    6d1c:	aa1703e0 	mov	x0, x23
    6d20:	b4000875 	cbz	x21, 6e2c <__sfvwrite_r+0x16c>
    6d24:	f9401a61 	ldr	x1, [x19, #48]
    6d28:	f9402264 	ldr	x4, [x19, #64]
    6d2c:	d63f0080 	blr	x4
    6d30:	7100001f 	cmp	w0, #0x0
    6d34:	5400206d 	b.le	7140 <__sfvwrite_r+0x480>
    6d38:	f9400b01 	ldr	x1, [x24, #16]
    6d3c:	93407c00 	sxtw	x0, w0
    6d40:	8b0002d6 	add	x22, x22, x0
    6d44:	cb0002b5 	sub	x21, x21, x0
    6d48:	cb000020 	sub	x0, x1, x0
    6d4c:	f9000b00 	str	x0, [x24, #16]
    6d50:	b5fffe00 	cbnz	x0, 6d10 <__sfvwrite_r+0x50>
    6d54:	a94153f3 	ldp	x19, x20, [sp, #16]
    6d58:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6d5c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6d60:	52800000 	mov	w0, #0x0                   	// #0
    6d64:	a94363f7 	ldp	x23, x24, [sp, #48]
    6d68:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6d6c:	d65f03c0 	ret
    6d70:	aa1303e1 	mov	x1, x19
    6d74:	aa1703e0 	mov	x0, x23
    6d78:	97fffc2e 	bl	5e30 <__swsetup_r>
    6d7c:	35001f00 	cbnz	w0, 715c <__sfvwrite_r+0x49c>
    6d80:	79402263 	ldrh	w3, [x19, #16]
    6d84:	a9025bf5 	stp	x21, x22, [sp, #32]
    6d88:	a9046bf9 	stp	x25, x26, [sp, #64]
    6d8c:	f9400314 	ldr	x20, [x24]
    6d90:	370ffba3 	tbnz	w3, #1, 6d04 <__sfvwrite_r+0x44>
    6d94:	a90573fb 	stp	x27, x28, [sp, #80]
    6d98:	37000503 	tbnz	w3, #0, 6e38 <__sfvwrite_r+0x178>
    6d9c:	d280001c 	mov	x28, #0x0                   	// #0
    6da0:	d2800015 	mov	x21, #0x0                   	// #0
    6da4:	d503201f 	nop
    6da8:	b40003d5 	cbz	x21, 6e20 <__sfvwrite_r+0x160>
    6dac:	f9400266 	ldr	x6, [x19]
    6db0:	b9400e7a 	ldr	w26, [x19, #12]
    6db4:	aa0603e0 	mov	x0, x6
    6db8:	36480ac3 	tbz	w3, #9, 6f10 <__sfvwrite_r+0x250>
    6dbc:	93407f5b 	sxtw	x27, w26
    6dc0:	eb15037f 	cmp	x27, x21
    6dc4:	540010c9 	b.ls	6fdc <__sfvwrite_r+0x31c>  // b.plast
    6dc8:	93407ea1 	sxtw	x1, w21
    6dcc:	aa0103f6 	mov	x22, x1
    6dd0:	aa0603e0 	mov	x0, x6
    6dd4:	aa0103fb 	mov	x27, x1
    6dd8:	2a1503fa 	mov	w26, w21
    6ddc:	aa1b03e2 	mov	x2, x27
    6de0:	aa1c03e1 	mov	x1, x28
    6de4:	97fff397 	bl	3c40 <memmove>
    6de8:	f9400261 	ldr	x1, [x19]
    6dec:	b9400e60 	ldr	w0, [x19, #12]
    6df0:	8b1b0022 	add	x2, x1, x27
    6df4:	f9000262 	str	x2, [x19]
    6df8:	4b1a0000 	sub	w0, w0, w26
    6dfc:	b9000e60 	str	w0, [x19, #12]
    6e00:	f9400b00 	ldr	x0, [x24, #16]
    6e04:	8b16039c 	add	x28, x28, x22
    6e08:	cb1602b5 	sub	x21, x21, x22
    6e0c:	cb160016 	sub	x22, x0, x22
    6e10:	f9000b16 	str	x22, [x24, #16]
    6e14:	b40005d6 	cbz	x22, 6ecc <__sfvwrite_r+0x20c>
    6e18:	79402263 	ldrh	w3, [x19, #16]
    6e1c:	b5fffc95 	cbnz	x21, 6dac <__sfvwrite_r+0xec>
    6e20:	a940569c 	ldp	x28, x21, [x20]
    6e24:	91004294 	add	x20, x20, #0x10
    6e28:	17ffffe0 	b	6da8 <__sfvwrite_r+0xe8>
    6e2c:	a9405696 	ldp	x22, x21, [x20]
    6e30:	91004294 	add	x20, x20, #0x10
    6e34:	17ffffb7 	b	6d10 <__sfvwrite_r+0x50>
    6e38:	5280001a 	mov	w26, #0x0                   	// #0
    6e3c:	52800000 	mov	w0, #0x0                   	// #0
    6e40:	d280001b 	mov	x27, #0x0                   	// #0
    6e44:	d2800019 	mov	x25, #0x0                   	// #0
    6e48:	b40004d9 	cbz	x25, 6ee0 <__sfvwrite_r+0x220>
    6e4c:	34000500 	cbz	w0, 6eec <__sfvwrite_r+0x22c>
    6e50:	f9400260 	ldr	x0, [x19]
    6e54:	93407f56 	sxtw	x22, w26
    6e58:	f9400e61 	ldr	x1, [x19, #24]
    6e5c:	eb1902df 	cmp	x22, x25
    6e60:	b9400e75 	ldr	w21, [x19, #12]
    6e64:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    6e68:	b9402263 	ldr	w3, [x19, #32]
    6e6c:	eb01001f 	cmp	x0, x1
    6e70:	0b150075 	add	w21, w3, w21
    6e74:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    6e78:	5400132c 	b.gt	70dc <__sfvwrite_r+0x41c>
    6e7c:	6b16007f 	cmp	w3, w22
    6e80:	5400116c 	b.gt	70ac <__sfvwrite_r+0x3ec>
    6e84:	f9401a61 	ldr	x1, [x19, #48]
    6e88:	aa1b03e2 	mov	x2, x27
    6e8c:	f9402264 	ldr	x4, [x19, #64]
    6e90:	aa1703e0 	mov	x0, x23
    6e94:	d63f0080 	blr	x4
    6e98:	2a0003f5 	mov	w21, w0
    6e9c:	7100001f 	cmp	w0, #0x0
    6ea0:	5400088d 	b.le	6fb0 <__sfvwrite_r+0x2f0>
    6ea4:	6b15035a 	subs	w26, w26, w21
    6ea8:	52800020 	mov	w0, #0x1                   	// #1
    6eac:	54000f60 	b.eq	7098 <__sfvwrite_r+0x3d8>  // b.none
    6eb0:	f9400b01 	ldr	x1, [x24, #16]
    6eb4:	93407eb5 	sxtw	x21, w21
    6eb8:	8b15037b 	add	x27, x27, x21
    6ebc:	cb150339 	sub	x25, x25, x21
    6ec0:	cb150035 	sub	x21, x1, x21
    6ec4:	f9000b15 	str	x21, [x24, #16]
    6ec8:	b5fffc15 	cbnz	x21, 6e48 <__sfvwrite_r+0x188>
    6ecc:	a94153f3 	ldp	x19, x20, [sp, #16]
    6ed0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6ed4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6ed8:	a94573fb 	ldp	x27, x28, [sp, #80]
    6edc:	17ffffa1 	b	6d60 <__sfvwrite_r+0xa0>
    6ee0:	a940669b 	ldp	x27, x25, [x20]
    6ee4:	91004294 	add	x20, x20, #0x10
    6ee8:	b4ffffd9 	cbz	x25, 6ee0 <__sfvwrite_r+0x220>
    6eec:	aa1903e2 	mov	x2, x25
    6ef0:	aa1b03e0 	mov	x0, x27
    6ef4:	52800141 	mov	w1, #0xa                   	// #10
    6ef8:	9400069b 	bl	8964 <memchr>
    6efc:	9100041a 	add	x26, x0, #0x1
    6f00:	f100001f 	cmp	x0, #0x0
    6f04:	cb1b035a 	sub	x26, x26, x27
    6f08:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    6f0c:	17ffffd1 	b	6e50 <__sfvwrite_r+0x190>
    6f10:	f9400e60 	ldr	x0, [x19, #24]
    6f14:	eb06001f 	cmp	x0, x6
    6f18:	54000263 	b.cc	6f64 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6f1c:	b9402263 	ldr	w3, [x19, #32]
    6f20:	eb23c2bf 	cmp	x21, w3, sxtw
    6f24:	54000203 	b.cc	6f64 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    6f28:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    6f2c:	eb0002bf 	cmp	x21, x0
    6f30:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    6f34:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    6f38:	f9401a61 	ldr	x1, [x19, #48]
    6f3c:	aa1c03e2 	mov	x2, x28
    6f40:	1ac30c84 	sdiv	w4, w4, w3
    6f44:	aa1703e0 	mov	x0, x23
    6f48:	f9402266 	ldr	x6, [x19, #64]
    6f4c:	1b037c83 	mul	w3, w4, w3
    6f50:	d63f00c0 	blr	x6
    6f54:	7100001f 	cmp	w0, #0x0
    6f58:	540002cd 	b.le	6fb0 <__sfvwrite_r+0x2f0>
    6f5c:	93407c16 	sxtw	x22, w0
    6f60:	17ffffa8 	b	6e00 <__sfvwrite_r+0x140>
    6f64:	93407f44 	sxtw	x4, w26
    6f68:	aa1c03e1 	mov	x1, x28
    6f6c:	eb15009f 	cmp	x4, x21
    6f70:	aa0603e0 	mov	x0, x6
    6f74:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    6f78:	93407f56 	sxtw	x22, w26
    6f7c:	aa1603e2 	mov	x2, x22
    6f80:	97fff330 	bl	3c40 <memmove>
    6f84:	f9400261 	ldr	x1, [x19]
    6f88:	b9400e60 	ldr	w0, [x19, #12]
    6f8c:	8b160021 	add	x1, x1, x22
    6f90:	f9000261 	str	x1, [x19]
    6f94:	4b1a0004 	sub	w4, w0, w26
    6f98:	b9000e64 	str	w4, [x19, #12]
    6f9c:	35fff324 	cbnz	w4, 6e00 <__sfvwrite_r+0x140>
    6fa0:	aa1303e1 	mov	x1, x19
    6fa4:	aa1703e0 	mov	x0, x23
    6fa8:	97fffcb2 	bl	6270 <_fflush_r>
    6fac:	34fff2a0 	cbz	w0, 6e00 <__sfvwrite_r+0x140>
    6fb0:	a94573fb 	ldp	x27, x28, [sp, #80]
    6fb4:	79c02261 	ldrsh	w1, [x19, #16]
    6fb8:	321a0021 	orr	w1, w1, #0x40
    6fbc:	79002261 	strh	w1, [x19, #16]
    6fc0:	12800000 	mov	w0, #0xffffffff            	// #-1
    6fc4:	a94153f3 	ldp	x19, x20, [sp, #16]
    6fc8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6fcc:	a94363f7 	ldp	x23, x24, [sp, #48]
    6fd0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6fd4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    6fd8:	d65f03c0 	ret
    6fdc:	93407eb6 	sxtw	x22, w21
    6fe0:	52809001 	mov	w1, #0x480                 	// #1152
    6fe4:	6a01007f 	tst	w3, w1
    6fe8:	54ffefa0 	b.eq	6ddc <__sfvwrite_r+0x11c>  // b.none
    6fec:	b9402267 	ldr	w7, [x19, #32]
    6ff0:	f9400e61 	ldr	x1, [x19, #24]
    6ff4:	0b0704e7 	add	w7, w7, w7, lsl #1
    6ff8:	cb0100d6 	sub	x22, x6, x1
    6ffc:	0b477ce7 	add	w7, w7, w7, lsr #31
    7000:	93407ed9 	sxtw	x25, w22
    7004:	13017cfb 	asr	w27, w7, #1
    7008:	91000720 	add	x0, x25, #0x1
    700c:	8b150000 	add	x0, x0, x21
    7010:	93407f62 	sxtw	x2, w27
    7014:	eb00005f 	cmp	x2, x0
    7018:	54000082 	b.cs	7028 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    701c:	110006c7 	add	w7, w22, #0x1
    7020:	0b1500fb 	add	w27, w7, w21
    7024:	93407f62 	sxtw	x2, w27
    7028:	36500723 	tbz	w3, #10, 710c <__sfvwrite_r+0x44c>
    702c:	aa0203e1 	mov	x1, x2
    7030:	aa1703e0 	mov	x0, x23
    7034:	97fff093 	bl	3280 <_malloc_r>
    7038:	aa0003fa 	mov	x26, x0
    703c:	b4000860 	cbz	x0, 7148 <__sfvwrite_r+0x488>
    7040:	f9400e61 	ldr	x1, [x19, #24]
    7044:	aa1903e2 	mov	x2, x25
    7048:	97fff29e 	bl	3ac0 <memcpy>
    704c:	79402260 	ldrh	w0, [x19, #16]
    7050:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    7054:	0a010000 	and	w0, w0, w1
    7058:	32190000 	orr	w0, w0, #0x80
    705c:	79002260 	strh	w0, [x19, #16]
    7060:	8b190340 	add	x0, x26, x25
    7064:	4b160366 	sub	w6, w27, w22
    7068:	93407eb6 	sxtw	x22, w21
    706c:	f9000260 	str	x0, [x19]
    7070:	b9000e66 	str	w6, [x19, #12]
    7074:	aa1603e1 	mov	x1, x22
    7078:	f9000e7a 	str	x26, [x19, #24]
    707c:	aa0003e6 	mov	x6, x0
    7080:	b900227b 	str	w27, [x19, #32]
    7084:	2a1503fa 	mov	w26, w21
    7088:	eb1502df 	cmp	x22, x21
    708c:	54ffea08 	b.hi	6dcc <__sfvwrite_r+0x10c>  // b.pmore
    7090:	aa1603fb 	mov	x27, x22
    7094:	17ffff52 	b	6ddc <__sfvwrite_r+0x11c>
    7098:	aa1303e1 	mov	x1, x19
    709c:	aa1703e0 	mov	x0, x23
    70a0:	97fffc74 	bl	6270 <_fflush_r>
    70a4:	34fff060 	cbz	w0, 6eb0 <__sfvwrite_r+0x1f0>
    70a8:	17ffffc2 	b	6fb0 <__sfvwrite_r+0x2f0>
    70ac:	93407edc 	sxtw	x28, w22
    70b0:	aa1b03e1 	mov	x1, x27
    70b4:	aa1c03e2 	mov	x2, x28
    70b8:	97fff2e2 	bl	3c40 <memmove>
    70bc:	f9400260 	ldr	x0, [x19]
    70c0:	2a1603f5 	mov	w21, w22
    70c4:	b9400e61 	ldr	w1, [x19, #12]
    70c8:	8b1c0000 	add	x0, x0, x28
    70cc:	f9000260 	str	x0, [x19]
    70d0:	4b160036 	sub	w22, w1, w22
    70d4:	b9000e76 	str	w22, [x19, #12]
    70d8:	17ffff73 	b	6ea4 <__sfvwrite_r+0x1e4>
    70dc:	93407eb6 	sxtw	x22, w21
    70e0:	aa1b03e1 	mov	x1, x27
    70e4:	aa1603e2 	mov	x2, x22
    70e8:	97fff2d6 	bl	3c40 <memmove>
    70ec:	f9400262 	ldr	x2, [x19]
    70f0:	aa1303e1 	mov	x1, x19
    70f4:	aa1703e0 	mov	x0, x23
    70f8:	8b160042 	add	x2, x2, x22
    70fc:	f9000262 	str	x2, [x19]
    7100:	97fffc5c 	bl	6270 <_fflush_r>
    7104:	34ffed00 	cbz	w0, 6ea4 <__sfvwrite_r+0x1e4>
    7108:	17ffffaa 	b	6fb0 <__sfvwrite_r+0x2f0>
    710c:	aa1703e0 	mov	x0, x23
    7110:	9400064c 	bl	8a40 <_realloc_r>
    7114:	aa0003fa 	mov	x26, x0
    7118:	b5fffa40 	cbnz	x0, 7060 <__sfvwrite_r+0x3a0>
    711c:	f9400e61 	ldr	x1, [x19, #24]
    7120:	aa1703e0 	mov	x0, x23
    7124:	97fffe2b 	bl	69d0 <_free_r>
    7128:	79c02261 	ldrsh	w1, [x19, #16]
    712c:	52800180 	mov	w0, #0xc                   	// #12
    7130:	a94573fb 	ldp	x27, x28, [sp, #80]
    7134:	12187821 	and	w1, w1, #0xffffff7f
    7138:	b90002e0 	str	w0, [x23]
    713c:	17ffff9f 	b	6fb8 <__sfvwrite_r+0x2f8>
    7140:	79c02261 	ldrsh	w1, [x19, #16]
    7144:	17ffff9d 	b	6fb8 <__sfvwrite_r+0x2f8>
    7148:	79c02261 	ldrsh	w1, [x19, #16]
    714c:	52800180 	mov	w0, #0xc                   	// #12
    7150:	a94573fb 	ldp	x27, x28, [sp, #80]
    7154:	b90002e0 	str	w0, [x23]
    7158:	17ffff98 	b	6fb8 <__sfvwrite_r+0x2f8>
    715c:	12800000 	mov	w0, #0xffffffff            	// #-1
    7160:	a94153f3 	ldp	x19, x20, [sp, #16]
    7164:	17ffff00 	b	6d64 <__sfvwrite_r+0xa4>
    7168:	d503201f 	nop
    716c:	d503201f 	nop

0000000000007170 <_fwalk>:
    7170:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7174:	910003fd 	mov	x29, sp
    7178:	a9025bf5 	stp	x21, x22, [sp, #32]
    717c:	91148015 	add	x21, x0, #0x520
    7180:	aa0103f6 	mov	x22, x1
    7184:	a90153f3 	stp	x19, x20, [sp, #16]
    7188:	f9001bf7 	str	x23, [sp, #48]
    718c:	52800017 	mov	w23, #0x0                   	// #0
    7190:	b9400aa0 	ldr	w0, [x21, #8]
    7194:	f9400ab3 	ldr	x19, [x21, #16]
    7198:	7100001f 	cmp	w0, #0x0
    719c:	5400026d 	b.le	71e8 <_fwalk+0x78>
    71a0:	51000400 	sub	w0, w0, #0x1
    71a4:	91000400 	add	x0, x0, #0x1
    71a8:	8b000414 	add	x20, x0, x0, lsl #1
    71ac:	d37ef694 	lsl	x20, x20, #2
    71b0:	cb000294 	sub	x20, x20, x0
    71b4:	8b141274 	add	x20, x19, x20, lsl #4
    71b8:	79402260 	ldrh	w0, [x19, #16]
    71bc:	7100041f 	cmp	w0, #0x1
    71c0:	540000e9 	b.ls	71dc <_fwalk+0x6c>  // b.plast
    71c4:	79c02662 	ldrsh	w2, [x19, #18]
    71c8:	aa1303e0 	mov	x0, x19
    71cc:	3100045f 	cmn	w2, #0x1
    71d0:	54000060 	b.eq	71dc <_fwalk+0x6c>  // b.none
    71d4:	d63f02c0 	blr	x22
    71d8:	2a0002f7 	orr	w23, w23, w0
    71dc:	9102c273 	add	x19, x19, #0xb0
    71e0:	eb13029f 	cmp	x20, x19
    71e4:	54fffea1 	b.ne	71b8 <_fwalk+0x48>  // b.any
    71e8:	f94002b5 	ldr	x21, [x21]
    71ec:	b5fffd35 	cbnz	x21, 7190 <_fwalk+0x20>
    71f0:	2a1703e0 	mov	w0, w23
    71f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    71f8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    71fc:	f9401bf7 	ldr	x23, [sp, #48]
    7200:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7204:	d65f03c0 	ret
    7208:	d503201f 	nop
    720c:	d503201f 	nop

0000000000007210 <_fwalk_reent>:
    7210:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7214:	910003fd 	mov	x29, sp
    7218:	a9025bf5 	stp	x21, x22, [sp, #32]
    721c:	aa0103f6 	mov	x22, x1
    7220:	91148015 	add	x21, x0, #0x520
    7224:	a90363f7 	stp	x23, x24, [sp, #48]
    7228:	aa0003f8 	mov	x24, x0
    722c:	52800017 	mov	w23, #0x0                   	// #0
    7230:	a90153f3 	stp	x19, x20, [sp, #16]
    7234:	d503201f 	nop
    7238:	b9400aa2 	ldr	w2, [x21, #8]
    723c:	f9400ab3 	ldr	x19, [x21, #16]
    7240:	7100005f 	cmp	w2, #0x0
    7244:	5400028d 	b.le	7294 <_fwalk_reent+0x84>
    7248:	51000442 	sub	w2, w2, #0x1
    724c:	91000442 	add	x2, x2, #0x1
    7250:	8b020454 	add	x20, x2, x2, lsl #1
    7254:	d37ef694 	lsl	x20, x20, #2
    7258:	cb020294 	sub	x20, x20, x2
    725c:	8b141274 	add	x20, x19, x20, lsl #4
    7260:	79402262 	ldrh	w2, [x19, #16]
    7264:	7100045f 	cmp	w2, #0x1
    7268:	54000109 	b.ls	7288 <_fwalk_reent+0x78>  // b.plast
    726c:	79c02662 	ldrsh	w2, [x19, #18]
    7270:	aa1303e1 	mov	x1, x19
    7274:	aa1803e0 	mov	x0, x24
    7278:	3100045f 	cmn	w2, #0x1
    727c:	54000060 	b.eq	7288 <_fwalk_reent+0x78>  // b.none
    7280:	d63f02c0 	blr	x22
    7284:	2a0002f7 	orr	w23, w23, w0
    7288:	9102c273 	add	x19, x19, #0xb0
    728c:	eb13029f 	cmp	x20, x19
    7290:	54fffe81 	b.ne	7260 <_fwalk_reent+0x50>  // b.any
    7294:	f94002b5 	ldr	x21, [x21]
    7298:	b5fffd15 	cbnz	x21, 7238 <_fwalk_reent+0x28>
    729c:	2a1703e0 	mov	w0, w23
    72a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    72a4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    72a8:	a94363f7 	ldp	x23, x24, [sp, #48]
    72ac:	a8c47bfd 	ldp	x29, x30, [sp], #64
    72b0:	d65f03c0 	ret
    72b4:	d503201f 	nop
    72b8:	d503201f 	nop
    72bc:	d503201f 	nop

00000000000072c0 <__localeconv_l>:
    72c0:	91040000 	add	x0, x0, #0x100
    72c4:	d65f03c0 	ret
    72c8:	d503201f 	nop
    72cc:	d503201f 	nop

00000000000072d0 <_localeconv_r>:
    72d0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    72d4:	910d0000 	add	x0, x0, #0x340
    72d8:	d65f03c0 	ret
    72dc:	d503201f 	nop

00000000000072e0 <localeconv>:
    72e0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    72e4:	910d0000 	add	x0, x0, #0x340
    72e8:	d65f03c0 	ret
    72ec:	d503201f 	nop

00000000000072f0 <currentlocale>:
    72f0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    72f4:	910003fd 	mov	x29, sp
    72f8:	a90153f3 	stp	x19, x20, [sp, #16]
    72fc:	d0000034 	adrp	x20, d000 <__malloc_av_+0x600>
    7300:	91090294 	add	x20, x20, #0x240
    7304:	a9025bf5 	stp	x21, x22, [sp, #32]
    7308:	91010296 	add	x22, x20, #0x40
    730c:	d0000035 	adrp	x21, d000 <__malloc_av_+0x600>
    7310:	911642b5 	add	x21, x21, #0x590
    7314:	f9001bf7 	str	x23, [sp, #48]
    7318:	91038297 	add	x23, x20, #0xe0
    731c:	91008294 	add	x20, x20, #0x20
    7320:	aa1603f3 	mov	x19, x22
    7324:	aa1503e0 	mov	x0, x21
    7328:	aa1403e1 	mov	x1, x20
    732c:	940009d5 	bl	9a80 <strcpy>
    7330:	aa1303e1 	mov	x1, x19
    7334:	aa1403e0 	mov	x0, x20
    7338:	91008273 	add	x19, x19, #0x20
    733c:	94000991 	bl	9980 <strcmp>
    7340:	35000120 	cbnz	w0, 7364 <currentlocale+0x74>
    7344:	eb17027f 	cmp	x19, x23
    7348:	54ffff41 	b.ne	7330 <currentlocale+0x40>  // b.any
    734c:	aa1503e0 	mov	x0, x21
    7350:	a94153f3 	ldp	x19, x20, [sp, #16]
    7354:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7358:	f9401bf7 	ldr	x23, [sp, #48]
    735c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7360:	d65f03c0 	ret
    7364:	90000033 	adrp	x19, b000 <_fini+0xcc>
    7368:	91142273 	add	x19, x19, #0x508
    736c:	aa1303e1 	mov	x1, x19
    7370:	aa1503e0 	mov	x0, x21
    7374:	94000923 	bl	9800 <strcat>
    7378:	aa1603e1 	mov	x1, x22
    737c:	aa1503e0 	mov	x0, x21
    7380:	910082d6 	add	x22, x22, #0x20
    7384:	9400091f 	bl	9800 <strcat>
    7388:	eb1702df 	cmp	x22, x23
    738c:	54ffff01 	b.ne	736c <currentlocale+0x7c>  // b.any
    7390:	aa1503e0 	mov	x0, x21
    7394:	a94153f3 	ldp	x19, x20, [sp, #16]
    7398:	a9425bf5 	ldp	x21, x22, [sp, #32]
    739c:	f9401bf7 	ldr	x23, [sp, #48]
    73a0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    73a4:	d65f03c0 	ret
    73a8:	d503201f 	nop
    73ac:	d503201f 	nop

00000000000073b0 <__loadlocale>:
    73b0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    73b4:	910003fd 	mov	x29, sp
    73b8:	a90153f3 	stp	x19, x20, [sp, #16]
    73bc:	937b7c34 	sbfiz	x20, x1, #5, #32
    73c0:	8b140014 	add	x20, x0, x20
    73c4:	aa0203f3 	mov	x19, x2
    73c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    73cc:	aa0003f6 	mov	x22, x0
    73d0:	aa0203e0 	mov	x0, x2
    73d4:	a90363f7 	stp	x23, x24, [sp, #48]
    73d8:	2a0103f7 	mov	w23, w1
    73dc:	aa1403e1 	mov	x1, x20
    73e0:	94000968 	bl	9980 <strcmp>
    73e4:	350000e0 	cbnz	w0, 7400 <__loadlocale+0x50>
    73e8:	aa1403e0 	mov	x0, x20
    73ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    73f0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    73f4:	a94363f7 	ldp	x23, x24, [sp, #48]
    73f8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    73fc:	d65f03c0 	ret
    7400:	aa1303e0 	mov	x0, x19
    7404:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7408:	90000035 	adrp	x21, b000 <_fini+0xcc>
    740c:	91144021 	add	x1, x1, #0x510
    7410:	911462b5 	add	x21, x21, #0x518
    7414:	a9046bf9 	stp	x25, x26, [sp, #64]
    7418:	9400095a 	bl	9980 <strcmp>
    741c:	34000d80 	cbz	w0, 75cc <__loadlocale+0x21c>
    7420:	aa1503e1 	mov	x1, x21
    7424:	aa1303e0 	mov	x0, x19
    7428:	94000956 	bl	9980 <strcmp>
    742c:	2a0003f5 	mov	w21, w0
    7430:	34000be0 	cbz	w0, 75ac <__loadlocale+0x1fc>
    7434:	39400260 	ldrb	w0, [x19]
    7438:	71010c1f 	cmp	w0, #0x43
    743c:	54000d00 	b.eq	75dc <__loadlocale+0x22c>  // b.none
    7440:	51018400 	sub	w0, w0, #0x61
    7444:	12001c00 	and	w0, w0, #0xff
    7448:	7100641f 	cmp	w0, #0x19
    744c:	54000a08 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    7450:	39400660 	ldrb	w0, [x19, #1]
    7454:	51018400 	sub	w0, w0, #0x61
    7458:	12001c00 	and	w0, w0, #0xff
    745c:	7100641f 	cmp	w0, #0x19
    7460:	54000968 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    7464:	39400a60 	ldrb	w0, [x19, #2]
    7468:	91000a75 	add	x21, x19, #0x2
    746c:	51018401 	sub	w1, w0, #0x61
    7470:	12001c21 	and	w1, w1, #0xff
    7474:	7100643f 	cmp	w1, #0x19
    7478:	54000068 	b.hi	7484 <__loadlocale+0xd4>  // b.pmore
    747c:	39400e60 	ldrb	w0, [x19, #3]
    7480:	91000e75 	add	x21, x19, #0x3
    7484:	71017c1f 	cmp	w0, #0x5f
    7488:	54000d00 	b.eq	7628 <__loadlocale+0x278>  // b.none
    748c:	7100b81f 	cmp	w0, #0x2e
    7490:	54002ec0 	b.eq	7a68 <__loadlocale+0x6b8>  // b.none
    7494:	528017e1 	mov	w1, #0xbf                  	// #191
    7498:	6a01001f 	tst	w0, w1
    749c:	54000781 	b.ne	758c <__loadlocale+0x1dc>  // b.any
    74a0:	910203f8 	add	x24, sp, #0x80
    74a4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    74a8:	aa1803e0 	mov	x0, x24
    74ac:	9114a021 	add	x1, x1, #0x528
    74b0:	94000974 	bl	9a80 <strcpy>
    74b4:	394002a0 	ldrb	w0, [x21]
    74b8:	7101001f 	cmp	w0, #0x40
    74bc:	54002da0 	b.eq	7a70 <__loadlocale+0x6c0>  // b.none
    74c0:	52800019 	mov	w25, #0x0                   	// #0
    74c4:	52800015 	mov	w21, #0x0                   	// #0
    74c8:	5280001a 	mov	w26, #0x0                   	// #0
    74cc:	394203e1 	ldrb	w1, [sp, #128]
    74d0:	51010421 	sub	w1, w1, #0x41
    74d4:	7100d03f 	cmp	w1, #0x34
    74d8:	540005a8 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    74dc:	90000020 	adrp	x0, b000 <_fini+0xcc>
    74e0:	91188000 	add	x0, x0, #0x620
    74e4:	a90573fb 	stp	x27, x28, [sp, #80]
    74e8:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    74ec:	10000061 	adr	x1, 74f8 <__loadlocale+0x148>
    74f0:	8b20a820 	add	x0, x1, w0, sxth #2
    74f4:	d61f0000 	br	x0
    74f8:	394207e0 	ldrb	w0, [sp, #129]
    74fc:	121a7800 	and	w0, w0, #0xffffffdf
    7500:	12001c00 	and	w0, w0, #0xff
    7504:	7101401f 	cmp	w0, #0x50
    7508:	54000401 	b.ne	7588 <__loadlocale+0x1d8>  // b.any
    750c:	d2800042 	mov	x2, #0x2                   	// #2
    7510:	aa1803e0 	mov	x0, x24
    7514:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7518:	9116e021 	add	x1, x1, #0x5b8
    751c:	94000a5d 	bl	9e90 <strncpy>
    7520:	9101e3e1 	add	x1, sp, #0x78
    7524:	91020be0 	add	x0, sp, #0x82
    7528:	52800142 	mov	w2, #0xa                   	// #10
    752c:	94000b05 	bl	a140 <strtol>
    7530:	f9403fe1 	ldr	x1, [sp, #120]
    7534:	39400021 	ldrb	w1, [x1]
    7538:	35000281 	cbnz	w1, 7588 <__loadlocale+0x1d8>
    753c:	f10e901f 	cmp	x0, #0x3a4
    7540:	540030a0 	b.eq	7b54 <__loadlocale+0x7a4>  // b.none
    7544:	54002f2c 	b.gt	7b28 <__loadlocale+0x778>
    7548:	f10d881f 	cmp	x0, #0x362
    754c:	54002dec 	b.gt	7b08 <__loadlocale+0x758>
    7550:	f10d441f 	cmp	x0, #0x351
    7554:	54002c8c 	b.gt	7ae4 <__loadlocale+0x734>
    7558:	f106d41f 	cmp	x0, #0x1b5
    755c:	54002da0 	b.eq	7b10 <__loadlocale+0x760>  // b.none
    7560:	d10b4000 	sub	x0, x0, #0x2d0
    7564:	f100dc1f 	cmp	x0, #0x37
    7568:	54000108 	b.hi	7588 <__loadlocale+0x1d8>  // b.pmore
    756c:	d2800021 	mov	x1, #0x1                   	// #1
    7570:	d280003c 	mov	x28, #0x1                   	// #1
    7574:	f2a00041 	movk	x1, #0x2, lsl #16
    7578:	9ac02380 	lsl	x0, x28, x0
    757c:	f2e01001 	movk	x1, #0x80, lsl #48
    7580:	ea01001f 	tst	x0, x1
    7584:	54000e21 	b.ne	7748 <__loadlocale+0x398>  // b.any
    7588:	a94573fb 	ldp	x27, x28, [sp, #80]
    758c:	d2800014 	mov	x20, #0x0                   	// #0
    7590:	aa1403e0 	mov	x0, x20
    7594:	a94153f3 	ldp	x19, x20, [sp, #16]
    7598:	a9425bf5 	ldp	x21, x22, [sp, #32]
    759c:	a94363f7 	ldp	x23, x24, [sp, #48]
    75a0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    75a4:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    75a8:	d65f03c0 	ret
    75ac:	910203f8 	add	x24, sp, #0x80
    75b0:	90000021 	adrp	x1, b000 <_fini+0xcc>
    75b4:	aa1803e0 	mov	x0, x24
    75b8:	91148021 	add	x1, x1, #0x520
    75bc:	52800019 	mov	w25, #0x0                   	// #0
    75c0:	5280001a 	mov	w26, #0x0                   	// #0
    75c4:	9400092f 	bl	9a80 <strcpy>
    75c8:	17ffffc1 	b	74cc <__loadlocale+0x11c>
    75cc:	aa1503e1 	mov	x1, x21
    75d0:	aa1303e0 	mov	x0, x19
    75d4:	9400092b 	bl	9a80 <strcpy>
    75d8:	17ffff92 	b	7420 <__loadlocale+0x70>
    75dc:	39400660 	ldrb	w0, [x19, #1]
    75e0:	5100b400 	sub	w0, w0, #0x2d
    75e4:	12001c00 	and	w0, w0, #0xff
    75e8:	7100041f 	cmp	w0, #0x1
    75ec:	54fffd08 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    75f0:	91000a75 	add	x21, x19, #0x2
    75f4:	910203f8 	add	x24, sp, #0x80
    75f8:	aa1503e1 	mov	x1, x21
    75fc:	aa1803e0 	mov	x0, x24
    7600:	94000920 	bl	9a80 <strcpy>
    7604:	aa1803e0 	mov	x0, x24
    7608:	52800801 	mov	w1, #0x40                  	// #64
    760c:	9400089a 	bl	9874 <strchr>
    7610:	b4000040 	cbz	x0, 7618 <__loadlocale+0x268>
    7614:	3900001f 	strb	wzr, [x0]
    7618:	aa1803e0 	mov	x0, x24
    761c:	940009a9 	bl	9cc0 <strlen>
    7620:	8b0002b5 	add	x21, x21, x0
    7624:	17ffffa4 	b	74b4 <__loadlocale+0x104>
    7628:	394006a0 	ldrb	w0, [x21, #1]
    762c:	51010400 	sub	w0, w0, #0x41
    7630:	12001c00 	and	w0, w0, #0xff
    7634:	7100641f 	cmp	w0, #0x19
    7638:	54fffaa8 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    763c:	39400aa0 	ldrb	w0, [x21, #2]
    7640:	51010400 	sub	w0, w0, #0x41
    7644:	12001c00 	and	w0, w0, #0xff
    7648:	7100641f 	cmp	w0, #0x19
    764c:	54fffa08 	b.hi	758c <__loadlocale+0x1dc>  // b.pmore
    7650:	39400ea0 	ldrb	w0, [x21, #3]
    7654:	91000eb5 	add	x21, x21, #0x3
    7658:	17ffff8d 	b	748c <__loadlocale+0xdc>
    765c:	9000003b 	adrp	x27, b000 <_fini+0xcc>
    7660:	9115837b 	add	x27, x27, #0x560
    7664:	aa1b03e1 	mov	x1, x27
    7668:	aa1803e0 	mov	x0, x24
    766c:	94000849 	bl	9790 <strcasecmp>
    7670:	340000c0 	cbz	w0, 7688 <__loadlocale+0x2d8>
    7674:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7678:	aa1803e0 	mov	x0, x24
    767c:	9115a021 	add	x1, x1, #0x568
    7680:	94000844 	bl	9790 <strcasecmp>
    7684:	35fff820 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7688:	aa1b03e1 	mov	x1, x27
    768c:	aa1803e0 	mov	x0, x24
    7690:	940008fc 	bl	9a80 <strcpy>
    7694:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7698:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    769c:	910ac37b 	add	x27, x27, #0x2b0
    76a0:	91154042 	add	x2, x2, #0x550
    76a4:	528000dc 	mov	w28, #0x6                   	// #6
    76a8:	71000aff 	cmp	w23, #0x2
    76ac:	54001b00 	b.eq	7a0c <__loadlocale+0x65c>  // b.none
    76b0:	71001aff 	cmp	w23, #0x6
    76b4:	54000081 	b.ne	76c4 <__loadlocale+0x314>  // b.any
    76b8:	aa1803e1 	mov	x1, x24
    76bc:	91060ac0 	add	x0, x22, #0x182
    76c0:	940008f0 	bl	9a80 <strcpy>
    76c4:	aa1303e1 	mov	x1, x19
    76c8:	aa1403e0 	mov	x0, x20
    76cc:	940008ed 	bl	9a80 <strcpy>
    76d0:	aa0003f4 	mov	x20, x0
    76d4:	aa1403e0 	mov	x0, x20
    76d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    76dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    76e0:	a94363f7 	ldp	x23, x24, [sp, #48]
    76e4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    76e8:	a94573fb 	ldp	x27, x28, [sp, #80]
    76ec:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    76f0:	d65f03c0 	ret
    76f4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    76f8:	aa1803e0 	mov	x0, x24
    76fc:	91182021 	add	x1, x1, #0x608
    7700:	d2800062 	mov	x2, #0x3                   	// #3
    7704:	940009bf 	bl	9e00 <strncasecmp>
    7708:	35fff400 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    770c:	39420fe0 	ldrb	w0, [sp, #131]
    7710:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7714:	91184021 	add	x1, x1, #0x610
    7718:	7100b41f 	cmp	w0, #0x2d
    771c:	910283e0 	add	x0, sp, #0xa0
    7720:	9a801400 	cinc	x0, x0, eq  // eq = none
    7724:	d1007400 	sub	x0, x0, #0x1d
    7728:	94000896 	bl	9980 <strcmp>
    772c:	35fff2e0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7730:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7734:	aa1803e0 	mov	x0, x24
    7738:	91186021 	add	x1, x1, #0x618
    773c:	d503201f 	nop
    7740:	5280003c 	mov	w28, #0x1                   	// #1
    7744:	940008cf 	bl	9a80 <strcpy>
    7748:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    774c:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    7750:	9109837b 	add	x27, x27, #0x260
    7754:	91144042 	add	x2, x2, #0x510
    7758:	17ffffd4 	b	76a8 <__loadlocale+0x2f8>
    775c:	9000003b 	adrp	x27, b000 <_fini+0xcc>
    7760:	9116437b 	add	x27, x27, #0x590
    7764:	aa1b03e1 	mov	x1, x27
    7768:	aa1803e0 	mov	x0, x24
    776c:	94000809 	bl	9790 <strcasecmp>
    7770:	35fff0c0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7774:	aa1b03e1 	mov	x1, x27
    7778:	aa1803e0 	mov	x0, x24
    777c:	940008c1 	bl	9a80 <strcpy>
    7780:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7784:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    7788:	9116037b 	add	x27, x27, #0x580
    778c:	91190042 	add	x2, x2, #0x640
    7790:	5280005c 	mov	w28, #0x2                   	// #2
    7794:	17ffffc5 	b	76a8 <__loadlocale+0x2f8>
    7798:	90000021 	adrp	x1, b000 <_fini+0xcc>
    779c:	aa1803e0 	mov	x0, x24
    77a0:	9117e021 	add	x1, x1, #0x5f8
    77a4:	940007fb 	bl	9790 <strcasecmp>
    77a8:	35ffef00 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    77ac:	90000021 	adrp	x1, b000 <_fini+0xcc>
    77b0:	aa1803e0 	mov	x0, x24
    77b4:	91180021 	add	x1, x1, #0x600
    77b8:	17ffffe2 	b	7740 <__loadlocale+0x390>
    77bc:	90000021 	adrp	x1, b000 <_fini+0xcc>
    77c0:	aa1803e0 	mov	x0, x24
    77c4:	91170021 	add	x1, x1, #0x5c0
    77c8:	d2800082 	mov	x2, #0x4                   	// #4
    77cc:	9400098d 	bl	9e00 <strncasecmp>
    77d0:	35ffedc0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    77d4:	394213e0 	ldrb	w0, [sp, #132]
    77d8:	394217e1 	ldrb	w1, [sp, #133]
    77dc:	7100b41f 	cmp	w0, #0x2d
    77e0:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    77e4:	121a7800 	and	w0, w0, #0xffffffdf
    77e8:	12001c00 	and	w0, w0, #0xff
    77ec:	7101481f 	cmp	w0, #0x52
    77f0:	54001aa0 	b.eq	7b44 <__loadlocale+0x794>  // b.none
    77f4:	7101541f 	cmp	w0, #0x55
    77f8:	54ffec81 	b.ne	7588 <__loadlocale+0x1d8>  // b.any
    77fc:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7800:	aa1803e0 	mov	x0, x24
    7804:	91174021 	add	x1, x1, #0x5d0
    7808:	17ffffce 	b	7740 <__loadlocale+0x390>
    780c:	9000003b 	adrp	x27, b000 <_fini+0xcc>
    7810:	9115c37b 	add	x27, x27, #0x570
    7814:	aa1b03e1 	mov	x1, x27
    7818:	aa1803e0 	mov	x0, x24
    781c:	940007dd 	bl	9790 <strcasecmp>
    7820:	35ffeb40 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7824:	aa1b03e1 	mov	x1, x27
    7828:	aa1803e0 	mov	x0, x24
    782c:	94000895 	bl	9a80 <strcpy>
    7830:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7834:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    7838:	911e037b 	add	x27, x27, #0x780
    783c:	911e0042 	add	x2, x2, #0x780
    7840:	5280011c 	mov	w28, #0x8                   	// #8
    7844:	17ffff99 	b	76a8 <__loadlocale+0x2f8>
    7848:	9000003b 	adrp	x27, b000 <_fini+0xcc>
    784c:	9114837b 	add	x27, x27, #0x520
    7850:	aa1b03e1 	mov	x1, x27
    7854:	aa1803e0 	mov	x0, x24
    7858:	940007ce 	bl	9790 <strcasecmp>
    785c:	35ffe960 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7860:	aa1b03e1 	mov	x1, x27
    7864:	aa1803e0 	mov	x0, x24
    7868:	17ffffb6 	b	7740 <__loadlocale+0x390>
    786c:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7870:	aa1803e0 	mov	x0, x24
    7874:	91176021 	add	x1, x1, #0x5d8
    7878:	d2800102 	mov	x2, #0x8                   	// #8
    787c:	94000961 	bl	9e00 <strncasecmp>
    7880:	35ffe840 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7884:	394223e0 	ldrb	w0, [sp, #136]
    7888:	90000021 	adrp	x1, b000 <_fini+0xcc>
    788c:	9117a021 	add	x1, x1, #0x5e8
    7890:	7100b41f 	cmp	w0, #0x2d
    7894:	910283e0 	add	x0, sp, #0xa0
    7898:	9a801400 	cinc	x0, x0, eq  // eq = none
    789c:	d1006000 	sub	x0, x0, #0x18
    78a0:	940007bc 	bl	9790 <strcasecmp>
    78a4:	35ffe720 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    78a8:	90000021 	adrp	x1, b000 <_fini+0xcc>
    78ac:	aa1803e0 	mov	x0, x24
    78b0:	9117c021 	add	x1, x1, #0x5f0
    78b4:	17ffffa3 	b	7740 <__loadlocale+0x390>
    78b8:	90000021 	adrp	x1, b000 <_fini+0xcc>
    78bc:	aa1803e0 	mov	x0, x24
    78c0:	9115e021 	add	x1, x1, #0x578
    78c4:	d2800062 	mov	x2, #0x3                   	// #3
    78c8:	9400094e 	bl	9e00 <strncasecmp>
    78cc:	35ffe5e0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    78d0:	39420fe0 	ldrb	w0, [sp, #131]
    78d4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    78d8:	91160021 	add	x1, x1, #0x580
    78dc:	7100b41f 	cmp	w0, #0x2d
    78e0:	910283e0 	add	x0, sp, #0xa0
    78e4:	9a801400 	cinc	x0, x0, eq  // eq = none
    78e8:	d1007400 	sub	x0, x0, #0x1d
    78ec:	940007a9 	bl	9790 <strcasecmp>
    78f0:	35ffe4c0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    78f4:	aa1803e0 	mov	x0, x24
    78f8:	90000021 	adrp	x1, b000 <_fini+0xcc>
    78fc:	91162021 	add	x1, x1, #0x588
    7900:	94000860 	bl	9a80 <strcpy>
    7904:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7908:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    790c:	9119437b 	add	x27, x27, #0x650
    7910:	911b4042 	add	x2, x2, #0x6d0
    7914:	5280007c 	mov	w28, #0x3                   	// #3
    7918:	17ffff64 	b	76a8 <__loadlocale+0x2f8>
    791c:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7920:	aa1803e0 	mov	x0, x24
    7924:	91166021 	add	x1, x1, #0x598
    7928:	d2800062 	mov	x2, #0x3                   	// #3
    792c:	94000935 	bl	9e00 <strncasecmp>
    7930:	35ffe2c0 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7934:	39420fe0 	ldrb	w0, [sp, #131]
    7938:	90000021 	adrp	x1, b000 <_fini+0xcc>
    793c:	d2800082 	mov	x2, #0x4                   	// #4
    7940:	91168021 	add	x1, x1, #0x5a0
    7944:	7100b41f 	cmp	w0, #0x2d
    7948:	910283e0 	add	x0, sp, #0xa0
    794c:	9a80141b 	cinc	x27, x0, eq  // eq = none
    7950:	d100777b 	sub	x27, x27, #0x1d
    7954:	aa1b03e0 	mov	x0, x27
    7958:	9400092a 	bl	9e00 <strncasecmp>
    795c:	35ffe160 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    7960:	39401360 	ldrb	w0, [x27, #4]
    7964:	9101e3e1 	add	x1, sp, #0x78
    7968:	52800142 	mov	w2, #0xa                   	// #10
    796c:	7100b41f 	cmp	w0, #0x2d
    7970:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    7974:	91001000 	add	x0, x0, #0x4
    7978:	940009f2 	bl	a140 <strtol>
    797c:	aa0003e3 	mov	x3, x0
    7980:	d1000400 	sub	x0, x0, #0x1
    7984:	f90037e3 	str	x3, [sp, #104]
    7988:	f1003c1f 	cmp	x0, #0xf
    798c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    7990:	54ffdfc0 	b.eq	7588 <__loadlocale+0x1d8>  // b.none
    7994:	f9403fe0 	ldr	x0, [sp, #120]
    7998:	39400000 	ldrb	w0, [x0]
    799c:	35ffdf60 	cbnz	w0, 7588 <__loadlocale+0x1d8>
    79a0:	aa1803e0 	mov	x0, x24
    79a4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    79a8:	9116a021 	add	x1, x1, #0x5a8
    79ac:	94000835 	bl	9a80 <strcpy>
    79b0:	f94037e3 	ldr	x3, [sp, #104]
    79b4:	910227e4 	add	x4, sp, #0x89
    79b8:	f100287f 	cmp	x3, #0xa
    79bc:	5400008d 	b.le	79cc <__loadlocale+0x61c>
    79c0:	91022be4 	add	x4, sp, #0x8a
    79c4:	52800620 	mov	w0, #0x31                  	// #49
    79c8:	390227e0 	strb	w0, [sp, #137]
    79cc:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    79d0:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    79d4:	f28ccce1 	movk	x1, #0x6667
    79d8:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    79dc:	9109837b 	add	x27, x27, #0x260
    79e0:	91144042 	add	x2, x2, #0x510
    79e4:	9b417c61 	smulh	x1, x3, x1
    79e8:	5280003c 	mov	w28, #0x1                   	// #1
    79ec:	3900049f 	strb	wzr, [x4, #1]
    79f0:	9342fc21 	asr	x1, x1, #2
    79f4:	cb83fc21 	sub	x1, x1, x3, asr #63
    79f8:	8b010821 	add	x1, x1, x1, lsl #2
    79fc:	cb010460 	sub	x0, x3, x1, lsl #1
    7a00:	1100c000 	add	w0, w0, #0x30
    7a04:	39000080 	strb	w0, [x4]
    7a08:	17ffff28 	b	76a8 <__loadlocale+0x2f8>
    7a0c:	aa1803e1 	mov	x1, x24
    7a10:	91058ac0 	add	x0, x22, #0x162
    7a14:	f90037e2 	str	x2, [sp, #104]
    7a18:	9400081a 	bl	9a80 <strcpy>
    7a1c:	f94037e2 	ldr	x2, [sp, #104]
    7a20:	a90e6ec2 	stp	x2, x27, [x22, #224]
    7a24:	aa1803e1 	mov	x1, x24
    7a28:	390582dc 	strb	w28, [x22, #352]
    7a2c:	aa1603e0 	mov	x0, x22
    7a30:	94000bb0 	bl	a8f0 <__set_ctype>
    7a34:	35000139 	cbnz	w25, 7a58 <__loadlocale+0x6a8>
    7a38:	7100079f 	cmp	w28, #0x1
    7a3c:	520002b5 	eor	w21, w21, #0x1
    7a40:	1a9fd7e0 	cset	w0, gt
    7a44:	6a0002bf 	tst	w21, w0
    7a48:	54000080 	b.eq	7a58 <__loadlocale+0x6a8>  // b.none
    7a4c:	394203e0 	ldrb	w0, [sp, #128]
    7a50:	7101541f 	cmp	w0, #0x55
    7a54:	1a9f07f9 	cset	w25, ne  // ne = any
    7a58:	7100035f 	cmp	w26, #0x0
    7a5c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    7a60:	b900f2d9 	str	w25, [x22, #240]
    7a64:	17ffff18 	b	76c4 <__loadlocale+0x314>
    7a68:	910006b5 	add	x21, x21, #0x1
    7a6c:	17fffee2 	b	75f4 <__loadlocale+0x244>
    7a70:	a90573fb 	stp	x27, x28, [sp, #80]
    7a74:	910006bb 	add	x27, x21, #0x1
    7a78:	aa1b03e0 	mov	x0, x27
    7a7c:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7a80:	52800019 	mov	w25, #0x0                   	// #0
    7a84:	9114e021 	add	x1, x1, #0x538
    7a88:	5280003a 	mov	w26, #0x1                   	// #1
    7a8c:	940007bd 	bl	9980 <strcmp>
    7a90:	2a0003f5 	mov	w21, w0
    7a94:	35000060 	cbnz	w0, 7aa0 <__loadlocale+0x6f0>
    7a98:	a94573fb 	ldp	x27, x28, [sp, #80]
    7a9c:	17fffe8c 	b	74cc <__loadlocale+0x11c>
    7aa0:	aa1b03e0 	mov	x0, x27
    7aa4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7aa8:	5280001a 	mov	w26, #0x0                   	// #0
    7aac:	91152021 	add	x1, x1, #0x548
    7ab0:	52800035 	mov	w21, #0x1                   	// #1
    7ab4:	940007b3 	bl	9980 <strcmp>
    7ab8:	2a0003f9 	mov	w25, w0
    7abc:	34fffee0 	cbz	w0, 7a98 <__loadlocale+0x6e8>
    7ac0:	aa1b03e0 	mov	x0, x27
    7ac4:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7ac8:	91156021 	add	x1, x1, #0x558
    7acc:	940007ad 	bl	9980 <strcmp>
    7ad0:	7100001f 	cmp	w0, #0x0
    7ad4:	52800015 	mov	w21, #0x0                   	// #0
    7ad8:	1a9f17f9 	cset	w25, eq  // eq = none
    7adc:	a94573fb 	ldp	x27, x28, [sp, #80]
    7ae0:	17fffe7b 	b	74cc <__loadlocale+0x11c>
    7ae4:	d10d4800 	sub	x0, x0, #0x352
    7ae8:	d280003c 	mov	x28, #0x1                   	// #1
    7aec:	d28234a1 	mov	x1, #0x11a5                	// #4517
    7af0:	f2a00021 	movk	x1, #0x1, lsl #16
    7af4:	9ac02380 	lsl	x0, x28, x0
    7af8:	ea01001f 	tst	x0, x1
    7afc:	54ffe261 	b.ne	7748 <__loadlocale+0x398>  // b.any
    7b00:	a94573fb 	ldp	x27, x28, [sp, #80]
    7b04:	17fffea2 	b	758c <__loadlocale+0x1dc>
    7b08:	f10da81f 	cmp	x0, #0x36a
    7b0c:	54ffd3e1 	b.ne	7588 <__loadlocale+0x1d8>  // b.any
    7b10:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7b14:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    7b18:	9109837b 	add	x27, x27, #0x260
    7b1c:	91144042 	add	x2, x2, #0x510
    7b20:	5280003c 	mov	w28, #0x1                   	// #1
    7b24:	17fffee1 	b	76a8 <__loadlocale+0x2f8>
    7b28:	f111941f 	cmp	x0, #0x465
    7b2c:	54ffff20 	b.eq	7b10 <__loadlocale+0x760>  // b.none
    7b30:	d1138800 	sub	x0, x0, #0x4e2
    7b34:	f100201f 	cmp	x0, #0x8
    7b38:	54fffec9 	b.ls	7b10 <__loadlocale+0x760>  // b.plast
    7b3c:	a94573fb 	ldp	x27, x28, [sp, #80]
    7b40:	17fffe93 	b	758c <__loadlocale+0x1dc>
    7b44:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7b48:	aa1803e0 	mov	x0, x24
    7b4c:	91172021 	add	x1, x1, #0x5c8
    7b50:	17fffefc 	b	7740 <__loadlocale+0x390>
    7b54:	b000001b 	adrp	x27, 8000 <setlocale+0x20>
    7b58:	f0000002 	adrp	x2, a000 <_strtol_l.part.0+0xd0>
    7b5c:	9116037b 	add	x27, x27, #0x580
    7b60:	91190042 	add	x2, x2, #0x640
    7b64:	5280005c 	mov	w28, #0x2                   	// #2
    7b68:	17fffed0 	b	76a8 <__loadlocale+0x2f8>
    7b6c:	d503201f 	nop

0000000000007b70 <__get_locale_env>:
    7b70:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7b74:	910003fd 	mov	x29, sp
    7b78:	a90153f3 	stp	x19, x20, [sp, #16]
    7b7c:	2a0103f4 	mov	w20, w1
    7b80:	aa0003f3 	mov	x19, x0
    7b84:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7b88:	911a4021 	add	x1, x1, #0x690
    7b8c:	94000c19 	bl	abf0 <_getenv_r>
    7b90:	b4000060 	cbz	x0, 7b9c <__get_locale_env+0x2c>
    7b94:	39400001 	ldrb	w1, [x0]
    7b98:	35000201 	cbnz	w1, 7bd8 <__get_locale_env+0x68>
    7b9c:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7ba0:	9122a021 	add	x1, x1, #0x8a8
    7ba4:	aa1303e0 	mov	x0, x19
    7ba8:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    7bac:	94000c11 	bl	abf0 <_getenv_r>
    7bb0:	b4000060 	cbz	x0, 7bbc <__get_locale_env+0x4c>
    7bb4:	39400001 	ldrb	w1, [x0]
    7bb8:	35000101 	cbnz	w1, 7bd8 <__get_locale_env+0x68>
    7bbc:	90000021 	adrp	x1, b000 <_fini+0xcc>
    7bc0:	aa1303e0 	mov	x0, x19
    7bc4:	911a6021 	add	x1, x1, #0x698
    7bc8:	94000c0a 	bl	abf0 <_getenv_r>
    7bcc:	b50000c0 	cbnz	x0, 7be4 <__get_locale_env+0x74>
    7bd0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    7bd4:	91088000 	add	x0, x0, #0x220
    7bd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    7bdc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7be0:	d65f03c0 	ret
    7be4:	39400001 	ldrb	w1, [x0]
    7be8:	35ffff81 	cbnz	w1, 7bd8 <__get_locale_env+0x68>
    7bec:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    7bf0:	91088000 	add	x0, x0, #0x220
    7bf4:	17fffff9 	b	7bd8 <__get_locale_env+0x68>
    7bf8:	d503201f 	nop
    7bfc:	d503201f 	nop

0000000000007c00 <_setlocale_r.part.0>:
    7c00:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    7c04:	910003fd 	mov	x29, sp
    7c08:	a9025bf5 	stp	x21, x22, [sp, #32]
    7c0c:	d0000035 	adrp	x21, d000 <__malloc_av_+0x600>
    7c10:	d0000036 	adrp	x22, d000 <__malloc_av_+0x600>
    7c14:	9119e2b5 	add	x21, x21, #0x678
    7c18:	910902d6 	add	x22, x22, #0x240
    7c1c:	a90153f3 	stp	x19, x20, [sp, #16]
    7c20:	910082d4 	add	x20, x22, #0x20
    7c24:	a9046bf9 	stp	x25, x26, [sp, #64]
    7c28:	910082b9 	add	x25, x21, #0x20
    7c2c:	aa0003fa 	mov	x26, x0
    7c30:	aa1903f3 	mov	x19, x25
    7c34:	a90363f7 	stp	x23, x24, [sp, #48]
    7c38:	aa0203f8 	mov	x24, x2
    7c3c:	910382b7 	add	x23, x21, #0xe0
    7c40:	a90573fb 	stp	x27, x28, [sp, #80]
    7c44:	2a0103fc 	mov	w28, w1
    7c48:	aa1403fb 	mov	x27, x20
    7c4c:	d503201f 	nop
    7c50:	aa1b03e1 	mov	x1, x27
    7c54:	aa1303e0 	mov	x0, x19
    7c58:	91008273 	add	x19, x19, #0x20
    7c5c:	94000789 	bl	9a80 <strcpy>
    7c60:	9100837b 	add	x27, x27, #0x20
    7c64:	eb17027f 	cmp	x19, x23
    7c68:	54ffff41 	b.ne	7c50 <_setlocale_r.part.0+0x50>  // b.any
    7c6c:	39400300 	ldrb	w0, [x24]
    7c70:	350005e0 	cbnz	w0, 7d2c <_setlocale_r.part.0+0x12c>
    7c74:	35000edc 	cbnz	w28, 7e4c <_setlocale_r.part.0+0x24c>
    7c78:	aa1903f7 	mov	x23, x25
    7c7c:	52800033 	mov	w19, #0x1                   	// #1
    7c80:	2a1303e1 	mov	w1, w19
    7c84:	aa1a03e0 	mov	x0, x26
    7c88:	97ffffba 	bl	7b70 <__get_locale_env>
    7c8c:	aa0003f5 	mov	x21, x0
    7c90:	11000673 	add	w19, w19, #0x1
    7c94:	9400080b 	bl	9cc0 <strlen>
    7c98:	aa0003e2 	mov	x2, x0
    7c9c:	aa1503e1 	mov	x1, x21
    7ca0:	aa1703e0 	mov	x0, x23
    7ca4:	f1007c5f 	cmp	x2, #0x1f
    7ca8:	54000be8 	b.hi	7e24 <_setlocale_r.part.0+0x224>  // b.pmore
    7cac:	910082f7 	add	x23, x23, #0x20
    7cb0:	94000774 	bl	9a80 <strcpy>
    7cb4:	71001e7f 	cmp	w19, #0x7
    7cb8:	54fffe41 	b.ne	7c80 <_setlocale_r.part.0+0x80>  // b.any
    7cbc:	d0000038 	adrp	x24, d000 <__malloc_av_+0x600>
    7cc0:	911d6318 	add	x24, x24, #0x758
    7cc4:	91008318 	add	x24, x24, #0x20
    7cc8:	aa1903f7 	mov	x23, x25
    7ccc:	aa1803f5 	mov	x21, x24
    7cd0:	52800033 	mov	w19, #0x1                   	// #1
    7cd4:	d503201f 	nop
    7cd8:	aa1403e1 	mov	x1, x20
    7cdc:	aa1503e0 	mov	x0, x21
    7ce0:	94000768 	bl	9a80 <strcpy>
    7ce4:	aa1703e2 	mov	x2, x23
    7ce8:	2a1303e1 	mov	w1, w19
    7cec:	aa1603e0 	mov	x0, x22
    7cf0:	97fffdb0 	bl	73b0 <__loadlocale>
    7cf4:	b4000c60 	cbz	x0, 7e80 <_setlocale_r.part.0+0x280>
    7cf8:	11000673 	add	w19, w19, #0x1
    7cfc:	910082b5 	add	x21, x21, #0x20
    7d00:	91008294 	add	x20, x20, #0x20
    7d04:	910082f7 	add	x23, x23, #0x20
    7d08:	71001e7f 	cmp	w19, #0x7
    7d0c:	54fffe61 	b.ne	7cd8 <_setlocale_r.part.0+0xd8>  // b.any
    7d10:	a94153f3 	ldp	x19, x20, [sp, #16]
    7d14:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7d18:	a94363f7 	ldp	x23, x24, [sp, #48]
    7d1c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7d20:	a94573fb 	ldp	x27, x28, [sp, #80]
    7d24:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7d28:	17fffd72 	b	72f0 <currentlocale>
    7d2c:	3500057c 	cbnz	w28, 7dd8 <_setlocale_r.part.0+0x1d8>
    7d30:	aa1803e0 	mov	x0, x24
    7d34:	528005e1 	mov	w1, #0x2f                  	// #47
    7d38:	940006cf 	bl	9874 <strchr>
    7d3c:	aa0003f3 	mov	x19, x0
    7d40:	b5000060 	cbnz	x0, 7d4c <_setlocale_r.part.0+0x14c>
    7d44:	14000085 	b	7f58 <_setlocale_r.part.0+0x358>
    7d48:	91000673 	add	x19, x19, #0x1
    7d4c:	39400660 	ldrb	w0, [x19, #1]
    7d50:	7100bc1f 	cmp	w0, #0x2f
    7d54:	54ffffa0 	b.eq	7d48 <_setlocale_r.part.0+0x148>  // b.none
    7d58:	34000660 	cbz	w0, 7e24 <_setlocale_r.part.0+0x224>
    7d5c:	aa1903fb 	mov	x27, x25
    7d60:	52800037 	mov	w23, #0x1                   	// #1
    7d64:	cb180262 	sub	x2, x19, x24
    7d68:	71007c5f 	cmp	w2, #0x1f
    7d6c:	540005cc 	b.gt	7e24 <_setlocale_r.part.0+0x224>
    7d70:	11000442 	add	w2, w2, #0x1
    7d74:	aa1803e1 	mov	x1, x24
    7d78:	aa1b03e0 	mov	x0, x27
    7d7c:	110006f7 	add	w23, w23, #0x1
    7d80:	93407c42 	sxtw	x2, w2
    7d84:	940007af 	bl	9c40 <strlcpy>
    7d88:	39400260 	ldrb	w0, [x19]
    7d8c:	7100bc1f 	cmp	w0, #0x2f
    7d90:	540000a1 	b.ne	7da4 <_setlocale_r.part.0+0x1a4>  // b.any
    7d94:	d503201f 	nop
    7d98:	38401e60 	ldrb	w0, [x19, #1]!
    7d9c:	7100bc1f 	cmp	w0, #0x2f
    7da0:	54ffffc0 	b.eq	7d98 <_setlocale_r.part.0+0x198>  // b.none
    7da4:	34000c00 	cbz	w0, 7f24 <_setlocale_r.part.0+0x324>
    7da8:	aa1303e1 	mov	x1, x19
    7dac:	d503201f 	nop
    7db0:	38401c20 	ldrb	w0, [x1, #1]!
    7db4:	7100bc1f 	cmp	w0, #0x2f
    7db8:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    7dbc:	54ffffa1 	b.ne	7db0 <_setlocale_r.part.0+0x1b0>  // b.any
    7dc0:	9100837b 	add	x27, x27, #0x20
    7dc4:	71001eff 	cmp	w23, #0x7
    7dc8:	54fff7a0 	b.eq	7cbc <_setlocale_r.part.0+0xbc>  // b.none
    7dcc:	aa1303f8 	mov	x24, x19
    7dd0:	aa0103f3 	mov	x19, x1
    7dd4:	17ffffe4 	b	7d64 <_setlocale_r.part.0+0x164>
    7dd8:	aa1803e0 	mov	x0, x24
    7ddc:	940007b9 	bl	9cc0 <strlen>
    7de0:	f1007c1f 	cmp	x0, #0x1f
    7de4:	54000208 	b.hi	7e24 <_setlocale_r.part.0+0x224>  // b.pmore
    7de8:	937b7f80 	sbfiz	x0, x28, #5, #32
    7dec:	aa1803e1 	mov	x1, x24
    7df0:	8b0002b5 	add	x21, x21, x0
    7df4:	aa1503e0 	mov	x0, x21
    7df8:	94000722 	bl	9a80 <strcpy>
    7dfc:	aa1503e2 	mov	x2, x21
    7e00:	2a1c03e1 	mov	w1, w28
    7e04:	aa1603e0 	mov	x0, x22
    7e08:	a94153f3 	ldp	x19, x20, [sp, #16]
    7e0c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7e10:	a94363f7 	ldp	x23, x24, [sp, #48]
    7e14:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7e18:	a94573fb 	ldp	x27, x28, [sp, #80]
    7e1c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7e20:	17fffd64 	b	73b0 <__loadlocale>
    7e24:	528002c0 	mov	w0, #0x16                  	// #22
    7e28:	b9000340 	str	w0, [x26]
    7e2c:	d2800000 	mov	x0, #0x0                   	// #0
    7e30:	a94153f3 	ldp	x19, x20, [sp, #16]
    7e34:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7e38:	a94363f7 	ldp	x23, x24, [sp, #48]
    7e3c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7e40:	a94573fb 	ldp	x27, x28, [sp, #80]
    7e44:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7e48:	d65f03c0 	ret
    7e4c:	2a1c03e1 	mov	w1, w28
    7e50:	aa1a03e0 	mov	x0, x26
    7e54:	97ffff47 	bl	7b70 <__get_locale_env>
    7e58:	aa0003f3 	mov	x19, x0
    7e5c:	94000799 	bl	9cc0 <strlen>
    7e60:	f1007c1f 	cmp	x0, #0x1f
    7e64:	54fffe08 	b.hi	7e24 <_setlocale_r.part.0+0x224>  // b.pmore
    7e68:	937b7f80 	sbfiz	x0, x28, #5, #32
    7e6c:	aa1303e1 	mov	x1, x19
    7e70:	8b0002b5 	add	x21, x21, x0
    7e74:	aa1503e0 	mov	x0, x21
    7e78:	94000702 	bl	9a80 <strcpy>
    7e7c:	17ffffe0 	b	7dfc <_setlocale_r.part.0+0x1fc>
    7e80:	90000020 	adrp	x0, b000 <_fini+0xcc>
    7e84:	b9400357 	ldr	w23, [x26]
    7e88:	91146015 	add	x21, x0, #0x518
    7e8c:	52800034 	mov	w20, #0x1                   	// #1
    7e90:	6b14027f 	cmp	w19, w20
    7e94:	540000e1 	b.ne	7eb0 <_setlocale_r.part.0+0x2b0>  // b.any
    7e98:	1400001a 	b	7f00 <_setlocale_r.part.0+0x300>
    7e9c:	11000694 	add	w20, w20, #0x1
    7ea0:	91008339 	add	x25, x25, #0x20
    7ea4:	91008318 	add	x24, x24, #0x20
    7ea8:	6b14027f 	cmp	w19, w20
    7eac:	540002a0 	b.eq	7f00 <_setlocale_r.part.0+0x300>  // b.none
    7eb0:	aa1803e1 	mov	x1, x24
    7eb4:	aa1903e0 	mov	x0, x25
    7eb8:	940006f2 	bl	9a80 <strcpy>
    7ebc:	aa1903e2 	mov	x2, x25
    7ec0:	2a1403e1 	mov	w1, w20
    7ec4:	aa1603e0 	mov	x0, x22
    7ec8:	97fffd3a 	bl	73b0 <__loadlocale>
    7ecc:	b5fffe80 	cbnz	x0, 7e9c <_setlocale_r.part.0+0x29c>
    7ed0:	aa1503e1 	mov	x1, x21
    7ed4:	aa1903e0 	mov	x0, x25
    7ed8:	940006ea 	bl	9a80 <strcpy>
    7edc:	91008318 	add	x24, x24, #0x20
    7ee0:	aa1903e2 	mov	x2, x25
    7ee4:	2a1403e1 	mov	w1, w20
    7ee8:	aa1603e0 	mov	x0, x22
    7eec:	11000694 	add	w20, w20, #0x1
    7ef0:	97fffd30 	bl	73b0 <__loadlocale>
    7ef4:	91008339 	add	x25, x25, #0x20
    7ef8:	6b14027f 	cmp	w19, w20
    7efc:	54fffda1 	b.ne	7eb0 <_setlocale_r.part.0+0x2b0>  // b.any
    7f00:	b9000357 	str	w23, [x26]
    7f04:	d2800000 	mov	x0, #0x0                   	// #0
    7f08:	a94153f3 	ldp	x19, x20, [sp, #16]
    7f0c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7f10:	a94363f7 	ldp	x23, x24, [sp, #48]
    7f14:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7f18:	a94573fb 	ldp	x27, x28, [sp, #80]
    7f1c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7f20:	d65f03c0 	ret
    7f24:	71001eff 	cmp	w23, #0x7
    7f28:	54ffeca0 	b.eq	7cbc <_setlocale_r.part.0+0xbc>  // b.none
    7f2c:	937b7ee0 	sbfiz	x0, x23, #5, #32
    7f30:	8b0002b5 	add	x21, x21, x0
    7f34:	d503201f 	nop
    7f38:	d10082a1 	sub	x1, x21, #0x20
    7f3c:	aa1503e0 	mov	x0, x21
    7f40:	110006f7 	add	w23, w23, #0x1
    7f44:	940006cf 	bl	9a80 <strcpy>
    7f48:	910082b5 	add	x21, x21, #0x20
    7f4c:	71001eff 	cmp	w23, #0x7
    7f50:	54ffff41 	b.ne	7f38 <_setlocale_r.part.0+0x338>  // b.any
    7f54:	17ffff5a 	b	7cbc <_setlocale_r.part.0+0xbc>
    7f58:	aa1803e0 	mov	x0, x24
    7f5c:	94000759 	bl	9cc0 <strlen>
    7f60:	f1007c1f 	cmp	x0, #0x1f
    7f64:	54fff608 	b.hi	7e24 <_setlocale_r.part.0+0x224>  // b.pmore
    7f68:	aa1903f3 	mov	x19, x25
    7f6c:	d503201f 	nop
    7f70:	aa1303e0 	mov	x0, x19
    7f74:	aa1803e1 	mov	x1, x24
    7f78:	91008273 	add	x19, x19, #0x20
    7f7c:	940006c1 	bl	9a80 <strcpy>
    7f80:	eb1302ff 	cmp	x23, x19
    7f84:	54ffff61 	b.ne	7f70 <_setlocale_r.part.0+0x370>  // b.any
    7f88:	17ffff4d 	b	7cbc <_setlocale_r.part.0+0xbc>
    7f8c:	d503201f 	nop

0000000000007f90 <_setlocale_r>:
    7f90:	aa0003e5 	mov	x5, x0
    7f94:	7100183f 	cmp	w1, #0x6
    7f98:	54000068 	b.hi	7fa4 <_setlocale_r+0x14>  // b.pmore
    7f9c:	b40000c2 	cbz	x2, 7fb4 <_setlocale_r+0x24>
    7fa0:	17ffff18 	b	7c00 <_setlocale_r.part.0>
    7fa4:	528002c1 	mov	w1, #0x16                  	// #22
    7fa8:	d2800000 	mov	x0, #0x0                   	// #0
    7fac:	b90000a1 	str	w1, [x5]
    7fb0:	d65f03c0 	ret
    7fb4:	340000c1 	cbz	w1, 7fcc <_setlocale_r+0x3c>
    7fb8:	937b7c23 	sbfiz	x3, x1, #5, #32
    7fbc:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    7fc0:	91090000 	add	x0, x0, #0x240
    7fc4:	8b030000 	add	x0, x0, x3
    7fc8:	d65f03c0 	ret
    7fcc:	17fffcc9 	b	72f0 <currentlocale>

0000000000007fd0 <__locale_mb_cur_max>:
    7fd0:	d0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    7fd4:	394e8000 	ldrb	w0, [x0, #928]
    7fd8:	d65f03c0 	ret
    7fdc:	d503201f 	nop

0000000000007fe0 <setlocale>:
    7fe0:	b0000024 	adrp	x4, c000 <IpcSemaphoreServer+0x558>
    7fe4:	2a0003e3 	mov	w3, w0
    7fe8:	aa0103e2 	mov	x2, x1
    7fec:	f9415880 	ldr	x0, [x4, #688]
    7ff0:	7100187f 	cmp	w3, #0x6
    7ff4:	54000088 	b.hi	8004 <setlocale+0x24>  // b.pmore
    7ff8:	b4000101 	cbz	x1, 8018 <setlocale+0x38>
    7ffc:	2a0303e1 	mov	w1, w3
    8000:	17ffff00 	b	7c00 <_setlocale_r.part.0>
    8004:	528002c1 	mov	w1, #0x16                  	// #22
    8008:	d2800003 	mov	x3, #0x0                   	// #0
    800c:	b9000001 	str	w1, [x0]
    8010:	aa0303e0 	mov	x0, x3
    8014:	d65f03c0 	ret
    8018:	340000e3 	cbz	w3, 8034 <setlocale+0x54>
    801c:	937b7c63 	sbfiz	x3, x3, #5, #32
    8020:	b0000020 	adrp	x0, d000 <__malloc_av_+0x600>
    8024:	91090000 	add	x0, x0, #0x240
    8028:	8b030003 	add	x3, x0, x3
    802c:	aa0303e0 	mov	x0, x3
    8030:	d65f03c0 	ret
    8034:	17fffcaf 	b	72f0 <currentlocale>
    8038:	d503201f 	nop
    803c:	d503201f 	nop

0000000000008040 <__smakebuf_r>:
    8040:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    8044:	910003fd 	mov	x29, sp
    8048:	79402022 	ldrh	w2, [x1, #16]
    804c:	a90153f3 	stp	x19, x20, [sp, #16]
    8050:	aa0103f3 	mov	x19, x1
    8054:	36080122 	tbz	w2, #1, 8078 <__smakebuf_r+0x38>
    8058:	9101dc20 	add	x0, x1, #0x77
    805c:	52800021 	mov	w1, #0x1                   	// #1
    8060:	f9000260 	str	x0, [x19]
    8064:	f9000e60 	str	x0, [x19, #24]
    8068:	b9002261 	str	w1, [x19, #32]
    806c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8070:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    8074:	d65f03c0 	ret
    8078:	79c02421 	ldrsh	w1, [x1, #18]
    807c:	aa0003f4 	mov	x20, x0
    8080:	a9025bf5 	stp	x21, x22, [sp, #32]
    8084:	f9001bf7 	str	x23, [sp, #48]
    8088:	37f80381 	tbnz	w1, #31, 80f8 <__smakebuf_r+0xb8>
    808c:	910123e2 	add	x2, sp, #0x48
    8090:	94000a84 	bl	aaa0 <_fstat_r>
    8094:	37f80300 	tbnz	w0, #31, 80f4 <__smakebuf_r+0xb4>
    8098:	b9404fe0 	ldr	w0, [sp, #76]
    809c:	d2808016 	mov	x22, #0x400                 	// #1024
    80a0:	52810015 	mov	w21, #0x800                 	// #2048
    80a4:	aa1603e1 	mov	x1, x22
    80a8:	12140c00 	and	w0, w0, #0xf000
    80ac:	7140081f 	cmp	w0, #0x2, lsl #12
    80b0:	aa1403e0 	mov	x0, x20
    80b4:	1a9f17f7 	cset	w23, eq  // eq = none
    80b8:	97ffec72 	bl	3280 <_malloc_r>
    80bc:	b5000320 	cbnz	x0, 8120 <__smakebuf_r+0xe0>
    80c0:	79c02260 	ldrsh	w0, [x19, #16]
    80c4:	374805c0 	tbnz	w0, #9, 817c <__smakebuf_r+0x13c>
    80c8:	121e7400 	and	w0, w0, #0xfffffffc
    80cc:	9101de61 	add	x1, x19, #0x77
    80d0:	321f0000 	orr	w0, w0, #0x2
    80d4:	52800022 	mov	w2, #0x1                   	// #1
    80d8:	79002260 	strh	w0, [x19, #16]
    80dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    80e0:	f9401bf7 	ldr	x23, [sp, #48]
    80e4:	f9000261 	str	x1, [x19]
    80e8:	f9000e61 	str	x1, [x19, #24]
    80ec:	b9002262 	str	w2, [x19, #32]
    80f0:	17ffffdf 	b	806c <__smakebuf_r+0x2c>
    80f4:	79402262 	ldrh	w2, [x19, #16]
    80f8:	f279005f 	tst	x2, #0x80
    80fc:	d2808001 	mov	x1, #0x400                 	// #1024
    8100:	d2800816 	mov	x22, #0x40                  	// #64
    8104:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    8108:	aa1603e1 	mov	x1, x22
    810c:	aa1403e0 	mov	x0, x20
    8110:	52800017 	mov	w23, #0x0                   	// #0
    8114:	52800015 	mov	w21, #0x0                   	// #0
    8118:	97ffec5a 	bl	3280 <_malloc_r>
    811c:	b4fffd20 	cbz	x0, 80c0 <__smakebuf_r+0x80>
    8120:	79c02262 	ldrsh	w2, [x19, #16]
    8124:	d0ffffe1 	adrp	x1, 6000 <__register_exitproc+0x60>
    8128:	910d8021 	add	x1, x1, #0x360
    812c:	f9002e81 	str	x1, [x20, #88]
    8130:	32190042 	orr	w2, w2, #0x80
    8134:	f9000260 	str	x0, [x19]
    8138:	79002262 	strh	w2, [x19, #16]
    813c:	f9000e60 	str	x0, [x19, #24]
    8140:	b9002276 	str	w22, [x19, #32]
    8144:	35000117 	cbnz	w23, 8164 <__smakebuf_r+0x124>
    8148:	2a150042 	orr	w2, w2, w21
    814c:	79002262 	strh	w2, [x19, #16]
    8150:	a94153f3 	ldp	x19, x20, [sp, #16]
    8154:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8158:	f9401bf7 	ldr	x23, [sp, #48]
    815c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    8160:	d65f03c0 	ret
    8164:	79c02661 	ldrsh	w1, [x19, #18]
    8168:	aa1403e0 	mov	x0, x20
    816c:	94000aa9 	bl	ac10 <_isatty_r>
    8170:	350000c0 	cbnz	w0, 8188 <__smakebuf_r+0x148>
    8174:	79c02262 	ldrsh	w2, [x19, #16]
    8178:	17fffff4 	b	8148 <__smakebuf_r+0x108>
    817c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8180:	f9401bf7 	ldr	x23, [sp, #48]
    8184:	17ffffba 	b	806c <__smakebuf_r+0x2c>
    8188:	79402262 	ldrh	w2, [x19, #16]
    818c:	121e7442 	and	w2, w2, #0xfffffffc
    8190:	32000042 	orr	w2, w2, #0x1
    8194:	13003c42 	sxth	w2, w2
    8198:	17ffffec 	b	8148 <__smakebuf_r+0x108>
    819c:	d503201f 	nop

00000000000081a0 <__swhatbuf_r>:
    81a0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    81a4:	910003fd 	mov	x29, sp
    81a8:	a90153f3 	stp	x19, x20, [sp, #16]
    81ac:	aa0103f3 	mov	x19, x1
    81b0:	79c02421 	ldrsh	w1, [x1, #18]
    81b4:	f90013f5 	str	x21, [sp, #32]
    81b8:	aa0203f4 	mov	x20, x2
    81bc:	aa0303f5 	mov	x21, x3
    81c0:	37f80201 	tbnz	w1, #31, 8200 <__swhatbuf_r+0x60>
    81c4:	9100e3e2 	add	x2, sp, #0x38
    81c8:	94000a36 	bl	aaa0 <_fstat_r>
    81cc:	37f801a0 	tbnz	w0, #31, 8200 <__swhatbuf_r+0x60>
    81d0:	b9403fe1 	ldr	w1, [sp, #60]
    81d4:	d2808002 	mov	x2, #0x400                 	// #1024
    81d8:	52810000 	mov	w0, #0x800                 	// #2048
    81dc:	12140c21 	and	w1, w1, #0xf000
    81e0:	7140083f 	cmp	w1, #0x2, lsl #12
    81e4:	1a9f17e1 	cset	w1, eq  // eq = none
    81e8:	b90002a1 	str	w1, [x21]
    81ec:	f9000282 	str	x2, [x20]
    81f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    81f4:	f94013f5 	ldr	x21, [sp, #32]
    81f8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    81fc:	d65f03c0 	ret
    8200:	79c02260 	ldrsh	w0, [x19, #16]
    8204:	b90002bf 	str	wzr, [x21]
    8208:	36380100 	tbz	w0, #7, 8228 <__swhatbuf_r+0x88>
    820c:	d2800801 	mov	x1, #0x40                  	// #64
    8210:	f9000281 	str	x1, [x20]
    8214:	52800000 	mov	w0, #0x0                   	// #0
    8218:	a94153f3 	ldp	x19, x20, [sp, #16]
    821c:	f94013f5 	ldr	x21, [sp, #32]
    8220:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8224:	d65f03c0 	ret
    8228:	d2808001 	mov	x1, #0x400                 	// #1024
    822c:	f9000281 	str	x1, [x20]
    8230:	52800000 	mov	w0, #0x0                   	// #0
    8234:	a94153f3 	ldp	x19, x20, [sp, #16]
    8238:	f94013f5 	ldr	x21, [sp, #32]
    823c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8240:	d65f03c0 	ret
    8244:	d503201f 	nop
    8248:	d503201f 	nop
    824c:	d503201f 	nop

0000000000008250 <_mbtowc_r>:
    8250:	b0000025 	adrp	x5, d000 <__malloc_av_+0x600>
    8254:	f94194a5 	ldr	x5, [x5, #808]
    8258:	aa0503f0 	mov	x16, x5
    825c:	d61f0200 	br	x16

0000000000008260 <__ascii_mbtowc>:
    8260:	d10043ff 	sub	sp, sp, #0x10
    8264:	f100003f 	cmp	x1, #0x0
    8268:	910033e0 	add	x0, sp, #0xc
    826c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    8270:	b4000122 	cbz	x2, 8294 <__ascii_mbtowc+0x34>
    8274:	b4000163 	cbz	x3, 82a0 <__ascii_mbtowc+0x40>
    8278:	39400040 	ldrb	w0, [x2]
    827c:	b9000020 	str	w0, [x1]
    8280:	39400040 	ldrb	w0, [x2]
    8284:	7100001f 	cmp	w0, #0x0
    8288:	1a9f07e0 	cset	w0, ne  // ne = any
    828c:	910043ff 	add	sp, sp, #0x10
    8290:	d65f03c0 	ret
    8294:	52800000 	mov	w0, #0x0                   	// #0
    8298:	910043ff 	add	sp, sp, #0x10
    829c:	d65f03c0 	ret
    82a0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    82a4:	17fffffa 	b	828c <__ascii_mbtowc+0x2c>
    82a8:	d503201f 	nop
    82ac:	d503201f 	nop

00000000000082b0 <__utf8_mbtowc>:
    82b0:	d10043ff 	sub	sp, sp, #0x10
    82b4:	f100003f 	cmp	x1, #0x0
    82b8:	910033e5 	add	x5, sp, #0xc
    82bc:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    82c0:	b4000a02 	cbz	x2, 8400 <__utf8_mbtowc+0x150>
    82c4:	b40012a3 	cbz	x3, 8518 <__utf8_mbtowc+0x268>
    82c8:	b9400086 	ldr	w6, [x4]
    82cc:	aa0003e8 	mov	x8, x0
    82d0:	350003c6 	cbnz	w6, 8348 <__utf8_mbtowc+0x98>
    82d4:	39400040 	ldrb	w0, [x2]
    82d8:	52800025 	mov	w5, #0x1                   	// #1
    82dc:	340003c0 	cbz	w0, 8354 <__utf8_mbtowc+0xa4>
    82e0:	7101fc1f 	cmp	w0, #0x7f
    82e4:	5400084d 	b.le	83ec <__utf8_mbtowc+0x13c>
    82e8:	51030007 	sub	w7, w0, #0xc0
    82ec:	71007cff 	cmp	w7, #0x1f
    82f0:	540003a8 	b.hi	8364 <__utf8_mbtowc+0xb4>  // b.pmore
    82f4:	39001080 	strb	w0, [x4, #4]
    82f8:	350000a6 	cbnz	w6, 830c <__utf8_mbtowc+0x5c>
    82fc:	52800026 	mov	w6, #0x1                   	// #1
    8300:	b9000086 	str	w6, [x4]
    8304:	f100047f 	cmp	x3, #0x1
    8308:	54001080 	b.eq	8518 <__utf8_mbtowc+0x268>  // b.none
    830c:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    8310:	110004a5 	add	w5, w5, #0x1
    8314:	51020043 	sub	w3, w2, #0x80
    8318:	7100fc7f 	cmp	w3, #0x3f
    831c:	54001068 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    8320:	7103041f 	cmp	w0, #0xc1
    8324:	5400102d 	b.le	8528 <__utf8_mbtowc+0x278>
    8328:	531a1000 	ubfiz	w0, w0, #6, #5
    832c:	12001442 	and	w2, w2, #0x3f
    8330:	b900009f 	str	wzr, [x4]
    8334:	2a020002 	orr	w2, w0, w2
    8338:	b9000022 	str	w2, [x1]
    833c:	2a0503e0 	mov	w0, w5
    8340:	910043ff 	add	sp, sp, #0x10
    8344:	d65f03c0 	ret
    8348:	39401080 	ldrb	w0, [x4, #4]
    834c:	52800005 	mov	w5, #0x0                   	// #0
    8350:	35fffc80 	cbnz	w0, 82e0 <__utf8_mbtowc+0x30>
    8354:	b900003f 	str	wzr, [x1]
    8358:	b900009f 	str	wzr, [x4]
    835c:	910043ff 	add	sp, sp, #0x10
    8360:	d65f03c0 	ret
    8364:	51038007 	sub	w7, w0, #0xe0
    8368:	71003cff 	cmp	w7, #0xf
    836c:	54000508 	b.hi	840c <__utf8_mbtowc+0x15c>  // b.pmore
    8370:	39001080 	strb	w0, [x4, #4]
    8374:	34000aa6 	cbz	w6, 84c8 <__utf8_mbtowc+0x218>
    8378:	b100047f 	cmn	x3, #0x1
    837c:	9a830463 	cinc	x3, x3, ne  // ne = any
    8380:	710004df 	cmp	w6, #0x1
    8384:	54000aa0 	b.eq	84d8 <__utf8_mbtowc+0x228>  // b.none
    8388:	39401487 	ldrb	w7, [x4, #5]
    838c:	7103801f 	cmp	w0, #0xe0
    8390:	528013e9 	mov	w9, #0x9f                  	// #159
    8394:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    8398:	54000c8d 	b.le	8528 <__utf8_mbtowc+0x278>
    839c:	510200e9 	sub	w9, w7, #0x80
    83a0:	7100fd3f 	cmp	w9, #0x3f
    83a4:	54000c28 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    83a8:	39001487 	strb	w7, [x4, #5]
    83ac:	710004df 	cmp	w6, #0x1
    83b0:	54000ac0 	b.eq	8508 <__utf8_mbtowc+0x258>  // b.none
    83b4:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    83b8:	110004a5 	add	w5, w5, #0x1
    83bc:	51020043 	sub	w3, w2, #0x80
    83c0:	7100fc7f 	cmp	w3, #0x3f
    83c4:	54000b28 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    83c8:	53140c00 	ubfiz	w0, w0, #12, #4
    83cc:	531a14e7 	ubfiz	w7, w7, #6, #6
    83d0:	2a070007 	orr	w7, w0, w7
    83d4:	12001442 	and	w2, w2, #0x3f
    83d8:	b900009f 	str	wzr, [x4]
    83dc:	2a0200e7 	orr	w7, w7, w2
    83e0:	2a0503e0 	mov	w0, w5
    83e4:	b9000027 	str	w7, [x1]
    83e8:	17ffffdd 	b	835c <__utf8_mbtowc+0xac>
    83ec:	b900009f 	str	wzr, [x4]
    83f0:	b9000020 	str	w0, [x1]
    83f4:	52800020 	mov	w0, #0x1                   	// #1
    83f8:	910043ff 	add	sp, sp, #0x10
    83fc:	d65f03c0 	ret
    8400:	52800000 	mov	w0, #0x0                   	// #0
    8404:	910043ff 	add	sp, sp, #0x10
    8408:	d65f03c0 	ret
    840c:	5103c007 	sub	w7, w0, #0xf0
    8410:	710010ff 	cmp	w7, #0x4
    8414:	540008a8 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    8418:	39001080 	strb	w0, [x4, #4]
    841c:	34000666 	cbz	w6, 84e8 <__utf8_mbtowc+0x238>
    8420:	b100047f 	cmn	x3, #0x1
    8424:	9a830463 	cinc	x3, x3, ne  // ne = any
    8428:	710004df 	cmp	w6, #0x1
    842c:	54000660 	b.eq	84f8 <__utf8_mbtowc+0x248>  // b.none
    8430:	39401487 	ldrb	w7, [x4, #5]
    8434:	7103c01f 	cmp	w0, #0xf0
    8438:	54000740 	b.eq	8520 <__utf8_mbtowc+0x270>  // b.none
    843c:	71023cff 	cmp	w7, #0x8f
    8440:	52801e89 	mov	w9, #0xf4                  	// #244
    8444:	7a49c000 	ccmp	w0, w9, #0x0, gt
    8448:	54000700 	b.eq	8528 <__utf8_mbtowc+0x278>  // b.none
    844c:	510200e9 	sub	w9, w7, #0x80
    8450:	7100fd3f 	cmp	w9, #0x3f
    8454:	540006a8 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    8458:	39001487 	strb	w7, [x4, #5]
    845c:	710004df 	cmp	w6, #0x1
    8460:	540006c0 	b.eq	8538 <__utf8_mbtowc+0x288>  // b.none
    8464:	b9400086 	ldr	w6, [x4]
    8468:	b100047f 	cmn	x3, #0x1
    846c:	9a830463 	cinc	x3, x3, ne  // ne = any
    8470:	710008df 	cmp	w6, #0x2
    8474:	540006a0 	b.eq	8548 <__utf8_mbtowc+0x298>  // b.none
    8478:	39401886 	ldrb	w6, [x4, #6]
    847c:	510200c3 	sub	w3, w6, #0x80
    8480:	7100fc7f 	cmp	w3, #0x3f
    8484:	54000528 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    8488:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    848c:	110004a5 	add	w5, w5, #0x1
    8490:	51020043 	sub	w3, w2, #0x80
    8494:	7100fc7f 	cmp	w3, #0x3f
    8498:	54000488 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    849c:	530e0800 	ubfiz	w0, w0, #18, #3
    84a0:	531414e7 	ubfiz	w7, w7, #12, #6
    84a4:	531a14c6 	ubfiz	w6, w6, #6, #6
    84a8:	12001442 	and	w2, w2, #0x3f
    84ac:	2a070007 	orr	w7, w0, w7
    84b0:	2a0200c6 	orr	w6, w6, w2
    84b4:	2a0600e6 	orr	w6, w7, w6
    84b8:	b9000026 	str	w6, [x1]
    84bc:	2a0503e0 	mov	w0, w5
    84c0:	b900009f 	str	wzr, [x4]
    84c4:	17ffffa6 	b	835c <__utf8_mbtowc+0xac>
    84c8:	52800026 	mov	w6, #0x1                   	// #1
    84cc:	b9000086 	str	w6, [x4]
    84d0:	f100047f 	cmp	x3, #0x1
    84d4:	54000220 	b.eq	8518 <__utf8_mbtowc+0x268>  // b.none
    84d8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    84dc:	52800026 	mov	w6, #0x1                   	// #1
    84e0:	0b0600a5 	add	w5, w5, w6
    84e4:	17ffffaa 	b	838c <__utf8_mbtowc+0xdc>
    84e8:	52800026 	mov	w6, #0x1                   	// #1
    84ec:	b9000086 	str	w6, [x4]
    84f0:	f100047f 	cmp	x3, #0x1
    84f4:	54000120 	b.eq	8518 <__utf8_mbtowc+0x268>  // b.none
    84f8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    84fc:	52800026 	mov	w6, #0x1                   	// #1
    8500:	0b0600a5 	add	w5, w5, w6
    8504:	17ffffcc 	b	8434 <__utf8_mbtowc+0x184>
    8508:	52800046 	mov	w6, #0x2                   	// #2
    850c:	b9000086 	str	w6, [x4]
    8510:	f100087f 	cmp	x3, #0x2
    8514:	54fff501 	b.ne	83b4 <__utf8_mbtowc+0x104>  // b.any
    8518:	12800020 	mov	w0, #0xfffffffe            	// #-2
    851c:	17ffff90 	b	835c <__utf8_mbtowc+0xac>
    8520:	71023cff 	cmp	w7, #0x8f
    8524:	54fff94c 	b.gt	844c <__utf8_mbtowc+0x19c>
    8528:	52801141 	mov	w1, #0x8a                  	// #138
    852c:	12800000 	mov	w0, #0xffffffff            	// #-1
    8530:	b9000101 	str	w1, [x8]
    8534:	17ffff8a 	b	835c <__utf8_mbtowc+0xac>
    8538:	52800046 	mov	w6, #0x2                   	// #2
    853c:	b9000086 	str	w6, [x4]
    8540:	f100087f 	cmp	x3, #0x2
    8544:	54fffea0 	b.eq	8518 <__utf8_mbtowc+0x268>  // b.none
    8548:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    854c:	110004a5 	add	w5, w5, #0x1
    8550:	510200c9 	sub	w9, w6, #0x80
    8554:	7100fd3f 	cmp	w9, #0x3f
    8558:	54fffe88 	b.hi	8528 <__utf8_mbtowc+0x278>  // b.pmore
    855c:	52800069 	mov	w9, #0x3                   	// #3
    8560:	b9000089 	str	w9, [x4]
    8564:	39001886 	strb	w6, [x4, #6]
    8568:	f1000c7f 	cmp	x3, #0x3
    856c:	54fff8e1 	b.ne	8488 <__utf8_mbtowc+0x1d8>  // b.any
    8570:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8574:	17ffff7a 	b	835c <__utf8_mbtowc+0xac>
    8578:	d503201f 	nop
    857c:	d503201f 	nop

0000000000008580 <__sjis_mbtowc>:
    8580:	d10043ff 	sub	sp, sp, #0x10
    8584:	f100003f 	cmp	x1, #0x0
    8588:	910033e5 	add	x5, sp, #0xc
    858c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8590:	b40004c2 	cbz	x2, 8628 <__sjis_mbtowc+0xa8>
    8594:	b4000503 	cbz	x3, 8634 <__sjis_mbtowc+0xb4>
    8598:	aa0003e6 	mov	x6, x0
    859c:	b9400080 	ldr	w0, [x4]
    85a0:	39400045 	ldrb	w5, [x2]
    85a4:	35000320 	cbnz	w0, 8608 <__sjis_mbtowc+0x88>
    85a8:	510204a7 	sub	w7, w5, #0x81
    85ac:	510380a0 	sub	w0, w5, #0xe0
    85b0:	710078ff 	cmp	w7, #0x1e
    85b4:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    85b8:	540002c8 	b.hi	8610 <__sjis_mbtowc+0x90>  // b.pmore
    85bc:	52800020 	mov	w0, #0x1                   	// #1
    85c0:	b9000080 	str	w0, [x4]
    85c4:	39001085 	strb	w5, [x4, #4]
    85c8:	f100047f 	cmp	x3, #0x1
    85cc:	54000340 	b.eq	8634 <__sjis_mbtowc+0xb4>  // b.none
    85d0:	39400445 	ldrb	w5, [x2, #1]
    85d4:	52800040 	mov	w0, #0x2                   	// #2
    85d8:	510100a3 	sub	w3, w5, #0x40
    85dc:	510200a2 	sub	w2, w5, #0x80
    85e0:	7100f87f 	cmp	w3, #0x3e
    85e4:	52800f83 	mov	w3, #0x7c                  	// #124
    85e8:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    85ec:	54000288 	b.hi	863c <__sjis_mbtowc+0xbc>  // b.pmore
    85f0:	39401082 	ldrb	w2, [x4, #4]
    85f4:	0b0220a5 	add	w5, w5, w2, lsl #8
    85f8:	b9000025 	str	w5, [x1]
    85fc:	b900009f 	str	wzr, [x4]
    8600:	910043ff 	add	sp, sp, #0x10
    8604:	d65f03c0 	ret
    8608:	7100041f 	cmp	w0, #0x1
    860c:	54fffe60 	b.eq	85d8 <__sjis_mbtowc+0x58>  // b.none
    8610:	b9000025 	str	w5, [x1]
    8614:	39400040 	ldrb	w0, [x2]
    8618:	7100001f 	cmp	w0, #0x0
    861c:	1a9f07e0 	cset	w0, ne  // ne = any
    8620:	910043ff 	add	sp, sp, #0x10
    8624:	d65f03c0 	ret
    8628:	52800000 	mov	w0, #0x0                   	// #0
    862c:	910043ff 	add	sp, sp, #0x10
    8630:	d65f03c0 	ret
    8634:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8638:	17fffffa 	b	8620 <__sjis_mbtowc+0xa0>
    863c:	52801141 	mov	w1, #0x8a                  	// #138
    8640:	12800000 	mov	w0, #0xffffffff            	// #-1
    8644:	b90000c1 	str	w1, [x6]
    8648:	17fffff6 	b	8620 <__sjis_mbtowc+0xa0>
    864c:	d503201f 	nop

0000000000008650 <__eucjp_mbtowc>:
    8650:	d10083ff 	sub	sp, sp, #0x20
    8654:	f100003f 	cmp	x1, #0x0
    8658:	a90007e0 	stp	x0, x1, [sp]
    865c:	910073e0 	add	x0, sp, #0x1c
    8660:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    8664:	f94003e6 	ldr	x6, [sp]
    8668:	b4000702 	cbz	x2, 8748 <__eucjp_mbtowc+0xf8>
    866c:	b4000783 	cbz	x3, 875c <__eucjp_mbtowc+0x10c>
    8670:	b9400080 	ldr	w0, [x4]
    8674:	39400045 	ldrb	w5, [x2]
    8678:	350004a0 	cbnz	w0, 870c <__eucjp_mbtowc+0xbc>
    867c:	510284a7 	sub	w7, w5, #0xa1
    8680:	510238a0 	sub	w0, w5, #0x8e
    8684:	710174ff 	cmp	w7, #0x5d
    8688:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    868c:	54000488 	b.hi	871c <__eucjp_mbtowc+0xcc>  // b.pmore
    8690:	52800020 	mov	w0, #0x1                   	// #1
    8694:	b9000080 	str	w0, [x4]
    8698:	39001085 	strb	w5, [x4, #4]
    869c:	f100047f 	cmp	x3, #0x1
    86a0:	540005e0 	b.eq	875c <__eucjp_mbtowc+0x10c>  // b.none
    86a4:	39400445 	ldrb	w5, [x2, #1]
    86a8:	52800040 	mov	w0, #0x2                   	// #2
    86ac:	510284a7 	sub	w7, w5, #0xa1
    86b0:	710174ff 	cmp	w7, #0x5d
    86b4:	54000588 	b.hi	8764 <__eucjp_mbtowc+0x114>  // b.pmore
    86b8:	39401087 	ldrb	w7, [x4, #4]
    86bc:	71023cff 	cmp	w7, #0x8f
    86c0:	540003a1 	b.ne	8734 <__eucjp_mbtowc+0xe4>  // b.any
    86c4:	52800048 	mov	w8, #0x2                   	// #2
    86c8:	93407c07 	sxtw	x7, w0
    86cc:	b9000088 	str	w8, [x4]
    86d0:	39001485 	strb	w5, [x4, #5]
    86d4:	eb0300ff 	cmp	x7, x3
    86d8:	54000422 	b.cs	875c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    86dc:	38676845 	ldrb	w5, [x2, x7]
    86e0:	11000400 	add	w0, w0, #0x1
    86e4:	510284a2 	sub	w2, w5, #0xa1
    86e8:	7101745f 	cmp	w2, #0x5d
    86ec:	540003c8 	b.hi	8764 <__eucjp_mbtowc+0x114>  // b.pmore
    86f0:	39401482 	ldrb	w2, [x4, #5]
    86f4:	120018a5 	and	w5, w5, #0x7f
    86f8:	0b0220a5 	add	w5, w5, w2, lsl #8
    86fc:	b9000025 	str	w5, [x1]
    8700:	b900009f 	str	wzr, [x4]
    8704:	910083ff 	add	sp, sp, #0x20
    8708:	d65f03c0 	ret
    870c:	7100041f 	cmp	w0, #0x1
    8710:	54fffce0 	b.eq	86ac <__eucjp_mbtowc+0x5c>  // b.none
    8714:	7100081f 	cmp	w0, #0x2
    8718:	540001e0 	b.eq	8754 <__eucjp_mbtowc+0x104>  // b.none
    871c:	b9000025 	str	w5, [x1]
    8720:	39400040 	ldrb	w0, [x2]
    8724:	7100001f 	cmp	w0, #0x0
    8728:	1a9f07e0 	cset	w0, ne  // ne = any
    872c:	910083ff 	add	sp, sp, #0x20
    8730:	d65f03c0 	ret
    8734:	0b0720a5 	add	w5, w5, w7, lsl #8
    8738:	b9000025 	str	w5, [x1]
    873c:	b900009f 	str	wzr, [x4]
    8740:	910083ff 	add	sp, sp, #0x20
    8744:	d65f03c0 	ret
    8748:	52800000 	mov	w0, #0x0                   	// #0
    874c:	910083ff 	add	sp, sp, #0x20
    8750:	d65f03c0 	ret
    8754:	52800020 	mov	w0, #0x1                   	// #1
    8758:	17ffffe3 	b	86e4 <__eucjp_mbtowc+0x94>
    875c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8760:	17fffff3 	b	872c <__eucjp_mbtowc+0xdc>
    8764:	52801141 	mov	w1, #0x8a                  	// #138
    8768:	12800000 	mov	w0, #0xffffffff            	// #-1
    876c:	b90000c1 	str	w1, [x6]
    8770:	17ffffef 	b	872c <__eucjp_mbtowc+0xdc>
    8774:	d503201f 	nop
    8778:	d503201f 	nop
    877c:	d503201f 	nop

0000000000008780 <__jis_mbtowc>:
    8780:	d10043ff 	sub	sp, sp, #0x10
    8784:	f100003f 	cmp	x1, #0x0
    8788:	910033e5 	add	x5, sp, #0xc
    878c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    8790:	b4000da2 	cbz	x2, 8944 <__jis_mbtowc+0x1c4>
    8794:	b4000e43 	cbz	x3, 895c <__jis_mbtowc+0x1dc>
    8798:	39400085 	ldrb	w5, [x4]
    879c:	f000000c 	adrp	x12, b000 <_fini+0xcc>
    87a0:	f000000b 	adrp	x11, b000 <_fini+0xcc>
    87a4:	aa0003ed 	mov	x13, x0
    87a8:	9123818c 	add	x12, x12, #0x8e0
    87ac:	9124a16b 	add	x11, x11, #0x928
    87b0:	aa0203ef 	mov	x15, x2
    87b4:	5280000a 	mov	w10, #0x0                   	// #0
    87b8:	d2800009 	mov	x9, #0x0                   	// #0
    87bc:	38696847 	ldrb	w7, [x2, x9]
    87c0:	8b09004e 	add	x14, x2, x9
    87c4:	7100a0ff 	cmp	w7, #0x28
    87c8:	54000c60 	b.eq	8954 <__jis_mbtowc+0x1d4>  // b.none
    87cc:	540005a8 	b.hi	8880 <__jis_mbtowc+0x100>  // b.pmore
    87d0:	52800006 	mov	w6, #0x0                   	// #0
    87d4:	71006cff 	cmp	w7, #0x1b
    87d8:	54000080 	b.eq	87e8 <__jis_mbtowc+0x68>  // b.none
    87dc:	52800026 	mov	w6, #0x1                   	// #1
    87e0:	710090ff 	cmp	w7, #0x24
    87e4:	540008c1 	b.ne	88fc <__jis_mbtowc+0x17c>  // b.any
    87e8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    87ec:	8b25c005 	add	x5, x0, w5, sxtw
    87f0:	8b050180 	add	x0, x12, x5
    87f4:	8b050165 	add	x5, x11, x5
    87f8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    87fc:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    8800:	71000d1f 	cmp	w8, #0x3
    8804:	540006a0 	b.eq	88d8 <__jis_mbtowc+0x158>  // b.none
    8808:	540002a8 	b.hi	885c <__jis_mbtowc+0xdc>  // b.pmore
    880c:	7100051f 	cmp	w8, #0x1
    8810:	54000840 	b.eq	8918 <__jis_mbtowc+0x198>  // b.none
    8814:	7100091f 	cmp	w8, #0x2
    8818:	54000141 	b.ne	8840 <__jis_mbtowc+0xc0>  // b.any
    881c:	52800020 	mov	w0, #0x1                   	// #1
    8820:	b9000080 	str	w0, [x4]
    8824:	39401082 	ldrb	w2, [x4, #4]
    8828:	0b000140 	add	w0, w10, w0
    882c:	394001c3 	ldrb	w3, [x14]
    8830:	0b022062 	add	w2, w3, w2, lsl #8
    8834:	b9000022 	str	w2, [x1]
    8838:	910043ff 	add	sp, sp, #0x10
    883c:	d65f03c0 	ret
    8840:	35000788 	cbnz	w8, 8930 <__jis_mbtowc+0x1b0>
    8844:	b900009f 	str	wzr, [x4]
    8848:	11000540 	add	w0, w10, #0x1
    884c:	394001e2 	ldrb	w2, [x15]
    8850:	b9000022 	str	w2, [x1]
    8854:	910043ff 	add	sp, sp, #0x10
    8858:	d65f03c0 	ret
    885c:	7100111f 	cmp	w8, #0x4
    8860:	54000400 	b.eq	88e0 <__jis_mbtowc+0x160>  // b.none
    8864:	7100151f 	cmp	w8, #0x5
    8868:	54000641 	b.ne	8930 <__jis_mbtowc+0x1b0>  // b.any
    886c:	b900009f 	str	wzr, [x4]
    8870:	52800000 	mov	w0, #0x0                   	// #0
    8874:	b900003f 	str	wzr, [x1]
    8878:	910043ff 	add	sp, sp, #0x10
    887c:	d65f03c0 	ret
    8880:	52800086 	mov	w6, #0x4                   	// #4
    8884:	710108ff 	cmp	w7, #0x42
    8888:	54fffb00 	b.eq	87e8 <__jis_mbtowc+0x68>  // b.none
    888c:	528000a6 	mov	w6, #0x5                   	// #5
    8890:	710128ff 	cmp	w7, #0x4a
    8894:	54fffaa0 	b.eq	87e8 <__jis_mbtowc+0x68>  // b.none
    8898:	52800066 	mov	w6, #0x3                   	// #3
    889c:	710100ff 	cmp	w7, #0x40
    88a0:	54fffa40 	b.eq	87e8 <__jis_mbtowc+0x68>  // b.none
    88a4:	510084e0 	sub	w0, w7, #0x21
    88a8:	7101741f 	cmp	w0, #0x5d
    88ac:	1a9f97e6 	cset	w6, hi  // hi = pmore
    88b0:	11001cc6 	add	w6, w6, #0x7
    88b4:	d503201f 	nop
    88b8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    88bc:	8b25c005 	add	x5, x0, w5, sxtw
    88c0:	8b050180 	add	x0, x12, x5
    88c4:	8b050165 	add	x5, x11, x5
    88c8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    88cc:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    88d0:	71000d1f 	cmp	w8, #0x3
    88d4:	54fff9a1 	b.ne	8808 <__jis_mbtowc+0x88>  // b.any
    88d8:	91000529 	add	x9, x9, #0x1
    88dc:	8b09004f 	add	x15, x2, x9
    88e0:	11000549 	add	w9, w10, #0x1
    88e4:	aa0903ea 	mov	x10, x9
    88e8:	eb03013f 	cmp	x9, x3
    88ec:	54fff683 	b.cc	87bc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    88f0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    88f4:	b9000085 	str	w5, [x4]
    88f8:	17ffffd0 	b	8838 <__jis_mbtowc+0xb8>
    88fc:	528000c6 	mov	w6, #0x6                   	// #6
    8900:	34fff747 	cbz	w7, 87e8 <__jis_mbtowc+0x68>
    8904:	510084e0 	sub	w0, w7, #0x21
    8908:	7101741f 	cmp	w0, #0x5d
    890c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    8910:	11001cc6 	add	w6, w6, #0x7
    8914:	17ffffe9 	b	88b8 <__jis_mbtowc+0x138>
    8918:	11000549 	add	w9, w10, #0x1
    891c:	39001087 	strb	w7, [x4, #4]
    8920:	aa0903ea 	mov	x10, x9
    8924:	eb03013f 	cmp	x9, x3
    8928:	54fff4a3 	b.cc	87bc <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    892c:	17fffff1 	b	88f0 <__jis_mbtowc+0x170>
    8930:	52801141 	mov	w1, #0x8a                  	// #138
    8934:	b90001a1 	str	w1, [x13]
    8938:	12800000 	mov	w0, #0xffffffff            	// #-1
    893c:	910043ff 	add	sp, sp, #0x10
    8940:	d65f03c0 	ret
    8944:	b900009f 	str	wzr, [x4]
    8948:	52800020 	mov	w0, #0x1                   	// #1
    894c:	910043ff 	add	sp, sp, #0x10
    8950:	d65f03c0 	ret
    8954:	52800046 	mov	w6, #0x2                   	// #2
    8958:	17ffffa4 	b	87e8 <__jis_mbtowc+0x68>
    895c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    8960:	17ffffb6 	b	8838 <__jis_mbtowc+0xb8>

0000000000008964 <memchr>:
    8964:	b4000682 	cbz	x2, 8a34 <memchr+0xd0>
    8968:	52808025 	mov	w5, #0x401                 	// #1025
    896c:	72a80205 	movk	w5, #0x4010, lsl #16
    8970:	4e010c20 	dup	v0.16b, w1
    8974:	927be803 	and	x3, x0, #0xffffffffffffffe0
    8978:	4e040ca5 	dup	v5.4s, w5
    897c:	f2401009 	ands	x9, x0, #0x1f
    8980:	9240104a 	and	x10, x2, #0x1f
    8984:	54000200 	b.eq	89c4 <memchr+0x60>  // b.none
    8988:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    898c:	d1008124 	sub	x4, x9, #0x20
    8990:	ab040042 	adds	x2, x2, x4
    8994:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    8998:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    899c:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    89a0:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    89a4:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    89a8:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    89ac:	4e083cc6 	mov	x6, v6.d[0]
    89b0:	d37ff924 	lsl	x4, x9, #1
    89b4:	9ac424c6 	lsr	x6, x6, x4
    89b8:	9ac420c6 	lsl	x6, x6, x4
    89bc:	54000229 	b.ls	8a00 <memchr+0x9c>  // b.plast
    89c0:	b50002c6 	cbnz	x6, 8a18 <memchr+0xb4>
    89c4:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    89c8:	f1008042 	subs	x2, x2, #0x20
    89cc:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    89d0:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    89d4:	540000a9 	b.ls	89e8 <memchr+0x84>  // b.plast
    89d8:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    89dc:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    89e0:	4e083cc6 	mov	x6, v6.d[0]
    89e4:	b4ffff06 	cbz	x6, 89c4 <memchr+0x60>
    89e8:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    89ec:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    89f0:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    89f4:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    89f8:	4e083cc6 	mov	x6, v6.d[0]
    89fc:	540000e8 	b.hi	8a18 <memchr+0xb4>  // b.pmore
    8a00:	8b090144 	add	x4, x10, x9
    8a04:	92401084 	and	x4, x4, #0x1f
    8a08:	d1008084 	sub	x4, x4, #0x20
    8a0c:	cb0407e4 	neg	x4, x4, lsl #1
    8a10:	9ac420c6 	lsl	x6, x6, x4
    8a14:	9ac424c6 	lsr	x6, x6, x4
    8a18:	dac000c6 	rbit	x6, x6
    8a1c:	d1008063 	sub	x3, x3, #0x20
    8a20:	f10000df 	cmp	x6, #0x0
    8a24:	dac010c6 	clz	x6, x6
    8a28:	8b460460 	add	x0, x3, x6, lsr #1
    8a2c:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    8a30:	d65f03c0 	ret
    8a34:	d2800000 	mov	x0, #0x0                   	// #0
    8a38:	d65f03c0 	ret
    8a3c:	d503201f 	nop

0000000000008a40 <_realloc_r>:
    8a40:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8a44:	910003fd 	mov	x29, sp
    8a48:	a9025bf5 	stp	x21, x22, [sp, #32]
    8a4c:	aa0203f5 	mov	x21, x2
    8a50:	b40010e1 	cbz	x1, 8c6c <_realloc_r+0x22c>
    8a54:	a90363f7 	stp	x23, x24, [sp, #48]
    8a58:	d1004038 	sub	x24, x1, #0x10
    8a5c:	aa0003f7 	mov	x23, x0
    8a60:	a90153f3 	stp	x19, x20, [sp, #16]
    8a64:	aa0103f3 	mov	x19, x1
    8a68:	91005eb4 	add	x20, x21, #0x17
    8a6c:	a9046bf9 	stp	x25, x26, [sp, #64]
    8a70:	97ffed1c 	bl	3ee0 <__malloc_lock>
    8a74:	aa1803f9 	mov	x25, x24
    8a78:	f9400700 	ldr	x0, [x24, #8]
    8a7c:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    8a80:	f100ba9f 	cmp	x20, #0x2e
    8a84:	54000908 	b.hi	8ba4 <_realloc_r+0x164>  // b.pmore
    8a88:	52800001 	mov	w1, #0x0                   	// #0
    8a8c:	7100003f 	cmp	w1, #0x0
    8a90:	d2800414 	mov	x20, #0x20                  	// #32
    8a94:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    8a98:	54000943 	b.cc	8bc0 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    8a9c:	eb1402df 	cmp	x22, x20
    8aa0:	54000b0a 	b.ge	8c00 <_realloc_r+0x1c0>  // b.tcont
    8aa4:	90000021 	adrp	x1, c000 <IpcSemaphoreServer+0x558>
    8aa8:	a90573fb 	stp	x27, x28, [sp, #80]
    8aac:	9128003c 	add	x28, x1, #0xa00
    8ab0:	8b160302 	add	x2, x24, x22
    8ab4:	f9400b83 	ldr	x3, [x28, #16]
    8ab8:	f9400441 	ldr	x1, [x2, #8]
    8abc:	eb02007f 	cmp	x3, x2
    8ac0:	54000f60 	b.eq	8cac <_realloc_r+0x26c>  // b.none
    8ac4:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    8ac8:	8b030043 	add	x3, x2, x3
    8acc:	f9400463 	ldr	x3, [x3, #8]
    8ad0:	37000c23 	tbnz	w3, #0, 8c54 <_realloc_r+0x214>
    8ad4:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    8ad8:	8b0102c3 	add	x3, x22, x1
    8adc:	eb03029f 	cmp	x20, x3
    8ae0:	5400084d 	b.le	8be8 <_realloc_r+0x1a8>
    8ae4:	37000180 	tbnz	w0, #0, 8b14 <_realloc_r+0xd4>
    8ae8:	f85f027b 	ldur	x27, [x19, #-16]
    8aec:	cb1b031b 	sub	x27, x24, x27
    8af0:	f9400760 	ldr	x0, [x27, #8]
    8af4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8af8:	8b010001 	add	x1, x0, x1
    8afc:	8b160023 	add	x3, x1, x22
    8b00:	eb03029f 	cmp	x20, x3
    8b04:	540019ad 	b.le	8e38 <_realloc_r+0x3f8>
    8b08:	8b0002c3 	add	x3, x22, x0
    8b0c:	eb03029f 	cmp	x20, x3
    8b10:	5400152d 	b.le	8db4 <_realloc_r+0x374>
    8b14:	aa1503e1 	mov	x1, x21
    8b18:	aa1703e0 	mov	x0, x23
    8b1c:	97ffe9d9 	bl	3280 <_malloc_r>
    8b20:	aa0003f5 	mov	x21, x0
    8b24:	b40002c0 	cbz	x0, 8b7c <_realloc_r+0x13c>
    8b28:	f9400701 	ldr	x1, [x24, #8]
    8b2c:	d1004002 	sub	x2, x0, #0x10
    8b30:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    8b34:	8b010318 	add	x24, x24, x1
    8b38:	eb02031f 	cmp	x24, x2
    8b3c:	54001200 	b.eq	8d7c <_realloc_r+0x33c>  // b.none
    8b40:	d10022c2 	sub	x2, x22, #0x8
    8b44:	f101205f 	cmp	x2, #0x48
    8b48:	54001728 	b.hi	8e2c <_realloc_r+0x3ec>  // b.pmore
    8b4c:	f1009c5f 	cmp	x2, #0x27
    8b50:	54001208 	b.hi	8d90 <_realloc_r+0x350>  // b.pmore
    8b54:	aa1303e1 	mov	x1, x19
    8b58:	f9400022 	ldr	x2, [x1]
    8b5c:	f9000002 	str	x2, [x0]
    8b60:	f9400422 	ldr	x2, [x1, #8]
    8b64:	f9000402 	str	x2, [x0, #8]
    8b68:	f9400821 	ldr	x1, [x1, #16]
    8b6c:	f9000801 	str	x1, [x0, #16]
    8b70:	aa1303e1 	mov	x1, x19
    8b74:	aa1703e0 	mov	x0, x23
    8b78:	97fff796 	bl	69d0 <_free_r>
    8b7c:	aa1703e0 	mov	x0, x23
    8b80:	97ffecdc 	bl	3ef0 <__malloc_unlock>
    8b84:	aa1503e0 	mov	x0, x21
    8b88:	a94153f3 	ldp	x19, x20, [sp, #16]
    8b8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8b90:	a94363f7 	ldp	x23, x24, [sp, #48]
    8b94:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8b98:	a94573fb 	ldp	x27, x28, [sp, #80]
    8b9c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8ba0:	d65f03c0 	ret
    8ba4:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    8ba8:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    8bac:	eb01029f 	cmp	x20, x1
    8bb0:	1a9f97e1 	cset	w1, hi  // hi = pmore
    8bb4:	7100003f 	cmp	w1, #0x0
    8bb8:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    8bbc:	54fff702 	b.cs	8a9c <_realloc_r+0x5c>  // b.hs, b.nlast
    8bc0:	52800180 	mov	w0, #0xc                   	// #12
    8bc4:	b90002e0 	str	w0, [x23]
    8bc8:	d2800015 	mov	x21, #0x0                   	// #0
    8bcc:	aa1503e0 	mov	x0, x21
    8bd0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8bd4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8bd8:	a94363f7 	ldp	x23, x24, [sp, #48]
    8bdc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8be0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8be4:	d65f03c0 	ret
    8be8:	a9410041 	ldp	x1, x0, [x2, #16]
    8bec:	aa0303f6 	mov	x22, x3
    8bf0:	a94573fb 	ldp	x27, x28, [sp, #80]
    8bf4:	f9000c20 	str	x0, [x1, #24]
    8bf8:	f9000801 	str	x1, [x0, #16]
    8bfc:	d503201f 	nop
    8c00:	f9400721 	ldr	x1, [x25, #8]
    8c04:	cb1402c0 	sub	x0, x22, x20
    8c08:	8b160322 	add	x2, x25, x22
    8c0c:	92400021 	and	x1, x1, #0x1
    8c10:	f1007c1f 	cmp	x0, #0x1f
    8c14:	54000348 	b.hi	8c7c <_realloc_r+0x23c>  // b.pmore
    8c18:	aa0102c1 	orr	x1, x22, x1
    8c1c:	f9000721 	str	x1, [x25, #8]
    8c20:	f9400440 	ldr	x0, [x2, #8]
    8c24:	b2400000 	orr	x0, x0, #0x1
    8c28:	f9000440 	str	x0, [x2, #8]
    8c2c:	aa1703e0 	mov	x0, x23
    8c30:	aa1303f5 	mov	x21, x19
    8c34:	97ffecaf 	bl	3ef0 <__malloc_unlock>
    8c38:	aa1503e0 	mov	x0, x21
    8c3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8c40:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8c44:	a94363f7 	ldp	x23, x24, [sp, #48]
    8c48:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8c4c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8c50:	d65f03c0 	ret
    8c54:	3707f600 	tbnz	w0, #0, 8b14 <_realloc_r+0xd4>
    8c58:	f85f027b 	ldur	x27, [x19, #-16]
    8c5c:	cb1b031b 	sub	x27, x24, x27
    8c60:	f9400760 	ldr	x0, [x27, #8]
    8c64:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8c68:	17ffffa8 	b	8b08 <_realloc_r+0xc8>
    8c6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8c70:	aa0203e1 	mov	x1, x2
    8c74:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8c78:	17ffe982 	b	3280 <_malloc_r>
    8c7c:	8b140324 	add	x4, x25, x20
    8c80:	aa010281 	orr	x1, x20, x1
    8c84:	f9000721 	str	x1, [x25, #8]
    8c88:	b2400003 	orr	x3, x0, #0x1
    8c8c:	91004081 	add	x1, x4, #0x10
    8c90:	aa1703e0 	mov	x0, x23
    8c94:	f9000483 	str	x3, [x4, #8]
    8c98:	f9400443 	ldr	x3, [x2, #8]
    8c9c:	b2400063 	orr	x3, x3, #0x1
    8ca0:	f9000443 	str	x3, [x2, #8]
    8ca4:	97fff74b 	bl	69d0 <_free_r>
    8ca8:	17ffffe1 	b	8c2c <_realloc_r+0x1ec>
    8cac:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    8cb0:	91008283 	add	x3, x20, #0x20
    8cb4:	8b0102c2 	add	x2, x22, x1
    8cb8:	eb03005f 	cmp	x2, x3
    8cbc:	54000eaa 	b.ge	8e90 <_realloc_r+0x450>  // b.tcont
    8cc0:	3707f2a0 	tbnz	w0, #0, 8b14 <_realloc_r+0xd4>
    8cc4:	f85f027b 	ldur	x27, [x19, #-16]
    8cc8:	cb1b031b 	sub	x27, x24, x27
    8ccc:	f9400760 	ldr	x0, [x27, #8]
    8cd0:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8cd4:	8b010001 	add	x1, x0, x1
    8cd8:	8b16003a 	add	x26, x1, x22
    8cdc:	eb1a007f 	cmp	x3, x26
    8ce0:	54fff14c 	b.gt	8b08 <_realloc_r+0xc8>
    8ce4:	aa1b03f5 	mov	x21, x27
    8ce8:	d10022c2 	sub	x2, x22, #0x8
    8cec:	f9400f60 	ldr	x0, [x27, #24]
    8cf0:	f8410ea1 	ldr	x1, [x21, #16]!
    8cf4:	f9000c20 	str	x0, [x1, #24]
    8cf8:	f9000801 	str	x1, [x0, #16]
    8cfc:	f101205f 	cmp	x2, #0x48
    8d00:	54001128 	b.hi	8f24 <_realloc_r+0x4e4>  // b.pmore
    8d04:	aa1503e0 	mov	x0, x21
    8d08:	f1009c5f 	cmp	x2, #0x27
    8d0c:	54000129 	b.ls	8d30 <_realloc_r+0x2f0>  // b.plast
    8d10:	f9400260 	ldr	x0, [x19]
    8d14:	f9000b60 	str	x0, [x27, #16]
    8d18:	f9400660 	ldr	x0, [x19, #8]
    8d1c:	f9000f60 	str	x0, [x27, #24]
    8d20:	f100dc5f 	cmp	x2, #0x37
    8d24:	54001088 	b.hi	8f34 <_realloc_r+0x4f4>  // b.pmore
    8d28:	91004273 	add	x19, x19, #0x10
    8d2c:	91008360 	add	x0, x27, #0x20
    8d30:	f9400261 	ldr	x1, [x19]
    8d34:	f9000001 	str	x1, [x0]
    8d38:	f9400661 	ldr	x1, [x19, #8]
    8d3c:	f9000401 	str	x1, [x0, #8]
    8d40:	f9400a61 	ldr	x1, [x19, #16]
    8d44:	f9000801 	str	x1, [x0, #16]
    8d48:	8b140362 	add	x2, x27, x20
    8d4c:	cb140341 	sub	x1, x26, x20
    8d50:	f9000b82 	str	x2, [x28, #16]
    8d54:	b2400021 	orr	x1, x1, #0x1
    8d58:	aa1703e0 	mov	x0, x23
    8d5c:	f9000441 	str	x1, [x2, #8]
    8d60:	f9400761 	ldr	x1, [x27, #8]
    8d64:	92400021 	and	x1, x1, #0x1
    8d68:	aa140034 	orr	x20, x1, x20
    8d6c:	f9000774 	str	x20, [x27, #8]
    8d70:	97ffec60 	bl	3ef0 <__malloc_unlock>
    8d74:	a94573fb 	ldp	x27, x28, [sp, #80]
    8d78:	17ffffb0 	b	8c38 <_realloc_r+0x1f8>
    8d7c:	f9400700 	ldr	x0, [x24, #8]
    8d80:	a94573fb 	ldp	x27, x28, [sp, #80]
    8d84:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    8d88:	8b0002d6 	add	x22, x22, x0
    8d8c:	17ffff9d 	b	8c00 <_realloc_r+0x1c0>
    8d90:	f9400260 	ldr	x0, [x19]
    8d94:	f90002a0 	str	x0, [x21]
    8d98:	f9400660 	ldr	x0, [x19, #8]
    8d9c:	f90006a0 	str	x0, [x21, #8]
    8da0:	f100dc5f 	cmp	x2, #0x37
    8da4:	54000648 	b.hi	8e6c <_realloc_r+0x42c>  // b.pmore
    8da8:	91004261 	add	x1, x19, #0x10
    8dac:	910042a0 	add	x0, x21, #0x10
    8db0:	17ffff6a 	b	8b58 <_realloc_r+0x118>
    8db4:	aa1b03e0 	mov	x0, x27
    8db8:	d10022c2 	sub	x2, x22, #0x8
    8dbc:	f8410c04 	ldr	x4, [x0, #16]!
    8dc0:	f9400f61 	ldr	x1, [x27, #24]
    8dc4:	f9000c81 	str	x1, [x4, #24]
    8dc8:	f9000824 	str	x4, [x1, #16]
    8dcc:	f101205f 	cmp	x2, #0x48
    8dd0:	54000408 	b.hi	8e50 <_realloc_r+0x410>  // b.pmore
    8dd4:	aa0003e1 	mov	x1, x0
    8dd8:	f1009c5f 	cmp	x2, #0x27
    8ddc:	54000129 	b.ls	8e00 <_realloc_r+0x3c0>  // b.plast
    8de0:	f9400261 	ldr	x1, [x19]
    8de4:	f9000b61 	str	x1, [x27, #16]
    8de8:	f9400661 	ldr	x1, [x19, #8]
    8dec:	f9000f61 	str	x1, [x27, #24]
    8df0:	f100dc5f 	cmp	x2, #0x37
    8df4:	540006a8 	b.hi	8ec8 <_realloc_r+0x488>  // b.pmore
    8df8:	91004273 	add	x19, x19, #0x10
    8dfc:	91008361 	add	x1, x27, #0x20
    8e00:	f9400262 	ldr	x2, [x19]
    8e04:	aa1b03f9 	mov	x25, x27
    8e08:	a94573fb 	ldp	x27, x28, [sp, #80]
    8e0c:	f9000022 	str	x2, [x1]
    8e10:	aa0303f6 	mov	x22, x3
    8e14:	f9400662 	ldr	x2, [x19, #8]
    8e18:	f9000422 	str	x2, [x1, #8]
    8e1c:	f9400a62 	ldr	x2, [x19, #16]
    8e20:	aa0003f3 	mov	x19, x0
    8e24:	f9000822 	str	x2, [x1, #16]
    8e28:	17ffff76 	b	8c00 <_realloc_r+0x1c0>
    8e2c:	aa1303e1 	mov	x1, x19
    8e30:	97ffeb84 	bl	3c40 <memmove>
    8e34:	17ffff4f 	b	8b70 <_realloc_r+0x130>
    8e38:	a9410444 	ldp	x4, x1, [x2, #16]
    8e3c:	f9000c81 	str	x1, [x4, #24]
    8e40:	aa1b03e0 	mov	x0, x27
    8e44:	d10022c2 	sub	x2, x22, #0x8
    8e48:	f9000824 	str	x4, [x1, #16]
    8e4c:	17ffffdc 	b	8dbc <_realloc_r+0x37c>
    8e50:	aa1303e1 	mov	x1, x19
    8e54:	aa0303f6 	mov	x22, x3
    8e58:	aa1b03f9 	mov	x25, x27
    8e5c:	aa0003f3 	mov	x19, x0
    8e60:	97ffeb78 	bl	3c40 <memmove>
    8e64:	a94573fb 	ldp	x27, x28, [sp, #80]
    8e68:	17ffff66 	b	8c00 <_realloc_r+0x1c0>
    8e6c:	f9400a60 	ldr	x0, [x19, #16]
    8e70:	f9000aa0 	str	x0, [x21, #16]
    8e74:	f9400e60 	ldr	x0, [x19, #24]
    8e78:	f9000ea0 	str	x0, [x21, #24]
    8e7c:	f101205f 	cmp	x2, #0x48
    8e80:	54000360 	b.eq	8eec <_realloc_r+0x4ac>  // b.none
    8e84:	91008261 	add	x1, x19, #0x20
    8e88:	910082a0 	add	x0, x21, #0x20
    8e8c:	17ffff33 	b	8b58 <_realloc_r+0x118>
    8e90:	8b140303 	add	x3, x24, x20
    8e94:	cb140041 	sub	x1, x2, x20
    8e98:	f9000b83 	str	x3, [x28, #16]
    8e9c:	b2400021 	orr	x1, x1, #0x1
    8ea0:	aa1703e0 	mov	x0, x23
    8ea4:	aa1303f5 	mov	x21, x19
    8ea8:	f9000461 	str	x1, [x3, #8]
    8eac:	f9400701 	ldr	x1, [x24, #8]
    8eb0:	92400021 	and	x1, x1, #0x1
    8eb4:	aa140034 	orr	x20, x1, x20
    8eb8:	f9000714 	str	x20, [x24, #8]
    8ebc:	97ffec0d 	bl	3ef0 <__malloc_unlock>
    8ec0:	a94573fb 	ldp	x27, x28, [sp, #80]
    8ec4:	17ffff5d 	b	8c38 <_realloc_r+0x1f8>
    8ec8:	f9400a61 	ldr	x1, [x19, #16]
    8ecc:	f9001361 	str	x1, [x27, #32]
    8ed0:	f9400e61 	ldr	x1, [x19, #24]
    8ed4:	f9001761 	str	x1, [x27, #40]
    8ed8:	f101205f 	cmp	x2, #0x48
    8edc:	54000160 	b.eq	8f08 <_realloc_r+0x4c8>  // b.none
    8ee0:	91008273 	add	x19, x19, #0x20
    8ee4:	9100c361 	add	x1, x27, #0x30
    8ee8:	17ffffc6 	b	8e00 <_realloc_r+0x3c0>
    8eec:	f9401260 	ldr	x0, [x19, #32]
    8ef0:	f90012a0 	str	x0, [x21, #32]
    8ef4:	9100c261 	add	x1, x19, #0x30
    8ef8:	9100c2a0 	add	x0, x21, #0x30
    8efc:	f9401662 	ldr	x2, [x19, #40]
    8f00:	f90016a2 	str	x2, [x21, #40]
    8f04:	17ffff15 	b	8b58 <_realloc_r+0x118>
    8f08:	f9401261 	ldr	x1, [x19, #32]
    8f0c:	f9001b61 	str	x1, [x27, #48]
    8f10:	9100c273 	add	x19, x19, #0x30
    8f14:	91010361 	add	x1, x27, #0x40
    8f18:	f85f8262 	ldur	x2, [x19, #-8]
    8f1c:	f9001f62 	str	x2, [x27, #56]
    8f20:	17ffffb8 	b	8e00 <_realloc_r+0x3c0>
    8f24:	aa1303e1 	mov	x1, x19
    8f28:	aa1503e0 	mov	x0, x21
    8f2c:	97ffeb45 	bl	3c40 <memmove>
    8f30:	17ffff86 	b	8d48 <_realloc_r+0x308>
    8f34:	f9400a60 	ldr	x0, [x19, #16]
    8f38:	f9001360 	str	x0, [x27, #32]
    8f3c:	f9400e60 	ldr	x0, [x19, #24]
    8f40:	f9001760 	str	x0, [x27, #40]
    8f44:	f101205f 	cmp	x2, #0x48
    8f48:	54000080 	b.eq	8f58 <_realloc_r+0x518>  // b.none
    8f4c:	91008273 	add	x19, x19, #0x20
    8f50:	9100c360 	add	x0, x27, #0x30
    8f54:	17ffff77 	b	8d30 <_realloc_r+0x2f0>
    8f58:	f9401260 	ldr	x0, [x19, #32]
    8f5c:	f9001b60 	str	x0, [x27, #48]
    8f60:	9100c273 	add	x19, x19, #0x30
    8f64:	91010360 	add	x0, x27, #0x40
    8f68:	f85f8261 	ldur	x1, [x19, #-8]
    8f6c:	f9001f61 	str	x1, [x27, #56]
    8f70:	17ffff70 	b	8d30 <_realloc_r+0x2f0>
    8f74:	d503201f 	nop
    8f78:	d503201f 	nop
    8f7c:	d503201f 	nop

0000000000008f80 <cleanup_glue>:
    8f80:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    8f84:	910003fd 	mov	x29, sp
    8f88:	a9025bf5 	stp	x21, x22, [sp, #32]
    8f8c:	f9400035 	ldr	x21, [x1]
    8f90:	a90153f3 	stp	x19, x20, [sp, #16]
    8f94:	aa0103f3 	mov	x19, x1
    8f98:	aa0003f4 	mov	x20, x0
    8f9c:	b4000275 	cbz	x21, 8fe8 <cleanup_glue+0x68>
    8fa0:	f94002b6 	ldr	x22, [x21]
    8fa4:	b40001d6 	cbz	x22, 8fdc <cleanup_glue+0x5c>
    8fa8:	f9001bf7 	str	x23, [sp, #48]
    8fac:	f94002d7 	ldr	x23, [x22]
    8fb0:	b40000f7 	cbz	x23, 8fcc <cleanup_glue+0x4c>
    8fb4:	f94002e1 	ldr	x1, [x23]
    8fb8:	b4000041 	cbz	x1, 8fc0 <cleanup_glue+0x40>
    8fbc:	97fffff1 	bl	8f80 <cleanup_glue>
    8fc0:	aa1703e1 	mov	x1, x23
    8fc4:	aa1403e0 	mov	x0, x20
    8fc8:	97fff682 	bl	69d0 <_free_r>
    8fcc:	aa1603e1 	mov	x1, x22
    8fd0:	aa1403e0 	mov	x0, x20
    8fd4:	97fff67f 	bl	69d0 <_free_r>
    8fd8:	f9401bf7 	ldr	x23, [sp, #48]
    8fdc:	aa1503e1 	mov	x1, x21
    8fe0:	aa1403e0 	mov	x0, x20
    8fe4:	97fff67b 	bl	69d0 <_free_r>
    8fe8:	aa1303e1 	mov	x1, x19
    8fec:	aa1403e0 	mov	x0, x20
    8ff0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8ff4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8ff8:	a8c47bfd 	ldp	x29, x30, [sp], #64
    8ffc:	17fff675 	b	69d0 <_free_r>

0000000000009000 <_reclaim_reent>:
    9000:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9004:	f0000001 	adrp	x1, c000 <IpcSemaphoreServer+0x558>
    9008:	910003fd 	mov	x29, sp
    900c:	a90153f3 	stp	x19, x20, [sp, #16]
    9010:	aa0003f4 	mov	x20, x0
    9014:	f9415820 	ldr	x0, [x1, #688]
    9018:	eb14001f 	cmp	x0, x20
    901c:	54000500 	b.eq	90bc <_reclaim_reent+0xbc>  // b.none
    9020:	f9403e81 	ldr	x1, [x20, #120]
    9024:	f90013f5 	str	x21, [sp, #32]
    9028:	b40001e1 	cbz	x1, 9064 <_reclaim_reent+0x64>
    902c:	d2800015 	mov	x21, #0x0                   	// #0
    9030:	f8756833 	ldr	x19, [x1, x21]
    9034:	b40000f3 	cbz	x19, 9050 <_reclaim_reent+0x50>
    9038:	aa1303e1 	mov	x1, x19
    903c:	aa1403e0 	mov	x0, x20
    9040:	f9400273 	ldr	x19, [x19]
    9044:	97fff663 	bl	69d0 <_free_r>
    9048:	b5ffff93 	cbnz	x19, 9038 <_reclaim_reent+0x38>
    904c:	f9403e81 	ldr	x1, [x20, #120]
    9050:	910022b5 	add	x21, x21, #0x8
    9054:	f10802bf 	cmp	x21, #0x200
    9058:	54fffec1 	b.ne	9030 <_reclaim_reent+0x30>  // b.any
    905c:	aa1403e0 	mov	x0, x20
    9060:	97fff65c 	bl	69d0 <_free_r>
    9064:	f9403281 	ldr	x1, [x20, #96]
    9068:	b4000061 	cbz	x1, 9074 <_reclaim_reent+0x74>
    906c:	aa1403e0 	mov	x0, x20
    9070:	97fff658 	bl	69d0 <_free_r>
    9074:	f940fe93 	ldr	x19, [x20, #504]
    9078:	b4000153 	cbz	x19, 90a0 <_reclaim_reent+0xa0>
    907c:	91080295 	add	x21, x20, #0x200
    9080:	eb15027f 	cmp	x19, x21
    9084:	540000e0 	b.eq	90a0 <_reclaim_reent+0xa0>  // b.none
    9088:	aa1303e1 	mov	x1, x19
    908c:	aa1403e0 	mov	x0, x20
    9090:	f9400273 	ldr	x19, [x19]
    9094:	97fff64f 	bl	69d0 <_free_r>
    9098:	eb1302bf 	cmp	x21, x19
    909c:	54ffff61 	b.ne	9088 <_reclaim_reent+0x88>  // b.any
    90a0:	f9404681 	ldr	x1, [x20, #136]
    90a4:	b4000061 	cbz	x1, 90b0 <_reclaim_reent+0xb0>
    90a8:	aa1403e0 	mov	x0, x20
    90ac:	97fff649 	bl	69d0 <_free_r>
    90b0:	b9405280 	ldr	w0, [x20, #80]
    90b4:	350000a0 	cbnz	w0, 90c8 <_reclaim_reent+0xc8>
    90b8:	f94013f5 	ldr	x21, [sp, #32]
    90bc:	a94153f3 	ldp	x19, x20, [sp, #16]
    90c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    90c4:	d65f03c0 	ret
    90c8:	f9402e81 	ldr	x1, [x20, #88]
    90cc:	aa1403e0 	mov	x0, x20
    90d0:	d63f0020 	blr	x1
    90d4:	f9429293 	ldr	x19, [x20, #1312]
    90d8:	b4ffff13 	cbz	x19, 90b8 <_reclaim_reent+0xb8>
    90dc:	f9400261 	ldr	x1, [x19]
    90e0:	b4000061 	cbz	x1, 90ec <_reclaim_reent+0xec>
    90e4:	aa1403e0 	mov	x0, x20
    90e8:	97ffffa6 	bl	8f80 <cleanup_glue>
    90ec:	aa1303e1 	mov	x1, x19
    90f0:	aa1403e0 	mov	x0, x20
    90f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    90f8:	f94013f5 	ldr	x21, [sp, #32]
    90fc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9100:	17fff634 	b	69d0 <_free_r>
    9104:	d503201f 	nop
    9108:	d503201f 	nop
    910c:	d503201f 	nop

0000000000009110 <_init_signal_r>:
    9110:	f9428c01 	ldr	x1, [x0, #1304]
    9114:	b4000061 	cbz	x1, 9120 <_init_signal_r+0x10>
    9118:	52800000 	mov	w0, #0x0                   	// #0
    911c:	d65f03c0 	ret
    9120:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9124:	d2802001 	mov	x1, #0x100                 	// #256
    9128:	910003fd 	mov	x29, sp
    912c:	f9000bf3 	str	x19, [sp, #16]
    9130:	aa0003f3 	mov	x19, x0
    9134:	97ffe853 	bl	3280 <_malloc_r>
    9138:	f9028e60 	str	x0, [x19, #1304]
    913c:	b4000140 	cbz	x0, 9164 <_init_signal_r+0x54>
    9140:	91040001 	add	x1, x0, #0x100
    9144:	d503201f 	nop
    9148:	f800841f 	str	xzr, [x0], #8
    914c:	eb01001f 	cmp	x0, x1
    9150:	54ffffc1 	b.ne	9148 <_init_signal_r+0x38>  // b.any
    9154:	52800000 	mov	w0, #0x0                   	// #0
    9158:	f9400bf3 	ldr	x19, [sp, #16]
    915c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9160:	d65f03c0 	ret
    9164:	12800000 	mov	w0, #0xffffffff            	// #-1
    9168:	17fffffc 	b	9158 <_init_signal_r+0x48>
    916c:	d503201f 	nop

0000000000009170 <_signal_r>:
    9170:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9174:	910003fd 	mov	x29, sp
    9178:	a90153f3 	stp	x19, x20, [sp, #16]
    917c:	93407c33 	sxtw	x19, w1
    9180:	aa0003f4 	mov	x20, x0
    9184:	71007e7f 	cmp	w19, #0x1f
    9188:	54000108 	b.hi	91a8 <_signal_r+0x38>  // b.pmore
    918c:	f9428c04 	ldr	x4, [x0, #1304]
    9190:	b4000184 	cbz	x4, 91c0 <_signal_r+0x50>
    9194:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    9198:	f8337882 	str	x2, [x4, x19, lsl #3]
    919c:	a94153f3 	ldp	x19, x20, [sp, #16]
    91a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    91a4:	d65f03c0 	ret
    91a8:	528002c1 	mov	w1, #0x16                  	// #22
    91ac:	b9000281 	str	w1, [x20]
    91b0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    91b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    91b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    91bc:	d65f03c0 	ret
    91c0:	d2802001 	mov	x1, #0x100                 	// #256
    91c4:	f90017e2 	str	x2, [sp, #40]
    91c8:	97ffe82e 	bl	3280 <_malloc_r>
    91cc:	f9028e80 	str	x0, [x20, #1304]
    91d0:	aa0003e4 	mov	x4, x0
    91d4:	b4000120 	cbz	x0, 91f8 <_signal_r+0x88>
    91d8:	f94017e2 	ldr	x2, [sp, #40]
    91dc:	aa0003e3 	mov	x3, x0
    91e0:	91040001 	add	x1, x0, #0x100
    91e4:	d503201f 	nop
    91e8:	f800847f 	str	xzr, [x3], #8
    91ec:	eb03003f 	cmp	x1, x3
    91f0:	54ffffc1 	b.ne	91e8 <_signal_r+0x78>  // b.any
    91f4:	17ffffe8 	b	9194 <_signal_r+0x24>
    91f8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    91fc:	17ffffe8 	b	919c <_signal_r+0x2c>

0000000000009200 <_raise_r>:
    9200:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9204:	910003fd 	mov	x29, sp
    9208:	a90153f3 	stp	x19, x20, [sp, #16]
    920c:	aa0003f4 	mov	x20, x0
    9210:	71007c3f 	cmp	w1, #0x1f
    9214:	54000488 	b.hi	92a4 <_raise_r+0xa4>  // b.pmore
    9218:	f9428c00 	ldr	x0, [x0, #1304]
    921c:	2a0103f3 	mov	w19, w1
    9220:	b40001e0 	cbz	x0, 925c <_raise_r+0x5c>
    9224:	93407c22 	sxtw	x2, w1
    9228:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    922c:	b4000181 	cbz	x1, 925c <_raise_r+0x5c>
    9230:	f100043f 	cmp	x1, #0x1
    9234:	54000300 	b.eq	9294 <_raise_r+0x94>  // b.none
    9238:	b100043f 	cmn	x1, #0x1
    923c:	54000200 	b.eq	927c <_raise_r+0x7c>  // b.none
    9240:	f822781f 	str	xzr, [x0, x2, lsl #3]
    9244:	2a1303e0 	mov	w0, w19
    9248:	d63f0020 	blr	x1
    924c:	52800000 	mov	w0, #0x0                   	// #0
    9250:	a94153f3 	ldp	x19, x20, [sp, #16]
    9254:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9258:	d65f03c0 	ret
    925c:	aa1403e0 	mov	x0, x20
    9260:	940000fc 	bl	9650 <_getpid_r>
    9264:	2a1303e2 	mov	w2, w19
    9268:	2a0003e1 	mov	w1, w0
    926c:	aa1403e0 	mov	x0, x20
    9270:	a94153f3 	ldp	x19, x20, [sp, #16]
    9274:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9278:	140000e2 	b	9600 <_kill_r>
    927c:	528002c1 	mov	w1, #0x16                  	// #22
    9280:	b9000281 	str	w1, [x20]
    9284:	52800020 	mov	w0, #0x1                   	// #1
    9288:	a94153f3 	ldp	x19, x20, [sp, #16]
    928c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9290:	d65f03c0 	ret
    9294:	52800000 	mov	w0, #0x0                   	// #0
    9298:	a94153f3 	ldp	x19, x20, [sp, #16]
    929c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    92a0:	d65f03c0 	ret
    92a4:	528002c1 	mov	w1, #0x16                  	// #22
    92a8:	12800000 	mov	w0, #0xffffffff            	// #-1
    92ac:	b9000281 	str	w1, [x20]
    92b0:	17ffffe8 	b	9250 <_raise_r+0x50>
    92b4:	d503201f 	nop
    92b8:	d503201f 	nop
    92bc:	d503201f 	nop

00000000000092c0 <__sigtramp_r>:
    92c0:	71007c3f 	cmp	w1, #0x1f
    92c4:	540005a8 	b.hi	9378 <__sigtramp_r+0xb8>  // b.pmore
    92c8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    92cc:	910003fd 	mov	x29, sp
    92d0:	f9428c03 	ldr	x3, [x0, #1304]
    92d4:	a90153f3 	stp	x19, x20, [sp, #16]
    92d8:	2a0103f3 	mov	w19, w1
    92dc:	aa0003f4 	mov	x20, x0
    92e0:	b4000263 	cbz	x3, 932c <__sigtramp_r+0x6c>
    92e4:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    92e8:	8b33cc63 	add	x3, x3, w19, sxtw #3
    92ec:	b4000181 	cbz	x1, 931c <__sigtramp_r+0x5c>
    92f0:	b100043f 	cmn	x1, #0x1
    92f4:	540003a0 	b.eq	9368 <__sigtramp_r+0xa8>  // b.none
    92f8:	f100043f 	cmp	x1, #0x1
    92fc:	540002e0 	b.eq	9358 <__sigtramp_r+0x98>  // b.none
    9300:	f900007f 	str	xzr, [x3]
    9304:	2a1303e0 	mov	w0, w19
    9308:	d63f0020 	blr	x1
    930c:	52800000 	mov	w0, #0x0                   	// #0
    9310:	a94153f3 	ldp	x19, x20, [sp, #16]
    9314:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9318:	d65f03c0 	ret
    931c:	52800020 	mov	w0, #0x1                   	// #1
    9320:	a94153f3 	ldp	x19, x20, [sp, #16]
    9324:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9328:	d65f03c0 	ret
    932c:	d2802001 	mov	x1, #0x100                 	// #256
    9330:	97ffe7d4 	bl	3280 <_malloc_r>
    9334:	f9028e80 	str	x0, [x20, #1304]
    9338:	aa0003e3 	mov	x3, x0
    933c:	b40001a0 	cbz	x0, 9370 <__sigtramp_r+0xb0>
    9340:	aa0003e2 	mov	x2, x0
    9344:	91040000 	add	x0, x0, #0x100
    9348:	f800845f 	str	xzr, [x2], #8
    934c:	eb00005f 	cmp	x2, x0
    9350:	54ffffc1 	b.ne	9348 <__sigtramp_r+0x88>  // b.any
    9354:	17ffffe4 	b	92e4 <__sigtramp_r+0x24>
    9358:	52800060 	mov	w0, #0x3                   	// #3
    935c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9360:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9364:	d65f03c0 	ret
    9368:	52800040 	mov	w0, #0x2                   	// #2
    936c:	17ffffe9 	b	9310 <__sigtramp_r+0x50>
    9370:	12800000 	mov	w0, #0xffffffff            	// #-1
    9374:	17ffffe7 	b	9310 <__sigtramp_r+0x50>
    9378:	12800000 	mov	w0, #0xffffffff            	// #-1
    937c:	d65f03c0 	ret

0000000000009380 <raise>:
    9380:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9384:	f0000001 	adrp	x1, c000 <IpcSemaphoreServer+0x558>
    9388:	910003fd 	mov	x29, sp
    938c:	a90153f3 	stp	x19, x20, [sp, #16]
    9390:	f9415834 	ldr	x20, [x1, #688]
    9394:	71007c1f 	cmp	w0, #0x1f
    9398:	54000468 	b.hi	9424 <raise+0xa4>  // b.pmore
    939c:	f9428e82 	ldr	x2, [x20, #1304]
    93a0:	2a0003f3 	mov	w19, w0
    93a4:	b40001c2 	cbz	x2, 93dc <raise+0x5c>
    93a8:	93407c03 	sxtw	x3, w0
    93ac:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    93b0:	b4000161 	cbz	x1, 93dc <raise+0x5c>
    93b4:	f100043f 	cmp	x1, #0x1
    93b8:	540002e0 	b.eq	9414 <raise+0x94>  // b.none
    93bc:	b100043f 	cmn	x1, #0x1
    93c0:	540001e0 	b.eq	93fc <raise+0x7c>  // b.none
    93c4:	f823785f 	str	xzr, [x2, x3, lsl #3]
    93c8:	d63f0020 	blr	x1
    93cc:	52800000 	mov	w0, #0x0                   	// #0
    93d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    93d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    93d8:	d65f03c0 	ret
    93dc:	aa1403e0 	mov	x0, x20
    93e0:	9400009c 	bl	9650 <_getpid_r>
    93e4:	2a1303e2 	mov	w2, w19
    93e8:	2a0003e1 	mov	w1, w0
    93ec:	aa1403e0 	mov	x0, x20
    93f0:	a94153f3 	ldp	x19, x20, [sp, #16]
    93f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    93f8:	14000082 	b	9600 <_kill_r>
    93fc:	528002c1 	mov	w1, #0x16                  	// #22
    9400:	b9000281 	str	w1, [x20]
    9404:	52800020 	mov	w0, #0x1                   	// #1
    9408:	a94153f3 	ldp	x19, x20, [sp, #16]
    940c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9410:	d65f03c0 	ret
    9414:	52800000 	mov	w0, #0x0                   	// #0
    9418:	a94153f3 	ldp	x19, x20, [sp, #16]
    941c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9420:	d65f03c0 	ret
    9424:	528002c1 	mov	w1, #0x16                  	// #22
    9428:	12800000 	mov	w0, #0xffffffff            	// #-1
    942c:	b9000281 	str	w1, [x20]
    9430:	17ffffe8 	b	93d0 <raise+0x50>
    9434:	d503201f 	nop
    9438:	d503201f 	nop
    943c:	d503201f 	nop

0000000000009440 <signal>:
    9440:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9444:	f0000002 	adrp	x2, c000 <IpcSemaphoreServer+0x558>
    9448:	910003fd 	mov	x29, sp
    944c:	a90153f3 	stp	x19, x20, [sp, #16]
    9450:	93407c13 	sxtw	x19, w0
    9454:	f90013f5 	str	x21, [sp, #32]
    9458:	f9415855 	ldr	x21, [x2, #688]
    945c:	71007e7f 	cmp	w19, #0x1f
    9460:	54000148 	b.hi	9488 <signal+0x48>  // b.pmore
    9464:	aa0103f4 	mov	x20, x1
    9468:	f9428ea1 	ldr	x1, [x21, #1304]
    946c:	b40001c1 	cbz	x1, 94a4 <signal+0x64>
    9470:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    9474:	f8337834 	str	x20, [x1, x19, lsl #3]
    9478:	a94153f3 	ldp	x19, x20, [sp, #16]
    947c:	f94013f5 	ldr	x21, [sp, #32]
    9480:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9484:	d65f03c0 	ret
    9488:	528002c1 	mov	w1, #0x16                  	// #22
    948c:	b90002a1 	str	w1, [x21]
    9490:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9494:	a94153f3 	ldp	x19, x20, [sp, #16]
    9498:	f94013f5 	ldr	x21, [sp, #32]
    949c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    94a0:	d65f03c0 	ret
    94a4:	d2802001 	mov	x1, #0x100                 	// #256
    94a8:	aa1503e0 	mov	x0, x21
    94ac:	97ffe775 	bl	3280 <_malloc_r>
    94b0:	f9028ea0 	str	x0, [x21, #1304]
    94b4:	aa0003e1 	mov	x1, x0
    94b8:	b4000100 	cbz	x0, 94d8 <signal+0x98>
    94bc:	aa0003e2 	mov	x2, x0
    94c0:	91040003 	add	x3, x0, #0x100
    94c4:	d503201f 	nop
    94c8:	f800845f 	str	xzr, [x2], #8
    94cc:	eb02007f 	cmp	x3, x2
    94d0:	54ffffc1 	b.ne	94c8 <signal+0x88>  // b.any
    94d4:	17ffffe7 	b	9470 <signal+0x30>
    94d8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    94dc:	17ffffe7 	b	9478 <signal+0x38>

00000000000094e0 <_init_signal>:
    94e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    94e4:	f0000000 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    94e8:	910003fd 	mov	x29, sp
    94ec:	f9000bf3 	str	x19, [sp, #16]
    94f0:	f9415813 	ldr	x19, [x0, #688]
    94f4:	f9428e60 	ldr	x0, [x19, #1304]
    94f8:	b40000a0 	cbz	x0, 950c <_init_signal+0x2c>
    94fc:	52800000 	mov	w0, #0x0                   	// #0
    9500:	f9400bf3 	ldr	x19, [sp, #16]
    9504:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9508:	d65f03c0 	ret
    950c:	aa1303e0 	mov	x0, x19
    9510:	d2802001 	mov	x1, #0x100                 	// #256
    9514:	97ffe75b 	bl	3280 <_malloc_r>
    9518:	f9028e60 	str	x0, [x19, #1304]
    951c:	b40000e0 	cbz	x0, 9538 <_init_signal+0x58>
    9520:	91040001 	add	x1, x0, #0x100
    9524:	d503201f 	nop
    9528:	f800841f 	str	xzr, [x0], #8
    952c:	eb01001f 	cmp	x0, x1
    9530:	54ffffc1 	b.ne	9528 <_init_signal+0x48>  // b.any
    9534:	17fffff2 	b	94fc <_init_signal+0x1c>
    9538:	12800000 	mov	w0, #0xffffffff            	// #-1
    953c:	17fffff1 	b	9500 <_init_signal+0x20>

0000000000009540 <__sigtramp>:
    9540:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9544:	f0000001 	adrp	x1, c000 <IpcSemaphoreServer+0x558>
    9548:	910003fd 	mov	x29, sp
    954c:	a90153f3 	stp	x19, x20, [sp, #16]
    9550:	f9415834 	ldr	x20, [x1, #688]
    9554:	71007c1f 	cmp	w0, #0x1f
    9558:	54000508 	b.hi	95f8 <__sigtramp+0xb8>  // b.pmore
    955c:	f9428e82 	ldr	x2, [x20, #1304]
    9560:	2a0003f3 	mov	w19, w0
    9564:	b4000262 	cbz	x2, 95b0 <__sigtramp+0x70>
    9568:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    956c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    9570:	b4000181 	cbz	x1, 95a0 <__sigtramp+0x60>
    9574:	b100043f 	cmn	x1, #0x1
    9578:	540003c0 	b.eq	95f0 <__sigtramp+0xb0>  // b.none
    957c:	f100043f 	cmp	x1, #0x1
    9580:	54000300 	b.eq	95e0 <__sigtramp+0xa0>  // b.none
    9584:	f900005f 	str	xzr, [x2]
    9588:	2a1303e0 	mov	w0, w19
    958c:	d63f0020 	blr	x1
    9590:	52800000 	mov	w0, #0x0                   	// #0
    9594:	a94153f3 	ldp	x19, x20, [sp, #16]
    9598:	a8c27bfd 	ldp	x29, x30, [sp], #32
    959c:	d65f03c0 	ret
    95a0:	52800020 	mov	w0, #0x1                   	// #1
    95a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    95a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    95ac:	d65f03c0 	ret
    95b0:	aa1403e0 	mov	x0, x20
    95b4:	d2802001 	mov	x1, #0x100                 	// #256
    95b8:	97ffe732 	bl	3280 <_malloc_r>
    95bc:	f9028e80 	str	x0, [x20, #1304]
    95c0:	aa0003e2 	mov	x2, x0
    95c4:	b40001a0 	cbz	x0, 95f8 <__sigtramp+0xb8>
    95c8:	aa0003e1 	mov	x1, x0
    95cc:	91040000 	add	x0, x0, #0x100
    95d0:	f800843f 	str	xzr, [x1], #8
    95d4:	eb00003f 	cmp	x1, x0
    95d8:	54ffffc1 	b.ne	95d0 <__sigtramp+0x90>  // b.any
    95dc:	17ffffe3 	b	9568 <__sigtramp+0x28>
    95e0:	52800060 	mov	w0, #0x3                   	// #3
    95e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    95e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    95ec:	d65f03c0 	ret
    95f0:	52800040 	mov	w0, #0x2                   	// #2
    95f4:	17ffffe8 	b	9594 <__sigtramp+0x54>
    95f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    95fc:	17ffffe6 	b	9594 <__sigtramp+0x54>

0000000000009600 <_kill_r>:
    9600:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9604:	910003fd 	mov	x29, sp
    9608:	a90153f3 	stp	x19, x20, [sp, #16]
    960c:	90000034 	adrp	x20, d000 <__malloc_av_+0x600>
    9610:	aa0003f3 	mov	x19, x0
    9614:	b9083a9f 	str	wzr, [x20, #2104]
    9618:	2a0103e0 	mov	w0, w1
    961c:	2a0203e1 	mov	w1, w2
    9620:	97ffe668 	bl	2fc0 <_kill>
    9624:	3100041f 	cmn	w0, #0x1
    9628:	54000080 	b.eq	9638 <_kill_r+0x38>  // b.none
    962c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9630:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9634:	d65f03c0 	ret
    9638:	b9483a81 	ldr	w1, [x20, #2104]
    963c:	34ffff81 	cbz	w1, 962c <_kill_r+0x2c>
    9640:	b9000261 	str	w1, [x19]
    9644:	a94153f3 	ldp	x19, x20, [sp, #16]
    9648:	a8c27bfd 	ldp	x29, x30, [sp], #32
    964c:	d65f03c0 	ret

0000000000009650 <_getpid_r>:
    9650:	17ffe660 	b	2fd0 <_getpid>
    9654:	d503201f 	nop
    9658:	d503201f 	nop
    965c:	d503201f 	nop

0000000000009660 <__sread>:
    9660:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9664:	93407c63 	sxtw	x3, w3
    9668:	910003fd 	mov	x29, sp
    966c:	f9000bf3 	str	x19, [sp, #16]
    9670:	aa0103f3 	mov	x19, x1
    9674:	79c02421 	ldrsh	w1, [x1, #18]
    9678:	94000592 	bl	acc0 <_read_r>
    967c:	b7f800e0 	tbnz	x0, #63, 9698 <__sread+0x38>
    9680:	f9404a61 	ldr	x1, [x19, #144]
    9684:	8b000021 	add	x1, x1, x0
    9688:	f9004a61 	str	x1, [x19, #144]
    968c:	f9400bf3 	ldr	x19, [sp, #16]
    9690:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9694:	d65f03c0 	ret
    9698:	79402261 	ldrh	w1, [x19, #16]
    969c:	12137821 	and	w1, w1, #0xffffefff
    96a0:	79002261 	strh	w1, [x19, #16]
    96a4:	f9400bf3 	ldr	x19, [sp, #16]
    96a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    96ac:	d65f03c0 	ret

00000000000096b0 <__seofread>:
    96b0:	52800000 	mov	w0, #0x0                   	// #0
    96b4:	d65f03c0 	ret
    96b8:	d503201f 	nop
    96bc:	d503201f 	nop

00000000000096c0 <__swrite>:
    96c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    96c4:	910003fd 	mov	x29, sp
    96c8:	79c02024 	ldrsh	w4, [x1, #16]
    96cc:	a90153f3 	stp	x19, x20, [sp, #16]
    96d0:	aa0103f3 	mov	x19, x1
    96d4:	aa0003f4 	mov	x20, x0
    96d8:	a9025bf5 	stp	x21, x22, [sp, #32]
    96dc:	aa0203f5 	mov	x21, x2
    96e0:	2a0303f6 	mov	w22, w3
    96e4:	37400184 	tbnz	w4, #8, 9714 <__swrite+0x54>
    96e8:	79c02661 	ldrsh	w1, [x19, #18]
    96ec:	12137884 	and	w4, w4, #0xffffefff
    96f0:	79002264 	strh	w4, [x19, #16]
    96f4:	93407ec3 	sxtw	x3, w22
    96f8:	aa1503e2 	mov	x2, x21
    96fc:	aa1403e0 	mov	x0, x20
    9700:	94000450 	bl	a840 <_write_r>
    9704:	a94153f3 	ldp	x19, x20, [sp, #16]
    9708:	a9425bf5 	ldp	x21, x22, [sp, #32]
    970c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9710:	d65f03c0 	ret
    9714:	79c02421 	ldrsh	w1, [x1, #18]
    9718:	52800043 	mov	w3, #0x2                   	// #2
    971c:	d2800002 	mov	x2, #0x0                   	// #0
    9720:	94000550 	bl	ac60 <_lseek_r>
    9724:	79c02264 	ldrsh	w4, [x19, #16]
    9728:	17fffff0 	b	96e8 <__swrite+0x28>
    972c:	d503201f 	nop

0000000000009730 <__sseek>:
    9730:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9734:	910003fd 	mov	x29, sp
    9738:	f9000bf3 	str	x19, [sp, #16]
    973c:	aa0103f3 	mov	x19, x1
    9740:	79c02421 	ldrsh	w1, [x1, #18]
    9744:	94000547 	bl	ac60 <_lseek_r>
    9748:	79402261 	ldrh	w1, [x19, #16]
    974c:	b100041f 	cmn	x0, #0x1
    9750:	540000e0 	b.eq	976c <__sseek+0x3c>  // b.none
    9754:	32140021 	orr	w1, w1, #0x1000
    9758:	79002261 	strh	w1, [x19, #16]
    975c:	f9004a60 	str	x0, [x19, #144]
    9760:	f9400bf3 	ldr	x19, [sp, #16]
    9764:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9768:	d65f03c0 	ret
    976c:	12137821 	and	w1, w1, #0xffffefff
    9770:	79002261 	strh	w1, [x19, #16]
    9774:	f9400bf3 	ldr	x19, [sp, #16]
    9778:	a8c27bfd 	ldp	x29, x30, [sp], #32
    977c:	d65f03c0 	ret

0000000000009780 <__sclose>:
    9780:	79c02421 	ldrsh	w1, [x1, #18]
    9784:	14000447 	b	a8a0 <_close_r>
    9788:	d503201f 	nop
    978c:	d503201f 	nop

0000000000009790 <strcasecmp>:
    9790:	d0000006 	adrp	x6, b000 <_fini+0xcc>
    9794:	aa0003e8 	mov	x8, x0
    9798:	9125c4c6 	add	x6, x6, #0x971
    979c:	d2800003 	mov	x3, #0x0                   	// #0
    97a0:	38636902 	ldrb	w2, [x8, x3]
    97a4:	38636820 	ldrb	w0, [x1, x3]
    97a8:	91000463 	add	x3, x3, #0x1
    97ac:	92401c45 	and	x5, x2, #0xff
    97b0:	11008047 	add	w7, w2, #0x20
    97b4:	92401c04 	and	x4, x0, #0xff
    97b8:	386568c5 	ldrb	w5, [x6, x5]
    97bc:	386468c4 	ldrb	w4, [x6, x4]
    97c0:	120004a5 	and	w5, w5, #0x3
    97c4:	710004bf 	cmp	w5, #0x1
    97c8:	12000484 	and	w4, w4, #0x3
    97cc:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    97d0:	7100049f 	cmp	w4, #0x1
    97d4:	540000a0 	b.eq	97e8 <strcasecmp+0x58>  // b.none
    97d8:	6b000042 	subs	w2, w2, w0
    97dc:	540000e1 	b.ne	97f8 <strcasecmp+0x68>  // b.any
    97e0:	35fffe00 	cbnz	w0, 97a0 <strcasecmp+0x10>
    97e4:	d65f03c0 	ret
    97e8:	11008000 	add	w0, w0, #0x20
    97ec:	6b000040 	subs	w0, w2, w0
    97f0:	54fffd80 	b.eq	97a0 <strcasecmp+0x10>  // b.none
    97f4:	d65f03c0 	ret
    97f8:	2a0203e0 	mov	w0, w2
    97fc:	d65f03c0 	ret

0000000000009800 <strcat>:
    9800:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9804:	910003fd 	mov	x29, sp
    9808:	f9000bf3 	str	x19, [sp, #16]
    980c:	aa0003f3 	mov	x19, x0
    9810:	f240081f 	tst	x0, #0x7
    9814:	540001c1 	b.ne	984c <strcat+0x4c>  // b.any
    9818:	f9400002 	ldr	x2, [x0]
    981c:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    9820:	f29fdfe4 	movk	x4, #0xfeff
    9824:	8b040043 	add	x3, x2, x4
    9828:	8a220062 	bic	x2, x3, x2
    982c:	f201c05f 	tst	x2, #0x8080808080808080
    9830:	540000e1 	b.ne	984c <strcat+0x4c>  // b.any
    9834:	d503201f 	nop
    9838:	f8408c02 	ldr	x2, [x0, #8]!
    983c:	8b040043 	add	x3, x2, x4
    9840:	8a220062 	bic	x2, x3, x2
    9844:	f201c05f 	tst	x2, #0x8080808080808080
    9848:	54ffff80 	b.eq	9838 <strcat+0x38>  // b.none
    984c:	39400002 	ldrb	w2, [x0]
    9850:	34000082 	cbz	w2, 9860 <strcat+0x60>
    9854:	d503201f 	nop
    9858:	38401c02 	ldrb	w2, [x0, #1]!
    985c:	35ffffe2 	cbnz	w2, 9858 <strcat+0x58>
    9860:	94000088 	bl	9a80 <strcpy>
    9864:	aa1303e0 	mov	x0, x19
    9868:	f9400bf3 	ldr	x19, [sp, #16]
    986c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9870:	d65f03c0 	ret

0000000000009874 <strchr>:
    9874:	52808024 	mov	w4, #0x401                 	// #1025
    9878:	72a80204 	movk	w4, #0x4010, lsl #16
    987c:	4e010c20 	dup	v0.16b, w1
    9880:	927be802 	and	x2, x0, #0xffffffffffffffe0
    9884:	4e040c90 	dup	v16.4s, w4
    9888:	f2401003 	ands	x3, x0, #0x1f
    988c:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    9890:	540002a0 	b.eq	98e4 <strchr+0x70>  // b.none
    9894:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    9898:	cb0303e3 	neg	x3, x3
    989c:	4e209823 	cmeq	v3.16b, v1.16b, #0
    98a0:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    98a4:	4e209844 	cmeq	v4.16b, v2.16b, #0
    98a8:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    98ac:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    98b0:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    98b4:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    98b8:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    98bc:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    98c0:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    98c4:	d37ff863 	lsl	x3, x3, #1
    98c8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    98cc:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    98d0:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    98d4:	9ac324a3 	lsr	x3, x5, x3
    98d8:	4e083e25 	mov	x5, v17.d[0]
    98dc:	8a2300a3 	bic	x3, x5, x3
    98e0:	b50002a3 	cbnz	x3, 9934 <strchr+0xc0>
    98e4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    98e8:	4e209823 	cmeq	v3.16b, v1.16b, #0
    98ec:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    98f0:	4e209844 	cmeq	v4.16b, v2.16b, #0
    98f4:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    98f8:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    98fc:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9900:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    9904:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    9908:	4e083e23 	mov	x3, v17.d[0]
    990c:	b4fffec3 	cbz	x3, 98e4 <strchr+0x70>
    9910:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    9914:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    9918:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    991c:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    9920:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    9924:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    9928:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    992c:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    9930:	4e083e23 	mov	x3, v17.d[0]
    9934:	dac00063 	rbit	x3, x3
    9938:	d1008042 	sub	x2, x2, #0x20
    993c:	dac01063 	clz	x3, x3
    9940:	f240007f 	tst	x3, #0x1
    9944:	8b430440 	add	x0, x2, x3, lsr #1
    9948:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    994c:	d65f03c0 	ret
    9950:	d503201f 	nop
    9954:	d503201f 	nop
    9958:	d503201f 	nop
    995c:	d503201f 	nop
    9960:	d503201f 	nop
    9964:	d503201f 	nop
    9968:	d503201f 	nop
    996c:	d503201f 	nop
    9970:	d503201f 	nop
    9974:	d503201f 	nop
    9978:	d503201f 	nop
    997c:	d503201f 	nop

0000000000009980 <strcmp>:
    9980:	ca010007 	eor	x7, x0, x1
    9984:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    9988:	f24008ff 	tst	x7, #0x7
    998c:	540003e1 	b.ne	9a08 <strcmp+0x88>  // b.any
    9990:	f2400807 	ands	x7, x0, #0x7
    9994:	54000241 	b.ne	99dc <strcmp+0x5c>  // b.any
    9998:	f8408402 	ldr	x2, [x0], #8
    999c:	f8408423 	ldr	x3, [x1], #8
    99a0:	cb0a0047 	sub	x7, x2, x10
    99a4:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    99a8:	ca030045 	eor	x5, x2, x3
    99ac:	8a2800e4 	bic	x4, x7, x8
    99b0:	aa0400a6 	orr	x6, x5, x4
    99b4:	b4ffff26 	cbz	x6, 9998 <strcmp+0x18>
    99b8:	dac00cc6 	rev	x6, x6
    99bc:	dac00c42 	rev	x2, x2
    99c0:	dac010cb 	clz	x11, x6
    99c4:	dac00c63 	rev	x3, x3
    99c8:	9acb2042 	lsl	x2, x2, x11
    99cc:	9acb2063 	lsl	x3, x3, x11
    99d0:	d378fc42 	lsr	x2, x2, #56
    99d4:	cb43e040 	sub	x0, x2, x3, lsr #56
    99d8:	d65f03c0 	ret
    99dc:	927df000 	and	x0, x0, #0xfffffffffffffff8
    99e0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    99e4:	d37df0e7 	lsl	x7, x7, #3
    99e8:	f8408402 	ldr	x2, [x0], #8
    99ec:	cb0703e7 	neg	x7, x7
    99f0:	f8408423 	ldr	x3, [x1], #8
    99f4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    99f8:	9ac72508 	lsr	x8, x8, x7
    99fc:	aa080042 	orr	x2, x2, x8
    9a00:	aa080063 	orr	x3, x3, x8
    9a04:	17ffffe7 	b	99a0 <strcmp+0x20>
    9a08:	f240081f 	tst	x0, #0x7
    9a0c:	54000100 	b.eq	9a2c <strcmp+0xac>  // b.none
    9a10:	38401402 	ldrb	w2, [x0], #1
    9a14:	38401423 	ldrb	w3, [x1], #1
    9a18:	7100045f 	cmp	w2, #0x1
    9a1c:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    9a20:	540001e1 	b.ne	9a5c <strcmp+0xdc>  // b.any
    9a24:	f240081f 	tst	x0, #0x7
    9a28:	54ffff41 	b.ne	9a10 <strcmp+0x90>  // b.any
    9a2c:	927d2027 	and	x7, x1, #0xff8
    9a30:	d27d20e7 	eor	x7, x7, #0xff8
    9a34:	b4fffee7 	cbz	x7, 9a10 <strcmp+0x90>
    9a38:	f8408402 	ldr	x2, [x0], #8
    9a3c:	f8408423 	ldr	x3, [x1], #8
    9a40:	cb0a0047 	sub	x7, x2, x10
    9a44:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    9a48:	ca030045 	eor	x5, x2, x3
    9a4c:	8a2800e4 	bic	x4, x7, x8
    9a50:	aa0400a6 	orr	x6, x5, x4
    9a54:	b4fffec6 	cbz	x6, 9a2c <strcmp+0xac>
    9a58:	17ffffd8 	b	99b8 <strcmp+0x38>
    9a5c:	cb030040 	sub	x0, x2, x3
    9a60:	d65f03c0 	ret
    9a64:	d503201f 	nop
    9a68:	d503201f 	nop
    9a6c:	d503201f 	nop
    9a70:	d503201f 	nop
    9a74:	d503201f 	nop
    9a78:	d503201f 	nop
    9a7c:	d503201f 	nop

0000000000009a80 <strcpy>:
    9a80:	92402c29 	and	x9, x1, #0xfff
    9a84:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    9a88:	92400c31 	and	x17, x1, #0xf
    9a8c:	f13fc13f 	cmp	x9, #0xff0
    9a90:	cb1103e8 	neg	x8, x17
    9a94:	540008cc 	b.gt	9bac <strcpy+0x12c>
    9a98:	a9401424 	ldp	x4, x5, [x1]
    9a9c:	cb0c0088 	sub	x8, x4, x12
    9aa0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9aa4:	ea290106 	bics	x6, x8, x9
    9aa8:	540001c1 	b.ne	9ae0 <strcpy+0x60>  // b.any
    9aac:	cb0c00aa 	sub	x10, x5, x12
    9ab0:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9ab4:	ea2b0147 	bics	x7, x10, x11
    9ab8:	54000440 	b.eq	9b40 <strcpy+0xc0>  // b.none
    9abc:	dac00ce7 	rev	x7, x7
    9ac0:	dac010ef 	clz	x15, x7
    9ac4:	d2800709 	mov	x9, #0x38                  	// #56
    9ac8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    9acc:	cb0f012f 	sub	x15, x9, x15
    9ad0:	9acf20a5 	lsl	x5, x5, x15
    9ad4:	f8001065 	stur	x5, [x3, #1]
    9ad8:	f9000004 	str	x4, [x0]
    9adc:	d65f03c0 	ret
    9ae0:	dac00cc6 	rev	x6, x6
    9ae4:	dac010cf 	clz	x15, x6
    9ae8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    9aec:	f10061e9 	subs	x9, x15, #0x18
    9af0:	540000ab 	b.lt	9b04 <strcpy+0x84>  // b.tstop
    9af4:	9ac92485 	lsr	x5, x4, x9
    9af8:	b81fd065 	stur	w5, [x3, #-3]
    9afc:	b9000004 	str	w4, [x0]
    9b00:	d65f03c0 	ret
    9b04:	b400004f 	cbz	x15, 9b0c <strcpy+0x8c>
    9b08:	79000004 	strh	w4, [x0]
    9b0c:	3900007f 	strb	wzr, [x3]
    9b10:	d65f03c0 	ret
    9b14:	d503201f 	nop
    9b18:	d503201f 	nop
    9b1c:	d503201f 	nop
    9b20:	d503201f 	nop
    9b24:	d503201f 	nop
    9b28:	d503201f 	nop
    9b2c:	d503201f 	nop
    9b30:	d503201f 	nop
    9b34:	d503201f 	nop
    9b38:	d503201f 	nop
    9b3c:	d503201f 	nop
    9b40:	d1004231 	sub	x17, x17, #0x10
    9b44:	a9001404 	stp	x4, x5, [x0]
    9b48:	cb110022 	sub	x2, x1, x17
    9b4c:	cb110003 	sub	x3, x0, x17
    9b50:	14000002 	b	9b58 <strcpy+0xd8>
    9b54:	a8811464 	stp	x4, x5, [x3], #16
    9b58:	a8c11444 	ldp	x4, x5, [x2], #16
    9b5c:	cb0c0088 	sub	x8, x4, x12
    9b60:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9b64:	cb0c00aa 	sub	x10, x5, x12
    9b68:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9b6c:	8a290106 	bic	x6, x8, x9
    9b70:	ea2b0147 	bics	x7, x10, x11
    9b74:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    9b78:	54fffee0 	b.eq	9b54 <strcpy+0xd4>  // b.none
    9b7c:	f10000df 	cmp	x6, #0x0
    9b80:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    9b84:	dac00cc6 	rev	x6, x6
    9b88:	dac010cf 	clz	x15, x6
    9b8c:	910121e8 	add	x8, x15, #0x48
    9b90:	910021ef 	add	x15, x15, #0x8
    9b94:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    9b98:	8b4f0c42 	add	x2, x2, x15, lsr #3
    9b9c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    9ba0:	a97e1444 	ldp	x4, x5, [x2, #-32]
    9ba4:	a93f1464 	stp	x4, x5, [x3, #-16]
    9ba8:	d65f03c0 	ret
    9bac:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    9bb0:	a9401444 	ldp	x4, x5, [x2]
    9bb4:	d37df108 	lsl	x8, x8, #3
    9bb8:	f2400a3f 	tst	x17, #0x7
    9bbc:	da9f03e9 	csetm	x9, ne  // ne = any
    9bc0:	9ac82529 	lsr	x9, x9, x8
    9bc4:	aa090084 	orr	x4, x4, x9
    9bc8:	aa0900ae 	orr	x14, x5, x9
    9bcc:	f100223f 	cmp	x17, #0x8
    9bd0:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    9bd4:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    9bd8:	cb0c0088 	sub	x8, x4, x12
    9bdc:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9be0:	cb0c00aa 	sub	x10, x5, x12
    9be4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9be8:	8a290106 	bic	x6, x8, x9
    9bec:	ea2b0147 	bics	x7, x10, x11
    9bf0:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    9bf4:	54fff520 	b.eq	9a98 <strcpy+0x18>  // b.none
    9bf8:	d37df228 	lsl	x8, x17, #3
    9bfc:	cb110fe9 	neg	x9, x17, lsl #3
    9c00:	9ac8248d 	lsr	x13, x4, x8
    9c04:	9ac920ab 	lsl	x11, x5, x9
    9c08:	9ac824a5 	lsr	x5, x5, x8
    9c0c:	aa0d016b 	orr	x11, x11, x13
    9c10:	f100223f 	cmp	x17, #0x8
    9c14:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    9c18:	cb0c0088 	sub	x8, x4, x12
    9c1c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    9c20:	cb0c00aa 	sub	x10, x5, x12
    9c24:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    9c28:	8a290106 	bic	x6, x8, x9
    9c2c:	b5fff5a6 	cbnz	x6, 9ae0 <strcpy+0x60>
    9c30:	8a2b0147 	bic	x7, x10, x11
    9c34:	17ffffa2 	b	9abc <strcpy+0x3c>
    9c38:	d503201f 	nop
    9c3c:	d503201f 	nop

0000000000009c40 <strlcpy>:
    9c40:	aa0003e4 	mov	x4, x0
    9c44:	aa0103e3 	mov	x3, x1
    9c48:	b4000202 	cbz	x2, 9c88 <strlcpy+0x48>
    9c4c:	f100045f 	cmp	x2, #0x1
    9c50:	54000180 	b.eq	9c80 <strlcpy+0x40>  // b.none
    9c54:	8b020002 	add	x2, x0, x2
    9c58:	14000003 	b	9c64 <strlcpy+0x24>
    9c5c:	ab02001f 	cmn	x0, x2
    9c60:	54000100 	b.eq	9c80 <strlcpy+0x40>  // b.none
    9c64:	38401465 	ldrb	w5, [x3], #1
    9c68:	38001485 	strb	w5, [x4], #1
    9c6c:	aa2403e0 	mvn	x0, x4
    9c70:	35ffff65 	cbnz	w5, 9c5c <strlcpy+0x1c>
    9c74:	cb010060 	sub	x0, x3, x1
    9c78:	d1000400 	sub	x0, x0, #0x1
    9c7c:	d65f03c0 	ret
    9c80:	3900009f 	strb	wzr, [x4]
    9c84:	d503201f 	nop
    9c88:	38401462 	ldrb	w2, [x3], #1
    9c8c:	34ffff42 	cbz	w2, 9c74 <strlcpy+0x34>
    9c90:	38401462 	ldrb	w2, [x3], #1
    9c94:	35ffffa2 	cbnz	w2, 9c88 <strlcpy+0x48>
    9c98:	17fffff7 	b	9c74 <strlcpy+0x34>
    9c9c:	d503201f 	nop
    9ca0:	d503201f 	nop
    9ca4:	d503201f 	nop
    9ca8:	d503201f 	nop
    9cac:	d503201f 	nop
    9cb0:	d503201f 	nop
    9cb4:	d503201f 	nop
    9cb8:	d503201f 	nop
    9cbc:	d503201f 	nop

0000000000009cc0 <strlen>:
    9cc0:	92402c04 	and	x4, x0, #0xfff
    9cc4:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    9cc8:	f13fc09f 	cmp	x4, #0xff0
    9ccc:	5400082c 	b.gt	9dd0 <strlen+0x110>
    9cd0:	a9400c02 	ldp	x2, x3, [x0]
    9cd4:	cb080044 	sub	x4, x2, x8
    9cd8:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9cdc:	cb080066 	sub	x6, x3, x8
    9ce0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9ce4:	ea250084 	bics	x4, x4, x5
    9ce8:	8a2700c5 	bic	x5, x6, x7
    9cec:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9cf0:	54000100 	b.eq	9d10 <strlen+0x50>  // b.none
    9cf4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    9cf8:	d2800100 	mov	x0, #0x8                   	// #8
    9cfc:	dac00c84 	rev	x4, x4
    9d00:	dac01084 	clz	x4, x4
    9d04:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    9d08:	8b440c00 	add	x0, x0, x4, lsr #3
    9d0c:	d65f03c0 	ret
    9d10:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    9d14:	d1004021 	sub	x1, x1, #0x10
    9d18:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    9d1c:	cb080044 	sub	x4, x2, x8
    9d20:	cb080066 	sub	x6, x3, x8
    9d24:	aa060085 	orr	x5, x4, x6
    9d28:	ea081cbf 	tst	x5, x8, lsl #7
    9d2c:	54000101 	b.ne	9d4c <strlen+0x8c>  // b.any
    9d30:	a9410c22 	ldp	x2, x3, [x1, #16]
    9d34:	cb080044 	sub	x4, x2, x8
    9d38:	cb080066 	sub	x6, x3, x8
    9d3c:	aa060085 	orr	x5, x4, x6
    9d40:	ea081cbf 	tst	x5, x8, lsl #7
    9d44:	54fffea0 	b.eq	9d18 <strlen+0x58>  // b.none
    9d48:	91004021 	add	x1, x1, #0x10
    9d4c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9d50:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9d54:	ea250084 	bics	x4, x4, x5
    9d58:	8a2700c5 	bic	x5, x6, x7
    9d5c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9d60:	54000120 	b.eq	9d84 <strlen+0xc4>  // b.none
    9d64:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    9d68:	cb000020 	sub	x0, x1, x0
    9d6c:	dac00c84 	rev	x4, x4
    9d70:	91002005 	add	x5, x0, #0x8
    9d74:	dac01084 	clz	x4, x4
    9d78:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    9d7c:	8b440c00 	add	x0, x0, x4, lsr #3
    9d80:	d65f03c0 	ret
    9d84:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    9d88:	cb080044 	sub	x4, x2, x8
    9d8c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9d90:	cb080066 	sub	x6, x3, x8
    9d94:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9d98:	ea250084 	bics	x4, x4, x5
    9d9c:	8a2700c5 	bic	x5, x6, x7
    9da0:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9da4:	54fffe01 	b.ne	9d64 <strlen+0xa4>  // b.any
    9da8:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    9dac:	cb080044 	sub	x4, x2, x8
    9db0:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    9db4:	cb080066 	sub	x6, x3, x8
    9db8:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    9dbc:	ea250084 	bics	x4, x4, x5
    9dc0:	8a2700c5 	bic	x5, x6, x7
    9dc4:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    9dc8:	54fffde0 	b.eq	9d84 <strlen+0xc4>  // b.none
    9dcc:	17ffffe6 	b	9d64 <strlen+0xa4>
    9dd0:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    9dd4:	a9400c22 	ldp	x2, x3, [x1]
    9dd8:	d37df004 	lsl	x4, x0, #3
    9ddc:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    9de0:	9ac420e4 	lsl	x4, x7, x4
    9de4:	b201c084 	orr	x4, x4, #0x8080808080808080
    9de8:	aa240042 	orn	x2, x2, x4
    9dec:	aa240065 	orn	x5, x3, x4
    9df0:	f27d001f 	tst	x0, #0x8
    9df4:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    9df8:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    9dfc:	17ffffc8 	b	9d1c <strlen+0x5c>

0000000000009e00 <strncasecmp>:
    9e00:	aa0003e9 	mov	x9, x0
    9e04:	b4000382 	cbz	x2, 9e74 <strncasecmp+0x74>
    9e08:	d0000007 	adrp	x7, b000 <_fini+0xcc>
    9e0c:	d2800004 	mov	x4, #0x0                   	// #0
    9e10:	9125c4e7 	add	x7, x7, #0x971
    9e14:	14000006 	b	9e2c <strncasecmp+0x2c>
    9e18:	6b000063 	subs	w3, w3, w0
    9e1c:	54000301 	b.ne	9e7c <strncasecmp+0x7c>  // b.any
    9e20:	34000280 	cbz	w0, 9e70 <strncasecmp+0x70>
    9e24:	eb04005f 	cmp	x2, x4
    9e28:	54000260 	b.eq	9e74 <strncasecmp+0x74>  // b.none
    9e2c:	38646923 	ldrb	w3, [x9, x4]
    9e30:	38646820 	ldrb	w0, [x1, x4]
    9e34:	91000484 	add	x4, x4, #0x1
    9e38:	92401c66 	and	x6, x3, #0xff
    9e3c:	11008068 	add	w8, w3, #0x20
    9e40:	92401c05 	and	x5, x0, #0xff
    9e44:	386668e6 	ldrb	w6, [x7, x6]
    9e48:	386568e5 	ldrb	w5, [x7, x5]
    9e4c:	120004c6 	and	w6, w6, #0x3
    9e50:	710004df 	cmp	w6, #0x1
    9e54:	120004a5 	and	w5, w5, #0x3
    9e58:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    9e5c:	710004bf 	cmp	w5, #0x1
    9e60:	54fffdc1 	b.ne	9e18 <strncasecmp+0x18>  // b.any
    9e64:	11008000 	add	w0, w0, #0x20
    9e68:	6b000060 	subs	w0, w3, w0
    9e6c:	54fffdc0 	b.eq	9e24 <strncasecmp+0x24>  // b.none
    9e70:	d65f03c0 	ret
    9e74:	52800000 	mov	w0, #0x0                   	// #0
    9e78:	d65f03c0 	ret
    9e7c:	2a0303e0 	mov	w0, w3
    9e80:	d65f03c0 	ret
    9e84:	d503201f 	nop
    9e88:	d503201f 	nop
    9e8c:	d503201f 	nop

0000000000009e90 <strncpy>:
    9e90:	aa000023 	orr	x3, x1, x0
    9e94:	f240087f 	tst	x3, #0x7
    9e98:	aa0003e3 	mov	x3, x0
    9e9c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    9ea0:	540002c8 	b.hi	9ef8 <strncpy+0x68>  // b.pmore
    9ea4:	d1000445 	sub	x5, x2, #0x1
    9ea8:	d2800027 	mov	x7, #0x1                   	// #1
    9eac:	8b050025 	add	x5, x1, x5
    9eb0:	14000007 	b	9ecc <strncpy+0x3c>
    9eb4:	386468a4 	ldrb	w4, [x5, x4]
    9eb8:	d1000446 	sub	x6, x2, #0x1
    9ebc:	38001424 	strb	w4, [x1], #1
    9ec0:	340000e4 	cbz	w4, 9edc <strncpy+0x4c>
    9ec4:	aa0103e3 	mov	x3, x1
    9ec8:	aa0603e2 	mov	x2, x6
    9ecc:	cb0200e4 	sub	x4, x7, x2
    9ed0:	aa0303e1 	mov	x1, x3
    9ed4:	b5ffff02 	cbnz	x2, 9eb4 <strncpy+0x24>
    9ed8:	d65f03c0 	ret
    9edc:	8b020062 	add	x2, x3, x2
    9ee0:	b4ffffc6 	cbz	x6, 9ed8 <strncpy+0x48>
    9ee4:	d503201f 	nop
    9ee8:	3800143f 	strb	wzr, [x1], #1
    9eec:	eb02003f 	cmp	x1, x2
    9ef0:	54ffffc1 	b.ne	9ee8 <strncpy+0x58>  // b.any
    9ef4:	d65f03c0 	ret
    9ef8:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    9efc:	f29fdfe6 	movk	x6, #0xfeff
    9f00:	f9400025 	ldr	x5, [x1]
    9f04:	8b0600a4 	add	x4, x5, x6
    9f08:	8a250084 	bic	x4, x4, x5
    9f0c:	f201c09f 	tst	x4, #0x8080808080808080
    9f10:	54fffca1 	b.ne	9ea4 <strncpy+0x14>  // b.any
    9f14:	d1002042 	sub	x2, x2, #0x8
    9f18:	f8008465 	str	x5, [x3], #8
    9f1c:	91002021 	add	x1, x1, #0x8
    9f20:	f1001c5f 	cmp	x2, #0x7
    9f24:	54fffee8 	b.hi	9f00 <strncpy+0x70>  // b.pmore
    9f28:	17ffffdf 	b	9ea4 <strncpy+0x14>
    9f2c:	d503201f 	nop

0000000000009f30 <_strtol_l.part.0>:
    9f30:	d0000007 	adrp	x7, b000 <_fini+0xcc>
    9f34:	aa0003ec 	mov	x12, x0
    9f38:	aa0103e6 	mov	x6, x1
    9f3c:	9125c4e7 	add	x7, x7, #0x971
    9f40:	aa0603e8 	mov	x8, x6
    9f44:	384014c4 	ldrb	w4, [x6], #1
    9f48:	92401c85 	and	x5, x4, #0xff
    9f4c:	386568e5 	ldrb	w5, [x7, x5]
    9f50:	371fff85 	tbnz	w5, #3, 9f40 <_strtol_l.part.0+0x10>
    9f54:	2a0403e5 	mov	w5, w4
    9f58:	7100b49f 	cmp	w4, #0x2d
    9f5c:	54000880 	b.eq	a06c <_strtol_l.part.0+0x13c>  // b.none
    9f60:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    9f64:	5280000d 	mov	w13, #0x0                   	// #0
    9f68:	7100ac9f 	cmp	w4, #0x2b
    9f6c:	540006a0 	b.eq	a040 <_strtol_l.part.0+0x110>  // b.none
    9f70:	721b787f 	tst	w3, #0xffffffef
    9f74:	54000121 	b.ne	9f98 <_strtol_l.part.0+0x68>  // b.any
    9f78:	7100c0bf 	cmp	w5, #0x30
    9f7c:	54000820 	b.eq	a080 <_strtol_l.part.0+0x150>  // b.none
    9f80:	350000c3 	cbnz	w3, 9f98 <_strtol_l.part.0+0x68>
    9f84:	d280014a 	mov	x10, #0xa                   	// #10
    9f88:	2a0a03e3 	mov	w3, w10
    9f8c:	14000004 	b	9f9c <_strtol_l.part.0+0x6c>
    9f90:	34000903 	cbz	w3, a0b0 <_strtol_l.part.0+0x180>
    9f94:	d503201f 	nop
    9f98:	93407c6a 	sxtw	x10, w3
    9f9c:	9aca0968 	udiv	x8, x11, x10
    9fa0:	52800007 	mov	w7, #0x0                   	// #0
    9fa4:	d2800000 	mov	x0, #0x0                   	// #0
    9fa8:	1b0aad09 	msub	w9, w8, w10, w11
    9fac:	d503201f 	nop
    9fb0:	5100c0a4 	sub	w4, w5, #0x30
    9fb4:	7100249f 	cmp	w4, #0x9
    9fb8:	540000a9 	b.ls	9fcc <_strtol_l.part.0+0x9c>  // b.plast
    9fbc:	510104a4 	sub	w4, w5, #0x41
    9fc0:	7100649f 	cmp	w4, #0x19
    9fc4:	54000208 	b.hi	a004 <_strtol_l.part.0+0xd4>  // b.pmore
    9fc8:	5100dca4 	sub	w4, w5, #0x37
    9fcc:	6b04007f 	cmp	w3, w4
    9fd0:	5400028d 	b.le	a020 <_strtol_l.part.0+0xf0>
    9fd4:	710000ff 	cmp	w7, #0x0
    9fd8:	12800007 	mov	w7, #0xffffffff            	// #-1
    9fdc:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    9fe0:	540000e3 	b.cc	9ffc <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    9fe4:	eb00011f 	cmp	x8, x0
    9fe8:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    9fec:	5400008b 	b.lt	9ffc <_strtol_l.part.0+0xcc>  // b.tstop
    9ff0:	93407c84 	sxtw	x4, w4
    9ff4:	52800027 	mov	w7, #0x1                   	// #1
    9ff8:	9b0a1000 	madd	x0, x0, x10, x4
    9ffc:	384014c5 	ldrb	w5, [x6], #1
    a000:	17ffffec 	b	9fb0 <_strtol_l.part.0+0x80>
    a004:	510184a4 	sub	w4, w5, #0x61
    a008:	7100649f 	cmp	w4, #0x19
    a00c:	540000a8 	b.hi	a020 <_strtol_l.part.0+0xf0>  // b.pmore
    a010:	51015ca4 	sub	w4, w5, #0x57
    a014:	6b04007f 	cmp	w3, w4
    a018:	54fffdec 	b.gt	9fd4 <_strtol_l.part.0+0xa4>
    a01c:	d503201f 	nop
    a020:	310004ff 	cmn	w7, #0x1
    a024:	54000140 	b.eq	a04c <_strtol_l.part.0+0x11c>  // b.none
    a028:	710001bf 	cmp	w13, #0x0
    a02c:	da800400 	cneg	x0, x0, ne  // ne = any
    a030:	b4000062 	cbz	x2, a03c <_strtol_l.part.0+0x10c>
    a034:	350003a7 	cbnz	w7, a0a8 <_strtol_l.part.0+0x178>
    a038:	f9000041 	str	x1, [x2]
    a03c:	d65f03c0 	ret
    a040:	394000c5 	ldrb	w5, [x6]
    a044:	91000906 	add	x6, x8, #0x2
    a048:	17ffffca 	b	9f70 <_strtol_l.part.0+0x40>
    a04c:	52800440 	mov	w0, #0x22                  	// #34
    a050:	b9000180 	str	w0, [x12]
    a054:	aa0b03e0 	mov	x0, x11
    a058:	b4ffff22 	cbz	x2, a03c <_strtol_l.part.0+0x10c>
    a05c:	d10004c1 	sub	x1, x6, #0x1
    a060:	aa0b03e0 	mov	x0, x11
    a064:	f9000041 	str	x1, [x2]
    a068:	17fffff5 	b	a03c <_strtol_l.part.0+0x10c>
    a06c:	394000c5 	ldrb	w5, [x6]
    a070:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    a074:	91000906 	add	x6, x8, #0x2
    a078:	5280002d 	mov	w13, #0x1                   	// #1
    a07c:	17ffffbd 	b	9f70 <_strtol_l.part.0+0x40>
    a080:	394000c0 	ldrb	w0, [x6]
    a084:	121a7800 	and	w0, w0, #0xffffffdf
    a088:	12001c00 	and	w0, w0, #0xff
    a08c:	7101601f 	cmp	w0, #0x58
    a090:	54fff801 	b.ne	9f90 <_strtol_l.part.0+0x60>  // b.any
    a094:	394004c5 	ldrb	w5, [x6, #1]
    a098:	d280020a 	mov	x10, #0x10                  	// #16
    a09c:	910008c6 	add	x6, x6, #0x2
    a0a0:	2a0a03e3 	mov	w3, w10
    a0a4:	17ffffbe 	b	9f9c <_strtol_l.part.0+0x6c>
    a0a8:	aa0003eb 	mov	x11, x0
    a0ac:	17ffffec 	b	a05c <_strtol_l.part.0+0x12c>
    a0b0:	d280010a 	mov	x10, #0x8                   	// #8
    a0b4:	2a0a03e3 	mov	w3, w10
    a0b8:	17ffffb9 	b	9f9c <_strtol_l.part.0+0x6c>
    a0bc:	d503201f 	nop

000000000000a0c0 <_strtol_r>:
    a0c0:	7100907f 	cmp	w3, #0x24
    a0c4:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    a0c8:	54000040 	b.eq	a0d0 <_strtol_r+0x10>  // b.none
    a0cc:	17ffff99 	b	9f30 <_strtol_l.part.0>
    a0d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a0d4:	910003fd 	mov	x29, sp
    a0d8:	9400020a 	bl	a900 <__errno>
    a0dc:	528002c1 	mov	w1, #0x16                  	// #22
    a0e0:	b9000001 	str	w1, [x0]
    a0e4:	d2800000 	mov	x0, #0x0                   	// #0
    a0e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a0ec:	d65f03c0 	ret

000000000000a0f0 <strtol_l>:
    a0f0:	7100905f 	cmp	w2, #0x24
    a0f4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    a0f8:	540000e0 	b.eq	a114 <strtol_l+0x24>  // b.none
    a0fc:	d0000004 	adrp	x4, c000 <IpcSemaphoreServer+0x558>
    a100:	2a0203e3 	mov	w3, w2
    a104:	aa0103e2 	mov	x2, x1
    a108:	aa0003e1 	mov	x1, x0
    a10c:	f9415880 	ldr	x0, [x4, #688]
    a110:	17ffff88 	b	9f30 <_strtol_l.part.0>
    a114:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a118:	910003fd 	mov	x29, sp
    a11c:	940001f9 	bl	a900 <__errno>
    a120:	528002c1 	mov	w1, #0x16                  	// #22
    a124:	b9000001 	str	w1, [x0]
    a128:	d2800000 	mov	x0, #0x0                   	// #0
    a12c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a130:	d65f03c0 	ret
    a134:	d503201f 	nop
    a138:	d503201f 	nop
    a13c:	d503201f 	nop

000000000000a140 <strtol>:
    a140:	7100905f 	cmp	w2, #0x24
    a144:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    a148:	540000e0 	b.eq	a164 <strtol+0x24>  // b.none
    a14c:	d0000004 	adrp	x4, c000 <IpcSemaphoreServer+0x558>
    a150:	2a0203e3 	mov	w3, w2
    a154:	aa0103e2 	mov	x2, x1
    a158:	aa0003e1 	mov	x1, x0
    a15c:	f9415880 	ldr	x0, [x4, #688]
    a160:	17ffff74 	b	9f30 <_strtol_l.part.0>
    a164:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    a168:	910003fd 	mov	x29, sp
    a16c:	940001e5 	bl	a900 <__errno>
    a170:	528002c1 	mov	w1, #0x16                  	// #22
    a174:	b9000001 	str	w1, [x0]
    a178:	d2800000 	mov	x0, #0x0                   	// #0
    a17c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    a180:	d65f03c0 	ret
    a184:	d503201f 	nop
    a188:	d503201f 	nop
    a18c:	d503201f 	nop

000000000000a190 <__swbuf_r>:
    a190:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a194:	910003fd 	mov	x29, sp
    a198:	a90153f3 	stp	x19, x20, [sp, #16]
    a19c:	2a0103f4 	mov	w20, w1
    a1a0:	aa0203f3 	mov	x19, x2
    a1a4:	a9025bf5 	stp	x21, x22, [sp, #32]
    a1a8:	aa0003f5 	mov	x21, x0
    a1ac:	b4000060 	cbz	x0, a1b8 <__swbuf_r+0x28>
    a1b0:	b9405001 	ldr	w1, [x0, #80]
    a1b4:	340007e1 	cbz	w1, a2b0 <__swbuf_r+0x120>
    a1b8:	79c02260 	ldrsh	w0, [x19, #16]
    a1bc:	b9402a61 	ldr	w1, [x19, #40]
    a1c0:	b9000e61 	str	w1, [x19, #12]
    a1c4:	12003c02 	and	w2, w0, #0xffff
    a1c8:	361803e0 	tbz	w0, #3, a244 <__swbuf_r+0xb4>
    a1cc:	f9400e61 	ldr	x1, [x19, #24]
    a1d0:	b40003a1 	cbz	x1, a244 <__swbuf_r+0xb4>
    a1d4:	12001e96 	and	w22, w20, #0xff
    a1d8:	12001e94 	and	w20, w20, #0xff
    a1dc:	36680482 	tbz	w2, #13, a26c <__swbuf_r+0xdc>
    a1e0:	f9400260 	ldr	x0, [x19]
    a1e4:	b9402262 	ldr	w2, [x19, #32]
    a1e8:	cb010001 	sub	x1, x0, x1
    a1ec:	6b01005f 	cmp	w2, w1
    a1f0:	5400052d 	b.le	a294 <__swbuf_r+0x104>
    a1f4:	11000421 	add	w1, w1, #0x1
    a1f8:	b9400e62 	ldr	w2, [x19, #12]
    a1fc:	91000403 	add	x3, x0, #0x1
    a200:	f9000263 	str	x3, [x19]
    a204:	51000442 	sub	w2, w2, #0x1
    a208:	b9000e62 	str	w2, [x19, #12]
    a20c:	39000016 	strb	w22, [x0]
    a210:	b9402260 	ldr	w0, [x19, #32]
    a214:	6b01001f 	cmp	w0, w1
    a218:	54000500 	b.eq	a2b8 <__swbuf_r+0x128>  // b.none
    a21c:	71002a9f 	cmp	w20, #0xa
    a220:	79402260 	ldrh	w0, [x19, #16]
    a224:	1a9f17e1 	cset	w1, eq  // eq = none
    a228:	6a00003f 	tst	w1, w0
    a22c:	54000461 	b.ne	a2b8 <__swbuf_r+0x128>  // b.any
    a230:	2a1403e0 	mov	w0, w20
    a234:	a94153f3 	ldp	x19, x20, [sp, #16]
    a238:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a23c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a240:	d65f03c0 	ret
    a244:	aa1303e1 	mov	x1, x19
    a248:	aa1503e0 	mov	x0, x21
    a24c:	97ffeef9 	bl	5e30 <__swsetup_r>
    a250:	350003c0 	cbnz	w0, a2c8 <__swbuf_r+0x138>
    a254:	79c02260 	ldrsh	w0, [x19, #16]
    a258:	12001e96 	and	w22, w20, #0xff
    a25c:	12001e94 	and	w20, w20, #0xff
    a260:	12003c02 	and	w2, w0, #0xffff
    a264:	f9400e61 	ldr	x1, [x19, #24]
    a268:	376ffbc2 	tbnz	w2, #13, a1e0 <__swbuf_r+0x50>
    a26c:	b940ae62 	ldr	w2, [x19, #172]
    a270:	32130000 	orr	w0, w0, #0x2000
    a274:	79002260 	strh	w0, [x19, #16]
    a278:	12127840 	and	w0, w2, #0xffffdfff
    a27c:	b900ae60 	str	w0, [x19, #172]
    a280:	f9400260 	ldr	x0, [x19]
    a284:	b9402262 	ldr	w2, [x19, #32]
    a288:	cb010001 	sub	x1, x0, x1
    a28c:	6b01005f 	cmp	w2, w1
    a290:	54fffb2c 	b.gt	a1f4 <__swbuf_r+0x64>
    a294:	aa1303e1 	mov	x1, x19
    a298:	aa1503e0 	mov	x0, x21
    a29c:	97ffeff5 	bl	6270 <_fflush_r>
    a2a0:	35000140 	cbnz	w0, a2c8 <__swbuf_r+0x138>
    a2a4:	52800021 	mov	w1, #0x1                   	// #1
    a2a8:	f9400260 	ldr	x0, [x19]
    a2ac:	17ffffd3 	b	a1f8 <__swbuf_r+0x68>
    a2b0:	97fff0f0 	bl	6670 <__sinit>
    a2b4:	17ffffc1 	b	a1b8 <__swbuf_r+0x28>
    a2b8:	aa1303e1 	mov	x1, x19
    a2bc:	aa1503e0 	mov	x0, x21
    a2c0:	97ffefec 	bl	6270 <_fflush_r>
    a2c4:	34fffb60 	cbz	w0, a230 <__swbuf_r+0xa0>
    a2c8:	12800014 	mov	w20, #0xffffffff            	// #-1
    a2cc:	17ffffd9 	b	a230 <__swbuf_r+0xa0>

000000000000a2d0 <__swbuf>:
    a2d0:	d0000003 	adrp	x3, c000 <IpcSemaphoreServer+0x558>
    a2d4:	aa0103e2 	mov	x2, x1
    a2d8:	2a0003e1 	mov	w1, w0
    a2dc:	f9415860 	ldr	x0, [x3, #688]
    a2e0:	17ffffac 	b	a190 <__swbuf_r>
    a2e4:	d503201f 	nop
    a2e8:	d503201f 	nop
    a2ec:	d503201f 	nop

000000000000a2f0 <_wcsnrtombs_l>:
    a2f0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    a2f4:	f10000bf 	cmp	x5, #0x0
    a2f8:	910003fd 	mov	x29, sp
    a2fc:	a90153f3 	stp	x19, x20, [sp, #16]
    a300:	aa0003f3 	mov	x19, x0
    a304:	91057000 	add	x0, x0, #0x15c
    a308:	a9025bf5 	stp	x21, x22, [sp, #32]
    a30c:	aa0103f4 	mov	x20, x1
    a310:	aa0203f5 	mov	x21, x2
    a314:	a90363f7 	stp	x23, x24, [sp, #48]
    a318:	aa0603f6 	mov	x22, x6
    a31c:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    a320:	a9046bf9 	stp	x25, x26, [sp, #64]
    a324:	a90573fb 	stp	x27, x28, [sp, #80]
    a328:	f940005c 	ldr	x28, [x2]
    a32c:	b4000901 	cbz	x1, a44c <_wcsnrtombs_l+0x15c>
    a330:	aa0403fa 	mov	x26, x4
    a334:	b4000a84 	cbz	x4, a484 <_wcsnrtombs_l+0x194>
    a338:	d1000478 	sub	x24, x3, #0x1
    a33c:	b4000a43 	cbz	x3, a484 <_wcsnrtombs_l+0x194>
    a340:	d280001b 	mov	x27, #0x0                   	// #0
    a344:	f90037f4 	str	x20, [sp, #104]
    a348:	1400000a 	b	a370 <_wcsnrtombs_l+0x80>
    a34c:	b50003d4 	cbnz	x20, a3c4 <_wcsnrtombs_l+0xd4>
    a350:	b8404780 	ldr	w0, [x28], #4
    a354:	34000640 	cbz	w0, a41c <_wcsnrtombs_l+0x12c>
    a358:	eb1a011f 	cmp	x8, x26
    a35c:	54000982 	b.cs	a48c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    a360:	d1000718 	sub	x24, x24, #0x1
    a364:	aa0803fb 	mov	x27, x8
    a368:	b100071f 	cmn	x24, #0x1
    a36c:	540001c0 	b.eq	a3a4 <_wcsnrtombs_l+0xb4>  // b.none
    a370:	b9400382 	ldr	w2, [x28]
    a374:	aa1703e3 	mov	x3, x23
    a378:	f94072c4 	ldr	x4, [x22, #224]
    a37c:	9101c3e1 	add	x1, sp, #0x70
    a380:	aa1303e0 	mov	x0, x19
    a384:	f94002f9 	ldr	x25, [x23]
    a388:	d63f0080 	blr	x4
    a38c:	3100041f 	cmn	w0, #0x1
    a390:	54000620 	b.eq	a454 <_wcsnrtombs_l+0x164>  // b.none
    a394:	8b20c368 	add	x8, x27, w0, sxtw
    a398:	eb1a011f 	cmp	x8, x26
    a39c:	54fffd89 	b.ls	a34c <_wcsnrtombs_l+0x5c>  // b.plast
    a3a0:	f90002f9 	str	x25, [x23]
    a3a4:	aa1b03e0 	mov	x0, x27
    a3a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a3ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a3b0:	a94363f7 	ldp	x23, x24, [sp, #48]
    a3b4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a3b8:	a94573fb 	ldp	x27, x28, [sp, #80]
    a3bc:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a3c0:	d65f03c0 	ret
    a3c4:	7100001f 	cmp	w0, #0x0
    a3c8:	5400020d 	b.le	a408 <_wcsnrtombs_l+0x118>
    a3cc:	f94037e1 	ldr	x1, [sp, #104]
    a3d0:	11000402 	add	w2, w0, #0x1
    a3d4:	d2800027 	mov	x7, #0x1                   	// #1
    a3d8:	d1000421 	sub	x1, x1, #0x1
    a3dc:	d503201f 	nop
    a3e0:	9101c3e3 	add	x3, sp, #0x70
    a3e4:	8b070069 	add	x9, x3, x7
    a3e8:	385ff129 	ldurb	w9, [x9, #-1]
    a3ec:	38276829 	strb	w9, [x1, x7]
    a3f0:	910004e7 	add	x7, x7, #0x1
    a3f4:	eb0200ff 	cmp	x7, x2
    a3f8:	54ffff41 	b.ne	a3e0 <_wcsnrtombs_l+0xf0>  // b.any
    a3fc:	f94037e1 	ldr	x1, [sp, #104]
    a400:	8b204020 	add	x0, x1, w0, uxtw
    a404:	f90037e0 	str	x0, [sp, #104]
    a408:	f94002a0 	ldr	x0, [x21]
    a40c:	91001000 	add	x0, x0, #0x4
    a410:	f90002a0 	str	x0, [x21]
    a414:	b8404780 	ldr	w0, [x28], #4
    a418:	35fffa00 	cbnz	w0, a358 <_wcsnrtombs_l+0x68>
    a41c:	b4000054 	cbz	x20, a424 <_wcsnrtombs_l+0x134>
    a420:	f90002bf 	str	xzr, [x21]
    a424:	b90002ff 	str	wzr, [x23]
    a428:	d100051b 	sub	x27, x8, #0x1
    a42c:	aa1b03e0 	mov	x0, x27
    a430:	a94153f3 	ldp	x19, x20, [sp, #16]
    a434:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a438:	a94363f7 	ldp	x23, x24, [sp, #48]
    a43c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a440:	a94573fb 	ldp	x27, x28, [sp, #80]
    a444:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a448:	d65f03c0 	ret
    a44c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    a450:	17ffffba 	b	a338 <_wcsnrtombs_l+0x48>
    a454:	52801140 	mov	w0, #0x8a                  	// #138
    a458:	b9000260 	str	w0, [x19]
    a45c:	b90002ff 	str	wzr, [x23]
    a460:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    a464:	aa1b03e0 	mov	x0, x27
    a468:	a94153f3 	ldp	x19, x20, [sp, #16]
    a46c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a470:	a94363f7 	ldp	x23, x24, [sp, #48]
    a474:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a478:	a94573fb 	ldp	x27, x28, [sp, #80]
    a47c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    a480:	d65f03c0 	ret
    a484:	d280001b 	mov	x27, #0x0                   	// #0
    a488:	17ffffc7 	b	a3a4 <_wcsnrtombs_l+0xb4>
    a48c:	aa0803fb 	mov	x27, x8
    a490:	17ffffc5 	b	a3a4 <_wcsnrtombs_l+0xb4>
    a494:	d503201f 	nop
    a498:	d503201f 	nop
    a49c:	d503201f 	nop

000000000000a4a0 <_wcsnrtombs_r>:
    a4a0:	d0000000 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    a4a4:	f0000006 	adrp	x6, d000 <__malloc_av_+0x600>
    a4a8:	910900c6 	add	x6, x6, #0x240
    a4ac:	f9415800 	ldr	x0, [x0, #688]
    a4b0:	17ffff90 	b	a2f0 <_wcsnrtombs_l>
    a4b4:	d503201f 	nop
    a4b8:	d503201f 	nop
    a4bc:	d503201f 	nop

000000000000a4c0 <wcsnrtombs>:
    a4c0:	d0000006 	adrp	x6, c000 <IpcSemaphoreServer+0x558>
    a4c4:	aa0003e8 	mov	x8, x0
    a4c8:	aa0103e7 	mov	x7, x1
    a4cc:	aa0203e5 	mov	x5, x2
    a4d0:	f94158c0 	ldr	x0, [x6, #688]
    a4d4:	aa0303e6 	mov	x6, x3
    a4d8:	aa0803e1 	mov	x1, x8
    a4dc:	aa0503e3 	mov	x3, x5
    a4e0:	aa0703e2 	mov	x2, x7
    a4e4:	aa0403e5 	mov	x5, x4
    a4e8:	aa0603e4 	mov	x4, x6
    a4ec:	f0000006 	adrp	x6, d000 <__malloc_av_+0x600>
    a4f0:	910900c6 	add	x6, x6, #0x240
    a4f4:	17ffff7f 	b	a2f0 <_wcsnrtombs_l>
    a4f8:	d503201f 	nop
    a4fc:	d503201f 	nop

000000000000a500 <_wctomb_r>:
    a500:	f0000004 	adrp	x4, d000 <__malloc_av_+0x600>
    a504:	f9419084 	ldr	x4, [x4, #800]
    a508:	aa0403f0 	mov	x16, x4
    a50c:	d61f0200 	br	x16

000000000000a510 <__ascii_wctomb>:
    a510:	aa0003e3 	mov	x3, x0
    a514:	b4000141 	cbz	x1, a53c <__ascii_wctomb+0x2c>
    a518:	7103fc5f 	cmp	w2, #0xff
    a51c:	54000088 	b.hi	a52c <__ascii_wctomb+0x1c>  // b.pmore
    a520:	52800020 	mov	w0, #0x1                   	// #1
    a524:	39000022 	strb	w2, [x1]
    a528:	d65f03c0 	ret
    a52c:	52801141 	mov	w1, #0x8a                  	// #138
    a530:	12800000 	mov	w0, #0xffffffff            	// #-1
    a534:	b9000061 	str	w1, [x3]
    a538:	d65f03c0 	ret
    a53c:	52800000 	mov	w0, #0x0                   	// #0
    a540:	d65f03c0 	ret
    a544:	d503201f 	nop
    a548:	d503201f 	nop
    a54c:	d503201f 	nop

000000000000a550 <__utf8_wctomb>:
    a550:	aa0003e3 	mov	x3, x0
    a554:	b40004e1 	cbz	x1, a5f0 <__utf8_wctomb+0xa0>
    a558:	7101fc5f 	cmp	w2, #0x7f
    a55c:	54000349 	b.ls	a5c4 <__utf8_wctomb+0x74>  // b.plast
    a560:	51020040 	sub	w0, w2, #0x80
    a564:	711dfc1f 	cmp	w0, #0x77f
    a568:	54000349 	b.ls	a5d0 <__utf8_wctomb+0x80>  // b.plast
    a56c:	51200044 	sub	w4, w2, #0x800
    a570:	529effe0 	mov	w0, #0xf7ff                	// #63487
    a574:	6b00009f 	cmp	w4, w0
    a578:	54000409 	b.ls	a5f8 <__utf8_wctomb+0xa8>  // b.plast
    a57c:	51404044 	sub	w4, w2, #0x10, lsl #12
    a580:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    a584:	6b00009f 	cmp	w4, w0
    a588:	540004e8 	b.hi	a624 <__utf8_wctomb+0xd4>  // b.pmore
    a58c:	53127c45 	lsr	w5, w2, #18
    a590:	d34c4444 	ubfx	x4, x2, #12, #6
    a594:	d3462c43 	ubfx	x3, x2, #6, #6
    a598:	12001442 	and	w2, w2, #0x3f
    a59c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    a5a0:	32196084 	orr	w4, w4, #0xffffff80
    a5a4:	32196063 	orr	w3, w3, #0xffffff80
    a5a8:	32196042 	orr	w2, w2, #0xffffff80
    a5ac:	52800080 	mov	w0, #0x4                   	// #4
    a5b0:	39000025 	strb	w5, [x1]
    a5b4:	39000424 	strb	w4, [x1, #1]
    a5b8:	39000823 	strb	w3, [x1, #2]
    a5bc:	39000c22 	strb	w2, [x1, #3]
    a5c0:	d65f03c0 	ret
    a5c4:	52800020 	mov	w0, #0x1                   	// #1
    a5c8:	39000022 	strb	w2, [x1]
    a5cc:	d65f03c0 	ret
    a5d0:	53067c43 	lsr	w3, w2, #6
    a5d4:	12001442 	and	w2, w2, #0x3f
    a5d8:	321a6463 	orr	w3, w3, #0xffffffc0
    a5dc:	32196042 	orr	w2, w2, #0xffffff80
    a5e0:	52800040 	mov	w0, #0x2                   	// #2
    a5e4:	39000023 	strb	w3, [x1]
    a5e8:	39000422 	strb	w2, [x1, #1]
    a5ec:	d65f03c0 	ret
    a5f0:	52800000 	mov	w0, #0x0                   	// #0
    a5f4:	d65f03c0 	ret
    a5f8:	530c7c44 	lsr	w4, w2, #12
    a5fc:	d3462c43 	ubfx	x3, x2, #6, #6
    a600:	12001442 	and	w2, w2, #0x3f
    a604:	321b6884 	orr	w4, w4, #0xffffffe0
    a608:	32196063 	orr	w3, w3, #0xffffff80
    a60c:	32196042 	orr	w2, w2, #0xffffff80
    a610:	52800060 	mov	w0, #0x3                   	// #3
    a614:	39000024 	strb	w4, [x1]
    a618:	39000423 	strb	w3, [x1, #1]
    a61c:	39000822 	strb	w2, [x1, #2]
    a620:	d65f03c0 	ret
    a624:	52801141 	mov	w1, #0x8a                  	// #138
    a628:	12800000 	mov	w0, #0xffffffff            	// #-1
    a62c:	b9000061 	str	w1, [x3]
    a630:	d65f03c0 	ret
    a634:	d503201f 	nop
    a638:	d503201f 	nop
    a63c:	d503201f 	nop

000000000000a640 <__sjis_wctomb>:
    a640:	aa0003e5 	mov	x5, x0
    a644:	12001c44 	and	w4, w2, #0xff
    a648:	d3483c43 	ubfx	x3, x2, #8, #8
    a64c:	b4000301 	cbz	x1, a6ac <__sjis_wctomb+0x6c>
    a650:	34000283 	cbz	w3, a6a0 <__sjis_wctomb+0x60>
    a654:	1101fc60 	add	w0, w3, #0x7f
    a658:	11008063 	add	w3, w3, #0x20
    a65c:	12001c00 	and	w0, w0, #0xff
    a660:	12001c63 	and	w3, w3, #0xff
    a664:	7100781f 	cmp	w0, #0x1e
    a668:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    a66c:	54000248 	b.hi	a6b4 <__sjis_wctomb+0x74>  // b.pmore
    a670:	51010080 	sub	w0, w4, #0x40
    a674:	51020084 	sub	w4, w4, #0x80
    a678:	12001c00 	and	w0, w0, #0xff
    a67c:	12001c84 	and	w4, w4, #0xff
    a680:	7100f81f 	cmp	w0, #0x3e
    a684:	52800f80 	mov	w0, #0x7c                  	// #124
    a688:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    a68c:	54000148 	b.hi	a6b4 <__sjis_wctomb+0x74>  // b.pmore
    a690:	5ac00442 	rev16	w2, w2
    a694:	52800040 	mov	w0, #0x2                   	// #2
    a698:	79000022 	strh	w2, [x1]
    a69c:	d65f03c0 	ret
    a6a0:	52800020 	mov	w0, #0x1                   	// #1
    a6a4:	39000024 	strb	w4, [x1]
    a6a8:	d65f03c0 	ret
    a6ac:	52800000 	mov	w0, #0x0                   	// #0
    a6b0:	d65f03c0 	ret
    a6b4:	52801141 	mov	w1, #0x8a                  	// #138
    a6b8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a6bc:	b90000a1 	str	w1, [x5]
    a6c0:	d65f03c0 	ret
    a6c4:	d503201f 	nop
    a6c8:	d503201f 	nop
    a6cc:	d503201f 	nop

000000000000a6d0 <__eucjp_wctomb>:
    a6d0:	aa0003e4 	mov	x4, x0
    a6d4:	12001c43 	and	w3, w2, #0xff
    a6d8:	d3483c45 	ubfx	x5, x2, #8, #8
    a6dc:	b4000421 	cbz	x1, a760 <__eucjp_wctomb+0x90>
    a6e0:	34000185 	cbz	w5, a710 <__eucjp_wctomb+0x40>
    a6e4:	11017ca0 	add	w0, w5, #0x5f
    a6e8:	1101c8a6 	add	w6, w5, #0x72
    a6ec:	12001c00 	and	w0, w0, #0xff
    a6f0:	12001cc6 	and	w6, w6, #0xff
    a6f4:	7101741f 	cmp	w0, #0x5d
    a6f8:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    a6fc:	54000109 	b.ls	a71c <__eucjp_wctomb+0x4c>  // b.plast
    a700:	52801141 	mov	w1, #0x8a                  	// #138
    a704:	12800000 	mov	w0, #0xffffffff            	// #-1
    a708:	b9000081 	str	w1, [x4]
    a70c:	d65f03c0 	ret
    a710:	52800020 	mov	w0, #0x1                   	// #1
    a714:	39000023 	strb	w3, [x1]
    a718:	d65f03c0 	ret
    a71c:	11017c66 	add	w6, w3, #0x5f
    a720:	12001cc6 	and	w6, w6, #0xff
    a724:	710174df 	cmp	w6, #0x5d
    a728:	54000209 	b.ls	a768 <__eucjp_wctomb+0x98>  // b.plast
    a72c:	7101741f 	cmp	w0, #0x5d
    a730:	54fffe88 	b.hi	a700 <__eucjp_wctomb+0x30>  // b.pmore
    a734:	32190063 	orr	w3, w3, #0x80
    a738:	11017c60 	add	w0, w3, #0x5f
    a73c:	12001c00 	and	w0, w0, #0xff
    a740:	7101741f 	cmp	w0, #0x5d
    a744:	54fffde8 	b.hi	a700 <__eucjp_wctomb+0x30>  // b.pmore
    a748:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    a74c:	52800060 	mov	w0, #0x3                   	// #3
    a750:	39000022 	strb	w2, [x1]
    a754:	39000425 	strb	w5, [x1, #1]
    a758:	39000823 	strb	w3, [x1, #2]
    a75c:	d65f03c0 	ret
    a760:	52800000 	mov	w0, #0x0                   	// #0
    a764:	d65f03c0 	ret
    a768:	5ac00442 	rev16	w2, w2
    a76c:	52800040 	mov	w0, #0x2                   	// #2
    a770:	79000022 	strh	w2, [x1]
    a774:	d65f03c0 	ret
    a778:	d503201f 	nop
    a77c:	d503201f 	nop

000000000000a780 <__jis_wctomb>:
    a780:	aa0003e6 	mov	x6, x0
    a784:	12001c45 	and	w5, w2, #0xff
    a788:	d3483c44 	ubfx	x4, x2, #8, #8
    a78c:	b40004c1 	cbz	x1, a824 <__jis_wctomb+0xa4>
    a790:	34000304 	cbz	w4, a7f0 <__jis_wctomb+0x70>
    a794:	51008484 	sub	w4, w4, #0x21
    a798:	12001c84 	and	w4, w4, #0xff
    a79c:	7101749f 	cmp	w4, #0x5d
    a7a0:	54000468 	b.hi	a82c <__jis_wctomb+0xac>  // b.pmore
    a7a4:	510084a5 	sub	w5, w5, #0x21
    a7a8:	12001ca5 	and	w5, w5, #0xff
    a7ac:	710174bf 	cmp	w5, #0x5d
    a7b0:	540003e8 	b.hi	a82c <__jis_wctomb+0xac>  // b.pmore
    a7b4:	b9400064 	ldr	w4, [x3]
    a7b8:	52800040 	mov	w0, #0x2                   	// #2
    a7bc:	35000144 	cbnz	w4, a7e4 <__jis_wctomb+0x64>
    a7c0:	aa0103e4 	mov	x4, x1
    a7c4:	52800020 	mov	w0, #0x1                   	// #1
    a7c8:	b9000060 	str	w0, [x3]
    a7cc:	52848365 	mov	w5, #0x241b                	// #9243
    a7d0:	52800843 	mov	w3, #0x42                  	// #66
    a7d4:	528000a0 	mov	w0, #0x5                   	// #5
    a7d8:	78003485 	strh	w5, [x4], #3
    a7dc:	39000823 	strb	w3, [x1, #2]
    a7e0:	aa0403e1 	mov	x1, x4
    a7e4:	5ac00442 	rev16	w2, w2
    a7e8:	79000022 	strh	w2, [x1]
    a7ec:	d65f03c0 	ret
    a7f0:	b9400062 	ldr	w2, [x3]
    a7f4:	52800020 	mov	w0, #0x1                   	// #1
    a7f8:	34000122 	cbz	w2, a81c <__jis_wctomb+0x9c>
    a7fc:	aa0103e2 	mov	x2, x1
    a800:	b900007f 	str	wzr, [x3]
    a804:	52850364 	mov	w4, #0x281b                	// #10267
    a808:	52800843 	mov	w3, #0x42                  	// #66
    a80c:	52800080 	mov	w0, #0x4                   	// #4
    a810:	78003444 	strh	w4, [x2], #3
    a814:	39000823 	strb	w3, [x1, #2]
    a818:	aa0203e1 	mov	x1, x2
    a81c:	39000025 	strb	w5, [x1]
    a820:	d65f03c0 	ret
    a824:	52800020 	mov	w0, #0x1                   	// #1
    a828:	d65f03c0 	ret
    a82c:	52801141 	mov	w1, #0x8a                  	// #138
    a830:	12800000 	mov	w0, #0xffffffff            	// #-1
    a834:	b90000c1 	str	w1, [x6]
    a838:	d65f03c0 	ret
    a83c:	d503201f 	nop

000000000000a840 <_write_r>:
    a840:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a844:	910003fd 	mov	x29, sp
    a848:	a90153f3 	stp	x19, x20, [sp, #16]
    a84c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    a850:	aa0003f3 	mov	x19, x0
    a854:	2a0103e0 	mov	w0, w1
    a858:	aa0203e1 	mov	x1, x2
    a85c:	b9083a9f 	str	wzr, [x20, #2104]
    a860:	aa0303e2 	mov	x2, x3
    a864:	97ffe1bf 	bl	2f60 <_write>
    a868:	93407c01 	sxtw	x1, w0
    a86c:	3100041f 	cmn	w0, #0x1
    a870:	540000a0 	b.eq	a884 <_write_r+0x44>  // b.none
    a874:	aa0103e0 	mov	x0, x1
    a878:	a94153f3 	ldp	x19, x20, [sp, #16]
    a87c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a880:	d65f03c0 	ret
    a884:	b9483a80 	ldr	w0, [x20, #2104]
    a888:	34ffff60 	cbz	w0, a874 <_write_r+0x34>
    a88c:	b9000260 	str	w0, [x19]
    a890:	aa0103e0 	mov	x0, x1
    a894:	a94153f3 	ldp	x19, x20, [sp, #16]
    a898:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a89c:	d65f03c0 	ret

000000000000a8a0 <_close_r>:
    a8a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a8a4:	910003fd 	mov	x29, sp
    a8a8:	a90153f3 	stp	x19, x20, [sp, #16]
    a8ac:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    a8b0:	aa0003f3 	mov	x19, x0
    a8b4:	b9083a9f 	str	wzr, [x20, #2104]
    a8b8:	2a0103e0 	mov	w0, w1
    a8bc:	97ffe1ad 	bl	2f70 <_close>
    a8c0:	3100041f 	cmn	w0, #0x1
    a8c4:	54000080 	b.eq	a8d4 <_close_r+0x34>  // b.none
    a8c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a8d0:	d65f03c0 	ret
    a8d4:	b9483a81 	ldr	w1, [x20, #2104]
    a8d8:	34ffff81 	cbz	w1, a8c8 <_close_r+0x28>
    a8dc:	b9000261 	str	w1, [x19]
    a8e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8e4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a8e8:	d65f03c0 	ret
    a8ec:	d503201f 	nop

000000000000a8f0 <__set_ctype>:
    a8f0:	b0000001 	adrp	x1, b000 <_fini+0xcc>
    a8f4:	9125c021 	add	x1, x1, #0x970
    a8f8:	f9007c01 	str	x1, [x0, #248]
    a8fc:	d65f03c0 	ret

000000000000a900 <__errno>:
    a900:	d0000000 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    a904:	f9415800 	ldr	x0, [x0, #688]
    a908:	d65f03c0 	ret
    a90c:	d503201f 	nop

000000000000a910 <_fclose_r.part.0>:
    a910:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a914:	910003fd 	mov	x29, sp
    a918:	a90153f3 	stp	x19, x20, [sp, #16]
    a91c:	aa0103f3 	mov	x19, x1
    a920:	f90013f5 	str	x21, [sp, #32]
    a924:	aa0003f5 	mov	x21, x0
    a928:	97ffedc6 	bl	6040 <__sflush_r>
    a92c:	2a0003f4 	mov	w20, w0
    a930:	f9402a62 	ldr	x2, [x19, #80]
    a934:	b40000c2 	cbz	x2, a94c <_fclose_r.part.0+0x3c>
    a938:	f9401a61 	ldr	x1, [x19, #48]
    a93c:	aa1503e0 	mov	x0, x21
    a940:	d63f0040 	blr	x2
    a944:	7100001f 	cmp	w0, #0x0
    a948:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    a94c:	79402260 	ldrh	w0, [x19, #16]
    a950:	373802c0 	tbnz	w0, #7, a9a8 <_fclose_r.part.0+0x98>
    a954:	f9402e61 	ldr	x1, [x19, #88]
    a958:	b40000e1 	cbz	x1, a974 <_fclose_r.part.0+0x64>
    a95c:	9101d260 	add	x0, x19, #0x74
    a960:	eb00003f 	cmp	x1, x0
    a964:	54000060 	b.eq	a970 <_fclose_r.part.0+0x60>  // b.none
    a968:	aa1503e0 	mov	x0, x21
    a96c:	97fff019 	bl	69d0 <_free_r>
    a970:	f9002e7f 	str	xzr, [x19, #88]
    a974:	f9403e61 	ldr	x1, [x19, #120]
    a978:	b4000081 	cbz	x1, a988 <_fclose_r.part.0+0x78>
    a97c:	aa1503e0 	mov	x0, x21
    a980:	97fff014 	bl	69d0 <_free_r>
    a984:	f9003e7f 	str	xzr, [x19, #120]
    a988:	97ffef3e 	bl	6680 <__sfp_lock_acquire>
    a98c:	7900227f 	strh	wzr, [x19, #16]
    a990:	97ffef40 	bl	6690 <__sfp_lock_release>
    a994:	2a1403e0 	mov	w0, w20
    a998:	a94153f3 	ldp	x19, x20, [sp, #16]
    a99c:	f94013f5 	ldr	x21, [sp, #32]
    a9a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a9a4:	d65f03c0 	ret
    a9a8:	f9400e61 	ldr	x1, [x19, #24]
    a9ac:	aa1503e0 	mov	x0, x21
    a9b0:	97fff008 	bl	69d0 <_free_r>
    a9b4:	17ffffe8 	b	a954 <_fclose_r.part.0+0x44>
    a9b8:	d503201f 	nop
    a9bc:	d503201f 	nop

000000000000a9c0 <_fclose_r>:
    a9c0:	b4000301 	cbz	x1, aa20 <_fclose_r+0x60>
    a9c4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a9c8:	910003fd 	mov	x29, sp
    a9cc:	f9000bf4 	str	x20, [sp, #16]
    a9d0:	aa0003f4 	mov	x20, x0
    a9d4:	b4000060 	cbz	x0, a9e0 <_fclose_r+0x20>
    a9d8:	b9405002 	ldr	w2, [x0, #80]
    a9dc:	34000162 	cbz	w2, aa08 <_fclose_r+0x48>
    a9e0:	79c02020 	ldrsh	w0, [x1, #16]
    a9e4:	350000a0 	cbnz	w0, a9f8 <_fclose_r+0x38>
    a9e8:	52800000 	mov	w0, #0x0                   	// #0
    a9ec:	f9400bf4 	ldr	x20, [sp, #16]
    a9f0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a9f4:	d65f03c0 	ret
    a9f8:	aa1403e0 	mov	x0, x20
    a9fc:	f9400bf4 	ldr	x20, [sp, #16]
    aa00:	a8c37bfd 	ldp	x29, x30, [sp], #48
    aa04:	17ffffc3 	b	a910 <_fclose_r.part.0>
    aa08:	f90017e1 	str	x1, [sp, #40]
    aa0c:	97ffef19 	bl	6670 <__sinit>
    aa10:	f94017e1 	ldr	x1, [sp, #40]
    aa14:	79c02020 	ldrsh	w0, [x1, #16]
    aa18:	34fffe80 	cbz	w0, a9e8 <_fclose_r+0x28>
    aa1c:	17fffff7 	b	a9f8 <_fclose_r+0x38>
    aa20:	52800000 	mov	w0, #0x0                   	// #0
    aa24:	d65f03c0 	ret
    aa28:	d503201f 	nop
    aa2c:	d503201f 	nop

000000000000aa30 <fclose>:
    aa30:	b4000340 	cbz	x0, aa98 <fclose+0x68>
    aa34:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aa38:	910003fd 	mov	x29, sp
    aa3c:	a90153f3 	stp	x19, x20, [sp, #16]
    aa40:	aa0003f3 	mov	x19, x0
    aa44:	d0000000 	adrp	x0, c000 <IpcSemaphoreServer+0x558>
    aa48:	f9415814 	ldr	x20, [x0, #688]
    aa4c:	b4000074 	cbz	x20, aa58 <fclose+0x28>
    aa50:	b9405280 	ldr	w0, [x20, #80]
    aa54:	34000180 	cbz	w0, aa84 <fclose+0x54>
    aa58:	79c02260 	ldrsh	w0, [x19, #16]
    aa5c:	350000a0 	cbnz	w0, aa70 <fclose+0x40>
    aa60:	52800000 	mov	w0, #0x0                   	// #0
    aa64:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa68:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa6c:	d65f03c0 	ret
    aa70:	aa1303e1 	mov	x1, x19
    aa74:	aa1403e0 	mov	x0, x20
    aa78:	a94153f3 	ldp	x19, x20, [sp, #16]
    aa7c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aa80:	17ffffa4 	b	a910 <_fclose_r.part.0>
    aa84:	aa1403e0 	mov	x0, x20
    aa88:	97ffeefa 	bl	6670 <__sinit>
    aa8c:	79c02260 	ldrsh	w0, [x19, #16]
    aa90:	34fffe80 	cbz	w0, aa60 <fclose+0x30>
    aa94:	17fffff7 	b	aa70 <fclose+0x40>
    aa98:	52800000 	mov	w0, #0x0                   	// #0
    aa9c:	d65f03c0 	ret

000000000000aaa0 <_fstat_r>:
    aaa0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    aaa4:	910003fd 	mov	x29, sp
    aaa8:	a90153f3 	stp	x19, x20, [sp, #16]
    aaac:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    aab0:	aa0003f3 	mov	x19, x0
    aab4:	b9083a9f 	str	wzr, [x20, #2104]
    aab8:	2a0103e0 	mov	w0, w1
    aabc:	aa0203e1 	mov	x1, x2
    aac0:	97ffe130 	bl	2f80 <_fstat>
    aac4:	3100041f 	cmn	w0, #0x1
    aac8:	54000080 	b.eq	aad8 <_fstat_r+0x38>  // b.none
    aacc:	a94153f3 	ldp	x19, x20, [sp, #16]
    aad0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aad4:	d65f03c0 	ret
    aad8:	b9483a81 	ldr	w1, [x20, #2104]
    aadc:	34ffff81 	cbz	w1, aacc <_fstat_r+0x2c>
    aae0:	b9000261 	str	w1, [x19]
    aae4:	a94153f3 	ldp	x19, x20, [sp, #16]
    aae8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    aaec:	d65f03c0 	ret

000000000000aaf0 <_findenv_r>:
    aaf0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    aaf4:	910003fd 	mov	x29, sp
    aaf8:	a90363f7 	stp	x23, x24, [sp, #48]
    aafc:	f0000017 	adrp	x23, d000 <__malloc_av_+0x600>
    ab00:	aa0103f8 	mov	x24, x1
    ab04:	a90153f3 	stp	x19, x20, [sp, #16]
    ab08:	a9025bf5 	stp	x21, x22, [sp, #32]
    ab0c:	aa0203f5 	mov	x21, x2
    ab10:	aa0003f6 	mov	x22, x0
    ab14:	94000103 	bl	af20 <__env_lock>
    ab18:	f941f6f4 	ldr	x20, [x23, #1000]
    ab1c:	b40003f4 	cbz	x20, ab98 <_findenv_r+0xa8>
    ab20:	39400303 	ldrb	w3, [x24]
    ab24:	aa1803f3 	mov	x19, x24
    ab28:	7100f47f 	cmp	w3, #0x3d
    ab2c:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    ab30:	540000c0 	b.eq	ab48 <_findenv_r+0x58>  // b.none
    ab34:	d503201f 	nop
    ab38:	38401e63 	ldrb	w3, [x19, #1]!
    ab3c:	7100f47f 	cmp	w3, #0x3d
    ab40:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    ab44:	54ffffa1 	b.ne	ab38 <_findenv_r+0x48>  // b.any
    ab48:	7100f47f 	cmp	w3, #0x3d
    ab4c:	54000260 	b.eq	ab98 <_findenv_r+0xa8>  // b.none
    ab50:	f9400280 	ldr	x0, [x20]
    ab54:	cb180273 	sub	x19, x19, x24
    ab58:	b4000200 	cbz	x0, ab98 <_findenv_r+0xa8>
    ab5c:	93407e73 	sxtw	x19, w19
    ab60:	f90023f9 	str	x25, [sp, #64]
    ab64:	d503201f 	nop
    ab68:	aa1303e2 	mov	x2, x19
    ab6c:	aa1803e1 	mov	x1, x24
    ab70:	9400007b 	bl	ad5c <strncmp>
    ab74:	350000c0 	cbnz	w0, ab8c <_findenv_r+0x9c>
    ab78:	f9400280 	ldr	x0, [x20]
    ab7c:	8b130019 	add	x25, x0, x19
    ab80:	38736800 	ldrb	w0, [x0, x19]
    ab84:	7100f41f 	cmp	w0, #0x3d
    ab88:	54000180 	b.eq	abb8 <_findenv_r+0xc8>  // b.none
    ab8c:	f8408e80 	ldr	x0, [x20, #8]!
    ab90:	b5fffec0 	cbnz	x0, ab68 <_findenv_r+0x78>
    ab94:	f94023f9 	ldr	x25, [sp, #64]
    ab98:	aa1603e0 	mov	x0, x22
    ab9c:	940000e5 	bl	af30 <__env_unlock>
    aba0:	d2800000 	mov	x0, #0x0                   	// #0
    aba4:	a94153f3 	ldp	x19, x20, [sp, #16]
    aba8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    abac:	a94363f7 	ldp	x23, x24, [sp, #48]
    abb0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    abb4:	d65f03c0 	ret
    abb8:	f941f6e1 	ldr	x1, [x23, #1000]
    abbc:	aa1603e0 	mov	x0, x22
    abc0:	cb010281 	sub	x1, x20, x1
    abc4:	9343fc21 	asr	x1, x1, #3
    abc8:	b90002a1 	str	w1, [x21]
    abcc:	940000d9 	bl	af30 <__env_unlock>
    abd0:	91000720 	add	x0, x25, #0x1
    abd4:	a94153f3 	ldp	x19, x20, [sp, #16]
    abd8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    abdc:	a94363f7 	ldp	x23, x24, [sp, #48]
    abe0:	f94023f9 	ldr	x25, [sp, #64]
    abe4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    abe8:	d65f03c0 	ret
    abec:	d503201f 	nop

000000000000abf0 <_getenv_r>:
    abf0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    abf4:	910003fd 	mov	x29, sp
    abf8:	910073e2 	add	x2, sp, #0x1c
    abfc:	97ffffbd 	bl	aaf0 <_findenv_r>
    ac00:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ac04:	d65f03c0 	ret
    ac08:	d503201f 	nop
    ac0c:	d503201f 	nop

000000000000ac10 <_isatty_r>:
    ac10:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ac14:	910003fd 	mov	x29, sp
    ac18:	a90153f3 	stp	x19, x20, [sp, #16]
    ac1c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    ac20:	aa0003f3 	mov	x19, x0
    ac24:	b9083a9f 	str	wzr, [x20, #2104]
    ac28:	2a0103e0 	mov	w0, w1
    ac2c:	97ffe0d9 	bl	2f90 <_isatty>
    ac30:	3100041f 	cmn	w0, #0x1
    ac34:	54000080 	b.eq	ac44 <_isatty_r+0x34>  // b.none
    ac38:	a94153f3 	ldp	x19, x20, [sp, #16]
    ac3c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ac40:	d65f03c0 	ret
    ac44:	b9483a81 	ldr	w1, [x20, #2104]
    ac48:	34ffff81 	cbz	w1, ac38 <_isatty_r+0x28>
    ac4c:	b9000261 	str	w1, [x19]
    ac50:	a94153f3 	ldp	x19, x20, [sp, #16]
    ac54:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ac58:	d65f03c0 	ret
    ac5c:	d503201f 	nop

000000000000ac60 <_lseek_r>:
    ac60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    ac64:	910003fd 	mov	x29, sp
    ac68:	a90153f3 	stp	x19, x20, [sp, #16]
    ac6c:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    ac70:	aa0003f3 	mov	x19, x0
    ac74:	b9083a9f 	str	wzr, [x20, #2104]
    ac78:	2a0103e0 	mov	w0, w1
    ac7c:	aa0203e1 	mov	x1, x2
    ac80:	2a0303e2 	mov	w2, w3
    ac84:	97ffe0c7 	bl	2fa0 <_lseek>
    ac88:	b100041f 	cmn	x0, #0x1
    ac8c:	54000080 	b.eq	ac9c <_lseek_r+0x3c>  // b.none
    ac90:	a94153f3 	ldp	x19, x20, [sp, #16]
    ac94:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ac98:	d65f03c0 	ret
    ac9c:	b9483a81 	ldr	w1, [x20, #2104]
    aca0:	34ffff81 	cbz	w1, ac90 <_lseek_r+0x30>
    aca4:	b9000261 	str	w1, [x19]
    aca8:	a94153f3 	ldp	x19, x20, [sp, #16]
    acac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    acb0:	d65f03c0 	ret
    acb4:	d503201f 	nop
    acb8:	d503201f 	nop
    acbc:	d503201f 	nop

000000000000acc0 <_read_r>:
    acc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    acc4:	910003fd 	mov	x29, sp
    acc8:	a90153f3 	stp	x19, x20, [sp, #16]
    accc:	f0000014 	adrp	x20, d000 <__malloc_av_+0x600>
    acd0:	aa0003f3 	mov	x19, x0
    acd4:	2a0103e0 	mov	w0, w1
    acd8:	aa0203e1 	mov	x1, x2
    acdc:	b9083a9f 	str	wzr, [x20, #2104]
    ace0:	aa0303e2 	mov	x2, x3
    ace4:	97ffe0b3 	bl	2fb0 <_read>
    ace8:	93407c01 	sxtw	x1, w0
    acec:	3100041f 	cmn	w0, #0x1
    acf0:	540000a0 	b.eq	ad04 <_read_r+0x44>  // b.none
    acf4:	aa0103e0 	mov	x0, x1
    acf8:	a94153f3 	ldp	x19, x20, [sp, #16]
    acfc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ad00:	d65f03c0 	ret
    ad04:	b9483a80 	ldr	w0, [x20, #2104]
    ad08:	34ffff60 	cbz	w0, acf4 <_read_r+0x34>
    ad0c:	b9000260 	str	w0, [x19]
    ad10:	aa0103e0 	mov	x0, x1
    ad14:	a94153f3 	ldp	x19, x20, [sp, #16]
    ad18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    ad1c:	d65f03c0 	ret
    ad20:	d503201f 	nop
    ad24:	d503201f 	nop
    ad28:	d503201f 	nop
    ad2c:	d503201f 	nop
    ad30:	d503201f 	nop
    ad34:	d503201f 	nop
    ad38:	d503201f 	nop
    ad3c:	d503201f 	nop
    ad40:	d503201f 	nop
    ad44:	d503201f 	nop
    ad48:	d503201f 	nop
    ad4c:	d503201f 	nop
    ad50:	d503201f 	nop
    ad54:	d503201f 	nop
    ad58:	d503201f 	nop

000000000000ad5c <strncmp>:
    ad5c:	b4000d82 	cbz	x2, af0c <strncmp+0x1b0>
    ad60:	ca010008 	eor	x8, x0, x1
    ad64:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    ad68:	f240091f 	tst	x8, #0x7
    ad6c:	9240080e 	and	x14, x0, #0x7
    ad70:	54000681 	b.ne	ae40 <strncmp+0xe4>  // b.any
    ad74:	b500040e 	cbnz	x14, adf4 <strncmp+0x98>
    ad78:	d100044d 	sub	x13, x2, #0x1
    ad7c:	d343fdad 	lsr	x13, x13, #3
    ad80:	f8408403 	ldr	x3, [x0], #8
    ad84:	f8408424 	ldr	x4, [x1], #8
    ad88:	f10005ad 	subs	x13, x13, #0x1
    ad8c:	cb0b0068 	sub	x8, x3, x11
    ad90:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    ad94:	ca040066 	eor	x6, x3, x4
    ad98:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    ad9c:	ea290105 	bics	x5, x8, x9
    ada0:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    ada4:	54fffee0 	b.eq	ad80 <strncmp+0x24>  // b.none
    ada8:	b6f8012d 	tbz	x13, #63, adcc <strncmp+0x70>
    adac:	f2400842 	ands	x2, x2, #0x7
    adb0:	540000e0 	b.eq	adcc <strncmp+0x70>  // b.none
    adb4:	d37df042 	lsl	x2, x2, #3
    adb8:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    adbc:	9ac221ce 	lsl	x14, x14, x2
    adc0:	8a2e0063 	bic	x3, x3, x14
    adc4:	8a2e0084 	bic	x4, x4, x14
    adc8:	aa0e00a5 	orr	x5, x5, x14
    adcc:	aa0500c7 	orr	x7, x6, x5
    add0:	dac00ce7 	rev	x7, x7
    add4:	dac00c63 	rev	x3, x3
    add8:	dac010ec 	clz	x12, x7
    addc:	dac00c84 	rev	x4, x4
    ade0:	9acc2063 	lsl	x3, x3, x12
    ade4:	9acc2084 	lsl	x4, x4, x12
    ade8:	d378fc63 	lsr	x3, x3, #56
    adec:	cb44e060 	sub	x0, x3, x4, lsr #56
    adf0:	d65f03c0 	ret
    adf4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    adf8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    adfc:	f8408403 	ldr	x3, [x0], #8
    ae00:	cb0e0fea 	neg	x10, x14, lsl #3
    ae04:	f8408424 	ldr	x4, [x1], #8
    ae08:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    ae0c:	d100044d 	sub	x13, x2, #0x1
    ae10:	9aca2529 	lsr	x9, x9, x10
    ae14:	924009aa 	and	x10, x13, #0x7
    ae18:	d343fdad 	lsr	x13, x13, #3
    ae1c:	8b0e0042 	add	x2, x2, x14
    ae20:	8b0e014a 	add	x10, x10, x14
    ae24:	aa090063 	orr	x3, x3, x9
    ae28:	aa090084 	orr	x4, x4, x9
    ae2c:	8b4a0dad 	add	x13, x13, x10, lsr #3
    ae30:	17ffffd6 	b	ad88 <strncmp+0x2c>
    ae34:	d503201f 	nop
    ae38:	d503201f 	nop
    ae3c:	d503201f 	nop
    ae40:	f100405f 	cmp	x2, #0x10
    ae44:	54000122 	b.cs	ae68 <strncmp+0x10c>  // b.hs, b.nlast
    ae48:	38401403 	ldrb	w3, [x0], #1
    ae4c:	38401424 	ldrb	w4, [x1], #1
    ae50:	f1000442 	subs	x2, x2, #0x1
    ae54:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    ae58:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    ae5c:	54ffff60 	b.eq	ae48 <strncmp+0xec>  // b.none
    ae60:	cb040060 	sub	x0, x3, x4
    ae64:	d65f03c0 	ret
    ae68:	d343fc4d 	lsr	x13, x2, #3
    ae6c:	b400018e 	cbz	x14, ae9c <strncmp+0x140>
    ae70:	cb0e03ee 	neg	x14, x14
    ae74:	924009ce 	and	x14, x14, #0x7
    ae78:	cb0e0042 	sub	x2, x2, x14
    ae7c:	d343fc4d 	lsr	x13, x2, #3
    ae80:	38401403 	ldrb	w3, [x0], #1
    ae84:	38401424 	ldrb	w4, [x1], #1
    ae88:	7100047f 	cmp	w3, #0x1
    ae8c:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    ae90:	54fffe81 	b.ne	ae60 <strncmp+0x104>  // b.any
    ae94:	f10005ce 	subs	x14, x14, #0x1
    ae98:	54ffff48 	b.hi	ae80 <strncmp+0x124>  // b.pmore
    ae9c:	d280010e 	mov	x14, #0x8                   	// #8
    aea0:	f10005ad 	subs	x13, x13, #0x1
    aea4:	540001c3 	b.cc	aedc <strncmp+0x180>  // b.lo, b.ul, b.last
    aea8:	927d2029 	and	x9, x1, #0xff8
    aeac:	d27d2129 	eor	x9, x9, #0xff8
    aeb0:	b4fffe89 	cbz	x9, ae80 <strncmp+0x124>
    aeb4:	f8408403 	ldr	x3, [x0], #8
    aeb8:	f8408424 	ldr	x4, [x1], #8
    aebc:	cb0b0068 	sub	x8, x3, x11
    aec0:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    aec4:	ca040066 	eor	x6, x3, x4
    aec8:	ea290105 	bics	x5, x8, x9
    aecc:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    aed0:	54fff7e1 	b.ne	adcc <strncmp+0x70>  // b.any
    aed4:	f10005ad 	subs	x13, x13, #0x1
    aed8:	54fffe85 	b.pl	aea8 <strncmp+0x14c>  // b.nfrst
    aedc:	92400842 	and	x2, x2, #0x7
    aee0:	b4fff762 	cbz	x2, adcc <strncmp+0x70>
    aee4:	d1002000 	sub	x0, x0, #0x8
    aee8:	d1002021 	sub	x1, x1, #0x8
    aeec:	f8626803 	ldr	x3, [x0, x2]
    aef0:	f8626824 	ldr	x4, [x1, x2]
    aef4:	cb0b0068 	sub	x8, x3, x11
    aef8:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    aefc:	ca040066 	eor	x6, x3, x4
    af00:	ea290105 	bics	x5, x8, x9
    af04:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    af08:	54fff621 	b.ne	adcc <strncmp+0x70>  // b.any
    af0c:	d2800000 	mov	x0, #0x0                   	// #0
    af10:	d65f03c0 	ret
    af14:	d503201f 	nop
    af18:	d503201f 	nop
    af1c:	d503201f 	nop

000000000000af20 <__env_lock>:
    af20:	d65f03c0 	ret
    af24:	d503201f 	nop
    af28:	d503201f 	nop
    af2c:	d503201f 	nop

000000000000af30 <__env_unlock>:
    af30:	d65f03c0 	ret

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

000000000000af34 <_fini>:
    af34:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    af38:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    af3c:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    af40:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    af44:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    af48:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    af4c:	a8c153f3 	ldp	x19, x20, [sp], #16
    af50:	a8c15bf5 	ldp	x21, x22, [sp], #16
    af54:	a8c163f7 	ldp	x23, x24, [sp], #16
    af58:	a8c16bf9 	ldp	x25, x26, [sp], #16
    af5c:	a8c173fb 	ldp	x27, x28, [sp], #16
    af60:	a8c17bfd 	ldp	x29, x30, [sp], #16
    af64:	d65f03c0 	ret
