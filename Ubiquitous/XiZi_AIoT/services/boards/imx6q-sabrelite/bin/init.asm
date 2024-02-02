
init:     file format elf32-littlearm


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
    804c:	00010d2c 	.word	0x00010d2c
    8050:	00000000 	.word	0x00000000
    8054:	00010354 	.word	0x00010354

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
    80c4:	00010354 	.word	0x00010354
    80c8:	00010d30 	.word	0x00010d30
    80cc:	00010360 	.word	0x00010360
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
    8164:	eb000c81 	bl	b370 <memset>
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
    81b4:	eb000bb6 	bl	b094 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb000008 	bl	81e8 <main>
    81c4:	eb000a12 	bl	aa14 <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00010d2c 	.word	0x00010d2c
    81dc:	00010db4 	.word	0x00010db4
	...

000081e8 <main>:
#include "libfs_to_client.h"
#include "libserial.h"
#include "usyscall.h"

int main(int argc, char* argv[])
{
    81e8:	e92d4800 	push	{fp, lr}
    81ec:	e28db004 	add	fp, sp, #4
    81f0:	e24dd030 	sub	sp, sp, #48	; 0x30
    81f4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    81f8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    struct Session session;
    connect_session(&session, "MemFS", 8092);
    81fc:	e24b301c 	sub	r3, fp, #28
    8200:	e3012f9c 	movw	r2, #8092	; 0x1f9c
    8204:	e30f1e9c 	movw	r1, #65180	; 0xfe9c
    8208:	e3401000 	movt	r1, #0
    820c:	e1a00003 	mov	r0, r3
    8210:	eb0007d0 	bl	a158 <connect_session>

    int fd;
    char* shell_task_param[2] = { "/shell", 0 };
    8214:	e30f3ea4 	movw	r3, #65188	; 0xfea4
    8218:	e3403000 	movt	r3, #0
    821c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    8220:	e3a03000 	mov	r3, #0
    8224:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    if ((fd = open(&session, shell_task_param[0])) < 0) {
    8228:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    822c:	e24b301c 	sub	r3, fp, #28
    8230:	e1a01002 	mov	r1, r2
    8234:	e1a00003 	mov	r0, r3
    8238:	eb00033f 	bl	8f3c <open>
    823c:	e50b0008 	str	r0, [fp, #-8]
    8240:	e51b3008 	ldr	r3, [fp, #-8]
    8244:	e3530000 	cmp	r3, #0
    8248:	aa000005 	bge	8264 <main+0x7c>
        printf("Open %s failed\n", shell_task_param[0]);
    824c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8250:	e1a01003 	mov	r1, r3
    8254:	e30f0eac 	movw	r0, #65196	; 0xfeac
    8258:	e3400000 	movt	r0, #0
    825c:	eb00092c 	bl	a714 <printf>
        exit();
    8260:	eb0009eb 	bl	aa14 <exit>
    }

    if (spawn(&session, fd, read, shell_task_param[0], shell_task_param) < 0) {
    8264:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8268:	e24b001c 	sub	r0, fp, #28
    826c:	e24b3024 	sub	r3, fp, #36	; 0x24
    8270:	e58d3000 	str	r3, [sp]
    8274:	e1a03002 	mov	r3, r2
    8278:	e309241c 	movw	r2, #37916	; 0x941c
    827c:	e3402000 	movt	r2, #0
    8280:	e51b1008 	ldr	r1, [fp, #-8]
    8284:	eb0009c9 	bl	a9b0 <spawn>
    8288:	e1a03000 	mov	r3, r0
    828c:	e3530000 	cmp	r3, #0
    8290:	aa000002 	bge	82a0 <main+0xb8>
        printf("Syscall Spawn shell failed\n");
    8294:	e30f0ebc 	movw	r0, #65212	; 0xfebc
    8298:	e3400000 	movt	r0, #0
    829c:	eb00091c 	bl	a714 <printf>
    }

    close(&session, fd);
    82a0:	e24b301c 	sub	r3, fp, #28
    82a4:	e51b1008 	ldr	r1, [fp, #-8]
    82a8:	e1a00003 	mov	r0, r3
    82ac:	eb0003a0 	bl	9134 <close>

    exit();
    82b0:	eb0009d7 	bl	aa14 <exit>
    return 0;
    82b4:	e3a03000 	mov	r3, #0
}
    82b8:	e1a00003 	mov	r0, r3
    82bc:	e24bd004 	sub	sp, fp, #4
    82c0:	e8bd8800 	pop	{fp, pc}

000082c4 <ipc_call_copy_args_Ipc_ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs_to_client.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    82c4:	e92d4800 	push	{fp, lr}
    82c8:	e28db004 	add	fp, sp, #4
    82cc:	e24dd048 	sub	sp, sp, #72	; 0x48
    82d0:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    82d4:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    82d8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    82dc:	e3530000 	cmp	r3, #0
    82e0:	1a000001 	bne	82ec <ipc_call_copy_args_Ipc_ls+0x28>
    82e4:	e3e03000 	mvn	r3, #0
    82e8:	ea00006d 	b	84a4 <ipc_call_copy_args_Ipc_ls+0x1e0>
    82ec:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    82f0:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    82f4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    82f8:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    82fc:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    8300:	eb000c5f 	bl	b484 <strlen>
    8304:	e1a03000 	mov	r3, r0
    8308:	e2833001 	add	r3, r3, #1
    830c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8310:	e24b3044 	sub	r3, fp, #68	; 0x44
    8314:	e1a02003 	mov	r2, r3
    8318:	e3a01001 	mov	r1, #1
    831c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8320:	eb000510 	bl	9768 <new_ipc_msg>
    8324:	e1a03000 	mov	r3, r0
    8328:	e50b3008 	str	r3, [fp, #-8]
    832c:	e51b3008 	ldr	r3, [fp, #-8]
    8330:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8334:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8338:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    833c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    8340:	eb000c4f 	bl	b484 <strlen>
    8344:	e1a03000 	mov	r3, r0
    8348:	e2833001 	add	r3, r3, #1
    834c:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8350:	e3a01000 	mov	r1, #0
    8354:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8358:	eb00056f 	bl	991c <ipc_msg_set_nth_arg>
    835c:	e3a03001 	mov	r3, #1
    8360:	e50b300c 	str	r3, [fp, #-12]
    8364:	e51b3008 	ldr	r3, [fp, #-8]
    8368:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    836c:	e3a03001 	mov	r3, #1
    8370:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
/// @param msg
/// @param opcode
/// @return
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
    8374:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8378:	e3530000 	cmp	r3, #0
    837c:	ba000002 	blt	838c <ipc_call_copy_args_Ipc_ls+0xc8>
    8380:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8384:	e35300ff 	cmp	r3, #255	; 0xff
    8388:	da000001 	ble	8394 <ipc_call_copy_args_Ipc_ls+0xd0>
        return false;
    838c:	e3a03000 	mov	r3, #0
    8390:	ea000004 	b	83a8 <ipc_call_copy_args_Ipc_ls+0xe4>
    }
    msg->header.opcode = opcode;
    8394:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8398:	e6ef2073 	uxtb	r2, r3
    839c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    83a0:	e5c32001 	strb	r2, [r3, #1]
    return true;
    83a4:	e3a03001 	mov	r3, #1
    83a8:	e50b300c 	str	r3, [fp, #-12]
    83ac:	e51b0008 	ldr	r0, [fp, #-8]
    83b0:	eb0005e1 	bl	9b3c <ipc_msg_send_wait>
    83b4:	e51b3008 	ldr	r3, [fp, #-8]
    83b8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    83bc:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    83c0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    83c4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    83c8:	eb000c2d 	bl	b484 <strlen>
    83cc:	e1a03000 	mov	r3, r0
    83d0:	e2833001 	add	r3, r3, #1
    83d4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    83d8:	e3a01000 	mov	r1, #0
    83dc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    83e0:	eb000595 	bl	9a3c <ipc_msg_get_nth_arg>
    83e4:	e3a03001 	mov	r3, #1
    83e8:	e50b300c 	str	r3, [fp, #-12]
    83ec:	e3a03000 	mov	r3, #0
    83f0:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    83f4:	e51b3008 	ldr	r3, [fp, #-8]
    83f8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    83fc:	e24b3040 	sub	r3, fp, #64	; 0x40
    8400:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    8404:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8408:	e5d33000 	ldrb	r3, [r3]
    840c:	e2033002 	and	r3, r3, #2
    8410:	e6ef3073 	uxtb	r3, r3
    8414:	e3530000 	cmp	r3, #0
    8418:	1a000007 	bne	843c <ipc_call_copy_args_Ipc_ls+0x178>
    841c:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    8420:	e3403000 	movt	r3, #0
    8424:	e30f2f40 	movw	r2, #65344	; 0xff40
    8428:	e3402000 	movt	r2, #0
    842c:	e3a01074 	mov	r1, #116	; 0x74
    8430:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    8434:	e3400000 	movt	r0, #0
    8438:	eb000ae1 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    843c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8440:	e2833008 	add	r3, r3, #8
    8444:	e3a02004 	mov	r2, #4
    8448:	e1a01003 	mov	r1, r3
    844c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    8450:	eb000b2f 	bl	b114 <memcpy>
    8454:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8458:	e50b3010 	str	r3, [fp, #-16]
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    845c:	e51b3010 	ldr	r3, [fp, #-16]
    8460:	e5933010 	ldr	r3, [r3, #16]
    8464:	e51b2010 	ldr	r2, [fp, #-16]
    8468:	e5922008 	ldr	r2, [r2, #8]
    846c:	e0833002 	add	r3, r3, r2
    8470:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    8474:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8478:	e5d33000 	ldrb	r3, [r3]
    847c:	e2033004 	and	r3, r3, #4
    8480:	e6ef3073 	uxtb	r3, r3
    8484:	e3530000 	cmp	r3, #0
    8488:	0a000004 	beq	84a0 <ipc_call_copy_args_Ipc_ls+0x1dc>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    848c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8490:	e1d330b2 	ldrh	r3, [r3, #2]
    8494:	e1a01003 	mov	r1, r3
    8498:	e51b0010 	ldr	r0, [fp, #-16]
    849c:	eb0007a0 	bl	a324 <session_free_buf>
    84a0:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    84a4:	e1a00003 	mov	r0, r3
    84a8:	e24bd004 	sub	sp, fp, #4
    84ac:	e8bd8800 	pop	{fp, pc}

000084b0 <ls>:
int ls(struct Session* session, char* path)
{
    84b0:	e92d4800 	push	{fp, lr}
    84b4:	e28db004 	add	fp, sp, #4
    84b8:	e24dd008 	sub	sp, sp, #8
    84bc:	e50b0008 	str	r0, [fp, #-8]
    84c0:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_ls)(session, path);
    84c4:	e51b100c 	ldr	r1, [fp, #-12]
    84c8:	e51b0008 	ldr	r0, [fp, #-8]
    84cc:	ebffff7c 	bl	82c4 <ipc_call_copy_args_Ipc_ls>
    84d0:	e1a03000 	mov	r3, r0
}
    84d4:	e1a00003 	mov	r0, r3
    84d8:	e24bd004 	sub	sp, fp, #4
    84dc:	e8bd8800 	pop	{fp, pc}

000084e0 <ipc_call_copy_args_Ipc_cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    84e0:	e92d4800 	push	{fp, lr}
    84e4:	e28db004 	add	fp, sp, #4
    84e8:	e24dd048 	sub	sp, sp, #72	; 0x48
    84ec:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    84f0:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    84f4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    84f8:	e3530000 	cmp	r3, #0
    84fc:	1a000001 	bne	8508 <ipc_call_copy_args_Ipc_cd+0x28>
    8500:	e3e03000 	mvn	r3, #0
    8504:	ea00006d 	b	86c0 <ipc_call_copy_args_Ipc_cd+0x1e0>
    8508:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    850c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    8510:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8514:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8518:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    851c:	eb000bd8 	bl	b484 <strlen>
    8520:	e1a03000 	mov	r3, r0
    8524:	e2833001 	add	r3, r3, #1
    8528:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    852c:	e24b3044 	sub	r3, fp, #68	; 0x44
    8530:	e1a02003 	mov	r2, r3
    8534:	e3a01001 	mov	r1, #1
    8538:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    853c:	eb000489 	bl	9768 <new_ipc_msg>
    8540:	e1a03000 	mov	r3, r0
    8544:	e50b3008 	str	r3, [fp, #-8]
    8548:	e51b3008 	ldr	r3, [fp, #-8]
    854c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8550:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8554:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8558:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    855c:	eb000bc8 	bl	b484 <strlen>
    8560:	e1a03000 	mov	r3, r0
    8564:	e2833001 	add	r3, r3, #1
    8568:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    856c:	e3a01000 	mov	r1, #0
    8570:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8574:	eb0004e8 	bl	991c <ipc_msg_set_nth_arg>
    8578:	e3a03001 	mov	r3, #1
    857c:	e50b300c 	str	r3, [fp, #-12]
    8580:	e51b3008 	ldr	r3, [fp, #-8]
    8584:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    8588:	e3a03002 	mov	r3, #2
    858c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    8590:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8594:	e3530000 	cmp	r3, #0
    8598:	ba000002 	blt	85a8 <ipc_call_copy_args_Ipc_cd+0xc8>
    859c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85a0:	e35300ff 	cmp	r3, #255	; 0xff
    85a4:	da000001 	ble	85b0 <ipc_call_copy_args_Ipc_cd+0xd0>
        return false;
    85a8:	e3a03000 	mov	r3, #0
    85ac:	ea000004 	b	85c4 <ipc_call_copy_args_Ipc_cd+0xe4>
    msg->header.opcode = opcode;
    85b0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    85b4:	e6ef2073 	uxtb	r2, r3
    85b8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    85bc:	e5c32001 	strb	r2, [r3, #1]
    return true;
    85c0:	e3a03001 	mov	r3, #1
    85c4:	e50b300c 	str	r3, [fp, #-12]
    85c8:	e51b0008 	ldr	r0, [fp, #-8]
    85cc:	eb00055a 	bl	9b3c <ipc_msg_send_wait>
    85d0:	e51b3008 	ldr	r3, [fp, #-8]
    85d4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    85d8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    85dc:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    85e0:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    85e4:	eb000ba6 	bl	b484 <strlen>
    85e8:	e1a03000 	mov	r3, r0
    85ec:	e2833001 	add	r3, r3, #1
    85f0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    85f4:	e3a01000 	mov	r1, #0
    85f8:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    85fc:	eb00050e 	bl	9a3c <ipc_msg_get_nth_arg>
    8600:	e3a03001 	mov	r3, #1
    8604:	e50b300c 	str	r3, [fp, #-12]
    8608:	e3a03000 	mov	r3, #0
    860c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    8610:	e51b3008 	ldr	r3, [fp, #-8]
    8614:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8618:	e24b3040 	sub	r3, fp, #64	; 0x40
    861c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    8620:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8624:	e5d33000 	ldrb	r3, [r3]
    8628:	e2033002 	and	r3, r3, #2
    862c:	e6ef3073 	uxtb	r3, r3
    8630:	e3530000 	cmp	r3, #0
    8634:	1a000007 	bne	8658 <ipc_call_copy_args_Ipc_cd+0x178>
    8638:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    863c:	e3403000 	movt	r3, #0
    8640:	e30f2f40 	movw	r2, #65344	; 0xff40
    8644:	e3402000 	movt	r2, #0
    8648:	e3a01074 	mov	r1, #116	; 0x74
    864c:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    8650:	e3400000 	movt	r0, #0
    8654:	eb000a5a 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    8658:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    865c:	e2833008 	add	r3, r3, #8
    8660:	e3a02004 	mov	r2, #4
    8664:	e1a01003 	mov	r1, r3
    8668:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    866c:	eb000aa8 	bl	b114 <memcpy>
    8670:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8674:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8678:	e51b3010 	ldr	r3, [fp, #-16]
    867c:	e5933010 	ldr	r3, [r3, #16]
    8680:	e51b2010 	ldr	r2, [fp, #-16]
    8684:	e5922008 	ldr	r2, [r2, #8]
    8688:	e0833002 	add	r3, r3, r2
    868c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    8690:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8694:	e5d33000 	ldrb	r3, [r3]
    8698:	e2033004 	and	r3, r3, #4
    869c:	e6ef3073 	uxtb	r3, r3
    86a0:	e3530000 	cmp	r3, #0
    86a4:	0a000004 	beq	86bc <ipc_call_copy_args_Ipc_cd+0x1dc>
    return session_free_buf(session, msg->header.len);
    86a8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    86ac:	e1d330b2 	ldrh	r3, [r3, #2]
    86b0:	e1a01003 	mov	r1, r3
    86b4:	e51b0010 	ldr	r0, [fp, #-16]
    86b8:	eb000719 	bl	a324 <session_free_buf>
    86bc:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    86c0:	e1a00003 	mov	r0, r3
    86c4:	e24bd004 	sub	sp, fp, #4
    86c8:	e8bd8800 	pop	{fp, pc}

000086cc <cd>:
int cd(struct Session* session, char* path)
{
    86cc:	e92d4800 	push	{fp, lr}
    86d0:	e28db004 	add	fp, sp, #4
    86d4:	e24dd008 	sub	sp, sp, #8
    86d8:	e50b0008 	str	r0, [fp, #-8]
    86dc:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cd)(session, path);
    86e0:	e51b100c 	ldr	r1, [fp, #-12]
    86e4:	e51b0008 	ldr	r0, [fp, #-8]
    86e8:	ebffff7c 	bl	84e0 <ipc_call_copy_args_Ipc_cd>
    86ec:	e1a03000 	mov	r3, r0
}
    86f0:	e1a00003 	mov	r0, r3
    86f4:	e24bd004 	sub	sp, fp, #4
    86f8:	e8bd8800 	pop	{fp, pc}

000086fc <ipc_call_copy_args_Ipc_mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    86fc:	e92d4800 	push	{fp, lr}
    8700:	e28db004 	add	fp, sp, #4
    8704:	e24dd048 	sub	sp, sp, #72	; 0x48
    8708:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    870c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    8710:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8714:	e3530000 	cmp	r3, #0
    8718:	1a000001 	bne	8724 <ipc_call_copy_args_Ipc_mkdir+0x28>
    871c:	e3e03000 	mvn	r3, #0
    8720:	ea00006d 	b	88dc <ipc_call_copy_args_Ipc_mkdir+0x1e0>
    8724:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8728:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    872c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8730:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8734:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    8738:	eb000b51 	bl	b484 <strlen>
    873c:	e1a03000 	mov	r3, r0
    8740:	e2833001 	add	r3, r3, #1
    8744:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8748:	e24b3044 	sub	r3, fp, #68	; 0x44
    874c:	e1a02003 	mov	r2, r3
    8750:	e3a01001 	mov	r1, #1
    8754:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8758:	eb000402 	bl	9768 <new_ipc_msg>
    875c:	e1a03000 	mov	r3, r0
    8760:	e50b3008 	str	r3, [fp, #-8]
    8764:	e51b3008 	ldr	r3, [fp, #-8]
    8768:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    876c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8770:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8774:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    8778:	eb000b41 	bl	b484 <strlen>
    877c:	e1a03000 	mov	r3, r0
    8780:	e2833001 	add	r3, r3, #1
    8784:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8788:	e3a01000 	mov	r1, #0
    878c:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8790:	eb000461 	bl	991c <ipc_msg_set_nth_arg>
    8794:	e3a03001 	mov	r3, #1
    8798:	e50b300c 	str	r3, [fp, #-12]
    879c:	e51b3008 	ldr	r3, [fp, #-8]
    87a0:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    87a4:	e3a03003 	mov	r3, #3
    87a8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    87ac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    87b0:	e3530000 	cmp	r3, #0
    87b4:	ba000002 	blt	87c4 <ipc_call_copy_args_Ipc_mkdir+0xc8>
    87b8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    87bc:	e35300ff 	cmp	r3, #255	; 0xff
    87c0:	da000001 	ble	87cc <ipc_call_copy_args_Ipc_mkdir+0xd0>
        return false;
    87c4:	e3a03000 	mov	r3, #0
    87c8:	ea000004 	b	87e0 <ipc_call_copy_args_Ipc_mkdir+0xe4>
    msg->header.opcode = opcode;
    87cc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    87d0:	e6ef2073 	uxtb	r2, r3
    87d4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    87d8:	e5c32001 	strb	r2, [r3, #1]
    return true;
    87dc:	e3a03001 	mov	r3, #1
    87e0:	e50b300c 	str	r3, [fp, #-12]
    87e4:	e51b0008 	ldr	r0, [fp, #-8]
    87e8:	eb0004d3 	bl	9b3c <ipc_msg_send_wait>
    87ec:	e51b3008 	ldr	r3, [fp, #-8]
    87f0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    87f4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    87f8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    87fc:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    8800:	eb000b1f 	bl	b484 <strlen>
    8804:	e1a03000 	mov	r3, r0
    8808:	e2833001 	add	r3, r3, #1
    880c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8810:	e3a01000 	mov	r1, #0
    8814:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    8818:	eb000487 	bl	9a3c <ipc_msg_get_nth_arg>
    881c:	e3a03001 	mov	r3, #1
    8820:	e50b300c 	str	r3, [fp, #-12]
    8824:	e3a03000 	mov	r3, #0
    8828:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    882c:	e51b3008 	ldr	r3, [fp, #-8]
    8830:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8834:	e24b3040 	sub	r3, fp, #64	; 0x40
    8838:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    883c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8840:	e5d33000 	ldrb	r3, [r3]
    8844:	e2033002 	and	r3, r3, #2
    8848:	e6ef3073 	uxtb	r3, r3
    884c:	e3530000 	cmp	r3, #0
    8850:	1a000007 	bne	8874 <ipc_call_copy_args_Ipc_mkdir+0x178>
    8854:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    8858:	e3403000 	movt	r3, #0
    885c:	e30f2f40 	movw	r2, #65344	; 0xff40
    8860:	e3402000 	movt	r2, #0
    8864:	e3a01074 	mov	r1, #116	; 0x74
    8868:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    886c:	e3400000 	movt	r0, #0
    8870:	eb0009d3 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    8874:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8878:	e2833008 	add	r3, r3, #8
    887c:	e3a02004 	mov	r2, #4
    8880:	e1a01003 	mov	r1, r3
    8884:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    8888:	eb000a21 	bl	b114 <memcpy>
    888c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8890:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8894:	e51b3010 	ldr	r3, [fp, #-16]
    8898:	e5933010 	ldr	r3, [r3, #16]
    889c:	e51b2010 	ldr	r2, [fp, #-16]
    88a0:	e5922008 	ldr	r2, [r2, #8]
    88a4:	e0833002 	add	r3, r3, r2
    88a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    88ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88b0:	e5d33000 	ldrb	r3, [r3]
    88b4:	e2033004 	and	r3, r3, #4
    88b8:	e6ef3073 	uxtb	r3, r3
    88bc:	e3530000 	cmp	r3, #0
    88c0:	0a000004 	beq	88d8 <ipc_call_copy_args_Ipc_mkdir+0x1dc>
    return session_free_buf(session, msg->header.len);
    88c4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88c8:	e1d330b2 	ldrh	r3, [r3, #2]
    88cc:	e1a01003 	mov	r1, r3
    88d0:	e51b0010 	ldr	r0, [fp, #-16]
    88d4:	eb000692 	bl	a324 <session_free_buf>
    88d8:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    88dc:	e1a00003 	mov	r0, r3
    88e0:	e24bd004 	sub	sp, fp, #4
    88e4:	e8bd8800 	pop	{fp, pc}

000088e8 <mkdir>:
int mkdir(struct Session* session, char* path)
{
    88e8:	e92d4800 	push	{fp, lr}
    88ec:	e28db004 	add	fp, sp, #4
    88f0:	e24dd008 	sub	sp, sp, #8
    88f4:	e50b0008 	str	r0, [fp, #-8]
    88f8:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_mkdir)(session, path);
    88fc:	e51b100c 	ldr	r1, [fp, #-12]
    8900:	e51b0008 	ldr	r0, [fp, #-8]
    8904:	ebffff7c 	bl	86fc <ipc_call_copy_args_Ipc_mkdir>
    8908:	e1a03000 	mov	r3, r0
}
    890c:	e1a00003 	mov	r0, r3
    8910:	e24bd004 	sub	sp, fp, #4
    8914:	e8bd8800 	pop	{fp, pc}

00008918 <ipc_call_copy_args_Ipc_delete>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    8918:	e92d4800 	push	{fp, lr}
    891c:	e28db004 	add	fp, sp, #4
    8920:	e24dd048 	sub	sp, sp, #72	; 0x48
    8924:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    8928:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    892c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8930:	e3530000 	cmp	r3, #0
    8934:	1a000001 	bne	8940 <ipc_call_copy_args_Ipc_delete+0x28>
    8938:	e3e03000 	mvn	r3, #0
    893c:	ea00006d 	b	8af8 <ipc_call_copy_args_Ipc_delete+0x1e0>
    8940:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8944:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    8948:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    894c:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8950:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    8954:	eb000aca 	bl	b484 <strlen>
    8958:	e1a03000 	mov	r3, r0
    895c:	e2833001 	add	r3, r3, #1
    8960:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8964:	e24b3044 	sub	r3, fp, #68	; 0x44
    8968:	e1a02003 	mov	r2, r3
    896c:	e3a01001 	mov	r1, #1
    8970:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8974:	eb00037b 	bl	9768 <new_ipc_msg>
    8978:	e1a03000 	mov	r3, r0
    897c:	e50b3008 	str	r3, [fp, #-8]
    8980:	e51b3008 	ldr	r3, [fp, #-8]
    8984:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8988:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    898c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8990:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    8994:	eb000aba 	bl	b484 <strlen>
    8998:	e1a03000 	mov	r3, r0
    899c:	e2833001 	add	r3, r3, #1
    89a0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    89a4:	e3a01000 	mov	r1, #0
    89a8:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    89ac:	eb0003da 	bl	991c <ipc_msg_set_nth_arg>
    89b0:	e3a03001 	mov	r3, #1
    89b4:	e50b300c 	str	r3, [fp, #-12]
    89b8:	e51b3008 	ldr	r3, [fp, #-8]
    89bc:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    89c0:	e3a03004 	mov	r3, #4
    89c4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    89c8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    89cc:	e3530000 	cmp	r3, #0
    89d0:	ba000002 	blt	89e0 <ipc_call_copy_args_Ipc_delete+0xc8>
    89d4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    89d8:	e35300ff 	cmp	r3, #255	; 0xff
    89dc:	da000001 	ble	89e8 <ipc_call_copy_args_Ipc_delete+0xd0>
        return false;
    89e0:	e3a03000 	mov	r3, #0
    89e4:	ea000004 	b	89fc <ipc_call_copy_args_Ipc_delete+0xe4>
    msg->header.opcode = opcode;
    89e8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    89ec:	e6ef2073 	uxtb	r2, r3
    89f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    89f4:	e5c32001 	strb	r2, [r3, #1]
    return true;
    89f8:	e3a03001 	mov	r3, #1
    89fc:	e50b300c 	str	r3, [fp, #-12]
    8a00:	e51b0008 	ldr	r0, [fp, #-8]
    8a04:	eb00044c 	bl	9b3c <ipc_msg_send_wait>
    8a08:	e51b3008 	ldr	r3, [fp, #-8]
    8a0c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8a10:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8a14:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    8a18:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    8a1c:	eb000a98 	bl	b484 <strlen>
    8a20:	e1a03000 	mov	r3, r0
    8a24:	e2833001 	add	r3, r3, #1
    8a28:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8a2c:	e3a01000 	mov	r1, #0
    8a30:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    8a34:	eb000400 	bl	9a3c <ipc_msg_get_nth_arg>
    8a38:	e3a03001 	mov	r3, #1
    8a3c:	e50b300c 	str	r3, [fp, #-12]
    8a40:	e3a03000 	mov	r3, #0
    8a44:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    8a48:	e51b3008 	ldr	r3, [fp, #-8]
    8a4c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8a50:	e24b3040 	sub	r3, fp, #64	; 0x40
    8a54:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    8a58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8a5c:	e5d33000 	ldrb	r3, [r3]
    8a60:	e2033002 	and	r3, r3, #2
    8a64:	e6ef3073 	uxtb	r3, r3
    8a68:	e3530000 	cmp	r3, #0
    8a6c:	1a000007 	bne	8a90 <ipc_call_copy_args_Ipc_delete+0x178>
    8a70:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    8a74:	e3403000 	movt	r3, #0
    8a78:	e30f2f40 	movw	r2, #65344	; 0xff40
    8a7c:	e3402000 	movt	r2, #0
    8a80:	e3a01074 	mov	r1, #116	; 0x74
    8a84:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    8a88:	e3400000 	movt	r0, #0
    8a8c:	eb00094c 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    8a90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8a94:	e2833008 	add	r3, r3, #8
    8a98:	e3a02004 	mov	r2, #4
    8a9c:	e1a01003 	mov	r1, r3
    8aa0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    8aa4:	eb00099a 	bl	b114 <memcpy>
    8aa8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8aac:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8ab0:	e51b3010 	ldr	r3, [fp, #-16]
    8ab4:	e5933010 	ldr	r3, [r3, #16]
    8ab8:	e51b2010 	ldr	r2, [fp, #-16]
    8abc:	e5922008 	ldr	r2, [r2, #8]
    8ac0:	e0833002 	add	r3, r3, r2
    8ac4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    8ac8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8acc:	e5d33000 	ldrb	r3, [r3]
    8ad0:	e2033004 	and	r3, r3, #4
    8ad4:	e6ef3073 	uxtb	r3, r3
    8ad8:	e3530000 	cmp	r3, #0
    8adc:	0a000004 	beq	8af4 <ipc_call_copy_args_Ipc_delete+0x1dc>
    return session_free_buf(session, msg->header.len);
    8ae0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8ae4:	e1d330b2 	ldrh	r3, [r3, #2]
    8ae8:	e1a01003 	mov	r1, r3
    8aec:	e51b0010 	ldr	r0, [fp, #-16]
    8af0:	eb00060b 	bl	a324 <session_free_buf>
    8af4:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    8af8:	e1a00003 	mov	r0, r3
    8afc:	e24bd004 	sub	sp, fp, #4
    8b00:	e8bd8800 	pop	{fp, pc}

00008b04 <rm>:
int rm(struct Session* session, char* path)
{
    8b04:	e92d4800 	push	{fp, lr}
    8b08:	e28db004 	add	fp, sp, #4
    8b0c:	e24dd008 	sub	sp, sp, #8
    8b10:	e50b0008 	str	r0, [fp, #-8]
    8b14:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_delete)(session, path);
    8b18:	e51b100c 	ldr	r1, [fp, #-12]
    8b1c:	e51b0008 	ldr	r0, [fp, #-8]
    8b20:	ebffff7c 	bl	8918 <ipc_call_copy_args_Ipc_delete>
    8b24:	e1a03000 	mov	r3, r0
}
    8b28:	e1a00003 	mov	r0, r3
    8b2c:	e24bd004 	sub	sp, fp, #4
    8b30:	e8bd8800 	pop	{fp, pc}

00008b34 <ipc_call_copy_args_Ipc_cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    8b34:	e92d4800 	push	{fp, lr}
    8b38:	e28db004 	add	fp, sp, #4
    8b3c:	e24dd048 	sub	sp, sp, #72	; 0x48
    8b40:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    8b44:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    8b48:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8b4c:	e3530000 	cmp	r3, #0
    8b50:	1a000001 	bne	8b5c <ipc_call_copy_args_Ipc_cat+0x28>
    8b54:	e3e03000 	mvn	r3, #0
    8b58:	ea00006d 	b	8d14 <ipc_call_copy_args_Ipc_cat+0x1e0>
    8b5c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8b60:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    8b64:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8b68:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8b6c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    8b70:	eb000a43 	bl	b484 <strlen>
    8b74:	e1a03000 	mov	r3, r0
    8b78:	e2833001 	add	r3, r3, #1
    8b7c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8b80:	e24b3044 	sub	r3, fp, #68	; 0x44
    8b84:	e1a02003 	mov	r2, r3
    8b88:	e3a01001 	mov	r1, #1
    8b8c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8b90:	eb0002f4 	bl	9768 <new_ipc_msg>
    8b94:	e1a03000 	mov	r3, r0
    8b98:	e50b3008 	str	r3, [fp, #-8]
    8b9c:	e51b3008 	ldr	r3, [fp, #-8]
    8ba0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8ba4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8ba8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8bac:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    8bb0:	eb000a33 	bl	b484 <strlen>
    8bb4:	e1a03000 	mov	r3, r0
    8bb8:	e2833001 	add	r3, r3, #1
    8bbc:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8bc0:	e3a01000 	mov	r1, #0
    8bc4:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8bc8:	eb000353 	bl	991c <ipc_msg_set_nth_arg>
    8bcc:	e3a03001 	mov	r3, #1
    8bd0:	e50b300c 	str	r3, [fp, #-12]
    8bd4:	e51b3008 	ldr	r3, [fp, #-8]
    8bd8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    8bdc:	e3a03005 	mov	r3, #5
    8be0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    8be4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8be8:	e3530000 	cmp	r3, #0
    8bec:	ba000002 	blt	8bfc <ipc_call_copy_args_Ipc_cat+0xc8>
    8bf0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8bf4:	e35300ff 	cmp	r3, #255	; 0xff
    8bf8:	da000001 	ble	8c04 <ipc_call_copy_args_Ipc_cat+0xd0>
        return false;
    8bfc:	e3a03000 	mov	r3, #0
    8c00:	ea000004 	b	8c18 <ipc_call_copy_args_Ipc_cat+0xe4>
    msg->header.opcode = opcode;
    8c04:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8c08:	e6ef2073 	uxtb	r2, r3
    8c0c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8c10:	e5c32001 	strb	r2, [r3, #1]
    return true;
    8c14:	e3a03001 	mov	r3, #1
    8c18:	e50b300c 	str	r3, [fp, #-12]
    8c1c:	e51b0008 	ldr	r0, [fp, #-8]
    8c20:	eb0003c5 	bl	9b3c <ipc_msg_send_wait>
    8c24:	e51b3008 	ldr	r3, [fp, #-8]
    8c28:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8c2c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8c30:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    8c34:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    8c38:	eb000a11 	bl	b484 <strlen>
    8c3c:	e1a03000 	mov	r3, r0
    8c40:	e2833001 	add	r3, r3, #1
    8c44:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8c48:	e3a01000 	mov	r1, #0
    8c4c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    8c50:	eb000379 	bl	9a3c <ipc_msg_get_nth_arg>
    8c54:	e3a03001 	mov	r3, #1
    8c58:	e50b300c 	str	r3, [fp, #-12]
    8c5c:	e3a03000 	mov	r3, #0
    8c60:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    8c64:	e51b3008 	ldr	r3, [fp, #-8]
    8c68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8c6c:	e24b3040 	sub	r3, fp, #64	; 0x40
    8c70:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    8c74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c78:	e5d33000 	ldrb	r3, [r3]
    8c7c:	e2033002 	and	r3, r3, #2
    8c80:	e6ef3073 	uxtb	r3, r3
    8c84:	e3530000 	cmp	r3, #0
    8c88:	1a000007 	bne	8cac <ipc_call_copy_args_Ipc_cat+0x178>
    8c8c:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    8c90:	e3403000 	movt	r3, #0
    8c94:	e30f2f40 	movw	r2, #65344	; 0xff40
    8c98:	e3402000 	movt	r2, #0
    8c9c:	e3a01074 	mov	r1, #116	; 0x74
    8ca0:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    8ca4:	e3400000 	movt	r0, #0
    8ca8:	eb0008c5 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    8cac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8cb0:	e2833008 	add	r3, r3, #8
    8cb4:	e3a02004 	mov	r2, #4
    8cb8:	e1a01003 	mov	r1, r3
    8cbc:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    8cc0:	eb000913 	bl	b114 <memcpy>
    8cc4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8cc8:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8ccc:	e51b3010 	ldr	r3, [fp, #-16]
    8cd0:	e5933010 	ldr	r3, [r3, #16]
    8cd4:	e51b2010 	ldr	r2, [fp, #-16]
    8cd8:	e5922008 	ldr	r2, [r2, #8]
    8cdc:	e0833002 	add	r3, r3, r2
    8ce0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    8ce4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8ce8:	e5d33000 	ldrb	r3, [r3]
    8cec:	e2033004 	and	r3, r3, #4
    8cf0:	e6ef3073 	uxtb	r3, r3
    8cf4:	e3530000 	cmp	r3, #0
    8cf8:	0a000004 	beq	8d10 <ipc_call_copy_args_Ipc_cat+0x1dc>
    return session_free_buf(session, msg->header.len);
    8cfc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d00:	e1d330b2 	ldrh	r3, [r3, #2]
    8d04:	e1a01003 	mov	r1, r3
    8d08:	e51b0010 	ldr	r0, [fp, #-16]
    8d0c:	eb000584 	bl	a324 <session_free_buf>
    8d10:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    8d14:	e1a00003 	mov	r0, r3
    8d18:	e24bd004 	sub	sp, fp, #4
    8d1c:	e8bd8800 	pop	{fp, pc}

00008d20 <cat>:
int cat(struct Session* session, char* path)
{
    8d20:	e92d4800 	push	{fp, lr}
    8d24:	e28db004 	add	fp, sp, #4
    8d28:	e24dd008 	sub	sp, sp, #8
    8d2c:	e50b0008 	str	r0, [fp, #-8]
    8d30:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cat)(session, path);
    8d34:	e51b100c 	ldr	r1, [fp, #-12]
    8d38:	e51b0008 	ldr	r0, [fp, #-8]
    8d3c:	ebffff7c 	bl	8b34 <ipc_call_copy_args_Ipc_cat>
    8d40:	e1a03000 	mov	r3, r0
}
    8d44:	e1a00003 	mov	r0, r3
    8d48:	e24bd004 	sub	sp, fp, #4
    8d4c:	e8bd8800 	pop	{fp, pc}

00008d50 <ipc_call_copy_args_Ipc_open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    8d50:	e92d4800 	push	{fp, lr}
    8d54:	e28db004 	add	fp, sp, #4
    8d58:	e24dd048 	sub	sp, sp, #72	; 0x48
    8d5c:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    8d60:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    8d64:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8d68:	e3530000 	cmp	r3, #0
    8d6c:	1a000001 	bne	8d78 <ipc_call_copy_args_Ipc_open+0x28>
    8d70:	e3e03000 	mvn	r3, #0
    8d74:	ea00006d 	b	8f30 <ipc_call_copy_args_Ipc_open+0x1e0>
    8d78:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8d7c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    8d80:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8d84:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8d88:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    8d8c:	eb0009bc 	bl	b484 <strlen>
    8d90:	e1a03000 	mov	r3, r0
    8d94:	e2833001 	add	r3, r3, #1
    8d98:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8d9c:	e24b3044 	sub	r3, fp, #68	; 0x44
    8da0:	e1a02003 	mov	r2, r3
    8da4:	e3a01001 	mov	r1, #1
    8da8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8dac:	eb00026d 	bl	9768 <new_ipc_msg>
    8db0:	e1a03000 	mov	r3, r0
    8db4:	e50b3008 	str	r3, [fp, #-8]
    8db8:	e51b3008 	ldr	r3, [fp, #-8]
    8dbc:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8dc0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8dc4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8dc8:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    8dcc:	eb0009ac 	bl	b484 <strlen>
    8dd0:	e1a03000 	mov	r3, r0
    8dd4:	e2833001 	add	r3, r3, #1
    8dd8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8ddc:	e3a01000 	mov	r1, #0
    8de0:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8de4:	eb0002cc 	bl	991c <ipc_msg_set_nth_arg>
    8de8:	e3a03001 	mov	r3, #1
    8dec:	e50b300c 	str	r3, [fp, #-12]
    8df0:	e51b3008 	ldr	r3, [fp, #-8]
    8df4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    8df8:	e3a03006 	mov	r3, #6
    8dfc:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    8e00:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8e04:	e3530000 	cmp	r3, #0
    8e08:	ba000002 	blt	8e18 <ipc_call_copy_args_Ipc_open+0xc8>
    8e0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8e10:	e35300ff 	cmp	r3, #255	; 0xff
    8e14:	da000001 	ble	8e20 <ipc_call_copy_args_Ipc_open+0xd0>
        return false;
    8e18:	e3a03000 	mov	r3, #0
    8e1c:	ea000004 	b	8e34 <ipc_call_copy_args_Ipc_open+0xe4>
    msg->header.opcode = opcode;
    8e20:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8e24:	e6ef2073 	uxtb	r2, r3
    8e28:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8e2c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    8e30:	e3a03001 	mov	r3, #1
    8e34:	e50b300c 	str	r3, [fp, #-12]
    8e38:	e51b0008 	ldr	r0, [fp, #-8]
    8e3c:	eb00033e 	bl	9b3c <ipc_msg_send_wait>
    8e40:	e51b3008 	ldr	r3, [fp, #-8]
    8e44:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8e48:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8e4c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    8e50:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    8e54:	eb00098a 	bl	b484 <strlen>
    8e58:	e1a03000 	mov	r3, r0
    8e5c:	e2833001 	add	r3, r3, #1
    8e60:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8e64:	e3a01000 	mov	r1, #0
    8e68:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    8e6c:	eb0002f2 	bl	9a3c <ipc_msg_get_nth_arg>
    8e70:	e3a03001 	mov	r3, #1
    8e74:	e50b300c 	str	r3, [fp, #-12]
    8e78:	e3a03000 	mov	r3, #0
    8e7c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    8e80:	e51b3008 	ldr	r3, [fp, #-8]
    8e84:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8e88:	e24b3040 	sub	r3, fp, #64	; 0x40
    8e8c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    8e90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8e94:	e5d33000 	ldrb	r3, [r3]
    8e98:	e2033002 	and	r3, r3, #2
    8e9c:	e6ef3073 	uxtb	r3, r3
    8ea0:	e3530000 	cmp	r3, #0
    8ea4:	1a000007 	bne	8ec8 <ipc_call_copy_args_Ipc_open+0x178>
    8ea8:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    8eac:	e3403000 	movt	r3, #0
    8eb0:	e30f2f40 	movw	r2, #65344	; 0xff40
    8eb4:	e3402000 	movt	r2, #0
    8eb8:	e3a01074 	mov	r1, #116	; 0x74
    8ebc:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    8ec0:	e3400000 	movt	r0, #0
    8ec4:	eb00083e 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    8ec8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ecc:	e2833008 	add	r3, r3, #8
    8ed0:	e3a02004 	mov	r2, #4
    8ed4:	e1a01003 	mov	r1, r3
    8ed8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    8edc:	eb00088c 	bl	b114 <memcpy>
    8ee0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8ee4:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8ee8:	e51b3010 	ldr	r3, [fp, #-16]
    8eec:	e5933010 	ldr	r3, [r3, #16]
    8ef0:	e51b2010 	ldr	r2, [fp, #-16]
    8ef4:	e5922008 	ldr	r2, [r2, #8]
    8ef8:	e0833002 	add	r3, r3, r2
    8efc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    8f00:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8f04:	e5d33000 	ldrb	r3, [r3]
    8f08:	e2033004 	and	r3, r3, #4
    8f0c:	e6ef3073 	uxtb	r3, r3
    8f10:	e3530000 	cmp	r3, #0
    8f14:	0a000004 	beq	8f2c <ipc_call_copy_args_Ipc_open+0x1dc>
    return session_free_buf(session, msg->header.len);
    8f18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8f1c:	e1d330b2 	ldrh	r3, [r3, #2]
    8f20:	e1a01003 	mov	r1, r3
    8f24:	e51b0010 	ldr	r0, [fp, #-16]
    8f28:	eb0004fd 	bl	a324 <session_free_buf>
    8f2c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    8f30:	e1a00003 	mov	r0, r3
    8f34:	e24bd004 	sub	sp, fp, #4
    8f38:	e8bd8800 	pop	{fp, pc}

00008f3c <open>:
int open(struct Session* session, char* path)
{
    8f3c:	e92d4800 	push	{fp, lr}
    8f40:	e28db004 	add	fp, sp, #4
    8f44:	e24dd008 	sub	sp, sp, #8
    8f48:	e50b0008 	str	r0, [fp, #-8]
    8f4c:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_open)(session, path);
    8f50:	e51b100c 	ldr	r1, [fp, #-12]
    8f54:	e51b0008 	ldr	r0, [fp, #-8]
    8f58:	ebffff7c 	bl	8d50 <ipc_call_copy_args_Ipc_open>
    8f5c:	e1a03000 	mov	r3, r0
}
    8f60:	e1a00003 	mov	r0, r3
    8f64:	e24bd004 	sub	sp, fp, #4
    8f68:	e8bd8800 	pop	{fp, pc}

00008f6c <ipc_call_copy_args_Ipc_close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    8f6c:	e92d4800 	push	{fp, lr}
    8f70:	e28db004 	add	fp, sp, #4
    8f74:	e24dd048 	sub	sp, sp, #72	; 0x48
    8f78:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    8f7c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    8f80:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8f84:	e3530000 	cmp	r3, #0
    8f88:	1a000001 	bne	8f94 <ipc_call_copy_args_Ipc_close+0x28>
    8f8c:	e3e03000 	mvn	r3, #0
    8f90:	ea000064 	b	9128 <ipc_call_copy_args_Ipc_close+0x1bc>
    8f94:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    8f98:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    8f9c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8fa0:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    8fa4:	e3a03004 	mov	r3, #4
    8fa8:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    8fac:	e24b3044 	sub	r3, fp, #68	; 0x44
    8fb0:	e1a02003 	mov	r2, r3
    8fb4:	e3a01001 	mov	r1, #1
    8fb8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    8fbc:	eb0001e9 	bl	9768 <new_ipc_msg>
    8fc0:	e1a03000 	mov	r3, r0
    8fc4:	e50b3008 	str	r3, [fp, #-8]
    8fc8:	e51b3008 	ldr	r3, [fp, #-8]
    8fcc:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    8fd0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    8fd4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    8fd8:	e3a03004 	mov	r3, #4
    8fdc:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    8fe0:	e3a01000 	mov	r1, #0
    8fe4:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    8fe8:	eb00024b 	bl	991c <ipc_msg_set_nth_arg>
    8fec:	e3a03001 	mov	r3, #1
    8ff0:	e50b300c 	str	r3, [fp, #-12]
    8ff4:	e51b3008 	ldr	r3, [fp, #-8]
    8ff8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    8ffc:	e3a03007 	mov	r3, #7
    9000:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    9004:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9008:	e3530000 	cmp	r3, #0
    900c:	ba000002 	blt	901c <ipc_call_copy_args_Ipc_close+0xb0>
    9010:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9014:	e35300ff 	cmp	r3, #255	; 0xff
    9018:	da000001 	ble	9024 <ipc_call_copy_args_Ipc_close+0xb8>
        return false;
    901c:	e3a03000 	mov	r3, #0
    9020:	ea000004 	b	9038 <ipc_call_copy_args_Ipc_close+0xcc>
    msg->header.opcode = opcode;
    9024:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9028:	e6ef2073 	uxtb	r2, r3
    902c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9030:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9034:	e3a03001 	mov	r3, #1
    9038:	e50b300c 	str	r3, [fp, #-12]
    903c:	e51b0008 	ldr	r0, [fp, #-8]
    9040:	eb0002bd 	bl	9b3c <ipc_msg_send_wait>
    9044:	e51b3008 	ldr	r3, [fp, #-8]
    9048:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    904c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9050:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9054:	e3a03004 	mov	r3, #4
    9058:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    905c:	e3a01000 	mov	r1, #0
    9060:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9064:	eb000274 	bl	9a3c <ipc_msg_get_nth_arg>
    9068:	e3a03001 	mov	r3, #1
    906c:	e50b300c 	str	r3, [fp, #-12]
    9070:	e3a03000 	mov	r3, #0
    9074:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9078:	e51b3008 	ldr	r3, [fp, #-8]
    907c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9080:	e24b3040 	sub	r3, fp, #64	; 0x40
    9084:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9088:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    908c:	e5d33000 	ldrb	r3, [r3]
    9090:	e2033002 	and	r3, r3, #2
    9094:	e6ef3073 	uxtb	r3, r3
    9098:	e3530000 	cmp	r3, #0
    909c:	1a000007 	bne	90c0 <ipc_call_copy_args_Ipc_close+0x154>
    90a0:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    90a4:	e3403000 	movt	r3, #0
    90a8:	e30f2f40 	movw	r2, #65344	; 0xff40
    90ac:	e3402000 	movt	r2, #0
    90b0:	e3a01074 	mov	r1, #116	; 0x74
    90b4:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    90b8:	e3400000 	movt	r0, #0
    90bc:	eb0007c0 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    90c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    90c4:	e2833008 	add	r3, r3, #8
    90c8:	e3a02004 	mov	r2, #4
    90cc:	e1a01003 	mov	r1, r3
    90d0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    90d4:	eb00080e 	bl	b114 <memcpy>
    90d8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    90dc:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    90e0:	e51b3010 	ldr	r3, [fp, #-16]
    90e4:	e5933010 	ldr	r3, [r3, #16]
    90e8:	e51b2010 	ldr	r2, [fp, #-16]
    90ec:	e5922008 	ldr	r2, [r2, #8]
    90f0:	e0833002 	add	r3, r3, r2
    90f4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    90f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    90fc:	e5d33000 	ldrb	r3, [r3]
    9100:	e2033004 	and	r3, r3, #4
    9104:	e6ef3073 	uxtb	r3, r3
    9108:	e3530000 	cmp	r3, #0
    910c:	0a000004 	beq	9124 <ipc_call_copy_args_Ipc_close+0x1b8>
    return session_free_buf(session, msg->header.len);
    9110:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9114:	e1d330b2 	ldrh	r3, [r3, #2]
    9118:	e1a01003 	mov	r1, r3
    911c:	e51b0010 	ldr	r0, [fp, #-16]
    9120:	eb00047f 	bl	a324 <session_free_buf>
    9124:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    9128:	e1a00003 	mov	r0, r3
    912c:	e24bd004 	sub	sp, fp, #4
    9130:	e8bd8800 	pop	{fp, pc}

00009134 <close>:
int close(struct Session* session, int fd)
{
    9134:	e92d4800 	push	{fp, lr}
    9138:	e28db004 	add	fp, sp, #4
    913c:	e24dd008 	sub	sp, sp, #8
    9140:	e50b0008 	str	r0, [fp, #-8]
    9144:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_close)(session, &fd);
    9148:	e24b300c 	sub	r3, fp, #12
    914c:	e1a01003 	mov	r1, r3
    9150:	e51b0008 	ldr	r0, [fp, #-8]
    9154:	ebffff84 	bl	8f6c <ipc_call_copy_args_Ipc_close>
    9158:	e1a03000 	mov	r3, r0
}
    915c:	e1a00003 	mov	r0, r3
    9160:	e24bd004 	sub	sp, fp, #4
    9164:	e8bd8800 	pop	{fp, pc}

00009168 <ipc_call_copy_args_Ipc_read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    9168:	e92d4800 	push	{fp, lr}
    916c:	e28db004 	add	fp, sp, #4
    9170:	e24dd080 	sub	sp, sp, #128	; 0x80
    9174:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    9178:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    917c:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    9180:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    9184:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    9188:	e3530000 	cmp	r3, #0
    918c:	1a000001 	bne	9198 <ipc_call_copy_args_Ipc_read+0x30>
    9190:	e3e03000 	mvn	r3, #0
    9194:	ea00009d 	b	9410 <ipc_call_copy_args_Ipc_read+0x2a8>
    9198:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    919c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    91a0:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    91a4:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    91a8:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    91ac:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    91b0:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    91b4:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    91b8:	e59b3004 	ldr	r3, [fp, #4]
    91bc:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    91c0:	e3a03004 	mov	r3, #4
    91c4:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    91c8:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    91cc:	e5933000 	ldr	r3, [r3]
    91d0:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    91d4:	e3a03004 	mov	r3, #4
    91d8:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    91dc:	e3a03004 	mov	r3, #4
    91e0:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    91e4:	e24b3074 	sub	r3, fp, #116	; 0x74
    91e8:	e1a02003 	mov	r2, r3
    91ec:	e3a01004 	mov	r1, #4
    91f0:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    91f4:	eb00015b 	bl	9768 <new_ipc_msg>
    91f8:	e1a03000 	mov	r3, r0
    91fc:	e50b3008 	str	r3, [fp, #-8]
    9200:	e51b3008 	ldr	r3, [fp, #-8]
    9204:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9208:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    920c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9210:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    9214:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9218:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    921c:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9220:	e59b3004 	ldr	r3, [fp, #4]
    9224:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    9228:	e3a03004 	mov	r3, #4
    922c:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    9230:	e3a01000 	mov	r1, #0
    9234:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9238:	eb0001b7 	bl	991c <ipc_msg_set_nth_arg>
    923c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9240:	e5933000 	ldr	r3, [r3]
    9244:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    9248:	e3a01001 	mov	r1, #1
    924c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9250:	eb0001b1 	bl	991c <ipc_msg_set_nth_arg>
    9254:	e3a03004 	mov	r3, #4
    9258:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    925c:	e3a01002 	mov	r1, #2
    9260:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9264:	eb0001ac 	bl	991c <ipc_msg_set_nth_arg>
    9268:	e3a03004 	mov	r3, #4
    926c:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    9270:	e3a01003 	mov	r1, #3
    9274:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9278:	eb0001a7 	bl	991c <ipc_msg_set_nth_arg>
    927c:	e3a03001 	mov	r3, #1
    9280:	e50b300c 	str	r3, [fp, #-12]
    9284:	e51b3008 	ldr	r3, [fp, #-8]
    9288:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    928c:	e3a03008 	mov	r3, #8
    9290:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    9294:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    9298:	e3530000 	cmp	r3, #0
    929c:	ba000002 	blt	92ac <ipc_call_copy_args_Ipc_read+0x144>
    92a0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    92a4:	e35300ff 	cmp	r3, #255	; 0xff
    92a8:	da000001 	ble	92b4 <ipc_call_copy_args_Ipc_read+0x14c>
        return false;
    92ac:	e3a03000 	mov	r3, #0
    92b0:	ea000004 	b	92c8 <ipc_call_copy_args_Ipc_read+0x160>
    msg->header.opcode = opcode;
    92b4:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    92b8:	e6ef2073 	uxtb	r2, r3
    92bc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    92c0:	e5c32001 	strb	r2, [r3, #1]
    return true;
    92c4:	e3a03001 	mov	r3, #1
    92c8:	e50b300c 	str	r3, [fp, #-12]
    92cc:	e51b0008 	ldr	r0, [fp, #-8]
    92d0:	eb000219 	bl	9b3c <ipc_msg_send_wait>
    92d4:	e51b3008 	ldr	r3, [fp, #-8]
    92d8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    92dc:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    92e0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    92e4:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    92e8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    92ec:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    92f0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    92f4:	e59b3004 	ldr	r3, [fp, #4]
    92f8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    92fc:	e3a03004 	mov	r3, #4
    9300:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9304:	e3a01000 	mov	r1, #0
    9308:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    930c:	eb0001ca 	bl	9a3c <ipc_msg_get_nth_arg>
    9310:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9314:	e5933000 	ldr	r3, [r3]
    9318:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    931c:	e3a01001 	mov	r1, #1
    9320:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9324:	eb0001c4 	bl	9a3c <ipc_msg_get_nth_arg>
    9328:	e3a03004 	mov	r3, #4
    932c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    9330:	e3a01002 	mov	r1, #2
    9334:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9338:	eb0001bf 	bl	9a3c <ipc_msg_get_nth_arg>
    933c:	e3a03004 	mov	r3, #4
    9340:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9344:	e3a01003 	mov	r1, #3
    9348:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    934c:	eb0001ba 	bl	9a3c <ipc_msg_get_nth_arg>
    9350:	e3a03001 	mov	r3, #1
    9354:	e50b300c 	str	r3, [fp, #-12]
    9358:	e3a03000 	mov	r3, #0
    935c:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    9360:	e51b3008 	ldr	r3, [fp, #-8]
    9364:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9368:	e24b3064 	sub	r3, fp, #100	; 0x64
    936c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9370:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9374:	e5d33000 	ldrb	r3, [r3]
    9378:	e2033002 	and	r3, r3, #2
    937c:	e6ef3073 	uxtb	r3, r3
    9380:	e3530000 	cmp	r3, #0
    9384:	1a000007 	bne	93a8 <ipc_call_copy_args_Ipc_read+0x240>
    9388:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    938c:	e3403000 	movt	r3, #0
    9390:	e30f2f40 	movw	r2, #65344	; 0xff40
    9394:	e3402000 	movt	r2, #0
    9398:	e3a01074 	mov	r1, #116	; 0x74
    939c:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    93a0:	e3400000 	movt	r0, #0
    93a4:	eb000706 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    93a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    93ac:	e2833008 	add	r3, r3, #8
    93b0:	e3a02004 	mov	r2, #4
    93b4:	e1a01003 	mov	r1, r3
    93b8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    93bc:	eb000754 	bl	b114 <memcpy>
    93c0:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    93c4:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    93c8:	e51b3010 	ldr	r3, [fp, #-16]
    93cc:	e5933010 	ldr	r3, [r3, #16]
    93d0:	e51b2010 	ldr	r2, [fp, #-16]
    93d4:	e5922008 	ldr	r2, [r2, #8]
    93d8:	e0833002 	add	r3, r3, r2
    93dc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    93e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    93e4:	e5d33000 	ldrb	r3, [r3]
    93e8:	e2033004 	and	r3, r3, #4
    93ec:	e6ef3073 	uxtb	r3, r3
    93f0:	e3530000 	cmp	r3, #0
    93f4:	0a000004 	beq	940c <ipc_call_copy_args_Ipc_read+0x2a4>
    return session_free_buf(session, msg->header.len);
    93f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    93fc:	e1d330b2 	ldrh	r3, [r3, #2]
    9400:	e1a01003 	mov	r1, r3
    9404:	e51b0010 	ldr	r0, [fp, #-16]
    9408:	eb0003c5 	bl	a324 <session_free_buf>
    940c:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    9410:	e1a00003 	mov	r0, r3
    9414:	e24bd004 	sub	sp, fp, #4
    9418:	e8bd8800 	pop	{fp, pc}

0000941c <read>:
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    941c:	e92d4800 	push	{fp, lr}
    9420:	e28db004 	add	fp, sp, #4
    9424:	e24dd018 	sub	sp, sp, #24
    9428:	e50b0008 	str	r0, [fp, #-8]
    942c:	e50b100c 	str	r1, [fp, #-12]
    9430:	e50b2010 	str	r2, [fp, #-16]
    9434:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    9438:	e24b2014 	sub	r2, fp, #20
    943c:	e24b100c 	sub	r1, fp, #12
    9440:	e28b3004 	add	r3, fp, #4
    9444:	e58d3000 	str	r3, [sp]
    9448:	e1a03002 	mov	r3, r2
    944c:	e51b2010 	ldr	r2, [fp, #-16]
    9450:	e51b0008 	ldr	r0, [fp, #-8]
    9454:	ebffff43 	bl	9168 <ipc_call_copy_args_Ipc_read>
    9458:	e1a03000 	mov	r3, r0
}
    945c:	e1a00003 	mov	r0, r3
    9460:	e24bd004 	sub	sp, fp, #4
    9464:	e8bd8800 	pop	{fp, pc}

00009468 <ipc_call_copy_args_Ipc_write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    9468:	e92d4800 	push	{fp, lr}
    946c:	e28db004 	add	fp, sp, #4
    9470:	e24dd080 	sub	sp, sp, #128	; 0x80
    9474:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    9478:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    947c:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    9480:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    9484:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    9488:	e3530000 	cmp	r3, #0
    948c:	1a000001 	bne	9498 <ipc_call_copy_args_Ipc_write+0x30>
    9490:	e3e03000 	mvn	r3, #0
    9494:	ea00009d 	b	9710 <ipc_call_copy_args_Ipc_write+0x2a8>
    9498:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    949c:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    94a0:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    94a4:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    94a8:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    94ac:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    94b0:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    94b4:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    94b8:	e59b3004 	ldr	r3, [fp, #4]
    94bc:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    94c0:	e3a03004 	mov	r3, #4
    94c4:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    94c8:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    94cc:	e5933000 	ldr	r3, [r3]
    94d0:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    94d4:	e3a03004 	mov	r3, #4
    94d8:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    94dc:	e3a03004 	mov	r3, #4
    94e0:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    94e4:	e24b3074 	sub	r3, fp, #116	; 0x74
    94e8:	e1a02003 	mov	r2, r3
    94ec:	e3a01004 	mov	r1, #4
    94f0:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    94f4:	eb00009b 	bl	9768 <new_ipc_msg>
    94f8:	e1a03000 	mov	r3, r0
    94fc:	e50b3008 	str	r3, [fp, #-8]
    9500:	e51b3008 	ldr	r3, [fp, #-8]
    9504:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9508:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    950c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9510:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    9514:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9518:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    951c:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9520:	e59b3004 	ldr	r3, [fp, #4]
    9524:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    9528:	e3a03004 	mov	r3, #4
    952c:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    9530:	e3a01000 	mov	r1, #0
    9534:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9538:	eb0000f7 	bl	991c <ipc_msg_set_nth_arg>
    953c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9540:	e5933000 	ldr	r3, [r3]
    9544:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    9548:	e3a01001 	mov	r1, #1
    954c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9550:	eb0000f1 	bl	991c <ipc_msg_set_nth_arg>
    9554:	e3a03004 	mov	r3, #4
    9558:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    955c:	e3a01002 	mov	r1, #2
    9560:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9564:	eb0000ec 	bl	991c <ipc_msg_set_nth_arg>
    9568:	e3a03004 	mov	r3, #4
    956c:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    9570:	e3a01003 	mov	r1, #3
    9574:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9578:	eb0000e7 	bl	991c <ipc_msg_set_nth_arg>
    957c:	e3a03001 	mov	r3, #1
    9580:	e50b300c 	str	r3, [fp, #-12]
    9584:	e51b3008 	ldr	r3, [fp, #-8]
    9588:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    958c:	e3a03009 	mov	r3, #9
    9590:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    9594:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    9598:	e3530000 	cmp	r3, #0
    959c:	ba000002 	blt	95ac <ipc_call_copy_args_Ipc_write+0x144>
    95a0:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    95a4:	e35300ff 	cmp	r3, #255	; 0xff
    95a8:	da000001 	ble	95b4 <ipc_call_copy_args_Ipc_write+0x14c>
        return false;
    95ac:	e3a03000 	mov	r3, #0
    95b0:	ea000004 	b	95c8 <ipc_call_copy_args_Ipc_write+0x160>
    msg->header.opcode = opcode;
    95b4:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    95b8:	e6ef2073 	uxtb	r2, r3
    95bc:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    95c0:	e5c32001 	strb	r2, [r3, #1]
    return true;
    95c4:	e3a03001 	mov	r3, #1
    95c8:	e50b300c 	str	r3, [fp, #-12]
    95cc:	e51b0008 	ldr	r0, [fp, #-8]
    95d0:	eb000159 	bl	9b3c <ipc_msg_send_wait>
    95d4:	e51b3008 	ldr	r3, [fp, #-8]
    95d8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    95dc:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    95e0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    95e4:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    95e8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    95ec:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    95f0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    95f4:	e59b3004 	ldr	r3, [fp, #4]
    95f8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    95fc:	e3a03004 	mov	r3, #4
    9600:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9604:	e3a01000 	mov	r1, #0
    9608:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    960c:	eb00010a 	bl	9a3c <ipc_msg_get_nth_arg>
    9610:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9614:	e5933000 	ldr	r3, [r3]
    9618:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    961c:	e3a01001 	mov	r1, #1
    9620:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9624:	eb000104 	bl	9a3c <ipc_msg_get_nth_arg>
    9628:	e3a03004 	mov	r3, #4
    962c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    9630:	e3a01002 	mov	r1, #2
    9634:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9638:	eb0000ff 	bl	9a3c <ipc_msg_get_nth_arg>
    963c:	e3a03004 	mov	r3, #4
    9640:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9644:	e3a01003 	mov	r1, #3
    9648:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    964c:	eb0000fa 	bl	9a3c <ipc_msg_get_nth_arg>
    9650:	e3a03001 	mov	r3, #1
    9654:	e50b300c 	str	r3, [fp, #-12]
    9658:	e3a03000 	mov	r3, #0
    965c:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    9660:	e51b3008 	ldr	r3, [fp, #-8]
    9664:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9668:	e24b3064 	sub	r3, fp, #100	; 0x64
    966c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9670:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9674:	e5d33000 	ldrb	r3, [r3]
    9678:	e2033002 	and	r3, r3, #2
    967c:	e6ef3073 	uxtb	r3, r3
    9680:	e3530000 	cmp	r3, #0
    9684:	1a000007 	bne	96a8 <ipc_call_copy_args_Ipc_write+0x240>
    9688:	e30f3ed8 	movw	r3, #65240	; 0xfed8
    968c:	e3403000 	movt	r3, #0
    9690:	e30f2f40 	movw	r2, #65344	; 0xff40
    9694:	e3402000 	movt	r2, #0
    9698:	e3a01074 	mov	r1, #116	; 0x74
    969c:	e30f0ef0 	movw	r0, #65264	; 0xfef0
    96a0:	e3400000 	movt	r0, #0
    96a4:	eb000646 	bl	afc4 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    96a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    96ac:	e2833008 	add	r3, r3, #8
    96b0:	e3a02004 	mov	r2, #4
    96b4:	e1a01003 	mov	r1, r3
    96b8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    96bc:	eb000694 	bl	b114 <memcpy>
    96c0:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    96c4:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    96c8:	e51b3010 	ldr	r3, [fp, #-16]
    96cc:	e5933010 	ldr	r3, [r3, #16]
    96d0:	e51b2010 	ldr	r2, [fp, #-16]
    96d4:	e5922008 	ldr	r2, [r2, #8]
    96d8:	e0833002 	add	r3, r3, r2
    96dc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    96e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    96e4:	e5d33000 	ldrb	r3, [r3]
    96e8:	e2033004 	and	r3, r3, #4
    96ec:	e6ef3073 	uxtb	r3, r3
    96f0:	e3530000 	cmp	r3, #0
    96f4:	0a000004 	beq	970c <ipc_call_copy_args_Ipc_write+0x2a4>
    return session_free_buf(session, msg->header.len);
    96f8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    96fc:	e1d330b2 	ldrh	r3, [r3, #2]
    9700:	e1a01003 	mov	r1, r3
    9704:	e51b0010 	ldr	r0, [fp, #-16]
    9708:	eb000305 	bl	a324 <session_free_buf>
    970c:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    9710:	e1a00003 	mov	r0, r3
    9714:	e24bd004 	sub	sp, fp, #4
    9718:	e8bd8800 	pop	{fp, pc}

0000971c <write>:
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    971c:	e92d4800 	push	{fp, lr}
    9720:	e28db004 	add	fp, sp, #4
    9724:	e24dd018 	sub	sp, sp, #24
    9728:	e50b0008 	str	r0, [fp, #-8]
    972c:	e50b100c 	str	r1, [fp, #-12]
    9730:	e50b2010 	str	r2, [fp, #-16]
    9734:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    9738:	e24b2014 	sub	r2, fp, #20
    973c:	e24b100c 	sub	r1, fp, #12
    9740:	e28b3004 	add	r3, fp, #4
    9744:	e58d3000 	str	r3, [sp]
    9748:	e1a03002 	mov	r3, r2
    974c:	e51b2010 	ldr	r2, [fp, #-16]
    9750:	e51b0008 	ldr	r0, [fp, #-8]
    9754:	ebffff43 	bl	9468 <ipc_call_copy_args_Ipc_write>
    9758:	e1a03000 	mov	r3, r0
    975c:	e1a00003 	mov	r0, r3
    9760:	e24bd004 	sub	sp, fp, #4
    9764:	e8bd8800 	pop	{fp, pc}

00009768 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    9768:	e92d4800 	push	{fp, lr}
    976c:	e28db004 	add	fp, sp, #4
    9770:	e24dd030 	sub	sp, sp, #48	; 0x30
    9774:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    9778:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    977c:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    int len = IPC_ARG_INFO_BASE_OFFSET;
    9780:	e3a0300c 	mov	r3, #12
    9784:	e50b3008 	str	r3, [fp, #-8]

    int arg_info_offset = len; // start of arg info
    9788:	e51b3008 	ldr	r3, [fp, #-8]
    978c:	e50b300c 	str	r3, [fp, #-12]
    len += argc * sizeof(struct IpcArgInfo);
    9790:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9794:	e1a02103 	lsl	r2, r3, #2
    9798:	e51b3008 	ldr	r3, [fp, #-8]
    979c:	e0823003 	add	r3, r2, r3
    97a0:	e50b3008 	str	r3, [fp, #-8]

    int arg_buf_offset = len; // start of arg buffer
    97a4:	e51b3008 	ldr	r3, [fp, #-8]
    97a8:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    97ac:	e3a03000 	mov	r3, #0
    97b0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    97b4:	ea00000a 	b	97e4 <new_ipc_msg+0x7c>
        len += arg_size[i];
    97b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    97bc:	e1a03103 	lsl	r3, r3, #2
    97c0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    97c4:	e0823003 	add	r3, r2, r3
    97c8:	e5933000 	ldr	r3, [r3]
    97cc:	e51b2008 	ldr	r2, [fp, #-8]
    97d0:	e0823003 	add	r3, r2, r3
    97d4:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < argc; i++) {
    97d8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    97dc:	e2833001 	add	r3, r3, #1
    97e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    97e4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    97e8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    97ec:	e1520003 	cmp	r2, r3
    97f0:	bafffff0 	blt	97b8 <new_ipc_msg+0x50>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    97f4:	e51b1008 	ldr	r1, [fp, #-8]
    97f8:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    97fc:	eb00026d 	bl	a1b8 <session_alloc_buf>
    9800:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (buf == NULL) {
    9804:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9808:	e3530000 	cmp	r3, #0
    980c:	1a000001 	bne	9818 <new_ipc_msg+0xb0>
        return NULL;
    9810:	e3a03000 	mov	r3, #0
    9814:	ea00003d 	b	9910 <new_ipc_msg+0x1a8>
    }
    buf->header.len = len;
    9818:	e51b3008 	ldr	r3, [fp, #-8]
    981c:	e6ff2073 	uxth	r2, r3
    9820:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9824:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.done = 0;
    9828:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    982c:	e5d23000 	ldrb	r3, [r2]
    9830:	e7c1309f 	bfc	r3, #1, #1
    9834:	e5c23000 	strb	r3, [r2]
    buf->header.valid = 0;
    9838:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    983c:	e5d23000 	ldrb	r3, [r2]
    9840:	e7c0301f 	bfc	r3, #0, #1
    9844:	e5c23000 	strb	r3, [r2]

    for (int i = 0; i < argc; i++) {
    9848:	e3a03000 	mov	r3, #0
    984c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9850:	ea00001d 	b	98cc <new_ipc_msg+0x164>
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    9854:	e51b300c 	ldr	r3, [fp, #-12]
    9858:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    985c:	e0823003 	add	r3, r2, r3
    9860:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        arg_info->len = arg_size[i];
    9864:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9868:	e1a03103 	lsl	r3, r3, #2
    986c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9870:	e0823003 	add	r3, r2, r3
    9874:	e5933000 	ldr	r3, [r3]
    9878:	e6ff2073 	uxth	r2, r3
    987c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9880:	e1c320b2 	strh	r2, [r3, #2]
        arg_info->offset = arg_buf_offset;
    9884:	e51b3010 	ldr	r3, [fp, #-16]
    9888:	e6ff2073 	uxth	r2, r3
    988c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9890:	e1c320b0 	strh	r2, [r3]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    9894:	e51b300c 	ldr	r3, [fp, #-12]
    9898:	e2833004 	add	r3, r3, #4
    989c:	e50b300c 	str	r3, [fp, #-12]
        arg_buf_offset += arg_size[i];
    98a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    98a4:	e1a03103 	lsl	r3, r3, #2
    98a8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    98ac:	e0823003 	add	r3, r2, r3
    98b0:	e5933000 	ldr	r3, [r3]
    98b4:	e51b2010 	ldr	r2, [fp, #-16]
    98b8:	e0823003 	add	r3, r2, r3
    98bc:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    98c0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    98c4:	e2833001 	add	r3, r3, #1
    98c8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    98cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    98d0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    98d4:	e1520003 	cmp	r2, r3
    98d8:	baffffdd 	blt	9854 <new_ipc_msg+0xec>
    }
    buf->header.nr_args = argc;
    98dc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    98e0:	e6ef3073 	uxtb	r3, r3
    98e4:	e203300f 	and	r3, r3, #15
    98e8:	e6ef1073 	uxtb	r1, r3
    98ec:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    98f0:	e5d23000 	ldrb	r3, [r2]
    98f4:	e7c73211 	bfi	r3, r1, #4, #4
    98f8:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
    98fc:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    9900:	e5d23000 	ldrb	r3, [r2]
    9904:	e3833004 	orr	r3, r3, #4
    9908:	e5c23000 	strb	r3, [r2]
    return buf;
    990c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    9910:	e1a00003 	mov	r0, r3
    9914:	e24bd004 	sub	sp, fp, #4
    9918:	e8bd8800 	pop	{fp, pc}

0000991c <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    991c:	e92d4800 	push	{fp, lr}
    9920:	e28db004 	add	fp, sp, #4
    9924:	e24dd020 	sub	sp, sp, #32
    9928:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    992c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    9930:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    9934:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    9938:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    993c:	e5d33000 	ldrb	r3, [r3]
    9940:	e7e33253 	ubfx	r3, r3, #4, #4
    9944:	e6ef3073 	uxtb	r3, r3
    9948:	e1a02003 	mov	r2, r3
    994c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9950:	e1520003 	cmp	r2, r3
    9954:	ca00000b 	bgt	9988 <ipc_msg_set_nth_arg+0x6c>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
    9958:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    995c:	e5d33000 	ldrb	r3, [r3]
    9960:	e7e33253 	ubfx	r3, r3, #4, #4
    9964:	e6ef3073 	uxtb	r3, r3
    9968:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    996c:	e30010bc 	movw	r1, #188	; 0xbc
    9970:	e3401001 	movt	r1, #1
    9974:	e30f0f54 	movw	r0, #65364	; 0xff54
    9978:	e3400000 	movt	r0, #0
    997c:	eb000364 	bl	a714 <printf>
        return false;
    9980:	e3a03000 	mov	r3, #0
    9984:	ea000029 	b	9a30 <ipc_msg_set_nth_arg+0x114>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    9988:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    998c:	e2833003 	add	r3, r3, #3
    9990:	e1a03103 	lsl	r3, r3, #2
    9994:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    9998:	e0823003 	add	r3, r2, r3
    999c:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    99a0:	e51b3008 	ldr	r3, [fp, #-8]
    99a4:	e1d330b2 	ldrh	r3, [r3, #2]
    99a8:	e1a02003 	mov	r2, r3
    99ac:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    99b0:	e1520003 	cmp	r2, r3
    99b4:	aa000009 	bge	99e0 <ipc_msg_set_nth_arg+0xc4>
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
    99b8:	e51b3008 	ldr	r3, [fp, #-8]
    99bc:	e1d330b2 	ldrh	r3, [r3, #2]
    99c0:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    99c4:	e30010bc 	movw	r1, #188	; 0xbc
    99c8:	e3401001 	movt	r1, #1
    99cc:	e30f0f94 	movw	r0, #65428	; 0xff94
    99d0:	e3400000 	movt	r0, #0
    99d4:	eb00034e 	bl	a714 <printf>
        return false;
    99d8:	e3a03000 	mov	r3, #0
    99dc:	ea000013 	b	9a30 <ipc_msg_set_nth_arg+0x114>
    99e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    99e4:	e50b3010 	str	r3, [fp, #-16]
    99e8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    99ec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    99f0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    99f4:	e2833003 	add	r3, r3, #3
    99f8:	e1a03103 	lsl	r3, r3, #2
    99fc:	e51b2010 	ldr	r2, [fp, #-16]
    9a00:	e0823003 	add	r3, r2, r3
    9a04:	e1d330b0 	ldrh	r3, [r3]
    9a08:	e1a02003 	mov	r2, r3
    9a0c:	e51b3010 	ldr	r3, [fp, #-16]
    9a10:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    9a14:	e50b300c 	str	r3, [fp, #-12]
    memmove(buf, data, len);
    9a18:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9a1c:	e1a02003 	mov	r2, r3
    9a20:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    9a24:	e51b000c 	ldr	r0, [fp, #-12]
    9a28:	eb0005fe 	bl	b228 <memmove>
    return true;
    9a2c:	e3a03001 	mov	r3, #1
}
    9a30:	e1a00003 	mov	r0, r3
    9a34:	e24bd004 	sub	sp, fp, #4
    9a38:	e8bd8800 	pop	{fp, pc}

00009a3c <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    9a3c:	e92d4800 	push	{fp, lr}
    9a40:	e28db004 	add	fp, sp, #4
    9a44:	e24dd020 	sub	sp, sp, #32
    9a48:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9a4c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    9a50:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    9a54:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    9a58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9a5c:	e5d33000 	ldrb	r3, [r3]
    9a60:	e7e33253 	ubfx	r3, r3, #4, #4
    9a64:	e6ef3073 	uxtb	r3, r3
    9a68:	e1a02003 	mov	r2, r3
    9a6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9a70:	e1520003 	cmp	r2, r3
    9a74:	ca000006 	bgt	9a94 <ipc_msg_get_nth_arg+0x58>
        printf("[%s] IPC: arg_num out of msg range", __func__);
    9a78:	e30010d0 	movw	r1, #208	; 0xd0
    9a7c:	e3401001 	movt	r1, #1
    9a80:	e30f0fd8 	movw	r0, #65496	; 0xffd8
    9a84:	e3400000 	movt	r0, #0
    9a88:	eb000321 	bl	a714 <printf>
        return false;
    9a8c:	e3a03000 	mov	r3, #0
    9a90:	ea000026 	b	9b30 <ipc_msg_get_nth_arg+0xf4>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    9a94:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9a98:	e2833003 	add	r3, r3, #3
    9a9c:	e1a03103 	lsl	r3, r3, #2
    9aa0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    9aa4:	e0823003 	add	r3, r2, r3
    9aa8:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    9aac:	e51b3008 	ldr	r3, [fp, #-8]
    9ab0:	e1d330b2 	ldrh	r3, [r3, #2]
    9ab4:	e1a02003 	mov	r2, r3
    9ab8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9abc:	e1520003 	cmp	r2, r3
    9ac0:	aa000006 	bge	9ae0 <ipc_msg_get_nth_arg+0xa4>
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    9ac4:	e30010d0 	movw	r1, #208	; 0xd0
    9ac8:	e3401001 	movt	r1, #1
    9acc:	e30f0ffc 	movw	r0, #65532	; 0xfffc
    9ad0:	e3400000 	movt	r0, #0
    9ad4:	eb00030e 	bl	a714 <printf>
        return false;
    9ad8:	e3a03000 	mov	r3, #0
    9adc:	ea000013 	b	9b30 <ipc_msg_get_nth_arg+0xf4>
    9ae0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9ae4:	e50b3010 	str	r3, [fp, #-16]
    9ae8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9aec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    9af0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9af4:	e2833003 	add	r3, r3, #3
    9af8:	e1a03103 	lsl	r3, r3, #2
    9afc:	e51b2010 	ldr	r2, [fp, #-16]
    9b00:	e0823003 	add	r3, r2, r3
    9b04:	e1d330b0 	ldrh	r3, [r3]
    9b08:	e1a02003 	mov	r2, r3
    9b0c:	e51b3010 	ldr	r3, [fp, #-16]
    9b10:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    9b14:	e50b300c 	str	r3, [fp, #-12]
    memmove(data, buf, len);
    9b18:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9b1c:	e1a02003 	mov	r2, r3
    9b20:	e51b100c 	ldr	r1, [fp, #-12]
    9b24:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9b28:	eb0005be 	bl	b228 <memmove>
    return true;
    9b2c:	e3a03001 	mov	r3, #1
}
    9b30:	e1a00003 	mov	r0, r3
    9b34:	e24bd004 	sub	sp, fp, #4
    9b38:	e8bd8800 	pop	{fp, pc}

00009b3c <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    9b3c:	e92d4800 	push	{fp, lr}
    9b40:	e28db004 	add	fp, sp, #4
    9b44:	e24dd008 	sub	sp, sp, #8
    9b48:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    9b4c:	e51b2008 	ldr	r2, [fp, #-8]
    9b50:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9b54:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    9b58:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    9b5c:	e51b2008 	ldr	r2, [fp, #-8]
    9b60:	e5d23000 	ldrb	r3, [r2]
    9b64:	e3833001 	orr	r3, r3, #1
    9b68:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    9b6c:	e51b2008 	ldr	r2, [fp, #-8]
    9b70:	e5d23000 	ldrb	r3, [r2]
    9b74:	e7c1309f 	bfc	r3, #1, #1
    9b78:	e5c23000 	strb	r3, [r2]
    while (msg->header.done == 0) {
    9b7c:	ea000000 	b	9b84 <ipc_msg_send_wait+0x48>
        /// @todo syscall yield with prio decrease
        yield();
    9b80:	eb0003b1 	bl	aa4c <yield>
    while (msg->header.done == 0) {
    9b84:	e51b3008 	ldr	r3, [fp, #-8]
    9b88:	e5d33000 	ldrb	r3, [r3]
    9b8c:	e2033002 	and	r3, r3, #2
    9b90:	e6ef3073 	uxtb	r3, r3
    9b94:	e3530000 	cmp	r3, #0
    9b98:	0afffff8 	beq	9b80 <ipc_msg_send_wait+0x44>
    }
    assert(msg->header.done == 1);
    9b9c:	e51b3008 	ldr	r3, [fp, #-8]
    9ba0:	e5d33000 	ldrb	r3, [r3]
    9ba4:	e2033002 	and	r3, r3, #2
    9ba8:	e6ef3073 	uxtb	r3, r3
    9bac:	e3530000 	cmp	r3, #0
    9bb0:	1a000007 	bne	9bd4 <ipc_msg_send_wait+0x98>
    9bb4:	e3003028 	movw	r3, #40	; 0x28
    9bb8:	e3403001 	movt	r3, #1
    9bbc:	e30020e4 	movw	r2, #228	; 0xe4
    9bc0:	e3402001 	movt	r2, #1
    9bc4:	e3a0107e 	mov	r1, #126	; 0x7e
    9bc8:	e3000040 	movw	r0, #64	; 0x40
    9bcc:	e3400001 	movt	r0, #1
    9bd0:	eb0004fb 	bl	afc4 <__assert_func>
}
    9bd4:	e320f000 	nop	{0}
    9bd8:	e24bd004 	sub	sp, fp, #4
    9bdc:	e8bd8800 	pop	{fp, pc}

00009be0 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    9be0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9be4:	e28db000 	add	fp, sp, #0
    9be8:	e24dd00c 	sub	sp, sp, #12
    9bec:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    9bf0:	e51b2008 	ldr	r2, [fp, #-8]
    9bf4:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9bf8:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    9bfc:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    9c00:	e51b2008 	ldr	r2, [fp, #-8]
    9c04:	e5d23000 	ldrb	r3, [r2]
    9c08:	e3833001 	orr	r3, r3, #1
    9c0c:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    9c10:	e51b2008 	ldr	r2, [fp, #-8]
    9c14:	e5d23000 	ldrb	r3, [r2]
    9c18:	e7c1309f 	bfc	r3, #1, #1
    9c1c:	e5c23000 	strb	r3, [r2]
}
    9c20:	e320f000 	nop	{0}
    9c24:	e28bd000 	add	sp, fp, #0
    9c28:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9c2c:	e12fff1e 	bx	lr

00009c30 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    9c30:	e92d4800 	push	{fp, lr}
    9c34:	e28db004 	add	fp, sp, #4
    9c38:	e24dd010 	sub	sp, sp, #16
    9c3c:	e50b0010 	str	r0, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9c40:	e51b3010 	ldr	r3, [fp, #-16]
    9c44:	e5933010 	ldr	r3, [r3, #16]
    9c48:	e51b2010 	ldr	r2, [fp, #-16]
    9c4c:	e5922008 	ldr	r2, [r2, #8]
    9c50:	e0833002 	add	r3, r3, r2
    9c54:	e50b3008 	str	r3, [fp, #-8]
    while (msg->header.done == 0) {
    9c58:	ea000000 	b	9c60 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield();
    9c5c:	eb00037a 	bl	aa4c <yield>
    while (msg->header.done == 0) {
    9c60:	e51b3008 	ldr	r3, [fp, #-8]
    9c64:	e5d33000 	ldrb	r3, [r3]
    9c68:	e2033002 	and	r3, r3, #2
    9c6c:	e6ef3073 	uxtb	r3, r3
    9c70:	e3530000 	cmp	r3, #0
    9c74:	0afffff8 	beq	9c5c <ipc_session_wait+0x2c>
    }
    assert(msg->header.done == 1);
    9c78:	e51b3008 	ldr	r3, [fp, #-8]
    9c7c:	e5d33000 	ldrb	r3, [r3]
    9c80:	e2033002 	and	r3, r3, #2
    9c84:	e6ef3073 	uxtb	r3, r3
    9c88:	e3530000 	cmp	r3, #0
    9c8c:	1a000007 	bne	9cb0 <ipc_session_wait+0x80>
    9c90:	e3003028 	movw	r3, #40	; 0x28
    9c94:	e3403001 	movt	r3, #1
    9c98:	e30020f8 	movw	r2, #248	; 0xf8
    9c9c:	e3402001 	movt	r2, #1
    9ca0:	e3a0108f 	mov	r1, #143	; 0x8f
    9ca4:	e3000040 	movw	r0, #64	; 0x40
    9ca8:	e3400001 	movt	r0, #1
    9cac:	eb0004c4 	bl	afc4 <__assert_func>
    return msg->header.ret_val;
    9cb0:	e51b3008 	ldr	r3, [fp, #-8]
    9cb4:	e5933008 	ldr	r3, [r3, #8]
}
    9cb8:	e1a00003 	mov	r0, r3
    9cbc:	e24bd004 	sub	sp, fp, #4
    9cc0:	e8bd8800 	pop	{fp, pc}

00009cc4 <cur_session_id>:

static int cur_sess_id = -1;
int cur_session_id(void)
{
    9cc4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9cc8:	e28db000 	add	fp, sp, #0
    return cur_sess_id;
    9ccc:	e300336c 	movw	r3, #876	; 0x36c
    9cd0:	e3403001 	movt	r3, #1
    9cd4:	e5933000 	ldr	r3, [r3]
}
    9cd8:	e1a00003 	mov	r0, r3
    9cdc:	e28bd000 	add	sp, fp, #0
    9ce0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9ce4:	e12fff1e 	bx	lr

00009ce8 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    9ce8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    9cec:	e28db000 	add	fp, sp, #0
    session_delayed = true;
    9cf0:	e3003d48 	movw	r3, #3400	; 0xd48
    9cf4:	e3403001 	movt	r3, #1
    9cf8:	e3a02001 	mov	r2, #1
    9cfc:	e5c32000 	strb	r2, [r3]
}
    9d00:	e320f000 	nop	{0}
    9d04:	e28bd000 	add	sp, fp, #0
    9d08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    9d0c:	e12fff1e 	bx	lr

00009d10 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    9d10:	e92d4810 	push	{r4, fp, lr}
    9d14:	e28db008 	add	fp, sp, #8
    9d18:	e24ddf5d 	sub	sp, sp, #372	; 0x174
    9d1c:	e50b0178 	str	r0, [fp, #-376]	; 0xfffffe88
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
    9d20:	e24b3e17 	sub	r3, fp, #368	; 0x170
    9d24:	e3a01010 	mov	r1, #16
    9d28:	e1a00003 	mov	r0, r3
    9d2c:	eb000375 	bl	ab08 <poll_session>
        /* handle each session */
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    9d30:	e3a03000 	mov	r3, #0
    9d34:	e50b3010 	str	r3, [fp, #-16]
    9d38:	ea000102 	b	a148 <ipc_server_loop+0x438>
            if (session_list[i].buf == NULL) {
    9d3c:	e51b2010 	ldr	r2, [fp, #-16]
    9d40:	e1a03002 	mov	r3, r2
    9d44:	e1a03103 	lsl	r3, r3, #2
    9d48:	e0833002 	add	r3, r3, r2
    9d4c:	e1a03103 	lsl	r3, r3, #2
    9d50:	e24b200c 	sub	r2, fp, #12
    9d54:	e0823003 	add	r3, r2, r3
    9d58:	e2433f55 	sub	r3, r3, #340	; 0x154
    9d5c:	e5933000 	ldr	r3, [r3]
    9d60:	e3530000 	cmp	r3, #0
    9d64:	1a000001 	bne	9d70 <ipc_server_loop+0x60>
                yield();
    9d68:	eb000337 	bl	aa4c <yield>
                break;
    9d6c:	ea0000f8 	b	a154 <ipc_server_loop+0x444>
            }
            cur_sess_id = session_list[i].id;
    9d70:	e51b2010 	ldr	r2, [fp, #-16]
    9d74:	e1a03002 	mov	r3, r2
    9d78:	e1a03103 	lsl	r3, r3, #2
    9d7c:	e0833002 	add	r3, r3, r2
    9d80:	e1a03103 	lsl	r3, r3, #2
    9d84:	e24b200c 	sub	r2, fp, #12
    9d88:	e0823003 	add	r3, r2, r3
    9d8c:	e2433f59 	sub	r3, r3, #356	; 0x164
    9d90:	e5932000 	ldr	r2, [r3]
    9d94:	e300336c 	movw	r3, #876	; 0x36c
    9d98:	e3403001 	movt	r3, #1
    9d9c:	e5832000 	str	r2, [r3]
            struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
    9da0:	e51b2010 	ldr	r2, [fp, #-16]
    9da4:	e1a03002 	mov	r3, r2
    9da8:	e1a03103 	lsl	r3, r3, #2
    9dac:	e0833002 	add	r3, r3, r2
    9db0:	e1a03103 	lsl	r3, r3, #2
    9db4:	e24b200c 	sub	r2, fp, #12
    9db8:	e0823003 	add	r3, r2, r3
    9dbc:	e2433f55 	sub	r3, r3, #340	; 0x154
    9dc0:	e5931000 	ldr	r1, [r3]
    9dc4:	e51b2010 	ldr	r2, [fp, #-16]
    9dc8:	e1a03002 	mov	r3, r2
    9dcc:	e1a03103 	lsl	r3, r3, #2
    9dd0:	e0833002 	add	r3, r3, r2
    9dd4:	e1a03103 	lsl	r3, r3, #2
    9dd8:	e24b200c 	sub	r2, fp, #12
    9ddc:	e0823003 	add	r3, r2, r3
    9de0:	e2433f57 	sub	r3, r3, #348	; 0x15c
    9de4:	e5933000 	ldr	r3, [r3]
    9de8:	e0813003 	add	r3, r1, r3
    9dec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            /* handle every message in current session
                a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                interfaces[opcode] should explicitly call delay_session() and return to delay this session
            */
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    9df0:	ea0000b9 	b	a0dc <ipc_server_loop+0x3cc>
                // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
    9df4:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9df8:	e51b2010 	ldr	r2, [fp, #-16]
    9dfc:	e1a03002 	mov	r3, r2
    9e00:	e1a03103 	lsl	r3, r3, #2
    9e04:	e0833002 	add	r3, r3, r2
    9e08:	e1a03103 	lsl	r3, r3, #2
    9e0c:	e0813003 	add	r3, r1, r3
    9e10:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9e14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e18:	e593200c 	ldr	r2, [r3, #12]
    9e1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e20:	e5933004 	ldr	r3, [r3, #4]
    9e24:	e0822003 	add	r2, r2, r3
    9e28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e2c:	e5933008 	ldr	r3, [r3, #8]
    9e30:	e0422003 	sub	r2, r2, r3
    9e34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9e38:	e5933004 	ldr	r3, [r3, #4]
    9e3c:	e1a01003 	mov	r1, r3
    9e40:	e1a00002 	mov	r0, r2
    9e44:	eb000455 	bl	afa0 <__aeabi_idivmod>
    9e48:	e1a03001 	mov	r3, r1
    9e4c:	e3530000 	cmp	r3, #0
    9e50:	1a000038 	bne	9f38 <ipc_server_loop+0x228>
    9e54:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9e58:	e51b2010 	ldr	r2, [fp, #-16]
    9e5c:	e1a03002 	mov	r3, r2
    9e60:	e1a03103 	lsl	r3, r3, #2
    9e64:	e0833002 	add	r3, r3, r2
    9e68:	e1a03103 	lsl	r3, r3, #2
    9e6c:	e0813003 	add	r3, r1, r3
    9e70:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9e74:	e1d220b2 	ldrh	r2, [r2, #2]
    9e78:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    9e7c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    9e80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9e84:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
}

__attribute__((__always_inline__)) static inline int session_remain_capacity(struct Session* session)
{
    return session->capacity - session_used_size(session);
    9e88:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9e8c:	e5934004 	ldr	r4, [r3, #4]
    9e90:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9e94:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9e98:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9e9c:	e593200c 	ldr	r2, [r3, #12]
    9ea0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9ea4:	e5933004 	ldr	r3, [r3, #4]
    9ea8:	e0822003 	add	r2, r2, r3
    9eac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9eb0:	e5933008 	ldr	r3, [r3, #8]
    9eb4:	e0422003 	sub	r2, r2, r3
    9eb8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9ebc:	e5933004 	ldr	r3, [r3, #4]
    9ec0:	e1a01003 	mov	r1, r3
    9ec4:	e1a00002 	mov	r0, r2
    9ec8:	eb000434 	bl	afa0 <__aeabi_idivmod>
    9ecc:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    9ed0:	e0443003 	sub	r3, r4, r3
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    9ed4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    9ed8:	e1520003 	cmp	r2, r3
    9edc:	da000004 	ble	9ef4 <ipc_server_loop+0x1e4>
        printf("forward tail with too much size\n");
    9ee0:	e300004c 	movw	r0, #76	; 0x4c
    9ee4:	e3400001 	movt	r0, #1
    9ee8:	eb000209 	bl	a714 <printf>
        return -1;
    9eec:	e3e03000 	mvn	r3, #0
    9ef0:	ea00000e 	b	9f30 <ipc_server_loop+0x220>
    }
    session->tail = (session->tail + len) % session->capacity;
    9ef4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9ef8:	e593200c 	ldr	r2, [r3, #12]
    9efc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9f00:	e0822003 	add	r2, r2, r3
    9f04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9f08:	e5933004 	ldr	r3, [r3, #4]
    9f0c:	e1a01003 	mov	r1, r3
    9f10:	e1a00002 	mov	r0, r2
    9f14:	eb000421 	bl	afa0 <__aeabi_idivmod>
    9f18:	e1a03001 	mov	r3, r1
    9f1c:	e1a02003 	mov	r2, r3
    9f20:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9f24:	e583200c 	str	r2, [r3, #12]
    return session->tail;
    9f28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9f2c:	e593300c 	ldr	r3, [r3, #12]
    9f30:	e3530000 	cmp	r3, #0
    9f34:	ba00007b 	blt	a128 <ipc_server_loop+0x418>
                    break;
                }
                if (ipc_node->interfaces[msg->header.opcode]) {
    9f38:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9f3c:	e5d33001 	ldrb	r3, [r3, #1]
    9f40:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    9f44:	e1a03103 	lsl	r3, r3, #2
    9f48:	e0823003 	add	r3, r2, r3
    9f4c:	e5933004 	ldr	r3, [r3, #4]
    9f50:	e3530000 	cmp	r3, #0
    9f54:	0a000011 	beq	9fa0 <ipc_server_loop+0x290>
                    ipc_node->interfaces[msg->header.opcode](msg);
    9f58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9f5c:	e5d33001 	ldrb	r3, [r3, #1]
    9f60:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    9f64:	e1a03103 	lsl	r3, r3, #2
    9f68:	e0823003 	add	r3, r2, r3
    9f6c:	e5933004 	ldr	r3, [r3, #4]
    9f70:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    9f74:	e12fff33 	blx	r3
                    // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                    if (session_delayed) {
    9f78:	e3003d48 	movw	r3, #3400	; 0xd48
    9f7c:	e3403001 	movt	r3, #1
    9f80:	e5d33000 	ldrb	r3, [r3]
    9f84:	e3530000 	cmp	r3, #0
    9f88:	0a00000f 	beq	9fcc <ipc_server_loop+0x2bc>
                        session_delayed = false;
    9f8c:	e3003d48 	movw	r3, #3400	; 0xd48
    9f90:	e3403001 	movt	r3, #1
    9f94:	e3a02000 	mov	r2, #0
    9f98:	e5c32000 	strb	r2, [r3]
                        break;
    9f9c:	ea000062 	b	a12c <ipc_server_loop+0x41c>
                    }
                } else {
                    printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
    9fa0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9fa4:	e5d33001 	ldrb	r3, [r3, #1]
    9fa8:	e1a01003 	mov	r1, r3
    9fac:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    9fb0:	e5933000 	ldr	r3, [r3]
    9fb4:	e1a02003 	mov	r2, r3
    9fb8:	e3000070 	movw	r0, #112	; 0x70
    9fbc:	e3400001 	movt	r0, #1
    9fc0:	eb0001d3 	bl	a714 <printf>
                }
                // finish this message in server's perspective
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    9fc4:	ea000000 	b	9fcc <ipc_server_loop+0x2bc>
                    yield();
    9fc8:	eb00029f 	bl	aa4c <yield>
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    9fcc:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9fd0:	e51b2010 	ldr	r2, [fp, #-16]
    9fd4:	e1a03002 	mov	r3, r2
    9fd8:	e1a03103 	lsl	r3, r3, #2
    9fdc:	e0833002 	add	r3, r3, r2
    9fe0:	e1a03103 	lsl	r3, r3, #2
    9fe4:	e0813003 	add	r3, r1, r3
    9fe8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9fec:	e1d220b2 	ldrh	r2, [r2, #2]
    9ff0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9ff4:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    if (((session->head + len) % session->capacity) > session->tail) {
    9ff8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9ffc:	e5932008 	ldr	r2, [r3, #8]
    a000:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a004:	e0822003 	add	r2, r2, r3
    a008:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a00c:	e5933004 	ldr	r3, [r3, #4]
    a010:	e1a01003 	mov	r1, r3
    a014:	e1a00002 	mov	r0, r2
    a018:	eb0003e0 	bl	afa0 <__aeabi_idivmod>
    a01c:	e1a03001 	mov	r3, r1
    a020:	e1a02003 	mov	r2, r3
    a024:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a028:	e593300c 	ldr	r3, [r3, #12]
    a02c:	e1520003 	cmp	r2, r3
    a030:	da000004 	ble	a048 <ipc_server_loop+0x338>
        printf("forward head with too much size\n");
    a034:	e3000098 	movw	r0, #152	; 0x98
    a038:	e3400001 	movt	r0, #1
    a03c:	eb0001b4 	bl	a714 <printf>
        return -1;
    a040:	e3e03000 	mvn	r3, #0
    a044:	ea00000e 	b	a084 <ipc_server_loop+0x374>
    session->head = (session->head + len) % session->capacity;
    a048:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a04c:	e5932008 	ldr	r2, [r3, #8]
    a050:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a054:	e0822003 	add	r2, r2, r3
    a058:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a05c:	e5933004 	ldr	r3, [r3, #4]
    a060:	e1a01003 	mov	r1, r3
    a064:	e1a00002 	mov	r0, r2
    a068:	eb0003cc 	bl	afa0 <__aeabi_idivmod>
    a06c:	e1a03001 	mov	r3, r1
    a070:	e1a02003 	mov	r2, r3
    a074:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a078:	e5832008 	str	r2, [r3, #8]
    return session->head;
    a07c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a080:	e5933008 	ldr	r3, [r3, #8]
    a084:	e3530000 	cmp	r3, #0
    a088:	baffffce 	blt	9fc8 <ipc_server_loop+0x2b8>
                }
                msg = IPCSESSION_MSG(&session_list[i]);
    a08c:	e51b2010 	ldr	r2, [fp, #-16]
    a090:	e1a03002 	mov	r3, r2
    a094:	e1a03103 	lsl	r3, r3, #2
    a098:	e0833002 	add	r3, r3, r2
    a09c:	e1a03103 	lsl	r3, r3, #2
    a0a0:	e24b200c 	sub	r2, fp, #12
    a0a4:	e0823003 	add	r3, r2, r3
    a0a8:	e2433f55 	sub	r3, r3, #340	; 0x154
    a0ac:	e5931000 	ldr	r1, [r3]
    a0b0:	e51b2010 	ldr	r2, [fp, #-16]
    a0b4:	e1a03002 	mov	r3, r2
    a0b8:	e1a03103 	lsl	r3, r3, #2
    a0bc:	e0833002 	add	r3, r3, r2
    a0c0:	e1a03103 	lsl	r3, r3, #2
    a0c4:	e24b200c 	sub	r2, fp, #12
    a0c8:	e0823003 	add	r3, r2, r3
    a0cc:	e2433f57 	sub	r3, r3, #348	; 0x15c
    a0d0:	e5933000 	ldr	r3, [r3]
    a0d4:	e0813003 	add	r3, r1, r3
    a0d8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    a0dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a0e0:	e5932004 	ldr	r2, [r3, #4]
    a0e4:	e30d3cba 	movw	r3, #56506	; 0xdcba
    a0e8:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    a0ec:	e1520003 	cmp	r2, r3
    a0f0:	1a00000d 	bne	a12c <ipc_server_loop+0x41c>
    a0f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a0f8:	e5d33000 	ldrb	r3, [r3]
    a0fc:	e2033001 	and	r3, r3, #1
    a100:	e6ef3073 	uxtb	r3, r3
    a104:	e3530000 	cmp	r3, #0
    a108:	0a000007 	beq	a12c <ipc_server_loop+0x41c>
    a10c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a110:	e5d33000 	ldrb	r3, [r3]
    a114:	e2033002 	and	r3, r3, #2
    a118:	e6ef3073 	uxtb	r3, r3
    a11c:	e3530000 	cmp	r3, #0
    a120:	0affff33 	beq	9df4 <ipc_server_loop+0xe4>
    a124:	ea000000 	b	a12c <ipc_server_loop+0x41c>
                    break;
    a128:	e320f000 	nop	{0}
            }
            // stop handle this session
            cur_sess_id = -1;
    a12c:	e300336c 	movw	r3, #876	; 0x36c
    a130:	e3403001 	movt	r3, #1
    a134:	e3e02000 	mvn	r2, #0
    a138:	e5832000 	str	r2, [r3]
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    a13c:	e51b3010 	ldr	r3, [fp, #-16]
    a140:	e2833001 	add	r3, r3, #1
    a144:	e50b3010 	str	r3, [fp, #-16]
    a148:	e51b3010 	ldr	r3, [fp, #-16]
    a14c:	e353000f 	cmp	r3, #15
    a150:	dafffef9 	ble	9d3c <ipc_server_loop+0x2c>
        poll_session(session_list, NR_MAX_SESSION);
    a154:	eafffef1 	b	9d20 <ipc_server_loop+0x10>

0000a158 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    a158:	e92d4800 	push	{fp, lr}
    a15c:	e28db004 	add	fp, sp, #4
    a160:	e24dd010 	sub	sp, sp, #16
    a164:	e50b0008 	str	r0, [fp, #-8]
    a168:	e50b100c 	str	r1, [fp, #-12]
    a16c:	e50b2010 	str	r2, [fp, #-16]
    return session(_path, _capacity, _session);
    a170:	e51b2008 	ldr	r2, [fp, #-8]
    a174:	e51b1010 	ldr	r1, [fp, #-16]
    a178:	e51b000c 	ldr	r0, [fp, #-12]
    a17c:	eb00024f 	bl	aac0 <session>
    a180:	e1a03000 	mov	r3, r0
}
    a184:	e1a00003 	mov	r0, r3
    a188:	e24bd004 	sub	sp, fp, #4
    a18c:	e8bd8800 	pop	{fp, pc}

0000a190 <free_session>:

int free_session(struct Session* session)
{
    a190:	e92d4800 	push	{fp, lr}
    a194:	e28db004 	add	fp, sp, #4
    a198:	e24dd008 	sub	sp, sp, #8
    a19c:	e50b0008 	str	r0, [fp, #-8]
    return close_session(session);
    a1a0:	e51b0008 	ldr	r0, [fp, #-8]
    a1a4:	eb000267 	bl	ab48 <close_session>
    a1a8:	e1a03000 	mov	r3, r0
}
    a1ac:	e1a00003 	mov	r0, r3
    a1b0:	e24bd004 	sub	sp, fp, #4
    a1b4:	e8bd8800 	pop	{fp, pc}

0000a1b8 <session_alloc_buf>:

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    a1b8:	e92d4810 	push	{r4, fp, lr}
    a1bc:	e28db008 	add	fp, sp, #8
    a1c0:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    a1c4:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    a1c8:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    a1cc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a1d0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return session->capacity - session_used_size(session);
    a1d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a1d8:	e5934004 	ldr	r4, [r3, #4]
    a1dc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a1e0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    a1e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a1e8:	e593200c 	ldr	r2, [r3, #12]
    a1ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a1f0:	e5933004 	ldr	r3, [r3, #4]
    a1f4:	e0822003 	add	r2, r2, r3
    a1f8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a1fc:	e5933008 	ldr	r3, [r3, #8]
    a200:	e0422003 	sub	r2, r2, r3
    a204:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a208:	e5933004 	ldr	r3, [r3, #4]
    a20c:	e1a01003 	mov	r1, r3
    a210:	e1a00002 	mov	r0, r2
    a214:	eb000361 	bl	afa0 <__aeabi_idivmod>
    a218:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    a21c:	e0442003 	sub	r2, r4, r3
    if (len > session_remain_capacity(session)) {
    a220:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a224:	e1520003 	cmp	r2, r3
    a228:	aa000001 	bge	a234 <session_alloc_buf+0x7c>
        return NULL;
    a22c:	e3a03000 	mov	r3, #0
    a230:	ea000038 	b	a318 <session_alloc_buf+0x160>
    }
    void* buf = session->buf + session->tail;
    a234:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a238:	e5933010 	ldr	r3, [r3, #16]
    a23c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    a240:	e592200c 	ldr	r2, [r2, #12]
    a244:	e0833002 	add	r3, r3, r2
    a248:	e50b3010 	str	r3, [fp, #-16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    a24c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a250:	e1a02003 	mov	r2, r3
    a254:	e3a01000 	mov	r1, #0
    a258:	e51b0010 	ldr	r0, [fp, #-16]
    a25c:	eb000443 	bl	b370 <memset>
    a260:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a264:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    a268:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a26c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a270:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a274:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a278:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    a27c:	e5934004 	ldr	r4, [r3, #4]
    a280:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    a284:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    a288:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a28c:	e593200c 	ldr	r2, [r3, #12]
    a290:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a294:	e5933004 	ldr	r3, [r3, #4]
    a298:	e0822003 	add	r2, r2, r3
    a29c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a2a0:	e5933008 	ldr	r3, [r3, #8]
    a2a4:	e0422003 	sub	r2, r2, r3
    a2a8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a2ac:	e5933004 	ldr	r3, [r3, #4]
    a2b0:	e1a01003 	mov	r1, r3
    a2b4:	e1a00002 	mov	r0, r2
    a2b8:	eb000338 	bl	afa0 <__aeabi_idivmod>
    a2bc:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    a2c0:	e0443003 	sub	r3, r4, r3
    if (len > session_remain_capacity(session)) {
    a2c4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    a2c8:	e1520003 	cmp	r2, r3
    a2cc:	da000003 	ble	a2e0 <session_alloc_buf+0x128>
        printf("forward tail with too much size\n");
    a2d0:	e300010c 	movw	r0, #268	; 0x10c
    a2d4:	e3400001 	movt	r0, #1
    a2d8:	eb00010d 	bl	a714 <printf>
    a2dc:	ea00000c 	b	a314 <session_alloc_buf+0x15c>
    session->tail = (session->tail + len) % session->capacity;
    a2e0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a2e4:	e593200c 	ldr	r2, [r3, #12]
    a2e8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    a2ec:	e0822003 	add	r2, r2, r3
    a2f0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a2f4:	e5933004 	ldr	r3, [r3, #4]
    a2f8:	e1a01003 	mov	r1, r3
    a2fc:	e1a00002 	mov	r0, r2
    a300:	eb000326 	bl	afa0 <__aeabi_idivmod>
    a304:	e1a03001 	mov	r3, r1
    a308:	e1a02003 	mov	r2, r3
    a30c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a310:	e583200c 	str	r2, [r3, #12]
    session_forward_tail(session, len);
    return buf;
    a314:	e51b3010 	ldr	r3, [fp, #-16]
}
    a318:	e1a00003 	mov	r0, r3
    a31c:	e24bd008 	sub	sp, fp, #8
    a320:	e8bd8810 	pop	{r4, fp, pc}

0000a324 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    a324:	e92d4800 	push	{fp, lr}
    a328:	e28db004 	add	fp, sp, #4
    a32c:	e24dd018 	sub	sp, sp, #24
    a330:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    a334:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    a338:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a33c:	e50b3008 	str	r3, [fp, #-8]
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    a340:	e51b3008 	ldr	r3, [fp, #-8]
    a344:	e593200c 	ldr	r2, [r3, #12]
    a348:	e51b3008 	ldr	r3, [fp, #-8]
    a34c:	e5933004 	ldr	r3, [r3, #4]
    a350:	e0822003 	add	r2, r2, r3
    a354:	e51b3008 	ldr	r3, [fp, #-8]
    a358:	e5933008 	ldr	r3, [r3, #8]
    a35c:	e0422003 	sub	r2, r2, r3
    a360:	e51b3008 	ldr	r3, [fp, #-8]
    a364:	e5933004 	ldr	r3, [r3, #4]
    a368:	e1a01003 	mov	r1, r3
    a36c:	e1a00002 	mov	r0, r2
    a370:	eb00030a 	bl	afa0 <__aeabi_idivmod>
    a374:	e1a03001 	mov	r3, r1
    a378:	e1a02003 	mov	r2, r3
    if (len > session_used_size(session)) {
    a37c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a380:	e1520003 	cmp	r2, r3
    a384:	aa000001 	bge	a390 <session_free_buf+0x6c>
        return false;
    a388:	e3a03000 	mov	r3, #0
    a38c:	ea000031 	b	a458 <session_free_buf+0x134>
    a390:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a394:	e50b300c 	str	r3, [fp, #-12]
    a398:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a39c:	e50b3010 	str	r3, [fp, #-16]
    if (((session->head + len) % session->capacity) > session->tail) {
    a3a0:	e51b300c 	ldr	r3, [fp, #-12]
    a3a4:	e5932008 	ldr	r2, [r3, #8]
    a3a8:	e51b3010 	ldr	r3, [fp, #-16]
    a3ac:	e0822003 	add	r2, r2, r3
    a3b0:	e51b300c 	ldr	r3, [fp, #-12]
    a3b4:	e5933004 	ldr	r3, [r3, #4]
    a3b8:	e1a01003 	mov	r1, r3
    a3bc:	e1a00002 	mov	r0, r2
    a3c0:	eb0002f6 	bl	afa0 <__aeabi_idivmod>
    a3c4:	e1a03001 	mov	r3, r1
    a3c8:	e1a02003 	mov	r2, r3
    a3cc:	e51b300c 	ldr	r3, [fp, #-12]
    a3d0:	e593300c 	ldr	r3, [r3, #12]
    a3d4:	e1520003 	cmp	r2, r3
    a3d8:	da000004 	ble	a3f0 <session_free_buf+0xcc>
        printf("forward head with too much size\n");
    a3dc:	e3000130 	movw	r0, #304	; 0x130
    a3e0:	e3400001 	movt	r0, #1
    a3e4:	eb0000ca 	bl	a714 <printf>
        return -1;
    a3e8:	e3e03000 	mvn	r3, #0
    a3ec:	ea00000e 	b	a42c <session_free_buf+0x108>
    session->head = (session->head + len) % session->capacity;
    a3f0:	e51b300c 	ldr	r3, [fp, #-12]
    a3f4:	e5932008 	ldr	r2, [r3, #8]
    a3f8:	e51b3010 	ldr	r3, [fp, #-16]
    a3fc:	e0822003 	add	r2, r2, r3
    a400:	e51b300c 	ldr	r3, [fp, #-12]
    a404:	e5933004 	ldr	r3, [r3, #4]
    a408:	e1a01003 	mov	r1, r3
    a40c:	e1a00002 	mov	r0, r2
    a410:	eb0002e2 	bl	afa0 <__aeabi_idivmod>
    a414:	e1a03001 	mov	r3, r1
    a418:	e1a02003 	mov	r2, r3
    a41c:	e51b300c 	ldr	r3, [fp, #-12]
    a420:	e5832008 	str	r2, [r3, #8]
    return session->head;
    a424:	e51b300c 	ldr	r3, [fp, #-12]
    a428:	e5933008 	ldr	r3, [r3, #8]
    }
    assert(session_forward_head(session, len) != 1);
    a42c:	e3530001 	cmp	r3, #1
    a430:	1a000007 	bne	a454 <session_free_buf+0x130>
    a434:	e3003154 	movw	r3, #340	; 0x154
    a438:	e3403001 	movt	r3, #1
    a43c:	e3002188 	movw	r2, #392	; 0x188
    a440:	e3402001 	movt	r2, #1
    a444:	e3a01040 	mov	r1, #64	; 0x40
    a448:	e300017c 	movw	r0, #380	; 0x17c
    a44c:	e3400001 	movt	r0, #1
    a450:	eb0002db 	bl	afc4 <__assert_func>
    return true;
    a454:	e3a03001 	mov	r3, #1
}
    a458:	e1a00003 	mov	r0, r3
    a45c:	e24bd004 	sub	sp, fp, #4
    a460:	e8bd8800 	pop	{fp, pc}

0000a464 <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    a464:	e92d4800 	push	{fp, lr}
    a468:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    a46c:	e3003d4c 	movw	r3, #3404	; 0xd4c
    a470:	e3403001 	movt	r3, #1
    a474:	e5933000 	ldr	r3, [r3]
    a478:	e3530000 	cmp	r3, #0
    a47c:	1a00000f 	bne	a4c0 <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    a480:	e3a03001 	mov	r3, #1
    a484:	e3a02a01 	mov	r2, #4096	; 0x1000
    a488:	e3a01902 	mov	r1, #32768	; 0x8000
    a48c:	e340121e 	movt	r1, #542	; 0x21e
    a490:	e3a00a0f 	mov	r0, #61440	; 0xf000
    a494:	e3460fff 	movt	r0, #28671	; 0x6fff
    a498:	eb00020f 	bl	acdc <mmap>
    a49c:	e1a03000 	mov	r3, r0
    a4a0:	e3730001 	cmn	r3, #1
    a4a4:	1a000001 	bne	a4b0 <init_uart_mmio+0x4c>
            return false;
    a4a8:	e3a03000 	mov	r3, #0
    a4ac:	ea000004 	b	a4c4 <init_uart_mmio+0x60>
        }
        mapped = 1;
    a4b0:	e3003d4c 	movw	r3, #3404	; 0xd4c
    a4b4:	e3403001 	movt	r3, #1
    a4b8:	e3a02001 	mov	r2, #1
    a4bc:	e5832000 	str	r2, [r3]
    }
    return true;
    a4c0:	e3a03001 	mov	r3, #1
}
    a4c4:	e1a00003 	mov	r0, r3
    a4c8:	e8bd8800 	pop	{fp, pc}

0000a4cc <putc>:

static void putc(char c)
{
    a4cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    a4d0:	e28db000 	add	fp, sp, #0
    a4d4:	e24dd00c 	sub	sp, sp, #12
    a4d8:	e1a03000 	mov	r3, r0
    a4dc:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    a4e0:	e320f000 	nop	{0}
    a4e4:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    a4e8:	e3463fff 	movt	r3, #28671	; 0x6fff
    a4ec:	e5933000 	ldr	r3, [r3]
    a4f0:	e7e03253 	ubfx	r3, r3, #4, #1
    a4f4:	e6ef3073 	uxtb	r3, r3
    a4f8:	e3530000 	cmp	r3, #0
    a4fc:	1afffff8 	bne	a4e4 <putc+0x18>
        ;

    if (c == '\n') {
    a500:	e55b3005 	ldrb	r3, [fp, #-5]
    a504:	e353000a 	cmp	r3, #10
    a508:	1a00000b 	bne	a53c <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    a50c:	e30f3040 	movw	r3, #61504	; 0xf040
    a510:	e3463fff 	movt	r3, #28671	; 0x6fff
    a514:	e3a0200d 	mov	r2, #13
    a518:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    a51c:	e320f000 	nop	{0}
    a520:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    a524:	e3463fff 	movt	r3, #28671	; 0x6fff
    a528:	e5933000 	ldr	r3, [r3]
    a52c:	e7e03253 	ubfx	r3, r3, #4, #1
    a530:	e6ef3073 	uxtb	r3, r3
    a534:	e3530000 	cmp	r3, #0
    a538:	1afffff8 	bne	a520 <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    a53c:	e30f3040 	movw	r3, #61504	; 0xf040
    a540:	e3463fff 	movt	r3, #28671	; 0x6fff
    a544:	e55b2005 	ldrb	r2, [fp, #-5]
    a548:	e5832000 	str	r2, [r3]
}
    a54c:	e320f000 	nop	{0}
    a550:	e28bd000 	add	sp, fp, #0
    a554:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    a558:	e12fff1e 	bx	lr

0000a55c <getc>:

char getc(void)
{
    a55c:	e92d4800 	push	{fp, lr}
    a560:	e28db004 	add	fp, sp, #4
    a564:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    a568:	ebffffbd 	bl	a464 <init_uart_mmio>
    a56c:	e1a03000 	mov	r3, r0
    a570:	e2233001 	eor	r3, r3, #1
    a574:	e6ef3073 	uxtb	r3, r3
    a578:	e3530000 	cmp	r3, #0
    a57c:	0a000001 	beq	a588 <getc+0x2c>
        return 0xFF;
    a580:	e3a030ff 	mov	r3, #255	; 0xff
    a584:	ea000014 	b	a5dc <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    a588:	e30f3098 	movw	r3, #61592	; 0xf098
    a58c:	e3463fff 	movt	r3, #28671	; 0x6fff
    a590:	e5933000 	ldr	r3, [r3]
    a594:	e7e03053 	ubfx	r3, r3, #0, #1
    a598:	e6ef3073 	uxtb	r3, r3
    a59c:	e3530000 	cmp	r3, #0
    a5a0:	1a000001 	bne	a5ac <getc+0x50>
        return 0xFF;
    a5a4:	e3a030ff 	mov	r3, #255	; 0xff
    a5a8:	ea00000b 	b	a5dc <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    a5ac:	e3a03a0f 	mov	r3, #61440	; 0xf000
    a5b0:	e3463fff 	movt	r3, #28671	; 0x6fff
    a5b4:	e5933000 	ldr	r3, [r3]
    a5b8:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    a5bc:	e51b3008 	ldr	r3, [fp, #-8]
    a5c0:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    a5c4:	e3530000 	cmp	r3, #0
    a5c8:	0a000001 	beq	a5d4 <getc+0x78>
        return 0xFF;
    a5cc:	e3a030ff 	mov	r3, #255	; 0xff
    a5d0:	ea000001 	b	a5dc <getc+0x80>

    return (char)read_data;
    a5d4:	e51b3008 	ldr	r3, [fp, #-8]
    a5d8:	e6ef3073 	uxtb	r3, r3
}
    a5dc:	e1a00003 	mov	r0, r3
    a5e0:	e24bd004 	sub	sp, fp, #4
    a5e4:	e8bd8800 	pop	{fp, pc}

0000a5e8 <printint>:

static void printint(int xx, int base, int sgn)
{
    a5e8:	e92d4810 	push	{r4, fp, lr}
    a5ec:	e28db008 	add	fp, sp, #8
    a5f0:	e24dd034 	sub	sp, sp, #52	; 0x34
    a5f4:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    a5f8:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    a5fc:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    a600:	e3a03000 	mov	r3, #0
    a604:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    a608:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a60c:	e3530000 	cmp	r3, #0
    a610:	0a000008 	beq	a638 <printint+0x50>
    a614:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a618:	e3530000 	cmp	r3, #0
    a61c:	aa000005 	bge	a638 <printint+0x50>
        neg = 1;
    a620:	e3a03001 	mov	r3, #1
    a624:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    a628:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a62c:	e2633000 	rsb	r3, r3, #0
    a630:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a634:	ea000001 	b	a640 <printint+0x58>
    } else {
        x = xx;
    a638:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a63c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    a640:	e3a03000 	mov	r3, #0
    a644:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    a648:	e51b4010 	ldr	r4, [fp, #-16]
    a64c:	e2843001 	add	r3, r4, #1
    a650:	e50b3010 	str	r3, [fp, #-16]
    a654:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a658:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a65c:	e1a01002 	mov	r1, r2
    a660:	e1a00003 	mov	r0, r3
    a664:	eb0001fb 	bl	ae58 <__aeabi_uidivmod>
    a668:	e1a03001 	mov	r3, r1
    a66c:	e1a02003 	mov	r2, r3
    a670:	e3003370 	movw	r3, #880	; 0x370
    a674:	e3403001 	movt	r3, #1
    a678:	e7d32002 	ldrb	r2, [r3, r2]
    a67c:	e24b300c 	sub	r3, fp, #12
    a680:	e0833004 	add	r3, r3, r4
    a684:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    a688:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a68c:	e1a01003 	mov	r1, r3
    a690:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    a694:	eb0001b2 	bl	ad64 <__udivsi3>
    a698:	e1a03000 	mov	r3, r0
    a69c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a6a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a6a4:	e3530000 	cmp	r3, #0
    a6a8:	1affffe6 	bne	a648 <printint+0x60>
    if (neg)
    a6ac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a6b0:	e3530000 	cmp	r3, #0
    a6b4:	0a00000d 	beq	a6f0 <printint+0x108>
        buf[i++] = '-';
    a6b8:	e51b3010 	ldr	r3, [fp, #-16]
    a6bc:	e2832001 	add	r2, r3, #1
    a6c0:	e50b2010 	str	r2, [fp, #-16]
    a6c4:	e24b200c 	sub	r2, fp, #12
    a6c8:	e0823003 	add	r3, r2, r3
    a6cc:	e3a0202d 	mov	r2, #45	; 0x2d
    a6d0:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    a6d4:	ea000005 	b	a6f0 <printint+0x108>
        putc(buf[i]);
    a6d8:	e24b2028 	sub	r2, fp, #40	; 0x28
    a6dc:	e51b3010 	ldr	r3, [fp, #-16]
    a6e0:	e0823003 	add	r3, r2, r3
    a6e4:	e5d33000 	ldrb	r3, [r3]
    a6e8:	e1a00003 	mov	r0, r3
    a6ec:	ebffff76 	bl	a4cc <putc>
    while (--i >= 0)
    a6f0:	e51b3010 	ldr	r3, [fp, #-16]
    a6f4:	e2433001 	sub	r3, r3, #1
    a6f8:	e50b3010 	str	r3, [fp, #-16]
    a6fc:	e51b3010 	ldr	r3, [fp, #-16]
    a700:	e3530000 	cmp	r3, #0
    a704:	aafffff3 	bge	a6d8 <printint+0xf0>
}
    a708:	e320f000 	nop	{0}
    a70c:	e24bd008 	sub	sp, fp, #8
    a710:	e8bd8810 	pop	{r4, fp, pc}

0000a714 <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    a714:	e92d000f 	push	{r0, r1, r2, r3}
    a718:	e92d4800 	push	{fp, lr}
    a71c:	e28db004 	add	fp, sp, #4
    a720:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    a724:	ebffff4e 	bl	a464 <init_uart_mmio>
    a728:	e1a03000 	mov	r3, r0
    a72c:	e2233001 	eor	r3, r3, #1
    a730:	e6ef3073 	uxtb	r3, r3
    a734:	e3530000 	cmp	r3, #0
    a738:	1a00007b 	bne	a92c <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    a73c:	e3a03000 	mov	r3, #0
    a740:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    a744:	e28b3008 	add	r3, fp, #8
    a748:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    a74c:	e3a03000 	mov	r3, #0
    a750:	e50b300c 	str	r3, [fp, #-12]
    a754:	ea00006d 	b	a910 <printf+0x1fc>
        c = fmt[i] & 0xff;
    a758:	e59b2004 	ldr	r2, [fp, #4]
    a75c:	e51b300c 	ldr	r3, [fp, #-12]
    a760:	e0823003 	add	r3, r2, r3
    a764:	e5d33000 	ldrb	r3, [r3]
    a768:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    a76c:	e51b3010 	ldr	r3, [fp, #-16]
    a770:	e3530000 	cmp	r3, #0
    a774:	1a00000a 	bne	a7a4 <printf+0x90>
            if (c == '%') {
    a778:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a77c:	e3530025 	cmp	r3, #37	; 0x25
    a780:	1a000002 	bne	a790 <printf+0x7c>
                state = '%';
    a784:	e3a03025 	mov	r3, #37	; 0x25
    a788:	e50b3010 	str	r3, [fp, #-16]
    a78c:	ea00005c 	b	a904 <printf+0x1f0>
            } else {
                putc(c);
    a790:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a794:	e6ef3073 	uxtb	r3, r3
    a798:	e1a00003 	mov	r0, r3
    a79c:	ebffff4a 	bl	a4cc <putc>
    a7a0:	ea000057 	b	a904 <printf+0x1f0>
            }
        } else if (state == '%') {
    a7a4:	e51b3010 	ldr	r3, [fp, #-16]
    a7a8:	e3530025 	cmp	r3, #37	; 0x25
    a7ac:	1a000054 	bne	a904 <printf+0x1f0>
            if (c == 'd') {
    a7b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a7b4:	e3530064 	cmp	r3, #100	; 0x64
    a7b8:	1a000009 	bne	a7e4 <printf+0xd0>
                printint(*ap, 10, 1);
    a7bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a7c0:	e5933000 	ldr	r3, [r3]
    a7c4:	e3a02001 	mov	r2, #1
    a7c8:	e3a0100a 	mov	r1, #10
    a7cc:	e1a00003 	mov	r0, r3
    a7d0:	ebffff84 	bl	a5e8 <printint>
                ap++;
    a7d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a7d8:	e2833004 	add	r3, r3, #4
    a7dc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    a7e0:	ea000045 	b	a8fc <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    a7e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a7e8:	e3530078 	cmp	r3, #120	; 0x78
    a7ec:	0a000002 	beq	a7fc <printf+0xe8>
    a7f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a7f4:	e3530070 	cmp	r3, #112	; 0x70
    a7f8:	1a000009 	bne	a824 <printf+0x110>
                printint(*ap, 16, 0);
    a7fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a800:	e5933000 	ldr	r3, [r3]
    a804:	e3a02000 	mov	r2, #0
    a808:	e3a01010 	mov	r1, #16
    a80c:	e1a00003 	mov	r0, r3
    a810:	ebffff74 	bl	a5e8 <printint>
                ap++;
    a814:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a818:	e2833004 	add	r3, r3, #4
    a81c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    a820:	ea000035 	b	a8fc <printf+0x1e8>
            } else if (c == 's') {
    a824:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a828:	e3530073 	cmp	r3, #115	; 0x73
    a82c:	1a000018 	bne	a894 <printf+0x180>
                s = (char*)*ap;
    a830:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a834:	e5933000 	ldr	r3, [r3]
    a838:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    a83c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a840:	e2833004 	add	r3, r3, #4
    a844:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    a848:	e51b3008 	ldr	r3, [fp, #-8]
    a84c:	e3530000 	cmp	r3, #0
    a850:	1a00000a 	bne	a880 <printf+0x16c>
                    s = "(null)";
    a854:	e300319c 	movw	r3, #412	; 0x19c
    a858:	e3403001 	movt	r3, #1
    a85c:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    a860:	ea000006 	b	a880 <printf+0x16c>
                    putc(*s);
    a864:	e51b3008 	ldr	r3, [fp, #-8]
    a868:	e5d33000 	ldrb	r3, [r3]
    a86c:	e1a00003 	mov	r0, r3
    a870:	ebffff15 	bl	a4cc <putc>
                    s++;
    a874:	e51b3008 	ldr	r3, [fp, #-8]
    a878:	e2833001 	add	r3, r3, #1
    a87c:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    a880:	e51b3008 	ldr	r3, [fp, #-8]
    a884:	e5d33000 	ldrb	r3, [r3]
    a888:	e3530000 	cmp	r3, #0
    a88c:	1afffff4 	bne	a864 <printf+0x150>
    a890:	ea000019 	b	a8fc <printf+0x1e8>
                }
            } else if (c == 'c') {
    a894:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a898:	e3530063 	cmp	r3, #99	; 0x63
    a89c:	1a000008 	bne	a8c4 <printf+0x1b0>
                putc(*ap);
    a8a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a8a4:	e5933000 	ldr	r3, [r3]
    a8a8:	e6ef3073 	uxtb	r3, r3
    a8ac:	e1a00003 	mov	r0, r3
    a8b0:	ebffff05 	bl	a4cc <putc>
                ap++;
    a8b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a8b8:	e2833004 	add	r3, r3, #4
    a8bc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    a8c0:	ea00000d 	b	a8fc <printf+0x1e8>
            } else if (c == '%') {
    a8c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a8c8:	e3530025 	cmp	r3, #37	; 0x25
    a8cc:	1a000004 	bne	a8e4 <printf+0x1d0>
                putc(c);
    a8d0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a8d4:	e6ef3073 	uxtb	r3, r3
    a8d8:	e1a00003 	mov	r0, r3
    a8dc:	ebfffefa 	bl	a4cc <putc>
    a8e0:	ea000005 	b	a8fc <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    a8e4:	e3a00025 	mov	r0, #37	; 0x25
    a8e8:	ebfffef7 	bl	a4cc <putc>
                putc(c);
    a8ec:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a8f0:	e6ef3073 	uxtb	r3, r3
    a8f4:	e1a00003 	mov	r0, r3
    a8f8:	ebfffef3 	bl	a4cc <putc>
            }
            state = 0;
    a8fc:	e3a03000 	mov	r3, #0
    a900:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    a904:	e51b300c 	ldr	r3, [fp, #-12]
    a908:	e2833001 	add	r3, r3, #1
    a90c:	e50b300c 	str	r3, [fp, #-12]
    a910:	e59b2004 	ldr	r2, [fp, #4]
    a914:	e51b300c 	ldr	r3, [fp, #-12]
    a918:	e0823003 	add	r3, r2, r3
    a91c:	e5d33000 	ldrb	r3, [r3]
    a920:	e3530000 	cmp	r3, #0
    a924:	1affff8b 	bne	a758 <printf+0x44>
    a928:	ea000000 	b	a930 <printf+0x21c>
        return;
    a92c:	e320f000 	nop	{0}
        }
    }
    a930:	e24bd004 	sub	sp, fp, #4
    a934:	e8bd4800 	pop	{fp, lr}
    a938:	e28dd010 	add	sp, sp, #16
    a93c:	e12fff1e 	bx	lr

0000a940 <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    a940:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    a944:	e28db014 	add	fp, sp, #20
    a948:	e24dd018 	sub	sp, sp, #24
    a94c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    a950:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    a954:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    a958:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    a95c:	e3e03000 	mvn	r3, #0
    a960:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    a964:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    a968:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    a96c:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    a970:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    a974:	e59b7004 	ldr	r7, [fp, #4]
    a978:	e1a0000c 	mov	r0, ip
    a97c:	e1a0100e 	mov	r1, lr
    a980:	e1a02005 	mov	r2, r5
    a984:	e1a03006 	mov	r3, r6
    a988:	e1a04007 	mov	r4, r7
    a98c:	ef000000 	svc	0x00000000
    a990:	f57ff04f 	dsb	sy
    a994:	f57ff06f 	isb	sy
    a998:	e1a0c000 	mov	ip, r0
    a99c:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    a9a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    a9a4:	e1a00003 	mov	r0, r3
    a9a8:	e24bd014 	sub	sp, fp, #20
    a9ac:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

0000a9b0 <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    a9b0:	e92d4800 	push	{fp, lr}
    a9b4:	e28db004 	add	fp, sp, #4
    a9b8:	e24dd028 	sub	sp, sp, #40	; 0x28
    a9bc:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    a9c0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    a9c4:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    a9c8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    a9cc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a9d0:	e50b3010 	str	r3, [fp, #-16]
    a9d4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    a9d8:	e50b300c 	str	r3, [fp, #-12]
    a9dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    a9e0:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    a9e4:	e24b1010 	sub	r1, fp, #16
    a9e8:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a9ec:	e59b0004 	ldr	r0, [fp, #4]
    a9f0:	e3a03000 	mov	r3, #0
    a9f4:	e58d3000 	str	r3, [sp]
    a9f8:	e1a03000 	mov	r3, r0
    a9fc:	e3a00001 	mov	r0, #1
    aa00:	ebffffce 	bl	a940 <syscall>
    aa04:	e1a03000 	mov	r3, r0
}
    aa08:	e1a00003 	mov	r0, r3
    aa0c:	e24bd004 	sub	sp, fp, #4
    aa10:	e8bd8800 	pop	{fp, pc}

0000aa14 <exit>:

int exit()
{
    aa14:	e92d4800 	push	{fp, lr}
    aa18:	e28db004 	add	fp, sp, #4
    aa1c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    aa20:	e3a03000 	mov	r3, #0
    aa24:	e58d3000 	str	r3, [sp]
    aa28:	e3a03000 	mov	r3, #0
    aa2c:	e3a02000 	mov	r2, #0
    aa30:	e3a01000 	mov	r1, #0
    aa34:	e3a00002 	mov	r0, #2
    aa38:	ebffffc0 	bl	a940 <syscall>
    aa3c:	e1a03000 	mov	r3, r0
}
    aa40:	e1a00003 	mov	r0, r3
    aa44:	e24bd004 	sub	sp, fp, #4
    aa48:	e8bd8800 	pop	{fp, pc}

0000aa4c <yield>:

int yield()
{
    aa4c:	e92d4800 	push	{fp, lr}
    aa50:	e28db004 	add	fp, sp, #4
    aa54:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    aa58:	e3a03000 	mov	r3, #0
    aa5c:	e58d3000 	str	r3, [sp]
    aa60:	e3a03000 	mov	r3, #0
    aa64:	e3a02000 	mov	r2, #0
    aa68:	e3a01000 	mov	r1, #0
    aa6c:	e3a00003 	mov	r0, #3
    aa70:	ebffffb2 	bl	a940 <syscall>
    aa74:	e1a03000 	mov	r3, r0
}
    aa78:	e1a00003 	mov	r0, r3
    aa7c:	e24bd004 	sub	sp, fp, #4
    aa80:	e8bd8800 	pop	{fp, pc}

0000aa84 <register_server>:

int register_server(char* name)
{
    aa84:	e92d4800 	push	{fp, lr}
    aa88:	e28db004 	add	fp, sp, #4
    aa8c:	e24dd010 	sub	sp, sp, #16
    aa90:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    aa94:	e51b1008 	ldr	r1, [fp, #-8]
    aa98:	e3a03000 	mov	r3, #0
    aa9c:	e58d3000 	str	r3, [sp]
    aaa0:	e3a03000 	mov	r3, #0
    aaa4:	e3a02000 	mov	r2, #0
    aaa8:	e3a00005 	mov	r0, #5
    aaac:	ebffffa3 	bl	a940 <syscall>
    aab0:	e1a03000 	mov	r3, r0
}
    aab4:	e1a00003 	mov	r0, r3
    aab8:	e24bd004 	sub	sp, fp, #4
    aabc:	e8bd8800 	pop	{fp, pc}

0000aac0 <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    aac0:	e92d4800 	push	{fp, lr}
    aac4:	e28db004 	add	fp, sp, #4
    aac8:	e24dd018 	sub	sp, sp, #24
    aacc:	e50b0008 	str	r0, [fp, #-8]
    aad0:	e50b100c 	str	r1, [fp, #-12]
    aad4:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    aad8:	e51b1008 	ldr	r1, [fp, #-8]
    aadc:	e51b2010 	ldr	r2, [fp, #-16]
    aae0:	e3a03000 	mov	r3, #0
    aae4:	e58d3000 	str	r3, [sp]
    aae8:	e1a03002 	mov	r3, r2
    aaec:	e51b200c 	ldr	r2, [fp, #-12]
    aaf0:	e3a00006 	mov	r0, #6
    aaf4:	ebffff91 	bl	a940 <syscall>
    aaf8:	e1a03000 	mov	r3, r0
}
    aafc:	e1a00003 	mov	r0, r3
    ab00:	e24bd004 	sub	sp, fp, #4
    ab04:	e8bd8800 	pop	{fp, pc}

0000ab08 <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    ab08:	e92d4800 	push	{fp, lr}
    ab0c:	e28db004 	add	fp, sp, #4
    ab10:	e24dd010 	sub	sp, sp, #16
    ab14:	e50b0008 	str	r0, [fp, #-8]
    ab18:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    ab1c:	e51b1008 	ldr	r1, [fp, #-8]
    ab20:	e3a03000 	mov	r3, #0
    ab24:	e58d3000 	str	r3, [sp]
    ab28:	e3a03000 	mov	r3, #0
    ab2c:	e51b200c 	ldr	r2, [fp, #-12]
    ab30:	e3a00007 	mov	r0, #7
    ab34:	ebffff81 	bl	a940 <syscall>
    ab38:	e1a03000 	mov	r3, r0
}
    ab3c:	e1a00003 	mov	r0, r3
    ab40:	e24bd004 	sub	sp, fp, #4
    ab44:	e8bd8800 	pop	{fp, pc}

0000ab48 <close_session>:

int close_session(struct Session* session)
{
    ab48:	e92d4800 	push	{fp, lr}
    ab4c:	e28db004 	add	fp, sp, #4
    ab50:	e24dd010 	sub	sp, sp, #16
    ab54:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    ab58:	e51b1008 	ldr	r1, [fp, #-8]
    ab5c:	e3a03000 	mov	r3, #0
    ab60:	e58d3000 	str	r3, [sp]
    ab64:	e3a03000 	mov	r3, #0
    ab68:	e3a02000 	mov	r2, #0
    ab6c:	e3a00008 	mov	r0, #8
    ab70:	ebffff72 	bl	a940 <syscall>
    ab74:	e1a03000 	mov	r3, r0
}
    ab78:	e1a00003 	mov	r0, r3
    ab7c:	e24bd004 	sub	sp, fp, #4
    ab80:	e8bd8800 	pop	{fp, pc}

0000ab84 <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    ab84:	e92d4800 	push	{fp, lr}
    ab88:	e28db004 	add	fp, sp, #4
    ab8c:	e24dd010 	sub	sp, sp, #16
    ab90:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    ab94:	e51b2008 	ldr	r2, [fp, #-8]
    ab98:	e3a03000 	mov	r3, #0
    ab9c:	e58d3000 	str	r3, [sp]
    aba0:	e3a03000 	mov	r3, #0
    aba4:	e3a01003 	mov	r1, #3
    aba8:	e3a0000a 	mov	r0, #10
    abac:	ebffff63 	bl	a940 <syscall>
    abb0:	e1a03000 	mov	r3, r0
}
    abb4:	e1a00003 	mov	r0, r3
    abb8:	e24bd004 	sub	sp, fp, #4
    abbc:	e8bd8800 	pop	{fp, pc}

0000abc0 <set_priority>:

int set_priority(sys_state_info* info)
{
    abc0:	e92d4800 	push	{fp, lr}
    abc4:	e28db004 	add	fp, sp, #4
    abc8:	e24dd010 	sub	sp, sp, #16
    abcc:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    abd0:	e51b2008 	ldr	r2, [fp, #-8]
    abd4:	e3a03000 	mov	r3, #0
    abd8:	e58d3000 	str	r3, [sp]
    abdc:	e3a03000 	mov	r3, #0
    abe0:	e3a01001 	mov	r1, #1
    abe4:	e3a0000a 	mov	r0, #10
    abe8:	ebffff54 	bl	a940 <syscall>
    abec:	e1a03000 	mov	r3, r0
}
    abf0:	e1a00003 	mov	r0, r3
    abf4:	e24bd004 	sub	sp, fp, #4
    abf8:	e8bd8800 	pop	{fp, pc}

0000abfc <task_heap_base>:

int task_heap_base()
{
    abfc:	e92d4800 	push	{fp, lr}
    ac00:	e28db004 	add	fp, sp, #4
    ac04:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    ac08:	e3a03000 	mov	r3, #0
    ac0c:	e58d3000 	str	r3, [sp]
    ac10:	e3a03000 	mov	r3, #0
    ac14:	e3a02000 	mov	r2, #0
    ac18:	e3a01002 	mov	r1, #2
    ac1c:	e3a0000a 	mov	r0, #10
    ac20:	ebffff46 	bl	a940 <syscall>
    ac24:	e1a03000 	mov	r3, r0
}
    ac28:	e1a00003 	mov	r0, r3
    ac2c:	e24bd004 	sub	sp, fp, #4
    ac30:	e8bd8800 	pop	{fp, pc}

0000ac34 <show_task>:

int show_task()
{
    ac34:	e92d4800 	push	{fp, lr}
    ac38:	e28db004 	add	fp, sp, #4
    ac3c:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    ac40:	e3a03000 	mov	r3, #0
    ac44:	e58d3000 	str	r3, [sp]
    ac48:	e3a03000 	mov	r3, #0
    ac4c:	e3a02000 	mov	r2, #0
    ac50:	e3a01004 	mov	r1, #4
    ac54:	e3a0000a 	mov	r0, #10
    ac58:	ebffff38 	bl	a940 <syscall>
    ac5c:	e1a03000 	mov	r3, r0
}
    ac60:	e1a00003 	mov	r0, r3
    ac64:	e24bd004 	sub	sp, fp, #4
    ac68:	e8bd8800 	pop	{fp, pc}

0000ac6c <show_mem>:

int show_mem()
{
    ac6c:	e92d4800 	push	{fp, lr}
    ac70:	e28db004 	add	fp, sp, #4
    ac74:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    ac78:	e3a03000 	mov	r3, #0
    ac7c:	e58d3000 	str	r3, [sp]
    ac80:	e3a03000 	mov	r3, #0
    ac84:	e3a02000 	mov	r2, #0
    ac88:	e3a01005 	mov	r1, #5
    ac8c:	e3a0000a 	mov	r0, #10
    ac90:	ebffff2a 	bl	a940 <syscall>
    ac94:	e1a03000 	mov	r3, r0
}
    ac98:	e1a00003 	mov	r0, r3
    ac9c:	e24bd004 	sub	sp, fp, #4
    aca0:	e8bd8800 	pop	{fp, pc}

0000aca4 <show_cpu>:

int show_cpu()
{
    aca4:	e92d4800 	push	{fp, lr}
    aca8:	e28db004 	add	fp, sp, #4
    acac:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    acb0:	e3a03000 	mov	r3, #0
    acb4:	e58d3000 	str	r3, [sp]
    acb8:	e3a03000 	mov	r3, #0
    acbc:	e3a02000 	mov	r2, #0
    acc0:	e3a01006 	mov	r1, #6
    acc4:	e3a0000a 	mov	r0, #10
    acc8:	ebffff1c 	bl	a940 <syscall>
    accc:	e1a03000 	mov	r3, r0
}
    acd0:	e1a00003 	mov	r0, r3
    acd4:	e24bd004 	sub	sp, fp, #4
    acd8:	e8bd8800 	pop	{fp, pc}

0000acdc <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    acdc:	e92d4800 	push	{fp, lr}
    ace0:	e28db004 	add	fp, sp, #4
    ace4:	e24dd018 	sub	sp, sp, #24
    ace8:	e50b0008 	str	r0, [fp, #-8]
    acec:	e50b100c 	str	r1, [fp, #-12]
    acf0:	e50b2010 	str	r2, [fp, #-16]
    acf4:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    acf8:	e51b1008 	ldr	r1, [fp, #-8]
    acfc:	e51b200c 	ldr	r2, [fp, #-12]
    ad00:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    ad04:	e58d3000 	str	r3, [sp]
    ad08:	e51b3010 	ldr	r3, [fp, #-16]
    ad0c:	e3a00004 	mov	r0, #4
    ad10:	ebffff0a 	bl	a940 <syscall>
    ad14:	e1a03000 	mov	r3, r0
}
    ad18:	e1a00003 	mov	r0, r3
    ad1c:	e24bd004 	sub	sp, fp, #4
    ad20:	e8bd8800 	pop	{fp, pc}

0000ad24 <register_irq>:

int register_irq(int irq, int opcode)
{
    ad24:	e92d4800 	push	{fp, lr}
    ad28:	e28db004 	add	fp, sp, #4
    ad2c:	e24dd010 	sub	sp, sp, #16
    ad30:	e50b0008 	str	r0, [fp, #-8]
    ad34:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    ad38:	e3a03000 	mov	r3, #0
    ad3c:	e58d3000 	str	r3, [sp]
    ad40:	e3a03000 	mov	r3, #0
    ad44:	e51b200c 	ldr	r2, [fp, #-12]
    ad48:	e51b1008 	ldr	r1, [fp, #-8]
    ad4c:	e3a0000b 	mov	r0, #11
    ad50:	ebfffefa 	bl	a940 <syscall>
    ad54:	e1a03000 	mov	r3, r0
    ad58:	e1a00003 	mov	r0, r3
    ad5c:	e24bd004 	sub	sp, fp, #4
    ad60:	e8bd8800 	pop	{fp, pc}

0000ad64 <__udivsi3>:
    ad64:	e2512001 	subs	r2, r1, #1
    ad68:	012fff1e 	bxeq	lr
    ad6c:	3a000036 	bcc	ae4c <__udivsi3+0xe8>
    ad70:	e1500001 	cmp	r0, r1
    ad74:	9a000022 	bls	ae04 <__udivsi3+0xa0>
    ad78:	e1110002 	tst	r1, r2
    ad7c:	0a000023 	beq	ae10 <__udivsi3+0xac>
    ad80:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    ad84:	01a01181 	lsleq	r1, r1, #3
    ad88:	03a03008 	moveq	r3, #8
    ad8c:	13a03001 	movne	r3, #1
    ad90:	e3510201 	cmp	r1, #268435456	; 0x10000000
    ad94:	31510000 	cmpcc	r1, r0
    ad98:	31a01201 	lslcc	r1, r1, #4
    ad9c:	31a03203 	lslcc	r3, r3, #4
    ada0:	3afffffa 	bcc	ad90 <__udivsi3+0x2c>
    ada4:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    ada8:	31510000 	cmpcc	r1, r0
    adac:	31a01081 	lslcc	r1, r1, #1
    adb0:	31a03083 	lslcc	r3, r3, #1
    adb4:	3afffffa 	bcc	ada4 <__udivsi3+0x40>
    adb8:	e3a02000 	mov	r2, #0
    adbc:	e1500001 	cmp	r0, r1
    adc0:	20400001 	subcs	r0, r0, r1
    adc4:	21822003 	orrcs	r2, r2, r3
    adc8:	e15000a1 	cmp	r0, r1, lsr #1
    adcc:	204000a1 	subcs	r0, r0, r1, lsr #1
    add0:	218220a3 	orrcs	r2, r2, r3, lsr #1
    add4:	e1500121 	cmp	r0, r1, lsr #2
    add8:	20400121 	subcs	r0, r0, r1, lsr #2
    addc:	21822123 	orrcs	r2, r2, r3, lsr #2
    ade0:	e15001a1 	cmp	r0, r1, lsr #3
    ade4:	204001a1 	subcs	r0, r0, r1, lsr #3
    ade8:	218221a3 	orrcs	r2, r2, r3, lsr #3
    adec:	e3500000 	cmp	r0, #0
    adf0:	11b03223 	lsrsne	r3, r3, #4
    adf4:	11a01221 	lsrne	r1, r1, #4
    adf8:	1affffef 	bne	adbc <__udivsi3+0x58>
    adfc:	e1a00002 	mov	r0, r2
    ae00:	e12fff1e 	bx	lr
    ae04:	03a00001 	moveq	r0, #1
    ae08:	13a00000 	movne	r0, #0
    ae0c:	e12fff1e 	bx	lr
    ae10:	e3510801 	cmp	r1, #65536	; 0x10000
    ae14:	21a01821 	lsrcs	r1, r1, #16
    ae18:	23a02010 	movcs	r2, #16
    ae1c:	33a02000 	movcc	r2, #0
    ae20:	e3510c01 	cmp	r1, #256	; 0x100
    ae24:	21a01421 	lsrcs	r1, r1, #8
    ae28:	22822008 	addcs	r2, r2, #8
    ae2c:	e3510010 	cmp	r1, #16
    ae30:	21a01221 	lsrcs	r1, r1, #4
    ae34:	22822004 	addcs	r2, r2, #4
    ae38:	e3510004 	cmp	r1, #4
    ae3c:	82822003 	addhi	r2, r2, #3
    ae40:	908220a1 	addls	r2, r2, r1, lsr #1
    ae44:	e1a00230 	lsr	r0, r0, r2
    ae48:	e12fff1e 	bx	lr
    ae4c:	e3500000 	cmp	r0, #0
    ae50:	13e00000 	mvnne	r0, #0
    ae54:	ea000059 	b	afc0 <__aeabi_idiv0>

0000ae58 <__aeabi_uidivmod>:
    ae58:	e3510000 	cmp	r1, #0
    ae5c:	0afffffa 	beq	ae4c <__udivsi3+0xe8>
    ae60:	e92d4003 	push	{r0, r1, lr}
    ae64:	ebffffbe 	bl	ad64 <__udivsi3>
    ae68:	e8bd4006 	pop	{r1, r2, lr}
    ae6c:	e0030092 	mul	r3, r2, r0
    ae70:	e0411003 	sub	r1, r1, r3
    ae74:	e12fff1e 	bx	lr

0000ae78 <__divsi3>:
    ae78:	e3510000 	cmp	r1, #0
    ae7c:	0a000043 	beq	af90 <.divsi3_skip_div0_test+0x110>

0000ae80 <.divsi3_skip_div0_test>:
    ae80:	e020c001 	eor	ip, r0, r1
    ae84:	42611000 	rsbmi	r1, r1, #0
    ae88:	e2512001 	subs	r2, r1, #1
    ae8c:	0a000027 	beq	af30 <.divsi3_skip_div0_test+0xb0>
    ae90:	e1b03000 	movs	r3, r0
    ae94:	42603000 	rsbmi	r3, r0, #0
    ae98:	e1530001 	cmp	r3, r1
    ae9c:	9a000026 	bls	af3c <.divsi3_skip_div0_test+0xbc>
    aea0:	e1110002 	tst	r1, r2
    aea4:	0a000028 	beq	af4c <.divsi3_skip_div0_test+0xcc>
    aea8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    aeac:	01a01181 	lsleq	r1, r1, #3
    aeb0:	03a02008 	moveq	r2, #8
    aeb4:	13a02001 	movne	r2, #1
    aeb8:	e3510201 	cmp	r1, #268435456	; 0x10000000
    aebc:	31510003 	cmpcc	r1, r3
    aec0:	31a01201 	lslcc	r1, r1, #4
    aec4:	31a02202 	lslcc	r2, r2, #4
    aec8:	3afffffa 	bcc	aeb8 <.divsi3_skip_div0_test+0x38>
    aecc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    aed0:	31510003 	cmpcc	r1, r3
    aed4:	31a01081 	lslcc	r1, r1, #1
    aed8:	31a02082 	lslcc	r2, r2, #1
    aedc:	3afffffa 	bcc	aecc <.divsi3_skip_div0_test+0x4c>
    aee0:	e3a00000 	mov	r0, #0
    aee4:	e1530001 	cmp	r3, r1
    aee8:	20433001 	subcs	r3, r3, r1
    aeec:	21800002 	orrcs	r0, r0, r2
    aef0:	e15300a1 	cmp	r3, r1, lsr #1
    aef4:	204330a1 	subcs	r3, r3, r1, lsr #1
    aef8:	218000a2 	orrcs	r0, r0, r2, lsr #1
    aefc:	e1530121 	cmp	r3, r1, lsr #2
    af00:	20433121 	subcs	r3, r3, r1, lsr #2
    af04:	21800122 	orrcs	r0, r0, r2, lsr #2
    af08:	e15301a1 	cmp	r3, r1, lsr #3
    af0c:	204331a1 	subcs	r3, r3, r1, lsr #3
    af10:	218001a2 	orrcs	r0, r0, r2, lsr #3
    af14:	e3530000 	cmp	r3, #0
    af18:	11b02222 	lsrsne	r2, r2, #4
    af1c:	11a01221 	lsrne	r1, r1, #4
    af20:	1affffef 	bne	aee4 <.divsi3_skip_div0_test+0x64>
    af24:	e35c0000 	cmp	ip, #0
    af28:	42600000 	rsbmi	r0, r0, #0
    af2c:	e12fff1e 	bx	lr
    af30:	e13c0000 	teq	ip, r0
    af34:	42600000 	rsbmi	r0, r0, #0
    af38:	e12fff1e 	bx	lr
    af3c:	33a00000 	movcc	r0, #0
    af40:	01a00fcc 	asreq	r0, ip, #31
    af44:	03800001 	orreq	r0, r0, #1
    af48:	e12fff1e 	bx	lr
    af4c:	e3510801 	cmp	r1, #65536	; 0x10000
    af50:	21a01821 	lsrcs	r1, r1, #16
    af54:	23a02010 	movcs	r2, #16
    af58:	33a02000 	movcc	r2, #0
    af5c:	e3510c01 	cmp	r1, #256	; 0x100
    af60:	21a01421 	lsrcs	r1, r1, #8
    af64:	22822008 	addcs	r2, r2, #8
    af68:	e3510010 	cmp	r1, #16
    af6c:	21a01221 	lsrcs	r1, r1, #4
    af70:	22822004 	addcs	r2, r2, #4
    af74:	e3510004 	cmp	r1, #4
    af78:	82822003 	addhi	r2, r2, #3
    af7c:	908220a1 	addls	r2, r2, r1, lsr #1
    af80:	e35c0000 	cmp	ip, #0
    af84:	e1a00233 	lsr	r0, r3, r2
    af88:	42600000 	rsbmi	r0, r0, #0
    af8c:	e12fff1e 	bx	lr
    af90:	e3500000 	cmp	r0, #0
    af94:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    af98:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    af9c:	ea000007 	b	afc0 <__aeabi_idiv0>

0000afa0 <__aeabi_idivmod>:
    afa0:	e3510000 	cmp	r1, #0
    afa4:	0afffff9 	beq	af90 <.divsi3_skip_div0_test+0x110>
    afa8:	e92d4003 	push	{r0, r1, lr}
    afac:	ebffffb3 	bl	ae80 <.divsi3_skip_div0_test>
    afb0:	e8bd4006 	pop	{r1, r2, lr}
    afb4:	e0030092 	mul	r3, r2, r0
    afb8:	e0411003 	sub	r1, r1, r3
    afbc:	e12fff1e 	bx	lr

0000afc0 <__aeabi_idiv0>:
    afc0:	e12fff1e 	bx	lr

0000afc4 <__assert_func>:
    afc4:	e59fc038 	ldr	ip, [pc, #56]	; b004 <__assert_func+0x40>
    afc8:	e59c4000 	ldr	r4, [ip]
    afcc:	e252c000 	subs	ip, r2, #0
    afd0:	e1a02003 	mov	r2, r3
    afd4:	059f302c 	ldreq	r3, [pc, #44]	; b008 <__assert_func+0x44>
    afd8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    afdc:	01a0c003 	moveq	ip, r3
    afe0:	e1a0e000 	mov	lr, r0
    afe4:	159f3020 	ldrne	r3, [pc, #32]	; b00c <__assert_func+0x48>
    afe8:	e24dd014 	sub	sp, sp, #20
    afec:	e594000c 	ldr	r0, [r4, #12]
    aff0:	e88d100a 	stm	sp, {r1, r3, ip}
    aff4:	e1a0300e 	mov	r3, lr
    aff8:	e59f1010 	ldr	r1, [pc, #16]	; b010 <__assert_func+0x4c>
    affc:	eb000014 	bl	b054 <fiprintf>
    b000:	eb0006be 	bl	cb00 <abort>
    b004:	00010384 	.word	0x00010384
    b008:	000101b0 	.word	0x000101b0
    b00c:	000101a4 	.word	0x000101a4
    b010:	000101b4 	.word	0x000101b4

0000b014 <__assert>:
    b014:	e1a03002 	mov	r3, r2
    b018:	e92d4010 	push	{r4, lr}
    b01c:	e3a02000 	mov	r2, #0
    b020:	ebffffe7 	bl	afc4 <__assert_func>

0000b024 <_fiprintf_r>:
    b024:	e92d000c 	push	{r2, r3}
    b028:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    b02c:	e24dd00c 	sub	sp, sp, #12
    b030:	e28dc014 	add	ip, sp, #20
    b034:	e1a0300c 	mov	r3, ip
    b038:	e59d2010 	ldr	r2, [sp, #16]
    b03c:	e58dc004 	str	ip, [sp, #4]
    b040:	eb000159 	bl	b5ac <_vfiprintf_r>
    b044:	e28dd00c 	add	sp, sp, #12
    b048:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    b04c:	e28dd008 	add	sp, sp, #8
    b050:	e12fff1e 	bx	lr

0000b054 <fiprintf>:
    b054:	e92d000e 	push	{r1, r2, r3}
    b058:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    b05c:	e59f202c 	ldr	r2, [pc, #44]	; b090 <fiprintf+0x3c>
    b060:	e24dd008 	sub	sp, sp, #8
    b064:	e28dc010 	add	ip, sp, #16
    b068:	e1a01000 	mov	r1, r0
    b06c:	e1a0300c 	mov	r3, ip
    b070:	e5920000 	ldr	r0, [r2]
    b074:	e59d200c 	ldr	r2, [sp, #12]
    b078:	e58dc004 	str	ip, [sp, #4]
    b07c:	eb00014a 	bl	b5ac <_vfiprintf_r>
    b080:	e28dd008 	add	sp, sp, #8
    b084:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    b088:	e28dd00c 	add	sp, sp, #12
    b08c:	e12fff1e 	bx	lr
    b090:	00010384 	.word	0x00010384

0000b094 <__libc_init_array>:
    b094:	e92d4070 	push	{r4, r5, r6, lr}
    b098:	e59f6064 	ldr	r6, [pc, #100]	; b104 <__libc_init_array+0x70>
    b09c:	e59f5064 	ldr	r5, [pc, #100]	; b108 <__libc_init_array+0x74>
    b0a0:	e0466005 	sub	r6, r6, r5
    b0a4:	e1b06146 	asrs	r6, r6, #2
    b0a8:	13a04000 	movne	r4, #0
    b0ac:	0a000005 	beq	b0c8 <__libc_init_array+0x34>
    b0b0:	e2844001 	add	r4, r4, #1
    b0b4:	e4953004 	ldr	r3, [r5], #4
    b0b8:	e1a0e00f 	mov	lr, pc
    b0bc:	e12fff13 	bx	r3
    b0c0:	e1560004 	cmp	r6, r4
    b0c4:	1afffff9 	bne	b0b0 <__libc_init_array+0x1c>
    b0c8:	e59f603c 	ldr	r6, [pc, #60]	; b10c <__libc_init_array+0x78>
    b0cc:	e59f503c 	ldr	r5, [pc, #60]	; b110 <__libc_init_array+0x7c>
    b0d0:	e0466005 	sub	r6, r6, r5
    b0d4:	ebfff3c9 	bl	8000 <_init>
    b0d8:	e1b06146 	asrs	r6, r6, #2
    b0dc:	13a04000 	movne	r4, #0
    b0e0:	0a000005 	beq	b0fc <__libc_init_array+0x68>
    b0e4:	e2844001 	add	r4, r4, #1
    b0e8:	e4953004 	ldr	r3, [r5], #4
    b0ec:	e1a0e00f 	mov	lr, pc
    b0f0:	e12fff13 	bx	r3
    b0f4:	e1560004 	cmp	r6, r4
    b0f8:	1afffff9 	bne	b0e4 <__libc_init_array+0x50>
    b0fc:	e8bd4070 	pop	{r4, r5, r6, lr}
    b100:	e12fff1e 	bx	lr
    b104:	00010358 	.word	0x00010358
    b108:	00010358 	.word	0x00010358
    b10c:	0001035c 	.word	0x0001035c
    b110:	00010358 	.word	0x00010358

0000b114 <memcpy>:
    b114:	e352000f 	cmp	r2, #15
    b118:	8a000009 	bhi	b144 <memcpy+0x30>
    b11c:	e3520000 	cmp	r2, #0
    b120:	e1a03000 	mov	r3, r0
    b124:	0a00003c 	beq	b21c <memcpy+0x108>
    b128:	e2433001 	sub	r3, r3, #1
    b12c:	e0812002 	add	r2, r1, r2
    b130:	e4d1c001 	ldrb	ip, [r1], #1
    b134:	e1510002 	cmp	r1, r2
    b138:	e5e3c001 	strb	ip, [r3, #1]!
    b13c:	1afffffb 	bne	b130 <memcpy+0x1c>
    b140:	e12fff1e 	bx	lr
    b144:	e1813000 	orr	r3, r1, r0
    b148:	e3130003 	tst	r3, #3
    b14c:	1a000030 	bne	b214 <memcpy+0x100>
    b150:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    b154:	e1a0e002 	mov	lr, r2
    b158:	e280c010 	add	ip, r0, #16
    b15c:	e2813010 	add	r3, r1, #16
    b160:	e5137010 	ldr	r7, [r3, #-16]
    b164:	e513600c 	ldr	r6, [r3, #-12]
    b168:	e5135008 	ldr	r5, [r3, #-8]
    b16c:	e5134004 	ldr	r4, [r3, #-4]
    b170:	e24ee010 	sub	lr, lr, #16
    b174:	e35e000f 	cmp	lr, #15
    b178:	e50c7010 	str	r7, [ip, #-16]
    b17c:	e50c600c 	str	r6, [ip, #-12]
    b180:	e50c5008 	str	r5, [ip, #-8]
    b184:	e50c4004 	str	r4, [ip, #-4]
    b188:	e2833010 	add	r3, r3, #16
    b18c:	e28cc010 	add	ip, ip, #16
    b190:	8afffff2 	bhi	b160 <memcpy+0x4c>
    b194:	e2423010 	sub	r3, r2, #16
    b198:	e3c3300f 	bic	r3, r3, #15
    b19c:	e202600f 	and	r6, r2, #15
    b1a0:	e2833010 	add	r3, r3, #16
    b1a4:	e3560003 	cmp	r6, #3
    b1a8:	e0811003 	add	r1, r1, r3
    b1ac:	e0803003 	add	r3, r0, r3
    b1b0:	9a00001a 	bls	b220 <memcpy+0x10c>
    b1b4:	e1a04001 	mov	r4, r1
    b1b8:	e1a0c006 	mov	ip, r6
    b1bc:	e243e004 	sub	lr, r3, #4
    b1c0:	e24cc004 	sub	ip, ip, #4
    b1c4:	e4945004 	ldr	r5, [r4], #4
    b1c8:	e35c0003 	cmp	ip, #3
    b1cc:	e5ae5004 	str	r5, [lr, #4]!
    b1d0:	8afffffa 	bhi	b1c0 <memcpy+0xac>
    b1d4:	e246c004 	sub	ip, r6, #4
    b1d8:	e3ccc003 	bic	ip, ip, #3
    b1dc:	e28cc004 	add	ip, ip, #4
    b1e0:	e081100c 	add	r1, r1, ip
    b1e4:	e083300c 	add	r3, r3, ip
    b1e8:	e2022003 	and	r2, r2, #3
    b1ec:	e3520000 	cmp	r2, #0
    b1f0:	12433001 	subne	r3, r3, #1
    b1f4:	10812002 	addne	r2, r1, r2
    b1f8:	0a000003 	beq	b20c <memcpy+0xf8>
    b1fc:	e4d1c001 	ldrb	ip, [r1], #1
    b200:	e1510002 	cmp	r1, r2
    b204:	e5e3c001 	strb	ip, [r3, #1]!
    b208:	1afffffb 	bne	b1fc <memcpy+0xe8>
    b20c:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    b210:	e12fff1e 	bx	lr
    b214:	e1a03000 	mov	r3, r0
    b218:	eaffffc2 	b	b128 <memcpy+0x14>
    b21c:	e12fff1e 	bx	lr
    b220:	e1a02006 	mov	r2, r6
    b224:	eafffff0 	b	b1ec <memcpy+0xd8>

0000b228 <memmove>:
    b228:	e1500001 	cmp	r0, r1
    b22c:	9a00000a 	bls	b25c <memmove+0x34>
    b230:	e0813002 	add	r3, r1, r2
    b234:	e1500003 	cmp	r0, r3
    b238:	2a000007 	bcs	b25c <memmove+0x34>
    b23c:	e3520000 	cmp	r2, #0
    b240:	e0802002 	add	r2, r0, r2
    b244:	012fff1e 	bxeq	lr
    b248:	e573c001 	ldrb	ip, [r3, #-1]!
    b24c:	e1510003 	cmp	r1, r3
    b250:	e562c001 	strb	ip, [r2, #-1]!
    b254:	1afffffb 	bne	b248 <memmove+0x20>
    b258:	e12fff1e 	bx	lr
    b25c:	e352000f 	cmp	r2, #15
    b260:	8a000009 	bhi	b28c <memmove+0x64>
    b264:	e3520000 	cmp	r2, #0
    b268:	e1a03000 	mov	r3, r0
    b26c:	0a00003c 	beq	b364 <memmove+0x13c>
    b270:	e2433001 	sub	r3, r3, #1
    b274:	e0812002 	add	r2, r1, r2
    b278:	e4d1c001 	ldrb	ip, [r1], #1
    b27c:	e1520001 	cmp	r2, r1
    b280:	e5e3c001 	strb	ip, [r3, #1]!
    b284:	1afffffb 	bne	b278 <memmove+0x50>
    b288:	e12fff1e 	bx	lr
    b28c:	e1813000 	orr	r3, r1, r0
    b290:	e3130003 	tst	r3, #3
    b294:	1a000030 	bne	b35c <memmove+0x134>
    b298:	e92d4070 	push	{r4, r5, r6, lr}
    b29c:	e1a0e002 	mov	lr, r2
    b2a0:	e280c010 	add	ip, r0, #16
    b2a4:	e2813010 	add	r3, r1, #16
    b2a8:	e5134010 	ldr	r4, [r3, #-16]
    b2ac:	e50c4010 	str	r4, [ip, #-16]
    b2b0:	e513400c 	ldr	r4, [r3, #-12]
    b2b4:	e50c400c 	str	r4, [ip, #-12]
    b2b8:	e5134008 	ldr	r4, [r3, #-8]
    b2bc:	e50c4008 	str	r4, [ip, #-8]
    b2c0:	e24ee010 	sub	lr, lr, #16
    b2c4:	e5134004 	ldr	r4, [r3, #-4]
    b2c8:	e35e000f 	cmp	lr, #15
    b2cc:	e50c4004 	str	r4, [ip, #-4]
    b2d0:	e2833010 	add	r3, r3, #16
    b2d4:	e28cc010 	add	ip, ip, #16
    b2d8:	8afffff2 	bhi	b2a8 <memmove+0x80>
    b2dc:	e2423010 	sub	r3, r2, #16
    b2e0:	e3c3300f 	bic	r3, r3, #15
    b2e4:	e202600f 	and	r6, r2, #15
    b2e8:	e2833010 	add	r3, r3, #16
    b2ec:	e3560003 	cmp	r6, #3
    b2f0:	e0811003 	add	r1, r1, r3
    b2f4:	e0803003 	add	r3, r0, r3
    b2f8:	9a00001a 	bls	b368 <memmove+0x140>
    b2fc:	e1a04001 	mov	r4, r1
    b300:	e1a0c006 	mov	ip, r6
    b304:	e243e004 	sub	lr, r3, #4
    b308:	e24cc004 	sub	ip, ip, #4
    b30c:	e4945004 	ldr	r5, [r4], #4
    b310:	e35c0003 	cmp	ip, #3
    b314:	e5ae5004 	str	r5, [lr, #4]!
    b318:	8afffffa 	bhi	b308 <memmove+0xe0>
    b31c:	e246c004 	sub	ip, r6, #4
    b320:	e3ccc003 	bic	ip, ip, #3
    b324:	e28cc004 	add	ip, ip, #4
    b328:	e081100c 	add	r1, r1, ip
    b32c:	e083300c 	add	r3, r3, ip
    b330:	e2022003 	and	r2, r2, #3
    b334:	e3520000 	cmp	r2, #0
    b338:	12433001 	subne	r3, r3, #1
    b33c:	10812002 	addne	r2, r1, r2
    b340:	0a000003 	beq	b354 <memmove+0x12c>
    b344:	e4d1c001 	ldrb	ip, [r1], #1
    b348:	e1520001 	cmp	r2, r1
    b34c:	e5e3c001 	strb	ip, [r3, #1]!
    b350:	1afffffb 	bne	b344 <memmove+0x11c>
    b354:	e8bd4070 	pop	{r4, r5, r6, lr}
    b358:	e12fff1e 	bx	lr
    b35c:	e1a03000 	mov	r3, r0
    b360:	eaffffc2 	b	b270 <memmove+0x48>
    b364:	e12fff1e 	bx	lr
    b368:	e1a02006 	mov	r2, r6
    b36c:	eafffff0 	b	b334 <memmove+0x10c>

0000b370 <memset>:
    b370:	e3100003 	tst	r0, #3
    b374:	0a000040 	beq	b47c <memset+0x10c>
    b378:	e3520000 	cmp	r2, #0
    b37c:	e2422001 	sub	r2, r2, #1
    b380:	012fff1e 	bxeq	lr
    b384:	e201c0ff 	and	ip, r1, #255	; 0xff
    b388:	e1a03000 	mov	r3, r0
    b38c:	ea000002 	b	b39c <memset+0x2c>
    b390:	e2422001 	sub	r2, r2, #1
    b394:	e3720001 	cmn	r2, #1
    b398:	012fff1e 	bxeq	lr
    b39c:	e4c3c001 	strb	ip, [r3], #1
    b3a0:	e3130003 	tst	r3, #3
    b3a4:	1afffff9 	bne	b390 <memset+0x20>
    b3a8:	e3520003 	cmp	r2, #3
    b3ac:	9a00002a 	bls	b45c <memset+0xec>
    b3b0:	e92d4010 	push	{r4, lr}
    b3b4:	e201e0ff 	and	lr, r1, #255	; 0xff
    b3b8:	e18ee40e 	orr	lr, lr, lr, lsl #8
    b3bc:	e352000f 	cmp	r2, #15
    b3c0:	e18ee80e 	orr	lr, lr, lr, lsl #16
    b3c4:	9a000010 	bls	b40c <memset+0x9c>
    b3c8:	e1a04002 	mov	r4, r2
    b3cc:	e283c010 	add	ip, r3, #16
    b3d0:	e2444010 	sub	r4, r4, #16
    b3d4:	e354000f 	cmp	r4, #15
    b3d8:	e50ce010 	str	lr, [ip, #-16]
    b3dc:	e50ce00c 	str	lr, [ip, #-12]
    b3e0:	e50ce008 	str	lr, [ip, #-8]
    b3e4:	e50ce004 	str	lr, [ip, #-4]
    b3e8:	e28cc010 	add	ip, ip, #16
    b3ec:	8afffff7 	bhi	b3d0 <memset+0x60>
    b3f0:	e242c010 	sub	ip, r2, #16
    b3f4:	e3ccc00f 	bic	ip, ip, #15
    b3f8:	e202200f 	and	r2, r2, #15
    b3fc:	e28cc010 	add	ip, ip, #16
    b400:	e3520003 	cmp	r2, #3
    b404:	e083300c 	add	r3, r3, ip
    b408:	9a00000a 	bls	b438 <memset+0xc8>
    b40c:	e1a04003 	mov	r4, r3
    b410:	e1a0c002 	mov	ip, r2
    b414:	e24cc004 	sub	ip, ip, #4
    b418:	e35c0003 	cmp	ip, #3
    b41c:	e484e004 	str	lr, [r4], #4
    b420:	8afffffb 	bhi	b414 <memset+0xa4>
    b424:	e242c004 	sub	ip, r2, #4
    b428:	e3ccc003 	bic	ip, ip, #3
    b42c:	e28cc004 	add	ip, ip, #4
    b430:	e083300c 	add	r3, r3, ip
    b434:	e2022003 	and	r2, r2, #3
    b438:	e3520000 	cmp	r2, #0
    b43c:	0a000004 	beq	b454 <memset+0xe4>
    b440:	e20110ff 	and	r1, r1, #255	; 0xff
    b444:	e0832002 	add	r2, r3, r2
    b448:	e4c31001 	strb	r1, [r3], #1
    b44c:	e1520003 	cmp	r2, r3
    b450:	1afffffc 	bne	b448 <memset+0xd8>
    b454:	e8bd4010 	pop	{r4, lr}
    b458:	e12fff1e 	bx	lr
    b45c:	e3520000 	cmp	r2, #0
    b460:	012fff1e 	bxeq	lr
    b464:	e20110ff 	and	r1, r1, #255	; 0xff
    b468:	e0832002 	add	r2, r3, r2
    b46c:	e4c31001 	strb	r1, [r3], #1
    b470:	e1520003 	cmp	r2, r3
    b474:	1afffffc 	bne	b46c <memset+0xfc>
    b478:	e12fff1e 	bx	lr
    b47c:	e1a03000 	mov	r3, r0
    b480:	eaffffc8 	b	b3a8 <memset+0x38>

0000b484 <strlen>:
    b484:	e3c01003 	bic	r1, r0, #3
    b488:	e2100003 	ands	r0, r0, #3
    b48c:	e2600000 	rsb	r0, r0, #0
    b490:	e4913004 	ldr	r3, [r1], #4
    b494:	e280c004 	add	ip, r0, #4
    b498:	e1a0c18c 	lsl	ip, ip, #3
    b49c:	e3e02000 	mvn	r2, #0
    b4a0:	11833c32 	orrne	r3, r3, r2, lsr ip
    b4a4:	e3a0c001 	mov	ip, #1
    b4a8:	e18cc40c 	orr	ip, ip, ip, lsl #8
    b4ac:	e18cc80c 	orr	ip, ip, ip, lsl #16
    b4b0:	e043200c 	sub	r2, r3, ip
    b4b4:	e1c22003 	bic	r2, r2, r3
    b4b8:	e012238c 	ands	r2, r2, ip, lsl #7
    b4bc:	04913004 	ldreq	r3, [r1], #4
    b4c0:	02800004 	addeq	r0, r0, #4
    b4c4:	0afffff9 	beq	b4b0 <strlen+0x2c>
    b4c8:	e31300ff 	tst	r3, #255	; 0xff
    b4cc:	12800001 	addne	r0, r0, #1
    b4d0:	13130cff 	tstne	r3, #65280	; 0xff00
    b4d4:	12800001 	addne	r0, r0, #1
    b4d8:	131308ff 	tstne	r3, #16711680	; 0xff0000
    b4dc:	12800001 	addne	r0, r0, #1
    b4e0:	e12fff1e 	bx	lr

0000b4e4 <__sprint_r.part.0>:
    b4e4:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b4e8:	e5913064 	ldr	r3, [r1, #100]	; 0x64
    b4ec:	e3130a02 	tst	r3, #8192	; 0x2000
    b4f0:	e1a0b002 	mov	fp, r2
    b4f4:	0a000024 	beq	b58c <__sprint_r.part.0+0xa8>
    b4f8:	e5923008 	ldr	r3, [r2, #8]
    b4fc:	e5929000 	ldr	r9, [r2]
    b500:	e3530000 	cmp	r3, #0
    b504:	11a06001 	movne	r6, r1
    b508:	11a07000 	movne	r7, r0
    b50c:	12899008 	addne	r9, r9, #8
    b510:	0a00001b 	beq	b584 <__sprint_r.part.0+0xa0>
    b514:	e519a004 	ldr	sl, [r9, #-4]
    b518:	e5195008 	ldr	r5, [r9, #-8]
    b51c:	e1b0812a 	lsrs	r8, sl, #2
    b520:	13a04000 	movne	r4, #0
    b524:	12455004 	subne	r5, r5, #4
    b528:	1a000002 	bne	b538 <__sprint_r.part.0+0x54>
    b52c:	ea00000e 	b	b56c <__sprint_r.part.0+0x88>
    b530:	e1580004 	cmp	r8, r4
    b534:	0a00000b 	beq	b568 <__sprint_r.part.0+0x84>
    b538:	e1a02006 	mov	r2, r6
    b53c:	e5b51004 	ldr	r1, [r5, #4]!
    b540:	e1a00007 	mov	r0, r7
    b544:	eb000777 	bl	d328 <_fputwc_r>
    b548:	e3700001 	cmn	r0, #1
    b54c:	e2844001 	add	r4, r4, #1
    b550:	1afffff6 	bne	b530 <__sprint_r.part.0+0x4c>
    b554:	e3a03000 	mov	r3, #0
    b558:	e58b3008 	str	r3, [fp, #8]
    b55c:	e58b3004 	str	r3, [fp, #4]
    b560:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b564:	e12fff1e 	bx	lr
    b568:	e59b3008 	ldr	r3, [fp, #8]
    b56c:	e3caa003 	bic	sl, sl, #3
    b570:	e043300a 	sub	r3, r3, sl
    b574:	e3530000 	cmp	r3, #0
    b578:	e58b3008 	str	r3, [fp, #8]
    b57c:	e2899008 	add	r9, r9, #8
    b580:	1affffe3 	bne	b514 <__sprint_r.part.0+0x30>
    b584:	e3a00000 	mov	r0, #0
    b588:	eafffff1 	b	b554 <__sprint_r.part.0+0x70>
    b58c:	eb00089d 	bl	d808 <__sfvwrite_r>
    b590:	eaffffef 	b	b554 <__sprint_r.part.0+0x70>

0000b594 <__sprint_r>:
    b594:	e5923008 	ldr	r3, [r2, #8]
    b598:	e3530000 	cmp	r3, #0
    b59c:	1affffd0 	bne	b4e4 <__sprint_r.part.0>
    b5a0:	e5823004 	str	r3, [r2, #4]
    b5a4:	e1a00003 	mov	r0, r3
    b5a8:	e12fff1e 	bx	lr

0000b5ac <_vfiprintf_r>:
    b5ac:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b5b0:	e1a05003 	mov	r5, r3
    b5b4:	e24dd0b4 	sub	sp, sp, #180	; 0xb4
    b5b8:	e2503000 	subs	r3, r0, #0
    b5bc:	e58d3014 	str	r3, [sp, #20]
    b5c0:	e1a0a001 	mov	sl, r1
    b5c4:	e1a09002 	mov	r9, r2
    b5c8:	e58d5018 	str	r5, [sp, #24]
    b5cc:	0a000002 	beq	b5dc <_vfiprintf_r+0x30>
    b5d0:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    b5d4:	e3530000 	cmp	r3, #0
    b5d8:	0a0000cf 	beq	b91c <_vfiprintf_r+0x370>
    b5dc:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    b5e0:	e3130001 	tst	r3, #1
    b5e4:	e1da30fc 	ldrsh	r3, [sl, #12]
    b5e8:	e1a01803 	lsl	r1, r3, #16
    b5ec:	1a0000a7 	bne	b890 <_vfiprintf_r+0x2e4>
    b5f0:	e3110402 	tst	r1, #33554432	; 0x2000000
    b5f4:	e1a01821 	lsr	r1, r1, #16
    b5f8:	0a0000a0 	beq	b880 <_vfiprintf_r+0x2d4>
    b5fc:	e3110a02 	tst	r1, #8192	; 0x2000
    b600:	1a000006 	bne	b620 <_vfiprintf_r+0x74>
    b604:	e59a2064 	ldr	r2, [sl, #100]	; 0x64
    b608:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    b60c:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
    b610:	e1ca30bc 	strh	r3, [sl, #12]
    b614:	e58a2064 	str	r2, [sl, #100]	; 0x64
    b618:	e1a03803 	lsl	r3, r3, #16
    b61c:	e1a01823 	lsr	r1, r3, #16
    b620:	e3110008 	tst	r1, #8
    b624:	0a0000a0 	beq	b8ac <_vfiprintf_r+0x300>
    b628:	e59a3010 	ldr	r3, [sl, #16]
    b62c:	e3530000 	cmp	r3, #0
    b630:	0a00009d 	beq	b8ac <_vfiprintf_r+0x300>
    b634:	e201301a 	and	r3, r1, #26
    b638:	e353000a 	cmp	r3, #10
    b63c:	0a0000a3 	beq	b8d0 <_vfiprintf_r+0x324>
    b640:	e3a03000 	mov	r3, #0
    b644:	e28d8070 	add	r8, sp, #112	; 0x70
    b648:	e1a0b008 	mov	fp, r8
    b64c:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    b650:	e58d3008 	str	r3, [sp, #8]
    b654:	e58d3044 	str	r3, [sp, #68]	; 0x44
    b658:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b65c:	e58d803c 	str	r8, [sp, #60]	; 0x3c
    b660:	e58da00c 	str	sl, [sp, #12]
    b664:	e5d93000 	ldrb	r3, [r9]
    b668:	e3530000 	cmp	r3, #0
    b66c:	13530025 	cmpne	r3, #37	; 0x25
    b670:	e1a04009 	mov	r4, r9
    b674:	0a000013 	beq	b6c8 <_vfiprintf_r+0x11c>
    b678:	e5f43001 	ldrb	r3, [r4, #1]!
    b67c:	e3530000 	cmp	r3, #0
    b680:	13530025 	cmpne	r3, #37	; 0x25
    b684:	1afffffb 	bne	b678 <_vfiprintf_r+0xcc>
    b688:	e0545009 	subs	r5, r4, r9
    b68c:	0a00000d 	beq	b6c8 <_vfiprintf_r+0x11c>
    b690:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    b694:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    b698:	e2833001 	add	r3, r3, #1
    b69c:	e3530007 	cmp	r3, #7
    b6a0:	e0852002 	add	r2, r5, r2
    b6a4:	e58b9000 	str	r9, [fp]
    b6a8:	e58b5004 	str	r5, [fp, #4]
    b6ac:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b6b0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b6b4:	d28bb008 	addle	fp, fp, #8
    b6b8:	ca000076 	bgt	b898 <_vfiprintf_r+0x2ec>
    b6bc:	e59d3008 	ldr	r3, [sp, #8]
    b6c0:	e0833005 	add	r3, r3, r5
    b6c4:	e58d3008 	str	r3, [sp, #8]
    b6c8:	e5d43000 	ldrb	r3, [r4]
    b6cc:	e3530000 	cmp	r3, #0
    b6d0:	0a00042f 	beq	c794 <_vfiprintf_r+0x11e8>
    b6d4:	e3a01000 	mov	r1, #0
    b6d8:	e3a03000 	mov	r3, #0
    b6dc:	e3e0a000 	mvn	sl, #0
    b6e0:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    b6e4:	e2849001 	add	r9, r4, #1
    b6e8:	e5d43001 	ldrb	r3, [r4, #1]
    b6ec:	e1a0c001 	mov	ip, r1
    b6f0:	e1a00001 	mov	r0, r1
    b6f4:	e1a05001 	mov	r5, r1
    b6f8:	e1a0700a 	mov	r7, sl
    b6fc:	e3a0e001 	mov	lr, #1
    b700:	e3a0402b 	mov	r4, #43	; 0x2b
    b704:	e3a06020 	mov	r6, #32
    b708:	e2899001 	add	r9, r9, #1
    b70c:	e2432020 	sub	r2, r3, #32
    b710:	e3520058 	cmp	r2, #88	; 0x58
    b714:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
    b718:	ea000220 	b	bfa0 <_vfiprintf_r+0x9f4>
    b71c:	0000bf8c 	.word	0x0000bf8c
    b720:	0000bfa0 	.word	0x0000bfa0
    b724:	0000bfa0 	.word	0x0000bfa0
    b728:	0000bf68 	.word	0x0000bf68
    b72c:	0000bfa0 	.word	0x0000bfa0
    b730:	0000bfa0 	.word	0x0000bfa0
    b734:	0000bfa0 	.word	0x0000bfa0
    b738:	0000bfa0 	.word	0x0000bfa0
    b73c:	0000bfa0 	.word	0x0000bfa0
    b740:	0000bfa0 	.word	0x0000bfa0
    b744:	0000b924 	.word	0x0000b924
    b748:	0000bd74 	.word	0x0000bd74
    b74c:	0000bfa0 	.word	0x0000bfa0
    b750:	0000b940 	.word	0x0000b940
    b754:	0000bd0c 	.word	0x0000bd0c
    b758:	0000bfa0 	.word	0x0000bfa0
    b75c:	0000bd84 	.word	0x0000bd84
    b760:	0000bd90 	.word	0x0000bd90
    b764:	0000bd90 	.word	0x0000bd90
    b768:	0000bd90 	.word	0x0000bd90
    b76c:	0000bd90 	.word	0x0000bd90
    b770:	0000bd90 	.word	0x0000bd90
    b774:	0000bd90 	.word	0x0000bd90
    b778:	0000bd90 	.word	0x0000bd90
    b77c:	0000bd90 	.word	0x0000bd90
    b780:	0000bd90 	.word	0x0000bd90
    b784:	0000bfa0 	.word	0x0000bfa0
    b788:	0000bfa0 	.word	0x0000bfa0
    b78c:	0000bfa0 	.word	0x0000bfa0
    b790:	0000bfa0 	.word	0x0000bfa0
    b794:	0000bfa0 	.word	0x0000bfa0
    b798:	0000bfa0 	.word	0x0000bfa0
    b79c:	0000bfa0 	.word	0x0000bfa0
    b7a0:	0000bfa0 	.word	0x0000bfa0
    b7a4:	0000bfa0 	.word	0x0000bfa0
    b7a8:	0000bfa0 	.word	0x0000bfa0
    b7ac:	0000bdb4 	.word	0x0000bdb4
    b7b0:	0000bfa0 	.word	0x0000bfa0
    b7b4:	0000bfa0 	.word	0x0000bfa0
    b7b8:	0000bfa0 	.word	0x0000bfa0
    b7bc:	0000bfa0 	.word	0x0000bfa0
    b7c0:	0000bfa0 	.word	0x0000bfa0
    b7c4:	0000bfa0 	.word	0x0000bfa0
    b7c8:	0000bfa0 	.word	0x0000bfa0
    b7cc:	0000bfa0 	.word	0x0000bfa0
    b7d0:	0000bfa0 	.word	0x0000bfa0
    b7d4:	0000bfa0 	.word	0x0000bfa0
    b7d8:	0000bc48 	.word	0x0000bc48
    b7dc:	0000bfa0 	.word	0x0000bfa0
    b7e0:	0000bfa0 	.word	0x0000bfa0
    b7e4:	0000bfa0 	.word	0x0000bfa0
    b7e8:	0000bfa0 	.word	0x0000bfa0
    b7ec:	0000bfa0 	.word	0x0000bfa0
    b7f0:	0000bc54 	.word	0x0000bc54
    b7f4:	0000bfa0 	.word	0x0000bfa0
    b7f8:	0000bfa0 	.word	0x0000bfa0
    b7fc:	0000beb8 	.word	0x0000beb8
    b800:	0000bfa0 	.word	0x0000bfa0
    b804:	0000bfa0 	.word	0x0000bfa0
    b808:	0000bfa0 	.word	0x0000bfa0
    b80c:	0000bfa0 	.word	0x0000bfa0
    b810:	0000bfa0 	.word	0x0000bfa0
    b814:	0000bfa0 	.word	0x0000bfa0
    b818:	0000bfa0 	.word	0x0000bfa0
    b81c:	0000bfa0 	.word	0x0000bfa0
    b820:	0000bfa0 	.word	0x0000bfa0
    b824:	0000bfa0 	.word	0x0000bfa0
    b828:	0000bf2c 	.word	0x0000bf2c
    b82c:	0000bea8 	.word	0x0000bea8
    b830:	0000bfa0 	.word	0x0000bfa0
    b834:	0000bfa0 	.word	0x0000bfa0
    b838:	0000bfa0 	.word	0x0000bfa0
    b83c:	0000bd4c 	.word	0x0000bd4c
    b840:	0000bea8 	.word	0x0000bea8
    b844:	0000bfa0 	.word	0x0000bfa0
    b848:	0000bfa0 	.word	0x0000bfa0
    b84c:	0000bd58 	.word	0x0000bd58
    b850:	0000bfa0 	.word	0x0000bfa0
    b854:	0000be6c 	.word	0x0000be6c
    b858:	0000bc0c 	.word	0x0000bc0c
    b85c:	0000bc60 	.word	0x0000bc60
    b860:	0000bc9c 	.word	0x0000bc9c
    b864:	0000bfa0 	.word	0x0000bfa0
    b868:	0000bca8 	.word	0x0000bca8
    b86c:	0000bfa0 	.word	0x0000bfa0
    b870:	0000b94c 	.word	0x0000b94c
    b874:	0000bfa0 	.word	0x0000bfa0
    b878:	0000bfa0 	.word	0x0000bfa0
    b87c:	0000bf74 	.word	0x0000bf74
    b880:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    b884:	eb000995 	bl	dee0 <__retarget_lock_acquire_recursive>
    b888:	e1da30fc 	ldrsh	r3, [sl, #12]
    b88c:	e1a01803 	lsl	r1, r3, #16
    b890:	e1a01821 	lsr	r1, r1, #16
    b894:	eaffff58 	b	b5fc <_vfiprintf_r+0x50>
    b898:	e3520000 	cmp	r2, #0
    b89c:	1a000314 	bne	c4f4 <_vfiprintf_r+0xf48>
    b8a0:	e58d2040 	str	r2, [sp, #64]	; 0x40
    b8a4:	e1a0b008 	mov	fp, r8
    b8a8:	eaffff83 	b	b6bc <_vfiprintf_r+0x110>
    b8ac:	e1a0100a 	mov	r1, sl
    b8b0:	e59d0014 	ldr	r0, [sp, #20]
    b8b4:	eb000438 	bl	c99c <__swsetup_r>
    b8b8:	e3500000 	cmp	r0, #0
    b8bc:	1a0002f6 	bne	c49c <_vfiprintf_r+0xef0>
    b8c0:	e1da10bc 	ldrh	r1, [sl, #12]
    b8c4:	e201301a 	and	r3, r1, #26
    b8c8:	e353000a 	cmp	r3, #10
    b8cc:	1affff5b 	bne	b640 <_vfiprintf_r+0x94>
    b8d0:	e1da30fe 	ldrsh	r3, [sl, #14]
    b8d4:	e3530000 	cmp	r3, #0
    b8d8:	baffff58 	blt	b640 <_vfiprintf_r+0x94>
    b8dc:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    b8e0:	e3130001 	tst	r3, #1
    b8e4:	1a000002 	bne	b8f4 <_vfiprintf_r+0x348>
    b8e8:	e3110c02 	tst	r1, #512	; 0x200
    b8ec:	059a0058 	ldreq	r0, [sl, #88]	; 0x58
    b8f0:	0b000980 	bleq	def8 <__retarget_lock_release_recursive>
    b8f4:	e1a03005 	mov	r3, r5
    b8f8:	e1a02009 	mov	r2, r9
    b8fc:	e1a0100a 	mov	r1, sl
    b900:	e59d0014 	ldr	r0, [sp, #20]
    b904:	eb0003f0 	bl	c8cc <__sbprintf>
    b908:	e58d0008 	str	r0, [sp, #8]
    b90c:	e59d0008 	ldr	r0, [sp, #8]
    b910:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    b914:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b918:	e12fff1e 	bx	lr
    b91c:	eb0005a0 	bl	cfa4 <__sinit>
    b920:	eaffff2d 	b	b5dc <_vfiprintf_r+0x30>
    b924:	e59d3018 	ldr	r3, [sp, #24]
    b928:	e5930000 	ldr	r0, [r3]
    b92c:	e2833004 	add	r3, r3, #4
    b930:	e3500000 	cmp	r0, #0
    b934:	e58d3018 	str	r3, [sp, #24]
    b938:	aa000001 	bge	b944 <_vfiprintf_r+0x398>
    b93c:	e2600000 	rsb	r0, r0, #0
    b940:	e3855004 	orr	r5, r5, #4
    b944:	e5d93000 	ldrb	r3, [r9]
    b948:	eaffff6e 	b	b708 <_vfiprintf_r+0x15c>
    b94c:	e58d001c 	str	r0, [sp, #28]
    b950:	e3150020 	tst	r5, #32
    b954:	1a00032b 	bne	c608 <_vfiprintf_r+0x105c>
    b958:	e59d2018 	ldr	r2, [sp, #24]
    b95c:	e3150010 	tst	r5, #16
    b960:	e1a03002 	mov	r3, r2
    b964:	1a0002f0 	bne	c52c <_vfiprintf_r+0xf80>
    b968:	e3150040 	tst	r5, #64	; 0x40
    b96c:	0a0002ee 	beq	c52c <_vfiprintf_r+0xf80>
    b970:	e3a03001 	mov	r3, #1
    b974:	e3a07000 	mov	r7, #0
    b978:	e1d260b0 	ldrh	r6, [r2]
    b97c:	e2822004 	add	r2, r2, #4
    b980:	e58d2018 	str	r2, [sp, #24]
    b984:	e3a02000 	mov	r2, #0
    b988:	e3a04000 	mov	r4, #0
    b98c:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    b990:	e37a0001 	cmn	sl, #1
    b994:	0a00011e 	beq	be14 <_vfiprintf_r+0x868>
    b998:	e1862007 	orr	r2, r6, r7
    b99c:	e3520000 	cmp	r2, #0
    b9a0:	035a0000 	cmpeq	sl, #0
    b9a4:	e3c52080 	bic	r2, r5, #128	; 0x80
    b9a8:	e58d2004 	str	r2, [sp, #4]
    b9ac:	1a000298 	bne	c414 <_vfiprintf_r+0xe68>
    b9b0:	e3530000 	cmp	r3, #0
    b9b4:	1a000292 	bne	c404 <_vfiprintf_r+0xe58>
    b9b8:	e2153001 	ands	r3, r5, #1
    b9bc:	e58d3010 	str	r3, [sp, #16]
    b9c0:	058d8024 	streq	r8, [sp, #36]	; 0x24
    b9c4:	13a03030 	movne	r3, #48	; 0x30
    b9c8:	128d20b0 	addne	r2, sp, #176	; 0xb0
    b9cc:	15623041 	strbne	r3, [r2, #-65]!	; 0xffffffbf
    b9d0:	158d2024 	strne	r2, [sp, #36]	; 0x24
    b9d4:	e59d3010 	ldr	r3, [sp, #16]
    b9d8:	e15a0003 	cmp	sl, r3
    b9dc:	a1a0700a 	movge	r7, sl
    b9e0:	b1a07003 	movlt	r7, r3
    b9e4:	e3540000 	cmp	r4, #0
    b9e8:	12877001 	addne	r7, r7, #1
    b9ec:	e59d3004 	ldr	r3, [sp, #4]
    b9f0:	e2133002 	ands	r3, r3, #2
    b9f4:	e58d3020 	str	r3, [sp, #32]
    b9f8:	e59d3004 	ldr	r3, [sp, #4]
    b9fc:	12877002 	addne	r7, r7, #2
    ba00:	e2136084 	ands	r6, r3, #132	; 0x84
    ba04:	1a00018d 	bne	c040 <_vfiprintf_r+0xa94>
    ba08:	e59d301c 	ldr	r3, [sp, #28]
    ba0c:	e0434007 	sub	r4, r3, r7
    ba10:	e3540000 	cmp	r4, #0
    ba14:	da000189 	ble	c040 <_vfiprintf_r+0xa94>
    ba18:	e3540010 	cmp	r4, #16
    ba1c:	da000378 	ble	c804 <_vfiprintf_r+0x1258>
    ba20:	e1a0e00b 	mov	lr, fp
    ba24:	e3a05010 	mov	r5, #16
    ba28:	e1a0b007 	mov	fp, r7
    ba2c:	e3a03001 	mov	r3, #1
    ba30:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    ba34:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    ba38:	e59d7014 	ldr	r7, [sp, #20]
    ba3c:	ea000005 	b	ba58 <_vfiprintf_r+0x4ac>
    ba40:	e28c1002 	add	r1, ip, #2
    ba44:	e1a0c000 	mov	ip, r0
    ba48:	e28ee008 	add	lr, lr, #8
    ba4c:	e2444010 	sub	r4, r4, #16
    ba50:	e3540010 	cmp	r4, #16
    ba54:	da00000f 	ble	ba98 <_vfiprintf_r+0x4ec>
    ba58:	e28c0001 	add	r0, ip, #1
    ba5c:	e59f1e38 	ldr	r1, [pc, #3640]	; c89c <_vfiprintf_r+0x12f0>
    ba60:	e2822010 	add	r2, r2, #16
    ba64:	e3500007 	cmp	r0, #7
    ba68:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ba6c:	e88e0022 	stm	lr, {r1, r5}
    ba70:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ba74:	dafffff1 	ble	ba40 <_vfiprintf_r+0x494>
    ba78:	e3520000 	cmp	r2, #0
    ba7c:	1a00015b 	bne	bff0 <_vfiprintf_r+0xa44>
    ba80:	e2444010 	sub	r4, r4, #16
    ba84:	e3540010 	cmp	r4, #16
    ba88:	e1a0c006 	mov	ip, r6
    ba8c:	e1a01003 	mov	r1, r3
    ba90:	e1a0e008 	mov	lr, r8
    ba94:	caffffef 	bgt	ba58 <_vfiprintf_r+0x4ac>
    ba98:	e1a0700b 	mov	r7, fp
    ba9c:	e1a0b00e 	mov	fp, lr
    baa0:	e59f3df4 	ldr	r3, [pc, #3572]	; c89c <_vfiprintf_r+0x12f0>
    baa4:	e3510007 	cmp	r1, #7
    baa8:	e0842002 	add	r2, r4, r2
    baac:	e88b0018 	stm	fp, {r3, r4}
    bab0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    bab4:	e58d1040 	str	r1, [sp, #64]	; 0x40
    bab8:	d28bb008 	addle	fp, fp, #8
    babc:	d2810001 	addle	r0, r1, #1
    bac0:	da000161 	ble	c04c <_vfiprintf_r+0xaa0>
    bac4:	e3520000 	cmp	r2, #0
    bac8:	1a000155 	bne	c024 <_vfiprintf_r+0xa78>
    bacc:	e5dd1037 	ldrb	r1, [sp, #55]	; 0x37
    bad0:	e3510000 	cmp	r1, #0
    bad4:	0a0002fb 	beq	c6c8 <_vfiprintf_r+0x111c>
    bad8:	e3a02001 	mov	r2, #1
    badc:	e1a0b008 	mov	fp, r8
    bae0:	e1a00002 	mov	r0, r2
    bae4:	e28d1037 	add	r1, sp, #55	; 0x37
    bae8:	e58d2074 	str	r2, [sp, #116]	; 0x74
    baec:	e58d1070 	str	r1, [sp, #112]	; 0x70
    baf0:	e1a01000 	mov	r1, r0
    baf4:	e28bb008 	add	fp, fp, #8
    baf8:	e2800001 	add	r0, r0, #1
    bafc:	e59d3020 	ldr	r3, [sp, #32]
    bb00:	e3530000 	cmp	r3, #0
    bb04:	0a00016a 	beq	c0b4 <_vfiprintf_r+0xb08>
    bb08:	e3a01002 	mov	r1, #2
    bb0c:	e28d3038 	add	r3, sp, #56	; 0x38
    bb10:	e0822001 	add	r2, r2, r1
    bb14:	e3500007 	cmp	r0, #7
    bb18:	e58d2044 	str	r2, [sp, #68]	; 0x44
    bb1c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    bb20:	e58b1004 	str	r1, [fp, #4]
    bb24:	e58b3000 	str	r3, [fp]
    bb28:	da00015e 	ble	c0a8 <_vfiprintf_r+0xafc>
    bb2c:	e3520000 	cmp	r2, #0
    bb30:	1a000292 	bne	c580 <_vfiprintf_r+0xfd4>
    bb34:	e3560080 	cmp	r6, #128	; 0x80
    bb38:	e3a00001 	mov	r0, #1
    bb3c:	e3a01000 	mov	r1, #0
    bb40:	e1a0b008 	mov	fp, r8
    bb44:	1a00015c 	bne	c0bc <_vfiprintf_r+0xb10>
    bb48:	e59d301c 	ldr	r3, [sp, #28]
    bb4c:	e0434007 	sub	r4, r3, r7
    bb50:	e3540000 	cmp	r4, #0
    bb54:	da000158 	ble	c0bc <_vfiprintf_r+0xb10>
    bb58:	e3540010 	cmp	r4, #16
    bb5c:	da00033b 	ble	c850 <_vfiprintf_r+0x12a4>
    bb60:	e1a0e00b 	mov	lr, fp
    bb64:	e3a05010 	mov	r5, #16
    bb68:	e1a0b007 	mov	fp, r7
    bb6c:	e3a06001 	mov	r6, #1
    bb70:	e1a07004 	mov	r7, r4
    bb74:	e59d4014 	ldr	r4, [sp, #20]
    bb78:	ea000005 	b	bb94 <_vfiprintf_r+0x5e8>
    bb7c:	e281c002 	add	ip, r1, #2
    bb80:	e1a01000 	mov	r1, r0
    bb84:	e28ee008 	add	lr, lr, #8
    bb88:	e2477010 	sub	r7, r7, #16
    bb8c:	e3570010 	cmp	r7, #16
    bb90:	da00000f 	ble	bbd4 <_vfiprintf_r+0x628>
    bb94:	e2810001 	add	r0, r1, #1
    bb98:	e59f3d00 	ldr	r3, [pc, #3328]	; c8a0 <_vfiprintf_r+0x12f4>
    bb9c:	e2822010 	add	r2, r2, #16
    bba0:	e3500007 	cmp	r0, #7
    bba4:	e58d2044 	str	r2, [sp, #68]	; 0x44
    bba8:	e88e0028 	stm	lr, {r3, r5}
    bbac:	e58d0040 	str	r0, [sp, #64]	; 0x40
    bbb0:	dafffff1 	ble	bb7c <_vfiprintf_r+0x5d0>
    bbb4:	e3520000 	cmp	r2, #0
    bbb8:	1a000206 	bne	c3d8 <_vfiprintf_r+0xe2c>
    bbbc:	e2477010 	sub	r7, r7, #16
    bbc0:	e3570010 	cmp	r7, #16
    bbc4:	e1a0c006 	mov	ip, r6
    bbc8:	e3a01000 	mov	r1, #0
    bbcc:	e1a0e008 	mov	lr, r8
    bbd0:	caffffef 	bgt	bb94 <_vfiprintf_r+0x5e8>
    bbd4:	e1a04007 	mov	r4, r7
    bbd8:	e1a0700b 	mov	r7, fp
    bbdc:	e1a0b00e 	mov	fp, lr
    bbe0:	e59f3cb8 	ldr	r3, [pc, #3256]	; c8a0 <_vfiprintf_r+0x12f4>
    bbe4:	e0822004 	add	r2, r2, r4
    bbe8:	e35c0007 	cmp	ip, #7
    bbec:	e58d2044 	str	r2, [sp, #68]	; 0x44
    bbf0:	e88b0018 	stm	fp, {r3, r4}
    bbf4:	e58dc040 	str	ip, [sp, #64]	; 0x40
    bbf8:	ca00026b 	bgt	c5ac <_vfiprintf_r+0x1000>
    bbfc:	e28bb008 	add	fp, fp, #8
    bc00:	e28c0001 	add	r0, ip, #1
    bc04:	e1a0100c 	mov	r1, ip
    bc08:	ea00012b 	b	c0bc <_vfiprintf_r+0xb10>
    bc0c:	e58d001c 	str	r0, [sp, #28]
    bc10:	e3150020 	tst	r5, #32
    bc14:	1a000283 	bne	c628 <_vfiprintf_r+0x107c>
    bc18:	e59d2018 	ldr	r2, [sp, #24]
    bc1c:	e3150010 	tst	r5, #16
    bc20:	e1a03002 	mov	r3, r2
    bc24:	1a00023a 	bne	c514 <_vfiprintf_r+0xf68>
    bc28:	e3150040 	tst	r5, #64	; 0x40
    bc2c:	0a000238 	beq	c514 <_vfiprintf_r+0xf68>
    bc30:	e1d260b0 	ldrh	r6, [r2]
    bc34:	e2822004 	add	r2, r2, #4
    bc38:	e3a03000 	mov	r3, #0
    bc3c:	e58d2018 	str	r2, [sp, #24]
    bc40:	e3a07000 	mov	r7, #0
    bc44:	eaffff4e 	b	b984 <_vfiprintf_r+0x3d8>
    bc48:	e58d001c 	str	r0, [sp, #28]
    bc4c:	e3855010 	orr	r5, r5, #16
    bc50:	eaffffee 	b	bc10 <_vfiprintf_r+0x664>
    bc54:	e58d001c 	str	r0, [sp, #28]
    bc58:	e3855010 	orr	r5, r5, #16
    bc5c:	eaffff3b 	b	b950 <_vfiprintf_r+0x3a4>
    bc60:	e3a03078 	mov	r3, #120	; 0x78
    bc64:	e3a02030 	mov	r2, #48	; 0x30
    bc68:	e59d1018 	ldr	r1, [sp, #24]
    bc6c:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    bc70:	e2813004 	add	r3, r1, #4
    bc74:	e58d3018 	str	r3, [sp, #24]
    bc78:	e59f3c24 	ldr	r3, [pc, #3108]	; c8a4 <_vfiprintf_r+0x12f8>
    bc7c:	e58d001c 	str	r0, [sp, #28]
    bc80:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    bc84:	e5916000 	ldr	r6, [r1]
    bc88:	e3855002 	orr	r5, r5, #2
    bc8c:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    bc90:	e3a07000 	mov	r7, #0
    bc94:	e3a03002 	mov	r3, #2
    bc98:	eaffff39 	b	b984 <_vfiprintf_r+0x3d8>
    bc9c:	e3855020 	orr	r5, r5, #32
    bca0:	e5d93000 	ldrb	r3, [r9]
    bca4:	eafffe97 	b	b708 <_vfiprintf_r+0x15c>
    bca8:	e59d3018 	ldr	r3, [sp, #24]
    bcac:	e5932000 	ldr	r2, [r3]
    bcb0:	e58d2024 	str	r2, [sp, #36]	; 0x24
    bcb4:	e3520000 	cmp	r2, #0
    bcb8:	e3a02000 	mov	r2, #0
    bcbc:	e58d001c 	str	r0, [sp, #28]
    bcc0:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    bcc4:	e2834004 	add	r4, r3, #4
    bcc8:	0a0002d1 	beq	c814 <_vfiprintf_r+0x1268>
    bccc:	e37a0001 	cmn	sl, #1
    bcd0:	0a0002b8 	beq	c7b8 <_vfiprintf_r+0x120c>
    bcd4:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
    bcd8:	e1a0200a 	mov	r2, sl
    bcdc:	e3a01000 	mov	r1, #0
    bce0:	e1a00006 	mov	r0, r6
    bce4:	eb000aef 	bl	e8a8 <memchr>
    bce8:	e3500000 	cmp	r0, #0
    bcec:	0a0002d1 	beq	c838 <_vfiprintf_r+0x128c>
    bcf0:	e0403006 	sub	r3, r0, r6
    bcf4:	e58d4018 	str	r4, [sp, #24]
    bcf8:	e58d3010 	str	r3, [sp, #16]
    bcfc:	e58d5004 	str	r5, [sp, #4]
    bd00:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    bd04:	e3a0a000 	mov	sl, #0
    bd08:	eaffff31 	b	b9d4 <_vfiprintf_r+0x428>
    bd0c:	e5d93000 	ldrb	r3, [r9]
    bd10:	e353002a 	cmp	r3, #42	; 0x2a
    bd14:	e289a001 	add	sl, r9, #1
    bd18:	0a0002d5 	beq	c874 <_vfiprintf_r+0x12c8>
    bd1c:	e2432030 	sub	r2, r3, #48	; 0x30
    bd20:	e3520009 	cmp	r2, #9
    bd24:	e1a0900a 	mov	r9, sl
    bd28:	e3a0a000 	mov	sl, #0
    bd2c:	8afffe76 	bhi	b70c <_vfiprintf_r+0x160>
    bd30:	e4d93001 	ldrb	r3, [r9], #1
    bd34:	e08aa10a 	add	sl, sl, sl, lsl #2
    bd38:	e082a08a 	add	sl, r2, sl, lsl #1
    bd3c:	e2432030 	sub	r2, r3, #48	; 0x30
    bd40:	e3520009 	cmp	r2, #9
    bd44:	9afffff9 	bls	bd30 <_vfiprintf_r+0x784>
    bd48:	eafffe6f 	b	b70c <_vfiprintf_r+0x160>
    bd4c:	e3855040 	orr	r5, r5, #64	; 0x40
    bd50:	e5d93000 	ldrb	r3, [r9]
    bd54:	eafffe6b 	b	b708 <_vfiprintf_r+0x15c>
    bd58:	e5d93000 	ldrb	r3, [r9]
    bd5c:	e353006c 	cmp	r3, #108	; 0x6c
    bd60:	05d93001 	ldrbeq	r3, [r9, #1]
    bd64:	03855020 	orreq	r5, r5, #32
    bd68:	02899001 	addeq	r9, r9, #1
    bd6c:	13855010 	orrne	r5, r5, #16
    bd70:	eafffe64 	b	b708 <_vfiprintf_r+0x15c>
    bd74:	e5d93000 	ldrb	r3, [r9]
    bd78:	e1a0100e 	mov	r1, lr
    bd7c:	e1a0c004 	mov	ip, r4
    bd80:	eafffe60 	b	b708 <_vfiprintf_r+0x15c>
    bd84:	e3855080 	orr	r5, r5, #128	; 0x80
    bd88:	e5d93000 	ldrb	r3, [r9]
    bd8c:	eafffe5d 	b	b708 <_vfiprintf_r+0x15c>
    bd90:	e3a00000 	mov	r0, #0
    bd94:	e2432030 	sub	r2, r3, #48	; 0x30
    bd98:	e4d93001 	ldrb	r3, [r9], #1
    bd9c:	e0800100 	add	r0, r0, r0, lsl #2
    bda0:	e0820080 	add	r0, r2, r0, lsl #1
    bda4:	e2432030 	sub	r2, r3, #48	; 0x30
    bda8:	e3520009 	cmp	r2, #9
    bdac:	9afffff9 	bls	bd98 <_vfiprintf_r+0x7ec>
    bdb0:	eafffe55 	b	b70c <_vfiprintf_r+0x160>
    bdb4:	e3510000 	cmp	r1, #0
    bdb8:	e58d001c 	str	r0, [sp, #28]
    bdbc:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    bdc0:	e3855010 	orr	r5, r5, #16
    bdc4:	e3150020 	tst	r5, #32
    bdc8:	1a0001ff 	bne	c5cc <_vfiprintf_r+0x1020>
    bdcc:	e3150010 	tst	r5, #16
    bdd0:	1a00025a 	bne	c740 <_vfiprintf_r+0x1194>
    bdd4:	e3150040 	tst	r5, #64	; 0x40
    bdd8:	0a000241 	beq	c6e4 <_vfiprintf_r+0x1138>
    bddc:	e59d3018 	ldr	r3, [sp, #24]
    bde0:	e1d360f0 	ldrsh	r6, [r3]
    bde4:	e2833004 	add	r3, r3, #4
    bde8:	e1a07fc6 	asr	r7, r6, #31
    bdec:	e58d3018 	str	r3, [sp, #24]
    bdf0:	e1a02006 	mov	r2, r6
    bdf4:	e1a03007 	mov	r3, r7
    bdf8:	e3520000 	cmp	r2, #0
    bdfc:	e2d33000 	sbcs	r3, r3, #0
    be00:	ba000229 	blt	c6ac <_vfiprintf_r+0x1100>
    be04:	e37a0001 	cmn	sl, #1
    be08:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    be0c:	e3a03001 	mov	r3, #1
    be10:	1afffee0 	bne	b998 <_vfiprintf_r+0x3ec>
    be14:	e3530001 	cmp	r3, #1
    be18:	0a000180 	beq	c420 <_vfiprintf_r+0xe74>
    be1c:	e3530002 	cmp	r3, #2
    be20:	11a01008 	movne	r1, r8
    be24:	1a000153 	bne	c378 <_vfiprintf_r+0xdcc>
    be28:	e1a02008 	mov	r2, r8
    be2c:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    be30:	e1a03226 	lsr	r3, r6, #4
    be34:	e1833e07 	orr	r3, r3, r7, lsl #28
    be38:	e1a00227 	lsr	r0, r7, #4
    be3c:	e206100f 	and	r1, r6, #15
    be40:	e1a07000 	mov	r7, r0
    be44:	e1a06003 	mov	r6, r3
    be48:	e7dc3001 	ldrb	r3, [ip, r1]
    be4c:	e1961007 	orrs	r1, r6, r7
    be50:	e5623001 	strb	r3, [r2, #-1]!
    be54:	1afffff5 	bne	be30 <_vfiprintf_r+0x884>
    be58:	e0483002 	sub	r3, r8, r2
    be5c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    be60:	e58d5004 	str	r5, [sp, #4]
    be64:	e58d3010 	str	r3, [sp, #16]
    be68:	eafffed9 	b	b9d4 <_vfiprintf_r+0x428>
    be6c:	e3510000 	cmp	r1, #0
    be70:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    be74:	e3150020 	tst	r5, #32
    be78:	1a00023d 	bne	c774 <_vfiprintf_r+0x11c8>
    be7c:	e3150010 	tst	r5, #16
    be80:	1a000053 	bne	bfd4 <_vfiprintf_r+0xa28>
    be84:	e3150040 	tst	r5, #64	; 0x40
    be88:	0a000051 	beq	bfd4 <_vfiprintf_r+0xa28>
    be8c:	e59d2018 	ldr	r2, [sp, #24]
    be90:	e5923000 	ldr	r3, [r2]
    be94:	e2822004 	add	r2, r2, #4
    be98:	e58d2018 	str	r2, [sp, #24]
    be9c:	e1dd20b8 	ldrh	r2, [sp, #8]
    bea0:	e1c320b0 	strh	r2, [r3]
    bea4:	eafffdee 	b	b664 <_vfiprintf_r+0xb8>
    bea8:	e3510000 	cmp	r1, #0
    beac:	e58d001c 	str	r0, [sp, #28]
    beb0:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    beb4:	eaffffc2 	b	bdc4 <_vfiprintf_r+0x818>
    beb8:	e59f29e8 	ldr	r2, [pc, #2536]	; c8a8 <_vfiprintf_r+0x12fc>
    bebc:	e3510000 	cmp	r1, #0
    bec0:	e58d001c 	str	r0, [sp, #28]
    bec4:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    bec8:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    becc:	e3150020 	tst	r5, #32
    bed0:	e59d2018 	ldr	r2, [sp, #24]
    bed4:	1a0001c5 	bne	c5f0 <_vfiprintf_r+0x1044>
    bed8:	e3150010 	tst	r5, #16
    bedc:	1a00021a 	bne	c74c <_vfiprintf_r+0x11a0>
    bee0:	e3150040 	tst	r5, #64	; 0x40
    bee4:	13a07000 	movne	r7, #0
    bee8:	03a07000 	moveq	r7, #0
    beec:	11d260b0 	ldrhne	r6, [r2]
    bef0:	05926000 	ldreq	r6, [r2]
    bef4:	12822004 	addne	r2, r2, #4
    bef8:	02822004 	addeq	r2, r2, #4
    befc:	158d2018 	strne	r2, [sp, #24]
    bf00:	058d2018 	streq	r2, [sp, #24]
    bf04:	e3150001 	tst	r5, #1
    bf08:	0a00016e 	beq	c4c8 <_vfiprintf_r+0xf1c>
    bf0c:	e1962007 	orrs	r2, r6, r7
    bf10:	0a00016c 	beq	c4c8 <_vfiprintf_r+0xf1c>
    bf14:	e3a02030 	mov	r2, #48	; 0x30
    bf18:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    bf1c:	e3855002 	orr	r5, r5, #2
    bf20:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    bf24:	e3a03002 	mov	r3, #2
    bf28:	eafffe95 	b	b984 <_vfiprintf_r+0x3d8>
    bf2c:	e3a07001 	mov	r7, #1
    bf30:	e3a01000 	mov	r1, #0
    bf34:	e59d2018 	ldr	r2, [sp, #24]
    bf38:	e5923000 	ldr	r3, [r2]
    bf3c:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    bf40:	e2823004 	add	r3, r2, #4
    bf44:	e58d3018 	str	r3, [sp, #24]
    bf48:	e28d3048 	add	r3, sp, #72	; 0x48
    bf4c:	e58d001c 	str	r0, [sp, #28]
    bf50:	e5cd1037 	strb	r1, [sp, #55]	; 0x37
    bf54:	e58d7010 	str	r7, [sp, #16]
    bf58:	e58d3024 	str	r3, [sp, #36]	; 0x24
    bf5c:	e58d5004 	str	r5, [sp, #4]
    bf60:	e3a0a000 	mov	sl, #0
    bf64:	eafffea0 	b	b9ec <_vfiprintf_r+0x440>
    bf68:	e3855001 	orr	r5, r5, #1
    bf6c:	e5d93000 	ldrb	r3, [r9]
    bf70:	eafffde4 	b	b708 <_vfiprintf_r+0x15c>
    bf74:	e59f2928 	ldr	r2, [pc, #2344]	; c8a4 <_vfiprintf_r+0x12f8>
    bf78:	e3510000 	cmp	r1, #0
    bf7c:	e58d001c 	str	r0, [sp, #28]
    bf80:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    bf84:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    bf88:	eaffffcf 	b	becc <_vfiprintf_r+0x920>
    bf8c:	e35c0000 	cmp	ip, #0
    bf90:	e5d93000 	ldrb	r3, [r9]
    bf94:	01a0100e 	moveq	r1, lr
    bf98:	01a0c006 	moveq	ip, r6
    bf9c:	eafffdd9 	b	b708 <_vfiprintf_r+0x15c>
    bfa0:	e3510000 	cmp	r1, #0
    bfa4:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    bfa8:	e3530000 	cmp	r3, #0
    bfac:	e58d001c 	str	r0, [sp, #28]
    bfb0:	0a0001f7 	beq	c794 <_vfiprintf_r+0x11e8>
    bfb4:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    bfb8:	e3a03000 	mov	r3, #0
    bfbc:	e3a07001 	mov	r7, #1
    bfc0:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    bfc4:	e28d3048 	add	r3, sp, #72	; 0x48
    bfc8:	e58d7010 	str	r7, [sp, #16]
    bfcc:	e58d3024 	str	r3, [sp, #36]	; 0x24
    bfd0:	eaffffe1 	b	bf5c <_vfiprintf_r+0x9b0>
    bfd4:	e59d2018 	ldr	r2, [sp, #24]
    bfd8:	e5923000 	ldr	r3, [r2]
    bfdc:	e2822004 	add	r2, r2, #4
    bfe0:	e58d2018 	str	r2, [sp, #24]
    bfe4:	e59d2008 	ldr	r2, [sp, #8]
    bfe8:	e5832000 	str	r2, [r3]
    bfec:	eafffd9c 	b	b664 <_vfiprintf_r+0xb8>
    bff0:	e28d203c 	add	r2, sp, #60	; 0x3c
    bff4:	e59d100c 	ldr	r1, [sp, #12]
    bff8:	e1a00007 	mov	r0, r7
    bffc:	e58d3028 	str	r3, [sp, #40]	; 0x28
    c000:	ebfffd37 	bl	b4e4 <__sprint_r.part.0>
    c004:	e3500000 	cmp	r0, #0
    c008:	1a000114 	bne	c460 <_vfiprintf_r+0xeb4>
    c00c:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    c010:	e1a0e008 	mov	lr, r8
    c014:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    c018:	e28c1001 	add	r1, ip, #1
    c01c:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    c020:	eafffe89 	b	ba4c <_vfiprintf_r+0x4a0>
    c024:	e28d203c 	add	r2, sp, #60	; 0x3c
    c028:	e59d100c 	ldr	r1, [sp, #12]
    c02c:	e59d0014 	ldr	r0, [sp, #20]
    c030:	ebfffd2b 	bl	b4e4 <__sprint_r.part.0>
    c034:	e3500000 	cmp	r0, #0
    c038:	1a000108 	bne	c460 <_vfiprintf_r+0xeb4>
    c03c:	e1a0b008 	mov	fp, r8
    c040:	e28d1040 	add	r1, sp, #64	; 0x40
    c044:	e8910006 	ldm	r1, {r1, r2}
    c048:	e2810001 	add	r0, r1, #1
    c04c:	e5ddc037 	ldrb	ip, [sp, #55]	; 0x37
    c050:	e35c0000 	cmp	ip, #0
    c054:	0afffea8 	beq	bafc <_vfiprintf_r+0x550>
    c058:	e3a01001 	mov	r1, #1
    c05c:	e28dc037 	add	ip, sp, #55	; 0x37
    c060:	e0822001 	add	r2, r2, r1
    c064:	e3500007 	cmp	r0, #7
    c068:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c06c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c070:	e58b1004 	str	r1, [fp, #4]
    c074:	e58bc000 	str	ip, [fp]
    c078:	dafffe9c 	ble	baf0 <_vfiprintf_r+0x544>
    c07c:	e3520000 	cmp	r2, #0
    c080:	1a000133 	bne	c554 <_vfiprintf_r+0xfa8>
    c084:	e59d3020 	ldr	r3, [sp, #32]
    c088:	e3530000 	cmp	r3, #0
    c08c:	0afffea8 	beq	bb34 <_vfiprintf_r+0x588>
    c090:	e3a02002 	mov	r2, #2
    c094:	e1a00001 	mov	r0, r1
    c098:	e1a0b008 	mov	fp, r8
    c09c:	e28d3038 	add	r3, sp, #56	; 0x38
    c0a0:	e58d2074 	str	r2, [sp, #116]	; 0x74
    c0a4:	e58d3070 	str	r3, [sp, #112]	; 0x70
    c0a8:	e1a01000 	mov	r1, r0
    c0ac:	e28bb008 	add	fp, fp, #8
    c0b0:	e2800001 	add	r0, r0, #1
    c0b4:	e3560080 	cmp	r6, #128	; 0x80
    c0b8:	0afffea2 	beq	bb48 <_vfiprintf_r+0x59c>
    c0bc:	e59d3010 	ldr	r3, [sp, #16]
    c0c0:	e04aa003 	sub	sl, sl, r3
    c0c4:	e35a0000 	cmp	sl, #0
    c0c8:	da000057 	ble	c22c <_vfiprintf_r+0xc80>
    c0cc:	e35a0010 	cmp	sl, #16
    c0d0:	da000019 	ble	c13c <_vfiprintf_r+0xb90>
    c0d4:	e3a04010 	mov	r4, #16
    c0d8:	e59d5014 	ldr	r5, [sp, #20]
    c0dc:	e59d600c 	ldr	r6, [sp, #12]
    c0e0:	ea000005 	b	c0fc <_vfiprintf_r+0xb50>
    c0e4:	e2810002 	add	r0, r1, #2
    c0e8:	e1a01003 	mov	r1, r3
    c0ec:	e28bb008 	add	fp, fp, #8
    c0f0:	e24aa010 	sub	sl, sl, #16
    c0f4:	e35a0010 	cmp	sl, #16
    c0f8:	da00000f 	ble	c13c <_vfiprintf_r+0xb90>
    c0fc:	e2813001 	add	r3, r1, #1
    c100:	e59f0798 	ldr	r0, [pc, #1944]	; c8a0 <_vfiprintf_r+0x12f4>
    c104:	e2822010 	add	r2, r2, #16
    c108:	e3530007 	cmp	r3, #7
    c10c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c110:	e88b0011 	stm	fp, {r0, r4}
    c114:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c118:	dafffff1 	ble	c0e4 <_vfiprintf_r+0xb38>
    c11c:	e3520000 	cmp	r2, #0
    c120:	1a00002c 	bne	c1d8 <_vfiprintf_r+0xc2c>
    c124:	e24aa010 	sub	sl, sl, #16
    c128:	e35a0010 	cmp	sl, #16
    c12c:	e3a00001 	mov	r0, #1
    c130:	e3a01000 	mov	r1, #0
    c134:	e1a0b008 	mov	fp, r8
    c138:	caffffef 	bgt	c0fc <_vfiprintf_r+0xb50>
    c13c:	e59f375c 	ldr	r3, [pc, #1884]	; c8a0 <_vfiprintf_r+0x12f4>
    c140:	e3500007 	cmp	r0, #7
    c144:	e082200a 	add	r2, r2, sl
    c148:	e88b0408 	stm	fp, {r3, sl}
    c14c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c150:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c154:	d28bb008 	addle	fp, fp, #8
    c158:	d2800001 	addle	r0, r0, #1
    c15c:	da000032 	ble	c22c <_vfiprintf_r+0xc80>
    c160:	e3520000 	cmp	r2, #0
    c164:	1a000026 	bne	c204 <_vfiprintf_r+0xc58>
    c168:	e3a03001 	mov	r3, #1
    c16c:	e1a0b008 	mov	fp, r8
    c170:	e59d2010 	ldr	r2, [sp, #16]
    c174:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    c178:	e58d2074 	str	r2, [sp, #116]	; 0x74
    c17c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c180:	e58d1070 	str	r1, [sp, #112]	; 0x70
    c184:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c188:	e28bb008 	add	fp, fp, #8
    c18c:	e59d3004 	ldr	r3, [sp, #4]
    c190:	e3130004 	tst	r3, #4
    c194:	0a000003 	beq	c1a8 <_vfiprintf_r+0xbfc>
    c198:	e59d301c 	ldr	r3, [sp, #28]
    c19c:	e0434007 	sub	r4, r3, r7
    c1a0:	e3540000 	cmp	r4, #0
    c1a4:	ca000033 	bgt	c278 <_vfiprintf_r+0xccc>
    c1a8:	e59d3008 	ldr	r3, [sp, #8]
    c1ac:	e59d101c 	ldr	r1, [sp, #28]
    c1b0:	e1510007 	cmp	r1, r7
    c1b4:	a0833001 	addge	r3, r3, r1
    c1b8:	b0833007 	addlt	r3, r3, r7
    c1bc:	e3520000 	cmp	r2, #0
    c1c0:	e58d3008 	str	r3, [sp, #8]
    c1c4:	1a00009f 	bne	c448 <_vfiprintf_r+0xe9c>
    c1c8:	e3a03000 	mov	r3, #0
    c1cc:	e1a0b008 	mov	fp, r8
    c1d0:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c1d4:	eafffd22 	b	b664 <_vfiprintf_r+0xb8>
    c1d8:	e28d203c 	add	r2, sp, #60	; 0x3c
    c1dc:	e1a01006 	mov	r1, r6
    c1e0:	e1a00005 	mov	r0, r5
    c1e4:	ebfffcbe 	bl	b4e4 <__sprint_r.part.0>
    c1e8:	e3500000 	cmp	r0, #0
    c1ec:	1a0000f4 	bne	c5c4 <_vfiprintf_r+0x1018>
    c1f0:	e28d1040 	add	r1, sp, #64	; 0x40
    c1f4:	e8910006 	ldm	r1, {r1, r2}
    c1f8:	e1a0b008 	mov	fp, r8
    c1fc:	e2810001 	add	r0, r1, #1
    c200:	eaffffba 	b	c0f0 <_vfiprintf_r+0xb44>
    c204:	e28d203c 	add	r2, sp, #60	; 0x3c
    c208:	e59d100c 	ldr	r1, [sp, #12]
    c20c:	e59d0014 	ldr	r0, [sp, #20]
    c210:	ebfffcb3 	bl	b4e4 <__sprint_r.part.0>
    c214:	e3500000 	cmp	r0, #0
    c218:	1a000090 	bne	c460 <_vfiprintf_r+0xeb4>
    c21c:	e1a0b008 	mov	fp, r8
    c220:	e28d0040 	add	r0, sp, #64	; 0x40
    c224:	e8900005 	ldm	r0, {r0, r2}
    c228:	e2800001 	add	r0, r0, #1
    c22c:	e59d3010 	ldr	r3, [sp, #16]
    c230:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    c234:	e0832002 	add	r2, r3, r2
    c238:	e3500007 	cmp	r0, #7
    c23c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c240:	e88b000a 	stm	fp, {r1, r3}
    c244:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c248:	daffffce 	ble	c188 <_vfiprintf_r+0xbdc>
    c24c:	e3520000 	cmp	r2, #0
    c250:	1a00009e 	bne	c4d0 <_vfiprintf_r+0xf24>
    c254:	e59d3004 	ldr	r3, [sp, #4]
    c258:	e3130004 	tst	r3, #4
    c25c:	e58d2040 	str	r2, [sp, #64]	; 0x40
    c260:	0a000031 	beq	c32c <_vfiprintf_r+0xd80>
    c264:	e59d301c 	ldr	r3, [sp, #28]
    c268:	e0434007 	sub	r4, r3, r7
    c26c:	e3540000 	cmp	r4, #0
    c270:	c1a0b008 	movgt	fp, r8
    c274:	da00002c 	ble	c32c <_vfiprintf_r+0xd80>
    c278:	e3540010 	cmp	r4, #16
    c27c:	d59d0040 	ldrle	r0, [sp, #64]	; 0x40
    c280:	d2800001 	addle	r0, r0, #1
    c284:	da00001f 	ble	c308 <_vfiprintf_r+0xd5c>
    c288:	e1a0c00b 	mov	ip, fp
    c28c:	e3a05010 	mov	r5, #16
    c290:	e1a0b004 	mov	fp, r4
    c294:	e3a06001 	mov	r6, #1
    c298:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    c29c:	e59da014 	ldr	sl, [sp, #20]
    c2a0:	e59d400c 	ldr	r4, [sp, #12]
    c2a4:	ea000005 	b	c2c0 <_vfiprintf_r+0xd14>
    c2a8:	e2810002 	add	r0, r1, #2
    c2ac:	e1a01003 	mov	r1, r3
    c2b0:	e28cc008 	add	ip, ip, #8
    c2b4:	e24bb010 	sub	fp, fp, #16
    c2b8:	e35b0010 	cmp	fp, #16
    c2bc:	da00000f 	ble	c300 <_vfiprintf_r+0xd54>
    c2c0:	e2813001 	add	r3, r1, #1
    c2c4:	e59f05d0 	ldr	r0, [pc, #1488]	; c89c <_vfiprintf_r+0x12f0>
    c2c8:	e2822010 	add	r2, r2, #16
    c2cc:	e3530007 	cmp	r3, #7
    c2d0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c2d4:	e88c0021 	stm	ip, {r0, r5}
    c2d8:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c2dc:	dafffff1 	ble	c2a8 <_vfiprintf_r+0xcfc>
    c2e0:	e3520000 	cmp	r2, #0
    c2e4:	1a000017 	bne	c348 <_vfiprintf_r+0xd9c>
    c2e8:	e24bb010 	sub	fp, fp, #16
    c2ec:	e35b0010 	cmp	fp, #16
    c2f0:	e1a00006 	mov	r0, r6
    c2f4:	e3a01000 	mov	r1, #0
    c2f8:	e1a0c008 	mov	ip, r8
    c2fc:	caffffef 	bgt	c2c0 <_vfiprintf_r+0xd14>
    c300:	e1a0400b 	mov	r4, fp
    c304:	e1a0b00c 	mov	fp, ip
    c308:	e59f358c 	ldr	r3, [pc, #1420]	; c89c <_vfiprintf_r+0x12f0>
    c30c:	e0822004 	add	r2, r2, r4
    c310:	e3500007 	cmp	r0, #7
    c314:	e58d2044 	str	r2, [sp, #68]	; 0x44
    c318:	e88b0018 	stm	fp, {r3, r4}
    c31c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    c320:	daffffa0 	ble	c1a8 <_vfiprintf_r+0xbfc>
    c324:	e3520000 	cmp	r2, #0
    c328:	1a0000f5 	bne	c704 <_vfiprintf_r+0x1158>
    c32c:	e59d3008 	ldr	r3, [sp, #8]
    c330:	e59d201c 	ldr	r2, [sp, #28]
    c334:	e1520007 	cmp	r2, r7
    c338:	a0833002 	addge	r3, r3, r2
    c33c:	b0833007 	addlt	r3, r3, r7
    c340:	e58d3008 	str	r3, [sp, #8]
    c344:	eaffff9f 	b	c1c8 <_vfiprintf_r+0xc1c>
    c348:	e28d203c 	add	r2, sp, #60	; 0x3c
    c34c:	e1a01004 	mov	r1, r4
    c350:	e1a0000a 	mov	r0, sl
    c354:	ebfffc62 	bl	b4e4 <__sprint_r.part.0>
    c358:	e3500000 	cmp	r0, #0
    c35c:	1a000113 	bne	c7b0 <_vfiprintf_r+0x1204>
    c360:	e28d1040 	add	r1, sp, #64	; 0x40
    c364:	e8910006 	ldm	r1, {r1, r2}
    c368:	e1a0c008 	mov	ip, r8
    c36c:	e2810001 	add	r0, r1, #1
    c370:	eaffffcf 	b	c2b4 <_vfiprintf_r+0xd08>
    c374:	e1a01002 	mov	r1, r2
    c378:	e1a021a6 	lsr	r2, r6, #3
    c37c:	e1822e87 	orr	r2, r2, r7, lsl #29
    c380:	e1a001a7 	lsr	r0, r7, #3
    c384:	e2063007 	and	r3, r6, #7
    c388:	e1a07000 	mov	r7, r0
    c38c:	e1a06002 	mov	r6, r2
    c390:	e2833030 	add	r3, r3, #48	; 0x30
    c394:	e1962007 	orrs	r2, r6, r7
    c398:	e5413001 	strb	r3, [r1, #-1]
    c39c:	e2412001 	sub	r2, r1, #1
    c3a0:	1afffff3 	bne	c374 <_vfiprintf_r+0xdc8>
    c3a4:	e3530030 	cmp	r3, #48	; 0x30
    c3a8:	03a03000 	moveq	r3, #0
    c3ac:	12053001 	andne	r3, r5, #1
    c3b0:	e3530000 	cmp	r3, #0
    c3b4:	0a0000e9 	beq	c760 <_vfiprintf_r+0x11b4>
    c3b8:	e3a03030 	mov	r3, #48	; 0x30
    c3bc:	e2411002 	sub	r1, r1, #2
    c3c0:	e58d1024 	str	r1, [sp, #36]	; 0x24
    c3c4:	e0481001 	sub	r1, r8, r1
    c3c8:	e58d5004 	str	r5, [sp, #4]
    c3cc:	e58d1010 	str	r1, [sp, #16]
    c3d0:	e5423001 	strb	r3, [r2, #-1]
    c3d4:	eafffd7e 	b	b9d4 <_vfiprintf_r+0x428>
    c3d8:	e28d203c 	add	r2, sp, #60	; 0x3c
    c3dc:	e59d100c 	ldr	r1, [sp, #12]
    c3e0:	e1a00004 	mov	r0, r4
    c3e4:	ebfffc3e 	bl	b4e4 <__sprint_r.part.0>
    c3e8:	e3500000 	cmp	r0, #0
    c3ec:	1a00001b 	bne	c460 <_vfiprintf_r+0xeb4>
    c3f0:	e28d1040 	add	r1, sp, #64	; 0x40
    c3f4:	e8910006 	ldm	r1, {r1, r2}
    c3f8:	e1a0e008 	mov	lr, r8
    c3fc:	e281c001 	add	ip, r1, #1
    c400:	eafffde0 	b	bb88 <_vfiprintf_r+0x5dc>
    c404:	e3a03000 	mov	r3, #0
    c408:	e58d8024 	str	r8, [sp, #36]	; 0x24
    c40c:	e58d3010 	str	r3, [sp, #16]
    c410:	eafffd6f 	b	b9d4 <_vfiprintf_r+0x428>
    c414:	e3530001 	cmp	r3, #1
    c418:	e1a05002 	mov	r5, r2
    c41c:	1afffe7e 	bne	be1c <_vfiprintf_r+0x870>
    c420:	e3570000 	cmp	r7, #0
    c424:	03560009 	cmpeq	r6, #9
    c428:	8a000086 	bhi	c648 <_vfiprintf_r+0x109c>
    c42c:	e28d20b0 	add	r2, sp, #176	; 0xb0
    c430:	e2866030 	add	r6, r6, #48	; 0x30
    c434:	e5626041 	strb	r6, [r2, #-65]!	; 0xffffffbf
    c438:	e58d5004 	str	r5, [sp, #4]
    c43c:	e58d3010 	str	r3, [sp, #16]
    c440:	e58d2024 	str	r2, [sp, #36]	; 0x24
    c444:	eafffd62 	b	b9d4 <_vfiprintf_r+0x428>
    c448:	e28d203c 	add	r2, sp, #60	; 0x3c
    c44c:	e59d100c 	ldr	r1, [sp, #12]
    c450:	e59d0014 	ldr	r0, [sp, #20]
    c454:	ebfffc22 	bl	b4e4 <__sprint_r.part.0>
    c458:	e3500000 	cmp	r0, #0
    c45c:	0affff59 	beq	c1c8 <_vfiprintf_r+0xc1c>
    c460:	e59da00c 	ldr	sl, [sp, #12]
    c464:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    c468:	e3130001 	tst	r3, #1
    c46c:	e1da30bc 	ldrh	r3, [sl, #12]
    c470:	1a000001 	bne	c47c <_vfiprintf_r+0xed0>
    c474:	e3130c02 	tst	r3, #512	; 0x200
    c478:	0a000031 	beq	c544 <_vfiprintf_r+0xf98>
    c47c:	e3130040 	tst	r3, #64	; 0x40
    c480:	0afffd21 	beq	b90c <_vfiprintf_r+0x360>
    c484:	e3e03000 	mvn	r3, #0
    c488:	e58d3008 	str	r3, [sp, #8]
    c48c:	e59d0008 	ldr	r0, [sp, #8]
    c490:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    c494:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    c498:	e12fff1e 	bx	lr
    c49c:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    c4a0:	e3130001 	tst	r3, #1
    c4a4:	1afffff6 	bne	c484 <_vfiprintf_r+0xed8>
    c4a8:	e1da30bc 	ldrh	r3, [sl, #12]
    c4ac:	e3130c02 	tst	r3, #512	; 0x200
    c4b0:	1afffff3 	bne	c484 <_vfiprintf_r+0xed8>
    c4b4:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    c4b8:	eb00068e 	bl	def8 <__retarget_lock_release_recursive>
    c4bc:	e3e03000 	mvn	r3, #0
    c4c0:	e58d3008 	str	r3, [sp, #8]
    c4c4:	eafffd10 	b	b90c <_vfiprintf_r+0x360>
    c4c8:	e3a03002 	mov	r3, #2
    c4cc:	eafffd2c 	b	b984 <_vfiprintf_r+0x3d8>
    c4d0:	e28d203c 	add	r2, sp, #60	; 0x3c
    c4d4:	e59d100c 	ldr	r1, [sp, #12]
    c4d8:	e59d0014 	ldr	r0, [sp, #20]
    c4dc:	ebfffc00 	bl	b4e4 <__sprint_r.part.0>
    c4e0:	e3500000 	cmp	r0, #0
    c4e4:	1affffdd 	bne	c460 <_vfiprintf_r+0xeb4>
    c4e8:	e1a0b008 	mov	fp, r8
    c4ec:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    c4f0:	eaffff25 	b	c18c <_vfiprintf_r+0xbe0>
    c4f4:	e28d203c 	add	r2, sp, #60	; 0x3c
    c4f8:	e59d100c 	ldr	r1, [sp, #12]
    c4fc:	e59d0014 	ldr	r0, [sp, #20]
    c500:	ebfffbf7 	bl	b4e4 <__sprint_r.part.0>
    c504:	e3500000 	cmp	r0, #0
    c508:	1affffd4 	bne	c460 <_vfiprintf_r+0xeb4>
    c50c:	e1a0b008 	mov	fp, r8
    c510:	eafffc69 	b	b6bc <_vfiprintf_r+0x110>
    c514:	e2822004 	add	r2, r2, #4
    c518:	e5936000 	ldr	r6, [r3]
    c51c:	e3a07000 	mov	r7, #0
    c520:	e3a03000 	mov	r3, #0
    c524:	e58d2018 	str	r2, [sp, #24]
    c528:	eafffd15 	b	b984 <_vfiprintf_r+0x3d8>
    c52c:	e2822004 	add	r2, r2, #4
    c530:	e5936000 	ldr	r6, [r3]
    c534:	e3a07000 	mov	r7, #0
    c538:	e3a03001 	mov	r3, #1
    c53c:	e58d2018 	str	r2, [sp, #24]
    c540:	eafffd0f 	b	b984 <_vfiprintf_r+0x3d8>
    c544:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    c548:	eb00066a 	bl	def8 <__retarget_lock_release_recursive>
    c54c:	e1da30bc 	ldrh	r3, [sl, #12]
    c550:	eaffffc9 	b	c47c <_vfiprintf_r+0xed0>
    c554:	e28d203c 	add	r2, sp, #60	; 0x3c
    c558:	e59d100c 	ldr	r1, [sp, #12]
    c55c:	e59d0014 	ldr	r0, [sp, #20]
    c560:	ebfffbdf 	bl	b4e4 <__sprint_r.part.0>
    c564:	e3500000 	cmp	r0, #0
    c568:	1affffbc 	bne	c460 <_vfiprintf_r+0xeb4>
    c56c:	e28d1040 	add	r1, sp, #64	; 0x40
    c570:	e8910006 	ldm	r1, {r1, r2}
    c574:	e1a0b008 	mov	fp, r8
    c578:	e2810001 	add	r0, r1, #1
    c57c:	eafffd5e 	b	bafc <_vfiprintf_r+0x550>
    c580:	e28d203c 	add	r2, sp, #60	; 0x3c
    c584:	e59d100c 	ldr	r1, [sp, #12]
    c588:	e59d0014 	ldr	r0, [sp, #20]
    c58c:	ebfffbd4 	bl	b4e4 <__sprint_r.part.0>
    c590:	e3500000 	cmp	r0, #0
    c594:	1affffb1 	bne	c460 <_vfiprintf_r+0xeb4>
    c598:	e28d1040 	add	r1, sp, #64	; 0x40
    c59c:	e8910006 	ldm	r1, {r1, r2}
    c5a0:	e1a0b008 	mov	fp, r8
    c5a4:	e2810001 	add	r0, r1, #1
    c5a8:	eafffec1 	b	c0b4 <_vfiprintf_r+0xb08>
    c5ac:	e3520000 	cmp	r2, #0
    c5b0:	1a000088 	bne	c7d8 <_vfiprintf_r+0x122c>
    c5b4:	e3a00001 	mov	r0, #1
    c5b8:	e3a01000 	mov	r1, #0
    c5bc:	e1a0b008 	mov	fp, r8
    c5c0:	eafffebd 	b	c0bc <_vfiprintf_r+0xb10>
    c5c4:	e1a0a006 	mov	sl, r6
    c5c8:	eaffffa5 	b	c464 <_vfiprintf_r+0xeb8>
    c5cc:	e59d3018 	ldr	r3, [sp, #24]
    c5d0:	e2833007 	add	r3, r3, #7
    c5d4:	e3c31007 	bic	r1, r3, #7
    c5d8:	e891000c 	ldm	r1, {r2, r3}
    c5dc:	e2811008 	add	r1, r1, #8
    c5e0:	e58d1018 	str	r1, [sp, #24]
    c5e4:	e1a06002 	mov	r6, r2
    c5e8:	e1a07003 	mov	r7, r3
    c5ec:	eafffe01 	b	bdf8 <_vfiprintf_r+0x84c>
    c5f0:	e2822007 	add	r2, r2, #7
    c5f4:	e3c22007 	bic	r2, r2, #7
    c5f8:	e2821008 	add	r1, r2, #8
    c5fc:	e58d1018 	str	r1, [sp, #24]
    c600:	e89200c0 	ldm	r2, {r6, r7}
    c604:	eafffe3e 	b	bf04 <_vfiprintf_r+0x958>
    c608:	e59d3018 	ldr	r3, [sp, #24]
    c60c:	e2833007 	add	r3, r3, #7
    c610:	e3c33007 	bic	r3, r3, #7
    c614:	e2832008 	add	r2, r3, #8
    c618:	e89300c0 	ldm	r3, {r6, r7}
    c61c:	e58d2018 	str	r2, [sp, #24]
    c620:	e3a03001 	mov	r3, #1
    c624:	eafffcd6 	b	b984 <_vfiprintf_r+0x3d8>
    c628:	e59d3018 	ldr	r3, [sp, #24]
    c62c:	e2833007 	add	r3, r3, #7
    c630:	e3c33007 	bic	r3, r3, #7
    c634:	e2832008 	add	r2, r3, #8
    c638:	e89300c0 	ldm	r3, {r6, r7}
    c63c:	e58d2018 	str	r2, [sp, #24]
    c640:	e3a03000 	mov	r3, #0
    c644:	eafffcce 	b	b984 <_vfiprintf_r+0x3d8>
    c648:	e58d4004 	str	r4, [sp, #4]
    c64c:	e1a04008 	mov	r4, r8
    c650:	e1a00006 	mov	r0, r6
    c654:	e1a01007 	mov	r1, r7
    c658:	e3a0200a 	mov	r2, #10
    c65c:	e3a03000 	mov	r3, #0
    c660:	eb000d55 	bl	fbbc <__aeabi_uldivmod>
    c664:	e2822030 	add	r2, r2, #48	; 0x30
    c668:	e5642001 	strb	r2, [r4, #-1]!
    c66c:	e1a00006 	mov	r0, r6
    c670:	e1a01007 	mov	r1, r7
    c674:	e3a03000 	mov	r3, #0
    c678:	e3a0200a 	mov	r2, #10
    c67c:	eb000d4e 	bl	fbbc <__aeabi_uldivmod>
    c680:	e1a06000 	mov	r6, r0
    c684:	e1a07001 	mov	r7, r1
    c688:	e1963007 	orrs	r3, r6, r7
    c68c:	1affffef 	bne	c650 <_vfiprintf_r+0x10a4>
    c690:	e1a03004 	mov	r3, r4
    c694:	e0483003 	sub	r3, r8, r3
    c698:	e58d4024 	str	r4, [sp, #36]	; 0x24
    c69c:	e58d3010 	str	r3, [sp, #16]
    c6a0:	e59d4004 	ldr	r4, [sp, #4]
    c6a4:	e58d5004 	str	r5, [sp, #4]
    c6a8:	eafffcc9 	b	b9d4 <_vfiprintf_r+0x428>
    c6ac:	e3a0302d 	mov	r3, #45	; 0x2d
    c6b0:	e2766000 	rsbs	r6, r6, #0
    c6b4:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    c6b8:	e1a04003 	mov	r4, r3
    c6bc:	e2e77000 	rsc	r7, r7, #0
    c6c0:	e3a03001 	mov	r3, #1
    c6c4:	eafffcb1 	b	b990 <_vfiprintf_r+0x3e4>
    c6c8:	e59d3020 	ldr	r3, [sp, #32]
    c6cc:	e3530000 	cmp	r3, #0
    c6d0:	1a000013 	bne	c724 <_vfiprintf_r+0x1178>
    c6d4:	e3a01000 	mov	r1, #0
    c6d8:	e3a00001 	mov	r0, #1
    c6dc:	e1a0b008 	mov	fp, r8
    c6e0:	eafffe75 	b	c0bc <_vfiprintf_r+0xb10>
    c6e4:	e59d1018 	ldr	r1, [sp, #24]
    c6e8:	e5916000 	ldr	r6, [r1]
    c6ec:	e2811004 	add	r1, r1, #4
    c6f0:	e1a07fc6 	asr	r7, r6, #31
    c6f4:	e1a02006 	mov	r2, r6
    c6f8:	e1a03007 	mov	r3, r7
    c6fc:	e58d1018 	str	r1, [sp, #24]
    c700:	eafffdbc 	b	bdf8 <_vfiprintf_r+0x84c>
    c704:	e28d203c 	add	r2, sp, #60	; 0x3c
    c708:	e59d100c 	ldr	r1, [sp, #12]
    c70c:	e59d0014 	ldr	r0, [sp, #20]
    c710:	ebfffb73 	bl	b4e4 <__sprint_r.part.0>
    c714:	e3500000 	cmp	r0, #0
    c718:	1affff50 	bne	c460 <_vfiprintf_r+0xeb4>
    c71c:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    c720:	eafffea0 	b	c1a8 <_vfiprintf_r+0xbfc>
    c724:	e3a02002 	mov	r2, #2
    c728:	e28d3038 	add	r3, sp, #56	; 0x38
    c72c:	e58d2074 	str	r2, [sp, #116]	; 0x74
    c730:	e58d3070 	str	r3, [sp, #112]	; 0x70
    c734:	e3a00001 	mov	r0, #1
    c738:	e1a0b008 	mov	fp, r8
    c73c:	eafffe59 	b	c0a8 <_vfiprintf_r+0xafc>
    c740:	e59d3018 	ldr	r3, [sp, #24]
    c744:	e5936000 	ldr	r6, [r3]
    c748:	eafffda5 	b	bde4 <_vfiprintf_r+0x838>
    c74c:	e5926000 	ldr	r6, [r2]
    c750:	e2822004 	add	r2, r2, #4
    c754:	e58d2018 	str	r2, [sp, #24]
    c758:	e3a07000 	mov	r7, #0
    c75c:	eafffde8 	b	bf04 <_vfiprintf_r+0x958>
    c760:	e0483002 	sub	r3, r8, r2
    c764:	e58d5004 	str	r5, [sp, #4]
    c768:	e58d3010 	str	r3, [sp, #16]
    c76c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    c770:	eafffc97 	b	b9d4 <_vfiprintf_r+0x428>
    c774:	e59d3018 	ldr	r3, [sp, #24]
    c778:	e59d2008 	ldr	r2, [sp, #8]
    c77c:	e5931000 	ldr	r1, [r3]
    c780:	e2833004 	add	r3, r3, #4
    c784:	e58d3018 	str	r3, [sp, #24]
    c788:	e1a03fc2 	asr	r3, r2, #31
    c78c:	e881000c 	stm	r1, {r2, r3}
    c790:	eafffbb3 	b	b664 <_vfiprintf_r+0xb8>
    c794:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    c798:	e3530000 	cmp	r3, #0
    c79c:	e59da00c 	ldr	sl, [sp, #12]
    c7a0:	1a00002c 	bne	c858 <_vfiprintf_r+0x12ac>
    c7a4:	e3a03000 	mov	r3, #0
    c7a8:	e58d3040 	str	r3, [sp, #64]	; 0x40
    c7ac:	eaffff2c 	b	c464 <_vfiprintf_r+0xeb8>
    c7b0:	e1a0a004 	mov	sl, r4
    c7b4:	eaffff2a 	b	c464 <_vfiprintf_r+0xeb8>
    c7b8:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    c7bc:	e58d4018 	str	r4, [sp, #24]
    c7c0:	e58d5004 	str	r5, [sp, #4]
    c7c4:	ebfffb2e 	bl	b484 <strlen>
    c7c8:	e3a0a000 	mov	sl, #0
    c7cc:	e58d0010 	str	r0, [sp, #16]
    c7d0:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    c7d4:	eafffc7e 	b	b9d4 <_vfiprintf_r+0x428>
    c7d8:	e28d203c 	add	r2, sp, #60	; 0x3c
    c7dc:	e59d100c 	ldr	r1, [sp, #12]
    c7e0:	e59d0014 	ldr	r0, [sp, #20]
    c7e4:	ebfffb3e 	bl	b4e4 <__sprint_r.part.0>
    c7e8:	e3500000 	cmp	r0, #0
    c7ec:	1affff1b 	bne	c460 <_vfiprintf_r+0xeb4>
    c7f0:	e28d1040 	add	r1, sp, #64	; 0x40
    c7f4:	e8910006 	ldm	r1, {r1, r2}
    c7f8:	e1a0b008 	mov	fp, r8
    c7fc:	e2810001 	add	r0, r1, #1
    c800:	eafffe2d 	b	c0bc <_vfiprintf_r+0xb10>
    c804:	e28d1040 	add	r1, sp, #64	; 0x40
    c808:	e8910006 	ldm	r1, {r1, r2}
    c80c:	e2811001 	add	r1, r1, #1
    c810:	eafffca2 	b	baa0 <_vfiprintf_r+0x4f4>
    c814:	e35a0006 	cmp	sl, #6
    c818:	31a0300a 	movcc	r3, sl
    c81c:	23a03006 	movcs	r3, #6
    c820:	e58d3010 	str	r3, [sp, #16]
    c824:	e1a07003 	mov	r7, r3
    c828:	e59f307c 	ldr	r3, [pc, #124]	; c8ac <_vfiprintf_r+0x1300>
    c82c:	e58d4018 	str	r4, [sp, #24]
    c830:	e58d3024 	str	r3, [sp, #36]	; 0x24
    c834:	eafffdc8 	b	bf5c <_vfiprintf_r+0x9b0>
    c838:	e58da010 	str	sl, [sp, #16]
    c83c:	e58d4018 	str	r4, [sp, #24]
    c840:	e58d5004 	str	r5, [sp, #4]
    c844:	e3a0a000 	mov	sl, #0
    c848:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    c84c:	eafffc60 	b	b9d4 <_vfiprintf_r+0x428>
    c850:	e1a0c000 	mov	ip, r0
    c854:	eafffce1 	b	bbe0 <_vfiprintf_r+0x634>
    c858:	e59d0014 	ldr	r0, [sp, #20]
    c85c:	e28d203c 	add	r2, sp, #60	; 0x3c
    c860:	e1a0100a 	mov	r1, sl
    c864:	ebfffb1e 	bl	b4e4 <__sprint_r.part.0>
    c868:	e3500000 	cmp	r0, #0
    c86c:	0affffcc 	beq	c7a4 <_vfiprintf_r+0x11f8>
    c870:	eafffefb 	b	c464 <_vfiprintf_r+0xeb8>
    c874:	e59d2018 	ldr	r2, [sp, #24]
    c878:	e58da004 	str	sl, [sp, #4]
    c87c:	e592a000 	ldr	sl, [r2]
    c880:	e2822004 	add	r2, r2, #4
    c884:	e15a0007 	cmp	sl, r7
    c888:	e5d93001 	ldrb	r3, [r9, #1]
    c88c:	b1a0a007 	movlt	sl, r7
    c890:	e59d9004 	ldr	r9, [sp, #4]
    c894:	e58d2018 	str	r2, [sp, #24]
    c898:	eafffb9a 	b	b708 <_vfiprintf_r+0x15c>
    c89c:	00010218 	.word	0x00010218
    c8a0:	00010228 	.word	0x00010228
    c8a4:	000101fc 	.word	0x000101fc
    c8a8:	000101e8 	.word	0x000101e8
    c8ac:	00010210 	.word	0x00010210

0000c8b0 <vfiprintf>:
    c8b0:	e59fc010 	ldr	ip, [pc, #16]	; c8c8 <vfiprintf+0x18>
    c8b4:	e1a03002 	mov	r3, r2
    c8b8:	e1a02001 	mov	r2, r1
    c8bc:	e1a01000 	mov	r1, r0
    c8c0:	e59c0000 	ldr	r0, [ip]
    c8c4:	eafffb38 	b	b5ac <_vfiprintf_r>
    c8c8:	00010384 	.word	0x00010384

0000c8cc <__sbprintf>:
    c8cc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c8d0:	e1a04001 	mov	r4, r1
    c8d4:	e3a0cb01 	mov	ip, #1024	; 0x400
    c8d8:	e3a0e000 	mov	lr, #0
    c8dc:	e1a06002 	mov	r6, r2
    c8e0:	e1a07000 	mov	r7, r0
    c8e4:	e1a08003 	mov	r8, r3
    c8e8:	e24dde46 	sub	sp, sp, #1120	; 0x460
    c8ec:	e1d430be 	ldrh	r3, [r4, #14]
    c8f0:	e24dd008 	sub	sp, sp, #8
    c8f4:	e1d110bc 	ldrh	r1, [r1, #12]
    c8f8:	e1cd30be 	strh	r3, [sp, #14]
    c8fc:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    c900:	e594201c 	ldr	r2, [r4, #28]
    c904:	e3c11002 	bic	r1, r1, #2
    c908:	e58d3064 	str	r3, [sp, #100]	; 0x64
    c90c:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    c910:	e1cd10bc 	strh	r1, [sp, #12]
    c914:	e28d0058 	add	r0, sp, #88	; 0x58
    c918:	e28d1068 	add	r1, sp, #104	; 0x68
    c91c:	e58dc008 	str	ip, [sp, #8]
    c920:	e58dc014 	str	ip, [sp, #20]
    c924:	e58d201c 	str	r2, [sp, #28]
    c928:	e58d3024 	str	r3, [sp, #36]	; 0x24
    c92c:	e58de018 	str	lr, [sp, #24]
    c930:	e58d1000 	str	r1, [sp]
    c934:	e58d1010 	str	r1, [sp, #16]
    c938:	eb000564 	bl	ded0 <__retarget_lock_init_recursive>
    c93c:	e1a02006 	mov	r2, r6
    c940:	e1a03008 	mov	r3, r8
    c944:	e1a0100d 	mov	r1, sp
    c948:	e1a00007 	mov	r0, r7
    c94c:	ebfffb16 	bl	b5ac <_vfiprintf_r>
    c950:	e2506000 	subs	r6, r0, #0
    c954:	ba000004 	blt	c96c <__sbprintf+0xa0>
    c958:	e1a0100d 	mov	r1, sp
    c95c:	e1a00007 	mov	r0, r7
    c960:	eb0000fa 	bl	cd50 <_fflush_r>
    c964:	e3500000 	cmp	r0, #0
    c968:	13e06000 	mvnne	r6, #0
    c96c:	e1dd30bc 	ldrh	r3, [sp, #12]
    c970:	e3130040 	tst	r3, #64	; 0x40
    c974:	11d430bc 	ldrhne	r3, [r4, #12]
    c978:	13833040 	orrne	r3, r3, #64	; 0x40
    c97c:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    c980:	11c430bc 	strhne	r3, [r4, #12]
    c984:	eb000553 	bl	ded8 <__retarget_lock_close_recursive>
    c988:	e1a00006 	mov	r0, r6
    c98c:	e28dde46 	add	sp, sp, #1120	; 0x460
    c990:	e28dd008 	add	sp, sp, #8
    c994:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c998:	e12fff1e 	bx	lr

0000c99c <__swsetup_r>:
    c99c:	e59f3158 	ldr	r3, [pc, #344]	; cafc <__swsetup_r+0x160>
    c9a0:	e5933000 	ldr	r3, [r3]
    c9a4:	e3530000 	cmp	r3, #0
    c9a8:	e92d4070 	push	{r4, r5, r6, lr}
    c9ac:	e1a05000 	mov	r5, r0
    c9b0:	e1a04001 	mov	r4, r1
    c9b4:	0a000002 	beq	c9c4 <__swsetup_r+0x28>
    c9b8:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    c9bc:	e3520000 	cmp	r2, #0
    c9c0:	0a000034 	beq	ca98 <__swsetup_r+0xfc>
    c9c4:	e1d420fc 	ldrsh	r2, [r4, #12]
    c9c8:	e1a03802 	lsl	r3, r2, #16
    c9cc:	e3130702 	tst	r3, #524288	; 0x80000
    c9d0:	e1a03823 	lsr	r3, r3, #16
    c9d4:	0a00000c 	beq	ca0c <__swsetup_r+0x70>
    c9d8:	e5940010 	ldr	r0, [r4, #16]
    c9dc:	e3500000 	cmp	r0, #0
    c9e0:	0a000014 	beq	ca38 <__swsetup_r+0x9c>
    c9e4:	e2132001 	ands	r2, r3, #1
    c9e8:	1a00001b 	bne	ca5c <__swsetup_r+0xc0>
    c9ec:	e3130002 	tst	r3, #2
    c9f0:	05942014 	ldreq	r2, [r4, #20]
    c9f4:	e3500000 	cmp	r0, #0
    c9f8:	e5842008 	str	r2, [r4, #8]
    c9fc:	13a00000 	movne	r0, #0
    ca00:	0a00001d 	beq	ca7c <__swsetup_r+0xe0>
    ca04:	e8bd4070 	pop	{r4, r5, r6, lr}
    ca08:	e12fff1e 	bx	lr
    ca0c:	e3130010 	tst	r3, #16
    ca10:	0a000033 	beq	cae4 <__swsetup_r+0x148>
    ca14:	e3130004 	tst	r3, #4
    ca18:	1a000021 	bne	caa4 <__swsetup_r+0x108>
    ca1c:	e5940010 	ldr	r0, [r4, #16]
    ca20:	e3822008 	orr	r2, r2, #8
    ca24:	e1c420bc 	strh	r2, [r4, #12]
    ca28:	e3500000 	cmp	r0, #0
    ca2c:	e1a02802 	lsl	r2, r2, #16
    ca30:	e1a03822 	lsr	r3, r2, #16
    ca34:	1affffea 	bne	c9e4 <__swsetup_r+0x48>
    ca38:	e2032d0a 	and	r2, r3, #640	; 0x280
    ca3c:	e3520c02 	cmp	r2, #512	; 0x200
    ca40:	0affffe7 	beq	c9e4 <__swsetup_r+0x48>
    ca44:	e1a00005 	mov	r0, r5
    ca48:	e1a01004 	mov	r1, r4
    ca4c:	eb000552 	bl	df9c <__smakebuf_r>
    ca50:	e1d430bc 	ldrh	r3, [r4, #12]
    ca54:	e5940010 	ldr	r0, [r4, #16]
    ca58:	eaffffe1 	b	c9e4 <__swsetup_r+0x48>
    ca5c:	e3a02000 	mov	r2, #0
    ca60:	e5943014 	ldr	r3, [r4, #20]
    ca64:	e3500000 	cmp	r0, #0
    ca68:	e2633000 	rsb	r3, r3, #0
    ca6c:	e5843018 	str	r3, [r4, #24]
    ca70:	e5842008 	str	r2, [r4, #8]
    ca74:	13a00000 	movne	r0, #0
    ca78:	1affffe1 	bne	ca04 <__swsetup_r+0x68>
    ca7c:	e1d430fc 	ldrsh	r3, [r4, #12]
    ca80:	e3130080 	tst	r3, #128	; 0x80
    ca84:	13833040 	orrne	r3, r3, #64	; 0x40
    ca88:	11c430bc 	strhne	r3, [r4, #12]
    ca8c:	13e00000 	mvnne	r0, #0
    ca90:	e8bd4070 	pop	{r4, r5, r6, lr}
    ca94:	e12fff1e 	bx	lr
    ca98:	e1a00003 	mov	r0, r3
    ca9c:	eb000140 	bl	cfa4 <__sinit>
    caa0:	eaffffc7 	b	c9c4 <__swsetup_r+0x28>
    caa4:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    caa8:	e3510000 	cmp	r1, #0
    caac:	0a000007 	beq	cad0 <__swsetup_r+0x134>
    cab0:	e2843040 	add	r3, r4, #64	; 0x40
    cab4:	e1510003 	cmp	r1, r3
    cab8:	0a000002 	beq	cac8 <__swsetup_r+0x12c>
    cabc:	e1a00005 	mov	r0, r5
    cac0:	eb000298 	bl	d528 <_free_r>
    cac4:	e1d420fc 	ldrsh	r2, [r4, #12]
    cac8:	e3a03000 	mov	r3, #0
    cacc:	e5843030 	str	r3, [r4, #48]	; 0x30
    cad0:	e3a03000 	mov	r3, #0
    cad4:	e5940010 	ldr	r0, [r4, #16]
    cad8:	e3c22024 	bic	r2, r2, #36	; 0x24
    cadc:	e8840009 	stm	r4, {r0, r3}
    cae0:	eaffffce 	b	ca20 <__swsetup_r+0x84>
    cae4:	e3a03009 	mov	r3, #9
    cae8:	e3822040 	orr	r2, r2, #64	; 0x40
    caec:	e5853000 	str	r3, [r5]
    caf0:	e3e00000 	mvn	r0, #0
    caf4:	e1c420bc 	strh	r2, [r4, #12]
    caf8:	eaffffc1 	b	ca04 <__swsetup_r+0x68>
    cafc:	00010384 	.word	0x00010384

0000cb00 <abort>:
    cb00:	e92d4010 	push	{r4, lr}
    cb04:	e3a00006 	mov	r0, #6
    cb08:	eb00097f 	bl	f10c <raise>
    cb0c:	e3a00001 	mov	r0, #1
    cb10:	eb000cda 	bl	fe80 <_exit>

0000cb14 <__sflush_r>:
    cb14:	e1d130fc 	ldrsh	r3, [r1, #12]
    cb18:	e1a02803 	lsl	r2, r3, #16
    cb1c:	e3120702 	tst	r2, #524288	; 0x80000
    cb20:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    cb24:	e1a05001 	mov	r5, r1
    cb28:	e1a08000 	mov	r8, r0
    cb2c:	1a000034 	bne	cc04 <__sflush_r+0xf0>
    cb30:	e5912004 	ldr	r2, [r1, #4]
    cb34:	e3833b02 	orr	r3, r3, #2048	; 0x800
    cb38:	e3520000 	cmp	r2, #0
    cb3c:	e1c130bc 	strh	r3, [r1, #12]
    cb40:	da000050 	ble	cc88 <__sflush_r+0x174>
    cb44:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    cb48:	e3540000 	cmp	r4, #0
    cb4c:	0a000050 	beq	cc94 <__sflush_r+0x180>
    cb50:	e3a02000 	mov	r2, #0
    cb54:	e1a03803 	lsl	r3, r3, #16
    cb58:	e2030201 	and	r0, r3, #268435456	; 0x10000000
    cb5c:	e1b07820 	lsrs	r7, r0, #16
    cb60:	e5986000 	ldr	r6, [r8]
    cb64:	e1a03823 	lsr	r3, r3, #16
    cb68:	e5882000 	str	r2, [r8]
    cb6c:	0a00005e 	beq	ccec <__sflush_r+0x1d8>
    cb70:	e5952050 	ldr	r2, [r5, #80]	; 0x50
    cb74:	e3130004 	tst	r3, #4
    cb78:	0a000005 	beq	cb94 <__sflush_r+0x80>
    cb7c:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    cb80:	e5953004 	ldr	r3, [r5, #4]
    cb84:	e3510000 	cmp	r1, #0
    cb88:	e0422003 	sub	r2, r2, r3
    cb8c:	1595303c 	ldrne	r3, [r5, #60]	; 0x3c
    cb90:	10422003 	subne	r2, r2, r3
    cb94:	e3a03000 	mov	r3, #0
    cb98:	e595101c 	ldr	r1, [r5, #28]
    cb9c:	e1a00008 	mov	r0, r8
    cba0:	e1a0e00f 	mov	lr, pc
    cba4:	e12fff14 	bx	r4
    cba8:	e3700001 	cmn	r0, #1
    cbac:	0a00003b 	beq	cca0 <__sflush_r+0x18c>
    cbb0:	e3a01000 	mov	r1, #0
    cbb4:	e1d530fc 	ldrsh	r3, [r5, #12]
    cbb8:	e5952010 	ldr	r2, [r5, #16]
    cbbc:	e3c33b02 	bic	r3, r3, #2048	; 0x800
    cbc0:	e3130a01 	tst	r3, #4096	; 0x1000
    cbc4:	e1c530bc 	strh	r3, [r5, #12]
    cbc8:	e5851004 	str	r1, [r5, #4]
    cbcc:	e5852000 	str	r2, [r5]
    cbd0:	1a000043 	bne	cce4 <__sflush_r+0x1d0>
    cbd4:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    cbd8:	e3510000 	cmp	r1, #0
    cbdc:	e5886000 	str	r6, [r8]
    cbe0:	0a00002b 	beq	cc94 <__sflush_r+0x180>
    cbe4:	e2853040 	add	r3, r5, #64	; 0x40
    cbe8:	e1510003 	cmp	r1, r3
    cbec:	11a00008 	movne	r0, r8
    cbf0:	1b00024c 	blne	d528 <_free_r>
    cbf4:	e3a00000 	mov	r0, #0
    cbf8:	e5850030 	str	r0, [r5, #48]	; 0x30
    cbfc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    cc00:	e12fff1e 	bx	lr
    cc04:	e5916010 	ldr	r6, [r1, #16]
    cc08:	e3560000 	cmp	r6, #0
    cc0c:	0a000020 	beq	cc94 <__sflush_r+0x180>
    cc10:	e1a02822 	lsr	r2, r2, #16
    cc14:	e3120003 	tst	r2, #3
    cc18:	13a03000 	movne	r3, #0
    cc1c:	e5914000 	ldr	r4, [r1]
    cc20:	05913014 	ldreq	r3, [r1, #20]
    cc24:	e0444006 	sub	r4, r4, r6
    cc28:	e3540000 	cmp	r4, #0
    cc2c:	e5816000 	str	r6, [r1]
    cc30:	e5813008 	str	r3, [r1, #8]
    cc34:	ca000003 	bgt	cc48 <__sflush_r+0x134>
    cc38:	ea000015 	b	cc94 <__sflush_r+0x180>
    cc3c:	e3540000 	cmp	r4, #0
    cc40:	e0866000 	add	r6, r6, r0
    cc44:	da000012 	ble	cc94 <__sflush_r+0x180>
    cc48:	e1a03004 	mov	r3, r4
    cc4c:	e5957024 	ldr	r7, [r5, #36]	; 0x24
    cc50:	e1a02006 	mov	r2, r6
    cc54:	e595101c 	ldr	r1, [r5, #28]
    cc58:	e1a00008 	mov	r0, r8
    cc5c:	e1a0e00f 	mov	lr, pc
    cc60:	e12fff17 	bx	r7
    cc64:	e3500000 	cmp	r0, #0
    cc68:	e0444000 	sub	r4, r4, r0
    cc6c:	cafffff2 	bgt	cc3c <__sflush_r+0x128>
    cc70:	e3e00000 	mvn	r0, #0
    cc74:	e1d530bc 	ldrh	r3, [r5, #12]
    cc78:	e3833040 	orr	r3, r3, #64	; 0x40
    cc7c:	e1c530bc 	strh	r3, [r5, #12]
    cc80:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    cc84:	e12fff1e 	bx	lr
    cc88:	e591203c 	ldr	r2, [r1, #60]	; 0x3c
    cc8c:	e3520000 	cmp	r2, #0
    cc90:	caffffab 	bgt	cb44 <__sflush_r+0x30>
    cc94:	e3a00000 	mov	r0, #0
    cc98:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    cc9c:	e12fff1e 	bx	lr
    cca0:	e5981000 	ldr	r1, [r8]
    cca4:	e351001d 	cmp	r1, #29
    cca8:	8afffff0 	bhi	cc70 <__sflush_r+0x15c>
    ccac:	e59f3098 	ldr	r3, [pc, #152]	; cd4c <__sflush_r+0x238>
    ccb0:	e1e03133 	mvn	r3, r3, lsr r1
    ccb4:	e2133001 	ands	r3, r3, #1
    ccb8:	1affffec 	bne	cc70 <__sflush_r+0x15c>
    ccbc:	e1d520fc 	ldrsh	r2, [r5, #12]
    ccc0:	e595c010 	ldr	ip, [r5, #16]
    ccc4:	e3c22b02 	bic	r2, r2, #2048	; 0x800
    ccc8:	e3120a01 	tst	r2, #4096	; 0x1000
    cccc:	e5853004 	str	r3, [r5, #4]
    ccd0:	e1c520bc 	strh	r2, [r5, #12]
    ccd4:	e585c000 	str	ip, [r5]
    ccd8:	0affffbd 	beq	cbd4 <__sflush_r+0xc0>
    ccdc:	e3510000 	cmp	r1, #0
    cce0:	1affffbb 	bne	cbd4 <__sflush_r+0xc0>
    cce4:	e5850050 	str	r0, [r5, #80]	; 0x50
    cce8:	eaffffb9 	b	cbd4 <__sflush_r+0xc0>
    ccec:	e1a02007 	mov	r2, r7
    ccf0:	e3a03001 	mov	r3, #1
    ccf4:	e595101c 	ldr	r1, [r5, #28]
    ccf8:	e1a00008 	mov	r0, r8
    ccfc:	e1a0e00f 	mov	lr, pc
    cd00:	e12fff14 	bx	r4
    cd04:	e3700001 	cmn	r0, #1
    cd08:	e1a02000 	mov	r2, r0
    cd0c:	0a000002 	beq	cd1c <__sflush_r+0x208>
    cd10:	e1d530bc 	ldrh	r3, [r5, #12]
    cd14:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    cd18:	eaffff95 	b	cb74 <__sflush_r+0x60>
    cd1c:	e5983000 	ldr	r3, [r8]
    cd20:	e3530000 	cmp	r3, #0
    cd24:	0afffff9 	beq	cd10 <__sflush_r+0x1fc>
    cd28:	e3530016 	cmp	r3, #22
    cd2c:	1353001d 	cmpne	r3, #29
    cd30:	11d530bc 	ldrhne	r3, [r5, #12]
    cd34:	13833040 	orrne	r3, r3, #64	; 0x40
    cd38:	05886000 	streq	r6, [r8]
    cd3c:	01a00007 	moveq	r0, r7
    cd40:	11a00002 	movne	r0, r2
    cd44:	11c530bc 	strhne	r3, [r5, #12]
    cd48:	eaffffcc 	b	cc80 <__sflush_r+0x16c>
    cd4c:	20400001 	.word	0x20400001

0000cd50 <_fflush_r>:
    cd50:	e92d4070 	push	{r4, r5, r6, lr}
    cd54:	e2504000 	subs	r4, r0, #0
    cd58:	e1a05001 	mov	r5, r1
    cd5c:	0a000002 	beq	cd6c <_fflush_r+0x1c>
    cd60:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    cd64:	e3530000 	cmp	r3, #0
    cd68:	0a000015 	beq	cdc4 <_fflush_r+0x74>
    cd6c:	e1d500fc 	ldrsh	r0, [r5, #12]
    cd70:	e3500000 	cmp	r0, #0
    cd74:	01a04000 	moveq	r4, r0
    cd78:	0a00000e 	beq	cdb8 <_fflush_r+0x68>
    cd7c:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    cd80:	e3130001 	tst	r3, #1
    cd84:	1a000001 	bne	cd90 <_fflush_r+0x40>
    cd88:	e3100c02 	tst	r0, #512	; 0x200
    cd8c:	0a000013 	beq	cde0 <_fflush_r+0x90>
    cd90:	e1a00004 	mov	r0, r4
    cd94:	e1a01005 	mov	r1, r5
    cd98:	ebffff5d 	bl	cb14 <__sflush_r>
    cd9c:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    cda0:	e3130001 	tst	r3, #1
    cda4:	e1a04000 	mov	r4, r0
    cda8:	1a000002 	bne	cdb8 <_fflush_r+0x68>
    cdac:	e1d530bc 	ldrh	r3, [r5, #12]
    cdb0:	e3130c02 	tst	r3, #512	; 0x200
    cdb4:	0a000004 	beq	cdcc <_fflush_r+0x7c>
    cdb8:	e1a00004 	mov	r0, r4
    cdbc:	e8bd4070 	pop	{r4, r5, r6, lr}
    cdc0:	e12fff1e 	bx	lr
    cdc4:	eb000076 	bl	cfa4 <__sinit>
    cdc8:	eaffffe7 	b	cd6c <_fflush_r+0x1c>
    cdcc:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    cdd0:	eb000448 	bl	def8 <__retarget_lock_release_recursive>
    cdd4:	e1a00004 	mov	r0, r4
    cdd8:	e8bd4070 	pop	{r4, r5, r6, lr}
    cddc:	e12fff1e 	bx	lr
    cde0:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    cde4:	eb00043d 	bl	dee0 <__retarget_lock_acquire_recursive>
    cde8:	eaffffe8 	b	cd90 <_fflush_r+0x40>

0000cdec <fflush>:
    cdec:	e2501000 	subs	r1, r0, #0
    cdf0:	159f3020 	ldrne	r3, [pc, #32]	; ce18 <fflush+0x2c>
    cdf4:	15930000 	ldrne	r0, [r3]
    cdf8:	1affffd4 	bne	cd50 <_fflush_r>
    cdfc:	e92d4010 	push	{r4, lr}
    ce00:	e59f3014 	ldr	r3, [pc, #20]	; ce1c <fflush+0x30>
    ce04:	e59f1014 	ldr	r1, [pc, #20]	; ce20 <fflush+0x34>
    ce08:	e5930000 	ldr	r0, [r3]
    ce0c:	eb0003d5 	bl	dd68 <_fwalk_reent>
    ce10:	e8bd4010 	pop	{r4, lr}
    ce14:	e12fff1e 	bx	lr
    ce18:	00010384 	.word	0x00010384
    ce1c:	000101e4 	.word	0x000101e4
    ce20:	0000cd50 	.word	0x0000cd50

0000ce24 <_cleanup_r>:
    ce24:	e92d4010 	push	{r4, lr}
    ce28:	e59f1008 	ldr	r1, [pc, #8]	; ce38 <_cleanup_r+0x14>
    ce2c:	eb0003cd 	bl	dd68 <_fwalk_reent>
    ce30:	e8bd4010 	pop	{r4, lr}
    ce34:	e12fff1e 	bx	lr
    ce38:	0000f818 	.word	0x0000f818

0000ce3c <std.isra.0>:
    ce3c:	e3a03000 	mov	r3, #0
    ce40:	e92d4010 	push	{r4, lr}
    ce44:	e1a04000 	mov	r4, r0
    ce48:	e1c010bc 	strh	r1, [r0, #12]
    ce4c:	e1c020be 	strh	r2, [r0, #14]
    ce50:	e5803000 	str	r3, [r0]
    ce54:	e5803004 	str	r3, [r0, #4]
    ce58:	e5803008 	str	r3, [r0, #8]
    ce5c:	e5803064 	str	r3, [r0, #100]	; 0x64
    ce60:	e5803010 	str	r3, [r0, #16]
    ce64:	e5803014 	str	r3, [r0, #20]
    ce68:	e5803018 	str	r3, [r0, #24]
    ce6c:	e1a01003 	mov	r1, r3
    ce70:	e3a02008 	mov	r2, #8
    ce74:	e280005c 	add	r0, r0, #92	; 0x5c
    ce78:	ebfff93c 	bl	b370 <memset>
    ce7c:	e59f002c 	ldr	r0, [pc, #44]	; ceb0 <std.isra.0+0x74>
    ce80:	e59f102c 	ldr	r1, [pc, #44]	; ceb4 <std.isra.0+0x78>
    ce84:	e59f202c 	ldr	r2, [pc, #44]	; ceb8 <std.isra.0+0x7c>
    ce88:	e59f302c 	ldr	r3, [pc, #44]	; cebc <std.isra.0+0x80>
    ce8c:	e5840020 	str	r0, [r4, #32]
    ce90:	e584401c 	str	r4, [r4, #28]
    ce94:	e5841024 	str	r1, [r4, #36]	; 0x24
    ce98:	e5842028 	str	r2, [r4, #40]	; 0x28
    ce9c:	e584302c 	str	r3, [r4, #44]	; 0x2c
    cea0:	e2840058 	add	r0, r4, #88	; 0x58
    cea4:	eb000409 	bl	ded0 <__retarget_lock_init_recursive>
    cea8:	e8bd4010 	pop	{r4, lr}
    ceac:	e12fff1e 	bx	lr
    ceb0:	0000f1c4 	.word	0x0000f1c4
    ceb4:	0000f200 	.word	0x0000f200
    ceb8:	0000f258 	.word	0x0000f258
    cebc:	0000f288 	.word	0x0000f288

0000cec0 <__fp_lock>:
    cec0:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    cec4:	e3130001 	tst	r3, #1
    cec8:	1a000002 	bne	ced8 <__fp_lock+0x18>
    cecc:	e1d030bc 	ldrh	r3, [r0, #12]
    ced0:	e3130c02 	tst	r3, #512	; 0x200
    ced4:	0a000001 	beq	cee0 <__fp_lock+0x20>
    ced8:	e3a00000 	mov	r0, #0
    cedc:	e12fff1e 	bx	lr
    cee0:	e92d4010 	push	{r4, lr}
    cee4:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    cee8:	eb0003fc 	bl	dee0 <__retarget_lock_acquire_recursive>
    ceec:	e3a00000 	mov	r0, #0
    cef0:	e8bd4010 	pop	{r4, lr}
    cef4:	e12fff1e 	bx	lr

0000cef8 <__fp_unlock>:
    cef8:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    cefc:	e3130001 	tst	r3, #1
    cf00:	1a000002 	bne	cf10 <__fp_unlock+0x18>
    cf04:	e1d030bc 	ldrh	r3, [r0, #12]
    cf08:	e3130c02 	tst	r3, #512	; 0x200
    cf0c:	0a000001 	beq	cf18 <__fp_unlock+0x20>
    cf10:	e3a00000 	mov	r0, #0
    cf14:	e12fff1e 	bx	lr
    cf18:	e92d4010 	push	{r4, lr}
    cf1c:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    cf20:	eb0003f4 	bl	def8 <__retarget_lock_release_recursive>
    cf24:	e3a00000 	mov	r0, #0
    cf28:	e8bd4010 	pop	{r4, lr}
    cf2c:	e12fff1e 	bx	lr

0000cf30 <__sfmoreglue>:
    cf30:	e2412001 	sub	r2, r1, #1
    cf34:	e92d4070 	push	{r4, r5, r6, lr}
    cf38:	e0824082 	add	r4, r2, r2, lsl #1
    cf3c:	e0822104 	add	r2, r2, r4, lsl #2
    cf40:	e1a04182 	lsl	r4, r2, #3
    cf44:	e1a06001 	mov	r6, r1
    cf48:	e2841074 	add	r1, r4, #116	; 0x74
    cf4c:	eb000452 	bl	e09c <_malloc_r>
    cf50:	e2505000 	subs	r5, r0, #0
    cf54:	0a000006 	beq	cf74 <__sfmoreglue+0x44>
    cf58:	e3a01000 	mov	r1, #0
    cf5c:	e285000c 	add	r0, r5, #12
    cf60:	e5856004 	str	r6, [r5, #4]
    cf64:	e2842068 	add	r2, r4, #104	; 0x68
    cf68:	e5851000 	str	r1, [r5]
    cf6c:	e5850008 	str	r0, [r5, #8]
    cf70:	ebfff8fe 	bl	b370 <memset>
    cf74:	e1a00005 	mov	r0, r5
    cf78:	e8bd4070 	pop	{r4, r5, r6, lr}
    cf7c:	e12fff1e 	bx	lr

0000cf80 <_cleanup>:
    cf80:	e92d4010 	push	{r4, lr}
    cf84:	e59f3010 	ldr	r3, [pc, #16]	; cf9c <_cleanup+0x1c>
    cf88:	e59f1010 	ldr	r1, [pc, #16]	; cfa0 <_cleanup+0x20>
    cf8c:	e5930000 	ldr	r0, [r3]
    cf90:	eb000374 	bl	dd68 <_fwalk_reent>
    cf94:	e8bd4010 	pop	{r4, lr}
    cf98:	e12fff1e 	bx	lr
    cf9c:	000101e4 	.word	0x000101e4
    cfa0:	0000f818 	.word	0x0000f818

0000cfa4 <__sinit>:
    cfa4:	e92d4010 	push	{r4, lr}
    cfa8:	e1a04000 	mov	r4, r0
    cfac:	e59f007c 	ldr	r0, [pc, #124]	; d030 <__sinit+0x8c>
    cfb0:	eb0003ca 	bl	dee0 <__retarget_lock_acquire_recursive>
    cfb4:	e5942038 	ldr	r2, [r4, #56]	; 0x38
    cfb8:	e3520000 	cmp	r2, #0
    cfbc:	1a000017 	bne	d020 <__sinit+0x7c>
    cfc0:	e3a00003 	mov	r0, #3
    cfc4:	e59f1068 	ldr	r1, [pc, #104]	; d034 <__sinit+0x90>
    cfc8:	e2843fbb 	add	r3, r4, #748	; 0x2ec
    cfcc:	e58432e8 	str	r3, [r4, #744]	; 0x2e8
    cfd0:	e58422e0 	str	r2, [r4, #736]	; 0x2e0
    cfd4:	e58402e4 	str	r0, [r4, #740]	; 0x2e4
    cfd8:	e584103c 	str	r1, [r4, #60]	; 0x3c
    cfdc:	e5940004 	ldr	r0, [r4, #4]
    cfe0:	e3a01004 	mov	r1, #4
    cfe4:	ebffff94 	bl	ce3c <std.isra.0>
    cfe8:	e5940008 	ldr	r0, [r4, #8]
    cfec:	e3a02001 	mov	r2, #1
    cff0:	e3a01009 	mov	r1, #9
    cff4:	ebffff90 	bl	ce3c <std.isra.0>
    cff8:	e594000c 	ldr	r0, [r4, #12]
    cffc:	e3a02002 	mov	r2, #2
    d000:	e3a01012 	mov	r1, #18
    d004:	ebffff8c 	bl	ce3c <std.isra.0>
    d008:	e3a03001 	mov	r3, #1
    d00c:	e59f001c 	ldr	r0, [pc, #28]	; d030 <__sinit+0x8c>
    d010:	e5843038 	str	r3, [r4, #56]	; 0x38
    d014:	eb0003b7 	bl	def8 <__retarget_lock_release_recursive>
    d018:	e8bd4010 	pop	{r4, lr}
    d01c:	e12fff1e 	bx	lr
    d020:	e59f0008 	ldr	r0, [pc, #8]	; d030 <__sinit+0x8c>
    d024:	eb0003b3 	bl	def8 <__retarget_lock_release_recursive>
    d028:	e8bd4010 	pop	{r4, lr}
    d02c:	e12fff1e 	bx	lr
    d030:	00010d98 	.word	0x00010d98
    d034:	0000ce24 	.word	0x0000ce24

0000d038 <__sfp>:
    d038:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d03c:	e1a06000 	mov	r6, r0
    d040:	e59f0108 	ldr	r0, [pc, #264]	; d150 <__sfp+0x118>
    d044:	eb0003a5 	bl	dee0 <__retarget_lock_acquire_recursive>
    d048:	e59f3104 	ldr	r3, [pc, #260]	; d154 <__sfp+0x11c>
    d04c:	e5935000 	ldr	r5, [r3]
    d050:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    d054:	e3530000 	cmp	r3, #0
    d058:	0a00002d 	beq	d114 <__sfp+0xdc>
    d05c:	e3a07004 	mov	r7, #4
    d060:	e2855e2e 	add	r5, r5, #736	; 0x2e0
    d064:	e5953004 	ldr	r3, [r5, #4]
    d068:	e2533001 	subs	r3, r3, #1
    d06c:	e5954008 	ldr	r4, [r5, #8]
    d070:	5a000004 	bpl	d088 <__sfp+0x50>
    d074:	ea000021 	b	d100 <__sfp+0xc8>
    d078:	e2433001 	sub	r3, r3, #1
    d07c:	e3730001 	cmn	r3, #1
    d080:	e2844068 	add	r4, r4, #104	; 0x68
    d084:	0a00001d 	beq	d100 <__sfp+0xc8>
    d088:	e1d420fc 	ldrsh	r2, [r4, #12]
    d08c:	e3520000 	cmp	r2, #0
    d090:	1afffff8 	bne	d078 <__sfp+0x40>
    d094:	e3a05000 	mov	r5, #0
    d098:	e3e02000 	mvn	r2, #0
    d09c:	e3a03001 	mov	r3, #1
    d0a0:	e1c420be 	strh	r2, [r4, #14]
    d0a4:	e1c430bc 	strh	r3, [r4, #12]
    d0a8:	e2840058 	add	r0, r4, #88	; 0x58
    d0ac:	e5845064 	str	r5, [r4, #100]	; 0x64
    d0b0:	eb000386 	bl	ded0 <__retarget_lock_init_recursive>
    d0b4:	e59f0094 	ldr	r0, [pc, #148]	; d150 <__sfp+0x118>
    d0b8:	eb00038e 	bl	def8 <__retarget_lock_release_recursive>
    d0bc:	e5845000 	str	r5, [r4]
    d0c0:	e5845008 	str	r5, [r4, #8]
    d0c4:	e5845004 	str	r5, [r4, #4]
    d0c8:	e5845010 	str	r5, [r4, #16]
    d0cc:	e5845014 	str	r5, [r4, #20]
    d0d0:	e5845018 	str	r5, [r4, #24]
    d0d4:	e1a01005 	mov	r1, r5
    d0d8:	e3a02008 	mov	r2, #8
    d0dc:	e284005c 	add	r0, r4, #92	; 0x5c
    d0e0:	ebfff8a2 	bl	b370 <memset>
    d0e4:	e5845030 	str	r5, [r4, #48]	; 0x30
    d0e8:	e5845034 	str	r5, [r4, #52]	; 0x34
    d0ec:	e5845044 	str	r5, [r4, #68]	; 0x44
    d0f0:	e5845048 	str	r5, [r4, #72]	; 0x48
    d0f4:	e1a00004 	mov	r0, r4
    d0f8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d0fc:	e12fff1e 	bx	lr
    d100:	e5954000 	ldr	r4, [r5]
    d104:	e3540000 	cmp	r4, #0
    d108:	0a000004 	beq	d120 <__sfp+0xe8>
    d10c:	e1a05004 	mov	r5, r4
    d110:	eaffffd3 	b	d064 <__sfp+0x2c>
    d114:	e1a00005 	mov	r0, r5
    d118:	ebffffa1 	bl	cfa4 <__sinit>
    d11c:	eaffffce 	b	d05c <__sfp+0x24>
    d120:	e1a01007 	mov	r1, r7
    d124:	e1a00006 	mov	r0, r6
    d128:	ebffff80 	bl	cf30 <__sfmoreglue>
    d12c:	e3500000 	cmp	r0, #0
    d130:	e1a04000 	mov	r4, r0
    d134:	e5850000 	str	r0, [r5]
    d138:	1afffff3 	bne	d10c <__sfp+0xd4>
    d13c:	e59f000c 	ldr	r0, [pc, #12]	; d150 <__sfp+0x118>
    d140:	eb00036c 	bl	def8 <__retarget_lock_release_recursive>
    d144:	e3a0300c 	mov	r3, #12
    d148:	e5863000 	str	r3, [r6]
    d14c:	eaffffe8 	b	d0f4 <__sfp+0xbc>
    d150:	00010dac 	.word	0x00010dac
    d154:	000101e4 	.word	0x000101e4

0000d158 <__sfp_lock_acquire>:
    d158:	e92d4010 	push	{r4, lr}
    d15c:	e59f0008 	ldr	r0, [pc, #8]	; d16c <__sfp_lock_acquire+0x14>
    d160:	eb00035e 	bl	dee0 <__retarget_lock_acquire_recursive>
    d164:	e8bd4010 	pop	{r4, lr}
    d168:	e12fff1e 	bx	lr
    d16c:	00010dac 	.word	0x00010dac

0000d170 <__sfp_lock_release>:
    d170:	e92d4010 	push	{r4, lr}
    d174:	e59f0008 	ldr	r0, [pc, #8]	; d184 <__sfp_lock_release+0x14>
    d178:	eb00035e 	bl	def8 <__retarget_lock_release_recursive>
    d17c:	e8bd4010 	pop	{r4, lr}
    d180:	e12fff1e 	bx	lr
    d184:	00010dac 	.word	0x00010dac

0000d188 <__sinit_lock_acquire>:
    d188:	e92d4010 	push	{r4, lr}
    d18c:	e59f0008 	ldr	r0, [pc, #8]	; d19c <__sinit_lock_acquire+0x14>
    d190:	eb000352 	bl	dee0 <__retarget_lock_acquire_recursive>
    d194:	e8bd4010 	pop	{r4, lr}
    d198:	e12fff1e 	bx	lr
    d19c:	00010d98 	.word	0x00010d98

0000d1a0 <__sinit_lock_release>:
    d1a0:	e92d4010 	push	{r4, lr}
    d1a4:	e59f0008 	ldr	r0, [pc, #8]	; d1b4 <__sinit_lock_release+0x14>
    d1a8:	eb000352 	bl	def8 <__retarget_lock_release_recursive>
    d1ac:	e8bd4010 	pop	{r4, lr}
    d1b0:	e12fff1e 	bx	lr
    d1b4:	00010d98 	.word	0x00010d98

0000d1b8 <__fp_lock_all>:
    d1b8:	e92d4010 	push	{r4, lr}
    d1bc:	e59f0018 	ldr	r0, [pc, #24]	; d1dc <__fp_lock_all+0x24>
    d1c0:	eb000346 	bl	dee0 <__retarget_lock_acquire_recursive>
    d1c4:	e59f3014 	ldr	r3, [pc, #20]	; d1e0 <__fp_lock_all+0x28>
    d1c8:	e59f1014 	ldr	r1, [pc, #20]	; d1e4 <__fp_lock_all+0x2c>
    d1cc:	e5930000 	ldr	r0, [r3]
    d1d0:	eb0002c3 	bl	dce4 <_fwalk>
    d1d4:	e8bd4010 	pop	{r4, lr}
    d1d8:	e12fff1e 	bx	lr
    d1dc:	00010dac 	.word	0x00010dac
    d1e0:	00010384 	.word	0x00010384
    d1e4:	0000cec0 	.word	0x0000cec0

0000d1e8 <__fp_unlock_all>:
    d1e8:	e92d4010 	push	{r4, lr}
    d1ec:	e59f3018 	ldr	r3, [pc, #24]	; d20c <__fp_unlock_all+0x24>
    d1f0:	e59f1018 	ldr	r1, [pc, #24]	; d210 <__fp_unlock_all+0x28>
    d1f4:	e5930000 	ldr	r0, [r3]
    d1f8:	eb0002b9 	bl	dce4 <_fwalk>
    d1fc:	e59f0010 	ldr	r0, [pc, #16]	; d214 <__fp_unlock_all+0x2c>
    d200:	eb00033c 	bl	def8 <__retarget_lock_release_recursive>
    d204:	e8bd4010 	pop	{r4, lr}
    d208:	e12fff1e 	bx	lr
    d20c:	00010384 	.word	0x00010384
    d210:	0000cef8 	.word	0x0000cef8
    d214:	00010dac 	.word	0x00010dac

0000d218 <__fputwc>:
    d218:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    d21c:	e24dd00c 	sub	sp, sp, #12
    d220:	e1a08000 	mov	r8, r0
    d224:	e1a07001 	mov	r7, r1
    d228:	e1a04002 	mov	r4, r2
    d22c:	eb00030a 	bl	de5c <__locale_mb_cur_max>
    d230:	e3500001 	cmp	r0, #1
    d234:	0a000030 	beq	d2fc <__fputwc+0xe4>
    d238:	e284305c 	add	r3, r4, #92	; 0x5c
    d23c:	e1a02007 	mov	r2, r7
    d240:	e28d1004 	add	r1, sp, #4
    d244:	e1a00008 	mov	r0, r8
    d248:	eb0008ef 	bl	f60c <_wcrtomb_r>
    d24c:	e3700001 	cmn	r0, #1
    d250:	e1a06000 	mov	r6, r0
    d254:	0a000022 	beq	d2e4 <__fputwc+0xcc>
    d258:	e3500000 	cmp	r0, #0
    d25c:	15dd1004 	ldrbne	r1, [sp, #4]
    d260:	0a00002c 	beq	d318 <__fputwc+0x100>
    d264:	e3a05000 	mov	r5, #0
    d268:	e28d9004 	add	r9, sp, #4
    d26c:	ea000007 	b	d290 <__fputwc+0x78>
    d270:	e5943000 	ldr	r3, [r4]
    d274:	e2832001 	add	r2, r3, #1
    d278:	e5842000 	str	r2, [r4]
    d27c:	e5c31000 	strb	r1, [r3]
    d280:	e2855001 	add	r5, r5, #1
    d284:	e1560005 	cmp	r6, r5
    d288:	9a000022 	bls	d318 <__fputwc+0x100>
    d28c:	e7d51009 	ldrb	r1, [r5, r9]
    d290:	e5943008 	ldr	r3, [r4, #8]
    d294:	e2433001 	sub	r3, r3, #1
    d298:	e3530000 	cmp	r3, #0
    d29c:	e5843008 	str	r3, [r4, #8]
    d2a0:	aafffff2 	bge	d270 <__fputwc+0x58>
    d2a4:	e5942018 	ldr	r2, [r4, #24]
    d2a8:	e1530002 	cmp	r3, r2
    d2ac:	b3a03000 	movlt	r3, #0
    d2b0:	a3a03001 	movge	r3, #1
    d2b4:	e351000a 	cmp	r1, #10
    d2b8:	03a03000 	moveq	r3, #0
    d2bc:	e3530000 	cmp	r3, #0
    d2c0:	1affffea 	bne	d270 <__fputwc+0x58>
    d2c4:	e1a02004 	mov	r2, r4
    d2c8:	e1a00008 	mov	r0, r8
    d2cc:	eb00087b 	bl	f4c0 <__swbuf_r>
    d2d0:	e3700001 	cmn	r0, #1
    d2d4:	1affffe9 	bne	d280 <__fputwc+0x68>
    d2d8:	e28dd00c 	add	sp, sp, #12
    d2dc:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    d2e0:	e12fff1e 	bx	lr
    d2e4:	e1d430bc 	ldrh	r3, [r4, #12]
    d2e8:	e3833040 	orr	r3, r3, #64	; 0x40
    d2ec:	e1c430bc 	strh	r3, [r4, #12]
    d2f0:	e28dd00c 	add	sp, sp, #12
    d2f4:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    d2f8:	e12fff1e 	bx	lr
    d2fc:	e2473001 	sub	r3, r7, #1
    d300:	e35300fe 	cmp	r3, #254	; 0xfe
    d304:	8affffcb 	bhi	d238 <__fputwc+0x20>
    d308:	e20710ff 	and	r1, r7, #255	; 0xff
    d30c:	e1a06000 	mov	r6, r0
    d310:	e5cd1004 	strb	r1, [sp, #4]
    d314:	eaffffd2 	b	d264 <__fputwc+0x4c>
    d318:	e1a00007 	mov	r0, r7
    d31c:	e28dd00c 	add	sp, sp, #12
    d320:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    d324:	e12fff1e 	bx	lr

0000d328 <_fputwc_r>:
    d328:	e92d4030 	push	{r4, r5, lr}
    d32c:	e5923064 	ldr	r3, [r2, #100]	; 0x64
    d330:	e1a04002 	mov	r4, r2
    d334:	e1d220fc 	ldrsh	r2, [r2, #12]
    d338:	e3130001 	tst	r3, #1
    d33c:	e1a03802 	lsl	r3, r2, #16
    d340:	e24dd00c 	sub	sp, sp, #12
    d344:	e1a05000 	mov	r5, r0
    d348:	11a03823 	lsrne	r3, r3, #16
    d34c:	1a000002 	bne	d35c <_fputwc_r+0x34>
    d350:	e3130402 	tst	r3, #33554432	; 0x2000000
    d354:	e1a03823 	lsr	r3, r3, #16
    d358:	0a000019 	beq	d3c4 <_fputwc_r+0x9c>
    d35c:	e3130a02 	tst	r3, #8192	; 0x2000
    d360:	05943064 	ldreq	r3, [r4, #100]	; 0x64
    d364:	03822a02 	orreq	r2, r2, #8192	; 0x2000
    d368:	03833a02 	orreq	r3, r3, #8192	; 0x2000
    d36c:	01c420bc 	strheq	r2, [r4, #12]
    d370:	05843064 	streq	r3, [r4, #100]	; 0x64
    d374:	e1a00005 	mov	r0, r5
    d378:	e1a02004 	mov	r2, r4
    d37c:	ebffffa5 	bl	d218 <__fputwc>
    d380:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    d384:	e3130001 	tst	r3, #1
    d388:	e1a05000 	mov	r5, r0
    d38c:	1a000002 	bne	d39c <_fputwc_r+0x74>
    d390:	e1d430bc 	ldrh	r3, [r4, #12]
    d394:	e3130c02 	tst	r3, #512	; 0x200
    d398:	0a000003 	beq	d3ac <_fputwc_r+0x84>
    d39c:	e1a00005 	mov	r0, r5
    d3a0:	e28dd00c 	add	sp, sp, #12
    d3a4:	e8bd4030 	pop	{r4, r5, lr}
    d3a8:	e12fff1e 	bx	lr
    d3ac:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    d3b0:	eb0002d0 	bl	def8 <__retarget_lock_release_recursive>
    d3b4:	e1a00005 	mov	r0, r5
    d3b8:	e28dd00c 	add	sp, sp, #12
    d3bc:	e8bd4030 	pop	{r4, r5, lr}
    d3c0:	e12fff1e 	bx	lr
    d3c4:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    d3c8:	e58d1004 	str	r1, [sp, #4]
    d3cc:	eb0002c3 	bl	dee0 <__retarget_lock_acquire_recursive>
    d3d0:	e1d420fc 	ldrsh	r2, [r4, #12]
    d3d4:	e1a03802 	lsl	r3, r2, #16
    d3d8:	e1a03823 	lsr	r3, r3, #16
    d3dc:	e59d1004 	ldr	r1, [sp, #4]
    d3e0:	eaffffdd 	b	d35c <_fputwc_r+0x34>

0000d3e4 <fputwc>:
    d3e4:	e59f3038 	ldr	r3, [pc, #56]	; d424 <fputwc+0x40>
    d3e8:	e92d4070 	push	{r4, r5, r6, lr}
    d3ec:	e5934000 	ldr	r4, [r3]
    d3f0:	e3540000 	cmp	r4, #0
    d3f4:	e1a05000 	mov	r5, r0
    d3f8:	e1a06001 	mov	r6, r1
    d3fc:	0a000003 	beq	d410 <fputwc+0x2c>
    d400:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    d404:	e3530000 	cmp	r3, #0
    d408:	01a00004 	moveq	r0, r4
    d40c:	0bfffee4 	bleq	cfa4 <__sinit>
    d410:	e1a02006 	mov	r2, r6
    d414:	e1a01005 	mov	r1, r5
    d418:	e1a00004 	mov	r0, r4
    d41c:	e8bd4070 	pop	{r4, r5, r6, lr}
    d420:	eaffffc0 	b	d328 <_fputwc_r>
    d424:	00010384 	.word	0x00010384

0000d428 <_malloc_trim_r>:
    d428:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    d42c:	e1a04001 	mov	r4, r1
    d430:	e59f70e4 	ldr	r7, [pc, #228]	; d51c <_malloc_trim_r+0xf4>
    d434:	e1a06000 	mov	r6, r0
    d438:	eb00055e 	bl	e9b8 <__malloc_lock>
    d43c:	e5973008 	ldr	r3, [r7, #8]
    d440:	e5935004 	ldr	r5, [r3, #4]
    d444:	e2641efe 	rsb	r1, r4, #4064	; 0xfe0
    d448:	e281100f 	add	r1, r1, #15
    d44c:	e3c55003 	bic	r5, r5, #3
    d450:	e0814005 	add	r4, r1, r5
    d454:	e1a04624 	lsr	r4, r4, #12
    d458:	e2444001 	sub	r4, r4, #1
    d45c:	e1a04604 	lsl	r4, r4, #12
    d460:	e3540a01 	cmp	r4, #4096	; 0x1000
    d464:	ba000006 	blt	d484 <_malloc_trim_r+0x5c>
    d468:	e3a01000 	mov	r1, #0
    d46c:	e1a00006 	mov	r0, r6
    d470:	eb000691 	bl	eebc <_sbrk_r>
    d474:	e5973008 	ldr	r3, [r7, #8]
    d478:	e0833005 	add	r3, r3, r5
    d47c:	e1500003 	cmp	r0, r3
    d480:	0a000004 	beq	d498 <_malloc_trim_r+0x70>
    d484:	e1a00006 	mov	r0, r6
    d488:	eb000550 	bl	e9d0 <__malloc_unlock>
    d48c:	e3a00000 	mov	r0, #0
    d490:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d494:	e12fff1e 	bx	lr
    d498:	e2641000 	rsb	r1, r4, #0
    d49c:	e1a00006 	mov	r0, r6
    d4a0:	eb000685 	bl	eebc <_sbrk_r>
    d4a4:	e3700001 	cmn	r0, #1
    d4a8:	0a00000c 	beq	d4e0 <_malloc_trim_r+0xb8>
    d4ac:	e59f206c 	ldr	r2, [pc, #108]	; d520 <_malloc_trim_r+0xf8>
    d4b0:	e5971008 	ldr	r1, [r7, #8]
    d4b4:	e5923000 	ldr	r3, [r2]
    d4b8:	e0455004 	sub	r5, r5, r4
    d4bc:	e3855001 	orr	r5, r5, #1
    d4c0:	e1a00006 	mov	r0, r6
    d4c4:	e0434004 	sub	r4, r3, r4
    d4c8:	e5815004 	str	r5, [r1, #4]
    d4cc:	e5824000 	str	r4, [r2]
    d4d0:	eb00053e 	bl	e9d0 <__malloc_unlock>
    d4d4:	e3a00001 	mov	r0, #1
    d4d8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d4dc:	e12fff1e 	bx	lr
    d4e0:	e3a01000 	mov	r1, #0
    d4e4:	e1a00006 	mov	r0, r6
    d4e8:	eb000673 	bl	eebc <_sbrk_r>
    d4ec:	e5972008 	ldr	r2, [r7, #8]
    d4f0:	e0403002 	sub	r3, r0, r2
    d4f4:	e353000f 	cmp	r3, #15
    d4f8:	daffffe1 	ble	d484 <_malloc_trim_r+0x5c>
    d4fc:	e59f1020 	ldr	r1, [pc, #32]	; d524 <_malloc_trim_r+0xfc>
    d500:	e591c000 	ldr	ip, [r1]
    d504:	e59f1014 	ldr	r1, [pc, #20]	; d520 <_malloc_trim_r+0xf8>
    d508:	e3833001 	orr	r3, r3, #1
    d50c:	e040000c 	sub	r0, r0, ip
    d510:	e5823004 	str	r3, [r2, #4]
    d514:	e5810000 	str	r0, [r1]
    d518:	eaffffd9 	b	d484 <_malloc_trim_r+0x5c>
    d51c:	0001091c 	.word	0x0001091c
    d520:	00010d54 	.word	0x00010d54
    d524:	00010d24 	.word	0x00010d24

0000d528 <_free_r>:
    d528:	e92d4070 	push	{r4, r5, r6, lr}
    d52c:	e2514000 	subs	r4, r1, #0
    d530:	0a000031 	beq	d5fc <_free_r+0xd4>
    d534:	e1a05000 	mov	r5, r0
    d538:	eb00051e 	bl	e9b8 <__malloc_lock>
    d53c:	e5141004 	ldr	r1, [r4, #-4]
    d540:	e59fe2ac 	ldr	lr, [pc, #684]	; d7f4 <_free_r+0x2cc>
    d544:	e3c13001 	bic	r3, r1, #1
    d548:	e244c008 	sub	ip, r4, #8
    d54c:	e08c0003 	add	r0, ip, r3
    d550:	e59e6008 	ldr	r6, [lr, #8]
    d554:	e5902004 	ldr	r2, [r0, #4]
    d558:	e1500006 	cmp	r0, r6
    d55c:	e3c22003 	bic	r2, r2, #3
    d560:	0a00004e 	beq	d6a0 <_free_r+0x178>
    d564:	e3110001 	tst	r1, #1
    d568:	e5802004 	str	r2, [r0, #4]
    d56c:	1a000009 	bne	d598 <_free_r+0x70>
    d570:	e5144008 	ldr	r4, [r4, #-8]
    d574:	e04cc004 	sub	ip, ip, r4
    d578:	e59c1008 	ldr	r1, [ip, #8]
    d57c:	e28e6008 	add	r6, lr, #8
    d580:	e1510006 	cmp	r1, r6
    d584:	e0833004 	add	r3, r3, r4
    d588:	0a00005c 	beq	d700 <_free_r+0x1d8>
    d58c:	e59c400c 	ldr	r4, [ip, #12]
    d590:	e581400c 	str	r4, [r1, #12]
    d594:	e5841008 	str	r1, [r4, #8]
    d598:	e0801002 	add	r1, r0, r2
    d59c:	e5911004 	ldr	r1, [r1, #4]
    d5a0:	e3110001 	tst	r1, #1
    d5a4:	13832001 	orrne	r2, r3, #1
    d5a8:	158c2004 	strne	r2, [ip, #4]
    d5ac:	178c3003 	strne	r3, [ip, r3]
    d5b0:	0a00002c 	beq	d668 <_free_r+0x140>
    d5b4:	e3530c02 	cmp	r3, #512	; 0x200
    d5b8:	2a000011 	bcs	d604 <_free_r+0xdc>
    d5bc:	e3a04001 	mov	r4, #1
    d5c0:	e59e0004 	ldr	r0, [lr, #4]
    d5c4:	e1a031a3 	lsr	r3, r3, #3
    d5c8:	e0832004 	add	r2, r3, r4
    d5cc:	e1a03143 	asr	r3, r3, #2
    d5d0:	e1803314 	orr	r3, r0, r4, lsl r3
    d5d4:	e08e1182 	add	r1, lr, r2, lsl #3
    d5d8:	e79e0182 	ldr	r0, [lr, r2, lsl #3]
    d5dc:	e2411008 	sub	r1, r1, #8
    d5e0:	e58e3004 	str	r3, [lr, #4]
    d5e4:	e58c100c 	str	r1, [ip, #12]
    d5e8:	e58c0008 	str	r0, [ip, #8]
    d5ec:	e78ec182 	str	ip, [lr, r2, lsl #3]
    d5f0:	e580c00c 	str	ip, [r0, #12]
    d5f4:	e1a00005 	mov	r0, r5
    d5f8:	eb0004f4 	bl	e9d0 <__malloc_unlock>
    d5fc:	e8bd4070 	pop	{r4, r5, r6, lr}
    d600:	e12fff1e 	bx	lr
    d604:	e1a024a3 	lsr	r2, r3, #9
    d608:	e3520004 	cmp	r2, #4
    d60c:	8a000048 	bhi	d734 <_free_r+0x20c>
    d610:	e1a02323 	lsr	r2, r3, #6
    d614:	e2824039 	add	r4, r2, #57	; 0x39
    d618:	e1a04184 	lsl	r4, r4, #3
    d61c:	e2821038 	add	r1, r2, #56	; 0x38
    d620:	e08e0004 	add	r0, lr, r4
    d624:	e79e2004 	ldr	r2, [lr, r4]
    d628:	e2400008 	sub	r0, r0, #8
    d62c:	e1500002 	cmp	r0, r2
    d630:	0a000045 	beq	d74c <_free_r+0x224>
    d634:	e5921004 	ldr	r1, [r2, #4]
    d638:	e3c11003 	bic	r1, r1, #3
    d63c:	e1530001 	cmp	r3, r1
    d640:	2a00002c 	bcs	d6f8 <_free_r+0x1d0>
    d644:	e5922008 	ldr	r2, [r2, #8]
    d648:	e1500002 	cmp	r0, r2
    d64c:	1afffff8 	bne	d634 <_free_r+0x10c>
    d650:	e590300c 	ldr	r3, [r0, #12]
    d654:	e58c300c 	str	r3, [ip, #12]
    d658:	e58c0008 	str	r0, [ip, #8]
    d65c:	e583c008 	str	ip, [r3, #8]
    d660:	e580c00c 	str	ip, [r0, #12]
    d664:	eaffffe2 	b	d5f4 <_free_r+0xcc>
    d668:	e5901008 	ldr	r1, [r0, #8]
    d66c:	e59f4184 	ldr	r4, [pc, #388]	; d7f8 <_free_r+0x2d0>
    d670:	e1510004 	cmp	r1, r4
    d674:	e0833002 	add	r3, r3, r2
    d678:	0a00003a 	beq	d768 <_free_r+0x240>
    d67c:	e590000c 	ldr	r0, [r0, #12]
    d680:	e3832001 	orr	r2, r3, #1
    d684:	e3530c02 	cmp	r3, #512	; 0x200
    d688:	e581000c 	str	r0, [r1, #12]
    d68c:	e5801008 	str	r1, [r0, #8]
    d690:	e58c2004 	str	r2, [ip, #4]
    d694:	e78c3003 	str	r3, [ip, r3]
    d698:	2affffd9 	bcs	d604 <_free_r+0xdc>
    d69c:	eaffffc6 	b	d5bc <_free_r+0x94>
    d6a0:	e3110001 	tst	r1, #1
    d6a4:	e0833002 	add	r3, r3, r2
    d6a8:	1a000006 	bne	d6c8 <_free_r+0x1a0>
    d6ac:	e5142008 	ldr	r2, [r4, #-8]
    d6b0:	e04cc002 	sub	ip, ip, r2
    d6b4:	e28c0008 	add	r0, ip, #8
    d6b8:	e8900003 	ldm	r0, {r0, r1}
    d6bc:	e580100c 	str	r1, [r0, #12]
    d6c0:	e5810008 	str	r0, [r1, #8]
    d6c4:	e0833002 	add	r3, r3, r2
    d6c8:	e59f212c 	ldr	r2, [pc, #300]	; d7fc <_free_r+0x2d4>
    d6cc:	e5921000 	ldr	r1, [r2]
    d6d0:	e3832001 	orr	r2, r3, #1
    d6d4:	e1530001 	cmp	r3, r1
    d6d8:	e58c2004 	str	r2, [ip, #4]
    d6dc:	e58ec008 	str	ip, [lr, #8]
    d6e0:	3affffc3 	bcc	d5f4 <_free_r+0xcc>
    d6e4:	e59f3114 	ldr	r3, [pc, #276]	; d800 <_free_r+0x2d8>
    d6e8:	e1a00005 	mov	r0, r5
    d6ec:	e5931000 	ldr	r1, [r3]
    d6f0:	ebffff4c 	bl	d428 <_malloc_trim_r>
    d6f4:	eaffffbe 	b	d5f4 <_free_r+0xcc>
    d6f8:	e1a00002 	mov	r0, r2
    d6fc:	eaffffd3 	b	d650 <_free_r+0x128>
    d700:	e0801002 	add	r1, r0, r2
    d704:	e5911004 	ldr	r1, [r1, #4]
    d708:	e3110001 	tst	r1, #1
    d70c:	1a000034 	bne	d7e4 <_free_r+0x2bc>
    d710:	e2801008 	add	r1, r0, #8
    d714:	e0823003 	add	r3, r2, r3
    d718:	e8910006 	ldm	r1, {r1, r2}
    d71c:	e3830001 	orr	r0, r3, #1
    d720:	e581200c 	str	r2, [r1, #12]
    d724:	e5821008 	str	r1, [r2, #8]
    d728:	e58c0004 	str	r0, [ip, #4]
    d72c:	e78c3003 	str	r3, [ip, r3]
    d730:	eaffffaf 	b	d5f4 <_free_r+0xcc>
    d734:	e3520014 	cmp	r2, #20
    d738:	8a000012 	bhi	d788 <_free_r+0x260>
    d73c:	e282405c 	add	r4, r2, #92	; 0x5c
    d740:	e1a04184 	lsl	r4, r4, #3
    d744:	e282105b 	add	r1, r2, #91	; 0x5b
    d748:	eaffffb4 	b	d620 <_free_r+0xf8>
    d74c:	e3a04001 	mov	r4, #1
    d750:	e59e3004 	ldr	r3, [lr, #4]
    d754:	e1a02141 	asr	r2, r1, #2
    d758:	e1832214 	orr	r2, r3, r4, lsl r2
    d75c:	e58e2004 	str	r2, [lr, #4]
    d760:	e1a03000 	mov	r3, r0
    d764:	eaffffba 	b	d654 <_free_r+0x12c>
    d768:	e3832001 	orr	r2, r3, #1
    d76c:	e58ec014 	str	ip, [lr, #20]
    d770:	e58ec010 	str	ip, [lr, #16]
    d774:	e58c100c 	str	r1, [ip, #12]
    d778:	e58c1008 	str	r1, [ip, #8]
    d77c:	e58c2004 	str	r2, [ip, #4]
    d780:	e78c3003 	str	r3, [ip, r3]
    d784:	eaffff9a 	b	d5f4 <_free_r+0xcc>
    d788:	e3520054 	cmp	r2, #84	; 0x54
    d78c:	8a000004 	bhi	d7a4 <_free_r+0x27c>
    d790:	e1a02623 	lsr	r2, r3, #12
    d794:	e282406f 	add	r4, r2, #111	; 0x6f
    d798:	e1a04184 	lsl	r4, r4, #3
    d79c:	e282106e 	add	r1, r2, #110	; 0x6e
    d7a0:	eaffff9e 	b	d620 <_free_r+0xf8>
    d7a4:	e3520f55 	cmp	r2, #340	; 0x154
    d7a8:	8a000004 	bhi	d7c0 <_free_r+0x298>
    d7ac:	e1a027a3 	lsr	r2, r3, #15
    d7b0:	e2824078 	add	r4, r2, #120	; 0x78
    d7b4:	e1a04184 	lsl	r4, r4, #3
    d7b8:	e2821077 	add	r1, r2, #119	; 0x77
    d7bc:	eaffff97 	b	d620 <_free_r+0xf8>
    d7c0:	e59f103c 	ldr	r1, [pc, #60]	; d804 <_free_r+0x2dc>
    d7c4:	e1520001 	cmp	r2, r1
    d7c8:	91a02923 	lsrls	r2, r3, #18
    d7cc:	9282407d 	addls	r4, r2, #125	; 0x7d
    d7d0:	91a04184 	lslls	r4, r4, #3
    d7d4:	9282107c 	addls	r1, r2, #124	; 0x7c
    d7d8:	83a04ffe 	movhi	r4, #1016	; 0x3f8
    d7dc:	83a0107e 	movhi	r1, #126	; 0x7e
    d7e0:	eaffff8e 	b	d620 <_free_r+0xf8>
    d7e4:	e3832001 	orr	r2, r3, #1
    d7e8:	e58c2004 	str	r2, [ip, #4]
    d7ec:	e5803000 	str	r3, [r0]
    d7f0:	eaffff7f 	b	d5f4 <_free_r+0xcc>
    d7f4:	0001091c 	.word	0x0001091c
    d7f8:	00010924 	.word	0x00010924
    d7fc:	00010d28 	.word	0x00010d28
    d800:	00010d84 	.word	0x00010d84
    d804:	00000554 	.word	0x00000554

0000d808 <__sfvwrite_r>:
    d808:	e5923008 	ldr	r3, [r2, #8]
    d80c:	e3530000 	cmp	r3, #0
    d810:	0a0000cb 	beq	db44 <__sfvwrite_r+0x33c>
    d814:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d818:	e1d130fc 	ldrsh	r3, [r1, #12]
    d81c:	e1a03803 	lsl	r3, r3, #16
    d820:	e3130702 	tst	r3, #524288	; 0x80000
    d824:	e24dd00c 	sub	sp, sp, #12
    d828:	e1a04001 	mov	r4, r1
    d82c:	e1a0b000 	mov	fp, r0
    d830:	e1a06002 	mov	r6, r2
    d834:	e1a0a823 	lsr	sl, r3, #16
    d838:	0a000020 	beq	d8c0 <__sfvwrite_r+0xb8>
    d83c:	e5912010 	ldr	r2, [r1, #16]
    d840:	e3520000 	cmp	r2, #0
    d844:	0a00001d 	beq	d8c0 <__sfvwrite_r+0xb8>
    d848:	e21a9002 	ands	r9, sl, #2
    d84c:	e5965000 	ldr	r5, [r6]
    d850:	0a000025 	beq	d8ec <__sfvwrite_r+0xe4>
    d854:	e3a08000 	mov	r8, #0
    d858:	e1a07008 	mov	r7, r8
    d85c:	e59f947c 	ldr	r9, [pc, #1148]	; dce0 <__sfvwrite_r+0x4d8>
    d860:	e3570000 	cmp	r7, #0
    d864:	0a00004a 	beq	d994 <__sfvwrite_r+0x18c>
    d868:	e1570009 	cmp	r7, r9
    d86c:	31a03007 	movcc	r3, r7
    d870:	21a03009 	movcs	r3, r9
    d874:	e594a024 	ldr	sl, [r4, #36]	; 0x24
    d878:	e1a02008 	mov	r2, r8
    d87c:	e594101c 	ldr	r1, [r4, #28]
    d880:	e1a0000b 	mov	r0, fp
    d884:	e1a0e00f 	mov	lr, pc
    d888:	e12fff1a 	bx	sl
    d88c:	e3500000 	cmp	r0, #0
    d890:	da000089 	ble	dabc <__sfvwrite_r+0x2b4>
    d894:	e5963008 	ldr	r3, [r6, #8]
    d898:	e0433000 	sub	r3, r3, r0
    d89c:	e3530000 	cmp	r3, #0
    d8a0:	e0888000 	add	r8, r8, r0
    d8a4:	e0477000 	sub	r7, r7, r0
    d8a8:	e5863008 	str	r3, [r6, #8]
    d8ac:	1affffeb 	bne	d860 <__sfvwrite_r+0x58>
    d8b0:	e3a00000 	mov	r0, #0
    d8b4:	e28dd00c 	add	sp, sp, #12
    d8b8:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d8bc:	e12fff1e 	bx	lr
    d8c0:	e1a01004 	mov	r1, r4
    d8c4:	e1a0000b 	mov	r0, fp
    d8c8:	ebfffc33 	bl	c99c <__swsetup_r>
    d8cc:	e3500000 	cmp	r0, #0
    d8d0:	1a0000fc 	bne	dcc8 <__sfvwrite_r+0x4c0>
    d8d4:	e1d430fc 	ldrsh	r3, [r4, #12]
    d8d8:	e1a03803 	lsl	r3, r3, #16
    d8dc:	e1a0a823 	lsr	sl, r3, #16
    d8e0:	e21a9002 	ands	r9, sl, #2
    d8e4:	e5965000 	ldr	r5, [r6]
    d8e8:	1affffd9 	bne	d854 <__sfvwrite_r+0x4c>
    d8ec:	e21aa001 	ands	sl, sl, #1
    d8f0:	01a0900a 	moveq	r9, sl
    d8f4:	1a000094 	bne	db4c <__sfvwrite_r+0x344>
    d8f8:	e3590000 	cmp	r9, #0
    d8fc:	0a000020 	beq	d984 <__sfvwrite_r+0x17c>
    d900:	e3130402 	tst	r3, #33554432	; 0x2000000
    d904:	e5947008 	ldr	r7, [r4, #8]
    d908:	e1a03823 	lsr	r3, r3, #16
    d90c:	0a000024 	beq	d9a4 <__sfvwrite_r+0x19c>
    d910:	e1590007 	cmp	r9, r7
    d914:	e1a08007 	mov	r8, r7
    d918:	3a000037 	bcc	d9fc <__sfvwrite_r+0x1f4>
    d91c:	e3130d12 	tst	r3, #1152	; 0x480
    d920:	1a00003a 	bne	da10 <__sfvwrite_r+0x208>
    d924:	e1a03009 	mov	r3, r9
    d928:	e5940000 	ldr	r0, [r4]
    d92c:	e1a02008 	mov	r2, r8
    d930:	e1a0100a 	mov	r1, sl
    d934:	e58d3004 	str	r3, [sp, #4]
    d938:	ebfff63a 	bl	b228 <memmove>
    d93c:	e5941008 	ldr	r1, [r4, #8]
    d940:	e5942000 	ldr	r2, [r4]
    d944:	e0417007 	sub	r7, r1, r7
    d948:	e0828008 	add	r8, r2, r8
    d94c:	e5847008 	str	r7, [r4, #8]
    d950:	e5848000 	str	r8, [r4]
    d954:	e59d3004 	ldr	r3, [sp, #4]
    d958:	e5962008 	ldr	r2, [r6, #8]
    d95c:	e0422003 	sub	r2, r2, r3
    d960:	e3520000 	cmp	r2, #0
    d964:	e08aa003 	add	sl, sl, r3
    d968:	e0499003 	sub	r9, r9, r3
    d96c:	e5862008 	str	r2, [r6, #8]
    d970:	0affffce 	beq	d8b0 <__sfvwrite_r+0xa8>
    d974:	e1d430fc 	ldrsh	r3, [r4, #12]
    d978:	e3590000 	cmp	r9, #0
    d97c:	e1a03803 	lsl	r3, r3, #16
    d980:	1affffde 	bne	d900 <__sfvwrite_r+0xf8>
    d984:	e595a000 	ldr	sl, [r5]
    d988:	e5959004 	ldr	r9, [r5, #4]
    d98c:	e2855008 	add	r5, r5, #8
    d990:	eaffffd8 	b	d8f8 <__sfvwrite_r+0xf0>
    d994:	e5958000 	ldr	r8, [r5]
    d998:	e5957004 	ldr	r7, [r5, #4]
    d99c:	e2855008 	add	r5, r5, #8
    d9a0:	eaffffae 	b	d860 <__sfvwrite_r+0x58>
    d9a4:	e5940000 	ldr	r0, [r4]
    d9a8:	e5943010 	ldr	r3, [r4, #16]
    d9ac:	e1500003 	cmp	r0, r3
    d9b0:	8a000002 	bhi	d9c0 <__sfvwrite_r+0x1b8>
    d9b4:	e5948014 	ldr	r8, [r4, #20]
    d9b8:	e1590008 	cmp	r9, r8
    d9bc:	2a000045 	bcs	dad8 <__sfvwrite_r+0x2d0>
    d9c0:	e1570009 	cmp	r7, r9
    d9c4:	21a07009 	movcs	r7, r9
    d9c8:	e1a0100a 	mov	r1, sl
    d9cc:	e1a02007 	mov	r2, r7
    d9d0:	ebfff614 	bl	b228 <memmove>
    d9d4:	e5942008 	ldr	r2, [r4, #8]
    d9d8:	e5943000 	ldr	r3, [r4]
    d9dc:	e0422007 	sub	r2, r2, r7
    d9e0:	e0833007 	add	r3, r3, r7
    d9e4:	e3520000 	cmp	r2, #0
    d9e8:	e5842008 	str	r2, [r4, #8]
    d9ec:	e5843000 	str	r3, [r4]
    d9f0:	0a00002c 	beq	daa8 <__sfvwrite_r+0x2a0>
    d9f4:	e1a03007 	mov	r3, r7
    d9f8:	eaffffd6 	b	d958 <__sfvwrite_r+0x150>
    d9fc:	e1a07009 	mov	r7, r9
    da00:	e1a03009 	mov	r3, r9
    da04:	e1a08009 	mov	r8, r9
    da08:	e5940000 	ldr	r0, [r4]
    da0c:	eaffffc6 	b	d92c <__sfvwrite_r+0x124>
    da10:	e5941010 	ldr	r1, [r4, #16]
    da14:	e5948000 	ldr	r8, [r4]
    da18:	e5942014 	ldr	r2, [r4, #20]
    da1c:	e0488001 	sub	r8, r8, r1
    da20:	e0822082 	add	r2, r2, r2, lsl #1
    da24:	e2887001 	add	r7, r8, #1
    da28:	e0822fa2 	add	r2, r2, r2, lsr #31
    da2c:	e0877009 	add	r7, r7, r9
    da30:	e1a020c2 	asr	r2, r2, #1
    da34:	e1570002 	cmp	r7, r2
    da38:	91a07002 	movls	r7, r2
    da3c:	81a02007 	movhi	r2, r7
    da40:	e3130b01 	tst	r3, #1024	; 0x400
    da44:	0a000032 	beq	db14 <__sfvwrite_r+0x30c>
    da48:	e1a01002 	mov	r1, r2
    da4c:	e1a0000b 	mov	r0, fp
    da50:	eb000191 	bl	e09c <_malloc_r>
    da54:	e2503000 	subs	r3, r0, #0
    da58:	0a00009c 	beq	dcd0 <__sfvwrite_r+0x4c8>
    da5c:	e1a02008 	mov	r2, r8
    da60:	e5941010 	ldr	r1, [r4, #16]
    da64:	e58d3004 	str	r3, [sp, #4]
    da68:	ebfff5a9 	bl	b114 <memcpy>
    da6c:	e1d420bc 	ldrh	r2, [r4, #12]
    da70:	e3c22d12 	bic	r2, r2, #1152	; 0x480
    da74:	e3822080 	orr	r2, r2, #128	; 0x80
    da78:	e1c420bc 	strh	r2, [r4, #12]
    da7c:	e59d3004 	ldr	r3, [sp, #4]
    da80:	e0830008 	add	r0, r3, r8
    da84:	e0478008 	sub	r8, r7, r8
    da88:	e5843010 	str	r3, [r4, #16]
    da8c:	e5848008 	str	r8, [r4, #8]
    da90:	e5847014 	str	r7, [r4, #20]
    da94:	e5840000 	str	r0, [r4]
    da98:	e1a07009 	mov	r7, r9
    da9c:	e1a03009 	mov	r3, r9
    daa0:	e1a08009 	mov	r8, r9
    daa4:	eaffffa0 	b	d92c <__sfvwrite_r+0x124>
    daa8:	e1a01004 	mov	r1, r4
    daac:	e1a0000b 	mov	r0, fp
    dab0:	ebfffca6 	bl	cd50 <_fflush_r>
    dab4:	e3500000 	cmp	r0, #0
    dab8:	0affffcd 	beq	d9f4 <__sfvwrite_r+0x1ec>
    dabc:	e1d430fc 	ldrsh	r3, [r4, #12]
    dac0:	e3e00000 	mvn	r0, #0
    dac4:	e3833040 	orr	r3, r3, #64	; 0x40
    dac8:	e1c430bc 	strh	r3, [r4, #12]
    dacc:	e28dd00c 	add	sp, sp, #12
    dad0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    dad4:	e12fff1e 	bx	lr
    dad8:	e3790106 	cmn	r9, #-2147483647	; 0x80000001
    dadc:	31a00009 	movcc	r0, r9
    dae0:	23e00102 	mvncs	r0, #-2147483648	; 0x80000000
    dae4:	e1a01008 	mov	r1, r8
    dae8:	ebfff4e2 	bl	ae78 <__divsi3>
    daec:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    daf0:	e0030098 	mul	r3, r8, r0
    daf4:	e1a0200a 	mov	r2, sl
    daf8:	e594101c 	ldr	r1, [r4, #28]
    dafc:	e1a0000b 	mov	r0, fp
    db00:	e1a0e00f 	mov	lr, pc
    db04:	e12fff17 	bx	r7
    db08:	e2503000 	subs	r3, r0, #0
    db0c:	caffff91 	bgt	d958 <__sfvwrite_r+0x150>
    db10:	eaffffe9 	b	dabc <__sfvwrite_r+0x2b4>
    db14:	e1a0000b 	mov	r0, fp
    db18:	eb0003b2 	bl	e9e8 <_realloc_r>
    db1c:	e2503000 	subs	r3, r0, #0
    db20:	1affffd6 	bne	da80 <__sfvwrite_r+0x278>
    db24:	e5941010 	ldr	r1, [r4, #16]
    db28:	e1a0000b 	mov	r0, fp
    db2c:	ebfffe7d 	bl	d528 <_free_r>
    db30:	e3a0200c 	mov	r2, #12
    db34:	e1d430fc 	ldrsh	r3, [r4, #12]
    db38:	e58b2000 	str	r2, [fp]
    db3c:	e3c33080 	bic	r3, r3, #128	; 0x80
    db40:	eaffffde 	b	dac0 <__sfvwrite_r+0x2b8>
    db44:	e3a00000 	mov	r0, #0
    db48:	e12fff1e 	bx	lr
    db4c:	e1a00009 	mov	r0, r9
    db50:	e1a0a009 	mov	sl, r9
    db54:	e1a08009 	mov	r8, r9
    db58:	ea000026 	b	dbf8 <__sfvwrite_r+0x3f0>
    db5c:	e3500000 	cmp	r0, #0
    db60:	0a00002d 	beq	dc1c <__sfvwrite_r+0x414>
    db64:	e1590008 	cmp	r9, r8
    db68:	31a01009 	movcc	r1, r9
    db6c:	21a01008 	movcs	r1, r8
    db70:	e5942010 	ldr	r2, [r4, #16]
    db74:	e594c014 	ldr	ip, [r4, #20]
    db78:	e5943008 	ldr	r3, [r4, #8]
    db7c:	e5940000 	ldr	r0, [r4]
    db80:	e08c3003 	add	r3, ip, r3
    db84:	e1500002 	cmp	r0, r2
    db88:	93a02000 	movls	r2, #0
    db8c:	83a02001 	movhi	r2, #1
    db90:	e1510003 	cmp	r1, r3
    db94:	d3a02000 	movle	r2, #0
    db98:	e3520000 	cmp	r2, #0
    db9c:	e1a07001 	mov	r7, r1
    dba0:	1a000038 	bne	dc88 <__sfvwrite_r+0x480>
    dba4:	e151000c 	cmp	r1, ip
    dba8:	ba000024 	blt	dc40 <__sfvwrite_r+0x438>
    dbac:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    dbb0:	e1a0300c 	mov	r3, ip
    dbb4:	e1a0200a 	mov	r2, sl
    dbb8:	e594101c 	ldr	r1, [r4, #28]
    dbbc:	e1a0000b 	mov	r0, fp
    dbc0:	e1a0e00f 	mov	lr, pc
    dbc4:	e12fff17 	bx	r7
    dbc8:	e2507000 	subs	r7, r0, #0
    dbcc:	daffffba 	ble	dabc <__sfvwrite_r+0x2b4>
    dbd0:	e0599007 	subs	r9, r9, r7
    dbd4:	13a00001 	movne	r0, #1
    dbd8:	0a000024 	beq	dc70 <__sfvwrite_r+0x468>
    dbdc:	e5963008 	ldr	r3, [r6, #8]
    dbe0:	e0433007 	sub	r3, r3, r7
    dbe4:	e3530000 	cmp	r3, #0
    dbe8:	e08aa007 	add	sl, sl, r7
    dbec:	e0488007 	sub	r8, r8, r7
    dbf0:	e5863008 	str	r3, [r6, #8]
    dbf4:	0affff2d 	beq	d8b0 <__sfvwrite_r+0xa8>
    dbf8:	e3580000 	cmp	r8, #0
    dbfc:	1affffd6 	bne	db5c <__sfvwrite_r+0x354>
    dc00:	e2853008 	add	r3, r5, #8
    dc04:	e5138004 	ldr	r8, [r3, #-4]
    dc08:	e3580000 	cmp	r8, #0
    dc0c:	e1a05003 	mov	r5, r3
    dc10:	e513a008 	ldr	sl, [r3, #-8]
    dc14:	e2833008 	add	r3, r3, #8
    dc18:	0afffff9 	beq	dc04 <__sfvwrite_r+0x3fc>
    dc1c:	e1a02008 	mov	r2, r8
    dc20:	e3a0100a 	mov	r1, #10
    dc24:	e1a0000a 	mov	r0, sl
    dc28:	eb00031e 	bl	e8a8 <memchr>
    dc2c:	e3500000 	cmp	r0, #0
    dc30:	12800001 	addne	r0, r0, #1
    dc34:	1040900a 	subne	r9, r0, sl
    dc38:	02889001 	addeq	r9, r8, #1
    dc3c:	eaffffc8 	b	db64 <__sfvwrite_r+0x35c>
    dc40:	e1a02001 	mov	r2, r1
    dc44:	e1a0100a 	mov	r1, sl
    dc48:	ebfff576 	bl	b228 <memmove>
    dc4c:	e5942008 	ldr	r2, [r4, #8]
    dc50:	e5943000 	ldr	r3, [r4]
    dc54:	e0422007 	sub	r2, r2, r7
    dc58:	e0833007 	add	r3, r3, r7
    dc5c:	e0599007 	subs	r9, r9, r7
    dc60:	e5842008 	str	r2, [r4, #8]
    dc64:	e5843000 	str	r3, [r4]
    dc68:	13a00001 	movne	r0, #1
    dc6c:	1affffda 	bne	dbdc <__sfvwrite_r+0x3d4>
    dc70:	e1a01004 	mov	r1, r4
    dc74:	e1a0000b 	mov	r0, fp
    dc78:	ebfffc34 	bl	cd50 <_fflush_r>
    dc7c:	e3500000 	cmp	r0, #0
    dc80:	0affffd5 	beq	dbdc <__sfvwrite_r+0x3d4>
    dc84:	eaffff8c 	b	dabc <__sfvwrite_r+0x2b4>
    dc88:	e1a02003 	mov	r2, r3
    dc8c:	e1a0100a 	mov	r1, sl
    dc90:	e58d3004 	str	r3, [sp, #4]
    dc94:	ebfff563 	bl	b228 <memmove>
    dc98:	e5942000 	ldr	r2, [r4]
    dc9c:	e59d3004 	ldr	r3, [sp, #4]
    dca0:	e0822003 	add	r2, r2, r3
    dca4:	e5842000 	str	r2, [r4]
    dca8:	e1a01004 	mov	r1, r4
    dcac:	e1a0000b 	mov	r0, fp
    dcb0:	ebfffc26 	bl	cd50 <_fflush_r>
    dcb4:	e3500000 	cmp	r0, #0
    dcb8:	e59d3004 	ldr	r3, [sp, #4]
    dcbc:	1affff7e 	bne	dabc <__sfvwrite_r+0x2b4>
    dcc0:	e1a07003 	mov	r7, r3
    dcc4:	eaffffc1 	b	dbd0 <__sfvwrite_r+0x3c8>
    dcc8:	e3e00000 	mvn	r0, #0
    dccc:	eafffef8 	b	d8b4 <__sfvwrite_r+0xac>
    dcd0:	e3a0200c 	mov	r2, #12
    dcd4:	e1d430fc 	ldrsh	r3, [r4, #12]
    dcd8:	e58b2000 	str	r2, [fp]
    dcdc:	eaffff77 	b	dac0 <__sfvwrite_r+0x2b8>
    dce0:	7ffffc00 	.word	0x7ffffc00

0000dce4 <_fwalk>:
    dce4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    dce8:	e2907e2e 	adds	r7, r0, #736	; 0x2e0
    dcec:	0a000019 	beq	dd58 <_fwalk+0x74>
    dcf0:	e1a08001 	mov	r8, r1
    dcf4:	e3a06000 	mov	r6, #0
    dcf8:	e5975004 	ldr	r5, [r7, #4]
    dcfc:	e2555001 	subs	r5, r5, #1
    dd00:	e5974008 	ldr	r4, [r7, #8]
    dd04:	4a00000d 	bmi	dd40 <_fwalk+0x5c>
    dd08:	e1d430bc 	ldrh	r3, [r4, #12]
    dd0c:	e3530001 	cmp	r3, #1
    dd10:	e2455001 	sub	r5, r5, #1
    dd14:	9a000006 	bls	dd34 <_fwalk+0x50>
    dd18:	e1d430fe 	ldrsh	r3, [r4, #14]
    dd1c:	e3730001 	cmn	r3, #1
    dd20:	0a000003 	beq	dd34 <_fwalk+0x50>
    dd24:	e1a00004 	mov	r0, r4
    dd28:	e1a0e00f 	mov	lr, pc
    dd2c:	e12fff18 	bx	r8
    dd30:	e1866000 	orr	r6, r6, r0
    dd34:	e3750001 	cmn	r5, #1
    dd38:	e2844068 	add	r4, r4, #104	; 0x68
    dd3c:	1afffff1 	bne	dd08 <_fwalk+0x24>
    dd40:	e5977000 	ldr	r7, [r7]
    dd44:	e3570000 	cmp	r7, #0
    dd48:	1affffea 	bne	dcf8 <_fwalk+0x14>
    dd4c:	e1a00006 	mov	r0, r6
    dd50:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    dd54:	e12fff1e 	bx	lr
    dd58:	e1a06007 	mov	r6, r7
    dd5c:	e1a00006 	mov	r0, r6
    dd60:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    dd64:	e12fff1e 	bx	lr

0000dd68 <_fwalk_reent>:
    dd68:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    dd6c:	e2906e2e 	adds	r6, r0, #736	; 0x2e0
    dd70:	0a00001b 	beq	dde4 <_fwalk_reent+0x7c>
    dd74:	e1a08001 	mov	r8, r1
    dd78:	e1a07000 	mov	r7, r0
    dd7c:	e3a09000 	mov	r9, #0
    dd80:	e5965004 	ldr	r5, [r6, #4]
    dd84:	e2555001 	subs	r5, r5, #1
    dd88:	e5964008 	ldr	r4, [r6, #8]
    dd8c:	4a00000e 	bmi	ddcc <_fwalk_reent+0x64>
    dd90:	e1d430bc 	ldrh	r3, [r4, #12]
    dd94:	e3530001 	cmp	r3, #1
    dd98:	e2455001 	sub	r5, r5, #1
    dd9c:	9a000007 	bls	ddc0 <_fwalk_reent+0x58>
    dda0:	e1d430fe 	ldrsh	r3, [r4, #14]
    dda4:	e3730001 	cmn	r3, #1
    dda8:	0a000004 	beq	ddc0 <_fwalk_reent+0x58>
    ddac:	e1a01004 	mov	r1, r4
    ddb0:	e1a00007 	mov	r0, r7
    ddb4:	e1a0e00f 	mov	lr, pc
    ddb8:	e12fff18 	bx	r8
    ddbc:	e1899000 	orr	r9, r9, r0
    ddc0:	e3750001 	cmn	r5, #1
    ddc4:	e2844068 	add	r4, r4, #104	; 0x68
    ddc8:	1afffff0 	bne	dd90 <_fwalk_reent+0x28>
    ddcc:	e5966000 	ldr	r6, [r6]
    ddd0:	e3560000 	cmp	r6, #0
    ddd4:	1affffe9 	bne	dd80 <_fwalk_reent+0x18>
    ddd8:	e1a00009 	mov	r0, r9
    dddc:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    dde0:	e12fff1e 	bx	lr
    dde4:	e1a09006 	mov	r9, r6
    dde8:	e1a00009 	mov	r0, r9
    ddec:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    ddf0:	e12fff1e 	bx	lr

0000ddf4 <_setlocale_r>:
    ddf4:	e92d4010 	push	{r4, lr}
    ddf8:	e2524000 	subs	r4, r2, #0
    ddfc:	0a000004 	beq	de14 <_setlocale_r+0x20>
    de00:	e59f1048 	ldr	r1, [pc, #72]	; de50 <_setlocale_r+0x5c>
    de04:	e1a00004 	mov	r0, r4
    de08:	eb000523 	bl	f29c <strcmp>
    de0c:	e3500000 	cmp	r0, #0
    de10:	1a000002 	bne	de20 <_setlocale_r+0x2c>
    de14:	e59f0038 	ldr	r0, [pc, #56]	; de54 <_setlocale_r+0x60>
    de18:	e8bd4010 	pop	{r4, lr}
    de1c:	e12fff1e 	bx	lr
    de20:	e59f102c 	ldr	r1, [pc, #44]	; de54 <_setlocale_r+0x60>
    de24:	e1a00004 	mov	r0, r4
    de28:	eb00051b 	bl	f29c <strcmp>
    de2c:	e3500000 	cmp	r0, #0
    de30:	0afffff7 	beq	de14 <_setlocale_r+0x20>
    de34:	e1a00004 	mov	r0, r4
    de38:	e59f1018 	ldr	r1, [pc, #24]	; de58 <_setlocale_r+0x64>
    de3c:	eb000516 	bl	f29c <strcmp>
    de40:	e3500000 	cmp	r0, #0
    de44:	0afffff2 	beq	de14 <_setlocale_r+0x20>
    de48:	e3a00000 	mov	r0, #0
    de4c:	eafffff1 	b	de18 <_setlocale_r+0x24>
    de50:	0001023c 	.word	0x0001023c
    de54:	00010238 	.word	0x00010238
    de58:	000101b0 	.word	0x000101b0

0000de5c <__locale_mb_cur_max>:
    de5c:	e59f3018 	ldr	r3, [pc, #24]	; de7c <__locale_mb_cur_max+0x20>
    de60:	e5933000 	ldr	r3, [r3]
    de64:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    de68:	e59f2010 	ldr	r2, [pc, #16]	; de80 <__locale_mb_cur_max+0x24>
    de6c:	e3530000 	cmp	r3, #0
    de70:	01a03002 	moveq	r3, r2
    de74:	e5d30128 	ldrb	r0, [r3, #296]	; 0x128
    de78:	e12fff1e 	bx	lr
    de7c:	00010384 	.word	0x00010384
    de80:	000107b0 	.word	0x000107b0

0000de84 <__locale_ctype_ptr_l>:
    de84:	e59000ec 	ldr	r0, [r0, #236]	; 0xec
    de88:	e12fff1e 	bx	lr

0000de8c <__locale_ctype_ptr>:
    de8c:	e59f3018 	ldr	r3, [pc, #24]	; deac <__locale_ctype_ptr+0x20>
    de90:	e5933000 	ldr	r3, [r3]
    de94:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    de98:	e59f2010 	ldr	r2, [pc, #16]	; deb0 <__locale_ctype_ptr+0x24>
    de9c:	e3530000 	cmp	r3, #0
    dea0:	01a03002 	moveq	r3, r2
    dea4:	e59300ec 	ldr	r0, [r3, #236]	; 0xec
    dea8:	e12fff1e 	bx	lr
    deac:	00010384 	.word	0x00010384
    deb0:	000107b0 	.word	0x000107b0

0000deb4 <setlocale>:
    deb4:	e59f300c 	ldr	r3, [pc, #12]	; dec8 <setlocale+0x14>
    deb8:	e1a02001 	mov	r2, r1
    debc:	e1a01000 	mov	r1, r0
    dec0:	e5930000 	ldr	r0, [r3]
    dec4:	eaffffca 	b	ddf4 <_setlocale_r>
    dec8:	00010384 	.word	0x00010384

0000decc <__retarget_lock_init>:
    decc:	e12fff1e 	bx	lr

0000ded0 <__retarget_lock_init_recursive>:
    ded0:	e12fff1e 	bx	lr

0000ded4 <__retarget_lock_close>:
    ded4:	e12fff1e 	bx	lr

0000ded8 <__retarget_lock_close_recursive>:
    ded8:	e12fff1e 	bx	lr

0000dedc <__retarget_lock_acquire>:
    dedc:	e12fff1e 	bx	lr

0000dee0 <__retarget_lock_acquire_recursive>:
    dee0:	e12fff1e 	bx	lr

0000dee4 <__retarget_lock_try_acquire>:
    dee4:	e3a00001 	mov	r0, #1
    dee8:	e12fff1e 	bx	lr

0000deec <__retarget_lock_try_acquire_recursive>:
    deec:	e3a00001 	mov	r0, #1
    def0:	e12fff1e 	bx	lr

0000def4 <__retarget_lock_release>:
    def4:	e12fff1e 	bx	lr

0000def8 <__retarget_lock_release_recursive>:
    def8:	e12fff1e 	bx	lr

0000defc <__swhatbuf_r>:
    defc:	e92d4070 	push	{r4, r5, r6, lr}
    df00:	e1a04001 	mov	r4, r1
    df04:	e1d110fe 	ldrsh	r1, [r1, #14]
    df08:	e3510000 	cmp	r1, #0
    df0c:	e24dd040 	sub	sp, sp, #64	; 0x40
    df10:	e1a05002 	mov	r5, r2
    df14:	e1a06003 	mov	r6, r3
    df18:	ba00000f 	blt	df5c <__swhatbuf_r+0x60>
    df1c:	e28d2004 	add	r2, sp, #4
    df20:	eb000699 	bl	f98c <_fstat_r>
    df24:	e3500000 	cmp	r0, #0
    df28:	ba00000b 	blt	df5c <__swhatbuf_r+0x60>
    df2c:	e59d2008 	ldr	r2, [sp, #8]
    df30:	e2022a0f 	and	r2, r2, #61440	; 0xf000
    df34:	e2423a02 	sub	r3, r2, #8192	; 0x2000
    df38:	e2732000 	rsbs	r2, r3, #0
    df3c:	e0a22003 	adc	r2, r2, r3
    df40:	e3a00b02 	mov	r0, #2048	; 0x800
    df44:	e3a03b01 	mov	r3, #1024	; 0x400
    df48:	e5862000 	str	r2, [r6]
    df4c:	e5853000 	str	r3, [r5]
    df50:	e28dd040 	add	sp, sp, #64	; 0x40
    df54:	e8bd4070 	pop	{r4, r5, r6, lr}
    df58:	e12fff1e 	bx	lr
    df5c:	e3a03000 	mov	r3, #0
    df60:	e1d420bc 	ldrh	r2, [r4, #12]
    df64:	e2120080 	ands	r0, r2, #128	; 0x80
    df68:	e5863000 	str	r3, [r6]
    df6c:	0a000005 	beq	df88 <__swhatbuf_r+0x8c>
    df70:	e3a02040 	mov	r2, #64	; 0x40
    df74:	e1a00003 	mov	r0, r3
    df78:	e5852000 	str	r2, [r5]
    df7c:	e28dd040 	add	sp, sp, #64	; 0x40
    df80:	e8bd4070 	pop	{r4, r5, r6, lr}
    df84:	e12fff1e 	bx	lr
    df88:	e3a03b01 	mov	r3, #1024	; 0x400
    df8c:	e5853000 	str	r3, [r5]
    df90:	e28dd040 	add	sp, sp, #64	; 0x40
    df94:	e8bd4070 	pop	{r4, r5, r6, lr}
    df98:	e12fff1e 	bx	lr

0000df9c <__smakebuf_r>:
    df9c:	e92d4070 	push	{r4, r5, r6, lr}
    dfa0:	e1d120bc 	ldrh	r2, [r1, #12]
    dfa4:	e3120002 	tst	r2, #2
    dfa8:	e24dd008 	sub	sp, sp, #8
    dfac:	e1a04001 	mov	r4, r1
    dfb0:	0a000007 	beq	dfd4 <__smakebuf_r+0x38>
    dfb4:	e3a01001 	mov	r1, #1
    dfb8:	e2842043 	add	r2, r4, #67	; 0x43
    dfbc:	e5841014 	str	r1, [r4, #20]
    dfc0:	e5842000 	str	r2, [r4]
    dfc4:	e5842010 	str	r2, [r4, #16]
    dfc8:	e28dd008 	add	sp, sp, #8
    dfcc:	e8bd4070 	pop	{r4, r5, r6, lr}
    dfd0:	e12fff1e 	bx	lr
    dfd4:	e28d3004 	add	r3, sp, #4
    dfd8:	e1a0200d 	mov	r2, sp
    dfdc:	e1a06000 	mov	r6, r0
    dfe0:	ebffffc5 	bl	defc <__swhatbuf_r>
    dfe4:	e59d1000 	ldr	r1, [sp]
    dfe8:	e1a05000 	mov	r5, r0
    dfec:	e1a00006 	mov	r0, r6
    dff0:	eb000029 	bl	e09c <_malloc_r>
    dff4:	e3500000 	cmp	r0, #0
    dff8:	e1d430fc 	ldrsh	r3, [r4, #12]
    dffc:	0a00001a 	beq	e06c <__smakebuf_r+0xd0>
    e000:	e59dc004 	ldr	ip, [sp, #4]
    e004:	e59f108c 	ldr	r1, [pc, #140]	; e098 <__smakebuf_r+0xfc>
    e008:	e59d2000 	ldr	r2, [sp]
    e00c:	e3833080 	orr	r3, r3, #128	; 0x80
    e010:	e35c0000 	cmp	ip, #0
    e014:	e586103c 	str	r1, [r6, #60]	; 0x3c
    e018:	e1c430bc 	strh	r3, [r4, #12]
    e01c:	e5840000 	str	r0, [r4]
    e020:	e5840010 	str	r0, [r4, #16]
    e024:	e5842014 	str	r2, [r4, #20]
    e028:	1a000004 	bne	e040 <__smakebuf_r+0xa4>
    e02c:	e1833005 	orr	r3, r3, r5
    e030:	e1c430bc 	strh	r3, [r4, #12]
    e034:	e28dd008 	add	sp, sp, #8
    e038:	e8bd4070 	pop	{r4, r5, r6, lr}
    e03c:	e12fff1e 	bx	lr
    e040:	e1a00006 	mov	r0, r6
    e044:	e1d410fe 	ldrsh	r1, [r4, #14]
    e048:	eb000660 	bl	f9d0 <_isatty_r>
    e04c:	e3500000 	cmp	r0, #0
    e050:	11d430bc 	ldrhne	r3, [r4, #12]
    e054:	13c33003 	bicne	r3, r3, #3
    e058:	13833001 	orrne	r3, r3, #1
    e05c:	11a03803 	lslne	r3, r3, #16
    e060:	01d430fc 	ldrsheq	r3, [r4, #12]
    e064:	11a03843 	asrne	r3, r3, #16
    e068:	eaffffef 	b	e02c <__smakebuf_r+0x90>
    e06c:	e3130c02 	tst	r3, #512	; 0x200
    e070:	1affffd4 	bne	dfc8 <__smakebuf_r+0x2c>
    e074:	e3a01001 	mov	r1, #1
    e078:	e3c33003 	bic	r3, r3, #3
    e07c:	e2842043 	add	r2, r4, #67	; 0x43
    e080:	e3833002 	orr	r3, r3, #2
    e084:	e1c430bc 	strh	r3, [r4, #12]
    e088:	e5841014 	str	r1, [r4, #20]
    e08c:	e5842000 	str	r2, [r4]
    e090:	e5842010 	str	r2, [r4, #16]
    e094:	eaffffcb 	b	dfc8 <__smakebuf_r+0x2c>
    e098:	0000ce24 	.word	0x0000ce24

0000e09c <_malloc_r>:
    e09c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e0a0:	e281600b 	add	r6, r1, #11
    e0a4:	e3560016 	cmp	r6, #22
    e0a8:	e24dd00c 	sub	sp, sp, #12
    e0ac:	e1a05000 	mov	r5, r0
    e0b0:	9a000072 	bls	e280 <_malloc_r+0x1e4>
    e0b4:	e3c66007 	bic	r6, r6, #7
    e0b8:	e1510006 	cmp	r1, r6
    e0bc:	93a01000 	movls	r1, #0
    e0c0:	83a01001 	movhi	r1, #1
    e0c4:	e1913fa6 	orrs	r3, r1, r6, lsr #31
    e0c8:	1a000089 	bne	e2f4 <_malloc_r+0x258>
    e0cc:	eb000239 	bl	e9b8 <__malloc_lock>
    e0d0:	e3560f7e 	cmp	r6, #504	; 0x1f8
    e0d4:	3a0001c8 	bcc	e7fc <_malloc_r+0x760>
    e0d8:	e1b034a6 	lsrs	r3, r6, #9
    e0dc:	0a00008b 	beq	e310 <_malloc_r+0x274>
    e0e0:	e3530004 	cmp	r3, #4
    e0e4:	8a0000d6 	bhi	e444 <_malloc_r+0x3a8>
    e0e8:	e1a03326 	lsr	r3, r6, #6
    e0ec:	e2830039 	add	r0, r3, #57	; 0x39
    e0f0:	e283c038 	add	ip, r3, #56	; 0x38
    e0f4:	e1a01180 	lsl	r1, r0, #3
    e0f8:	e59f7708 	ldr	r7, [pc, #1800]	; e808 <_malloc_r+0x76c>
    e0fc:	e0871001 	add	r1, r7, r1
    e100:	e5914004 	ldr	r4, [r1, #4]
    e104:	e2411008 	sub	r1, r1, #8
    e108:	e1510004 	cmp	r1, r4
    e10c:	1a000005 	bne	e128 <_malloc_r+0x8c>
    e110:	ea00000a 	b	e140 <_malloc_r+0xa4>
    e114:	e3520000 	cmp	r2, #0
    e118:	aa000066 	bge	e2b8 <_malloc_r+0x21c>
    e11c:	e594400c 	ldr	r4, [r4, #12]
    e120:	e1510004 	cmp	r1, r4
    e124:	0a000005 	beq	e140 <_malloc_r+0xa4>
    e128:	e5943004 	ldr	r3, [r4, #4]
    e12c:	e3c33003 	bic	r3, r3, #3
    e130:	e0432006 	sub	r2, r3, r6
    e134:	e352000f 	cmp	r2, #15
    e138:	dafffff5 	ble	e114 <_malloc_r+0x78>
    e13c:	e1a0000c 	mov	r0, ip
    e140:	e5974010 	ldr	r4, [r7, #16]
    e144:	e59fc6c0 	ldr	ip, [pc, #1728]	; e80c <_malloc_r+0x770>
    e148:	e154000c 	cmp	r4, ip
    e14c:	05973004 	ldreq	r3, [r7, #4]
    e150:	0a000018 	beq	e1b8 <_malloc_r+0x11c>
    e154:	e5943004 	ldr	r3, [r4, #4]
    e158:	e3c33003 	bic	r3, r3, #3
    e15c:	e0432006 	sub	r2, r3, r6
    e160:	e352000f 	cmp	r2, #15
    e164:	ca0000da 	bgt	e4d4 <_malloc_r+0x438>
    e168:	e3520000 	cmp	r2, #0
    e16c:	e587c014 	str	ip, [r7, #20]
    e170:	e587c010 	str	ip, [r7, #16]
    e174:	aa000069 	bge	e320 <_malloc_r+0x284>
    e178:	e3530c02 	cmp	r3, #512	; 0x200
    e17c:	2a0000b9 	bcs	e468 <_malloc_r+0x3cc>
    e180:	e3a08001 	mov	r8, #1
    e184:	e5972004 	ldr	r2, [r7, #4]
    e188:	e1a031a3 	lsr	r3, r3, #3
    e18c:	e0831008 	add	r1, r3, r8
    e190:	e1a03143 	asr	r3, r3, #2
    e194:	e1823318 	orr	r3, r2, r8, lsl r3
    e198:	e087e181 	add	lr, r7, r1, lsl #3
    e19c:	e7978181 	ldr	r8, [r7, r1, lsl #3]
    e1a0:	e24e2008 	sub	r2, lr, #8
    e1a4:	e584200c 	str	r2, [r4, #12]
    e1a8:	e5848008 	str	r8, [r4, #8]
    e1ac:	e5873004 	str	r3, [r7, #4]
    e1b0:	e7874181 	str	r4, [r7, r1, lsl #3]
    e1b4:	e588400c 	str	r4, [r8, #12]
    e1b8:	e3a01001 	mov	r1, #1
    e1bc:	e1a02140 	asr	r2, r0, #2
    e1c0:	e1a0e211 	lsl	lr, r1, r2
    e1c4:	e15e0003 	cmp	lr, r3
    e1c8:	8a00005f 	bhi	e34c <_malloc_r+0x2b0>
    e1cc:	e11e0003 	tst	lr, r3
    e1d0:	1a000008 	bne	e1f8 <_malloc_r+0x15c>
    e1d4:	e1a0e11e 	lsl	lr, lr, r1
    e1d8:	e3c00003 	bic	r0, r0, #3
    e1dc:	e11e0003 	tst	lr, r3
    e1e0:	e2800004 	add	r0, r0, #4
    e1e4:	1a000003 	bne	e1f8 <_malloc_r+0x15c>
    e1e8:	e1a0e08e 	lsl	lr, lr, #1
    e1ec:	e11e0003 	tst	lr, r3
    e1f0:	e2800004 	add	r0, r0, #4
    e1f4:	0afffffb 	beq	e1e8 <_malloc_r+0x14c>
    e1f8:	e0879180 	add	r9, r7, r0, lsl #3
    e1fc:	e1a01009 	mov	r1, r9
    e200:	e1a04000 	mov	r4, r0
    e204:	e591800c 	ldr	r8, [r1, #12]
    e208:	e1510008 	cmp	r1, r8
    e20c:	1a000005 	bne	e228 <_malloc_r+0x18c>
    e210:	ea0000bc 	b	e508 <_malloc_r+0x46c>
    e214:	e3520000 	cmp	r2, #0
    e218:	aa0000c4 	bge	e530 <_malloc_r+0x494>
    e21c:	e598800c 	ldr	r8, [r8, #12]
    e220:	e1510008 	cmp	r1, r8
    e224:	0a0000b7 	beq	e508 <_malloc_r+0x46c>
    e228:	e5983004 	ldr	r3, [r8, #4]
    e22c:	e3c33003 	bic	r3, r3, #3
    e230:	e0432006 	sub	r2, r3, r6
    e234:	e352000f 	cmp	r2, #15
    e238:	dafffff5 	ble	e214 <_malloc_r+0x178>
    e23c:	e598100c 	ldr	r1, [r8, #12]
    e240:	e598e008 	ldr	lr, [r8, #8]
    e244:	e3864001 	orr	r4, r6, #1
    e248:	e5884004 	str	r4, [r8, #4]
    e24c:	e0886006 	add	r6, r8, r6
    e250:	e3824001 	orr	r4, r2, #1
    e254:	e58e100c 	str	r1, [lr, #12]
    e258:	e1a00005 	mov	r0, r5
    e25c:	e581e008 	str	lr, [r1, #8]
    e260:	e5876014 	str	r6, [r7, #20]
    e264:	e5876010 	str	r6, [r7, #16]
    e268:	e9861010 	stmib	r6, {r4, ip}
    e26c:	e586c00c 	str	ip, [r6, #12]
    e270:	e7882003 	str	r2, [r8, r3]
    e274:	eb0001d5 	bl	e9d0 <__malloc_unlock>
    e278:	e2884008 	add	r4, r8, #8
    e27c:	ea000018 	b	e2e4 <_malloc_r+0x248>
    e280:	e3510010 	cmp	r1, #16
    e284:	8a00001a 	bhi	e2f4 <_malloc_r+0x258>
    e288:	eb0001ca 	bl	e9b8 <__malloc_lock>
    e28c:	e3a06010 	mov	r6, #16
    e290:	e3a03018 	mov	r3, #24
    e294:	e3a00002 	mov	r0, #2
    e298:	e59f7568 	ldr	r7, [pc, #1384]	; e808 <_malloc_r+0x76c>
    e29c:	e0873003 	add	r3, r7, r3
    e2a0:	e5934004 	ldr	r4, [r3, #4]
    e2a4:	e2432008 	sub	r2, r3, #8
    e2a8:	e1540002 	cmp	r4, r2
    e2ac:	0a00009a 	beq	e51c <_malloc_r+0x480>
    e2b0:	e5943004 	ldr	r3, [r4, #4]
    e2b4:	e3c33003 	bic	r3, r3, #3
    e2b8:	e0843003 	add	r3, r4, r3
    e2bc:	e5932004 	ldr	r2, [r3, #4]
    e2c0:	e594100c 	ldr	r1, [r4, #12]
    e2c4:	e594c008 	ldr	ip, [r4, #8]
    e2c8:	e3822001 	orr	r2, r2, #1
    e2cc:	e58c100c 	str	r1, [ip, #12]
    e2d0:	e1a00005 	mov	r0, r5
    e2d4:	e581c008 	str	ip, [r1, #8]
    e2d8:	e5832004 	str	r2, [r3, #4]
    e2dc:	eb0001bb 	bl	e9d0 <__malloc_unlock>
    e2e0:	e2844008 	add	r4, r4, #8
    e2e4:	e1a00004 	mov	r0, r4
    e2e8:	e28dd00c 	add	sp, sp, #12
    e2ec:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e2f0:	e12fff1e 	bx	lr
    e2f4:	e3a04000 	mov	r4, #0
    e2f8:	e3a0300c 	mov	r3, #12
    e2fc:	e1a00004 	mov	r0, r4
    e300:	e5853000 	str	r3, [r5]
    e304:	e28dd00c 	add	sp, sp, #12
    e308:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e30c:	e12fff1e 	bx	lr
    e310:	e3a01c02 	mov	r1, #512	; 0x200
    e314:	e3a00040 	mov	r0, #64	; 0x40
    e318:	e3a0c03f 	mov	ip, #63	; 0x3f
    e31c:	eaffff75 	b	e0f8 <_malloc_r+0x5c>
    e320:	e0843003 	add	r3, r4, r3
    e324:	e5932004 	ldr	r2, [r3, #4]
    e328:	e3822001 	orr	r2, r2, #1
    e32c:	e1a00005 	mov	r0, r5
    e330:	e5832004 	str	r2, [r3, #4]
    e334:	e2844008 	add	r4, r4, #8
    e338:	eb0001a4 	bl	e9d0 <__malloc_unlock>
    e33c:	e1a00004 	mov	r0, r4
    e340:	e28dd00c 	add	sp, sp, #12
    e344:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e348:	e12fff1e 	bx	lr
    e34c:	e5974008 	ldr	r4, [r7, #8]
    e350:	e5943004 	ldr	r3, [r4, #4]
    e354:	e3c39003 	bic	r9, r3, #3
    e358:	e0493006 	sub	r3, r9, r6
    e35c:	e353000f 	cmp	r3, #15
    e360:	c3a02000 	movgt	r2, #0
    e364:	d3a02001 	movle	r2, #1
    e368:	e1590006 	cmp	r9, r6
    e36c:	33822001 	orrcc	r2, r2, #1
    e370:	e3520000 	cmp	r2, #0
    e374:	0a000025 	beq	e410 <_malloc_r+0x374>
    e378:	e59fa490 	ldr	sl, [pc, #1168]	; e810 <_malloc_r+0x774>
    e37c:	e59f2490 	ldr	r2, [pc, #1168]	; e814 <_malloc_r+0x778>
    e380:	e59a3000 	ldr	r3, [sl]
    e384:	e5922000 	ldr	r2, [r2]
    e388:	e3730001 	cmn	r3, #1
    e38c:	e0862002 	add	r2, r6, r2
    e390:	12823a01 	addne	r3, r2, #4096	; 0x1000
    e394:	1283300f 	addne	r3, r3, #15
    e398:	13c32eff 	bicne	r2, r3, #4080	; 0xff0
    e39c:	02822010 	addeq	r2, r2, #16
    e3a0:	13c2200f 	bicne	r2, r2, #15
    e3a4:	e1a01002 	mov	r1, r2
    e3a8:	e1a00005 	mov	r0, r5
    e3ac:	e58d2004 	str	r2, [sp, #4]
    e3b0:	eb0002c1 	bl	eebc <_sbrk_r>
    e3b4:	e3700001 	cmn	r0, #1
    e3b8:	e1a0b000 	mov	fp, r0
    e3bc:	e59d2004 	ldr	r2, [sp, #4]
    e3c0:	0a000003 	beq	e3d4 <_malloc_r+0x338>
    e3c4:	e0843009 	add	r3, r4, r9
    e3c8:	e1540007 	cmp	r4, r7
    e3cc:	11530000 	cmpne	r3, r0
    e3d0:	9a000084 	bls	e5e8 <_malloc_r+0x54c>
    e3d4:	e5974008 	ldr	r4, [r7, #8]
    e3d8:	e5943004 	ldr	r3, [r4, #4]
    e3dc:	e3c33003 	bic	r3, r3, #3
    e3e0:	e1560003 	cmp	r6, r3
    e3e4:	93a02000 	movls	r2, #0
    e3e8:	83a02001 	movhi	r2, #1
    e3ec:	e0433006 	sub	r3, r3, r6
    e3f0:	e353000f 	cmp	r3, #15
    e3f4:	d3822001 	orrle	r2, r2, #1
    e3f8:	e3520000 	cmp	r2, #0
    e3fc:	0a000003 	beq	e410 <_malloc_r+0x374>
    e400:	e1a00005 	mov	r0, r5
    e404:	eb000171 	bl	e9d0 <__malloc_unlock>
    e408:	e3a04000 	mov	r4, #0
    e40c:	eaffffb4 	b	e2e4 <_malloc_r+0x248>
    e410:	e3862001 	orr	r2, r6, #1
    e414:	e3833001 	orr	r3, r3, #1
    e418:	e0846006 	add	r6, r4, r6
    e41c:	e5842004 	str	r2, [r4, #4]
    e420:	e1a00005 	mov	r0, r5
    e424:	e5876008 	str	r6, [r7, #8]
    e428:	e2844008 	add	r4, r4, #8
    e42c:	e5863004 	str	r3, [r6, #4]
    e430:	eb000166 	bl	e9d0 <__malloc_unlock>
    e434:	e1a00004 	mov	r0, r4
    e438:	e28dd00c 	add	sp, sp, #12
    e43c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e440:	e12fff1e 	bx	lr
    e444:	e3530014 	cmp	r3, #20
    e448:	9a000044 	bls	e560 <_malloc_r+0x4c4>
    e44c:	e3530054 	cmp	r3, #84	; 0x54
    e450:	8a0000a8 	bhi	e6f8 <_malloc_r+0x65c>
    e454:	e1a03626 	lsr	r3, r6, #12
    e458:	e283006f 	add	r0, r3, #111	; 0x6f
    e45c:	e283c06e 	add	ip, r3, #110	; 0x6e
    e460:	e1a01180 	lsl	r1, r0, #3
    e464:	eaffff23 	b	e0f8 <_malloc_r+0x5c>
    e468:	e1a024a3 	lsr	r2, r3, #9
    e46c:	e3520004 	cmp	r2, #4
    e470:	9a00003e 	bls	e570 <_malloc_r+0x4d4>
    e474:	e3520014 	cmp	r2, #20
    e478:	8a0000b4 	bhi	e750 <_malloc_r+0x6b4>
    e47c:	e282805c 	add	r8, r2, #92	; 0x5c
    e480:	e1a08188 	lsl	r8, r8, #3
    e484:	e282105b 	add	r1, r2, #91	; 0x5b
    e488:	e087e008 	add	lr, r7, r8
    e48c:	e7972008 	ldr	r2, [r7, r8]
    e490:	e24ee008 	sub	lr, lr, #8
    e494:	e15e0002 	cmp	lr, r2
    e498:	0a00009d 	beq	e714 <_malloc_r+0x678>
    e49c:	e5921004 	ldr	r1, [r2, #4]
    e4a0:	e3c11003 	bic	r1, r1, #3
    e4a4:	e1530001 	cmp	r3, r1
    e4a8:	2a000090 	bcs	e6f0 <_malloc_r+0x654>
    e4ac:	e5922008 	ldr	r2, [r2, #8]
    e4b0:	e15e0002 	cmp	lr, r2
    e4b4:	1afffff8 	bne	e49c <_malloc_r+0x400>
    e4b8:	e59e200c 	ldr	r2, [lr, #12]
    e4bc:	e5973004 	ldr	r3, [r7, #4]
    e4c0:	e584200c 	str	r2, [r4, #12]
    e4c4:	e584e008 	str	lr, [r4, #8]
    e4c8:	e5824008 	str	r4, [r2, #8]
    e4cc:	e58e400c 	str	r4, [lr, #12]
    e4d0:	eaffff38 	b	e1b8 <_malloc_r+0x11c>
    e4d4:	e386e001 	orr	lr, r6, #1
    e4d8:	e3821001 	orr	r1, r2, #1
    e4dc:	e0846006 	add	r6, r4, r6
    e4e0:	e584e004 	str	lr, [r4, #4]
    e4e4:	e1a00005 	mov	r0, r5
    e4e8:	e5876014 	str	r6, [r7, #20]
    e4ec:	e5876010 	str	r6, [r7, #16]
    e4f0:	e586c00c 	str	ip, [r6, #12]
    e4f4:	e9861002 	stmib	r6, {r1, ip}
    e4f8:	e7842003 	str	r2, [r4, r3]
    e4fc:	eb000133 	bl	e9d0 <__malloc_unlock>
    e500:	e2844008 	add	r4, r4, #8
    e504:	eaffff76 	b	e2e4 <_malloc_r+0x248>
    e508:	e2844001 	add	r4, r4, #1
    e50c:	e3140003 	tst	r4, #3
    e510:	e2811008 	add	r1, r1, #8
    e514:	1affff3a 	bne	e204 <_malloc_r+0x168>
    e518:	ea00001d 	b	e594 <_malloc_r+0x4f8>
    e51c:	e593400c 	ldr	r4, [r3, #12]
    e520:	e1530004 	cmp	r3, r4
    e524:	02800002 	addeq	r0, r0, #2
    e528:	0affff04 	beq	e140 <_malloc_r+0xa4>
    e52c:	eaffff5f 	b	e2b0 <_malloc_r+0x214>
    e530:	e1a04008 	mov	r4, r8
    e534:	e0883003 	add	r3, r8, r3
    e538:	e5932004 	ldr	r2, [r3, #4]
    e53c:	e598100c 	ldr	r1, [r8, #12]
    e540:	e5b4c008 	ldr	ip, [r4, #8]!
    e544:	e3822001 	orr	r2, r2, #1
    e548:	e5832004 	str	r2, [r3, #4]
    e54c:	e1a00005 	mov	r0, r5
    e550:	e58c100c 	str	r1, [ip, #12]
    e554:	e581c008 	str	ip, [r1, #8]
    e558:	eb00011c 	bl	e9d0 <__malloc_unlock>
    e55c:	eaffff60 	b	e2e4 <_malloc_r+0x248>
    e560:	e283005c 	add	r0, r3, #92	; 0x5c
    e564:	e283c05b 	add	ip, r3, #91	; 0x5b
    e568:	e1a01180 	lsl	r1, r0, #3
    e56c:	eafffee1 	b	e0f8 <_malloc_r+0x5c>
    e570:	e1a02323 	lsr	r2, r3, #6
    e574:	e2828039 	add	r8, r2, #57	; 0x39
    e578:	e1a08188 	lsl	r8, r8, #3
    e57c:	e2821038 	add	r1, r2, #56	; 0x38
    e580:	eaffffc0 	b	e488 <_malloc_r+0x3ec>
    e584:	e4193008 	ldr	r3, [r9], #-8
    e588:	e1590003 	cmp	r9, r3
    e58c:	e2400001 	sub	r0, r0, #1
    e590:	1a000097 	bne	e7f4 <_malloc_r+0x758>
    e594:	e3100003 	tst	r0, #3
    e598:	1afffff9 	bne	e584 <_malloc_r+0x4e8>
    e59c:	e5973004 	ldr	r3, [r7, #4]
    e5a0:	e1c3300e 	bic	r3, r3, lr
    e5a4:	e5873004 	str	r3, [r7, #4]
    e5a8:	e1b0e08e 	lsls	lr, lr, #1
    e5ac:	13a02001 	movne	r2, #1
    e5b0:	03a02000 	moveq	r2, #0
    e5b4:	e15e0003 	cmp	lr, r3
    e5b8:	83a02000 	movhi	r2, #0
    e5bc:	92022001 	andls	r2, r2, #1
    e5c0:	e3520000 	cmp	r2, #0
    e5c4:	0affff60 	beq	e34c <_malloc_r+0x2b0>
    e5c8:	e11e0003 	tst	lr, r3
    e5cc:	e1a00004 	mov	r0, r4
    e5d0:	1affff08 	bne	e1f8 <_malloc_r+0x15c>
    e5d4:	e1a0e08e 	lsl	lr, lr, #1
    e5d8:	e11e0003 	tst	lr, r3
    e5dc:	e2800004 	add	r0, r0, #4
    e5e0:	0afffffb 	beq	e5d4 <_malloc_r+0x538>
    e5e4:	eaffff03 	b	e1f8 <_malloc_r+0x15c>
    e5e8:	e59f8228 	ldr	r8, [pc, #552]	; e818 <_malloc_r+0x77c>
    e5ec:	e5981000 	ldr	r1, [r8]
    e5f0:	e1530000 	cmp	r3, r0
    e5f4:	e0821001 	add	r1, r2, r1
    e5f8:	e5881000 	str	r1, [r8]
    e5fc:	0a00005e 	beq	e77c <_malloc_r+0x6e0>
    e600:	e59a0000 	ldr	r0, [sl]
    e604:	e3700001 	cmn	r0, #1
    e608:	104b3003 	subne	r3, fp, r3
    e60c:	10831001 	addne	r1, r3, r1
    e610:	058ab000 	streq	fp, [sl]
    e614:	15881000 	strne	r1, [r8]
    e618:	e21b1007 	ands	r1, fp, #7
    e61c:	03a01a01 	moveq	r1, #4096	; 0x1000
    e620:	12613008 	rsbne	r3, r1, #8
    e624:	108bb003 	addne	fp, fp, r3
    e628:	e08b2002 	add	r2, fp, r2
    e62c:	12611a01 	rsbne	r1, r1, #4096	; 0x1000
    e630:	e1a02a02 	lsl	r2, r2, #20
    e634:	12811008 	addne	r1, r1, #8
    e638:	e1a02a22 	lsr	r2, r2, #20
    e63c:	e041a002 	sub	sl, r1, r2
    e640:	e1a0100a 	mov	r1, sl
    e644:	e1a00005 	mov	r0, r5
    e648:	eb00021b 	bl	eebc <_sbrk_r>
    e64c:	e3700001 	cmn	r0, #1
    e650:	03a0a000 	moveq	sl, #0
    e654:	03a03001 	moveq	r3, #1
    e658:	1040300b 	subne	r3, r0, fp
    e65c:	e5981000 	ldr	r1, [r8]
    e660:	1083300a 	addne	r3, r3, sl
    e664:	13833001 	orrne	r3, r3, #1
    e668:	e08a1001 	add	r1, sl, r1
    e66c:	e1540007 	cmp	r4, r7
    e670:	e587b008 	str	fp, [r7, #8]
    e674:	e5881000 	str	r1, [r8]
    e678:	e58b3004 	str	r3, [fp, #4]
    e67c:	0a00000f 	beq	e6c0 <_malloc_r+0x624>
    e680:	e359000f 	cmp	r9, #15
    e684:	93a03001 	movls	r3, #1
    e688:	958b3004 	strls	r3, [fp, #4]
    e68c:	9affff5b 	bls	e400 <_malloc_r+0x364>
    e690:	e3a00005 	mov	r0, #5
    e694:	e5942004 	ldr	r2, [r4, #4]
    e698:	e249300c 	sub	r3, r9, #12
    e69c:	e3c33007 	bic	r3, r3, #7
    e6a0:	e2022001 	and	r2, r2, #1
    e6a4:	e1822003 	orr	r2, r2, r3
    e6a8:	e353000f 	cmp	r3, #15
    e6ac:	e0843003 	add	r3, r4, r3
    e6b0:	e5842004 	str	r2, [r4, #4]
    e6b4:	e5830004 	str	r0, [r3, #4]
    e6b8:	e5830008 	str	r0, [r3, #8]
    e6bc:	8a000037 	bhi	e7a0 <_malloc_r+0x704>
    e6c0:	e59f3154 	ldr	r3, [pc, #340]	; e81c <_malloc_r+0x780>
    e6c4:	e5932000 	ldr	r2, [r3]
    e6c8:	e1510002 	cmp	r1, r2
    e6cc:	e59f214c 	ldr	r2, [pc, #332]	; e820 <_malloc_r+0x784>
    e6d0:	85831000 	strhi	r1, [r3]
    e6d4:	e5974008 	ldr	r4, [r7, #8]
    e6d8:	e5923000 	ldr	r3, [r2]
    e6dc:	e1510003 	cmp	r1, r3
    e6e0:	e5943004 	ldr	r3, [r4, #4]
    e6e4:	85821000 	strhi	r1, [r2]
    e6e8:	e3c33003 	bic	r3, r3, #3
    e6ec:	eaffff3b 	b	e3e0 <_malloc_r+0x344>
    e6f0:	e1a0e002 	mov	lr, r2
    e6f4:	eaffff6f 	b	e4b8 <_malloc_r+0x41c>
    e6f8:	e3530f55 	cmp	r3, #340	; 0x154
    e6fc:	8a00000b 	bhi	e730 <_malloc_r+0x694>
    e700:	e1a037a6 	lsr	r3, r6, #15
    e704:	e2830078 	add	r0, r3, #120	; 0x78
    e708:	e283c077 	add	ip, r3, #119	; 0x77
    e70c:	e1a01180 	lsl	r1, r0, #3
    e710:	eafffe78 	b	e0f8 <_malloc_r+0x5c>
    e714:	e3a08001 	mov	r8, #1
    e718:	e5973004 	ldr	r3, [r7, #4]
    e71c:	e1a02141 	asr	r2, r1, #2
    e720:	e1833218 	orr	r3, r3, r8, lsl r2
    e724:	e5873004 	str	r3, [r7, #4]
    e728:	e1a0200e 	mov	r2, lr
    e72c:	eaffff63 	b	e4c0 <_malloc_r+0x424>
    e730:	e59f20ec 	ldr	r2, [pc, #236]	; e824 <_malloc_r+0x788>
    e734:	e1530002 	cmp	r3, r2
    e738:	8a00000b 	bhi	e76c <_malloc_r+0x6d0>
    e73c:	e1a03926 	lsr	r3, r6, #18
    e740:	e283007d 	add	r0, r3, #125	; 0x7d
    e744:	e283c07c 	add	ip, r3, #124	; 0x7c
    e748:	e1a01180 	lsl	r1, r0, #3
    e74c:	eafffe69 	b	e0f8 <_malloc_r+0x5c>
    e750:	e3520054 	cmp	r2, #84	; 0x54
    e754:	8a000016 	bhi	e7b4 <_malloc_r+0x718>
    e758:	e1a02623 	lsr	r2, r3, #12
    e75c:	e282806f 	add	r8, r2, #111	; 0x6f
    e760:	e1a08188 	lsl	r8, r8, #3
    e764:	e282106e 	add	r1, r2, #110	; 0x6e
    e768:	eaffff46 	b	e488 <_malloc_r+0x3ec>
    e76c:	e3a01ffe 	mov	r1, #1016	; 0x3f8
    e770:	e3a0007f 	mov	r0, #127	; 0x7f
    e774:	e3a0c07e 	mov	ip, #126	; 0x7e
    e778:	eafffe5e 	b	e0f8 <_malloc_r+0x5c>
    e77c:	e1a00a03 	lsl	r0, r3, #20
    e780:	e1a00a20 	lsr	r0, r0, #20
    e784:	e3500000 	cmp	r0, #0
    e788:	1affff9c 	bne	e600 <_malloc_r+0x564>
    e78c:	e0893002 	add	r3, r9, r2
    e790:	e5972008 	ldr	r2, [r7, #8]
    e794:	e3833001 	orr	r3, r3, #1
    e798:	e5823004 	str	r3, [r2, #4]
    e79c:	eaffffc7 	b	e6c0 <_malloc_r+0x624>
    e7a0:	e2841008 	add	r1, r4, #8
    e7a4:	e1a00005 	mov	r0, r5
    e7a8:	ebfffb5e 	bl	d528 <_free_r>
    e7ac:	e5981000 	ldr	r1, [r8]
    e7b0:	eaffffc2 	b	e6c0 <_malloc_r+0x624>
    e7b4:	e3520f55 	cmp	r2, #340	; 0x154
    e7b8:	8a000004 	bhi	e7d0 <_malloc_r+0x734>
    e7bc:	e1a027a3 	lsr	r2, r3, #15
    e7c0:	e2828078 	add	r8, r2, #120	; 0x78
    e7c4:	e1a08188 	lsl	r8, r8, #3
    e7c8:	e2821077 	add	r1, r2, #119	; 0x77
    e7cc:	eaffff2d 	b	e488 <_malloc_r+0x3ec>
    e7d0:	e59f104c 	ldr	r1, [pc, #76]	; e824 <_malloc_r+0x788>
    e7d4:	e1520001 	cmp	r2, r1
    e7d8:	91a02923 	lsrls	r2, r3, #18
    e7dc:	9282807d 	addls	r8, r2, #125	; 0x7d
    e7e0:	91a08188 	lslls	r8, r8, #3
    e7e4:	9282107c 	addls	r1, r2, #124	; 0x7c
    e7e8:	83a08ffe 	movhi	r8, #1016	; 0x3f8
    e7ec:	83a0107e 	movhi	r1, #126	; 0x7e
    e7f0:	eaffff24 	b	e488 <_malloc_r+0x3ec>
    e7f4:	e5973004 	ldr	r3, [r7, #4]
    e7f8:	eaffff6a 	b	e5a8 <_malloc_r+0x50c>
    e7fc:	e1a001a6 	lsr	r0, r6, #3
    e800:	e2863008 	add	r3, r6, #8
    e804:	eafffea3 	b	e298 <_malloc_r+0x1fc>
    e808:	0001091c 	.word	0x0001091c
    e80c:	00010924 	.word	0x00010924
    e810:	00010d24 	.word	0x00010d24
    e814:	00010d84 	.word	0x00010d84
    e818:	00010d54 	.word	0x00010d54
    e81c:	00010d7c 	.word	0x00010d7c
    e820:	00010d80 	.word	0x00010d80
    e824:	00000554 	.word	0x00000554

0000e828 <_mbtowc_r>:
    e828:	e59fc024 	ldr	ip, [pc, #36]	; e854 <_mbtowc_r+0x2c>
    e82c:	e59cc000 	ldr	ip, [ip]
    e830:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    e834:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    e838:	e59fe018 	ldr	lr, [pc, #24]	; e858 <_mbtowc_r+0x30>
    e83c:	e35c0000 	cmp	ip, #0
    e840:	01a0c00e 	moveq	ip, lr
    e844:	e59ce0e4 	ldr	lr, [ip, #228]	; 0xe4
    e848:	e1a0c00e 	mov	ip, lr
    e84c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    e850:	e12fff1c 	bx	ip
    e854:	00010384 	.word	0x00010384
    e858:	000107b0 	.word	0x000107b0

0000e85c <__ascii_mbtowc>:
    e85c:	e3510000 	cmp	r1, #0
    e860:	e24dd008 	sub	sp, sp, #8
    e864:	028d1004 	addeq	r1, sp, #4
    e868:	e3520000 	cmp	r2, #0
    e86c:	0a000008 	beq	e894 <__ascii_mbtowc+0x38>
    e870:	e3530000 	cmp	r3, #0
    e874:	0a000009 	beq	e8a0 <__ascii_mbtowc+0x44>
    e878:	e5d23000 	ldrb	r3, [r2]
    e87c:	e5813000 	str	r3, [r1]
    e880:	e5d22000 	ldrb	r2, [r2]
    e884:	e2920000 	adds	r0, r2, #0
    e888:	13a00001 	movne	r0, #1
    e88c:	e28dd008 	add	sp, sp, #8
    e890:	e12fff1e 	bx	lr
    e894:	e1a00002 	mov	r0, r2
    e898:	e28dd008 	add	sp, sp, #8
    e89c:	e12fff1e 	bx	lr
    e8a0:	e3e00001 	mvn	r0, #1
    e8a4:	eafffff8 	b	e88c <__ascii_mbtowc+0x30>

0000e8a8 <memchr>:
    e8a8:	e3100003 	tst	r0, #3
    e8ac:	e92d4070 	push	{r4, r5, r6, lr}
    e8b0:	e201e0ff 	and	lr, r1, #255	; 0xff
    e8b4:	0a000038 	beq	e99c <memchr+0xf4>
    e8b8:	e3520000 	cmp	r2, #0
    e8bc:	e242c001 	sub	ip, r2, #1
    e8c0:	0a00001e 	beq	e940 <memchr+0x98>
    e8c4:	e5d03000 	ldrb	r3, [r0]
    e8c8:	e153000e 	cmp	r3, lr
    e8cc:	0a00001c 	beq	e944 <memchr+0x9c>
    e8d0:	e2803001 	add	r3, r0, #1
    e8d4:	ea000005 	b	e8f0 <memchr+0x48>
    e8d8:	e25cc001 	subs	ip, ip, #1
    e8dc:	3a000017 	bcc	e940 <memchr+0x98>
    e8e0:	e5d02000 	ldrb	r2, [r0]
    e8e4:	e152000e 	cmp	r2, lr
    e8e8:	e2833001 	add	r3, r3, #1
    e8ec:	0a000014 	beq	e944 <memchr+0x9c>
    e8f0:	e3130003 	tst	r3, #3
    e8f4:	e1a00003 	mov	r0, r3
    e8f8:	1afffff6 	bne	e8d8 <memchr+0x30>
    e8fc:	e35c0003 	cmp	ip, #3
    e900:	8a000011 	bhi	e94c <memchr+0xa4>
    e904:	e35c0000 	cmp	ip, #0
    e908:	0a000025 	beq	e9a4 <memchr+0xfc>
    e90c:	e5d03000 	ldrb	r3, [r0]
    e910:	e153000e 	cmp	r3, lr
    e914:	0a00000a 	beq	e944 <memchr+0x9c>
    e918:	e080c00c 	add	ip, r0, ip
    e91c:	e2803001 	add	r3, r0, #1
    e920:	ea000003 	b	e934 <memchr+0x8c>
    e924:	e5d02000 	ldrb	r2, [r0]
    e928:	e152000e 	cmp	r2, lr
    e92c:	e2833001 	add	r3, r3, #1
    e930:	0a000003 	beq	e944 <memchr+0x9c>
    e934:	e15c0003 	cmp	ip, r3
    e938:	e1a00003 	mov	r0, r3
    e93c:	1afffff8 	bne	e924 <memchr+0x7c>
    e940:	e3a00000 	mov	r0, #0
    e944:	e8bd4070 	pop	{r4, r5, r6, lr}
    e948:	e12fff1e 	bx	lr
    e94c:	e59f4058 	ldr	r4, [pc, #88]	; e9ac <memchr+0x104>
    e950:	e0044401 	and	r4, r4, r1, lsl #8
    e954:	e184400e 	orr	r4, r4, lr
    e958:	e59f6050 	ldr	r6, [pc, #80]	; e9b0 <memchr+0x108>
    e95c:	e59f5050 	ldr	r5, [pc, #80]	; e9b4 <memchr+0x10c>
    e960:	e1844804 	orr	r4, r4, r4, lsl #16
    e964:	e5903000 	ldr	r3, [r0]
    e968:	e0233004 	eor	r3, r3, r4
    e96c:	e0832006 	add	r2, r3, r6
    e970:	e1c23003 	bic	r3, r2, r3
    e974:	e1130005 	tst	r3, r5
    e978:	e1a01000 	mov	r1, r0
    e97c:	e2800004 	add	r0, r0, #4
    e980:	1a000003 	bne	e994 <memchr+0xec>
    e984:	e24cc004 	sub	ip, ip, #4
    e988:	e35c0003 	cmp	ip, #3
    e98c:	8afffff4 	bhi	e964 <memchr+0xbc>
    e990:	eaffffdb 	b	e904 <memchr+0x5c>
    e994:	e1a00001 	mov	r0, r1
    e998:	eaffffdb 	b	e90c <memchr+0x64>
    e99c:	e1a0c002 	mov	ip, r2
    e9a0:	eaffffd5 	b	e8fc <memchr+0x54>
    e9a4:	e1a0000c 	mov	r0, ip
    e9a8:	eaffffe5 	b	e944 <memchr+0x9c>
    e9ac:	0000ffff 	.word	0x0000ffff
    e9b0:	fefefeff 	.word	0xfefefeff
    e9b4:	80808080 	.word	0x80808080

0000e9b8 <__malloc_lock>:
    e9b8:	e92d4010 	push	{r4, lr}
    e9bc:	e59f0008 	ldr	r0, [pc, #8]	; e9cc <__malloc_lock+0x14>
    e9c0:	ebfffd46 	bl	dee0 <__retarget_lock_acquire_recursive>
    e9c4:	e8bd4010 	pop	{r4, lr}
    e9c8:	e12fff1e 	bx	lr
    e9cc:	00010d9c 	.word	0x00010d9c

0000e9d0 <__malloc_unlock>:
    e9d0:	e92d4010 	push	{r4, lr}
    e9d4:	e59f0008 	ldr	r0, [pc, #8]	; e9e4 <__malloc_unlock+0x14>
    e9d8:	ebfffd46 	bl	def8 <__retarget_lock_release_recursive>
    e9dc:	e8bd4010 	pop	{r4, lr}
    e9e0:	e12fff1e 	bx	lr
    e9e4:	00010d9c 	.word	0x00010d9c

0000e9e8 <_realloc_r>:
    e9e8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e9ec:	e2517000 	subs	r7, r1, #0
    e9f0:	e24dd00c 	sub	sp, sp, #12
    e9f4:	e1a09002 	mov	r9, r2
    e9f8:	0a00007f 	beq	ebfc <_realloc_r+0x214>
    e9fc:	e289400b 	add	r4, r9, #11
    ea00:	e1a08000 	mov	r8, r0
    ea04:	ebffffeb 	bl	e9b8 <__malloc_lock>
    ea08:	e3540016 	cmp	r4, #22
    ea0c:	93a02010 	movls	r2, #16
    ea10:	93a03000 	movls	r3, #0
    ea14:	91a04002 	movls	r4, r2
    ea18:	83c44007 	bichi	r4, r4, #7
    ea1c:	81a03fa4 	lsrhi	r3, r4, #31
    ea20:	81a02004 	movhi	r2, r4
    ea24:	e1540009 	cmp	r4, r9
    ea28:	33833001 	orrcc	r3, r3, #1
    ea2c:	e3530000 	cmp	r3, #0
    ea30:	13a0300c 	movne	r3, #12
    ea34:	e5171004 	ldr	r1, [r7, #-4]
    ea38:	e2475008 	sub	r5, r7, #8
    ea3c:	e3c16003 	bic	r6, r1, #3
    ea40:	13a09000 	movne	r9, #0
    ea44:	15883000 	strne	r3, [r8]
    ea48:	1a00000f 	bne	ea8c <_realloc_r+0xa4>
    ea4c:	e1560002 	cmp	r6, r2
    ea50:	ba000011 	blt	ea9c <_realloc_r+0xb4>
    ea54:	e1a09007 	mov	r9, r7
    ea58:	e0463004 	sub	r3, r6, r4
    ea5c:	e353000f 	cmp	r3, #15
    ea60:	8a000056 	bhi	ebc0 <_realloc_r+0x1d8>
    ea64:	e5953004 	ldr	r3, [r5, #4]
    ea68:	e2033001 	and	r3, r3, #1
    ea6c:	e1833006 	orr	r3, r3, r6
    ea70:	e5853004 	str	r3, [r5, #4]
    ea74:	e0855006 	add	r5, r5, r6
    ea78:	e5953004 	ldr	r3, [r5, #4]
    ea7c:	e3833001 	orr	r3, r3, #1
    ea80:	e5853004 	str	r3, [r5, #4]
    ea84:	e1a00008 	mov	r0, r8
    ea88:	ebffffd0 	bl	e9d0 <__malloc_unlock>
    ea8c:	e1a00009 	mov	r0, r9
    ea90:	e28dd00c 	add	sp, sp, #12
    ea94:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ea98:	e12fff1e 	bx	lr
    ea9c:	e59fb414 	ldr	fp, [pc, #1044]	; eeb8 <_realloc_r+0x4d0>
    eaa0:	e59b3008 	ldr	r3, [fp, #8]
    eaa4:	e085c006 	add	ip, r5, r6
    eaa8:	e15c0003 	cmp	ip, r3
    eaac:	0a0000a5 	beq	ed48 <_realloc_r+0x360>
    eab0:	e59c0004 	ldr	r0, [ip, #4]
    eab4:	e3c03001 	bic	r3, r0, #1
    eab8:	e08c3003 	add	r3, ip, r3
    eabc:	e5933004 	ldr	r3, [r3, #4]
    eac0:	e3130001 	tst	r3, #1
    eac4:	0a000032 	beq	eb94 <_realloc_r+0x1ac>
    eac8:	e3110001 	tst	r1, #1
    eacc:	0a000088 	beq	ecf4 <_realloc_r+0x30c>
    ead0:	e1a01009 	mov	r1, r9
    ead4:	e1a00008 	mov	r0, r8
    ead8:	ebfffd6f 	bl	e09c <_malloc_r>
    eadc:	e2509000 	subs	r9, r0, #0
    eae0:	0affffe7 	beq	ea84 <_realloc_r+0x9c>
    eae4:	e5173004 	ldr	r3, [r7, #-4]
    eae8:	e3c33001 	bic	r3, r3, #1
    eaec:	e0853003 	add	r3, r5, r3
    eaf0:	e2492008 	sub	r2, r9, #8
    eaf4:	e1520003 	cmp	r2, r3
    eaf8:	0a0000e3 	beq	ee8c <_realloc_r+0x4a4>
    eafc:	e2462004 	sub	r2, r6, #4
    eb00:	e3520024 	cmp	r2, #36	; 0x24
    eb04:	8a0000dd 	bhi	ee80 <_realloc_r+0x498>
    eb08:	e3520013 	cmp	r2, #19
    eb0c:	91a03009 	movls	r3, r9
    eb10:	91a02007 	movls	r2, r7
    eb14:	9a000014 	bls	eb6c <_realloc_r+0x184>
    eb18:	e5973000 	ldr	r3, [r7]
    eb1c:	e5893000 	str	r3, [r9]
    eb20:	e5973004 	ldr	r3, [r7, #4]
    eb24:	e352001b 	cmp	r2, #27
    eb28:	e5893004 	str	r3, [r9, #4]
    eb2c:	92872008 	addls	r2, r7, #8
    eb30:	92893008 	addls	r3, r9, #8
    eb34:	9a00000c 	bls	eb6c <_realloc_r+0x184>
    eb38:	e5973008 	ldr	r3, [r7, #8]
    eb3c:	e5893008 	str	r3, [r9, #8]
    eb40:	e597300c 	ldr	r3, [r7, #12]
    eb44:	e589300c 	str	r3, [r9, #12]
    eb48:	e3520024 	cmp	r2, #36	; 0x24
    eb4c:	05973010 	ldreq	r3, [r7, #16]
    eb50:	05893010 	streq	r3, [r9, #16]
    eb54:	05972014 	ldreq	r2, [r7, #20]
    eb58:	12893010 	addne	r3, r9, #16
    eb5c:	05892014 	streq	r2, [r9, #20]
    eb60:	12872010 	addne	r2, r7, #16
    eb64:	02893018 	addeq	r3, r9, #24
    eb68:	02872018 	addeq	r2, r7, #24
    eb6c:	e5921000 	ldr	r1, [r2]
    eb70:	e5831000 	str	r1, [r3]
    eb74:	e5921004 	ldr	r1, [r2, #4]
    eb78:	e5831004 	str	r1, [r3, #4]
    eb7c:	e5922008 	ldr	r2, [r2, #8]
    eb80:	e5832008 	str	r2, [r3, #8]
    eb84:	e1a01007 	mov	r1, r7
    eb88:	e1a00008 	mov	r0, r8
    eb8c:	ebfffa65 	bl	d528 <_free_r>
    eb90:	eaffffbb 	b	ea84 <_realloc_r+0x9c>
    eb94:	e3c00003 	bic	r0, r0, #3
    eb98:	e0863000 	add	r3, r6, r0
    eb9c:	e1530002 	cmp	r3, r2
    eba0:	ba00001c 	blt	ec18 <_realloc_r+0x230>
    eba4:	e28c1008 	add	r1, ip, #8
    eba8:	e8910006 	ldm	r1, {r1, r2}
    ebac:	e1a09007 	mov	r9, r7
    ebb0:	e581200c 	str	r2, [r1, #12]
    ebb4:	e1a06003 	mov	r6, r3
    ebb8:	e5821008 	str	r1, [r2, #8]
    ebbc:	eaffffa5 	b	ea58 <_realloc_r+0x70>
    ebc0:	e5952004 	ldr	r2, [r5, #4]
    ebc4:	e2022001 	and	r2, r2, #1
    ebc8:	e0851004 	add	r1, r5, r4
    ebcc:	e3833001 	orr	r3, r3, #1
    ebd0:	e1822004 	orr	r2, r2, r4
    ebd4:	e5852004 	str	r2, [r5, #4]
    ebd8:	e5813004 	str	r3, [r1, #4]
    ebdc:	e0855006 	add	r5, r5, r6
    ebe0:	e5953004 	ldr	r3, [r5, #4]
    ebe4:	e3833001 	orr	r3, r3, #1
    ebe8:	e2811008 	add	r1, r1, #8
    ebec:	e5853004 	str	r3, [r5, #4]
    ebf0:	e1a00008 	mov	r0, r8
    ebf4:	ebfffa4b 	bl	d528 <_free_r>
    ebf8:	eaffffa1 	b	ea84 <_realloc_r+0x9c>
    ebfc:	e1a01002 	mov	r1, r2
    ec00:	ebfffd25 	bl	e09c <_malloc_r>
    ec04:	e1a09000 	mov	r9, r0
    ec08:	e1a00009 	mov	r0, r9
    ec0c:	e28dd00c 	add	sp, sp, #12
    ec10:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ec14:	e12fff1e 	bx	lr
    ec18:	e3110001 	tst	r1, #1
    ec1c:	1affffab 	bne	ead0 <_realloc_r+0xe8>
    ec20:	e517a008 	ldr	sl, [r7, #-8]
    ec24:	e045a00a 	sub	sl, r5, sl
    ec28:	e59a1004 	ldr	r1, [sl, #4]
    ec2c:	e3c11003 	bic	r1, r1, #3
    ec30:	e0810000 	add	r0, r1, r0
    ec34:	e0803006 	add	r3, r0, r6
    ec38:	e1530002 	cmp	r3, r2
    ec3c:	ba000030 	blt	ed04 <_realloc_r+0x31c>
    ec40:	e1a0900a 	mov	r9, sl
    ec44:	e28c1008 	add	r1, ip, #8
    ec48:	e8910006 	ldm	r1, {r1, r2}
    ec4c:	e581200c 	str	r2, [r1, #12]
    ec50:	e5821008 	str	r1, [r2, #8]
    ec54:	e59a100c 	ldr	r1, [sl, #12]
    ec58:	e5b90008 	ldr	r0, [r9, #8]!
    ec5c:	e2462004 	sub	r2, r6, #4
    ec60:	e3520024 	cmp	r2, #36	; 0x24
    ec64:	e580100c 	str	r1, [r0, #12]
    ec68:	e5810008 	str	r0, [r1, #8]
    ec6c:	8a00002f 	bhi	ed30 <_realloc_r+0x348>
    ec70:	e3520013 	cmp	r2, #19
    ec74:	91a02009 	movls	r2, r9
    ec78:	9a000014 	bls	ecd0 <_realloc_r+0x2e8>
    ec7c:	e5971000 	ldr	r1, [r7]
    ec80:	e58a1008 	str	r1, [sl, #8]
    ec84:	e5971004 	ldr	r1, [r7, #4]
    ec88:	e352001b 	cmp	r2, #27
    ec8c:	e58a100c 	str	r1, [sl, #12]
    ec90:	92877008 	addls	r7, r7, #8
    ec94:	928a2010 	addls	r2, sl, #16
    ec98:	9a00000c 	bls	ecd0 <_realloc_r+0x2e8>
    ec9c:	e5971008 	ldr	r1, [r7, #8]
    eca0:	e58a1010 	str	r1, [sl, #16]
    eca4:	e597100c 	ldr	r1, [r7, #12]
    eca8:	e58a1014 	str	r1, [sl, #20]
    ecac:	e3520024 	cmp	r2, #36	; 0x24
    ecb0:	05972010 	ldreq	r2, [r7, #16]
    ecb4:	058a2018 	streq	r2, [sl, #24]
    ecb8:	05972014 	ldreq	r2, [r7, #20]
    ecbc:	12877010 	addne	r7, r7, #16
    ecc0:	058a201c 	streq	r2, [sl, #28]
    ecc4:	128a2018 	addne	r2, sl, #24
    ecc8:	02877018 	addeq	r7, r7, #24
    eccc:	028a2020 	addeq	r2, sl, #32
    ecd0:	e5971000 	ldr	r1, [r7]
    ecd4:	e5821000 	str	r1, [r2]
    ecd8:	e5971004 	ldr	r1, [r7, #4]
    ecdc:	e5821004 	str	r1, [r2, #4]
    ece0:	e5971008 	ldr	r1, [r7, #8]
    ece4:	e1a06003 	mov	r6, r3
    ece8:	e1a0500a 	mov	r5, sl
    ecec:	e5821008 	str	r1, [r2, #8]
    ecf0:	eaffff58 	b	ea58 <_realloc_r+0x70>
    ecf4:	e517a008 	ldr	sl, [r7, #-8]
    ecf8:	e045a00a 	sub	sl, r5, sl
    ecfc:	e59a1004 	ldr	r1, [sl, #4]
    ed00:	e3c11003 	bic	r1, r1, #3
    ed04:	e0863001 	add	r3, r6, r1
    ed08:	e1530002 	cmp	r3, r2
    ed0c:	baffff6f 	blt	ead0 <_realloc_r+0xe8>
    ed10:	e1a0900a 	mov	r9, sl
    ed14:	e59a100c 	ldr	r1, [sl, #12]
    ed18:	e5b90008 	ldr	r0, [r9, #8]!
    ed1c:	e2462004 	sub	r2, r6, #4
    ed20:	e3520024 	cmp	r2, #36	; 0x24
    ed24:	e580100c 	str	r1, [r0, #12]
    ed28:	e5810008 	str	r0, [r1, #8]
    ed2c:	9affffcf 	bls	ec70 <_realloc_r+0x288>
    ed30:	e1a01007 	mov	r1, r7
    ed34:	e1a00009 	mov	r0, r9
    ed38:	e1a06003 	mov	r6, r3
    ed3c:	e1a0500a 	mov	r5, sl
    ed40:	ebfff138 	bl	b228 <memmove>
    ed44:	eaffff43 	b	ea58 <_realloc_r+0x70>
    ed48:	e59c3004 	ldr	r3, [ip, #4]
    ed4c:	e3c33003 	bic	r3, r3, #3
    ed50:	e0833006 	add	r3, r3, r6
    ed54:	e2840010 	add	r0, r4, #16
    ed58:	e1530000 	cmp	r3, r0
    ed5c:	aa00003a 	bge	ee4c <_realloc_r+0x464>
    ed60:	e3110001 	tst	r1, #1
    ed64:	1affff59 	bne	ead0 <_realloc_r+0xe8>
    ed68:	e517a008 	ldr	sl, [r7, #-8]
    ed6c:	e045a00a 	sub	sl, r5, sl
    ed70:	e59a1004 	ldr	r1, [sl, #4]
    ed74:	e3c11003 	bic	r1, r1, #3
    ed78:	e0813003 	add	r3, r1, r3
    ed7c:	e1500003 	cmp	r0, r3
    ed80:	caffffdf 	bgt	ed04 <_realloc_r+0x31c>
    ed84:	e1a0900a 	mov	r9, sl
    ed88:	e59a100c 	ldr	r1, [sl, #12]
    ed8c:	e5b90008 	ldr	r0, [r9, #8]!
    ed90:	e2462004 	sub	r2, r6, #4
    ed94:	e3520024 	cmp	r2, #36	; 0x24
    ed98:	e580100c 	str	r1, [r0, #12]
    ed9c:	e5810008 	str	r0, [r1, #8]
    eda0:	8a00003e 	bhi	eea0 <_realloc_r+0x4b8>
    eda4:	e3520013 	cmp	r2, #19
    eda8:	91a02009 	movls	r2, r9
    edac:	9a000014 	bls	ee04 <_realloc_r+0x41c>
    edb0:	e5971000 	ldr	r1, [r7]
    edb4:	e58a1008 	str	r1, [sl, #8]
    edb8:	e5971004 	ldr	r1, [r7, #4]
    edbc:	e352001b 	cmp	r2, #27
    edc0:	e58a100c 	str	r1, [sl, #12]
    edc4:	92877008 	addls	r7, r7, #8
    edc8:	928a2010 	addls	r2, sl, #16
    edcc:	9a00000c 	bls	ee04 <_realloc_r+0x41c>
    edd0:	e5971008 	ldr	r1, [r7, #8]
    edd4:	e58a1010 	str	r1, [sl, #16]
    edd8:	e597100c 	ldr	r1, [r7, #12]
    eddc:	e58a1014 	str	r1, [sl, #20]
    ede0:	e3520024 	cmp	r2, #36	; 0x24
    ede4:	05972010 	ldreq	r2, [r7, #16]
    ede8:	058a2018 	streq	r2, [sl, #24]
    edec:	05972014 	ldreq	r2, [r7, #20]
    edf0:	12877010 	addne	r7, r7, #16
    edf4:	058a201c 	streq	r2, [sl, #28]
    edf8:	128a2018 	addne	r2, sl, #24
    edfc:	02877018 	addeq	r7, r7, #24
    ee00:	028a2020 	addeq	r2, sl, #32
    ee04:	e5971000 	ldr	r1, [r7]
    ee08:	e5821000 	str	r1, [r2]
    ee0c:	e5971004 	ldr	r1, [r7, #4]
    ee10:	e5821004 	str	r1, [r2, #4]
    ee14:	e5971008 	ldr	r1, [r7, #8]
    ee18:	e5821008 	str	r1, [r2, #8]
    ee1c:	e0433004 	sub	r3, r3, r4
    ee20:	e08a2004 	add	r2, sl, r4
    ee24:	e3833001 	orr	r3, r3, #1
    ee28:	e58b2008 	str	r2, [fp, #8]
    ee2c:	e5823004 	str	r3, [r2, #4]
    ee30:	e59a3004 	ldr	r3, [sl, #4]
    ee34:	e2033001 	and	r3, r3, #1
    ee38:	e1834004 	orr	r4, r3, r4
    ee3c:	e1a00008 	mov	r0, r8
    ee40:	e58a4004 	str	r4, [sl, #4]
    ee44:	ebfffee1 	bl	e9d0 <__malloc_unlock>
    ee48:	eaffff0f 	b	ea8c <_realloc_r+0xa4>
    ee4c:	e0433004 	sub	r3, r3, r4
    ee50:	e0855004 	add	r5, r5, r4
    ee54:	e3833001 	orr	r3, r3, #1
    ee58:	e58b5008 	str	r5, [fp, #8]
    ee5c:	e5853004 	str	r3, [r5, #4]
    ee60:	e5173004 	ldr	r3, [r7, #-4]
    ee64:	e2033001 	and	r3, r3, #1
    ee68:	e1834004 	orr	r4, r3, r4
    ee6c:	e1a00008 	mov	r0, r8
    ee70:	e5074004 	str	r4, [r7, #-4]
    ee74:	ebfffed5 	bl	e9d0 <__malloc_unlock>
    ee78:	e1a09007 	mov	r9, r7
    ee7c:	eaffff02 	b	ea8c <_realloc_r+0xa4>
    ee80:	e1a01007 	mov	r1, r7
    ee84:	ebfff0e7 	bl	b228 <memmove>
    ee88:	eaffff3d 	b	eb84 <_realloc_r+0x19c>
    ee8c:	e5193004 	ldr	r3, [r9, #-4]
    ee90:	e3c33003 	bic	r3, r3, #3
    ee94:	e0866003 	add	r6, r6, r3
    ee98:	e1a09007 	mov	r9, r7
    ee9c:	eafffeed 	b	ea58 <_realloc_r+0x70>
    eea0:	e1a01007 	mov	r1, r7
    eea4:	e1a00009 	mov	r0, r9
    eea8:	e58d3004 	str	r3, [sp, #4]
    eeac:	ebfff0dd 	bl	b228 <memmove>
    eeb0:	e59d3004 	ldr	r3, [sp, #4]
    eeb4:	eaffffd8 	b	ee1c <_realloc_r+0x434>
    eeb8:	0001091c 	.word	0x0001091c

0000eebc <_sbrk_r>:
    eebc:	e3a03000 	mov	r3, #0
    eec0:	e92d4070 	push	{r4, r5, r6, lr}
    eec4:	e59f4030 	ldr	r4, [pc, #48]	; eefc <_sbrk_r+0x40>
    eec8:	e1a05000 	mov	r5, r0
    eecc:	e1a00001 	mov	r0, r1
    eed0:	e5843000 	str	r3, [r4]
    eed4:	eb0003d8 	bl	fe3c <_sbrk>
    eed8:	e3700001 	cmn	r0, #1
    eedc:	0a000001 	beq	eee8 <_sbrk_r+0x2c>
    eee0:	e8bd4070 	pop	{r4, r5, r6, lr}
    eee4:	e12fff1e 	bx	lr
    eee8:	e5943000 	ldr	r3, [r4]
    eeec:	e3530000 	cmp	r3, #0
    eef0:	15853000 	strne	r3, [r5]
    eef4:	e8bd4070 	pop	{r4, r5, r6, lr}
    eef8:	e12fff1e 	bx	lr
    eefc:	00010db0 	.word	0x00010db0

0000ef00 <_init_signal_r.part.0>:
    ef00:	e92d4010 	push	{r4, lr}
    ef04:	e3a01080 	mov	r1, #128	; 0x80
    ef08:	e1a04000 	mov	r4, r0
    ef0c:	ebfffc62 	bl	e09c <_malloc_r>
    ef10:	e3500000 	cmp	r0, #0
    ef14:	e58402dc 	str	r0, [r4, #732]	; 0x2dc
    ef18:	0a000008 	beq	ef40 <_init_signal_r.part.0+0x40>
    ef1c:	e3a02000 	mov	r2, #0
    ef20:	e2403004 	sub	r3, r0, #4
    ef24:	e280007c 	add	r0, r0, #124	; 0x7c
    ef28:	e5a32004 	str	r2, [r3, #4]!
    ef2c:	e1530000 	cmp	r3, r0
    ef30:	1afffffc 	bne	ef28 <_init_signal_r.part.0+0x28>
    ef34:	e3a00000 	mov	r0, #0
    ef38:	e8bd4010 	pop	{r4, lr}
    ef3c:	e12fff1e 	bx	lr
    ef40:	e3e00000 	mvn	r0, #0
    ef44:	eafffffb 	b	ef38 <_init_signal_r.part.0+0x38>

0000ef48 <_init_signal_r>:
    ef48:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    ef4c:	e3530000 	cmp	r3, #0
    ef50:	0a000001 	beq	ef5c <_init_signal_r+0x14>
    ef54:	e3a00000 	mov	r0, #0
    ef58:	e12fff1e 	bx	lr
    ef5c:	eaffffe7 	b	ef00 <_init_signal_r.part.0>

0000ef60 <_signal_r>:
    ef60:	e351001f 	cmp	r1, #31
    ef64:	e1a03000 	mov	r3, r0
    ef68:	8a000005 	bhi	ef84 <_signal_r+0x24>
    ef6c:	e590c2dc 	ldr	ip, [r0, #732]	; 0x2dc
    ef70:	e35c0000 	cmp	ip, #0
    ef74:	0a000006 	beq	ef94 <_signal_r+0x34>
    ef78:	e79c0101 	ldr	r0, [ip, r1, lsl #2]
    ef7c:	e78c2101 	str	r2, [ip, r1, lsl #2]
    ef80:	e12fff1e 	bx	lr
    ef84:	e3a02016 	mov	r2, #22
    ef88:	e3e00000 	mvn	r0, #0
    ef8c:	e5832000 	str	r2, [r3]
    ef90:	e12fff1e 	bx	lr
    ef94:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    ef98:	e24dd014 	sub	sp, sp, #20
    ef9c:	e98d000e 	stmib	sp, {r1, r2, r3}
    efa0:	ebffffd6 	bl	ef00 <_init_signal_r.part.0>
    efa4:	e3500000 	cmp	r0, #0
    efa8:	13e00000 	mvnne	r0, #0
    efac:	059d300c 	ldreq	r3, [sp, #12]
    efb0:	099d0006 	ldmibeq	sp, {r1, r2}
    efb4:	0593c2dc 	ldreq	ip, [r3, #732]	; 0x2dc
    efb8:	079c0101 	ldreq	r0, [ip, r1, lsl #2]
    efbc:	078c2101 	streq	r2, [ip, r1, lsl #2]
    efc0:	e28dd014 	add	sp, sp, #20
    efc4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    efc8:	e12fff1e 	bx	lr

0000efcc <_raise_r>:
    efcc:	e351001f 	cmp	r1, #31
    efd0:	e92d4020 	push	{r5, lr}
    efd4:	83a03016 	movhi	r3, #22
    efd8:	e1a05000 	mov	r5, r0
    efdc:	e24dd008 	sub	sp, sp, #8
    efe0:	83e00000 	mvnhi	r0, #0
    efe4:	85853000 	strhi	r3, [r5]
    efe8:	8a000012 	bhi	f038 <_raise_r+0x6c>
    efec:	e59522dc 	ldr	r2, [r5, #732]	; 0x2dc
    eff0:	e3520000 	cmp	r2, #0
    eff4:	0a000014 	beq	f04c <_raise_r+0x80>
    eff8:	e7923101 	ldr	r3, [r2, r1, lsl #2]
    effc:	e3530000 	cmp	r3, #0
    f000:	0a000011 	beq	f04c <_raise_r+0x80>
    f004:	e3530001 	cmp	r3, #1
    f008:	0a00000d 	beq	f044 <_raise_r+0x78>
    f00c:	e3730001 	cmn	r3, #1
    f010:	03a03016 	moveq	r3, #22
    f014:	03a00001 	moveq	r0, #1
    f018:	05853000 	streq	r3, [r5]
    f01c:	0a000005 	beq	f038 <_raise_r+0x6c>
    f020:	e3a05000 	mov	r5, #0
    f024:	e1a00001 	mov	r0, r1
    f028:	e7825101 	str	r5, [r2, r1, lsl #2]
    f02c:	e1a0e00f 	mov	lr, pc
    f030:	e12fff13 	bx	r3
    f034:	e1a00005 	mov	r0, r5
    f038:	e28dd008 	add	sp, sp, #8
    f03c:	e8bd4020 	pop	{r5, lr}
    f040:	e12fff1e 	bx	lr
    f044:	e3a00000 	mov	r0, #0
    f048:	eafffffa 	b	f038 <_raise_r+0x6c>
    f04c:	e1a00005 	mov	r0, r5
    f050:	e58d1004 	str	r1, [sp, #4]
    f054:	eb000056 	bl	f1b4 <_getpid_r>
    f058:	e59d1004 	ldr	r1, [sp, #4]
    f05c:	e1a02001 	mov	r2, r1
    f060:	e1a01000 	mov	r1, r0
    f064:	e1a00005 	mov	r0, r5
    f068:	eb000040 	bl	f170 <_kill_r>
    f06c:	eafffff1 	b	f038 <_raise_r+0x6c>

0000f070 <__sigtramp_r>:
    f070:	e351001f 	cmp	r1, #31
    f074:	8a000022 	bhi	f104 <__sigtramp_r+0x94>
    f078:	e92d4020 	push	{r5, lr}
    f07c:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    f080:	e3530000 	cmp	r3, #0
    f084:	e24dd008 	sub	sp, sp, #8
    f088:	e1a05000 	mov	r5, r0
    f08c:	0a000014 	beq	f0e4 <__sigtramp_r+0x74>
    f090:	e7932101 	ldr	r2, [r3, r1, lsl #2]
    f094:	e3520000 	cmp	r2, #0
    f098:	e0833101 	add	r3, r3, r1, lsl #2
    f09c:	0a00000e 	beq	f0dc <__sigtramp_r+0x6c>
    f0a0:	e3720001 	cmn	r2, #1
    f0a4:	03a00002 	moveq	r0, #2
    f0a8:	0a000008 	beq	f0d0 <__sigtramp_r+0x60>
    f0ac:	e3520001 	cmp	r2, #1
    f0b0:	03a00003 	moveq	r0, #3
    f0b4:	0a000005 	beq	f0d0 <__sigtramp_r+0x60>
    f0b8:	e3a05000 	mov	r5, #0
    f0bc:	e1a00001 	mov	r0, r1
    f0c0:	e5835000 	str	r5, [r3]
    f0c4:	e1a0e00f 	mov	lr, pc
    f0c8:	e12fff12 	bx	r2
    f0cc:	e1a00005 	mov	r0, r5
    f0d0:	e28dd008 	add	sp, sp, #8
    f0d4:	e8bd4020 	pop	{r5, lr}
    f0d8:	e12fff1e 	bx	lr
    f0dc:	e3a00001 	mov	r0, #1
    f0e0:	eafffffa 	b	f0d0 <__sigtramp_r+0x60>
    f0e4:	e58d1004 	str	r1, [sp, #4]
    f0e8:	ebffff84 	bl	ef00 <_init_signal_r.part.0>
    f0ec:	e3500000 	cmp	r0, #0
    f0f0:	059532dc 	ldreq	r3, [r5, #732]	; 0x2dc
    f0f4:	059d1004 	ldreq	r1, [sp, #4]
    f0f8:	0affffe4 	beq	f090 <__sigtramp_r+0x20>
    f0fc:	e3e00000 	mvn	r0, #0
    f100:	eafffff2 	b	f0d0 <__sigtramp_r+0x60>
    f104:	e3e00000 	mvn	r0, #0
    f108:	e12fff1e 	bx	lr

0000f10c <raise>:
    f10c:	e59f3008 	ldr	r3, [pc, #8]	; f11c <raise+0x10>
    f110:	e1a01000 	mov	r1, r0
    f114:	e5930000 	ldr	r0, [r3]
    f118:	eaffffab 	b	efcc <_raise_r>
    f11c:	00010384 	.word	0x00010384

0000f120 <signal>:
    f120:	e59f300c 	ldr	r3, [pc, #12]	; f134 <signal+0x14>
    f124:	e1a02001 	mov	r2, r1
    f128:	e1a01000 	mov	r1, r0
    f12c:	e5930000 	ldr	r0, [r3]
    f130:	eaffff8a 	b	ef60 <_signal_r>
    f134:	00010384 	.word	0x00010384

0000f138 <_init_signal>:
    f138:	e59f3018 	ldr	r3, [pc, #24]	; f158 <_init_signal+0x20>
    f13c:	e5930000 	ldr	r0, [r3]
    f140:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    f144:	e3530000 	cmp	r3, #0
    f148:	0a000001 	beq	f154 <_init_signal+0x1c>
    f14c:	e3a00000 	mov	r0, #0
    f150:	e12fff1e 	bx	lr
    f154:	eaffff69 	b	ef00 <_init_signal_r.part.0>
    f158:	00010384 	.word	0x00010384

0000f15c <__sigtramp>:
    f15c:	e59f3008 	ldr	r3, [pc, #8]	; f16c <__sigtramp+0x10>
    f160:	e1a01000 	mov	r1, r0
    f164:	e5930000 	ldr	r0, [r3]
    f168:	eaffffc0 	b	f070 <__sigtramp_r>
    f16c:	00010384 	.word	0x00010384

0000f170 <_kill_r>:
    f170:	e1a0c001 	mov	ip, r1
    f174:	e3a03000 	mov	r3, #0
    f178:	e92d4070 	push	{r4, r5, r6, lr}
    f17c:	e59f402c 	ldr	r4, [pc, #44]	; f1b0 <_kill_r+0x40>
    f180:	e1a05000 	mov	r5, r0
    f184:	e1a01002 	mov	r1, r2
    f188:	e1a0000c 	mov	r0, ip
    f18c:	e5843000 	str	r3, [r4]
    f190:	eb000317 	bl	fdf4 <_kill>
    f194:	e3700001 	cmn	r0, #1
    f198:	1a000002 	bne	f1a8 <_kill_r+0x38>
    f19c:	e5943000 	ldr	r3, [r4]
    f1a0:	e3530000 	cmp	r3, #0
    f1a4:	15853000 	strne	r3, [r5]
    f1a8:	e8bd4070 	pop	{r4, r5, r6, lr}
    f1ac:	e12fff1e 	bx	lr
    f1b0:	00010db0 	.word	0x00010db0

0000f1b4 <_getpid_r>:
    f1b4:	e92d4010 	push	{r4, lr}
    f1b8:	eb000301 	bl	fdc4 <_getpid>
    f1bc:	e8bd4010 	pop	{r4, lr}
    f1c0:	e12fff1e 	bx	lr

0000f1c4 <__sread>:
    f1c4:	e92d4010 	push	{r4, lr}
    f1c8:	e1a04001 	mov	r4, r1
    f1cc:	e1d110fe 	ldrsh	r1, [r1, #14]
    f1d0:	eb00021f 	bl	fa54 <_read_r>
    f1d4:	e3500000 	cmp	r0, #0
    f1d8:	a5943050 	ldrge	r3, [r4, #80]	; 0x50
    f1dc:	b1d430bc 	ldrhlt	r3, [r4, #12]
    f1e0:	a0833000 	addge	r3, r3, r0
    f1e4:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
    f1e8:	a5843050 	strge	r3, [r4, #80]	; 0x50
    f1ec:	b1c430bc 	strhlt	r3, [r4, #12]
    f1f0:	e8bd4010 	pop	{r4, lr}
    f1f4:	e12fff1e 	bx	lr

0000f1f8 <__seofread>:
    f1f8:	e3a00000 	mov	r0, #0
    f1fc:	e12fff1e 	bx	lr

0000f200 <__swrite>:
    f200:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f204:	e1a04001 	mov	r4, r1
    f208:	e1d110fc 	ldrsh	r1, [r1, #12]
    f20c:	e3110c01 	tst	r1, #256	; 0x100
    f210:	e1a06002 	mov	r6, r2
    f214:	e1a07003 	mov	r7, r3
    f218:	e1a05000 	mov	r5, r0
    f21c:	0a000004 	beq	f234 <__swrite+0x34>
    f220:	e1d410fe 	ldrsh	r1, [r4, #14]
    f224:	e3a03002 	mov	r3, #2
    f228:	e3a02000 	mov	r2, #0
    f22c:	eb0001f6 	bl	fa0c <_lseek_r>
    f230:	e1d410fc 	ldrsh	r1, [r4, #12]
    f234:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
    f238:	e1c410bc 	strh	r1, [r4, #12]
    f23c:	e1a03007 	mov	r3, r7
    f240:	e1a02006 	mov	r2, r6
    f244:	e1d410fe 	ldrsh	r1, [r4, #14]
    f248:	e1a00005 	mov	r0, r5
    f24c:	eb000150 	bl	f794 <_write_r>
    f250:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f254:	e12fff1e 	bx	lr

0000f258 <__sseek>:
    f258:	e92d4010 	push	{r4, lr}
    f25c:	e1a04001 	mov	r4, r1
    f260:	e1d110fe 	ldrsh	r1, [r1, #14]
    f264:	eb0001e8 	bl	fa0c <_lseek_r>
    f268:	e1d430bc 	ldrh	r3, [r4, #12]
    f26c:	e3700001 	cmn	r0, #1
    f270:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
    f274:	13833a01 	orrne	r3, r3, #4096	; 0x1000
    f278:	15840050 	strne	r0, [r4, #80]	; 0x50
    f27c:	e1c430bc 	strh	r3, [r4, #12]
    f280:	e8bd4010 	pop	{r4, lr}
    f284:	e12fff1e 	bx	lr

0000f288 <__sclose>:
    f288:	e92d4010 	push	{r4, lr}
    f28c:	e1d110fe 	ldrsh	r1, [r1, #14]
    f290:	eb000151 	bl	f7dc <_close_r>
    f294:	e8bd4010 	pop	{r4, lr}
    f298:	e12fff1e 	bx	lr

0000f29c <strcmp>:
    f29c:	e020c001 	eor	ip, r0, r1
    f2a0:	e31c0003 	tst	ip, #3
    f2a4:	1a000021 	bne	f330 <strcmp+0x94>
    f2a8:	e210c003 	ands	ip, r0, #3
    f2ac:	e3c00003 	bic	r0, r0, #3
    f2b0:	e3c11003 	bic	r1, r1, #3
    f2b4:	e4902004 	ldr	r2, [r0], #4
    f2b8:	04913004 	ldreq	r3, [r1], #4
    f2bc:	0a000006 	beq	f2dc <strcmp+0x40>
    f2c0:	e22cc003 	eor	ip, ip, #3
    f2c4:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    f2c8:	e1a0c18c 	lsl	ip, ip, #3
    f2cc:	e1a0cc33 	lsr	ip, r3, ip
    f2d0:	e4913004 	ldr	r3, [r1], #4
    f2d4:	e182200c 	orr	r2, r2, ip
    f2d8:	e183300c 	orr	r3, r3, ip
    f2dc:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    f2e0:	e3a04001 	mov	r4, #1
    f2e4:	e1844404 	orr	r4, r4, r4, lsl #8
    f2e8:	e1844804 	orr	r4, r4, r4, lsl #16
    f2ec:	e042c004 	sub	ip, r2, r4
    f2f0:	e1520003 	cmp	r2, r3
    f2f4:	01ccc002 	biceq	ip, ip, r2
    f2f8:	011c0384 	tsteq	ip, r4, lsl #7
    f2fc:	04902004 	ldreq	r2, [r0], #4
    f300:	04913004 	ldreq	r3, [r1], #4
    f304:	0afffff8 	beq	f2ec <strcmp+0x50>
    f308:	e1a00c02 	lsl	r0, r2, #24
    f30c:	e1a02422 	lsr	r2, r2, #8
    f310:	e3500001 	cmp	r0, #1
    f314:	21500c03 	cmpcs	r0, r3, lsl #24
    f318:	01a03423 	lsreq	r3, r3, #8
    f31c:	0afffff9 	beq	f308 <strcmp+0x6c>
    f320:	e20330ff 	and	r3, r3, #255	; 0xff
    f324:	e0630c20 	rsb	r0, r3, r0, lsr #24
    f328:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    f32c:	e12fff1e 	bx	lr
    f330:	e3100003 	tst	r0, #3
    f334:	0a000006 	beq	f354 <strcmp+0xb8>
    f338:	e4d02001 	ldrb	r2, [r0], #1
    f33c:	e4d13001 	ldrb	r3, [r1], #1
    f340:	e3520001 	cmp	r2, #1
    f344:	21520003 	cmpcs	r2, r3
    f348:	0afffff8 	beq	f330 <strcmp+0x94>
    f34c:	e0420003 	sub	r0, r2, r3
    f350:	e12fff1e 	bx	lr
    f354:	e92d0030 	push	{r4, r5}
    f358:	e3a04001 	mov	r4, #1
    f35c:	e1844404 	orr	r4, r4, r4, lsl #8
    f360:	e1844804 	orr	r4, r4, r4, lsl #16
    f364:	e4902004 	ldr	r2, [r0], #4
    f368:	e2015003 	and	r5, r1, #3
    f36c:	e3c11003 	bic	r1, r1, #3
    f370:	e4913004 	ldr	r3, [r1], #4
    f374:	e3550002 	cmp	r5, #2
    f378:	0a000017 	beq	f3dc <strcmp+0x140>
    f37c:	8a00002d 	bhi	f438 <strcmp+0x19c>
    f380:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    f384:	e1550423 	cmp	r5, r3, lsr #8
    f388:	e042c004 	sub	ip, r2, r4
    f38c:	e1ccc002 	bic	ip, ip, r2
    f390:	1a000007 	bne	f3b4 <strcmp+0x118>
    f394:	e01cc384 	ands	ip, ip, r4, lsl #7
    f398:	04913004 	ldreq	r3, [r1], #4
    f39c:	1a000006 	bne	f3bc <strcmp+0x120>
    f3a0:	e0255002 	eor	r5, r5, r2
    f3a4:	e1550c03 	cmp	r5, r3, lsl #24
    f3a8:	1a000008 	bne	f3d0 <strcmp+0x134>
    f3ac:	e4902004 	ldr	r2, [r0], #4
    f3b0:	eafffff2 	b	f380 <strcmp+0xe4>
    f3b4:	e1a03423 	lsr	r3, r3, #8
    f3b8:	ea000036 	b	f498 <strcmp+0x1fc>
    f3bc:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    f3c0:	1a000031 	bne	f48c <strcmp+0x1f0>
    f3c4:	e5d13000 	ldrb	r3, [r1]
    f3c8:	e1a05c22 	lsr	r5, r2, #24
    f3cc:	ea000031 	b	f498 <strcmp+0x1fc>
    f3d0:	e1a05c22 	lsr	r5, r2, #24
    f3d4:	e20330ff 	and	r3, r3, #255	; 0xff
    f3d8:	ea00002e 	b	f498 <strcmp+0x1fc>
    f3dc:	e1a05802 	lsl	r5, r2, #16
    f3e0:	e042c004 	sub	ip, r2, r4
    f3e4:	e1a05825 	lsr	r5, r5, #16
    f3e8:	e1ccc002 	bic	ip, ip, r2
    f3ec:	e1550823 	cmp	r5, r3, lsr #16
    f3f0:	1a00000e 	bne	f430 <strcmp+0x194>
    f3f4:	e01cc384 	ands	ip, ip, r4, lsl #7
    f3f8:	04913004 	ldreq	r3, [r1], #4
    f3fc:	1a000004 	bne	f414 <strcmp+0x178>
    f400:	e0255002 	eor	r5, r5, r2
    f404:	e1550803 	cmp	r5, r3, lsl #16
    f408:	1a000006 	bne	f428 <strcmp+0x18c>
    f40c:	e4902004 	ldr	r2, [r0], #4
    f410:	eafffff1 	b	f3dc <strcmp+0x140>
    f414:	e1b0c80c 	lsls	ip, ip, #16
    f418:	1a00001b 	bne	f48c <strcmp+0x1f0>
    f41c:	e1d130b0 	ldrh	r3, [r1]
    f420:	e1a05822 	lsr	r5, r2, #16
    f424:	ea00001b 	b	f498 <strcmp+0x1fc>
    f428:	e1a03803 	lsl	r3, r3, #16
    f42c:	e1a05822 	lsr	r5, r2, #16
    f430:	e1a03823 	lsr	r3, r3, #16
    f434:	ea000017 	b	f498 <strcmp+0x1fc>
    f438:	e20250ff 	and	r5, r2, #255	; 0xff
    f43c:	e1550c23 	cmp	r5, r3, lsr #24
    f440:	e042c004 	sub	ip, r2, r4
    f444:	e1ccc002 	bic	ip, ip, r2
    f448:	1a000007 	bne	f46c <strcmp+0x1d0>
    f44c:	e01cc384 	ands	ip, ip, r4, lsl #7
    f450:	04913004 	ldreq	r3, [r1], #4
    f454:	1a000006 	bne	f474 <strcmp+0x1d8>
    f458:	e0255002 	eor	r5, r5, r2
    f45c:	e1550403 	cmp	r5, r3, lsl #8
    f460:	1a000006 	bne	f480 <strcmp+0x1e4>
    f464:	e4902004 	ldr	r2, [r0], #4
    f468:	eafffff2 	b	f438 <strcmp+0x19c>
    f46c:	e1a03c23 	lsr	r3, r3, #24
    f470:	ea000008 	b	f498 <strcmp+0x1fc>
    f474:	e31200ff 	tst	r2, #255	; 0xff
    f478:	0a000003 	beq	f48c <strcmp+0x1f0>
    f47c:	e4913004 	ldr	r3, [r1], #4
    f480:	e1a05422 	lsr	r5, r2, #8
    f484:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    f488:	ea000002 	b	f498 <strcmp+0x1fc>
    f48c:	e3a00000 	mov	r0, #0
    f490:	e8bd0030 	pop	{r4, r5}
    f494:	e12fff1e 	bx	lr
    f498:	e20520ff 	and	r2, r5, #255	; 0xff
    f49c:	e20300ff 	and	r0, r3, #255	; 0xff
    f4a0:	e3500001 	cmp	r0, #1
    f4a4:	21500002 	cmpcs	r0, r2
    f4a8:	01a05425 	lsreq	r5, r5, #8
    f4ac:	01a03423 	lsreq	r3, r3, #8
    f4b0:	0afffff8 	beq	f498 <strcmp+0x1fc>
    f4b4:	e0420000 	sub	r0, r2, r0
    f4b8:	e8bd0030 	pop	{r4, r5}
    f4bc:	e12fff1e 	bx	lr

0000f4c0 <__swbuf_r>:
    f4c0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f4c4:	e2506000 	subs	r6, r0, #0
    f4c8:	e1a05001 	mov	r5, r1
    f4cc:	e1a04002 	mov	r4, r2
    f4d0:	0a000002 	beq	f4e0 <__swbuf_r+0x20>
    f4d4:	e5963038 	ldr	r3, [r6, #56]	; 0x38
    f4d8:	e3530000 	cmp	r3, #0
    f4dc:	0a000042 	beq	f5ec <__swbuf_r+0x12c>
    f4e0:	e1d410fc 	ldrsh	r1, [r4, #12]
    f4e4:	e5940018 	ldr	r0, [r4, #24]
    f4e8:	e1a03801 	lsl	r3, r1, #16
    f4ec:	e3130702 	tst	r3, #524288	; 0x80000
    f4f0:	e1a02823 	lsr	r2, r3, #16
    f4f4:	e5840008 	str	r0, [r4, #8]
    f4f8:	0a000022 	beq	f588 <__swbuf_r+0xc8>
    f4fc:	e5943010 	ldr	r3, [r4, #16]
    f500:	e3530000 	cmp	r3, #0
    f504:	0a00001f 	beq	f588 <__swbuf_r+0xc8>
    f508:	e3120a02 	tst	r2, #8192	; 0x2000
    f50c:	05942064 	ldreq	r2, [r4, #100]	; 0x64
    f510:	03c22a02 	biceq	r2, r2, #8192	; 0x2000
    f514:	03811a02 	orreq	r1, r1, #8192	; 0x2000
    f518:	05842064 	streq	r2, [r4, #100]	; 0x64
    f51c:	e5942000 	ldr	r2, [r4]
    f520:	01c410bc 	strheq	r1, [r4, #12]
    f524:	e5941014 	ldr	r1, [r4, #20]
    f528:	e0423003 	sub	r3, r2, r3
    f52c:	e20550ff 	and	r5, r5, #255	; 0xff
    f530:	e1530001 	cmp	r3, r1
    f534:	e1a07005 	mov	r7, r5
    f538:	b2833001 	addlt	r3, r3, #1
    f53c:	aa000022 	bge	f5cc <__swbuf_r+0x10c>
    f540:	e5941008 	ldr	r1, [r4, #8]
    f544:	e2820001 	add	r0, r2, #1
    f548:	e2411001 	sub	r1, r1, #1
    f54c:	e5841008 	str	r1, [r4, #8]
    f550:	e5840000 	str	r0, [r4]
    f554:	e5c25000 	strb	r5, [r2]
    f558:	e5942014 	ldr	r2, [r4, #20]
    f55c:	e1520003 	cmp	r2, r3
    f560:	0a000012 	beq	f5b0 <__swbuf_r+0xf0>
    f564:	e1d430bc 	ldrh	r3, [r4, #12]
    f568:	e355000a 	cmp	r5, #10
    f56c:	13a05000 	movne	r5, #0
    f570:	02035001 	andeq	r5, r3, #1
    f574:	e3550000 	cmp	r5, #0
    f578:	1a00000c 	bne	f5b0 <__swbuf_r+0xf0>
    f57c:	e1a00007 	mov	r0, r7
    f580:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f584:	e12fff1e 	bx	lr
    f588:	e1a01004 	mov	r1, r4
    f58c:	e1a00006 	mov	r0, r6
    f590:	ebfff501 	bl	c99c <__swsetup_r>
    f594:	e3500000 	cmp	r0, #0
    f598:	1a000009 	bne	f5c4 <__swbuf_r+0x104>
    f59c:	e1d410fc 	ldrsh	r1, [r4, #12]
    f5a0:	e1a02801 	lsl	r2, r1, #16
    f5a4:	e5943010 	ldr	r3, [r4, #16]
    f5a8:	e1a02822 	lsr	r2, r2, #16
    f5ac:	eaffffd5 	b	f508 <__swbuf_r+0x48>
    f5b0:	e1a01004 	mov	r1, r4
    f5b4:	e1a00006 	mov	r0, r6
    f5b8:	ebfff5e4 	bl	cd50 <_fflush_r>
    f5bc:	e3500000 	cmp	r0, #0
    f5c0:	0affffed 	beq	f57c <__swbuf_r+0xbc>
    f5c4:	e3e07000 	mvn	r7, #0
    f5c8:	eaffffeb 	b	f57c <__swbuf_r+0xbc>
    f5cc:	e1a01004 	mov	r1, r4
    f5d0:	e1a00006 	mov	r0, r6
    f5d4:	ebfff5dd 	bl	cd50 <_fflush_r>
    f5d8:	e3500000 	cmp	r0, #0
    f5dc:	1afffff8 	bne	f5c4 <__swbuf_r+0x104>
    f5e0:	e3a03001 	mov	r3, #1
    f5e4:	e5942000 	ldr	r2, [r4]
    f5e8:	eaffffd4 	b	f540 <__swbuf_r+0x80>
    f5ec:	ebfff66c 	bl	cfa4 <__sinit>
    f5f0:	eaffffba 	b	f4e0 <__swbuf_r+0x20>

0000f5f4 <__swbuf>:
    f5f4:	e59f300c 	ldr	r3, [pc, #12]	; f608 <__swbuf+0x14>
    f5f8:	e1a02001 	mov	r2, r1
    f5fc:	e1a01000 	mov	r1, r0
    f600:	e5930000 	ldr	r0, [r3]
    f604:	eaffffad 	b	f4c0 <__swbuf_r>
    f608:	00010384 	.word	0x00010384

0000f60c <_wcrtomb_r>:
    f60c:	e92d4070 	push	{r4, r5, r6, lr}
    f610:	e251c000 	subs	ip, r1, #0
    f614:	e24dd010 	sub	sp, sp, #16
    f618:	e1a05000 	mov	r5, r0
    f61c:	e1a06003 	mov	r6, r3
    f620:	0a000010 	beq	f668 <_wcrtomb_r+0x5c>
    f624:	e59fc06c 	ldr	ip, [pc, #108]	; f698 <_wcrtomb_r+0x8c>
    f628:	e59cc000 	ldr	ip, [ip]
    f62c:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    f630:	e59fe064 	ldr	lr, [pc, #100]	; f69c <_wcrtomb_r+0x90>
    f634:	e35c0000 	cmp	ip, #0
    f638:	01a0c00e 	moveq	ip, lr
    f63c:	e59c40e0 	ldr	r4, [ip, #224]	; 0xe0
    f640:	e1a0e00f 	mov	lr, pc
    f644:	e12fff14 	bx	r4
    f648:	e3700001 	cmn	r0, #1
    f64c:	03a02000 	moveq	r2, #0
    f650:	03a0308a 	moveq	r3, #138	; 0x8a
    f654:	05862000 	streq	r2, [r6]
    f658:	05853000 	streq	r3, [r5]
    f65c:	e28dd010 	add	sp, sp, #16
    f660:	e8bd4070 	pop	{r4, r5, r6, lr}
    f664:	e12fff1e 	bx	lr
    f668:	e59f2028 	ldr	r2, [pc, #40]	; f698 <_wcrtomb_r+0x8c>
    f66c:	e5921000 	ldr	r1, [r2]
    f670:	e5911034 	ldr	r1, [r1, #52]	; 0x34
    f674:	e59f2020 	ldr	r2, [pc, #32]	; f69c <_wcrtomb_r+0x90>
    f678:	e3510000 	cmp	r1, #0
    f67c:	01a01002 	moveq	r1, r2
    f680:	e1a0200c 	mov	r2, ip
    f684:	e59140e0 	ldr	r4, [r1, #224]	; 0xe0
    f688:	e28d1004 	add	r1, sp, #4
    f68c:	e1a0e00f 	mov	lr, pc
    f690:	e12fff14 	bx	r4
    f694:	eaffffeb 	b	f648 <_wcrtomb_r+0x3c>
    f698:	00010384 	.word	0x00010384
    f69c:	000107b0 	.word	0x000107b0

0000f6a0 <wcrtomb>:
    f6a0:	e92d4070 	push	{r4, r5, r6, lr}
    f6a4:	e59f3084 	ldr	r3, [pc, #132]	; f730 <wcrtomb+0x90>
    f6a8:	e5934000 	ldr	r4, [r3]
    f6ac:	e3500000 	cmp	r0, #0
    f6b0:	e1a05002 	mov	r5, r2
    f6b4:	e24dd010 	sub	sp, sp, #16
    f6b8:	e5943034 	ldr	r3, [r4, #52]	; 0x34
    f6bc:	e59f2070 	ldr	r2, [pc, #112]	; f734 <wcrtomb+0x94>
    f6c0:	0a000010 	beq	f708 <wcrtomb+0x68>
    f6c4:	e3530000 	cmp	r3, #0
    f6c8:	01a03002 	moveq	r3, r2
    f6cc:	e1a02001 	mov	r2, r1
    f6d0:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
    f6d4:	e1a01000 	mov	r1, r0
    f6d8:	e1a03005 	mov	r3, r5
    f6dc:	e1a00004 	mov	r0, r4
    f6e0:	e1a0e00f 	mov	lr, pc
    f6e4:	e12fff16 	bx	r6
    f6e8:	e3700001 	cmn	r0, #1
    f6ec:	03a02000 	moveq	r2, #0
    f6f0:	03a0308a 	moveq	r3, #138	; 0x8a
    f6f4:	05852000 	streq	r2, [r5]
    f6f8:	05843000 	streq	r3, [r4]
    f6fc:	e28dd010 	add	sp, sp, #16
    f700:	e8bd4070 	pop	{r4, r5, r6, lr}
    f704:	e12fff1e 	bx	lr
    f708:	e3530000 	cmp	r3, #0
    f70c:	01a03002 	moveq	r3, r2
    f710:	e28d1004 	add	r1, sp, #4
    f714:	e1a02000 	mov	r2, r0
    f718:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
    f71c:	e1a00004 	mov	r0, r4
    f720:	e1a03005 	mov	r3, r5
    f724:	e1a0e00f 	mov	lr, pc
    f728:	e12fff16 	bx	r6
    f72c:	eaffffed 	b	f6e8 <wcrtomb+0x48>
    f730:	00010384 	.word	0x00010384
    f734:	000107b0 	.word	0x000107b0

0000f738 <_wctomb_r>:
    f738:	e59fc024 	ldr	ip, [pc, #36]	; f764 <_wctomb_r+0x2c>
    f73c:	e59cc000 	ldr	ip, [ip]
    f740:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    f744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    f748:	e59fe018 	ldr	lr, [pc, #24]	; f768 <_wctomb_r+0x30>
    f74c:	e35c0000 	cmp	ip, #0
    f750:	01a0c00e 	moveq	ip, lr
    f754:	e59ce0e0 	ldr	lr, [ip, #224]	; 0xe0
    f758:	e1a0c00e 	mov	ip, lr
    f75c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    f760:	e12fff1c 	bx	ip
    f764:	00010384 	.word	0x00010384
    f768:	000107b0 	.word	0x000107b0

0000f76c <__ascii_wctomb>:
    f76c:	e3510000 	cmp	r1, #0
    f770:	0a000005 	beq	f78c <__ascii_wctomb+0x20>
    f774:	e35200ff 	cmp	r2, #255	; 0xff
    f778:	83a0308a 	movhi	r3, #138	; 0x8a
    f77c:	95c12000 	strbls	r2, [r1]
    f780:	83e01000 	mvnhi	r1, #0
    f784:	93a01001 	movls	r1, #1
    f788:	85803000 	strhi	r3, [r0]
    f78c:	e1a00001 	mov	r0, r1
    f790:	e12fff1e 	bx	lr

0000f794 <_write_r>:
    f794:	e92d4070 	push	{r4, r5, r6, lr}
    f798:	e1a0e001 	mov	lr, r1
    f79c:	e3a0c000 	mov	ip, #0
    f7a0:	e59f4030 	ldr	r4, [pc, #48]	; f7d8 <_write_r+0x44>
    f7a4:	e1a01002 	mov	r1, r2
    f7a8:	e1a05000 	mov	r5, r0
    f7ac:	e1a02003 	mov	r2, r3
    f7b0:	e1a0000e 	mov	r0, lr
    f7b4:	e584c000 	str	ip, [r4]
    f7b8:	eb0001aa 	bl	fe68 <_write>
    f7bc:	e3700001 	cmn	r0, #1
    f7c0:	1a000002 	bne	f7d0 <_write_r+0x3c>
    f7c4:	e5943000 	ldr	r3, [r4]
    f7c8:	e3530000 	cmp	r3, #0
    f7cc:	15853000 	strne	r3, [r5]
    f7d0:	e8bd4070 	pop	{r4, r5, r6, lr}
    f7d4:	e12fff1e 	bx	lr
    f7d8:	00010db0 	.word	0x00010db0

0000f7dc <_close_r>:
    f7dc:	e3a03000 	mov	r3, #0
    f7e0:	e92d4070 	push	{r4, r5, r6, lr}
    f7e4:	e59f4028 	ldr	r4, [pc, #40]	; f814 <_close_r+0x38>
    f7e8:	e1a05000 	mov	r5, r0
    f7ec:	e1a00001 	mov	r0, r1
    f7f0:	e5843000 	str	r3, [r4]
    f7f4:	eb000166 	bl	fd94 <_close>
    f7f8:	e3700001 	cmn	r0, #1
    f7fc:	1a000002 	bne	f80c <_close_r+0x30>
    f800:	e5943000 	ldr	r3, [r4]
    f804:	e3530000 	cmp	r3, #0
    f808:	15853000 	strne	r3, [r5]
    f80c:	e8bd4070 	pop	{r4, r5, r6, lr}
    f810:	e12fff1e 	bx	lr
    f814:	00010db0 	.word	0x00010db0

0000f818 <_fclose_r>:
    f818:	e92d4070 	push	{r4, r5, r6, lr}
    f81c:	e2514000 	subs	r4, r1, #0
    f820:	0a00000b 	beq	f854 <_fclose_r+0x3c>
    f824:	e3500000 	cmp	r0, #0
    f828:	e1a06000 	mov	r6, r0
    f82c:	0a000002 	beq	f83c <_fclose_r+0x24>
    f830:	e5903038 	ldr	r3, [r0, #56]	; 0x38
    f834:	e3530000 	cmp	r3, #0
    f838:	0a000038 	beq	f920 <_fclose_r+0x108>
    f83c:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    f840:	e3130001 	tst	r3, #1
    f844:	0a000006 	beq	f864 <_fclose_r+0x4c>
    f848:	e1d430fc 	ldrsh	r3, [r4, #12]
    f84c:	e3530000 	cmp	r3, #0
    f850:	1a000006 	bne	f870 <_fclose_r+0x58>
    f854:	e3a05000 	mov	r5, #0
    f858:	e1a00005 	mov	r0, r5
    f85c:	e8bd4070 	pop	{r4, r5, r6, lr}
    f860:	e12fff1e 	bx	lr
    f864:	e1d430bc 	ldrh	r3, [r4, #12]
    f868:	e3130c02 	tst	r3, #512	; 0x200
    f86c:	0a000034 	beq	f944 <_fclose_r+0x12c>
    f870:	e1a01004 	mov	r1, r4
    f874:	e1a00006 	mov	r0, r6
    f878:	ebfff4a5 	bl	cb14 <__sflush_r>
    f87c:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
    f880:	e3530000 	cmp	r3, #0
    f884:	e1a05000 	mov	r5, r0
    f888:	0a000005 	beq	f8a4 <_fclose_r+0x8c>
    f88c:	e594101c 	ldr	r1, [r4, #28]
    f890:	e1a00006 	mov	r0, r6
    f894:	e1a0e00f 	mov	lr, pc
    f898:	e12fff13 	bx	r3
    f89c:	e3500000 	cmp	r0, #0
    f8a0:	b3e05000 	mvnlt	r5, #0
    f8a4:	e1d430bc 	ldrh	r3, [r4, #12]
    f8a8:	e3130080 	tst	r3, #128	; 0x80
    f8ac:	1a00001d 	bne	f928 <_fclose_r+0x110>
    f8b0:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    f8b4:	e3510000 	cmp	r1, #0
    f8b8:	0a000005 	beq	f8d4 <_fclose_r+0xbc>
    f8bc:	e2843040 	add	r3, r4, #64	; 0x40
    f8c0:	e1510003 	cmp	r1, r3
    f8c4:	11a00006 	movne	r0, r6
    f8c8:	1bfff716 	blne	d528 <_free_r>
    f8cc:	e3a03000 	mov	r3, #0
    f8d0:	e5843030 	str	r3, [r4, #48]	; 0x30
    f8d4:	e5941044 	ldr	r1, [r4, #68]	; 0x44
    f8d8:	e3510000 	cmp	r1, #0
    f8dc:	0a000003 	beq	f8f0 <_fclose_r+0xd8>
    f8e0:	e1a00006 	mov	r0, r6
    f8e4:	ebfff70f 	bl	d528 <_free_r>
    f8e8:	e3a03000 	mov	r3, #0
    f8ec:	e5843044 	str	r3, [r4, #68]	; 0x44
    f8f0:	ebfff618 	bl	d158 <__sfp_lock_acquire>
    f8f4:	e3a03000 	mov	r3, #0
    f8f8:	e5942064 	ldr	r2, [r4, #100]	; 0x64
    f8fc:	e3120001 	tst	r2, #1
    f900:	e1c430bc 	strh	r3, [r4, #12]
    f904:	0a00000b 	beq	f938 <_fclose_r+0x120>
    f908:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    f90c:	ebfff971 	bl	ded8 <__retarget_lock_close_recursive>
    f910:	ebfff616 	bl	d170 <__sfp_lock_release>
    f914:	e1a00005 	mov	r0, r5
    f918:	e8bd4070 	pop	{r4, r5, r6, lr}
    f91c:	e12fff1e 	bx	lr
    f920:	ebfff59f 	bl	cfa4 <__sinit>
    f924:	eaffffc4 	b	f83c <_fclose_r+0x24>
    f928:	e5941010 	ldr	r1, [r4, #16]
    f92c:	e1a00006 	mov	r0, r6
    f930:	ebfff6fc 	bl	d528 <_free_r>
    f934:	eaffffdd 	b	f8b0 <_fclose_r+0x98>
    f938:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    f93c:	ebfff96d 	bl	def8 <__retarget_lock_release_recursive>
    f940:	eafffff0 	b	f908 <_fclose_r+0xf0>
    f944:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    f948:	ebfff964 	bl	dee0 <__retarget_lock_acquire_recursive>
    f94c:	e1d430fc 	ldrsh	r3, [r4, #12]
    f950:	e3530000 	cmp	r3, #0
    f954:	1affffc5 	bne	f870 <_fclose_r+0x58>
    f958:	e5945064 	ldr	r5, [r4, #100]	; 0x64
    f95c:	e2155001 	ands	r5, r5, #1
    f960:	1affffbb 	bne	f854 <_fclose_r+0x3c>
    f964:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    f968:	ebfff962 	bl	def8 <__retarget_lock_release_recursive>
    f96c:	e1a00005 	mov	r0, r5
    f970:	e8bd4070 	pop	{r4, r5, r6, lr}
    f974:	e12fff1e 	bx	lr

0000f978 <fclose>:
    f978:	e59f3008 	ldr	r3, [pc, #8]	; f988 <fclose+0x10>
    f97c:	e1a01000 	mov	r1, r0
    f980:	e5930000 	ldr	r0, [r3]
    f984:	eaffffa3 	b	f818 <_fclose_r>
    f988:	00010384 	.word	0x00010384

0000f98c <_fstat_r>:
    f98c:	e1a0c001 	mov	ip, r1
    f990:	e3a03000 	mov	r3, #0
    f994:	e92d4070 	push	{r4, r5, r6, lr}
    f998:	e59f402c 	ldr	r4, [pc, #44]	; f9cc <_fstat_r+0x40>
    f99c:	e1a05000 	mov	r5, r0
    f9a0:	e1a01002 	mov	r1, r2
    f9a4:	e1a0000c 	mov	r0, ip
    f9a8:	e5843000 	str	r3, [r4]
    f9ac:	eb0000fe 	bl	fdac <_fstat>
    f9b0:	e3700001 	cmn	r0, #1
    f9b4:	1a000002 	bne	f9c4 <_fstat_r+0x38>
    f9b8:	e5943000 	ldr	r3, [r4]
    f9bc:	e3530000 	cmp	r3, #0
    f9c0:	15853000 	strne	r3, [r5]
    f9c4:	e8bd4070 	pop	{r4, r5, r6, lr}
    f9c8:	e12fff1e 	bx	lr
    f9cc:	00010db0 	.word	0x00010db0

0000f9d0 <_isatty_r>:
    f9d0:	e3a03000 	mov	r3, #0
    f9d4:	e92d4070 	push	{r4, r5, r6, lr}
    f9d8:	e59f4028 	ldr	r4, [pc, #40]	; fa08 <_isatty_r+0x38>
    f9dc:	e1a05000 	mov	r5, r0
    f9e0:	e1a00001 	mov	r0, r1
    f9e4:	e5843000 	str	r3, [r4]
    f9e8:	eb0000fb 	bl	fddc <_isatty>
    f9ec:	e3700001 	cmn	r0, #1
    f9f0:	1a000002 	bne	fa00 <_isatty_r+0x30>
    f9f4:	e5943000 	ldr	r3, [r4]
    f9f8:	e3530000 	cmp	r3, #0
    f9fc:	15853000 	strne	r3, [r5]
    fa00:	e8bd4070 	pop	{r4, r5, r6, lr}
    fa04:	e12fff1e 	bx	lr
    fa08:	00010db0 	.word	0x00010db0

0000fa0c <_lseek_r>:
    fa0c:	e92d4070 	push	{r4, r5, r6, lr}
    fa10:	e1a0e001 	mov	lr, r1
    fa14:	e3a0c000 	mov	ip, #0
    fa18:	e59f4030 	ldr	r4, [pc, #48]	; fa50 <_lseek_r+0x44>
    fa1c:	e1a01002 	mov	r1, r2
    fa20:	e1a05000 	mov	r5, r0
    fa24:	e1a02003 	mov	r2, r3
    fa28:	e1a0000e 	mov	r0, lr
    fa2c:	e584c000 	str	ip, [r4]
    fa30:	eb0000f5 	bl	fe0c <_lseek>
    fa34:	e3700001 	cmn	r0, #1
    fa38:	1a000002 	bne	fa48 <_lseek_r+0x3c>
    fa3c:	e5943000 	ldr	r3, [r4]
    fa40:	e3530000 	cmp	r3, #0
    fa44:	15853000 	strne	r3, [r5]
    fa48:	e8bd4070 	pop	{r4, r5, r6, lr}
    fa4c:	e12fff1e 	bx	lr
    fa50:	00010db0 	.word	0x00010db0

0000fa54 <_read_r>:
    fa54:	e92d4070 	push	{r4, r5, r6, lr}
    fa58:	e1a0e001 	mov	lr, r1
    fa5c:	e3a0c000 	mov	ip, #0
    fa60:	e59f4030 	ldr	r4, [pc, #48]	; fa98 <_read_r+0x44>
    fa64:	e1a01002 	mov	r1, r2
    fa68:	e1a05000 	mov	r5, r0
    fa6c:	e1a02003 	mov	r2, r3
    fa70:	e1a0000e 	mov	r0, lr
    fa74:	e584c000 	str	ip, [r4]
    fa78:	eb0000e9 	bl	fe24 <_read>
    fa7c:	e3700001 	cmn	r0, #1
    fa80:	1a000002 	bne	fa90 <_read_r+0x3c>
    fa84:	e5943000 	ldr	r3, [r4]
    fa88:	e3530000 	cmp	r3, #0
    fa8c:	15853000 	strne	r3, [r5]
    fa90:	e8bd4070 	pop	{r4, r5, r6, lr}
    fa94:	e12fff1e 	bx	lr
    fa98:	00010db0 	.word	0x00010db0

0000fa9c <cleanup_glue>:
    fa9c:	e92d4070 	push	{r4, r5, r6, lr}
    faa0:	e1a04001 	mov	r4, r1
    faa4:	e5911000 	ldr	r1, [r1]
    faa8:	e3510000 	cmp	r1, #0
    faac:	e1a05000 	mov	r5, r0
    fab0:	1bfffff9 	blne	fa9c <cleanup_glue>
    fab4:	e1a01004 	mov	r1, r4
    fab8:	e1a00005 	mov	r0, r5
    fabc:	ebfff699 	bl	d528 <_free_r>
    fac0:	e8bd4070 	pop	{r4, r5, r6, lr}
    fac4:	e12fff1e 	bx	lr

0000fac8 <_reclaim_reent>:
    fac8:	e59f30e8 	ldr	r3, [pc, #232]	; fbb8 <_reclaim_reent+0xf0>
    facc:	e5933000 	ldr	r3, [r3]
    fad0:	e1530000 	cmp	r3, r0
    fad4:	012fff1e 	bxeq	lr
    fad8:	e590304c 	ldr	r3, [r0, #76]	; 0x4c
    fadc:	e3530000 	cmp	r3, #0
    fae0:	e92d4070 	push	{r4, r5, r6, lr}
    fae4:	e1a05000 	mov	r5, r0
    fae8:	0a00000f 	beq	fb2c <_reclaim_reent+0x64>
    faec:	e3a06000 	mov	r6, #0
    faf0:	e7931006 	ldr	r1, [r3, r6]
    faf4:	e3510000 	cmp	r1, #0
    faf8:	0a000005 	beq	fb14 <_reclaim_reent+0x4c>
    fafc:	e5914000 	ldr	r4, [r1]
    fb00:	e1a00005 	mov	r0, r5
    fb04:	ebfff687 	bl	d528 <_free_r>
    fb08:	e2541000 	subs	r1, r4, #0
    fb0c:	1afffffa 	bne	fafc <_reclaim_reent+0x34>
    fb10:	e595304c 	ldr	r3, [r5, #76]	; 0x4c
    fb14:	e2866004 	add	r6, r6, #4
    fb18:	e3560080 	cmp	r6, #128	; 0x80
    fb1c:	1afffff3 	bne	faf0 <_reclaim_reent+0x28>
    fb20:	e1a01003 	mov	r1, r3
    fb24:	e1a00005 	mov	r0, r5
    fb28:	ebfff67e 	bl	d528 <_free_r>
    fb2c:	e5951040 	ldr	r1, [r5, #64]	; 0x40
    fb30:	e3510000 	cmp	r1, #0
    fb34:	11a00005 	movne	r0, r5
    fb38:	1bfff67a 	blne	d528 <_free_r>
    fb3c:	e5951148 	ldr	r1, [r5, #328]	; 0x148
    fb40:	e3510000 	cmp	r1, #0
    fb44:	0a000008 	beq	fb6c <_reclaim_reent+0xa4>
    fb48:	e2856f53 	add	r6, r5, #332	; 0x14c
    fb4c:	e1510006 	cmp	r1, r6
    fb50:	0a000005 	beq	fb6c <_reclaim_reent+0xa4>
    fb54:	e5914000 	ldr	r4, [r1]
    fb58:	e1a00005 	mov	r0, r5
    fb5c:	ebfff671 	bl	d528 <_free_r>
    fb60:	e1560004 	cmp	r6, r4
    fb64:	e1a01004 	mov	r1, r4
    fb68:	1afffff9 	bne	fb54 <_reclaim_reent+0x8c>
    fb6c:	e5951054 	ldr	r1, [r5, #84]	; 0x54
    fb70:	e3510000 	cmp	r1, #0
    fb74:	11a00005 	movne	r0, r5
    fb78:	1bfff66a 	blne	d528 <_free_r>
    fb7c:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    fb80:	e3530000 	cmp	r3, #0
    fb84:	1a000001 	bne	fb90 <_reclaim_reent+0xc8>
    fb88:	e8bd4070 	pop	{r4, r5, r6, lr}
    fb8c:	e12fff1e 	bx	lr
    fb90:	e595303c 	ldr	r3, [r5, #60]	; 0x3c
    fb94:	e1a00005 	mov	r0, r5
    fb98:	e1a0e00f 	mov	lr, pc
    fb9c:	e12fff13 	bx	r3
    fba0:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
    fba4:	e3510000 	cmp	r1, #0
    fba8:	0afffff6 	beq	fb88 <_reclaim_reent+0xc0>
    fbac:	e1a00005 	mov	r0, r5
    fbb0:	e8bd4070 	pop	{r4, r5, r6, lr}
    fbb4:	eaffffb8 	b	fa9c <cleanup_glue>
    fbb8:	00010384 	.word	0x00010384

0000fbbc <__aeabi_uldivmod>:
    fbbc:	e3530000 	cmp	r3, #0
    fbc0:	03520000 	cmpeq	r2, #0
    fbc4:	1a000004 	bne	fbdc <__aeabi_uldivmod+0x20>
    fbc8:	e3510000 	cmp	r1, #0
    fbcc:	03500000 	cmpeq	r0, #0
    fbd0:	13e01000 	mvnne	r1, #0
    fbd4:	13e00000 	mvnne	r0, #0
    fbd8:	eaffecf8 	b	afc0 <__aeabi_idiv0>
    fbdc:	e24dd008 	sub	sp, sp, #8
    fbe0:	e92d6000 	push	{sp, lr}
    fbe4:	eb000003 	bl	fbf8 <__udivmoddi4>
    fbe8:	e59de004 	ldr	lr, [sp, #4]
    fbec:	e28dd008 	add	sp, sp, #8
    fbf0:	e8bd000c 	pop	{r2, r3}
    fbf4:	e12fff1e 	bx	lr

0000fbf8 <__udivmoddi4>:
    fbf8:	e1510003 	cmp	r1, r3
    fbfc:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    fc00:	01500002 	cmpeq	r0, r2
    fc04:	e1a04000 	mov	r4, r0
    fc08:	e1a05001 	mov	r5, r1
    fc0c:	e59da028 	ldr	sl, [sp, #40]	; 0x28
    fc10:	33a00000 	movcc	r0, #0
    fc14:	33a01000 	movcc	r1, #0
    fc18:	3a00003d 	bcc	fd14 <__udivmoddi4+0x11c>
    fc1c:	e1a00002 	mov	r0, r2
    fc20:	e1a01003 	mov	r1, r3
    fc24:	e1a08002 	mov	r8, r2
    fc28:	e1a09003 	mov	r9, r3
    fc2c:	eb00003c 	bl	fd24 <__clzdi2>
    fc30:	e1a01005 	mov	r1, r5
    fc34:	e1a0b000 	mov	fp, r0
    fc38:	e1a00004 	mov	r0, r4
    fc3c:	eb000038 	bl	fd24 <__clzdi2>
    fc40:	e04bb000 	sub	fp, fp, r0
    fc44:	e24b2020 	sub	r2, fp, #32
    fc48:	e1a07b19 	lsl	r7, r9, fp
    fc4c:	e1877218 	orr	r7, r7, r8, lsl r2
    fc50:	e26bc020 	rsb	ip, fp, #32
    fc54:	e1877c38 	orr	r7, r7, r8, lsr ip
    fc58:	e1550007 	cmp	r5, r7
    fc5c:	e1a06b18 	lsl	r6, r8, fp
    fc60:	01540006 	cmpeq	r4, r6
    fc64:	33a00000 	movcc	r0, #0
    fc68:	33a01000 	movcc	r1, #0
    fc6c:	3a000005 	bcc	fc88 <__udivmoddi4+0x90>
    fc70:	e3a0e001 	mov	lr, #1
    fc74:	e0544006 	subs	r4, r4, r6
    fc78:	e1a0121e 	lsl	r1, lr, r2
    fc7c:	e1811c3e 	orr	r1, r1, lr, lsr ip
    fc80:	e0c55007 	sbc	r5, r5, r7
    fc84:	e1a00b1e 	lsl	r0, lr, fp
    fc88:	e35b0000 	cmp	fp, #0
    fc8c:	0a000020 	beq	fd14 <__udivmoddi4+0x11c>
    fc90:	e1b070a7 	lsrs	r7, r7, #1
    fc94:	e1a06066 	rrx	r6, r6
    fc98:	e1a0e00b 	mov	lr, fp
    fc9c:	ea000007 	b	fcc0 <__udivmoddi4+0xc8>
    fca0:	e0544006 	subs	r4, r4, r6
    fca4:	e0c55007 	sbc	r5, r5, r7
    fca8:	e0944004 	adds	r4, r4, r4
    fcac:	e0a55005 	adc	r5, r5, r5
    fcb0:	e2944001 	adds	r4, r4, #1
    fcb4:	e2a55000 	adc	r5, r5, #0
    fcb8:	e25ee001 	subs	lr, lr, #1
    fcbc:	0a000006 	beq	fcdc <__udivmoddi4+0xe4>
    fcc0:	e1550007 	cmp	r5, r7
    fcc4:	01540006 	cmpeq	r4, r6
    fcc8:	2afffff4 	bcs	fca0 <__udivmoddi4+0xa8>
    fccc:	e0944004 	adds	r4, r4, r4
    fcd0:	e0a55005 	adc	r5, r5, r5
    fcd4:	e25ee001 	subs	lr, lr, #1
    fcd8:	1afffff8 	bne	fcc0 <__udivmoddi4+0xc8>
    fcdc:	e1a0eb34 	lsr	lr, r4, fp
    fce0:	e18eec15 	orr	lr, lr, r5, lsl ip
    fce4:	e18ee235 	orr	lr, lr, r5, lsr r2
    fce8:	e0906004 	adds	r6, r0, r4
    fcec:	e1a0400e 	mov	r4, lr
    fcf0:	e0a17005 	adc	r7, r1, r5
    fcf4:	e1a01b35 	lsr	r1, r5, fp
    fcf8:	e1a05001 	mov	r5, r1
    fcfc:	e1a01b11 	lsl	r1, r1, fp
    fd00:	e181121e 	orr	r1, r1, lr, lsl r2
    fd04:	e1a00b1e 	lsl	r0, lr, fp
    fd08:	e1811c3e 	orr	r1, r1, lr, lsr ip
    fd0c:	e0560000 	subs	r0, r6, r0
    fd10:	e0c71001 	sbc	r1, r7, r1
    fd14:	e35a0000 	cmp	sl, #0
    fd18:	188a0030 	stmne	sl, {r4, r5}
    fd1c:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    fd20:	e12fff1e 	bx	lr

0000fd24 <__clzdi2>:
    fd24:	e92d4010 	push	{r4, lr}
    fd28:	e3510000 	cmp	r1, #0
    fd2c:	1a000002 	bne	fd3c <__clzdi2+0x18>
    fd30:	eb000005 	bl	fd4c <__clzsi2>
    fd34:	e2800020 	add	r0, r0, #32
    fd38:	ea000001 	b	fd44 <__clzdi2+0x20>
    fd3c:	e1a00001 	mov	r0, r1
    fd40:	eb000001 	bl	fd4c <__clzsi2>
    fd44:	e8bd4010 	pop	{r4, lr}
    fd48:	e12fff1e 	bx	lr

0000fd4c <__clzsi2>:
    fd4c:	e3a0101c 	mov	r1, #28
    fd50:	e3500801 	cmp	r0, #65536	; 0x10000
    fd54:	21a00820 	lsrcs	r0, r0, #16
    fd58:	22411010 	subcs	r1, r1, #16
    fd5c:	e3500c01 	cmp	r0, #256	; 0x100
    fd60:	21a00420 	lsrcs	r0, r0, #8
    fd64:	22411008 	subcs	r1, r1, #8
    fd68:	e3500010 	cmp	r0, #16
    fd6c:	21a00220 	lsrcs	r0, r0, #4
    fd70:	22411004 	subcs	r1, r1, #4
    fd74:	e28f2008 	add	r2, pc, #8
    fd78:	e7d20000 	ldrb	r0, [r2, r0]
    fd7c:	e0800001 	add	r0, r0, r1
    fd80:	e12fff1e 	bx	lr
    fd84:	02020304 	.word	0x02020304
    fd88:	01010101 	.word	0x01010101
	...

0000fd94 <_close>:
    fd94:	e3a02058 	mov	r2, #88	; 0x58
    fd98:	e59f3008 	ldr	r3, [pc, #8]	; fda8 <_close+0x14>
    fd9c:	e3e00000 	mvn	r0, #0
    fda0:	e5832000 	str	r2, [r3]
    fda4:	e12fff1e 	bx	lr
    fda8:	00010db0 	.word	0x00010db0

0000fdac <_fstat>:
    fdac:	e3a02058 	mov	r2, #88	; 0x58
    fdb0:	e59f3008 	ldr	r3, [pc, #8]	; fdc0 <_fstat+0x14>
    fdb4:	e3e00000 	mvn	r0, #0
    fdb8:	e5832000 	str	r2, [r3]
    fdbc:	e12fff1e 	bx	lr
    fdc0:	00010db0 	.word	0x00010db0

0000fdc4 <_getpid>:
    fdc4:	e3a02058 	mov	r2, #88	; 0x58
    fdc8:	e59f3008 	ldr	r3, [pc, #8]	; fdd8 <_getpid+0x14>
    fdcc:	e3e00000 	mvn	r0, #0
    fdd0:	e5832000 	str	r2, [r3]
    fdd4:	e12fff1e 	bx	lr
    fdd8:	00010db0 	.word	0x00010db0

0000fddc <_isatty>:
    fddc:	e3a02058 	mov	r2, #88	; 0x58
    fde0:	e59f3008 	ldr	r3, [pc, #8]	; fdf0 <_isatty+0x14>
    fde4:	e3a00000 	mov	r0, #0
    fde8:	e5832000 	str	r2, [r3]
    fdec:	e12fff1e 	bx	lr
    fdf0:	00010db0 	.word	0x00010db0

0000fdf4 <_kill>:
    fdf4:	e3a02058 	mov	r2, #88	; 0x58
    fdf8:	e59f3008 	ldr	r3, [pc, #8]	; fe08 <_kill+0x14>
    fdfc:	e3e00000 	mvn	r0, #0
    fe00:	e5832000 	str	r2, [r3]
    fe04:	e12fff1e 	bx	lr
    fe08:	00010db0 	.word	0x00010db0

0000fe0c <_lseek>:
    fe0c:	e3a02058 	mov	r2, #88	; 0x58
    fe10:	e59f3008 	ldr	r3, [pc, #8]	; fe20 <_lseek+0x14>
    fe14:	e3e00000 	mvn	r0, #0
    fe18:	e5832000 	str	r2, [r3]
    fe1c:	e12fff1e 	bx	lr
    fe20:	00010db0 	.word	0x00010db0

0000fe24 <_read>:
    fe24:	e3a02058 	mov	r2, #88	; 0x58
    fe28:	e59f3008 	ldr	r3, [pc, #8]	; fe38 <_read+0x14>
    fe2c:	e3e00000 	mvn	r0, #0
    fe30:	e5832000 	str	r2, [r3]
    fe34:	e12fff1e 	bx	lr
    fe38:	00010db0 	.word	0x00010db0

0000fe3c <_sbrk>:
    fe3c:	e59f201c 	ldr	r2, [pc, #28]	; fe60 <_sbrk+0x24>
    fe40:	e5923000 	ldr	r3, [r2]
    fe44:	e59f1018 	ldr	r1, [pc, #24]	; fe64 <_sbrk+0x28>
    fe48:	e3530000 	cmp	r3, #0
    fe4c:	01a03001 	moveq	r3, r1
    fe50:	e0830000 	add	r0, r3, r0
    fe54:	e5820000 	str	r0, [r2]
    fe58:	e1a00003 	mov	r0, r3
    fe5c:	e12fff1e 	bx	lr
    fe60:	00010d88 	.word	0x00010d88
    fe64:	00010db4 	.word	0x00010db4

0000fe68 <_write>:
    fe68:	e3a02058 	mov	r2, #88	; 0x58
    fe6c:	e59f3008 	ldr	r3, [pc, #8]	; fe7c <_write+0x14>
    fe70:	e3e00000 	mvn	r0, #0
    fe74:	e5832000 	str	r2, [r3]
    fe78:	e12fff1e 	bx	lr
    fe7c:	00010db0 	.word	0x00010db0

0000fe80 <_exit>:
    fe80:	eafffffe 	b	fe80 <_exit>

Disassembly of section .fini:

0000fe84 <_fini>:
    fe84:	e1a0c00d 	mov	ip, sp
    fe88:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
    fe8c:	e24cb004 	sub	fp, ip, #4
    fe90:	e24bd028 	sub	sp, fp, #40	; 0x28
    fe94:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
    fe98:	e12fff1e 	bx	lr
