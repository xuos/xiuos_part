
init:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <main>:
#include "libfs.h"
#include "libserial.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
       0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    struct Session session;
    printf("init: connecting MemFS\n");
       4:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
       8:	91342000 	add	x0, x0, #0xd08
{
       c:	910003fd 	mov	x29, sp
      10:	f9000bf3 	str	x19, [sp, #16]
      14:	f0000053 	adrp	x19, b000 <_wcsnrtombs_l+0x130>
      18:	91348273 	add	x19, x19, #0xd20
    printf("init: connecting MemFS\n");
      1c:	94000b99 	bl	2e80 <printf>
    while (connect_session(&session, "MemFS", 8092) < 0) {
      20:	14000003 	b	2c <main+0x2c>
        yield(SYS_TASK_YIELD_NO_REASON);
      24:	52800000 	mov	w0, #0x0                   	// #0
      28:	94000c9a 	bl	3290 <yield>
    while (connect_session(&session, "MemFS", 8092) < 0) {
      2c:	aa1303e1 	mov	x1, x19
      30:	9100e3e0 	add	x0, sp, #0x38
      34:	5283f382 	mov	w2, #0x1f9c                	// #8092
      38:	940004a6 	bl	12d0 <connect_session>
      3c:	37ffff40 	tbnz	w0, #31, 24 <main+0x24>
    }
    printf("init: connect MemFS success\n");
      40:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
      44:	9134a000 	add	x0, x0, #0xd28
      48:	94000b8e 	bl	2e80 <printf>

    int fd;
    char* shell_task_param[2] = { "/shell", 0 };
    if ((fd = open(&session, shell_task_param[0])) < 0) {
      4c:	9100e3e0 	add	x0, sp, #0x38
    char* shell_task_param[2] = { "/shell", 0 };
      50:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
      54:	91352021 	add	x1, x1, #0xd48
      58:	a902ffe1 	stp	x1, xzr, [sp, #40]
    if ((fd = open(&session, shell_task_param[0])) < 0) {
      5c:	940001bd 	bl	750 <open>
      60:	2a0003f3 	mov	w19, w0
      64:	37f80280 	tbnz	w0, #31, b4 <main+0xb4>
        printf("Open %s failed\n", shell_task_param[0]);
        exit(1);
    }

    if (spawn(&session, fd, read, fsize, shell_task_param[0], shell_task_param) < 0) {
      68:	f94017e4 	ldr	x4, [sp, #40]
      6c:	90000003 	adrp	x3, 0 <main>
      70:	90000002 	adrp	x2, 0 <main>
      74:	91304063 	add	x3, x3, #0xc10
      78:	9124c042 	add	x2, x2, #0x930
      7c:	9100a3e5 	add	x5, sp, #0x28
      80:	2a1303e1 	mov	w1, w19
      84:	9100e3e0 	add	x0, sp, #0x38
      88:	94000c3e 	bl	3180 <spawn>
      8c:	37f80220 	tbnz	w0, #31, d0 <main+0xd0>
        printf("Syscall Spawn shell failed\n");
    }

    close(&session, fd);
      90:	2a1303e1 	mov	w1, w19
      94:	9100e3e0 	add	x0, sp, #0x38
      98:	940001ee 	bl	850 <close>

    exit(0);
      9c:	52800000 	mov	w0, #0x0                   	// #0
      a0:	94000c74 	bl	3270 <exit>
    return 0;
}
      a4:	52800000 	mov	w0, #0x0                   	// #0
      a8:	f9400bf3 	ldr	x19, [sp, #16]
      ac:	a8c57bfd 	ldp	x29, x30, [sp], #80
      b0:	d65f03c0 	ret
        printf("Open %s failed\n", shell_task_param[0]);
      b4:	f94017e1 	ldr	x1, [sp, #40]
      b8:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
      bc:	91354000 	add	x0, x0, #0xd50
      c0:	94000b70 	bl	2e80 <printf>
        exit(1);
      c4:	52800020 	mov	w0, #0x1                   	// #1
      c8:	94000c6a 	bl	3270 <exit>
      cc:	17ffffe7 	b	68 <main+0x68>
        printf("Syscall Spawn shell failed\n");
      d0:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
      d4:	91358000 	add	x0, x0, #0xd60
      d8:	94000b6a 	bl	2e80 <printf>
      dc:	17ffffed 	b	90 <main+0x90>

00000000000000e0 <deregister_tm_clones>:
      e0:	b0000060 	adrp	x0, d000 <__global_locale+0x20>
      e4:	9126c000 	add	x0, x0, #0x9b0
      e8:	b0000061 	adrp	x1, d000 <__global_locale+0x20>
      ec:	9126c021 	add	x1, x1, #0x9b0
      f0:	eb00003f 	cmp	x1, x0
      f4:	540000c0 	b.eq	10c <deregister_tm_clones+0x2c>  // b.none
      f8:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
      fc:	f9467421 	ldr	x1, [x1, #3304]
     100:	b4000061 	cbz	x1, 10c <deregister_tm_clones+0x2c>
     104:	aa0103f0 	mov	x16, x1
     108:	d61f0200 	br	x16
     10c:	d65f03c0 	ret

0000000000000110 <register_tm_clones>:
     110:	b0000060 	adrp	x0, d000 <__global_locale+0x20>
     114:	9126c000 	add	x0, x0, #0x9b0
     118:	b0000061 	adrp	x1, d000 <__global_locale+0x20>
     11c:	9126c021 	add	x1, x1, #0x9b0
     120:	cb000021 	sub	x1, x1, x0
     124:	d37ffc22 	lsr	x2, x1, #63
     128:	8b810c41 	add	x1, x2, x1, asr #3
     12c:	9341fc21 	asr	x1, x1, #1
     130:	b40000c1 	cbz	x1, 148 <register_tm_clones+0x38>
     134:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     138:	f9467842 	ldr	x2, [x2, #3312]
     13c:	b4000062 	cbz	x2, 148 <register_tm_clones+0x38>
     140:	aa0203f0 	mov	x16, x2
     144:	d61f0200 	br	x16
     148:	d65f03c0 	ret
     14c:	d503201f 	nop

0000000000000150 <__do_global_dtors_aux>:
     150:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     154:	910003fd 	mov	x29, sp
     158:	f9000bf3 	str	x19, [sp, #16]
     15c:	b0000073 	adrp	x19, d000 <__global_locale+0x20>
     160:	3966c260 	ldrb	w0, [x19, #2480]
     164:	35000140 	cbnz	w0, 18c <__do_global_dtors_aux+0x3c>
     168:	97ffffde 	bl	e0 <deregister_tm_clones>
     16c:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     170:	f9467c00 	ldr	x0, [x0, #3320]
     174:	b4000080 	cbz	x0, 184 <__do_global_dtors_aux+0x34>
     178:	90000060 	adrp	x0, c000 <__func__.0+0x28>
     17c:	91213000 	add	x0, x0, #0x84c
     180:	d503201f 	nop
     184:	52800020 	mov	w0, #0x1                   	// #1
     188:	3926c260 	strb	w0, [x19, #2480]
     18c:	f9400bf3 	ldr	x19, [sp, #16]
     190:	a8c27bfd 	ldp	x29, x30, [sp], #32
     194:	d65f03c0 	ret
     198:	d503201f 	nop
     19c:	d503201f 	nop

00000000000001a0 <frame_dummy>:
     1a0:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     1a4:	f9468000 	ldr	x0, [x0, #3328]
     1a8:	b4000140 	cbz	x0, 1d0 <frame_dummy+0x30>
     1ac:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     1b0:	b0000061 	adrp	x1, d000 <__global_locale+0x20>
     1b4:	90000060 	adrp	x0, c000 <__func__.0+0x28>
     1b8:	910003fd 	mov	x29, sp
     1bc:	9126e021 	add	x1, x1, #0x9b8
     1c0:	91213000 	add	x0, x0, #0x84c
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
     204:	9400100f 	bl	4240 <memset>
     208:	580001c0 	ldr	x0, 240 <_cpu_init_hook+0x1c>
     20c:	94000ef9 	bl	3df0 <atexit>
     210:	94000f54 	bl	3f60 <__libc_init_array>
     214:	d2800000 	mov	x0, #0x0                   	// #0
     218:	d2800001 	mov	x1, #0x0                   	// #0
     21c:	97ffff79 	bl	0 <main>
     220:	14000c14 	b	3270 <exit>

0000000000000224 <_cpu_init_hook>:
     224:	d65f03c0 	ret
	...
     230:	0000d9b0 	.word	0x0000d9b0
     234:	00000000 	.word	0x00000000
     238:	0000ddc8 	.word	0x0000ddc8
     23c:	00000000 	.word	0x00000000
     240:	00003e10 	.word	0x00003e10
     244:	00000000 	.word	0x00000000
     248:	d503201f 	.word	0xd503201f
     24c:	d503201f 	.word	0xd503201f

0000000000000250 <ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
     250:	b40006c0 	cbz	x0, 328 <ls+0xd8>
int ls(struct Session* session, char* path)
{
     254:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     258:	910003fd 	mov	x29, sp
     25c:	a90153f3 	stp	x19, x20, [sp, #16]
     260:	aa0103f4 	mov	x20, x1
     264:	f90013f5 	str	x21, [sp, #32]
     268:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
     26c:	aa0103e0 	mov	x0, x1
     270:	94001074 	bl	4440 <strlen>
     274:	11000403 	add	w3, w0, #0x1
     278:	9100e3e2 	add	x2, sp, #0x38
     27c:	52800021 	mov	w1, #0x1                   	// #1
     280:	aa1503e0 	mov	x0, x21
     284:	b9003be3 	str	w3, [sp, #56]
     288:	9400029a 	bl	cf0 <new_ipc_msg>
     28c:	aa0003f3 	mov	x19, x0
     290:	aa1403e0 	mov	x0, x20
     294:	9400106b 	bl	4440 <strlen>
     298:	aa1403e2 	mov	x2, x20
     29c:	11000403 	add	w3, w0, #0x1
     2a0:	52800001 	mov	w1, #0x0                   	// #0
     2a4:	aa1303e0 	mov	x0, x19
     2a8:	940002d2 	bl	df0 <ipc_msg_set_nth_arg>
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
        return false;
    }
    msg->header.opcode = opcode;
     2ac:	52800020 	mov	w0, #0x1                   	// #1
     2b0:	39000660 	strb	w0, [x19, #1]
     2b4:	aa1303e0 	mov	x0, x19
     2b8:	9400033e 	bl	fb0 <ipc_msg_send_wait>
     2bc:	aa1403e0 	mov	x0, x20
     2c0:	94001060 	bl	4440 <strlen>
     2c4:	aa1403e2 	mov	x2, x20
     2c8:	11000403 	add	w3, w0, #0x1
     2cc:	52800001 	mov	w1, #0x0                   	// #0
     2d0:	aa1303e0 	mov	x0, x19
     2d4:	940002ff 	bl	ed0 <ipc_msg_get_nth_arg>
     2d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     2dc:	39400260 	ldrb	w0, [x19]
     2e0:	36080280 	tbz	w0, #1, 330 <ls+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     2e4:	91002261 	add	x1, x19, #0x8
     2e8:	d2800082 	mov	x2, #0x4                   	// #4
     2ec:	9100e3e0 	add	x0, sp, #0x38
     2f0:	94000f44 	bl	4000 <memcpy>
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     2f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     2f8:	f9400aa1 	ldr	x1, [x21, #16]
     2fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     300:	38606820 	ldrb	w0, [x1, x0]
     304:	36100080 	tbz	w0, #2, 314 <ls+0xc4>
        return false;
    }
    return session_free_buf(session, msg->header.len);
     308:	79400441 	ldrh	w1, [x2, #2]
     30c:	aa1503e0 	mov	x0, x21
     310:	94000434 	bl	13e0 <session_free_buf>
     314:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_ls)(session, path);
}
     318:	a94153f3 	ldp	x19, x20, [sp, #16]
     31c:	f94013f5 	ldr	x21, [sp, #32]
     320:	a8c47bfd 	ldp	x29, x30, [sp], #64
     324:	d65f03c0 	ret
IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
     328:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     32c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     330:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     334:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     338:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     33c:	91360063 	add	x3, x3, #0xd80
     340:	9137a042 	add	x2, x2, #0xde8
     344:	91366000 	add	x0, x0, #0xd98
     348:	52800fc1 	mov	w1, #0x7e                  	// #126
     34c:	94000e89 	bl	3d70 <__assert_func>

0000000000000350 <cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
     350:	b40006c0 	cbz	x0, 428 <cd+0xd8>
int cd(struct Session* session, char* path)
{
     354:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     358:	910003fd 	mov	x29, sp
     35c:	a90153f3 	stp	x19, x20, [sp, #16]
     360:	aa0103f4 	mov	x20, x1
     364:	f90013f5 	str	x21, [sp, #32]
     368:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
     36c:	aa0103e0 	mov	x0, x1
     370:	94001034 	bl	4440 <strlen>
     374:	11000403 	add	w3, w0, #0x1
     378:	9100e3e2 	add	x2, sp, #0x38
     37c:	52800021 	mov	w1, #0x1                   	// #1
     380:	aa1503e0 	mov	x0, x21
     384:	b9003be3 	str	w3, [sp, #56]
     388:	9400025a 	bl	cf0 <new_ipc_msg>
     38c:	aa0003f3 	mov	x19, x0
     390:	aa1403e0 	mov	x0, x20
     394:	9400102b 	bl	4440 <strlen>
     398:	aa1403e2 	mov	x2, x20
     39c:	11000403 	add	w3, w0, #0x1
     3a0:	52800001 	mov	w1, #0x0                   	// #0
     3a4:	aa1303e0 	mov	x0, x19
     3a8:	94000292 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     3ac:	52800040 	mov	w0, #0x2                   	// #2
     3b0:	39000660 	strb	w0, [x19, #1]
     3b4:	aa1303e0 	mov	x0, x19
     3b8:	940002fe 	bl	fb0 <ipc_msg_send_wait>
     3bc:	aa1403e0 	mov	x0, x20
     3c0:	94001020 	bl	4440 <strlen>
     3c4:	aa1403e2 	mov	x2, x20
     3c8:	11000403 	add	w3, w0, #0x1
     3cc:	52800001 	mov	w1, #0x0                   	// #0
     3d0:	aa1303e0 	mov	x0, x19
     3d4:	940002bf 	bl	ed0 <ipc_msg_get_nth_arg>
     3d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     3dc:	39400260 	ldrb	w0, [x19]
     3e0:	36080280 	tbz	w0, #1, 430 <cd+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     3e4:	91002261 	add	x1, x19, #0x8
     3e8:	d2800082 	mov	x2, #0x4                   	// #4
     3ec:	9100e3e0 	add	x0, sp, #0x38
     3f0:	94000f04 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     3f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     3f8:	f9400aa1 	ldr	x1, [x21, #16]
     3fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     400:	38606820 	ldrb	w0, [x1, x0]
     404:	36100080 	tbz	w0, #2, 414 <cd+0xc4>
    return session_free_buf(session, msg->header.len);
     408:	79400441 	ldrh	w1, [x2, #2]
     40c:	aa1503e0 	mov	x0, x21
     410:	940003f4 	bl	13e0 <session_free_buf>
     414:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cd)(session, path);
}
     418:	a94153f3 	ldp	x19, x20, [sp, #16]
     41c:	f94013f5 	ldr	x21, [sp, #32]
     420:	a8c47bfd 	ldp	x29, x30, [sp], #64
     424:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
     428:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     42c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     430:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     434:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     438:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     43c:	91360063 	add	x3, x3, #0xd80
     440:	9137a042 	add	x2, x2, #0xde8
     444:	91366000 	add	x0, x0, #0xd98
     448:	52800fc1 	mov	w1, #0x7e                  	// #126
     44c:	94000e49 	bl	3d70 <__assert_func>

0000000000000450 <mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
     450:	b40006c0 	cbz	x0, 528 <mkdir+0xd8>
int mkdir(struct Session* session, char* path)
{
     454:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     458:	910003fd 	mov	x29, sp
     45c:	a90153f3 	stp	x19, x20, [sp, #16]
     460:	aa0103f4 	mov	x20, x1
     464:	f90013f5 	str	x21, [sp, #32]
     468:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
     46c:	aa0103e0 	mov	x0, x1
     470:	94000ff4 	bl	4440 <strlen>
     474:	11000403 	add	w3, w0, #0x1
     478:	9100e3e2 	add	x2, sp, #0x38
     47c:	52800021 	mov	w1, #0x1                   	// #1
     480:	aa1503e0 	mov	x0, x21
     484:	b9003be3 	str	w3, [sp, #56]
     488:	9400021a 	bl	cf0 <new_ipc_msg>
     48c:	aa0003f3 	mov	x19, x0
     490:	aa1403e0 	mov	x0, x20
     494:	94000feb 	bl	4440 <strlen>
     498:	aa1403e2 	mov	x2, x20
     49c:	11000403 	add	w3, w0, #0x1
     4a0:	52800001 	mov	w1, #0x0                   	// #0
     4a4:	aa1303e0 	mov	x0, x19
     4a8:	94000252 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     4ac:	52800060 	mov	w0, #0x3                   	// #3
     4b0:	39000660 	strb	w0, [x19, #1]
     4b4:	aa1303e0 	mov	x0, x19
     4b8:	940002be 	bl	fb0 <ipc_msg_send_wait>
     4bc:	aa1403e0 	mov	x0, x20
     4c0:	94000fe0 	bl	4440 <strlen>
     4c4:	aa1403e2 	mov	x2, x20
     4c8:	11000403 	add	w3, w0, #0x1
     4cc:	52800001 	mov	w1, #0x0                   	// #0
     4d0:	aa1303e0 	mov	x0, x19
     4d4:	9400027f 	bl	ed0 <ipc_msg_get_nth_arg>
     4d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     4dc:	39400260 	ldrb	w0, [x19]
     4e0:	36080280 	tbz	w0, #1, 530 <mkdir+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     4e4:	91002261 	add	x1, x19, #0x8
     4e8:	d2800082 	mov	x2, #0x4                   	// #4
     4ec:	9100e3e0 	add	x0, sp, #0x38
     4f0:	94000ec4 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     4f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     4f8:	f9400aa1 	ldr	x1, [x21, #16]
     4fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     500:	38606820 	ldrb	w0, [x1, x0]
     504:	36100080 	tbz	w0, #2, 514 <mkdir+0xc4>
    return session_free_buf(session, msg->header.len);
     508:	79400441 	ldrh	w1, [x2, #2]
     50c:	aa1503e0 	mov	x0, x21
     510:	940003b4 	bl	13e0 <session_free_buf>
     514:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_mkdir)(session, path);
}
     518:	a94153f3 	ldp	x19, x20, [sp, #16]
     51c:	f94013f5 	ldr	x21, [sp, #32]
     520:	a8c47bfd 	ldp	x29, x30, [sp], #64
     524:	d65f03c0 	ret
IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
     528:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     52c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     530:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     534:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     538:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     53c:	91360063 	add	x3, x3, #0xd80
     540:	9137a042 	add	x2, x2, #0xde8
     544:	91366000 	add	x0, x0, #0xd98
     548:	52800fc1 	mov	w1, #0x7e                  	// #126
     54c:	94000e09 	bl	3d70 <__assert_func>

0000000000000550 <rm>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
     550:	b40006c0 	cbz	x0, 628 <rm+0xd8>
int rm(struct Session* session, char* path)
{
     554:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     558:	910003fd 	mov	x29, sp
     55c:	a90153f3 	stp	x19, x20, [sp, #16]
     560:	aa0103f4 	mov	x20, x1
     564:	f90013f5 	str	x21, [sp, #32]
     568:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
     56c:	aa0103e0 	mov	x0, x1
     570:	94000fb4 	bl	4440 <strlen>
     574:	11000403 	add	w3, w0, #0x1
     578:	9100e3e2 	add	x2, sp, #0x38
     57c:	52800021 	mov	w1, #0x1                   	// #1
     580:	aa1503e0 	mov	x0, x21
     584:	b9003be3 	str	w3, [sp, #56]
     588:	940001da 	bl	cf0 <new_ipc_msg>
     58c:	aa0003f3 	mov	x19, x0
     590:	aa1403e0 	mov	x0, x20
     594:	94000fab 	bl	4440 <strlen>
     598:	aa1403e2 	mov	x2, x20
     59c:	11000403 	add	w3, w0, #0x1
     5a0:	52800001 	mov	w1, #0x0                   	// #0
     5a4:	aa1303e0 	mov	x0, x19
     5a8:	94000212 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     5ac:	52800080 	mov	w0, #0x4                   	// #4
     5b0:	39000660 	strb	w0, [x19, #1]
     5b4:	aa1303e0 	mov	x0, x19
     5b8:	9400027e 	bl	fb0 <ipc_msg_send_wait>
     5bc:	aa1403e0 	mov	x0, x20
     5c0:	94000fa0 	bl	4440 <strlen>
     5c4:	aa1403e2 	mov	x2, x20
     5c8:	11000403 	add	w3, w0, #0x1
     5cc:	52800001 	mov	w1, #0x0                   	// #0
     5d0:	aa1303e0 	mov	x0, x19
     5d4:	9400023f 	bl	ed0 <ipc_msg_get_nth_arg>
     5d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     5dc:	39400260 	ldrb	w0, [x19]
     5e0:	36080280 	tbz	w0, #1, 630 <rm+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     5e4:	91002261 	add	x1, x19, #0x8
     5e8:	d2800082 	mov	x2, #0x4                   	// #4
     5ec:	9100e3e0 	add	x0, sp, #0x38
     5f0:	94000e84 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     5f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     5f8:	f9400aa1 	ldr	x1, [x21, #16]
     5fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     600:	38606820 	ldrb	w0, [x1, x0]
     604:	36100080 	tbz	w0, #2, 614 <rm+0xc4>
    return session_free_buf(session, msg->header.len);
     608:	79400441 	ldrh	w1, [x2, #2]
     60c:	aa1503e0 	mov	x0, x21
     610:	94000374 	bl	13e0 <session_free_buf>
     614:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_delete)(session, path);
}
     618:	a94153f3 	ldp	x19, x20, [sp, #16]
     61c:	f94013f5 	ldr	x21, [sp, #32]
     620:	a8c47bfd 	ldp	x29, x30, [sp], #64
     624:	d65f03c0 	ret
IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
     628:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     62c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     630:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     634:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     638:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     63c:	91360063 	add	x3, x3, #0xd80
     640:	9137a042 	add	x2, x2, #0xde8
     644:	91366000 	add	x0, x0, #0xd98
     648:	52800fc1 	mov	w1, #0x7e                  	// #126
     64c:	94000dc9 	bl	3d70 <__assert_func>

0000000000000650 <cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
     650:	b40006c0 	cbz	x0, 728 <cat+0xd8>
int cat(struct Session* session, char* path)
{
     654:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     658:	910003fd 	mov	x29, sp
     65c:	a90153f3 	stp	x19, x20, [sp, #16]
     660:	aa0103f4 	mov	x20, x1
     664:	f90013f5 	str	x21, [sp, #32]
     668:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
     66c:	aa0103e0 	mov	x0, x1
     670:	94000f74 	bl	4440 <strlen>
     674:	11000403 	add	w3, w0, #0x1
     678:	9100e3e2 	add	x2, sp, #0x38
     67c:	52800021 	mov	w1, #0x1                   	// #1
     680:	aa1503e0 	mov	x0, x21
     684:	b9003be3 	str	w3, [sp, #56]
     688:	9400019a 	bl	cf0 <new_ipc_msg>
     68c:	aa0003f3 	mov	x19, x0
     690:	aa1403e0 	mov	x0, x20
     694:	94000f6b 	bl	4440 <strlen>
     698:	aa1403e2 	mov	x2, x20
     69c:	11000403 	add	w3, w0, #0x1
     6a0:	52800001 	mov	w1, #0x0                   	// #0
     6a4:	aa1303e0 	mov	x0, x19
     6a8:	940001d2 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     6ac:	528000a0 	mov	w0, #0x5                   	// #5
     6b0:	39000660 	strb	w0, [x19, #1]
     6b4:	aa1303e0 	mov	x0, x19
     6b8:	9400023e 	bl	fb0 <ipc_msg_send_wait>
     6bc:	aa1403e0 	mov	x0, x20
     6c0:	94000f60 	bl	4440 <strlen>
     6c4:	aa1403e2 	mov	x2, x20
     6c8:	11000403 	add	w3, w0, #0x1
     6cc:	52800001 	mov	w1, #0x0                   	// #0
     6d0:	aa1303e0 	mov	x0, x19
     6d4:	940001ff 	bl	ed0 <ipc_msg_get_nth_arg>
     6d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     6dc:	39400260 	ldrb	w0, [x19]
     6e0:	36080280 	tbz	w0, #1, 730 <cat+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     6e4:	91002261 	add	x1, x19, #0x8
     6e8:	d2800082 	mov	x2, #0x4                   	// #4
     6ec:	9100e3e0 	add	x0, sp, #0x38
     6f0:	94000e44 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     6f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     6f8:	f9400aa1 	ldr	x1, [x21, #16]
     6fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     700:	38606820 	ldrb	w0, [x1, x0]
     704:	36100080 	tbz	w0, #2, 714 <cat+0xc4>
    return session_free_buf(session, msg->header.len);
     708:	79400441 	ldrh	w1, [x2, #2]
     70c:	aa1503e0 	mov	x0, x21
     710:	94000334 	bl	13e0 <session_free_buf>
     714:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_cat)(session, path);
}
     718:	a94153f3 	ldp	x19, x20, [sp, #16]
     71c:	f94013f5 	ldr	x21, [sp, #32]
     720:	a8c47bfd 	ldp	x29, x30, [sp], #64
     724:	d65f03c0 	ret
IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
     728:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     72c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     730:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     734:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     738:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     73c:	91360063 	add	x3, x3, #0xd80
     740:	9137a042 	add	x2, x2, #0xde8
     744:	91366000 	add	x0, x0, #0xd98
     748:	52800fc1 	mov	w1, #0x7e                  	// #126
     74c:	94000d89 	bl	3d70 <__assert_func>

0000000000000750 <open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
     750:	b40006c0 	cbz	x0, 828 <open+0xd8>
int open(struct Session* session, char* path)
{
     754:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
     758:	910003fd 	mov	x29, sp
     75c:	a90153f3 	stp	x19, x20, [sp, #16]
     760:	aa0103f4 	mov	x20, x1
     764:	f90013f5 	str	x21, [sp, #32]
     768:	aa0003f5 	mov	x21, x0
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
     76c:	aa0103e0 	mov	x0, x1
     770:	94000f34 	bl	4440 <strlen>
     774:	11000403 	add	w3, w0, #0x1
     778:	9100e3e2 	add	x2, sp, #0x38
     77c:	52800021 	mov	w1, #0x1                   	// #1
     780:	aa1503e0 	mov	x0, x21
     784:	b9003be3 	str	w3, [sp, #56]
     788:	9400015a 	bl	cf0 <new_ipc_msg>
     78c:	aa0003f3 	mov	x19, x0
     790:	aa1403e0 	mov	x0, x20
     794:	94000f2b 	bl	4440 <strlen>
     798:	aa1403e2 	mov	x2, x20
     79c:	11000403 	add	w3, w0, #0x1
     7a0:	52800001 	mov	w1, #0x0                   	// #0
     7a4:	aa1303e0 	mov	x0, x19
     7a8:	94000192 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     7ac:	528000c0 	mov	w0, #0x6                   	// #6
     7b0:	39000660 	strb	w0, [x19, #1]
     7b4:	aa1303e0 	mov	x0, x19
     7b8:	940001fe 	bl	fb0 <ipc_msg_send_wait>
     7bc:	aa1403e0 	mov	x0, x20
     7c0:	94000f20 	bl	4440 <strlen>
     7c4:	aa1403e2 	mov	x2, x20
     7c8:	11000403 	add	w3, w0, #0x1
     7cc:	52800001 	mov	w1, #0x0                   	// #0
     7d0:	aa1303e0 	mov	x0, x19
     7d4:	940001bf 	bl	ed0 <ipc_msg_get_nth_arg>
     7d8:	b9003bff 	str	wzr, [sp, #56]
    assert(msg->header.done == 1);
     7dc:	39400260 	ldrb	w0, [x19]
     7e0:	36080280 	tbz	w0, #1, 830 <open+0xe0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     7e4:	91002261 	add	x1, x19, #0x8
     7e8:	d2800082 	mov	x2, #0x4                   	// #4
     7ec:	9100e3e0 	add	x0, sp, #0x38
     7f0:	94000e04 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     7f4:	b9800aa0 	ldrsw	x0, [x21, #8]
     7f8:	f9400aa1 	ldr	x1, [x21, #16]
     7fc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     800:	38606820 	ldrb	w0, [x1, x0]
     804:	36100080 	tbz	w0, #2, 814 <open+0xc4>
    return session_free_buf(session, msg->header.len);
     808:	79400441 	ldrh	w1, [x2, #2]
     80c:	aa1503e0 	mov	x0, x21
     810:	940002f4 	bl	13e0 <session_free_buf>
     814:	b9403be0 	ldr	w0, [sp, #56]
    return IPC_CALL(Ipc_open)(session, path);
}
     818:	a94153f3 	ldp	x19, x20, [sp, #16]
     81c:	f94013f5 	ldr	x21, [sp, #32]
     820:	a8c47bfd 	ldp	x29, x30, [sp], #64
     824:	d65f03c0 	ret
IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
     828:	12800000 	mov	w0, #0xffffffff            	// #-1
}
     82c:	d65f03c0 	ret
    assert(msg->header.done == 1);
     830:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     834:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     838:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     83c:	91360063 	add	x3, x3, #0xd80
     840:	9137a042 	add	x2, x2, #0xde8
     844:	91366000 	add	x0, x0, #0xd98
     848:	52800fc1 	mov	w1, #0x7e                  	// #126
     84c:	94000d49 	bl	3d70 <__assert_func>

0000000000000850 <close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
int close(struct Session* session, int fd)
{
     850:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     854:	910003fd 	mov	x29, sp
     858:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
     85c:	b4000560 	cbz	x0, 908 <close+0xb8>
     860:	910123e2 	add	x2, sp, #0x48
     864:	52800021 	mov	w1, #0x1                   	// #1
     868:	a90153f3 	stp	x19, x20, [sp, #16]
     86c:	aa0003f4 	mov	x20, x0
     870:	f90013f5 	str	x21, [sp, #32]
     874:	52800095 	mov	w21, #0x4                   	// #4
     878:	b9004bf5 	str	w21, [sp, #72]
     87c:	9400011d 	bl	cf0 <new_ipc_msg>
     880:	aa0003f3 	mov	x19, x0
     884:	2a1503e3 	mov	w3, w21
     888:	9100f3e2 	add	x2, sp, #0x3c
     88c:	52800001 	mov	w1, #0x0                   	// #0
     890:	94000158 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     894:	528000e0 	mov	w0, #0x7                   	// #7
     898:	39000660 	strb	w0, [x19, #1]
     89c:	aa1303e0 	mov	x0, x19
     8a0:	940001c4 	bl	fb0 <ipc_msg_send_wait>
     8a4:	2a1503e3 	mov	w3, w21
     8a8:	9100f3e2 	add	x2, sp, #0x3c
     8ac:	aa1303e0 	mov	x0, x19
     8b0:	52800001 	mov	w1, #0x0                   	// #0
     8b4:	94000187 	bl	ed0 <ipc_msg_get_nth_arg>
     8b8:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
     8bc:	39400260 	ldrb	w0, [x19]
     8c0:	36080280 	tbz	w0, #1, 910 <close+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     8c4:	91002261 	add	x1, x19, #0x8
     8c8:	d2800082 	mov	x2, #0x4                   	// #4
     8cc:	910123e0 	add	x0, sp, #0x48
     8d0:	94000dcc 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     8d4:	b9800a80 	ldrsw	x0, [x20, #8]
     8d8:	f9400a81 	ldr	x1, [x20, #16]
     8dc:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     8e0:	38606820 	ldrb	w0, [x1, x0]
     8e4:	36100080 	tbz	w0, #2, 8f4 <close+0xa4>
    return session_free_buf(session, msg->header.len);
     8e8:	79400441 	ldrh	w1, [x2, #2]
     8ec:	aa1403e0 	mov	x0, x20
     8f0:	940002bc 	bl	13e0 <session_free_buf>
     8f4:	a94153f3 	ldp	x19, x20, [sp, #16]
     8f8:	b9404be0 	ldr	w0, [sp, #72]
     8fc:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_close)(session, &fd);
}
     900:	a8c57bfd 	ldp	x29, x30, [sp], #80
     904:	d65f03c0 	ret
IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
     908:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_close)(session, &fd);
     90c:	17fffffd 	b	900 <close+0xb0>
    assert(msg->header.done == 1);
     910:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     914:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     918:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     91c:	91360063 	add	x3, x3, #0xd80
     920:	9137a042 	add	x2, x2, #0xde8
     924:	91366000 	add	x0, x0, #0xd98
     928:	52800fc1 	mov	w1, #0x7e                  	// #126
     92c:	94000d11 	bl	3d70 <__assert_func>

0000000000000930 <read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
     930:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     934:	910003fd 	mov	x29, sp
     938:	29068fe4 	stp	w4, w3, [sp, #52]
     93c:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
     940:	b4000980 	cbz	x0, a70 <read+0x140>
     944:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
     948:	a90153f3 	stp	x19, x20, [sp, #16]
     94c:	52800094 	mov	w20, #0x4                   	// #4
     950:	2a1403e1 	mov	w1, w20
     954:	a9025bf5 	stp	x21, x22, [sp, #32]
     958:	aa0203f6 	mov	x22, x2
     95c:	aa0003f5 	mov	x21, x0
     960:	910103e2 	add	x2, sp, #0x40
     964:	290813f4 	stp	w20, w4, [sp, #64]
     968:	f90027e3 	str	x3, [sp, #72]
     96c:	940000e1 	bl	cf0 <new_ipc_msg>
     970:	2a1403e3 	mov	w3, w20
     974:	aa0003f3 	mov	x19, x0
     978:	9100f3e2 	add	x2, sp, #0x3c
     97c:	52800001 	mov	w1, #0x0                   	// #0
     980:	9400011c 	bl	df0 <ipc_msg_set_nth_arg>
     984:	b94037e3 	ldr	w3, [sp, #52]
     988:	aa1603e2 	mov	x2, x22
     98c:	52800021 	mov	w1, #0x1                   	// #1
     990:	aa1303e0 	mov	x0, x19
     994:	94000117 	bl	df0 <ipc_msg_set_nth_arg>
     998:	2a1403e3 	mov	w3, w20
     99c:	9100e3e2 	add	x2, sp, #0x38
     9a0:	52800041 	mov	w1, #0x2                   	// #2
     9a4:	aa1303e0 	mov	x0, x19
     9a8:	94000112 	bl	df0 <ipc_msg_set_nth_arg>
     9ac:	2a1403e3 	mov	w3, w20
     9b0:	9100d3e2 	add	x2, sp, #0x34
     9b4:	52800061 	mov	w1, #0x3                   	// #3
     9b8:	aa1303e0 	mov	x0, x19
     9bc:	9400010d 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     9c0:	52800100 	mov	w0, #0x8                   	// #8
     9c4:	39000660 	strb	w0, [x19, #1]
     9c8:	aa1303e0 	mov	x0, x19
     9cc:	94000179 	bl	fb0 <ipc_msg_send_wait>
     9d0:	2a1403e3 	mov	w3, w20
     9d4:	9100f3e2 	add	x2, sp, #0x3c
     9d8:	52800001 	mov	w1, #0x0                   	// #0
     9dc:	aa1303e0 	mov	x0, x19
     9e0:	9400013c 	bl	ed0 <ipc_msg_get_nth_arg>
     9e4:	b94037e3 	ldr	w3, [sp, #52]
     9e8:	aa1603e2 	mov	x2, x22
     9ec:	52800021 	mov	w1, #0x1                   	// #1
     9f0:	aa1303e0 	mov	x0, x19
     9f4:	94000137 	bl	ed0 <ipc_msg_get_nth_arg>
     9f8:	2a1403e3 	mov	w3, w20
     9fc:	9100e3e2 	add	x2, sp, #0x38
     a00:	52800041 	mov	w1, #0x2                   	// #2
     a04:	aa1303e0 	mov	x0, x19
     a08:	94000132 	bl	ed0 <ipc_msg_get_nth_arg>
     a0c:	2a1403e3 	mov	w3, w20
     a10:	9100d3e2 	add	x2, sp, #0x34
     a14:	aa1303e0 	mov	x0, x19
     a18:	52800061 	mov	w1, #0x3                   	// #3
     a1c:	9400012d 	bl	ed0 <ipc_msg_get_nth_arg>
     a20:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
     a24:	39400260 	ldrb	w0, [x19]
     a28:	36080280 	tbz	w0, #1, a78 <read+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     a2c:	91002261 	add	x1, x19, #0x8
     a30:	d2800082 	mov	x2, #0x4                   	// #4
     a34:	910103e0 	add	x0, sp, #0x40
     a38:	94000d72 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     a3c:	b9800aa0 	ldrsw	x0, [x21, #8]
     a40:	f9400aa1 	ldr	x1, [x21, #16]
     a44:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     a48:	38606820 	ldrb	w0, [x1, x0]
     a4c:	36100080 	tbz	w0, #2, a5c <read+0x12c>
    return session_free_buf(session, msg->header.len);
     a50:	79400441 	ldrh	w1, [x2, #2]
     a54:	aa1503e0 	mov	x0, x21
     a58:	94000262 	bl	13e0 <session_free_buf>
     a5c:	a94153f3 	ldp	x19, x20, [sp, #16]
     a60:	a9425bf5 	ldp	x21, x22, [sp, #32]
     a64:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
}
     a68:	a8c57bfd 	ldp	x29, x30, [sp], #80
     a6c:	d65f03c0 	ret
IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
     a70:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
     a74:	17fffffd 	b	a68 <read+0x138>
    assert(msg->header.done == 1);
     a78:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     a7c:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     a80:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     a84:	91360063 	add	x3, x3, #0xd80
     a88:	9137a042 	add	x2, x2, #0xde8
     a8c:	91366000 	add	x0, x0, #0xd98
     a90:	52800fc1 	mov	w1, #0x7e                  	// #126
     a94:	94000cb7 	bl	3d70 <__assert_func>
     a98:	d503201f 	nop
     a9c:	d503201f 	nop

0000000000000aa0 <write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
int write(struct Session* session, int fd, char* src, int offset, int len)
{
     aa0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     aa4:	910003fd 	mov	x29, sp
     aa8:	29068fe4 	stp	w4, w3, [sp, #52]
     aac:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
     ab0:	b4000980 	cbz	x0, be0 <write+0x140>
     ab4:	b21e03e3 	mov	x3, #0x400000004           	// #17179869188
     ab8:	a90153f3 	stp	x19, x20, [sp, #16]
     abc:	52800094 	mov	w20, #0x4                   	// #4
     ac0:	2a1403e1 	mov	w1, w20
     ac4:	a9025bf5 	stp	x21, x22, [sp, #32]
     ac8:	aa0203f6 	mov	x22, x2
     acc:	aa0003f5 	mov	x21, x0
     ad0:	910103e2 	add	x2, sp, #0x40
     ad4:	290813f4 	stp	w20, w4, [sp, #64]
     ad8:	f90027e3 	str	x3, [sp, #72]
     adc:	94000085 	bl	cf0 <new_ipc_msg>
     ae0:	2a1403e3 	mov	w3, w20
     ae4:	aa0003f3 	mov	x19, x0
     ae8:	9100f3e2 	add	x2, sp, #0x3c
     aec:	52800001 	mov	w1, #0x0                   	// #0
     af0:	940000c0 	bl	df0 <ipc_msg_set_nth_arg>
     af4:	b94037e3 	ldr	w3, [sp, #52]
     af8:	aa1603e2 	mov	x2, x22
     afc:	52800021 	mov	w1, #0x1                   	// #1
     b00:	aa1303e0 	mov	x0, x19
     b04:	940000bb 	bl	df0 <ipc_msg_set_nth_arg>
     b08:	2a1403e3 	mov	w3, w20
     b0c:	9100e3e2 	add	x2, sp, #0x38
     b10:	52800041 	mov	w1, #0x2                   	// #2
     b14:	aa1303e0 	mov	x0, x19
     b18:	940000b6 	bl	df0 <ipc_msg_set_nth_arg>
     b1c:	2a1403e3 	mov	w3, w20
     b20:	9100d3e2 	add	x2, sp, #0x34
     b24:	52800061 	mov	w1, #0x3                   	// #3
     b28:	aa1303e0 	mov	x0, x19
     b2c:	940000b1 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     b30:	52800120 	mov	w0, #0x9                   	// #9
     b34:	39000660 	strb	w0, [x19, #1]
     b38:	aa1303e0 	mov	x0, x19
     b3c:	9400011d 	bl	fb0 <ipc_msg_send_wait>
     b40:	2a1403e3 	mov	w3, w20
     b44:	9100f3e2 	add	x2, sp, #0x3c
     b48:	52800001 	mov	w1, #0x0                   	// #0
     b4c:	aa1303e0 	mov	x0, x19
     b50:	940000e0 	bl	ed0 <ipc_msg_get_nth_arg>
     b54:	b94037e3 	ldr	w3, [sp, #52]
     b58:	aa1603e2 	mov	x2, x22
     b5c:	52800021 	mov	w1, #0x1                   	// #1
     b60:	aa1303e0 	mov	x0, x19
     b64:	940000db 	bl	ed0 <ipc_msg_get_nth_arg>
     b68:	2a1403e3 	mov	w3, w20
     b6c:	9100e3e2 	add	x2, sp, #0x38
     b70:	52800041 	mov	w1, #0x2                   	// #2
     b74:	aa1303e0 	mov	x0, x19
     b78:	940000d6 	bl	ed0 <ipc_msg_get_nth_arg>
     b7c:	2a1403e3 	mov	w3, w20
     b80:	9100d3e2 	add	x2, sp, #0x34
     b84:	aa1303e0 	mov	x0, x19
     b88:	52800061 	mov	w1, #0x3                   	// #3
     b8c:	940000d1 	bl	ed0 <ipc_msg_get_nth_arg>
     b90:	b90043ff 	str	wzr, [sp, #64]
    assert(msg->header.done == 1);
     b94:	39400260 	ldrb	w0, [x19]
     b98:	36080280 	tbz	w0, #1, be8 <write+0x148>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     b9c:	91002261 	add	x1, x19, #0x8
     ba0:	d2800082 	mov	x2, #0x4                   	// #4
     ba4:	910103e0 	add	x0, sp, #0x40
     ba8:	94000d16 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     bac:	b9800aa0 	ldrsw	x0, [x21, #8]
     bb0:	f9400aa1 	ldr	x1, [x21, #16]
     bb4:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     bb8:	38606820 	ldrb	w0, [x1, x0]
     bbc:	36100080 	tbz	w0, #2, bcc <write+0x12c>
    return session_free_buf(session, msg->header.len);
     bc0:	79400441 	ldrh	w1, [x2, #2]
     bc4:	aa1503e0 	mov	x0, x21
     bc8:	94000206 	bl	13e0 <session_free_buf>
     bcc:	a94153f3 	ldp	x19, x20, [sp, #16]
     bd0:	a9425bf5 	ldp	x21, x22, [sp, #32]
     bd4:	b94043e0 	ldr	w0, [sp, #64]
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
}
     bd8:	a8c57bfd 	ldp	x29, x30, [sp], #80
     bdc:	d65f03c0 	ret
IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
     be0:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
     be4:	17fffffd 	b	bd8 <write+0x138>
    assert(msg->header.done == 1);
     be8:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     bec:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     bf0:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     bf4:	91360063 	add	x3, x3, #0xd80
     bf8:	9137a042 	add	x2, x2, #0xde8
     bfc:	91366000 	add	x0, x0, #0xd98
     c00:	52800fc1 	mov	w1, #0x7e                  	// #126
     c04:	94000c5b 	bl	3d70 <__assert_func>
     c08:	d503201f 	nop
     c0c:	d503201f 	nop

0000000000000c10 <fsize>:

IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
int fsize(struct Session* session, int fd)
{
     c10:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
     c14:	910003fd 	mov	x29, sp
     c18:	b9003fe1 	str	w1, [sp, #60]
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
     c1c:	b4000560 	cbz	x0, cc8 <fsize+0xb8>
     c20:	910123e2 	add	x2, sp, #0x48
     c24:	52800021 	mov	w1, #0x1                   	// #1
     c28:	a90153f3 	stp	x19, x20, [sp, #16]
     c2c:	aa0003f4 	mov	x20, x0
     c30:	f90013f5 	str	x21, [sp, #32]
     c34:	52800095 	mov	w21, #0x4                   	// #4
     c38:	b9004bf5 	str	w21, [sp, #72]
     c3c:	9400002d 	bl	cf0 <new_ipc_msg>
     c40:	aa0003f3 	mov	x19, x0
     c44:	2a1503e3 	mov	w3, w21
     c48:	9100f3e2 	add	x2, sp, #0x3c
     c4c:	52800001 	mov	w1, #0x0                   	// #0
     c50:	94000068 	bl	df0 <ipc_msg_set_nth_arg>
    msg->header.opcode = opcode;
     c54:	52800140 	mov	w0, #0xa                   	// #10
     c58:	39000660 	strb	w0, [x19, #1]
     c5c:	aa1303e0 	mov	x0, x19
     c60:	940000d4 	bl	fb0 <ipc_msg_send_wait>
     c64:	2a1503e3 	mov	w3, w21
     c68:	9100f3e2 	add	x2, sp, #0x3c
     c6c:	aa1303e0 	mov	x0, x19
     c70:	52800001 	mov	w1, #0x0                   	// #0
     c74:	94000097 	bl	ed0 <ipc_msg_get_nth_arg>
     c78:	b9004bff 	str	wzr, [sp, #72]
    assert(msg->header.done == 1);
     c7c:	39400260 	ldrb	w0, [x19]
     c80:	36080280 	tbz	w0, #1, cd0 <fsize+0xc0>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
     c84:	91002261 	add	x1, x19, #0x8
     c88:	d2800082 	mov	x2, #0x4                   	// #4
     c8c:	910123e0 	add	x0, sp, #0x48
     c90:	94000cdc 	bl	4000 <memcpy>
    struct IpcMsg* msg = IPCSESSION_MSG(session);
     c94:	b9800a80 	ldrsw	x0, [x20, #8]
     c98:	f9400a81 	ldr	x1, [x20, #16]
     c9c:	8b000022 	add	x2, x1, x0
    if (msg->header.init != 1) {
     ca0:	38606820 	ldrb	w0, [x1, x0]
     ca4:	36100080 	tbz	w0, #2, cb4 <fsize+0xa4>
    return session_free_buf(session, msg->header.len);
     ca8:	79400441 	ldrh	w1, [x2, #2]
     cac:	aa1403e0 	mov	x0, x20
     cb0:	940001cc 	bl	13e0 <session_free_buf>
     cb4:	a94153f3 	ldp	x19, x20, [sp, #16]
     cb8:	b9404be0 	ldr	w0, [sp, #72]
     cbc:	f94013f5 	ldr	x21, [sp, #32]
    return IPC_CALL(Ipc_fsize)(session, &fd);
     cc0:	a8c57bfd 	ldp	x29, x30, [sp], #80
     cc4:	d65f03c0 	ret
IPC_INTERFACE(Ipc_fsize, 1, fd, sizeof(int));
     cc8:	12800000 	mov	w0, #0xffffffff            	// #-1
    return IPC_CALL(Ipc_fsize)(session, &fd);
     ccc:	17fffffd 	b	cc0 <fsize+0xb0>
    assert(msg->header.done == 1);
     cd0:	f0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
     cd4:	f0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
     cd8:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     cdc:	91360063 	add	x3, x3, #0xd80
     ce0:	9137a042 	add	x2, x2, #0xde8
     ce4:	91366000 	add	x0, x0, #0xd98
     ce8:	52800fc1 	mov	w1, #0x7e                  	// #126
     cec:	94000c21 	bl	3d70 <__assert_func>

0000000000000cf0 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
     cf0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!

    int arg_info_offset = len; // start of arg info
    len += argc * sizeof(struct IpcArgInfo);

    int arg_buf_offset = len; // start of arg buffer
    for (int i = 0; i < argc; i++) {
     cf4:	7100003f 	cmp	w1, #0x0
{
     cf8:	910003fd 	mov	x29, sp
     cfc:	a90153f3 	stp	x19, x20, [sp, #16]
    len += argc * sizeof(struct IpcArgInfo);
     d00:	528000d4 	mov	w20, #0x6                   	// #6
     d04:	1b147c34 	mul	w20, w1, w20
{
     d08:	a9025bf5 	stp	x21, x22, [sp, #32]
     d0c:	2a0103f5 	mov	w21, w1
    len += argc * sizeof(struct IpcArgInfo);
     d10:	11003294 	add	w20, w20, #0xc
    for (int i = 0; i < argc; i++) {
     d14:	5400056d 	b.le	dc0 <new_ipc_msg+0xd0>
     d18:	aa0003e3 	mov	x3, x0
    len += argc * sizeof(struct IpcArgInfo);
     d1c:	2a1403f6 	mov	w22, w20
     d20:	aa0203f3 	mov	x19, x2
    for (int i = 0; i < argc; i++) {
     d24:	d2800002 	mov	x2, #0x0                   	// #0
        len += arg_size[i];
     d28:	b8627a61 	ldr	w1, [x19, x2, lsl #2]
    for (int i = 0; i < argc; i++) {
     d2c:	91000442 	add	x2, x2, #0x1
     d30:	6b0202bf 	cmp	w21, w2
        len += arg_size[i];
     d34:	0b0102d6 	add	w22, w22, w1
    for (int i = 0; i < argc; i++) {
     d38:	54ffff8c 	b.gt	d28 <new_ipc_msg+0x38>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
     d3c:	aa0303e0 	mov	x0, x3
     d40:	2a1603e1 	mov	w1, w22
     d44:	9400016f 	bl	1300 <session_alloc_buf>
    if (buf == NULL) {
     d48:	b40004c0 	cbz	x0, de0 <new_ipc_msg+0xf0>
        return NULL;
    }
    buf->header.len = len;
     d4c:	528000c5 	mov	w5, #0x6                   	// #6
    buf->header.done = 0;
    buf->header.valid = 0;
     d50:	39400001 	ldrb	w1, [x0]
     d54:	52800182 	mov	w2, #0xc                   	// #12
     d58:	aa1303e3 	mov	x3, x19
     d5c:	1b057ea5 	mul	w5, w21, w5
     d60:	121e7421 	and	w1, w1, #0xfffffffc
     d64:	39000001 	strb	w1, [x0]
     d68:	0b0200a5 	add	w5, w5, w2
    buf->header.len = len;
     d6c:	79000416 	strh	w22, [x0, #2]

    for (int i = 0; i < argc; i++) {
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
     d70:	8b22c001 	add	x1, x0, w2, sxtw
        arg_info->len = arg_size[i];
     d74:	b9400064 	ldr	w4, [x3]
     d78:	79000424 	strh	w4, [x1, #2]
        arg_info->offset = arg_buf_offset;
     d7c:	7822c814 	strh	w20, [x0, w2, sxtw]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
     d80:	11001842 	add	w2, w2, #0x6
    for (int i = 0; i < argc; i++) {
     d84:	6b05005f 	cmp	w2, w5
        arg_buf_offset += arg_size[i];
     d88:	b8404461 	ldr	w1, [x3], #4
     d8c:	0b010294 	add	w20, w20, w1
    for (int i = 0; i < argc; i++) {
     d90:	54ffff01 	b.ne	d70 <new_ipc_msg+0x80>  // b.any
    }
    buf->header.nr_args = argc;
    buf->header.init = 1;
     d94:	39400002 	ldrb	w2, [x0]
     d98:	531c0ea1 	ubfiz	w1, w21, #4, #4
     d9c:	321e0021 	orr	w1, w1, #0x4
     da0:	52800163 	mov	w3, #0xb                   	// #11
     da4:	0a030042 	and	w2, w2, w3
     da8:	2a020021 	orr	w1, w1, w2
     dac:	39000001 	strb	w1, [x0]
    return buf;
}
     db0:	a94153f3 	ldp	x19, x20, [sp, #16]
     db4:	a9425bf5 	ldp	x21, x22, [sp, #32]
     db8:	a8c37bfd 	ldp	x29, x30, [sp], #48
     dbc:	d65f03c0 	ret
    struct IpcMsg* buf = session_alloc_buf(session, len);
     dc0:	2a1403e1 	mov	w1, w20
     dc4:	9400014f 	bl	1300 <session_alloc_buf>
    if (buf == NULL) {
     dc8:	b40000c0 	cbz	x0, de0 <new_ipc_msg+0xf0>
    buf->header.valid = 0;
     dcc:	39400001 	ldrb	w1, [x0]
    buf->header.len = len;
     dd0:	79000414 	strh	w20, [x0, #2]
    buf->header.valid = 0;
     dd4:	121e7421 	and	w1, w1, #0xfffffffc
     dd8:	39000001 	strb	w1, [x0]
    for (int i = 0; i < argc; i++) {
     ddc:	17ffffee 	b	d94 <new_ipc_msg+0xa4>
        return NULL;
     de0:	d2800000 	mov	x0, #0x0                   	// #0
     de4:	17fffff3 	b	db0 <new_ipc_msg+0xc0>
     de8:	d503201f 	nop
     dec:	d503201f 	nop

0000000000000df0 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
     df0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
     df4:	2a0103e4 	mov	w4, w1
     df8:	aa0203e1 	mov	x1, x2
     dfc:	910003fd 	mov	x29, sp
     e00:	93407c62 	sxtw	x2, w3
    if (arg_num >= msg->header.nr_args) {
     e04:	39400003 	ldrb	w3, [x0]
     e08:	d3441c63 	ubfx	x3, x3, #4, #4
     e0c:	6b04007f 	cmp	w3, w4
     e10:	540003ad 	b.le	e84 <ipc_msg_set_nth_arg+0x94>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
     e14:	528000c5 	mov	w5, #0x6                   	// #6
     e18:	d2800183 	mov	x3, #0xc                   	// #12
     e1c:	9b250c84 	smaddl	x4, w4, w5, x3
     e20:	8b040005 	add	x5, x0, x4
    if (len < 0 || (uint32_t)len > (uint32_t)nth_arg_info->len) {
     e24:	794004a3 	ldrh	w3, [x5, #2]
     e28:	37f801e2 	tbnz	w2, #31, e64 <ipc_msg_set_nth_arg+0x74>
     e2c:	6b02007f 	cmp	w3, w2
     e30:	540001a3 	b.cc	e64 <ipc_msg_set_nth_arg+0x74>  // b.lo, b.ul, b.last
    if (IPCMSG_ARG_INFO(msg, arg_num)->null_ptr == 1) {
     e34:	394010a3 	ldrb	w3, [x5, #4]
     e38:	37000423 	tbnz	w3, #0, ebc <ipc_msg_set_nth_arg+0xcc>
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     e3c:	78646803 	ldrh	w3, [x0, x4]
     e40:	8b030000 	add	x0, x0, x3

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);

    // handle attributes of different params
    if (data == NULL) {
        nth_arg_info->null_ptr = 1;
     e44:	394010a3 	ldrb	w3, [x5, #4]
    if (data == NULL) {
     e48:	b4000301 	cbz	x1, ea8 <ipc_msg_set_nth_arg+0xb8>
        memset(buf, 0x0, len);
        return true;
    } else {
        nth_arg_info->null_ptr = 0;
     e4c:	121f7863 	and	w3, w3, #0xfffffffe
     e50:	390010a3 	strb	w3, [x5, #4]
    }

    memmove(buf, data, len);
     e54:	94000ccb 	bl	4180 <memmove>
    return true;
     e58:	52800020 	mov	w0, #0x1                   	// #1
}
     e5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
     e60:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %u\n", __func__, len, nth_arg_info->len);
     e64:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
     e68:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     e6c:	913da021 	add	x1, x1, #0xf68
     e70:	91390000 	add	x0, x0, #0xe40
     e74:	94000803 	bl	2e80 <printf>
        return false;
     e78:	52800000 	mov	w0, #0x0                   	// #0
}
     e7c:	a8c17bfd 	ldp	x29, x30, [sp], #16
     e80:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %u\n", __func__, arg_num, msg->header.nr_args);
     e84:	2a0403e2 	mov	w2, w4
     e88:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
     e8c:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     e90:	913da021 	add	x1, x1, #0xf68
     e94:	91380000 	add	x0, x0, #0xe00
     e98:	940007fa 	bl	2e80 <printf>
        return false;
     e9c:	52800000 	mov	w0, #0x0                   	// #0
}
     ea0:	a8c17bfd 	ldp	x29, x30, [sp], #16
     ea4:	d65f03c0 	ret
        nth_arg_info->null_ptr = 1;
     ea8:	32000063 	orr	w3, w3, #0x1
     eac:	390010a3 	strb	w3, [x5, #4]
        memset(buf, 0x0, len);
     eb0:	94000ce4 	bl	4240 <memset>
        return true;
     eb4:	52800020 	mov	w0, #0x1                   	// #1
     eb8:	17ffffe9 	b	e5c <ipc_msg_set_nth_arg+0x6c>
        return NULL;
     ebc:	d2800000 	mov	x0, #0x0                   	// #0
     ec0:	17ffffe1 	b	e44 <ipc_msg_set_nth_arg+0x54>
     ec4:	d503201f 	nop
     ec8:	d503201f 	nop
     ecc:	d503201f 	nop

0000000000000ed0 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
     ed0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
     ed4:	aa0003e4 	mov	x4, x0
     ed8:	910003fd 	mov	x29, sp
     edc:	f9000bf3 	str	x19, [sp, #16]
    if (arg_num >= msg->header.nr_args) {
     ee0:	39400005 	ldrb	w5, [x0]
     ee4:	d3441ca5 	ubfx	x5, x5, #4, #4
     ee8:	6b0100bf 	cmp	w5, w1
     eec:	5400030d 	b.le	f4c <ipc_msg_get_nth_arg+0x7c>
        printf("[%s] IPC: arg_num out of msg range", __func__);
        return false;
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
     ef0:	528000c5 	mov	w5, #0x6                   	// #6
     ef4:	aa0203e0 	mov	x0, x2
     ef8:	d2800182 	mov	x2, #0xc                   	// #12
     efc:	9b250821 	smaddl	x1, w1, w5, x2
     f00:	8b010082 	add	x2, x4, x1
    if (len > nth_arg_info->len) {
     f04:	79400445 	ldrh	w5, [x2, #2]
     f08:	6b0300bf 	cmp	w5, w3
     f0c:	5400036b 	b.lt	f78 <ipc_msg_get_nth_arg+0xa8>  // b.tstop
        printf("[%s] IPC: size of arg out of buffer range", __func__);
        return false;
    }

    // handle null ptr: do nothing
    if (nth_arg_info->null_ptr == 1) {
     f10:	39401042 	ldrb	w2, [x2, #4]
        return true;
     f14:	52800033 	mov	w19, #0x1                   	// #1
    if (nth_arg_info->null_ptr == 1) {
     f18:	360000a2 	tbz	w2, #0, f2c <ipc_msg_get_nth_arg+0x5c>
    }

    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    memmove(data, buf, len);
    return true;
}
     f1c:	2a1303e0 	mov	w0, w19
     f20:	f9400bf3 	ldr	x19, [sp, #16]
     f24:	a8c27bfd 	ldp	x29, x30, [sp], #32
     f28:	d65f03c0 	ret
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
     f2c:	78616881 	ldrh	w1, [x4, x1]
    memmove(data, buf, len);
     f30:	93407c62 	sxtw	x2, w3
     f34:	8b010081 	add	x1, x4, x1
     f38:	94000c92 	bl	4180 <memmove>
}
     f3c:	2a1303e0 	mov	w0, w19
     f40:	f9400bf3 	ldr	x19, [sp, #16]
     f44:	a8c27bfd 	ldp	x29, x30, [sp], #32
     f48:	d65f03c0 	ret
        printf("[%s] IPC: arg_num out of msg range", __func__);
     f4c:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
     f50:	913da021 	add	x1, x1, #0xf68
     f54:	91006021 	add	x1, x1, #0x18
        return false;
     f58:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: arg_num out of msg range", __func__);
     f5c:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     f60:	913a2000 	add	x0, x0, #0xe88
     f64:	940007c7 	bl	2e80 <printf>
}
     f68:	2a1303e0 	mov	w0, w19
     f6c:	f9400bf3 	ldr	x19, [sp, #16]
     f70:	a8c27bfd 	ldp	x29, x30, [sp], #32
     f74:	d65f03c0 	ret
        printf("[%s] IPC: size of arg out of buffer range", __func__);
     f78:	f0000041 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
     f7c:	913da021 	add	x1, x1, #0xf68
     f80:	91006021 	add	x1, x1, #0x18
        return false;
     f84:	52800013 	mov	w19, #0x0                   	// #0
        printf("[%s] IPC: size of arg out of buffer range", __func__);
     f88:	f0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
     f8c:	913ac000 	add	x0, x0, #0xeb0
     f90:	940007bc 	bl	2e80 <printf>
}
     f94:	2a1303e0 	mov	w0, w19
     f98:	f9400bf3 	ldr	x19, [sp, #16]
     f9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
     fa0:	d65f03c0 	ret
     fa4:	d503201f 	nop
     fa8:	d503201f 	nop
     fac:	d503201f 	nop

0000000000000fb0 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
     fb0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
     fb4:	d2800021 	mov	x1, #0x1                   	// #1
     fb8:	f2db9741 	movk	x1, #0xdcba, lsl #32
     fbc:	f2f579a1 	movk	x1, #0xabcd, lsl #48
{
     fc0:	910003fd 	mov	x29, sp
     fc4:	f9000bf3 	str	x19, [sp, #16]
     fc8:	aa0003f3 	mov	x19, x0
    msg->header.valid = 1;
     fcc:	f9400000 	ldr	x0, [x0]
     fd0:	927e7400 	and	x0, x0, #0xfffffffc
     fd4:	aa010000 	orr	x0, x0, x1
     fd8:	f9000260 	str	x0, [x19]
    msg->header.done = 0;
    while (msg->header.done == 0) {
     fdc:	d503201f 	nop
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
     fe0:	52800040 	mov	w0, #0x2                   	// #2
     fe4:	940008ab 	bl	3290 <yield>
    while (msg->header.done == 0) {
     fe8:	39400261 	ldrb	w1, [x19]
     fec:	360fffa1 	tbz	w1, #1, fe0 <ipc_msg_send_wait+0x30>
    }
    assert(msg->header.done == 1);
}
     ff0:	f9400bf3 	ldr	x19, [sp, #16]
     ff4:	a8c27bfd 	ldp	x29, x30, [sp], #32
     ff8:	d65f03c0 	ret
     ffc:	d503201f 	nop

0000000000001000 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    msg->header.magic = IPC_MSG_MAGIC;
    msg->header.valid = 1;
    1000:	f9400001 	ldr	x1, [x0]
    1004:	d2800022 	mov	x2, #0x1                   	// #1
    1008:	f2db9742 	movk	x2, #0xdcba, lsl #32
    100c:	f2f579a2 	movk	x2, #0xabcd, lsl #48
    1010:	927e7421 	and	x1, x1, #0xfffffffc
    1014:	aa020021 	orr	x1, x1, x2
    1018:	f9000001 	str	x1, [x0]
    msg->header.done = 0;
}
    101c:	d65f03c0 	ret

0000000000001020 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    1020:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    1024:	910003fd 	mov	x29, sp
    1028:	f9000bf3 	str	x19, [sp, #16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    102c:	b9800801 	ldrsw	x1, [x0, #8]
    1030:	f9400800 	ldr	x0, [x0, #16]
    1034:	8b010013 	add	x19, x0, x1
    while (msg->header.done == 0) {
    1038:	38616800 	ldrb	w0, [x0, x1]
    103c:	370800a0 	tbnz	w0, #1, 1050 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield(SYS_TASK_YIELD_BLOCK_IPC);
    1040:	52800040 	mov	w0, #0x2                   	// #2
    1044:	94000893 	bl	3290 <yield>
    while (msg->header.done == 0) {
    1048:	39400260 	ldrb	w0, [x19]
    104c:	360fffa0 	tbz	w0, #1, 1040 <ipc_session_wait+0x20>
    }
    assert(msg->header.done == 1);
    return msg->header.ret_val;
}
    1050:	b9400a60 	ldr	w0, [x19, #8]
    1054:	f9400bf3 	ldr	x19, [sp, #16]
    1058:	a8c27bfd 	ldp	x29, x30, [sp], #32
    105c:	d65f03c0 	ret

0000000000001060 <cur_session_id>:

static int cur_sess_id = -1;
static struct IpcMsg* ipc_server_loop_cur_msg = NULL;
int cur_session_id(void)
{
    return cur_sess_id;
    1060:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
}
    1064:	b9486800 	ldr	w0, [x0, #2152]
    1068:	d65f03c0 	ret
    106c:	d503201f 	nop

0000000000001070 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    session_delayed = true;
    1070:	90000060 	adrp	x0, d000 <__global_locale+0x20>
    1074:	52800021 	mov	w1, #0x1                   	// #1
    1078:	3927a001 	strb	w1, [x0, #2536]
}
    107c:	d65f03c0 	ret

0000000000001080 <is_cur_session_delayed>:

bool is_cur_session_delayed(void)
{
    return session_delayed;
    1080:	90000060 	adrp	x0, d000 <__global_locale+0x20>
}
    1084:	3967a000 	ldrb	w0, [x0, #2536]
    1088:	d65f03c0 	ret
    108c:	d503201f 	nop

0000000000001090 <is_cur_handler_been_delayed>:

bool is_cur_handler_been_delayed()
{
    if (ipc_server_loop_cur_msg == NULL) {
    1090:	90000060 	adrp	x0, d000 <__global_locale+0x20>
    1094:	f944f800 	ldr	x0, [x0, #2544]
    1098:	b4000080 	cbz	x0, 10a8 <is_cur_handler_been_delayed+0x18>
        return false;
    }
    return ipc_server_loop_cur_msg->header.delayed == 1;
    109c:	39400000 	ldrb	w0, [x0]
    10a0:	d3430c00 	ubfx	x0, x0, #3, #1
}
    10a4:	d65f03c0 	ret
        return false;
    10a8:	52800000 	mov	w0, #0x0                   	// #0
}
    10ac:	d65f03c0 	ret

00000000000010b0 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    10b0:	d10dc3ff 	sub	sp, sp, #0x370
    struct Session session_list[NR_MAX_SESSION];
    memset(session_list, 0, sizeof(session_list));
    10b4:	d2806002 	mov	x2, #0x300                 	// #768
    10b8:	52800001 	mov	w1, #0x0                   	// #0
{
    10bc:	a9007bfd 	stp	x29, x30, [sp]
    10c0:	910003fd 	mov	x29, sp
    10c4:	a90153f3 	stp	x19, x20, [sp, #16]
    10c8:	aa0003f3 	mov	x19, x0
    memset(session_list, 0, sizeof(session_list));
    10cc:	9101c3e0 	add	x0, sp, #0x70
{
    10d0:	a9025bf5 	stp	x21, x22, [sp, #32]
    10d4:	f0000055 	adrp	x21, c000 <__func__.0+0x28>
    10d8:	9121a2b5 	add	x21, x21, #0x868
    10dc:	a90363f7 	stp	x23, x24, [sp, #48]
    10e0:	d0000056 	adrp	x22, b000 <_wcsnrtombs_l+0x130>
    10e4:	913c22d6 	add	x22, x22, #0xf08
    10e8:	a9046bf9 	stp	x25, x26, [sp, #64]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                /* handle every message in current session
                    a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                    interfaces[opcode] should explicitly call delay_session() and return to delay this session
                */
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    10ec:	529b9754 	mov	w20, #0xdcba                	// #56506
    10f0:	72b579b4 	movk	w20, #0xabcd, lsl #16
{
    10f4:	a90573fb 	stp	x27, x28, [sp, #80]
    memset(session_list, 0, sizeof(session_list));
    10f8:	94000c52 	bl	4240 <memset>
    10fc:	90000064 	adrp	x4, d000 <__global_locale+0x20>
    1100:	9127a09c 	add	x28, x4, #0x9e8
    1104:	d0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
    1108:	913b8000 	add	x0, x0, #0xee0
    110c:	f90037e0 	str	x0, [sp, #104]
    1110:	d000005b 	adrp	x27, b000 <_wcsnrtombs_l+0x130>
    1114:	913cc360 	add	x0, x27, #0xf30
    1118:	f90033e0 	str	x0, [sp, #96]
        poll_session(session_list, NR_MAX_SESSION);
    111c:	9101c3e0 	add	x0, sp, #0x70
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    1120:	5280001a 	mov	w26, #0x0                   	// #0
                        break;
                    }
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
                }
                // stop handle this session
                cur_sess_id = -1;
    1124:	12800018 	mov	w24, #0xffffffff            	// #-1
        poll_session(session_list, NR_MAX_SESSION);
    1128:	52800401 	mov	w1, #0x20                  	// #32
    112c:	94000879 	bl	3310 <poll_session>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    1130:	9101c3fb 	add	x27, sp, #0x70
    1134:	910dc3f7 	add	x23, sp, #0x370
            has_delayed = false;
    1138:	52800019 	mov	w25, #0x0                   	// #0
    113c:	d503201f 	nop
                if (session_list[i].buf == NULL) {
    1140:	f9400b60 	ldr	x0, [x27, #16]
                session_delayed = false;
    1144:	3900039f 	strb	wzr, [x28]
                if (session_list[i].buf == NULL) {
    1148:	b4000980 	cbz	x0, 1278 <ipc_server_loop+0x1c8>
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    114c:	b9800b62 	ldrsw	x2, [x27, #8]
                cur_sess_id = session_list[i].id;
    1150:	b9400361 	ldr	w1, [x27]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    1154:	8b020000 	add	x0, x0, x2
                cur_sess_id = session_list[i].id;
    1158:	b90002a1 	str	w1, [x21]
                ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    115c:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    1160:	b9400401 	ldr	w1, [x0, #4]
    1164:	6b14003f 	cmp	w1, w20
    1168:	54000340 	b.eq	11d0 <ipc_server_loop+0x120>  // b.none
    116c:	14000039 	b	1250 <ipc_server_loop+0x1a0>
                        ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode](ipc_server_loop_cur_msg);
    1170:	d63f0040 	blr	x2
                        if (ipc_server_loop_cur_msg->header.done == 0) {
    1174:	f9400780 	ldr	x0, [x28, #8]
    1178:	39400001 	ldrb	w1, [x0]
    117c:	36080641 	tbz	w1, #1, 1244 <ipc_server_loop+0x194>
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    1180:	29409b62 	ldp	w2, w6, [x27, #4]
    1184:	b9400f61 	ldr	w1, [x27, #12]
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    1188:	79400400 	ldrh	w0, [x0, #2]
    118c:	0b010041 	add	w1, w2, w1
    1190:	4b060021 	sub	w1, w1, w6
    1194:	1ac20c25 	sdiv	w5, w1, w2
    1198:	1b0284a1 	msub	w1, w5, w2, w1
    return session->capacity - session_used_size(session);
}

__attribute__((__always_inline__)) static inline int session_forward_head(struct Session* session, int len)
{
    if (len > session_used_size(session)) {
    119c:	6b01001f 	cmp	w0, w1
    11a0:	5400078c 	b.gt	1290 <ipc_server_loop+0x1e0>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
        return -1;
    }
    session->head = (session->head + len) % session->capacity;
    11a4:	0b060000 	add	w0, w0, w6
    11a8:	1ac20c01 	sdiv	w1, w0, w2
    11ac:	1b028020 	msub	w0, w1, w2, w0
    11b0:	b9000b60 	str	w0, [x27, #8]
    11b4:	37f804e0 	tbnz	w0, #31, 1250 <ipc_server_loop+0x1a0>
                    ipc_server_loop_cur_msg = IPCSESSION_MSG(&session_list[i]);
    11b8:	f9400b61 	ldr	x1, [x27, #16]
    11bc:	8b20c020 	add	x0, x1, w0, sxtw
    11c0:	f9000780 	str	x0, [x28, #8]
                while (ipc_server_loop_cur_msg->header.magic == IPC_MSG_MAGIC && ipc_server_loop_cur_msg->header.valid == 1 && ipc_server_loop_cur_msg->header.done == 0) {
    11c4:	b9400401 	ldr	w1, [x0, #4]
    11c8:	6b14003f 	cmp	w1, w20
    11cc:	54000421 	b.ne	1250 <ipc_server_loop+0x1a0>  // b.any
    11d0:	39400001 	ldrb	w1, [x0]
    11d4:	12000421 	and	w1, w1, #0x3
    11d8:	7100043f 	cmp	w1, #0x1
    11dc:	540003a1 	b.ne	1250 <ipc_server_loop+0x1a0>  // b.any
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    11e0:	29409761 	ldp	w1, w5, [x27, #4]
    11e4:	b9400f66 	ldr	w6, [x27, #12]
    11e8:	0b0100c2 	add	w2, w6, w1
    11ec:	4b050042 	sub	w2, w2, w5
    11f0:	1ac10c45 	sdiv	w5, w2, w1
    11f4:	1b0188a2 	msub	w2, w5, w1, w2
                    if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    11f8:	35000122 	cbnz	w2, 121c <ipc_server_loop+0x16c>
    11fc:	79400402 	ldrh	w2, [x0, #2]
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    1200:	6b01005f 	cmp	w2, w1
    1204:	5400056c 	b.gt	12b0 <ipc_server_loop+0x200>
        printf("forward tail with too much size\n");
        return -1;
    }
    session->tail = (session->tail + len) % session->capacity;
    1208:	0b060042 	add	w2, w2, w6
    120c:	1ac10c45 	sdiv	w5, w2, w1
    1210:	1b0188a2 	msub	w2, w5, w1, w2
    1214:	b9000f62 	str	w2, [x27, #12]
    1218:	37f801c2 	tbnz	w2, #31, 1250 <ipc_server_loop+0x1a0>
                    if (ipc_node->interfaces[ipc_server_loop_cur_msg->header.opcode]) {
    121c:	39400402 	ldrb	w2, [x0, #1]
    1220:	39400401 	ldrb	w1, [x0, #1]
    1224:	8b020e62 	add	x2, x19, x2, lsl #3
    1228:	f9400442 	ldr	x2, [x2, #8]
    122c:	b5fffa22 	cbnz	x2, 1170 <ipc_server_loop+0xc0>
                        printf("Unsupport opcode(%u) for server: %s\n", ipc_server_loop_cur_msg->header.opcode, ipc_node->name);
    1230:	f9400262 	ldr	x2, [x19]
    1234:	aa1603e0 	mov	x0, x22
    1238:	94000712 	bl	2e80 <printf>
                    if (session_forward_head(&session_list[i], ipc_server_loop_cur_msg->header.len) < 0) {
    123c:	f9400780 	ldr	x0, [x28, #8]
    1240:	17ffffd0 	b	1180 <ipc_server_loop+0xd0>
                            ipc_server_loop_cur_msg->header.delayed = 1;
    1244:	321d0021 	orr	w1, w1, #0x8
                            has_delayed = true;
    1248:	52800039 	mov	w25, #0x1                   	// #1
                            ipc_server_loop_cur_msg->header.delayed = 1;
    124c:	39000001 	strb	w1, [x0]
                cur_sess_id = -1;
    1250:	b90002b8 	str	w24, [x21]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    1254:	9100637b 	add	x27, x27, #0x18
                ipc_server_loop_cur_msg = NULL;
    1258:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    125c:	eb1b02ff 	cmp	x23, x27
    1260:	54fff701 	b.ne	1140 <ipc_server_loop+0x90>  // b.any
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    1264:	52000340 	eor	w0, w26, #0x1
    1268:	5280003a 	mov	w26, #0x1                   	// #1
    126c:	6a00033f 	tst	w25, w0
    1270:	54fff601 	b.ne	1130 <ipc_server_loop+0x80>  // b.any
    1274:	17ffffaa 	b	111c <ipc_server_loop+0x6c>
                    yield(SYS_TASK_YIELD_NO_REASON);
    1278:	94000806 	bl	3290 <yield>
        for (int repeat = 0; repeat <= 1 && has_delayed; repeat++) {
    127c:	52000340 	eor	w0, w26, #0x1
    1280:	5280003a 	mov	w26, #0x1                   	// #1
    1284:	6a00033f 	tst	w25, w0
    1288:	54fff541 	b.ne	1130 <ipc_server_loop+0x80>  // b.any
    128c:	17ffffa4 	b	111c <ipc_server_loop+0x6c>
        printf("forward head with too much size, session used size: %d\n", session_used_size(session));
    1290:	f94033e0 	ldr	x0, [sp, #96]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    1294:	9100637b 	add	x27, x27, #0x18
    1298:	940006fa 	bl	2e80 <printf>
                cur_sess_id = -1;
    129c:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    12a0:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    12a4:	eb1b02ff 	cmp	x23, x27
    12a8:	54fff4c1 	b.ne	1140 <ipc_server_loop+0x90>  // b.any
    12ac:	17ffffee 	b	1264 <ipc_server_loop+0x1b4>
        printf("forward tail with too much size\n");
    12b0:	f94037e0 	ldr	x0, [sp, #104]
    12b4:	9100637b 	add	x27, x27, #0x18
    12b8:	940006f2 	bl	2e80 <printf>
                cur_sess_id = -1;
    12bc:	b90002b8 	str	w24, [x21]
                ipc_server_loop_cur_msg = NULL;
    12c0:	f900079f 	str	xzr, [x28, #8]
            for (int i = 0; i < NR_MAX_SESSION; i++) {
    12c4:	eb1b02ff 	cmp	x23, x27
    12c8:	54fff3c1 	b.ne	1140 <ipc_server_loop+0x90>  // b.any
    12cc:	17ffffe6 	b	1264 <ipc_server_loop+0x1b4>

00000000000012d0 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    12d0:	aa0003e3 	mov	x3, x0
    12d4:	aa0103e0 	mov	x0, x1
    12d8:	2a0203e1 	mov	w1, w2
    return session(_path, _capacity, _session);
    12dc:	aa0303e2 	mov	x2, x3
    12e0:	14000804 	b	32f0 <session>
    12e4:	d503201f 	nop
    12e8:	d503201f 	nop
    12ec:	d503201f 	nop

00000000000012f0 <free_session>:
}

int free_session(struct Session* session)
{
    return close_session(session);
    12f0:	14000810 	b	3330 <close_session>
    12f4:	d503201f 	nop
    12f8:	d503201f 	nop
    12fc:	d503201f 	nop

0000000000001300 <session_alloc_buf>:
}

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    1300:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1304:	910003fd 	mov	x29, sp
    1308:	f90013f5 	str	x21, [sp, #32]
    if (len < 0 || len > session_remain_capacity(session)) {
    130c:	37f80561 	tbnz	w1, #31, 13b8 <session_alloc_buf+0xb8>
    1310:	a90153f3 	stp	x19, x20, [sp, #16]
    1314:	2a0103f4 	mov	w20, w1
    1318:	aa0003f3 	mov	x19, x0
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    131c:	29408801 	ldp	w1, w2, [x0, #4]
        return NULL;
    1320:	d2800015 	mov	x21, #0x0                   	// #0
    1324:	b9400c03 	ldr	w3, [x0, #12]
    1328:	0b030020 	add	w0, w1, w3
    132c:	4b020000 	sub	w0, w0, w2
    1330:	1ac10c02 	sdiv	w2, w0, w1
    1334:	1b018040 	msub	w0, w2, w1, w0
    return session->capacity - session_used_size(session);
    1338:	4b000021 	sub	w1, w1, w0
    if (len < 0 || len > session_remain_capacity(session)) {
    133c:	6b01029f 	cmp	w20, w1
    1340:	5400032c 	b.gt	13a4 <session_alloc_buf+0xa4>
    }
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    1344:	f9400a75 	ldr	x21, [x19, #16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    1348:	93407e82 	sxtw	x2, w20
    134c:	52800001 	mov	w1, #0x0                   	// #0
    void* buf = (void*)((uintptr_t)session->buf + session->tail);
    1350:	8b23c2b5 	add	x21, x21, w3, sxtw
    memset(buf, 0, len);
    1354:	aa1503e0 	mov	x0, x21
    1358:	94000bba 	bl	4240 <memset>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    135c:	29408e60 	ldp	w0, w3, [x19, #4]
    1360:	b9400e61 	ldr	w1, [x19, #12]
    1364:	0b010002 	add	w2, w0, w1
    1368:	4b030043 	sub	w3, w2, w3
    136c:	1ac00c62 	sdiv	w2, w3, w0
    1370:	1b008c42 	msub	w2, w2, w0, w3
    return session->capacity - session_used_size(session);
    1374:	4b020002 	sub	w2, w0, w2
    if (len > session_remain_capacity(session)) {
    1378:	6b02029f 	cmp	w20, w2
    137c:	5400028c 	b.gt	13cc <session_alloc_buf+0xcc>
    session->tail = (session->tail + len) % session->capacity;
    1380:	0b010294 	add	w20, w20, w1
    1384:	1ac00e81 	sdiv	w1, w20, w0
    1388:	1b00d034 	msub	w20, w1, w0, w20
    138c:	b9000e74 	str	w20, [x19, #12]
    return session->tail;
    1390:	a94153f3 	ldp	x19, x20, [sp, #16]
    session_forward_tail(session, len);
    return buf;
}
    1394:	aa1503e0 	mov	x0, x21
    1398:	f94013f5 	ldr	x21, [sp, #32]
    139c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    13a0:	d65f03c0 	ret
    13a4:	aa1503e0 	mov	x0, x21
    13a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    13ac:	f94013f5 	ldr	x21, [sp, #32]
    13b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    13b4:	d65f03c0 	ret
        return NULL;
    13b8:	d2800015 	mov	x21, #0x0                   	// #0
}
    13bc:	aa1503e0 	mov	x0, x21
    13c0:	f94013f5 	ldr	x21, [sp, #32]
    13c4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    13c8:	d65f03c0 	ret
        printf("forward tail with too much size\n");
    13cc:	d0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
    13d0:	913b8000 	add	x0, x0, #0xee0
    13d4:	940006ab 	bl	2e80 <printf>
        return -1;
    13d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    13dc:	17ffffee 	b	1394 <session_alloc_buf+0x94>

00000000000013e0 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    if (len < 0 || len > session_used_size(session)) {
    13e0:	37f80241 	tbnz	w1, #31, 1428 <session_free_buf+0x48>
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    13e4:	29409403 	ldp	w3, w5, [x0, #4]
    13e8:	aa0003e2 	mov	x2, x0
    13ec:	b9400c00 	ldr	w0, [x0, #12]
    13f0:	0b000060 	add	w0, w3, w0
    13f4:	4b050000 	sub	w0, w0, w5
    13f8:	1ac30c04 	sdiv	w4, w0, w3
    13fc:	1b038080 	msub	w0, w4, w3, w0
    1400:	6b00003f 	cmp	w1, w0
    1404:	5400012c 	b.gt	1428 <session_free_buf+0x48>
    session->head = (session->head + len) % session->capacity;
    1408:	0b050021 	add	w1, w1, w5
        return false;
    }
    assert(session_forward_head(session, len) != -1);
    return true;
    140c:	52800020 	mov	w0, #0x1                   	// #1
    1410:	1ac30c24 	sdiv	w4, w1, w3
    1414:	1b038481 	msub	w1, w4, w3, w1
    1418:	b9000841 	str	w1, [x2, #8]
    assert(session_forward_head(session, len) != -1);
    141c:	3100043f 	cmn	w1, #0x1
    1420:	54000080 	b.eq	1430 <session_free_buf+0x50>  // b.none
}
    1424:	d65f03c0 	ret
        return false;
    1428:	52800000 	mov	w0, #0x0                   	// #0
}
    142c:	d65f03c0 	ret
{
    1430:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    assert(session_forward_head(session, len) != -1);
    1434:	d0000043 	adrp	x3, b000 <_wcsnrtombs_l+0x130>
    1438:	d0000042 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
{
    143c:	910003fd 	mov	x29, sp
    assert(session_forward_head(session, len) != -1);
    1440:	d0000040 	adrp	x0, b000 <_wcsnrtombs_l+0x130>
    1444:	913e6063 	add	x3, x3, #0xf98
    1448:	913f6042 	add	x2, x2, #0xfd8
    144c:	913f2000 	add	x0, x0, #0xfc8
    1450:	52800801 	mov	w1, #0x40                  	// #64
    1454:	94000a47 	bl	3d70 <__assert_func>
    1458:	d503201f 	nop
    145c:	d503201f 	nop

0000000000001460 <init_uart_mmio>:
#ifndef CONFIG_SYS_NS16550_CLK
#define CONFIG_SYS_NS16550_CLK 0
#endif

bool init_uart_mmio()
{
    1460:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
            return false;
        }
        mapped = 1;
    }
    return true;
    1464:	52800020 	mov	w0, #0x1                   	// #1
{
    1468:	910003fd 	mov	x29, sp
    146c:	f9000bf3 	str	x19, [sp, #16]
    if (mapped == 0) {
    1470:	90000073 	adrp	x19, d000 <__global_locale+0x20>
    1474:	b949fa61 	ldr	w1, [x19, #2552]
    1478:	34000081 	cbz	w1, 1488 <init_uart_mmio+0x28>
}
    147c:	f9400bf3 	ldr	x19, [sp, #16]
    1480:	a8c27bfd 	ldp	x29, x30, [sp], #32
    1484:	d65f03c0 	ret
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
    1488:	2a0003e3 	mov	w3, w0
    148c:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
    1490:	52820002 	mov	w2, #0x1000                	// #4096
    1494:	aa0103e0 	mov	x0, x1
    1498:	940007de 	bl	3410 <mmap>
    149c:	3100041f 	cmn	w0, #0x1
            return false;
    14a0:	52800000 	mov	w0, #0x0                   	// #0
        if (-1 == mmap(UART_ADDR, UART_ADDR, 4096, true)) {
    14a4:	54fffec0 	b.eq	147c <init_uart_mmio+0x1c>  // b.none
        mapped = 1;
    14a8:	52800021 	mov	w1, #0x1                   	// #1
    return true;
    14ac:	2a0103e0 	mov	w0, w1
        mapped = 1;
    14b0:	b909fa61 	str	w1, [x19, #2552]
}
    14b4:	f9400bf3 	ldr	x19, [sp, #16]
    14b8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    14bc:	d65f03c0 	ret

00000000000014c0 <putc>:

void putc(char ch)
{
    14c0:	12001c00 	and	w0, w0, #0xff
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    if (ch == '\n') {
    14c4:	7100281f 	cmp	w0, #0xa
    14c8:	540000c0 	b.eq	14e0 <putc+0x20>  // b.none
    return in_le32(addr);
    14cc:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
    14d0:	b9401441 	ldr	w1, [x2, #20]
        putc('\r');
    }

    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
    14d4:	362fffe1 	tbz	w1, #5, 14d0 <putc+0x10>
    out_le32(addr, value);
    14d8:	b9000040 	str	w0, [x2]
        ;
    serial_dout(&com_port->thr, ch);
}
    14dc:	d65f03c0 	ret
    return in_le32(addr);
    14e0:	d2bfccc2 	mov	x2, #0xfe660000            	// #4268097536
    14e4:	d503201f 	nop
    14e8:	b9401441 	ldr	w1, [x2, #20]
    while (!(serial_din(&com_port->lsr) & UART_LSR_THRE))
    14ec:	362fffe1 	tbz	w1, #5, 14e8 <putc+0x28>
    out_le32(addr, value);
    14f0:	528001a1 	mov	w1, #0xd                   	// #13
    14f4:	b9000041 	str	w1, [x2]
}
    14f8:	17fffff5 	b	14cc <putc+0xc>
    14fc:	d503201f 	nop

0000000000001500 <getc>:
    return in_le32(addr);
    1500:	d2bfccc1 	mov	x1, #0xfe660000            	// #4268097536
    1504:	d503201f 	nop
    1508:	b9401420 	ldr	w0, [x1, #20]

char getc(void)
{
    static struct NS16550* com_port = (struct NS16550*)UART_ADDR;

    while (!(serial_din(&com_port->lsr) & UART_LSR_DR))
    150c:	3607ffe0 	tbz	w0, #0, 1508 <getc+0x8>
    return in_le32(addr);
    1510:	b9400020 	ldr	w0, [x1]
        ;

    return serial_din(&com_port->rbr);
    1514:	d65f03c0 	ret
    1518:	d503201f 	nop
    151c:	d503201f 	nop

0000000000001520 <_out_buffer>:
} out_fct_wrap_type;

// internal buffer output
static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
{
    if (idx < maxlen) {
    1520:	eb03005f 	cmp	x2, x3
{
    1524:	12001c00 	and	w0, w0, #0xff
    if (idx < maxlen) {
    1528:	54000042 	b.cs	1530 <_out_buffer+0x10>  // b.hs, b.nlast
        ((char*)buffer)[idx] = character;
    152c:	38226820 	strb	w0, [x1, x2]
    }
}
    1530:	d65f03c0 	ret
    1534:	d503201f 	nop
    1538:	d503201f 	nop
    153c:	d503201f 	nop

0000000000001540 <_out_null>:
{
    (void)character;
    (void)buffer;
    (void)idx;
    (void)maxlen;
}
    1540:	d65f03c0 	ret
    1544:	d503201f 	nop
    1548:	d503201f 	nop
    154c:	d503201f 	nop

0000000000001550 <_out_rev>:
    return i;
}

// output the specified string in reverse, taking care of any zero-padding
static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
{
    1550:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    1554:	910003fd 	mov	x29, sp
    1558:	a90153f3 	stp	x19, x20, [sp, #16]
    155c:	aa0503f3 	mov	x19, x5
    1560:	aa0203f4 	mov	x20, x2
    1564:	a9025bf5 	stp	x21, x22, [sp, #32]
    1568:	aa0003f5 	mov	x21, x0
    156c:	aa0103f6 	mov	x22, x1
    1570:	a90363f7 	stp	x23, x24, [sp, #48]
    1574:	aa0203f7 	mov	x23, x2
    1578:	aa0403f8 	mov	x24, x4
    157c:	a9046bf9 	stp	x25, x26, [sp, #64]
    1580:	2a0703fa 	mov	w26, w7
    1584:	2a0603f9 	mov	w25, w6
    1588:	a90573fb 	stp	x27, x28, [sp, #80]
    const size_t start_idx = idx;

    // pad spaces up to given width
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
    158c:	f240075f 	tst	x26, #0x3
{
    1590:	aa0303fb 	mov	x27, x3
    if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
    1594:	540001e1 	b.ne	15d0 <_out_rev+0x80>  // b.any
        for (size_t i = len; i < width; i++) {
    1598:	2a0603e0 	mov	w0, w6
    159c:	aa0203fc 	mov	x28, x2
    15a0:	cb050014 	sub	x20, x0, x5
    15a4:	eb0000bf 	cmp	x5, x0
    15a8:	8b020294 	add	x20, x20, x2
    15ac:	54000542 	b.cs	1654 <_out_rev+0x104>  // b.hs, b.nlast
            out(' ', buffer, idx++, maxlen);
    15b0:	aa1c03e2 	mov	x2, x28
    15b4:	aa1b03e3 	mov	x3, x27
    15b8:	9100079c 	add	x28, x28, #0x1
    15bc:	aa1603e1 	mov	x1, x22
    15c0:	52800400 	mov	w0, #0x20                  	// #32
    15c4:	d63f02a0 	blr	x21
        for (size_t i = len; i < width; i++) {
    15c8:	eb1c029f 	cmp	x20, x28
    15cc:	54ffff21 	b.ne	15b0 <_out_rev+0x60>  // b.any
        }
    }

    // reverse string
    while (len) {
    15d0:	8b14027c 	add	x28, x19, x20
    15d4:	b4000133 	cbz	x19, 15f8 <_out_rev+0xa8>
    15d8:	cb130382 	sub	x2, x28, x19
        out(buf[--len], buffer, idx++, maxlen);
    15dc:	d1000673 	sub	x19, x19, #0x1
    15e0:	aa1c03f4 	mov	x20, x28
    15e4:	aa1b03e3 	mov	x3, x27
    15e8:	aa1603e1 	mov	x1, x22
    15ec:	38736b00 	ldrb	w0, [x24, x19]
    15f0:	d63f02a0 	blr	x21
    while (len) {
    15f4:	b5ffff33 	cbnz	x19, 15d8 <_out_rev+0x88>
    }

    // append pad spaces up to given width
    if (flags & FLAGS_LEFT) {
    15f8:	360801fa 	tbz	w26, #1, 1634 <_out_rev+0xe4>
        while (idx - start_idx < width) {
    15fc:	cb170297 	sub	x23, x20, x23
    1600:	2a1903f9 	mov	w25, w25
    1604:	eb1902ff 	cmp	x23, x25
    1608:	54000162 	b.cs	1634 <_out_rev+0xe4>  // b.hs, b.nlast
    160c:	d503201f 	nop
            out(' ', buffer, idx++, maxlen);
    1610:	aa1403e2 	mov	x2, x20
        while (idx - start_idx < width) {
    1614:	910006f7 	add	x23, x23, #0x1
            out(' ', buffer, idx++, maxlen);
    1618:	aa1b03e3 	mov	x3, x27
    161c:	aa1603e1 	mov	x1, x22
    1620:	52800400 	mov	w0, #0x20                  	// #32
    1624:	d63f02a0 	blr	x21
    1628:	91000694 	add	x20, x20, #0x1
        while (idx - start_idx < width) {
    162c:	eb1902ff 	cmp	x23, x25
    1630:	54ffff03 	b.cc	1610 <_out_rev+0xc0>  // b.lo, b.ul, b.last
        }
    }

    return idx;
}
    1634:	aa1403e0 	mov	x0, x20
    1638:	a94153f3 	ldp	x19, x20, [sp, #16]
    163c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    1640:	a94363f7 	ldp	x23, x24, [sp, #48]
    1644:	a9446bf9 	ldp	x25, x26, [sp, #64]
    1648:	a94573fb 	ldp	x27, x28, [sp, #80]
    164c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    1650:	d65f03c0 	ret
        for (size_t i = len; i < width; i++) {
    1654:	aa0203f4 	mov	x20, x2
    1658:	17ffffde 	b	15d0 <_out_rev+0x80>
    165c:	d503201f 	nop

0000000000001660 <_ntoa_long>:
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
}

// internal itoa for 'long' type
static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
{
    1660:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1664:	aa0603eb 	mov	x11, x6
    1668:	aa0403e9 	mov	x9, x4
    166c:	910003fd 	mov	x29, sp
    1670:	b9403be8 	ldr	w8, [sp, #56]
    1674:	2a0703ef 	mov	w15, w7
    1678:	b94033e6 	ldr	w6, [sp, #48]
    167c:	12001cb2 	and	w18, w5, #0xff
    if (!value) {
        flags &= ~FLAGS_HASH;
    }

    // write if precision != 0 and value is != 0
    if (!(flags & FLAGS_PRECISION) || value) {
    1680:	12160110 	and	w16, w8, #0x400
    if (!value) {
    1684:	b5000c64 	cbnz	x4, 1810 <_ntoa_long+0x1b0>
        flags &= ~FLAGS_HASH;
    1688:	121b7907 	and	w7, w8, #0xffffffef
    if (!(flags & FLAGS_PRECISION) || value) {
    168c:	34000730 	cbz	w16, 1770 <_ntoa_long+0x110>
    if (!(flags & FLAGS_LEFT)) {
    1690:	121f0111 	and	w17, w8, #0x2
    1694:	37080fc8 	tbnz	w8, #1, 188c <_ntoa_long+0x22c>
    size_t len = 0U;
    1698:	d2800005 	mov	x5, #0x0                   	// #0
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    169c:	2a0f03e9 	mov	w9, w15
    16a0:	f1007cbf 	cmp	x5, #0x1f
    16a4:	910043e4 	add	x4, sp, #0x10
    16a8:	1a9f87ea 	cset	w10, ls  // ls = plast
    16ac:	eb05013f 	cmp	x9, x5
    16b0:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    16b4:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    16b8:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    16bc:	350009c6 	cbnz	w6, 17f4 <_ntoa_long+0x194>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    16c0:	34000108 	cbz	w8, 16e0 <_ntoa_long+0x80>
            buf[len++] = '0';
    16c4:	5280060a 	mov	w10, #0x30                  	// #48
    16c8:	910004a5 	add	x5, x5, #0x1
    16cc:	8b050088 	add	x8, x4, x5
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    16d0:	eb05013f 	cmp	x9, x5
    16d4:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
    16d8:	381ff10a 	sturb	w10, [x8, #-1]
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    16dc:	54ffff69 	b.ls	16c8 <_ntoa_long+0x68>  // b.plast
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    16e0:	340001cc 	cbz	w12, 1718 <_ntoa_long+0xb8>
    16e4:	f1007cbf 	cmp	x5, #0x1f
    16e8:	1a9f87ea 	cset	w10, ls  // ls = plast
    16ec:	7100015f 	cmp	w10, #0x0
    16f0:	2a0603e9 	mov	w9, w6
    16f4:	fa451120 	ccmp	x9, x5, #0x0, ne  // ne = any
    16f8:	54000109 	b.ls	1718 <_ntoa_long+0xb8>  // b.plast
            buf[len++] = '0';
    16fc:	5280060a 	mov	w10, #0x30                  	// #48
    1700:	910004a5 	add	x5, x5, #0x1
    1704:	8b050088 	add	x8, x4, x5
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1708:	eb05013f 	cmp	x9, x5
    170c:	fa5f88a2 	ccmp	x5, #0x1f, #0x2, hi  // hi = pmore
            buf[len++] = '0';
    1710:	381ff10a 	sturb	w10, [x8, #-1]
        while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1714:	54ffff69 	b.ls	1700 <_ntoa_long+0xa0>  // b.plast
    if (flags & FLAGS_HASH) {
    1718:	340001b1 	cbz	w17, 174c <_ntoa_long+0xec>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
    171c:	350008b0 	cbnz	w16, 1830 <_ntoa_long+0x1d0>
    1720:	b50007e5 	cbnz	x5, 181c <_ntoa_long+0x1bc>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1724:	f100417f 	cmp	x11, #0x10
    1728:	54000f20 	b.eq	190c <_ntoa_long+0x2ac>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    172c:	f100097f 	cmp	x11, #0x2
    1730:	54000f21 	b.ne	1914 <_ntoa_long+0x2b4>  // b.any
            buf[len++] = 'b';
    1734:	52800c48 	mov	w8, #0x62                  	// #98
    1738:	d2800025 	mov	x5, #0x1                   	// #1
    173c:	390043e8 	strb	w8, [sp, #16]
            buf[len++] = '0';
    1740:	52800608 	mov	w8, #0x30                  	// #48
    1744:	38256888 	strb	w8, [x4, x5]
    1748:	910004a5 	add	x5, x5, #0x1
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
    174c:	f10080bf 	cmp	x5, #0x20
    1750:	540000a0 	b.eq	1764 <_ntoa_long+0x104>  // b.none
        if (negative) {
    1754:	340008d2 	cbz	w18, 186c <_ntoa_long+0x20c>
            buf[len++] = '-';
    1758:	528005a8 	mov	w8, #0x2d                  	// #45
    175c:	38256888 	strb	w8, [x4, x5]
    1760:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    1764:	97ffff7b 	bl	1550 <_out_rev>
            value /= base;
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    }

    return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
}
    1768:	a8c37bfd 	ldp	x29, x30, [sp], #48
    176c:	d65f03c0 	ret
    if (!(flags & FLAGS_PRECISION) || value) {
    1770:	52800011 	mov	w17, #0x0                   	// #0
    1774:	f27b00ff 	tst	x7, #0x20
    1778:	52800c24 	mov	w4, #0x61                  	// #97
    177c:	5280082e 	mov	w14, #0x41                  	// #65
    1780:	1a8411ce 	csel	w14, w14, w4, ne  // ne = any
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    1784:	510029ce 	sub	w14, w14, #0xa
    1788:	910043e4 	add	x4, sp, #0x10
    178c:	d2800005 	mov	x5, #0x0                   	// #0
            const char digit = (char)(value % base);
    1790:	9acb092c 	udiv	x12, x9, x11
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    1794:	910004a5 	add	x5, x5, #0x1
    1798:	8b05008d 	add	x13, x4, x5
            const char digit = (char)(value % base);
    179c:	9b0ba58a 	msub	x10, x12, x11, x9
    17a0:	12001d48 	and	w8, w10, #0xff
            buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
    17a4:	f100255f 	cmp	x10, #0x9
    17a8:	1100c10a 	add	w10, w8, #0x30
    17ac:	0b0e0108 	add	w8, w8, w14
    17b0:	12001d4a 	and	w10, w10, #0xff
    17b4:	12001d08 	and	w8, w8, #0xff
    17b8:	1a8a8108 	csel	w8, w8, w10, hi  // hi = pmore
    17bc:	381ff1a8 	sturb	w8, [x13, #-1]
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    17c0:	eb0b013f 	cmp	x9, x11
            value /= base;
    17c4:	aa0c03e9 	mov	x9, x12
        } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
    17c8:	fa5f28a2 	ccmp	x5, #0x1f, #0x2, cs  // cs = hs, nlast
    17cc:	54fffe29 	b.ls	1790 <_ntoa_long+0x130>  // b.plast
    if (!(flags & FLAGS_LEFT)) {
    17d0:	370ffa47 	tbnz	w7, #1, 1718 <_ntoa_long+0xb8>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    17d4:	f1007cbf 	cmp	x5, #0x1f
    17d8:	2a0f03e9 	mov	w9, w15
    17dc:	1a9f87ea 	cset	w10, ls  // ls = plast
    17e0:	eb05013f 	cmp	x9, x5
    17e4:	1a9f97e8 	cset	w8, hi  // hi = pmore
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    17e8:	120000ec 	and	w12, w7, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    17ec:	0a080148 	and	w8, w10, w8
        if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    17f0:	34fff686 	cbz	w6, 16c0 <_ntoa_long+0x60>
    17f4:	3400048c 	cbz	w12, 1884 <_ntoa_long+0x224>
    17f8:	35000072 	cbnz	w18, 1804 <_ntoa_long+0x1a4>
    17fc:	721e04ff 	tst	w7, #0xc
    1800:	54000040 	b.eq	1808 <_ntoa_long+0x1a8>  // b.none
            width--;
    1804:	510004c6 	sub	w6, w6, #0x1
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1808:	35fff5e8 	cbnz	w8, 16c4 <_ntoa_long+0x64>
    180c:	17ffffb8 	b	16ec <_ntoa_long+0x8c>
    if (flags & FLAGS_HASH) {
    1810:	121c0111 	and	w17, w8, #0x10
    1814:	2a0803e7 	mov	w7, w8
    1818:	17ffffd7 	b	1774 <_ntoa_long+0x114>
        if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
    181c:	eb2f40bf 	cmp	x5, w15, uxtw
    1820:	54000480 	b.eq	18b0 <_ntoa_long+0x250>  // b.none
    1824:	eb2640bf 	cmp	x5, w6, uxtw
    1828:	54000440 	b.eq	18b0 <_ntoa_long+0x250>  // b.none
    182c:	d503201f 	nop
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1830:	f1007cbf 	cmp	x5, #0x1f
    1834:	1a9f87e8 	cset	w8, ls  // ls = plast
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1838:	f100417f 	cmp	x11, #0x10
    183c:	54000480 	b.eq	18cc <_ntoa_long+0x26c>  // b.none
        } else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1840:	7100011f 	cmp	w8, #0x0
    1844:	7a421960 	ccmp	w11, #0x2, #0x0, ne  // ne = any
    1848:	54000081 	b.ne	1858 <_ntoa_long+0x1f8>  // b.any
            buf[len++] = 'b';
    184c:	52800c48 	mov	w8, #0x62                  	// #98
    1850:	38256888 	strb	w8, [x4, x5]
    1854:	910004a5 	add	x5, x5, #0x1
        if (len < PRINTF_NTOA_BUFFER_SIZE) {
    1858:	f10080bf 	cmp	x5, #0x20
    185c:	54fff721 	b.ne	1740 <_ntoa_long+0xe0>  // b.any
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    1860:	97ffff3c 	bl	1550 <_out_rev>
}
    1864:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1868:	d65f03c0 	ret
        } else if (flags & FLAGS_PLUS) {
    186c:	37100167 	tbnz	w7, #2, 1898 <_ntoa_long+0x238>
        } else if (flags & FLAGS_SPACE) {
    1870:	361ff7a7 	tbz	w7, #3, 1764 <_ntoa_long+0x104>
            buf[len++] = ' ';
    1874:	52800408 	mov	w8, #0x20                  	// #32
    1878:	38256888 	strb	w8, [x4, x5]
    187c:	910004a5 	add	x5, x5, #0x1
    1880:	17ffffb9 	b	1764 <_ntoa_long+0x104>
        while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    1884:	35fff208 	cbnz	w8, 16c4 <_ntoa_long+0x64>
    1888:	17ffffa4 	b	1718 <_ntoa_long+0xb8>
    188c:	910043e4 	add	x4, sp, #0x10
    size_t len = 0U;
    1890:	d2800005 	mov	x5, #0x0                   	// #0
    1894:	17ffffb0 	b	1754 <_ntoa_long+0xf4>
            buf[len++] = '+'; // ignore the space if the '+' exists
    1898:	52800568 	mov	w8, #0x2b                  	// #43
    189c:	38256888 	strb	w8, [x4, x5]
    18a0:	910004a5 	add	x5, x5, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    18a4:	97ffff2b 	bl	1550 <_out_rev>
}
    18a8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    18ac:	d65f03c0 	ret
            if (len && (base == 16U)) {
    18b0:	f10004aa 	subs	x10, x5, #0x1
                len--;
    18b4:	d10008a5 	sub	x5, x5, #0x2
            if (len && (base == 16U)) {
    18b8:	1a9f07e8 	cset	w8, ne  // ne = any
    18bc:	7100417f 	cmp	w11, #0x10
    18c0:	1a9f17e9 	cset	w9, eq  // eq = none
    18c4:	6a090108 	ands	w8, w8, w9
    18c8:	54000160 	b.eq	18f4 <_ntoa_long+0x294>  // b.none
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    18cc:	721b00e9 	ands	w9, w7, #0x20
    18d0:	7a400904 	ccmp	w8, #0x0, #0x4, eq  // eq = none
    18d4:	54000141 	b.ne	18fc <_ntoa_long+0x29c>  // b.any
        } else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    18d8:	7100013f 	cmp	w9, #0x0
    18dc:	7a401904 	ccmp	w8, #0x0, #0x4, ne  // ne = any
    18e0:	54fffbc0 	b.eq	1858 <_ntoa_long+0x1f8>  // b.none
            buf[len++] = 'X';
    18e4:	52800b08 	mov	w8, #0x58                  	// #88
    18e8:	38256888 	strb	w8, [x4, x5]
    18ec:	910004a5 	add	x5, x5, #0x1
    18f0:	17ffffda 	b	1858 <_ntoa_long+0x1f8>
            len--;
    18f4:	aa0a03e5 	mov	x5, x10
    18f8:	17ffffce 	b	1830 <_ntoa_long+0x1d0>
            buf[len++] = 'x';
    18fc:	52800f08 	mov	w8, #0x78                  	// #120
    1900:	38256888 	strb	w8, [x4, x5]
    1904:	910004a5 	add	x5, x5, #0x1
    1908:	17ffffd4 	b	1858 <_ntoa_long+0x1f8>
        if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
    190c:	52800028 	mov	w8, #0x1                   	// #1
    1910:	17ffffef 	b	18cc <_ntoa_long+0x26c>
            buf[len++] = '0';
    1914:	52800608 	mov	w8, #0x30                  	// #48
    1918:	d2800025 	mov	x5, #0x1                   	// #1
    191c:	390043e8 	strb	w8, [sp, #16]
    if (len < PRINTF_NTOA_BUFFER_SIZE) {
    1920:	17ffff8d 	b	1754 <_ntoa_long+0xf4>
    1924:	d503201f 	nop
    1928:	d503201f 	nop
    192c:	d503201f 	nop

0000000000001930 <_etoa>:
}

#if defined(PRINTF_SUPPORT_EXPONENTIAL)
// internal ftoa variant for exponential floating-point type, contributed by Martijn Jasperse <m.jasperse@gmail.com>
static size_t _etoa(out_fct_type out, char* buffer, size_t idx, size_t maxlen, double value, unsigned int prec, unsigned int width, unsigned int flags)
{
    1930:	d10203ff 	sub	sp, sp, #0x80
    // check for NaN and special values
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
    1934:	1e602000 	fcmp	d0, d0
{
    1938:	a9017bfd 	stp	x29, x30, [sp, #16]
    193c:	910043fd 	add	x29, sp, #0x10
    1940:	a90253f3 	stp	x19, x20, [sp, #32]
    1944:	aa0203f3 	mov	x19, x2
    1948:	2a0603f4 	mov	w20, w6
    194c:	a9035bf5 	stp	x21, x22, [sp, #48]
    1950:	2a0503f6 	mov	w22, w5
    1954:	a90463f7 	stp	x23, x24, [sp, #64]
    1958:	aa0003f7 	mov	x23, x0
    195c:	a9056bf9 	stp	x25, x26, [sp, #80]
    1960:	aa0103f9 	mov	x25, x1
    1964:	a90673fb 	stp	x27, x28, [sp, #96]
    1968:	aa0303fb 	mov	x27, x3
    if ((value != value) || (value > DBL_MAX) || (value < -DBL_MAX)) {
    196c:	54001361 	b.ne	1bd8 <_etoa+0x2a8>  // b.any
    1970:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
    1974:	9e670001 	fmov	d1, x0
    1978:	1e612010 	fcmpe	d0, d1
    197c:	540012ec 	b.gt	1bd8 <_etoa+0x2a8>
    1980:	92e00200 	mov	x0, #0xffefffffffffffff    	// #-4503599627370497
    1984:	9e670001 	fmov	d1, x0
    1988:	1e612010 	fcmpe	d0, d1
    198c:	54001264 	b.mi	1bd8 <_etoa+0x2a8>  // b.first
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    }

    // determine the sign
    const bool negative = value < 0;
    if (negative) {
    1990:	1e602018 	fcmpe	d0, #0.0
    1994:	1e614007 	fneg	d7, d0

    conv.F = value;
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    // now approximate log10 from the log2 integer part and an expansion of ln around 1.5
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    1998:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    199c:	fd409017 	ldr	d23, [x0, #288]
    19a0:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    19a4:	fd409401 	ldr	d1, [x0, #296]
    19a8:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    19ac:	fd409816 	ldr	d22, [x0, #304]
    19b0:	1e604ce7 	fcsel	d7, d7, d0, mi  // mi = first
    // now we want to compute 10^expval but we want to be sure it won't overflow
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    19b4:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    19b8:	fd409c06 	ldr	d6, [x0, #312]
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    19bc:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    19c0:	fd40a015 	ldr	d21, [x0, #320]
    19c4:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    19c8:	fd40a414 	ldr	d20, [x0, #328]
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    19cc:	1e6f1018 	fmov	d24, #1.500000000000000000e+00
    conv.F = value;
    19d0:	9e6600e1 	fmov	x1, d7
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    19d4:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    const double z2 = z * z;
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    // compute exp(z) using continued fractions, see https://en.wikipedia.org/wiki/Exponential_function#Continued_fractions_for_ex
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
    19d8:	1e659002 	fmov	d2, #1.400000000000000000e+01
    19dc:	1e649011 	fmov	d17, #1.000000000000000000e+01
    19e0:	1e631013 	fmov	d19, #6.000000000000000000e+00
    19e4:	1e601010 	fmov	d16, #2.000000000000000000e+00
    19e8:	1e6e1012 	fmov	d18, #1.000000000000000000e+00
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    19ec:	721600c3 	ands	w3, w6, #0x400
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    19f0:	9240cc20 	and	x0, x1, #0xfffffffffffff
    int exp2 = (int)((conv.U >> 52U) & 0x07FFU) - 1023; // effectively log2
    19f4:	d374f821 	ubfx	x1, x1, #52, #11
    19f8:	510ffc21 	sub	w1, w1, #0x3ff
    conv.U = (conv.U & ((1ULL << 52U) - 1U)) | (1023ULL << 52U); // drop the exponent so conv.F is now in [1,2)
    19fc:	b24c2400 	orr	x0, x0, #0x3ff0000000000000
    1a00:	9e670005 	fmov	d5, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    1a04:	528000c2 	mov	w2, #0x6                   	// #6
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    1a08:	1e620024 	scvtf	d4, w1
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    1a0c:	1a821084 	csel	w4, w4, w2, ne  // ne = any
    int expval = (int)(0.1760912590558 + exp2 * 0.301029995663981 + (conv.F - 1.5) * 0.289529654602168);
    1a10:	1e7838a5 	fsub	d5, d5, d24
    1a14:	1e770884 	fmul	d4, d4, d23
    1a18:	1e7608a5 	fmul	d5, d5, d22
    1a1c:	1e612884 	fadd	d4, d4, d1
    1a20:	1e652884 	fadd	d4, d4, d5
    1a24:	1e780098 	fcvtzs	w24, d4
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    1a28:	1e620301 	scvtf	d1, w24
    1a2c:	1e660824 	fmul	d4, d1, d6
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    1a30:	1e750821 	fmul	d1, d1, d21
    exp2 = (int)(expval * 3.321928094887362 + 0.5);
    1a34:	1e632884 	fadd	d4, d4, d3
    1a38:	1e780080 	fcvtzs	w0, d4
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    1a3c:	1e620003 	scvtf	d3, w0
    conv.U = (uint64_t)(exp2 + 1023) << 52U;
    1a40:	110ffc00 	add	w0, w0, #0x3ff
    1a44:	9e670004 	fmov	d4, x0
    1a48:	5f745484 	shl	d4, d4, #52
    const double z = expval * 2.302585092994046 - exp2 * 0.6931471805599453;
    1a4c:	1e740863 	fmul	d3, d3, d20
    1a50:	1e633821 	fsub	d1, d1, d3
    const double z2 = z * z;
    1a54:	1e610823 	fmul	d3, d1, d1
    conv.F *= 1 + 2 * z / (2 - z + (z2 / (6 + (z2 / (10 + z2 / 14)))));
    1a58:	1e613a05 	fsub	d5, d16, d1
    1a5c:	1e612821 	fadd	d1, d1, d1
    1a60:	1e621862 	fdiv	d2, d3, d2
    1a64:	1e712842 	fadd	d2, d2, d17
    1a68:	1e621862 	fdiv	d2, d3, d2
    1a6c:	1e732842 	fadd	d2, d2, d19
    1a70:	1e621863 	fdiv	d3, d3, d2
    1a74:	1e652863 	fadd	d3, d3, d5
    1a78:	1e631821 	fdiv	d1, d1, d3
    1a7c:	1e722821 	fadd	d1, d1, d18
    1a80:	1e640821 	fmul	d1, d1, d4
    // correct for rounding errors
    if (value < conv.F) {
    1a84:	1e672030 	fcmpe	d1, d7
    1a88:	54000c4c 	b.gt	1c10 <_etoa+0x2e0>
        expval--;
        conv.F /= 10;
    }

    // the exponent format is "%+03d" and largest value is "307", so set aside 4-5 characters
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
    1a8c:	11018f00 	add	w0, w24, #0x63
    1a90:	7103181f 	cmp	w0, #0xc6
    1a94:	1a9f97fc 	cset	w28, hi  // hi = pmore
    1a98:	1100139c 	add	w28, w28, #0x4

    // in "%g" mode, "prec" is the number of *significant figures* not decimals
    if (flags & FLAGS_ADAPT_EXP) {
    1a9c:	36580134 	tbz	w20, #11, 1ac0 <_etoa+0x190>
        // do we want to fall-back to "%f" mode?
        if ((value >= 1e-4) && (value < 1e6)) {
    1aa0:	f0000040 	adrp	x0, c000 <__func__.0+0x28>
    1aa4:	fd40a802 	ldr	d2, [x0, #336]
    1aa8:	1e6220f0 	fcmpe	d7, d2
    1aac:	54000d2a 	b.ge	1c50 <_etoa+0x320>  // b.tcont
            // no characters in exponent
            minwidth = 0U;
            expval = 0;
        } else {
            // we use one sigfig for the whole part
            if ((prec > 0) && (flags & FLAGS_PRECISION)) {
    1ab0:	34000084 	cbz	w4, 1ac0 <_etoa+0x190>
                --prec;
    1ab4:	7100007f 	cmp	w3, #0x0
    1ab8:	1a9f07e0 	cset	w0, ne  // ne = any
    1abc:	4b000084 	sub	w4, w4, w0

    // will everything fit?
    unsigned int fwidth = width;
    if (width > minwidth) {
        // we didn't fall-back so subtract the characters required for the exponent
        fwidth -= minwidth;
    1ac0:	6b16039f 	cmp	w28, w22
    } else {
        // not enough characters, so go back to default sizing
        fwidth = 0U;
    }
    if ((flags & FLAGS_LEFT) && minwidth) {
    1ac4:	121f0280 	and	w0, w20, #0x2
        fwidth -= minwidth;
    1ac8:	4b1c02c5 	sub	w5, w22, w28
    1acc:	5280003a 	mov	w26, #0x1                   	// #1
    1ad0:	1a9f30a5 	csel	w5, w5, wzr, cc  // cc = lo, ul, last
    if ((flags & FLAGS_LEFT) && minwidth) {
    1ad4:	7100001f 	cmp	w0, #0x0
    1ad8:	1a9f07e0 	cset	w0, ne  // ne = any
    1adc:	b9007fe0 	str	w0, [sp, #124]
    1ae0:	1a9f00a5 	csel	w5, w5, wzr, eq  // eq = none
        // if we're padding on the right, DON'T pad the floating part
        fwidth = 0U;
    }

    // rescale the float value
    if (expval) {
    1ae4:	34000058 	cbz	w24, 1aec <_etoa+0x1bc>
        value /= conv.F;
    1ae8:	1e6118e7 	fdiv	d7, d7, d1
    }

    // output the floating part
    const size_t start_idx = idx;
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    1aec:	1e602018 	fcmpe	d0, #0.0
    1af0:	54000ac4 	b.mi	1c48 <_etoa+0x318>  // b.first
    1af4:	1e6040e0 	fmov	d0, d7
    1af8:	12147a86 	and	w6, w20, #0xfffff7ff
    1afc:	aa1b03e3 	mov	x3, x27
    1b00:	aa1303e2 	mov	x2, x19
    1b04:	aa1903e1 	mov	x1, x25
    1b08:	aa1703e0 	mov	x0, x23
    1b0c:	94000071 	bl	1cd0 <_ftoa>
    1b10:	aa0003f5 	mov	x21, x0

    // output the exponent part
    if (minwidth) {
    1b14:	3400051a 	cbz	w26, 1bb4 <_etoa+0x284>
        // output the exponential symbol
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
    1b18:	f27b029f 	tst	x20, #0x20
    1b1c:	528008a1 	mov	w1, #0x45                  	// #69
    1b20:	aa1503e2 	mov	x2, x21
    1b24:	aa1b03e3 	mov	x3, x27
    1b28:	52800ca0 	mov	w0, #0x65                  	// #101
    1b2c:	1a801020 	csel	w0, w1, w0, ne  // ne = any
    1b30:	aa1903e1 	mov	x1, x25
    1b34:	d63f02e0 	blr	x23
        // output the exponent value
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
    1b38:	7100031f 	cmp	w24, #0x0
    1b3c:	528000a0 	mov	w0, #0x5                   	// #5
    1b40:	5a98a704 	cneg	w4, w24, lt  // lt = tstop
    1b44:	5100079c 	sub	w28, w28, #0x1
    1b48:	b90003fc 	str	w28, [sp]
        out((flags & FLAGS_UPPERCASE) ? 'E' : 'e', buffer, idx++, maxlen);
    1b4c:	910006a2 	add	x2, x21, #0x1
        idx = _ntoa_long(out, buffer, idx, maxlen, (expval < 0) ? -expval : expval, expval < 0, 10, 0, minwidth - 1, FLAGS_ZEROPAD | FLAGS_PLUS);
    1b50:	b9000be0 	str	w0, [sp, #8]
    1b54:	93407c84 	sxtw	x4, w4
    1b58:	531f7f05 	lsr	w5, w24, #31
    1b5c:	aa1b03e3 	mov	x3, x27
    1b60:	aa1903e1 	mov	x1, x25
    1b64:	aa1703e0 	mov	x0, x23
    1b68:	52800007 	mov	w7, #0x0                   	// #0
    1b6c:	d2800146 	mov	x6, #0xa                   	// #10
    1b70:	97fffebc 	bl	1660 <_ntoa_long>
    1b74:	aa0003f5 	mov	x21, x0
        // might need to right-pad spaces
        if (flags & FLAGS_LEFT) {
    1b78:	b9407fe0 	ldr	w0, [sp, #124]
    1b7c:	340001c0 	cbz	w0, 1bb4 <_etoa+0x284>
            while (idx - start_idx < width)
    1b80:	cb1302b3 	sub	x19, x21, x19
    1b84:	eb1302df 	cmp	x22, x19
    1b88:	54000169 	b.ls	1bb4 <_etoa+0x284>  // b.plast
    1b8c:	d503201f 	nop
                out(' ', buffer, idx++, maxlen);
    1b90:	aa1503e2 	mov	x2, x21
            while (idx - start_idx < width)
    1b94:	91000673 	add	x19, x19, #0x1
                out(' ', buffer, idx++, maxlen);
    1b98:	aa1b03e3 	mov	x3, x27
    1b9c:	aa1903e1 	mov	x1, x25
    1ba0:	52800400 	mov	w0, #0x20                  	// #32
    1ba4:	d63f02e0 	blr	x23
    1ba8:	910006b5 	add	x21, x21, #0x1
            while (idx - start_idx < width)
    1bac:	eb1302df 	cmp	x22, x19
    1bb0:	54ffff08 	b.hi	1b90 <_etoa+0x260>  // b.pmore
        }
    }
    return idx;
}
    1bb4:	aa1503e0 	mov	x0, x21
    1bb8:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1bbc:	a94253f3 	ldp	x19, x20, [sp, #32]
    1bc0:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1bc4:	a94463f7 	ldp	x23, x24, [sp, #64]
    1bc8:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1bcc:	a94673fb 	ldp	x27, x28, [sp, #96]
    1bd0:	910203ff 	add	sp, sp, #0x80
    1bd4:	d65f03c0 	ret
        return _ftoa(out, buffer, idx, maxlen, value, prec, width, flags);
    1bd8:	2a1403e6 	mov	w6, w20
    1bdc:	2a1603e5 	mov	w5, w22
    1be0:	aa1b03e3 	mov	x3, x27
    1be4:	aa1303e2 	mov	x2, x19
    1be8:	aa1903e1 	mov	x1, x25
    1bec:	aa1703e0 	mov	x0, x23
}
    1bf0:	a9417bfd 	ldp	x29, x30, [sp, #16]
    1bf4:	a94253f3 	ldp	x19, x20, [sp, #32]
    1bf8:	a9435bf5 	ldp	x21, x22, [sp, #48]
    1bfc:	a94463f7 	ldp	x23, x24, [sp, #64]
    1c00:	a9456bf9 	ldp	x25, x26, [sp, #80]
    1c04:	a94673fb 	ldp	x27, x28, [sp, #96]
    1c08:	910203ff 	add	sp, sp, #0x80
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    1c0c:	14000031 	b	1cd0 <_ftoa>
        conv.F /= 10;
    1c10:	1e711821 	fdiv	d1, d1, d17
        expval--;
    1c14:	51000718 	sub	w24, w24, #0x1
    unsigned int minwidth = ((expval < 100) && (expval > -100)) ? 4U : 5U;
    1c18:	11018f00 	add	w0, w24, #0x63
    1c1c:	7103181f 	cmp	w0, #0xc6
    1c20:	1a9f97fc 	cset	w28, hi  // hi = pmore
    1c24:	1100139c 	add	w28, w28, #0x4
    if (flags & FLAGS_ADAPT_EXP) {
    1c28:	365ff4d4 	tbz	w20, #11, 1ac0 <_etoa+0x190>
    1c2c:	17ffff9d 	b	1aa0 <_etoa+0x170>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    1c30:	2a0003f4 	mov	w20, w0
        fwidth = 0U;
    1c34:	52800005 	mov	w5, #0x0                   	// #0
            minwidth = 0U;
    1c38:	5280001c 	mov	w28, #0x0                   	// #0
            expval = 0;
    1c3c:	52800018 	mov	w24, #0x0                   	// #0
    if ((flags & FLAGS_LEFT) && minwidth) {
    1c40:	5280001a 	mov	w26, #0x0                   	// #0
    1c44:	b9007fff 	str	wzr, [sp, #124]
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    1c48:	1e6140e7 	fneg	d7, d7
    1c4c:	17ffffaa 	b	1af4 <_etoa+0x1c4>
        if ((value >= 1e-4) && (value < 1e6)) {
    1c50:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    1c54:	f2e825c0 	movk	x0, #0x412e, lsl #48
    1c58:	9e670002 	fmov	d2, x0
    1c5c:	1e6220f0 	fcmpe	d7, d2
    1c60:	54000044 	b.mi	1c68 <_etoa+0x338>  // b.first
    1c64:	17ffff93 	b	1ab0 <_etoa+0x180>
                prec = (unsigned)((int)prec - expval - 1);
    1c68:	6b180080 	subs	w0, w4, w24
    1c6c:	51000404 	sub	w4, w0, #0x1
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    1c70:	32160280 	orr	w0, w20, #0x400
                prec = (unsigned)((int)prec - expval - 1);
    1c74:	1a9fc084 	csel	w4, w4, wzr, gt
    if (width > minwidth) {
    1c78:	35000196 	cbnz	w22, 1ca8 <_etoa+0x378>
    idx = _ftoa(out, buffer, idx, maxlen, negative ? -value : value, prec, fwidth, flags & ~FLAGS_ADAPT_EXP);
    1c7c:	1e602018 	fcmpe	d0, #0.0
    1c80:	54fffd84 	b.mi	1c30 <_etoa+0x300>  // b.first
    1c84:	12147a86 	and	w6, w20, #0xfffff7ff
    1c88:	1e6040e0 	fmov	d0, d7
    1c8c:	321600c6 	orr	w6, w6, #0x400
    1c90:	aa1b03e3 	mov	x3, x27
    1c94:	aa1303e2 	mov	x2, x19
    1c98:	aa1903e1 	mov	x1, x25
    1c9c:	aa1703e0 	mov	x0, x23
    1ca0:	52800005 	mov	w5, #0x0                   	// #0
    1ca4:	17ffffd3 	b	1bf0 <_etoa+0x2c0>
            flags |= FLAGS_PRECISION; // make sure _ftoa respects precision
    1ca8:	2a0003f4 	mov	w20, w0
    if (width > minwidth) {
    1cac:	2a1603e5 	mov	w5, w22
    1cb0:	5280001a 	mov	w26, #0x0                   	// #0
    1cb4:	52800018 	mov	w24, #0x0                   	// #0
            minwidth = 0U;
    1cb8:	5280001c 	mov	w28, #0x0                   	// #0
    if (width > minwidth) {
    1cbc:	b9007fff 	str	wzr, [sp, #124]
    1cc0:	17ffff8b 	b	1aec <_etoa+0x1bc>
    1cc4:	d503201f 	nop
    1cc8:	d503201f 	nop
    1ccc:	d503201f 	nop

0000000000001cd0 <_ftoa>:
    if (value != value)
    1cd0:	1e602000 	fcmp	d0, d0
{
    1cd4:	2a0603e7 	mov	w7, w6
    if (value != value)
    1cd8:	54000e01 	b.ne	1e98 <_ftoa+0x1c8>  // b.any
    if (value < -DBL_MAX)
    1cdc:	92e00206 	mov	x6, #0xffefffffffffffff    	// #-4503599627370497
    1ce0:	9e6700c1 	fmov	d1, x6
    1ce4:	1e612010 	fcmpe	d0, d1
    1ce8:	54001184 	b.mi	1f18 <_ftoa+0x248>  // b.first
    1cec:	aa0003ef 	mov	x15, x0
    if (value > DBL_MAX)
    1cf0:	92f00200 	mov	x0, #0x7fefffffffffffff    	// #9218868437227405311
    1cf4:	9e670001 	fmov	d1, x0
    1cf8:	aa0103f0 	mov	x16, x1
    1cfc:	aa0203f1 	mov	x17, x2
    1d00:	aa0303f2 	mov	x18, x3
    1d04:	1e612010 	fcmpe	d0, d1
    1d08:	54000b2c 	b.gt	1e6c <_ftoa+0x19c>
    if ((value > PRINTF_MAX_FLOAT) || (value < -PRINTF_MAX_FLOAT)) {
    1d0c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    1d10:	f2e839a0 	movk	x0, #0x41cd, lsl #48
    1d14:	9e670001 	fmov	d1, x0
    1d18:	1e612010 	fcmpe	d0, d1
    1d1c:	54000f2c 	b.gt	1f00 <_ftoa+0x230>
    1d20:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    1d24:	f2f839a0 	movk	x0, #0xc1cd, lsl #48
    1d28:	9e670001 	fmov	d1, x0
    1d2c:	1e612010 	fcmpe	d0, d1
    1d30:	54000e84 	b.mi	1f00 <_ftoa+0x230>  // b.first
    if (value < 0) {
    1d34:	1e602018 	fcmpe	d0, #0.0
{
    1d38:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    1d3c:	910003fd 	mov	x29, sp
    if (value < 0) {
    1d40:	54000ca4 	b.mi	1ed4 <_ftoa+0x204>  // b.first
    bool negative = false;
    1d44:	52800003 	mov	w3, #0x0                   	// #0
    if (!(flags & FLAGS_PRECISION)) {
    1d48:	36500ce7 	tbz	w7, #10, 1ee4 <_ftoa+0x214>
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    1d4c:	7100249f 	cmp	w4, #0x9
    1d50:	910043ec 	add	x12, sp, #0x10
    1d54:	d2800008 	mov	x8, #0x0                   	// #0
        buf[len++] = '0';
    1d58:	52800601 	mov	w1, #0x30                  	// #48
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    1d5c:	54001929 	b.ls	2080 <_ftoa+0x3b0>  // b.plast
        buf[len++] = '0';
    1d60:	91000508 	add	x8, x8, #0x1
        prec--;
    1d64:	51000484 	sub	w4, w4, #0x1
        buf[len++] = '0';
    1d68:	8b080180 	add	x0, x12, x8
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    1d6c:	f1007d1f 	cmp	x8, #0x1f
    1d70:	7a499880 	ccmp	w4, #0x9, #0x0, ls  // ls = plast
        buf[len++] = '0';
    1d74:	381ff001 	sturb	w1, [x0, #-1]
    while ((len < PRINTF_FTOA_BUFFER_SIZE) && (prec > 9U)) {
    1d78:	54ffff48 	b.hi	1d60 <_ftoa+0x90>  // b.pmore
    1d7c:	d2d9aca0 	mov	x0, #0xcd6500000000        	// #225833675390976
    1d80:	f2e839a0 	movk	x0, #0x41cd, lsl #48
    1d84:	9e670002 	fmov	d2, x0
    int whole = (int)value;
    1d88:	1e78000a 	fcvtzs	w10, d0
    if (diff > 0.5) {
    1d8c:	1e6c1003 	fmov	d3, #5.000000000000000000e-01
    double tmp = (value - whole) * pow10[prec];
    1d90:	1e620141 	scvtf	d1, w10
    1d94:	1e613801 	fsub	d1, d0, d1
    1d98:	1e620821 	fmul	d1, d1, d2
    unsigned long frac = (unsigned long)tmp;
    1d9c:	9e79002e 	fcvtzu	x14, d1
    diff = tmp - frac;
    1da0:	9e6301c4 	ucvtf	d4, x14
    1da4:	1e643821 	fsub	d1, d1, d4
    if (diff > 0.5) {
    1da8:	1e632030 	fcmpe	d1, d3
    1dac:	5400112c 	b.gt	1fd0 <_ftoa+0x300>
    } else if (diff < 0.5) {
    1db0:	54000084 	b.mi	1dc0 <_ftoa+0xf0>  // b.first
    } else if ((frac == 0U) || (frac & 1U)) {
    1db4:	b500154e 	cbnz	x14, 205c <_ftoa+0x38c>
        ++frac;
    1db8:	910005ce 	add	x14, x14, #0x1
    1dbc:	d503201f 	nop
    if (prec == 0U) {
    1dc0:	35000b64 	cbnz	w4, 1f2c <_ftoa+0x25c>
        diff = value - (double)whole;
    1dc4:	1e620141 	scvtf	d1, w10
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1dc8:	1e6c1002 	fmov	d2, #5.000000000000000000e-01
        diff = value - (double)whole;
    1dcc:	1e613800 	fsub	d0, d0, d1
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    1dd0:	1e622010 	fcmpe	d0, d2
    1dd4:	540011a4 	b.mi	2008 <_ftoa+0x338>  // b.first
            ++whole;
    1dd8:	12000140 	and	w0, w10, #0x1
    1ddc:	0b00014a 	add	w10, w10, w0
        buf[len++] = (char)(48 + (whole % 10));
    1de0:	528ccce1 	mov	w1, #0x6667                	// #26215
    1de4:	72acccc1 	movk	w1, #0x6666, lsl #16
    1de8:	52800142 	mov	w2, #0xa                   	// #10
    1dec:	d503201f 	nop
    1df0:	9b217d49 	smull	x9, w10, w1
    while (len < PRINTF_FTOA_BUFFER_SIZE) {
    1df4:	f100811f 	cmp	x8, #0x20
    1df8:	54000c20 	b.eq	1f7c <_ftoa+0x2ac>  // b.none
        buf[len++] = (char)(48 + (whole % 10));
    1dfc:	9362fd29 	asr	x9, x9, #34
    1e00:	91000508 	add	x8, x8, #0x1
    1e04:	4b8a7d29 	sub	w9, w9, w10, asr #31
    1e08:	8b080180 	add	x0, x12, x8
    1e0c:	1b02a92b 	msub	w11, w9, w2, w10
        if (!(whole /= 10)) {
    1e10:	2a0903ea 	mov	w10, w9
        buf[len++] = (char)(48 + (whole % 10));
    1e14:	1100c169 	add	w9, w11, #0x30
    1e18:	381ff009 	sturb	w9, [x0, #-1]
        if (!(whole /= 10)) {
    1e1c:	35fffeaa 	cbnz	w10, 1df0 <_ftoa+0x120>
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    1e20:	120004e0 	and	w0, w7, #0x3
    1e24:	7100041f 	cmp	w0, #0x1
    1e28:	54000b00 	b.eq	1f88 <_ftoa+0x2b8>  // b.none
    if (len < PRINTF_FTOA_BUFFER_SIZE) {
    1e2c:	f1007d1f 	cmp	x8, #0x1f
    1e30:	540000a8 	b.hi	1e44 <_ftoa+0x174>  // b.pmore
        if (negative) {
    1e34:	34000de3 	cbz	w3, 1ff0 <_ftoa+0x320>
            buf[len++] = '-';
    1e38:	528005a0 	mov	w0, #0x2d                  	// #45
    1e3c:	38286980 	strb	w0, [x12, x8]
    1e40:	91000508 	add	x8, x8, #0x1
    return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
    1e44:	2a0503e6 	mov	w6, w5
    1e48:	aa0c03e4 	mov	x4, x12
    1e4c:	aa0803e5 	mov	x5, x8
    1e50:	aa1203e3 	mov	x3, x18
    1e54:	aa1103e2 	mov	x2, x17
    1e58:	aa1003e1 	mov	x1, x16
    1e5c:	aa0f03e0 	mov	x0, x15
    1e60:	97fffdbc 	bl	1550 <_out_rev>
}
    1e64:	a8c37bfd 	ldp	x29, x30, [sp], #48
    1e68:	d65f03c0 	ret
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    1e6c:	37100207 	tbnz	w7, #2, 1eac <_ftoa+0x1dc>
    1e70:	d2800060 	mov	x0, #0x3                   	// #3
    1e74:	2a0503e6 	mov	w6, w5
    1e78:	d0000044 	adrp	x4, b000 <_wcsnrtombs_l+0x130>
    1e7c:	913fc084 	add	x4, x4, #0xff0
    1e80:	aa0003e5 	mov	x5, x0
    1e84:	aa1203e3 	mov	x3, x18
    1e88:	aa1103e2 	mov	x2, x17
    1e8c:	aa1003e1 	mov	x1, x16
    1e90:	aa0f03e0 	mov	x0, x15
    1e94:	17fffdaf 	b	1550 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, "nan", 3, width, flags);
    1e98:	2a0503e6 	mov	w6, w5
    1e9c:	f0000044 	adrp	x4, c000 <__func__.0+0x28>
    1ea0:	d2800065 	mov	x5, #0x3                   	// #3
    1ea4:	91000084 	add	x4, x4, #0x0
    1ea8:	17fffdaa 	b	1550 <_out_rev>
        return _out_rev(out, buffer, idx, maxlen, (flags & FLAGS_PLUS) ? "fni+" : "fni", (flags & FLAGS_PLUS) ? 4U : 3U, width, flags);
    1eac:	d2800080 	mov	x0, #0x4                   	// #4
    1eb0:	2a0503e6 	mov	w6, w5
    1eb4:	d0000044 	adrp	x4, b000 <_wcsnrtombs_l+0x130>
    1eb8:	913fe084 	add	x4, x4, #0xff8
    1ebc:	aa0003e5 	mov	x5, x0
    1ec0:	aa1203e3 	mov	x3, x18
    1ec4:	aa1103e2 	mov	x2, x17
    1ec8:	aa1003e1 	mov	x1, x16
    1ecc:	aa0f03e0 	mov	x0, x15
    1ed0:	17fffda0 	b	1550 <_out_rev>
        value = 0 - value;
    1ed4:	2f00e401 	movi	d1, #0x0
        negative = true;
    1ed8:	52800023 	mov	w3, #0x1                   	// #1
        value = 0 - value;
    1edc:	1e603820 	fsub	d0, d1, d0
    if (!(flags & FLAGS_PRECISION)) {
    1ee0:	3757f367 	tbnz	w7, #10, 1d4c <_ftoa+0x7c>
    1ee4:	d2d09000 	mov	x0, #0x848000000000        	// #145685290680320
    1ee8:	910043ec 	add	x12, sp, #0x10
    1eec:	f2e825c0 	movk	x0, #0x412e, lsl #48
    1ef0:	d2800008 	mov	x8, #0x0                   	// #0
    1ef4:	9e670002 	fmov	d2, x0
        prec = PRINTF_DEFAULT_FLOAT_PRECISION;
    1ef8:	528000c4 	mov	w4, #0x6                   	// #6
    1efc:	17ffffa3 	b	1d88 <_ftoa+0xb8>
        return _etoa(out, buffer, idx, maxlen, value, prec, width, flags);
    1f00:	2a0703e6 	mov	w6, w7
    1f04:	aa1203e3 	mov	x3, x18
    1f08:	aa1103e2 	mov	x2, x17
    1f0c:	aa1003e1 	mov	x1, x16
    1f10:	aa0f03e0 	mov	x0, x15
    1f14:	17fffe87 	b	1930 <_etoa>
        return _out_rev(out, buffer, idx, maxlen, "fni-", 4, width, flags);
    1f18:	2a0503e6 	mov	w6, w5
    1f1c:	f0000044 	adrp	x4, c000 <__func__.0+0x28>
    1f20:	d2800085 	mov	x5, #0x4                   	// #4
    1f24:	91002084 	add	x4, x4, #0x8
    1f28:	17fffd8a 	b	1550 <_out_rev>
    1f2c:	51008081 	sub	w1, w4, #0x20
            buf[len++] = (char)(48U + (frac % 10U));
    1f30:	b202e7e2 	mov	x2, #0xcccccccccccccccc    	// #-3689348814741910324
    1f34:	0b080021 	add	w1, w1, w8
    1f38:	f29999a2 	movk	x2, #0xcccd
    1f3c:	1400000d 	b	1f70 <_ftoa+0x2a0>
    1f40:	d343fd6b 	lsr	x11, x11, #3
            if (!(frac /= 10U)) {
    1f44:	f10025df 	cmp	x14, #0x9
            --count;
    1f48:	51000480 	sub	w0, w4, #0x1
            buf[len++] = (char)(48U + (frac % 10U));
    1f4c:	91000509 	add	x9, x8, #0x1
    1f50:	8b0b096d 	add	x13, x11, x11, lsl #2
    1f54:	cb0d05cd 	sub	x13, x14, x13, lsl #1
            if (!(frac /= 10U)) {
    1f58:	aa0b03ee 	mov	x14, x11
            buf[len++] = (char)(48U + (frac % 10U));
    1f5c:	1100c1ab 	add	w11, w13, #0x30
    1f60:	3828698b 	strb	w11, [x12, x8]
            if (!(frac /= 10U)) {
    1f64:	54000569 	b.ls	2010 <_ftoa+0x340>  // b.plast
            --count;
    1f68:	2a0003e4 	mov	w4, w0
            buf[len++] = (char)(48U + (frac % 10U));
    1f6c:	aa0903e8 	mov	x8, x9
    1f70:	9bc27dcb 	umulh	x11, x14, x2
        while (len < PRINTF_FTOA_BUFFER_SIZE) {
    1f74:	6b01009f 	cmp	w4, w1
    1f78:	54fffe41 	b.ne	1f40 <_ftoa+0x270>  // b.any
    if (!(flags & FLAGS_LEFT) && (flags & FLAGS_ZEROPAD)) {
    1f7c:	120004e0 	and	w0, w7, #0x3
    1f80:	7100041f 	cmp	w0, #0x1
    1f84:	54fff601 	b.ne	1e44 <_ftoa+0x174>  // b.any
        if (width && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
    1f88:	34fff525 	cbz	w5, 1e2c <_ftoa+0x15c>
    1f8c:	35000763 	cbnz	w3, 2078 <_ftoa+0x3a8>
    1f90:	721e04ff 	tst	w7, #0xc
    1f94:	54000721 	b.ne	2078 <_ftoa+0x3a8>  // b.any
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1f98:	2a0503e1 	mov	w1, w5
    1f9c:	eb01011f 	cmp	x8, x1
    1fa0:	54fff462 	b.cs	1e2c <_ftoa+0x15c>  // b.hs, b.nlast
    1fa4:	f1007d1f 	cmp	x8, #0x1f
            buf[len++] = '0';
    1fa8:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1fac:	54fff4c8 	b.hi	1e44 <_ftoa+0x174>  // b.pmore
            buf[len++] = '0';
    1fb0:	91000508 	add	x8, x8, #0x1
    1fb4:	8b080180 	add	x0, x12, x8
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1fb8:	eb01011f 	cmp	x8, x1
            buf[len++] = '0';
    1fbc:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < width) && (len < PRINTF_FTOA_BUFFER_SIZE)) {
    1fc0:	54fff360 	b.eq	1e2c <_ftoa+0x15c>  // b.none
    1fc4:	f100811f 	cmp	x8, #0x20
    1fc8:	54ffff41 	b.ne	1fb0 <_ftoa+0x2e0>  // b.any
    1fcc:	17ffff9e 	b	1e44 <_ftoa+0x174>
        ++frac;
    1fd0:	910005ce 	add	x14, x14, #0x1
        if (frac >= pow10[prec]) {
    1fd4:	9e6301c1 	ucvtf	d1, x14
    1fd8:	1e622030 	fcmpe	d1, d2
    1fdc:	5400004a 	b.ge	1fe4 <_ftoa+0x314>  // b.tcont
    1fe0:	17ffff78 	b	1dc0 <_ftoa+0xf0>
            ++whole;
    1fe4:	1100054a 	add	w10, w10, #0x1
            frac = 0;
    1fe8:	d280000e 	mov	x14, #0x0                   	// #0
    1fec:	17ffff75 	b	1dc0 <_ftoa+0xf0>
        } else if (flags & FLAGS_PLUS) {
    1ff0:	371003c7 	tbnz	w7, #2, 2068 <_ftoa+0x398>
        } else if (flags & FLAGS_SPACE) {
    1ff4:	361ff287 	tbz	w7, #3, 1e44 <_ftoa+0x174>
            buf[len++] = ' ';
    1ff8:	52800400 	mov	w0, #0x20                  	// #32
    1ffc:	38286980 	strb	w0, [x12, x8]
    2000:	91000508 	add	x8, x8, #0x1
    2004:	17ffff90 	b	1e44 <_ftoa+0x174>
        if ((!(diff < 0.5) || (diff > 0.5)) && (whole & 1)) {
    2008:	54ffee8c 	b.gt	1dd8 <_ftoa+0x108>
    200c:	17ffff75 	b	1de0 <_ftoa+0x110>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    2010:	f100813f 	cmp	x9, #0x20
    2014:	54000420 	b.eq	2098 <_ftoa+0x3c8>  // b.none
    2018:	91000901 	add	x1, x8, #0x2
    201c:	51000884 	sub	w4, w4, #0x2
    2020:	8b040021 	add	x1, x1, x4
            buf[len++] = '0';
    2024:	52800602 	mov	w2, #0x30                  	// #48
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    2028:	34000340 	cbz	w0, 2090 <_ftoa+0x3c0>
    202c:	d503201f 	nop
            buf[len++] = '0';
    2030:	91000529 	add	x9, x9, #0x1
    2034:	8b090180 	add	x0, x12, x9
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    2038:	f100813f 	cmp	x9, #0x20
            buf[len++] = '0';
    203c:	381ff002 	sturb	w2, [x0, #-1]
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    2040:	540002c0 	b.eq	2098 <_ftoa+0x3c8>  // b.none
    2044:	eb01013f 	cmp	x9, x1
    2048:	54ffff41 	b.ne	2030 <_ftoa+0x360>  // b.any
            buf[len++] = '.';
    204c:	528005c0 	mov	w0, #0x2e                  	// #46
    2050:	91000428 	add	x8, x1, #0x1
    2054:	38216980 	strb	w0, [x12, x1]
    2058:	17ffff62 	b	1de0 <_ftoa+0x110>
    } else if ((frac == 0U) || (frac & 1U)) {
    205c:	3607eb2e 	tbz	w14, #0, 1dc0 <_ftoa+0xf0>
        ++frac;
    2060:	910005ce 	add	x14, x14, #0x1
    2064:	17ffff57 	b	1dc0 <_ftoa+0xf0>
            buf[len++] = '+'; // ignore the space if the '+' exists
    2068:	52800560 	mov	w0, #0x2b                  	// #43
    206c:	38286980 	strb	w0, [x12, x8]
    2070:	91000508 	add	x8, x8, #0x1
    2074:	17ffff74 	b	1e44 <_ftoa+0x174>
            width--;
    2078:	510004a5 	sub	w5, w5, #0x1
    207c:	17ffffc7 	b	1f98 <_ftoa+0x2c8>
    double tmp = (value - whole) * pow10[prec];
    2080:	d0000040 	adrp	x0, c000 <__func__.0+0x28>
    2084:	91034000 	add	x0, x0, #0xd0
    2088:	fc645802 	ldr	d2, [x0, w4, uxtw #3]
    208c:	17ffff3f 	b	1d88 <_ftoa+0xb8>
        while ((len < PRINTF_FTOA_BUFFER_SIZE) && (count-- > 0U)) {
    2090:	aa0903e1 	mov	x1, x9
    2094:	17ffffee 	b	204c <_ftoa+0x37c>
            buf[len++] = '0';
    2098:	aa0903e8 	mov	x8, x9
    209c:	17ffffb8 	b	1f7c <_ftoa+0x2ac>

00000000000020a0 <_out_char>:
    if (character) {
    20a0:	72001c00 	ands	w0, w0, #0xff
    20a4:	54000041 	b.ne	20ac <_out_char+0xc>  // b.any
}
    20a8:	d65f03c0 	ret
        _putchar(character);
    20ac:	17fffd05 	b	14c0 <putc>

00000000000020b0 <_out_fct>:
    if (character) {
    20b0:	72001c00 	ands	w0, w0, #0xff
    20b4:	54000080 	b.eq	20c4 <_out_fct+0x14>  // b.none
        ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
    20b8:	a9400422 	ldp	x2, x1, [x1]
    20bc:	aa0203f0 	mov	x16, x2
    20c0:	d61f0200 	br	x16
}
    20c4:	d65f03c0 	ret
    20c8:	d503201f 	nop
    20cc:	d503201f 	nop

00000000000020d0 <_vsnprintf>:
#endif // PRINTF_SUPPORT_EXPONENTIAL
#endif // PRINTF_SUPPORT_FLOAT

// internal vsnprintf
static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
{
    20d0:	d102c3ff 	sub	sp, sp, #0xb0
    unsigned int flags, width, precision, n;
    size_t idx = 0U;

    if (!buffer) {
        // use null output function
        out = _out_null;
    20d4:	f100003f 	cmp	x1, #0x0
{
    20d8:	a9017bfd 	stp	x29, x30, [sp, #16]
    20dc:	910043fd 	add	x29, sp, #0x10
    20e0:	a90253f3 	stp	x19, x20, [sp, #32]
        out = _out_null;
    20e4:	f0fffff3 	adrp	x19, 1000 <ipc_msg_send_nowait>
    20e8:	91150273 	add	x19, x19, #0x540
{
    20ec:	a9056bf9 	stp	x25, x26, [sp, #80]
        out = _out_null;
    20f0:	9a800273 	csel	x19, x19, x0, eq  // eq = none
{
    20f4:	aa0103fa 	mov	x26, x1
    20f8:	a90673fb 	stp	x27, x28, [sp, #96]
    20fc:	aa0203fc 	mov	x28, x2
    }

    while (*format) {
    2100:	d280001b 	mov	x27, #0x0                   	// #0
    2104:	b9401880 	ldr	w0, [x4, #24]
    2108:	b9007be0 	str	w0, [sp, #120]
    210c:	f9400480 	ldr	x0, [x4, #8]
    2110:	f90047e0 	str	x0, [sp, #136]
    2114:	39400065 	ldrb	w5, [x3]
    2118:	f9400880 	ldr	x0, [x4, #16]
    211c:	f9004be0 	str	x0, [sp, #144]
    2120:	b9401c80 	ldr	w0, [x4, #28]
    2124:	b900abe0 	str	w0, [sp, #168]
    2128:	f9400094 	ldr	x20, [x4]
    212c:	34003ae5 	cbz	w5, 2888 <_vsnprintf+0x7b8>
    2130:	a90463f7 	stp	x23, x24, [sp, #64]
        default:
            break;
        }

        // evaluate specifier
        switch (*format) {
    2134:	d0000058 	adrp	x24, c000 <__func__.0+0x28>
    2138:	91004300 	add	x0, x24, #0x10
    213c:	aa0303f9 	mov	x25, x3
    2140:	f90043e0 	str	x0, [sp, #128]
    2144:	d0000040 	adrp	x0, c000 <__func__.0+0x28>
    2148:	9102e000 	add	x0, x0, #0xb8
    214c:	f9004fe0 	str	x0, [sp, #152]
    2150:	1400000a 	b	2178 <_vsnprintf+0xa8>
            out(*format, buffer, idx++, maxlen);
    2154:	91000764 	add	x4, x27, #0x1
    2158:	2a0503e0 	mov	w0, w5
            out('%', buffer, idx++, maxlen);
            format++;
            break;

        default:
            out(*format, buffer, idx++, maxlen);
    215c:	aa1b03e2 	mov	x2, x27
    2160:	aa1c03e3 	mov	x3, x28
    2164:	aa1a03e1 	mov	x1, x26
    2168:	aa0403fb 	mov	x27, x4
    216c:	d63f0260 	blr	x19
    while (*format) {
    2170:	39400325 	ldrb	w5, [x25]
    2174:	34000c85 	cbz	w5, 2304 <_vsnprintf+0x234>
            format++;
    2178:	91000739 	add	x25, x25, #0x1
        if (*format != '%') {
    217c:	710094bf 	cmp	w5, #0x25
    2180:	54fffea1 	b.ne	2154 <_vsnprintf+0x84>  // b.any
            switch (*format) {
    2184:	aa1903e8 	mov	x8, x25
        flags = 0U;
    2188:	52800006 	mov	w6, #0x0                   	// #0
            switch (*format) {
    218c:	38401500 	ldrb	w0, [x8], #1
    2190:	7100ac1f 	cmp	w0, #0x2b
    2194:	54000180 	b.eq	21c4 <_vsnprintf+0xf4>  // b.none
    2198:	540001c8 	b.hi	21d0 <_vsnprintf+0x100>  // b.pmore
    219c:	7100801f 	cmp	w0, #0x20
    21a0:	54000260 	b.eq	21ec <_vsnprintf+0x11c>  // b.none
    21a4:	71008c1f 	cmp	w0, #0x23
    21a8:	540002e1 	b.ne	2204 <_vsnprintf+0x134>  // b.any
                flags |= FLAGS_HASH;
    21ac:	321c00c6 	orr	w6, w6, #0x10
            format++;
    21b0:	aa0803f9 	mov	x25, x8
            switch (*format) {
    21b4:	aa1903e8 	mov	x8, x25
    21b8:	38401500 	ldrb	w0, [x8], #1
    21bc:	7100ac1f 	cmp	w0, #0x2b
    21c0:	54fffec1 	b.ne	2198 <_vsnprintf+0xc8>  // b.any
                flags |= FLAGS_PLUS;
    21c4:	321e00c6 	orr	w6, w6, #0x4
            format++;
    21c8:	aa0803f9 	mov	x25, x8
    21cc:	17fffffa 	b	21b4 <_vsnprintf+0xe4>
            switch (*format) {
    21d0:	7100b41f 	cmp	w0, #0x2d
    21d4:	54000120 	b.eq	21f8 <_vsnprintf+0x128>  // b.none
    21d8:	7100c01f 	cmp	w0, #0x30
    21dc:	540062c1 	b.ne	2e34 <_vsnprintf+0xd64>  // b.any
                flags |= FLAGS_ZEROPAD;
    21e0:	320000c6 	orr	w6, w6, #0x1
            format++;
    21e4:	aa0803f9 	mov	x25, x8
    21e8:	17fffff3 	b	21b4 <_vsnprintf+0xe4>
                flags |= FLAGS_SPACE;
    21ec:	321d00c6 	orr	w6, w6, #0x8
            format++;
    21f0:	aa0803f9 	mov	x25, x8
    21f4:	17fffff0 	b	21b4 <_vsnprintf+0xe4>
                flags |= FLAGS_LEFT;
    21f8:	321f00c6 	orr	w6, w6, #0x2
            format++;
    21fc:	aa0803f9 	mov	x25, x8
    2200:	17ffffed 	b	21b4 <_vsnprintf+0xe4>
        } else if (*format == '*') {
    2204:	7100a81f 	cmp	w0, #0x2a
        width = 0U;
    2208:	52800018 	mov	w24, #0x0                   	// #0
        } else if (*format == '*') {
    220c:	540002e0 	b.eq	2268 <_vsnprintf+0x198>  // b.none
        precision = 0U;
    2210:	52800017 	mov	w23, #0x0                   	// #0
        switch (*format) {
    2214:	7101b01f 	cmp	w0, #0x6c
            format++;
    2218:	aa0803e4 	mov	x4, x8
        switch (*format) {
    221c:	54001f20 	b.eq	2600 <_vsnprintf+0x530>  // b.none
    2220:	54000588 	b.hi	22d0 <_vsnprintf+0x200>  // b.pmore
    2224:	7101a01f 	cmp	w0, #0x68
    2228:	54001e20 	b.eq	25ec <_vsnprintf+0x51c>  // b.none
    222c:	7101a81f 	cmp	w0, #0x6a
    2230:	54006241 	b.ne	2e78 <_vsnprintf+0xda8>  // b.any
        switch (*format) {
    2234:	39400720 	ldrb	w0, [x25, #1]
            flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
    2238:	321800c6 	orr	w6, w6, #0x100
        switch (*format) {
    223c:	51009402 	sub	w2, w0, #0x25
            format++;
    2240:	91000499 	add	x25, x4, #0x1
        switch (*format) {
    2244:	71014c5f 	cmp	w2, #0x53
    2248:	54000069 	b.ls	2254 <_vsnprintf+0x184>  // b.plast
            out(*format, buffer, idx++, maxlen);
    224c:	91000764 	add	x4, x27, #0x1
    2250:	17ffffc3 	b	215c <_vsnprintf+0x8c>
        switch (*format) {
    2254:	f94043e1 	ldr	x1, [sp, #128]
    2258:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    225c:	10000062 	adr	x2, 2268 <_vsnprintf+0x198>
    2260:	8b21a841 	add	x1, x2, w1, sxth #2
    2264:	d61f0020 	br	x1
            const int w = va_arg(va, int);
    2268:	b9407be0 	ldr	w0, [sp, #120]
    226c:	37f806c0 	tbnz	w0, #31, 2344 <_vsnprintf+0x274>
    2270:	91002e82 	add	x2, x20, #0xb
    2274:	aa1403e0 	mov	x0, x20
    2278:	927df054 	and	x20, x2, #0xfffffffffffffff8
    227c:	b9400018 	ldr	w24, [x0]
            if (w < 0) {
    2280:	36f80078 	tbz	w24, #31, 228c <_vsnprintf+0x1bc>
                flags |= FLAGS_LEFT; // reverse padding
    2284:	321f00c6 	orr	w6, w6, #0x2
                width = (unsigned int)-w;
    2288:	4b1803f8 	neg	w24, w24
        if (*format == '.') {
    228c:	39400720 	ldrb	w0, [x25, #1]
            format++;
    2290:	aa0803f9 	mov	x25, x8
    2294:	91000508 	add	x8, x8, #0x1
        if (*format == '.') {
    2298:	7100b81f 	cmp	w0, #0x2e
    229c:	54fffba1 	b.ne	2210 <_vsnprintf+0x140>  // b.any
            if (_is_digit(*format)) {
    22a0:	39400720 	ldrb	w0, [x25, #1]
            flags |= FLAGS_PRECISION;
    22a4:	321600c6 	orr	w6, w6, #0x400
            format++;
    22a8:	aa0803e4 	mov	x4, x8
    return (ch >= '0') && (ch <= '9');
    22ac:	5100c002 	sub	w2, w0, #0x30
            if (_is_digit(*format)) {
    22b0:	12001c42 	and	w2, w2, #0xff
    22b4:	7100245f 	cmp	w2, #0x9
    22b8:	54001b29 	b.ls	261c <_vsnprintf+0x54c>  // b.plast
            } else if (*format == '*') {
    22bc:	7100a81f 	cmp	w0, #0x2a
    22c0:	54002a20 	b.eq	2804 <_vsnprintf+0x734>  // b.none
            format++;
    22c4:	aa0803f9 	mov	x25, x8
    22c8:	91000508 	add	x8, x8, #0x1
    22cc:	17ffffd1 	b	2210 <_vsnprintf+0x140>
        switch (*format) {
    22d0:	7101d01f 	cmp	w0, #0x74
    22d4:	54fffb00 	b.eq	2234 <_vsnprintf+0x164>  // b.none
    22d8:	7101e81f 	cmp	w0, #0x7a
    22dc:	54fffac0 	b.eq	2234 <_vsnprintf+0x164>  // b.none
        switch (*format) {
    22e0:	5101bc02 	sub	w2, w0, #0x6f
            format++;
    22e4:	aa0803f9 	mov	x25, x8
        switch (*format) {
    22e8:	7100245f 	cmp	w2, #0x9
    22ec:	54fffb08 	b.hi	224c <_vsnprintf+0x17c>  // b.pmore
    22f0:	f9404fe1 	ldr	x1, [sp, #152]
    22f4:	78625821 	ldrh	w1, [x1, w2, uxtw #1]
    22f8:	10000062 	adr	x2, 2304 <_vsnprintf+0x234>
    22fc:	8b21a841 	add	x1, x2, w1, sxth #2
    2300:	d61f0020 	br	x1
    2304:	a94463f7 	ldp	x23, x24, [sp, #64]

    // termination
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);

    // return written chars without terminating \0
    return (int)idx;
    2308:	2a1b03f4 	mov	w20, w27
    out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
    230c:	eb1b039f 	cmp	x28, x27
    2310:	d1000782 	sub	x2, x28, #0x1
    2314:	aa1a03e1 	mov	x1, x26
    2318:	9a9b9042 	csel	x2, x2, x27, ls  // ls = plast
    231c:	aa1c03e3 	mov	x3, x28
    2320:	52800000 	mov	w0, #0x0                   	// #0
    2324:	d63f0260 	blr	x19
}
    2328:	2a1403e0 	mov	w0, w20
    232c:	a9417bfd 	ldp	x29, x30, [sp, #16]
    2330:	a94253f3 	ldp	x19, x20, [sp, #32]
    2334:	a9456bf9 	ldp	x25, x26, [sp, #80]
    2338:	a94673fb 	ldp	x27, x28, [sp, #96]
    233c:	9102c3ff 	add	sp, sp, #0xb0
    2340:	d65f03c0 	ret
            const int w = va_arg(va, int);
    2344:	b9407be0 	ldr	w0, [sp, #120]
    2348:	11002002 	add	w2, w0, #0x8
    234c:	7100005f 	cmp	w2, #0x0
    2350:	5400228d 	b.le	27a0 <_vsnprintf+0x6d0>
    2354:	91002e84 	add	x4, x20, #0xb
    2358:	aa1403e0 	mov	x0, x20
    235c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2360:	b9007be2 	str	w2, [sp, #120]
    2364:	17ffffc6 	b	227c <_vsnprintf+0x1ac>
            if (*format == 'x' || *format == 'X') {
    2368:	121a7802 	and	w2, w0, #0xffffffdf
    236c:	7101605f 	cmp	w2, #0x58
    2370:	54001781 	b.ne	2660 <_vsnprintf+0x590>  // b.any
            if (*format == 'X') {
    2374:	7101601f 	cmp	w0, #0x58
    2378:	54003c81 	b.ne	2b08 <_vsnprintf+0xa38>  // b.any
                flags |= FLAGS_UPPERCASE;
    237c:	321b00c6 	orr	w6, w6, #0x20
    2380:	d2800208 	mov	x8, #0x10                  	// #16
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    2384:	121c74c6 	and	w6, w6, #0xfffffff3
    2388:	140000c0 	b	2688 <_vsnprintf+0x5b8>
            if ((*format == 'g') || (*format == 'G'))
    238c:	121a7802 	and	w2, w0, #0xffffffdf
            if ((*format == 'E') || (*format == 'G'))
    2390:	121e7800 	and	w0, w0, #0xfffffffd
                flags |= FLAGS_ADAPT_EXP;
    2394:	71011c5f 	cmp	w2, #0x47
    2398:	321500c2 	orr	w2, w6, #0x800
    239c:	1a860046 	csel	w6, w2, w6, eq  // eq = none
                flags |= FLAGS_UPPERCASE;
    23a0:	7101141f 	cmp	w0, #0x45
    23a4:	321b00c0 	orr	w0, w6, #0x20
    23a8:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    23ac:	b940abe0 	ldr	w0, [sp, #168]
    23b0:	37f81c20 	tbnz	w0, #31, 2734 <_vsnprintf+0x664>
    23b4:	91003e82 	add	x2, x20, #0xf
    23b8:	aa1403e0 	mov	x0, x20
    23bc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    23c0:	fd400000 	ldr	d0, [x0]
    23c4:	aa1b03e2 	mov	x2, x27
    23c8:	2a1803e5 	mov	w5, w24
    23cc:	2a1703e4 	mov	w4, w23
    23d0:	aa1c03e3 	mov	x3, x28
    23d4:	aa1a03e1 	mov	x1, x26
    23d8:	aa1303e0 	mov	x0, x19
    23dc:	97fffd55 	bl	1930 <_etoa>
    23e0:	aa0003fb 	mov	x27, x0
            break;
    23e4:	17ffff63 	b	2170 <_vsnprintf+0xa0>
                flags |= FLAGS_UPPERCASE;
    23e8:	7101181f 	cmp	w0, #0x46
    23ec:	321b00c0 	orr	w0, w6, #0x20
    23f0:	1a860006 	csel	w6, w0, w6, eq  // eq = none
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    23f4:	b940abe0 	ldr	w0, [sp, #168]
    23f8:	37f818c0 	tbnz	w0, #31, 2710 <_vsnprintf+0x640>
    23fc:	91003e82 	add	x2, x20, #0xf
    2400:	aa1403e0 	mov	x0, x20
    2404:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2408:	fd400000 	ldr	d0, [x0]
    240c:	aa1b03e2 	mov	x2, x27
    2410:	2a1803e5 	mov	w5, w24
    2414:	2a1703e4 	mov	w4, w23
    2418:	aa1c03e3 	mov	x3, x28
    241c:	aa1a03e1 	mov	x1, x26
    2420:	aa1303e0 	mov	x0, x19
    2424:	97fffe2b 	bl	1cd0 <_ftoa>
    2428:	aa0003fb 	mov	x27, x0
            break;
    242c:	17ffff51 	b	2170 <_vsnprintf+0xa0>
            out('%', buffer, idx++, maxlen);
    2430:	91000760 	add	x0, x27, #0x1
    2434:	aa1b03e2 	mov	x2, x27
    2438:	aa1c03e3 	mov	x3, x28
    243c:	aa0003fb 	mov	x27, x0
    2440:	aa1a03e1 	mov	x1, x26
    2444:	528004a0 	mov	w0, #0x25                  	// #37
    2448:	d63f0260 	blr	x19
            break;
    244c:	17ffff49 	b	2170 <_vsnprintf+0xa0>
            flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
    2450:	52800420 	mov	w0, #0x21                  	// #33
    2454:	2a0000c6 	orr	w6, w6, w0
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    2458:	b9407be0 	ldr	w0, [sp, #120]
    245c:	37f817e0 	tbnz	w0, #31, 2758 <_vsnprintf+0x688>
    2460:	91003e82 	add	x2, x20, #0xf
    2464:	aa1403e0 	mov	x0, x20
    2468:	927df054 	and	x20, x2, #0xfffffffffffffff8
    246c:	2a1703e7 	mov	w7, w23
    2470:	aa1b03e2 	mov	x2, x27
    2474:	f9400004 	ldr	x4, [x0]
    2478:	52800200 	mov	w0, #0x10                  	// #16
    247c:	b90003e0 	str	w0, [sp]
    2480:	b9000be6 	str	w6, [sp, #8]
    2484:	d2800206 	mov	x6, #0x10                  	// #16
    2488:	52800005 	mov	w5, #0x0                   	// #0
    248c:	aa1c03e3 	mov	x3, x28
    2490:	aa1a03e1 	mov	x1, x26
    2494:	aa1303e0 	mov	x0, x19
    2498:	97fffc72 	bl	1660 <_ntoa_long>
    249c:	aa0003fb 	mov	x27, x0
            break;
    24a0:	17ffff34 	b	2170 <_vsnprintf+0xa0>
            if (!(flags & FLAGS_LEFT)) {
    24a4:	a9035bf5 	stp	x21, x22, [sp, #48]
    24a8:	36082306 	tbz	w6, #1, 2908 <_vsnprintf+0x838>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    24ac:	b9407be0 	ldr	w0, [sp, #120]
    24b0:	37f82a20 	tbnz	w0, #31, 29f4 <_vsnprintf+0x924>
    24b4:	91002e82 	add	x2, x20, #0xb
    24b8:	aa1403e0 	mov	x0, x20
    24bc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    24c0:	39400000 	ldrb	w0, [x0]
    24c4:	aa1b03e2 	mov	x2, x27
    24c8:	aa1c03e3 	mov	x3, x28
    24cc:	aa1a03e1 	mov	x1, x26
    24d0:	91000775 	add	x21, x27, #0x1
    24d4:	d63f0260 	blr	x19
                while (l++ < width) {
    24d8:	51000b00 	sub	w0, w24, #0x2
    24dc:	91000b6a 	add	x10, x27, #0x2
    24e0:	7100071f 	cmp	w24, #0x1
    24e4:	8b00015b 	add	x27, x10, x0
    24e8:	540007c9 	b.ls	25e0 <_vsnprintf+0x510>  // b.plast
    24ec:	d503201f 	nop
                    out(' ', buffer, idx++, maxlen);
    24f0:	aa1503e2 	mov	x2, x21
    24f4:	aa1c03e3 	mov	x3, x28
    24f8:	910006b5 	add	x21, x21, #0x1
    24fc:	aa1a03e1 	mov	x1, x26
    2500:	52800400 	mov	w0, #0x20                  	// #32
    2504:	d63f0260 	blr	x19
                while (l++ < width) {
    2508:	eb1b02bf 	cmp	x21, x27
    250c:	54ffff21 	b.ne	24f0 <_vsnprintf+0x420>  // b.any
    2510:	a9435bf5 	ldp	x21, x22, [sp, #48]
    2514:	17ffff17 	b	2170 <_vsnprintf+0xa0>
            const char* p = va_arg(va, char*);
    2518:	b9407be0 	ldr	w0, [sp, #120]
    251c:	a9035bf5 	stp	x21, x22, [sp, #48]
    2520:	37f812e0 	tbnz	w0, #31, 277c <_vsnprintf+0x6ac>
    2524:	91003e82 	add	x2, x20, #0xf
    2528:	aa1403e0 	mov	x0, x20
    252c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2530:	f9400015 	ldr	x21, [x0]
    for (s = str; *s && maxsize--; ++s)
    2534:	394002a8 	ldrb	w8, [x21]
    2538:	2a0803e0 	mov	w0, w8
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    253c:	350017d7 	cbnz	w23, 2834 <_vsnprintf+0x764>
    for (s = str; *s && maxsize--; ++s)
    2540:	92800022 	mov	x2, #0xfffffffffffffffe    	// #-2
    2544:	340035c8 	cbz	w8, 2bfc <_vsnprintf+0xb2c>
    2548:	91000456 	add	x22, x2, #0x1
    254c:	aa1503e2 	mov	x2, x21
    2550:	8b1602b6 	add	x22, x21, x22
    2554:	14000003 	b	2560 <_vsnprintf+0x490>
    2558:	eb0202df 	cmp	x22, x2
    255c:	54001900 	b.eq	287c <_vsnprintf+0x7ac>  // b.none
    2560:	38401c44 	ldrb	w4, [x2, #1]!
    2564:	35ffffa4 	cbnz	w4, 2558 <_vsnprintf+0x488>
    return (unsigned int)(s - str);
    2568:	4b150041 	sub	w1, w2, w21
    256c:	b900a3e1 	str	w1, [sp, #160]
            if (flags & FLAGS_PRECISION) {
    2570:	121600c1 	and	w1, w6, #0x400
    2574:	b9007fe1 	str	w1, [sp, #124]
    2578:	365000a6 	tbz	w6, #10, 258c <_vsnprintf+0x4bc>
                l = (l < precision ? l : precision);
    257c:	b940a3e1 	ldr	w1, [sp, #160]
    2580:	6b17003f 	cmp	w1, w23
    2584:	1a979021 	csel	w1, w1, w23, ls  // ls = plast
    2588:	b900a3e1 	str	w1, [sp, #160]
            if (!(flags & FLAGS_LEFT)) {
    258c:	121f00c1 	and	w1, w6, #0x2
    2590:	b900afe1 	str	w1, [sp, #172]
    2594:	36081826 	tbz	w6, #1, 2898 <_vsnprintf+0x7c8>
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    2598:	34001108 	cbz	w8, 27b8 <_vsnprintf+0x6e8>
    259c:	aa1b03e2 	mov	x2, x27
    25a0:	cb1b02b6 	sub	x22, x21, x27
    25a4:	14000002 	b	25ac <_vsnprintf+0x4dc>
                out(*(p++), buffer, idx++, maxlen);
    25a8:	aa1503e2 	mov	x2, x21
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    25ac:	b9407fe1 	ldr	w1, [sp, #124]
    25b0:	34000081 	cbz	w1, 25c0 <_vsnprintf+0x4f0>
    25b4:	510006e4 	sub	w4, w23, #0x1
    25b8:	340016d7 	cbz	w23, 2890 <_vsnprintf+0x7c0>
    25bc:	2a0403f7 	mov	w23, w4
                out(*(p++), buffer, idx++, maxlen);
    25c0:	91000455 	add	x21, x2, #0x1
    25c4:	aa1c03e3 	mov	x3, x28
    25c8:	aa1a03e1 	mov	x1, x26
    25cc:	d63f0260 	blr	x19
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    25d0:	38756ac0 	ldrb	w0, [x22, x21]
    25d4:	35fffea0 	cbnz	w0, 25a8 <_vsnprintf+0x4d8>
            if (flags & FLAGS_LEFT) {
    25d8:	b940afe0 	ldr	w0, [sp, #172]
    25dc:	35000ec0 	cbnz	w0, 27b4 <_vsnprintf+0x6e4>
                while (l++ < width) {
    25e0:	aa1503fb 	mov	x27, x21
    25e4:	a9435bf5 	ldp	x21, x22, [sp, #48]
    25e8:	17fffee2 	b	2170 <_vsnprintf+0xa0>
            if (*format == 'h') {
    25ec:	39400720 	ldrb	w0, [x25, #1]
    25f0:	7101a01f 	cmp	w0, #0x68
    25f4:	540013c0 	b.eq	286c <_vsnprintf+0x79c>  // b.none
            flags |= FLAGS_SHORT;
    25f8:	321900c6 	orr	w6, w6, #0x80
    25fc:	17ffff10 	b	223c <_vsnprintf+0x16c>
            if (*format == 'l') {
    2600:	39400720 	ldrb	w0, [x25, #1]
    2604:	7101b01f 	cmp	w0, #0x6c
    2608:	54ffe181 	b.ne	2238 <_vsnprintf+0x168>  // b.any
        switch (*format) {
    260c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_LONG_LONG;
    2610:	321804c6 	orr	w6, w6, #0x300
                format++;
    2614:	91000b24 	add	x4, x25, #0x2
    2618:	17ffff09 	b	223c <_vsnprintf+0x16c>
    unsigned int i = 0U;
    261c:	52800017 	mov	w23, #0x0                   	// #0
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    2620:	52800148 	mov	w8, #0xa                   	// #10
    2624:	d503201f 	nop
    2628:	1b0802e7 	madd	w7, w23, w8, w0
    while (_is_digit(**str)) {
    262c:	38401c80 	ldrb	w0, [x4, #1]!
    return (ch >= '0') && (ch <= '9');
    2630:	5100c002 	sub	w2, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    2634:	5100c0f7 	sub	w23, w7, #0x30
    while (_is_digit(**str)) {
    2638:	12001c42 	and	w2, w2, #0xff
    263c:	7100245f 	cmp	w2, #0x9
    2640:	54ffff49 	b.ls	2628 <_vsnprintf+0x558>  // b.plast
    2644:	aa0403f9 	mov	x25, x4
    2648:	91000488 	add	x8, x4, #0x1
    264c:	17fffef2 	b	2214 <_vsnprintf+0x144>
            if (*format == 'x' || *format == 'X') {
    2650:	121a7802 	and	w2, w0, #0xffffffdf
    2654:	7101605f 	cmp	w2, #0x58
    2658:	54002580 	b.eq	2b08 <_vsnprintf+0xa38>  // b.none
    265c:	d503201f 	nop
            } else if (*format == 'o') {
    2660:	7101bc1f 	cmp	w0, #0x6f
    2664:	540021a0 	b.eq	2a98 <_vsnprintf+0x9c8>  // b.none
            } else if (*format == 'b') {
    2668:	7101881f 	cmp	w0, #0x62
    266c:	54002820 	b.eq	2b70 <_vsnprintf+0xaa0>  // b.none
                flags &= ~FLAGS_HASH; // no hash for dec format
    2670:	121b78c6 	and	w6, w6, #0xffffffef
    2674:	d2800148 	mov	x8, #0xa                   	// #10
            if ((*format != 'i') && (*format != 'd')) {
    2678:	7101a41f 	cmp	w0, #0x69
    267c:	52800c82 	mov	w2, #0x64                  	// #100
    2680:	7a421004 	ccmp	w0, w2, #0x4, ne  // ne = any
    2684:	54ffe801 	b.ne	2384 <_vsnprintf+0x2b4>  // b.any
                flags &= ~FLAGS_ZEROPAD;
    2688:	f27600df 	tst	x6, #0x400
    268c:	121f78c2 	and	w2, w6, #0xfffffffe
    2690:	1a861046 	csel	w6, w2, w6, ne  // ne = any
            if ((*format == 'i') || (*format == 'd')) {
    2694:	7101a41f 	cmp	w0, #0x69
    2698:	52800c84 	mov	w4, #0x64                  	// #100
                if (flags & FLAGS_LONG_LONG) {
    269c:	121700c2 	and	w2, w6, #0x200
            if ((*format == 'i') || (*format == 'd')) {
    26a0:	7a441004 	ccmp	w0, w4, #0x4, ne  // ne = any
                    const long long value = va_arg(va, long long);
    26a4:	b9407be0 	ldr	w0, [sp, #120]
            if ((*format == 'i') || (*format == 'd')) {
    26a8:	54000ce1 	b.ne	2844 <_vsnprintf+0x774>  // b.any
                if (flags & FLAGS_LONG_LONG) {
    26ac:	35002122 	cbnz	w2, 2ad0 <_vsnprintf+0xa00>
                } else if (flags & FLAGS_LONG) {
    26b0:	37402306 	tbnz	w6, #8, 2b10 <_vsnprintf+0xa40>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    26b4:	37301b26 	tbnz	w6, #6, 2a18 <_vsnprintf+0x948>
                                                                                                           : va_arg(va, int);
    26b8:	36382926 	tbz	w6, #7, 2bdc <_vsnprintf+0xb0c>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    26bc:	37f83300 	tbnz	w0, #31, 2d1c <_vsnprintf+0xc4c>
    26c0:	91002e82 	add	x2, x20, #0xb
    26c4:	aa1403e0 	mov	x0, x20
    26c8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    26cc:	79c00005 	ldrsh	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    26d0:	710000bf 	cmp	w5, #0x0
    26d4:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    26d8:	12003c84 	and	w4, w4, #0xffff
    26dc:	2a1703e7 	mov	w7, w23
    26e0:	531f7ca5 	lsr	w5, w5, #31
    26e4:	93407c84 	sxtw	x4, w4
    26e8:	aa1b03e2 	mov	x2, x27
    26ec:	b9000be6 	str	w6, [sp, #8]
    26f0:	aa0803e6 	mov	x6, x8
    26f4:	b90003f8 	str	w24, [sp]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    26f8:	aa1c03e3 	mov	x3, x28
    26fc:	aa1a03e1 	mov	x1, x26
    2700:	aa1303e0 	mov	x0, x19
    2704:	97fffbd7 	bl	1660 <_ntoa_long>
    2708:	aa0003fb 	mov	x27, x0
            break;
    270c:	17fffe99 	b	2170 <_vsnprintf+0xa0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    2710:	b940abe0 	ldr	w0, [sp, #168]
    2714:	11004002 	add	w2, w0, #0x10
    2718:	7100005f 	cmp	w2, #0x0
    271c:	54001b4d 	b.le	2a84 <_vsnprintf+0x9b4>
    2720:	91003e84 	add	x4, x20, #0xf
    2724:	aa1403e0 	mov	x0, x20
    2728:	927df094 	and	x20, x4, #0xfffffffffffffff8
    272c:	b900abe2 	str	w2, [sp, #168]
    2730:	17ffff36 	b	2408 <_vsnprintf+0x338>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    2734:	b940abe0 	ldr	w0, [sp, #168]
    2738:	11004002 	add	w2, w0, #0x10
    273c:	7100005f 	cmp	w2, #0x0
    2740:	5400198d 	b.le	2a70 <_vsnprintf+0x9a0>
    2744:	91003e84 	add	x4, x20, #0xf
    2748:	aa1403e0 	mov	x0, x20
    274c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2750:	b900abe2 	str	w2, [sp, #168]
    2754:	17ffff1b 	b	23c0 <_vsnprintf+0x2f0>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    2758:	b9407be0 	ldr	w0, [sp, #120]
    275c:	11002002 	add	w2, w0, #0x8
    2760:	7100005f 	cmp	w2, #0x0
    2764:	540017cd 	b.le	2a5c <_vsnprintf+0x98c>
    2768:	91003e84 	add	x4, x20, #0xf
    276c:	aa1403e0 	mov	x0, x20
    2770:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2774:	b9007be2 	str	w2, [sp, #120]
    2778:	17ffff3d 	b	246c <_vsnprintf+0x39c>
            const char* p = va_arg(va, char*);
    277c:	b9407be0 	ldr	w0, [sp, #120]
    2780:	11002002 	add	w2, w0, #0x8
    2784:	7100005f 	cmp	w2, #0x0
    2788:	5400160d 	b.le	2a48 <_vsnprintf+0x978>
    278c:	91003e84 	add	x4, x20, #0xf
    2790:	aa1403e0 	mov	x0, x20
    2794:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2798:	b9007be2 	str	w2, [sp, #120]
    279c:	17ffff65 	b	2530 <_vsnprintf+0x460>
            const int w = va_arg(va, int);
    27a0:	f94047e1 	ldr	x1, [sp, #136]
    27a4:	b9407be0 	ldr	w0, [sp, #120]
    27a8:	b9007be2 	str	w2, [sp, #120]
    27ac:	8b20c020 	add	x0, x1, w0, sxtw
    27b0:	17fffeb3 	b	227c <_vsnprintf+0x1ac>
    27b4:	aa1503fb 	mov	x27, x21
                while (l++ < width) {
    27b8:	b940a3e0 	ldr	w0, [sp, #160]
    27bc:	6b18001f 	cmp	w0, w24
    27c0:	540009e2 	b.cs	28fc <_vsnprintf+0x82c>  // b.hs, b.nlast
    27c4:	51000704 	sub	w4, w24, #0x1
    27c8:	91000776 	add	x22, x27, #0x1
    27cc:	4b000084 	sub	w4, w4, w0
    27d0:	8b160095 	add	x21, x4, x22
    27d4:	14000002 	b	27dc <_vsnprintf+0x70c>
    27d8:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    27dc:	aa1b03e2 	mov	x2, x27
    27e0:	aa1c03e3 	mov	x3, x28
    27e4:	aa1a03e1 	mov	x1, x26
    27e8:	52800400 	mov	w0, #0x20                  	// #32
    27ec:	d63f0260 	blr	x19
    27f0:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    27f4:	eb1502df 	cmp	x22, x21
    27f8:	54ffff01 	b.ne	27d8 <_vsnprintf+0x708>  // b.any
                while (l++ < width) {
    27fc:	aa1503fb 	mov	x27, x21
    2800:	17ffff79 	b	25e4 <_vsnprintf+0x514>
                const int prec = (int)va_arg(va, int);
    2804:	b9407be0 	ldr	w0, [sp, #120]
    2808:	37f80b80 	tbnz	w0, #31, 2978 <_vsnprintf+0x8a8>
    280c:	91002e82 	add	x2, x20, #0xb
    2810:	aa1403e0 	mov	x0, x20
    2814:	927df054 	and	x20, x2, #0xfffffffffffffff8
                precision = prec > 0 ? (unsigned int)prec : 0U;
    2818:	b9400007 	ldr	w7, [x0]
                format++;
    281c:	91000b39 	add	x25, x25, #0x2
        switch (*format) {
    2820:	39400320 	ldrb	w0, [x25]
    2824:	91000728 	add	x8, x25, #0x1
                precision = prec > 0 ? (unsigned int)prec : 0U;
    2828:	710000ff 	cmp	w7, #0x0
    282c:	1a9fa0f7 	csel	w23, w7, wzr, ge  // ge = tcont
                format++;
    2830:	17fffe79 	b	2214 <_vsnprintf+0x144>
            unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
    2834:	2a1703e2 	mov	w2, w23
    for (s = str; *s && maxsize--; ++s)
    2838:	34001e28 	cbz	w8, 2bfc <_vsnprintf+0xb2c>
    283c:	d1000442 	sub	x2, x2, #0x1
    2840:	17ffff42 	b	2548 <_vsnprintf+0x478>
                if (flags & FLAGS_LONG_LONG) {
    2844:	35001302 	cbnz	w2, 2aa4 <_vsnprintf+0x9d4>
                } else if (flags & FLAGS_LONG) {
    2848:	37401806 	tbnz	w6, #8, 2b48 <_vsnprintf+0xa78>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    284c:	37300ba6 	tbnz	w6, #6, 29c0 <_vsnprintf+0x8f0>
                                                                                                                                      : va_arg(va, unsigned int);
    2850:	36381ba6 	tbz	w6, #7, 2bc4 <_vsnprintf+0xaf4>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2854:	37f82500 	tbnz	w0, #31, 2cf4 <_vsnprintf+0xc24>
    2858:	aa1403e0 	mov	x0, x20
    285c:	91002e82 	add	x2, x20, #0xb
    2860:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2864:	79400004 	ldrh	w4, [x0]
    2868:	1400005b 	b	29d4 <_vsnprintf+0x904>
        switch (*format) {
    286c:	39400b20 	ldrb	w0, [x25, #2]
                flags |= FLAGS_CHAR;
    2870:	321a04c6 	orr	w6, w6, #0xc0
                format++;
    2874:	91000b24 	add	x4, x25, #0x2
    2878:	17fffe71 	b	223c <_vsnprintf+0x16c>
    return (unsigned int)(s - str);
    287c:	4b1502c1 	sub	w1, w22, w21
    2880:	b900a3e1 	str	w1, [sp, #160]
    2884:	17ffff3b 	b	2570 <_vsnprintf+0x4a0>
    while (*format) {
    2888:	52800014 	mov	w20, #0x0                   	// #0
    288c:	17fffea0 	b	230c <_vsnprintf+0x23c>
    2890:	aa0203f5 	mov	x21, x2
    2894:	17ffff51 	b	25d8 <_vsnprintf+0x508>
                while (l++ < width) {
    2898:	b940a3e1 	ldr	w1, [sp, #160]
    289c:	6b18003f 	cmp	w1, w24
    28a0:	11000420 	add	w0, w1, #0x1
    28a4:	54002242 	b.cs	2cec <_vsnprintf+0xc1c>  // b.hs, b.nlast
    28a8:	51000700 	sub	w0, w24, #0x1
    28ac:	91000776 	add	x22, x27, #0x1
    28b0:	4b010000 	sub	w0, w0, w1
    28b4:	8b160000 	add	x0, x0, x22
    28b8:	f90053e0 	str	x0, [sp, #160]
    28bc:	14000002 	b	28c4 <_vsnprintf+0x7f4>
    28c0:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    28c4:	aa1b03e2 	mov	x2, x27
    28c8:	52800400 	mov	w0, #0x20                  	// #32
    28cc:	aa1c03e3 	mov	x3, x28
    28d0:	aa1a03e1 	mov	x1, x26
    28d4:	d63f0260 	blr	x19
    28d8:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    28dc:	f94053e0 	ldr	x0, [sp, #160]
    28e0:	eb16001f 	cmp	x0, x22
    28e4:	54fffee1 	b.ne	28c0 <_vsnprintf+0x7f0>  // b.any
    28e8:	394002a8 	ldrb	w8, [x21]
    28ec:	11000700 	add	w0, w24, #0x1
    28f0:	b900a3e0 	str	w0, [sp, #160]
            while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
    28f4:	2a0803e0 	mov	w0, w8
    28f8:	35ffe528 	cbnz	w8, 259c <_vsnprintf+0x4cc>
                while (l++ < width) {
    28fc:	aa1b03f5 	mov	x21, x27
                while (l++ < width) {
    2900:	aa1503fb 	mov	x27, x21
    2904:	17ffff38 	b	25e4 <_vsnprintf+0x514>
                while (l++ < width) {
    2908:	7100071f 	cmp	w24, #0x1
    290c:	54001ec9 	b.ls	2ce4 <_vsnprintf+0xc14>  // b.plast
    2910:	51000b05 	sub	w5, w24, #0x2
    2914:	91000776 	add	x22, x27, #0x1
    2918:	8b0502d5 	add	x21, x22, x5
    291c:	14000002 	b	2924 <_vsnprintf+0x854>
    2920:	910006d6 	add	x22, x22, #0x1
                    out(' ', buffer, idx++, maxlen);
    2924:	aa1b03e2 	mov	x2, x27
    2928:	aa1c03e3 	mov	x3, x28
    292c:	aa1a03e1 	mov	x1, x26
    2930:	52800400 	mov	w0, #0x20                  	// #32
    2934:	d63f0260 	blr	x19
    2938:	aa1603fb 	mov	x27, x22
                while (l++ < width) {
    293c:	eb1502df 	cmp	x22, x21
    2940:	54ffff01 	b.ne	2920 <_vsnprintf+0x850>  // b.any
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    2944:	b9407be0 	ldr	w0, [sp, #120]
    2948:	37f802a0 	tbnz	w0, #31, 299c <_vsnprintf+0x8cc>
    294c:	91002e82 	add	x2, x20, #0xb
    2950:	aa1403e0 	mov	x0, x20
    2954:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2958:	39400000 	ldrb	w0, [x0]
    295c:	aa1503e2 	mov	x2, x21
    2960:	910006bb 	add	x27, x21, #0x1
    2964:	aa1c03e3 	mov	x3, x28
    2968:	aa1a03e1 	mov	x1, x26
    296c:	d63f0260 	blr	x19
            if (flags & FLAGS_LEFT) {
    2970:	a9435bf5 	ldp	x21, x22, [sp, #48]
    2974:	17fffdff 	b	2170 <_vsnprintf+0xa0>
                const int prec = (int)va_arg(va, int);
    2978:	b9407be0 	ldr	w0, [sp, #120]
    297c:	11002002 	add	w2, w0, #0x8
    2980:	7100005f 	cmp	w2, #0x0
    2984:	5400058d 	b.le	2a34 <_vsnprintf+0x964>
    2988:	91002e84 	add	x4, x20, #0xb
    298c:	aa1403e0 	mov	x0, x20
    2990:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2994:	b9007be2 	str	w2, [sp, #120]
    2998:	17ffffa0 	b	2818 <_vsnprintf+0x748>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    299c:	b9407be0 	ldr	w0, [sp, #120]
    29a0:	11002002 	add	w2, w0, #0x8
    29a4:	7100005f 	cmp	w2, #0x0
    29a8:	540016ed 	b.le	2c84 <_vsnprintf+0xbb4>
    29ac:	91002e84 	add	x4, x20, #0xb
    29b0:	aa1403e0 	mov	x0, x20
    29b4:	927df094 	and	x20, x4, #0xfffffffffffffff8
    29b8:	b9007be2 	str	w2, [sp, #120]
    29bc:	17ffffe7 	b	2958 <_vsnprintf+0x888>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    29c0:	37f81220 	tbnz	w0, #31, 2c04 <_vsnprintf+0xb34>
    29c4:	91002e82 	add	x2, x20, #0xb
    29c8:	aa1403e0 	mov	x0, x20
    29cc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    29d0:	39400004 	ldrb	w4, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
    29d4:	2a1703e7 	mov	w7, w23
    29d8:	2a0403e4 	mov	w4, w4
    29dc:	b9000be6 	str	w6, [sp, #8]
    29e0:	aa0803e6 	mov	x6, x8
    29e4:	b90003f8 	str	w24, [sp]
    29e8:	aa1b03e2 	mov	x2, x27
    29ec:	52800005 	mov	w5, #0x0                   	// #0
    29f0:	17ffff42 	b	26f8 <_vsnprintf+0x628>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    29f4:	b9407be0 	ldr	w0, [sp, #120]
    29f8:	11002002 	add	w2, w0, #0x8
    29fc:	7100005f 	cmp	w2, #0x0
    2a00:	5400138d 	b.le	2c70 <_vsnprintf+0xba0>
    2a04:	91002e84 	add	x4, x20, #0xb
    2a08:	aa1403e0 	mov	x0, x20
    2a0c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2a10:	b9007be2 	str	w2, [sp, #120]
    2a14:	17fffeab 	b	24c0 <_vsnprintf+0x3f0>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2a18:	37f81080 	tbnz	w0, #31, 2c28 <_vsnprintf+0xb58>
    2a1c:	91002e82 	add	x2, x20, #0xb
    2a20:	aa1403e0 	mov	x0, x20
    2a24:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2a28:	39400005 	ldrb	w5, [x0]
    2a2c:	2a0503e4 	mov	w4, w5
    2a30:	17ffff2b 	b	26dc <_vsnprintf+0x60c>
                const int prec = (int)va_arg(va, int);
    2a34:	f94047e1 	ldr	x1, [sp, #136]
    2a38:	b9407be0 	ldr	w0, [sp, #120]
    2a3c:	b9007be2 	str	w2, [sp, #120]
    2a40:	8b20c020 	add	x0, x1, w0, sxtw
    2a44:	17ffff75 	b	2818 <_vsnprintf+0x748>
            const char* p = va_arg(va, char*);
    2a48:	f94047e1 	ldr	x1, [sp, #136]
    2a4c:	b9407be0 	ldr	w0, [sp, #120]
    2a50:	b9007be2 	str	w2, [sp, #120]
    2a54:	8b20c020 	add	x0, x1, w0, sxtw
    2a58:	17fffeb6 	b	2530 <_vsnprintf+0x460>
                idx = _ntoa_long_long(out, buffer, idx, maxlen, (uintptr_t)va_arg(va, void*), false, 16U, precision, width, flags);
    2a5c:	f94047e1 	ldr	x1, [sp, #136]
    2a60:	b9407be0 	ldr	w0, [sp, #120]
    2a64:	b9007be2 	str	w2, [sp, #120]
    2a68:	8b20c020 	add	x0, x1, w0, sxtw
    2a6c:	17fffe80 	b	246c <_vsnprintf+0x39c>
            idx = _etoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    2a70:	f9404be1 	ldr	x1, [sp, #144]
    2a74:	b940abe0 	ldr	w0, [sp, #168]
    2a78:	b900abe2 	str	w2, [sp, #168]
    2a7c:	8b20c020 	add	x0, x1, w0, sxtw
    2a80:	17fffe50 	b	23c0 <_vsnprintf+0x2f0>
            idx = _ftoa(out, buffer, idx, maxlen, va_arg(va, double), precision, width, flags);
    2a84:	f9404be1 	ldr	x1, [sp, #144]
    2a88:	b940abe0 	ldr	w0, [sp, #168]
    2a8c:	b900abe2 	str	w2, [sp, #168]
    2a90:	8b20c020 	add	x0, x1, w0, sxtw
    2a94:	17fffe5d 	b	2408 <_vsnprintf+0x338>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    2a98:	121c74c6 	and	w6, w6, #0xfffffff3
    2a9c:	d2800108 	mov	x8, #0x8                   	// #8
    2aa0:	17fffefa 	b	2688 <_vsnprintf+0x5b8>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    2aa4:	37f807e0 	tbnz	w0, #31, 2ba0 <_vsnprintf+0xad0>
    2aa8:	91003e82 	add	x2, x20, #0xf
    2aac:	aa1403e0 	mov	x0, x20
    2ab0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2ab4:	2a1703e7 	mov	w7, w23
    2ab8:	aa1b03e2 	mov	x2, x27
    2abc:	f9400004 	ldr	x4, [x0]
    2ac0:	b90003f8 	str	w24, [sp]
    2ac4:	b9000be6 	str	w6, [sp, #8]
    2ac8:	aa0803e6 	mov	x6, x8
    2acc:	17fffe6f 	b	2488 <_vsnprintf+0x3b8>
                    const long long value = va_arg(va, long long);
    2ad0:	37f80560 	tbnz	w0, #31, 2b7c <_vsnprintf+0xaac>
    2ad4:	91003e82 	add	x2, x20, #0xf
    2ad8:	aa1403e0 	mov	x0, x20
    2adc:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2ae0:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, (unsigned long long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    2ae4:	2a1703e7 	mov	w7, w23
    2ae8:	aa1b03e2 	mov	x2, x27
    2aec:	b90003f8 	str	w24, [sp]
    2af0:	f10000bf 	cmp	x5, #0x0
    2af4:	b9000be6 	str	w6, [sp, #8]
    2af8:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    2afc:	aa0803e6 	mov	x6, x8
    2b00:	d37ffca5 	lsr	x5, x5, #63
    2b04:	17fffe62 	b	248c <_vsnprintf+0x3bc>
                flags &= ~FLAGS_HASH; // no hash for dec format
    2b08:	d2800208 	mov	x8, #0x10                  	// #16
    2b0c:	17fffedb 	b	2678 <_vsnprintf+0x5a8>
                    const long value = va_arg(va, long);
    2b10:	37f80c40 	tbnz	w0, #31, 2c98 <_vsnprintf+0xbc8>
    2b14:	91003e82 	add	x2, x20, #0xf
    2b18:	aa1403e0 	mov	x0, x20
    2b1c:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2b20:	f9400005 	ldr	x5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    2b24:	2a1703e7 	mov	w7, w23
    2b28:	aa1b03e2 	mov	x2, x27
    2b2c:	b90003f8 	str	w24, [sp]
    2b30:	f10000bf 	cmp	x5, #0x0
    2b34:	b9000be6 	str	w6, [sp, #8]
    2b38:	da85a4a4 	cneg	x4, x5, lt  // lt = tstop
    2b3c:	aa0803e6 	mov	x6, x8
    2b40:	d37ffca5 	lsr	x5, x5, #63
    2b44:	17fffeed 	b	26f8 <_vsnprintf+0x628>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    2b48:	37f80820 	tbnz	w0, #31, 2c4c <_vsnprintf+0xb7c>
    2b4c:	91003e82 	add	x2, x20, #0xf
    2b50:	aa1403e0 	mov	x0, x20
    2b54:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2b58:	2a1703e7 	mov	w7, w23
    2b5c:	f9400004 	ldr	x4, [x0]
    2b60:	b90003f8 	str	w24, [sp]
    2b64:	b9000be6 	str	w6, [sp, #8]
    2b68:	aa0803e6 	mov	x6, x8
    2b6c:	17ffff9f 	b	29e8 <_vsnprintf+0x918>
                flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
    2b70:	121c74c6 	and	w6, w6, #0xfffffff3
    2b74:	d2800048 	mov	x8, #0x2                   	// #2
    2b78:	17fffec4 	b	2688 <_vsnprintf+0x5b8>
                    const long long value = va_arg(va, long long);
    2b7c:	b9407be0 	ldr	w0, [sp, #120]
    2b80:	11002002 	add	w2, w0, #0x8
    2b84:	7100005f 	cmp	w2, #0x0
    2b88:	54000a4d 	b.le	2cd0 <_vsnprintf+0xc00>
    2b8c:	91003e84 	add	x4, x20, #0xf
    2b90:	aa1403e0 	mov	x0, x20
    2b94:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2b98:	b9007be2 	str	w2, [sp, #120]
    2b9c:	17ffffd1 	b	2ae0 <_vsnprintf+0xa10>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    2ba0:	b9407be0 	ldr	w0, [sp, #120]
    2ba4:	11002002 	add	w2, w0, #0x8
    2ba8:	7100005f 	cmp	w2, #0x0
    2bac:	5400088d 	b.le	2cbc <_vsnprintf+0xbec>
    2bb0:	91003e84 	add	x4, x20, #0xf
    2bb4:	aa1403e0 	mov	x0, x20
    2bb8:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2bbc:	b9007be2 	str	w2, [sp, #120]
    2bc0:	17ffffbd 	b	2ab4 <_vsnprintf+0x9e4>
                                                                                                                                      : va_arg(va, unsigned int);
    2bc4:	37f80d00 	tbnz	w0, #31, 2d64 <_vsnprintf+0xc94>
    2bc8:	aa1403e0 	mov	x0, x20
    2bcc:	91002e82 	add	x2, x20, #0xb
    2bd0:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2bd4:	b9400004 	ldr	w4, [x0]
    2bd8:	17ffff7f 	b	29d4 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    2bdc:	37f80b20 	tbnz	w0, #31, 2d40 <_vsnprintf+0xc70>
    2be0:	91002e82 	add	x2, x20, #0xb
    2be4:	aa1403e0 	mov	x0, x20
    2be8:	927df054 	and	x20, x2, #0xfffffffffffffff8
    2bec:	b9400005 	ldr	w5, [x0]
                    idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
    2bf0:	710000bf 	cmp	w5, #0x0
    2bf4:	5a85a4a4 	cneg	w4, w5, lt  // lt = tstop
    2bf8:	17fffeb9 	b	26dc <_vsnprintf+0x60c>
    for (s = str; *s && maxsize--; ++s)
    2bfc:	b900a3ff 	str	wzr, [sp, #160]
    2c00:	17fffe5c 	b	2570 <_vsnprintf+0x4a0>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2c04:	b9407be0 	ldr	w0, [sp, #120]
    2c08:	11002002 	add	w2, w0, #0x8
    2c0c:	7100005f 	cmp	w2, #0x0
    2c10:	54000bed 	b.le	2d8c <_vsnprintf+0xcbc>
    2c14:	91002e84 	add	x4, x20, #0xb
    2c18:	aa1403e0 	mov	x0, x20
    2c1c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2c20:	b9007be2 	str	w2, [sp, #120]
    2c24:	17ffff6b 	b	29d0 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2c28:	b9407be0 	ldr	w0, [sp, #120]
    2c2c:	11002002 	add	w2, w0, #0x8
    2c30:	7100005f 	cmp	w2, #0x0
    2c34:	54000b6d 	b.le	2da0 <_vsnprintf+0xcd0>
    2c38:	91002e84 	add	x4, x20, #0xb
    2c3c:	aa1403e0 	mov	x0, x20
    2c40:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2c44:	b9007be2 	str	w2, [sp, #120]
    2c48:	17ffff78 	b	2a28 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    2c4c:	b9407be0 	ldr	w0, [sp, #120]
    2c50:	11002002 	add	w2, w0, #0x8
    2c54:	7100005f 	cmp	w2, #0x0
    2c58:	54000aed 	b.le	2db4 <_vsnprintf+0xce4>
    2c5c:	91003e84 	add	x4, x20, #0xf
    2c60:	aa1403e0 	mov	x0, x20
    2c64:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2c68:	b9007be2 	str	w2, [sp, #120]
    2c6c:	17ffffbb 	b	2b58 <_vsnprintf+0xa88>
            out((char)va_arg(va, int), buffer, idx++, maxlen);
    2c70:	f94047e1 	ldr	x1, [sp, #136]
    2c74:	b9407be0 	ldr	w0, [sp, #120]
    2c78:	b9007be2 	str	w2, [sp, #120]
    2c7c:	8b20c020 	add	x0, x1, w0, sxtw
    2c80:	17fffe10 	b	24c0 <_vsnprintf+0x3f0>
    2c84:	f94047e1 	ldr	x1, [sp, #136]
    2c88:	b9407be0 	ldr	w0, [sp, #120]
    2c8c:	b9007be2 	str	w2, [sp, #120]
    2c90:	8b20c020 	add	x0, x1, w0, sxtw
    2c94:	17ffff31 	b	2958 <_vsnprintf+0x888>
                    const long value = va_arg(va, long);
    2c98:	b9407be0 	ldr	w0, [sp, #120]
    2c9c:	11002002 	add	w2, w0, #0x8
    2ca0:	7100005f 	cmp	w2, #0x0
    2ca4:	5400092d 	b.le	2dc8 <_vsnprintf+0xcf8>
    2ca8:	91003e84 	add	x4, x20, #0xf
    2cac:	aa1403e0 	mov	x0, x20
    2cb0:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2cb4:	b9007be2 	str	w2, [sp, #120]
    2cb8:	17ffff9a 	b	2b20 <_vsnprintf+0xa50>
                    idx = _ntoa_long_long(out, buffer, idx, maxlen, va_arg(va, unsigned long long), false, base, precision, width, flags);
    2cbc:	f94047e1 	ldr	x1, [sp, #136]
    2cc0:	b9407be0 	ldr	w0, [sp, #120]
    2cc4:	b9007be2 	str	w2, [sp, #120]
    2cc8:	8b20c020 	add	x0, x1, w0, sxtw
    2ccc:	17ffff7a 	b	2ab4 <_vsnprintf+0x9e4>
                    const long long value = va_arg(va, long long);
    2cd0:	f94047e1 	ldr	x1, [sp, #136]
    2cd4:	b9407be0 	ldr	w0, [sp, #120]
    2cd8:	b9007be2 	str	w2, [sp, #120]
    2cdc:	8b20c020 	add	x0, x1, w0, sxtw
    2ce0:	17ffff80 	b	2ae0 <_vsnprintf+0xa10>
                while (l++ < width) {
    2ce4:	aa1b03f5 	mov	x21, x27
    2ce8:	17ffff17 	b	2944 <_vsnprintf+0x874>
                while (l++ < width) {
    2cec:	b900a3e0 	str	w0, [sp, #160]
    2cf0:	17ffff01 	b	28f4 <_vsnprintf+0x824>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2cf4:	b9407be0 	ldr	w0, [sp, #120]
    2cf8:	11002002 	add	w2, w0, #0x8
    2cfc:	7100005f 	cmp	w2, #0x0
    2d00:	5400078d 	b.le	2df0 <_vsnprintf+0xd20>
    2d04:	aa1403e0 	mov	x0, x20
    2d08:	91002e84 	add	x4, x20, #0xb
    2d0c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2d10:	b9007be2 	str	w2, [sp, #120]
    2d14:	79400004 	ldrh	w4, [x0]
    2d18:	17ffff2f 	b	29d4 <_vsnprintf+0x904>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2d1c:	b9407be0 	ldr	w0, [sp, #120]
    2d20:	11002002 	add	w2, w0, #0x8
    2d24:	7100005f 	cmp	w2, #0x0
    2d28:	540005ad 	b.le	2ddc <_vsnprintf+0xd0c>
    2d2c:	91002e84 	add	x4, x20, #0xb
    2d30:	aa1403e0 	mov	x0, x20
    2d34:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2d38:	b9007be2 	str	w2, [sp, #120]
    2d3c:	17fffe64 	b	26cc <_vsnprintf+0x5fc>
                                                                                                           : va_arg(va, int);
    2d40:	b9407be0 	ldr	w0, [sp, #120]
    2d44:	11002002 	add	w2, w0, #0x8
    2d48:	7100005f 	cmp	w2, #0x0
    2d4c:	540005ed 	b.le	2e08 <_vsnprintf+0xd38>
    2d50:	91002e84 	add	x4, x20, #0xb
    2d54:	aa1403e0 	mov	x0, x20
    2d58:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2d5c:	b9007be2 	str	w2, [sp, #120]
    2d60:	17ffffa3 	b	2bec <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    2d64:	b9407be0 	ldr	w0, [sp, #120]
    2d68:	11002002 	add	w2, w0, #0x8
    2d6c:	7100005f 	cmp	w2, #0x0
    2d70:	5400056d 	b.le	2e1c <_vsnprintf+0xd4c>
    2d74:	aa1403e0 	mov	x0, x20
    2d78:	91002e84 	add	x4, x20, #0xb
    2d7c:	927df094 	and	x20, x4, #0xfffffffffffffff8
    2d80:	b9007be2 	str	w2, [sp, #120]
    2d84:	b9400004 	ldr	w4, [x0]
    2d88:	17ffff13 	b	29d4 <_vsnprintf+0x904>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2d8c:	f94047e1 	ldr	x1, [sp, #136]
    2d90:	b9407be0 	ldr	w0, [sp, #120]
    2d94:	b9007be2 	str	w2, [sp, #120]
    2d98:	8b20c020 	add	x0, x1, w0, sxtw
    2d9c:	17ffff0d 	b	29d0 <_vsnprintf+0x900>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2da0:	f94047e1 	ldr	x1, [sp, #136]
    2da4:	b9407be0 	ldr	w0, [sp, #120]
    2da8:	b9007be2 	str	w2, [sp, #120]
    2dac:	8b20c020 	add	x0, x1, w0, sxtw
    2db0:	17ffff1e 	b	2a28 <_vsnprintf+0x958>
                    idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
    2db4:	f94047e1 	ldr	x1, [sp, #136]
    2db8:	b9407be0 	ldr	w0, [sp, #120]
    2dbc:	b9007be2 	str	w2, [sp, #120]
    2dc0:	8b20c020 	add	x0, x1, w0, sxtw
    2dc4:	17ffff65 	b	2b58 <_vsnprintf+0xa88>
                    const long value = va_arg(va, long);
    2dc8:	f94047e1 	ldr	x1, [sp, #136]
    2dcc:	b9407be0 	ldr	w0, [sp, #120]
    2dd0:	b9007be2 	str	w2, [sp, #120]
    2dd4:	8b20c020 	add	x0, x1, w0, sxtw
    2dd8:	17ffff52 	b	2b20 <_vsnprintf+0xa50>
                    const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int)
    2ddc:	f94047e1 	ldr	x1, [sp, #136]
    2de0:	b9407be0 	ldr	w0, [sp, #120]
    2de4:	b9007be2 	str	w2, [sp, #120]
    2de8:	8b20c020 	add	x0, x1, w0, sxtw
    2dec:	17fffe38 	b	26cc <_vsnprintf+0x5fc>
                    const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int)
    2df0:	f94047e1 	ldr	x1, [sp, #136]
    2df4:	b9407be0 	ldr	w0, [sp, #120]
    2df8:	b9007be2 	str	w2, [sp, #120]
    2dfc:	8b20c020 	add	x0, x1, w0, sxtw
    2e00:	79400004 	ldrh	w4, [x0]
    2e04:	17fffef4 	b	29d4 <_vsnprintf+0x904>
                                                                                                           : va_arg(va, int);
    2e08:	f94047e1 	ldr	x1, [sp, #136]
    2e0c:	b9407be0 	ldr	w0, [sp, #120]
    2e10:	b9007be2 	str	w2, [sp, #120]
    2e14:	8b20c020 	add	x0, x1, w0, sxtw
    2e18:	17ffff75 	b	2bec <_vsnprintf+0xb1c>
                                                                                                                                      : va_arg(va, unsigned int);
    2e1c:	f94047e1 	ldr	x1, [sp, #136]
    2e20:	b9407be0 	ldr	w0, [sp, #120]
    2e24:	b9007be2 	str	w2, [sp, #120]
    2e28:	8b20c020 	add	x0, x1, w0, sxtw
    2e2c:	b9400004 	ldr	w4, [x0]
    2e30:	17fffee9 	b	29d4 <_vsnprintf+0x904>
    return (ch >= '0') && (ch <= '9');
    2e34:	5100c002 	sub	w2, w0, #0x30
    unsigned int i = 0U;
    2e38:	52800018 	mov	w24, #0x0                   	// #0
        if (_is_digit(*format)) {
    2e3c:	12001c42 	and	w2, w2, #0xff
    2e40:	7100245f 	cmp	w2, #0x9
    2e44:	54ffa2a8 	b.hi	2298 <_vsnprintf+0x1c8>  // b.pmore
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    2e48:	52800142 	mov	w2, #0xa                   	// #10
    2e4c:	d503201f 	nop
    2e50:	1b020305 	madd	w5, w24, w2, w0
    while (_is_digit(**str)) {
    2e54:	39400100 	ldrb	w0, [x8]
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    2e58:	aa0803f9 	mov	x25, x8
    2e5c:	91000508 	add	x8, x8, #0x1
    return (ch >= '0') && (ch <= '9');
    2e60:	5100c004 	sub	w4, w0, #0x30
        i = i * 10U + (unsigned int)(*((*str)++) - '0');
    2e64:	5100c0b8 	sub	w24, w5, #0x30
    while (_is_digit(**str)) {
    2e68:	12001c84 	and	w4, w4, #0xff
    2e6c:	7100249f 	cmp	w4, #0x9
    2e70:	54ffff09 	b.ls	2e50 <_vsnprintf+0xd80>  // b.plast
    2e74:	17fffd09 	b	2298 <_vsnprintf+0x1c8>
        switch (*format) {
    2e78:	aa1903e4 	mov	x4, x25
    2e7c:	17fffcf0 	b	223c <_vsnprintf+0x16c>

0000000000002e80 <printf>:

///////////////////////////////////////////////////////////////////////////////

int printf(const char* format, ...)
{
    2e80:	a9ad7bfd 	stp	x29, x30, [sp, #-304]!
    2e84:	910003fd 	mov	x29, sp
    2e88:	f9000bf3 	str	x19, [sp, #16]
    2e8c:	aa0003f3 	mov	x19, x0
    2e90:	3d801fe0 	str	q0, [sp, #112]
    2e94:	3d8023e1 	str	q1, [sp, #128]
    2e98:	3d8027e2 	str	q2, [sp, #144]
    2e9c:	3d802be3 	str	q3, [sp, #160]
    2ea0:	3d802fe4 	str	q4, [sp, #176]
    2ea4:	3d8033e5 	str	q5, [sp, #192]
    2ea8:	3d8037e6 	str	q6, [sp, #208]
    2eac:	3d803be7 	str	q7, [sp, #224]
    2eb0:	a90f8be1 	stp	x1, x2, [sp, #248]
    2eb4:	a91093e3 	stp	x3, x4, [sp, #264]
    2eb8:	a9119be5 	stp	x5, x6, [sp, #280]
    2ebc:	f90097e7 	str	x7, [sp, #296]
    if (!init_uart_mmio()) {
    2ec0:	97fff968 	bl	1460 <init_uart_mmio>
    2ec4:	72001c1f 	tst	w0, #0xff
    2ec8:	540002e0 	b.eq	2f24 <printf+0xa4>  // b.none
        return -1;
    }
    va_list va;
    va_start(va, format);
    2ecc:	9103c3e0 	add	x0, sp, #0xf0
    2ed0:	9104c3e3 	add	x3, sp, #0x130
    2ed4:	9104c3e4 	add	x4, sp, #0x130
    2ed8:	128006e2 	mov	w2, #0xffffffc8            	// #-56
    2edc:	12800fe1 	mov	w1, #0xffffff80            	// #-128
    2ee0:	a90513e3 	stp	x3, x4, [sp, #80]
    char buffer[1];
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2ee4:	aa1303e3 	mov	x3, x19
    va_start(va, format);
    2ee8:	f90033e0 	str	x0, [sp, #96]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2eec:	910083e4 	add	x4, sp, #0x20
    va_start(va, format);
    2ef0:	290d07e2 	stp	w2, w1, [sp, #104]
    const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    2ef4:	90000000 	adrp	x0, 2000 <_ftoa+0x330>
    2ef8:	91028000 	add	x0, x0, #0xa0
    2efc:	910123e1 	add	x1, sp, #0x48
    2f00:	a94527e8 	ldp	x8, x9, [sp, #80]
    2f04:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    2f08:	a9461fe6 	ldp	x6, x7, [sp, #96]
    2f0c:	a90227e8 	stp	x8, x9, [sp, #32]
    2f10:	a9031fe6 	stp	x6, x7, [sp, #48]
    2f14:	97fffc6f 	bl	20d0 <_vsnprintf>
    va_end(va);
    return ret;
}
    2f18:	f9400bf3 	ldr	x19, [sp, #16]
    2f1c:	a8d37bfd 	ldp	x29, x30, [sp], #304
    2f20:	d65f03c0 	ret
        return -1;
    2f24:	12800000 	mov	w0, #0xffffffff            	// #-1
    2f28:	17fffffc 	b	2f18 <printf+0x98>
    2f2c:	d503201f 	nop

0000000000002f30 <sprintf_>:

int sprintf_(char* buffer, const char* format, ...)
{
    2f30:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    2f34:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    2f38:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    2f3c:	910003fd 	mov	x29, sp
    va_start(va, format);
    2f40:	910343eb 	add	x11, sp, #0xd0
    2f44:	910403ea 	add	x10, sp, #0x100
    2f48:	a9032bea 	stp	x10, x10, [sp, #48]
{
    2f4c:	aa0103ea 	mov	x10, x1
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2f50:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    2f54:	f90023eb 	str	x11, [sp, #64]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2f58:	f0ffffe0 	adrp	x0, 1000 <ipc_msg_send_nowait>
    2f5c:	91148000 	add	x0, x0, #0x520
    va_start(va, format);
    2f60:	290923e9 	stp	w9, w8, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2f64:	a94337ec 	ldp	x12, x13, [sp, #48]
    2f68:	a90137ec 	stp	x12, x13, [sp, #16]
    2f6c:	a94427e8 	ldp	x8, x9, [sp, #64]
    2f70:	a90227e8 	stp	x8, x9, [sp, #32]
{
    2f74:	3d8017e0 	str	q0, [sp, #80]
    2f78:	3d801be1 	str	q1, [sp, #96]
    2f7c:	3d801fe2 	str	q2, [sp, #112]
    2f80:	3d8023e3 	str	q3, [sp, #128]
    2f84:	3d8027e4 	str	q4, [sp, #144]
    2f88:	3d802be5 	str	q5, [sp, #160]
    2f8c:	3d802fe6 	str	q6, [sp, #176]
    2f90:	3d8033e7 	str	q7, [sp, #192]
    2f94:	a90d0fe2 	stp	x2, x3, [sp, #208]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2f98:	aa0a03e3 	mov	x3, x10
    2f9c:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    2fa0:	a90e17e4 	stp	x4, x5, [sp, #224]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2fa4:	910043e4 	add	x4, sp, #0x10
{
    2fa8:	a90f1fe6 	stp	x6, x7, [sp, #240]
    const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
    2fac:	97fffc49 	bl	20d0 <_vsnprintf>
    va_end(va);
    return ret;
}
    2fb0:	a8d07bfd 	ldp	x29, x30, [sp], #256
    2fb4:	d65f03c0 	ret
    2fb8:	d503201f 	nop
    2fbc:	d503201f 	nop

0000000000002fc0 <snprintf_>:

int snprintf_(char* buffer, size_t count, const char* format, ...)
{
    2fc0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    va_list va;
    va_start(va, format);
    2fc4:	128004eb 	mov	w11, #0xffffffd8            	// #-40
    2fc8:	12800fe9 	mov	w9, #0xffffff80            	// #-128
{
    2fcc:	910003fd 	mov	x29, sp
    va_start(va, format);
    2fd0:	910343ea 	add	x10, sp, #0xd0
    2fd4:	910403e8 	add	x8, sp, #0x100
    2fd8:	a90323e8 	stp	x8, x8, [sp, #48]
{
    2fdc:	aa0103e8 	mov	x8, x1
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2fe0:	aa0003e1 	mov	x1, x0
    va_start(va, format);
    2fe4:	f90023ea 	str	x10, [sp, #64]
{
    2fe8:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    2fec:	290927eb 	stp	w11, w9, [sp, #72]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    2ff0:	aa0803e2 	mov	x2, x8
    2ff4:	a94337ec 	ldp	x12, x13, [sp, #48]
    2ff8:	f0ffffe0 	adrp	x0, 1000 <ipc_msg_send_nowait>
    2ffc:	a94427e8 	ldp	x8, x9, [sp, #64]
    3000:	91148000 	add	x0, x0, #0x520
    3004:	a90137ec 	stp	x12, x13, [sp, #16]
    3008:	a90227e8 	stp	x8, x9, [sp, #32]
{
    300c:	3d8017e0 	str	q0, [sp, #80]
    3010:	3d801be1 	str	q1, [sp, #96]
    3014:	3d801fe2 	str	q2, [sp, #112]
    3018:	3d8023e3 	str	q3, [sp, #128]
    301c:	3d8027e4 	str	q4, [sp, #144]
    3020:	3d802be5 	str	q5, [sp, #160]
    3024:	3d802fe6 	str	q6, [sp, #176]
    3028:	3d8033e7 	str	q7, [sp, #192]
    302c:	a90d93e3 	stp	x3, x4, [sp, #216]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    3030:	910043e4 	add	x4, sp, #0x10
    3034:	aa0a03e3 	mov	x3, x10
{
    3038:	a90e9be5 	stp	x5, x6, [sp, #232]
    303c:	f9007fe7 	str	x7, [sp, #248]
    const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
    3040:	97fffc24 	bl	20d0 <_vsnprintf>
    va_end(va);
    return ret;
}
    3044:	a8d07bfd 	ldp	x29, x30, [sp], #256
    3048:	d65f03c0 	ret
    304c:	d503201f 	nop

0000000000003050 <vprintf_>:

int vprintf_(const char* format, va_list va)
{
    3050:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    char buffer[1];
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    3054:	aa0003e3 	mov	x3, x0
    3058:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
{
    305c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
    3060:	a9402428 	ldp	x8, x9, [x1]
    3064:	910043e4 	add	x4, sp, #0x10
    3068:	a9411c26 	ldp	x6, x7, [x1, #16]
    306c:	f0ffffe0 	adrp	x0, 2000 <_ftoa+0x330>
    3070:	9100e3e1 	add	x1, sp, #0x38
    3074:	91028000 	add	x0, x0, #0xa0
    3078:	a90127e8 	stp	x8, x9, [sp, #16]
    307c:	a9021fe6 	stp	x6, x7, [sp, #32]
    3080:	97fffc14 	bl	20d0 <_vsnprintf>
}
    3084:	a8c47bfd 	ldp	x29, x30, [sp], #64
    3088:	d65f03c0 	ret
    308c:	d503201f 	nop

0000000000003090 <vsnprintf_>:

int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
{
    3090:	aa0303e4 	mov	x4, x3
    3094:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3098:	aa0103e5 	mov	x5, x1
    309c:	910003fd 	mov	x29, sp
    return _vsnprintf(_out_buffer, buffer, count, format, va);
    30a0:	a9402488 	ldp	x8, x9, [x4]
    30a4:	aa0003e1 	mov	x1, x0
    30a8:	a9411c86 	ldp	x6, x7, [x4, #16]
    30ac:	aa0203e3 	mov	x3, x2
    30b0:	910043e4 	add	x4, sp, #0x10
    30b4:	aa0503e2 	mov	x2, x5
    30b8:	d0ffffe0 	adrp	x0, 1000 <ipc_msg_send_nowait>
    30bc:	91148000 	add	x0, x0, #0x520
    30c0:	a90127e8 	stp	x8, x9, [sp, #16]
    30c4:	a9021fe6 	stp	x6, x7, [sp, #32]
    30c8:	97fffc02 	bl	20d0 <_vsnprintf>
}
    30cc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    30d0:	d65f03c0 	ret
    30d4:	d503201f 	nop
    30d8:	d503201f 	nop
    30dc:	d503201f 	nop

00000000000030e0 <fctprintf>:

int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
{
    30e0:	a9af7bfd 	stp	x29, x30, [sp, #-272]!
    va_list va;
    va_start(va, format);
    30e4:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    30e8:	12800fe8 	mov	w8, #0xffffff80            	// #-128
{
    30ec:	910003fd 	mov	x29, sp
    va_start(va, format);
    30f0:	910443ea 	add	x10, sp, #0x110
    30f4:	910383eb 	add	x11, sp, #0xe0
    30f8:	f90023ea 	str	x10, [sp, #64]
{
    30fc:	aa0203ea 	mov	x10, x2
    va_start(va, format);
    3100:	910443e2 	add	x2, sp, #0x110
    3104:	f90027e2 	str	x2, [sp, #72]
    3108:	f9002beb 	str	x11, [sp, #80]
{
    310c:	aa0003ec 	mov	x12, x0
    va_start(va, format);
    3110:	290b23e9 	stp	w9, w8, [sp, #88]
{
    3114:	aa0103eb 	mov	x11, x1
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    3118:	a9443fee 	ldp	x14, x15, [sp, #64]
    311c:	9100c3e1 	add	x1, sp, #0x30
    3120:	a94527e8 	ldp	x8, x9, [sp, #80]
    3124:	92800002 	mov	x2, #0xffffffffffffffff    	// #-1
    3128:	f0ffffe0 	adrp	x0, 2000 <_ftoa+0x330>
    312c:	9102c000 	add	x0, x0, #0xb0
    3130:	a9013fee 	stp	x14, x15, [sp, #16]
    3134:	a90227e8 	stp	x8, x9, [sp, #32]
    const out_fct_wrap_type out_fct_wrap = { out, arg };
    3138:	f9001bec 	str	x12, [sp, #48]
    313c:	f9001feb 	str	x11, [sp, #56]
{
    3140:	3d801be0 	str	q0, [sp, #96]
    3144:	3d801fe1 	str	q1, [sp, #112]
    3148:	3d8023e2 	str	q2, [sp, #128]
    314c:	3d8027e3 	str	q3, [sp, #144]
    3150:	3d802be4 	str	q4, [sp, #160]
    3154:	3d802fe5 	str	q5, [sp, #176]
    3158:	3d8033e6 	str	q6, [sp, #192]
    315c:	3d8037e7 	str	q7, [sp, #208]
    3160:	a90e93e3 	stp	x3, x4, [sp, #232]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    3164:	910043e4 	add	x4, sp, #0x10
    3168:	aa0a03e3 	mov	x3, x10
{
    316c:	a90f9be5 	stp	x5, x6, [sp, #248]
    3170:	f90087e7 	str	x7, [sp, #264]
    const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
    3174:	97fffbd7 	bl	20d0 <_vsnprintf>
    va_end(va);
    return ret;
    3178:	a8d17bfd 	ldp	x29, x30, [sp], #272
    317c:	d65f03c0 	ret

0000000000003180 <spawn>:
 */
#include "usyscall.h"
#include "libmem.h"

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, ipc_fsize_fn ipc_fsize, char* name, char** argv)
{
    3180:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    3184:	910003fd 	mov	x29, sp
    3188:	a90153f3 	stp	x19, x20, [sp, #16]
    318c:	a9025bf5 	stp	x21, x22, [sp, #32]
    3190:	2a0103f6 	mov	w22, w1
    3194:	a90363f7 	stp	x23, x24, [sp, #48]
    3198:	aa0203f8 	mov	x24, x2
    319c:	aa0003f7 	mov	x23, x0
    31a0:	a9046bf9 	stp	x25, x26, [sp, #64]
    31a4:	aa0403f9 	mov	x25, x4
    31a8:	aa0503fa 	mov	x26, x5
    /* read elf image */
    int file_size = ipc_fsize(session, fd);
    31ac:	d63f0060 	blr	x3
    31b0:	2a0003f4 	mov	w20, w0
    void* img = malloc(file_size);
    31b4:	93407c00 	sxtw	x0, w0
    31b8:	94000202 	bl	39c0 <malloc>
    int read_len = 0;
    while (read_len < file_size) {
    31bc:	7100029f 	cmp	w20, #0x0
    void* img = malloc(file_size);
    31c0:	aa0003f5 	mov	x21, x0
    while (read_len < file_size) {
    31c4:	5400022d 	b.le	3208 <spawn+0x88>
    31c8:	52800013 	mov	w19, #0x0                   	// #0
    31cc:	f9002bfb 	str	x27, [sp, #80]
    31d0:	5282001b 	mov	w27, #0x1000                	// #4096
    31d4:	d503201f 	nop
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    31d8:	4b130284 	sub	w4, w20, w19
        if (cur_read_len < 0) {
            return -1;
        }
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    31dc:	2a1303e3 	mov	w3, w19
        int cur_read_len = file_size - read_len < 4096 ? file_size - read_len : 4096;
    31e0:	7140049f 	cmp	w4, #0x1, lsl #12
        read_len += ipc_read(session, fd, (char*)((uintptr_t)img + read_len), read_len, cur_read_len);
    31e4:	8b33c2a2 	add	x2, x21, w19, sxtw
    31e8:	1a9bd084 	csel	w4, w4, w27, le
    31ec:	2a1603e1 	mov	w1, w22
    31f0:	aa1703e0 	mov	x0, x23
    31f4:	d63f0300 	blr	x24
    31f8:	0b000273 	add	w19, w19, w0
    while (read_len < file_size) {
    31fc:	6b13029f 	cmp	w20, w19
    3200:	54fffecc 	b.gt	31d8 <spawn+0x58>
    3204:	f9402bfb 	ldr	x27, [sp, #80]
    }
    /* sys call */
    int ret = syscall(SYSCALL_SPAWN, (uintptr_t)img, (uintptr_t)name, (uintptr_t)argv, 0);
    3208:	aa1a03e3 	mov	x3, x26
    320c:	aa1903e2 	mov	x2, x25
    3210:	aa1503e1 	mov	x1, x21
    3214:	d2800004 	mov	x4, #0x0                   	// #0
    3218:	52800020 	mov	w0, #0x1                   	// #1
    321c:	940000b9 	bl	3500 <syscall>
    3220:	2a0003f3 	mov	w19, w0
    free(img);
    3224:	aa1503e0 	mov	x0, x21
    3228:	9400028a 	bl	3c50 <free>
    return ret;
}
    322c:	2a1303e0 	mov	w0, w19
    3230:	a94153f3 	ldp	x19, x20, [sp, #16]
    3234:	a9425bf5 	ldp	x21, x22, [sp, #32]
    3238:	a94363f7 	ldp	x23, x24, [sp, #48]
    323c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    3240:	a8c67bfd 	ldp	x29, x30, [sp], #96
    3244:	d65f03c0 	ret
    3248:	d503201f 	nop
    324c:	d503201f 	nop

0000000000003250 <thread>:

int thread(void* entry, char* name, char** argv)
{
    3250:	aa0103e4 	mov	x4, x1
    return syscall(SYSCALL_THREAD, (uintptr_t)entry, (uintptr_t)name, (uintptr_t)argv, 0);
    3254:	aa0203e3 	mov	x3, x2
    3258:	aa0003e1 	mov	x1, x0
    325c:	aa0403e2 	mov	x2, x4
    3260:	52800120 	mov	w0, #0x9                   	// #9
    3264:	d2800004 	mov	x4, #0x0                   	// #0
    3268:	140000a6 	b	3500 <syscall>
    326c:	d503201f 	nop

0000000000003270 <exit>:
}

void exit(int status)
{
    syscall(SYSCALL_EXIT, (uintptr_t)status, 0, 0, 0);
    3270:	93407c01 	sxtw	x1, w0
    3274:	d2800004 	mov	x4, #0x0                   	// #0
    3278:	d2800003 	mov	x3, #0x0                   	// #0
    327c:	d2800002 	mov	x2, #0x0                   	// #0
    3280:	52800040 	mov	w0, #0x2                   	// #2
    3284:	1400009f 	b	3500 <syscall>
    3288:	d503201f 	nop
    328c:	d503201f 	nop

0000000000003290 <yield>:
}

int yield(task_yield_reason reason)
{
    return syscall(SYSCALL_YIELD, (uintptr_t)reason, 0, 0, 0);
    3290:	2a0003e1 	mov	w1, w0
    3294:	d2800004 	mov	x4, #0x0                   	// #0
    3298:	d2800003 	mov	x3, #0x0                   	// #0
    329c:	d2800002 	mov	x2, #0x0                   	// #0
    32a0:	52800060 	mov	w0, #0x3                   	// #3
    32a4:	14000097 	b	3500 <syscall>
    32a8:	d503201f 	nop
    32ac:	d503201f 	nop

00000000000032b0 <kill>:
}

int kill(int pid)
{
    return syscall(SYSCALL_KILL, (intptr_t)pid, 0, 0, 0);
    32b0:	93407c01 	sxtw	x1, w0
    32b4:	d2800004 	mov	x4, #0x0                   	// #0
    32b8:	d2800003 	mov	x3, #0x0                   	// #0
    32bc:	d2800002 	mov	x2, #0x0                   	// #0
    32c0:	52800180 	mov	w0, #0xc                   	// #12
    32c4:	1400008f 	b	3500 <syscall>
    32c8:	d503201f 	nop
    32cc:	d503201f 	nop

00000000000032d0 <register_server>:
}

int register_server(char* name)
{
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    32d0:	aa0003e1 	mov	x1, x0
    32d4:	d2800004 	mov	x4, #0x0                   	// #0
    32d8:	d2800003 	mov	x3, #0x0                   	// #0
    32dc:	d2800002 	mov	x2, #0x0                   	// #0
    32e0:	528000a0 	mov	w0, #0x5                   	// #5
    32e4:	14000087 	b	3500 <syscall>
    32e8:	d503201f 	nop
    32ec:	d503201f 	nop

00000000000032f0 <session>:
}

int session(char* path, int capacity, struct Session* user_session)
{
    32f0:	2a0103e4 	mov	w4, w1
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    32f4:	aa0203e3 	mov	x3, x2
    32f8:	aa0003e1 	mov	x1, x0
    32fc:	528000c0 	mov	w0, #0x6                   	// #6
    3300:	93407c82 	sxtw	x2, w4
    3304:	d2800004 	mov	x4, #0x0                   	// #0
    3308:	1400007e 	b	3500 <syscall>
    330c:	d503201f 	nop

0000000000003310 <poll_session>:
}

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    3310:	93407c22 	sxtw	x2, w1
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    3314:	d2800004 	mov	x4, #0x0                   	// #0
    3318:	aa0003e1 	mov	x1, x0
    331c:	d2800003 	mov	x3, #0x0                   	// #0
    3320:	528000e0 	mov	w0, #0x7                   	// #7
    3324:	14000077 	b	3500 <syscall>
    3328:	d503201f 	nop
    332c:	d503201f 	nop

0000000000003330 <close_session>:
}

int close_session(struct Session* session)
{
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    3330:	aa0003e1 	mov	x1, x0
    3334:	d2800004 	mov	x4, #0x0                   	// #0
    3338:	d2800003 	mov	x3, #0x0                   	// #0
    333c:	d2800002 	mov	x2, #0x0                   	// #0
    3340:	52800100 	mov	w0, #0x8                   	// #8
    3344:	1400006f 	b	3500 <syscall>
    3348:	d503201f 	nop
    334c:	d503201f 	nop

0000000000003350 <get_memblock_info>:
}

int get_memblock_info(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    3350:	aa0003e2 	mov	x2, x0
    3354:	d2800004 	mov	x4, #0x0                   	// #0
    3358:	d2800003 	mov	x3, #0x0                   	// #0
    335c:	d2800061 	mov	x1, #0x3                   	// #3
    3360:	52800140 	mov	w0, #0xa                   	// #10
    3364:	14000067 	b	3500 <syscall>
    3368:	d503201f 	nop
    336c:	d503201f 	nop

0000000000003370 <set_priority>:
}

int set_priority(sys_state_info* info)
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    3370:	aa0003e2 	mov	x2, x0
    3374:	d2800004 	mov	x4, #0x0                   	// #0
    3378:	d2800003 	mov	x3, #0x0                   	// #0
    337c:	d2800021 	mov	x1, #0x1                   	// #1
    3380:	52800140 	mov	w0, #0xa                   	// #10
    3384:	1400005f 	b	3500 <syscall>
    3388:	d503201f 	nop
    338c:	d503201f 	nop

0000000000003390 <task_heap_base>:
}

int task_heap_base()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    3390:	d2800004 	mov	x4, #0x0                   	// #0
    3394:	d2800003 	mov	x3, #0x0                   	// #0
    3398:	d2800002 	mov	x2, #0x0                   	// #0
    339c:	d2800041 	mov	x1, #0x2                   	// #2
    33a0:	52800140 	mov	w0, #0xa                   	// #10
    33a4:	14000057 	b	3500 <syscall>
    33a8:	d503201f 	nop
    33ac:	d503201f 	nop

00000000000033b0 <show_task>:
}

int show_task()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    33b0:	d2800004 	mov	x4, #0x0                   	// #0
    33b4:	d2800003 	mov	x3, #0x0                   	// #0
    33b8:	d2800002 	mov	x2, #0x0                   	// #0
    33bc:	d2800081 	mov	x1, #0x4                   	// #4
    33c0:	52800140 	mov	w0, #0xa                   	// #10
    33c4:	1400004f 	b	3500 <syscall>
    33c8:	d503201f 	nop
    33cc:	d503201f 	nop

00000000000033d0 <show_mem>:
}

int show_mem()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    33d0:	d2800004 	mov	x4, #0x0                   	// #0
    33d4:	d2800003 	mov	x3, #0x0                   	// #0
    33d8:	d2800002 	mov	x2, #0x0                   	// #0
    33dc:	d28000a1 	mov	x1, #0x5                   	// #5
    33e0:	52800140 	mov	w0, #0xa                   	// #10
    33e4:	14000047 	b	3500 <syscall>
    33e8:	d503201f 	nop
    33ec:	d503201f 	nop

00000000000033f0 <show_cpu>:
}

int show_cpu()
{
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    33f0:	d2800004 	mov	x4, #0x0                   	// #0
    33f4:	d2800003 	mov	x3, #0x0                   	// #0
    33f8:	d2800002 	mov	x2, #0x0                   	// #0
    33fc:	d28000c1 	mov	x1, #0x6                   	// #6
    3400:	52800140 	mov	w0, #0xa                   	// #10
    3404:	1400003f 	b	3500 <syscall>
    3408:	d503201f 	nop
    340c:	d503201f 	nop

0000000000003410 <mmap>:
}

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    3410:	2a0203e5 	mov	w5, w2
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    3414:	92401c64 	and	x4, x3, #0xff
    3418:	aa0103e2 	mov	x2, x1
    341c:	aa0003e1 	mov	x1, x0
    3420:	93407ca3 	sxtw	x3, w5
    3424:	52800080 	mov	w0, #0x4                   	// #4
    3428:	14000036 	b	3500 <syscall>
    342c:	d503201f 	nop

0000000000003430 <register_irq>:
}

int register_irq(int irq, int opcode)
{
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    3430:	93407c22 	sxtw	x2, w1
    3434:	d2800004 	mov	x4, #0x0                   	// #0
    3438:	93407c01 	sxtw	x1, w0
    343c:	d2800003 	mov	x3, #0x0                   	// #0
    3440:	52800160 	mov	w0, #0xb                   	// #11
    3444:	1400002f 	b	3500 <syscall>
    3448:	d503201f 	nop
    344c:	d503201f 	nop

0000000000003450 <semaphore_new>:
}

int semaphore_new(int val)
{
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_NEW, (intptr_t)val, 0, 0);
    3450:	93407c02 	sxtw	x2, w0
    3454:	d2800004 	mov	x4, #0x0                   	// #0
    3458:	d2800003 	mov	x3, #0x0                   	// #0
    345c:	d2800001 	mov	x1, #0x0                   	// #0
    3460:	528001a0 	mov	w0, #0xd                   	// #13
    3464:	14000027 	b	3500 <syscall>
    3468:	d503201f 	nop
    346c:	d503201f 	nop

0000000000003470 <semaphore_free>:
}

bool semaphore_free(int sem_id)
{
    3470:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    3474:	93407c02 	sxtw	x2, w0
    3478:	d2800004 	mov	x4, #0x0                   	// #0
{
    347c:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_FREE, (intptr_t)sem_id, 0, 0);
    3480:	d2800003 	mov	x3, #0x0                   	// #0
    3484:	d2800021 	mov	x1, #0x1                   	// #1
    3488:	528001a0 	mov	w0, #0xd                   	// #13
    348c:	9400001d 	bl	3500 <syscall>
    3490:	7100001f 	cmp	w0, #0x0
}
    3494:	1a9f07e0 	cset	w0, ne  // ne = any
    3498:	a8c17bfd 	ldp	x29, x30, [sp], #16
    349c:	d65f03c0 	ret

00000000000034a0 <semaphore_wait>:

bool semaphore_wait(int sem_id)
{
    34a0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    34a4:	93407c02 	sxtw	x2, w0
    34a8:	d2800004 	mov	x4, #0x0                   	// #0
{
    34ac:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_WAIT, (intptr_t)sem_id, 0, 0);
    34b0:	d2800003 	mov	x3, #0x0                   	// #0
    34b4:	d2800061 	mov	x1, #0x3                   	// #3
    34b8:	528001a0 	mov	w0, #0xd                   	// #13
    34bc:	94000011 	bl	3500 <syscall>
    34c0:	7100001f 	cmp	w0, #0x0
}
    34c4:	1a9f07e0 	cset	w0, ne  // ne = any
    34c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    34cc:	d65f03c0 	ret

00000000000034d0 <semaphore_signal>:

bool semaphore_signal(int sem_id)
{
    34d0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    34d4:	93407c02 	sxtw	x2, w0
    34d8:	d2800004 	mov	x4, #0x0                   	// #0
{
    34dc:	910003fd 	mov	x29, sp
    return syscall(SYSCALL_SEMAPHORE, (intptr_t)SYS_SEM_SIGNAL, (intptr_t)sem_id, 0, 0);
    34e0:	d2800003 	mov	x3, #0x0                   	// #0
    34e4:	d2800041 	mov	x1, #0x2                   	// #2
    34e8:	528001a0 	mov	w0, #0xd                   	// #13
    34ec:	94000005 	bl	3500 <syscall>
    34f0:	7100001f 	cmp	w0, #0x0
    34f4:	1a9f07e0 	cset	w0, ne  // ne = any
    34f8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    34fc:	d65f03c0 	ret

0000000000003500 <syscall>:
 * See the Mulan PSL v2 for more details.
 */
#include "usyscall.h"

int syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    3500:	2a0003e5 	mov	w5, w0
    3504:	aa0103e6 	mov	x6, x1
    3508:	aa0203e7 	mov	x7, x2
    350c:	aa0303e8 	mov	x8, x3
    3510:	aa0403e9 	mov	x9, x4
    int ret = -1;

    __asm__ volatile(
    3514:	aa0503e0 	mov	x0, x5
    3518:	aa0603e1 	mov	x1, x6
    351c:	aa0703e2 	mov	x2, x7
    3520:	aa0803e3 	mov	x3, x8
    3524:	aa0903e4 	mov	x4, x9
    3528:	d4000001 	svc	#0x0
    352c:	d5033b9f 	dsb	ish
    3530:	d5033fdf 	isb
    3534:	aa0003e5 	mov	x5, x0
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    3538:	2a0503e0 	mov	w0, w5
    353c:	d65f03c0 	ret

0000000000003540 <insert_node>:
    int list = 0;
    void* search_ptr = ptr;
    void* insert_ptr = NULL;

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3540:	f100043f 	cmp	x1, #0x1
    int list = 0;
    3544:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3548:	540000e9 	b.ls	3564 <insert_node+0x24>  // b.plast
    354c:	d503201f 	nop
        size >>= 1;
        list++;
    3550:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    3554:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3558:	7100485f 	cmp	w2, #0x12
    355c:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    3560:	54ffff88 	b.hi	3550 <insert_node+0x10>  // b.pmore
    }

    // Keep size ascending order and search
    search_ptr = segregated_free_lists[list];
    3564:	93407c44 	sxtw	x4, w2
    3568:	d0000046 	adrp	x6, d000 <__global_locale+0x20>
    356c:	912800c6 	add	x6, x6, #0xa00
    void* insert_ptr = NULL;
    3570:	d2800005 	mov	x5, #0x0                   	// #0
    search_ptr = segregated_free_lists[list];
    3574:	f86478c2 	ldr	x2, [x6, x4, lsl #3]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    3578:	b50000c2 	cbnz	x2, 3590 <insert_node+0x50>
    357c:	14000018 	b	35dc <insert_node+0x9c>
        insert_ptr = search_ptr;
        search_ptr = PRED(search_ptr);
    3580:	f9400043 	ldr	x3, [x2]
    while ((search_ptr != NULL) && (size > GET_SIZE(HDRP(search_ptr)))) {
    3584:	aa0203e5 	mov	x5, x2
    3588:	b4000223 	cbz	x3, 35cc <insert_node+0x8c>
    358c:	aa0303e2 	mov	x2, x3
    3590:	b85fc043 	ldur	w3, [x2, #-4]
    3594:	927d7063 	and	x3, x3, #0xfffffff8
    3598:	eb01007f 	cmp	x3, x1
    359c:	54ffff23 	b.cc	3580 <insert_node+0x40>  // b.lo, b.ul, b.last
    }

    // Set predecessor and successor
    if (search_ptr != NULL) {
        if (insert_ptr != NULL) {
    35a0:	b40000c5 	cbz	x5, 35b8 <insert_node+0x78>
            SET_PTR(PRED_PTR(ptr), search_ptr);
    35a4:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    35a8:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    35ac:	f8004005 	stur	x5, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    35b0:	f90000a0 	str	x0, [x5]
            segregated_free_lists[list] = ptr;
        }
    }

    return;
}
    35b4:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), search_ptr);
    35b8:	f9000002 	str	x2, [x0]
            SET_PTR(SUCC_PTR(search_ptr), ptr);
    35bc:	f8004040 	stur	x0, [x2, #4]
            SET_PTR(SUCC_PTR(ptr), NULL);
    35c0:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    35c4:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    35c8:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    35cc:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), insert_ptr);
    35d0:	f8004002 	stur	x2, [x0, #4]
            SET_PTR(PRED_PTR(insert_ptr), ptr);
    35d4:	f9000040 	str	x0, [x2]
}
    35d8:	d65f03c0 	ret
            SET_PTR(PRED_PTR(ptr), NULL);
    35dc:	f900001f 	str	xzr, [x0]
            SET_PTR(SUCC_PTR(ptr), NULL);
    35e0:	f800401f 	stur	xzr, [x0, #4]
            segregated_free_lists[list] = ptr;
    35e4:	f82478c0 	str	x0, [x6, x4, lsl #3]
}
    35e8:	d65f03c0 	ret
    35ec:	d503201f 	nop

00000000000035f0 <delete_node>:

static void delete_node(void* ptr)
{
    int list = 0;
    size_t size = GET_SIZE(HDRP(ptr));
    35f0:	b85fc001 	ldur	w1, [x0, #-4]
    35f4:	121d7022 	and	w2, w1, #0xfffffff8
    35f8:	927d7021 	and	x1, x1, #0xfffffff8

    // Select segregated list
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    35fc:	7100045f 	cmp	w2, #0x1
    int list = 0;
    3600:	52800002 	mov	w2, #0x0                   	// #0
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3604:	540000c9 	b.ls	361c <delete_node+0x2c>  // b.plast
        size >>= 1;
        list++;
    3608:	11000442 	add	w2, w2, #0x1
        size >>= 1;
    360c:	d341fc21 	lsr	x1, x1, #1
    while ((list < LISTLIMIT - 1) && (size > 1)) {
    3610:	7100485f 	cmp	w2, #0x12
    3614:	fa41d820 	ccmp	x1, #0x1, #0x0, le
    3618:	54ffff88 	b.hi	3608 <delete_node+0x18>  // b.pmore
    }

    if (PRED(ptr) != NULL) {
    361c:	f9400003 	ldr	x3, [x0]
        if (SUCC(ptr) != NULL) {
    3620:	f8404001 	ldur	x1, [x0, #4]
    if (PRED(ptr) != NULL) {
    3624:	b40001a3 	cbz	x3, 3658 <delete_node+0x68>
        if (SUCC(ptr) != NULL) {
    3628:	b40000c1 	cbz	x1, 3640 <delete_node+0x50>
            SET_PTR(SUCC_PTR(PRED(ptr)), SUCC(ptr));
    362c:	f8004061 	stur	x1, [x3, #4]
            SET_PTR(PRED_PTR(SUCC(ptr)), PRED(ptr));
    3630:	f8404001 	ldur	x1, [x0, #4]
    3634:	f9400000 	ldr	x0, [x0]
    3638:	f9000020 	str	x0, [x1]
            segregated_free_lists[list] = NULL;
        }
    }

    return;
}
    363c:	d65f03c0 	ret
            segregated_free_lists[list] = PRED(ptr);
    3640:	d0000041 	adrp	x1, d000 <__global_locale+0x20>
    3644:	91280021 	add	x1, x1, #0xa00
            SET_PTR(SUCC_PTR(PRED(ptr)), NULL);
    3648:	f800407f 	stur	xzr, [x3, #4]
            segregated_free_lists[list] = PRED(ptr);
    364c:	f9400000 	ldr	x0, [x0]
    3650:	f822d820 	str	x0, [x1, w2, sxtw #3]
}
    3654:	d65f03c0 	ret
        if (SUCC(ptr) != NULL) {
    3658:	b4000061 	cbz	x1, 3664 <delete_node+0x74>
            SET_PTR(PRED_PTR(SUCC(ptr)), NULL);
    365c:	f900003f 	str	xzr, [x1]
}
    3660:	d65f03c0 	ret
            segregated_free_lists[list] = NULL;
    3664:	d0000040 	adrp	x0, d000 <__global_locale+0x20>
    3668:	91280000 	add	x0, x0, #0xa00
    366c:	f822d81f 	str	xzr, [x0, w2, sxtw #3]
}
    3670:	d65f03c0 	ret
    3674:	d503201f 	nop
    3678:	d503201f 	nop
    367c:	d503201f 	nop

0000000000003680 <coalesce>:

static void* coalesce(void* ptr)
{
    3680:	aa0003e7 	mov	x7, x0
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    3684:	b85f8000 	ldur	w0, [x0, #-8]
    3688:	927d7000 	and	x0, x0, #0xfffffff8
    368c:	cb0000e0 	sub	x0, x7, x0
    3690:	b85fc0e2 	ldur	w2, [x7, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    3694:	927d7045 	and	x5, x2, #0xfffffff8
    3698:	121d7044 	and	w4, w2, #0xfffffff8
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    369c:	b85fc000 	ldur	w0, [x0, #-4]
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(ptr)));
    36a0:	8b0500e3 	add	x3, x7, x5
    36a4:	b85fc062 	ldur	w2, [x3, #-4]
    size_t size = GET_SIZE(HDRP(ptr));

    // Do not coalesce with previous block if the previous block is tagged with Reallocation tag
    if (GET_TAG(HDRP(PREV_BLKP(ptr))))
    36a8:	37080600 	tbnz	w0, #1, 3768 <coalesce+0xe8>
    size_t prev_alloc = GET_ALLOC(HDRP(PREV_BLKP(ptr)));
    36ac:	92400003 	and	x3, x0, #0x1
        prev_alloc = 1;

    if (prev_alloc && next_alloc) { // Case 1
    36b0:	72000041 	ands	w1, w2, #0x1
    36b4:	12000000 	and	w0, w0, #0x1
    36b8:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    36bc:	54000601 	b.ne	377c <coalesce+0xfc>  // b.any
{
    36c0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
        return ptr;
    } else if (prev_alloc && !next_alloc) { // Case 2
    36c4:	6a22001f 	bics	wzr, w0, w2
{
    36c8:	910003fd 	mov	x29, sp
    } else if (prev_alloc && !next_alloc) { // Case 2
    36cc:	540005c1 	b.ne	3784 <coalesce+0x104>  // b.any
        delete_node(ptr);
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(ptr), PACK(size, 0));
        PUT(FTRP(ptr), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) { // Case 3
    36d0:	52000063 	eor	w3, w3, #0x1
        delete_node(ptr);
    36d4:	aa0703e0 	mov	x0, x7
    } else if (!prev_alloc && next_alloc) { // Case 3
    36d8:	6a03003f 	tst	w1, w3
    36dc:	540008a0 	b.eq	37f0 <coalesce+0x170>  // b.none
        delete_node(ptr);
    36e0:	97ffffc4 	bl	35f0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    36e4:	b85f80e0 	ldur	w0, [x7, #-8]
    36e8:	927d7000 	and	x0, x0, #0xfffffff8
    36ec:	cb0000e0 	sub	x0, x7, x0
    36f0:	97ffffc0 	bl	35f0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
        PUT(FTRP(ptr), PACK(size, 0));
    36f4:	297f00e1 	ldp	w1, w0, [x7, #-8]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    36f8:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    36fc:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    3700:	927d7000 	and	x0, x0, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3704:	cb010061 	sub	x1, x3, x1
        PUT(FTRP(ptr), PACK(size, 0));
    3708:	d1002000 	sub	x0, x0, #0x8
    370c:	b86168e1 	ldr	w1, [x7, x1]
    3710:	b86068e6 	ldr	w6, [x7, x0]
    3714:	121d7022 	and	w2, w1, #0xfffffff8
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    3718:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(FTRP(ptr), PACK(size, 0));
    371c:	0b020084 	add	w4, w4, w2
    3720:	121f00c6 	and	w6, w6, #0x2
    3724:	2a0400c6 	orr	w6, w6, w4
    3728:	b82068e6 	str	w6, [x7, x0]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr)));
    372c:	8b050021 	add	x1, x1, x5
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3730:	b85f80e0 	ldur	w0, [x7, #-8]
    3734:	927d7000 	and	x0, x0, #0xfffffff8
    3738:	cb000060 	sub	x0, x3, x0
    373c:	b86068e2 	ldr	w2, [x7, x0]
    3740:	121f0042 	and	w2, w2, #0x2
        delete_node(ptr);
        delete_node(PREV_BLKP(ptr));
        delete_node(NEXT_BLKP(ptr));
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    3744:	2a020082 	orr	w2, w4, w2
    3748:	b82068e2 	str	w2, [x7, x0]
        ptr = PREV_BLKP(ptr);
    374c:	b85f80e0 	ldur	w0, [x7, #-8]
    3750:	927d7000 	and	x0, x0, #0xfffffff8
    3754:	cb0000e7 	sub	x7, x7, x0
    }

    insert_node(ptr, size);
    3758:	aa0703e0 	mov	x0, x7
    375c:	97ffff79 	bl	3540 <insert_node>

    return ptr;
}
    3760:	a8c17bfd 	ldp	x29, x30, [sp], #16
    3764:	d65f03c0 	ret
    if (prev_alloc && next_alloc) { // Case 1
    3768:	72000041 	ands	w1, w2, #0x1
    376c:	52800020 	mov	w0, #0x1                   	// #1
        prev_alloc = 1;
    3770:	d2800023 	mov	x3, #0x1                   	// #1
    if (prev_alloc && next_alloc) { // Case 1
    3774:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    3778:	54fffa40 	b.eq	36c0 <coalesce+0x40>  // b.none
}
    377c:	aa0703e0 	mov	x0, x7
    3780:	d65f03c0 	ret
        delete_node(ptr);
    3784:	aa0703e0 	mov	x0, x7
    3788:	97ffff9a 	bl	35f0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    378c:	b85fc0e0 	ldur	w0, [x7, #-4]
    3790:	927d7000 	and	x0, x0, #0xfffffff8
    3794:	8b0000e0 	add	x0, x7, x0
    3798:	97ffff96 	bl	35f0 <delete_node>
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    379c:	b85fc0e0 	ldur	w0, [x7, #-4]
    37a0:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    37a4:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    37a8:	8b0100e1 	add	x1, x7, x1
    37ac:	b85fc021 	ldur	w1, [x1, #-4]
    37b0:	121d7022 	and	w2, w1, #0xfffffff8
    37b4:	927d7021 	and	x1, x1, #0xfffffff8
        PUT(HDRP(ptr), PACK(size, 0));
    37b8:	0b020084 	add	w4, w4, w2
        size += GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    37bc:	8b050021 	add	x1, x1, x5
        PUT(HDRP(ptr), PACK(size, 0));
    37c0:	2a040000 	orr	w0, w0, w4
    37c4:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(size, 0));
    37c8:	927d7000 	and	x0, x0, #0xfffffff8
    37cc:	d1002000 	sub	x0, x0, #0x8
    37d0:	b86068e2 	ldr	w2, [x7, x0]
    37d4:	121f0042 	and	w2, w2, #0x2
    37d8:	2a040042 	orr	w2, w2, w4
    37dc:	b82068e2 	str	w2, [x7, x0]
    insert_node(ptr, size);
    37e0:	aa0703e0 	mov	x0, x7
    37e4:	97ffff57 	bl	3540 <insert_node>
}
    37e8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    37ec:	d65f03c0 	ret
        delete_node(ptr);
    37f0:	97ffff80 	bl	35f0 <delete_node>
        delete_node(PREV_BLKP(ptr));
    37f4:	b85f80e0 	ldur	w0, [x7, #-8]
    37f8:	927d7000 	and	x0, x0, #0xfffffff8
    37fc:	cb0000e0 	sub	x0, x7, x0
    3800:	97ffff7c 	bl	35f0 <delete_node>
        delete_node(NEXT_BLKP(ptr));
    3804:	b85fc0e0 	ldur	w0, [x7, #-4]
    3808:	927d7000 	and	x0, x0, #0xfffffff8
    380c:	8b0000e0 	add	x0, x7, x0
    3810:	97ffff78 	bl	35f0 <delete_node>
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3814:	297f04e0 	ldp	w0, w1, [x7, #-8]
    3818:	92800063 	mov	x3, #0xfffffffffffffffc    	// #-4
    381c:	927d7000 	and	x0, x0, #0xfffffff8
    3820:	927d7021 	and	x1, x1, #0xfffffff8
    3824:	cb000063 	sub	x3, x3, x0
    3828:	8b0100e1 	add	x1, x7, x1
    382c:	b86368e0 	ldr	w0, [x7, x3]
    3830:	b85fc021 	ldur	w1, [x1, #-4]
    3834:	121d7002 	and	w2, w0, #0xfffffff8
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3838:	121f0000 	and	w0, w0, #0x2
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    383c:	121d7021 	and	w1, w1, #0xfffffff8
    3840:	0b020021 	add	w1, w1, w2
        PUT(HDRP(PREV_BLKP(ptr)), PACK(size, 0));
    3844:	0b040022 	add	w2, w1, w4
    3848:	2a020000 	orr	w0, w0, w2
    384c:	b82368e0 	str	w0, [x7, x3]
        size += GET_SIZE(HDRP(PREV_BLKP(ptr))) + GET_SIZE(HDRP(NEXT_BLKP(ptr)));
    3850:	8b2140a1 	add	x1, x5, w1, uxtw
        PUT(FTRP(NEXT_BLKP(ptr)), PACK(size, 0));
    3854:	b85fc0e0 	ldur	w0, [x7, #-4]
    3858:	927d7000 	and	x0, x0, #0xfffffff8
    385c:	8b0000e4 	add	x4, x7, x0
    3860:	d1002003 	sub	x3, x0, #0x8
    3864:	b85fc080 	ldur	w0, [x4, #-4]
    3868:	927d7000 	and	x0, x0, #0xfffffff8
    386c:	8b030000 	add	x0, x0, x3
    3870:	b86068e4 	ldr	w4, [x7, x0]
    3874:	121f0084 	and	w4, w4, #0x2
    3878:	17ffffb3 	b	3744 <coalesce+0xc4>
    387c:	d503201f 	nop

0000000000003880 <mem_sbrk>:
{
    3880:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3884:	910003fd 	mov	x29, sp
    3888:	a90153f3 	stp	x19, x20, [sp, #16]
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    388c:	d0000053 	adrp	x19, d000 <__global_locale+0x20>
    3890:	91280273 	add	x19, x19, #0xa00
{
    3894:	aa0003f4 	mov	x20, x0
    uintptr_t userland_heap_size = userland_heap_top - userland_heap_base;
    3898:	a94a0660 	ldp	x0, x1, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    389c:	f9405a62 	ldr	x2, [x19, #176]
    38a0:	8b020021 	add	x1, x1, x2
    38a4:	cb010003 	sub	x3, x0, x1
    38a8:	eb03029f 	cmp	x20, x3
    38ac:	540001a9 	b.ls	38e0 <mem_sbrk+0x60>  // b.plast
    uintptr_t size_needed = size - (userland_heap_size - requested_heap_size);
    38b0:	cb000282 	sub	x2, x20, x0
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    38b4:	52800003 	mov	w3, #0x0                   	// #0
    38b8:	0b020022 	add	w2, w1, w2
    38bc:	d2800001 	mov	x1, #0x0                   	// #0
    38c0:	97fffed4 	bl	3410 <mmap>
    38c4:	93407c00 	sxtw	x0, w0
    if (userland_heap_size - requested_heap_size >= size) {
    38c8:	a94a8a61 	ldp	x1, x2, [x19, #168]
    userland_heap_top = mmap(userland_heap_top, (uintptr_t)NULL, size_needed, false);
    38cc:	f9005260 	str	x0, [x19, #160]
    if (userland_heap_size - requested_heap_size >= size) {
    38d0:	8b020021 	add	x1, x1, x2
    38d4:	cb010003 	sub	x3, x0, x1
    38d8:	eb14007f 	cmp	x3, x20
    38dc:	54fffea3 	b.cc	38b0 <mem_sbrk+0x30>  // b.lo, b.ul, b.last
        requested_heap_size += size;
    38e0:	8b020294 	add	x20, x20, x2
}
    38e4:	aa0103e0 	mov	x0, x1
        requested_heap_size += size;
    38e8:	f9005a74 	str	x20, [x19, #176]
}
    38ec:	a94153f3 	ldp	x19, x20, [sp, #16]
    38f0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    38f4:	d65f03c0 	ret
    38f8:	d503201f 	nop
    38fc:	d503201f 	nop

0000000000003900 <mm_init>:
    return ptr;
}

static bool malloc_inited = false;
int mm_init(void)
{
    3900:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3904:	910003fd 	mov	x29, sp
    3908:	f9000bf3 	str	x19, [sp, #16]
    // init heap
    userland_heap_base = task_heap_base();
    390c:	d0000053 	adrp	x19, d000 <__global_locale+0x20>
    3910:	91280273 	add	x19, x19, #0xa00
    3914:	97fffe9f 	bl	3390 <task_heap_base>
    3918:	aa1303e1 	mov	x1, x19
    391c:	91028262 	add	x2, x19, #0xa0
    3920:	93407c00 	sxtw	x0, w0
    3924:	a90a0260 	stp	x0, x0, [x19, #160]
    userland_heap_top = userland_heap_base;
    requested_heap_size = 0;
    3928:	f9005a7f 	str	xzr, [x19, #176]

    int list;
    char* heap_start; // Pointer to beginning of heap

    // Initialize segregated free lists
    for (list = 0; list < LISTLIMIT; list++) {
    392c:	d503201f 	nop
        segregated_free_lists[list] = NULL;
    3930:	f800843f 	str	xzr, [x1], #8
    for (list = 0; list < LISTLIMIT; list++) {
    3934:	eb02003f 	cmp	x1, x2
    3938:	54ffffc1 	b.ne	3930 <mm_init+0x30>  // b.any
    }

    // Allocate memory for the initial empty heap
    if ((long)(heap_start = mem_sbrk(4 * WSIZE)) == -1)
    393c:	d2800200 	mov	x0, #0x10                  	// #16
    3940:	97ffffd0 	bl	3880 <mem_sbrk>
    3944:	aa0003e1 	mov	x1, x0
    3948:	b100041f 	cmn	x0, #0x1
    394c:	54000300 	b.eq	39ac <mm_init+0xac>  // b.none
        return -1;

    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    PUT_NOTAG(heap_start + (1 * WSIZE), PACK(DSIZE, 1)); /* Prologue header */
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    3950:	d2800122 	mov	x2, #0x9                   	// #9
    PUT_NOTAG(heap_start, 0); /* Alignment padding */
    3954:	d2c00120 	mov	x0, #0x900000000           	// #38654705664
    PUT_NOTAG(heap_start + (2 * WSIZE), PACK(DSIZE, 1)); /* Prologue footer */
    3958:	f2c00022 	movk	x2, #0x1, lsl #32
    395c:	a9000820 	stp	x0, x2, [x1]
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    3960:	d2800800 	mov	x0, #0x40                  	// #64
    3964:	97ffffc7 	bl	3880 <mem_sbrk>
    3968:	b100041f 	cmn	x0, #0x1
    396c:	54000200 	b.eq	39ac <mm_init+0xac>  // b.none
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3970:	d2800803 	mov	x3, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3974:	52800804 	mov	w4, #0x40                  	// #64
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3978:	f2c00023 	movk	x3, #0x1, lsl #32
    insert_node(ptr, asize);
    397c:	d2800801 	mov	x1, #0x40                  	// #64
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3980:	b81fc004 	stur	w4, [x0, #-4]
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3984:	f9001c03 	str	x3, [x0, #56]
    insert_node(ptr, asize);
    3988:	97fffeee 	bl	3540 <insert_node>
    return coalesce(ptr);
    398c:	97ffff3d 	bl	3680 <coalesce>
    PUT_NOTAG(heap_start + (3 * WSIZE), PACK(0, 1)); /* Epilogue header */

    if (extend_heap(INITCHUNKSIZE) == NULL)
    3990:	b40000e0 	cbz	x0, 39ac <mm_init+0xac>
        return -1;

    malloc_inited = true;
    3994:	52800021 	mov	w1, #0x1                   	// #1
    return 0;
    3998:	52800000 	mov	w0, #0x0                   	// #0
    malloc_inited = true;
    399c:	3902e261 	strb	w1, [x19, #184]
}
    39a0:	f9400bf3 	ldr	x19, [sp, #16]
    39a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    39a8:	d65f03c0 	ret
        return -1;
    39ac:	12800000 	mov	w0, #0xffffffff            	// #-1
}
    39b0:	f9400bf3 	ldr	x19, [sp, #16]
    39b4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    39b8:	d65f03c0 	ret
    39bc:	d503201f 	nop

00000000000039c0 <malloc>:

void* malloc(size_t size)
{
    39c0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    39c4:	910003fd 	mov	x29, sp
    39c8:	a90153f3 	stp	x19, x20, [sp, #16]
    while (!malloc_inited) {
    39cc:	d0000054 	adrp	x20, d000 <__global_locale+0x20>
    39d0:	91280294 	add	x20, x20, #0xa00
{
    39d4:	aa0003f3 	mov	x19, x0
    while (!malloc_inited) {
    39d8:	3942e280 	ldrb	w0, [x20, #184]
    39dc:	35000080 	cbnz	w0, 39ec <malloc+0x2c>
        mm_init();
    39e0:	97ffffc8 	bl	3900 <mm_init>
    while (!malloc_inited) {
    39e4:	3942e281 	ldrb	w1, [x20, #184]
    39e8:	34ffffc1 	cbz	w1, 39e0 <malloc+0x20>
    size_t asize; /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    void* ptr = NULL; /* Pointer */

    // Ignore size 0 cases
    if (size == 0)
    39ec:	b4000e73 	cbz	x19, 3bb8 <malloc+0x1f8>

    // Align block size
    if (size <= DSIZE) {
        asize = 2 * DSIZE;
    } else {
        asize = ALIGN(size + DSIZE);
    39f0:	91003e60 	add	x0, x19, #0xf
    39f4:	f100227f 	cmp	x19, #0x8
    39f8:	927df013 	and	x19, x0, #0xfffffffffffffff8
    39fc:	d2800200 	mov	x0, #0x10                  	// #16
    3a00:	9a808273 	csel	x19, x19, x0, hi  // hi = pmore
        asize = 2 * DSIZE;
    3a04:	d2800002 	mov	x2, #0x0                   	// #0
    3a08:	aa1303e3 	mov	x3, x19
    3a0c:	14000005 	b	3a20 <malloc+0x60>
    }

    int list = 0;
    size_t searchsize = asize;
    // Search for free block in segregated list
    while (list < LISTLIMIT) {
    3a10:	91000442 	add	x2, x2, #0x1
            }
            if (ptr != NULL)
                break;
        }

        searchsize >>= 1;
    3a14:	d341fc63 	lsr	x3, x3, #1
    while (list < LISTLIMIT) {
    3a18:	f100505f 	cmp	x2, #0x14
    3a1c:	54000720 	b.eq	3b00 <malloc+0x140>  // b.none
        if ((list == LISTLIMIT - 1) || ((searchsize <= 1) && (segregated_free_lists[list] != NULL))) {
    3a20:	f1004c5f 	cmp	x2, #0x13
    3a24:	540006a0 	b.eq	3af8 <malloc+0x138>  // b.none
    3a28:	f100047f 	cmp	x3, #0x1
    3a2c:	54ffff28 	b.hi	3a10 <malloc+0x50>  // b.pmore
    3a30:	f8627a87 	ldr	x7, [x20, x2, lsl #3]
    3a34:	b4fffee7 	cbz	x7, 3a10 <malloc+0x50>
    3a38:	14000003 	b	3a44 <malloc+0x84>
                ptr = PRED(ptr);
    3a3c:	f94000e7 	ldr	x7, [x7]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    3a40:	b4fffe87 	cbz	x7, 3a10 <malloc+0x50>
    3a44:	b85fc0e0 	ldur	w0, [x7, #-4]
    3a48:	927d7001 	and	x1, x0, #0xfffffff8
    3a4c:	121d7005 	and	w5, w0, #0xfffffff8
    3a50:	eb13003f 	cmp	x1, x19
    3a54:	54ffff43 	b.cc	3a3c <malloc+0x7c>  // b.lo, b.ul, b.last
    3a58:	370fff20 	tbnz	w0, #1, 3a3c <malloc+0x7c>
    size_t remainder = ptr_size - asize;
    3a5c:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    3a60:	aa0703e0 	mov	x0, x7
    3a64:	97fffee3 	bl	35f0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3a68:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    3a6c:	f100409f 	cmp	x4, #0x10
    3a70:	54000849 	b.ls	3b78 <malloc+0x1b8>  // b.plast
    else if (asize >= 100) {
    3a74:	f1018e7f 	cmp	x19, #0x63
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3a78:	121f0000 	and	w0, w0, #0x2
    else if (asize >= 100) {
    3a7c:	54000a88 	b.hi	3bcc <malloc+0x20c>  // b.pmore
        PUT(HDRP(ptr), PACK(asize, 1));
    3a80:	2a130000 	orr	w0, w0, w19
        insert_node(NEXT_BLKP(ptr), remainder);
    3a84:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(asize, 1));
    3a88:	927d7002 	and	x2, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(asize, 1));
    3a8c:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(asize, 1));
    3a90:	d1002042 	sub	x2, x2, #0x8
        PUT(HDRP(ptr), PACK(asize, 1));
    3a94:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(asize, 1));
    3a98:	b86268e0 	ldr	w0, [x7, x2]
    3a9c:	121f0000 	and	w0, w0, #0x2
    3aa0:	2a130000 	orr	w0, w0, w19
    3aa4:	32000000 	orr	w0, w0, #0x1
    3aa8:	b82268e0 	str	w0, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    3aac:	b85fc0e0 	ldur	w0, [x7, #-4]
    3ab0:	927d7000 	and	x0, x0, #0xfffffff8
    3ab4:	8b0000e0 	add	x0, x7, x0
    3ab8:	b81fc004 	stur	w4, [x0, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(remainder, 0));
    3abc:	b85fc0e0 	ldur	w0, [x7, #-4]
    3ac0:	927d7000 	and	x0, x0, #0xfffffff8
    3ac4:	8b0000e0 	add	x0, x7, x0
    3ac8:	b85fc002 	ldur	w2, [x0, #-4]
    3acc:	927d7042 	and	x2, x2, #0xfffffff8
    3ad0:	8b020000 	add	x0, x0, x2
    3ad4:	b81f8004 	stur	w4, [x0, #-8]
        insert_node(NEXT_BLKP(ptr), remainder);
    3ad8:	b85fc0e0 	ldur	w0, [x7, #-4]
    3adc:	927d7000 	and	x0, x0, #0xfffffff8
    3ae0:	8b0000e0 	add	x0, x7, x0
    3ae4:	97fffe97 	bl	3540 <insert_node>
    // Place and divide block
    ptr = place(ptr, asize);

    // Return pointer to newly allocated block
    return ptr;
}
    3ae8:	aa0703e0 	mov	x0, x7
    3aec:	a94153f3 	ldp	x19, x20, [sp, #16]
    3af0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3af4:	d65f03c0 	ret
            ptr = segregated_free_lists[list];
    3af8:	f9404e87 	ldr	x7, [x20, #152]
            while ((ptr != NULL) && ((asize > GET_SIZE(HDRP(ptr))) || (GET_TAG(HDRP(ptr))))) {
    3afc:	b5fffa47 	cbnz	x7, 3a44 <malloc+0x84>
        extendsize = MAX(asize, CHUNKSIZE);
    3b00:	f140067f 	cmp	x19, #0x1, lsl #12
    3b04:	d2820000 	mov	x0, #0x1000                	// #4096
    3b08:	9a802260 	csel	x0, x19, x0, cs  // cs = hs, nlast
    3b0c:	f90013f5 	str	x21, [sp, #32]
    asize = ALIGN(size);
    3b10:	91001c14 	add	x20, x0, #0x7
    3b14:	aa0003f5 	mov	x21, x0
    if ((ptr = mem_sbrk(asize)) == (void*)-1)
    3b18:	97ffff5a 	bl	3880 <mem_sbrk>
    3b1c:	aa0003e3 	mov	x3, x0
    3b20:	b100041f 	cmn	x0, #0x1
    3b24:	54000480 	b.eq	3bb4 <malloc+0x1f4>  // b.none
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3b28:	927d7282 	and	x2, x20, #0xfffffff8
    insert_node(ptr, asize);
    3b2c:	aa1503e1 	mov	x1, x21
    PUT_NOTAG(FTRP(ptr), PACK(asize, 0));
    3b30:	8b020062 	add	x2, x3, x2
    PUT_NOTAG(HDRP(ptr), PACK(asize, 0));
    3b34:	b81fc075 	stur	w21, [x3, #-4]
    PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));
    3b38:	52800023 	mov	w3, #0x1                   	// #1
    3b3c:	293f0c55 	stp	w21, w3, [x2, #-8]
    insert_node(ptr, asize);
    3b40:	97fffe80 	bl	3540 <insert_node>
    return coalesce(ptr);
    3b44:	97fffecf 	bl	3680 <coalesce>
    3b48:	aa0003e7 	mov	x7, x0
        if ((ptr = extend_heap(extendsize)) == NULL)
    3b4c:	b4000340 	cbz	x0, 3bb4 <malloc+0x1f4>
    3b50:	b85fc001 	ldur	w1, [x0, #-4]
    delete_node(ptr);
    3b54:	aa0703e0 	mov	x0, x7
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    3b58:	f94013f5 	ldr	x21, [sp, #32]
    size_t remainder = ptr_size - asize;
    3b5c:	121d7025 	and	w5, w1, #0xfffffff8
    size_t ptr_size = GET_SIZE(HDRP(ptr));
    3b60:	927d7021 	and	x1, x1, #0xfffffff8
    size_t remainder = ptr_size - asize;
    3b64:	cb130024 	sub	x4, x1, x19
    delete_node(ptr);
    3b68:	97fffea2 	bl	35f0 <delete_node>
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3b6c:	b85fc0e0 	ldur	w0, [x7, #-4]
    if (remainder <= DSIZE * 2) {
    3b70:	f100409f 	cmp	x4, #0x10
    3b74:	54fff808 	b.hi	3a74 <malloc+0xb4>  // b.pmore
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3b78:	121f0000 	and	w0, w0, #0x2
    3b7c:	2a050000 	orr	w0, w0, w5
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    3b80:	927d7001 	and	x1, x0, #0xfffffff8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3b84:	32000000 	orr	w0, w0, #0x1
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    3b88:	d1002021 	sub	x1, x1, #0x8
        PUT(HDRP(ptr), PACK(ptr_size, 1));
    3b8c:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(ptr_size, 1));
    3b90:	b86168e0 	ldr	w0, [x7, x1]
    3b94:	121f0000 	and	w0, w0, #0x2
    3b98:	2a050000 	orr	w0, w0, w5
    3b9c:	32000000 	orr	w0, w0, #0x1
    3ba0:	b82168e0 	str	w0, [x7, x1]
}
    3ba4:	aa0703e0 	mov	x0, x7
    3ba8:	a94153f3 	ldp	x19, x20, [sp, #16]
    3bac:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3bb0:	d65f03c0 	ret
    3bb4:	f94013f5 	ldr	x21, [sp, #32]
        return NULL;
    3bb8:	d2800007 	mov	x7, #0x0                   	// #0
}
    3bbc:	aa0703e0 	mov	x0, x7
    3bc0:	a94153f3 	ldp	x19, x20, [sp, #16]
    3bc4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3bc8:	d65f03c0 	ret
        PUT(HDRP(ptr), PACK(remainder, 0));
    3bcc:	2a040000 	orr	w0, w0, w4
    3bd0:	b81fc0e0 	stur	w0, [x7, #-4]
        PUT(FTRP(ptr), PACK(remainder, 0));
    3bd4:	927d7000 	and	x0, x0, #0xfffffff8
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3bd8:	32000273 	orr	w19, w19, #0x1
        PUT(FTRP(ptr), PACK(remainder, 0));
    3bdc:	d1002002 	sub	x2, x0, #0x8
        insert_node(ptr, remainder);
    3be0:	aa0703e0 	mov	x0, x7
    3be4:	aa0403e1 	mov	x1, x4
        PUT(FTRP(ptr), PACK(remainder, 0));
    3be8:	b86268e3 	ldr	w3, [x7, x2]
    3bec:	121f0063 	and	w3, w3, #0x2
    3bf0:	2a040063 	orr	w3, w3, w4
    3bf4:	b82268e3 	str	w3, [x7, x2]
        PUT_NOTAG(HDRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3bf8:	b85fc0e2 	ldur	w2, [x7, #-4]
    3bfc:	927d7042 	and	x2, x2, #0xfffffff8
    3c00:	8b0200e2 	add	x2, x7, x2
    3c04:	b81fc053 	stur	w19, [x2, #-4]
        PUT_NOTAG(FTRP(NEXT_BLKP(ptr)), PACK(asize, 1));
    3c08:	b85fc0e2 	ldur	w2, [x7, #-4]
    3c0c:	927d7042 	and	x2, x2, #0xfffffff8
    3c10:	8b0200e2 	add	x2, x7, x2
    3c14:	b85fc043 	ldur	w3, [x2, #-4]
    3c18:	927d7063 	and	x3, x3, #0xfffffff8
    3c1c:	8b030042 	add	x2, x2, x3
    3c20:	b81f8053 	stur	w19, [x2, #-8]
        insert_node(ptr, remainder);
    3c24:	97fffe47 	bl	3540 <insert_node>
        return NEXT_BLKP(ptr);
    3c28:	b85fc0e0 	ldur	w0, [x7, #-4]
}
    3c2c:	a94153f3 	ldp	x19, x20, [sp, #16]
        return NEXT_BLKP(ptr);
    3c30:	927d7000 	and	x0, x0, #0xfffffff8
    3c34:	8b0000e7 	add	x7, x7, x0
}
    3c38:	aa0703e0 	mov	x0, x7
    3c3c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3c40:	d65f03c0 	ret
    3c44:	d503201f 	nop
    3c48:	d503201f 	nop
    3c4c:	d503201f 	nop

0000000000003c50 <free>:

void free(void* ptr)
{
    3c50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3c54:	910003fd 	mov	x29, sp
    3c58:	b85fc004 	ldur	w4, [x0, #-4]
    size_t size = GET_SIZE(HDRP(ptr));
    3c5c:	927d7081 	and	x1, x4, #0xfffffff8

    REMOVE_RATAG(HDRP(NEXT_BLKP(ptr)));
    3c60:	121d7085 	and	w5, w4, #0xfffffff8
    3c64:	d1001024 	sub	x4, x1, #0x4
    3c68:	b8646802 	ldr	w2, [x0, x4]
    3c6c:	121e7842 	and	w2, w2, #0xfffffffd
    3c70:	b8246802 	str	w2, [x0, x4]
    PUT(HDRP(ptr), PACK(size, 0));
    3c74:	b85fc002 	ldur	w2, [x0, #-4]
    3c78:	121f0042 	and	w2, w2, #0x2
    3c7c:	2a050042 	orr	w2, w2, w5
    3c80:	b81fc002 	stur	w2, [x0, #-4]
    PUT(FTRP(ptr), PACK(size, 0));
    3c84:	927d7042 	and	x2, x2, #0xfffffff8
    3c88:	d1002042 	sub	x2, x2, #0x8
    3c8c:	b8626804 	ldr	w4, [x0, x2]
    3c90:	121f0084 	and	w4, w4, #0x2
    3c94:	2a050084 	orr	w4, w4, w5
    3c98:	b8226804 	str	w4, [x0, x2]

    insert_node(ptr, size);
    3c9c:	97fffe29 	bl	3540 <insert_node>
    coalesce(ptr);

    return;
}
    3ca0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    coalesce(ptr);
    3ca4:	17fffe77 	b	3680 <coalesce>
    3ca8:	d503201f 	nop
    3cac:	d503201f 	nop

0000000000003cb0 <_exit>:
#include <sys/types.h>

// _exit: 用于退出程序
void _exit(int status)
{
    while (1) { }
    3cb0:	14000000 	b	3cb0 <_exit>
    3cb4:	d503201f 	nop
    3cb8:	d503201f 	nop
    3cbc:	d503201f 	nop

0000000000003cc0 <_sbrk>:
{
    extern char end; /* Defined by the linker */
    static char* heap_end;
    char* prev_heap_end;

    if (heap_end == 0) {
    3cc0:	d0000043 	adrp	x3, d000 <__global_locale+0x20>
    3cc4:	f9456061 	ldr	x1, [x3, #2752]
    3cc8:	d0000042 	adrp	x2, d000 <__global_locale+0x20>
    3ccc:	91372042 	add	x2, x2, #0xdc8
    3cd0:	f100003f 	cmp	x1, #0x0
    3cd4:	9a810041 	csel	x1, x2, x1, eq  // eq = none
    prev_heap_end = heap_end;

    // 在这里，你应该添加一些检查来确保堆不会与栈或其他内存区域冲突
    // 例如，检查 incr 是否会导致堆超出预定的内存区域

    heap_end += incr;
    3cd8:	8b000022 	add	x2, x1, x0
    return (void*)prev_heap_end;
}
    3cdc:	aa0103e0 	mov	x0, x1
    heap_end += incr;
    3ce0:	f9056062 	str	x2, [x3, #2752]
}
    3ce4:	d65f03c0 	ret
    3ce8:	d503201f 	nop
    3cec:	d503201f 	nop

0000000000003cf0 <_write>:

// _write: 用于将数据写入文件描述符
ssize_t _write(int file, const void* ptr, size_t len)
{
    3cf0:	aa0203e0 	mov	x0, x2
    // 在这里，你需要实现将数据写入文件描述符的逻辑
    // 如果你的系统不支持文件系统，你可以将数据发送到串口或其他输出

    return len; // 假设所有数据都被写入
}
    3cf4:	d65f03c0 	ret
    3cf8:	d503201f 	nop
    3cfc:	d503201f 	nop

0000000000003d00 <_close>:

// _close: 用于关闭文件描述符
int _close(int file)
{
    return -1; // 表示失败，因为没有实际关闭文件的功能
}
    3d00:	12800000 	mov	w0, #0xffffffff            	// #-1
    3d04:	d65f03c0 	ret
    3d08:	d503201f 	nop
    3d0c:	d503201f 	nop

0000000000003d10 <_fstat>:

// _fstat: 用于获取文件状态
int _fstat(int file, struct stat* st)
{
    return 0; // 表示成功
}
    3d10:	52800000 	mov	w0, #0x0                   	// #0
    3d14:	d65f03c0 	ret
    3d18:	d503201f 	nop
    3d1c:	d503201f 	nop

0000000000003d20 <_isatty>:

// _isatty: 检查文件描述符是否指向TTY设备
int _isatty(int file)
{
    return 1; // 表示是TTY设备
}
    3d20:	52800020 	mov	w0, #0x1                   	// #1
    3d24:	d65f03c0 	ret
    3d28:	d503201f 	nop
    3d2c:	d503201f 	nop

0000000000003d30 <_lseek>:

// _lseek: 用于重新定位文件读/写的位置
off_t _lseek(int file, off_t offset, int whence)
{
    return -1; // 表示失败，因为不支持文件定位
}
    3d30:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    3d34:	d65f03c0 	ret
    3d38:	d503201f 	nop
    3d3c:	d503201f 	nop

0000000000003d40 <_read>:

// _read: 用于从文件描述符读取数据
ssize_t _read(int file, void* ptr, size_t len)
{
    return 0; // 表示没有数据被读取
}
    3d40:	d2800000 	mov	x0, #0x0                   	// #0
    3d44:	d65f03c0 	ret
    3d48:	d503201f 	nop
    3d4c:	d503201f 	nop

0000000000003d50 <_kill>:

// _kill: 发送信号给进程
int _kill(int pid, int sig)
{
    return -1; // 表示失败，因为不支持信号
}
    3d50:	12800000 	mov	w0, #0xffffffff            	// #-1
    3d54:	d65f03c0 	ret
    3d58:	d503201f 	nop
    3d5c:	d503201f 	nop

0000000000003d60 <_getpid>:

// _getpid: 获取进程ID
int _getpid()
{
    return 1; // 返回假设的进程ID
}
    3d60:	52800020 	mov	w0, #0x1                   	// #1
    3d64:	d65f03c0 	ret
    3d68:	d503201f 	nop
    3d6c:	d503201f 	nop

0000000000003d70 <__assert_func>:
    3d70:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3d74:	b0000044 	adrp	x4, c000 <__func__.0+0x28>
    3d78:	aa0003e7 	mov	x7, x0
    3d7c:	910003fd 	mov	x29, sp
    3d80:	f9443885 	ldr	x5, [x4, #2160]
    3d84:	aa0203e6 	mov	x6, x2
    3d88:	2a0103e4 	mov	w4, w1
    3d8c:	aa0303e2 	mov	x2, x3
    3d90:	f9400ca0 	ldr	x0, [x5, #24]
    3d94:	b4000106 	cbz	x6, 3db4 <__assert_func+0x44>
    3d98:	b0000045 	adrp	x5, c000 <__func__.0+0x28>
    3d9c:	910560a5 	add	x5, x5, #0x158
    3da0:	aa0703e3 	mov	x3, x7
    3da4:	b0000041 	adrp	x1, c000 <__func__.0+0x28>
    3da8:	9105a021 	add	x1, x1, #0x168
    3dac:	94000049 	bl	3ed0 <fiprintf>
    3db0:	94000a00 	bl	65b0 <abort>
    3db4:	90000045 	adrp	x5, b000 <_wcsnrtombs_l+0x130>
    3db8:	913c00a5 	add	x5, x5, #0xf00
    3dbc:	aa0503e6 	mov	x6, x5
    3dc0:	17fffff8 	b	3da0 <__assert_func+0x30>
    3dc4:	d503201f 	nop
    3dc8:	d503201f 	nop
    3dcc:	d503201f 	nop

0000000000003dd0 <__assert>:
    3dd0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    3dd4:	aa0203e3 	mov	x3, x2
    3dd8:	d2800002 	mov	x2, #0x0                   	// #0
    3ddc:	910003fd 	mov	x29, sp
    3de0:	97ffffe4 	bl	3d70 <__assert_func>
    3de4:	d503201f 	nop
    3de8:	d503201f 	nop
    3dec:	d503201f 	nop

0000000000003df0 <atexit>:
    3df0:	aa0003e1 	mov	x1, x0
    3df4:	d2800003 	mov	x3, #0x0                   	// #0
    3df8:	d2800002 	mov	x2, #0x0                   	// #0
    3dfc:	52800000 	mov	w0, #0x0                   	// #0
    3e00:	140009f4 	b	65d0 <__register_exitproc>
    3e04:	d503201f 	nop
    3e08:	d503201f 	nop
    3e0c:	d503201f 	nop

0000000000003e10 <__libc_fini_array>:
    3e10:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    3e14:	b0000041 	adrp	x1, c000 <__func__.0+0x28>
    3e18:	b0000040 	adrp	x0, c000 <__func__.0+0x28>
    3e1c:	910003fd 	mov	x29, sp
    3e20:	a90153f3 	stp	x19, x20, [sp, #16]
    3e24:	f940cc33 	ldr	x19, [x1, #408]
    3e28:	f940d014 	ldr	x20, [x0, #416]
    3e2c:	cb140273 	sub	x19, x19, x20
    3e30:	9343fe73 	asr	x19, x19, #3
    3e34:	b40000b3 	cbz	x19, 3e48 <__libc_fini_array+0x38>
    3e38:	d1000673 	sub	x19, x19, #0x1
    3e3c:	f8737a80 	ldr	x0, [x20, x19, lsl #3]
    3e40:	d63f0000 	blr	x0
    3e44:	b5ffffb3 	cbnz	x19, 3e38 <__libc_fini_array+0x28>
    3e48:	a94153f3 	ldp	x19, x20, [sp, #16]
    3e4c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    3e50:	14001f99 	b	bcb4 <_fini>
    3e54:	d503201f 	nop
    3e58:	d503201f 	nop
    3e5c:	d503201f 	nop

0000000000003e60 <_fiprintf_r>:
    3e60:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    3e64:	128004e9 	mov	w9, #0xffffffd8            	// #-40
    3e68:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    3e6c:	910003fd 	mov	x29, sp
    3e70:	910343ea 	add	x10, sp, #0xd0
    3e74:	910403eb 	add	x11, sp, #0x100
    3e78:	a9032feb 	stp	x11, x11, [sp, #48]
    3e7c:	f90023ea 	str	x10, [sp, #64]
    3e80:	290923e9 	stp	w9, w8, [sp, #72]
    3e84:	a9432fea 	ldp	x10, x11, [sp, #48]
    3e88:	a9012fea 	stp	x10, x11, [sp, #16]
    3e8c:	a94427e8 	ldp	x8, x9, [sp, #64]
    3e90:	a90227e8 	stp	x8, x9, [sp, #32]
    3e94:	3d8017e0 	str	q0, [sp, #80]
    3e98:	3d801be1 	str	q1, [sp, #96]
    3e9c:	3d801fe2 	str	q2, [sp, #112]
    3ea0:	3d8023e3 	str	q3, [sp, #128]
    3ea4:	3d8027e4 	str	q4, [sp, #144]
    3ea8:	3d802be5 	str	q5, [sp, #160]
    3eac:	3d802fe6 	str	q6, [sp, #176]
    3eb0:	3d8033e7 	str	q7, [sp, #192]
    3eb4:	a90d93e3 	stp	x3, x4, [sp, #216]
    3eb8:	910043e3 	add	x3, sp, #0x10
    3ebc:	a90e9be5 	stp	x5, x6, [sp, #232]
    3ec0:	f9007fe7 	str	x7, [sp, #248]
    3ec4:	940001ef 	bl	4680 <_vfiprintf_r>
    3ec8:	a8d07bfd 	ldp	x29, x30, [sp], #256
    3ecc:	d65f03c0 	ret

0000000000003ed0 <fiprintf>:
    3ed0:	a9b07bfd 	stp	x29, x30, [sp, #-256]!
    3ed4:	b0000048 	adrp	x8, c000 <__func__.0+0x28>
    3ed8:	aa0003eb 	mov	x11, x0
    3edc:	910003fd 	mov	x29, sp
    3ee0:	910343ec 	add	x12, sp, #0xd0
    3ee4:	910403ea 	add	x10, sp, #0x100
    3ee8:	f9443900 	ldr	x0, [x8, #2160]
    3eec:	128005e9 	mov	w9, #0xffffffd0            	// #-48
    3ef0:	12800fe8 	mov	w8, #0xffffff80            	// #-128
    3ef4:	a9032bea 	stp	x10, x10, [sp, #48]
    3ef8:	aa0103ea 	mov	x10, x1
    3efc:	f90023ec 	str	x12, [sp, #64]
    3f00:	aa0b03e1 	mov	x1, x11
    3f04:	290923e9 	stp	w9, w8, [sp, #72]
    3f08:	a94337ec 	ldp	x12, x13, [sp, #48]
    3f0c:	a90137ec 	stp	x12, x13, [sp, #16]
    3f10:	a94427e8 	ldp	x8, x9, [sp, #64]
    3f14:	a90227e8 	stp	x8, x9, [sp, #32]
    3f18:	3d8017e0 	str	q0, [sp, #80]
    3f1c:	3d801be1 	str	q1, [sp, #96]
    3f20:	3d801fe2 	str	q2, [sp, #112]
    3f24:	3d8023e3 	str	q3, [sp, #128]
    3f28:	3d8027e4 	str	q4, [sp, #144]
    3f2c:	3d802be5 	str	q5, [sp, #160]
    3f30:	3d802fe6 	str	q6, [sp, #176]
    3f34:	3d8033e7 	str	q7, [sp, #192]
    3f38:	a90d0fe2 	stp	x2, x3, [sp, #208]
    3f3c:	910043e3 	add	x3, sp, #0x10
    3f40:	aa0a03e2 	mov	x2, x10
    3f44:	a90e17e4 	stp	x4, x5, [sp, #224]
    3f48:	a90f1fe6 	stp	x6, x7, [sp, #240]
    3f4c:	940001cd 	bl	4680 <_vfiprintf_r>
    3f50:	a8d07bfd 	ldp	x29, x30, [sp], #256
    3f54:	d65f03c0 	ret
    3f58:	d503201f 	nop
    3f5c:	d503201f 	nop

0000000000003f60 <__libc_init_array>:
    3f60:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    3f64:	b0000041 	adrp	x1, c000 <__func__.0+0x28>
    3f68:	b0000040 	adrp	x0, c000 <__func__.0+0x28>
    3f6c:	910003fd 	mov	x29, sp
    3f70:	a90153f3 	stp	x19, x20, [sp, #16]
    3f74:	f940d834 	ldr	x20, [x1, #432]
    3f78:	f90013f5 	str	x21, [sp, #32]
    3f7c:	f940dc15 	ldr	x21, [x0, #440]
    3f80:	cb150294 	sub	x20, x20, x21
    3f84:	9343fe94 	asr	x20, x20, #3
    3f88:	b40000f4 	cbz	x20, 3fa4 <__libc_init_array+0x44>
    3f8c:	d2800013 	mov	x19, #0x0                   	// #0
    3f90:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    3f94:	91000673 	add	x19, x19, #0x1
    3f98:	d63f0000 	blr	x0
    3f9c:	eb13029f 	cmp	x20, x19
    3fa0:	54ffff81 	b.ne	3f90 <__libc_init_array+0x30>  // b.any
    3fa4:	940ff017 	bl	400000 <_init>
    3fa8:	b0000041 	adrp	x1, c000 <__func__.0+0x28>
    3fac:	b0000040 	adrp	x0, c000 <__func__.0+0x28>
    3fb0:	f940e034 	ldr	x20, [x1, #448]
    3fb4:	f940e415 	ldr	x21, [x0, #456]
    3fb8:	cb150294 	sub	x20, x20, x21
    3fbc:	9343fe94 	asr	x20, x20, #3
    3fc0:	b40000f4 	cbz	x20, 3fdc <__libc_init_array+0x7c>
    3fc4:	d2800013 	mov	x19, #0x0                   	// #0
    3fc8:	f8737aa0 	ldr	x0, [x21, x19, lsl #3]
    3fcc:	91000673 	add	x19, x19, #0x1
    3fd0:	d63f0000 	blr	x0
    3fd4:	eb13029f 	cmp	x20, x19
    3fd8:	54ffff81 	b.ne	3fc8 <__libc_init_array+0x68>  // b.any
    3fdc:	a94153f3 	ldp	x19, x20, [sp, #16]
    3fe0:	f94013f5 	ldr	x21, [sp, #32]
    3fe4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    3fe8:	d65f03c0 	ret
    3fec:	d503201f 	nop
    3ff0:	d503201f 	nop
    3ff4:	d503201f 	nop
    3ff8:	d503201f 	nop
    3ffc:	d503201f 	nop

0000000000004000 <memcpy>:
    4000:	f9800020 	prfm	pldl1keep, [x1]
    4004:	8b020024 	add	x4, x1, x2
    4008:	8b020005 	add	x5, x0, x2
    400c:	f100405f 	cmp	x2, #0x10
    4010:	54000209 	b.ls	4050 <memcpy+0x50>  // b.plast
    4014:	f101805f 	cmp	x2, #0x60
    4018:	54000648 	b.hi	40e0 <memcpy+0xe0>  // b.pmore
    401c:	d1000449 	sub	x9, x2, #0x1
    4020:	a9401c26 	ldp	x6, x7, [x1]
    4024:	37300469 	tbnz	w9, #6, 40b0 <memcpy+0xb0>
    4028:	a97f348c 	ldp	x12, x13, [x4, #-16]
    402c:	362800a9 	tbz	w9, #5, 4040 <memcpy+0x40>
    4030:	a9412428 	ldp	x8, x9, [x1, #16]
    4034:	a97e2c8a 	ldp	x10, x11, [x4, #-32]
    4038:	a9012408 	stp	x8, x9, [x0, #16]
    403c:	a93e2caa 	stp	x10, x11, [x5, #-32]
    4040:	a9001c06 	stp	x6, x7, [x0]
    4044:	a93f34ac 	stp	x12, x13, [x5, #-16]
    4048:	d65f03c0 	ret
    404c:	d503201f 	nop
    4050:	f100205f 	cmp	x2, #0x8
    4054:	540000e3 	b.cc	4070 <memcpy+0x70>  // b.lo, b.ul, b.last
    4058:	f9400026 	ldr	x6, [x1]
    405c:	f85f8087 	ldur	x7, [x4, #-8]
    4060:	f9000006 	str	x6, [x0]
    4064:	f81f80a7 	stur	x7, [x5, #-8]
    4068:	d65f03c0 	ret
    406c:	d503201f 	nop
    4070:	361000c2 	tbz	w2, #2, 4088 <memcpy+0x88>
    4074:	b9400026 	ldr	w6, [x1]
    4078:	b85fc087 	ldur	w7, [x4, #-4]
    407c:	b9000006 	str	w6, [x0]
    4080:	b81fc0a7 	stur	w7, [x5, #-4]
    4084:	d65f03c0 	ret
    4088:	b4000102 	cbz	x2, 40a8 <memcpy+0xa8>
    408c:	d341fc49 	lsr	x9, x2, #1
    4090:	39400026 	ldrb	w6, [x1]
    4094:	385ff087 	ldurb	w7, [x4, #-1]
    4098:	38696828 	ldrb	w8, [x1, x9]
    409c:	39000006 	strb	w6, [x0]
    40a0:	38296808 	strb	w8, [x0, x9]
    40a4:	381ff0a7 	sturb	w7, [x5, #-1]
    40a8:	d65f03c0 	ret
    40ac:	d503201f 	nop
    40b0:	a9412428 	ldp	x8, x9, [x1, #16]
    40b4:	a9422c2a 	ldp	x10, x11, [x1, #32]
    40b8:	a943342c 	ldp	x12, x13, [x1, #48]
    40bc:	a97e0881 	ldp	x1, x2, [x4, #-32]
    40c0:	a97f0c84 	ldp	x4, x3, [x4, #-16]
    40c4:	a9001c06 	stp	x6, x7, [x0]
    40c8:	a9012408 	stp	x8, x9, [x0, #16]
    40cc:	a9022c0a 	stp	x10, x11, [x0, #32]
    40d0:	a903340c 	stp	x12, x13, [x0, #48]
    40d4:	a93e08a1 	stp	x1, x2, [x5, #-32]
    40d8:	a93f0ca4 	stp	x4, x3, [x5, #-16]
    40dc:	d65f03c0 	ret
    40e0:	92400c09 	and	x9, x0, #0xf
    40e4:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    40e8:	a940342c 	ldp	x12, x13, [x1]
    40ec:	cb090021 	sub	x1, x1, x9
    40f0:	8b090042 	add	x2, x2, x9
    40f4:	a9411c26 	ldp	x6, x7, [x1, #16]
    40f8:	a900340c 	stp	x12, x13, [x0]
    40fc:	a9422428 	ldp	x8, x9, [x1, #32]
    4100:	a9432c2a 	ldp	x10, x11, [x1, #48]
    4104:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    4108:	f1024042 	subs	x2, x2, #0x90
    410c:	54000169 	b.ls	4138 <memcpy+0x138>  // b.plast
    4110:	a9011c66 	stp	x6, x7, [x3, #16]
    4114:	a9411c26 	ldp	x6, x7, [x1, #16]
    4118:	a9022468 	stp	x8, x9, [x3, #32]
    411c:	a9422428 	ldp	x8, x9, [x1, #32]
    4120:	a9032c6a 	stp	x10, x11, [x3, #48]
    4124:	a9432c2a 	ldp	x10, x11, [x1, #48]
    4128:	a984346c 	stp	x12, x13, [x3, #64]!
    412c:	a9c4342c 	ldp	x12, x13, [x1, #64]!
    4130:	f1010042 	subs	x2, x2, #0x40
    4134:	54fffee8 	b.hi	4110 <memcpy+0x110>  // b.pmore
    4138:	a97c0881 	ldp	x1, x2, [x4, #-64]
    413c:	a9011c66 	stp	x6, x7, [x3, #16]
    4140:	a97d1c86 	ldp	x6, x7, [x4, #-48]
    4144:	a9022468 	stp	x8, x9, [x3, #32]
    4148:	a97e2488 	ldp	x8, x9, [x4, #-32]
    414c:	a9032c6a 	stp	x10, x11, [x3, #48]
    4150:	a97f2c8a 	ldp	x10, x11, [x4, #-16]
    4154:	a904346c 	stp	x12, x13, [x3, #64]
    4158:	a93c08a1 	stp	x1, x2, [x5, #-64]
    415c:	a93d1ca6 	stp	x6, x7, [x5, #-48]
    4160:	a93e24a8 	stp	x8, x9, [x5, #-32]
    4164:	a93f2caa 	stp	x10, x11, [x5, #-16]
    4168:	d65f03c0 	ret
    416c:	d503201f 	nop
    4170:	d503201f 	nop
    4174:	d503201f 	nop
    4178:	d503201f 	nop
    417c:	d503201f 	nop

0000000000004180 <memmove>:
    4180:	cb010005 	sub	x5, x0, x1
    4184:	f101805f 	cmp	x2, #0x60
    4188:	fa4280a2 	ccmp	x5, x2, #0x2, hi  // hi = pmore
    418c:	54fff3a2 	b.cs	4000 <memcpy>  // b.hs, b.nlast
    4190:	b40004c5 	cbz	x5, 4228 <memmove+0xa8>
    4194:	8b020004 	add	x4, x0, x2
    4198:	8b020023 	add	x3, x1, x2
    419c:	92400c85 	and	x5, x4, #0xf
    41a0:	a97f346c 	ldp	x12, x13, [x3, #-16]
    41a4:	cb050063 	sub	x3, x3, x5
    41a8:	cb050042 	sub	x2, x2, x5
    41ac:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    41b0:	a93f348c 	stp	x12, x13, [x4, #-16]
    41b4:	a97e2468 	ldp	x8, x9, [x3, #-32]
    41b8:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    41bc:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    41c0:	cb050084 	sub	x4, x4, x5
    41c4:	f1020042 	subs	x2, x2, #0x80
    41c8:	54000189 	b.ls	41f8 <memmove+0x78>  // b.plast
    41cc:	d503201f 	nop
    41d0:	a93f1c86 	stp	x6, x7, [x4, #-16]
    41d4:	a97f1c66 	ldp	x6, x7, [x3, #-16]
    41d8:	a93e2488 	stp	x8, x9, [x4, #-32]
    41dc:	a97e2468 	ldp	x8, x9, [x3, #-32]
    41e0:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    41e4:	a97d2c6a 	ldp	x10, x11, [x3, #-48]
    41e8:	a9bc348c 	stp	x12, x13, [x4, #-64]!
    41ec:	a9fc346c 	ldp	x12, x13, [x3, #-64]!
    41f0:	f1010042 	subs	x2, x2, #0x40
    41f4:	54fffee8 	b.hi	41d0 <memmove+0x50>  // b.pmore
    41f8:	a9431422 	ldp	x2, x5, [x1, #48]
    41fc:	a93f1c86 	stp	x6, x7, [x4, #-16]
    4200:	a9421c26 	ldp	x6, x7, [x1, #32]
    4204:	a93e2488 	stp	x8, x9, [x4, #-32]
    4208:	a9412428 	ldp	x8, x9, [x1, #16]
    420c:	a93d2c8a 	stp	x10, x11, [x4, #-48]
    4210:	a9402c2a 	ldp	x10, x11, [x1]
    4214:	a93c348c 	stp	x12, x13, [x4, #-64]
    4218:	a9031402 	stp	x2, x5, [x0, #48]
    421c:	a9021c06 	stp	x6, x7, [x0, #32]
    4220:	a9012408 	stp	x8, x9, [x0, #16]
    4224:	a9002c0a 	stp	x10, x11, [x0]
    4228:	d65f03c0 	ret
    422c:	d503201f 	nop
    4230:	d503201f 	nop
    4234:	d503201f 	nop
    4238:	d503201f 	nop
    423c:	d503201f 	nop

0000000000004240 <memset>:
    4240:	4e010c20 	dup	v0.16b, w1
    4244:	8b020004 	add	x4, x0, x2
    4248:	f101805f 	cmp	x2, #0x60
    424c:	540003c8 	b.hi	42c4 <memset+0x84>  // b.pmore
    4250:	f100405f 	cmp	x2, #0x10
    4254:	54000202 	b.cs	4294 <memset+0x54>  // b.hs, b.nlast
    4258:	4e083c01 	mov	x1, v0.d[0]
    425c:	361800a2 	tbz	w2, #3, 4270 <memset+0x30>
    4260:	f9000001 	str	x1, [x0]
    4264:	f81f8081 	stur	x1, [x4, #-8]
    4268:	d65f03c0 	ret
    426c:	d503201f 	nop
    4270:	36100082 	tbz	w2, #2, 4280 <memset+0x40>
    4274:	b9000001 	str	w1, [x0]
    4278:	b81fc081 	stur	w1, [x4, #-4]
    427c:	d65f03c0 	ret
    4280:	b4000082 	cbz	x2, 4290 <memset+0x50>
    4284:	39000001 	strb	w1, [x0]
    4288:	36080042 	tbz	w2, #1, 4290 <memset+0x50>
    428c:	781fe081 	sturh	w1, [x4, #-2]
    4290:	d65f03c0 	ret
    4294:	3d800000 	str	q0, [x0]
    4298:	373000c2 	tbnz	w2, #6, 42b0 <memset+0x70>
    429c:	3c9f0080 	stur	q0, [x4, #-16]
    42a0:	36280062 	tbz	w2, #5, 42ac <memset+0x6c>
    42a4:	3d800400 	str	q0, [x0, #16]
    42a8:	3c9e0080 	stur	q0, [x4, #-32]
    42ac:	d65f03c0 	ret
    42b0:	3d800400 	str	q0, [x0, #16]
    42b4:	ad010000 	stp	q0, q0, [x0, #32]
    42b8:	ad3f0080 	stp	q0, q0, [x4, #-32]
    42bc:	d65f03c0 	ret
    42c0:	d503201f 	nop
    42c4:	12001c21 	and	w1, w1, #0xff
    42c8:	927cec03 	and	x3, x0, #0xfffffffffffffff0
    42cc:	3d800000 	str	q0, [x0]
    42d0:	f104005f 	cmp	x2, #0x100
    42d4:	7a402820 	ccmp	w1, #0x0, #0x0, cs  // cs = hs, nlast
    42d8:	54000180 	b.eq	4308 <memset+0xc8>  // b.none
    42dc:	cb030082 	sub	x2, x4, x3
    42e0:	d1004063 	sub	x3, x3, #0x10
    42e4:	d1014042 	sub	x2, x2, #0x50
    42e8:	ad010060 	stp	q0, q0, [x3, #32]
    42ec:	ad820060 	stp	q0, q0, [x3, #64]!
    42f0:	f1010042 	subs	x2, x2, #0x40
    42f4:	54ffffa8 	b.hi	42e8 <memset+0xa8>  // b.pmore
    42f8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    42fc:	ad3f0080 	stp	q0, q0, [x4, #-32]
    4300:	d65f03c0 	ret
    4304:	d503201f 	nop
    4308:	d53b00e5 	mrs	x5, dczid_el0
    430c:	3727fe85 	tbnz	w5, #4, 42dc <memset+0x9c>
    4310:	12000ca5 	and	w5, w5, #0xf
    4314:	710010bf 	cmp	w5, #0x4
    4318:	54000281 	b.ne	4368 <memset+0x128>  // b.any
    431c:	3d800460 	str	q0, [x3, #16]
    4320:	ad010060 	stp	q0, q0, [x3, #32]
    4324:	927ae463 	and	x3, x3, #0xffffffffffffffc0
    4328:	ad020060 	stp	q0, q0, [x3, #64]
    432c:	ad030060 	stp	q0, q0, [x3, #96]
    4330:	cb030082 	sub	x2, x4, x3
    4334:	d1040042 	sub	x2, x2, #0x100
    4338:	91020063 	add	x3, x3, #0x80
    433c:	d503201f 	nop
    4340:	d50b7423 	dc	zva, x3
    4344:	91010063 	add	x3, x3, #0x40
    4348:	f1010042 	subs	x2, x2, #0x40
    434c:	54ffffa8 	b.hi	4340 <memset+0x100>  // b.pmore
    4350:	ad000060 	stp	q0, q0, [x3]
    4354:	ad010060 	stp	q0, q0, [x3, #32]
    4358:	ad3e0080 	stp	q0, q0, [x4, #-64]
    435c:	ad3f0080 	stp	q0, q0, [x4, #-32]
    4360:	d65f03c0 	ret
    4364:	d503201f 	nop
    4368:	710014bf 	cmp	w5, #0x5
    436c:	54000241 	b.ne	43b4 <memset+0x174>  // b.any
    4370:	3d800460 	str	q0, [x3, #16]
    4374:	ad010060 	stp	q0, q0, [x3, #32]
    4378:	ad020060 	stp	q0, q0, [x3, #64]
    437c:	ad030060 	stp	q0, q0, [x3, #96]
    4380:	9279e063 	and	x3, x3, #0xffffffffffffff80
    4384:	cb030082 	sub	x2, x4, x3
    4388:	d1040042 	sub	x2, x2, #0x100
    438c:	91020063 	add	x3, x3, #0x80
    4390:	d50b7423 	dc	zva, x3
    4394:	91020063 	add	x3, x3, #0x80
    4398:	f1020042 	subs	x2, x2, #0x80
    439c:	54ffffa8 	b.hi	4390 <memset+0x150>  // b.pmore
    43a0:	ad3c0080 	stp	q0, q0, [x4, #-128]
    43a4:	ad3d0080 	stp	q0, q0, [x4, #-96]
    43a8:	ad3e0080 	stp	q0, q0, [x4, #-64]
    43ac:	ad3f0080 	stp	q0, q0, [x4, #-32]
    43b0:	d65f03c0 	ret
    43b4:	52800086 	mov	w6, #0x4                   	// #4
    43b8:	1ac520c7 	lsl	w7, w6, w5
    43bc:	910100e5 	add	x5, x7, #0x40
    43c0:	eb05005f 	cmp	x2, x5
    43c4:	54fff8c3 	b.cc	42dc <memset+0x9c>  // b.lo, b.ul, b.last
    43c8:	d10004e6 	sub	x6, x7, #0x1
    43cc:	8b070065 	add	x5, x3, x7
    43d0:	91004063 	add	x3, x3, #0x10
    43d4:	eb0300a2 	subs	x2, x5, x3
    43d8:	8a2600a5 	bic	x5, x5, x6
    43dc:	540000a0 	b.eq	43f0 <memset+0x1b0>  // b.none
    43e0:	ac820060 	stp	q0, q0, [x3], #64
    43e4:	ad3f0060 	stp	q0, q0, [x3, #-32]
    43e8:	f1010042 	subs	x2, x2, #0x40
    43ec:	54ffffa8 	b.hi	43e0 <memset+0x1a0>  // b.pmore
    43f0:	aa0503e3 	mov	x3, x5
    43f4:	cb050082 	sub	x2, x4, x5
    43f8:	eb070042 	subs	x2, x2, x7
    43fc:	540000a3 	b.cc	4410 <memset+0x1d0>  // b.lo, b.ul, b.last
    4400:	d50b7423 	dc	zva, x3
    4404:	8b070063 	add	x3, x3, x7
    4408:	eb070042 	subs	x2, x2, x7
    440c:	54ffffa2 	b.cs	4400 <memset+0x1c0>  // b.hs, b.nlast
    4410:	8b070042 	add	x2, x2, x7
    4414:	d1008063 	sub	x3, x3, #0x20
    4418:	17ffffb6 	b	42f0 <memset+0xb0>
    441c:	d503201f 	nop
    4420:	d503201f 	nop
    4424:	d503201f 	nop
    4428:	d503201f 	nop
    442c:	d503201f 	nop
    4430:	d503201f 	nop
    4434:	d503201f 	nop
    4438:	d503201f 	nop
    443c:	d503201f 	nop

0000000000004440 <strlen>:
    4440:	92402c04 	and	x4, x0, #0xfff
    4444:	b200c3e8 	mov	x8, #0x101010101010101     	// #72340172838076673
    4448:	f13fc09f 	cmp	x4, #0xff0
    444c:	5400082c 	b.gt	4550 <strlen+0x110>
    4450:	a9400c02 	ldp	x2, x3, [x0]
    4454:	cb080044 	sub	x4, x2, x8
    4458:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    445c:	cb080066 	sub	x6, x3, x8
    4460:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4464:	ea250084 	bics	x4, x4, x5
    4468:	8a2700c5 	bic	x5, x6, x7
    446c:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4470:	54000100 	b.eq	4490 <strlen+0x50>  // b.none
    4474:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    4478:	d2800100 	mov	x0, #0x8                   	// #8
    447c:	dac00c84 	rev	x4, x4
    4480:	dac01084 	clz	x4, x4
    4484:	9a8033e0 	csel	x0, xzr, x0, cc  // cc = lo, ul, last
    4488:	8b440c00 	add	x0, x0, x4, lsr #3
    448c:	d65f03c0 	ret
    4490:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    4494:	d1004021 	sub	x1, x1, #0x10
    4498:	a9c20c22 	ldp	x2, x3, [x1, #32]!
    449c:	cb080044 	sub	x4, x2, x8
    44a0:	cb080066 	sub	x6, x3, x8
    44a4:	aa060085 	orr	x5, x4, x6
    44a8:	ea081cbf 	tst	x5, x8, lsl #7
    44ac:	54000101 	b.ne	44cc <strlen+0x8c>  // b.any
    44b0:	a9410c22 	ldp	x2, x3, [x1, #16]
    44b4:	cb080044 	sub	x4, x2, x8
    44b8:	cb080066 	sub	x6, x3, x8
    44bc:	aa060085 	orr	x5, x4, x6
    44c0:	ea081cbf 	tst	x5, x8, lsl #7
    44c4:	54fffea0 	b.eq	4498 <strlen+0x58>  // b.none
    44c8:	91004021 	add	x1, x1, #0x10
    44cc:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    44d0:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    44d4:	ea250084 	bics	x4, x4, x5
    44d8:	8a2700c5 	bic	x5, x6, x7
    44dc:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    44e0:	54000120 	b.eq	4504 <strlen+0xc4>  // b.none
    44e4:	9a853084 	csel	x4, x4, x5, cc  // cc = lo, ul, last
    44e8:	cb000020 	sub	x0, x1, x0
    44ec:	dac00c84 	rev	x4, x4
    44f0:	91002005 	add	x5, x0, #0x8
    44f4:	dac01084 	clz	x4, x4
    44f8:	9a853000 	csel	x0, x0, x5, cc  // cc = lo, ul, last
    44fc:	8b440c00 	add	x0, x0, x4, lsr #3
    4500:	d65f03c0 	ret
    4504:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    4508:	cb080044 	sub	x4, x2, x8
    450c:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4510:	cb080066 	sub	x6, x3, x8
    4514:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    4518:	ea250084 	bics	x4, x4, x5
    451c:	8a2700c5 	bic	x5, x6, x7
    4520:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4524:	54fffe01 	b.ne	44e4 <strlen+0xa4>  // b.any
    4528:	a9c10c22 	ldp	x2, x3, [x1, #16]!
    452c:	cb080044 	sub	x4, x2, x8
    4530:	b200d845 	orr	x5, x2, #0x7f7f7f7f7f7f7f7f
    4534:	cb080066 	sub	x6, x3, x8
    4538:	b200d867 	orr	x7, x3, #0x7f7f7f7f7f7f7f7f
    453c:	ea250084 	bics	x4, x4, x5
    4540:	8a2700c5 	bic	x5, x6, x7
    4544:	fa4008a0 	ccmp	x5, #0x0, #0x0, eq  // eq = none
    4548:	54fffde0 	b.eq	4504 <strlen+0xc4>  // b.none
    454c:	17ffffe6 	b	44e4 <strlen+0xa4>
    4550:	927cec01 	and	x1, x0, #0xfffffffffffffff0
    4554:	a9400c22 	ldp	x2, x3, [x1]
    4558:	d37df004 	lsl	x4, x0, #3
    455c:	92800007 	mov	x7, #0xffffffffffffffff    	// #-1
    4560:	9ac420e4 	lsl	x4, x7, x4
    4564:	b201c084 	orr	x4, x4, #0x8080808080808080
    4568:	aa240042 	orn	x2, x2, x4
    456c:	aa240065 	orn	x5, x3, x4
    4570:	f27d001f 	tst	x0, #0x8
    4574:	9a870042 	csel	x2, x2, x7, eq  // eq = none
    4578:	9a850063 	csel	x3, x3, x5, eq  // eq = none
    457c:	17ffffc8 	b	449c <strlen+0x5c>

0000000000004580 <__sprint_r.part.0>:
    4580:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    4584:	910003fd 	mov	x29, sp
    4588:	b940ac23 	ldr	w3, [x1, #172]
    458c:	a90363f7 	stp	x23, x24, [sp, #48]
    4590:	aa0203f8 	mov	x24, x2
    4594:	36680563 	tbz	w3, #13, 4640 <__sprint_r.part.0+0xc0>
    4598:	a9025bf5 	stp	x21, x22, [sp, #32]
    459c:	aa0003f5 	mov	x21, x0
    45a0:	f9400840 	ldr	x0, [x2, #16]
    45a4:	a90153f3 	stp	x19, x20, [sp, #16]
    45a8:	aa0103f4 	mov	x20, x1
    45ac:	a9046bf9 	stp	x25, x26, [sp, #64]
    45b0:	f940005a 	ldr	x26, [x2]
    45b4:	b40003c0 	cbz	x0, 462c <__sprint_r.part.0+0xac>
    45b8:	a9406756 	ldp	x22, x25, [x26]
    45bc:	d342ff39 	lsr	x25, x25, #2
    45c0:	2a1903f7 	mov	w23, w25
    45c4:	7100033f 	cmp	w25, #0x0
    45c8:	540002ad 	b.le	461c <__sprint_r.part.0+0x9c>
    45cc:	d2800013 	mov	x19, #0x0                   	// #0
    45d0:	14000003 	b	45dc <__sprint_r.part.0+0x5c>
    45d4:	6b1302ff 	cmp	w23, w19
    45d8:	5400020d 	b.le	4618 <__sprint_r.part.0+0x98>
    45dc:	b8737ac1 	ldr	w1, [x22, x19, lsl #2]
    45e0:	aa1403e2 	mov	x2, x20
    45e4:	aa1503e0 	mov	x0, x21
    45e8:	91000673 	add	x19, x19, #0x1
    45ec:	94000a15 	bl	6e40 <_fputwc_r>
    45f0:	3100041f 	cmn	w0, #0x1
    45f4:	54ffff01 	b.ne	45d4 <__sprint_r.part.0+0x54>  // b.any
    45f8:	a94153f3 	ldp	x19, x20, [sp, #16]
    45fc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4600:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4604:	b9000b1f 	str	wzr, [x24, #8]
    4608:	f9000b1f 	str	xzr, [x24, #16]
    460c:	a94363f7 	ldp	x23, x24, [sp, #48]
    4610:	a8c57bfd 	ldp	x29, x30, [sp], #80
    4614:	d65f03c0 	ret
    4618:	f9400b00 	ldr	x0, [x24, #16]
    461c:	cb39c800 	sub	x0, x0, w25, sxtw #2
    4620:	f9000b00 	str	x0, [x24, #16]
    4624:	9100435a 	add	x26, x26, #0x10
    4628:	b5fffc80 	cbnz	x0, 45b8 <__sprint_r.part.0+0x38>
    462c:	52800000 	mov	w0, #0x0                   	// #0
    4630:	a94153f3 	ldp	x19, x20, [sp, #16]
    4634:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4638:	a9446bf9 	ldp	x25, x26, [sp, #64]
    463c:	17fffff2 	b	4604 <__sprint_r.part.0+0x84>
    4640:	94000b2c 	bl	72f0 <__sfvwrite_r>
    4644:	b9000b1f 	str	wzr, [x24, #8]
    4648:	f9000b1f 	str	xzr, [x24, #16]
    464c:	a94363f7 	ldp	x23, x24, [sp, #48]
    4650:	a8c57bfd 	ldp	x29, x30, [sp], #80
    4654:	d65f03c0 	ret
    4658:	d503201f 	nop
    465c:	d503201f 	nop

0000000000004660 <__sprint_r>:
    4660:	f9400844 	ldr	x4, [x2, #16]
    4664:	b4000044 	cbz	x4, 466c <__sprint_r+0xc>
    4668:	17ffffc6 	b	4580 <__sprint_r.part.0>
    466c:	52800000 	mov	w0, #0x0                   	// #0
    4670:	b900085f 	str	wzr, [x2, #8]
    4674:	d65f03c0 	ret
    4678:	d503201f 	nop
    467c:	d503201f 	nop

0000000000004680 <_vfiprintf_r>:
    4680:	d10843ff 	sub	sp, sp, #0x210
    4684:	a9007bfd 	stp	x29, x30, [sp]
    4688:	910003fd 	mov	x29, sp
    468c:	a9025bf5 	stp	x21, x22, [sp, #32]
    4690:	aa0303f5 	mov	x21, x3
    4694:	f9400063 	ldr	x3, [x3]
    4698:	f90037e3 	str	x3, [sp, #104]
    469c:	f94006a3 	ldr	x3, [x21, #8]
    46a0:	f90043e3 	str	x3, [sp, #128]
    46a4:	b9401aa3 	ldr	w3, [x21, #24]
    46a8:	a90153f3 	stp	x19, x20, [sp, #16]
    46ac:	aa0003f3 	mov	x19, x0
    46b0:	aa0203f4 	mov	x20, x2
    46b4:	9103e3e0 	add	x0, sp, #0xf8
    46b8:	d2800102 	mov	x2, #0x8                   	// #8
    46bc:	a9046bf9 	stp	x25, x26, [sp, #64]
    46c0:	aa0103f9 	mov	x25, x1
    46c4:	52800001 	mov	w1, #0x0                   	// #0
    46c8:	b900b3e3 	str	w3, [sp, #176]
    46cc:	97fffedd 	bl	4240 <memset>
    46d0:	b4000073 	cbz	x19, 46dc <_vfiprintf_r+0x5c>
    46d4:	b9405260 	ldr	w0, [x19, #80]
    46d8:	34002020 	cbz	w0, 4adc <_vfiprintf_r+0x45c>
    46dc:	79c02321 	ldrsh	w1, [x25, #16]
    46e0:	12003c20 	and	w0, w1, #0xffff
    46e4:	376800e1 	tbnz	w1, #13, 4700 <_vfiprintf_r+0x80>
    46e8:	b940af22 	ldr	w2, [x25, #172]
    46ec:	32130021 	orr	w1, w1, #0x2000
    46f0:	12003c20 	and	w0, w1, #0xffff
    46f4:	79002321 	strh	w1, [x25, #16]
    46f8:	12127841 	and	w1, w2, #0xffffdfff
    46fc:	b900af21 	str	w1, [x25, #172]
    4700:	36180520 	tbz	w0, #3, 47a4 <_vfiprintf_r+0x124>
    4704:	f9400f21 	ldr	x1, [x25, #24]
    4708:	b40004e1 	cbz	x1, 47a4 <_vfiprintf_r+0x124>
    470c:	52800341 	mov	w1, #0x1a                  	// #26
    4710:	0a010000 	and	w0, w0, w1
    4714:	7100281f 	cmp	w0, #0xa
    4718:	54000580 	b.eq	47c8 <_vfiprintf_r+0x148>  // b.none
    471c:	a90573fb 	stp	x27, x28, [sp, #80]
    4720:	910643fc 	add	x28, sp, #0x190
    4724:	90000055 	adrp	x21, c000 <__func__.0+0x28>
    4728:	aa1c03fb 	mov	x27, x28
    472c:	913f82b5 	add	x21, x21, #0xfe0
    4730:	90000040 	adrp	x0, c000 <__func__.0+0x28>
    4734:	91082000 	add	x0, x0, #0x208
    4738:	a90363f7 	stp	x23, x24, [sp, #48]
    473c:	b90067ff 	str	wzr, [sp, #100]
    4740:	f9003fe0 	str	x0, [sp, #120]
    4744:	f90047ff 	str	xzr, [sp, #136]
    4748:	a909ffff 	stp	xzr, xzr, [sp, #152]
    474c:	f90057ff 	str	xzr, [sp, #168]
    4750:	f9008bfc 	str	x28, [sp, #272]
    4754:	b9011bff 	str	wzr, [sp, #280]
    4758:	f90093ff 	str	xzr, [sp, #288]
    475c:	aa1403f7 	mov	x23, x20
    4760:	f94076b6 	ldr	x22, [x21, #232]
    4764:	94000fa7 	bl	8600 <__locale_mb_cur_max>
    4768:	9103e3e4 	add	x4, sp, #0xf8
    476c:	93407c03 	sxtw	x3, w0
    4770:	aa1703e2 	mov	x2, x23
    4774:	9103d3e1 	add	x1, sp, #0xf4
    4778:	aa1303e0 	mov	x0, x19
    477c:	d63f02c0 	blr	x22
    4780:	7100001f 	cmp	w0, #0x0
    4784:	340004a0 	cbz	w0, 4818 <_vfiprintf_r+0x198>
    4788:	540003ab 	b.lt	47fc <_vfiprintf_r+0x17c>  // b.tstop
    478c:	b940f7e1 	ldr	w1, [sp, #244]
    4790:	7100943f 	cmp	w1, #0x25
    4794:	54001720 	b.eq	4a78 <_vfiprintf_r+0x3f8>  // b.none
    4798:	93407c00 	sxtw	x0, w0
    479c:	8b0002f7 	add	x23, x23, x0
    47a0:	17fffff0 	b	4760 <_vfiprintf_r+0xe0>
    47a4:	aa1903e1 	mov	x1, x25
    47a8:	aa1303e0 	mov	x0, x19
    47ac:	9400072d 	bl	6460 <__swsetup_r>
    47b0:	3500b220 	cbnz	w0, 5df4 <_vfiprintf_r+0x1774>
    47b4:	79402320 	ldrh	w0, [x25, #16]
    47b8:	52800341 	mov	w1, #0x1a                  	// #26
    47bc:	0a010000 	and	w0, w0, w1
    47c0:	7100281f 	cmp	w0, #0xa
    47c4:	54fffac1 	b.ne	471c <_vfiprintf_r+0x9c>  // b.any
    47c8:	79c02720 	ldrsh	w0, [x25, #18]
    47cc:	37fffa80 	tbnz	w0, #31, 471c <_vfiprintf_r+0x9c>
    47d0:	a9401ea6 	ldp	x6, x7, [x21]
    47d4:	aa1403e2 	mov	x2, x20
    47d8:	a94116a4 	ldp	x4, x5, [x21, #16]
    47dc:	aa1903e1 	mov	x1, x25
    47e0:	aa1303e0 	mov	x0, x19
    47e4:	910303e3 	add	x3, sp, #0xc0
    47e8:	a90c1fe6 	stp	x6, x7, [sp, #192]
    47ec:	a90d17e4 	stp	x4, x5, [sp, #208]
    47f0:	9400068c 	bl	6220 <__sbprintf>
    47f4:	b90067e0 	str	w0, [sp, #100]
    47f8:	140000b2 	b	4ac0 <_vfiprintf_r+0x440>
    47fc:	9103e3e0 	add	x0, sp, #0xf8
    4800:	d2800102 	mov	x2, #0x8                   	// #8
    4804:	52800001 	mov	w1, #0x0                   	// #0
    4808:	97fffe8e 	bl	4240 <memset>
    480c:	d2800020 	mov	x0, #0x1                   	// #1
    4810:	8b0002f7 	add	x23, x23, x0
    4814:	17ffffd3 	b	4760 <_vfiprintf_r+0xe0>
    4818:	2a0003f6 	mov	w22, w0
    481c:	cb1402e0 	sub	x0, x23, x20
    4820:	2a0003f8 	mov	w24, w0
    4824:	34008d60 	cbz	w0, 59d0 <_vfiprintf_r+0x1350>
    4828:	f94093e2 	ldr	x2, [sp, #288]
    482c:	93407f01 	sxtw	x1, w24
    4830:	b9411be0 	ldr	w0, [sp, #280]
    4834:	8b020022 	add	x2, x1, x2
    4838:	a9000774 	stp	x20, x1, [x27]
    483c:	11000400 	add	w0, w0, #0x1
    4840:	b9011be0 	str	w0, [sp, #280]
    4844:	f90093e2 	str	x2, [sp, #288]
    4848:	71001c1f 	cmp	w0, #0x7
    484c:	5400120d 	b.le	4a8c <_vfiprintf_r+0x40c>
    4850:	b4006222 	cbz	x2, 5494 <_vfiprintf_r+0xe14>
    4854:	910443e2 	add	x2, sp, #0x110
    4858:	aa1903e1 	mov	x1, x25
    485c:	aa1303e0 	mov	x0, x19
    4860:	97ffff48 	bl	4580 <__sprint_r.part.0>
    4864:	35001260 	cbnz	w0, 4ab0 <_vfiprintf_r+0x430>
    4868:	910643fb 	add	x27, sp, #0x190
    486c:	b94067e0 	ldr	w0, [sp, #100]
    4870:	0b180000 	add	w0, w0, w24
    4874:	b90067e0 	str	w0, [sp, #100]
    4878:	34008ad6 	cbz	w22, 59d0 <_vfiprintf_r+0x1350>
    487c:	394006e0 	ldrb	w0, [x23, #1]
    4880:	12800004 	mov	w4, #0xffffffff            	// #-1
    4884:	910006f4 	add	x20, x23, #0x1
    4888:	2a0403f6 	mov	w22, w4
    488c:	5280001c 	mov	w28, #0x0                   	// #0
    4890:	b90063ff 	str	wzr, [sp, #96]
    4894:	3903bfff 	strb	wzr, [sp, #239]
    4898:	91000694 	add	x20, x20, #0x1
    489c:	51008001 	sub	w1, w0, #0x20
    48a0:	7101683f 	cmp	w1, #0x5a
    48a4:	54000c49 	b.ls	4a2c <_vfiprintf_r+0x3ac>  // b.plast
    48a8:	34008940 	cbz	w0, 59d0 <_vfiprintf_r+0x1350>
    48ac:	52800036 	mov	w22, #0x1                   	// #1
    48b0:	9104a3fa 	add	x26, sp, #0x128
    48b4:	2a1603f7 	mov	w23, w22
    48b8:	3903bfff 	strb	wzr, [sp, #239]
    48bc:	3904a3e0 	strb	w0, [sp, #296]
    48c0:	52800004 	mov	w4, #0x0                   	// #0
    48c4:	f9003bff 	str	xzr, [sp, #112]
    48c8:	b9411be1 	ldr	w1, [sp, #280]
    48cc:	11000ac0 	add	w0, w22, #0x2
    48d0:	721f038a 	ands	w10, w28, #0x2
    48d4:	52801098 	mov	w24, #0x84                  	// #132
    48d8:	11000422 	add	w2, w1, #0x1
    48dc:	1a961016 	csel	w22, w0, w22, ne  // ne = any
    48e0:	2a0203e8 	mov	w8, w2
    48e4:	6a180398 	ands	w24, w28, w24
    48e8:	f94093e0 	ldr	x0, [sp, #288]
    48ec:	540000a1 	b.ne	4900 <_vfiprintf_r+0x280>  // b.any
    48f0:	b94063e3 	ldr	w3, [sp, #96]
    48f4:	4b160069 	sub	w9, w3, w22
    48f8:	7100013f 	cmp	w9, #0x0
    48fc:	5400496c 	b.gt	5228 <_vfiprintf_r+0xba8>
    4900:	3943bfe2 	ldrb	w2, [sp, #239]
    4904:	340001a2 	cbz	w2, 4938 <_vfiprintf_r+0x2b8>
    4908:	9103bfe1 	add	x1, sp, #0xef
    490c:	91000400 	add	x0, x0, #0x1
    4910:	f9000361 	str	x1, [x27]
    4914:	d2800021 	mov	x1, #0x1                   	// #1
    4918:	f9000761 	str	x1, [x27, #8]
    491c:	b9011be8 	str	w8, [sp, #280]
    4920:	f90093e0 	str	x0, [sp, #288]
    4924:	71001d1f 	cmp	w8, #0x7
    4928:	540044cc 	b.gt	51c0 <_vfiprintf_r+0xb40>
    492c:	2a0803e1 	mov	w1, w8
    4930:	9100437b 	add	x27, x27, #0x10
    4934:	11000508 	add	w8, w8, #0x1
    4938:	340002ca 	cbz	w10, 4990 <_vfiprintf_r+0x310>
    493c:	91000800 	add	x0, x0, #0x2
    4940:	9103c3e2 	add	x2, sp, #0xf0
    4944:	d2800041 	mov	x1, #0x2                   	// #2
    4948:	a9000762 	stp	x2, x1, [x27]
    494c:	b9011be8 	str	w8, [sp, #280]
    4950:	f90093e0 	str	x0, [sp, #288]
    4954:	71001d1f 	cmp	w8, #0x7
    4958:	5400460d 	b.le	5218 <_vfiprintf_r+0xb98>
    495c:	b4005b20 	cbz	x0, 54c0 <_vfiprintf_r+0xe40>
    4960:	910443e2 	add	x2, sp, #0x110
    4964:	aa1903e1 	mov	x1, x25
    4968:	aa1303e0 	mov	x0, x19
    496c:	b90093e4 	str	w4, [sp, #144]
    4970:	97ffff04 	bl	4580 <__sprint_r.part.0>
    4974:	35000940 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    4978:	b9411be1 	ldr	w1, [sp, #280]
    497c:	910643fb 	add	x27, sp, #0x190
    4980:	b94093e4 	ldr	w4, [sp, #144]
    4984:	f94093e0 	ldr	x0, [sp, #288]
    4988:	11000428 	add	w8, w1, #0x1
    498c:	d503201f 	nop
    4990:	7102031f 	cmp	w24, #0x80
    4994:	54002f80 	b.eq	4f84 <_vfiprintf_r+0x904>  // b.none
    4998:	4b170098 	sub	w24, w4, w23
    499c:	7100031f 	cmp	w24, #0x0
    49a0:	540038cc 	b.gt	50b8 <_vfiprintf_r+0xa38>
    49a4:	93407ef7 	sxtw	x23, w23
    49a8:	a9005f7a 	stp	x26, x23, [x27]
    49ac:	8b0002e0 	add	x0, x23, x0
    49b0:	b9011be8 	str	w8, [sp, #280]
    49b4:	f90093e0 	str	x0, [sp, #288]
    49b8:	71001d1f 	cmp	w8, #0x7
    49bc:	540029ad 	b.le	4ef0 <_vfiprintf_r+0x870>
    49c0:	b4004ba0 	cbz	x0, 5334 <_vfiprintf_r+0xcb4>
    49c4:	910443e2 	add	x2, sp, #0x110
    49c8:	aa1903e1 	mov	x1, x25
    49cc:	aa1303e0 	mov	x0, x19
    49d0:	97fffeec 	bl	4580 <__sprint_r.part.0>
    49d4:	35000640 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    49d8:	f94093e0 	ldr	x0, [sp, #288]
    49dc:	910643e5 	add	x5, sp, #0x190
    49e0:	361000bc 	tbz	w28, #2, 49f4 <_vfiprintf_r+0x374>
    49e4:	b94063e1 	ldr	w1, [sp, #96]
    49e8:	4b160037 	sub	w23, w1, w22
    49ec:	710002ff 	cmp	w23, #0x0
    49f0:	54004b0c 	b.gt	5350 <_vfiprintf_r+0xcd0>
    49f4:	b94063e1 	ldr	w1, [sp, #96]
    49f8:	6b16003f 	cmp	w1, w22
    49fc:	1a96a023 	csel	w3, w1, w22, ge  // ge = tcont
    4a00:	b94067e1 	ldr	w1, [sp, #100]
    4a04:	0b030021 	add	w1, w1, w3
    4a08:	b90067e1 	str	w1, [sp, #100]
    4a0c:	b5003c60 	cbnz	x0, 5198 <_vfiprintf_r+0xb18>
    4a10:	f9403be1 	ldr	x1, [sp, #112]
    4a14:	b9011bff 	str	wzr, [sp, #280]
    4a18:	910643fb 	add	x27, sp, #0x190
    4a1c:	b4ffea01 	cbz	x1, 475c <_vfiprintf_r+0xdc>
    4a20:	aa1303e0 	mov	x0, x19
    4a24:	94000977 	bl	7000 <_free_r>
    4a28:	17ffff4d 	b	475c <_vfiprintf_r+0xdc>
    4a2c:	f9403fe2 	ldr	x2, [sp, #120]
    4a30:	78615841 	ldrh	w1, [x2, w1, uxtw #1]
    4a34:	10000062 	adr	x2, 4a40 <_vfiprintf_r+0x3c0>
    4a38:	8b21a841 	add	x1, x2, w1, sxth #2
    4a3c:	d61f0020 	br	x1
    4a40:	5100c001 	sub	w1, w0, #0x30
    4a44:	b90063ff 	str	wzr, [sp, #96]
    4a48:	b94063e0 	ldr	w0, [sp, #96]
    4a4c:	0b000802 	add	w2, w0, w0, lsl #2
    4a50:	38401680 	ldrb	w0, [x20], #1
    4a54:	0b020421 	add	w1, w1, w2, lsl #1
    4a58:	b90063e1 	str	w1, [sp, #96]
    4a5c:	5100c001 	sub	w1, w0, #0x30
    4a60:	7100243f 	cmp	w1, #0x9
    4a64:	54ffff29 	b.ls	4a48 <_vfiprintf_r+0x3c8>  // b.plast
    4a68:	17ffff8d 	b	489c <_vfiprintf_r+0x21c>
    4a6c:	39400280 	ldrb	w0, [x20]
    4a70:	321c039c 	orr	w28, w28, #0x10
    4a74:	17ffff89 	b	4898 <_vfiprintf_r+0x218>
    4a78:	2a0003f6 	mov	w22, w0
    4a7c:	cb1402e0 	sub	x0, x23, x20
    4a80:	2a0003f8 	mov	w24, w0
    4a84:	34ffefc0 	cbz	w0, 487c <_vfiprintf_r+0x1fc>
    4a88:	17ffff68 	b	4828 <_vfiprintf_r+0x1a8>
    4a8c:	9100437b 	add	x27, x27, #0x10
    4a90:	17ffff77 	b	486c <_vfiprintf_r+0x1ec>
    4a94:	aa1903f3 	mov	x19, x25
    4a98:	aa1403f9 	mov	x25, x20
    4a9c:	f9403be0 	ldr	x0, [sp, #112]
    4aa0:	b4000080 	cbz	x0, 4ab0 <_vfiprintf_r+0x430>
    4aa4:	f9403be1 	ldr	x1, [sp, #112]
    4aa8:	aa1303e0 	mov	x0, x19
    4aac:	94000955 	bl	7000 <_free_r>
    4ab0:	79c02320 	ldrsh	w0, [x25, #16]
    4ab4:	a94363f7 	ldp	x23, x24, [sp, #48]
    4ab8:	a94573fb 	ldp	x27, x28, [sp, #80]
    4abc:	373099c0 	tbnz	w0, #6, 5df4 <_vfiprintf_r+0x1774>
    4ac0:	b94067e0 	ldr	w0, [sp, #100]
    4ac4:	a9407bfd 	ldp	x29, x30, [sp]
    4ac8:	a94153f3 	ldp	x19, x20, [sp, #16]
    4acc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    4ad0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    4ad4:	910843ff 	add	sp, sp, #0x210
    4ad8:	d65f03c0 	ret
    4adc:	aa1303e0 	mov	x0, x19
    4ae0:	94000870 	bl	6ca0 <__sinit>
    4ae4:	17fffefe 	b	46dc <_vfiprintf_r+0x5c>
    4ae8:	b940b3e1 	ldr	w1, [sp, #176]
    4aec:	2a1603e4 	mov	w4, w22
    4af0:	37f856c1 	tbnz	w1, #31, 55c8 <_vfiprintf_r+0xf48>
    4af4:	f94037e1 	ldr	x1, [sp, #104]
    4af8:	91003c38 	add	x24, x1, #0xf
    4afc:	927df318 	and	x24, x24, #0xfffffffffffffff8
    4b00:	f94037e1 	ldr	x1, [sp, #104]
    4b04:	3903bfff 	strb	wzr, [sp, #239]
    4b08:	f940003a 	ldr	x26, [x1]
    4b0c:	b400753a 	cbz	x26, 59b0 <_vfiprintf_r+0x1330>
    4b10:	71014c1f 	cmp	w0, #0x53
    4b14:	54006740 	b.eq	57fc <_vfiprintf_r+0x117c>  // b.none
    4b18:	3720673c 	tbnz	w28, #4, 57fc <_vfiprintf_r+0x117c>
    4b1c:	3100049f 	cmn	w4, #0x1
    4b20:	54009520 	b.eq	5dc4 <_vfiprintf_r+0x1744>  // b.none
    4b24:	93407c82 	sxtw	x2, w4
    4b28:	aa1a03e0 	mov	x0, x26
    4b2c:	52800001 	mov	w1, #0x0                   	// #0
    4b30:	b9006be4 	str	w4, [sp, #104]
    4b34:	94001324 	bl	97c4 <memchr>
    4b38:	f9003be0 	str	x0, [sp, #112]
    4b3c:	b9406be4 	ldr	w4, [sp, #104]
    4b40:	b40090a0 	cbz	x0, 5d54 <_vfiprintf_r+0x16d4>
    4b44:	cb1a0003 	sub	x3, x0, x26
    4b48:	52800004 	mov	w4, #0x0                   	// #0
    4b4c:	7100007f 	cmp	w3, #0x0
    4b50:	2a0303f7 	mov	w23, w3
    4b54:	1a9fa076 	csel	w22, w3, wzr, ge  // ge = tcont
    4b58:	a906fff8 	stp	x24, xzr, [sp, #104]
    4b5c:	14000060 	b	4cdc <_vfiprintf_r+0x65c>
    4b60:	71010c1f 	cmp	w0, #0x43
    4b64:	54000040 	b.eq	4b6c <_vfiprintf_r+0x4ec>  // b.none
    4b68:	3620569c 	tbz	w28, #4, 5638 <_vfiprintf_r+0xfb8>
    4b6c:	910423e0 	add	x0, sp, #0x108
    4b70:	d2800102 	mov	x2, #0x8                   	// #8
    4b74:	52800001 	mov	w1, #0x0                   	// #0
    4b78:	97fffdb2 	bl	4240 <memset>
    4b7c:	b940b3e0 	ldr	w0, [sp, #176]
    4b80:	37f87a20 	tbnz	w0, #31, 5ac4 <_vfiprintf_r+0x1444>
    4b84:	f94037e0 	ldr	x0, [sp, #104]
    4b88:	91002c01 	add	x1, x0, #0xb
    4b8c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4b90:	f90037e1 	str	x1, [sp, #104]
    4b94:	b9400002 	ldr	w2, [x0]
    4b98:	9104a3fa 	add	x26, sp, #0x128
    4b9c:	910423e3 	add	x3, sp, #0x108
    4ba0:	aa1a03e1 	mov	x1, x26
    4ba4:	aa1303e0 	mov	x0, x19
    4ba8:	940005d2 	bl	62f0 <_wcrtomb_r>
    4bac:	2a0003f7 	mov	w23, w0
    4bb0:	3100041f 	cmn	w0, #0x1
    4bb4:	54009260 	b.eq	5e00 <_vfiprintf_r+0x1780>  // b.none
    4bb8:	7100001f 	cmp	w0, #0x0
    4bbc:	3903bfff 	strb	wzr, [sp, #239]
    4bc0:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    4bc4:	17ffff3f 	b	48c0 <_vfiprintf_r+0x240>
    4bc8:	b94063e1 	ldr	w1, [sp, #96]
    4bcc:	f90037e0 	str	x0, [sp, #104]
    4bd0:	4b0103e1 	neg	w1, w1
    4bd4:	b90063e1 	str	w1, [sp, #96]
    4bd8:	39400280 	ldrb	w0, [x20]
    4bdc:	321e039c 	orr	w28, w28, #0x4
    4be0:	17ffff2e 	b	4898 <_vfiprintf_r+0x218>
    4be4:	aa1403e2 	mov	x2, x20
    4be8:	38401440 	ldrb	w0, [x2], #1
    4bec:	7100a81f 	cmp	w0, #0x2a
    4bf0:	5400a6a0 	b.eq	60c4 <_vfiprintf_r+0x1a44>  // b.none
    4bf4:	5100c001 	sub	w1, w0, #0x30
    4bf8:	aa0203f4 	mov	x20, x2
    4bfc:	52800016 	mov	w22, #0x0                   	// #0
    4c00:	7100243f 	cmp	w1, #0x9
    4c04:	54ffe4c8 	b.hi	489c <_vfiprintf_r+0x21c>  // b.pmore
    4c08:	38401680 	ldrb	w0, [x20], #1
    4c0c:	0b160ac4 	add	w4, w22, w22, lsl #2
    4c10:	0b040436 	add	w22, w1, w4, lsl #1
    4c14:	5100c001 	sub	w1, w0, #0x30
    4c18:	7100243f 	cmp	w1, #0x9
    4c1c:	54ffff69 	b.ls	4c08 <_vfiprintf_r+0x588>  // b.plast
    4c20:	17ffff1f 	b	489c <_vfiprintf_r+0x21c>
    4c24:	52800560 	mov	w0, #0x2b                  	// #43
    4c28:	3903bfe0 	strb	w0, [sp, #239]
    4c2c:	39400280 	ldrb	w0, [x20]
    4c30:	17ffff1a 	b	4898 <_vfiprintf_r+0x218>
    4c34:	b940b3e0 	ldr	w0, [sp, #176]
    4c38:	37f84da0 	tbnz	w0, #31, 55ec <_vfiprintf_r+0xf6c>
    4c3c:	f94037e0 	ldr	x0, [sp, #104]
    4c40:	91002c00 	add	x0, x0, #0xb
    4c44:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4c48:	f94037e1 	ldr	x1, [sp, #104]
    4c4c:	b9400021 	ldr	w1, [x1]
    4c50:	b90063e1 	str	w1, [sp, #96]
    4c54:	37fffba1 	tbnz	w1, #31, 4bc8 <_vfiprintf_r+0x548>
    4c58:	f90037e0 	str	x0, [sp, #104]
    4c5c:	39400280 	ldrb	w0, [x20]
    4c60:	17ffff0e 	b	4898 <_vfiprintf_r+0x218>
    4c64:	2a1603e4 	mov	w4, w22
    4c68:	321c0396 	orr	w22, w28, #0x10
    4c6c:	b940b3e0 	ldr	w0, [sp, #176]
    4c70:	37280056 	tbnz	w22, #5, 4c78 <_vfiprintf_r+0x5f8>
    4c74:	36204876 	tbz	w22, #4, 5580 <_vfiprintf_r+0xf00>
    4c78:	37f85a40 	tbnz	w0, #31, 57c0 <_vfiprintf_r+0x1140>
    4c7c:	f94037e1 	ldr	x1, [sp, #104]
    4c80:	91003c20 	add	x0, x1, #0xf
    4c84:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4c88:	f90037e0 	str	x0, [sp, #104]
    4c8c:	f9400021 	ldr	x1, [x1]
    4c90:	52800020 	mov	w0, #0x1                   	// #1
    4c94:	3903bfff 	strb	wzr, [sp, #239]
    4c98:	3100049f 	cmn	w4, #0x1
    4c9c:	54001320 	b.eq	4f00 <_vfiprintf_r+0x880>  // b.none
    4ca0:	f100003f 	cmp	x1, #0x0
    4ca4:	12187adc 	and	w28, w22, #0xffffff7f
    4ca8:	7a400880 	ccmp	w4, #0x0, #0x0, eq  // eq = none
    4cac:	54001261 	b.ne	4ef8 <_vfiprintf_r+0x878>  // b.any
    4cb0:	35000660 	cbnz	w0, 4d7c <_vfiprintf_r+0x6fc>
    4cb4:	120002d7 	and	w23, w22, #0x1
    4cb8:	36003f56 	tbz	w22, #0, 54a0 <_vfiprintf_r+0xe20>
    4cbc:	91062ffa 	add	x26, sp, #0x18b
    4cc0:	52800600 	mov	w0, #0x30                  	// #48
    4cc4:	52800004 	mov	w4, #0x0                   	// #0
    4cc8:	39062fe0 	strb	w0, [sp, #395]
    4ccc:	d503201f 	nop
    4cd0:	6b17009f 	cmp	w4, w23
    4cd4:	f9003bff 	str	xzr, [sp, #112]
    4cd8:	1a97a096 	csel	w22, w4, w23, ge  // ge = tcont
    4cdc:	3943bfe0 	ldrb	w0, [sp, #239]
    4ce0:	7100001f 	cmp	w0, #0x0
    4ce4:	1a9606d6 	cinc	w22, w22, ne  // ne = any
    4ce8:	17fffef8 	b	48c8 <_vfiprintf_r+0x248>
    4cec:	39400280 	ldrb	w0, [x20]
    4cf0:	3219039c 	orr	w28, w28, #0x80
    4cf4:	17fffee9 	b	4898 <_vfiprintf_r+0x218>
    4cf8:	2a1603e4 	mov	w4, w22
    4cfc:	321c039c 	orr	w28, w28, #0x10
    4d00:	b940b3e0 	ldr	w0, [sp, #176]
    4d04:	3728005c 	tbnz	w28, #5, 4d0c <_vfiprintf_r+0x68c>
    4d08:	362042dc 	tbz	w28, #4, 5560 <_vfiprintf_r+0xee0>
    4d0c:	37f85460 	tbnz	w0, #31, 5798 <_vfiprintf_r+0x1118>
    4d10:	f94037e0 	ldr	x0, [sp, #104]
    4d14:	91003c01 	add	x1, x0, #0xf
    4d18:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d1c:	f90037e1 	str	x1, [sp, #104]
    4d20:	f9400001 	ldr	x1, [x0]
    4d24:	12157b96 	and	w22, w28, #0xfffffbff
    4d28:	52800000 	mov	w0, #0x0                   	// #0
    4d2c:	17ffffda 	b	4c94 <_vfiprintf_r+0x614>
    4d30:	2a1603e4 	mov	w4, w22
    4d34:	321c039c 	orr	w28, w28, #0x10
    4d38:	b940b3e0 	ldr	w0, [sp, #176]
    4d3c:	3728005c 	tbnz	w28, #5, 4d44 <_vfiprintf_r+0x6c4>
    4d40:	36203ffc 	tbz	w28, #4, 553c <_vfiprintf_r+0xebc>
    4d44:	37f85160 	tbnz	w0, #31, 5770 <_vfiprintf_r+0x10f0>
    4d48:	f94037e0 	ldr	x0, [sp, #104]
    4d4c:	91003c01 	add	x1, x0, #0xf
    4d50:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4d54:	f90037e1 	str	x1, [sp, #104]
    4d58:	f9400000 	ldr	x0, [x0]
    4d5c:	aa0003e1 	mov	x1, x0
    4d60:	b7f83b80 	tbnz	x0, #63, 54d0 <_vfiprintf_r+0xe50>
    4d64:	3100049f 	cmn	w4, #0x1
    4d68:	540036e0 	b.eq	5444 <_vfiprintf_r+0xdc4>  // b.none
    4d6c:	7100009f 	cmp	w4, #0x0
    4d70:	12187b9c 	and	w28, w28, #0xffffff7f
    4d74:	fa400820 	ccmp	x1, #0x0, #0x0, eq  // eq = none
    4d78:	54003661 	b.ne	5444 <_vfiprintf_r+0xdc4>  // b.any
    4d7c:	910633fa 	add	x26, sp, #0x18c
    4d80:	52800004 	mov	w4, #0x0                   	// #0
    4d84:	52800017 	mov	w23, #0x0                   	// #0
    4d88:	17ffffd2 	b	4cd0 <_vfiprintf_r+0x650>
    4d8c:	aa1303e0 	mov	x0, x19
    4d90:	94000adc 	bl	7900 <_localeconv_r>
    4d94:	f9400400 	ldr	x0, [x0, #8]
    4d98:	f90053e0 	str	x0, [sp, #160]
    4d9c:	97fffda9 	bl	4440 <strlen>
    4da0:	aa0003e1 	mov	x1, x0
    4da4:	aa0103f7 	mov	x23, x1
    4da8:	aa1303e0 	mov	x0, x19
    4dac:	f90057e1 	str	x1, [sp, #168]
    4db0:	94000ad4 	bl	7900 <_localeconv_r>
    4db4:	f9400800 	ldr	x0, [x0, #16]
    4db8:	f9004fe0 	str	x0, [sp, #152]
    4dbc:	f10002ff 	cmp	x23, #0x0
    4dc0:	fa401804 	ccmp	x0, #0x0, #0x4, ne  // ne = any
    4dc4:	54003b80 	b.eq	5534 <_vfiprintf_r+0xeb4>  // b.none
    4dc8:	39400000 	ldrb	w0, [x0]
    4dcc:	32160381 	orr	w1, w28, #0x400
    4dd0:	7100001f 	cmp	w0, #0x0
    4dd4:	39400280 	ldrb	w0, [x20]
    4dd8:	1a9c103c 	csel	w28, w1, w28, ne  // ne = any
    4ddc:	17fffeaf 	b	4898 <_vfiprintf_r+0x218>
    4de0:	39400280 	ldrb	w0, [x20]
    4de4:	3200039c 	orr	w28, w28, #0x1
    4de8:	17fffeac 	b	4898 <_vfiprintf_r+0x218>
    4dec:	3943bfe1 	ldrb	w1, [sp, #239]
    4df0:	39400280 	ldrb	w0, [x20]
    4df4:	35ffd521 	cbnz	w1, 4898 <_vfiprintf_r+0x218>
    4df8:	52800401 	mov	w1, #0x20                  	// #32
    4dfc:	3903bfe1 	strb	w1, [sp, #239]
    4e00:	17fffea6 	b	4898 <_vfiprintf_r+0x218>
    4e04:	b940b3e0 	ldr	w0, [sp, #176]
    4e08:	372801bc 	tbnz	w28, #5, 4e3c <_vfiprintf_r+0x7bc>
    4e0c:	3720019c 	tbnz	w28, #4, 4e3c <_vfiprintf_r+0x7bc>
    4e10:	37306cfc 	tbnz	w28, #6, 5bac <_vfiprintf_r+0x152c>
    4e14:	364889bc 	tbz	w28, #9, 5f48 <_vfiprintf_r+0x18c8>
    4e18:	37f89040 	tbnz	w0, #31, 6020 <_vfiprintf_r+0x19a0>
    4e1c:	f94037e0 	ldr	x0, [sp, #104]
    4e20:	91003c01 	add	x1, x0, #0xf
    4e24:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4e28:	f90037e1 	str	x1, [sp, #104]
    4e2c:	f9400000 	ldr	x0, [x0]
    4e30:	394193e1 	ldrb	w1, [sp, #100]
    4e34:	39000001 	strb	w1, [x0]
    4e38:	17fffe49 	b	475c <_vfiprintf_r+0xdc>
    4e3c:	37f84180 	tbnz	w0, #31, 566c <_vfiprintf_r+0xfec>
    4e40:	f94037e0 	ldr	x0, [sp, #104]
    4e44:	91003c01 	add	x1, x0, #0xf
    4e48:	927df021 	and	x1, x1, #0xfffffffffffffff8
    4e4c:	f90037e1 	str	x1, [sp, #104]
    4e50:	f9400000 	ldr	x0, [x0]
    4e54:	b98067e1 	ldrsw	x1, [sp, #100]
    4e58:	f9000001 	str	x1, [x0]
    4e5c:	17fffe40 	b	475c <_vfiprintf_r+0xdc>
    4e60:	39400280 	ldrb	w0, [x20]
    4e64:	7101b01f 	cmp	w0, #0x6c
    4e68:	54005960 	b.eq	5994 <_vfiprintf_r+0x1314>  // b.none
    4e6c:	321c039c 	orr	w28, w28, #0x10
    4e70:	17fffe8a 	b	4898 <_vfiprintf_r+0x218>
    4e74:	39400280 	ldrb	w0, [x20]
    4e78:	7101a01f 	cmp	w0, #0x68
    4e7c:	54005840 	b.eq	5984 <_vfiprintf_r+0x1304>  // b.none
    4e80:	321a039c 	orr	w28, w28, #0x40
    4e84:	17fffe85 	b	4898 <_vfiprintf_r+0x218>
    4e88:	39400280 	ldrb	w0, [x20]
    4e8c:	321b039c 	orr	w28, w28, #0x20
    4e90:	17fffe82 	b	4898 <_vfiprintf_r+0x218>
    4e94:	b940b3e0 	ldr	w0, [sp, #176]
    4e98:	2a1603e4 	mov	w4, w22
    4e9c:	37f83ba0 	tbnz	w0, #31, 5610 <_vfiprintf_r+0xf90>
    4ea0:	f94037e2 	ldr	x2, [sp, #104]
    4ea4:	91003c40 	add	x0, x2, #0xf
    4ea8:	927df000 	and	x0, x0, #0xfffffffffffffff8
    4eac:	f90037e0 	str	x0, [sp, #104]
    4eb0:	528f0600 	mov	w0, #0x7830                	// #30768
    4eb4:	90000041 	adrp	x1, c000 <__func__.0+0x28>
    4eb8:	91074021 	add	x1, x1, #0x1d0
    4ebc:	321f0396 	orr	w22, w28, #0x2
    4ec0:	f90047e1 	str	x1, [sp, #136]
    4ec4:	7901e3e0 	strh	w0, [sp, #240]
    4ec8:	52800040 	mov	w0, #0x2                   	// #2
    4ecc:	f9400041 	ldr	x1, [x2]
    4ed0:	17ffff71 	b	4c94 <_vfiprintf_r+0x614>
    4ed4:	910643fb 	add	x27, sp, #0x190
    4ed8:	93407ee0 	sxtw	x0, w23
    4edc:	52800021 	mov	w1, #0x1                   	// #1
    4ee0:	b9011be1 	str	w1, [sp, #280]
    4ee4:	f90093e0 	str	x0, [sp, #288]
    4ee8:	a91903fa 	stp	x26, x0, [sp, #400]
    4eec:	d503201f 	nop
    4ef0:	91004365 	add	x5, x27, #0x10
    4ef4:	17fffebb 	b	49e0 <_vfiprintf_r+0x360>
    4ef8:	2a1c03f6 	mov	w22, w28
    4efc:	d503201f 	nop
    4f00:	7100041f 	cmp	w0, #0x1
    4f04:	54002a20 	b.eq	5448 <_vfiprintf_r+0xdc8>  // b.none
    4f08:	910633f7 	add	x23, sp, #0x18c
    4f0c:	aa1703fa 	mov	x26, x23
    4f10:	7100081f 	cmp	w0, #0x2
    4f14:	54000161 	b.ne	4f40 <_vfiprintf_r+0x8c0>  // b.any
    4f18:	f94047e2 	ldr	x2, [sp, #136]
    4f1c:	d503201f 	nop
    4f20:	92400c20 	and	x0, x1, #0xf
    4f24:	d344fc21 	lsr	x1, x1, #4
    4f28:	38606840 	ldrb	w0, [x2, x0]
    4f2c:	381fff40 	strb	w0, [x26, #-1]!
    4f30:	b5ffff81 	cbnz	x1, 4f20 <_vfiprintf_r+0x8a0>
    4f34:	4b1a02f7 	sub	w23, w23, w26
    4f38:	2a1603fc 	mov	w28, w22
    4f3c:	17ffff65 	b	4cd0 <_vfiprintf_r+0x650>
    4f40:	12000820 	and	w0, w1, #0x7
    4f44:	aa1a03e2 	mov	x2, x26
    4f48:	1100c000 	add	w0, w0, #0x30
    4f4c:	381fff40 	strb	w0, [x26, #-1]!
    4f50:	d343fc21 	lsr	x1, x1, #3
    4f54:	b5ffff61 	cbnz	x1, 4f40 <_vfiprintf_r+0x8c0>
    4f58:	7100c01f 	cmp	w0, #0x30
    4f5c:	1a9f07e0 	cset	w0, ne  // ne = any
    4f60:	6a0002df 	tst	w22, w0
    4f64:	54fffe80 	b.eq	4f34 <_vfiprintf_r+0x8b4>  // b.none
    4f68:	d1000842 	sub	x2, x2, #0x2
    4f6c:	52800600 	mov	w0, #0x30                  	// #48
    4f70:	2a1603fc 	mov	w28, w22
    4f74:	4b0202f7 	sub	w23, w23, w2
    4f78:	381ff340 	sturb	w0, [x26, #-1]
    4f7c:	aa0203fa 	mov	x26, x2
    4f80:	17ffff54 	b	4cd0 <_vfiprintf_r+0x650>
    4f84:	b94063e2 	ldr	w2, [sp, #96]
    4f88:	4b160058 	sub	w24, w2, w22
    4f8c:	7100031f 	cmp	w24, #0x0
    4f90:	54ffd04d 	b.le	4998 <_vfiprintf_r+0x318>
    4f94:	7100431f 	cmp	w24, #0x10
    4f98:	540073cd 	b.le	5e10 <_vfiprintf_r+0x1790>
    4f9c:	2a0103e3 	mov	w3, w1
    4fa0:	90000049 	adrp	x9, c000 <__func__.0+0x28>
    4fa4:	aa1403e1 	mov	x1, x20
    4fa8:	910b4129 	add	x9, x9, #0x2d0
    4fac:	aa1303f4 	mov	x20, x19
    4fb0:	d2800208 	mov	x8, #0x10                  	// #16
    4fb4:	2a1803f3 	mov	w19, w24
    4fb8:	aa0103f8 	mov	x24, x1
    4fbc:	b90093e4 	str	w4, [sp, #144]
    4fc0:	b900b7f6 	str	w22, [sp, #180]
    4fc4:	aa1903f6 	mov	x22, x25
    4fc8:	aa0903f9 	mov	x25, x9
    4fcc:	14000007 	b	4fe8 <_vfiprintf_r+0x968>
    4fd0:	1100086a 	add	w10, w3, #0x2
    4fd4:	9100437b 	add	x27, x27, #0x10
    4fd8:	2a0203e3 	mov	w3, w2
    4fdc:	51004273 	sub	w19, w19, #0x10
    4fe0:	7100427f 	cmp	w19, #0x10
    4fe4:	540002cd 	b.le	503c <_vfiprintf_r+0x9bc>
    4fe8:	91004000 	add	x0, x0, #0x10
    4fec:	11000462 	add	w2, w3, #0x1
    4ff0:	a9002379 	stp	x25, x8, [x27]
    4ff4:	b9011be2 	str	w2, [sp, #280]
    4ff8:	f90093e0 	str	x0, [sp, #288]
    4ffc:	71001c5f 	cmp	w2, #0x7
    5000:	54fffe8d 	b.le	4fd0 <_vfiprintf_r+0x950>
    5004:	b4000d60 	cbz	x0, 51b0 <_vfiprintf_r+0xb30>
    5008:	910443e2 	add	x2, sp, #0x110
    500c:	aa1603e1 	mov	x1, x22
    5010:	aa1403e0 	mov	x0, x20
    5014:	97fffd5b 	bl	4580 <__sprint_r.part.0>
    5018:	35004c60 	cbnz	w0, 59a4 <_vfiprintf_r+0x1324>
    501c:	b9411be3 	ldr	w3, [sp, #280]
    5020:	51004273 	sub	w19, w19, #0x10
    5024:	910643fb 	add	x27, sp, #0x190
    5028:	d2800208 	mov	x8, #0x10                  	// #16
    502c:	1100046a 	add	w10, w3, #0x1
    5030:	f94093e0 	ldr	x0, [sp, #288]
    5034:	7100427f 	cmp	w19, #0x10
    5038:	54fffd8c 	b.gt	4fe8 <_vfiprintf_r+0x968>
    503c:	aa1803e1 	mov	x1, x24
    5040:	aa1903e9 	mov	x9, x25
    5044:	b94093e4 	ldr	w4, [sp, #144]
    5048:	aa1603f9 	mov	x25, x22
    504c:	b940b7f6 	ldr	w22, [sp, #180]
    5050:	2a1303f8 	mov	w24, w19
    5054:	aa1403f3 	mov	x19, x20
    5058:	aa0103f4 	mov	x20, x1
    505c:	93407f01 	sxtw	x1, w24
    5060:	a9000769 	stp	x9, x1, [x27]
    5064:	8b010000 	add	x0, x0, x1
    5068:	b9011bea 	str	w10, [sp, #280]
    506c:	f90093e0 	str	x0, [sp, #288]
    5070:	71001d5f 	cmp	w10, #0x7
    5074:	5400258d 	b.le	5524 <_vfiprintf_r+0xea4>
    5078:	b4005920 	cbz	x0, 5b9c <_vfiprintf_r+0x151c>
    507c:	910443e2 	add	x2, sp, #0x110
    5080:	aa1903e1 	mov	x1, x25
    5084:	aa1303e0 	mov	x0, x19
    5088:	b90093e4 	str	w4, [sp, #144]
    508c:	97fffd3d 	bl	4580 <__sprint_r.part.0>
    5090:	35ffd060 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    5094:	b94093e4 	ldr	w4, [sp, #144]
    5098:	910643fb 	add	x27, sp, #0x190
    509c:	b9411be1 	ldr	w1, [sp, #280]
    50a0:	4b170098 	sub	w24, w4, w23
    50a4:	11000428 	add	w8, w1, #0x1
    50a8:	f94093e0 	ldr	x0, [sp, #288]
    50ac:	7100031f 	cmp	w24, #0x0
    50b0:	54ffc7ad 	b.le	49a4 <_vfiprintf_r+0x324>
    50b4:	d503201f 	nop
    50b8:	f0000029 	adrp	x9, c000 <__func__.0+0x28>
    50bc:	910b4129 	add	x9, x9, #0x2d0
    50c0:	7100431f 	cmp	w24, #0x10
    50c4:	540004ed 	b.le	5160 <_vfiprintf_r+0xae0>
    50c8:	2a0103e3 	mov	w3, w1
    50cc:	d2800204 	mov	x4, #0x10                  	// #16
    50d0:	f9004bf4 	str	x20, [sp, #144]
    50d4:	aa1903f4 	mov	x20, x25
    50d8:	aa1303f9 	mov	x25, x19
    50dc:	aa0903f3 	mov	x19, x9
    50e0:	14000007 	b	50fc <_vfiprintf_r+0xa7c>
    50e4:	11000868 	add	w8, w3, #0x2
    50e8:	9100437b 	add	x27, x27, #0x10
    50ec:	2a0203e3 	mov	w3, w2
    50f0:	51004318 	sub	w24, w24, #0x10
    50f4:	7100431f 	cmp	w24, #0x10
    50f8:	540002cd 	b.le	5150 <_vfiprintf_r+0xad0>
    50fc:	91004000 	add	x0, x0, #0x10
    5100:	11000462 	add	w2, w3, #0x1
    5104:	a9001373 	stp	x19, x4, [x27]
    5108:	b9011be2 	str	w2, [sp, #280]
    510c:	f90093e0 	str	x0, [sp, #288]
    5110:	71001c5f 	cmp	w2, #0x7
    5114:	54fffe8d 	b.le	50e4 <_vfiprintf_r+0xa64>
    5118:	b4000380 	cbz	x0, 5188 <_vfiprintf_r+0xb08>
    511c:	910443e2 	add	x2, sp, #0x110
    5120:	aa1403e1 	mov	x1, x20
    5124:	aa1903e0 	mov	x0, x25
    5128:	97fffd16 	bl	4580 <__sprint_r.part.0>
    512c:	35ffcb40 	cbnz	w0, 4a94 <_vfiprintf_r+0x414>
    5130:	b9411be3 	ldr	w3, [sp, #280]
    5134:	51004318 	sub	w24, w24, #0x10
    5138:	910643fb 	add	x27, sp, #0x190
    513c:	d2800204 	mov	x4, #0x10                  	// #16
    5140:	11000468 	add	w8, w3, #0x1
    5144:	f94093e0 	ldr	x0, [sp, #288]
    5148:	7100431f 	cmp	w24, #0x10
    514c:	54fffd8c 	b.gt	50fc <_vfiprintf_r+0xa7c>
    5150:	aa1303e9 	mov	x9, x19
    5154:	aa1903f3 	mov	x19, x25
    5158:	aa1403f9 	mov	x25, x20
    515c:	f9404bf4 	ldr	x20, [sp, #144]
    5160:	93407f18 	sxtw	x24, w24
    5164:	8b180000 	add	x0, x0, x24
    5168:	a9006369 	stp	x9, x24, [x27]
    516c:	b9011be8 	str	w8, [sp, #280]
    5170:	f90093e0 	str	x0, [sp, #288]
    5174:	71001d1f 	cmp	w8, #0x7
    5178:	5400178c 	b.gt	5468 <_vfiprintf_r+0xde8>
    517c:	9100437b 	add	x27, x27, #0x10
    5180:	11000508 	add	w8, w8, #0x1
    5184:	17fffe08 	b	49a4 <_vfiprintf_r+0x324>
    5188:	910643fb 	add	x27, sp, #0x190
    518c:	52800028 	mov	w8, #0x1                   	// #1
    5190:	52800003 	mov	w3, #0x0                   	// #0
    5194:	17ffffd7 	b	50f0 <_vfiprintf_r+0xa70>
    5198:	910443e2 	add	x2, sp, #0x110
    519c:	aa1903e1 	mov	x1, x25
    51a0:	aa1303e0 	mov	x0, x19
    51a4:	97fffcf7 	bl	4580 <__sprint_r.part.0>
    51a8:	34ffc340 	cbz	w0, 4a10 <_vfiprintf_r+0x390>
    51ac:	17fffe3c 	b	4a9c <_vfiprintf_r+0x41c>
    51b0:	910643fb 	add	x27, sp, #0x190
    51b4:	5280002a 	mov	w10, #0x1                   	// #1
    51b8:	52800003 	mov	w3, #0x0                   	// #0
    51bc:	17ffff88 	b	4fdc <_vfiprintf_r+0x95c>
    51c0:	b4001760 	cbz	x0, 54ac <_vfiprintf_r+0xe2c>
    51c4:	910443e2 	add	x2, sp, #0x110
    51c8:	aa1903e1 	mov	x1, x25
    51cc:	aa1303e0 	mov	x0, x19
    51d0:	b90093ea 	str	w10, [sp, #144]
    51d4:	b900b7e4 	str	w4, [sp, #180]
    51d8:	97fffcea 	bl	4580 <__sprint_r.part.0>
    51dc:	35ffc600 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    51e0:	b9411be1 	ldr	w1, [sp, #280]
    51e4:	910643fb 	add	x27, sp, #0x190
    51e8:	b94093ea 	ldr	w10, [sp, #144]
    51ec:	b940b7e4 	ldr	w4, [sp, #180]
    51f0:	11000428 	add	w8, w1, #0x1
    51f4:	f94093e0 	ldr	x0, [sp, #288]
    51f8:	17fffdd0 	b	4938 <_vfiprintf_r+0x2b8>
    51fc:	9103c3e0 	add	x0, sp, #0xf0
    5200:	d2800041 	mov	x1, #0x2                   	// #2
    5204:	910643fb 	add	x27, sp, #0x190
    5208:	a91907e0 	stp	x0, x1, [sp, #400]
    520c:	aa0103e0 	mov	x0, x1
    5210:	52800028 	mov	w8, #0x1                   	// #1
    5214:	d503201f 	nop
    5218:	2a0803e1 	mov	w1, w8
    521c:	9100437b 	add	x27, x27, #0x10
    5220:	11000428 	add	w8, w1, #0x1
    5224:	17fffddb 	b	4990 <_vfiprintf_r+0x310>
    5228:	7100413f 	cmp	w9, #0x10
    522c:	54005c4d 	b.le	5db4 <_vfiprintf_r+0x1734>
    5230:	f0000028 	adrp	x8, c000 <__func__.0+0x28>
    5234:	910b0108 	add	x8, x8, #0x2c0
    5238:	aa1b03e3 	mov	x3, x27
    523c:	d280020c 	mov	x12, #0x10                  	// #16
    5240:	2a1703fb 	mov	w27, w23
    5244:	2a1603f7 	mov	w23, w22
    5248:	aa0803f6 	mov	x22, x8
    524c:	b90093ea 	str	w10, [sp, #144]
    5250:	b900b7e4 	str	w4, [sp, #180]
    5254:	2a0103e4 	mov	w4, w1
    5258:	f9005ff4 	str	x20, [sp, #184]
    525c:	aa1903f4 	mov	x20, x25
    5260:	2a0903f9 	mov	w25, w9
    5264:	14000008 	b	5284 <_vfiprintf_r+0xc04>
    5268:	1100088b 	add	w11, w4, #0x2
    526c:	91004063 	add	x3, x3, #0x10
    5270:	2a0203e4 	mov	w4, w2
    5274:	51004339 	sub	w25, w25, #0x10
    5278:	7100433f 	cmp	w25, #0x10
    527c:	540002cd 	b.le	52d4 <_vfiprintf_r+0xc54>
    5280:	11000482 	add	w2, w4, #0x1
    5284:	91004000 	add	x0, x0, #0x10
    5288:	a9003076 	stp	x22, x12, [x3]
    528c:	b9011be2 	str	w2, [sp, #280]
    5290:	f90093e0 	str	x0, [sp, #288]
    5294:	71001c5f 	cmp	w2, #0x7
    5298:	54fffe8d 	b.le	5268 <_vfiprintf_r+0xbe8>
    529c:	b4000440 	cbz	x0, 5324 <_vfiprintf_r+0xca4>
    52a0:	910443e2 	add	x2, sp, #0x110
    52a4:	aa1403e1 	mov	x1, x20
    52a8:	aa1303e0 	mov	x0, x19
    52ac:	97fffcb5 	bl	4580 <__sprint_r.part.0>
    52b0:	35ffbf40 	cbnz	w0, 4a98 <_vfiprintf_r+0x418>
    52b4:	b9411be4 	ldr	w4, [sp, #280]
    52b8:	51004339 	sub	w25, w25, #0x10
    52bc:	910643e3 	add	x3, sp, #0x190
    52c0:	d280020c 	mov	x12, #0x10                  	// #16
    52c4:	1100048b 	add	w11, w4, #0x1
    52c8:	f94093e0 	ldr	x0, [sp, #288]
    52cc:	7100433f 	cmp	w25, #0x10
    52d0:	54fffd8c 	b.gt	5280 <_vfiprintf_r+0xc00>
    52d4:	2a1903e9 	mov	w9, w25
    52d8:	b94093ea 	ldr	w10, [sp, #144]
    52dc:	aa1403f9 	mov	x25, x20
    52e0:	b940b7e4 	ldr	w4, [sp, #180]
    52e4:	f9405ff4 	ldr	x20, [sp, #184]
    52e8:	aa1603e8 	mov	x8, x22
    52ec:	2a1703f6 	mov	w22, w23
    52f0:	2a1b03f7 	mov	w23, w27
    52f4:	aa0303fb 	mov	x27, x3
    52f8:	93407d21 	sxtw	x1, w9
    52fc:	a9000768 	stp	x8, x1, [x27]
    5300:	8b010000 	add	x0, x0, x1
    5304:	b9011beb 	str	w11, [sp, #280]
    5308:	f90093e0 	str	x0, [sp, #288]
    530c:	71001d7f 	cmp	w11, #0x7
    5310:	54000ecc 	b.gt	54e8 <_vfiprintf_r+0xe68>
    5314:	9100437b 	add	x27, x27, #0x10
    5318:	11000568 	add	w8, w11, #0x1
    531c:	2a0b03e1 	mov	w1, w11
    5320:	17fffd78 	b	4900 <_vfiprintf_r+0x280>
    5324:	910643e3 	add	x3, sp, #0x190
    5328:	52800004 	mov	w4, #0x0                   	// #0
    532c:	5280002b 	mov	w11, #0x1                   	// #1
    5330:	17ffffd1 	b	5274 <_vfiprintf_r+0xbf4>
    5334:	b9011bff 	str	wzr, [sp, #280]
    5338:	3610079c 	tbz	w28, #2, 5428 <_vfiprintf_r+0xda8>
    533c:	b94063e1 	ldr	w1, [sp, #96]
    5340:	4b160037 	sub	w23, w1, w22
    5344:	710002ff 	cmp	w23, #0x0
    5348:	5400070d 	b.le	5428 <_vfiprintf_r+0xda8>
    534c:	910643e5 	add	x5, sp, #0x190
    5350:	b9411be2 	ldr	w2, [sp, #280]
    5354:	710042ff 	cmp	w23, #0x10
    5358:	5400546d 	b.le	5de4 <_vfiprintf_r+0x1764>
    535c:	f0000028 	adrp	x8, c000 <__func__.0+0x28>
    5360:	910b0108 	add	x8, x8, #0x2c0
    5364:	aa0803fa 	mov	x26, x8
    5368:	d2800218 	mov	x24, #0x10                  	// #16
    536c:	14000007 	b	5388 <_vfiprintf_r+0xd08>
    5370:	11000844 	add	w4, w2, #0x2
    5374:	910040a5 	add	x5, x5, #0x10
    5378:	2a0303e2 	mov	w2, w3
    537c:	510042f7 	sub	w23, w23, #0x10
    5380:	710042ff 	cmp	w23, #0x10
    5384:	540002ad 	b.le	53d8 <_vfiprintf_r+0xd58>
    5388:	91004000 	add	x0, x0, #0x10
    538c:	11000443 	add	w3, w2, #0x1
    5390:	a90060ba 	stp	x26, x24, [x5]
    5394:	b9011be3 	str	w3, [sp, #280]
    5398:	f90093e0 	str	x0, [sp, #288]
    539c:	71001c7f 	cmp	w3, #0x7
    53a0:	54fffe8d 	b.le	5370 <_vfiprintf_r+0xcf0>
    53a4:	b40003a0 	cbz	x0, 5418 <_vfiprintf_r+0xd98>
    53a8:	910443e2 	add	x2, sp, #0x110
    53ac:	aa1903e1 	mov	x1, x25
    53b0:	aa1303e0 	mov	x0, x19
    53b4:	97fffc73 	bl	4580 <__sprint_r.part.0>
    53b8:	35ffb720 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    53bc:	b9411be2 	ldr	w2, [sp, #280]
    53c0:	510042f7 	sub	w23, w23, #0x10
    53c4:	910643e5 	add	x5, sp, #0x190
    53c8:	11000444 	add	w4, w2, #0x1
    53cc:	f94093e0 	ldr	x0, [sp, #288]
    53d0:	710042ff 	cmp	w23, #0x10
    53d4:	54fffdac 	b.gt	5388 <_vfiprintf_r+0xd08>
    53d8:	aa1a03e8 	mov	x8, x26
    53dc:	93407ef7 	sxtw	x23, w23
    53e0:	a9005ca8 	stp	x8, x23, [x5]
    53e4:	8b170000 	add	x0, x0, x23
    53e8:	b9011be4 	str	w4, [sp, #280]
    53ec:	f90093e0 	str	x0, [sp, #288]
    53f0:	71001c9f 	cmp	w4, #0x7
    53f4:	54ffb00d 	b.le	49f4 <_vfiprintf_r+0x374>
    53f8:	b4000180 	cbz	x0, 5428 <_vfiprintf_r+0xda8>
    53fc:	910443e2 	add	x2, sp, #0x110
    5400:	aa1903e1 	mov	x1, x25
    5404:	aa1303e0 	mov	x0, x19
    5408:	97fffc5e 	bl	4580 <__sprint_r.part.0>
    540c:	35ffb480 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    5410:	f94093e0 	ldr	x0, [sp, #288]
    5414:	17fffd78 	b	49f4 <_vfiprintf_r+0x374>
    5418:	910643e5 	add	x5, sp, #0x190
    541c:	52800024 	mov	w4, #0x1                   	// #1
    5420:	52800002 	mov	w2, #0x0                   	// #0
    5424:	17ffffd6 	b	537c <_vfiprintf_r+0xcfc>
    5428:	b94063e0 	ldr	w0, [sp, #96]
    542c:	6b16001f 	cmp	w0, w22
    5430:	1a96a003 	csel	w3, w0, w22, ge  // ge = tcont
    5434:	b94067e0 	ldr	w0, [sp, #100]
    5438:	0b030000 	add	w0, w0, w3
    543c:	b90067e0 	str	w0, [sp, #100]
    5440:	17fffd74 	b	4a10 <_vfiprintf_r+0x390>
    5444:	2a1c03f6 	mov	w22, w28
    5448:	f100243f 	cmp	x1, #0x9
    544c:	540024c8 	b.hi	58e4 <_vfiprintf_r+0x1264>  // b.pmore
    5450:	1100c021 	add	w1, w1, #0x30
    5454:	2a1603fc 	mov	w28, w22
    5458:	91062ffa 	add	x26, sp, #0x18b
    545c:	52800037 	mov	w23, #0x1                   	// #1
    5460:	39062fe1 	strb	w1, [sp, #395]
    5464:	17fffe1b 	b	4cd0 <_vfiprintf_r+0x650>
    5468:	b4ffd360 	cbz	x0, 4ed4 <_vfiprintf_r+0x854>
    546c:	910443e2 	add	x2, sp, #0x110
    5470:	aa1903e1 	mov	x1, x25
    5474:	aa1303e0 	mov	x0, x19
    5478:	97fffc42 	bl	4580 <__sprint_r.part.0>
    547c:	35ffb100 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    5480:	b9411be8 	ldr	w8, [sp, #280]
    5484:	910643fb 	add	x27, sp, #0x190
    5488:	f94093e0 	ldr	x0, [sp, #288]
    548c:	11000508 	add	w8, w8, #0x1
    5490:	17fffd45 	b	49a4 <_vfiprintf_r+0x324>
    5494:	910643fb 	add	x27, sp, #0x190
    5498:	b9011bff 	str	wzr, [sp, #280]
    549c:	17fffcf4 	b	486c <_vfiprintf_r+0x1ec>
    54a0:	910633fa 	add	x26, sp, #0x18c
    54a4:	52800004 	mov	w4, #0x0                   	// #0
    54a8:	17fffe0a 	b	4cd0 <_vfiprintf_r+0x650>
    54ac:	350007ca 	cbnz	w10, 55a4 <_vfiprintf_r+0xf24>
    54b0:	910643fb 	add	x27, sp, #0x190
    54b4:	52800001 	mov	w1, #0x0                   	// #0
    54b8:	52800028 	mov	w8, #0x1                   	// #1
    54bc:	17fffd35 	b	4990 <_vfiprintf_r+0x310>
    54c0:	910643fb 	add	x27, sp, #0x190
    54c4:	52800028 	mov	w8, #0x1                   	// #1
    54c8:	52800001 	mov	w1, #0x0                   	// #0
    54cc:	17fffd31 	b	4990 <_vfiprintf_r+0x310>
    54d0:	528005a0 	mov	w0, #0x2d                  	// #45
    54d4:	cb0103e1 	neg	x1, x1
    54d8:	2a1c03f6 	mov	w22, w28
    54dc:	3903bfe0 	strb	w0, [sp, #239]
    54e0:	52800020 	mov	w0, #0x1                   	// #1
    54e4:	17fffded 	b	4c98 <_vfiprintf_r+0x618>
    54e8:	b4000d60 	cbz	x0, 5694 <_vfiprintf_r+0x1014>
    54ec:	910443e2 	add	x2, sp, #0x110
    54f0:	aa1903e1 	mov	x1, x25
    54f4:	aa1303e0 	mov	x0, x19
    54f8:	b90093ea 	str	w10, [sp, #144]
    54fc:	b900b7e4 	str	w4, [sp, #180]
    5500:	97fffc20 	bl	4580 <__sprint_r.part.0>
    5504:	35ffacc0 	cbnz	w0, 4a9c <_vfiprintf_r+0x41c>
    5508:	b9411be1 	ldr	w1, [sp, #280]
    550c:	910643fb 	add	x27, sp, #0x190
    5510:	b94093ea 	ldr	w10, [sp, #144]
    5514:	b940b7e4 	ldr	w4, [sp, #180]
    5518:	11000428 	add	w8, w1, #0x1
    551c:	f94093e0 	ldr	x0, [sp, #288]
    5520:	17fffcf8 	b	4900 <_vfiprintf_r+0x280>
    5524:	9100437b 	add	x27, x27, #0x10
    5528:	11000548 	add	w8, w10, #0x1
    552c:	2a0a03e1 	mov	w1, w10
    5530:	17fffd1a 	b	4998 <_vfiprintf_r+0x318>
    5534:	39400280 	ldrb	w0, [x20]
    5538:	17fffcd8 	b	4898 <_vfiprintf_r+0x218>
    553c:	36302a9c 	tbz	w28, #6, 5a8c <_vfiprintf_r+0x140c>
    5540:	37f83d20 	tbnz	w0, #31, 5ce4 <_vfiprintf_r+0x1664>
    5544:	f94037e0 	ldr	x0, [sp, #104]
    5548:	91002c01 	add	x1, x0, #0xb
    554c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5550:	f90037e1 	str	x1, [sp, #104]
    5554:	79800001 	ldrsh	x1, [x0]
    5558:	aa0103e0 	mov	x0, x1
    555c:	17fffe01 	b	4d60 <_vfiprintf_r+0x6e0>
    5560:	3630247c 	tbz	w28, #6, 59ec <_vfiprintf_r+0x136c>
    5564:	37f83960 	tbnz	w0, #31, 5c90 <_vfiprintf_r+0x1610>
    5568:	f94037e0 	ldr	x0, [sp, #104]
    556c:	91002c01 	add	x1, x0, #0xb
    5570:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5574:	f90037e1 	str	x1, [sp, #104]
    5578:	79400001 	ldrh	w1, [x0]
    557c:	17fffdea 	b	4d24 <_vfiprintf_r+0x6a4>
    5580:	36302476 	tbz	w22, #6, 5a0c <_vfiprintf_r+0x138c>
    5584:	37f839c0 	tbnz	w0, #31, 5cbc <_vfiprintf_r+0x163c>
    5588:	f94037e0 	ldr	x0, [sp, #104]
    558c:	91002c01 	add	x1, x0, #0xb
    5590:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5594:	f90037e1 	str	x1, [sp, #104]
    5598:	79400001 	ldrh	w1, [x0]
    559c:	52800020 	mov	w0, #0x1                   	// #1
    55a0:	17fffdbd 	b	4c94 <_vfiprintf_r+0x614>
    55a4:	9103c3e0 	add	x0, sp, #0xf0
    55a8:	d2800042 	mov	x2, #0x2                   	// #2
    55ac:	910643fb 	add	x27, sp, #0x190
    55b0:	52800021 	mov	w1, #0x1                   	// #1
    55b4:	a9190be0 	stp	x0, x2, [sp, #400]
    55b8:	aa0203e0 	mov	x0, x2
    55bc:	17ffff18 	b	521c <_vfiprintf_r+0xb9c>
    55c0:	2a1603e4 	mov	w4, w22
    55c4:	17fffddd 	b	4d38 <_vfiprintf_r+0x6b8>
    55c8:	b940b3e1 	ldr	w1, [sp, #176]
    55cc:	11002021 	add	w1, w1, #0x8
    55d0:	7100003f 	cmp	w1, #0x0
    55d4:	54002d6d 	b.le	5b80 <_vfiprintf_r+0x1500>
    55d8:	f94037e2 	ldr	x2, [sp, #104]
    55dc:	b900b3e1 	str	w1, [sp, #176]
    55e0:	91003c58 	add	x24, x2, #0xf
    55e4:	927df318 	and	x24, x24, #0xfffffffffffffff8
    55e8:	17fffd46 	b	4b00 <_vfiprintf_r+0x480>
    55ec:	b940b3e0 	ldr	w0, [sp, #176]
    55f0:	11002001 	add	w1, w0, #0x8
    55f4:	7100003f 	cmp	w1, #0x0
    55f8:	54002a2d 	b.le	5b3c <_vfiprintf_r+0x14bc>
    55fc:	f94037e0 	ldr	x0, [sp, #104]
    5600:	b900b3e1 	str	w1, [sp, #176]
    5604:	91002c00 	add	x0, x0, #0xb
    5608:	927df000 	and	x0, x0, #0xfffffffffffffff8
    560c:	17fffd8f 	b	4c48 <_vfiprintf_r+0x5c8>
    5610:	b940b3e0 	ldr	w0, [sp, #176]
    5614:	11002000 	add	w0, w0, #0x8
    5618:	7100001f 	cmp	w0, #0x0
    561c:	5400286d 	b.le	5b28 <_vfiprintf_r+0x14a8>
    5620:	f94037e2 	ldr	x2, [sp, #104]
    5624:	b900b3e0 	str	w0, [sp, #176]
    5628:	91003c41 	add	x1, x2, #0xf
    562c:	927df020 	and	x0, x1, #0xfffffffffffffff8
    5630:	f90037e0 	str	x0, [sp, #104]
    5634:	17fffe1f 	b	4eb0 <_vfiprintf_r+0x830>
    5638:	b940b3e0 	ldr	w0, [sp, #176]
    563c:	37f828e0 	tbnz	w0, #31, 5b58 <_vfiprintf_r+0x14d8>
    5640:	f94037e0 	ldr	x0, [sp, #104]
    5644:	91002c01 	add	x1, x0, #0xb
    5648:	927df021 	and	x1, x1, #0xfffffffffffffff8
    564c:	f90037e1 	str	x1, [sp, #104]
    5650:	b9400000 	ldr	w0, [x0]
    5654:	52800036 	mov	w22, #0x1                   	// #1
    5658:	9104a3fa 	add	x26, sp, #0x128
    565c:	2a1603f7 	mov	w23, w22
    5660:	3903bfff 	strb	wzr, [sp, #239]
    5664:	3904a3e0 	strb	w0, [sp, #296]
    5668:	17fffc96 	b	48c0 <_vfiprintf_r+0x240>
    566c:	b940b3e0 	ldr	w0, [sp, #176]
    5670:	11002001 	add	w1, w0, #0x8
    5674:	7100003f 	cmp	w1, #0x0
    5678:	5400394d 	b.le	5da0 <_vfiprintf_r+0x1720>
    567c:	f94037e0 	ldr	x0, [sp, #104]
    5680:	b900b3e1 	str	w1, [sp, #176]
    5684:	91003c02 	add	x2, x0, #0xf
    5688:	927df041 	and	x1, x2, #0xfffffffffffffff8
    568c:	f90037e1 	str	x1, [sp, #104]
    5690:	17fffdf0 	b	4e50 <_vfiprintf_r+0x7d0>
    5694:	3943bfe1 	ldrb	w1, [sp, #239]
    5698:	35002d81 	cbnz	w1, 5c48 <_vfiprintf_r+0x15c8>
    569c:	35ffdb0a 	cbnz	w10, 51fc <_vfiprintf_r+0xb7c>
    56a0:	910643fb 	add	x27, sp, #0x190
    56a4:	52800001 	mov	w1, #0x0                   	// #0
    56a8:	52800028 	mov	w8, #0x1                   	// #1
    56ac:	17fffcbb 	b	4998 <_vfiprintf_r+0x318>
    56b0:	2a1603e4 	mov	w4, w22
    56b4:	2a1c03f6 	mov	w22, w28
    56b8:	17fffd6d 	b	4c6c <_vfiprintf_r+0x5ec>
    56bc:	2a1603e4 	mov	w4, w22
    56c0:	f0000021 	adrp	x1, c000 <__func__.0+0x28>
    56c4:	91074021 	add	x1, x1, #0x1d0
    56c8:	f90047e1 	str	x1, [sp, #136]
    56cc:	b940b3e1 	ldr	w1, [sp, #176]
    56d0:	3728023c 	tbnz	w28, #5, 5714 <_vfiprintf_r+0x1094>
    56d4:	3720021c 	tbnz	w28, #4, 5714 <_vfiprintf_r+0x1094>
    56d8:	36301b7c 	tbz	w28, #6, 5a44 <_vfiprintf_r+0x13c4>
    56dc:	37f82c41 	tbnz	w1, #31, 5c64 <_vfiprintf_r+0x15e4>
    56e0:	f94037e1 	ldr	x1, [sp, #104]
    56e4:	91002c22 	add	x2, x1, #0xb
    56e8:	927df042 	and	x2, x2, #0xfffffffffffffff8
    56ec:	79400021 	ldrh	w1, [x1]
    56f0:	f90037e2 	str	x2, [sp, #104]
    56f4:	1400000e 	b	572c <_vfiprintf_r+0x10ac>
    56f8:	f0000021 	adrp	x1, c000 <__func__.0+0x28>
    56fc:	2a1603e4 	mov	w4, w22
    5700:	9107a021 	add	x1, x1, #0x1e8
    5704:	f90047e1 	str	x1, [sp, #136]
    5708:	17fffff1 	b	56cc <_vfiprintf_r+0x104c>
    570c:	2a1603e4 	mov	w4, w22
    5710:	17fffd7c 	b	4d00 <_vfiprintf_r+0x680>
    5714:	37f801a1 	tbnz	w1, #31, 5748 <_vfiprintf_r+0x10c8>
    5718:	f94037e1 	ldr	x1, [sp, #104]
    571c:	91003c22 	add	x2, x1, #0xf
    5720:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5724:	f90037e2 	str	x2, [sp, #104]
    5728:	f9400021 	ldr	x1, [x1]
    572c:	f100003f 	cmp	x1, #0x0
    5730:	1a9f07e2 	cset	w2, ne  // ne = any
    5734:	6a02039f 	tst	w28, w2
    5738:	54000581 	b.ne	57e8 <_vfiprintf_r+0x1168>  // b.any
    573c:	12157b96 	and	w22, w28, #0xfffffbff
    5740:	52800040 	mov	w0, #0x2                   	// #2
    5744:	17fffd54 	b	4c94 <_vfiprintf_r+0x614>
    5748:	b940b3e1 	ldr	w1, [sp, #176]
    574c:	11002022 	add	w2, w1, #0x8
    5750:	7100005f 	cmp	w2, #0x0
    5754:	540016ed 	b.le	5a30 <_vfiprintf_r+0x13b0>
    5758:	f94037e1 	ldr	x1, [sp, #104]
    575c:	b900b3e2 	str	w2, [sp, #176]
    5760:	91003c23 	add	x3, x1, #0xf
    5764:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5768:	f90037e2 	str	x2, [sp, #104]
    576c:	17ffffef 	b	5728 <_vfiprintf_r+0x10a8>
    5770:	b940b3e0 	ldr	w0, [sp, #176]
    5774:	11002001 	add	w1, w0, #0x8
    5778:	7100003f 	cmp	w1, #0x0
    577c:	540017ed 	b.le	5a78 <_vfiprintf_r+0x13f8>
    5780:	f94037e0 	ldr	x0, [sp, #104]
    5784:	b900b3e1 	str	w1, [sp, #176]
    5788:	91003c02 	add	x2, x0, #0xf
    578c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5790:	f90037e1 	str	x1, [sp, #104]
    5794:	17fffd71 	b	4d58 <_vfiprintf_r+0x6d8>
    5798:	b940b3e0 	ldr	w0, [sp, #176]
    579c:	11002001 	add	w1, w0, #0x8
    57a0:	7100003f 	cmp	w1, #0x0
    57a4:	5400186d 	b.le	5ab0 <_vfiprintf_r+0x1430>
    57a8:	f94037e0 	ldr	x0, [sp, #104]
    57ac:	b900b3e1 	str	w1, [sp, #176]
    57b0:	91003c02 	add	x2, x0, #0xf
    57b4:	927df041 	and	x1, x2, #0xfffffffffffffff8
    57b8:	f90037e1 	str	x1, [sp, #104]
    57bc:	17fffd59 	b	4d20 <_vfiprintf_r+0x6a0>
    57c0:	b940b3e0 	ldr	w0, [sp, #176]
    57c4:	11002000 	add	w0, w0, #0x8
    57c8:	7100001f 	cmp	w0, #0x0
    57cc:	540014cd 	b.le	5a64 <_vfiprintf_r+0x13e4>
    57d0:	f94037e1 	ldr	x1, [sp, #104]
    57d4:	b900b3e0 	str	w0, [sp, #176]
    57d8:	91003c22 	add	x2, x1, #0xf
    57dc:	927df040 	and	x0, x2, #0xfffffffffffffff8
    57e0:	f90037e0 	str	x0, [sp, #104]
    57e4:	17fffd2a 	b	4c8c <_vfiprintf_r+0x60c>
    57e8:	321f039c 	orr	w28, w28, #0x2
    57ec:	3903c7e0 	strb	w0, [sp, #241]
    57f0:	52800600 	mov	w0, #0x30                  	// #48
    57f4:	3903c3e0 	strb	w0, [sp, #240]
    57f8:	17ffffd1 	b	573c <_vfiprintf_r+0x10bc>
    57fc:	910403e0 	add	x0, sp, #0x100
    5800:	d2800102 	mov	x2, #0x8                   	// #8
    5804:	52800001 	mov	w1, #0x0                   	// #0
    5808:	b9006be4 	str	w4, [sp, #104]
    580c:	f90087fa 	str	x26, [sp, #264]
    5810:	97fffa8c 	bl	4240 <memset>
    5814:	b9406be4 	ldr	w4, [sp, #104]
    5818:	3100049f 	cmn	w4, #0x1
    581c:	54001680 	b.eq	5aec <_vfiprintf_r+0x146c>  // b.none
    5820:	d2800016 	mov	x22, #0x0                   	// #0
    5824:	52800017 	mov	w23, #0x0                   	// #0
    5828:	aa1603e0 	mov	x0, x22
    582c:	2a1703f6 	mov	w22, w23
    5830:	aa0003f7 	mov	x23, x0
    5834:	f90037f4 	str	x20, [sp, #104]
    5838:	2a0403f4 	mov	w20, w4
    583c:	1400000d 	b	5870 <_vfiprintf_r+0x11f0>
    5840:	910403e3 	add	x3, sp, #0x100
    5844:	9104a3e1 	add	x1, sp, #0x128
    5848:	aa1303e0 	mov	x0, x19
    584c:	940002a9 	bl	62f0 <_wcrtomb_r>
    5850:	3100041f 	cmn	w0, #0x1
    5854:	54002d60 	b.eq	5e00 <_vfiprintf_r+0x1780>  // b.none
    5858:	0b0002c0 	add	w0, w22, w0
    585c:	6b14001f 	cmp	w0, w20
    5860:	540000ec 	b.gt	587c <_vfiprintf_r+0x11fc>
    5864:	910012f7 	add	x23, x23, #0x4
    5868:	54003820 	b.eq	5f6c <_vfiprintf_r+0x18ec>  // b.none
    586c:	2a0003f6 	mov	w22, w0
    5870:	f94087e0 	ldr	x0, [sp, #264]
    5874:	b8776802 	ldr	w2, [x0, x23]
    5878:	35fffe42 	cbnz	w2, 5840 <_vfiprintf_r+0x11c0>
    587c:	f94037f4 	ldr	x20, [sp, #104]
    5880:	2a1603f7 	mov	w23, w22
    5884:	340014b7 	cbz	w23, 5b18 <_vfiprintf_r+0x1498>
    5888:	71018eff 	cmp	w23, #0x63
    588c:	540024ac 	b.gt	5d20 <_vfiprintf_r+0x16a0>
    5890:	9104a3fa 	add	x26, sp, #0x128
    5894:	f9003bff 	str	xzr, [sp, #112]
    5898:	93407ef6 	sxtw	x22, w23
    589c:	d2800102 	mov	x2, #0x8                   	// #8
    58a0:	52800001 	mov	w1, #0x0                   	// #0
    58a4:	910403e0 	add	x0, sp, #0x100
    58a8:	97fffa66 	bl	4240 <memset>
    58ac:	910403e4 	add	x4, sp, #0x100
    58b0:	aa1603e3 	mov	x3, x22
    58b4:	910423e2 	add	x2, sp, #0x108
    58b8:	aa1a03e1 	mov	x1, x26
    58bc:	aa1303e0 	mov	x0, x19
    58c0:	940002d8 	bl	6420 <_wcsrtombs_r>
    58c4:	eb0002df 	cmp	x22, x0
    58c8:	54004761 	b.ne	61b4 <_vfiprintf_r+0x1b34>  // b.any
    58cc:	710002ff 	cmp	w23, #0x0
    58d0:	52800004 	mov	w4, #0x0                   	// #0
    58d4:	1a9fa2f6 	csel	w22, w23, wzr, ge  // ge = tcont
    58d8:	3837cb5f 	strb	wzr, [x26, w23, sxtw]
    58dc:	f90037f8 	str	x24, [sp, #104]
    58e0:	17fffcff 	b	4cdc <_vfiprintf_r+0x65c>
    58e4:	910633f7 	add	x23, sp, #0x18c
    58e8:	121602c6 	and	w6, w22, #0x400
    58ec:	b202e7fc 	mov	x28, #0xcccccccccccccccc    	// #-3689348814741910324
    58f0:	aa1703e2 	mov	x2, x23
    58f4:	aa1403e3 	mov	x3, x20
    58f8:	aa1703e5 	mov	x5, x23
    58fc:	52800008 	mov	w8, #0x0                   	// #0
    5900:	aa1303f7 	mov	x23, x19
    5904:	f29999bc 	movk	x28, #0xcccd
    5908:	2a0603f3 	mov	w19, w6
    590c:	f9404ff4 	ldr	x20, [sp, #152]
    5910:	14000007 	b	592c <_vfiprintf_r+0x12ac>
    5914:	9bdc7c38 	umulh	x24, x1, x28
    5918:	d343ff18 	lsr	x24, x24, #3
    591c:	f100243f 	cmp	x1, #0x9
    5920:	54000249 	b.ls	5968 <_vfiprintf_r+0x12e8>  // b.plast
    5924:	aa1803e1 	mov	x1, x24
    5928:	aa1a03e2 	mov	x2, x26
    592c:	9bdc7c38 	umulh	x24, x1, x28
    5930:	11000508 	add	w8, w8, #0x1
    5934:	d100045a 	sub	x26, x2, #0x1
    5938:	d343ff18 	lsr	x24, x24, #3
    593c:	8b180b00 	add	x0, x24, x24, lsl #2
    5940:	cb000420 	sub	x0, x1, x0, lsl #1
    5944:	1100c000 	add	w0, w0, #0x30
    5948:	381ff040 	sturb	w0, [x2, #-1]
    594c:	34fffe53 	cbz	w19, 5914 <_vfiprintf_r+0x1294>
    5950:	39400280 	ldrb	w0, [x20]
    5954:	7103fc1f 	cmp	w0, #0xff
    5958:	7a481000 	ccmp	w0, w8, #0x0, ne  // ne = any
    595c:	54fffdc1 	b.ne	5914 <_vfiprintf_r+0x1294>  // b.any
    5960:	f100243f 	cmp	x1, #0x9
    5964:	54002028 	b.hi	5d68 <_vfiprintf_r+0x16e8>  // b.pmore
    5968:	aa1703f3 	mov	x19, x23
    596c:	aa0503f7 	mov	x23, x5
    5970:	4b1a02f7 	sub	w23, w23, w26
    5974:	2a1603fc 	mov	w28, w22
    5978:	f9004ff4 	str	x20, [sp, #152]
    597c:	aa0303f4 	mov	x20, x3
    5980:	17fffcd4 	b	4cd0 <_vfiprintf_r+0x650>
    5984:	39400680 	ldrb	w0, [x20, #1]
    5988:	3217039c 	orr	w28, w28, #0x200
    598c:	91000694 	add	x20, x20, #0x1
    5990:	17fffbc2 	b	4898 <_vfiprintf_r+0x218>
    5994:	39400680 	ldrb	w0, [x20, #1]
    5998:	321b039c 	orr	w28, w28, #0x20
    599c:	91000694 	add	x20, x20, #0x1
    59a0:	17fffbbe 	b	4898 <_vfiprintf_r+0x218>
    59a4:	aa1403f3 	mov	x19, x20
    59a8:	aa1603f9 	mov	x25, x22
    59ac:	17fffc3c 	b	4a9c <_vfiprintf_r+0x41c>
    59b0:	7100189f 	cmp	w4, #0x6
    59b4:	528000d7 	mov	w23, #0x6                   	// #6
    59b8:	1a979097 	csel	w23, w4, w23, ls  // ls = plast
    59bc:	f0000027 	adrp	x7, c000 <__func__.0+0x28>
    59c0:	2a1703f6 	mov	w22, w23
    59c4:	910800fa 	add	x26, x7, #0x200
    59c8:	f90037f8 	str	x24, [sp, #104]
    59cc:	17fffbbd 	b	48c0 <_vfiprintf_r+0x240>
    59d0:	f94093e0 	ldr	x0, [sp, #288]
    59d4:	b4ff86e0 	cbz	x0, 4ab0 <_vfiprintf_r+0x430>
    59d8:	aa1303e0 	mov	x0, x19
    59dc:	910443e2 	add	x2, sp, #0x110
    59e0:	aa1903e1 	mov	x1, x25
    59e4:	97fffae7 	bl	4580 <__sprint_r.part.0>
    59e8:	17fffc32 	b	4ab0 <_vfiprintf_r+0x430>
    59ec:	3648101c 	tbz	w28, #9, 5bec <_vfiprintf_r+0x156c>
    59f0:	37f822e0 	tbnz	w0, #31, 5e4c <_vfiprintf_r+0x17cc>
    59f4:	f94037e0 	ldr	x0, [sp, #104]
    59f8:	91002c01 	add	x1, x0, #0xb
    59fc:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5a00:	f90037e1 	str	x1, [sp, #104]
    5a04:	39400001 	ldrb	w1, [x0]
    5a08:	17fffcc7 	b	4d24 <_vfiprintf_r+0x6a4>
    5a0c:	364810f6 	tbz	w22, #9, 5c28 <_vfiprintf_r+0x15a8>
    5a10:	37f82880 	tbnz	w0, #31, 5f20 <_vfiprintf_r+0x18a0>
    5a14:	f94037e0 	ldr	x0, [sp, #104]
    5a18:	91002c01 	add	x1, x0, #0xb
    5a1c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5a20:	f90037e1 	str	x1, [sp, #104]
    5a24:	39400001 	ldrb	w1, [x0]
    5a28:	52800020 	mov	w0, #0x1                   	// #1
    5a2c:	17fffc9a 	b	4c94 <_vfiprintf_r+0x614>
    5a30:	f94043e3 	ldr	x3, [sp, #128]
    5a34:	b940b3e1 	ldr	w1, [sp, #176]
    5a38:	b900b3e2 	str	w2, [sp, #176]
    5a3c:	8b21c061 	add	x1, x3, w1, sxtw
    5a40:	17ffff3a 	b	5728 <_vfiprintf_r+0x10a8>
    5a44:	36480c7c 	tbz	w28, #9, 5bd0 <_vfiprintf_r+0x1550>
    5a48:	37f82421 	tbnz	w1, #31, 5ecc <_vfiprintf_r+0x184c>
    5a4c:	f94037e1 	ldr	x1, [sp, #104]
    5a50:	91002c22 	add	x2, x1, #0xb
    5a54:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5a58:	39400021 	ldrb	w1, [x1]
    5a5c:	f90037e2 	str	x2, [sp, #104]
    5a60:	17ffff33 	b	572c <_vfiprintf_r+0x10ac>
    5a64:	f94043e2 	ldr	x2, [sp, #128]
    5a68:	b940b3e1 	ldr	w1, [sp, #176]
    5a6c:	b900b3e0 	str	w0, [sp, #176]
    5a70:	8b21c041 	add	x1, x2, w1, sxtw
    5a74:	17fffc86 	b	4c8c <_vfiprintf_r+0x60c>
    5a78:	f94043e2 	ldr	x2, [sp, #128]
    5a7c:	b940b3e0 	ldr	w0, [sp, #176]
    5a80:	b900b3e1 	str	w1, [sp, #176]
    5a84:	8b20c040 	add	x0, x2, w0, sxtw
    5a88:	17fffcb4 	b	4d58 <_vfiprintf_r+0x6d8>
    5a8c:	36480bfc 	tbz	w28, #9, 5c08 <_vfiprintf_r+0x1588>
    5a90:	37f820a0 	tbnz	w0, #31, 5ea4 <_vfiprintf_r+0x1824>
    5a94:	f94037e0 	ldr	x0, [sp, #104]
    5a98:	91002c01 	add	x1, x0, #0xb
    5a9c:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5aa0:	f90037e1 	str	x1, [sp, #104]
    5aa4:	39800001 	ldrsb	x1, [x0]
    5aa8:	aa0103e0 	mov	x0, x1
    5aac:	17fffcad 	b	4d60 <_vfiprintf_r+0x6e0>
    5ab0:	f94043e2 	ldr	x2, [sp, #128]
    5ab4:	b940b3e0 	ldr	w0, [sp, #176]
    5ab8:	b900b3e1 	str	w1, [sp, #176]
    5abc:	8b20c040 	add	x0, x2, w0, sxtw
    5ac0:	17fffc98 	b	4d20 <_vfiprintf_r+0x6a0>
    5ac4:	b940b3e0 	ldr	w0, [sp, #176]
    5ac8:	11002001 	add	w1, w0, #0x8
    5acc:	7100003f 	cmp	w1, #0x0
    5ad0:	540011ed 	b.le	5d0c <_vfiprintf_r+0x168c>
    5ad4:	f94037e0 	ldr	x0, [sp, #104]
    5ad8:	b900b3e1 	str	w1, [sp, #176]
    5adc:	91002c02 	add	x2, x0, #0xb
    5ae0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5ae4:	f90037e1 	str	x1, [sp, #104]
    5ae8:	17fffc2b 	b	4b94 <_vfiprintf_r+0x514>
    5aec:	910403e4 	add	x4, sp, #0x100
    5af0:	910423e2 	add	x2, sp, #0x108
    5af4:	aa1303e0 	mov	x0, x19
    5af8:	d2800003 	mov	x3, #0x0                   	// #0
    5afc:	d2800001 	mov	x1, #0x0                   	// #0
    5b00:	94000248 	bl	6420 <_wcsrtombs_r>
    5b04:	2a0003f7 	mov	w23, w0
    5b08:	3100041f 	cmn	w0, #0x1
    5b0c:	540017a0 	b.eq	5e00 <_vfiprintf_r+0x1780>  // b.none
    5b10:	f90087fa 	str	x26, [sp, #264]
    5b14:	17ffff5c 	b	5884 <_vfiprintf_r+0x1204>
    5b18:	52800016 	mov	w22, #0x0                   	// #0
    5b1c:	52800004 	mov	w4, #0x0                   	// #0
    5b20:	a906fff8 	stp	x24, xzr, [sp, #104]
    5b24:	17fffc6e 	b	4cdc <_vfiprintf_r+0x65c>
    5b28:	f94043e2 	ldr	x2, [sp, #128]
    5b2c:	b940b3e1 	ldr	w1, [sp, #176]
    5b30:	b900b3e0 	str	w0, [sp, #176]
    5b34:	8b21c042 	add	x2, x2, w1, sxtw
    5b38:	17fffcde 	b	4eb0 <_vfiprintf_r+0x830>
    5b3c:	f94043e2 	ldr	x2, [sp, #128]
    5b40:	b940b3e0 	ldr	w0, [sp, #176]
    5b44:	b900b3e1 	str	w1, [sp, #176]
    5b48:	8b20c042 	add	x2, x2, w0, sxtw
    5b4c:	f94037e0 	ldr	x0, [sp, #104]
    5b50:	f90037e2 	str	x2, [sp, #104]
    5b54:	17fffc3d 	b	4c48 <_vfiprintf_r+0x5c8>
    5b58:	b940b3e0 	ldr	w0, [sp, #176]
    5b5c:	11002001 	add	w1, w0, #0x8
    5b60:	7100003f 	cmp	w1, #0x0
    5b64:	54000eed 	b.le	5d40 <_vfiprintf_r+0x16c0>
    5b68:	f94037e0 	ldr	x0, [sp, #104]
    5b6c:	b900b3e1 	str	w1, [sp, #176]
    5b70:	91002c02 	add	x2, x0, #0xb
    5b74:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5b78:	f90037e1 	str	x1, [sp, #104]
    5b7c:	17fffeb5 	b	5650 <_vfiprintf_r+0xfd0>
    5b80:	f94043e3 	ldr	x3, [sp, #128]
    5b84:	b940b3e2 	ldr	w2, [sp, #176]
    5b88:	b900b3e1 	str	w1, [sp, #176]
    5b8c:	f94037f8 	ldr	x24, [sp, #104]
    5b90:	8b22c062 	add	x2, x3, w2, sxtw
    5b94:	f90037e2 	str	x2, [sp, #104]
    5b98:	17fffbda 	b	4b00 <_vfiprintf_r+0x480>
    5b9c:	910643fb 	add	x27, sp, #0x190
    5ba0:	52800028 	mov	w8, #0x1                   	// #1
    5ba4:	52800001 	mov	w1, #0x0                   	// #0
    5ba8:	17fffb7c 	b	4998 <_vfiprintf_r+0x318>
    5bac:	37f81e60 	tbnz	w0, #31, 5f78 <_vfiprintf_r+0x18f8>
    5bb0:	f94037e0 	ldr	x0, [sp, #104]
    5bb4:	91003c01 	add	x1, x0, #0xf
    5bb8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5bbc:	f90037e1 	str	x1, [sp, #104]
    5bc0:	f9400000 	ldr	x0, [x0]
    5bc4:	7940cbe1 	ldrh	w1, [sp, #100]
    5bc8:	79000001 	strh	w1, [x0]
    5bcc:	17fffae4 	b	475c <_vfiprintf_r+0xdc>
    5bd0:	37f81281 	tbnz	w1, #31, 5e20 <_vfiprintf_r+0x17a0>
    5bd4:	f94037e1 	ldr	x1, [sp, #104]
    5bd8:	91002c22 	add	x2, x1, #0xb
    5bdc:	927df042 	and	x2, x2, #0xfffffffffffffff8
    5be0:	b9400021 	ldr	w1, [x1]
    5be4:	f90037e2 	str	x2, [sp, #104]
    5be8:	17fffed1 	b	572c <_vfiprintf_r+0x10ac>
    5bec:	37f81460 	tbnz	w0, #31, 5e78 <_vfiprintf_r+0x17f8>
    5bf0:	f94037e0 	ldr	x0, [sp, #104]
    5bf4:	91002c01 	add	x1, x0, #0xb
    5bf8:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5bfc:	f90037e1 	str	x1, [sp, #104]
    5c00:	b9400001 	ldr	w1, [x0]
    5c04:	17fffc48 	b	4d24 <_vfiprintf_r+0x6a4>
    5c08:	37f81cc0 	tbnz	w0, #31, 5fa0 <_vfiprintf_r+0x1920>
    5c0c:	f94037e0 	ldr	x0, [sp, #104]
    5c10:	91002c01 	add	x1, x0, #0xb
    5c14:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5c18:	f90037e1 	str	x1, [sp, #104]
    5c1c:	b9800001 	ldrsw	x1, [x0]
    5c20:	aa0103e0 	mov	x0, x1
    5c24:	17fffc4f 	b	4d60 <_vfiprintf_r+0x6e0>
    5c28:	37f81680 	tbnz	w0, #31, 5ef8 <_vfiprintf_r+0x1878>
    5c2c:	f94037e0 	ldr	x0, [sp, #104]
    5c30:	91002c01 	add	x1, x0, #0xb
    5c34:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5c38:	f90037e1 	str	x1, [sp, #104]
    5c3c:	b9400001 	ldr	w1, [x0]
    5c40:	52800020 	mov	w0, #0x1                   	// #1
    5c44:	17fffc14 	b	4c94 <_vfiprintf_r+0x614>
    5c48:	9103bfe0 	add	x0, sp, #0xef
    5c4c:	910643fb 	add	x27, sp, #0x190
    5c50:	52800028 	mov	w8, #0x1                   	// #1
    5c54:	f900cbe0 	str	x0, [sp, #400]
    5c58:	d2800020 	mov	x0, #0x1                   	// #1
    5c5c:	f900cfe0 	str	x0, [sp, #408]
    5c60:	17fffb33 	b	492c <_vfiprintf_r+0x2ac>
    5c64:	b940b3e1 	ldr	w1, [sp, #176]
    5c68:	11002022 	add	w2, w1, #0x8
    5c6c:	7100005f 	cmp	w2, #0x0
    5c70:	54001b6d 	b.le	5fdc <_vfiprintf_r+0x195c>
    5c74:	f94037e1 	ldr	x1, [sp, #104]
    5c78:	b900b3e2 	str	w2, [sp, #176]
    5c7c:	91002c23 	add	x3, x1, #0xb
    5c80:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5c84:	79400021 	ldrh	w1, [x1]
    5c88:	f90037e2 	str	x2, [sp, #104]
    5c8c:	17fffea8 	b	572c <_vfiprintf_r+0x10ac>
    5c90:	b940b3e0 	ldr	w0, [sp, #176]
    5c94:	11002001 	add	w1, w0, #0x8
    5c98:	7100003f 	cmp	w1, #0x0
    5c9c:	54001b6d 	b.le	6008 <_vfiprintf_r+0x1988>
    5ca0:	f94037e0 	ldr	x0, [sp, #104]
    5ca4:	b900b3e1 	str	w1, [sp, #176]
    5ca8:	91002c02 	add	x2, x0, #0xb
    5cac:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5cb0:	f90037e1 	str	x1, [sp, #104]
    5cb4:	79400001 	ldrh	w1, [x0]
    5cb8:	17fffc1b 	b	4d24 <_vfiprintf_r+0x6a4>
    5cbc:	b940b3e0 	ldr	w0, [sp, #176]
    5cc0:	11002001 	add	w1, w0, #0x8
    5cc4:	7100003f 	cmp	w1, #0x0
    5cc8:	5400196d 	b.le	5ff4 <_vfiprintf_r+0x1974>
    5ccc:	f94037e0 	ldr	x0, [sp, #104]
    5cd0:	b900b3e1 	str	w1, [sp, #176]
    5cd4:	91002c02 	add	x2, x0, #0xb
    5cd8:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5cdc:	f90037e1 	str	x1, [sp, #104]
    5ce0:	17fffe2e 	b	5598 <_vfiprintf_r+0xf18>
    5ce4:	b940b3e0 	ldr	w0, [sp, #176]
    5ce8:	11002001 	add	w1, w0, #0x8
    5cec:	7100003f 	cmp	w1, #0x0
    5cf0:	540016cd 	b.le	5fc8 <_vfiprintf_r+0x1948>
    5cf4:	f94037e0 	ldr	x0, [sp, #104]
    5cf8:	b900b3e1 	str	w1, [sp, #176]
    5cfc:	91002c02 	add	x2, x0, #0xb
    5d00:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5d04:	f90037e1 	str	x1, [sp, #104]
    5d08:	17fffe13 	b	5554 <_vfiprintf_r+0xed4>
    5d0c:	f94043e2 	ldr	x2, [sp, #128]
    5d10:	b940b3e0 	ldr	w0, [sp, #176]
    5d14:	b900b3e1 	str	w1, [sp, #176]
    5d18:	8b20c040 	add	x0, x2, w0, sxtw
    5d1c:	17fffb9e 	b	4b94 <_vfiprintf_r+0x514>
    5d20:	110006e1 	add	w1, w23, #0x1
    5d24:	aa1303e0 	mov	x0, x19
    5d28:	93407c21 	sxtw	x1, w1
    5d2c:	94000ad5 	bl	8880 <_malloc_r>
    5d30:	aa0003fa 	mov	x26, x0
    5d34:	b4000660 	cbz	x0, 5e00 <_vfiprintf_r+0x1780>
    5d38:	f9003be0 	str	x0, [sp, #112]
    5d3c:	17fffed7 	b	5898 <_vfiprintf_r+0x1218>
    5d40:	f94043e2 	ldr	x2, [sp, #128]
    5d44:	b940b3e0 	ldr	w0, [sp, #176]
    5d48:	b900b3e1 	str	w1, [sp, #176]
    5d4c:	8b20c040 	add	x0, x2, w0, sxtw
    5d50:	17fffe40 	b	5650 <_vfiprintf_r+0xfd0>
    5d54:	2a0403f6 	mov	w22, w4
    5d58:	2a0403f7 	mov	w23, w4
    5d5c:	52800004 	mov	w4, #0x0                   	// #0
    5d60:	f90037f8 	str	x24, [sp, #104]
    5d64:	17fffbde 	b	4cdc <_vfiprintf_r+0x65c>
    5d68:	a94a03e1 	ldp	x1, x0, [sp, #160]
    5d6c:	b90073e4 	str	w4, [sp, #112]
    5d70:	a90917e3 	stp	x3, x5, [sp, #144]
    5d74:	cb00035a 	sub	x26, x26, x0
    5d78:	aa0003e2 	mov	x2, x0
    5d7c:	aa1a03e0 	mov	x0, x26
    5d80:	9400133c 	bl	aa70 <strncpy>
    5d84:	39400680 	ldrb	w0, [x20, #1]
    5d88:	52800008 	mov	w8, #0x0                   	// #0
    5d8c:	b94073e4 	ldr	w4, [sp, #112]
    5d90:	7100001f 	cmp	w0, #0x0
    5d94:	9a940694 	cinc	x20, x20, ne  // ne = any
    5d98:	a94917e3 	ldp	x3, x5, [sp, #144]
    5d9c:	17fffee2 	b	5924 <_vfiprintf_r+0x12a4>
    5da0:	f94043e2 	ldr	x2, [sp, #128]
    5da4:	b940b3e0 	ldr	w0, [sp, #176]
    5da8:	b900b3e1 	str	w1, [sp, #176]
    5dac:	8b20c040 	add	x0, x2, w0, sxtw
    5db0:	17fffc28 	b	4e50 <_vfiprintf_r+0x7d0>
    5db4:	f0000028 	adrp	x8, c000 <__func__.0+0x28>
    5db8:	2a0203eb 	mov	w11, w2
    5dbc:	910b0108 	add	x8, x8, #0x2c0
    5dc0:	17fffd4e 	b	52f8 <_vfiprintf_r+0xc78>
    5dc4:	aa1a03e0 	mov	x0, x26
    5dc8:	97fff99e 	bl	4440 <strlen>
    5dcc:	7100001f 	cmp	w0, #0x0
    5dd0:	2a0003f7 	mov	w23, w0
    5dd4:	1a9fa016 	csel	w22, w0, wzr, ge  // ge = tcont
    5dd8:	52800004 	mov	w4, #0x0                   	// #0
    5ddc:	a906fff8 	stp	x24, xzr, [sp, #104]
    5de0:	17fffbbf 	b	4cdc <_vfiprintf_r+0x65c>
    5de4:	f0000028 	adrp	x8, c000 <__func__.0+0x28>
    5de8:	11000444 	add	w4, w2, #0x1
    5dec:	910b0108 	add	x8, x8, #0x2c0
    5df0:	17fffd7b 	b	53dc <_vfiprintf_r+0xd5c>
    5df4:	12800000 	mov	w0, #0xffffffff            	// #-1
    5df8:	b90067e0 	str	w0, [sp, #100]
    5dfc:	17fffb31 	b	4ac0 <_vfiprintf_r+0x440>
    5e00:	79c02320 	ldrsh	w0, [x25, #16]
    5e04:	321a0000 	orr	w0, w0, #0x40
    5e08:	79002320 	strh	w0, [x25, #16]
    5e0c:	17fffb2a 	b	4ab4 <_vfiprintf_r+0x434>
    5e10:	f0000029 	adrp	x9, c000 <__func__.0+0x28>
    5e14:	2a0803ea 	mov	w10, w8
    5e18:	910b4129 	add	x9, x9, #0x2d0
    5e1c:	17fffc90 	b	505c <_vfiprintf_r+0x9dc>
    5e20:	b940b3e1 	ldr	w1, [sp, #176]
    5e24:	11002022 	add	w2, w1, #0x8
    5e28:	7100005f 	cmp	w2, #0x0
    5e2c:	540019cd 	b.le	6164 <_vfiprintf_r+0x1ae4>
    5e30:	f94037e1 	ldr	x1, [sp, #104]
    5e34:	b900b3e2 	str	w2, [sp, #176]
    5e38:	91002c23 	add	x3, x1, #0xb
    5e3c:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5e40:	b9400021 	ldr	w1, [x1]
    5e44:	f90037e2 	str	x2, [sp, #104]
    5e48:	17fffe39 	b	572c <_vfiprintf_r+0x10ac>
    5e4c:	b940b3e0 	ldr	w0, [sp, #176]
    5e50:	11002001 	add	w1, w0, #0x8
    5e54:	7100003f 	cmp	w1, #0x0
    5e58:	540010cd 	b.le	6070 <_vfiprintf_r+0x19f0>
    5e5c:	f94037e0 	ldr	x0, [sp, #104]
    5e60:	b900b3e1 	str	w1, [sp, #176]
    5e64:	91002c02 	add	x2, x0, #0xb
    5e68:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5e6c:	f90037e1 	str	x1, [sp, #104]
    5e70:	39400001 	ldrb	w1, [x0]
    5e74:	17fffbac 	b	4d24 <_vfiprintf_r+0x6a4>
    5e78:	b940b3e0 	ldr	w0, [sp, #176]
    5e7c:	11002001 	add	w1, w0, #0x8
    5e80:	7100003f 	cmp	w1, #0x0
    5e84:	540015ad 	b.le	6138 <_vfiprintf_r+0x1ab8>
    5e88:	f94037e0 	ldr	x0, [sp, #104]
    5e8c:	b900b3e1 	str	w1, [sp, #176]
    5e90:	91002c02 	add	x2, x0, #0xb
    5e94:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5e98:	f90037e1 	str	x1, [sp, #104]
    5e9c:	b9400001 	ldr	w1, [x0]
    5ea0:	17fffba1 	b	4d24 <_vfiprintf_r+0x6a4>
    5ea4:	b940b3e0 	ldr	w0, [sp, #176]
    5ea8:	11002001 	add	w1, w0, #0x8
    5eac:	7100003f 	cmp	w1, #0x0
    5eb0:	54000f6d 	b.le	609c <_vfiprintf_r+0x1a1c>
    5eb4:	f94037e0 	ldr	x0, [sp, #104]
    5eb8:	b900b3e1 	str	w1, [sp, #176]
    5ebc:	91002c02 	add	x2, x0, #0xb
    5ec0:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5ec4:	f90037e1 	str	x1, [sp, #104]
    5ec8:	17fffef7 	b	5aa4 <_vfiprintf_r+0x1424>
    5ecc:	b940b3e1 	ldr	w1, [sp, #176]
    5ed0:	11002022 	add	w2, w1, #0x8
    5ed4:	7100005f 	cmp	w2, #0x0
    5ed8:	5400152d 	b.le	617c <_vfiprintf_r+0x1afc>
    5edc:	f94037e1 	ldr	x1, [sp, #104]
    5ee0:	b900b3e2 	str	w2, [sp, #176]
    5ee4:	91002c23 	add	x3, x1, #0xb
    5ee8:	927df062 	and	x2, x3, #0xfffffffffffffff8
    5eec:	39400021 	ldrb	w1, [x1]
    5ef0:	f90037e2 	str	x2, [sp, #104]
    5ef4:	17fffe0e 	b	572c <_vfiprintf_r+0x10ac>
    5ef8:	b940b3e0 	ldr	w0, [sp, #176]
    5efc:	11002001 	add	w1, w0, #0x8
    5f00:	7100003f 	cmp	w1, #0x0
    5f04:	5400106d 	b.le	6110 <_vfiprintf_r+0x1a90>
    5f08:	f94037e0 	ldr	x0, [sp, #104]
    5f0c:	b900b3e1 	str	w1, [sp, #176]
    5f10:	91002c02 	add	x2, x0, #0xb
    5f14:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5f18:	f90037e1 	str	x1, [sp, #104]
    5f1c:	17ffff48 	b	5c3c <_vfiprintf_r+0x15bc>
    5f20:	b940b3e0 	ldr	w0, [sp, #176]
    5f24:	11002001 	add	w1, w0, #0x8
    5f28:	7100003f 	cmp	w1, #0x0
    5f2c:	54000e8d 	b.le	60fc <_vfiprintf_r+0x1a7c>
    5f30:	f94037e0 	ldr	x0, [sp, #104]
    5f34:	b900b3e1 	str	w1, [sp, #176]
    5f38:	91002c02 	add	x2, x0, #0xb
    5f3c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5f40:	f90037e1 	str	x1, [sp, #104]
    5f44:	17fffeb8 	b	5a24 <_vfiprintf_r+0x13a4>
    5f48:	37f80800 	tbnz	w0, #31, 6048 <_vfiprintf_r+0x19c8>
    5f4c:	f94037e0 	ldr	x0, [sp, #104]
    5f50:	91003c01 	add	x1, x0, #0xf
    5f54:	927df021 	and	x1, x1, #0xfffffffffffffff8
    5f58:	f90037e1 	str	x1, [sp, #104]
    5f5c:	f9400000 	ldr	x0, [x0]
    5f60:	b94067e1 	ldr	w1, [sp, #100]
    5f64:	b9000001 	str	w1, [x0]
    5f68:	17fff9fd 	b	475c <_vfiprintf_r+0xdc>
    5f6c:	2a1403f7 	mov	w23, w20
    5f70:	f94037f4 	ldr	x20, [sp, #104]
    5f74:	17fffe44 	b	5884 <_vfiprintf_r+0x1204>
    5f78:	b940b3e0 	ldr	w0, [sp, #176]
    5f7c:	11002001 	add	w1, w0, #0x8
    5f80:	7100003f 	cmp	w1, #0x0
    5f84:	54000d0d 	b.le	6124 <_vfiprintf_r+0x1aa4>
    5f88:	f94037e0 	ldr	x0, [sp, #104]
    5f8c:	b900b3e1 	str	w1, [sp, #176]
    5f90:	91003c02 	add	x2, x0, #0xf
    5f94:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5f98:	f90037e1 	str	x1, [sp, #104]
    5f9c:	17ffff09 	b	5bc0 <_vfiprintf_r+0x1540>
    5fa0:	b940b3e0 	ldr	w0, [sp, #176]
    5fa4:	11002001 	add	w1, w0, #0x8
    5fa8:	7100003f 	cmp	w1, #0x0
    5fac:	540006ed 	b.le	6088 <_vfiprintf_r+0x1a08>
    5fb0:	f94037e0 	ldr	x0, [sp, #104]
    5fb4:	b900b3e1 	str	w1, [sp, #176]
    5fb8:	91002c02 	add	x2, x0, #0xb
    5fbc:	927df041 	and	x1, x2, #0xfffffffffffffff8
    5fc0:	f90037e1 	str	x1, [sp, #104]
    5fc4:	17ffff16 	b	5c1c <_vfiprintf_r+0x159c>
    5fc8:	f94043e2 	ldr	x2, [sp, #128]
    5fcc:	b940b3e0 	ldr	w0, [sp, #176]
    5fd0:	b900b3e1 	str	w1, [sp, #176]
    5fd4:	8b20c040 	add	x0, x2, w0, sxtw
    5fd8:	17fffd5f 	b	5554 <_vfiprintf_r+0xed4>
    5fdc:	f94043e3 	ldr	x3, [sp, #128]
    5fe0:	b940b3e1 	ldr	w1, [sp, #176]
    5fe4:	b900b3e2 	str	w2, [sp, #176]
    5fe8:	8b21c061 	add	x1, x3, w1, sxtw
    5fec:	79400021 	ldrh	w1, [x1]
    5ff0:	17fffdcf 	b	572c <_vfiprintf_r+0x10ac>
    5ff4:	f94043e2 	ldr	x2, [sp, #128]
    5ff8:	b940b3e0 	ldr	w0, [sp, #176]
    5ffc:	b900b3e1 	str	w1, [sp, #176]
    6000:	8b20c040 	add	x0, x2, w0, sxtw
    6004:	17fffd65 	b	5598 <_vfiprintf_r+0xf18>
    6008:	f94043e2 	ldr	x2, [sp, #128]
    600c:	b940b3e0 	ldr	w0, [sp, #176]
    6010:	b900b3e1 	str	w1, [sp, #176]
    6014:	8b20c040 	add	x0, x2, w0, sxtw
    6018:	79400001 	ldrh	w1, [x0]
    601c:	17fffb42 	b	4d24 <_vfiprintf_r+0x6a4>
    6020:	b940b3e0 	ldr	w0, [sp, #176]
    6024:	11002001 	add	w1, w0, #0x8
    6028:	7100003f 	cmp	w1, #0x0
    602c:	5400092d 	b.le	6150 <_vfiprintf_r+0x1ad0>
    6030:	f94037e0 	ldr	x0, [sp, #104]
    6034:	b900b3e1 	str	w1, [sp, #176]
    6038:	91003c02 	add	x2, x0, #0xf
    603c:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6040:	f90037e1 	str	x1, [sp, #104]
    6044:	17fffb7a 	b	4e2c <_vfiprintf_r+0x7ac>
    6048:	b940b3e0 	ldr	w0, [sp, #176]
    604c:	11002001 	add	w1, w0, #0x8
    6050:	7100003f 	cmp	w1, #0x0
    6054:	540002ed 	b.le	60b0 <_vfiprintf_r+0x1a30>
    6058:	f94037e0 	ldr	x0, [sp, #104]
    605c:	b900b3e1 	str	w1, [sp, #176]
    6060:	91003c02 	add	x2, x0, #0xf
    6064:	927df041 	and	x1, x2, #0xfffffffffffffff8
    6068:	f90037e1 	str	x1, [sp, #104]
    606c:	17ffffbc 	b	5f5c <_vfiprintf_r+0x18dc>
    6070:	f94043e2 	ldr	x2, [sp, #128]
    6074:	b940b3e0 	ldr	w0, [sp, #176]
    6078:	b900b3e1 	str	w1, [sp, #176]
    607c:	8b20c040 	add	x0, x2, w0, sxtw
    6080:	39400001 	ldrb	w1, [x0]
    6084:	17fffb28 	b	4d24 <_vfiprintf_r+0x6a4>
    6088:	f94043e2 	ldr	x2, [sp, #128]
    608c:	b940b3e0 	ldr	w0, [sp, #176]
    6090:	b900b3e1 	str	w1, [sp, #176]
    6094:	8b20c040 	add	x0, x2, w0, sxtw
    6098:	17fffee1 	b	5c1c <_vfiprintf_r+0x159c>
    609c:	f94043e2 	ldr	x2, [sp, #128]
    60a0:	b940b3e0 	ldr	w0, [sp, #176]
    60a4:	b900b3e1 	str	w1, [sp, #176]
    60a8:	8b20c040 	add	x0, x2, w0, sxtw
    60ac:	17fffe7e 	b	5aa4 <_vfiprintf_r+0x1424>
    60b0:	f94043e2 	ldr	x2, [sp, #128]
    60b4:	b940b3e0 	ldr	w0, [sp, #176]
    60b8:	b900b3e1 	str	w1, [sp, #176]
    60bc:	8b20c040 	add	x0, x2, w0, sxtw
    60c0:	17ffffa7 	b	5f5c <_vfiprintf_r+0x18dc>
    60c4:	b940b3e0 	ldr	w0, [sp, #176]
    60c8:	37f80660 	tbnz	w0, #31, 6194 <_vfiprintf_r+0x1b14>
    60cc:	f94037e1 	ldr	x1, [sp, #104]
    60d0:	91002c21 	add	x1, x1, #0xb
    60d4:	927df021 	and	x1, x1, #0xfffffffffffffff8
    60d8:	f94037e3 	ldr	x3, [sp, #104]
    60dc:	f90037e1 	str	x1, [sp, #104]
    60e0:	b900b3e0 	str	w0, [sp, #176]
    60e4:	39400680 	ldrb	w0, [x20, #1]
    60e8:	aa0203f4 	mov	x20, x2
    60ec:	b9400064 	ldr	w4, [x3]
    60f0:	7100009f 	cmp	w4, #0x0
    60f4:	5a9fa096 	csinv	w22, w4, wzr, ge  // ge = tcont
    60f8:	17fff9e8 	b	4898 <_vfiprintf_r+0x218>
    60fc:	f94043e2 	ldr	x2, [sp, #128]
    6100:	b940b3e0 	ldr	w0, [sp, #176]
    6104:	b900b3e1 	str	w1, [sp, #176]
    6108:	8b20c040 	add	x0, x2, w0, sxtw
    610c:	17fffe46 	b	5a24 <_vfiprintf_r+0x13a4>
    6110:	f94043e2 	ldr	x2, [sp, #128]
    6114:	b940b3e0 	ldr	w0, [sp, #176]
    6118:	b900b3e1 	str	w1, [sp, #176]
    611c:	8b20c040 	add	x0, x2, w0, sxtw
    6120:	17fffec7 	b	5c3c <_vfiprintf_r+0x15bc>
    6124:	f94043e2 	ldr	x2, [sp, #128]
    6128:	b940b3e0 	ldr	w0, [sp, #176]
    612c:	b900b3e1 	str	w1, [sp, #176]
    6130:	8b20c040 	add	x0, x2, w0, sxtw
    6134:	17fffea3 	b	5bc0 <_vfiprintf_r+0x1540>
    6138:	f94043e2 	ldr	x2, [sp, #128]
    613c:	b940b3e0 	ldr	w0, [sp, #176]
    6140:	b900b3e1 	str	w1, [sp, #176]
    6144:	8b20c040 	add	x0, x2, w0, sxtw
    6148:	b9400001 	ldr	w1, [x0]
    614c:	17fffaf6 	b	4d24 <_vfiprintf_r+0x6a4>
    6150:	f94043e2 	ldr	x2, [sp, #128]
    6154:	b940b3e0 	ldr	w0, [sp, #176]
    6158:	b900b3e1 	str	w1, [sp, #176]
    615c:	8b20c040 	add	x0, x2, w0, sxtw
    6160:	17fffb33 	b	4e2c <_vfiprintf_r+0x7ac>
    6164:	f94043e3 	ldr	x3, [sp, #128]
    6168:	b940b3e1 	ldr	w1, [sp, #176]
    616c:	b900b3e2 	str	w2, [sp, #176]
    6170:	8b21c061 	add	x1, x3, w1, sxtw
    6174:	b9400021 	ldr	w1, [x1]
    6178:	17fffd6d 	b	572c <_vfiprintf_r+0x10ac>
    617c:	f94043e3 	ldr	x3, [sp, #128]
    6180:	b940b3e1 	ldr	w1, [sp, #176]
    6184:	b900b3e2 	str	w2, [sp, #176]
    6188:	8b21c061 	add	x1, x3, w1, sxtw
    618c:	39400021 	ldrb	w1, [x1]
    6190:	17fffd67 	b	572c <_vfiprintf_r+0x10ac>
    6194:	b940b3e0 	ldr	w0, [sp, #176]
    6198:	f94037e1 	ldr	x1, [sp, #104]
    619c:	11002000 	add	w0, w0, #0x8
    61a0:	7100001f 	cmp	w0, #0x0
    61a4:	5400010d 	b.le	61c4 <_vfiprintf_r+0x1b44>
    61a8:	91002c21 	add	x1, x1, #0xb
    61ac:	927df021 	and	x1, x1, #0xfffffffffffffff8
    61b0:	17ffffca 	b	60d8 <_vfiprintf_r+0x1a58>
    61b4:	79402320 	ldrh	w0, [x25, #16]
    61b8:	321a0000 	orr	w0, w0, #0x40
    61bc:	79002320 	strh	w0, [x25, #16]
    61c0:	17fffa37 	b	4a9c <_vfiprintf_r+0x41c>
    61c4:	f94043e4 	ldr	x4, [sp, #128]
    61c8:	b940b3e3 	ldr	w3, [sp, #176]
    61cc:	8b23c083 	add	x3, x4, w3, sxtw
    61d0:	f90037e3 	str	x3, [sp, #104]
    61d4:	17ffffc1 	b	60d8 <_vfiprintf_r+0x1a58>
    61d8:	d503201f 	nop
    61dc:	d503201f 	nop

00000000000061e0 <vfiprintf>:
    61e0:	aa0203e4 	mov	x4, x2
    61e4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    61e8:	d0000023 	adrp	x3, c000 <__func__.0+0x28>
    61ec:	910003fd 	mov	x29, sp
    61f0:	a9401c46 	ldp	x6, x7, [x2]
    61f4:	aa0003e8 	mov	x8, x0
    61f8:	a9411484 	ldp	x4, x5, [x4, #16]
    61fc:	aa0103e2 	mov	x2, x1
    6200:	f9443860 	ldr	x0, [x3, #2160]
    6204:	aa0803e1 	mov	x1, x8
    6208:	910043e3 	add	x3, sp, #0x10
    620c:	a9011fe6 	stp	x6, x7, [sp, #16]
    6210:	a90217e4 	stp	x4, x5, [sp, #32]
    6214:	97fff91b 	bl	4680 <_vfiprintf_r>
    6218:	a8c37bfd 	ldp	x29, x30, [sp], #48
    621c:	d65f03c0 	ret

0000000000006220 <__sbprintf>:
    6220:	d11403ff 	sub	sp, sp, #0x500
    6224:	52808005 	mov	w5, #0x400                 	// #1024
    6228:	910403e6 	add	x6, sp, #0x100
    622c:	a9007bfd 	stp	x29, x30, [sp]
    6230:	910003fd 	mov	x29, sp
    6234:	a90153f3 	stp	x19, x20, [sp, #16]
    6238:	aa0103f3 	mov	x19, x1
    623c:	aa0303e1 	mov	x1, x3
    6240:	9100c3e3 	add	x3, sp, #0x30
    6244:	f9002be6 	str	x6, [sp, #80]
    6248:	79402264 	ldrh	w4, [x19, #16]
    624c:	a9403c2e 	ldp	x14, x15, [x1]
    6250:	121e7884 	and	w4, w4, #0xfffffffd
    6254:	7940266c 	ldrh	w12, [x19, #18]
    6258:	a9412428 	ldp	x8, x9, [x1, #16]
    625c:	910143e1 	add	x1, sp, #0x50
    6260:	f9401a6b 	ldr	x11, [x19, #48]
    6264:	b9005fe5 	str	w5, [sp, #92]
    6268:	f940226a 	ldr	x10, [x19, #64]
    626c:	a9033fee 	stp	x14, x15, [sp, #48]
    6270:	b940ae67 	ldr	w7, [x19, #172]
    6274:	f90013f5 	str	x21, [sp, #32]
    6278:	aa0003f5 	mov	x21, x0
    627c:	a90427e8 	stp	x8, x9, [sp, #64]
    6280:	7900c3e4 	strh	w4, [sp, #96]
    6284:	7900c7ec 	strh	w12, [sp, #98]
    6288:	f90037e6 	str	x6, [sp, #104]
    628c:	b90073e5 	str	w5, [sp, #112]
    6290:	b9007bff 	str	wzr, [sp, #120]
    6294:	f90043eb 	str	x11, [sp, #128]
    6298:	f9004bea 	str	x10, [sp, #144]
    629c:	b900ffe7 	str	w7, [sp, #252]
    62a0:	97fff8f8 	bl	4680 <_vfiprintf_r>
    62a4:	2a0003f4 	mov	w20, w0
    62a8:	37f800c0 	tbnz	w0, #31, 62c0 <__sbprintf+0xa0>
    62ac:	910143e1 	add	x1, sp, #0x50
    62b0:	aa1503e0 	mov	x0, x21
    62b4:	9400017b 	bl	68a0 <_fflush_r>
    62b8:	7100001f 	cmp	w0, #0x0
    62bc:	5a9f0294 	csinv	w20, w20, wzr, eq  // eq = none
    62c0:	7940c3e0 	ldrh	w0, [sp, #96]
    62c4:	36300080 	tbz	w0, #6, 62d4 <__sbprintf+0xb4>
    62c8:	79402260 	ldrh	w0, [x19, #16]
    62cc:	321a0000 	orr	w0, w0, #0x40
    62d0:	79002260 	strh	w0, [x19, #16]
    62d4:	2a1403e0 	mov	w0, w20
    62d8:	a9407bfd 	ldp	x29, x30, [sp]
    62dc:	a94153f3 	ldp	x19, x20, [sp, #16]
    62e0:	f94013f5 	ldr	x21, [sp, #32]
    62e4:	911403ff 	add	sp, sp, #0x500
    62e8:	d65f03c0 	ret
    62ec:	d503201f 	nop

00000000000062f0 <_wcrtomb_r>:
    62f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    62f4:	91055004 	add	x4, x0, #0x154
    62f8:	910003fd 	mov	x29, sp
    62fc:	a90153f3 	stp	x19, x20, [sp, #16]
    6300:	aa0303f3 	mov	x19, x3
    6304:	f100027f 	cmp	x19, #0x0
    6308:	f0000023 	adrp	x3, d000 <__global_locale+0x20>
    630c:	9a930093 	csel	x19, x4, x19, eq  // eq = none
    6310:	aa0003f4 	mov	x20, x0
    6314:	f9406064 	ldr	x4, [x3, #192]
    6318:	aa1303e3 	mov	x3, x19
    631c:	b4000121 	cbz	x1, 6340 <_wcrtomb_r+0x50>
    6320:	d63f0080 	blr	x4
    6324:	2a0003e1 	mov	w1, w0
    6328:	93407c20 	sxtw	x0, w1
    632c:	3100043f 	cmn	w1, #0x1
    6330:	54000160 	b.eq	635c <_wcrtomb_r+0x6c>  // b.none
    6334:	a94153f3 	ldp	x19, x20, [sp, #16]
    6338:	a8c37bfd 	ldp	x29, x30, [sp], #48
    633c:	d65f03c0 	ret
    6340:	910083e1 	add	x1, sp, #0x20
    6344:	52800002 	mov	w2, #0x0                   	// #0
    6348:	d63f0080 	blr	x4
    634c:	2a0003e1 	mov	w1, w0
    6350:	93407c20 	sxtw	x0, w1
    6354:	3100043f 	cmn	w1, #0x1
    6358:	54fffee1 	b.ne	6334 <_wcrtomb_r+0x44>  // b.any
    635c:	b900027f 	str	wzr, [x19]
    6360:	52801141 	mov	w1, #0x8a                  	// #138
    6364:	b9000281 	str	w1, [x20]
    6368:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    636c:	a94153f3 	ldp	x19, x20, [sp, #16]
    6370:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6374:	d65f03c0 	ret
    6378:	d503201f 	nop
    637c:	d503201f 	nop

0000000000006380 <wcrtomb>:
    6380:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6384:	d0000024 	adrp	x4, c000 <__func__.0+0x28>
    6388:	f0000023 	adrp	x3, d000 <__global_locale+0x20>
    638c:	910003fd 	mov	x29, sp
    6390:	a90153f3 	stp	x19, x20, [sp, #16]
    6394:	f100005f 	cmp	x2, #0x0
    6398:	f9443894 	ldr	x20, [x4, #2160]
    639c:	91055284 	add	x4, x20, #0x154
    63a0:	9a820093 	csel	x19, x4, x2, eq  // eq = none
    63a4:	f9406064 	ldr	x4, [x3, #192]
    63a8:	b40001a0 	cbz	x0, 63dc <wcrtomb+0x5c>
    63ac:	2a0103e2 	mov	w2, w1
    63b0:	aa0003e1 	mov	x1, x0
    63b4:	aa1303e3 	mov	x3, x19
    63b8:	aa1403e0 	mov	x0, x20
    63bc:	d63f0080 	blr	x4
    63c0:	2a0003e1 	mov	w1, w0
    63c4:	93407c20 	sxtw	x0, w1
    63c8:	3100043f 	cmn	w1, #0x1
    63cc:	540001a0 	b.eq	6400 <wcrtomb+0x80>  // b.none
    63d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    63d4:	a8c37bfd 	ldp	x29, x30, [sp], #48
    63d8:	d65f03c0 	ret
    63dc:	910083e1 	add	x1, sp, #0x20
    63e0:	aa1303e3 	mov	x3, x19
    63e4:	aa1403e0 	mov	x0, x20
    63e8:	52800002 	mov	w2, #0x0                   	// #0
    63ec:	d63f0080 	blr	x4
    63f0:	2a0003e1 	mov	w1, w0
    63f4:	93407c20 	sxtw	x0, w1
    63f8:	3100043f 	cmn	w1, #0x1
    63fc:	54fffea1 	b.ne	63d0 <wcrtomb+0x50>  // b.any
    6400:	b900027f 	str	wzr, [x19]
    6404:	52801141 	mov	w1, #0x8a                  	// #138
    6408:	b9000281 	str	w1, [x20]
    640c:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    6410:	a94153f3 	ldp	x19, x20, [sp, #16]
    6414:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6418:	d65f03c0 	ret
    641c:	d503201f 	nop

0000000000006420 <_wcsrtombs_r>:
    6420:	aa0403e5 	mov	x5, x4
    6424:	aa0303e4 	mov	x4, x3
    6428:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    642c:	14001315 	b	b080 <_wcsnrtombs_r>

0000000000006430 <wcsrtombs>:
    6430:	d0000026 	adrp	x6, c000 <__func__.0+0x28>
    6434:	aa0003e4 	mov	x4, x0
    6438:	aa0103e5 	mov	x5, x1
    643c:	aa0403e1 	mov	x1, x4
    6440:	f94438c0 	ldr	x0, [x6, #2160]
    6444:	aa0203e4 	mov	x4, x2
    6448:	aa0503e2 	mov	x2, x5
    644c:	aa0303e5 	mov	x5, x3
    6450:	92800003 	mov	x3, #0xffffffffffffffff    	// #-1
    6454:	1400130b 	b	b080 <_wcsnrtombs_r>
    6458:	d503201f 	nop
    645c:	d503201f 	nop

0000000000006460 <__swsetup_r>:
    6460:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6464:	d0000022 	adrp	x2, c000 <__func__.0+0x28>
    6468:	910003fd 	mov	x29, sp
    646c:	a90153f3 	stp	x19, x20, [sp, #16]
    6470:	aa0003f4 	mov	x20, x0
    6474:	aa0103f3 	mov	x19, x1
    6478:	f9443840 	ldr	x0, [x2, #2160]
    647c:	b4000060 	cbz	x0, 6488 <__swsetup_r+0x28>
    6480:	b9405001 	ldr	w1, [x0, #80]
    6484:	340004e1 	cbz	w1, 6520 <__swsetup_r+0xc0>
    6488:	79c02262 	ldrsh	w2, [x19, #16]
    648c:	12003c41 	and	w1, w2, #0xffff
    6490:	36180502 	tbz	w2, #3, 6530 <__swsetup_r+0xd0>
    6494:	f9400e63 	ldr	x3, [x19, #24]
    6498:	b40002c3 	cbz	x3, 64f0 <__swsetup_r+0x90>
    649c:	36000141 	tbz	w1, #0, 64c4 <__swsetup_r+0x64>
    64a0:	b9402260 	ldr	w0, [x19, #32]
    64a4:	b9000e7f 	str	wzr, [x19, #12]
    64a8:	4b0003e0 	neg	w0, w0
    64ac:	b9002a60 	str	w0, [x19, #40]
    64b0:	52800000 	mov	w0, #0x0                   	// #0
    64b4:	b4000143 	cbz	x3, 64dc <__swsetup_r+0x7c>
    64b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    64bc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    64c0:	d65f03c0 	ret
    64c4:	52800000 	mov	w0, #0x0                   	// #0
    64c8:	37080041 	tbnz	w1, #1, 64d0 <__swsetup_r+0x70>
    64cc:	b9402260 	ldr	w0, [x19, #32]
    64d0:	b9000e60 	str	w0, [x19, #12]
    64d4:	52800000 	mov	w0, #0x0                   	// #0
    64d8:	b5ffff03 	cbnz	x3, 64b8 <__swsetup_r+0x58>
    64dc:	363ffee1 	tbz	w1, #7, 64b8 <__swsetup_r+0x58>
    64e0:	321a0042 	orr	w2, w2, #0x40
    64e4:	12800000 	mov	w0, #0xffffffff            	// #-1
    64e8:	79002262 	strh	w2, [x19, #16]
    64ec:	17fffff3 	b	64b8 <__swsetup_r+0x58>
    64f0:	52805000 	mov	w0, #0x280                 	// #640
    64f4:	0a000020 	and	w0, w1, w0
    64f8:	7108001f 	cmp	w0, #0x200
    64fc:	54fffd00 	b.eq	649c <__swsetup_r+0x3c>  // b.none
    6500:	aa1303e1 	mov	x1, x19
    6504:	aa1403e0 	mov	x0, x20
    6508:	9400085a 	bl	8670 <__smakebuf_r>
    650c:	79c02262 	ldrsh	w2, [x19, #16]
    6510:	f9400e63 	ldr	x3, [x19, #24]
    6514:	12003c41 	and	w1, w2, #0xffff
    6518:	3607fd61 	tbz	w1, #0, 64c4 <__swsetup_r+0x64>
    651c:	17ffffe1 	b	64a0 <__swsetup_r+0x40>
    6520:	940001e0 	bl	6ca0 <__sinit>
    6524:	79c02262 	ldrsh	w2, [x19, #16]
    6528:	12003c41 	and	w1, w2, #0xffff
    652c:	371ffb42 	tbnz	w2, #3, 6494 <__swsetup_r+0x34>
    6530:	362002e1 	tbz	w1, #4, 658c <__swsetup_r+0x12c>
    6534:	371000e1 	tbnz	w1, #2, 6550 <__swsetup_r+0xf0>
    6538:	f9400e63 	ldr	x3, [x19, #24]
    653c:	321d0042 	orr	w2, w2, #0x8
    6540:	79002262 	strh	w2, [x19, #16]
    6544:	12003c41 	and	w1, w2, #0xffff
    6548:	b5fffaa3 	cbnz	x3, 649c <__swsetup_r+0x3c>
    654c:	17ffffe9 	b	64f0 <__swsetup_r+0x90>
    6550:	f9402e61 	ldr	x1, [x19, #88]
    6554:	b4000101 	cbz	x1, 6574 <__swsetup_r+0x114>
    6558:	9101d260 	add	x0, x19, #0x74
    655c:	eb00003f 	cmp	x1, x0
    6560:	54000080 	b.eq	6570 <__swsetup_r+0x110>  // b.none
    6564:	aa1403e0 	mov	x0, x20
    6568:	940002a6 	bl	7000 <_free_r>
    656c:	79c02262 	ldrsh	w2, [x19, #16]
    6570:	f9002e7f 	str	xzr, [x19, #88]
    6574:	f9400e63 	ldr	x3, [x19, #24]
    6578:	12800480 	mov	w0, #0xffffffdb            	// #-37
    657c:	0a000042 	and	w2, w2, w0
    6580:	f9000263 	str	x3, [x19]
    6584:	b9000a7f 	str	wzr, [x19, #8]
    6588:	17ffffed 	b	653c <__swsetup_r+0xdc>
    658c:	52800120 	mov	w0, #0x9                   	// #9
    6590:	b9000280 	str	w0, [x20]
    6594:	321a0042 	orr	w2, w2, #0x40
    6598:	12800000 	mov	w0, #0xffffffff            	// #-1
    659c:	79002262 	strh	w2, [x19, #16]
    65a0:	17ffffc6 	b	64b8 <__swsetup_r+0x58>
    65a4:	d503201f 	nop
    65a8:	d503201f 	nop
    65ac:	d503201f 	nop

00000000000065b0 <abort>:
    65b0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    65b4:	528000c0 	mov	w0, #0x6                   	// #6
    65b8:	910003fd 	mov	x29, sp
    65bc:	94000ec1 	bl	a0c0 <raise>
    65c0:	52800020 	mov	w0, #0x1                   	// #1
    65c4:	97fff5bb 	bl	3cb0 <_exit>
    65c8:	d503201f 	nop
    65cc:	d503201f 	nop

00000000000065d0 <__register_exitproc>:
    65d0:	d0000024 	adrp	x4, c000 <__func__.0+0x28>
    65d4:	f940d484 	ldr	x4, [x4, #424]
    65d8:	f940fc85 	ldr	x5, [x4, #504]
    65dc:	b4000405 	cbz	x5, 665c <__register_exitproc+0x8c>
    65e0:	b94008a4 	ldr	w4, [x5, #8]
    65e4:	71007c9f 	cmp	w4, #0x1f
    65e8:	5400040c 	b.gt	6668 <__register_exitproc+0x98>
    65ec:	93407c86 	sxtw	x6, w4
    65f0:	350000e0 	cbnz	w0, 660c <__register_exitproc+0x3c>
    65f4:	910008c2 	add	x2, x6, #0x2
    65f8:	11000484 	add	w4, w4, #0x1
    65fc:	b90008a4 	str	w4, [x5, #8]
    6600:	52800000 	mov	w0, #0x0                   	// #0
    6604:	f82278a1 	str	x1, [x5, x2, lsl #3]
    6608:	d65f03c0 	ret
    660c:	8b24cca7 	add	x7, x5, w4, sxtw #3
    6610:	52800028 	mov	w8, #0x1                   	// #1
    6614:	1ac42108 	lsl	w8, w8, w4
    6618:	93407c86 	sxtw	x6, w4
    661c:	f90088e2 	str	x2, [x7, #272]
    6620:	b94310a2 	ldr	w2, [x5, #784]
    6624:	2a080042 	orr	w2, w2, w8
    6628:	b90310a2 	str	w2, [x5, #784]
    662c:	f90108e3 	str	x3, [x7, #528]
    6630:	7100081f 	cmp	w0, #0x2
    6634:	54fffe01 	b.ne	65f4 <__register_exitproc+0x24>  // b.any
    6638:	b94314a0 	ldr	w0, [x5, #788]
    663c:	910008c2 	add	x2, x6, #0x2
    6640:	11000484 	add	w4, w4, #0x1
    6644:	b90008a4 	str	w4, [x5, #8]
    6648:	2a080008 	orr	w8, w0, w8
    664c:	b90314a8 	str	w8, [x5, #788]
    6650:	52800000 	mov	w0, #0x0                   	// #0
    6654:	f82278a1 	str	x1, [x5, x2, lsl #3]
    6658:	17ffffec 	b	6608 <__register_exitproc+0x38>
    665c:	91080085 	add	x5, x4, #0x200
    6660:	f900fc85 	str	x5, [x4, #504]
    6664:	17ffffdf 	b	65e0 <__register_exitproc+0x10>
    6668:	12800000 	mov	w0, #0xffffffff            	// #-1
    666c:	d65f03c0 	ret

0000000000006670 <__sflush_r>:
    6670:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6674:	910003fd 	mov	x29, sp
    6678:	a9025bf5 	stp	x21, x22, [sp, #32]
    667c:	aa0003f6 	mov	x22, x0
    6680:	79c02020 	ldrsh	w0, [x1, #16]
    6684:	a90153f3 	stp	x19, x20, [sp, #16]
    6688:	aa0103f3 	mov	x19, x1
    668c:	37180560 	tbnz	w0, #3, 6738 <__sflush_r+0xc8>
    6690:	32150000 	orr	w0, w0, #0x800
    6694:	79002020 	strh	w0, [x1, #16]
    6698:	b9400821 	ldr	w1, [x1, #8]
    669c:	7100003f 	cmp	w1, #0x0
    66a0:	5400092d 	b.le	67c4 <__sflush_r+0x154>
    66a4:	f9402664 	ldr	x4, [x19, #72]
    66a8:	b4000944 	cbz	x4, 67d0 <__sflush_r+0x160>
    66ac:	b94002d4 	ldr	w20, [x22]
    66b0:	12003c01 	and	w1, w0, #0xffff
    66b4:	b90002df 	str	wzr, [x22]
    66b8:	37600960 	tbnz	w0, #12, 67e4 <__sflush_r+0x174>
    66bc:	f9401a61 	ldr	x1, [x19, #48]
    66c0:	d2800002 	mov	x2, #0x0                   	// #0
    66c4:	aa1603e0 	mov	x0, x22
    66c8:	52800023 	mov	w3, #0x1                   	// #1
    66cc:	d63f0080 	blr	x4
    66d0:	aa0003e2 	mov	x2, x0
    66d4:	b100041f 	cmn	x0, #0x1
    66d8:	54000d00 	b.eq	6878 <__sflush_r+0x208>  // b.none
    66dc:	79402261 	ldrh	w1, [x19, #16]
    66e0:	f9402664 	ldr	x4, [x19, #72]
    66e4:	361000e1 	tbz	w1, #2, 6700 <__sflush_r+0x90>
    66e8:	f9402e60 	ldr	x0, [x19, #88]
    66ec:	b9800a61 	ldrsw	x1, [x19, #8]
    66f0:	cb010042 	sub	x2, x2, x1
    66f4:	b4000060 	cbz	x0, 6700 <__sflush_r+0x90>
    66f8:	b9807260 	ldrsw	x0, [x19, #112]
    66fc:	cb000042 	sub	x2, x2, x0
    6700:	f9401a61 	ldr	x1, [x19, #48]
    6704:	aa1603e0 	mov	x0, x22
    6708:	52800003 	mov	w3, #0x0                   	// #0
    670c:	d63f0080 	blr	x4
    6710:	b100041f 	cmn	x0, #0x1
    6714:	540006c1 	b.ne	67ec <__sflush_r+0x17c>  // b.any
    6718:	b94002c2 	ldr	w2, [x22]
    671c:	7100745f 	cmp	w2, #0x1d
    6720:	54000929 	b.ls	6844 <__sflush_r+0x1d4>  // b.plast
    6724:	79c02261 	ldrsh	w1, [x19, #16]
    6728:	321a0021 	orr	w1, w1, #0x40
    672c:	12800000 	mov	w0, #0xffffffff            	// #-1
    6730:	79002261 	strh	w1, [x19, #16]
    6734:	14000028 	b	67d4 <__sflush_r+0x164>
    6738:	f9400c35 	ldr	x21, [x1, #24]
    673c:	b40004b5 	cbz	x21, 67d0 <__sflush_r+0x160>
    6740:	12003c01 	and	w1, w0, #0xffff
    6744:	52800002 	mov	w2, #0x0                   	// #0
    6748:	f9400260 	ldr	x0, [x19]
    674c:	f9000275 	str	x21, [x19]
    6750:	cb150000 	sub	x0, x0, x21
    6754:	2a0003f4 	mov	w20, w0
    6758:	f240043f 	tst	x1, #0x3
    675c:	54000041 	b.ne	6764 <__sflush_r+0xf4>  // b.any
    6760:	b9402262 	ldr	w2, [x19, #32]
    6764:	b9000e62 	str	w2, [x19, #12]
    6768:	7100001f 	cmp	w0, #0x0
    676c:	540000ac 	b.gt	6780 <__sflush_r+0x110>
    6770:	14000018 	b	67d0 <__sflush_r+0x160>
    6774:	8b20c2b5 	add	x21, x21, w0, sxtw
    6778:	7100029f 	cmp	w20, #0x0
    677c:	540002ad 	b.le	67d0 <__sflush_r+0x160>
    6780:	f9401a61 	ldr	x1, [x19, #48]
    6784:	2a1403e3 	mov	w3, w20
    6788:	f9402264 	ldr	x4, [x19, #64]
    678c:	aa1503e2 	mov	x2, x21
    6790:	aa1603e0 	mov	x0, x22
    6794:	d63f0080 	blr	x4
    6798:	4b000294 	sub	w20, w20, w0
    679c:	7100001f 	cmp	w0, #0x0
    67a0:	54fffeac 	b.gt	6774 <__sflush_r+0x104>
    67a4:	79402261 	ldrh	w1, [x19, #16]
    67a8:	12800000 	mov	w0, #0xffffffff            	// #-1
    67ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    67b0:	321a0021 	orr	w1, w1, #0x40
    67b4:	79002261 	strh	w1, [x19, #16]
    67b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    67bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    67c0:	d65f03c0 	ret
    67c4:	b9407261 	ldr	w1, [x19, #112]
    67c8:	7100003f 	cmp	w1, #0x0
    67cc:	54fff6cc 	b.gt	66a4 <__sflush_r+0x34>
    67d0:	52800000 	mov	w0, #0x0                   	// #0
    67d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    67d8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    67dc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    67e0:	d65f03c0 	ret
    67e4:	f9404a62 	ldr	x2, [x19, #144]
    67e8:	17ffffbf 	b	66e4 <__sflush_r+0x74>
    67ec:	79c02261 	ldrsh	w1, [x19, #16]
    67f0:	f9400e62 	ldr	x2, [x19, #24]
    67f4:	12147821 	and	w1, w1, #0xfffff7ff
    67f8:	f9000262 	str	x2, [x19]
    67fc:	b9000a7f 	str	wzr, [x19, #8]
    6800:	79002261 	strh	w1, [x19, #16]
    6804:	36600041 	tbz	w1, #12, 680c <__sflush_r+0x19c>
    6808:	f9004a60 	str	x0, [x19, #144]
    680c:	f9402e61 	ldr	x1, [x19, #88]
    6810:	b90002d4 	str	w20, [x22]
    6814:	b4fffde1 	cbz	x1, 67d0 <__sflush_r+0x160>
    6818:	9101d260 	add	x0, x19, #0x74
    681c:	eb00003f 	cmp	x1, x0
    6820:	54000060 	b.eq	682c <__sflush_r+0x1bc>  // b.none
    6824:	aa1603e0 	mov	x0, x22
    6828:	940001f6 	bl	7000 <_free_r>
    682c:	f9002e7f 	str	xzr, [x19, #88]
    6830:	52800000 	mov	w0, #0x0                   	// #0
    6834:	a94153f3 	ldp	x19, x20, [sp, #16]
    6838:	a9425bf5 	ldp	x21, x22, [sp, #32]
    683c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6840:	d65f03c0 	ret
    6844:	d2800023 	mov	x3, #0x1                   	// #1
    6848:	79c02261 	ldrsh	w1, [x19, #16]
    684c:	f2a40803 	movk	x3, #0x2040, lsl #16
    6850:	9ac22463 	lsr	x3, x3, x2
    6854:	3607f6a3 	tbz	w3, #0, 6728 <__sflush_r+0xb8>
    6858:	f9400e63 	ldr	x3, [x19, #24]
    685c:	12147821 	and	w1, w1, #0xfffff7ff
    6860:	f9000263 	str	x3, [x19]
    6864:	b9000a7f 	str	wzr, [x19, #8]
    6868:	79002261 	strh	w1, [x19, #16]
    686c:	3667fd01 	tbz	w1, #12, 680c <__sflush_r+0x19c>
    6870:	35fffce2 	cbnz	w2, 680c <__sflush_r+0x19c>
    6874:	17ffffe5 	b	6808 <__sflush_r+0x198>
    6878:	b94002c0 	ldr	w0, [x22]
    687c:	34fff300 	cbz	w0, 66dc <__sflush_r+0x6c>
    6880:	7100741f 	cmp	w0, #0x1d
    6884:	7a561804 	ccmp	w0, #0x16, #0x4, ne  // ne = any
    6888:	54fff8e1 	b.ne	67a4 <__sflush_r+0x134>  // b.any
    688c:	52800000 	mov	w0, #0x0                   	// #0
    6890:	b90002d4 	str	w20, [x22]
    6894:	17ffffd0 	b	67d4 <__sflush_r+0x164>
    6898:	d503201f 	nop
    689c:	d503201f 	nop

00000000000068a0 <_fflush_r>:
    68a0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    68a4:	910003fd 	mov	x29, sp
    68a8:	f9000bf3 	str	x19, [sp, #16]
    68ac:	aa0003f3 	mov	x19, x0
    68b0:	b4000060 	cbz	x0, 68bc <_fflush_r+0x1c>
    68b4:	b9405002 	ldr	w2, [x0, #80]
    68b8:	340000e2 	cbz	w2, 68d4 <_fflush_r+0x34>
    68bc:	79c02020 	ldrsh	w0, [x1, #16]
    68c0:	35000140 	cbnz	w0, 68e8 <_fflush_r+0x48>
    68c4:	52800000 	mov	w0, #0x0                   	// #0
    68c8:	f9400bf3 	ldr	x19, [sp, #16]
    68cc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    68d0:	d65f03c0 	ret
    68d4:	f90017e1 	str	x1, [sp, #40]
    68d8:	940000f2 	bl	6ca0 <__sinit>
    68dc:	f94017e1 	ldr	x1, [sp, #40]
    68e0:	79c02020 	ldrsh	w0, [x1, #16]
    68e4:	34ffff00 	cbz	w0, 68c4 <_fflush_r+0x24>
    68e8:	aa1303e0 	mov	x0, x19
    68ec:	f9400bf3 	ldr	x19, [sp, #16]
    68f0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    68f4:	17ffff5f 	b	6670 <__sflush_r>
    68f8:	d503201f 	nop
    68fc:	d503201f 	nop

0000000000006900 <fflush>:
    6900:	b4000340 	cbz	x0, 6968 <fflush+0x68>
    6904:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    6908:	910003fd 	mov	x29, sp
    690c:	a90153f3 	stp	x19, x20, [sp, #16]
    6910:	aa0003f3 	mov	x19, x0
    6914:	d0000020 	adrp	x0, c000 <__func__.0+0x28>
    6918:	f9443814 	ldr	x20, [x0, #2160]
    691c:	b4000074 	cbz	x20, 6928 <fflush+0x28>
    6920:	b9405280 	ldr	w0, [x20, #80]
    6924:	34000180 	cbz	w0, 6954 <fflush+0x54>
    6928:	79c02260 	ldrsh	w0, [x19, #16]
    692c:	350000a0 	cbnz	w0, 6940 <fflush+0x40>
    6930:	52800000 	mov	w0, #0x0                   	// #0
    6934:	a94153f3 	ldp	x19, x20, [sp, #16]
    6938:	a8c27bfd 	ldp	x29, x30, [sp], #32
    693c:	d65f03c0 	ret
    6940:	aa1303e1 	mov	x1, x19
    6944:	aa1403e0 	mov	x0, x20
    6948:	a94153f3 	ldp	x19, x20, [sp, #16]
    694c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    6950:	17ffff48 	b	6670 <__sflush_r>
    6954:	aa1403e0 	mov	x0, x20
    6958:	940000d2 	bl	6ca0 <__sinit>
    695c:	79c02260 	ldrsh	w0, [x19, #16]
    6960:	34fffe80 	cbz	w0, 6930 <fflush+0x30>
    6964:	17fffff7 	b	6940 <fflush+0x40>
    6968:	d0000020 	adrp	x0, c000 <__func__.0+0x28>
    696c:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x1980>
    6970:	91228021 	add	x1, x1, #0x8a0
    6974:	f940d400 	ldr	x0, [x0, #424]
    6978:	140003b2 	b	7840 <_fwalk_reent>
    697c:	d503201f 	nop

0000000000006980 <__fp_lock>:
    6980:	52800000 	mov	w0, #0x0                   	// #0
    6984:	d65f03c0 	ret
    6988:	d503201f 	nop
    698c:	d503201f 	nop

0000000000006990 <_cleanup_r>:
    6990:	b0000021 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
    6994:	91168021 	add	x1, x1, #0x5a0
    6998:	140003aa 	b	7840 <_fwalk_reent>
    699c:	d503201f 	nop

00000000000069a0 <__fp_unlock>:
    69a0:	52800000 	mov	w0, #0x0                   	// #0
    69a4:	d65f03c0 	ret
    69a8:	d503201f 	nop
    69ac:	d503201f 	nop

00000000000069b0 <__sinit.part.0>:
    69b0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    69b4:	52800065 	mov	w5, #0x3                   	// #3
    69b8:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x1980>
    69bc:	910003fd 	mov	x29, sp
    69c0:	a9025bf5 	stp	x21, x22, [sp, #32]
    69c4:	aa0003f5 	mov	x21, x0
    69c8:	9114e2a4 	add	x4, x21, #0x538
    69cc:	a90153f3 	stp	x19, x20, [sp, #16]
    69d0:	91264020 	add	x0, x1, #0x990
    69d4:	52800083 	mov	w3, #0x4                   	// #4
    69d8:	f94006b3 	ldr	x19, [x21, #8]
    69dc:	a90363f7 	stp	x23, x24, [sp, #48]
    69e0:	d2800102 	mov	x2, #0x8                   	// #8
    69e4:	f90023f9 	str	x25, [sp, #64]
    69e8:	52800001 	mov	w1, #0x0                   	// #0
    69ec:	f9002ea0 	str	x0, [x21, #88]
    69f0:	91029260 	add	x0, x19, #0xa4
    69f4:	f90292bf 	str	xzr, [x21, #1312]
    69f8:	90000038 	adrp	x24, a000 <__sigtramp_r>
    69fc:	b9052aa5 	str	w5, [x21, #1320]
    6a00:	91100318 	add	x24, x24, #0x400
    6a04:	f9029aa4 	str	x4, [x21, #1328]
    6a08:	90000037 	adrp	x23, a000 <__sigtramp_r>
    6a0c:	a9007e7f 	stp	xzr, xzr, [x19]
    6a10:	9111c2f7 	add	x23, x23, #0x470
    6a14:	90000036 	adrp	x22, a000 <__sigtramp_r>
    6a18:	b9001263 	str	w3, [x19, #16]
    6a1c:	911302d6 	add	x22, x22, #0x4c0
    6a20:	f9000e7f 	str	xzr, [x19, #24]
    6a24:	90000039 	adrp	x25, a000 <__sigtramp_r>
    6a28:	b900227f 	str	wzr, [x19, #32]
    6a2c:	910e8339 	add	x25, x25, #0x3a0
    6a30:	b9002a7f 	str	wzr, [x19, #40]
    6a34:	b900ae7f 	str	wzr, [x19, #172]
    6a38:	97fff602 	bl	4240 <memset>
    6a3c:	f9400ab4 	ldr	x20, [x21, #16]
    6a40:	52800123 	mov	w3, #0x9                   	// #9
    6a44:	a9036673 	stp	x19, x25, [x19, #48]
    6a48:	72a00023 	movk	w3, #0x1, lsl #16
    6a4c:	91029280 	add	x0, x20, #0xa4
    6a50:	a9045e78 	stp	x24, x23, [x19, #64]
    6a54:	d2800102 	mov	x2, #0x8                   	// #8
    6a58:	52800001 	mov	w1, #0x0                   	// #0
    6a5c:	f9002a76 	str	x22, [x19, #80]
    6a60:	a9007e9f 	stp	xzr, xzr, [x20]
    6a64:	b9001283 	str	w3, [x20, #16]
    6a68:	f9000e9f 	str	xzr, [x20, #24]
    6a6c:	b900229f 	str	wzr, [x20, #32]
    6a70:	b9002a9f 	str	wzr, [x20, #40]
    6a74:	b900ae9f 	str	wzr, [x20, #172]
    6a78:	97fff5f2 	bl	4240 <memset>
    6a7c:	f9400eb3 	ldr	x19, [x21, #24]
    6a80:	52800243 	mov	w3, #0x12                  	// #18
    6a84:	a9036694 	stp	x20, x25, [x20, #48]
    6a88:	72a00043 	movk	w3, #0x2, lsl #16
    6a8c:	91029260 	add	x0, x19, #0xa4
    6a90:	a9045e98 	stp	x24, x23, [x20, #64]
    6a94:	d2800102 	mov	x2, #0x8                   	// #8
    6a98:	52800001 	mov	w1, #0x0                   	// #0
    6a9c:	f9002a96 	str	x22, [x20, #80]
    6aa0:	a9007e7f 	stp	xzr, xzr, [x19]
    6aa4:	b9001263 	str	w3, [x19, #16]
    6aa8:	f9000e7f 	str	xzr, [x19, #24]
    6aac:	b900227f 	str	wzr, [x19, #32]
    6ab0:	b9002a7f 	str	wzr, [x19, #40]
    6ab4:	b900ae7f 	str	wzr, [x19, #172]
    6ab8:	97fff5e2 	bl	4240 <memset>
    6abc:	a9036673 	stp	x19, x25, [x19, #48]
    6ac0:	52800020 	mov	w0, #0x1                   	// #1
    6ac4:	a9045e78 	stp	x24, x23, [x19, #64]
    6ac8:	f9002a76 	str	x22, [x19, #80]
    6acc:	a94153f3 	ldp	x19, x20, [sp, #16]
    6ad0:	a94363f7 	ldp	x23, x24, [sp, #48]
    6ad4:	f94023f9 	ldr	x25, [sp, #64]
    6ad8:	b90052a0 	str	w0, [x21, #80]
    6adc:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6ae0:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6ae4:	d65f03c0 	ret
    6ae8:	d503201f 	nop
    6aec:	d503201f 	nop

0000000000006af0 <__sfmoreglue>:
    6af0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6af4:	52801602 	mov	w2, #0xb0                  	// #176
    6af8:	910003fd 	mov	x29, sp
    6afc:	a90153f3 	stp	x19, x20, [sp, #16]
    6b00:	51000434 	sub	w20, w1, #0x1
    6b04:	f90013f5 	str	x21, [sp, #32]
    6b08:	2a0103f5 	mov	w21, w1
    6b0c:	9b227e94 	smull	x20, w20, w2
    6b10:	91032281 	add	x1, x20, #0xc8
    6b14:	9400075b 	bl	8880 <_malloc_r>
    6b18:	aa0003f3 	mov	x19, x0
    6b1c:	b4000100 	cbz	x0, 6b3c <__sfmoreglue+0x4c>
    6b20:	91006000 	add	x0, x0, #0x18
    6b24:	f900027f 	str	xzr, [x19]
    6b28:	b9000a75 	str	w21, [x19, #8]
    6b2c:	9102c282 	add	x2, x20, #0xb0
    6b30:	f9000a60 	str	x0, [x19, #16]
    6b34:	52800001 	mov	w1, #0x0                   	// #0
    6b38:	97fff5c2 	bl	4240 <memset>
    6b3c:	aa1303e0 	mov	x0, x19
    6b40:	a94153f3 	ldp	x19, x20, [sp, #16]
    6b44:	f94013f5 	ldr	x21, [sp, #32]
    6b48:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6b4c:	d65f03c0 	ret

0000000000006b50 <__sfp>:
    6b50:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    6b54:	d0000021 	adrp	x1, c000 <__func__.0+0x28>
    6b58:	910003fd 	mov	x29, sp
    6b5c:	a90153f3 	stp	x19, x20, [sp, #16]
    6b60:	f940d434 	ldr	x20, [x1, #424]
    6b64:	f9001fe0 	str	x0, [sp, #56]
    6b68:	f90013f5 	str	x21, [sp, #32]
    6b6c:	b9405280 	ldr	w0, [x20, #80]
    6b70:	34000560 	cbz	w0, 6c1c <__sfp+0xcc>
    6b74:	91148294 	add	x20, x20, #0x520
    6b78:	52800095 	mov	w21, #0x4                   	// #4
    6b7c:	b9400a80 	ldr	w0, [x20, #8]
    6b80:	f9400a93 	ldr	x19, [x20, #16]
    6b84:	7100001f 	cmp	w0, #0x0
    6b88:	5400042d 	b.le	6c0c <__sfp+0xbc>
    6b8c:	51000400 	sub	w0, w0, #0x1
    6b90:	91000400 	add	x0, x0, #0x1
    6b94:	8b000401 	add	x1, x0, x0, lsl #1
    6b98:	d37ef421 	lsl	x1, x1, #2
    6b9c:	cb000021 	sub	x1, x1, x0
    6ba0:	8b011261 	add	x1, x19, x1, lsl #4
    6ba4:	14000004 	b	6bb4 <__sfp+0x64>
    6ba8:	9102c273 	add	x19, x19, #0xb0
    6bac:	eb01027f 	cmp	x19, x1
    6bb0:	540002e0 	b.eq	6c0c <__sfp+0xbc>  // b.none
    6bb4:	79c02260 	ldrsh	w0, [x19, #16]
    6bb8:	35ffff80 	cbnz	w0, 6ba8 <__sfp+0x58>
    6bbc:	129fffc0 	mov	w0, #0xffff0001            	// #-65535
    6bc0:	a9007e7f 	stp	xzr, xzr, [x19]
    6bc4:	d2800102 	mov	x2, #0x8                   	// #8
    6bc8:	b9001260 	str	w0, [x19, #16]
    6bcc:	52800001 	mov	w1, #0x0                   	// #0
    6bd0:	f9000e7f 	str	xzr, [x19, #24]
    6bd4:	91029260 	add	x0, x19, #0xa4
    6bd8:	b900227f 	str	wzr, [x19, #32]
    6bdc:	b9002a7f 	str	wzr, [x19, #40]
    6be0:	b900ae7f 	str	wzr, [x19, #172]
    6be4:	97fff597 	bl	4240 <memset>
    6be8:	f9002e7f 	str	xzr, [x19, #88]
    6bec:	b900627f 	str	wzr, [x19, #96]
    6bf0:	f9003e7f 	str	xzr, [x19, #120]
    6bf4:	b900827f 	str	wzr, [x19, #128]
    6bf8:	aa1303e0 	mov	x0, x19
    6bfc:	a94153f3 	ldp	x19, x20, [sp, #16]
    6c00:	f94013f5 	ldr	x21, [sp, #32]
    6c04:	a8c47bfd 	ldp	x29, x30, [sp], #64
    6c08:	d65f03c0 	ret
    6c0c:	f9400293 	ldr	x19, [x20]
    6c10:	b40000d3 	cbz	x19, 6c28 <__sfp+0xd8>
    6c14:	aa1303f4 	mov	x20, x19
    6c18:	17ffffd9 	b	6b7c <__sfp+0x2c>
    6c1c:	aa1403e0 	mov	x0, x20
    6c20:	97ffff64 	bl	69b0 <__sinit.part.0>
    6c24:	17ffffd4 	b	6b74 <__sfp+0x24>
    6c28:	f9401fe0 	ldr	x0, [sp, #56]
    6c2c:	d2805b01 	mov	x1, #0x2d8                 	// #728
    6c30:	94000714 	bl	8880 <_malloc_r>
    6c34:	aa0003f3 	mov	x19, x0
    6c38:	b4000160 	cbz	x0, 6c64 <__sfp+0x114>
    6c3c:	91006000 	add	x0, x0, #0x18
    6c40:	f900027f 	str	xzr, [x19]
    6c44:	b9000a75 	str	w21, [x19, #8]
    6c48:	d2805802 	mov	x2, #0x2c0                 	// #704
    6c4c:	f9000a60 	str	x0, [x19, #16]
    6c50:	52800001 	mov	w1, #0x0                   	// #0
    6c54:	97fff57b 	bl	4240 <memset>
    6c58:	f9000293 	str	x19, [x20]
    6c5c:	aa1303f4 	mov	x20, x19
    6c60:	17ffffc7 	b	6b7c <__sfp+0x2c>
    6c64:	f9401fe1 	ldr	x1, [sp, #56]
    6c68:	f900029f 	str	xzr, [x20]
    6c6c:	52800180 	mov	w0, #0xc                   	// #12
    6c70:	b9000020 	str	w0, [x1]
    6c74:	17ffffe1 	b	6bf8 <__sfp+0xa8>
    6c78:	d503201f 	nop
    6c7c:	d503201f 	nop

0000000000006c80 <_cleanup>:
    6c80:	d0000020 	adrp	x0, c000 <__func__.0+0x28>
    6c84:	b0000021 	adrp	x1, b000 <_wcsnrtombs_l+0x130>
    6c88:	91168021 	add	x1, x1, #0x5a0
    6c8c:	f940d400 	ldr	x0, [x0, #424]
    6c90:	140002ec 	b	7840 <_fwalk_reent>
    6c94:	d503201f 	nop
    6c98:	d503201f 	nop
    6c9c:	d503201f 	nop

0000000000006ca0 <__sinit>:
    6ca0:	b9405001 	ldr	w1, [x0, #80]
    6ca4:	34000041 	cbz	w1, 6cac <__sinit+0xc>
    6ca8:	d65f03c0 	ret
    6cac:	17ffff41 	b	69b0 <__sinit.part.0>

0000000000006cb0 <__sfp_lock_acquire>:
    6cb0:	d65f03c0 	ret
    6cb4:	d503201f 	nop
    6cb8:	d503201f 	nop
    6cbc:	d503201f 	nop

0000000000006cc0 <__sfp_lock_release>:
    6cc0:	d65f03c0 	ret
    6cc4:	d503201f 	nop
    6cc8:	d503201f 	nop
    6ccc:	d503201f 	nop

0000000000006cd0 <__sinit_lock_acquire>:
    6cd0:	d65f03c0 	ret
    6cd4:	d503201f 	nop
    6cd8:	d503201f 	nop
    6cdc:	d503201f 	nop

0000000000006ce0 <__sinit_lock_release>:
    6ce0:	d65f03c0 	ret
    6ce4:	d503201f 	nop
    6ce8:	d503201f 	nop
    6cec:	d503201f 	nop

0000000000006cf0 <__fp_lock_all>:
    6cf0:	d0000020 	adrp	x0, c000 <__func__.0+0x28>
    6cf4:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x1980>
    6cf8:	91260021 	add	x1, x1, #0x980
    6cfc:	f9443800 	ldr	x0, [x0, #2160]
    6d00:	140002a8 	b	77a0 <_fwalk>
    6d04:	d503201f 	nop
    6d08:	d503201f 	nop
    6d0c:	d503201f 	nop

0000000000006d10 <__fp_unlock_all>:
    6d10:	d0000020 	adrp	x0, c000 <__func__.0+0x28>
    6d14:	90000001 	adrp	x1, 6000 <_vfiprintf_r+0x1980>
    6d18:	91268021 	add	x1, x1, #0x9a0
    6d1c:	f9443800 	ldr	x0, [x0, #2160]
    6d20:	140002a0 	b	77a0 <_fwalk>
    6d24:	d503201f 	nop
    6d28:	d503201f 	nop
    6d2c:	d503201f 	nop

0000000000006d30 <__fputwc>:
    6d30:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    6d34:	910003fd 	mov	x29, sp
    6d38:	a90153f3 	stp	x19, x20, [sp, #16]
    6d3c:	aa0203f3 	mov	x19, x2
    6d40:	a9025bf5 	stp	x21, x22, [sp, #32]
    6d44:	2a0103f6 	mov	w22, w1
    6d48:	a90363f7 	stp	x23, x24, [sp, #48]
    6d4c:	aa0003f7 	mov	x23, x0
    6d50:	9400062c 	bl	8600 <__locale_mb_cur_max>
    6d54:	7100041f 	cmp	w0, #0x1
    6d58:	54000081 	b.ne	6d68 <__fputwc+0x38>  // b.any
    6d5c:	510006c0 	sub	w0, w22, #0x1
    6d60:	7103f81f 	cmp	w0, #0xfe
    6d64:	54000509 	b.ls	6e04 <__fputwc+0xd4>  // b.plast
    6d68:	91029263 	add	x3, x19, #0xa4
    6d6c:	2a1603e2 	mov	w2, w22
    6d70:	910123e1 	add	x1, sp, #0x48
    6d74:	aa1703e0 	mov	x0, x23
    6d78:	97fffd5e 	bl	62f0 <_wcrtomb_r>
    6d7c:	aa0003f5 	mov	x21, x0
    6d80:	b100041f 	cmn	x0, #0x1
    6d84:	54000540 	b.eq	6e2c <__fputwc+0xfc>  // b.none
    6d88:	b4000460 	cbz	x0, 6e14 <__fputwc+0xe4>
    6d8c:	394123e1 	ldrb	w1, [sp, #72]
    6d90:	910123f8 	add	x24, sp, #0x48
    6d94:	d2800014 	mov	x20, #0x0                   	// #0
    6d98:	14000009 	b	6dbc <__fputwc+0x8c>
    6d9c:	f9400263 	ldr	x3, [x19]
    6da0:	91000464 	add	x4, x3, #0x1
    6da4:	f9000264 	str	x4, [x19]
    6da8:	39000061 	strb	w1, [x3]
    6dac:	91000694 	add	x20, x20, #0x1
    6db0:	eb15029f 	cmp	x20, x21
    6db4:	54000302 	b.cs	6e14 <__fputwc+0xe4>  // b.hs, b.nlast
    6db8:	38786a81 	ldrb	w1, [x20, x24]
    6dbc:	b9400e63 	ldr	w3, [x19, #12]
    6dc0:	51000463 	sub	w3, w3, #0x1
    6dc4:	b9000e63 	str	w3, [x19, #12]
    6dc8:	36fffea3 	tbz	w3, #31, 6d9c <__fputwc+0x6c>
    6dcc:	b9402a64 	ldr	w4, [x19, #40]
    6dd0:	aa1303e2 	mov	x2, x19
    6dd4:	aa1703e0 	mov	x0, x23
    6dd8:	6b04007f 	cmp	w3, w4
    6ddc:	7a4aa824 	ccmp	w1, #0xa, #0x4, ge  // ge = tcont
    6de0:	54fffde1 	b.ne	6d9c <__fputwc+0x6c>  // b.any
    6de4:	94000fe3 	bl	ad70 <__swbuf_r>
    6de8:	3100041f 	cmn	w0, #0x1
    6dec:	54fffe01 	b.ne	6dac <__fputwc+0x7c>  // b.any
    6df0:	a94153f3 	ldp	x19, x20, [sp, #16]
    6df4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6df8:	a94363f7 	ldp	x23, x24, [sp, #48]
    6dfc:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6e00:	d65f03c0 	ret
    6e04:	12001ec1 	and	w1, w22, #0xff
    6e08:	d2800035 	mov	x21, #0x1                   	// #1
    6e0c:	390123e1 	strb	w1, [sp, #72]
    6e10:	17ffffe0 	b	6d90 <__fputwc+0x60>
    6e14:	2a1603e0 	mov	w0, w22
    6e18:	a94153f3 	ldp	x19, x20, [sp, #16]
    6e1c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6e20:	a94363f7 	ldp	x23, x24, [sp, #48]
    6e24:	a8c57bfd 	ldp	x29, x30, [sp], #80
    6e28:	d65f03c0 	ret
    6e2c:	79402261 	ldrh	w1, [x19, #16]
    6e30:	321a0021 	orr	w1, w1, #0x40
    6e34:	79002261 	strh	w1, [x19, #16]
    6e38:	17ffffee 	b	6df0 <__fputwc+0xc0>
    6e3c:	d503201f 	nop

0000000000006e40 <_fputwc_r>:
    6e40:	79c02043 	ldrsh	w3, [x2, #16]
    6e44:	376800c3 	tbnz	w3, #13, 6e5c <_fputwc_r+0x1c>
    6e48:	b940ac44 	ldr	w4, [x2, #172]
    6e4c:	32130063 	orr	w3, w3, #0x2000
    6e50:	79002043 	strh	w3, [x2, #16]
    6e54:	32130083 	orr	w3, w4, #0x2000
    6e58:	b900ac43 	str	w3, [x2, #172]
    6e5c:	17ffffb5 	b	6d30 <__fputwc>

0000000000006e60 <fputwc>:
    6e60:	d0000023 	adrp	x3, c000 <__func__.0+0x28>
    6e64:	aa0103e2 	mov	x2, x1
    6e68:	2a0003e1 	mov	w1, w0
    6e6c:	f9443860 	ldr	x0, [x3, #2160]
    6e70:	b4000060 	cbz	x0, 6e7c <fputwc+0x1c>
    6e74:	b9405003 	ldr	w3, [x0, #80]
    6e78:	34000123 	cbz	w3, 6e9c <fputwc+0x3c>
    6e7c:	79c02043 	ldrsh	w3, [x2, #16]
    6e80:	376800c3 	tbnz	w3, #13, 6e98 <fputwc+0x38>
    6e84:	b940ac44 	ldr	w4, [x2, #172]
    6e88:	32130063 	orr	w3, w3, #0x2000
    6e8c:	79002043 	strh	w3, [x2, #16]
    6e90:	32130083 	orr	w3, w4, #0x2000
    6e94:	b900ac43 	str	w3, [x2, #172]
    6e98:	17ffffa6 	b	6d30 <__fputwc>
    6e9c:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6ea0:	910003fd 	mov	x29, sp
    6ea4:	f9000fe0 	str	x0, [sp, #24]
    6ea8:	b90027e1 	str	w1, [sp, #36]
    6eac:	f90017e2 	str	x2, [sp, #40]
    6eb0:	97ffff7c 	bl	6ca0 <__sinit>
    6eb4:	f94017e2 	ldr	x2, [sp, #40]
    6eb8:	b94027e1 	ldr	w1, [sp, #36]
    6ebc:	f9400fe0 	ldr	x0, [sp, #24]
    6ec0:	79c02043 	ldrsh	w3, [x2, #16]
    6ec4:	376800c3 	tbnz	w3, #13, 6edc <fputwc+0x7c>
    6ec8:	b940ac44 	ldr	w4, [x2, #172]
    6ecc:	32130063 	orr	w3, w3, #0x2000
    6ed0:	79002043 	strh	w3, [x2, #16]
    6ed4:	32130083 	orr	w3, w4, #0x2000
    6ed8:	b900ac43 	str	w3, [x2, #172]
    6edc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6ee0:	17ffff94 	b	6d30 <__fputwc>
    6ee4:	d503201f 	nop
    6ee8:	d503201f 	nop
    6eec:	d503201f 	nop

0000000000006ef0 <_malloc_trim_r>:
    6ef0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    6ef4:	910003fd 	mov	x29, sp
    6ef8:	a9025bf5 	stp	x21, x22, [sp, #32]
    6efc:	f0000036 	adrp	x22, d000 <__global_locale+0x20>
    6f00:	910622d6 	add	x22, x22, #0x188
    6f04:	aa0003f5 	mov	x21, x0
    6f08:	a90153f3 	stp	x19, x20, [sp, #16]
    6f0c:	aa0103f3 	mov	x19, x1
    6f10:	94000a64 	bl	98a0 <__malloc_lock>
    6f14:	f9400ac0 	ldr	x0, [x22, #16]
    6f18:	f9400414 	ldr	x20, [x0, #8]
    6f1c:	927ef694 	and	x20, x20, #0xfffffffffffffffc
    6f20:	cb130293 	sub	x19, x20, x19
    6f24:	913f7e73 	add	x19, x19, #0xfdf
    6f28:	9274ce73 	and	x19, x19, #0xfffffffffffff000
    6f2c:	d1400673 	sub	x19, x19, #0x1, lsl #12
    6f30:	f13ffe7f 	cmp	x19, #0xfff
    6f34:	5400010d 	b.le	6f54 <_malloc_trim_r+0x64>
    6f38:	d2800001 	mov	x1, #0x0                   	// #0
    6f3c:	aa1503e0 	mov	x0, x21
    6f40:	94000bb0 	bl	9e00 <_sbrk_r>
    6f44:	f9400ac1 	ldr	x1, [x22, #16]
    6f48:	8b140021 	add	x1, x1, x20
    6f4c:	eb01001f 	cmp	x0, x1
    6f50:	54000100 	b.eq	6f70 <_malloc_trim_r+0x80>  // b.none
    6f54:	aa1503e0 	mov	x0, x21
    6f58:	94000a56 	bl	98b0 <__malloc_unlock>
    6f5c:	52800000 	mov	w0, #0x0                   	// #0
    6f60:	a94153f3 	ldp	x19, x20, [sp, #16]
    6f64:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6f68:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6f6c:	d65f03c0 	ret
    6f70:	cb1303e1 	neg	x1, x19
    6f74:	aa1503e0 	mov	x0, x21
    6f78:	94000ba2 	bl	9e00 <_sbrk_r>
    6f7c:	b100041f 	cmn	x0, #0x1
    6f80:	54000200 	b.eq	6fc0 <_malloc_trim_r+0xd0>  // b.none
    6f84:	f0000022 	adrp	x2, d000 <__global_locale+0x20>
    6f88:	cb130294 	sub	x20, x20, x19
    6f8c:	f9400ac3 	ldr	x3, [x22, #16]
    6f90:	b2400294 	orr	x20, x20, #0x1
    6f94:	b94d7841 	ldr	w1, [x2, #3448]
    6f98:	aa1503e0 	mov	x0, x21
    6f9c:	f9000474 	str	x20, [x3, #8]
    6fa0:	4b130033 	sub	w19, w1, w19
    6fa4:	b90d7853 	str	w19, [x2, #3448]
    6fa8:	94000a42 	bl	98b0 <__malloc_unlock>
    6fac:	52800020 	mov	w0, #0x1                   	// #1
    6fb0:	a94153f3 	ldp	x19, x20, [sp, #16]
    6fb4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    6fb8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    6fbc:	d65f03c0 	ret
    6fc0:	d2800001 	mov	x1, #0x0                   	// #0
    6fc4:	aa1503e0 	mov	x0, x21
    6fc8:	94000b8e 	bl	9e00 <_sbrk_r>
    6fcc:	f9400ac2 	ldr	x2, [x22, #16]
    6fd0:	cb020001 	sub	x1, x0, x2
    6fd4:	f1007c3f 	cmp	x1, #0x1f
    6fd8:	54fffbed 	b.le	6f54 <_malloc_trim_r+0x64>
    6fdc:	f0000024 	adrp	x4, d000 <__global_locale+0x20>
    6fe0:	b2400021 	orr	x1, x1, #0x1
    6fe4:	f9000441 	str	x1, [x2, #8]
    6fe8:	f0000023 	adrp	x3, d000 <__global_locale+0x20>
    6fec:	f944cc81 	ldr	x1, [x4, #2456]
    6ff0:	cb010000 	sub	x0, x0, x1
    6ff4:	b90d7860 	str	w0, [x3, #3448]
    6ff8:	17ffffd7 	b	6f54 <_malloc_trim_r+0x64>
    6ffc:	d503201f 	nop

0000000000007000 <_free_r>:
    7000:	b4000a21 	cbz	x1, 7144 <_free_r+0x144>
    7004:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    7008:	910003fd 	mov	x29, sp
    700c:	a90153f3 	stp	x19, x20, [sp, #16]
    7010:	aa0103f3 	mov	x19, x1
    7014:	aa0003f4 	mov	x20, x0
    7018:	94000a22 	bl	98a0 <__malloc_lock>
    701c:	f85f8265 	ldur	x5, [x19, #-8]
    7020:	d1004263 	sub	x3, x19, #0x10
    7024:	d0000020 	adrp	x0, d000 <__global_locale+0x20>
    7028:	91062000 	add	x0, x0, #0x188
    702c:	927ff8a2 	and	x2, x5, #0xfffffffffffffffe
    7030:	8b020064 	add	x4, x3, x2
    7034:	f9400806 	ldr	x6, [x0, #16]
    7038:	f9400481 	ldr	x1, [x4, #8]
    703c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    7040:	eb0400df 	cmp	x6, x4
    7044:	54000c60 	b.eq	71d0 <_free_r+0x1d0>  // b.none
    7048:	f9000481 	str	x1, [x4, #8]
    704c:	8b010086 	add	x6, x4, x1
    7050:	37000345 	tbnz	w5, #0, 70b8 <_free_r+0xb8>
    7054:	f85f0267 	ldur	x7, [x19, #-16]
    7058:	d0000025 	adrp	x5, d000 <__global_locale+0x20>
    705c:	f94004c6 	ldr	x6, [x6, #8]
    7060:	cb070063 	sub	x3, x3, x7
    7064:	8b070042 	add	x2, x2, x7
    7068:	910660a5 	add	x5, x5, #0x198
    706c:	924000c6 	and	x6, x6, #0x1
    7070:	f9400867 	ldr	x7, [x3, #16]
    7074:	eb0500ff 	cmp	x7, x5
    7078:	54000940 	b.eq	71a0 <_free_r+0x1a0>  // b.none
    707c:	f9400c68 	ldr	x8, [x3, #24]
    7080:	f9000ce8 	str	x8, [x7, #24]
    7084:	f9000907 	str	x7, [x8, #16]
    7088:	b50001c6 	cbnz	x6, 70c0 <_free_r+0xc0>
    708c:	8b010042 	add	x2, x2, x1
    7090:	f9400881 	ldr	x1, [x4, #16]
    7094:	b2400046 	orr	x6, x2, #0x1
    7098:	eb05003f 	cmp	x1, x5
    709c:	54000ee0 	b.eq	7278 <_free_r+0x278>  // b.none
    70a0:	f9400c84 	ldr	x4, [x4, #24]
    70a4:	f9000c24 	str	x4, [x1, #24]
    70a8:	f9000881 	str	x1, [x4, #16]
    70ac:	f9000466 	str	x6, [x3, #8]
    70b0:	f8226862 	str	x2, [x3, x2]
    70b4:	14000006 	b	70cc <_free_r+0xcc>
    70b8:	f94004c5 	ldr	x5, [x6, #8]
    70bc:	36000465 	tbz	w5, #0, 7148 <_free_r+0x148>
    70c0:	b2400041 	orr	x1, x2, #0x1
    70c4:	f9000461 	str	x1, [x3, #8]
    70c8:	f9000082 	str	x2, [x4]
    70cc:	f107fc5f 	cmp	x2, #0x1ff
    70d0:	54000449 	b.ls	7158 <_free_r+0x158>  // b.plast
    70d4:	d349fc41 	lsr	x1, x2, #9
    70d8:	f127fc5f 	cmp	x2, #0x9ff
    70dc:	54000a28 	b.hi	7220 <_free_r+0x220>  // b.pmore
    70e0:	d346fc41 	lsr	x1, x2, #6
    70e4:	1100e424 	add	w4, w1, #0x39
    70e8:	1100e025 	add	w5, w1, #0x38
    70ec:	531f7884 	lsl	w4, w4, #1
    70f0:	937d7c84 	sbfiz	x4, x4, #3, #32
    70f4:	8b040004 	add	x4, x0, x4
    70f8:	f85f0481 	ldr	x1, [x4], #-16
    70fc:	eb01009f 	cmp	x4, x1
    7100:	54000ae0 	b.eq	725c <_free_r+0x25c>  // b.none
    7104:	d503201f 	nop
    7108:	f9400420 	ldr	x0, [x1, #8]
    710c:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    7110:	eb02001f 	cmp	x0, x2
    7114:	54000089 	b.ls	7124 <_free_r+0x124>  // b.plast
    7118:	f9400821 	ldr	x1, [x1, #16]
    711c:	eb01009f 	cmp	x4, x1
    7120:	54ffff41 	b.ne	7108 <_free_r+0x108>  // b.any
    7124:	f9400c24 	ldr	x4, [x1, #24]
    7128:	a9011061 	stp	x1, x4, [x3, #16]
    712c:	aa1403e0 	mov	x0, x20
    7130:	f9000883 	str	x3, [x4, #16]
    7134:	f9000c23 	str	x3, [x1, #24]
    7138:	a94153f3 	ldp	x19, x20, [sp, #16]
    713c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    7140:	140009dc 	b	98b0 <__malloc_unlock>
    7144:	d65f03c0 	ret
    7148:	d0000025 	adrp	x5, d000 <__global_locale+0x20>
    714c:	8b010042 	add	x2, x2, x1
    7150:	910660a5 	add	x5, x5, #0x198
    7154:	17ffffcf 	b	7090 <_free_r+0x90>
    7158:	d343fc42 	lsr	x2, x2, #3
    715c:	d2800024 	mov	x4, #0x1                   	// #1
    7160:	11000441 	add	w1, w2, #0x1
    7164:	f9400405 	ldr	x5, [x0, #8]
    7168:	531f7821 	lsl	w1, w1, #1
    716c:	13027c42 	asr	w2, w2, #2
    7170:	8b21cc01 	add	x1, x0, w1, sxtw #3
    7174:	9ac22082 	lsl	x2, x4, x2
    7178:	aa050042 	orr	x2, x2, x5
    717c:	f9000402 	str	x2, [x0, #8]
    7180:	f85f0420 	ldr	x0, [x1], #-16
    7184:	a9010460 	stp	x0, x1, [x3, #16]
    7188:	f9000823 	str	x3, [x1, #16]
    718c:	f9000c03 	str	x3, [x0, #24]
    7190:	aa1403e0 	mov	x0, x20
    7194:	a94153f3 	ldp	x19, x20, [sp, #16]
    7198:	a8c27bfd 	ldp	x29, x30, [sp], #32
    719c:	140009c5 	b	98b0 <__malloc_unlock>
    71a0:	b50009c6 	cbnz	x6, 72d8 <_free_r+0x2d8>
    71a4:	a9410085 	ldp	x5, x0, [x4, #16]
    71a8:	8b020021 	add	x1, x1, x2
    71ac:	f9000ca0 	str	x0, [x5, #24]
    71b0:	b2400022 	orr	x2, x1, #0x1
    71b4:	f9000805 	str	x5, [x0, #16]
    71b8:	aa1403e0 	mov	x0, x20
    71bc:	f9000462 	str	x2, [x3, #8]
    71c0:	f8216861 	str	x1, [x3, x1]
    71c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    71c8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    71cc:	140009b9 	b	98b0 <__malloc_unlock>
    71d0:	8b010041 	add	x1, x2, x1
    71d4:	370000e5 	tbnz	w5, #0, 71f0 <_free_r+0x1f0>
    71d8:	f85f0262 	ldur	x2, [x19, #-16]
    71dc:	cb020063 	sub	x3, x3, x2
    71e0:	8b020021 	add	x1, x1, x2
    71e4:	a9410864 	ldp	x4, x2, [x3, #16]
    71e8:	f9000c82 	str	x2, [x4, #24]
    71ec:	f9000844 	str	x4, [x2, #16]
    71f0:	d0000022 	adrp	x2, d000 <__global_locale+0x20>
    71f4:	b2400024 	orr	x4, x1, #0x1
    71f8:	f9000464 	str	x4, [x3, #8]
    71fc:	f944d042 	ldr	x2, [x2, #2464]
    7200:	f9000803 	str	x3, [x0, #16]
    7204:	eb01005f 	cmp	x2, x1
    7208:	54fffc48 	b.hi	7190 <_free_r+0x190>  // b.pmore
    720c:	d0000021 	adrp	x1, d000 <__global_locale+0x20>
    7210:	aa1403e0 	mov	x0, x20
    7214:	f946d821 	ldr	x1, [x1, #3504]
    7218:	97ffff36 	bl	6ef0 <_malloc_trim_r>
    721c:	17ffffdd 	b	7190 <_free_r+0x190>
    7220:	f100503f 	cmp	x1, #0x14
    7224:	54000129 	b.ls	7248 <_free_r+0x248>  // b.plast
    7228:	f101503f 	cmp	x1, #0x54
    722c:	54000308 	b.hi	728c <_free_r+0x28c>  // b.pmore
    7230:	d34cfc41 	lsr	x1, x2, #12
    7234:	1101bc24 	add	w4, w1, #0x6f
    7238:	1101b825 	add	w5, w1, #0x6e
    723c:	531f7884 	lsl	w4, w4, #1
    7240:	937d7c84 	sbfiz	x4, x4, #3, #32
    7244:	17ffffac 	b	70f4 <_free_r+0xf4>
    7248:	11017024 	add	w4, w1, #0x5c
    724c:	11016c25 	add	w5, w1, #0x5b
    7250:	531f7884 	lsl	w4, w4, #1
    7254:	937d7c84 	sbfiz	x4, x4, #3, #32
    7258:	17ffffa7 	b	70f4 <_free_r+0xf4>
    725c:	f9400406 	ldr	x6, [x0, #8]
    7260:	13027ca5 	asr	w5, w5, #2
    7264:	d2800022 	mov	x2, #0x1                   	// #1
    7268:	9ac52045 	lsl	x5, x2, x5
    726c:	aa0600a5 	orr	x5, x5, x6
    7270:	f9000405 	str	x5, [x0, #8]
    7274:	17ffffad 	b	7128 <_free_r+0x128>
    7278:	a9020c03 	stp	x3, x3, [x0, #32]
    727c:	a9009466 	stp	x6, x5, [x3, #8]
    7280:	f9000c65 	str	x5, [x3, #24]
    7284:	f8226862 	str	x2, [x3, x2]
    7288:	17ffffc2 	b	7190 <_free_r+0x190>
    728c:	f105503f 	cmp	x1, #0x154
    7290:	540000e8 	b.hi	72ac <_free_r+0x2ac>  // b.pmore
    7294:	d34ffc41 	lsr	x1, x2, #15
    7298:	1101e024 	add	w4, w1, #0x78
    729c:	1101dc25 	add	w5, w1, #0x77
    72a0:	531f7884 	lsl	w4, w4, #1
    72a4:	937d7c84 	sbfiz	x4, x4, #3, #32
    72a8:	17ffff93 	b	70f4 <_free_r+0xf4>
    72ac:	f115503f 	cmp	x1, #0x554
    72b0:	540000e8 	b.hi	72cc <_free_r+0x2cc>  // b.pmore
    72b4:	d352fc41 	lsr	x1, x2, #18
    72b8:	1101f424 	add	w4, w1, #0x7d
    72bc:	1101f025 	add	w5, w1, #0x7c
    72c0:	531f7884 	lsl	w4, w4, #1
    72c4:	937d7c84 	sbfiz	x4, x4, #3, #32
    72c8:	17ffff8b 	b	70f4 <_free_r+0xf4>
    72cc:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    72d0:	52800fc5 	mov	w5, #0x7e                  	// #126
    72d4:	17ffff88 	b	70f4 <_free_r+0xf4>
    72d8:	b2400040 	orr	x0, x2, #0x1
    72dc:	f9000460 	str	x0, [x3, #8]
    72e0:	f9000082 	str	x2, [x4]
    72e4:	17ffffab 	b	7190 <_free_r+0x190>
    72e8:	d503201f 	nop
    72ec:	d503201f 	nop

00000000000072f0 <__sfvwrite_r>:
    72f0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    72f4:	910003fd 	mov	x29, sp
    72f8:	a90363f7 	stp	x23, x24, [sp, #48]
    72fc:	aa0003f7 	mov	x23, x0
    7300:	f9400840 	ldr	x0, [x2, #16]
    7304:	b4000460 	cbz	x0, 7390 <__sfvwrite_r+0xa0>
    7308:	79402023 	ldrh	w3, [x1, #16]
    730c:	aa0203f8 	mov	x24, x2
    7310:	a90153f3 	stp	x19, x20, [sp, #16]
    7314:	aa0103f3 	mov	x19, x1
    7318:	36180443 	tbz	w3, #3, 73a0 <__sfvwrite_r+0xb0>
    731c:	f9400c20 	ldr	x0, [x1, #24]
    7320:	b4000400 	cbz	x0, 73a0 <__sfvwrite_r+0xb0>
    7324:	a9025bf5 	stp	x21, x22, [sp, #32]
    7328:	a9046bf9 	stp	x25, x26, [sp, #64]
    732c:	f9400314 	ldr	x20, [x24]
    7330:	360804a3 	tbz	w3, #1, 73c4 <__sfvwrite_r+0xd4>
    7334:	d2800016 	mov	x22, #0x0                   	// #0
    7338:	d2800015 	mov	x21, #0x0                   	// #0
    733c:	b27653f9 	mov	x25, #0x7ffffc00            	// #2147482624
    7340:	eb1902bf 	cmp	x21, x25
    7344:	aa1603e2 	mov	x2, x22
    7348:	9a9992a3 	csel	x3, x21, x25, ls  // ls = plast
    734c:	aa1703e0 	mov	x0, x23
    7350:	b4000875 	cbz	x21, 745c <__sfvwrite_r+0x16c>
    7354:	f9401a61 	ldr	x1, [x19, #48]
    7358:	f9402264 	ldr	x4, [x19, #64]
    735c:	d63f0080 	blr	x4
    7360:	7100001f 	cmp	w0, #0x0
    7364:	5400206d 	b.le	7770 <__sfvwrite_r+0x480>
    7368:	f9400b01 	ldr	x1, [x24, #16]
    736c:	93407c00 	sxtw	x0, w0
    7370:	8b0002d6 	add	x22, x22, x0
    7374:	cb0002b5 	sub	x21, x21, x0
    7378:	cb000020 	sub	x0, x1, x0
    737c:	f9000b00 	str	x0, [x24, #16]
    7380:	b5fffe00 	cbnz	x0, 7340 <__sfvwrite_r+0x50>
    7384:	a94153f3 	ldp	x19, x20, [sp, #16]
    7388:	a9425bf5 	ldp	x21, x22, [sp, #32]
    738c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7390:	52800000 	mov	w0, #0x0                   	// #0
    7394:	a94363f7 	ldp	x23, x24, [sp, #48]
    7398:	a8c67bfd 	ldp	x29, x30, [sp], #96
    739c:	d65f03c0 	ret
    73a0:	aa1303e1 	mov	x1, x19
    73a4:	aa1703e0 	mov	x0, x23
    73a8:	97fffc2e 	bl	6460 <__swsetup_r>
    73ac:	35001f00 	cbnz	w0, 778c <__sfvwrite_r+0x49c>
    73b0:	79402263 	ldrh	w3, [x19, #16]
    73b4:	a9025bf5 	stp	x21, x22, [sp, #32]
    73b8:	a9046bf9 	stp	x25, x26, [sp, #64]
    73bc:	f9400314 	ldr	x20, [x24]
    73c0:	370ffba3 	tbnz	w3, #1, 7334 <__sfvwrite_r+0x44>
    73c4:	a90573fb 	stp	x27, x28, [sp, #80]
    73c8:	37000503 	tbnz	w3, #0, 7468 <__sfvwrite_r+0x178>
    73cc:	d280001c 	mov	x28, #0x0                   	// #0
    73d0:	d2800015 	mov	x21, #0x0                   	// #0
    73d4:	d503201f 	nop
    73d8:	b40003d5 	cbz	x21, 7450 <__sfvwrite_r+0x160>
    73dc:	f9400266 	ldr	x6, [x19]
    73e0:	b9400e7a 	ldr	w26, [x19, #12]
    73e4:	aa0603e0 	mov	x0, x6
    73e8:	36480ac3 	tbz	w3, #9, 7540 <__sfvwrite_r+0x250>
    73ec:	93407f5b 	sxtw	x27, w26
    73f0:	eb15037f 	cmp	x27, x21
    73f4:	540010c9 	b.ls	760c <__sfvwrite_r+0x31c>  // b.plast
    73f8:	93407ea1 	sxtw	x1, w21
    73fc:	aa0103f6 	mov	x22, x1
    7400:	aa0603e0 	mov	x0, x6
    7404:	aa0103fb 	mov	x27, x1
    7408:	2a1503fa 	mov	w26, w21
    740c:	aa1b03e2 	mov	x2, x27
    7410:	aa1c03e1 	mov	x1, x28
    7414:	97fff35b 	bl	4180 <memmove>
    7418:	f9400261 	ldr	x1, [x19]
    741c:	b9400e60 	ldr	w0, [x19, #12]
    7420:	8b1b0022 	add	x2, x1, x27
    7424:	f9000262 	str	x2, [x19]
    7428:	4b1a0000 	sub	w0, w0, w26
    742c:	b9000e60 	str	w0, [x19, #12]
    7430:	f9400b00 	ldr	x0, [x24, #16]
    7434:	8b16039c 	add	x28, x28, x22
    7438:	cb1602b5 	sub	x21, x21, x22
    743c:	cb160016 	sub	x22, x0, x22
    7440:	f9000b16 	str	x22, [x24, #16]
    7444:	b40005d6 	cbz	x22, 74fc <__sfvwrite_r+0x20c>
    7448:	79402263 	ldrh	w3, [x19, #16]
    744c:	b5fffc95 	cbnz	x21, 73dc <__sfvwrite_r+0xec>
    7450:	a940569c 	ldp	x28, x21, [x20]
    7454:	91004294 	add	x20, x20, #0x10
    7458:	17ffffe0 	b	73d8 <__sfvwrite_r+0xe8>
    745c:	a9405696 	ldp	x22, x21, [x20]
    7460:	91004294 	add	x20, x20, #0x10
    7464:	17ffffb7 	b	7340 <__sfvwrite_r+0x50>
    7468:	5280001a 	mov	w26, #0x0                   	// #0
    746c:	52800000 	mov	w0, #0x0                   	// #0
    7470:	d280001b 	mov	x27, #0x0                   	// #0
    7474:	d2800019 	mov	x25, #0x0                   	// #0
    7478:	b40004d9 	cbz	x25, 7510 <__sfvwrite_r+0x220>
    747c:	34000500 	cbz	w0, 751c <__sfvwrite_r+0x22c>
    7480:	f9400260 	ldr	x0, [x19]
    7484:	93407f56 	sxtw	x22, w26
    7488:	f9400e61 	ldr	x1, [x19, #24]
    748c:	eb1902df 	cmp	x22, x25
    7490:	b9400e75 	ldr	w21, [x19, #12]
    7494:	9a9992d6 	csel	x22, x22, x25, ls  // ls = plast
    7498:	b9402263 	ldr	w3, [x19, #32]
    749c:	eb01001f 	cmp	x0, x1
    74a0:	0b150075 	add	w21, w3, w21
    74a4:	7a5582c4 	ccmp	w22, w21, #0x4, hi  // hi = pmore
    74a8:	5400132c 	b.gt	770c <__sfvwrite_r+0x41c>
    74ac:	6b16007f 	cmp	w3, w22
    74b0:	5400116c 	b.gt	76dc <__sfvwrite_r+0x3ec>
    74b4:	f9401a61 	ldr	x1, [x19, #48]
    74b8:	aa1b03e2 	mov	x2, x27
    74bc:	f9402264 	ldr	x4, [x19, #64]
    74c0:	aa1703e0 	mov	x0, x23
    74c4:	d63f0080 	blr	x4
    74c8:	2a0003f5 	mov	w21, w0
    74cc:	7100001f 	cmp	w0, #0x0
    74d0:	5400088d 	b.le	75e0 <__sfvwrite_r+0x2f0>
    74d4:	6b15035a 	subs	w26, w26, w21
    74d8:	52800020 	mov	w0, #0x1                   	// #1
    74dc:	54000f60 	b.eq	76c8 <__sfvwrite_r+0x3d8>  // b.none
    74e0:	f9400b01 	ldr	x1, [x24, #16]
    74e4:	93407eb5 	sxtw	x21, w21
    74e8:	8b15037b 	add	x27, x27, x21
    74ec:	cb150339 	sub	x25, x25, x21
    74f0:	cb150035 	sub	x21, x1, x21
    74f4:	f9000b15 	str	x21, [x24, #16]
    74f8:	b5fffc15 	cbnz	x21, 7478 <__sfvwrite_r+0x188>
    74fc:	a94153f3 	ldp	x19, x20, [sp, #16]
    7500:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7504:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7508:	a94573fb 	ldp	x27, x28, [sp, #80]
    750c:	17ffffa1 	b	7390 <__sfvwrite_r+0xa0>
    7510:	a940669b 	ldp	x27, x25, [x20]
    7514:	91004294 	add	x20, x20, #0x10
    7518:	b4ffffd9 	cbz	x25, 7510 <__sfvwrite_r+0x220>
    751c:	aa1903e2 	mov	x2, x25
    7520:	aa1b03e0 	mov	x0, x27
    7524:	52800141 	mov	w1, #0xa                   	// #10
    7528:	940008a7 	bl	97c4 <memchr>
    752c:	9100041a 	add	x26, x0, #0x1
    7530:	f100001f 	cmp	x0, #0x0
    7534:	cb1b035a 	sub	x26, x26, x27
    7538:	1a99175a 	csinc	w26, w26, w25, ne  // ne = any
    753c:	17ffffd1 	b	7480 <__sfvwrite_r+0x190>
    7540:	f9400e60 	ldr	x0, [x19, #24]
    7544:	eb06001f 	cmp	x0, x6
    7548:	54000263 	b.cc	7594 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    754c:	b9402263 	ldr	w3, [x19, #32]
    7550:	eb23c2bf 	cmp	x21, w3, sxtw
    7554:	54000203 	b.cc	7594 <__sfvwrite_r+0x2a4>  // b.lo, b.ul, b.last
    7558:	b27f77e0 	mov	x0, #0x7ffffffe            	// #2147483646
    755c:	eb0002bf 	cmp	x21, x0
    7560:	b2407be0 	mov	x0, #0x7fffffff            	// #2147483647
    7564:	9a8092a4 	csel	x4, x21, x0, ls  // ls = plast
    7568:	f9401a61 	ldr	x1, [x19, #48]
    756c:	aa1c03e2 	mov	x2, x28
    7570:	1ac30c84 	sdiv	w4, w4, w3
    7574:	aa1703e0 	mov	x0, x23
    7578:	f9402266 	ldr	x6, [x19, #64]
    757c:	1b037c83 	mul	w3, w4, w3
    7580:	d63f00c0 	blr	x6
    7584:	7100001f 	cmp	w0, #0x0
    7588:	540002cd 	b.le	75e0 <__sfvwrite_r+0x2f0>
    758c:	93407c16 	sxtw	x22, w0
    7590:	17ffffa8 	b	7430 <__sfvwrite_r+0x140>
    7594:	93407f44 	sxtw	x4, w26
    7598:	aa1c03e1 	mov	x1, x28
    759c:	eb15009f 	cmp	x4, x21
    75a0:	aa0603e0 	mov	x0, x6
    75a4:	9a95909a 	csel	x26, x4, x21, ls  // ls = plast
    75a8:	93407f56 	sxtw	x22, w26
    75ac:	aa1603e2 	mov	x2, x22
    75b0:	97fff2f4 	bl	4180 <memmove>
    75b4:	f9400261 	ldr	x1, [x19]
    75b8:	b9400e60 	ldr	w0, [x19, #12]
    75bc:	8b160021 	add	x1, x1, x22
    75c0:	f9000261 	str	x1, [x19]
    75c4:	4b1a0004 	sub	w4, w0, w26
    75c8:	b9000e64 	str	w4, [x19, #12]
    75cc:	35fff324 	cbnz	w4, 7430 <__sfvwrite_r+0x140>
    75d0:	aa1303e1 	mov	x1, x19
    75d4:	aa1703e0 	mov	x0, x23
    75d8:	97fffcb2 	bl	68a0 <_fflush_r>
    75dc:	34fff2a0 	cbz	w0, 7430 <__sfvwrite_r+0x140>
    75e0:	a94573fb 	ldp	x27, x28, [sp, #80]
    75e4:	79c02261 	ldrsh	w1, [x19, #16]
    75e8:	321a0021 	orr	w1, w1, #0x40
    75ec:	79002261 	strh	w1, [x19, #16]
    75f0:	12800000 	mov	w0, #0xffffffff            	// #-1
    75f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    75f8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    75fc:	a94363f7 	ldp	x23, x24, [sp, #48]
    7600:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7604:	a8c67bfd 	ldp	x29, x30, [sp], #96
    7608:	d65f03c0 	ret
    760c:	93407eb6 	sxtw	x22, w21
    7610:	52809001 	mov	w1, #0x480                 	// #1152
    7614:	6a01007f 	tst	w3, w1
    7618:	54ffefa0 	b.eq	740c <__sfvwrite_r+0x11c>  // b.none
    761c:	b9402267 	ldr	w7, [x19, #32]
    7620:	f9400e61 	ldr	x1, [x19, #24]
    7624:	0b0704e7 	add	w7, w7, w7, lsl #1
    7628:	cb0100d6 	sub	x22, x6, x1
    762c:	0b477ce7 	add	w7, w7, w7, lsr #31
    7630:	93407ed9 	sxtw	x25, w22
    7634:	13017cfb 	asr	w27, w7, #1
    7638:	91000720 	add	x0, x25, #0x1
    763c:	8b150000 	add	x0, x0, x21
    7640:	93407f62 	sxtw	x2, w27
    7644:	eb00005f 	cmp	x2, x0
    7648:	54000082 	b.cs	7658 <__sfvwrite_r+0x368>  // b.hs, b.nlast
    764c:	110006c7 	add	w7, w22, #0x1
    7650:	0b1500fb 	add	w27, w7, w21
    7654:	93407f62 	sxtw	x2, w27
    7658:	36500723 	tbz	w3, #10, 773c <__sfvwrite_r+0x44c>
    765c:	aa0203e1 	mov	x1, x2
    7660:	aa1703e0 	mov	x0, x23
    7664:	94000487 	bl	8880 <_malloc_r>
    7668:	aa0003fa 	mov	x26, x0
    766c:	b4000860 	cbz	x0, 7778 <__sfvwrite_r+0x488>
    7670:	f9400e61 	ldr	x1, [x19, #24]
    7674:	aa1903e2 	mov	x2, x25
    7678:	97fff262 	bl	4000 <memcpy>
    767c:	79402260 	ldrh	w0, [x19, #16]
    7680:	12809001 	mov	w1, #0xfffffb7f            	// #-1153
    7684:	0a010000 	and	w0, w0, w1
    7688:	32190000 	orr	w0, w0, #0x80
    768c:	79002260 	strh	w0, [x19, #16]
    7690:	8b190340 	add	x0, x26, x25
    7694:	4b160366 	sub	w6, w27, w22
    7698:	93407eb6 	sxtw	x22, w21
    769c:	f9000260 	str	x0, [x19]
    76a0:	b9000e66 	str	w6, [x19, #12]
    76a4:	aa1603e1 	mov	x1, x22
    76a8:	f9000e7a 	str	x26, [x19, #24]
    76ac:	aa0003e6 	mov	x6, x0
    76b0:	b900227b 	str	w27, [x19, #32]
    76b4:	2a1503fa 	mov	w26, w21
    76b8:	eb1502df 	cmp	x22, x21
    76bc:	54ffea08 	b.hi	73fc <__sfvwrite_r+0x10c>  // b.pmore
    76c0:	aa1603fb 	mov	x27, x22
    76c4:	17ffff52 	b	740c <__sfvwrite_r+0x11c>
    76c8:	aa1303e1 	mov	x1, x19
    76cc:	aa1703e0 	mov	x0, x23
    76d0:	97fffc74 	bl	68a0 <_fflush_r>
    76d4:	34fff060 	cbz	w0, 74e0 <__sfvwrite_r+0x1f0>
    76d8:	17ffffc2 	b	75e0 <__sfvwrite_r+0x2f0>
    76dc:	93407edc 	sxtw	x28, w22
    76e0:	aa1b03e1 	mov	x1, x27
    76e4:	aa1c03e2 	mov	x2, x28
    76e8:	97fff2a6 	bl	4180 <memmove>
    76ec:	f9400260 	ldr	x0, [x19]
    76f0:	2a1603f5 	mov	w21, w22
    76f4:	b9400e61 	ldr	w1, [x19, #12]
    76f8:	8b1c0000 	add	x0, x0, x28
    76fc:	f9000260 	str	x0, [x19]
    7700:	4b160036 	sub	w22, w1, w22
    7704:	b9000e76 	str	w22, [x19, #12]
    7708:	17ffff73 	b	74d4 <__sfvwrite_r+0x1e4>
    770c:	93407eb6 	sxtw	x22, w21
    7710:	aa1b03e1 	mov	x1, x27
    7714:	aa1603e2 	mov	x2, x22
    7718:	97fff29a 	bl	4180 <memmove>
    771c:	f9400262 	ldr	x2, [x19]
    7720:	aa1303e1 	mov	x1, x19
    7724:	aa1703e0 	mov	x0, x23
    7728:	8b160042 	add	x2, x2, x22
    772c:	f9000262 	str	x2, [x19]
    7730:	97fffc5c 	bl	68a0 <_fflush_r>
    7734:	34ffed00 	cbz	w0, 74d4 <__sfvwrite_r+0x1e4>
    7738:	17ffffaa 	b	75e0 <__sfvwrite_r+0x2f0>
    773c:	aa1703e0 	mov	x0, x23
    7740:	94000860 	bl	98c0 <_realloc_r>
    7744:	aa0003fa 	mov	x26, x0
    7748:	b5fffa40 	cbnz	x0, 7690 <__sfvwrite_r+0x3a0>
    774c:	f9400e61 	ldr	x1, [x19, #24]
    7750:	aa1703e0 	mov	x0, x23
    7754:	97fffe2b 	bl	7000 <_free_r>
    7758:	79c02261 	ldrsh	w1, [x19, #16]
    775c:	52800180 	mov	w0, #0xc                   	// #12
    7760:	a94573fb 	ldp	x27, x28, [sp, #80]
    7764:	12187821 	and	w1, w1, #0xffffff7f
    7768:	b90002e0 	str	w0, [x23]
    776c:	17ffff9f 	b	75e8 <__sfvwrite_r+0x2f8>
    7770:	79c02261 	ldrsh	w1, [x19, #16]
    7774:	17ffff9d 	b	75e8 <__sfvwrite_r+0x2f8>
    7778:	79c02261 	ldrsh	w1, [x19, #16]
    777c:	52800180 	mov	w0, #0xc                   	// #12
    7780:	a94573fb 	ldp	x27, x28, [sp, #80]
    7784:	b90002e0 	str	w0, [x23]
    7788:	17ffff98 	b	75e8 <__sfvwrite_r+0x2f8>
    778c:	12800000 	mov	w0, #0xffffffff            	// #-1
    7790:	a94153f3 	ldp	x19, x20, [sp, #16]
    7794:	17ffff00 	b	7394 <__sfvwrite_r+0xa4>
    7798:	d503201f 	nop
    779c:	d503201f 	nop

00000000000077a0 <_fwalk>:
    77a0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    77a4:	910003fd 	mov	x29, sp
    77a8:	a9025bf5 	stp	x21, x22, [sp, #32]
    77ac:	91148015 	add	x21, x0, #0x520
    77b0:	aa0103f6 	mov	x22, x1
    77b4:	a90153f3 	stp	x19, x20, [sp, #16]
    77b8:	f9001bf7 	str	x23, [sp, #48]
    77bc:	52800017 	mov	w23, #0x0                   	// #0
    77c0:	b9400aa0 	ldr	w0, [x21, #8]
    77c4:	f9400ab3 	ldr	x19, [x21, #16]
    77c8:	7100001f 	cmp	w0, #0x0
    77cc:	5400026d 	b.le	7818 <_fwalk+0x78>
    77d0:	51000400 	sub	w0, w0, #0x1
    77d4:	91000400 	add	x0, x0, #0x1
    77d8:	8b000414 	add	x20, x0, x0, lsl #1
    77dc:	d37ef694 	lsl	x20, x20, #2
    77e0:	cb000294 	sub	x20, x20, x0
    77e4:	8b141274 	add	x20, x19, x20, lsl #4
    77e8:	79402260 	ldrh	w0, [x19, #16]
    77ec:	7100041f 	cmp	w0, #0x1
    77f0:	540000e9 	b.ls	780c <_fwalk+0x6c>  // b.plast
    77f4:	79c02662 	ldrsh	w2, [x19, #18]
    77f8:	aa1303e0 	mov	x0, x19
    77fc:	3100045f 	cmn	w2, #0x1
    7800:	54000060 	b.eq	780c <_fwalk+0x6c>  // b.none
    7804:	d63f02c0 	blr	x22
    7808:	2a0002f7 	orr	w23, w23, w0
    780c:	9102c273 	add	x19, x19, #0xb0
    7810:	eb13029f 	cmp	x20, x19
    7814:	54fffea1 	b.ne	77e8 <_fwalk+0x48>  // b.any
    7818:	f94002b5 	ldr	x21, [x21]
    781c:	b5fffd35 	cbnz	x21, 77c0 <_fwalk+0x20>
    7820:	2a1703e0 	mov	w0, w23
    7824:	a94153f3 	ldp	x19, x20, [sp, #16]
    7828:	a9425bf5 	ldp	x21, x22, [sp, #32]
    782c:	f9401bf7 	ldr	x23, [sp, #48]
    7830:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7834:	d65f03c0 	ret
    7838:	d503201f 	nop
    783c:	d503201f 	nop

0000000000007840 <_fwalk_reent>:
    7840:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7844:	910003fd 	mov	x29, sp
    7848:	a9025bf5 	stp	x21, x22, [sp, #32]
    784c:	aa0103f6 	mov	x22, x1
    7850:	91148015 	add	x21, x0, #0x520
    7854:	a90363f7 	stp	x23, x24, [sp, #48]
    7858:	aa0003f8 	mov	x24, x0
    785c:	52800017 	mov	w23, #0x0                   	// #0
    7860:	a90153f3 	stp	x19, x20, [sp, #16]
    7864:	d503201f 	nop
    7868:	b9400aa2 	ldr	w2, [x21, #8]
    786c:	f9400ab3 	ldr	x19, [x21, #16]
    7870:	7100005f 	cmp	w2, #0x0
    7874:	5400028d 	b.le	78c4 <_fwalk_reent+0x84>
    7878:	51000442 	sub	w2, w2, #0x1
    787c:	91000442 	add	x2, x2, #0x1
    7880:	8b020454 	add	x20, x2, x2, lsl #1
    7884:	d37ef694 	lsl	x20, x20, #2
    7888:	cb020294 	sub	x20, x20, x2
    788c:	8b141274 	add	x20, x19, x20, lsl #4
    7890:	79402262 	ldrh	w2, [x19, #16]
    7894:	7100045f 	cmp	w2, #0x1
    7898:	54000109 	b.ls	78b8 <_fwalk_reent+0x78>  // b.plast
    789c:	79c02662 	ldrsh	w2, [x19, #18]
    78a0:	aa1303e1 	mov	x1, x19
    78a4:	aa1803e0 	mov	x0, x24
    78a8:	3100045f 	cmn	w2, #0x1
    78ac:	54000060 	b.eq	78b8 <_fwalk_reent+0x78>  // b.none
    78b0:	d63f02c0 	blr	x22
    78b4:	2a0002f7 	orr	w23, w23, w0
    78b8:	9102c273 	add	x19, x19, #0xb0
    78bc:	eb13029f 	cmp	x20, x19
    78c0:	54fffe81 	b.ne	7890 <_fwalk_reent+0x50>  // b.any
    78c4:	f94002b5 	ldr	x21, [x21]
    78c8:	b5fffd15 	cbnz	x21, 7868 <_fwalk_reent+0x28>
    78cc:	2a1703e0 	mov	w0, w23
    78d0:	a94153f3 	ldp	x19, x20, [sp, #16]
    78d4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    78d8:	a94363f7 	ldp	x23, x24, [sp, #48]
    78dc:	a8c47bfd 	ldp	x29, x30, [sp], #64
    78e0:	d65f03c0 	ret
    78e4:	d503201f 	nop
    78e8:	d503201f 	nop
    78ec:	d503201f 	nop

00000000000078f0 <__localeconv_l>:
    78f0:	91040000 	add	x0, x0, #0x100
    78f4:	d65f03c0 	ret
    78f8:	d503201f 	nop
    78fc:	d503201f 	nop

0000000000007900 <_localeconv_r>:
    7900:	d0000020 	adrp	x0, d000 <__global_locale+0x20>
    7904:	91038000 	add	x0, x0, #0xe0
    7908:	d65f03c0 	ret
    790c:	d503201f 	nop

0000000000007910 <localeconv>:
    7910:	d0000020 	adrp	x0, d000 <__global_locale+0x20>
    7914:	91038000 	add	x0, x0, #0xe0
    7918:	d65f03c0 	ret
    791c:	d503201f 	nop

0000000000007920 <currentlocale>:
    7920:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    7924:	910003fd 	mov	x29, sp
    7928:	a90153f3 	stp	x19, x20, [sp, #16]
    792c:	b0000034 	adrp	x20, c000 <__func__.0+0x28>
    7930:	913f8294 	add	x20, x20, #0xfe0
    7934:	a9025bf5 	stp	x21, x22, [sp, #32]
    7938:	91010296 	add	x22, x20, #0x40
    793c:	d0000035 	adrp	x21, d000 <__global_locale+0x20>
    7940:	912b42b5 	add	x21, x21, #0xad0
    7944:	f9001bf7 	str	x23, [sp, #48]
    7948:	91038297 	add	x23, x20, #0xe0
    794c:	91008294 	add	x20, x20, #0x20
    7950:	aa1603f3 	mov	x19, x22
    7954:	aa1503e0 	mov	x0, x21
    7958:	aa1403e1 	mov	x1, x20
    795c:	94000b99 	bl	a7c0 <strcpy>
    7960:	aa1303e1 	mov	x1, x19
    7964:	aa1403e0 	mov	x0, x20
    7968:	91008273 	add	x19, x19, #0x20
    796c:	94000b55 	bl	a6c0 <strcmp>
    7970:	35000120 	cbnz	w0, 7994 <currentlocale+0x74>
    7974:	eb17027f 	cmp	x19, x23
    7978:	54ffff41 	b.ne	7960 <currentlocale+0x40>  // b.any
    797c:	aa1503e0 	mov	x0, x21
    7980:	a94153f3 	ldp	x19, x20, [sp, #16]
    7984:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7988:	f9401bf7 	ldr	x23, [sp, #48]
    798c:	a8c47bfd 	ldp	x29, x30, [sp], #64
    7990:	d65f03c0 	ret
    7994:	b0000033 	adrp	x19, c000 <__func__.0+0x28>
    7998:	910b8273 	add	x19, x19, #0x2e0
    799c:	aa1303e1 	mov	x1, x19
    79a0:	aa1503e0 	mov	x0, x21
    79a4:	94000ae7 	bl	a540 <strcat>
    79a8:	aa1603e1 	mov	x1, x22
    79ac:	aa1503e0 	mov	x0, x21
    79b0:	910082d6 	add	x22, x22, #0x20
    79b4:	94000ae3 	bl	a540 <strcat>
    79b8:	eb1702df 	cmp	x22, x23
    79bc:	54ffff01 	b.ne	799c <currentlocale+0x7c>  // b.any
    79c0:	aa1503e0 	mov	x0, x21
    79c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    79c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    79cc:	f9401bf7 	ldr	x23, [sp, #48]
    79d0:	a8c47bfd 	ldp	x29, x30, [sp], #64
    79d4:	d65f03c0 	ret
    79d8:	d503201f 	nop
    79dc:	d503201f 	nop

00000000000079e0 <__loadlocale>:
    79e0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    79e4:	910003fd 	mov	x29, sp
    79e8:	a90153f3 	stp	x19, x20, [sp, #16]
    79ec:	937b7c34 	sbfiz	x20, x1, #5, #32
    79f0:	8b140014 	add	x20, x0, x20
    79f4:	aa0203f3 	mov	x19, x2
    79f8:	a9025bf5 	stp	x21, x22, [sp, #32]
    79fc:	aa0003f6 	mov	x22, x0
    7a00:	aa0203e0 	mov	x0, x2
    7a04:	a90363f7 	stp	x23, x24, [sp, #48]
    7a08:	2a0103f7 	mov	w23, w1
    7a0c:	aa1403e1 	mov	x1, x20
    7a10:	94000b2c 	bl	a6c0 <strcmp>
    7a14:	350000e0 	cbnz	w0, 7a30 <__loadlocale+0x50>
    7a18:	aa1403e0 	mov	x0, x20
    7a1c:	a94153f3 	ldp	x19, x20, [sp, #16]
    7a20:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7a24:	a94363f7 	ldp	x23, x24, [sp, #48]
    7a28:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7a2c:	d65f03c0 	ret
    7a30:	aa1303e0 	mov	x0, x19
    7a34:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7a38:	b0000035 	adrp	x21, c000 <__func__.0+0x28>
    7a3c:	910ba021 	add	x1, x1, #0x2e8
    7a40:	910bc2b5 	add	x21, x21, #0x2f0
    7a44:	a9046bf9 	stp	x25, x26, [sp, #64]
    7a48:	94000b1e 	bl	a6c0 <strcmp>
    7a4c:	34000d80 	cbz	w0, 7bfc <__loadlocale+0x21c>
    7a50:	aa1503e1 	mov	x1, x21
    7a54:	aa1303e0 	mov	x0, x19
    7a58:	94000b1a 	bl	a6c0 <strcmp>
    7a5c:	2a0003f5 	mov	w21, w0
    7a60:	34000be0 	cbz	w0, 7bdc <__loadlocale+0x1fc>
    7a64:	39400260 	ldrb	w0, [x19]
    7a68:	71010c1f 	cmp	w0, #0x43
    7a6c:	54000d00 	b.eq	7c0c <__loadlocale+0x22c>  // b.none
    7a70:	51018400 	sub	w0, w0, #0x61
    7a74:	12001c00 	and	w0, w0, #0xff
    7a78:	7100641f 	cmp	w0, #0x19
    7a7c:	54000a08 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7a80:	39400660 	ldrb	w0, [x19, #1]
    7a84:	51018400 	sub	w0, w0, #0x61
    7a88:	12001c00 	and	w0, w0, #0xff
    7a8c:	7100641f 	cmp	w0, #0x19
    7a90:	54000968 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7a94:	39400a60 	ldrb	w0, [x19, #2]
    7a98:	91000a75 	add	x21, x19, #0x2
    7a9c:	51018401 	sub	w1, w0, #0x61
    7aa0:	12001c21 	and	w1, w1, #0xff
    7aa4:	7100643f 	cmp	w1, #0x19
    7aa8:	54000068 	b.hi	7ab4 <__loadlocale+0xd4>  // b.pmore
    7aac:	39400e60 	ldrb	w0, [x19, #3]
    7ab0:	91000e75 	add	x21, x19, #0x3
    7ab4:	71017c1f 	cmp	w0, #0x5f
    7ab8:	54000d00 	b.eq	7c58 <__loadlocale+0x278>  // b.none
    7abc:	7100b81f 	cmp	w0, #0x2e
    7ac0:	54002ec0 	b.eq	8098 <__loadlocale+0x6b8>  // b.none
    7ac4:	528017e1 	mov	w1, #0xbf                  	// #191
    7ac8:	6a01001f 	tst	w0, w1
    7acc:	54000781 	b.ne	7bbc <__loadlocale+0x1dc>  // b.any
    7ad0:	910203f8 	add	x24, sp, #0x80
    7ad4:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7ad8:	aa1803e0 	mov	x0, x24
    7adc:	910c0021 	add	x1, x1, #0x300
    7ae0:	94000b38 	bl	a7c0 <strcpy>
    7ae4:	394002a0 	ldrb	w0, [x21]
    7ae8:	7101001f 	cmp	w0, #0x40
    7aec:	54002da0 	b.eq	80a0 <__loadlocale+0x6c0>  // b.none
    7af0:	52800019 	mov	w25, #0x0                   	// #0
    7af4:	52800015 	mov	w21, #0x0                   	// #0
    7af8:	5280001a 	mov	w26, #0x0                   	// #0
    7afc:	394203e1 	ldrb	w1, [sp, #128]
    7b00:	51010421 	sub	w1, w1, #0x41
    7b04:	7100d03f 	cmp	w1, #0x34
    7b08:	540005a8 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7b0c:	b0000020 	adrp	x0, c000 <__func__.0+0x28>
    7b10:	910fe000 	add	x0, x0, #0x3f8
    7b14:	a90573fb 	stp	x27, x28, [sp, #80]
    7b18:	78615800 	ldrh	w0, [x0, w1, uxtw #1]
    7b1c:	10000061 	adr	x1, 7b28 <__loadlocale+0x148>
    7b20:	8b20a820 	add	x0, x1, w0, sxth #2
    7b24:	d61f0000 	br	x0
    7b28:	394207e0 	ldrb	w0, [sp, #129]
    7b2c:	121a7800 	and	w0, w0, #0xffffffdf
    7b30:	12001c00 	and	w0, w0, #0xff
    7b34:	7101401f 	cmp	w0, #0x50
    7b38:	54000401 	b.ne	7bb8 <__loadlocale+0x1d8>  // b.any
    7b3c:	d2800042 	mov	x2, #0x2                   	// #2
    7b40:	aa1803e0 	mov	x0, x24
    7b44:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7b48:	910e4021 	add	x1, x1, #0x390
    7b4c:	94000bc9 	bl	aa70 <strncpy>
    7b50:	9101e3e1 	add	x1, sp, #0x78
    7b54:	91020be0 	add	x0, sp, #0x82
    7b58:	52800142 	mov	w2, #0xa                   	// #10
    7b5c:	94000c71 	bl	ad20 <strtol>
    7b60:	f9403fe1 	ldr	x1, [sp, #120]
    7b64:	39400021 	ldrb	w1, [x1]
    7b68:	35000281 	cbnz	w1, 7bb8 <__loadlocale+0x1d8>
    7b6c:	f10e901f 	cmp	x0, #0x3a4
    7b70:	540030a0 	b.eq	8184 <__loadlocale+0x7a4>  // b.none
    7b74:	54002f2c 	b.gt	8158 <__loadlocale+0x778>
    7b78:	f10d881f 	cmp	x0, #0x362
    7b7c:	54002dec 	b.gt	8138 <__loadlocale+0x758>
    7b80:	f10d441f 	cmp	x0, #0x351
    7b84:	54002c8c 	b.gt	8114 <__loadlocale+0x734>
    7b88:	f106d41f 	cmp	x0, #0x1b5
    7b8c:	54002da0 	b.eq	8140 <__loadlocale+0x760>  // b.none
    7b90:	d10b4000 	sub	x0, x0, #0x2d0
    7b94:	f100dc1f 	cmp	x0, #0x37
    7b98:	54000108 	b.hi	7bb8 <__loadlocale+0x1d8>  // b.pmore
    7b9c:	d2800021 	mov	x1, #0x1                   	// #1
    7ba0:	d280003c 	mov	x28, #0x1                   	// #1
    7ba4:	f2a00041 	movk	x1, #0x2, lsl #16
    7ba8:	9ac02380 	lsl	x0, x28, x0
    7bac:	f2e01001 	movk	x1, #0x80, lsl #48
    7bb0:	ea01001f 	tst	x0, x1
    7bb4:	54000e21 	b.ne	7d78 <__loadlocale+0x398>  // b.any
    7bb8:	a94573fb 	ldp	x27, x28, [sp, #80]
    7bbc:	d2800014 	mov	x20, #0x0                   	// #0
    7bc0:	aa1403e0 	mov	x0, x20
    7bc4:	a94153f3 	ldp	x19, x20, [sp, #16]
    7bc8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7bcc:	a94363f7 	ldp	x23, x24, [sp, #48]
    7bd0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7bd4:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7bd8:	d65f03c0 	ret
    7bdc:	910203f8 	add	x24, sp, #0x80
    7be0:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7be4:	aa1803e0 	mov	x0, x24
    7be8:	910be021 	add	x1, x1, #0x2f8
    7bec:	52800019 	mov	w25, #0x0                   	// #0
    7bf0:	5280001a 	mov	w26, #0x0                   	// #0
    7bf4:	94000af3 	bl	a7c0 <strcpy>
    7bf8:	17ffffc1 	b	7afc <__loadlocale+0x11c>
    7bfc:	aa1503e1 	mov	x1, x21
    7c00:	aa1303e0 	mov	x0, x19
    7c04:	94000aef 	bl	a7c0 <strcpy>
    7c08:	17ffff92 	b	7a50 <__loadlocale+0x70>
    7c0c:	39400660 	ldrb	w0, [x19, #1]
    7c10:	5100b400 	sub	w0, w0, #0x2d
    7c14:	12001c00 	and	w0, w0, #0xff
    7c18:	7100041f 	cmp	w0, #0x1
    7c1c:	54fffd08 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7c20:	91000a75 	add	x21, x19, #0x2
    7c24:	910203f8 	add	x24, sp, #0x80
    7c28:	aa1503e1 	mov	x1, x21
    7c2c:	aa1803e0 	mov	x0, x24
    7c30:	94000ae4 	bl	a7c0 <strcpy>
    7c34:	aa1803e0 	mov	x0, x24
    7c38:	52800801 	mov	w1, #0x40                  	// #64
    7c3c:	94000a5e 	bl	a5b4 <strchr>
    7c40:	b4000040 	cbz	x0, 7c48 <__loadlocale+0x268>
    7c44:	3900001f 	strb	wzr, [x0]
    7c48:	aa1803e0 	mov	x0, x24
    7c4c:	97fff1fd 	bl	4440 <strlen>
    7c50:	8b0002b5 	add	x21, x21, x0
    7c54:	17ffffa4 	b	7ae4 <__loadlocale+0x104>
    7c58:	394006a0 	ldrb	w0, [x21, #1]
    7c5c:	51010400 	sub	w0, w0, #0x41
    7c60:	12001c00 	and	w0, w0, #0xff
    7c64:	7100641f 	cmp	w0, #0x19
    7c68:	54fffaa8 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7c6c:	39400aa0 	ldrb	w0, [x21, #2]
    7c70:	51010400 	sub	w0, w0, #0x41
    7c74:	12001c00 	and	w0, w0, #0xff
    7c78:	7100641f 	cmp	w0, #0x19
    7c7c:	54fffa08 	b.hi	7bbc <__loadlocale+0x1dc>  // b.pmore
    7c80:	39400ea0 	ldrb	w0, [x21, #3]
    7c84:	91000eb5 	add	x21, x21, #0x3
    7c88:	17ffff8d 	b	7abc <__loadlocale+0xdc>
    7c8c:	b000003b 	adrp	x27, c000 <__func__.0+0x28>
    7c90:	910ce37b 	add	x27, x27, #0x338
    7c94:	aa1b03e1 	mov	x1, x27
    7c98:	aa1803e0 	mov	x0, x24
    7c9c:	94000a0d 	bl	a4d0 <strcasecmp>
    7ca0:	340000c0 	cbz	w0, 7cb8 <__loadlocale+0x2d8>
    7ca4:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7ca8:	aa1803e0 	mov	x0, x24
    7cac:	910d0021 	add	x1, x1, #0x340
    7cb0:	94000a08 	bl	a4d0 <strcasecmp>
    7cb4:	35fff820 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7cb8:	aa1b03e1 	mov	x1, x27
    7cbc:	aa1803e0 	mov	x0, x24
    7cc0:	94000ac0 	bl	a7c0 <strcpy>
    7cc4:	d000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    7cc8:	90000022 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    7ccc:	9104437b 	add	x27, x27, #0x110
    7cd0:	9104c042 	add	x2, x2, #0x130
    7cd4:	528000dc 	mov	w28, #0x6                   	// #6
    7cd8:	71000aff 	cmp	w23, #0x2
    7cdc:	54001b00 	b.eq	803c <__loadlocale+0x65c>  // b.none
    7ce0:	71001aff 	cmp	w23, #0x6
    7ce4:	54000081 	b.ne	7cf4 <__loadlocale+0x314>  // b.any
    7ce8:	aa1803e1 	mov	x1, x24
    7cec:	91060ac0 	add	x0, x22, #0x182
    7cf0:	94000ab4 	bl	a7c0 <strcpy>
    7cf4:	aa1303e1 	mov	x1, x19
    7cf8:	aa1403e0 	mov	x0, x20
    7cfc:	94000ab1 	bl	a7c0 <strcpy>
    7d00:	aa0003f4 	mov	x20, x0
    7d04:	aa1403e0 	mov	x0, x20
    7d08:	a94153f3 	ldp	x19, x20, [sp, #16]
    7d0c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    7d10:	a94363f7 	ldp	x23, x24, [sp, #48]
    7d14:	a9446bf9 	ldp	x25, x26, [sp, #64]
    7d18:	a94573fb 	ldp	x27, x28, [sp, #80]
    7d1c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    7d20:	d65f03c0 	ret
    7d24:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7d28:	aa1803e0 	mov	x0, x24
    7d2c:	910f8021 	add	x1, x1, #0x3e0
    7d30:	d2800062 	mov	x2, #0x3                   	// #3
    7d34:	94000b2b 	bl	a9e0 <strncasecmp>
    7d38:	35fff400 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7d3c:	39420fe0 	ldrb	w0, [sp, #131]
    7d40:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7d44:	910fa021 	add	x1, x1, #0x3e8
    7d48:	7100b41f 	cmp	w0, #0x2d
    7d4c:	910283e0 	add	x0, sp, #0xa0
    7d50:	9a801400 	cinc	x0, x0, eq  // eq = none
    7d54:	d1007400 	sub	x0, x0, #0x1d
    7d58:	94000a5a 	bl	a6c0 <strcmp>
    7d5c:	35fff2e0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7d60:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7d64:	aa1803e0 	mov	x0, x24
    7d68:	910fc021 	add	x1, x1, #0x3f0
    7d6c:	d503201f 	nop
    7d70:	5280003c 	mov	w28, #0x1                   	// #1
    7d74:	94000a93 	bl	a7c0 <strcpy>
    7d78:	d000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    7d7c:	90000022 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    7d80:	9103037b 	add	x27, x27, #0xc0
    7d84:	9103c042 	add	x2, x2, #0xf0
    7d88:	17ffffd4 	b	7cd8 <__loadlocale+0x2f8>
    7d8c:	b000003b 	adrp	x27, c000 <__func__.0+0x28>
    7d90:	910da37b 	add	x27, x27, #0x368
    7d94:	aa1b03e1 	mov	x1, x27
    7d98:	aa1803e0 	mov	x0, x24
    7d9c:	940009cd 	bl	a4d0 <strcasecmp>
    7da0:	35fff0c0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7da4:	aa1b03e1 	mov	x1, x27
    7da8:	aa1803e0 	mov	x0, x24
    7dac:	94000a85 	bl	a7c0 <strcpy>
    7db0:	d000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    7db4:	90000022 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    7db8:	910f837b 	add	x27, x27, #0x3e0
    7dbc:	91088042 	add	x2, x2, #0x220
    7dc0:	5280005c 	mov	w28, #0x2                   	// #2
    7dc4:	17ffffc5 	b	7cd8 <__loadlocale+0x2f8>
    7dc8:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7dcc:	aa1803e0 	mov	x0, x24
    7dd0:	910f4021 	add	x1, x1, #0x3d0
    7dd4:	940009bf 	bl	a4d0 <strcasecmp>
    7dd8:	35ffef00 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7ddc:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7de0:	aa1803e0 	mov	x0, x24
    7de4:	910f6021 	add	x1, x1, #0x3d8
    7de8:	17ffffe2 	b	7d70 <__loadlocale+0x390>
    7dec:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7df0:	aa1803e0 	mov	x0, x24
    7df4:	910e6021 	add	x1, x1, #0x398
    7df8:	d2800082 	mov	x2, #0x4                   	// #4
    7dfc:	94000af9 	bl	a9e0 <strncasecmp>
    7e00:	35ffedc0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7e04:	394213e0 	ldrb	w0, [sp, #132]
    7e08:	394217e1 	ldrb	w1, [sp, #133]
    7e0c:	7100b41f 	cmp	w0, #0x2d
    7e10:	1a800020 	csel	w0, w1, w0, eq  // eq = none
    7e14:	121a7800 	and	w0, w0, #0xffffffdf
    7e18:	12001c00 	and	w0, w0, #0xff
    7e1c:	7101481f 	cmp	w0, #0x52
    7e20:	54001aa0 	b.eq	8174 <__loadlocale+0x794>  // b.none
    7e24:	7101541f 	cmp	w0, #0x55
    7e28:	54ffec81 	b.ne	7bb8 <__loadlocale+0x1d8>  // b.any
    7e2c:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7e30:	aa1803e0 	mov	x0, x24
    7e34:	910ea021 	add	x1, x1, #0x3a8
    7e38:	17ffffce 	b	7d70 <__loadlocale+0x390>
    7e3c:	b000003b 	adrp	x27, c000 <__func__.0+0x28>
    7e40:	910d237b 	add	x27, x27, #0x348
    7e44:	aa1b03e1 	mov	x1, x27
    7e48:	aa1803e0 	mov	x0, x24
    7e4c:	940009a1 	bl	a4d0 <strcasecmp>
    7e50:	35ffeb40 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7e54:	aa1b03e1 	mov	x1, x27
    7e58:	aa1803e0 	mov	x0, x24
    7e5c:	94000a59 	bl	a7c0 <strcpy>
    7e60:	d000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    7e64:	90000022 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    7e68:	9117837b 	add	x27, x27, #0x5e0
    7e6c:	910d8042 	add	x2, x2, #0x360
    7e70:	5280011c 	mov	w28, #0x8                   	// #8
    7e74:	17ffff99 	b	7cd8 <__loadlocale+0x2f8>
    7e78:	b000003b 	adrp	x27, c000 <__func__.0+0x28>
    7e7c:	910be37b 	add	x27, x27, #0x2f8
    7e80:	aa1b03e1 	mov	x1, x27
    7e84:	aa1803e0 	mov	x0, x24
    7e88:	94000992 	bl	a4d0 <strcasecmp>
    7e8c:	35ffe960 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7e90:	aa1b03e1 	mov	x1, x27
    7e94:	aa1803e0 	mov	x0, x24
    7e98:	17ffffb6 	b	7d70 <__loadlocale+0x390>
    7e9c:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7ea0:	aa1803e0 	mov	x0, x24
    7ea4:	910ec021 	add	x1, x1, #0x3b0
    7ea8:	d2800102 	mov	x2, #0x8                   	// #8
    7eac:	94000acd 	bl	a9e0 <strncasecmp>
    7eb0:	35ffe840 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7eb4:	394223e0 	ldrb	w0, [sp, #136]
    7eb8:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7ebc:	910f0021 	add	x1, x1, #0x3c0
    7ec0:	7100b41f 	cmp	w0, #0x2d
    7ec4:	910283e0 	add	x0, sp, #0xa0
    7ec8:	9a801400 	cinc	x0, x0, eq  // eq = none
    7ecc:	d1006000 	sub	x0, x0, #0x18
    7ed0:	94000980 	bl	a4d0 <strcasecmp>
    7ed4:	35ffe720 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7ed8:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7edc:	aa1803e0 	mov	x0, x24
    7ee0:	910f2021 	add	x1, x1, #0x3c8
    7ee4:	17ffffa3 	b	7d70 <__loadlocale+0x390>
    7ee8:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7eec:	aa1803e0 	mov	x0, x24
    7ef0:	910d4021 	add	x1, x1, #0x350
    7ef4:	d2800062 	mov	x2, #0x3                   	// #3
    7ef8:	94000aba 	bl	a9e0 <strncasecmp>
    7efc:	35ffe5e0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7f00:	39420fe0 	ldrb	w0, [sp, #131]
    7f04:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7f08:	910d6021 	add	x1, x1, #0x358
    7f0c:	7100b41f 	cmp	w0, #0x2d
    7f10:	910283e0 	add	x0, sp, #0xa0
    7f14:	9a801400 	cinc	x0, x0, eq  // eq = none
    7f18:	d1007400 	sub	x0, x0, #0x1d
    7f1c:	9400096d 	bl	a4d0 <strcasecmp>
    7f20:	35ffe4c0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7f24:	aa1803e0 	mov	x0, x24
    7f28:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7f2c:	910d8021 	add	x1, x1, #0x360
    7f30:	94000a24 	bl	a7c0 <strcpy>
    7f34:	d000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    7f38:	90000022 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    7f3c:	9112c37b 	add	x27, x27, #0x4b0
    7f40:	910ac042 	add	x2, x2, #0x2b0
    7f44:	5280007c 	mov	w28, #0x3                   	// #3
    7f48:	17ffff64 	b	7cd8 <__loadlocale+0x2f8>
    7f4c:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7f50:	aa1803e0 	mov	x0, x24
    7f54:	910dc021 	add	x1, x1, #0x370
    7f58:	d2800062 	mov	x2, #0x3                   	// #3
    7f5c:	94000aa1 	bl	a9e0 <strncasecmp>
    7f60:	35ffe2c0 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7f64:	39420fe0 	ldrb	w0, [sp, #131]
    7f68:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7f6c:	d2800082 	mov	x2, #0x4                   	// #4
    7f70:	910de021 	add	x1, x1, #0x378
    7f74:	7100b41f 	cmp	w0, #0x2d
    7f78:	910283e0 	add	x0, sp, #0xa0
    7f7c:	9a80141b 	cinc	x27, x0, eq  // eq = none
    7f80:	d100777b 	sub	x27, x27, #0x1d
    7f84:	aa1b03e0 	mov	x0, x27
    7f88:	94000a96 	bl	a9e0 <strncasecmp>
    7f8c:	35ffe160 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7f90:	39401360 	ldrb	w0, [x27, #4]
    7f94:	9101e3e1 	add	x1, sp, #0x78
    7f98:	52800142 	mov	w2, #0xa                   	// #10
    7f9c:	7100b41f 	cmp	w0, #0x2d
    7fa0:	9a9b1760 	cinc	x0, x27, eq  // eq = none
    7fa4:	91001000 	add	x0, x0, #0x4
    7fa8:	94000b5e 	bl	ad20 <strtol>
    7fac:	aa0003e3 	mov	x3, x0
    7fb0:	d1000400 	sub	x0, x0, #0x1
    7fb4:	f90037e3 	str	x3, [sp, #104]
    7fb8:	f1003c1f 	cmp	x0, #0xf
    7fbc:	fa4c9864 	ccmp	x3, #0xc, #0x4, ls  // ls = plast
    7fc0:	54ffdfc0 	b.eq	7bb8 <__loadlocale+0x1d8>  // b.none
    7fc4:	f9403fe0 	ldr	x0, [sp, #120]
    7fc8:	39400000 	ldrb	w0, [x0]
    7fcc:	35ffdf60 	cbnz	w0, 7bb8 <__loadlocale+0x1d8>
    7fd0:	aa1803e0 	mov	x0, x24
    7fd4:	b0000021 	adrp	x1, c000 <__func__.0+0x28>
    7fd8:	910e0021 	add	x1, x1, #0x380
    7fdc:	940009f9 	bl	a7c0 <strcpy>
    7fe0:	f94037e3 	ldr	x3, [sp, #104]
    7fe4:	910227e4 	add	x4, sp, #0x89
    7fe8:	f100287f 	cmp	x3, #0xa
    7fec:	5400008d 	b.le	7ffc <__loadlocale+0x61c>
    7ff0:	91022be4 	add	x4, sp, #0x8a
    7ff4:	52800620 	mov	w0, #0x31                  	// #49
    7ff8:	390227e0 	strb	w0, [sp, #137]
    7ffc:	b203e7e1 	mov	x1, #0x6666666666666666    	// #7378697629483820646
    8000:	b000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    8004:	f28ccce1 	movk	x1, #0x6667
    8008:	f0000002 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    800c:	9103037b 	add	x27, x27, #0xc0
    8010:	9103c042 	add	x2, x2, #0xf0
    8014:	9b417c61 	smulh	x1, x3, x1
    8018:	5280003c 	mov	w28, #0x1                   	// #1
    801c:	3900049f 	strb	wzr, [x4, #1]
    8020:	9342fc21 	asr	x1, x1, #2
    8024:	cb83fc21 	sub	x1, x1, x3, asr #63
    8028:	8b010821 	add	x1, x1, x1, lsl #2
    802c:	cb010460 	sub	x0, x3, x1, lsl #1
    8030:	1100c000 	add	w0, w0, #0x30
    8034:	39000080 	strb	w0, [x4]
    8038:	17ffff28 	b	7cd8 <__loadlocale+0x2f8>
    803c:	aa1803e1 	mov	x1, x24
    8040:	91058ac0 	add	x0, x22, #0x162
    8044:	f90037e2 	str	x2, [sp, #104]
    8048:	940009de 	bl	a7c0 <strcpy>
    804c:	f94037e2 	ldr	x2, [sp, #104]
    8050:	a90e6ec2 	stp	x2, x27, [x22, #224]
    8054:	aa1803e1 	mov	x1, x24
    8058:	390582dc 	strb	w28, [x22, #352]
    805c:	aa1603e0 	mov	x0, x22
    8060:	94000d1c 	bl	b4d0 <__set_ctype>
    8064:	35000139 	cbnz	w25, 8088 <__loadlocale+0x6a8>
    8068:	7100079f 	cmp	w28, #0x1
    806c:	520002b5 	eor	w21, w21, #0x1
    8070:	1a9fd7e0 	cset	w0, gt
    8074:	6a0002bf 	tst	w21, w0
    8078:	54000080 	b.eq	8088 <__loadlocale+0x6a8>  // b.none
    807c:	394203e0 	ldrb	w0, [sp, #128]
    8080:	7101541f 	cmp	w0, #0x55
    8084:	1a9f07f9 	cset	w25, ne  // ne = any
    8088:	7100035f 	cmp	w26, #0x0
    808c:	5a9f0339 	csinv	w25, w25, wzr, eq  // eq = none
    8090:	b900f2d9 	str	w25, [x22, #240]
    8094:	17ffff18 	b	7cf4 <__loadlocale+0x314>
    8098:	910006b5 	add	x21, x21, #0x1
    809c:	17fffee2 	b	7c24 <__loadlocale+0x244>
    80a0:	a90573fb 	stp	x27, x28, [sp, #80]
    80a4:	910006bb 	add	x27, x21, #0x1
    80a8:	aa1b03e0 	mov	x0, x27
    80ac:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    80b0:	52800019 	mov	w25, #0x0                   	// #0
    80b4:	910c4021 	add	x1, x1, #0x310
    80b8:	5280003a 	mov	w26, #0x1                   	// #1
    80bc:	94000981 	bl	a6c0 <strcmp>
    80c0:	2a0003f5 	mov	w21, w0
    80c4:	35000060 	cbnz	w0, 80d0 <__loadlocale+0x6f0>
    80c8:	a94573fb 	ldp	x27, x28, [sp, #80]
    80cc:	17fffe8c 	b	7afc <__loadlocale+0x11c>
    80d0:	aa1b03e0 	mov	x0, x27
    80d4:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    80d8:	5280001a 	mov	w26, #0x0                   	// #0
    80dc:	910c8021 	add	x1, x1, #0x320
    80e0:	52800035 	mov	w21, #0x1                   	// #1
    80e4:	94000977 	bl	a6c0 <strcmp>
    80e8:	2a0003f9 	mov	w25, w0
    80ec:	34fffee0 	cbz	w0, 80c8 <__loadlocale+0x6e8>
    80f0:	aa1b03e0 	mov	x0, x27
    80f4:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    80f8:	910cc021 	add	x1, x1, #0x330
    80fc:	94000971 	bl	a6c0 <strcmp>
    8100:	7100001f 	cmp	w0, #0x0
    8104:	52800015 	mov	w21, #0x0                   	// #0
    8108:	1a9f17f9 	cset	w25, eq  // eq = none
    810c:	a94573fb 	ldp	x27, x28, [sp, #80]
    8110:	17fffe7b 	b	7afc <__loadlocale+0x11c>
    8114:	d10d4800 	sub	x0, x0, #0x352
    8118:	d280003c 	mov	x28, #0x1                   	// #1
    811c:	d28234a1 	mov	x1, #0x11a5                	// #4517
    8120:	f2a00021 	movk	x1, #0x1, lsl #16
    8124:	9ac02380 	lsl	x0, x28, x0
    8128:	ea01001f 	tst	x0, x1
    812c:	54ffe261 	b.ne	7d78 <__loadlocale+0x398>  // b.any
    8130:	a94573fb 	ldp	x27, x28, [sp, #80]
    8134:	17fffea2 	b	7bbc <__loadlocale+0x1dc>
    8138:	f10da81f 	cmp	x0, #0x36a
    813c:	54ffd3e1 	b.ne	7bb8 <__loadlocale+0x1d8>  // b.any
    8140:	b000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    8144:	f0000002 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    8148:	9103037b 	add	x27, x27, #0xc0
    814c:	9103c042 	add	x2, x2, #0xf0
    8150:	5280003c 	mov	w28, #0x1                   	// #1
    8154:	17fffee1 	b	7cd8 <__loadlocale+0x2f8>
    8158:	f111941f 	cmp	x0, #0x465
    815c:	54ffff20 	b.eq	8140 <__loadlocale+0x760>  // b.none
    8160:	d1138800 	sub	x0, x0, #0x4e2
    8164:	f100201f 	cmp	x0, #0x8
    8168:	54fffec9 	b.ls	8140 <__loadlocale+0x760>  // b.plast
    816c:	a94573fb 	ldp	x27, x28, [sp, #80]
    8170:	17fffe93 	b	7bbc <__loadlocale+0x1dc>
    8174:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    8178:	aa1803e0 	mov	x0, x24
    817c:	910e8021 	add	x1, x1, #0x3a0
    8180:	17fffefc 	b	7d70 <__loadlocale+0x390>
    8184:	b000001b 	adrp	x27, 9000 <_malloc_r+0x780>
    8188:	f0000002 	adrp	x2, b000 <_wcsnrtombs_l+0x130>
    818c:	910f837b 	add	x27, x27, #0x3e0
    8190:	91088042 	add	x2, x2, #0x220
    8194:	5280005c 	mov	w28, #0x2                   	// #2
    8198:	17fffed0 	b	7cd8 <__loadlocale+0x2f8>
    819c:	d503201f 	nop

00000000000081a0 <__get_locale_env>:
    81a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    81a4:	910003fd 	mov	x29, sp
    81a8:	a90153f3 	stp	x19, x20, [sp, #16]
    81ac:	2a0103f4 	mov	w20, w1
    81b0:	aa0003f3 	mov	x19, x0
    81b4:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    81b8:	9111a021 	add	x1, x1, #0x468
    81bc:	94000d85 	bl	b7d0 <_getenv_r>
    81c0:	b4000060 	cbz	x0, 81cc <__get_locale_env+0x2c>
    81c4:	39400001 	ldrb	w1, [x0]
    81c8:	35000201 	cbnz	w1, 8208 <__get_locale_env+0x68>
    81cc:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    81d0:	911a0021 	add	x1, x1, #0x680
    81d4:	aa1303e0 	mov	x0, x19
    81d8:	f874d821 	ldr	x1, [x1, w20, sxtw #3]
    81dc:	94000d7d 	bl	b7d0 <_getenv_r>
    81e0:	b4000060 	cbz	x0, 81ec <__get_locale_env+0x4c>
    81e4:	39400001 	ldrb	w1, [x0]
    81e8:	35000101 	cbnz	w1, 8208 <__get_locale_env+0x68>
    81ec:	90000021 	adrp	x1, c000 <__func__.0+0x28>
    81f0:	aa1303e0 	mov	x0, x19
    81f4:	9111c021 	add	x1, x1, #0x470
    81f8:	94000d76 	bl	b7d0 <_getenv_r>
    81fc:	b50000c0 	cbnz	x0, 8214 <__get_locale_env+0x74>
    8200:	90000020 	adrp	x0, c000 <__func__.0+0x28>
    8204:	913f0000 	add	x0, x0, #0xfc0
    8208:	a94153f3 	ldp	x19, x20, [sp, #16]
    820c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    8210:	d65f03c0 	ret
    8214:	39400001 	ldrb	w1, [x0]
    8218:	35ffff81 	cbnz	w1, 8208 <__get_locale_env+0x68>
    821c:	90000020 	adrp	x0, c000 <__func__.0+0x28>
    8220:	913f0000 	add	x0, x0, #0xfc0
    8224:	17fffff9 	b	8208 <__get_locale_env+0x68>
    8228:	d503201f 	nop
    822c:	d503201f 	nop

0000000000008230 <_setlocale_r.part.0>:
    8230:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8234:	910003fd 	mov	x29, sp
    8238:	a9025bf5 	stp	x21, x22, [sp, #32]
    823c:	b0000035 	adrp	x21, d000 <__global_locale+0x20>
    8240:	90000036 	adrp	x22, c000 <__func__.0+0x28>
    8244:	912ee2b5 	add	x21, x21, #0xbb8
    8248:	913f82d6 	add	x22, x22, #0xfe0
    824c:	a90153f3 	stp	x19, x20, [sp, #16]
    8250:	910082d4 	add	x20, x22, #0x20
    8254:	a9046bf9 	stp	x25, x26, [sp, #64]
    8258:	910082b9 	add	x25, x21, #0x20
    825c:	aa0003fa 	mov	x26, x0
    8260:	aa1903f3 	mov	x19, x25
    8264:	a90363f7 	stp	x23, x24, [sp, #48]
    8268:	aa0203f8 	mov	x24, x2
    826c:	910382b7 	add	x23, x21, #0xe0
    8270:	a90573fb 	stp	x27, x28, [sp, #80]
    8274:	2a0103fc 	mov	w28, w1
    8278:	aa1403fb 	mov	x27, x20
    827c:	d503201f 	nop
    8280:	aa1b03e1 	mov	x1, x27
    8284:	aa1303e0 	mov	x0, x19
    8288:	91008273 	add	x19, x19, #0x20
    828c:	9400094d 	bl	a7c0 <strcpy>
    8290:	9100837b 	add	x27, x27, #0x20
    8294:	eb17027f 	cmp	x19, x23
    8298:	54ffff41 	b.ne	8280 <_setlocale_r.part.0+0x50>  // b.any
    829c:	39400300 	ldrb	w0, [x24]
    82a0:	350005e0 	cbnz	w0, 835c <_setlocale_r.part.0+0x12c>
    82a4:	35000edc 	cbnz	w28, 847c <_setlocale_r.part.0+0x24c>
    82a8:	aa1903f7 	mov	x23, x25
    82ac:	52800033 	mov	w19, #0x1                   	// #1
    82b0:	2a1303e1 	mov	w1, w19
    82b4:	aa1a03e0 	mov	x0, x26
    82b8:	97ffffba 	bl	81a0 <__get_locale_env>
    82bc:	aa0003f5 	mov	x21, x0
    82c0:	11000673 	add	w19, w19, #0x1
    82c4:	97fff05f 	bl	4440 <strlen>
    82c8:	aa0003e2 	mov	x2, x0
    82cc:	aa1503e1 	mov	x1, x21
    82d0:	aa1703e0 	mov	x0, x23
    82d4:	f1007c5f 	cmp	x2, #0x1f
    82d8:	54000be8 	b.hi	8454 <_setlocale_r.part.0+0x224>  // b.pmore
    82dc:	910082f7 	add	x23, x23, #0x20
    82e0:	94000938 	bl	a7c0 <strcpy>
    82e4:	71001e7f 	cmp	w19, #0x7
    82e8:	54fffe41 	b.ne	82b0 <_setlocale_r.part.0+0x80>  // b.any
    82ec:	b0000038 	adrp	x24, d000 <__global_locale+0x20>
    82f0:	91326318 	add	x24, x24, #0xc98
    82f4:	91008318 	add	x24, x24, #0x20
    82f8:	aa1903f7 	mov	x23, x25
    82fc:	aa1803f5 	mov	x21, x24
    8300:	52800033 	mov	w19, #0x1                   	// #1
    8304:	d503201f 	nop
    8308:	aa1403e1 	mov	x1, x20
    830c:	aa1503e0 	mov	x0, x21
    8310:	9400092c 	bl	a7c0 <strcpy>
    8314:	aa1703e2 	mov	x2, x23
    8318:	2a1303e1 	mov	w1, w19
    831c:	aa1603e0 	mov	x0, x22
    8320:	97fffdb0 	bl	79e0 <__loadlocale>
    8324:	b4000c60 	cbz	x0, 84b0 <_setlocale_r.part.0+0x280>
    8328:	11000673 	add	w19, w19, #0x1
    832c:	910082b5 	add	x21, x21, #0x20
    8330:	91008294 	add	x20, x20, #0x20
    8334:	910082f7 	add	x23, x23, #0x20
    8338:	71001e7f 	cmp	w19, #0x7
    833c:	54fffe61 	b.ne	8308 <_setlocale_r.part.0+0xd8>  // b.any
    8340:	a94153f3 	ldp	x19, x20, [sp, #16]
    8344:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8348:	a94363f7 	ldp	x23, x24, [sp, #48]
    834c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8350:	a94573fb 	ldp	x27, x28, [sp, #80]
    8354:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8358:	17fffd72 	b	7920 <currentlocale>
    835c:	3500057c 	cbnz	w28, 8408 <_setlocale_r.part.0+0x1d8>
    8360:	aa1803e0 	mov	x0, x24
    8364:	528005e1 	mov	w1, #0x2f                  	// #47
    8368:	94000893 	bl	a5b4 <strchr>
    836c:	aa0003f3 	mov	x19, x0
    8370:	b5000060 	cbnz	x0, 837c <_setlocale_r.part.0+0x14c>
    8374:	14000085 	b	8588 <_setlocale_r.part.0+0x358>
    8378:	91000673 	add	x19, x19, #0x1
    837c:	39400660 	ldrb	w0, [x19, #1]
    8380:	7100bc1f 	cmp	w0, #0x2f
    8384:	54ffffa0 	b.eq	8378 <_setlocale_r.part.0+0x148>  // b.none
    8388:	34000660 	cbz	w0, 8454 <_setlocale_r.part.0+0x224>
    838c:	aa1903fb 	mov	x27, x25
    8390:	52800037 	mov	w23, #0x1                   	// #1
    8394:	cb180262 	sub	x2, x19, x24
    8398:	71007c5f 	cmp	w2, #0x1f
    839c:	540005cc 	b.gt	8454 <_setlocale_r.part.0+0x224>
    83a0:	11000442 	add	w2, w2, #0x1
    83a4:	aa1803e1 	mov	x1, x24
    83a8:	aa1b03e0 	mov	x0, x27
    83ac:	110006f7 	add	w23, w23, #0x1
    83b0:	93407c42 	sxtw	x2, w2
    83b4:	94000973 	bl	a980 <strlcpy>
    83b8:	39400260 	ldrb	w0, [x19]
    83bc:	7100bc1f 	cmp	w0, #0x2f
    83c0:	540000a1 	b.ne	83d4 <_setlocale_r.part.0+0x1a4>  // b.any
    83c4:	d503201f 	nop
    83c8:	38401e60 	ldrb	w0, [x19, #1]!
    83cc:	7100bc1f 	cmp	w0, #0x2f
    83d0:	54ffffc0 	b.eq	83c8 <_setlocale_r.part.0+0x198>  // b.none
    83d4:	34000c00 	cbz	w0, 8554 <_setlocale_r.part.0+0x324>
    83d8:	aa1303e1 	mov	x1, x19
    83dc:	d503201f 	nop
    83e0:	38401c20 	ldrb	w0, [x1, #1]!
    83e4:	7100bc1f 	cmp	w0, #0x2f
    83e8:	7a401804 	ccmp	w0, #0x0, #0x4, ne  // ne = any
    83ec:	54ffffa1 	b.ne	83e0 <_setlocale_r.part.0+0x1b0>  // b.any
    83f0:	9100837b 	add	x27, x27, #0x20
    83f4:	71001eff 	cmp	w23, #0x7
    83f8:	54fff7a0 	b.eq	82ec <_setlocale_r.part.0+0xbc>  // b.none
    83fc:	aa1303f8 	mov	x24, x19
    8400:	aa0103f3 	mov	x19, x1
    8404:	17ffffe4 	b	8394 <_setlocale_r.part.0+0x164>
    8408:	aa1803e0 	mov	x0, x24
    840c:	97fff00d 	bl	4440 <strlen>
    8410:	f1007c1f 	cmp	x0, #0x1f
    8414:	54000208 	b.hi	8454 <_setlocale_r.part.0+0x224>  // b.pmore
    8418:	937b7f80 	sbfiz	x0, x28, #5, #32
    841c:	aa1803e1 	mov	x1, x24
    8420:	8b0002b5 	add	x21, x21, x0
    8424:	aa1503e0 	mov	x0, x21
    8428:	940008e6 	bl	a7c0 <strcpy>
    842c:	aa1503e2 	mov	x2, x21
    8430:	2a1c03e1 	mov	w1, w28
    8434:	aa1603e0 	mov	x0, x22
    8438:	a94153f3 	ldp	x19, x20, [sp, #16]
    843c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8440:	a94363f7 	ldp	x23, x24, [sp, #48]
    8444:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8448:	a94573fb 	ldp	x27, x28, [sp, #80]
    844c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8450:	17fffd64 	b	79e0 <__loadlocale>
    8454:	528002c0 	mov	w0, #0x16                  	// #22
    8458:	b9000340 	str	w0, [x26]
    845c:	d2800000 	mov	x0, #0x0                   	// #0
    8460:	a94153f3 	ldp	x19, x20, [sp, #16]
    8464:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8468:	a94363f7 	ldp	x23, x24, [sp, #48]
    846c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8470:	a94573fb 	ldp	x27, x28, [sp, #80]
    8474:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8478:	d65f03c0 	ret
    847c:	2a1c03e1 	mov	w1, w28
    8480:	aa1a03e0 	mov	x0, x26
    8484:	97ffff47 	bl	81a0 <__get_locale_env>
    8488:	aa0003f3 	mov	x19, x0
    848c:	97ffefed 	bl	4440 <strlen>
    8490:	f1007c1f 	cmp	x0, #0x1f
    8494:	54fffe08 	b.hi	8454 <_setlocale_r.part.0+0x224>  // b.pmore
    8498:	937b7f80 	sbfiz	x0, x28, #5, #32
    849c:	aa1303e1 	mov	x1, x19
    84a0:	8b0002b5 	add	x21, x21, x0
    84a4:	aa1503e0 	mov	x0, x21
    84a8:	940008c6 	bl	a7c0 <strcpy>
    84ac:	17ffffe0 	b	842c <_setlocale_r.part.0+0x1fc>
    84b0:	90000020 	adrp	x0, c000 <__func__.0+0x28>
    84b4:	b9400357 	ldr	w23, [x26]
    84b8:	910bc015 	add	x21, x0, #0x2f0
    84bc:	52800034 	mov	w20, #0x1                   	// #1
    84c0:	6b14027f 	cmp	w19, w20
    84c4:	540000e1 	b.ne	84e0 <_setlocale_r.part.0+0x2b0>  // b.any
    84c8:	1400001a 	b	8530 <_setlocale_r.part.0+0x300>
    84cc:	11000694 	add	w20, w20, #0x1
    84d0:	91008339 	add	x25, x25, #0x20
    84d4:	91008318 	add	x24, x24, #0x20
    84d8:	6b14027f 	cmp	w19, w20
    84dc:	540002a0 	b.eq	8530 <_setlocale_r.part.0+0x300>  // b.none
    84e0:	aa1803e1 	mov	x1, x24
    84e4:	aa1903e0 	mov	x0, x25
    84e8:	940008b6 	bl	a7c0 <strcpy>
    84ec:	aa1903e2 	mov	x2, x25
    84f0:	2a1403e1 	mov	w1, w20
    84f4:	aa1603e0 	mov	x0, x22
    84f8:	97fffd3a 	bl	79e0 <__loadlocale>
    84fc:	b5fffe80 	cbnz	x0, 84cc <_setlocale_r.part.0+0x29c>
    8500:	aa1503e1 	mov	x1, x21
    8504:	aa1903e0 	mov	x0, x25
    8508:	940008ae 	bl	a7c0 <strcpy>
    850c:	91008318 	add	x24, x24, #0x20
    8510:	aa1903e2 	mov	x2, x25
    8514:	2a1403e1 	mov	w1, w20
    8518:	aa1603e0 	mov	x0, x22
    851c:	11000694 	add	w20, w20, #0x1
    8520:	97fffd30 	bl	79e0 <__loadlocale>
    8524:	91008339 	add	x25, x25, #0x20
    8528:	6b14027f 	cmp	w19, w20
    852c:	54fffda1 	b.ne	84e0 <_setlocale_r.part.0+0x2b0>  // b.any
    8530:	b9000357 	str	w23, [x26]
    8534:	d2800000 	mov	x0, #0x0                   	// #0
    8538:	a94153f3 	ldp	x19, x20, [sp, #16]
    853c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8540:	a94363f7 	ldp	x23, x24, [sp, #48]
    8544:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8548:	a94573fb 	ldp	x27, x28, [sp, #80]
    854c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8550:	d65f03c0 	ret
    8554:	71001eff 	cmp	w23, #0x7
    8558:	54ffeca0 	b.eq	82ec <_setlocale_r.part.0+0xbc>  // b.none
    855c:	937b7ee0 	sbfiz	x0, x23, #5, #32
    8560:	8b0002b5 	add	x21, x21, x0
    8564:	d503201f 	nop
    8568:	d10082a1 	sub	x1, x21, #0x20
    856c:	aa1503e0 	mov	x0, x21
    8570:	110006f7 	add	w23, w23, #0x1
    8574:	94000893 	bl	a7c0 <strcpy>
    8578:	910082b5 	add	x21, x21, #0x20
    857c:	71001eff 	cmp	w23, #0x7
    8580:	54ffff41 	b.ne	8568 <_setlocale_r.part.0+0x338>  // b.any
    8584:	17ffff5a 	b	82ec <_setlocale_r.part.0+0xbc>
    8588:	aa1803e0 	mov	x0, x24
    858c:	97ffefad 	bl	4440 <strlen>
    8590:	f1007c1f 	cmp	x0, #0x1f
    8594:	54fff608 	b.hi	8454 <_setlocale_r.part.0+0x224>  // b.pmore
    8598:	aa1903f3 	mov	x19, x25
    859c:	d503201f 	nop
    85a0:	aa1303e0 	mov	x0, x19
    85a4:	aa1803e1 	mov	x1, x24
    85a8:	91008273 	add	x19, x19, #0x20
    85ac:	94000885 	bl	a7c0 <strcpy>
    85b0:	eb1302ff 	cmp	x23, x19
    85b4:	54ffff61 	b.ne	85a0 <_setlocale_r.part.0+0x370>  // b.any
    85b8:	17ffff4d 	b	82ec <_setlocale_r.part.0+0xbc>
    85bc:	d503201f 	nop

00000000000085c0 <_setlocale_r>:
    85c0:	aa0003e5 	mov	x5, x0
    85c4:	7100183f 	cmp	w1, #0x6
    85c8:	54000068 	b.hi	85d4 <_setlocale_r+0x14>  // b.pmore
    85cc:	b40000c2 	cbz	x2, 85e4 <_setlocale_r+0x24>
    85d0:	17ffff18 	b	8230 <_setlocale_r.part.0>
    85d4:	528002c1 	mov	w1, #0x16                  	// #22
    85d8:	d2800000 	mov	x0, #0x0                   	// #0
    85dc:	b90000a1 	str	w1, [x5]
    85e0:	d65f03c0 	ret
    85e4:	340000c1 	cbz	w1, 85fc <_setlocale_r+0x3c>
    85e8:	937b7c23 	sbfiz	x3, x1, #5, #32
    85ec:	90000020 	adrp	x0, c000 <__func__.0+0x28>
    85f0:	913f8000 	add	x0, x0, #0xfe0
    85f4:	8b030000 	add	x0, x0, x3
    85f8:	d65f03c0 	ret
    85fc:	17fffcc9 	b	7920 <currentlocale>

0000000000008600 <__locale_mb_cur_max>:
    8600:	b0000020 	adrp	x0, d000 <__global_locale+0x20>
    8604:	39450000 	ldrb	w0, [x0, #320]
    8608:	d65f03c0 	ret
    860c:	d503201f 	nop

0000000000008610 <setlocale>:
    8610:	90000024 	adrp	x4, c000 <__func__.0+0x28>
    8614:	2a0003e3 	mov	w3, w0
    8618:	aa0103e2 	mov	x2, x1
    861c:	f9443880 	ldr	x0, [x4, #2160]
    8620:	7100187f 	cmp	w3, #0x6
    8624:	54000088 	b.hi	8634 <setlocale+0x24>  // b.pmore
    8628:	b4000101 	cbz	x1, 8648 <setlocale+0x38>
    862c:	2a0303e1 	mov	w1, w3
    8630:	17ffff00 	b	8230 <_setlocale_r.part.0>
    8634:	528002c1 	mov	w1, #0x16                  	// #22
    8638:	d2800003 	mov	x3, #0x0                   	// #0
    863c:	b9000001 	str	w1, [x0]
    8640:	aa0303e0 	mov	x0, x3
    8644:	d65f03c0 	ret
    8648:	340000e3 	cbz	w3, 8664 <setlocale+0x54>
    864c:	937b7c63 	sbfiz	x3, x3, #5, #32
    8650:	90000020 	adrp	x0, c000 <__func__.0+0x28>
    8654:	913f8000 	add	x0, x0, #0xfe0
    8658:	8b030003 	add	x3, x0, x3
    865c:	aa0303e0 	mov	x0, x3
    8660:	d65f03c0 	ret
    8664:	17fffcaf 	b	7920 <currentlocale>
    8668:	d503201f 	nop
    866c:	d503201f 	nop

0000000000008670 <__smakebuf_r>:
    8670:	a9b57bfd 	stp	x29, x30, [sp, #-176]!
    8674:	910003fd 	mov	x29, sp
    8678:	79402022 	ldrh	w2, [x1, #16]
    867c:	a90153f3 	stp	x19, x20, [sp, #16]
    8680:	aa0103f3 	mov	x19, x1
    8684:	36080122 	tbz	w2, #1, 86a8 <__smakebuf_r+0x38>
    8688:	9101dc20 	add	x0, x1, #0x77
    868c:	52800021 	mov	w1, #0x1                   	// #1
    8690:	f9000260 	str	x0, [x19]
    8694:	f9000e60 	str	x0, [x19, #24]
    8698:	b9002261 	str	w1, [x19, #32]
    869c:	a94153f3 	ldp	x19, x20, [sp, #16]
    86a0:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    86a4:	d65f03c0 	ret
    86a8:	79c02421 	ldrsh	w1, [x1, #18]
    86ac:	aa0003f4 	mov	x20, x0
    86b0:	a9025bf5 	stp	x21, x22, [sp, #32]
    86b4:	f9001bf7 	str	x23, [sp, #48]
    86b8:	37f80381 	tbnz	w1, #31, 8728 <__smakebuf_r+0xb8>
    86bc:	910123e2 	add	x2, sp, #0x48
    86c0:	94000bf0 	bl	b680 <_fstat_r>
    86c4:	37f80300 	tbnz	w0, #31, 8724 <__smakebuf_r+0xb4>
    86c8:	b9404fe0 	ldr	w0, [sp, #76]
    86cc:	d2808016 	mov	x22, #0x400                 	// #1024
    86d0:	52810015 	mov	w21, #0x800                 	// #2048
    86d4:	aa1603e1 	mov	x1, x22
    86d8:	12140c00 	and	w0, w0, #0xf000
    86dc:	7140081f 	cmp	w0, #0x2, lsl #12
    86e0:	aa1403e0 	mov	x0, x20
    86e4:	1a9f17f7 	cset	w23, eq  // eq = none
    86e8:	94000066 	bl	8880 <_malloc_r>
    86ec:	b5000320 	cbnz	x0, 8750 <__smakebuf_r+0xe0>
    86f0:	79c02260 	ldrsh	w0, [x19, #16]
    86f4:	374805c0 	tbnz	w0, #9, 87ac <__smakebuf_r+0x13c>
    86f8:	121e7400 	and	w0, w0, #0xfffffffc
    86fc:	9101de61 	add	x1, x19, #0x77
    8700:	321f0000 	orr	w0, w0, #0x2
    8704:	52800022 	mov	w2, #0x1                   	// #1
    8708:	79002260 	strh	w0, [x19, #16]
    870c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8710:	f9401bf7 	ldr	x23, [sp, #48]
    8714:	f9000261 	str	x1, [x19]
    8718:	f9000e61 	str	x1, [x19, #24]
    871c:	b9002262 	str	w2, [x19, #32]
    8720:	17ffffdf 	b	869c <__smakebuf_r+0x2c>
    8724:	79402262 	ldrh	w2, [x19, #16]
    8728:	f279005f 	tst	x2, #0x80
    872c:	d2808001 	mov	x1, #0x400                 	// #1024
    8730:	d2800816 	mov	x22, #0x40                  	// #64
    8734:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    8738:	aa1603e1 	mov	x1, x22
    873c:	aa1403e0 	mov	x0, x20
    8740:	52800017 	mov	w23, #0x0                   	// #0
    8744:	52800015 	mov	w21, #0x0                   	// #0
    8748:	9400004e 	bl	8880 <_malloc_r>
    874c:	b4fffd20 	cbz	x0, 86f0 <__smakebuf_r+0x80>
    8750:	79c02262 	ldrsh	w2, [x19, #16]
    8754:	d0ffffe1 	adrp	x1, 6000 <_vfiprintf_r+0x1980>
    8758:	91264021 	add	x1, x1, #0x990
    875c:	f9002e81 	str	x1, [x20, #88]
    8760:	32190042 	orr	w2, w2, #0x80
    8764:	f9000260 	str	x0, [x19]
    8768:	79002262 	strh	w2, [x19, #16]
    876c:	f9000e60 	str	x0, [x19, #24]
    8770:	b9002276 	str	w22, [x19, #32]
    8774:	35000117 	cbnz	w23, 8794 <__smakebuf_r+0x124>
    8778:	2a150042 	orr	w2, w2, w21
    877c:	79002262 	strh	w2, [x19, #16]
    8780:	a94153f3 	ldp	x19, x20, [sp, #16]
    8784:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8788:	f9401bf7 	ldr	x23, [sp, #48]
    878c:	a8cb7bfd 	ldp	x29, x30, [sp], #176
    8790:	d65f03c0 	ret
    8794:	79c02661 	ldrsh	w1, [x19, #18]
    8798:	aa1403e0 	mov	x0, x20
    879c:	94000c15 	bl	b7f0 <_isatty_r>
    87a0:	350000c0 	cbnz	w0, 87b8 <__smakebuf_r+0x148>
    87a4:	79c02262 	ldrsh	w2, [x19, #16]
    87a8:	17fffff4 	b	8778 <__smakebuf_r+0x108>
    87ac:	a9425bf5 	ldp	x21, x22, [sp, #32]
    87b0:	f9401bf7 	ldr	x23, [sp, #48]
    87b4:	17ffffba 	b	869c <__smakebuf_r+0x2c>
    87b8:	79402262 	ldrh	w2, [x19, #16]
    87bc:	121e7442 	and	w2, w2, #0xfffffffc
    87c0:	32000042 	orr	w2, w2, #0x1
    87c4:	13003c42 	sxth	w2, w2
    87c8:	17ffffec 	b	8778 <__smakebuf_r+0x108>
    87cc:	d503201f 	nop

00000000000087d0 <__swhatbuf_r>:
    87d0:	a9b67bfd 	stp	x29, x30, [sp, #-160]!
    87d4:	910003fd 	mov	x29, sp
    87d8:	a90153f3 	stp	x19, x20, [sp, #16]
    87dc:	aa0103f3 	mov	x19, x1
    87e0:	79c02421 	ldrsh	w1, [x1, #18]
    87e4:	f90013f5 	str	x21, [sp, #32]
    87e8:	aa0203f4 	mov	x20, x2
    87ec:	aa0303f5 	mov	x21, x3
    87f0:	37f80201 	tbnz	w1, #31, 8830 <__swhatbuf_r+0x60>
    87f4:	9100e3e2 	add	x2, sp, #0x38
    87f8:	94000ba2 	bl	b680 <_fstat_r>
    87fc:	37f801a0 	tbnz	w0, #31, 8830 <__swhatbuf_r+0x60>
    8800:	b9403fe1 	ldr	w1, [sp, #60]
    8804:	d2808002 	mov	x2, #0x400                 	// #1024
    8808:	52810000 	mov	w0, #0x800                 	// #2048
    880c:	12140c21 	and	w1, w1, #0xf000
    8810:	7140083f 	cmp	w1, #0x2, lsl #12
    8814:	1a9f17e1 	cset	w1, eq  // eq = none
    8818:	b90002a1 	str	w1, [x21]
    881c:	f9000282 	str	x2, [x20]
    8820:	a94153f3 	ldp	x19, x20, [sp, #16]
    8824:	f94013f5 	ldr	x21, [sp, #32]
    8828:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    882c:	d65f03c0 	ret
    8830:	79c02260 	ldrsh	w0, [x19, #16]
    8834:	b90002bf 	str	wzr, [x21]
    8838:	36380100 	tbz	w0, #7, 8858 <__swhatbuf_r+0x88>
    883c:	d2800801 	mov	x1, #0x40                  	// #64
    8840:	f9000281 	str	x1, [x20]
    8844:	52800000 	mov	w0, #0x0                   	// #0
    8848:	a94153f3 	ldp	x19, x20, [sp, #16]
    884c:	f94013f5 	ldr	x21, [sp, #32]
    8850:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8854:	d65f03c0 	ret
    8858:	d2808001 	mov	x1, #0x400                 	// #1024
    885c:	f9000281 	str	x1, [x20]
    8860:	52800000 	mov	w0, #0x0                   	// #0
    8864:	a94153f3 	ldp	x19, x20, [sp, #16]
    8868:	f94013f5 	ldr	x21, [sp, #32]
    886c:	a8ca7bfd 	ldp	x29, x30, [sp], #160
    8870:	d65f03c0 	ret
    8874:	d503201f 	nop
    8878:	d503201f 	nop
    887c:	d503201f 	nop

0000000000008880 <_malloc_r>:
    8880:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    8884:	910003fd 	mov	x29, sp
    8888:	a90153f3 	stp	x19, x20, [sp, #16]
    888c:	91005c33 	add	x19, x1, #0x17
    8890:	a9025bf5 	stp	x21, x22, [sp, #32]
    8894:	aa0003f5 	mov	x21, x0
    8898:	a90363f7 	stp	x23, x24, [sp, #48]
    889c:	f100ba7f 	cmp	x19, #0x2e
    88a0:	54000c88 	b.hi	8a30 <_malloc_r+0x1b0>  // b.pmore
    88a4:	f100803f 	cmp	x1, #0x20
    88a8:	54002068 	b.hi	8cb4 <_malloc_r+0x434>  // b.pmore
    88ac:	940003fd 	bl	98a0 <__malloc_lock>
    88b0:	d2800413 	mov	x19, #0x20                  	// #32
    88b4:	d2800a00 	mov	x0, #0x50                  	// #80
    88b8:	52800085 	mov	w5, #0x4                   	// #4
    88bc:	b0000034 	adrp	x20, d000 <__global_locale+0x20>
    88c0:	91062294 	add	x20, x20, #0x188
    88c4:	8b000280 	add	x0, x20, x0
    88c8:	110008a5 	add	w5, w5, #0x2
    88cc:	d1004000 	sub	x0, x0, #0x10
    88d0:	f9400c01 	ldr	x1, [x0, #24]
    88d4:	eb00003f 	cmp	x1, x0
    88d8:	54002181 	b.ne	8d08 <_malloc_r+0x488>  // b.any
    88dc:	f9401284 	ldr	x4, [x20, #32]
    88e0:	91004282 	add	x2, x20, #0x10
    88e4:	eb02009f 	cmp	x4, x2
    88e8:	54000f20 	b.eq	8acc <_malloc_r+0x24c>  // b.none
    88ec:	f9400481 	ldr	x1, [x4, #8]
    88f0:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    88f4:	cb130023 	sub	x3, x1, x19
    88f8:	f1007c7f 	cmp	x3, #0x1f
    88fc:	54002d4c 	b.gt	8ea4 <_malloc_r+0x624>
    8900:	a9020a82 	stp	x2, x2, [x20, #32]
    8904:	b6f81f23 	tbz	x3, #63, 8ce8 <_malloc_r+0x468>
    8908:	f107fc3f 	cmp	x1, #0x1ff
    890c:	54002428 	b.hi	8d90 <_malloc_r+0x510>  // b.pmore
    8910:	d343fc22 	lsr	x2, x1, #3
    8914:	d2800021 	mov	x1, #0x1                   	// #1
    8918:	11000440 	add	w0, w2, #0x1
    891c:	13027c42 	asr	w2, w2, #2
    8920:	531f7800 	lsl	w0, w0, #1
    8924:	f9400683 	ldr	x3, [x20, #8]
    8928:	8b20ce80 	add	x0, x20, w0, sxtw #3
    892c:	9ac22021 	lsl	x1, x1, x2
    8930:	aa030021 	orr	x1, x1, x3
    8934:	f85f0402 	ldr	x2, [x0], #-16
    8938:	f9000681 	str	x1, [x20, #8]
    893c:	a9010082 	stp	x2, x0, [x4, #16]
    8940:	f9000804 	str	x4, [x0, #16]
    8944:	f9000c44 	str	x4, [x2, #24]
    8948:	13027ca2 	asr	w2, w5, #2
    894c:	d2800020 	mov	x0, #0x1                   	// #1
    8950:	9ac22000 	lsl	x0, x0, x2
    8954:	eb01001f 	cmp	x0, x1
    8958:	54000c68 	b.hi	8ae4 <_malloc_r+0x264>  // b.pmore
    895c:	ea01001f 	tst	x0, x1
    8960:	540000c1 	b.ne	8978 <_malloc_r+0xf8>  // b.any
    8964:	121e74a5 	and	w5, w5, #0xfffffffc
    8968:	d37ff800 	lsl	x0, x0, #1
    896c:	110010a5 	add	w5, w5, #0x4
    8970:	ea01001f 	tst	x0, x1
    8974:	54ffffa0 	b.eq	8968 <_malloc_r+0xe8>  // b.none
    8978:	928001e9 	mov	x9, #0xfffffffffffffff0    	// #-16
    897c:	110004a7 	add	w7, w5, #0x1
    8980:	2a0503e8 	mov	w8, w5
    8984:	531f78e7 	lsl	w7, w7, #1
    8988:	8b27cd27 	add	x7, x9, w7, sxtw #3
    898c:	8b070287 	add	x7, x20, x7
    8990:	aa0703e4 	mov	x4, x7
    8994:	f9400c81 	ldr	x1, [x4, #24]
    8998:	14000009 	b	89bc <_malloc_r+0x13c>
    899c:	f9400422 	ldr	x2, [x1, #8]
    89a0:	aa0103e6 	mov	x6, x1
    89a4:	f9400c21 	ldr	x1, [x1, #24]
    89a8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    89ac:	cb130043 	sub	x3, x2, x19
    89b0:	f1007c7f 	cmp	x3, #0x1f
    89b4:	5400238c 	b.gt	8e24 <_malloc_r+0x5a4>
    89b8:	b6f82563 	tbz	x3, #63, 8e64 <_malloc_r+0x5e4>
    89bc:	eb01009f 	cmp	x4, x1
    89c0:	54fffee1 	b.ne	899c <_malloc_r+0x11c>  // b.any
    89c4:	7100f91f 	cmp	w8, #0x3e
    89c8:	540029cd 	b.le	8f00 <_malloc_r+0x680>
    89cc:	91004084 	add	x4, x4, #0x10
    89d0:	11000508 	add	w8, w8, #0x1
    89d4:	f240051f 	tst	x8, #0x3
    89d8:	54fffde1 	b.ne	8994 <_malloc_r+0x114>  // b.any
    89dc:	14000005 	b	89f0 <_malloc_r+0x170>
    89e0:	f85f04e1 	ldr	x1, [x7], #-16
    89e4:	510004a5 	sub	w5, w5, #0x1
    89e8:	eb07003f 	cmp	x1, x7
    89ec:	540035a1 	b.ne	90a0 <_malloc_r+0x820>  // b.any
    89f0:	f24004bf 	tst	x5, #0x3
    89f4:	54ffff61 	b.ne	89e0 <_malloc_r+0x160>  // b.any
    89f8:	f9400681 	ldr	x1, [x20, #8]
    89fc:	8a200021 	bic	x1, x1, x0
    8a00:	f9000681 	str	x1, [x20, #8]
    8a04:	d37ff800 	lsl	x0, x0, #1
    8a08:	f100001f 	cmp	x0, #0x0
    8a0c:	fa411002 	ccmp	x0, x1, #0x2, ne  // ne = any
    8a10:	54000089 	b.ls	8a20 <_malloc_r+0x1a0>  // b.plast
    8a14:	14000034 	b	8ae4 <_malloc_r+0x264>
    8a18:	d37ff800 	lsl	x0, x0, #1
    8a1c:	11001108 	add	w8, w8, #0x4
    8a20:	ea01001f 	tst	x0, x1
    8a24:	54ffffa0 	b.eq	8a18 <_malloc_r+0x198>  // b.none
    8a28:	2a0803e5 	mov	w5, w8
    8a2c:	17ffffd4 	b	897c <_malloc_r+0xfc>
    8a30:	927cee73 	and	x19, x19, #0xfffffffffffffff0
    8a34:	b2407be2 	mov	x2, #0x7fffffff            	// #2147483647
    8a38:	eb02027f 	cmp	x19, x2
    8a3c:	fa539022 	ccmp	x1, x19, #0x2, ls  // ls = plast
    8a40:	540013a8 	b.hi	8cb4 <_malloc_r+0x434>  // b.pmore
    8a44:	94000397 	bl	98a0 <__malloc_lock>
    8a48:	f107de7f 	cmp	x19, #0x1f7
    8a4c:	54002229 	b.ls	8e90 <_malloc_r+0x610>  // b.plast
    8a50:	d349fe60 	lsr	x0, x19, #9
    8a54:	b4001420 	cbz	x0, 8cd8 <_malloc_r+0x458>
    8a58:	f100101f 	cmp	x0, #0x4
    8a5c:	54001d08 	b.hi	8dfc <_malloc_r+0x57c>  // b.pmore
    8a60:	d346fe60 	lsr	x0, x19, #6
    8a64:	1100e405 	add	w5, w0, #0x39
    8a68:	1100e000 	add	w0, w0, #0x38
    8a6c:	531f78a4 	lsl	w4, w5, #1
    8a70:	937d7c84 	sbfiz	x4, x4, #3, #32
    8a74:	b0000034 	adrp	x20, d000 <__global_locale+0x20>
    8a78:	91062294 	add	x20, x20, #0x188
    8a7c:	8b040284 	add	x4, x20, x4
    8a80:	d1004084 	sub	x4, x4, #0x10
    8a84:	f9400c81 	ldr	x1, [x4, #24]
    8a88:	eb01009f 	cmp	x4, x1
    8a8c:	540000c1 	b.ne	8aa4 <_malloc_r+0x224>  // b.any
    8a90:	17ffff93 	b	88dc <_malloc_r+0x5c>
    8a94:	b6f815e3 	tbz	x3, #63, 8d50 <_malloc_r+0x4d0>
    8a98:	f9400c21 	ldr	x1, [x1, #24]
    8a9c:	eb01009f 	cmp	x4, x1
    8aa0:	54fff1e0 	b.eq	88dc <_malloc_r+0x5c>  // b.none
    8aa4:	f9400422 	ldr	x2, [x1, #8]
    8aa8:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    8aac:	cb130043 	sub	x3, x2, x19
    8ab0:	f1007c7f 	cmp	x3, #0x1f
    8ab4:	54ffff0d 	b.le	8a94 <_malloc_r+0x214>
    8ab8:	f9401284 	ldr	x4, [x20, #32]
    8abc:	91004282 	add	x2, x20, #0x10
    8ac0:	2a0003e5 	mov	w5, w0
    8ac4:	eb02009f 	cmp	x4, x2
    8ac8:	54fff121 	b.ne	88ec <_malloc_r+0x6c>  // b.any
    8acc:	f9400681 	ldr	x1, [x20, #8]
    8ad0:	13027ca2 	asr	w2, w5, #2
    8ad4:	d2800020 	mov	x0, #0x1                   	// #1
    8ad8:	9ac22000 	lsl	x0, x0, x2
    8adc:	eb01001f 	cmp	x0, x1
    8ae0:	54fff3e9 	b.ls	895c <_malloc_r+0xdc>  // b.plast
    8ae4:	f9400a97 	ldr	x23, [x20, #16]
    8ae8:	f94006f6 	ldr	x22, [x23, #8]
    8aec:	927ef6d8 	and	x24, x22, #0xfffffffffffffffc
    8af0:	eb18027f 	cmp	x19, x24
    8af4:	cb130300 	sub	x0, x24, x19
    8af8:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    8afc:	54000bec 	b.gt	8c78 <_malloc_r+0x3f8>
    8b00:	b0000021 	adrp	x1, d000 <__global_locale+0x20>
    8b04:	a90573fb 	stp	x27, x28, [sp, #80]
    8b08:	b000003b 	adrp	x27, d000 <__global_locale+0x20>
    8b0c:	f946d821 	ldr	x1, [x1, #3504]
    8b10:	d28203e3 	mov	x3, #0x101f                	// #4127
    8b14:	f944cf62 	ldr	x2, [x27, #2456]
    8b18:	8b010261 	add	x1, x19, x1
    8b1c:	8b030036 	add	x22, x1, x3
    8b20:	91008021 	add	x1, x1, #0x20
    8b24:	b100045f 	cmn	x2, #0x1
    8b28:	9274ced6 	and	x22, x22, #0xfffffffffffff000
    8b2c:	9a8112d6 	csel	x22, x22, x1, ne  // ne = any
    8b30:	aa1503e0 	mov	x0, x21
    8b34:	aa1603e1 	mov	x1, x22
    8b38:	a9046bf9 	stp	x25, x26, [sp, #64]
    8b3c:	940004b1 	bl	9e00 <_sbrk_r>
    8b40:	8b1802fa 	add	x26, x23, x24
    8b44:	aa0003f9 	mov	x25, x0
    8b48:	b100041f 	cmn	x0, #0x1
    8b4c:	54001f20 	b.eq	8f30 <_malloc_r+0x6b0>  // b.none
    8b50:	eb00035f 	cmp	x26, x0
    8b54:	fa5482e4 	ccmp	x23, x20, #0x4, hi  // hi = pmore
    8b58:	54001ec1 	b.ne	8f30 <_malloc_r+0x6b0>  // b.any
    8b5c:	b000003c 	adrp	x28, d000 <__global_locale+0x20>
    8b60:	b94d7b81 	ldr	w1, [x28, #3448]
    8b64:	0b160021 	add	w1, w1, w22
    8b68:	b90d7b81 	str	w1, [x28, #3448]
    8b6c:	eb00035f 	cmp	x26, x0
    8b70:	54001ce0 	b.eq	8f0c <_malloc_r+0x68c>  // b.none
    8b74:	f944cf60 	ldr	x0, [x27, #2456]
    8b78:	b100041f 	cmn	x0, #0x1
    8b7c:	54001d60 	b.eq	8f28 <_malloc_r+0x6a8>  // b.none
    8b80:	cb1a033a 	sub	x26, x25, x26
    8b84:	0b1a0021 	add	w1, w1, w26
    8b88:	b90d7b81 	str	w1, [x28, #3448]
    8b8c:	f2400f3a 	ands	x26, x25, #0xf
    8b90:	54001e40 	b.eq	8f58 <_malloc_r+0x6d8>  // b.none
    8b94:	cb1a0339 	sub	x25, x25, x26
    8b98:	d2820201 	mov	x1, #0x1010                	// #4112
    8b9c:	91004339 	add	x25, x25, #0x10
    8ba0:	cb1a0021 	sub	x1, x1, x26
    8ba4:	8b16033b 	add	x27, x25, x22
    8ba8:	aa1503e0 	mov	x0, x21
    8bac:	cb1b0036 	sub	x22, x1, x27
    8bb0:	92402ed6 	and	x22, x22, #0xfff
    8bb4:	aa1603e1 	mov	x1, x22
    8bb8:	94000492 	bl	9e00 <_sbrk_r>
    8bbc:	b100041f 	cmn	x0, #0x1
    8bc0:	54002480 	b.eq	9050 <_malloc_r+0x7d0>  // b.none
    8bc4:	cb190000 	sub	x0, x0, x25
    8bc8:	2a1603e2 	mov	w2, w22
    8bcc:	8b160016 	add	x22, x0, x22
    8bd0:	b94d7b81 	ldr	w1, [x28, #3448]
    8bd4:	b24002d6 	orr	x22, x22, #0x1
    8bd8:	f9000a99 	str	x25, [x20, #16]
    8bdc:	0b010041 	add	w1, w2, w1
    8be0:	b90d7b81 	str	w1, [x28, #3448]
    8be4:	f9000736 	str	x22, [x25, #8]
    8be8:	eb1402ff 	cmp	x23, x20
    8bec:	54002000 	b.eq	8fec <_malloc_r+0x76c>  // b.none
    8bf0:	f1007f1f 	cmp	x24, #0x1f
    8bf4:	54001cc9 	b.ls	8f8c <_malloc_r+0x70c>  // b.plast
    8bf8:	d1006300 	sub	x0, x24, #0x18
    8bfc:	d2800124 	mov	x4, #0x9                   	// #9
    8c00:	f94006e2 	ldr	x2, [x23, #8]
    8c04:	927cec00 	and	x0, x0, #0xfffffffffffffff0
    8c08:	8b0002e3 	add	x3, x23, x0
    8c0c:	92400042 	and	x2, x2, #0x1
    8c10:	aa000042 	orr	x2, x2, x0
    8c14:	f90006e2 	str	x2, [x23, #8]
    8c18:	f8008c64 	str	x4, [x3, #8]!
    8c1c:	f9000464 	str	x4, [x3, #8]
    8c20:	f1007c1f 	cmp	x0, #0x1f
    8c24:	54002088 	b.hi	9034 <_malloc_r+0x7b4>  // b.pmore
    8c28:	f9400736 	ldr	x22, [x25, #8]
    8c2c:	aa1903f7 	mov	x23, x25
    8c30:	b0000020 	adrp	x0, d000 <__global_locale+0x20>
    8c34:	93407c21 	sxtw	x1, w1
    8c38:	f946d002 	ldr	x2, [x0, #3488]
    8c3c:	eb02003f 	cmp	x1, x2
    8c40:	54000049 	b.ls	8c48 <_malloc_r+0x3c8>  // b.plast
    8c44:	f906d001 	str	x1, [x0, #3488]
    8c48:	b0000020 	adrp	x0, d000 <__global_locale+0x20>
    8c4c:	f946d402 	ldr	x2, [x0, #3496]
    8c50:	eb02003f 	cmp	x1, x2
    8c54:	54000049 	b.ls	8c5c <_malloc_r+0x3dc>  // b.plast
    8c58:	f906d401 	str	x1, [x0, #3496]
    8c5c:	927ef6c0 	and	x0, x22, #0xfffffffffffffffc
    8c60:	eb00027f 	cmp	x19, x0
    8c64:	cb130000 	sub	x0, x0, x19
    8c68:	fa5f9804 	ccmp	x0, #0x1f, #0x4, ls  // ls = plast
    8c6c:	5400194d 	b.le	8f94 <_malloc_r+0x714>
    8c70:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8c74:	a94573fb 	ldp	x27, x28, [sp, #80]
    8c78:	8b1302e2 	add	x2, x23, x19
    8c7c:	b2400273 	orr	x19, x19, #0x1
    8c80:	f90006f3 	str	x19, [x23, #8]
    8c84:	b2400001 	orr	x1, x0, #0x1
    8c88:	f9000a82 	str	x2, [x20, #16]
    8c8c:	f9000441 	str	x1, [x2, #8]
    8c90:	aa1503e0 	mov	x0, x21
    8c94:	910042f7 	add	x23, x23, #0x10
    8c98:	94000306 	bl	98b0 <__malloc_unlock>
    8c9c:	aa1703e0 	mov	x0, x23
    8ca0:	a94153f3 	ldp	x19, x20, [sp, #16]
    8ca4:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8ca8:	a94363f7 	ldp	x23, x24, [sp, #48]
    8cac:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8cb0:	d65f03c0 	ret
    8cb4:	52800180 	mov	w0, #0xc                   	// #12
    8cb8:	d2800017 	mov	x23, #0x0                   	// #0
    8cbc:	b90002a0 	str	w0, [x21]
    8cc0:	aa1703e0 	mov	x0, x23
    8cc4:	a94153f3 	ldp	x19, x20, [sp, #16]
    8cc8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8ccc:	a94363f7 	ldp	x23, x24, [sp, #48]
    8cd0:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8cd4:	d65f03c0 	ret
    8cd8:	d2808004 	mov	x4, #0x400                 	// #1024
    8cdc:	52800805 	mov	w5, #0x40                  	// #64
    8ce0:	528007e0 	mov	w0, #0x3f                  	// #63
    8ce4:	17ffff64 	b	8a74 <_malloc_r+0x1f4>
    8ce8:	8b010081 	add	x1, x4, x1
    8cec:	aa1503e0 	mov	x0, x21
    8cf0:	91004097 	add	x23, x4, #0x10
    8cf4:	f9400422 	ldr	x2, [x1, #8]
    8cf8:	b2400042 	orr	x2, x2, #0x1
    8cfc:	f9000422 	str	x2, [x1, #8]
    8d00:	940002ec 	bl	98b0 <__malloc_unlock>
    8d04:	17ffffef 	b	8cc0 <_malloc_r+0x440>
    8d08:	a9409022 	ldp	x2, x4, [x1, #8]
    8d0c:	91004037 	add	x23, x1, #0x10
    8d10:	f9400c23 	ldr	x3, [x1, #24]
    8d14:	aa1503e0 	mov	x0, x21
    8d18:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    8d1c:	8b020022 	add	x2, x1, x2
    8d20:	f9400441 	ldr	x1, [x2, #8]
    8d24:	f9000c83 	str	x3, [x4, #24]
    8d28:	f9000864 	str	x4, [x3, #16]
    8d2c:	b2400021 	orr	x1, x1, #0x1
    8d30:	f9000441 	str	x1, [x2, #8]
    8d34:	940002df 	bl	98b0 <__malloc_unlock>
    8d38:	aa1703e0 	mov	x0, x23
    8d3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8d40:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8d44:	a94363f7 	ldp	x23, x24, [sp, #48]
    8d48:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8d4c:	d65f03c0 	ret
    8d50:	8b020022 	add	x2, x1, x2
    8d54:	91004037 	add	x23, x1, #0x10
    8d58:	a9410c24 	ldp	x4, x3, [x1, #16]
    8d5c:	aa1503e0 	mov	x0, x21
    8d60:	f9400441 	ldr	x1, [x2, #8]
    8d64:	f9000c83 	str	x3, [x4, #24]
    8d68:	b2400021 	orr	x1, x1, #0x1
    8d6c:	f9000864 	str	x4, [x3, #16]
    8d70:	f9000441 	str	x1, [x2, #8]
    8d74:	940002cf 	bl	98b0 <__malloc_unlock>
    8d78:	aa1703e0 	mov	x0, x23
    8d7c:	a94153f3 	ldp	x19, x20, [sp, #16]
    8d80:	a9425bf5 	ldp	x21, x22, [sp, #32]
    8d84:	a94363f7 	ldp	x23, x24, [sp, #48]
    8d88:	a8c67bfd 	ldp	x29, x30, [sp], #96
    8d8c:	d65f03c0 	ret
    8d90:	d349fc20 	lsr	x0, x1, #9
    8d94:	f127fc3f 	cmp	x1, #0x9ff
    8d98:	540009e9 	b.ls	8ed4 <_malloc_r+0x654>  // b.plast
    8d9c:	f100501f 	cmp	x0, #0x14
    8da0:	54001068 	b.hi	8fac <_malloc_r+0x72c>  // b.pmore
    8da4:	11017003 	add	w3, w0, #0x5c
    8da8:	11016c02 	add	w2, w0, #0x5b
    8dac:	531f7863 	lsl	w3, w3, #1
    8db0:	937d7c63 	sbfiz	x3, x3, #3, #32
    8db4:	8b030283 	add	x3, x20, x3
    8db8:	f85f0460 	ldr	x0, [x3], #-16
    8dbc:	eb00007f 	cmp	x3, x0
    8dc0:	54000be0 	b.eq	8f3c <_malloc_r+0x6bc>  // b.none
    8dc4:	d503201f 	nop
    8dc8:	f9400402 	ldr	x2, [x0, #8]
    8dcc:	927ef442 	and	x2, x2, #0xfffffffffffffffc
    8dd0:	eb01005f 	cmp	x2, x1
    8dd4:	54000089 	b.ls	8de4 <_malloc_r+0x564>  // b.plast
    8dd8:	f9400800 	ldr	x0, [x0, #16]
    8ddc:	eb00007f 	cmp	x3, x0
    8de0:	54ffff41 	b.ne	8dc8 <_malloc_r+0x548>  // b.any
    8de4:	f9400681 	ldr	x1, [x20, #8]
    8de8:	f9400c03 	ldr	x3, [x0, #24]
    8dec:	a9010c80 	stp	x0, x3, [x4, #16]
    8df0:	f9000864 	str	x4, [x3, #16]
    8df4:	f9000c04 	str	x4, [x0, #24]
    8df8:	17fffed4 	b	8948 <_malloc_r+0xc8>
    8dfc:	f100501f 	cmp	x0, #0x14
    8e00:	54000769 	b.ls	8eec <_malloc_r+0x66c>  // b.plast
    8e04:	f101501f 	cmp	x0, #0x54
    8e08:	54000e28 	b.hi	8fcc <_malloc_r+0x74c>  // b.pmore
    8e0c:	d34cfe60 	lsr	x0, x19, #12
    8e10:	1101bc05 	add	w5, w0, #0x6f
    8e14:	1101b800 	add	w0, w0, #0x6e
    8e18:	531f78a4 	lsl	w4, w5, #1
    8e1c:	937d7c84 	sbfiz	x4, x4, #3, #32
    8e20:	17ffff15 	b	8a74 <_malloc_r+0x1f4>
    8e24:	f94008c7 	ldr	x7, [x6, #16]
    8e28:	b2400260 	orr	x0, x19, #0x1
    8e2c:	f90004c0 	str	x0, [x6, #8]
    8e30:	8b1300c4 	add	x4, x6, x19
    8e34:	91004285 	add	x5, x20, #0x10
    8e38:	b2400068 	orr	x8, x3, #0x1
    8e3c:	f9000ce1 	str	x1, [x7, #24]
    8e40:	910040d7 	add	x23, x6, #0x10
    8e44:	f9000827 	str	x7, [x1, #16]
    8e48:	aa1503e0 	mov	x0, x21
    8e4c:	a9021284 	stp	x4, x4, [x20, #32]
    8e50:	a9009488 	stp	x8, x5, [x4, #8]
    8e54:	f9000c85 	str	x5, [x4, #24]
    8e58:	f82268c3 	str	x3, [x6, x2]
    8e5c:	94000295 	bl	98b0 <__malloc_unlock>
    8e60:	17ffff98 	b	8cc0 <_malloc_r+0x440>
    8e64:	8b0200c2 	add	x2, x6, x2
    8e68:	aa0603f7 	mov	x23, x6
    8e6c:	aa1503e0 	mov	x0, x21
    8e70:	f9400443 	ldr	x3, [x2, #8]
    8e74:	f8410ee4 	ldr	x4, [x23, #16]!
    8e78:	b2400063 	orr	x3, x3, #0x1
    8e7c:	f9000443 	str	x3, [x2, #8]
    8e80:	f9000c81 	str	x1, [x4, #24]
    8e84:	f9000824 	str	x4, [x1, #16]
    8e88:	9400028a 	bl	98b0 <__malloc_unlock>
    8e8c:	17ffff8d 	b	8cc0 <_malloc_r+0x440>
    8e90:	d343fe65 	lsr	x5, x19, #3
    8e94:	110004a0 	add	w0, w5, #0x1
    8e98:	531f7800 	lsl	w0, w0, #1
    8e9c:	937d7c00 	sbfiz	x0, x0, #3, #32
    8ea0:	17fffe87 	b	88bc <_malloc_r+0x3c>
    8ea4:	8b130085 	add	x5, x4, x19
    8ea8:	b2400273 	orr	x19, x19, #0x1
    8eac:	f9000493 	str	x19, [x4, #8]
    8eb0:	b2400066 	orr	x6, x3, #0x1
    8eb4:	a9021685 	stp	x5, x5, [x20, #32]
    8eb8:	aa1503e0 	mov	x0, x21
    8ebc:	91004097 	add	x23, x4, #0x10
    8ec0:	a90088a6 	stp	x6, x2, [x5, #8]
    8ec4:	f9000ca2 	str	x2, [x5, #24]
    8ec8:	f8216883 	str	x3, [x4, x1]
    8ecc:	94000279 	bl	98b0 <__malloc_unlock>
    8ed0:	17ffff7c 	b	8cc0 <_malloc_r+0x440>
    8ed4:	d346fc20 	lsr	x0, x1, #6
    8ed8:	1100e403 	add	w3, w0, #0x39
    8edc:	1100e002 	add	w2, w0, #0x38
    8ee0:	531f7863 	lsl	w3, w3, #1
    8ee4:	937d7c63 	sbfiz	x3, x3, #3, #32
    8ee8:	17ffffb3 	b	8db4 <_malloc_r+0x534>
    8eec:	11017005 	add	w5, w0, #0x5c
    8ef0:	11016c00 	add	w0, w0, #0x5b
    8ef4:	531f78a4 	lsl	w4, w5, #1
    8ef8:	937d7c84 	sbfiz	x4, x4, #3, #32
    8efc:	17fffede 	b	8a74 <_malloc_r+0x1f4>
    8f00:	11000508 	add	w8, w8, #0x1
    8f04:	91008084 	add	x4, x4, #0x20
    8f08:	17fffeb2 	b	89d0 <_malloc_r+0x150>
    8f0c:	f2402f5f 	tst	x26, #0xfff
    8f10:	54ffe321 	b.ne	8b74 <_malloc_r+0x2f4>  // b.any
    8f14:	f9400a97 	ldr	x23, [x20, #16]
    8f18:	8b160316 	add	x22, x24, x22
    8f1c:	b24002d6 	orr	x22, x22, #0x1
    8f20:	f90006f6 	str	x22, [x23, #8]
    8f24:	17ffff43 	b	8c30 <_malloc_r+0x3b0>
    8f28:	f904cf79 	str	x25, [x27, #2456]
    8f2c:	17ffff18 	b	8b8c <_malloc_r+0x30c>
    8f30:	f9400a97 	ldr	x23, [x20, #16]
    8f34:	f94006f6 	ldr	x22, [x23, #8]
    8f38:	17ffff49 	b	8c5c <_malloc_r+0x3dc>
    8f3c:	f9400686 	ldr	x6, [x20, #8]
    8f40:	13027c42 	asr	w2, w2, #2
    8f44:	d2800021 	mov	x1, #0x1                   	// #1
    8f48:	9ac22021 	lsl	x1, x1, x2
    8f4c:	aa060021 	orr	x1, x1, x6
    8f50:	f9000681 	str	x1, [x20, #8]
    8f54:	17ffffa6 	b	8dec <_malloc_r+0x56c>
    8f58:	8b16033a 	add	x26, x25, x22
    8f5c:	aa1503e0 	mov	x0, x21
    8f60:	cb1a03fa 	neg	x26, x26
    8f64:	92402f5a 	and	x26, x26, #0xfff
    8f68:	aa1a03e1 	mov	x1, x26
    8f6c:	940003a5 	bl	9e00 <_sbrk_r>
    8f70:	52800002 	mov	w2, #0x0                   	// #0
    8f74:	b100041f 	cmn	x0, #0x1
    8f78:	54ffe2c0 	b.eq	8bd0 <_malloc_r+0x350>  // b.none
    8f7c:	cb190000 	sub	x0, x0, x25
    8f80:	2a1a03e2 	mov	w2, w26
    8f84:	8b1a0016 	add	x22, x0, x26
    8f88:	17ffff12 	b	8bd0 <_malloc_r+0x350>
    8f8c:	d2800020 	mov	x0, #0x1                   	// #1
    8f90:	f9000720 	str	x0, [x25, #8]
    8f94:	aa1503e0 	mov	x0, x21
    8f98:	d2800017 	mov	x23, #0x0                   	// #0
    8f9c:	94000245 	bl	98b0 <__malloc_unlock>
    8fa0:	a9446bf9 	ldp	x25, x26, [sp, #64]
    8fa4:	a94573fb 	ldp	x27, x28, [sp, #80]
    8fa8:	17ffff46 	b	8cc0 <_malloc_r+0x440>
    8fac:	f101501f 	cmp	x0, #0x54
    8fb0:	54000228 	b.hi	8ff4 <_malloc_r+0x774>  // b.pmore
    8fb4:	d34cfc20 	lsr	x0, x1, #12
    8fb8:	1101bc03 	add	w3, w0, #0x6f
    8fbc:	1101b802 	add	w2, w0, #0x6e
    8fc0:	531f7863 	lsl	w3, w3, #1
    8fc4:	937d7c63 	sbfiz	x3, x3, #3, #32
    8fc8:	17ffff7b 	b	8db4 <_malloc_r+0x534>
    8fcc:	f105501f 	cmp	x0, #0x154
    8fd0:	54000228 	b.hi	9014 <_malloc_r+0x794>  // b.pmore
    8fd4:	d34ffe60 	lsr	x0, x19, #15
    8fd8:	1101e005 	add	w5, w0, #0x78
    8fdc:	1101dc00 	add	w0, w0, #0x77
    8fe0:	531f78a4 	lsl	w4, w5, #1
    8fe4:	937d7c84 	sbfiz	x4, x4, #3, #32
    8fe8:	17fffea3 	b	8a74 <_malloc_r+0x1f4>
    8fec:	aa1903f7 	mov	x23, x25
    8ff0:	17ffff10 	b	8c30 <_malloc_r+0x3b0>
    8ff4:	f105501f 	cmp	x0, #0x154
    8ff8:	54000368 	b.hi	9064 <_malloc_r+0x7e4>  // b.pmore
    8ffc:	d34ffc20 	lsr	x0, x1, #15
    9000:	1101e003 	add	w3, w0, #0x78
    9004:	1101dc02 	add	w2, w0, #0x77
    9008:	531f7863 	lsl	w3, w3, #1
    900c:	937d7c63 	sbfiz	x3, x3, #3, #32
    9010:	17ffff69 	b	8db4 <_malloc_r+0x534>
    9014:	f115501f 	cmp	x0, #0x554
    9018:	54000368 	b.hi	9084 <_malloc_r+0x804>  // b.pmore
    901c:	d352fe60 	lsr	x0, x19, #18
    9020:	1101f405 	add	w5, w0, #0x7d
    9024:	1101f000 	add	w0, w0, #0x7c
    9028:	531f78a4 	lsl	w4, w5, #1
    902c:	937d7c84 	sbfiz	x4, x4, #3, #32
    9030:	17fffe91 	b	8a74 <_malloc_r+0x1f4>
    9034:	910042e1 	add	x1, x23, #0x10
    9038:	aa1503e0 	mov	x0, x21
    903c:	97fff7f1 	bl	7000 <_free_r>
    9040:	f9400a97 	ldr	x23, [x20, #16]
    9044:	b94d7b81 	ldr	w1, [x28, #3448]
    9048:	f94006f6 	ldr	x22, [x23, #8]
    904c:	17fffef9 	b	8c30 <_malloc_r+0x3b0>
    9050:	d100435a 	sub	x26, x26, #0x10
    9054:	52800002 	mov	w2, #0x0                   	// #0
    9058:	8b1a0376 	add	x22, x27, x26
    905c:	cb1902d6 	sub	x22, x22, x25
    9060:	17fffedc 	b	8bd0 <_malloc_r+0x350>
    9064:	f115501f 	cmp	x0, #0x554
    9068:	54000168 	b.hi	9094 <_malloc_r+0x814>  // b.pmore
    906c:	d352fc20 	lsr	x0, x1, #18
    9070:	1101f403 	add	w3, w0, #0x7d
    9074:	1101f002 	add	w2, w0, #0x7c
    9078:	531f7863 	lsl	w3, w3, #1
    907c:	937d7c63 	sbfiz	x3, x3, #3, #32
    9080:	17ffff4d 	b	8db4 <_malloc_r+0x534>
    9084:	d280fe04 	mov	x4, #0x7f0                 	// #2032
    9088:	52800fe5 	mov	w5, #0x7f                  	// #127
    908c:	52800fc0 	mov	w0, #0x7e                  	// #126
    9090:	17fffe79 	b	8a74 <_malloc_r+0x1f4>
    9094:	d280fe03 	mov	x3, #0x7f0                 	// #2032
    9098:	52800fc2 	mov	w2, #0x7e                  	// #126
    909c:	17ffff46 	b	8db4 <_malloc_r+0x534>
    90a0:	f9400681 	ldr	x1, [x20, #8]
    90a4:	17fffe58 	b	8a04 <_malloc_r+0x184>
    90a8:	d503201f 	nop
    90ac:	d503201f 	nop

00000000000090b0 <_mbtowc_r>:
    90b0:	90000025 	adrp	x5, d000 <__global_locale+0x20>
    90b4:	f94064a5 	ldr	x5, [x5, #200]
    90b8:	aa0503f0 	mov	x16, x5
    90bc:	d61f0200 	br	x16

00000000000090c0 <__ascii_mbtowc>:
    90c0:	d10043ff 	sub	sp, sp, #0x10
    90c4:	f100003f 	cmp	x1, #0x0
    90c8:	910033e0 	add	x0, sp, #0xc
    90cc:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    90d0:	b4000122 	cbz	x2, 90f4 <__ascii_mbtowc+0x34>
    90d4:	b4000163 	cbz	x3, 9100 <__ascii_mbtowc+0x40>
    90d8:	39400040 	ldrb	w0, [x2]
    90dc:	b9000020 	str	w0, [x1]
    90e0:	39400040 	ldrb	w0, [x2]
    90e4:	7100001f 	cmp	w0, #0x0
    90e8:	1a9f07e0 	cset	w0, ne  // ne = any
    90ec:	910043ff 	add	sp, sp, #0x10
    90f0:	d65f03c0 	ret
    90f4:	52800000 	mov	w0, #0x0                   	// #0
    90f8:	910043ff 	add	sp, sp, #0x10
    90fc:	d65f03c0 	ret
    9100:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9104:	17fffffa 	b	90ec <__ascii_mbtowc+0x2c>
    9108:	d503201f 	nop
    910c:	d503201f 	nop

0000000000009110 <__utf8_mbtowc>:
    9110:	d10043ff 	sub	sp, sp, #0x10
    9114:	f100003f 	cmp	x1, #0x0
    9118:	910033e5 	add	x5, sp, #0xc
    911c:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    9120:	b4000a02 	cbz	x2, 9260 <__utf8_mbtowc+0x150>
    9124:	b40012a3 	cbz	x3, 9378 <__utf8_mbtowc+0x268>
    9128:	b9400086 	ldr	w6, [x4]
    912c:	aa0003e8 	mov	x8, x0
    9130:	350003c6 	cbnz	w6, 91a8 <__utf8_mbtowc+0x98>
    9134:	39400040 	ldrb	w0, [x2]
    9138:	52800025 	mov	w5, #0x1                   	// #1
    913c:	340003c0 	cbz	w0, 91b4 <__utf8_mbtowc+0xa4>
    9140:	7101fc1f 	cmp	w0, #0x7f
    9144:	5400084d 	b.le	924c <__utf8_mbtowc+0x13c>
    9148:	51030007 	sub	w7, w0, #0xc0
    914c:	71007cff 	cmp	w7, #0x1f
    9150:	540003a8 	b.hi	91c4 <__utf8_mbtowc+0xb4>  // b.pmore
    9154:	39001080 	strb	w0, [x4, #4]
    9158:	350000a6 	cbnz	w6, 916c <__utf8_mbtowc+0x5c>
    915c:	52800026 	mov	w6, #0x1                   	// #1
    9160:	b9000086 	str	w6, [x4]
    9164:	f100047f 	cmp	x3, #0x1
    9168:	54001080 	b.eq	9378 <__utf8_mbtowc+0x268>  // b.none
    916c:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    9170:	110004a5 	add	w5, w5, #0x1
    9174:	51020043 	sub	w3, w2, #0x80
    9178:	7100fc7f 	cmp	w3, #0x3f
    917c:	54001068 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    9180:	7103041f 	cmp	w0, #0xc1
    9184:	5400102d 	b.le	9388 <__utf8_mbtowc+0x278>
    9188:	531a1000 	ubfiz	w0, w0, #6, #5
    918c:	12001442 	and	w2, w2, #0x3f
    9190:	b900009f 	str	wzr, [x4]
    9194:	2a020002 	orr	w2, w0, w2
    9198:	b9000022 	str	w2, [x1]
    919c:	2a0503e0 	mov	w0, w5
    91a0:	910043ff 	add	sp, sp, #0x10
    91a4:	d65f03c0 	ret
    91a8:	39401080 	ldrb	w0, [x4, #4]
    91ac:	52800005 	mov	w5, #0x0                   	// #0
    91b0:	35fffc80 	cbnz	w0, 9140 <__utf8_mbtowc+0x30>
    91b4:	b900003f 	str	wzr, [x1]
    91b8:	b900009f 	str	wzr, [x4]
    91bc:	910043ff 	add	sp, sp, #0x10
    91c0:	d65f03c0 	ret
    91c4:	51038007 	sub	w7, w0, #0xe0
    91c8:	71003cff 	cmp	w7, #0xf
    91cc:	54000508 	b.hi	926c <__utf8_mbtowc+0x15c>  // b.pmore
    91d0:	39001080 	strb	w0, [x4, #4]
    91d4:	34000aa6 	cbz	w6, 9328 <__utf8_mbtowc+0x218>
    91d8:	b100047f 	cmn	x3, #0x1
    91dc:	9a830463 	cinc	x3, x3, ne  // ne = any
    91e0:	710004df 	cmp	w6, #0x1
    91e4:	54000aa0 	b.eq	9338 <__utf8_mbtowc+0x228>  // b.none
    91e8:	39401487 	ldrb	w7, [x4, #5]
    91ec:	7103801f 	cmp	w0, #0xe0
    91f0:	528013e9 	mov	w9, #0x9f                  	// #159
    91f4:	7a4900e0 	ccmp	w7, w9, #0x0, eq  // eq = none
    91f8:	54000c8d 	b.le	9388 <__utf8_mbtowc+0x278>
    91fc:	510200e9 	sub	w9, w7, #0x80
    9200:	7100fd3f 	cmp	w9, #0x3f
    9204:	54000c28 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    9208:	39001487 	strb	w7, [x4, #5]
    920c:	710004df 	cmp	w6, #0x1
    9210:	54000ac0 	b.eq	9368 <__utf8_mbtowc+0x258>  // b.none
    9214:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    9218:	110004a5 	add	w5, w5, #0x1
    921c:	51020043 	sub	w3, w2, #0x80
    9220:	7100fc7f 	cmp	w3, #0x3f
    9224:	54000b28 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    9228:	53140c00 	ubfiz	w0, w0, #12, #4
    922c:	531a14e7 	ubfiz	w7, w7, #6, #6
    9230:	2a070007 	orr	w7, w0, w7
    9234:	12001442 	and	w2, w2, #0x3f
    9238:	b900009f 	str	wzr, [x4]
    923c:	2a0200e7 	orr	w7, w7, w2
    9240:	2a0503e0 	mov	w0, w5
    9244:	b9000027 	str	w7, [x1]
    9248:	17ffffdd 	b	91bc <__utf8_mbtowc+0xac>
    924c:	b900009f 	str	wzr, [x4]
    9250:	b9000020 	str	w0, [x1]
    9254:	52800020 	mov	w0, #0x1                   	// #1
    9258:	910043ff 	add	sp, sp, #0x10
    925c:	d65f03c0 	ret
    9260:	52800000 	mov	w0, #0x0                   	// #0
    9264:	910043ff 	add	sp, sp, #0x10
    9268:	d65f03c0 	ret
    926c:	5103c007 	sub	w7, w0, #0xf0
    9270:	710010ff 	cmp	w7, #0x4
    9274:	540008a8 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    9278:	39001080 	strb	w0, [x4, #4]
    927c:	34000666 	cbz	w6, 9348 <__utf8_mbtowc+0x238>
    9280:	b100047f 	cmn	x3, #0x1
    9284:	9a830463 	cinc	x3, x3, ne  // ne = any
    9288:	710004df 	cmp	w6, #0x1
    928c:	54000660 	b.eq	9358 <__utf8_mbtowc+0x248>  // b.none
    9290:	39401487 	ldrb	w7, [x4, #5]
    9294:	7103c01f 	cmp	w0, #0xf0
    9298:	54000740 	b.eq	9380 <__utf8_mbtowc+0x270>  // b.none
    929c:	71023cff 	cmp	w7, #0x8f
    92a0:	52801e89 	mov	w9, #0xf4                  	// #244
    92a4:	7a49c000 	ccmp	w0, w9, #0x0, gt
    92a8:	54000700 	b.eq	9388 <__utf8_mbtowc+0x278>  // b.none
    92ac:	510200e9 	sub	w9, w7, #0x80
    92b0:	7100fd3f 	cmp	w9, #0x3f
    92b4:	540006a8 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    92b8:	39001487 	strb	w7, [x4, #5]
    92bc:	710004df 	cmp	w6, #0x1
    92c0:	540006c0 	b.eq	9398 <__utf8_mbtowc+0x288>  // b.none
    92c4:	b9400086 	ldr	w6, [x4]
    92c8:	b100047f 	cmn	x3, #0x1
    92cc:	9a830463 	cinc	x3, x3, ne  // ne = any
    92d0:	710008df 	cmp	w6, #0x2
    92d4:	540006a0 	b.eq	93a8 <__utf8_mbtowc+0x298>  // b.none
    92d8:	39401886 	ldrb	w6, [x4, #6]
    92dc:	510200c3 	sub	w3, w6, #0x80
    92e0:	7100fc7f 	cmp	w3, #0x3f
    92e4:	54000528 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    92e8:	3865c842 	ldrb	w2, [x2, w5, sxtw]
    92ec:	110004a5 	add	w5, w5, #0x1
    92f0:	51020043 	sub	w3, w2, #0x80
    92f4:	7100fc7f 	cmp	w3, #0x3f
    92f8:	54000488 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    92fc:	530e0800 	ubfiz	w0, w0, #18, #3
    9300:	531414e7 	ubfiz	w7, w7, #12, #6
    9304:	531a14c6 	ubfiz	w6, w6, #6, #6
    9308:	12001442 	and	w2, w2, #0x3f
    930c:	2a070007 	orr	w7, w0, w7
    9310:	2a0200c6 	orr	w6, w6, w2
    9314:	2a0600e6 	orr	w6, w7, w6
    9318:	b9000026 	str	w6, [x1]
    931c:	2a0503e0 	mov	w0, w5
    9320:	b900009f 	str	wzr, [x4]
    9324:	17ffffa6 	b	91bc <__utf8_mbtowc+0xac>
    9328:	52800026 	mov	w6, #0x1                   	// #1
    932c:	b9000086 	str	w6, [x4]
    9330:	f100047f 	cmp	x3, #0x1
    9334:	54000220 	b.eq	9378 <__utf8_mbtowc+0x268>  // b.none
    9338:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    933c:	52800026 	mov	w6, #0x1                   	// #1
    9340:	0b0600a5 	add	w5, w5, w6
    9344:	17ffffaa 	b	91ec <__utf8_mbtowc+0xdc>
    9348:	52800026 	mov	w6, #0x1                   	// #1
    934c:	b9000086 	str	w6, [x4]
    9350:	f100047f 	cmp	x3, #0x1
    9354:	54000120 	b.eq	9378 <__utf8_mbtowc+0x268>  // b.none
    9358:	3865c847 	ldrb	w7, [x2, w5, sxtw]
    935c:	52800026 	mov	w6, #0x1                   	// #1
    9360:	0b0600a5 	add	w5, w5, w6
    9364:	17ffffcc 	b	9294 <__utf8_mbtowc+0x184>
    9368:	52800046 	mov	w6, #0x2                   	// #2
    936c:	b9000086 	str	w6, [x4]
    9370:	f100087f 	cmp	x3, #0x2
    9374:	54fff501 	b.ne	9214 <__utf8_mbtowc+0x104>  // b.any
    9378:	12800020 	mov	w0, #0xfffffffe            	// #-2
    937c:	17ffff90 	b	91bc <__utf8_mbtowc+0xac>
    9380:	71023cff 	cmp	w7, #0x8f
    9384:	54fff94c 	b.gt	92ac <__utf8_mbtowc+0x19c>
    9388:	52801141 	mov	w1, #0x8a                  	// #138
    938c:	12800000 	mov	w0, #0xffffffff            	// #-1
    9390:	b9000101 	str	w1, [x8]
    9394:	17ffff8a 	b	91bc <__utf8_mbtowc+0xac>
    9398:	52800046 	mov	w6, #0x2                   	// #2
    939c:	b9000086 	str	w6, [x4]
    93a0:	f100087f 	cmp	x3, #0x2
    93a4:	54fffea0 	b.eq	9378 <__utf8_mbtowc+0x268>  // b.none
    93a8:	3865c846 	ldrb	w6, [x2, w5, sxtw]
    93ac:	110004a5 	add	w5, w5, #0x1
    93b0:	510200c9 	sub	w9, w6, #0x80
    93b4:	7100fd3f 	cmp	w9, #0x3f
    93b8:	54fffe88 	b.hi	9388 <__utf8_mbtowc+0x278>  // b.pmore
    93bc:	52800069 	mov	w9, #0x3                   	// #3
    93c0:	b9000089 	str	w9, [x4]
    93c4:	39001886 	strb	w6, [x4, #6]
    93c8:	f1000c7f 	cmp	x3, #0x3
    93cc:	54fff8e1 	b.ne	92e8 <__utf8_mbtowc+0x1d8>  // b.any
    93d0:	12800020 	mov	w0, #0xfffffffe            	// #-2
    93d4:	17ffff7a 	b	91bc <__utf8_mbtowc+0xac>
    93d8:	d503201f 	nop
    93dc:	d503201f 	nop

00000000000093e0 <__sjis_mbtowc>:
    93e0:	d10043ff 	sub	sp, sp, #0x10
    93e4:	f100003f 	cmp	x1, #0x0
    93e8:	910033e5 	add	x5, sp, #0xc
    93ec:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    93f0:	b40004c2 	cbz	x2, 9488 <__sjis_mbtowc+0xa8>
    93f4:	b4000503 	cbz	x3, 9494 <__sjis_mbtowc+0xb4>
    93f8:	aa0003e6 	mov	x6, x0
    93fc:	b9400080 	ldr	w0, [x4]
    9400:	39400045 	ldrb	w5, [x2]
    9404:	35000320 	cbnz	w0, 9468 <__sjis_mbtowc+0x88>
    9408:	510204a7 	sub	w7, w5, #0x81
    940c:	510380a0 	sub	w0, w5, #0xe0
    9410:	710078ff 	cmp	w7, #0x1e
    9414:	7a4f8800 	ccmp	w0, #0xf, #0x0, hi  // hi = pmore
    9418:	540002c8 	b.hi	9470 <__sjis_mbtowc+0x90>  // b.pmore
    941c:	52800020 	mov	w0, #0x1                   	// #1
    9420:	b9000080 	str	w0, [x4]
    9424:	39001085 	strb	w5, [x4, #4]
    9428:	f100047f 	cmp	x3, #0x1
    942c:	54000340 	b.eq	9494 <__sjis_mbtowc+0xb4>  // b.none
    9430:	39400445 	ldrb	w5, [x2, #1]
    9434:	52800040 	mov	w0, #0x2                   	// #2
    9438:	510100a3 	sub	w3, w5, #0x40
    943c:	510200a2 	sub	w2, w5, #0x80
    9440:	7100f87f 	cmp	w3, #0x3e
    9444:	52800f83 	mov	w3, #0x7c                  	// #124
    9448:	7a438040 	ccmp	w2, w3, #0x0, hi  // hi = pmore
    944c:	54000288 	b.hi	949c <__sjis_mbtowc+0xbc>  // b.pmore
    9450:	39401082 	ldrb	w2, [x4, #4]
    9454:	0b0220a5 	add	w5, w5, w2, lsl #8
    9458:	b9000025 	str	w5, [x1]
    945c:	b900009f 	str	wzr, [x4]
    9460:	910043ff 	add	sp, sp, #0x10
    9464:	d65f03c0 	ret
    9468:	7100041f 	cmp	w0, #0x1
    946c:	54fffe60 	b.eq	9438 <__sjis_mbtowc+0x58>  // b.none
    9470:	b9000025 	str	w5, [x1]
    9474:	39400040 	ldrb	w0, [x2]
    9478:	7100001f 	cmp	w0, #0x0
    947c:	1a9f07e0 	cset	w0, ne  // ne = any
    9480:	910043ff 	add	sp, sp, #0x10
    9484:	d65f03c0 	ret
    9488:	52800000 	mov	w0, #0x0                   	// #0
    948c:	910043ff 	add	sp, sp, #0x10
    9490:	d65f03c0 	ret
    9494:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9498:	17fffffa 	b	9480 <__sjis_mbtowc+0xa0>
    949c:	52801141 	mov	w1, #0x8a                  	// #138
    94a0:	12800000 	mov	w0, #0xffffffff            	// #-1
    94a4:	b90000c1 	str	w1, [x6]
    94a8:	17fffff6 	b	9480 <__sjis_mbtowc+0xa0>
    94ac:	d503201f 	nop

00000000000094b0 <__eucjp_mbtowc>:
    94b0:	d10083ff 	sub	sp, sp, #0x20
    94b4:	f100003f 	cmp	x1, #0x0
    94b8:	a90007e0 	stp	x0, x1, [sp]
    94bc:	910073e0 	add	x0, sp, #0x1c
    94c0:	9a810001 	csel	x1, x0, x1, eq  // eq = none
    94c4:	f94003e6 	ldr	x6, [sp]
    94c8:	b4000702 	cbz	x2, 95a8 <__eucjp_mbtowc+0xf8>
    94cc:	b4000783 	cbz	x3, 95bc <__eucjp_mbtowc+0x10c>
    94d0:	b9400080 	ldr	w0, [x4]
    94d4:	39400045 	ldrb	w5, [x2]
    94d8:	350004a0 	cbnz	w0, 956c <__eucjp_mbtowc+0xbc>
    94dc:	510284a7 	sub	w7, w5, #0xa1
    94e0:	510238a0 	sub	w0, w5, #0x8e
    94e4:	710174ff 	cmp	w7, #0x5d
    94e8:	7a418800 	ccmp	w0, #0x1, #0x0, hi  // hi = pmore
    94ec:	54000488 	b.hi	957c <__eucjp_mbtowc+0xcc>  // b.pmore
    94f0:	52800020 	mov	w0, #0x1                   	// #1
    94f4:	b9000080 	str	w0, [x4]
    94f8:	39001085 	strb	w5, [x4, #4]
    94fc:	f100047f 	cmp	x3, #0x1
    9500:	540005e0 	b.eq	95bc <__eucjp_mbtowc+0x10c>  // b.none
    9504:	39400445 	ldrb	w5, [x2, #1]
    9508:	52800040 	mov	w0, #0x2                   	// #2
    950c:	510284a7 	sub	w7, w5, #0xa1
    9510:	710174ff 	cmp	w7, #0x5d
    9514:	54000588 	b.hi	95c4 <__eucjp_mbtowc+0x114>  // b.pmore
    9518:	39401087 	ldrb	w7, [x4, #4]
    951c:	71023cff 	cmp	w7, #0x8f
    9520:	540003a1 	b.ne	9594 <__eucjp_mbtowc+0xe4>  // b.any
    9524:	52800048 	mov	w8, #0x2                   	// #2
    9528:	93407c07 	sxtw	x7, w0
    952c:	b9000088 	str	w8, [x4]
    9530:	39001485 	strb	w5, [x4, #5]
    9534:	eb0300ff 	cmp	x7, x3
    9538:	54000422 	b.cs	95bc <__eucjp_mbtowc+0x10c>  // b.hs, b.nlast
    953c:	38676845 	ldrb	w5, [x2, x7]
    9540:	11000400 	add	w0, w0, #0x1
    9544:	510284a2 	sub	w2, w5, #0xa1
    9548:	7101745f 	cmp	w2, #0x5d
    954c:	540003c8 	b.hi	95c4 <__eucjp_mbtowc+0x114>  // b.pmore
    9550:	39401482 	ldrb	w2, [x4, #5]
    9554:	120018a5 	and	w5, w5, #0x7f
    9558:	0b0220a5 	add	w5, w5, w2, lsl #8
    955c:	b9000025 	str	w5, [x1]
    9560:	b900009f 	str	wzr, [x4]
    9564:	910083ff 	add	sp, sp, #0x20
    9568:	d65f03c0 	ret
    956c:	7100041f 	cmp	w0, #0x1
    9570:	54fffce0 	b.eq	950c <__eucjp_mbtowc+0x5c>  // b.none
    9574:	7100081f 	cmp	w0, #0x2
    9578:	540001e0 	b.eq	95b4 <__eucjp_mbtowc+0x104>  // b.none
    957c:	b9000025 	str	w5, [x1]
    9580:	39400040 	ldrb	w0, [x2]
    9584:	7100001f 	cmp	w0, #0x0
    9588:	1a9f07e0 	cset	w0, ne  // ne = any
    958c:	910083ff 	add	sp, sp, #0x20
    9590:	d65f03c0 	ret
    9594:	0b0720a5 	add	w5, w5, w7, lsl #8
    9598:	b9000025 	str	w5, [x1]
    959c:	b900009f 	str	wzr, [x4]
    95a0:	910083ff 	add	sp, sp, #0x20
    95a4:	d65f03c0 	ret
    95a8:	52800000 	mov	w0, #0x0                   	// #0
    95ac:	910083ff 	add	sp, sp, #0x20
    95b0:	d65f03c0 	ret
    95b4:	52800020 	mov	w0, #0x1                   	// #1
    95b8:	17ffffe3 	b	9544 <__eucjp_mbtowc+0x94>
    95bc:	12800020 	mov	w0, #0xfffffffe            	// #-2
    95c0:	17fffff3 	b	958c <__eucjp_mbtowc+0xdc>
    95c4:	52801141 	mov	w1, #0x8a                  	// #138
    95c8:	12800000 	mov	w0, #0xffffffff            	// #-1
    95cc:	b90000c1 	str	w1, [x6]
    95d0:	17ffffef 	b	958c <__eucjp_mbtowc+0xdc>
    95d4:	d503201f 	nop
    95d8:	d503201f 	nop
    95dc:	d503201f 	nop

00000000000095e0 <__jis_mbtowc>:
    95e0:	d10043ff 	sub	sp, sp, #0x10
    95e4:	f100003f 	cmp	x1, #0x0
    95e8:	910033e5 	add	x5, sp, #0xc
    95ec:	9a8100a1 	csel	x1, x5, x1, eq  // eq = none
    95f0:	b4000da2 	cbz	x2, 97a4 <__jis_mbtowc+0x1c4>
    95f4:	b4000e43 	cbz	x3, 97bc <__jis_mbtowc+0x1dc>
    95f8:	39400085 	ldrb	w5, [x4]
    95fc:	f000000c 	adrp	x12, c000 <__func__.0+0x28>
    9600:	f000000b 	adrp	x11, c000 <__func__.0+0x28>
    9604:	aa0003ed 	mov	x13, x0
    9608:	911ae18c 	add	x12, x12, #0x6b8
    960c:	911c016b 	add	x11, x11, #0x700
    9610:	aa0203ef 	mov	x15, x2
    9614:	5280000a 	mov	w10, #0x0                   	// #0
    9618:	d2800009 	mov	x9, #0x0                   	// #0
    961c:	38696847 	ldrb	w7, [x2, x9]
    9620:	8b09004e 	add	x14, x2, x9
    9624:	7100a0ff 	cmp	w7, #0x28
    9628:	54000c60 	b.eq	97b4 <__jis_mbtowc+0x1d4>  // b.none
    962c:	540005a8 	b.hi	96e0 <__jis_mbtowc+0x100>  // b.pmore
    9630:	52800006 	mov	w6, #0x0                   	// #0
    9634:	71006cff 	cmp	w7, #0x1b
    9638:	54000080 	b.eq	9648 <__jis_mbtowc+0x68>  // b.none
    963c:	52800026 	mov	w6, #0x1                   	// #1
    9640:	710090ff 	cmp	w7, #0x24
    9644:	540008c1 	b.ne	975c <__jis_mbtowc+0x17c>  // b.any
    9648:	937d7ca0 	sbfiz	x0, x5, #3, #32
    964c:	8b25c005 	add	x5, x0, w5, sxtw
    9650:	8b050180 	add	x0, x12, x5
    9654:	8b050165 	add	x5, x11, x5
    9658:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    965c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    9660:	71000d1f 	cmp	w8, #0x3
    9664:	540006a0 	b.eq	9738 <__jis_mbtowc+0x158>  // b.none
    9668:	540002a8 	b.hi	96bc <__jis_mbtowc+0xdc>  // b.pmore
    966c:	7100051f 	cmp	w8, #0x1
    9670:	54000840 	b.eq	9778 <__jis_mbtowc+0x198>  // b.none
    9674:	7100091f 	cmp	w8, #0x2
    9678:	54000141 	b.ne	96a0 <__jis_mbtowc+0xc0>  // b.any
    967c:	52800020 	mov	w0, #0x1                   	// #1
    9680:	b9000080 	str	w0, [x4]
    9684:	39401082 	ldrb	w2, [x4, #4]
    9688:	0b000140 	add	w0, w10, w0
    968c:	394001c3 	ldrb	w3, [x14]
    9690:	0b022062 	add	w2, w3, w2, lsl #8
    9694:	b9000022 	str	w2, [x1]
    9698:	910043ff 	add	sp, sp, #0x10
    969c:	d65f03c0 	ret
    96a0:	35000788 	cbnz	w8, 9790 <__jis_mbtowc+0x1b0>
    96a4:	b900009f 	str	wzr, [x4]
    96a8:	11000540 	add	w0, w10, #0x1
    96ac:	394001e2 	ldrb	w2, [x15]
    96b0:	b9000022 	str	w2, [x1]
    96b4:	910043ff 	add	sp, sp, #0x10
    96b8:	d65f03c0 	ret
    96bc:	7100111f 	cmp	w8, #0x4
    96c0:	54000400 	b.eq	9740 <__jis_mbtowc+0x160>  // b.none
    96c4:	7100151f 	cmp	w8, #0x5
    96c8:	54000641 	b.ne	9790 <__jis_mbtowc+0x1b0>  // b.any
    96cc:	b900009f 	str	wzr, [x4]
    96d0:	52800000 	mov	w0, #0x0                   	// #0
    96d4:	b900003f 	str	wzr, [x1]
    96d8:	910043ff 	add	sp, sp, #0x10
    96dc:	d65f03c0 	ret
    96e0:	52800086 	mov	w6, #0x4                   	// #4
    96e4:	710108ff 	cmp	w7, #0x42
    96e8:	54fffb00 	b.eq	9648 <__jis_mbtowc+0x68>  // b.none
    96ec:	528000a6 	mov	w6, #0x5                   	// #5
    96f0:	710128ff 	cmp	w7, #0x4a
    96f4:	54fffaa0 	b.eq	9648 <__jis_mbtowc+0x68>  // b.none
    96f8:	52800066 	mov	w6, #0x3                   	// #3
    96fc:	710100ff 	cmp	w7, #0x40
    9700:	54fffa40 	b.eq	9648 <__jis_mbtowc+0x68>  // b.none
    9704:	510084e0 	sub	w0, w7, #0x21
    9708:	7101741f 	cmp	w0, #0x5d
    970c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    9710:	11001cc6 	add	w6, w6, #0x7
    9714:	d503201f 	nop
    9718:	937d7ca0 	sbfiz	x0, x5, #3, #32
    971c:	8b25c005 	add	x5, x0, w5, sxtw
    9720:	8b050180 	add	x0, x12, x5
    9724:	8b050165 	add	x5, x11, x5
    9728:	3866c808 	ldrb	w8, [x0, w6, sxtw]
    972c:	3866c8a5 	ldrb	w5, [x5, w6, sxtw]
    9730:	71000d1f 	cmp	w8, #0x3
    9734:	54fff9a1 	b.ne	9668 <__jis_mbtowc+0x88>  // b.any
    9738:	91000529 	add	x9, x9, #0x1
    973c:	8b09004f 	add	x15, x2, x9
    9740:	11000549 	add	w9, w10, #0x1
    9744:	aa0903ea 	mov	x10, x9
    9748:	eb03013f 	cmp	x9, x3
    974c:	54fff683 	b.cc	961c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    9750:	12800020 	mov	w0, #0xfffffffe            	// #-2
    9754:	b9000085 	str	w5, [x4]
    9758:	17ffffd0 	b	9698 <__jis_mbtowc+0xb8>
    975c:	528000c6 	mov	w6, #0x6                   	// #6
    9760:	34fff747 	cbz	w7, 9648 <__jis_mbtowc+0x68>
    9764:	510084e0 	sub	w0, w7, #0x21
    9768:	7101741f 	cmp	w0, #0x5d
    976c:	1a9f97e6 	cset	w6, hi  // hi = pmore
    9770:	11001cc6 	add	w6, w6, #0x7
    9774:	17ffffe9 	b	9718 <__jis_mbtowc+0x138>
    9778:	11000549 	add	w9, w10, #0x1
    977c:	39001087 	strb	w7, [x4, #4]
    9780:	aa0903ea 	mov	x10, x9
    9784:	eb03013f 	cmp	x9, x3
    9788:	54fff4a3 	b.cc	961c <__jis_mbtowc+0x3c>  // b.lo, b.ul, b.last
    978c:	17fffff1 	b	9750 <__jis_mbtowc+0x170>
    9790:	52801141 	mov	w1, #0x8a                  	// #138
    9794:	b90001a1 	str	w1, [x13]
    9798:	12800000 	mov	w0, #0xffffffff            	// #-1
    979c:	910043ff 	add	sp, sp, #0x10
    97a0:	d65f03c0 	ret
    97a4:	b900009f 	str	wzr, [x4]
    97a8:	52800020 	mov	w0, #0x1                   	// #1
    97ac:	910043ff 	add	sp, sp, #0x10
    97b0:	d65f03c0 	ret
    97b4:	52800046 	mov	w6, #0x2                   	// #2
    97b8:	17ffffa4 	b	9648 <__jis_mbtowc+0x68>
    97bc:	12800020 	mov	w0, #0xfffffffe            	// #-2
    97c0:	17ffffb6 	b	9698 <__jis_mbtowc+0xb8>

00000000000097c4 <memchr>:
    97c4:	b4000682 	cbz	x2, 9894 <memchr+0xd0>
    97c8:	52808025 	mov	w5, #0x401                 	// #1025
    97cc:	72a80205 	movk	w5, #0x4010, lsl #16
    97d0:	4e010c20 	dup	v0.16b, w1
    97d4:	927be803 	and	x3, x0, #0xffffffffffffffe0
    97d8:	4e040ca5 	dup	v5.4s, w5
    97dc:	f2401009 	ands	x9, x0, #0x1f
    97e0:	9240104a 	and	x10, x2, #0x1f
    97e4:	54000200 	b.eq	9824 <memchr+0x60>  // b.none
    97e8:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    97ec:	d1008124 	sub	x4, x9, #0x20
    97f0:	ab040042 	adds	x2, x2, x4
    97f4:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    97f8:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    97fc:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    9800:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    9804:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    9808:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    980c:	4e083cc6 	mov	x6, v6.d[0]
    9810:	d37ff924 	lsl	x4, x9, #1
    9814:	9ac424c6 	lsr	x6, x6, x4
    9818:	9ac420c6 	lsl	x6, x6, x4
    981c:	54000229 	b.ls	9860 <memchr+0x9c>  // b.plast
    9820:	b50002c6 	cbnz	x6, 9878 <memchr+0xb4>
    9824:	4cdfa061 	ld1	{v1.16b, v2.16b}, [x3], #32
    9828:	f1008042 	subs	x2, x2, #0x20
    982c:	6e208c23 	cmeq	v3.16b, v1.16b, v0.16b
    9830:	6e208c44 	cmeq	v4.16b, v2.16b, v0.16b
    9834:	540000a9 	b.ls	9848 <memchr+0x84>  // b.plast
    9838:	4ea41c66 	orr	v6.16b, v3.16b, v4.16b
    983c:	4ee6bcc6 	addp	v6.2d, v6.2d, v6.2d
    9840:	4e083cc6 	mov	x6, v6.d[0]
    9844:	b4ffff06 	cbz	x6, 9824 <memchr+0x60>
    9848:	4e251c63 	and	v3.16b, v3.16b, v5.16b
    984c:	4e251c84 	and	v4.16b, v4.16b, v5.16b
    9850:	4e24bc66 	addp	v6.16b, v3.16b, v4.16b
    9854:	4e26bcc6 	addp	v6.16b, v6.16b, v6.16b
    9858:	4e083cc6 	mov	x6, v6.d[0]
    985c:	540000e8 	b.hi	9878 <memchr+0xb4>  // b.pmore
    9860:	8b090144 	add	x4, x10, x9
    9864:	92401084 	and	x4, x4, #0x1f
    9868:	d1008084 	sub	x4, x4, #0x20
    986c:	cb0407e4 	neg	x4, x4, lsl #1
    9870:	9ac420c6 	lsl	x6, x6, x4
    9874:	9ac424c6 	lsr	x6, x6, x4
    9878:	dac000c6 	rbit	x6, x6
    987c:	d1008063 	sub	x3, x3, #0x20
    9880:	f10000df 	cmp	x6, #0x0
    9884:	dac010c6 	clz	x6, x6
    9888:	8b460460 	add	x0, x3, x6, lsr #1
    988c:	9a8003e0 	csel	x0, xzr, x0, eq  // eq = none
    9890:	d65f03c0 	ret
    9894:	d2800000 	mov	x0, #0x0                   	// #0
    9898:	d65f03c0 	ret
    989c:	d503201f 	nop

00000000000098a0 <__malloc_lock>:
    98a0:	d65f03c0 	ret
    98a4:	d503201f 	nop
    98a8:	d503201f 	nop
    98ac:	d503201f 	nop

00000000000098b0 <__malloc_unlock>:
    98b0:	d65f03c0 	ret
    98b4:	d503201f 	nop
    98b8:	d503201f 	nop
    98bc:	d503201f 	nop

00000000000098c0 <_realloc_r>:
    98c0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
    98c4:	910003fd 	mov	x29, sp
    98c8:	a9025bf5 	stp	x21, x22, [sp, #32]
    98cc:	aa0203f5 	mov	x21, x2
    98d0:	b40010e1 	cbz	x1, 9aec <_realloc_r+0x22c>
    98d4:	a90363f7 	stp	x23, x24, [sp, #48]
    98d8:	d1004038 	sub	x24, x1, #0x10
    98dc:	aa0003f7 	mov	x23, x0
    98e0:	a90153f3 	stp	x19, x20, [sp, #16]
    98e4:	aa0103f3 	mov	x19, x1
    98e8:	91005eb4 	add	x20, x21, #0x17
    98ec:	a9046bf9 	stp	x25, x26, [sp, #64]
    98f0:	97ffffec 	bl	98a0 <__malloc_lock>
    98f4:	aa1803f9 	mov	x25, x24
    98f8:	f9400700 	ldr	x0, [x24, #8]
    98fc:	927ef416 	and	x22, x0, #0xfffffffffffffffc
    9900:	f100ba9f 	cmp	x20, #0x2e
    9904:	54000908 	b.hi	9a24 <_realloc_r+0x164>  // b.pmore
    9908:	52800001 	mov	w1, #0x0                   	// #0
    990c:	7100003f 	cmp	w1, #0x0
    9910:	d2800414 	mov	x20, #0x20                  	// #32
    9914:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    9918:	54000943 	b.cc	9a40 <_realloc_r+0x180>  // b.lo, b.ul, b.last
    991c:	eb1402df 	cmp	x22, x20
    9920:	54000b0a 	b.ge	9a80 <_realloc_r+0x1c0>  // b.tcont
    9924:	90000021 	adrp	x1, d000 <__global_locale+0x20>
    9928:	a90573fb 	stp	x27, x28, [sp, #80]
    992c:	9106203c 	add	x28, x1, #0x188
    9930:	8b160302 	add	x2, x24, x22
    9934:	f9400b83 	ldr	x3, [x28, #16]
    9938:	f9400441 	ldr	x1, [x2, #8]
    993c:	eb02007f 	cmp	x3, x2
    9940:	54000f60 	b.eq	9b2c <_realloc_r+0x26c>  // b.none
    9944:	927ff823 	and	x3, x1, #0xfffffffffffffffe
    9948:	8b030043 	add	x3, x2, x3
    994c:	f9400463 	ldr	x3, [x3, #8]
    9950:	37000c23 	tbnz	w3, #0, 9ad4 <_realloc_r+0x214>
    9954:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    9958:	8b0102c3 	add	x3, x22, x1
    995c:	eb03029f 	cmp	x20, x3
    9960:	5400084d 	b.le	9a68 <_realloc_r+0x1a8>
    9964:	37000180 	tbnz	w0, #0, 9994 <_realloc_r+0xd4>
    9968:	f85f027b 	ldur	x27, [x19, #-16]
    996c:	cb1b031b 	sub	x27, x24, x27
    9970:	f9400760 	ldr	x0, [x27, #8]
    9974:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9978:	8b010001 	add	x1, x0, x1
    997c:	8b160023 	add	x3, x1, x22
    9980:	eb03029f 	cmp	x20, x3
    9984:	540019ad 	b.le	9cb8 <_realloc_r+0x3f8>
    9988:	8b0002c3 	add	x3, x22, x0
    998c:	eb03029f 	cmp	x20, x3
    9990:	5400152d 	b.le	9c34 <_realloc_r+0x374>
    9994:	aa1503e1 	mov	x1, x21
    9998:	aa1703e0 	mov	x0, x23
    999c:	97fffbb9 	bl	8880 <_malloc_r>
    99a0:	aa0003f5 	mov	x21, x0
    99a4:	b40002c0 	cbz	x0, 99fc <_realloc_r+0x13c>
    99a8:	f9400701 	ldr	x1, [x24, #8]
    99ac:	d1004002 	sub	x2, x0, #0x10
    99b0:	927ff821 	and	x1, x1, #0xfffffffffffffffe
    99b4:	8b010318 	add	x24, x24, x1
    99b8:	eb02031f 	cmp	x24, x2
    99bc:	54001200 	b.eq	9bfc <_realloc_r+0x33c>  // b.none
    99c0:	d10022c2 	sub	x2, x22, #0x8
    99c4:	f101205f 	cmp	x2, #0x48
    99c8:	54001728 	b.hi	9cac <_realloc_r+0x3ec>  // b.pmore
    99cc:	f1009c5f 	cmp	x2, #0x27
    99d0:	54001208 	b.hi	9c10 <_realloc_r+0x350>  // b.pmore
    99d4:	aa1303e1 	mov	x1, x19
    99d8:	f9400022 	ldr	x2, [x1]
    99dc:	f9000002 	str	x2, [x0]
    99e0:	f9400422 	ldr	x2, [x1, #8]
    99e4:	f9000402 	str	x2, [x0, #8]
    99e8:	f9400821 	ldr	x1, [x1, #16]
    99ec:	f9000801 	str	x1, [x0, #16]
    99f0:	aa1303e1 	mov	x1, x19
    99f4:	aa1703e0 	mov	x0, x23
    99f8:	97fff582 	bl	7000 <_free_r>
    99fc:	aa1703e0 	mov	x0, x23
    9a00:	97ffffac 	bl	98b0 <__malloc_unlock>
    9a04:	aa1503e0 	mov	x0, x21
    9a08:	a94153f3 	ldp	x19, x20, [sp, #16]
    9a0c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9a10:	a94363f7 	ldp	x23, x24, [sp, #48]
    9a14:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9a18:	a94573fb 	ldp	x27, x28, [sp, #80]
    9a1c:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9a20:	d65f03c0 	ret
    9a24:	927cee94 	and	x20, x20, #0xfffffffffffffff0
    9a28:	b2407be1 	mov	x1, #0x7fffffff            	// #2147483647
    9a2c:	eb01029f 	cmp	x20, x1
    9a30:	1a9f97e1 	cset	w1, hi  // hi = pmore
    9a34:	7100003f 	cmp	w1, #0x0
    9a38:	fa550280 	ccmp	x20, x21, #0x0, eq  // eq = none
    9a3c:	54fff702 	b.cs	991c <_realloc_r+0x5c>  // b.hs, b.nlast
    9a40:	52800180 	mov	w0, #0xc                   	// #12
    9a44:	b90002e0 	str	w0, [x23]
    9a48:	d2800015 	mov	x21, #0x0                   	// #0
    9a4c:	aa1503e0 	mov	x0, x21
    9a50:	a94153f3 	ldp	x19, x20, [sp, #16]
    9a54:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9a58:	a94363f7 	ldp	x23, x24, [sp, #48]
    9a5c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9a60:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9a64:	d65f03c0 	ret
    9a68:	a9410041 	ldp	x1, x0, [x2, #16]
    9a6c:	aa0303f6 	mov	x22, x3
    9a70:	a94573fb 	ldp	x27, x28, [sp, #80]
    9a74:	f9000c20 	str	x0, [x1, #24]
    9a78:	f9000801 	str	x1, [x0, #16]
    9a7c:	d503201f 	nop
    9a80:	f9400721 	ldr	x1, [x25, #8]
    9a84:	cb1402c0 	sub	x0, x22, x20
    9a88:	8b160322 	add	x2, x25, x22
    9a8c:	92400021 	and	x1, x1, #0x1
    9a90:	f1007c1f 	cmp	x0, #0x1f
    9a94:	54000348 	b.hi	9afc <_realloc_r+0x23c>  // b.pmore
    9a98:	aa0102c1 	orr	x1, x22, x1
    9a9c:	f9000721 	str	x1, [x25, #8]
    9aa0:	f9400440 	ldr	x0, [x2, #8]
    9aa4:	b2400000 	orr	x0, x0, #0x1
    9aa8:	f9000440 	str	x0, [x2, #8]
    9aac:	aa1703e0 	mov	x0, x23
    9ab0:	aa1303f5 	mov	x21, x19
    9ab4:	97ffff7f 	bl	98b0 <__malloc_unlock>
    9ab8:	aa1503e0 	mov	x0, x21
    9abc:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ac0:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9ac4:	a94363f7 	ldp	x23, x24, [sp, #48]
    9ac8:	a9446bf9 	ldp	x25, x26, [sp, #64]
    9acc:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9ad0:	d65f03c0 	ret
    9ad4:	3707f600 	tbnz	w0, #0, 9994 <_realloc_r+0xd4>
    9ad8:	f85f027b 	ldur	x27, [x19, #-16]
    9adc:	cb1b031b 	sub	x27, x24, x27
    9ae0:	f9400760 	ldr	x0, [x27, #8]
    9ae4:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9ae8:	17ffffa8 	b	9988 <_realloc_r+0xc8>
    9aec:	a9425bf5 	ldp	x21, x22, [sp, #32]
    9af0:	aa0203e1 	mov	x1, x2
    9af4:	a8c67bfd 	ldp	x29, x30, [sp], #96
    9af8:	17fffb62 	b	8880 <_malloc_r>
    9afc:	8b140324 	add	x4, x25, x20
    9b00:	aa010281 	orr	x1, x20, x1
    9b04:	f9000721 	str	x1, [x25, #8]
    9b08:	b2400003 	orr	x3, x0, #0x1
    9b0c:	91004081 	add	x1, x4, #0x10
    9b10:	aa1703e0 	mov	x0, x23
    9b14:	f9000483 	str	x3, [x4, #8]
    9b18:	f9400443 	ldr	x3, [x2, #8]
    9b1c:	b2400063 	orr	x3, x3, #0x1
    9b20:	f9000443 	str	x3, [x2, #8]
    9b24:	97fff537 	bl	7000 <_free_r>
    9b28:	17ffffe1 	b	9aac <_realloc_r+0x1ec>
    9b2c:	927ef421 	and	x1, x1, #0xfffffffffffffffc
    9b30:	91008283 	add	x3, x20, #0x20
    9b34:	8b0102c2 	add	x2, x22, x1
    9b38:	eb03005f 	cmp	x2, x3
    9b3c:	54000eaa 	b.ge	9d10 <_realloc_r+0x450>  // b.tcont
    9b40:	3707f2a0 	tbnz	w0, #0, 9994 <_realloc_r+0xd4>
    9b44:	f85f027b 	ldur	x27, [x19, #-16]
    9b48:	cb1b031b 	sub	x27, x24, x27
    9b4c:	f9400760 	ldr	x0, [x27, #8]
    9b50:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9b54:	8b010001 	add	x1, x0, x1
    9b58:	8b16003a 	add	x26, x1, x22
    9b5c:	eb1a007f 	cmp	x3, x26
    9b60:	54fff14c 	b.gt	9988 <_realloc_r+0xc8>
    9b64:	aa1b03f5 	mov	x21, x27
    9b68:	d10022c2 	sub	x2, x22, #0x8
    9b6c:	f9400f60 	ldr	x0, [x27, #24]
    9b70:	f8410ea1 	ldr	x1, [x21, #16]!
    9b74:	f9000c20 	str	x0, [x1, #24]
    9b78:	f9000801 	str	x1, [x0, #16]
    9b7c:	f101205f 	cmp	x2, #0x48
    9b80:	54001128 	b.hi	9da4 <_realloc_r+0x4e4>  // b.pmore
    9b84:	aa1503e0 	mov	x0, x21
    9b88:	f1009c5f 	cmp	x2, #0x27
    9b8c:	54000129 	b.ls	9bb0 <_realloc_r+0x2f0>  // b.plast
    9b90:	f9400260 	ldr	x0, [x19]
    9b94:	f9000b60 	str	x0, [x27, #16]
    9b98:	f9400660 	ldr	x0, [x19, #8]
    9b9c:	f9000f60 	str	x0, [x27, #24]
    9ba0:	f100dc5f 	cmp	x2, #0x37
    9ba4:	54001088 	b.hi	9db4 <_realloc_r+0x4f4>  // b.pmore
    9ba8:	91004273 	add	x19, x19, #0x10
    9bac:	91008360 	add	x0, x27, #0x20
    9bb0:	f9400261 	ldr	x1, [x19]
    9bb4:	f9000001 	str	x1, [x0]
    9bb8:	f9400661 	ldr	x1, [x19, #8]
    9bbc:	f9000401 	str	x1, [x0, #8]
    9bc0:	f9400a61 	ldr	x1, [x19, #16]
    9bc4:	f9000801 	str	x1, [x0, #16]
    9bc8:	8b140362 	add	x2, x27, x20
    9bcc:	cb140341 	sub	x1, x26, x20
    9bd0:	f9000b82 	str	x2, [x28, #16]
    9bd4:	b2400021 	orr	x1, x1, #0x1
    9bd8:	aa1703e0 	mov	x0, x23
    9bdc:	f9000441 	str	x1, [x2, #8]
    9be0:	f9400761 	ldr	x1, [x27, #8]
    9be4:	92400021 	and	x1, x1, #0x1
    9be8:	aa140034 	orr	x20, x1, x20
    9bec:	f9000774 	str	x20, [x27, #8]
    9bf0:	97ffff30 	bl	98b0 <__malloc_unlock>
    9bf4:	a94573fb 	ldp	x27, x28, [sp, #80]
    9bf8:	17ffffb0 	b	9ab8 <_realloc_r+0x1f8>
    9bfc:	f9400700 	ldr	x0, [x24, #8]
    9c00:	a94573fb 	ldp	x27, x28, [sp, #80]
    9c04:	927ef400 	and	x0, x0, #0xfffffffffffffffc
    9c08:	8b0002d6 	add	x22, x22, x0
    9c0c:	17ffff9d 	b	9a80 <_realloc_r+0x1c0>
    9c10:	f9400260 	ldr	x0, [x19]
    9c14:	f90002a0 	str	x0, [x21]
    9c18:	f9400660 	ldr	x0, [x19, #8]
    9c1c:	f90006a0 	str	x0, [x21, #8]
    9c20:	f100dc5f 	cmp	x2, #0x37
    9c24:	54000648 	b.hi	9cec <_realloc_r+0x42c>  // b.pmore
    9c28:	91004261 	add	x1, x19, #0x10
    9c2c:	910042a0 	add	x0, x21, #0x10
    9c30:	17ffff6a 	b	99d8 <_realloc_r+0x118>
    9c34:	aa1b03e0 	mov	x0, x27
    9c38:	d10022c2 	sub	x2, x22, #0x8
    9c3c:	f8410c04 	ldr	x4, [x0, #16]!
    9c40:	f9400f61 	ldr	x1, [x27, #24]
    9c44:	f9000c81 	str	x1, [x4, #24]
    9c48:	f9000824 	str	x4, [x1, #16]
    9c4c:	f101205f 	cmp	x2, #0x48
    9c50:	54000408 	b.hi	9cd0 <_realloc_r+0x410>  // b.pmore
    9c54:	aa0003e1 	mov	x1, x0
    9c58:	f1009c5f 	cmp	x2, #0x27
    9c5c:	54000129 	b.ls	9c80 <_realloc_r+0x3c0>  // b.plast
    9c60:	f9400261 	ldr	x1, [x19]
    9c64:	f9000b61 	str	x1, [x27, #16]
    9c68:	f9400661 	ldr	x1, [x19, #8]
    9c6c:	f9000f61 	str	x1, [x27, #24]
    9c70:	f100dc5f 	cmp	x2, #0x37
    9c74:	540006a8 	b.hi	9d48 <_realloc_r+0x488>  // b.pmore
    9c78:	91004273 	add	x19, x19, #0x10
    9c7c:	91008361 	add	x1, x27, #0x20
    9c80:	f9400262 	ldr	x2, [x19]
    9c84:	aa1b03f9 	mov	x25, x27
    9c88:	a94573fb 	ldp	x27, x28, [sp, #80]
    9c8c:	f9000022 	str	x2, [x1]
    9c90:	aa0303f6 	mov	x22, x3
    9c94:	f9400662 	ldr	x2, [x19, #8]
    9c98:	f9000422 	str	x2, [x1, #8]
    9c9c:	f9400a62 	ldr	x2, [x19, #16]
    9ca0:	aa0003f3 	mov	x19, x0
    9ca4:	f9000822 	str	x2, [x1, #16]
    9ca8:	17ffff76 	b	9a80 <_realloc_r+0x1c0>
    9cac:	aa1303e1 	mov	x1, x19
    9cb0:	97ffe934 	bl	4180 <memmove>
    9cb4:	17ffff4f 	b	99f0 <_realloc_r+0x130>
    9cb8:	a9410444 	ldp	x4, x1, [x2, #16]
    9cbc:	f9000c81 	str	x1, [x4, #24]
    9cc0:	aa1b03e0 	mov	x0, x27
    9cc4:	d10022c2 	sub	x2, x22, #0x8
    9cc8:	f9000824 	str	x4, [x1, #16]
    9ccc:	17ffffdc 	b	9c3c <_realloc_r+0x37c>
    9cd0:	aa1303e1 	mov	x1, x19
    9cd4:	aa0303f6 	mov	x22, x3
    9cd8:	aa1b03f9 	mov	x25, x27
    9cdc:	aa0003f3 	mov	x19, x0
    9ce0:	97ffe928 	bl	4180 <memmove>
    9ce4:	a94573fb 	ldp	x27, x28, [sp, #80]
    9ce8:	17ffff66 	b	9a80 <_realloc_r+0x1c0>
    9cec:	f9400a60 	ldr	x0, [x19, #16]
    9cf0:	f9000aa0 	str	x0, [x21, #16]
    9cf4:	f9400e60 	ldr	x0, [x19, #24]
    9cf8:	f9000ea0 	str	x0, [x21, #24]
    9cfc:	f101205f 	cmp	x2, #0x48
    9d00:	54000360 	b.eq	9d6c <_realloc_r+0x4ac>  // b.none
    9d04:	91008261 	add	x1, x19, #0x20
    9d08:	910082a0 	add	x0, x21, #0x20
    9d0c:	17ffff33 	b	99d8 <_realloc_r+0x118>
    9d10:	8b140303 	add	x3, x24, x20
    9d14:	cb140041 	sub	x1, x2, x20
    9d18:	f9000b83 	str	x3, [x28, #16]
    9d1c:	b2400021 	orr	x1, x1, #0x1
    9d20:	aa1703e0 	mov	x0, x23
    9d24:	aa1303f5 	mov	x21, x19
    9d28:	f9000461 	str	x1, [x3, #8]
    9d2c:	f9400701 	ldr	x1, [x24, #8]
    9d30:	92400021 	and	x1, x1, #0x1
    9d34:	aa140034 	orr	x20, x1, x20
    9d38:	f9000714 	str	x20, [x24, #8]
    9d3c:	97fffedd 	bl	98b0 <__malloc_unlock>
    9d40:	a94573fb 	ldp	x27, x28, [sp, #80]
    9d44:	17ffff5d 	b	9ab8 <_realloc_r+0x1f8>
    9d48:	f9400a61 	ldr	x1, [x19, #16]
    9d4c:	f9001361 	str	x1, [x27, #32]
    9d50:	f9400e61 	ldr	x1, [x19, #24]
    9d54:	f9001761 	str	x1, [x27, #40]
    9d58:	f101205f 	cmp	x2, #0x48
    9d5c:	54000160 	b.eq	9d88 <_realloc_r+0x4c8>  // b.none
    9d60:	91008273 	add	x19, x19, #0x20
    9d64:	9100c361 	add	x1, x27, #0x30
    9d68:	17ffffc6 	b	9c80 <_realloc_r+0x3c0>
    9d6c:	f9401260 	ldr	x0, [x19, #32]
    9d70:	f90012a0 	str	x0, [x21, #32]
    9d74:	9100c261 	add	x1, x19, #0x30
    9d78:	9100c2a0 	add	x0, x21, #0x30
    9d7c:	f9401662 	ldr	x2, [x19, #40]
    9d80:	f90016a2 	str	x2, [x21, #40]
    9d84:	17ffff15 	b	99d8 <_realloc_r+0x118>
    9d88:	f9401261 	ldr	x1, [x19, #32]
    9d8c:	f9001b61 	str	x1, [x27, #48]
    9d90:	9100c273 	add	x19, x19, #0x30
    9d94:	91010361 	add	x1, x27, #0x40
    9d98:	f85f8262 	ldur	x2, [x19, #-8]
    9d9c:	f9001f62 	str	x2, [x27, #56]
    9da0:	17ffffb8 	b	9c80 <_realloc_r+0x3c0>
    9da4:	aa1303e1 	mov	x1, x19
    9da8:	aa1503e0 	mov	x0, x21
    9dac:	97ffe8f5 	bl	4180 <memmove>
    9db0:	17ffff86 	b	9bc8 <_realloc_r+0x308>
    9db4:	f9400a60 	ldr	x0, [x19, #16]
    9db8:	f9001360 	str	x0, [x27, #32]
    9dbc:	f9400e60 	ldr	x0, [x19, #24]
    9dc0:	f9001760 	str	x0, [x27, #40]
    9dc4:	f101205f 	cmp	x2, #0x48
    9dc8:	54000080 	b.eq	9dd8 <_realloc_r+0x518>  // b.none
    9dcc:	91008273 	add	x19, x19, #0x20
    9dd0:	9100c360 	add	x0, x27, #0x30
    9dd4:	17ffff77 	b	9bb0 <_realloc_r+0x2f0>
    9dd8:	f9401260 	ldr	x0, [x19, #32]
    9ddc:	f9001b60 	str	x0, [x27, #48]
    9de0:	9100c273 	add	x19, x19, #0x30
    9de4:	91010360 	add	x0, x27, #0x40
    9de8:	f85f8261 	ldur	x1, [x19, #-8]
    9dec:	f9001f61 	str	x1, [x27, #56]
    9df0:	17ffff70 	b	9bb0 <_realloc_r+0x2f0>
    9df4:	d503201f 	nop
    9df8:	d503201f 	nop
    9dfc:	d503201f 	nop

0000000000009e00 <_sbrk_r>:
    9e00:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9e04:	910003fd 	mov	x29, sp
    9e08:	a90153f3 	stp	x19, x20, [sp, #16]
    9e0c:	90000034 	adrp	x20, d000 <__global_locale+0x20>
    9e10:	aa0003f3 	mov	x19, x0
    9e14:	b90dba9f 	str	wzr, [x20, #3512]
    9e18:	aa0103e0 	mov	x0, x1
    9e1c:	97ffe7a9 	bl	3cc0 <_sbrk>
    9e20:	b100041f 	cmn	x0, #0x1
    9e24:	54000080 	b.eq	9e34 <_sbrk_r+0x34>  // b.none
    9e28:	a94153f3 	ldp	x19, x20, [sp, #16]
    9e2c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9e30:	d65f03c0 	ret
    9e34:	b94dba81 	ldr	w1, [x20, #3512]
    9e38:	34ffff81 	cbz	w1, 9e28 <_sbrk_r+0x28>
    9e3c:	b9000261 	str	w1, [x19]
    9e40:	a94153f3 	ldp	x19, x20, [sp, #16]
    9e44:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9e48:	d65f03c0 	ret
    9e4c:	d503201f 	nop

0000000000009e50 <_init_signal_r>:
    9e50:	f9428c01 	ldr	x1, [x0, #1304]
    9e54:	b4000061 	cbz	x1, 9e60 <_init_signal_r+0x10>
    9e58:	52800000 	mov	w0, #0x0                   	// #0
    9e5c:	d65f03c0 	ret
    9e60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9e64:	d2802001 	mov	x1, #0x100                 	// #256
    9e68:	910003fd 	mov	x29, sp
    9e6c:	f9000bf3 	str	x19, [sp, #16]
    9e70:	aa0003f3 	mov	x19, x0
    9e74:	97fffa83 	bl	8880 <_malloc_r>
    9e78:	f9028e60 	str	x0, [x19, #1304]
    9e7c:	b4000140 	cbz	x0, 9ea4 <_init_signal_r+0x54>
    9e80:	91040001 	add	x1, x0, #0x100
    9e84:	d503201f 	nop
    9e88:	f800841f 	str	xzr, [x0], #8
    9e8c:	eb01001f 	cmp	x0, x1
    9e90:	54ffffc1 	b.ne	9e88 <_init_signal_r+0x38>  // b.any
    9e94:	52800000 	mov	w0, #0x0                   	// #0
    9e98:	f9400bf3 	ldr	x19, [sp, #16]
    9e9c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9ea0:	d65f03c0 	ret
    9ea4:	12800000 	mov	w0, #0xffffffff            	// #-1
    9ea8:	17fffffc 	b	9e98 <_init_signal_r+0x48>
    9eac:	d503201f 	nop

0000000000009eb0 <_signal_r>:
    9eb0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    9eb4:	910003fd 	mov	x29, sp
    9eb8:	a90153f3 	stp	x19, x20, [sp, #16]
    9ebc:	93407c33 	sxtw	x19, w1
    9ec0:	aa0003f4 	mov	x20, x0
    9ec4:	71007e7f 	cmp	w19, #0x1f
    9ec8:	54000108 	b.hi	9ee8 <_signal_r+0x38>  // b.pmore
    9ecc:	f9428c04 	ldr	x4, [x0, #1304]
    9ed0:	b4000184 	cbz	x4, 9f00 <_signal_r+0x50>
    9ed4:	f8737880 	ldr	x0, [x4, x19, lsl #3]
    9ed8:	f8337882 	str	x2, [x4, x19, lsl #3]
    9edc:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ee0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9ee4:	d65f03c0 	ret
    9ee8:	528002c1 	mov	w1, #0x16                  	// #22
    9eec:	b9000281 	str	w1, [x20]
    9ef0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9ef4:	a94153f3 	ldp	x19, x20, [sp, #16]
    9ef8:	a8c37bfd 	ldp	x29, x30, [sp], #48
    9efc:	d65f03c0 	ret
    9f00:	d2802001 	mov	x1, #0x100                 	// #256
    9f04:	f90017e2 	str	x2, [sp, #40]
    9f08:	97fffa5e 	bl	8880 <_malloc_r>
    9f0c:	f9028e80 	str	x0, [x20, #1304]
    9f10:	aa0003e4 	mov	x4, x0
    9f14:	b4000120 	cbz	x0, 9f38 <_signal_r+0x88>
    9f18:	f94017e2 	ldr	x2, [sp, #40]
    9f1c:	aa0003e3 	mov	x3, x0
    9f20:	91040001 	add	x1, x0, #0x100
    9f24:	d503201f 	nop
    9f28:	f800847f 	str	xzr, [x3], #8
    9f2c:	eb03003f 	cmp	x1, x3
    9f30:	54ffffc1 	b.ne	9f28 <_signal_r+0x78>  // b.any
    9f34:	17ffffe8 	b	9ed4 <_signal_r+0x24>
    9f38:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    9f3c:	17ffffe8 	b	9edc <_signal_r+0x2c>

0000000000009f40 <_raise_r>:
    9f40:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    9f44:	910003fd 	mov	x29, sp
    9f48:	a90153f3 	stp	x19, x20, [sp, #16]
    9f4c:	aa0003f4 	mov	x20, x0
    9f50:	71007c3f 	cmp	w1, #0x1f
    9f54:	54000488 	b.hi	9fe4 <_raise_r+0xa4>  // b.pmore
    9f58:	f9428c00 	ldr	x0, [x0, #1304]
    9f5c:	2a0103f3 	mov	w19, w1
    9f60:	b40001e0 	cbz	x0, 9f9c <_raise_r+0x5c>
    9f64:	93407c22 	sxtw	x2, w1
    9f68:	f8627801 	ldr	x1, [x0, x2, lsl #3]
    9f6c:	b4000181 	cbz	x1, 9f9c <_raise_r+0x5c>
    9f70:	f100043f 	cmp	x1, #0x1
    9f74:	54000300 	b.eq	9fd4 <_raise_r+0x94>  // b.none
    9f78:	b100043f 	cmn	x1, #0x1
    9f7c:	54000200 	b.eq	9fbc <_raise_r+0x7c>  // b.none
    9f80:	f822781f 	str	xzr, [x0, x2, lsl #3]
    9f84:	2a1303e0 	mov	w0, w19
    9f88:	d63f0020 	blr	x1
    9f8c:	52800000 	mov	w0, #0x0                   	// #0
    9f90:	a94153f3 	ldp	x19, x20, [sp, #16]
    9f94:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9f98:	d65f03c0 	ret
    9f9c:	aa1403e0 	mov	x0, x20
    9fa0:	940000fc 	bl	a390 <_getpid_r>
    9fa4:	2a1303e2 	mov	w2, w19
    9fa8:	2a0003e1 	mov	w1, w0
    9fac:	aa1403e0 	mov	x0, x20
    9fb0:	a94153f3 	ldp	x19, x20, [sp, #16]
    9fb4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9fb8:	140000e2 	b	a340 <_kill_r>
    9fbc:	528002c1 	mov	w1, #0x16                  	// #22
    9fc0:	b9000281 	str	w1, [x20]
    9fc4:	52800020 	mov	w0, #0x1                   	// #1
    9fc8:	a94153f3 	ldp	x19, x20, [sp, #16]
    9fcc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9fd0:	d65f03c0 	ret
    9fd4:	52800000 	mov	w0, #0x0                   	// #0
    9fd8:	a94153f3 	ldp	x19, x20, [sp, #16]
    9fdc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    9fe0:	d65f03c0 	ret
    9fe4:	528002c1 	mov	w1, #0x16                  	// #22
    9fe8:	12800000 	mov	w0, #0xffffffff            	// #-1
    9fec:	b9000281 	str	w1, [x20]
    9ff0:	17ffffe8 	b	9f90 <_raise_r+0x50>
    9ff4:	d503201f 	nop
    9ff8:	d503201f 	nop
    9ffc:	d503201f 	nop

000000000000a000 <__sigtramp_r>:
    a000:	71007c3f 	cmp	w1, #0x1f
    a004:	540005a8 	b.hi	a0b8 <__sigtramp_r+0xb8>  // b.pmore
    a008:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a00c:	910003fd 	mov	x29, sp
    a010:	f9428c03 	ldr	x3, [x0, #1304]
    a014:	a90153f3 	stp	x19, x20, [sp, #16]
    a018:	2a0103f3 	mov	w19, w1
    a01c:	aa0003f4 	mov	x20, x0
    a020:	b4000263 	cbz	x3, a06c <__sigtramp_r+0x6c>
    a024:	f873d861 	ldr	x1, [x3, w19, sxtw #3]
    a028:	8b33cc63 	add	x3, x3, w19, sxtw #3
    a02c:	b4000181 	cbz	x1, a05c <__sigtramp_r+0x5c>
    a030:	b100043f 	cmn	x1, #0x1
    a034:	540003a0 	b.eq	a0a8 <__sigtramp_r+0xa8>  // b.none
    a038:	f100043f 	cmp	x1, #0x1
    a03c:	540002e0 	b.eq	a098 <__sigtramp_r+0x98>  // b.none
    a040:	f900007f 	str	xzr, [x3]
    a044:	2a1303e0 	mov	w0, w19
    a048:	d63f0020 	blr	x1
    a04c:	52800000 	mov	w0, #0x0                   	// #0
    a050:	a94153f3 	ldp	x19, x20, [sp, #16]
    a054:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a058:	d65f03c0 	ret
    a05c:	52800020 	mov	w0, #0x1                   	// #1
    a060:	a94153f3 	ldp	x19, x20, [sp, #16]
    a064:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a068:	d65f03c0 	ret
    a06c:	d2802001 	mov	x1, #0x100                 	// #256
    a070:	97fffa04 	bl	8880 <_malloc_r>
    a074:	f9028e80 	str	x0, [x20, #1304]
    a078:	aa0003e3 	mov	x3, x0
    a07c:	b40001a0 	cbz	x0, a0b0 <__sigtramp_r+0xb0>
    a080:	aa0003e2 	mov	x2, x0
    a084:	91040000 	add	x0, x0, #0x100
    a088:	f800845f 	str	xzr, [x2], #8
    a08c:	eb00005f 	cmp	x2, x0
    a090:	54ffffc1 	b.ne	a088 <__sigtramp_r+0x88>  // b.any
    a094:	17ffffe4 	b	a024 <__sigtramp_r+0x24>
    a098:	52800060 	mov	w0, #0x3                   	// #3
    a09c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a0a0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a0a4:	d65f03c0 	ret
    a0a8:	52800040 	mov	w0, #0x2                   	// #2
    a0ac:	17ffffe9 	b	a050 <__sigtramp_r+0x50>
    a0b0:	12800000 	mov	w0, #0xffffffff            	// #-1
    a0b4:	17ffffe7 	b	a050 <__sigtramp_r+0x50>
    a0b8:	12800000 	mov	w0, #0xffffffff            	// #-1
    a0bc:	d65f03c0 	ret

000000000000a0c0 <raise>:
    a0c0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a0c4:	d0000001 	adrp	x1, c000 <__func__.0+0x28>
    a0c8:	910003fd 	mov	x29, sp
    a0cc:	a90153f3 	stp	x19, x20, [sp, #16]
    a0d0:	f9443834 	ldr	x20, [x1, #2160]
    a0d4:	71007c1f 	cmp	w0, #0x1f
    a0d8:	54000468 	b.hi	a164 <raise+0xa4>  // b.pmore
    a0dc:	f9428e82 	ldr	x2, [x20, #1304]
    a0e0:	2a0003f3 	mov	w19, w0
    a0e4:	b40001c2 	cbz	x2, a11c <raise+0x5c>
    a0e8:	93407c03 	sxtw	x3, w0
    a0ec:	f8637841 	ldr	x1, [x2, x3, lsl #3]
    a0f0:	b4000161 	cbz	x1, a11c <raise+0x5c>
    a0f4:	f100043f 	cmp	x1, #0x1
    a0f8:	540002e0 	b.eq	a154 <raise+0x94>  // b.none
    a0fc:	b100043f 	cmn	x1, #0x1
    a100:	540001e0 	b.eq	a13c <raise+0x7c>  // b.none
    a104:	f823785f 	str	xzr, [x2, x3, lsl #3]
    a108:	d63f0020 	blr	x1
    a10c:	52800000 	mov	w0, #0x0                   	// #0
    a110:	a94153f3 	ldp	x19, x20, [sp, #16]
    a114:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a118:	d65f03c0 	ret
    a11c:	aa1403e0 	mov	x0, x20
    a120:	9400009c 	bl	a390 <_getpid_r>
    a124:	2a1303e2 	mov	w2, w19
    a128:	2a0003e1 	mov	w1, w0
    a12c:	aa1403e0 	mov	x0, x20
    a130:	a94153f3 	ldp	x19, x20, [sp, #16]
    a134:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a138:	14000082 	b	a340 <_kill_r>
    a13c:	528002c1 	mov	w1, #0x16                  	// #22
    a140:	b9000281 	str	w1, [x20]
    a144:	52800020 	mov	w0, #0x1                   	// #1
    a148:	a94153f3 	ldp	x19, x20, [sp, #16]
    a14c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a150:	d65f03c0 	ret
    a154:	52800000 	mov	w0, #0x0                   	// #0
    a158:	a94153f3 	ldp	x19, x20, [sp, #16]
    a15c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a160:	d65f03c0 	ret
    a164:	528002c1 	mov	w1, #0x16                  	// #22
    a168:	12800000 	mov	w0, #0xffffffff            	// #-1
    a16c:	b9000281 	str	w1, [x20]
    a170:	17ffffe8 	b	a110 <raise+0x50>
    a174:	d503201f 	nop
    a178:	d503201f 	nop
    a17c:	d503201f 	nop

000000000000a180 <signal>:
    a180:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a184:	d0000002 	adrp	x2, c000 <__func__.0+0x28>
    a188:	910003fd 	mov	x29, sp
    a18c:	a90153f3 	stp	x19, x20, [sp, #16]
    a190:	93407c13 	sxtw	x19, w0
    a194:	f90013f5 	str	x21, [sp, #32]
    a198:	f9443855 	ldr	x21, [x2, #2160]
    a19c:	71007e7f 	cmp	w19, #0x1f
    a1a0:	54000148 	b.hi	a1c8 <signal+0x48>  // b.pmore
    a1a4:	aa0103f4 	mov	x20, x1
    a1a8:	f9428ea1 	ldr	x1, [x21, #1304]
    a1ac:	b40001c1 	cbz	x1, a1e4 <signal+0x64>
    a1b0:	f8737820 	ldr	x0, [x1, x19, lsl #3]
    a1b4:	f8337834 	str	x20, [x1, x19, lsl #3]
    a1b8:	a94153f3 	ldp	x19, x20, [sp, #16]
    a1bc:	f94013f5 	ldr	x21, [sp, #32]
    a1c0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a1c4:	d65f03c0 	ret
    a1c8:	528002c1 	mov	w1, #0x16                  	// #22
    a1cc:	b90002a1 	str	w1, [x21]
    a1d0:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a1d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a1d8:	f94013f5 	ldr	x21, [sp, #32]
    a1dc:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a1e0:	d65f03c0 	ret
    a1e4:	d2802001 	mov	x1, #0x100                 	// #256
    a1e8:	aa1503e0 	mov	x0, x21
    a1ec:	97fff9a5 	bl	8880 <_malloc_r>
    a1f0:	f9028ea0 	str	x0, [x21, #1304]
    a1f4:	aa0003e1 	mov	x1, x0
    a1f8:	b4000100 	cbz	x0, a218 <signal+0x98>
    a1fc:	aa0003e2 	mov	x2, x0
    a200:	91040003 	add	x3, x0, #0x100
    a204:	d503201f 	nop
    a208:	f800845f 	str	xzr, [x2], #8
    a20c:	eb02007f 	cmp	x3, x2
    a210:	54ffffc1 	b.ne	a208 <signal+0x88>  // b.any
    a214:	17ffffe7 	b	a1b0 <signal+0x30>
    a218:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
    a21c:	17ffffe7 	b	a1b8 <signal+0x38>

000000000000a220 <_init_signal>:
    a220:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a224:	d0000000 	adrp	x0, c000 <__func__.0+0x28>
    a228:	910003fd 	mov	x29, sp
    a22c:	f9000bf3 	str	x19, [sp, #16]
    a230:	f9443813 	ldr	x19, [x0, #2160]
    a234:	f9428e60 	ldr	x0, [x19, #1304]
    a238:	b40000a0 	cbz	x0, a24c <_init_signal+0x2c>
    a23c:	52800000 	mov	w0, #0x0                   	// #0
    a240:	f9400bf3 	ldr	x19, [sp, #16]
    a244:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a248:	d65f03c0 	ret
    a24c:	aa1303e0 	mov	x0, x19
    a250:	d2802001 	mov	x1, #0x100                 	// #256
    a254:	97fff98b 	bl	8880 <_malloc_r>
    a258:	f9028e60 	str	x0, [x19, #1304]
    a25c:	b40000e0 	cbz	x0, a278 <_init_signal+0x58>
    a260:	91040001 	add	x1, x0, #0x100
    a264:	d503201f 	nop
    a268:	f800841f 	str	xzr, [x0], #8
    a26c:	eb01001f 	cmp	x0, x1
    a270:	54ffffc1 	b.ne	a268 <_init_signal+0x48>  // b.any
    a274:	17fffff2 	b	a23c <_init_signal+0x1c>
    a278:	12800000 	mov	w0, #0xffffffff            	// #-1
    a27c:	17fffff1 	b	a240 <_init_signal+0x20>

000000000000a280 <__sigtramp>:
    a280:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a284:	d0000001 	adrp	x1, c000 <__func__.0+0x28>
    a288:	910003fd 	mov	x29, sp
    a28c:	a90153f3 	stp	x19, x20, [sp, #16]
    a290:	f9443834 	ldr	x20, [x1, #2160]
    a294:	71007c1f 	cmp	w0, #0x1f
    a298:	54000508 	b.hi	a338 <__sigtramp+0xb8>  // b.pmore
    a29c:	f9428e82 	ldr	x2, [x20, #1304]
    a2a0:	2a0003f3 	mov	w19, w0
    a2a4:	b4000262 	cbz	x2, a2f0 <__sigtramp+0x70>
    a2a8:	f873d841 	ldr	x1, [x2, w19, sxtw #3]
    a2ac:	8b33cc42 	add	x2, x2, w19, sxtw #3
    a2b0:	b4000181 	cbz	x1, a2e0 <__sigtramp+0x60>
    a2b4:	b100043f 	cmn	x1, #0x1
    a2b8:	540003c0 	b.eq	a330 <__sigtramp+0xb0>  // b.none
    a2bc:	f100043f 	cmp	x1, #0x1
    a2c0:	54000300 	b.eq	a320 <__sigtramp+0xa0>  // b.none
    a2c4:	f900005f 	str	xzr, [x2]
    a2c8:	2a1303e0 	mov	w0, w19
    a2cc:	d63f0020 	blr	x1
    a2d0:	52800000 	mov	w0, #0x0                   	// #0
    a2d4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a2d8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a2dc:	d65f03c0 	ret
    a2e0:	52800020 	mov	w0, #0x1                   	// #1
    a2e4:	a94153f3 	ldp	x19, x20, [sp, #16]
    a2e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a2ec:	d65f03c0 	ret
    a2f0:	aa1403e0 	mov	x0, x20
    a2f4:	d2802001 	mov	x1, #0x100                 	// #256
    a2f8:	97fff962 	bl	8880 <_malloc_r>
    a2fc:	f9028e80 	str	x0, [x20, #1304]
    a300:	aa0003e2 	mov	x2, x0
    a304:	b40001a0 	cbz	x0, a338 <__sigtramp+0xb8>
    a308:	aa0003e1 	mov	x1, x0
    a30c:	91040000 	add	x0, x0, #0x100
    a310:	f800843f 	str	xzr, [x1], #8
    a314:	eb00003f 	cmp	x1, x0
    a318:	54ffffc1 	b.ne	a310 <__sigtramp+0x90>  // b.any
    a31c:	17ffffe3 	b	a2a8 <__sigtramp+0x28>
    a320:	52800060 	mov	w0, #0x3                   	// #3
    a324:	a94153f3 	ldp	x19, x20, [sp, #16]
    a328:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a32c:	d65f03c0 	ret
    a330:	52800040 	mov	w0, #0x2                   	// #2
    a334:	17ffffe8 	b	a2d4 <__sigtramp+0x54>
    a338:	12800000 	mov	w0, #0xffffffff            	// #-1
    a33c:	17ffffe6 	b	a2d4 <__sigtramp+0x54>

000000000000a340 <_kill_r>:
    a340:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a344:	910003fd 	mov	x29, sp
    a348:	a90153f3 	stp	x19, x20, [sp, #16]
    a34c:	f0000014 	adrp	x20, d000 <__global_locale+0x20>
    a350:	aa0003f3 	mov	x19, x0
    a354:	b90dba9f 	str	wzr, [x20, #3512]
    a358:	2a0103e0 	mov	w0, w1
    a35c:	2a0203e1 	mov	w1, w2
    a360:	97ffe67c 	bl	3d50 <_kill>
    a364:	3100041f 	cmn	w0, #0x1
    a368:	54000080 	b.eq	a378 <_kill_r+0x38>  // b.none
    a36c:	a94153f3 	ldp	x19, x20, [sp, #16]
    a370:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a374:	d65f03c0 	ret
    a378:	b94dba81 	ldr	w1, [x20, #3512]
    a37c:	34ffff81 	cbz	w1, a36c <_kill_r+0x2c>
    a380:	b9000261 	str	w1, [x19]
    a384:	a94153f3 	ldp	x19, x20, [sp, #16]
    a388:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a38c:	d65f03c0 	ret

000000000000a390 <_getpid_r>:
    a390:	17ffe674 	b	3d60 <_getpid>
    a394:	d503201f 	nop
    a398:	d503201f 	nop
    a39c:	d503201f 	nop

000000000000a3a0 <__sread>:
    a3a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a3a4:	93407c63 	sxtw	x3, w3
    a3a8:	910003fd 	mov	x29, sp
    a3ac:	f9000bf3 	str	x19, [sp, #16]
    a3b0:	aa0103f3 	mov	x19, x1
    a3b4:	79c02421 	ldrsh	w1, [x1, #18]
    a3b8:	9400053a 	bl	b8a0 <_read_r>
    a3bc:	b7f800e0 	tbnz	x0, #63, a3d8 <__sread+0x38>
    a3c0:	f9404a61 	ldr	x1, [x19, #144]
    a3c4:	8b000021 	add	x1, x1, x0
    a3c8:	f9004a61 	str	x1, [x19, #144]
    a3cc:	f9400bf3 	ldr	x19, [sp, #16]
    a3d0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a3d4:	d65f03c0 	ret
    a3d8:	79402261 	ldrh	w1, [x19, #16]
    a3dc:	12137821 	and	w1, w1, #0xffffefff
    a3e0:	79002261 	strh	w1, [x19, #16]
    a3e4:	f9400bf3 	ldr	x19, [sp, #16]
    a3e8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a3ec:	d65f03c0 	ret

000000000000a3f0 <__seofread>:
    a3f0:	52800000 	mov	w0, #0x0                   	// #0
    a3f4:	d65f03c0 	ret
    a3f8:	d503201f 	nop
    a3fc:	d503201f 	nop

000000000000a400 <__swrite>:
    a400:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    a404:	910003fd 	mov	x29, sp
    a408:	79c02024 	ldrsh	w4, [x1, #16]
    a40c:	a90153f3 	stp	x19, x20, [sp, #16]
    a410:	aa0103f3 	mov	x19, x1
    a414:	aa0003f4 	mov	x20, x0
    a418:	a9025bf5 	stp	x21, x22, [sp, #32]
    a41c:	aa0203f5 	mov	x21, x2
    a420:	2a0303f6 	mov	w22, w3
    a424:	37400184 	tbnz	w4, #8, a454 <__swrite+0x54>
    a428:	79c02661 	ldrsh	w1, [x19, #18]
    a42c:	12137884 	and	w4, w4, #0xffffefff
    a430:	79002264 	strh	w4, [x19, #16]
    a434:	93407ec3 	sxtw	x3, w22
    a438:	aa1503e2 	mov	x2, x21
    a43c:	aa1403e0 	mov	x0, x20
    a440:	940003f8 	bl	b420 <_write_r>
    a444:	a94153f3 	ldp	x19, x20, [sp, #16]
    a448:	a9425bf5 	ldp	x21, x22, [sp, #32]
    a44c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    a450:	d65f03c0 	ret
    a454:	79c02421 	ldrsh	w1, [x1, #18]
    a458:	52800043 	mov	w3, #0x2                   	// #2
    a45c:	d2800002 	mov	x2, #0x0                   	// #0
    a460:	940004f8 	bl	b840 <_lseek_r>
    a464:	79c02264 	ldrsh	w4, [x19, #16]
    a468:	17fffff0 	b	a428 <__swrite+0x28>
    a46c:	d503201f 	nop

000000000000a470 <__sseek>:
    a470:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a474:	910003fd 	mov	x29, sp
    a478:	f9000bf3 	str	x19, [sp, #16]
    a47c:	aa0103f3 	mov	x19, x1
    a480:	79c02421 	ldrsh	w1, [x1, #18]
    a484:	940004ef 	bl	b840 <_lseek_r>
    a488:	79402261 	ldrh	w1, [x19, #16]
    a48c:	b100041f 	cmn	x0, #0x1
    a490:	540000e0 	b.eq	a4ac <__sseek+0x3c>  // b.none
    a494:	32140021 	orr	w1, w1, #0x1000
    a498:	79002261 	strh	w1, [x19, #16]
    a49c:	f9004a60 	str	x0, [x19, #144]
    a4a0:	f9400bf3 	ldr	x19, [sp, #16]
    a4a4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a4a8:	d65f03c0 	ret
    a4ac:	12137821 	and	w1, w1, #0xffffefff
    a4b0:	79002261 	strh	w1, [x19, #16]
    a4b4:	f9400bf3 	ldr	x19, [sp, #16]
    a4b8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a4bc:	d65f03c0 	ret

000000000000a4c0 <__sclose>:
    a4c0:	79c02421 	ldrsh	w1, [x1, #18]
    a4c4:	140003ef 	b	b480 <_close_r>
    a4c8:	d503201f 	nop
    a4cc:	d503201f 	nop

000000000000a4d0 <strcasecmp>:
    a4d0:	d0000006 	adrp	x6, c000 <__func__.0+0x28>
    a4d4:	aa0003e8 	mov	x8, x0
    a4d8:	911d24c6 	add	x6, x6, #0x749
    a4dc:	d2800003 	mov	x3, #0x0                   	// #0
    a4e0:	38636902 	ldrb	w2, [x8, x3]
    a4e4:	38636820 	ldrb	w0, [x1, x3]
    a4e8:	91000463 	add	x3, x3, #0x1
    a4ec:	92401c45 	and	x5, x2, #0xff
    a4f0:	11008047 	add	w7, w2, #0x20
    a4f4:	92401c04 	and	x4, x0, #0xff
    a4f8:	386568c5 	ldrb	w5, [x6, x5]
    a4fc:	386468c4 	ldrb	w4, [x6, x4]
    a500:	120004a5 	and	w5, w5, #0x3
    a504:	710004bf 	cmp	w5, #0x1
    a508:	12000484 	and	w4, w4, #0x3
    a50c:	1a8200e2 	csel	w2, w7, w2, eq  // eq = none
    a510:	7100049f 	cmp	w4, #0x1
    a514:	540000a0 	b.eq	a528 <strcasecmp+0x58>  // b.none
    a518:	6b000042 	subs	w2, w2, w0
    a51c:	540000e1 	b.ne	a538 <strcasecmp+0x68>  // b.any
    a520:	35fffe00 	cbnz	w0, a4e0 <strcasecmp+0x10>
    a524:	d65f03c0 	ret
    a528:	11008000 	add	w0, w0, #0x20
    a52c:	6b000040 	subs	w0, w2, w0
    a530:	54fffd80 	b.eq	a4e0 <strcasecmp+0x10>  // b.none
    a534:	d65f03c0 	ret
    a538:	2a0203e0 	mov	w0, w2
    a53c:	d65f03c0 	ret

000000000000a540 <strcat>:
    a540:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    a544:	910003fd 	mov	x29, sp
    a548:	f9000bf3 	str	x19, [sp, #16]
    a54c:	aa0003f3 	mov	x19, x0
    a550:	f240081f 	tst	x0, #0x7
    a554:	540001c1 	b.ne	a58c <strcat+0x4c>  // b.any
    a558:	f9400002 	ldr	x2, [x0]
    a55c:	b207dbe4 	mov	x4, #0xfefefefefefefefe    	// #-72340172838076674
    a560:	f29fdfe4 	movk	x4, #0xfeff
    a564:	8b040043 	add	x3, x2, x4
    a568:	8a220062 	bic	x2, x3, x2
    a56c:	f201c05f 	tst	x2, #0x8080808080808080
    a570:	540000e1 	b.ne	a58c <strcat+0x4c>  // b.any
    a574:	d503201f 	nop
    a578:	f8408c02 	ldr	x2, [x0, #8]!
    a57c:	8b040043 	add	x3, x2, x4
    a580:	8a220062 	bic	x2, x3, x2
    a584:	f201c05f 	tst	x2, #0x8080808080808080
    a588:	54ffff80 	b.eq	a578 <strcat+0x38>  // b.none
    a58c:	39400002 	ldrb	w2, [x0]
    a590:	34000082 	cbz	w2, a5a0 <strcat+0x60>
    a594:	d503201f 	nop
    a598:	38401c02 	ldrb	w2, [x0, #1]!
    a59c:	35ffffe2 	cbnz	w2, a598 <strcat+0x58>
    a5a0:	94000088 	bl	a7c0 <strcpy>
    a5a4:	aa1303e0 	mov	x0, x19
    a5a8:	f9400bf3 	ldr	x19, [sp, #16]
    a5ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    a5b0:	d65f03c0 	ret

000000000000a5b4 <strchr>:
    a5b4:	52808024 	mov	w4, #0x401                 	// #1025
    a5b8:	72a80204 	movk	w4, #0x4010, lsl #16
    a5bc:	4e010c20 	dup	v0.16b, w1
    a5c0:	927be802 	and	x2, x0, #0xffffffffffffffe0
    a5c4:	4e040c90 	dup	v16.4s, w4
    a5c8:	f2401003 	ands	x3, x0, #0x1f
    a5cc:	4eb08607 	add	v7.4s, v16.4s, v16.4s
    a5d0:	540002a0 	b.eq	a624 <strchr+0x70>  // b.none
    a5d4:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    a5d8:	cb0303e3 	neg	x3, x3
    a5dc:	4e209823 	cmeq	v3.16b, v1.16b, #0
    a5e0:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    a5e4:	4e209844 	cmeq	v4.16b, v2.16b, #0
    a5e8:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    a5ec:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    a5f0:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    a5f4:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    a5f8:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    a5fc:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    a600:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    a604:	d37ff863 	lsl	x3, x3, #1
    a608:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    a60c:	92800005 	mov	x5, #0xffffffffffffffff    	// #-1
    a610:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    a614:	9ac324a3 	lsr	x3, x5, x3
    a618:	4e083e25 	mov	x5, v17.d[0]
    a61c:	8a2300a3 	bic	x3, x5, x3
    a620:	b50002a3 	cbnz	x3, a674 <strchr+0xc0>
    a624:	4cdfa041 	ld1	{v1.16b, v2.16b}, [x2], #32
    a628:	4e209823 	cmeq	v3.16b, v1.16b, #0
    a62c:	6e208c25 	cmeq	v5.16b, v1.16b, v0.16b
    a630:	4e209844 	cmeq	v4.16b, v2.16b, #0
    a634:	6e208c46 	cmeq	v6.16b, v2.16b, v0.16b
    a638:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    a63c:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    a640:	4eb21e31 	orr	v17.16b, v17.16b, v18.16b
    a644:	4ef1be31 	addp	v17.2d, v17.2d, v17.2d
    a648:	4e083e23 	mov	x3, v17.d[0]
    a64c:	b4fffec3 	cbz	x3, a624 <strchr+0x70>
    a650:	4e271c63 	and	v3.16b, v3.16b, v7.16b
    a654:	4e271c84 	and	v4.16b, v4.16b, v7.16b
    a658:	4e301ca5 	and	v5.16b, v5.16b, v16.16b
    a65c:	4e301cc6 	and	v6.16b, v6.16b, v16.16b
    a660:	4ea51c71 	orr	v17.16b, v3.16b, v5.16b
    a664:	4ea61c92 	orr	v18.16b, v4.16b, v6.16b
    a668:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    a66c:	4e32be31 	addp	v17.16b, v17.16b, v18.16b
    a670:	4e083e23 	mov	x3, v17.d[0]
    a674:	dac00063 	rbit	x3, x3
    a678:	d1008042 	sub	x2, x2, #0x20
    a67c:	dac01063 	clz	x3, x3
    a680:	f240007f 	tst	x3, #0x1
    a684:	8b430440 	add	x0, x2, x3, lsr #1
    a688:	9a9f0000 	csel	x0, x0, xzr, eq  // eq = none
    a68c:	d65f03c0 	ret
    a690:	d503201f 	nop
    a694:	d503201f 	nop
    a698:	d503201f 	nop
    a69c:	d503201f 	nop
    a6a0:	d503201f 	nop
    a6a4:	d503201f 	nop
    a6a8:	d503201f 	nop
    a6ac:	d503201f 	nop
    a6b0:	d503201f 	nop
    a6b4:	d503201f 	nop
    a6b8:	d503201f 	nop
    a6bc:	d503201f 	nop

000000000000a6c0 <strcmp>:
    a6c0:	ca010007 	eor	x7, x0, x1
    a6c4:	b200c3ea 	mov	x10, #0x101010101010101     	// #72340172838076673
    a6c8:	f24008ff 	tst	x7, #0x7
    a6cc:	540003e1 	b.ne	a748 <strcmp+0x88>  // b.any
    a6d0:	f2400807 	ands	x7, x0, #0x7
    a6d4:	54000241 	b.ne	a71c <strcmp+0x5c>  // b.any
    a6d8:	f8408402 	ldr	x2, [x0], #8
    a6dc:	f8408423 	ldr	x3, [x1], #8
    a6e0:	cb0a0047 	sub	x7, x2, x10
    a6e4:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    a6e8:	ca030045 	eor	x5, x2, x3
    a6ec:	8a2800e4 	bic	x4, x7, x8
    a6f0:	aa0400a6 	orr	x6, x5, x4
    a6f4:	b4ffff26 	cbz	x6, a6d8 <strcmp+0x18>
    a6f8:	dac00cc6 	rev	x6, x6
    a6fc:	dac00c42 	rev	x2, x2
    a700:	dac010cb 	clz	x11, x6
    a704:	dac00c63 	rev	x3, x3
    a708:	9acb2042 	lsl	x2, x2, x11
    a70c:	9acb2063 	lsl	x3, x3, x11
    a710:	d378fc42 	lsr	x2, x2, #56
    a714:	cb43e040 	sub	x0, x2, x3, lsr #56
    a718:	d65f03c0 	ret
    a71c:	927df000 	and	x0, x0, #0xfffffffffffffff8
    a720:	927df021 	and	x1, x1, #0xfffffffffffffff8
    a724:	d37df0e7 	lsl	x7, x7, #3
    a728:	f8408402 	ldr	x2, [x0], #8
    a72c:	cb0703e7 	neg	x7, x7
    a730:	f8408423 	ldr	x3, [x1], #8
    a734:	92800008 	mov	x8, #0xffffffffffffffff    	// #-1
    a738:	9ac72508 	lsr	x8, x8, x7
    a73c:	aa080042 	orr	x2, x2, x8
    a740:	aa080063 	orr	x3, x3, x8
    a744:	17ffffe7 	b	a6e0 <strcmp+0x20>
    a748:	f240081f 	tst	x0, #0x7
    a74c:	54000100 	b.eq	a76c <strcmp+0xac>  // b.none
    a750:	38401402 	ldrb	w2, [x0], #1
    a754:	38401423 	ldrb	w3, [x1], #1
    a758:	7100045f 	cmp	w2, #0x1
    a75c:	7a432040 	ccmp	w2, w3, #0x0, cs  // cs = hs, nlast
    a760:	540001e1 	b.ne	a79c <strcmp+0xdc>  // b.any
    a764:	f240081f 	tst	x0, #0x7
    a768:	54ffff41 	b.ne	a750 <strcmp+0x90>  // b.any
    a76c:	927d2027 	and	x7, x1, #0xff8
    a770:	d27d20e7 	eor	x7, x7, #0xff8
    a774:	b4fffee7 	cbz	x7, a750 <strcmp+0x90>
    a778:	f8408402 	ldr	x2, [x0], #8
    a77c:	f8408423 	ldr	x3, [x1], #8
    a780:	cb0a0047 	sub	x7, x2, x10
    a784:	b200d848 	orr	x8, x2, #0x7f7f7f7f7f7f7f7f
    a788:	ca030045 	eor	x5, x2, x3
    a78c:	8a2800e4 	bic	x4, x7, x8
    a790:	aa0400a6 	orr	x6, x5, x4
    a794:	b4fffec6 	cbz	x6, a76c <strcmp+0xac>
    a798:	17ffffd8 	b	a6f8 <strcmp+0x38>
    a79c:	cb030040 	sub	x0, x2, x3
    a7a0:	d65f03c0 	ret
    a7a4:	d503201f 	nop
    a7a8:	d503201f 	nop
    a7ac:	d503201f 	nop
    a7b0:	d503201f 	nop
    a7b4:	d503201f 	nop
    a7b8:	d503201f 	nop
    a7bc:	d503201f 	nop

000000000000a7c0 <strcpy>:
    a7c0:	92402c29 	and	x9, x1, #0xfff
    a7c4:	b200c3ec 	mov	x12, #0x101010101010101     	// #72340172838076673
    a7c8:	92400c31 	and	x17, x1, #0xf
    a7cc:	f13fc13f 	cmp	x9, #0xff0
    a7d0:	cb1103e8 	neg	x8, x17
    a7d4:	540008cc 	b.gt	a8ec <strcpy+0x12c>
    a7d8:	a9401424 	ldp	x4, x5, [x1]
    a7dc:	cb0c0088 	sub	x8, x4, x12
    a7e0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a7e4:	ea290106 	bics	x6, x8, x9
    a7e8:	540001c1 	b.ne	a820 <strcpy+0x60>  // b.any
    a7ec:	cb0c00aa 	sub	x10, x5, x12
    a7f0:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a7f4:	ea2b0147 	bics	x7, x10, x11
    a7f8:	54000440 	b.eq	a880 <strcpy+0xc0>  // b.none
    a7fc:	dac00ce7 	rev	x7, x7
    a800:	dac010ef 	clz	x15, x7
    a804:	d2800709 	mov	x9, #0x38                  	// #56
    a808:	8b4f0c03 	add	x3, x0, x15, lsr #3
    a80c:	cb0f012f 	sub	x15, x9, x15
    a810:	9acf20a5 	lsl	x5, x5, x15
    a814:	f8001065 	stur	x5, [x3, #1]
    a818:	f9000004 	str	x4, [x0]
    a81c:	d65f03c0 	ret
    a820:	dac00cc6 	rev	x6, x6
    a824:	dac010cf 	clz	x15, x6
    a828:	8b4f0c03 	add	x3, x0, x15, lsr #3
    a82c:	f10061e9 	subs	x9, x15, #0x18
    a830:	540000ab 	b.lt	a844 <strcpy+0x84>  // b.tstop
    a834:	9ac92485 	lsr	x5, x4, x9
    a838:	b81fd065 	stur	w5, [x3, #-3]
    a83c:	b9000004 	str	w4, [x0]
    a840:	d65f03c0 	ret
    a844:	b400004f 	cbz	x15, a84c <strcpy+0x8c>
    a848:	79000004 	strh	w4, [x0]
    a84c:	3900007f 	strb	wzr, [x3]
    a850:	d65f03c0 	ret
    a854:	d503201f 	nop
    a858:	d503201f 	nop
    a85c:	d503201f 	nop
    a860:	d503201f 	nop
    a864:	d503201f 	nop
    a868:	d503201f 	nop
    a86c:	d503201f 	nop
    a870:	d503201f 	nop
    a874:	d503201f 	nop
    a878:	d503201f 	nop
    a87c:	d503201f 	nop
    a880:	d1004231 	sub	x17, x17, #0x10
    a884:	a9001404 	stp	x4, x5, [x0]
    a888:	cb110022 	sub	x2, x1, x17
    a88c:	cb110003 	sub	x3, x0, x17
    a890:	14000002 	b	a898 <strcpy+0xd8>
    a894:	a8811464 	stp	x4, x5, [x3], #16
    a898:	a8c11444 	ldp	x4, x5, [x2], #16
    a89c:	cb0c0088 	sub	x8, x4, x12
    a8a0:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a8a4:	cb0c00aa 	sub	x10, x5, x12
    a8a8:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a8ac:	8a290106 	bic	x6, x8, x9
    a8b0:	ea2b0147 	bics	x7, x10, x11
    a8b4:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    a8b8:	54fffee0 	b.eq	a894 <strcpy+0xd4>  // b.none
    a8bc:	f10000df 	cmp	x6, #0x0
    a8c0:	9a8710c6 	csel	x6, x6, x7, ne  // ne = any
    a8c4:	dac00cc6 	rev	x6, x6
    a8c8:	dac010cf 	clz	x15, x6
    a8cc:	910121e8 	add	x8, x15, #0x48
    a8d0:	910021ef 	add	x15, x15, #0x8
    a8d4:	9a8811ef 	csel	x15, x15, x8, ne  // ne = any
    a8d8:	8b4f0c42 	add	x2, x2, x15, lsr #3
    a8dc:	8b4f0c63 	add	x3, x3, x15, lsr #3
    a8e0:	a97e1444 	ldp	x4, x5, [x2, #-32]
    a8e4:	a93f1464 	stp	x4, x5, [x3, #-16]
    a8e8:	d65f03c0 	ret
    a8ec:	927cec22 	and	x2, x1, #0xfffffffffffffff0
    a8f0:	a9401444 	ldp	x4, x5, [x2]
    a8f4:	d37df108 	lsl	x8, x8, #3
    a8f8:	f2400a3f 	tst	x17, #0x7
    a8fc:	da9f03e9 	csetm	x9, ne  // ne = any
    a900:	9ac82529 	lsr	x9, x9, x8
    a904:	aa090084 	orr	x4, x4, x9
    a908:	aa0900ae 	orr	x14, x5, x9
    a90c:	f100223f 	cmp	x17, #0x8
    a910:	da9fb084 	csinv	x4, x4, xzr, lt  // lt = tstop
    a914:	9a8eb0a5 	csel	x5, x5, x14, lt  // lt = tstop
    a918:	cb0c0088 	sub	x8, x4, x12
    a91c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a920:	cb0c00aa 	sub	x10, x5, x12
    a924:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a928:	8a290106 	bic	x6, x8, x9
    a92c:	ea2b0147 	bics	x7, x10, x11
    a930:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    a934:	54fff520 	b.eq	a7d8 <strcpy+0x18>  // b.none
    a938:	d37df228 	lsl	x8, x17, #3
    a93c:	cb110fe9 	neg	x9, x17, lsl #3
    a940:	9ac8248d 	lsr	x13, x4, x8
    a944:	9ac920ab 	lsl	x11, x5, x9
    a948:	9ac824a5 	lsr	x5, x5, x8
    a94c:	aa0d016b 	orr	x11, x11, x13
    a950:	f100223f 	cmp	x17, #0x8
    a954:	9a85b164 	csel	x4, x11, x5, lt  // lt = tstop
    a958:	cb0c0088 	sub	x8, x4, x12
    a95c:	b200d889 	orr	x9, x4, #0x7f7f7f7f7f7f7f7f
    a960:	cb0c00aa 	sub	x10, x5, x12
    a964:	b200d8ab 	orr	x11, x5, #0x7f7f7f7f7f7f7f7f
    a968:	8a290106 	bic	x6, x8, x9
    a96c:	b5fff5a6 	cbnz	x6, a820 <strcpy+0x60>
    a970:	8a2b0147 	bic	x7, x10, x11
    a974:	17ffffa2 	b	a7fc <strcpy+0x3c>
    a978:	d503201f 	nop
    a97c:	d503201f 	nop

000000000000a980 <strlcpy>:
    a980:	aa0003e4 	mov	x4, x0
    a984:	aa0103e3 	mov	x3, x1
    a988:	b4000202 	cbz	x2, a9c8 <strlcpy+0x48>
    a98c:	f100045f 	cmp	x2, #0x1
    a990:	54000180 	b.eq	a9c0 <strlcpy+0x40>  // b.none
    a994:	8b020002 	add	x2, x0, x2
    a998:	14000003 	b	a9a4 <strlcpy+0x24>
    a99c:	ab02001f 	cmn	x0, x2
    a9a0:	54000100 	b.eq	a9c0 <strlcpy+0x40>  // b.none
    a9a4:	38401465 	ldrb	w5, [x3], #1
    a9a8:	38001485 	strb	w5, [x4], #1
    a9ac:	aa2403e0 	mvn	x0, x4
    a9b0:	35ffff65 	cbnz	w5, a99c <strlcpy+0x1c>
    a9b4:	cb010060 	sub	x0, x3, x1
    a9b8:	d1000400 	sub	x0, x0, #0x1
    a9bc:	d65f03c0 	ret
    a9c0:	3900009f 	strb	wzr, [x4]
    a9c4:	d503201f 	nop
    a9c8:	38401462 	ldrb	w2, [x3], #1
    a9cc:	34ffff42 	cbz	w2, a9b4 <strlcpy+0x34>
    a9d0:	38401462 	ldrb	w2, [x3], #1
    a9d4:	35ffffa2 	cbnz	w2, a9c8 <strlcpy+0x48>
    a9d8:	17fffff7 	b	a9b4 <strlcpy+0x34>
    a9dc:	d503201f 	nop

000000000000a9e0 <strncasecmp>:
    a9e0:	aa0003e9 	mov	x9, x0
    a9e4:	b4000382 	cbz	x2, aa54 <strncasecmp+0x74>
    a9e8:	d0000007 	adrp	x7, c000 <__func__.0+0x28>
    a9ec:	d2800004 	mov	x4, #0x0                   	// #0
    a9f0:	911d24e7 	add	x7, x7, #0x749
    a9f4:	14000006 	b	aa0c <strncasecmp+0x2c>
    a9f8:	6b000063 	subs	w3, w3, w0
    a9fc:	54000301 	b.ne	aa5c <strncasecmp+0x7c>  // b.any
    aa00:	34000280 	cbz	w0, aa50 <strncasecmp+0x70>
    aa04:	eb04005f 	cmp	x2, x4
    aa08:	54000260 	b.eq	aa54 <strncasecmp+0x74>  // b.none
    aa0c:	38646923 	ldrb	w3, [x9, x4]
    aa10:	38646820 	ldrb	w0, [x1, x4]
    aa14:	91000484 	add	x4, x4, #0x1
    aa18:	92401c66 	and	x6, x3, #0xff
    aa1c:	11008068 	add	w8, w3, #0x20
    aa20:	92401c05 	and	x5, x0, #0xff
    aa24:	386668e6 	ldrb	w6, [x7, x6]
    aa28:	386568e5 	ldrb	w5, [x7, x5]
    aa2c:	120004c6 	and	w6, w6, #0x3
    aa30:	710004df 	cmp	w6, #0x1
    aa34:	120004a5 	and	w5, w5, #0x3
    aa38:	1a830103 	csel	w3, w8, w3, eq  // eq = none
    aa3c:	710004bf 	cmp	w5, #0x1
    aa40:	54fffdc1 	b.ne	a9f8 <strncasecmp+0x18>  // b.any
    aa44:	11008000 	add	w0, w0, #0x20
    aa48:	6b000060 	subs	w0, w3, w0
    aa4c:	54fffdc0 	b.eq	aa04 <strncasecmp+0x24>  // b.none
    aa50:	d65f03c0 	ret
    aa54:	52800000 	mov	w0, #0x0                   	// #0
    aa58:	d65f03c0 	ret
    aa5c:	2a0303e0 	mov	w0, w3
    aa60:	d65f03c0 	ret
    aa64:	d503201f 	nop
    aa68:	d503201f 	nop
    aa6c:	d503201f 	nop

000000000000aa70 <strncpy>:
    aa70:	aa000023 	orr	x3, x1, x0
    aa74:	f240087f 	tst	x3, #0x7
    aa78:	aa0003e3 	mov	x3, x0
    aa7c:	fa470840 	ccmp	x2, #0x7, #0x0, eq  // eq = none
    aa80:	540002c8 	b.hi	aad8 <strncpy+0x68>  // b.pmore
    aa84:	d1000445 	sub	x5, x2, #0x1
    aa88:	d2800027 	mov	x7, #0x1                   	// #1
    aa8c:	8b050025 	add	x5, x1, x5
    aa90:	14000007 	b	aaac <strncpy+0x3c>
    aa94:	386468a4 	ldrb	w4, [x5, x4]
    aa98:	d1000446 	sub	x6, x2, #0x1
    aa9c:	38001424 	strb	w4, [x1], #1
    aaa0:	340000e4 	cbz	w4, aabc <strncpy+0x4c>
    aaa4:	aa0103e3 	mov	x3, x1
    aaa8:	aa0603e2 	mov	x2, x6
    aaac:	cb0200e4 	sub	x4, x7, x2
    aab0:	aa0303e1 	mov	x1, x3
    aab4:	b5ffff02 	cbnz	x2, aa94 <strncpy+0x24>
    aab8:	d65f03c0 	ret
    aabc:	8b020062 	add	x2, x3, x2
    aac0:	b4ffffc6 	cbz	x6, aab8 <strncpy+0x48>
    aac4:	d503201f 	nop
    aac8:	3800143f 	strb	wzr, [x1], #1
    aacc:	eb02003f 	cmp	x1, x2
    aad0:	54ffffc1 	b.ne	aac8 <strncpy+0x58>  // b.any
    aad4:	d65f03c0 	ret
    aad8:	b207dbe6 	mov	x6, #0xfefefefefefefefe    	// #-72340172838076674
    aadc:	f29fdfe6 	movk	x6, #0xfeff
    aae0:	f9400025 	ldr	x5, [x1]
    aae4:	8b0600a4 	add	x4, x5, x6
    aae8:	8a250084 	bic	x4, x4, x5
    aaec:	f201c09f 	tst	x4, #0x8080808080808080
    aaf0:	54fffca1 	b.ne	aa84 <strncpy+0x14>  // b.any
    aaf4:	d1002042 	sub	x2, x2, #0x8
    aaf8:	f8008465 	str	x5, [x3], #8
    aafc:	91002021 	add	x1, x1, #0x8
    ab00:	f1001c5f 	cmp	x2, #0x7
    ab04:	54fffee8 	b.hi	aae0 <strncpy+0x70>  // b.pmore
    ab08:	17ffffdf 	b	aa84 <strncpy+0x14>
    ab0c:	d503201f 	nop

000000000000ab10 <_strtol_l.part.0>:
    ab10:	d0000007 	adrp	x7, c000 <__func__.0+0x28>
    ab14:	aa0003ec 	mov	x12, x0
    ab18:	aa0103e6 	mov	x6, x1
    ab1c:	911d24e7 	add	x7, x7, #0x749
    ab20:	aa0603e8 	mov	x8, x6
    ab24:	384014c4 	ldrb	w4, [x6], #1
    ab28:	92401c85 	and	x5, x4, #0xff
    ab2c:	386568e5 	ldrb	w5, [x7, x5]
    ab30:	371fff85 	tbnz	w5, #3, ab20 <_strtol_l.part.0+0x10>
    ab34:	2a0403e5 	mov	w5, w4
    ab38:	7100b49f 	cmp	w4, #0x2d
    ab3c:	54000880 	b.eq	ac4c <_strtol_l.part.0+0x13c>  // b.none
    ab40:	92f0000b 	mov	x11, #0x7fffffffffffffff    	// #9223372036854775807
    ab44:	5280000d 	mov	w13, #0x0                   	// #0
    ab48:	7100ac9f 	cmp	w4, #0x2b
    ab4c:	540006a0 	b.eq	ac20 <_strtol_l.part.0+0x110>  // b.none
    ab50:	721b787f 	tst	w3, #0xffffffef
    ab54:	54000121 	b.ne	ab78 <_strtol_l.part.0+0x68>  // b.any
    ab58:	7100c0bf 	cmp	w5, #0x30
    ab5c:	54000820 	b.eq	ac60 <_strtol_l.part.0+0x150>  // b.none
    ab60:	350000c3 	cbnz	w3, ab78 <_strtol_l.part.0+0x68>
    ab64:	d280014a 	mov	x10, #0xa                   	// #10
    ab68:	2a0a03e3 	mov	w3, w10
    ab6c:	14000004 	b	ab7c <_strtol_l.part.0+0x6c>
    ab70:	34000903 	cbz	w3, ac90 <_strtol_l.part.0+0x180>
    ab74:	d503201f 	nop
    ab78:	93407c6a 	sxtw	x10, w3
    ab7c:	9aca0968 	udiv	x8, x11, x10
    ab80:	52800007 	mov	w7, #0x0                   	// #0
    ab84:	d2800000 	mov	x0, #0x0                   	// #0
    ab88:	1b0aad09 	msub	w9, w8, w10, w11
    ab8c:	d503201f 	nop
    ab90:	5100c0a4 	sub	w4, w5, #0x30
    ab94:	7100249f 	cmp	w4, #0x9
    ab98:	540000a9 	b.ls	abac <_strtol_l.part.0+0x9c>  // b.plast
    ab9c:	510104a4 	sub	w4, w5, #0x41
    aba0:	7100649f 	cmp	w4, #0x19
    aba4:	54000208 	b.hi	abe4 <_strtol_l.part.0+0xd4>  // b.pmore
    aba8:	5100dca4 	sub	w4, w5, #0x37
    abac:	6b04007f 	cmp	w3, w4
    abb0:	5400028d 	b.le	ac00 <_strtol_l.part.0+0xf0>
    abb4:	710000ff 	cmp	w7, #0x0
    abb8:	12800007 	mov	w7, #0xffffffff            	// #-1
    abbc:	fa40a100 	ccmp	x8, x0, #0x0, ge  // ge = tcont
    abc0:	540000e3 	b.cc	abdc <_strtol_l.part.0+0xcc>  // b.lo, b.ul, b.last
    abc4:	eb00011f 	cmp	x8, x0
    abc8:	7a440120 	ccmp	w9, w4, #0x0, eq  // eq = none
    abcc:	5400008b 	b.lt	abdc <_strtol_l.part.0+0xcc>  // b.tstop
    abd0:	93407c84 	sxtw	x4, w4
    abd4:	52800027 	mov	w7, #0x1                   	// #1
    abd8:	9b0a1000 	madd	x0, x0, x10, x4
    abdc:	384014c5 	ldrb	w5, [x6], #1
    abe0:	17ffffec 	b	ab90 <_strtol_l.part.0+0x80>
    abe4:	510184a4 	sub	w4, w5, #0x61
    abe8:	7100649f 	cmp	w4, #0x19
    abec:	540000a8 	b.hi	ac00 <_strtol_l.part.0+0xf0>  // b.pmore
    abf0:	51015ca4 	sub	w4, w5, #0x57
    abf4:	6b04007f 	cmp	w3, w4
    abf8:	54fffdec 	b.gt	abb4 <_strtol_l.part.0+0xa4>
    abfc:	d503201f 	nop
    ac00:	310004ff 	cmn	w7, #0x1
    ac04:	54000140 	b.eq	ac2c <_strtol_l.part.0+0x11c>  // b.none
    ac08:	710001bf 	cmp	w13, #0x0
    ac0c:	da800400 	cneg	x0, x0, ne  // ne = any
    ac10:	b4000062 	cbz	x2, ac1c <_strtol_l.part.0+0x10c>
    ac14:	350003a7 	cbnz	w7, ac88 <_strtol_l.part.0+0x178>
    ac18:	f9000041 	str	x1, [x2]
    ac1c:	d65f03c0 	ret
    ac20:	394000c5 	ldrb	w5, [x6]
    ac24:	91000906 	add	x6, x8, #0x2
    ac28:	17ffffca 	b	ab50 <_strtol_l.part.0+0x40>
    ac2c:	52800440 	mov	w0, #0x22                  	// #34
    ac30:	b9000180 	str	w0, [x12]
    ac34:	aa0b03e0 	mov	x0, x11
    ac38:	b4ffff22 	cbz	x2, ac1c <_strtol_l.part.0+0x10c>
    ac3c:	d10004c1 	sub	x1, x6, #0x1
    ac40:	aa0b03e0 	mov	x0, x11
    ac44:	f9000041 	str	x1, [x2]
    ac48:	17fffff5 	b	ac1c <_strtol_l.part.0+0x10c>
    ac4c:	394000c5 	ldrb	w5, [x6]
    ac50:	d2f0000b 	mov	x11, #0x8000000000000000    	// #-9223372036854775808
    ac54:	91000906 	add	x6, x8, #0x2
    ac58:	5280002d 	mov	w13, #0x1                   	// #1
    ac5c:	17ffffbd 	b	ab50 <_strtol_l.part.0+0x40>
    ac60:	394000c0 	ldrb	w0, [x6]
    ac64:	121a7800 	and	w0, w0, #0xffffffdf
    ac68:	12001c00 	and	w0, w0, #0xff
    ac6c:	7101601f 	cmp	w0, #0x58
    ac70:	54fff801 	b.ne	ab70 <_strtol_l.part.0+0x60>  // b.any
    ac74:	394004c5 	ldrb	w5, [x6, #1]
    ac78:	d280020a 	mov	x10, #0x10                  	// #16
    ac7c:	910008c6 	add	x6, x6, #0x2
    ac80:	2a0a03e3 	mov	w3, w10
    ac84:	17ffffbe 	b	ab7c <_strtol_l.part.0+0x6c>
    ac88:	aa0003eb 	mov	x11, x0
    ac8c:	17ffffec 	b	ac3c <_strtol_l.part.0+0x12c>
    ac90:	d280010a 	mov	x10, #0x8                   	// #8
    ac94:	2a0a03e3 	mov	w3, w10
    ac98:	17ffffb9 	b	ab7c <_strtol_l.part.0+0x6c>
    ac9c:	d503201f 	nop

000000000000aca0 <_strtol_r>:
    aca0:	7100907f 	cmp	w3, #0x24
    aca4:	7a419864 	ccmp	w3, #0x1, #0x4, ls  // ls = plast
    aca8:	54000040 	b.eq	acb0 <_strtol_r+0x10>  // b.none
    acac:	17ffff99 	b	ab10 <_strtol_l.part.0>
    acb0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    acb4:	910003fd 	mov	x29, sp
    acb8:	9400020a 	bl	b4e0 <__errno>
    acbc:	528002c1 	mov	w1, #0x16                  	// #22
    acc0:	b9000001 	str	w1, [x0]
    acc4:	d2800000 	mov	x0, #0x0                   	// #0
    acc8:	a8c17bfd 	ldp	x29, x30, [sp], #16
    accc:	d65f03c0 	ret

000000000000acd0 <strtol_l>:
    acd0:	7100905f 	cmp	w2, #0x24
    acd4:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    acd8:	540000e0 	b.eq	acf4 <strtol_l+0x24>  // b.none
    acdc:	d0000004 	adrp	x4, c000 <__func__.0+0x28>
    ace0:	2a0203e3 	mov	w3, w2
    ace4:	aa0103e2 	mov	x2, x1
    ace8:	aa0003e1 	mov	x1, x0
    acec:	f9443880 	ldr	x0, [x4, #2160]
    acf0:	17ffff88 	b	ab10 <_strtol_l.part.0>
    acf4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    acf8:	910003fd 	mov	x29, sp
    acfc:	940001f9 	bl	b4e0 <__errno>
    ad00:	528002c1 	mov	w1, #0x16                  	// #22
    ad04:	b9000001 	str	w1, [x0]
    ad08:	d2800000 	mov	x0, #0x0                   	// #0
    ad0c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ad10:	d65f03c0 	ret
    ad14:	d503201f 	nop
    ad18:	d503201f 	nop
    ad1c:	d503201f 	nop

000000000000ad20 <strtol>:
    ad20:	7100905f 	cmp	w2, #0x24
    ad24:	7a419844 	ccmp	w2, #0x1, #0x4, ls  // ls = plast
    ad28:	540000e0 	b.eq	ad44 <strtol+0x24>  // b.none
    ad2c:	d0000004 	adrp	x4, c000 <__func__.0+0x28>
    ad30:	2a0203e3 	mov	w3, w2
    ad34:	aa0103e2 	mov	x2, x1
    ad38:	aa0003e1 	mov	x1, x0
    ad3c:	f9443880 	ldr	x0, [x4, #2160]
    ad40:	17ffff74 	b	ab10 <_strtol_l.part.0>
    ad44:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ad48:	910003fd 	mov	x29, sp
    ad4c:	940001e5 	bl	b4e0 <__errno>
    ad50:	528002c1 	mov	w1, #0x16                  	// #22
    ad54:	b9000001 	str	w1, [x0]
    ad58:	d2800000 	mov	x0, #0x0                   	// #0
    ad5c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ad60:	d65f03c0 	ret
    ad64:	d503201f 	nop
    ad68:	d503201f 	nop
    ad6c:	d503201f 	nop

000000000000ad70 <__swbuf_r>:
    ad70:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    ad74:	910003fd 	mov	x29, sp
    ad78:	a90153f3 	stp	x19, x20, [sp, #16]
    ad7c:	2a0103f4 	mov	w20, w1
    ad80:	aa0203f3 	mov	x19, x2
    ad84:	a9025bf5 	stp	x21, x22, [sp, #32]
    ad88:	aa0003f5 	mov	x21, x0
    ad8c:	b4000060 	cbz	x0, ad98 <__swbuf_r+0x28>
    ad90:	b9405001 	ldr	w1, [x0, #80]
    ad94:	340007e1 	cbz	w1, ae90 <__swbuf_r+0x120>
    ad98:	79c02260 	ldrsh	w0, [x19, #16]
    ad9c:	b9402a61 	ldr	w1, [x19, #40]
    ada0:	b9000e61 	str	w1, [x19, #12]
    ada4:	12003c02 	and	w2, w0, #0xffff
    ada8:	361803e0 	tbz	w0, #3, ae24 <__swbuf_r+0xb4>
    adac:	f9400e61 	ldr	x1, [x19, #24]
    adb0:	b40003a1 	cbz	x1, ae24 <__swbuf_r+0xb4>
    adb4:	12001e96 	and	w22, w20, #0xff
    adb8:	12001e94 	and	w20, w20, #0xff
    adbc:	36680482 	tbz	w2, #13, ae4c <__swbuf_r+0xdc>
    adc0:	f9400260 	ldr	x0, [x19]
    adc4:	b9402262 	ldr	w2, [x19, #32]
    adc8:	cb010001 	sub	x1, x0, x1
    adcc:	6b01005f 	cmp	w2, w1
    add0:	5400052d 	b.le	ae74 <__swbuf_r+0x104>
    add4:	11000421 	add	w1, w1, #0x1
    add8:	b9400e62 	ldr	w2, [x19, #12]
    addc:	91000403 	add	x3, x0, #0x1
    ade0:	f9000263 	str	x3, [x19]
    ade4:	51000442 	sub	w2, w2, #0x1
    ade8:	b9000e62 	str	w2, [x19, #12]
    adec:	39000016 	strb	w22, [x0]
    adf0:	b9402260 	ldr	w0, [x19, #32]
    adf4:	6b01001f 	cmp	w0, w1
    adf8:	54000500 	b.eq	ae98 <__swbuf_r+0x128>  // b.none
    adfc:	71002a9f 	cmp	w20, #0xa
    ae00:	79402260 	ldrh	w0, [x19, #16]
    ae04:	1a9f17e1 	cset	w1, eq  // eq = none
    ae08:	6a00003f 	tst	w1, w0
    ae0c:	54000461 	b.ne	ae98 <__swbuf_r+0x128>  // b.any
    ae10:	2a1403e0 	mov	w0, w20
    ae14:	a94153f3 	ldp	x19, x20, [sp, #16]
    ae18:	a9425bf5 	ldp	x21, x22, [sp, #32]
    ae1c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    ae20:	d65f03c0 	ret
    ae24:	aa1303e1 	mov	x1, x19
    ae28:	aa1503e0 	mov	x0, x21
    ae2c:	97ffed8d 	bl	6460 <__swsetup_r>
    ae30:	350003c0 	cbnz	w0, aea8 <__swbuf_r+0x138>
    ae34:	79c02260 	ldrsh	w0, [x19, #16]
    ae38:	12001e96 	and	w22, w20, #0xff
    ae3c:	12001e94 	and	w20, w20, #0xff
    ae40:	12003c02 	and	w2, w0, #0xffff
    ae44:	f9400e61 	ldr	x1, [x19, #24]
    ae48:	376ffbc2 	tbnz	w2, #13, adc0 <__swbuf_r+0x50>
    ae4c:	b940ae62 	ldr	w2, [x19, #172]
    ae50:	32130000 	orr	w0, w0, #0x2000
    ae54:	79002260 	strh	w0, [x19, #16]
    ae58:	12127840 	and	w0, w2, #0xffffdfff
    ae5c:	b900ae60 	str	w0, [x19, #172]
    ae60:	f9400260 	ldr	x0, [x19]
    ae64:	b9402262 	ldr	w2, [x19, #32]
    ae68:	cb010001 	sub	x1, x0, x1
    ae6c:	6b01005f 	cmp	w2, w1
    ae70:	54fffb2c 	b.gt	add4 <__swbuf_r+0x64>
    ae74:	aa1303e1 	mov	x1, x19
    ae78:	aa1503e0 	mov	x0, x21
    ae7c:	97ffee89 	bl	68a0 <_fflush_r>
    ae80:	35000140 	cbnz	w0, aea8 <__swbuf_r+0x138>
    ae84:	52800021 	mov	w1, #0x1                   	// #1
    ae88:	f9400260 	ldr	x0, [x19]
    ae8c:	17ffffd3 	b	add8 <__swbuf_r+0x68>
    ae90:	97ffef84 	bl	6ca0 <__sinit>
    ae94:	17ffffc1 	b	ad98 <__swbuf_r+0x28>
    ae98:	aa1303e1 	mov	x1, x19
    ae9c:	aa1503e0 	mov	x0, x21
    aea0:	97ffee80 	bl	68a0 <_fflush_r>
    aea4:	34fffb60 	cbz	w0, ae10 <__swbuf_r+0xa0>
    aea8:	12800014 	mov	w20, #0xffffffff            	// #-1
    aeac:	17ffffd9 	b	ae10 <__swbuf_r+0xa0>

000000000000aeb0 <__swbuf>:
    aeb0:	d0000003 	adrp	x3, c000 <__func__.0+0x28>
    aeb4:	aa0103e2 	mov	x2, x1
    aeb8:	2a0003e1 	mov	w1, w0
    aebc:	f9443860 	ldr	x0, [x3, #2160]
    aec0:	17ffffac 	b	ad70 <__swbuf_r>
    aec4:	d503201f 	nop
    aec8:	d503201f 	nop
    aecc:	d503201f 	nop

000000000000aed0 <_wcsnrtombs_l>:
    aed0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
    aed4:	f10000bf 	cmp	x5, #0x0
    aed8:	910003fd 	mov	x29, sp
    aedc:	a90153f3 	stp	x19, x20, [sp, #16]
    aee0:	aa0003f3 	mov	x19, x0
    aee4:	91057000 	add	x0, x0, #0x15c
    aee8:	a9025bf5 	stp	x21, x22, [sp, #32]
    aeec:	aa0103f4 	mov	x20, x1
    aef0:	aa0203f5 	mov	x21, x2
    aef4:	a90363f7 	stp	x23, x24, [sp, #48]
    aef8:	aa0603f6 	mov	x22, x6
    aefc:	9a850017 	csel	x23, x0, x5, eq  // eq = none
    af00:	a9046bf9 	stp	x25, x26, [sp, #64]
    af04:	a90573fb 	stp	x27, x28, [sp, #80]
    af08:	f940005c 	ldr	x28, [x2]
    af0c:	b4000901 	cbz	x1, b02c <_wcsnrtombs_l+0x15c>
    af10:	aa0403fa 	mov	x26, x4
    af14:	b4000a84 	cbz	x4, b064 <_wcsnrtombs_l+0x194>
    af18:	d1000478 	sub	x24, x3, #0x1
    af1c:	b4000a43 	cbz	x3, b064 <_wcsnrtombs_l+0x194>
    af20:	d280001b 	mov	x27, #0x0                   	// #0
    af24:	f90037f4 	str	x20, [sp, #104]
    af28:	1400000a 	b	af50 <_wcsnrtombs_l+0x80>
    af2c:	b50003d4 	cbnz	x20, afa4 <_wcsnrtombs_l+0xd4>
    af30:	b8404780 	ldr	w0, [x28], #4
    af34:	34000640 	cbz	w0, affc <_wcsnrtombs_l+0x12c>
    af38:	eb1a011f 	cmp	x8, x26
    af3c:	54000982 	b.cs	b06c <_wcsnrtombs_l+0x19c>  // b.hs, b.nlast
    af40:	d1000718 	sub	x24, x24, #0x1
    af44:	aa0803fb 	mov	x27, x8
    af48:	b100071f 	cmn	x24, #0x1
    af4c:	540001c0 	b.eq	af84 <_wcsnrtombs_l+0xb4>  // b.none
    af50:	b9400382 	ldr	w2, [x28]
    af54:	aa1703e3 	mov	x3, x23
    af58:	f94072c4 	ldr	x4, [x22, #224]
    af5c:	9101c3e1 	add	x1, sp, #0x70
    af60:	aa1303e0 	mov	x0, x19
    af64:	f94002f9 	ldr	x25, [x23]
    af68:	d63f0080 	blr	x4
    af6c:	3100041f 	cmn	w0, #0x1
    af70:	54000620 	b.eq	b034 <_wcsnrtombs_l+0x164>  // b.none
    af74:	8b20c368 	add	x8, x27, w0, sxtw
    af78:	eb1a011f 	cmp	x8, x26
    af7c:	54fffd89 	b.ls	af2c <_wcsnrtombs_l+0x5c>  // b.plast
    af80:	f90002f9 	str	x25, [x23]
    af84:	aa1b03e0 	mov	x0, x27
    af88:	a94153f3 	ldp	x19, x20, [sp, #16]
    af8c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    af90:	a94363f7 	ldp	x23, x24, [sp, #48]
    af94:	a9446bf9 	ldp	x25, x26, [sp, #64]
    af98:	a94573fb 	ldp	x27, x28, [sp, #80]
    af9c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    afa0:	d65f03c0 	ret
    afa4:	7100001f 	cmp	w0, #0x0
    afa8:	5400020d 	b.le	afe8 <_wcsnrtombs_l+0x118>
    afac:	f94037e1 	ldr	x1, [sp, #104]
    afb0:	11000402 	add	w2, w0, #0x1
    afb4:	d2800027 	mov	x7, #0x1                   	// #1
    afb8:	d1000421 	sub	x1, x1, #0x1
    afbc:	d503201f 	nop
    afc0:	9101c3e3 	add	x3, sp, #0x70
    afc4:	8b070069 	add	x9, x3, x7
    afc8:	385ff129 	ldurb	w9, [x9, #-1]
    afcc:	38276829 	strb	w9, [x1, x7]
    afd0:	910004e7 	add	x7, x7, #0x1
    afd4:	eb0200ff 	cmp	x7, x2
    afd8:	54ffff41 	b.ne	afc0 <_wcsnrtombs_l+0xf0>  // b.any
    afdc:	f94037e1 	ldr	x1, [sp, #104]
    afe0:	8b204020 	add	x0, x1, w0, uxtw
    afe4:	f90037e0 	str	x0, [sp, #104]
    afe8:	f94002a0 	ldr	x0, [x21]
    afec:	91001000 	add	x0, x0, #0x4
    aff0:	f90002a0 	str	x0, [x21]
    aff4:	b8404780 	ldr	w0, [x28], #4
    aff8:	35fffa00 	cbnz	w0, af38 <_wcsnrtombs_l+0x68>
    affc:	b4000054 	cbz	x20, b004 <_wcsnrtombs_l+0x134>
    b000:	f90002bf 	str	xzr, [x21]
    b004:	b90002ff 	str	wzr, [x23]
    b008:	d100051b 	sub	x27, x8, #0x1
    b00c:	aa1b03e0 	mov	x0, x27
    b010:	a94153f3 	ldp	x19, x20, [sp, #16]
    b014:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b018:	a94363f7 	ldp	x23, x24, [sp, #48]
    b01c:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b020:	a94573fb 	ldp	x27, x28, [sp, #80]
    b024:	a8c87bfd 	ldp	x29, x30, [sp], #128
    b028:	d65f03c0 	ret
    b02c:	9280001a 	mov	x26, #0xffffffffffffffff    	// #-1
    b030:	17ffffba 	b	af18 <_wcsnrtombs_l+0x48>
    b034:	52801140 	mov	w0, #0x8a                  	// #138
    b038:	b9000260 	str	w0, [x19]
    b03c:	b90002ff 	str	wzr, [x23]
    b040:	9280001b 	mov	x27, #0xffffffffffffffff    	// #-1
    b044:	aa1b03e0 	mov	x0, x27
    b048:	a94153f3 	ldp	x19, x20, [sp, #16]
    b04c:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b050:	a94363f7 	ldp	x23, x24, [sp, #48]
    b054:	a9446bf9 	ldp	x25, x26, [sp, #64]
    b058:	a94573fb 	ldp	x27, x28, [sp, #80]
    b05c:	a8c87bfd 	ldp	x29, x30, [sp], #128
    b060:	d65f03c0 	ret
    b064:	d280001b 	mov	x27, #0x0                   	// #0
    b068:	17ffffc7 	b	af84 <_wcsnrtombs_l+0xb4>
    b06c:	aa0803fb 	mov	x27, x8
    b070:	17ffffc5 	b	af84 <_wcsnrtombs_l+0xb4>
    b074:	d503201f 	nop
    b078:	d503201f 	nop
    b07c:	d503201f 	nop

000000000000b080 <_wcsnrtombs_r>:
    b080:	b0000000 	adrp	x0, c000 <__func__.0+0x28>
    b084:	b0000006 	adrp	x6, c000 <__func__.0+0x28>
    b088:	913f80c6 	add	x6, x6, #0xfe0
    b08c:	f9443800 	ldr	x0, [x0, #2160]
    b090:	17ffff90 	b	aed0 <_wcsnrtombs_l>
    b094:	d503201f 	nop
    b098:	d503201f 	nop
    b09c:	d503201f 	nop

000000000000b0a0 <wcsnrtombs>:
    b0a0:	b0000006 	adrp	x6, c000 <__func__.0+0x28>
    b0a4:	aa0003e8 	mov	x8, x0
    b0a8:	aa0103e7 	mov	x7, x1
    b0ac:	aa0203e5 	mov	x5, x2
    b0b0:	f94438c0 	ldr	x0, [x6, #2160]
    b0b4:	aa0303e6 	mov	x6, x3
    b0b8:	aa0803e1 	mov	x1, x8
    b0bc:	aa0503e3 	mov	x3, x5
    b0c0:	aa0703e2 	mov	x2, x7
    b0c4:	aa0403e5 	mov	x5, x4
    b0c8:	aa0603e4 	mov	x4, x6
    b0cc:	b0000006 	adrp	x6, c000 <__func__.0+0x28>
    b0d0:	913f80c6 	add	x6, x6, #0xfe0
    b0d4:	17ffff7f 	b	aed0 <_wcsnrtombs_l>
    b0d8:	d503201f 	nop
    b0dc:	d503201f 	nop

000000000000b0e0 <_wctomb_r>:
    b0e0:	d0000004 	adrp	x4, d000 <__global_locale+0x20>
    b0e4:	f9406084 	ldr	x4, [x4, #192]
    b0e8:	aa0403f0 	mov	x16, x4
    b0ec:	d61f0200 	br	x16

000000000000b0f0 <__ascii_wctomb>:
    b0f0:	aa0003e3 	mov	x3, x0
    b0f4:	b4000141 	cbz	x1, b11c <__ascii_wctomb+0x2c>
    b0f8:	7103fc5f 	cmp	w2, #0xff
    b0fc:	54000088 	b.hi	b10c <__ascii_wctomb+0x1c>  // b.pmore
    b100:	52800020 	mov	w0, #0x1                   	// #1
    b104:	39000022 	strb	w2, [x1]
    b108:	d65f03c0 	ret
    b10c:	52801141 	mov	w1, #0x8a                  	// #138
    b110:	12800000 	mov	w0, #0xffffffff            	// #-1
    b114:	b9000061 	str	w1, [x3]
    b118:	d65f03c0 	ret
    b11c:	52800000 	mov	w0, #0x0                   	// #0
    b120:	d65f03c0 	ret
    b124:	d503201f 	nop
    b128:	d503201f 	nop
    b12c:	d503201f 	nop

000000000000b130 <__utf8_wctomb>:
    b130:	aa0003e3 	mov	x3, x0
    b134:	b40004e1 	cbz	x1, b1d0 <__utf8_wctomb+0xa0>
    b138:	7101fc5f 	cmp	w2, #0x7f
    b13c:	54000349 	b.ls	b1a4 <__utf8_wctomb+0x74>  // b.plast
    b140:	51020040 	sub	w0, w2, #0x80
    b144:	711dfc1f 	cmp	w0, #0x77f
    b148:	54000349 	b.ls	b1b0 <__utf8_wctomb+0x80>  // b.plast
    b14c:	51200044 	sub	w4, w2, #0x800
    b150:	529effe0 	mov	w0, #0xf7ff                	// #63487
    b154:	6b00009f 	cmp	w4, w0
    b158:	54000409 	b.ls	b1d8 <__utf8_wctomb+0xa8>  // b.plast
    b15c:	51404044 	sub	w4, w2, #0x10, lsl #12
    b160:	12bffe00 	mov	w0, #0xfffff               	// #1048575
    b164:	6b00009f 	cmp	w4, w0
    b168:	540004e8 	b.hi	b204 <__utf8_wctomb+0xd4>  // b.pmore
    b16c:	53127c45 	lsr	w5, w2, #18
    b170:	d34c4444 	ubfx	x4, x2, #12, #6
    b174:	d3462c43 	ubfx	x3, x2, #6, #6
    b178:	12001442 	and	w2, w2, #0x3f
    b17c:	321c6ca5 	orr	w5, w5, #0xfffffff0
    b180:	32196084 	orr	w4, w4, #0xffffff80
    b184:	32196063 	orr	w3, w3, #0xffffff80
    b188:	32196042 	orr	w2, w2, #0xffffff80
    b18c:	52800080 	mov	w0, #0x4                   	// #4
    b190:	39000025 	strb	w5, [x1]
    b194:	39000424 	strb	w4, [x1, #1]
    b198:	39000823 	strb	w3, [x1, #2]
    b19c:	39000c22 	strb	w2, [x1, #3]
    b1a0:	d65f03c0 	ret
    b1a4:	52800020 	mov	w0, #0x1                   	// #1
    b1a8:	39000022 	strb	w2, [x1]
    b1ac:	d65f03c0 	ret
    b1b0:	53067c43 	lsr	w3, w2, #6
    b1b4:	12001442 	and	w2, w2, #0x3f
    b1b8:	321a6463 	orr	w3, w3, #0xffffffc0
    b1bc:	32196042 	orr	w2, w2, #0xffffff80
    b1c0:	52800040 	mov	w0, #0x2                   	// #2
    b1c4:	39000023 	strb	w3, [x1]
    b1c8:	39000422 	strb	w2, [x1, #1]
    b1cc:	d65f03c0 	ret
    b1d0:	52800000 	mov	w0, #0x0                   	// #0
    b1d4:	d65f03c0 	ret
    b1d8:	530c7c44 	lsr	w4, w2, #12
    b1dc:	d3462c43 	ubfx	x3, x2, #6, #6
    b1e0:	12001442 	and	w2, w2, #0x3f
    b1e4:	321b6884 	orr	w4, w4, #0xffffffe0
    b1e8:	32196063 	orr	w3, w3, #0xffffff80
    b1ec:	32196042 	orr	w2, w2, #0xffffff80
    b1f0:	52800060 	mov	w0, #0x3                   	// #3
    b1f4:	39000024 	strb	w4, [x1]
    b1f8:	39000423 	strb	w3, [x1, #1]
    b1fc:	39000822 	strb	w2, [x1, #2]
    b200:	d65f03c0 	ret
    b204:	52801141 	mov	w1, #0x8a                  	// #138
    b208:	12800000 	mov	w0, #0xffffffff            	// #-1
    b20c:	b9000061 	str	w1, [x3]
    b210:	d65f03c0 	ret
    b214:	d503201f 	nop
    b218:	d503201f 	nop
    b21c:	d503201f 	nop

000000000000b220 <__sjis_wctomb>:
    b220:	aa0003e5 	mov	x5, x0
    b224:	12001c44 	and	w4, w2, #0xff
    b228:	d3483c43 	ubfx	x3, x2, #8, #8
    b22c:	b4000301 	cbz	x1, b28c <__sjis_wctomb+0x6c>
    b230:	34000283 	cbz	w3, b280 <__sjis_wctomb+0x60>
    b234:	1101fc60 	add	w0, w3, #0x7f
    b238:	11008063 	add	w3, w3, #0x20
    b23c:	12001c00 	and	w0, w0, #0xff
    b240:	12001c63 	and	w3, w3, #0xff
    b244:	7100781f 	cmp	w0, #0x1e
    b248:	7a4f8860 	ccmp	w3, #0xf, #0x0, hi  // hi = pmore
    b24c:	54000248 	b.hi	b294 <__sjis_wctomb+0x74>  // b.pmore
    b250:	51010080 	sub	w0, w4, #0x40
    b254:	51020084 	sub	w4, w4, #0x80
    b258:	12001c00 	and	w0, w0, #0xff
    b25c:	12001c84 	and	w4, w4, #0xff
    b260:	7100f81f 	cmp	w0, #0x3e
    b264:	52800f80 	mov	w0, #0x7c                  	// #124
    b268:	7a408080 	ccmp	w4, w0, #0x0, hi  // hi = pmore
    b26c:	54000148 	b.hi	b294 <__sjis_wctomb+0x74>  // b.pmore
    b270:	5ac00442 	rev16	w2, w2
    b274:	52800040 	mov	w0, #0x2                   	// #2
    b278:	79000022 	strh	w2, [x1]
    b27c:	d65f03c0 	ret
    b280:	52800020 	mov	w0, #0x1                   	// #1
    b284:	39000024 	strb	w4, [x1]
    b288:	d65f03c0 	ret
    b28c:	52800000 	mov	w0, #0x0                   	// #0
    b290:	d65f03c0 	ret
    b294:	52801141 	mov	w1, #0x8a                  	// #138
    b298:	12800000 	mov	w0, #0xffffffff            	// #-1
    b29c:	b90000a1 	str	w1, [x5]
    b2a0:	d65f03c0 	ret
    b2a4:	d503201f 	nop
    b2a8:	d503201f 	nop
    b2ac:	d503201f 	nop

000000000000b2b0 <__eucjp_wctomb>:
    b2b0:	aa0003e4 	mov	x4, x0
    b2b4:	12001c43 	and	w3, w2, #0xff
    b2b8:	d3483c45 	ubfx	x5, x2, #8, #8
    b2bc:	b4000421 	cbz	x1, b340 <__eucjp_wctomb+0x90>
    b2c0:	34000185 	cbz	w5, b2f0 <__eucjp_wctomb+0x40>
    b2c4:	11017ca0 	add	w0, w5, #0x5f
    b2c8:	1101c8a6 	add	w6, w5, #0x72
    b2cc:	12001c00 	and	w0, w0, #0xff
    b2d0:	12001cc6 	and	w6, w6, #0xff
    b2d4:	7101741f 	cmp	w0, #0x5d
    b2d8:	7a4188c0 	ccmp	w6, #0x1, #0x0, hi  // hi = pmore
    b2dc:	54000109 	b.ls	b2fc <__eucjp_wctomb+0x4c>  // b.plast
    b2e0:	52801141 	mov	w1, #0x8a                  	// #138
    b2e4:	12800000 	mov	w0, #0xffffffff            	// #-1
    b2e8:	b9000081 	str	w1, [x4]
    b2ec:	d65f03c0 	ret
    b2f0:	52800020 	mov	w0, #0x1                   	// #1
    b2f4:	39000023 	strb	w3, [x1]
    b2f8:	d65f03c0 	ret
    b2fc:	11017c66 	add	w6, w3, #0x5f
    b300:	12001cc6 	and	w6, w6, #0xff
    b304:	710174df 	cmp	w6, #0x5d
    b308:	54000209 	b.ls	b348 <__eucjp_wctomb+0x98>  // b.plast
    b30c:	7101741f 	cmp	w0, #0x5d
    b310:	54fffe88 	b.hi	b2e0 <__eucjp_wctomb+0x30>  // b.pmore
    b314:	32190063 	orr	w3, w3, #0x80
    b318:	11017c60 	add	w0, w3, #0x5f
    b31c:	12001c00 	and	w0, w0, #0xff
    b320:	7101741f 	cmp	w0, #0x5d
    b324:	54fffde8 	b.hi	b2e0 <__eucjp_wctomb+0x30>  // b.pmore
    b328:	12800e02 	mov	w2, #0xffffff8f            	// #-113
    b32c:	52800060 	mov	w0, #0x3                   	// #3
    b330:	39000022 	strb	w2, [x1]
    b334:	39000425 	strb	w5, [x1, #1]
    b338:	39000823 	strb	w3, [x1, #2]
    b33c:	d65f03c0 	ret
    b340:	52800000 	mov	w0, #0x0                   	// #0
    b344:	d65f03c0 	ret
    b348:	5ac00442 	rev16	w2, w2
    b34c:	52800040 	mov	w0, #0x2                   	// #2
    b350:	79000022 	strh	w2, [x1]
    b354:	d65f03c0 	ret
    b358:	d503201f 	nop
    b35c:	d503201f 	nop

000000000000b360 <__jis_wctomb>:
    b360:	aa0003e6 	mov	x6, x0
    b364:	12001c45 	and	w5, w2, #0xff
    b368:	d3483c44 	ubfx	x4, x2, #8, #8
    b36c:	b40004c1 	cbz	x1, b404 <__jis_wctomb+0xa4>
    b370:	34000304 	cbz	w4, b3d0 <__jis_wctomb+0x70>
    b374:	51008484 	sub	w4, w4, #0x21
    b378:	12001c84 	and	w4, w4, #0xff
    b37c:	7101749f 	cmp	w4, #0x5d
    b380:	54000468 	b.hi	b40c <__jis_wctomb+0xac>  // b.pmore
    b384:	510084a5 	sub	w5, w5, #0x21
    b388:	12001ca5 	and	w5, w5, #0xff
    b38c:	710174bf 	cmp	w5, #0x5d
    b390:	540003e8 	b.hi	b40c <__jis_wctomb+0xac>  // b.pmore
    b394:	b9400064 	ldr	w4, [x3]
    b398:	52800040 	mov	w0, #0x2                   	// #2
    b39c:	35000144 	cbnz	w4, b3c4 <__jis_wctomb+0x64>
    b3a0:	aa0103e4 	mov	x4, x1
    b3a4:	52800020 	mov	w0, #0x1                   	// #1
    b3a8:	b9000060 	str	w0, [x3]
    b3ac:	52848365 	mov	w5, #0x241b                	// #9243
    b3b0:	52800843 	mov	w3, #0x42                  	// #66
    b3b4:	528000a0 	mov	w0, #0x5                   	// #5
    b3b8:	78003485 	strh	w5, [x4], #3
    b3bc:	39000823 	strb	w3, [x1, #2]
    b3c0:	aa0403e1 	mov	x1, x4
    b3c4:	5ac00442 	rev16	w2, w2
    b3c8:	79000022 	strh	w2, [x1]
    b3cc:	d65f03c0 	ret
    b3d0:	b9400062 	ldr	w2, [x3]
    b3d4:	52800020 	mov	w0, #0x1                   	// #1
    b3d8:	34000122 	cbz	w2, b3fc <__jis_wctomb+0x9c>
    b3dc:	aa0103e2 	mov	x2, x1
    b3e0:	b900007f 	str	wzr, [x3]
    b3e4:	52850364 	mov	w4, #0x281b                	// #10267
    b3e8:	52800843 	mov	w3, #0x42                  	// #66
    b3ec:	52800080 	mov	w0, #0x4                   	// #4
    b3f0:	78003444 	strh	w4, [x2], #3
    b3f4:	39000823 	strb	w3, [x1, #2]
    b3f8:	aa0203e1 	mov	x1, x2
    b3fc:	39000025 	strb	w5, [x1]
    b400:	d65f03c0 	ret
    b404:	52800020 	mov	w0, #0x1                   	// #1
    b408:	d65f03c0 	ret
    b40c:	52801141 	mov	w1, #0x8a                  	// #138
    b410:	12800000 	mov	w0, #0xffffffff            	// #-1
    b414:	b90000c1 	str	w1, [x6]
    b418:	d65f03c0 	ret
    b41c:	d503201f 	nop

000000000000b420 <_write_r>:
    b420:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b424:	910003fd 	mov	x29, sp
    b428:	a90153f3 	stp	x19, x20, [sp, #16]
    b42c:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b430:	aa0003f3 	mov	x19, x0
    b434:	2a0103e0 	mov	w0, w1
    b438:	aa0203e1 	mov	x1, x2
    b43c:	b90dba9f 	str	wzr, [x20, #3512]
    b440:	aa0303e2 	mov	x2, x3
    b444:	97ffe22b 	bl	3cf0 <_write>
    b448:	93407c01 	sxtw	x1, w0
    b44c:	3100041f 	cmn	w0, #0x1
    b450:	540000a0 	b.eq	b464 <_write_r+0x44>  // b.none
    b454:	aa0103e0 	mov	x0, x1
    b458:	a94153f3 	ldp	x19, x20, [sp, #16]
    b45c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b460:	d65f03c0 	ret
    b464:	b94dba80 	ldr	w0, [x20, #3512]
    b468:	34ffff60 	cbz	w0, b454 <_write_r+0x34>
    b46c:	b9000260 	str	w0, [x19]
    b470:	aa0103e0 	mov	x0, x1
    b474:	a94153f3 	ldp	x19, x20, [sp, #16]
    b478:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b47c:	d65f03c0 	ret

000000000000b480 <_close_r>:
    b480:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b484:	910003fd 	mov	x29, sp
    b488:	a90153f3 	stp	x19, x20, [sp, #16]
    b48c:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b490:	aa0003f3 	mov	x19, x0
    b494:	b90dba9f 	str	wzr, [x20, #3512]
    b498:	2a0103e0 	mov	w0, w1
    b49c:	97ffe219 	bl	3d00 <_close>
    b4a0:	3100041f 	cmn	w0, #0x1
    b4a4:	54000080 	b.eq	b4b4 <_close_r+0x34>  // b.none
    b4a8:	a94153f3 	ldp	x19, x20, [sp, #16]
    b4ac:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b4b0:	d65f03c0 	ret
    b4b4:	b94dba81 	ldr	w1, [x20, #3512]
    b4b8:	34ffff81 	cbz	w1, b4a8 <_close_r+0x28>
    b4bc:	b9000261 	str	w1, [x19]
    b4c0:	a94153f3 	ldp	x19, x20, [sp, #16]
    b4c4:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b4c8:	d65f03c0 	ret
    b4cc:	d503201f 	nop

000000000000b4d0 <__set_ctype>:
    b4d0:	b0000001 	adrp	x1, c000 <__func__.0+0x28>
    b4d4:	911d2021 	add	x1, x1, #0x748
    b4d8:	f9007c01 	str	x1, [x0, #248]
    b4dc:	d65f03c0 	ret

000000000000b4e0 <__errno>:
    b4e0:	b0000000 	adrp	x0, c000 <__func__.0+0x28>
    b4e4:	f9443800 	ldr	x0, [x0, #2160]
    b4e8:	d65f03c0 	ret
    b4ec:	d503201f 	nop

000000000000b4f0 <_fclose_r.part.0>:
    b4f0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    b4f4:	910003fd 	mov	x29, sp
    b4f8:	a90153f3 	stp	x19, x20, [sp, #16]
    b4fc:	aa0103f3 	mov	x19, x1
    b500:	f90013f5 	str	x21, [sp, #32]
    b504:	aa0003f5 	mov	x21, x0
    b508:	97ffec5a 	bl	6670 <__sflush_r>
    b50c:	2a0003f4 	mov	w20, w0
    b510:	f9402a62 	ldr	x2, [x19, #80]
    b514:	b40000c2 	cbz	x2, b52c <_fclose_r.part.0+0x3c>
    b518:	f9401a61 	ldr	x1, [x19, #48]
    b51c:	aa1503e0 	mov	x0, x21
    b520:	d63f0040 	blr	x2
    b524:	7100001f 	cmp	w0, #0x0
    b528:	5a9fa294 	csinv	w20, w20, wzr, ge  // ge = tcont
    b52c:	79402260 	ldrh	w0, [x19, #16]
    b530:	373802c0 	tbnz	w0, #7, b588 <_fclose_r.part.0+0x98>
    b534:	f9402e61 	ldr	x1, [x19, #88]
    b538:	b40000e1 	cbz	x1, b554 <_fclose_r.part.0+0x64>
    b53c:	9101d260 	add	x0, x19, #0x74
    b540:	eb00003f 	cmp	x1, x0
    b544:	54000060 	b.eq	b550 <_fclose_r.part.0+0x60>  // b.none
    b548:	aa1503e0 	mov	x0, x21
    b54c:	97ffeead 	bl	7000 <_free_r>
    b550:	f9002e7f 	str	xzr, [x19, #88]
    b554:	f9403e61 	ldr	x1, [x19, #120]
    b558:	b4000081 	cbz	x1, b568 <_fclose_r.part.0+0x78>
    b55c:	aa1503e0 	mov	x0, x21
    b560:	97ffeea8 	bl	7000 <_free_r>
    b564:	f9003e7f 	str	xzr, [x19, #120]
    b568:	97ffedd2 	bl	6cb0 <__sfp_lock_acquire>
    b56c:	7900227f 	strh	wzr, [x19, #16]
    b570:	97ffedd4 	bl	6cc0 <__sfp_lock_release>
    b574:	2a1403e0 	mov	w0, w20
    b578:	a94153f3 	ldp	x19, x20, [sp, #16]
    b57c:	f94013f5 	ldr	x21, [sp, #32]
    b580:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b584:	d65f03c0 	ret
    b588:	f9400e61 	ldr	x1, [x19, #24]
    b58c:	aa1503e0 	mov	x0, x21
    b590:	97ffee9c 	bl	7000 <_free_r>
    b594:	17ffffe8 	b	b534 <_fclose_r.part.0+0x44>
    b598:	d503201f 	nop
    b59c:	d503201f 	nop

000000000000b5a0 <_fclose_r>:
    b5a0:	b4000301 	cbz	x1, b600 <_fclose_r+0x60>
    b5a4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    b5a8:	910003fd 	mov	x29, sp
    b5ac:	f9000bf4 	str	x20, [sp, #16]
    b5b0:	aa0003f4 	mov	x20, x0
    b5b4:	b4000060 	cbz	x0, b5c0 <_fclose_r+0x20>
    b5b8:	b9405002 	ldr	w2, [x0, #80]
    b5bc:	34000162 	cbz	w2, b5e8 <_fclose_r+0x48>
    b5c0:	79c02020 	ldrsh	w0, [x1, #16]
    b5c4:	350000a0 	cbnz	w0, b5d8 <_fclose_r+0x38>
    b5c8:	52800000 	mov	w0, #0x0                   	// #0
    b5cc:	f9400bf4 	ldr	x20, [sp, #16]
    b5d0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b5d4:	d65f03c0 	ret
    b5d8:	aa1403e0 	mov	x0, x20
    b5dc:	f9400bf4 	ldr	x20, [sp, #16]
    b5e0:	a8c37bfd 	ldp	x29, x30, [sp], #48
    b5e4:	17ffffc3 	b	b4f0 <_fclose_r.part.0>
    b5e8:	f90017e1 	str	x1, [sp, #40]
    b5ec:	97ffedad 	bl	6ca0 <__sinit>
    b5f0:	f94017e1 	ldr	x1, [sp, #40]
    b5f4:	79c02020 	ldrsh	w0, [x1, #16]
    b5f8:	34fffe80 	cbz	w0, b5c8 <_fclose_r+0x28>
    b5fc:	17fffff7 	b	b5d8 <_fclose_r+0x38>
    b600:	52800000 	mov	w0, #0x0                   	// #0
    b604:	d65f03c0 	ret
    b608:	d503201f 	nop
    b60c:	d503201f 	nop

000000000000b610 <fclose>:
    b610:	b4000340 	cbz	x0, b678 <fclose+0x68>
    b614:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b618:	910003fd 	mov	x29, sp
    b61c:	a90153f3 	stp	x19, x20, [sp, #16]
    b620:	aa0003f3 	mov	x19, x0
    b624:	b0000000 	adrp	x0, c000 <__func__.0+0x28>
    b628:	f9443814 	ldr	x20, [x0, #2160]
    b62c:	b4000074 	cbz	x20, b638 <fclose+0x28>
    b630:	b9405280 	ldr	w0, [x20, #80]
    b634:	34000180 	cbz	w0, b664 <fclose+0x54>
    b638:	79c02260 	ldrsh	w0, [x19, #16]
    b63c:	350000a0 	cbnz	w0, b650 <fclose+0x40>
    b640:	52800000 	mov	w0, #0x0                   	// #0
    b644:	a94153f3 	ldp	x19, x20, [sp, #16]
    b648:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b64c:	d65f03c0 	ret
    b650:	aa1303e1 	mov	x1, x19
    b654:	aa1403e0 	mov	x0, x20
    b658:	a94153f3 	ldp	x19, x20, [sp, #16]
    b65c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b660:	17ffffa4 	b	b4f0 <_fclose_r.part.0>
    b664:	aa1403e0 	mov	x0, x20
    b668:	97ffed8e 	bl	6ca0 <__sinit>
    b66c:	79c02260 	ldrsh	w0, [x19, #16]
    b670:	34fffe80 	cbz	w0, b640 <fclose+0x30>
    b674:	17fffff7 	b	b650 <fclose+0x40>
    b678:	52800000 	mov	w0, #0x0                   	// #0
    b67c:	d65f03c0 	ret

000000000000b680 <_fstat_r>:
    b680:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b684:	910003fd 	mov	x29, sp
    b688:	a90153f3 	stp	x19, x20, [sp, #16]
    b68c:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b690:	aa0003f3 	mov	x19, x0
    b694:	b90dba9f 	str	wzr, [x20, #3512]
    b698:	2a0103e0 	mov	w0, w1
    b69c:	aa0203e1 	mov	x1, x2
    b6a0:	97ffe19c 	bl	3d10 <_fstat>
    b6a4:	3100041f 	cmn	w0, #0x1
    b6a8:	54000080 	b.eq	b6b8 <_fstat_r+0x38>  // b.none
    b6ac:	a94153f3 	ldp	x19, x20, [sp, #16]
    b6b0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b6b4:	d65f03c0 	ret
    b6b8:	b94dba81 	ldr	w1, [x20, #3512]
    b6bc:	34ffff81 	cbz	w1, b6ac <_fstat_r+0x2c>
    b6c0:	b9000261 	str	w1, [x19]
    b6c4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b6c8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b6cc:	d65f03c0 	ret

000000000000b6d0 <_findenv_r>:
    b6d0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
    b6d4:	910003fd 	mov	x29, sp
    b6d8:	a90363f7 	stp	x23, x24, [sp, #48]
    b6dc:	d0000017 	adrp	x23, d000 <__global_locale+0x20>
    b6e0:	aa0103f8 	mov	x24, x1
    b6e4:	a90153f3 	stp	x19, x20, [sp, #16]
    b6e8:	a9025bf5 	stp	x21, x22, [sp, #32]
    b6ec:	aa0203f5 	mov	x21, x2
    b6f0:	aa0003f6 	mov	x22, x0
    b6f4:	9400016b 	bl	bca0 <__env_lock>
    b6f8:	f944d6f4 	ldr	x20, [x23, #2472]
    b6fc:	b40003f4 	cbz	x20, b778 <_findenv_r+0xa8>
    b700:	39400303 	ldrb	w3, [x24]
    b704:	aa1803f3 	mov	x19, x24
    b708:	7100f47f 	cmp	w3, #0x3d
    b70c:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    b710:	540000c0 	b.eq	b728 <_findenv_r+0x58>  // b.none
    b714:	d503201f 	nop
    b718:	38401e63 	ldrb	w3, [x19, #1]!
    b71c:	7100f47f 	cmp	w3, #0x3d
    b720:	7a401864 	ccmp	w3, #0x0, #0x4, ne  // ne = any
    b724:	54ffffa1 	b.ne	b718 <_findenv_r+0x48>  // b.any
    b728:	7100f47f 	cmp	w3, #0x3d
    b72c:	54000260 	b.eq	b778 <_findenv_r+0xa8>  // b.none
    b730:	f9400280 	ldr	x0, [x20]
    b734:	cb180273 	sub	x19, x19, x24
    b738:	b4000200 	cbz	x0, b778 <_findenv_r+0xa8>
    b73c:	93407e73 	sxtw	x19, w19
    b740:	f90023f9 	str	x25, [sp, #64]
    b744:	d503201f 	nop
    b748:	aa1303e2 	mov	x2, x19
    b74c:	aa1803e1 	mov	x1, x24
    b750:	940000e3 	bl	badc <strncmp>
    b754:	350000c0 	cbnz	w0, b76c <_findenv_r+0x9c>
    b758:	f9400280 	ldr	x0, [x20]
    b75c:	8b130019 	add	x25, x0, x19
    b760:	38736800 	ldrb	w0, [x0, x19]
    b764:	7100f41f 	cmp	w0, #0x3d
    b768:	54000180 	b.eq	b798 <_findenv_r+0xc8>  // b.none
    b76c:	f8408e80 	ldr	x0, [x20, #8]!
    b770:	b5fffec0 	cbnz	x0, b748 <_findenv_r+0x78>
    b774:	f94023f9 	ldr	x25, [sp, #64]
    b778:	aa1603e0 	mov	x0, x22
    b77c:	9400014d 	bl	bcb0 <__env_unlock>
    b780:	d2800000 	mov	x0, #0x0                   	// #0
    b784:	a94153f3 	ldp	x19, x20, [sp, #16]
    b788:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b78c:	a94363f7 	ldp	x23, x24, [sp, #48]
    b790:	a8c57bfd 	ldp	x29, x30, [sp], #80
    b794:	d65f03c0 	ret
    b798:	f944d6e1 	ldr	x1, [x23, #2472]
    b79c:	aa1603e0 	mov	x0, x22
    b7a0:	cb010281 	sub	x1, x20, x1
    b7a4:	9343fc21 	asr	x1, x1, #3
    b7a8:	b90002a1 	str	w1, [x21]
    b7ac:	94000141 	bl	bcb0 <__env_unlock>
    b7b0:	91000720 	add	x0, x25, #0x1
    b7b4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b7b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b7bc:	a94363f7 	ldp	x23, x24, [sp, #48]
    b7c0:	f94023f9 	ldr	x25, [sp, #64]
    b7c4:	a8c57bfd 	ldp	x29, x30, [sp], #80
    b7c8:	d65f03c0 	ret
    b7cc:	d503201f 	nop

000000000000b7d0 <_getenv_r>:
    b7d0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b7d4:	910003fd 	mov	x29, sp
    b7d8:	910073e2 	add	x2, sp, #0x1c
    b7dc:	97ffffbd 	bl	b6d0 <_findenv_r>
    b7e0:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b7e4:	d65f03c0 	ret
    b7e8:	d503201f 	nop
    b7ec:	d503201f 	nop

000000000000b7f0 <_isatty_r>:
    b7f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b7f4:	910003fd 	mov	x29, sp
    b7f8:	a90153f3 	stp	x19, x20, [sp, #16]
    b7fc:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b800:	aa0003f3 	mov	x19, x0
    b804:	b90dba9f 	str	wzr, [x20, #3512]
    b808:	2a0103e0 	mov	w0, w1
    b80c:	97ffe145 	bl	3d20 <_isatty>
    b810:	3100041f 	cmn	w0, #0x1
    b814:	54000080 	b.eq	b824 <_isatty_r+0x34>  // b.none
    b818:	a94153f3 	ldp	x19, x20, [sp, #16]
    b81c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b820:	d65f03c0 	ret
    b824:	b94dba81 	ldr	w1, [x20, #3512]
    b828:	34ffff81 	cbz	w1, b818 <_isatty_r+0x28>
    b82c:	b9000261 	str	w1, [x19]
    b830:	a94153f3 	ldp	x19, x20, [sp, #16]
    b834:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b838:	d65f03c0 	ret
    b83c:	d503201f 	nop

000000000000b840 <_lseek_r>:
    b840:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b844:	910003fd 	mov	x29, sp
    b848:	a90153f3 	stp	x19, x20, [sp, #16]
    b84c:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b850:	aa0003f3 	mov	x19, x0
    b854:	b90dba9f 	str	wzr, [x20, #3512]
    b858:	2a0103e0 	mov	w0, w1
    b85c:	aa0203e1 	mov	x1, x2
    b860:	2a0303e2 	mov	w2, w3
    b864:	97ffe133 	bl	3d30 <_lseek>
    b868:	b100041f 	cmn	x0, #0x1
    b86c:	54000080 	b.eq	b87c <_lseek_r+0x3c>  // b.none
    b870:	a94153f3 	ldp	x19, x20, [sp, #16]
    b874:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b878:	d65f03c0 	ret
    b87c:	b94dba81 	ldr	w1, [x20, #3512]
    b880:	34ffff81 	cbz	w1, b870 <_lseek_r+0x30>
    b884:	b9000261 	str	w1, [x19]
    b888:	a94153f3 	ldp	x19, x20, [sp, #16]
    b88c:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b890:	d65f03c0 	ret
    b894:	d503201f 	nop
    b898:	d503201f 	nop
    b89c:	d503201f 	nop

000000000000b8a0 <_read_r>:
    b8a0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    b8a4:	910003fd 	mov	x29, sp
    b8a8:	a90153f3 	stp	x19, x20, [sp, #16]
    b8ac:	d0000014 	adrp	x20, d000 <__global_locale+0x20>
    b8b0:	aa0003f3 	mov	x19, x0
    b8b4:	2a0103e0 	mov	w0, w1
    b8b8:	aa0203e1 	mov	x1, x2
    b8bc:	b90dba9f 	str	wzr, [x20, #3512]
    b8c0:	aa0303e2 	mov	x2, x3
    b8c4:	97ffe11f 	bl	3d40 <_read>
    b8c8:	93407c01 	sxtw	x1, w0
    b8cc:	3100041f 	cmn	w0, #0x1
    b8d0:	540000a0 	b.eq	b8e4 <_read_r+0x44>  // b.none
    b8d4:	aa0103e0 	mov	x0, x1
    b8d8:	a94153f3 	ldp	x19, x20, [sp, #16]
    b8dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b8e0:	d65f03c0 	ret
    b8e4:	b94dba80 	ldr	w0, [x20, #3512]
    b8e8:	34ffff60 	cbz	w0, b8d4 <_read_r+0x34>
    b8ec:	b9000260 	str	w0, [x19]
    b8f0:	aa0103e0 	mov	x0, x1
    b8f4:	a94153f3 	ldp	x19, x20, [sp, #16]
    b8f8:	a8c27bfd 	ldp	x29, x30, [sp], #32
    b8fc:	d65f03c0 	ret

000000000000b900 <cleanup_glue>:
    b900:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
    b904:	910003fd 	mov	x29, sp
    b908:	a9025bf5 	stp	x21, x22, [sp, #32]
    b90c:	f9400035 	ldr	x21, [x1]
    b910:	a90153f3 	stp	x19, x20, [sp, #16]
    b914:	aa0103f3 	mov	x19, x1
    b918:	aa0003f4 	mov	x20, x0
    b91c:	b4000275 	cbz	x21, b968 <cleanup_glue+0x68>
    b920:	f94002b6 	ldr	x22, [x21]
    b924:	b40001d6 	cbz	x22, b95c <cleanup_glue+0x5c>
    b928:	f9001bf7 	str	x23, [sp, #48]
    b92c:	f94002d7 	ldr	x23, [x22]
    b930:	b40000f7 	cbz	x23, b94c <cleanup_glue+0x4c>
    b934:	f94002e1 	ldr	x1, [x23]
    b938:	b4000041 	cbz	x1, b940 <cleanup_glue+0x40>
    b93c:	97fffff1 	bl	b900 <cleanup_glue>
    b940:	aa1703e1 	mov	x1, x23
    b944:	aa1403e0 	mov	x0, x20
    b948:	97ffedae 	bl	7000 <_free_r>
    b94c:	aa1603e1 	mov	x1, x22
    b950:	aa1403e0 	mov	x0, x20
    b954:	97ffedab 	bl	7000 <_free_r>
    b958:	f9401bf7 	ldr	x23, [sp, #48]
    b95c:	aa1503e1 	mov	x1, x21
    b960:	aa1403e0 	mov	x0, x20
    b964:	97ffeda7 	bl	7000 <_free_r>
    b968:	aa1303e1 	mov	x1, x19
    b96c:	aa1403e0 	mov	x0, x20
    b970:	a94153f3 	ldp	x19, x20, [sp, #16]
    b974:	a9425bf5 	ldp	x21, x22, [sp, #32]
    b978:	a8c47bfd 	ldp	x29, x30, [sp], #64
    b97c:	17ffeda1 	b	7000 <_free_r>

000000000000b980 <_reclaim_reent>:
    b980:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
    b984:	b0000001 	adrp	x1, c000 <__func__.0+0x28>
    b988:	910003fd 	mov	x29, sp
    b98c:	a90153f3 	stp	x19, x20, [sp, #16]
    b990:	aa0003f4 	mov	x20, x0
    b994:	f9443820 	ldr	x0, [x1, #2160]
    b998:	eb14001f 	cmp	x0, x20
    b99c:	54000500 	b.eq	ba3c <_reclaim_reent+0xbc>  // b.none
    b9a0:	f9403e81 	ldr	x1, [x20, #120]
    b9a4:	f90013f5 	str	x21, [sp, #32]
    b9a8:	b40001e1 	cbz	x1, b9e4 <_reclaim_reent+0x64>
    b9ac:	d2800015 	mov	x21, #0x0                   	// #0
    b9b0:	f8756833 	ldr	x19, [x1, x21]
    b9b4:	b40000f3 	cbz	x19, b9d0 <_reclaim_reent+0x50>
    b9b8:	aa1303e1 	mov	x1, x19
    b9bc:	aa1403e0 	mov	x0, x20
    b9c0:	f9400273 	ldr	x19, [x19]
    b9c4:	97ffed8f 	bl	7000 <_free_r>
    b9c8:	b5ffff93 	cbnz	x19, b9b8 <_reclaim_reent+0x38>
    b9cc:	f9403e81 	ldr	x1, [x20, #120]
    b9d0:	910022b5 	add	x21, x21, #0x8
    b9d4:	f10802bf 	cmp	x21, #0x200
    b9d8:	54fffec1 	b.ne	b9b0 <_reclaim_reent+0x30>  // b.any
    b9dc:	aa1403e0 	mov	x0, x20
    b9e0:	97ffed88 	bl	7000 <_free_r>
    b9e4:	f9403281 	ldr	x1, [x20, #96]
    b9e8:	b4000061 	cbz	x1, b9f4 <_reclaim_reent+0x74>
    b9ec:	aa1403e0 	mov	x0, x20
    b9f0:	97ffed84 	bl	7000 <_free_r>
    b9f4:	f940fe93 	ldr	x19, [x20, #504]
    b9f8:	b4000153 	cbz	x19, ba20 <_reclaim_reent+0xa0>
    b9fc:	91080295 	add	x21, x20, #0x200
    ba00:	eb15027f 	cmp	x19, x21
    ba04:	540000e0 	b.eq	ba20 <_reclaim_reent+0xa0>  // b.none
    ba08:	aa1303e1 	mov	x1, x19
    ba0c:	aa1403e0 	mov	x0, x20
    ba10:	f9400273 	ldr	x19, [x19]
    ba14:	97ffed7b 	bl	7000 <_free_r>
    ba18:	eb1302bf 	cmp	x21, x19
    ba1c:	54ffff61 	b.ne	ba08 <_reclaim_reent+0x88>  // b.any
    ba20:	f9404681 	ldr	x1, [x20, #136]
    ba24:	b4000061 	cbz	x1, ba30 <_reclaim_reent+0xb0>
    ba28:	aa1403e0 	mov	x0, x20
    ba2c:	97ffed75 	bl	7000 <_free_r>
    ba30:	b9405280 	ldr	w0, [x20, #80]
    ba34:	350000a0 	cbnz	w0, ba48 <_reclaim_reent+0xc8>
    ba38:	f94013f5 	ldr	x21, [sp, #32]
    ba3c:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba40:	a8c37bfd 	ldp	x29, x30, [sp], #48
    ba44:	d65f03c0 	ret
    ba48:	f9402e81 	ldr	x1, [x20, #88]
    ba4c:	aa1403e0 	mov	x0, x20
    ba50:	d63f0020 	blr	x1
    ba54:	f9429293 	ldr	x19, [x20, #1312]
    ba58:	b4ffff13 	cbz	x19, ba38 <_reclaim_reent+0xb8>
    ba5c:	f9400261 	ldr	x1, [x19]
    ba60:	b4000061 	cbz	x1, ba6c <_reclaim_reent+0xec>
    ba64:	aa1403e0 	mov	x0, x20
    ba68:	97ffffa6 	bl	b900 <cleanup_glue>
    ba6c:	aa1303e1 	mov	x1, x19
    ba70:	aa1403e0 	mov	x0, x20
    ba74:	a94153f3 	ldp	x19, x20, [sp, #16]
    ba78:	f94013f5 	ldr	x21, [sp, #32]
    ba7c:	a8c37bfd 	ldp	x29, x30, [sp], #48
    ba80:	17ffed60 	b	7000 <_free_r>
    ba84:	d503201f 	nop
    ba88:	d503201f 	nop
    ba8c:	d503201f 	nop
    ba90:	d503201f 	nop
    ba94:	d503201f 	nop
    ba98:	d503201f 	nop
    ba9c:	d503201f 	nop
    baa0:	d503201f 	nop
    baa4:	d503201f 	nop
    baa8:	d503201f 	nop
    baac:	d503201f 	nop
    bab0:	d503201f 	nop
    bab4:	d503201f 	nop
    bab8:	d503201f 	nop
    babc:	d503201f 	nop
    bac0:	d503201f 	nop
    bac4:	d503201f 	nop
    bac8:	d503201f 	nop
    bacc:	d503201f 	nop
    bad0:	d503201f 	nop
    bad4:	d503201f 	nop
    bad8:	d503201f 	nop

000000000000badc <strncmp>:
    badc:	b4000d82 	cbz	x2, bc8c <strncmp+0x1b0>
    bae0:	ca010008 	eor	x8, x0, x1
    bae4:	b200c3eb 	mov	x11, #0x101010101010101     	// #72340172838076673
    bae8:	f240091f 	tst	x8, #0x7
    baec:	9240080e 	and	x14, x0, #0x7
    baf0:	54000681 	b.ne	bbc0 <strncmp+0xe4>  // b.any
    baf4:	b500040e 	cbnz	x14, bb74 <strncmp+0x98>
    baf8:	d100044d 	sub	x13, x2, #0x1
    bafc:	d343fdad 	lsr	x13, x13, #3
    bb00:	f8408403 	ldr	x3, [x0], #8
    bb04:	f8408424 	ldr	x4, [x1], #8
    bb08:	f10005ad 	subs	x13, x13, #0x1
    bb0c:	cb0b0068 	sub	x8, x3, x11
    bb10:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    bb14:	ca040066 	eor	x6, x3, x4
    bb18:	da9f50cf 	csinv	x15, x6, xzr, pl  // pl = nfrst
    bb1c:	ea290105 	bics	x5, x8, x9
    bb20:	fa4009e0 	ccmp	x15, #0x0, #0x0, eq  // eq = none
    bb24:	54fffee0 	b.eq	bb00 <strncmp+0x24>  // b.none
    bb28:	b6f8012d 	tbz	x13, #63, bb4c <strncmp+0x70>
    bb2c:	f2400842 	ands	x2, x2, #0x7
    bb30:	540000e0 	b.eq	bb4c <strncmp+0x70>  // b.none
    bb34:	d37df042 	lsl	x2, x2, #3
    bb38:	9280000e 	mov	x14, #0xffffffffffffffff    	// #-1
    bb3c:	9ac221ce 	lsl	x14, x14, x2
    bb40:	8a2e0063 	bic	x3, x3, x14
    bb44:	8a2e0084 	bic	x4, x4, x14
    bb48:	aa0e00a5 	orr	x5, x5, x14
    bb4c:	aa0500c7 	orr	x7, x6, x5
    bb50:	dac00ce7 	rev	x7, x7
    bb54:	dac00c63 	rev	x3, x3
    bb58:	dac010ec 	clz	x12, x7
    bb5c:	dac00c84 	rev	x4, x4
    bb60:	9acc2063 	lsl	x3, x3, x12
    bb64:	9acc2084 	lsl	x4, x4, x12
    bb68:	d378fc63 	lsr	x3, x3, #56
    bb6c:	cb44e060 	sub	x0, x3, x4, lsr #56
    bb70:	d65f03c0 	ret
    bb74:	927df000 	and	x0, x0, #0xfffffffffffffff8
    bb78:	927df021 	and	x1, x1, #0xfffffffffffffff8
    bb7c:	f8408403 	ldr	x3, [x0], #8
    bb80:	cb0e0fea 	neg	x10, x14, lsl #3
    bb84:	f8408424 	ldr	x4, [x1], #8
    bb88:	92800009 	mov	x9, #0xffffffffffffffff    	// #-1
    bb8c:	d100044d 	sub	x13, x2, #0x1
    bb90:	9aca2529 	lsr	x9, x9, x10
    bb94:	924009aa 	and	x10, x13, #0x7
    bb98:	d343fdad 	lsr	x13, x13, #3
    bb9c:	8b0e0042 	add	x2, x2, x14
    bba0:	8b0e014a 	add	x10, x10, x14
    bba4:	aa090063 	orr	x3, x3, x9
    bba8:	aa090084 	orr	x4, x4, x9
    bbac:	8b4a0dad 	add	x13, x13, x10, lsr #3
    bbb0:	17ffffd6 	b	bb08 <strncmp+0x2c>
    bbb4:	d503201f 	nop
    bbb8:	d503201f 	nop
    bbbc:	d503201f 	nop
    bbc0:	f100405f 	cmp	x2, #0x10
    bbc4:	54000122 	b.cs	bbe8 <strncmp+0x10c>  // b.hs, b.nlast
    bbc8:	38401403 	ldrb	w3, [x0], #1
    bbcc:	38401424 	ldrb	w4, [x1], #1
    bbd0:	f1000442 	subs	x2, x2, #0x1
    bbd4:	7a418860 	ccmp	w3, #0x1, #0x0, hi  // hi = pmore
    bbd8:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    bbdc:	54ffff60 	b.eq	bbc8 <strncmp+0xec>  // b.none
    bbe0:	cb040060 	sub	x0, x3, x4
    bbe4:	d65f03c0 	ret
    bbe8:	d343fc4d 	lsr	x13, x2, #3
    bbec:	b400018e 	cbz	x14, bc1c <strncmp+0x140>
    bbf0:	cb0e03ee 	neg	x14, x14
    bbf4:	924009ce 	and	x14, x14, #0x7
    bbf8:	cb0e0042 	sub	x2, x2, x14
    bbfc:	d343fc4d 	lsr	x13, x2, #3
    bc00:	38401403 	ldrb	w3, [x0], #1
    bc04:	38401424 	ldrb	w4, [x1], #1
    bc08:	7100047f 	cmp	w3, #0x1
    bc0c:	7a442060 	ccmp	w3, w4, #0x0, cs  // cs = hs, nlast
    bc10:	54fffe81 	b.ne	bbe0 <strncmp+0x104>  // b.any
    bc14:	f10005ce 	subs	x14, x14, #0x1
    bc18:	54ffff48 	b.hi	bc00 <strncmp+0x124>  // b.pmore
    bc1c:	d280010e 	mov	x14, #0x8                   	// #8
    bc20:	f10005ad 	subs	x13, x13, #0x1
    bc24:	540001c3 	b.cc	bc5c <strncmp+0x180>  // b.lo, b.ul, b.last
    bc28:	927d2029 	and	x9, x1, #0xff8
    bc2c:	d27d2129 	eor	x9, x9, #0xff8
    bc30:	b4fffe89 	cbz	x9, bc00 <strncmp+0x124>
    bc34:	f8408403 	ldr	x3, [x0], #8
    bc38:	f8408424 	ldr	x4, [x1], #8
    bc3c:	cb0b0068 	sub	x8, x3, x11
    bc40:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    bc44:	ca040066 	eor	x6, x3, x4
    bc48:	ea290105 	bics	x5, x8, x9
    bc4c:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    bc50:	54fff7e1 	b.ne	bb4c <strncmp+0x70>  // b.any
    bc54:	f10005ad 	subs	x13, x13, #0x1
    bc58:	54fffe85 	b.pl	bc28 <strncmp+0x14c>  // b.nfrst
    bc5c:	92400842 	and	x2, x2, #0x7
    bc60:	b4fff762 	cbz	x2, bb4c <strncmp+0x70>
    bc64:	d1002000 	sub	x0, x0, #0x8
    bc68:	d1002021 	sub	x1, x1, #0x8
    bc6c:	f8626803 	ldr	x3, [x0, x2]
    bc70:	f8626824 	ldr	x4, [x1, x2]
    bc74:	cb0b0068 	sub	x8, x3, x11
    bc78:	b200d869 	orr	x9, x3, #0x7f7f7f7f7f7f7f7f
    bc7c:	ca040066 	eor	x6, x3, x4
    bc80:	ea290105 	bics	x5, x8, x9
    bc84:	fa4008c0 	ccmp	x6, #0x0, #0x0, eq  // eq = none
    bc88:	54fff621 	b.ne	bb4c <strncmp+0x70>  // b.any
    bc8c:	d2800000 	mov	x0, #0x0                   	// #0
    bc90:	d65f03c0 	ret
    bc94:	d503201f 	nop
    bc98:	d503201f 	nop
    bc9c:	d503201f 	nop

000000000000bca0 <__env_lock>:
    bca0:	d65f03c0 	ret
    bca4:	d503201f 	nop
    bca8:	d503201f 	nop
    bcac:	d503201f 	nop

000000000000bcb0 <__env_unlock>:
    bcb0:	d65f03c0 	ret

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

000000000000bcb4 <_fini>:
    bcb4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    bcb8:	a9bf73fb 	stp	x27, x28, [sp, #-16]!
    bcbc:	a9bf6bf9 	stp	x25, x26, [sp, #-16]!
    bcc0:	a9bf63f7 	stp	x23, x24, [sp, #-16]!
    bcc4:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    bcc8:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    bccc:	a8c153f3 	ldp	x19, x20, [sp], #16
    bcd0:	a8c15bf5 	ldp	x21, x22, [sp], #16
    bcd4:	a8c163f7 	ldp	x23, x24, [sp], #16
    bcd8:	a8c16bf9 	ldp	x25, x26, [sp], #16
    bcdc:	a8c173fb 	ldp	x27, x28, [sp], #16
    bce0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    bce4:	d65f03c0 	ret
