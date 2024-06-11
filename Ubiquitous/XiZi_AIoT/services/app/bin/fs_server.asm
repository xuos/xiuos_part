
fs_server:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
    Ipc_read,
    Ipc_write,
    Ipc_fsize);

int main(int argc, char* argv[])
{
       0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    printf("MemFS Start\n");
       4:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
       8:	91342000 	add	x0, x0, #0xd08
{
       c:	910003fd 	mov	x29, sp
      10:	f9000bf3 	str	x19, [sp, #16]
    printf("MemFS Start\n");
      14:	94001083 	bl	4220 <printf>
    sys_state_info info;
    get_memblock_info(&info);
      18:	910083e0 	add	x0, sp, #0x20
      1c:	94001405 	bl	5030 <get_memblock_info>

    int len = info.memblock_info.memblock_end - info.memblock_info.memblock_start;
      20:	a9424fe1 	ldp	x1, x19, [sp, #32]
    mmap(FS_IMG_ADDR, info.memblock_info.memblock_start, len, false);
      24:	52800003 	mov	w3, #0x0                   	// #0
      28:	d2ac0000 	mov	x0, #0x60000000            	// #1610612736
    int len = info.memblock_info.memblock_end - info.memblock_info.memblock_start;
      2c:	4b010273 	sub	w19, w19, w1
    mmap(FS_IMG_ADDR, info.memblock_info.memblock_start, len, false);
      30:	2a1303e2 	mov	w2, w19
      34:	9400142f 	bl	50f0 <mmap>

    MemFsInit((uintptr_t)FS_IMG_ADDR, (uint32_t)len);
      38:	2a1303e1 	mov	w1, w19
      3c:	d2ac0000 	mov	x0, #0x60000000            	// #1610612736
      40:	94000718 	bl	1ca0 <MemFsInit>

    if (register_server("MemFS") < 0) {
      44:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
      48:	91346000 	add	x0, x0, #0xd18
      4c:	940013d9 	bl	4fb0 <register_server>
      50:	37f80140 	tbnz	w0, #31, 78 <main+0x78>
        printf("register server name: %s failed.\n", "MemFs");
        exit(1);
    }
    ipc_server_loop(&IpcFsServer);
      54:	d0000060 	adrp	x0, e000 <__func__.0+0x280>
      58:	9128a000 	add	x0, x0, #0xa28
      5c:	94001221 	bl	48e0 <ipc_server_loop>

    // never reached
    exit(0);
      60:	52800000 	mov	w0, #0x0                   	// #0
      64:	940013bb 	bl	4f50 <exit>
    return 0;
}
      68:	52800000 	mov	w0, #0x0                   	// #0
      6c:	f9400bf3 	ldr	x19, [sp, #16]
      70:	a8c37bfd 	ldp	x29, x30, [sp], #48
      74:	d65f03c0 	ret
        printf("register server name: %s failed.\n", "MemFs");
      78:	b0000061 	adrp	x1, d000 <__ascii_wctomb+0x30>
      7c:	91348021 	add	x1, x1, #0xd20
      80:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
      84:	9134a000 	add	x0, x0, #0xd28
      88:	94001066 	bl	4220 <printf>
        exit(1);
      8c:	52800020 	mov	w0, #0x1                   	// #1
      90:	940013b0 	bl	4f50 <exit>
      94:	17fffff0 	b	54 <main+0x54>
      98:	d503201f 	nop
      9c:	d503201f 	nop

00000000000000a0 <deregister_tm_clones>:
      a0:	90000080 	adrp	x0, 10000 <__malloc_av_+0x4b8>
      a4:	910dc000 	add	x0, x0, #0x370
      a8:	90000081 	adrp	x1, 10000 <__malloc_av_+0x4b8>
      ac:	910dc021 	add	x1, x1, #0x370
      b0:	eb00003f 	cmp	x1, x0
      b4:	540000c0 	b.eq	cc <deregister_tm_clones+0x2c>  // b.none
      b8:	b0000061 	adrp	x1, d000 <__ascii_wctomb+0x30>
      bc:	f944dc21 	ldr	x1, [x1, #2488]
      c0:	b4000061 	cbz	x1, cc <deregister_tm_clones+0x2c>
      c4:	aa0103f0 	mov	x16, x1
      c8:	d61f0200 	br	x16
      cc:	d65f03c0 	ret

00000000000000d0 <register_tm_clones>:
      d0:	90000080 	adrp	x0, 10000 <__malloc_av_+0x4b8>
      d4:	910dc000 	add	x0, x0, #0x370
      d8:	90000081 	adrp	x1, 10000 <__malloc_av_+0x4b8>
      dc:	910dc021 	add	x1, x1, #0x370
      e0:	cb000021 	sub	x1, x1, x0
      e4:	d37ffc22 	lsr	x2, x1, #63
      e8:	8b810c41 	add	x1, x2, x1, asr #3
      ec:	9341fc21 	asr	x1, x1, #1
      f0:	b40000c1 	cbz	x1, 108 <register_tm_clones+0x38>
      f4:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
      f8:	f944e042 	ldr	x2, [x2, #2496]
      fc:	b4000062 	cbz	x2, 108 <register_tm_clones+0x38>
     100:	aa0203f0 	mov	x16, x2
     104:	d61f0200 	br	x16
     108:	d65f03c0 	ret
     10c:	d503201f 	nop

0000000000000110 <__do_global_dtors_aux>:
     110:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     114:	910003fd 	mov	x29, sp
     118:	f9000bf3 	str	x19, [sp, #16]
     11c:	90000093 	adrp	x19, 10000 <__malloc_av_+0x4b8>
     120:	394dc260 	ldrb	w0, [x19, #880]
     124:	35000140 	cbnz	w0, 14c <__do_global_dtors_aux+0x3c>
     128:	97ffffde 	bl	a0 <deregister_tm_clones>
     12c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     130:	f944e400 	ldr	x0, [x0, #2504]
     134:	b4000080 	cbz	x0, 144 <__do_global_dtors_aux+0x34>
     138:	d0000060 	adrp	x0, e000 <__func__.0+0x280>
     13c:	91283000 	add	x0, x0, #0xa0c
     140:	d503201f 	nop
     144:	52800020 	mov	w0, #0x1                   	// #1
     148:	390dc260 	strb	w0, [x19, #880]
     14c:	f9400bf3 	ldr	x19, [sp, #16]
     150:	a8c27bfd 	ldp	x29, x30, [sp], #32
     154:	d65f03c0 	ret
     158:	d503201f 	nop
     15c:	d503201f 	nop

0000000000000160 <frame_dummy>:
     160:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     164:	f944e800 	ldr	x0, [x0, #2512]
     168:	b4000140 	cbz	x0, 190 <frame_dummy+0x30>
     16c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     170:	90000081 	adrp	x1, 10000 <__malloc_av_+0x4b8>
     174:	d0000060 	adrp	x0, e000 <__func__.0+0x280>
     178:	910003fd 	mov	x29, sp
     17c:	910de021 	add	x1, x1, #0x378
     180:	91283000 	add	x0, x0, #0xa0c
     184:	d503201f 	nop
     188:	a8c17bfd 	ldp	x29, x30, [sp], #16
     18c:	17ffffd1 	b	d0 <register_tm_clones>
     190:	17ffffd0 	b	d0 <register_tm_clones>
     194:	d503201f 	nop

0000000000000198 <_mainCRTStartup>:
     198:	58000281 	ldr	x1, 1e8 <_cpu_init_hook+0x4>
     19c:	927cec20 	and	x0, x1, #0xfffffffffffffff0
     1a0:	9100001f 	mov	sp, x0
     1a4:	d280001d 	mov	x29, #0x0                   	// #0
     1a8:	a9bf77fd 	stp	x29, x29, [sp, #-16]!
     1ac:	910003fd 	mov	x29, sp
     1b0:	9400000d 	bl	1e4 <_cpu_init_hook>
     1b4:	580001e0 	ldr	x0, 1f0 <_cpu_init_hook+0xc>
     1b8:	52800001 	mov	w1, #0x0                   	// #0
     1bc:	580001e2 	ldr	x2, 1f8 <_cpu_init_hook+0x14>
     1c0:	cb000042 	sub	x2, x2, x0
     1c4:	9400175f 	bl	5f40 <memset>
     1c8:	580001c0 	ldr	x0, 200 <_cpu_init_hook+0x1c>
     1cc:	94001641 	bl	5ad0 <atexit>
     1d0:	9400169c 	bl	5c40 <__libc_init_array>
     1d4:	d2800000 	mov	x0, #0x0                   	// #0
     1d8:	d2800001 	mov	x1, #0x0                   	// #0
     1dc:	97ffff89 	bl	0 <main>
     1e0:	1400135c 	b	4f50 <exit>

00000000000001e4 <_cpu_init_hook>:
     1e4:	d65f03c0 	ret
	...
     1f0:	00010370 	.word	0x00010370
     1f4:	00000000 	.word	0x00000000
     1f8:	000a89a0 	.word	0x000a89a0
     1fc:	00000000 	.word	0x00000000
     200:	00005af0 	.word	0x00005af0
     204:	00000000 	.word	0x00000000
     208:	d503201f 	.word	0xd503201f
     20c:	d503201f 	.word	0xd503201f

0000000000000210 <get_session_cwd>:
{
     210:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     214:	910003fd 	mov	x29, sp
     218:	f9001bf7 	str	x23, [sp, #48]
     21c:	90000080 	adrp	x0, 10000 <__malloc_av_+0x4b8>
     220:	9116c017 	add	x23, x0, #0x5b0
     224:	a90153f3 	stp	x19, x20, [sp, #16]
     228:	aa1703f4 	mov	x20, x23
    for (int i = 0; i < MAX_SUPPORT_SESSION; i++) {
     22c:	52800013 	mov	w19, #0x0                   	// #0
{
     230:	a9025bf5 	stp	x21, x22, [sp, #32]
    int free_idx = -1;
     234:	12800016 	mov	w22, #0xffffffff            	// #-1
     238:	1400000a 	b	260 <get_session_cwd+0x50>
        if (free_idx == -1 && session_cwd[i].session_id == 0) {
     23c:	310006df 	cmn	w22, #0x1
     240:	54000081 	b.ne	250 <get_session_cwd+0x40>  // b.any
     244:	b9400280 	ldr	w0, [x20]
     248:	7100001f 	cmp	w0, #0x0
     24c:	1a9312d6 	csel	w22, w22, w19, ne  // ne = any
    for (int i = 0; i < MAX_SUPPORT_SESSION; i++) {
     250:	11000673 	add	w19, w19, #0x1
     254:	91004294 	add	x20, x20, #0x10
     258:	7140067f 	cmp	w19, #0x1, lsl #12
     25c:	54000160 	b.eq	288 <get_session_cwd+0x78>  // b.none
        if (session_cwd[i].session_id == cur_session_id()) {
     260:	b9400295 	ldr	w21, [x20]
     264:	9400118b 	bl	4890 <cur_session_id>
     268:	6b0002bf 	cmp	w21, w0
     26c:	54fffe81 	b.ne	23c <get_session_cwd+0x2c>  // b.any
            return &session_cwd[i];
     270:	8b33d2e0 	add	x0, x23, w19, sxtw #4
}
     274:	a94153f3 	ldp	x19, x20, [sp, #16]
     278:	a9425bf5 	ldp	x21, x22, [sp, #32]
     27c:	f9401bf7 	ldr	x23, [sp, #48]
     280:	a8c47bfd 	ldp	x29, x30, [sp], #64
     284:	d65f03c0 	ret
    if (free_idx == -1) {
     288:	310006df 	cmn	w22, #0x1
     28c:	54000200 	b.eq	2cc <get_session_cwd+0xbc>  // b.none
    session_cwd[free_idx].session_id = cur_session_id();
     290:	937c7ed6 	sbfiz	x22, x22, #4, #32
     294:	9400117f 	bl	4890 <cur_session_id>
     298:	8b1602f3 	add	x19, x23, x22
     29c:	2a0003e1 	mov	w1, w0
    session_cwd[free_idx].Inode = InodeGet(ROOT_INUM);
     2a0:	52800020 	mov	w0, #0x1                   	// #1
    session_cwd[free_idx].session_id = cur_session_id();
     2a4:	b8366ae1 	str	w1, [x23, x22]
    session_cwd[free_idx].Inode = InodeGet(ROOT_INUM);
     2a8:	94000692 	bl	1cf0 <InodeGet>
     2ac:	aa0003e1 	mov	x1, x0
     2b0:	f9000661 	str	x1, [x19, #8]
    return &session_cwd[free_idx];
     2b4:	aa1303e0 	mov	x0, x19
}
     2b8:	a94153f3 	ldp	x19, x20, [sp, #16]
     2bc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     2c0:	f9401bf7 	ldr	x23, [sp, #48]
     2c4:	a8c47bfd 	ldp	x29, x30, [sp], #64
     2c8:	d65f03c0 	ret
        printf("Connect Session reaches max value.\n");
     2cc:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     2d0:	91276000 	add	x0, x0, #0x9d8
     2d4:	94000fd3 	bl	4220 <printf>
        return NULL;
     2d8:	d2800000 	mov	x0, #0x0                   	// #0
     2dc:	17ffffe6 	b	274 <get_session_cwd+0x64>

00000000000002e0 <ipc_serve_Ipc_close>:
IPC_SERVER_INTERFACE(Ipc_close, 1);
     2e0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     2e4:	910003fd 	mov	x29, sp
     2e8:	f9000bf3 	str	x19, [sp, #16]
     2ec:	aa0003f3 	mov	x19, x0
/// @param msg
/// @param arg_num start with 0 for first arg
/// @return
__attribute__((__always_inline__)) static inline void* ipc_msg_get_nth_arg_buf(struct IpcMsg* msg, int arg_num)
{
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     2f0:	39404000 	ldrb	w0, [x0, #16]
     2f4:	370003a0 	tbnz	w0, #0, 368 <ipc_serve_Ipc_close+0x88>
        return NULL;
    }

    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     2f8:	79401a60 	ldrh	w0, [x19, #12]
    FreeFileDescriptor(*fd);
     2fc:	b8606a60 	ldr	w0, [x19, x0]
     300:	94000924 	bl	2790 <FreeFileDescriptor>
IPC_SERVER_INTERFACE(Ipc_close, 1);
     304:	b9002fff 	str	wzr, [sp, #44]
     308:	9400116a 	bl	48b0 <is_cur_session_delayed>
     30c:	72001c1f 	tst	w0, #0xff
     310:	54000141 	b.ne	338 <ipc_serve_Ipc_close+0x58>  // b.any
/// @brief set return val of ipc call after serve, used by server
/// @param msg
/// @param ret_val
__attribute__((__always_inline__)) static inline void ipc_msg_set_return(struct IpcMsg* msg, int32_t* ret_val)
{
    assert(msg->header.valid == 1);
     314:	39400260 	ldrb	w0, [x19]
     318:	36000180 	tbz	w0, #0, 348 <ipc_serve_Ipc_close+0x68>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     31c:	9100b3e1 	add	x1, sp, #0x2c
     320:	91002260 	add	x0, x19, #0x8
     324:	d2800082 	mov	x2, #0x4                   	// #4
     328:	94001676 	bl	5d00 <memcpy>
     32c:	39400260 	ldrb	w0, [x19]
     330:	321f0000 	orr	w0, w0, #0x2
     334:	39000260 	strb	w0, [x19]
     338:	52800000 	mov	w0, #0x0                   	// #0
     33c:	f9400bf3 	ldr	x19, [sp, #16]
     340:	a8c37bfd 	ldp	x29, x30, [sp], #48
     344:	d65f03c0 	ret
    assert(msg->header.valid == 1);
     348:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     34c:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     350:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     354:	91280063 	add	x3, x3, #0xa00
     358:	91354042 	add	x2, x2, #0xd50
     35c:	91286000 	add	x0, x0, #0xa18
     360:	52801101 	mov	w1, #0x88                  	// #136
     364:	940015bb 	bl	5a50 <__assert_func>
    FreeFileDescriptor(*fd);
     368:	d2800000 	mov	x0, #0x0                   	// #0
     36c:	b9400000 	ldr	w0, [x0]
     370:	d4207d00 	brk	#0x3e8
     374:	d503201f 	nop
     378:	d503201f 	nop
     37c:	d503201f 	nop

0000000000000380 <ipc_serve_Ipc_fsize>:
IPC_SERVER_INTERFACE(Ipc_fsize, 1);
     380:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     384:	910003fd 	mov	x29, sp
     388:	f9000bf3 	str	x19, [sp, #16]
     38c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     390:	39404000 	ldrb	w0, [x0, #16]
     394:	370005c0 	tbnz	w0, #0, 44c <ipc_serve_Ipc_fsize+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     398:	79401a60 	ldrh	w0, [x19, #12]
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
     39c:	b8606a60 	ldr	w0, [x19, x0]
     3a0:	940008ec 	bl	2750 <GetFileDescriptor>
    if (!fdp) {
     3a4:	b40003a0 	cbz	x0, 418 <ipc_serve_Ipc_fsize+0x98>
    struct Inode* ip = fdp->data;
     3a8:	f9404001 	ldr	x1, [x0, #128]
    if (ip->type != FS_FILE) {
     3ac:	b9400422 	ldr	w2, [x1, #4]
     3b0:	7100085f 	cmp	w2, #0x2
     3b4:	54000261 	b.ne	400 <ipc_serve_Ipc_fsize+0x80>  // b.any
    return ip->size;
     3b8:	b9400820 	ldr	w0, [x1, #8]
IPC_SERVER_INTERFACE(Ipc_fsize, 1);
     3bc:	b9002fe0 	str	w0, [sp, #44]
     3c0:	9400113c 	bl	48b0 <is_cur_session_delayed>
     3c4:	72001c1f 	tst	w0, #0xff
     3c8:	54000141 	b.ne	3f0 <ipc_serve_Ipc_fsize+0x70>  // b.any
    assert(msg->header.valid == 1);
     3cc:	39400260 	ldrb	w0, [x19]
     3d0:	360002e0 	tbz	w0, #0, 42c <ipc_serve_Ipc_fsize+0xac>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     3d4:	9100b3e1 	add	x1, sp, #0x2c
     3d8:	91002260 	add	x0, x19, #0x8
     3dc:	d2800082 	mov	x2, #0x4                   	// #4
     3e0:	94001648 	bl	5d00 <memcpy>
     3e4:	39400260 	ldrb	w0, [x19]
     3e8:	321f0000 	orr	w0, w0, #0x2
     3ec:	39000260 	strb	w0, [x19]
     3f0:	52800000 	mov	w0, #0x0                   	// #0
     3f4:	f9400bf3 	ldr	x19, [sp, #16]
     3f8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     3fc:	d65f03c0 	ret
        printf("read: %s Is not a file\n", fdp->path);
     400:	aa0003e1 	mov	x1, x0
     404:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     408:	912a0000 	add	x0, x0, #0xa80
     40c:	94000f85 	bl	4220 <printf>
        return -1;
     410:	12800000 	mov	w0, #0xffffffff            	// #-1
     414:	17ffffea 	b	3bc <ipc_serve_Ipc_fsize+0x3c>
        printf("read: fd invalid\n");
     418:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     41c:	9129a000 	add	x0, x0, #0xa68
     420:	94000f80 	bl	4220 <printf>
        return -1;
     424:	12800000 	mov	w0, #0xffffffff            	// #-1
     428:	17ffffe5 	b	3bc <ipc_serve_Ipc_fsize+0x3c>
    assert(msg->header.valid == 1);
     42c:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     430:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     434:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     438:	91280063 	add	x3, x3, #0xa00
     43c:	91354042 	add	x2, x2, #0xd50
     440:	91286000 	add	x0, x0, #0xa18
     444:	52801101 	mov	w1, #0x88                  	// #136
     448:	94001582 	bl	5a50 <__assert_func>
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
     44c:	d2800000 	mov	x0, #0x0                   	// #0
     450:	b9400000 	ldr	w0, [x0]
     454:	d4207d00 	brk	#0x3e8
     458:	d503201f 	nop
     45c:	d503201f 	nop

0000000000000460 <ipc_do_serve_Ipc_ls>:
{
     460:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     464:	910003fd 	mov	x29, sp
     468:	a90153f3 	stp	x19, x20, [sp, #16]
     46c:	aa0003f3 	mov	x19, x0
     470:	f90013f5 	str	x21, [sp, #32]
    if (*path == '/') {
     474:	39400000 	ldrb	w0, [x0]
     478:	7100bc1f 	cmp	w0, #0x2f
     47c:	540005e0 	b.eq	538 <ipc_do_serve_Ipc_ls+0xd8>  // b.none
        struct CwdPair* cwd = get_session_cwd();
     480:	97ffff64 	bl	210 <get_session_cwd>
        if (!cwd) {
     484:	b40006e0 	cbz	x0, 560 <ipc_do_serve_Ipc_ls+0x100>
        dp = cwd->Inode;
     488:	f9400415 	ldr	x21, [x0, #8]
    if (!(ip = InodeSeek(dp, path))) {
     48c:	aa1303e1 	mov	x1, x19
     490:	aa1503e0 	mov	x0, x21
     494:	9400085f 	bl	2610 <InodeSeek>
     498:	aa0003f4 	mov	x20, x0
     49c:	b40006c0 	cbz	x0, 574 <ipc_do_serve_Ipc_ls+0x114>
    if (ip->type != FS_DIRECTORY) {
     4a0:	b9400400 	ldr	w0, [x0, #4]
     4a4:	7100041f 	cmp	w0, #0x1
     4a8:	54000501 	b.ne	548 <ipc_do_serve_Ipc_ls+0xe8>  // b.any
    for (off = 0; off < ip->size; off += sizeof(de)) {
     4ac:	b9400a80 	ldr	w0, [x20, #8]
        printf("%s\n", de.name);
     4b0:	b0000075 	adrp	x21, d000 <__ascii_wctomb+0x30>
     4b4:	912bc2b5 	add	x21, x21, #0xaf0
    for (off = 0; off < ip->size; off += sizeof(de)) {
     4b8:	52800013 	mov	w19, #0x0                   	// #0
     4bc:	35000140 	cbnz	w0, 4e4 <ipc_do_serve_Ipc_ls+0x84>
     4c0:	14000019 	b	524 <ipc_do_serve_Ipc_ls+0xc4>
        if (de.inum == 0) {
     4c4:	794063e2 	ldrh	w2, [sp, #48]
        printf("%s\n", de.name);
     4c8:	9100cbe1 	add	x1, sp, #0x32
     4cc:	aa1503e0 	mov	x0, x21
        if (de.inum == 0) {
     4d0:	34000042 	cbz	w2, 4d8 <ipc_do_serve_Ipc_ls+0x78>
        printf("%s\n", de.name);
     4d4:	94000f53 	bl	4220 <printf>
    for (off = 0; off < ip->size; off += sizeof(de)) {
     4d8:	b9400a80 	ldr	w0, [x20, #8]
     4dc:	6b13001f 	cmp	w0, w19
     4e0:	54000229 	b.ls	524 <ipc_do_serve_Ipc_ls+0xc4>  // b.plast
        if (InodeRead(ip, (char*)&de, off, sizeof(de)) != sizeof(de)) {
     4e4:	2a1303e2 	mov	w2, w19
     4e8:	9100c3e1 	add	x1, sp, #0x30
     4ec:	aa1403e0 	mov	x0, x20
     4f0:	52800403 	mov	w3, #0x20                  	// #32
    for (off = 0; off < ip->size; off += sizeof(de)) {
     4f4:	11008273 	add	w19, w19, #0x20
        if (InodeRead(ip, (char*)&de, off, sizeof(de)) != sizeof(de)) {
     4f8:	9400060a 	bl	1d20 <InodeRead>
     4fc:	7100801f 	cmp	w0, #0x20
     500:	54fffe20 	b.eq	4c4 <ipc_do_serve_Ipc_ls+0x64>  // b.none
            printf("ls:read dir entry failed\n");
     504:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     508:	912c4000 	add	x0, x0, #0xb10
     50c:	94000f45 	bl	4220 <printf>
            return -1;
     510:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     514:	a94153f3 	ldp	x19, x20, [sp, #16]
     518:	f94013f5 	ldr	x21, [sp, #32]
     51c:	a8c57bfd 	ldp	x29, x30, [sp], #80
     520:	d65f03c0 	ret
    return 0;
     524:	52800000 	mov	w0, #0x0                   	// #0
}
     528:	a94153f3 	ldp	x19, x20, [sp, #16]
     52c:	f94013f5 	ldr	x21, [sp, #32]
     530:	a8c57bfd 	ldp	x29, x30, [sp], #80
     534:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     538:	52800020 	mov	w0, #0x1                   	// #1
     53c:	940005ed 	bl	1cf0 <InodeGet>
     540:	aa0003f5 	mov	x21, x0
     544:	17ffffd2 	b	48c <ipc_do_serve_Ipc_ls+0x2c>
        printf("ls: not a dir, ip: %d\n", ip->inum);
     548:	b9400281 	ldr	w1, [x20]
     54c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     550:	912be000 	add	x0, x0, #0xaf8
     554:	94000f33 	bl	4220 <printf>
        return -1;
     558:	12800000 	mov	w0, #0xffffffff            	// #-1
     55c:	17fffff3 	b	528 <ipc_do_serve_Ipc_ls+0xc8>
            printf("ls:find current work dir failed\n");
     560:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     564:	912a6000 	add	x0, x0, #0xa98
     568:	94000f2e 	bl	4220 <printf>
            return -1;
     56c:	12800000 	mov	w0, #0xffffffff            	// #-1
     570:	17ffffee 	b	528 <ipc_do_serve_Ipc_ls+0xc8>
        printf("ls: find target Inode failed, dp: %p(%d), path: %s\n", dp, dp->inum, path);
     574:	b94002a2 	ldr	w2, [x21]
     578:	aa1303e3 	mov	x3, x19
     57c:	aa1503e1 	mov	x1, x21
     580:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     584:	912b0000 	add	x0, x0, #0xac0
     588:	94000f26 	bl	4220 <printf>
        return -1;
     58c:	12800000 	mov	w0, #0xffffffff            	// #-1
     590:	17ffffe6 	b	528 <ipc_do_serve_Ipc_ls+0xc8>
     594:	d503201f 	nop
     598:	d503201f 	nop
     59c:	d503201f 	nop

00000000000005a0 <ipc_serve_Ipc_ls>:
IPC_SERVER_INTERFACE(Ipc_ls, 1);
     5a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     5a4:	910003fd 	mov	x29, sp
     5a8:	f9000bf3 	str	x19, [sp, #16]
     5ac:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     5b0:	39404000 	ldrb	w0, [x0, #16]
     5b4:	370002a0 	tbnz	w0, #0, 608 <ipc_serve_Ipc_ls+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     5b8:	79401a60 	ldrh	w0, [x19, #12]
     5bc:	8b000260 	add	x0, x19, x0
     5c0:	97ffffa8 	bl	460 <ipc_do_serve_Ipc_ls>
     5c4:	b9002fe0 	str	w0, [sp, #44]
     5c8:	940010ba 	bl	48b0 <is_cur_session_delayed>
     5cc:	72001c1f 	tst	w0, #0xff
     5d0:	54000141 	b.ne	5f8 <ipc_serve_Ipc_ls+0x58>  // b.any
    assert(msg->header.valid == 1);
     5d4:	39400260 	ldrb	w0, [x19]
     5d8:	360001c0 	tbz	w0, #0, 610 <ipc_serve_Ipc_ls+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     5dc:	9100b3e1 	add	x1, sp, #0x2c
     5e0:	91002260 	add	x0, x19, #0x8
     5e4:	d2800082 	mov	x2, #0x4                   	// #4
     5e8:	940015c6 	bl	5d00 <memcpy>
     5ec:	39400260 	ldrb	w0, [x19]
     5f0:	321f0000 	orr	w0, w0, #0x2
     5f4:	39000260 	strb	w0, [x19]
     5f8:	52800000 	mov	w0, #0x0                   	// #0
     5fc:	f9400bf3 	ldr	x19, [sp, #16]
     600:	a8c37bfd 	ldp	x29, x30, [sp], #48
     604:	d65f03c0 	ret
        return NULL;
     608:	d2800000 	mov	x0, #0x0                   	// #0
     60c:	17ffffed 	b	5c0 <ipc_serve_Ipc_ls+0x20>
    assert(msg->header.valid == 1);
     610:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     614:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     618:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     61c:	91280063 	add	x3, x3, #0xa00
     620:	91354042 	add	x2, x2, #0xd50
     624:	91286000 	add	x0, x0, #0xa18
     628:	52801101 	mov	w1, #0x88                  	// #136
     62c:	94001509 	bl	5a50 <__assert_func>

0000000000000630 <ipc_do_serve_Ipc_cd>:
{
     630:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     634:	910003fd 	mov	x29, sp
     638:	a90153f3 	stp	x19, x20, [sp, #16]
     63c:	aa0003f4 	mov	x20, x0
    cwd = get_session_cwd();
     640:	97fffef4 	bl	210 <get_session_cwd>
    if (!cwd) {
     644:	b4000340 	cbz	x0, 6ac <ipc_do_serve_Ipc_cd+0x7c>
     648:	aa0003f3 	mov	x19, x0
    if (*path == '/') {
     64c:	39400280 	ldrb	w0, [x20]
     650:	7100bc1f 	cmp	w0, #0x2f
     654:	540001c0 	b.eq	68c <ipc_do_serve_Ipc_cd+0x5c>  // b.none
        dp = cwd->Inode;
     658:	f9400660 	ldr	x0, [x19, #8]
    if (!(ip = InodeSeek(dp, path))) {
     65c:	aa1403e1 	mov	x1, x20
     660:	940007ec 	bl	2610 <InodeSeek>
     664:	aa0003e1 	mov	x1, x0
     668:	b40002c0 	cbz	x0, 6c0 <ipc_do_serve_Ipc_cd+0x90>
    if (ip->type != FS_DIRECTORY) {
     66c:	b9400400 	ldr	w0, [x0, #4]
     670:	7100041f 	cmp	w0, #0x1
     674:	54000121 	b.ne	698 <ipc_do_serve_Ipc_cd+0x68>  // b.any
    return 0;
     678:	52800000 	mov	w0, #0x0                   	// #0
    cwd->Inode = ip;
     67c:	f9000661 	str	x1, [x19, #8]
}
     680:	a94153f3 	ldp	x19, x20, [sp, #16]
     684:	a8c27bfd 	ldp	x29, x30, [sp], #32
     688:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     68c:	52800020 	mov	w0, #0x1                   	// #1
     690:	94000598 	bl	1cf0 <InodeGet>
     694:	17fffff2 	b	65c <ipc_do_serve_Ipc_cd+0x2c>
        printf("cd:not a dir\n");
     698:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     69c:	912de000 	add	x0, x0, #0xb78
     6a0:	94000ee0 	bl	4220 <printf>
        return -1;
     6a4:	12800000 	mov	w0, #0xffffffff            	// #-1
     6a8:	17fffff6 	b	680 <ipc_do_serve_Ipc_cd+0x50>
        printf("cd:find current work dir failed\n");
     6ac:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     6b0:	912cc000 	add	x0, x0, #0xb30
     6b4:	94000edb 	bl	4220 <printf>
        return -1;
     6b8:	12800000 	mov	w0, #0xffffffff            	// #-1
     6bc:	17fffff1 	b	680 <ipc_do_serve_Ipc_cd+0x50>
        printf("cd:find target Inode failed\n");
     6c0:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     6c4:	912d6000 	add	x0, x0, #0xb58
     6c8:	94000ed6 	bl	4220 <printf>
        return -1;
     6cc:	12800000 	mov	w0, #0xffffffff            	// #-1
     6d0:	17ffffec 	b	680 <ipc_do_serve_Ipc_cd+0x50>
     6d4:	d503201f 	nop
     6d8:	d503201f 	nop
     6dc:	d503201f 	nop

00000000000006e0 <ipc_serve_Ipc_cd>:
IPC_SERVER_INTERFACE(Ipc_cd, 1);
     6e0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     6e4:	910003fd 	mov	x29, sp
     6e8:	f9000bf3 	str	x19, [sp, #16]
     6ec:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     6f0:	39404000 	ldrb	w0, [x0, #16]
     6f4:	370002a0 	tbnz	w0, #0, 748 <ipc_serve_Ipc_cd+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     6f8:	79401a60 	ldrh	w0, [x19, #12]
     6fc:	8b000260 	add	x0, x19, x0
     700:	97ffffcc 	bl	630 <ipc_do_serve_Ipc_cd>
     704:	b9002fe0 	str	w0, [sp, #44]
     708:	9400106a 	bl	48b0 <is_cur_session_delayed>
     70c:	72001c1f 	tst	w0, #0xff
     710:	54000141 	b.ne	738 <ipc_serve_Ipc_cd+0x58>  // b.any
    assert(msg->header.valid == 1);
     714:	39400260 	ldrb	w0, [x19]
     718:	360001c0 	tbz	w0, #0, 750 <ipc_serve_Ipc_cd+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     71c:	9100b3e1 	add	x1, sp, #0x2c
     720:	91002260 	add	x0, x19, #0x8
     724:	d2800082 	mov	x2, #0x4                   	// #4
     728:	94001576 	bl	5d00 <memcpy>
     72c:	39400260 	ldrb	w0, [x19]
     730:	321f0000 	orr	w0, w0, #0x2
     734:	39000260 	strb	w0, [x19]
     738:	52800000 	mov	w0, #0x0                   	// #0
     73c:	f9400bf3 	ldr	x19, [sp, #16]
     740:	a8c37bfd 	ldp	x29, x30, [sp], #48
     744:	d65f03c0 	ret
        return NULL;
     748:	d2800000 	mov	x0, #0x0                   	// #0
     74c:	17ffffed 	b	700 <ipc_serve_Ipc_cd+0x20>
    assert(msg->header.valid == 1);
     750:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     754:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     758:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     75c:	91280063 	add	x3, x3, #0xa00
     760:	91354042 	add	x2, x2, #0xd50
     764:	91286000 	add	x0, x0, #0xa18
     768:	52801101 	mov	w1, #0x88                  	// #136
     76c:	940014b9 	bl	5a50 <__assert_func>

0000000000000770 <ipc_do_serve_Ipc_mkdir>:
{
     770:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     774:	910003fd 	mov	x29, sp
     778:	a90153f3 	stp	x19, x20, [sp, #16]
     77c:	aa0003f3 	mov	x19, x0
    if (*path == '/') {
     780:	39400000 	ldrb	w0, [x0]
     784:	7100bc1f 	cmp	w0, #0x2f
     788:	54000340 	b.eq	7f0 <ipc_do_serve_Ipc_mkdir+0x80>  // b.none
        struct CwdPair* cwd = get_session_cwd();
     78c:	97fffea1 	bl	210 <get_session_cwd>
        if (!cwd) {
     790:	b4000580 	cbz	x0, 840 <ipc_do_serve_Ipc_mkdir+0xd0>
        dp = cwd->Inode;
     794:	f9400414 	ldr	x20, [x0, #8]
    if ((ip = InodeSeek(dp, path)) != NULL) {
     798:	aa1303e1 	mov	x1, x19
     79c:	aa1403e0 	mov	x0, x20
     7a0:	9400079c 	bl	2610 <InodeSeek>
     7a4:	b50002e0 	cbnz	x0, 800 <ipc_do_serve_Ipc_mkdir+0x90>
    if (!(ip = InodeParentSeek(dp, path, name))) {
     7a8:	aa1403e0 	mov	x0, x20
     7ac:	910083e2 	add	x2, sp, #0x20
     7b0:	aa1303e1 	mov	x1, x19
    char name[DIR_NAME_SIZE] = { 0 };
     7b4:	a9027fff 	stp	xzr, xzr, [sp, #32]
     7b8:	f9001bff 	str	xzr, [sp, #48]
     7bc:	b9003bff 	str	wzr, [sp, #56]
     7c0:	79007bff 	strh	wzr, [sp, #60]
    if (!(ip = InodeParentSeek(dp, path, name))) {
     7c4:	940007bb 	bl	26b0 <InodeParentSeek>
     7c8:	b4000260 	cbz	x0, 814 <ipc_do_serve_Ipc_mkdir+0xa4>
    if (InodeCreate(ip, name, FS_DIRECTORY) == 0) {
     7cc:	910083e1 	add	x1, sp, #0x20
     7d0:	52800022 	mov	w2, #0x1                   	// #1
     7d4:	9400068b 	bl	2200 <InodeCreate>
     7d8:	aa0003e1 	mov	x1, x0
    return 0;
     7dc:	52800000 	mov	w0, #0x0                   	// #0
    if (InodeCreate(ip, name, FS_DIRECTORY) == 0) {
     7e0:	b4000241 	cbz	x1, 828 <ipc_do_serve_Ipc_mkdir+0xb8>
}
     7e4:	a94153f3 	ldp	x19, x20, [sp, #16]
     7e8:	a8c47bfd 	ldp	x29, x30, [sp], #64
     7ec:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     7f0:	52800020 	mov	w0, #0x1                   	// #1
     7f4:	9400053f 	bl	1cf0 <InodeGet>
     7f8:	aa0003f4 	mov	x20, x0
     7fc:	17ffffe7 	b	798 <ipc_do_serve_Ipc_mkdir+0x28>
        printf("target Inode existed\n");
     800:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     804:	912ea000 	add	x0, x0, #0xba8
     808:	94000e86 	bl	4220 <printf>
        return -1;
     80c:	12800000 	mov	w0, #0xffffffff            	// #-1
     810:	17fffff5 	b	7e4 <ipc_do_serve_Ipc_mkdir+0x74>
        printf("target parent Inode is not existed\n");
     814:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     818:	912f0000 	add	x0, x0, #0xbc0
     81c:	94000e81 	bl	4220 <printf>
        return -1;
     820:	12800000 	mov	w0, #0xffffffff            	// #-1
     824:	17fffff0 	b	7e4 <ipc_do_serve_Ipc_mkdir+0x74>
        printf("create target Inode %s failed\n", path);
     828:	aa1303e1 	mov	x1, x19
     82c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     830:	912fa000 	add	x0, x0, #0xbe8
     834:	94000e7b 	bl	4220 <printf>
        return -1;
     838:	12800000 	mov	w0, #0xffffffff            	// #-1
     83c:	17ffffea 	b	7e4 <ipc_do_serve_Ipc_mkdir+0x74>
            printf("find current work dir failed\n");
     840:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     844:	912e2000 	add	x0, x0, #0xb88
     848:	94000e76 	bl	4220 <printf>
            return -1;
     84c:	12800000 	mov	w0, #0xffffffff            	// #-1
     850:	17ffffe5 	b	7e4 <ipc_do_serve_Ipc_mkdir+0x74>
     854:	d503201f 	nop
     858:	d503201f 	nop
     85c:	d503201f 	nop

0000000000000860 <ipc_serve_Ipc_mkdir>:
IPC_SERVER_INTERFACE(Ipc_mkdir, 1);
     860:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     864:	910003fd 	mov	x29, sp
     868:	f9000bf3 	str	x19, [sp, #16]
     86c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     870:	39404000 	ldrb	w0, [x0, #16]
     874:	370002a0 	tbnz	w0, #0, 8c8 <ipc_serve_Ipc_mkdir+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     878:	79401a60 	ldrh	w0, [x19, #12]
     87c:	8b000260 	add	x0, x19, x0
     880:	97ffffbc 	bl	770 <ipc_do_serve_Ipc_mkdir>
     884:	b9002fe0 	str	w0, [sp, #44]
     888:	9400100a 	bl	48b0 <is_cur_session_delayed>
     88c:	72001c1f 	tst	w0, #0xff
     890:	54000141 	b.ne	8b8 <ipc_serve_Ipc_mkdir+0x58>  // b.any
    assert(msg->header.valid == 1);
     894:	39400260 	ldrb	w0, [x19]
     898:	360001c0 	tbz	w0, #0, 8d0 <ipc_serve_Ipc_mkdir+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     89c:	9100b3e1 	add	x1, sp, #0x2c
     8a0:	91002260 	add	x0, x19, #0x8
     8a4:	d2800082 	mov	x2, #0x4                   	// #4
     8a8:	94001516 	bl	5d00 <memcpy>
     8ac:	39400260 	ldrb	w0, [x19]
     8b0:	321f0000 	orr	w0, w0, #0x2
     8b4:	39000260 	strb	w0, [x19]
     8b8:	52800000 	mov	w0, #0x0                   	// #0
     8bc:	f9400bf3 	ldr	x19, [sp, #16]
     8c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
     8c4:	d65f03c0 	ret
        return NULL;
     8c8:	d2800000 	mov	x0, #0x0                   	// #0
     8cc:	17ffffed 	b	880 <ipc_serve_Ipc_mkdir+0x20>
    assert(msg->header.valid == 1);
     8d0:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     8d4:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     8d8:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     8dc:	91280063 	add	x3, x3, #0xa00
     8e0:	91354042 	add	x2, x2, #0xd50
     8e4:	91286000 	add	x0, x0, #0xa18
     8e8:	52801101 	mov	w1, #0x88                  	// #136
     8ec:	94001459 	bl	5a50 <__assert_func>

00000000000008f0 <ipc_do_serve_Ipc_delete>:
{
     8f0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     8f4:	910003fd 	mov	x29, sp
     8f8:	f9000bf3 	str	x19, [sp, #16]
     8fc:	aa0003f3 	mov	x19, x0
    if (*path == '/') {
     900:	39400000 	ldrb	w0, [x0]
     904:	7100bc1f 	cmp	w0, #0x2f
     908:	54000280 	b.eq	958 <ipc_do_serve_Ipc_delete+0x68>  // b.none
        struct CwdPair* cwd = get_session_cwd();
     90c:	97fffe41 	bl	210 <get_session_cwd>
        if (!cwd) {
     910:	b40003e0 	cbz	x0, 98c <ipc_do_serve_Ipc_delete+0x9c>
        dp = cwd->Inode;
     914:	f9400400 	ldr	x0, [x0, #8]
    if (!(ip = InodeParentSeek(dp, path, name))) {
     918:	aa1303e1 	mov	x1, x19
     91c:	910083e2 	add	x2, sp, #0x20
    char name[DIR_NAME_SIZE] = { 0 };
     920:	a9027fff 	stp	xzr, xzr, [sp, #32]
     924:	f9001bff 	str	xzr, [sp, #48]
     928:	b9003bff 	str	wzr, [sp, #56]
     92c:	79007bff 	strh	wzr, [sp, #60]
    if (!(ip = InodeParentSeek(dp, path, name))) {
     930:	94000760 	bl	26b0 <InodeParentSeek>
     934:	b4000180 	cbz	x0, 964 <ipc_do_serve_Ipc_delete+0x74>
    if (InodeDelete(ip, name) < 0) {
     938:	910083e1 	add	x1, sp, #0x20
     93c:	940006e5 	bl	24d0 <InodeDelete>
     940:	2a0003e1 	mov	w1, w0
    return 0;
     944:	52800000 	mov	w0, #0x0                   	// #0
    if (InodeDelete(ip, name) < 0) {
     948:	37f80181 	tbnz	w1, #31, 978 <ipc_do_serve_Ipc_delete+0x88>
}
     94c:	f9400bf3 	ldr	x19, [sp, #16]
     950:	a8c47bfd 	ldp	x29, x30, [sp], #64
     954:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     958:	52800020 	mov	w0, #0x1                   	// #1
     95c:	940004e5 	bl	1cf0 <InodeGet>
     960:	17ffffee 	b	918 <ipc_do_serve_Ipc_delete+0x28>
        printf("delete:target file parent not existed\n");
     964:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     968:	9130c000 	add	x0, x0, #0xc30
     96c:	94000e2d 	bl	4220 <printf>
        return -1;
     970:	12800000 	mov	w0, #0xffffffff            	// #-1
     974:	17fffff6 	b	94c <ipc_do_serve_Ipc_delete+0x5c>
        printf("delete:target file not existed\n");
     978:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     97c:	91316000 	add	x0, x0, #0xc58
     980:	94000e28 	bl	4220 <printf>
        return -1;
     984:	12800000 	mov	w0, #0xffffffff            	// #-1
     988:	17fffff1 	b	94c <ipc_do_serve_Ipc_delete+0x5c>
            printf("delete:find current work dir failed\n");
     98c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     990:	91302000 	add	x0, x0, #0xc08
     994:	94000e23 	bl	4220 <printf>
            return -1;
     998:	12800000 	mov	w0, #0xffffffff            	// #-1
     99c:	17ffffec 	b	94c <ipc_do_serve_Ipc_delete+0x5c>

00000000000009a0 <ipc_serve_Ipc_delete>:
IPC_SERVER_INTERFACE(Ipc_delete, 1);
     9a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     9a4:	910003fd 	mov	x29, sp
     9a8:	f9000bf3 	str	x19, [sp, #16]
     9ac:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     9b0:	39404000 	ldrb	w0, [x0, #16]
     9b4:	370002a0 	tbnz	w0, #0, a08 <ipc_serve_Ipc_delete+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     9b8:	79401a60 	ldrh	w0, [x19, #12]
     9bc:	8b000260 	add	x0, x19, x0
     9c0:	97ffffcc 	bl	8f0 <ipc_do_serve_Ipc_delete>
     9c4:	b9002fe0 	str	w0, [sp, #44]
     9c8:	94000fba 	bl	48b0 <is_cur_session_delayed>
     9cc:	72001c1f 	tst	w0, #0xff
     9d0:	54000141 	b.ne	9f8 <ipc_serve_Ipc_delete+0x58>  // b.any
    assert(msg->header.valid == 1);
     9d4:	39400260 	ldrb	w0, [x19]
     9d8:	360001c0 	tbz	w0, #0, a10 <ipc_serve_Ipc_delete+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     9dc:	9100b3e1 	add	x1, sp, #0x2c
     9e0:	91002260 	add	x0, x19, #0x8
     9e4:	d2800082 	mov	x2, #0x4                   	// #4
     9e8:	940014c6 	bl	5d00 <memcpy>
     9ec:	39400260 	ldrb	w0, [x19]
     9f0:	321f0000 	orr	w0, w0, #0x2
     9f4:	39000260 	strb	w0, [x19]
     9f8:	52800000 	mov	w0, #0x0                   	// #0
     9fc:	f9400bf3 	ldr	x19, [sp, #16]
     a00:	a8c37bfd 	ldp	x29, x30, [sp], #48
     a04:	d65f03c0 	ret
        return NULL;
     a08:	d2800000 	mov	x0, #0x0                   	// #0
     a0c:	17ffffed 	b	9c0 <ipc_serve_Ipc_delete+0x20>
    assert(msg->header.valid == 1);
     a10:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     a14:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     a18:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     a1c:	91280063 	add	x3, x3, #0xa00
     a20:	91354042 	add	x2, x2, #0xd50
     a24:	91286000 	add	x0, x0, #0xa18
     a28:	52801101 	mov	w1, #0x88                  	// #136
     a2c:	94001409 	bl	5a50 <__assert_func>

0000000000000a30 <ipc_do_serve_Ipc_cat>:
{
     a30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     a34:	910003fd 	mov	x29, sp
     a38:	a9025bf5 	stp	x21, x22, [sp, #32]
    buffer[BLOCK_SIZE] = '\0';
     a3c:	90000095 	adrp	x21, 10000 <__malloc_av_+0x4b8>
     a40:	910ea2b5 	add	x21, x21, #0x3a8
{
     a44:	a90153f3 	stp	x19, x20, [sp, #16]
     a48:	aa0003f3 	mov	x19, x0
    buffer[BLOCK_SIZE] = '\0';
     a4c:	390802bf 	strb	wzr, [x21, #512]
    if (*path == '/') {
     a50:	39400000 	ldrb	w0, [x0]
     a54:	7100bc1f 	cmp	w0, #0x2f
     a58:	54000580 	b.eq	b08 <ipc_do_serve_Ipc_cat+0xd8>  // b.none
        struct CwdPair* cwd = get_session_cwd();
     a5c:	97fffded 	bl	210 <get_session_cwd>
        if (!cwd) {
     a60:	b4000660 	cbz	x0, b2c <ipc_do_serve_Ipc_cat+0xfc>
        dp = cwd->Inode;
     a64:	f9400400 	ldr	x0, [x0, #8]
    if (!(ip = InodeSeek(dp, path))) {
     a68:	aa1303e1 	mov	x1, x19
     a6c:	940006e9 	bl	2610 <InodeSeek>
     a70:	aa0003f4 	mov	x20, x0
     a74:	b4000660 	cbz	x0, b40 <ipc_do_serve_Ipc_cat+0x110>
    if (ip->type != FS_FILE) {
     a78:	b9400400 	ldr	w0, [x0, #4]
     a7c:	7100081f 	cmp	w0, #0x2
     a80:	540004a1 	b.ne	b14 <ipc_do_serve_Ipc_cat+0xe4>  // b.any
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
     a84:	b9400a80 	ldr	w0, [x20, #8]
        printf("%s", buffer);
     a88:	b0000076 	adrp	x22, d000 <__ascii_wctomb+0x30>
     a8c:	9132c2d6 	add	x22, x22, #0xcb0
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
     a90:	52800013 	mov	w19, #0x0                   	// #0
     a94:	350000c0 	cbnz	w0, aac <ipc_do_serve_Ipc_cat+0x7c>
     a98:	14000017 	b	af4 <ipc_do_serve_Ipc_cat+0xc4>
        printf("%s", buffer);
     a9c:	94000de1 	bl	4220 <printf>
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
     aa0:	b9400a80 	ldr	w0, [x20, #8]
     aa4:	6b13001f 	cmp	w0, w19
     aa8:	54000269 	b.ls	af4 <ipc_do_serve_Ipc_cat+0xc4>  // b.plast
        if (InodeRead(ip, buffer, off, BLOCK_SIZE) < 0) {
     aac:	2a1303e2 	mov	w2, w19
     ab0:	aa1503e1 	mov	x1, x21
     ab4:	52804003 	mov	w3, #0x200                 	// #512
     ab8:	aa1403e0 	mov	x0, x20
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
     abc:	0b030273 	add	w19, w19, w3
        if (InodeRead(ip, buffer, off, BLOCK_SIZE) < 0) {
     ac0:	94000498 	bl	1d20 <InodeRead>
        printf("%s", buffer);
     ac4:	aa1503e1 	mov	x1, x21
        if (InodeRead(ip, buffer, off, BLOCK_SIZE) < 0) {
     ac8:	2a0003e2 	mov	w2, w0
        printf("%s", buffer);
     acc:	aa1603e0 	mov	x0, x22
        if (InodeRead(ip, buffer, off, BLOCK_SIZE) < 0) {
     ad0:	36fffe62 	tbz	w2, #31, a9c <ipc_do_serve_Ipc_cat+0x6c>
            printf("cat: read file data failed\n");
     ad4:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     ad8:	91324000 	add	x0, x0, #0xc90
     adc:	94000dd1 	bl	4220 <printf>
    return 0;
     ae0:	52800000 	mov	w0, #0x0                   	// #0
}
     ae4:	a94153f3 	ldp	x19, x20, [sp, #16]
     ae8:	a9425bf5 	ldp	x21, x22, [sp, #32]
     aec:	a8c37bfd 	ldp	x29, x30, [sp], #48
     af0:	d65f03c0 	ret
    return 0;
     af4:	52800000 	mov	w0, #0x0                   	// #0
}
     af8:	a94153f3 	ldp	x19, x20, [sp, #16]
     afc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     b00:	a8c37bfd 	ldp	x29, x30, [sp], #48
     b04:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     b08:	52800020 	mov	w0, #0x1                   	// #1
     b0c:	94000479 	bl	1cf0 <InodeGet>
     b10:	17ffffd6 	b	a68 <ipc_do_serve_Ipc_cat+0x38>
        printf("cat: %s Is not a file\n", path);
     b14:	aa1303e1 	mov	x1, x19
     b18:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     b1c:	9131e000 	add	x0, x0, #0xc78
     b20:	94000dc0 	bl	4220 <printf>
        return -1;
     b24:	12800000 	mov	w0, #0xffffffff            	// #-1
     b28:	17fffff4 	b	af8 <ipc_do_serve_Ipc_cat+0xc8>
            printf("delete:find current work dir failed\n");
     b2c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     b30:	91302000 	add	x0, x0, #0xc08
     b34:	94000dbb 	bl	4220 <printf>
            return -1;
     b38:	12800000 	mov	w0, #0xffffffff            	// #-1
     b3c:	17ffffef 	b	af8 <ipc_do_serve_Ipc_cat+0xc8>
        printf("delete:target file not existed\n");
     b40:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     b44:	91316000 	add	x0, x0, #0xc58
     b48:	94000db6 	bl	4220 <printf>
        return -1;
     b4c:	12800000 	mov	w0, #0xffffffff            	// #-1
     b50:	17ffffea 	b	af8 <ipc_do_serve_Ipc_cat+0xc8>
     b54:	d503201f 	nop
     b58:	d503201f 	nop
     b5c:	d503201f 	nop

0000000000000b60 <ipc_serve_Ipc_cat>:
IPC_SERVER_INTERFACE(Ipc_cat, 1);
     b60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     b64:	910003fd 	mov	x29, sp
     b68:	f9000bf3 	str	x19, [sp, #16]
     b6c:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     b70:	39404000 	ldrb	w0, [x0, #16]
     b74:	370002a0 	tbnz	w0, #0, bc8 <ipc_serve_Ipc_cat+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     b78:	79401a60 	ldrh	w0, [x19, #12]
     b7c:	8b000260 	add	x0, x19, x0
     b80:	97ffffac 	bl	a30 <ipc_do_serve_Ipc_cat>
     b84:	b9002fe0 	str	w0, [sp, #44]
     b88:	94000f4a 	bl	48b0 <is_cur_session_delayed>
     b8c:	72001c1f 	tst	w0, #0xff
     b90:	54000141 	b.ne	bb8 <ipc_serve_Ipc_cat+0x58>  // b.any
    assert(msg->header.valid == 1);
     b94:	39400260 	ldrb	w0, [x19]
     b98:	360001c0 	tbz	w0, #0, bd0 <ipc_serve_Ipc_cat+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     b9c:	9100b3e1 	add	x1, sp, #0x2c
     ba0:	91002260 	add	x0, x19, #0x8
     ba4:	d2800082 	mov	x2, #0x4                   	// #4
     ba8:	94001456 	bl	5d00 <memcpy>
     bac:	39400260 	ldrb	w0, [x19]
     bb0:	321f0000 	orr	w0, w0, #0x2
     bb4:	39000260 	strb	w0, [x19]
     bb8:	52800000 	mov	w0, #0x0                   	// #0
     bbc:	f9400bf3 	ldr	x19, [sp, #16]
     bc0:	a8c37bfd 	ldp	x29, x30, [sp], #48
     bc4:	d65f03c0 	ret
        return NULL;
     bc8:	d2800000 	mov	x0, #0x0                   	// #0
     bcc:	17ffffed 	b	b80 <ipc_serve_Ipc_cat+0x20>
    assert(msg->header.valid == 1);
     bd0:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     bd4:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     bd8:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     bdc:	91280063 	add	x3, x3, #0xa00
     be0:	91354042 	add	x2, x2, #0xd50
     be4:	91286000 	add	x0, x0, #0xa18
     be8:	52801101 	mov	w1, #0x88                  	// #136
     bec:	94001399 	bl	5a50 <__assert_func>

0000000000000bf0 <ipc_do_serve_Ipc_open>:
{
     bf0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     bf4:	910003fd 	mov	x29, sp
     bf8:	a90153f3 	stp	x19, x20, [sp, #16]
     bfc:	aa0003f3 	mov	x19, x0
    fd = AllocFileDescriptor();
     c00:	940006f0 	bl	27c0 <AllocFileDescriptor>
    if (fd < 0) {
     c04:	37f803c0 	tbnz	w0, #31, c7c <ipc_do_serve_Ipc_open+0x8c>
     c08:	2a0003f4 	mov	w20, w0
    fdp = GetFileDescriptor(fd);
     c0c:	a9025bf5 	stp	x21, x22, [sp, #32]
     c10:	940006d0 	bl	2750 <GetFileDescriptor>
    if (*path == '/') {
     c14:	39400261 	ldrb	w1, [x19]
    fdp = GetFileDescriptor(fd);
     c18:	aa0003f6 	mov	x22, x0
    if (*path == '/') {
     c1c:	7100bc3f 	cmp	w1, #0x2f
     c20:	54000280 	b.eq	c70 <ipc_do_serve_Ipc_open+0x80>  // b.none
        struct CwdPair* cwd = get_session_cwd();
     c24:	97fffd7b 	bl	210 <get_session_cwd>
        if (!cwd) {
     c28:	b4000420 	cbz	x0, cac <ipc_do_serve_Ipc_open+0xbc>
        dp = cwd->Inode;
     c2c:	f9400400 	ldr	x0, [x0, #8]
    if ((ip = InodeSeek(dp, path)) == NULL) {
     c30:	aa1303e1 	mov	x1, x19
     c34:	94000677 	bl	2610 <InodeSeek>
     c38:	aa0003f5 	mov	x21, x0
     c3c:	b40002a0 	cbz	x0, c90 <ipc_do_serve_Ipc_open+0xa0>
    strncpy(fdp->path, path, strlen(path) + 1);
     c40:	aa1303e0 	mov	x0, x19
     c44:	9400157f 	bl	6240 <strlen>
     c48:	aa1303e1 	mov	x1, x19
     c4c:	91000402 	add	x2, x0, #0x1
     c50:	aa1603e0 	mov	x0, x22
     c54:	94001643 	bl	6560 <strncpy>
    fdp->data = ip;
     c58:	f90042d5 	str	x21, [x22, #128]
     c5c:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
     c60:	2a1403e0 	mov	w0, w20
     c64:	a94153f3 	ldp	x19, x20, [sp, #16]
     c68:	a8c37bfd 	ldp	x29, x30, [sp], #48
     c6c:	d65f03c0 	ret
        dp = InodeGet(ROOT_INUM);
     c70:	52800020 	mov	w0, #0x1                   	// #1
     c74:	9400041f 	bl	1cf0 <InodeGet>
     c78:	17ffffee 	b	c30 <ipc_do_serve_Ipc_open+0x40>
        printf("open: alloc a new fd failed\n");
     c7c:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     c80:	9132e000 	add	x0, x0, #0xcb8
        return -1;
     c84:	12800014 	mov	w20, #0xffffffff            	// #-1
        printf("open: alloc a new fd failed\n");
     c88:	94000d66 	bl	4220 <printf>
        return -1;
     c8c:	17fffff5 	b	c60 <ipc_do_serve_Ipc_open+0x70>
        printf("open: find target Inode failed, path is %s\n", path);
     c90:	aa1303e1 	mov	x1, x19
     c94:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
        return -1;
     c98:	12800014 	mov	w20, #0xffffffff            	// #-1
        printf("open: find target Inode failed, path is %s\n", path);
     c9c:	91336000 	add	x0, x0, #0xcd8
     ca0:	94000d60 	bl	4220 <printf>
        return -1;
     ca4:	a9425bf5 	ldp	x21, x22, [sp, #32]
     ca8:	17ffffee 	b	c60 <ipc_do_serve_Ipc_open+0x70>
            printf("ls:find current work dir failed\n");
     cac:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     cb0:	912a6000 	add	x0, x0, #0xa98
            return -1;
     cb4:	12800014 	mov	w20, #0xffffffff            	// #-1
            printf("ls:find current work dir failed\n");
     cb8:	94000d5a 	bl	4220 <printf>
            return -1;
     cbc:	a9425bf5 	ldp	x21, x22, [sp, #32]
     cc0:	17ffffe8 	b	c60 <ipc_do_serve_Ipc_open+0x70>
     cc4:	d503201f 	nop
     cc8:	d503201f 	nop
     ccc:	d503201f 	nop

0000000000000cd0 <ipc_serve_Ipc_open>:
IPC_SERVER_INTERFACE(Ipc_open, 1);
     cd0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     cd4:	910003fd 	mov	x29, sp
     cd8:	f9000bf3 	str	x19, [sp, #16]
     cdc:	aa0003f3 	mov	x19, x0
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     ce0:	39404000 	ldrb	w0, [x0, #16]
     ce4:	370002a0 	tbnz	w0, #0, d38 <ipc_serve_Ipc_open+0x68>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     ce8:	79401a60 	ldrh	w0, [x19, #12]
     cec:	8b000260 	add	x0, x19, x0
     cf0:	97ffffc0 	bl	bf0 <ipc_do_serve_Ipc_open>
     cf4:	b9002fe0 	str	w0, [sp, #44]
     cf8:	94000eee 	bl	48b0 <is_cur_session_delayed>
     cfc:	72001c1f 	tst	w0, #0xff
     d00:	54000141 	b.ne	d28 <ipc_serve_Ipc_open+0x58>  // b.any
    assert(msg->header.valid == 1);
     d04:	39400260 	ldrb	w0, [x19]
     d08:	360001c0 	tbz	w0, #0, d40 <ipc_serve_Ipc_open+0x70>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     d0c:	9100b3e1 	add	x1, sp, #0x2c
     d10:	91002260 	add	x0, x19, #0x8
     d14:	d2800082 	mov	x2, #0x4                   	// #4
     d18:	940013fa 	bl	5d00 <memcpy>
     d1c:	39400260 	ldrb	w0, [x19]
     d20:	321f0000 	orr	w0, w0, #0x2
     d24:	39000260 	strb	w0, [x19]
     d28:	52800000 	mov	w0, #0x0                   	// #0
     d2c:	f9400bf3 	ldr	x19, [sp, #16]
     d30:	a8c37bfd 	ldp	x29, x30, [sp], #48
     d34:	d65f03c0 	ret
        return NULL;
     d38:	d2800000 	mov	x0, #0x0                   	// #0
     d3c:	17ffffed 	b	cf0 <ipc_serve_Ipc_open+0x20>
    assert(msg->header.valid == 1);
     d40:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     d44:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     d48:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     d4c:	91280063 	add	x3, x3, #0xa00
     d50:	91354042 	add	x2, x2, #0xd50
     d54:	91286000 	add	x0, x0, #0xa18
     d58:	52801101 	mov	w1, #0x88                  	// #136
     d5c:	9400133d 	bl	5a50 <__assert_func>

0000000000000d60 <ipc_do_serve_Ipc_close>:
{
     d60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     d64:	910003fd 	mov	x29, sp
    FreeFileDescriptor(*fd);
     d68:	b9400000 	ldr	w0, [x0]
     d6c:	94000689 	bl	2790 <FreeFileDescriptor>
}
     d70:	52800000 	mov	w0, #0x0                   	// #0
     d74:	a8c17bfd 	ldp	x29, x30, [sp], #16
     d78:	d65f03c0 	ret
     d7c:	d503201f 	nop

0000000000000d80 <ipc_do_serve_Ipc_read>:
{
     d80:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     d84:	910003fd 	mov	x29, sp
     d88:	a90153f3 	stp	x19, x20, [sp, #16]
     d8c:	aa0103f4 	mov	x20, x1
     d90:	aa0203f3 	mov	x19, x2
     d94:	f90013f5 	str	x21, [sp, #32]
     d98:	aa0303f5 	mov	x21, x3
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
     d9c:	b9400000 	ldr	w0, [x0]
     da0:	9400066c 	bl	2750 <GetFileDescriptor>
    if (!fdp) {
     da4:	b40002a0 	cbz	x0, df8 <ipc_do_serve_Ipc_read+0x78>
     da8:	aa0003e1 	mov	x1, x0
    struct Inode* ip = fdp->data;
     dac:	f9404000 	ldr	x0, [x0, #128]
    if (ip->type != FS_FILE) {
     db0:	b9400402 	ldr	w2, [x0, #4]
     db4:	7100085f 	cmp	w2, #0x2
     db8:	54000101 	b.ne	dd8 <ipc_do_serve_Ipc_read+0x58>  // b.any
    int cur_read_len = InodeRead(ip, dst, *offset, *len);
     dbc:	b9400262 	ldr	w2, [x19]
     dc0:	aa1403e1 	mov	x1, x20
     dc4:	b94002a3 	ldr	w3, [x21]
}
     dc8:	a94153f3 	ldp	x19, x20, [sp, #16]
     dcc:	f94013f5 	ldr	x21, [sp, #32]
     dd0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    int cur_read_len = InodeRead(ip, dst, *offset, *len);
     dd4:	140003d3 	b	1d20 <InodeRead>
        printf("read: %s Is not a file\n", fdp->path);
     dd8:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     ddc:	912a0000 	add	x0, x0, #0xa80
     de0:	94000d10 	bl	4220 <printf>
}
     de4:	12800000 	mov	w0, #0xffffffff            	// #-1
     de8:	a94153f3 	ldp	x19, x20, [sp, #16]
     dec:	f94013f5 	ldr	x21, [sp, #32]
     df0:	a8c37bfd 	ldp	x29, x30, [sp], #48
     df4:	d65f03c0 	ret
        printf("read: fd invalid\n");
     df8:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     dfc:	9129a000 	add	x0, x0, #0xa68
     e00:	94000d08 	bl	4220 <printf>
        return -1;
     e04:	17fffff8 	b	de4 <ipc_do_serve_Ipc_read+0x64>
     e08:	d503201f 	nop
     e0c:	d503201f 	nop

0000000000000e10 <ipc_serve_Ipc_read>:
IPC_SERVER_INTERFACE(Ipc_read, 4);
     e10:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     e14:	910003fd 	mov	x29, sp
     e18:	f9000bf3 	str	x19, [sp, #16]
     e1c:	aa0003f3 	mov	x19, x0
     e20:	91003261 	add	x1, x19, #0xc
     e24:	9100c3e0 	add	x0, sp, #0x30
     e28:	91009263 	add	x3, x19, #0x24
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     e2c:	39401022 	ldrb	w2, [x1, #4]
     e30:	37000362 	tbnz	w2, #0, e9c <ipc_serve_Ipc_read+0x8c>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     e34:	79400022 	ldrh	w2, [x1]
     e38:	8b020262 	add	x2, x19, x2
     e3c:	f8008402 	str	x2, [x0], #8
     e40:	91001821 	add	x1, x1, #0x6
     e44:	eb03003f 	cmp	x1, x3
     e48:	54ffff21 	b.ne	e2c <ipc_serve_Ipc_read+0x1c>  // b.any
     e4c:	a94307e0 	ldp	x0, x1, [sp, #48]
     e50:	a9440fe2 	ldp	x2, x3, [sp, #64]
     e54:	97ffffcb 	bl	d80 <ipc_do_serve_Ipc_read>
     e58:	b9002fe0 	str	w0, [sp, #44]
     e5c:	94000e95 	bl	48b0 <is_cur_session_delayed>
     e60:	72001c1f 	tst	w0, #0xff
     e64:	54000141 	b.ne	e8c <ipc_serve_Ipc_read+0x7c>  // b.any
    assert(msg->header.valid == 1);
     e68:	39400260 	ldrb	w0, [x19]
     e6c:	360001c0 	tbz	w0, #0, ea4 <ipc_serve_Ipc_read+0x94>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     e70:	9100b3e1 	add	x1, sp, #0x2c
     e74:	91002260 	add	x0, x19, #0x8
     e78:	d2800082 	mov	x2, #0x4                   	// #4
     e7c:	940013a1 	bl	5d00 <memcpy>
     e80:	39400260 	ldrb	w0, [x19]
     e84:	321f0000 	orr	w0, w0, #0x2
     e88:	39000260 	strb	w0, [x19]
     e8c:	52800000 	mov	w0, #0x0                   	// #0
     e90:	f9400bf3 	ldr	x19, [sp, #16]
     e94:	a8c57bfd 	ldp	x29, x30, [sp], #80
     e98:	d65f03c0 	ret
        return NULL;
     e9c:	d2800002 	mov	x2, #0x0                   	// #0
     ea0:	17ffffe7 	b	e3c <ipc_serve_Ipc_read+0x2c>
    assert(msg->header.valid == 1);
     ea4:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     ea8:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     eac:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     eb0:	91280063 	add	x3, x3, #0xa00
     eb4:	91354042 	add	x2, x2, #0xd50
     eb8:	91286000 	add	x0, x0, #0xa18
     ebc:	52801101 	mov	w1, #0x88                  	// #136
     ec0:	940012e4 	bl	5a50 <__assert_func>
     ec4:	d503201f 	nop
     ec8:	d503201f 	nop
     ecc:	d503201f 	nop

0000000000000ed0 <ipc_do_serve_Ipc_write>:
{
     ed0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
     ed4:	910003fd 	mov	x29, sp
     ed8:	a90153f3 	stp	x19, x20, [sp, #16]
     edc:	aa0103f4 	mov	x20, x1
     ee0:	aa0203f3 	mov	x19, x2
     ee4:	f90013f5 	str	x21, [sp, #32]
     ee8:	aa0303f5 	mov	x21, x3
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
     eec:	b9400000 	ldr	w0, [x0]
     ef0:	94000618 	bl	2750 <GetFileDescriptor>
    if (!fdp) {
     ef4:	b40002a0 	cbz	x0, f48 <ipc_do_serve_Ipc_write+0x78>
     ef8:	aa0003e1 	mov	x1, x0
    struct Inode* ip = fdp->data;
     efc:	f9404000 	ldr	x0, [x0, #128]
    if (ip->type != FS_FILE) {
     f00:	b9400402 	ldr	w2, [x0, #4]
     f04:	7100085f 	cmp	w2, #0x2
     f08:	54000101 	b.ne	f28 <ipc_do_serve_Ipc_write+0x58>  // b.any
    int cur_write_len = InodeWrite(ip, src, *offset, *len);
     f0c:	b9400262 	ldr	w2, [x19]
     f10:	aa1403e1 	mov	x1, x20
     f14:	b94002a3 	ldr	w3, [x21]
}
     f18:	a94153f3 	ldp	x19, x20, [sp, #16]
     f1c:	f94013f5 	ldr	x21, [sp, #32]
     f20:	a8c37bfd 	ldp	x29, x30, [sp], #48
    int cur_write_len = InodeWrite(ip, src, *offset, *len);
     f24:	14000417 	b	1f80 <InodeWrite>
        printf("read: %s Is not a file\n", fdp->path);
     f28:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     f2c:	912a0000 	add	x0, x0, #0xa80
     f30:	94000cbc 	bl	4220 <printf>
}
     f34:	12800000 	mov	w0, #0xffffffff            	// #-1
     f38:	a94153f3 	ldp	x19, x20, [sp, #16]
     f3c:	f94013f5 	ldr	x21, [sp, #32]
     f40:	a8c37bfd 	ldp	x29, x30, [sp], #48
     f44:	d65f03c0 	ret
        printf("read: fd invalid\n");
     f48:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
     f4c:	9129a000 	add	x0, x0, #0xa68
     f50:	94000cb4 	bl	4220 <printf>
        return -1;
     f54:	17fffff8 	b	f34 <ipc_do_serve_Ipc_write+0x64>
     f58:	d503201f 	nop
     f5c:	d503201f 	nop

0000000000000f60 <ipc_serve_Ipc_write>:
IPC_SERVER_INTERFACE(Ipc_write, 4);
     f60:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     f64:	910003fd 	mov	x29, sp
     f68:	f9000bf3 	str	x19, [sp, #16]
     f6c:	aa0003f3 	mov	x19, x0
     f70:	91003261 	add	x1, x19, #0xc
     f74:	9100c3e0 	add	x0, sp, #0x30
     f78:	91009263 	add	x3, x19, #0x24
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     f7c:	39401022 	ldrb	w2, [x1, #4]
     f80:	37000362 	tbnz	w2, #0, fec <ipc_serve_Ipc_write+0x8c>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     f84:	79400022 	ldrh	w2, [x1]
     f88:	8b020262 	add	x2, x19, x2
     f8c:	f8008402 	str	x2, [x0], #8
     f90:	91001821 	add	x1, x1, #0x6
     f94:	eb03003f 	cmp	x1, x3
     f98:	54ffff21 	b.ne	f7c <ipc_serve_Ipc_write+0x1c>  // b.any
     f9c:	a94307e0 	ldp	x0, x1, [sp, #48]
     fa0:	a9440fe2 	ldp	x2, x3, [sp, #64]
     fa4:	97ffffcb 	bl	ed0 <ipc_do_serve_Ipc_write>
     fa8:	b9002fe0 	str	w0, [sp, #44]
     fac:	94000e41 	bl	48b0 <is_cur_session_delayed>
     fb0:	72001c1f 	tst	w0, #0xff
     fb4:	54000141 	b.ne	fdc <ipc_serve_Ipc_write+0x7c>  // b.any
    assert(msg->header.valid == 1);
     fb8:	39400260 	ldrb	w0, [x19]
     fbc:	360001c0 	tbz	w0, #0, ff4 <ipc_serve_Ipc_write+0x94>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
     fc0:	9100b3e1 	add	x1, sp, #0x2c
     fc4:	91002260 	add	x0, x19, #0x8
     fc8:	d2800082 	mov	x2, #0x4                   	// #4
     fcc:	9400134d 	bl	5d00 <memcpy>
     fd0:	39400260 	ldrb	w0, [x19]
     fd4:	321f0000 	orr	w0, w0, #0x2
     fd8:	39000260 	strb	w0, [x19]
     fdc:	52800000 	mov	w0, #0x0                   	// #0
     fe0:	f9400bf3 	ldr	x19, [sp, #16]
     fe4:	a8c57bfd 	ldp	x29, x30, [sp], #80
     fe8:	d65f03c0 	ret
        return NULL;
     fec:	d2800002 	mov	x2, #0x0                   	// #0
     ff0:	17ffffe7 	b	f8c <ipc_serve_Ipc_write+0x2c>
    assert(msg->header.valid == 1);
     ff4:	b0000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
     ff8:	b0000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
     ffc:	b0000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1000:	91280063 	add	x3, x3, #0xa00
    1004:	91354042 	add	x2, x2, #0xd50
    1008:	91286000 	add	x0, x0, #0xa18
    100c:	52801101 	mov	w1, #0x88                  	// #136
    1010:	94001290 	bl	5a50 <__assert_func>
    1014:	d503201f 	nop
    1018:	d503201f 	nop
    101c:	d503201f 	nop

0000000000001020 <ipc_do_serve_Ipc_fsize>:
{
    1020:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    1024:	910003fd 	mov	x29, sp
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
    1028:	b9400000 	ldr	w0, [x0]
    102c:	940005c9 	bl	2750 <GetFileDescriptor>
    if (!fdp) {
    1030:	b40001c0 	cbz	x0, 1068 <ipc_do_serve_Ipc_fsize+0x48>
    struct Inode* ip = fdp->data;
    1034:	f9404001 	ldr	x1, [x0, #128]
    if (ip->type != FS_FILE) {
    1038:	b9400422 	ldr	w2, [x1, #4]
    103c:	7100085f 	cmp	w2, #0x2
    1040:	54000081 	b.ne	1050 <ipc_do_serve_Ipc_fsize+0x30>  // b.any
    return ip->size;
    1044:	b9400820 	ldr	w0, [x1, #8]
}
    1048:	a8c17bfd 	ldp	x29, x30, [sp], #16
    104c:	d65f03c0 	ret
        printf("read: %s Is not a file\n", fdp->path);
    1050:	aa0003e1 	mov	x1, x0
    1054:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1058:	912a0000 	add	x0, x0, #0xa80
    105c:	94000c71 	bl	4220 <printf>
        return -1;
    1060:	12800000 	mov	w0, #0xffffffff            	// #-1
    1064:	17fffff9 	b	1048 <ipc_do_serve_Ipc_fsize+0x28>
        printf("read: fd invalid\n");
    1068:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    106c:	9129a000 	add	x0, x0, #0xa68
    1070:	94000c6c 	bl	4220 <printf>
        return -1;
    1074:	12800000 	mov	w0, #0xffffffff            	// #-1
    1078:	17fffff4 	b	1048 <ipc_do_serve_Ipc_fsize+0x28>
    107c:	d503201f 	nop

0000000000001080 <ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    1080:	b40006c0 	cbz	x0, 1158 <ls+0xd8>
int ls(struct Session* session, char* path)
{
    1084:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1088:	910003fd 	mov	x29, sp
    108c:	a90153f3 	stp	x19, x20, [sp, #16]
    1090:	aa0103f4 	mov	x20, x1
    1094:	f90013f5 	str	x21, [sp, #32]
    1098:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    109c:	aa0103e0 	mov	x0, x1
    10a0:	94001468 	bl	6240 <strlen>
    10a4:	11000403 	add	w3, w0, #0x1
    10a8:	9100e3e2 	add	x2, sp, #0x38
    10ac:	52800021 	mov	w1, #0x1                   	// #1
    10b0:	aa1503e0 	mov	x0, x21
    10b4:	b9003be3 	str	w3, [sp, #56]
    10b8:	94000d1a 	bl	4520 <new_ipc_msg>
    10bc:	aa0003f3 	mov	x19, x0
    10c0:	aa1403e0 	mov	x0, x20
    10c4:	9400145f 	bl	6240 <strlen>
    10c8:	aa1403e2 	mov	x2, x20
    10cc:	11000403 	add	w3, w0, #0x1
    10d0:	52800001 	mov	w1, #0x0                   	// #0
    10d4:	aa1303e0 	mov	x0, x19
    10d8:	94000d52 	bl	4620 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
    10dc:	52800020 	mov	w0, #0x1                   	// #1
    10e0:	39000660 	strb	w0, [x19, #1]
    10e4:	aa1303e0 	mov	x0, x19
    10e8:	94000dbe 	bl	47e0 <ipc_msg_send_wait>
    10ec:	aa1403e0 	mov	x0, x20
    10f0:	94001454 	bl	6240 <strlen>
    10f4:	aa1403e2 	mov	x2, x20
    10f8:	11000403 	add	w3, w0, #0x1
    10fc:	52800001 	mov	w1, #0x0                   	// #0
    1100:	aa1303e0 	mov	x0, x19
    1104:	94000d7f 	bl	4700 <ipc_msg_get_nth_arg>
    1108:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    110c:	39400260 	ldrb	w0, [x19]
    1110:	36080280 	tbz	w0, #1, 1160 <ls+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1114:	91002261 	add	x1, x19, #0x8
    1118:	d2800082 	mov	x2, #0x4                   	// #4
    111c:	9100e3e0 	add	x0, sp, #0x38
    1120:	940012f8 	bl	5d00 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1124:	b9800aa0 	ldrsw	x0, [x21, #8]
    1128:	f9400aa1 	ldr	x1, [x21, #16]
    112c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1130:	38606820 	ldrb	w0, [x1, x0]
    1134:	36100080 	tbz	w0, #2, 1144 <ls+0xc4>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    1138:	79400441 	ldrh	w1, [x2, #2]
    113c:	aa1503e0 	mov	x0, x21
    1140:	94000eb4 	bl	4c10 <session_free_buf>
    1144:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_ls)(session, path);
}
    1148:	a94153f3 	ldp	x19, x20, [sp, #16]
    114c:	f94013f5 	ldr	x21, [sp, #32]
    1150:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1154:	d65f03c0 	ret
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    1158:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    115c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1160:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1164:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1168:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    116c:	9135a063 	add	x3, x3, #0xd68
    1170:	91360042 	add	x2, x2, #0xd80
    1174:	91286000 	add	x0, x0, #0xa18
    1178:	52800fc1 	mov	w1, #0x7e                  	// #126
    117c:	94001235 	bl	5a50 <__assert_func>

0000000000001180 <cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    1180:	b40006c0 	cbz	x0, 1258 <cd+0xd8>
int cd(struct Session* session, char* path)
{
    1184:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1188:	910003fd 	mov	x29, sp
    118c:	a90153f3 	stp	x19, x20, [sp, #16]
    1190:	aa0103f4 	mov	x20, x1
    1194:	f90013f5 	str	x21, [sp, #32]
    1198:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    119c:	aa0103e0 	mov	x0, x1
    11a0:	94001428 	bl	6240 <strlen>
    11a4:	11000403 	add	w3, w0, #0x1
    11a8:	9100e3e2 	add	x2, sp, #0x38
    11ac:	52800021 	mov	w1, #0x1                   	// #1
    11b0:	aa1503e0 	mov	x0, x21
    11b4:	b9003be3 	str	w3, [sp, #56]
    11b8:	94000cda 	bl	4520 <new_ipc_msg>
    11bc:	aa0003f3 	mov	x19, x0
    11c0:	aa1403e0 	mov	x0, x20
    11c4:	9400141f 	bl	6240 <strlen>
    11c8:	aa1403e2 	mov	x2, x20
    11cc:	11000403 	add	w3, w0, #0x1
    11d0:	52800001 	mov	w1, #0x0                   	// #0
    11d4:	aa1303e0 	mov	x0, x19
    11d8:	94000d12 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    11dc:	52800040 	mov	w0, #0x2                   	// #2
    11e0:	39000660 	strb	w0, [x19, #1]
    11e4:	aa1303e0 	mov	x0, x19
    11e8:	94000d7e 	bl	47e0 <ipc_msg_send_wait>
    11ec:	aa1403e0 	mov	x0, x20
    11f0:	94001414 	bl	6240 <strlen>
    11f4:	aa1403e2 	mov	x2, x20
    11f8:	11000403 	add	w3, w0, #0x1
    11fc:	52800001 	mov	w1, #0x0                   	// #0
    1200:	aa1303e0 	mov	x0, x19
    1204:	94000d3f 	bl	4700 <ipc_msg_get_nth_arg>
    1208:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    120c:	39400260 	ldrb	w0, [x19]
    1210:	36080280 	tbz	w0, #1, 1260 <cd+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1214:	91002261 	add	x1, x19, #0x8
    1218:	d2800082 	mov	x2, #0x4                   	// #4
    121c:	9100e3e0 	add	x0, sp, #0x38
    1220:	940012b8 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1224:	b9800aa0 	ldrsw	x0, [x21, #8]
    1228:	f9400aa1 	ldr	x1, [x21, #16]
    122c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1230:	38606820 	ldrb	w0, [x1, x0]
    1234:	36100080 	tbz	w0, #2, 1244 <cd+0xc4>
    return session_free_buf(session, msg->header.len);
    1238:	79400441 	ldrh	w1, [x2, #2]
    123c:	aa1503e0 	mov	x0, x21
    1240:	94000e74 	bl	4c10 <session_free_buf>
    1244:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cd)(session, path);
}
    1248:	a94153f3 	ldp	x19, x20, [sp, #16]
    124c:	f94013f5 	ldr	x21, [sp, #32]
    1250:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1254:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    1258:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    125c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1260:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1264:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1268:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    126c:	9135a063 	add	x3, x3, #0xd68
    1270:	91360042 	add	x2, x2, #0xd80
    1274:	91286000 	add	x0, x0, #0xa18
    1278:	52800fc1 	mov	w1, #0x7e                  	// #126
    127c:	940011f5 	bl	5a50 <__assert_func>

0000000000001280 <mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    1280:	b40006c0 	cbz	x0, 1358 <mkdir+0xd8>
int mkdir(struct Session* session, char* path)
{
    1284:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1288:	910003fd 	mov	x29, sp
    128c:	a90153f3 	stp	x19, x20, [sp, #16]
    1290:	aa0103f4 	mov	x20, x1
    1294:	f90013f5 	str	x21, [sp, #32]
    1298:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    129c:	aa0103e0 	mov	x0, x1
    12a0:	940013e8 	bl	6240 <strlen>
    12a4:	11000403 	add	w3, w0, #0x1
    12a8:	9100e3e2 	add	x2, sp, #0x38
    12ac:	52800021 	mov	w1, #0x1                   	// #1
    12b0:	aa1503e0 	mov	x0, x21
    12b4:	b9003be3 	str	w3, [sp, #56]
    12b8:	94000c9a 	bl	4520 <new_ipc_msg>
    12bc:	aa0003f3 	mov	x19, x0
    12c0:	aa1403e0 	mov	x0, x20
    12c4:	940013df 	bl	6240 <strlen>
    12c8:	aa1403e2 	mov	x2, x20
    12cc:	11000403 	add	w3, w0, #0x1
    12d0:	52800001 	mov	w1, #0x0                   	// #0
    12d4:	aa1303e0 	mov	x0, x19
    12d8:	94000cd2 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    12dc:	52800060 	mov	w0, #0x3                   	// #3
    12e0:	39000660 	strb	w0, [x19, #1]
    12e4:	aa1303e0 	mov	x0, x19
    12e8:	94000d3e 	bl	47e0 <ipc_msg_send_wait>
    12ec:	aa1403e0 	mov	x0, x20
    12f0:	940013d4 	bl	6240 <strlen>
    12f4:	aa1403e2 	mov	x2, x20
    12f8:	11000403 	add	w3, w0, #0x1
    12fc:	52800001 	mov	w1, #0x0                   	// #0
    1300:	aa1303e0 	mov	x0, x19
    1304:	94000cff 	bl	4700 <ipc_msg_get_nth_arg>
    1308:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    130c:	39400260 	ldrb	w0, [x19]
    1310:	36080280 	tbz	w0, #1, 1360 <mkdir+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1314:	91002261 	add	x1, x19, #0x8
    1318:	d2800082 	mov	x2, #0x4                   	// #4
    131c:	9100e3e0 	add	x0, sp, #0x38
    1320:	94001278 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1324:	b9800aa0 	ldrsw	x0, [x21, #8]
    1328:	f9400aa1 	ldr	x1, [x21, #16]
    132c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1330:	38606820 	ldrb	w0, [x1, x0]
    1334:	36100080 	tbz	w0, #2, 1344 <mkdir+0xc4>
    return session_free_buf(session, msg->header.len);
    1338:	79400441 	ldrh	w1, [x2, #2]
    133c:	aa1503e0 	mov	x0, x21
    1340:	94000e34 	bl	4c10 <session_free_buf>
    1344:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_mkdir)(session, path);
}
    1348:	a94153f3 	ldp	x19, x20, [sp, #16]
    134c:	f94013f5 	ldr	x21, [sp, #32]
    1350:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1354:	d65f03c0 	ret
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    1358:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    135c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1360:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1364:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1368:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    136c:	9135a063 	add	x3, x3, #0xd68
    1370:	91360042 	add	x2, x2, #0xd80
    1374:	91286000 	add	x0, x0, #0xa18
    1378:	52800fc1 	mov	w1, #0x7e                  	// #126
    137c:	940011b5 	bl	5a50 <__assert_func>

0000000000001380 <rm>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    1380:	b40006c0 	cbz	x0, 1458 <rm+0xd8>
int rm(struct Session* session, char* path)
{
    1384:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1388:	910003fd 	mov	x29, sp
    138c:	a90153f3 	stp	x19, x20, [sp, #16]
    1390:	aa0103f4 	mov	x20, x1
    1394:	f90013f5 	str	x21, [sp, #32]
    1398:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    139c:	aa0103e0 	mov	x0, x1
    13a0:	940013a8 	bl	6240 <strlen>
    13a4:	11000403 	add	w3, w0, #0x1
    13a8:	9100e3e2 	add	x2, sp, #0x38
    13ac:	52800021 	mov	w1, #0x1                   	// #1
    13b0:	aa1503e0 	mov	x0, x21
    13b4:	b9003be3 	str	w3, [sp, #56]
    13b8:	94000c5a 	bl	4520 <new_ipc_msg>
    13bc:	aa0003f3 	mov	x19, x0
    13c0:	aa1403e0 	mov	x0, x20
    13c4:	9400139f 	bl	6240 <strlen>
    13c8:	aa1403e2 	mov	x2, x20
    13cc:	11000403 	add	w3, w0, #0x1
    13d0:	52800001 	mov	w1, #0x0                   	// #0
    13d4:	aa1303e0 	mov	x0, x19
    13d8:	94000c92 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    13dc:	52800080 	mov	w0, #0x4                   	// #4
    13e0:	39000660 	strb	w0, [x19, #1]
    13e4:	aa1303e0 	mov	x0, x19
    13e8:	94000cfe 	bl	47e0 <ipc_msg_send_wait>
    13ec:	aa1403e0 	mov	x0, x20
    13f0:	94001394 	bl	6240 <strlen>
    13f4:	aa1403e2 	mov	x2, x20
    13f8:	11000403 	add	w3, w0, #0x1
    13fc:	52800001 	mov	w1, #0x0                   	// #0
    1400:	aa1303e0 	mov	x0, x19
    1404:	94000cbf 	bl	4700 <ipc_msg_get_nth_arg>
    1408:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    140c:	39400260 	ldrb	w0, [x19]
    1410:	36080280 	tbz	w0, #1, 1460 <rm+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1414:	91002261 	add	x1, x19, #0x8
    1418:	d2800082 	mov	x2, #0x4                   	// #4
    141c:	9100e3e0 	add	x0, sp, #0x38
    1420:	94001238 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1424:	b9800aa0 	ldrsw	x0, [x21, #8]
    1428:	f9400aa1 	ldr	x1, [x21, #16]
    142c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1430:	38606820 	ldrb	w0, [x1, x0]
    1434:	36100080 	tbz	w0, #2, 1444 <rm+0xc4>
    return session_free_buf(session, msg->header.len);
    1438:	79400441 	ldrh	w1, [x2, #2]
    143c:	aa1503e0 	mov	x0, x21
    1440:	94000df4 	bl	4c10 <session_free_buf>
    1444:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_delete)(session, path);
}
    1448:	a94153f3 	ldp	x19, x20, [sp, #16]
    144c:	f94013f5 	ldr	x21, [sp, #32]
    1450:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1454:	d65f03c0 	ret
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    1458:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    145c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1460:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1464:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1468:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    146c:	9135a063 	add	x3, x3, #0xd68
    1470:	91360042 	add	x2, x2, #0xd80
    1474:	91286000 	add	x0, x0, #0xa18
    1478:	52800fc1 	mov	w1, #0x7e                  	// #126
    147c:	94001175 	bl	5a50 <__assert_func>

0000000000001480 <cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    1480:	b40006c0 	cbz	x0, 1558 <cat+0xd8>
int cat(struct Session* session, char* path)
{
    1484:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1488:	910003fd 	mov	x29, sp
    148c:	a90153f3 	stp	x19, x20, [sp, #16]
    1490:	aa0103f4 	mov	x20, x1
    1494:	f90013f5 	str	x21, [sp, #32]
    1498:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    149c:	aa0103e0 	mov	x0, x1
    14a0:	94001368 	bl	6240 <strlen>
    14a4:	11000403 	add	w3, w0, #0x1
    14a8:	9100e3e2 	add	x2, sp, #0x38
    14ac:	52800021 	mov	w1, #0x1                   	// #1
    14b0:	aa1503e0 	mov	x0, x21
    14b4:	b9003be3 	str	w3, [sp, #56]
    14b8:	94000c1a 	bl	4520 <new_ipc_msg>
    14bc:	aa0003f3 	mov	x19, x0
    14c0:	aa1403e0 	mov	x0, x20
    14c4:	9400135f 	bl	6240 <strlen>
    14c8:	aa1403e2 	mov	x2, x20
    14cc:	11000403 	add	w3, w0, #0x1
    14d0:	52800001 	mov	w1, #0x0                   	// #0
    14d4:	aa1303e0 	mov	x0, x19
    14d8:	94000c52 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    14dc:	528000a0 	mov	w0, #0x5                   	// #5
    14e0:	39000660 	strb	w0, [x19, #1]
    14e4:	aa1303e0 	mov	x0, x19
    14e8:	94000cbe 	bl	47e0 <ipc_msg_send_wait>
    14ec:	aa1403e0 	mov	x0, x20
    14f0:	94001354 	bl	6240 <strlen>
    14f4:	aa1403e2 	mov	x2, x20
    14f8:	11000403 	add	w3, w0, #0x1
    14fc:	52800001 	mov	w1, #0x0                   	// #0
    1500:	aa1303e0 	mov	x0, x19
    1504:	94000c7f 	bl	4700 <ipc_msg_get_nth_arg>
    1508:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    150c:	39400260 	ldrb	w0, [x19]
    1510:	36080280 	tbz	w0, #1, 1560 <cat+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1514:	91002261 	add	x1, x19, #0x8
    1518:	d2800082 	mov	x2, #0x4                   	// #4
    151c:	9100e3e0 	add	x0, sp, #0x38
    1520:	940011f8 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1524:	b9800aa0 	ldrsw	x0, [x21, #8]
    1528:	f9400aa1 	ldr	x1, [x21, #16]
    152c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1530:	38606820 	ldrb	w0, [x1, x0]
    1534:	36100080 	tbz	w0, #2, 1544 <cat+0xc4>
    return session_free_buf(session, msg->header.len);
    1538:	79400441 	ldrh	w1, [x2, #2]
    153c:	aa1503e0 	mov	x0, x21
    1540:	94000db4 	bl	4c10 <session_free_buf>
    1544:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cat)(session, path);
}
    1548:	a94153f3 	ldp	x19, x20, [sp, #16]
    154c:	f94013f5 	ldr	x21, [sp, #32]
    1550:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1554:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    1558:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    155c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1560:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1564:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1568:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    156c:	9135a063 	add	x3, x3, #0xd68
    1570:	91360042 	add	x2, x2, #0xd80
    1574:	91286000 	add	x0, x0, #0xa18
    1578:	52800fc1 	mov	w1, #0x7e                  	// #126
    157c:	94001135 	bl	5a50 <__assert_func>

0000000000001580 <open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    1580:	b40006c0 	cbz	x0, 1658 <open+0xd8>
int open(struct Session* session, char* path)
{
    1584:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    1588:	910003fd 	mov	x29, sp
    158c:	a90153f3 	stp	x19, x20, [sp, #16]
    1590:	aa0103f4 	mov	x20, x1
    1594:	f90013f5 	str	x21, [sp, #32]
    1598:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    159c:	aa0103e0 	mov	x0, x1
    15a0:	94001328 	bl	6240 <strlen>
    15a4:	11000403 	add	w3, w0, #0x1
    15a8:	9100e3e2 	add	x2, sp, #0x38
    15ac:	52800021 	mov	w1, #0x1                   	// #1
    15b0:	aa1503e0 	mov	x0, x21
    15b4:	b9003be3 	str	w3, [sp, #56]
    15b8:	94000bda 	bl	4520 <new_ipc_msg>
    15bc:	aa0003f3 	mov	x19, x0
    15c0:	aa1403e0 	mov	x0, x20
    15c4:	9400131f 	bl	6240 <strlen>
    15c8:	aa1403e2 	mov	x2, x20
    15cc:	11000403 	add	w3, w0, #0x1
    15d0:	52800001 	mov	w1, #0x0                   	// #0
    15d4:	aa1303e0 	mov	x0, x19
    15d8:	94000c12 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    15dc:	528000c0 	mov	w0, #0x6                   	// #6
    15e0:	39000660 	strb	w0, [x19, #1]
    15e4:	aa1303e0 	mov	x0, x19
    15e8:	94000c7e 	bl	47e0 <ipc_msg_send_wait>
    15ec:	aa1403e0 	mov	x0, x20
    15f0:	94001314 	bl	6240 <strlen>
    15f4:	aa1403e2 	mov	x2, x20
    15f8:	11000403 	add	w3, w0, #0x1
    15fc:	52800001 	mov	w1, #0x0                   	// #0
    1600:	aa1303e0 	mov	x0, x19
    1604:	94000c3f 	bl	4700 <ipc_msg_get_nth_arg>
    1608:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
    160c:	39400260 	ldrb	w0, [x19]
    1610:	36080280 	tbz	w0, #1, 1660 <open+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1614:	91002261 	add	x1, x19, #0x8
    1618:	d2800082 	mov	x2, #0x4                   	// #4
    161c:	9100e3e0 	add	x0, sp, #0x38
    1620:	940011b8 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1624:	b9800aa0 	ldrsw	x0, [x21, #8]
    1628:	f9400aa1 	ldr	x1, [x21, #16]
    162c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1630:	38606820 	ldrb	w0, [x1, x0]
    1634:	36100080 	tbz	w0, #2, 1644 <open+0xc4>
    return session_free_buf(session, msg->header.len);
    1638:	79400441 	ldrh	w1, [x2, #2]
    163c:	aa1503e0 	mov	x0, x21
    1640:	94000d74 	bl	4c10 <session_free_buf>
    1644:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_open)(session, path);
}
    1648:	a94153f3 	ldp	x19, x20, [sp, #16]
    164c:	f94013f5 	ldr	x21, [sp, #32]
    1650:	a8c47bfd 	ldp	x29, x30, [sp], #64
    1654:	d65f03c0 	ret
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    1658:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    165c:	d65f03c0 	ret
    assert(msg->header.done == 1);
    1660:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1664:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1668:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    166c:	9135a063 	add	x3, x3, #0xd68
    1670:	91360042 	add	x2, x2, #0xd80
    1674:	91286000 	add	x0, x0, #0xa18
    1678:	52800fc1 	mov	w1, #0x7e                  	// #126
    167c:	940010f5 	bl	5a50 <__assert_func>

0000000000001680 <close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
int close(struct Session* session, int fd)
{
    1680:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    1684:	910003fd 	mov	x29, sp
    1688:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    168c:	b4000560 	cbz	x0, 1738 <close+0xb8>
    1690:	910123e2 	add	x2, sp, #0x48
    1694:	52800021 	mov	w1, #0x1                   	// #1
    1698:	a90153f3 	stp	x19, x20, [sp, #16]
    169c:	aa0003f4 	mov	x20, x0
    16a0:	f90013f5 	str	x21, [sp, #32]
    16a4:	52800095 	mov	w21, #0x4                   	// #4
    16a8:	b9004bf5 	str	w21, [sp, #72]
    16ac:	94000b9d 	bl	4520 <new_ipc_msg>
    16b0:	aa0003f3 	mov	x19, x0
    16b4:	2a1503e3 	mov	w3, w21
    16b8:	9100f3e2 	add	x2, sp, #0x3c
    16bc:	52800001 	mov	w1, #0x0                   	// #0
    16c0:	94000bd8 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    16c4:	528000e0 	mov	w0, #0x7                   	// #7
    16c8:	39000660 	strb	w0, [x19, #1]
    16cc:	aa1303e0 	mov	x0, x19
    16d0:	94000c44 	bl	47e0 <ipc_msg_send_wait>
    16d4:	2a1503e3 	mov	w3, w21
    16d8:	9100f3e2 	add	x2, sp, #0x3c
    16dc:	aa1303e0 	mov	x0, x19
    16e0:	52800001 	mov	w1, #0x0                   	// #0
    16e4:	94000c07 	bl	4700 <ipc_msg_get_nth_arg>
    16e8:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    16ec:	39400260 	ldrb	w0, [x19]
    16f0:	36080280 	tbz	w0, #1, 1740 <close+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    16f4:	91002261 	add	x1, x19, #0x8
    16f8:	d2800082 	mov	x2, #0x4                   	// #4
    16fc:	910123e0 	add	x0, sp, #0x48
    1700:	94001180 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1704:	b9800a80 	ldrsw	x0, [x20, #8]
    1708:	f9400a81 	ldr	x1, [x20, #16]
    170c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1710:	38606820 	ldrb	w0, [x1, x0]
    1714:	36100080 	tbz	w0, #2, 1724 <close+0xa4>
    return session_free_buf(session, msg->header.len);
    1718:	79400441 	ldrh	w1, [x2, #2]
    171c:	aa1403e0 	mov	x0, x20
    1720:	94000d3c 	bl	4c10 <session_free_buf>
    1724:	a94153f3 	ldp	x19, x20, [sp, #16]
    1728:	b9404be0 	ldr	w0, [sp, #72]
    172c:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_close)(session, &fd);
}
    1730:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1734:	d65f03c0 	ret
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    1738:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_close)(session, &fd);
    173c:	17fffffd 	b	1730 <close+0xb0>
    assert(msg->header.done == 1);
    1740:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1744:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1748:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    174c:	9135a063 	add	x3, x3, #0xd68
    1750:	91360042 	add	x2, x2, #0xd80
    1754:	91286000 	add	x0, x0, #0xa18
    1758:	52800fc1 	mov	w1, #0x7e                  	// #126
    175c:	940010bd 	bl	5a50 <__assert_func>

0000000000001760 <read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    1760:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    1764:	910003fd 	mov	x29, sp
    1768:	29068fe4 	stp	w4, w3, [sp, #52]
    176c:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    1770:	b4000980 	cbz	x0, 18a0 <read+0x140>
    1774:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    1778:	a90153f3 	stp	x19, x20, [sp, #16]
    177c:	52800094 	mov	w20, #0x4                   	// #4
    1780:	2a1403e1 	mov	w1, w20
    1784:	a9025bf5 	stp	x21, x22, [sp, #32]
    1788:	aa0203f6 	mov	x22, x2
    178c:	aa0003f5 	mov	x21, x0
    1790:	910103e2 	add	x2, sp, #0x40
    1794:	290813f4 	stp	w20, w4, [sp, #64]
    1798:	f90027e3 	str	x3, [sp, #72]
    179c:	94000b61 	bl	4520 <new_ipc_msg>
    17a0:	2a1403e3 	mov	w3, w20
    17a4:	aa0003f3 	mov	x19, x0
    17a8:	9100f3e2 	add	x2, sp, #0x3c
    17ac:	52800001 	mov	w1, #0x0                   	// #0
    17b0:	94000b9c 	bl	4620 <ipc_msg_set_nth_arg>
    17b4:	b94037e3 	ldr	w3, [sp, #52]
    17b8:	aa1603e2 	mov	x2, x22
    17bc:	52800021 	mov	w1, #0x1                   	// #1
    17c0:	aa1303e0 	mov	x0, x19
    17c4:	94000b97 	bl	4620 <ipc_msg_set_nth_arg>
    17c8:	2a1403e3 	mov	w3, w20
    17cc:	9100e3e2 	add	x2, sp, #0x38
    17d0:	52800041 	mov	w1, #0x2                   	// #2
    17d4:	aa1303e0 	mov	x0, x19
    17d8:	94000b92 	bl	4620 <ipc_msg_set_nth_arg>
    17dc:	2a1403e3 	mov	w3, w20
    17e0:	9100d3e2 	add	x2, sp, #0x34
    17e4:	52800061 	mov	w1, #0x3                   	// #3
    17e8:	aa1303e0 	mov	x0, x19
    17ec:	94000b8d 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    17f0:	52800100 	mov	w0, #0x8                   	// #8
    17f4:	39000660 	strb	w0, [x19, #1]
    17f8:	aa1303e0 	mov	x0, x19
    17fc:	94000bf9 	bl	47e0 <ipc_msg_send_wait>
    1800:	2a1403e3 	mov	w3, w20
    1804:	9100f3e2 	add	x2, sp, #0x3c
    1808:	52800001 	mov	w1, #0x0                   	// #0
    180c:	aa1303e0 	mov	x0, x19
    1810:	94000bbc 	bl	4700 <ipc_msg_get_nth_arg>
    1814:	b94037e3 	ldr	w3, [sp, #52]
    1818:	aa1603e2 	mov	x2, x22
    181c:	52800021 	mov	w1, #0x1                   	// #1
    1820:	aa1303e0 	mov	x0, x19
    1824:	94000bb7 	bl	4700 <ipc_msg_get_nth_arg>
    1828:	2a1403e3 	mov	w3, w20
    182c:	9100e3e2 	add	x2, sp, #0x38
    1830:	52800041 	mov	w1, #0x2                   	// #2
    1834:	aa1303e0 	mov	x0, x19
    1838:	94000bb2 	bl	4700 <ipc_msg_get_nth_arg>
    183c:	2a1403e3 	mov	w3, w20
    1840:	9100d3e2 	add	x2, sp, #0x34
    1844:	aa1303e0 	mov	x0, x19
    1848:	52800061 	mov	w1, #0x3                   	// #3
    184c:	94000bad 	bl	4700 <ipc_msg_get_nth_arg>
    1850:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    1854:	39400260 	ldrb	w0, [x19]
    1858:	36080280 	tbz	w0, #1, 18a8 <read+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    185c:	91002261 	add	x1, x19, #0x8
    1860:	d2800082 	mov	x2, #0x4                   	// #4
    1864:	910103e0 	add	x0, sp, #0x40
    1868:	94001126 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    186c:	b9800aa0 	ldrsw	x0, [x21, #8]
    1870:	f9400aa1 	ldr	x1, [x21, #16]
    1874:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1878:	38606820 	ldrb	w0, [x1, x0]
    187c:	36100080 	tbz	w0, #2, 188c <read+0x12c>
    return session_free_buf(session, msg->header.len);
    1880:	79400441 	ldrh	w1, [x2, #2]
    1884:	aa1503e0 	mov	x0, x21
    1888:	94000ce2 	bl	4c10 <session_free_buf>
    188c:	a94153f3 	ldp	x19, x20, [sp, #16]
    1890:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1894:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
}
    1898:	a8c57bfd 	ldp	x29, x30, [sp], #80
    189c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    18a0:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    18a4:	17fffffd 	b	1898 <read+0x138>
    assert(msg->header.done == 1);
    18a8:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    18ac:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    18b0:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    18b4:	9135a063 	add	x3, x3, #0xd68
    18b8:	91360042 	add	x2, x2, #0xd80
    18bc:	91286000 	add	x0, x0, #0xa18
    18c0:	52800fc1 	mov	w1, #0x7e                  	// #126
    18c4:	94001063 	bl	5a50 <__assert_func>
    18c8:	d503201f 	nop
    18cc:	d503201f 	nop

00000000000018d0 <write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    18d0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    18d4:	910003fd 	mov	x29, sp
    18d8:	29068fe4 	stp	w4, w3, [sp, #52]
    18dc:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    18e0:	b4000980 	cbz	x0, 1a10 <write+0x140>
    18e4:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
    18e8:	a90153f3 	stp	x19, x20, [sp, #16]
    18ec:	52800094 	mov	w20, #0x4                   	// #4
    18f0:	2a1403e1 	mov	w1, w20
    18f4:	a9025bf5 	stp	x21, x22, [sp, #32]
    18f8:	aa0203f6 	mov	x22, x2
    18fc:	aa0003f5 	mov	x21, x0
    1900:	910103e2 	add	x2, sp, #0x40
    1904:	290813f4 	stp	w20, w4, [sp, #64]
    1908:	f90027e3 	str	x3, [sp, #72]
    190c:	94000b05 	bl	4520 <new_ipc_msg>
    1910:	2a1403e3 	mov	w3, w20
    1914:	aa0003f3 	mov	x19, x0
    1918:	9100f3e2 	add	x2, sp, #0x3c
    191c:	52800001 	mov	w1, #0x0                   	// #0
    1920:	94000b40 	bl	4620 <ipc_msg_set_nth_arg>
    1924:	b94037e3 	ldr	w3, [sp, #52]
    1928:	aa1603e2 	mov	x2, x22
    192c:	52800021 	mov	w1, #0x1                   	// #1
    1930:	aa1303e0 	mov	x0, x19
    1934:	94000b3b 	bl	4620 <ipc_msg_set_nth_arg>
    1938:	2a1403e3 	mov	w3, w20
    193c:	9100e3e2 	add	x2, sp, #0x38
    1940:	52800041 	mov	w1, #0x2                   	// #2
    1944:	aa1303e0 	mov	x0, x19
    1948:	94000b36 	bl	4620 <ipc_msg_set_nth_arg>
    194c:	2a1403e3 	mov	w3, w20
    1950:	9100d3e2 	add	x2, sp, #0x34
    1954:	52800061 	mov	w1, #0x3                   	// #3
    1958:	aa1303e0 	mov	x0, x19
    195c:	94000b31 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    1960:	52800120 	mov	w0, #0x9                   	// #9
    1964:	39000660 	strb	w0, [x19, #1]
    1968:	aa1303e0 	mov	x0, x19
    196c:	94000b9d 	bl	47e0 <ipc_msg_send_wait>
    1970:	2a1403e3 	mov	w3, w20
    1974:	9100f3e2 	add	x2, sp, #0x3c
    1978:	52800001 	mov	w1, #0x0                   	// #0
    197c:	aa1303e0 	mov	x0, x19
    1980:	94000b60 	bl	4700 <ipc_msg_get_nth_arg>
    1984:	b94037e3 	ldr	w3, [sp, #52]
    1988:	aa1603e2 	mov	x2, x22
    198c:	52800021 	mov	w1, #0x1                   	// #1
    1990:	aa1303e0 	mov	x0, x19
    1994:	94000b5b 	bl	4700 <ipc_msg_get_nth_arg>
    1998:	2a1403e3 	mov	w3, w20
    199c:	9100e3e2 	add	x2, sp, #0x38
    19a0:	52800041 	mov	w1, #0x2                   	// #2
    19a4:	aa1303e0 	mov	x0, x19
    19a8:	94000b56 	bl	4700 <ipc_msg_get_nth_arg>
    19ac:	2a1403e3 	mov	w3, w20
    19b0:	9100d3e2 	add	x2, sp, #0x34
    19b4:	aa1303e0 	mov	x0, x19
    19b8:	52800061 	mov	w1, #0x3                   	// #3
    19bc:	94000b51 	bl	4700 <ipc_msg_get_nth_arg>
    19c0:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
    19c4:	39400260 	ldrb	w0, [x19]
    19c8:	36080280 	tbz	w0, #1, 1a18 <write+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    19cc:	91002261 	add	x1, x19, #0x8
    19d0:	d2800082 	mov	x2, #0x4                   	// #4
    19d4:	910103e0 	add	x0, sp, #0x40
    19d8:	940010ca 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    19dc:	b9800aa0 	ldrsw	x0, [x21, #8]
    19e0:	f9400aa1 	ldr	x1, [x21, #16]
    19e4:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    19e8:	38606820 	ldrb	w0, [x1, x0]
    19ec:	36100080 	tbz	w0, #2, 19fc <write+0x12c>
    return session_free_buf(session, msg->header.len);
    19f0:	79400441 	ldrh	w1, [x2, #2]
    19f4:	aa1503e0 	mov	x0, x21
    19f8:	94000c86 	bl	4c10 <session_free_buf>
    19fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    1a00:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1a04:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
}
    1a08:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1a0c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    1a10:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    1a14:	17fffffd 	b	1a08 <write+0x138>
    assert(msg->header.done == 1);
    1a18:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1a1c:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1a20:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1a24:	9135a063 	add	x3, x3, #0xd68
    1a28:	91360042 	add	x2, x2, #0xd80
    1a2c:	91286000 	add	x0, x0, #0xa18
    1a30:	52800fc1 	mov	w1, #0x7e                  	// #126
    1a34:	94001007 	bl	5a50 <__assert_func>
    1a38:	d503201f 	nop
    1a3c:	d503201f 	nop

0000000000001a40 <fsize>:

IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
int fsize(struct Session* session, int fd)
{
    1a40:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    1a44:	910003fd 	mov	x29, sp
    1a48:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    1a4c:	b4000560 	cbz	x0, 1af8 <fsize+0xb8>
    1a50:	910123e2 	add	x2, sp, #0x48
    1a54:	52800021 	mov	w1, #0x1                   	// #1
    1a58:	a90153f3 	stp	x19, x20, [sp, #16]
    1a5c:	aa0003f4 	mov	x20, x0
    1a60:	f90013f5 	str	x21, [sp, #32]
    1a64:	52800095 	mov	w21, #0x4                   	// #4
    1a68:	b9004bf5 	str	w21, [sp, #72]
    1a6c:	94000aad 	bl	4520 <new_ipc_msg>
    1a70:	aa0003f3 	mov	x19, x0
    1a74:	2a1503e3 	mov	w3, w21
    1a78:	9100f3e2 	add	x2, sp, #0x3c
    1a7c:	52800001 	mov	w1, #0x0                   	// #0
    1a80:	94000ae8 	bl	4620 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
    1a84:	52800140 	mov	w0, #0xa                   	// #10
    1a88:	39000660 	strb	w0, [x19, #1]
    1a8c:	aa1303e0 	mov	x0, x19
    1a90:	94000b54 	bl	47e0 <ipc_msg_send_wait>
    1a94:	2a1503e3 	mov	w3, w21
    1a98:	9100f3e2 	add	x2, sp, #0x3c
    1a9c:	aa1303e0 	mov	x0, x19
    1aa0:	52800001 	mov	w1, #0x0                   	// #0
    1aa4:	94000b17 	bl	4700 <ipc_msg_get_nth_arg>
    1aa8:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
    1aac:	39400260 	ldrb	w0, [x19]
    1ab0:	36080280 	tbz	w0, #1, 1b00 <fsize+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    1ab4:	91002261 	add	x1, x19, #0x8
    1ab8:	d2800082 	mov	x2, #0x4                   	// #4
    1abc:	910123e0 	add	x0, sp, #0x48
    1ac0:	94001090 	bl	5d00 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    1ac4:	b9800a80 	ldrsw	x0, [x20, #8]
    1ac8:	f9400a81 	ldr	x1, [x20, #16]
    1acc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
    1ad0:	38606820 	ldrb	w0, [x1, x0]
    1ad4:	36100080 	tbz	w0, #2, 1ae4 <fsize+0xa4>
    return session_free_buf(session, msg->header.len);
    1ad8:	79400441 	ldrh	w1, [x2, #2]
    1adc:	aa1403e0 	mov	x0, x20
    1ae0:	94000c4c 	bl	4c10 <session_free_buf>
    1ae4:	a94153f3 	ldp	x19, x20, [sp, #16]
    1ae8:	b9404be0 	ldr	w0, [sp, #72]
    1aec:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_fsize)(session, &fd);
    1af0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1af4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
    1af8:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_fsize)(session, &fd);
    1afc:	17fffffd 	b	1af0 <fsize+0xb0>
    assert(msg->header.done == 1);
    1b00:	90000063 	adrp	x3, d000 <__ascii_wctomb+0x30>
    1b04:	90000062 	adrp	x2, d000 <__ascii_wctomb+0x30>
    1b08:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1b0c:	9135a063 	add	x3, x3, #0xd68
    1b10:	91360042 	add	x2, x2, #0xd80
    1b14:	91286000 	add	x0, x0, #0xa18
    1b18:	52800fc1 	mov	w1, #0x7e                  	// #126
    1b1c:	94000fcd 	bl	5a50 <__assert_func>

0000000000001b20 <PathElementExtract>:
    return 0;
}

// Paths process
static char* PathElementExtract(char* path, char* name)
{
    1b20:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    1b24:	aa0003e3 	mov	x3, x0
    1b28:	aa0103e0 	mov	x0, x1
    1b2c:	910003fd 	mov	x29, sp
    1b30:	a90153f3 	stp	x19, x20, [sp, #16]
    // Skip leading slashes
    while (*path == '/')
    1b34:	39400062 	ldrb	w2, [x3]
    1b38:	7100bc5f 	cmp	w2, #0x2f
    1b3c:	54000081 	b.ne	1b4c <PathElementExtract+0x2c>  // b.any
    1b40:	38401c62 	ldrb	w2, [x3, #1]!
    1b44:	7100bc5f 	cmp	w2, #0x2f
    1b48:	54ffffc0 	b.eq	1b40 <PathElementExtract+0x20>  // b.none
        path++;

    // Check for end of path
    if (*path == 0)
    1b4c:	340003c2 	cbz	w2, 1bc4 <PathElementExtract+0xa4>
        return NULL;

    // Extract element
    char* start = path;
    while (*path != '/' && *path != 0)
    1b50:	39400061 	ldrb	w1, [x3]
    1b54:	7100bc3f 	cmp	w1, #0x2f
    1b58:	7a401824 	ccmp	w1, #0x0, #0x4, ne  // ne = any
    1b5c:	540003e0 	b.eq	1bd8 <PathElementExtract+0xb8>  // b.none
    1b60:	aa0303f3 	mov	x19, x3
    1b64:	d503201f 	nop
    1b68:	38401e62 	ldrb	w2, [x19, #1]!
    1b6c:	7100bc5f 	cmp	w2, #0x2f
    1b70:	7a401844 	ccmp	w2, #0x0, #0x4, ne  // ne = any
    1b74:	54ffffa1 	b.ne	1b68 <PathElementExtract+0x48>  // b.any
        path++;

    // Calculate length and copy to 'name'
    int len = path - start;
    1b78:	cb030262 	sub	x2, x19, x3
    if (len >= DIR_NAME_SIZE)
        len = DIR_NAME_SIZE - 1;
    strncpy(name, start, len);
    1b7c:	528003a1 	mov	w1, #0x1d                  	// #29
    1b80:	6b01005f 	cmp	w2, w1
    1b84:	1a81d042 	csel	w2, w2, w1, le
    1b88:	93407c42 	sxtw	x2, w2
    name[len] = 0;
    1b8c:	8b020014 	add	x20, x0, x2
    strncpy(name, start, len);
    1b90:	aa0303e1 	mov	x1, x3
    1b94:	94001273 	bl	6560 <strncpy>
    name[len] = 0;
    1b98:	3900029f 	strb	wzr, [x20]

    // Skip trailing slashes
    while (*path == '/')
    1b9c:	39400260 	ldrb	w0, [x19]
    1ba0:	7100bc1f 	cmp	w0, #0x2f
    1ba4:	54000081 	b.ne	1bb4 <PathElementExtract+0x94>  // b.any
    1ba8:	38401e60 	ldrb	w0, [x19, #1]!
    1bac:	7100bc1f 	cmp	w0, #0x2f
    1bb0:	54ffffc0 	b.eq	1ba8 <PathElementExtract+0x88>  // b.none
        path++;

    return path;
}
    1bb4:	aa1303e0 	mov	x0, x19
    1bb8:	a94153f3 	ldp	x19, x20, [sp, #16]
    1bbc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    1bc0:	d65f03c0 	ret
        return NULL;
    1bc4:	d2800013 	mov	x19, #0x0                   	// #0
}
    1bc8:	aa1303e0 	mov	x0, x19
    1bcc:	a94153f3 	ldp	x19, x20, [sp, #16]
    1bd0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    1bd4:	d65f03c0 	ret
    while (*path != '/' && *path != 0)
    1bd8:	aa0003f4 	mov	x20, x0
    1bdc:	aa0303f3 	mov	x19, x3
    1be0:	d2800002 	mov	x2, #0x0                   	// #0
    1be4:	17ffffeb 	b	1b90 <PathElementExtract+0x70>
    1be8:	d503201f 	nop
    1bec:	d503201f 	nop

0000000000001bf0 <InodeBlockMapping.part.0>:
static uint32_t InodeBlockMapping(struct Inode* inode, uint32_t block_num)
    1bf0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1bf4:	910003fd 	mov	x29, sp
    1bf8:	a90153f3 	stp	x19, x20, [sp, #16]
    block_num -= NR_DIRECT_BLOCKS;
    1bfc:	51001034 	sub	w20, w1, #0x4
    if (indirect_block_id < NR_INDIRECT_BLOCKS) {
    1c00:	7131fe9f 	cmp	w20, #0xc7f
    1c04:	540003a8 	b.hi	1c78 <InodeBlockMapping.part.0+0x88>  // b.pmore
        if ((addr = inode->addrs[NR_DIRECT_BLOCKS + indirect_block_id]) == 0) {
    1c08:	53077e93 	lsr	w19, w20, #7
    1c0c:	f90013f5 	str	x21, [sp, #32]
    1c10:	d37e6275 	ubfiz	x21, x19, #2, #25
    1c14:	8b150015 	add	x21, x0, x21
    1c18:	b9401ea0 	ldr	w0, [x21, #28]
    1c1c:	34000140 	cbz	w0, 1c44 <InodeBlockMapping.part.0+0x54>
        block_num -= indirect_block_id * MAX_INDIRECT_BLOCKS;
    1c20:	4b131e93 	sub	w19, w20, w19, lsl #7
    uint32_t* indirect_block = (uint32_t*)BlockRead(addr);
    1c24:	94000c1b 	bl	4c90 <BlockRead>
    1c28:	aa0003f4 	mov	x20, x0
    if ((addr = indirect_block[block_num]) == 0) {
    1c2c:	b8737800 	ldr	w0, [x0, x19, lsl #2]
    1c30:	34000180 	cbz	w0, 1c60 <InodeBlockMapping.part.0+0x70>
}
    1c34:	a94153f3 	ldp	x19, x20, [sp, #16]
    1c38:	f94013f5 	ldr	x21, [sp, #32]
    1c3c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1c40:	d65f03c0 	ret
        block_num -= indirect_block_id * MAX_INDIRECT_BLOCKS;
    1c44:	4b131e93 	sub	w19, w20, w19, lsl #7
            inode->addrs[NR_DIRECT_BLOCKS + indirect_block_id] = addr = BlockAlloc();
    1c48:	94000c1a 	bl	4cb0 <BlockAlloc>
    1c4c:	b9001ea0 	str	w0, [x21, #28]
    uint32_t* indirect_block = (uint32_t*)BlockRead(addr);
    1c50:	94000c10 	bl	4c90 <BlockRead>
    1c54:	aa0003f4 	mov	x20, x0
    if ((addr = indirect_block[block_num]) == 0) {
    1c58:	b8737800 	ldr	w0, [x0, x19, lsl #2]
    1c5c:	35fffec0 	cbnz	w0, 1c34 <InodeBlockMapping.part.0+0x44>
        indirect_block[block_num] = addr = BlockAlloc();
    1c60:	94000c14 	bl	4cb0 <BlockAlloc>
    1c64:	b8337a80 	str	w0, [x20, x19, lsl #2]
}
    1c68:	a94153f3 	ldp	x19, x20, [sp, #16]
        indirect_block[block_num] = addr = BlockAlloc();
    1c6c:	f94013f5 	ldr	x21, [sp, #32]
}
    1c70:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1c74:	d65f03c0 	ret
        printf("InodeBlockMapping: out of range");
    1c78:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1c7c:	91366000 	add	x0, x0, #0xd98
    1c80:	94000968 	bl	4220 <printf>
        return 0;
    1c84:	52800000 	mov	w0, #0x0                   	// #0
}
    1c88:	a94153f3 	ldp	x19, x20, [sp, #16]
    1c8c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1c90:	d65f03c0 	ret
    1c94:	d503201f 	nop
    1c98:	d503201f 	nop
    1c9c:	d503201f 	nop

0000000000001ca0 <MemFsInit>:
    MemFsRange.memfs_start = _binary_fs_img_start;
    1ca0:	f00000e2 	adrp	x2, 20000 <session_cwd+0xfa50>
    1ca4:	9116c043 	add	x3, x2, #0x5b0
    MemFsRange.memfs_nr_blocks = fs_img_len / BLOCK_SIZE;
    1ca8:	53097c21 	lsr	w1, w1, #9
    MemFsRange.memfs_start = _binary_fs_img_start;
    1cac:	f902d840 	str	x0, [x2, #1456]
    MemFsRange.memfs_nr_blocks = fs_img_len / BLOCK_SIZE;
    1cb0:	b9000861 	str	w1, [x3, #8]
}
    1cb4:	d65f03c0 	ret
    1cb8:	d503201f 	nop
    1cbc:	d503201f 	nop

0000000000001cc0 <ReadSuperBlock>:
{
    1cc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    1cc4:	910003fd 	mov	x29, sp
    1cc8:	f9000bf3 	str	x19, [sp, #16]
    1ccc:	aa0003f3 	mov	x19, x0
    uint8_t* block = BlockRead(ROOT_INUM);
    1cd0:	52800020 	mov	w0, #0x1                   	// #1
    1cd4:	94000bef 	bl	4c90 <BlockRead>
    1cd8:	aa0003e1 	mov	x1, x0
    memmove(sb, block, sizeof(*sb));
    1cdc:	aa1303e0 	mov	x0, x19
}
    1ce0:	f9400bf3 	ldr	x19, [sp, #16]
    memmove(sb, block, sizeof(*sb));
    1ce4:	d2800202 	mov	x2, #0x10                  	// #16
}
    1ce8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    memmove(sb, block, sizeof(*sb));
    1cec:	14001065 	b	5e80 <memmove>

0000000000001cf0 <InodeGet>:
{
    1cf0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    1cf4:	910003fd 	mov	x29, sp
    1cf8:	f9000bf3 	str	x19, [sp, #16]
    1cfc:	2a0003f3 	mov	w19, w0
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    1d00:	53027c00 	lsr	w0, w0, #2
    inode = (struct Inode*)block + INODE_INDEX(inum);
    1d04:	d3790673 	ubfiz	x19, x19, #7, #2
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    1d08:	11000800 	add	w0, w0, #0x2
    1d0c:	94000be1 	bl	4c90 <BlockRead>
}
    1d10:	8b130000 	add	x0, x0, x19
    1d14:	f9400bf3 	ldr	x19, [sp, #16]
    1d18:	a8c27bfd 	ldp	x29, x30, [sp], #32
    1d1c:	d65f03c0 	ret

0000000000001d20 <InodeRead>:
{
    1d20:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    1d24:	910003fd 	mov	x29, sp
    1d28:	a9046bf9 	stp	x25, x26, [sp, #64]
    if (len < 0 || offset > inode->size) {
    1d2c:	37f80a03 	tbnz	w3, #31, 1e6c <InodeRead+0x14c>
    1d30:	a90153f3 	stp	x19, x20, [sp, #16]
    1d34:	2a0203f3 	mov	w19, w2
    1d38:	a9025bf5 	stp	x21, x22, [sp, #32]
    1d3c:	a90363f7 	stp	x23, x24, [sp, #48]
    1d40:	aa0003f7 	mov	x23, x0
    1d44:	b9400816 	ldr	w22, [x0, #8]
    1d48:	6b0202df 	cmp	w22, w2
    1d4c:	54000863 	b.cc	1e58 <InodeRead+0x138>  // b.lo, b.ul, b.last
    if (offset + len > inode->size) {
    1d50:	0b020060 	add	w0, w3, w2
    1d54:	aa0103f5 	mov	x21, x1
    1d58:	6b0002df 	cmp	w22, w0
    1d5c:	54000563 	b.cc	1e08 <InodeRead+0xe8>  // b.lo, b.ul, b.last
    while (location < len) {
    1d60:	2a0303f6 	mov	w22, w3
    1d64:	2a0303f9 	mov	w25, w3
    location = 0;
    1d68:	52800014 	mov	w20, #0x0                   	// #0
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1d6c:	52804018 	mov	w24, #0x200                 	// #512
    while (location < len) {
    1d70:	34000556 	cbz	w22, 1e18 <InodeRead+0xf8>
    1d74:	f9002bfb 	str	x27, [sp, #80]
    1d78:	14000017 	b	1dd4 <InodeRead+0xb4>
    1d7c:	97ffff9d 	bl	1bf0 <InodeBlockMapping.part.0>
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1d80:	94000bc4 	bl	4c90 <BlockRead>
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1d84:	4b1402da 	sub	w26, w22, w20
    1d88:	6b1303e3 	negs	w3, w19
    1d8c:	12002261 	and	w1, w19, #0x1ff
    1d90:	12002063 	and	w3, w3, #0x1ff
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1d94:	aa0003e4 	mov	x4, x0
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1d98:	5a834421 	csneg	w1, w1, w3, mi  // mi = first
        memmove(dst, block + offset % BLOCK_SIZE, writen_len);
    1d9c:	aa1503e0 	mov	x0, x21
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1da0:	4b010302 	sub	w2, w24, w1
    1da4:	6b1a005f 	cmp	w2, w26
        memmove(dst, block + offset % BLOCK_SIZE, writen_len);
    1da8:	8b21c081 	add	x1, x4, w1, sxtw
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1dac:	1a9a905b 	csel	w27, w2, w26, ls  // ls = plast
        memmove(dst, block + offset % BLOCK_SIZE, writen_len);
    1db0:	1a9a905a 	csel	w26, w2, w26, ls  // ls = plast
    1db4:	aa1a03e2 	mov	x2, x26
        location += writen_len;
    1db8:	0b1b0294 	add	w20, w20, w27
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1dbc:	b40002c4 	cbz	x4, 1e14 <InodeRead+0xf4>
        memmove(dst, block + offset % BLOCK_SIZE, writen_len);
    1dc0:	94001030 	bl	5e80 <memmove>
        offset += writen_len;
    1dc4:	0b1b0273 	add	w19, w19, w27
        dst += writen_len;
    1dc8:	8b1a02b5 	add	x21, x21, x26
    while (location < len) {
    1dcc:	6b1402df 	cmp	w22, w20
    1dd0:	54000349 	b.ls	1e38 <InodeRead+0x118>  // b.plast
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1dd4:	7100027f 	cmp	w19, #0x0
    1dd8:	1107fe61 	add	w1, w19, #0x1ff
    1ddc:	1a93b021 	csel	w1, w1, w19, lt  // lt = tstop
    1de0:	aa1703e0 	mov	x0, x23
    if (block_num < NR_DIRECT_BLOCKS) {
    1de4:	711ffc3f 	cmp	w1, #0x7ff
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1de8:	13097c21 	asr	w1, w1, #9
    if (block_num < NR_DIRECT_BLOCKS) {
    1dec:	54fffc88 	b.hi	1d7c <InodeRead+0x5c>  // b.pmore
        if ((addr = inode->addrs[block_num]) == 0) {
    1df0:	8b214afa 	add	x26, x23, w1, uxtw #2
    1df4:	b9400f40 	ldr	w0, [x26, #12]
    1df8:	35fffc40 	cbnz	w0, 1d80 <InodeRead+0x60>
            inode->addrs[block_num] = addr = BlockAlloc();
    1dfc:	94000bad 	bl	4cb0 <BlockAlloc>
    1e00:	b9000f40 	str	w0, [x26, #12]
    1e04:	17ffffdf 	b	1d80 <InodeRead+0x60>
        len = inode->size - offset;
    1e08:	4b0202d6 	sub	w22, w22, w2
    1e0c:	2a1603f9 	mov	w25, w22
    1e10:	17ffffd6 	b	1d68 <InodeRead+0x48>
    1e14:	f9402bfb 	ldr	x27, [sp, #80]
    return len;
    1e18:	52800019 	mov	w25, #0x0                   	// #0
    1e1c:	a94153f3 	ldp	x19, x20, [sp, #16]
    1e20:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1e24:	a94363f7 	ldp	x23, x24, [sp, #48]
}
    1e28:	2a1903e0 	mov	w0, w25
    1e2c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    1e30:	a8c67bfd 	ldp	x29, x30, [sp], #96
    1e34:	d65f03c0 	ret
    1e38:	2a1903e0 	mov	w0, w25
    1e3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    1e40:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1e44:	a94363f7 	ldp	x23, x24, [sp, #48]
    1e48:	a9446bf9 	ldp	x25, x26, [sp, #64]
    1e4c:	f9402bfb 	ldr	x27, [sp, #80]
    1e50:	a8c67bfd 	ldp	x29, x30, [sp], #96
    1e54:	d65f03c0 	ret
        return -1;
    1e58:	12800019 	mov	w25, #0xffffffff            	// #-1
    1e5c:	a94153f3 	ldp	x19, x20, [sp, #16]
    1e60:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1e64:	a94363f7 	ldp	x23, x24, [sp, #48]
    1e68:	17fffff0 	b	1e28 <InodeRead+0x108>
    1e6c:	12800019 	mov	w25, #0xffffffff            	// #-1
    1e70:	17ffffee 	b	1e28 <InodeRead+0x108>
    1e74:	d503201f 	nop
    1e78:	d503201f 	nop
    1e7c:	d503201f 	nop

0000000000001e80 <DirInodeLookup>:
{
    1e80:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    1e84:	910003fd 	mov	x29, sp
    1e88:	a90153f3 	stp	x19, x20, [sp, #16]
    1e8c:	aa0003f4 	mov	x20, x0
    if (parent_inode->type != FS_DIRECTORY) {
    1e90:	b9400400 	ldr	w0, [x0, #4]
    1e94:	7100041f 	cmp	w0, #0x1
    1e98:	540004c1 	b.ne	1f30 <DirInodeLookup+0xb0>  // b.any
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    1e9c:	f90013f5 	str	x21, [sp, #32]
    1ea0:	52800013 	mov	w19, #0x0                   	// #0
    1ea4:	aa0103f5 	mov	x21, x1
    1ea8:	b9400a80 	ldr	w0, [x20, #8]
    1eac:	35000180 	cbnz	w0, 1edc <DirInodeLookup+0x5c>
    1eb0:	1400001b 	b	1f1c <DirInodeLookup+0x9c>
        if (de.inum == 0) {
    1eb4:	794063e3 	ldrh	w3, [sp, #48]
        if (strncmp((const char*)name, (const char*)de.name, DIR_NAME_SIZE) == 0) {
    1eb8:	9100cbe1 	add	x1, sp, #0x32
    1ebc:	aa1503e0 	mov	x0, x21
    1ec0:	d28003c2 	mov	x2, #0x1e                  	// #30
        if (de.inum == 0) {
    1ec4:	34000063 	cbz	w3, 1ed0 <DirInodeLookup+0x50>
        if (strncmp((const char*)name, (const char*)de.name, DIR_NAME_SIZE) == 0) {
    1ec8:	94001135 	bl	639c <strncmp>
    1ecc:	34000400 	cbz	w0, 1f4c <DirInodeLookup+0xcc>
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    1ed0:	b9400a82 	ldr	w2, [x20, #8]
    1ed4:	6b02027f 	cmp	w19, w2
    1ed8:	54000222 	b.cs	1f1c <DirInodeLookup+0x9c>  // b.hs, b.nlast
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    1edc:	2a1303e2 	mov	w2, w19
    1ee0:	9100c3e1 	add	x1, sp, #0x30
    1ee4:	aa1403e0 	mov	x0, x20
    1ee8:	52800403 	mov	w3, #0x20                  	// #32
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    1eec:	11008273 	add	w19, w19, #0x20
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    1ef0:	97ffff8c 	bl	1d20 <InodeRead>
    1ef4:	7100801f 	cmp	w0, #0x20
    1ef8:	54fffde0 	b.eq	1eb4 <DirInodeLookup+0x34>  // b.none
            printf("DirInodeAddEntry read");
    1efc:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1f00:	91374000 	add	x0, x0, #0xdd0
    1f04:	940008c7 	bl	4220 <printf>
            return 0;
    1f08:	d2800000 	mov	x0, #0x0                   	// #0
}
    1f0c:	a94153f3 	ldp	x19, x20, [sp, #16]
            return 0;
    1f10:	f94013f5 	ldr	x21, [sp, #32]
}
    1f14:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1f18:	d65f03c0 	ret
    return 0;
    1f1c:	d2800000 	mov	x0, #0x0                   	// #0
}
    1f20:	a94153f3 	ldp	x19, x20, [sp, #16]
    return 0;
    1f24:	f94013f5 	ldr	x21, [sp, #32]
}
    1f28:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1f2c:	d65f03c0 	ret
        printf("DirInodeLookup not DIR");
    1f30:	90000060 	adrp	x0, d000 <__ascii_wctomb+0x30>
    1f34:	9136e000 	add	x0, x0, #0xdb8
    1f38:	940008ba 	bl	4220 <printf>
        return 0;
    1f3c:	d2800000 	mov	x0, #0x0                   	// #0
}
    1f40:	a94153f3 	ldp	x19, x20, [sp, #16]
    1f44:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1f48:	d65f03c0 	ret
            inum = de.inum;
    1f4c:	794063f3 	ldrh	w19, [sp, #48]
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    1f50:	53027e60 	lsr	w0, w19, #2
    inode = (struct Inode*)block + INODE_INDEX(inum);
    1f54:	d3790673 	ubfiz	x19, x19, #7, #2
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    1f58:	11000800 	add	w0, w0, #0x2
    1f5c:	94000b4d 	bl	4c90 <BlockRead>
    inode = (struct Inode*)block + INODE_INDEX(inum);
    1f60:	8b130000 	add	x0, x0, x19
}
    1f64:	a94153f3 	ldp	x19, x20, [sp, #16]
            return InodeGet(inum);
    1f68:	f94013f5 	ldr	x21, [sp, #32]
}
    1f6c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    1f70:	d65f03c0 	ret
    1f74:	d503201f 	nop
    1f78:	d503201f 	nop
    1f7c:	d503201f 	nop

0000000000001f80 <InodeWrite>:
    if (len < 0 || offset > inode->size) {
    1f80:	37f80b03 	tbnz	w3, #31, 20e0 <InodeWrite+0x160>
{
    1f84:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    1f88:	910003fd 	mov	x29, sp
    1f8c:	a90153f3 	stp	x19, x20, [sp, #16]
    1f90:	2a0203f3 	mov	w19, w2
    1f94:	a90363f7 	stp	x23, x24, [sp, #48]
    1f98:	aa0003f8 	mov	x24, x0
    if (len < 0 || offset > inode->size) {
    1f9c:	b9400800 	ldr	w0, [x0, #8]
    1fa0:	6b02001f 	cmp	w0, w2
    1fa4:	54000943 	b.cc	20cc <InodeWrite+0x14c>  // b.lo, b.ul, b.last
    1fa8:	a9025bf5 	stp	x21, x22, [sp, #32]
    1fac:	aa0103f6 	mov	x22, x1
    if (offset + len > MAX_FILE_SIZE * BLOCK_SIZE) {
    1fb0:	0b020061 	add	w1, w3, w2
    1fb4:	52810000 	mov	w0, #0x800                 	// #2048
    1fb8:	72a00320 	movk	w0, #0x19, lsl #16
    1fbc:	2a0303f7 	mov	w23, w3
    1fc0:	6b00003f 	cmp	w1, w0
    1fc4:	54000888 	b.hi	20d4 <InodeWrite+0x154>  // b.pmore
    while (location < len) {
    1fc8:	a9046bf9 	stp	x25, x26, [sp, #64]
    location = 0;
    1fcc:	52800015 	mov	w21, #0x0                   	// #0
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1fd0:	52804019 	mov	w25, #0x200                 	// #512
    while (location < len) {
    1fd4:	35000303 	cbnz	w3, 2034 <InodeWrite+0xb4>
    1fd8:	14000024 	b	2068 <InodeWrite+0xe8>
    1fdc:	97ffff05 	bl	1bf0 <InodeBlockMapping.part.0>
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1fe0:	94000b2c 	bl	4c90 <BlockRead>
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1fe4:	4b1502f4 	sub	w20, w23, w21
    1fe8:	6b1303e1 	negs	w1, w19
    1fec:	12002263 	and	w3, w19, #0x1ff
    1ff0:	12002021 	and	w1, w1, #0x1ff
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    1ff4:	aa0003e4 	mov	x4, x0
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    1ff8:	5a814463 	csneg	w3, w3, w1, mi  // mi = first
        memmove(block + offset % BLOCK_SIZE, src, writen_len);
    1ffc:	aa1603e1 	mov	x1, x22
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    2000:	4b030322 	sub	w2, w25, w3
    2004:	6b14005f 	cmp	w2, w20
        memmove(block + offset % BLOCK_SIZE, src, writen_len);
    2008:	8b23c000 	add	x0, x0, w3, sxtw
        writen_len = MIN_LENGTH(len - location, BLOCK_SIZE - offset % BLOCK_SIZE);
    200c:	1a94905a 	csel	w26, w2, w20, ls  // ls = plast
        memmove(block + offset % BLOCK_SIZE, src, writen_len);
    2010:	1a949054 	csel	w20, w2, w20, ls  // ls = plast
    2014:	aa1403e2 	mov	x2, x20
        location += writen_len;
    2018:	0b1a02b5 	add	w21, w21, w26
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    201c:	b4000264 	cbz	x4, 2068 <InodeWrite+0xe8>
        memmove(block + offset % BLOCK_SIZE, src, writen_len);
    2020:	94000f98 	bl	5e80 <memmove>
        offset += writen_len;
    2024:	0b1a0273 	add	w19, w19, w26
        src += writen_len;
    2028:	8b1402d6 	add	x22, x22, x20
    while (location < len) {
    202c:	6b1702bf 	cmp	w21, w23
    2030:	540002a2 	b.cs	2084 <InodeWrite+0x104>  // b.hs, b.nlast
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    2034:	7100027f 	cmp	w19, #0x0
    2038:	1107fe61 	add	w1, w19, #0x1ff
    203c:	1a93b021 	csel	w1, w1, w19, lt  // lt = tstop
    2040:	aa1803e0 	mov	x0, x24
    if (block_num < NR_DIRECT_BLOCKS) {
    2044:	711ffc3f 	cmp	w1, #0x7ff
        if ((block = BlockRead(InodeBlockMapping(inode, offset / BLOCK_SIZE))) == 0) {
    2048:	13097c21 	asr	w1, w1, #9
    if (block_num < NR_DIRECT_BLOCKS) {
    204c:	54fffc88 	b.hi	1fdc <InodeWrite+0x5c>  // b.pmore
        if ((addr = inode->addrs[block_num]) == 0) {
    2050:	8b214b14 	add	x20, x24, w1, uxtw #2
    2054:	b9400e80 	ldr	w0, [x20, #12]
    2058:	35fffc40 	cbnz	w0, 1fe0 <InodeWrite+0x60>
            inode->addrs[block_num] = addr = BlockAlloc();
    205c:	94000b15 	bl	4cb0 <BlockAlloc>
    2060:	b9000e80 	str	w0, [x20, #12]
    2064:	17ffffdf 	b	1fe0 <InodeWrite+0x60>
    2068:	a9425bf5 	ldp	x21, x22, [sp, #32]
        inode->size = offset;
    206c:	52800000 	mov	w0, #0x0                   	// #0
    2070:	a9446bf9 	ldp	x25, x26, [sp, #64]
}
    2074:	a94153f3 	ldp	x19, x20, [sp, #16]
    2078:	a94363f7 	ldp	x23, x24, [sp, #48]
    207c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2080:	d65f03c0 	ret
    if (len > 0 && offset > inode->size) {
    2084:	34ffff37 	cbz	w23, 2068 <InodeWrite+0xe8>
    2088:	b9400b01 	ldr	w1, [x24, #8]
    208c:	2a1703e0 	mov	w0, w23
    2090:	6b01027f 	cmp	w19, w1
    2094:	54000109 	b.ls	20b4 <InodeWrite+0x134>  // b.plast
        inode->size = offset;
    2098:	b9000b13 	str	w19, [x24, #8]
}
    209c:	a94153f3 	ldp	x19, x20, [sp, #16]
    20a0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    20a4:	a94363f7 	ldp	x23, x24, [sp, #48]
    20a8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    20ac:	a8c57bfd 	ldp	x29, x30, [sp], #80
    20b0:	d65f03c0 	ret
    20b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    20b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    20bc:	a94363f7 	ldp	x23, x24, [sp, #48]
    20c0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    20c4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    20c8:	d65f03c0 	ret
        return -1;
    20cc:	12800000 	mov	w0, #0xffffffff            	// #-1
    20d0:	17ffffe9 	b	2074 <InodeWrite+0xf4>
    20d4:	12800000 	mov	w0, #0xffffffff            	// #-1
    20d8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    20dc:	17ffffe6 	b	2074 <InodeWrite+0xf4>
    20e0:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    20e4:	d65f03c0 	ret
    20e8:	d503201f 	nop
    20ec:	d503201f 	nop

00000000000020f0 <DirInodeAddEntry>:
{
    20f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    20f4:	910003fd 	mov	x29, sp
    20f8:	a90153f3 	stp	x19, x20, [sp, #16]
    20fc:	aa0003f4 	mov	x20, x0
    2100:	a90363f7 	stp	x23, x24, [sp, #48]
    2104:	2a0203f7 	mov	w23, w2
    2108:	aa0103f8 	mov	x24, x1
    if ((inode = DirInodeLookup(parent_inode, name)) != 0) {
    210c:	97ffff5d 	bl	1e80 <DirInodeLookup>
    2110:	b5000660 	cbnz	x0, 21dc <DirInodeAddEntry+0xec>
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2114:	a9025bf5 	stp	x21, x22, [sp, #32]
    2118:	910103f6 	add	x22, sp, #0x40
    211c:	b9400a80 	ldr	w0, [x20, #8]
    2120:	34000360 	cbz	w0, 218c <DirInodeAddEntry+0x9c>
    2124:	52800013 	mov	w19, #0x0                   	// #0
    2128:	52800015 	mov	w21, #0x0                   	// #0
    212c:	14000007 	b	2148 <DirInodeAddEntry+0x58>
        if (de.inum == 0) {
    2130:	794083e0 	ldrh	w0, [sp, #64]
    2134:	340002e0 	cbz	w0, 2190 <DirInodeAddEntry+0xa0>
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2138:	b9400a80 	ldr	w0, [x20, #8]
    213c:	2a1303f5 	mov	w21, w19
    2140:	6b00027f 	cmp	w19, w0
    2144:	54000262 	b.cs	2190 <DirInodeAddEntry+0xa0>  // b.hs, b.nlast
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    2148:	2a1503e2 	mov	w2, w21
    214c:	aa1603e1 	mov	x1, x22
    2150:	aa1403e0 	mov	x0, x20
    2154:	52800403 	mov	w3, #0x20                  	// #32
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2158:	11008273 	add	w19, w19, #0x20
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    215c:	97fffef1 	bl	1d20 <InodeRead>
    2160:	7100801f 	cmp	w0, #0x20
    2164:	54fffe60 	b.eq	2130 <DirInodeAddEntry+0x40>  // b.none
            printf("DirInodeAddEntry: read failed");
    2168:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    216c:	9137a000 	add	x0, x0, #0xde8
    2170:	9400082c 	bl	4220 <printf>
            return -1;
    2174:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    2178:	a94153f3 	ldp	x19, x20, [sp, #16]
            return -1;
    217c:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
    2180:	a94363f7 	ldp	x23, x24, [sp, #48]
    2184:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2188:	d65f03c0 	ret
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    218c:	52800015 	mov	w21, #0x0                   	// #0
    strncpy(de.name, name, DIR_NAME_SIZE);
    2190:	aa1803e1 	mov	x1, x24
    2194:	d28003c2 	mov	x2, #0x1e                  	// #30
    2198:	91010be0 	add	x0, sp, #0x42
    219c:	940010f1 	bl	6560 <strncpy>
    if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    21a0:	aa1603e1 	mov	x1, x22
    21a4:	2a1503e2 	mov	w2, w21
    21a8:	aa1403e0 	mov	x0, x20
    21ac:	52800403 	mov	w3, #0x20                  	// #32
    de.inum = inum;
    21b0:	790083f7 	strh	w23, [sp, #64]
    if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    21b4:	97ffff73 	bl	1f80 <InodeWrite>
    21b8:	2a0003e1 	mov	w1, w0
    return 0;
    21bc:	52800000 	mov	w0, #0x0                   	// #0
    if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    21c0:	7100803f 	cmp	w1, #0x20
    21c4:	54000101 	b.ne	21e4 <DirInodeAddEntry+0xf4>  // b.any
    21c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
}
    21cc:	a94153f3 	ldp	x19, x20, [sp, #16]
    21d0:	a94363f7 	ldp	x23, x24, [sp, #48]
    21d4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    21d8:	d65f03c0 	ret
        return -1;
    21dc:	12800000 	mov	w0, #0xffffffff            	// #-1
    21e0:	17fffffb 	b	21cc <DirInodeAddEntry+0xdc>
        printf("DirInodeAddEntry: write failed");
    21e4:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    21e8:	91382000 	add	x0, x0, #0xe08
    21ec:	9400080d 	bl	4220 <printf>
        return -1;
    21f0:	12800000 	mov	w0, #0xffffffff            	// #-1
    21f4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    21f8:	17fffff5 	b	21cc <DirInodeAddEntry+0xdc>
    21fc:	d503201f 	nop

0000000000002200 <InodeCreate>:
{
    2200:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    2204:	910003fd 	mov	x29, sp
    2208:	a9025bf5 	stp	x21, x22, [sp, #32]
    220c:	2a0203f6 	mov	w22, w2
    2210:	a90363f7 	stp	x23, x24, [sp, #48]
    2214:	aa0003f7 	mov	x23, x0
    2218:	aa0103f8 	mov	x24, x1
    if ((inode = DirInodeLookup(parent_inode, name)) != 0) {
    221c:	97ffff19 	bl	1e80 <DirInodeLookup>
    2220:	aa0003f5 	mov	x21, x0
    2224:	b4000220 	cbz	x0, 2268 <InodeCreate+0x68>
        if (type == FS_FILE && inode->type == FS_FILE) {
    2228:	71000adf 	cmp	w22, #0x2
    222c:	54000121 	b.ne	2250 <InodeCreate+0x50>  // b.any
    2230:	b9400400 	ldr	w0, [x0, #4]
        return 0;
    2234:	7100081f 	cmp	w0, #0x2
    2238:	9a9f02b5 	csel	x21, x21, xzr, eq  // eq = none
}
    223c:	aa1503e0 	mov	x0, x21
    2240:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2244:	a94363f7 	ldp	x23, x24, [sp, #48]
    2248:	a8c57bfd 	ldp	x29, x30, [sp], #80
    224c:	d65f03c0 	ret
        return 0;
    2250:	d2800015 	mov	x21, #0x0                   	// #0
}
    2254:	aa1503e0 	mov	x0, x21
    2258:	a9425bf5 	ldp	x21, x22, [sp, #32]
    225c:	a94363f7 	ldp	x23, x24, [sp, #48]
    2260:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2264:	d65f03c0 	ret
    uint8_t* block = BlockRead(ROOT_INUM);
    2268:	52800020 	mov	w0, #0x1                   	// #1
    226c:	94000a89 	bl	4c90 <BlockRead>
    memmove(sb, block, sizeof(*sb));
    2270:	d2800202 	mov	x2, #0x10                  	// #16
    2274:	aa0003e1 	mov	x1, x0
    2278:	910103e0 	add	x0, sp, #0x40
    227c:	94000f01 	bl	5e80 <memmove>
    for (inum = 1; inum < sb.ninodes; inum++) {
    2280:	b9404be0 	ldr	w0, [sp, #72]
    2284:	7100041f 	cmp	w0, #0x1
    2288:	54000489 	b.ls	2318 <InodeCreate+0x118>  // b.plast
    228c:	a90153f3 	stp	x19, x20, [sp, #16]
    2290:	d2800033 	mov	x19, #0x1                   	// #1
    2294:	14000005 	b	22a8 <InodeCreate+0xa8>
    2298:	b9404be0 	ldr	w0, [sp, #72]
    229c:	91000673 	add	x19, x19, #0x1
    22a0:	6b13001f 	cmp	w0, w19
    22a4:	54000389 	b.ls	2314 <InodeCreate+0x114>  // b.plast
        uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    22a8:	d342fe60 	lsr	x0, x19, #2
        inode = (struct Inode*)block + INODE_INDEX(inum);
    22ac:	d3790674 	ubfiz	x20, x19, #7, #2
        uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    22b0:	11000800 	add	w0, w0, #0x2
    22b4:	94000a77 	bl	4c90 <BlockRead>
        inode = (struct Inode*)block + INODE_INDEX(inum);
    22b8:	8b140014 	add	x20, x0, x20
        if (inode->type == 0) {
    22bc:	b9400680 	ldr	w0, [x20, #4]
    22c0:	35fffec0 	cbnz	w0, 2298 <InodeCreate+0x98>
            memset(inode, 0, sizeof(*inode));
    22c4:	aa1403e0 	mov	x0, x20
    22c8:	d2801002 	mov	x2, #0x80                  	// #128
    22cc:	52800001 	mov	w1, #0x0                   	// #0
    22d0:	94000f1c 	bl	5f40 <memset>
            inode->type = type;
    22d4:	29005a93 	stp	w19, w22, [x20]
    if (type == FS_DIRECTORY) {
    22d8:	710006df 	cmp	w22, #0x1
            inode->size = 0;
    22dc:	b9000a9f 	str	wzr, [x20, #8]
    if (type == FS_DIRECTORY) {
    22e0:	54000240 	b.eq	2328 <InodeCreate+0x128>  // b.none
    if (DirInodeAddEntry(parent_inode, name, inode->inum) < 0) {
    22e4:	b9400282 	ldr	w2, [x20]
    22e8:	aa1803e1 	mov	x1, x24
    22ec:	aa1703e0 	mov	x0, x23
    22f0:	97ffff80 	bl	20f0 <DirInodeAddEntry>
    22f4:	37f803c0 	tbnz	w0, #31, 236c <InodeCreate+0x16c>
    22f8:	aa1403f5 	mov	x21, x20
}
    22fc:	aa1503e0 	mov	x0, x21
    2300:	a94153f3 	ldp	x19, x20, [sp, #16]
    2304:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2308:	a94363f7 	ldp	x23, x24, [sp, #48]
    230c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    2310:	d65f03c0 	ret
    2314:	a94153f3 	ldp	x19, x20, [sp, #16]
        printf("InodeCreate: alloc Inode failed, no free inode\n");
    2318:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    231c:	913a0000 	add	x0, x0, #0xe80
    2320:	940007c0 	bl	4220 <printf>
        return 0;
    2324:	17ffffc6 	b	223c <InodeCreate+0x3c>
        if (DirInodeAddEntry(inode, ".", inode->inum) < 0 || DirInodeAddEntry(inode, "..", parent_inode->inum) < 0) {
    2328:	f0000041 	adrp	x1, d000 <__ascii_wctomb+0x30>
    232c:	2a1303e2 	mov	w2, w19
    2330:	aa1403e0 	mov	x0, x20
    2334:	9138a021 	add	x1, x1, #0xe28
    2338:	97ffff6e 	bl	20f0 <DirInodeAddEntry>
    233c:	37f800e0 	tbnz	w0, #31, 2358 <InodeCreate+0x158>
    2340:	b94002e2 	ldr	w2, [x23]
    2344:	f0000041 	adrp	x1, d000 <__ascii_wctomb+0x30>
    2348:	aa1403e0 	mov	x0, x20
    234c:	91394021 	add	x1, x1, #0xe50
    2350:	97ffff68 	bl	20f0 <DirInodeAddEntry>
    2354:	36fffc80 	tbz	w0, #31, 22e4 <InodeCreate+0xe4>
            printf("InodeCreate: create dots");
    2358:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    235c:	9138c000 	add	x0, x0, #0xe30
    2360:	940007b0 	bl	4220 <printf>
            return 0;
    2364:	a94153f3 	ldp	x19, x20, [sp, #16]
    2368:	17ffffb5 	b	223c <InodeCreate+0x3c>
        printf("InodeCreate: DirInodeAddEntry failed");
    236c:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    2370:	91396000 	add	x0, x0, #0xe58
    2374:	940007ab 	bl	4220 <printf>
        return 0;
    2378:	a94153f3 	ldp	x19, x20, [sp, #16]
    237c:	17ffffb0 	b	223c <InodeCreate+0x3c>

0000000000002380 <InodeFreeRecursive>:
{
    2380:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    2384:	910003fd 	mov	x29, sp
    2388:	a90153f3 	stp	x19, x20, [sp, #16]
    238c:	aa0003f4 	mov	x20, x0
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2390:	b9400800 	ldr	w0, [x0, #8]
    2394:	340006a0 	cbz	w0, 2468 <InodeFreeRecursive+0xe8>
    2398:	a9025bf5 	stp	x21, x22, [sp, #32]
        if (de.inum == 0 || strcmp(de.name, "..") == 0 || strcmp(de.name, ".") == 0) {
    239c:	f0000055 	adrp	x21, d000 <__ascii_wctomb+0x30>
    23a0:	913942b5 	add	x21, x21, #0xe50
    23a4:	f9001bf7 	str	x23, [sp, #48]
    23a8:	f0000057 	adrp	x23, d000 <__ascii_wctomb+0x30>
    23ac:	9138a2f7 	add	x23, x23, #0xe28
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    23b0:	52800013 	mov	w19, #0x0                   	// #0
    23b4:	d503201f 	nop
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    23b8:	2a1303e2 	mov	w2, w19
    23bc:	910103e1 	add	x1, sp, #0x40
    23c0:	aa1403e0 	mov	x0, x20
    23c4:	52800403 	mov	w3, #0x20                  	// #32
    23c8:	97fffe56 	bl	1d20 <InodeRead>
    23cc:	7100801f 	cmp	w0, #0x20
    23d0:	54000541 	b.ne	2478 <InodeFreeRecursive+0xf8>  // b.any
        if (de.inum == 0 || strcmp(de.name, "..") == 0 || strcmp(de.name, ".") == 0) {
    23d4:	794083e2 	ldrh	w2, [sp, #64]
    23d8:	aa1503e1 	mov	x1, x21
    23dc:	91010be0 	add	x0, sp, #0x42
    23e0:	34000382 	cbz	w2, 2450 <InodeFreeRecursive+0xd0>
    23e4:	94000f57 	bl	6140 <strcmp>
    23e8:	34000340 	cbz	w0, 2450 <InodeFreeRecursive+0xd0>
    23ec:	91010be0 	add	x0, sp, #0x42
    23f0:	aa1703e1 	mov	x1, x23
    23f4:	94000f53 	bl	6140 <strcmp>
    23f8:	340002c0 	cbz	w0, 2450 <InodeFreeRecursive+0xd0>
        inode = InodeGet(de.inum);
    23fc:	794083f6 	ldrh	w22, [sp, #64]
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    2400:	53027ec0 	lsr	w0, w22, #2
    inode = (struct Inode*)block + INODE_INDEX(inum);
    2404:	d37906d6 	ubfiz	x22, x22, #7, #2
    uint8_t* block = BlockRead(BLOCK_INDEX(inum));
    2408:	11000800 	add	w0, w0, #0x2
    240c:	94000a21 	bl	4c90 <BlockRead>
    inode = (struct Inode*)block + INODE_INDEX(inum);
    2410:	8b160000 	add	x0, x0, x22
        if (inode->type == FS_DIRECTORY) {
    2414:	b9400401 	ldr	w1, [x0, #4]
    2418:	7100043f 	cmp	w1, #0x1
    241c:	54000400 	b.eq	249c <InodeFreeRecursive+0x11c>  // b.none
        } else if (inode->type == FS_FILE) {
    2420:	7100083f 	cmp	w1, #0x2
    2424:	54000041 	b.ne	242c <InodeFreeRecursive+0xac>  // b.any
            inode->type = 0;
    2428:	b900041f 	str	wzr, [x0, #4]
        if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    242c:	2a1303e2 	mov	w2, w19
    2430:	910103e1 	add	x1, sp, #0x40
    2434:	aa1403e0 	mov	x0, x20
    2438:	52800403 	mov	w3, #0x20                  	// #32
        de.inum = 0;
    243c:	790083ff 	strh	wzr, [sp, #64]
        if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    2440:	97fffed0 	bl	1f80 <InodeWrite>
    2444:	7100801f 	cmp	w0, #0x20
    2448:	54000361 	b.ne	24b4 <InodeFreeRecursive+0x134>  // b.any
    244c:	d503201f 	nop
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2450:	b9400a80 	ldr	w0, [x20, #8]
    2454:	11008273 	add	w19, w19, #0x20
    2458:	6b13001f 	cmp	w0, w19
    245c:	54fffae8 	b.hi	23b8 <InodeFreeRecursive+0x38>  // b.pmore
    2460:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2464:	f9401bf7 	ldr	x23, [sp, #48]
    return 0;
    2468:	52800000 	mov	w0, #0x0                   	// #0
}
    246c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2470:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2474:	d65f03c0 	ret
            printf("inode_delete_dir failed: read directory entry failed");
    2478:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    247c:	913ac000 	add	x0, x0, #0xeb0
    2480:	94000768 	bl	4220 <printf>
            return -1;
    2484:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    2488:	a94153f3 	ldp	x19, x20, [sp, #16]
            return -1;
    248c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2490:	f9401bf7 	ldr	x23, [sp, #48]
}
    2494:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2498:	d65f03c0 	ret
            if (InodeFreeRecursive(inode) < 0) {
    249c:	97ffffb9 	bl	2380 <InodeFreeRecursive>
    24a0:	36fffc60 	tbz	w0, #31, 242c <InodeFreeRecursive+0xac>
                return -1;
    24a4:	12800000 	mov	w0, #0xffffffff            	// #-1
    24a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    24ac:	f9401bf7 	ldr	x23, [sp, #48]
    24b0:	17ffffef 	b	246c <InodeFreeRecursive+0xec>
            printf("InodeDelete failed: clear directory entry failed");
    24b4:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    24b8:	913ba000 	add	x0, x0, #0xee8
    24bc:	94000759 	bl	4220 <printf>
            return -1;
    24c0:	12800000 	mov	w0, #0xffffffff            	// #-1
    24c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    24c8:	f9401bf7 	ldr	x23, [sp, #48]
    24cc:	17ffffe8 	b	246c <InodeFreeRecursive+0xec>

00000000000024d0 <InodeDelete>:
{
    24d0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    24d4:	910003fd 	mov	x29, sp
    24d8:	a90153f3 	stp	x19, x20, [sp, #16]
    24dc:	aa0003f4 	mov	x20, x0
    24e0:	a9025bf5 	stp	x21, x22, [sp, #32]
    24e4:	aa0103f6 	mov	x22, x1
    if ((inode = DirInodeLookup(parent_inode, name)) == 0) {
    24e8:	97fffe66 	bl	1e80 <DirInodeLookup>
    24ec:	b4000840 	cbz	x0, 25f4 <InodeDelete+0x124>
    if (inode->type == FS_FILE) {
    24f0:	b9400402 	ldr	w2, [x0, #4]
    24f4:	7100085f 	cmp	w2, #0x2
    24f8:	54000680 	b.eq	25c8 <InodeDelete+0xf8>  // b.none
    } else if (inode->type == FS_DIRECTORY) {
    24fc:	7100045f 	cmp	w2, #0x1
    2500:	54000680 	b.eq	25d0 <InodeDelete+0x100>  // b.none
    if ((inode = DirInodeLookup(parent_inode, name)) == 0) {
    2504:	aa1603e1 	mov	x1, x22
    2508:	aa1403e0 	mov	x0, x20
    250c:	97fffe5d 	bl	1e80 <DirInodeLookup>
    2510:	b40003a0 	cbz	x0, 2584 <InodeDelete+0xb4>
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2514:	f9001bf7 	str	x23, [sp, #48]
    2518:	910103f7 	add	x23, sp, #0x40
    251c:	b9400a80 	ldr	w0, [x20, #8]
    2520:	340003c0 	cbz	w0, 2598 <InodeDelete+0xc8>
    2524:	52800013 	mov	w19, #0x0                   	// #0
    2528:	52800015 	mov	w21, #0x0                   	// #0
    252c:	1400000a 	b	2554 <InodeDelete+0x84>
        if (strncmp(de.name, name, DIR_NAME_SIZE) == 0) {
    2530:	aa1603e1 	mov	x1, x22
    2534:	91010be0 	add	x0, sp, #0x42
    2538:	d28003c2 	mov	x2, #0x1e                  	// #30
    253c:	94000f98 	bl	639c <strncmp>
    2540:	34000300 	cbz	w0, 25a0 <InodeDelete+0xd0>
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2544:	b9400a80 	ldr	w0, [x20, #8]
    2548:	2a1303f5 	mov	w21, w19
    254c:	6b00027f 	cmp	w19, w0
    2550:	54000282 	b.cs	25a0 <InodeDelete+0xd0>  // b.hs, b.nlast
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    2554:	2a1503e2 	mov	w2, w21
    2558:	aa1703e1 	mov	x1, x23
    255c:	aa1403e0 	mov	x0, x20
    2560:	52800403 	mov	w3, #0x20                  	// #32
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2564:	11008273 	add	w19, w19, #0x20
        if (InodeRead(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    2568:	97fffdee 	bl	1d20 <InodeRead>
    256c:	7100801f 	cmp	w0, #0x20
    2570:	54fffe00 	b.eq	2530 <InodeDelete+0x60>  // b.none
            printf("DirInodeAddEntry: read failed");
    2574:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    2578:	9137a000 	add	x0, x0, #0xde8
    257c:	94000729 	bl	4220 <printf>
            return -1;
    2580:	f9401bf7 	ldr	x23, [sp, #48]
    return 0;
    2584:	52800000 	mov	w0, #0x0                   	// #0
}
    2588:	a94153f3 	ldp	x19, x20, [sp, #16]
    258c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    2590:	a8c67bfd 	ldp	x29, x30, [sp], #96
    2594:	d65f03c0 	ret
    for (offset = 0; offset < parent_inode->size; offset += sizeof(de)) {
    2598:	52800015 	mov	w21, #0x0                   	// #0
    259c:	d503201f 	nop
    if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    25a0:	2a1503e2 	mov	w2, w21
    25a4:	aa1703e1 	mov	x1, x23
    25a8:	aa1403e0 	mov	x0, x20
    25ac:	52800403 	mov	w3, #0x20                  	// #32
    de.inum = 0;
    25b0:	790083ff 	strh	wzr, [sp, #64]
    if (InodeWrite(parent_inode, (char*)&de, offset, sizeof(de)) != sizeof(de)) {
    25b4:	97fffe73 	bl	1f80 <InodeWrite>
    25b8:	7100801f 	cmp	w0, #0x20
    25bc:	54000121 	b.ne	25e0 <InodeDelete+0x110>  // b.any
    25c0:	f9401bf7 	ldr	x23, [sp, #48]
    25c4:	17fffff0 	b	2584 <InodeDelete+0xb4>
        inode->type = 0;
    25c8:	b900041f 	str	wzr, [x0, #4]
    25cc:	17ffffce 	b	2504 <InodeDelete+0x34>
        if (InodeFreeRecursive(inode) < 0) {
    25d0:	97ffff6c 	bl	2380 <InodeFreeRecursive>
    25d4:	36fff980 	tbz	w0, #31, 2504 <InodeDelete+0x34>
            return -1;
    25d8:	12800000 	mov	w0, #0xffffffff            	// #-1
    25dc:	17ffffeb 	b	2588 <InodeDelete+0xb8>
        printf("DirInodeAddEntry: write failed");
    25e0:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    25e4:	91382000 	add	x0, x0, #0xe08
    25e8:	9400070e 	bl	4220 <printf>
    25ec:	f9401bf7 	ldr	x23, [sp, #48]
        return -1;
    25f0:	17ffffe5 	b	2584 <InodeDelete+0xb4>
        printf("Inode delete failed, file not exsit");
    25f4:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    25f8:	913c8000 	add	x0, x0, #0xf20
    25fc:	94000709 	bl	4220 <printf>
        return -1;
    2600:	12800000 	mov	w0, #0xffffffff            	// #-1
    2604:	17ffffe1 	b	2588 <InodeDelete+0xb8>
    2608:	d503201f 	nop
    260c:	d503201f 	nop

0000000000002610 <InodeSeek>:
{
    2610:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    2614:	910003fd 	mov	x29, sp
    2618:	a90153f3 	stp	x19, x20, [sp, #16]
    261c:	aa0003f3 	mov	x19, x0
    if (source->size == 0) {
    2620:	b9400800 	ldr	w0, [x0, #8]
    2624:	34000360 	cbz	w0, 2690 <InodeSeek+0x80>
    2628:	aa0103f4 	mov	x20, x1
    char name[DIR_NAME_SIZE] = { 0 };
    262c:	a9027fff 	stp	xzr, xzr, [sp, #32]
    2630:	f9001bff 	str	xzr, [sp, #48]
    2634:	b9003bff 	str	wzr, [sp, #56]
    2638:	79007bff 	strh	wzr, [sp, #60]
    while ((path = PathElementExtract(path, name)) != 0) {
    263c:	14000007 	b	2658 <InodeSeek+0x48>
        if (cur_inode->type != FS_DIRECTORY) {
    2640:	b9400662 	ldr	w2, [x19, #4]
    2644:	7100045f 	cmp	w2, #0x1
    2648:	540001c1 	b.ne	2680 <InodeSeek+0x70>  // b.any
        if ((next_inode = DirInodeLookup(cur_inode, name)) == 0) {
    264c:	97fffe0d 	bl	1e80 <DirInodeLookup>
    2650:	aa0003f3 	mov	x19, x0
    2654:	b4000160 	cbz	x0, 2680 <InodeSeek+0x70>
    while ((path = PathElementExtract(path, name)) != 0) {
    2658:	aa1403e0 	mov	x0, x20
    265c:	910083e1 	add	x1, sp, #0x20
    2660:	97fffd30 	bl	1b20 <PathElementExtract>
    2664:	aa0003f4 	mov	x20, x0
        if ((next_inode = DirInodeLookup(cur_inode, name)) == 0) {
    2668:	910083e1 	add	x1, sp, #0x20
    266c:	aa1303e0 	mov	x0, x19
    while ((path = PathElementExtract(path, name)) != 0) {
    2670:	b5fffe94 	cbnz	x20, 2640 <InodeSeek+0x30>
}
    2674:	a94153f3 	ldp	x19, x20, [sp, #16]
    2678:	a8c47bfd 	ldp	x29, x30, [sp], #64
    267c:	d65f03c0 	ret
            return NULL;
    2680:	d2800000 	mov	x0, #0x0                   	// #0
}
    2684:	a94153f3 	ldp	x19, x20, [sp, #16]
    2688:	a8c47bfd 	ldp	x29, x30, [sp], #64
    268c:	d65f03c0 	ret
        printf("Inode is empty\n");
    2690:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    2694:	913d2000 	add	x0, x0, #0xf48
    2698:	940006e2 	bl	4220 <printf>
        return 0;
    269c:	d2800000 	mov	x0, #0x0                   	// #0
    26a0:	17fffff5 	b	2674 <InodeSeek+0x64>
    26a4:	d503201f 	nop
    26a8:	d503201f 	nop
    26ac:	d503201f 	nop

00000000000026b0 <InodeParentSeek>:
{
    26b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    26b4:	910003fd 	mov	x29, sp
    26b8:	a90153f3 	stp	x19, x20, [sp, #16]
    26bc:	aa0003f3 	mov	x19, x0
    if (source->size == 0) {
    26c0:	b9400800 	ldr	w0, [x0, #8]
    26c4:	340003c0 	cbz	w0, 273c <InodeParentSeek+0x8c>
    26c8:	aa0103f4 	mov	x20, x1
    26cc:	f90013f5 	str	x21, [sp, #32]
    26d0:	aa0203f5 	mov	x21, x2
    26d4:	14000009 	b	26f8 <InodeParentSeek+0x48>
        if (cur_inode->type != FS_DIRECTORY) {
    26d8:	b9400662 	ldr	w2, [x19, #4]
    26dc:	7100045f 	cmp	w2, #0x1
    26e0:	540001a1 	b.ne	2714 <InodeParentSeek+0x64>  // b.any
        if (*path == '\0') {
    26e4:	39400282 	ldrb	w2, [x20]
    26e8:	34000202 	cbz	w2, 2728 <InodeParentSeek+0x78>
        if ((next_inode = DirInodeLookup(cur_inode, name)) == 0) {
    26ec:	97fffde5 	bl	1e80 <DirInodeLookup>
    26f0:	aa0003f3 	mov	x19, x0
    26f4:	b4000100 	cbz	x0, 2714 <InodeParentSeek+0x64>
    while ((path = PathElementExtract(path, name)) != 0) {
    26f8:	aa1403e0 	mov	x0, x20
    26fc:	aa1503e1 	mov	x1, x21
    2700:	97fffd08 	bl	1b20 <PathElementExtract>
    2704:	aa0003f4 	mov	x20, x0
        if ((next_inode = DirInodeLookup(cur_inode, name)) == 0) {
    2708:	aa1503e1 	mov	x1, x21
    270c:	aa1303e0 	mov	x0, x19
    while ((path = PathElementExtract(path, name)) != 0) {
    2710:	b5fffe54 	cbnz	x20, 26d8 <InodeParentSeek+0x28>
    2714:	f94013f5 	ldr	x21, [sp, #32]
            return NULL;
    2718:	d2800000 	mov	x0, #0x0                   	// #0
}
    271c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2720:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2724:	d65f03c0 	ret
    2728:	aa1303e0 	mov	x0, x19
    272c:	a94153f3 	ldp	x19, x20, [sp, #16]
    2730:	f94013f5 	ldr	x21, [sp, #32]
    2734:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2738:	d65f03c0 	ret
        printf("Inode is empty\n");
    273c:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    2740:	913d2000 	add	x0, x0, #0xf48
    2744:	940006b7 	bl	4220 <printf>
        return 0;
    2748:	d2800000 	mov	x0, #0x0                   	// #0
    274c:	17fffff4 	b	271c <InodeParentSeek+0x6c>

0000000000002750 <GetFileDescriptor>:

struct FileDescriptor* GetFileDescriptor(int fd)
{
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
    2750:	7140041f 	cmp	w0, #0x1, lsl #12
    2754:	540000c8 	b.hi	276c <GetFileDescriptor+0x1c>  // b.pmore
        printf("fd invlid.\n");
        return NULL;
    }
    return &fd_table[fd];
    2758:	d00000e1 	adrp	x1, 20000 <session_cwd+0xfa50>
    275c:	91170021 	add	x1, x1, #0x5c0
    2760:	52801102 	mov	w2, #0x88                  	// #136
    2764:	9b220400 	smaddl	x0, w0, w2, x1
}
    2768:	d65f03c0 	ret
{
    276c:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        printf("fd invlid.\n");
    2770:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    2774:	913d6000 	add	x0, x0, #0xf58
{
    2778:	910003fd 	mov	x29, sp
        printf("fd invlid.\n");
    277c:	940006a9 	bl	4220 <printf>
        return NULL;
    2780:	d2800000 	mov	x0, #0x0                   	// #0
}
    2784:	a8c17bfd 	ldp	x29, x30, [sp], #16
    2788:	d65f03c0 	ret
    278c:	d503201f 	nop

0000000000002790 <FreeFileDescriptor>:

void FreeFileDescriptor(int fd)
{
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
    2790:	7140041f 	cmp	w0, #0x1, lsl #12
    2794:	54000108 	b.hi	27b4 <FreeFileDescriptor+0x24>  // b.pmore
        printf("fd invlid.\n");
        return;
    }
    fd_table[fd].data = NULL;
    2798:	93407c00 	sxtw	x0, w0
    279c:	d00000e1 	adrp	x1, 20000 <session_cwd+0xfa50>
    27a0:	91170021 	add	x1, x1, #0x5c0
    27a4:	d2801102 	mov	x2, #0x88                  	// #136
    27a8:	9b020400 	madd	x0, x0, x2, x1
    27ac:	f900401f 	str	xzr, [x0, #128]
    return;
}
    27b0:	d65f03c0 	ret
        printf("fd invlid.\n");
    27b4:	f0000040 	adrp	x0, d000 <__ascii_wctomb+0x30>
    27b8:	913d6000 	add	x0, x0, #0xf58
    27bc:	14000699 	b	4220 <printf>

00000000000027c0 <AllocFileDescriptor>:

int AllocFileDescriptor(void)
{
    int free_idx = -1;
    for (int i = 0; i < MAX_SUPPORT_FD; i++) {
    27c0:	d00000e1 	adrp	x1, 20000 <session_cwd+0xfa50>
    27c4:	91170021 	add	x1, x1, #0x5c0
    27c8:	52800000 	mov	w0, #0x0                   	// #0
    27cc:	14000004 	b	27dc <AllocFileDescriptor+0x1c>
    27d0:	11000400 	add	w0, w0, #0x1
    27d4:	7140041f 	cmp	w0, #0x1, lsl #12
    27d8:	540000a0 	b.eq	27ec <AllocFileDescriptor+0x2c>  // b.none
        // found free fd
        if (free_idx == -1 && fd_table[i].data == NULL) {
    27dc:	f9404022 	ldr	x2, [x1, #128]
    for (int i = 0; i < MAX_SUPPORT_FD; i++) {
    27e0:	91022021 	add	x1, x1, #0x88
        if (free_idx == -1 && fd_table[i].data == NULL) {
    27e4:	b5ffff62 	cbnz	x2, 27d0 <AllocFileDescriptor+0x10>
    }
    if (free_idx == -1) {
        return -1;
    }
    return free_idx;
}
    27e8:	d65f03c0 	ret
        return -1;
    27ec:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    27f0:	d65f03c0 	ret
    27f4:	d503201f 	nop
    27f8:	d503201f 	nop
    27fc:	d503201f 	nop

0000000000002800 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
    2800:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
    2804:	52800020 	mov	w0, #0x1                   	// #1
{
    2808:	910003fd 	mov	x29, sp
    280c:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
    2810:	d0000533 	adrp	x19, a8000 <_stack+0x28000>
    2814:	b945c261 	ldr	w1, [x19, #1472]
    2818:	34000081 	cbz	w1, 2828 <init_uart_mmio+0x28>
}
    281c:	f9400bf3 	ldr	x19, [sp, #16]
    2820:	a8c27bfd 	ldp	x29, x30, [sp], #32
    2824:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
    2828:	2a0003e3 	mov	w3, w0
    282c:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
    2830:	52820002 	mov	w2, #0x1000                	// #4096
    2834:	aa0103e0 	mov	x0, x1
    2838:	94000a2e 	bl	50f0 <mmap>
    283c:	3100041f 	cmn	w0, #0x1
            return false;
    2840:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
    2844:	54fffec0 	b.eq	281c <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
    2848:	52800021 	mov	w1, #0x1                   	// #1
    return true;
    284c:	2a0103e0 	mov	w0, w1
        mapped = 1;
    2850:	b905c261 	str	w1, [x19, #1472]
}
    2854:	f9400bf3 	ldr	x19, [sp, #16]
    2858:	a8c27bfd 	ldp	x29, x30, [sp], #32
    285c:	d65f03c0 	ret

0000000000002860 <putc>:

void putc(char ch)
{
    2860:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
    2864:	7100281f 	cmp	w0, #0xa
    2868:	540000c0 	b.eq	2880 <putc+0x20>  // b.none
    return in_le32(addr);
    286c:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
    2870:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
    2874:	362fffe1 	tbz	w1, #5, 2870 <putc+0x10>
    out_le32(addr, value);
    2878:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
    287c:	d65f03c0 	ret
    return in_le32(addr);
    2880:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
    2884:	d503201f 	nop
    2888:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
    288c:	362fffe1 	tbz	w1, #5, 2888 <putc+0x28>
    out_le32(addr, value);
    2890:	528001a1 	mov	w1, #0xd                   	// #13
    2894:	b9000041 	str	w1, [x2]
}
    2898:	17fffff5 	b	286c <putc+0xc>
    289c:	d503201f 	nop

00000000000028a0 <getc>:
    return in_le32(addr);
    28a0:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
    28a4:	d503201f 	nop
    28a8:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
    28ac:	3607ffe0 	tbz	w0, #0, 28a8 <getc+0x8>
    return in_le32(addr);
    28b0:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
    28b4:	d65f03c0 	ret
    28b8:	d503201f 	nop
    28bc:	d503201f 	nop

00000000000028c0 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
    28c0:	eb03005f 	cmp	x2, x3
{
    28c4:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
    28c8:	54000042 	b.cs	28d0 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
    28cc:	38226820 	strb	w0, [x1, x2]
    }
}
    28d0:	d65f03c0 	ret
    28d4:	d503201f 	nop
    28d8:	d503201f 	nop
    28dc:	d503201f 	nop

00000000000028e0 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
    28e0:	d65f03c0 	ret
    28e4:	d503201f 	nop
    28e8:	d503201f 	nop
    28ec:	d503201f 	nop

00000000000028f0 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
    28f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    28f4:	910003fd 	mov	x29, sp
    28f8:	a90153f3 	stp	x19, x20, [sp, #16]
    28fc:	aa0503f3 	mov	x19, x5
    2900:	aa0203f4 	mov	x20, x2
    2904:	a9025bf5 	stp	x21, x22, [sp, #32]
    2908:	aa0003f5 	mov	x21, x0
    290c:	aa0103f6 	mov	x22, x1
    2910:	a90363f7 	stp	x23, x24, [sp, #48]
    2914:	aa0203f7 	mov	x23, x2
    2918:	aa0403f8 	mov	x24, x4
    291c:	a9046bf9 	stp	x25, x26, [sp, #64]
    2920:	2a0703fa 	mov	w26, w7
    2924:	2a0603f9 	mov	w25, w6
    2928:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
    292c:	f240075f 	tst	x26, #0x3
{
    2930:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
    2934:	540001e1 	b.ne	2970 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
    2938:	2a0603e0 	mov	w0, w6
    293c:	aa0203fc 	mov	x28, x2
    2940:	cb050014 	sub	x20, x0, x5
    2944:	eb0000bf 	cmp	x5, x0
    2948:	8b020294 	add	x20, x20, x2
    294c:	54000542 	b.cs	29f4 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
    2950:	aa1c03e2 	mov	x2, x28
    2954:	aa1b03e3 	mov	x3, x27
    2958:	9100079c 	add	x28, x28, #0x1
    295c:	aa1603e1 	mov	x1, x22
    2960:	52800400 	mov	w0, #0x20                  	// #32
    2964:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
    2968:	eb1c029f 	cmp	x20, x28
    296c:	54ffff21 	b.ne	2950 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
    2970:	8b14027c 	add	x28, x19, x20
    2974:	b4000133 	cbz	x19, 2998 <_out_rev+0xa8>
    2978:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
    297c:	d1000673 	sub	x19, x19, #0x1
    2980:	aa1c03f4 	mov	x20, x28
    2984:	aa1b03e3 	mov	x3, x27
    2988:	aa1603e1 	mov	x1, x22
    298c:	38736b00 	ldrb	w0, [x24, x19]
    2990:	d63f02a0 	blr	x21
    while (len) {
    2994:	b5ffff33 	cbnz	x19, 2978 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
    2998:	360801fa 	tbz	w26, #1, 29d4 <_out_rev+0xe4>
        while (idx - start_idx < width) {
    299c:	cb170297 	sub	x23, x20, x23
    29a0:	2a1903f9 	mov	w25, w25
    29a4:	eb1902ff 	cmp	x23, x25
    29a8:	54000162 	b.cs	29d4 <_out_rev+0xe4>  // b.hs, b.nlast
    29ac:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
    29b0:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
    29b4:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
    29b8:	aa1b03e3 	mov	x3, x27
    29bc:	aa1603e1 	mov	x1, x22
    29c0:	52800400 	mov	w0, #0x20                  	// #32
    29c4:	d63f02a0 	blr	x21
    29c8:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
    29cc:	eb1902ff 	cmp	x23, x25
    29d0:	54ffff03 	b.cc	29b0 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
    29d4:	aa1403e0 	mov	x0, x20
    29d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    29dc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    29e0:	a94363f7 	ldp	x23, x24, [sp, #48]
    29e4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    29e8:	a94573fb 	ldp	x27, x28, [sp, #80]
    29ec:	a8c67bfd 	ldp	x29, x30, [sp], #96
    29f0:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
    29f4:	aa0203f4 	mov	x20, x2
    29f8:	17ffffde 	b	2970 <_out_rev+0x80>
    29fc:	d503201f 	nop

0000000000002a00 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
    2a00:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    2a04:	aa0603eb 	mov	x11, x6
    2a08:	aa0403e9 	mov	x9, x4
    2a0c:	910003fd 	mov	x29, sp
    2a10:	b9403be8 	ldr	w8, [sp, #56]
    2a14:	2a0703ef 	mov	w15, w7
    2a18:	b94033e6 	ldr	w6, [sp, #48]
    2a1c:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
    2a20:	12160110 	and	w16, w8, #0x400
    if (!value) {
    2a24:	b5000c64 	cbnz	x4, 2bb0 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
    2a28:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
    2a2c:	34000730 	cbz	w16, 2b10 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
    2a30:	121f0111 	and	w17, w8, #0x2
    2a34:	37080fc8 	tbnz	w8, #1, 2c2c <_ntoa_long+0x22c>
    size_t len = 0U;
    2a38:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a3c:	2a0f03e9 	mov	w9, w15
    2a40:	f1007cbf 	cmp	x5, #0x1f
    2a44:	910043e4 	add	x4, sp, #0x10
    2a48:	1a9f87ea 	cset	w10, ls  // ls = plast
    2a4c:	eb05013f 	cmp	x9, x5
    2a50:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    2a54:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a58:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    2a5c:	350009c6 	cbnz	w6, 2b94 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a60:	34000108 	cbz	w8, 2a80 <_ntoa_long+0x80>
            buf[len++] = '0';
    2a64:	5280060a 	mov	w10, #0x30                  	// #48
    2a68:	910004a5 	add	x5, x5, #0x1
    2a6c:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a70:	eb05013f 	cmp	x9, x5
    2a74:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
    2a78:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a7c:	54ffff69 	b.ls	2a68 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2a80:	340001cc 	cbz	w12, 2ab8 <_ntoa_long+0xb8>
    2a84:	f1007cbf 	cmp	x5, #0x1f
    2a88:	1a9f87ea 	cset	w10, ls  // ls = plast
    2a8c:	7100015f 	cmp	w10, #0x0
    2a90:	2a0603e9 	mov	w9, w6
    2a94:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
    2a98:	54000109 	b.ls	2ab8 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
    2a9c:	5280060a 	mov	w10, #0x30                  	// #48
    2aa0:	910004a5 	add	x5, x5, #0x1
    2aa4:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2aa8:	eb05013f 	cmp	x9, x5
    2aac:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
    2ab0:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2ab4:	54ffff69 	b.ls	2aa0 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
    2ab8:	340001b1 	cbz	w17, 2aec <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
    2abc:	350008b0 	cbnz	w16, 2bd0 <_ntoa_long+0x1d0>
    2ac0:	b50007e5 	cbnz	x5, 2bbc <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2ac4:	f100417f 	cmp	x11, #0x10
    2ac8:	54000f20 	b.eq	2cac <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2acc:	f100097f 	cmp	x11, #0x2
    2ad0:	54000f21 	b.ne	2cb4 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
    2ad4:	52800c48 	mov	w8, #0x62                  	// #98
    2ad8:	d2800025 	mov	x5, #0x1                   	// #1
    2adc:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
    2ae0:	52800608 	mov	w8, #0x30                  	// #48
    2ae4:	38256888 	strb	w8, [x4, x5]
    2ae8:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
    2aec:	f10080bf 	cmp	x5, #0x20
    2af0:	540000a0 	b.eq	2b04 <_ntoa_long+0x104>  // b.none
        if (negative) {
    2af4:	340008d2 	cbz	w18, 2c0c <_ntoa_long+0x20c>
            buf[len++] = '-';
    2af8:	528005a8 	mov	w8, #0x2d                  	// #45
    2afc:	38256888 	strb	w8, [x4, x5]
    2b00:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    2b04:	97ffff7b 	bl	28f0 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
    2b08:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2b0c:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
    2b10:	52800011 	mov	w17, #0x0                   	// #0
    2b14:	f27b00ff 	tst	x7, #0x20
    2b18:	52800c24 	mov	w4, #0x61                  	// #97
    2b1c:	5280082e 	mov	w14, #0x41                  	// #65
    2b20:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    2b24:	510029ce 	sub	w14, w14, #0xa
    2b28:	910043e4 	add	x4, sp, #0x10
    2b2c:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
    2b30:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    2b34:	910004a5 	add	x5, x5, #0x1
    2b38:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
    2b3c:	9b0ba58a 	msub	x10, x12, x11, x9
    2b40:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    2b44:	f100255f 	cmp	x10, #0x9
    2b48:	1100c10a 	add	w10, w8, #0x30
    2b4c:	0b0e0108 	add	w8, w8, w14
    2b50:	12001d4a 	and	w10, w10, #0xff
    2b54:	12001d08 	and	w8, w8, #0xff
    2b58:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
    2b5c:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    2b60:	eb0b013f 	cmp	x9, x11
            value /= base;
    2b64:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    2b68:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
    2b6c:	54fffe29 	b.ls	2b30 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
    2b70:	370ffa47 	tbnz	w7, #1, 2ab8 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2b74:	f1007cbf 	cmp	x5, #0x1f
    2b78:	2a0f03e9 	mov	w9, w15
    2b7c:	1a9f87ea 	cset	w10, ls  // ls = plast
    2b80:	eb05013f 	cmp	x9, x5
    2b84:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    2b88:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2b8c:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    2b90:	34fff686 	cbz	w6, 2a60 <_ntoa_long+0x60>
    2b94:	3400048c 	cbz	w12, 2c24 <_ntoa_long+0x224>
    2b98:	35000072 	cbnz	w18, 2ba4 <_ntoa_long+0x1a4>
    2b9c:	721e04ff 	tst	w7, #0xc
    2ba0:	54000040 	b.eq	2ba8 <_ntoa_long+0x1a8>  // b.none
            width--;
    2ba4:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2ba8:	35fff5e8 	cbnz	w8, 2a64 <_ntoa_long+0x64>
    2bac:	17ffffb8 	b	2a8c <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
    2bb0:	121c0111 	and	w17, w8, #0x10
    2bb4:	2a0803e7 	mov	w7, w8
    2bb8:	17ffffd7 	b	2b14 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
    2bbc:	eb2f40bf 	cmp	x5, w15, uxtw
    2bc0:	54000480 	b.eq	2c50 <_ntoa_long+0x250>  // b.none
    2bc4:	eb2640bf 	cmp	x5, w6, uxtw
    2bc8:	54000440 	b.eq	2c50 <_ntoa_long+0x250>  // b.none
    2bcc:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2bd0:	f1007cbf 	cmp	x5, #0x1f
    2bd4:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2bd8:	f100417f 	cmp	x11, #0x10
    2bdc:	54000480 	b.eq	2c6c <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2be0:	7100011f 	cmp	w8, #0x0
    2be4:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
    2be8:	54000081 	b.ne	2bf8 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
    2bec:	52800c48 	mov	w8, #0x62                  	// #98
    2bf0:	38256888 	strb	w8, [x4, x5]
    2bf4:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
    2bf8:	f10080bf 	cmp	x5, #0x20
    2bfc:	54fff721 	b.ne	2ae0 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    2c00:	97ffff3c 	bl	28f0 <_out_rev>
}
    2c04:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c08:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
    2c0c:	37100167 	tbnz	w7, #2, 2c38 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
    2c10:	361ff7a7 	tbz	w7, #3, 2b04 <_ntoa_long+0x104>
            buf[len++] = ' ';
    2c14:	52800408 	mov	w8, #0x20                  	// #32
    2c18:	38256888 	strb	w8, [x4, x5]
    2c1c:	910004a5 	add	x5, x5, #0x1
    2c20:	17ffffb9 	b	2b04 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2c24:	35fff208 	cbnz	w8, 2a64 <_ntoa_long+0x64>
    2c28:	17ffffa4 	b	2ab8 <_ntoa_long+0xb8>
    2c2c:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
    2c30:	d2800005 	mov	x5, #0x0                   	// #0
    2c34:	17ffffb0 	b	2af4 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
    2c38:	52800568 	mov	w8, #0x2b                  	// #43
    2c3c:	38256888 	strb	w8, [x4, x5]
    2c40:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    2c44:	97ffff2b 	bl	28f0 <_out_rev>
}
    2c48:	a8c37bfd 	ldp	x29, x30, [sp], #48
    2c4c:	d65f03c0 	ret
            if (len && (base == 16U)) {
    2c50:	f10004aa 	subs	x10, x5, #0x1
                len--;
    2c54:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
    2c58:	1a9f07e8 	cset	w8, ne  // ne = any
    2c5c:	7100417f 	cmp	w11, #0x10
    2c60:	1a9f17e9 	cset	w9, eq  // eq = none
    2c64:	6a090108 	ands	w8, w8, w9
    2c68:	54000160 	b.eq	2c94 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2c6c:	721b00e9 	ands	w9, w7, #0x20
    2c70:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
    2c74:	54000141 	b.ne	2c9c <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2c78:	7100013f 	cmp	w9, #0x0
    2c7c:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
    2c80:	54fffbc0 	b.eq	2bf8 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
    2c84:	52800b08 	mov	w8, #0x58                  	// #88
    2c88:	38256888 	strb	w8, [x4, x5]
    2c8c:	910004a5 	add	x5, x5, #0x1
    2c90:	17ffffda 	b	2bf8 <_ntoa_long+0x1f8>
            len--;
    2c94:	aa0a03e5 	mov	x5, x10
    2c98:	17ffffce 	b	2bd0 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
    2c9c:	52800f08 	mov	w8, #0x78                  	// #120
    2ca0:	38256888 	strb	w8, [x4, x5]
    2ca4:	910004a5 	add	x5, x5, #0x1
    2ca8:	17ffffd4 	b	2bf8 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    2cac:	52800028 	mov	w8, #0x1                   	// #1
    2cb0:	17ffffef 	b	2c6c <_ntoa_long+0x26c>
            buf[len++] = '0';
    2cb4:	52800608 	mov	w8, #0x30                  	// #48
    2cb8:	d2800025 	mov	x5, #0x1                   	// #1
    2cbc:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
    2cc0:	17ffff8d 	b	2af4 <_ntoa_long+0xf4>
    2cc4:	d503201f 	nop
    2cc8:	d503201f 	nop
    2ccc:	d503201f 	nop

0000000000002cd0 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
    2cd0:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
    2cd4:	1e602000 	fcmp	d0, d0
{
    2cd8:	a9017bfd 	stp	x29, x30, [sp, #16]
    2cdc:	910043fd 	add	x29, sp, #0x10
    2ce0:	a90253f3 	stp	x19, x20, [sp, #32]
    2ce4:	aa0203f3 	mov	x19, x2
    2ce8:	2a0603f4 	mov	w20, w6
    2cec:	a9035bf5 	stp	x21, x22, [sp, #48]
    2cf0:	2a0503f6 	mov	w22, w5
    2cf4:	a90463f7 	stp	x23, x24, [sp, #64]
    2cf8:	aa0003f7 	mov	x23, x0
    2cfc:	a9056bf9 	stp	x25, x26, [sp, #80]
    2d00:	aa0103f9 	mov	x25, x1
    2d04:	a90673fb 	stp	x27, x28, [sp, #96]
    2d08:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
    2d0c:	54001361 	b.ne	2f78 <_etoa+0x2a8>  // b.any
    2d10:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
    2d14:	9e670001 	fmov	d1, x0
    2d18:	1e612010 	fcmpe	d0, d1
    2d1c:	540012ec 	b.gt	2f78 <_etoa+0x2a8>
    2d20:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
    2d24:	9e670001 	fmov	d1, x0
    2d28:	1e612010 	fcmpe	d0, d1
    2d2c:	54001264 	b.mi	2f78 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
    2d30:	1e602018 	fcmpe	d0, #0.0
    2d34:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    2d38:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d3c:	fd404c17 	ldr	d23, [x0, #152]
    2d40:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d44:	fd405001 	ldr	d1, [x0, #160]
    2d48:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d4c:	fd405416 	ldr	d22, [x0, #168]
    2d50:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    2d54:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d58:	fd405806 	ldr	d6, [x0, #176]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    2d5c:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d60:	fd405c15 	ldr	d21, [x0, #184]
    2d64:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2d68:	fd406014 	ldr	d20, [x0, #192]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    2d6c:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
    2d70:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    2d74:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
    2d78:	1e659002 	fmov	d2, #1.400000000000000000e+01
    2d7c:	1e649011 	fmov	d17, #1.000000000000000000e+01
    2d80:	1e631013 	fmov	d19, #6.000000000000000000e+00
    2d84:	1e601010 	fmov	d16, #2.000000000000000000e+00
    2d88:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    2d8c:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    2d90:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    2d94:	d374f821 	ubfx	x1, x1, #52, #11
    2d98:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    2d9c:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
    2da0:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    2da4:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    2da8:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    2dac:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    2db0:	1e7838a5 	fsub	d5, d5, d24
    2db4:	1e770884 	fmul	d4, d4, d23
    2db8:	1e7608a5 	fmul	d5, d5, d22
    2dbc:	1e612884 	fadd	d4, d4, d1
    2dc0:	1e652884 	fadd	d4, d4, d5
    2dc4:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    2dc8:	1e620301 	scvtf	d1, w24
    2dcc:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    2dd0:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    2dd4:	1e632884 	fadd	d4, d4, d3
    2dd8:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    2ddc:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    2de0:	110ffc00 	add	w0, w0, #0x3ff
    2de4:	9e670004 	fmov	d4, x0
    2de8:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    2dec:	1e740863 	fmul	d3, d3, d20
    2df0:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
    2df4:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
    2df8:	1e613a05 	fsub	d5, d16, d1
    2dfc:	1e612821 	fadd	d1, d1, d1
    2e00:	1e621862 	fdiv	d2, d3, d2
    2e04:	1e712842 	fadd	d2, d2, d17
    2e08:	1e621862 	fdiv	d2, d3, d2
    2e0c:	1e732842 	fadd	d2, d2, d19
    2e10:	1e621863 	fdiv	d3, d3, d2
    2e14:	1e652863 	fadd	d3, d3, d5
    2e18:	1e631821 	fdiv	d1, d1, d3
    2e1c:	1e722821 	fadd	d1, d1, d18
    2e20:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
    2e24:	1e672030 	fcmpe	d1, d7
    2e28:	54000c4c 	b.gt	2fb0 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
    2e2c:	11018f00 	add	w0, w24, #0x63
    2e30:	7103181f 	cmp	w0, #0xc6
    2e34:	1a9f97fc 	cset	w28, hi  // hi = pmore
    2e38:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
    2e3c:	36580134 	tbz	w20, #11, 2e60 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
    2e40:	90000060 	adrp	x0, e000 <__func__.0+0x280>
    2e44:	fd406402 	ldr	d2, [x0, #200]
    2e48:	1e6220f0 	fcmpe	d7, d2
    2e4c:	54000d2a 	b.ge	2ff0 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
    2e50:	34000084 	cbz	w4, 2e60 <_etoa+0x190>
                --prec;
    2e54:	7100007f 	cmp	w3, #0x0
    2e58:	1a9f07e0 	cset	w0, ne  // ne = any
    2e5c:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
    2e60:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
    2e64:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
    2e68:	4b1c02c5 	sub	w5, w22, w28
    2e6c:	5280003a 	mov	w26, #0x1                   	// #1
    2e70:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
    2e74:	7100001f 	cmp	w0, #0x0
    2e78:	1a9f07e0 	cset	w0, ne  // ne = any
    2e7c:	b9007fe0 	str	w0, [sp, #124]
    2e80:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
    2e84:	34000058 	cbz	w24, 2e8c <_etoa+0x1bc>
        value /= conv.F;
    2e88:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    2e8c:	1e602018 	fcmpe	d0, #0.0
    2e90:	54000ac4 	b.mi	2fe8 <_etoa+0x318>  // b.first
    2e94:	1e6040e0 	fmov	d0, d7
    2e98:	12147a86 	and	w6, w20, #0xfffff7ff
    2e9c:	aa1b03e3 	mov	x3, x27
    2ea0:	aa1303e2 	mov	x2, x19
    2ea4:	aa1903e1 	mov	x1, x25
    2ea8:	aa1703e0 	mov	x0, x23
    2eac:	94000071 	bl	3070 <_ftoa>
    2eb0:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
    2eb4:	3400051a 	cbz	w26, 2f54 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
    2eb8:	f27b029f 	tst	x20, #0x20
    2ebc:	528008a1 	mov	w1, #0x45                  	// #69
    2ec0:	aa1503e2 	mov	x2, x21
    2ec4:	aa1b03e3 	mov	x3, x27
    2ec8:	52800ca0 	mov	w0, #0x65                  	// #101
    2ecc:	1a801020 	csel	w0, w1, w0, ne  // ne = any
    2ed0:	aa1903e1 	mov	x1, x25
    2ed4:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
    2ed8:	7100031f 	cmp	w24, #0x0
    2edc:	528000a0 	mov	w0, #0x5                   	// #5
    2ee0:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
    2ee4:	5100079c 	sub	w28, w28, #0x1
    2ee8:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
    2eec:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
    2ef0:	b9000be0 	str	w0, [sp, #8]
    2ef4:	93407c84 	sxtw	x4, w4
    2ef8:	531f7f05 	lsr	w5, w24, #31
    2efc:	aa1b03e3 	mov	x3, x27
    2f00:	aa1903e1 	mov	x1, x25
    2f04:	aa1703e0 	mov	x0, x23
    2f08:	52800007 	mov	w7, #0x0                   	// #0
    2f0c:	d2800146 	mov	x6, #0xa                   	// #10
    2f10:	97fffebc 	bl	2a00 <_ntoa_long>
    2f14:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
    2f18:	b9407fe0 	ldr	w0, [sp, #124]
    2f1c:	340001c0 	cbz	w0, 2f54 <_etoa+0x284>
            while (idx - start_idx < width)
    2f20:	cb1302b3 	sub	x19, x21, x19
    2f24:	eb1302df 	cmp	x22, x19
    2f28:	54000169 	b.ls	2f54 <_etoa+0x284>  // b.plast
    2f2c:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
    2f30:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
    2f34:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
    2f38:	aa1b03e3 	mov	x3, x27
    2f3c:	aa1903e1 	mov	x1, x25
    2f40:	52800400 	mov	w0, #0x20                  	// #32
    2f44:	d63f02e0 	blr	x23
    2f48:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
    2f4c:	eb1302df 	cmp	x22, x19
    2f50:	54ffff08 	b.hi	2f30 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
    2f54:	aa1503e0 	mov	x0, x21
    2f58:	a9417bfd 	ldp	x29, x30, [sp, #16]
    2f5c:	a94253f3 	ldp	x19, x20, [sp, #32]
    2f60:	a9435bf5 	ldp	x21, x22, [sp, #48]
    2f64:	a94463f7 	ldp	x23, x24, [sp, #64]
    2f68:	a9456bf9 	ldp	x25, x26, [sp, #80]
    2f6c:	a94673fb 	ldp	x27, x28, [sp, #96]
    2f70:	910203ff 	add	sp, sp, #0x80
    2f74:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    2f78:	2a1403e6 	mov	w6, w20
    2f7c:	2a1603e5 	mov	w5, w22
    2f80:	aa1b03e3 	mov	x3, x27
    2f84:	aa1303e2 	mov	x2, x19
    2f88:	aa1903e1 	mov	x1, x25
    2f8c:	aa1703e0 	mov	x0, x23
}
    2f90:	a9417bfd 	ldp	x29, x30, [sp, #16]
    2f94:	a94253f3 	ldp	x19, x20, [sp, #32]
    2f98:	a9435bf5 	ldp	x21, x22, [sp, #48]
    2f9c:	a94463f7 	ldp	x23, x24, [sp, #64]
    2fa0:	a9456bf9 	ldp	x25, x26, [sp, #80]
    2fa4:	a94673fb 	ldp	x27, x28, [sp, #96]
    2fa8:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    2fac:	14000031 	b	3070 <_ftoa>
        conv.F /= 10;
    2fb0:	1e711821 	fdiv	d1, d1, d17
        expval--;
    2fb4:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
    2fb8:	11018f00 	add	w0, w24, #0x63
    2fbc:	7103181f 	cmp	w0, #0xc6
    2fc0:	1a9f97fc 	cset	w28, hi  // hi = pmore
    2fc4:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
    2fc8:	365ff4d4 	tbz	w20, #11, 2e60 <_etoa+0x190>
    2fcc:	17ffff9d 	b	2e40 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    2fd0:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
    2fd4:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
    2fd8:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
    2fdc:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
    2fe0:	5280001a 	mov	w26, #0x0                   	// #0
    2fe4:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    2fe8:	1e6140e7 	fneg	d7, d7
    2fec:	17ffffaa 	b	2e94 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
    2ff0:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    2ff4:	f2e825c0 	movk	x0, #0x412e, lsl #48
    2ff8:	9e670002 	fmov	d2, x0
    2ffc:	1e6220f0 	fcmpe	d7, d2
    3000:	54000044 	b.mi	3008 <_etoa+0x338>  // b.first
    3004:	17ffff93 	b	2e50 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
    3008:	6b180080 	subs	w0, w4, w24
    300c:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    3010:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
    3014:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
    3018:	35000196 	cbnz	w22, 3048 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    301c:	1e602018 	fcmpe	d0, #0.0
    3020:	54fffd84 	b.mi	2fd0 <_etoa+0x300>  // b.first
    3024:	12147a86 	and	w6, w20, #0xfffff7ff
    3028:	1e6040e0 	fmov	d0, d7
    302c:	321600c6 	orr	w6, w6, #0x400
    3030:	aa1b03e3 	mov	x3, x27
    3034:	aa1303e2 	mov	x2, x19
    3038:	aa1903e1 	mov	x1, x25
    303c:	aa1703e0 	mov	x0, x23
    3040:	52800005 	mov	w5, #0x0                   	// #0
    3044:	17ffffd3 	b	2f90 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    3048:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
    304c:	2a1603e5 	mov	w5, w22
    3050:	5280001a 	mov	w26, #0x0                   	// #0
    3054:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
    3058:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
    305c:	b9007fff 	str	wzr, [sp, #124]
    3060:	17ffff8b 	b	2e8c <_etoa+0x1bc>
    3064:	d503201f 	nop
    3068:	d503201f 	nop
    306c:	d503201f 	nop

0000000000003070 <_ftoa>:
    if (value != value)
    3070:	1e602000 	fcmp	d0, d0
{
    3074:	2a0603e7 	mov	w7, w6
    if (value != value)
    3078:	54000e01 	b.ne	3238 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
    307c:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
    3080:	9e6700c1 	fmov	d1, x6
    3084:	1e612010 	fcmpe	d0, d1
    3088:	54001184 	b.mi	32b8 <_ftoa+0x248>  // b.first
    308c:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
    3090:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
    3094:	9e670001 	fmov	d1, x0
    3098:	aa0103f0 	mov	x16, x1
    309c:	aa0203f1 	mov	x17, x2
    30a0:	aa0303f2 	mov	x18, x3
    30a4:	1e612010 	fcmpe	d0, d1
    30a8:	54000b2c 	b.gt	320c <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
    30ac:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    30b0:	f2e839a0 	movk	x0, #0x41cd, lsl #48
    30b4:	9e670001 	fmov	d1, x0
    30b8:	1e612010 	fcmpe	d0, d1
    30bc:	54000f2c 	b.gt	32a0 <_ftoa+0x230>
    30c0:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    30c4:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
    30c8:	9e670001 	fmov	d1, x0
    30cc:	1e612010 	fcmpe	d0, d1
    30d0:	54000e84 	b.mi	32a0 <_ftoa+0x230>  // b.first
    if (value < 0) {
    30d4:	1e602018 	fcmpe	d0, #0.0
{
    30d8:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    30dc:	910003fd 	mov	x29, sp
    if (value < 0) {
    30e0:	54000ca4 	b.mi	3274 <_ftoa+0x204>  // b.first
    bool negative = false;
    30e4:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
    30e8:	36500ce7 	tbz	w7, #10, 3284 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    30ec:	7100249f 	cmp	w4, #0x9
    30f0:	910043ec 	add	x12, sp, #0x10
    30f4:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
    30f8:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    30fc:	54001929 	b.ls	3420 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
    3100:	91000508 	add	x8, x8, #0x1
        prec--;
    3104:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
    3108:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    310c:	f1007d1f 	cmp	x8, #0x1f
    3110:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
    3114:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    3118:	54ffff48 	b.hi	3100 <_ftoa+0x90>  // b.pmore
    311c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    3120:	f2e839a0 	movk	x0, #0x41cd, lsl #48
    3124:	9e670002 	fmov	d2, x0
    int whole = (int)value;
    3128:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
    312c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
    3130:	1e620141 	scvtf	d1, w10
    3134:	1e613801 	fsub	d1, d0, d1
    3138:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
    313c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
    3140:	9e6301c4 	ucvtf	d4, x14
    3144:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
    3148:	1e632030 	fcmpe	d1, d3
    314c:	5400112c 	b.gt	3370 <_ftoa+0x300>
    } else if (diff < 0.5) {
    3150:	54000084 	b.mi	3160 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
    3154:	b500154e 	cbnz	x14, 33fc <_ftoa+0x38c>
        ++frac;
    3158:	910005ce 	add	x14, x14, #0x1
    315c:	d503201f 	nop
    if (prec == 0U) {
    3160:	35000b64 	cbnz	w4, 32cc <_ftoa+0x25c>
        diff = value - (double)whole;
    3164:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    3168:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
    316c:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    3170:	1e622010 	fcmpe	d0, d2
    3174:	540011a4 	b.mi	33a8 <_ftoa+0x338>  // b.first
            ++whole;
    3178:	12000140 	and	w0, w10, #0x1
    317c:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
    3180:	528ccce1 	mov	w1, #0x6667                	// #26215
    3184:	72acccc1 	movk	w1, #0x6666, lsl #16
    3188:	52800142 	mov	w2, #0xa                   	// #10
    318c:	d503201f 	nop
    3190:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
    3194:	f100811f 	cmp	x8, #0x20
    3198:	54000c20 	b.eq	331c <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
    319c:	9362fd29 	asr	x9, x9, #34
    31a0:	91000508 	add	x8, x8, #0x1
    31a4:	4b8a7d29 	sub	w9, w9, w10, asr #31
    31a8:	8b080180 	add	x0, x12, x8
    31ac:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
    31b0:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
    31b4:	1100c169 	add	w9, w11, #0x30
    31b8:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
    31bc:	35fffeaa 	cbnz	w10, 3190 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    31c0:	120004e0 	and	w0, w7, #0x3
    31c4:	7100041f 	cmp	w0, #0x1
    31c8:	54000b00 	b.eq	3328 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
    31cc:	f1007d1f 	cmp	x8, #0x1f
    31d0:	540000a8 	b.hi	31e4 <_ftoa+0x174>  // b.pmore
        if (negative) {
    31d4:	34000de3 	cbz	w3, 3390 <_ftoa+0x320>
            buf[len++] = '-';
    31d8:	528005a0 	mov	w0, #0x2d                  	// #45
    31dc:	38286980 	strb	w0, [x12, x8]
    31e0:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    31e4:	2a0503e6 	mov	w6, w5
    31e8:	aa0c03e4 	mov	x4, x12
    31ec:	aa0803e5 	mov	x5, x8
    31f0:	aa1203e3 	mov	x3, x18
    31f4:	aa1103e2 	mov	x2, x17
    31f8:	aa1003e1 	mov	x1, x16
    31fc:	aa0f03e0 	mov	x0, x15
    3200:	97fffdbc 	bl	28f0 <_out_rev>
}
    3204:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3208:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    320c:	37100207 	tbnz	w7, #2, 324c <_ftoa+0x1dc>
    3210:	d2800060 	mov	x0, #0x3                   	// #3
    3214:	2a0503e6 	mov	w6, w5
    3218:	d0000044 	adrp	x4, d000 <__ascii_wctomb+0x30>
    321c:	913da084 	add	x4, x4, #0xf68
    3220:	aa0003e5 	mov	x5, x0
    3224:	aa1203e3 	mov	x3, x18
    3228:	aa1103e2 	mov	x2, x17
    322c:	aa1003e1 	mov	x1, x16
    3230:	aa0f03e0 	mov	x0, x15
    3234:	17fffdaf 	b	28f0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
    3238:	2a0503e6 	mov	w6, w5
    323c:	d0000044 	adrp	x4, d000 <__ascii_wctomb+0x30>
    3240:	d2800065 	mov	x5, #0x3                   	// #3
    3244:	913de084 	add	x4, x4, #0xf78
    3248:	17fffdaa 	b	28f0 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    324c:	d2800080 	mov	x0, #0x4                   	// #4
    3250:	2a0503e6 	mov	w6, w5
    3254:	d0000044 	adrp	x4, d000 <__ascii_wctomb+0x30>
    3258:	913dc084 	add	x4, x4, #0xf70
    325c:	aa0003e5 	mov	x5, x0
    3260:	aa1203e3 	mov	x3, x18
    3264:	aa1103e2 	mov	x2, x17
    3268:	aa1003e1 	mov	x1, x16
    326c:	aa0f03e0 	mov	x0, x15
    3270:	17fffda0 	b	28f0 <_out_rev>
        value = 0 - value;
    3274:	2f00e401 	movi	d1, #0x0
        negative = true;
    3278:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
    327c:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
    3280:	3757f367 	tbnz	w7, #10, 30ec <_ftoa+0x7c>
    3284:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    3288:	910043ec 	add	x12, sp, #0x10
    328c:	f2e825c0 	movk	x0, #0x412e, lsl #48
    3290:	d2800008 	mov	x8, #0x0                   	// #0
    3294:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    3298:	528000c4 	mov	w4, #0x6                   	// #6
    329c:	17ffffa3 	b	3128 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
    32a0:	2a0703e6 	mov	w6, w7
    32a4:	aa1203e3 	mov	x3, x18
    32a8:	aa1103e2 	mov	x2, x17
    32ac:	aa1003e1 	mov	x1, x16
    32b0:	aa0f03e0 	mov	x0, x15
    32b4:	17fffe87 	b	2cd0 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
    32b8:	2a0503e6 	mov	w6, w5
    32bc:	d0000044 	adrp	x4, d000 <__ascii_wctomb+0x30>
    32c0:	d2800085 	mov	x5, #0x4                   	// #4
    32c4:	913e0084 	add	x4, x4, #0xf80
    32c8:	17fffd8a 	b	28f0 <_out_rev>
    32cc:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
    32d0:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
    32d4:	0b080021 	add	w1, w1, w8
    32d8:	f29999a2 	movk	x2, #0xcccd
    32dc:	1400000d 	b	3310 <_ftoa+0x2a0>
    32e0:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
    32e4:	f10025df 	cmp	x14, #0x9
            --count;
    32e8:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
    32ec:	91000509 	add	x9, x8, #0x1
    32f0:	8b0b096d 	add	x13, x11, x11, lsl #2
    32f4:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
    32f8:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
    32fc:	1100c1ab 	add	w11, w13, #0x30
    3300:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
    3304:	54000569 	b.ls	33b0 <_ftoa+0x340>  // b.plast
            --count;
    3308:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
    330c:	aa0903e8 	mov	x8, x9
    3310:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
    3314:	6b01009f 	cmp	w4, w1
    3318:	54fffe41 	b.ne	32e0 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    331c:	120004e0 	and	w0, w7, #0x3
    3320:	7100041f 	cmp	w0, #0x1
    3324:	54fff601 	b.ne	31e4 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    3328:	34fff525 	cbz	w5, 31cc <_ftoa+0x15c>
    332c:	35000763 	cbnz	w3, 3418 <_ftoa+0x3a8>
    3330:	721e04ff 	tst	w7, #0xc
    3334:	54000721 	b.ne	3418 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    3338:	2a0503e1 	mov	w1, w5
    333c:	eb01011f 	cmp	x8, x1
    3340:	54fff462 	b.cs	31cc <_ftoa+0x15c>  // b.hs, b.nlast
    3344:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
    3348:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    334c:	54fff4c8 	b.hi	31e4 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
    3350:	91000508 	add	x8, x8, #0x1
    3354:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    3358:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
    335c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    3360:	54fff360 	b.eq	31cc <_ftoa+0x15c>  // b.none
    3364:	f100811f 	cmp	x8, #0x20
    3368:	54ffff41 	b.ne	3350 <_ftoa+0x2e0>  // b.any
    336c:	17ffff9e 	b	31e4 <_ftoa+0x174>
        ++frac;
    3370:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
    3374:	9e6301c1 	ucvtf	d1, x14
    3378:	1e622030 	fcmpe	d1, d2
    337c:	5400004a 	b.ge	3384 <_ftoa+0x314>  // b.tcont
    3380:	17ffff78 	b	3160 <_ftoa+0xf0>
            ++whole;
    3384:	1100054a 	add	w10, w10, #0x1
            frac = 0;
    3388:	d280000e 	mov	x14, #0x0                   	// #0
    338c:	17ffff75 	b	3160 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
    3390:	371003c7 	tbnz	w7, #2, 3408 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
    3394:	361ff287 	tbz	w7, #3, 31e4 <_ftoa+0x174>
            buf[len++] = ' ';
    3398:	52800400 	mov	w0, #0x20                  	// #32
    339c:	38286980 	strb	w0, [x12, x8]
    33a0:	91000508 	add	x8, x8, #0x1
    33a4:	17ffff90 	b	31e4 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    33a8:	54ffee8c 	b.gt	3178 <_ftoa+0x108>
    33ac:	17ffff75 	b	3180 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    33b0:	f100813f 	cmp	x9, #0x20
    33b4:	54000420 	b.eq	3438 <_ftoa+0x3c8>  // b.none
    33b8:	91000901 	add	x1, x8, #0x2
    33bc:	51000884 	sub	w4, w4, #0x2
    33c0:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
    33c4:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    33c8:	34000340 	cbz	w0, 3430 <_ftoa+0x3c0>
    33cc:	d503201f 	nop
            buf[len++] = '0';
    33d0:	91000529 	add	x9, x9, #0x1
    33d4:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    33d8:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
    33dc:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    33e0:	540002c0 	b.eq	3438 <_ftoa+0x3c8>  // b.none
    33e4:	eb01013f 	cmp	x9, x1
    33e8:	54ffff41 	b.ne	33d0 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
    33ec:	528005c0 	mov	w0, #0x2e                  	// #46
    33f0:	91000428 	add	x8, x1, #0x1
    33f4:	38216980 	strb	w0, [x12, x1]
    33f8:	17ffff62 	b	3180 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
    33fc:	3607eb2e 	tbz	w14, #0, 3160 <_ftoa+0xf0>
        ++frac;
    3400:	910005ce 	add	x14, x14, #0x1
    3404:	17ffff57 	b	3160 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
    3408:	52800560 	mov	w0, #0x2b                  	// #43
    340c:	38286980 	strb	w0, [x12, x8]
    3410:	91000508 	add	x8, x8, #0x1
    3414:	17ffff74 	b	31e4 <_ftoa+0x174>
            width--;
    3418:	510004a5 	sub	w5, w5, #0x1
    341c:	17ffffc7 	b	3338 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
    3420:	f0000040 	adrp	x0, e000 <__func__.0+0x280>
    3424:	91012000 	add	x0, x0, #0x48
    3428:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
    342c:	17ffff3f 	b	3128 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    3430:	aa0903e1 	mov	x1, x9
    3434:	17ffffee 	b	33ec <_ftoa+0x37c>
            buf[len++] = '0';
    3438:	aa0903e8 	mov	x8, x9
    343c:	17ffffb8 	b	331c <_ftoa+0x2ac>

0000000000003440 <_out_char>:
    if (character) {
    3440:	72001c00 	ands	w0, w0, #0xff
    3444:	54000041 	b.ne	344c <_out_char+0xc>  // b.any
}
    3448:	d65f03c0 	ret
        _putchar(character);
    344c:	17fffd05 	b	2860 <putc>

0000000000003450 <_out_fct>:
    if (character) {
    3450:	72001c00 	ands	w0, w0, #0xff
    3454:	54000080 	b.eq	3464 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    3458:	a9400422 	ldp	x2, x1, [x1]
    345c:	aa0203f0 	mov	x16, x2
    3460:	d61f0200 	br	x16
}
    3464:	d65f03c0 	ret
    3468:	d503201f 	nop
    346c:	d503201f 	nop

0000000000003470 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    3470:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    3474:	f100003f 	cmp	x1, #0x0
{
    3478:	a9017bfd 	stp	x29, x30, [sp, #16]
    347c:	910043fd 	add	x29, sp, #0x10
    3480:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    3484:	f0fffff3 	adrp	x19, 2000 <InodeWrite+0x80>
    3488:	91238273 	add	x19, x19, #0x8e0
{
    348c:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    3490:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    3494:	aa0103fa 	mov	x26, x1
    3498:	a90673fb 	stp	x27, x28, [sp, #96]
    349c:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    34a0:	d280001b 	mov	x27, #0x0                   	// #0
    34a4:	b9401880 	ldr	w0, [x4, #24]
    34a8:	b9007be0 	str	w0, [sp, #120]
    34ac:	f9400480 	ldr	x0, [x4, #8]
    34b0:	f90047e0 	str	x0, [sp, #136]
    34b4:	39400065 	ldrb	w5, [x3]
    34b8:	f9400880 	ldr	x0, [x4, #16]
    34bc:	f9004be0 	str	x0, [sp, #144]
    34c0:	b9401c80 	ldr	w0, [x4, #28]
    34c4:	b900abe0 	str	w0, [sp, #168]
    34c8:	f9400094 	ldr	x20, [x4]
    34cc:	34003ae5 	cbz	w5, 3c28 <_vsnprintf+0x7b8>
    34d0:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    34d4:	d0000058 	adrp	x24, d000 <__ascii_wctomb+0x30>
    34d8:	913e2300 	add	x0, x24, #0xf88
    34dc:	aa0303f9 	mov	x25, x3
    34e0:	f90043e0 	str	x0, [sp, #128]
    34e4:	f0000040 	adrp	x0, e000 <__func__.0+0x280>
    34e8:	9100c000 	add	x0, x0, #0x30
    34ec:	f9004fe0 	str	x0, [sp, #152]
    34f0:	1400000a 	b	3518 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    34f4:	91000764 	add	x4, x27, #0x1
    34f8:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    34fc:	aa1b03e2 	mov	x2, x27
    3500:	aa1c03e3 	mov	x3, x28
    3504:	aa1a03e1 	mov	x1, x26
    3508:	aa0403fb 	mov	x27, x4
    350c:	d63f0260 	blr	x19
    while (*format) {
    3510:	39400325 	ldrb	w5, [x25]
    3514:	34000c85 	cbz	w5, 36a4 <_vsnprintf+0x234>
            format++;
    3518:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    351c:	710094bf 	cmp	w5, #0x25
    3520:	54fffea1 	b.ne	34f4 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    3524:	aa1903e8 	mov	x8, x25
        flags = 0U;
    3528:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    352c:	38401500 	ldrb	w0, [x8], #1
    3530:	7100ac1f 	cmp	w0, #0x2b
    3534:	54000180 	b.eq	3564 <_vsnprintf+0xf4>  // b.none
    3538:	540001c8 	b.hi	3570 <_vsnprintf+0x100>  // b.pmore
    353c:	7100801f 	cmp	w0, #0x20
    3540:	54000260 	b.eq	358c <_vsnprintf+0x11c>  // b.none
    3544:	71008c1f 	cmp	w0, #0x23
    3548:	540002e1 	b.ne	35a4 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    354c:	321c00c6 	orr	w6, w6, #0x10
            format++;
    3550:	aa0803f9 	mov	x25, x8
            switch (*format) {
    3554:	aa1903e8 	mov	x8, x25
    3558:	38401500 	ldrb	w0, [x8], #1
    355c:	7100ac1f 	cmp	w0, #0x2b
    3560:	54fffec1 	b.ne	3538 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    3564:	321e00c6 	orr	w6, w6, #0x4
            format++;
    3568:	aa0803f9 	mov	x25, x8
    356c:	17fffffa 	b	3554 <_vsnprintf+0xe4>
            switch (*format) {
    3570:	7100b41f 	cmp	w0, #0x2d
    3574:	54000120 	b.eq	3598 <_vsnprintf+0x128>  // b.none
    3578:	7100c01f 	cmp	w0, #0x30
    357c:	540062c1 	b.ne	41d4 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    3580:	320000c6 	orr	w6, w6, #0x1
            format++;
    3584:	aa0803f9 	mov	x25, x8
    3588:	17fffff3 	b	3554 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    358c:	321d00c6 	orr	w6, w6, #0x8
            format++;
    3590:	aa0803f9 	mov	x25, x8
    3594:	17fffff0 	b	3554 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    3598:	321f00c6 	orr	w6, w6, #0x2
            format++;
    359c:	aa0803f9 	mov	x25, x8
    35a0:	17ffffed 	b	3554 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    35a4:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    35a8:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    35ac:	540002e0 	b.eq	3608 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    35b0:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    35b4:	7101b01f 	cmp	w0, #0x6c
            format++;
    35b8:	aa0803e4 	mov	x4, x8
        switch (*format) {
    35bc:	54001f20 	b.eq	39a0 <_vsnprintf+0x530>  // b.none
    35c0:	54000588 	b.hi	3670 <_vsnprintf+0x200>  // b.pmore
    35c4:	7101a01f 	cmp	w0, #0x68
    35c8:	54001e20 	b.eq	398c <_vsnprintf+0x51c>  // b.none
    35cc:	7101a81f 	cmp	w0, #0x6a
    35d0:	54006241 	b.ne	4218 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    35d4:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    35d8:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    35dc:	51009402 	sub	w2, w0, #0x25
            format++;
    35e0:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    35e4:	71014c5f 	cmp	w2, #0x53
    35e8:	54000069 	b.ls	35f4 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    35ec:	91000764 	add	x4, x27, #0x1
    35f0:	17ffffc3 	b	34fc <_vsnprintf+0x8c>
        switch (*format) {
    35f4:	f94043e1 	ldr	x1, [sp, #128]
    35f8:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    35fc:	10000062 	adr	x2, 3608 <_vsnprintf+0x198>
    3600:	8b21a841 	add	x1, x2, w1, sxth #2
    3604:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    3608:	b9407be0 	ldr	w0, [sp, #120]
    360c:	37f806c0 	tbnz	w0, #31, 36e4 <_vsnprintf+0x274>
    3610:	91002e82 	add	x2, x20, #0xb
    3614:	aa1403e0 	mov	x0, x20
    3618:	927df054 	and	x20, x2, #0xfffffffffffffff8
    361c:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    3620:	36f80078 	tbz	w24, #31, 362c <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    3624:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    3628:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    362c:	39400720 	ldrb	w0, [x25, #1]
            format++;
    3630:	aa0803f9 	mov	x25, x8
    3634:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    3638:	7100b81f 	cmp	w0, #0x2e
    363c:	54fffba1 	b.ne	35b0 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    3640:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    3644:	321600c6 	orr	w6, w6, #0x400
            format++;
    3648:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    364c:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    3650:	12001c42 	and	w2, w2, #0xff
    3654:	7100245f 	cmp	w2, #0x9
    3658:	54001b29 	b.ls	39bc <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    365c:	7100a81f 	cmp	w0, #0x2a
    3660:	54002a20 	b.eq	3ba4 <_vsnprintf+0x734>  // b.none
            format++;
    3664:	aa0803f9 	mov	x25, x8
    3668:	91000508 	add	x8, x8, #0x1
    366c:	17ffffd1 	b	35b0 <_vsnprintf+0x140>
        switch (*format) {
    3670:	7101d01f 	cmp	w0, #0x74
    3674:	54fffb00 	b.eq	35d4 <_vsnprintf+0x164>  // b.none
    3678:	7101e81f 	cmp	w0, #0x7a
    367c:	54fffac0 	b.eq	35d4 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    3680:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    3684:	aa0803f9 	mov	x25, x8
        switch (*format) {
    3688:	7100245f 	cmp	w2, #0x9
    368c:	54fffb08 	b.hi	35ec <_vsnprintf+0x17c>  // b.pmore
    3690:	f9404fe1 	ldr	x1, [sp, #152]
    3694:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    3698:	10000062 	adr	x2, 36a4 <_vsnprintf+0x234>
    369c:	8b21a841 	add	x1, x2, w1, sxth #2
    36a0:	d61f0020 	br	x1
    36a4:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    36a8:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    36ac:	eb1b039f 	cmp	x28, x27
    36b0:	d1000782 	sub	x2, x28, #0x1
    36b4:	aa1a03e1 	mov	x1, x26
    36b8:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    36bc:	aa1c03e3 	mov	x3, x28
    36c0:	52800000 	mov	w0, #0x0                   	// #0
    36c4:	d63f0260 	blr	x19
}
    36c8:	2a1403e0 	mov	w0, w20
    36cc:	a9417bfd 	ldp	x29, x30, [sp, #16]
    36d0:	a94253f3 	ldp	x19, x20, [sp, #32]
    36d4:	a9456bf9 	ldp	x25, x26, [sp, #80]
    36d8:	a94673fb 	ldp	x27, x28, [sp, #96]
    36dc:	9102c3ff 	add	sp, sp, #0xb0
    36e0:	d65f03c0 	ret
            const int w = va_arg(va, int);
    36e4:	b9407be0 	ldr	w0, [sp, #120]
    36e8:	11002002 	add	w2, w0, #0x8
    36ec:	7100005f 	cmp	w2, #0x0
    36f0:	5400228d 	b.le	3b40 <_vsnprintf+0x6d0>
    36f4:	91002e84 	add	x4, x20, #0xb
    36f8:	aa1403e0 	mov	x0, x20
    36fc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3700:	b9007be2 	str	w2, [sp, #120]
    3704:	17ffffc6 	b	361c <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    3708:	121a7802 	and	w2, w0, #0xffffffdf
    370c:	7101605f 	cmp	w2, #0x58
    3710:	54001781 	b.ne	3a00 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    3714:	7101601f 	cmp	w0, #0x58
    3718:	54003c81 	b.ne	3ea8 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    371c:	321b00c6 	orr	w6, w6, #0x20
    3720:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    3724:	121c74c6 	and	w6, w6, #0xfffffff3
    3728:	140000c0 	b	3a28 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    372c:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    3730:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    3734:	71011c5f 	cmp	w2, #0x47
    3738:	321500c2 	orr	w2, w6, #0x800
    373c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    3740:	7101141f 	cmp	w0, #0x45
    3744:	321b00c0 	orr	w0, w6, #0x20
    3748:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    374c:	b940abe0 	ldr	w0, [sp, #168]
    3750:	37f81c20 	tbnz	w0, #31, 3ad4 <_vsnprintf+0x664>
    3754:	91003e82 	add	x2, x20, #0xf
    3758:	aa1403e0 	mov	x0, x20
    375c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3760:	fd400000 	ldr	d0, [x0]
    3764:	aa1b03e2 	mov	x2, x27
    3768:	2a1803e5 	mov	w5, w24
    376c:	2a1703e4 	mov	w4, w23
    3770:	aa1c03e3 	mov	x3, x28
    3774:	aa1a03e1 	mov	x1, x26
    3778:	aa1303e0 	mov	x0, x19
    377c:	97fffd55 	bl	2cd0 <_etoa>
    3780:	aa0003fb 	mov	x27, x0
            break;
    3784:	17ffff63 	b	3510 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    3788:	7101181f 	cmp	w0, #0x46
    378c:	321b00c0 	orr	w0, w6, #0x20
    3790:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    3794:	b940abe0 	ldr	w0, [sp, #168]
    3798:	37f818c0 	tbnz	w0, #31, 3ab0 <_vsnprintf+0x640>
    379c:	91003e82 	add	x2, x20, #0xf
    37a0:	aa1403e0 	mov	x0, x20
    37a4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    37a8:	fd400000 	ldr	d0, [x0]
    37ac:	aa1b03e2 	mov	x2, x27
    37b0:	2a1803e5 	mov	w5, w24
    37b4:	2a1703e4 	mov	w4, w23
    37b8:	aa1c03e3 	mov	x3, x28
    37bc:	aa1a03e1 	mov	x1, x26
    37c0:	aa1303e0 	mov	x0, x19
    37c4:	97fffe2b 	bl	3070 <_ftoa>
    37c8:	aa0003fb 	mov	x27, x0
            break;
    37cc:	17ffff51 	b	3510 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    37d0:	91000760 	add	x0, x27, #0x1
    37d4:	aa1b03e2 	mov	x2, x27
    37d8:	aa1c03e3 	mov	x3, x28
    37dc:	aa0003fb 	mov	x27, x0
    37e0:	aa1a03e1 	mov	x1, x26
    37e4:	528004a0 	mov	w0, #0x25                  	// #37
    37e8:	d63f0260 	blr	x19
            break;
    37ec:	17ffff49 	b	3510 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    37f0:	52800420 	mov	w0, #0x21                  	// #33
    37f4:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    37f8:	b9407be0 	ldr	w0, [sp, #120]
    37fc:	37f817e0 	tbnz	w0, #31, 3af8 <_vsnprintf+0x688>
    3800:	91003e82 	add	x2, x20, #0xf
    3804:	aa1403e0 	mov	x0, x20
    3808:	927df054 	and	x20, x2, #0xfffffffffffffff8
    380c:	2a1703e7 	mov	w7, w23
    3810:	aa1b03e2 	mov	x2, x27
    3814:	f9400004 	ldr	x4, [x0]
    3818:	52800200 	mov	w0, #0x10                  	// #16
    381c:	b90003e0 	str	w0, [sp]
    3820:	b9000be6 	str	w6, [sp, #8]
    3824:	d2800206 	mov	x6, #0x10                  	// #16
    3828:	52800005 	mov	w5, #0x0                   	// #0
    382c:	aa1c03e3 	mov	x3, x28
    3830:	aa1a03e1 	mov	x1, x26
    3834:	aa1303e0 	mov	x0, x19
    3838:	97fffc72 	bl	2a00 <_ntoa_long>
    383c:	aa0003fb 	mov	x27, x0
            break;
    3840:	17ffff34 	b	3510 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    3844:	a9035bf5 	stp	x21, x22, [sp, #48]
    3848:	36082306 	tbz	w6, #1, 3ca8 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    384c:	b9407be0 	ldr	w0, [sp, #120]
    3850:	37f82a20 	tbnz	w0, #31, 3d94 <_vsnprintf+0x924>
    3854:	91002e82 	add	x2, x20, #0xb
    3858:	aa1403e0 	mov	x0, x20
    385c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3860:	39400000 	ldrb	w0, [x0]
    3864:	aa1b03e2 	mov	x2, x27
    3868:	aa1c03e3 	mov	x3, x28
    386c:	aa1a03e1 	mov	x1, x26
    3870:	91000775 	add	x21, x27, #0x1
    3874:	d63f0260 	blr	x19
                while (l++ < width) {
    3878:	51000b00 	sub	w0, w24, #0x2
    387c:	91000b6a 	add	x10, x27, #0x2
    3880:	7100071f 	cmp	w24, #0x1
    3884:	8b00015b 	add	x27, x10, x0
    3888:	540007c9 	b.ls	3980 <_vsnprintf+0x510>  // b.plast
    388c:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    3890:	aa1503e2 	mov	x2, x21
    3894:	aa1c03e3 	mov	x3, x28
    3898:	910006b5 	add	x21, x21, #0x1
    389c:	aa1a03e1 	mov	x1, x26
    38a0:	52800400 	mov	w0, #0x20                  	// #32
    38a4:	d63f0260 	blr	x19
                while (l++ < width) {
    38a8:	eb1b02bf 	cmp	x21, x27
    38ac:	54ffff21 	b.ne	3890 <_vsnprintf+0x420>  // b.any
    38b0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    38b4:	17ffff17 	b	3510 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    38b8:	b9407be0 	ldr	w0, [sp, #120]
    38bc:	a9035bf5 	stp	x21, x22, [sp, #48]
    38c0:	37f812e0 	tbnz	w0, #31, 3b1c <_vsnprintf+0x6ac>
    38c4:	91003e82 	add	x2, x20, #0xf
    38c8:	aa1403e0 	mov	x0, x20
    38cc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    38d0:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    38d4:	394002a8 	ldrb	w8, [x21]
    38d8:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    38dc:	350017d7 	cbnz	w23, 3bd4 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    38e0:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    38e4:	340035c8 	cbz	w8, 3f9c <_vsnprintf+0xb2c>
    38e8:	91000456 	add	x22, x2, #0x1
    38ec:	aa1503e2 	mov	x2, x21
    38f0:	8b1602b6 	add	x22, x21, x22
    38f4:	14000003 	b	3900 <_vsnprintf+0x490>
    38f8:	eb0202df 	cmp	x22, x2
    38fc:	54001900 	b.eq	3c1c <_vsnprintf+0x7ac>  // b.none
    3900:	38401c44 	ldrb	w4, [x2, #1]!
    3904:	35ffffa4 	cbnz	w4, 38f8 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    3908:	4b150041 	sub	w1, w2, w21
    390c:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    3910:	121600c1 	and	w1, w6, #0x400
    3914:	b9007fe1 	str	w1, [sp, #124]
    3918:	365000a6 	tbz	w6, #10, 392c <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    391c:	b940a3e1 	ldr	w1, [sp, #160]
    3920:	6b17003f 	cmp	w1, w23
    3924:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    3928:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    392c:	121f00c1 	and	w1, w6, #0x2
    3930:	b900afe1 	str	w1, [sp, #172]
    3934:	36081826 	tbz	w6, #1, 3c38 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    3938:	34001108 	cbz	w8, 3b58 <_vsnprintf+0x6e8>
    393c:	aa1b03e2 	mov	x2, x27
    3940:	cb1b02b6 	sub	x22, x21, x27
    3944:	14000002 	b	394c <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    3948:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    394c:	b9407fe1 	ldr	w1, [sp, #124]
    3950:	34000081 	cbz	w1, 3960 <_vsnprintf+0x4f0>
    3954:	510006e4 	sub	w4, w23, #0x1
    3958:	340016d7 	cbz	w23, 3c30 <_vsnprintf+0x7c0>
    395c:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    3960:	91000455 	add	x21, x2, #0x1
    3964:	aa1c03e3 	mov	x3, x28
    3968:	aa1a03e1 	mov	x1, x26
    396c:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    3970:	38756ac0 	ldrb	w0, [x22, x21]
    3974:	35fffea0 	cbnz	w0, 3948 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    3978:	b940afe0 	ldr	w0, [sp, #172]
    397c:	35000ec0 	cbnz	w0, 3b54 <_vsnprintf+0x6e4>
                while (l++ < width) {
    3980:	aa1503fb 	mov	x27, x21
    3984:	a9435bf5 	ldp	x21, x22, [sp, #48]
    3988:	17fffee2 	b	3510 <_vsnprintf+0xa0>
            if (*format == 'h') {
    398c:	39400720 	ldrb	w0, [x25, #1]
    3990:	7101a01f 	cmp	w0, #0x68
    3994:	540013c0 	b.eq	3c0c <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    3998:	321900c6 	orr	w6, w6, #0x80
    399c:	17ffff10 	b	35dc <_vsnprintf+0x16c>
            if (*format == 'l') {
    39a0:	39400720 	ldrb	w0, [x25, #1]
    39a4:	7101b01f 	cmp	w0, #0x6c
    39a8:	54ffe181 	b.ne	35d8 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    39ac:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    39b0:	321804c6 	orr	w6, w6, #0x300
                format++;
    39b4:	91000b24 	add	x4, x25, #0x2
    39b8:	17ffff09 	b	35dc <_vsnprintf+0x16c>
    unsigned int i = 0U;
    39bc:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    39c0:	52800148 	mov	w8, #0xa                   	// #10
    39c4:	d503201f 	nop
    39c8:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    39cc:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    39d0:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    39d4:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    39d8:	12001c42 	and	w2, w2, #0xff
    39dc:	7100245f 	cmp	w2, #0x9
    39e0:	54ffff49 	b.ls	39c8 <_vsnprintf+0x558>  // b.plast
    39e4:	aa0403f9 	mov	x25, x4
    39e8:	91000488 	add	x8, x4, #0x1
    39ec:	17fffef2 	b	35b4 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    39f0:	121a7802 	and	w2, w0, #0xffffffdf
    39f4:	7101605f 	cmp	w2, #0x58
    39f8:	54002580 	b.eq	3ea8 <_vsnprintf+0xa38>  // b.none
    39fc:	d503201f 	nop
            } else if (*format == 'o') {
    3a00:	7101bc1f 	cmp	w0, #0x6f
    3a04:	540021a0 	b.eq	3e38 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    3a08:	7101881f 	cmp	w0, #0x62
    3a0c:	54002820 	b.eq	3f10 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    3a10:	121b78c6 	and	w6, w6, #0xffffffef
    3a14:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    3a18:	7101a41f 	cmp	w0, #0x69
    3a1c:	52800c82 	mov	w2, #0x64                  	// #100
    3a20:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    3a24:	54ffe801 	b.ne	3724 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    3a28:	f27600df 	tst	x6, #0x400
    3a2c:	121f78c2 	and	w2, w6, #0xfffffffe
    3a30:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    3a34:	7101a41f 	cmp	w0, #0x69
    3a38:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    3a3c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    3a40:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    3a44:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    3a48:	54000ce1 	b.ne	3be4 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    3a4c:	35002122 	cbnz	w2, 3e70 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    3a50:	37402306 	tbnz	w6, #8, 3eb0 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    3a54:	37301b26 	tbnz	w6, #6, 3db8 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    3a58:	36382926 	tbz	w6, #7, 3f7c <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    3a5c:	37f83300 	tbnz	w0, #31, 40bc <_vsnprintf+0xc4c>
    3a60:	91002e82 	add	x2, x20, #0xb
    3a64:	aa1403e0 	mov	x0, x20
    3a68:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3a6c:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    3a70:	710000bf 	cmp	w5, #0x0
    3a74:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    3a78:	12003c84 	and	w4, w4, #0xffff
    3a7c:	2a1703e7 	mov	w7, w23
    3a80:	531f7ca5 	lsr	w5, w5, #31
    3a84:	93407c84 	sxtw	x4, w4
    3a88:	aa1b03e2 	mov	x2, x27
    3a8c:	b9000be6 	str	w6, [sp, #8]
    3a90:	aa0803e6 	mov	x6, x8
    3a94:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    3a98:	aa1c03e3 	mov	x3, x28
    3a9c:	aa1a03e1 	mov	x1, x26
    3aa0:	aa1303e0 	mov	x0, x19
    3aa4:	97fffbd7 	bl	2a00 <_ntoa_long>
    3aa8:	aa0003fb 	mov	x27, x0
            break;
    3aac:	17fffe99 	b	3510 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    3ab0:	b940abe0 	ldr	w0, [sp, #168]
    3ab4:	11004002 	add	w2, w0, #0x10
    3ab8:	7100005f 	cmp	w2, #0x0
    3abc:	54001b4d 	b.le	3e24 <_vsnprintf+0x9b4>
    3ac0:	91003e84 	add	x4, x20, #0xf
    3ac4:	aa1403e0 	mov	x0, x20
    3ac8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3acc:	b900abe2 	str	w2, [sp, #168]
    3ad0:	17ffff36 	b	37a8 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    3ad4:	b940abe0 	ldr	w0, [sp, #168]
    3ad8:	11004002 	add	w2, w0, #0x10
    3adc:	7100005f 	cmp	w2, #0x0
    3ae0:	5400198d 	b.le	3e10 <_vsnprintf+0x9a0>
    3ae4:	91003e84 	add	x4, x20, #0xf
    3ae8:	aa1403e0 	mov	x0, x20
    3aec:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3af0:	b900abe2 	str	w2, [sp, #168]
    3af4:	17ffff1b 	b	3760 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    3af8:	b9407be0 	ldr	w0, [sp, #120]
    3afc:	11002002 	add	w2, w0, #0x8
    3b00:	7100005f 	cmp	w2, #0x0
    3b04:	540017cd 	b.le	3dfc <_vsnprintf+0x98c>
    3b08:	91003e84 	add	x4, x20, #0xf
    3b0c:	aa1403e0 	mov	x0, x20
    3b10:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3b14:	b9007be2 	str	w2, [sp, #120]
    3b18:	17ffff3d 	b	380c <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    3b1c:	b9407be0 	ldr	w0, [sp, #120]
    3b20:	11002002 	add	w2, w0, #0x8
    3b24:	7100005f 	cmp	w2, #0x0
    3b28:	5400160d 	b.le	3de8 <_vsnprintf+0x978>
    3b2c:	91003e84 	add	x4, x20, #0xf
    3b30:	aa1403e0 	mov	x0, x20
    3b34:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3b38:	b9007be2 	str	w2, [sp, #120]
    3b3c:	17ffff65 	b	38d0 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    3b40:	f94047e1 	ldr	x1, [sp, #136]
    3b44:	b9407be0 	ldr	w0, [sp, #120]
    3b48:	b9007be2 	str	w2, [sp, #120]
    3b4c:	8b20c020 	add	x0, x1, w0, sxtw
    3b50:	17fffeb3 	b	361c <_vsnprintf+0x1ac>
    3b54:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    3b58:	b940a3e0 	ldr	w0, [sp, #160]
    3b5c:	6b18001f 	cmp	w0, w24
    3b60:	540009e2 	b.cs	3c9c <_vsnprintf+0x82c>  // b.hs, b.nlast
    3b64:	51000704 	sub	w4, w24, #0x1
    3b68:	91000776 	add	x22, x27, #0x1
    3b6c:	4b000084 	sub	w4, w4, w0
    3b70:	8b160095 	add	x21, x4, x22
    3b74:	14000002 	b	3b7c <_vsnprintf+0x70c>
    3b78:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    3b7c:	aa1b03e2 	mov	x2, x27
    3b80:	aa1c03e3 	mov	x3, x28
    3b84:	aa1a03e1 	mov	x1, x26
    3b88:	52800400 	mov	w0, #0x20                  	// #32
    3b8c:	d63f0260 	blr	x19
    3b90:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    3b94:	eb1502df 	cmp	x22, x21
    3b98:	54ffff01 	b.ne	3b78 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    3b9c:	aa1503fb 	mov	x27, x21
    3ba0:	17ffff79 	b	3984 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    3ba4:	b9407be0 	ldr	w0, [sp, #120]
    3ba8:	37f80b80 	tbnz	w0, #31, 3d18 <_vsnprintf+0x8a8>
    3bac:	91002e82 	add	x2, x20, #0xb
    3bb0:	aa1403e0 	mov	x0, x20
    3bb4:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    3bb8:	b9400007 	ldr	w7, [x0]
                format++;
    3bbc:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    3bc0:	39400320 	ldrb	w0, [x25]
    3bc4:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    3bc8:	710000ff 	cmp	w7, #0x0
    3bcc:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    3bd0:	17fffe79 	b	35b4 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    3bd4:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    3bd8:	34001e28 	cbz	w8, 3f9c <_vsnprintf+0xb2c>
    3bdc:	d1000442 	sub	x2, x2, #0x1
    3be0:	17ffff42 	b	38e8 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    3be4:	35001302 	cbnz	w2, 3e44 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    3be8:	37401806 	tbnz	w6, #8, 3ee8 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    3bec:	37300ba6 	tbnz	w6, #6, 3d60 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    3bf0:	36381ba6 	tbz	w6, #7, 3f64 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    3bf4:	37f82500 	tbnz	w0, #31, 4094 <_vsnprintf+0xc24>
    3bf8:	aa1403e0 	mov	x0, x20
    3bfc:	91002e82 	add	x2, x20, #0xb
    3c00:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3c04:	79400004 	ldrh	w4, [x0]
    3c08:	1400005b 	b	3d74 <_vsnprintf+0x904>
        switch (*format) {
    3c0c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    3c10:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    3c14:	91000b24 	add	x4, x25, #0x2
    3c18:	17fffe71 	b	35dc <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    3c1c:	4b1502c1 	sub	w1, w22, w21
    3c20:	b900a3e1 	str	w1, [sp, #160]
    3c24:	17ffff3b 	b	3910 <_vsnprintf+0x4a0>
    while (*format) {
    3c28:	52800014 	mov	w20, #0x0                   	// #0
    3c2c:	17fffea0 	b	36ac <_vsnprintf+0x23c>
    3c30:	aa0203f5 	mov	x21, x2
    3c34:	17ffff51 	b	3978 <_vsnprintf+0x508>
                while (l++ < width) {
    3c38:	b940a3e1 	ldr	w1, [sp, #160]
    3c3c:	6b18003f 	cmp	w1, w24
    3c40:	11000420 	add	w0, w1, #0x1
    3c44:	54002242 	b.cs	408c <_vsnprintf+0xc1c>  // b.hs, b.nlast
    3c48:	51000700 	sub	w0, w24, #0x1
    3c4c:	91000776 	add	x22, x27, #0x1
    3c50:	4b010000 	sub	w0, w0, w1
    3c54:	8b160000 	add	x0, x0, x22
    3c58:	f90053e0 	str	x0, [sp, #160]
    3c5c:	14000002 	b	3c64 <_vsnprintf+0x7f4>
    3c60:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    3c64:	aa1b03e2 	mov	x2, x27
    3c68:	52800400 	mov	w0, #0x20                  	// #32
    3c6c:	aa1c03e3 	mov	x3, x28
    3c70:	aa1a03e1 	mov	x1, x26
    3c74:	d63f0260 	blr	x19
    3c78:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    3c7c:	f94053e0 	ldr	x0, [sp, #160]
    3c80:	eb16001f 	cmp	x0, x22
    3c84:	54fffee1 	b.ne	3c60 <_vsnprintf+0x7f0>  // b.any
    3c88:	394002a8 	ldrb	w8, [x21]
    3c8c:	11000700 	add	w0, w24, #0x1
    3c90:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    3c94:	2a0803e0 	mov	w0, w8
    3c98:	35ffe528 	cbnz	w8, 393c <_vsnprintf+0x4cc>
                while (l++ < width) {
    3c9c:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    3ca0:	aa1503fb 	mov	x27, x21
    3ca4:	17ffff38 	b	3984 <_vsnprintf+0x514>
                while (l++ < width) {
    3ca8:	7100071f 	cmp	w24, #0x1
    3cac:	54001ec9 	b.ls	4084 <_vsnprintf+0xc14>  // b.plast
    3cb0:	51000b05 	sub	w5, w24, #0x2
    3cb4:	91000776 	add	x22, x27, #0x1
    3cb8:	8b0502d5 	add	x21, x22, x5
    3cbc:	14000002 	b	3cc4 <_vsnprintf+0x854>
    3cc0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    3cc4:	aa1b03e2 	mov	x2, x27
    3cc8:	aa1c03e3 	mov	x3, x28
    3ccc:	aa1a03e1 	mov	x1, x26
    3cd0:	52800400 	mov	w0, #0x20                  	// #32
    3cd4:	d63f0260 	blr	x19
    3cd8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    3cdc:	eb1502df 	cmp	x22, x21
    3ce0:	54ffff01 	b.ne	3cc0 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    3ce4:	b9407be0 	ldr	w0, [sp, #120]
    3ce8:	37f802a0 	tbnz	w0, #31, 3d3c <_vsnprintf+0x8cc>
    3cec:	91002e82 	add	x2, x20, #0xb
    3cf0:	aa1403e0 	mov	x0, x20
    3cf4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3cf8:	39400000 	ldrb	w0, [x0]
    3cfc:	aa1503e2 	mov	x2, x21
    3d00:	910006bb 	add	x27, x21, #0x1
    3d04:	aa1c03e3 	mov	x3, x28
    3d08:	aa1a03e1 	mov	x1, x26
    3d0c:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    3d10:	a9435bf5 	ldp	x21, x22, [sp, #48]
    3d14:	17fffdff 	b	3510 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    3d18:	b9407be0 	ldr	w0, [sp, #120]
    3d1c:	11002002 	add	w2, w0, #0x8
    3d20:	7100005f 	cmp	w2, #0x0
    3d24:	5400058d 	b.le	3dd4 <_vsnprintf+0x964>
    3d28:	91002e84 	add	x4, x20, #0xb
    3d2c:	aa1403e0 	mov	x0, x20
    3d30:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3d34:	b9007be2 	str	w2, [sp, #120]
    3d38:	17ffffa0 	b	3bb8 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    3d3c:	b9407be0 	ldr	w0, [sp, #120]
    3d40:	11002002 	add	w2, w0, #0x8
    3d44:	7100005f 	cmp	w2, #0x0
    3d48:	540016ed 	b.le	4024 <_vsnprintf+0xbb4>
    3d4c:	91002e84 	add	x4, x20, #0xb
    3d50:	aa1403e0 	mov	x0, x20
    3d54:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3d58:	b9007be2 	str	w2, [sp, #120]
    3d5c:	17ffffe7 	b	3cf8 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    3d60:	37f81220 	tbnz	w0, #31, 3fa4 <_vsnprintf+0xb34>
    3d64:	91002e82 	add	x2, x20, #0xb
    3d68:	aa1403e0 	mov	x0, x20
    3d6c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3d70:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    3d74:	2a1703e7 	mov	w7, w23
    3d78:	2a0403e4 	mov	w4, w4
    3d7c:	b9000be6 	str	w6, [sp, #8]
    3d80:	aa0803e6 	mov	x6, x8
    3d84:	b90003f8 	str	w24, [sp]
    3d88:	aa1b03e2 	mov	x2, x27
    3d8c:	52800005 	mov	w5, #0x0                   	// #0
    3d90:	17ffff42 	b	3a98 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    3d94:	b9407be0 	ldr	w0, [sp, #120]
    3d98:	11002002 	add	w2, w0, #0x8
    3d9c:	7100005f 	cmp	w2, #0x0
    3da0:	5400138d 	b.le	4010 <_vsnprintf+0xba0>
    3da4:	91002e84 	add	x4, x20, #0xb
    3da8:	aa1403e0 	mov	x0, x20
    3dac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3db0:	b9007be2 	str	w2, [sp, #120]
    3db4:	17fffeab 	b	3860 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    3db8:	37f81080 	tbnz	w0, #31, 3fc8 <_vsnprintf+0xb58>
    3dbc:	91002e82 	add	x2, x20, #0xb
    3dc0:	aa1403e0 	mov	x0, x20
    3dc4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3dc8:	39400005 	ldrb	w5, [x0]
    3dcc:	2a0503e4 	mov	w4, w5
    3dd0:	17ffff2b 	b	3a7c <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    3dd4:	f94047e1 	ldr	x1, [sp, #136]
    3dd8:	b9407be0 	ldr	w0, [sp, #120]
    3ddc:	b9007be2 	str	w2, [sp, #120]
    3de0:	8b20c020 	add	x0, x1, w0, sxtw
    3de4:	17ffff75 	b	3bb8 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    3de8:	f94047e1 	ldr	x1, [sp, #136]
    3dec:	b9407be0 	ldr	w0, [sp, #120]
    3df0:	b9007be2 	str	w2, [sp, #120]
    3df4:	8b20c020 	add	x0, x1, w0, sxtw
    3df8:	17fffeb6 	b	38d0 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    3dfc:	f94047e1 	ldr	x1, [sp, #136]
    3e00:	b9407be0 	ldr	w0, [sp, #120]
    3e04:	b9007be2 	str	w2, [sp, #120]
    3e08:	8b20c020 	add	x0, x1, w0, sxtw
    3e0c:	17fffe80 	b	380c <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    3e10:	f9404be1 	ldr	x1, [sp, #144]
    3e14:	b940abe0 	ldr	w0, [sp, #168]
    3e18:	b900abe2 	str	w2, [sp, #168]
    3e1c:	8b20c020 	add	x0, x1, w0, sxtw
    3e20:	17fffe50 	b	3760 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    3e24:	f9404be1 	ldr	x1, [sp, #144]
    3e28:	b940abe0 	ldr	w0, [sp, #168]
    3e2c:	b900abe2 	str	w2, [sp, #168]
    3e30:	8b20c020 	add	x0, x1, w0, sxtw
    3e34:	17fffe5d 	b	37a8 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    3e38:	121c74c6 	and	w6, w6, #0xfffffff3
    3e3c:	d2800108 	mov	x8, #0x8                   	// #8
    3e40:	17fffefa 	b	3a28 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    3e44:	37f807e0 	tbnz	w0, #31, 3f40 <_vsnprintf+0xad0>
    3e48:	91003e82 	add	x2, x20, #0xf
    3e4c:	aa1403e0 	mov	x0, x20
    3e50:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3e54:	2a1703e7 	mov	w7, w23
    3e58:	aa1b03e2 	mov	x2, x27
    3e5c:	f9400004 	ldr	x4, [x0]
    3e60:	b90003f8 	str	w24, [sp]
    3e64:	b9000be6 	str	w6, [sp, #8]
    3e68:	aa0803e6 	mov	x6, x8
    3e6c:	17fffe6f 	b	3828 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    3e70:	37f80560 	tbnz	w0, #31, 3f1c <_vsnprintf+0xaac>
    3e74:	91003e82 	add	x2, x20, #0xf
    3e78:	aa1403e0 	mov	x0, x20
    3e7c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3e80:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    3e84:	2a1703e7 	mov	w7, w23
    3e88:	aa1b03e2 	mov	x2, x27
    3e8c:	b90003f8 	str	w24, [sp]
    3e90:	f10000bf 	cmp	x5, #0x0
    3e94:	b9000be6 	str	w6, [sp, #8]
    3e98:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    3e9c:	aa0803e6 	mov	x6, x8
    3ea0:	d37ffca5 	lsr	x5, x5, #63
    3ea4:	17fffe62 	b	382c <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    3ea8:	d2800208 	mov	x8, #0x10                  	// #16
    3eac:	17fffedb 	b	3a18 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    3eb0:	37f80c40 	tbnz	w0, #31, 4038 <_vsnprintf+0xbc8>
    3eb4:	91003e82 	add	x2, x20, #0xf
    3eb8:	aa1403e0 	mov	x0, x20
    3ebc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3ec0:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    3ec4:	2a1703e7 	mov	w7, w23
    3ec8:	aa1b03e2 	mov	x2, x27
    3ecc:	b90003f8 	str	w24, [sp]
    3ed0:	f10000bf 	cmp	x5, #0x0
    3ed4:	b9000be6 	str	w6, [sp, #8]
    3ed8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    3edc:	aa0803e6 	mov	x6, x8
    3ee0:	d37ffca5 	lsr	x5, x5, #63
    3ee4:	17fffeed 	b	3a98 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    3ee8:	37f80820 	tbnz	w0, #31, 3fec <_vsnprintf+0xb7c>
    3eec:	91003e82 	add	x2, x20, #0xf
    3ef0:	aa1403e0 	mov	x0, x20
    3ef4:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3ef8:	2a1703e7 	mov	w7, w23
    3efc:	f9400004 	ldr	x4, [x0]
    3f00:	b90003f8 	str	w24, [sp]
    3f04:	b9000be6 	str	w6, [sp, #8]
    3f08:	aa0803e6 	mov	x6, x8
    3f0c:	17ffff9f 	b	3d88 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    3f10:	121c74c6 	and	w6, w6, #0xfffffff3
    3f14:	d2800048 	mov	x8, #0x2                   	// #2
    3f18:	17fffec4 	b	3a28 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    3f1c:	b9407be0 	ldr	w0, [sp, #120]
    3f20:	11002002 	add	w2, w0, #0x8
    3f24:	7100005f 	cmp	w2, #0x0
    3f28:	54000a4d 	b.le	4070 <_vsnprintf+0xc00>
    3f2c:	91003e84 	add	x4, x20, #0xf
    3f30:	aa1403e0 	mov	x0, x20
    3f34:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3f38:	b9007be2 	str	w2, [sp, #120]
    3f3c:	17ffffd1 	b	3e80 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    3f40:	b9407be0 	ldr	w0, [sp, #120]
    3f44:	11002002 	add	w2, w0, #0x8
    3f48:	7100005f 	cmp	w2, #0x0
    3f4c:	5400088d 	b.le	405c <_vsnprintf+0xbec>
    3f50:	91003e84 	add	x4, x20, #0xf
    3f54:	aa1403e0 	mov	x0, x20
    3f58:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3f5c:	b9007be2 	str	w2, [sp, #120]
    3f60:	17ffffbd 	b	3e54 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    3f64:	37f80d00 	tbnz	w0, #31, 4104 <_vsnprintf+0xc94>
    3f68:	aa1403e0 	mov	x0, x20
    3f6c:	91002e82 	add	x2, x20, #0xb
    3f70:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3f74:	b9400004 	ldr	w4, [x0]
    3f78:	17ffff7f 	b	3d74 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    3f7c:	37f80b20 	tbnz	w0, #31, 40e0 <_vsnprintf+0xc70>
    3f80:	91002e82 	add	x2, x20, #0xb
    3f84:	aa1403e0 	mov	x0, x20
    3f88:	927df054 	and	x20, x2, #0xfffffffffffffff8
    3f8c:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    3f90:	710000bf 	cmp	w5, #0x0
    3f94:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    3f98:	17fffeb9 	b	3a7c <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    3f9c:	b900a3ff 	str	wzr, [sp, #160]
    3fa0:	17fffe5c 	b	3910 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    3fa4:	b9407be0 	ldr	w0, [sp, #120]
    3fa8:	11002002 	add	w2, w0, #0x8
    3fac:	7100005f 	cmp	w2, #0x0
    3fb0:	54000bed 	b.le	412c <_vsnprintf+0xcbc>
    3fb4:	91002e84 	add	x4, x20, #0xb
    3fb8:	aa1403e0 	mov	x0, x20
    3fbc:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3fc0:	b9007be2 	str	w2, [sp, #120]
    3fc4:	17ffff6b 	b	3d70 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    3fc8:	b9407be0 	ldr	w0, [sp, #120]
    3fcc:	11002002 	add	w2, w0, #0x8
    3fd0:	7100005f 	cmp	w2, #0x0
    3fd4:	54000b6d 	b.le	4140 <_vsnprintf+0xcd0>
    3fd8:	91002e84 	add	x4, x20, #0xb
    3fdc:	aa1403e0 	mov	x0, x20
    3fe0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    3fe4:	b9007be2 	str	w2, [sp, #120]
    3fe8:	17ffff78 	b	3dc8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    3fec:	b9407be0 	ldr	w0, [sp, #120]
    3ff0:	11002002 	add	w2, w0, #0x8
    3ff4:	7100005f 	cmp	w2, #0x0
    3ff8:	54000aed 	b.le	4154 <_vsnprintf+0xce4>
    3ffc:	91003e84 	add	x4, x20, #0xf
    4000:	aa1403e0 	mov	x0, x20
    4004:	927df094 	and	x20, x4, #0xfffffffffffffff8
    4008:	b9007be2 	str	w2, [sp, #120]
    400c:	17ffffbb 	b	3ef8 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    4010:	f94047e1 	ldr	x1, [sp, #136]
    4014:	b9407be0 	ldr	w0, [sp, #120]
    4018:	b9007be2 	str	w2, [sp, #120]
    401c:	8b20c020 	add	x0, x1, w0, sxtw
    4020:	17fffe10 	b	3860 <_vsnprintf+0x3f0>
    4024:	f94047e1 	ldr	x1, [sp, #136]
    4028:	b9407be0 	ldr	w0, [sp, #120]
    402c:	b9007be2 	str	w2, [sp, #120]
    4030:	8b20c020 	add	x0, x1, w0, sxtw
    4034:	17ffff31 	b	3cf8 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    4038:	b9407be0 	ldr	w0, [sp, #120]
    403c:	11002002 	add	w2, w0, #0x8
    4040:	7100005f 	cmp	w2, #0x0
    4044:	5400092d 	b.le	4168 <_vsnprintf+0xcf8>
    4048:	91003e84 	add	x4, x20, #0xf
    404c:	aa1403e0 	mov	x0, x20
    4050:	927df094 	and	x20, x4, #0xfffffffffffffff8
    4054:	b9007be2 	str	w2, [sp, #120]
    4058:	17ffff9a 	b	3ec0 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    405c:	f94047e1 	ldr	x1, [sp, #136]
    4060:	b9407be0 	ldr	w0, [sp, #120]
    4064:	b9007be2 	str	w2, [sp, #120]
    4068:	8b20c020 	add	x0, x1, w0, sxtw
    406c:	17ffff7a 	b	3e54 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    4070:	f94047e1 	ldr	x1, [sp, #136]
    4074:	b9407be0 	ldr	w0, [sp, #120]
    4078:	b9007be2 	str	w2, [sp, #120]
    407c:	8b20c020 	add	x0, x1, w0, sxtw
    4080:	17ffff80 	b	3e80 <_vsnprintf+0xa10>
                while (l++ < width) {
    4084:	aa1b03f5 	mov	x21, x27
    4088:	17ffff17 	b	3ce4 <_vsnprintf+0x874>
                while (l++ < width) {
    408c:	b900a3e0 	str	w0, [sp, #160]
    4090:	17ffff01 	b	3c94 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    4094:	b9407be0 	ldr	w0, [sp, #120]
    4098:	11002002 	add	w2, w0, #0x8
    409c:	7100005f 	cmp	w2, #0x0
    40a0:	5400078d 	b.le	4190 <_vsnprintf+0xd20>
    40a4:	aa1403e0 	mov	x0, x20
    40a8:	91002e84 	add	x4, x20, #0xb
    40ac:	927df094 	and	x20, x4, #0xfffffffffffffff8
    40b0:	b9007be2 	str	w2, [sp, #120]
    40b4:	79400004 	ldrh	w4, [x0]
    40b8:	17ffff2f 	b	3d74 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    40bc:	b9407be0 	ldr	w0, [sp, #120]
    40c0:	11002002 	add	w2, w0, #0x8
    40c4:	7100005f 	cmp	w2, #0x0
    40c8:	540005ad 	b.le	417c <_vsnprintf+0xd0c>
    40cc:	91002e84 	add	x4, x20, #0xb
    40d0:	aa1403e0 	mov	x0, x20
    40d4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    40d8:	b9007be2 	str	w2, [sp, #120]
    40dc:	17fffe64 	b	3a6c <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    40e0:	b9407be0 	ldr	w0, [sp, #120]
    40e4:	11002002 	add	w2, w0, #0x8
    40e8:	7100005f 	cmp	w2, #0x0
    40ec:	540005ed 	b.le	41a8 <_vsnprintf+0xd38>
    40f0:	91002e84 	add	x4, x20, #0xb
    40f4:	aa1403e0 	mov	x0, x20
    40f8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    40fc:	b9007be2 	str	w2, [sp, #120]
    4100:	17ffffa3 	b	3f8c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    4104:	b9407be0 	ldr	w0, [sp, #120]
    4108:	11002002 	add	w2, w0, #0x8
    410c:	7100005f 	cmp	w2, #0x0
    4110:	5400056d 	b.le	41bc <_vsnprintf+0xd4c>
    4114:	aa1403e0 	mov	x0, x20
    4118:	91002e84 	add	x4, x20, #0xb
    411c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    4120:	b9007be2 	str	w2, [sp, #120]
    4124:	b9400004 	ldr	w4, [x0]
    4128:	17ffff13 	b	3d74 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    412c:	f94047e1 	ldr	x1, [sp, #136]
    4130:	b9407be0 	ldr	w0, [sp, #120]
    4134:	b9007be2 	str	w2, [sp, #120]
    4138:	8b20c020 	add	x0, x1, w0, sxtw
    413c:	17ffff0d 	b	3d70 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    4140:	f94047e1 	ldr	x1, [sp, #136]
    4144:	b9407be0 	ldr	w0, [sp, #120]
    4148:	b9007be2 	str	w2, [sp, #120]
    414c:	8b20c020 	add	x0, x1, w0, sxtw
    4150:	17ffff1e 	b	3dc8 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    4154:	f94047e1 	ldr	x1, [sp, #136]
    4158:	b9407be0 	ldr	w0, [sp, #120]
    415c:	b9007be2 	str	w2, [sp, #120]
    4160:	8b20c020 	add	x0, x1, w0, sxtw
    4164:	17ffff65 	b	3ef8 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    4168:	f94047e1 	ldr	x1, [sp, #136]
    416c:	b9407be0 	ldr	w0, [sp, #120]
    4170:	b9007be2 	str	w2, [sp, #120]
    4174:	8b20c020 	add	x0, x1, w0, sxtw
    4178:	17ffff52 	b	3ec0 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    417c:	f94047e1 	ldr	x1, [sp, #136]
    4180:	b9407be0 	ldr	w0, [sp, #120]
    4184:	b9007be2 	str	w2, [sp, #120]
    4188:	8b20c020 	add	x0, x1, w0, sxtw
    418c:	17fffe38 	b	3a6c <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    4190:	f94047e1 	ldr	x1, [sp, #136]
    4194:	b9407be0 	ldr	w0, [sp, #120]
    4198:	b9007be2 	str	w2, [sp, #120]
    419c:	8b20c020 	add	x0, x1, w0, sxtw
    41a0:	79400004 	ldrh	w4, [x0]
    41a4:	17fffef4 	b	3d74 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    41a8:	f94047e1 	ldr	x1, [sp, #136]
    41ac:	b9407be0 	ldr	w0, [sp, #120]
    41b0:	b9007be2 	str	w2, [sp, #120]
    41b4:	8b20c020 	add	x0, x1, w0, sxtw
    41b8:	17ffff75 	b	3f8c <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    41bc:	f94047e1 	ldr	x1, [sp, #136]
    41c0:	b9407be0 	ldr	w0, [sp, #120]
    41c4:	b9007be2 	str	w2, [sp, #120]
    41c8:	8b20c020 	add	x0, x1, w0, sxtw
    41cc:	b9400004 	ldr	w4, [x0]
    41d0:	17fffee9 	b	3d74 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    41d4:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    41d8:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    41dc:	12001c42 	and	w2, w2, #0xff
    41e0:	7100245f 	cmp	w2, #0x9
    41e4:	54ffa2a8 	b.hi	3638 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    41e8:	52800142 	mov	w2, #0xa                   	// #10
    41ec:	d503201f 	nop
    41f0:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    41f4:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    41f8:	aa0803f9 	mov	x25, x8
    41fc:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    4200:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    4204:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    4208:	12001c84 	and	w4, w4, #0xff
    420c:	7100249f 	cmp	w4, #0x9
    4210:	54ffff09 	b.ls	41f0 <_vsnprintf+0xd80>  // b.plast
    4214:	17fffd09 	b	3638 <_vsnprintf+0x1c8>
        switch (*format) {
    4218:	aa1903e4 	mov	x4, x25
    421c:	17fffcf0 	b	35dc <_vsnprintf+0x16c>

0000000000004220 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    4220:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    4224:	910003fd 	mov	x29, sp
    4228:	f9000bf3 	str	x19, [sp, #16]
    422c:	aa0003f3 	mov	x19, x0
    4230:	3d801fe0 	str	q0, [sp, #112]
    4234:	3d8023e1 	str	q1, [sp, #128]
    4238:	3d8027e2 	str	q2, [sp, #144]
    423c:	3d802be3 	str	q3, [sp, #160]
    4240:	3d802fe4 	str	q4, [sp, #176]
    4244:	3d8033e5 	str	q5, [sp, #192]
    4248:	3d8037e6 	str	q6, [sp, #208]
    424c:	3d803be7 	str	q7, [sp, #224]
    4250:	a90f8be1 	stp	x1, x2, [sp, #248]
    4254:	a91093e3 	stp	x3, x4, [sp, #264]
    4258:	a9119be5 	stp	x5, x6, [sp, #280]
    425c:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    4260:	97fff968 	bl	2800 <init_uart_mmio>
    4264:	72001c1f 	tst	w0, #0xff
    4268:	540002e0 	b.eq	42c4 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    426c:	9103c3e0 	add	x0, sp, #0xf0
    4270:	9104c3e3 	add	x3, sp, #0x130
    4274:	9104c3e4 	add	x4, sp, #0x130
    4278:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    427c:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    4280:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    4284:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    4288:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    428c:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    4290:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    4294:	f0ffffe0 	adrp	x0, 3000 <_etoa+0x330>
    4298:	91110000 	add	x0, x0, #0x440
    429c:	910123e1 	add	x1, sp, #0x48
    42a0:	a94527e8 	ldp	x8, x9, [sp, #80]
    42a4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    42a8:	a9461fe6 	ldp	x6, x7, [sp, #96]
    42ac:	a90227e8 	stp	x8, x9, [sp, #32]
    42b0:	a9031fe6 	stp	x6, x7, [sp, #48]
    42b4:	97fffc6f 	bl	3470 <_vsnprintf>
    va_end(va);
    return ret;
}
    42b8:	f9400bf3 	ldr	x19, [sp, #16]
    42bc:	a8d37bfd 	ldp	x29, x30, [sp], #304
    42c0:	d65f03c0 	ret
        return -1;
    42c4:	12800000 	mov	w0, #0xffffffff            	// #-1
    42c8:	17fffffc 	b	42b8 <printf+0x98>
    42cc:	d503201f 	nop

00000000000042d0 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    42d0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    42d4:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    42d8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    42dc:	910003fd 	mov	x29, sp
    va_start(va, format);
    42e0:	910343eb 	add	x11, sp, #0xd0
    42e4:	910403ea 	add	x10, sp, #0x100
    42e8:	a9032bea 	stp	x10, x10, [sp, #48]
{
    42ec:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    42f0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    42f4:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    42f8:	d0ffffe0 	adrp	x0, 2000 <InodeWrite+0x80>
    42fc:	91230000 	add	x0, x0, #0x8c0
    va_start(va, format);
    4300:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    4304:	a94337ec 	ldp	x12, x13, [sp, #48]
    4308:	a90137ec 	stp	x12, x13, [sp, #16]
    430c:	a94427e8 	ldp	x8, x9, [sp, #64]
    4310:	a90227e8 	stp	x8, x9, [sp, #32]
{
    4314:	3d8017e0 	str	q0, [sp, #80]
    4318:	3d801be1 	str	q1, [sp, #96]
    431c:	3d801fe2 	str	q2, [sp, #112]
    4320:	3d8023e3 	str	q3, [sp, #128]
    4324:	3d8027e4 	str	q4, [sp, #144]
    4328:	3d802be5 	str	q5, [sp, #160]
    432c:	3d802fe6 	str	q6, [sp, #176]
    4330:	3d8033e7 	str	q7, [sp, #192]
    4334:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    4338:	aa0a03e3 	mov	x3, x10
    433c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    4340:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    4344:	910043e4 	add	x4, sp, #0x10
{
    4348:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    434c:	97fffc49 	bl	3470 <_vsnprintf>
    va_end(va);
    return ret;
}
    4350:	a8d07bfd 	ldp	x29, x30, [sp], #256
    4354:	d65f03c0 	ret
    4358:	d503201f 	nop
    435c:	d503201f 	nop

0000000000004360 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    4360:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    4364:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    4368:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    436c:	910003fd 	mov	x29, sp
    va_start(va, format);
    4370:	910343ea 	add	x10, sp, #0xd0
    4374:	910403e8 	add	x8, sp, #0x100
    4378:	a90323e8 	stp	x8, x8, [sp, #48]
{
    437c:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    4380:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    4384:	f90023ea 	str	x10, [sp, #64]
{
    4388:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    438c:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    4390:	aa0803e2 	mov	x2, x8
    4394:	a94337ec 	ldp	x12, x13, [sp, #48]
    4398:	d0ffffe0 	adrp	x0, 2000 <InodeWrite+0x80>
    439c:	a94427e8 	ldp	x8, x9, [sp, #64]
    43a0:	91230000 	add	x0, x0, #0x8c0
    43a4:	a90137ec 	stp	x12, x13, [sp, #16]
    43a8:	a90227e8 	stp	x8, x9, [sp, #32]
{
    43ac:	3d8017e0 	str	q0, [sp, #80]
    43b0:	3d801be1 	str	q1, [sp, #96]
    43b4:	3d801fe2 	str	q2, [sp, #112]
    43b8:	3d8023e3 	str	q3, [sp, #128]
    43bc:	3d8027e4 	str	q4, [sp, #144]
    43c0:	3d802be5 	str	q5, [sp, #160]
    43c4:	3d802fe6 	str	q6, [sp, #176]
    43c8:	3d8033e7 	str	q7, [sp, #192]
    43cc:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    43d0:	910043e4 	add	x4, sp, #0x10
    43d4:	aa0a03e3 	mov	x3, x10
{
    43d8:	a90e9be5 	stp	x5, x6, [sp, #232]
    43dc:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    43e0:	97fffc24 	bl	3470 <_vsnprintf>
    va_end(va);
    return ret;
}
    43e4:	a8d07bfd 	ldp	x29, x30, [sp], #256
    43e8:	d65f03c0 	ret
    43ec:	d503201f 	nop

00000000000043f0 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    43f0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    43f4:	aa0003e3 	mov	x3, x0
    43f8:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    43fc:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    4400:	a9402428 	ldp	x8, x9, [x1]
    4404:	910043e4 	add	x4, sp, #0x10
    4408:	a9411c26 	ldp	x6, x7, [x1, #16]
    440c:	f0ffffe0 	adrp	x0, 3000 <_etoa+0x330>
    4410:	9100e3e1 	add	x1, sp, #0x38
    4414:	91110000 	add	x0, x0, #0x440
    4418:	a90127e8 	stp	x8, x9, [sp, #16]
    441c:	a9021fe6 	stp	x6, x7, [sp, #32]
    4420:	97fffc14 	bl	3470 <_vsnprintf>
}
    4424:	a8c47bfd 	ldp	x29, x30, [sp], #64
    4428:	d65f03c0 	ret
    442c:	d503201f 	nop

0000000000004430 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    4430:	aa0303e4 	mov	x4, x3
    4434:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4438:	aa0103e5 	mov	x5, x1
    443c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    4440:	a9402488 	ldp	x8, x9, [x4]
    4444:	aa0003e1 	mov	x1, x0
    4448:	a9411c86 	ldp	x6, x7, [x4, #16]
    444c:	aa0203e3 	mov	x3, x2
    4450:	910043e4 	add	x4, sp, #0x10
    4454:	aa0503e2 	mov	x2, x5
    4458:	d0ffffe0 	adrp	x0, 2000 <InodeWrite+0x80>
    445c:	91230000 	add	x0, x0, #0x8c0
    4460:	a90127e8 	stp	x8, x9, [sp, #16]
    4464:	a9021fe6 	stp	x6, x7, [sp, #32]
    4468:	97fffc02 	bl	3470 <_vsnprintf>
}
    446c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4470:	d65f03c0 	ret
    4474:	d503201f 	nop
    4478:	d503201f 	nop
    447c:	d503201f 	nop

0000000000004480 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    4480:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    4484:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    4488:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    448c:	910003fd 	mov	x29, sp
    va_start(va, format);
    4490:	910443ea 	add	x10, sp, #0x110
    4494:	910383eb 	add	x11, sp, #0xe0
    4498:	f90023ea 	str	x10, [sp, #64]
{
    449c:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    44a0:	910443e2 	add	x2, sp, #0x110
    44a4:	f90027e2 	str	x2, [sp, #72]
    44a8:	f9002beb 	str	x11, [sp, #80]
{
    44ac:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    44b0:	290b23e9 	stp	w9, w8, [sp, #88]
{
    44b4:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    44b8:	a9443fee 	ldp	x14, x15, [sp, #64]
    44bc:	9100c3e1 	add	x1, sp, #0x30
    44c0:	a94527e8 	ldp	x8, x9, [sp, #80]
    44c4:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    44c8:	f0ffffe0 	adrp	x0, 3000 <_etoa+0x330>
    44cc:	91114000 	add	x0, x0, #0x450
    44d0:	a9013fee 	stp	x14, x15, [sp, #16]
    44d4:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    44d8:	f9001bec 	str	x12, [sp, #48]
    44dc:	f9001feb 	str	x11, [sp, #56]
{
    44e0:	3d801be0 	str	q0, [sp, #96]
    44e4:	3d801fe1 	str	q1, [sp, #112]
    44e8:	3d8023e2 	str	q2, [sp, #128]
    44ec:	3d8027e3 	str	q3, [sp, #144]
    44f0:	3d802be4 	str	q4, [sp, #160]
    44f4:	3d802fe5 	str	q5, [sp, #176]
    44f8:	3d8033e6 	str	q6, [sp, #192]
    44fc:	3d8037e7 	str	q7, [sp, #208]
    4500:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    4504:	910043e4 	add	x4, sp, #0x10
    4508:	aa0a03e3 	mov	x3, x10
{
    450c:	a90f9be5 	stp	x5, x6, [sp, #248]
    4510:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    4514:	97fffbd7 	bl	3470 <_vsnprintf>
    va_end(va);
    return ret;
    4518:	a8d17bfd 	ldp	x29, x30, [sp], #272
    451c:	d65f03c0 	ret

0000000000004520 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    4520:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
    4524:	7100003f 	cmp	w1, #0x0
{
    4528:	910003fd 	mov	x29, sp
    452c:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
    4530:	528000d4 	mov	w20, #0x6                   	// #6
    4534:	1b147c34 	mul	w20, w1, w20
{
    4538:	a9025bf5 	stp	x21, x22, [sp, #32]
    453c:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
    4540:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
    4544:	5400056d 	b.le	45f0 <new_ipc_msg+0xd0>
    4548:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
    454c:	2a1403f6 	mov	w22, w20
    4550:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
    4554:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
    4558:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
    455c:	91000442 	add	x2, x2, #0x1
    4560:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
    4564:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
    4568:	54ffff8c 	b.gt	4558 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    456c:	aa0303e0 	mov	x0, x3
    4570:	2a1603e1 	mov	w1, w22
    4574:	9400016f 	bl	4b30 <session_alloc_buf>
    if (buf == NULL) {
    4578:	b40004c0 	cbz	x0, 4610 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
    457c:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
    4580:	39400001 	ldrb	w1, [x0]
    4584:	52800182 	mov	w2, #0xc                   	// #12
    4588:	aa1303e3 	mov	x3, x19
    458c:	1b057ea5 	mul	w5, w21, w5
    4590:	121e7421 	and	w1, w1, #0xfffffffc
    4594:	39000001 	strb	w1, [x0]
    4598:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
    459c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    45a0:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
    45a4:	b9400064 	ldr	w4, [x3]
    45a8:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
    45ac:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    45b0:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
    45b4:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
    45b8:	b8404461 	ldr	w1, [x3], #4
    45bc:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
    45c0:	54ffff01 	b.ne	45a0 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
    45c4:	39400002 	ldrb	w2, [x0]
    45c8:	531c0ea1 	ubfiz	w1, w21, #4, #4
    45cc:	321e0021 	orr	w1, w1, #0x4
    45d0:	52800163 	mov	w3, #0xb                   	// #11
    45d4:	0a030042 	and	w2, w2, w3
    45d8:	2a020021 	orr	w1, w1, w2
    45dc:	39000001 	strb	w1, [x0]
    return buf;
}
    45e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    45e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    45e8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    45ec:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
    45f0:	2a1403e1 	mov	w1, w20
    45f4:	9400014f 	bl	4b30 <session_alloc_buf>
    if (buf == NULL) {
    45f8:	b40000c0 	cbz	x0, 4610 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
    45fc:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
    4600:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
    4604:	121e7421 	and	w1, w1, #0xfffffffc
    4608:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
    460c:	17ffffee 	b	45c4 <new_ipc_msg+0xa4>
        return NULL;
    4610:	d2800000 	mov	x0, #0x0                   	// #0
    4614:	17fffff3 	b	45e0 <new_ipc_msg+0xc0>
    4618:	d503201f 	nop
    461c:	d503201f 	nop

0000000000004620 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    4620:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    4624:	2a0103e4 	mov	w4, w1
    4628:	aa0203e1 	mov	x1, x2
    462c:	910003fd 	mov	x29, sp
    4630:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
    4634:	39400003 	ldrb	w3, [x0]
    4638:	d3441c63 	ubfx	x3, x3, #4, #4
    463c:	6b04007f 	cmp	w3, w4
    4640:	540003ad 	b.le	46b4 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    4644:	528000c5 	mov	w5, #0x6                   	// #6
    4648:	d2800183 	mov	x3, #0xc                   	// #12
    464c:	9b250c84 	smaddl	x4, w4, w5, x3
    4650:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
    4654:	794004a3 	ldrh	w3, [x5, #2]
    4658:	37f801e2 	tbnz	w2, #31, 4694 <ipc_msg_set_nth_arg+0x74>
    465c:	6b02007f 	cmp	w3, w2
    4660:	540001a3 	b.cc	4694 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
    4664:	394010a3 	ldrb	w3, [x5, #4]
    4668:	37000423 	tbnz	w3, #0, 46ec <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    466c:	78646803 	ldrh	w3, [x0, x4]
    4670:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
    4674:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
    4678:	b4000301 	cbz	x1, 46d8 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
    467c:	121f7863 	and	w3, w3, #0xfffffffe
    4680:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
    4684:	940005ff 	bl	5e80 <memmove>
    return true;
    4688:	52800020 	mov	w0, #0x1                   	// #1
}
    468c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    4690:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
    4694:	d0000041 	adrp	x1, e000 <__func__.0+0x280>
    4698:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    469c:	9108e021 	add	x1, x1, #0x238
    46a0:	91044000 	add	x0, x0, #0x110
    46a4:	97fffedf 	bl	4220 <printf>
        return false;
    46a8:	52800000 	mov	w0, #0x0                   	// #0
}
    46ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
    46b0:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
    46b4:	2a0403e2 	mov	w2, w4
    46b8:	d0000041 	adrp	x1, e000 <__func__.0+0x280>
    46bc:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    46c0:	9108e021 	add	x1, x1, #0x238
    46c4:	91034000 	add	x0, x0, #0xd0
    46c8:	97fffed6 	bl	4220 <printf>
        return false;
    46cc:	52800000 	mov	w0, #0x0                   	// #0
}
    46d0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    46d4:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
    46d8:	32000063 	orr	w3, w3, #0x1
    46dc:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
    46e0:	94000618 	bl	5f40 <memset>
        return true;
    46e4:	52800020 	mov	w0, #0x1                   	// #1
    46e8:	17ffffe9 	b	468c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
    46ec:	d2800000 	mov	x0, #0x0                   	// #0
    46f0:	17ffffe1 	b	4674 <ipc_msg_set_nth_arg+0x54>
    46f4:	d503201f 	nop
    46f8:	d503201f 	nop
    46fc:	d503201f 	nop

0000000000004700 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    4700:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4704:	aa0003e4 	mov	x4, x0
    4708:	910003fd 	mov	x29, sp
    470c:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
    4710:	39400005 	ldrb	w5, [x0]
    4714:	d3441ca5 	ubfx	x5, x5, #4, #4
    4718:	6b0100bf 	cmp	w5, w1
    471c:	5400030d 	b.le	477c <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    4720:	528000c5 	mov	w5, #0x6                   	// #6
    4724:	aa0203e0 	mov	x0, x2
    4728:	d2800182 	mov	x2, #0xc                   	// #12
    472c:	9b250821 	smaddl	x1, w1, w5, x2
    4730:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
    4734:	79400445 	ldrh	w5, [x2, #2]
    4738:	6b0300bf 	cmp	w5, w3
    473c:	5400036b 	b.lt	47a8 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
    4740:	39401042 	ldrb	w2, [x2, #4]
        return true;
    4744:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
    4748:	360000a2 	tbz	w2, #0, 475c <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
    474c:	2a1303e0 	mov	w0, w19
    4750:	f9400bf3 	ldr	x19, [sp, #16]
    4754:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4758:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    475c:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
    4760:	93407c62 	sxtw	x2, w3
    4764:	8b010081 	add	x1, x4, x1
    4768:	940005c6 	bl	5e80 <memmove>
}
    476c:	2a1303e0 	mov	w0, w19
    4770:	f9400bf3 	ldr	x19, [sp, #16]
    4774:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4778:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
    477c:	d0000041 	adrp	x1, e000 <__func__.0+0x280>
    4780:	9108e021 	add	x1, x1, #0x238
    4784:	91006021 	add	x1, x1, #0x18
        return false;
    4788:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
    478c:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4790:	91056000 	add	x0, x0, #0x158
    4794:	97fffea3 	bl	4220 <printf>
}
    4798:	2a1303e0 	mov	w0, w19
    479c:	f9400bf3 	ldr	x19, [sp, #16]
    47a0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    47a4:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    47a8:	d0000041 	adrp	x1, e000 <__func__.0+0x280>
    47ac:	9108e021 	add	x1, x1, #0x238
    47b0:	91006021 	add	x1, x1, #0x18
        return false;
    47b4:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    47b8:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    47bc:	91060000 	add	x0, x0, #0x180
    47c0:	97fffe98 	bl	4220 <printf>
}
    47c4:	2a1303e0 	mov	w0, w19
    47c8:	f9400bf3 	ldr	x19, [sp, #16]
    47cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    47d0:	d65f03c0 	ret
    47d4:	d503201f 	nop
    47d8:	d503201f 	nop
    47dc:	d503201f 	nop

00000000000047e0 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    47e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    47e4:	d2800021 	mov	x1, #0x1                   	// #1
    47e8:	f2db9741 	movk	x1, #0xdcba, lsl #32
    47ec:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
    47f0:	910003fd 	mov	x29, sp
    47f4:	f9000bf3 	str	x19, [sp, #16]
    47f8:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
    47fc:	f9400000 	ldr	x0, [x0]
    4800:	927e7400 	and	x0, x0, #0xfffffffc
    4804:	aa010000 	orr	x0, x0, x1
    4808:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
    480c:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    4810:	52800040 	mov	w0, #0x2                   	// #2
    4814:	940001d7 	bl	4f70 <yield>
    while (msg->header.done == 0) {
    4818:	39400261 	ldrb	w1, [x19]
    481c:	360fffa1 	tbz	w1, #1, 4810 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
    4820:	f9400bf3 	ldr	x19, [sp, #16]
    4824:	a8c27bfd 	ldp	x29, x30, [sp], #32
    4828:	d65f03c0 	ret
    482c:	d503201f 	nop

0000000000004830 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    4830:	f9400001 	ldr	x1, [x0]
    4834:	d2800022 	mov	x2, #0x1                   	// #1
    4838:	f2db9742 	movk	x2, #0xdcba, lsl #32
    483c:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    4840:	927e7421 	and	x1, x1, #0xfffffffc
    4844:	aa020021 	orr	x1, x1, x2
    4848:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    484c:	d65f03c0 	ret

0000000000004850 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    4850:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    4854:	910003fd 	mov	x29, sp
    4858:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    485c:	b9800801 	ldrsw	x1, [x0, #8]
    4860:	f9400800 	ldr	x0, [x0, #16]
    4864:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    4868:	38616800 	ldrb	w0, [x0, x1]
    486c:	370800a0 	tbnz	w0, #1, 4880 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    4870:	52800040 	mov	w0, #0x2                   	// #2
    4874:	940001bf 	bl	4f70 <yield>
    while (msg->header.done == 0) {
    4878:	39400260 	ldrb	w0, [x19]
    487c:	360fffa0 	tbz	w0, #1, 4870 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    4880:	b9400a60 	ldr	w0, [x19, #8]
    4884:	f9400bf3 	ldr	x19, [sp, #16]
    4888:	a8c27bfd 	ldp	x29, x30, [sp], #32
    488c:	d65f03c0 	ret

0000000000004890 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    4890:	f0000040 	adrp	x0, f000 <IpcFsServer+0x5d8>
}
    4894:	b9422800 	ldr	w0, [x0, #552]
    4898:	d65f03c0 	ret
    489c:	d503201f 	nop

00000000000048a0 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    48a0:	90000520 	adrp	x0, a8000 <_stack+0x28000>
    48a4:	52800021 	mov	w1, #0x1                   	// #1
    48a8:	39172001 	strb	w1, [x0, #1480]
}
    48ac:	d65f03c0 	ret

00000000000048b0 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    48b0:	90000520 	adrp	x0, a8000 <_stack+0x28000>
}
    48b4:	39572000 	ldrb	w0, [x0, #1480]
    48b8:	d65f03c0 	ret
    48bc:	d503201f 	nop

00000000000048c0 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    48c0:	90000520 	adrp	x0, a8000 <_stack+0x28000>
    48c4:	f942e800 	ldr	x0, [x0, #1488]
    48c8:	b4000080 	cbz	x0, 48d8 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    48cc:	39400000 	ldrb	w0, [x0]
    48d0:	d3430c00 	ubfx	x0, x0, #3, #1
}
    48d4:	d65f03c0 	ret
        return false;
    48d8:	52800000 	mov	w0, #0x0                   	// #0
}
    48dc:	d65f03c0 	ret

00000000000048e0 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    48e0:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    48e4:	d2806002 	mov	x2, #0x300                 	// #768
    48e8:	52800001 	mov	w1, #0x0                   	// #0
{
    48ec:	a9007bfd 	stp	x29, x30, [sp]
    48f0:	910003fd 	mov	x29, sp
    48f4:	a90153f3 	stp	x19, x20, [sp, #16]
    48f8:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    48fc:	9101c3e0 	add	x0, sp, #0x70
{
    4900:	a9025bf5 	stp	x21, x22, [sp, #32]
    4904:	f0000055 	adrp	x21, f000 <IpcFsServer+0x5d8>
    4908:	9108a2b5 	add	x21, x21, #0x228
    490c:	a90363f7 	stp	x23, x24, [sp, #48]
    4910:	d0000056 	adrp	x22, e000 <__func__.0+0x280>
    4914:	910762d6 	add	x22, x22, #0x1d8
    4918:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    491c:	529b9754 	mov	w20, #0xdcba                	// #56506
    4920:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    4924:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    4928:	94000586 	bl	5f40 <memset>
    492c:	90000524 	adrp	x4, a8000 <_stack+0x28000>
    4930:	9117209c 	add	x28, x4, #0x5c8
    4934:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4938:	9106c000 	add	x0, x0, #0x1b0
    493c:	f90037e0 	str	x0, [sp, #104]
    4940:	d000005b 	adrp	x27, e000 <__func__.0+0x280>
    4944:	91080360 	add	x0, x27, #0x200
    4948:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    494c:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    4950:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    4954:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    4958:	52800401 	mov	w1, #0x20                  	// #32
    495c:	940001a5 	bl	4ff0 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    4960:	9101c3fb 	add	x27, sp, #0x70
    4964:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    4968:	52800019 	mov	w25, #0x0                   	// #0
    496c:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    4970:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    4974:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    4978:	b4000980 	cbz	x0, 4aa8 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    497c:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    4980:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    4984:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    4988:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    498c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    4990:	b9400401 	ldr	w1, [x0, #4]
    4994:	6b14003f 	cmp	w1, w20
    4998:	54000340 	b.eq	4a00 <ipc_server_loop+0x120>  // b.none
    499c:	14000039 	b	4a80 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    49a0:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    49a4:	f9400780 	ldr	x0, [x28, #8]
    49a8:	39400001 	ldrb	w1, [x0]
    49ac:	36080641 	tbz	w1, #1, 4a74 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    49b0:	29409b62 	ldp	w2, w6, [x27, #4]
    49b4:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    49b8:	79400400 	ldrh	w0, [x0, #2]
    49bc:	0b010041 	add	w1, w2, w1
    49c0:	4b060021 	sub	w1, w1, w6
    49c4:	1ac20c25 	sdiv	w5, w1, w2
    49c8:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    49cc:	6b01001f 	cmp	w0, w1
    49d0:	5400078c 	b.gt	4ac0 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    49d4:	0b060000 	add	w0, w0, w6
    49d8:	1ac20c01 	sdiv	w1, w0, w2
    49dc:	1b028020 	msub	w0, w1, w2, w0
    49e0:	b9000b60 	str	w0, [x27, #8]
    49e4:	37f804e0 	tbnz	w0, #31, 4a80 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    49e8:	f9400b61 	ldr	x1, [x27, #16]
    49ec:	8b20c020 	add	x0, x1, w0, sxtw
    49f0:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    49f4:	b9400401 	ldr	w1, [x0, #4]
    49f8:	6b14003f 	cmp	w1, w20
    49fc:	54000421 	b.ne	4a80 <ipc_server_loop+0x1a0>  // b.any
    4a00:	39400001 	ldrb	w1, [x0]
    4a04:	12000421 	and	w1, w1, #0x3
    4a08:	7100043f 	cmp	w1, #0x1
    4a0c:	540003a1 	b.ne	4a80 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    4a10:	29409761 	ldp	w1, w5, [x27, #4]
    4a14:	b9400f66 	ldr	w6, [x27, #12]
    4a18:	0b0100c2 	add	w2, w6, w1
    4a1c:	4b050042 	sub	w2, w2, w5
    4a20:	1ac10c45 	sdiv	w5, w2, w1
    4a24:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    4a28:	35000122 	cbnz	w2, 4a4c <ipc_server_loop+0x16c>
    4a2c:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    4a30:	6b01005f 	cmp	w2, w1
    4a34:	5400056c 	b.gt	4ae0 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    4a38:	0b060042 	add	w2, w2, w6
    4a3c:	1ac10c45 	sdiv	w5, w2, w1
    4a40:	1b0188a2 	msub	w2, w5, w1, w2
    4a44:	b9000f62 	str	w2, [x27, #12]
    4a48:	37f801c2 	tbnz	w2, #31, 4a80 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    4a4c:	39400402 	ldrb	w2, [x0, #1]
    4a50:	39400401 	ldrb	w1, [x0, #1]
    4a54:	8b020e62 	add	x2, x19, x2, lsl #3
    4a58:	f9400442 	ldr	x2, [x2, #8]
    4a5c:	b5fffa22 	cbnz	x2, 49a0 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    4a60:	f9400262 	ldr	x2, [x19]
    4a64:	aa1603e0 	mov	x0, x22
    4a68:	97fffdee 	bl	4220 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    4a6c:	f9400780 	ldr	x0, [x28, #8]
    4a70:	17ffffd0 	b	49b0 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    4a74:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    4a78:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    4a7c:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    4a80:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    4a84:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    4a88:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    4a8c:	eb1b02ff 	cmp	x23, x27
    4a90:	54fff701 	b.ne	4970 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    4a94:	52000340 	eor	w0, w26, #0x1
    4a98:	5280003a 	mov	w26, #0x1                   	// #1
    4a9c:	6a00033f 	tst	w25, w0
    4aa0:	54fff601 	b.ne	4960 <ipc_server_loop+0x80>  // b.any
    4aa4:	17ffffaa 	b	494c <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    4aa8:	94000132 	bl	4f70 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    4aac:	52000340 	eor	w0, w26, #0x1
    4ab0:	5280003a 	mov	w26, #0x1                   	// #1
    4ab4:	6a00033f 	tst	w25, w0
    4ab8:	54fff541 	b.ne	4960 <ipc_server_loop+0x80>  // b.any
    4abc:	17ffffa4 	b	494c <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    4ac0:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    4ac4:	9100637b 	add	x27, x27, #0x18
    4ac8:	97fffdd6 	bl	4220 <printf>
                cur_sess_id = -1;
    4acc:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    4ad0:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    4ad4:	eb1b02ff 	cmp	x23, x27
    4ad8:	54fff4c1 	b.ne	4970 <ipc_server_loop+0x90>  // b.any
    4adc:	17ffffee 	b	4a94 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    4ae0:	f94037e0 	ldr	x0, [sp, #104]
    4ae4:	9100637b 	add	x27, x27, #0x18
    4ae8:	97fffdce 	bl	4220 <printf>
                cur_sess_id = -1;
    4aec:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    4af0:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    4af4:	eb1b02ff 	cmp	x23, x27
    4af8:	54fff3c1 	b.ne	4970 <ipc_server_loop+0x90>  // b.any
    4afc:	17ffffe6 	b	4a94 <ipc_server_loop+0x1b4>

0000000000004b00 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    4b00:	aa0003e3 	mov	x3, x0
    4b04:	aa0103e0 	mov	x0, x1
    4b08:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    4b0c:	aa0303e2 	mov	x2, x3
    4b10:	14000130 	b	4fd0 <session>
    4b14:	d503201f 	nop
    4b18:	d503201f 	nop
    4b1c:	d503201f 	nop

0000000000004b20 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    4b20:	1400013c 	b	5010 <close_session>
    4b24:	d503201f 	nop
    4b28:	d503201f 	nop
    4b2c:	d503201f 	nop

0000000000004b30 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    4b30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4b34:	910003fd 	mov	x29, sp
    4b38:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    4b3c:	37f80561 	tbnz	w1, #31, 4be8 <session_alloc_buf+0xb8>
    4b40:	a90153f3 	stp	x19, x20, [sp, #16]
    4b44:	2a0103f4 	mov	w20, w1
    4b48:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    4b4c:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    4b50:	d2800015 	mov	x21, #0x0                   	// #0
    4b54:	b9400c03 	ldr	w3, [x0, #12]
    4b58:	0b030020 	add	w0, w1, w3
    4b5c:	4b020000 	sub	w0, w0, w2
    4b60:	1ac10c02 	sdiv	w2, w0, w1
    4b64:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    4b68:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    4b6c:	6b01029f 	cmp	w20, w1
    4b70:	5400032c 	b.gt	4bd4 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    4b74:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    4b78:	93407e82 	sxtw	x2, w20
    4b7c:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    4b80:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    4b84:	aa1503e0 	mov	x0, x21
    4b88:	940004ee 	bl	5f40 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    4b8c:	29408e60 	ldp	w0, w3, [x19, #4]
    4b90:	b9400e61 	ldr	w1, [x19, #12]
    4b94:	0b010002 	add	w2, w0, w1
    4b98:	4b030043 	sub	w3, w2, w3
    4b9c:	1ac00c62 	sdiv	w2, w3, w0
    4ba0:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    4ba4:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    4ba8:	6b02029f 	cmp	w20, w2
    4bac:	5400028c 	b.gt	4bfc <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    4bb0:	0b010294 	add	w20, w20, w1
    4bb4:	1ac00e81 	sdiv	w1, w20, w0
    4bb8:	1b00d034 	msub	w20, w1, w0, w20
    4bbc:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    4bc0:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    4bc4:	aa1503e0 	mov	x0, x21
    4bc8:	f94013f5 	ldr	x21, [sp, #32]
    4bcc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4bd0:	d65f03c0 	ret
    4bd4:	aa1503e0 	mov	x0, x21
    4bd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    4bdc:	f94013f5 	ldr	x21, [sp, #32]
    4be0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4be4:	d65f03c0 	ret
        return NULL;
    4be8:	d2800015 	mov	x21, #0x0                   	// #0
}
    4bec:	aa1503e0 	mov	x0, x21
    4bf0:	f94013f5 	ldr	x21, [sp, #32]
    4bf4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4bf8:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    4bfc:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4c00:	9106c000 	add	x0, x0, #0x1b0
    4c04:	97fffd87 	bl	4220 <printf>
        return -1;
    4c08:	a94153f3 	ldp	x19, x20, [sp, #16]
    4c0c:	17ffffee 	b	4bc4 <session_alloc_buf+0x94>

0000000000004c10 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    4c10:	37f80241 	tbnz	w1, #31, 4c58 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    4c14:	29409403 	ldp	w3, w5, [x0, #4]
    4c18:	aa0003e2 	mov	x2, x0
    4c1c:	b9400c00 	ldr	w0, [x0, #12]
    4c20:	0b000060 	add	w0, w3, w0
    4c24:	4b050000 	sub	w0, w0, w5
    4c28:	1ac30c04 	sdiv	w4, w0, w3
    4c2c:	1b038080 	msub	w0, w4, w3, w0
    4c30:	6b00003f 	cmp	w1, w0
    4c34:	5400012c 	b.gt	4c58 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    4c38:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    4c3c:	52800020 	mov	w0, #0x1                   	// #1
    4c40:	1ac30c24 	sdiv	w4, w1, w3
    4c44:	1b038481 	msub	w1, w4, w3, w1
    4c48:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    4c4c:	3100043f 	cmn	w1, #0x1
    4c50:	54000080 	b.eq	4c60 <session_free_buf+0x50>  // b.none
}
    4c54:	d65f03c0 	ret
        return false;
    4c58:	52800000 	mov	w0, #0x0                   	// #0
}
    4c5c:	d65f03c0 	ret
{
    4c60:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    4c64:	d0000043 	adrp	x3, e000 <__func__.0+0x280>
    4c68:	d0000042 	adrp	x2, e000 <__func__.0+0x280>
{
    4c6c:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    4c70:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4c74:	9109a063 	add	x3, x3, #0x268
    4c78:	910aa042 	add	x2, x2, #0x2a8
    4c7c:	910a6000 	add	x0, x0, #0x298
    4c80:	52800801 	mov	w1, #0x40                  	// #64
    4c84:	94000373 	bl	5a50 <__assert_func>
    4c88:	d503201f 	nop
    4c8c:	d503201f 	nop

0000000000004c90 <BlockRead>:
}

// Locate the data block using block_num
uint8_t* BlockRead(int block_num)
{
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4c90:	900000e1 	adrp	x1, 20000 <session_cwd+0xfa50>
    4c94:	f942d821 	ldr	x1, [x1, #1456]
    4c98:	53175800 	lsl	w0, w0, #9
    return data;
}
    4c9c:	8b20c020 	add	x0, x1, w0, sxtw
    4ca0:	d65f03c0 	ret
    4ca4:	d503201f 	nop
    4ca8:	d503201f 	nop
    4cac:	d503201f 	nop

0000000000004cb0 <BlockAlloc>:
    memset(data, 0, BLOCK_SIZE);
}

// Allocate a zeroed disk block.
uint32_t BlockAlloc()
{
    4cb0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4cb4:	910003fd 	mov	x29, sp
    int bit_index, block_index, bit_mark;

    struct SuperBlock sb;

    ReadSuperBlock(&sb);
    4cb8:	910083e0 	add	x0, sp, #0x20
{
    4cbc:	f9000bf3 	str	x19, [sp, #16]
    ReadSuperBlock(&sb);
    4cc0:	97fff400 	bl	1cc0 <ReadSuperBlock>

    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    4cc4:	b94023e2 	ldr	w2, [sp, #32]
    4cc8:	34000562 	cbz	w2, 4d74 <BlockAlloc+0xc4>

        uint8_t* data = BlockRead(BLOCK_BIT_INDEX(bit_index, sb.ninodes));
    4ccc:	b9402be8 	ldr	w8, [sp, #40]
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4cd0:	900000ea 	adrp	x10, 20000 <session_cwd+0xfa50>
    4cd4:	f942d949 	ldr	x9, [x10, #1456]
    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    4cd8:	52800001 	mov	w1, #0x0                   	// #0
        uint8_t* data = BlockRead(BLOCK_BIT_INDEX(bit_index, sb.ninodes));
    4cdc:	53027d08 	lsr	w8, w8, #2

        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
            bit_mark = 1 << (block_index % 8);
    4ce0:	52800027 	mov	w7, #0x1                   	// #1
    4ce4:	11000d08 	add	w8, w8, #0x3
        uint8_t* data = BlockRead(BLOCK_BIT_INDEX(bit_index, sb.ninodes));
    4ce8:	0b813105 	add	w5, w8, w1, asr #12
    4cec:	2a0103f3 	mov	w19, w1
        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    4cf0:	52800000 	mov	w0, #0x0                   	// #0
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4cf4:	531758a5 	lsl	w5, w5, #9
    4cf8:	8b25c125 	add	x5, x9, w5, sxtw
        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    4cfc:	14000009 	b	4d20 <BlockAlloc+0x70>

            if ((data[block_index / 8] & bit_mark) == 0) {
    4d00:	3863c8a6 	ldrb	w6, [x5, w3, sxtw]
            bit_mark = 1 << (block_index % 8);
    4d04:	1ac420e4 	lsl	w4, w7, w4
            if ((data[block_index / 8] & bit_mark) == 0) {
    4d08:	8b23c0a3 	add	x3, x5, w3, sxtw
    4d0c:	6a0400df 	tst	w6, w4
    4d10:	540001a0 	b.eq	4d44 <BlockAlloc+0x94>  // b.none
        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    4d14:	11000673 	add	w19, w19, #0x1
    4d18:	7140041f 	cmp	w0, #0x1, lsl #12
    4d1c:	540000c0 	b.eq	4d34 <BlockAlloc+0x84>  // b.none
            if ((data[block_index / 8] & bit_mark) == 0) {
    4d20:	13037c03 	asr	w3, w0, #3
            bit_mark = 1 << (block_index % 8);
    4d24:	12000804 	and	w4, w0, #0x7
        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    4d28:	6b13005f 	cmp	w2, w19
    4d2c:	11000400 	add	w0, w0, #0x1
    4d30:	54fffe88 	b.hi	4d00 <BlockAlloc+0x50>  // b.pmore
    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    4d34:	11400421 	add	w1, w1, #0x1, lsl #12
    4d38:	6b01005f 	cmp	w2, w1
    4d3c:	54fffd68 	b.hi	4ce8 <BlockAlloc+0x38>  // b.pmore
    4d40:	1400000e 	b	4d78 <BlockAlloc+0xc8>
                data[block_index / 8] |= bit_mark;
    4d44:	2a0400c4 	orr	w4, w6, w4
    4d48:	39000064 	strb	w4, [x3]
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4d4c:	53175a60 	lsl	w0, w19, #9
    memset(data, 0, BLOCK_SIZE);
    4d50:	d2804002 	mov	x2, #0x200                 	// #512
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4d54:	f942d943 	ldr	x3, [x10, #1456]
    memset(data, 0, BLOCK_SIZE);
    4d58:	52800001 	mov	w1, #0x0                   	// #0
    4d5c:	8b20c060 	add	x0, x3, w0, sxtw
    4d60:	94000478 	bl	5f40 <memset>
    }

    printf("BlockAlloc: out of blocks, bit idx: %d, total size: %d\n", bit_index, sb.size);
    Error("");
    return 0;
}
    4d64:	2a1303e0 	mov	w0, w19
    4d68:	f9400bf3 	ldr	x19, [sp, #16]
    4d6c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4d70:	d65f03c0 	ret
    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    4d74:	52800001 	mov	w1, #0x0                   	// #0
    printf("BlockAlloc: out of blocks, bit idx: %d, total size: %d\n", bit_index, sb.size);
    4d78:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4d7c:	910b0000 	add	x0, x0, #0x2c0
    4d80:	97fffd28 	bl	4220 <printf>
    printf("Error: %s\n", s);
    4d84:	b0000041 	adrp	x1, d000 <__ascii_wctomb+0x30>
    4d88:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4d8c:	912d4021 	add	x1, x1, #0xb50
    4d90:	910be000 	add	x0, x0, #0x2f8
    4d94:	97fffd23 	bl	4220 <printf>
    for (;;)
    4d98:	14000000 	b	4d98 <BlockAlloc+0xe8>
    4d9c:	d503201f 	nop

0000000000004da0 <BlockFree>:

// Free a disk block.
void BlockFree(int block_num)
{
    4da0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    4da4:	910003fd 	mov	x29, sp
    4da8:	f9000bf3 	str	x19, [sp, #16]
    4dac:	2a0003f3 	mov	w19, w0
    struct SuperBlock sb;
    int block_index, bit_mark;

    ReadSuperBlock(&sb);
    4db0:	910083e0 	add	x0, sp, #0x20
    4db4:	97fff3c3 	bl	1cc0 <ReadSuperBlock>

    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));

    block_index = block_num % BITMAP_SIZE;
    4db8:	6b1303e1 	negs	w1, w19
    4dbc:	12002e60 	and	w0, w19, #0xfff
    4dc0:	12002c21 	and	w1, w1, #0xfff
    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    4dc4:	b9402be4 	ldr	w4, [sp, #40]
    block_index = block_num % BITMAP_SIZE;
    4dc8:	5a814401 	csneg	w1, w0, w1, mi  // mi = first
    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    4dcc:	113ffe62 	add	w2, w19, #0xfff
    bit_mark = 1 << (block_index % 8);
    4dd0:	6b0103e3 	negs	w3, w1
    4dd4:	12000820 	and	w0, w1, #0x7
    4dd8:	12000863 	and	w3, w3, #0x7
    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    4ddc:	53027c84 	lsr	w4, w4, #2
    bit_mark = 1 << (block_index % 8);
    4de0:	5a834403 	csneg	w3, w0, w3, mi  // mi = first
    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    4de4:	7100027f 	cmp	w19, #0x0
    4de8:	1a93b040 	csel	w0, w2, w19, lt  // lt = tstop
    4dec:	11000c82 	add	w2, w4, #0x3
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4df0:	900000e4 	adrp	x4, 20000 <session_cwd+0xfa50>
    4df4:	f942d884 	ldr	x4, [x4, #1456]
    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    4df8:	0b803040 	add	w0, w2, w0, asr #12

    if ((data[block_index / 8] & bit_mark) == 0) {
    4dfc:	7100003f 	cmp	w1, #0x0
    4e00:	11001c22 	add	w2, w1, #0x7
    4e04:	1a81b041 	csel	w1, w2, w1, lt  // lt = tstop
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4e08:	53175800 	lsl	w0, w0, #9
    bit_mark = 1 << (block_index % 8);
    4e0c:	52800022 	mov	w2, #0x1                   	// #1
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    4e10:	8b20c080 	add	x0, x4, w0, sxtw
    if ((data[block_index / 8] & bit_mark) == 0) {
    4e14:	13037c21 	asr	w1, w1, #3
    bit_mark = 1 << (block_index % 8);
    4e18:	1ac32042 	lsl	w2, w2, w3
    if ((data[block_index / 8] & bit_mark) == 0) {
    4e1c:	3861c803 	ldrb	w3, [x0, w1, sxtw]
    4e20:	6a02007f 	tst	w3, w2
    4e24:	540000c0 	b.eq	4e3c <BlockFree+0x9c>  // b.none
        Error("freeing free block");
    }

    data[block_index / 8] &= ~bit_mark;
    4e28:	0a220062 	bic	w2, w3, w2
    4e2c:	3821c802 	strb	w2, [x0, w1, sxtw]
}
    4e30:	f9400bf3 	ldr	x19, [sp, #16]
    4e34:	a8c37bfd 	ldp	x29, x30, [sp], #48
    4e38:	d65f03c0 	ret
    printf("Error: %s\n", s);
    4e3c:	d0000041 	adrp	x1, e000 <__func__.0+0x280>
    4e40:	d0000040 	adrp	x0, e000 <__func__.0+0x280>
    4e44:	910c2021 	add	x1, x1, #0x308
    4e48:	910be000 	add	x0, x0, #0x2f8
    4e4c:	97fffcf5 	bl	4220 <printf>
    for (;;)
    4e50:	14000000 	b	4e50 <BlockFree+0xb0>
    4e54:	d503201f 	nop
    4e58:	d503201f 	nop
    4e5c:	d503201f 	nop

0000000000004e60 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    4e60:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    4e64:	910003fd 	mov	x29, sp
    4e68:	a90153f3 	stp	x19, x20, [sp, #16]
    4e6c:	a9025bf5 	stp	x21, x22, [sp, #32]
    4e70:	2a0103f6 	mov	w22, w1
    4e74:	a90363f7 	stp	x23, x24, [sp, #48]
    4e78:	aa0203f8 	mov	x24, x2
    4e7c:	aa0003f7 	mov	x23, x0
    4e80:	a9046bf9 	stp	x25, x26, [sp, #64]
    4e84:	aa0403f9 	mov	x25, x4
    4e88:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    4e8c:	d63f0060 	blr	x3
    4e90:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    4e94:	93407c00 	sxtw	x0, w0
    4e98:	94000202 	bl	56a0 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    4e9c:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    4ea0:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    4ea4:	5400022d 	b.le	4ee8 <spawn+0x88>
    4ea8:	52800013 	mov	w19, #0x0                   	// #0
    4eac:	f9002bfb 	str	x27, [sp, #80]
    4eb0:	5282001b 	mov	w27, #0x1000                	// #4096
    4eb4:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    4eb8:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    4ebc:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    4ec0:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    4ec4:	8b33c2a2 	add	x2, x21, w19, sxtw
    4ec8:	1a9bd084 	csel	w4, w4, w27, le
    4ecc:	2a1603e1 	mov	w1, w22
    4ed0:	aa1703e0 	mov	x0, x23
    4ed4:	d63f0300 	blr	x24
    4ed8:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    4edc:	6b13029f 	cmp	w20, w19
    4ee0:	54fffecc 	b.gt	4eb8 <spawn+0x58>
    4ee4:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    4ee8:	aa1a03e3 	mov	x3, x26
    4eec:	aa1903e2 	mov	x2, x25
    4ef0:	aa1503e1 	mov	x1, x21
    4ef4:	d2800004 	mov	x4, #0x0                   	// #0
    4ef8:	52800020 	mov	w0, #0x1                   	// #1
    4efc:	940000b9 	bl	51e0 <syscall>
    4f00:	2a0003f3 	mov	w19, w0
    free(img);
    4f04:	aa1503e0 	mov	x0, x21
    4f08:	9400028a 	bl	5930 <free>
    return ret;
}
    4f0c:	2a1303e0 	mov	w0, w19
    4f10:	a94153f3 	ldp	x19, x20, [sp, #16]
    4f14:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4f18:	a94363f7 	ldp	x23, x24, [sp, #48]
    4f1c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4f20:	a8c67bfd 	ldp	x29, x30, [sp], #96
    4f24:	d65f03c0 	ret
    4f28:	d503201f 	nop
    4f2c:	d503201f 	nop

0000000000004f30 <thread>:

int thread(void* entry, char* name, char** argv)
{
    4f30:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    4f34:	aa0203e3 	mov	x3, x2
    4f38:	aa0003e1 	mov	x1, x0
    4f3c:	aa0403e2 	mov	x2, x4
    4f40:	52800120 	mov	w0, #0x9                   	// #9
    4f44:	d2800004 	mov	x4, #0x0                   	// #0
    4f48:	140000a6 	b	51e0 <syscall>
    4f4c:	d503201f 	nop

0000000000004f50 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    4f50:	93407c01 	sxtw	x1, w0
    4f54:	d2800004 	mov	x4, #0x0                   	// #0
    4f58:	d2800003 	mov	x3, #0x0                   	// #0
    4f5c:	d2800002 	mov	x2, #0x0                   	// #0
    4f60:	52800040 	mov	w0, #0x2                   	// #2
    4f64:	1400009f 	b	51e0 <syscall>
    4f68:	d503201f 	nop
    4f6c:	d503201f 	nop

0000000000004f70 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    4f70:	2a0003e1 	mov	w1, w0
    4f74:	d2800004 	mov	x4, #0x0                   	// #0
    4f78:	d2800003 	mov	x3, #0x0                   	// #0
    4f7c:	d2800002 	mov	x2, #0x0                   	// #0
    4f80:	52800060 	mov	w0, #0x3                   	// #3
    4f84:	14000097 	b	51e0 <syscall>
    4f88:	d503201f 	nop
    4f8c:	d503201f 	nop

0000000000004f90 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    4f90:	93407c01 	sxtw	x1, w0
    4f94:	d2800004 	mov	x4, #0x0                   	// #0
    4f98:	d2800003 	mov	x3, #0x0                   	// #0
    4f9c:	d2800002 	mov	x2, #0x0                   	// #0
    4fa0:	52800180 	mov	w0, #0xc                   	// #12
    4fa4:	1400008f 	b	51e0 <syscall>
    4fa8:	d503201f 	nop
    4fac:	d503201f 	nop

0000000000004fb0 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    4fb0:	aa0003e1 	mov	x1, x0
    4fb4:	d2800004 	mov	x4, #0x0                   	// #0
    4fb8:	d2800003 	mov	x3, #0x0                   	// #0
    4fbc:	d2800002 	mov	x2, #0x0                   	// #0
    4fc0:	528000a0 	mov	w0, #0x5                   	// #5
    4fc4:	14000087 	b	51e0 <syscall>
    4fc8:	d503201f 	nop
    4fcc:	d503201f 	nop

0000000000004fd0 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    4fd0:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    4fd4:	aa0203e3 	mov	x3, x2
    4fd8:	aa0003e1 	mov	x1, x0
    4fdc:	528000c0 	mov	w0, #0x6                   	// #6
    4fe0:	93407c82 	sxtw	x2, w4
    4fe4:	d2800004 	mov	x4, #0x0                   	// #0
    4fe8:	1400007e 	b	51e0 <syscall>
    4fec:	d503201f 	nop

0000000000004ff0 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    4ff0:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    4ff4:	d2800004 	mov	x4, #0x0                   	// #0
    4ff8:	aa0003e1 	mov	x1, x0
    4ffc:	d2800003 	mov	x3, #0x0                   	// #0
    5000:	528000e0 	mov	w0, #0x7                   	// #7
    5004:	14000077 	b	51e0 <syscall>
    5008:	d503201f 	nop
    500c:	d503201f 	nop

0000000000005010 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    5010:	aa0003e1 	mov	x1, x0
    5014:	d2800004 	mov	x4, #0x0                   	// #0
    5018:	d2800003 	mov	x3, #0x0                   	// #0
    501c:	d2800002 	mov	x2, #0x0                   	// #0
    5020:	52800100 	mov	w0, #0x8                   	// #8
    5024:	1400006f 	b	51e0 <syscall>
    5028:	d503201f 	nop
    502c:	d503201f 	nop

0000000000005030 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    5030:	aa0003e2 	mov	x2, x0
    5034:	d2800004 	mov	x4, #0x0                   	// #0
    5038:	d2800003 	mov	x3, #0x0                   	// #0
    503c:	d2800061 	mov	x1, #0x3                   	// #3
    5040:	52800140 	mov	w0, #0xa                   	// #10
    5044:	14000067 	b	51e0 <syscall>
    5048:	d503201f 	nop
    504c:	d503201f 	nop

0000000000005050 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    5050:	aa0003e2 	mov	x2, x0
    5054:	d2800004 	mov	x4, #0x0                   	// #0
    5058:	d2800003 	mov	x3, #0x0                   	// #0
    505c:	d2800021 	mov	x1, #0x1                   	// #1
    5060:	52800140 	mov	w0, #0xa                   	// #10
    5064:	1400005f 	b	51e0 <syscall>
    5068:	d503201f 	nop
    506c:	d503201f 	nop

0000000000005070 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    5070:	d2800004 	mov	x4, #0x0                   	// #0
    5074:	d2800003 	mov	x3, #0x0                   	// #0
    5078:	d2800002 	mov	x2, #0x0                   	// #0
    507c:	d2800041 	mov	x1, #0x2                   	// #2
    5080:	52800140 	mov	w0, #0xa                   	// #10
    5084:	14000057 	b	51e0 <syscall>
    5088:	d503201f 	nop
    508c:	d503201f 	nop

0000000000005090 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    5090:	d2800004 	mov	x4, #0x0                   	// #0
    5094:	d2800003 	mov	x3, #0x0                   	// #0
    5098:	d2800002 	mov	x2, #0x0                   	// #0
    509c:	d2800081 	mov	x1, #0x4                   	// #4
    50a0:	52800140 	mov	w0, #0xa                   	// #10
    50a4:	1400004f 	b	51e0 <syscall>
    50a8:	d503201f 	nop
    50ac:	d503201f 	nop

00000000000050b0 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    50b0:	d2800004 	mov	x4, #0x0                   	// #0
    50b4:	d2800003 	mov	x3, #0x0                   	// #0
    50b8:	d2800002 	mov	x2, #0x0                   	// #0
    50bc:	d28000a1 	mov	x1, #0x5                   	// #5
    50c0:	52800140 	mov	w0, #0xa                   	// #10
    50c4:	14000047 	b	51e0 <syscall>
    50c8:	d503201f 	nop
    50cc:	d503201f 	nop

00000000000050d0 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    50d0:	d2800004 	mov	x4, #0x0                   	// #0
    50d4:	d2800003 	mov	x3, #0x0                   	// #0
    50d8:	d2800002 	mov	x2, #0x0                   	// #0
    50dc:	d28000c1 	mov	x1, #0x6                   	// #6
    50e0:	52800140 	mov	w0, #0xa                   	// #10
    50e4:	1400003f 	b	51e0 <syscall>
    50e8:	d503201f 	nop
    50ec:	d503201f 	nop

00000000000050f0 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    50f0:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    50f4:	92401c64 	and	x4, x3, #0xff
    50f8:	aa0103e2 	mov	x2, x1
    50fc:	aa0003e1 	mov	x1, x0
    5100:	93407ca3 	sxtw	x3, w5
    5104:	52800080 	mov	w0, #0x4                   	// #4
    5108:	14000036 	b	51e0 <syscall>
    510c:	d503201f 	nop

0000000000005110 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    5110:	93407c22 	sxtw	x2, w1
    5114:	d2800004 	mov	x4, #0x0                   	// #0
    5118:	93407c01 	sxtw	x1, w0
    511c:	d2800003 	mov	x3, #0x0                   	// #0
    5120:	52800160 	mov	w0, #0xb                   	// #11
    5124:	1400002f 	b	51e0 <syscall>
    5128:	d503201f 	nop
    512c:	d503201f 	nop

0000000000005130 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    5130:	93407c02 	sxtw	x2, w0
    5134:	d2800004 	mov	x4, #0x0                   	// #0
    5138:	d2800003 	mov	x3, #0x0                   	// #0
    513c:	d2800001 	mov	x1, #0x0                   	// #0
    5140:	528001a0 	mov	w0, #0xd                   	// #13
    5144:	14000027 	b	51e0 <syscall>
    5148:	d503201f 	nop
    514c:	d503201f 	nop

0000000000005150 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    5150:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    5154:	93407c02 	sxtw	x2, w0
    5158:	d2800004 	mov	x4, #0x0                   	// #0
{
    515c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    5160:	d2800003 	mov	x3, #0x0                   	// #0
    5164:	d2800021 	mov	x1, #0x1                   	// #1
    5168:	528001a0 	mov	w0, #0xd                   	// #13
    516c:	9400001d 	bl	51e0 <syscall>
    5170:	7100001f 	cmp	w0, #0x0
}
    5174:	1a9f07e0 	cset	w0, ne  // ne = any
    5178:	a8c17bfd 	ldp	x29, x30, [sp], #16
    517c:	d65f03c0 	ret

0000000000005180 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    5180:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    5184:	93407c02 	sxtw	x2, w0
    5188:	d2800004 	mov	x4, #0x0                   	// #0
{
    518c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    5190:	d2800003 	mov	x3, #0x0                   	// #0
    5194:	d2800061 	mov	x1, #0x3                   	// #3
    5198:	528001a0 	mov	w0, #0xd                   	// #13
    519c:	94000011 	bl	51e0 <syscall>
    51a0:	7100001f 	cmp	w0, #0x0
}
    51a4:	1a9f07e0 	cset	w0, ne  // ne = any
    51a8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    51ac:	d65f03c0 	ret

00000000000051b0 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    51b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    51b4:	93407c02 	sxtw	x2, w0
    51b8:	d2800004 	mov	x4, #0x0                   	// #0
{
    51bc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    51c0:	d2800003 	mov	x3, #0x0                   	// #0
    51c4:	d2800041 	mov	x1, #0x2                   	// #2
    51c8:	528001a0 	mov	w0, #0xd                   	// #13
    51cc:	94000005 	bl	51e0 <syscall>
    51d0:	7100001f 	cmp	w0, #0x0
    51d4:	1a9f07e0 	cset	w0, ne  // ne = any
    51d8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    51dc:	d65f03c0 	ret

00000000000051e0 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    51e0:	2a0003e5 	mov	w5, w0
    51e4:	aa0103e6 	mov	x6, x1
    51e8:	aa0203e7 	mov	x7, x2
    51ec:	aa0303e8 	mov	x8, x3
    51f0:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    51f4:	aa0503e0 	mov	x0, x5
    51f8:	aa0603e1 	mov	x1, x6
    51fc:	aa0703e2 	mov	x2, x7
    5200:	aa0803e3 	mov	x3, x8
    5204:	aa0903e4 	mov	x4, x9
    5208:	d4000001 	svc	#0x0
    520c:	d5033b9f 	dsb	ish
    5210:	d5033fdf 	isb
    5214:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    5218:	2a0503e0 	mov	w0, w5
    521c:	d65f03c0 	ret

0000000000005220 <insert_node>:
    int list = 0;
    void* search_ptr = ptr;
    void* insert_ptr = NULL;

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    5220:	f100043f 	cmp	x1, #0x1
    int list = 0;
    5224:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    5228:	540000e9 	b.ls	5244 <insert_node+0x24>  // b.plast
    522c:	d503201f 	nop
        size >>= 1;
        list++;
    5230:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    5234:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    5238:	7100485f 	cmp	w2, #0x12
    523c:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    5240:	54ffff88 	b.hi	5230 <insert_node+0x10>  // b.pmore
    }

    // Keep size ascending order and search
    search_ptr = segregated_free_lists[list];
    5244:	93407c44 	sxtw	x4, w2
    5248:	f0000506 	adrp	x6, a8000 <_stack+0x28000>
    524c:	911760c6 	add	x6, x6, #0x5d8
    void* insert_ptr = NULL;
    5250:	d2800005 	mov	x5, #0x0                   	// #0
    search_ptr = segregated_free_lists[list];
    5254:	f86478c2 	ldr	x2, [x6, x4, lsl #3]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    5258:	b50000c2 	cbnz	x2, 5270 <insert_node+0x50>
    525c:	14000018 	b	52bc <insert_node+0x9c>
        insert_ptr = search_ptr;
        search_ptr = PRED(search_ptr);
    5260:	f9400043 	ldr	x3, [x2]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    5264:	aa0203e5 	mov	x5, x2
    5268:	b4000223 	cbz	x3, 52ac <insert_node+0x8c>
    526c:	aa0303e2 	mov	x2, x3
    5270:	b85fc043 	ldur	w3, [x2, #-4]
    5274:	927d7063 	and	x3, x3, #0xfffffff8
    5278:	eb01007f 	cmp	x3, x1
    527c:	54ffff23 	b.cc	5260 <insert_node+0x40>  // b.lo, b.ul, b.last
    }

    // Set predecessor and successor
    if (search_ptr != NULL) {
        if (insert_ptr != NULL) {
    5280:	b40000c5 	cbz	x5, 5298 <insert_node+0x78>
            SET_PTR(PRED_PTR(ptr), search_ptr);
    5284:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    5288:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    528c:	f8004005 	stur	x5, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    5290:	f90000a0 	str	x0, [x5]
            segregated_free_lists[list] = ptr;
        }
    }

    return;
}
    5294:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), search_ptr);
    5298:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    529c:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), NULL);
    52a0:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    52a4:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    52a8:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    52ac:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    52b0:	f8004002 	stur	x2, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    52b4:	f9000040 	str	x0, [x2]
}
    52b8:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    52bc:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), NULL);
    52c0:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    52c4:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    52c8:	d65f03c0 	ret
    52cc:	d503201f 	nop

00000000000052d0 <delete_node>:

static void delete_node(void* ptr)
{
    int list = 0;
    size_t size = GET_SIZE(HDRP(ptr));
    52d0:	b85fc001 	ldur	w1, [x0, #-4]
    52d4:	121d7022 	and	w2, w1, #0xfffffff8
    52d8:	927d7021 	and	x1, x1, #0xfffffff8

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    52dc:	7100045f 	cmp	w2, #0x1
    int list = 0;
    52e0:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    52e4:	540000c9 	b.ls	52fc <delete_node+0x2c>  // b.plast
        size >>= 1;
        list++;
    52e8:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    52ec:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    52f0:	7100485f 	cmp	w2, #0x12
    52f4:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    52f8:	54ffff88 	b.hi	52e8 <delete_node+0x18>  // b.pmore
    }

    if (PRED(ptr) != NULL) {
    52fc:	f9400003 	ldr	x3, [x0]
        if (SUCC(ptr) != NULL) {
    5300:	f8404001 	ldur	x1, [x0, #4]
    if (PRED(ptr) != NULL) {
    5304:	b40001a3 	cbz	x3, 5338 <delete_node+0x68>
        if (SUCC(ptr) != NULL) {
    5308:	b40000c1 	cbz	x1, 5320 <delete_node+0x50>
            SET_PTR(SUCC_PTR(PRED(ptr)), SUCC(ptr));
    530c:	f8004061 	stur	x1, [x3, #4]
            SET_PTR(PRED_PTR(SUCC(ptr)), PRED(ptr));
    5310:	f8404001 	ldur	x1, [x0, #4]
    5314:	f9400000 	ldr	x0, [x0]
    5318:	f9000020 	str	x0, [x1]
            segregated_free_lists[list] = NULL;
        }
    }

    return;
}
    531c:	d65f03c0 	ret
            segregated_free_lists[list] = PRED(ptr);
    5320:	f0000501 	adrp	x1, a8000 <_stack+0x28000>
    5324:	91176021 	add	x1, x1, #0x5d8
            SET_PTR(SUCC_PTR(PRED(ptr)), NULL);
    5328:	f800407f 	stur	xzr, [x3, #4]
            segregated_free_lists[list] = PRED(ptr);
    532c:	f9400000 	ldr	x0, [x0]
    5330:	f822d820 	str	x0, [x1, w2, sxtw #3]
}
    5334:	d65f03c0 	ret
        if (SUCC(ptr) != NULL) {
    5338:	b4000061 	cbz	x1, 5344 <delete_node+0x74>
            SET_PTR(PRED_PTR(SUCC(ptr)), NULL);
    533c:	f900003f 	str	xzr, [x1]
}
    5340:	d65f03c0 	ret
            segregated_free_lists[list] = NULL;
    5344:	f0000500 	adrp	x0, a8000 <_stack+0x28000>
    5348:	91176000 	add	x0, x0, #0x5d8
    534c:	f822d81f 	str	xzr, [x0, w2, sxtw #3]
}
    5350:	d65f03c0 	ret
    5354:	d503201f 	nop
    5358:	d503201f 	nop
    535c:	d503201f 	nop

0000000000005360 <coalesce>:

static void* coalesce(void* ptr)
{
    5360:	aa0003e7 	mov	x7, x0
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    5364:	b85f8000 	ldur	w0, [x0, #-8]
    5368:	927d7000 	and	x0, x0, #0xfffffff8
    536c:	cb0000e0 	sub	x0, x7, x0
    5370:	b85fc0e2 	ldur	w2, [x7, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    5374:	927d7045 	and	x5, x2, #0xfffffff8
    5378:	121d7044 	and	w4, w2, #0xfffffff8
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    537c:	b85fc000 	ldur	w0, [x0, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    5380:	8b0500e3 	add	x3, x7, x5
    5384:	b85fc062 	ldur	w2, [x3, #-4]
    size_t size = GET_SIZE(HDRP(ptr));

    // Do not coalesce with previous block if the previous block is tagged with Reallocation tag
    if (GET_TAG(HDRP(PREV_BLKP(ptr))))
    5388:	37080600 	tbnz	w0, #1, 5448 <coalesce+0xe8>
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    538c:	92400003 	and	x3, x0, #0x1
        prev_alloc = 1;

    if (prev_alloc && next_alloc) { // Case 1
    5390:	72000041 	ands	w1, w2, #0x1
    5394:	12000000 	and	w0, w0, #0x1
    5398:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    539c:	54000601 	b.ne	545c <coalesce+0xfc>  // b.any
{
    53a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        return ptr;
    } else if (prev_alloc && !next_alloc) { // Case 2
    53a4:	6a22001f 	bics	wzr, w0, w2
{
    53a8:	910003fd 	mov	x29, sp
    } else if (prev_alloc && !next_alloc) { // Case 2
    53ac:	540005c1 	b.ne	5464 <coalesce+0x104>  // b.any
        delete_node(ptr);
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(ptr), PACK(size, 0));
        PUT(FTRP(ptr), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) { // Case 3
    53b0:	52000063 	eor	w3, w3, #0x1
        delete_node(ptr);
    53b4:	aa0703e0 	mov	x0, x7
    } else if (!prev_alloc && next_alloc) { // Case 3
    53b8:	6a03003f 	tst	w1, w3
    53bc:	540008a0 	b.eq	54d0 <coalesce+0x170>  // b.none
        delete_node(ptr);
    53c0:	97ffffc4 	bl	52d0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    53c4:	b85f80e0 	ldur	w0, [x7, #-8]
    53c8:	927d7000 	and	x0, x0, #0xfffffff8
    53cc:	cb0000e0 	sub	x0, x7, x0
    53d0:	97ffffc0 	bl	52d0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
        PUT(FTRP(ptr), PACK(size, 0));
    53d4:	297f00e1 	ldp	w1, w0, [x7, #-8]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    53d8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    53dc:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    53e0:	927d7000 	and	x0, x0, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    53e4:	cb010061 	sub	x1, x3, x1
        PUT(FTRP(ptr), PACK(size, 0));
    53e8:	d1002000 	sub	x0, x0, #0x8
    53ec:	b86168e1 	ldr	w1, [x7, x1]
    53f0:	b86068e6 	ldr	w6, [x7, x0]
    53f4:	121d7022 	and	w2, w1, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    53f8:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    53fc:	0b020084 	add	w4, w4, w2
    5400:	121f00c6 	and	w6, w6, #0x2
    5404:	2a0400c6 	orr	w6, w6, w4
    5408:	b82068e6 	str	w6, [x7, x0]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    540c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    5410:	b85f80e0 	ldur	w0, [x7, #-8]
    5414:	927d7000 	and	x0, x0, #0xfffffff8
    5418:	cb000060 	sub	x0, x3, x0
    541c:	b86068e2 	ldr	w2, [x7, x0]
    5420:	121f0042 	and	w2, w2, #0x2
        delete_node(ptr);
        delete_node(PREV_BLKP(ptr));
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    5424:	2a020082 	orr	w2, w4, w2
    5428:	b82068e2 	str	w2, [x7, x0]
        ptr = PREV_BLKP(ptr);
    542c:	b85f80e0 	ldur	w0, [x7, #-8]
    5430:	927d7000 	and	x0, x0, #0xfffffff8
    5434:	cb0000e7 	sub	x7, x7, x0
    }

    insert_node(ptr, size);
    5438:	aa0703e0 	mov	x0, x7
    543c:	97ffff79 	bl	5220 <insert_node>

    return ptr;
}
    5440:	a8c17bfd 	ldp	x29, x30, [sp], #16
    5444:	d65f03c0 	ret
    if (prev_alloc && next_alloc) { // Case 1
    5448:	72000041 	ands	w1, w2, #0x1
    544c:	52800020 	mov	w0, #0x1                   	// #1
        prev_alloc = 1;
    5450:	d2800023 	mov	x3, #0x1                   	// #1
    if (prev_alloc && next_alloc) { // Case 1
    5454:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    5458:	54fffa40 	b.eq	53a0 <coalesce+0x40>  // b.none
}
    545c:	aa0703e0 	mov	x0, x7
    5460:	d65f03c0 	ret
        delete_node(ptr);
    5464:	aa0703e0 	mov	x0, x7
    5468:	97ffff9a 	bl	52d0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    546c:	b85fc0e0 	ldur	w0, [x7, #-4]
    5470:	927d7000 	and	x0, x0, #0xfffffff8
    5474:	8b0000e0 	add	x0, x7, x0
    5478:	97ffff96 	bl	52d0 <delete_node>
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    547c:	b85fc0e0 	ldur	w0, [x7, #-4]
    5480:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    5484:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    5488:	8b0100e1 	add	x1, x7, x1
    548c:	b85fc021 	ldur	w1, [x1, #-4]
    5490:	121d7022 	and	w2, w1, #0xfffffff8
    5494:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    5498:	0b020084 	add	w4, w4, w2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    549c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(ptr), PACK(size, 0));
    54a0:	2a040000 	orr	w0, w0, w4
    54a4:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(size, 0));
    54a8:	927d7000 	and	x0, x0, #0xfffffff8
    54ac:	d1002000 	sub	x0, x0, #0x8
    54b0:	b86068e2 	ldr	w2, [x7, x0]
    54b4:	121f0042 	and	w2, w2, #0x2
    54b8:	2a040042 	orr	w2, w2, w4
    54bc:	b82068e2 	str	w2, [x7, x0]
    insert_node(ptr, size);
    54c0:	aa0703e0 	mov	x0, x7
    54c4:	97ffff57 	bl	5220 <insert_node>
}
    54c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    54cc:	d65f03c0 	ret
        delete_node(ptr);
    54d0:	97ffff80 	bl	52d0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    54d4:	b85f80e0 	ldur	w0, [x7, #-8]
    54d8:	927d7000 	and	x0, x0, #0xfffffff8
    54dc:	cb0000e0 	sub	x0, x7, x0
    54e0:	97ffff7c 	bl	52d0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    54e4:	b85fc0e0 	ldur	w0, [x7, #-4]
    54e8:	927d7000 	and	x0, x0, #0xfffffff8
    54ec:	8b0000e0 	add	x0, x7, x0
    54f0:	97ffff78 	bl	52d0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    54f4:	297f04e0 	ldp	w0, w1, [x7, #-8]
    54f8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    54fc:	927d7000 	and	x0, x0, #0xfffffff8
    5500:	927d7021 	and	x1, x1, #0xfffffff8
    5504:	cb000063 	sub	x3, x3, x0
    5508:	8b0100e1 	add	x1, x7, x1
    550c:	b86368e0 	ldr	w0, [x7, x3]
    5510:	b85fc021 	ldur	w1, [x1, #-4]
    5514:	121d7002 	and	w2, w0, #0xfffffff8
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    5518:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    551c:	121d7021 	and	w1, w1, #0xfffffff8
    5520:	0b020021 	add	w1, w1, w2
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    5524:	0b040022 	add	w2, w1, w4
    5528:	2a020000 	orr	w0, w0, w2
    552c:	b82368e0 	str	w0, [x7, x3]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    5530:	8b2140a1 	add	x1, x5, w1, uxtw
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    5534:	b85fc0e0 	ldur	w0, [x7, #-4]
    5538:	927d7000 	and	x0, x0, #0xfffffff8
    553c:	8b0000e4 	add	x4, x7, x0
    5540:	d1002003 	sub	x3, x0, #0x8
    5544:	b85fc080 	ldur	w0, [x4, #-4]
    5548:	927d7000 	and	x0, x0, #0xfffffff8
    554c:	8b030000 	add	x0, x0, x3
    5550:	b86068e4 	ldr	w4, [x7, x0]
    5554:	121f0084 	and	w4, w4, #0x2
    5558:	17ffffb3 	b	5424 <coalesce+0xc4>
    555c:	d503201f 	nop

0000000000005560 <mem_sbrk>:
{
    5560:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    5564:	910003fd 	mov	x29, sp
    5568:	a90153f3 	stp	x19, x20, [sp, #16]
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    556c:	f0000513 	adrp	x19, a8000 <_stack+0x28000>
    5570:	91176273 	add	x19, x19, #0x5d8
{
    5574:	aa0003f4 	mov	x20, x0
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    5578:	a94a0660 	ldp	x0, x1, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    557c:	f9405a62 	ldr	x2, [x19, #176]
    5580:	8b020021 	add	x1, x1, x2
    5584:	cb010003 	sub	x3, x0, x1
    5588:	eb03029f 	cmp	x20, x3
    558c:	540001a9 	b.ls	55c0 <mem_sbrk+0x60>  // b.plast
    uintptr_t size_needed = size - (userland_heap_size - requested_heap_size);
    5590:	cb000282 	sub	x2, x20, x0
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    5594:	52800003 	mov	w3, #0x0                   	// #0
    5598:	0b020022 	add	w2, w1, w2
    559c:	d2800001 	mov	x1, #0x0                   	// #0
    55a0:	97fffed4 	bl	50f0 <mmap>
    55a4:	93407c00 	sxtw	x0, w0
    if (userland_heap_size - requested_heap_size >= size) {
    55a8:	a94a8a61 	ldp	x1, x2, [x19, #168]
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    55ac:	f9005260 	str	x0, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    55b0:	8b020021 	add	x1, x1, x2
    55b4:	cb010003 	sub	x3, x0, x1
    55b8:	eb14007f 	cmp	x3, x20
    55bc:	54fffea3 	b.cc	5590 <mem_sbrk+0x30>  // b.lo, b.ul, b.last
        requested_heap_size += size;
    55c0:	8b020294 	add	x20, x20, x2
}
    55c4:	aa0103e0 	mov	x0, x1
        requested_heap_size += size;
    55c8:	f9005a74 	str	x20, [x19, #176]
}
    55cc:	a94153f3 	ldp	x19, x20, [sp, #16]
    55d0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    55d4:	d65f03c0 	ret
    55d8:	d503201f 	nop
    55dc:	d503201f 	nop

00000000000055e0 <mm_init>:
    return ptr;
}

static bool malloc_inited = false;
int mm_init(void)
{
    55e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    55e4:	910003fd 	mov	x29, sp
    55e8:	f9000bf3 	str	x19, [sp, #16]
    // init heap
    userland_heap_base = task_heap_base();
    55ec:	f0000513 	adrp	x19, a8000 <_stack+0x28000>
    55f0:	91176273 	add	x19, x19, #0x5d8
    55f4:	97fffe9f 	bl	5070 <task_heap_base>
    55f8:	aa1303e1 	mov	x1, x19
    55fc:	91028262 	add	x2, x19, #0xa0
    5600:	93407c00 	sxtw	x0, w0
    5604:	a90a0260 	stp	x0, x0, [x19, #160]
    userland_heap_top = userland_heap_base;
    requested_heap_size = 0;
    5608:	f9005a7f 	str	xzr, [x19, #176]

    int list;
    char* heap_start; // Pointer to beginning of heap

    // Initialize segregated free lists
    for (list = 0; list < LISTLIMIT; list++) {
    560c:	d503201f 	nop
        segregated_free_lists[list] = NULL;
    5610:	f800843f 	str	xzr, [x1], #8
    for (list = 0; list < LISTLIMIT; list++) {
    5614:	eb02003f 	cmp	x1, x2
    5618:	54ffffc1 	b.ne	5610 <mm_init+0x30>  // b.any
    }

    // Allocate memory for the initial empty heap
    if ((long)(heap_start = mem_sbrk(4 * WSIZE)) == -1)
    561c:	d2800200 	mov	x0, #0x10                  	// #16
    5620:	97ffffd0 	bl	5560 <mem_sbrk>
    5624:	aa0003e1 	mov	x1, x0
    5628:	b100041f 	cmn	x0, #0x1
    562c:	54000300 	b.eq	568c <mm_init+0xac>  // b.none
        return -1;

    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    PUT_NOTAG(heap_start + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    5630:	d2800122 	mov	x2, #0x9                   	// #9
    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    5634:	d2c00120 	mov	x0, #0x900000000           	// #38654705664
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    5638:	f2c00022 	movk	x2, #0x1, lsl #32
    563c:	a9000820 	stp	x0, x2, [x1]
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    5640:	d2800800 	mov	x0, #0x40                  	// #64
    5644:	97ffffc7 	bl	5560 <mem_sbrk>
    5648:	b100041f 	cmn	x0, #0x1
    564c:	54000200 	b.eq	568c <mm_init+0xac>  // b.none
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    5650:	d2800803 	mov	x3, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    5654:	52800804 	mov	w4, #0x40                  	// #64
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    5658:	f2c00023 	movk	x3, #0x1, lsl #32
    insert_node(ptr, asize);
    565c:	d2800801 	mov	x1, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    5660:	b81fc004 	stur	w4, [x0, #-4]
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    5664:	f9001c03 	str	x3, [x0, #56]
    insert_node(ptr, asize);
    5668:	97fffeee 	bl	5220 <insert_node>
    return coalesce(ptr);
    566c:	97ffff3d 	bl	5360 <coalesce>
    PUT_NOTAG(heap_start + (3 * WSIZE), PACK(0, 1)); /* Epilogue header */

    if (extend_heap(INITCHUNKSIZE) == NULL)
    5670:	b40000e0 	cbz	x0, 568c <mm_init+0xac>
        return -1;

    malloc_inited = true;
    5674:	52800021 	mov	w1, #0x1                   	// #1
    return 0;
    5678:	52800000 	mov	w0, #0x0                   	// #0
    malloc_inited = true;
    567c:	3902e261 	strb	w1, [x19, #184]
}
    5680:	f9400bf3 	ldr	x19, [sp, #16]
    5684:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5688:	d65f03c0 	ret
        return -1;
    568c:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    5690:	f9400bf3 	ldr	x19, [sp, #16]
    5694:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5698:	d65f03c0 	ret
    569c:	d503201f 	nop

00000000000056a0 <malloc>:

void* malloc(size_t size)
{
    56a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    56a4:	910003fd 	mov	x29, sp
    56a8:	a90153f3 	stp	x19, x20, [sp, #16]
    while (!malloc_inited) {
    56ac:	f0000514 	adrp	x20, a8000 <_stack+0x28000>
    56b0:	91176294 	add	x20, x20, #0x5d8
{
    56b4:	aa0003f3 	mov	x19, x0
    while (!malloc_inited) {
    56b8:	3942e280 	ldrb	w0, [x20, #184]
    56bc:	35000080 	cbnz	w0, 56cc <malloc+0x2c>
        mm_init();
    56c0:	97ffffc8 	bl	55e0 <mm_init>
    while (!malloc_inited) {
    56c4:	3942e281 	ldrb	w1, [x20, #184]
    56c8:	34ffffc1 	cbz	w1, 56c0 <malloc+0x20>
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    void* ptr = NULL; /* Pointer */

    // Ignore size 0 cases
    if (size == 0)
    56cc:	b4000e73 	cbz	x19, 5898 <malloc+0x1f8>

    // Align block size
    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size + DSIZE);
    56d0:	91003e60 	add	x0, x19, #0xf
    56d4:	f100227f 	cmp	x19, #0x8
    56d8:	927df013 	and	x19, x0, #0xfffffffffffffff8
    56dc:	d2800200 	mov	x0, #0x10                  	// #16
    56e0:	9a808273 	csel	x19, x19, x0, hi  // hi = pmore
        asize = 2 * DSIZE;
    56e4:	d2800002 	mov	x2, #0x0                   	// #0
    56e8:	aa1303e3 	mov	x3, x19
    56ec:	14000005 	b	5700 <malloc+0x60>
    }

    int list = 0;
    size_t searchsize = asize;
    // Search for free block in segregated list
    while (list < LISTLIMIT) {
    56f0:	91000442 	add	x2, x2, #0x1
            }
            if (ptr != NULL)
                break;
        }

        searchsize >>= 1;
    56f4:	d341fc63 	lsr	x3, x3, #1
    while (list < LISTLIMIT) {
    56f8:	f100505f 	cmp	x2, #0x14
    56fc:	54000720 	b.eq	57e0 <malloc+0x140>  // b.none
        if ((list == LISTLIMIT - 1) || ((searchsize <= 1) && (segregated_free_lists[list] != NULL))) {
    5700:	f1004c5f 	cmp	x2, #0x13
    5704:	540006a0 	b.eq	57d8 <malloc+0x138>  // b.none
    5708:	f100047f 	cmp	x3, #0x1
    570c:	54ffff28 	b.hi	56f0 <malloc+0x50>  // b.pmore
    5710:	f8627a87 	ldr	x7, [x20, x2, lsl #3]
    5714:	b4fffee7 	cbz	x7, 56f0 <malloc+0x50>
    5718:	14000003 	b	5724 <malloc+0x84>
                ptr = PRED(ptr);
    571c:	f94000e7 	ldr	x7, [x7]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    5720:	b4fffe87 	cbz	x7, 56f0 <malloc+0x50>
    5724:	b85fc0e0 	ldur	w0, [x7, #-4]
    5728:	927d7001 	and	x1, x0, #0xfffffff8
    572c:	121d7005 	and	w5, w0, #0xfffffff8
    5730:	eb13003f 	cmp	x1, x19
    5734:	54ffff43 	b.cc	571c <malloc+0x7c>  // b.lo, b.ul, b.last
    5738:	370fff20 	tbnz	w0, #1, 571c <malloc+0x7c>
    size_t remainder = ptr_size - asize;
    573c:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    5740:	aa0703e0 	mov	x0, x7
    5744:	97fffee3 	bl	52d0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    5748:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    574c:	f100409f 	cmp	x4, #0x10
    5750:	54000849 	b.ls	5858 <malloc+0x1b8>  // b.plast
    else if (asize >= 100) {
    5754:	f1018e7f 	cmp	x19, #0x63
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    5758:	121f0000 	and	w0, w0, #0x2
    else if (asize >= 100) {
    575c:	54000a88 	b.hi	58ac <malloc+0x20c>  // b.pmore
        PUT(HDRP(ptr), PACK(asize, 1));
    5760:	2a130000 	orr	w0, w0, w19
        insert_node(NEXT_BLKP(ptr), remainder);
    5764:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(asize, 1));
    5768:	927d7002 	and	x2, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(asize, 1));
    576c:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(asize, 1));
    5770:	d1002042 	sub	x2, x2, #0x8
        PUT(HDRP(ptr), PACK(asize, 1));
    5774:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(asize, 1));
    5778:	b86268e0 	ldr	w0, [x7, x2]
    577c:	121f0000 	and	w0, w0, #0x2
    5780:	2a130000 	orr	w0, w0, w19
    5784:	32000000 	orr	w0, w0, #0x1
    5788:	b82268e0 	str	w0, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    578c:	b85fc0e0 	ldur	w0, [x7, #-4]
    5790:	927d7000 	and	x0, x0, #0xfffffff8
    5794:	8b0000e0 	add	x0, x7, x0
    5798:	b81fc004 	stur	w4, [x0, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    579c:	b85fc0e0 	ldur	w0, [x7, #-4]
    57a0:	927d7000 	and	x0, x0, #0xfffffff8
    57a4:	8b0000e0 	add	x0, x7, x0
    57a8:	b85fc002 	ldur	w2, [x0, #-4]
    57ac:	927d7042 	and	x2, x2, #0xfffffff8
    57b0:	8b020000 	add	x0, x0, x2
    57b4:	b81f8004 	stur	w4, [x0, #-8]
        insert_node(NEXT_BLKP(ptr), remainder);
    57b8:	b85fc0e0 	ldur	w0, [x7, #-4]
    57bc:	927d7000 	and	x0, x0, #0xfffffff8
    57c0:	8b0000e0 	add	x0, x7, x0
    57c4:	97fffe97 	bl	5220 <insert_node>
    // Place and divide block
    ptr = place(ptr, asize);

    // Return pointer to newly allocated block
    return ptr;
}
    57c8:	aa0703e0 	mov	x0, x7
    57cc:	a94153f3 	ldp	x19, x20, [sp, #16]
    57d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    57d4:	d65f03c0 	ret
            ptr = segregated_free_lists[list];
    57d8:	f9404e87 	ldr	x7, [x20, #152]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    57dc:	b5fffa47 	cbnz	x7, 5724 <malloc+0x84>
        extendsize = MAX(asize, CHUNKSIZE);
    57e0:	f140067f 	cmp	x19, #0x1, lsl #12
    57e4:	d2820000 	mov	x0, #0x1000                	// #4096
    57e8:	9a802260 	csel	x0, x19, x0, cs  // cs = hs, nlast
    57ec:	f90013f5 	str	x21, [sp, #32]
    asize = ALIGN(size);
    57f0:	91001c14 	add	x20, x0, #0x7
    57f4:	aa0003f5 	mov	x21, x0
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    57f8:	97ffff5a 	bl	5560 <mem_sbrk>
    57fc:	aa0003e3 	mov	x3, x0
    5800:	b100041f 	cmn	x0, #0x1
    5804:	54000480 	b.eq	5894 <malloc+0x1f4>  // b.none
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    5808:	927d7282 	and	x2, x20, #0xfffffff8
    insert_node(ptr, asize);
    580c:	aa1503e1 	mov	x1, x21
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    5810:	8b020062 	add	x2, x3, x2
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    5814:	b81fc075 	stur	w21, [x3, #-4]
    PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));
    5818:	52800023 	mov	w3, #0x1                   	// #1
    581c:	293f0c55 	stp	w21, w3, [x2, #-8]
    insert_node(ptr, asize);
    5820:	97fffe80 	bl	5220 <insert_node>
    return coalesce(ptr);
    5824:	97fffecf 	bl	5360 <coalesce>
    5828:	aa0003e7 	mov	x7, x0
        if ((ptr = extend_heap(extendsize)) == NULL)
    582c:	b4000340 	cbz	x0, 5894 <malloc+0x1f4>
    5830:	b85fc001 	ldur	w1, [x0, #-4]
    delete_node(ptr);
    5834:	aa0703e0 	mov	x0, x7
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    5838:	f94013f5 	ldr	x21, [sp, #32]
    size_t remainder = ptr_size - asize;
    583c:	121d7025 	and	w5, w1, #0xfffffff8
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    5840:	927d7021 	and	x1, x1, #0xfffffff8
    size_t remainder = ptr_size - asize;
    5844:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    5848:	97fffea2 	bl	52d0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    584c:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    5850:	f100409f 	cmp	x4, #0x10
    5854:	54fff808 	b.hi	5754 <malloc+0xb4>  // b.pmore
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    5858:	121f0000 	and	w0, w0, #0x2
    585c:	2a050000 	orr	w0, w0, w5
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    5860:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    5864:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    5868:	d1002021 	sub	x1, x1, #0x8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    586c:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    5870:	b86168e0 	ldr	w0, [x7, x1]
    5874:	121f0000 	and	w0, w0, #0x2
    5878:	2a050000 	orr	w0, w0, w5
    587c:	32000000 	orr	w0, w0, #0x1
    5880:	b82168e0 	str	w0, [x7, x1]
}
    5884:	aa0703e0 	mov	x0, x7
    5888:	a94153f3 	ldp	x19, x20, [sp, #16]
    588c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5890:	d65f03c0 	ret
    5894:	f94013f5 	ldr	x21, [sp, #32]
        return NULL;
    5898:	d2800007 	mov	x7, #0x0                   	// #0
}
    589c:	aa0703e0 	mov	x0, x7
    58a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    58a4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    58a8:	d65f03c0 	ret
        PUT(HDRP(ptr), PACK(remainder, 0));
    58ac:	2a040000 	orr	w0, w0, w4
    58b0:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(remainder, 0));
    58b4:	927d7000 	and	x0, x0, #0xfffffff8
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    58b8:	32000273 	orr	w19, w19, #0x1
        PUT(FTRP(ptr), PACK(remainder, 0));
    58bc:	d1002002 	sub	x2, x0, #0x8
        insert_node(ptr, remainder);
    58c0:	aa0703e0 	mov	x0, x7
    58c4:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(remainder, 0));
    58c8:	b86268e3 	ldr	w3, [x7, x2]
    58cc:	121f0063 	and	w3, w3, #0x2
    58d0:	2a040063 	orr	w3, w3, w4
    58d4:	b82268e3 	str	w3, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    58d8:	b85fc0e2 	ldur	w2, [x7, #-4]
    58dc:	927d7042 	and	x2, x2, #0xfffffff8
    58e0:	8b0200e2 	add	x2, x7, x2
    58e4:	b81fc053 	stur	w19, [x2, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    58e8:	b85fc0e2 	ldur	w2, [x7, #-4]
    58ec:	927d7042 	and	x2, x2, #0xfffffff8
    58f0:	8b0200e2 	add	x2, x7, x2
    58f4:	b85fc043 	ldur	w3, [x2, #-4]
    58f8:	927d7063 	and	x3, x3, #0xfffffff8
    58fc:	8b030042 	add	x2, x2, x3
    5900:	b81f8053 	stur	w19, [x2, #-8]
        insert_node(ptr, remainder);
    5904:	97fffe47 	bl	5220 <insert_node>
        return NEXT_BLKP(ptr);
    5908:	b85fc0e0 	ldur	w0, [x7, #-4]
}
    590c:	a94153f3 	ldp	x19, x20, [sp, #16]
        return NEXT_BLKP(ptr);
    5910:	927d7000 	and	x0, x0, #0xfffffff8
    5914:	8b0000e7 	add	x7, x7, x0
}
    5918:	aa0703e0 	mov	x0, x7
    591c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5920:	d65f03c0 	ret
    5924:	d503201f 	nop
    5928:	d503201f 	nop
    592c:	d503201f 	nop

0000000000005930 <free>:

void free(void* ptr)
{
    5930:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5934:	910003fd 	mov	x29, sp
    5938:	b85fc004 	ldur	w4, [x0, #-4]
    size_t size = GET_SIZE(HDRP(ptr));
    593c:	927d7081 	and	x1, x4, #0xfffffff8

    REMOVE_RATAG(HDRP(NEXT_BLKP(ptr)));
    5940:	121d7085 	and	w5, w4, #0xfffffff8
    5944:	d1001024 	sub	x4, x1, #0x4
    5948:	b8646802 	ldr	w2, [x0, x4]
    594c:	121e7842 	and	w2, w2, #0xfffffffd
    5950:	b8246802 	str	w2, [x0, x4]
    PUT(HDRP(ptr), PACK(size, 0));
    5954:	b85fc002 	ldur	w2, [x0, #-4]
    5958:	121f0042 	and	w2, w2, #0x2
    595c:	2a050042 	orr	w2, w2, w5
    5960:	b81fc002 	stur	w2, [x0, #-4]
    PUT(FTRP(ptr), PACK(size, 0));
    5964:	927d7042 	and	x2, x2, #0xfffffff8
    5968:	d1002042 	sub	x2, x2, #0x8
    596c:	b8626804 	ldr	w4, [x0, x2]
    5970:	121f0084 	and	w4, w4, #0x2
    5974:	2a050084 	orr	w4, w4, w5
    5978:	b8226804 	str	w4, [x0, x2]

    insert_node(ptr, size);
    597c:	97fffe29 	bl	5220 <insert_node>
    coalesce(ptr);

    return;
}
    5980:	a8c17bfd 	ldp	x29, x30, [sp], #16
    coalesce(ptr);
    5984:	17fffe77 	b	5360 <coalesce>
    5988:	d503201f 	nop
    598c:	d503201f 	nop

0000000000005990 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    5990:	14000000 	b	5990 <_exit>
    5994:	d503201f 	nop
    5998:	d503201f 	nop
    599c:	d503201f 	nop

00000000000059a0 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    59a0:	f0000503 	adrp	x3, a8000 <_stack+0x28000>
    59a4:	f9434c61 	ldr	x1, [x3, #1688]
    59a8:	f0000502 	adrp	x2, a8000 <_stack+0x28000>
    59ac:	91268042 	add	x2, x2, #0x9a0
    59b0:	f100003f 	cmp	x1, #0x0
    59b4:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    59b8:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    59bc:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    59c0:	f9034c62 	str	x2, [x3, #1688]
}
    59c4:	d65f03c0 	ret
    59c8:	d503201f 	nop
    59cc:	d503201f 	nop

00000000000059d0 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    59d0:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    59d4:	d65f03c0 	ret
    59d8:	d503201f 	nop
    59dc:	d503201f 	nop

00000000000059e0 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    59e0:	12800000 	mov	w0, #0xffffffff            	// #-1
    59e4:	d65f03c0 	ret
    59e8:	d503201f 	nop
    59ec:	d503201f 	nop

00000000000059f0 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    59f0:	52800000 	mov	w0, #0x0                   	// #0
    59f4:	d65f03c0 	ret
    59f8:	d503201f 	nop
    59fc:	d503201f 	nop

0000000000005a00 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    5a00:	52800020 	mov	w0, #0x1                   	// #1
    5a04:	d65f03c0 	ret
    5a08:	d503201f 	nop
    5a0c:	d503201f 	nop

0000000000005a10 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    5a10:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    5a14:	d65f03c0 	ret
    5a18:	d503201f 	nop
    5a1c:	d503201f 	nop

0000000000005a20 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    5a20:	d2800000 	mov	x0, #0x0                   	// #0
    5a24:	d65f03c0 	ret
    5a28:	d503201f 	nop
    5a2c:	d503201f 	nop

0000000000005a30 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    5a30:	12800000 	mov	w0, #0xffffffff            	// #-1
    5a34:	d65f03c0 	ret
    5a38:	d503201f 	nop
    5a3c:	d503201f 	nop

0000000000005a40 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    5a40:	52800020 	mov	w0, #0x1                   	// #1
    5a44:	d65f03c0 	ret
    5a48:	d503201f 	nop
    5a4c:	d503201f 	nop

0000000000005a50 <__assert_func>:
    5a50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5a54:	d0000044 	adrp	x4, f000 <IpcFsServer+0x5d8>
    5a58:	aa0003e7 	mov	x7, x0
    5a5c:	910003fd 	mov	x29, sp
    5a60:	f9411885 	ldr	x5, [x4, #560]
    5a64:	aa0203e6 	mov	x6, x2
    5a68:	2a0103e4 	mov	w4, w1
    5a6c:	aa0303e2 	mov	x2, x3
    5a70:	f9400ca0 	ldr	x0, [x5, #24]
    5a74:	b4000106 	cbz	x6, 5a94 <__assert_func+0x44>
    5a78:	b0000045 	adrp	x5, e000 <__func__.0+0x280>
    5a7c:	910c80a5 	add	x5, x5, #0x320
    5a80:	aa0703e3 	mov	x3, x7
    5a84:	b0000041 	adrp	x1, e000 <__func__.0+0x280>
    5a88:	910cc021 	add	x1, x1, #0x330
    5a8c:	94000049 	bl	5bb0 <fiprintf>
    5a90:	94000ae8 	bl	8630 <abort>
    5a94:	90000045 	adrp	x5, d000 <__ascii_wctomb+0x30>
    5a98:	912d40a5 	add	x5, x5, #0xb50
    5a9c:	aa0503e6 	mov	x6, x5
    5aa0:	17fffff8 	b	5a80 <__assert_func+0x30>
    5aa4:	d503201f 	nop
    5aa8:	d503201f 	nop
    5aac:	d503201f 	nop

0000000000005ab0 <__assert>:
    5ab0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    5ab4:	aa0203e3 	mov	x3, x2
    5ab8:	d2800002 	mov	x2, #0x0                   	// #0
    5abc:	910003fd 	mov	x29, sp
    5ac0:	97ffffe4 	bl	5a50 <__assert_func>
    5ac4:	d503201f 	nop
    5ac8:	d503201f 	nop
    5acc:	d503201f 	nop

0000000000005ad0 <atexit>:
    5ad0:	aa0003e1 	mov	x1, x0
    5ad4:	d2800003 	mov	x3, #0x0                   	// #0
    5ad8:	d2800002 	mov	x2, #0x0                   	// #0
    5adc:	52800000 	mov	w0, #0x0                   	// #0
    5ae0:	14000adc 	b	8650 <__register_exitproc>
    5ae4:	d503201f 	nop
    5ae8:	d503201f 	nop
    5aec:	d503201f 	nop

0000000000005af0 <__libc_fini_array>:
    5af0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    5af4:	b0000041 	adrp	x1, e000 <__func__.0+0x280>
    5af8:	b0000040 	adrp	x0, e000 <__func__.0+0x280>
    5afc:	910003fd 	mov	x29, sp
    5b00:	a90153f3 	stp	x19, x20, [sp, #16]
    5b04:	f941b033 	ldr	x19, [x1, #864]
    5b08:	f941b414 	ldr	x20, [x0, #872]
    5b0c:	cb140273 	sub	x19, x19, x20
    5b10:	9343fe73 	asr	x19, x19, #3
    5b14:	b40000b3 	cbz	x19, 5b28 <__libc_fini_array+0x38>
    5b18:	d1000673 	sub	x19, x19, #0x1
    5b1c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    5b20:	d63f0000 	blr	x0
    5b24:	b5ffffb3 	cbnz	x19, 5b18 <__libc_fini_array+0x28>
    5b28:	a94153f3 	ldp	x19, x20, [sp, #16]
    5b2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    5b30:	14001f95 	b	d984 <_fini>
    5b34:	d503201f 	nop
    5b38:	d503201f 	nop
    5b3c:	d503201f 	nop

0000000000005b40 <_fiprintf_r>:
    5b40:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    5b44:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    5b48:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    5b4c:	910003fd 	mov	x29, sp
    5b50:	910343ea 	add	x10, sp, #0xd0
    5b54:	910403eb 	add	x11, sp, #0x100
    5b58:	a9032feb 	stp	x11, x11, [sp, #48]
    5b5c:	f90023ea 	str	x10, [sp, #64]
    5b60:	290923e9 	stp	w9, w8, [sp, #72]
    5b64:	a9432fea 	ldp	x10, x11, [sp, #48]
    5b68:	a9012fea 	stp	x10, x11, [sp, #16]
    5b6c:	a94427e8 	ldp	x8, x9, [sp, #64]
    5b70:	a90227e8 	stp	x8, x9, [sp, #32]
    5b74:	3d8017e0 	str	q0, [sp, #80]
    5b78:	3d801be1 	str	q1, [sp, #96]
    5b7c:	3d801fe2 	str	q2, [sp, #112]
    5b80:	3d8023e3 	str	q3, [sp, #128]
    5b84:	3d8027e4 	str	q4, [sp, #144]
    5b88:	3d802be5 	str	q5, [sp, #160]
    5b8c:	3d802fe6 	str	q6, [sp, #176]
    5b90:	3d8033e7 	str	q7, [sp, #192]
    5b94:	a90d93e3 	stp	x3, x4, [sp, #216]
    5b98:	910043e3 	add	x3, sp, #0x10
    5b9c:	a90e9be5 	stp	x5, x6, [sp, #232]
    5ba0:	f9007fe7 	str	x7, [sp, #248]
    5ba4:	940002d7 	bl	6700 <_vfiprintf_r>
    5ba8:	a8d07bfd 	ldp	x29, x30, [sp], #256
    5bac:	d65f03c0 	ret

0000000000005bb0 <fiprintf>:
    5bb0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    5bb4:	d0000048 	adrp	x8, f000 <IpcFsServer+0x5d8>
    5bb8:	aa0003eb 	mov	x11, x0
    5bbc:	910003fd 	mov	x29, sp
    5bc0:	910343ec 	add	x12, sp, #0xd0
    5bc4:	910403ea 	add	x10, sp, #0x100
    5bc8:	f9411900 	ldr	x0, [x8, #560]
    5bcc:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    5bd0:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    5bd4:	a9032bea 	stp	x10, x10, [sp, #48]
    5bd8:	aa0103ea 	mov	x10, x1
    5bdc:	f90023ec 	str	x12, [sp, #64]
    5be0:	aa0b03e1 	mov	x1, x11
    5be4:	290923e9 	stp	w9, w8, [sp, #72]
    5be8:	a94337ec 	ldp	x12, x13, [sp, #48]
    5bec:	a90137ec 	stp	x12, x13, [sp, #16]
    5bf0:	a94427e8 	ldp	x8, x9, [sp, #64]
    5bf4:	a90227e8 	stp	x8, x9, [sp, #32]
    5bf8:	3d8017e0 	str	q0, [sp, #80]
    5bfc:	3d801be1 	str	q1, [sp, #96]
    5c00:	3d801fe2 	str	q2, [sp, #112]
    5c04:	3d8023e3 	str	q3, [sp, #128]
    5c08:	3d8027e4 	str	q4, [sp, #144]
    5c0c:	3d802be5 	str	q5, [sp, #160]
    5c10:	3d802fe6 	str	q6, [sp, #176]
    5c14:	3d8033e7 	str	q7, [sp, #192]
    5c18:	a90d0fe2 	stp	x2, x3, [sp, #208]
    5c1c:	910043e3 	add	x3, sp, #0x10
    5c20:	aa0a03e2 	mov	x2, x10
    5c24:	a90e17e4 	stp	x4, x5, [sp, #224]
    5c28:	a90f1fe6 	stp	x6, x7, [sp, #240]
    5c2c:	940002b5 	bl	6700 <_vfiprintf_r>
    5c30:	a8d07bfd 	ldp	x29, x30, [sp], #256
    5c34:	d65f03c0 	ret
    5c38:	d503201f 	nop
    5c3c:	d503201f 	nop

0000000000005c40 <__libc_init_array>:
    5c40:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    5c44:	b0000041 	adrp	x1, e000 <__func__.0+0x280>
    5c48:	b0000040 	adrp	x0, e000 <__func__.0+0x280>
    5c4c:	910003fd 	mov	x29, sp
    5c50:	a90153f3 	stp	x19, x20, [sp, #16]
    5c54:	f941bc34 	ldr	x20, [x1, #888]
    5c58:	f90013f5 	str	x21, [sp, #32]
    5c5c:	f941c015 	ldr	x21, [x0, #896]
    5c60:	cb150294 	sub	x20, x20, x21
    5c64:	9343fe94 	asr	x20, x20, #3
    5c68:	b40000f4 	cbz	x20, 5c84 <__libc_init_array+0x44>
    5c6c:	d2800013 	mov	x19, #0x0                   	// #0
    5c70:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    5c74:	91000673 	add	x19, x19, #0x1
    5c78:	d63f0000 	blr	x0
    5c7c:	eb13029f 	cmp	x20, x19
    5c80:	54ffff81 	b.ne	5c70 <__libc_init_array+0x30>  // b.any
    5c84:	940fe8df 	bl	400000 <_init>
    5c88:	b0000041 	adrp	x1, e000 <__func__.0+0x280>
    5c8c:	b0000040 	adrp	x0, e000 <__func__.0+0x280>
    5c90:	f941c434 	ldr	x20, [x1, #904]
    5c94:	f941c815 	ldr	x21, [x0, #912]
    5c98:	cb150294 	sub	x20, x20, x21
    5c9c:	9343fe94 	asr	x20, x20, #3
    5ca0:	b40000f4 	cbz	x20, 5cbc <__libc_init_array+0x7c>
    5ca4:	d2800013 	mov	x19, #0x0                   	// #0
    5ca8:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    5cac:	91000673 	add	x19, x19, #0x1
    5cb0:	d63f0000 	blr	x0
    5cb4:	eb13029f 	cmp	x20, x19
    5cb8:	54ffff81 	b.ne	5ca8 <__libc_init_array+0x68>  // b.any
    5cbc:	a94153f3 	ldp	x19, x20, [sp, #16]
    5cc0:	f94013f5 	ldr	x21, [sp, #32]
    5cc4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    5cc8:	d65f03c0 	ret
    5ccc:	d503201f 	nop
    5cd0:	d503201f 	nop
    5cd4:	d503201f 	nop
    5cd8:	d503201f 	nop
    5cdc:	d503201f 	nop
    5ce0:	d503201f 	nop
    5ce4:	d503201f 	nop
    5ce8:	d503201f 	nop
    5cec:	d503201f 	nop
    5cf0:	d503201f 	nop
    5cf4:	d503201f 	nop
    5cf8:	d503201f 	nop
    5cfc:	d503201f 	nop

0000000000005d00 <memcpy>:
    5d00:	f9800020 	prfm	pldl1keep, [x1]
    5d04:	8b020024 	add	x4, x1, x2
    5d08:	8b020005 	add	x5, x0, x2
    5d0c:	f100405f 	cmp	x2, #0x10
    5d10:	54000209 	b.ls	5d50 <memcpy+0x50>  // b.plast
    5d14:	f101805f 	cmp	x2, #0x60
    5d18:	54000648 	b.hi	5de0 <memcpy+0xe0>  // b.pmore
    5d1c:	d1000449 	sub	x9, x2, #0x1
    5d20:	a9401c26 	ldp	x6, x7, [x1]
    5d24:	37300469 	tbnz	w9, #6, 5db0 <memcpy+0xb0>
    5d28:	a97f348c 	ldp	x12, x13, [x4, #-16]
    5d2c:	362800a9 	tbz	w9, #5, 5d40 <memcpy+0x40>
    5d30:	a9412428 	ldp	x8, x9, [x1, #16]
    5d34:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    5d38:	a9012408 	stp	x8, x9, [x0, #16]
    5d3c:	a93e2caa 	stp	x10, x11, [x5, #-32]
    5d40:	a9001c06 	stp	x6, x7, [x0]
    5d44:	a93f34ac 	stp	x12, x13, [x5, #-16]
    5d48:	d65f03c0 	ret
    5d4c:	d503201f 	nop
    5d50:	f100205f 	cmp	x2, #0x8
    5d54:	540000e3 	b.cc	5d70 <memcpy+0x70>  // b.lo, b.ul, b.last
    5d58:	f9400026 	ldr	x6, [x1]
    5d5c:	f85f8087 	ldur	x7, [x4, #-8]
    5d60:	f9000006 	str	x6, [x0]
    5d64:	f81f80a7 	stur	x7, [x5, #-8]
    5d68:	d65f03c0 	ret
    5d6c:	d503201f 	nop
    5d70:	361000c2 	tbz	w2, #2, 5d88 <memcpy+0x88>
    5d74:	b9400026 	ldr	w6, [x1]
    5d78:	b85fc087 	ldur	w7, [x4, #-4]
    5d7c:	b9000006 	str	w6, [x0]
    5d80:	b81fc0a7 	stur	w7, [x5, #-4]
    5d84:	d65f03c0 	ret
    5d88:	b4000102 	cbz	x2, 5da8 <memcpy+0xa8>
    5d8c:	d341fc49 	lsr	x9, x2, #1
    5d90:	39400026 	ldrb	w6, [x1]
    5d94:	385ff087 	ldurb	w7, [x4, #-1]
    5d98:	38696828 	ldrb	w8, [x1, x9]
    5d9c:	39000006 	strb	w6, [x0]
    5da0:	38296808 	strb	w8, [x0, x9]
    5da4:	381ff0a7 	sturb	w7, [x5, #-1]
    5da8:	d65f03c0 	ret
    5dac:	d503201f 	nop
    5db0:	a9412428 	ldp	x8, x9, [x1, #16]
    5db4:	a9422c2a 	ldp	x10, x11, [x1, #32]
    5db8:	a943342c 	ldp	x12, x13, [x1, #48]
    5dbc:	a97e0881 	ldp	x1, x2, [x4, #-32]
    5dc0:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    5dc4:	a9001c06 	stp	x6, x7, [x0]
    5dc8:	a9012408 	stp	x8, x9, [x0, #16]
    5dcc:	a9022c0a 	stp	x10, x11, [x0, #32]
    5dd0:	a903340c 	stp	x12, x13, [x0, #48]
    5dd4:	a93e08a1 	stp	x1, x2, [x5, #-32]
    5dd8:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    5ddc:	d65f03c0 	ret
    5de0:	92400c09 	and	x9, x0, #0xf
    5de4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    5de8:	a940342c 	ldp	x12, x13, [x1]
    5dec:	cb090021 	sub	x1, x1, x9
    5df0:	8b090042 	add	x2, x2, x9
    5df4:	a9411c26 	ldp	x6, x7, [x1, #16]
    5df8:	a900340c 	stp	x12, x13, [x0]
    5dfc:	a9422428 	ldp	x8, x9, [x1, #32]
    5e00:	a9432c2a 	ldp	x10, x11, [x1, #48]
    5e04:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    5e08:	f1024042 	subs	x2, x2, #0x90
    5e0c:	54000169 	b.ls	5e38 <memcpy+0x138>  // b.plast
    5e10:	a9011c66 	stp	x6, x7, [x3, #16]
    5e14:	a9411c26 	ldp	x6, x7, [x1, #16]
    5e18:	a9022468 	stp	x8, x9, [x3, #32]
    5e1c:	a9422428 	ldp	x8, x9, [x1, #32]
    5e20:	a9032c6a 	stp	x10, x11, [x3, #48]
    5e24:	a9432c2a 	ldp	x10, x11, [x1, #48]
    5e28:	a984346c 	stp	x12, x13, [x3, #64]!
    5e2c:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    5e30:	f1010042 	subs	x2, x2, #0x40
    5e34:	54fffee8 	b.hi	5e10 <memcpy+0x110>  // b.pmore
    5e38:	a97c0881 	ldp	x1, x2, [x4, #-64]
    5e3c:	a9011c66 	stp	x6, x7, [x3, #16]
    5e40:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    5e44:	a9022468 	stp	x8, x9, [x3, #32]
    5e48:	a97e2488 	ldp	x8, x9, [x4, #-32]
    5e4c:	a9032c6a 	stp	x10, x11, [x3, #48]
    5e50:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    5e54:	a904346c 	stp	x12, x13, [x3, #64]
    5e58:	a93c08a1 	stp	x1, x2, [x5, #-64]
    5e5c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    5e60:	a93e24a8 	stp	x8, x9, [x5, #-32]
    5e64:	a93f2caa 	stp	x10, x11, [x5, #-16]
    5e68:	d65f03c0 	ret
    5e6c:	d503201f 	nop
    5e70:	d503201f 	nop
    5e74:	d503201f 	nop
    5e78:	d503201f 	nop
    5e7c:	d503201f 	nop

0000000000005e80 <memmove>:
    5e80:	cb010005 	sub	x5, x0, x1
    5e84:	f101805f 	cmp	x2, #0x60
    5e88:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    5e8c:	54fff3a2 	b.cs	5d00 <memcpy>  // b.hs, b.nlast
    5e90:	b40004c5 	cbz	x5, 5f28 <memmove+0xa8>
    5e94:	8b020004 	add	x4, x0, x2
    5e98:	8b020023 	add	x3, x1, x2
    5e9c:	92400c85 	and	x5, x4, #0xf
    5ea0:	a97f346c 	ldp	x12, x13, [x3, #-16]
    5ea4:	cb050063 	sub	x3, x3, x5
    5ea8:	cb050042 	sub	x2, x2, x5
    5eac:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    5eb0:	a93f348c 	stp	x12, x13, [x4, #-16]
    5eb4:	a97e2468 	ldp	x8, x9, [x3, #-32]
    5eb8:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    5ebc:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    5ec0:	cb050084 	sub	x4, x4, x5
    5ec4:	f1020042 	subs	x2, x2, #0x80
    5ec8:	54000189 	b.ls	5ef8 <memmove+0x78>  // b.plast
    5ecc:	d503201f 	nop
    5ed0:	a93f1c86 	stp	x6, x7, [x4, #-16]
    5ed4:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    5ed8:	a93e2488 	stp	x8, x9, [x4, #-32]
    5edc:	a97e2468 	ldp	x8, x9, [x3, #-32]
    5ee0:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    5ee4:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    5ee8:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    5eec:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    5ef0:	f1010042 	subs	x2, x2, #0x40
    5ef4:	54fffee8 	b.hi	5ed0 <memmove+0x50>  // b.pmore
    5ef8:	a9431422 	ldp	x2, x5, [x1, #48]
    5efc:	a93f1c86 	stp	x6, x7, [x4, #-16]
    5f00:	a9421c26 	ldp	x6, x7, [x1, #32]
    5f04:	a93e2488 	stp	x8, x9, [x4, #-32]
    5f08:	a9412428 	ldp	x8, x9, [x1, #16]
    5f0c:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    5f10:	a9402c2a 	ldp	x10, x11, [x1]
    5f14:	a93c348c 	stp	x12, x13, [x4, #-64]
    5f18:	a9031402 	stp	x2, x5, [x0, #48]
    5f1c:	a9021c06 	stp	x6, x7, [x0, #32]
    5f20:	a9012408 	stp	x8, x9, [x0, #16]
    5f24:	a9002c0a 	stp	x10, x11, [x0]
    5f28:	d65f03c0 	ret
    5f2c:	d503201f 	nop
    5f30:	d503201f 	nop
    5f34:	d503201f 	nop
    5f38:	d503201f 	nop
    5f3c:	d503201f 	nop

0000000000005f40 <memset>:
    5f40:	4e010c20 	dup	v0.16b, w1
    5f44:	8b020004 	add	x4, x0, x2
    5f48:	f101805f 	cmp	x2, #0x60
    5f4c:	540003c8 	b.hi	5fc4 <memset+0x84>  // b.pmore
    5f50:	f100405f 	cmp	x2, #0x10
    5f54:	54000202 	b.cs	5f94 <memset+0x54>  // b.hs, b.nlast
    5f58:	4e083c01 	mov	x1, v0.d[0]
    5f5c:	361800a2 	tbz	w2, #3, 5f70 <memset+0x30>
    5f60:	f9000001 	str	x1, [x0]
    5f64:	f81f8081 	stur	x1, [x4, #-8]
    5f68:	d65f03c0 	ret
    5f6c:	d503201f 	nop
    5f70:	36100082 	tbz	w2, #2, 5f80 <memset+0x40>
    5f74:	b9000001 	str	w1, [x0]
    5f78:	b81fc081 	stur	w1, [x4, #-4]
    5f7c:	d65f03c0 	ret
    5f80:	b4000082 	cbz	x2, 5f90 <memset+0x50>
    5f84:	39000001 	strb	w1, [x0]
    5f88:	36080042 	tbz	w2, #1, 5f90 <memset+0x50>
    5f8c:	781fe081 	sturh	w1, [x4, #-2]
    5f90:	d65f03c0 	ret
    5f94:	3d800000 	str	q0, [x0]
    5f98:	373000c2 	tbnz	w2, #6, 5fb0 <memset+0x70>
    5f9c:	3c9f0080 	stur	q0, [x4, #-16]
    5fa0:	36280062 	tbz	w2, #5, 5fac <memset+0x6c>
    5fa4:	3d800400 	str	q0, [x0, #16]
    5fa8:	3c9e0080 	stur	q0, [x4, #-32]
    5fac:	d65f03c0 	ret
    5fb0:	3d800400 	str	q0, [x0, #16]
    5fb4:	ad010000 	stp	q0, q0, [x0, #32]
    5fb8:	ad3f0080 	stp	q0, q0, [x4, #-32]
    5fbc:	d65f03c0 	ret
    5fc0:	d503201f 	nop
    5fc4:	12001c21 	and	w1, w1, #0xff
    5fc8:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    5fcc:	3d800000 	str	q0, [x0]
    5fd0:	f104005f 	cmp	x2, #0x100
    5fd4:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    5fd8:	54000180 	b.eq	6008 <memset+0xc8>  // b.none
    5fdc:	cb030082 	sub	x2, x4, x3
    5fe0:	d1004063 	sub	x3, x3, #0x10
    5fe4:	d1014042 	sub	x2, x2, #0x50
    5fe8:	ad010060 	stp	q0, q0, [x3, #32]
    5fec:	ad820060 	stp	q0, q0, [x3, #64]!
    5ff0:	f1010042 	subs	x2, x2, #0x40
    5ff4:	54ffffa8 	b.hi	5fe8 <memset+0xa8>  // b.pmore
    5ff8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    5ffc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    6000:	d65f03c0 	ret
    6004:	d503201f 	nop
    6008:	d53b00e5 	mrs	x5, dczid_el0
    600c:	3727fe85 	tbnz	w5, #4, 5fdc <memset+0x9c>
    6010:	12000ca5 	and	w5, w5, #0xf
    6014:	710010bf 	cmp	w5, #0x4
    6018:	54000281 	b.ne	6068 <memset+0x128>  // b.any
    601c:	3d800460 	str	q0, [x3, #16]
    6020:	ad010060 	stp	q0, q0, [x3, #32]
    6024:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    6028:	ad020060 	stp	q0, q0, [x3, #64]
    602c:	ad030060 	stp	q0, q0, [x3, #96]
    6030:	cb030082 	sub	x2, x4, x3
    6034:	d1040042 	sub	x2, x2, #0x100
    6038:	91020063 	add	x3, x3, #0x80
    603c:	d503201f 	nop
    6040:	d50b7423 	dc	zva, x3
    6044:	91010063 	add	x3, x3, #0x40
    6048:	f1010042 	subs	x2, x2, #0x40
    604c:	54ffffa8 	b.hi	6040 <memset+0x100>  // b.pmore
    6050:	ad000060 	stp	q0, q0, [x3]
    6054:	ad010060 	stp	q0, q0, [x3, #32]
    6058:	ad3e0080 	stp	q0, q0, [x4, #-64]
    605c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    6060:	d65f03c0 	ret
    6064:	d503201f 	nop
    6068:	710014bf 	cmp	w5, #0x5
    606c:	54000241 	b.ne	60b4 <memset+0x174>  // b.any
    6070:	3d800460 	str	q0, [x3, #16]
    6074:	ad010060 	stp	q0, q0, [x3, #32]
    6078:	ad020060 	stp	q0, q0, [x3, #64]
    607c:	ad030060 	stp	q0, q0, [x3, #96]
    6080:	9279e063 	and	x3, x3, #0xffffffffffffff80
    6084:	cb030082 	sub	x2, x4, x3
    6088:	d1040042 	sub	x2, x2, #0x100
    608c:	91020063 	add	x3, x3, #0x80
    6090:	d50b7423 	dc	zva, x3
    6094:	91020063 	add	x3, x3, #0x80
    6098:	f1020042 	subs	x2, x2, #0x80
    609c:	54ffffa8 	b.hi	6090 <memset+0x150>  // b.pmore
    60a0:	ad3c0080 	stp	q0, q0, [x4, #-128]
    60a4:	ad3d0080 	stp	q0, q0, [x4, #-96]
    60a8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    60ac:	ad3f0080 	stp	q0, q0, [x4, #-32]
    60b0:	d65f03c0 	ret
    60b4:	52800086 	mov	w6, #0x4                   	// #4
    60b8:	1ac520c7 	lsl	w7, w6, w5
    60bc:	910100e5 	add	x5, x7, #0x40
    60c0:	eb05005f 	cmp	x2, x5
    60c4:	54fff8c3 	b.cc	5fdc <memset+0x9c>  // b.lo, b.ul, b.last
    60c8:	d10004e6 	sub	x6, x7, #0x1
    60cc:	8b070065 	add	x5, x3, x7
    60d0:	91004063 	add	x3, x3, #0x10
    60d4:	eb0300a2 	subs	x2, x5, x3
    60d8:	8a2600a5 	bic	x5, x5, x6
    60dc:	540000a0 	b.eq	60f0 <memset+0x1b0>  // b.none
    60e0:	ac820060 	stp	q0, q0, [x3], #64
    60e4:	ad3f0060 	stp	q0, q0, [x3, #-32]
    60e8:	f1010042 	subs	x2, x2, #0x40
    60ec:	54ffffa8 	b.hi	60e0 <memset+0x1a0>  // b.pmore
    60f0:	aa0503e3 	mov	x3, x5
    60f4:	cb050082 	sub	x2, x4, x5
    60f8:	eb070042 	subs	x2, x2, x7
    60fc:	540000a3 	b.cc	6110 <memset+0x1d0>  // b.lo, b.ul, b.last
    6100:	d50b7423 	dc	zva, x3
    6104:	8b070063 	add	x3, x3, x7
    6108:	eb070042 	subs	x2, x2, x7
    610c:	54ffffa2 	b.cs	6100 <memset+0x1c0>  // b.hs, b.nlast
    6110:	8b070042 	add	x2, x2, x7
    6114:	d1008063 	sub	x3, x3, #0x20
    6118:	17ffffb6 	b	5ff0 <memset+0xb0>
    611c:	d503201f 	nop
    6120:	d503201f 	nop
    6124:	d503201f 	nop
    6128:	d503201f 	nop
    612c:	d503201f 	nop
    6130:	d503201f 	nop
    6134:	d503201f 	nop
    6138:	d503201f 	nop
    613c:	d503201f 	nop

0000000000006140 <strcmp>:
    6140:	ca010007 	eor	x7, x0, x1
    6144:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    6148:	f24008ff 	tst	x7, #0x7
    614c:	540003e1 	b.ne	61c8 <strcmp+0x88>  // b.any
    6150:	f2400807 	ands	x7, x0, #0x7
    6154:	54000241 	b.ne	619c <strcmp+0x5c>  // b.any
    6158:	f8408402 	ldr	x2, [x0], #8
    615c:	f8408423 	ldr	x3, [x1], #8
    6160:	cb0a0047 	sub	x7, x2, x10
    6164:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    6168:	ca030045 	eor	x5, x2, x3
    616c:	8a2800e4 	bic	x4, x7, x8
    6170:	aa0400a6 	orr	x6, x5, x4
    6174:	b4ffff26 	cbz	x6, 6158 <strcmp+0x18>
    6178:	dac00cc6 	rev	x6, x6
    617c:	dac00c42 	rev	x2, x2
    6180:	dac010cb 	clz	x11, x6
    6184:	dac00c63 	rev	x3, x3
    6188:	9acb2042 	lsl	x2, x2, x11
    618c:	9acb2063 	lsl	x3, x3, x11
    6190:	d378fc42 	lsr	x2, x2, #56
    6194:	cb43e040 	sub	x0, x2, x3, lsr #56
    6198:	d65f03c0 	ret
    619c:	927df000 	and	x0, x0, #0xfffffffffffffff8
    61a0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    61a4:	d37df0e7 	lsl	x7, x7, #3
    61a8:	f8408402 	ldr	x2, [x0], #8
    61ac:	cb0703e7 	neg	x7, x7
    61b0:	f8408423 	ldr	x3, [x1], #8
    61b4:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    61b8:	9ac72508 	lsr	x8, x8, x7
    61bc:	aa080042 	orr	x2, x2, x8
    61c0:	aa080063 	orr	x3, x3, x8
    61c4:	17ffffe7 	b	6160 <strcmp+0x20>
    61c8:	f240081f 	tst	x0, #0x7
    61cc:	54000100 	b.eq	61ec <strcmp+0xac>  // b.none
    61d0:	38401402 	ldrb	w2, [x0], #1
    61d4:	38401423 	ldrb	w3, [x1], #1
    61d8:	7100045f 	cmp	w2, #0x1
    61dc:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    61e0:	540001e1 	b.ne	621c <strcmp+0xdc>  // b.any
    61e4:	f240081f 	tst	x0, #0x7
    61e8:	54ffff41 	b.ne	61d0 <strcmp+0x90>  // b.any
    61ec:	927d2027 	and	x7, x1, #0xff8
    61f0:	d27d20e7 	eor	x7, x7, #0xff8
    61f4:	b4fffee7 	cbz	x7, 61d0 <strcmp+0x90>
    61f8:	f8408402 	ldr	x2, [x0], #8
    61fc:	f8408423 	ldr	x3, [x1], #8
    6200:	cb0a0047 	sub	x7, x2, x10
    6204:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    6208:	ca030045 	eor	x5, x2, x3
    620c:	8a2800e4 	bic	x4, x7, x8
    6210:	aa0400a6 	orr	x6, x5, x4
    6214:	b4fffec6 	cbz	x6, 61ec <strcmp+0xac>
    6218:	17ffffd8 	b	6178 <strcmp+0x38>
    621c:	cb030040 	sub	x0, x2, x3
    6220:	d65f03c0 	ret
    6224:	d503201f 	nop
    6228:	d503201f 	nop
    622c:	d503201f 	nop
    6230:	d503201f 	nop
    6234:	d503201f 	nop
    6238:	d503201f 	nop
    623c:	d503201f 	nop

0000000000006240 <strlen>:
    6240:	92402c04 	and	x4, x0, #0xfff
    6244:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    6248:	f13fc09f 	cmp	x4, #0xff0
    624c:	5400082c 	b.gt	6350 <strlen+0x110>
    6250:	a9400c02 	ldp	x2, x3, [x0]
    6254:	cb080044 	sub	x4, x2, x8
    6258:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    625c:	cb080066 	sub	x6, x3, x8
    6260:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    6264:	ea250084 	bics	x4, x4, x5
    6268:	8a2700c5 	bic	x5, x6, x7
    626c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    6270:	54000100 	b.eq	6290 <strlen+0x50>  // b.none
    6274:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    6278:	d2800100 	mov	x0, #0x8                   	// #8
    627c:	dac00c84 	rev	x4, x4
    6280:	dac01084 	clz	x4, x4
    6284:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    6288:	8b440c00 	add	x0, x0, x4, lsr #3
    628c:	d65f03c0 	ret
    6290:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    6294:	d1004021 	sub	x1, x1, #0x10
    6298:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    629c:	cb080044 	sub	x4, x2, x8
    62a0:	cb080066 	sub	x6, x3, x8
    62a4:	aa060085 	orr	x5, x4, x6
    62a8:	ea081cbf 	tst	x5, x8, lsl #7
    62ac:	54000101 	b.ne	62cc <strlen+0x8c>  // b.any
    62b0:	a9410c22 	ldp	x2, x3, [x1, #16]
    62b4:	cb080044 	sub	x4, x2, x8
    62b8:	cb080066 	sub	x6, x3, x8
    62bc:	aa060085 	orr	x5, x4, x6
    62c0:	ea081cbf 	tst	x5, x8, lsl #7
    62c4:	54fffea0 	b.eq	6298 <strlen+0x58>  // b.none
    62c8:	91004021 	add	x1, x1, #0x10
    62cc:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    62d0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    62d4:	ea250084 	bics	x4, x4, x5
    62d8:	8a2700c5 	bic	x5, x6, x7
    62dc:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    62e0:	54000120 	b.eq	6304 <strlen+0xc4>  // b.none
    62e4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    62e8:	cb000020 	sub	x0, x1, x0
    62ec:	dac00c84 	rev	x4, x4
    62f0:	91002005 	add	x5, x0, #0x8
    62f4:	dac01084 	clz	x4, x4
    62f8:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    62fc:	8b440c00 	add	x0, x0, x4, lsr #3
    6300:	d65f03c0 	ret
    6304:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    6308:	cb080044 	sub	x4, x2, x8
    630c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    6310:	cb080066 	sub	x6, x3, x8
    6314:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    6318:	ea250084 	bics	x4, x4, x5
    631c:	8a2700c5 	bic	x5, x6, x7
    6320:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    6324:	54fffe01 	b.ne	62e4 <strlen+0xa4>  // b.any
    6328:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    632c:	cb080044 	sub	x4, x2, x8
    6330:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    6334:	cb080066 	sub	x6, x3, x8
    6338:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    633c:	ea250084 	bics	x4, x4, x5
    6340:	8a2700c5 	bic	x5, x6, x7
    6344:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    6348:	54fffde0 	b.eq	6304 <strlen+0xc4>  // b.none
    634c:	17ffffe6 	b	62e4 <strlen+0xa4>
    6350:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    6354:	a9400c22 	ldp	x2, x3, [x1]
    6358:	d37df004 	lsl	x4, x0, #3
    635c:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    6360:	9ac420e4 	lsl	x4, x7, x4
    6364:	b201c084 	orr	x4, x4, #0x8080808080808080
    6368:	aa240042 	orn	x2, x2, x4
    636c:	aa240065 	orn	x5, x3, x4
    6370:	f27d001f 	tst	x0, #0x8
    6374:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    6378:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    637c:	17ffffc8 	b	629c <strlen+0x5c>
    6380:	d503201f 	nop
    6384:	d503201f 	nop
    6388:	d503201f 	nop
    638c:	d503201f 	nop
    6390:	d503201f 	nop
    6394:	d503201f 	nop
    6398:	d503201f 	nop

000000000000639c <strncmp>:
    639c:	b4000d82 	cbz	x2, 654c <strncmp+0x1b0>
    63a0:	ca010008 	eor	x8, x0, x1
    63a4:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    63a8:	f240091f 	tst	x8, #0x7
    63ac:	9240080e 	and	x14, x0, #0x7
    63b0:	54000681 	b.ne	6480 <strncmp+0xe4>  // b.any
    63b4:	b500040e 	cbnz	x14, 6434 <strncmp+0x98>
    63b8:	d100044d 	sub	x13, x2, #0x1
    63bc:	d343fdad 	lsr	x13, x13, #3
    63c0:	f8408403 	ldr	x3, [x0], #8
    63c4:	f8408424 	ldr	x4, [x1], #8
    63c8:	f10005ad 	subs	x13, x13, #0x1
    63cc:	cb0b0068 	sub	x8, x3, x11
    63d0:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    63d4:	ca040066 	eor	x6, x3, x4
    63d8:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    63dc:	ea290105 	bics	x5, x8, x9
    63e0:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    63e4:	54fffee0 	b.eq	63c0 <strncmp+0x24>  // b.none
    63e8:	b6f8012d 	tbz	x13, #63, 640c <strncmp+0x70>
    63ec:	f2400842 	ands	x2, x2, #0x7
    63f0:	540000e0 	b.eq	640c <strncmp+0x70>  // b.none
    63f4:	d37df042 	lsl	x2, x2, #3
    63f8:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    63fc:	9ac221ce 	lsl	x14, x14, x2
    6400:	8a2e0063 	bic	x3, x3, x14
    6404:	8a2e0084 	bic	x4, x4, x14
    6408:	aa0e00a5 	orr	x5, x5, x14
    640c:	aa0500c7 	orr	x7, x6, x5
    6410:	dac00ce7 	rev	x7, x7
    6414:	dac00c63 	rev	x3, x3
    6418:	dac010ec 	clz	x12, x7
    641c:	dac00c84 	rev	x4, x4
    6420:	9acc2063 	lsl	x3, x3, x12
    6424:	9acc2084 	lsl	x4, x4, x12
    6428:	d378fc63 	lsr	x3, x3, #56
    642c:	cb44e060 	sub	x0, x3, x4, lsr #56
    6430:	d65f03c0 	ret
    6434:	927df000 	and	x0, x0, #0xfffffffffffffff8
    6438:	927df021 	and	x1, x1, #0xfffffffffffffff8
    643c:	f8408403 	ldr	x3, [x0], #8
    6440:	cb0e0fea 	neg	x10, x14, lsl #3
    6444:	f8408424 	ldr	x4, [x1], #8
    6448:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    644c:	d100044d 	sub	x13, x2, #0x1
    6450:	9aca2529 	lsr	x9, x9, x10
    6454:	924009aa 	and	x10, x13, #0x7
    6458:	d343fdad 	lsr	x13, x13, #3
    645c:	8b0e0042 	add	x2, x2, x14
    6460:	8b0e014a 	add	x10, x10, x14
    6464:	aa090063 	orr	x3, x3, x9
    6468:	aa090084 	orr	x4, x4, x9
    646c:	8b4a0dad 	add	x13, x13, x10, lsr #3
    6470:	17ffffd6 	b	63c8 <strncmp+0x2c>
    6474:	d503201f 	nop
    6478:	d503201f 	nop
    647c:	d503201f 	nop
    6480:	f100405f 	cmp	x2, #0x10
    6484:	54000122 	b.cs	64a8 <strncmp+0x10c>  // b.hs, b.nlast
    6488:	38401403 	ldrb	w3, [x0], #1
    648c:	38401424 	ldrb	w4, [x1], #1
    6490:	f1000442 	subs	x2, x2, #0x1
    6494:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    6498:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    649c:	54ffff60 	b.eq	6488 <strncmp+0xec>  // b.none
    64a0:	cb040060 	sub	x0, x3, x4
    64a4:	d65f03c0 	ret
    64a8:	d343fc4d 	lsr	x13, x2, #3
    64ac:	b400018e 	cbz	x14, 64dc <strncmp+0x140>
    64b0:	cb0e03ee 	neg	x14, x14
    64b4:	924009ce 	and	x14, x14, #0x7
    64b8:	cb0e0042 	sub	x2, x2, x14
    64bc:	d343fc4d 	lsr	x13, x2, #3
    64c0:	38401403 	ldrb	w3, [x0], #1
    64c4:	38401424 	ldrb	w4, [x1], #1
    64c8:	7100047f 	cmp	w3, #0x1
    64cc:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    64d0:	54fffe81 	b.ne	64a0 <strncmp+0x104>  // b.any
    64d4:	f10005ce 	subs	x14, x14, #0x1
    64d8:	54ffff48 	b.hi	64c0 <strncmp+0x124>  // b.pmore
    64dc:	d280010e 	mov	x14, #0x8                   	// #8
    64e0:	f10005ad 	subs	x13, x13, #0x1
    64e4:	540001c3 	b.cc	651c <strncmp+0x180>  // b.lo, b.ul, b.last
    64e8:	927d2029 	and	x9, x1, #0xff8
    64ec:	d27d2129 	eor	x9, x9, #0xff8
    64f0:	b4fffe89 	cbz	x9, 64c0 <strncmp+0x124>
    64f4:	f8408403 	ldr	x3, [x0], #8
    64f8:	f8408424 	ldr	x4, [x1], #8
    64fc:	cb0b0068 	sub	x8, x3, x11
    6500:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    6504:	ca040066 	eor	x6, x3, x4
    6508:	ea290105 	bics	x5, x8, x9
    650c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    6510:	54fff7e1 	b.ne	640c <strncmp+0x70>  // b.any
    6514:	f10005ad 	subs	x13, x13, #0x1
    6518:	54fffe85 	b.pl	64e8 <strncmp+0x14c>  // b.nfrst
    651c:	92400842 	and	x2, x2, #0x7
    6520:	b4fff762 	cbz	x2, 640c <strncmp+0x70>
    6524:	d1002000 	sub	x0, x0, #0x8
    6528:	d1002021 	sub	x1, x1, #0x8
    652c:	f8626803 	ldr	x3, [x0, x2]
    6530:	f8626824 	ldr	x4, [x1, x2]
    6534:	cb0b0068 	sub	x8, x3, x11
    6538:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    653c:	ca040066 	eor	x6, x3, x4
    6540:	ea290105 	bics	x5, x8, x9
    6544:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    6548:	54fff621 	b.ne	640c <strncmp+0x70>  // b.any
    654c:	d2800000 	mov	x0, #0x0                   	// #0
    6550:	d65f03c0 	ret
    6554:	d503201f 	nop
    6558:	d503201f 	nop
    655c:	d503201f 	nop

0000000000006560 <strncpy>:
    6560:	aa000023 	orr	x3, x1, x0
    6564:	f240087f 	tst	x3, #0x7
    6568:	aa0003e3 	mov	x3, x0
    656c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    6570:	540002c8 	b.hi	65c8 <strncpy+0x68>  // b.pmore
    6574:	d1000445 	sub	x5, x2, #0x1
    6578:	d2800027 	mov	x7, #0x1                   	// #1
    657c:	8b050025 	add	x5, x1, x5
    6580:	14000007 	b	659c <strncpy+0x3c>
    6584:	386468a4 	ldrb	w4, [x5, x4]
    6588:	d1000446 	sub	x6, x2, #0x1
    658c:	38001424 	strb	w4, [x1], #1
    6590:	340000e4 	cbz	w4, 65ac <strncpy+0x4c>
    6594:	aa0103e3 	mov	x3, x1
    6598:	aa0603e2 	mov	x2, x6
    659c:	cb0200e4 	sub	x4, x7, x2
    65a0:	aa0303e1 	mov	x1, x3
    65a4:	b5ffff02 	cbnz	x2, 6584 <strncpy+0x24>
    65a8:	d65f03c0 	ret
    65ac:	8b020062 	add	x2, x3, x2
    65b0:	b4ffffc6 	cbz	x6, 65a8 <strncpy+0x48>
    65b4:	d503201f 	nop
    65b8:	3800143f 	strb	wzr, [x1], #1
    65bc:	eb02003f 	cmp	x1, x2
    65c0:	54ffffc1 	b.ne	65b8 <strncpy+0x58>  // b.any
    65c4:	d65f03c0 	ret
    65c8:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    65cc:	f29fdfe6 	movk	x6, #0xfeff
    65d0:	f9400025 	ldr	x5, [x1]
    65d4:	8b0600a4 	add	x4, x5, x6
    65d8:	8a250084 	bic	x4, x4, x5
    65dc:	f201c09f 	tst	x4, #0x8080808080808080
    65e0:	54fffca1 	b.ne	6574 <strncpy+0x14>  // b.any
    65e4:	d1002042 	sub	x2, x2, #0x8
    65e8:	f8008465 	str	x5, [x3], #8
    65ec:	91002021 	add	x1, x1, #0x8
    65f0:	f1001c5f 	cmp	x2, #0x7
    65f4:	54fffee8 	b.hi	65d0 <strncpy+0x70>  // b.pmore
    65f8:	17ffffdf 	b	6574 <strncpy+0x14>
    65fc:	d503201f 	nop

0000000000006600 <__sprint_r.part.0>:
    6600:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6604:	910003fd 	mov	x29, sp
    6608:	b940ac23 	ldr	w3, [x1, #172]
    660c:	a90363f7 	stp	x23, x24, [sp, #48]
    6610:	aa0203f8 	mov	x24, x2
    6614:	36680563 	tbz	w3, #13, 66c0 <__sprint_r.part.0+0xc0>
    6618:	a9025bf5 	stp	x21, x22, [sp, #32]
    661c:	aa0003f5 	mov	x21, x0
    6620:	f9400840 	ldr	x0, [x2, #16]
    6624:	a90153f3 	stp	x19, x20, [sp, #16]
    6628:	aa0103f4 	mov	x20, x1
    662c:	a9046bf9 	stp	x25, x26, [sp, #64]
    6630:	f940005a 	ldr	x26, [x2]
    6634:	b40003c0 	cbz	x0, 66ac <__sprint_r.part.0+0xac>
    6638:	a9406756 	ldp	x22, x25, [x26]
    663c:	d342ff39 	lsr	x25, x25, #2
    6640:	2a1903f7 	mov	w23, w25
    6644:	7100033f 	cmp	w25, #0x0
    6648:	540002ad 	b.le	669c <__sprint_r.part.0+0x9c>
    664c:	d2800013 	mov	x19, #0x0                   	// #0
    6650:	14000003 	b	665c <__sprint_r.part.0+0x5c>
    6654:	6b1302ff 	cmp	w23, w19
    6658:	5400020d 	b.le	6698 <__sprint_r.part.0+0x98>
    665c:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    6660:	aa1403e2 	mov	x2, x20
    6664:	aa1503e0 	mov	x0, x21
    6668:	91000673 	add	x19, x19, #0x1
    666c:	94000a15 	bl	8ec0 <_fputwc_r>
    6670:	3100041f 	cmn	w0, #0x1
    6674:	54ffff01 	b.ne	6654 <__sprint_r.part.0+0x54>  // b.any
    6678:	a94153f3 	ldp	x19, x20, [sp, #16]
    667c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6680:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6684:	b9000b1f 	str	wzr, [x24, #8]
    6688:	f9000b1f 	str	xzr, [x24, #16]
    668c:	a94363f7 	ldp	x23, x24, [sp, #48]
    6690:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6694:	d65f03c0 	ret
    6698:	f9400b00 	ldr	x0, [x24, #16]
    669c:	cb39c800 	sub	x0, x0, w25, sxtw #2
    66a0:	f9000b00 	str	x0, [x24, #16]
    66a4:	9100435a 	add	x26, x26, #0x10
    66a8:	b5fffc80 	cbnz	x0, 6638 <__sprint_r.part.0+0x38>
    66ac:	52800000 	mov	w0, #0x0                   	// #0
    66b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    66b4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    66b8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    66bc:	17fffff2 	b	6684 <__sprint_r.part.0+0x84>
    66c0:	94000b2c 	bl	9370 <__sfvwrite_r>
    66c4:	b9000b1f 	str	wzr, [x24, #8]
    66c8:	f9000b1f 	str	xzr, [x24, #16]
    66cc:	a94363f7 	ldp	x23, x24, [sp, #48]
    66d0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    66d4:	d65f03c0 	ret
    66d8:	d503201f 	nop
    66dc:	d503201f 	nop

00000000000066e0 <__sprint_r>:
    66e0:	f9400844 	ldr	x4, [x2, #16]
    66e4:	b4000044 	cbz	x4, 66ec <__sprint_r+0xc>
    66e8:	17ffffc6 	b	6600 <__sprint_r.part.0>
    66ec:	52800000 	mov	w0, #0x0                   	// #0
    66f0:	b900085f 	str	wzr, [x2, #8]
    66f4:	d65f03c0 	ret
    66f8:	d503201f 	nop
    66fc:	d503201f 	nop

0000000000006700 <_vfiprintf_r>:
    6700:	d10843ff 	sub	sp, sp, #0x210
    6704:	a9007bfd 	stp	x29, x30, [sp]
    6708:	910003fd 	mov	x29, sp
    670c:	a9025bf5 	stp	x21, x22, [sp, #32]
    6710:	aa0303f5 	mov	x21, x3
    6714:	f9400063 	ldr	x3, [x3]
    6718:	f90037e3 	str	x3, [sp, #104]
    671c:	f94006a3 	ldr	x3, [x21, #8]
    6720:	f90043e3 	str	x3, [sp, #128]
    6724:	b9401aa3 	ldr	w3, [x21, #24]
    6728:	a90153f3 	stp	x19, x20, [sp, #16]
    672c:	aa0003f3 	mov	x19, x0
    6730:	aa0203f4 	mov	x20, x2
    6734:	9103e3e0 	add	x0, sp, #0xf8
    6738:	d2800102 	mov	x2, #0x8                   	// #8
    673c:	a9046bf9 	stp	x25, x26, [sp, #64]
    6740:	aa0103f9 	mov	x25, x1
    6744:	52800001 	mov	w1, #0x0                   	// #0
    6748:	b900b3e3 	str	w3, [sp, #176]
    674c:	97fffdfd 	bl	5f40 <memset>
    6750:	b4000073 	cbz	x19, 675c <_vfiprintf_r+0x5c>
    6754:	b9405260 	ldr	w0, [x19, #80]
    6758:	34002020 	cbz	w0, 6b5c <_vfiprintf_r+0x45c>
    675c:	79c02321 	ldrsh	w1, [x25, #16]
    6760:	12003c20 	and	w0, w1, #0xffff
    6764:	376800e1 	tbnz	w1, #13, 6780 <_vfiprintf_r+0x80>
    6768:	b940af22 	ldr	w2, [x25, #172]
    676c:	32130021 	orr	w1, w1, #0x2000
    6770:	12003c20 	and	w0, w1, #0xffff
    6774:	79002321 	strh	w1, [x25, #16]
    6778:	12127841 	and	w1, w2, #0xffffdfff
    677c:	b900af21 	str	w1, [x25, #172]
    6780:	36180520 	tbz	w0, #3, 6824 <_vfiprintf_r+0x124>
    6784:	f9400f21 	ldr	x1, [x25, #24]
    6788:	b40004e1 	cbz	x1, 6824 <_vfiprintf_r+0x124>
    678c:	52800341 	mov	w1, #0x1a                  	// #26
    6790:	0a010000 	and	w0, w0, w1
    6794:	7100281f 	cmp	w0, #0xa
    6798:	54000580 	b.eq	6848 <_vfiprintf_r+0x148>  // b.none
    679c:	a90573fb 	stp	x27, x28, [sp, #80]
    67a0:	910643fc 	add	x28, sp, #0x190
    67a4:	b0000055 	adrp	x21, f000 <IpcFsServer+0x5d8>
    67a8:	aa1c03fb 	mov	x27, x28
    67ac:	912682b5 	add	x21, x21, #0x9a0
    67b0:	90000040 	adrp	x0, e000 <__func__.0+0x280>
    67b4:	910f4000 	add	x0, x0, #0x3d0
    67b8:	a90363f7 	stp	x23, x24, [sp, #48]
    67bc:	b90067ff 	str	wzr, [sp, #100]
    67c0:	f9003fe0 	str	x0, [sp, #120]
    67c4:	f90047ff 	str	xzr, [sp, #136]
    67c8:	a909ffff 	stp	xzr, xzr, [sp, #152]
    67cc:	f90057ff 	str	xzr, [sp, #168]
    67d0:	f9008bfc 	str	x28, [sp, #272]
    67d4:	b9011bff 	str	wzr, [sp, #280]
    67d8:	f90093ff 	str	xzr, [sp, #288]
    67dc:	aa1403f7 	mov	x23, x20
    67e0:	f94076b6 	ldr	x22, [x21, #232]
    67e4:	94000fa7 	bl	a680 <__locale_mb_cur_max>
    67e8:	9103e3e4 	add	x4, sp, #0xf8
    67ec:	93407c03 	sxtw	x3, w0
    67f0:	aa1703e2 	mov	x2, x23
    67f4:	9103d3e1 	add	x1, sp, #0xf4
    67f8:	aa1303e0 	mov	x0, x19
    67fc:	d63f02c0 	blr	x22
    6800:	7100001f 	cmp	w0, #0x0
    6804:	340004a0 	cbz	w0, 6898 <_vfiprintf_r+0x198>
    6808:	540003ab 	b.lt	687c <_vfiprintf_r+0x17c>  // b.tstop
    680c:	b940f7e1 	ldr	w1, [sp, #244]
    6810:	7100943f 	cmp	w1, #0x25
    6814:	54001720 	b.eq	6af8 <_vfiprintf_r+0x3f8>  // b.none
    6818:	93407c00 	sxtw	x0, w0
    681c:	8b0002f7 	add	x23, x23, x0
    6820:	17fffff0 	b	67e0 <_vfiprintf_r+0xe0>
    6824:	aa1903e1 	mov	x1, x25
    6828:	aa1303e0 	mov	x0, x19
    682c:	9400072d 	bl	84e0 <__swsetup_r>
    6830:	3500b220 	cbnz	w0, 7e74 <_vfiprintf_r+0x1774>
    6834:	79402320 	ldrh	w0, [x25, #16]
    6838:	52800341 	mov	w1, #0x1a                  	// #26
    683c:	0a010000 	and	w0, w0, w1
    6840:	7100281f 	cmp	w0, #0xa
    6844:	54fffac1 	b.ne	679c <_vfiprintf_r+0x9c>  // b.any
    6848:	79c02720 	ldrsh	w0, [x25, #18]
    684c:	37fffa80 	tbnz	w0, #31, 679c <_vfiprintf_r+0x9c>
    6850:	a9401ea6 	ldp	x6, x7, [x21]
    6854:	aa1403e2 	mov	x2, x20
    6858:	a94116a4 	ldp	x4, x5, [x21, #16]
    685c:	aa1903e1 	mov	x1, x25
    6860:	aa1303e0 	mov	x0, x19
    6864:	910303e3 	add	x3, sp, #0xc0
    6868:	a90c1fe6 	stp	x6, x7, [sp, #192]
    686c:	a90d17e4 	stp	x4, x5, [sp, #208]
    6870:	9400068c 	bl	82a0 <__sbprintf>
    6874:	b90067e0 	str	w0, [sp, #100]
    6878:	140000b2 	b	6b40 <_vfiprintf_r+0x440>
    687c:	9103e3e0 	add	x0, sp, #0xf8
    6880:	d2800102 	mov	x2, #0x8                   	// #8
    6884:	52800001 	mov	w1, #0x0                   	// #0
    6888:	97fffdae 	bl	5f40 <memset>
    688c:	d2800020 	mov	x0, #0x1                   	// #1
    6890:	8b0002f7 	add	x23, x23, x0
    6894:	17ffffd3 	b	67e0 <_vfiprintf_r+0xe0>
    6898:	2a0003f6 	mov	w22, w0
    689c:	cb1402e0 	sub	x0, x23, x20
    68a0:	2a0003f8 	mov	w24, w0
    68a4:	34008d60 	cbz	w0, 7a50 <_vfiprintf_r+0x1350>
    68a8:	f94093e2 	ldr	x2, [sp, #288]
    68ac:	93407f01 	sxtw	x1, w24
    68b0:	b9411be0 	ldr	w0, [sp, #280]
    68b4:	8b020022 	add	x2, x1, x2
    68b8:	a9000774 	stp	x20, x1, [x27]
    68bc:	11000400 	add	w0, w0, #0x1
    68c0:	b9011be0 	str	w0, [sp, #280]
    68c4:	f90093e2 	str	x2, [sp, #288]
    68c8:	71001c1f 	cmp	w0, #0x7
    68cc:	5400120d 	b.le	6b0c <_vfiprintf_r+0x40c>
    68d0:	b4006222 	cbz	x2, 7514 <_vfiprintf_r+0xe14>
    68d4:	910443e2 	add	x2, sp, #0x110
    68d8:	aa1903e1 	mov	x1, x25
    68dc:	aa1303e0 	mov	x0, x19
    68e0:	97ffff48 	bl	6600 <__sprint_r.part.0>
    68e4:	35001260 	cbnz	w0, 6b30 <_vfiprintf_r+0x430>
    68e8:	910643fb 	add	x27, sp, #0x190
    68ec:	b94067e0 	ldr	w0, [sp, #100]
    68f0:	0b180000 	add	w0, w0, w24
    68f4:	b90067e0 	str	w0, [sp, #100]
    68f8:	34008ad6 	cbz	w22, 7a50 <_vfiprintf_r+0x1350>
    68fc:	394006e0 	ldrb	w0, [x23, #1]
    6900:	12800004 	mov	w4, #0xffffffff            	// #-1
    6904:	910006f4 	add	x20, x23, #0x1
    6908:	2a0403f6 	mov	w22, w4
    690c:	5280001c 	mov	w28, #0x0                   	// #0
    6910:	b90063ff 	str	wzr, [sp, #96]
    6914:	3903bfff 	strb	wzr, [sp, #239]
    6918:	91000694 	add	x20, x20, #0x1
    691c:	51008001 	sub	w1, w0, #0x20
    6920:	7101683f 	cmp	w1, #0x5a
    6924:	54000c49 	b.ls	6aac <_vfiprintf_r+0x3ac>  // b.plast
    6928:	34008940 	cbz	w0, 7a50 <_vfiprintf_r+0x1350>
    692c:	52800036 	mov	w22, #0x1                   	// #1
    6930:	9104a3fa 	add	x26, sp, #0x128
    6934:	2a1603f7 	mov	w23, w22
    6938:	3903bfff 	strb	wzr, [sp, #239]
    693c:	3904a3e0 	strb	w0, [sp, #296]
    6940:	52800004 	mov	w4, #0x0                   	// #0
    6944:	f9003bff 	str	xzr, [sp, #112]
    6948:	b9411be1 	ldr	w1, [sp, #280]
    694c:	11000ac0 	add	w0, w22, #0x2
    6950:	721f038a 	ands	w10, w28, #0x2
    6954:	52801098 	mov	w24, #0x84                  	// #132
    6958:	11000422 	add	w2, w1, #0x1
    695c:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    6960:	2a0203e8 	mov	w8, w2
    6964:	6a180398 	ands	w24, w28, w24
    6968:	f94093e0 	ldr	x0, [sp, #288]
    696c:	540000a1 	b.ne	6980 <_vfiprintf_r+0x280>  // b.any
    6970:	b94063e3 	ldr	w3, [sp, #96]
    6974:	4b160069 	sub	w9, w3, w22
    6978:	7100013f 	cmp	w9, #0x0
    697c:	5400496c 	b.gt	72a8 <_vfiprintf_r+0xba8>
    6980:	3943bfe2 	ldrb	w2, [sp, #239]
    6984:	340001a2 	cbz	w2, 69b8 <_vfiprintf_r+0x2b8>
    6988:	9103bfe1 	add	x1, sp, #0xef
    698c:	91000400 	add	x0, x0, #0x1
    6990:	f9000361 	str	x1, [x27]
    6994:	d2800021 	mov	x1, #0x1                   	// #1
    6998:	f9000761 	str	x1, [x27, #8]
    699c:	b9011be8 	str	w8, [sp, #280]
    69a0:	f90093e0 	str	x0, [sp, #288]
    69a4:	71001d1f 	cmp	w8, #0x7
    69a8:	540044cc 	b.gt	7240 <_vfiprintf_r+0xb40>
    69ac:	2a0803e1 	mov	w1, w8
    69b0:	9100437b 	add	x27, x27, #0x10
    69b4:	11000508 	add	w8, w8, #0x1
    69b8:	340002ca 	cbz	w10, 6a10 <_vfiprintf_r+0x310>
    69bc:	91000800 	add	x0, x0, #0x2
    69c0:	9103c3e2 	add	x2, sp, #0xf0
    69c4:	d2800041 	mov	x1, #0x2                   	// #2
    69c8:	a9000762 	stp	x2, x1, [x27]
    69cc:	b9011be8 	str	w8, [sp, #280]
    69d0:	f90093e0 	str	x0, [sp, #288]
    69d4:	71001d1f 	cmp	w8, #0x7
    69d8:	5400460d 	b.le	7298 <_vfiprintf_r+0xb98>
    69dc:	b4005b20 	cbz	x0, 7540 <_vfiprintf_r+0xe40>
    69e0:	910443e2 	add	x2, sp, #0x110
    69e4:	aa1903e1 	mov	x1, x25
    69e8:	aa1303e0 	mov	x0, x19
    69ec:	b90093e4 	str	w4, [sp, #144]
    69f0:	97ffff04 	bl	6600 <__sprint_r.part.0>
    69f4:	35000940 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    69f8:	b9411be1 	ldr	w1, [sp, #280]
    69fc:	910643fb 	add	x27, sp, #0x190
    6a00:	b94093e4 	ldr	w4, [sp, #144]
    6a04:	f94093e0 	ldr	x0, [sp, #288]
    6a08:	11000428 	add	w8, w1, #0x1
    6a0c:	d503201f 	nop
    6a10:	7102031f 	cmp	w24, #0x80
    6a14:	54002f80 	b.eq	7004 <_vfiprintf_r+0x904>  // b.none
    6a18:	4b170098 	sub	w24, w4, w23
    6a1c:	7100031f 	cmp	w24, #0x0
    6a20:	540038cc 	b.gt	7138 <_vfiprintf_r+0xa38>
    6a24:	93407ef7 	sxtw	x23, w23
    6a28:	a9005f7a 	stp	x26, x23, [x27]
    6a2c:	8b0002e0 	add	x0, x23, x0
    6a30:	b9011be8 	str	w8, [sp, #280]
    6a34:	f90093e0 	str	x0, [sp, #288]
    6a38:	71001d1f 	cmp	w8, #0x7
    6a3c:	540029ad 	b.le	6f70 <_vfiprintf_r+0x870>
    6a40:	b4004ba0 	cbz	x0, 73b4 <_vfiprintf_r+0xcb4>
    6a44:	910443e2 	add	x2, sp, #0x110
    6a48:	aa1903e1 	mov	x1, x25
    6a4c:	aa1303e0 	mov	x0, x19
    6a50:	97fffeec 	bl	6600 <__sprint_r.part.0>
    6a54:	35000640 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    6a58:	f94093e0 	ldr	x0, [sp, #288]
    6a5c:	910643e5 	add	x5, sp, #0x190
    6a60:	361000bc 	tbz	w28, #2, 6a74 <_vfiprintf_r+0x374>
    6a64:	b94063e1 	ldr	w1, [sp, #96]
    6a68:	4b160037 	sub	w23, w1, w22
    6a6c:	710002ff 	cmp	w23, #0x0
    6a70:	54004b0c 	b.gt	73d0 <_vfiprintf_r+0xcd0>
    6a74:	b94063e1 	ldr	w1, [sp, #96]
    6a78:	6b16003f 	cmp	w1, w22
    6a7c:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    6a80:	b94067e1 	ldr	w1, [sp, #100]
    6a84:	0b030021 	add	w1, w1, w3
    6a88:	b90067e1 	str	w1, [sp, #100]
    6a8c:	b5003c60 	cbnz	x0, 7218 <_vfiprintf_r+0xb18>
    6a90:	f9403be1 	ldr	x1, [sp, #112]
    6a94:	b9011bff 	str	wzr, [sp, #280]
    6a98:	910643fb 	add	x27, sp, #0x190
    6a9c:	b4ffea01 	cbz	x1, 67dc <_vfiprintf_r+0xdc>
    6aa0:	aa1303e0 	mov	x0, x19
    6aa4:	94000977 	bl	9080 <_free_r>
    6aa8:	17ffff4d 	b	67dc <_vfiprintf_r+0xdc>
    6aac:	f9403fe2 	ldr	x2, [sp, #120]
    6ab0:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    6ab4:	10000062 	adr	x2, 6ac0 <_vfiprintf_r+0x3c0>
    6ab8:	8b21a841 	add	x1, x2, w1, sxth #2
    6abc:	d61f0020 	br	x1
    6ac0:	5100c001 	sub	w1, w0, #0x30
    6ac4:	b90063ff 	str	wzr, [sp, #96]
    6ac8:	b94063e0 	ldr	w0, [sp, #96]
    6acc:	0b000802 	add	w2, w0, w0, lsl #2
    6ad0:	38401680 	ldrb	w0, [x20], #1
    6ad4:	0b020421 	add	w1, w1, w2, lsl #1
    6ad8:	b90063e1 	str	w1, [sp, #96]
    6adc:	5100c001 	sub	w1, w0, #0x30
    6ae0:	7100243f 	cmp	w1, #0x9
    6ae4:	54ffff29 	b.ls	6ac8 <_vfiprintf_r+0x3c8>  // b.plast
    6ae8:	17ffff8d 	b	691c <_vfiprintf_r+0x21c>
    6aec:	39400280 	ldrb	w0, [x20]
    6af0:	321c039c 	orr	w28, w28, #0x10
    6af4:	17ffff89 	b	6918 <_vfiprintf_r+0x218>
    6af8:	2a0003f6 	mov	w22, w0
    6afc:	cb1402e0 	sub	x0, x23, x20
    6b00:	2a0003f8 	mov	w24, w0
    6b04:	34ffefc0 	cbz	w0, 68fc <_vfiprintf_r+0x1fc>
    6b08:	17ffff68 	b	68a8 <_vfiprintf_r+0x1a8>
    6b0c:	9100437b 	add	x27, x27, #0x10
    6b10:	17ffff77 	b	68ec <_vfiprintf_r+0x1ec>
    6b14:	aa1903f3 	mov	x19, x25
    6b18:	aa1403f9 	mov	x25, x20
    6b1c:	f9403be0 	ldr	x0, [sp, #112]
    6b20:	b4000080 	cbz	x0, 6b30 <_vfiprintf_r+0x430>
    6b24:	f9403be1 	ldr	x1, [sp, #112]
    6b28:	aa1303e0 	mov	x0, x19
    6b2c:	94000955 	bl	9080 <_free_r>
    6b30:	79c02320 	ldrsh	w0, [x25, #16]
    6b34:	a94363f7 	ldp	x23, x24, [sp, #48]
    6b38:	a94573fb 	ldp	x27, x28, [sp, #80]
    6b3c:	373099c0 	tbnz	w0, #6, 7e74 <_vfiprintf_r+0x1774>
    6b40:	b94067e0 	ldr	w0, [sp, #100]
    6b44:	a9407bfd 	ldp	x29, x30, [sp]
    6b48:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b4c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6b50:	a9446bf9 	ldp	x25, x26, [sp, #64]
    6b54:	910843ff 	add	sp, sp, #0x210
    6b58:	d65f03c0 	ret
    6b5c:	aa1303e0 	mov	x0, x19
    6b60:	94000870 	bl	8d20 <__sinit>
    6b64:	17fffefe 	b	675c <_vfiprintf_r+0x5c>
    6b68:	b940b3e1 	ldr	w1, [sp, #176]
    6b6c:	2a1603e4 	mov	w4, w22
    6b70:	37f856c1 	tbnz	w1, #31, 7648 <_vfiprintf_r+0xf48>
    6b74:	f94037e1 	ldr	x1, [sp, #104]
    6b78:	91003c38 	add	x24, x1, #0xf
    6b7c:	927df318 	and	x24, x24, #0xfffffffffffffff8
    6b80:	f94037e1 	ldr	x1, [sp, #104]
    6b84:	3903bfff 	strb	wzr, [sp, #239]
    6b88:	f940003a 	ldr	x26, [x1]
    6b8c:	b400753a 	cbz	x26, 7a30 <_vfiprintf_r+0x1330>
    6b90:	71014c1f 	cmp	w0, #0x53
    6b94:	54006740 	b.eq	787c <_vfiprintf_r+0x117c>  // b.none
    6b98:	3720673c 	tbnz	w28, #4, 787c <_vfiprintf_r+0x117c>
    6b9c:	3100049f 	cmn	w4, #0x1
    6ba0:	54009520 	b.eq	7e44 <_vfiprintf_r+0x1744>  // b.none
    6ba4:	93407c82 	sxtw	x2, w4
    6ba8:	aa1a03e0 	mov	x0, x26
    6bac:	52800001 	mov	w1, #0x0                   	// #0
    6bb0:	b9006be4 	str	w4, [sp, #104]
    6bb4:	94001324 	bl	b844 <memchr>
    6bb8:	f9003be0 	str	x0, [sp, #112]
    6bbc:	b9406be4 	ldr	w4, [sp, #104]
    6bc0:	b40090a0 	cbz	x0, 7dd4 <_vfiprintf_r+0x16d4>
    6bc4:	cb1a0003 	sub	x3, x0, x26
    6bc8:	52800004 	mov	w4, #0x0                   	// #0
    6bcc:	7100007f 	cmp	w3, #0x0
    6bd0:	2a0303f7 	mov	w23, w3
    6bd4:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    6bd8:	a906fff8 	stp	x24, xzr, [sp, #104]
    6bdc:	14000060 	b	6d5c <_vfiprintf_r+0x65c>
    6be0:	71010c1f 	cmp	w0, #0x43
    6be4:	54000040 	b.eq	6bec <_vfiprintf_r+0x4ec>  // b.none
    6be8:	3620569c 	tbz	w28, #4, 76b8 <_vfiprintf_r+0xfb8>
    6bec:	910423e0 	add	x0, sp, #0x108
    6bf0:	d2800102 	mov	x2, #0x8                   	// #8
    6bf4:	52800001 	mov	w1, #0x0                   	// #0
    6bf8:	97fffcd2 	bl	5f40 <memset>
    6bfc:	b940b3e0 	ldr	w0, [sp, #176]
    6c00:	37f87a20 	tbnz	w0, #31, 7b44 <_vfiprintf_r+0x1444>
    6c04:	f94037e0 	ldr	x0, [sp, #104]
    6c08:	91002c01 	add	x1, x0, #0xb
    6c0c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6c10:	f90037e1 	str	x1, [sp, #104]
    6c14:	b9400002 	ldr	w2, [x0]
    6c18:	9104a3fa 	add	x26, sp, #0x128
    6c1c:	910423e3 	add	x3, sp, #0x108
    6c20:	aa1a03e1 	mov	x1, x26
    6c24:	aa1303e0 	mov	x0, x19
    6c28:	940005d2 	bl	8370 <_wcrtomb_r>
    6c2c:	2a0003f7 	mov	w23, w0
    6c30:	3100041f 	cmn	w0, #0x1
    6c34:	54009260 	b.eq	7e80 <_vfiprintf_r+0x1780>  // b.none
    6c38:	7100001f 	cmp	w0, #0x0
    6c3c:	3903bfff 	strb	wzr, [sp, #239]
    6c40:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    6c44:	17ffff3f 	b	6940 <_vfiprintf_r+0x240>
    6c48:	b94063e1 	ldr	w1, [sp, #96]
    6c4c:	f90037e0 	str	x0, [sp, #104]
    6c50:	4b0103e1 	neg	w1, w1
    6c54:	b90063e1 	str	w1, [sp, #96]
    6c58:	39400280 	ldrb	w0, [x20]
    6c5c:	321e039c 	orr	w28, w28, #0x4
    6c60:	17ffff2e 	b	6918 <_vfiprintf_r+0x218>
    6c64:	aa1403e2 	mov	x2, x20
    6c68:	38401440 	ldrb	w0, [x2], #1
    6c6c:	7100a81f 	cmp	w0, #0x2a
    6c70:	5400a6a0 	b.eq	8144 <_vfiprintf_r+0x1a44>  // b.none
    6c74:	5100c001 	sub	w1, w0, #0x30
    6c78:	aa0203f4 	mov	x20, x2
    6c7c:	52800016 	mov	w22, #0x0                   	// #0
    6c80:	7100243f 	cmp	w1, #0x9
    6c84:	54ffe4c8 	b.hi	691c <_vfiprintf_r+0x21c>  // b.pmore
    6c88:	38401680 	ldrb	w0, [x20], #1
    6c8c:	0b160ac4 	add	w4, w22, w22, lsl #2
    6c90:	0b040436 	add	w22, w1, w4, lsl #1
    6c94:	5100c001 	sub	w1, w0, #0x30
    6c98:	7100243f 	cmp	w1, #0x9
    6c9c:	54ffff69 	b.ls	6c88 <_vfiprintf_r+0x588>  // b.plast
    6ca0:	17ffff1f 	b	691c <_vfiprintf_r+0x21c>
    6ca4:	52800560 	mov	w0, #0x2b                  	// #43
    6ca8:	3903bfe0 	strb	w0, [sp, #239]
    6cac:	39400280 	ldrb	w0, [x20]
    6cb0:	17ffff1a 	b	6918 <_vfiprintf_r+0x218>
    6cb4:	b940b3e0 	ldr	w0, [sp, #176]
    6cb8:	37f84da0 	tbnz	w0, #31, 766c <_vfiprintf_r+0xf6c>
    6cbc:	f94037e0 	ldr	x0, [sp, #104]
    6cc0:	91002c00 	add	x0, x0, #0xb
    6cc4:	927df000 	and	x0, x0, #0xfffffffffffffff8
    6cc8:	f94037e1 	ldr	x1, [sp, #104]
    6ccc:	b9400021 	ldr	w1, [x1]
    6cd0:	b90063e1 	str	w1, [sp, #96]
    6cd4:	37fffba1 	tbnz	w1, #31, 6c48 <_vfiprintf_r+0x548>
    6cd8:	f90037e0 	str	x0, [sp, #104]
    6cdc:	39400280 	ldrb	w0, [x20]
    6ce0:	17ffff0e 	b	6918 <_vfiprintf_r+0x218>
    6ce4:	2a1603e4 	mov	w4, w22
    6ce8:	321c0396 	orr	w22, w28, #0x10
    6cec:	b940b3e0 	ldr	w0, [sp, #176]
    6cf0:	37280056 	tbnz	w22, #5, 6cf8 <_vfiprintf_r+0x5f8>
    6cf4:	36204876 	tbz	w22, #4, 7600 <_vfiprintf_r+0xf00>
    6cf8:	37f85a40 	tbnz	w0, #31, 7840 <_vfiprintf_r+0x1140>
    6cfc:	f94037e1 	ldr	x1, [sp, #104]
    6d00:	91003c20 	add	x0, x1, #0xf
    6d04:	927df000 	and	x0, x0, #0xfffffffffffffff8
    6d08:	f90037e0 	str	x0, [sp, #104]
    6d0c:	f9400021 	ldr	x1, [x1]
    6d10:	52800020 	mov	w0, #0x1                   	// #1
    6d14:	3903bfff 	strb	wzr, [sp, #239]
    6d18:	3100049f 	cmn	w4, #0x1
    6d1c:	54001320 	b.eq	6f80 <_vfiprintf_r+0x880>  // b.none
    6d20:	f100003f 	cmp	x1, #0x0
    6d24:	12187adc 	and	w28, w22, #0xffffff7f
    6d28:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    6d2c:	54001261 	b.ne	6f78 <_vfiprintf_r+0x878>  // b.any
    6d30:	35000660 	cbnz	w0, 6dfc <_vfiprintf_r+0x6fc>
    6d34:	120002d7 	and	w23, w22, #0x1
    6d38:	36003f56 	tbz	w22, #0, 7520 <_vfiprintf_r+0xe20>
    6d3c:	91062ffa 	add	x26, sp, #0x18b
    6d40:	52800600 	mov	w0, #0x30                  	// #48
    6d44:	52800004 	mov	w4, #0x0                   	// #0
    6d48:	39062fe0 	strb	w0, [sp, #395]
    6d4c:	d503201f 	nop
    6d50:	6b17009f 	cmp	w4, w23
    6d54:	f9003bff 	str	xzr, [sp, #112]
    6d58:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    6d5c:	3943bfe0 	ldrb	w0, [sp, #239]
    6d60:	7100001f 	cmp	w0, #0x0
    6d64:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    6d68:	17fffef8 	b	6948 <_vfiprintf_r+0x248>
    6d6c:	39400280 	ldrb	w0, [x20]
    6d70:	3219039c 	orr	w28, w28, #0x80
    6d74:	17fffee9 	b	6918 <_vfiprintf_r+0x218>
    6d78:	2a1603e4 	mov	w4, w22
    6d7c:	321c039c 	orr	w28, w28, #0x10
    6d80:	b940b3e0 	ldr	w0, [sp, #176]
    6d84:	3728005c 	tbnz	w28, #5, 6d8c <_vfiprintf_r+0x68c>
    6d88:	362042dc 	tbz	w28, #4, 75e0 <_vfiprintf_r+0xee0>
    6d8c:	37f85460 	tbnz	w0, #31, 7818 <_vfiprintf_r+0x1118>
    6d90:	f94037e0 	ldr	x0, [sp, #104]
    6d94:	91003c01 	add	x1, x0, #0xf
    6d98:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6d9c:	f90037e1 	str	x1, [sp, #104]
    6da0:	f9400001 	ldr	x1, [x0]
    6da4:	12157b96 	and	w22, w28, #0xfffffbff
    6da8:	52800000 	mov	w0, #0x0                   	// #0
    6dac:	17ffffda 	b	6d14 <_vfiprintf_r+0x614>
    6db0:	2a1603e4 	mov	w4, w22
    6db4:	321c039c 	orr	w28, w28, #0x10
    6db8:	b940b3e0 	ldr	w0, [sp, #176]
    6dbc:	3728005c 	tbnz	w28, #5, 6dc4 <_vfiprintf_r+0x6c4>
    6dc0:	36203ffc 	tbz	w28, #4, 75bc <_vfiprintf_r+0xebc>
    6dc4:	37f85160 	tbnz	w0, #31, 77f0 <_vfiprintf_r+0x10f0>
    6dc8:	f94037e0 	ldr	x0, [sp, #104]
    6dcc:	91003c01 	add	x1, x0, #0xf
    6dd0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6dd4:	f90037e1 	str	x1, [sp, #104]
    6dd8:	f9400000 	ldr	x0, [x0]
    6ddc:	aa0003e1 	mov	x1, x0
    6de0:	b7f83b80 	tbnz	x0, #63, 7550 <_vfiprintf_r+0xe50>
    6de4:	3100049f 	cmn	w4, #0x1
    6de8:	540036e0 	b.eq	74c4 <_vfiprintf_r+0xdc4>  // b.none
    6dec:	7100009f 	cmp	w4, #0x0
    6df0:	12187b9c 	and	w28, w28, #0xffffff7f
    6df4:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    6df8:	54003661 	b.ne	74c4 <_vfiprintf_r+0xdc4>  // b.any
    6dfc:	910633fa 	add	x26, sp, #0x18c
    6e00:	52800004 	mov	w4, #0x0                   	// #0
    6e04:	52800017 	mov	w23, #0x0                   	// #0
    6e08:	17ffffd2 	b	6d50 <_vfiprintf_r+0x650>
    6e0c:	aa1303e0 	mov	x0, x19
    6e10:	94000adc 	bl	9980 <_localeconv_r>
    6e14:	f9400400 	ldr	x0, [x0, #8]
    6e18:	f90053e0 	str	x0, [sp, #160]
    6e1c:	97fffd09 	bl	6240 <strlen>
    6e20:	aa0003e1 	mov	x1, x0
    6e24:	aa0103f7 	mov	x23, x1
    6e28:	aa1303e0 	mov	x0, x19
    6e2c:	f90057e1 	str	x1, [sp, #168]
    6e30:	94000ad4 	bl	9980 <_localeconv_r>
    6e34:	f9400800 	ldr	x0, [x0, #16]
    6e38:	f9004fe0 	str	x0, [sp, #152]
    6e3c:	f10002ff 	cmp	x23, #0x0
    6e40:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    6e44:	54003b80 	b.eq	75b4 <_vfiprintf_r+0xeb4>  // b.none
    6e48:	39400000 	ldrb	w0, [x0]
    6e4c:	32160381 	orr	w1, w28, #0x400
    6e50:	7100001f 	cmp	w0, #0x0
    6e54:	39400280 	ldrb	w0, [x20]
    6e58:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    6e5c:	17fffeaf 	b	6918 <_vfiprintf_r+0x218>
    6e60:	39400280 	ldrb	w0, [x20]
    6e64:	3200039c 	orr	w28, w28, #0x1
    6e68:	17fffeac 	b	6918 <_vfiprintf_r+0x218>
    6e6c:	3943bfe1 	ldrb	w1, [sp, #239]
    6e70:	39400280 	ldrb	w0, [x20]
    6e74:	35ffd521 	cbnz	w1, 6918 <_vfiprintf_r+0x218>
    6e78:	52800401 	mov	w1, #0x20                  	// #32
    6e7c:	3903bfe1 	strb	w1, [sp, #239]
    6e80:	17fffea6 	b	6918 <_vfiprintf_r+0x218>
    6e84:	b940b3e0 	ldr	w0, [sp, #176]
    6e88:	372801bc 	tbnz	w28, #5, 6ebc <_vfiprintf_r+0x7bc>
    6e8c:	3720019c 	tbnz	w28, #4, 6ebc <_vfiprintf_r+0x7bc>
    6e90:	37306cfc 	tbnz	w28, #6, 7c2c <_vfiprintf_r+0x152c>
    6e94:	364889bc 	tbz	w28, #9, 7fc8 <_vfiprintf_r+0x18c8>
    6e98:	37f89040 	tbnz	w0, #31, 80a0 <_vfiprintf_r+0x19a0>
    6e9c:	f94037e0 	ldr	x0, [sp, #104]
    6ea0:	91003c01 	add	x1, x0, #0xf
    6ea4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6ea8:	f90037e1 	str	x1, [sp, #104]
    6eac:	f9400000 	ldr	x0, [x0]
    6eb0:	394193e1 	ldrb	w1, [sp, #100]
    6eb4:	39000001 	strb	w1, [x0]
    6eb8:	17fffe49 	b	67dc <_vfiprintf_r+0xdc>
    6ebc:	37f84180 	tbnz	w0, #31, 76ec <_vfiprintf_r+0xfec>
    6ec0:	f94037e0 	ldr	x0, [sp, #104]
    6ec4:	91003c01 	add	x1, x0, #0xf
    6ec8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    6ecc:	f90037e1 	str	x1, [sp, #104]
    6ed0:	f9400000 	ldr	x0, [x0]
    6ed4:	b98067e1 	ldrsw	x1, [sp, #100]
    6ed8:	f9000001 	str	x1, [x0]
    6edc:	17fffe40 	b	67dc <_vfiprintf_r+0xdc>
    6ee0:	39400280 	ldrb	w0, [x20]
    6ee4:	7101b01f 	cmp	w0, #0x6c
    6ee8:	54005960 	b.eq	7a14 <_vfiprintf_r+0x1314>  // b.none
    6eec:	321c039c 	orr	w28, w28, #0x10
    6ef0:	17fffe8a 	b	6918 <_vfiprintf_r+0x218>
    6ef4:	39400280 	ldrb	w0, [x20]
    6ef8:	7101a01f 	cmp	w0, #0x68
    6efc:	54005840 	b.eq	7a04 <_vfiprintf_r+0x1304>  // b.none
    6f00:	321a039c 	orr	w28, w28, #0x40
    6f04:	17fffe85 	b	6918 <_vfiprintf_r+0x218>
    6f08:	39400280 	ldrb	w0, [x20]
    6f0c:	321b039c 	orr	w28, w28, #0x20
    6f10:	17fffe82 	b	6918 <_vfiprintf_r+0x218>
    6f14:	b940b3e0 	ldr	w0, [sp, #176]
    6f18:	2a1603e4 	mov	w4, w22
    6f1c:	37f83ba0 	tbnz	w0, #31, 7690 <_vfiprintf_r+0xf90>
    6f20:	f94037e2 	ldr	x2, [sp, #104]
    6f24:	91003c40 	add	x0, x2, #0xf
    6f28:	927df000 	and	x0, x0, #0xfffffffffffffff8
    6f2c:	f90037e0 	str	x0, [sp, #104]
    6f30:	528f0600 	mov	w0, #0x7830                	// #30768
    6f34:	90000041 	adrp	x1, e000 <__func__.0+0x280>
    6f38:	910e6021 	add	x1, x1, #0x398
    6f3c:	321f0396 	orr	w22, w28, #0x2
    6f40:	f90047e1 	str	x1, [sp, #136]
    6f44:	7901e3e0 	strh	w0, [sp, #240]
    6f48:	52800040 	mov	w0, #0x2                   	// #2
    6f4c:	f9400041 	ldr	x1, [x2]
    6f50:	17ffff71 	b	6d14 <_vfiprintf_r+0x614>
    6f54:	910643fb 	add	x27, sp, #0x190
    6f58:	93407ee0 	sxtw	x0, w23
    6f5c:	52800021 	mov	w1, #0x1                   	// #1
    6f60:	b9011be1 	str	w1, [sp, #280]
    6f64:	f90093e0 	str	x0, [sp, #288]
    6f68:	a91903fa 	stp	x26, x0, [sp, #400]
    6f6c:	d503201f 	nop
    6f70:	91004365 	add	x5, x27, #0x10
    6f74:	17fffebb 	b	6a60 <_vfiprintf_r+0x360>
    6f78:	2a1c03f6 	mov	w22, w28
    6f7c:	d503201f 	nop
    6f80:	7100041f 	cmp	w0, #0x1
    6f84:	54002a20 	b.eq	74c8 <_vfiprintf_r+0xdc8>  // b.none
    6f88:	910633f7 	add	x23, sp, #0x18c
    6f8c:	aa1703fa 	mov	x26, x23
    6f90:	7100081f 	cmp	w0, #0x2
    6f94:	54000161 	b.ne	6fc0 <_vfiprintf_r+0x8c0>  // b.any
    6f98:	f94047e2 	ldr	x2, [sp, #136]
    6f9c:	d503201f 	nop
    6fa0:	92400c20 	and	x0, x1, #0xf
    6fa4:	d344fc21 	lsr	x1, x1, #4
    6fa8:	38606840 	ldrb	w0, [x2, x0]
    6fac:	381fff40 	strb	w0, [x26, #-1]!
    6fb0:	b5ffff81 	cbnz	x1, 6fa0 <_vfiprintf_r+0x8a0>
    6fb4:	4b1a02f7 	sub	w23, w23, w26
    6fb8:	2a1603fc 	mov	w28, w22
    6fbc:	17ffff65 	b	6d50 <_vfiprintf_r+0x650>
    6fc0:	12000820 	and	w0, w1, #0x7
    6fc4:	aa1a03e2 	mov	x2, x26
    6fc8:	1100c000 	add	w0, w0, #0x30
    6fcc:	381fff40 	strb	w0, [x26, #-1]!
    6fd0:	d343fc21 	lsr	x1, x1, #3
    6fd4:	b5ffff61 	cbnz	x1, 6fc0 <_vfiprintf_r+0x8c0>
    6fd8:	7100c01f 	cmp	w0, #0x30
    6fdc:	1a9f07e0 	cset	w0, ne  // ne = any
    6fe0:	6a0002df 	tst	w22, w0
    6fe4:	54fffe80 	b.eq	6fb4 <_vfiprintf_r+0x8b4>  // b.none
    6fe8:	d1000842 	sub	x2, x2, #0x2
    6fec:	52800600 	mov	w0, #0x30                  	// #48
    6ff0:	2a1603fc 	mov	w28, w22
    6ff4:	4b0202f7 	sub	w23, w23, w2
    6ff8:	381ff340 	sturb	w0, [x26, #-1]
    6ffc:	aa0203fa 	mov	x26, x2
    7000:	17ffff54 	b	6d50 <_vfiprintf_r+0x650>
    7004:	b94063e2 	ldr	w2, [sp, #96]
    7008:	4b160058 	sub	w24, w2, w22
    700c:	7100031f 	cmp	w24, #0x0
    7010:	54ffd04d 	b.le	6a18 <_vfiprintf_r+0x318>
    7014:	7100431f 	cmp	w24, #0x10
    7018:	540073cd 	b.le	7e90 <_vfiprintf_r+0x1790>
    701c:	2a0103e3 	mov	w3, w1
    7020:	f0000029 	adrp	x9, e000 <__func__.0+0x280>
    7024:	aa1403e1 	mov	x1, x20
    7028:	91126129 	add	x9, x9, #0x498
    702c:	aa1303f4 	mov	x20, x19
    7030:	d2800208 	mov	x8, #0x10                  	// #16
    7034:	2a1803f3 	mov	w19, w24
    7038:	aa0103f8 	mov	x24, x1
    703c:	b90093e4 	str	w4, [sp, #144]
    7040:	b900b7f6 	str	w22, [sp, #180]
    7044:	aa1903f6 	mov	x22, x25
    7048:	aa0903f9 	mov	x25, x9
    704c:	14000007 	b	7068 <_vfiprintf_r+0x968>
    7050:	1100086a 	add	w10, w3, #0x2
    7054:	9100437b 	add	x27, x27, #0x10
    7058:	2a0203e3 	mov	w3, w2
    705c:	51004273 	sub	w19, w19, #0x10
    7060:	7100427f 	cmp	w19, #0x10
    7064:	540002cd 	b.le	70bc <_vfiprintf_r+0x9bc>
    7068:	91004000 	add	x0, x0, #0x10
    706c:	11000462 	add	w2, w3, #0x1
    7070:	a9002379 	stp	x25, x8, [x27]
    7074:	b9011be2 	str	w2, [sp, #280]
    7078:	f90093e0 	str	x0, [sp, #288]
    707c:	71001c5f 	cmp	w2, #0x7
    7080:	54fffe8d 	b.le	7050 <_vfiprintf_r+0x950>
    7084:	b4000d60 	cbz	x0, 7230 <_vfiprintf_r+0xb30>
    7088:	910443e2 	add	x2, sp, #0x110
    708c:	aa1603e1 	mov	x1, x22
    7090:	aa1403e0 	mov	x0, x20
    7094:	97fffd5b 	bl	6600 <__sprint_r.part.0>
    7098:	35004c60 	cbnz	w0, 7a24 <_vfiprintf_r+0x1324>
    709c:	b9411be3 	ldr	w3, [sp, #280]
    70a0:	51004273 	sub	w19, w19, #0x10
    70a4:	910643fb 	add	x27, sp, #0x190
    70a8:	d2800208 	mov	x8, #0x10                  	// #16
    70ac:	1100046a 	add	w10, w3, #0x1
    70b0:	f94093e0 	ldr	x0, [sp, #288]
    70b4:	7100427f 	cmp	w19, #0x10
    70b8:	54fffd8c 	b.gt	7068 <_vfiprintf_r+0x968>
    70bc:	aa1803e1 	mov	x1, x24
    70c0:	aa1903e9 	mov	x9, x25
    70c4:	b94093e4 	ldr	w4, [sp, #144]
    70c8:	aa1603f9 	mov	x25, x22
    70cc:	b940b7f6 	ldr	w22, [sp, #180]
    70d0:	2a1303f8 	mov	w24, w19
    70d4:	aa1403f3 	mov	x19, x20
    70d8:	aa0103f4 	mov	x20, x1
    70dc:	93407f01 	sxtw	x1, w24
    70e0:	a9000769 	stp	x9, x1, [x27]
    70e4:	8b010000 	add	x0, x0, x1
    70e8:	b9011bea 	str	w10, [sp, #280]
    70ec:	f90093e0 	str	x0, [sp, #288]
    70f0:	71001d5f 	cmp	w10, #0x7
    70f4:	5400258d 	b.le	75a4 <_vfiprintf_r+0xea4>
    70f8:	b4005920 	cbz	x0, 7c1c <_vfiprintf_r+0x151c>
    70fc:	910443e2 	add	x2, sp, #0x110
    7100:	aa1903e1 	mov	x1, x25
    7104:	aa1303e0 	mov	x0, x19
    7108:	b90093e4 	str	w4, [sp, #144]
    710c:	97fffd3d 	bl	6600 <__sprint_r.part.0>
    7110:	35ffd060 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    7114:	b94093e4 	ldr	w4, [sp, #144]
    7118:	910643fb 	add	x27, sp, #0x190
    711c:	b9411be1 	ldr	w1, [sp, #280]
    7120:	4b170098 	sub	w24, w4, w23
    7124:	11000428 	add	w8, w1, #0x1
    7128:	f94093e0 	ldr	x0, [sp, #288]
    712c:	7100031f 	cmp	w24, #0x0
    7130:	54ffc7ad 	b.le	6a24 <_vfiprintf_r+0x324>
    7134:	d503201f 	nop
    7138:	f0000029 	adrp	x9, e000 <__func__.0+0x280>
    713c:	91126129 	add	x9, x9, #0x498
    7140:	7100431f 	cmp	w24, #0x10
    7144:	540004ed 	b.le	71e0 <_vfiprintf_r+0xae0>
    7148:	2a0103e3 	mov	w3, w1
    714c:	d2800204 	mov	x4, #0x10                  	// #16
    7150:	f9004bf4 	str	x20, [sp, #144]
    7154:	aa1903f4 	mov	x20, x25
    7158:	aa1303f9 	mov	x25, x19
    715c:	aa0903f3 	mov	x19, x9
    7160:	14000007 	b	717c <_vfiprintf_r+0xa7c>
    7164:	11000868 	add	w8, w3, #0x2
    7168:	9100437b 	add	x27, x27, #0x10
    716c:	2a0203e3 	mov	w3, w2
    7170:	51004318 	sub	w24, w24, #0x10
    7174:	7100431f 	cmp	w24, #0x10
    7178:	540002cd 	b.le	71d0 <_vfiprintf_r+0xad0>
    717c:	91004000 	add	x0, x0, #0x10
    7180:	11000462 	add	w2, w3, #0x1
    7184:	a9001373 	stp	x19, x4, [x27]
    7188:	b9011be2 	str	w2, [sp, #280]
    718c:	f90093e0 	str	x0, [sp, #288]
    7190:	71001c5f 	cmp	w2, #0x7
    7194:	54fffe8d 	b.le	7164 <_vfiprintf_r+0xa64>
    7198:	b4000380 	cbz	x0, 7208 <_vfiprintf_r+0xb08>
    719c:	910443e2 	add	x2, sp, #0x110
    71a0:	aa1403e1 	mov	x1, x20
    71a4:	aa1903e0 	mov	x0, x25
    71a8:	97fffd16 	bl	6600 <__sprint_r.part.0>
    71ac:	35ffcb40 	cbnz	w0, 6b14 <_vfiprintf_r+0x414>
    71b0:	b9411be3 	ldr	w3, [sp, #280]
    71b4:	51004318 	sub	w24, w24, #0x10
    71b8:	910643fb 	add	x27, sp, #0x190
    71bc:	d2800204 	mov	x4, #0x10                  	// #16
    71c0:	11000468 	add	w8, w3, #0x1
    71c4:	f94093e0 	ldr	x0, [sp, #288]
    71c8:	7100431f 	cmp	w24, #0x10
    71cc:	54fffd8c 	b.gt	717c <_vfiprintf_r+0xa7c>
    71d0:	aa1303e9 	mov	x9, x19
    71d4:	aa1903f3 	mov	x19, x25
    71d8:	aa1403f9 	mov	x25, x20
    71dc:	f9404bf4 	ldr	x20, [sp, #144]
    71e0:	93407f18 	sxtw	x24, w24
    71e4:	8b180000 	add	x0, x0, x24
    71e8:	a9006369 	stp	x9, x24, [x27]
    71ec:	b9011be8 	str	w8, [sp, #280]
    71f0:	f90093e0 	str	x0, [sp, #288]
    71f4:	71001d1f 	cmp	w8, #0x7
    71f8:	5400178c 	b.gt	74e8 <_vfiprintf_r+0xde8>
    71fc:	9100437b 	add	x27, x27, #0x10
    7200:	11000508 	add	w8, w8, #0x1
    7204:	17fffe08 	b	6a24 <_vfiprintf_r+0x324>
    7208:	910643fb 	add	x27, sp, #0x190
    720c:	52800028 	mov	w8, #0x1                   	// #1
    7210:	52800003 	mov	w3, #0x0                   	// #0
    7214:	17ffffd7 	b	7170 <_vfiprintf_r+0xa70>
    7218:	910443e2 	add	x2, sp, #0x110
    721c:	aa1903e1 	mov	x1, x25
    7220:	aa1303e0 	mov	x0, x19
    7224:	97fffcf7 	bl	6600 <__sprint_r.part.0>
    7228:	34ffc340 	cbz	w0, 6a90 <_vfiprintf_r+0x390>
    722c:	17fffe3c 	b	6b1c <_vfiprintf_r+0x41c>
    7230:	910643fb 	add	x27, sp, #0x190
    7234:	5280002a 	mov	w10, #0x1                   	// #1
    7238:	52800003 	mov	w3, #0x0                   	// #0
    723c:	17ffff88 	b	705c <_vfiprintf_r+0x95c>
    7240:	b4001760 	cbz	x0, 752c <_vfiprintf_r+0xe2c>
    7244:	910443e2 	add	x2, sp, #0x110
    7248:	aa1903e1 	mov	x1, x25
    724c:	aa1303e0 	mov	x0, x19
    7250:	b90093ea 	str	w10, [sp, #144]
    7254:	b900b7e4 	str	w4, [sp, #180]
    7258:	97fffcea 	bl	6600 <__sprint_r.part.0>
    725c:	35ffc600 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    7260:	b9411be1 	ldr	w1, [sp, #280]
    7264:	910643fb 	add	x27, sp, #0x190
    7268:	b94093ea 	ldr	w10, [sp, #144]
    726c:	b940b7e4 	ldr	w4, [sp, #180]
    7270:	11000428 	add	w8, w1, #0x1
    7274:	f94093e0 	ldr	x0, [sp, #288]
    7278:	17fffdd0 	b	69b8 <_vfiprintf_r+0x2b8>
    727c:	9103c3e0 	add	x0, sp, #0xf0
    7280:	d2800041 	mov	x1, #0x2                   	// #2
    7284:	910643fb 	add	x27, sp, #0x190
    7288:	a91907e0 	stp	x0, x1, [sp, #400]
    728c:	aa0103e0 	mov	x0, x1
    7290:	52800028 	mov	w8, #0x1                   	// #1
    7294:	d503201f 	nop
    7298:	2a0803e1 	mov	w1, w8
    729c:	9100437b 	add	x27, x27, #0x10
    72a0:	11000428 	add	w8, w1, #0x1
    72a4:	17fffddb 	b	6a10 <_vfiprintf_r+0x310>
    72a8:	7100413f 	cmp	w9, #0x10
    72ac:	54005c4d 	b.le	7e34 <_vfiprintf_r+0x1734>
    72b0:	f0000028 	adrp	x8, e000 <__func__.0+0x280>
    72b4:	91122108 	add	x8, x8, #0x488
    72b8:	aa1b03e3 	mov	x3, x27
    72bc:	d280020c 	mov	x12, #0x10                  	// #16
    72c0:	2a1703fb 	mov	w27, w23
    72c4:	2a1603f7 	mov	w23, w22
    72c8:	aa0803f6 	mov	x22, x8
    72cc:	b90093ea 	str	w10, [sp, #144]
    72d0:	b900b7e4 	str	w4, [sp, #180]
    72d4:	2a0103e4 	mov	w4, w1
    72d8:	f9005ff4 	str	x20, [sp, #184]
    72dc:	aa1903f4 	mov	x20, x25
    72e0:	2a0903f9 	mov	w25, w9
    72e4:	14000008 	b	7304 <_vfiprintf_r+0xc04>
    72e8:	1100088b 	add	w11, w4, #0x2
    72ec:	91004063 	add	x3, x3, #0x10
    72f0:	2a0203e4 	mov	w4, w2
    72f4:	51004339 	sub	w25, w25, #0x10
    72f8:	7100433f 	cmp	w25, #0x10
    72fc:	540002cd 	b.le	7354 <_vfiprintf_r+0xc54>
    7300:	11000482 	add	w2, w4, #0x1
    7304:	91004000 	add	x0, x0, #0x10
    7308:	a9003076 	stp	x22, x12, [x3]
    730c:	b9011be2 	str	w2, [sp, #280]
    7310:	f90093e0 	str	x0, [sp, #288]
    7314:	71001c5f 	cmp	w2, #0x7
    7318:	54fffe8d 	b.le	72e8 <_vfiprintf_r+0xbe8>
    731c:	b4000440 	cbz	x0, 73a4 <_vfiprintf_r+0xca4>
    7320:	910443e2 	add	x2, sp, #0x110
    7324:	aa1403e1 	mov	x1, x20
    7328:	aa1303e0 	mov	x0, x19
    732c:	97fffcb5 	bl	6600 <__sprint_r.part.0>
    7330:	35ffbf40 	cbnz	w0, 6b18 <_vfiprintf_r+0x418>
    7334:	b9411be4 	ldr	w4, [sp, #280]
    7338:	51004339 	sub	w25, w25, #0x10
    733c:	910643e3 	add	x3, sp, #0x190
    7340:	d280020c 	mov	x12, #0x10                  	// #16
    7344:	1100048b 	add	w11, w4, #0x1
    7348:	f94093e0 	ldr	x0, [sp, #288]
    734c:	7100433f 	cmp	w25, #0x10
    7350:	54fffd8c 	b.gt	7300 <_vfiprintf_r+0xc00>
    7354:	2a1903e9 	mov	w9, w25
    7358:	b94093ea 	ldr	w10, [sp, #144]
    735c:	aa1403f9 	mov	x25, x20
    7360:	b940b7e4 	ldr	w4, [sp, #180]
    7364:	f9405ff4 	ldr	x20, [sp, #184]
    7368:	aa1603e8 	mov	x8, x22
    736c:	2a1703f6 	mov	w22, w23
    7370:	2a1b03f7 	mov	w23, w27
    7374:	aa0303fb 	mov	x27, x3
    7378:	93407d21 	sxtw	x1, w9
    737c:	a9000768 	stp	x8, x1, [x27]
    7380:	8b010000 	add	x0, x0, x1
    7384:	b9011beb 	str	w11, [sp, #280]
    7388:	f90093e0 	str	x0, [sp, #288]
    738c:	71001d7f 	cmp	w11, #0x7
    7390:	54000ecc 	b.gt	7568 <_vfiprintf_r+0xe68>
    7394:	9100437b 	add	x27, x27, #0x10
    7398:	11000568 	add	w8, w11, #0x1
    739c:	2a0b03e1 	mov	w1, w11
    73a0:	17fffd78 	b	6980 <_vfiprintf_r+0x280>
    73a4:	910643e3 	add	x3, sp, #0x190
    73a8:	52800004 	mov	w4, #0x0                   	// #0
    73ac:	5280002b 	mov	w11, #0x1                   	// #1
    73b0:	17ffffd1 	b	72f4 <_vfiprintf_r+0xbf4>
    73b4:	b9011bff 	str	wzr, [sp, #280]
    73b8:	3610079c 	tbz	w28, #2, 74a8 <_vfiprintf_r+0xda8>
    73bc:	b94063e1 	ldr	w1, [sp, #96]
    73c0:	4b160037 	sub	w23, w1, w22
    73c4:	710002ff 	cmp	w23, #0x0
    73c8:	5400070d 	b.le	74a8 <_vfiprintf_r+0xda8>
    73cc:	910643e5 	add	x5, sp, #0x190
    73d0:	b9411be2 	ldr	w2, [sp, #280]
    73d4:	710042ff 	cmp	w23, #0x10
    73d8:	5400546d 	b.le	7e64 <_vfiprintf_r+0x1764>
    73dc:	f0000028 	adrp	x8, e000 <__func__.0+0x280>
    73e0:	91122108 	add	x8, x8, #0x488
    73e4:	aa0803fa 	mov	x26, x8
    73e8:	d2800218 	mov	x24, #0x10                  	// #16
    73ec:	14000007 	b	7408 <_vfiprintf_r+0xd08>
    73f0:	11000844 	add	w4, w2, #0x2
    73f4:	910040a5 	add	x5, x5, #0x10
    73f8:	2a0303e2 	mov	w2, w3
    73fc:	510042f7 	sub	w23, w23, #0x10
    7400:	710042ff 	cmp	w23, #0x10
    7404:	540002ad 	b.le	7458 <_vfiprintf_r+0xd58>
    7408:	91004000 	add	x0, x0, #0x10
    740c:	11000443 	add	w3, w2, #0x1
    7410:	a90060ba 	stp	x26, x24, [x5]
    7414:	b9011be3 	str	w3, [sp, #280]
    7418:	f90093e0 	str	x0, [sp, #288]
    741c:	71001c7f 	cmp	w3, #0x7
    7420:	54fffe8d 	b.le	73f0 <_vfiprintf_r+0xcf0>
    7424:	b40003a0 	cbz	x0, 7498 <_vfiprintf_r+0xd98>
    7428:	910443e2 	add	x2, sp, #0x110
    742c:	aa1903e1 	mov	x1, x25
    7430:	aa1303e0 	mov	x0, x19
    7434:	97fffc73 	bl	6600 <__sprint_r.part.0>
    7438:	35ffb720 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    743c:	b9411be2 	ldr	w2, [sp, #280]
    7440:	510042f7 	sub	w23, w23, #0x10
    7444:	910643e5 	add	x5, sp, #0x190
    7448:	11000444 	add	w4, w2, #0x1
    744c:	f94093e0 	ldr	x0, [sp, #288]
    7450:	710042ff 	cmp	w23, #0x10
    7454:	54fffdac 	b.gt	7408 <_vfiprintf_r+0xd08>
    7458:	aa1a03e8 	mov	x8, x26
    745c:	93407ef7 	sxtw	x23, w23
    7460:	a9005ca8 	stp	x8, x23, [x5]
    7464:	8b170000 	add	x0, x0, x23
    7468:	b9011be4 	str	w4, [sp, #280]
    746c:	f90093e0 	str	x0, [sp, #288]
    7470:	71001c9f 	cmp	w4, #0x7
    7474:	54ffb00d 	b.le	6a74 <_vfiprintf_r+0x374>
    7478:	b4000180 	cbz	x0, 74a8 <_vfiprintf_r+0xda8>
    747c:	910443e2 	add	x2, sp, #0x110
    7480:	aa1903e1 	mov	x1, x25
    7484:	aa1303e0 	mov	x0, x19
    7488:	97fffc5e 	bl	6600 <__sprint_r.part.0>
    748c:	35ffb480 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    7490:	f94093e0 	ldr	x0, [sp, #288]
    7494:	17fffd78 	b	6a74 <_vfiprintf_r+0x374>
    7498:	910643e5 	add	x5, sp, #0x190
    749c:	52800024 	mov	w4, #0x1                   	// #1
    74a0:	52800002 	mov	w2, #0x0                   	// #0
    74a4:	17ffffd6 	b	73fc <_vfiprintf_r+0xcfc>
    74a8:	b94063e0 	ldr	w0, [sp, #96]
    74ac:	6b16001f 	cmp	w0, w22
    74b0:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    74b4:	b94067e0 	ldr	w0, [sp, #100]
    74b8:	0b030000 	add	w0, w0, w3
    74bc:	b90067e0 	str	w0, [sp, #100]
    74c0:	17fffd74 	b	6a90 <_vfiprintf_r+0x390>
    74c4:	2a1c03f6 	mov	w22, w28
    74c8:	f100243f 	cmp	x1, #0x9
    74cc:	540024c8 	b.hi	7964 <_vfiprintf_r+0x1264>  // b.pmore
    74d0:	1100c021 	add	w1, w1, #0x30
    74d4:	2a1603fc 	mov	w28, w22
    74d8:	91062ffa 	add	x26, sp, #0x18b
    74dc:	52800037 	mov	w23, #0x1                   	// #1
    74e0:	39062fe1 	strb	w1, [sp, #395]
    74e4:	17fffe1b 	b	6d50 <_vfiprintf_r+0x650>
    74e8:	b4ffd360 	cbz	x0, 6f54 <_vfiprintf_r+0x854>
    74ec:	910443e2 	add	x2, sp, #0x110
    74f0:	aa1903e1 	mov	x1, x25
    74f4:	aa1303e0 	mov	x0, x19
    74f8:	97fffc42 	bl	6600 <__sprint_r.part.0>
    74fc:	35ffb100 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    7500:	b9411be8 	ldr	w8, [sp, #280]
    7504:	910643fb 	add	x27, sp, #0x190
    7508:	f94093e0 	ldr	x0, [sp, #288]
    750c:	11000508 	add	w8, w8, #0x1
    7510:	17fffd45 	b	6a24 <_vfiprintf_r+0x324>
    7514:	910643fb 	add	x27, sp, #0x190
    7518:	b9011bff 	str	wzr, [sp, #280]
    751c:	17fffcf4 	b	68ec <_vfiprintf_r+0x1ec>
    7520:	910633fa 	add	x26, sp, #0x18c
    7524:	52800004 	mov	w4, #0x0                   	// #0
    7528:	17fffe0a 	b	6d50 <_vfiprintf_r+0x650>
    752c:	350007ca 	cbnz	w10, 7624 <_vfiprintf_r+0xf24>
    7530:	910643fb 	add	x27, sp, #0x190
    7534:	52800001 	mov	w1, #0x0                   	// #0
    7538:	52800028 	mov	w8, #0x1                   	// #1
    753c:	17fffd35 	b	6a10 <_vfiprintf_r+0x310>
    7540:	910643fb 	add	x27, sp, #0x190
    7544:	52800028 	mov	w8, #0x1                   	// #1
    7548:	52800001 	mov	w1, #0x0                   	// #0
    754c:	17fffd31 	b	6a10 <_vfiprintf_r+0x310>
    7550:	528005a0 	mov	w0, #0x2d                  	// #45
    7554:	cb0103e1 	neg	x1, x1
    7558:	2a1c03f6 	mov	w22, w28
    755c:	3903bfe0 	strb	w0, [sp, #239]
    7560:	52800020 	mov	w0, #0x1                   	// #1
    7564:	17fffded 	b	6d18 <_vfiprintf_r+0x618>
    7568:	b4000d60 	cbz	x0, 7714 <_vfiprintf_r+0x1014>
    756c:	910443e2 	add	x2, sp, #0x110
    7570:	aa1903e1 	mov	x1, x25
    7574:	aa1303e0 	mov	x0, x19
    7578:	b90093ea 	str	w10, [sp, #144]
    757c:	b900b7e4 	str	w4, [sp, #180]
    7580:	97fffc20 	bl	6600 <__sprint_r.part.0>
    7584:	35ffacc0 	cbnz	w0, 6b1c <_vfiprintf_r+0x41c>
    7588:	b9411be1 	ldr	w1, [sp, #280]
    758c:	910643fb 	add	x27, sp, #0x190
    7590:	b94093ea 	ldr	w10, [sp, #144]
    7594:	b940b7e4 	ldr	w4, [sp, #180]
    7598:	11000428 	add	w8, w1, #0x1
    759c:	f94093e0 	ldr	x0, [sp, #288]
    75a0:	17fffcf8 	b	6980 <_vfiprintf_r+0x280>
    75a4:	9100437b 	add	x27, x27, #0x10
    75a8:	11000548 	add	w8, w10, #0x1
    75ac:	2a0a03e1 	mov	w1, w10
    75b0:	17fffd1a 	b	6a18 <_vfiprintf_r+0x318>
    75b4:	39400280 	ldrb	w0, [x20]
    75b8:	17fffcd8 	b	6918 <_vfiprintf_r+0x218>
    75bc:	36302a9c 	tbz	w28, #6, 7b0c <_vfiprintf_r+0x140c>
    75c0:	37f83d20 	tbnz	w0, #31, 7d64 <_vfiprintf_r+0x1664>
    75c4:	f94037e0 	ldr	x0, [sp, #104]
    75c8:	91002c01 	add	x1, x0, #0xb
    75cc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    75d0:	f90037e1 	str	x1, [sp, #104]
    75d4:	79800001 	ldrsh	x1, [x0]
    75d8:	aa0103e0 	mov	x0, x1
    75dc:	17fffe01 	b	6de0 <_vfiprintf_r+0x6e0>
    75e0:	3630247c 	tbz	w28, #6, 7a6c <_vfiprintf_r+0x136c>
    75e4:	37f83960 	tbnz	w0, #31, 7d10 <_vfiprintf_r+0x1610>
    75e8:	f94037e0 	ldr	x0, [sp, #104]
    75ec:	91002c01 	add	x1, x0, #0xb
    75f0:	927df021 	and	x1, x1, #0xfffffffffffffff8
    75f4:	f90037e1 	str	x1, [sp, #104]
    75f8:	79400001 	ldrh	w1, [x0]
    75fc:	17fffdea 	b	6da4 <_vfiprintf_r+0x6a4>
    7600:	36302476 	tbz	w22, #6, 7a8c <_vfiprintf_r+0x138c>
    7604:	37f839c0 	tbnz	w0, #31, 7d3c <_vfiprintf_r+0x163c>
    7608:	f94037e0 	ldr	x0, [sp, #104]
    760c:	91002c01 	add	x1, x0, #0xb
    7610:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7614:	f90037e1 	str	x1, [sp, #104]
    7618:	79400001 	ldrh	w1, [x0]
    761c:	52800020 	mov	w0, #0x1                   	// #1
    7620:	17fffdbd 	b	6d14 <_vfiprintf_r+0x614>
    7624:	9103c3e0 	add	x0, sp, #0xf0
    7628:	d2800042 	mov	x2, #0x2                   	// #2
    762c:	910643fb 	add	x27, sp, #0x190
    7630:	52800021 	mov	w1, #0x1                   	// #1
    7634:	a9190be0 	stp	x0, x2, [sp, #400]
    7638:	aa0203e0 	mov	x0, x2
    763c:	17ffff18 	b	729c <_vfiprintf_r+0xb9c>
    7640:	2a1603e4 	mov	w4, w22
    7644:	17fffddd 	b	6db8 <_vfiprintf_r+0x6b8>
    7648:	b940b3e1 	ldr	w1, [sp, #176]
    764c:	11002021 	add	w1, w1, #0x8
    7650:	7100003f 	cmp	w1, #0x0
    7654:	54002d6d 	b.le	7c00 <_vfiprintf_r+0x1500>
    7658:	f94037e2 	ldr	x2, [sp, #104]
    765c:	b900b3e1 	str	w1, [sp, #176]
    7660:	91003c58 	add	x24, x2, #0xf
    7664:	927df318 	and	x24, x24, #0xfffffffffffffff8
    7668:	17fffd46 	b	6b80 <_vfiprintf_r+0x480>
    766c:	b940b3e0 	ldr	w0, [sp, #176]
    7670:	11002001 	add	w1, w0, #0x8
    7674:	7100003f 	cmp	w1, #0x0
    7678:	54002a2d 	b.le	7bbc <_vfiprintf_r+0x14bc>
    767c:	f94037e0 	ldr	x0, [sp, #104]
    7680:	b900b3e1 	str	w1, [sp, #176]
    7684:	91002c00 	add	x0, x0, #0xb
    7688:	927df000 	and	x0, x0, #0xfffffffffffffff8
    768c:	17fffd8f 	b	6cc8 <_vfiprintf_r+0x5c8>
    7690:	b940b3e0 	ldr	w0, [sp, #176]
    7694:	11002000 	add	w0, w0, #0x8
    7698:	7100001f 	cmp	w0, #0x0
    769c:	5400286d 	b.le	7ba8 <_vfiprintf_r+0x14a8>
    76a0:	f94037e2 	ldr	x2, [sp, #104]
    76a4:	b900b3e0 	str	w0, [sp, #176]
    76a8:	91003c41 	add	x1, x2, #0xf
    76ac:	927df020 	and	x0, x1, #0xfffffffffffffff8
    76b0:	f90037e0 	str	x0, [sp, #104]
    76b4:	17fffe1f 	b	6f30 <_vfiprintf_r+0x830>
    76b8:	b940b3e0 	ldr	w0, [sp, #176]
    76bc:	37f828e0 	tbnz	w0, #31, 7bd8 <_vfiprintf_r+0x14d8>
    76c0:	f94037e0 	ldr	x0, [sp, #104]
    76c4:	91002c01 	add	x1, x0, #0xb
    76c8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    76cc:	f90037e1 	str	x1, [sp, #104]
    76d0:	b9400000 	ldr	w0, [x0]
    76d4:	52800036 	mov	w22, #0x1                   	// #1
    76d8:	9104a3fa 	add	x26, sp, #0x128
    76dc:	2a1603f7 	mov	w23, w22
    76e0:	3903bfff 	strb	wzr, [sp, #239]
    76e4:	3904a3e0 	strb	w0, [sp, #296]
    76e8:	17fffc96 	b	6940 <_vfiprintf_r+0x240>
    76ec:	b940b3e0 	ldr	w0, [sp, #176]
    76f0:	11002001 	add	w1, w0, #0x8
    76f4:	7100003f 	cmp	w1, #0x0
    76f8:	5400394d 	b.le	7e20 <_vfiprintf_r+0x1720>
    76fc:	f94037e0 	ldr	x0, [sp, #104]
    7700:	b900b3e1 	str	w1, [sp, #176]
    7704:	91003c02 	add	x2, x0, #0xf
    7708:	927df041 	and	x1, x2, #0xfffffffffffffff8
    770c:	f90037e1 	str	x1, [sp, #104]
    7710:	17fffdf0 	b	6ed0 <_vfiprintf_r+0x7d0>
    7714:	3943bfe1 	ldrb	w1, [sp, #239]
    7718:	35002d81 	cbnz	w1, 7cc8 <_vfiprintf_r+0x15c8>
    771c:	35ffdb0a 	cbnz	w10, 727c <_vfiprintf_r+0xb7c>
    7720:	910643fb 	add	x27, sp, #0x190
    7724:	52800001 	mov	w1, #0x0                   	// #0
    7728:	52800028 	mov	w8, #0x1                   	// #1
    772c:	17fffcbb 	b	6a18 <_vfiprintf_r+0x318>
    7730:	2a1603e4 	mov	w4, w22
    7734:	2a1c03f6 	mov	w22, w28
    7738:	17fffd6d 	b	6cec <_vfiprintf_r+0x5ec>
    773c:	2a1603e4 	mov	w4, w22
    7740:	f0000021 	adrp	x1, e000 <__func__.0+0x280>
    7744:	910e6021 	add	x1, x1, #0x398
    7748:	f90047e1 	str	x1, [sp, #136]
    774c:	b940b3e1 	ldr	w1, [sp, #176]
    7750:	3728023c 	tbnz	w28, #5, 7794 <_vfiprintf_r+0x1094>
    7754:	3720021c 	tbnz	w28, #4, 7794 <_vfiprintf_r+0x1094>
    7758:	36301b7c 	tbz	w28, #6, 7ac4 <_vfiprintf_r+0x13c4>
    775c:	37f82c41 	tbnz	w1, #31, 7ce4 <_vfiprintf_r+0x15e4>
    7760:	f94037e1 	ldr	x1, [sp, #104]
    7764:	91002c22 	add	x2, x1, #0xb
    7768:	927df042 	and	x2, x2, #0xfffffffffffffff8
    776c:	79400021 	ldrh	w1, [x1]
    7770:	f90037e2 	str	x2, [sp, #104]
    7774:	1400000e 	b	77ac <_vfiprintf_r+0x10ac>
    7778:	f0000021 	adrp	x1, e000 <__func__.0+0x280>
    777c:	2a1603e4 	mov	w4, w22
    7780:	910ec021 	add	x1, x1, #0x3b0
    7784:	f90047e1 	str	x1, [sp, #136]
    7788:	17fffff1 	b	774c <_vfiprintf_r+0x104c>
    778c:	2a1603e4 	mov	w4, w22
    7790:	17fffd7c 	b	6d80 <_vfiprintf_r+0x680>
    7794:	37f801a1 	tbnz	w1, #31, 77c8 <_vfiprintf_r+0x10c8>
    7798:	f94037e1 	ldr	x1, [sp, #104]
    779c:	91003c22 	add	x2, x1, #0xf
    77a0:	927df042 	and	x2, x2, #0xfffffffffffffff8
    77a4:	f90037e2 	str	x2, [sp, #104]
    77a8:	f9400021 	ldr	x1, [x1]
    77ac:	f100003f 	cmp	x1, #0x0
    77b0:	1a9f07e2 	cset	w2, ne  // ne = any
    77b4:	6a02039f 	tst	w28, w2
    77b8:	54000581 	b.ne	7868 <_vfiprintf_r+0x1168>  // b.any
    77bc:	12157b96 	and	w22, w28, #0xfffffbff
    77c0:	52800040 	mov	w0, #0x2                   	// #2
    77c4:	17fffd54 	b	6d14 <_vfiprintf_r+0x614>
    77c8:	b940b3e1 	ldr	w1, [sp, #176]
    77cc:	11002022 	add	w2, w1, #0x8
    77d0:	7100005f 	cmp	w2, #0x0
    77d4:	540016ed 	b.le	7ab0 <_vfiprintf_r+0x13b0>
    77d8:	f94037e1 	ldr	x1, [sp, #104]
    77dc:	b900b3e2 	str	w2, [sp, #176]
    77e0:	91003c23 	add	x3, x1, #0xf
    77e4:	927df062 	and	x2, x3, #0xfffffffffffffff8
    77e8:	f90037e2 	str	x2, [sp, #104]
    77ec:	17ffffef 	b	77a8 <_vfiprintf_r+0x10a8>
    77f0:	b940b3e0 	ldr	w0, [sp, #176]
    77f4:	11002001 	add	w1, w0, #0x8
    77f8:	7100003f 	cmp	w1, #0x0
    77fc:	540017ed 	b.le	7af8 <_vfiprintf_r+0x13f8>
    7800:	f94037e0 	ldr	x0, [sp, #104]
    7804:	b900b3e1 	str	w1, [sp, #176]
    7808:	91003c02 	add	x2, x0, #0xf
    780c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7810:	f90037e1 	str	x1, [sp, #104]
    7814:	17fffd71 	b	6dd8 <_vfiprintf_r+0x6d8>
    7818:	b940b3e0 	ldr	w0, [sp, #176]
    781c:	11002001 	add	w1, w0, #0x8
    7820:	7100003f 	cmp	w1, #0x0
    7824:	5400186d 	b.le	7b30 <_vfiprintf_r+0x1430>
    7828:	f94037e0 	ldr	x0, [sp, #104]
    782c:	b900b3e1 	str	w1, [sp, #176]
    7830:	91003c02 	add	x2, x0, #0xf
    7834:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7838:	f90037e1 	str	x1, [sp, #104]
    783c:	17fffd59 	b	6da0 <_vfiprintf_r+0x6a0>
    7840:	b940b3e0 	ldr	w0, [sp, #176]
    7844:	11002000 	add	w0, w0, #0x8
    7848:	7100001f 	cmp	w0, #0x0
    784c:	540014cd 	b.le	7ae4 <_vfiprintf_r+0x13e4>
    7850:	f94037e1 	ldr	x1, [sp, #104]
    7854:	b900b3e0 	str	w0, [sp, #176]
    7858:	91003c22 	add	x2, x1, #0xf
    785c:	927df040 	and	x0, x2, #0xfffffffffffffff8
    7860:	f90037e0 	str	x0, [sp, #104]
    7864:	17fffd2a 	b	6d0c <_vfiprintf_r+0x60c>
    7868:	321f039c 	orr	w28, w28, #0x2
    786c:	3903c7e0 	strb	w0, [sp, #241]
    7870:	52800600 	mov	w0, #0x30                  	// #48
    7874:	3903c3e0 	strb	w0, [sp, #240]
    7878:	17ffffd1 	b	77bc <_vfiprintf_r+0x10bc>
    787c:	910403e0 	add	x0, sp, #0x100
    7880:	d2800102 	mov	x2, #0x8                   	// #8
    7884:	52800001 	mov	w1, #0x0                   	// #0
    7888:	b9006be4 	str	w4, [sp, #104]
    788c:	f90087fa 	str	x26, [sp, #264]
    7890:	97fff9ac 	bl	5f40 <memset>
    7894:	b9406be4 	ldr	w4, [sp, #104]
    7898:	3100049f 	cmn	w4, #0x1
    789c:	54001680 	b.eq	7b6c <_vfiprintf_r+0x146c>  // b.none
    78a0:	d2800016 	mov	x22, #0x0                   	// #0
    78a4:	52800017 	mov	w23, #0x0                   	// #0
    78a8:	aa1603e0 	mov	x0, x22
    78ac:	2a1703f6 	mov	w22, w23
    78b0:	aa0003f7 	mov	x23, x0
    78b4:	f90037f4 	str	x20, [sp, #104]
    78b8:	2a0403f4 	mov	w20, w4
    78bc:	1400000d 	b	78f0 <_vfiprintf_r+0x11f0>
    78c0:	910403e3 	add	x3, sp, #0x100
    78c4:	9104a3e1 	add	x1, sp, #0x128
    78c8:	aa1303e0 	mov	x0, x19
    78cc:	940002a9 	bl	8370 <_wcrtomb_r>
    78d0:	3100041f 	cmn	w0, #0x1
    78d4:	54002d60 	b.eq	7e80 <_vfiprintf_r+0x1780>  // b.none
    78d8:	0b0002c0 	add	w0, w22, w0
    78dc:	6b14001f 	cmp	w0, w20
    78e0:	540000ec 	b.gt	78fc <_vfiprintf_r+0x11fc>
    78e4:	910012f7 	add	x23, x23, #0x4
    78e8:	54003820 	b.eq	7fec <_vfiprintf_r+0x18ec>  // b.none
    78ec:	2a0003f6 	mov	w22, w0
    78f0:	f94087e0 	ldr	x0, [sp, #264]
    78f4:	b8776802 	ldr	w2, [x0, x23]
    78f8:	35fffe42 	cbnz	w2, 78c0 <_vfiprintf_r+0x11c0>
    78fc:	f94037f4 	ldr	x20, [sp, #104]
    7900:	2a1603f7 	mov	w23, w22
    7904:	340014b7 	cbz	w23, 7b98 <_vfiprintf_r+0x1498>
    7908:	71018eff 	cmp	w23, #0x63
    790c:	540024ac 	b.gt	7da0 <_vfiprintf_r+0x16a0>
    7910:	9104a3fa 	add	x26, sp, #0x128
    7914:	f9003bff 	str	xzr, [sp, #112]
    7918:	93407ef6 	sxtw	x22, w23
    791c:	d2800102 	mov	x2, #0x8                   	// #8
    7920:	52800001 	mov	w1, #0x0                   	// #0
    7924:	910403e0 	add	x0, sp, #0x100
    7928:	97fff986 	bl	5f40 <memset>
    792c:	910403e4 	add	x4, sp, #0x100
    7930:	aa1603e3 	mov	x3, x22
    7934:	910423e2 	add	x2, sp, #0x108
    7938:	aa1a03e1 	mov	x1, x26
    793c:	aa1303e0 	mov	x0, x19
    7940:	940002d8 	bl	84a0 <_wcsrtombs_r>
    7944:	eb0002df 	cmp	x22, x0
    7948:	54004761 	b.ne	8234 <_vfiprintf_r+0x1b34>  // b.any
    794c:	710002ff 	cmp	w23, #0x0
    7950:	52800004 	mov	w4, #0x0                   	// #0
    7954:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    7958:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    795c:	f90037f8 	str	x24, [sp, #104]
    7960:	17fffcff 	b	6d5c <_vfiprintf_r+0x65c>
    7964:	910633f7 	add	x23, sp, #0x18c
    7968:	121602c6 	and	w6, w22, #0x400
    796c:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    7970:	aa1703e2 	mov	x2, x23
    7974:	aa1403e3 	mov	x3, x20
    7978:	aa1703e5 	mov	x5, x23
    797c:	52800008 	mov	w8, #0x0                   	// #0
    7980:	aa1303f7 	mov	x23, x19
    7984:	f29999bc 	movk	x28, #0xcccd
    7988:	2a0603f3 	mov	w19, w6
    798c:	f9404ff4 	ldr	x20, [sp, #152]
    7990:	14000007 	b	79ac <_vfiprintf_r+0x12ac>
    7994:	9bdc7c38 	umulh	x24, x1, x28
    7998:	d343ff18 	lsr	x24, x24, #3
    799c:	f100243f 	cmp	x1, #0x9
    79a0:	54000249 	b.ls	79e8 <_vfiprintf_r+0x12e8>  // b.plast
    79a4:	aa1803e1 	mov	x1, x24
    79a8:	aa1a03e2 	mov	x2, x26
    79ac:	9bdc7c38 	umulh	x24, x1, x28
    79b0:	11000508 	add	w8, w8, #0x1
    79b4:	d100045a 	sub	x26, x2, #0x1
    79b8:	d343ff18 	lsr	x24, x24, #3
    79bc:	8b180b00 	add	x0, x24, x24, lsl #2
    79c0:	cb000420 	sub	x0, x1, x0, lsl #1
    79c4:	1100c000 	add	w0, w0, #0x30
    79c8:	381ff040 	sturb	w0, [x2, #-1]
    79cc:	34fffe53 	cbz	w19, 7994 <_vfiprintf_r+0x1294>
    79d0:	39400280 	ldrb	w0, [x20]
    79d4:	7103fc1f 	cmp	w0, #0xff
    79d8:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    79dc:	54fffdc1 	b.ne	7994 <_vfiprintf_r+0x1294>  // b.any
    79e0:	f100243f 	cmp	x1, #0x9
    79e4:	54002028 	b.hi	7de8 <_vfiprintf_r+0x16e8>  // b.pmore
    79e8:	aa1703f3 	mov	x19, x23
    79ec:	aa0503f7 	mov	x23, x5
    79f0:	4b1a02f7 	sub	w23, w23, w26
    79f4:	2a1603fc 	mov	w28, w22
    79f8:	f9004ff4 	str	x20, [sp, #152]
    79fc:	aa0303f4 	mov	x20, x3
    7a00:	17fffcd4 	b	6d50 <_vfiprintf_r+0x650>
    7a04:	39400680 	ldrb	w0, [x20, #1]
    7a08:	3217039c 	orr	w28, w28, #0x200
    7a0c:	91000694 	add	x20, x20, #0x1
    7a10:	17fffbc2 	b	6918 <_vfiprintf_r+0x218>
    7a14:	39400680 	ldrb	w0, [x20, #1]
    7a18:	321b039c 	orr	w28, w28, #0x20
    7a1c:	91000694 	add	x20, x20, #0x1
    7a20:	17fffbbe 	b	6918 <_vfiprintf_r+0x218>
    7a24:	aa1403f3 	mov	x19, x20
    7a28:	aa1603f9 	mov	x25, x22
    7a2c:	17fffc3c 	b	6b1c <_vfiprintf_r+0x41c>
    7a30:	7100189f 	cmp	w4, #0x6
    7a34:	528000d7 	mov	w23, #0x6                   	// #6
    7a38:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    7a3c:	f0000027 	adrp	x7, e000 <__func__.0+0x280>
    7a40:	2a1703f6 	mov	w22, w23
    7a44:	910f20fa 	add	x26, x7, #0x3c8
    7a48:	f90037f8 	str	x24, [sp, #104]
    7a4c:	17fffbbd 	b	6940 <_vfiprintf_r+0x240>
    7a50:	f94093e0 	ldr	x0, [sp, #288]
    7a54:	b4ff86e0 	cbz	x0, 6b30 <_vfiprintf_r+0x430>
    7a58:	aa1303e0 	mov	x0, x19
    7a5c:	910443e2 	add	x2, sp, #0x110
    7a60:	aa1903e1 	mov	x1, x25
    7a64:	97fffae7 	bl	6600 <__sprint_r.part.0>
    7a68:	17fffc32 	b	6b30 <_vfiprintf_r+0x430>
    7a6c:	3648101c 	tbz	w28, #9, 7c6c <_vfiprintf_r+0x156c>
    7a70:	37f822e0 	tbnz	w0, #31, 7ecc <_vfiprintf_r+0x17cc>
    7a74:	f94037e0 	ldr	x0, [sp, #104]
    7a78:	91002c01 	add	x1, x0, #0xb
    7a7c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7a80:	f90037e1 	str	x1, [sp, #104]
    7a84:	39400001 	ldrb	w1, [x0]
    7a88:	17fffcc7 	b	6da4 <_vfiprintf_r+0x6a4>
    7a8c:	364810f6 	tbz	w22, #9, 7ca8 <_vfiprintf_r+0x15a8>
    7a90:	37f82880 	tbnz	w0, #31, 7fa0 <_vfiprintf_r+0x18a0>
    7a94:	f94037e0 	ldr	x0, [sp, #104]
    7a98:	91002c01 	add	x1, x0, #0xb
    7a9c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7aa0:	f90037e1 	str	x1, [sp, #104]
    7aa4:	39400001 	ldrb	w1, [x0]
    7aa8:	52800020 	mov	w0, #0x1                   	// #1
    7aac:	17fffc9a 	b	6d14 <_vfiprintf_r+0x614>
    7ab0:	f94043e3 	ldr	x3, [sp, #128]
    7ab4:	b940b3e1 	ldr	w1, [sp, #176]
    7ab8:	b900b3e2 	str	w2, [sp, #176]
    7abc:	8b21c061 	add	x1, x3, w1, sxtw
    7ac0:	17ffff3a 	b	77a8 <_vfiprintf_r+0x10a8>
    7ac4:	36480c7c 	tbz	w28, #9, 7c50 <_vfiprintf_r+0x1550>
    7ac8:	37f82421 	tbnz	w1, #31, 7f4c <_vfiprintf_r+0x184c>
    7acc:	f94037e1 	ldr	x1, [sp, #104]
    7ad0:	91002c22 	add	x2, x1, #0xb
    7ad4:	927df042 	and	x2, x2, #0xfffffffffffffff8
    7ad8:	39400021 	ldrb	w1, [x1]
    7adc:	f90037e2 	str	x2, [sp, #104]
    7ae0:	17ffff33 	b	77ac <_vfiprintf_r+0x10ac>
    7ae4:	f94043e2 	ldr	x2, [sp, #128]
    7ae8:	b940b3e1 	ldr	w1, [sp, #176]
    7aec:	b900b3e0 	str	w0, [sp, #176]
    7af0:	8b21c041 	add	x1, x2, w1, sxtw
    7af4:	17fffc86 	b	6d0c <_vfiprintf_r+0x60c>
    7af8:	f94043e2 	ldr	x2, [sp, #128]
    7afc:	b940b3e0 	ldr	w0, [sp, #176]
    7b00:	b900b3e1 	str	w1, [sp, #176]
    7b04:	8b20c040 	add	x0, x2, w0, sxtw
    7b08:	17fffcb4 	b	6dd8 <_vfiprintf_r+0x6d8>
    7b0c:	36480bfc 	tbz	w28, #9, 7c88 <_vfiprintf_r+0x1588>
    7b10:	37f820a0 	tbnz	w0, #31, 7f24 <_vfiprintf_r+0x1824>
    7b14:	f94037e0 	ldr	x0, [sp, #104]
    7b18:	91002c01 	add	x1, x0, #0xb
    7b1c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7b20:	f90037e1 	str	x1, [sp, #104]
    7b24:	39800001 	ldrsb	x1, [x0]
    7b28:	aa0103e0 	mov	x0, x1
    7b2c:	17fffcad 	b	6de0 <_vfiprintf_r+0x6e0>
    7b30:	f94043e2 	ldr	x2, [sp, #128]
    7b34:	b940b3e0 	ldr	w0, [sp, #176]
    7b38:	b900b3e1 	str	w1, [sp, #176]
    7b3c:	8b20c040 	add	x0, x2, w0, sxtw
    7b40:	17fffc98 	b	6da0 <_vfiprintf_r+0x6a0>
    7b44:	b940b3e0 	ldr	w0, [sp, #176]
    7b48:	11002001 	add	w1, w0, #0x8
    7b4c:	7100003f 	cmp	w1, #0x0
    7b50:	540011ed 	b.le	7d8c <_vfiprintf_r+0x168c>
    7b54:	f94037e0 	ldr	x0, [sp, #104]
    7b58:	b900b3e1 	str	w1, [sp, #176]
    7b5c:	91002c02 	add	x2, x0, #0xb
    7b60:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7b64:	f90037e1 	str	x1, [sp, #104]
    7b68:	17fffc2b 	b	6c14 <_vfiprintf_r+0x514>
    7b6c:	910403e4 	add	x4, sp, #0x100
    7b70:	910423e2 	add	x2, sp, #0x108
    7b74:	aa1303e0 	mov	x0, x19
    7b78:	d2800003 	mov	x3, #0x0                   	// #0
    7b7c:	d2800001 	mov	x1, #0x0                   	// #0
    7b80:	94000248 	bl	84a0 <_wcsrtombs_r>
    7b84:	2a0003f7 	mov	w23, w0
    7b88:	3100041f 	cmn	w0, #0x1
    7b8c:	540017a0 	b.eq	7e80 <_vfiprintf_r+0x1780>  // b.none
    7b90:	f90087fa 	str	x26, [sp, #264]
    7b94:	17ffff5c 	b	7904 <_vfiprintf_r+0x1204>
    7b98:	52800016 	mov	w22, #0x0                   	// #0
    7b9c:	52800004 	mov	w4, #0x0                   	// #0
    7ba0:	a906fff8 	stp	x24, xzr, [sp, #104]
    7ba4:	17fffc6e 	b	6d5c <_vfiprintf_r+0x65c>
    7ba8:	f94043e2 	ldr	x2, [sp, #128]
    7bac:	b940b3e1 	ldr	w1, [sp, #176]
    7bb0:	b900b3e0 	str	w0, [sp, #176]
    7bb4:	8b21c042 	add	x2, x2, w1, sxtw
    7bb8:	17fffcde 	b	6f30 <_vfiprintf_r+0x830>
    7bbc:	f94043e2 	ldr	x2, [sp, #128]
    7bc0:	b940b3e0 	ldr	w0, [sp, #176]
    7bc4:	b900b3e1 	str	w1, [sp, #176]
    7bc8:	8b20c042 	add	x2, x2, w0, sxtw
    7bcc:	f94037e0 	ldr	x0, [sp, #104]
    7bd0:	f90037e2 	str	x2, [sp, #104]
    7bd4:	17fffc3d 	b	6cc8 <_vfiprintf_r+0x5c8>
    7bd8:	b940b3e0 	ldr	w0, [sp, #176]
    7bdc:	11002001 	add	w1, w0, #0x8
    7be0:	7100003f 	cmp	w1, #0x0
    7be4:	54000eed 	b.le	7dc0 <_vfiprintf_r+0x16c0>
    7be8:	f94037e0 	ldr	x0, [sp, #104]
    7bec:	b900b3e1 	str	w1, [sp, #176]
    7bf0:	91002c02 	add	x2, x0, #0xb
    7bf4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7bf8:	f90037e1 	str	x1, [sp, #104]
    7bfc:	17fffeb5 	b	76d0 <_vfiprintf_r+0xfd0>
    7c00:	f94043e3 	ldr	x3, [sp, #128]
    7c04:	b940b3e2 	ldr	w2, [sp, #176]
    7c08:	b900b3e1 	str	w1, [sp, #176]
    7c0c:	f94037f8 	ldr	x24, [sp, #104]
    7c10:	8b22c062 	add	x2, x3, w2, sxtw
    7c14:	f90037e2 	str	x2, [sp, #104]
    7c18:	17fffbda 	b	6b80 <_vfiprintf_r+0x480>
    7c1c:	910643fb 	add	x27, sp, #0x190
    7c20:	52800028 	mov	w8, #0x1                   	// #1
    7c24:	52800001 	mov	w1, #0x0                   	// #0
    7c28:	17fffb7c 	b	6a18 <_vfiprintf_r+0x318>
    7c2c:	37f81e60 	tbnz	w0, #31, 7ff8 <_vfiprintf_r+0x18f8>
    7c30:	f94037e0 	ldr	x0, [sp, #104]
    7c34:	91003c01 	add	x1, x0, #0xf
    7c38:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7c3c:	f90037e1 	str	x1, [sp, #104]
    7c40:	f9400000 	ldr	x0, [x0]
    7c44:	7940cbe1 	ldrh	w1, [sp, #100]
    7c48:	79000001 	strh	w1, [x0]
    7c4c:	17fffae4 	b	67dc <_vfiprintf_r+0xdc>
    7c50:	37f81281 	tbnz	w1, #31, 7ea0 <_vfiprintf_r+0x17a0>
    7c54:	f94037e1 	ldr	x1, [sp, #104]
    7c58:	91002c22 	add	x2, x1, #0xb
    7c5c:	927df042 	and	x2, x2, #0xfffffffffffffff8
    7c60:	b9400021 	ldr	w1, [x1]
    7c64:	f90037e2 	str	x2, [sp, #104]
    7c68:	17fffed1 	b	77ac <_vfiprintf_r+0x10ac>
    7c6c:	37f81460 	tbnz	w0, #31, 7ef8 <_vfiprintf_r+0x17f8>
    7c70:	f94037e0 	ldr	x0, [sp, #104]
    7c74:	91002c01 	add	x1, x0, #0xb
    7c78:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7c7c:	f90037e1 	str	x1, [sp, #104]
    7c80:	b9400001 	ldr	w1, [x0]
    7c84:	17fffc48 	b	6da4 <_vfiprintf_r+0x6a4>
    7c88:	37f81cc0 	tbnz	w0, #31, 8020 <_vfiprintf_r+0x1920>
    7c8c:	f94037e0 	ldr	x0, [sp, #104]
    7c90:	91002c01 	add	x1, x0, #0xb
    7c94:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7c98:	f90037e1 	str	x1, [sp, #104]
    7c9c:	b9800001 	ldrsw	x1, [x0]
    7ca0:	aa0103e0 	mov	x0, x1
    7ca4:	17fffc4f 	b	6de0 <_vfiprintf_r+0x6e0>
    7ca8:	37f81680 	tbnz	w0, #31, 7f78 <_vfiprintf_r+0x1878>
    7cac:	f94037e0 	ldr	x0, [sp, #104]
    7cb0:	91002c01 	add	x1, x0, #0xb
    7cb4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7cb8:	f90037e1 	str	x1, [sp, #104]
    7cbc:	b9400001 	ldr	w1, [x0]
    7cc0:	52800020 	mov	w0, #0x1                   	// #1
    7cc4:	17fffc14 	b	6d14 <_vfiprintf_r+0x614>
    7cc8:	9103bfe0 	add	x0, sp, #0xef
    7ccc:	910643fb 	add	x27, sp, #0x190
    7cd0:	52800028 	mov	w8, #0x1                   	// #1
    7cd4:	f900cbe0 	str	x0, [sp, #400]
    7cd8:	d2800020 	mov	x0, #0x1                   	// #1
    7cdc:	f900cfe0 	str	x0, [sp, #408]
    7ce0:	17fffb33 	b	69ac <_vfiprintf_r+0x2ac>
    7ce4:	b940b3e1 	ldr	w1, [sp, #176]
    7ce8:	11002022 	add	w2, w1, #0x8
    7cec:	7100005f 	cmp	w2, #0x0
    7cf0:	54001b6d 	b.le	805c <_vfiprintf_r+0x195c>
    7cf4:	f94037e1 	ldr	x1, [sp, #104]
    7cf8:	b900b3e2 	str	w2, [sp, #176]
    7cfc:	91002c23 	add	x3, x1, #0xb
    7d00:	927df062 	and	x2, x3, #0xfffffffffffffff8
    7d04:	79400021 	ldrh	w1, [x1]
    7d08:	f90037e2 	str	x2, [sp, #104]
    7d0c:	17fffea8 	b	77ac <_vfiprintf_r+0x10ac>
    7d10:	b940b3e0 	ldr	w0, [sp, #176]
    7d14:	11002001 	add	w1, w0, #0x8
    7d18:	7100003f 	cmp	w1, #0x0
    7d1c:	54001b6d 	b.le	8088 <_vfiprintf_r+0x1988>
    7d20:	f94037e0 	ldr	x0, [sp, #104]
    7d24:	b900b3e1 	str	w1, [sp, #176]
    7d28:	91002c02 	add	x2, x0, #0xb
    7d2c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7d30:	f90037e1 	str	x1, [sp, #104]
    7d34:	79400001 	ldrh	w1, [x0]
    7d38:	17fffc1b 	b	6da4 <_vfiprintf_r+0x6a4>
    7d3c:	b940b3e0 	ldr	w0, [sp, #176]
    7d40:	11002001 	add	w1, w0, #0x8
    7d44:	7100003f 	cmp	w1, #0x0
    7d48:	5400196d 	b.le	8074 <_vfiprintf_r+0x1974>
    7d4c:	f94037e0 	ldr	x0, [sp, #104]
    7d50:	b900b3e1 	str	w1, [sp, #176]
    7d54:	91002c02 	add	x2, x0, #0xb
    7d58:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7d5c:	f90037e1 	str	x1, [sp, #104]
    7d60:	17fffe2e 	b	7618 <_vfiprintf_r+0xf18>
    7d64:	b940b3e0 	ldr	w0, [sp, #176]
    7d68:	11002001 	add	w1, w0, #0x8
    7d6c:	7100003f 	cmp	w1, #0x0
    7d70:	540016cd 	b.le	8048 <_vfiprintf_r+0x1948>
    7d74:	f94037e0 	ldr	x0, [sp, #104]
    7d78:	b900b3e1 	str	w1, [sp, #176]
    7d7c:	91002c02 	add	x2, x0, #0xb
    7d80:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7d84:	f90037e1 	str	x1, [sp, #104]
    7d88:	17fffe13 	b	75d4 <_vfiprintf_r+0xed4>
    7d8c:	f94043e2 	ldr	x2, [sp, #128]
    7d90:	b940b3e0 	ldr	w0, [sp, #176]
    7d94:	b900b3e1 	str	w1, [sp, #176]
    7d98:	8b20c040 	add	x0, x2, w0, sxtw
    7d9c:	17fffb9e 	b	6c14 <_vfiprintf_r+0x514>
    7da0:	110006e1 	add	w1, w23, #0x1
    7da4:	aa1303e0 	mov	x0, x19
    7da8:	93407c21 	sxtw	x1, w1
    7dac:	94000ad5 	bl	a900 <_malloc_r>
    7db0:	aa0003fa 	mov	x26, x0
    7db4:	b4000660 	cbz	x0, 7e80 <_vfiprintf_r+0x1780>
    7db8:	f9003be0 	str	x0, [sp, #112]
    7dbc:	17fffed7 	b	7918 <_vfiprintf_r+0x1218>
    7dc0:	f94043e2 	ldr	x2, [sp, #128]
    7dc4:	b940b3e0 	ldr	w0, [sp, #176]
    7dc8:	b900b3e1 	str	w1, [sp, #176]
    7dcc:	8b20c040 	add	x0, x2, w0, sxtw
    7dd0:	17fffe40 	b	76d0 <_vfiprintf_r+0xfd0>
    7dd4:	2a0403f6 	mov	w22, w4
    7dd8:	2a0403f7 	mov	w23, w4
    7ddc:	52800004 	mov	w4, #0x0                   	// #0
    7de0:	f90037f8 	str	x24, [sp, #104]
    7de4:	17fffbde 	b	6d5c <_vfiprintf_r+0x65c>
    7de8:	a94a03e1 	ldp	x1, x0, [sp, #160]
    7dec:	b90073e4 	str	w4, [sp, #112]
    7df0:	a90917e3 	stp	x3, x5, [sp, #144]
    7df4:	cb00035a 	sub	x26, x26, x0
    7df8:	aa0003e2 	mov	x2, x0
    7dfc:	aa1a03e0 	mov	x0, x26
    7e00:	97fff9d8 	bl	6560 <strncpy>
    7e04:	39400680 	ldrb	w0, [x20, #1]
    7e08:	52800008 	mov	w8, #0x0                   	// #0
    7e0c:	b94073e4 	ldr	w4, [sp, #112]
    7e10:	7100001f 	cmp	w0, #0x0
    7e14:	9a940694 	cinc	x20, x20, ne  // ne = any
    7e18:	a94917e3 	ldp	x3, x5, [sp, #144]
    7e1c:	17fffee2 	b	79a4 <_vfiprintf_r+0x12a4>
    7e20:	f94043e2 	ldr	x2, [sp, #128]
    7e24:	b940b3e0 	ldr	w0, [sp, #176]
    7e28:	b900b3e1 	str	w1, [sp, #176]
    7e2c:	8b20c040 	add	x0, x2, w0, sxtw
    7e30:	17fffc28 	b	6ed0 <_vfiprintf_r+0x7d0>
    7e34:	f0000028 	adrp	x8, e000 <__func__.0+0x280>
    7e38:	2a0203eb 	mov	w11, w2
    7e3c:	91122108 	add	x8, x8, #0x488
    7e40:	17fffd4e 	b	7378 <_vfiprintf_r+0xc78>
    7e44:	aa1a03e0 	mov	x0, x26
    7e48:	97fff8fe 	bl	6240 <strlen>
    7e4c:	7100001f 	cmp	w0, #0x0
    7e50:	2a0003f7 	mov	w23, w0
    7e54:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    7e58:	52800004 	mov	w4, #0x0                   	// #0
    7e5c:	a906fff8 	stp	x24, xzr, [sp, #104]
    7e60:	17fffbbf 	b	6d5c <_vfiprintf_r+0x65c>
    7e64:	f0000028 	adrp	x8, e000 <__func__.0+0x280>
    7e68:	11000444 	add	w4, w2, #0x1
    7e6c:	91122108 	add	x8, x8, #0x488
    7e70:	17fffd7b 	b	745c <_vfiprintf_r+0xd5c>
    7e74:	12800000 	mov	w0, #0xffffffff            	// #-1
    7e78:	b90067e0 	str	w0, [sp, #100]
    7e7c:	17fffb31 	b	6b40 <_vfiprintf_r+0x440>
    7e80:	79c02320 	ldrsh	w0, [x25, #16]
    7e84:	321a0000 	orr	w0, w0, #0x40
    7e88:	79002320 	strh	w0, [x25, #16]
    7e8c:	17fffb2a 	b	6b34 <_vfiprintf_r+0x434>
    7e90:	f0000029 	adrp	x9, e000 <__func__.0+0x280>
    7e94:	2a0803ea 	mov	w10, w8
    7e98:	91126129 	add	x9, x9, #0x498
    7e9c:	17fffc90 	b	70dc <_vfiprintf_r+0x9dc>
    7ea0:	b940b3e1 	ldr	w1, [sp, #176]
    7ea4:	11002022 	add	w2, w1, #0x8
    7ea8:	7100005f 	cmp	w2, #0x0
    7eac:	540019cd 	b.le	81e4 <_vfiprintf_r+0x1ae4>
    7eb0:	f94037e1 	ldr	x1, [sp, #104]
    7eb4:	b900b3e2 	str	w2, [sp, #176]
    7eb8:	91002c23 	add	x3, x1, #0xb
    7ebc:	927df062 	and	x2, x3, #0xfffffffffffffff8
    7ec0:	b9400021 	ldr	w1, [x1]
    7ec4:	f90037e2 	str	x2, [sp, #104]
    7ec8:	17fffe39 	b	77ac <_vfiprintf_r+0x10ac>
    7ecc:	b940b3e0 	ldr	w0, [sp, #176]
    7ed0:	11002001 	add	w1, w0, #0x8
    7ed4:	7100003f 	cmp	w1, #0x0
    7ed8:	540010cd 	b.le	80f0 <_vfiprintf_r+0x19f0>
    7edc:	f94037e0 	ldr	x0, [sp, #104]
    7ee0:	b900b3e1 	str	w1, [sp, #176]
    7ee4:	91002c02 	add	x2, x0, #0xb
    7ee8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7eec:	f90037e1 	str	x1, [sp, #104]
    7ef0:	39400001 	ldrb	w1, [x0]
    7ef4:	17fffbac 	b	6da4 <_vfiprintf_r+0x6a4>
    7ef8:	b940b3e0 	ldr	w0, [sp, #176]
    7efc:	11002001 	add	w1, w0, #0x8
    7f00:	7100003f 	cmp	w1, #0x0
    7f04:	540015ad 	b.le	81b8 <_vfiprintf_r+0x1ab8>
    7f08:	f94037e0 	ldr	x0, [sp, #104]
    7f0c:	b900b3e1 	str	w1, [sp, #176]
    7f10:	91002c02 	add	x2, x0, #0xb
    7f14:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7f18:	f90037e1 	str	x1, [sp, #104]
    7f1c:	b9400001 	ldr	w1, [x0]
    7f20:	17fffba1 	b	6da4 <_vfiprintf_r+0x6a4>
    7f24:	b940b3e0 	ldr	w0, [sp, #176]
    7f28:	11002001 	add	w1, w0, #0x8
    7f2c:	7100003f 	cmp	w1, #0x0
    7f30:	54000f6d 	b.le	811c <_vfiprintf_r+0x1a1c>
    7f34:	f94037e0 	ldr	x0, [sp, #104]
    7f38:	b900b3e1 	str	w1, [sp, #176]
    7f3c:	91002c02 	add	x2, x0, #0xb
    7f40:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7f44:	f90037e1 	str	x1, [sp, #104]
    7f48:	17fffef7 	b	7b24 <_vfiprintf_r+0x1424>
    7f4c:	b940b3e1 	ldr	w1, [sp, #176]
    7f50:	11002022 	add	w2, w1, #0x8
    7f54:	7100005f 	cmp	w2, #0x0
    7f58:	5400152d 	b.le	81fc <_vfiprintf_r+0x1afc>
    7f5c:	f94037e1 	ldr	x1, [sp, #104]
    7f60:	b900b3e2 	str	w2, [sp, #176]
    7f64:	91002c23 	add	x3, x1, #0xb
    7f68:	927df062 	and	x2, x3, #0xfffffffffffffff8
    7f6c:	39400021 	ldrb	w1, [x1]
    7f70:	f90037e2 	str	x2, [sp, #104]
    7f74:	17fffe0e 	b	77ac <_vfiprintf_r+0x10ac>
    7f78:	b940b3e0 	ldr	w0, [sp, #176]
    7f7c:	11002001 	add	w1, w0, #0x8
    7f80:	7100003f 	cmp	w1, #0x0
    7f84:	5400106d 	b.le	8190 <_vfiprintf_r+0x1a90>
    7f88:	f94037e0 	ldr	x0, [sp, #104]
    7f8c:	b900b3e1 	str	w1, [sp, #176]
    7f90:	91002c02 	add	x2, x0, #0xb
    7f94:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7f98:	f90037e1 	str	x1, [sp, #104]
    7f9c:	17ffff48 	b	7cbc <_vfiprintf_r+0x15bc>
    7fa0:	b940b3e0 	ldr	w0, [sp, #176]
    7fa4:	11002001 	add	w1, w0, #0x8
    7fa8:	7100003f 	cmp	w1, #0x0
    7fac:	54000e8d 	b.le	817c <_vfiprintf_r+0x1a7c>
    7fb0:	f94037e0 	ldr	x0, [sp, #104]
    7fb4:	b900b3e1 	str	w1, [sp, #176]
    7fb8:	91002c02 	add	x2, x0, #0xb
    7fbc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    7fc0:	f90037e1 	str	x1, [sp, #104]
    7fc4:	17fffeb8 	b	7aa4 <_vfiprintf_r+0x13a4>
    7fc8:	37f80800 	tbnz	w0, #31, 80c8 <_vfiprintf_r+0x19c8>
    7fcc:	f94037e0 	ldr	x0, [sp, #104]
    7fd0:	91003c01 	add	x1, x0, #0xf
    7fd4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    7fd8:	f90037e1 	str	x1, [sp, #104]
    7fdc:	f9400000 	ldr	x0, [x0]
    7fe0:	b94067e1 	ldr	w1, [sp, #100]
    7fe4:	b9000001 	str	w1, [x0]
    7fe8:	17fff9fd 	b	67dc <_vfiprintf_r+0xdc>
    7fec:	2a1403f7 	mov	w23, w20
    7ff0:	f94037f4 	ldr	x20, [sp, #104]
    7ff4:	17fffe44 	b	7904 <_vfiprintf_r+0x1204>
    7ff8:	b940b3e0 	ldr	w0, [sp, #176]
    7ffc:	11002001 	add	w1, w0, #0x8
    8000:	7100003f 	cmp	w1, #0x0
    8004:	54000d0d 	b.le	81a4 <_vfiprintf_r+0x1aa4>
    8008:	f94037e0 	ldr	x0, [sp, #104]
    800c:	b900b3e1 	str	w1, [sp, #176]
    8010:	91003c02 	add	x2, x0, #0xf
    8014:	927df041 	and	x1, x2, #0xfffffffffffffff8
    8018:	f90037e1 	str	x1, [sp, #104]
    801c:	17ffff09 	b	7c40 <_vfiprintf_r+0x1540>
    8020:	b940b3e0 	ldr	w0, [sp, #176]
    8024:	11002001 	add	w1, w0, #0x8
    8028:	7100003f 	cmp	w1, #0x0
    802c:	540006ed 	b.le	8108 <_vfiprintf_r+0x1a08>
    8030:	f94037e0 	ldr	x0, [sp, #104]
    8034:	b900b3e1 	str	w1, [sp, #176]
    8038:	91002c02 	add	x2, x0, #0xb
    803c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    8040:	f90037e1 	str	x1, [sp, #104]
    8044:	17ffff16 	b	7c9c <_vfiprintf_r+0x159c>
    8048:	f94043e2 	ldr	x2, [sp, #128]
    804c:	b940b3e0 	ldr	w0, [sp, #176]
    8050:	b900b3e1 	str	w1, [sp, #176]
    8054:	8b20c040 	add	x0, x2, w0, sxtw
    8058:	17fffd5f 	b	75d4 <_vfiprintf_r+0xed4>
    805c:	f94043e3 	ldr	x3, [sp, #128]
    8060:	b940b3e1 	ldr	w1, [sp, #176]
    8064:	b900b3e2 	str	w2, [sp, #176]
    8068:	8b21c061 	add	x1, x3, w1, sxtw
    806c:	79400021 	ldrh	w1, [x1]
    8070:	17fffdcf 	b	77ac <_vfiprintf_r+0x10ac>
    8074:	f94043e2 	ldr	x2, [sp, #128]
    8078:	b940b3e0 	ldr	w0, [sp, #176]
    807c:	b900b3e1 	str	w1, [sp, #176]
    8080:	8b20c040 	add	x0, x2, w0, sxtw
    8084:	17fffd65 	b	7618 <_vfiprintf_r+0xf18>
    8088:	f94043e2 	ldr	x2, [sp, #128]
    808c:	b940b3e0 	ldr	w0, [sp, #176]
    8090:	b900b3e1 	str	w1, [sp, #176]
    8094:	8b20c040 	add	x0, x2, w0, sxtw
    8098:	79400001 	ldrh	w1, [x0]
    809c:	17fffb42 	b	6da4 <_vfiprintf_r+0x6a4>
    80a0:	b940b3e0 	ldr	w0, [sp, #176]
    80a4:	11002001 	add	w1, w0, #0x8
    80a8:	7100003f 	cmp	w1, #0x0
    80ac:	5400092d 	b.le	81d0 <_vfiprintf_r+0x1ad0>
    80b0:	f94037e0 	ldr	x0, [sp, #104]
    80b4:	b900b3e1 	str	w1, [sp, #176]
    80b8:	91003c02 	add	x2, x0, #0xf
    80bc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    80c0:	f90037e1 	str	x1, [sp, #104]
    80c4:	17fffb7a 	b	6eac <_vfiprintf_r+0x7ac>
    80c8:	b940b3e0 	ldr	w0, [sp, #176]
    80cc:	11002001 	add	w1, w0, #0x8
    80d0:	7100003f 	cmp	w1, #0x0
    80d4:	540002ed 	b.le	8130 <_vfiprintf_r+0x1a30>
    80d8:	f94037e0 	ldr	x0, [sp, #104]
    80dc:	b900b3e1 	str	w1, [sp, #176]
    80e0:	91003c02 	add	x2, x0, #0xf
    80e4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    80e8:	f90037e1 	str	x1, [sp, #104]
    80ec:	17ffffbc 	b	7fdc <_vfiprintf_r+0x18dc>
    80f0:	f94043e2 	ldr	x2, [sp, #128]
    80f4:	b940b3e0 	ldr	w0, [sp, #176]
    80f8:	b900b3e1 	str	w1, [sp, #176]
    80fc:	8b20c040 	add	x0, x2, w0, sxtw
    8100:	39400001 	ldrb	w1, [x0]
    8104:	17fffb28 	b	6da4 <_vfiprintf_r+0x6a4>
    8108:	f94043e2 	ldr	x2, [sp, #128]
    810c:	b940b3e0 	ldr	w0, [sp, #176]
    8110:	b900b3e1 	str	w1, [sp, #176]
    8114:	8b20c040 	add	x0, x2, w0, sxtw
    8118:	17fffee1 	b	7c9c <_vfiprintf_r+0x159c>
    811c:	f94043e2 	ldr	x2, [sp, #128]
    8120:	b940b3e0 	ldr	w0, [sp, #176]
    8124:	b900b3e1 	str	w1, [sp, #176]
    8128:	8b20c040 	add	x0, x2, w0, sxtw
    812c:	17fffe7e 	b	7b24 <_vfiprintf_r+0x1424>
    8130:	f94043e2 	ldr	x2, [sp, #128]
    8134:	b940b3e0 	ldr	w0, [sp, #176]
    8138:	b900b3e1 	str	w1, [sp, #176]
    813c:	8b20c040 	add	x0, x2, w0, sxtw
    8140:	17ffffa7 	b	7fdc <_vfiprintf_r+0x18dc>
    8144:	b940b3e0 	ldr	w0, [sp, #176]
    8148:	37f80660 	tbnz	w0, #31, 8214 <_vfiprintf_r+0x1b14>
    814c:	f94037e1 	ldr	x1, [sp, #104]
    8150:	91002c21 	add	x1, x1, #0xb
    8154:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8158:	f94037e3 	ldr	x3, [sp, #104]
    815c:	f90037e1 	str	x1, [sp, #104]
    8160:	b900b3e0 	str	w0, [sp, #176]
    8164:	39400680 	ldrb	w0, [x20, #1]
    8168:	aa0203f4 	mov	x20, x2
    816c:	b9400064 	ldr	w4, [x3]
    8170:	7100009f 	cmp	w4, #0x0
    8174:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    8178:	17fff9e8 	b	6918 <_vfiprintf_r+0x218>
    817c:	f94043e2 	ldr	x2, [sp, #128]
    8180:	b940b3e0 	ldr	w0, [sp, #176]
    8184:	b900b3e1 	str	w1, [sp, #176]
    8188:	8b20c040 	add	x0, x2, w0, sxtw
    818c:	17fffe46 	b	7aa4 <_vfiprintf_r+0x13a4>
    8190:	f94043e2 	ldr	x2, [sp, #128]
    8194:	b940b3e0 	ldr	w0, [sp, #176]
    8198:	b900b3e1 	str	w1, [sp, #176]
    819c:	8b20c040 	add	x0, x2, w0, sxtw
    81a0:	17fffec7 	b	7cbc <_vfiprintf_r+0x15bc>
    81a4:	f94043e2 	ldr	x2, [sp, #128]
    81a8:	b940b3e0 	ldr	w0, [sp, #176]
    81ac:	b900b3e1 	str	w1, [sp, #176]
    81b0:	8b20c040 	add	x0, x2, w0, sxtw
    81b4:	17fffea3 	b	7c40 <_vfiprintf_r+0x1540>
    81b8:	f94043e2 	ldr	x2, [sp, #128]
    81bc:	b940b3e0 	ldr	w0, [sp, #176]
    81c0:	b900b3e1 	str	w1, [sp, #176]
    81c4:	8b20c040 	add	x0, x2, w0, sxtw
    81c8:	b9400001 	ldr	w1, [x0]
    81cc:	17fffaf6 	b	6da4 <_vfiprintf_r+0x6a4>
    81d0:	f94043e2 	ldr	x2, [sp, #128]
    81d4:	b940b3e0 	ldr	w0, [sp, #176]
    81d8:	b900b3e1 	str	w1, [sp, #176]
    81dc:	8b20c040 	add	x0, x2, w0, sxtw
    81e0:	17fffb33 	b	6eac <_vfiprintf_r+0x7ac>
    81e4:	f94043e3 	ldr	x3, [sp, #128]
    81e8:	b940b3e1 	ldr	w1, [sp, #176]
    81ec:	b900b3e2 	str	w2, [sp, #176]
    81f0:	8b21c061 	add	x1, x3, w1, sxtw
    81f4:	b9400021 	ldr	w1, [x1]
    81f8:	17fffd6d 	b	77ac <_vfiprintf_r+0x10ac>
    81fc:	f94043e3 	ldr	x3, [sp, #128]
    8200:	b940b3e1 	ldr	w1, [sp, #176]
    8204:	b900b3e2 	str	w2, [sp, #176]
    8208:	8b21c061 	add	x1, x3, w1, sxtw
    820c:	39400021 	ldrb	w1, [x1]
    8210:	17fffd67 	b	77ac <_vfiprintf_r+0x10ac>
    8214:	b940b3e0 	ldr	w0, [sp, #176]
    8218:	f94037e1 	ldr	x1, [sp, #104]
    821c:	11002000 	add	w0, w0, #0x8
    8220:	7100001f 	cmp	w0, #0x0
    8224:	5400010d 	b.le	8244 <_vfiprintf_r+0x1b44>
    8228:	91002c21 	add	x1, x1, #0xb
    822c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    8230:	17ffffca 	b	8158 <_vfiprintf_r+0x1a58>
    8234:	79402320 	ldrh	w0, [x25, #16]
    8238:	321a0000 	orr	w0, w0, #0x40
    823c:	79002320 	strh	w0, [x25, #16]
    8240:	17fffa37 	b	6b1c <_vfiprintf_r+0x41c>
    8244:	f94043e4 	ldr	x4, [sp, #128]
    8248:	b940b3e3 	ldr	w3, [sp, #176]
    824c:	8b23c083 	add	x3, x4, w3, sxtw
    8250:	f90037e3 	str	x3, [sp, #104]
    8254:	17ffffc1 	b	8158 <_vfiprintf_r+0x1a58>
    8258:	d503201f 	nop
    825c:	d503201f 	nop

0000000000008260 <vfiprintf>:
    8260:	aa0203e4 	mov	x4, x2
    8264:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8268:	f0000023 	adrp	x3, f000 <IpcFsServer+0x5d8>
    826c:	910003fd 	mov	x29, sp
    8270:	a9401c46 	ldp	x6, x7, [x2]
    8274:	aa0003e8 	mov	x8, x0
    8278:	a9411484 	ldp	x4, x5, [x4, #16]
    827c:	aa0103e2 	mov	x2, x1
    8280:	f9411860 	ldr	x0, [x3, #560]
    8284:	aa0803e1 	mov	x1, x8
    8288:	910043e3 	add	x3, sp, #0x10
    828c:	a9011fe6 	stp	x6, x7, [sp, #16]
    8290:	a90217e4 	stp	x4, x5, [sp, #32]
    8294:	97fff91b 	bl	6700 <_vfiprintf_r>
    8298:	a8c37bfd 	ldp	x29, x30, [sp], #48
    829c:	d65f03c0 	ret

00000000000082a0 <__sbprintf>:
    82a0:	d11403ff 	sub	sp, sp, #0x500
    82a4:	52808005 	mov	w5, #0x400                 	// #1024
    82a8:	910403e6 	add	x6, sp, #0x100
    82ac:	a9007bfd 	stp	x29, x30, [sp]
    82b0:	910003fd 	mov	x29, sp
    82b4:	a90153f3 	stp	x19, x20, [sp, #16]
    82b8:	aa0103f3 	mov	x19, x1
    82bc:	aa0303e1 	mov	x1, x3
    82c0:	9100c3e3 	add	x3, sp, #0x30
    82c4:	f9002be6 	str	x6, [sp, #80]
    82c8:	79402264 	ldrh	w4, [x19, #16]
    82cc:	a9403c2e 	ldp	x14, x15, [x1]
    82d0:	121e7884 	and	w4, w4, #0xfffffffd
    82d4:	7940266c 	ldrh	w12, [x19, #18]
    82d8:	a9412428 	ldp	x8, x9, [x1, #16]
    82dc:	910143e1 	add	x1, sp, #0x50
    82e0:	f9401a6b 	ldr	x11, [x19, #48]
    82e4:	b9005fe5 	str	w5, [sp, #92]
    82e8:	f940226a 	ldr	x10, [x19, #64]
    82ec:	a9033fee 	stp	x14, x15, [sp, #48]
    82f0:	b940ae67 	ldr	w7, [x19, #172]
    82f4:	f90013f5 	str	x21, [sp, #32]
    82f8:	aa0003f5 	mov	x21, x0
    82fc:	a90427e8 	stp	x8, x9, [sp, #64]
    8300:	7900c3e4 	strh	w4, [sp, #96]
    8304:	7900c7ec 	strh	w12, [sp, #98]
    8308:	f90037e6 	str	x6, [sp, #104]
    830c:	b90073e5 	str	w5, [sp, #112]
    8310:	b9007bff 	str	wzr, [sp, #120]
    8314:	f90043eb 	str	x11, [sp, #128]
    8318:	f9004bea 	str	x10, [sp, #144]
    831c:	b900ffe7 	str	w7, [sp, #252]
    8320:	97fff8f8 	bl	6700 <_vfiprintf_r>
    8324:	2a0003f4 	mov	w20, w0
    8328:	37f800c0 	tbnz	w0, #31, 8340 <__sbprintf+0xa0>
    832c:	910143e1 	add	x1, sp, #0x50
    8330:	aa1503e0 	mov	x0, x21
    8334:	9400017b 	bl	8920 <_fflush_r>
    8338:	7100001f 	cmp	w0, #0x0
    833c:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    8340:	7940c3e0 	ldrh	w0, [sp, #96]
    8344:	36300080 	tbz	w0, #6, 8354 <__sbprintf+0xb4>
    8348:	79402260 	ldrh	w0, [x19, #16]
    834c:	321a0000 	orr	w0, w0, #0x40
    8350:	79002260 	strh	w0, [x19, #16]
    8354:	2a1403e0 	mov	w0, w20
    8358:	a9407bfd 	ldp	x29, x30, [sp]
    835c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8360:	f94013f5 	ldr	x21, [sp, #32]
    8364:	911403ff 	add	sp, sp, #0x500
    8368:	d65f03c0 	ret
    836c:	d503201f 	nop

0000000000008370 <_wcrtomb_r>:
    8370:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8374:	91055004 	add	x4, x0, #0x154
    8378:	910003fd 	mov	x29, sp
    837c:	a90153f3 	stp	x19, x20, [sp, #16]
    8380:	aa0303f3 	mov	x19, x3
    8384:	f100027f 	cmp	x19, #0x0
    8388:	f0000023 	adrp	x3, f000 <IpcFsServer+0x5d8>
    838c:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    8390:	aa0003f4 	mov	x20, x0
    8394:	f9454064 	ldr	x4, [x3, #2688]
    8398:	aa1303e3 	mov	x3, x19
    839c:	b4000121 	cbz	x1, 83c0 <_wcrtomb_r+0x50>
    83a0:	d63f0080 	blr	x4
    83a4:	2a0003e1 	mov	w1, w0
    83a8:	93407c20 	sxtw	x0, w1
    83ac:	3100043f 	cmn	w1, #0x1
    83b0:	54000160 	b.eq	83dc <_wcrtomb_r+0x6c>  // b.none
    83b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    83b8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    83bc:	d65f03c0 	ret
    83c0:	910083e1 	add	x1, sp, #0x20
    83c4:	52800002 	mov	w2, #0x0                   	// #0
    83c8:	d63f0080 	blr	x4
    83cc:	2a0003e1 	mov	w1, w0
    83d0:	93407c20 	sxtw	x0, w1
    83d4:	3100043f 	cmn	w1, #0x1
    83d8:	54fffee1 	b.ne	83b4 <_wcrtomb_r+0x44>  // b.any
    83dc:	b900027f 	str	wzr, [x19]
    83e0:	52801141 	mov	w1, #0x8a                  	// #138
    83e4:	b9000281 	str	w1, [x20]
    83e8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    83ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    83f0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    83f4:	d65f03c0 	ret
    83f8:	d503201f 	nop
    83fc:	d503201f 	nop

0000000000008400 <wcrtomb>:
    8400:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8404:	f0000024 	adrp	x4, f000 <IpcFsServer+0x5d8>
    8408:	f0000023 	adrp	x3, f000 <IpcFsServer+0x5d8>
    840c:	910003fd 	mov	x29, sp
    8410:	a90153f3 	stp	x19, x20, [sp, #16]
    8414:	f100005f 	cmp	x2, #0x0
    8418:	f9411894 	ldr	x20, [x4, #560]
    841c:	91055284 	add	x4, x20, #0x154
    8420:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    8424:	f9454064 	ldr	x4, [x3, #2688]
    8428:	b40001a0 	cbz	x0, 845c <wcrtomb+0x5c>
    842c:	2a0103e2 	mov	w2, w1
    8430:	aa0003e1 	mov	x1, x0
    8434:	aa1303e3 	mov	x3, x19
    8438:	aa1403e0 	mov	x0, x20
    843c:	d63f0080 	blr	x4
    8440:	2a0003e1 	mov	w1, w0
    8444:	93407c20 	sxtw	x0, w1
    8448:	3100043f 	cmn	w1, #0x1
    844c:	540001a0 	b.eq	8480 <wcrtomb+0x80>  // b.none
    8450:	a94153f3 	ldp	x19, x20, [sp, #16]
    8454:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8458:	d65f03c0 	ret
    845c:	910083e1 	add	x1, sp, #0x20
    8460:	aa1303e3 	mov	x3, x19
    8464:	aa1403e0 	mov	x0, x20
    8468:	52800002 	mov	w2, #0x0                   	// #0
    846c:	d63f0080 	blr	x4
    8470:	2a0003e1 	mov	w1, w0
    8474:	93407c20 	sxtw	x0, w1
    8478:	3100043f 	cmn	w1, #0x1
    847c:	54fffea1 	b.ne	8450 <wcrtomb+0x50>  // b.any
    8480:	b900027f 	str	wzr, [x19]
    8484:	52801141 	mov	w1, #0x8a                  	// #138
    8488:	b9000281 	str	w1, [x20]
    848c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    8490:	a94153f3 	ldp	x19, x20, [sp, #16]
    8494:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8498:	d65f03c0 	ret
    849c:	d503201f 	nop

00000000000084a0 <_wcsrtombs_r>:
    84a0:	aa0403e5 	mov	x5, x4
    84a4:	aa0303e4 	mov	x4, x3
    84a8:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    84ac:	140012ad 	b	cf60 <_wcsnrtombs_r>

00000000000084b0 <wcsrtombs>:
    84b0:	f0000026 	adrp	x6, f000 <IpcFsServer+0x5d8>
    84b4:	aa0003e4 	mov	x4, x0
    84b8:	aa0103e5 	mov	x5, x1
    84bc:	aa0403e1 	mov	x1, x4
    84c0:	f94118c0 	ldr	x0, [x6, #560]
    84c4:	aa0203e4 	mov	x4, x2
    84c8:	aa0503e2 	mov	x2, x5
    84cc:	aa0303e5 	mov	x5, x3
    84d0:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    84d4:	140012a3 	b	cf60 <_wcsnrtombs_r>
    84d8:	d503201f 	nop
    84dc:	d503201f 	nop

00000000000084e0 <__swsetup_r>:
    84e0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    84e4:	f0000022 	adrp	x2, f000 <IpcFsServer+0x5d8>
    84e8:	910003fd 	mov	x29, sp
    84ec:	a90153f3 	stp	x19, x20, [sp, #16]
    84f0:	aa0003f4 	mov	x20, x0
    84f4:	aa0103f3 	mov	x19, x1
    84f8:	f9411840 	ldr	x0, [x2, #560]
    84fc:	b4000060 	cbz	x0, 8508 <__swsetup_r+0x28>
    8500:	b9405001 	ldr	w1, [x0, #80]
    8504:	340004e1 	cbz	w1, 85a0 <__swsetup_r+0xc0>
    8508:	79c02262 	ldrsh	w2, [x19, #16]
    850c:	12003c41 	and	w1, w2, #0xffff
    8510:	36180502 	tbz	w2, #3, 85b0 <__swsetup_r+0xd0>
    8514:	f9400e63 	ldr	x3, [x19, #24]
    8518:	b40002c3 	cbz	x3, 8570 <__swsetup_r+0x90>
    851c:	36000141 	tbz	w1, #0, 8544 <__swsetup_r+0x64>
    8520:	b9402260 	ldr	w0, [x19, #32]
    8524:	b9000e7f 	str	wzr, [x19, #12]
    8528:	4b0003e0 	neg	w0, w0
    852c:	b9002a60 	str	w0, [x19, #40]
    8530:	52800000 	mov	w0, #0x0                   	// #0
    8534:	b4000143 	cbz	x3, 855c <__swsetup_r+0x7c>
    8538:	a94153f3 	ldp	x19, x20, [sp, #16]
    853c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    8540:	d65f03c0 	ret
    8544:	52800000 	mov	w0, #0x0                   	// #0
    8548:	37080041 	tbnz	w1, #1, 8550 <__swsetup_r+0x70>
    854c:	b9402260 	ldr	w0, [x19, #32]
    8550:	b9000e60 	str	w0, [x19, #12]
    8554:	52800000 	mov	w0, #0x0                   	// #0
    8558:	b5ffff03 	cbnz	x3, 8538 <__swsetup_r+0x58>
    855c:	363ffee1 	tbz	w1, #7, 8538 <__swsetup_r+0x58>
    8560:	321a0042 	orr	w2, w2, #0x40
    8564:	12800000 	mov	w0, #0xffffffff            	// #-1
    8568:	79002262 	strh	w2, [x19, #16]
    856c:	17fffff3 	b	8538 <__swsetup_r+0x58>
    8570:	52805000 	mov	w0, #0x280                 	// #640
    8574:	0a000020 	and	w0, w1, w0
    8578:	7108001f 	cmp	w0, #0x200
    857c:	54fffd00 	b.eq	851c <__swsetup_r+0x3c>  // b.none
    8580:	aa1303e1 	mov	x1, x19
    8584:	aa1403e0 	mov	x0, x20
    8588:	9400085a 	bl	a6f0 <__smakebuf_r>
    858c:	79c02262 	ldrsh	w2, [x19, #16]
    8590:	f9400e63 	ldr	x3, [x19, #24]
    8594:	12003c41 	and	w1, w2, #0xffff
    8598:	3607fd61 	tbz	w1, #0, 8544 <__swsetup_r+0x64>
    859c:	17ffffe1 	b	8520 <__swsetup_r+0x40>
    85a0:	940001e0 	bl	8d20 <__sinit>
    85a4:	79c02262 	ldrsh	w2, [x19, #16]
    85a8:	12003c41 	and	w1, w2, #0xffff
    85ac:	371ffb42 	tbnz	w2, #3, 8514 <__swsetup_r+0x34>
    85b0:	362002e1 	tbz	w1, #4, 860c <__swsetup_r+0x12c>
    85b4:	371000e1 	tbnz	w1, #2, 85d0 <__swsetup_r+0xf0>
    85b8:	f9400e63 	ldr	x3, [x19, #24]
    85bc:	321d0042 	orr	w2, w2, #0x8
    85c0:	79002262 	strh	w2, [x19, #16]
    85c4:	12003c41 	and	w1, w2, #0xffff
    85c8:	b5fffaa3 	cbnz	x3, 851c <__swsetup_r+0x3c>
    85cc:	17ffffe9 	b	8570 <__swsetup_r+0x90>
    85d0:	f9402e61 	ldr	x1, [x19, #88]
    85d4:	b4000101 	cbz	x1, 85f4 <__swsetup_r+0x114>
    85d8:	9101d260 	add	x0, x19, #0x74
    85dc:	eb00003f 	cmp	x1, x0
    85e0:	54000080 	b.eq	85f0 <__swsetup_r+0x110>  // b.none
    85e4:	aa1403e0 	mov	x0, x20
    85e8:	940002a6 	bl	9080 <_free_r>
    85ec:	79c02262 	ldrsh	w2, [x19, #16]
    85f0:	f9002e7f 	str	xzr, [x19, #88]
    85f4:	f9400e63 	ldr	x3, [x19, #24]
    85f8:	12800480 	mov	w0, #0xffffffdb            	// #-37
    85fc:	0a000042 	and	w2, w2, w0
    8600:	f9000263 	str	x3, [x19]
    8604:	b9000a7f 	str	wzr, [x19, #8]
    8608:	17ffffed 	b	85bc <__swsetup_r+0xdc>
    860c:	52800120 	mov	w0, #0x9                   	// #9
    8610:	b9000280 	str	w0, [x20]
    8614:	321a0042 	orr	w2, w2, #0x40
    8618:	12800000 	mov	w0, #0xffffffff            	// #-1
    861c:	79002262 	strh	w2, [x19, #16]
    8620:	17ffffc6 	b	8538 <__swsetup_r+0x58>
    8624:	d503201f 	nop
    8628:	d503201f 	nop
    862c:	d503201f 	nop

0000000000008630 <abort>:
    8630:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    8634:	528000c0 	mov	w0, #0x6                   	// #6
    8638:	910003fd 	mov	x29, sp
    863c:	94000ec1 	bl	c140 <raise>
    8640:	52800020 	mov	w0, #0x1                   	// #1
    8644:	97fff4d3 	bl	5990 <_exit>
    8648:	d503201f 	nop
    864c:	d503201f 	nop

0000000000008650 <__register_exitproc>:
    8650:	d0000024 	adrp	x4, e000 <__func__.0+0x280>
    8654:	f941b884 	ldr	x4, [x4, #880]
    8658:	f940fc85 	ldr	x5, [x4, #504]
    865c:	b4000405 	cbz	x5, 86dc <__register_exitproc+0x8c>
    8660:	b94008a4 	ldr	w4, [x5, #8]
    8664:	71007c9f 	cmp	w4, #0x1f
    8668:	5400040c 	b.gt	86e8 <__register_exitproc+0x98>
    866c:	93407c86 	sxtw	x6, w4
    8670:	350000e0 	cbnz	w0, 868c <__register_exitproc+0x3c>
    8674:	910008c2 	add	x2, x6, #0x2
    8678:	11000484 	add	w4, w4, #0x1
    867c:	b90008a4 	str	w4, [x5, #8]
    8680:	52800000 	mov	w0, #0x0                   	// #0
    8684:	f82278a1 	str	x1, [x5, x2, lsl #3]
    8688:	d65f03c0 	ret
    868c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    8690:	52800028 	mov	w8, #0x1                   	// #1
    8694:	1ac42108 	lsl	w8, w8, w4
    8698:	93407c86 	sxtw	x6, w4
    869c:	f90088e2 	str	x2, [x7, #272]
    86a0:	b94310a2 	ldr	w2, [x5, #784]
    86a4:	2a080042 	orr	w2, w2, w8
    86a8:	b90310a2 	str	w2, [x5, #784]
    86ac:	f90108e3 	str	x3, [x7, #528]
    86b0:	7100081f 	cmp	w0, #0x2
    86b4:	54fffe01 	b.ne	8674 <__register_exitproc+0x24>  // b.any
    86b8:	b94314a0 	ldr	w0, [x5, #788]
    86bc:	910008c2 	add	x2, x6, #0x2
    86c0:	11000484 	add	w4, w4, #0x1
    86c4:	b90008a4 	str	w4, [x5, #8]
    86c8:	2a080008 	orr	w8, w0, w8
    86cc:	b90314a8 	str	w8, [x5, #788]
    86d0:	52800000 	mov	w0, #0x0                   	// #0
    86d4:	f82278a1 	str	x1, [x5, x2, lsl #3]
    86d8:	17ffffec 	b	8688 <__register_exitproc+0x38>
    86dc:	91080085 	add	x5, x4, #0x200
    86e0:	f900fc85 	str	x5, [x4, #504]
    86e4:	17ffffdf 	b	8660 <__register_exitproc+0x10>
    86e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    86ec:	d65f03c0 	ret

00000000000086f0 <__sflush_r>:
    86f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    86f4:	910003fd 	mov	x29, sp
    86f8:	a9025bf5 	stp	x21, x22, [sp, #32]
    86fc:	aa0003f6 	mov	x22, x0
    8700:	79c02020 	ldrsh	w0, [x1, #16]
    8704:	a90153f3 	stp	x19, x20, [sp, #16]
    8708:	aa0103f3 	mov	x19, x1
    870c:	37180560 	tbnz	w0, #3, 87b8 <__sflush_r+0xc8>
    8710:	32150000 	orr	w0, w0, #0x800
    8714:	79002020 	strh	w0, [x1, #16]
    8718:	b9400821 	ldr	w1, [x1, #8]
    871c:	7100003f 	cmp	w1, #0x0
    8720:	5400092d 	b.le	8844 <__sflush_r+0x154>
    8724:	f9402664 	ldr	x4, [x19, #72]
    8728:	b4000944 	cbz	x4, 8850 <__sflush_r+0x160>
    872c:	b94002d4 	ldr	w20, [x22]
    8730:	12003c01 	and	w1, w0, #0xffff
    8734:	b90002df 	str	wzr, [x22]
    8738:	37600960 	tbnz	w0, #12, 8864 <__sflush_r+0x174>
    873c:	f9401a61 	ldr	x1, [x19, #48]
    8740:	d2800002 	mov	x2, #0x0                   	// #0
    8744:	aa1603e0 	mov	x0, x22
    8748:	52800023 	mov	w3, #0x1                   	// #1
    874c:	d63f0080 	blr	x4
    8750:	aa0003e2 	mov	x2, x0
    8754:	b100041f 	cmn	x0, #0x1
    8758:	54000d00 	b.eq	88f8 <__sflush_r+0x208>  // b.none
    875c:	79402261 	ldrh	w1, [x19, #16]
    8760:	f9402664 	ldr	x4, [x19, #72]
    8764:	361000e1 	tbz	w1, #2, 8780 <__sflush_r+0x90>
    8768:	f9402e60 	ldr	x0, [x19, #88]
    876c:	b9800a61 	ldrsw	x1, [x19, #8]
    8770:	cb010042 	sub	x2, x2, x1
    8774:	b4000060 	cbz	x0, 8780 <__sflush_r+0x90>
    8778:	b9807260 	ldrsw	x0, [x19, #112]
    877c:	cb000042 	sub	x2, x2, x0
    8780:	f9401a61 	ldr	x1, [x19, #48]
    8784:	aa1603e0 	mov	x0, x22
    8788:	52800003 	mov	w3, #0x0                   	// #0
    878c:	d63f0080 	blr	x4
    8790:	b100041f 	cmn	x0, #0x1
    8794:	540006c1 	b.ne	886c <__sflush_r+0x17c>  // b.any
    8798:	b94002c2 	ldr	w2, [x22]
    879c:	7100745f 	cmp	w2, #0x1d
    87a0:	54000929 	b.ls	88c4 <__sflush_r+0x1d4>  // b.plast
    87a4:	79c02261 	ldrsh	w1, [x19, #16]
    87a8:	321a0021 	orr	w1, w1, #0x40
    87ac:	12800000 	mov	w0, #0xffffffff            	// #-1
    87b0:	79002261 	strh	w1, [x19, #16]
    87b4:	14000028 	b	8854 <__sflush_r+0x164>
    87b8:	f9400c35 	ldr	x21, [x1, #24]
    87bc:	b40004b5 	cbz	x21, 8850 <__sflush_r+0x160>
    87c0:	12003c01 	and	w1, w0, #0xffff
    87c4:	52800002 	mov	w2, #0x0                   	// #0
    87c8:	f9400260 	ldr	x0, [x19]
    87cc:	f9000275 	str	x21, [x19]
    87d0:	cb150000 	sub	x0, x0, x21
    87d4:	2a0003f4 	mov	w20, w0
    87d8:	f240043f 	tst	x1, #0x3
    87dc:	54000041 	b.ne	87e4 <__sflush_r+0xf4>  // b.any
    87e0:	b9402262 	ldr	w2, [x19, #32]
    87e4:	b9000e62 	str	w2, [x19, #12]
    87e8:	7100001f 	cmp	w0, #0x0
    87ec:	540000ac 	b.gt	8800 <__sflush_r+0x110>
    87f0:	14000018 	b	8850 <__sflush_r+0x160>
    87f4:	8b20c2b5 	add	x21, x21, w0, sxtw
    87f8:	7100029f 	cmp	w20, #0x0
    87fc:	540002ad 	b.le	8850 <__sflush_r+0x160>
    8800:	f9401a61 	ldr	x1, [x19, #48]
    8804:	2a1403e3 	mov	w3, w20
    8808:	f9402264 	ldr	x4, [x19, #64]
    880c:	aa1503e2 	mov	x2, x21
    8810:	aa1603e0 	mov	x0, x22
    8814:	d63f0080 	blr	x4
    8818:	4b000294 	sub	w20, w20, w0
    881c:	7100001f 	cmp	w0, #0x0
    8820:	54fffeac 	b.gt	87f4 <__sflush_r+0x104>
    8824:	79402261 	ldrh	w1, [x19, #16]
    8828:	12800000 	mov	w0, #0xffffffff            	// #-1
    882c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8830:	321a0021 	orr	w1, w1, #0x40
    8834:	79002261 	strh	w1, [x19, #16]
    8838:	a94153f3 	ldp	x19, x20, [sp, #16]
    883c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8840:	d65f03c0 	ret
    8844:	b9407261 	ldr	w1, [x19, #112]
    8848:	7100003f 	cmp	w1, #0x0
    884c:	54fff6cc 	b.gt	8724 <__sflush_r+0x34>
    8850:	52800000 	mov	w0, #0x0                   	// #0
    8854:	a94153f3 	ldp	x19, x20, [sp, #16]
    8858:	a9425bf5 	ldp	x21, x22, [sp, #32]
    885c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8860:	d65f03c0 	ret
    8864:	f9404a62 	ldr	x2, [x19, #144]
    8868:	17ffffbf 	b	8764 <__sflush_r+0x74>
    886c:	79c02261 	ldrsh	w1, [x19, #16]
    8870:	f9400e62 	ldr	x2, [x19, #24]
    8874:	12147821 	and	w1, w1, #0xfffff7ff
    8878:	f9000262 	str	x2, [x19]
    887c:	b9000a7f 	str	wzr, [x19, #8]
    8880:	79002261 	strh	w1, [x19, #16]
    8884:	36600041 	tbz	w1, #12, 888c <__sflush_r+0x19c>
    8888:	f9004a60 	str	x0, [x19, #144]
    888c:	f9402e61 	ldr	x1, [x19, #88]
    8890:	b90002d4 	str	w20, [x22]
    8894:	b4fffde1 	cbz	x1, 8850 <__sflush_r+0x160>
    8898:	9101d260 	add	x0, x19, #0x74
    889c:	eb00003f 	cmp	x1, x0
    88a0:	54000060 	b.eq	88ac <__sflush_r+0x1bc>  // b.none
    88a4:	aa1603e0 	mov	x0, x22
    88a8:	940001f6 	bl	9080 <_free_r>
    88ac:	f9002e7f 	str	xzr, [x19, #88]
    88b0:	52800000 	mov	w0, #0x0                   	// #0
    88b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    88b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    88bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    88c0:	d65f03c0 	ret
    88c4:	d2800023 	mov	x3, #0x1                   	// #1
    88c8:	79c02261 	ldrsh	w1, [x19, #16]
    88cc:	f2a40803 	movk	x3, #0x2040, lsl #16
    88d0:	9ac22463 	lsr	x3, x3, x2
    88d4:	3607f6a3 	tbz	w3, #0, 87a8 <__sflush_r+0xb8>
    88d8:	f9400e63 	ldr	x3, [x19, #24]
    88dc:	12147821 	and	w1, w1, #0xfffff7ff
    88e0:	f9000263 	str	x3, [x19]
    88e4:	b9000a7f 	str	wzr, [x19, #8]
    88e8:	79002261 	strh	w1, [x19, #16]
    88ec:	3667fd01 	tbz	w1, #12, 888c <__sflush_r+0x19c>
    88f0:	35fffce2 	cbnz	w2, 888c <__sflush_r+0x19c>
    88f4:	17ffffe5 	b	8888 <__sflush_r+0x198>
    88f8:	b94002c0 	ldr	w0, [x22]
    88fc:	34fff300 	cbz	w0, 875c <__sflush_r+0x6c>
    8900:	7100741f 	cmp	w0, #0x1d
    8904:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    8908:	54fff8e1 	b.ne	8824 <__sflush_r+0x134>  // b.any
    890c:	52800000 	mov	w0, #0x0                   	// #0
    8910:	b90002d4 	str	w20, [x22]
    8914:	17ffffd0 	b	8854 <__sflush_r+0x164>
    8918:	d503201f 	nop
    891c:	d503201f 	nop

0000000000008920 <_fflush_r>:
    8920:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8924:	910003fd 	mov	x29, sp
    8928:	f9000bf3 	str	x19, [sp, #16]
    892c:	aa0003f3 	mov	x19, x0
    8930:	b4000060 	cbz	x0, 893c <_fflush_r+0x1c>
    8934:	b9405002 	ldr	w2, [x0, #80]
    8938:	340000e2 	cbz	w2, 8954 <_fflush_r+0x34>
    893c:	79c02020 	ldrsh	w0, [x1, #16]
    8940:	35000140 	cbnz	w0, 8968 <_fflush_r+0x48>
    8944:	52800000 	mov	w0, #0x0                   	// #0
    8948:	f9400bf3 	ldr	x19, [sp, #16]
    894c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8950:	d65f03c0 	ret
    8954:	f90017e1 	str	x1, [sp, #40]
    8958:	940000f2 	bl	8d20 <__sinit>
    895c:	f94017e1 	ldr	x1, [sp, #40]
    8960:	79c02020 	ldrsh	w0, [x1, #16]
    8964:	34ffff00 	cbz	w0, 8944 <_fflush_r+0x24>
    8968:	aa1303e0 	mov	x0, x19
    896c:	f9400bf3 	ldr	x19, [sp, #16]
    8970:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8974:	17ffff5f 	b	86f0 <__sflush_r>
    8978:	d503201f 	nop
    897c:	d503201f 	nop

0000000000008980 <fflush>:
    8980:	b4000340 	cbz	x0, 89e8 <fflush+0x68>
    8984:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    8988:	910003fd 	mov	x29, sp
    898c:	a90153f3 	stp	x19, x20, [sp, #16]
    8990:	aa0003f3 	mov	x19, x0
    8994:	f0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    8998:	f9411814 	ldr	x20, [x0, #560]
    899c:	b4000074 	cbz	x20, 89a8 <fflush+0x28>
    89a0:	b9405280 	ldr	w0, [x20, #80]
    89a4:	34000180 	cbz	w0, 89d4 <fflush+0x54>
    89a8:	79c02260 	ldrsh	w0, [x19, #16]
    89ac:	350000a0 	cbnz	w0, 89c0 <fflush+0x40>
    89b0:	52800000 	mov	w0, #0x0                   	// #0
    89b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    89b8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    89bc:	d65f03c0 	ret
    89c0:	aa1303e1 	mov	x1, x19
    89c4:	aa1403e0 	mov	x0, x20
    89c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    89cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    89d0:	17ffff48 	b	86f0 <__sflush_r>
    89d4:	aa1403e0 	mov	x0, x20
    89d8:	940000d2 	bl	8d20 <__sinit>
    89dc:	79c02260 	ldrsh	w0, [x19, #16]
    89e0:	34fffe80 	cbz	w0, 89b0 <fflush+0x30>
    89e4:	17fffff7 	b	89c0 <fflush+0x40>
    89e8:	d0000020 	adrp	x0, e000 <__func__.0+0x280>
    89ec:	90000001 	adrp	x1, 8000 <_vfiprintf_r+0x1900>
    89f0:	91248021 	add	x1, x1, #0x920
    89f4:	f941b800 	ldr	x0, [x0, #880]
    89f8:	140003b2 	b	98c0 <_fwalk_reent>
    89fc:	d503201f 	nop

0000000000008a00 <__fp_lock>:
    8a00:	52800000 	mov	w0, #0x0                   	// #0
    8a04:	d65f03c0 	ret
    8a08:	d503201f 	nop
    8a0c:	d503201f 	nop

0000000000008a10 <_cleanup_r>:
    8a10:	b0000021 	adrp	x1, d000 <__ascii_wctomb+0x30>
    8a14:	91120021 	add	x1, x1, #0x480
    8a18:	140003aa 	b	98c0 <_fwalk_reent>
    8a1c:	d503201f 	nop

0000000000008a20 <__fp_unlock>:
    8a20:	52800000 	mov	w0, #0x0                   	// #0
    8a24:	d65f03c0 	ret
    8a28:	d503201f 	nop
    8a2c:	d503201f 	nop

0000000000008a30 <__sinit.part.0>:
    8a30:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    8a34:	52800065 	mov	w5, #0x3                   	// #3
    8a38:	90000001 	adrp	x1, 8000 <_vfiprintf_r+0x1900>
    8a3c:	910003fd 	mov	x29, sp
    8a40:	a9025bf5 	stp	x21, x22, [sp, #32]
    8a44:	aa0003f5 	mov	x21, x0
    8a48:	9114e2a4 	add	x4, x21, #0x538
    8a4c:	a90153f3 	stp	x19, x20, [sp, #16]
    8a50:	91284020 	add	x0, x1, #0xa10
    8a54:	52800083 	mov	w3, #0x4                   	// #4
    8a58:	f94006b3 	ldr	x19, [x21, #8]
    8a5c:	a90363f7 	stp	x23, x24, [sp, #48]
    8a60:	d2800102 	mov	x2, #0x8                   	// #8
    8a64:	f90023f9 	str	x25, [sp, #64]
    8a68:	52800001 	mov	w1, #0x0                   	// #0
    8a6c:	f9002ea0 	str	x0, [x21, #88]
    8a70:	91029260 	add	x0, x19, #0xa4
    8a74:	f90292bf 	str	xzr, [x21, #1312]
    8a78:	90000038 	adrp	x24, c000 <_raise_r+0x40>
    8a7c:	b9052aa5 	str	w5, [x21, #1320]
    8a80:	91120318 	add	x24, x24, #0x480
    8a84:	f9029aa4 	str	x4, [x21, #1328]
    8a88:	90000037 	adrp	x23, c000 <_raise_r+0x40>
    8a8c:	a9007e7f 	stp	xzr, xzr, [x19]
    8a90:	9113c2f7 	add	x23, x23, #0x4f0
    8a94:	90000036 	adrp	x22, c000 <_raise_r+0x40>
    8a98:	b9001263 	str	w3, [x19, #16]
    8a9c:	911502d6 	add	x22, x22, #0x540
    8aa0:	f9000e7f 	str	xzr, [x19, #24]
    8aa4:	90000039 	adrp	x25, c000 <_raise_r+0x40>
    8aa8:	b900227f 	str	wzr, [x19, #32]
    8aac:	91108339 	add	x25, x25, #0x420
    8ab0:	b9002a7f 	str	wzr, [x19, #40]
    8ab4:	b900ae7f 	str	wzr, [x19, #172]
    8ab8:	97fff522 	bl	5f40 <memset>
    8abc:	f9400ab4 	ldr	x20, [x21, #16]
    8ac0:	52800123 	mov	w3, #0x9                   	// #9
    8ac4:	a9036673 	stp	x19, x25, [x19, #48]
    8ac8:	72a00023 	movk	w3, #0x1, lsl #16
    8acc:	91029280 	add	x0, x20, #0xa4
    8ad0:	a9045e78 	stp	x24, x23, [x19, #64]
    8ad4:	d2800102 	mov	x2, #0x8                   	// #8
    8ad8:	52800001 	mov	w1, #0x0                   	// #0
    8adc:	f9002a76 	str	x22, [x19, #80]
    8ae0:	a9007e9f 	stp	xzr, xzr, [x20]
    8ae4:	b9001283 	str	w3, [x20, #16]
    8ae8:	f9000e9f 	str	xzr, [x20, #24]
    8aec:	b900229f 	str	wzr, [x20, #32]
    8af0:	b9002a9f 	str	wzr, [x20, #40]
    8af4:	b900ae9f 	str	wzr, [x20, #172]
    8af8:	97fff512 	bl	5f40 <memset>
    8afc:	f9400eb3 	ldr	x19, [x21, #24]
    8b00:	52800243 	mov	w3, #0x12                  	// #18
    8b04:	a9036694 	stp	x20, x25, [x20, #48]
    8b08:	72a00043 	movk	w3, #0x2, lsl #16
    8b0c:	91029260 	add	x0, x19, #0xa4
    8b10:	a9045e98 	stp	x24, x23, [x20, #64]
    8b14:	d2800102 	mov	x2, #0x8                   	// #8
    8b18:	52800001 	mov	w1, #0x0                   	// #0
    8b1c:	f9002a96 	str	x22, [x20, #80]
    8b20:	a9007e7f 	stp	xzr, xzr, [x19]
    8b24:	b9001263 	str	w3, [x19, #16]
    8b28:	f9000e7f 	str	xzr, [x19, #24]
    8b2c:	b900227f 	str	wzr, [x19, #32]
    8b30:	b9002a7f 	str	wzr, [x19, #40]
    8b34:	b900ae7f 	str	wzr, [x19, #172]
    8b38:	97fff502 	bl	5f40 <memset>
    8b3c:	a9036673 	stp	x19, x25, [x19, #48]
    8b40:	52800020 	mov	w0, #0x1                   	// #1
    8b44:	a9045e78 	stp	x24, x23, [x19, #64]
    8b48:	f9002a76 	str	x22, [x19, #80]
    8b4c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8b50:	a94363f7 	ldp	x23, x24, [sp, #48]
    8b54:	f94023f9 	ldr	x25, [sp, #64]
    8b58:	b90052a0 	str	w0, [x21, #80]
    8b5c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8b60:	a8c57bfd 	ldp	x29, x30, [sp], #80
    8b64:	d65f03c0 	ret
    8b68:	d503201f 	nop
    8b6c:	d503201f 	nop

0000000000008b70 <__sfmoreglue>:
    8b70:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8b74:	52801602 	mov	w2, #0xb0                  	// #176
    8b78:	910003fd 	mov	x29, sp
    8b7c:	a90153f3 	stp	x19, x20, [sp, #16]
    8b80:	51000434 	sub	w20, w1, #0x1
    8b84:	f90013f5 	str	x21, [sp, #32]
    8b88:	2a0103f5 	mov	w21, w1
    8b8c:	9b227e94 	smull	x20, w20, w2
    8b90:	91032281 	add	x1, x20, #0xc8
    8b94:	9400075b 	bl	a900 <_malloc_r>
    8b98:	aa0003f3 	mov	x19, x0
    8b9c:	b4000100 	cbz	x0, 8bbc <__sfmoreglue+0x4c>
    8ba0:	91006000 	add	x0, x0, #0x18
    8ba4:	f900027f 	str	xzr, [x19]
    8ba8:	b9000a75 	str	w21, [x19, #8]
    8bac:	9102c282 	add	x2, x20, #0xb0
    8bb0:	f9000a60 	str	x0, [x19, #16]
    8bb4:	52800001 	mov	w1, #0x0                   	// #0
    8bb8:	97fff4e2 	bl	5f40 <memset>
    8bbc:	aa1303e0 	mov	x0, x19
    8bc0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8bc4:	f94013f5 	ldr	x21, [sp, #32]
    8bc8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8bcc:	d65f03c0 	ret

0000000000008bd0 <__sfp>:
    8bd0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    8bd4:	d0000021 	adrp	x1, e000 <__func__.0+0x280>
    8bd8:	910003fd 	mov	x29, sp
    8bdc:	a90153f3 	stp	x19, x20, [sp, #16]
    8be0:	f941b834 	ldr	x20, [x1, #880]
    8be4:	f9001fe0 	str	x0, [sp, #56]
    8be8:	f90013f5 	str	x21, [sp, #32]
    8bec:	b9405280 	ldr	w0, [x20, #80]
    8bf0:	34000560 	cbz	w0, 8c9c <__sfp+0xcc>
    8bf4:	91148294 	add	x20, x20, #0x520
    8bf8:	52800095 	mov	w21, #0x4                   	// #4
    8bfc:	b9400a80 	ldr	w0, [x20, #8]
    8c00:	f9400a93 	ldr	x19, [x20, #16]
    8c04:	7100001f 	cmp	w0, #0x0
    8c08:	5400042d 	b.le	8c8c <__sfp+0xbc>
    8c0c:	51000400 	sub	w0, w0, #0x1
    8c10:	91000400 	add	x0, x0, #0x1
    8c14:	8b000401 	add	x1, x0, x0, lsl #1
    8c18:	d37ef421 	lsl	x1, x1, #2
    8c1c:	cb000021 	sub	x1, x1, x0
    8c20:	8b011261 	add	x1, x19, x1, lsl #4
    8c24:	14000004 	b	8c34 <__sfp+0x64>
    8c28:	9102c273 	add	x19, x19, #0xb0
    8c2c:	eb01027f 	cmp	x19, x1
    8c30:	540002e0 	b.eq	8c8c <__sfp+0xbc>  // b.none
    8c34:	79c02260 	ldrsh	w0, [x19, #16]
    8c38:	35ffff80 	cbnz	w0, 8c28 <__sfp+0x58>
    8c3c:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    8c40:	a9007e7f 	stp	xzr, xzr, [x19]
    8c44:	d2800102 	mov	x2, #0x8                   	// #8
    8c48:	b9001260 	str	w0, [x19, #16]
    8c4c:	52800001 	mov	w1, #0x0                   	// #0
    8c50:	f9000e7f 	str	xzr, [x19, #24]
    8c54:	91029260 	add	x0, x19, #0xa4
    8c58:	b900227f 	str	wzr, [x19, #32]
    8c5c:	b9002a7f 	str	wzr, [x19, #40]
    8c60:	b900ae7f 	str	wzr, [x19, #172]
    8c64:	97fff4b7 	bl	5f40 <memset>
    8c68:	f9002e7f 	str	xzr, [x19, #88]
    8c6c:	b900627f 	str	wzr, [x19, #96]
    8c70:	f9003e7f 	str	xzr, [x19, #120]
    8c74:	b900827f 	str	wzr, [x19, #128]
    8c78:	aa1303e0 	mov	x0, x19
    8c7c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8c80:	f94013f5 	ldr	x21, [sp, #32]
    8c84:	a8c47bfd 	ldp	x29, x30, [sp], #64
    8c88:	d65f03c0 	ret
    8c8c:	f9400293 	ldr	x19, [x20]
    8c90:	b40000d3 	cbz	x19, 8ca8 <__sfp+0xd8>
    8c94:	aa1303f4 	mov	x20, x19
    8c98:	17ffffd9 	b	8bfc <__sfp+0x2c>
    8c9c:	aa1403e0 	mov	x0, x20
    8ca0:	97ffff64 	bl	8a30 <__sinit.part.0>
    8ca4:	17ffffd4 	b	8bf4 <__sfp+0x24>
    8ca8:	f9401fe0 	ldr	x0, [sp, #56]
    8cac:	d2805b01 	mov	x1, #0x2d8                 	// #728
    8cb0:	94000714 	bl	a900 <_malloc_r>
    8cb4:	aa0003f3 	mov	x19, x0
    8cb8:	b4000160 	cbz	x0, 8ce4 <__sfp+0x114>
    8cbc:	91006000 	add	x0, x0, #0x18
    8cc0:	f900027f 	str	xzr, [x19]
    8cc4:	b9000a75 	str	w21, [x19, #8]
    8cc8:	d2805802 	mov	x2, #0x2c0                 	// #704
    8ccc:	f9000a60 	str	x0, [x19, #16]
    8cd0:	52800001 	mov	w1, #0x0                   	// #0
    8cd4:	97fff49b 	bl	5f40 <memset>
    8cd8:	f9000293 	str	x19, [x20]
    8cdc:	aa1303f4 	mov	x20, x19
    8ce0:	17ffffc7 	b	8bfc <__sfp+0x2c>
    8ce4:	f9401fe1 	ldr	x1, [sp, #56]
    8ce8:	f900029f 	str	xzr, [x20]
    8cec:	52800180 	mov	w0, #0xc                   	// #12
    8cf0:	b9000020 	str	w0, [x1]
    8cf4:	17ffffe1 	b	8c78 <__sfp+0xa8>
    8cf8:	d503201f 	nop
    8cfc:	d503201f 	nop

0000000000008d00 <_cleanup>:
    8d00:	d0000020 	adrp	x0, e000 <__func__.0+0x280>
    8d04:	b0000021 	adrp	x1, d000 <__ascii_wctomb+0x30>
    8d08:	91120021 	add	x1, x1, #0x480
    8d0c:	f941b800 	ldr	x0, [x0, #880]
    8d10:	140002ec 	b	98c0 <_fwalk_reent>
    8d14:	d503201f 	nop
    8d18:	d503201f 	nop
    8d1c:	d503201f 	nop

0000000000008d20 <__sinit>:
    8d20:	b9405001 	ldr	w1, [x0, #80]
    8d24:	34000041 	cbz	w1, 8d2c <__sinit+0xc>
    8d28:	d65f03c0 	ret
    8d2c:	17ffff41 	b	8a30 <__sinit.part.0>

0000000000008d30 <__sfp_lock_acquire>:
    8d30:	d65f03c0 	ret
    8d34:	d503201f 	nop
    8d38:	d503201f 	nop
    8d3c:	d503201f 	nop

0000000000008d40 <__sfp_lock_release>:
    8d40:	d65f03c0 	ret
    8d44:	d503201f 	nop
    8d48:	d503201f 	nop
    8d4c:	d503201f 	nop

0000000000008d50 <__sinit_lock_acquire>:
    8d50:	d65f03c0 	ret
    8d54:	d503201f 	nop
    8d58:	d503201f 	nop
    8d5c:	d503201f 	nop

0000000000008d60 <__sinit_lock_release>:
    8d60:	d65f03c0 	ret
    8d64:	d503201f 	nop
    8d68:	d503201f 	nop
    8d6c:	d503201f 	nop

0000000000008d70 <__fp_lock_all>:
    8d70:	f0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    8d74:	90000001 	adrp	x1, 8000 <_vfiprintf_r+0x1900>
    8d78:	91280021 	add	x1, x1, #0xa00
    8d7c:	f9411800 	ldr	x0, [x0, #560]
    8d80:	140002a8 	b	9820 <_fwalk>
    8d84:	d503201f 	nop
    8d88:	d503201f 	nop
    8d8c:	d503201f 	nop

0000000000008d90 <__fp_unlock_all>:
    8d90:	f0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    8d94:	90000001 	adrp	x1, 8000 <_vfiprintf_r+0x1900>
    8d98:	91288021 	add	x1, x1, #0xa20
    8d9c:	f9411800 	ldr	x0, [x0, #560]
    8da0:	140002a0 	b	9820 <_fwalk>
    8da4:	d503201f 	nop
    8da8:	d503201f 	nop
    8dac:	d503201f 	nop

0000000000008db0 <__fputwc>:
    8db0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    8db4:	910003fd 	mov	x29, sp
    8db8:	a90153f3 	stp	x19, x20, [sp, #16]
    8dbc:	aa0203f3 	mov	x19, x2
    8dc0:	a9025bf5 	stp	x21, x22, [sp, #32]
    8dc4:	2a0103f6 	mov	w22, w1
    8dc8:	a90363f7 	stp	x23, x24, [sp, #48]
    8dcc:	aa0003f7 	mov	x23, x0
    8dd0:	9400062c 	bl	a680 <__locale_mb_cur_max>
    8dd4:	7100041f 	cmp	w0, #0x1
    8dd8:	54000081 	b.ne	8de8 <__fputwc+0x38>  // b.any
    8ddc:	510006c0 	sub	w0, w22, #0x1
    8de0:	7103f81f 	cmp	w0, #0xfe
    8de4:	54000509 	b.ls	8e84 <__fputwc+0xd4>  // b.plast
    8de8:	91029263 	add	x3, x19, #0xa4
    8dec:	2a1603e2 	mov	w2, w22
    8df0:	910123e1 	add	x1, sp, #0x48
    8df4:	aa1703e0 	mov	x0, x23
    8df8:	97fffd5e 	bl	8370 <_wcrtomb_r>
    8dfc:	aa0003f5 	mov	x21, x0
    8e00:	b100041f 	cmn	x0, #0x1
    8e04:	54000540 	b.eq	8eac <__fputwc+0xfc>  // b.none
    8e08:	b4000460 	cbz	x0, 8e94 <__fputwc+0xe4>
    8e0c:	394123e1 	ldrb	w1, [sp, #72]
    8e10:	910123f8 	add	x24, sp, #0x48
    8e14:	d2800014 	mov	x20, #0x0                   	// #0
    8e18:	14000009 	b	8e3c <__fputwc+0x8c>
    8e1c:	f9400263 	ldr	x3, [x19]
    8e20:	91000464 	add	x4, x3, #0x1
    8e24:	f9000264 	str	x4, [x19]
    8e28:	39000061 	strb	w1, [x3]
    8e2c:	91000694 	add	x20, x20, #0x1
    8e30:	eb15029f 	cmp	x20, x21
    8e34:	54000302 	b.cs	8e94 <__fputwc+0xe4>  // b.hs, b.nlast
    8e38:	38786a81 	ldrb	w1, [x20, x24]
    8e3c:	b9400e63 	ldr	w3, [x19, #12]
    8e40:	51000463 	sub	w3, w3, #0x1
    8e44:	b9000e63 	str	w3, [x19, #12]
    8e48:	36fffea3 	tbz	w3, #31, 8e1c <__fputwc+0x6c>
    8e4c:	b9402a64 	ldr	w4, [x19, #40]
    8e50:	aa1303e2 	mov	x2, x19
    8e54:	aa1703e0 	mov	x0, x23
    8e58:	6b04007f 	cmp	w3, w4
    8e5c:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    8e60:	54fffde1 	b.ne	8e1c <__fputwc+0x6c>  // b.any
    8e64:	94000f7b 	bl	cc50 <__swbuf_r>
    8e68:	3100041f 	cmn	w0, #0x1
    8e6c:	54fffe01 	b.ne	8e2c <__fputwc+0x7c>  // b.any
    8e70:	a94153f3 	ldp	x19, x20, [sp, #16]
    8e74:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8e78:	a94363f7 	ldp	x23, x24, [sp, #48]
    8e7c:	a8c57bfd 	ldp	x29, x30, [sp], #80
    8e80:	d65f03c0 	ret
    8e84:	12001ec1 	and	w1, w22, #0xff
    8e88:	d2800035 	mov	x21, #0x1                   	// #1
    8e8c:	390123e1 	strb	w1, [sp, #72]
    8e90:	17ffffe0 	b	8e10 <__fputwc+0x60>
    8e94:	2a1603e0 	mov	w0, w22
    8e98:	a94153f3 	ldp	x19, x20, [sp, #16]
    8e9c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8ea0:	a94363f7 	ldp	x23, x24, [sp, #48]
    8ea4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    8ea8:	d65f03c0 	ret
    8eac:	79402261 	ldrh	w1, [x19, #16]
    8eb0:	321a0021 	orr	w1, w1, #0x40
    8eb4:	79002261 	strh	w1, [x19, #16]
    8eb8:	17ffffee 	b	8e70 <__fputwc+0xc0>
    8ebc:	d503201f 	nop

0000000000008ec0 <_fputwc_r>:
    8ec0:	79c02043 	ldrsh	w3, [x2, #16]
    8ec4:	376800c3 	tbnz	w3, #13, 8edc <_fputwc_r+0x1c>
    8ec8:	b940ac44 	ldr	w4, [x2, #172]
    8ecc:	32130063 	orr	w3, w3, #0x2000
    8ed0:	79002043 	strh	w3, [x2, #16]
    8ed4:	32130083 	orr	w3, w4, #0x2000
    8ed8:	b900ac43 	str	w3, [x2, #172]
    8edc:	17ffffb5 	b	8db0 <__fputwc>

0000000000008ee0 <fputwc>:
    8ee0:	f0000023 	adrp	x3, f000 <IpcFsServer+0x5d8>
    8ee4:	aa0103e2 	mov	x2, x1
    8ee8:	2a0003e1 	mov	w1, w0
    8eec:	f9411860 	ldr	x0, [x3, #560]
    8ef0:	b4000060 	cbz	x0, 8efc <fputwc+0x1c>
    8ef4:	b9405003 	ldr	w3, [x0, #80]
    8ef8:	34000123 	cbz	w3, 8f1c <fputwc+0x3c>
    8efc:	79c02043 	ldrsh	w3, [x2, #16]
    8f00:	376800c3 	tbnz	w3, #13, 8f18 <fputwc+0x38>
    8f04:	b940ac44 	ldr	w4, [x2, #172]
    8f08:	32130063 	orr	w3, w3, #0x2000
    8f0c:	79002043 	strh	w3, [x2, #16]
    8f10:	32130083 	orr	w3, w4, #0x2000
    8f14:	b900ac43 	str	w3, [x2, #172]
    8f18:	17ffffa6 	b	8db0 <__fputwc>
    8f1c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8f20:	910003fd 	mov	x29, sp
    8f24:	f9000fe0 	str	x0, [sp, #24]
    8f28:	b90027e1 	str	w1, [sp, #36]
    8f2c:	f90017e2 	str	x2, [sp, #40]
    8f30:	97ffff7c 	bl	8d20 <__sinit>
    8f34:	f94017e2 	ldr	x2, [sp, #40]
    8f38:	b94027e1 	ldr	w1, [sp, #36]
    8f3c:	f9400fe0 	ldr	x0, [sp, #24]
    8f40:	79c02043 	ldrsh	w3, [x2, #16]
    8f44:	376800c3 	tbnz	w3, #13, 8f5c <fputwc+0x7c>
    8f48:	b940ac44 	ldr	w4, [x2, #172]
    8f4c:	32130063 	orr	w3, w3, #0x2000
    8f50:	79002043 	strh	w3, [x2, #16]
    8f54:	32130083 	orr	w3, w4, #0x2000
    8f58:	b900ac43 	str	w3, [x2, #172]
    8f5c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8f60:	17ffff94 	b	8db0 <__fputwc>
    8f64:	d503201f 	nop
    8f68:	d503201f 	nop
    8f6c:	d503201f 	nop

0000000000008f70 <_malloc_trim_r>:
    8f70:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    8f74:	910003fd 	mov	x29, sp
    8f78:	a9025bf5 	stp	x21, x22, [sp, #32]
    8f7c:	f0000036 	adrp	x22, f000 <IpcFsServer+0x5d8>
    8f80:	912d22d6 	add	x22, x22, #0xb48
    8f84:	aa0003f5 	mov	x21, x0
    8f88:	a90153f3 	stp	x19, x20, [sp, #16]
    8f8c:	aa0103f3 	mov	x19, x1
    8f90:	94000a64 	bl	b920 <__malloc_lock>
    8f94:	f9400ac0 	ldr	x0, [x22, #16]
    8f98:	f9400414 	ldr	x20, [x0, #8]
    8f9c:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    8fa0:	cb130293 	sub	x19, x20, x19
    8fa4:	913f7e73 	add	x19, x19, #0xfdf
    8fa8:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    8fac:	d1400673 	sub	x19, x19, #0x1, lsl #12
    8fb0:	f13ffe7f 	cmp	x19, #0xfff
    8fb4:	5400010d 	b.le	8fd4 <_malloc_trim_r+0x64>
    8fb8:	d2800001 	mov	x1, #0x0                   	// #0
    8fbc:	aa1503e0 	mov	x0, x21
    8fc0:	94000bb0 	bl	be80 <_sbrk_r>
    8fc4:	f9400ac1 	ldr	x1, [x22, #16]
    8fc8:	8b140021 	add	x1, x1, x20
    8fcc:	eb01001f 	cmp	x0, x1
    8fd0:	54000100 	b.eq	8ff0 <_malloc_trim_r+0x80>  // b.none
    8fd4:	aa1503e0 	mov	x0, x21
    8fd8:	94000a56 	bl	b930 <__malloc_unlock>
    8fdc:	52800000 	mov	w0, #0x0                   	// #0
    8fe0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8fe4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8fe8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    8fec:	d65f03c0 	ret
    8ff0:	cb1303e1 	neg	x1, x19
    8ff4:	aa1503e0 	mov	x0, x21
    8ff8:	94000ba2 	bl	be80 <_sbrk_r>
    8ffc:	b100041f 	cmn	x0, #0x1
    9000:	54000200 	b.eq	9040 <_malloc_trim_r+0xd0>  // b.none
    9004:	f00004e2 	adrp	x2, a8000 <_stack+0x28000>
    9008:	cb130294 	sub	x20, x20, x19
    900c:	f9400ac3 	ldr	x3, [x22, #16]
    9010:	b2400294 	orr	x20, x20, #0x1
    9014:	b9495041 	ldr	w1, [x2, #2384]
    9018:	aa1503e0 	mov	x0, x21
    901c:	f9000474 	str	x20, [x3, #8]
    9020:	4b130033 	sub	w19, w1, w19
    9024:	b9095053 	str	w19, [x2, #2384]
    9028:	94000a42 	bl	b930 <__malloc_unlock>
    902c:	52800020 	mov	w0, #0x1                   	// #1
    9030:	a94153f3 	ldp	x19, x20, [sp, #16]
    9034:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9038:	a8c37bfd 	ldp	x29, x30, [sp], #48
    903c:	d65f03c0 	ret
    9040:	d2800001 	mov	x1, #0x0                   	// #0
    9044:	aa1503e0 	mov	x0, x21
    9048:	94000b8e 	bl	be80 <_sbrk_r>
    904c:	f9400ac2 	ldr	x2, [x22, #16]
    9050:	cb020001 	sub	x1, x0, x2
    9054:	f1007c3f 	cmp	x1, #0x1f
    9058:	54fffbed 	b.le	8fd4 <_malloc_trim_r+0x64>
    905c:	f0000024 	adrp	x4, 10000 <__malloc_av_+0x4b8>
    9060:	b2400021 	orr	x1, x1, #0x1
    9064:	f9000441 	str	x1, [x2, #8]
    9068:	f00004e3 	adrp	x3, a8000 <_stack+0x28000>
    906c:	f941ac81 	ldr	x1, [x4, #856]
    9070:	cb010000 	sub	x0, x0, x1
    9074:	b9095060 	str	w0, [x3, #2384]
    9078:	17ffffd7 	b	8fd4 <_malloc_trim_r+0x64>
    907c:	d503201f 	nop

0000000000009080 <_free_r>:
    9080:	b4000a21 	cbz	x1, 91c4 <_free_r+0x144>
    9084:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9088:	910003fd 	mov	x29, sp
    908c:	a90153f3 	stp	x19, x20, [sp, #16]
    9090:	aa0103f3 	mov	x19, x1
    9094:	aa0003f4 	mov	x20, x0
    9098:	94000a22 	bl	b920 <__malloc_lock>
    909c:	f85f8265 	ldur	x5, [x19, #-8]
    90a0:	d1004263 	sub	x3, x19, #0x10
    90a4:	d0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    90a8:	912d2000 	add	x0, x0, #0xb48
    90ac:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    90b0:	8b020064 	add	x4, x3, x2
    90b4:	f9400806 	ldr	x6, [x0, #16]
    90b8:	f9400481 	ldr	x1, [x4, #8]
    90bc:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    90c0:	eb0400df 	cmp	x6, x4
    90c4:	54000c60 	b.eq	9250 <_free_r+0x1d0>  // b.none
    90c8:	f9000481 	str	x1, [x4, #8]
    90cc:	8b010086 	add	x6, x4, x1
    90d0:	37000345 	tbnz	w5, #0, 9138 <_free_r+0xb8>
    90d4:	f85f0267 	ldur	x7, [x19, #-16]
    90d8:	d0000025 	adrp	x5, f000 <IpcFsServer+0x5d8>
    90dc:	f94004c6 	ldr	x6, [x6, #8]
    90e0:	cb070063 	sub	x3, x3, x7
    90e4:	8b070042 	add	x2, x2, x7
    90e8:	912d60a5 	add	x5, x5, #0xb58
    90ec:	924000c6 	and	x6, x6, #0x1
    90f0:	f9400867 	ldr	x7, [x3, #16]
    90f4:	eb0500ff 	cmp	x7, x5
    90f8:	54000940 	b.eq	9220 <_free_r+0x1a0>  // b.none
    90fc:	f9400c68 	ldr	x8, [x3, #24]
    9100:	f9000ce8 	str	x8, [x7, #24]
    9104:	f9000907 	str	x7, [x8, #16]
    9108:	b50001c6 	cbnz	x6, 9140 <_free_r+0xc0>
    910c:	8b010042 	add	x2, x2, x1
    9110:	f9400881 	ldr	x1, [x4, #16]
    9114:	b2400046 	orr	x6, x2, #0x1
    9118:	eb05003f 	cmp	x1, x5
    911c:	54000ee0 	b.eq	92f8 <_free_r+0x278>  // b.none
    9120:	f9400c84 	ldr	x4, [x4, #24]
    9124:	f9000c24 	str	x4, [x1, #24]
    9128:	f9000881 	str	x1, [x4, #16]
    912c:	f9000466 	str	x6, [x3, #8]
    9130:	f8226862 	str	x2, [x3, x2]
    9134:	14000006 	b	914c <_free_r+0xcc>
    9138:	f94004c5 	ldr	x5, [x6, #8]
    913c:	36000465 	tbz	w5, #0, 91c8 <_free_r+0x148>
    9140:	b2400041 	orr	x1, x2, #0x1
    9144:	f9000461 	str	x1, [x3, #8]
    9148:	f9000082 	str	x2, [x4]
    914c:	f107fc5f 	cmp	x2, #0x1ff
    9150:	54000449 	b.ls	91d8 <_free_r+0x158>  // b.plast
    9154:	d349fc41 	lsr	x1, x2, #9
    9158:	f127fc5f 	cmp	x2, #0x9ff
    915c:	54000a28 	b.hi	92a0 <_free_r+0x220>  // b.pmore
    9160:	d346fc41 	lsr	x1, x2, #6
    9164:	1100e424 	add	w4, w1, #0x39
    9168:	1100e025 	add	w5, w1, #0x38
    916c:	531f7884 	lsl	w4, w4, #1
    9170:	937d7c84 	sbfiz	x4, x4, #3, #32
    9174:	8b040004 	add	x4, x0, x4
    9178:	f85f0481 	ldr	x1, [x4], #-16
    917c:	eb01009f 	cmp	x4, x1
    9180:	54000ae0 	b.eq	92dc <_free_r+0x25c>  // b.none
    9184:	d503201f 	nop
    9188:	f9400420 	ldr	x0, [x1, #8]
    918c:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9190:	eb02001f 	cmp	x0, x2
    9194:	54000089 	b.ls	91a4 <_free_r+0x124>  // b.plast
    9198:	f9400821 	ldr	x1, [x1, #16]
    919c:	eb01009f 	cmp	x4, x1
    91a0:	54ffff41 	b.ne	9188 <_free_r+0x108>  // b.any
    91a4:	f9400c24 	ldr	x4, [x1, #24]
    91a8:	a9011061 	stp	x1, x4, [x3, #16]
    91ac:	aa1403e0 	mov	x0, x20
    91b0:	f9000883 	str	x3, [x4, #16]
    91b4:	f9000c23 	str	x3, [x1, #24]
    91b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    91bc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    91c0:	140009dc 	b	b930 <__malloc_unlock>
    91c4:	d65f03c0 	ret
    91c8:	d0000025 	adrp	x5, f000 <IpcFsServer+0x5d8>
    91cc:	8b010042 	add	x2, x2, x1
    91d0:	912d60a5 	add	x5, x5, #0xb58
    91d4:	17ffffcf 	b	9110 <_free_r+0x90>
    91d8:	d343fc42 	lsr	x2, x2, #3
    91dc:	d2800024 	mov	x4, #0x1                   	// #1
    91e0:	11000441 	add	w1, w2, #0x1
    91e4:	f9400405 	ldr	x5, [x0, #8]
    91e8:	531f7821 	lsl	w1, w1, #1
    91ec:	13027c42 	asr	w2, w2, #2
    91f0:	8b21cc01 	add	x1, x0, w1, sxtw #3
    91f4:	9ac22082 	lsl	x2, x4, x2
    91f8:	aa050042 	orr	x2, x2, x5
    91fc:	f9000402 	str	x2, [x0, #8]
    9200:	f85f0420 	ldr	x0, [x1], #-16
    9204:	a9010460 	stp	x0, x1, [x3, #16]
    9208:	f9000823 	str	x3, [x1, #16]
    920c:	f9000c03 	str	x3, [x0, #24]
    9210:	aa1403e0 	mov	x0, x20
    9214:	a94153f3 	ldp	x19, x20, [sp, #16]
    9218:	a8c27bfd 	ldp	x29, x30, [sp], #32
    921c:	140009c5 	b	b930 <__malloc_unlock>
    9220:	b50009c6 	cbnz	x6, 9358 <_free_r+0x2d8>
    9224:	a9410085 	ldp	x5, x0, [x4, #16]
    9228:	8b020021 	add	x1, x1, x2
    922c:	f9000ca0 	str	x0, [x5, #24]
    9230:	b2400022 	orr	x2, x1, #0x1
    9234:	f9000805 	str	x5, [x0, #16]
    9238:	aa1403e0 	mov	x0, x20
    923c:	f9000462 	str	x2, [x3, #8]
    9240:	f8216861 	str	x1, [x3, x1]
    9244:	a94153f3 	ldp	x19, x20, [sp, #16]
    9248:	a8c27bfd 	ldp	x29, x30, [sp], #32
    924c:	140009b9 	b	b930 <__malloc_unlock>
    9250:	8b010041 	add	x1, x2, x1
    9254:	370000e5 	tbnz	w5, #0, 9270 <_free_r+0x1f0>
    9258:	f85f0262 	ldur	x2, [x19, #-16]
    925c:	cb020063 	sub	x3, x3, x2
    9260:	8b020021 	add	x1, x1, x2
    9264:	a9410864 	ldp	x4, x2, [x3, #16]
    9268:	f9000c82 	str	x2, [x4, #24]
    926c:	f9000844 	str	x4, [x2, #16]
    9270:	f0000022 	adrp	x2, 10000 <__malloc_av_+0x4b8>
    9274:	b2400024 	orr	x4, x1, #0x1
    9278:	f9000464 	str	x4, [x3, #8]
    927c:	f941b042 	ldr	x2, [x2, #864]
    9280:	f9000803 	str	x3, [x0, #16]
    9284:	eb01005f 	cmp	x2, x1
    9288:	54fffc48 	b.hi	9210 <_free_r+0x190>  // b.pmore
    928c:	f00004e1 	adrp	x1, a8000 <_stack+0x28000>
    9290:	aa1403e0 	mov	x0, x20
    9294:	f944c421 	ldr	x1, [x1, #2440]
    9298:	97ffff36 	bl	8f70 <_malloc_trim_r>
    929c:	17ffffdd 	b	9210 <_free_r+0x190>
    92a0:	f100503f 	cmp	x1, #0x14
    92a4:	54000129 	b.ls	92c8 <_free_r+0x248>  // b.plast
    92a8:	f101503f 	cmp	x1, #0x54
    92ac:	54000308 	b.hi	930c <_free_r+0x28c>  // b.pmore
    92b0:	d34cfc41 	lsr	x1, x2, #12
    92b4:	1101bc24 	add	w4, w1, #0x6f
    92b8:	1101b825 	add	w5, w1, #0x6e
    92bc:	531f7884 	lsl	w4, w4, #1
    92c0:	937d7c84 	sbfiz	x4, x4, #3, #32
    92c4:	17ffffac 	b	9174 <_free_r+0xf4>
    92c8:	11017024 	add	w4, w1, #0x5c
    92cc:	11016c25 	add	w5, w1, #0x5b
    92d0:	531f7884 	lsl	w4, w4, #1
    92d4:	937d7c84 	sbfiz	x4, x4, #3, #32
    92d8:	17ffffa7 	b	9174 <_free_r+0xf4>
    92dc:	f9400406 	ldr	x6, [x0, #8]
    92e0:	13027ca5 	asr	w5, w5, #2
    92e4:	d2800022 	mov	x2, #0x1                   	// #1
    92e8:	9ac52045 	lsl	x5, x2, x5
    92ec:	aa0600a5 	orr	x5, x5, x6
    92f0:	f9000405 	str	x5, [x0, #8]
    92f4:	17ffffad 	b	91a8 <_free_r+0x128>
    92f8:	a9020c03 	stp	x3, x3, [x0, #32]
    92fc:	a9009466 	stp	x6, x5, [x3, #8]
    9300:	f9000c65 	str	x5, [x3, #24]
    9304:	f8226862 	str	x2, [x3, x2]
    9308:	17ffffc2 	b	9210 <_free_r+0x190>
    930c:	f105503f 	cmp	x1, #0x154
    9310:	540000e8 	b.hi	932c <_free_r+0x2ac>  // b.pmore
    9314:	d34ffc41 	lsr	x1, x2, #15
    9318:	1101e024 	add	w4, w1, #0x78
    931c:	1101dc25 	add	w5, w1, #0x77
    9320:	531f7884 	lsl	w4, w4, #1
    9324:	937d7c84 	sbfiz	x4, x4, #3, #32
    9328:	17ffff93 	b	9174 <_free_r+0xf4>
    932c:	f115503f 	cmp	x1, #0x554
    9330:	540000e8 	b.hi	934c <_free_r+0x2cc>  // b.pmore
    9334:	d352fc41 	lsr	x1, x2, #18
    9338:	1101f424 	add	w4, w1, #0x7d
    933c:	1101f025 	add	w5, w1, #0x7c
    9340:	531f7884 	lsl	w4, w4, #1
    9344:	937d7c84 	sbfiz	x4, x4, #3, #32
    9348:	17ffff8b 	b	9174 <_free_r+0xf4>
    934c:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    9350:	52800fc5 	mov	w5, #0x7e                  	// #126
    9354:	17ffff88 	b	9174 <_free_r+0xf4>
    9358:	b2400040 	orr	x0, x2, #0x1
    935c:	f9000460 	str	x0, [x3, #8]
    9360:	f9000082 	str	x2, [x4]
    9364:	17ffffab 	b	9210 <_free_r+0x190>
    9368:	d503201f 	nop
    936c:	d503201f 	nop

0000000000009370 <__sfvwrite_r>:
    9370:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    9374:	910003fd 	mov	x29, sp
    9378:	a90363f7 	stp	x23, x24, [sp, #48]
    937c:	aa0003f7 	mov	x23, x0
    9380:	f9400840 	ldr	x0, [x2, #16]
    9384:	b4000460 	cbz	x0, 9410 <__sfvwrite_r+0xa0>
    9388:	79402023 	ldrh	w3, [x1, #16]
    938c:	aa0203f8 	mov	x24, x2
    9390:	a90153f3 	stp	x19, x20, [sp, #16]
    9394:	aa0103f3 	mov	x19, x1
    9398:	36180443 	tbz	w3, #3, 9420 <__sfvwrite_r+0xb0>
    939c:	f9400c20 	ldr	x0, [x1, #24]
    93a0:	b4000400 	cbz	x0, 9420 <__sfvwrite_r+0xb0>
    93a4:	a9025bf5 	stp	x21, x22, [sp, #32]
    93a8:	a9046bf9 	stp	x25, x26, [sp, #64]
    93ac:	f9400314 	ldr	x20, [x24]
    93b0:	360804a3 	tbz	w3, #1, 9444 <__sfvwrite_r+0xd4>
    93b4:	d2800016 	mov	x22, #0x0                   	// #0
    93b8:	d2800015 	mov	x21, #0x0                   	// #0
    93bc:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    93c0:	eb1902bf 	cmp	x21, x25
    93c4:	aa1603e2 	mov	x2, x22
    93c8:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    93cc:	aa1703e0 	mov	x0, x23
    93d0:	b4000875 	cbz	x21, 94dc <__sfvwrite_r+0x16c>
    93d4:	f9401a61 	ldr	x1, [x19, #48]
    93d8:	f9402264 	ldr	x4, [x19, #64]
    93dc:	d63f0080 	blr	x4
    93e0:	7100001f 	cmp	w0, #0x0
    93e4:	5400206d 	b.le	97f0 <__sfvwrite_r+0x480>
    93e8:	f9400b01 	ldr	x1, [x24, #16]
    93ec:	93407c00 	sxtw	x0, w0
    93f0:	8b0002d6 	add	x22, x22, x0
    93f4:	cb0002b5 	sub	x21, x21, x0
    93f8:	cb000020 	sub	x0, x1, x0
    93fc:	f9000b00 	str	x0, [x24, #16]
    9400:	b5fffe00 	cbnz	x0, 93c0 <__sfvwrite_r+0x50>
    9404:	a94153f3 	ldp	x19, x20, [sp, #16]
    9408:	a9425bf5 	ldp	x21, x22, [sp, #32]
    940c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9410:	52800000 	mov	w0, #0x0                   	// #0
    9414:	a94363f7 	ldp	x23, x24, [sp, #48]
    9418:	a8c67bfd 	ldp	x29, x30, [sp], #96
    941c:	d65f03c0 	ret
    9420:	aa1303e1 	mov	x1, x19
    9424:	aa1703e0 	mov	x0, x23
    9428:	97fffc2e 	bl	84e0 <__swsetup_r>
    942c:	35001f00 	cbnz	w0, 980c <__sfvwrite_r+0x49c>
    9430:	79402263 	ldrh	w3, [x19, #16]
    9434:	a9025bf5 	stp	x21, x22, [sp, #32]
    9438:	a9046bf9 	stp	x25, x26, [sp, #64]
    943c:	f9400314 	ldr	x20, [x24]
    9440:	370ffba3 	tbnz	w3, #1, 93b4 <__sfvwrite_r+0x44>
    9444:	a90573fb 	stp	x27, x28, [sp, #80]
    9448:	37000503 	tbnz	w3, #0, 94e8 <__sfvwrite_r+0x178>
    944c:	d280001c 	mov	x28, #0x0                   	// #0
    9450:	d2800015 	mov	x21, #0x0                   	// #0
    9454:	d503201f 	nop
    9458:	b40003d5 	cbz	x21, 94d0 <__sfvwrite_r+0x160>
    945c:	f9400266 	ldr	x6, [x19]
    9460:	b9400e7a 	ldr	w26, [x19, #12]
    9464:	aa0603e0 	mov	x0, x6
    9468:	36480ac3 	tbz	w3, #9, 95c0 <__sfvwrite_r+0x250>
    946c:	93407f5b 	sxtw	x27, w26
    9470:	eb15037f 	cmp	x27, x21
    9474:	540010c9 	b.ls	968c <__sfvwrite_r+0x31c>  // b.plast
    9478:	93407ea1 	sxtw	x1, w21
    947c:	aa0103f6 	mov	x22, x1
    9480:	aa0603e0 	mov	x0, x6
    9484:	aa0103fb 	mov	x27, x1
    9488:	2a1503fa 	mov	w26, w21
    948c:	aa1b03e2 	mov	x2, x27
    9490:	aa1c03e1 	mov	x1, x28
    9494:	97fff27b 	bl	5e80 <memmove>
    9498:	f9400261 	ldr	x1, [x19]
    949c:	b9400e60 	ldr	w0, [x19, #12]
    94a0:	8b1b0022 	add	x2, x1, x27
    94a4:	f9000262 	str	x2, [x19]
    94a8:	4b1a0000 	sub	w0, w0, w26
    94ac:	b9000e60 	str	w0, [x19, #12]
    94b0:	f9400b00 	ldr	x0, [x24, #16]
    94b4:	8b16039c 	add	x28, x28, x22
    94b8:	cb1602b5 	sub	x21, x21, x22
    94bc:	cb160016 	sub	x22, x0, x22
    94c0:	f9000b16 	str	x22, [x24, #16]
    94c4:	b40005d6 	cbz	x22, 957c <__sfvwrite_r+0x20c>
    94c8:	79402263 	ldrh	w3, [x19, #16]
    94cc:	b5fffc95 	cbnz	x21, 945c <__sfvwrite_r+0xec>
    94d0:	a940569c 	ldp	x28, x21, [x20]
    94d4:	91004294 	add	x20, x20, #0x10
    94d8:	17ffffe0 	b	9458 <__sfvwrite_r+0xe8>
    94dc:	a9405696 	ldp	x22, x21, [x20]
    94e0:	91004294 	add	x20, x20, #0x10
    94e4:	17ffffb7 	b	93c0 <__sfvwrite_r+0x50>
    94e8:	5280001a 	mov	w26, #0x0                   	// #0
    94ec:	52800000 	mov	w0, #0x0                   	// #0
    94f0:	d280001b 	mov	x27, #0x0                   	// #0
    94f4:	d2800019 	mov	x25, #0x0                   	// #0
    94f8:	b40004d9 	cbz	x25, 9590 <__sfvwrite_r+0x220>
    94fc:	34000500 	cbz	w0, 959c <__sfvwrite_r+0x22c>
    9500:	f9400260 	ldr	x0, [x19]
    9504:	93407f56 	sxtw	x22, w26
    9508:	f9400e61 	ldr	x1, [x19, #24]
    950c:	eb1902df 	cmp	x22, x25
    9510:	b9400e75 	ldr	w21, [x19, #12]
    9514:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    9518:	b9402263 	ldr	w3, [x19, #32]
    951c:	eb01001f 	cmp	x0, x1
    9520:	0b150075 	add	w21, w3, w21
    9524:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    9528:	5400132c 	b.gt	978c <__sfvwrite_r+0x41c>
    952c:	6b16007f 	cmp	w3, w22
    9530:	5400116c 	b.gt	975c <__sfvwrite_r+0x3ec>
    9534:	f9401a61 	ldr	x1, [x19, #48]
    9538:	aa1b03e2 	mov	x2, x27
    953c:	f9402264 	ldr	x4, [x19, #64]
    9540:	aa1703e0 	mov	x0, x23
    9544:	d63f0080 	blr	x4
    9548:	2a0003f5 	mov	w21, w0
    954c:	7100001f 	cmp	w0, #0x0
    9550:	5400088d 	b.le	9660 <__sfvwrite_r+0x2f0>
    9554:	6b15035a 	subs	w26, w26, w21
    9558:	52800020 	mov	w0, #0x1                   	// #1
    955c:	54000f60 	b.eq	9748 <__sfvwrite_r+0x3d8>  // b.none
    9560:	f9400b01 	ldr	x1, [x24, #16]
    9564:	93407eb5 	sxtw	x21, w21
    9568:	8b15037b 	add	x27, x27, x21
    956c:	cb150339 	sub	x25, x25, x21
    9570:	cb150035 	sub	x21, x1, x21
    9574:	f9000b15 	str	x21, [x24, #16]
    9578:	b5fffc15 	cbnz	x21, 94f8 <__sfvwrite_r+0x188>
    957c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9580:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9584:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9588:	a94573fb 	ldp	x27, x28, [sp, #80]
    958c:	17ffffa1 	b	9410 <__sfvwrite_r+0xa0>
    9590:	a940669b 	ldp	x27, x25, [x20]
    9594:	91004294 	add	x20, x20, #0x10
    9598:	b4ffffd9 	cbz	x25, 9590 <__sfvwrite_r+0x220>
    959c:	aa1903e2 	mov	x2, x25
    95a0:	aa1b03e0 	mov	x0, x27
    95a4:	52800141 	mov	w1, #0xa                   	// #10
    95a8:	940008a7 	bl	b844 <memchr>
    95ac:	9100041a 	add	x26, x0, #0x1
    95b0:	f100001f 	cmp	x0, #0x0
    95b4:	cb1b035a 	sub	x26, x26, x27
    95b8:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    95bc:	17ffffd1 	b	9500 <__sfvwrite_r+0x190>
    95c0:	f9400e60 	ldr	x0, [x19, #24]
    95c4:	eb06001f 	cmp	x0, x6
    95c8:	54000263 	b.cc	9614 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    95cc:	b9402263 	ldr	w3, [x19, #32]
    95d0:	eb23c2bf 	cmp	x21, w3, sxtw
    95d4:	54000203 	b.cc	9614 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    95d8:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    95dc:	eb0002bf 	cmp	x21, x0
    95e0:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    95e4:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    95e8:	f9401a61 	ldr	x1, [x19, #48]
    95ec:	aa1c03e2 	mov	x2, x28
    95f0:	1ac30c84 	sdiv	w4, w4, w3
    95f4:	aa1703e0 	mov	x0, x23
    95f8:	f9402266 	ldr	x6, [x19, #64]
    95fc:	1b037c83 	mul	w3, w4, w3
    9600:	d63f00c0 	blr	x6
    9604:	7100001f 	cmp	w0, #0x0
    9608:	540002cd 	b.le	9660 <__sfvwrite_r+0x2f0>
    960c:	93407c16 	sxtw	x22, w0
    9610:	17ffffa8 	b	94b0 <__sfvwrite_r+0x140>
    9614:	93407f44 	sxtw	x4, w26
    9618:	aa1c03e1 	mov	x1, x28
    961c:	eb15009f 	cmp	x4, x21
    9620:	aa0603e0 	mov	x0, x6
    9624:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    9628:	93407f56 	sxtw	x22, w26
    962c:	aa1603e2 	mov	x2, x22
    9630:	97fff214 	bl	5e80 <memmove>
    9634:	f9400261 	ldr	x1, [x19]
    9638:	b9400e60 	ldr	w0, [x19, #12]
    963c:	8b160021 	add	x1, x1, x22
    9640:	f9000261 	str	x1, [x19]
    9644:	4b1a0004 	sub	w4, w0, w26
    9648:	b9000e64 	str	w4, [x19, #12]
    964c:	35fff324 	cbnz	w4, 94b0 <__sfvwrite_r+0x140>
    9650:	aa1303e1 	mov	x1, x19
    9654:	aa1703e0 	mov	x0, x23
    9658:	97fffcb2 	bl	8920 <_fflush_r>
    965c:	34fff2a0 	cbz	w0, 94b0 <__sfvwrite_r+0x140>
    9660:	a94573fb 	ldp	x27, x28, [sp, #80]
    9664:	79c02261 	ldrsh	w1, [x19, #16]
    9668:	321a0021 	orr	w1, w1, #0x40
    966c:	79002261 	strh	w1, [x19, #16]
    9670:	12800000 	mov	w0, #0xffffffff            	// #-1
    9674:	a94153f3 	ldp	x19, x20, [sp, #16]
    9678:	a9425bf5 	ldp	x21, x22, [sp, #32]
    967c:	a94363f7 	ldp	x23, x24, [sp, #48]
    9680:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9684:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9688:	d65f03c0 	ret
    968c:	93407eb6 	sxtw	x22, w21
    9690:	52809001 	mov	w1, #0x480                 	// #1152
    9694:	6a01007f 	tst	w3, w1
    9698:	54ffefa0 	b.eq	948c <__sfvwrite_r+0x11c>  // b.none
    969c:	b9402267 	ldr	w7, [x19, #32]
    96a0:	f9400e61 	ldr	x1, [x19, #24]
    96a4:	0b0704e7 	add	w7, w7, w7, lsl #1
    96a8:	cb0100d6 	sub	x22, x6, x1
    96ac:	0b477ce7 	add	w7, w7, w7, lsr #31
    96b0:	93407ed9 	sxtw	x25, w22
    96b4:	13017cfb 	asr	w27, w7, #1
    96b8:	91000720 	add	x0, x25, #0x1
    96bc:	8b150000 	add	x0, x0, x21
    96c0:	93407f62 	sxtw	x2, w27
    96c4:	eb00005f 	cmp	x2, x0
    96c8:	54000082 	b.cs	96d8 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    96cc:	110006c7 	add	w7, w22, #0x1
    96d0:	0b1500fb 	add	w27, w7, w21
    96d4:	93407f62 	sxtw	x2, w27
    96d8:	36500723 	tbz	w3, #10, 97bc <__sfvwrite_r+0x44c>
    96dc:	aa0203e1 	mov	x1, x2
    96e0:	aa1703e0 	mov	x0, x23
    96e4:	94000487 	bl	a900 <_malloc_r>
    96e8:	aa0003fa 	mov	x26, x0
    96ec:	b4000860 	cbz	x0, 97f8 <__sfvwrite_r+0x488>
    96f0:	f9400e61 	ldr	x1, [x19, #24]
    96f4:	aa1903e2 	mov	x2, x25
    96f8:	97fff182 	bl	5d00 <memcpy>
    96fc:	79402260 	ldrh	w0, [x19, #16]
    9700:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    9704:	0a010000 	and	w0, w0, w1
    9708:	32190000 	orr	w0, w0, #0x80
    970c:	79002260 	strh	w0, [x19, #16]
    9710:	8b190340 	add	x0, x26, x25
    9714:	4b160366 	sub	w6, w27, w22
    9718:	93407eb6 	sxtw	x22, w21
    971c:	f9000260 	str	x0, [x19]
    9720:	b9000e66 	str	w6, [x19, #12]
    9724:	aa1603e1 	mov	x1, x22
    9728:	f9000e7a 	str	x26, [x19, #24]
    972c:	aa0003e6 	mov	x6, x0
    9730:	b900227b 	str	w27, [x19, #32]
    9734:	2a1503fa 	mov	w26, w21
    9738:	eb1502df 	cmp	x22, x21
    973c:	54ffea08 	b.hi	947c <__sfvwrite_r+0x10c>  // b.pmore
    9740:	aa1603fb 	mov	x27, x22
    9744:	17ffff52 	b	948c <__sfvwrite_r+0x11c>
    9748:	aa1303e1 	mov	x1, x19
    974c:	aa1703e0 	mov	x0, x23
    9750:	97fffc74 	bl	8920 <_fflush_r>
    9754:	34fff060 	cbz	w0, 9560 <__sfvwrite_r+0x1f0>
    9758:	17ffffc2 	b	9660 <__sfvwrite_r+0x2f0>
    975c:	93407edc 	sxtw	x28, w22
    9760:	aa1b03e1 	mov	x1, x27
    9764:	aa1c03e2 	mov	x2, x28
    9768:	97fff1c6 	bl	5e80 <memmove>
    976c:	f9400260 	ldr	x0, [x19]
    9770:	2a1603f5 	mov	w21, w22
    9774:	b9400e61 	ldr	w1, [x19, #12]
    9778:	8b1c0000 	add	x0, x0, x28
    977c:	f9000260 	str	x0, [x19]
    9780:	4b160036 	sub	w22, w1, w22
    9784:	b9000e76 	str	w22, [x19, #12]
    9788:	17ffff73 	b	9554 <__sfvwrite_r+0x1e4>
    978c:	93407eb6 	sxtw	x22, w21
    9790:	aa1b03e1 	mov	x1, x27
    9794:	aa1603e2 	mov	x2, x22
    9798:	97fff1ba 	bl	5e80 <memmove>
    979c:	f9400262 	ldr	x2, [x19]
    97a0:	aa1303e1 	mov	x1, x19
    97a4:	aa1703e0 	mov	x0, x23
    97a8:	8b160042 	add	x2, x2, x22
    97ac:	f9000262 	str	x2, [x19]
    97b0:	97fffc5c 	bl	8920 <_fflush_r>
    97b4:	34ffed00 	cbz	w0, 9554 <__sfvwrite_r+0x1e4>
    97b8:	17ffffaa 	b	9660 <__sfvwrite_r+0x2f0>
    97bc:	aa1703e0 	mov	x0, x23
    97c0:	94000860 	bl	b940 <_realloc_r>
    97c4:	aa0003fa 	mov	x26, x0
    97c8:	b5fffa40 	cbnz	x0, 9710 <__sfvwrite_r+0x3a0>
    97cc:	f9400e61 	ldr	x1, [x19, #24]
    97d0:	aa1703e0 	mov	x0, x23
    97d4:	97fffe2b 	bl	9080 <_free_r>
    97d8:	79c02261 	ldrsh	w1, [x19, #16]
    97dc:	52800180 	mov	w0, #0xc                   	// #12
    97e0:	a94573fb 	ldp	x27, x28, [sp, #80]
    97e4:	12187821 	and	w1, w1, #0xffffff7f
    97e8:	b90002e0 	str	w0, [x23]
    97ec:	17ffff9f 	b	9668 <__sfvwrite_r+0x2f8>
    97f0:	79c02261 	ldrsh	w1, [x19, #16]
    97f4:	17ffff9d 	b	9668 <__sfvwrite_r+0x2f8>
    97f8:	79c02261 	ldrsh	w1, [x19, #16]
    97fc:	52800180 	mov	w0, #0xc                   	// #12
    9800:	a94573fb 	ldp	x27, x28, [sp, #80]
    9804:	b90002e0 	str	w0, [x23]
    9808:	17ffff98 	b	9668 <__sfvwrite_r+0x2f8>
    980c:	12800000 	mov	w0, #0xffffffff            	// #-1
    9810:	a94153f3 	ldp	x19, x20, [sp, #16]
    9814:	17ffff00 	b	9414 <__sfvwrite_r+0xa4>
    9818:	d503201f 	nop
    981c:	d503201f 	nop

0000000000009820 <_fwalk>:
    9820:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    9824:	910003fd 	mov	x29, sp
    9828:	a9025bf5 	stp	x21, x22, [sp, #32]
    982c:	91148015 	add	x21, x0, #0x520
    9830:	aa0103f6 	mov	x22, x1
    9834:	a90153f3 	stp	x19, x20, [sp, #16]
    9838:	f9001bf7 	str	x23, [sp, #48]
    983c:	52800017 	mov	w23, #0x0                   	// #0
    9840:	b9400aa0 	ldr	w0, [x21, #8]
    9844:	f9400ab3 	ldr	x19, [x21, #16]
    9848:	7100001f 	cmp	w0, #0x0
    984c:	5400026d 	b.le	9898 <_fwalk+0x78>
    9850:	51000400 	sub	w0, w0, #0x1
    9854:	91000400 	add	x0, x0, #0x1
    9858:	8b000414 	add	x20, x0, x0, lsl #1
    985c:	d37ef694 	lsl	x20, x20, #2
    9860:	cb000294 	sub	x20, x20, x0
    9864:	8b141274 	add	x20, x19, x20, lsl #4
    9868:	79402260 	ldrh	w0, [x19, #16]
    986c:	7100041f 	cmp	w0, #0x1
    9870:	540000e9 	b.ls	988c <_fwalk+0x6c>  // b.plast
    9874:	79c02662 	ldrsh	w2, [x19, #18]
    9878:	aa1303e0 	mov	x0, x19
    987c:	3100045f 	cmn	w2, #0x1
    9880:	54000060 	b.eq	988c <_fwalk+0x6c>  // b.none
    9884:	d63f02c0 	blr	x22
    9888:	2a0002f7 	orr	w23, w23, w0
    988c:	9102c273 	add	x19, x19, #0xb0
    9890:	eb13029f 	cmp	x20, x19
    9894:	54fffea1 	b.ne	9868 <_fwalk+0x48>  // b.any
    9898:	f94002b5 	ldr	x21, [x21]
    989c:	b5fffd35 	cbnz	x21, 9840 <_fwalk+0x20>
    98a0:	2a1703e0 	mov	w0, w23
    98a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    98a8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    98ac:	f9401bf7 	ldr	x23, [sp, #48]
    98b0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    98b4:	d65f03c0 	ret
    98b8:	d503201f 	nop
    98bc:	d503201f 	nop

00000000000098c0 <_fwalk_reent>:
    98c0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    98c4:	910003fd 	mov	x29, sp
    98c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    98cc:	aa0103f6 	mov	x22, x1
    98d0:	91148015 	add	x21, x0, #0x520
    98d4:	a90363f7 	stp	x23, x24, [sp, #48]
    98d8:	aa0003f8 	mov	x24, x0
    98dc:	52800017 	mov	w23, #0x0                   	// #0
    98e0:	a90153f3 	stp	x19, x20, [sp, #16]
    98e4:	d503201f 	nop
    98e8:	b9400aa2 	ldr	w2, [x21, #8]
    98ec:	f9400ab3 	ldr	x19, [x21, #16]
    98f0:	7100005f 	cmp	w2, #0x0
    98f4:	5400028d 	b.le	9944 <_fwalk_reent+0x84>
    98f8:	51000442 	sub	w2, w2, #0x1
    98fc:	91000442 	add	x2, x2, #0x1
    9900:	8b020454 	add	x20, x2, x2, lsl #1
    9904:	d37ef694 	lsl	x20, x20, #2
    9908:	cb020294 	sub	x20, x20, x2
    990c:	8b141274 	add	x20, x19, x20, lsl #4
    9910:	79402262 	ldrh	w2, [x19, #16]
    9914:	7100045f 	cmp	w2, #0x1
    9918:	54000109 	b.ls	9938 <_fwalk_reent+0x78>  // b.plast
    991c:	79c02662 	ldrsh	w2, [x19, #18]
    9920:	aa1303e1 	mov	x1, x19
    9924:	aa1803e0 	mov	x0, x24
    9928:	3100045f 	cmn	w2, #0x1
    992c:	54000060 	b.eq	9938 <_fwalk_reent+0x78>  // b.none
    9930:	d63f02c0 	blr	x22
    9934:	2a0002f7 	orr	w23, w23, w0
    9938:	9102c273 	add	x19, x19, #0xb0
    993c:	eb13029f 	cmp	x20, x19
    9940:	54fffe81 	b.ne	9910 <_fwalk_reent+0x50>  // b.any
    9944:	f94002b5 	ldr	x21, [x21]
    9948:	b5fffd15 	cbnz	x21, 98e8 <_fwalk_reent+0x28>
    994c:	2a1703e0 	mov	w0, w23
    9950:	a94153f3 	ldp	x19, x20, [sp, #16]
    9954:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9958:	a94363f7 	ldp	x23, x24, [sp, #48]
    995c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    9960:	d65f03c0 	ret
    9964:	d503201f 	nop
    9968:	d503201f 	nop
    996c:	d503201f 	nop

0000000000009970 <__localeconv_l>:
    9970:	91040000 	add	x0, x0, #0x100
    9974:	d65f03c0 	ret
    9978:	d503201f 	nop
    997c:	d503201f 	nop

0000000000009980 <_localeconv_r>:
    9980:	d0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    9984:	912a8000 	add	x0, x0, #0xaa0
    9988:	d65f03c0 	ret
    998c:	d503201f 	nop

0000000000009990 <localeconv>:
    9990:	d0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    9994:	912a8000 	add	x0, x0, #0xaa0
    9998:	d65f03c0 	ret
    999c:	d503201f 	nop

00000000000099a0 <currentlocale>:
    99a0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    99a4:	910003fd 	mov	x29, sp
    99a8:	a90153f3 	stp	x19, x20, [sp, #16]
    99ac:	d0000034 	adrp	x20, f000 <IpcFsServer+0x5d8>
    99b0:	91268294 	add	x20, x20, #0x9a0
    99b4:	a9025bf5 	stp	x21, x22, [sp, #32]
    99b8:	91010296 	add	x22, x20, #0x40
    99bc:	f00004f5 	adrp	x21, a8000 <_stack+0x28000>
    99c0:	911aa2b5 	add	x21, x21, #0x6a8
    99c4:	f9001bf7 	str	x23, [sp, #48]
    99c8:	91038297 	add	x23, x20, #0xe0
    99cc:	91008294 	add	x20, x20, #0x20
    99d0:	aa1603f3 	mov	x19, x22
    99d4:	aa1503e0 	mov	x0, x21
    99d8:	aa1403e1 	mov	x1, x20
    99dc:	94000b59 	bl	c740 <strcpy>
    99e0:	aa1303e1 	mov	x1, x19
    99e4:	aa1403e0 	mov	x0, x20
    99e8:	91008273 	add	x19, x19, #0x20
    99ec:	97fff1d5 	bl	6140 <strcmp>
    99f0:	35000120 	cbnz	w0, 9a14 <currentlocale+0x74>
    99f4:	eb17027f 	cmp	x19, x23
    99f8:	54ffff41 	b.ne	99e0 <currentlocale+0x40>  // b.any
    99fc:	aa1503e0 	mov	x0, x21
    9a00:	a94153f3 	ldp	x19, x20, [sp, #16]
    9a04:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9a08:	f9401bf7 	ldr	x23, [sp, #48]
    9a0c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    9a10:	d65f03c0 	ret
    9a14:	b0000033 	adrp	x19, e000 <__func__.0+0x280>
    9a18:	9112a273 	add	x19, x19, #0x4a8
    9a1c:	aa1303e1 	mov	x1, x19
    9a20:	aa1503e0 	mov	x0, x21
    9a24:	94000ae7 	bl	c5c0 <strcat>
    9a28:	aa1603e1 	mov	x1, x22
    9a2c:	aa1503e0 	mov	x0, x21
    9a30:	910082d6 	add	x22, x22, #0x20
    9a34:	94000ae3 	bl	c5c0 <strcat>
    9a38:	eb1702df 	cmp	x22, x23
    9a3c:	54ffff01 	b.ne	9a1c <currentlocale+0x7c>  // b.any
    9a40:	aa1503e0 	mov	x0, x21
    9a44:	a94153f3 	ldp	x19, x20, [sp, #16]
    9a48:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9a4c:	f9401bf7 	ldr	x23, [sp, #48]
    9a50:	a8c47bfd 	ldp	x29, x30, [sp], #64
    9a54:	d65f03c0 	ret
    9a58:	d503201f 	nop
    9a5c:	d503201f 	nop

0000000000009a60 <__loadlocale>:
    9a60:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    9a64:	910003fd 	mov	x29, sp
    9a68:	a90153f3 	stp	x19, x20, [sp, #16]
    9a6c:	937b7c34 	sbfiz	x20, x1, #5, #32
    9a70:	8b140014 	add	x20, x0, x20
    9a74:	aa0203f3 	mov	x19, x2
    9a78:	a9025bf5 	stp	x21, x22, [sp, #32]
    9a7c:	aa0003f6 	mov	x22, x0
    9a80:	aa0203e0 	mov	x0, x2
    9a84:	a90363f7 	stp	x23, x24, [sp, #48]
    9a88:	2a0103f7 	mov	w23, w1
    9a8c:	aa1403e1 	mov	x1, x20
    9a90:	97fff1ac 	bl	6140 <strcmp>
    9a94:	350000e0 	cbnz	w0, 9ab0 <__loadlocale+0x50>
    9a98:	aa1403e0 	mov	x0, x20
    9a9c:	a94153f3 	ldp	x19, x20, [sp, #16]
    9aa0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9aa4:	a94363f7 	ldp	x23, x24, [sp, #48]
    9aa8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    9aac:	d65f03c0 	ret
    9ab0:	aa1303e0 	mov	x0, x19
    9ab4:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9ab8:	b0000035 	adrp	x21, e000 <__func__.0+0x280>
    9abc:	9112c021 	add	x1, x1, #0x4b0
    9ac0:	9112e2b5 	add	x21, x21, #0x4b8
    9ac4:	a9046bf9 	stp	x25, x26, [sp, #64]
    9ac8:	97fff19e 	bl	6140 <strcmp>
    9acc:	34000d80 	cbz	w0, 9c7c <__loadlocale+0x21c>
    9ad0:	aa1503e1 	mov	x1, x21
    9ad4:	aa1303e0 	mov	x0, x19
    9ad8:	97fff19a 	bl	6140 <strcmp>
    9adc:	2a0003f5 	mov	w21, w0
    9ae0:	34000be0 	cbz	w0, 9c5c <__loadlocale+0x1fc>
    9ae4:	39400260 	ldrb	w0, [x19]
    9ae8:	71010c1f 	cmp	w0, #0x43
    9aec:	54000d00 	b.eq	9c8c <__loadlocale+0x22c>  // b.none
    9af0:	51018400 	sub	w0, w0, #0x61
    9af4:	12001c00 	and	w0, w0, #0xff
    9af8:	7100641f 	cmp	w0, #0x19
    9afc:	54000a08 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9b00:	39400660 	ldrb	w0, [x19, #1]
    9b04:	51018400 	sub	w0, w0, #0x61
    9b08:	12001c00 	and	w0, w0, #0xff
    9b0c:	7100641f 	cmp	w0, #0x19
    9b10:	54000968 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9b14:	39400a60 	ldrb	w0, [x19, #2]
    9b18:	91000a75 	add	x21, x19, #0x2
    9b1c:	51018401 	sub	w1, w0, #0x61
    9b20:	12001c21 	and	w1, w1, #0xff
    9b24:	7100643f 	cmp	w1, #0x19
    9b28:	54000068 	b.hi	9b34 <__loadlocale+0xd4>  // b.pmore
    9b2c:	39400e60 	ldrb	w0, [x19, #3]
    9b30:	91000e75 	add	x21, x19, #0x3
    9b34:	71017c1f 	cmp	w0, #0x5f
    9b38:	54000d00 	b.eq	9cd8 <__loadlocale+0x278>  // b.none
    9b3c:	7100b81f 	cmp	w0, #0x2e
    9b40:	54002ec0 	b.eq	a118 <__loadlocale+0x6b8>  // b.none
    9b44:	528017e1 	mov	w1, #0xbf                  	// #191
    9b48:	6a01001f 	tst	w0, w1
    9b4c:	54000781 	b.ne	9c3c <__loadlocale+0x1dc>  // b.any
    9b50:	910203f8 	add	x24, sp, #0x80
    9b54:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9b58:	aa1803e0 	mov	x0, x24
    9b5c:	91132021 	add	x1, x1, #0x4c8
    9b60:	94000af8 	bl	c740 <strcpy>
    9b64:	394002a0 	ldrb	w0, [x21]
    9b68:	7101001f 	cmp	w0, #0x40
    9b6c:	54002da0 	b.eq	a120 <__loadlocale+0x6c0>  // b.none
    9b70:	52800019 	mov	w25, #0x0                   	// #0
    9b74:	52800015 	mov	w21, #0x0                   	// #0
    9b78:	5280001a 	mov	w26, #0x0                   	// #0
    9b7c:	394203e1 	ldrb	w1, [sp, #128]
    9b80:	51010421 	sub	w1, w1, #0x41
    9b84:	7100d03f 	cmp	w1, #0x34
    9b88:	540005a8 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9b8c:	b0000020 	adrp	x0, e000 <__func__.0+0x280>
    9b90:	91170000 	add	x0, x0, #0x5c0
    9b94:	a90573fb 	stp	x27, x28, [sp, #80]
    9b98:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    9b9c:	10000061 	adr	x1, 9ba8 <__loadlocale+0x148>
    9ba0:	8b20a820 	add	x0, x1, w0, sxth #2
    9ba4:	d61f0000 	br	x0
    9ba8:	394207e0 	ldrb	w0, [sp, #129]
    9bac:	121a7800 	and	w0, w0, #0xffffffdf
    9bb0:	12001c00 	and	w0, w0, #0xff
    9bb4:	7101401f 	cmp	w0, #0x50
    9bb8:	54000401 	b.ne	9c38 <__loadlocale+0x1d8>  // b.any
    9bbc:	d2800042 	mov	x2, #0x2                   	// #2
    9bc0:	aa1803e0 	mov	x0, x24
    9bc4:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9bc8:	91156021 	add	x1, x1, #0x558
    9bcc:	97fff265 	bl	6560 <strncpy>
    9bd0:	9101e3e1 	add	x1, sp, #0x78
    9bd4:	91020be0 	add	x0, sp, #0x82
    9bd8:	52800142 	mov	w2, #0xa                   	// #10
    9bdc:	94000c09 	bl	cc00 <strtol>
    9be0:	f9403fe1 	ldr	x1, [sp, #120]
    9be4:	39400021 	ldrb	w1, [x1]
    9be8:	35000281 	cbnz	w1, 9c38 <__loadlocale+0x1d8>
    9bec:	f10e901f 	cmp	x0, #0x3a4
    9bf0:	540030a0 	b.eq	a204 <__loadlocale+0x7a4>  // b.none
    9bf4:	54002f2c 	b.gt	a1d8 <__loadlocale+0x778>
    9bf8:	f10d881f 	cmp	x0, #0x362
    9bfc:	54002dec 	b.gt	a1b8 <__loadlocale+0x758>
    9c00:	f10d441f 	cmp	x0, #0x351
    9c04:	54002c8c 	b.gt	a194 <__loadlocale+0x734>
    9c08:	f106d41f 	cmp	x0, #0x1b5
    9c0c:	54002da0 	b.eq	a1c0 <__loadlocale+0x760>  // b.none
    9c10:	d10b4000 	sub	x0, x0, #0x2d0
    9c14:	f100dc1f 	cmp	x0, #0x37
    9c18:	54000108 	b.hi	9c38 <__loadlocale+0x1d8>  // b.pmore
    9c1c:	d2800021 	mov	x1, #0x1                   	// #1
    9c20:	d280003c 	mov	x28, #0x1                   	// #1
    9c24:	f2a00041 	movk	x1, #0x2, lsl #16
    9c28:	9ac02380 	lsl	x0, x28, x0
    9c2c:	f2e01001 	movk	x1, #0x80, lsl #48
    9c30:	ea01001f 	tst	x0, x1
    9c34:	54000e21 	b.ne	9df8 <__loadlocale+0x398>  // b.any
    9c38:	a94573fb 	ldp	x27, x28, [sp, #80]
    9c3c:	d2800014 	mov	x20, #0x0                   	// #0
    9c40:	aa1403e0 	mov	x0, x20
    9c44:	a94153f3 	ldp	x19, x20, [sp, #16]
    9c48:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9c4c:	a94363f7 	ldp	x23, x24, [sp, #48]
    9c50:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9c54:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    9c58:	d65f03c0 	ret
    9c5c:	910203f8 	add	x24, sp, #0x80
    9c60:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9c64:	aa1803e0 	mov	x0, x24
    9c68:	91130021 	add	x1, x1, #0x4c0
    9c6c:	52800019 	mov	w25, #0x0                   	// #0
    9c70:	5280001a 	mov	w26, #0x0                   	// #0
    9c74:	94000ab3 	bl	c740 <strcpy>
    9c78:	17ffffc1 	b	9b7c <__loadlocale+0x11c>
    9c7c:	aa1503e1 	mov	x1, x21
    9c80:	aa1303e0 	mov	x0, x19
    9c84:	94000aaf 	bl	c740 <strcpy>
    9c88:	17ffff92 	b	9ad0 <__loadlocale+0x70>
    9c8c:	39400660 	ldrb	w0, [x19, #1]
    9c90:	5100b400 	sub	w0, w0, #0x2d
    9c94:	12001c00 	and	w0, w0, #0xff
    9c98:	7100041f 	cmp	w0, #0x1
    9c9c:	54fffd08 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9ca0:	91000a75 	add	x21, x19, #0x2
    9ca4:	910203f8 	add	x24, sp, #0x80
    9ca8:	aa1503e1 	mov	x1, x21
    9cac:	aa1803e0 	mov	x0, x24
    9cb0:	94000aa4 	bl	c740 <strcpy>
    9cb4:	aa1803e0 	mov	x0, x24
    9cb8:	52800801 	mov	w1, #0x40                  	// #64
    9cbc:	94000a5e 	bl	c634 <strchr>
    9cc0:	b4000040 	cbz	x0, 9cc8 <__loadlocale+0x268>
    9cc4:	3900001f 	strb	wzr, [x0]
    9cc8:	aa1803e0 	mov	x0, x24
    9ccc:	97fff15d 	bl	6240 <strlen>
    9cd0:	8b0002b5 	add	x21, x21, x0
    9cd4:	17ffffa4 	b	9b64 <__loadlocale+0x104>
    9cd8:	394006a0 	ldrb	w0, [x21, #1]
    9cdc:	51010400 	sub	w0, w0, #0x41
    9ce0:	12001c00 	and	w0, w0, #0xff
    9ce4:	7100641f 	cmp	w0, #0x19
    9ce8:	54fffaa8 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9cec:	39400aa0 	ldrb	w0, [x21, #2]
    9cf0:	51010400 	sub	w0, w0, #0x41
    9cf4:	12001c00 	and	w0, w0, #0xff
    9cf8:	7100641f 	cmp	w0, #0x19
    9cfc:	54fffa08 	b.hi	9c3c <__loadlocale+0x1dc>  // b.pmore
    9d00:	39400ea0 	ldrb	w0, [x21, #3]
    9d04:	91000eb5 	add	x21, x21, #0x3
    9d08:	17ffff8d 	b	9b3c <__loadlocale+0xdc>
    9d0c:	b000003b 	adrp	x27, e000 <__func__.0+0x280>
    9d10:	9114037b 	add	x27, x27, #0x500
    9d14:	aa1b03e1 	mov	x1, x27
    9d18:	aa1803e0 	mov	x0, x24
    9d1c:	94000a0d 	bl	c550 <strcasecmp>
    9d20:	340000c0 	cbz	w0, 9d38 <__loadlocale+0x2d8>
    9d24:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9d28:	aa1803e0 	mov	x0, x24
    9d2c:	91142021 	add	x1, x1, #0x508
    9d30:	94000a08 	bl	c550 <strcasecmp>
    9d34:	35fff820 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9d38:	aa1b03e1 	mov	x1, x27
    9d3c:	aa1803e0 	mov	x0, x24
    9d40:	94000a80 	bl	c740 <strcpy>
    9d44:	d000001b 	adrp	x27, b000 <_malloc_r+0x700>
    9d48:	90000022 	adrp	x2, d000 <__ascii_wctomb+0x30>
    9d4c:	9106437b 	add	x27, x27, #0x190
    9d50:	91004042 	add	x2, x2, #0x10
    9d54:	528000dc 	mov	w28, #0x6                   	// #6
    9d58:	71000aff 	cmp	w23, #0x2
    9d5c:	54001b00 	b.eq	a0bc <__loadlocale+0x65c>  // b.none
    9d60:	71001aff 	cmp	w23, #0x6
    9d64:	54000081 	b.ne	9d74 <__loadlocale+0x314>  // b.any
    9d68:	aa1803e1 	mov	x1, x24
    9d6c:	91060ac0 	add	x0, x22, #0x182
    9d70:	94000a74 	bl	c740 <strcpy>
    9d74:	aa1303e1 	mov	x1, x19
    9d78:	aa1403e0 	mov	x0, x20
    9d7c:	94000a71 	bl	c740 <strcpy>
    9d80:	aa0003f4 	mov	x20, x0
    9d84:	aa1403e0 	mov	x0, x20
    9d88:	a94153f3 	ldp	x19, x20, [sp, #16]
    9d8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9d90:	a94363f7 	ldp	x23, x24, [sp, #48]
    9d94:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9d98:	a94573fb 	ldp	x27, x28, [sp, #80]
    9d9c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    9da0:	d65f03c0 	ret
    9da4:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9da8:	aa1803e0 	mov	x0, x24
    9dac:	9116a021 	add	x1, x1, #0x5a8
    9db0:	d2800062 	mov	x2, #0x3                   	// #3
    9db4:	94000aeb 	bl	c960 <strncasecmp>
    9db8:	35fff400 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9dbc:	39420fe0 	ldrb	w0, [sp, #131]
    9dc0:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9dc4:	9116c021 	add	x1, x1, #0x5b0
    9dc8:	7100b41f 	cmp	w0, #0x2d
    9dcc:	910283e0 	add	x0, sp, #0xa0
    9dd0:	9a801400 	cinc	x0, x0, eq  // eq = none
    9dd4:	d1007400 	sub	x0, x0, #0x1d
    9dd8:	97fff0da 	bl	6140 <strcmp>
    9ddc:	35fff2e0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9de0:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9de4:	aa1803e0 	mov	x0, x24
    9de8:	9116e021 	add	x1, x1, #0x5b8
    9dec:	d503201f 	nop
    9df0:	5280003c 	mov	w28, #0x1                   	// #1
    9df4:	94000a53 	bl	c740 <strcpy>
    9df8:	d000001b 	adrp	x27, b000 <_malloc_r+0x700>
    9dfc:	f0000002 	adrp	x2, c000 <_raise_r+0x40>
    9e00:	9105037b 	add	x27, x27, #0x140
    9e04:	913f4042 	add	x2, x2, #0xfd0
    9e08:	17ffffd4 	b	9d58 <__loadlocale+0x2f8>
    9e0c:	b000003b 	adrp	x27, e000 <__func__.0+0x280>
    9e10:	9114c37b 	add	x27, x27, #0x530
    9e14:	aa1b03e1 	mov	x1, x27
    9e18:	aa1803e0 	mov	x0, x24
    9e1c:	940009cd 	bl	c550 <strcasecmp>
    9e20:	35fff0c0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9e24:	aa1b03e1 	mov	x1, x27
    9e28:	aa1803e0 	mov	x0, x24
    9e2c:	94000a45 	bl	c740 <strcpy>
    9e30:	d000001b 	adrp	x27, b000 <_malloc_r+0x700>
    9e34:	90000022 	adrp	x2, d000 <__ascii_wctomb+0x30>
    9e38:	9111837b 	add	x27, x27, #0x460
    9e3c:	91040042 	add	x2, x2, #0x100
    9e40:	5280005c 	mov	w28, #0x2                   	// #2
    9e44:	17ffffc5 	b	9d58 <__loadlocale+0x2f8>
    9e48:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9e4c:	aa1803e0 	mov	x0, x24
    9e50:	91166021 	add	x1, x1, #0x598
    9e54:	940009bf 	bl	c550 <strcasecmp>
    9e58:	35ffef00 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9e5c:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9e60:	aa1803e0 	mov	x0, x24
    9e64:	91168021 	add	x1, x1, #0x5a0
    9e68:	17ffffe2 	b	9df0 <__loadlocale+0x390>
    9e6c:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9e70:	aa1803e0 	mov	x0, x24
    9e74:	91158021 	add	x1, x1, #0x560
    9e78:	d2800082 	mov	x2, #0x4                   	// #4
    9e7c:	94000ab9 	bl	c960 <strncasecmp>
    9e80:	35ffedc0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9e84:	394213e0 	ldrb	w0, [sp, #132]
    9e88:	394217e1 	ldrb	w1, [sp, #133]
    9e8c:	7100b41f 	cmp	w0, #0x2d
    9e90:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    9e94:	121a7800 	and	w0, w0, #0xffffffdf
    9e98:	12001c00 	and	w0, w0, #0xff
    9e9c:	7101481f 	cmp	w0, #0x52
    9ea0:	54001aa0 	b.eq	a1f4 <__loadlocale+0x794>  // b.none
    9ea4:	7101541f 	cmp	w0, #0x55
    9ea8:	54ffec81 	b.ne	9c38 <__loadlocale+0x1d8>  // b.any
    9eac:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9eb0:	aa1803e0 	mov	x0, x24
    9eb4:	9115c021 	add	x1, x1, #0x570
    9eb8:	17ffffce 	b	9df0 <__loadlocale+0x390>
    9ebc:	b000003b 	adrp	x27, e000 <__func__.0+0x280>
    9ec0:	9114437b 	add	x27, x27, #0x510
    9ec4:	aa1b03e1 	mov	x1, x27
    9ec8:	aa1803e0 	mov	x0, x24
    9ecc:	940009a1 	bl	c550 <strcasecmp>
    9ed0:	35ffeb40 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9ed4:	aa1b03e1 	mov	x1, x27
    9ed8:	aa1803e0 	mov	x0, x24
    9edc:	94000a19 	bl	c740 <strcpy>
    9ee0:	d000001b 	adrp	x27, b000 <_malloc_r+0x700>
    9ee4:	90000022 	adrp	x2, d000 <__ascii_wctomb+0x30>
    9ee8:	9119837b 	add	x27, x27, #0x660
    9eec:	91090042 	add	x2, x2, #0x240
    9ef0:	5280011c 	mov	w28, #0x8                   	// #8
    9ef4:	17ffff99 	b	9d58 <__loadlocale+0x2f8>
    9ef8:	b000003b 	adrp	x27, e000 <__func__.0+0x280>
    9efc:	9113037b 	add	x27, x27, #0x4c0
    9f00:	aa1b03e1 	mov	x1, x27
    9f04:	aa1803e0 	mov	x0, x24
    9f08:	94000992 	bl	c550 <strcasecmp>
    9f0c:	35ffe960 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9f10:	aa1b03e1 	mov	x1, x27
    9f14:	aa1803e0 	mov	x0, x24
    9f18:	17ffffb6 	b	9df0 <__loadlocale+0x390>
    9f1c:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9f20:	aa1803e0 	mov	x0, x24
    9f24:	9115e021 	add	x1, x1, #0x578
    9f28:	d2800102 	mov	x2, #0x8                   	// #8
    9f2c:	94000a8d 	bl	c960 <strncasecmp>
    9f30:	35ffe840 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9f34:	394223e0 	ldrb	w0, [sp, #136]
    9f38:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9f3c:	91162021 	add	x1, x1, #0x588
    9f40:	7100b41f 	cmp	w0, #0x2d
    9f44:	910283e0 	add	x0, sp, #0xa0
    9f48:	9a801400 	cinc	x0, x0, eq  // eq = none
    9f4c:	d1006000 	sub	x0, x0, #0x18
    9f50:	94000980 	bl	c550 <strcasecmp>
    9f54:	35ffe720 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9f58:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9f5c:	aa1803e0 	mov	x0, x24
    9f60:	91164021 	add	x1, x1, #0x590
    9f64:	17ffffa3 	b	9df0 <__loadlocale+0x390>
    9f68:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9f6c:	aa1803e0 	mov	x0, x24
    9f70:	91146021 	add	x1, x1, #0x518
    9f74:	d2800062 	mov	x2, #0x3                   	// #3
    9f78:	94000a7a 	bl	c960 <strncasecmp>
    9f7c:	35ffe5e0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9f80:	39420fe0 	ldrb	w0, [sp, #131]
    9f84:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9f88:	91148021 	add	x1, x1, #0x520
    9f8c:	7100b41f 	cmp	w0, #0x2d
    9f90:	910283e0 	add	x0, sp, #0xa0
    9f94:	9a801400 	cinc	x0, x0, eq  // eq = none
    9f98:	d1007400 	sub	x0, x0, #0x1d
    9f9c:	9400096d 	bl	c550 <strcasecmp>
    9fa0:	35ffe4c0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9fa4:	aa1803e0 	mov	x0, x24
    9fa8:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9fac:	9114a021 	add	x1, x1, #0x528
    9fb0:	940009e4 	bl	c740 <strcpy>
    9fb4:	d000001b 	adrp	x27, b000 <_malloc_r+0x700>
    9fb8:	90000022 	adrp	x2, d000 <__ascii_wctomb+0x30>
    9fbc:	9114c37b 	add	x27, x27, #0x530
    9fc0:	91064042 	add	x2, x2, #0x190
    9fc4:	5280007c 	mov	w28, #0x3                   	// #3
    9fc8:	17ffff64 	b	9d58 <__loadlocale+0x2f8>
    9fcc:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9fd0:	aa1803e0 	mov	x0, x24
    9fd4:	9114e021 	add	x1, x1, #0x538
    9fd8:	d2800062 	mov	x2, #0x3                   	// #3
    9fdc:	94000a61 	bl	c960 <strncasecmp>
    9fe0:	35ffe2c0 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    9fe4:	39420fe0 	ldrb	w0, [sp, #131]
    9fe8:	b0000021 	adrp	x1, e000 <__func__.0+0x280>
    9fec:	d2800082 	mov	x2, #0x4                   	// #4
    9ff0:	91150021 	add	x1, x1, #0x540
    9ff4:	7100b41f 	cmp	w0, #0x2d
    9ff8:	910283e0 	add	x0, sp, #0xa0
    9ffc:	9a80141b 	cinc	x27, x0, eq  // eq = none
    a000:	d100777b 	sub	x27, x27, #0x1d
    a004:	aa1b03e0 	mov	x0, x27
    a008:	94000a56 	bl	c960 <strncasecmp>
    a00c:	35ffe160 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    a010:	39401360 	ldrb	w0, [x27, #4]
    a014:	9101e3e1 	add	x1, sp, #0x78
    a018:	52800142 	mov	w2, #0xa                   	// #10
    a01c:	7100b41f 	cmp	w0, #0x2d
    a020:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    a024:	91001000 	add	x0, x0, #0x4
    a028:	94000af6 	bl	cc00 <strtol>
    a02c:	aa0003e3 	mov	x3, x0
    a030:	d1000400 	sub	x0, x0, #0x1
    a034:	f90037e3 	str	x3, [sp, #104]
    a038:	f1003c1f 	cmp	x0, #0xf
    a03c:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    a040:	54ffdfc0 	b.eq	9c38 <__loadlocale+0x1d8>  // b.none
    a044:	f9403fe0 	ldr	x0, [sp, #120]
    a048:	39400000 	ldrb	w0, [x0]
    a04c:	35ffdf60 	cbnz	w0, 9c38 <__loadlocale+0x1d8>
    a050:	aa1803e0 	mov	x0, x24
    a054:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a058:	91152021 	add	x1, x1, #0x548
    a05c:	940009b9 	bl	c740 <strcpy>
    a060:	f94037e3 	ldr	x3, [sp, #104]
    a064:	910227e4 	add	x4, sp, #0x89
    a068:	f100287f 	cmp	x3, #0xa
    a06c:	5400008d 	b.le	a07c <__loadlocale+0x61c>
    a070:	91022be4 	add	x4, sp, #0x8a
    a074:	52800620 	mov	w0, #0x31                  	// #49
    a078:	390227e0 	strb	w0, [sp, #137]
    a07c:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    a080:	b000001b 	adrp	x27, b000 <_malloc_r+0x700>
    a084:	f28ccce1 	movk	x1, #0x6667
    a088:	d0000002 	adrp	x2, c000 <_raise_r+0x40>
    a08c:	9105037b 	add	x27, x27, #0x140
    a090:	913f4042 	add	x2, x2, #0xfd0
    a094:	9b417c61 	smulh	x1, x3, x1
    a098:	5280003c 	mov	w28, #0x1                   	// #1
    a09c:	3900049f 	strb	wzr, [x4, #1]
    a0a0:	9342fc21 	asr	x1, x1, #2
    a0a4:	cb83fc21 	sub	x1, x1, x3, asr #63
    a0a8:	8b010821 	add	x1, x1, x1, lsl #2
    a0ac:	cb010460 	sub	x0, x3, x1, lsl #1
    a0b0:	1100c000 	add	w0, w0, #0x30
    a0b4:	39000080 	strb	w0, [x4]
    a0b8:	17ffff28 	b	9d58 <__loadlocale+0x2f8>
    a0bc:	aa1803e1 	mov	x1, x24
    a0c0:	91058ac0 	add	x0, x22, #0x162
    a0c4:	f90037e2 	str	x2, [sp, #104]
    a0c8:	9400099e 	bl	c740 <strcpy>
    a0cc:	f94037e2 	ldr	x2, [sp, #104]
    a0d0:	a90e6ec2 	stp	x2, x27, [x22, #224]
    a0d4:	aa1803e1 	mov	x1, x24
    a0d8:	390582dc 	strb	w28, [x22, #352]
    a0dc:	aa1603e0 	mov	x0, x22
    a0e0:	94000cb4 	bl	d3b0 <__set_ctype>
    a0e4:	35000139 	cbnz	w25, a108 <__loadlocale+0x6a8>
    a0e8:	7100079f 	cmp	w28, #0x1
    a0ec:	520002b5 	eor	w21, w21, #0x1
    a0f0:	1a9fd7e0 	cset	w0, gt
    a0f4:	6a0002bf 	tst	w21, w0
    a0f8:	54000080 	b.eq	a108 <__loadlocale+0x6a8>  // b.none
    a0fc:	394203e0 	ldrb	w0, [sp, #128]
    a100:	7101541f 	cmp	w0, #0x55
    a104:	1a9f07f9 	cset	w25, ne  // ne = any
    a108:	7100035f 	cmp	w26, #0x0
    a10c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    a110:	b900f2d9 	str	w25, [x22, #240]
    a114:	17ffff18 	b	9d74 <__loadlocale+0x314>
    a118:	910006b5 	add	x21, x21, #0x1
    a11c:	17fffee2 	b	9ca4 <__loadlocale+0x244>
    a120:	a90573fb 	stp	x27, x28, [sp, #80]
    a124:	910006bb 	add	x27, x21, #0x1
    a128:	aa1b03e0 	mov	x0, x27
    a12c:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a130:	52800019 	mov	w25, #0x0                   	// #0
    a134:	91136021 	add	x1, x1, #0x4d8
    a138:	5280003a 	mov	w26, #0x1                   	// #1
    a13c:	97fff001 	bl	6140 <strcmp>
    a140:	2a0003f5 	mov	w21, w0
    a144:	35000060 	cbnz	w0, a150 <__loadlocale+0x6f0>
    a148:	a94573fb 	ldp	x27, x28, [sp, #80]
    a14c:	17fffe8c 	b	9b7c <__loadlocale+0x11c>
    a150:	aa1b03e0 	mov	x0, x27
    a154:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a158:	5280001a 	mov	w26, #0x0                   	// #0
    a15c:	9113a021 	add	x1, x1, #0x4e8
    a160:	52800035 	mov	w21, #0x1                   	// #1
    a164:	97ffeff7 	bl	6140 <strcmp>
    a168:	2a0003f9 	mov	w25, w0
    a16c:	34fffee0 	cbz	w0, a148 <__loadlocale+0x6e8>
    a170:	aa1b03e0 	mov	x0, x27
    a174:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a178:	9113e021 	add	x1, x1, #0x4f8
    a17c:	97ffeff1 	bl	6140 <strcmp>
    a180:	7100001f 	cmp	w0, #0x0
    a184:	52800015 	mov	w21, #0x0                   	// #0
    a188:	1a9f17f9 	cset	w25, eq  // eq = none
    a18c:	a94573fb 	ldp	x27, x28, [sp, #80]
    a190:	17fffe7b 	b	9b7c <__loadlocale+0x11c>
    a194:	d10d4800 	sub	x0, x0, #0x352
    a198:	d280003c 	mov	x28, #0x1                   	// #1
    a19c:	d28234a1 	mov	x1, #0x11a5                	// #4517
    a1a0:	f2a00021 	movk	x1, #0x1, lsl #16
    a1a4:	9ac02380 	lsl	x0, x28, x0
    a1a8:	ea01001f 	tst	x0, x1
    a1ac:	54ffe261 	b.ne	9df8 <__loadlocale+0x398>  // b.any
    a1b0:	a94573fb 	ldp	x27, x28, [sp, #80]
    a1b4:	17fffea2 	b	9c3c <__loadlocale+0x1dc>
    a1b8:	f10da81f 	cmp	x0, #0x36a
    a1bc:	54ffd3e1 	b.ne	9c38 <__loadlocale+0x1d8>  // b.any
    a1c0:	b000001b 	adrp	x27, b000 <_malloc_r+0x700>
    a1c4:	d0000002 	adrp	x2, c000 <_raise_r+0x40>
    a1c8:	9105037b 	add	x27, x27, #0x140
    a1cc:	913f4042 	add	x2, x2, #0xfd0
    a1d0:	5280003c 	mov	w28, #0x1                   	// #1
    a1d4:	17fffee1 	b	9d58 <__loadlocale+0x2f8>
    a1d8:	f111941f 	cmp	x0, #0x465
    a1dc:	54ffff20 	b.eq	a1c0 <__loadlocale+0x760>  // b.none
    a1e0:	d1138800 	sub	x0, x0, #0x4e2
    a1e4:	f100201f 	cmp	x0, #0x8
    a1e8:	54fffec9 	b.ls	a1c0 <__loadlocale+0x760>  // b.plast
    a1ec:	a94573fb 	ldp	x27, x28, [sp, #80]
    a1f0:	17fffe93 	b	9c3c <__loadlocale+0x1dc>
    a1f4:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a1f8:	aa1803e0 	mov	x0, x24
    a1fc:	9115a021 	add	x1, x1, #0x568
    a200:	17fffefc 	b	9df0 <__loadlocale+0x390>
    a204:	b000001b 	adrp	x27, b000 <_malloc_r+0x700>
    a208:	f0000002 	adrp	x2, d000 <__ascii_wctomb+0x30>
    a20c:	9111837b 	add	x27, x27, #0x460
    a210:	91040042 	add	x2, x2, #0x100
    a214:	5280005c 	mov	w28, #0x2                   	// #2
    a218:	17fffed0 	b	9d58 <__loadlocale+0x2f8>
    a21c:	d503201f 	nop

000000000000a220 <__get_locale_env>:
    a220:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a224:	910003fd 	mov	x29, sp
    a228:	a90153f3 	stp	x19, x20, [sp, #16]
    a22c:	2a0103f4 	mov	w20, w1
    a230:	aa0003f3 	mov	x19, x0
    a234:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a238:	9118c021 	add	x1, x1, #0x630
    a23c:	94000d1d 	bl	d6b0 <_getenv_r>
    a240:	b4000060 	cbz	x0, a24c <__get_locale_env+0x2c>
    a244:	39400001 	ldrb	w1, [x0]
    a248:	35000201 	cbnz	w1, a288 <__get_locale_env+0x68>
    a24c:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a250:	91210021 	add	x1, x1, #0x840
    a254:	aa1303e0 	mov	x0, x19
    a258:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    a25c:	94000d15 	bl	d6b0 <_getenv_r>
    a260:	b4000060 	cbz	x0, a26c <__get_locale_env+0x4c>
    a264:	39400001 	ldrb	w1, [x0]
    a268:	35000101 	cbnz	w1, a288 <__get_locale_env+0x68>
    a26c:	90000021 	adrp	x1, e000 <__func__.0+0x280>
    a270:	aa1303e0 	mov	x0, x19
    a274:	9118e021 	add	x1, x1, #0x638
    a278:	94000d0e 	bl	d6b0 <_getenv_r>
    a27c:	b50000c0 	cbnz	x0, a294 <__get_locale_env+0x74>
    a280:	b0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    a284:	91260000 	add	x0, x0, #0x980
    a288:	a94153f3 	ldp	x19, x20, [sp, #16]
    a28c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a290:	d65f03c0 	ret
    a294:	39400001 	ldrb	w1, [x0]
    a298:	35ffff81 	cbnz	w1, a288 <__get_locale_env+0x68>
    a29c:	b0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    a2a0:	91260000 	add	x0, x0, #0x980
    a2a4:	17fffff9 	b	a288 <__get_locale_env+0x68>
    a2a8:	d503201f 	nop
    a2ac:	d503201f 	nop

000000000000a2b0 <_setlocale_r.part.0>:
    a2b0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    a2b4:	910003fd 	mov	x29, sp
    a2b8:	a9025bf5 	stp	x21, x22, [sp, #32]
    a2bc:	d00004f5 	adrp	x21, a8000 <_stack+0x28000>
    a2c0:	b0000036 	adrp	x22, f000 <IpcFsServer+0x5d8>
    a2c4:	911e42b5 	add	x21, x21, #0x790
    a2c8:	912682d6 	add	x22, x22, #0x9a0
    a2cc:	a90153f3 	stp	x19, x20, [sp, #16]
    a2d0:	910082d4 	add	x20, x22, #0x20
    a2d4:	a9046bf9 	stp	x25, x26, [sp, #64]
    a2d8:	910082b9 	add	x25, x21, #0x20
    a2dc:	aa0003fa 	mov	x26, x0
    a2e0:	aa1903f3 	mov	x19, x25
    a2e4:	a90363f7 	stp	x23, x24, [sp, #48]
    a2e8:	aa0203f8 	mov	x24, x2
    a2ec:	910382b7 	add	x23, x21, #0xe0
    a2f0:	a90573fb 	stp	x27, x28, [sp, #80]
    a2f4:	2a0103fc 	mov	w28, w1
    a2f8:	aa1403fb 	mov	x27, x20
    a2fc:	d503201f 	nop
    a300:	aa1b03e1 	mov	x1, x27
    a304:	aa1303e0 	mov	x0, x19
    a308:	91008273 	add	x19, x19, #0x20
    a30c:	9400090d 	bl	c740 <strcpy>
    a310:	9100837b 	add	x27, x27, #0x20
    a314:	eb17027f 	cmp	x19, x23
    a318:	54ffff41 	b.ne	a300 <_setlocale_r.part.0+0x50>  // b.any
    a31c:	39400300 	ldrb	w0, [x24]
    a320:	350005e0 	cbnz	w0, a3dc <_setlocale_r.part.0+0x12c>
    a324:	35000edc 	cbnz	w28, a4fc <_setlocale_r.part.0+0x24c>
    a328:	aa1903f7 	mov	x23, x25
    a32c:	52800033 	mov	w19, #0x1                   	// #1
    a330:	2a1303e1 	mov	w1, w19
    a334:	aa1a03e0 	mov	x0, x26
    a338:	97ffffba 	bl	a220 <__get_locale_env>
    a33c:	aa0003f5 	mov	x21, x0
    a340:	11000673 	add	w19, w19, #0x1
    a344:	97ffefbf 	bl	6240 <strlen>
    a348:	aa0003e2 	mov	x2, x0
    a34c:	aa1503e1 	mov	x1, x21
    a350:	aa1703e0 	mov	x0, x23
    a354:	f1007c5f 	cmp	x2, #0x1f
    a358:	54000be8 	b.hi	a4d4 <_setlocale_r.part.0+0x224>  // b.pmore
    a35c:	910082f7 	add	x23, x23, #0x20
    a360:	940008f8 	bl	c740 <strcpy>
    a364:	71001e7f 	cmp	w19, #0x7
    a368:	54fffe41 	b.ne	a330 <_setlocale_r.part.0+0x80>  // b.any
    a36c:	d00004f8 	adrp	x24, a8000 <_stack+0x28000>
    a370:	9121c318 	add	x24, x24, #0x870
    a374:	91008318 	add	x24, x24, #0x20
    a378:	aa1903f7 	mov	x23, x25
    a37c:	aa1803f5 	mov	x21, x24
    a380:	52800033 	mov	w19, #0x1                   	// #1
    a384:	d503201f 	nop
    a388:	aa1403e1 	mov	x1, x20
    a38c:	aa1503e0 	mov	x0, x21
    a390:	940008ec 	bl	c740 <strcpy>
    a394:	aa1703e2 	mov	x2, x23
    a398:	2a1303e1 	mov	w1, w19
    a39c:	aa1603e0 	mov	x0, x22
    a3a0:	97fffdb0 	bl	9a60 <__loadlocale>
    a3a4:	b4000c60 	cbz	x0, a530 <_setlocale_r.part.0+0x280>
    a3a8:	11000673 	add	w19, w19, #0x1
    a3ac:	910082b5 	add	x21, x21, #0x20
    a3b0:	91008294 	add	x20, x20, #0x20
    a3b4:	910082f7 	add	x23, x23, #0x20
    a3b8:	71001e7f 	cmp	w19, #0x7
    a3bc:	54fffe61 	b.ne	a388 <_setlocale_r.part.0+0xd8>  // b.any
    a3c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a3c4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a3c8:	a94363f7 	ldp	x23, x24, [sp, #48]
    a3cc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a3d0:	a94573fb 	ldp	x27, x28, [sp, #80]
    a3d4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a3d8:	17fffd72 	b	99a0 <currentlocale>
    a3dc:	3500057c 	cbnz	w28, a488 <_setlocale_r.part.0+0x1d8>
    a3e0:	aa1803e0 	mov	x0, x24
    a3e4:	528005e1 	mov	w1, #0x2f                  	// #47
    a3e8:	94000893 	bl	c634 <strchr>
    a3ec:	aa0003f3 	mov	x19, x0
    a3f0:	b5000060 	cbnz	x0, a3fc <_setlocale_r.part.0+0x14c>
    a3f4:	14000085 	b	a608 <_setlocale_r.part.0+0x358>
    a3f8:	91000673 	add	x19, x19, #0x1
    a3fc:	39400660 	ldrb	w0, [x19, #1]
    a400:	7100bc1f 	cmp	w0, #0x2f
    a404:	54ffffa0 	b.eq	a3f8 <_setlocale_r.part.0+0x148>  // b.none
    a408:	34000660 	cbz	w0, a4d4 <_setlocale_r.part.0+0x224>
    a40c:	aa1903fb 	mov	x27, x25
    a410:	52800037 	mov	w23, #0x1                   	// #1
    a414:	cb180262 	sub	x2, x19, x24
    a418:	71007c5f 	cmp	w2, #0x1f
    a41c:	540005cc 	b.gt	a4d4 <_setlocale_r.part.0+0x224>
    a420:	11000442 	add	w2, w2, #0x1
    a424:	aa1803e1 	mov	x1, x24
    a428:	aa1b03e0 	mov	x0, x27
    a42c:	110006f7 	add	w23, w23, #0x1
    a430:	93407c42 	sxtw	x2, w2
    a434:	94000933 	bl	c900 <strlcpy>
    a438:	39400260 	ldrb	w0, [x19]
    a43c:	7100bc1f 	cmp	w0, #0x2f
    a440:	540000a1 	b.ne	a454 <_setlocale_r.part.0+0x1a4>  // b.any
    a444:	d503201f 	nop
    a448:	38401e60 	ldrb	w0, [x19, #1]!
    a44c:	7100bc1f 	cmp	w0, #0x2f
    a450:	54ffffc0 	b.eq	a448 <_setlocale_r.part.0+0x198>  // b.none
    a454:	34000c00 	cbz	w0, a5d4 <_setlocale_r.part.0+0x324>
    a458:	aa1303e1 	mov	x1, x19
    a45c:	d503201f 	nop
    a460:	38401c20 	ldrb	w0, [x1, #1]!
    a464:	7100bc1f 	cmp	w0, #0x2f
    a468:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    a46c:	54ffffa1 	b.ne	a460 <_setlocale_r.part.0+0x1b0>  // b.any
    a470:	9100837b 	add	x27, x27, #0x20
    a474:	71001eff 	cmp	w23, #0x7
    a478:	54fff7a0 	b.eq	a36c <_setlocale_r.part.0+0xbc>  // b.none
    a47c:	aa1303f8 	mov	x24, x19
    a480:	aa0103f3 	mov	x19, x1
    a484:	17ffffe4 	b	a414 <_setlocale_r.part.0+0x164>
    a488:	aa1803e0 	mov	x0, x24
    a48c:	97ffef6d 	bl	6240 <strlen>
    a490:	f1007c1f 	cmp	x0, #0x1f
    a494:	54000208 	b.hi	a4d4 <_setlocale_r.part.0+0x224>  // b.pmore
    a498:	937b7f80 	sbfiz	x0, x28, #5, #32
    a49c:	aa1803e1 	mov	x1, x24
    a4a0:	8b0002b5 	add	x21, x21, x0
    a4a4:	aa1503e0 	mov	x0, x21
    a4a8:	940008a6 	bl	c740 <strcpy>
    a4ac:	aa1503e2 	mov	x2, x21
    a4b0:	2a1c03e1 	mov	w1, w28
    a4b4:	aa1603e0 	mov	x0, x22
    a4b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a4bc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a4c0:	a94363f7 	ldp	x23, x24, [sp, #48]
    a4c4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a4c8:	a94573fb 	ldp	x27, x28, [sp, #80]
    a4cc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a4d0:	17fffd64 	b	9a60 <__loadlocale>
    a4d4:	528002c0 	mov	w0, #0x16                  	// #22
    a4d8:	b9000340 	str	w0, [x26]
    a4dc:	d2800000 	mov	x0, #0x0                   	// #0
    a4e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a4e4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a4e8:	a94363f7 	ldp	x23, x24, [sp, #48]
    a4ec:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a4f0:	a94573fb 	ldp	x27, x28, [sp, #80]
    a4f4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a4f8:	d65f03c0 	ret
    a4fc:	2a1c03e1 	mov	w1, w28
    a500:	aa1a03e0 	mov	x0, x26
    a504:	97ffff47 	bl	a220 <__get_locale_env>
    a508:	aa0003f3 	mov	x19, x0
    a50c:	97ffef4d 	bl	6240 <strlen>
    a510:	f1007c1f 	cmp	x0, #0x1f
    a514:	54fffe08 	b.hi	a4d4 <_setlocale_r.part.0+0x224>  // b.pmore
    a518:	937b7f80 	sbfiz	x0, x28, #5, #32
    a51c:	aa1303e1 	mov	x1, x19
    a520:	8b0002b5 	add	x21, x21, x0
    a524:	aa1503e0 	mov	x0, x21
    a528:	94000886 	bl	c740 <strcpy>
    a52c:	17ffffe0 	b	a4ac <_setlocale_r.part.0+0x1fc>
    a530:	90000020 	adrp	x0, e000 <__func__.0+0x280>
    a534:	b9400357 	ldr	w23, [x26]
    a538:	9112e015 	add	x21, x0, #0x4b8
    a53c:	52800034 	mov	w20, #0x1                   	// #1
    a540:	6b14027f 	cmp	w19, w20
    a544:	540000e1 	b.ne	a560 <_setlocale_r.part.0+0x2b0>  // b.any
    a548:	1400001a 	b	a5b0 <_setlocale_r.part.0+0x300>
    a54c:	11000694 	add	w20, w20, #0x1
    a550:	91008339 	add	x25, x25, #0x20
    a554:	91008318 	add	x24, x24, #0x20
    a558:	6b14027f 	cmp	w19, w20
    a55c:	540002a0 	b.eq	a5b0 <_setlocale_r.part.0+0x300>  // b.none
    a560:	aa1803e1 	mov	x1, x24
    a564:	aa1903e0 	mov	x0, x25
    a568:	94000876 	bl	c740 <strcpy>
    a56c:	aa1903e2 	mov	x2, x25
    a570:	2a1403e1 	mov	w1, w20
    a574:	aa1603e0 	mov	x0, x22
    a578:	97fffd3a 	bl	9a60 <__loadlocale>
    a57c:	b5fffe80 	cbnz	x0, a54c <_setlocale_r.part.0+0x29c>
    a580:	aa1503e1 	mov	x1, x21
    a584:	aa1903e0 	mov	x0, x25
    a588:	9400086e 	bl	c740 <strcpy>
    a58c:	91008318 	add	x24, x24, #0x20
    a590:	aa1903e2 	mov	x2, x25
    a594:	2a1403e1 	mov	w1, w20
    a598:	aa1603e0 	mov	x0, x22
    a59c:	11000694 	add	w20, w20, #0x1
    a5a0:	97fffd30 	bl	9a60 <__loadlocale>
    a5a4:	91008339 	add	x25, x25, #0x20
    a5a8:	6b14027f 	cmp	w19, w20
    a5ac:	54fffda1 	b.ne	a560 <_setlocale_r.part.0+0x2b0>  // b.any
    a5b0:	b9000357 	str	w23, [x26]
    a5b4:	d2800000 	mov	x0, #0x0                   	// #0
    a5b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a5bc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a5c0:	a94363f7 	ldp	x23, x24, [sp, #48]
    a5c4:	a9446bf9 	ldp	x25, x26, [sp, #64]
    a5c8:	a94573fb 	ldp	x27, x28, [sp, #80]
    a5cc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    a5d0:	d65f03c0 	ret
    a5d4:	71001eff 	cmp	w23, #0x7
    a5d8:	54ffeca0 	b.eq	a36c <_setlocale_r.part.0+0xbc>  // b.none
    a5dc:	937b7ee0 	sbfiz	x0, x23, #5, #32
    a5e0:	8b0002b5 	add	x21, x21, x0
    a5e4:	d503201f 	nop
    a5e8:	d10082a1 	sub	x1, x21, #0x20
    a5ec:	aa1503e0 	mov	x0, x21
    a5f0:	110006f7 	add	w23, w23, #0x1
    a5f4:	94000853 	bl	c740 <strcpy>
    a5f8:	910082b5 	add	x21, x21, #0x20
    a5fc:	71001eff 	cmp	w23, #0x7
    a600:	54ffff41 	b.ne	a5e8 <_setlocale_r.part.0+0x338>  // b.any
    a604:	17ffff5a 	b	a36c <_setlocale_r.part.0+0xbc>
    a608:	aa1803e0 	mov	x0, x24
    a60c:	97ffef0d 	bl	6240 <strlen>
    a610:	f1007c1f 	cmp	x0, #0x1f
    a614:	54fff608 	b.hi	a4d4 <_setlocale_r.part.0+0x224>  // b.pmore
    a618:	aa1903f3 	mov	x19, x25
    a61c:	d503201f 	nop
    a620:	aa1303e0 	mov	x0, x19
    a624:	aa1803e1 	mov	x1, x24
    a628:	91008273 	add	x19, x19, #0x20
    a62c:	94000845 	bl	c740 <strcpy>
    a630:	eb1302ff 	cmp	x23, x19
    a634:	54ffff61 	b.ne	a620 <_setlocale_r.part.0+0x370>  // b.any
    a638:	17ffff4d 	b	a36c <_setlocale_r.part.0+0xbc>
    a63c:	d503201f 	nop

000000000000a640 <_setlocale_r>:
    a640:	aa0003e5 	mov	x5, x0
    a644:	7100183f 	cmp	w1, #0x6
    a648:	54000068 	b.hi	a654 <_setlocale_r+0x14>  // b.pmore
    a64c:	b40000c2 	cbz	x2, a664 <_setlocale_r+0x24>
    a650:	17ffff18 	b	a2b0 <_setlocale_r.part.0>
    a654:	528002c1 	mov	w1, #0x16                  	// #22
    a658:	d2800000 	mov	x0, #0x0                   	// #0
    a65c:	b90000a1 	str	w1, [x5]
    a660:	d65f03c0 	ret
    a664:	340000c1 	cbz	w1, a67c <_setlocale_r+0x3c>
    a668:	937b7c23 	sbfiz	x3, x1, #5, #32
    a66c:	b0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    a670:	91268000 	add	x0, x0, #0x9a0
    a674:	8b030000 	add	x0, x0, x3
    a678:	d65f03c0 	ret
    a67c:	17fffcc9 	b	99a0 <currentlocale>

000000000000a680 <__locale_mb_cur_max>:
    a680:	b0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    a684:	396c0000 	ldrb	w0, [x0, #2816]
    a688:	d65f03c0 	ret
    a68c:	d503201f 	nop

000000000000a690 <setlocale>:
    a690:	b0000024 	adrp	x4, f000 <IpcFsServer+0x5d8>
    a694:	2a0003e3 	mov	w3, w0
    a698:	aa0103e2 	mov	x2, x1
    a69c:	f9411880 	ldr	x0, [x4, #560]
    a6a0:	7100187f 	cmp	w3, #0x6
    a6a4:	54000088 	b.hi	a6b4 <setlocale+0x24>  // b.pmore
    a6a8:	b4000101 	cbz	x1, a6c8 <setlocale+0x38>
    a6ac:	2a0303e1 	mov	w1, w3
    a6b0:	17ffff00 	b	a2b0 <_setlocale_r.part.0>
    a6b4:	528002c1 	mov	w1, #0x16                  	// #22
    a6b8:	d2800003 	mov	x3, #0x0                   	// #0
    a6bc:	b9000001 	str	w1, [x0]
    a6c0:	aa0303e0 	mov	x0, x3
    a6c4:	d65f03c0 	ret
    a6c8:	340000e3 	cbz	w3, a6e4 <setlocale+0x54>
    a6cc:	937b7c63 	sbfiz	x3, x3, #5, #32
    a6d0:	b0000020 	adrp	x0, f000 <IpcFsServer+0x5d8>
    a6d4:	91268000 	add	x0, x0, #0x9a0
    a6d8:	8b030003 	add	x3, x0, x3
    a6dc:	aa0303e0 	mov	x0, x3
    a6e0:	d65f03c0 	ret
    a6e4:	17fffcaf 	b	99a0 <currentlocale>
    a6e8:	d503201f 	nop
    a6ec:	d503201f 	nop

000000000000a6f0 <__smakebuf_r>:
    a6f0:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    a6f4:	910003fd 	mov	x29, sp
    a6f8:	79402022 	ldrh	w2, [x1, #16]
    a6fc:	a90153f3 	stp	x19, x20, [sp, #16]
    a700:	aa0103f3 	mov	x19, x1
    a704:	36080122 	tbz	w2, #1, a728 <__smakebuf_r+0x38>
    a708:	9101dc20 	add	x0, x1, #0x77
    a70c:	52800021 	mov	w1, #0x1                   	// #1
    a710:	f9000260 	str	x0, [x19]
    a714:	f9000e60 	str	x0, [x19, #24]
    a718:	b9002261 	str	w1, [x19, #32]
    a71c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a720:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    a724:	d65f03c0 	ret
    a728:	79c02421 	ldrsh	w1, [x1, #18]
    a72c:	aa0003f4 	mov	x20, x0
    a730:	a9025bf5 	stp	x21, x22, [sp, #32]
    a734:	f9001bf7 	str	x23, [sp, #48]
    a738:	37f80381 	tbnz	w1, #31, a7a8 <__smakebuf_r+0xb8>
    a73c:	910123e2 	add	x2, sp, #0x48
    a740:	94000b88 	bl	d560 <_fstat_r>
    a744:	37f80300 	tbnz	w0, #31, a7a4 <__smakebuf_r+0xb4>
    a748:	b9404fe0 	ldr	w0, [sp, #76]
    a74c:	d2808016 	mov	x22, #0x400                 	// #1024
    a750:	52810015 	mov	w21, #0x800                 	// #2048
    a754:	aa1603e1 	mov	x1, x22
    a758:	12140c00 	and	w0, w0, #0xf000
    a75c:	7140081f 	cmp	w0, #0x2, lsl #12
    a760:	aa1403e0 	mov	x0, x20
    a764:	1a9f17f7 	cset	w23, eq  // eq = none
    a768:	94000066 	bl	a900 <_malloc_r>
    a76c:	b5000320 	cbnz	x0, a7d0 <__smakebuf_r+0xe0>
    a770:	79c02260 	ldrsh	w0, [x19, #16]
    a774:	374805c0 	tbnz	w0, #9, a82c <__smakebuf_r+0x13c>
    a778:	121e7400 	and	w0, w0, #0xfffffffc
    a77c:	9101de61 	add	x1, x19, #0x77
    a780:	321f0000 	orr	w0, w0, #0x2
    a784:	52800022 	mov	w2, #0x1                   	// #1
    a788:	79002260 	strh	w0, [x19, #16]
    a78c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a790:	f9401bf7 	ldr	x23, [sp, #48]
    a794:	f9000261 	str	x1, [x19]
    a798:	f9000e61 	str	x1, [x19, #24]
    a79c:	b9002262 	str	w2, [x19, #32]
    a7a0:	17ffffdf 	b	a71c <__smakebuf_r+0x2c>
    a7a4:	79402262 	ldrh	w2, [x19, #16]
    a7a8:	f279005f 	tst	x2, #0x80
    a7ac:	d2808001 	mov	x1, #0x400                 	// #1024
    a7b0:	d2800816 	mov	x22, #0x40                  	// #64
    a7b4:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    a7b8:	aa1603e1 	mov	x1, x22
    a7bc:	aa1403e0 	mov	x0, x20
    a7c0:	52800017 	mov	w23, #0x0                   	// #0
    a7c4:	52800015 	mov	w21, #0x0                   	// #0
    a7c8:	9400004e 	bl	a900 <_malloc_r>
    a7cc:	b4fffd20 	cbz	x0, a770 <__smakebuf_r+0x80>
    a7d0:	79c02262 	ldrsh	w2, [x19, #16]
    a7d4:	d0ffffe1 	adrp	x1, 8000 <_vfiprintf_r+0x1900>
    a7d8:	91284021 	add	x1, x1, #0xa10
    a7dc:	f9002e81 	str	x1, [x20, #88]
    a7e0:	32190042 	orr	w2, w2, #0x80
    a7e4:	f9000260 	str	x0, [x19]
    a7e8:	79002262 	strh	w2, [x19, #16]
    a7ec:	f9000e60 	str	x0, [x19, #24]
    a7f0:	b9002276 	str	w22, [x19, #32]
    a7f4:	35000117 	cbnz	w23, a814 <__smakebuf_r+0x124>
    a7f8:	2a150042 	orr	w2, w2, w21
    a7fc:	79002262 	strh	w2, [x19, #16]
    a800:	a94153f3 	ldp	x19, x20, [sp, #16]
    a804:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a808:	f9401bf7 	ldr	x23, [sp, #48]
    a80c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    a810:	d65f03c0 	ret
    a814:	79c02661 	ldrsh	w1, [x19, #18]
    a818:	aa1403e0 	mov	x0, x20
    a81c:	94000bad 	bl	d6d0 <_isatty_r>
    a820:	350000c0 	cbnz	w0, a838 <__smakebuf_r+0x148>
    a824:	79c02262 	ldrsh	w2, [x19, #16]
    a828:	17fffff4 	b	a7f8 <__smakebuf_r+0x108>
    a82c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a830:	f9401bf7 	ldr	x23, [sp, #48]
    a834:	17ffffba 	b	a71c <__smakebuf_r+0x2c>
    a838:	79402262 	ldrh	w2, [x19, #16]
    a83c:	121e7442 	and	w2, w2, #0xfffffffc
    a840:	32000042 	orr	w2, w2, #0x1
    a844:	13003c42 	sxth	w2, w2
    a848:	17ffffec 	b	a7f8 <__smakebuf_r+0x108>
    a84c:	d503201f 	nop

000000000000a850 <__swhatbuf_r>:
    a850:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    a854:	910003fd 	mov	x29, sp
    a858:	a90153f3 	stp	x19, x20, [sp, #16]
    a85c:	aa0103f3 	mov	x19, x1
    a860:	79c02421 	ldrsh	w1, [x1, #18]
    a864:	f90013f5 	str	x21, [sp, #32]
    a868:	aa0203f4 	mov	x20, x2
    a86c:	aa0303f5 	mov	x21, x3
    a870:	37f80201 	tbnz	w1, #31, a8b0 <__swhatbuf_r+0x60>
    a874:	9100e3e2 	add	x2, sp, #0x38
    a878:	94000b3a 	bl	d560 <_fstat_r>
    a87c:	37f801a0 	tbnz	w0, #31, a8b0 <__swhatbuf_r+0x60>
    a880:	b9403fe1 	ldr	w1, [sp, #60]
    a884:	d2808002 	mov	x2, #0x400                 	// #1024
    a888:	52810000 	mov	w0, #0x800                 	// #2048
    a88c:	12140c21 	and	w1, w1, #0xf000
    a890:	7140083f 	cmp	w1, #0x2, lsl #12
    a894:	1a9f17e1 	cset	w1, eq  // eq = none
    a898:	b90002a1 	str	w1, [x21]
    a89c:	f9000282 	str	x2, [x20]
    a8a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8a4:	f94013f5 	ldr	x21, [sp, #32]
    a8a8:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    a8ac:	d65f03c0 	ret
    a8b0:	79c02260 	ldrsh	w0, [x19, #16]
    a8b4:	b90002bf 	str	wzr, [x21]
    a8b8:	36380100 	tbz	w0, #7, a8d8 <__swhatbuf_r+0x88>
    a8bc:	d2800801 	mov	x1, #0x40                  	// #64
    a8c0:	f9000281 	str	x1, [x20]
    a8c4:	52800000 	mov	w0, #0x0                   	// #0
    a8c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8cc:	f94013f5 	ldr	x21, [sp, #32]
    a8d0:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    a8d4:	d65f03c0 	ret
    a8d8:	d2808001 	mov	x1, #0x400                 	// #1024
    a8dc:	f9000281 	str	x1, [x20]
    a8e0:	52800000 	mov	w0, #0x0                   	// #0
    a8e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a8e8:	f94013f5 	ldr	x21, [sp, #32]
    a8ec:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    a8f0:	d65f03c0 	ret
    a8f4:	d503201f 	nop
    a8f8:	d503201f 	nop
    a8fc:	d503201f 	nop

000000000000a900 <_malloc_r>:
    a900:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    a904:	910003fd 	mov	x29, sp
    a908:	a90153f3 	stp	x19, x20, [sp, #16]
    a90c:	91005c33 	add	x19, x1, #0x17
    a910:	a9025bf5 	stp	x21, x22, [sp, #32]
    a914:	aa0003f5 	mov	x21, x0
    a918:	a90363f7 	stp	x23, x24, [sp, #48]
    a91c:	f100ba7f 	cmp	x19, #0x2e
    a920:	54000c88 	b.hi	aab0 <_malloc_r+0x1b0>  // b.pmore
    a924:	f100803f 	cmp	x1, #0x20
    a928:	54002068 	b.hi	ad34 <_malloc_r+0x434>  // b.pmore
    a92c:	940003fd 	bl	b920 <__malloc_lock>
    a930:	d2800413 	mov	x19, #0x20                  	// #32
    a934:	d2800a00 	mov	x0, #0x50                  	// #80
    a938:	52800085 	mov	w5, #0x4                   	// #4
    a93c:	b0000034 	adrp	x20, f000 <IpcFsServer+0x5d8>
    a940:	912d2294 	add	x20, x20, #0xb48
    a944:	8b000280 	add	x0, x20, x0
    a948:	110008a5 	add	w5, w5, #0x2
    a94c:	d1004000 	sub	x0, x0, #0x10
    a950:	f9400c01 	ldr	x1, [x0, #24]
    a954:	eb00003f 	cmp	x1, x0
    a958:	54002181 	b.ne	ad88 <_malloc_r+0x488>  // b.any
    a95c:	f9401284 	ldr	x4, [x20, #32]
    a960:	91004282 	add	x2, x20, #0x10
    a964:	eb02009f 	cmp	x4, x2
    a968:	54000f20 	b.eq	ab4c <_malloc_r+0x24c>  // b.none
    a96c:	f9400481 	ldr	x1, [x4, #8]
    a970:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    a974:	cb130023 	sub	x3, x1, x19
    a978:	f1007c7f 	cmp	x3, #0x1f
    a97c:	54002d4c 	b.gt	af24 <_malloc_r+0x624>
    a980:	a9020a82 	stp	x2, x2, [x20, #32]
    a984:	b6f81f23 	tbz	x3, #63, ad68 <_malloc_r+0x468>
    a988:	f107fc3f 	cmp	x1, #0x1ff
    a98c:	54002428 	b.hi	ae10 <_malloc_r+0x510>  // b.pmore
    a990:	d343fc22 	lsr	x2, x1, #3
    a994:	d2800021 	mov	x1, #0x1                   	// #1
    a998:	11000440 	add	w0, w2, #0x1
    a99c:	13027c42 	asr	w2, w2, #2
    a9a0:	531f7800 	lsl	w0, w0, #1
    a9a4:	f9400683 	ldr	x3, [x20, #8]
    a9a8:	8b20ce80 	add	x0, x20, w0, sxtw #3
    a9ac:	9ac22021 	lsl	x1, x1, x2
    a9b0:	aa030021 	orr	x1, x1, x3
    a9b4:	f85f0402 	ldr	x2, [x0], #-16
    a9b8:	f9000681 	str	x1, [x20, #8]
    a9bc:	a9010082 	stp	x2, x0, [x4, #16]
    a9c0:	f9000804 	str	x4, [x0, #16]
    a9c4:	f9000c44 	str	x4, [x2, #24]
    a9c8:	13027ca2 	asr	w2, w5, #2
    a9cc:	d2800020 	mov	x0, #0x1                   	// #1
    a9d0:	9ac22000 	lsl	x0, x0, x2
    a9d4:	eb01001f 	cmp	x0, x1
    a9d8:	54000c68 	b.hi	ab64 <_malloc_r+0x264>  // b.pmore
    a9dc:	ea01001f 	tst	x0, x1
    a9e0:	540000c1 	b.ne	a9f8 <_malloc_r+0xf8>  // b.any
    a9e4:	121e74a5 	and	w5, w5, #0xfffffffc
    a9e8:	d37ff800 	lsl	x0, x0, #1
    a9ec:	110010a5 	add	w5, w5, #0x4
    a9f0:	ea01001f 	tst	x0, x1
    a9f4:	54ffffa0 	b.eq	a9e8 <_malloc_r+0xe8>  // b.none
    a9f8:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    a9fc:	110004a7 	add	w7, w5, #0x1
    aa00:	2a0503e8 	mov	w8, w5
    aa04:	531f78e7 	lsl	w7, w7, #1
    aa08:	8b27cd27 	add	x7, x9, w7, sxtw #3
    aa0c:	8b070287 	add	x7, x20, x7
    aa10:	aa0703e4 	mov	x4, x7
    aa14:	f9400c81 	ldr	x1, [x4, #24]
    aa18:	14000009 	b	aa3c <_malloc_r+0x13c>
    aa1c:	f9400422 	ldr	x2, [x1, #8]
    aa20:	aa0103e6 	mov	x6, x1
    aa24:	f9400c21 	ldr	x1, [x1, #24]
    aa28:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    aa2c:	cb130043 	sub	x3, x2, x19
    aa30:	f1007c7f 	cmp	x3, #0x1f
    aa34:	5400238c 	b.gt	aea4 <_malloc_r+0x5a4>
    aa38:	b6f82563 	tbz	x3, #63, aee4 <_malloc_r+0x5e4>
    aa3c:	eb01009f 	cmp	x4, x1
    aa40:	54fffee1 	b.ne	aa1c <_malloc_r+0x11c>  // b.any
    aa44:	7100f91f 	cmp	w8, #0x3e
    aa48:	540029cd 	b.le	af80 <_malloc_r+0x680>
    aa4c:	91004084 	add	x4, x4, #0x10
    aa50:	11000508 	add	w8, w8, #0x1
    aa54:	f240051f 	tst	x8, #0x3
    aa58:	54fffde1 	b.ne	aa14 <_malloc_r+0x114>  // b.any
    aa5c:	14000005 	b	aa70 <_malloc_r+0x170>
    aa60:	f85f04e1 	ldr	x1, [x7], #-16
    aa64:	510004a5 	sub	w5, w5, #0x1
    aa68:	eb07003f 	cmp	x1, x7
    aa6c:	540035a1 	b.ne	b120 <_malloc_r+0x820>  // b.any
    aa70:	f24004bf 	tst	x5, #0x3
    aa74:	54ffff61 	b.ne	aa60 <_malloc_r+0x160>  // b.any
    aa78:	f9400681 	ldr	x1, [x20, #8]
    aa7c:	8a200021 	bic	x1, x1, x0
    aa80:	f9000681 	str	x1, [x20, #8]
    aa84:	d37ff800 	lsl	x0, x0, #1
    aa88:	f100001f 	cmp	x0, #0x0
    aa8c:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    aa90:	54000089 	b.ls	aaa0 <_malloc_r+0x1a0>  // b.plast
    aa94:	14000034 	b	ab64 <_malloc_r+0x264>
    aa98:	d37ff800 	lsl	x0, x0, #1
    aa9c:	11001108 	add	w8, w8, #0x4
    aaa0:	ea01001f 	tst	x0, x1
    aaa4:	54ffffa0 	b.eq	aa98 <_malloc_r+0x198>  // b.none
    aaa8:	2a0803e5 	mov	w5, w8
    aaac:	17ffffd4 	b	a9fc <_malloc_r+0xfc>
    aab0:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    aab4:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    aab8:	eb02027f 	cmp	x19, x2
    aabc:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    aac0:	540013a8 	b.hi	ad34 <_malloc_r+0x434>  // b.pmore
    aac4:	94000397 	bl	b920 <__malloc_lock>
    aac8:	f107de7f 	cmp	x19, #0x1f7
    aacc:	54002229 	b.ls	af10 <_malloc_r+0x610>  // b.plast
    aad0:	d349fe60 	lsr	x0, x19, #9
    aad4:	b4001420 	cbz	x0, ad58 <_malloc_r+0x458>
    aad8:	f100101f 	cmp	x0, #0x4
    aadc:	54001d08 	b.hi	ae7c <_malloc_r+0x57c>  // b.pmore
    aae0:	d346fe60 	lsr	x0, x19, #6
    aae4:	1100e405 	add	w5, w0, #0x39
    aae8:	1100e000 	add	w0, w0, #0x38
    aaec:	531f78a4 	lsl	w4, w5, #1
    aaf0:	937d7c84 	sbfiz	x4, x4, #3, #32
    aaf4:	b0000034 	adrp	x20, f000 <IpcFsServer+0x5d8>
    aaf8:	912d2294 	add	x20, x20, #0xb48
    aafc:	8b040284 	add	x4, x20, x4
    ab00:	d1004084 	sub	x4, x4, #0x10
    ab04:	f9400c81 	ldr	x1, [x4, #24]
    ab08:	eb01009f 	cmp	x4, x1
    ab0c:	540000c1 	b.ne	ab24 <_malloc_r+0x224>  // b.any
    ab10:	17ffff93 	b	a95c <_malloc_r+0x5c>
    ab14:	b6f815e3 	tbz	x3, #63, add0 <_malloc_r+0x4d0>
    ab18:	f9400c21 	ldr	x1, [x1, #24]
    ab1c:	eb01009f 	cmp	x4, x1
    ab20:	54fff1e0 	b.eq	a95c <_malloc_r+0x5c>  // b.none
    ab24:	f9400422 	ldr	x2, [x1, #8]
    ab28:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    ab2c:	cb130043 	sub	x3, x2, x19
    ab30:	f1007c7f 	cmp	x3, #0x1f
    ab34:	54ffff0d 	b.le	ab14 <_malloc_r+0x214>
    ab38:	f9401284 	ldr	x4, [x20, #32]
    ab3c:	91004282 	add	x2, x20, #0x10
    ab40:	2a0003e5 	mov	w5, w0
    ab44:	eb02009f 	cmp	x4, x2
    ab48:	54fff121 	b.ne	a96c <_malloc_r+0x6c>  // b.any
    ab4c:	f9400681 	ldr	x1, [x20, #8]
    ab50:	13027ca2 	asr	w2, w5, #2
    ab54:	d2800020 	mov	x0, #0x1                   	// #1
    ab58:	9ac22000 	lsl	x0, x0, x2
    ab5c:	eb01001f 	cmp	x0, x1
    ab60:	54fff3e9 	b.ls	a9dc <_malloc_r+0xdc>  // b.plast
    ab64:	f9400a97 	ldr	x23, [x20, #16]
    ab68:	f94006f6 	ldr	x22, [x23, #8]
    ab6c:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    ab70:	eb18027f 	cmp	x19, x24
    ab74:	cb130300 	sub	x0, x24, x19
    ab78:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    ab7c:	54000bec 	b.gt	acf8 <_malloc_r+0x3f8>
    ab80:	d00004e1 	adrp	x1, a8000 <_stack+0x28000>
    ab84:	a90573fb 	stp	x27, x28, [sp, #80]
    ab88:	d000003b 	adrp	x27, 10000 <__malloc_av_+0x4b8>
    ab8c:	f944c421 	ldr	x1, [x1, #2440]
    ab90:	d28203e3 	mov	x3, #0x101f                	// #4127
    ab94:	f941af62 	ldr	x2, [x27, #856]
    ab98:	8b010261 	add	x1, x19, x1
    ab9c:	8b030036 	add	x22, x1, x3
    aba0:	91008021 	add	x1, x1, #0x20
    aba4:	b100045f 	cmn	x2, #0x1
    aba8:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    abac:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    abb0:	aa1503e0 	mov	x0, x21
    abb4:	aa1603e1 	mov	x1, x22
    abb8:	a9046bf9 	stp	x25, x26, [sp, #64]
    abbc:	940004b1 	bl	be80 <_sbrk_r>
    abc0:	8b1802fa 	add	x26, x23, x24
    abc4:	aa0003f9 	mov	x25, x0
    abc8:	b100041f 	cmn	x0, #0x1
    abcc:	54001f20 	b.eq	afb0 <_malloc_r+0x6b0>  // b.none
    abd0:	eb00035f 	cmp	x26, x0
    abd4:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    abd8:	54001ec1 	b.ne	afb0 <_malloc_r+0x6b0>  // b.any
    abdc:	d00004fc 	adrp	x28, a8000 <_stack+0x28000>
    abe0:	b9495381 	ldr	w1, [x28, #2384]
    abe4:	0b160021 	add	w1, w1, w22
    abe8:	b9095381 	str	w1, [x28, #2384]
    abec:	eb00035f 	cmp	x26, x0
    abf0:	54001ce0 	b.eq	af8c <_malloc_r+0x68c>  // b.none
    abf4:	f941af60 	ldr	x0, [x27, #856]
    abf8:	b100041f 	cmn	x0, #0x1
    abfc:	54001d60 	b.eq	afa8 <_malloc_r+0x6a8>  // b.none
    ac00:	cb1a033a 	sub	x26, x25, x26
    ac04:	0b1a0021 	add	w1, w1, w26
    ac08:	b9095381 	str	w1, [x28, #2384]
    ac0c:	f2400f3a 	ands	x26, x25, #0xf
    ac10:	54001e40 	b.eq	afd8 <_malloc_r+0x6d8>  // b.none
    ac14:	cb1a0339 	sub	x25, x25, x26
    ac18:	d2820201 	mov	x1, #0x1010                	// #4112
    ac1c:	91004339 	add	x25, x25, #0x10
    ac20:	cb1a0021 	sub	x1, x1, x26
    ac24:	8b16033b 	add	x27, x25, x22
    ac28:	aa1503e0 	mov	x0, x21
    ac2c:	cb1b0036 	sub	x22, x1, x27
    ac30:	92402ed6 	and	x22, x22, #0xfff
    ac34:	aa1603e1 	mov	x1, x22
    ac38:	94000492 	bl	be80 <_sbrk_r>
    ac3c:	b100041f 	cmn	x0, #0x1
    ac40:	54002480 	b.eq	b0d0 <_malloc_r+0x7d0>  // b.none
    ac44:	cb190000 	sub	x0, x0, x25
    ac48:	2a1603e2 	mov	w2, w22
    ac4c:	8b160016 	add	x22, x0, x22
    ac50:	b9495381 	ldr	w1, [x28, #2384]
    ac54:	b24002d6 	orr	x22, x22, #0x1
    ac58:	f9000a99 	str	x25, [x20, #16]
    ac5c:	0b010041 	add	w1, w2, w1
    ac60:	b9095381 	str	w1, [x28, #2384]
    ac64:	f9000736 	str	x22, [x25, #8]
    ac68:	eb1402ff 	cmp	x23, x20
    ac6c:	54002000 	b.eq	b06c <_malloc_r+0x76c>  // b.none
    ac70:	f1007f1f 	cmp	x24, #0x1f
    ac74:	54001cc9 	b.ls	b00c <_malloc_r+0x70c>  // b.plast
    ac78:	d1006300 	sub	x0, x24, #0x18
    ac7c:	d2800124 	mov	x4, #0x9                   	// #9
    ac80:	f94006e2 	ldr	x2, [x23, #8]
    ac84:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    ac88:	8b0002e3 	add	x3, x23, x0
    ac8c:	92400042 	and	x2, x2, #0x1
    ac90:	aa000042 	orr	x2, x2, x0
    ac94:	f90006e2 	str	x2, [x23, #8]
    ac98:	f8008c64 	str	x4, [x3, #8]!
    ac9c:	f9000464 	str	x4, [x3, #8]
    aca0:	f1007c1f 	cmp	x0, #0x1f
    aca4:	54002088 	b.hi	b0b4 <_malloc_r+0x7b4>  // b.pmore
    aca8:	f9400736 	ldr	x22, [x25, #8]
    acac:	aa1903f7 	mov	x23, x25
    acb0:	d00004e0 	adrp	x0, a8000 <_stack+0x28000>
    acb4:	93407c21 	sxtw	x1, w1
    acb8:	f944bc02 	ldr	x2, [x0, #2424]
    acbc:	eb02003f 	cmp	x1, x2
    acc0:	54000049 	b.ls	acc8 <_malloc_r+0x3c8>  // b.plast
    acc4:	f904bc01 	str	x1, [x0, #2424]
    acc8:	d00004e0 	adrp	x0, a8000 <_stack+0x28000>
    accc:	f944c002 	ldr	x2, [x0, #2432]
    acd0:	eb02003f 	cmp	x1, x2
    acd4:	54000049 	b.ls	acdc <_malloc_r+0x3dc>  // b.plast
    acd8:	f904c001 	str	x1, [x0, #2432]
    acdc:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    ace0:	eb00027f 	cmp	x19, x0
    ace4:	cb130000 	sub	x0, x0, x19
    ace8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    acec:	5400194d 	b.le	b014 <_malloc_r+0x714>
    acf0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    acf4:	a94573fb 	ldp	x27, x28, [sp, #80]
    acf8:	8b1302e2 	add	x2, x23, x19
    acfc:	b2400273 	orr	x19, x19, #0x1
    ad00:	f90006f3 	str	x19, [x23, #8]
    ad04:	b2400001 	orr	x1, x0, #0x1
    ad08:	f9000a82 	str	x2, [x20, #16]
    ad0c:	f9000441 	str	x1, [x2, #8]
    ad10:	aa1503e0 	mov	x0, x21
    ad14:	910042f7 	add	x23, x23, #0x10
    ad18:	94000306 	bl	b930 <__malloc_unlock>
    ad1c:	aa1703e0 	mov	x0, x23
    ad20:	a94153f3 	ldp	x19, x20, [sp, #16]
    ad24:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ad28:	a94363f7 	ldp	x23, x24, [sp, #48]
    ad2c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    ad30:	d65f03c0 	ret
    ad34:	52800180 	mov	w0, #0xc                   	// #12
    ad38:	d2800017 	mov	x23, #0x0                   	// #0
    ad3c:	b90002a0 	str	w0, [x21]
    ad40:	aa1703e0 	mov	x0, x23
    ad44:	a94153f3 	ldp	x19, x20, [sp, #16]
    ad48:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ad4c:	a94363f7 	ldp	x23, x24, [sp, #48]
    ad50:	a8c67bfd 	ldp	x29, x30, [sp], #96
    ad54:	d65f03c0 	ret
    ad58:	d2808004 	mov	x4, #0x400                 	// #1024
    ad5c:	52800805 	mov	w5, #0x40                  	// #64
    ad60:	528007e0 	mov	w0, #0x3f                  	// #63
    ad64:	17ffff64 	b	aaf4 <_malloc_r+0x1f4>
    ad68:	8b010081 	add	x1, x4, x1
    ad6c:	aa1503e0 	mov	x0, x21
    ad70:	91004097 	add	x23, x4, #0x10
    ad74:	f9400422 	ldr	x2, [x1, #8]
    ad78:	b2400042 	orr	x2, x2, #0x1
    ad7c:	f9000422 	str	x2, [x1, #8]
    ad80:	940002ec 	bl	b930 <__malloc_unlock>
    ad84:	17ffffef 	b	ad40 <_malloc_r+0x440>
    ad88:	a9409022 	ldp	x2, x4, [x1, #8]
    ad8c:	91004037 	add	x23, x1, #0x10
    ad90:	f9400c23 	ldr	x3, [x1, #24]
    ad94:	aa1503e0 	mov	x0, x21
    ad98:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    ad9c:	8b020022 	add	x2, x1, x2
    ada0:	f9400441 	ldr	x1, [x2, #8]
    ada4:	f9000c83 	str	x3, [x4, #24]
    ada8:	f9000864 	str	x4, [x3, #16]
    adac:	b2400021 	orr	x1, x1, #0x1
    adb0:	f9000441 	str	x1, [x2, #8]
    adb4:	940002df 	bl	b930 <__malloc_unlock>
    adb8:	aa1703e0 	mov	x0, x23
    adbc:	a94153f3 	ldp	x19, x20, [sp, #16]
    adc0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    adc4:	a94363f7 	ldp	x23, x24, [sp, #48]
    adc8:	a8c67bfd 	ldp	x29, x30, [sp], #96
    adcc:	d65f03c0 	ret
    add0:	8b020022 	add	x2, x1, x2
    add4:	91004037 	add	x23, x1, #0x10
    add8:	a9410c24 	ldp	x4, x3, [x1, #16]
    addc:	aa1503e0 	mov	x0, x21
    ade0:	f9400441 	ldr	x1, [x2, #8]
    ade4:	f9000c83 	str	x3, [x4, #24]
    ade8:	b2400021 	orr	x1, x1, #0x1
    adec:	f9000864 	str	x4, [x3, #16]
    adf0:	f9000441 	str	x1, [x2, #8]
    adf4:	940002cf 	bl	b930 <__malloc_unlock>
    adf8:	aa1703e0 	mov	x0, x23
    adfc:	a94153f3 	ldp	x19, x20, [sp, #16]
    ae00:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ae04:	a94363f7 	ldp	x23, x24, [sp, #48]
    ae08:	a8c67bfd 	ldp	x29, x30, [sp], #96
    ae0c:	d65f03c0 	ret
    ae10:	d349fc20 	lsr	x0, x1, #9
    ae14:	f127fc3f 	cmp	x1, #0x9ff
    ae18:	540009e9 	b.ls	af54 <_malloc_r+0x654>  // b.plast
    ae1c:	f100501f 	cmp	x0, #0x14
    ae20:	54001068 	b.hi	b02c <_malloc_r+0x72c>  // b.pmore
    ae24:	11017003 	add	w3, w0, #0x5c
    ae28:	11016c02 	add	w2, w0, #0x5b
    ae2c:	531f7863 	lsl	w3, w3, #1
    ae30:	937d7c63 	sbfiz	x3, x3, #3, #32
    ae34:	8b030283 	add	x3, x20, x3
    ae38:	f85f0460 	ldr	x0, [x3], #-16
    ae3c:	eb00007f 	cmp	x3, x0
    ae40:	54000be0 	b.eq	afbc <_malloc_r+0x6bc>  // b.none
    ae44:	d503201f 	nop
    ae48:	f9400402 	ldr	x2, [x0, #8]
    ae4c:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    ae50:	eb01005f 	cmp	x2, x1
    ae54:	54000089 	b.ls	ae64 <_malloc_r+0x564>  // b.plast
    ae58:	f9400800 	ldr	x0, [x0, #16]
    ae5c:	eb00007f 	cmp	x3, x0
    ae60:	54ffff41 	b.ne	ae48 <_malloc_r+0x548>  // b.any
    ae64:	f9400681 	ldr	x1, [x20, #8]
    ae68:	f9400c03 	ldr	x3, [x0, #24]
    ae6c:	a9010c80 	stp	x0, x3, [x4, #16]
    ae70:	f9000864 	str	x4, [x3, #16]
    ae74:	f9000c04 	str	x4, [x0, #24]
    ae78:	17fffed4 	b	a9c8 <_malloc_r+0xc8>
    ae7c:	f100501f 	cmp	x0, #0x14
    ae80:	54000769 	b.ls	af6c <_malloc_r+0x66c>  // b.plast
    ae84:	f101501f 	cmp	x0, #0x54
    ae88:	54000e28 	b.hi	b04c <_malloc_r+0x74c>  // b.pmore
    ae8c:	d34cfe60 	lsr	x0, x19, #12
    ae90:	1101bc05 	add	w5, w0, #0x6f
    ae94:	1101b800 	add	w0, w0, #0x6e
    ae98:	531f78a4 	lsl	w4, w5, #1
    ae9c:	937d7c84 	sbfiz	x4, x4, #3, #32
    aea0:	17ffff15 	b	aaf4 <_malloc_r+0x1f4>
    aea4:	f94008c7 	ldr	x7, [x6, #16]
    aea8:	b2400260 	orr	x0, x19, #0x1
    aeac:	f90004c0 	str	x0, [x6, #8]
    aeb0:	8b1300c4 	add	x4, x6, x19
    aeb4:	91004285 	add	x5, x20, #0x10
    aeb8:	b2400068 	orr	x8, x3, #0x1
    aebc:	f9000ce1 	str	x1, [x7, #24]
    aec0:	910040d7 	add	x23, x6, #0x10
    aec4:	f9000827 	str	x7, [x1, #16]
    aec8:	aa1503e0 	mov	x0, x21
    aecc:	a9021284 	stp	x4, x4, [x20, #32]
    aed0:	a9009488 	stp	x8, x5, [x4, #8]
    aed4:	f9000c85 	str	x5, [x4, #24]
    aed8:	f82268c3 	str	x3, [x6, x2]
    aedc:	94000295 	bl	b930 <__malloc_unlock>
    aee0:	17ffff98 	b	ad40 <_malloc_r+0x440>
    aee4:	8b0200c2 	add	x2, x6, x2
    aee8:	aa0603f7 	mov	x23, x6
    aeec:	aa1503e0 	mov	x0, x21
    aef0:	f9400443 	ldr	x3, [x2, #8]
    aef4:	f8410ee4 	ldr	x4, [x23, #16]!
    aef8:	b2400063 	orr	x3, x3, #0x1
    aefc:	f9000443 	str	x3, [x2, #8]
    af00:	f9000c81 	str	x1, [x4, #24]
    af04:	f9000824 	str	x4, [x1, #16]
    af08:	9400028a 	bl	b930 <__malloc_unlock>
    af0c:	17ffff8d 	b	ad40 <_malloc_r+0x440>
    af10:	d343fe65 	lsr	x5, x19, #3
    af14:	110004a0 	add	w0, w5, #0x1
    af18:	531f7800 	lsl	w0, w0, #1
    af1c:	937d7c00 	sbfiz	x0, x0, #3, #32
    af20:	17fffe87 	b	a93c <_malloc_r+0x3c>
    af24:	8b130085 	add	x5, x4, x19
    af28:	b2400273 	orr	x19, x19, #0x1
    af2c:	f9000493 	str	x19, [x4, #8]
    af30:	b2400066 	orr	x6, x3, #0x1
    af34:	a9021685 	stp	x5, x5, [x20, #32]
    af38:	aa1503e0 	mov	x0, x21
    af3c:	91004097 	add	x23, x4, #0x10
    af40:	a90088a6 	stp	x6, x2, [x5, #8]
    af44:	f9000ca2 	str	x2, [x5, #24]
    af48:	f8216883 	str	x3, [x4, x1]
    af4c:	94000279 	bl	b930 <__malloc_unlock>
    af50:	17ffff7c 	b	ad40 <_malloc_r+0x440>
    af54:	d346fc20 	lsr	x0, x1, #6
    af58:	1100e403 	add	w3, w0, #0x39
    af5c:	1100e002 	add	w2, w0, #0x38
    af60:	531f7863 	lsl	w3, w3, #1
    af64:	937d7c63 	sbfiz	x3, x3, #3, #32
    af68:	17ffffb3 	b	ae34 <_malloc_r+0x534>
    af6c:	11017005 	add	w5, w0, #0x5c
    af70:	11016c00 	add	w0, w0, #0x5b
    af74:	531f78a4 	lsl	w4, w5, #1
    af78:	937d7c84 	sbfiz	x4, x4, #3, #32
    af7c:	17fffede 	b	aaf4 <_malloc_r+0x1f4>
    af80:	11000508 	add	w8, w8, #0x1
    af84:	91008084 	add	x4, x4, #0x20
    af88:	17fffeb2 	b	aa50 <_malloc_r+0x150>
    af8c:	f2402f5f 	tst	x26, #0xfff
    af90:	54ffe321 	b.ne	abf4 <_malloc_r+0x2f4>  // b.any
    af94:	f9400a97 	ldr	x23, [x20, #16]
    af98:	8b160316 	add	x22, x24, x22
    af9c:	b24002d6 	orr	x22, x22, #0x1
    afa0:	f90006f6 	str	x22, [x23, #8]
    afa4:	17ffff43 	b	acb0 <_malloc_r+0x3b0>
    afa8:	f901af79 	str	x25, [x27, #856]
    afac:	17ffff18 	b	ac0c <_malloc_r+0x30c>
    afb0:	f9400a97 	ldr	x23, [x20, #16]
    afb4:	f94006f6 	ldr	x22, [x23, #8]
    afb8:	17ffff49 	b	acdc <_malloc_r+0x3dc>
    afbc:	f9400686 	ldr	x6, [x20, #8]
    afc0:	13027c42 	asr	w2, w2, #2
    afc4:	d2800021 	mov	x1, #0x1                   	// #1
    afc8:	9ac22021 	lsl	x1, x1, x2
    afcc:	aa060021 	orr	x1, x1, x6
    afd0:	f9000681 	str	x1, [x20, #8]
    afd4:	17ffffa6 	b	ae6c <_malloc_r+0x56c>
    afd8:	8b16033a 	add	x26, x25, x22
    afdc:	aa1503e0 	mov	x0, x21
    afe0:	cb1a03fa 	neg	x26, x26
    afe4:	92402f5a 	and	x26, x26, #0xfff
    afe8:	aa1a03e1 	mov	x1, x26
    afec:	940003a5 	bl	be80 <_sbrk_r>
    aff0:	52800002 	mov	w2, #0x0                   	// #0
    aff4:	b100041f 	cmn	x0, #0x1
    aff8:	54ffe2c0 	b.eq	ac50 <_malloc_r+0x350>  // b.none
    affc:	cb190000 	sub	x0, x0, x25
    b000:	2a1a03e2 	mov	w2, w26
    b004:	8b1a0016 	add	x22, x0, x26
    b008:	17ffff12 	b	ac50 <_malloc_r+0x350>
    b00c:	d2800020 	mov	x0, #0x1                   	// #1
    b010:	f9000720 	str	x0, [x25, #8]
    b014:	aa1503e0 	mov	x0, x21
    b018:	d2800017 	mov	x23, #0x0                   	// #0
    b01c:	94000245 	bl	b930 <__malloc_unlock>
    b020:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b024:	a94573fb 	ldp	x27, x28, [sp, #80]
    b028:	17ffff46 	b	ad40 <_malloc_r+0x440>
    b02c:	f101501f 	cmp	x0, #0x54
    b030:	54000228 	b.hi	b074 <_malloc_r+0x774>  // b.pmore
    b034:	d34cfc20 	lsr	x0, x1, #12
    b038:	1101bc03 	add	w3, w0, #0x6f
    b03c:	1101b802 	add	w2, w0, #0x6e
    b040:	531f7863 	lsl	w3, w3, #1
    b044:	937d7c63 	sbfiz	x3, x3, #3, #32
    b048:	17ffff7b 	b	ae34 <_malloc_r+0x534>
    b04c:	f105501f 	cmp	x0, #0x154
    b050:	54000228 	b.hi	b094 <_malloc_r+0x794>  // b.pmore
    b054:	d34ffe60 	lsr	x0, x19, #15
    b058:	1101e005 	add	w5, w0, #0x78
    b05c:	1101dc00 	add	w0, w0, #0x77
    b060:	531f78a4 	lsl	w4, w5, #1
    b064:	937d7c84 	sbfiz	x4, x4, #3, #32
    b068:	17fffea3 	b	aaf4 <_malloc_r+0x1f4>
    b06c:	aa1903f7 	mov	x23, x25
    b070:	17ffff10 	b	acb0 <_malloc_r+0x3b0>
    b074:	f105501f 	cmp	x0, #0x154
    b078:	54000368 	b.hi	b0e4 <_malloc_r+0x7e4>  // b.pmore
    b07c:	d34ffc20 	lsr	x0, x1, #15
    b080:	1101e003 	add	w3, w0, #0x78
    b084:	1101dc02 	add	w2, w0, #0x77
    b088:	531f7863 	lsl	w3, w3, #1
    b08c:	937d7c63 	sbfiz	x3, x3, #3, #32
    b090:	17ffff69 	b	ae34 <_malloc_r+0x534>
    b094:	f115501f 	cmp	x0, #0x554
    b098:	54000368 	b.hi	b104 <_malloc_r+0x804>  // b.pmore
    b09c:	d352fe60 	lsr	x0, x19, #18
    b0a0:	1101f405 	add	w5, w0, #0x7d
    b0a4:	1101f000 	add	w0, w0, #0x7c
    b0a8:	531f78a4 	lsl	w4, w5, #1
    b0ac:	937d7c84 	sbfiz	x4, x4, #3, #32
    b0b0:	17fffe91 	b	aaf4 <_malloc_r+0x1f4>
    b0b4:	910042e1 	add	x1, x23, #0x10
    b0b8:	aa1503e0 	mov	x0, x21
    b0bc:	97fff7f1 	bl	9080 <_free_r>
    b0c0:	f9400a97 	ldr	x23, [x20, #16]
    b0c4:	b9495381 	ldr	w1, [x28, #2384]
    b0c8:	f94006f6 	ldr	x22, [x23, #8]
    b0cc:	17fffef9 	b	acb0 <_malloc_r+0x3b0>
    b0d0:	d100435a 	sub	x26, x26, #0x10
    b0d4:	52800002 	mov	w2, #0x0                   	// #0
    b0d8:	8b1a0376 	add	x22, x27, x26
    b0dc:	cb1902d6 	sub	x22, x22, x25
    b0e0:	17fffedc 	b	ac50 <_malloc_r+0x350>
    b0e4:	f115501f 	cmp	x0, #0x554
    b0e8:	54000168 	b.hi	b114 <_malloc_r+0x814>  // b.pmore
    b0ec:	d352fc20 	lsr	x0, x1, #18
    b0f0:	1101f403 	add	w3, w0, #0x7d
    b0f4:	1101f002 	add	w2, w0, #0x7c
    b0f8:	531f7863 	lsl	w3, w3, #1
    b0fc:	937d7c63 	sbfiz	x3, x3, #3, #32
    b100:	17ffff4d 	b	ae34 <_malloc_r+0x534>
    b104:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    b108:	52800fe5 	mov	w5, #0x7f                  	// #127
    b10c:	52800fc0 	mov	w0, #0x7e                  	// #126
    b110:	17fffe79 	b	aaf4 <_malloc_r+0x1f4>
    b114:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    b118:	52800fc2 	mov	w2, #0x7e                  	// #126
    b11c:	17ffff46 	b	ae34 <_malloc_r+0x534>
    b120:	f9400681 	ldr	x1, [x20, #8]
    b124:	17fffe58 	b	aa84 <_malloc_r+0x184>
    b128:	d503201f 	nop
    b12c:	d503201f 	nop

000000000000b130 <_mbtowc_r>:
    b130:	90000025 	adrp	x5, f000 <IpcFsServer+0x5d8>
    b134:	f94544a5 	ldr	x5, [x5, #2696]
    b138:	aa0503f0 	mov	x16, x5
    b13c:	d61f0200 	br	x16

000000000000b140 <__ascii_mbtowc>:
    b140:	d10043ff 	sub	sp, sp, #0x10
    b144:	f100003f 	cmp	x1, #0x0
    b148:	910033e0 	add	x0, sp, #0xc
    b14c:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    b150:	b4000122 	cbz	x2, b174 <__ascii_mbtowc+0x34>
    b154:	b4000163 	cbz	x3, b180 <__ascii_mbtowc+0x40>
    b158:	39400040 	ldrb	w0, [x2]
    b15c:	b9000020 	str	w0, [x1]
    b160:	39400040 	ldrb	w0, [x2]
    b164:	7100001f 	cmp	w0, #0x0
    b168:	1a9f07e0 	cset	w0, ne  // ne = any
    b16c:	910043ff 	add	sp, sp, #0x10
    b170:	d65f03c0 	ret
    b174:	52800000 	mov	w0, #0x0                   	// #0
    b178:	910043ff 	add	sp, sp, #0x10
    b17c:	d65f03c0 	ret
    b180:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b184:	17fffffa 	b	b16c <__ascii_mbtowc+0x2c>
    b188:	d503201f 	nop
    b18c:	d503201f 	nop

000000000000b190 <__utf8_mbtowc>:
    b190:	d10043ff 	sub	sp, sp, #0x10
    b194:	f100003f 	cmp	x1, #0x0
    b198:	910033e5 	add	x5, sp, #0xc
    b19c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    b1a0:	b4000a02 	cbz	x2, b2e0 <__utf8_mbtowc+0x150>
    b1a4:	b40012a3 	cbz	x3, b3f8 <__utf8_mbtowc+0x268>
    b1a8:	b9400086 	ldr	w6, [x4]
    b1ac:	aa0003e8 	mov	x8, x0
    b1b0:	350003c6 	cbnz	w6, b228 <__utf8_mbtowc+0x98>
    b1b4:	39400040 	ldrb	w0, [x2]
    b1b8:	52800025 	mov	w5, #0x1                   	// #1
    b1bc:	340003c0 	cbz	w0, b234 <__utf8_mbtowc+0xa4>
    b1c0:	7101fc1f 	cmp	w0, #0x7f
    b1c4:	5400084d 	b.le	b2cc <__utf8_mbtowc+0x13c>
    b1c8:	51030007 	sub	w7, w0, #0xc0
    b1cc:	71007cff 	cmp	w7, #0x1f
    b1d0:	540003a8 	b.hi	b244 <__utf8_mbtowc+0xb4>  // b.pmore
    b1d4:	39001080 	strb	w0, [x4, #4]
    b1d8:	350000a6 	cbnz	w6, b1ec <__utf8_mbtowc+0x5c>
    b1dc:	52800026 	mov	w6, #0x1                   	// #1
    b1e0:	b9000086 	str	w6, [x4]
    b1e4:	f100047f 	cmp	x3, #0x1
    b1e8:	54001080 	b.eq	b3f8 <__utf8_mbtowc+0x268>  // b.none
    b1ec:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    b1f0:	110004a5 	add	w5, w5, #0x1
    b1f4:	51020043 	sub	w3, w2, #0x80
    b1f8:	7100fc7f 	cmp	w3, #0x3f
    b1fc:	54001068 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b200:	7103041f 	cmp	w0, #0xc1
    b204:	5400102d 	b.le	b408 <__utf8_mbtowc+0x278>
    b208:	531a1000 	ubfiz	w0, w0, #6, #5
    b20c:	12001442 	and	w2, w2, #0x3f
    b210:	b900009f 	str	wzr, [x4]
    b214:	2a020002 	orr	w2, w0, w2
    b218:	b9000022 	str	w2, [x1]
    b21c:	2a0503e0 	mov	w0, w5
    b220:	910043ff 	add	sp, sp, #0x10
    b224:	d65f03c0 	ret
    b228:	39401080 	ldrb	w0, [x4, #4]
    b22c:	52800005 	mov	w5, #0x0                   	// #0
    b230:	35fffc80 	cbnz	w0, b1c0 <__utf8_mbtowc+0x30>
    b234:	b900003f 	str	wzr, [x1]
    b238:	b900009f 	str	wzr, [x4]
    b23c:	910043ff 	add	sp, sp, #0x10
    b240:	d65f03c0 	ret
    b244:	51038007 	sub	w7, w0, #0xe0
    b248:	71003cff 	cmp	w7, #0xf
    b24c:	54000508 	b.hi	b2ec <__utf8_mbtowc+0x15c>  // b.pmore
    b250:	39001080 	strb	w0, [x4, #4]
    b254:	34000aa6 	cbz	w6, b3a8 <__utf8_mbtowc+0x218>
    b258:	b100047f 	cmn	x3, #0x1
    b25c:	9a830463 	cinc	x3, x3, ne  // ne = any
    b260:	710004df 	cmp	w6, #0x1
    b264:	54000aa0 	b.eq	b3b8 <__utf8_mbtowc+0x228>  // b.none
    b268:	39401487 	ldrb	w7, [x4, #5]
    b26c:	7103801f 	cmp	w0, #0xe0
    b270:	528013e9 	mov	w9, #0x9f                  	// #159
    b274:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    b278:	54000c8d 	b.le	b408 <__utf8_mbtowc+0x278>
    b27c:	510200e9 	sub	w9, w7, #0x80
    b280:	7100fd3f 	cmp	w9, #0x3f
    b284:	54000c28 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b288:	39001487 	strb	w7, [x4, #5]
    b28c:	710004df 	cmp	w6, #0x1
    b290:	54000ac0 	b.eq	b3e8 <__utf8_mbtowc+0x258>  // b.none
    b294:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    b298:	110004a5 	add	w5, w5, #0x1
    b29c:	51020043 	sub	w3, w2, #0x80
    b2a0:	7100fc7f 	cmp	w3, #0x3f
    b2a4:	54000b28 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b2a8:	53140c00 	ubfiz	w0, w0, #12, #4
    b2ac:	531a14e7 	ubfiz	w7, w7, #6, #6
    b2b0:	2a070007 	orr	w7, w0, w7
    b2b4:	12001442 	and	w2, w2, #0x3f
    b2b8:	b900009f 	str	wzr, [x4]
    b2bc:	2a0200e7 	orr	w7, w7, w2
    b2c0:	2a0503e0 	mov	w0, w5
    b2c4:	b9000027 	str	w7, [x1]
    b2c8:	17ffffdd 	b	b23c <__utf8_mbtowc+0xac>
    b2cc:	b900009f 	str	wzr, [x4]
    b2d0:	b9000020 	str	w0, [x1]
    b2d4:	52800020 	mov	w0, #0x1                   	// #1
    b2d8:	910043ff 	add	sp, sp, #0x10
    b2dc:	d65f03c0 	ret
    b2e0:	52800000 	mov	w0, #0x0                   	// #0
    b2e4:	910043ff 	add	sp, sp, #0x10
    b2e8:	d65f03c0 	ret
    b2ec:	5103c007 	sub	w7, w0, #0xf0
    b2f0:	710010ff 	cmp	w7, #0x4
    b2f4:	540008a8 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b2f8:	39001080 	strb	w0, [x4, #4]
    b2fc:	34000666 	cbz	w6, b3c8 <__utf8_mbtowc+0x238>
    b300:	b100047f 	cmn	x3, #0x1
    b304:	9a830463 	cinc	x3, x3, ne  // ne = any
    b308:	710004df 	cmp	w6, #0x1
    b30c:	54000660 	b.eq	b3d8 <__utf8_mbtowc+0x248>  // b.none
    b310:	39401487 	ldrb	w7, [x4, #5]
    b314:	7103c01f 	cmp	w0, #0xf0
    b318:	54000740 	b.eq	b400 <__utf8_mbtowc+0x270>  // b.none
    b31c:	71023cff 	cmp	w7, #0x8f
    b320:	52801e89 	mov	w9, #0xf4                  	// #244
    b324:	7a49c000 	ccmp	w0, w9, #0x0, gt
    b328:	54000700 	b.eq	b408 <__utf8_mbtowc+0x278>  // b.none
    b32c:	510200e9 	sub	w9, w7, #0x80
    b330:	7100fd3f 	cmp	w9, #0x3f
    b334:	540006a8 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b338:	39001487 	strb	w7, [x4, #5]
    b33c:	710004df 	cmp	w6, #0x1
    b340:	540006c0 	b.eq	b418 <__utf8_mbtowc+0x288>  // b.none
    b344:	b9400086 	ldr	w6, [x4]
    b348:	b100047f 	cmn	x3, #0x1
    b34c:	9a830463 	cinc	x3, x3, ne  // ne = any
    b350:	710008df 	cmp	w6, #0x2
    b354:	540006a0 	b.eq	b428 <__utf8_mbtowc+0x298>  // b.none
    b358:	39401886 	ldrb	w6, [x4, #6]
    b35c:	510200c3 	sub	w3, w6, #0x80
    b360:	7100fc7f 	cmp	w3, #0x3f
    b364:	54000528 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b368:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    b36c:	110004a5 	add	w5, w5, #0x1
    b370:	51020043 	sub	w3, w2, #0x80
    b374:	7100fc7f 	cmp	w3, #0x3f
    b378:	54000488 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b37c:	530e0800 	ubfiz	w0, w0, #18, #3
    b380:	531414e7 	ubfiz	w7, w7, #12, #6
    b384:	531a14c6 	ubfiz	w6, w6, #6, #6
    b388:	12001442 	and	w2, w2, #0x3f
    b38c:	2a070007 	orr	w7, w0, w7
    b390:	2a0200c6 	orr	w6, w6, w2
    b394:	2a0600e6 	orr	w6, w7, w6
    b398:	b9000026 	str	w6, [x1]
    b39c:	2a0503e0 	mov	w0, w5
    b3a0:	b900009f 	str	wzr, [x4]
    b3a4:	17ffffa6 	b	b23c <__utf8_mbtowc+0xac>
    b3a8:	52800026 	mov	w6, #0x1                   	// #1
    b3ac:	b9000086 	str	w6, [x4]
    b3b0:	f100047f 	cmp	x3, #0x1
    b3b4:	54000220 	b.eq	b3f8 <__utf8_mbtowc+0x268>  // b.none
    b3b8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    b3bc:	52800026 	mov	w6, #0x1                   	// #1
    b3c0:	0b0600a5 	add	w5, w5, w6
    b3c4:	17ffffaa 	b	b26c <__utf8_mbtowc+0xdc>
    b3c8:	52800026 	mov	w6, #0x1                   	// #1
    b3cc:	b9000086 	str	w6, [x4]
    b3d0:	f100047f 	cmp	x3, #0x1
    b3d4:	54000120 	b.eq	b3f8 <__utf8_mbtowc+0x268>  // b.none
    b3d8:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    b3dc:	52800026 	mov	w6, #0x1                   	// #1
    b3e0:	0b0600a5 	add	w5, w5, w6
    b3e4:	17ffffcc 	b	b314 <__utf8_mbtowc+0x184>
    b3e8:	52800046 	mov	w6, #0x2                   	// #2
    b3ec:	b9000086 	str	w6, [x4]
    b3f0:	f100087f 	cmp	x3, #0x2
    b3f4:	54fff501 	b.ne	b294 <__utf8_mbtowc+0x104>  // b.any
    b3f8:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b3fc:	17ffff90 	b	b23c <__utf8_mbtowc+0xac>
    b400:	71023cff 	cmp	w7, #0x8f
    b404:	54fff94c 	b.gt	b32c <__utf8_mbtowc+0x19c>
    b408:	52801141 	mov	w1, #0x8a                  	// #138
    b40c:	12800000 	mov	w0, #0xffffffff            	// #-1
    b410:	b9000101 	str	w1, [x8]
    b414:	17ffff8a 	b	b23c <__utf8_mbtowc+0xac>
    b418:	52800046 	mov	w6, #0x2                   	// #2
    b41c:	b9000086 	str	w6, [x4]
    b420:	f100087f 	cmp	x3, #0x2
    b424:	54fffea0 	b.eq	b3f8 <__utf8_mbtowc+0x268>  // b.none
    b428:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    b42c:	110004a5 	add	w5, w5, #0x1
    b430:	510200c9 	sub	w9, w6, #0x80
    b434:	7100fd3f 	cmp	w9, #0x3f
    b438:	54fffe88 	b.hi	b408 <__utf8_mbtowc+0x278>  // b.pmore
    b43c:	52800069 	mov	w9, #0x3                   	// #3
    b440:	b9000089 	str	w9, [x4]
    b444:	39001886 	strb	w6, [x4, #6]
    b448:	f1000c7f 	cmp	x3, #0x3
    b44c:	54fff8e1 	b.ne	b368 <__utf8_mbtowc+0x1d8>  // b.any
    b450:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b454:	17ffff7a 	b	b23c <__utf8_mbtowc+0xac>
    b458:	d503201f 	nop
    b45c:	d503201f 	nop

000000000000b460 <__sjis_mbtowc>:
    b460:	d10043ff 	sub	sp, sp, #0x10
    b464:	f100003f 	cmp	x1, #0x0
    b468:	910033e5 	add	x5, sp, #0xc
    b46c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    b470:	b40004c2 	cbz	x2, b508 <__sjis_mbtowc+0xa8>
    b474:	b4000503 	cbz	x3, b514 <__sjis_mbtowc+0xb4>
    b478:	aa0003e6 	mov	x6, x0
    b47c:	b9400080 	ldr	w0, [x4]
    b480:	39400045 	ldrb	w5, [x2]
    b484:	35000320 	cbnz	w0, b4e8 <__sjis_mbtowc+0x88>
    b488:	510204a7 	sub	w7, w5, #0x81
    b48c:	510380a0 	sub	w0, w5, #0xe0
    b490:	710078ff 	cmp	w7, #0x1e
    b494:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    b498:	540002c8 	b.hi	b4f0 <__sjis_mbtowc+0x90>  // b.pmore
    b49c:	52800020 	mov	w0, #0x1                   	// #1
    b4a0:	b9000080 	str	w0, [x4]
    b4a4:	39001085 	strb	w5, [x4, #4]
    b4a8:	f100047f 	cmp	x3, #0x1
    b4ac:	54000340 	b.eq	b514 <__sjis_mbtowc+0xb4>  // b.none
    b4b0:	39400445 	ldrb	w5, [x2, #1]
    b4b4:	52800040 	mov	w0, #0x2                   	// #2
    b4b8:	510100a3 	sub	w3, w5, #0x40
    b4bc:	510200a2 	sub	w2, w5, #0x80
    b4c0:	7100f87f 	cmp	w3, #0x3e
    b4c4:	52800f83 	mov	w3, #0x7c                  	// #124
    b4c8:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    b4cc:	54000288 	b.hi	b51c <__sjis_mbtowc+0xbc>  // b.pmore
    b4d0:	39401082 	ldrb	w2, [x4, #4]
    b4d4:	0b0220a5 	add	w5, w5, w2, lsl #8
    b4d8:	b9000025 	str	w5, [x1]
    b4dc:	b900009f 	str	wzr, [x4]
    b4e0:	910043ff 	add	sp, sp, #0x10
    b4e4:	d65f03c0 	ret
    b4e8:	7100041f 	cmp	w0, #0x1
    b4ec:	54fffe60 	b.eq	b4b8 <__sjis_mbtowc+0x58>  // b.none
    b4f0:	b9000025 	str	w5, [x1]
    b4f4:	39400040 	ldrb	w0, [x2]
    b4f8:	7100001f 	cmp	w0, #0x0
    b4fc:	1a9f07e0 	cset	w0, ne  // ne = any
    b500:	910043ff 	add	sp, sp, #0x10
    b504:	d65f03c0 	ret
    b508:	52800000 	mov	w0, #0x0                   	// #0
    b50c:	910043ff 	add	sp, sp, #0x10
    b510:	d65f03c0 	ret
    b514:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b518:	17fffffa 	b	b500 <__sjis_mbtowc+0xa0>
    b51c:	52801141 	mov	w1, #0x8a                  	// #138
    b520:	12800000 	mov	w0, #0xffffffff            	// #-1
    b524:	b90000c1 	str	w1, [x6]
    b528:	17fffff6 	b	b500 <__sjis_mbtowc+0xa0>
    b52c:	d503201f 	nop

000000000000b530 <__eucjp_mbtowc>:
    b530:	d10083ff 	sub	sp, sp, #0x20
    b534:	f100003f 	cmp	x1, #0x0
    b538:	a90007e0 	stp	x0, x1, [sp]
    b53c:	910073e0 	add	x0, sp, #0x1c
    b540:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    b544:	f94003e6 	ldr	x6, [sp]
    b548:	b4000702 	cbz	x2, b628 <__eucjp_mbtowc+0xf8>
    b54c:	b4000783 	cbz	x3, b63c <__eucjp_mbtowc+0x10c>
    b550:	b9400080 	ldr	w0, [x4]
    b554:	39400045 	ldrb	w5, [x2]
    b558:	350004a0 	cbnz	w0, b5ec <__eucjp_mbtowc+0xbc>
    b55c:	510284a7 	sub	w7, w5, #0xa1
    b560:	510238a0 	sub	w0, w5, #0x8e
    b564:	710174ff 	cmp	w7, #0x5d
    b568:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    b56c:	54000488 	b.hi	b5fc <__eucjp_mbtowc+0xcc>  // b.pmore
    b570:	52800020 	mov	w0, #0x1                   	// #1
    b574:	b9000080 	str	w0, [x4]
    b578:	39001085 	strb	w5, [x4, #4]
    b57c:	f100047f 	cmp	x3, #0x1
    b580:	540005e0 	b.eq	b63c <__eucjp_mbtowc+0x10c>  // b.none
    b584:	39400445 	ldrb	w5, [x2, #1]
    b588:	52800040 	mov	w0, #0x2                   	// #2
    b58c:	510284a7 	sub	w7, w5, #0xa1
    b590:	710174ff 	cmp	w7, #0x5d
    b594:	54000588 	b.hi	b644 <__eucjp_mbtowc+0x114>  // b.pmore
    b598:	39401087 	ldrb	w7, [x4, #4]
    b59c:	71023cff 	cmp	w7, #0x8f
    b5a0:	540003a1 	b.ne	b614 <__eucjp_mbtowc+0xe4>  // b.any
    b5a4:	52800048 	mov	w8, #0x2                   	// #2
    b5a8:	93407c07 	sxtw	x7, w0
    b5ac:	b9000088 	str	w8, [x4]
    b5b0:	39001485 	strb	w5, [x4, #5]
    b5b4:	eb0300ff 	cmp	x7, x3
    b5b8:	54000422 	b.cs	b63c <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    b5bc:	38676845 	ldrb	w5, [x2, x7]
    b5c0:	11000400 	add	w0, w0, #0x1
    b5c4:	510284a2 	sub	w2, w5, #0xa1
    b5c8:	7101745f 	cmp	w2, #0x5d
    b5cc:	540003c8 	b.hi	b644 <__eucjp_mbtowc+0x114>  // b.pmore
    b5d0:	39401482 	ldrb	w2, [x4, #5]
    b5d4:	120018a5 	and	w5, w5, #0x7f
    b5d8:	0b0220a5 	add	w5, w5, w2, lsl #8
    b5dc:	b9000025 	str	w5, [x1]
    b5e0:	b900009f 	str	wzr, [x4]
    b5e4:	910083ff 	add	sp, sp, #0x20
    b5e8:	d65f03c0 	ret
    b5ec:	7100041f 	cmp	w0, #0x1
    b5f0:	54fffce0 	b.eq	b58c <__eucjp_mbtowc+0x5c>  // b.none
    b5f4:	7100081f 	cmp	w0, #0x2
    b5f8:	540001e0 	b.eq	b634 <__eucjp_mbtowc+0x104>  // b.none
    b5fc:	b9000025 	str	w5, [x1]
    b600:	39400040 	ldrb	w0, [x2]
    b604:	7100001f 	cmp	w0, #0x0
    b608:	1a9f07e0 	cset	w0, ne  // ne = any
    b60c:	910083ff 	add	sp, sp, #0x20
    b610:	d65f03c0 	ret
    b614:	0b0720a5 	add	w5, w5, w7, lsl #8
    b618:	b9000025 	str	w5, [x1]
    b61c:	b900009f 	str	wzr, [x4]
    b620:	910083ff 	add	sp, sp, #0x20
    b624:	d65f03c0 	ret
    b628:	52800000 	mov	w0, #0x0                   	// #0
    b62c:	910083ff 	add	sp, sp, #0x20
    b630:	d65f03c0 	ret
    b634:	52800020 	mov	w0, #0x1                   	// #1
    b638:	17ffffe3 	b	b5c4 <__eucjp_mbtowc+0x94>
    b63c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b640:	17fffff3 	b	b60c <__eucjp_mbtowc+0xdc>
    b644:	52801141 	mov	w1, #0x8a                  	// #138
    b648:	12800000 	mov	w0, #0xffffffff            	// #-1
    b64c:	b90000c1 	str	w1, [x6]
    b650:	17ffffef 	b	b60c <__eucjp_mbtowc+0xdc>
    b654:	d503201f 	nop
    b658:	d503201f 	nop
    b65c:	d503201f 	nop

000000000000b660 <__jis_mbtowc>:
    b660:	d10043ff 	sub	sp, sp, #0x10
    b664:	f100003f 	cmp	x1, #0x0
    b668:	910033e5 	add	x5, sp, #0xc
    b66c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    b670:	b4000da2 	cbz	x2, b824 <__jis_mbtowc+0x1c4>
    b674:	b4000e43 	cbz	x3, b83c <__jis_mbtowc+0x1dc>
    b678:	39400085 	ldrb	w5, [x4]
    b67c:	f000000c 	adrp	x12, e000 <__func__.0+0x280>
    b680:	f000000b 	adrp	x11, e000 <__func__.0+0x280>
    b684:	aa0003ed 	mov	x13, x0
    b688:	9121e18c 	add	x12, x12, #0x878
    b68c:	9123016b 	add	x11, x11, #0x8c0
    b690:	aa0203ef 	mov	x15, x2
    b694:	5280000a 	mov	w10, #0x0                   	// #0
    b698:	d2800009 	mov	x9, #0x0                   	// #0
    b69c:	38696847 	ldrb	w7, [x2, x9]
    b6a0:	8b09004e 	add	x14, x2, x9
    b6a4:	7100a0ff 	cmp	w7, #0x28
    b6a8:	54000c60 	b.eq	b834 <__jis_mbtowc+0x1d4>  // b.none
    b6ac:	540005a8 	b.hi	b760 <__jis_mbtowc+0x100>  // b.pmore
    b6b0:	52800006 	mov	w6, #0x0                   	// #0
    b6b4:	71006cff 	cmp	w7, #0x1b
    b6b8:	54000080 	b.eq	b6c8 <__jis_mbtowc+0x68>  // b.none
    b6bc:	52800026 	mov	w6, #0x1                   	// #1
    b6c0:	710090ff 	cmp	w7, #0x24
    b6c4:	540008c1 	b.ne	b7dc <__jis_mbtowc+0x17c>  // b.any
    b6c8:	937d7ca0 	sbfiz	x0, x5, #3, #32
    b6cc:	8b25c005 	add	x5, x0, w5, sxtw
    b6d0:	8b050180 	add	x0, x12, x5
    b6d4:	8b050165 	add	x5, x11, x5
    b6d8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    b6dc:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    b6e0:	71000d1f 	cmp	w8, #0x3
    b6e4:	540006a0 	b.eq	b7b8 <__jis_mbtowc+0x158>  // b.none
    b6e8:	540002a8 	b.hi	b73c <__jis_mbtowc+0xdc>  // b.pmore
    b6ec:	7100051f 	cmp	w8, #0x1
    b6f0:	54000840 	b.eq	b7f8 <__jis_mbtowc+0x198>  // b.none
    b6f4:	7100091f 	cmp	w8, #0x2
    b6f8:	54000141 	b.ne	b720 <__jis_mbtowc+0xc0>  // b.any
    b6fc:	52800020 	mov	w0, #0x1                   	// #1
    b700:	b9000080 	str	w0, [x4]
    b704:	39401082 	ldrb	w2, [x4, #4]
    b708:	0b000140 	add	w0, w10, w0
    b70c:	394001c3 	ldrb	w3, [x14]
    b710:	0b022062 	add	w2, w3, w2, lsl #8
    b714:	b9000022 	str	w2, [x1]
    b718:	910043ff 	add	sp, sp, #0x10
    b71c:	d65f03c0 	ret
    b720:	35000788 	cbnz	w8, b810 <__jis_mbtowc+0x1b0>
    b724:	b900009f 	str	wzr, [x4]
    b728:	11000540 	add	w0, w10, #0x1
    b72c:	394001e2 	ldrb	w2, [x15]
    b730:	b9000022 	str	w2, [x1]
    b734:	910043ff 	add	sp, sp, #0x10
    b738:	d65f03c0 	ret
    b73c:	7100111f 	cmp	w8, #0x4
    b740:	54000400 	b.eq	b7c0 <__jis_mbtowc+0x160>  // b.none
    b744:	7100151f 	cmp	w8, #0x5
    b748:	54000641 	b.ne	b810 <__jis_mbtowc+0x1b0>  // b.any
    b74c:	b900009f 	str	wzr, [x4]
    b750:	52800000 	mov	w0, #0x0                   	// #0
    b754:	b900003f 	str	wzr, [x1]
    b758:	910043ff 	add	sp, sp, #0x10
    b75c:	d65f03c0 	ret
    b760:	52800086 	mov	w6, #0x4                   	// #4
    b764:	710108ff 	cmp	w7, #0x42
    b768:	54fffb00 	b.eq	b6c8 <__jis_mbtowc+0x68>  // b.none
    b76c:	528000a6 	mov	w6, #0x5                   	// #5
    b770:	710128ff 	cmp	w7, #0x4a
    b774:	54fffaa0 	b.eq	b6c8 <__jis_mbtowc+0x68>  // b.none
    b778:	52800066 	mov	w6, #0x3                   	// #3
    b77c:	710100ff 	cmp	w7, #0x40
    b780:	54fffa40 	b.eq	b6c8 <__jis_mbtowc+0x68>  // b.none
    b784:	510084e0 	sub	w0, w7, #0x21
    b788:	7101741f 	cmp	w0, #0x5d
    b78c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    b790:	11001cc6 	add	w6, w6, #0x7
    b794:	d503201f 	nop
    b798:	937d7ca0 	sbfiz	x0, x5, #3, #32
    b79c:	8b25c005 	add	x5, x0, w5, sxtw
    b7a0:	8b050180 	add	x0, x12, x5
    b7a4:	8b050165 	add	x5, x11, x5
    b7a8:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    b7ac:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    b7b0:	71000d1f 	cmp	w8, #0x3
    b7b4:	54fff9a1 	b.ne	b6e8 <__jis_mbtowc+0x88>  // b.any
    b7b8:	91000529 	add	x9, x9, #0x1
    b7bc:	8b09004f 	add	x15, x2, x9
    b7c0:	11000549 	add	w9, w10, #0x1
    b7c4:	aa0903ea 	mov	x10, x9
    b7c8:	eb03013f 	cmp	x9, x3
    b7cc:	54fff683 	b.cc	b69c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    b7d0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b7d4:	b9000085 	str	w5, [x4]
    b7d8:	17ffffd0 	b	b718 <__jis_mbtowc+0xb8>
    b7dc:	528000c6 	mov	w6, #0x6                   	// #6
    b7e0:	34fff747 	cbz	w7, b6c8 <__jis_mbtowc+0x68>
    b7e4:	510084e0 	sub	w0, w7, #0x21
    b7e8:	7101741f 	cmp	w0, #0x5d
    b7ec:	1a9f97e6 	cset	w6, hi  // hi = pmore
    b7f0:	11001cc6 	add	w6, w6, #0x7
    b7f4:	17ffffe9 	b	b798 <__jis_mbtowc+0x138>
    b7f8:	11000549 	add	w9, w10, #0x1
    b7fc:	39001087 	strb	w7, [x4, #4]
    b800:	aa0903ea 	mov	x10, x9
    b804:	eb03013f 	cmp	x9, x3
    b808:	54fff4a3 	b.cc	b69c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    b80c:	17fffff1 	b	b7d0 <__jis_mbtowc+0x170>
    b810:	52801141 	mov	w1, #0x8a                  	// #138
    b814:	b90001a1 	str	w1, [x13]
    b818:	12800000 	mov	w0, #0xffffffff            	// #-1
    b81c:	910043ff 	add	sp, sp, #0x10
    b820:	d65f03c0 	ret
    b824:	b900009f 	str	wzr, [x4]
    b828:	52800020 	mov	w0, #0x1                   	// #1
    b82c:	910043ff 	add	sp, sp, #0x10
    b830:	d65f03c0 	ret
    b834:	52800046 	mov	w6, #0x2                   	// #2
    b838:	17ffffa4 	b	b6c8 <__jis_mbtowc+0x68>
    b83c:	12800020 	mov	w0, #0xfffffffe            	// #-2
    b840:	17ffffb6 	b	b718 <__jis_mbtowc+0xb8>

000000000000b844 <memchr>:
    b844:	b4000682 	cbz	x2, b914 <memchr+0xd0>
    b848:	52808025 	mov	w5, #0x401                 	// #1025
    b84c:	72a80205 	movk	w5, #0x4010, lsl #16
    b850:	4e010c20 	dup	v0.16b, w1
    b854:	927be803 	and	x3, x0, #0xffffffffffffffe0
    b858:	4e040ca5 	dup	v5.4s, w5
    b85c:	f2401009 	ands	x9, x0, #0x1f
    b860:	9240104a 	and	x10, x2, #0x1f
    b864:	54000200 	b.eq	b8a4 <memchr+0x60>  // b.none
    b868:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    b86c:	d1008124 	sub	x4, x9, #0x20
    b870:	ab040042 	adds	x2, x2, x4
    b874:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    b878:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    b87c:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    b880:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    b884:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    b888:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    b88c:	4e083cc6 	mov	x6, v6.d[0]
    b890:	d37ff924 	lsl	x4, x9, #1
    b894:	9ac424c6 	lsr	x6, x6, x4
    b898:	9ac420c6 	lsl	x6, x6, x4
    b89c:	54000229 	b.ls	b8e0 <memchr+0x9c>  // b.plast
    b8a0:	b50002c6 	cbnz	x6, b8f8 <memchr+0xb4>
    b8a4:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    b8a8:	f1008042 	subs	x2, x2, #0x20
    b8ac:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    b8b0:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    b8b4:	540000a9 	b.ls	b8c8 <memchr+0x84>  // b.plast
    b8b8:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    b8bc:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    b8c0:	4e083cc6 	mov	x6, v6.d[0]
    b8c4:	b4ffff06 	cbz	x6, b8a4 <memchr+0x60>
    b8c8:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    b8cc:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    b8d0:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    b8d4:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    b8d8:	4e083cc6 	mov	x6, v6.d[0]
    b8dc:	540000e8 	b.hi	b8f8 <memchr+0xb4>  // b.pmore
    b8e0:	8b090144 	add	x4, x10, x9
    b8e4:	92401084 	and	x4, x4, #0x1f
    b8e8:	d1008084 	sub	x4, x4, #0x20
    b8ec:	cb0407e4 	neg	x4, x4, lsl #1
    b8f0:	9ac420c6 	lsl	x6, x6, x4
    b8f4:	9ac424c6 	lsr	x6, x6, x4
    b8f8:	dac000c6 	rbit	x6, x6
    b8fc:	d1008063 	sub	x3, x3, #0x20
    b900:	f10000df 	cmp	x6, #0x0
    b904:	dac010c6 	clz	x6, x6
    b908:	8b460460 	add	x0, x3, x6, lsr #1
    b90c:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    b910:	d65f03c0 	ret
    b914:	d2800000 	mov	x0, #0x0                   	// #0
    b918:	d65f03c0 	ret
    b91c:	d503201f 	nop

000000000000b920 <__malloc_lock>:
    b920:	d65f03c0 	ret
    b924:	d503201f 	nop
    b928:	d503201f 	nop
    b92c:	d503201f 	nop

000000000000b930 <__malloc_unlock>:
    b930:	d65f03c0 	ret
    b934:	d503201f 	nop
    b938:	d503201f 	nop
    b93c:	d503201f 	nop

000000000000b940 <_realloc_r>:
    b940:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    b944:	910003fd 	mov	x29, sp
    b948:	a9025bf5 	stp	x21, x22, [sp, #32]
    b94c:	aa0203f5 	mov	x21, x2
    b950:	b40010e1 	cbz	x1, bb6c <_realloc_r+0x22c>
    b954:	a90363f7 	stp	x23, x24, [sp, #48]
    b958:	d1004038 	sub	x24, x1, #0x10
    b95c:	aa0003f7 	mov	x23, x0
    b960:	a90153f3 	stp	x19, x20, [sp, #16]
    b964:	aa0103f3 	mov	x19, x1
    b968:	91005eb4 	add	x20, x21, #0x17
    b96c:	a9046bf9 	stp	x25, x26, [sp, #64]
    b970:	97ffffec 	bl	b920 <__malloc_lock>
    b974:	aa1803f9 	mov	x25, x24
    b978:	f9400700 	ldr	x0, [x24, #8]
    b97c:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    b980:	f100ba9f 	cmp	x20, #0x2e
    b984:	54000908 	b.hi	baa4 <_realloc_r+0x164>  // b.pmore
    b988:	52800001 	mov	w1, #0x0                   	// #0
    b98c:	7100003f 	cmp	w1, #0x0
    b990:	d2800414 	mov	x20, #0x20                  	// #32
    b994:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    b998:	54000943 	b.cc	bac0 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    b99c:	eb1402df 	cmp	x22, x20
    b9a0:	54000b0a 	b.ge	bb00 <_realloc_r+0x1c0>  // b.tcont
    b9a4:	90000021 	adrp	x1, f000 <IpcFsServer+0x5d8>
    b9a8:	a90573fb 	stp	x27, x28, [sp, #80]
    b9ac:	912d203c 	add	x28, x1, #0xb48
    b9b0:	8b160302 	add	x2, x24, x22
    b9b4:	f9400b83 	ldr	x3, [x28, #16]
    b9b8:	f9400441 	ldr	x1, [x2, #8]
    b9bc:	eb02007f 	cmp	x3, x2
    b9c0:	54000f60 	b.eq	bbac <_realloc_r+0x26c>  // b.none
    b9c4:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    b9c8:	8b030043 	add	x3, x2, x3
    b9cc:	f9400463 	ldr	x3, [x3, #8]
    b9d0:	37000c23 	tbnz	w3, #0, bb54 <_realloc_r+0x214>
    b9d4:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    b9d8:	8b0102c3 	add	x3, x22, x1
    b9dc:	eb03029f 	cmp	x20, x3
    b9e0:	5400084d 	b.le	bae8 <_realloc_r+0x1a8>
    b9e4:	37000180 	tbnz	w0, #0, ba14 <_realloc_r+0xd4>
    b9e8:	f85f027b 	ldur	x27, [x19, #-16]
    b9ec:	cb1b031b 	sub	x27, x24, x27
    b9f0:	f9400760 	ldr	x0, [x27, #8]
    b9f4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    b9f8:	8b010001 	add	x1, x0, x1
    b9fc:	8b160023 	add	x3, x1, x22
    ba00:	eb03029f 	cmp	x20, x3
    ba04:	540019ad 	b.le	bd38 <_realloc_r+0x3f8>
    ba08:	8b0002c3 	add	x3, x22, x0
    ba0c:	eb03029f 	cmp	x20, x3
    ba10:	5400152d 	b.le	bcb4 <_realloc_r+0x374>
    ba14:	aa1503e1 	mov	x1, x21
    ba18:	aa1703e0 	mov	x0, x23
    ba1c:	97fffbb9 	bl	a900 <_malloc_r>
    ba20:	aa0003f5 	mov	x21, x0
    ba24:	b40002c0 	cbz	x0, ba7c <_realloc_r+0x13c>
    ba28:	f9400701 	ldr	x1, [x24, #8]
    ba2c:	d1004002 	sub	x2, x0, #0x10
    ba30:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    ba34:	8b010318 	add	x24, x24, x1
    ba38:	eb02031f 	cmp	x24, x2
    ba3c:	54001200 	b.eq	bc7c <_realloc_r+0x33c>  // b.none
    ba40:	d10022c2 	sub	x2, x22, #0x8
    ba44:	f101205f 	cmp	x2, #0x48
    ba48:	54001728 	b.hi	bd2c <_realloc_r+0x3ec>  // b.pmore
    ba4c:	f1009c5f 	cmp	x2, #0x27
    ba50:	54001208 	b.hi	bc90 <_realloc_r+0x350>  // b.pmore
    ba54:	aa1303e1 	mov	x1, x19
    ba58:	f9400022 	ldr	x2, [x1]
    ba5c:	f9000002 	str	x2, [x0]
    ba60:	f9400422 	ldr	x2, [x1, #8]
    ba64:	f9000402 	str	x2, [x0, #8]
    ba68:	f9400821 	ldr	x1, [x1, #16]
    ba6c:	f9000801 	str	x1, [x0, #16]
    ba70:	aa1303e1 	mov	x1, x19
    ba74:	aa1703e0 	mov	x0, x23
    ba78:	97fff582 	bl	9080 <_free_r>
    ba7c:	aa1703e0 	mov	x0, x23
    ba80:	97ffffac 	bl	b930 <__malloc_unlock>
    ba84:	aa1503e0 	mov	x0, x21
    ba88:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ba90:	a94363f7 	ldp	x23, x24, [sp, #48]
    ba94:	a9446bf9 	ldp	x25, x26, [sp, #64]
    ba98:	a94573fb 	ldp	x27, x28, [sp, #80]
    ba9c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    baa0:	d65f03c0 	ret
    baa4:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    baa8:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    baac:	eb01029f 	cmp	x20, x1
    bab0:	1a9f97e1 	cset	w1, hi  // hi = pmore
    bab4:	7100003f 	cmp	w1, #0x0
    bab8:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    babc:	54fff702 	b.cs	b99c <_realloc_r+0x5c>  // b.hs, b.nlast
    bac0:	52800180 	mov	w0, #0xc                   	// #12
    bac4:	b90002e0 	str	w0, [x23]
    bac8:	d2800015 	mov	x21, #0x0                   	// #0
    bacc:	aa1503e0 	mov	x0, x21
    bad0:	a94153f3 	ldp	x19, x20, [sp, #16]
    bad4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bad8:	a94363f7 	ldp	x23, x24, [sp, #48]
    badc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bae0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bae4:	d65f03c0 	ret
    bae8:	a9410041 	ldp	x1, x0, [x2, #16]
    baec:	aa0303f6 	mov	x22, x3
    baf0:	a94573fb 	ldp	x27, x28, [sp, #80]
    baf4:	f9000c20 	str	x0, [x1, #24]
    baf8:	f9000801 	str	x1, [x0, #16]
    bafc:	d503201f 	nop
    bb00:	f9400721 	ldr	x1, [x25, #8]
    bb04:	cb1402c0 	sub	x0, x22, x20
    bb08:	8b160322 	add	x2, x25, x22
    bb0c:	92400021 	and	x1, x1, #0x1
    bb10:	f1007c1f 	cmp	x0, #0x1f
    bb14:	54000348 	b.hi	bb7c <_realloc_r+0x23c>  // b.pmore
    bb18:	aa0102c1 	orr	x1, x22, x1
    bb1c:	f9000721 	str	x1, [x25, #8]
    bb20:	f9400440 	ldr	x0, [x2, #8]
    bb24:	b2400000 	orr	x0, x0, #0x1
    bb28:	f9000440 	str	x0, [x2, #8]
    bb2c:	aa1703e0 	mov	x0, x23
    bb30:	aa1303f5 	mov	x21, x19
    bb34:	97ffff7f 	bl	b930 <__malloc_unlock>
    bb38:	aa1503e0 	mov	x0, x21
    bb3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    bb40:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bb44:	a94363f7 	ldp	x23, x24, [sp, #48]
    bb48:	a9446bf9 	ldp	x25, x26, [sp, #64]
    bb4c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bb50:	d65f03c0 	ret
    bb54:	3707f600 	tbnz	w0, #0, ba14 <_realloc_r+0xd4>
    bb58:	f85f027b 	ldur	x27, [x19, #-16]
    bb5c:	cb1b031b 	sub	x27, x24, x27
    bb60:	f9400760 	ldr	x0, [x27, #8]
    bb64:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    bb68:	17ffffa8 	b	ba08 <_realloc_r+0xc8>
    bb6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    bb70:	aa0203e1 	mov	x1, x2
    bb74:	a8c67bfd 	ldp	x29, x30, [sp], #96
    bb78:	17fffb62 	b	a900 <_malloc_r>
    bb7c:	8b140324 	add	x4, x25, x20
    bb80:	aa010281 	orr	x1, x20, x1
    bb84:	f9000721 	str	x1, [x25, #8]
    bb88:	b2400003 	orr	x3, x0, #0x1
    bb8c:	91004081 	add	x1, x4, #0x10
    bb90:	aa1703e0 	mov	x0, x23
    bb94:	f9000483 	str	x3, [x4, #8]
    bb98:	f9400443 	ldr	x3, [x2, #8]
    bb9c:	b2400063 	orr	x3, x3, #0x1
    bba0:	f9000443 	str	x3, [x2, #8]
    bba4:	97fff537 	bl	9080 <_free_r>
    bba8:	17ffffe1 	b	bb2c <_realloc_r+0x1ec>
    bbac:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    bbb0:	91008283 	add	x3, x20, #0x20
    bbb4:	8b0102c2 	add	x2, x22, x1
    bbb8:	eb03005f 	cmp	x2, x3
    bbbc:	54000eaa 	b.ge	bd90 <_realloc_r+0x450>  // b.tcont
    bbc0:	3707f2a0 	tbnz	w0, #0, ba14 <_realloc_r+0xd4>
    bbc4:	f85f027b 	ldur	x27, [x19, #-16]
    bbc8:	cb1b031b 	sub	x27, x24, x27
    bbcc:	f9400760 	ldr	x0, [x27, #8]
    bbd0:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    bbd4:	8b010001 	add	x1, x0, x1
    bbd8:	8b16003a 	add	x26, x1, x22
    bbdc:	eb1a007f 	cmp	x3, x26
    bbe0:	54fff14c 	b.gt	ba08 <_realloc_r+0xc8>
    bbe4:	aa1b03f5 	mov	x21, x27
    bbe8:	d10022c2 	sub	x2, x22, #0x8
    bbec:	f9400f60 	ldr	x0, [x27, #24]
    bbf0:	f8410ea1 	ldr	x1, [x21, #16]!
    bbf4:	f9000c20 	str	x0, [x1, #24]
    bbf8:	f9000801 	str	x1, [x0, #16]
    bbfc:	f101205f 	cmp	x2, #0x48
    bc00:	54001128 	b.hi	be24 <_realloc_r+0x4e4>  // b.pmore
    bc04:	aa1503e0 	mov	x0, x21
    bc08:	f1009c5f 	cmp	x2, #0x27
    bc0c:	54000129 	b.ls	bc30 <_realloc_r+0x2f0>  // b.plast
    bc10:	f9400260 	ldr	x0, [x19]
    bc14:	f9000b60 	str	x0, [x27, #16]
    bc18:	f9400660 	ldr	x0, [x19, #8]
    bc1c:	f9000f60 	str	x0, [x27, #24]
    bc20:	f100dc5f 	cmp	x2, #0x37
    bc24:	54001088 	b.hi	be34 <_realloc_r+0x4f4>  // b.pmore
    bc28:	91004273 	add	x19, x19, #0x10
    bc2c:	91008360 	add	x0, x27, #0x20
    bc30:	f9400261 	ldr	x1, [x19]
    bc34:	f9000001 	str	x1, [x0]
    bc38:	f9400661 	ldr	x1, [x19, #8]
    bc3c:	f9000401 	str	x1, [x0, #8]
    bc40:	f9400a61 	ldr	x1, [x19, #16]
    bc44:	f9000801 	str	x1, [x0, #16]
    bc48:	8b140362 	add	x2, x27, x20
    bc4c:	cb140341 	sub	x1, x26, x20
    bc50:	f9000b82 	str	x2, [x28, #16]
    bc54:	b2400021 	orr	x1, x1, #0x1
    bc58:	aa1703e0 	mov	x0, x23
    bc5c:	f9000441 	str	x1, [x2, #8]
    bc60:	f9400761 	ldr	x1, [x27, #8]
    bc64:	92400021 	and	x1, x1, #0x1
    bc68:	aa140034 	orr	x20, x1, x20
    bc6c:	f9000774 	str	x20, [x27, #8]
    bc70:	97ffff30 	bl	b930 <__malloc_unlock>
    bc74:	a94573fb 	ldp	x27, x28, [sp, #80]
    bc78:	17ffffb0 	b	bb38 <_realloc_r+0x1f8>
    bc7c:	f9400700 	ldr	x0, [x24, #8]
    bc80:	a94573fb 	ldp	x27, x28, [sp, #80]
    bc84:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    bc88:	8b0002d6 	add	x22, x22, x0
    bc8c:	17ffff9d 	b	bb00 <_realloc_r+0x1c0>
    bc90:	f9400260 	ldr	x0, [x19]
    bc94:	f90002a0 	str	x0, [x21]
    bc98:	f9400660 	ldr	x0, [x19, #8]
    bc9c:	f90006a0 	str	x0, [x21, #8]
    bca0:	f100dc5f 	cmp	x2, #0x37
    bca4:	54000648 	b.hi	bd6c <_realloc_r+0x42c>  // b.pmore
    bca8:	91004261 	add	x1, x19, #0x10
    bcac:	910042a0 	add	x0, x21, #0x10
    bcb0:	17ffff6a 	b	ba58 <_realloc_r+0x118>
    bcb4:	aa1b03e0 	mov	x0, x27
    bcb8:	d10022c2 	sub	x2, x22, #0x8
    bcbc:	f8410c04 	ldr	x4, [x0, #16]!
    bcc0:	f9400f61 	ldr	x1, [x27, #24]
    bcc4:	f9000c81 	str	x1, [x4, #24]
    bcc8:	f9000824 	str	x4, [x1, #16]
    bccc:	f101205f 	cmp	x2, #0x48
    bcd0:	54000408 	b.hi	bd50 <_realloc_r+0x410>  // b.pmore
    bcd4:	aa0003e1 	mov	x1, x0
    bcd8:	f1009c5f 	cmp	x2, #0x27
    bcdc:	54000129 	b.ls	bd00 <_realloc_r+0x3c0>  // b.plast
    bce0:	f9400261 	ldr	x1, [x19]
    bce4:	f9000b61 	str	x1, [x27, #16]
    bce8:	f9400661 	ldr	x1, [x19, #8]
    bcec:	f9000f61 	str	x1, [x27, #24]
    bcf0:	f100dc5f 	cmp	x2, #0x37
    bcf4:	540006a8 	b.hi	bdc8 <_realloc_r+0x488>  // b.pmore
    bcf8:	91004273 	add	x19, x19, #0x10
    bcfc:	91008361 	add	x1, x27, #0x20
    bd00:	f9400262 	ldr	x2, [x19]
    bd04:	aa1b03f9 	mov	x25, x27
    bd08:	a94573fb 	ldp	x27, x28, [sp, #80]
    bd0c:	f9000022 	str	x2, [x1]
    bd10:	aa0303f6 	mov	x22, x3
    bd14:	f9400662 	ldr	x2, [x19, #8]
    bd18:	f9000422 	str	x2, [x1, #8]
    bd1c:	f9400a62 	ldr	x2, [x19, #16]
    bd20:	aa0003f3 	mov	x19, x0
    bd24:	f9000822 	str	x2, [x1, #16]
    bd28:	17ffff76 	b	bb00 <_realloc_r+0x1c0>
    bd2c:	aa1303e1 	mov	x1, x19
    bd30:	97ffe854 	bl	5e80 <memmove>
    bd34:	17ffff4f 	b	ba70 <_realloc_r+0x130>
    bd38:	a9410444 	ldp	x4, x1, [x2, #16]
    bd3c:	f9000c81 	str	x1, [x4, #24]
    bd40:	aa1b03e0 	mov	x0, x27
    bd44:	d10022c2 	sub	x2, x22, #0x8
    bd48:	f9000824 	str	x4, [x1, #16]
    bd4c:	17ffffdc 	b	bcbc <_realloc_r+0x37c>
    bd50:	aa1303e1 	mov	x1, x19
    bd54:	aa0303f6 	mov	x22, x3
    bd58:	aa1b03f9 	mov	x25, x27
    bd5c:	aa0003f3 	mov	x19, x0
    bd60:	97ffe848 	bl	5e80 <memmove>
    bd64:	a94573fb 	ldp	x27, x28, [sp, #80]
    bd68:	17ffff66 	b	bb00 <_realloc_r+0x1c0>
    bd6c:	f9400a60 	ldr	x0, [x19, #16]
    bd70:	f9000aa0 	str	x0, [x21, #16]
    bd74:	f9400e60 	ldr	x0, [x19, #24]
    bd78:	f9000ea0 	str	x0, [x21, #24]
    bd7c:	f101205f 	cmp	x2, #0x48
    bd80:	54000360 	b.eq	bdec <_realloc_r+0x4ac>  // b.none
    bd84:	91008261 	add	x1, x19, #0x20
    bd88:	910082a0 	add	x0, x21, #0x20
    bd8c:	17ffff33 	b	ba58 <_realloc_r+0x118>
    bd90:	8b140303 	add	x3, x24, x20
    bd94:	cb140041 	sub	x1, x2, x20
    bd98:	f9000b83 	str	x3, [x28, #16]
    bd9c:	b2400021 	orr	x1, x1, #0x1
    bda0:	aa1703e0 	mov	x0, x23
    bda4:	aa1303f5 	mov	x21, x19
    bda8:	f9000461 	str	x1, [x3, #8]
    bdac:	f9400701 	ldr	x1, [x24, #8]
    bdb0:	92400021 	and	x1, x1, #0x1
    bdb4:	aa140034 	orr	x20, x1, x20
    bdb8:	f9000714 	str	x20, [x24, #8]
    bdbc:	97fffedd 	bl	b930 <__malloc_unlock>
    bdc0:	a94573fb 	ldp	x27, x28, [sp, #80]
    bdc4:	17ffff5d 	b	bb38 <_realloc_r+0x1f8>
    bdc8:	f9400a61 	ldr	x1, [x19, #16]
    bdcc:	f9001361 	str	x1, [x27, #32]
    bdd0:	f9400e61 	ldr	x1, [x19, #24]
    bdd4:	f9001761 	str	x1, [x27, #40]
    bdd8:	f101205f 	cmp	x2, #0x48
    bddc:	54000160 	b.eq	be08 <_realloc_r+0x4c8>  // b.none
    bde0:	91008273 	add	x19, x19, #0x20
    bde4:	9100c361 	add	x1, x27, #0x30
    bde8:	17ffffc6 	b	bd00 <_realloc_r+0x3c0>
    bdec:	f9401260 	ldr	x0, [x19, #32]
    bdf0:	f90012a0 	str	x0, [x21, #32]
    bdf4:	9100c261 	add	x1, x19, #0x30
    bdf8:	9100c2a0 	add	x0, x21, #0x30
    bdfc:	f9401662 	ldr	x2, [x19, #40]
    be00:	f90016a2 	str	x2, [x21, #40]
    be04:	17ffff15 	b	ba58 <_realloc_r+0x118>
    be08:	f9401261 	ldr	x1, [x19, #32]
    be0c:	f9001b61 	str	x1, [x27, #48]
    be10:	9100c273 	add	x19, x19, #0x30
    be14:	91010361 	add	x1, x27, #0x40
    be18:	f85f8262 	ldur	x2, [x19, #-8]
    be1c:	f9001f62 	str	x2, [x27, #56]
    be20:	17ffffb8 	b	bd00 <_realloc_r+0x3c0>
    be24:	aa1303e1 	mov	x1, x19
    be28:	aa1503e0 	mov	x0, x21
    be2c:	97ffe815 	bl	5e80 <memmove>
    be30:	17ffff86 	b	bc48 <_realloc_r+0x308>
    be34:	f9400a60 	ldr	x0, [x19, #16]
    be38:	f9001360 	str	x0, [x27, #32]
    be3c:	f9400e60 	ldr	x0, [x19, #24]
    be40:	f9001760 	str	x0, [x27, #40]
    be44:	f101205f 	cmp	x2, #0x48
    be48:	54000080 	b.eq	be58 <_realloc_r+0x518>  // b.none
    be4c:	91008273 	add	x19, x19, #0x20
    be50:	9100c360 	add	x0, x27, #0x30
    be54:	17ffff77 	b	bc30 <_realloc_r+0x2f0>
    be58:	f9401260 	ldr	x0, [x19, #32]
    be5c:	f9001b60 	str	x0, [x27, #48]
    be60:	9100c273 	add	x19, x19, #0x30
    be64:	91010360 	add	x0, x27, #0x40
    be68:	f85f8261 	ldur	x1, [x19, #-8]
    be6c:	f9001f61 	str	x1, [x27, #56]
    be70:	17ffff70 	b	bc30 <_realloc_r+0x2f0>
    be74:	d503201f 	nop
    be78:	d503201f 	nop
    be7c:	d503201f 	nop

000000000000be80 <_sbrk_r>:
    be80:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    be84:	910003fd 	mov	x29, sp
    be88:	a90153f3 	stp	x19, x20, [sp, #16]
    be8c:	b00004f4 	adrp	x20, a8000 <_stack+0x28000>
    be90:	aa0003f3 	mov	x19, x0
    be94:	b909929f 	str	wzr, [x20, #2448]
    be98:	aa0103e0 	mov	x0, x1
    be9c:	97ffe6c1 	bl	59a0 <_sbrk>
    bea0:	b100041f 	cmn	x0, #0x1
    bea4:	54000080 	b.eq	beb4 <_sbrk_r+0x34>  // b.none
    bea8:	a94153f3 	ldp	x19, x20, [sp, #16]
    beac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    beb0:	d65f03c0 	ret
    beb4:	b9499281 	ldr	w1, [x20, #2448]
    beb8:	34ffff81 	cbz	w1, bea8 <_sbrk_r+0x28>
    bebc:	b9000261 	str	w1, [x19]
    bec0:	a94153f3 	ldp	x19, x20, [sp, #16]
    bec4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bec8:	d65f03c0 	ret
    becc:	d503201f 	nop

000000000000bed0 <_init_signal_r>:
    bed0:	f9428c01 	ldr	x1, [x0, #1304]
    bed4:	b4000061 	cbz	x1, bee0 <_init_signal_r+0x10>
    bed8:	52800000 	mov	w0, #0x0                   	// #0
    bedc:	d65f03c0 	ret
    bee0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bee4:	d2802001 	mov	x1, #0x100                 	// #256
    bee8:	910003fd 	mov	x29, sp
    beec:	f9000bf3 	str	x19, [sp, #16]
    bef0:	aa0003f3 	mov	x19, x0
    bef4:	97fffa83 	bl	a900 <_malloc_r>
    bef8:	f9028e60 	str	x0, [x19, #1304]
    befc:	b4000140 	cbz	x0, bf24 <_init_signal_r+0x54>
    bf00:	91040001 	add	x1, x0, #0x100
    bf04:	d503201f 	nop
    bf08:	f800841f 	str	xzr, [x0], #8
    bf0c:	eb01001f 	cmp	x0, x1
    bf10:	54ffffc1 	b.ne	bf08 <_init_signal_r+0x38>  // b.any
    bf14:	52800000 	mov	w0, #0x0                   	// #0
    bf18:	f9400bf3 	ldr	x19, [sp, #16]
    bf1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    bf20:	d65f03c0 	ret
    bf24:	12800000 	mov	w0, #0xffffffff            	// #-1
    bf28:	17fffffc 	b	bf18 <_init_signal_r+0x48>
    bf2c:	d503201f 	nop

000000000000bf30 <_signal_r>:
    bf30:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    bf34:	910003fd 	mov	x29, sp
    bf38:	a90153f3 	stp	x19, x20, [sp, #16]
    bf3c:	93407c33 	sxtw	x19, w1
    bf40:	aa0003f4 	mov	x20, x0
    bf44:	71007e7f 	cmp	w19, #0x1f
    bf48:	54000108 	b.hi	bf68 <_signal_r+0x38>  // b.pmore
    bf4c:	f9428c04 	ldr	x4, [x0, #1304]
    bf50:	b4000184 	cbz	x4, bf80 <_signal_r+0x50>
    bf54:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    bf58:	f8337882 	str	x2, [x4, x19, lsl #3]
    bf5c:	a94153f3 	ldp	x19, x20, [sp, #16]
    bf60:	a8c37bfd 	ldp	x29, x30, [sp], #48
    bf64:	d65f03c0 	ret
    bf68:	528002c1 	mov	w1, #0x16                  	// #22
    bf6c:	b9000281 	str	w1, [x20]
    bf70:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    bf74:	a94153f3 	ldp	x19, x20, [sp, #16]
    bf78:	a8c37bfd 	ldp	x29, x30, [sp], #48
    bf7c:	d65f03c0 	ret
    bf80:	d2802001 	mov	x1, #0x100                 	// #256
    bf84:	f90017e2 	str	x2, [sp, #40]
    bf88:	97fffa5e 	bl	a900 <_malloc_r>
    bf8c:	f9028e80 	str	x0, [x20, #1304]
    bf90:	aa0003e4 	mov	x4, x0
    bf94:	b4000120 	cbz	x0, bfb8 <_signal_r+0x88>
    bf98:	f94017e2 	ldr	x2, [sp, #40]
    bf9c:	aa0003e3 	mov	x3, x0
    bfa0:	91040001 	add	x1, x0, #0x100
    bfa4:	d503201f 	nop
    bfa8:	f800847f 	str	xzr, [x3], #8
    bfac:	eb03003f 	cmp	x1, x3
    bfb0:	54ffffc1 	b.ne	bfa8 <_signal_r+0x78>  // b.any
    bfb4:	17ffffe8 	b	bf54 <_signal_r+0x24>
    bfb8:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    bfbc:	17ffffe8 	b	bf5c <_signal_r+0x2c>

000000000000bfc0 <_raise_r>:
    bfc0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    bfc4:	910003fd 	mov	x29, sp
    bfc8:	a90153f3 	stp	x19, x20, [sp, #16]
    bfcc:	aa0003f4 	mov	x20, x0
    bfd0:	71007c3f 	cmp	w1, #0x1f
    bfd4:	54000488 	b.hi	c064 <_raise_r+0xa4>  // b.pmore
    bfd8:	f9428c00 	ldr	x0, [x0, #1304]
    bfdc:	2a0103f3 	mov	w19, w1
    bfe0:	b40001e0 	cbz	x0, c01c <_raise_r+0x5c>
    bfe4:	93407c22 	sxtw	x2, w1
    bfe8:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    bfec:	b4000181 	cbz	x1, c01c <_raise_r+0x5c>
    bff0:	f100043f 	cmp	x1, #0x1
    bff4:	54000300 	b.eq	c054 <_raise_r+0x94>  // b.none
    bff8:	b100043f 	cmn	x1, #0x1
    bffc:	54000200 	b.eq	c03c <_raise_r+0x7c>  // b.none
    c000:	f822781f 	str	xzr, [x0, x2, lsl #3]
    c004:	2a1303e0 	mov	w0, w19
    c008:	d63f0020 	blr	x1
    c00c:	52800000 	mov	w0, #0x0                   	// #0
    c010:	a94153f3 	ldp	x19, x20, [sp, #16]
    c014:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c018:	d65f03c0 	ret
    c01c:	aa1403e0 	mov	x0, x20
    c020:	940000fc 	bl	c410 <_getpid_r>
    c024:	2a1303e2 	mov	w2, w19
    c028:	2a0003e1 	mov	w1, w0
    c02c:	aa1403e0 	mov	x0, x20
    c030:	a94153f3 	ldp	x19, x20, [sp, #16]
    c034:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c038:	140000e2 	b	c3c0 <_kill_r>
    c03c:	528002c1 	mov	w1, #0x16                  	// #22
    c040:	b9000281 	str	w1, [x20]
    c044:	52800020 	mov	w0, #0x1                   	// #1
    c048:	a94153f3 	ldp	x19, x20, [sp, #16]
    c04c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c050:	d65f03c0 	ret
    c054:	52800000 	mov	w0, #0x0                   	// #0
    c058:	a94153f3 	ldp	x19, x20, [sp, #16]
    c05c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c060:	d65f03c0 	ret
    c064:	528002c1 	mov	w1, #0x16                  	// #22
    c068:	12800000 	mov	w0, #0xffffffff            	// #-1
    c06c:	b9000281 	str	w1, [x20]
    c070:	17ffffe8 	b	c010 <_raise_r+0x50>
    c074:	d503201f 	nop
    c078:	d503201f 	nop
    c07c:	d503201f 	nop

000000000000c080 <__sigtramp_r>:
    c080:	71007c3f 	cmp	w1, #0x1f
    c084:	540005a8 	b.hi	c138 <__sigtramp_r+0xb8>  // b.pmore
    c088:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c08c:	910003fd 	mov	x29, sp
    c090:	f9428c03 	ldr	x3, [x0, #1304]
    c094:	a90153f3 	stp	x19, x20, [sp, #16]
    c098:	2a0103f3 	mov	w19, w1
    c09c:	aa0003f4 	mov	x20, x0
    c0a0:	b4000263 	cbz	x3, c0ec <__sigtramp_r+0x6c>
    c0a4:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    c0a8:	8b33cc63 	add	x3, x3, w19, sxtw #3
    c0ac:	b4000181 	cbz	x1, c0dc <__sigtramp_r+0x5c>
    c0b0:	b100043f 	cmn	x1, #0x1
    c0b4:	540003a0 	b.eq	c128 <__sigtramp_r+0xa8>  // b.none
    c0b8:	f100043f 	cmp	x1, #0x1
    c0bc:	540002e0 	b.eq	c118 <__sigtramp_r+0x98>  // b.none
    c0c0:	f900007f 	str	xzr, [x3]
    c0c4:	2a1303e0 	mov	w0, w19
    c0c8:	d63f0020 	blr	x1
    c0cc:	52800000 	mov	w0, #0x0                   	// #0
    c0d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    c0d4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c0d8:	d65f03c0 	ret
    c0dc:	52800020 	mov	w0, #0x1                   	// #1
    c0e0:	a94153f3 	ldp	x19, x20, [sp, #16]
    c0e4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c0e8:	d65f03c0 	ret
    c0ec:	d2802001 	mov	x1, #0x100                 	// #256
    c0f0:	97fffa04 	bl	a900 <_malloc_r>
    c0f4:	f9028e80 	str	x0, [x20, #1304]
    c0f8:	aa0003e3 	mov	x3, x0
    c0fc:	b40001a0 	cbz	x0, c130 <__sigtramp_r+0xb0>
    c100:	aa0003e2 	mov	x2, x0
    c104:	91040000 	add	x0, x0, #0x100
    c108:	f800845f 	str	xzr, [x2], #8
    c10c:	eb00005f 	cmp	x2, x0
    c110:	54ffffc1 	b.ne	c108 <__sigtramp_r+0x88>  // b.any
    c114:	17ffffe4 	b	c0a4 <__sigtramp_r+0x24>
    c118:	52800060 	mov	w0, #0x3                   	// #3
    c11c:	a94153f3 	ldp	x19, x20, [sp, #16]
    c120:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c124:	d65f03c0 	ret
    c128:	52800040 	mov	w0, #0x2                   	// #2
    c12c:	17ffffe9 	b	c0d0 <__sigtramp_r+0x50>
    c130:	12800000 	mov	w0, #0xffffffff            	// #-1
    c134:	17ffffe7 	b	c0d0 <__sigtramp_r+0x50>
    c138:	12800000 	mov	w0, #0xffffffff            	// #-1
    c13c:	d65f03c0 	ret

000000000000c140 <raise>:
    c140:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c144:	f0000001 	adrp	x1, f000 <IpcFsServer+0x5d8>
    c148:	910003fd 	mov	x29, sp
    c14c:	a90153f3 	stp	x19, x20, [sp, #16]
    c150:	f9411834 	ldr	x20, [x1, #560]
    c154:	71007c1f 	cmp	w0, #0x1f
    c158:	54000468 	b.hi	c1e4 <raise+0xa4>  // b.pmore
    c15c:	f9428e82 	ldr	x2, [x20, #1304]
    c160:	2a0003f3 	mov	w19, w0
    c164:	b40001c2 	cbz	x2, c19c <raise+0x5c>
    c168:	93407c03 	sxtw	x3, w0
    c16c:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    c170:	b4000161 	cbz	x1, c19c <raise+0x5c>
    c174:	f100043f 	cmp	x1, #0x1
    c178:	540002e0 	b.eq	c1d4 <raise+0x94>  // b.none
    c17c:	b100043f 	cmn	x1, #0x1
    c180:	540001e0 	b.eq	c1bc <raise+0x7c>  // b.none
    c184:	f823785f 	str	xzr, [x2, x3, lsl #3]
    c188:	d63f0020 	blr	x1
    c18c:	52800000 	mov	w0, #0x0                   	// #0
    c190:	a94153f3 	ldp	x19, x20, [sp, #16]
    c194:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c198:	d65f03c0 	ret
    c19c:	aa1403e0 	mov	x0, x20
    c1a0:	9400009c 	bl	c410 <_getpid_r>
    c1a4:	2a1303e2 	mov	w2, w19
    c1a8:	2a0003e1 	mov	w1, w0
    c1ac:	aa1403e0 	mov	x0, x20
    c1b0:	a94153f3 	ldp	x19, x20, [sp, #16]
    c1b4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c1b8:	14000082 	b	c3c0 <_kill_r>
    c1bc:	528002c1 	mov	w1, #0x16                  	// #22
    c1c0:	b9000281 	str	w1, [x20]
    c1c4:	52800020 	mov	w0, #0x1                   	// #1
    c1c8:	a94153f3 	ldp	x19, x20, [sp, #16]
    c1cc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c1d0:	d65f03c0 	ret
    c1d4:	52800000 	mov	w0, #0x0                   	// #0
    c1d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    c1dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c1e0:	d65f03c0 	ret
    c1e4:	528002c1 	mov	w1, #0x16                  	// #22
    c1e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    c1ec:	b9000281 	str	w1, [x20]
    c1f0:	17ffffe8 	b	c190 <raise+0x50>
    c1f4:	d503201f 	nop
    c1f8:	d503201f 	nop
    c1fc:	d503201f 	nop

000000000000c200 <signal>:
    c200:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    c204:	f0000002 	adrp	x2, f000 <IpcFsServer+0x5d8>
    c208:	910003fd 	mov	x29, sp
    c20c:	a90153f3 	stp	x19, x20, [sp, #16]
    c210:	93407c13 	sxtw	x19, w0
    c214:	f90013f5 	str	x21, [sp, #32]
    c218:	f9411855 	ldr	x21, [x2, #560]
    c21c:	71007e7f 	cmp	w19, #0x1f
    c220:	54000148 	b.hi	c248 <signal+0x48>  // b.pmore
    c224:	aa0103f4 	mov	x20, x1
    c228:	f9428ea1 	ldr	x1, [x21, #1304]
    c22c:	b40001c1 	cbz	x1, c264 <signal+0x64>
    c230:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    c234:	f8337834 	str	x20, [x1, x19, lsl #3]
    c238:	a94153f3 	ldp	x19, x20, [sp, #16]
    c23c:	f94013f5 	ldr	x21, [sp, #32]
    c240:	a8c37bfd 	ldp	x29, x30, [sp], #48
    c244:	d65f03c0 	ret
    c248:	528002c1 	mov	w1, #0x16                  	// #22
    c24c:	b90002a1 	str	w1, [x21]
    c250:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    c254:	a94153f3 	ldp	x19, x20, [sp, #16]
    c258:	f94013f5 	ldr	x21, [sp, #32]
    c25c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    c260:	d65f03c0 	ret
    c264:	d2802001 	mov	x1, #0x100                 	// #256
    c268:	aa1503e0 	mov	x0, x21
    c26c:	97fff9a5 	bl	a900 <_malloc_r>
    c270:	f9028ea0 	str	x0, [x21, #1304]
    c274:	aa0003e1 	mov	x1, x0
    c278:	b4000100 	cbz	x0, c298 <signal+0x98>
    c27c:	aa0003e2 	mov	x2, x0
    c280:	91040003 	add	x3, x0, #0x100
    c284:	d503201f 	nop
    c288:	f800845f 	str	xzr, [x2], #8
    c28c:	eb02007f 	cmp	x3, x2
    c290:	54ffffc1 	b.ne	c288 <signal+0x88>  // b.any
    c294:	17ffffe7 	b	c230 <signal+0x30>
    c298:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    c29c:	17ffffe7 	b	c238 <signal+0x38>

000000000000c2a0 <_init_signal>:
    c2a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c2a4:	f0000000 	adrp	x0, f000 <IpcFsServer+0x5d8>
    c2a8:	910003fd 	mov	x29, sp
    c2ac:	f9000bf3 	str	x19, [sp, #16]
    c2b0:	f9411813 	ldr	x19, [x0, #560]
    c2b4:	f9428e60 	ldr	x0, [x19, #1304]
    c2b8:	b40000a0 	cbz	x0, c2cc <_init_signal+0x2c>
    c2bc:	52800000 	mov	w0, #0x0                   	// #0
    c2c0:	f9400bf3 	ldr	x19, [sp, #16]
    c2c4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c2c8:	d65f03c0 	ret
    c2cc:	aa1303e0 	mov	x0, x19
    c2d0:	d2802001 	mov	x1, #0x100                 	// #256
    c2d4:	97fff98b 	bl	a900 <_malloc_r>
    c2d8:	f9028e60 	str	x0, [x19, #1304]
    c2dc:	b40000e0 	cbz	x0, c2f8 <_init_signal+0x58>
    c2e0:	91040001 	add	x1, x0, #0x100
    c2e4:	d503201f 	nop
    c2e8:	f800841f 	str	xzr, [x0], #8
    c2ec:	eb01001f 	cmp	x0, x1
    c2f0:	54ffffc1 	b.ne	c2e8 <_init_signal+0x48>  // b.any
    c2f4:	17fffff2 	b	c2bc <_init_signal+0x1c>
    c2f8:	12800000 	mov	w0, #0xffffffff            	// #-1
    c2fc:	17fffff1 	b	c2c0 <_init_signal+0x20>

000000000000c300 <__sigtramp>:
    c300:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c304:	f0000001 	adrp	x1, f000 <IpcFsServer+0x5d8>
    c308:	910003fd 	mov	x29, sp
    c30c:	a90153f3 	stp	x19, x20, [sp, #16]
    c310:	f9411834 	ldr	x20, [x1, #560]
    c314:	71007c1f 	cmp	w0, #0x1f
    c318:	54000508 	b.hi	c3b8 <__sigtramp+0xb8>  // b.pmore
    c31c:	f9428e82 	ldr	x2, [x20, #1304]
    c320:	2a0003f3 	mov	w19, w0
    c324:	b4000262 	cbz	x2, c370 <__sigtramp+0x70>
    c328:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    c32c:	8b33cc42 	add	x2, x2, w19, sxtw #3
    c330:	b4000181 	cbz	x1, c360 <__sigtramp+0x60>
    c334:	b100043f 	cmn	x1, #0x1
    c338:	540003c0 	b.eq	c3b0 <__sigtramp+0xb0>  // b.none
    c33c:	f100043f 	cmp	x1, #0x1
    c340:	54000300 	b.eq	c3a0 <__sigtramp+0xa0>  // b.none
    c344:	f900005f 	str	xzr, [x2]
    c348:	2a1303e0 	mov	w0, w19
    c34c:	d63f0020 	blr	x1
    c350:	52800000 	mov	w0, #0x0                   	// #0
    c354:	a94153f3 	ldp	x19, x20, [sp, #16]
    c358:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c35c:	d65f03c0 	ret
    c360:	52800020 	mov	w0, #0x1                   	// #1
    c364:	a94153f3 	ldp	x19, x20, [sp, #16]
    c368:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c36c:	d65f03c0 	ret
    c370:	aa1403e0 	mov	x0, x20
    c374:	d2802001 	mov	x1, #0x100                 	// #256
    c378:	97fff962 	bl	a900 <_malloc_r>
    c37c:	f9028e80 	str	x0, [x20, #1304]
    c380:	aa0003e2 	mov	x2, x0
    c384:	b40001a0 	cbz	x0, c3b8 <__sigtramp+0xb8>
    c388:	aa0003e1 	mov	x1, x0
    c38c:	91040000 	add	x0, x0, #0x100
    c390:	f800843f 	str	xzr, [x1], #8
    c394:	eb00003f 	cmp	x1, x0
    c398:	54ffffc1 	b.ne	c390 <__sigtramp+0x90>  // b.any
    c39c:	17ffffe3 	b	c328 <__sigtramp+0x28>
    c3a0:	52800060 	mov	w0, #0x3                   	// #3
    c3a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    c3a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c3ac:	d65f03c0 	ret
    c3b0:	52800040 	mov	w0, #0x2                   	// #2
    c3b4:	17ffffe8 	b	c354 <__sigtramp+0x54>
    c3b8:	12800000 	mov	w0, #0xffffffff            	// #-1
    c3bc:	17ffffe6 	b	c354 <__sigtramp+0x54>

000000000000c3c0 <_kill_r>:
    c3c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c3c4:	910003fd 	mov	x29, sp
    c3c8:	a90153f3 	stp	x19, x20, [sp, #16]
    c3cc:	900004f4 	adrp	x20, a8000 <_stack+0x28000>
    c3d0:	aa0003f3 	mov	x19, x0
    c3d4:	b909929f 	str	wzr, [x20, #2448]
    c3d8:	2a0103e0 	mov	w0, w1
    c3dc:	2a0203e1 	mov	w1, w2
    c3e0:	97ffe594 	bl	5a30 <_kill>
    c3e4:	3100041f 	cmn	w0, #0x1
    c3e8:	54000080 	b.eq	c3f8 <_kill_r+0x38>  // b.none
    c3ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    c3f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c3f4:	d65f03c0 	ret
    c3f8:	b9499281 	ldr	w1, [x20, #2448]
    c3fc:	34ffff81 	cbz	w1, c3ec <_kill_r+0x2c>
    c400:	b9000261 	str	w1, [x19]
    c404:	a94153f3 	ldp	x19, x20, [sp, #16]
    c408:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c40c:	d65f03c0 	ret

000000000000c410 <_getpid_r>:
    c410:	17ffe58c 	b	5a40 <_getpid>
    c414:	d503201f 	nop
    c418:	d503201f 	nop
    c41c:	d503201f 	nop

000000000000c420 <__sread>:
    c420:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c424:	93407c63 	sxtw	x3, w3
    c428:	910003fd 	mov	x29, sp
    c42c:	f9000bf3 	str	x19, [sp, #16]
    c430:	aa0103f3 	mov	x19, x1
    c434:	79c02421 	ldrsh	w1, [x1, #18]
    c438:	940004d2 	bl	d780 <_read_r>
    c43c:	b7f800e0 	tbnz	x0, #63, c458 <__sread+0x38>
    c440:	f9404a61 	ldr	x1, [x19, #144]
    c444:	8b000021 	add	x1, x1, x0
    c448:	f9004a61 	str	x1, [x19, #144]
    c44c:	f9400bf3 	ldr	x19, [sp, #16]
    c450:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c454:	d65f03c0 	ret
    c458:	79402261 	ldrh	w1, [x19, #16]
    c45c:	12137821 	and	w1, w1, #0xffffefff
    c460:	79002261 	strh	w1, [x19, #16]
    c464:	f9400bf3 	ldr	x19, [sp, #16]
    c468:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c46c:	d65f03c0 	ret

000000000000c470 <__seofread>:
    c470:	52800000 	mov	w0, #0x0                   	// #0
    c474:	d65f03c0 	ret
    c478:	d503201f 	nop
    c47c:	d503201f 	nop

000000000000c480 <__swrite>:
    c480:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    c484:	910003fd 	mov	x29, sp
    c488:	79c02024 	ldrsh	w4, [x1, #16]
    c48c:	a90153f3 	stp	x19, x20, [sp, #16]
    c490:	aa0103f3 	mov	x19, x1
    c494:	aa0003f4 	mov	x20, x0
    c498:	a9025bf5 	stp	x21, x22, [sp, #32]
    c49c:	aa0203f5 	mov	x21, x2
    c4a0:	2a0303f6 	mov	w22, w3
    c4a4:	37400184 	tbnz	w4, #8, c4d4 <__swrite+0x54>
    c4a8:	79c02661 	ldrsh	w1, [x19, #18]
    c4ac:	12137884 	and	w4, w4, #0xffffefff
    c4b0:	79002264 	strh	w4, [x19, #16]
    c4b4:	93407ec3 	sxtw	x3, w22
    c4b8:	aa1503e2 	mov	x2, x21
    c4bc:	aa1403e0 	mov	x0, x20
    c4c0:	94000390 	bl	d300 <_write_r>
    c4c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    c4c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    c4cc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    c4d0:	d65f03c0 	ret
    c4d4:	79c02421 	ldrsh	w1, [x1, #18]
    c4d8:	52800043 	mov	w3, #0x2                   	// #2
    c4dc:	d2800002 	mov	x2, #0x0                   	// #0
    c4e0:	94000490 	bl	d720 <_lseek_r>
    c4e4:	79c02264 	ldrsh	w4, [x19, #16]
    c4e8:	17fffff0 	b	c4a8 <__swrite+0x28>
    c4ec:	d503201f 	nop

000000000000c4f0 <__sseek>:
    c4f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c4f4:	910003fd 	mov	x29, sp
    c4f8:	f9000bf3 	str	x19, [sp, #16]
    c4fc:	aa0103f3 	mov	x19, x1
    c500:	79c02421 	ldrsh	w1, [x1, #18]
    c504:	94000487 	bl	d720 <_lseek_r>
    c508:	79402261 	ldrh	w1, [x19, #16]
    c50c:	b100041f 	cmn	x0, #0x1
    c510:	540000e0 	b.eq	c52c <__sseek+0x3c>  // b.none
    c514:	32140021 	orr	w1, w1, #0x1000
    c518:	79002261 	strh	w1, [x19, #16]
    c51c:	f9004a60 	str	x0, [x19, #144]
    c520:	f9400bf3 	ldr	x19, [sp, #16]
    c524:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c528:	d65f03c0 	ret
    c52c:	12137821 	and	w1, w1, #0xffffefff
    c530:	79002261 	strh	w1, [x19, #16]
    c534:	f9400bf3 	ldr	x19, [sp, #16]
    c538:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c53c:	d65f03c0 	ret

000000000000c540 <__sclose>:
    c540:	79c02421 	ldrsh	w1, [x1, #18]
    c544:	14000387 	b	d360 <_close_r>
    c548:	d503201f 	nop
    c54c:	d503201f 	nop

000000000000c550 <strcasecmp>:
    c550:	d0000006 	adrp	x6, e000 <__func__.0+0x280>
    c554:	aa0003e8 	mov	x8, x0
    c558:	912424c6 	add	x6, x6, #0x909
    c55c:	d2800003 	mov	x3, #0x0                   	// #0
    c560:	38636902 	ldrb	w2, [x8, x3]
    c564:	38636820 	ldrb	w0, [x1, x3]
    c568:	91000463 	add	x3, x3, #0x1
    c56c:	92401c45 	and	x5, x2, #0xff
    c570:	11008047 	add	w7, w2, #0x20
    c574:	92401c04 	and	x4, x0, #0xff
    c578:	386568c5 	ldrb	w5, [x6, x5]
    c57c:	386468c4 	ldrb	w4, [x6, x4]
    c580:	120004a5 	and	w5, w5, #0x3
    c584:	710004bf 	cmp	w5, #0x1
    c588:	12000484 	and	w4, w4, #0x3
    c58c:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    c590:	7100049f 	cmp	w4, #0x1
    c594:	540000a0 	b.eq	c5a8 <strcasecmp+0x58>  // b.none
    c598:	6b000042 	subs	w2, w2, w0
    c59c:	540000e1 	b.ne	c5b8 <strcasecmp+0x68>  // b.any
    c5a0:	35fffe00 	cbnz	w0, c560 <strcasecmp+0x10>
    c5a4:	d65f03c0 	ret
    c5a8:	11008000 	add	w0, w0, #0x20
    c5ac:	6b000040 	subs	w0, w2, w0
    c5b0:	54fffd80 	b.eq	c560 <strcasecmp+0x10>  // b.none
    c5b4:	d65f03c0 	ret
    c5b8:	2a0203e0 	mov	w0, w2
    c5bc:	d65f03c0 	ret

000000000000c5c0 <strcat>:
    c5c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    c5c4:	910003fd 	mov	x29, sp
    c5c8:	f9000bf3 	str	x19, [sp, #16]
    c5cc:	aa0003f3 	mov	x19, x0
    c5d0:	f240081f 	tst	x0, #0x7
    c5d4:	540001c1 	b.ne	c60c <strcat+0x4c>  // b.any
    c5d8:	f9400002 	ldr	x2, [x0]
    c5dc:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    c5e0:	f29fdfe4 	movk	x4, #0xfeff
    c5e4:	8b040043 	add	x3, x2, x4
    c5e8:	8a220062 	bic	x2, x3, x2
    c5ec:	f201c05f 	tst	x2, #0x8080808080808080
    c5f0:	540000e1 	b.ne	c60c <strcat+0x4c>  // b.any
    c5f4:	d503201f 	nop
    c5f8:	f8408c02 	ldr	x2, [x0, #8]!
    c5fc:	8b040043 	add	x3, x2, x4
    c600:	8a220062 	bic	x2, x3, x2
    c604:	f201c05f 	tst	x2, #0x8080808080808080
    c608:	54ffff80 	b.eq	c5f8 <strcat+0x38>  // b.none
    c60c:	39400002 	ldrb	w2, [x0]
    c610:	34000082 	cbz	w2, c620 <strcat+0x60>
    c614:	d503201f 	nop
    c618:	38401c02 	ldrb	w2, [x0, #1]!
    c61c:	35ffffe2 	cbnz	w2, c618 <strcat+0x58>
    c620:	94000048 	bl	c740 <strcpy>
    c624:	aa1303e0 	mov	x0, x19
    c628:	f9400bf3 	ldr	x19, [sp, #16]
    c62c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    c630:	d65f03c0 	ret

000000000000c634 <strchr>:
    c634:	52808024 	mov	w4, #0x401                 	// #1025
    c638:	72a80204 	movk	w4, #0x4010, lsl #16
    c63c:	4e010c20 	dup	v0.16b, w1
    c640:	927be802 	and	x2, x0, #0xffffffffffffffe0
    c644:	4e040c90 	dup	v16.4s, w4
    c648:	f2401003 	ands	x3, x0, #0x1f
    c64c:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    c650:	540002a0 	b.eq	c6a4 <strchr+0x70>  // b.none
    c654:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    c658:	cb0303e3 	neg	x3, x3
    c65c:	4e209823 	cmeq	v3.16b, v1.16b, #0
    c660:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    c664:	4e209844 	cmeq	v4.16b, v2.16b, #0
    c668:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    c66c:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    c670:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    c674:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    c678:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    c67c:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    c680:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    c684:	d37ff863 	lsl	x3, x3, #1
    c688:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    c68c:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    c690:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    c694:	9ac324a3 	lsr	x3, x5, x3
    c698:	4e083e25 	mov	x5, v17.d[0]
    c69c:	8a2300a3 	bic	x3, x5, x3
    c6a0:	b50002a3 	cbnz	x3, c6f4 <strchr+0xc0>
    c6a4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    c6a8:	4e209823 	cmeq	v3.16b, v1.16b, #0
    c6ac:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    c6b0:	4e209844 	cmeq	v4.16b, v2.16b, #0
    c6b4:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    c6b8:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    c6bc:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    c6c0:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    c6c4:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    c6c8:	4e083e23 	mov	x3, v17.d[0]
    c6cc:	b4fffec3 	cbz	x3, c6a4 <strchr+0x70>
    c6d0:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    c6d4:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    c6d8:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    c6dc:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    c6e0:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    c6e4:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    c6e8:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    c6ec:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    c6f0:	4e083e23 	mov	x3, v17.d[0]
    c6f4:	dac00063 	rbit	x3, x3
    c6f8:	d1008042 	sub	x2, x2, #0x20
    c6fc:	dac01063 	clz	x3, x3
    c700:	f240007f 	tst	x3, #0x1
    c704:	8b430440 	add	x0, x2, x3, lsr #1
    c708:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    c70c:	d65f03c0 	ret
    c710:	d503201f 	nop
    c714:	d503201f 	nop
    c718:	d503201f 	nop
    c71c:	d503201f 	nop
    c720:	d503201f 	nop
    c724:	d503201f 	nop
    c728:	d503201f 	nop
    c72c:	d503201f 	nop
    c730:	d503201f 	nop
    c734:	d503201f 	nop
    c738:	d503201f 	nop
    c73c:	d503201f 	nop

000000000000c740 <strcpy>:
    c740:	92402c29 	and	x9, x1, #0xfff
    c744:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    c748:	92400c31 	and	x17, x1, #0xf
    c74c:	f13fc13f 	cmp	x9, #0xff0
    c750:	cb1103e8 	neg	x8, x17
    c754:	540008cc 	b.gt	c86c <strcpy+0x12c>
    c758:	a9401424 	ldp	x4, x5, [x1]
    c75c:	cb0c0088 	sub	x8, x4, x12
    c760:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    c764:	ea290106 	bics	x6, x8, x9
    c768:	540001c1 	b.ne	c7a0 <strcpy+0x60>  // b.any
    c76c:	cb0c00aa 	sub	x10, x5, x12
    c770:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    c774:	ea2b0147 	bics	x7, x10, x11
    c778:	54000440 	b.eq	c800 <strcpy+0xc0>  // b.none
    c77c:	dac00ce7 	rev	x7, x7
    c780:	dac010ef 	clz	x15, x7
    c784:	d2800709 	mov	x9, #0x38                  	// #56
    c788:	8b4f0c03 	add	x3, x0, x15, lsr #3
    c78c:	cb0f012f 	sub	x15, x9, x15
    c790:	9acf20a5 	lsl	x5, x5, x15
    c794:	f8001065 	stur	x5, [x3, #1]
    c798:	f9000004 	str	x4, [x0]
    c79c:	d65f03c0 	ret
    c7a0:	dac00cc6 	rev	x6, x6
    c7a4:	dac010cf 	clz	x15, x6
    c7a8:	8b4f0c03 	add	x3, x0, x15, lsr #3
    c7ac:	f10061e9 	subs	x9, x15, #0x18
    c7b0:	540000ab 	b.lt	c7c4 <strcpy+0x84>  // b.tstop
    c7b4:	9ac92485 	lsr	x5, x4, x9
    c7b8:	b81fd065 	stur	w5, [x3, #-3]
    c7bc:	b9000004 	str	w4, [x0]
    c7c0:	d65f03c0 	ret
    c7c4:	b400004f 	cbz	x15, c7cc <strcpy+0x8c>
    c7c8:	79000004 	strh	w4, [x0]
    c7cc:	3900007f 	strb	wzr, [x3]
    c7d0:	d65f03c0 	ret
    c7d4:	d503201f 	nop
    c7d8:	d503201f 	nop
    c7dc:	d503201f 	nop
    c7e0:	d503201f 	nop
    c7e4:	d503201f 	nop
    c7e8:	d503201f 	nop
    c7ec:	d503201f 	nop
    c7f0:	d503201f 	nop
    c7f4:	d503201f 	nop
    c7f8:	d503201f 	nop
    c7fc:	d503201f 	nop
    c800:	d1004231 	sub	x17, x17, #0x10
    c804:	a9001404 	stp	x4, x5, [x0]
    c808:	cb110022 	sub	x2, x1, x17
    c80c:	cb110003 	sub	x3, x0, x17
    c810:	14000002 	b	c818 <strcpy+0xd8>
    c814:	a8811464 	stp	x4, x5, [x3], #16
    c818:	a8c11444 	ldp	x4, x5, [x2], #16
    c81c:	cb0c0088 	sub	x8, x4, x12
    c820:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    c824:	cb0c00aa 	sub	x10, x5, x12
    c828:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    c82c:	8a290106 	bic	x6, x8, x9
    c830:	ea2b0147 	bics	x7, x10, x11
    c834:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    c838:	54fffee0 	b.eq	c814 <strcpy+0xd4>  // b.none
    c83c:	f10000df 	cmp	x6, #0x0
    c840:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    c844:	dac00cc6 	rev	x6, x6
    c848:	dac010cf 	clz	x15, x6
    c84c:	910121e8 	add	x8, x15, #0x48
    c850:	910021ef 	add	x15, x15, #0x8
    c854:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    c858:	8b4f0c42 	add	x2, x2, x15, lsr #3
    c85c:	8b4f0c63 	add	x3, x3, x15, lsr #3
    c860:	a97e1444 	ldp	x4, x5, [x2, #-32]
    c864:	a93f1464 	stp	x4, x5, [x3, #-16]
    c868:	d65f03c0 	ret
    c86c:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    c870:	a9401444 	ldp	x4, x5, [x2]
    c874:	d37df108 	lsl	x8, x8, #3
    c878:	f2400a3f 	tst	x17, #0x7
    c87c:	da9f03e9 	csetm	x9, ne  // ne = any
    c880:	9ac82529 	lsr	x9, x9, x8
    c884:	aa090084 	orr	x4, x4, x9
    c888:	aa0900ae 	orr	x14, x5, x9
    c88c:	f100223f 	cmp	x17, #0x8
    c890:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    c894:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    c898:	cb0c0088 	sub	x8, x4, x12
    c89c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    c8a0:	cb0c00aa 	sub	x10, x5, x12
    c8a4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    c8a8:	8a290106 	bic	x6, x8, x9
    c8ac:	ea2b0147 	bics	x7, x10, x11
    c8b0:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    c8b4:	54fff520 	b.eq	c758 <strcpy+0x18>  // b.none
    c8b8:	d37df228 	lsl	x8, x17, #3
    c8bc:	cb110fe9 	neg	x9, x17, lsl #3
    c8c0:	9ac8248d 	lsr	x13, x4, x8
    c8c4:	9ac920ab 	lsl	x11, x5, x9
    c8c8:	9ac824a5 	lsr	x5, x5, x8
    c8cc:	aa0d016b 	orr	x11, x11, x13
    c8d0:	f100223f 	cmp	x17, #0x8
    c8d4:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    c8d8:	cb0c0088 	sub	x8, x4, x12
    c8dc:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    c8e0:	cb0c00aa 	sub	x10, x5, x12
    c8e4:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    c8e8:	8a290106 	bic	x6, x8, x9
    c8ec:	b5fff5a6 	cbnz	x6, c7a0 <strcpy+0x60>
    c8f0:	8a2b0147 	bic	x7, x10, x11
    c8f4:	17ffffa2 	b	c77c <strcpy+0x3c>
    c8f8:	d503201f 	nop
    c8fc:	d503201f 	nop

000000000000c900 <strlcpy>:
    c900:	aa0003e4 	mov	x4, x0
    c904:	aa0103e3 	mov	x3, x1
    c908:	b4000202 	cbz	x2, c948 <strlcpy+0x48>
    c90c:	f100045f 	cmp	x2, #0x1
    c910:	54000180 	b.eq	c940 <strlcpy+0x40>  // b.none
    c914:	8b020002 	add	x2, x0, x2
    c918:	14000003 	b	c924 <strlcpy+0x24>
    c91c:	ab02001f 	cmn	x0, x2
    c920:	54000100 	b.eq	c940 <strlcpy+0x40>  // b.none
    c924:	38401465 	ldrb	w5, [x3], #1
    c928:	38001485 	strb	w5, [x4], #1
    c92c:	aa2403e0 	mvn	x0, x4
    c930:	35ffff65 	cbnz	w5, c91c <strlcpy+0x1c>
    c934:	cb010060 	sub	x0, x3, x1
    c938:	d1000400 	sub	x0, x0, #0x1
    c93c:	d65f03c0 	ret
    c940:	3900009f 	strb	wzr, [x4]
    c944:	d503201f 	nop
    c948:	38401462 	ldrb	w2, [x3], #1
    c94c:	34ffff42 	cbz	w2, c934 <strlcpy+0x34>
    c950:	38401462 	ldrb	w2, [x3], #1
    c954:	35ffffa2 	cbnz	w2, c948 <strlcpy+0x48>
    c958:	17fffff7 	b	c934 <strlcpy+0x34>
    c95c:	d503201f 	nop

000000000000c960 <strncasecmp>:
    c960:	aa0003e9 	mov	x9, x0
    c964:	b4000382 	cbz	x2, c9d4 <strncasecmp+0x74>
    c968:	d0000007 	adrp	x7, e000 <__func__.0+0x280>
    c96c:	d2800004 	mov	x4, #0x0                   	// #0
    c970:	912424e7 	add	x7, x7, #0x909
    c974:	14000006 	b	c98c <strncasecmp+0x2c>
    c978:	6b000063 	subs	w3, w3, w0
    c97c:	54000301 	b.ne	c9dc <strncasecmp+0x7c>  // b.any
    c980:	34000280 	cbz	w0, c9d0 <strncasecmp+0x70>
    c984:	eb04005f 	cmp	x2, x4
    c988:	54000260 	b.eq	c9d4 <strncasecmp+0x74>  // b.none
    c98c:	38646923 	ldrb	w3, [x9, x4]
    c990:	38646820 	ldrb	w0, [x1, x4]
    c994:	91000484 	add	x4, x4, #0x1
    c998:	92401c66 	and	x6, x3, #0xff
    c99c:	11008068 	add	w8, w3, #0x20
    c9a0:	92401c05 	and	x5, x0, #0xff
    c9a4:	386668e6 	ldrb	w6, [x7, x6]
    c9a8:	386568e5 	ldrb	w5, [x7, x5]
    c9ac:	120004c6 	and	w6, w6, #0x3
    c9b0:	710004df 	cmp	w6, #0x1
    c9b4:	120004a5 	and	w5, w5, #0x3
    c9b8:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    c9bc:	710004bf 	cmp	w5, #0x1
    c9c0:	54fffdc1 	b.ne	c978 <strncasecmp+0x18>  // b.any
    c9c4:	11008000 	add	w0, w0, #0x20
    c9c8:	6b000060 	subs	w0, w3, w0
    c9cc:	54fffdc0 	b.eq	c984 <strncasecmp+0x24>  // b.none
    c9d0:	d65f03c0 	ret
    c9d4:	52800000 	mov	w0, #0x0                   	// #0
    c9d8:	d65f03c0 	ret
    c9dc:	2a0303e0 	mov	w0, w3
    c9e0:	d65f03c0 	ret
    c9e4:	d503201f 	nop
    c9e8:	d503201f 	nop
    c9ec:	d503201f 	nop

000000000000c9f0 <_strtol_l.part.0>:
    c9f0:	d0000007 	adrp	x7, e000 <__func__.0+0x280>
    c9f4:	aa0003ec 	mov	x12, x0
    c9f8:	aa0103e6 	mov	x6, x1
    c9fc:	912424e7 	add	x7, x7, #0x909
    ca00:	aa0603e8 	mov	x8, x6
    ca04:	384014c4 	ldrb	w4, [x6], #1
    ca08:	92401c85 	and	x5, x4, #0xff
    ca0c:	386568e5 	ldrb	w5, [x7, x5]
    ca10:	371fff85 	tbnz	w5, #3, ca00 <_strtol_l.part.0+0x10>
    ca14:	2a0403e5 	mov	w5, w4
    ca18:	7100b49f 	cmp	w4, #0x2d
    ca1c:	54000880 	b.eq	cb2c <_strtol_l.part.0+0x13c>  // b.none
    ca20:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    ca24:	5280000d 	mov	w13, #0x0                   	// #0
    ca28:	7100ac9f 	cmp	w4, #0x2b
    ca2c:	540006a0 	b.eq	cb00 <_strtol_l.part.0+0x110>  // b.none
    ca30:	721b787f 	tst	w3, #0xffffffef
    ca34:	54000121 	b.ne	ca58 <_strtol_l.part.0+0x68>  // b.any
    ca38:	7100c0bf 	cmp	w5, #0x30
    ca3c:	54000820 	b.eq	cb40 <_strtol_l.part.0+0x150>  // b.none
    ca40:	350000c3 	cbnz	w3, ca58 <_strtol_l.part.0+0x68>
    ca44:	d280014a 	mov	x10, #0xa                   	// #10
    ca48:	2a0a03e3 	mov	w3, w10
    ca4c:	14000004 	b	ca5c <_strtol_l.part.0+0x6c>
    ca50:	34000903 	cbz	w3, cb70 <_strtol_l.part.0+0x180>
    ca54:	d503201f 	nop
    ca58:	93407c6a 	sxtw	x10, w3
    ca5c:	9aca0968 	udiv	x8, x11, x10
    ca60:	52800007 	mov	w7, #0x0                   	// #0
    ca64:	d2800000 	mov	x0, #0x0                   	// #0
    ca68:	1b0aad09 	msub	w9, w8, w10, w11
    ca6c:	d503201f 	nop
    ca70:	5100c0a4 	sub	w4, w5, #0x30
    ca74:	7100249f 	cmp	w4, #0x9
    ca78:	540000a9 	b.ls	ca8c <_strtol_l.part.0+0x9c>  // b.plast
    ca7c:	510104a4 	sub	w4, w5, #0x41
    ca80:	7100649f 	cmp	w4, #0x19
    ca84:	54000208 	b.hi	cac4 <_strtol_l.part.0+0xd4>  // b.pmore
    ca88:	5100dca4 	sub	w4, w5, #0x37
    ca8c:	6b04007f 	cmp	w3, w4
    ca90:	5400028d 	b.le	cae0 <_strtol_l.part.0+0xf0>
    ca94:	710000ff 	cmp	w7, #0x0
    ca98:	12800007 	mov	w7, #0xffffffff            	// #-1
    ca9c:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    caa0:	540000e3 	b.cc	cabc <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    caa4:	eb00011f 	cmp	x8, x0
    caa8:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    caac:	5400008b 	b.lt	cabc <_strtol_l.part.0+0xcc>  // b.tstop
    cab0:	93407c84 	sxtw	x4, w4
    cab4:	52800027 	mov	w7, #0x1                   	// #1
    cab8:	9b0a1000 	madd	x0, x0, x10, x4
    cabc:	384014c5 	ldrb	w5, [x6], #1
    cac0:	17ffffec 	b	ca70 <_strtol_l.part.0+0x80>
    cac4:	510184a4 	sub	w4, w5, #0x61
    cac8:	7100649f 	cmp	w4, #0x19
    cacc:	540000a8 	b.hi	cae0 <_strtol_l.part.0+0xf0>  // b.pmore
    cad0:	51015ca4 	sub	w4, w5, #0x57
    cad4:	6b04007f 	cmp	w3, w4
    cad8:	54fffdec 	b.gt	ca94 <_strtol_l.part.0+0xa4>
    cadc:	d503201f 	nop
    cae0:	310004ff 	cmn	w7, #0x1
    cae4:	54000140 	b.eq	cb0c <_strtol_l.part.0+0x11c>  // b.none
    cae8:	710001bf 	cmp	w13, #0x0
    caec:	da800400 	cneg	x0, x0, ne  // ne = any
    caf0:	b4000062 	cbz	x2, cafc <_strtol_l.part.0+0x10c>
    caf4:	350003a7 	cbnz	w7, cb68 <_strtol_l.part.0+0x178>
    caf8:	f9000041 	str	x1, [x2]
    cafc:	d65f03c0 	ret
    cb00:	394000c5 	ldrb	w5, [x6]
    cb04:	91000906 	add	x6, x8, #0x2
    cb08:	17ffffca 	b	ca30 <_strtol_l.part.0+0x40>
    cb0c:	52800440 	mov	w0, #0x22                  	// #34
    cb10:	b9000180 	str	w0, [x12]
    cb14:	aa0b03e0 	mov	x0, x11
    cb18:	b4ffff22 	cbz	x2, cafc <_strtol_l.part.0+0x10c>
    cb1c:	d10004c1 	sub	x1, x6, #0x1
    cb20:	aa0b03e0 	mov	x0, x11
    cb24:	f9000041 	str	x1, [x2]
    cb28:	17fffff5 	b	cafc <_strtol_l.part.0+0x10c>
    cb2c:	394000c5 	ldrb	w5, [x6]
    cb30:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    cb34:	91000906 	add	x6, x8, #0x2
    cb38:	5280002d 	mov	w13, #0x1                   	// #1
    cb3c:	17ffffbd 	b	ca30 <_strtol_l.part.0+0x40>
    cb40:	394000c0 	ldrb	w0, [x6]
    cb44:	121a7800 	and	w0, w0, #0xffffffdf
    cb48:	12001c00 	and	w0, w0, #0xff
    cb4c:	7101601f 	cmp	w0, #0x58
    cb50:	54fff801 	b.ne	ca50 <_strtol_l.part.0+0x60>  // b.any
    cb54:	394004c5 	ldrb	w5, [x6, #1]
    cb58:	d280020a 	mov	x10, #0x10                  	// #16
    cb5c:	910008c6 	add	x6, x6, #0x2
    cb60:	2a0a03e3 	mov	w3, w10
    cb64:	17ffffbe 	b	ca5c <_strtol_l.part.0+0x6c>
    cb68:	aa0003eb 	mov	x11, x0
    cb6c:	17ffffec 	b	cb1c <_strtol_l.part.0+0x12c>
    cb70:	d280010a 	mov	x10, #0x8                   	// #8
    cb74:	2a0a03e3 	mov	w3, w10
    cb78:	17ffffb9 	b	ca5c <_strtol_l.part.0+0x6c>
    cb7c:	d503201f 	nop

000000000000cb80 <_strtol_r>:
    cb80:	7100907f 	cmp	w3, #0x24
    cb84:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    cb88:	54000040 	b.eq	cb90 <_strtol_r+0x10>  // b.none
    cb8c:	17ffff99 	b	c9f0 <_strtol_l.part.0>
    cb90:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    cb94:	910003fd 	mov	x29, sp
    cb98:	9400020a 	bl	d3c0 <__errno>
    cb9c:	528002c1 	mov	w1, #0x16                  	// #22
    cba0:	b9000001 	str	w1, [x0]
    cba4:	d2800000 	mov	x0, #0x0                   	// #0
    cba8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    cbac:	d65f03c0 	ret

000000000000cbb0 <strtol_l>:
    cbb0:	7100905f 	cmp	w2, #0x24
    cbb4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    cbb8:	540000e0 	b.eq	cbd4 <strtol_l+0x24>  // b.none
    cbbc:	f0000004 	adrp	x4, f000 <IpcFsServer+0x5d8>
    cbc0:	2a0203e3 	mov	w3, w2
    cbc4:	aa0103e2 	mov	x2, x1
    cbc8:	aa0003e1 	mov	x1, x0
    cbcc:	f9411880 	ldr	x0, [x4, #560]
    cbd0:	17ffff88 	b	c9f0 <_strtol_l.part.0>
    cbd4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    cbd8:	910003fd 	mov	x29, sp
    cbdc:	940001f9 	bl	d3c0 <__errno>
    cbe0:	528002c1 	mov	w1, #0x16                  	// #22
    cbe4:	b9000001 	str	w1, [x0]
    cbe8:	d2800000 	mov	x0, #0x0                   	// #0
    cbec:	a8c17bfd 	ldp	x29, x30, [sp], #16
    cbf0:	d65f03c0 	ret
    cbf4:	d503201f 	nop
    cbf8:	d503201f 	nop
    cbfc:	d503201f 	nop

000000000000cc00 <strtol>:
    cc00:	7100905f 	cmp	w2, #0x24
    cc04:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    cc08:	540000e0 	b.eq	cc24 <strtol+0x24>  // b.none
    cc0c:	f0000004 	adrp	x4, f000 <IpcFsServer+0x5d8>
    cc10:	2a0203e3 	mov	w3, w2
    cc14:	aa0103e2 	mov	x2, x1
    cc18:	aa0003e1 	mov	x1, x0
    cc1c:	f9411880 	ldr	x0, [x4, #560]
    cc20:	17ffff74 	b	c9f0 <_strtol_l.part.0>
    cc24:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    cc28:	910003fd 	mov	x29, sp
    cc2c:	940001e5 	bl	d3c0 <__errno>
    cc30:	528002c1 	mov	w1, #0x16                  	// #22
    cc34:	b9000001 	str	w1, [x0]
    cc38:	d2800000 	mov	x0, #0x0                   	// #0
    cc3c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    cc40:	d65f03c0 	ret
    cc44:	d503201f 	nop
    cc48:	d503201f 	nop
    cc4c:	d503201f 	nop

000000000000cc50 <__swbuf_r>:
    cc50:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    cc54:	910003fd 	mov	x29, sp
    cc58:	a90153f3 	stp	x19, x20, [sp, #16]
    cc5c:	2a0103f4 	mov	w20, w1
    cc60:	aa0203f3 	mov	x19, x2
    cc64:	a9025bf5 	stp	x21, x22, [sp, #32]
    cc68:	aa0003f5 	mov	x21, x0
    cc6c:	b4000060 	cbz	x0, cc78 <__swbuf_r+0x28>
    cc70:	b9405001 	ldr	w1, [x0, #80]
    cc74:	340007e1 	cbz	w1, cd70 <__swbuf_r+0x120>
    cc78:	79c02260 	ldrsh	w0, [x19, #16]
    cc7c:	b9402a61 	ldr	w1, [x19, #40]
    cc80:	b9000e61 	str	w1, [x19, #12]
    cc84:	12003c02 	and	w2, w0, #0xffff
    cc88:	361803e0 	tbz	w0, #3, cd04 <__swbuf_r+0xb4>
    cc8c:	f9400e61 	ldr	x1, [x19, #24]
    cc90:	b40003a1 	cbz	x1, cd04 <__swbuf_r+0xb4>
    cc94:	12001e96 	and	w22, w20, #0xff
    cc98:	12001e94 	and	w20, w20, #0xff
    cc9c:	36680482 	tbz	w2, #13, cd2c <__swbuf_r+0xdc>
    cca0:	f9400260 	ldr	x0, [x19]
    cca4:	b9402262 	ldr	w2, [x19, #32]
    cca8:	cb010001 	sub	x1, x0, x1
    ccac:	6b01005f 	cmp	w2, w1
    ccb0:	5400052d 	b.le	cd54 <__swbuf_r+0x104>
    ccb4:	11000421 	add	w1, w1, #0x1
    ccb8:	b9400e62 	ldr	w2, [x19, #12]
    ccbc:	91000403 	add	x3, x0, #0x1
    ccc0:	f9000263 	str	x3, [x19]
    ccc4:	51000442 	sub	w2, w2, #0x1
    ccc8:	b9000e62 	str	w2, [x19, #12]
    cccc:	39000016 	strb	w22, [x0]
    ccd0:	b9402260 	ldr	w0, [x19, #32]
    ccd4:	6b01001f 	cmp	w0, w1
    ccd8:	54000500 	b.eq	cd78 <__swbuf_r+0x128>  // b.none
    ccdc:	71002a9f 	cmp	w20, #0xa
    cce0:	79402260 	ldrh	w0, [x19, #16]
    cce4:	1a9f17e1 	cset	w1, eq  // eq = none
    cce8:	6a00003f 	tst	w1, w0
    ccec:	54000461 	b.ne	cd78 <__swbuf_r+0x128>  // b.any
    ccf0:	2a1403e0 	mov	w0, w20
    ccf4:	a94153f3 	ldp	x19, x20, [sp, #16]
    ccf8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ccfc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    cd00:	d65f03c0 	ret
    cd04:	aa1303e1 	mov	x1, x19
    cd08:	aa1503e0 	mov	x0, x21
    cd0c:	97ffedf5 	bl	84e0 <__swsetup_r>
    cd10:	350003c0 	cbnz	w0, cd88 <__swbuf_r+0x138>
    cd14:	79c02260 	ldrsh	w0, [x19, #16]
    cd18:	12001e96 	and	w22, w20, #0xff
    cd1c:	12001e94 	and	w20, w20, #0xff
    cd20:	12003c02 	and	w2, w0, #0xffff
    cd24:	f9400e61 	ldr	x1, [x19, #24]
    cd28:	376ffbc2 	tbnz	w2, #13, cca0 <__swbuf_r+0x50>
    cd2c:	b940ae62 	ldr	w2, [x19, #172]
    cd30:	32130000 	orr	w0, w0, #0x2000
    cd34:	79002260 	strh	w0, [x19, #16]
    cd38:	12127840 	and	w0, w2, #0xffffdfff
    cd3c:	b900ae60 	str	w0, [x19, #172]
    cd40:	f9400260 	ldr	x0, [x19]
    cd44:	b9402262 	ldr	w2, [x19, #32]
    cd48:	cb010001 	sub	x1, x0, x1
    cd4c:	6b01005f 	cmp	w2, w1
    cd50:	54fffb2c 	b.gt	ccb4 <__swbuf_r+0x64>
    cd54:	aa1303e1 	mov	x1, x19
    cd58:	aa1503e0 	mov	x0, x21
    cd5c:	97ffeef1 	bl	8920 <_fflush_r>
    cd60:	35000140 	cbnz	w0, cd88 <__swbuf_r+0x138>
    cd64:	52800021 	mov	w1, #0x1                   	// #1
    cd68:	f9400260 	ldr	x0, [x19]
    cd6c:	17ffffd3 	b	ccb8 <__swbuf_r+0x68>
    cd70:	97ffefec 	bl	8d20 <__sinit>
    cd74:	17ffffc1 	b	cc78 <__swbuf_r+0x28>
    cd78:	aa1303e1 	mov	x1, x19
    cd7c:	aa1503e0 	mov	x0, x21
    cd80:	97ffeee8 	bl	8920 <_fflush_r>
    cd84:	34fffb60 	cbz	w0, ccf0 <__swbuf_r+0xa0>
    cd88:	12800014 	mov	w20, #0xffffffff            	// #-1
    cd8c:	17ffffd9 	b	ccf0 <__swbuf_r+0xa0>

000000000000cd90 <__swbuf>:
    cd90:	f0000003 	adrp	x3, f000 <IpcFsServer+0x5d8>
    cd94:	aa0103e2 	mov	x2, x1
    cd98:	2a0003e1 	mov	w1, w0
    cd9c:	f9411860 	ldr	x0, [x3, #560]
    cda0:	17ffffac 	b	cc50 <__swbuf_r>
    cda4:	d503201f 	nop
    cda8:	d503201f 	nop
    cdac:	d503201f 	nop

000000000000cdb0 <_wcsnrtombs_l>:
    cdb0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    cdb4:	f10000bf 	cmp	x5, #0x0
    cdb8:	910003fd 	mov	x29, sp
    cdbc:	a90153f3 	stp	x19, x20, [sp, #16]
    cdc0:	aa0003f3 	mov	x19, x0
    cdc4:	91057000 	add	x0, x0, #0x15c
    cdc8:	a9025bf5 	stp	x21, x22, [sp, #32]
    cdcc:	aa0103f4 	mov	x20, x1
    cdd0:	aa0203f5 	mov	x21, x2
    cdd4:	a90363f7 	stp	x23, x24, [sp, #48]
    cdd8:	aa0603f6 	mov	x22, x6
    cddc:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    cde0:	a9046bf9 	stp	x25, x26, [sp, #64]
    cde4:	a90573fb 	stp	x27, x28, [sp, #80]
    cde8:	f940005c 	ldr	x28, [x2]
    cdec:	b4000901 	cbz	x1, cf0c <_wcsnrtombs_l+0x15c>
    cdf0:	aa0403fa 	mov	x26, x4
    cdf4:	b4000a84 	cbz	x4, cf44 <_wcsnrtombs_l+0x194>
    cdf8:	d1000478 	sub	x24, x3, #0x1
    cdfc:	b4000a43 	cbz	x3, cf44 <_wcsnrtombs_l+0x194>
    ce00:	d280001b 	mov	x27, #0x0                   	// #0
    ce04:	f90037f4 	str	x20, [sp, #104]
    ce08:	1400000a 	b	ce30 <_wcsnrtombs_l+0x80>
    ce0c:	b50003d4 	cbnz	x20, ce84 <_wcsnrtombs_l+0xd4>
    ce10:	b8404780 	ldr	w0, [x28], #4
    ce14:	34000640 	cbz	w0, cedc <_wcsnrtombs_l+0x12c>
    ce18:	eb1a011f 	cmp	x8, x26
    ce1c:	54000982 	b.cs	cf4c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    ce20:	d1000718 	sub	x24, x24, #0x1
    ce24:	aa0803fb 	mov	x27, x8
    ce28:	b100071f 	cmn	x24, #0x1
    ce2c:	540001c0 	b.eq	ce64 <_wcsnrtombs_l+0xb4>  // b.none
    ce30:	b9400382 	ldr	w2, [x28]
    ce34:	aa1703e3 	mov	x3, x23
    ce38:	f94072c4 	ldr	x4, [x22, #224]
    ce3c:	9101c3e1 	add	x1, sp, #0x70
    ce40:	aa1303e0 	mov	x0, x19
    ce44:	f94002f9 	ldr	x25, [x23]
    ce48:	d63f0080 	blr	x4
    ce4c:	3100041f 	cmn	w0, #0x1
    ce50:	54000620 	b.eq	cf14 <_wcsnrtombs_l+0x164>  // b.none
    ce54:	8b20c368 	add	x8, x27, w0, sxtw
    ce58:	eb1a011f 	cmp	x8, x26
    ce5c:	54fffd89 	b.ls	ce0c <_wcsnrtombs_l+0x5c>  // b.plast
    ce60:	f90002f9 	str	x25, [x23]
    ce64:	aa1b03e0 	mov	x0, x27
    ce68:	a94153f3 	ldp	x19, x20, [sp, #16]
    ce6c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ce70:	a94363f7 	ldp	x23, x24, [sp, #48]
    ce74:	a9446bf9 	ldp	x25, x26, [sp, #64]
    ce78:	a94573fb 	ldp	x27, x28, [sp, #80]
    ce7c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    ce80:	d65f03c0 	ret
    ce84:	7100001f 	cmp	w0, #0x0
    ce88:	5400020d 	b.le	cec8 <_wcsnrtombs_l+0x118>
    ce8c:	f94037e1 	ldr	x1, [sp, #104]
    ce90:	11000402 	add	w2, w0, #0x1
    ce94:	d2800027 	mov	x7, #0x1                   	// #1
    ce98:	d1000421 	sub	x1, x1, #0x1
    ce9c:	d503201f 	nop
    cea0:	9101c3e3 	add	x3, sp, #0x70
    cea4:	8b070069 	add	x9, x3, x7
    cea8:	385ff129 	ldurb	w9, [x9, #-1]
    ceac:	38276829 	strb	w9, [x1, x7]
    ceb0:	910004e7 	add	x7, x7, #0x1
    ceb4:	eb0200ff 	cmp	x7, x2
    ceb8:	54ffff41 	b.ne	cea0 <_wcsnrtombs_l+0xf0>  // b.any
    cebc:	f94037e1 	ldr	x1, [sp, #104]
    cec0:	8b204020 	add	x0, x1, w0, uxtw
    cec4:	f90037e0 	str	x0, [sp, #104]
    cec8:	f94002a0 	ldr	x0, [x21]
    cecc:	91001000 	add	x0, x0, #0x4
    ced0:	f90002a0 	str	x0, [x21]
    ced4:	b8404780 	ldr	w0, [x28], #4
    ced8:	35fffa00 	cbnz	w0, ce18 <_wcsnrtombs_l+0x68>
    cedc:	b4000054 	cbz	x20, cee4 <_wcsnrtombs_l+0x134>
    cee0:	f90002bf 	str	xzr, [x21]
    cee4:	b90002ff 	str	wzr, [x23]
    cee8:	d100051b 	sub	x27, x8, #0x1
    ceec:	aa1b03e0 	mov	x0, x27
    cef0:	a94153f3 	ldp	x19, x20, [sp, #16]
    cef4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    cef8:	a94363f7 	ldp	x23, x24, [sp, #48]
    cefc:	a9446bf9 	ldp	x25, x26, [sp, #64]
    cf00:	a94573fb 	ldp	x27, x28, [sp, #80]
    cf04:	a8c87bfd 	ldp	x29, x30, [sp], #128
    cf08:	d65f03c0 	ret
    cf0c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    cf10:	17ffffba 	b	cdf8 <_wcsnrtombs_l+0x48>
    cf14:	52801140 	mov	w0, #0x8a                  	// #138
    cf18:	b9000260 	str	w0, [x19]
    cf1c:	b90002ff 	str	wzr, [x23]
    cf20:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    cf24:	aa1b03e0 	mov	x0, x27
    cf28:	a94153f3 	ldp	x19, x20, [sp, #16]
    cf2c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    cf30:	a94363f7 	ldp	x23, x24, [sp, #48]
    cf34:	a9446bf9 	ldp	x25, x26, [sp, #64]
    cf38:	a94573fb 	ldp	x27, x28, [sp, #80]
    cf3c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    cf40:	d65f03c0 	ret
    cf44:	d280001b 	mov	x27, #0x0                   	// #0
    cf48:	17ffffc7 	b	ce64 <_wcsnrtombs_l+0xb4>
    cf4c:	aa0803fb 	mov	x27, x8
    cf50:	17ffffc5 	b	ce64 <_wcsnrtombs_l+0xb4>
    cf54:	d503201f 	nop
    cf58:	d503201f 	nop
    cf5c:	d503201f 	nop

000000000000cf60 <_wcsnrtombs_r>:
    cf60:	f0000000 	adrp	x0, f000 <IpcFsServer+0x5d8>
    cf64:	f0000006 	adrp	x6, f000 <IpcFsServer+0x5d8>
    cf68:	912680c6 	add	x6, x6, #0x9a0
    cf6c:	f9411800 	ldr	x0, [x0, #560]
    cf70:	17ffff90 	b	cdb0 <_wcsnrtombs_l>
    cf74:	d503201f 	nop
    cf78:	d503201f 	nop
    cf7c:	d503201f 	nop

000000000000cf80 <wcsnrtombs>:
    cf80:	f0000006 	adrp	x6, f000 <IpcFsServer+0x5d8>
    cf84:	aa0003e8 	mov	x8, x0
    cf88:	aa0103e7 	mov	x7, x1
    cf8c:	aa0203e5 	mov	x5, x2
    cf90:	f94118c0 	ldr	x0, [x6, #560]
    cf94:	aa0303e6 	mov	x6, x3
    cf98:	aa0803e1 	mov	x1, x8
    cf9c:	aa0503e3 	mov	x3, x5
    cfa0:	aa0703e2 	mov	x2, x7
    cfa4:	aa0403e5 	mov	x5, x4
    cfa8:	aa0603e4 	mov	x4, x6
    cfac:	f0000006 	adrp	x6, f000 <IpcFsServer+0x5d8>
    cfb0:	912680c6 	add	x6, x6, #0x9a0
    cfb4:	17ffff7f 	b	cdb0 <_wcsnrtombs_l>
    cfb8:	d503201f 	nop
    cfbc:	d503201f 	nop

000000000000cfc0 <_wctomb_r>:
    cfc0:	f0000004 	adrp	x4, f000 <IpcFsServer+0x5d8>
    cfc4:	f9454084 	ldr	x4, [x4, #2688]
    cfc8:	aa0403f0 	mov	x16, x4
    cfcc:	d61f0200 	br	x16

000000000000cfd0 <__ascii_wctomb>:
    cfd0:	aa0003e3 	mov	x3, x0
    cfd4:	b4000141 	cbz	x1, cffc <__ascii_wctomb+0x2c>
    cfd8:	7103fc5f 	cmp	w2, #0xff
    cfdc:	54000088 	b.hi	cfec <__ascii_wctomb+0x1c>  // b.pmore
    cfe0:	52800020 	mov	w0, #0x1                   	// #1
    cfe4:	39000022 	strb	w2, [x1]
    cfe8:	d65f03c0 	ret
    cfec:	52801141 	mov	w1, #0x8a                  	// #138
    cff0:	12800000 	mov	w0, #0xffffffff            	// #-1
    cff4:	b9000061 	str	w1, [x3]
    cff8:	d65f03c0 	ret
    cffc:	52800000 	mov	w0, #0x0                   	// #0
    d000:	d65f03c0 	ret
    d004:	d503201f 	nop
    d008:	d503201f 	nop
    d00c:	d503201f 	nop

000000000000d010 <__utf8_wctomb>:
    d010:	aa0003e3 	mov	x3, x0
    d014:	b40004e1 	cbz	x1, d0b0 <__utf8_wctomb+0xa0>
    d018:	7101fc5f 	cmp	w2, #0x7f
    d01c:	54000349 	b.ls	d084 <__utf8_wctomb+0x74>  // b.plast
    d020:	51020040 	sub	w0, w2, #0x80
    d024:	711dfc1f 	cmp	w0, #0x77f
    d028:	54000349 	b.ls	d090 <__utf8_wctomb+0x80>  // b.plast
    d02c:	51200044 	sub	w4, w2, #0x800
    d030:	529effe0 	mov	w0, #0xf7ff                	// #63487
    d034:	6b00009f 	cmp	w4, w0
    d038:	54000409 	b.ls	d0b8 <__utf8_wctomb+0xa8>  // b.plast
    d03c:	51404044 	sub	w4, w2, #0x10, lsl #12
    d040:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    d044:	6b00009f 	cmp	w4, w0
    d048:	540004e8 	b.hi	d0e4 <__utf8_wctomb+0xd4>  // b.pmore
    d04c:	53127c45 	lsr	w5, w2, #18
    d050:	d34c4444 	ubfx	x4, x2, #12, #6
    d054:	d3462c43 	ubfx	x3, x2, #6, #6
    d058:	12001442 	and	w2, w2, #0x3f
    d05c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    d060:	32196084 	orr	w4, w4, #0xffffff80
    d064:	32196063 	orr	w3, w3, #0xffffff80
    d068:	32196042 	orr	w2, w2, #0xffffff80
    d06c:	52800080 	mov	w0, #0x4                   	// #4
    d070:	39000025 	strb	w5, [x1]
    d074:	39000424 	strb	w4, [x1, #1]
    d078:	39000823 	strb	w3, [x1, #2]
    d07c:	39000c22 	strb	w2, [x1, #3]
    d080:	d65f03c0 	ret
    d084:	52800020 	mov	w0, #0x1                   	// #1
    d088:	39000022 	strb	w2, [x1]
    d08c:	d65f03c0 	ret
    d090:	53067c43 	lsr	w3, w2, #6
    d094:	12001442 	and	w2, w2, #0x3f
    d098:	321a6463 	orr	w3, w3, #0xffffffc0
    d09c:	32196042 	orr	w2, w2, #0xffffff80
    d0a0:	52800040 	mov	w0, #0x2                   	// #2
    d0a4:	39000023 	strb	w3, [x1]
    d0a8:	39000422 	strb	w2, [x1, #1]
    d0ac:	d65f03c0 	ret
    d0b0:	52800000 	mov	w0, #0x0                   	// #0
    d0b4:	d65f03c0 	ret
    d0b8:	530c7c44 	lsr	w4, w2, #12
    d0bc:	d3462c43 	ubfx	x3, x2, #6, #6
    d0c0:	12001442 	and	w2, w2, #0x3f
    d0c4:	321b6884 	orr	w4, w4, #0xffffffe0
    d0c8:	32196063 	orr	w3, w3, #0xffffff80
    d0cc:	32196042 	orr	w2, w2, #0xffffff80
    d0d0:	52800060 	mov	w0, #0x3                   	// #3
    d0d4:	39000024 	strb	w4, [x1]
    d0d8:	39000423 	strb	w3, [x1, #1]
    d0dc:	39000822 	strb	w2, [x1, #2]
    d0e0:	d65f03c0 	ret
    d0e4:	52801141 	mov	w1, #0x8a                  	// #138
    d0e8:	12800000 	mov	w0, #0xffffffff            	// #-1
    d0ec:	b9000061 	str	w1, [x3]
    d0f0:	d65f03c0 	ret
    d0f4:	d503201f 	nop
    d0f8:	d503201f 	nop
    d0fc:	d503201f 	nop

000000000000d100 <__sjis_wctomb>:
    d100:	aa0003e5 	mov	x5, x0
    d104:	12001c44 	and	w4, w2, #0xff
    d108:	d3483c43 	ubfx	x3, x2, #8, #8
    d10c:	b4000301 	cbz	x1, d16c <__sjis_wctomb+0x6c>
    d110:	34000283 	cbz	w3, d160 <__sjis_wctomb+0x60>
    d114:	1101fc60 	add	w0, w3, #0x7f
    d118:	11008063 	add	w3, w3, #0x20
    d11c:	12001c00 	and	w0, w0, #0xff
    d120:	12001c63 	and	w3, w3, #0xff
    d124:	7100781f 	cmp	w0, #0x1e
    d128:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    d12c:	54000248 	b.hi	d174 <__sjis_wctomb+0x74>  // b.pmore
    d130:	51010080 	sub	w0, w4, #0x40
    d134:	51020084 	sub	w4, w4, #0x80
    d138:	12001c00 	and	w0, w0, #0xff
    d13c:	12001c84 	and	w4, w4, #0xff
    d140:	7100f81f 	cmp	w0, #0x3e
    d144:	52800f80 	mov	w0, #0x7c                  	// #124
    d148:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    d14c:	54000148 	b.hi	d174 <__sjis_wctomb+0x74>  // b.pmore
    d150:	5ac00442 	rev16	w2, w2
    d154:	52800040 	mov	w0, #0x2                   	// #2
    d158:	79000022 	strh	w2, [x1]
    d15c:	d65f03c0 	ret
    d160:	52800020 	mov	w0, #0x1                   	// #1
    d164:	39000024 	strb	w4, [x1]
    d168:	d65f03c0 	ret
    d16c:	52800000 	mov	w0, #0x0                   	// #0
    d170:	d65f03c0 	ret
    d174:	52801141 	mov	w1, #0x8a                  	// #138
    d178:	12800000 	mov	w0, #0xffffffff            	// #-1
    d17c:	b90000a1 	str	w1, [x5]
    d180:	d65f03c0 	ret
    d184:	d503201f 	nop
    d188:	d503201f 	nop
    d18c:	d503201f 	nop

000000000000d190 <__eucjp_wctomb>:
    d190:	aa0003e4 	mov	x4, x0
    d194:	12001c43 	and	w3, w2, #0xff
    d198:	d3483c45 	ubfx	x5, x2, #8, #8
    d19c:	b4000421 	cbz	x1, d220 <__eucjp_wctomb+0x90>
    d1a0:	34000185 	cbz	w5, d1d0 <__eucjp_wctomb+0x40>
    d1a4:	11017ca0 	add	w0, w5, #0x5f
    d1a8:	1101c8a6 	add	w6, w5, #0x72
    d1ac:	12001c00 	and	w0, w0, #0xff
    d1b0:	12001cc6 	and	w6, w6, #0xff
    d1b4:	7101741f 	cmp	w0, #0x5d
    d1b8:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    d1bc:	54000109 	b.ls	d1dc <__eucjp_wctomb+0x4c>  // b.plast
    d1c0:	52801141 	mov	w1, #0x8a                  	// #138
    d1c4:	12800000 	mov	w0, #0xffffffff            	// #-1
    d1c8:	b9000081 	str	w1, [x4]
    d1cc:	d65f03c0 	ret
    d1d0:	52800020 	mov	w0, #0x1                   	// #1
    d1d4:	39000023 	strb	w3, [x1]
    d1d8:	d65f03c0 	ret
    d1dc:	11017c66 	add	w6, w3, #0x5f
    d1e0:	12001cc6 	and	w6, w6, #0xff
    d1e4:	710174df 	cmp	w6, #0x5d
    d1e8:	54000209 	b.ls	d228 <__eucjp_wctomb+0x98>  // b.plast
    d1ec:	7101741f 	cmp	w0, #0x5d
    d1f0:	54fffe88 	b.hi	d1c0 <__eucjp_wctomb+0x30>  // b.pmore
    d1f4:	32190063 	orr	w3, w3, #0x80
    d1f8:	11017c60 	add	w0, w3, #0x5f
    d1fc:	12001c00 	and	w0, w0, #0xff
    d200:	7101741f 	cmp	w0, #0x5d
    d204:	54fffde8 	b.hi	d1c0 <__eucjp_wctomb+0x30>  // b.pmore
    d208:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    d20c:	52800060 	mov	w0, #0x3                   	// #3
    d210:	39000022 	strb	w2, [x1]
    d214:	39000425 	strb	w5, [x1, #1]
    d218:	39000823 	strb	w3, [x1, #2]
    d21c:	d65f03c0 	ret
    d220:	52800000 	mov	w0, #0x0                   	// #0
    d224:	d65f03c0 	ret
    d228:	5ac00442 	rev16	w2, w2
    d22c:	52800040 	mov	w0, #0x2                   	// #2
    d230:	79000022 	strh	w2, [x1]
    d234:	d65f03c0 	ret
    d238:	d503201f 	nop
    d23c:	d503201f 	nop

000000000000d240 <__jis_wctomb>:
    d240:	aa0003e6 	mov	x6, x0
    d244:	12001c45 	and	w5, w2, #0xff
    d248:	d3483c44 	ubfx	x4, x2, #8, #8
    d24c:	b40004c1 	cbz	x1, d2e4 <__jis_wctomb+0xa4>
    d250:	34000304 	cbz	w4, d2b0 <__jis_wctomb+0x70>
    d254:	51008484 	sub	w4, w4, #0x21
    d258:	12001c84 	and	w4, w4, #0xff
    d25c:	7101749f 	cmp	w4, #0x5d
    d260:	54000468 	b.hi	d2ec <__jis_wctomb+0xac>  // b.pmore
    d264:	510084a5 	sub	w5, w5, #0x21
    d268:	12001ca5 	and	w5, w5, #0xff
    d26c:	710174bf 	cmp	w5, #0x5d
    d270:	540003e8 	b.hi	d2ec <__jis_wctomb+0xac>  // b.pmore
    d274:	b9400064 	ldr	w4, [x3]
    d278:	52800040 	mov	w0, #0x2                   	// #2
    d27c:	35000144 	cbnz	w4, d2a4 <__jis_wctomb+0x64>
    d280:	aa0103e4 	mov	x4, x1
    d284:	52800020 	mov	w0, #0x1                   	// #1
    d288:	b9000060 	str	w0, [x3]
    d28c:	52848365 	mov	w5, #0x241b                	// #9243
    d290:	52800843 	mov	w3, #0x42                  	// #66
    d294:	528000a0 	mov	w0, #0x5                   	// #5
    d298:	78003485 	strh	w5, [x4], #3
    d29c:	39000823 	strb	w3, [x1, #2]
    d2a0:	aa0403e1 	mov	x1, x4
    d2a4:	5ac00442 	rev16	w2, w2
    d2a8:	79000022 	strh	w2, [x1]
    d2ac:	d65f03c0 	ret
    d2b0:	b9400062 	ldr	w2, [x3]
    d2b4:	52800020 	mov	w0, #0x1                   	// #1
    d2b8:	34000122 	cbz	w2, d2dc <__jis_wctomb+0x9c>
    d2bc:	aa0103e2 	mov	x2, x1
    d2c0:	b900007f 	str	wzr, [x3]
    d2c4:	52850364 	mov	w4, #0x281b                	// #10267
    d2c8:	52800843 	mov	w3, #0x42                  	// #66
    d2cc:	52800080 	mov	w0, #0x4                   	// #4
    d2d0:	78003444 	strh	w4, [x2], #3
    d2d4:	39000823 	strb	w3, [x1, #2]
    d2d8:	aa0203e1 	mov	x1, x2
    d2dc:	39000025 	strb	w5, [x1]
    d2e0:	d65f03c0 	ret
    d2e4:	52800020 	mov	w0, #0x1                   	// #1
    d2e8:	d65f03c0 	ret
    d2ec:	52801141 	mov	w1, #0x8a                  	// #138
    d2f0:	12800000 	mov	w0, #0xffffffff            	// #-1
    d2f4:	b90000c1 	str	w1, [x6]
    d2f8:	d65f03c0 	ret
    d2fc:	d503201f 	nop

000000000000d300 <_write_r>:
    d300:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d304:	910003fd 	mov	x29, sp
    d308:	a90153f3 	stp	x19, x20, [sp, #16]
    d30c:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d310:	aa0003f3 	mov	x19, x0
    d314:	2a0103e0 	mov	w0, w1
    d318:	aa0203e1 	mov	x1, x2
    d31c:	b909929f 	str	wzr, [x20, #2448]
    d320:	aa0303e2 	mov	x2, x3
    d324:	97ffe1ab 	bl	59d0 <_write>
    d328:	93407c01 	sxtw	x1, w0
    d32c:	3100041f 	cmn	w0, #0x1
    d330:	540000a0 	b.eq	d344 <_write_r+0x44>  // b.none
    d334:	aa0103e0 	mov	x0, x1
    d338:	a94153f3 	ldp	x19, x20, [sp, #16]
    d33c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d340:	d65f03c0 	ret
    d344:	b9499280 	ldr	w0, [x20, #2448]
    d348:	34ffff60 	cbz	w0, d334 <_write_r+0x34>
    d34c:	b9000260 	str	w0, [x19]
    d350:	aa0103e0 	mov	x0, x1
    d354:	a94153f3 	ldp	x19, x20, [sp, #16]
    d358:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d35c:	d65f03c0 	ret

000000000000d360 <_close_r>:
    d360:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d364:	910003fd 	mov	x29, sp
    d368:	a90153f3 	stp	x19, x20, [sp, #16]
    d36c:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d370:	aa0003f3 	mov	x19, x0
    d374:	b909929f 	str	wzr, [x20, #2448]
    d378:	2a0103e0 	mov	w0, w1
    d37c:	97ffe199 	bl	59e0 <_close>
    d380:	3100041f 	cmn	w0, #0x1
    d384:	54000080 	b.eq	d394 <_close_r+0x34>  // b.none
    d388:	a94153f3 	ldp	x19, x20, [sp, #16]
    d38c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d390:	d65f03c0 	ret
    d394:	b9499281 	ldr	w1, [x20, #2448]
    d398:	34ffff81 	cbz	w1, d388 <_close_r+0x28>
    d39c:	b9000261 	str	w1, [x19]
    d3a0:	a94153f3 	ldp	x19, x20, [sp, #16]
    d3a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d3a8:	d65f03c0 	ret
    d3ac:	d503201f 	nop

000000000000d3b0 <__set_ctype>:
    d3b0:	b0000001 	adrp	x1, e000 <__func__.0+0x280>
    d3b4:	91242021 	add	x1, x1, #0x908
    d3b8:	f9007c01 	str	x1, [x0, #248]
    d3bc:	d65f03c0 	ret

000000000000d3c0 <__errno>:
    d3c0:	d0000000 	adrp	x0, f000 <IpcFsServer+0x5d8>
    d3c4:	f9411800 	ldr	x0, [x0, #560]
    d3c8:	d65f03c0 	ret
    d3cc:	d503201f 	nop

000000000000d3d0 <_fclose_r.part.0>:
    d3d0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    d3d4:	910003fd 	mov	x29, sp
    d3d8:	a90153f3 	stp	x19, x20, [sp, #16]
    d3dc:	aa0103f3 	mov	x19, x1
    d3e0:	f90013f5 	str	x21, [sp, #32]
    d3e4:	aa0003f5 	mov	x21, x0
    d3e8:	97ffecc2 	bl	86f0 <__sflush_r>
    d3ec:	2a0003f4 	mov	w20, w0
    d3f0:	f9402a62 	ldr	x2, [x19, #80]
    d3f4:	b40000c2 	cbz	x2, d40c <_fclose_r.part.0+0x3c>
    d3f8:	f9401a61 	ldr	x1, [x19, #48]
    d3fc:	aa1503e0 	mov	x0, x21
    d400:	d63f0040 	blr	x2
    d404:	7100001f 	cmp	w0, #0x0
    d408:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    d40c:	79402260 	ldrh	w0, [x19, #16]
    d410:	373802c0 	tbnz	w0, #7, d468 <_fclose_r.part.0+0x98>
    d414:	f9402e61 	ldr	x1, [x19, #88]
    d418:	b40000e1 	cbz	x1, d434 <_fclose_r.part.0+0x64>
    d41c:	9101d260 	add	x0, x19, #0x74
    d420:	eb00003f 	cmp	x1, x0
    d424:	54000060 	b.eq	d430 <_fclose_r.part.0+0x60>  // b.none
    d428:	aa1503e0 	mov	x0, x21
    d42c:	97ffef15 	bl	9080 <_free_r>
    d430:	f9002e7f 	str	xzr, [x19, #88]
    d434:	f9403e61 	ldr	x1, [x19, #120]
    d438:	b4000081 	cbz	x1, d448 <_fclose_r.part.0+0x78>
    d43c:	aa1503e0 	mov	x0, x21
    d440:	97ffef10 	bl	9080 <_free_r>
    d444:	f9003e7f 	str	xzr, [x19, #120]
    d448:	97ffee3a 	bl	8d30 <__sfp_lock_acquire>
    d44c:	7900227f 	strh	wzr, [x19, #16]
    d450:	97ffee3c 	bl	8d40 <__sfp_lock_release>
    d454:	2a1403e0 	mov	w0, w20
    d458:	a94153f3 	ldp	x19, x20, [sp, #16]
    d45c:	f94013f5 	ldr	x21, [sp, #32]
    d460:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d464:	d65f03c0 	ret
    d468:	f9400e61 	ldr	x1, [x19, #24]
    d46c:	aa1503e0 	mov	x0, x21
    d470:	97ffef04 	bl	9080 <_free_r>
    d474:	17ffffe8 	b	d414 <_fclose_r.part.0+0x44>
    d478:	d503201f 	nop
    d47c:	d503201f 	nop

000000000000d480 <_fclose_r>:
    d480:	b4000301 	cbz	x1, d4e0 <_fclose_r+0x60>
    d484:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    d488:	910003fd 	mov	x29, sp
    d48c:	f9000bf4 	str	x20, [sp, #16]
    d490:	aa0003f4 	mov	x20, x0
    d494:	b4000060 	cbz	x0, d4a0 <_fclose_r+0x20>
    d498:	b9405002 	ldr	w2, [x0, #80]
    d49c:	34000162 	cbz	w2, d4c8 <_fclose_r+0x48>
    d4a0:	79c02020 	ldrsh	w0, [x1, #16]
    d4a4:	350000a0 	cbnz	w0, d4b8 <_fclose_r+0x38>
    d4a8:	52800000 	mov	w0, #0x0                   	// #0
    d4ac:	f9400bf4 	ldr	x20, [sp, #16]
    d4b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d4b4:	d65f03c0 	ret
    d4b8:	aa1403e0 	mov	x0, x20
    d4bc:	f9400bf4 	ldr	x20, [sp, #16]
    d4c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d4c4:	17ffffc3 	b	d3d0 <_fclose_r.part.0>
    d4c8:	f90017e1 	str	x1, [sp, #40]
    d4cc:	97ffee15 	bl	8d20 <__sinit>
    d4d0:	f94017e1 	ldr	x1, [sp, #40]
    d4d4:	79c02020 	ldrsh	w0, [x1, #16]
    d4d8:	34fffe80 	cbz	w0, d4a8 <_fclose_r+0x28>
    d4dc:	17fffff7 	b	d4b8 <_fclose_r+0x38>
    d4e0:	52800000 	mov	w0, #0x0                   	// #0
    d4e4:	d65f03c0 	ret
    d4e8:	d503201f 	nop
    d4ec:	d503201f 	nop

000000000000d4f0 <fclose>:
    d4f0:	b4000340 	cbz	x0, d558 <fclose+0x68>
    d4f4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d4f8:	910003fd 	mov	x29, sp
    d4fc:	a90153f3 	stp	x19, x20, [sp, #16]
    d500:	aa0003f3 	mov	x19, x0
    d504:	d0000000 	adrp	x0, f000 <IpcFsServer+0x5d8>
    d508:	f9411814 	ldr	x20, [x0, #560]
    d50c:	b4000074 	cbz	x20, d518 <fclose+0x28>
    d510:	b9405280 	ldr	w0, [x20, #80]
    d514:	34000180 	cbz	w0, d544 <fclose+0x54>
    d518:	79c02260 	ldrsh	w0, [x19, #16]
    d51c:	350000a0 	cbnz	w0, d530 <fclose+0x40>
    d520:	52800000 	mov	w0, #0x0                   	// #0
    d524:	a94153f3 	ldp	x19, x20, [sp, #16]
    d528:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d52c:	d65f03c0 	ret
    d530:	aa1303e1 	mov	x1, x19
    d534:	aa1403e0 	mov	x0, x20
    d538:	a94153f3 	ldp	x19, x20, [sp, #16]
    d53c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d540:	17ffffa4 	b	d3d0 <_fclose_r.part.0>
    d544:	aa1403e0 	mov	x0, x20
    d548:	97ffedf6 	bl	8d20 <__sinit>
    d54c:	79c02260 	ldrsh	w0, [x19, #16]
    d550:	34fffe80 	cbz	w0, d520 <fclose+0x30>
    d554:	17fffff7 	b	d530 <fclose+0x40>
    d558:	52800000 	mov	w0, #0x0                   	// #0
    d55c:	d65f03c0 	ret

000000000000d560 <_fstat_r>:
    d560:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d564:	910003fd 	mov	x29, sp
    d568:	a90153f3 	stp	x19, x20, [sp, #16]
    d56c:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d570:	aa0003f3 	mov	x19, x0
    d574:	b909929f 	str	wzr, [x20, #2448]
    d578:	2a0103e0 	mov	w0, w1
    d57c:	aa0203e1 	mov	x1, x2
    d580:	97ffe11c 	bl	59f0 <_fstat>
    d584:	3100041f 	cmn	w0, #0x1
    d588:	54000080 	b.eq	d598 <_fstat_r+0x38>  // b.none
    d58c:	a94153f3 	ldp	x19, x20, [sp, #16]
    d590:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d594:	d65f03c0 	ret
    d598:	b9499281 	ldr	w1, [x20, #2448]
    d59c:	34ffff81 	cbz	w1, d58c <_fstat_r+0x2c>
    d5a0:	b9000261 	str	w1, [x19]
    d5a4:	a94153f3 	ldp	x19, x20, [sp, #16]
    d5a8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d5ac:	d65f03c0 	ret

000000000000d5b0 <_findenv_r>:
    d5b0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    d5b4:	910003fd 	mov	x29, sp
    d5b8:	a90363f7 	stp	x23, x24, [sp, #48]
    d5bc:	f0000017 	adrp	x23, 10000 <__malloc_av_+0x4b8>
    d5c0:	aa0103f8 	mov	x24, x1
    d5c4:	a90153f3 	stp	x19, x20, [sp, #16]
    d5c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    d5cc:	aa0203f5 	mov	x21, x2
    d5d0:	aa0003f6 	mov	x22, x0
    d5d4:	940000e7 	bl	d970 <__env_lock>
    d5d8:	f941b6f4 	ldr	x20, [x23, #872]
    d5dc:	b40003f4 	cbz	x20, d658 <_findenv_r+0xa8>
    d5e0:	39400303 	ldrb	w3, [x24]
    d5e4:	aa1803f3 	mov	x19, x24
    d5e8:	7100f47f 	cmp	w3, #0x3d
    d5ec:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    d5f0:	540000c0 	b.eq	d608 <_findenv_r+0x58>  // b.none
    d5f4:	d503201f 	nop
    d5f8:	38401e63 	ldrb	w3, [x19, #1]!
    d5fc:	7100f47f 	cmp	w3, #0x3d
    d600:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    d604:	54ffffa1 	b.ne	d5f8 <_findenv_r+0x48>  // b.any
    d608:	7100f47f 	cmp	w3, #0x3d
    d60c:	54000260 	b.eq	d658 <_findenv_r+0xa8>  // b.none
    d610:	f9400280 	ldr	x0, [x20]
    d614:	cb180273 	sub	x19, x19, x24
    d618:	b4000200 	cbz	x0, d658 <_findenv_r+0xa8>
    d61c:	93407e73 	sxtw	x19, w19
    d620:	f90023f9 	str	x25, [sp, #64]
    d624:	d503201f 	nop
    d628:	aa1303e2 	mov	x2, x19
    d62c:	aa1803e1 	mov	x1, x24
    d630:	97ffe35b 	bl	639c <strncmp>
    d634:	350000c0 	cbnz	w0, d64c <_findenv_r+0x9c>
    d638:	f9400280 	ldr	x0, [x20]
    d63c:	8b130019 	add	x25, x0, x19
    d640:	38736800 	ldrb	w0, [x0, x19]
    d644:	7100f41f 	cmp	w0, #0x3d
    d648:	54000180 	b.eq	d678 <_findenv_r+0xc8>  // b.none
    d64c:	f8408e80 	ldr	x0, [x20, #8]!
    d650:	b5fffec0 	cbnz	x0, d628 <_findenv_r+0x78>
    d654:	f94023f9 	ldr	x25, [sp, #64]
    d658:	aa1603e0 	mov	x0, x22
    d65c:	940000c9 	bl	d980 <__env_unlock>
    d660:	d2800000 	mov	x0, #0x0                   	// #0
    d664:	a94153f3 	ldp	x19, x20, [sp, #16]
    d668:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d66c:	a94363f7 	ldp	x23, x24, [sp, #48]
    d670:	a8c57bfd 	ldp	x29, x30, [sp], #80
    d674:	d65f03c0 	ret
    d678:	f941b6e1 	ldr	x1, [x23, #872]
    d67c:	aa1603e0 	mov	x0, x22
    d680:	cb010281 	sub	x1, x20, x1
    d684:	9343fc21 	asr	x1, x1, #3
    d688:	b90002a1 	str	w1, [x21]
    d68c:	940000bd 	bl	d980 <__env_unlock>
    d690:	91000720 	add	x0, x25, #0x1
    d694:	a94153f3 	ldp	x19, x20, [sp, #16]
    d698:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d69c:	a94363f7 	ldp	x23, x24, [sp, #48]
    d6a0:	f94023f9 	ldr	x25, [sp, #64]
    d6a4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    d6a8:	d65f03c0 	ret
    d6ac:	d503201f 	nop

000000000000d6b0 <_getenv_r>:
    d6b0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d6b4:	910003fd 	mov	x29, sp
    d6b8:	910073e2 	add	x2, sp, #0x1c
    d6bc:	97ffffbd 	bl	d5b0 <_findenv_r>
    d6c0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d6c4:	d65f03c0 	ret
    d6c8:	d503201f 	nop
    d6cc:	d503201f 	nop

000000000000d6d0 <_isatty_r>:
    d6d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d6d4:	910003fd 	mov	x29, sp
    d6d8:	a90153f3 	stp	x19, x20, [sp, #16]
    d6dc:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d6e0:	aa0003f3 	mov	x19, x0
    d6e4:	b909929f 	str	wzr, [x20, #2448]
    d6e8:	2a0103e0 	mov	w0, w1
    d6ec:	97ffe0c5 	bl	5a00 <_isatty>
    d6f0:	3100041f 	cmn	w0, #0x1
    d6f4:	54000080 	b.eq	d704 <_isatty_r+0x34>  // b.none
    d6f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    d6fc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d700:	d65f03c0 	ret
    d704:	b9499281 	ldr	w1, [x20, #2448]
    d708:	34ffff81 	cbz	w1, d6f8 <_isatty_r+0x28>
    d70c:	b9000261 	str	w1, [x19]
    d710:	a94153f3 	ldp	x19, x20, [sp, #16]
    d714:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d718:	d65f03c0 	ret
    d71c:	d503201f 	nop

000000000000d720 <_lseek_r>:
    d720:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d724:	910003fd 	mov	x29, sp
    d728:	a90153f3 	stp	x19, x20, [sp, #16]
    d72c:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d730:	aa0003f3 	mov	x19, x0
    d734:	b909929f 	str	wzr, [x20, #2448]
    d738:	2a0103e0 	mov	w0, w1
    d73c:	aa0203e1 	mov	x1, x2
    d740:	2a0303e2 	mov	w2, w3
    d744:	97ffe0b3 	bl	5a10 <_lseek>
    d748:	b100041f 	cmn	x0, #0x1
    d74c:	54000080 	b.eq	d75c <_lseek_r+0x3c>  // b.none
    d750:	a94153f3 	ldp	x19, x20, [sp, #16]
    d754:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d758:	d65f03c0 	ret
    d75c:	b9499281 	ldr	w1, [x20, #2448]
    d760:	34ffff81 	cbz	w1, d750 <_lseek_r+0x30>
    d764:	b9000261 	str	w1, [x19]
    d768:	a94153f3 	ldp	x19, x20, [sp, #16]
    d76c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d770:	d65f03c0 	ret
    d774:	d503201f 	nop
    d778:	d503201f 	nop
    d77c:	d503201f 	nop

000000000000d780 <_read_r>:
    d780:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    d784:	910003fd 	mov	x29, sp
    d788:	a90153f3 	stp	x19, x20, [sp, #16]
    d78c:	f00004d4 	adrp	x20, a8000 <_stack+0x28000>
    d790:	aa0003f3 	mov	x19, x0
    d794:	2a0103e0 	mov	w0, w1
    d798:	aa0203e1 	mov	x1, x2
    d79c:	b909929f 	str	wzr, [x20, #2448]
    d7a0:	aa0303e2 	mov	x2, x3
    d7a4:	97ffe09f 	bl	5a20 <_read>
    d7a8:	93407c01 	sxtw	x1, w0
    d7ac:	3100041f 	cmn	w0, #0x1
    d7b0:	540000a0 	b.eq	d7c4 <_read_r+0x44>  // b.none
    d7b4:	aa0103e0 	mov	x0, x1
    d7b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    d7bc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d7c0:	d65f03c0 	ret
    d7c4:	b9499280 	ldr	w0, [x20, #2448]
    d7c8:	34ffff60 	cbz	w0, d7b4 <_read_r+0x34>
    d7cc:	b9000260 	str	w0, [x19]
    d7d0:	aa0103e0 	mov	x0, x1
    d7d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    d7d8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    d7dc:	d65f03c0 	ret

000000000000d7e0 <cleanup_glue>:
    d7e0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    d7e4:	910003fd 	mov	x29, sp
    d7e8:	a9025bf5 	stp	x21, x22, [sp, #32]
    d7ec:	f9400035 	ldr	x21, [x1]
    d7f0:	a90153f3 	stp	x19, x20, [sp, #16]
    d7f4:	aa0103f3 	mov	x19, x1
    d7f8:	aa0003f4 	mov	x20, x0
    d7fc:	b4000275 	cbz	x21, d848 <cleanup_glue+0x68>
    d800:	f94002b6 	ldr	x22, [x21]
    d804:	b40001d6 	cbz	x22, d83c <cleanup_glue+0x5c>
    d808:	f9001bf7 	str	x23, [sp, #48]
    d80c:	f94002d7 	ldr	x23, [x22]
    d810:	b40000f7 	cbz	x23, d82c <cleanup_glue+0x4c>
    d814:	f94002e1 	ldr	x1, [x23]
    d818:	b4000041 	cbz	x1, d820 <cleanup_glue+0x40>
    d81c:	97fffff1 	bl	d7e0 <cleanup_glue>
    d820:	aa1703e1 	mov	x1, x23
    d824:	aa1403e0 	mov	x0, x20
    d828:	97ffee16 	bl	9080 <_free_r>
    d82c:	aa1603e1 	mov	x1, x22
    d830:	aa1403e0 	mov	x0, x20
    d834:	97ffee13 	bl	9080 <_free_r>
    d838:	f9401bf7 	ldr	x23, [sp, #48]
    d83c:	aa1503e1 	mov	x1, x21
    d840:	aa1403e0 	mov	x0, x20
    d844:	97ffee0f 	bl	9080 <_free_r>
    d848:	aa1303e1 	mov	x1, x19
    d84c:	aa1403e0 	mov	x0, x20
    d850:	a94153f3 	ldp	x19, x20, [sp, #16]
    d854:	a9425bf5 	ldp	x21, x22, [sp, #32]
    d858:	a8c47bfd 	ldp	x29, x30, [sp], #64
    d85c:	17ffee09 	b	9080 <_free_r>

000000000000d860 <_reclaim_reent>:
    d860:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    d864:	d0000001 	adrp	x1, f000 <IpcFsServer+0x5d8>
    d868:	910003fd 	mov	x29, sp
    d86c:	a90153f3 	stp	x19, x20, [sp, #16]
    d870:	aa0003f4 	mov	x20, x0
    d874:	f9411820 	ldr	x0, [x1, #560]
    d878:	eb14001f 	cmp	x0, x20
    d87c:	54000500 	b.eq	d91c <_reclaim_reent+0xbc>  // b.none
    d880:	f9403e81 	ldr	x1, [x20, #120]
    d884:	f90013f5 	str	x21, [sp, #32]
    d888:	b40001e1 	cbz	x1, d8c4 <_reclaim_reent+0x64>
    d88c:	d2800015 	mov	x21, #0x0                   	// #0
    d890:	f8756833 	ldr	x19, [x1, x21]
    d894:	b40000f3 	cbz	x19, d8b0 <_reclaim_reent+0x50>
    d898:	aa1303e1 	mov	x1, x19
    d89c:	aa1403e0 	mov	x0, x20
    d8a0:	f9400273 	ldr	x19, [x19]
    d8a4:	97ffedf7 	bl	9080 <_free_r>
    d8a8:	b5ffff93 	cbnz	x19, d898 <_reclaim_reent+0x38>
    d8ac:	f9403e81 	ldr	x1, [x20, #120]
    d8b0:	910022b5 	add	x21, x21, #0x8
    d8b4:	f10802bf 	cmp	x21, #0x200
    d8b8:	54fffec1 	b.ne	d890 <_reclaim_reent+0x30>  // b.any
    d8bc:	aa1403e0 	mov	x0, x20
    d8c0:	97ffedf0 	bl	9080 <_free_r>
    d8c4:	f9403281 	ldr	x1, [x20, #96]
    d8c8:	b4000061 	cbz	x1, d8d4 <_reclaim_reent+0x74>
    d8cc:	aa1403e0 	mov	x0, x20
    d8d0:	97ffedec 	bl	9080 <_free_r>
    d8d4:	f940fe93 	ldr	x19, [x20, #504]
    d8d8:	b4000153 	cbz	x19, d900 <_reclaim_reent+0xa0>
    d8dc:	91080295 	add	x21, x20, #0x200
    d8e0:	eb15027f 	cmp	x19, x21
    d8e4:	540000e0 	b.eq	d900 <_reclaim_reent+0xa0>  // b.none
    d8e8:	aa1303e1 	mov	x1, x19
    d8ec:	aa1403e0 	mov	x0, x20
    d8f0:	f9400273 	ldr	x19, [x19]
    d8f4:	97ffede3 	bl	9080 <_free_r>
    d8f8:	eb1302bf 	cmp	x21, x19
    d8fc:	54ffff61 	b.ne	d8e8 <_reclaim_reent+0x88>  // b.any
    d900:	f9404681 	ldr	x1, [x20, #136]
    d904:	b4000061 	cbz	x1, d910 <_reclaim_reent+0xb0>
    d908:	aa1403e0 	mov	x0, x20
    d90c:	97ffeddd 	bl	9080 <_free_r>
    d910:	b9405280 	ldr	w0, [x20, #80]
    d914:	350000a0 	cbnz	w0, d928 <_reclaim_reent+0xc8>
    d918:	f94013f5 	ldr	x21, [sp, #32]
    d91c:	a94153f3 	ldp	x19, x20, [sp, #16]
    d920:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d924:	d65f03c0 	ret
    d928:	f9402e81 	ldr	x1, [x20, #88]
    d92c:	aa1403e0 	mov	x0, x20
    d930:	d63f0020 	blr	x1
    d934:	f9429293 	ldr	x19, [x20, #1312]
    d938:	b4ffff13 	cbz	x19, d918 <_reclaim_reent+0xb8>
    d93c:	f9400261 	ldr	x1, [x19]
    d940:	b4000061 	cbz	x1, d94c <_reclaim_reent+0xec>
    d944:	aa1403e0 	mov	x0, x20
    d948:	97ffffa6 	bl	d7e0 <cleanup_glue>
    d94c:	aa1303e1 	mov	x1, x19
    d950:	aa1403e0 	mov	x0, x20
    d954:	a94153f3 	ldp	x19, x20, [sp, #16]
    d958:	f94013f5 	ldr	x21, [sp, #32]
    d95c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    d960:	17ffedc8 	b	9080 <_free_r>
    d964:	d503201f 	nop
    d968:	d503201f 	nop
    d96c:	d503201f 	nop

000000000000d970 <__env_lock>:
    d970:	d65f03c0 	ret
    d974:	d503201f 	nop
    d978:	d503201f 	nop
    d97c:	d503201f 	nop

000000000000d980 <__env_unlock>:
    d980:	d65f03c0 	ret

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

000000000000d984 <_fini>:
    d984:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    d988:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    d98c:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    d990:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    d994:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    d998:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    d99c:	a8c153f3 	ldp	x19, x20, [sp], #16
    d9a0:	a8c15bf5 	ldp	x21, x22, [sp], #16
    d9a4:	a8c163f7 	ldp	x23, x24, [sp], #16
    d9a8:	a8c16bf9 	ldp	x25, x26, [sp], #16
    d9ac:	a8c173fb 	ldp	x27, x28, [sp], #16
    d9b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    d9b4:	d65f03c0 	ret
