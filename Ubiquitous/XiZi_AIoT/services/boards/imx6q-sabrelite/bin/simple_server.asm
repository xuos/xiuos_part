
simple_server:     file format elf32-littlearm


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
    804c:	00010514 	.word	0x00010514
    8050:	00000000 	.word	0x00000000
    8054:	0000f724 	.word	0x0000f724

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
    80c4:	0000f724 	.word	0x0000f724
    80c8:	00010518 	.word	0x00010518
    80cc:	0000f730 	.word	0x0000f730
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
    8164:	eb000956 	bl	a6c4 <memset>
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
    81b4:	eb00088b 	bl	a3e8 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb0000b7 	bl	84a4 <main>
    81c4:	eb0006e7 	bl	9d68 <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00010514 	.word	0x00010514
    81dc:	0001059c 	.word	0x0001059c
	...

000081e8 <ipc_do_serve_Ipc_add>:
#include "libserial.h"
#include "simple_service.h"
#include "usyscall.h"

int IPC_DO_SERVE_FUNC(Ipc_add)(int* a, int* b)
{
    81e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81ec:	e28db000 	add	fp, sp, #0
    81f0:	e24dd00c 	sub	sp, sp, #12
    81f4:	e50b0008 	str	r0, [fp, #-8]
    81f8:	e50b100c 	str	r1, [fp, #-12]
    return *a + *b;
    81fc:	e51b3008 	ldr	r3, [fp, #-8]
    8200:	e5932000 	ldr	r2, [r3]
    8204:	e51b300c 	ldr	r3, [fp, #-12]
    8208:	e5933000 	ldr	r3, [r3]
    820c:	e0823003 	add	r3, r2, r3
}
    8210:	e1a00003 	mov	r0, r3
    8214:	e28bd000 	add	sp, fp, #0
    8218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    821c:	e12fff1e 	bx	lr

00008220 <ipc_do_serve_Ipc_hello_string>:

int IPC_DO_SERVE_FUNC(Ipc_hello_string)(char* buf, int* len)
{
    8220:	e92d4800 	push	{fp, lr}
    8224:	e28db004 	add	fp, sp, #4
    8228:	e24dd010 	sub	sp, sp, #16
    822c:	e50b0010 	str	r0, [fp, #-16]
    8230:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    static char hello_string[] = "Hello, This is server!";
    int copy_len = sizeof(hello_string) > *len ? *len : sizeof(hello_string);
    8234:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8238:	e5933000 	ldr	r3, [r3]
    823c:	e3530017 	cmp	r3, #23
    8240:	31a03003 	movcc	r3, r3
    8244:	23a03017 	movcs	r3, #23
    8248:	e50b3008 	str	r3, [fp, #-8]
    memcpy(buf, hello_string, copy_len);
    824c:	e51b3008 	ldr	r3, [fp, #-8]
    8250:	e1a02003 	mov	r2, r3
    8254:	e30f1b3c 	movw	r1, #64316	; 0xfb3c
    8258:	e3401000 	movt	r1, #0
    825c:	e51b0010 	ldr	r0, [fp, #-16]
    8260:	eb000880 	bl	a468 <memcpy>
    return 0;
    8264:	e3a03000 	mov	r3, #0
}
    8268:	e1a00003 	mov	r0, r3
    826c:	e24bd004 	sub	sp, fp, #4
    8270:	e8bd8800 	pop	{fp, pc}

00008274 <ipc_serve_Ipc_add>:

IPC_SERVER_INTERFACE(Ipc_add, 2);
    8274:	e92d4800 	push	{fp, lr}
    8278:	e28db004 	add	fp, sp, #4
    827c:	e24dd028 	sub	sp, sp, #40	; 0x28
    8280:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8284:	e3a03000 	mov	r3, #0
    8288:	e50b3008 	str	r3, [fp, #-8]
    828c:	ea000014 	b	82e4 <ipc_serve_Ipc_add+0x70>
    8290:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8294:	e50b300c 	str	r3, [fp, #-12]
    8298:	e51b3008 	ldr	r3, [fp, #-8]
    829c:	e50b3010 	str	r3, [fp, #-16]
/// @param msg
/// @param arg_num start with 0 for first arg
/// @return
__attribute__((__always_inline__)) static inline void* ipc_msg_get_nth_arg_buf(struct IpcMsg* msg, int arg_num)
{
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    82a0:	e51b3010 	ldr	r3, [fp, #-16]
    82a4:	e2833003 	add	r3, r3, #3
    82a8:	e1a03103 	lsl	r3, r3, #2
    82ac:	e51b200c 	ldr	r2, [fp, #-12]
    82b0:	e0823003 	add	r3, r2, r3
    82b4:	e1d330b0 	ldrh	r3, [r3]
    82b8:	e1a02003 	mov	r2, r3
    82bc:	e51b300c 	ldr	r3, [fp, #-12]
    82c0:	e0832002 	add	r2, r3, r2
    82c4:	e51b3008 	ldr	r3, [fp, #-8]
    82c8:	e1a03103 	lsl	r3, r3, #2
    82cc:	e24b1004 	sub	r1, fp, #4
    82d0:	e0813003 	add	r3, r1, r3
    82d4:	e503201c 	str	r2, [r3, #-28]	; 0xffffffe4
    82d8:	e51b3008 	ldr	r3, [fp, #-8]
    82dc:	e2833001 	add	r3, r3, #1
    82e0:	e50b3008 	str	r3, [fp, #-8]
    82e4:	e51b3008 	ldr	r3, [fp, #-8]
    82e8:	e3530001 	cmp	r3, #1
    82ec:	daffffe7 	ble	8290 <ipc_serve_Ipc_add+0x1c>
    82f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    82f4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    82f8:	e1a01002 	mov	r1, r2
    82fc:	e1a00003 	mov	r0, r3
    8300:	ebffffb8 	bl	81e8 <ipc_do_serve_Ipc_add>
    8304:	e1a03000 	mov	r3, r0
    8308:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    830c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8310:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8314:	e24b3024 	sub	r3, fp, #36	; 0x24
    8318:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
/// @brief set return val of ipc call after serve, used by server
/// @param msg
/// @param ret_val
__attribute__((__always_inline__)) static inline void ipc_msg_set_return(struct IpcMsg* msg, int32_t* ret_val)
{
    assert(msg->header.valid == 1);
    831c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8320:	e5d33000 	ldrb	r3, [r3]
    8324:	e2033001 	and	r3, r3, #1
    8328:	e6ef3073 	uxtb	r3, r3
    832c:	e3530000 	cmp	r3, #0
    8330:	1a000007 	bne	8354 <ipc_serve_Ipc_add+0xe0>
    8334:	e30f31f0 	movw	r3, #61936	; 0xf1f0
    8338:	e3403000 	movt	r3, #0
    833c:	e30f228c 	movw	r2, #62092	; 0xf28c
    8340:	e3402000 	movt	r2, #0
    8344:	e3a0107e 	mov	r1, #126	; 0x7e
    8348:	e30f0208 	movw	r0, #61960	; 0xf208
    834c:	e3400000 	movt	r0, #0
    8350:	eb0007f0 	bl	a318 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    8354:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8358:	e2833008 	add	r3, r3, #8
    835c:	e3a02004 	mov	r2, #4
    8360:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8364:	e1a00003 	mov	r0, r3
    8368:	eb00083e 	bl	a468 <memcpy>
    836c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8370:	e5d23000 	ldrb	r3, [r2]
    8374:	e3833002 	orr	r3, r3, #2
    8378:	e5c23000 	strb	r3, [r2]
    837c:	e3a03000 	mov	r3, #0
    8380:	e1a00003 	mov	r0, r3
    8384:	e24bd004 	sub	sp, fp, #4
    8388:	e8bd8800 	pop	{fp, pc}

0000838c <ipc_serve_Ipc_hello_string>:
IPC_SERVER_INTERFACE(Ipc_hello_string, 2);
    838c:	e92d4800 	push	{fp, lr}
    8390:	e28db004 	add	fp, sp, #4
    8394:	e24dd028 	sub	sp, sp, #40	; 0x28
    8398:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    839c:	e3a03000 	mov	r3, #0
    83a0:	e50b3008 	str	r3, [fp, #-8]
    83a4:	ea000014 	b	83fc <ipc_serve_Ipc_hello_string+0x70>
    83a8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    83ac:	e50b300c 	str	r3, [fp, #-12]
    83b0:	e51b3008 	ldr	r3, [fp, #-8]
    83b4:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    83b8:	e51b3010 	ldr	r3, [fp, #-16]
    83bc:	e2833003 	add	r3, r3, #3
    83c0:	e1a03103 	lsl	r3, r3, #2
    83c4:	e51b200c 	ldr	r2, [fp, #-12]
    83c8:	e0823003 	add	r3, r2, r3
    83cc:	e1d330b0 	ldrh	r3, [r3]
    83d0:	e1a02003 	mov	r2, r3
    83d4:	e51b300c 	ldr	r3, [fp, #-12]
    83d8:	e0832002 	add	r2, r3, r2
    83dc:	e51b3008 	ldr	r3, [fp, #-8]
    83e0:	e1a03103 	lsl	r3, r3, #2
    83e4:	e24b1004 	sub	r1, fp, #4
    83e8:	e0813003 	add	r3, r1, r3
    83ec:	e503201c 	str	r2, [r3, #-28]	; 0xffffffe4
    83f0:	e51b3008 	ldr	r3, [fp, #-8]
    83f4:	e2833001 	add	r3, r3, #1
    83f8:	e50b3008 	str	r3, [fp, #-8]
    83fc:	e51b3008 	ldr	r3, [fp, #-8]
    8400:	e3530001 	cmp	r3, #1
    8404:	daffffe7 	ble	83a8 <ipc_serve_Ipc_hello_string+0x1c>
    8408:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    840c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8410:	e1a01002 	mov	r1, r2
    8414:	e1a00003 	mov	r0, r3
    8418:	ebffff80 	bl	8220 <ipc_do_serve_Ipc_hello_string>
    841c:	e1a03000 	mov	r3, r0
    8420:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    8424:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8428:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    842c:	e24b3024 	sub	r3, fp, #36	; 0x24
    8430:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    8434:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8438:	e5d33000 	ldrb	r3, [r3]
    843c:	e2033001 	and	r3, r3, #1
    8440:	e6ef3073 	uxtb	r3, r3
    8444:	e3530000 	cmp	r3, #0
    8448:	1a000007 	bne	846c <ipc_serve_Ipc_hello_string+0xe0>
    844c:	e30f31f0 	movw	r3, #61936	; 0xf1f0
    8450:	e3403000 	movt	r3, #0
    8454:	e30f228c 	movw	r2, #62092	; 0xf28c
    8458:	e3402000 	movt	r2, #0
    845c:	e3a0107e 	mov	r1, #126	; 0x7e
    8460:	e30f0208 	movw	r0, #61960	; 0xf208
    8464:	e3400000 	movt	r0, #0
    8468:	eb0007aa 	bl	a318 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    846c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8470:	e2833008 	add	r3, r3, #8
    8474:	e3a02004 	mov	r2, #4
    8478:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    847c:	e1a00003 	mov	r0, r3
    8480:	eb0007f8 	bl	a468 <memcpy>
    8484:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8488:	e5d23000 	ldrb	r3, [r2]
    848c:	e3833002 	orr	r3, r3, #2
    8490:	e5c23000 	strb	r3, [r2]
    8494:	e3a03000 	mov	r3, #0
    8498:	e1a00003 	mov	r0, r3
    849c:	e24bd004 	sub	sp, fp, #4
    84a0:	e8bd8800 	pop	{fp, pc}

000084a4 <main>:
IPC_SERVER_REGISTER_INTERFACES(IpcSimpleServer, 2, Ipc_hello_string, Ipc_add);

int main(int argc, char* argv[])
{
    84a4:	e92d4800 	push	{fp, lr}
    84a8:	e28db004 	add	fp, sp, #4
    84ac:	e24dd008 	sub	sp, sp, #8
    84b0:	e50b0008 	str	r0, [fp, #-8]
    84b4:	e50b100c 	str	r1, [fp, #-12]
    if (register_server("SimpleServer") < 0) {
    84b8:	e30f0258 	movw	r0, #62040	; 0xf258
    84bc:	e3400000 	movt	r0, #0
    84c0:	eb000644 	bl	9dd8 <register_server>
    84c4:	e1a03000 	mov	r3, r0
    84c8:	e3530000 	cmp	r3, #0
    84cc:	aa000005 	bge	84e8 <main+0x44>
        printf("register server name: %s failed.\n", "SimpleServer");
    84d0:	e30f1258 	movw	r1, #62040	; 0xf258
    84d4:	e3401000 	movt	r1, #0
    84d8:	e30f0268 	movw	r0, #62056	; 0xf268
    84dc:	e3400000 	movt	r0, #0
    84e0:	eb0000b4 	bl	87b8 <printf>
        exit();
    84e4:	eb00061f 	bl	9d68 <exit>
    }
    ipc_server_loop(&IpcSimpleServer);
    84e8:	e30f073c 	movw	r0, #63292	; 0xf73c
    84ec:	e3400000 	movt	r0, #0
    84f0:	eb0002a5 	bl	8f8c <ipc_server_loop>

    // never reached
    exit();
    84f4:	eb00061b 	bl	9d68 <exit>
    84f8:	e3a03000 	mov	r3, #0
}
    84fc:	e1a00003 	mov	r0, r3
    8500:	e24bd004 	sub	sp, fp, #4
    8504:	e8bd8800 	pop	{fp, pc}

00008508 <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    8508:	e92d4800 	push	{fp, lr}
    850c:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    8510:	e3003530 	movw	r3, #1328	; 0x530
    8514:	e3403001 	movt	r3, #1
    8518:	e5933000 	ldr	r3, [r3]
    851c:	e3530000 	cmp	r3, #0
    8520:	1a00000f 	bne	8564 <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    8524:	e3a03001 	mov	r3, #1
    8528:	e3a02a01 	mov	r2, #4096	; 0x1000
    852c:	e3a01902 	mov	r1, #32768	; 0x8000
    8530:	e340121e 	movt	r1, #542	; 0x21e
    8534:	e3a00a0f 	mov	r0, #61440	; 0xf000
    8538:	e3460fff 	movt	r0, #28671	; 0x6fff
    853c:	eb0006bb 	bl	a030 <mmap>
    8540:	e1a03000 	mov	r3, r0
    8544:	e3730001 	cmn	r3, #1
    8548:	1a000001 	bne	8554 <init_uart_mmio+0x4c>
            return false;
    854c:	e3a03000 	mov	r3, #0
    8550:	ea000004 	b	8568 <init_uart_mmio+0x60>
        }
        mapped = 1;
    8554:	e3003530 	movw	r3, #1328	; 0x530
    8558:	e3403001 	movt	r3, #1
    855c:	e3a02001 	mov	r2, #1
    8560:	e5832000 	str	r2, [r3]
    }
    return true;
    8564:	e3a03001 	mov	r3, #1
}
    8568:	e1a00003 	mov	r0, r3
    856c:	e8bd8800 	pop	{fp, pc}

00008570 <putc>:

static void putc(char c)
{
    8570:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8574:	e28db000 	add	fp, sp, #0
    8578:	e24dd00c 	sub	sp, sp, #12
    857c:	e1a03000 	mov	r3, r0
    8580:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    8584:	e320f000 	nop	{0}
    8588:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    858c:	e3463fff 	movt	r3, #28671	; 0x6fff
    8590:	e5933000 	ldr	r3, [r3]
    8594:	e7e03253 	ubfx	r3, r3, #4, #1
    8598:	e6ef3073 	uxtb	r3, r3
    859c:	e3530000 	cmp	r3, #0
    85a0:	1afffff8 	bne	8588 <putc+0x18>
        ;

    if (c == '\n') {
    85a4:	e55b3005 	ldrb	r3, [fp, #-5]
    85a8:	e353000a 	cmp	r3, #10
    85ac:	1a00000b 	bne	85e0 <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    85b0:	e30f3040 	movw	r3, #61504	; 0xf040
    85b4:	e3463fff 	movt	r3, #28671	; 0x6fff
    85b8:	e3a0200d 	mov	r2, #13
    85bc:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    85c0:	e320f000 	nop	{0}
    85c4:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    85c8:	e3463fff 	movt	r3, #28671	; 0x6fff
    85cc:	e5933000 	ldr	r3, [r3]
    85d0:	e7e03253 	ubfx	r3, r3, #4, #1
    85d4:	e6ef3073 	uxtb	r3, r3
    85d8:	e3530000 	cmp	r3, #0
    85dc:	1afffff8 	bne	85c4 <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    85e0:	e30f3040 	movw	r3, #61504	; 0xf040
    85e4:	e3463fff 	movt	r3, #28671	; 0x6fff
    85e8:	e55b2005 	ldrb	r2, [fp, #-5]
    85ec:	e5832000 	str	r2, [r3]
}
    85f0:	e320f000 	nop	{0}
    85f4:	e28bd000 	add	sp, fp, #0
    85f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    85fc:	e12fff1e 	bx	lr

00008600 <getc>:

char getc(void)
{
    8600:	e92d4800 	push	{fp, lr}
    8604:	e28db004 	add	fp, sp, #4
    8608:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    860c:	ebffffbd 	bl	8508 <init_uart_mmio>
    8610:	e1a03000 	mov	r3, r0
    8614:	e2233001 	eor	r3, r3, #1
    8618:	e6ef3073 	uxtb	r3, r3
    861c:	e3530000 	cmp	r3, #0
    8620:	0a000001 	beq	862c <getc+0x2c>
        return 0xFF;
    8624:	e3a030ff 	mov	r3, #255	; 0xff
    8628:	ea000014 	b	8680 <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    862c:	e30f3098 	movw	r3, #61592	; 0xf098
    8630:	e3463fff 	movt	r3, #28671	; 0x6fff
    8634:	e5933000 	ldr	r3, [r3]
    8638:	e7e03053 	ubfx	r3, r3, #0, #1
    863c:	e6ef3073 	uxtb	r3, r3
    8640:	e3530000 	cmp	r3, #0
    8644:	1a000001 	bne	8650 <getc+0x50>
        return 0xFF;
    8648:	e3a030ff 	mov	r3, #255	; 0xff
    864c:	ea00000b 	b	8680 <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    8650:	e3a03a0f 	mov	r3, #61440	; 0xf000
    8654:	e3463fff 	movt	r3, #28671	; 0x6fff
    8658:	e5933000 	ldr	r3, [r3]
    865c:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    8660:	e51b3008 	ldr	r3, [fp, #-8]
    8664:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    8668:	e3530000 	cmp	r3, #0
    866c:	0a000001 	beq	8678 <getc+0x78>
        return 0xFF;
    8670:	e3a030ff 	mov	r3, #255	; 0xff
    8674:	ea000001 	b	8680 <getc+0x80>

    return (char)read_data;
    8678:	e51b3008 	ldr	r3, [fp, #-8]
    867c:	e6ef3073 	uxtb	r3, r3
}
    8680:	e1a00003 	mov	r0, r3
    8684:	e24bd004 	sub	sp, fp, #4
    8688:	e8bd8800 	pop	{fp, pc}

0000868c <printint>:

static void printint(int xx, int base, int sgn)
{
    868c:	e92d4810 	push	{r4, fp, lr}
    8690:	e28db008 	add	fp, sp, #8
    8694:	e24dd034 	sub	sp, sp, #52	; 0x34
    8698:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    869c:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    86a0:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    86a4:	e3a03000 	mov	r3, #0
    86a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    86ac:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    86b0:	e3530000 	cmp	r3, #0
    86b4:	0a000008 	beq	86dc <printint+0x50>
    86b8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    86bc:	e3530000 	cmp	r3, #0
    86c0:	aa000005 	bge	86dc <printint+0x50>
        neg = 1;
    86c4:	e3a03001 	mov	r3, #1
    86c8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    86cc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    86d0:	e2633000 	rsb	r3, r3, #0
    86d4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    86d8:	ea000001 	b	86e4 <printint+0x58>
    } else {
        x = xx;
    86dc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    86e0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    86e4:	e3a03000 	mov	r3, #0
    86e8:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    86ec:	e51b4010 	ldr	r4, [fp, #-16]
    86f0:	e2843001 	add	r3, r4, #1
    86f4:	e50b3010 	str	r3, [fp, #-16]
    86f8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    86fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8700:	e1a01002 	mov	r1, r2
    8704:	e1a00003 	mov	r0, r3
    8708:	eb0006a7 	bl	a1ac <__aeabi_uidivmod>
    870c:	e1a03001 	mov	r3, r1
    8710:	e1a02003 	mov	r2, r3
    8714:	e30f3b54 	movw	r3, #64340	; 0xfb54
    8718:	e3403000 	movt	r3, #0
    871c:	e7d32002 	ldrb	r2, [r3, r2]
    8720:	e24b300c 	sub	r3, fp, #12
    8724:	e0833004 	add	r3, r3, r4
    8728:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    872c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    8730:	e1a01003 	mov	r1, r3
    8734:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    8738:	eb00065e 	bl	a0b8 <__udivsi3>
    873c:	e1a03000 	mov	r3, r0
    8740:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8744:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8748:	e3530000 	cmp	r3, #0
    874c:	1affffe6 	bne	86ec <printint+0x60>
    if (neg)
    8750:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8754:	e3530000 	cmp	r3, #0
    8758:	0a00000d 	beq	8794 <printint+0x108>
        buf[i++] = '-';
    875c:	e51b3010 	ldr	r3, [fp, #-16]
    8760:	e2832001 	add	r2, r3, #1
    8764:	e50b2010 	str	r2, [fp, #-16]
    8768:	e24b200c 	sub	r2, fp, #12
    876c:	e0823003 	add	r3, r2, r3
    8770:	e3a0202d 	mov	r2, #45	; 0x2d
    8774:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    8778:	ea000005 	b	8794 <printint+0x108>
        putc(buf[i]);
    877c:	e24b2028 	sub	r2, fp, #40	; 0x28
    8780:	e51b3010 	ldr	r3, [fp, #-16]
    8784:	e0823003 	add	r3, r2, r3
    8788:	e5d33000 	ldrb	r3, [r3]
    878c:	e1a00003 	mov	r0, r3
    8790:	ebffff76 	bl	8570 <putc>
    while (--i >= 0)
    8794:	e51b3010 	ldr	r3, [fp, #-16]
    8798:	e2433001 	sub	r3, r3, #1
    879c:	e50b3010 	str	r3, [fp, #-16]
    87a0:	e51b3010 	ldr	r3, [fp, #-16]
    87a4:	e3530000 	cmp	r3, #0
    87a8:	aafffff3 	bge	877c <printint+0xf0>
}
    87ac:	e320f000 	nop	{0}
    87b0:	e24bd008 	sub	sp, fp, #8
    87b4:	e8bd8810 	pop	{r4, fp, pc}

000087b8 <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    87b8:	e92d000f 	push	{r0, r1, r2, r3}
    87bc:	e92d4800 	push	{fp, lr}
    87c0:	e28db004 	add	fp, sp, #4
    87c4:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    87c8:	ebffff4e 	bl	8508 <init_uart_mmio>
    87cc:	e1a03000 	mov	r3, r0
    87d0:	e2233001 	eor	r3, r3, #1
    87d4:	e6ef3073 	uxtb	r3, r3
    87d8:	e3530000 	cmp	r3, #0
    87dc:	1a00007b 	bne	89d0 <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    87e0:	e3a03000 	mov	r3, #0
    87e4:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    87e8:	e28b3008 	add	r3, fp, #8
    87ec:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    87f0:	e3a03000 	mov	r3, #0
    87f4:	e50b300c 	str	r3, [fp, #-12]
    87f8:	ea00006d 	b	89b4 <printf+0x1fc>
        c = fmt[i] & 0xff;
    87fc:	e59b2004 	ldr	r2, [fp, #4]
    8800:	e51b300c 	ldr	r3, [fp, #-12]
    8804:	e0823003 	add	r3, r2, r3
    8808:	e5d33000 	ldrb	r3, [r3]
    880c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    8810:	e51b3010 	ldr	r3, [fp, #-16]
    8814:	e3530000 	cmp	r3, #0
    8818:	1a00000a 	bne	8848 <printf+0x90>
            if (c == '%') {
    881c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8820:	e3530025 	cmp	r3, #37	; 0x25
    8824:	1a000002 	bne	8834 <printf+0x7c>
                state = '%';
    8828:	e3a03025 	mov	r3, #37	; 0x25
    882c:	e50b3010 	str	r3, [fp, #-16]
    8830:	ea00005c 	b	89a8 <printf+0x1f0>
            } else {
                putc(c);
    8834:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8838:	e6ef3073 	uxtb	r3, r3
    883c:	e1a00003 	mov	r0, r3
    8840:	ebffff4a 	bl	8570 <putc>
    8844:	ea000057 	b	89a8 <printf+0x1f0>
            }
        } else if (state == '%') {
    8848:	e51b3010 	ldr	r3, [fp, #-16]
    884c:	e3530025 	cmp	r3, #37	; 0x25
    8850:	1a000054 	bne	89a8 <printf+0x1f0>
            if (c == 'd') {
    8854:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8858:	e3530064 	cmp	r3, #100	; 0x64
    885c:	1a000009 	bne	8888 <printf+0xd0>
                printint(*ap, 10, 1);
    8860:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8864:	e5933000 	ldr	r3, [r3]
    8868:	e3a02001 	mov	r2, #1
    886c:	e3a0100a 	mov	r1, #10
    8870:	e1a00003 	mov	r0, r3
    8874:	ebffff84 	bl	868c <printint>
                ap++;
    8878:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    887c:	e2833004 	add	r3, r3, #4
    8880:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8884:	ea000045 	b	89a0 <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    8888:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    888c:	e3530078 	cmp	r3, #120	; 0x78
    8890:	0a000002 	beq	88a0 <printf+0xe8>
    8894:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8898:	e3530070 	cmp	r3, #112	; 0x70
    889c:	1a000009 	bne	88c8 <printf+0x110>
                printint(*ap, 16, 0);
    88a0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88a4:	e5933000 	ldr	r3, [r3]
    88a8:	e3a02000 	mov	r2, #0
    88ac:	e3a01010 	mov	r1, #16
    88b0:	e1a00003 	mov	r0, r3
    88b4:	ebffff74 	bl	868c <printint>
                ap++;
    88b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88bc:	e2833004 	add	r3, r3, #4
    88c0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    88c4:	ea000035 	b	89a0 <printf+0x1e8>
            } else if (c == 's') {
    88c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    88cc:	e3530073 	cmp	r3, #115	; 0x73
    88d0:	1a000018 	bne	8938 <printf+0x180>
                s = (char*)*ap;
    88d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88d8:	e5933000 	ldr	r3, [r3]
    88dc:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    88e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88e4:	e2833004 	add	r3, r3, #4
    88e8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    88ec:	e51b3008 	ldr	r3, [fp, #-8]
    88f0:	e3530000 	cmp	r3, #0
    88f4:	1a00000a 	bne	8924 <printf+0x16c>
                    s = "(null)";
    88f8:	e30f32a0 	movw	r3, #62112	; 0xf2a0
    88fc:	e3403000 	movt	r3, #0
    8900:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    8904:	ea000006 	b	8924 <printf+0x16c>
                    putc(*s);
    8908:	e51b3008 	ldr	r3, [fp, #-8]
    890c:	e5d33000 	ldrb	r3, [r3]
    8910:	e1a00003 	mov	r0, r3
    8914:	ebffff15 	bl	8570 <putc>
                    s++;
    8918:	e51b3008 	ldr	r3, [fp, #-8]
    891c:	e2833001 	add	r3, r3, #1
    8920:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    8924:	e51b3008 	ldr	r3, [fp, #-8]
    8928:	e5d33000 	ldrb	r3, [r3]
    892c:	e3530000 	cmp	r3, #0
    8930:	1afffff4 	bne	8908 <printf+0x150>
    8934:	ea000019 	b	89a0 <printf+0x1e8>
                }
            } else if (c == 'c') {
    8938:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    893c:	e3530063 	cmp	r3, #99	; 0x63
    8940:	1a000008 	bne	8968 <printf+0x1b0>
                putc(*ap);
    8944:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8948:	e5933000 	ldr	r3, [r3]
    894c:	e6ef3073 	uxtb	r3, r3
    8950:	e1a00003 	mov	r0, r3
    8954:	ebffff05 	bl	8570 <putc>
                ap++;
    8958:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    895c:	e2833004 	add	r3, r3, #4
    8960:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8964:	ea00000d 	b	89a0 <printf+0x1e8>
            } else if (c == '%') {
    8968:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    896c:	e3530025 	cmp	r3, #37	; 0x25
    8970:	1a000004 	bne	8988 <printf+0x1d0>
                putc(c);
    8974:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8978:	e6ef3073 	uxtb	r3, r3
    897c:	e1a00003 	mov	r0, r3
    8980:	ebfffefa 	bl	8570 <putc>
    8984:	ea000005 	b	89a0 <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    8988:	e3a00025 	mov	r0, #37	; 0x25
    898c:	ebfffef7 	bl	8570 <putc>
                putc(c);
    8990:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8994:	e6ef3073 	uxtb	r3, r3
    8998:	e1a00003 	mov	r0, r3
    899c:	ebfffef3 	bl	8570 <putc>
            }
            state = 0;
    89a0:	e3a03000 	mov	r3, #0
    89a4:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    89a8:	e51b300c 	ldr	r3, [fp, #-12]
    89ac:	e2833001 	add	r3, r3, #1
    89b0:	e50b300c 	str	r3, [fp, #-12]
    89b4:	e59b2004 	ldr	r2, [fp, #4]
    89b8:	e51b300c 	ldr	r3, [fp, #-12]
    89bc:	e0823003 	add	r3, r2, r3
    89c0:	e5d33000 	ldrb	r3, [r3]
    89c4:	e3530000 	cmp	r3, #0
    89c8:	1affff8b 	bne	87fc <printf+0x44>
    89cc:	ea000000 	b	89d4 <printf+0x21c>
        return;
    89d0:	e320f000 	nop	{0}
        }
    }
    89d4:	e24bd004 	sub	sp, fp, #4
    89d8:	e8bd4800 	pop	{fp, lr}
    89dc:	e28dd010 	add	sp, sp, #16
    89e0:	e12fff1e 	bx	lr

000089e4 <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    89e4:	e92d4800 	push	{fp, lr}
    89e8:	e28db004 	add	fp, sp, #4
    89ec:	e24dd030 	sub	sp, sp, #48	; 0x30
    89f0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    89f4:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    89f8:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    int len = IPC_ARG_INFO_BASE_OFFSET;
    89fc:	e3a0300c 	mov	r3, #12
    8a00:	e50b3008 	str	r3, [fp, #-8]

    int arg_info_offset = len; // start of arg info
    8a04:	e51b3008 	ldr	r3, [fp, #-8]
    8a08:	e50b300c 	str	r3, [fp, #-12]
    len += argc * sizeof(struct IpcArgInfo);
    8a0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8a10:	e1a02103 	lsl	r2, r3, #2
    8a14:	e51b3008 	ldr	r3, [fp, #-8]
    8a18:	e0823003 	add	r3, r2, r3
    8a1c:	e50b3008 	str	r3, [fp, #-8]

    int arg_buf_offset = len; // start of arg buffer
    8a20:	e51b3008 	ldr	r3, [fp, #-8]
    8a24:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    8a28:	e3a03000 	mov	r3, #0
    8a2c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8a30:	ea00000a 	b	8a60 <new_ipc_msg+0x7c>
        len += arg_size[i];
    8a34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8a38:	e1a03103 	lsl	r3, r3, #2
    8a3c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8a40:	e0823003 	add	r3, r2, r3
    8a44:	e5933000 	ldr	r3, [r3]
    8a48:	e51b2008 	ldr	r2, [fp, #-8]
    8a4c:	e0823003 	add	r3, r2, r3
    8a50:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < argc; i++) {
    8a54:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8a58:	e2833001 	add	r3, r3, #1
    8a5c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8a60:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8a64:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8a68:	e1520003 	cmp	r2, r3
    8a6c:	bafffff0 	blt	8a34 <new_ipc_msg+0x50>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    8a70:	e51b1008 	ldr	r1, [fp, #-8]
    8a74:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    8a78:	eb00026d 	bl	9434 <session_alloc_buf>
    8a7c:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (buf == NULL) {
    8a80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8a84:	e3530000 	cmp	r3, #0
    8a88:	1a000001 	bne	8a94 <new_ipc_msg+0xb0>
        return NULL;
    8a8c:	e3a03000 	mov	r3, #0
    8a90:	ea00003d 	b	8b8c <new_ipc_msg+0x1a8>
    }
    buf->header.len = len;
    8a94:	e51b3008 	ldr	r3, [fp, #-8]
    8a98:	e6ff2073 	uxth	r2, r3
    8a9c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8aa0:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.done = 0;
    8aa4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8aa8:	e5d23000 	ldrb	r3, [r2]
    8aac:	e7c1309f 	bfc	r3, #1, #1
    8ab0:	e5c23000 	strb	r3, [r2]
    buf->header.valid = 0;
    8ab4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8ab8:	e5d23000 	ldrb	r3, [r2]
    8abc:	e7c0301f 	bfc	r3, #0, #1
    8ac0:	e5c23000 	strb	r3, [r2]

    for (int i = 0; i < argc; i++) {
    8ac4:	e3a03000 	mov	r3, #0
    8ac8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8acc:	ea00001d 	b	8b48 <new_ipc_msg+0x164>
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    8ad0:	e51b300c 	ldr	r3, [fp, #-12]
    8ad4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8ad8:	e0823003 	add	r3, r2, r3
    8adc:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        arg_info->len = arg_size[i];
    8ae0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8ae4:	e1a03103 	lsl	r3, r3, #2
    8ae8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8aec:	e0823003 	add	r3, r2, r3
    8af0:	e5933000 	ldr	r3, [r3]
    8af4:	e6ff2073 	uxth	r2, r3
    8af8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8afc:	e1c320b2 	strh	r2, [r3, #2]
        arg_info->offset = arg_buf_offset;
    8b00:	e51b3010 	ldr	r3, [fp, #-16]
    8b04:	e6ff2073 	uxth	r2, r3
    8b08:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8b0c:	e1c320b0 	strh	r2, [r3]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    8b10:	e51b300c 	ldr	r3, [fp, #-12]
    8b14:	e2833004 	add	r3, r3, #4
    8b18:	e50b300c 	str	r3, [fp, #-12]
        arg_buf_offset += arg_size[i];
    8b1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8b20:	e1a03103 	lsl	r3, r3, #2
    8b24:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    8b28:	e0823003 	add	r3, r2, r3
    8b2c:	e5933000 	ldr	r3, [r3]
    8b30:	e51b2010 	ldr	r2, [fp, #-16]
    8b34:	e0823003 	add	r3, r2, r3
    8b38:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    8b3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8b40:	e2833001 	add	r3, r3, #1
    8b44:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    8b48:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8b4c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8b50:	e1520003 	cmp	r2, r3
    8b54:	baffffdd 	blt	8ad0 <new_ipc_msg+0xec>
    }
    buf->header.nr_args = argc;
    8b58:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    8b5c:	e6ef3073 	uxtb	r3, r3
    8b60:	e203300f 	and	r3, r3, #15
    8b64:	e6ef1073 	uxtb	r1, r3
    8b68:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8b6c:	e5d23000 	ldrb	r3, [r2]
    8b70:	e7c73211 	bfi	r3, r1, #4, #4
    8b74:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
    8b78:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8b7c:	e5d23000 	ldrb	r3, [r2]
    8b80:	e3833004 	orr	r3, r3, #4
    8b84:	e5c23000 	strb	r3, [r2]
    return buf;
    8b88:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    8b8c:	e1a00003 	mov	r0, r3
    8b90:	e24bd004 	sub	sp, fp, #4
    8b94:	e8bd8800 	pop	{fp, pc}

00008b98 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    8b98:	e92d4800 	push	{fp, lr}
    8b9c:	e28db004 	add	fp, sp, #4
    8ba0:	e24dd020 	sub	sp, sp, #32
    8ba4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8ba8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8bac:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8bb0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    8bb4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8bb8:	e5d33000 	ldrb	r3, [r3]
    8bbc:	e7e33253 	ubfx	r3, r3, #4, #4
    8bc0:	e6ef3073 	uxtb	r3, r3
    8bc4:	e1a02003 	mov	r2, r3
    8bc8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8bcc:	e1520003 	cmp	r2, r3
    8bd0:	ca00000b 	bgt	8c04 <ipc_msg_set_nth_arg+0x6c>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
    8bd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8bd8:	e5d33000 	ldrb	r3, [r3]
    8bdc:	e7e33253 	ubfx	r3, r3, #4, #4
    8be0:	e6ef3073 	uxtb	r3, r3
    8be4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    8be8:	e30f1410 	movw	r1, #62480	; 0xf410
    8bec:	e3401000 	movt	r1, #0
    8bf0:	e30f02a8 	movw	r0, #62120	; 0xf2a8
    8bf4:	e3400000 	movt	r0, #0
    8bf8:	ebfffeee 	bl	87b8 <printf>
        return false;
    8bfc:	e3a03000 	mov	r3, #0
    8c00:	ea000029 	b	8cac <ipc_msg_set_nth_arg+0x114>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    8c04:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8c08:	e2833003 	add	r3, r3, #3
    8c0c:	e1a03103 	lsl	r3, r3, #2
    8c10:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8c14:	e0823003 	add	r3, r2, r3
    8c18:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    8c1c:	e51b3008 	ldr	r3, [fp, #-8]
    8c20:	e1d330b2 	ldrh	r3, [r3, #2]
    8c24:	e1a02003 	mov	r2, r3
    8c28:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8c2c:	e1520003 	cmp	r2, r3
    8c30:	aa000009 	bge	8c5c <ipc_msg_set_nth_arg+0xc4>
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
    8c34:	e51b3008 	ldr	r3, [fp, #-8]
    8c38:	e1d330b2 	ldrh	r3, [r3, #2]
    8c3c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    8c40:	e30f1410 	movw	r1, #62480	; 0xf410
    8c44:	e3401000 	movt	r1, #0
    8c48:	e30f02e8 	movw	r0, #62184	; 0xf2e8
    8c4c:	e3400000 	movt	r0, #0
    8c50:	ebfffed8 	bl	87b8 <printf>
        return false;
    8c54:	e3a03000 	mov	r3, #0
    8c58:	ea000013 	b	8cac <ipc_msg_set_nth_arg+0x114>
    8c5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8c60:	e50b3010 	str	r3, [fp, #-16]
    8c64:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8c68:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    8c6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c70:	e2833003 	add	r3, r3, #3
    8c74:	e1a03103 	lsl	r3, r3, #2
    8c78:	e51b2010 	ldr	r2, [fp, #-16]
    8c7c:	e0823003 	add	r3, r2, r3
    8c80:	e1d330b0 	ldrh	r3, [r3]
    8c84:	e1a02003 	mov	r2, r3
    8c88:	e51b3010 	ldr	r3, [fp, #-16]
    8c8c:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    8c90:	e50b300c 	str	r3, [fp, #-12]
    memmove(buf, data, len);
    8c94:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8c98:	e1a02003 	mov	r2, r3
    8c9c:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    8ca0:	e51b000c 	ldr	r0, [fp, #-12]
    8ca4:	eb000634 	bl	a57c <memmove>
    return true;
    8ca8:	e3a03001 	mov	r3, #1
}
    8cac:	e1a00003 	mov	r0, r3
    8cb0:	e24bd004 	sub	sp, fp, #4
    8cb4:	e8bd8800 	pop	{fp, pc}

00008cb8 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    8cb8:	e92d4800 	push	{fp, lr}
    8cbc:	e28db004 	add	fp, sp, #4
    8cc0:	e24dd020 	sub	sp, sp, #32
    8cc4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8cc8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8ccc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8cd0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    8cd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8cd8:	e5d33000 	ldrb	r3, [r3]
    8cdc:	e7e33253 	ubfx	r3, r3, #4, #4
    8ce0:	e6ef3073 	uxtb	r3, r3
    8ce4:	e1a02003 	mov	r2, r3
    8ce8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8cec:	e1520003 	cmp	r2, r3
    8cf0:	ca000006 	bgt	8d10 <ipc_msg_get_nth_arg+0x58>
        printf("[%s] IPC: arg_num out of msg range", __func__);
    8cf4:	e30f1424 	movw	r1, #62500	; 0xf424
    8cf8:	e3401000 	movt	r1, #0
    8cfc:	e30f032c 	movw	r0, #62252	; 0xf32c
    8d00:	e3400000 	movt	r0, #0
    8d04:	ebfffeab 	bl	87b8 <printf>
        return false;
    8d08:	e3a03000 	mov	r3, #0
    8d0c:	ea000026 	b	8dac <ipc_msg_get_nth_arg+0xf4>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    8d10:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8d14:	e2833003 	add	r3, r3, #3
    8d18:	e1a03103 	lsl	r3, r3, #2
    8d1c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    8d20:	e0823003 	add	r3, r2, r3
    8d24:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    8d28:	e51b3008 	ldr	r3, [fp, #-8]
    8d2c:	e1d330b2 	ldrh	r3, [r3, #2]
    8d30:	e1a02003 	mov	r2, r3
    8d34:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8d38:	e1520003 	cmp	r2, r3
    8d3c:	aa000006 	bge	8d5c <ipc_msg_get_nth_arg+0xa4>
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    8d40:	e30f1424 	movw	r1, #62500	; 0xf424
    8d44:	e3401000 	movt	r1, #0
    8d48:	e30f0350 	movw	r0, #62288	; 0xf350
    8d4c:	e3400000 	movt	r0, #0
    8d50:	ebfffe98 	bl	87b8 <printf>
        return false;
    8d54:	e3a03000 	mov	r3, #0
    8d58:	ea000013 	b	8dac <ipc_msg_get_nth_arg+0xf4>
    8d5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8d60:	e50b3010 	str	r3, [fp, #-16]
    8d64:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8d68:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8d6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d70:	e2833003 	add	r3, r3, #3
    8d74:	e1a03103 	lsl	r3, r3, #2
    8d78:	e51b2010 	ldr	r2, [fp, #-16]
    8d7c:	e0823003 	add	r3, r2, r3
    8d80:	e1d330b0 	ldrh	r3, [r3]
    8d84:	e1a02003 	mov	r2, r3
    8d88:	e51b3010 	ldr	r3, [fp, #-16]
    8d8c:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    8d90:	e50b300c 	str	r3, [fp, #-12]
    memmove(data, buf, len);
    8d94:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8d98:	e1a02003 	mov	r2, r3
    8d9c:	e51b100c 	ldr	r1, [fp, #-12]
    8da0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    8da4:	eb0005f4 	bl	a57c <memmove>
    return true;
    8da8:	e3a03001 	mov	r3, #1
}
    8dac:	e1a00003 	mov	r0, r3
    8db0:	e24bd004 	sub	sp, fp, #4
    8db4:	e8bd8800 	pop	{fp, pc}

00008db8 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    8db8:	e92d4800 	push	{fp, lr}
    8dbc:	e28db004 	add	fp, sp, #4
    8dc0:	e24dd008 	sub	sp, sp, #8
    8dc4:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    8dc8:	e51b2008 	ldr	r2, [fp, #-8]
    8dcc:	e30d3cba 	movw	r3, #56506	; 0xdcba
    8dd0:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    8dd4:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    8dd8:	e51b2008 	ldr	r2, [fp, #-8]
    8ddc:	e5d23000 	ldrb	r3, [r2]
    8de0:	e3833001 	orr	r3, r3, #1
    8de4:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    8de8:	e51b2008 	ldr	r2, [fp, #-8]
    8dec:	e5d23000 	ldrb	r3, [r2]
    8df0:	e7c1309f 	bfc	r3, #1, #1
    8df4:	e5c23000 	strb	r3, [r2]
    while (msg->header.done == 0) {
    8df8:	ea000000 	b	8e00 <ipc_msg_send_wait+0x48>
        /// @todo syscall yield with prio decrease
        yield();
    8dfc:	eb0003e7 	bl	9da0 <yield>
    while (msg->header.done == 0) {
    8e00:	e51b3008 	ldr	r3, [fp, #-8]
    8e04:	e5d33000 	ldrb	r3, [r3]
    8e08:	e2033002 	and	r3, r3, #2
    8e0c:	e6ef3073 	uxtb	r3, r3
    8e10:	e3530000 	cmp	r3, #0
    8e14:	0afffff8 	beq	8dfc <ipc_msg_send_wait+0x44>
    }
    assert(msg->header.done == 1);
    8e18:	e51b3008 	ldr	r3, [fp, #-8]
    8e1c:	e5d33000 	ldrb	r3, [r3]
    8e20:	e2033002 	and	r3, r3, #2
    8e24:	e6ef3073 	uxtb	r3, r3
    8e28:	e3530000 	cmp	r3, #0
    8e2c:	1a000007 	bne	8e50 <ipc_msg_send_wait+0x98>
    8e30:	e30f337c 	movw	r3, #62332	; 0xf37c
    8e34:	e3403000 	movt	r3, #0
    8e38:	e30f2438 	movw	r2, #62520	; 0xf438
    8e3c:	e3402000 	movt	r2, #0
    8e40:	e3a0107e 	mov	r1, #126	; 0x7e
    8e44:	e30f0394 	movw	r0, #62356	; 0xf394
    8e48:	e3400000 	movt	r0, #0
    8e4c:	eb000531 	bl	a318 <__assert_func>
}
    8e50:	e320f000 	nop	{0}
    8e54:	e24bd004 	sub	sp, fp, #4
    8e58:	e8bd8800 	pop	{fp, pc}

00008e5c <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    8e5c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8e60:	e28db000 	add	fp, sp, #0
    8e64:	e24dd00c 	sub	sp, sp, #12
    8e68:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    8e6c:	e51b2008 	ldr	r2, [fp, #-8]
    8e70:	e30d3cba 	movw	r3, #56506	; 0xdcba
    8e74:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    8e78:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    8e7c:	e51b2008 	ldr	r2, [fp, #-8]
    8e80:	e5d23000 	ldrb	r3, [r2]
    8e84:	e3833001 	orr	r3, r3, #1
    8e88:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    8e8c:	e51b2008 	ldr	r2, [fp, #-8]
    8e90:	e5d23000 	ldrb	r3, [r2]
    8e94:	e7c1309f 	bfc	r3, #1, #1
    8e98:	e5c23000 	strb	r3, [r2]
}
    8e9c:	e320f000 	nop	{0}
    8ea0:	e28bd000 	add	sp, fp, #0
    8ea4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8ea8:	e12fff1e 	bx	lr

00008eac <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    8eac:	e92d4800 	push	{fp, lr}
    8eb0:	e28db004 	add	fp, sp, #4
    8eb4:	e24dd010 	sub	sp, sp, #16
    8eb8:	e50b0010 	str	r0, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    8ebc:	e51b3010 	ldr	r3, [fp, #-16]
    8ec0:	e5933010 	ldr	r3, [r3, #16]
    8ec4:	e51b2010 	ldr	r2, [fp, #-16]
    8ec8:	e5922008 	ldr	r2, [r2, #8]
    8ecc:	e0833002 	add	r3, r3, r2
    8ed0:	e50b3008 	str	r3, [fp, #-8]
    while (msg->header.done == 0) {
    8ed4:	ea000000 	b	8edc <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield();
    8ed8:	eb0003b0 	bl	9da0 <yield>
    while (msg->header.done == 0) {
    8edc:	e51b3008 	ldr	r3, [fp, #-8]
    8ee0:	e5d33000 	ldrb	r3, [r3]
    8ee4:	e2033002 	and	r3, r3, #2
    8ee8:	e6ef3073 	uxtb	r3, r3
    8eec:	e3530000 	cmp	r3, #0
    8ef0:	0afffff8 	beq	8ed8 <ipc_session_wait+0x2c>
    }
    assert(msg->header.done == 1);
    8ef4:	e51b3008 	ldr	r3, [fp, #-8]
    8ef8:	e5d33000 	ldrb	r3, [r3]
    8efc:	e2033002 	and	r3, r3, #2
    8f00:	e6ef3073 	uxtb	r3, r3
    8f04:	e3530000 	cmp	r3, #0
    8f08:	1a000007 	bne	8f2c <ipc_session_wait+0x80>
    8f0c:	e30f337c 	movw	r3, #62332	; 0xf37c
    8f10:	e3403000 	movt	r3, #0
    8f14:	e30f244c 	movw	r2, #62540	; 0xf44c
    8f18:	e3402000 	movt	r2, #0
    8f1c:	e3a0108f 	mov	r1, #143	; 0x8f
    8f20:	e30f0394 	movw	r0, #62356	; 0xf394
    8f24:	e3400000 	movt	r0, #0
    8f28:	eb0004fa 	bl	a318 <__assert_func>
    return msg->header.ret_val;
    8f2c:	e51b3008 	ldr	r3, [fp, #-8]
    8f30:	e5933008 	ldr	r3, [r3, #8]
}
    8f34:	e1a00003 	mov	r0, r3
    8f38:	e24bd004 	sub	sp, fp, #4
    8f3c:	e8bd8800 	pop	{fp, pc}

00008f40 <cur_session_id>:

static int cur_sess_id = -1;
int cur_session_id(void)
{
    8f40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8f44:	e28db000 	add	fp, sp, #0
    return cur_sess_id;
    8f48:	e30f3b68 	movw	r3, #64360	; 0xfb68
    8f4c:	e3403000 	movt	r3, #0
    8f50:	e5933000 	ldr	r3, [r3]
}
    8f54:	e1a00003 	mov	r0, r3
    8f58:	e28bd000 	add	sp, fp, #0
    8f5c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8f60:	e12fff1e 	bx	lr

00008f64 <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    8f64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8f68:	e28db000 	add	fp, sp, #0
    session_delayed = true;
    8f6c:	e3003534 	movw	r3, #1332	; 0x534
    8f70:	e3403001 	movt	r3, #1
    8f74:	e3a02001 	mov	r2, #1
    8f78:	e5c32000 	strb	r2, [r3]
}
    8f7c:	e320f000 	nop	{0}
    8f80:	e28bd000 	add	sp, fp, #0
    8f84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8f88:	e12fff1e 	bx	lr

00008f8c <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    8f8c:	e92d4810 	push	{r4, fp, lr}
    8f90:	e28db008 	add	fp, sp, #8
    8f94:	e24ddf5d 	sub	sp, sp, #372	; 0x174
    8f98:	e50b0178 	str	r0, [fp, #-376]	; 0xfffffe88
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
    8f9c:	e24b3e17 	sub	r3, fp, #368	; 0x170
    8fa0:	e3a01010 	mov	r1, #16
    8fa4:	e1a00003 	mov	r0, r3
    8fa8:	eb0003ab 	bl	9e5c <poll_session>
        /* handle each session */
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    8fac:	e3a03000 	mov	r3, #0
    8fb0:	e50b3010 	str	r3, [fp, #-16]
    8fb4:	ea000102 	b	93c4 <ipc_server_loop+0x438>
            if (session_list[i].buf == NULL) {
    8fb8:	e51b2010 	ldr	r2, [fp, #-16]
    8fbc:	e1a03002 	mov	r3, r2
    8fc0:	e1a03103 	lsl	r3, r3, #2
    8fc4:	e0833002 	add	r3, r3, r2
    8fc8:	e1a03103 	lsl	r3, r3, #2
    8fcc:	e24b200c 	sub	r2, fp, #12
    8fd0:	e0823003 	add	r3, r2, r3
    8fd4:	e2433f55 	sub	r3, r3, #340	; 0x154
    8fd8:	e5933000 	ldr	r3, [r3]
    8fdc:	e3530000 	cmp	r3, #0
    8fe0:	1a000001 	bne	8fec <ipc_server_loop+0x60>
                yield();
    8fe4:	eb00036d 	bl	9da0 <yield>
                break;
    8fe8:	ea0000f8 	b	93d0 <ipc_server_loop+0x444>
            }
            cur_sess_id = session_list[i].id;
    8fec:	e51b2010 	ldr	r2, [fp, #-16]
    8ff0:	e1a03002 	mov	r3, r2
    8ff4:	e1a03103 	lsl	r3, r3, #2
    8ff8:	e0833002 	add	r3, r3, r2
    8ffc:	e1a03103 	lsl	r3, r3, #2
    9000:	e24b200c 	sub	r2, fp, #12
    9004:	e0823003 	add	r3, r2, r3
    9008:	e2433f59 	sub	r3, r3, #356	; 0x164
    900c:	e5932000 	ldr	r2, [r3]
    9010:	e30f3b68 	movw	r3, #64360	; 0xfb68
    9014:	e3403000 	movt	r3, #0
    9018:	e5832000 	str	r2, [r3]
            struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
    901c:	e51b2010 	ldr	r2, [fp, #-16]
    9020:	e1a03002 	mov	r3, r2
    9024:	e1a03103 	lsl	r3, r3, #2
    9028:	e0833002 	add	r3, r3, r2
    902c:	e1a03103 	lsl	r3, r3, #2
    9030:	e24b200c 	sub	r2, fp, #12
    9034:	e0823003 	add	r3, r2, r3
    9038:	e2433f55 	sub	r3, r3, #340	; 0x154
    903c:	e5931000 	ldr	r1, [r3]
    9040:	e51b2010 	ldr	r2, [fp, #-16]
    9044:	e1a03002 	mov	r3, r2
    9048:	e1a03103 	lsl	r3, r3, #2
    904c:	e0833002 	add	r3, r3, r2
    9050:	e1a03103 	lsl	r3, r3, #2
    9054:	e24b200c 	sub	r2, fp, #12
    9058:	e0823003 	add	r3, r2, r3
    905c:	e2433f57 	sub	r3, r3, #348	; 0x15c
    9060:	e5933000 	ldr	r3, [r3]
    9064:	e0813003 	add	r3, r1, r3
    9068:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            /* handle every message in current session
                a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                interfaces[opcode] should explicitly call delay_session() and return to delay this session
            */
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    906c:	ea0000b9 	b	9358 <ipc_server_loop+0x3cc>
                // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
    9070:	e24b1e17 	sub	r1, fp, #368	; 0x170
    9074:	e51b2010 	ldr	r2, [fp, #-16]
    9078:	e1a03002 	mov	r3, r2
    907c:	e1a03103 	lsl	r3, r3, #2
    9080:	e0833002 	add	r3, r3, r2
    9084:	e1a03103 	lsl	r3, r3, #2
    9088:	e0813003 	add	r3, r1, r3
    908c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9090:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9094:	e593200c 	ldr	r2, [r3, #12]
    9098:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    909c:	e5933004 	ldr	r3, [r3, #4]
    90a0:	e0822003 	add	r2, r2, r3
    90a4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    90a8:	e5933008 	ldr	r3, [r3, #8]
    90ac:	e0422003 	sub	r2, r2, r3
    90b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    90b4:	e5933004 	ldr	r3, [r3, #4]
    90b8:	e1a01003 	mov	r1, r3
    90bc:	e1a00002 	mov	r0, r2
    90c0:	eb00048b 	bl	a2f4 <__aeabi_idivmod>
    90c4:	e1a03001 	mov	r3, r1
    90c8:	e3530000 	cmp	r3, #0
    90cc:	1a000038 	bne	91b4 <ipc_server_loop+0x228>
    90d0:	e24b1e17 	sub	r1, fp, #368	; 0x170
    90d4:	e51b2010 	ldr	r2, [fp, #-16]
    90d8:	e1a03002 	mov	r3, r2
    90dc:	e1a03103 	lsl	r3, r3, #2
    90e0:	e0833002 	add	r3, r3, r2
    90e4:	e1a03103 	lsl	r3, r3, #2
    90e8:	e0813003 	add	r3, r1, r3
    90ec:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    90f0:	e1d220b2 	ldrh	r2, [r2, #2]
    90f4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    90f8:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    90fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9100:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
}

__attribute__((__always_inline__)) static inline int session_remain_capacity(struct Session* session)
{
    return session->capacity - session_used_size(session);
    9104:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9108:	e5934004 	ldr	r4, [r3, #4]
    910c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9110:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9114:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9118:	e593200c 	ldr	r2, [r3, #12]
    911c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9120:	e5933004 	ldr	r3, [r3, #4]
    9124:	e0822003 	add	r2, r2, r3
    9128:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    912c:	e5933008 	ldr	r3, [r3, #8]
    9130:	e0422003 	sub	r2, r2, r3
    9134:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9138:	e5933004 	ldr	r3, [r3, #4]
    913c:	e1a01003 	mov	r1, r3
    9140:	e1a00002 	mov	r0, r2
    9144:	eb00046a 	bl	a2f4 <__aeabi_idivmod>
    9148:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    914c:	e0443003 	sub	r3, r4, r3
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    9150:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    9154:	e1520003 	cmp	r2, r3
    9158:	da000004 	ble	9170 <ipc_server_loop+0x1e4>
        printf("forward tail with too much size\n");
    915c:	e30f03a0 	movw	r0, #62368	; 0xf3a0
    9160:	e3400000 	movt	r0, #0
    9164:	ebfffd93 	bl	87b8 <printf>
        return -1;
    9168:	e3e03000 	mvn	r3, #0
    916c:	ea00000e 	b	91ac <ipc_server_loop+0x220>
    }
    session->tail = (session->tail + len) % session->capacity;
    9170:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9174:	e593200c 	ldr	r2, [r3, #12]
    9178:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    917c:	e0822003 	add	r2, r2, r3
    9180:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9184:	e5933004 	ldr	r3, [r3, #4]
    9188:	e1a01003 	mov	r1, r3
    918c:	e1a00002 	mov	r0, r2
    9190:	eb000457 	bl	a2f4 <__aeabi_idivmod>
    9194:	e1a03001 	mov	r3, r1
    9198:	e1a02003 	mov	r2, r3
    919c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    91a0:	e583200c 	str	r2, [r3, #12]
    return session->tail;
    91a4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    91a8:	e593300c 	ldr	r3, [r3, #12]
    91ac:	e3530000 	cmp	r3, #0
    91b0:	ba00007b 	blt	93a4 <ipc_server_loop+0x418>
                    break;
                }
                if (ipc_node->interfaces[msg->header.opcode]) {
    91b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    91b8:	e5d33001 	ldrb	r3, [r3, #1]
    91bc:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    91c0:	e1a03103 	lsl	r3, r3, #2
    91c4:	e0823003 	add	r3, r2, r3
    91c8:	e5933004 	ldr	r3, [r3, #4]
    91cc:	e3530000 	cmp	r3, #0
    91d0:	0a000011 	beq	921c <ipc_server_loop+0x290>
                    ipc_node->interfaces[msg->header.opcode](msg);
    91d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    91d8:	e5d33001 	ldrb	r3, [r3, #1]
    91dc:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    91e0:	e1a03103 	lsl	r3, r3, #2
    91e4:	e0823003 	add	r3, r2, r3
    91e8:	e5933004 	ldr	r3, [r3, #4]
    91ec:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    91f0:	e12fff33 	blx	r3
                    // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                    if (session_delayed) {
    91f4:	e3003534 	movw	r3, #1332	; 0x534
    91f8:	e3403001 	movt	r3, #1
    91fc:	e5d33000 	ldrb	r3, [r3]
    9200:	e3530000 	cmp	r3, #0
    9204:	0a00000f 	beq	9248 <ipc_server_loop+0x2bc>
                        session_delayed = false;
    9208:	e3003534 	movw	r3, #1332	; 0x534
    920c:	e3403001 	movt	r3, #1
    9210:	e3a02000 	mov	r2, #0
    9214:	e5c32000 	strb	r2, [r3]
                        break;
    9218:	ea000062 	b	93a8 <ipc_server_loop+0x41c>
                    }
                } else {
                    printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
    921c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9220:	e5d33001 	ldrb	r3, [r3, #1]
    9224:	e1a01003 	mov	r1, r3
    9228:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    922c:	e5933000 	ldr	r3, [r3]
    9230:	e1a02003 	mov	r2, r3
    9234:	e30f03c4 	movw	r0, #62404	; 0xf3c4
    9238:	e3400000 	movt	r0, #0
    923c:	ebfffd5d 	bl	87b8 <printf>
                }
                // finish this message in server's perspective
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    9240:	ea000000 	b	9248 <ipc_server_loop+0x2bc>
                    yield();
    9244:	eb0002d5 	bl	9da0 <yield>
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    9248:	e24b1e17 	sub	r1, fp, #368	; 0x170
    924c:	e51b2010 	ldr	r2, [fp, #-16]
    9250:	e1a03002 	mov	r3, r2
    9254:	e1a03103 	lsl	r3, r3, #2
    9258:	e0833002 	add	r3, r3, r2
    925c:	e1a03103 	lsl	r3, r3, #2
    9260:	e0813003 	add	r3, r1, r3
    9264:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9268:	e1d220b2 	ldrh	r2, [r2, #2]
    926c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9270:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    if (((session->head + len) % session->capacity) > session->tail) {
    9274:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9278:	e5932008 	ldr	r2, [r3, #8]
    927c:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9280:	e0822003 	add	r2, r2, r3
    9284:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9288:	e5933004 	ldr	r3, [r3, #4]
    928c:	e1a01003 	mov	r1, r3
    9290:	e1a00002 	mov	r0, r2
    9294:	eb000416 	bl	a2f4 <__aeabi_idivmod>
    9298:	e1a03001 	mov	r3, r1
    929c:	e1a02003 	mov	r2, r3
    92a0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    92a4:	e593300c 	ldr	r3, [r3, #12]
    92a8:	e1520003 	cmp	r2, r3
    92ac:	da000004 	ble	92c4 <ipc_server_loop+0x338>
        printf("forward head with too much size\n");
    92b0:	e30f03ec 	movw	r0, #62444	; 0xf3ec
    92b4:	e3400000 	movt	r0, #0
    92b8:	ebfffd3e 	bl	87b8 <printf>
        return -1;
    92bc:	e3e03000 	mvn	r3, #0
    92c0:	ea00000e 	b	9300 <ipc_server_loop+0x374>
    session->head = (session->head + len) % session->capacity;
    92c4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    92c8:	e5932008 	ldr	r2, [r3, #8]
    92cc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    92d0:	e0822003 	add	r2, r2, r3
    92d4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    92d8:	e5933004 	ldr	r3, [r3, #4]
    92dc:	e1a01003 	mov	r1, r3
    92e0:	e1a00002 	mov	r0, r2
    92e4:	eb000402 	bl	a2f4 <__aeabi_idivmod>
    92e8:	e1a03001 	mov	r3, r1
    92ec:	e1a02003 	mov	r2, r3
    92f0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    92f4:	e5832008 	str	r2, [r3, #8]
    return session->head;
    92f8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    92fc:	e5933008 	ldr	r3, [r3, #8]
    9300:	e3530000 	cmp	r3, #0
    9304:	baffffce 	blt	9244 <ipc_server_loop+0x2b8>
                }
                msg = IPCSESSION_MSG(&session_list[i]);
    9308:	e51b2010 	ldr	r2, [fp, #-16]
    930c:	e1a03002 	mov	r3, r2
    9310:	e1a03103 	lsl	r3, r3, #2
    9314:	e0833002 	add	r3, r3, r2
    9318:	e1a03103 	lsl	r3, r3, #2
    931c:	e24b200c 	sub	r2, fp, #12
    9320:	e0823003 	add	r3, r2, r3
    9324:	e2433f55 	sub	r3, r3, #340	; 0x154
    9328:	e5931000 	ldr	r1, [r3]
    932c:	e51b2010 	ldr	r2, [fp, #-16]
    9330:	e1a03002 	mov	r3, r2
    9334:	e1a03103 	lsl	r3, r3, #2
    9338:	e0833002 	add	r3, r3, r2
    933c:	e1a03103 	lsl	r3, r3, #2
    9340:	e24b200c 	sub	r2, fp, #12
    9344:	e0823003 	add	r3, r2, r3
    9348:	e2433f57 	sub	r3, r3, #348	; 0x15c
    934c:	e5933000 	ldr	r3, [r3]
    9350:	e0813003 	add	r3, r1, r3
    9354:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    9358:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    935c:	e5932004 	ldr	r2, [r3, #4]
    9360:	e30d3cba 	movw	r3, #56506	; 0xdcba
    9364:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    9368:	e1520003 	cmp	r2, r3
    936c:	1a00000d 	bne	93a8 <ipc_server_loop+0x41c>
    9370:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9374:	e5d33000 	ldrb	r3, [r3]
    9378:	e2033001 	and	r3, r3, #1
    937c:	e6ef3073 	uxtb	r3, r3
    9380:	e3530000 	cmp	r3, #0
    9384:	0a000007 	beq	93a8 <ipc_server_loop+0x41c>
    9388:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    938c:	e5d33000 	ldrb	r3, [r3]
    9390:	e2033002 	and	r3, r3, #2
    9394:	e6ef3073 	uxtb	r3, r3
    9398:	e3530000 	cmp	r3, #0
    939c:	0affff33 	beq	9070 <ipc_server_loop+0xe4>
    93a0:	ea000000 	b	93a8 <ipc_server_loop+0x41c>
                    break;
    93a4:	e320f000 	nop	{0}
            }
            // stop handle this session
            cur_sess_id = -1;
    93a8:	e30f3b68 	movw	r3, #64360	; 0xfb68
    93ac:	e3403000 	movt	r3, #0
    93b0:	e3e02000 	mvn	r2, #0
    93b4:	e5832000 	str	r2, [r3]
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    93b8:	e51b3010 	ldr	r3, [fp, #-16]
    93bc:	e2833001 	add	r3, r3, #1
    93c0:	e50b3010 	str	r3, [fp, #-16]
    93c4:	e51b3010 	ldr	r3, [fp, #-16]
    93c8:	e353000f 	cmp	r3, #15
    93cc:	dafffef9 	ble	8fb8 <ipc_server_loop+0x2c>
        poll_session(session_list, NR_MAX_SESSION);
    93d0:	eafffef1 	b	8f9c <ipc_server_loop+0x10>

000093d4 <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    93d4:	e92d4800 	push	{fp, lr}
    93d8:	e28db004 	add	fp, sp, #4
    93dc:	e24dd010 	sub	sp, sp, #16
    93e0:	e50b0008 	str	r0, [fp, #-8]
    93e4:	e50b100c 	str	r1, [fp, #-12]
    93e8:	e50b2010 	str	r2, [fp, #-16]
    return session(_path, _capacity, _session);
    93ec:	e51b2008 	ldr	r2, [fp, #-8]
    93f0:	e51b1010 	ldr	r1, [fp, #-16]
    93f4:	e51b000c 	ldr	r0, [fp, #-12]
    93f8:	eb000285 	bl	9e14 <session>
    93fc:	e1a03000 	mov	r3, r0
}
    9400:	e1a00003 	mov	r0, r3
    9404:	e24bd004 	sub	sp, fp, #4
    9408:	e8bd8800 	pop	{fp, pc}

0000940c <free_session>:

int free_session(struct Session* session)
{
    940c:	e92d4800 	push	{fp, lr}
    9410:	e28db004 	add	fp, sp, #4
    9414:	e24dd008 	sub	sp, sp, #8
    9418:	e50b0008 	str	r0, [fp, #-8]
    return close_session(session);
    941c:	e51b0008 	ldr	r0, [fp, #-8]
    9420:	eb00029d 	bl	9e9c <close_session>
    9424:	e1a03000 	mov	r3, r0
}
    9428:	e1a00003 	mov	r0, r3
    942c:	e24bd004 	sub	sp, fp, #4
    9430:	e8bd8800 	pop	{fp, pc}

00009434 <session_alloc_buf>:

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    9434:	e92d4810 	push	{r4, fp, lr}
    9438:	e28db008 	add	fp, sp, #8
    943c:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    9440:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    9444:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    9448:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    944c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return session->capacity - session_used_size(session);
    9450:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9454:	e5934004 	ldr	r4, [r3, #4]
    9458:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    945c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9460:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9464:	e593200c 	ldr	r2, [r3, #12]
    9468:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    946c:	e5933004 	ldr	r3, [r3, #4]
    9470:	e0822003 	add	r2, r2, r3
    9474:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9478:	e5933008 	ldr	r3, [r3, #8]
    947c:	e0422003 	sub	r2, r2, r3
    9480:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9484:	e5933004 	ldr	r3, [r3, #4]
    9488:	e1a01003 	mov	r1, r3
    948c:	e1a00002 	mov	r0, r2
    9490:	eb000397 	bl	a2f4 <__aeabi_idivmod>
    9494:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    9498:	e0442003 	sub	r2, r4, r3
    if (len > session_remain_capacity(session)) {
    949c:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    94a0:	e1520003 	cmp	r2, r3
    94a4:	aa000001 	bge	94b0 <session_alloc_buf+0x7c>
        return NULL;
    94a8:	e3a03000 	mov	r3, #0
    94ac:	ea000038 	b	9594 <session_alloc_buf+0x160>
    }
    void* buf = session->buf + session->tail;
    94b0:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    94b4:	e5933010 	ldr	r3, [r3, #16]
    94b8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    94bc:	e592200c 	ldr	r2, [r2, #12]
    94c0:	e0833002 	add	r3, r3, r2
    94c4:	e50b3010 	str	r3, [fp, #-16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    94c8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    94cc:	e1a02003 	mov	r2, r3
    94d0:	e3a01000 	mov	r1, #0
    94d4:	e51b0010 	ldr	r0, [fp, #-16]
    94d8:	eb000479 	bl	a6c4 <memset>
    94dc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    94e0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    94e4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    94e8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    94ec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    94f0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    94f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    94f8:	e5934004 	ldr	r4, [r3, #4]
    94fc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9500:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    9504:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9508:	e593200c 	ldr	r2, [r3, #12]
    950c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9510:	e5933004 	ldr	r3, [r3, #4]
    9514:	e0822003 	add	r2, r2, r3
    9518:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    951c:	e5933008 	ldr	r3, [r3, #8]
    9520:	e0422003 	sub	r2, r2, r3
    9524:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9528:	e5933004 	ldr	r3, [r3, #4]
    952c:	e1a01003 	mov	r1, r3
    9530:	e1a00002 	mov	r0, r2
    9534:	eb00036e 	bl	a2f4 <__aeabi_idivmod>
    9538:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    953c:	e0443003 	sub	r3, r4, r3
    if (len > session_remain_capacity(session)) {
    9540:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    9544:	e1520003 	cmp	r2, r3
    9548:	da000003 	ble	955c <session_alloc_buf+0x128>
        printf("forward tail with too much size\n");
    954c:	e30f0460 	movw	r0, #62560	; 0xf460
    9550:	e3400000 	movt	r0, #0
    9554:	ebfffc97 	bl	87b8 <printf>
    9558:	ea00000c 	b	9590 <session_alloc_buf+0x15c>
    session->tail = (session->tail + len) % session->capacity;
    955c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9560:	e593200c 	ldr	r2, [r3, #12]
    9564:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9568:	e0822003 	add	r2, r2, r3
    956c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9570:	e5933004 	ldr	r3, [r3, #4]
    9574:	e1a01003 	mov	r1, r3
    9578:	e1a00002 	mov	r0, r2
    957c:	eb00035c 	bl	a2f4 <__aeabi_idivmod>
    9580:	e1a03001 	mov	r3, r1
    9584:	e1a02003 	mov	r2, r3
    9588:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    958c:	e583200c 	str	r2, [r3, #12]
    session_forward_tail(session, len);
    return buf;
    9590:	e51b3010 	ldr	r3, [fp, #-16]
}
    9594:	e1a00003 	mov	r0, r3
    9598:	e24bd008 	sub	sp, fp, #8
    959c:	e8bd8810 	pop	{r4, fp, pc}

000095a0 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    95a0:	e92d4800 	push	{fp, lr}
    95a4:	e28db004 	add	fp, sp, #4
    95a8:	e24dd018 	sub	sp, sp, #24
    95ac:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    95b0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    95b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    95b8:	e50b3008 	str	r3, [fp, #-8]
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    95bc:	e51b3008 	ldr	r3, [fp, #-8]
    95c0:	e593200c 	ldr	r2, [r3, #12]
    95c4:	e51b3008 	ldr	r3, [fp, #-8]
    95c8:	e5933004 	ldr	r3, [r3, #4]
    95cc:	e0822003 	add	r2, r2, r3
    95d0:	e51b3008 	ldr	r3, [fp, #-8]
    95d4:	e5933008 	ldr	r3, [r3, #8]
    95d8:	e0422003 	sub	r2, r2, r3
    95dc:	e51b3008 	ldr	r3, [fp, #-8]
    95e0:	e5933004 	ldr	r3, [r3, #4]
    95e4:	e1a01003 	mov	r1, r3
    95e8:	e1a00002 	mov	r0, r2
    95ec:	eb000340 	bl	a2f4 <__aeabi_idivmod>
    95f0:	e1a03001 	mov	r3, r1
    95f4:	e1a02003 	mov	r2, r3
    if (len > session_used_size(session)) {
    95f8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    95fc:	e1520003 	cmp	r2, r3
    9600:	aa000001 	bge	960c <session_free_buf+0x6c>
        return false;
    9604:	e3a03000 	mov	r3, #0
    9608:	ea000031 	b	96d4 <session_free_buf+0x134>
    960c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9610:	e50b300c 	str	r3, [fp, #-12]
    9614:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9618:	e50b3010 	str	r3, [fp, #-16]
    if (((session->head + len) % session->capacity) > session->tail) {
    961c:	e51b300c 	ldr	r3, [fp, #-12]
    9620:	e5932008 	ldr	r2, [r3, #8]
    9624:	e51b3010 	ldr	r3, [fp, #-16]
    9628:	e0822003 	add	r2, r2, r3
    962c:	e51b300c 	ldr	r3, [fp, #-12]
    9630:	e5933004 	ldr	r3, [r3, #4]
    9634:	e1a01003 	mov	r1, r3
    9638:	e1a00002 	mov	r0, r2
    963c:	eb00032c 	bl	a2f4 <__aeabi_idivmod>
    9640:	e1a03001 	mov	r3, r1
    9644:	e1a02003 	mov	r2, r3
    9648:	e51b300c 	ldr	r3, [fp, #-12]
    964c:	e593300c 	ldr	r3, [r3, #12]
    9650:	e1520003 	cmp	r2, r3
    9654:	da000004 	ble	966c <session_free_buf+0xcc>
        printf("forward head with too much size\n");
    9658:	e30f0484 	movw	r0, #62596	; 0xf484
    965c:	e3400000 	movt	r0, #0
    9660:	ebfffc54 	bl	87b8 <printf>
        return -1;
    9664:	e3e03000 	mvn	r3, #0
    9668:	ea00000e 	b	96a8 <session_free_buf+0x108>
    session->head = (session->head + len) % session->capacity;
    966c:	e51b300c 	ldr	r3, [fp, #-12]
    9670:	e5932008 	ldr	r2, [r3, #8]
    9674:	e51b3010 	ldr	r3, [fp, #-16]
    9678:	e0822003 	add	r2, r2, r3
    967c:	e51b300c 	ldr	r3, [fp, #-12]
    9680:	e5933004 	ldr	r3, [r3, #4]
    9684:	e1a01003 	mov	r1, r3
    9688:	e1a00002 	mov	r0, r2
    968c:	eb000318 	bl	a2f4 <__aeabi_idivmod>
    9690:	e1a03001 	mov	r3, r1
    9694:	e1a02003 	mov	r2, r3
    9698:	e51b300c 	ldr	r3, [fp, #-12]
    969c:	e5832008 	str	r2, [r3, #8]
    return session->head;
    96a0:	e51b300c 	ldr	r3, [fp, #-12]
    96a4:	e5933008 	ldr	r3, [r3, #8]
    }
    assert(session_forward_head(session, len) != 1);
    96a8:	e3530001 	cmp	r3, #1
    96ac:	1a000007 	bne	96d0 <session_free_buf+0x130>
    96b0:	e30f34a8 	movw	r3, #62632	; 0xf4a8
    96b4:	e3403000 	movt	r3, #0
    96b8:	e30f24dc 	movw	r2, #62684	; 0xf4dc
    96bc:	e3402000 	movt	r2, #0
    96c0:	e3a01040 	mov	r1, #64	; 0x40
    96c4:	e30f04d0 	movw	r0, #62672	; 0xf4d0
    96c8:	e3400000 	movt	r0, #0
    96cc:	eb000311 	bl	a318 <__assert_func>
    return true;
    96d0:	e3a03001 	mov	r3, #1
}
    96d4:	e1a00003 	mov	r0, r3
    96d8:	e24bd004 	sub	sp, fp, #4
    96dc:	e8bd8800 	pop	{fp, pc}

000096e0 <ipc_call_copy_args_Ipc_add>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "simple_service.h"

IPC_INTERFACE(Ipc_add, 2, a, b, sizeof(int), sizeof(int));
    96e0:	e92d4800 	push	{fp, lr}
    96e4:	e28db004 	add	fp, sp, #4
    96e8:	e24dd060 	sub	sp, sp, #96	; 0x60
    96ec:	e50b0058 	str	r0, [fp, #-88]	; 0xffffffa8
    96f0:	e50b105c 	str	r1, [fp, #-92]	; 0xffffffa4
    96f4:	e50b2060 	str	r2, [fp, #-96]	; 0xffffffa0
    96f8:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    96fc:	e3530000 	cmp	r3, #0
    9700:	1a000001 	bne	970c <ipc_call_copy_args_Ipc_add+0x2c>
    9704:	e3e03000 	mvn	r3, #0
    9708:	ea000077 	b	98ec <ipc_call_copy_args_Ipc_add+0x20c>
    970c:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9710:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9714:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9718:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    971c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9720:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9724:	e30f3558 	movw	r3, #62808	; 0xf558
    9728:	e3403000 	movt	r3, #0
    972c:	e24b2054 	sub	r2, fp, #84	; 0x54
    9730:	e8930003 	ldm	r3, {r0, r1}
    9734:	e8820003 	stm	r2, {r0, r1}
    9738:	e24b3054 	sub	r3, fp, #84	; 0x54
    973c:	e1a02003 	mov	r2, r3
    9740:	e3a01002 	mov	r1, #2
    9744:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
    9748:	ebfffca5 	bl	89e4 <new_ipc_msg>
    974c:	e1a03000 	mov	r3, r0
    9750:	e50b3008 	str	r3, [fp, #-8]
    9754:	e51b3008 	ldr	r3, [fp, #-8]
    9758:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    975c:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9760:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9764:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9768:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    976c:	e3a03004 	mov	r3, #4
    9770:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
    9774:	e3a01000 	mov	r1, #0
    9778:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    977c:	ebfffd05 	bl	8b98 <ipc_msg_set_nth_arg>
    9780:	e3a03004 	mov	r3, #4
    9784:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
    9788:	e3a01001 	mov	r1, #1
    978c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9790:	ebfffd00 	bl	8b98 <ipc_msg_set_nth_arg>
    9794:	e3a03001 	mov	r3, #1
    9798:	e50b300c 	str	r3, [fp, #-12]
    979c:	e51b3008 	ldr	r3, [fp, #-8]
    97a0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    97a4:	e3a03001 	mov	r3, #1
    97a8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
/// @param msg
/// @param opcode
/// @return
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
    97ac:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    97b0:	e3530000 	cmp	r3, #0
    97b4:	ba000002 	blt	97c4 <ipc_call_copy_args_Ipc_add+0xe4>
    97b8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    97bc:	e35300ff 	cmp	r3, #255	; 0xff
    97c0:	da000001 	ble	97cc <ipc_call_copy_args_Ipc_add+0xec>
        return false;
    97c4:	e3a03000 	mov	r3, #0
    97c8:	ea000004 	b	97e0 <ipc_call_copy_args_Ipc_add+0x100>
    }
    msg->header.opcode = opcode;
    97cc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    97d0:	e6ef2073 	uxtb	r2, r3
    97d4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    97d8:	e5c32001 	strb	r2, [r3, #1]
    return true;
    97dc:	e3a03001 	mov	r3, #1
    97e0:	e50b300c 	str	r3, [fp, #-12]
    97e4:	e51b0008 	ldr	r0, [fp, #-8]
    97e8:	ebfffd72 	bl	8db8 <ipc_msg_send_wait>
    97ec:	e51b3008 	ldr	r3, [fp, #-8]
    97f0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    97f4:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    97f8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    97fc:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9800:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9804:	e3a03004 	mov	r3, #4
    9808:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    980c:	e3a01000 	mov	r1, #0
    9810:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9814:	ebfffd27 	bl	8cb8 <ipc_msg_get_nth_arg>
    9818:	e3a03004 	mov	r3, #4
    981c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9820:	e3a01001 	mov	r1, #1
    9824:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9828:	ebfffd22 	bl	8cb8 <ipc_msg_get_nth_arg>
    982c:	e3a03001 	mov	r3, #1
    9830:	e50b300c 	str	r3, [fp, #-12]
    9834:	e3a03000 	mov	r3, #0
    9838:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    983c:	e51b3008 	ldr	r3, [fp, #-8]
    9840:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9844:	e24b304c 	sub	r3, fp, #76	; 0x4c
    9848:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    984c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9850:	e5d33000 	ldrb	r3, [r3]
    9854:	e2033002 	and	r3, r3, #2
    9858:	e6ef3073 	uxtb	r3, r3
    985c:	e3530000 	cmp	r3, #0
    9860:	1a000007 	bne	9884 <ipc_call_copy_args_Ipc_add+0x1a4>
    9864:	e30f34f0 	movw	r3, #62704	; 0xf4f0
    9868:	e3403000 	movt	r3, #0
    986c:	e30f2560 	movw	r2, #62816	; 0xf560
    9870:	e3402000 	movt	r2, #0
    9874:	e3a01074 	mov	r1, #116	; 0x74
    9878:	e30f0508 	movw	r0, #62728	; 0xf508
    987c:	e3400000 	movt	r0, #0
    9880:	eb0002a4 	bl	a318 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9884:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9888:	e2833008 	add	r3, r3, #8
    988c:	e3a02004 	mov	r2, #4
    9890:	e1a01003 	mov	r1, r3
    9894:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9898:	eb0002f2 	bl	a468 <memcpy>
    989c:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    98a0:	e50b3010 	str	r3, [fp, #-16]
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    98a4:	e51b3010 	ldr	r3, [fp, #-16]
    98a8:	e5933010 	ldr	r3, [r3, #16]
    98ac:	e51b2010 	ldr	r2, [fp, #-16]
    98b0:	e5922008 	ldr	r2, [r2, #8]
    98b4:	e0833002 	add	r3, r3, r2
    98b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    98bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98c0:	e5d33000 	ldrb	r3, [r3]
    98c4:	e2033004 	and	r3, r3, #4
    98c8:	e6ef3073 	uxtb	r3, r3
    98cc:	e3530000 	cmp	r3, #0
    98d0:	0a000004 	beq	98e8 <ipc_call_copy_args_Ipc_add+0x208>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    98d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    98d8:	e1d330b2 	ldrh	r3, [r3, #2]
    98dc:	e1a01003 	mov	r1, r3
    98e0:	e51b0010 	ldr	r0, [fp, #-16]
    98e4:	ebffff2d 	bl	95a0 <session_free_buf>
    98e8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    98ec:	e1a00003 	mov	r0, r3
    98f0:	e24bd004 	sub	sp, fp, #4
    98f4:	e8bd8800 	pop	{fp, pc}

000098f8 <add>:
int add(struct Session* session, int a, int b)
{
    98f8:	e92d4800 	push	{fp, lr}
    98fc:	e28db004 	add	fp, sp, #4
    9900:	e24dd010 	sub	sp, sp, #16
    9904:	e50b0008 	str	r0, [fp, #-8]
    9908:	e50b100c 	str	r1, [fp, #-12]
    990c:	e50b2010 	str	r2, [fp, #-16]
    return IPC_CALL(Ipc_add)(session, &a, &b);
    9910:	e24b2010 	sub	r2, fp, #16
    9914:	e24b300c 	sub	r3, fp, #12
    9918:	e1a01003 	mov	r1, r3
    991c:	e51b0008 	ldr	r0, [fp, #-8]
    9920:	ebffff6e 	bl	96e0 <ipc_call_copy_args_Ipc_add>
    9924:	e1a03000 	mov	r3, r0
}
    9928:	e1a00003 	mov	r0, r3
    992c:	e24bd004 	sub	sp, fp, #4
    9930:	e8bd8800 	pop	{fp, pc}

00009934 <ipc_call_copy_args_Ipc_hello_string>:

IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    9934:	e92d4800 	push	{fp, lr}
    9938:	e28db004 	add	fp, sp, #4
    993c:	e24dd060 	sub	sp, sp, #96	; 0x60
    9940:	e50b0058 	str	r0, [fp, #-88]	; 0xffffffa8
    9944:	e50b105c 	str	r1, [fp, #-92]	; 0xffffffa4
    9948:	e50b2060 	str	r2, [fp, #-96]	; 0xffffffa0
    994c:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9950:	e3530000 	cmp	r3, #0
    9954:	1a000001 	bne	9960 <ipc_call_copy_args_Ipc_hello_string+0x2c>
    9958:	e3e03000 	mvn	r3, #0
    995c:	ea000079 	b	9b48 <ipc_call_copy_args_Ipc_hello_string+0x214>
    9960:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9964:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9968:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    996c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9970:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9974:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    9978:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    997c:	e5933000 	ldr	r3, [r3]
    9980:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    9984:	e3a03004 	mov	r3, #4
    9988:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    998c:	e24b3054 	sub	r3, fp, #84	; 0x54
    9990:	e1a02003 	mov	r2, r3
    9994:	e3a01002 	mov	r1, #2
    9998:	e51b0040 	ldr	r0, [fp, #-64]	; 0xffffffc0
    999c:	ebfffc10 	bl	89e4 <new_ipc_msg>
    99a0:	e1a03000 	mov	r3, r0
    99a4:	e50b3008 	str	r3, [fp, #-8]
    99a8:	e51b3008 	ldr	r3, [fp, #-8]
    99ac:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    99b0:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    99b4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    99b8:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    99bc:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    99c0:	e51b303c 	ldr	r3, [fp, #-60]	; 0xffffffc4
    99c4:	e5933000 	ldr	r3, [r3]
    99c8:	e51b2038 	ldr	r2, [fp, #-56]	; 0xffffffc8
    99cc:	e3a01000 	mov	r1, #0
    99d0:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    99d4:	ebfffc6f 	bl	8b98 <ipc_msg_set_nth_arg>
    99d8:	e3a03004 	mov	r3, #4
    99dc:	e51b203c 	ldr	r2, [fp, #-60]	; 0xffffffc4
    99e0:	e3a01001 	mov	r1, #1
    99e4:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    99e8:	ebfffc6a 	bl	8b98 <ipc_msg_set_nth_arg>
    99ec:	e3a03001 	mov	r3, #1
    99f0:	e50b300c 	str	r3, [fp, #-12]
    99f4:	e51b3008 	ldr	r3, [fp, #-8]
    99f8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    99fc:	e3a03002 	mov	r3, #2
    9a00:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    if (opcode < 0 || opcode > UINT8_MAX) {
    9a04:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9a08:	e3530000 	cmp	r3, #0
    9a0c:	ba000002 	blt	9a1c <ipc_call_copy_args_Ipc_hello_string+0xe8>
    9a10:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9a14:	e35300ff 	cmp	r3, #255	; 0xff
    9a18:	da000001 	ble	9a24 <ipc_call_copy_args_Ipc_hello_string+0xf0>
        return false;
    9a1c:	e3a03000 	mov	r3, #0
    9a20:	ea000004 	b	9a38 <ipc_call_copy_args_Ipc_hello_string+0x104>
    msg->header.opcode = opcode;
    9a24:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9a28:	e6ef2073 	uxtb	r2, r3
    9a2c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9a30:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9a34:	e3a03001 	mov	r3, #1
    9a38:	e50b300c 	str	r3, [fp, #-12]
    9a3c:	e51b0008 	ldr	r0, [fp, #-8]
    9a40:	ebfffcdc 	bl	8db8 <ipc_msg_send_wait>
    9a44:	e51b3008 	ldr	r3, [fp, #-8]
    9a48:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9a4c:	e51b305c 	ldr	r3, [fp, #-92]	; 0xffffffa4
    9a50:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9a54:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    9a58:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9a5c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9a60:	e5933000 	ldr	r3, [r3]
    9a64:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9a68:	e3a01000 	mov	r1, #0
    9a6c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9a70:	ebfffc90 	bl	8cb8 <ipc_msg_get_nth_arg>
    9a74:	e3a03004 	mov	r3, #4
    9a78:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9a7c:	e3a01001 	mov	r1, #1
    9a80:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9a84:	ebfffc8b 	bl	8cb8 <ipc_msg_get_nth_arg>
    9a88:	e3a03001 	mov	r3, #1
    9a8c:	e50b300c 	str	r3, [fp, #-12]
    9a90:	e3a03000 	mov	r3, #0
    9a94:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    9a98:	e51b3008 	ldr	r3, [fp, #-8]
    9a9c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9aa0:	e24b304c 	sub	r3, fp, #76	; 0x4c
    9aa4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9aa8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9aac:	e5d33000 	ldrb	r3, [r3]
    9ab0:	e2033002 	and	r3, r3, #2
    9ab4:	e6ef3073 	uxtb	r3, r3
    9ab8:	e3530000 	cmp	r3, #0
    9abc:	1a000007 	bne	9ae0 <ipc_call_copy_args_Ipc_hello_string+0x1ac>
    9ac0:	e30f34f0 	movw	r3, #62704	; 0xf4f0
    9ac4:	e3403000 	movt	r3, #0
    9ac8:	e30f2560 	movw	r2, #62816	; 0xf560
    9acc:	e3402000 	movt	r2, #0
    9ad0:	e3a01074 	mov	r1, #116	; 0x74
    9ad4:	e30f0508 	movw	r0, #62728	; 0xf508
    9ad8:	e3400000 	movt	r0, #0
    9adc:	eb00020d 	bl	a318 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9ae0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9ae4:	e2833008 	add	r3, r3, #8
    9ae8:	e3a02004 	mov	r2, #4
    9aec:	e1a01003 	mov	r1, r3
    9af0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9af4:	eb00025b 	bl	a468 <memcpy>
    9af8:	e51b3058 	ldr	r3, [fp, #-88]	; 0xffffffa8
    9afc:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9b00:	e51b3010 	ldr	r3, [fp, #-16]
    9b04:	e5933010 	ldr	r3, [r3, #16]
    9b08:	e51b2010 	ldr	r2, [fp, #-16]
    9b0c:	e5922008 	ldr	r2, [r2, #8]
    9b10:	e0833002 	add	r3, r3, r2
    9b14:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    9b18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9b1c:	e5d33000 	ldrb	r3, [r3]
    9b20:	e2033004 	and	r3, r3, #4
    9b24:	e6ef3073 	uxtb	r3, r3
    9b28:	e3530000 	cmp	r3, #0
    9b2c:	0a000004 	beq	9b44 <ipc_call_copy_args_Ipc_hello_string+0x210>
    return session_free_buf(session, msg->header.len);
    9b30:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9b34:	e1d330b2 	ldrh	r3, [r3, #2]
    9b38:	e1a01003 	mov	r1, r3
    9b3c:	e51b0010 	ldr	r0, [fp, #-16]
    9b40:	ebfffe96 	bl	95a0 <session_free_buf>
    9b44:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9b48:	e1a00003 	mov	r0, r3
    9b4c:	e24bd004 	sub	sp, fp, #4
    9b50:	e8bd8800 	pop	{fp, pc}

00009b54 <hello_string>:
int hello_string(struct Session* session, char* buf, int len)
{
    9b54:	e92d4800 	push	{fp, lr}
    9b58:	e28db004 	add	fp, sp, #4
    9b5c:	e24dd010 	sub	sp, sp, #16
    9b60:	e50b0008 	str	r0, [fp, #-8]
    9b64:	e50b100c 	str	r1, [fp, #-12]
    9b68:	e50b2010 	str	r2, [fp, #-16]
    return IPC_CALL(Ipc_hello_string)(session, buf, &len);
    9b6c:	e24b3010 	sub	r3, fp, #16
    9b70:	e1a02003 	mov	r2, r3
    9b74:	e51b100c 	ldr	r1, [fp, #-12]
    9b78:	e51b0008 	ldr	r0, [fp, #-8]
    9b7c:	ebffff6c 	bl	9934 <ipc_call_copy_args_Ipc_hello_string>
    9b80:	e1a03000 	mov	r3, r0
}
    9b84:	e1a00003 	mov	r0, r3
    9b88:	e24bd004 	sub	sp, fp, #4
    9b8c:	e8bd8800 	pop	{fp, pc}

00009b90 <hello_string_nowait>:

struct IpcMsg* hello_string_nowait(struct Session* session, char** buf, int len)
{
    9b90:	e92d4800 	push	{fp, lr}
    9b94:	e28db004 	add	fp, sp, #4
    9b98:	e24dd038 	sub	sp, sp, #56	; 0x38
    9b9c:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    9ba0:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    9ba4:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    struct IpcMsg* msg = IPC_CREATE_MSG_FUNC(Ipc_hello_string)(session, *buf, &len);
    9ba8:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9bac:	e5933000 	ldr	r3, [r3]
    9bb0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9bb4:	e50b201c 	str	r2, [fp, #-28]	; 0xffffffe4
    9bb8:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9bbc:	e24b3038 	sub	r3, fp, #56	; 0x38
    9bc0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
IPC_INTERFACE(Ipc_hello_string, 2, buf, len, *(int*)len, sizeof(int));
    9bc4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    9bc8:	e5933000 	ldr	r3, [r3]
    9bcc:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    9bd0:	e3a03004 	mov	r3, #4
    9bd4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9bd8:	e24b302c 	sub	r3, fp, #44	; 0x2c
    9bdc:	e1a02003 	mov	r2, r3
    9be0:	e3a01002 	mov	r1, #2
    9be4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9be8:	ebfffb7d 	bl	89e4 <new_ipc_msg>
    9bec:	e1a03000 	mov	r3, r0
    struct IpcMsg* msg = IPC_CREATE_MSG_FUNC(Ipc_hello_string)(session, *buf, &len);
    9bf0:	e50b3008 	str	r3, [fp, #-8]
    9bf4:	e51b3008 	ldr	r3, [fp, #-8]
    9bf8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    9bfc:	e3a03000 	mov	r3, #0
    9c00:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9c04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9c08:	e2833003 	add	r3, r3, #3
    9c0c:	e1a03103 	lsl	r3, r3, #2
    9c10:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    9c14:	e0823003 	add	r3, r2, r3
    9c18:	e1d330b0 	ldrh	r3, [r3]
    9c1c:	e1a02003 	mov	r2, r3
    9c20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9c24:	e0832002 	add	r2, r3, r2
    *buf = ipc_msg_get_nth_arg_buf(msg, 0);
    9c28:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    9c2c:	e5832000 	str	r2, [r3]
    ipc_msg_set_nth_arg(msg, 1, &len, sizeof(int));
    9c30:	e24b2038 	sub	r2, fp, #56	; 0x38
    9c34:	e3a03004 	mov	r3, #4
    9c38:	e3a01001 	mov	r1, #1
    9c3c:	e51b0008 	ldr	r0, [fp, #-8]
    9c40:	ebfffbd4 	bl	8b98 <ipc_msg_set_nth_arg>
    9c44:	e51b3008 	ldr	r3, [fp, #-8]
    9c48:	e50b300c 	str	r3, [fp, #-12]
    9c4c:	e3a03002 	mov	r3, #2
    9c50:	e50b3010 	str	r3, [fp, #-16]
    if (opcode < 0 || opcode > UINT8_MAX) {
    9c54:	e51b3010 	ldr	r3, [fp, #-16]
    9c58:	e3530000 	cmp	r3, #0
    9c5c:	ba000006 	blt	9c7c <hello_string_nowait+0xec>
    9c60:	e51b3010 	ldr	r3, [fp, #-16]
    9c64:	e35300ff 	cmp	r3, #255	; 0xff
    9c68:	ca000003 	bgt	9c7c <hello_string_nowait+0xec>
    msg->header.opcode = opcode;
    9c6c:	e51b3010 	ldr	r3, [fp, #-16]
    9c70:	e6ef2073 	uxtb	r2, r3
    9c74:	e51b300c 	ldr	r3, [fp, #-12]
    9c78:	e5c32001 	strb	r2, [r3, #1]
    ipc_msg_set_opcode(msg, Ipc_hello_string);
    ipc_msg_send_nowait(msg);
    9c7c:	e51b0008 	ldr	r0, [fp, #-8]
    9c80:	ebfffc75 	bl	8e5c <ipc_msg_send_nowait>
    return msg;
    9c84:	e51b3008 	ldr	r3, [fp, #-8]
}
    9c88:	e1a00003 	mov	r0, r3
    9c8c:	e24bd004 	sub	sp, fp, #4
    9c90:	e8bd8800 	pop	{fp, pc}

00009c94 <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    9c94:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    9c98:	e28db014 	add	fp, sp, #20
    9c9c:	e24dd018 	sub	sp, sp, #24
    9ca0:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    9ca4:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    9ca8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    9cac:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    9cb0:	e3e03000 	mvn	r3, #0
    9cb4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    9cb8:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    9cbc:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    9cc0:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    9cc4:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    9cc8:	e59b7004 	ldr	r7, [fp, #4]
    9ccc:	e1a0000c 	mov	r0, ip
    9cd0:	e1a0100e 	mov	r1, lr
    9cd4:	e1a02005 	mov	r2, r5
    9cd8:	e1a03006 	mov	r3, r6
    9cdc:	e1a04007 	mov	r4, r7
    9ce0:	ef000000 	svc	0x00000000
    9ce4:	f57ff04f 	dsb	sy
    9ce8:	f57ff06f 	isb	sy
    9cec:	e1a0c000 	mov	ip, r0
    9cf0:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    9cf4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    9cf8:	e1a00003 	mov	r0, r3
    9cfc:	e24bd014 	sub	sp, fp, #20
    9d00:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

00009d04 <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    9d04:	e92d4800 	push	{fp, lr}
    9d08:	e28db004 	add	fp, sp, #4
    9d0c:	e24dd028 	sub	sp, sp, #40	; 0x28
    9d10:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9d14:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    9d18:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    9d1c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    9d20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9d24:	e50b3010 	str	r3, [fp, #-16]
    9d28:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9d2c:	e50b300c 	str	r3, [fp, #-12]
    9d30:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    9d34:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    9d38:	e24b1010 	sub	r1, fp, #16
    9d3c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9d40:	e59b0004 	ldr	r0, [fp, #4]
    9d44:	e3a03000 	mov	r3, #0
    9d48:	e58d3000 	str	r3, [sp]
    9d4c:	e1a03000 	mov	r3, r0
    9d50:	e3a00001 	mov	r0, #1
    9d54:	ebffffce 	bl	9c94 <syscall>
    9d58:	e1a03000 	mov	r3, r0
}
    9d5c:	e1a00003 	mov	r0, r3
    9d60:	e24bd004 	sub	sp, fp, #4
    9d64:	e8bd8800 	pop	{fp, pc}

00009d68 <exit>:

int exit()
{
    9d68:	e92d4800 	push	{fp, lr}
    9d6c:	e28db004 	add	fp, sp, #4
    9d70:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    9d74:	e3a03000 	mov	r3, #0
    9d78:	e58d3000 	str	r3, [sp]
    9d7c:	e3a03000 	mov	r3, #0
    9d80:	e3a02000 	mov	r2, #0
    9d84:	e3a01000 	mov	r1, #0
    9d88:	e3a00002 	mov	r0, #2
    9d8c:	ebffffc0 	bl	9c94 <syscall>
    9d90:	e1a03000 	mov	r3, r0
}
    9d94:	e1a00003 	mov	r0, r3
    9d98:	e24bd004 	sub	sp, fp, #4
    9d9c:	e8bd8800 	pop	{fp, pc}

00009da0 <yield>:

int yield()
{
    9da0:	e92d4800 	push	{fp, lr}
    9da4:	e28db004 	add	fp, sp, #4
    9da8:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    9dac:	e3a03000 	mov	r3, #0
    9db0:	e58d3000 	str	r3, [sp]
    9db4:	e3a03000 	mov	r3, #0
    9db8:	e3a02000 	mov	r2, #0
    9dbc:	e3a01000 	mov	r1, #0
    9dc0:	e3a00003 	mov	r0, #3
    9dc4:	ebffffb2 	bl	9c94 <syscall>
    9dc8:	e1a03000 	mov	r3, r0
}
    9dcc:	e1a00003 	mov	r0, r3
    9dd0:	e24bd004 	sub	sp, fp, #4
    9dd4:	e8bd8800 	pop	{fp, pc}

00009dd8 <register_server>:

int register_server(char* name)
{
    9dd8:	e92d4800 	push	{fp, lr}
    9ddc:	e28db004 	add	fp, sp, #4
    9de0:	e24dd010 	sub	sp, sp, #16
    9de4:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    9de8:	e51b1008 	ldr	r1, [fp, #-8]
    9dec:	e3a03000 	mov	r3, #0
    9df0:	e58d3000 	str	r3, [sp]
    9df4:	e3a03000 	mov	r3, #0
    9df8:	e3a02000 	mov	r2, #0
    9dfc:	e3a00005 	mov	r0, #5
    9e00:	ebffffa3 	bl	9c94 <syscall>
    9e04:	e1a03000 	mov	r3, r0
}
    9e08:	e1a00003 	mov	r0, r3
    9e0c:	e24bd004 	sub	sp, fp, #4
    9e10:	e8bd8800 	pop	{fp, pc}

00009e14 <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    9e14:	e92d4800 	push	{fp, lr}
    9e18:	e28db004 	add	fp, sp, #4
    9e1c:	e24dd018 	sub	sp, sp, #24
    9e20:	e50b0008 	str	r0, [fp, #-8]
    9e24:	e50b100c 	str	r1, [fp, #-12]
    9e28:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    9e2c:	e51b1008 	ldr	r1, [fp, #-8]
    9e30:	e51b2010 	ldr	r2, [fp, #-16]
    9e34:	e3a03000 	mov	r3, #0
    9e38:	e58d3000 	str	r3, [sp]
    9e3c:	e1a03002 	mov	r3, r2
    9e40:	e51b200c 	ldr	r2, [fp, #-12]
    9e44:	e3a00006 	mov	r0, #6
    9e48:	ebffff91 	bl	9c94 <syscall>
    9e4c:	e1a03000 	mov	r3, r0
}
    9e50:	e1a00003 	mov	r0, r3
    9e54:	e24bd004 	sub	sp, fp, #4
    9e58:	e8bd8800 	pop	{fp, pc}

00009e5c <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    9e5c:	e92d4800 	push	{fp, lr}
    9e60:	e28db004 	add	fp, sp, #4
    9e64:	e24dd010 	sub	sp, sp, #16
    9e68:	e50b0008 	str	r0, [fp, #-8]
    9e6c:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    9e70:	e51b1008 	ldr	r1, [fp, #-8]
    9e74:	e3a03000 	mov	r3, #0
    9e78:	e58d3000 	str	r3, [sp]
    9e7c:	e3a03000 	mov	r3, #0
    9e80:	e51b200c 	ldr	r2, [fp, #-12]
    9e84:	e3a00007 	mov	r0, #7
    9e88:	ebffff81 	bl	9c94 <syscall>
    9e8c:	e1a03000 	mov	r3, r0
}
    9e90:	e1a00003 	mov	r0, r3
    9e94:	e24bd004 	sub	sp, fp, #4
    9e98:	e8bd8800 	pop	{fp, pc}

00009e9c <close_session>:

int close_session(struct Session* session)
{
    9e9c:	e92d4800 	push	{fp, lr}
    9ea0:	e28db004 	add	fp, sp, #4
    9ea4:	e24dd010 	sub	sp, sp, #16
    9ea8:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    9eac:	e51b1008 	ldr	r1, [fp, #-8]
    9eb0:	e3a03000 	mov	r3, #0
    9eb4:	e58d3000 	str	r3, [sp]
    9eb8:	e3a03000 	mov	r3, #0
    9ebc:	e3a02000 	mov	r2, #0
    9ec0:	e3a00008 	mov	r0, #8
    9ec4:	ebffff72 	bl	9c94 <syscall>
    9ec8:	e1a03000 	mov	r3, r0
}
    9ecc:	e1a00003 	mov	r0, r3
    9ed0:	e24bd004 	sub	sp, fp, #4
    9ed4:	e8bd8800 	pop	{fp, pc}

00009ed8 <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    9ed8:	e92d4800 	push	{fp, lr}
    9edc:	e28db004 	add	fp, sp, #4
    9ee0:	e24dd010 	sub	sp, sp, #16
    9ee4:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    9ee8:	e51b2008 	ldr	r2, [fp, #-8]
    9eec:	e3a03000 	mov	r3, #0
    9ef0:	e58d3000 	str	r3, [sp]
    9ef4:	e3a03000 	mov	r3, #0
    9ef8:	e3a01003 	mov	r1, #3
    9efc:	e3a0000a 	mov	r0, #10
    9f00:	ebffff63 	bl	9c94 <syscall>
    9f04:	e1a03000 	mov	r3, r0
}
    9f08:	e1a00003 	mov	r0, r3
    9f0c:	e24bd004 	sub	sp, fp, #4
    9f10:	e8bd8800 	pop	{fp, pc}

00009f14 <set_priority>:

int set_priority(sys_state_info* info)
{
    9f14:	e92d4800 	push	{fp, lr}
    9f18:	e28db004 	add	fp, sp, #4
    9f1c:	e24dd010 	sub	sp, sp, #16
    9f20:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    9f24:	e51b2008 	ldr	r2, [fp, #-8]
    9f28:	e3a03000 	mov	r3, #0
    9f2c:	e58d3000 	str	r3, [sp]
    9f30:	e3a03000 	mov	r3, #0
    9f34:	e3a01001 	mov	r1, #1
    9f38:	e3a0000a 	mov	r0, #10
    9f3c:	ebffff54 	bl	9c94 <syscall>
    9f40:	e1a03000 	mov	r3, r0
}
    9f44:	e1a00003 	mov	r0, r3
    9f48:	e24bd004 	sub	sp, fp, #4
    9f4c:	e8bd8800 	pop	{fp, pc}

00009f50 <task_heap_base>:

int task_heap_base()
{
    9f50:	e92d4800 	push	{fp, lr}
    9f54:	e28db004 	add	fp, sp, #4
    9f58:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    9f5c:	e3a03000 	mov	r3, #0
    9f60:	e58d3000 	str	r3, [sp]
    9f64:	e3a03000 	mov	r3, #0
    9f68:	e3a02000 	mov	r2, #0
    9f6c:	e3a01002 	mov	r1, #2
    9f70:	e3a0000a 	mov	r0, #10
    9f74:	ebffff46 	bl	9c94 <syscall>
    9f78:	e1a03000 	mov	r3, r0
}
    9f7c:	e1a00003 	mov	r0, r3
    9f80:	e24bd004 	sub	sp, fp, #4
    9f84:	e8bd8800 	pop	{fp, pc}

00009f88 <show_task>:

int show_task()
{
    9f88:	e92d4800 	push	{fp, lr}
    9f8c:	e28db004 	add	fp, sp, #4
    9f90:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    9f94:	e3a03000 	mov	r3, #0
    9f98:	e58d3000 	str	r3, [sp]
    9f9c:	e3a03000 	mov	r3, #0
    9fa0:	e3a02000 	mov	r2, #0
    9fa4:	e3a01004 	mov	r1, #4
    9fa8:	e3a0000a 	mov	r0, #10
    9fac:	ebffff38 	bl	9c94 <syscall>
    9fb0:	e1a03000 	mov	r3, r0
}
    9fb4:	e1a00003 	mov	r0, r3
    9fb8:	e24bd004 	sub	sp, fp, #4
    9fbc:	e8bd8800 	pop	{fp, pc}

00009fc0 <show_mem>:

int show_mem()
{
    9fc0:	e92d4800 	push	{fp, lr}
    9fc4:	e28db004 	add	fp, sp, #4
    9fc8:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    9fcc:	e3a03000 	mov	r3, #0
    9fd0:	e58d3000 	str	r3, [sp]
    9fd4:	e3a03000 	mov	r3, #0
    9fd8:	e3a02000 	mov	r2, #0
    9fdc:	e3a01005 	mov	r1, #5
    9fe0:	e3a0000a 	mov	r0, #10
    9fe4:	ebffff2a 	bl	9c94 <syscall>
    9fe8:	e1a03000 	mov	r3, r0
}
    9fec:	e1a00003 	mov	r0, r3
    9ff0:	e24bd004 	sub	sp, fp, #4
    9ff4:	e8bd8800 	pop	{fp, pc}

00009ff8 <show_cpu>:

int show_cpu()
{
    9ff8:	e92d4800 	push	{fp, lr}
    9ffc:	e28db004 	add	fp, sp, #4
    a000:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    a004:	e3a03000 	mov	r3, #0
    a008:	e58d3000 	str	r3, [sp]
    a00c:	e3a03000 	mov	r3, #0
    a010:	e3a02000 	mov	r2, #0
    a014:	e3a01006 	mov	r1, #6
    a018:	e3a0000a 	mov	r0, #10
    a01c:	ebffff1c 	bl	9c94 <syscall>
    a020:	e1a03000 	mov	r3, r0
}
    a024:	e1a00003 	mov	r0, r3
    a028:	e24bd004 	sub	sp, fp, #4
    a02c:	e8bd8800 	pop	{fp, pc}

0000a030 <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    a030:	e92d4800 	push	{fp, lr}
    a034:	e28db004 	add	fp, sp, #4
    a038:	e24dd018 	sub	sp, sp, #24
    a03c:	e50b0008 	str	r0, [fp, #-8]
    a040:	e50b100c 	str	r1, [fp, #-12]
    a044:	e50b2010 	str	r2, [fp, #-16]
    a048:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    a04c:	e51b1008 	ldr	r1, [fp, #-8]
    a050:	e51b200c 	ldr	r2, [fp, #-12]
    a054:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    a058:	e58d3000 	str	r3, [sp]
    a05c:	e51b3010 	ldr	r3, [fp, #-16]
    a060:	e3a00004 	mov	r0, #4
    a064:	ebffff0a 	bl	9c94 <syscall>
    a068:	e1a03000 	mov	r3, r0
}
    a06c:	e1a00003 	mov	r0, r3
    a070:	e24bd004 	sub	sp, fp, #4
    a074:	e8bd8800 	pop	{fp, pc}

0000a078 <register_irq>:

int register_irq(int irq, int opcode)
{
    a078:	e92d4800 	push	{fp, lr}
    a07c:	e28db004 	add	fp, sp, #4
    a080:	e24dd010 	sub	sp, sp, #16
    a084:	e50b0008 	str	r0, [fp, #-8]
    a088:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    a08c:	e3a03000 	mov	r3, #0
    a090:	e58d3000 	str	r3, [sp]
    a094:	e3a03000 	mov	r3, #0
    a098:	e51b200c 	ldr	r2, [fp, #-12]
    a09c:	e51b1008 	ldr	r1, [fp, #-8]
    a0a0:	e3a0000b 	mov	r0, #11
    a0a4:	ebfffefa 	bl	9c94 <syscall>
    a0a8:	e1a03000 	mov	r3, r0
    a0ac:	e1a00003 	mov	r0, r3
    a0b0:	e24bd004 	sub	sp, fp, #4
    a0b4:	e8bd8800 	pop	{fp, pc}

0000a0b8 <__udivsi3>:
    a0b8:	e2512001 	subs	r2, r1, #1
    a0bc:	012fff1e 	bxeq	lr
    a0c0:	3a000036 	bcc	a1a0 <__udivsi3+0xe8>
    a0c4:	e1500001 	cmp	r0, r1
    a0c8:	9a000022 	bls	a158 <__udivsi3+0xa0>
    a0cc:	e1110002 	tst	r1, r2
    a0d0:	0a000023 	beq	a164 <__udivsi3+0xac>
    a0d4:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    a0d8:	01a01181 	lsleq	r1, r1, #3
    a0dc:	03a03008 	moveq	r3, #8
    a0e0:	13a03001 	movne	r3, #1
    a0e4:	e3510201 	cmp	r1, #268435456	; 0x10000000
    a0e8:	31510000 	cmpcc	r1, r0
    a0ec:	31a01201 	lslcc	r1, r1, #4
    a0f0:	31a03203 	lslcc	r3, r3, #4
    a0f4:	3afffffa 	bcc	a0e4 <__udivsi3+0x2c>
    a0f8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    a0fc:	31510000 	cmpcc	r1, r0
    a100:	31a01081 	lslcc	r1, r1, #1
    a104:	31a03083 	lslcc	r3, r3, #1
    a108:	3afffffa 	bcc	a0f8 <__udivsi3+0x40>
    a10c:	e3a02000 	mov	r2, #0
    a110:	e1500001 	cmp	r0, r1
    a114:	20400001 	subcs	r0, r0, r1
    a118:	21822003 	orrcs	r2, r2, r3
    a11c:	e15000a1 	cmp	r0, r1, lsr #1
    a120:	204000a1 	subcs	r0, r0, r1, lsr #1
    a124:	218220a3 	orrcs	r2, r2, r3, lsr #1
    a128:	e1500121 	cmp	r0, r1, lsr #2
    a12c:	20400121 	subcs	r0, r0, r1, lsr #2
    a130:	21822123 	orrcs	r2, r2, r3, lsr #2
    a134:	e15001a1 	cmp	r0, r1, lsr #3
    a138:	204001a1 	subcs	r0, r0, r1, lsr #3
    a13c:	218221a3 	orrcs	r2, r2, r3, lsr #3
    a140:	e3500000 	cmp	r0, #0
    a144:	11b03223 	lsrsne	r3, r3, #4
    a148:	11a01221 	lsrne	r1, r1, #4
    a14c:	1affffef 	bne	a110 <__udivsi3+0x58>
    a150:	e1a00002 	mov	r0, r2
    a154:	e12fff1e 	bx	lr
    a158:	03a00001 	moveq	r0, #1
    a15c:	13a00000 	movne	r0, #0
    a160:	e12fff1e 	bx	lr
    a164:	e3510801 	cmp	r1, #65536	; 0x10000
    a168:	21a01821 	lsrcs	r1, r1, #16
    a16c:	23a02010 	movcs	r2, #16
    a170:	33a02000 	movcc	r2, #0
    a174:	e3510c01 	cmp	r1, #256	; 0x100
    a178:	21a01421 	lsrcs	r1, r1, #8
    a17c:	22822008 	addcs	r2, r2, #8
    a180:	e3510010 	cmp	r1, #16
    a184:	21a01221 	lsrcs	r1, r1, #4
    a188:	22822004 	addcs	r2, r2, #4
    a18c:	e3510004 	cmp	r1, #4
    a190:	82822003 	addhi	r2, r2, #3
    a194:	908220a1 	addls	r2, r2, r1, lsr #1
    a198:	e1a00230 	lsr	r0, r0, r2
    a19c:	e12fff1e 	bx	lr
    a1a0:	e3500000 	cmp	r0, #0
    a1a4:	13e00000 	mvnne	r0, #0
    a1a8:	ea000059 	b	a314 <__aeabi_idiv0>

0000a1ac <__aeabi_uidivmod>:
    a1ac:	e3510000 	cmp	r1, #0
    a1b0:	0afffffa 	beq	a1a0 <__udivsi3+0xe8>
    a1b4:	e92d4003 	push	{r0, r1, lr}
    a1b8:	ebffffbe 	bl	a0b8 <__udivsi3>
    a1bc:	e8bd4006 	pop	{r1, r2, lr}
    a1c0:	e0030092 	mul	r3, r2, r0
    a1c4:	e0411003 	sub	r1, r1, r3
    a1c8:	e12fff1e 	bx	lr

0000a1cc <__divsi3>:
    a1cc:	e3510000 	cmp	r1, #0
    a1d0:	0a000043 	beq	a2e4 <.divsi3_skip_div0_test+0x110>

0000a1d4 <.divsi3_skip_div0_test>:
    a1d4:	e020c001 	eor	ip, r0, r1
    a1d8:	42611000 	rsbmi	r1, r1, #0
    a1dc:	e2512001 	subs	r2, r1, #1
    a1e0:	0a000027 	beq	a284 <.divsi3_skip_div0_test+0xb0>
    a1e4:	e1b03000 	movs	r3, r0
    a1e8:	42603000 	rsbmi	r3, r0, #0
    a1ec:	e1530001 	cmp	r3, r1
    a1f0:	9a000026 	bls	a290 <.divsi3_skip_div0_test+0xbc>
    a1f4:	e1110002 	tst	r1, r2
    a1f8:	0a000028 	beq	a2a0 <.divsi3_skip_div0_test+0xcc>
    a1fc:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    a200:	01a01181 	lsleq	r1, r1, #3
    a204:	03a02008 	moveq	r2, #8
    a208:	13a02001 	movne	r2, #1
    a20c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    a210:	31510003 	cmpcc	r1, r3
    a214:	31a01201 	lslcc	r1, r1, #4
    a218:	31a02202 	lslcc	r2, r2, #4
    a21c:	3afffffa 	bcc	a20c <.divsi3_skip_div0_test+0x38>
    a220:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    a224:	31510003 	cmpcc	r1, r3
    a228:	31a01081 	lslcc	r1, r1, #1
    a22c:	31a02082 	lslcc	r2, r2, #1
    a230:	3afffffa 	bcc	a220 <.divsi3_skip_div0_test+0x4c>
    a234:	e3a00000 	mov	r0, #0
    a238:	e1530001 	cmp	r3, r1
    a23c:	20433001 	subcs	r3, r3, r1
    a240:	21800002 	orrcs	r0, r0, r2
    a244:	e15300a1 	cmp	r3, r1, lsr #1
    a248:	204330a1 	subcs	r3, r3, r1, lsr #1
    a24c:	218000a2 	orrcs	r0, r0, r2, lsr #1
    a250:	e1530121 	cmp	r3, r1, lsr #2
    a254:	20433121 	subcs	r3, r3, r1, lsr #2
    a258:	21800122 	orrcs	r0, r0, r2, lsr #2
    a25c:	e15301a1 	cmp	r3, r1, lsr #3
    a260:	204331a1 	subcs	r3, r3, r1, lsr #3
    a264:	218001a2 	orrcs	r0, r0, r2, lsr #3
    a268:	e3530000 	cmp	r3, #0
    a26c:	11b02222 	lsrsne	r2, r2, #4
    a270:	11a01221 	lsrne	r1, r1, #4
    a274:	1affffef 	bne	a238 <.divsi3_skip_div0_test+0x64>
    a278:	e35c0000 	cmp	ip, #0
    a27c:	42600000 	rsbmi	r0, r0, #0
    a280:	e12fff1e 	bx	lr
    a284:	e13c0000 	teq	ip, r0
    a288:	42600000 	rsbmi	r0, r0, #0
    a28c:	e12fff1e 	bx	lr
    a290:	33a00000 	movcc	r0, #0
    a294:	01a00fcc 	asreq	r0, ip, #31
    a298:	03800001 	orreq	r0, r0, #1
    a29c:	e12fff1e 	bx	lr
    a2a0:	e3510801 	cmp	r1, #65536	; 0x10000
    a2a4:	21a01821 	lsrcs	r1, r1, #16
    a2a8:	23a02010 	movcs	r2, #16
    a2ac:	33a02000 	movcc	r2, #0
    a2b0:	e3510c01 	cmp	r1, #256	; 0x100
    a2b4:	21a01421 	lsrcs	r1, r1, #8
    a2b8:	22822008 	addcs	r2, r2, #8
    a2bc:	e3510010 	cmp	r1, #16
    a2c0:	21a01221 	lsrcs	r1, r1, #4
    a2c4:	22822004 	addcs	r2, r2, #4
    a2c8:	e3510004 	cmp	r1, #4
    a2cc:	82822003 	addhi	r2, r2, #3
    a2d0:	908220a1 	addls	r2, r2, r1, lsr #1
    a2d4:	e35c0000 	cmp	ip, #0
    a2d8:	e1a00233 	lsr	r0, r3, r2
    a2dc:	42600000 	rsbmi	r0, r0, #0
    a2e0:	e12fff1e 	bx	lr
    a2e4:	e3500000 	cmp	r0, #0
    a2e8:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    a2ec:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    a2f0:	ea000007 	b	a314 <__aeabi_idiv0>

0000a2f4 <__aeabi_idivmod>:
    a2f4:	e3510000 	cmp	r1, #0
    a2f8:	0afffff9 	beq	a2e4 <.divsi3_skip_div0_test+0x110>
    a2fc:	e92d4003 	push	{r0, r1, lr}
    a300:	ebffffb3 	bl	a1d4 <.divsi3_skip_div0_test>
    a304:	e8bd4006 	pop	{r1, r2, lr}
    a308:	e0030092 	mul	r3, r2, r0
    a30c:	e0411003 	sub	r1, r1, r3
    a310:	e12fff1e 	bx	lr

0000a314 <__aeabi_idiv0>:
    a314:	e12fff1e 	bx	lr

0000a318 <__assert_func>:
    a318:	e59fc038 	ldr	ip, [pc, #56]	; a358 <__assert_func+0x40>
    a31c:	e59c4000 	ldr	r4, [ip]
    a320:	e252c000 	subs	ip, r2, #0
    a324:	e1a02003 	mov	r2, r3
    a328:	059f302c 	ldreq	r3, [pc, #44]	; a35c <__assert_func+0x44>
    a32c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    a330:	01a0c003 	moveq	ip, r3
    a334:	e1a0e000 	mov	lr, r0
    a338:	159f3020 	ldrne	r3, [pc, #32]	; a360 <__assert_func+0x48>
    a33c:	e24dd014 	sub	sp, sp, #20
    a340:	e594000c 	ldr	r0, [r4, #12]
    a344:	e88d100a 	stm	sp, {r1, r3, ip}
    a348:	e1a0300e 	mov	r3, lr
    a34c:	e59f1010 	ldr	r1, [pc, #16]	; a364 <__assert_func+0x4c>
    a350:	eb000014 	bl	a3a8 <fiprintf>
    a354:	eb0006a6 	bl	bdf4 <abort>
    a358:	0000fb6c 	.word	0x0000fb6c
    a35c:	0000f580 	.word	0x0000f580
    a360:	0000f574 	.word	0x0000f574
    a364:	0000f584 	.word	0x0000f584

0000a368 <__assert>:
    a368:	e1a03002 	mov	r3, r2
    a36c:	e92d4010 	push	{r4, lr}
    a370:	e3a02000 	mov	r2, #0
    a374:	ebffffe7 	bl	a318 <__assert_func>

0000a378 <_fiprintf_r>:
    a378:	e92d000c 	push	{r2, r3}
    a37c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    a380:	e24dd00c 	sub	sp, sp, #12
    a384:	e28dc014 	add	ip, sp, #20
    a388:	e1a0300c 	mov	r3, ip
    a38c:	e59d2010 	ldr	r2, [sp, #16]
    a390:	e58dc004 	str	ip, [sp, #4]
    a394:	eb000141 	bl	a8a0 <_vfiprintf_r>
    a398:	e28dd00c 	add	sp, sp, #12
    a39c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    a3a0:	e28dd008 	add	sp, sp, #8
    a3a4:	e12fff1e 	bx	lr

0000a3a8 <fiprintf>:
    a3a8:	e92d000e 	push	{r1, r2, r3}
    a3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    a3b0:	e59f202c 	ldr	r2, [pc, #44]	; a3e4 <fiprintf+0x3c>
    a3b4:	e24dd008 	sub	sp, sp, #8
    a3b8:	e28dc010 	add	ip, sp, #16
    a3bc:	e1a01000 	mov	r1, r0
    a3c0:	e1a0300c 	mov	r3, ip
    a3c4:	e5920000 	ldr	r0, [r2]
    a3c8:	e59d200c 	ldr	r2, [sp, #12]
    a3cc:	e58dc004 	str	ip, [sp, #4]
    a3d0:	eb000132 	bl	a8a0 <_vfiprintf_r>
    a3d4:	e28dd008 	add	sp, sp, #8
    a3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    a3dc:	e28dd00c 	add	sp, sp, #12
    a3e0:	e12fff1e 	bx	lr
    a3e4:	0000fb6c 	.word	0x0000fb6c

0000a3e8 <__libc_init_array>:
    a3e8:	e92d4070 	push	{r4, r5, r6, lr}
    a3ec:	e59f6064 	ldr	r6, [pc, #100]	; a458 <__libc_init_array+0x70>
    a3f0:	e59f5064 	ldr	r5, [pc, #100]	; a45c <__libc_init_array+0x74>
    a3f4:	e0466005 	sub	r6, r6, r5
    a3f8:	e1b06146 	asrs	r6, r6, #2
    a3fc:	13a04000 	movne	r4, #0
    a400:	0a000005 	beq	a41c <__libc_init_array+0x34>
    a404:	e2844001 	add	r4, r4, #1
    a408:	e4953004 	ldr	r3, [r5], #4
    a40c:	e1a0e00f 	mov	lr, pc
    a410:	e12fff13 	bx	r3
    a414:	e1560004 	cmp	r6, r4
    a418:	1afffff9 	bne	a404 <__libc_init_array+0x1c>
    a41c:	e59f603c 	ldr	r6, [pc, #60]	; a460 <__libc_init_array+0x78>
    a420:	e59f503c 	ldr	r5, [pc, #60]	; a464 <__libc_init_array+0x7c>
    a424:	e0466005 	sub	r6, r6, r5
    a428:	ebfff6f4 	bl	8000 <_init>
    a42c:	e1b06146 	asrs	r6, r6, #2
    a430:	13a04000 	movne	r4, #0
    a434:	0a000005 	beq	a450 <__libc_init_array+0x68>
    a438:	e2844001 	add	r4, r4, #1
    a43c:	e4953004 	ldr	r3, [r5], #4
    a440:	e1a0e00f 	mov	lr, pc
    a444:	e12fff13 	bx	r3
    a448:	e1560004 	cmp	r6, r4
    a44c:	1afffff9 	bne	a438 <__libc_init_array+0x50>
    a450:	e8bd4070 	pop	{r4, r5, r6, lr}
    a454:	e12fff1e 	bx	lr
    a458:	0000f728 	.word	0x0000f728
    a45c:	0000f728 	.word	0x0000f728
    a460:	0000f72c 	.word	0x0000f72c
    a464:	0000f728 	.word	0x0000f728

0000a468 <memcpy>:
    a468:	e352000f 	cmp	r2, #15
    a46c:	8a000009 	bhi	a498 <memcpy+0x30>
    a470:	e3520000 	cmp	r2, #0
    a474:	e1a03000 	mov	r3, r0
    a478:	0a00003c 	beq	a570 <memcpy+0x108>
    a47c:	e2433001 	sub	r3, r3, #1
    a480:	e0812002 	add	r2, r1, r2
    a484:	e4d1c001 	ldrb	ip, [r1], #1
    a488:	e1510002 	cmp	r1, r2
    a48c:	e5e3c001 	strb	ip, [r3, #1]!
    a490:	1afffffb 	bne	a484 <memcpy+0x1c>
    a494:	e12fff1e 	bx	lr
    a498:	e1813000 	orr	r3, r1, r0
    a49c:	e3130003 	tst	r3, #3
    a4a0:	1a000030 	bne	a568 <memcpy+0x100>
    a4a4:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    a4a8:	e1a0e002 	mov	lr, r2
    a4ac:	e280c010 	add	ip, r0, #16
    a4b0:	e2813010 	add	r3, r1, #16
    a4b4:	e5137010 	ldr	r7, [r3, #-16]
    a4b8:	e513600c 	ldr	r6, [r3, #-12]
    a4bc:	e5135008 	ldr	r5, [r3, #-8]
    a4c0:	e5134004 	ldr	r4, [r3, #-4]
    a4c4:	e24ee010 	sub	lr, lr, #16
    a4c8:	e35e000f 	cmp	lr, #15
    a4cc:	e50c7010 	str	r7, [ip, #-16]
    a4d0:	e50c600c 	str	r6, [ip, #-12]
    a4d4:	e50c5008 	str	r5, [ip, #-8]
    a4d8:	e50c4004 	str	r4, [ip, #-4]
    a4dc:	e2833010 	add	r3, r3, #16
    a4e0:	e28cc010 	add	ip, ip, #16
    a4e4:	8afffff2 	bhi	a4b4 <memcpy+0x4c>
    a4e8:	e2423010 	sub	r3, r2, #16
    a4ec:	e3c3300f 	bic	r3, r3, #15
    a4f0:	e202600f 	and	r6, r2, #15
    a4f4:	e2833010 	add	r3, r3, #16
    a4f8:	e3560003 	cmp	r6, #3
    a4fc:	e0811003 	add	r1, r1, r3
    a500:	e0803003 	add	r3, r0, r3
    a504:	9a00001a 	bls	a574 <memcpy+0x10c>
    a508:	e1a04001 	mov	r4, r1
    a50c:	e1a0c006 	mov	ip, r6
    a510:	e243e004 	sub	lr, r3, #4
    a514:	e24cc004 	sub	ip, ip, #4
    a518:	e4945004 	ldr	r5, [r4], #4
    a51c:	e35c0003 	cmp	ip, #3
    a520:	e5ae5004 	str	r5, [lr, #4]!
    a524:	8afffffa 	bhi	a514 <memcpy+0xac>
    a528:	e246c004 	sub	ip, r6, #4
    a52c:	e3ccc003 	bic	ip, ip, #3
    a530:	e28cc004 	add	ip, ip, #4
    a534:	e081100c 	add	r1, r1, ip
    a538:	e083300c 	add	r3, r3, ip
    a53c:	e2022003 	and	r2, r2, #3
    a540:	e3520000 	cmp	r2, #0
    a544:	12433001 	subne	r3, r3, #1
    a548:	10812002 	addne	r2, r1, r2
    a54c:	0a000003 	beq	a560 <memcpy+0xf8>
    a550:	e4d1c001 	ldrb	ip, [r1], #1
    a554:	e1510002 	cmp	r1, r2
    a558:	e5e3c001 	strb	ip, [r3, #1]!
    a55c:	1afffffb 	bne	a550 <memcpy+0xe8>
    a560:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    a564:	e12fff1e 	bx	lr
    a568:	e1a03000 	mov	r3, r0
    a56c:	eaffffc2 	b	a47c <memcpy+0x14>
    a570:	e12fff1e 	bx	lr
    a574:	e1a02006 	mov	r2, r6
    a578:	eafffff0 	b	a540 <memcpy+0xd8>

0000a57c <memmove>:
    a57c:	e1500001 	cmp	r0, r1
    a580:	9a00000a 	bls	a5b0 <memmove+0x34>
    a584:	e0813002 	add	r3, r1, r2
    a588:	e1500003 	cmp	r0, r3
    a58c:	2a000007 	bcs	a5b0 <memmove+0x34>
    a590:	e3520000 	cmp	r2, #0
    a594:	e0802002 	add	r2, r0, r2
    a598:	012fff1e 	bxeq	lr
    a59c:	e573c001 	ldrb	ip, [r3, #-1]!
    a5a0:	e1510003 	cmp	r1, r3
    a5a4:	e562c001 	strb	ip, [r2, #-1]!
    a5a8:	1afffffb 	bne	a59c <memmove+0x20>
    a5ac:	e12fff1e 	bx	lr
    a5b0:	e352000f 	cmp	r2, #15
    a5b4:	8a000009 	bhi	a5e0 <memmove+0x64>
    a5b8:	e3520000 	cmp	r2, #0
    a5bc:	e1a03000 	mov	r3, r0
    a5c0:	0a00003c 	beq	a6b8 <memmove+0x13c>
    a5c4:	e2433001 	sub	r3, r3, #1
    a5c8:	e0812002 	add	r2, r1, r2
    a5cc:	e4d1c001 	ldrb	ip, [r1], #1
    a5d0:	e1520001 	cmp	r2, r1
    a5d4:	e5e3c001 	strb	ip, [r3, #1]!
    a5d8:	1afffffb 	bne	a5cc <memmove+0x50>
    a5dc:	e12fff1e 	bx	lr
    a5e0:	e1813000 	orr	r3, r1, r0
    a5e4:	e3130003 	tst	r3, #3
    a5e8:	1a000030 	bne	a6b0 <memmove+0x134>
    a5ec:	e92d4070 	push	{r4, r5, r6, lr}
    a5f0:	e1a0e002 	mov	lr, r2
    a5f4:	e280c010 	add	ip, r0, #16
    a5f8:	e2813010 	add	r3, r1, #16
    a5fc:	e5134010 	ldr	r4, [r3, #-16]
    a600:	e50c4010 	str	r4, [ip, #-16]
    a604:	e513400c 	ldr	r4, [r3, #-12]
    a608:	e50c400c 	str	r4, [ip, #-12]
    a60c:	e5134008 	ldr	r4, [r3, #-8]
    a610:	e50c4008 	str	r4, [ip, #-8]
    a614:	e24ee010 	sub	lr, lr, #16
    a618:	e5134004 	ldr	r4, [r3, #-4]
    a61c:	e35e000f 	cmp	lr, #15
    a620:	e50c4004 	str	r4, [ip, #-4]
    a624:	e2833010 	add	r3, r3, #16
    a628:	e28cc010 	add	ip, ip, #16
    a62c:	8afffff2 	bhi	a5fc <memmove+0x80>
    a630:	e2423010 	sub	r3, r2, #16
    a634:	e3c3300f 	bic	r3, r3, #15
    a638:	e202600f 	and	r6, r2, #15
    a63c:	e2833010 	add	r3, r3, #16
    a640:	e3560003 	cmp	r6, #3
    a644:	e0811003 	add	r1, r1, r3
    a648:	e0803003 	add	r3, r0, r3
    a64c:	9a00001a 	bls	a6bc <memmove+0x140>
    a650:	e1a04001 	mov	r4, r1
    a654:	e1a0c006 	mov	ip, r6
    a658:	e243e004 	sub	lr, r3, #4
    a65c:	e24cc004 	sub	ip, ip, #4
    a660:	e4945004 	ldr	r5, [r4], #4
    a664:	e35c0003 	cmp	ip, #3
    a668:	e5ae5004 	str	r5, [lr, #4]!
    a66c:	8afffffa 	bhi	a65c <memmove+0xe0>
    a670:	e246c004 	sub	ip, r6, #4
    a674:	e3ccc003 	bic	ip, ip, #3
    a678:	e28cc004 	add	ip, ip, #4
    a67c:	e081100c 	add	r1, r1, ip
    a680:	e083300c 	add	r3, r3, ip
    a684:	e2022003 	and	r2, r2, #3
    a688:	e3520000 	cmp	r2, #0
    a68c:	12433001 	subne	r3, r3, #1
    a690:	10812002 	addne	r2, r1, r2
    a694:	0a000003 	beq	a6a8 <memmove+0x12c>
    a698:	e4d1c001 	ldrb	ip, [r1], #1
    a69c:	e1520001 	cmp	r2, r1
    a6a0:	e5e3c001 	strb	ip, [r3, #1]!
    a6a4:	1afffffb 	bne	a698 <memmove+0x11c>
    a6a8:	e8bd4070 	pop	{r4, r5, r6, lr}
    a6ac:	e12fff1e 	bx	lr
    a6b0:	e1a03000 	mov	r3, r0
    a6b4:	eaffffc2 	b	a5c4 <memmove+0x48>
    a6b8:	e12fff1e 	bx	lr
    a6bc:	e1a02006 	mov	r2, r6
    a6c0:	eafffff0 	b	a688 <memmove+0x10c>

0000a6c4 <memset>:
    a6c4:	e3100003 	tst	r0, #3
    a6c8:	0a000040 	beq	a7d0 <memset+0x10c>
    a6cc:	e3520000 	cmp	r2, #0
    a6d0:	e2422001 	sub	r2, r2, #1
    a6d4:	012fff1e 	bxeq	lr
    a6d8:	e201c0ff 	and	ip, r1, #255	; 0xff
    a6dc:	e1a03000 	mov	r3, r0
    a6e0:	ea000002 	b	a6f0 <memset+0x2c>
    a6e4:	e2422001 	sub	r2, r2, #1
    a6e8:	e3720001 	cmn	r2, #1
    a6ec:	012fff1e 	bxeq	lr
    a6f0:	e4c3c001 	strb	ip, [r3], #1
    a6f4:	e3130003 	tst	r3, #3
    a6f8:	1afffff9 	bne	a6e4 <memset+0x20>
    a6fc:	e3520003 	cmp	r2, #3
    a700:	9a00002a 	bls	a7b0 <memset+0xec>
    a704:	e92d4010 	push	{r4, lr}
    a708:	e201e0ff 	and	lr, r1, #255	; 0xff
    a70c:	e18ee40e 	orr	lr, lr, lr, lsl #8
    a710:	e352000f 	cmp	r2, #15
    a714:	e18ee80e 	orr	lr, lr, lr, lsl #16
    a718:	9a000010 	bls	a760 <memset+0x9c>
    a71c:	e1a04002 	mov	r4, r2
    a720:	e283c010 	add	ip, r3, #16
    a724:	e2444010 	sub	r4, r4, #16
    a728:	e354000f 	cmp	r4, #15
    a72c:	e50ce010 	str	lr, [ip, #-16]
    a730:	e50ce00c 	str	lr, [ip, #-12]
    a734:	e50ce008 	str	lr, [ip, #-8]
    a738:	e50ce004 	str	lr, [ip, #-4]
    a73c:	e28cc010 	add	ip, ip, #16
    a740:	8afffff7 	bhi	a724 <memset+0x60>
    a744:	e242c010 	sub	ip, r2, #16
    a748:	e3ccc00f 	bic	ip, ip, #15
    a74c:	e202200f 	and	r2, r2, #15
    a750:	e28cc010 	add	ip, ip, #16
    a754:	e3520003 	cmp	r2, #3
    a758:	e083300c 	add	r3, r3, ip
    a75c:	9a00000a 	bls	a78c <memset+0xc8>
    a760:	e1a04003 	mov	r4, r3
    a764:	e1a0c002 	mov	ip, r2
    a768:	e24cc004 	sub	ip, ip, #4
    a76c:	e35c0003 	cmp	ip, #3
    a770:	e484e004 	str	lr, [r4], #4
    a774:	8afffffb 	bhi	a768 <memset+0xa4>
    a778:	e242c004 	sub	ip, r2, #4
    a77c:	e3ccc003 	bic	ip, ip, #3
    a780:	e28cc004 	add	ip, ip, #4
    a784:	e083300c 	add	r3, r3, ip
    a788:	e2022003 	and	r2, r2, #3
    a78c:	e3520000 	cmp	r2, #0
    a790:	0a000004 	beq	a7a8 <memset+0xe4>
    a794:	e20110ff 	and	r1, r1, #255	; 0xff
    a798:	e0832002 	add	r2, r3, r2
    a79c:	e4c31001 	strb	r1, [r3], #1
    a7a0:	e1520003 	cmp	r2, r3
    a7a4:	1afffffc 	bne	a79c <memset+0xd8>
    a7a8:	e8bd4010 	pop	{r4, lr}
    a7ac:	e12fff1e 	bx	lr
    a7b0:	e3520000 	cmp	r2, #0
    a7b4:	012fff1e 	bxeq	lr
    a7b8:	e20110ff 	and	r1, r1, #255	; 0xff
    a7bc:	e0832002 	add	r2, r3, r2
    a7c0:	e4c31001 	strb	r1, [r3], #1
    a7c4:	e1520003 	cmp	r2, r3
    a7c8:	1afffffc 	bne	a7c0 <memset+0xfc>
    a7cc:	e12fff1e 	bx	lr
    a7d0:	e1a03000 	mov	r3, r0
    a7d4:	eaffffc8 	b	a6fc <memset+0x38>

0000a7d8 <__sprint_r.part.0>:
    a7d8:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a7dc:	e5913064 	ldr	r3, [r1, #100]	; 0x64
    a7e0:	e3130a02 	tst	r3, #8192	; 0x2000
    a7e4:	e1a0b002 	mov	fp, r2
    a7e8:	0a000024 	beq	a880 <__sprint_r.part.0+0xa8>
    a7ec:	e5923008 	ldr	r3, [r2, #8]
    a7f0:	e5929000 	ldr	r9, [r2]
    a7f4:	e3530000 	cmp	r3, #0
    a7f8:	11a06001 	movne	r6, r1
    a7fc:	11a07000 	movne	r7, r0
    a800:	12899008 	addne	r9, r9, #8
    a804:	0a00001b 	beq	a878 <__sprint_r.part.0+0xa0>
    a808:	e519a004 	ldr	sl, [r9, #-4]
    a80c:	e5195008 	ldr	r5, [r9, #-8]
    a810:	e1b0812a 	lsrs	r8, sl, #2
    a814:	13a04000 	movne	r4, #0
    a818:	12455004 	subne	r5, r5, #4
    a81c:	1a000002 	bne	a82c <__sprint_r.part.0+0x54>
    a820:	ea00000e 	b	a860 <__sprint_r.part.0+0x88>
    a824:	e1580004 	cmp	r8, r4
    a828:	0a00000b 	beq	a85c <__sprint_r.part.0+0x84>
    a82c:	e1a02006 	mov	r2, r6
    a830:	e5b51004 	ldr	r1, [r5, #4]!
    a834:	e1a00007 	mov	r0, r7
    a838:	eb000777 	bl	c61c <_fputwc_r>
    a83c:	e3700001 	cmn	r0, #1
    a840:	e2844001 	add	r4, r4, #1
    a844:	1afffff6 	bne	a824 <__sprint_r.part.0+0x4c>
    a848:	e3a03000 	mov	r3, #0
    a84c:	e58b3008 	str	r3, [fp, #8]
    a850:	e58b3004 	str	r3, [fp, #4]
    a854:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a858:	e12fff1e 	bx	lr
    a85c:	e59b3008 	ldr	r3, [fp, #8]
    a860:	e3caa003 	bic	sl, sl, #3
    a864:	e043300a 	sub	r3, r3, sl
    a868:	e3530000 	cmp	r3, #0
    a86c:	e58b3008 	str	r3, [fp, #8]
    a870:	e2899008 	add	r9, r9, #8
    a874:	1affffe3 	bne	a808 <__sprint_r.part.0+0x30>
    a878:	e3a00000 	mov	r0, #0
    a87c:	eafffff1 	b	a848 <__sprint_r.part.0+0x70>
    a880:	eb00089d 	bl	cafc <__sfvwrite_r>
    a884:	eaffffef 	b	a848 <__sprint_r.part.0+0x70>

0000a888 <__sprint_r>:
    a888:	e5923008 	ldr	r3, [r2, #8]
    a88c:	e3530000 	cmp	r3, #0
    a890:	1affffd0 	bne	a7d8 <__sprint_r.part.0>
    a894:	e5823004 	str	r3, [r2, #4]
    a898:	e1a00003 	mov	r0, r3
    a89c:	e12fff1e 	bx	lr

0000a8a0 <_vfiprintf_r>:
    a8a0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    a8a4:	e1a05003 	mov	r5, r3
    a8a8:	e24dd0b4 	sub	sp, sp, #180	; 0xb4
    a8ac:	e2503000 	subs	r3, r0, #0
    a8b0:	e58d3014 	str	r3, [sp, #20]
    a8b4:	e1a0a001 	mov	sl, r1
    a8b8:	e1a09002 	mov	r9, r2
    a8bc:	e58d5018 	str	r5, [sp, #24]
    a8c0:	0a000002 	beq	a8d0 <_vfiprintf_r+0x30>
    a8c4:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    a8c8:	e3530000 	cmp	r3, #0
    a8cc:	0a0000cf 	beq	ac10 <_vfiprintf_r+0x370>
    a8d0:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    a8d4:	e3130001 	tst	r3, #1
    a8d8:	e1da30fc 	ldrsh	r3, [sl, #12]
    a8dc:	e1a01803 	lsl	r1, r3, #16
    a8e0:	1a0000a7 	bne	ab84 <_vfiprintf_r+0x2e4>
    a8e4:	e3110402 	tst	r1, #33554432	; 0x2000000
    a8e8:	e1a01821 	lsr	r1, r1, #16
    a8ec:	0a0000a0 	beq	ab74 <_vfiprintf_r+0x2d4>
    a8f0:	e3110a02 	tst	r1, #8192	; 0x2000
    a8f4:	1a000006 	bne	a914 <_vfiprintf_r+0x74>
    a8f8:	e59a2064 	ldr	r2, [sl, #100]	; 0x64
    a8fc:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    a900:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
    a904:	e1ca30bc 	strh	r3, [sl, #12]
    a908:	e58a2064 	str	r2, [sl, #100]	; 0x64
    a90c:	e1a03803 	lsl	r3, r3, #16
    a910:	e1a01823 	lsr	r1, r3, #16
    a914:	e3110008 	tst	r1, #8
    a918:	0a0000a0 	beq	aba0 <_vfiprintf_r+0x300>
    a91c:	e59a3010 	ldr	r3, [sl, #16]
    a920:	e3530000 	cmp	r3, #0
    a924:	0a00009d 	beq	aba0 <_vfiprintf_r+0x300>
    a928:	e201301a 	and	r3, r1, #26
    a92c:	e353000a 	cmp	r3, #10
    a930:	0a0000a3 	beq	abc4 <_vfiprintf_r+0x324>
    a934:	e3a03000 	mov	r3, #0
    a938:	e28d8070 	add	r8, sp, #112	; 0x70
    a93c:	e1a0b008 	mov	fp, r8
    a940:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    a944:	e58d3008 	str	r3, [sp, #8]
    a948:	e58d3044 	str	r3, [sp, #68]	; 0x44
    a94c:	e58d3040 	str	r3, [sp, #64]	; 0x40
    a950:	e58d803c 	str	r8, [sp, #60]	; 0x3c
    a954:	e58da00c 	str	sl, [sp, #12]
    a958:	e5d93000 	ldrb	r3, [r9]
    a95c:	e3530000 	cmp	r3, #0
    a960:	13530025 	cmpne	r3, #37	; 0x25
    a964:	e1a04009 	mov	r4, r9
    a968:	0a000013 	beq	a9bc <_vfiprintf_r+0x11c>
    a96c:	e5f43001 	ldrb	r3, [r4, #1]!
    a970:	e3530000 	cmp	r3, #0
    a974:	13530025 	cmpne	r3, #37	; 0x25
    a978:	1afffffb 	bne	a96c <_vfiprintf_r+0xcc>
    a97c:	e0545009 	subs	r5, r4, r9
    a980:	0a00000d 	beq	a9bc <_vfiprintf_r+0x11c>
    a984:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    a988:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    a98c:	e2833001 	add	r3, r3, #1
    a990:	e3530007 	cmp	r3, #7
    a994:	e0852002 	add	r2, r5, r2
    a998:	e58b9000 	str	r9, [fp]
    a99c:	e58b5004 	str	r5, [fp, #4]
    a9a0:	e58d3040 	str	r3, [sp, #64]	; 0x40
    a9a4:	e58d2044 	str	r2, [sp, #68]	; 0x44
    a9a8:	d28bb008 	addle	fp, fp, #8
    a9ac:	ca000076 	bgt	ab8c <_vfiprintf_r+0x2ec>
    a9b0:	e59d3008 	ldr	r3, [sp, #8]
    a9b4:	e0833005 	add	r3, r3, r5
    a9b8:	e58d3008 	str	r3, [sp, #8]
    a9bc:	e5d43000 	ldrb	r3, [r4]
    a9c0:	e3530000 	cmp	r3, #0
    a9c4:	0a00042f 	beq	ba88 <_vfiprintf_r+0x11e8>
    a9c8:	e3a01000 	mov	r1, #0
    a9cc:	e3a03000 	mov	r3, #0
    a9d0:	e3e0a000 	mvn	sl, #0
    a9d4:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    a9d8:	e2849001 	add	r9, r4, #1
    a9dc:	e5d43001 	ldrb	r3, [r4, #1]
    a9e0:	e1a0c001 	mov	ip, r1
    a9e4:	e1a00001 	mov	r0, r1
    a9e8:	e1a05001 	mov	r5, r1
    a9ec:	e1a0700a 	mov	r7, sl
    a9f0:	e3a0e001 	mov	lr, #1
    a9f4:	e3a0402b 	mov	r4, #43	; 0x2b
    a9f8:	e3a06020 	mov	r6, #32
    a9fc:	e2899001 	add	r9, r9, #1
    aa00:	e2432020 	sub	r2, r3, #32
    aa04:	e3520058 	cmp	r2, #88	; 0x58
    aa08:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
    aa0c:	ea000220 	b	b294 <_vfiprintf_r+0x9f4>
    aa10:	0000b280 	.word	0x0000b280
    aa14:	0000b294 	.word	0x0000b294
    aa18:	0000b294 	.word	0x0000b294
    aa1c:	0000b25c 	.word	0x0000b25c
    aa20:	0000b294 	.word	0x0000b294
    aa24:	0000b294 	.word	0x0000b294
    aa28:	0000b294 	.word	0x0000b294
    aa2c:	0000b294 	.word	0x0000b294
    aa30:	0000b294 	.word	0x0000b294
    aa34:	0000b294 	.word	0x0000b294
    aa38:	0000ac18 	.word	0x0000ac18
    aa3c:	0000b068 	.word	0x0000b068
    aa40:	0000b294 	.word	0x0000b294
    aa44:	0000ac34 	.word	0x0000ac34
    aa48:	0000b000 	.word	0x0000b000
    aa4c:	0000b294 	.word	0x0000b294
    aa50:	0000b078 	.word	0x0000b078
    aa54:	0000b084 	.word	0x0000b084
    aa58:	0000b084 	.word	0x0000b084
    aa5c:	0000b084 	.word	0x0000b084
    aa60:	0000b084 	.word	0x0000b084
    aa64:	0000b084 	.word	0x0000b084
    aa68:	0000b084 	.word	0x0000b084
    aa6c:	0000b084 	.word	0x0000b084
    aa70:	0000b084 	.word	0x0000b084
    aa74:	0000b084 	.word	0x0000b084
    aa78:	0000b294 	.word	0x0000b294
    aa7c:	0000b294 	.word	0x0000b294
    aa80:	0000b294 	.word	0x0000b294
    aa84:	0000b294 	.word	0x0000b294
    aa88:	0000b294 	.word	0x0000b294
    aa8c:	0000b294 	.word	0x0000b294
    aa90:	0000b294 	.word	0x0000b294
    aa94:	0000b294 	.word	0x0000b294
    aa98:	0000b294 	.word	0x0000b294
    aa9c:	0000b294 	.word	0x0000b294
    aaa0:	0000b0a8 	.word	0x0000b0a8
    aaa4:	0000b294 	.word	0x0000b294
    aaa8:	0000b294 	.word	0x0000b294
    aaac:	0000b294 	.word	0x0000b294
    aab0:	0000b294 	.word	0x0000b294
    aab4:	0000b294 	.word	0x0000b294
    aab8:	0000b294 	.word	0x0000b294
    aabc:	0000b294 	.word	0x0000b294
    aac0:	0000b294 	.word	0x0000b294
    aac4:	0000b294 	.word	0x0000b294
    aac8:	0000b294 	.word	0x0000b294
    aacc:	0000af3c 	.word	0x0000af3c
    aad0:	0000b294 	.word	0x0000b294
    aad4:	0000b294 	.word	0x0000b294
    aad8:	0000b294 	.word	0x0000b294
    aadc:	0000b294 	.word	0x0000b294
    aae0:	0000b294 	.word	0x0000b294
    aae4:	0000af48 	.word	0x0000af48
    aae8:	0000b294 	.word	0x0000b294
    aaec:	0000b294 	.word	0x0000b294
    aaf0:	0000b1ac 	.word	0x0000b1ac
    aaf4:	0000b294 	.word	0x0000b294
    aaf8:	0000b294 	.word	0x0000b294
    aafc:	0000b294 	.word	0x0000b294
    ab00:	0000b294 	.word	0x0000b294
    ab04:	0000b294 	.word	0x0000b294
    ab08:	0000b294 	.word	0x0000b294
    ab0c:	0000b294 	.word	0x0000b294
    ab10:	0000b294 	.word	0x0000b294
    ab14:	0000b294 	.word	0x0000b294
    ab18:	0000b294 	.word	0x0000b294
    ab1c:	0000b220 	.word	0x0000b220
    ab20:	0000b19c 	.word	0x0000b19c
    ab24:	0000b294 	.word	0x0000b294
    ab28:	0000b294 	.word	0x0000b294
    ab2c:	0000b294 	.word	0x0000b294
    ab30:	0000b040 	.word	0x0000b040
    ab34:	0000b19c 	.word	0x0000b19c
    ab38:	0000b294 	.word	0x0000b294
    ab3c:	0000b294 	.word	0x0000b294
    ab40:	0000b04c 	.word	0x0000b04c
    ab44:	0000b294 	.word	0x0000b294
    ab48:	0000b160 	.word	0x0000b160
    ab4c:	0000af00 	.word	0x0000af00
    ab50:	0000af54 	.word	0x0000af54
    ab54:	0000af90 	.word	0x0000af90
    ab58:	0000b294 	.word	0x0000b294
    ab5c:	0000af9c 	.word	0x0000af9c
    ab60:	0000b294 	.word	0x0000b294
    ab64:	0000ac40 	.word	0x0000ac40
    ab68:	0000b294 	.word	0x0000b294
    ab6c:	0000b294 	.word	0x0000b294
    ab70:	0000b268 	.word	0x0000b268
    ab74:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    ab78:	eb000995 	bl	d1d4 <__retarget_lock_acquire_recursive>
    ab7c:	e1da30fc 	ldrsh	r3, [sl, #12]
    ab80:	e1a01803 	lsl	r1, r3, #16
    ab84:	e1a01821 	lsr	r1, r1, #16
    ab88:	eaffff58 	b	a8f0 <_vfiprintf_r+0x50>
    ab8c:	e3520000 	cmp	r2, #0
    ab90:	1a000314 	bne	b7e8 <_vfiprintf_r+0xf48>
    ab94:	e58d2040 	str	r2, [sp, #64]	; 0x40
    ab98:	e1a0b008 	mov	fp, r8
    ab9c:	eaffff83 	b	a9b0 <_vfiprintf_r+0x110>
    aba0:	e1a0100a 	mov	r1, sl
    aba4:	e59d0014 	ldr	r0, [sp, #20]
    aba8:	eb000438 	bl	bc90 <__swsetup_r>
    abac:	e3500000 	cmp	r0, #0
    abb0:	1a0002f6 	bne	b790 <_vfiprintf_r+0xef0>
    abb4:	e1da10bc 	ldrh	r1, [sl, #12]
    abb8:	e201301a 	and	r3, r1, #26
    abbc:	e353000a 	cmp	r3, #10
    abc0:	1affff5b 	bne	a934 <_vfiprintf_r+0x94>
    abc4:	e1da30fe 	ldrsh	r3, [sl, #14]
    abc8:	e3530000 	cmp	r3, #0
    abcc:	baffff58 	blt	a934 <_vfiprintf_r+0x94>
    abd0:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    abd4:	e3130001 	tst	r3, #1
    abd8:	1a000002 	bne	abe8 <_vfiprintf_r+0x348>
    abdc:	e3110c02 	tst	r1, #512	; 0x200
    abe0:	059a0058 	ldreq	r0, [sl, #88]	; 0x58
    abe4:	0b000980 	bleq	d1ec <__retarget_lock_release_recursive>
    abe8:	e1a03005 	mov	r3, r5
    abec:	e1a02009 	mov	r2, r9
    abf0:	e1a0100a 	mov	r1, sl
    abf4:	e59d0014 	ldr	r0, [sp, #20]
    abf8:	eb0003f0 	bl	bbc0 <__sbprintf>
    abfc:	e58d0008 	str	r0, [sp, #8]
    ac00:	e59d0008 	ldr	r0, [sp, #8]
    ac04:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    ac08:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ac0c:	e12fff1e 	bx	lr
    ac10:	eb0005a0 	bl	c298 <__sinit>
    ac14:	eaffff2d 	b	a8d0 <_vfiprintf_r+0x30>
    ac18:	e59d3018 	ldr	r3, [sp, #24]
    ac1c:	e5930000 	ldr	r0, [r3]
    ac20:	e2833004 	add	r3, r3, #4
    ac24:	e3500000 	cmp	r0, #0
    ac28:	e58d3018 	str	r3, [sp, #24]
    ac2c:	aa000001 	bge	ac38 <_vfiprintf_r+0x398>
    ac30:	e2600000 	rsb	r0, r0, #0
    ac34:	e3855004 	orr	r5, r5, #4
    ac38:	e5d93000 	ldrb	r3, [r9]
    ac3c:	eaffff6e 	b	a9fc <_vfiprintf_r+0x15c>
    ac40:	e58d001c 	str	r0, [sp, #28]
    ac44:	e3150020 	tst	r5, #32
    ac48:	1a00032b 	bne	b8fc <_vfiprintf_r+0x105c>
    ac4c:	e59d2018 	ldr	r2, [sp, #24]
    ac50:	e3150010 	tst	r5, #16
    ac54:	e1a03002 	mov	r3, r2
    ac58:	1a0002f0 	bne	b820 <_vfiprintf_r+0xf80>
    ac5c:	e3150040 	tst	r5, #64	; 0x40
    ac60:	0a0002ee 	beq	b820 <_vfiprintf_r+0xf80>
    ac64:	e3a03001 	mov	r3, #1
    ac68:	e3a07000 	mov	r7, #0
    ac6c:	e1d260b0 	ldrh	r6, [r2]
    ac70:	e2822004 	add	r2, r2, #4
    ac74:	e58d2018 	str	r2, [sp, #24]
    ac78:	e3a02000 	mov	r2, #0
    ac7c:	e3a04000 	mov	r4, #0
    ac80:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    ac84:	e37a0001 	cmn	sl, #1
    ac88:	0a00011e 	beq	b108 <_vfiprintf_r+0x868>
    ac8c:	e1862007 	orr	r2, r6, r7
    ac90:	e3520000 	cmp	r2, #0
    ac94:	035a0000 	cmpeq	sl, #0
    ac98:	e3c52080 	bic	r2, r5, #128	; 0x80
    ac9c:	e58d2004 	str	r2, [sp, #4]
    aca0:	1a000298 	bne	b708 <_vfiprintf_r+0xe68>
    aca4:	e3530000 	cmp	r3, #0
    aca8:	1a000292 	bne	b6f8 <_vfiprintf_r+0xe58>
    acac:	e2153001 	ands	r3, r5, #1
    acb0:	e58d3010 	str	r3, [sp, #16]
    acb4:	058d8024 	streq	r8, [sp, #36]	; 0x24
    acb8:	13a03030 	movne	r3, #48	; 0x30
    acbc:	128d20b0 	addne	r2, sp, #176	; 0xb0
    acc0:	15623041 	strbne	r3, [r2, #-65]!	; 0xffffffbf
    acc4:	158d2024 	strne	r2, [sp, #36]	; 0x24
    acc8:	e59d3010 	ldr	r3, [sp, #16]
    accc:	e15a0003 	cmp	sl, r3
    acd0:	a1a0700a 	movge	r7, sl
    acd4:	b1a07003 	movlt	r7, r3
    acd8:	e3540000 	cmp	r4, #0
    acdc:	12877001 	addne	r7, r7, #1
    ace0:	e59d3004 	ldr	r3, [sp, #4]
    ace4:	e2133002 	ands	r3, r3, #2
    ace8:	e58d3020 	str	r3, [sp, #32]
    acec:	e59d3004 	ldr	r3, [sp, #4]
    acf0:	12877002 	addne	r7, r7, #2
    acf4:	e2136084 	ands	r6, r3, #132	; 0x84
    acf8:	1a00018d 	bne	b334 <_vfiprintf_r+0xa94>
    acfc:	e59d301c 	ldr	r3, [sp, #28]
    ad00:	e0434007 	sub	r4, r3, r7
    ad04:	e3540000 	cmp	r4, #0
    ad08:	da000189 	ble	b334 <_vfiprintf_r+0xa94>
    ad0c:	e3540010 	cmp	r4, #16
    ad10:	da000378 	ble	baf8 <_vfiprintf_r+0x1258>
    ad14:	e1a0e00b 	mov	lr, fp
    ad18:	e3a05010 	mov	r5, #16
    ad1c:	e1a0b007 	mov	fp, r7
    ad20:	e3a03001 	mov	r3, #1
    ad24:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    ad28:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    ad2c:	e59d7014 	ldr	r7, [sp, #20]
    ad30:	ea000005 	b	ad4c <_vfiprintf_r+0x4ac>
    ad34:	e28c1002 	add	r1, ip, #2
    ad38:	e1a0c000 	mov	ip, r0
    ad3c:	e28ee008 	add	lr, lr, #8
    ad40:	e2444010 	sub	r4, r4, #16
    ad44:	e3540010 	cmp	r4, #16
    ad48:	da00000f 	ble	ad8c <_vfiprintf_r+0x4ec>
    ad4c:	e28c0001 	add	r0, ip, #1
    ad50:	e59f1e38 	ldr	r1, [pc, #3640]	; bb90 <_vfiprintf_r+0x12f0>
    ad54:	e2822010 	add	r2, r2, #16
    ad58:	e3500007 	cmp	r0, #7
    ad5c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ad60:	e88e0022 	stm	lr, {r1, r5}
    ad64:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ad68:	dafffff1 	ble	ad34 <_vfiprintf_r+0x494>
    ad6c:	e3520000 	cmp	r2, #0
    ad70:	1a00015b 	bne	b2e4 <_vfiprintf_r+0xa44>
    ad74:	e2444010 	sub	r4, r4, #16
    ad78:	e3540010 	cmp	r4, #16
    ad7c:	e1a0c006 	mov	ip, r6
    ad80:	e1a01003 	mov	r1, r3
    ad84:	e1a0e008 	mov	lr, r8
    ad88:	caffffef 	bgt	ad4c <_vfiprintf_r+0x4ac>
    ad8c:	e1a0700b 	mov	r7, fp
    ad90:	e1a0b00e 	mov	fp, lr
    ad94:	e59f3df4 	ldr	r3, [pc, #3572]	; bb90 <_vfiprintf_r+0x12f0>
    ad98:	e3510007 	cmp	r1, #7
    ad9c:	e0842002 	add	r2, r4, r2
    ada0:	e88b0018 	stm	fp, {r3, r4}
    ada4:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ada8:	e58d1040 	str	r1, [sp, #64]	; 0x40
    adac:	d28bb008 	addle	fp, fp, #8
    adb0:	d2810001 	addle	r0, r1, #1
    adb4:	da000161 	ble	b340 <_vfiprintf_r+0xaa0>
    adb8:	e3520000 	cmp	r2, #0
    adbc:	1a000155 	bne	b318 <_vfiprintf_r+0xa78>
    adc0:	e5dd1037 	ldrb	r1, [sp, #55]	; 0x37
    adc4:	e3510000 	cmp	r1, #0
    adc8:	0a0002fb 	beq	b9bc <_vfiprintf_r+0x111c>
    adcc:	e3a02001 	mov	r2, #1
    add0:	e1a0b008 	mov	fp, r8
    add4:	e1a00002 	mov	r0, r2
    add8:	e28d1037 	add	r1, sp, #55	; 0x37
    addc:	e58d2074 	str	r2, [sp, #116]	; 0x74
    ade0:	e58d1070 	str	r1, [sp, #112]	; 0x70
    ade4:	e1a01000 	mov	r1, r0
    ade8:	e28bb008 	add	fp, fp, #8
    adec:	e2800001 	add	r0, r0, #1
    adf0:	e59d3020 	ldr	r3, [sp, #32]
    adf4:	e3530000 	cmp	r3, #0
    adf8:	0a00016a 	beq	b3a8 <_vfiprintf_r+0xb08>
    adfc:	e3a01002 	mov	r1, #2
    ae00:	e28d3038 	add	r3, sp, #56	; 0x38
    ae04:	e0822001 	add	r2, r2, r1
    ae08:	e3500007 	cmp	r0, #7
    ae0c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ae10:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ae14:	e58b1004 	str	r1, [fp, #4]
    ae18:	e58b3000 	str	r3, [fp]
    ae1c:	da00015e 	ble	b39c <_vfiprintf_r+0xafc>
    ae20:	e3520000 	cmp	r2, #0
    ae24:	1a000292 	bne	b874 <_vfiprintf_r+0xfd4>
    ae28:	e3560080 	cmp	r6, #128	; 0x80
    ae2c:	e3a00001 	mov	r0, #1
    ae30:	e3a01000 	mov	r1, #0
    ae34:	e1a0b008 	mov	fp, r8
    ae38:	1a00015c 	bne	b3b0 <_vfiprintf_r+0xb10>
    ae3c:	e59d301c 	ldr	r3, [sp, #28]
    ae40:	e0434007 	sub	r4, r3, r7
    ae44:	e3540000 	cmp	r4, #0
    ae48:	da000158 	ble	b3b0 <_vfiprintf_r+0xb10>
    ae4c:	e3540010 	cmp	r4, #16
    ae50:	da00033b 	ble	bb44 <_vfiprintf_r+0x12a4>
    ae54:	e1a0e00b 	mov	lr, fp
    ae58:	e3a05010 	mov	r5, #16
    ae5c:	e1a0b007 	mov	fp, r7
    ae60:	e3a06001 	mov	r6, #1
    ae64:	e1a07004 	mov	r7, r4
    ae68:	e59d4014 	ldr	r4, [sp, #20]
    ae6c:	ea000005 	b	ae88 <_vfiprintf_r+0x5e8>
    ae70:	e281c002 	add	ip, r1, #2
    ae74:	e1a01000 	mov	r1, r0
    ae78:	e28ee008 	add	lr, lr, #8
    ae7c:	e2477010 	sub	r7, r7, #16
    ae80:	e3570010 	cmp	r7, #16
    ae84:	da00000f 	ble	aec8 <_vfiprintf_r+0x628>
    ae88:	e2810001 	add	r0, r1, #1
    ae8c:	e59f3d00 	ldr	r3, [pc, #3328]	; bb94 <_vfiprintf_r+0x12f4>
    ae90:	e2822010 	add	r2, r2, #16
    ae94:	e3500007 	cmp	r0, #7
    ae98:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ae9c:	e88e0028 	stm	lr, {r3, r5}
    aea0:	e58d0040 	str	r0, [sp, #64]	; 0x40
    aea4:	dafffff1 	ble	ae70 <_vfiprintf_r+0x5d0>
    aea8:	e3520000 	cmp	r2, #0
    aeac:	1a000206 	bne	b6cc <_vfiprintf_r+0xe2c>
    aeb0:	e2477010 	sub	r7, r7, #16
    aeb4:	e3570010 	cmp	r7, #16
    aeb8:	e1a0c006 	mov	ip, r6
    aebc:	e3a01000 	mov	r1, #0
    aec0:	e1a0e008 	mov	lr, r8
    aec4:	caffffef 	bgt	ae88 <_vfiprintf_r+0x5e8>
    aec8:	e1a04007 	mov	r4, r7
    aecc:	e1a0700b 	mov	r7, fp
    aed0:	e1a0b00e 	mov	fp, lr
    aed4:	e59f3cb8 	ldr	r3, [pc, #3256]	; bb94 <_vfiprintf_r+0x12f4>
    aed8:	e0822004 	add	r2, r2, r4
    aedc:	e35c0007 	cmp	ip, #7
    aee0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    aee4:	e88b0018 	stm	fp, {r3, r4}
    aee8:	e58dc040 	str	ip, [sp, #64]	; 0x40
    aeec:	ca00026b 	bgt	b8a0 <_vfiprintf_r+0x1000>
    aef0:	e28bb008 	add	fp, fp, #8
    aef4:	e28c0001 	add	r0, ip, #1
    aef8:	e1a0100c 	mov	r1, ip
    aefc:	ea00012b 	b	b3b0 <_vfiprintf_r+0xb10>
    af00:	e58d001c 	str	r0, [sp, #28]
    af04:	e3150020 	tst	r5, #32
    af08:	1a000283 	bne	b91c <_vfiprintf_r+0x107c>
    af0c:	e59d2018 	ldr	r2, [sp, #24]
    af10:	e3150010 	tst	r5, #16
    af14:	e1a03002 	mov	r3, r2
    af18:	1a00023a 	bne	b808 <_vfiprintf_r+0xf68>
    af1c:	e3150040 	tst	r5, #64	; 0x40
    af20:	0a000238 	beq	b808 <_vfiprintf_r+0xf68>
    af24:	e1d260b0 	ldrh	r6, [r2]
    af28:	e2822004 	add	r2, r2, #4
    af2c:	e3a03000 	mov	r3, #0
    af30:	e58d2018 	str	r2, [sp, #24]
    af34:	e3a07000 	mov	r7, #0
    af38:	eaffff4e 	b	ac78 <_vfiprintf_r+0x3d8>
    af3c:	e58d001c 	str	r0, [sp, #28]
    af40:	e3855010 	orr	r5, r5, #16
    af44:	eaffffee 	b	af04 <_vfiprintf_r+0x664>
    af48:	e58d001c 	str	r0, [sp, #28]
    af4c:	e3855010 	orr	r5, r5, #16
    af50:	eaffff3b 	b	ac44 <_vfiprintf_r+0x3a4>
    af54:	e3a03078 	mov	r3, #120	; 0x78
    af58:	e3a02030 	mov	r2, #48	; 0x30
    af5c:	e59d1018 	ldr	r1, [sp, #24]
    af60:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    af64:	e2813004 	add	r3, r1, #4
    af68:	e58d3018 	str	r3, [sp, #24]
    af6c:	e59f3c24 	ldr	r3, [pc, #3108]	; bb98 <_vfiprintf_r+0x12f8>
    af70:	e58d001c 	str	r0, [sp, #28]
    af74:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    af78:	e5916000 	ldr	r6, [r1]
    af7c:	e3855002 	orr	r5, r5, #2
    af80:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    af84:	e3a07000 	mov	r7, #0
    af88:	e3a03002 	mov	r3, #2
    af8c:	eaffff39 	b	ac78 <_vfiprintf_r+0x3d8>
    af90:	e3855020 	orr	r5, r5, #32
    af94:	e5d93000 	ldrb	r3, [r9]
    af98:	eafffe97 	b	a9fc <_vfiprintf_r+0x15c>
    af9c:	e59d3018 	ldr	r3, [sp, #24]
    afa0:	e5932000 	ldr	r2, [r3]
    afa4:	e58d2024 	str	r2, [sp, #36]	; 0x24
    afa8:	e3520000 	cmp	r2, #0
    afac:	e3a02000 	mov	r2, #0
    afb0:	e58d001c 	str	r0, [sp, #28]
    afb4:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    afb8:	e2834004 	add	r4, r3, #4
    afbc:	0a0002d1 	beq	bb08 <_vfiprintf_r+0x1268>
    afc0:	e37a0001 	cmn	sl, #1
    afc4:	0a0002b8 	beq	baac <_vfiprintf_r+0x120c>
    afc8:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
    afcc:	e1a0200a 	mov	r2, sl
    afd0:	e3a01000 	mov	r1, #0
    afd4:	e1a00006 	mov	r0, r6
    afd8:	eb000aef 	bl	db9c <memchr>
    afdc:	e3500000 	cmp	r0, #0
    afe0:	0a0002d1 	beq	bb2c <_vfiprintf_r+0x128c>
    afe4:	e0403006 	sub	r3, r0, r6
    afe8:	e58d4018 	str	r4, [sp, #24]
    afec:	e58d3010 	str	r3, [sp, #16]
    aff0:	e58d5004 	str	r5, [sp, #4]
    aff4:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    aff8:	e3a0a000 	mov	sl, #0
    affc:	eaffff31 	b	acc8 <_vfiprintf_r+0x428>
    b000:	e5d93000 	ldrb	r3, [r9]
    b004:	e353002a 	cmp	r3, #42	; 0x2a
    b008:	e289a001 	add	sl, r9, #1
    b00c:	0a0002d5 	beq	bb68 <_vfiprintf_r+0x12c8>
    b010:	e2432030 	sub	r2, r3, #48	; 0x30
    b014:	e3520009 	cmp	r2, #9
    b018:	e1a0900a 	mov	r9, sl
    b01c:	e3a0a000 	mov	sl, #0
    b020:	8afffe76 	bhi	aa00 <_vfiprintf_r+0x160>
    b024:	e4d93001 	ldrb	r3, [r9], #1
    b028:	e08aa10a 	add	sl, sl, sl, lsl #2
    b02c:	e082a08a 	add	sl, r2, sl, lsl #1
    b030:	e2432030 	sub	r2, r3, #48	; 0x30
    b034:	e3520009 	cmp	r2, #9
    b038:	9afffff9 	bls	b024 <_vfiprintf_r+0x784>
    b03c:	eafffe6f 	b	aa00 <_vfiprintf_r+0x160>
    b040:	e3855040 	orr	r5, r5, #64	; 0x40
    b044:	e5d93000 	ldrb	r3, [r9]
    b048:	eafffe6b 	b	a9fc <_vfiprintf_r+0x15c>
    b04c:	e5d93000 	ldrb	r3, [r9]
    b050:	e353006c 	cmp	r3, #108	; 0x6c
    b054:	05d93001 	ldrbeq	r3, [r9, #1]
    b058:	03855020 	orreq	r5, r5, #32
    b05c:	02899001 	addeq	r9, r9, #1
    b060:	13855010 	orrne	r5, r5, #16
    b064:	eafffe64 	b	a9fc <_vfiprintf_r+0x15c>
    b068:	e5d93000 	ldrb	r3, [r9]
    b06c:	e1a0100e 	mov	r1, lr
    b070:	e1a0c004 	mov	ip, r4
    b074:	eafffe60 	b	a9fc <_vfiprintf_r+0x15c>
    b078:	e3855080 	orr	r5, r5, #128	; 0x80
    b07c:	e5d93000 	ldrb	r3, [r9]
    b080:	eafffe5d 	b	a9fc <_vfiprintf_r+0x15c>
    b084:	e3a00000 	mov	r0, #0
    b088:	e2432030 	sub	r2, r3, #48	; 0x30
    b08c:	e4d93001 	ldrb	r3, [r9], #1
    b090:	e0800100 	add	r0, r0, r0, lsl #2
    b094:	e0820080 	add	r0, r2, r0, lsl #1
    b098:	e2432030 	sub	r2, r3, #48	; 0x30
    b09c:	e3520009 	cmp	r2, #9
    b0a0:	9afffff9 	bls	b08c <_vfiprintf_r+0x7ec>
    b0a4:	eafffe55 	b	aa00 <_vfiprintf_r+0x160>
    b0a8:	e3510000 	cmp	r1, #0
    b0ac:	e58d001c 	str	r0, [sp, #28]
    b0b0:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b0b4:	e3855010 	orr	r5, r5, #16
    b0b8:	e3150020 	tst	r5, #32
    b0bc:	1a0001ff 	bne	b8c0 <_vfiprintf_r+0x1020>
    b0c0:	e3150010 	tst	r5, #16
    b0c4:	1a00025a 	bne	ba34 <_vfiprintf_r+0x1194>
    b0c8:	e3150040 	tst	r5, #64	; 0x40
    b0cc:	0a000241 	beq	b9d8 <_vfiprintf_r+0x1138>
    b0d0:	e59d3018 	ldr	r3, [sp, #24]
    b0d4:	e1d360f0 	ldrsh	r6, [r3]
    b0d8:	e2833004 	add	r3, r3, #4
    b0dc:	e1a07fc6 	asr	r7, r6, #31
    b0e0:	e58d3018 	str	r3, [sp, #24]
    b0e4:	e1a02006 	mov	r2, r6
    b0e8:	e1a03007 	mov	r3, r7
    b0ec:	e3520000 	cmp	r2, #0
    b0f0:	e2d33000 	sbcs	r3, r3, #0
    b0f4:	ba000229 	blt	b9a0 <_vfiprintf_r+0x1100>
    b0f8:	e37a0001 	cmn	sl, #1
    b0fc:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    b100:	e3a03001 	mov	r3, #1
    b104:	1afffee0 	bne	ac8c <_vfiprintf_r+0x3ec>
    b108:	e3530001 	cmp	r3, #1
    b10c:	0a000180 	beq	b714 <_vfiprintf_r+0xe74>
    b110:	e3530002 	cmp	r3, #2
    b114:	11a01008 	movne	r1, r8
    b118:	1a000153 	bne	b66c <_vfiprintf_r+0xdcc>
    b11c:	e1a02008 	mov	r2, r8
    b120:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    b124:	e1a03226 	lsr	r3, r6, #4
    b128:	e1833e07 	orr	r3, r3, r7, lsl #28
    b12c:	e1a00227 	lsr	r0, r7, #4
    b130:	e206100f 	and	r1, r6, #15
    b134:	e1a07000 	mov	r7, r0
    b138:	e1a06003 	mov	r6, r3
    b13c:	e7dc3001 	ldrb	r3, [ip, r1]
    b140:	e1961007 	orrs	r1, r6, r7
    b144:	e5623001 	strb	r3, [r2, #-1]!
    b148:	1afffff5 	bne	b124 <_vfiprintf_r+0x884>
    b14c:	e0483002 	sub	r3, r8, r2
    b150:	e58d2024 	str	r2, [sp, #36]	; 0x24
    b154:	e58d5004 	str	r5, [sp, #4]
    b158:	e58d3010 	str	r3, [sp, #16]
    b15c:	eafffed9 	b	acc8 <_vfiprintf_r+0x428>
    b160:	e3510000 	cmp	r1, #0
    b164:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b168:	e3150020 	tst	r5, #32
    b16c:	1a00023d 	bne	ba68 <_vfiprintf_r+0x11c8>
    b170:	e3150010 	tst	r5, #16
    b174:	1a000053 	bne	b2c8 <_vfiprintf_r+0xa28>
    b178:	e3150040 	tst	r5, #64	; 0x40
    b17c:	0a000051 	beq	b2c8 <_vfiprintf_r+0xa28>
    b180:	e59d2018 	ldr	r2, [sp, #24]
    b184:	e5923000 	ldr	r3, [r2]
    b188:	e2822004 	add	r2, r2, #4
    b18c:	e58d2018 	str	r2, [sp, #24]
    b190:	e1dd20b8 	ldrh	r2, [sp, #8]
    b194:	e1c320b0 	strh	r2, [r3]
    b198:	eafffdee 	b	a958 <_vfiprintf_r+0xb8>
    b19c:	e3510000 	cmp	r1, #0
    b1a0:	e58d001c 	str	r0, [sp, #28]
    b1a4:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b1a8:	eaffffc2 	b	b0b8 <_vfiprintf_r+0x818>
    b1ac:	e59f29e8 	ldr	r2, [pc, #2536]	; bb9c <_vfiprintf_r+0x12fc>
    b1b0:	e3510000 	cmp	r1, #0
    b1b4:	e58d001c 	str	r0, [sp, #28]
    b1b8:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b1bc:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    b1c0:	e3150020 	tst	r5, #32
    b1c4:	e59d2018 	ldr	r2, [sp, #24]
    b1c8:	1a0001c5 	bne	b8e4 <_vfiprintf_r+0x1044>
    b1cc:	e3150010 	tst	r5, #16
    b1d0:	1a00021a 	bne	ba40 <_vfiprintf_r+0x11a0>
    b1d4:	e3150040 	tst	r5, #64	; 0x40
    b1d8:	13a07000 	movne	r7, #0
    b1dc:	03a07000 	moveq	r7, #0
    b1e0:	11d260b0 	ldrhne	r6, [r2]
    b1e4:	05926000 	ldreq	r6, [r2]
    b1e8:	12822004 	addne	r2, r2, #4
    b1ec:	02822004 	addeq	r2, r2, #4
    b1f0:	158d2018 	strne	r2, [sp, #24]
    b1f4:	058d2018 	streq	r2, [sp, #24]
    b1f8:	e3150001 	tst	r5, #1
    b1fc:	0a00016e 	beq	b7bc <_vfiprintf_r+0xf1c>
    b200:	e1962007 	orrs	r2, r6, r7
    b204:	0a00016c 	beq	b7bc <_vfiprintf_r+0xf1c>
    b208:	e3a02030 	mov	r2, #48	; 0x30
    b20c:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    b210:	e3855002 	orr	r5, r5, #2
    b214:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    b218:	e3a03002 	mov	r3, #2
    b21c:	eafffe95 	b	ac78 <_vfiprintf_r+0x3d8>
    b220:	e3a07001 	mov	r7, #1
    b224:	e3a01000 	mov	r1, #0
    b228:	e59d2018 	ldr	r2, [sp, #24]
    b22c:	e5923000 	ldr	r3, [r2]
    b230:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    b234:	e2823004 	add	r3, r2, #4
    b238:	e58d3018 	str	r3, [sp, #24]
    b23c:	e28d3048 	add	r3, sp, #72	; 0x48
    b240:	e58d001c 	str	r0, [sp, #28]
    b244:	e5cd1037 	strb	r1, [sp, #55]	; 0x37
    b248:	e58d7010 	str	r7, [sp, #16]
    b24c:	e58d3024 	str	r3, [sp, #36]	; 0x24
    b250:	e58d5004 	str	r5, [sp, #4]
    b254:	e3a0a000 	mov	sl, #0
    b258:	eafffea0 	b	ace0 <_vfiprintf_r+0x440>
    b25c:	e3855001 	orr	r5, r5, #1
    b260:	e5d93000 	ldrb	r3, [r9]
    b264:	eafffde4 	b	a9fc <_vfiprintf_r+0x15c>
    b268:	e59f2928 	ldr	r2, [pc, #2344]	; bb98 <_vfiprintf_r+0x12f8>
    b26c:	e3510000 	cmp	r1, #0
    b270:	e58d001c 	str	r0, [sp, #28]
    b274:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b278:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    b27c:	eaffffcf 	b	b1c0 <_vfiprintf_r+0x920>
    b280:	e35c0000 	cmp	ip, #0
    b284:	e5d93000 	ldrb	r3, [r9]
    b288:	01a0100e 	moveq	r1, lr
    b28c:	01a0c006 	moveq	ip, r6
    b290:	eafffdd9 	b	a9fc <_vfiprintf_r+0x15c>
    b294:	e3510000 	cmp	r1, #0
    b298:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    b29c:	e3530000 	cmp	r3, #0
    b2a0:	e58d001c 	str	r0, [sp, #28]
    b2a4:	0a0001f7 	beq	ba88 <_vfiprintf_r+0x11e8>
    b2a8:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    b2ac:	e3a03000 	mov	r3, #0
    b2b0:	e3a07001 	mov	r7, #1
    b2b4:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    b2b8:	e28d3048 	add	r3, sp, #72	; 0x48
    b2bc:	e58d7010 	str	r7, [sp, #16]
    b2c0:	e58d3024 	str	r3, [sp, #36]	; 0x24
    b2c4:	eaffffe1 	b	b250 <_vfiprintf_r+0x9b0>
    b2c8:	e59d2018 	ldr	r2, [sp, #24]
    b2cc:	e5923000 	ldr	r3, [r2]
    b2d0:	e2822004 	add	r2, r2, #4
    b2d4:	e58d2018 	str	r2, [sp, #24]
    b2d8:	e59d2008 	ldr	r2, [sp, #8]
    b2dc:	e5832000 	str	r2, [r3]
    b2e0:	eafffd9c 	b	a958 <_vfiprintf_r+0xb8>
    b2e4:	e28d203c 	add	r2, sp, #60	; 0x3c
    b2e8:	e59d100c 	ldr	r1, [sp, #12]
    b2ec:	e1a00007 	mov	r0, r7
    b2f0:	e58d3028 	str	r3, [sp, #40]	; 0x28
    b2f4:	ebfffd37 	bl	a7d8 <__sprint_r.part.0>
    b2f8:	e3500000 	cmp	r0, #0
    b2fc:	1a000114 	bne	b754 <_vfiprintf_r+0xeb4>
    b300:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    b304:	e1a0e008 	mov	lr, r8
    b308:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    b30c:	e28c1001 	add	r1, ip, #1
    b310:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    b314:	eafffe89 	b	ad40 <_vfiprintf_r+0x4a0>
    b318:	e28d203c 	add	r2, sp, #60	; 0x3c
    b31c:	e59d100c 	ldr	r1, [sp, #12]
    b320:	e59d0014 	ldr	r0, [sp, #20]
    b324:	ebfffd2b 	bl	a7d8 <__sprint_r.part.0>
    b328:	e3500000 	cmp	r0, #0
    b32c:	1a000108 	bne	b754 <_vfiprintf_r+0xeb4>
    b330:	e1a0b008 	mov	fp, r8
    b334:	e28d1040 	add	r1, sp, #64	; 0x40
    b338:	e8910006 	ldm	r1, {r1, r2}
    b33c:	e2810001 	add	r0, r1, #1
    b340:	e5ddc037 	ldrb	ip, [sp, #55]	; 0x37
    b344:	e35c0000 	cmp	ip, #0
    b348:	0afffea8 	beq	adf0 <_vfiprintf_r+0x550>
    b34c:	e3a01001 	mov	r1, #1
    b350:	e28dc037 	add	ip, sp, #55	; 0x37
    b354:	e0822001 	add	r2, r2, r1
    b358:	e3500007 	cmp	r0, #7
    b35c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b360:	e58d0040 	str	r0, [sp, #64]	; 0x40
    b364:	e58b1004 	str	r1, [fp, #4]
    b368:	e58bc000 	str	ip, [fp]
    b36c:	dafffe9c 	ble	ade4 <_vfiprintf_r+0x544>
    b370:	e3520000 	cmp	r2, #0
    b374:	1a000133 	bne	b848 <_vfiprintf_r+0xfa8>
    b378:	e59d3020 	ldr	r3, [sp, #32]
    b37c:	e3530000 	cmp	r3, #0
    b380:	0afffea8 	beq	ae28 <_vfiprintf_r+0x588>
    b384:	e3a02002 	mov	r2, #2
    b388:	e1a00001 	mov	r0, r1
    b38c:	e1a0b008 	mov	fp, r8
    b390:	e28d3038 	add	r3, sp, #56	; 0x38
    b394:	e58d2074 	str	r2, [sp, #116]	; 0x74
    b398:	e58d3070 	str	r3, [sp, #112]	; 0x70
    b39c:	e1a01000 	mov	r1, r0
    b3a0:	e28bb008 	add	fp, fp, #8
    b3a4:	e2800001 	add	r0, r0, #1
    b3a8:	e3560080 	cmp	r6, #128	; 0x80
    b3ac:	0afffea2 	beq	ae3c <_vfiprintf_r+0x59c>
    b3b0:	e59d3010 	ldr	r3, [sp, #16]
    b3b4:	e04aa003 	sub	sl, sl, r3
    b3b8:	e35a0000 	cmp	sl, #0
    b3bc:	da000057 	ble	b520 <_vfiprintf_r+0xc80>
    b3c0:	e35a0010 	cmp	sl, #16
    b3c4:	da000019 	ble	b430 <_vfiprintf_r+0xb90>
    b3c8:	e3a04010 	mov	r4, #16
    b3cc:	e59d5014 	ldr	r5, [sp, #20]
    b3d0:	e59d600c 	ldr	r6, [sp, #12]
    b3d4:	ea000005 	b	b3f0 <_vfiprintf_r+0xb50>
    b3d8:	e2810002 	add	r0, r1, #2
    b3dc:	e1a01003 	mov	r1, r3
    b3e0:	e28bb008 	add	fp, fp, #8
    b3e4:	e24aa010 	sub	sl, sl, #16
    b3e8:	e35a0010 	cmp	sl, #16
    b3ec:	da00000f 	ble	b430 <_vfiprintf_r+0xb90>
    b3f0:	e2813001 	add	r3, r1, #1
    b3f4:	e59f0798 	ldr	r0, [pc, #1944]	; bb94 <_vfiprintf_r+0x12f4>
    b3f8:	e2822010 	add	r2, r2, #16
    b3fc:	e3530007 	cmp	r3, #7
    b400:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b404:	e88b0011 	stm	fp, {r0, r4}
    b408:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b40c:	dafffff1 	ble	b3d8 <_vfiprintf_r+0xb38>
    b410:	e3520000 	cmp	r2, #0
    b414:	1a00002c 	bne	b4cc <_vfiprintf_r+0xc2c>
    b418:	e24aa010 	sub	sl, sl, #16
    b41c:	e35a0010 	cmp	sl, #16
    b420:	e3a00001 	mov	r0, #1
    b424:	e3a01000 	mov	r1, #0
    b428:	e1a0b008 	mov	fp, r8
    b42c:	caffffef 	bgt	b3f0 <_vfiprintf_r+0xb50>
    b430:	e59f375c 	ldr	r3, [pc, #1884]	; bb94 <_vfiprintf_r+0x12f4>
    b434:	e3500007 	cmp	r0, #7
    b438:	e082200a 	add	r2, r2, sl
    b43c:	e88b0408 	stm	fp, {r3, sl}
    b440:	e58d0040 	str	r0, [sp, #64]	; 0x40
    b444:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b448:	d28bb008 	addle	fp, fp, #8
    b44c:	d2800001 	addle	r0, r0, #1
    b450:	da000032 	ble	b520 <_vfiprintf_r+0xc80>
    b454:	e3520000 	cmp	r2, #0
    b458:	1a000026 	bne	b4f8 <_vfiprintf_r+0xc58>
    b45c:	e3a03001 	mov	r3, #1
    b460:	e1a0b008 	mov	fp, r8
    b464:	e59d2010 	ldr	r2, [sp, #16]
    b468:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    b46c:	e58d2074 	str	r2, [sp, #116]	; 0x74
    b470:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b474:	e58d1070 	str	r1, [sp, #112]	; 0x70
    b478:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b47c:	e28bb008 	add	fp, fp, #8
    b480:	e59d3004 	ldr	r3, [sp, #4]
    b484:	e3130004 	tst	r3, #4
    b488:	0a000003 	beq	b49c <_vfiprintf_r+0xbfc>
    b48c:	e59d301c 	ldr	r3, [sp, #28]
    b490:	e0434007 	sub	r4, r3, r7
    b494:	e3540000 	cmp	r4, #0
    b498:	ca000033 	bgt	b56c <_vfiprintf_r+0xccc>
    b49c:	e59d3008 	ldr	r3, [sp, #8]
    b4a0:	e59d101c 	ldr	r1, [sp, #28]
    b4a4:	e1510007 	cmp	r1, r7
    b4a8:	a0833001 	addge	r3, r3, r1
    b4ac:	b0833007 	addlt	r3, r3, r7
    b4b0:	e3520000 	cmp	r2, #0
    b4b4:	e58d3008 	str	r3, [sp, #8]
    b4b8:	1a00009f 	bne	b73c <_vfiprintf_r+0xe9c>
    b4bc:	e3a03000 	mov	r3, #0
    b4c0:	e1a0b008 	mov	fp, r8
    b4c4:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b4c8:	eafffd22 	b	a958 <_vfiprintf_r+0xb8>
    b4cc:	e28d203c 	add	r2, sp, #60	; 0x3c
    b4d0:	e1a01006 	mov	r1, r6
    b4d4:	e1a00005 	mov	r0, r5
    b4d8:	ebfffcbe 	bl	a7d8 <__sprint_r.part.0>
    b4dc:	e3500000 	cmp	r0, #0
    b4e0:	1a0000f4 	bne	b8b8 <_vfiprintf_r+0x1018>
    b4e4:	e28d1040 	add	r1, sp, #64	; 0x40
    b4e8:	e8910006 	ldm	r1, {r1, r2}
    b4ec:	e1a0b008 	mov	fp, r8
    b4f0:	e2810001 	add	r0, r1, #1
    b4f4:	eaffffba 	b	b3e4 <_vfiprintf_r+0xb44>
    b4f8:	e28d203c 	add	r2, sp, #60	; 0x3c
    b4fc:	e59d100c 	ldr	r1, [sp, #12]
    b500:	e59d0014 	ldr	r0, [sp, #20]
    b504:	ebfffcb3 	bl	a7d8 <__sprint_r.part.0>
    b508:	e3500000 	cmp	r0, #0
    b50c:	1a000090 	bne	b754 <_vfiprintf_r+0xeb4>
    b510:	e1a0b008 	mov	fp, r8
    b514:	e28d0040 	add	r0, sp, #64	; 0x40
    b518:	e8900005 	ldm	r0, {r0, r2}
    b51c:	e2800001 	add	r0, r0, #1
    b520:	e59d3010 	ldr	r3, [sp, #16]
    b524:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    b528:	e0832002 	add	r2, r3, r2
    b52c:	e3500007 	cmp	r0, #7
    b530:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b534:	e88b000a 	stm	fp, {r1, r3}
    b538:	e58d0040 	str	r0, [sp, #64]	; 0x40
    b53c:	daffffce 	ble	b47c <_vfiprintf_r+0xbdc>
    b540:	e3520000 	cmp	r2, #0
    b544:	1a00009e 	bne	b7c4 <_vfiprintf_r+0xf24>
    b548:	e59d3004 	ldr	r3, [sp, #4]
    b54c:	e3130004 	tst	r3, #4
    b550:	e58d2040 	str	r2, [sp, #64]	; 0x40
    b554:	0a000031 	beq	b620 <_vfiprintf_r+0xd80>
    b558:	e59d301c 	ldr	r3, [sp, #28]
    b55c:	e0434007 	sub	r4, r3, r7
    b560:	e3540000 	cmp	r4, #0
    b564:	c1a0b008 	movgt	fp, r8
    b568:	da00002c 	ble	b620 <_vfiprintf_r+0xd80>
    b56c:	e3540010 	cmp	r4, #16
    b570:	d59d0040 	ldrle	r0, [sp, #64]	; 0x40
    b574:	d2800001 	addle	r0, r0, #1
    b578:	da00001f 	ble	b5fc <_vfiprintf_r+0xd5c>
    b57c:	e1a0c00b 	mov	ip, fp
    b580:	e3a05010 	mov	r5, #16
    b584:	e1a0b004 	mov	fp, r4
    b588:	e3a06001 	mov	r6, #1
    b58c:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    b590:	e59da014 	ldr	sl, [sp, #20]
    b594:	e59d400c 	ldr	r4, [sp, #12]
    b598:	ea000005 	b	b5b4 <_vfiprintf_r+0xd14>
    b59c:	e2810002 	add	r0, r1, #2
    b5a0:	e1a01003 	mov	r1, r3
    b5a4:	e28cc008 	add	ip, ip, #8
    b5a8:	e24bb010 	sub	fp, fp, #16
    b5ac:	e35b0010 	cmp	fp, #16
    b5b0:	da00000f 	ble	b5f4 <_vfiprintf_r+0xd54>
    b5b4:	e2813001 	add	r3, r1, #1
    b5b8:	e59f05d0 	ldr	r0, [pc, #1488]	; bb90 <_vfiprintf_r+0x12f0>
    b5bc:	e2822010 	add	r2, r2, #16
    b5c0:	e3530007 	cmp	r3, #7
    b5c4:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b5c8:	e88c0021 	stm	ip, {r0, r5}
    b5cc:	e58d3040 	str	r3, [sp, #64]	; 0x40
    b5d0:	dafffff1 	ble	b59c <_vfiprintf_r+0xcfc>
    b5d4:	e3520000 	cmp	r2, #0
    b5d8:	1a000017 	bne	b63c <_vfiprintf_r+0xd9c>
    b5dc:	e24bb010 	sub	fp, fp, #16
    b5e0:	e35b0010 	cmp	fp, #16
    b5e4:	e1a00006 	mov	r0, r6
    b5e8:	e3a01000 	mov	r1, #0
    b5ec:	e1a0c008 	mov	ip, r8
    b5f0:	caffffef 	bgt	b5b4 <_vfiprintf_r+0xd14>
    b5f4:	e1a0400b 	mov	r4, fp
    b5f8:	e1a0b00c 	mov	fp, ip
    b5fc:	e59f358c 	ldr	r3, [pc, #1420]	; bb90 <_vfiprintf_r+0x12f0>
    b600:	e0822004 	add	r2, r2, r4
    b604:	e3500007 	cmp	r0, #7
    b608:	e58d2044 	str	r2, [sp, #68]	; 0x44
    b60c:	e88b0018 	stm	fp, {r3, r4}
    b610:	e58d0040 	str	r0, [sp, #64]	; 0x40
    b614:	daffffa0 	ble	b49c <_vfiprintf_r+0xbfc>
    b618:	e3520000 	cmp	r2, #0
    b61c:	1a0000f5 	bne	b9f8 <_vfiprintf_r+0x1158>
    b620:	e59d3008 	ldr	r3, [sp, #8]
    b624:	e59d201c 	ldr	r2, [sp, #28]
    b628:	e1520007 	cmp	r2, r7
    b62c:	a0833002 	addge	r3, r3, r2
    b630:	b0833007 	addlt	r3, r3, r7
    b634:	e58d3008 	str	r3, [sp, #8]
    b638:	eaffff9f 	b	b4bc <_vfiprintf_r+0xc1c>
    b63c:	e28d203c 	add	r2, sp, #60	; 0x3c
    b640:	e1a01004 	mov	r1, r4
    b644:	e1a0000a 	mov	r0, sl
    b648:	ebfffc62 	bl	a7d8 <__sprint_r.part.0>
    b64c:	e3500000 	cmp	r0, #0
    b650:	1a000113 	bne	baa4 <_vfiprintf_r+0x1204>
    b654:	e28d1040 	add	r1, sp, #64	; 0x40
    b658:	e8910006 	ldm	r1, {r1, r2}
    b65c:	e1a0c008 	mov	ip, r8
    b660:	e2810001 	add	r0, r1, #1
    b664:	eaffffcf 	b	b5a8 <_vfiprintf_r+0xd08>
    b668:	e1a01002 	mov	r1, r2
    b66c:	e1a021a6 	lsr	r2, r6, #3
    b670:	e1822e87 	orr	r2, r2, r7, lsl #29
    b674:	e1a001a7 	lsr	r0, r7, #3
    b678:	e2063007 	and	r3, r6, #7
    b67c:	e1a07000 	mov	r7, r0
    b680:	e1a06002 	mov	r6, r2
    b684:	e2833030 	add	r3, r3, #48	; 0x30
    b688:	e1962007 	orrs	r2, r6, r7
    b68c:	e5413001 	strb	r3, [r1, #-1]
    b690:	e2412001 	sub	r2, r1, #1
    b694:	1afffff3 	bne	b668 <_vfiprintf_r+0xdc8>
    b698:	e3530030 	cmp	r3, #48	; 0x30
    b69c:	03a03000 	moveq	r3, #0
    b6a0:	12053001 	andne	r3, r5, #1
    b6a4:	e3530000 	cmp	r3, #0
    b6a8:	0a0000e9 	beq	ba54 <_vfiprintf_r+0x11b4>
    b6ac:	e3a03030 	mov	r3, #48	; 0x30
    b6b0:	e2411002 	sub	r1, r1, #2
    b6b4:	e58d1024 	str	r1, [sp, #36]	; 0x24
    b6b8:	e0481001 	sub	r1, r8, r1
    b6bc:	e58d5004 	str	r5, [sp, #4]
    b6c0:	e58d1010 	str	r1, [sp, #16]
    b6c4:	e5423001 	strb	r3, [r2, #-1]
    b6c8:	eafffd7e 	b	acc8 <_vfiprintf_r+0x428>
    b6cc:	e28d203c 	add	r2, sp, #60	; 0x3c
    b6d0:	e59d100c 	ldr	r1, [sp, #12]
    b6d4:	e1a00004 	mov	r0, r4
    b6d8:	ebfffc3e 	bl	a7d8 <__sprint_r.part.0>
    b6dc:	e3500000 	cmp	r0, #0
    b6e0:	1a00001b 	bne	b754 <_vfiprintf_r+0xeb4>
    b6e4:	e28d1040 	add	r1, sp, #64	; 0x40
    b6e8:	e8910006 	ldm	r1, {r1, r2}
    b6ec:	e1a0e008 	mov	lr, r8
    b6f0:	e281c001 	add	ip, r1, #1
    b6f4:	eafffde0 	b	ae7c <_vfiprintf_r+0x5dc>
    b6f8:	e3a03000 	mov	r3, #0
    b6fc:	e58d8024 	str	r8, [sp, #36]	; 0x24
    b700:	e58d3010 	str	r3, [sp, #16]
    b704:	eafffd6f 	b	acc8 <_vfiprintf_r+0x428>
    b708:	e3530001 	cmp	r3, #1
    b70c:	e1a05002 	mov	r5, r2
    b710:	1afffe7e 	bne	b110 <_vfiprintf_r+0x870>
    b714:	e3570000 	cmp	r7, #0
    b718:	03560009 	cmpeq	r6, #9
    b71c:	8a000086 	bhi	b93c <_vfiprintf_r+0x109c>
    b720:	e28d20b0 	add	r2, sp, #176	; 0xb0
    b724:	e2866030 	add	r6, r6, #48	; 0x30
    b728:	e5626041 	strb	r6, [r2, #-65]!	; 0xffffffbf
    b72c:	e58d5004 	str	r5, [sp, #4]
    b730:	e58d3010 	str	r3, [sp, #16]
    b734:	e58d2024 	str	r2, [sp, #36]	; 0x24
    b738:	eafffd62 	b	acc8 <_vfiprintf_r+0x428>
    b73c:	e28d203c 	add	r2, sp, #60	; 0x3c
    b740:	e59d100c 	ldr	r1, [sp, #12]
    b744:	e59d0014 	ldr	r0, [sp, #20]
    b748:	ebfffc22 	bl	a7d8 <__sprint_r.part.0>
    b74c:	e3500000 	cmp	r0, #0
    b750:	0affff59 	beq	b4bc <_vfiprintf_r+0xc1c>
    b754:	e59da00c 	ldr	sl, [sp, #12]
    b758:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    b75c:	e3130001 	tst	r3, #1
    b760:	e1da30bc 	ldrh	r3, [sl, #12]
    b764:	1a000001 	bne	b770 <_vfiprintf_r+0xed0>
    b768:	e3130c02 	tst	r3, #512	; 0x200
    b76c:	0a000031 	beq	b838 <_vfiprintf_r+0xf98>
    b770:	e3130040 	tst	r3, #64	; 0x40
    b774:	0afffd21 	beq	ac00 <_vfiprintf_r+0x360>
    b778:	e3e03000 	mvn	r3, #0
    b77c:	e58d3008 	str	r3, [sp, #8]
    b780:	e59d0008 	ldr	r0, [sp, #8]
    b784:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    b788:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    b78c:	e12fff1e 	bx	lr
    b790:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    b794:	e3130001 	tst	r3, #1
    b798:	1afffff6 	bne	b778 <_vfiprintf_r+0xed8>
    b79c:	e1da30bc 	ldrh	r3, [sl, #12]
    b7a0:	e3130c02 	tst	r3, #512	; 0x200
    b7a4:	1afffff3 	bne	b778 <_vfiprintf_r+0xed8>
    b7a8:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    b7ac:	eb00068e 	bl	d1ec <__retarget_lock_release_recursive>
    b7b0:	e3e03000 	mvn	r3, #0
    b7b4:	e58d3008 	str	r3, [sp, #8]
    b7b8:	eafffd10 	b	ac00 <_vfiprintf_r+0x360>
    b7bc:	e3a03002 	mov	r3, #2
    b7c0:	eafffd2c 	b	ac78 <_vfiprintf_r+0x3d8>
    b7c4:	e28d203c 	add	r2, sp, #60	; 0x3c
    b7c8:	e59d100c 	ldr	r1, [sp, #12]
    b7cc:	e59d0014 	ldr	r0, [sp, #20]
    b7d0:	ebfffc00 	bl	a7d8 <__sprint_r.part.0>
    b7d4:	e3500000 	cmp	r0, #0
    b7d8:	1affffdd 	bne	b754 <_vfiprintf_r+0xeb4>
    b7dc:	e1a0b008 	mov	fp, r8
    b7e0:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    b7e4:	eaffff25 	b	b480 <_vfiprintf_r+0xbe0>
    b7e8:	e28d203c 	add	r2, sp, #60	; 0x3c
    b7ec:	e59d100c 	ldr	r1, [sp, #12]
    b7f0:	e59d0014 	ldr	r0, [sp, #20]
    b7f4:	ebfffbf7 	bl	a7d8 <__sprint_r.part.0>
    b7f8:	e3500000 	cmp	r0, #0
    b7fc:	1affffd4 	bne	b754 <_vfiprintf_r+0xeb4>
    b800:	e1a0b008 	mov	fp, r8
    b804:	eafffc69 	b	a9b0 <_vfiprintf_r+0x110>
    b808:	e2822004 	add	r2, r2, #4
    b80c:	e5936000 	ldr	r6, [r3]
    b810:	e3a07000 	mov	r7, #0
    b814:	e3a03000 	mov	r3, #0
    b818:	e58d2018 	str	r2, [sp, #24]
    b81c:	eafffd15 	b	ac78 <_vfiprintf_r+0x3d8>
    b820:	e2822004 	add	r2, r2, #4
    b824:	e5936000 	ldr	r6, [r3]
    b828:	e3a07000 	mov	r7, #0
    b82c:	e3a03001 	mov	r3, #1
    b830:	e58d2018 	str	r2, [sp, #24]
    b834:	eafffd0f 	b	ac78 <_vfiprintf_r+0x3d8>
    b838:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    b83c:	eb00066a 	bl	d1ec <__retarget_lock_release_recursive>
    b840:	e1da30bc 	ldrh	r3, [sl, #12]
    b844:	eaffffc9 	b	b770 <_vfiprintf_r+0xed0>
    b848:	e28d203c 	add	r2, sp, #60	; 0x3c
    b84c:	e59d100c 	ldr	r1, [sp, #12]
    b850:	e59d0014 	ldr	r0, [sp, #20]
    b854:	ebfffbdf 	bl	a7d8 <__sprint_r.part.0>
    b858:	e3500000 	cmp	r0, #0
    b85c:	1affffbc 	bne	b754 <_vfiprintf_r+0xeb4>
    b860:	e28d1040 	add	r1, sp, #64	; 0x40
    b864:	e8910006 	ldm	r1, {r1, r2}
    b868:	e1a0b008 	mov	fp, r8
    b86c:	e2810001 	add	r0, r1, #1
    b870:	eafffd5e 	b	adf0 <_vfiprintf_r+0x550>
    b874:	e28d203c 	add	r2, sp, #60	; 0x3c
    b878:	e59d100c 	ldr	r1, [sp, #12]
    b87c:	e59d0014 	ldr	r0, [sp, #20]
    b880:	ebfffbd4 	bl	a7d8 <__sprint_r.part.0>
    b884:	e3500000 	cmp	r0, #0
    b888:	1affffb1 	bne	b754 <_vfiprintf_r+0xeb4>
    b88c:	e28d1040 	add	r1, sp, #64	; 0x40
    b890:	e8910006 	ldm	r1, {r1, r2}
    b894:	e1a0b008 	mov	fp, r8
    b898:	e2810001 	add	r0, r1, #1
    b89c:	eafffec1 	b	b3a8 <_vfiprintf_r+0xb08>
    b8a0:	e3520000 	cmp	r2, #0
    b8a4:	1a000088 	bne	bacc <_vfiprintf_r+0x122c>
    b8a8:	e3a00001 	mov	r0, #1
    b8ac:	e3a01000 	mov	r1, #0
    b8b0:	e1a0b008 	mov	fp, r8
    b8b4:	eafffebd 	b	b3b0 <_vfiprintf_r+0xb10>
    b8b8:	e1a0a006 	mov	sl, r6
    b8bc:	eaffffa5 	b	b758 <_vfiprintf_r+0xeb8>
    b8c0:	e59d3018 	ldr	r3, [sp, #24]
    b8c4:	e2833007 	add	r3, r3, #7
    b8c8:	e3c31007 	bic	r1, r3, #7
    b8cc:	e891000c 	ldm	r1, {r2, r3}
    b8d0:	e2811008 	add	r1, r1, #8
    b8d4:	e58d1018 	str	r1, [sp, #24]
    b8d8:	e1a06002 	mov	r6, r2
    b8dc:	e1a07003 	mov	r7, r3
    b8e0:	eafffe01 	b	b0ec <_vfiprintf_r+0x84c>
    b8e4:	e2822007 	add	r2, r2, #7
    b8e8:	e3c22007 	bic	r2, r2, #7
    b8ec:	e2821008 	add	r1, r2, #8
    b8f0:	e58d1018 	str	r1, [sp, #24]
    b8f4:	e89200c0 	ldm	r2, {r6, r7}
    b8f8:	eafffe3e 	b	b1f8 <_vfiprintf_r+0x958>
    b8fc:	e59d3018 	ldr	r3, [sp, #24]
    b900:	e2833007 	add	r3, r3, #7
    b904:	e3c33007 	bic	r3, r3, #7
    b908:	e2832008 	add	r2, r3, #8
    b90c:	e89300c0 	ldm	r3, {r6, r7}
    b910:	e58d2018 	str	r2, [sp, #24]
    b914:	e3a03001 	mov	r3, #1
    b918:	eafffcd6 	b	ac78 <_vfiprintf_r+0x3d8>
    b91c:	e59d3018 	ldr	r3, [sp, #24]
    b920:	e2833007 	add	r3, r3, #7
    b924:	e3c33007 	bic	r3, r3, #7
    b928:	e2832008 	add	r2, r3, #8
    b92c:	e89300c0 	ldm	r3, {r6, r7}
    b930:	e58d2018 	str	r2, [sp, #24]
    b934:	e3a03000 	mov	r3, #0
    b938:	eafffcce 	b	ac78 <_vfiprintf_r+0x3d8>
    b93c:	e58d4004 	str	r4, [sp, #4]
    b940:	e1a04008 	mov	r4, r8
    b944:	e1a00006 	mov	r0, r6
    b948:	e1a01007 	mov	r1, r7
    b94c:	e3a0200a 	mov	r2, #10
    b950:	e3a03000 	mov	r3, #0
    b954:	eb000d6d 	bl	ef10 <__aeabi_uldivmod>
    b958:	e2822030 	add	r2, r2, #48	; 0x30
    b95c:	e5642001 	strb	r2, [r4, #-1]!
    b960:	e1a00006 	mov	r0, r6
    b964:	e1a01007 	mov	r1, r7
    b968:	e3a03000 	mov	r3, #0
    b96c:	e3a0200a 	mov	r2, #10
    b970:	eb000d66 	bl	ef10 <__aeabi_uldivmod>
    b974:	e1a06000 	mov	r6, r0
    b978:	e1a07001 	mov	r7, r1
    b97c:	e1963007 	orrs	r3, r6, r7
    b980:	1affffef 	bne	b944 <_vfiprintf_r+0x10a4>
    b984:	e1a03004 	mov	r3, r4
    b988:	e0483003 	sub	r3, r8, r3
    b98c:	e58d4024 	str	r4, [sp, #36]	; 0x24
    b990:	e58d3010 	str	r3, [sp, #16]
    b994:	e59d4004 	ldr	r4, [sp, #4]
    b998:	e58d5004 	str	r5, [sp, #4]
    b99c:	eafffcc9 	b	acc8 <_vfiprintf_r+0x428>
    b9a0:	e3a0302d 	mov	r3, #45	; 0x2d
    b9a4:	e2766000 	rsbs	r6, r6, #0
    b9a8:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    b9ac:	e1a04003 	mov	r4, r3
    b9b0:	e2e77000 	rsc	r7, r7, #0
    b9b4:	e3a03001 	mov	r3, #1
    b9b8:	eafffcb1 	b	ac84 <_vfiprintf_r+0x3e4>
    b9bc:	e59d3020 	ldr	r3, [sp, #32]
    b9c0:	e3530000 	cmp	r3, #0
    b9c4:	1a000013 	bne	ba18 <_vfiprintf_r+0x1178>
    b9c8:	e3a01000 	mov	r1, #0
    b9cc:	e3a00001 	mov	r0, #1
    b9d0:	e1a0b008 	mov	fp, r8
    b9d4:	eafffe75 	b	b3b0 <_vfiprintf_r+0xb10>
    b9d8:	e59d1018 	ldr	r1, [sp, #24]
    b9dc:	e5916000 	ldr	r6, [r1]
    b9e0:	e2811004 	add	r1, r1, #4
    b9e4:	e1a07fc6 	asr	r7, r6, #31
    b9e8:	e1a02006 	mov	r2, r6
    b9ec:	e1a03007 	mov	r3, r7
    b9f0:	e58d1018 	str	r1, [sp, #24]
    b9f4:	eafffdbc 	b	b0ec <_vfiprintf_r+0x84c>
    b9f8:	e28d203c 	add	r2, sp, #60	; 0x3c
    b9fc:	e59d100c 	ldr	r1, [sp, #12]
    ba00:	e59d0014 	ldr	r0, [sp, #20]
    ba04:	ebfffb73 	bl	a7d8 <__sprint_r.part.0>
    ba08:	e3500000 	cmp	r0, #0
    ba0c:	1affff50 	bne	b754 <_vfiprintf_r+0xeb4>
    ba10:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    ba14:	eafffea0 	b	b49c <_vfiprintf_r+0xbfc>
    ba18:	e3a02002 	mov	r2, #2
    ba1c:	e28d3038 	add	r3, sp, #56	; 0x38
    ba20:	e58d2074 	str	r2, [sp, #116]	; 0x74
    ba24:	e58d3070 	str	r3, [sp, #112]	; 0x70
    ba28:	e3a00001 	mov	r0, #1
    ba2c:	e1a0b008 	mov	fp, r8
    ba30:	eafffe59 	b	b39c <_vfiprintf_r+0xafc>
    ba34:	e59d3018 	ldr	r3, [sp, #24]
    ba38:	e5936000 	ldr	r6, [r3]
    ba3c:	eafffda5 	b	b0d8 <_vfiprintf_r+0x838>
    ba40:	e5926000 	ldr	r6, [r2]
    ba44:	e2822004 	add	r2, r2, #4
    ba48:	e58d2018 	str	r2, [sp, #24]
    ba4c:	e3a07000 	mov	r7, #0
    ba50:	eafffde8 	b	b1f8 <_vfiprintf_r+0x958>
    ba54:	e0483002 	sub	r3, r8, r2
    ba58:	e58d5004 	str	r5, [sp, #4]
    ba5c:	e58d3010 	str	r3, [sp, #16]
    ba60:	e58d2024 	str	r2, [sp, #36]	; 0x24
    ba64:	eafffc97 	b	acc8 <_vfiprintf_r+0x428>
    ba68:	e59d3018 	ldr	r3, [sp, #24]
    ba6c:	e59d2008 	ldr	r2, [sp, #8]
    ba70:	e5931000 	ldr	r1, [r3]
    ba74:	e2833004 	add	r3, r3, #4
    ba78:	e58d3018 	str	r3, [sp, #24]
    ba7c:	e1a03fc2 	asr	r3, r2, #31
    ba80:	e881000c 	stm	r1, {r2, r3}
    ba84:	eafffbb3 	b	a958 <_vfiprintf_r+0xb8>
    ba88:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    ba8c:	e3530000 	cmp	r3, #0
    ba90:	e59da00c 	ldr	sl, [sp, #12]
    ba94:	1a00002c 	bne	bb4c <_vfiprintf_r+0x12ac>
    ba98:	e3a03000 	mov	r3, #0
    ba9c:	e58d3040 	str	r3, [sp, #64]	; 0x40
    baa0:	eaffff2c 	b	b758 <_vfiprintf_r+0xeb8>
    baa4:	e1a0a004 	mov	sl, r4
    baa8:	eaffff2a 	b	b758 <_vfiprintf_r+0xeb8>
    baac:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    bab0:	e58d4018 	str	r4, [sp, #24]
    bab4:	e58d5004 	str	r5, [sp, #4]
    bab8:	eb000b3d 	bl	e7b4 <strlen>
    babc:	e3a0a000 	mov	sl, #0
    bac0:	e58d0010 	str	r0, [sp, #16]
    bac4:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    bac8:	eafffc7e 	b	acc8 <_vfiprintf_r+0x428>
    bacc:	e28d203c 	add	r2, sp, #60	; 0x3c
    bad0:	e59d100c 	ldr	r1, [sp, #12]
    bad4:	e59d0014 	ldr	r0, [sp, #20]
    bad8:	ebfffb3e 	bl	a7d8 <__sprint_r.part.0>
    badc:	e3500000 	cmp	r0, #0
    bae0:	1affff1b 	bne	b754 <_vfiprintf_r+0xeb4>
    bae4:	e28d1040 	add	r1, sp, #64	; 0x40
    bae8:	e8910006 	ldm	r1, {r1, r2}
    baec:	e1a0b008 	mov	fp, r8
    baf0:	e2810001 	add	r0, r1, #1
    baf4:	eafffe2d 	b	b3b0 <_vfiprintf_r+0xb10>
    baf8:	e28d1040 	add	r1, sp, #64	; 0x40
    bafc:	e8910006 	ldm	r1, {r1, r2}
    bb00:	e2811001 	add	r1, r1, #1
    bb04:	eafffca2 	b	ad94 <_vfiprintf_r+0x4f4>
    bb08:	e35a0006 	cmp	sl, #6
    bb0c:	31a0300a 	movcc	r3, sl
    bb10:	23a03006 	movcs	r3, #6
    bb14:	e58d3010 	str	r3, [sp, #16]
    bb18:	e1a07003 	mov	r7, r3
    bb1c:	e59f307c 	ldr	r3, [pc, #124]	; bba0 <_vfiprintf_r+0x1300>
    bb20:	e58d4018 	str	r4, [sp, #24]
    bb24:	e58d3024 	str	r3, [sp, #36]	; 0x24
    bb28:	eafffdc8 	b	b250 <_vfiprintf_r+0x9b0>
    bb2c:	e58da010 	str	sl, [sp, #16]
    bb30:	e58d4018 	str	r4, [sp, #24]
    bb34:	e58d5004 	str	r5, [sp, #4]
    bb38:	e3a0a000 	mov	sl, #0
    bb3c:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    bb40:	eafffc60 	b	acc8 <_vfiprintf_r+0x428>
    bb44:	e1a0c000 	mov	ip, r0
    bb48:	eafffce1 	b	aed4 <_vfiprintf_r+0x634>
    bb4c:	e59d0014 	ldr	r0, [sp, #20]
    bb50:	e28d203c 	add	r2, sp, #60	; 0x3c
    bb54:	e1a0100a 	mov	r1, sl
    bb58:	ebfffb1e 	bl	a7d8 <__sprint_r.part.0>
    bb5c:	e3500000 	cmp	r0, #0
    bb60:	0affffcc 	beq	ba98 <_vfiprintf_r+0x11f8>
    bb64:	eafffefb 	b	b758 <_vfiprintf_r+0xeb8>
    bb68:	e59d2018 	ldr	r2, [sp, #24]
    bb6c:	e58da004 	str	sl, [sp, #4]
    bb70:	e592a000 	ldr	sl, [r2]
    bb74:	e2822004 	add	r2, r2, #4
    bb78:	e15a0007 	cmp	sl, r7
    bb7c:	e5d93001 	ldrb	r3, [r9, #1]
    bb80:	b1a0a007 	movlt	sl, r7
    bb84:	e59d9004 	ldr	r9, [sp, #4]
    bb88:	e58d2018 	str	r2, [sp, #24]
    bb8c:	eafffb9a 	b	a9fc <_vfiprintf_r+0x15c>
    bb90:	0000f5e8 	.word	0x0000f5e8
    bb94:	0000f5f8 	.word	0x0000f5f8
    bb98:	0000f5cc 	.word	0x0000f5cc
    bb9c:	0000f5b8 	.word	0x0000f5b8
    bba0:	0000f5e0 	.word	0x0000f5e0

0000bba4 <vfiprintf>:
    bba4:	e59fc010 	ldr	ip, [pc, #16]	; bbbc <vfiprintf+0x18>
    bba8:	e1a03002 	mov	r3, r2
    bbac:	e1a02001 	mov	r2, r1
    bbb0:	e1a01000 	mov	r1, r0
    bbb4:	e59c0000 	ldr	r0, [ip]
    bbb8:	eafffb38 	b	a8a0 <_vfiprintf_r>
    bbbc:	0000fb6c 	.word	0x0000fb6c

0000bbc0 <__sbprintf>:
    bbc0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    bbc4:	e1a04001 	mov	r4, r1
    bbc8:	e3a0cb01 	mov	ip, #1024	; 0x400
    bbcc:	e3a0e000 	mov	lr, #0
    bbd0:	e1a06002 	mov	r6, r2
    bbd4:	e1a07000 	mov	r7, r0
    bbd8:	e1a08003 	mov	r8, r3
    bbdc:	e24dde46 	sub	sp, sp, #1120	; 0x460
    bbe0:	e1d430be 	ldrh	r3, [r4, #14]
    bbe4:	e24dd008 	sub	sp, sp, #8
    bbe8:	e1d110bc 	ldrh	r1, [r1, #12]
    bbec:	e1cd30be 	strh	r3, [sp, #14]
    bbf0:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    bbf4:	e594201c 	ldr	r2, [r4, #28]
    bbf8:	e3c11002 	bic	r1, r1, #2
    bbfc:	e58d3064 	str	r3, [sp, #100]	; 0x64
    bc00:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    bc04:	e1cd10bc 	strh	r1, [sp, #12]
    bc08:	e28d0058 	add	r0, sp, #88	; 0x58
    bc0c:	e28d1068 	add	r1, sp, #104	; 0x68
    bc10:	e58dc008 	str	ip, [sp, #8]
    bc14:	e58dc014 	str	ip, [sp, #20]
    bc18:	e58d201c 	str	r2, [sp, #28]
    bc1c:	e58d3024 	str	r3, [sp, #36]	; 0x24
    bc20:	e58de018 	str	lr, [sp, #24]
    bc24:	e58d1000 	str	r1, [sp]
    bc28:	e58d1010 	str	r1, [sp, #16]
    bc2c:	eb000564 	bl	d1c4 <__retarget_lock_init_recursive>
    bc30:	e1a02006 	mov	r2, r6
    bc34:	e1a03008 	mov	r3, r8
    bc38:	e1a0100d 	mov	r1, sp
    bc3c:	e1a00007 	mov	r0, r7
    bc40:	ebfffb16 	bl	a8a0 <_vfiprintf_r>
    bc44:	e2506000 	subs	r6, r0, #0
    bc48:	ba000004 	blt	bc60 <__sbprintf+0xa0>
    bc4c:	e1a0100d 	mov	r1, sp
    bc50:	e1a00007 	mov	r0, r7
    bc54:	eb0000fa 	bl	c044 <_fflush_r>
    bc58:	e3500000 	cmp	r0, #0
    bc5c:	13e06000 	mvnne	r6, #0
    bc60:	e1dd30bc 	ldrh	r3, [sp, #12]
    bc64:	e3130040 	tst	r3, #64	; 0x40
    bc68:	11d430bc 	ldrhne	r3, [r4, #12]
    bc6c:	13833040 	orrne	r3, r3, #64	; 0x40
    bc70:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    bc74:	11c430bc 	strhne	r3, [r4, #12]
    bc78:	eb000553 	bl	d1cc <__retarget_lock_close_recursive>
    bc7c:	e1a00006 	mov	r0, r6
    bc80:	e28dde46 	add	sp, sp, #1120	; 0x460
    bc84:	e28dd008 	add	sp, sp, #8
    bc88:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    bc8c:	e12fff1e 	bx	lr

0000bc90 <__swsetup_r>:
    bc90:	e59f3158 	ldr	r3, [pc, #344]	; bdf0 <__swsetup_r+0x160>
    bc94:	e5933000 	ldr	r3, [r3]
    bc98:	e3530000 	cmp	r3, #0
    bc9c:	e92d4070 	push	{r4, r5, r6, lr}
    bca0:	e1a05000 	mov	r5, r0
    bca4:	e1a04001 	mov	r4, r1
    bca8:	0a000002 	beq	bcb8 <__swsetup_r+0x28>
    bcac:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    bcb0:	e3520000 	cmp	r2, #0
    bcb4:	0a000034 	beq	bd8c <__swsetup_r+0xfc>
    bcb8:	e1d420fc 	ldrsh	r2, [r4, #12]
    bcbc:	e1a03802 	lsl	r3, r2, #16
    bcc0:	e3130702 	tst	r3, #524288	; 0x80000
    bcc4:	e1a03823 	lsr	r3, r3, #16
    bcc8:	0a00000c 	beq	bd00 <__swsetup_r+0x70>
    bccc:	e5940010 	ldr	r0, [r4, #16]
    bcd0:	e3500000 	cmp	r0, #0
    bcd4:	0a000014 	beq	bd2c <__swsetup_r+0x9c>
    bcd8:	e2132001 	ands	r2, r3, #1
    bcdc:	1a00001b 	bne	bd50 <__swsetup_r+0xc0>
    bce0:	e3130002 	tst	r3, #2
    bce4:	05942014 	ldreq	r2, [r4, #20]
    bce8:	e3500000 	cmp	r0, #0
    bcec:	e5842008 	str	r2, [r4, #8]
    bcf0:	13a00000 	movne	r0, #0
    bcf4:	0a00001d 	beq	bd70 <__swsetup_r+0xe0>
    bcf8:	e8bd4070 	pop	{r4, r5, r6, lr}
    bcfc:	e12fff1e 	bx	lr
    bd00:	e3130010 	tst	r3, #16
    bd04:	0a000033 	beq	bdd8 <__swsetup_r+0x148>
    bd08:	e3130004 	tst	r3, #4
    bd0c:	1a000021 	bne	bd98 <__swsetup_r+0x108>
    bd10:	e5940010 	ldr	r0, [r4, #16]
    bd14:	e3822008 	orr	r2, r2, #8
    bd18:	e1c420bc 	strh	r2, [r4, #12]
    bd1c:	e3500000 	cmp	r0, #0
    bd20:	e1a02802 	lsl	r2, r2, #16
    bd24:	e1a03822 	lsr	r3, r2, #16
    bd28:	1affffea 	bne	bcd8 <__swsetup_r+0x48>
    bd2c:	e2032d0a 	and	r2, r3, #640	; 0x280
    bd30:	e3520c02 	cmp	r2, #512	; 0x200
    bd34:	0affffe7 	beq	bcd8 <__swsetup_r+0x48>
    bd38:	e1a00005 	mov	r0, r5
    bd3c:	e1a01004 	mov	r1, r4
    bd40:	eb000552 	bl	d290 <__smakebuf_r>
    bd44:	e1d430bc 	ldrh	r3, [r4, #12]
    bd48:	e5940010 	ldr	r0, [r4, #16]
    bd4c:	eaffffe1 	b	bcd8 <__swsetup_r+0x48>
    bd50:	e3a02000 	mov	r2, #0
    bd54:	e5943014 	ldr	r3, [r4, #20]
    bd58:	e3500000 	cmp	r0, #0
    bd5c:	e2633000 	rsb	r3, r3, #0
    bd60:	e5843018 	str	r3, [r4, #24]
    bd64:	e5842008 	str	r2, [r4, #8]
    bd68:	13a00000 	movne	r0, #0
    bd6c:	1affffe1 	bne	bcf8 <__swsetup_r+0x68>
    bd70:	e1d430fc 	ldrsh	r3, [r4, #12]
    bd74:	e3130080 	tst	r3, #128	; 0x80
    bd78:	13833040 	orrne	r3, r3, #64	; 0x40
    bd7c:	11c430bc 	strhne	r3, [r4, #12]
    bd80:	13e00000 	mvnne	r0, #0
    bd84:	e8bd4070 	pop	{r4, r5, r6, lr}
    bd88:	e12fff1e 	bx	lr
    bd8c:	e1a00003 	mov	r0, r3
    bd90:	eb000140 	bl	c298 <__sinit>
    bd94:	eaffffc7 	b	bcb8 <__swsetup_r+0x28>
    bd98:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    bd9c:	e3510000 	cmp	r1, #0
    bda0:	0a000007 	beq	bdc4 <__swsetup_r+0x134>
    bda4:	e2843040 	add	r3, r4, #64	; 0x40
    bda8:	e1510003 	cmp	r1, r3
    bdac:	0a000002 	beq	bdbc <__swsetup_r+0x12c>
    bdb0:	e1a00005 	mov	r0, r5
    bdb4:	eb000298 	bl	c81c <_free_r>
    bdb8:	e1d420fc 	ldrsh	r2, [r4, #12]
    bdbc:	e3a03000 	mov	r3, #0
    bdc0:	e5843030 	str	r3, [r4, #48]	; 0x30
    bdc4:	e3a03000 	mov	r3, #0
    bdc8:	e5940010 	ldr	r0, [r4, #16]
    bdcc:	e3c22024 	bic	r2, r2, #36	; 0x24
    bdd0:	e8840009 	stm	r4, {r0, r3}
    bdd4:	eaffffce 	b	bd14 <__swsetup_r+0x84>
    bdd8:	e3a03009 	mov	r3, #9
    bddc:	e3822040 	orr	r2, r2, #64	; 0x40
    bde0:	e5853000 	str	r3, [r5]
    bde4:	e3e00000 	mvn	r0, #0
    bde8:	e1c420bc 	strh	r2, [r4, #12]
    bdec:	eaffffc1 	b	bcf8 <__swsetup_r+0x68>
    bdf0:	0000fb6c 	.word	0x0000fb6c

0000bdf4 <abort>:
    bdf4:	e92d4010 	push	{r4, lr}
    bdf8:	e3a00006 	mov	r0, #6
    bdfc:	eb00097f 	bl	e400 <raise>
    be00:	e3a00001 	mov	r0, #1
    be04:	eb000cf2 	bl	f1d4 <_exit>

0000be08 <__sflush_r>:
    be08:	e1d130fc 	ldrsh	r3, [r1, #12]
    be0c:	e1a02803 	lsl	r2, r3, #16
    be10:	e3120702 	tst	r2, #524288	; 0x80000
    be14:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    be18:	e1a05001 	mov	r5, r1
    be1c:	e1a08000 	mov	r8, r0
    be20:	1a000034 	bne	bef8 <__sflush_r+0xf0>
    be24:	e5912004 	ldr	r2, [r1, #4]
    be28:	e3833b02 	orr	r3, r3, #2048	; 0x800
    be2c:	e3520000 	cmp	r2, #0
    be30:	e1c130bc 	strh	r3, [r1, #12]
    be34:	da000050 	ble	bf7c <__sflush_r+0x174>
    be38:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    be3c:	e3540000 	cmp	r4, #0
    be40:	0a000050 	beq	bf88 <__sflush_r+0x180>
    be44:	e3a02000 	mov	r2, #0
    be48:	e1a03803 	lsl	r3, r3, #16
    be4c:	e2030201 	and	r0, r3, #268435456	; 0x10000000
    be50:	e1b07820 	lsrs	r7, r0, #16
    be54:	e5986000 	ldr	r6, [r8]
    be58:	e1a03823 	lsr	r3, r3, #16
    be5c:	e5882000 	str	r2, [r8]
    be60:	0a00005e 	beq	bfe0 <__sflush_r+0x1d8>
    be64:	e5952050 	ldr	r2, [r5, #80]	; 0x50
    be68:	e3130004 	tst	r3, #4
    be6c:	0a000005 	beq	be88 <__sflush_r+0x80>
    be70:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    be74:	e5953004 	ldr	r3, [r5, #4]
    be78:	e3510000 	cmp	r1, #0
    be7c:	e0422003 	sub	r2, r2, r3
    be80:	1595303c 	ldrne	r3, [r5, #60]	; 0x3c
    be84:	10422003 	subne	r2, r2, r3
    be88:	e3a03000 	mov	r3, #0
    be8c:	e595101c 	ldr	r1, [r5, #28]
    be90:	e1a00008 	mov	r0, r8
    be94:	e1a0e00f 	mov	lr, pc
    be98:	e12fff14 	bx	r4
    be9c:	e3700001 	cmn	r0, #1
    bea0:	0a00003b 	beq	bf94 <__sflush_r+0x18c>
    bea4:	e3a01000 	mov	r1, #0
    bea8:	e1d530fc 	ldrsh	r3, [r5, #12]
    beac:	e5952010 	ldr	r2, [r5, #16]
    beb0:	e3c33b02 	bic	r3, r3, #2048	; 0x800
    beb4:	e3130a01 	tst	r3, #4096	; 0x1000
    beb8:	e1c530bc 	strh	r3, [r5, #12]
    bebc:	e5851004 	str	r1, [r5, #4]
    bec0:	e5852000 	str	r2, [r5]
    bec4:	1a000043 	bne	bfd8 <__sflush_r+0x1d0>
    bec8:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    becc:	e3510000 	cmp	r1, #0
    bed0:	e5886000 	str	r6, [r8]
    bed4:	0a00002b 	beq	bf88 <__sflush_r+0x180>
    bed8:	e2853040 	add	r3, r5, #64	; 0x40
    bedc:	e1510003 	cmp	r1, r3
    bee0:	11a00008 	movne	r0, r8
    bee4:	1b00024c 	blne	c81c <_free_r>
    bee8:	e3a00000 	mov	r0, #0
    beec:	e5850030 	str	r0, [r5, #48]	; 0x30
    bef0:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    bef4:	e12fff1e 	bx	lr
    bef8:	e5916010 	ldr	r6, [r1, #16]
    befc:	e3560000 	cmp	r6, #0
    bf00:	0a000020 	beq	bf88 <__sflush_r+0x180>
    bf04:	e1a02822 	lsr	r2, r2, #16
    bf08:	e3120003 	tst	r2, #3
    bf0c:	13a03000 	movne	r3, #0
    bf10:	e5914000 	ldr	r4, [r1]
    bf14:	05913014 	ldreq	r3, [r1, #20]
    bf18:	e0444006 	sub	r4, r4, r6
    bf1c:	e3540000 	cmp	r4, #0
    bf20:	e5816000 	str	r6, [r1]
    bf24:	e5813008 	str	r3, [r1, #8]
    bf28:	ca000003 	bgt	bf3c <__sflush_r+0x134>
    bf2c:	ea000015 	b	bf88 <__sflush_r+0x180>
    bf30:	e3540000 	cmp	r4, #0
    bf34:	e0866000 	add	r6, r6, r0
    bf38:	da000012 	ble	bf88 <__sflush_r+0x180>
    bf3c:	e1a03004 	mov	r3, r4
    bf40:	e5957024 	ldr	r7, [r5, #36]	; 0x24
    bf44:	e1a02006 	mov	r2, r6
    bf48:	e595101c 	ldr	r1, [r5, #28]
    bf4c:	e1a00008 	mov	r0, r8
    bf50:	e1a0e00f 	mov	lr, pc
    bf54:	e12fff17 	bx	r7
    bf58:	e3500000 	cmp	r0, #0
    bf5c:	e0444000 	sub	r4, r4, r0
    bf60:	cafffff2 	bgt	bf30 <__sflush_r+0x128>
    bf64:	e3e00000 	mvn	r0, #0
    bf68:	e1d530bc 	ldrh	r3, [r5, #12]
    bf6c:	e3833040 	orr	r3, r3, #64	; 0x40
    bf70:	e1c530bc 	strh	r3, [r5, #12]
    bf74:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    bf78:	e12fff1e 	bx	lr
    bf7c:	e591203c 	ldr	r2, [r1, #60]	; 0x3c
    bf80:	e3520000 	cmp	r2, #0
    bf84:	caffffab 	bgt	be38 <__sflush_r+0x30>
    bf88:	e3a00000 	mov	r0, #0
    bf8c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    bf90:	e12fff1e 	bx	lr
    bf94:	e5981000 	ldr	r1, [r8]
    bf98:	e351001d 	cmp	r1, #29
    bf9c:	8afffff0 	bhi	bf64 <__sflush_r+0x15c>
    bfa0:	e59f3098 	ldr	r3, [pc, #152]	; c040 <__sflush_r+0x238>
    bfa4:	e1e03133 	mvn	r3, r3, lsr r1
    bfa8:	e2133001 	ands	r3, r3, #1
    bfac:	1affffec 	bne	bf64 <__sflush_r+0x15c>
    bfb0:	e1d520fc 	ldrsh	r2, [r5, #12]
    bfb4:	e595c010 	ldr	ip, [r5, #16]
    bfb8:	e3c22b02 	bic	r2, r2, #2048	; 0x800
    bfbc:	e3120a01 	tst	r2, #4096	; 0x1000
    bfc0:	e5853004 	str	r3, [r5, #4]
    bfc4:	e1c520bc 	strh	r2, [r5, #12]
    bfc8:	e585c000 	str	ip, [r5]
    bfcc:	0affffbd 	beq	bec8 <__sflush_r+0xc0>
    bfd0:	e3510000 	cmp	r1, #0
    bfd4:	1affffbb 	bne	bec8 <__sflush_r+0xc0>
    bfd8:	e5850050 	str	r0, [r5, #80]	; 0x50
    bfdc:	eaffffb9 	b	bec8 <__sflush_r+0xc0>
    bfe0:	e1a02007 	mov	r2, r7
    bfe4:	e3a03001 	mov	r3, #1
    bfe8:	e595101c 	ldr	r1, [r5, #28]
    bfec:	e1a00008 	mov	r0, r8
    bff0:	e1a0e00f 	mov	lr, pc
    bff4:	e12fff14 	bx	r4
    bff8:	e3700001 	cmn	r0, #1
    bffc:	e1a02000 	mov	r2, r0
    c000:	0a000002 	beq	c010 <__sflush_r+0x208>
    c004:	e1d530bc 	ldrh	r3, [r5, #12]
    c008:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    c00c:	eaffff95 	b	be68 <__sflush_r+0x60>
    c010:	e5983000 	ldr	r3, [r8]
    c014:	e3530000 	cmp	r3, #0
    c018:	0afffff9 	beq	c004 <__sflush_r+0x1fc>
    c01c:	e3530016 	cmp	r3, #22
    c020:	1353001d 	cmpne	r3, #29
    c024:	11d530bc 	ldrhne	r3, [r5, #12]
    c028:	13833040 	orrne	r3, r3, #64	; 0x40
    c02c:	05886000 	streq	r6, [r8]
    c030:	01a00007 	moveq	r0, r7
    c034:	11a00002 	movne	r0, r2
    c038:	11c530bc 	strhne	r3, [r5, #12]
    c03c:	eaffffcc 	b	bf74 <__sflush_r+0x16c>
    c040:	20400001 	.word	0x20400001

0000c044 <_fflush_r>:
    c044:	e92d4070 	push	{r4, r5, r6, lr}
    c048:	e2504000 	subs	r4, r0, #0
    c04c:	e1a05001 	mov	r5, r1
    c050:	0a000002 	beq	c060 <_fflush_r+0x1c>
    c054:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    c058:	e3530000 	cmp	r3, #0
    c05c:	0a000015 	beq	c0b8 <_fflush_r+0x74>
    c060:	e1d500fc 	ldrsh	r0, [r5, #12]
    c064:	e3500000 	cmp	r0, #0
    c068:	01a04000 	moveq	r4, r0
    c06c:	0a00000e 	beq	c0ac <_fflush_r+0x68>
    c070:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    c074:	e3130001 	tst	r3, #1
    c078:	1a000001 	bne	c084 <_fflush_r+0x40>
    c07c:	e3100c02 	tst	r0, #512	; 0x200
    c080:	0a000013 	beq	c0d4 <_fflush_r+0x90>
    c084:	e1a00004 	mov	r0, r4
    c088:	e1a01005 	mov	r1, r5
    c08c:	ebffff5d 	bl	be08 <__sflush_r>
    c090:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    c094:	e3130001 	tst	r3, #1
    c098:	e1a04000 	mov	r4, r0
    c09c:	1a000002 	bne	c0ac <_fflush_r+0x68>
    c0a0:	e1d530bc 	ldrh	r3, [r5, #12]
    c0a4:	e3130c02 	tst	r3, #512	; 0x200
    c0a8:	0a000004 	beq	c0c0 <_fflush_r+0x7c>
    c0ac:	e1a00004 	mov	r0, r4
    c0b0:	e8bd4070 	pop	{r4, r5, r6, lr}
    c0b4:	e12fff1e 	bx	lr
    c0b8:	eb000076 	bl	c298 <__sinit>
    c0bc:	eaffffe7 	b	c060 <_fflush_r+0x1c>
    c0c0:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    c0c4:	eb000448 	bl	d1ec <__retarget_lock_release_recursive>
    c0c8:	e1a00004 	mov	r0, r4
    c0cc:	e8bd4070 	pop	{r4, r5, r6, lr}
    c0d0:	e12fff1e 	bx	lr
    c0d4:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    c0d8:	eb00043d 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c0dc:	eaffffe8 	b	c084 <_fflush_r+0x40>

0000c0e0 <fflush>:
    c0e0:	e2501000 	subs	r1, r0, #0
    c0e4:	159f3020 	ldrne	r3, [pc, #32]	; c10c <fflush+0x2c>
    c0e8:	15930000 	ldrne	r0, [r3]
    c0ec:	1affffd4 	bne	c044 <_fflush_r>
    c0f0:	e92d4010 	push	{r4, lr}
    c0f4:	e59f3014 	ldr	r3, [pc, #20]	; c110 <fflush+0x30>
    c0f8:	e59f1014 	ldr	r1, [pc, #20]	; c114 <fflush+0x34>
    c0fc:	e5930000 	ldr	r0, [r3]
    c100:	eb0003d5 	bl	d05c <_fwalk_reent>
    c104:	e8bd4010 	pop	{r4, lr}
    c108:	e12fff1e 	bx	lr
    c10c:	0000fb6c 	.word	0x0000fb6c
    c110:	0000f5b4 	.word	0x0000f5b4
    c114:	0000c044 	.word	0x0000c044

0000c118 <_cleanup_r>:
    c118:	e92d4010 	push	{r4, lr}
    c11c:	e59f1008 	ldr	r1, [pc, #8]	; c12c <_cleanup_r+0x14>
    c120:	eb0003cd 	bl	d05c <_fwalk_reent>
    c124:	e8bd4010 	pop	{r4, lr}
    c128:	e12fff1e 	bx	lr
    c12c:	0000eb6c 	.word	0x0000eb6c

0000c130 <std.isra.0>:
    c130:	e3a03000 	mov	r3, #0
    c134:	e92d4010 	push	{r4, lr}
    c138:	e1a04000 	mov	r4, r0
    c13c:	e1c010bc 	strh	r1, [r0, #12]
    c140:	e1c020be 	strh	r2, [r0, #14]
    c144:	e5803000 	str	r3, [r0]
    c148:	e5803004 	str	r3, [r0, #4]
    c14c:	e5803008 	str	r3, [r0, #8]
    c150:	e5803064 	str	r3, [r0, #100]	; 0x64
    c154:	e5803010 	str	r3, [r0, #16]
    c158:	e5803014 	str	r3, [r0, #20]
    c15c:	e5803018 	str	r3, [r0, #24]
    c160:	e1a01003 	mov	r1, r3
    c164:	e3a02008 	mov	r2, #8
    c168:	e280005c 	add	r0, r0, #92	; 0x5c
    c16c:	ebfff954 	bl	a6c4 <memset>
    c170:	e59f002c 	ldr	r0, [pc, #44]	; c1a4 <std.isra.0+0x74>
    c174:	e59f102c 	ldr	r1, [pc, #44]	; c1a8 <std.isra.0+0x78>
    c178:	e59f202c 	ldr	r2, [pc, #44]	; c1ac <std.isra.0+0x7c>
    c17c:	e59f302c 	ldr	r3, [pc, #44]	; c1b0 <std.isra.0+0x80>
    c180:	e5840020 	str	r0, [r4, #32]
    c184:	e584401c 	str	r4, [r4, #28]
    c188:	e5841024 	str	r1, [r4, #36]	; 0x24
    c18c:	e5842028 	str	r2, [r4, #40]	; 0x28
    c190:	e584302c 	str	r3, [r4, #44]	; 0x2c
    c194:	e2840058 	add	r0, r4, #88	; 0x58
    c198:	eb000409 	bl	d1c4 <__retarget_lock_init_recursive>
    c19c:	e8bd4010 	pop	{r4, lr}
    c1a0:	e12fff1e 	bx	lr
    c1a4:	0000e4b8 	.word	0x0000e4b8
    c1a8:	0000e4f4 	.word	0x0000e4f4
    c1ac:	0000e54c 	.word	0x0000e54c
    c1b0:	0000e57c 	.word	0x0000e57c

0000c1b4 <__fp_lock>:
    c1b4:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    c1b8:	e3130001 	tst	r3, #1
    c1bc:	1a000002 	bne	c1cc <__fp_lock+0x18>
    c1c0:	e1d030bc 	ldrh	r3, [r0, #12]
    c1c4:	e3130c02 	tst	r3, #512	; 0x200
    c1c8:	0a000001 	beq	c1d4 <__fp_lock+0x20>
    c1cc:	e3a00000 	mov	r0, #0
    c1d0:	e12fff1e 	bx	lr
    c1d4:	e92d4010 	push	{r4, lr}
    c1d8:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    c1dc:	eb0003fc 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c1e0:	e3a00000 	mov	r0, #0
    c1e4:	e8bd4010 	pop	{r4, lr}
    c1e8:	e12fff1e 	bx	lr

0000c1ec <__fp_unlock>:
    c1ec:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    c1f0:	e3130001 	tst	r3, #1
    c1f4:	1a000002 	bne	c204 <__fp_unlock+0x18>
    c1f8:	e1d030bc 	ldrh	r3, [r0, #12]
    c1fc:	e3130c02 	tst	r3, #512	; 0x200
    c200:	0a000001 	beq	c20c <__fp_unlock+0x20>
    c204:	e3a00000 	mov	r0, #0
    c208:	e12fff1e 	bx	lr
    c20c:	e92d4010 	push	{r4, lr}
    c210:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    c214:	eb0003f4 	bl	d1ec <__retarget_lock_release_recursive>
    c218:	e3a00000 	mov	r0, #0
    c21c:	e8bd4010 	pop	{r4, lr}
    c220:	e12fff1e 	bx	lr

0000c224 <__sfmoreglue>:
    c224:	e2412001 	sub	r2, r1, #1
    c228:	e92d4070 	push	{r4, r5, r6, lr}
    c22c:	e0824082 	add	r4, r2, r2, lsl #1
    c230:	e0822104 	add	r2, r2, r4, lsl #2
    c234:	e1a04182 	lsl	r4, r2, #3
    c238:	e1a06001 	mov	r6, r1
    c23c:	e2841074 	add	r1, r4, #116	; 0x74
    c240:	eb000452 	bl	d390 <_malloc_r>
    c244:	e2505000 	subs	r5, r0, #0
    c248:	0a000006 	beq	c268 <__sfmoreglue+0x44>
    c24c:	e3a01000 	mov	r1, #0
    c250:	e285000c 	add	r0, r5, #12
    c254:	e5856004 	str	r6, [r5, #4]
    c258:	e2842068 	add	r2, r4, #104	; 0x68
    c25c:	e5851000 	str	r1, [r5]
    c260:	e5850008 	str	r0, [r5, #8]
    c264:	ebfff916 	bl	a6c4 <memset>
    c268:	e1a00005 	mov	r0, r5
    c26c:	e8bd4070 	pop	{r4, r5, r6, lr}
    c270:	e12fff1e 	bx	lr

0000c274 <_cleanup>:
    c274:	e92d4010 	push	{r4, lr}
    c278:	e59f3010 	ldr	r3, [pc, #16]	; c290 <_cleanup+0x1c>
    c27c:	e59f1010 	ldr	r1, [pc, #16]	; c294 <_cleanup+0x20>
    c280:	e5930000 	ldr	r0, [r3]
    c284:	eb000374 	bl	d05c <_fwalk_reent>
    c288:	e8bd4010 	pop	{r4, lr}
    c28c:	e12fff1e 	bx	lr
    c290:	0000f5b4 	.word	0x0000f5b4
    c294:	0000eb6c 	.word	0x0000eb6c

0000c298 <__sinit>:
    c298:	e92d4010 	push	{r4, lr}
    c29c:	e1a04000 	mov	r4, r0
    c2a0:	e59f007c 	ldr	r0, [pc, #124]	; c324 <__sinit+0x8c>
    c2a4:	eb0003ca 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c2a8:	e5942038 	ldr	r2, [r4, #56]	; 0x38
    c2ac:	e3520000 	cmp	r2, #0
    c2b0:	1a000017 	bne	c314 <__sinit+0x7c>
    c2b4:	e3a00003 	mov	r0, #3
    c2b8:	e59f1068 	ldr	r1, [pc, #104]	; c328 <__sinit+0x90>
    c2bc:	e2843fbb 	add	r3, r4, #748	; 0x2ec
    c2c0:	e58432e8 	str	r3, [r4, #744]	; 0x2e8
    c2c4:	e58422e0 	str	r2, [r4, #736]	; 0x2e0
    c2c8:	e58402e4 	str	r0, [r4, #740]	; 0x2e4
    c2cc:	e584103c 	str	r1, [r4, #60]	; 0x3c
    c2d0:	e5940004 	ldr	r0, [r4, #4]
    c2d4:	e3a01004 	mov	r1, #4
    c2d8:	ebffff94 	bl	c130 <std.isra.0>
    c2dc:	e5940008 	ldr	r0, [r4, #8]
    c2e0:	e3a02001 	mov	r2, #1
    c2e4:	e3a01009 	mov	r1, #9
    c2e8:	ebffff90 	bl	c130 <std.isra.0>
    c2ec:	e594000c 	ldr	r0, [r4, #12]
    c2f0:	e3a02002 	mov	r2, #2
    c2f4:	e3a01012 	mov	r1, #18
    c2f8:	ebffff8c 	bl	c130 <std.isra.0>
    c2fc:	e3a03001 	mov	r3, #1
    c300:	e59f001c 	ldr	r0, [pc, #28]	; c324 <__sinit+0x8c>
    c304:	e5843038 	str	r3, [r4, #56]	; 0x38
    c308:	eb0003b7 	bl	d1ec <__retarget_lock_release_recursive>
    c30c:	e8bd4010 	pop	{r4, lr}
    c310:	e12fff1e 	bx	lr
    c314:	e59f0008 	ldr	r0, [pc, #8]	; c324 <__sinit+0x8c>
    c318:	eb0003b3 	bl	d1ec <__retarget_lock_release_recursive>
    c31c:	e8bd4010 	pop	{r4, lr}
    c320:	e12fff1e 	bx	lr
    c324:	00010580 	.word	0x00010580
    c328:	0000c118 	.word	0x0000c118

0000c32c <__sfp>:
    c32c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c330:	e1a06000 	mov	r6, r0
    c334:	e59f0108 	ldr	r0, [pc, #264]	; c444 <__sfp+0x118>
    c338:	eb0003a5 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c33c:	e59f3104 	ldr	r3, [pc, #260]	; c448 <__sfp+0x11c>
    c340:	e5935000 	ldr	r5, [r3]
    c344:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    c348:	e3530000 	cmp	r3, #0
    c34c:	0a00002d 	beq	c408 <__sfp+0xdc>
    c350:	e3a07004 	mov	r7, #4
    c354:	e2855e2e 	add	r5, r5, #736	; 0x2e0
    c358:	e5953004 	ldr	r3, [r5, #4]
    c35c:	e2533001 	subs	r3, r3, #1
    c360:	e5954008 	ldr	r4, [r5, #8]
    c364:	5a000004 	bpl	c37c <__sfp+0x50>
    c368:	ea000021 	b	c3f4 <__sfp+0xc8>
    c36c:	e2433001 	sub	r3, r3, #1
    c370:	e3730001 	cmn	r3, #1
    c374:	e2844068 	add	r4, r4, #104	; 0x68
    c378:	0a00001d 	beq	c3f4 <__sfp+0xc8>
    c37c:	e1d420fc 	ldrsh	r2, [r4, #12]
    c380:	e3520000 	cmp	r2, #0
    c384:	1afffff8 	bne	c36c <__sfp+0x40>
    c388:	e3a05000 	mov	r5, #0
    c38c:	e3e02000 	mvn	r2, #0
    c390:	e3a03001 	mov	r3, #1
    c394:	e1c420be 	strh	r2, [r4, #14]
    c398:	e1c430bc 	strh	r3, [r4, #12]
    c39c:	e2840058 	add	r0, r4, #88	; 0x58
    c3a0:	e5845064 	str	r5, [r4, #100]	; 0x64
    c3a4:	eb000386 	bl	d1c4 <__retarget_lock_init_recursive>
    c3a8:	e59f0094 	ldr	r0, [pc, #148]	; c444 <__sfp+0x118>
    c3ac:	eb00038e 	bl	d1ec <__retarget_lock_release_recursive>
    c3b0:	e5845000 	str	r5, [r4]
    c3b4:	e5845008 	str	r5, [r4, #8]
    c3b8:	e5845004 	str	r5, [r4, #4]
    c3bc:	e5845010 	str	r5, [r4, #16]
    c3c0:	e5845014 	str	r5, [r4, #20]
    c3c4:	e5845018 	str	r5, [r4, #24]
    c3c8:	e1a01005 	mov	r1, r5
    c3cc:	e3a02008 	mov	r2, #8
    c3d0:	e284005c 	add	r0, r4, #92	; 0x5c
    c3d4:	ebfff8ba 	bl	a6c4 <memset>
    c3d8:	e5845030 	str	r5, [r4, #48]	; 0x30
    c3dc:	e5845034 	str	r5, [r4, #52]	; 0x34
    c3e0:	e5845044 	str	r5, [r4, #68]	; 0x44
    c3e4:	e5845048 	str	r5, [r4, #72]	; 0x48
    c3e8:	e1a00004 	mov	r0, r4
    c3ec:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c3f0:	e12fff1e 	bx	lr
    c3f4:	e5954000 	ldr	r4, [r5]
    c3f8:	e3540000 	cmp	r4, #0
    c3fc:	0a000004 	beq	c414 <__sfp+0xe8>
    c400:	e1a05004 	mov	r5, r4
    c404:	eaffffd3 	b	c358 <__sfp+0x2c>
    c408:	e1a00005 	mov	r0, r5
    c40c:	ebffffa1 	bl	c298 <__sinit>
    c410:	eaffffce 	b	c350 <__sfp+0x24>
    c414:	e1a01007 	mov	r1, r7
    c418:	e1a00006 	mov	r0, r6
    c41c:	ebffff80 	bl	c224 <__sfmoreglue>
    c420:	e3500000 	cmp	r0, #0
    c424:	e1a04000 	mov	r4, r0
    c428:	e5850000 	str	r0, [r5]
    c42c:	1afffff3 	bne	c400 <__sfp+0xd4>
    c430:	e59f000c 	ldr	r0, [pc, #12]	; c444 <__sfp+0x118>
    c434:	eb00036c 	bl	d1ec <__retarget_lock_release_recursive>
    c438:	e3a0300c 	mov	r3, #12
    c43c:	e5863000 	str	r3, [r6]
    c440:	eaffffe8 	b	c3e8 <__sfp+0xbc>
    c444:	00010594 	.word	0x00010594
    c448:	0000f5b4 	.word	0x0000f5b4

0000c44c <__sfp_lock_acquire>:
    c44c:	e92d4010 	push	{r4, lr}
    c450:	e59f0008 	ldr	r0, [pc, #8]	; c460 <__sfp_lock_acquire+0x14>
    c454:	eb00035e 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c458:	e8bd4010 	pop	{r4, lr}
    c45c:	e12fff1e 	bx	lr
    c460:	00010594 	.word	0x00010594

0000c464 <__sfp_lock_release>:
    c464:	e92d4010 	push	{r4, lr}
    c468:	e59f0008 	ldr	r0, [pc, #8]	; c478 <__sfp_lock_release+0x14>
    c46c:	eb00035e 	bl	d1ec <__retarget_lock_release_recursive>
    c470:	e8bd4010 	pop	{r4, lr}
    c474:	e12fff1e 	bx	lr
    c478:	00010594 	.word	0x00010594

0000c47c <__sinit_lock_acquire>:
    c47c:	e92d4010 	push	{r4, lr}
    c480:	e59f0008 	ldr	r0, [pc, #8]	; c490 <__sinit_lock_acquire+0x14>
    c484:	eb000352 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c488:	e8bd4010 	pop	{r4, lr}
    c48c:	e12fff1e 	bx	lr
    c490:	00010580 	.word	0x00010580

0000c494 <__sinit_lock_release>:
    c494:	e92d4010 	push	{r4, lr}
    c498:	e59f0008 	ldr	r0, [pc, #8]	; c4a8 <__sinit_lock_release+0x14>
    c49c:	eb000352 	bl	d1ec <__retarget_lock_release_recursive>
    c4a0:	e8bd4010 	pop	{r4, lr}
    c4a4:	e12fff1e 	bx	lr
    c4a8:	00010580 	.word	0x00010580

0000c4ac <__fp_lock_all>:
    c4ac:	e92d4010 	push	{r4, lr}
    c4b0:	e59f0018 	ldr	r0, [pc, #24]	; c4d0 <__fp_lock_all+0x24>
    c4b4:	eb000346 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c4b8:	e59f3014 	ldr	r3, [pc, #20]	; c4d4 <__fp_lock_all+0x28>
    c4bc:	e59f1014 	ldr	r1, [pc, #20]	; c4d8 <__fp_lock_all+0x2c>
    c4c0:	e5930000 	ldr	r0, [r3]
    c4c4:	eb0002c3 	bl	cfd8 <_fwalk>
    c4c8:	e8bd4010 	pop	{r4, lr}
    c4cc:	e12fff1e 	bx	lr
    c4d0:	00010594 	.word	0x00010594
    c4d4:	0000fb6c 	.word	0x0000fb6c
    c4d8:	0000c1b4 	.word	0x0000c1b4

0000c4dc <__fp_unlock_all>:
    c4dc:	e92d4010 	push	{r4, lr}
    c4e0:	e59f3018 	ldr	r3, [pc, #24]	; c500 <__fp_unlock_all+0x24>
    c4e4:	e59f1018 	ldr	r1, [pc, #24]	; c504 <__fp_unlock_all+0x28>
    c4e8:	e5930000 	ldr	r0, [r3]
    c4ec:	eb0002b9 	bl	cfd8 <_fwalk>
    c4f0:	e59f0010 	ldr	r0, [pc, #16]	; c508 <__fp_unlock_all+0x2c>
    c4f4:	eb00033c 	bl	d1ec <__retarget_lock_release_recursive>
    c4f8:	e8bd4010 	pop	{r4, lr}
    c4fc:	e12fff1e 	bx	lr
    c500:	0000fb6c 	.word	0x0000fb6c
    c504:	0000c1ec 	.word	0x0000c1ec
    c508:	00010594 	.word	0x00010594

0000c50c <__fputwc>:
    c50c:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    c510:	e24dd00c 	sub	sp, sp, #12
    c514:	e1a08000 	mov	r8, r0
    c518:	e1a07001 	mov	r7, r1
    c51c:	e1a04002 	mov	r4, r2
    c520:	eb00030a 	bl	d150 <__locale_mb_cur_max>
    c524:	e3500001 	cmp	r0, #1
    c528:	0a000030 	beq	c5f0 <__fputwc+0xe4>
    c52c:	e284305c 	add	r3, r4, #92	; 0x5c
    c530:	e1a02007 	mov	r2, r7
    c534:	e28d1004 	add	r1, sp, #4
    c538:	e1a00008 	mov	r0, r8
    c53c:	eb000907 	bl	e960 <_wcrtomb_r>
    c540:	e3700001 	cmn	r0, #1
    c544:	e1a06000 	mov	r6, r0
    c548:	0a000022 	beq	c5d8 <__fputwc+0xcc>
    c54c:	e3500000 	cmp	r0, #0
    c550:	15dd1004 	ldrbne	r1, [sp, #4]
    c554:	0a00002c 	beq	c60c <__fputwc+0x100>
    c558:	e3a05000 	mov	r5, #0
    c55c:	e28d9004 	add	r9, sp, #4
    c560:	ea000007 	b	c584 <__fputwc+0x78>
    c564:	e5943000 	ldr	r3, [r4]
    c568:	e2832001 	add	r2, r3, #1
    c56c:	e5842000 	str	r2, [r4]
    c570:	e5c31000 	strb	r1, [r3]
    c574:	e2855001 	add	r5, r5, #1
    c578:	e1560005 	cmp	r6, r5
    c57c:	9a000022 	bls	c60c <__fputwc+0x100>
    c580:	e7d51009 	ldrb	r1, [r5, r9]
    c584:	e5943008 	ldr	r3, [r4, #8]
    c588:	e2433001 	sub	r3, r3, #1
    c58c:	e3530000 	cmp	r3, #0
    c590:	e5843008 	str	r3, [r4, #8]
    c594:	aafffff2 	bge	c564 <__fputwc+0x58>
    c598:	e5942018 	ldr	r2, [r4, #24]
    c59c:	e1530002 	cmp	r3, r2
    c5a0:	b3a03000 	movlt	r3, #0
    c5a4:	a3a03001 	movge	r3, #1
    c5a8:	e351000a 	cmp	r1, #10
    c5ac:	03a03000 	moveq	r3, #0
    c5b0:	e3530000 	cmp	r3, #0
    c5b4:	1affffea 	bne	c564 <__fputwc+0x58>
    c5b8:	e1a02004 	mov	r2, r4
    c5bc:	e1a00008 	mov	r0, r8
    c5c0:	eb000893 	bl	e814 <__swbuf_r>
    c5c4:	e3700001 	cmn	r0, #1
    c5c8:	1affffe9 	bne	c574 <__fputwc+0x68>
    c5cc:	e28dd00c 	add	sp, sp, #12
    c5d0:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    c5d4:	e12fff1e 	bx	lr
    c5d8:	e1d430bc 	ldrh	r3, [r4, #12]
    c5dc:	e3833040 	orr	r3, r3, #64	; 0x40
    c5e0:	e1c430bc 	strh	r3, [r4, #12]
    c5e4:	e28dd00c 	add	sp, sp, #12
    c5e8:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    c5ec:	e12fff1e 	bx	lr
    c5f0:	e2473001 	sub	r3, r7, #1
    c5f4:	e35300fe 	cmp	r3, #254	; 0xfe
    c5f8:	8affffcb 	bhi	c52c <__fputwc+0x20>
    c5fc:	e20710ff 	and	r1, r7, #255	; 0xff
    c600:	e1a06000 	mov	r6, r0
    c604:	e5cd1004 	strb	r1, [sp, #4]
    c608:	eaffffd2 	b	c558 <__fputwc+0x4c>
    c60c:	e1a00007 	mov	r0, r7
    c610:	e28dd00c 	add	sp, sp, #12
    c614:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    c618:	e12fff1e 	bx	lr

0000c61c <_fputwc_r>:
    c61c:	e92d4030 	push	{r4, r5, lr}
    c620:	e5923064 	ldr	r3, [r2, #100]	; 0x64
    c624:	e1a04002 	mov	r4, r2
    c628:	e1d220fc 	ldrsh	r2, [r2, #12]
    c62c:	e3130001 	tst	r3, #1
    c630:	e1a03802 	lsl	r3, r2, #16
    c634:	e24dd00c 	sub	sp, sp, #12
    c638:	e1a05000 	mov	r5, r0
    c63c:	11a03823 	lsrne	r3, r3, #16
    c640:	1a000002 	bne	c650 <_fputwc_r+0x34>
    c644:	e3130402 	tst	r3, #33554432	; 0x2000000
    c648:	e1a03823 	lsr	r3, r3, #16
    c64c:	0a000019 	beq	c6b8 <_fputwc_r+0x9c>
    c650:	e3130a02 	tst	r3, #8192	; 0x2000
    c654:	05943064 	ldreq	r3, [r4, #100]	; 0x64
    c658:	03822a02 	orreq	r2, r2, #8192	; 0x2000
    c65c:	03833a02 	orreq	r3, r3, #8192	; 0x2000
    c660:	01c420bc 	strheq	r2, [r4, #12]
    c664:	05843064 	streq	r3, [r4, #100]	; 0x64
    c668:	e1a00005 	mov	r0, r5
    c66c:	e1a02004 	mov	r2, r4
    c670:	ebffffa5 	bl	c50c <__fputwc>
    c674:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    c678:	e3130001 	tst	r3, #1
    c67c:	e1a05000 	mov	r5, r0
    c680:	1a000002 	bne	c690 <_fputwc_r+0x74>
    c684:	e1d430bc 	ldrh	r3, [r4, #12]
    c688:	e3130c02 	tst	r3, #512	; 0x200
    c68c:	0a000003 	beq	c6a0 <_fputwc_r+0x84>
    c690:	e1a00005 	mov	r0, r5
    c694:	e28dd00c 	add	sp, sp, #12
    c698:	e8bd4030 	pop	{r4, r5, lr}
    c69c:	e12fff1e 	bx	lr
    c6a0:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    c6a4:	eb0002d0 	bl	d1ec <__retarget_lock_release_recursive>
    c6a8:	e1a00005 	mov	r0, r5
    c6ac:	e28dd00c 	add	sp, sp, #12
    c6b0:	e8bd4030 	pop	{r4, r5, lr}
    c6b4:	e12fff1e 	bx	lr
    c6b8:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    c6bc:	e58d1004 	str	r1, [sp, #4]
    c6c0:	eb0002c3 	bl	d1d4 <__retarget_lock_acquire_recursive>
    c6c4:	e1d420fc 	ldrsh	r2, [r4, #12]
    c6c8:	e1a03802 	lsl	r3, r2, #16
    c6cc:	e1a03823 	lsr	r3, r3, #16
    c6d0:	e59d1004 	ldr	r1, [sp, #4]
    c6d4:	eaffffdd 	b	c650 <_fputwc_r+0x34>

0000c6d8 <fputwc>:
    c6d8:	e59f3038 	ldr	r3, [pc, #56]	; c718 <fputwc+0x40>
    c6dc:	e92d4070 	push	{r4, r5, r6, lr}
    c6e0:	e5934000 	ldr	r4, [r3]
    c6e4:	e3540000 	cmp	r4, #0
    c6e8:	e1a05000 	mov	r5, r0
    c6ec:	e1a06001 	mov	r6, r1
    c6f0:	0a000003 	beq	c704 <fputwc+0x2c>
    c6f4:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    c6f8:	e3530000 	cmp	r3, #0
    c6fc:	01a00004 	moveq	r0, r4
    c700:	0bfffee4 	bleq	c298 <__sinit>
    c704:	e1a02006 	mov	r2, r6
    c708:	e1a01005 	mov	r1, r5
    c70c:	e1a00004 	mov	r0, r4
    c710:	e8bd4070 	pop	{r4, r5, r6, lr}
    c714:	eaffffc0 	b	c61c <_fputwc_r>
    c718:	0000fb6c 	.word	0x0000fb6c

0000c71c <_malloc_trim_r>:
    c71c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    c720:	e1a04001 	mov	r4, r1
    c724:	e59f70e4 	ldr	r7, [pc, #228]	; c810 <_malloc_trim_r+0xf4>
    c728:	e1a06000 	mov	r6, r0
    c72c:	eb00055e 	bl	dcac <__malloc_lock>
    c730:	e5973008 	ldr	r3, [r7, #8]
    c734:	e5935004 	ldr	r5, [r3, #4]
    c738:	e2641efe 	rsb	r1, r4, #4064	; 0xfe0
    c73c:	e281100f 	add	r1, r1, #15
    c740:	e3c55003 	bic	r5, r5, #3
    c744:	e0814005 	add	r4, r1, r5
    c748:	e1a04624 	lsr	r4, r4, #12
    c74c:	e2444001 	sub	r4, r4, #1
    c750:	e1a04604 	lsl	r4, r4, #12
    c754:	e3540a01 	cmp	r4, #4096	; 0x1000
    c758:	ba000006 	blt	c778 <_malloc_trim_r+0x5c>
    c75c:	e3a01000 	mov	r1, #0
    c760:	e1a00006 	mov	r0, r6
    c764:	eb000691 	bl	e1b0 <_sbrk_r>
    c768:	e5973008 	ldr	r3, [r7, #8]
    c76c:	e0833005 	add	r3, r3, r5
    c770:	e1500003 	cmp	r0, r3
    c774:	0a000004 	beq	c78c <_malloc_trim_r+0x70>
    c778:	e1a00006 	mov	r0, r6
    c77c:	eb000550 	bl	dcc4 <__malloc_unlock>
    c780:	e3a00000 	mov	r0, #0
    c784:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c788:	e12fff1e 	bx	lr
    c78c:	e2641000 	rsb	r1, r4, #0
    c790:	e1a00006 	mov	r0, r6
    c794:	eb000685 	bl	e1b0 <_sbrk_r>
    c798:	e3700001 	cmn	r0, #1
    c79c:	0a00000c 	beq	c7d4 <_malloc_trim_r+0xb8>
    c7a0:	e59f206c 	ldr	r2, [pc, #108]	; c814 <_malloc_trim_r+0xf8>
    c7a4:	e5971008 	ldr	r1, [r7, #8]
    c7a8:	e5923000 	ldr	r3, [r2]
    c7ac:	e0455004 	sub	r5, r5, r4
    c7b0:	e3855001 	orr	r5, r5, #1
    c7b4:	e1a00006 	mov	r0, r6
    c7b8:	e0434004 	sub	r4, r3, r4
    c7bc:	e5815004 	str	r5, [r1, #4]
    c7c0:	e5824000 	str	r4, [r2]
    c7c4:	eb00053e 	bl	dcc4 <__malloc_unlock>
    c7c8:	e3a00001 	mov	r0, #1
    c7cc:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    c7d0:	e12fff1e 	bx	lr
    c7d4:	e3a01000 	mov	r1, #0
    c7d8:	e1a00006 	mov	r0, r6
    c7dc:	eb000673 	bl	e1b0 <_sbrk_r>
    c7e0:	e5972008 	ldr	r2, [r7, #8]
    c7e4:	e0403002 	sub	r3, r0, r2
    c7e8:	e353000f 	cmp	r3, #15
    c7ec:	daffffe1 	ble	c778 <_malloc_trim_r+0x5c>
    c7f0:	e59f1020 	ldr	r1, [pc, #32]	; c818 <_malloc_trim_r+0xfc>
    c7f4:	e591c000 	ldr	ip, [r1]
    c7f8:	e59f1014 	ldr	r1, [pc, #20]	; c814 <_malloc_trim_r+0xf8>
    c7fc:	e3833001 	orr	r3, r3, #1
    c800:	e040000c 	sub	r0, r0, ip
    c804:	e5823004 	str	r3, [r2, #4]
    c808:	e5810000 	str	r0, [r1]
    c80c:	eaffffd9 	b	c778 <_malloc_trim_r+0x5c>
    c810:	00010104 	.word	0x00010104
    c814:	0001053c 	.word	0x0001053c
    c818:	0001050c 	.word	0x0001050c

0000c81c <_free_r>:
    c81c:	e92d4070 	push	{r4, r5, r6, lr}
    c820:	e2514000 	subs	r4, r1, #0
    c824:	0a000031 	beq	c8f0 <_free_r+0xd4>
    c828:	e1a05000 	mov	r5, r0
    c82c:	eb00051e 	bl	dcac <__malloc_lock>
    c830:	e5141004 	ldr	r1, [r4, #-4]
    c834:	e59fe2ac 	ldr	lr, [pc, #684]	; cae8 <_free_r+0x2cc>
    c838:	e3c13001 	bic	r3, r1, #1
    c83c:	e244c008 	sub	ip, r4, #8
    c840:	e08c0003 	add	r0, ip, r3
    c844:	e59e6008 	ldr	r6, [lr, #8]
    c848:	e5902004 	ldr	r2, [r0, #4]
    c84c:	e1500006 	cmp	r0, r6
    c850:	e3c22003 	bic	r2, r2, #3
    c854:	0a00004e 	beq	c994 <_free_r+0x178>
    c858:	e3110001 	tst	r1, #1
    c85c:	e5802004 	str	r2, [r0, #4]
    c860:	1a000009 	bne	c88c <_free_r+0x70>
    c864:	e5144008 	ldr	r4, [r4, #-8]
    c868:	e04cc004 	sub	ip, ip, r4
    c86c:	e59c1008 	ldr	r1, [ip, #8]
    c870:	e28e6008 	add	r6, lr, #8
    c874:	e1510006 	cmp	r1, r6
    c878:	e0833004 	add	r3, r3, r4
    c87c:	0a00005c 	beq	c9f4 <_free_r+0x1d8>
    c880:	e59c400c 	ldr	r4, [ip, #12]
    c884:	e581400c 	str	r4, [r1, #12]
    c888:	e5841008 	str	r1, [r4, #8]
    c88c:	e0801002 	add	r1, r0, r2
    c890:	e5911004 	ldr	r1, [r1, #4]
    c894:	e3110001 	tst	r1, #1
    c898:	13832001 	orrne	r2, r3, #1
    c89c:	158c2004 	strne	r2, [ip, #4]
    c8a0:	178c3003 	strne	r3, [ip, r3]
    c8a4:	0a00002c 	beq	c95c <_free_r+0x140>
    c8a8:	e3530c02 	cmp	r3, #512	; 0x200
    c8ac:	2a000011 	bcs	c8f8 <_free_r+0xdc>
    c8b0:	e3a04001 	mov	r4, #1
    c8b4:	e59e0004 	ldr	r0, [lr, #4]
    c8b8:	e1a031a3 	lsr	r3, r3, #3
    c8bc:	e0832004 	add	r2, r3, r4
    c8c0:	e1a03143 	asr	r3, r3, #2
    c8c4:	e1803314 	orr	r3, r0, r4, lsl r3
    c8c8:	e08e1182 	add	r1, lr, r2, lsl #3
    c8cc:	e79e0182 	ldr	r0, [lr, r2, lsl #3]
    c8d0:	e2411008 	sub	r1, r1, #8
    c8d4:	e58e3004 	str	r3, [lr, #4]
    c8d8:	e58c100c 	str	r1, [ip, #12]
    c8dc:	e58c0008 	str	r0, [ip, #8]
    c8e0:	e78ec182 	str	ip, [lr, r2, lsl #3]
    c8e4:	e580c00c 	str	ip, [r0, #12]
    c8e8:	e1a00005 	mov	r0, r5
    c8ec:	eb0004f4 	bl	dcc4 <__malloc_unlock>
    c8f0:	e8bd4070 	pop	{r4, r5, r6, lr}
    c8f4:	e12fff1e 	bx	lr
    c8f8:	e1a024a3 	lsr	r2, r3, #9
    c8fc:	e3520004 	cmp	r2, #4
    c900:	8a000048 	bhi	ca28 <_free_r+0x20c>
    c904:	e1a02323 	lsr	r2, r3, #6
    c908:	e2824039 	add	r4, r2, #57	; 0x39
    c90c:	e1a04184 	lsl	r4, r4, #3
    c910:	e2821038 	add	r1, r2, #56	; 0x38
    c914:	e08e0004 	add	r0, lr, r4
    c918:	e79e2004 	ldr	r2, [lr, r4]
    c91c:	e2400008 	sub	r0, r0, #8
    c920:	e1500002 	cmp	r0, r2
    c924:	0a000045 	beq	ca40 <_free_r+0x224>
    c928:	e5921004 	ldr	r1, [r2, #4]
    c92c:	e3c11003 	bic	r1, r1, #3
    c930:	e1530001 	cmp	r3, r1
    c934:	2a00002c 	bcs	c9ec <_free_r+0x1d0>
    c938:	e5922008 	ldr	r2, [r2, #8]
    c93c:	e1500002 	cmp	r0, r2
    c940:	1afffff8 	bne	c928 <_free_r+0x10c>
    c944:	e590300c 	ldr	r3, [r0, #12]
    c948:	e58c300c 	str	r3, [ip, #12]
    c94c:	e58c0008 	str	r0, [ip, #8]
    c950:	e583c008 	str	ip, [r3, #8]
    c954:	e580c00c 	str	ip, [r0, #12]
    c958:	eaffffe2 	b	c8e8 <_free_r+0xcc>
    c95c:	e5901008 	ldr	r1, [r0, #8]
    c960:	e59f4184 	ldr	r4, [pc, #388]	; caec <_free_r+0x2d0>
    c964:	e1510004 	cmp	r1, r4
    c968:	e0833002 	add	r3, r3, r2
    c96c:	0a00003a 	beq	ca5c <_free_r+0x240>
    c970:	e590000c 	ldr	r0, [r0, #12]
    c974:	e3832001 	orr	r2, r3, #1
    c978:	e3530c02 	cmp	r3, #512	; 0x200
    c97c:	e581000c 	str	r0, [r1, #12]
    c980:	e5801008 	str	r1, [r0, #8]
    c984:	e58c2004 	str	r2, [ip, #4]
    c988:	e78c3003 	str	r3, [ip, r3]
    c98c:	2affffd9 	bcs	c8f8 <_free_r+0xdc>
    c990:	eaffffc6 	b	c8b0 <_free_r+0x94>
    c994:	e3110001 	tst	r1, #1
    c998:	e0833002 	add	r3, r3, r2
    c99c:	1a000006 	bne	c9bc <_free_r+0x1a0>
    c9a0:	e5142008 	ldr	r2, [r4, #-8]
    c9a4:	e04cc002 	sub	ip, ip, r2
    c9a8:	e28c0008 	add	r0, ip, #8
    c9ac:	e8900003 	ldm	r0, {r0, r1}
    c9b0:	e580100c 	str	r1, [r0, #12]
    c9b4:	e5810008 	str	r0, [r1, #8]
    c9b8:	e0833002 	add	r3, r3, r2
    c9bc:	e59f212c 	ldr	r2, [pc, #300]	; caf0 <_free_r+0x2d4>
    c9c0:	e5921000 	ldr	r1, [r2]
    c9c4:	e3832001 	orr	r2, r3, #1
    c9c8:	e1530001 	cmp	r3, r1
    c9cc:	e58c2004 	str	r2, [ip, #4]
    c9d0:	e58ec008 	str	ip, [lr, #8]
    c9d4:	3affffc3 	bcc	c8e8 <_free_r+0xcc>
    c9d8:	e59f3114 	ldr	r3, [pc, #276]	; caf4 <_free_r+0x2d8>
    c9dc:	e1a00005 	mov	r0, r5
    c9e0:	e5931000 	ldr	r1, [r3]
    c9e4:	ebffff4c 	bl	c71c <_malloc_trim_r>
    c9e8:	eaffffbe 	b	c8e8 <_free_r+0xcc>
    c9ec:	e1a00002 	mov	r0, r2
    c9f0:	eaffffd3 	b	c944 <_free_r+0x128>
    c9f4:	e0801002 	add	r1, r0, r2
    c9f8:	e5911004 	ldr	r1, [r1, #4]
    c9fc:	e3110001 	tst	r1, #1
    ca00:	1a000034 	bne	cad8 <_free_r+0x2bc>
    ca04:	e2801008 	add	r1, r0, #8
    ca08:	e0823003 	add	r3, r2, r3
    ca0c:	e8910006 	ldm	r1, {r1, r2}
    ca10:	e3830001 	orr	r0, r3, #1
    ca14:	e581200c 	str	r2, [r1, #12]
    ca18:	e5821008 	str	r1, [r2, #8]
    ca1c:	e58c0004 	str	r0, [ip, #4]
    ca20:	e78c3003 	str	r3, [ip, r3]
    ca24:	eaffffaf 	b	c8e8 <_free_r+0xcc>
    ca28:	e3520014 	cmp	r2, #20
    ca2c:	8a000012 	bhi	ca7c <_free_r+0x260>
    ca30:	e282405c 	add	r4, r2, #92	; 0x5c
    ca34:	e1a04184 	lsl	r4, r4, #3
    ca38:	e282105b 	add	r1, r2, #91	; 0x5b
    ca3c:	eaffffb4 	b	c914 <_free_r+0xf8>
    ca40:	e3a04001 	mov	r4, #1
    ca44:	e59e3004 	ldr	r3, [lr, #4]
    ca48:	e1a02141 	asr	r2, r1, #2
    ca4c:	e1832214 	orr	r2, r3, r4, lsl r2
    ca50:	e58e2004 	str	r2, [lr, #4]
    ca54:	e1a03000 	mov	r3, r0
    ca58:	eaffffba 	b	c948 <_free_r+0x12c>
    ca5c:	e3832001 	orr	r2, r3, #1
    ca60:	e58ec014 	str	ip, [lr, #20]
    ca64:	e58ec010 	str	ip, [lr, #16]
    ca68:	e58c100c 	str	r1, [ip, #12]
    ca6c:	e58c1008 	str	r1, [ip, #8]
    ca70:	e58c2004 	str	r2, [ip, #4]
    ca74:	e78c3003 	str	r3, [ip, r3]
    ca78:	eaffff9a 	b	c8e8 <_free_r+0xcc>
    ca7c:	e3520054 	cmp	r2, #84	; 0x54
    ca80:	8a000004 	bhi	ca98 <_free_r+0x27c>
    ca84:	e1a02623 	lsr	r2, r3, #12
    ca88:	e282406f 	add	r4, r2, #111	; 0x6f
    ca8c:	e1a04184 	lsl	r4, r4, #3
    ca90:	e282106e 	add	r1, r2, #110	; 0x6e
    ca94:	eaffff9e 	b	c914 <_free_r+0xf8>
    ca98:	e3520f55 	cmp	r2, #340	; 0x154
    ca9c:	8a000004 	bhi	cab4 <_free_r+0x298>
    caa0:	e1a027a3 	lsr	r2, r3, #15
    caa4:	e2824078 	add	r4, r2, #120	; 0x78
    caa8:	e1a04184 	lsl	r4, r4, #3
    caac:	e2821077 	add	r1, r2, #119	; 0x77
    cab0:	eaffff97 	b	c914 <_free_r+0xf8>
    cab4:	e59f103c 	ldr	r1, [pc, #60]	; caf8 <_free_r+0x2dc>
    cab8:	e1520001 	cmp	r2, r1
    cabc:	91a02923 	lsrls	r2, r3, #18
    cac0:	9282407d 	addls	r4, r2, #125	; 0x7d
    cac4:	91a04184 	lslls	r4, r4, #3
    cac8:	9282107c 	addls	r1, r2, #124	; 0x7c
    cacc:	83a04ffe 	movhi	r4, #1016	; 0x3f8
    cad0:	83a0107e 	movhi	r1, #126	; 0x7e
    cad4:	eaffff8e 	b	c914 <_free_r+0xf8>
    cad8:	e3832001 	orr	r2, r3, #1
    cadc:	e58c2004 	str	r2, [ip, #4]
    cae0:	e5803000 	str	r3, [r0]
    cae4:	eaffff7f 	b	c8e8 <_free_r+0xcc>
    cae8:	00010104 	.word	0x00010104
    caec:	0001010c 	.word	0x0001010c
    caf0:	00010510 	.word	0x00010510
    caf4:	0001056c 	.word	0x0001056c
    caf8:	00000554 	.word	0x00000554

0000cafc <__sfvwrite_r>:
    cafc:	e5923008 	ldr	r3, [r2, #8]
    cb00:	e3530000 	cmp	r3, #0
    cb04:	0a0000cb 	beq	ce38 <__sfvwrite_r+0x33c>
    cb08:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cb0c:	e1d130fc 	ldrsh	r3, [r1, #12]
    cb10:	e1a03803 	lsl	r3, r3, #16
    cb14:	e3130702 	tst	r3, #524288	; 0x80000
    cb18:	e24dd00c 	sub	sp, sp, #12
    cb1c:	e1a04001 	mov	r4, r1
    cb20:	e1a0b000 	mov	fp, r0
    cb24:	e1a06002 	mov	r6, r2
    cb28:	e1a0a823 	lsr	sl, r3, #16
    cb2c:	0a000020 	beq	cbb4 <__sfvwrite_r+0xb8>
    cb30:	e5912010 	ldr	r2, [r1, #16]
    cb34:	e3520000 	cmp	r2, #0
    cb38:	0a00001d 	beq	cbb4 <__sfvwrite_r+0xb8>
    cb3c:	e21a9002 	ands	r9, sl, #2
    cb40:	e5965000 	ldr	r5, [r6]
    cb44:	0a000025 	beq	cbe0 <__sfvwrite_r+0xe4>
    cb48:	e3a08000 	mov	r8, #0
    cb4c:	e1a07008 	mov	r7, r8
    cb50:	e59f947c 	ldr	r9, [pc, #1148]	; cfd4 <__sfvwrite_r+0x4d8>
    cb54:	e3570000 	cmp	r7, #0
    cb58:	0a00004a 	beq	cc88 <__sfvwrite_r+0x18c>
    cb5c:	e1570009 	cmp	r7, r9
    cb60:	31a03007 	movcc	r3, r7
    cb64:	21a03009 	movcs	r3, r9
    cb68:	e594a024 	ldr	sl, [r4, #36]	; 0x24
    cb6c:	e1a02008 	mov	r2, r8
    cb70:	e594101c 	ldr	r1, [r4, #28]
    cb74:	e1a0000b 	mov	r0, fp
    cb78:	e1a0e00f 	mov	lr, pc
    cb7c:	e12fff1a 	bx	sl
    cb80:	e3500000 	cmp	r0, #0
    cb84:	da000089 	ble	cdb0 <__sfvwrite_r+0x2b4>
    cb88:	e5963008 	ldr	r3, [r6, #8]
    cb8c:	e0433000 	sub	r3, r3, r0
    cb90:	e3530000 	cmp	r3, #0
    cb94:	e0888000 	add	r8, r8, r0
    cb98:	e0477000 	sub	r7, r7, r0
    cb9c:	e5863008 	str	r3, [r6, #8]
    cba0:	1affffeb 	bne	cb54 <__sfvwrite_r+0x58>
    cba4:	e3a00000 	mov	r0, #0
    cba8:	e28dd00c 	add	sp, sp, #12
    cbac:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cbb0:	e12fff1e 	bx	lr
    cbb4:	e1a01004 	mov	r1, r4
    cbb8:	e1a0000b 	mov	r0, fp
    cbbc:	ebfffc33 	bl	bc90 <__swsetup_r>
    cbc0:	e3500000 	cmp	r0, #0
    cbc4:	1a0000fc 	bne	cfbc <__sfvwrite_r+0x4c0>
    cbc8:	e1d430fc 	ldrsh	r3, [r4, #12]
    cbcc:	e1a03803 	lsl	r3, r3, #16
    cbd0:	e1a0a823 	lsr	sl, r3, #16
    cbd4:	e21a9002 	ands	r9, sl, #2
    cbd8:	e5965000 	ldr	r5, [r6]
    cbdc:	1affffd9 	bne	cb48 <__sfvwrite_r+0x4c>
    cbe0:	e21aa001 	ands	sl, sl, #1
    cbe4:	01a0900a 	moveq	r9, sl
    cbe8:	1a000094 	bne	ce40 <__sfvwrite_r+0x344>
    cbec:	e3590000 	cmp	r9, #0
    cbf0:	0a000020 	beq	cc78 <__sfvwrite_r+0x17c>
    cbf4:	e3130402 	tst	r3, #33554432	; 0x2000000
    cbf8:	e5947008 	ldr	r7, [r4, #8]
    cbfc:	e1a03823 	lsr	r3, r3, #16
    cc00:	0a000024 	beq	cc98 <__sfvwrite_r+0x19c>
    cc04:	e1590007 	cmp	r9, r7
    cc08:	e1a08007 	mov	r8, r7
    cc0c:	3a000037 	bcc	ccf0 <__sfvwrite_r+0x1f4>
    cc10:	e3130d12 	tst	r3, #1152	; 0x480
    cc14:	1a00003a 	bne	cd04 <__sfvwrite_r+0x208>
    cc18:	e1a03009 	mov	r3, r9
    cc1c:	e5940000 	ldr	r0, [r4]
    cc20:	e1a02008 	mov	r2, r8
    cc24:	e1a0100a 	mov	r1, sl
    cc28:	e58d3004 	str	r3, [sp, #4]
    cc2c:	ebfff652 	bl	a57c <memmove>
    cc30:	e5941008 	ldr	r1, [r4, #8]
    cc34:	e5942000 	ldr	r2, [r4]
    cc38:	e0417007 	sub	r7, r1, r7
    cc3c:	e0828008 	add	r8, r2, r8
    cc40:	e5847008 	str	r7, [r4, #8]
    cc44:	e5848000 	str	r8, [r4]
    cc48:	e59d3004 	ldr	r3, [sp, #4]
    cc4c:	e5962008 	ldr	r2, [r6, #8]
    cc50:	e0422003 	sub	r2, r2, r3
    cc54:	e3520000 	cmp	r2, #0
    cc58:	e08aa003 	add	sl, sl, r3
    cc5c:	e0499003 	sub	r9, r9, r3
    cc60:	e5862008 	str	r2, [r6, #8]
    cc64:	0affffce 	beq	cba4 <__sfvwrite_r+0xa8>
    cc68:	e1d430fc 	ldrsh	r3, [r4, #12]
    cc6c:	e3590000 	cmp	r9, #0
    cc70:	e1a03803 	lsl	r3, r3, #16
    cc74:	1affffde 	bne	cbf4 <__sfvwrite_r+0xf8>
    cc78:	e595a000 	ldr	sl, [r5]
    cc7c:	e5959004 	ldr	r9, [r5, #4]
    cc80:	e2855008 	add	r5, r5, #8
    cc84:	eaffffd8 	b	cbec <__sfvwrite_r+0xf0>
    cc88:	e5958000 	ldr	r8, [r5]
    cc8c:	e5957004 	ldr	r7, [r5, #4]
    cc90:	e2855008 	add	r5, r5, #8
    cc94:	eaffffae 	b	cb54 <__sfvwrite_r+0x58>
    cc98:	e5940000 	ldr	r0, [r4]
    cc9c:	e5943010 	ldr	r3, [r4, #16]
    cca0:	e1500003 	cmp	r0, r3
    cca4:	8a000002 	bhi	ccb4 <__sfvwrite_r+0x1b8>
    cca8:	e5948014 	ldr	r8, [r4, #20]
    ccac:	e1590008 	cmp	r9, r8
    ccb0:	2a000045 	bcs	cdcc <__sfvwrite_r+0x2d0>
    ccb4:	e1570009 	cmp	r7, r9
    ccb8:	21a07009 	movcs	r7, r9
    ccbc:	e1a0100a 	mov	r1, sl
    ccc0:	e1a02007 	mov	r2, r7
    ccc4:	ebfff62c 	bl	a57c <memmove>
    ccc8:	e5942008 	ldr	r2, [r4, #8]
    cccc:	e5943000 	ldr	r3, [r4]
    ccd0:	e0422007 	sub	r2, r2, r7
    ccd4:	e0833007 	add	r3, r3, r7
    ccd8:	e3520000 	cmp	r2, #0
    ccdc:	e5842008 	str	r2, [r4, #8]
    cce0:	e5843000 	str	r3, [r4]
    cce4:	0a00002c 	beq	cd9c <__sfvwrite_r+0x2a0>
    cce8:	e1a03007 	mov	r3, r7
    ccec:	eaffffd6 	b	cc4c <__sfvwrite_r+0x150>
    ccf0:	e1a07009 	mov	r7, r9
    ccf4:	e1a03009 	mov	r3, r9
    ccf8:	e1a08009 	mov	r8, r9
    ccfc:	e5940000 	ldr	r0, [r4]
    cd00:	eaffffc6 	b	cc20 <__sfvwrite_r+0x124>
    cd04:	e5941010 	ldr	r1, [r4, #16]
    cd08:	e5948000 	ldr	r8, [r4]
    cd0c:	e5942014 	ldr	r2, [r4, #20]
    cd10:	e0488001 	sub	r8, r8, r1
    cd14:	e0822082 	add	r2, r2, r2, lsl #1
    cd18:	e2887001 	add	r7, r8, #1
    cd1c:	e0822fa2 	add	r2, r2, r2, lsr #31
    cd20:	e0877009 	add	r7, r7, r9
    cd24:	e1a020c2 	asr	r2, r2, #1
    cd28:	e1570002 	cmp	r7, r2
    cd2c:	91a07002 	movls	r7, r2
    cd30:	81a02007 	movhi	r2, r7
    cd34:	e3130b01 	tst	r3, #1024	; 0x400
    cd38:	0a000032 	beq	ce08 <__sfvwrite_r+0x30c>
    cd3c:	e1a01002 	mov	r1, r2
    cd40:	e1a0000b 	mov	r0, fp
    cd44:	eb000191 	bl	d390 <_malloc_r>
    cd48:	e2503000 	subs	r3, r0, #0
    cd4c:	0a00009c 	beq	cfc4 <__sfvwrite_r+0x4c8>
    cd50:	e1a02008 	mov	r2, r8
    cd54:	e5941010 	ldr	r1, [r4, #16]
    cd58:	e58d3004 	str	r3, [sp, #4]
    cd5c:	ebfff5c1 	bl	a468 <memcpy>
    cd60:	e1d420bc 	ldrh	r2, [r4, #12]
    cd64:	e3c22d12 	bic	r2, r2, #1152	; 0x480
    cd68:	e3822080 	orr	r2, r2, #128	; 0x80
    cd6c:	e1c420bc 	strh	r2, [r4, #12]
    cd70:	e59d3004 	ldr	r3, [sp, #4]
    cd74:	e0830008 	add	r0, r3, r8
    cd78:	e0478008 	sub	r8, r7, r8
    cd7c:	e5843010 	str	r3, [r4, #16]
    cd80:	e5848008 	str	r8, [r4, #8]
    cd84:	e5847014 	str	r7, [r4, #20]
    cd88:	e5840000 	str	r0, [r4]
    cd8c:	e1a07009 	mov	r7, r9
    cd90:	e1a03009 	mov	r3, r9
    cd94:	e1a08009 	mov	r8, r9
    cd98:	eaffffa0 	b	cc20 <__sfvwrite_r+0x124>
    cd9c:	e1a01004 	mov	r1, r4
    cda0:	e1a0000b 	mov	r0, fp
    cda4:	ebfffca6 	bl	c044 <_fflush_r>
    cda8:	e3500000 	cmp	r0, #0
    cdac:	0affffcd 	beq	cce8 <__sfvwrite_r+0x1ec>
    cdb0:	e1d430fc 	ldrsh	r3, [r4, #12]
    cdb4:	e3e00000 	mvn	r0, #0
    cdb8:	e3833040 	orr	r3, r3, #64	; 0x40
    cdbc:	e1c430bc 	strh	r3, [r4, #12]
    cdc0:	e28dd00c 	add	sp, sp, #12
    cdc4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    cdc8:	e12fff1e 	bx	lr
    cdcc:	e3790106 	cmn	r9, #-2147483647	; 0x80000001
    cdd0:	31a00009 	movcc	r0, r9
    cdd4:	23e00102 	mvncs	r0, #-2147483648	; 0x80000000
    cdd8:	e1a01008 	mov	r1, r8
    cddc:	ebfff4fa 	bl	a1cc <__divsi3>
    cde0:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    cde4:	e0030098 	mul	r3, r8, r0
    cde8:	e1a0200a 	mov	r2, sl
    cdec:	e594101c 	ldr	r1, [r4, #28]
    cdf0:	e1a0000b 	mov	r0, fp
    cdf4:	e1a0e00f 	mov	lr, pc
    cdf8:	e12fff17 	bx	r7
    cdfc:	e2503000 	subs	r3, r0, #0
    ce00:	caffff91 	bgt	cc4c <__sfvwrite_r+0x150>
    ce04:	eaffffe9 	b	cdb0 <__sfvwrite_r+0x2b4>
    ce08:	e1a0000b 	mov	r0, fp
    ce0c:	eb0003b2 	bl	dcdc <_realloc_r>
    ce10:	e2503000 	subs	r3, r0, #0
    ce14:	1affffd6 	bne	cd74 <__sfvwrite_r+0x278>
    ce18:	e5941010 	ldr	r1, [r4, #16]
    ce1c:	e1a0000b 	mov	r0, fp
    ce20:	ebfffe7d 	bl	c81c <_free_r>
    ce24:	e3a0200c 	mov	r2, #12
    ce28:	e1d430fc 	ldrsh	r3, [r4, #12]
    ce2c:	e58b2000 	str	r2, [fp]
    ce30:	e3c33080 	bic	r3, r3, #128	; 0x80
    ce34:	eaffffde 	b	cdb4 <__sfvwrite_r+0x2b8>
    ce38:	e3a00000 	mov	r0, #0
    ce3c:	e12fff1e 	bx	lr
    ce40:	e1a00009 	mov	r0, r9
    ce44:	e1a0a009 	mov	sl, r9
    ce48:	e1a08009 	mov	r8, r9
    ce4c:	ea000026 	b	ceec <__sfvwrite_r+0x3f0>
    ce50:	e3500000 	cmp	r0, #0
    ce54:	0a00002d 	beq	cf10 <__sfvwrite_r+0x414>
    ce58:	e1590008 	cmp	r9, r8
    ce5c:	31a01009 	movcc	r1, r9
    ce60:	21a01008 	movcs	r1, r8
    ce64:	e5942010 	ldr	r2, [r4, #16]
    ce68:	e594c014 	ldr	ip, [r4, #20]
    ce6c:	e5943008 	ldr	r3, [r4, #8]
    ce70:	e5940000 	ldr	r0, [r4]
    ce74:	e08c3003 	add	r3, ip, r3
    ce78:	e1500002 	cmp	r0, r2
    ce7c:	93a02000 	movls	r2, #0
    ce80:	83a02001 	movhi	r2, #1
    ce84:	e1510003 	cmp	r1, r3
    ce88:	d3a02000 	movle	r2, #0
    ce8c:	e3520000 	cmp	r2, #0
    ce90:	e1a07001 	mov	r7, r1
    ce94:	1a000038 	bne	cf7c <__sfvwrite_r+0x480>
    ce98:	e151000c 	cmp	r1, ip
    ce9c:	ba000024 	blt	cf34 <__sfvwrite_r+0x438>
    cea0:	e5947024 	ldr	r7, [r4, #36]	; 0x24
    cea4:	e1a0300c 	mov	r3, ip
    cea8:	e1a0200a 	mov	r2, sl
    ceac:	e594101c 	ldr	r1, [r4, #28]
    ceb0:	e1a0000b 	mov	r0, fp
    ceb4:	e1a0e00f 	mov	lr, pc
    ceb8:	e12fff17 	bx	r7
    cebc:	e2507000 	subs	r7, r0, #0
    cec0:	daffffba 	ble	cdb0 <__sfvwrite_r+0x2b4>
    cec4:	e0599007 	subs	r9, r9, r7
    cec8:	13a00001 	movne	r0, #1
    cecc:	0a000024 	beq	cf64 <__sfvwrite_r+0x468>
    ced0:	e5963008 	ldr	r3, [r6, #8]
    ced4:	e0433007 	sub	r3, r3, r7
    ced8:	e3530000 	cmp	r3, #0
    cedc:	e08aa007 	add	sl, sl, r7
    cee0:	e0488007 	sub	r8, r8, r7
    cee4:	e5863008 	str	r3, [r6, #8]
    cee8:	0affff2d 	beq	cba4 <__sfvwrite_r+0xa8>
    ceec:	e3580000 	cmp	r8, #0
    cef0:	1affffd6 	bne	ce50 <__sfvwrite_r+0x354>
    cef4:	e2853008 	add	r3, r5, #8
    cef8:	e5138004 	ldr	r8, [r3, #-4]
    cefc:	e3580000 	cmp	r8, #0
    cf00:	e1a05003 	mov	r5, r3
    cf04:	e513a008 	ldr	sl, [r3, #-8]
    cf08:	e2833008 	add	r3, r3, #8
    cf0c:	0afffff9 	beq	cef8 <__sfvwrite_r+0x3fc>
    cf10:	e1a02008 	mov	r2, r8
    cf14:	e3a0100a 	mov	r1, #10
    cf18:	e1a0000a 	mov	r0, sl
    cf1c:	eb00031e 	bl	db9c <memchr>
    cf20:	e3500000 	cmp	r0, #0
    cf24:	12800001 	addne	r0, r0, #1
    cf28:	1040900a 	subne	r9, r0, sl
    cf2c:	02889001 	addeq	r9, r8, #1
    cf30:	eaffffc8 	b	ce58 <__sfvwrite_r+0x35c>
    cf34:	e1a02001 	mov	r2, r1
    cf38:	e1a0100a 	mov	r1, sl
    cf3c:	ebfff58e 	bl	a57c <memmove>
    cf40:	e5942008 	ldr	r2, [r4, #8]
    cf44:	e5943000 	ldr	r3, [r4]
    cf48:	e0422007 	sub	r2, r2, r7
    cf4c:	e0833007 	add	r3, r3, r7
    cf50:	e0599007 	subs	r9, r9, r7
    cf54:	e5842008 	str	r2, [r4, #8]
    cf58:	e5843000 	str	r3, [r4]
    cf5c:	13a00001 	movne	r0, #1
    cf60:	1affffda 	bne	ced0 <__sfvwrite_r+0x3d4>
    cf64:	e1a01004 	mov	r1, r4
    cf68:	e1a0000b 	mov	r0, fp
    cf6c:	ebfffc34 	bl	c044 <_fflush_r>
    cf70:	e3500000 	cmp	r0, #0
    cf74:	0affffd5 	beq	ced0 <__sfvwrite_r+0x3d4>
    cf78:	eaffff8c 	b	cdb0 <__sfvwrite_r+0x2b4>
    cf7c:	e1a02003 	mov	r2, r3
    cf80:	e1a0100a 	mov	r1, sl
    cf84:	e58d3004 	str	r3, [sp, #4]
    cf88:	ebfff57b 	bl	a57c <memmove>
    cf8c:	e5942000 	ldr	r2, [r4]
    cf90:	e59d3004 	ldr	r3, [sp, #4]
    cf94:	e0822003 	add	r2, r2, r3
    cf98:	e5842000 	str	r2, [r4]
    cf9c:	e1a01004 	mov	r1, r4
    cfa0:	e1a0000b 	mov	r0, fp
    cfa4:	ebfffc26 	bl	c044 <_fflush_r>
    cfa8:	e3500000 	cmp	r0, #0
    cfac:	e59d3004 	ldr	r3, [sp, #4]
    cfb0:	1affff7e 	bne	cdb0 <__sfvwrite_r+0x2b4>
    cfb4:	e1a07003 	mov	r7, r3
    cfb8:	eaffffc1 	b	cec4 <__sfvwrite_r+0x3c8>
    cfbc:	e3e00000 	mvn	r0, #0
    cfc0:	eafffef8 	b	cba8 <__sfvwrite_r+0xac>
    cfc4:	e3a0200c 	mov	r2, #12
    cfc8:	e1d430fc 	ldrsh	r3, [r4, #12]
    cfcc:	e58b2000 	str	r2, [fp]
    cfd0:	eaffff77 	b	cdb4 <__sfvwrite_r+0x2b8>
    cfd4:	7ffffc00 	.word	0x7ffffc00

0000cfd8 <_fwalk>:
    cfd8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    cfdc:	e2907e2e 	adds	r7, r0, #736	; 0x2e0
    cfe0:	0a000019 	beq	d04c <_fwalk+0x74>
    cfe4:	e1a08001 	mov	r8, r1
    cfe8:	e3a06000 	mov	r6, #0
    cfec:	e5975004 	ldr	r5, [r7, #4]
    cff0:	e2555001 	subs	r5, r5, #1
    cff4:	e5974008 	ldr	r4, [r7, #8]
    cff8:	4a00000d 	bmi	d034 <_fwalk+0x5c>
    cffc:	e1d430bc 	ldrh	r3, [r4, #12]
    d000:	e3530001 	cmp	r3, #1
    d004:	e2455001 	sub	r5, r5, #1
    d008:	9a000006 	bls	d028 <_fwalk+0x50>
    d00c:	e1d430fe 	ldrsh	r3, [r4, #14]
    d010:	e3730001 	cmn	r3, #1
    d014:	0a000003 	beq	d028 <_fwalk+0x50>
    d018:	e1a00004 	mov	r0, r4
    d01c:	e1a0e00f 	mov	lr, pc
    d020:	e12fff18 	bx	r8
    d024:	e1866000 	orr	r6, r6, r0
    d028:	e3750001 	cmn	r5, #1
    d02c:	e2844068 	add	r4, r4, #104	; 0x68
    d030:	1afffff1 	bne	cffc <_fwalk+0x24>
    d034:	e5977000 	ldr	r7, [r7]
    d038:	e3570000 	cmp	r7, #0
    d03c:	1affffea 	bne	cfec <_fwalk+0x14>
    d040:	e1a00006 	mov	r0, r6
    d044:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d048:	e12fff1e 	bx	lr
    d04c:	e1a06007 	mov	r6, r7
    d050:	e1a00006 	mov	r0, r6
    d054:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    d058:	e12fff1e 	bx	lr

0000d05c <_fwalk_reent>:
    d05c:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
    d060:	e2906e2e 	adds	r6, r0, #736	; 0x2e0
    d064:	0a00001b 	beq	d0d8 <_fwalk_reent+0x7c>
    d068:	e1a08001 	mov	r8, r1
    d06c:	e1a07000 	mov	r7, r0
    d070:	e3a09000 	mov	r9, #0
    d074:	e5965004 	ldr	r5, [r6, #4]
    d078:	e2555001 	subs	r5, r5, #1
    d07c:	e5964008 	ldr	r4, [r6, #8]
    d080:	4a00000e 	bmi	d0c0 <_fwalk_reent+0x64>
    d084:	e1d430bc 	ldrh	r3, [r4, #12]
    d088:	e3530001 	cmp	r3, #1
    d08c:	e2455001 	sub	r5, r5, #1
    d090:	9a000007 	bls	d0b4 <_fwalk_reent+0x58>
    d094:	e1d430fe 	ldrsh	r3, [r4, #14]
    d098:	e3730001 	cmn	r3, #1
    d09c:	0a000004 	beq	d0b4 <_fwalk_reent+0x58>
    d0a0:	e1a01004 	mov	r1, r4
    d0a4:	e1a00007 	mov	r0, r7
    d0a8:	e1a0e00f 	mov	lr, pc
    d0ac:	e12fff18 	bx	r8
    d0b0:	e1899000 	orr	r9, r9, r0
    d0b4:	e3750001 	cmn	r5, #1
    d0b8:	e2844068 	add	r4, r4, #104	; 0x68
    d0bc:	1afffff0 	bne	d084 <_fwalk_reent+0x28>
    d0c0:	e5966000 	ldr	r6, [r6]
    d0c4:	e3560000 	cmp	r6, #0
    d0c8:	1affffe9 	bne	d074 <_fwalk_reent+0x18>
    d0cc:	e1a00009 	mov	r0, r9
    d0d0:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    d0d4:	e12fff1e 	bx	lr
    d0d8:	e1a09006 	mov	r9, r6
    d0dc:	e1a00009 	mov	r0, r9
    d0e0:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
    d0e4:	e12fff1e 	bx	lr

0000d0e8 <_setlocale_r>:
    d0e8:	e92d4010 	push	{r4, lr}
    d0ec:	e2524000 	subs	r4, r2, #0
    d0f0:	0a000004 	beq	d108 <_setlocale_r+0x20>
    d0f4:	e59f1048 	ldr	r1, [pc, #72]	; d144 <_setlocale_r+0x5c>
    d0f8:	e1a00004 	mov	r0, r4
    d0fc:	eb000523 	bl	e590 <strcmp>
    d100:	e3500000 	cmp	r0, #0
    d104:	1a000002 	bne	d114 <_setlocale_r+0x2c>
    d108:	e59f0038 	ldr	r0, [pc, #56]	; d148 <_setlocale_r+0x60>
    d10c:	e8bd4010 	pop	{r4, lr}
    d110:	e12fff1e 	bx	lr
    d114:	e59f102c 	ldr	r1, [pc, #44]	; d148 <_setlocale_r+0x60>
    d118:	e1a00004 	mov	r0, r4
    d11c:	eb00051b 	bl	e590 <strcmp>
    d120:	e3500000 	cmp	r0, #0
    d124:	0afffff7 	beq	d108 <_setlocale_r+0x20>
    d128:	e1a00004 	mov	r0, r4
    d12c:	e59f1018 	ldr	r1, [pc, #24]	; d14c <_setlocale_r+0x64>
    d130:	eb000516 	bl	e590 <strcmp>
    d134:	e3500000 	cmp	r0, #0
    d138:	0afffff2 	beq	d108 <_setlocale_r+0x20>
    d13c:	e3a00000 	mov	r0, #0
    d140:	eafffff1 	b	d10c <_setlocale_r+0x24>
    d144:	0000f60c 	.word	0x0000f60c
    d148:	0000f608 	.word	0x0000f608
    d14c:	0000f580 	.word	0x0000f580

0000d150 <__locale_mb_cur_max>:
    d150:	e59f3018 	ldr	r3, [pc, #24]	; d170 <__locale_mb_cur_max+0x20>
    d154:	e5933000 	ldr	r3, [r3]
    d158:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    d15c:	e59f2010 	ldr	r2, [pc, #16]	; d174 <__locale_mb_cur_max+0x24>
    d160:	e3530000 	cmp	r3, #0
    d164:	01a03002 	moveq	r3, r2
    d168:	e5d30128 	ldrb	r0, [r3, #296]	; 0x128
    d16c:	e12fff1e 	bx	lr
    d170:	0000fb6c 	.word	0x0000fb6c
    d174:	0000ff98 	.word	0x0000ff98

0000d178 <__locale_ctype_ptr_l>:
    d178:	e59000ec 	ldr	r0, [r0, #236]	; 0xec
    d17c:	e12fff1e 	bx	lr

0000d180 <__locale_ctype_ptr>:
    d180:	e59f3018 	ldr	r3, [pc, #24]	; d1a0 <__locale_ctype_ptr+0x20>
    d184:	e5933000 	ldr	r3, [r3]
    d188:	e5933034 	ldr	r3, [r3, #52]	; 0x34
    d18c:	e59f2010 	ldr	r2, [pc, #16]	; d1a4 <__locale_ctype_ptr+0x24>
    d190:	e3530000 	cmp	r3, #0
    d194:	01a03002 	moveq	r3, r2
    d198:	e59300ec 	ldr	r0, [r3, #236]	; 0xec
    d19c:	e12fff1e 	bx	lr
    d1a0:	0000fb6c 	.word	0x0000fb6c
    d1a4:	0000ff98 	.word	0x0000ff98

0000d1a8 <setlocale>:
    d1a8:	e59f300c 	ldr	r3, [pc, #12]	; d1bc <setlocale+0x14>
    d1ac:	e1a02001 	mov	r2, r1
    d1b0:	e1a01000 	mov	r1, r0
    d1b4:	e5930000 	ldr	r0, [r3]
    d1b8:	eaffffca 	b	d0e8 <_setlocale_r>
    d1bc:	0000fb6c 	.word	0x0000fb6c

0000d1c0 <__retarget_lock_init>:
    d1c0:	e12fff1e 	bx	lr

0000d1c4 <__retarget_lock_init_recursive>:
    d1c4:	e12fff1e 	bx	lr

0000d1c8 <__retarget_lock_close>:
    d1c8:	e12fff1e 	bx	lr

0000d1cc <__retarget_lock_close_recursive>:
    d1cc:	e12fff1e 	bx	lr

0000d1d0 <__retarget_lock_acquire>:
    d1d0:	e12fff1e 	bx	lr

0000d1d4 <__retarget_lock_acquire_recursive>:
    d1d4:	e12fff1e 	bx	lr

0000d1d8 <__retarget_lock_try_acquire>:
    d1d8:	e3a00001 	mov	r0, #1
    d1dc:	e12fff1e 	bx	lr

0000d1e0 <__retarget_lock_try_acquire_recursive>:
    d1e0:	e3a00001 	mov	r0, #1
    d1e4:	e12fff1e 	bx	lr

0000d1e8 <__retarget_lock_release>:
    d1e8:	e12fff1e 	bx	lr

0000d1ec <__retarget_lock_release_recursive>:
    d1ec:	e12fff1e 	bx	lr

0000d1f0 <__swhatbuf_r>:
    d1f0:	e92d4070 	push	{r4, r5, r6, lr}
    d1f4:	e1a04001 	mov	r4, r1
    d1f8:	e1d110fe 	ldrsh	r1, [r1, #14]
    d1fc:	e3510000 	cmp	r1, #0
    d200:	e24dd040 	sub	sp, sp, #64	; 0x40
    d204:	e1a05002 	mov	r5, r2
    d208:	e1a06003 	mov	r6, r3
    d20c:	ba00000f 	blt	d250 <__swhatbuf_r+0x60>
    d210:	e28d2004 	add	r2, sp, #4
    d214:	eb0006b1 	bl	ece0 <_fstat_r>
    d218:	e3500000 	cmp	r0, #0
    d21c:	ba00000b 	blt	d250 <__swhatbuf_r+0x60>
    d220:	e59d2008 	ldr	r2, [sp, #8]
    d224:	e2022a0f 	and	r2, r2, #61440	; 0xf000
    d228:	e2423a02 	sub	r3, r2, #8192	; 0x2000
    d22c:	e2732000 	rsbs	r2, r3, #0
    d230:	e0a22003 	adc	r2, r2, r3
    d234:	e3a00b02 	mov	r0, #2048	; 0x800
    d238:	e3a03b01 	mov	r3, #1024	; 0x400
    d23c:	e5862000 	str	r2, [r6]
    d240:	e5853000 	str	r3, [r5]
    d244:	e28dd040 	add	sp, sp, #64	; 0x40
    d248:	e8bd4070 	pop	{r4, r5, r6, lr}
    d24c:	e12fff1e 	bx	lr
    d250:	e3a03000 	mov	r3, #0
    d254:	e1d420bc 	ldrh	r2, [r4, #12]
    d258:	e2120080 	ands	r0, r2, #128	; 0x80
    d25c:	e5863000 	str	r3, [r6]
    d260:	0a000005 	beq	d27c <__swhatbuf_r+0x8c>
    d264:	e3a02040 	mov	r2, #64	; 0x40
    d268:	e1a00003 	mov	r0, r3
    d26c:	e5852000 	str	r2, [r5]
    d270:	e28dd040 	add	sp, sp, #64	; 0x40
    d274:	e8bd4070 	pop	{r4, r5, r6, lr}
    d278:	e12fff1e 	bx	lr
    d27c:	e3a03b01 	mov	r3, #1024	; 0x400
    d280:	e5853000 	str	r3, [r5]
    d284:	e28dd040 	add	sp, sp, #64	; 0x40
    d288:	e8bd4070 	pop	{r4, r5, r6, lr}
    d28c:	e12fff1e 	bx	lr

0000d290 <__smakebuf_r>:
    d290:	e92d4070 	push	{r4, r5, r6, lr}
    d294:	e1d120bc 	ldrh	r2, [r1, #12]
    d298:	e3120002 	tst	r2, #2
    d29c:	e24dd008 	sub	sp, sp, #8
    d2a0:	e1a04001 	mov	r4, r1
    d2a4:	0a000007 	beq	d2c8 <__smakebuf_r+0x38>
    d2a8:	e3a01001 	mov	r1, #1
    d2ac:	e2842043 	add	r2, r4, #67	; 0x43
    d2b0:	e5841014 	str	r1, [r4, #20]
    d2b4:	e5842000 	str	r2, [r4]
    d2b8:	e5842010 	str	r2, [r4, #16]
    d2bc:	e28dd008 	add	sp, sp, #8
    d2c0:	e8bd4070 	pop	{r4, r5, r6, lr}
    d2c4:	e12fff1e 	bx	lr
    d2c8:	e28d3004 	add	r3, sp, #4
    d2cc:	e1a0200d 	mov	r2, sp
    d2d0:	e1a06000 	mov	r6, r0
    d2d4:	ebffffc5 	bl	d1f0 <__swhatbuf_r>
    d2d8:	e59d1000 	ldr	r1, [sp]
    d2dc:	e1a05000 	mov	r5, r0
    d2e0:	e1a00006 	mov	r0, r6
    d2e4:	eb000029 	bl	d390 <_malloc_r>
    d2e8:	e3500000 	cmp	r0, #0
    d2ec:	e1d430fc 	ldrsh	r3, [r4, #12]
    d2f0:	0a00001a 	beq	d360 <__smakebuf_r+0xd0>
    d2f4:	e59dc004 	ldr	ip, [sp, #4]
    d2f8:	e59f108c 	ldr	r1, [pc, #140]	; d38c <__smakebuf_r+0xfc>
    d2fc:	e59d2000 	ldr	r2, [sp]
    d300:	e3833080 	orr	r3, r3, #128	; 0x80
    d304:	e35c0000 	cmp	ip, #0
    d308:	e586103c 	str	r1, [r6, #60]	; 0x3c
    d30c:	e1c430bc 	strh	r3, [r4, #12]
    d310:	e5840000 	str	r0, [r4]
    d314:	e5840010 	str	r0, [r4, #16]
    d318:	e5842014 	str	r2, [r4, #20]
    d31c:	1a000004 	bne	d334 <__smakebuf_r+0xa4>
    d320:	e1833005 	orr	r3, r3, r5
    d324:	e1c430bc 	strh	r3, [r4, #12]
    d328:	e28dd008 	add	sp, sp, #8
    d32c:	e8bd4070 	pop	{r4, r5, r6, lr}
    d330:	e12fff1e 	bx	lr
    d334:	e1a00006 	mov	r0, r6
    d338:	e1d410fe 	ldrsh	r1, [r4, #14]
    d33c:	eb000678 	bl	ed24 <_isatty_r>
    d340:	e3500000 	cmp	r0, #0
    d344:	11d430bc 	ldrhne	r3, [r4, #12]
    d348:	13c33003 	bicne	r3, r3, #3
    d34c:	13833001 	orrne	r3, r3, #1
    d350:	11a03803 	lslne	r3, r3, #16
    d354:	01d430fc 	ldrsheq	r3, [r4, #12]
    d358:	11a03843 	asrne	r3, r3, #16
    d35c:	eaffffef 	b	d320 <__smakebuf_r+0x90>
    d360:	e3130c02 	tst	r3, #512	; 0x200
    d364:	1affffd4 	bne	d2bc <__smakebuf_r+0x2c>
    d368:	e3a01001 	mov	r1, #1
    d36c:	e3c33003 	bic	r3, r3, #3
    d370:	e2842043 	add	r2, r4, #67	; 0x43
    d374:	e3833002 	orr	r3, r3, #2
    d378:	e1c430bc 	strh	r3, [r4, #12]
    d37c:	e5841014 	str	r1, [r4, #20]
    d380:	e5842000 	str	r2, [r4]
    d384:	e5842010 	str	r2, [r4, #16]
    d388:	eaffffcb 	b	d2bc <__smakebuf_r+0x2c>
    d38c:	0000c118 	.word	0x0000c118

0000d390 <_malloc_r>:
    d390:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d394:	e281600b 	add	r6, r1, #11
    d398:	e3560016 	cmp	r6, #22
    d39c:	e24dd00c 	sub	sp, sp, #12
    d3a0:	e1a05000 	mov	r5, r0
    d3a4:	9a000072 	bls	d574 <_malloc_r+0x1e4>
    d3a8:	e3c66007 	bic	r6, r6, #7
    d3ac:	e1510006 	cmp	r1, r6
    d3b0:	93a01000 	movls	r1, #0
    d3b4:	83a01001 	movhi	r1, #1
    d3b8:	e1913fa6 	orrs	r3, r1, r6, lsr #31
    d3bc:	1a000089 	bne	d5e8 <_malloc_r+0x258>
    d3c0:	eb000239 	bl	dcac <__malloc_lock>
    d3c4:	e3560f7e 	cmp	r6, #504	; 0x1f8
    d3c8:	3a0001c8 	bcc	daf0 <_malloc_r+0x760>
    d3cc:	e1b034a6 	lsrs	r3, r6, #9
    d3d0:	0a00008b 	beq	d604 <_malloc_r+0x274>
    d3d4:	e3530004 	cmp	r3, #4
    d3d8:	8a0000d6 	bhi	d738 <_malloc_r+0x3a8>
    d3dc:	e1a03326 	lsr	r3, r6, #6
    d3e0:	e2830039 	add	r0, r3, #57	; 0x39
    d3e4:	e283c038 	add	ip, r3, #56	; 0x38
    d3e8:	e1a01180 	lsl	r1, r0, #3
    d3ec:	e59f7708 	ldr	r7, [pc, #1800]	; dafc <_malloc_r+0x76c>
    d3f0:	e0871001 	add	r1, r7, r1
    d3f4:	e5914004 	ldr	r4, [r1, #4]
    d3f8:	e2411008 	sub	r1, r1, #8
    d3fc:	e1510004 	cmp	r1, r4
    d400:	1a000005 	bne	d41c <_malloc_r+0x8c>
    d404:	ea00000a 	b	d434 <_malloc_r+0xa4>
    d408:	e3520000 	cmp	r2, #0
    d40c:	aa000066 	bge	d5ac <_malloc_r+0x21c>
    d410:	e594400c 	ldr	r4, [r4, #12]
    d414:	e1510004 	cmp	r1, r4
    d418:	0a000005 	beq	d434 <_malloc_r+0xa4>
    d41c:	e5943004 	ldr	r3, [r4, #4]
    d420:	e3c33003 	bic	r3, r3, #3
    d424:	e0432006 	sub	r2, r3, r6
    d428:	e352000f 	cmp	r2, #15
    d42c:	dafffff5 	ble	d408 <_malloc_r+0x78>
    d430:	e1a0000c 	mov	r0, ip
    d434:	e5974010 	ldr	r4, [r7, #16]
    d438:	e59fc6c0 	ldr	ip, [pc, #1728]	; db00 <_malloc_r+0x770>
    d43c:	e154000c 	cmp	r4, ip
    d440:	05973004 	ldreq	r3, [r7, #4]
    d444:	0a000018 	beq	d4ac <_malloc_r+0x11c>
    d448:	e5943004 	ldr	r3, [r4, #4]
    d44c:	e3c33003 	bic	r3, r3, #3
    d450:	e0432006 	sub	r2, r3, r6
    d454:	e352000f 	cmp	r2, #15
    d458:	ca0000da 	bgt	d7c8 <_malloc_r+0x438>
    d45c:	e3520000 	cmp	r2, #0
    d460:	e587c014 	str	ip, [r7, #20]
    d464:	e587c010 	str	ip, [r7, #16]
    d468:	aa000069 	bge	d614 <_malloc_r+0x284>
    d46c:	e3530c02 	cmp	r3, #512	; 0x200
    d470:	2a0000b9 	bcs	d75c <_malloc_r+0x3cc>
    d474:	e3a08001 	mov	r8, #1
    d478:	e5972004 	ldr	r2, [r7, #4]
    d47c:	e1a031a3 	lsr	r3, r3, #3
    d480:	e0831008 	add	r1, r3, r8
    d484:	e1a03143 	asr	r3, r3, #2
    d488:	e1823318 	orr	r3, r2, r8, lsl r3
    d48c:	e087e181 	add	lr, r7, r1, lsl #3
    d490:	e7978181 	ldr	r8, [r7, r1, lsl #3]
    d494:	e24e2008 	sub	r2, lr, #8
    d498:	e584200c 	str	r2, [r4, #12]
    d49c:	e5848008 	str	r8, [r4, #8]
    d4a0:	e5873004 	str	r3, [r7, #4]
    d4a4:	e7874181 	str	r4, [r7, r1, lsl #3]
    d4a8:	e588400c 	str	r4, [r8, #12]
    d4ac:	e3a01001 	mov	r1, #1
    d4b0:	e1a02140 	asr	r2, r0, #2
    d4b4:	e1a0e211 	lsl	lr, r1, r2
    d4b8:	e15e0003 	cmp	lr, r3
    d4bc:	8a00005f 	bhi	d640 <_malloc_r+0x2b0>
    d4c0:	e11e0003 	tst	lr, r3
    d4c4:	1a000008 	bne	d4ec <_malloc_r+0x15c>
    d4c8:	e1a0e11e 	lsl	lr, lr, r1
    d4cc:	e3c00003 	bic	r0, r0, #3
    d4d0:	e11e0003 	tst	lr, r3
    d4d4:	e2800004 	add	r0, r0, #4
    d4d8:	1a000003 	bne	d4ec <_malloc_r+0x15c>
    d4dc:	e1a0e08e 	lsl	lr, lr, #1
    d4e0:	e11e0003 	tst	lr, r3
    d4e4:	e2800004 	add	r0, r0, #4
    d4e8:	0afffffb 	beq	d4dc <_malloc_r+0x14c>
    d4ec:	e0879180 	add	r9, r7, r0, lsl #3
    d4f0:	e1a01009 	mov	r1, r9
    d4f4:	e1a04000 	mov	r4, r0
    d4f8:	e591800c 	ldr	r8, [r1, #12]
    d4fc:	e1510008 	cmp	r1, r8
    d500:	1a000005 	bne	d51c <_malloc_r+0x18c>
    d504:	ea0000bc 	b	d7fc <_malloc_r+0x46c>
    d508:	e3520000 	cmp	r2, #0
    d50c:	aa0000c4 	bge	d824 <_malloc_r+0x494>
    d510:	e598800c 	ldr	r8, [r8, #12]
    d514:	e1510008 	cmp	r1, r8
    d518:	0a0000b7 	beq	d7fc <_malloc_r+0x46c>
    d51c:	e5983004 	ldr	r3, [r8, #4]
    d520:	e3c33003 	bic	r3, r3, #3
    d524:	e0432006 	sub	r2, r3, r6
    d528:	e352000f 	cmp	r2, #15
    d52c:	dafffff5 	ble	d508 <_malloc_r+0x178>
    d530:	e598100c 	ldr	r1, [r8, #12]
    d534:	e598e008 	ldr	lr, [r8, #8]
    d538:	e3864001 	orr	r4, r6, #1
    d53c:	e5884004 	str	r4, [r8, #4]
    d540:	e0886006 	add	r6, r8, r6
    d544:	e3824001 	orr	r4, r2, #1
    d548:	e58e100c 	str	r1, [lr, #12]
    d54c:	e1a00005 	mov	r0, r5
    d550:	e581e008 	str	lr, [r1, #8]
    d554:	e5876014 	str	r6, [r7, #20]
    d558:	e5876010 	str	r6, [r7, #16]
    d55c:	e9861010 	stmib	r6, {r4, ip}
    d560:	e586c00c 	str	ip, [r6, #12]
    d564:	e7882003 	str	r2, [r8, r3]
    d568:	eb0001d5 	bl	dcc4 <__malloc_unlock>
    d56c:	e2884008 	add	r4, r8, #8
    d570:	ea000018 	b	d5d8 <_malloc_r+0x248>
    d574:	e3510010 	cmp	r1, #16
    d578:	8a00001a 	bhi	d5e8 <_malloc_r+0x258>
    d57c:	eb0001ca 	bl	dcac <__malloc_lock>
    d580:	e3a06010 	mov	r6, #16
    d584:	e3a03018 	mov	r3, #24
    d588:	e3a00002 	mov	r0, #2
    d58c:	e59f7568 	ldr	r7, [pc, #1384]	; dafc <_malloc_r+0x76c>
    d590:	e0873003 	add	r3, r7, r3
    d594:	e5934004 	ldr	r4, [r3, #4]
    d598:	e2432008 	sub	r2, r3, #8
    d59c:	e1540002 	cmp	r4, r2
    d5a0:	0a00009a 	beq	d810 <_malloc_r+0x480>
    d5a4:	e5943004 	ldr	r3, [r4, #4]
    d5a8:	e3c33003 	bic	r3, r3, #3
    d5ac:	e0843003 	add	r3, r4, r3
    d5b0:	e5932004 	ldr	r2, [r3, #4]
    d5b4:	e594100c 	ldr	r1, [r4, #12]
    d5b8:	e594c008 	ldr	ip, [r4, #8]
    d5bc:	e3822001 	orr	r2, r2, #1
    d5c0:	e58c100c 	str	r1, [ip, #12]
    d5c4:	e1a00005 	mov	r0, r5
    d5c8:	e581c008 	str	ip, [r1, #8]
    d5cc:	e5832004 	str	r2, [r3, #4]
    d5d0:	eb0001bb 	bl	dcc4 <__malloc_unlock>
    d5d4:	e2844008 	add	r4, r4, #8
    d5d8:	e1a00004 	mov	r0, r4
    d5dc:	e28dd00c 	add	sp, sp, #12
    d5e0:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d5e4:	e12fff1e 	bx	lr
    d5e8:	e3a04000 	mov	r4, #0
    d5ec:	e3a0300c 	mov	r3, #12
    d5f0:	e1a00004 	mov	r0, r4
    d5f4:	e5853000 	str	r3, [r5]
    d5f8:	e28dd00c 	add	sp, sp, #12
    d5fc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d600:	e12fff1e 	bx	lr
    d604:	e3a01c02 	mov	r1, #512	; 0x200
    d608:	e3a00040 	mov	r0, #64	; 0x40
    d60c:	e3a0c03f 	mov	ip, #63	; 0x3f
    d610:	eaffff75 	b	d3ec <_malloc_r+0x5c>
    d614:	e0843003 	add	r3, r4, r3
    d618:	e5932004 	ldr	r2, [r3, #4]
    d61c:	e3822001 	orr	r2, r2, #1
    d620:	e1a00005 	mov	r0, r5
    d624:	e5832004 	str	r2, [r3, #4]
    d628:	e2844008 	add	r4, r4, #8
    d62c:	eb0001a4 	bl	dcc4 <__malloc_unlock>
    d630:	e1a00004 	mov	r0, r4
    d634:	e28dd00c 	add	sp, sp, #12
    d638:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d63c:	e12fff1e 	bx	lr
    d640:	e5974008 	ldr	r4, [r7, #8]
    d644:	e5943004 	ldr	r3, [r4, #4]
    d648:	e3c39003 	bic	r9, r3, #3
    d64c:	e0493006 	sub	r3, r9, r6
    d650:	e353000f 	cmp	r3, #15
    d654:	c3a02000 	movgt	r2, #0
    d658:	d3a02001 	movle	r2, #1
    d65c:	e1590006 	cmp	r9, r6
    d660:	33822001 	orrcc	r2, r2, #1
    d664:	e3520000 	cmp	r2, #0
    d668:	0a000025 	beq	d704 <_malloc_r+0x374>
    d66c:	e59fa490 	ldr	sl, [pc, #1168]	; db04 <_malloc_r+0x774>
    d670:	e59f2490 	ldr	r2, [pc, #1168]	; db08 <_malloc_r+0x778>
    d674:	e59a3000 	ldr	r3, [sl]
    d678:	e5922000 	ldr	r2, [r2]
    d67c:	e3730001 	cmn	r3, #1
    d680:	e0862002 	add	r2, r6, r2
    d684:	12823a01 	addne	r3, r2, #4096	; 0x1000
    d688:	1283300f 	addne	r3, r3, #15
    d68c:	13c32eff 	bicne	r2, r3, #4080	; 0xff0
    d690:	02822010 	addeq	r2, r2, #16
    d694:	13c2200f 	bicne	r2, r2, #15
    d698:	e1a01002 	mov	r1, r2
    d69c:	e1a00005 	mov	r0, r5
    d6a0:	e58d2004 	str	r2, [sp, #4]
    d6a4:	eb0002c1 	bl	e1b0 <_sbrk_r>
    d6a8:	e3700001 	cmn	r0, #1
    d6ac:	e1a0b000 	mov	fp, r0
    d6b0:	e59d2004 	ldr	r2, [sp, #4]
    d6b4:	0a000003 	beq	d6c8 <_malloc_r+0x338>
    d6b8:	e0843009 	add	r3, r4, r9
    d6bc:	e1540007 	cmp	r4, r7
    d6c0:	11530000 	cmpne	r3, r0
    d6c4:	9a000084 	bls	d8dc <_malloc_r+0x54c>
    d6c8:	e5974008 	ldr	r4, [r7, #8]
    d6cc:	e5943004 	ldr	r3, [r4, #4]
    d6d0:	e3c33003 	bic	r3, r3, #3
    d6d4:	e1560003 	cmp	r6, r3
    d6d8:	93a02000 	movls	r2, #0
    d6dc:	83a02001 	movhi	r2, #1
    d6e0:	e0433006 	sub	r3, r3, r6
    d6e4:	e353000f 	cmp	r3, #15
    d6e8:	d3822001 	orrle	r2, r2, #1
    d6ec:	e3520000 	cmp	r2, #0
    d6f0:	0a000003 	beq	d704 <_malloc_r+0x374>
    d6f4:	e1a00005 	mov	r0, r5
    d6f8:	eb000171 	bl	dcc4 <__malloc_unlock>
    d6fc:	e3a04000 	mov	r4, #0
    d700:	eaffffb4 	b	d5d8 <_malloc_r+0x248>
    d704:	e3862001 	orr	r2, r6, #1
    d708:	e3833001 	orr	r3, r3, #1
    d70c:	e0846006 	add	r6, r4, r6
    d710:	e5842004 	str	r2, [r4, #4]
    d714:	e1a00005 	mov	r0, r5
    d718:	e5876008 	str	r6, [r7, #8]
    d71c:	e2844008 	add	r4, r4, #8
    d720:	e5863004 	str	r3, [r6, #4]
    d724:	eb000166 	bl	dcc4 <__malloc_unlock>
    d728:	e1a00004 	mov	r0, r4
    d72c:	e28dd00c 	add	sp, sp, #12
    d730:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    d734:	e12fff1e 	bx	lr
    d738:	e3530014 	cmp	r3, #20
    d73c:	9a000044 	bls	d854 <_malloc_r+0x4c4>
    d740:	e3530054 	cmp	r3, #84	; 0x54
    d744:	8a0000a8 	bhi	d9ec <_malloc_r+0x65c>
    d748:	e1a03626 	lsr	r3, r6, #12
    d74c:	e283006f 	add	r0, r3, #111	; 0x6f
    d750:	e283c06e 	add	ip, r3, #110	; 0x6e
    d754:	e1a01180 	lsl	r1, r0, #3
    d758:	eaffff23 	b	d3ec <_malloc_r+0x5c>
    d75c:	e1a024a3 	lsr	r2, r3, #9
    d760:	e3520004 	cmp	r2, #4
    d764:	9a00003e 	bls	d864 <_malloc_r+0x4d4>
    d768:	e3520014 	cmp	r2, #20
    d76c:	8a0000b4 	bhi	da44 <_malloc_r+0x6b4>
    d770:	e282805c 	add	r8, r2, #92	; 0x5c
    d774:	e1a08188 	lsl	r8, r8, #3
    d778:	e282105b 	add	r1, r2, #91	; 0x5b
    d77c:	e087e008 	add	lr, r7, r8
    d780:	e7972008 	ldr	r2, [r7, r8]
    d784:	e24ee008 	sub	lr, lr, #8
    d788:	e15e0002 	cmp	lr, r2
    d78c:	0a00009d 	beq	da08 <_malloc_r+0x678>
    d790:	e5921004 	ldr	r1, [r2, #4]
    d794:	e3c11003 	bic	r1, r1, #3
    d798:	e1530001 	cmp	r3, r1
    d79c:	2a000090 	bcs	d9e4 <_malloc_r+0x654>
    d7a0:	e5922008 	ldr	r2, [r2, #8]
    d7a4:	e15e0002 	cmp	lr, r2
    d7a8:	1afffff8 	bne	d790 <_malloc_r+0x400>
    d7ac:	e59e200c 	ldr	r2, [lr, #12]
    d7b0:	e5973004 	ldr	r3, [r7, #4]
    d7b4:	e584200c 	str	r2, [r4, #12]
    d7b8:	e584e008 	str	lr, [r4, #8]
    d7bc:	e5824008 	str	r4, [r2, #8]
    d7c0:	e58e400c 	str	r4, [lr, #12]
    d7c4:	eaffff38 	b	d4ac <_malloc_r+0x11c>
    d7c8:	e386e001 	orr	lr, r6, #1
    d7cc:	e3821001 	orr	r1, r2, #1
    d7d0:	e0846006 	add	r6, r4, r6
    d7d4:	e584e004 	str	lr, [r4, #4]
    d7d8:	e1a00005 	mov	r0, r5
    d7dc:	e5876014 	str	r6, [r7, #20]
    d7e0:	e5876010 	str	r6, [r7, #16]
    d7e4:	e586c00c 	str	ip, [r6, #12]
    d7e8:	e9861002 	stmib	r6, {r1, ip}
    d7ec:	e7842003 	str	r2, [r4, r3]
    d7f0:	eb000133 	bl	dcc4 <__malloc_unlock>
    d7f4:	e2844008 	add	r4, r4, #8
    d7f8:	eaffff76 	b	d5d8 <_malloc_r+0x248>
    d7fc:	e2844001 	add	r4, r4, #1
    d800:	e3140003 	tst	r4, #3
    d804:	e2811008 	add	r1, r1, #8
    d808:	1affff3a 	bne	d4f8 <_malloc_r+0x168>
    d80c:	ea00001d 	b	d888 <_malloc_r+0x4f8>
    d810:	e593400c 	ldr	r4, [r3, #12]
    d814:	e1530004 	cmp	r3, r4
    d818:	02800002 	addeq	r0, r0, #2
    d81c:	0affff04 	beq	d434 <_malloc_r+0xa4>
    d820:	eaffff5f 	b	d5a4 <_malloc_r+0x214>
    d824:	e1a04008 	mov	r4, r8
    d828:	e0883003 	add	r3, r8, r3
    d82c:	e5932004 	ldr	r2, [r3, #4]
    d830:	e598100c 	ldr	r1, [r8, #12]
    d834:	e5b4c008 	ldr	ip, [r4, #8]!
    d838:	e3822001 	orr	r2, r2, #1
    d83c:	e5832004 	str	r2, [r3, #4]
    d840:	e1a00005 	mov	r0, r5
    d844:	e58c100c 	str	r1, [ip, #12]
    d848:	e581c008 	str	ip, [r1, #8]
    d84c:	eb00011c 	bl	dcc4 <__malloc_unlock>
    d850:	eaffff60 	b	d5d8 <_malloc_r+0x248>
    d854:	e283005c 	add	r0, r3, #92	; 0x5c
    d858:	e283c05b 	add	ip, r3, #91	; 0x5b
    d85c:	e1a01180 	lsl	r1, r0, #3
    d860:	eafffee1 	b	d3ec <_malloc_r+0x5c>
    d864:	e1a02323 	lsr	r2, r3, #6
    d868:	e2828039 	add	r8, r2, #57	; 0x39
    d86c:	e1a08188 	lsl	r8, r8, #3
    d870:	e2821038 	add	r1, r2, #56	; 0x38
    d874:	eaffffc0 	b	d77c <_malloc_r+0x3ec>
    d878:	e4193008 	ldr	r3, [r9], #-8
    d87c:	e1590003 	cmp	r9, r3
    d880:	e2400001 	sub	r0, r0, #1
    d884:	1a000097 	bne	dae8 <_malloc_r+0x758>
    d888:	e3100003 	tst	r0, #3
    d88c:	1afffff9 	bne	d878 <_malloc_r+0x4e8>
    d890:	e5973004 	ldr	r3, [r7, #4]
    d894:	e1c3300e 	bic	r3, r3, lr
    d898:	e5873004 	str	r3, [r7, #4]
    d89c:	e1b0e08e 	lsls	lr, lr, #1
    d8a0:	13a02001 	movne	r2, #1
    d8a4:	03a02000 	moveq	r2, #0
    d8a8:	e15e0003 	cmp	lr, r3
    d8ac:	83a02000 	movhi	r2, #0
    d8b0:	92022001 	andls	r2, r2, #1
    d8b4:	e3520000 	cmp	r2, #0
    d8b8:	0affff60 	beq	d640 <_malloc_r+0x2b0>
    d8bc:	e11e0003 	tst	lr, r3
    d8c0:	e1a00004 	mov	r0, r4
    d8c4:	1affff08 	bne	d4ec <_malloc_r+0x15c>
    d8c8:	e1a0e08e 	lsl	lr, lr, #1
    d8cc:	e11e0003 	tst	lr, r3
    d8d0:	e2800004 	add	r0, r0, #4
    d8d4:	0afffffb 	beq	d8c8 <_malloc_r+0x538>
    d8d8:	eaffff03 	b	d4ec <_malloc_r+0x15c>
    d8dc:	e59f8228 	ldr	r8, [pc, #552]	; db0c <_malloc_r+0x77c>
    d8e0:	e5981000 	ldr	r1, [r8]
    d8e4:	e1530000 	cmp	r3, r0
    d8e8:	e0821001 	add	r1, r2, r1
    d8ec:	e5881000 	str	r1, [r8]
    d8f0:	0a00005e 	beq	da70 <_malloc_r+0x6e0>
    d8f4:	e59a0000 	ldr	r0, [sl]
    d8f8:	e3700001 	cmn	r0, #1
    d8fc:	104b3003 	subne	r3, fp, r3
    d900:	10831001 	addne	r1, r3, r1
    d904:	058ab000 	streq	fp, [sl]
    d908:	15881000 	strne	r1, [r8]
    d90c:	e21b1007 	ands	r1, fp, #7
    d910:	03a01a01 	moveq	r1, #4096	; 0x1000
    d914:	12613008 	rsbne	r3, r1, #8
    d918:	108bb003 	addne	fp, fp, r3
    d91c:	e08b2002 	add	r2, fp, r2
    d920:	12611a01 	rsbne	r1, r1, #4096	; 0x1000
    d924:	e1a02a02 	lsl	r2, r2, #20
    d928:	12811008 	addne	r1, r1, #8
    d92c:	e1a02a22 	lsr	r2, r2, #20
    d930:	e041a002 	sub	sl, r1, r2
    d934:	e1a0100a 	mov	r1, sl
    d938:	e1a00005 	mov	r0, r5
    d93c:	eb00021b 	bl	e1b0 <_sbrk_r>
    d940:	e3700001 	cmn	r0, #1
    d944:	03a0a000 	moveq	sl, #0
    d948:	03a03001 	moveq	r3, #1
    d94c:	1040300b 	subne	r3, r0, fp
    d950:	e5981000 	ldr	r1, [r8]
    d954:	1083300a 	addne	r3, r3, sl
    d958:	13833001 	orrne	r3, r3, #1
    d95c:	e08a1001 	add	r1, sl, r1
    d960:	e1540007 	cmp	r4, r7
    d964:	e587b008 	str	fp, [r7, #8]
    d968:	e5881000 	str	r1, [r8]
    d96c:	e58b3004 	str	r3, [fp, #4]
    d970:	0a00000f 	beq	d9b4 <_malloc_r+0x624>
    d974:	e359000f 	cmp	r9, #15
    d978:	93a03001 	movls	r3, #1
    d97c:	958b3004 	strls	r3, [fp, #4]
    d980:	9affff5b 	bls	d6f4 <_malloc_r+0x364>
    d984:	e3a00005 	mov	r0, #5
    d988:	e5942004 	ldr	r2, [r4, #4]
    d98c:	e249300c 	sub	r3, r9, #12
    d990:	e3c33007 	bic	r3, r3, #7
    d994:	e2022001 	and	r2, r2, #1
    d998:	e1822003 	orr	r2, r2, r3
    d99c:	e353000f 	cmp	r3, #15
    d9a0:	e0843003 	add	r3, r4, r3
    d9a4:	e5842004 	str	r2, [r4, #4]
    d9a8:	e5830004 	str	r0, [r3, #4]
    d9ac:	e5830008 	str	r0, [r3, #8]
    d9b0:	8a000037 	bhi	da94 <_malloc_r+0x704>
    d9b4:	e59f3154 	ldr	r3, [pc, #340]	; db10 <_malloc_r+0x780>
    d9b8:	e5932000 	ldr	r2, [r3]
    d9bc:	e1510002 	cmp	r1, r2
    d9c0:	e59f214c 	ldr	r2, [pc, #332]	; db14 <_malloc_r+0x784>
    d9c4:	85831000 	strhi	r1, [r3]
    d9c8:	e5974008 	ldr	r4, [r7, #8]
    d9cc:	e5923000 	ldr	r3, [r2]
    d9d0:	e1510003 	cmp	r1, r3
    d9d4:	e5943004 	ldr	r3, [r4, #4]
    d9d8:	85821000 	strhi	r1, [r2]
    d9dc:	e3c33003 	bic	r3, r3, #3
    d9e0:	eaffff3b 	b	d6d4 <_malloc_r+0x344>
    d9e4:	e1a0e002 	mov	lr, r2
    d9e8:	eaffff6f 	b	d7ac <_malloc_r+0x41c>
    d9ec:	e3530f55 	cmp	r3, #340	; 0x154
    d9f0:	8a00000b 	bhi	da24 <_malloc_r+0x694>
    d9f4:	e1a037a6 	lsr	r3, r6, #15
    d9f8:	e2830078 	add	r0, r3, #120	; 0x78
    d9fc:	e283c077 	add	ip, r3, #119	; 0x77
    da00:	e1a01180 	lsl	r1, r0, #3
    da04:	eafffe78 	b	d3ec <_malloc_r+0x5c>
    da08:	e3a08001 	mov	r8, #1
    da0c:	e5973004 	ldr	r3, [r7, #4]
    da10:	e1a02141 	asr	r2, r1, #2
    da14:	e1833218 	orr	r3, r3, r8, lsl r2
    da18:	e5873004 	str	r3, [r7, #4]
    da1c:	e1a0200e 	mov	r2, lr
    da20:	eaffff63 	b	d7b4 <_malloc_r+0x424>
    da24:	e59f20ec 	ldr	r2, [pc, #236]	; db18 <_malloc_r+0x788>
    da28:	e1530002 	cmp	r3, r2
    da2c:	8a00000b 	bhi	da60 <_malloc_r+0x6d0>
    da30:	e1a03926 	lsr	r3, r6, #18
    da34:	e283007d 	add	r0, r3, #125	; 0x7d
    da38:	e283c07c 	add	ip, r3, #124	; 0x7c
    da3c:	e1a01180 	lsl	r1, r0, #3
    da40:	eafffe69 	b	d3ec <_malloc_r+0x5c>
    da44:	e3520054 	cmp	r2, #84	; 0x54
    da48:	8a000016 	bhi	daa8 <_malloc_r+0x718>
    da4c:	e1a02623 	lsr	r2, r3, #12
    da50:	e282806f 	add	r8, r2, #111	; 0x6f
    da54:	e1a08188 	lsl	r8, r8, #3
    da58:	e282106e 	add	r1, r2, #110	; 0x6e
    da5c:	eaffff46 	b	d77c <_malloc_r+0x3ec>
    da60:	e3a01ffe 	mov	r1, #1016	; 0x3f8
    da64:	e3a0007f 	mov	r0, #127	; 0x7f
    da68:	e3a0c07e 	mov	ip, #126	; 0x7e
    da6c:	eafffe5e 	b	d3ec <_malloc_r+0x5c>
    da70:	e1a00a03 	lsl	r0, r3, #20
    da74:	e1a00a20 	lsr	r0, r0, #20
    da78:	e3500000 	cmp	r0, #0
    da7c:	1affff9c 	bne	d8f4 <_malloc_r+0x564>
    da80:	e0893002 	add	r3, r9, r2
    da84:	e5972008 	ldr	r2, [r7, #8]
    da88:	e3833001 	orr	r3, r3, #1
    da8c:	e5823004 	str	r3, [r2, #4]
    da90:	eaffffc7 	b	d9b4 <_malloc_r+0x624>
    da94:	e2841008 	add	r1, r4, #8
    da98:	e1a00005 	mov	r0, r5
    da9c:	ebfffb5e 	bl	c81c <_free_r>
    daa0:	e5981000 	ldr	r1, [r8]
    daa4:	eaffffc2 	b	d9b4 <_malloc_r+0x624>
    daa8:	e3520f55 	cmp	r2, #340	; 0x154
    daac:	8a000004 	bhi	dac4 <_malloc_r+0x734>
    dab0:	e1a027a3 	lsr	r2, r3, #15
    dab4:	e2828078 	add	r8, r2, #120	; 0x78
    dab8:	e1a08188 	lsl	r8, r8, #3
    dabc:	e2821077 	add	r1, r2, #119	; 0x77
    dac0:	eaffff2d 	b	d77c <_malloc_r+0x3ec>
    dac4:	e59f104c 	ldr	r1, [pc, #76]	; db18 <_malloc_r+0x788>
    dac8:	e1520001 	cmp	r2, r1
    dacc:	91a02923 	lsrls	r2, r3, #18
    dad0:	9282807d 	addls	r8, r2, #125	; 0x7d
    dad4:	91a08188 	lslls	r8, r8, #3
    dad8:	9282107c 	addls	r1, r2, #124	; 0x7c
    dadc:	83a08ffe 	movhi	r8, #1016	; 0x3f8
    dae0:	83a0107e 	movhi	r1, #126	; 0x7e
    dae4:	eaffff24 	b	d77c <_malloc_r+0x3ec>
    dae8:	e5973004 	ldr	r3, [r7, #4]
    daec:	eaffff6a 	b	d89c <_malloc_r+0x50c>
    daf0:	e1a001a6 	lsr	r0, r6, #3
    daf4:	e2863008 	add	r3, r6, #8
    daf8:	eafffea3 	b	d58c <_malloc_r+0x1fc>
    dafc:	00010104 	.word	0x00010104
    db00:	0001010c 	.word	0x0001010c
    db04:	0001050c 	.word	0x0001050c
    db08:	0001056c 	.word	0x0001056c
    db0c:	0001053c 	.word	0x0001053c
    db10:	00010564 	.word	0x00010564
    db14:	00010568 	.word	0x00010568
    db18:	00000554 	.word	0x00000554

0000db1c <_mbtowc_r>:
    db1c:	e59fc024 	ldr	ip, [pc, #36]	; db48 <_mbtowc_r+0x2c>
    db20:	e59cc000 	ldr	ip, [ip]
    db24:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    db28:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    db2c:	e59fe018 	ldr	lr, [pc, #24]	; db4c <_mbtowc_r+0x30>
    db30:	e35c0000 	cmp	ip, #0
    db34:	01a0c00e 	moveq	ip, lr
    db38:	e59ce0e4 	ldr	lr, [ip, #228]	; 0xe4
    db3c:	e1a0c00e 	mov	ip, lr
    db40:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    db44:	e12fff1c 	bx	ip
    db48:	0000fb6c 	.word	0x0000fb6c
    db4c:	0000ff98 	.word	0x0000ff98

0000db50 <__ascii_mbtowc>:
    db50:	e3510000 	cmp	r1, #0
    db54:	e24dd008 	sub	sp, sp, #8
    db58:	028d1004 	addeq	r1, sp, #4
    db5c:	e3520000 	cmp	r2, #0
    db60:	0a000008 	beq	db88 <__ascii_mbtowc+0x38>
    db64:	e3530000 	cmp	r3, #0
    db68:	0a000009 	beq	db94 <__ascii_mbtowc+0x44>
    db6c:	e5d23000 	ldrb	r3, [r2]
    db70:	e5813000 	str	r3, [r1]
    db74:	e5d22000 	ldrb	r2, [r2]
    db78:	e2920000 	adds	r0, r2, #0
    db7c:	13a00001 	movne	r0, #1
    db80:	e28dd008 	add	sp, sp, #8
    db84:	e12fff1e 	bx	lr
    db88:	e1a00002 	mov	r0, r2
    db8c:	e28dd008 	add	sp, sp, #8
    db90:	e12fff1e 	bx	lr
    db94:	e3e00001 	mvn	r0, #1
    db98:	eafffff8 	b	db80 <__ascii_mbtowc+0x30>

0000db9c <memchr>:
    db9c:	e3100003 	tst	r0, #3
    dba0:	e92d4070 	push	{r4, r5, r6, lr}
    dba4:	e201e0ff 	and	lr, r1, #255	; 0xff
    dba8:	0a000038 	beq	dc90 <memchr+0xf4>
    dbac:	e3520000 	cmp	r2, #0
    dbb0:	e242c001 	sub	ip, r2, #1
    dbb4:	0a00001e 	beq	dc34 <memchr+0x98>
    dbb8:	e5d03000 	ldrb	r3, [r0]
    dbbc:	e153000e 	cmp	r3, lr
    dbc0:	0a00001c 	beq	dc38 <memchr+0x9c>
    dbc4:	e2803001 	add	r3, r0, #1
    dbc8:	ea000005 	b	dbe4 <memchr+0x48>
    dbcc:	e25cc001 	subs	ip, ip, #1
    dbd0:	3a000017 	bcc	dc34 <memchr+0x98>
    dbd4:	e5d02000 	ldrb	r2, [r0]
    dbd8:	e152000e 	cmp	r2, lr
    dbdc:	e2833001 	add	r3, r3, #1
    dbe0:	0a000014 	beq	dc38 <memchr+0x9c>
    dbe4:	e3130003 	tst	r3, #3
    dbe8:	e1a00003 	mov	r0, r3
    dbec:	1afffff6 	bne	dbcc <memchr+0x30>
    dbf0:	e35c0003 	cmp	ip, #3
    dbf4:	8a000011 	bhi	dc40 <memchr+0xa4>
    dbf8:	e35c0000 	cmp	ip, #0
    dbfc:	0a000025 	beq	dc98 <memchr+0xfc>
    dc00:	e5d03000 	ldrb	r3, [r0]
    dc04:	e153000e 	cmp	r3, lr
    dc08:	0a00000a 	beq	dc38 <memchr+0x9c>
    dc0c:	e080c00c 	add	ip, r0, ip
    dc10:	e2803001 	add	r3, r0, #1
    dc14:	ea000003 	b	dc28 <memchr+0x8c>
    dc18:	e5d02000 	ldrb	r2, [r0]
    dc1c:	e152000e 	cmp	r2, lr
    dc20:	e2833001 	add	r3, r3, #1
    dc24:	0a000003 	beq	dc38 <memchr+0x9c>
    dc28:	e15c0003 	cmp	ip, r3
    dc2c:	e1a00003 	mov	r0, r3
    dc30:	1afffff8 	bne	dc18 <memchr+0x7c>
    dc34:	e3a00000 	mov	r0, #0
    dc38:	e8bd4070 	pop	{r4, r5, r6, lr}
    dc3c:	e12fff1e 	bx	lr
    dc40:	e59f4058 	ldr	r4, [pc, #88]	; dca0 <memchr+0x104>
    dc44:	e0044401 	and	r4, r4, r1, lsl #8
    dc48:	e184400e 	orr	r4, r4, lr
    dc4c:	e59f6050 	ldr	r6, [pc, #80]	; dca4 <memchr+0x108>
    dc50:	e59f5050 	ldr	r5, [pc, #80]	; dca8 <memchr+0x10c>
    dc54:	e1844804 	orr	r4, r4, r4, lsl #16
    dc58:	e5903000 	ldr	r3, [r0]
    dc5c:	e0233004 	eor	r3, r3, r4
    dc60:	e0832006 	add	r2, r3, r6
    dc64:	e1c23003 	bic	r3, r2, r3
    dc68:	e1130005 	tst	r3, r5
    dc6c:	e1a01000 	mov	r1, r0
    dc70:	e2800004 	add	r0, r0, #4
    dc74:	1a000003 	bne	dc88 <memchr+0xec>
    dc78:	e24cc004 	sub	ip, ip, #4
    dc7c:	e35c0003 	cmp	ip, #3
    dc80:	8afffff4 	bhi	dc58 <memchr+0xbc>
    dc84:	eaffffdb 	b	dbf8 <memchr+0x5c>
    dc88:	e1a00001 	mov	r0, r1
    dc8c:	eaffffdb 	b	dc00 <memchr+0x64>
    dc90:	e1a0c002 	mov	ip, r2
    dc94:	eaffffd5 	b	dbf0 <memchr+0x54>
    dc98:	e1a0000c 	mov	r0, ip
    dc9c:	eaffffe5 	b	dc38 <memchr+0x9c>
    dca0:	0000ffff 	.word	0x0000ffff
    dca4:	fefefeff 	.word	0xfefefeff
    dca8:	80808080 	.word	0x80808080

0000dcac <__malloc_lock>:
    dcac:	e92d4010 	push	{r4, lr}
    dcb0:	e59f0008 	ldr	r0, [pc, #8]	; dcc0 <__malloc_lock+0x14>
    dcb4:	ebfffd46 	bl	d1d4 <__retarget_lock_acquire_recursive>
    dcb8:	e8bd4010 	pop	{r4, lr}
    dcbc:	e12fff1e 	bx	lr
    dcc0:	00010584 	.word	0x00010584

0000dcc4 <__malloc_unlock>:
    dcc4:	e92d4010 	push	{r4, lr}
    dcc8:	e59f0008 	ldr	r0, [pc, #8]	; dcd8 <__malloc_unlock+0x14>
    dccc:	ebfffd46 	bl	d1ec <__retarget_lock_release_recursive>
    dcd0:	e8bd4010 	pop	{r4, lr}
    dcd4:	e12fff1e 	bx	lr
    dcd8:	00010584 	.word	0x00010584

0000dcdc <_realloc_r>:
    dcdc:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    dce0:	e2517000 	subs	r7, r1, #0
    dce4:	e24dd00c 	sub	sp, sp, #12
    dce8:	e1a09002 	mov	r9, r2
    dcec:	0a00007f 	beq	def0 <_realloc_r+0x214>
    dcf0:	e289400b 	add	r4, r9, #11
    dcf4:	e1a08000 	mov	r8, r0
    dcf8:	ebffffeb 	bl	dcac <__malloc_lock>
    dcfc:	e3540016 	cmp	r4, #22
    dd00:	93a02010 	movls	r2, #16
    dd04:	93a03000 	movls	r3, #0
    dd08:	91a04002 	movls	r4, r2
    dd0c:	83c44007 	bichi	r4, r4, #7
    dd10:	81a03fa4 	lsrhi	r3, r4, #31
    dd14:	81a02004 	movhi	r2, r4
    dd18:	e1540009 	cmp	r4, r9
    dd1c:	33833001 	orrcc	r3, r3, #1
    dd20:	e3530000 	cmp	r3, #0
    dd24:	13a0300c 	movne	r3, #12
    dd28:	e5171004 	ldr	r1, [r7, #-4]
    dd2c:	e2475008 	sub	r5, r7, #8
    dd30:	e3c16003 	bic	r6, r1, #3
    dd34:	13a09000 	movne	r9, #0
    dd38:	15883000 	strne	r3, [r8]
    dd3c:	1a00000f 	bne	dd80 <_realloc_r+0xa4>
    dd40:	e1560002 	cmp	r6, r2
    dd44:	ba000011 	blt	dd90 <_realloc_r+0xb4>
    dd48:	e1a09007 	mov	r9, r7
    dd4c:	e0463004 	sub	r3, r6, r4
    dd50:	e353000f 	cmp	r3, #15
    dd54:	8a000056 	bhi	deb4 <_realloc_r+0x1d8>
    dd58:	e5953004 	ldr	r3, [r5, #4]
    dd5c:	e2033001 	and	r3, r3, #1
    dd60:	e1833006 	orr	r3, r3, r6
    dd64:	e5853004 	str	r3, [r5, #4]
    dd68:	e0855006 	add	r5, r5, r6
    dd6c:	e5953004 	ldr	r3, [r5, #4]
    dd70:	e3833001 	orr	r3, r3, #1
    dd74:	e5853004 	str	r3, [r5, #4]
    dd78:	e1a00008 	mov	r0, r8
    dd7c:	ebffffd0 	bl	dcc4 <__malloc_unlock>
    dd80:	e1a00009 	mov	r0, r9
    dd84:	e28dd00c 	add	sp, sp, #12
    dd88:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    dd8c:	e12fff1e 	bx	lr
    dd90:	e59fb414 	ldr	fp, [pc, #1044]	; e1ac <_realloc_r+0x4d0>
    dd94:	e59b3008 	ldr	r3, [fp, #8]
    dd98:	e085c006 	add	ip, r5, r6
    dd9c:	e15c0003 	cmp	ip, r3
    dda0:	0a0000a5 	beq	e03c <_realloc_r+0x360>
    dda4:	e59c0004 	ldr	r0, [ip, #4]
    dda8:	e3c03001 	bic	r3, r0, #1
    ddac:	e08c3003 	add	r3, ip, r3
    ddb0:	e5933004 	ldr	r3, [r3, #4]
    ddb4:	e3130001 	tst	r3, #1
    ddb8:	0a000032 	beq	de88 <_realloc_r+0x1ac>
    ddbc:	e3110001 	tst	r1, #1
    ddc0:	0a000088 	beq	dfe8 <_realloc_r+0x30c>
    ddc4:	e1a01009 	mov	r1, r9
    ddc8:	e1a00008 	mov	r0, r8
    ddcc:	ebfffd6f 	bl	d390 <_malloc_r>
    ddd0:	e2509000 	subs	r9, r0, #0
    ddd4:	0affffe7 	beq	dd78 <_realloc_r+0x9c>
    ddd8:	e5173004 	ldr	r3, [r7, #-4]
    dddc:	e3c33001 	bic	r3, r3, #1
    dde0:	e0853003 	add	r3, r5, r3
    dde4:	e2492008 	sub	r2, r9, #8
    dde8:	e1520003 	cmp	r2, r3
    ddec:	0a0000e3 	beq	e180 <_realloc_r+0x4a4>
    ddf0:	e2462004 	sub	r2, r6, #4
    ddf4:	e3520024 	cmp	r2, #36	; 0x24
    ddf8:	8a0000dd 	bhi	e174 <_realloc_r+0x498>
    ddfc:	e3520013 	cmp	r2, #19
    de00:	91a03009 	movls	r3, r9
    de04:	91a02007 	movls	r2, r7
    de08:	9a000014 	bls	de60 <_realloc_r+0x184>
    de0c:	e5973000 	ldr	r3, [r7]
    de10:	e5893000 	str	r3, [r9]
    de14:	e5973004 	ldr	r3, [r7, #4]
    de18:	e352001b 	cmp	r2, #27
    de1c:	e5893004 	str	r3, [r9, #4]
    de20:	92872008 	addls	r2, r7, #8
    de24:	92893008 	addls	r3, r9, #8
    de28:	9a00000c 	bls	de60 <_realloc_r+0x184>
    de2c:	e5973008 	ldr	r3, [r7, #8]
    de30:	e5893008 	str	r3, [r9, #8]
    de34:	e597300c 	ldr	r3, [r7, #12]
    de38:	e589300c 	str	r3, [r9, #12]
    de3c:	e3520024 	cmp	r2, #36	; 0x24
    de40:	05973010 	ldreq	r3, [r7, #16]
    de44:	05893010 	streq	r3, [r9, #16]
    de48:	05972014 	ldreq	r2, [r7, #20]
    de4c:	12893010 	addne	r3, r9, #16
    de50:	05892014 	streq	r2, [r9, #20]
    de54:	12872010 	addne	r2, r7, #16
    de58:	02893018 	addeq	r3, r9, #24
    de5c:	02872018 	addeq	r2, r7, #24
    de60:	e5921000 	ldr	r1, [r2]
    de64:	e5831000 	str	r1, [r3]
    de68:	e5921004 	ldr	r1, [r2, #4]
    de6c:	e5831004 	str	r1, [r3, #4]
    de70:	e5922008 	ldr	r2, [r2, #8]
    de74:	e5832008 	str	r2, [r3, #8]
    de78:	e1a01007 	mov	r1, r7
    de7c:	e1a00008 	mov	r0, r8
    de80:	ebfffa65 	bl	c81c <_free_r>
    de84:	eaffffbb 	b	dd78 <_realloc_r+0x9c>
    de88:	e3c00003 	bic	r0, r0, #3
    de8c:	e0863000 	add	r3, r6, r0
    de90:	e1530002 	cmp	r3, r2
    de94:	ba00001c 	blt	df0c <_realloc_r+0x230>
    de98:	e28c1008 	add	r1, ip, #8
    de9c:	e8910006 	ldm	r1, {r1, r2}
    dea0:	e1a09007 	mov	r9, r7
    dea4:	e581200c 	str	r2, [r1, #12]
    dea8:	e1a06003 	mov	r6, r3
    deac:	e5821008 	str	r1, [r2, #8]
    deb0:	eaffffa5 	b	dd4c <_realloc_r+0x70>
    deb4:	e5952004 	ldr	r2, [r5, #4]
    deb8:	e2022001 	and	r2, r2, #1
    debc:	e0851004 	add	r1, r5, r4
    dec0:	e3833001 	orr	r3, r3, #1
    dec4:	e1822004 	orr	r2, r2, r4
    dec8:	e5852004 	str	r2, [r5, #4]
    decc:	e5813004 	str	r3, [r1, #4]
    ded0:	e0855006 	add	r5, r5, r6
    ded4:	e5953004 	ldr	r3, [r5, #4]
    ded8:	e3833001 	orr	r3, r3, #1
    dedc:	e2811008 	add	r1, r1, #8
    dee0:	e5853004 	str	r3, [r5, #4]
    dee4:	e1a00008 	mov	r0, r8
    dee8:	ebfffa4b 	bl	c81c <_free_r>
    deec:	eaffffa1 	b	dd78 <_realloc_r+0x9c>
    def0:	e1a01002 	mov	r1, r2
    def4:	ebfffd25 	bl	d390 <_malloc_r>
    def8:	e1a09000 	mov	r9, r0
    defc:	e1a00009 	mov	r0, r9
    df00:	e28dd00c 	add	sp, sp, #12
    df04:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    df08:	e12fff1e 	bx	lr
    df0c:	e3110001 	tst	r1, #1
    df10:	1affffab 	bne	ddc4 <_realloc_r+0xe8>
    df14:	e517a008 	ldr	sl, [r7, #-8]
    df18:	e045a00a 	sub	sl, r5, sl
    df1c:	e59a1004 	ldr	r1, [sl, #4]
    df20:	e3c11003 	bic	r1, r1, #3
    df24:	e0810000 	add	r0, r1, r0
    df28:	e0803006 	add	r3, r0, r6
    df2c:	e1530002 	cmp	r3, r2
    df30:	ba000030 	blt	dff8 <_realloc_r+0x31c>
    df34:	e1a0900a 	mov	r9, sl
    df38:	e28c1008 	add	r1, ip, #8
    df3c:	e8910006 	ldm	r1, {r1, r2}
    df40:	e581200c 	str	r2, [r1, #12]
    df44:	e5821008 	str	r1, [r2, #8]
    df48:	e59a100c 	ldr	r1, [sl, #12]
    df4c:	e5b90008 	ldr	r0, [r9, #8]!
    df50:	e2462004 	sub	r2, r6, #4
    df54:	e3520024 	cmp	r2, #36	; 0x24
    df58:	e580100c 	str	r1, [r0, #12]
    df5c:	e5810008 	str	r0, [r1, #8]
    df60:	8a00002f 	bhi	e024 <_realloc_r+0x348>
    df64:	e3520013 	cmp	r2, #19
    df68:	91a02009 	movls	r2, r9
    df6c:	9a000014 	bls	dfc4 <_realloc_r+0x2e8>
    df70:	e5971000 	ldr	r1, [r7]
    df74:	e58a1008 	str	r1, [sl, #8]
    df78:	e5971004 	ldr	r1, [r7, #4]
    df7c:	e352001b 	cmp	r2, #27
    df80:	e58a100c 	str	r1, [sl, #12]
    df84:	92877008 	addls	r7, r7, #8
    df88:	928a2010 	addls	r2, sl, #16
    df8c:	9a00000c 	bls	dfc4 <_realloc_r+0x2e8>
    df90:	e5971008 	ldr	r1, [r7, #8]
    df94:	e58a1010 	str	r1, [sl, #16]
    df98:	e597100c 	ldr	r1, [r7, #12]
    df9c:	e58a1014 	str	r1, [sl, #20]
    dfa0:	e3520024 	cmp	r2, #36	; 0x24
    dfa4:	05972010 	ldreq	r2, [r7, #16]
    dfa8:	058a2018 	streq	r2, [sl, #24]
    dfac:	05972014 	ldreq	r2, [r7, #20]
    dfb0:	12877010 	addne	r7, r7, #16
    dfb4:	058a201c 	streq	r2, [sl, #28]
    dfb8:	128a2018 	addne	r2, sl, #24
    dfbc:	02877018 	addeq	r7, r7, #24
    dfc0:	028a2020 	addeq	r2, sl, #32
    dfc4:	e5971000 	ldr	r1, [r7]
    dfc8:	e5821000 	str	r1, [r2]
    dfcc:	e5971004 	ldr	r1, [r7, #4]
    dfd0:	e5821004 	str	r1, [r2, #4]
    dfd4:	e5971008 	ldr	r1, [r7, #8]
    dfd8:	e1a06003 	mov	r6, r3
    dfdc:	e1a0500a 	mov	r5, sl
    dfe0:	e5821008 	str	r1, [r2, #8]
    dfe4:	eaffff58 	b	dd4c <_realloc_r+0x70>
    dfe8:	e517a008 	ldr	sl, [r7, #-8]
    dfec:	e045a00a 	sub	sl, r5, sl
    dff0:	e59a1004 	ldr	r1, [sl, #4]
    dff4:	e3c11003 	bic	r1, r1, #3
    dff8:	e0863001 	add	r3, r6, r1
    dffc:	e1530002 	cmp	r3, r2
    e000:	baffff6f 	blt	ddc4 <_realloc_r+0xe8>
    e004:	e1a0900a 	mov	r9, sl
    e008:	e59a100c 	ldr	r1, [sl, #12]
    e00c:	e5b90008 	ldr	r0, [r9, #8]!
    e010:	e2462004 	sub	r2, r6, #4
    e014:	e3520024 	cmp	r2, #36	; 0x24
    e018:	e580100c 	str	r1, [r0, #12]
    e01c:	e5810008 	str	r0, [r1, #8]
    e020:	9affffcf 	bls	df64 <_realloc_r+0x288>
    e024:	e1a01007 	mov	r1, r7
    e028:	e1a00009 	mov	r0, r9
    e02c:	e1a06003 	mov	r6, r3
    e030:	e1a0500a 	mov	r5, sl
    e034:	ebfff150 	bl	a57c <memmove>
    e038:	eaffff43 	b	dd4c <_realloc_r+0x70>
    e03c:	e59c3004 	ldr	r3, [ip, #4]
    e040:	e3c33003 	bic	r3, r3, #3
    e044:	e0833006 	add	r3, r3, r6
    e048:	e2840010 	add	r0, r4, #16
    e04c:	e1530000 	cmp	r3, r0
    e050:	aa00003a 	bge	e140 <_realloc_r+0x464>
    e054:	e3110001 	tst	r1, #1
    e058:	1affff59 	bne	ddc4 <_realloc_r+0xe8>
    e05c:	e517a008 	ldr	sl, [r7, #-8]
    e060:	e045a00a 	sub	sl, r5, sl
    e064:	e59a1004 	ldr	r1, [sl, #4]
    e068:	e3c11003 	bic	r1, r1, #3
    e06c:	e0813003 	add	r3, r1, r3
    e070:	e1500003 	cmp	r0, r3
    e074:	caffffdf 	bgt	dff8 <_realloc_r+0x31c>
    e078:	e1a0900a 	mov	r9, sl
    e07c:	e59a100c 	ldr	r1, [sl, #12]
    e080:	e5b90008 	ldr	r0, [r9, #8]!
    e084:	e2462004 	sub	r2, r6, #4
    e088:	e3520024 	cmp	r2, #36	; 0x24
    e08c:	e580100c 	str	r1, [r0, #12]
    e090:	e5810008 	str	r0, [r1, #8]
    e094:	8a00003e 	bhi	e194 <_realloc_r+0x4b8>
    e098:	e3520013 	cmp	r2, #19
    e09c:	91a02009 	movls	r2, r9
    e0a0:	9a000014 	bls	e0f8 <_realloc_r+0x41c>
    e0a4:	e5971000 	ldr	r1, [r7]
    e0a8:	e58a1008 	str	r1, [sl, #8]
    e0ac:	e5971004 	ldr	r1, [r7, #4]
    e0b0:	e352001b 	cmp	r2, #27
    e0b4:	e58a100c 	str	r1, [sl, #12]
    e0b8:	92877008 	addls	r7, r7, #8
    e0bc:	928a2010 	addls	r2, sl, #16
    e0c0:	9a00000c 	bls	e0f8 <_realloc_r+0x41c>
    e0c4:	e5971008 	ldr	r1, [r7, #8]
    e0c8:	e58a1010 	str	r1, [sl, #16]
    e0cc:	e597100c 	ldr	r1, [r7, #12]
    e0d0:	e58a1014 	str	r1, [sl, #20]
    e0d4:	e3520024 	cmp	r2, #36	; 0x24
    e0d8:	05972010 	ldreq	r2, [r7, #16]
    e0dc:	058a2018 	streq	r2, [sl, #24]
    e0e0:	05972014 	ldreq	r2, [r7, #20]
    e0e4:	12877010 	addne	r7, r7, #16
    e0e8:	058a201c 	streq	r2, [sl, #28]
    e0ec:	128a2018 	addne	r2, sl, #24
    e0f0:	02877018 	addeq	r7, r7, #24
    e0f4:	028a2020 	addeq	r2, sl, #32
    e0f8:	e5971000 	ldr	r1, [r7]
    e0fc:	e5821000 	str	r1, [r2]
    e100:	e5971004 	ldr	r1, [r7, #4]
    e104:	e5821004 	str	r1, [r2, #4]
    e108:	e5971008 	ldr	r1, [r7, #8]
    e10c:	e5821008 	str	r1, [r2, #8]
    e110:	e0433004 	sub	r3, r3, r4
    e114:	e08a2004 	add	r2, sl, r4
    e118:	e3833001 	orr	r3, r3, #1
    e11c:	e58b2008 	str	r2, [fp, #8]
    e120:	e5823004 	str	r3, [r2, #4]
    e124:	e59a3004 	ldr	r3, [sl, #4]
    e128:	e2033001 	and	r3, r3, #1
    e12c:	e1834004 	orr	r4, r3, r4
    e130:	e1a00008 	mov	r0, r8
    e134:	e58a4004 	str	r4, [sl, #4]
    e138:	ebfffee1 	bl	dcc4 <__malloc_unlock>
    e13c:	eaffff0f 	b	dd80 <_realloc_r+0xa4>
    e140:	e0433004 	sub	r3, r3, r4
    e144:	e0855004 	add	r5, r5, r4
    e148:	e3833001 	orr	r3, r3, #1
    e14c:	e58b5008 	str	r5, [fp, #8]
    e150:	e5853004 	str	r3, [r5, #4]
    e154:	e5173004 	ldr	r3, [r7, #-4]
    e158:	e2033001 	and	r3, r3, #1
    e15c:	e1834004 	orr	r4, r3, r4
    e160:	e1a00008 	mov	r0, r8
    e164:	e5074004 	str	r4, [r7, #-4]
    e168:	ebfffed5 	bl	dcc4 <__malloc_unlock>
    e16c:	e1a09007 	mov	r9, r7
    e170:	eaffff02 	b	dd80 <_realloc_r+0xa4>
    e174:	e1a01007 	mov	r1, r7
    e178:	ebfff0ff 	bl	a57c <memmove>
    e17c:	eaffff3d 	b	de78 <_realloc_r+0x19c>
    e180:	e5193004 	ldr	r3, [r9, #-4]
    e184:	e3c33003 	bic	r3, r3, #3
    e188:	e0866003 	add	r6, r6, r3
    e18c:	e1a09007 	mov	r9, r7
    e190:	eafffeed 	b	dd4c <_realloc_r+0x70>
    e194:	e1a01007 	mov	r1, r7
    e198:	e1a00009 	mov	r0, r9
    e19c:	e58d3004 	str	r3, [sp, #4]
    e1a0:	ebfff0f5 	bl	a57c <memmove>
    e1a4:	e59d3004 	ldr	r3, [sp, #4]
    e1a8:	eaffffd8 	b	e110 <_realloc_r+0x434>
    e1ac:	00010104 	.word	0x00010104

0000e1b0 <_sbrk_r>:
    e1b0:	e3a03000 	mov	r3, #0
    e1b4:	e92d4070 	push	{r4, r5, r6, lr}
    e1b8:	e59f4030 	ldr	r4, [pc, #48]	; e1f0 <_sbrk_r+0x40>
    e1bc:	e1a05000 	mov	r5, r0
    e1c0:	e1a00001 	mov	r0, r1
    e1c4:	e5843000 	str	r3, [r4]
    e1c8:	eb0003f0 	bl	f190 <_sbrk>
    e1cc:	e3700001 	cmn	r0, #1
    e1d0:	0a000001 	beq	e1dc <_sbrk_r+0x2c>
    e1d4:	e8bd4070 	pop	{r4, r5, r6, lr}
    e1d8:	e12fff1e 	bx	lr
    e1dc:	e5943000 	ldr	r3, [r4]
    e1e0:	e3530000 	cmp	r3, #0
    e1e4:	15853000 	strne	r3, [r5]
    e1e8:	e8bd4070 	pop	{r4, r5, r6, lr}
    e1ec:	e12fff1e 	bx	lr
    e1f0:	00010598 	.word	0x00010598

0000e1f4 <_init_signal_r.part.0>:
    e1f4:	e92d4010 	push	{r4, lr}
    e1f8:	e3a01080 	mov	r1, #128	; 0x80
    e1fc:	e1a04000 	mov	r4, r0
    e200:	ebfffc62 	bl	d390 <_malloc_r>
    e204:	e3500000 	cmp	r0, #0
    e208:	e58402dc 	str	r0, [r4, #732]	; 0x2dc
    e20c:	0a000008 	beq	e234 <_init_signal_r.part.0+0x40>
    e210:	e3a02000 	mov	r2, #0
    e214:	e2403004 	sub	r3, r0, #4
    e218:	e280007c 	add	r0, r0, #124	; 0x7c
    e21c:	e5a32004 	str	r2, [r3, #4]!
    e220:	e1530000 	cmp	r3, r0
    e224:	1afffffc 	bne	e21c <_init_signal_r.part.0+0x28>
    e228:	e3a00000 	mov	r0, #0
    e22c:	e8bd4010 	pop	{r4, lr}
    e230:	e12fff1e 	bx	lr
    e234:	e3e00000 	mvn	r0, #0
    e238:	eafffffb 	b	e22c <_init_signal_r.part.0+0x38>

0000e23c <_init_signal_r>:
    e23c:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    e240:	e3530000 	cmp	r3, #0
    e244:	0a000001 	beq	e250 <_init_signal_r+0x14>
    e248:	e3a00000 	mov	r0, #0
    e24c:	e12fff1e 	bx	lr
    e250:	eaffffe7 	b	e1f4 <_init_signal_r.part.0>

0000e254 <_signal_r>:
    e254:	e351001f 	cmp	r1, #31
    e258:	e1a03000 	mov	r3, r0
    e25c:	8a000005 	bhi	e278 <_signal_r+0x24>
    e260:	e590c2dc 	ldr	ip, [r0, #732]	; 0x2dc
    e264:	e35c0000 	cmp	ip, #0
    e268:	0a000006 	beq	e288 <_signal_r+0x34>
    e26c:	e79c0101 	ldr	r0, [ip, r1, lsl #2]
    e270:	e78c2101 	str	r2, [ip, r1, lsl #2]
    e274:	e12fff1e 	bx	lr
    e278:	e3a02016 	mov	r2, #22
    e27c:	e3e00000 	mvn	r0, #0
    e280:	e5832000 	str	r2, [r3]
    e284:	e12fff1e 	bx	lr
    e288:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    e28c:	e24dd014 	sub	sp, sp, #20
    e290:	e98d000e 	stmib	sp, {r1, r2, r3}
    e294:	ebffffd6 	bl	e1f4 <_init_signal_r.part.0>
    e298:	e3500000 	cmp	r0, #0
    e29c:	13e00000 	mvnne	r0, #0
    e2a0:	059d300c 	ldreq	r3, [sp, #12]
    e2a4:	099d0006 	ldmibeq	sp, {r1, r2}
    e2a8:	0593c2dc 	ldreq	ip, [r3, #732]	; 0x2dc
    e2ac:	079c0101 	ldreq	r0, [ip, r1, lsl #2]
    e2b0:	078c2101 	streq	r2, [ip, r1, lsl #2]
    e2b4:	e28dd014 	add	sp, sp, #20
    e2b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    e2bc:	e12fff1e 	bx	lr

0000e2c0 <_raise_r>:
    e2c0:	e351001f 	cmp	r1, #31
    e2c4:	e92d4020 	push	{r5, lr}
    e2c8:	83a03016 	movhi	r3, #22
    e2cc:	e1a05000 	mov	r5, r0
    e2d0:	e24dd008 	sub	sp, sp, #8
    e2d4:	83e00000 	mvnhi	r0, #0
    e2d8:	85853000 	strhi	r3, [r5]
    e2dc:	8a000012 	bhi	e32c <_raise_r+0x6c>
    e2e0:	e59522dc 	ldr	r2, [r5, #732]	; 0x2dc
    e2e4:	e3520000 	cmp	r2, #0
    e2e8:	0a000014 	beq	e340 <_raise_r+0x80>
    e2ec:	e7923101 	ldr	r3, [r2, r1, lsl #2]
    e2f0:	e3530000 	cmp	r3, #0
    e2f4:	0a000011 	beq	e340 <_raise_r+0x80>
    e2f8:	e3530001 	cmp	r3, #1
    e2fc:	0a00000d 	beq	e338 <_raise_r+0x78>
    e300:	e3730001 	cmn	r3, #1
    e304:	03a03016 	moveq	r3, #22
    e308:	03a00001 	moveq	r0, #1
    e30c:	05853000 	streq	r3, [r5]
    e310:	0a000005 	beq	e32c <_raise_r+0x6c>
    e314:	e3a05000 	mov	r5, #0
    e318:	e1a00001 	mov	r0, r1
    e31c:	e7825101 	str	r5, [r2, r1, lsl #2]
    e320:	e1a0e00f 	mov	lr, pc
    e324:	e12fff13 	bx	r3
    e328:	e1a00005 	mov	r0, r5
    e32c:	e28dd008 	add	sp, sp, #8
    e330:	e8bd4020 	pop	{r5, lr}
    e334:	e12fff1e 	bx	lr
    e338:	e3a00000 	mov	r0, #0
    e33c:	eafffffa 	b	e32c <_raise_r+0x6c>
    e340:	e1a00005 	mov	r0, r5
    e344:	e58d1004 	str	r1, [sp, #4]
    e348:	eb000056 	bl	e4a8 <_getpid_r>
    e34c:	e59d1004 	ldr	r1, [sp, #4]
    e350:	e1a02001 	mov	r2, r1
    e354:	e1a01000 	mov	r1, r0
    e358:	e1a00005 	mov	r0, r5
    e35c:	eb000040 	bl	e464 <_kill_r>
    e360:	eafffff1 	b	e32c <_raise_r+0x6c>

0000e364 <__sigtramp_r>:
    e364:	e351001f 	cmp	r1, #31
    e368:	8a000022 	bhi	e3f8 <__sigtramp_r+0x94>
    e36c:	e92d4020 	push	{r5, lr}
    e370:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    e374:	e3530000 	cmp	r3, #0
    e378:	e24dd008 	sub	sp, sp, #8
    e37c:	e1a05000 	mov	r5, r0
    e380:	0a000014 	beq	e3d8 <__sigtramp_r+0x74>
    e384:	e7932101 	ldr	r2, [r3, r1, lsl #2]
    e388:	e3520000 	cmp	r2, #0
    e38c:	e0833101 	add	r3, r3, r1, lsl #2
    e390:	0a00000e 	beq	e3d0 <__sigtramp_r+0x6c>
    e394:	e3720001 	cmn	r2, #1
    e398:	03a00002 	moveq	r0, #2
    e39c:	0a000008 	beq	e3c4 <__sigtramp_r+0x60>
    e3a0:	e3520001 	cmp	r2, #1
    e3a4:	03a00003 	moveq	r0, #3
    e3a8:	0a000005 	beq	e3c4 <__sigtramp_r+0x60>
    e3ac:	e3a05000 	mov	r5, #0
    e3b0:	e1a00001 	mov	r0, r1
    e3b4:	e5835000 	str	r5, [r3]
    e3b8:	e1a0e00f 	mov	lr, pc
    e3bc:	e12fff12 	bx	r2
    e3c0:	e1a00005 	mov	r0, r5
    e3c4:	e28dd008 	add	sp, sp, #8
    e3c8:	e8bd4020 	pop	{r5, lr}
    e3cc:	e12fff1e 	bx	lr
    e3d0:	e3a00001 	mov	r0, #1
    e3d4:	eafffffa 	b	e3c4 <__sigtramp_r+0x60>
    e3d8:	e58d1004 	str	r1, [sp, #4]
    e3dc:	ebffff84 	bl	e1f4 <_init_signal_r.part.0>
    e3e0:	e3500000 	cmp	r0, #0
    e3e4:	059532dc 	ldreq	r3, [r5, #732]	; 0x2dc
    e3e8:	059d1004 	ldreq	r1, [sp, #4]
    e3ec:	0affffe4 	beq	e384 <__sigtramp_r+0x20>
    e3f0:	e3e00000 	mvn	r0, #0
    e3f4:	eafffff2 	b	e3c4 <__sigtramp_r+0x60>
    e3f8:	e3e00000 	mvn	r0, #0
    e3fc:	e12fff1e 	bx	lr

0000e400 <raise>:
    e400:	e59f3008 	ldr	r3, [pc, #8]	; e410 <raise+0x10>
    e404:	e1a01000 	mov	r1, r0
    e408:	e5930000 	ldr	r0, [r3]
    e40c:	eaffffab 	b	e2c0 <_raise_r>
    e410:	0000fb6c 	.word	0x0000fb6c

0000e414 <signal>:
    e414:	e59f300c 	ldr	r3, [pc, #12]	; e428 <signal+0x14>
    e418:	e1a02001 	mov	r2, r1
    e41c:	e1a01000 	mov	r1, r0
    e420:	e5930000 	ldr	r0, [r3]
    e424:	eaffff8a 	b	e254 <_signal_r>
    e428:	0000fb6c 	.word	0x0000fb6c

0000e42c <_init_signal>:
    e42c:	e59f3018 	ldr	r3, [pc, #24]	; e44c <_init_signal+0x20>
    e430:	e5930000 	ldr	r0, [r3]
    e434:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
    e438:	e3530000 	cmp	r3, #0
    e43c:	0a000001 	beq	e448 <_init_signal+0x1c>
    e440:	e3a00000 	mov	r0, #0
    e444:	e12fff1e 	bx	lr
    e448:	eaffff69 	b	e1f4 <_init_signal_r.part.0>
    e44c:	0000fb6c 	.word	0x0000fb6c

0000e450 <__sigtramp>:
    e450:	e59f3008 	ldr	r3, [pc, #8]	; e460 <__sigtramp+0x10>
    e454:	e1a01000 	mov	r1, r0
    e458:	e5930000 	ldr	r0, [r3]
    e45c:	eaffffc0 	b	e364 <__sigtramp_r>
    e460:	0000fb6c 	.word	0x0000fb6c

0000e464 <_kill_r>:
    e464:	e1a0c001 	mov	ip, r1
    e468:	e3a03000 	mov	r3, #0
    e46c:	e92d4070 	push	{r4, r5, r6, lr}
    e470:	e59f402c 	ldr	r4, [pc, #44]	; e4a4 <_kill_r+0x40>
    e474:	e1a05000 	mov	r5, r0
    e478:	e1a01002 	mov	r1, r2
    e47c:	e1a0000c 	mov	r0, ip
    e480:	e5843000 	str	r3, [r4]
    e484:	eb00032f 	bl	f148 <_kill>
    e488:	e3700001 	cmn	r0, #1
    e48c:	1a000002 	bne	e49c <_kill_r+0x38>
    e490:	e5943000 	ldr	r3, [r4]
    e494:	e3530000 	cmp	r3, #0
    e498:	15853000 	strne	r3, [r5]
    e49c:	e8bd4070 	pop	{r4, r5, r6, lr}
    e4a0:	e12fff1e 	bx	lr
    e4a4:	00010598 	.word	0x00010598

0000e4a8 <_getpid_r>:
    e4a8:	e92d4010 	push	{r4, lr}
    e4ac:	eb000319 	bl	f118 <_getpid>
    e4b0:	e8bd4010 	pop	{r4, lr}
    e4b4:	e12fff1e 	bx	lr

0000e4b8 <__sread>:
    e4b8:	e92d4010 	push	{r4, lr}
    e4bc:	e1a04001 	mov	r4, r1
    e4c0:	e1d110fe 	ldrsh	r1, [r1, #14]
    e4c4:	eb000237 	bl	eda8 <_read_r>
    e4c8:	e3500000 	cmp	r0, #0
    e4cc:	a5943050 	ldrge	r3, [r4, #80]	; 0x50
    e4d0:	b1d430bc 	ldrhlt	r3, [r4, #12]
    e4d4:	a0833000 	addge	r3, r3, r0
    e4d8:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
    e4dc:	a5843050 	strge	r3, [r4, #80]	; 0x50
    e4e0:	b1c430bc 	strhlt	r3, [r4, #12]
    e4e4:	e8bd4010 	pop	{r4, lr}
    e4e8:	e12fff1e 	bx	lr

0000e4ec <__seofread>:
    e4ec:	e3a00000 	mov	r0, #0
    e4f0:	e12fff1e 	bx	lr

0000e4f4 <__swrite>:
    e4f4:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e4f8:	e1a04001 	mov	r4, r1
    e4fc:	e1d110fc 	ldrsh	r1, [r1, #12]
    e500:	e3110c01 	tst	r1, #256	; 0x100
    e504:	e1a06002 	mov	r6, r2
    e508:	e1a07003 	mov	r7, r3
    e50c:	e1a05000 	mov	r5, r0
    e510:	0a000004 	beq	e528 <__swrite+0x34>
    e514:	e1d410fe 	ldrsh	r1, [r4, #14]
    e518:	e3a03002 	mov	r3, #2
    e51c:	e3a02000 	mov	r2, #0
    e520:	eb00020e 	bl	ed60 <_lseek_r>
    e524:	e1d410fc 	ldrsh	r1, [r4, #12]
    e528:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
    e52c:	e1c410bc 	strh	r1, [r4, #12]
    e530:	e1a03007 	mov	r3, r7
    e534:	e1a02006 	mov	r2, r6
    e538:	e1d410fe 	ldrsh	r1, [r4, #14]
    e53c:	e1a00005 	mov	r0, r5
    e540:	eb000168 	bl	eae8 <_write_r>
    e544:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e548:	e12fff1e 	bx	lr

0000e54c <__sseek>:
    e54c:	e92d4010 	push	{r4, lr}
    e550:	e1a04001 	mov	r4, r1
    e554:	e1d110fe 	ldrsh	r1, [r1, #14]
    e558:	eb000200 	bl	ed60 <_lseek_r>
    e55c:	e1d430bc 	ldrh	r3, [r4, #12]
    e560:	e3700001 	cmn	r0, #1
    e564:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
    e568:	13833a01 	orrne	r3, r3, #4096	; 0x1000
    e56c:	15840050 	strne	r0, [r4, #80]	; 0x50
    e570:	e1c430bc 	strh	r3, [r4, #12]
    e574:	e8bd4010 	pop	{r4, lr}
    e578:	e12fff1e 	bx	lr

0000e57c <__sclose>:
    e57c:	e92d4010 	push	{r4, lr}
    e580:	e1d110fe 	ldrsh	r1, [r1, #14]
    e584:	eb000169 	bl	eb30 <_close_r>
    e588:	e8bd4010 	pop	{r4, lr}
    e58c:	e12fff1e 	bx	lr

0000e590 <strcmp>:
    e590:	e020c001 	eor	ip, r0, r1
    e594:	e31c0003 	tst	ip, #3
    e598:	1a000021 	bne	e624 <strcmp+0x94>
    e59c:	e210c003 	ands	ip, r0, #3
    e5a0:	e3c00003 	bic	r0, r0, #3
    e5a4:	e3c11003 	bic	r1, r1, #3
    e5a8:	e4902004 	ldr	r2, [r0], #4
    e5ac:	04913004 	ldreq	r3, [r1], #4
    e5b0:	0a000006 	beq	e5d0 <strcmp+0x40>
    e5b4:	e22cc003 	eor	ip, ip, #3
    e5b8:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    e5bc:	e1a0c18c 	lsl	ip, ip, #3
    e5c0:	e1a0cc33 	lsr	ip, r3, ip
    e5c4:	e4913004 	ldr	r3, [r1], #4
    e5c8:	e182200c 	orr	r2, r2, ip
    e5cc:	e183300c 	orr	r3, r3, ip
    e5d0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    e5d4:	e3a04001 	mov	r4, #1
    e5d8:	e1844404 	orr	r4, r4, r4, lsl #8
    e5dc:	e1844804 	orr	r4, r4, r4, lsl #16
    e5e0:	e042c004 	sub	ip, r2, r4
    e5e4:	e1520003 	cmp	r2, r3
    e5e8:	01ccc002 	biceq	ip, ip, r2
    e5ec:	011c0384 	tsteq	ip, r4, lsl #7
    e5f0:	04902004 	ldreq	r2, [r0], #4
    e5f4:	04913004 	ldreq	r3, [r1], #4
    e5f8:	0afffff8 	beq	e5e0 <strcmp+0x50>
    e5fc:	e1a00c02 	lsl	r0, r2, #24
    e600:	e1a02422 	lsr	r2, r2, #8
    e604:	e3500001 	cmp	r0, #1
    e608:	21500c03 	cmpcs	r0, r3, lsl #24
    e60c:	01a03423 	lsreq	r3, r3, #8
    e610:	0afffff9 	beq	e5fc <strcmp+0x6c>
    e614:	e20330ff 	and	r3, r3, #255	; 0xff
    e618:	e0630c20 	rsb	r0, r3, r0, lsr #24
    e61c:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    e620:	e12fff1e 	bx	lr
    e624:	e3100003 	tst	r0, #3
    e628:	0a000006 	beq	e648 <strcmp+0xb8>
    e62c:	e4d02001 	ldrb	r2, [r0], #1
    e630:	e4d13001 	ldrb	r3, [r1], #1
    e634:	e3520001 	cmp	r2, #1
    e638:	21520003 	cmpcs	r2, r3
    e63c:	0afffff8 	beq	e624 <strcmp+0x94>
    e640:	e0420003 	sub	r0, r2, r3
    e644:	e12fff1e 	bx	lr
    e648:	e92d0030 	push	{r4, r5}
    e64c:	e3a04001 	mov	r4, #1
    e650:	e1844404 	orr	r4, r4, r4, lsl #8
    e654:	e1844804 	orr	r4, r4, r4, lsl #16
    e658:	e4902004 	ldr	r2, [r0], #4
    e65c:	e2015003 	and	r5, r1, #3
    e660:	e3c11003 	bic	r1, r1, #3
    e664:	e4913004 	ldr	r3, [r1], #4
    e668:	e3550002 	cmp	r5, #2
    e66c:	0a000017 	beq	e6d0 <strcmp+0x140>
    e670:	8a00002d 	bhi	e72c <strcmp+0x19c>
    e674:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    e678:	e1550423 	cmp	r5, r3, lsr #8
    e67c:	e042c004 	sub	ip, r2, r4
    e680:	e1ccc002 	bic	ip, ip, r2
    e684:	1a000007 	bne	e6a8 <strcmp+0x118>
    e688:	e01cc384 	ands	ip, ip, r4, lsl #7
    e68c:	04913004 	ldreq	r3, [r1], #4
    e690:	1a000006 	bne	e6b0 <strcmp+0x120>
    e694:	e0255002 	eor	r5, r5, r2
    e698:	e1550c03 	cmp	r5, r3, lsl #24
    e69c:	1a000008 	bne	e6c4 <strcmp+0x134>
    e6a0:	e4902004 	ldr	r2, [r0], #4
    e6a4:	eafffff2 	b	e674 <strcmp+0xe4>
    e6a8:	e1a03423 	lsr	r3, r3, #8
    e6ac:	ea000036 	b	e78c <strcmp+0x1fc>
    e6b0:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    e6b4:	1a000031 	bne	e780 <strcmp+0x1f0>
    e6b8:	e5d13000 	ldrb	r3, [r1]
    e6bc:	e1a05c22 	lsr	r5, r2, #24
    e6c0:	ea000031 	b	e78c <strcmp+0x1fc>
    e6c4:	e1a05c22 	lsr	r5, r2, #24
    e6c8:	e20330ff 	and	r3, r3, #255	; 0xff
    e6cc:	ea00002e 	b	e78c <strcmp+0x1fc>
    e6d0:	e1a05802 	lsl	r5, r2, #16
    e6d4:	e042c004 	sub	ip, r2, r4
    e6d8:	e1a05825 	lsr	r5, r5, #16
    e6dc:	e1ccc002 	bic	ip, ip, r2
    e6e0:	e1550823 	cmp	r5, r3, lsr #16
    e6e4:	1a00000e 	bne	e724 <strcmp+0x194>
    e6e8:	e01cc384 	ands	ip, ip, r4, lsl #7
    e6ec:	04913004 	ldreq	r3, [r1], #4
    e6f0:	1a000004 	bne	e708 <strcmp+0x178>
    e6f4:	e0255002 	eor	r5, r5, r2
    e6f8:	e1550803 	cmp	r5, r3, lsl #16
    e6fc:	1a000006 	bne	e71c <strcmp+0x18c>
    e700:	e4902004 	ldr	r2, [r0], #4
    e704:	eafffff1 	b	e6d0 <strcmp+0x140>
    e708:	e1b0c80c 	lsls	ip, ip, #16
    e70c:	1a00001b 	bne	e780 <strcmp+0x1f0>
    e710:	e1d130b0 	ldrh	r3, [r1]
    e714:	e1a05822 	lsr	r5, r2, #16
    e718:	ea00001b 	b	e78c <strcmp+0x1fc>
    e71c:	e1a03803 	lsl	r3, r3, #16
    e720:	e1a05822 	lsr	r5, r2, #16
    e724:	e1a03823 	lsr	r3, r3, #16
    e728:	ea000017 	b	e78c <strcmp+0x1fc>
    e72c:	e20250ff 	and	r5, r2, #255	; 0xff
    e730:	e1550c23 	cmp	r5, r3, lsr #24
    e734:	e042c004 	sub	ip, r2, r4
    e738:	e1ccc002 	bic	ip, ip, r2
    e73c:	1a000007 	bne	e760 <strcmp+0x1d0>
    e740:	e01cc384 	ands	ip, ip, r4, lsl #7
    e744:	04913004 	ldreq	r3, [r1], #4
    e748:	1a000006 	bne	e768 <strcmp+0x1d8>
    e74c:	e0255002 	eor	r5, r5, r2
    e750:	e1550403 	cmp	r5, r3, lsl #8
    e754:	1a000006 	bne	e774 <strcmp+0x1e4>
    e758:	e4902004 	ldr	r2, [r0], #4
    e75c:	eafffff2 	b	e72c <strcmp+0x19c>
    e760:	e1a03c23 	lsr	r3, r3, #24
    e764:	ea000008 	b	e78c <strcmp+0x1fc>
    e768:	e31200ff 	tst	r2, #255	; 0xff
    e76c:	0a000003 	beq	e780 <strcmp+0x1f0>
    e770:	e4913004 	ldr	r3, [r1], #4
    e774:	e1a05422 	lsr	r5, r2, #8
    e778:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    e77c:	ea000002 	b	e78c <strcmp+0x1fc>
    e780:	e3a00000 	mov	r0, #0
    e784:	e8bd0030 	pop	{r4, r5}
    e788:	e12fff1e 	bx	lr
    e78c:	e20520ff 	and	r2, r5, #255	; 0xff
    e790:	e20300ff 	and	r0, r3, #255	; 0xff
    e794:	e3500001 	cmp	r0, #1
    e798:	21500002 	cmpcs	r0, r2
    e79c:	01a05425 	lsreq	r5, r5, #8
    e7a0:	01a03423 	lsreq	r3, r3, #8
    e7a4:	0afffff8 	beq	e78c <strcmp+0x1fc>
    e7a8:	e0420000 	sub	r0, r2, r0
    e7ac:	e8bd0030 	pop	{r4, r5}
    e7b0:	e12fff1e 	bx	lr

0000e7b4 <strlen>:
    e7b4:	e3c01003 	bic	r1, r0, #3
    e7b8:	e2100003 	ands	r0, r0, #3
    e7bc:	e2600000 	rsb	r0, r0, #0
    e7c0:	e4913004 	ldr	r3, [r1], #4
    e7c4:	e280c004 	add	ip, r0, #4
    e7c8:	e1a0c18c 	lsl	ip, ip, #3
    e7cc:	e3e02000 	mvn	r2, #0
    e7d0:	11833c32 	orrne	r3, r3, r2, lsr ip
    e7d4:	e3a0c001 	mov	ip, #1
    e7d8:	e18cc40c 	orr	ip, ip, ip, lsl #8
    e7dc:	e18cc80c 	orr	ip, ip, ip, lsl #16
    e7e0:	e043200c 	sub	r2, r3, ip
    e7e4:	e1c22003 	bic	r2, r2, r3
    e7e8:	e012238c 	ands	r2, r2, ip, lsl #7
    e7ec:	04913004 	ldreq	r3, [r1], #4
    e7f0:	02800004 	addeq	r0, r0, #4
    e7f4:	0afffff9 	beq	e7e0 <strlen+0x2c>
    e7f8:	e31300ff 	tst	r3, #255	; 0xff
    e7fc:	12800001 	addne	r0, r0, #1
    e800:	13130cff 	tstne	r3, #65280	; 0xff00
    e804:	12800001 	addne	r0, r0, #1
    e808:	131308ff 	tstne	r3, #16711680	; 0xff0000
    e80c:	12800001 	addne	r0, r0, #1
    e810:	e12fff1e 	bx	lr

0000e814 <__swbuf_r>:
    e814:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    e818:	e2506000 	subs	r6, r0, #0
    e81c:	e1a05001 	mov	r5, r1
    e820:	e1a04002 	mov	r4, r2
    e824:	0a000002 	beq	e834 <__swbuf_r+0x20>
    e828:	e5963038 	ldr	r3, [r6, #56]	; 0x38
    e82c:	e3530000 	cmp	r3, #0
    e830:	0a000042 	beq	e940 <__swbuf_r+0x12c>
    e834:	e1d410fc 	ldrsh	r1, [r4, #12]
    e838:	e5940018 	ldr	r0, [r4, #24]
    e83c:	e1a03801 	lsl	r3, r1, #16
    e840:	e3130702 	tst	r3, #524288	; 0x80000
    e844:	e1a02823 	lsr	r2, r3, #16
    e848:	e5840008 	str	r0, [r4, #8]
    e84c:	0a000022 	beq	e8dc <__swbuf_r+0xc8>
    e850:	e5943010 	ldr	r3, [r4, #16]
    e854:	e3530000 	cmp	r3, #0
    e858:	0a00001f 	beq	e8dc <__swbuf_r+0xc8>
    e85c:	e3120a02 	tst	r2, #8192	; 0x2000
    e860:	05942064 	ldreq	r2, [r4, #100]	; 0x64
    e864:	03c22a02 	biceq	r2, r2, #8192	; 0x2000
    e868:	03811a02 	orreq	r1, r1, #8192	; 0x2000
    e86c:	05842064 	streq	r2, [r4, #100]	; 0x64
    e870:	e5942000 	ldr	r2, [r4]
    e874:	01c410bc 	strheq	r1, [r4, #12]
    e878:	e5941014 	ldr	r1, [r4, #20]
    e87c:	e0423003 	sub	r3, r2, r3
    e880:	e20550ff 	and	r5, r5, #255	; 0xff
    e884:	e1530001 	cmp	r3, r1
    e888:	e1a07005 	mov	r7, r5
    e88c:	b2833001 	addlt	r3, r3, #1
    e890:	aa000022 	bge	e920 <__swbuf_r+0x10c>
    e894:	e5941008 	ldr	r1, [r4, #8]
    e898:	e2820001 	add	r0, r2, #1
    e89c:	e2411001 	sub	r1, r1, #1
    e8a0:	e5841008 	str	r1, [r4, #8]
    e8a4:	e5840000 	str	r0, [r4]
    e8a8:	e5c25000 	strb	r5, [r2]
    e8ac:	e5942014 	ldr	r2, [r4, #20]
    e8b0:	e1520003 	cmp	r2, r3
    e8b4:	0a000012 	beq	e904 <__swbuf_r+0xf0>
    e8b8:	e1d430bc 	ldrh	r3, [r4, #12]
    e8bc:	e355000a 	cmp	r5, #10
    e8c0:	13a05000 	movne	r5, #0
    e8c4:	02035001 	andeq	r5, r3, #1
    e8c8:	e3550000 	cmp	r5, #0
    e8cc:	1a00000c 	bne	e904 <__swbuf_r+0xf0>
    e8d0:	e1a00007 	mov	r0, r7
    e8d4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    e8d8:	e12fff1e 	bx	lr
    e8dc:	e1a01004 	mov	r1, r4
    e8e0:	e1a00006 	mov	r0, r6
    e8e4:	ebfff4e9 	bl	bc90 <__swsetup_r>
    e8e8:	e3500000 	cmp	r0, #0
    e8ec:	1a000009 	bne	e918 <__swbuf_r+0x104>
    e8f0:	e1d410fc 	ldrsh	r1, [r4, #12]
    e8f4:	e1a02801 	lsl	r2, r1, #16
    e8f8:	e5943010 	ldr	r3, [r4, #16]
    e8fc:	e1a02822 	lsr	r2, r2, #16
    e900:	eaffffd5 	b	e85c <__swbuf_r+0x48>
    e904:	e1a01004 	mov	r1, r4
    e908:	e1a00006 	mov	r0, r6
    e90c:	ebfff5cc 	bl	c044 <_fflush_r>
    e910:	e3500000 	cmp	r0, #0
    e914:	0affffed 	beq	e8d0 <__swbuf_r+0xbc>
    e918:	e3e07000 	mvn	r7, #0
    e91c:	eaffffeb 	b	e8d0 <__swbuf_r+0xbc>
    e920:	e1a01004 	mov	r1, r4
    e924:	e1a00006 	mov	r0, r6
    e928:	ebfff5c5 	bl	c044 <_fflush_r>
    e92c:	e3500000 	cmp	r0, #0
    e930:	1afffff8 	bne	e918 <__swbuf_r+0x104>
    e934:	e3a03001 	mov	r3, #1
    e938:	e5942000 	ldr	r2, [r4]
    e93c:	eaffffd4 	b	e894 <__swbuf_r+0x80>
    e940:	ebfff654 	bl	c298 <__sinit>
    e944:	eaffffba 	b	e834 <__swbuf_r+0x20>

0000e948 <__swbuf>:
    e948:	e59f300c 	ldr	r3, [pc, #12]	; e95c <__swbuf+0x14>
    e94c:	e1a02001 	mov	r2, r1
    e950:	e1a01000 	mov	r1, r0
    e954:	e5930000 	ldr	r0, [r3]
    e958:	eaffffad 	b	e814 <__swbuf_r>
    e95c:	0000fb6c 	.word	0x0000fb6c

0000e960 <_wcrtomb_r>:
    e960:	e92d4070 	push	{r4, r5, r6, lr}
    e964:	e251c000 	subs	ip, r1, #0
    e968:	e24dd010 	sub	sp, sp, #16
    e96c:	e1a05000 	mov	r5, r0
    e970:	e1a06003 	mov	r6, r3
    e974:	0a000010 	beq	e9bc <_wcrtomb_r+0x5c>
    e978:	e59fc06c 	ldr	ip, [pc, #108]	; e9ec <_wcrtomb_r+0x8c>
    e97c:	e59cc000 	ldr	ip, [ip]
    e980:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    e984:	e59fe064 	ldr	lr, [pc, #100]	; e9f0 <_wcrtomb_r+0x90>
    e988:	e35c0000 	cmp	ip, #0
    e98c:	01a0c00e 	moveq	ip, lr
    e990:	e59c40e0 	ldr	r4, [ip, #224]	; 0xe0
    e994:	e1a0e00f 	mov	lr, pc
    e998:	e12fff14 	bx	r4
    e99c:	e3700001 	cmn	r0, #1
    e9a0:	03a02000 	moveq	r2, #0
    e9a4:	03a0308a 	moveq	r3, #138	; 0x8a
    e9a8:	05862000 	streq	r2, [r6]
    e9ac:	05853000 	streq	r3, [r5]
    e9b0:	e28dd010 	add	sp, sp, #16
    e9b4:	e8bd4070 	pop	{r4, r5, r6, lr}
    e9b8:	e12fff1e 	bx	lr
    e9bc:	e59f2028 	ldr	r2, [pc, #40]	; e9ec <_wcrtomb_r+0x8c>
    e9c0:	e5921000 	ldr	r1, [r2]
    e9c4:	e5911034 	ldr	r1, [r1, #52]	; 0x34
    e9c8:	e59f2020 	ldr	r2, [pc, #32]	; e9f0 <_wcrtomb_r+0x90>
    e9cc:	e3510000 	cmp	r1, #0
    e9d0:	01a01002 	moveq	r1, r2
    e9d4:	e1a0200c 	mov	r2, ip
    e9d8:	e59140e0 	ldr	r4, [r1, #224]	; 0xe0
    e9dc:	e28d1004 	add	r1, sp, #4
    e9e0:	e1a0e00f 	mov	lr, pc
    e9e4:	e12fff14 	bx	r4
    e9e8:	eaffffeb 	b	e99c <_wcrtomb_r+0x3c>
    e9ec:	0000fb6c 	.word	0x0000fb6c
    e9f0:	0000ff98 	.word	0x0000ff98

0000e9f4 <wcrtomb>:
    e9f4:	e92d4070 	push	{r4, r5, r6, lr}
    e9f8:	e59f3084 	ldr	r3, [pc, #132]	; ea84 <wcrtomb+0x90>
    e9fc:	e5934000 	ldr	r4, [r3]
    ea00:	e3500000 	cmp	r0, #0
    ea04:	e1a05002 	mov	r5, r2
    ea08:	e24dd010 	sub	sp, sp, #16
    ea0c:	e5943034 	ldr	r3, [r4, #52]	; 0x34
    ea10:	e59f2070 	ldr	r2, [pc, #112]	; ea88 <wcrtomb+0x94>
    ea14:	0a000010 	beq	ea5c <wcrtomb+0x68>
    ea18:	e3530000 	cmp	r3, #0
    ea1c:	01a03002 	moveq	r3, r2
    ea20:	e1a02001 	mov	r2, r1
    ea24:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
    ea28:	e1a01000 	mov	r1, r0
    ea2c:	e1a03005 	mov	r3, r5
    ea30:	e1a00004 	mov	r0, r4
    ea34:	e1a0e00f 	mov	lr, pc
    ea38:	e12fff16 	bx	r6
    ea3c:	e3700001 	cmn	r0, #1
    ea40:	03a02000 	moveq	r2, #0
    ea44:	03a0308a 	moveq	r3, #138	; 0x8a
    ea48:	05852000 	streq	r2, [r5]
    ea4c:	05843000 	streq	r3, [r4]
    ea50:	e28dd010 	add	sp, sp, #16
    ea54:	e8bd4070 	pop	{r4, r5, r6, lr}
    ea58:	e12fff1e 	bx	lr
    ea5c:	e3530000 	cmp	r3, #0
    ea60:	01a03002 	moveq	r3, r2
    ea64:	e28d1004 	add	r1, sp, #4
    ea68:	e1a02000 	mov	r2, r0
    ea6c:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
    ea70:	e1a00004 	mov	r0, r4
    ea74:	e1a03005 	mov	r3, r5
    ea78:	e1a0e00f 	mov	lr, pc
    ea7c:	e12fff16 	bx	r6
    ea80:	eaffffed 	b	ea3c <wcrtomb+0x48>
    ea84:	0000fb6c 	.word	0x0000fb6c
    ea88:	0000ff98 	.word	0x0000ff98

0000ea8c <_wctomb_r>:
    ea8c:	e59fc024 	ldr	ip, [pc, #36]	; eab8 <_wctomb_r+0x2c>
    ea90:	e59cc000 	ldr	ip, [ip]
    ea94:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
    ea98:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    ea9c:	e59fe018 	ldr	lr, [pc, #24]	; eabc <_wctomb_r+0x30>
    eaa0:	e35c0000 	cmp	ip, #0
    eaa4:	01a0c00e 	moveq	ip, lr
    eaa8:	e59ce0e0 	ldr	lr, [ip, #224]	; 0xe0
    eaac:	e1a0c00e 	mov	ip, lr
    eab0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    eab4:	e12fff1c 	bx	ip
    eab8:	0000fb6c 	.word	0x0000fb6c
    eabc:	0000ff98 	.word	0x0000ff98

0000eac0 <__ascii_wctomb>:
    eac0:	e3510000 	cmp	r1, #0
    eac4:	0a000005 	beq	eae0 <__ascii_wctomb+0x20>
    eac8:	e35200ff 	cmp	r2, #255	; 0xff
    eacc:	83a0308a 	movhi	r3, #138	; 0x8a
    ead0:	95c12000 	strbls	r2, [r1]
    ead4:	83e01000 	mvnhi	r1, #0
    ead8:	93a01001 	movls	r1, #1
    eadc:	85803000 	strhi	r3, [r0]
    eae0:	e1a00001 	mov	r0, r1
    eae4:	e12fff1e 	bx	lr

0000eae8 <_write_r>:
    eae8:	e92d4070 	push	{r4, r5, r6, lr}
    eaec:	e1a0e001 	mov	lr, r1
    eaf0:	e3a0c000 	mov	ip, #0
    eaf4:	e59f4030 	ldr	r4, [pc, #48]	; eb2c <_write_r+0x44>
    eaf8:	e1a01002 	mov	r1, r2
    eafc:	e1a05000 	mov	r5, r0
    eb00:	e1a02003 	mov	r2, r3
    eb04:	e1a0000e 	mov	r0, lr
    eb08:	e584c000 	str	ip, [r4]
    eb0c:	eb0001aa 	bl	f1bc <_write>
    eb10:	e3700001 	cmn	r0, #1
    eb14:	1a000002 	bne	eb24 <_write_r+0x3c>
    eb18:	e5943000 	ldr	r3, [r4]
    eb1c:	e3530000 	cmp	r3, #0
    eb20:	15853000 	strne	r3, [r5]
    eb24:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb28:	e12fff1e 	bx	lr
    eb2c:	00010598 	.word	0x00010598

0000eb30 <_close_r>:
    eb30:	e3a03000 	mov	r3, #0
    eb34:	e92d4070 	push	{r4, r5, r6, lr}
    eb38:	e59f4028 	ldr	r4, [pc, #40]	; eb68 <_close_r+0x38>
    eb3c:	e1a05000 	mov	r5, r0
    eb40:	e1a00001 	mov	r0, r1
    eb44:	e5843000 	str	r3, [r4]
    eb48:	eb000166 	bl	f0e8 <_close>
    eb4c:	e3700001 	cmn	r0, #1
    eb50:	1a000002 	bne	eb60 <_close_r+0x30>
    eb54:	e5943000 	ldr	r3, [r4]
    eb58:	e3530000 	cmp	r3, #0
    eb5c:	15853000 	strne	r3, [r5]
    eb60:	e8bd4070 	pop	{r4, r5, r6, lr}
    eb64:	e12fff1e 	bx	lr
    eb68:	00010598 	.word	0x00010598

0000eb6c <_fclose_r>:
    eb6c:	e92d4070 	push	{r4, r5, r6, lr}
    eb70:	e2514000 	subs	r4, r1, #0
    eb74:	0a00000b 	beq	eba8 <_fclose_r+0x3c>
    eb78:	e3500000 	cmp	r0, #0
    eb7c:	e1a06000 	mov	r6, r0
    eb80:	0a000002 	beq	eb90 <_fclose_r+0x24>
    eb84:	e5903038 	ldr	r3, [r0, #56]	; 0x38
    eb88:	e3530000 	cmp	r3, #0
    eb8c:	0a000038 	beq	ec74 <_fclose_r+0x108>
    eb90:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    eb94:	e3130001 	tst	r3, #1
    eb98:	0a000006 	beq	ebb8 <_fclose_r+0x4c>
    eb9c:	e1d430fc 	ldrsh	r3, [r4, #12]
    eba0:	e3530000 	cmp	r3, #0
    eba4:	1a000006 	bne	ebc4 <_fclose_r+0x58>
    eba8:	e3a05000 	mov	r5, #0
    ebac:	e1a00005 	mov	r0, r5
    ebb0:	e8bd4070 	pop	{r4, r5, r6, lr}
    ebb4:	e12fff1e 	bx	lr
    ebb8:	e1d430bc 	ldrh	r3, [r4, #12]
    ebbc:	e3130c02 	tst	r3, #512	; 0x200
    ebc0:	0a000034 	beq	ec98 <_fclose_r+0x12c>
    ebc4:	e1a01004 	mov	r1, r4
    ebc8:	e1a00006 	mov	r0, r6
    ebcc:	ebfff48d 	bl	be08 <__sflush_r>
    ebd0:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
    ebd4:	e3530000 	cmp	r3, #0
    ebd8:	e1a05000 	mov	r5, r0
    ebdc:	0a000005 	beq	ebf8 <_fclose_r+0x8c>
    ebe0:	e594101c 	ldr	r1, [r4, #28]
    ebe4:	e1a00006 	mov	r0, r6
    ebe8:	e1a0e00f 	mov	lr, pc
    ebec:	e12fff13 	bx	r3
    ebf0:	e3500000 	cmp	r0, #0
    ebf4:	b3e05000 	mvnlt	r5, #0
    ebf8:	e1d430bc 	ldrh	r3, [r4, #12]
    ebfc:	e3130080 	tst	r3, #128	; 0x80
    ec00:	1a00001d 	bne	ec7c <_fclose_r+0x110>
    ec04:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    ec08:	e3510000 	cmp	r1, #0
    ec0c:	0a000005 	beq	ec28 <_fclose_r+0xbc>
    ec10:	e2843040 	add	r3, r4, #64	; 0x40
    ec14:	e1510003 	cmp	r1, r3
    ec18:	11a00006 	movne	r0, r6
    ec1c:	1bfff6fe 	blne	c81c <_free_r>
    ec20:	e3a03000 	mov	r3, #0
    ec24:	e5843030 	str	r3, [r4, #48]	; 0x30
    ec28:	e5941044 	ldr	r1, [r4, #68]	; 0x44
    ec2c:	e3510000 	cmp	r1, #0
    ec30:	0a000003 	beq	ec44 <_fclose_r+0xd8>
    ec34:	e1a00006 	mov	r0, r6
    ec38:	ebfff6f7 	bl	c81c <_free_r>
    ec3c:	e3a03000 	mov	r3, #0
    ec40:	e5843044 	str	r3, [r4, #68]	; 0x44
    ec44:	ebfff600 	bl	c44c <__sfp_lock_acquire>
    ec48:	e3a03000 	mov	r3, #0
    ec4c:	e5942064 	ldr	r2, [r4, #100]	; 0x64
    ec50:	e3120001 	tst	r2, #1
    ec54:	e1c430bc 	strh	r3, [r4, #12]
    ec58:	0a00000b 	beq	ec8c <_fclose_r+0x120>
    ec5c:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    ec60:	ebfff959 	bl	d1cc <__retarget_lock_close_recursive>
    ec64:	ebfff5fe 	bl	c464 <__sfp_lock_release>
    ec68:	e1a00005 	mov	r0, r5
    ec6c:	e8bd4070 	pop	{r4, r5, r6, lr}
    ec70:	e12fff1e 	bx	lr
    ec74:	ebfff587 	bl	c298 <__sinit>
    ec78:	eaffffc4 	b	eb90 <_fclose_r+0x24>
    ec7c:	e5941010 	ldr	r1, [r4, #16]
    ec80:	e1a00006 	mov	r0, r6
    ec84:	ebfff6e4 	bl	c81c <_free_r>
    ec88:	eaffffdd 	b	ec04 <_fclose_r+0x98>
    ec8c:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    ec90:	ebfff955 	bl	d1ec <__retarget_lock_release_recursive>
    ec94:	eafffff0 	b	ec5c <_fclose_r+0xf0>
    ec98:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    ec9c:	ebfff94c 	bl	d1d4 <__retarget_lock_acquire_recursive>
    eca0:	e1d430fc 	ldrsh	r3, [r4, #12]
    eca4:	e3530000 	cmp	r3, #0
    eca8:	1affffc5 	bne	ebc4 <_fclose_r+0x58>
    ecac:	e5945064 	ldr	r5, [r4, #100]	; 0x64
    ecb0:	e2155001 	ands	r5, r5, #1
    ecb4:	1affffbb 	bne	eba8 <_fclose_r+0x3c>
    ecb8:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    ecbc:	ebfff94a 	bl	d1ec <__retarget_lock_release_recursive>
    ecc0:	e1a00005 	mov	r0, r5
    ecc4:	e8bd4070 	pop	{r4, r5, r6, lr}
    ecc8:	e12fff1e 	bx	lr

0000eccc <fclose>:
    eccc:	e59f3008 	ldr	r3, [pc, #8]	; ecdc <fclose+0x10>
    ecd0:	e1a01000 	mov	r1, r0
    ecd4:	e5930000 	ldr	r0, [r3]
    ecd8:	eaffffa3 	b	eb6c <_fclose_r>
    ecdc:	0000fb6c 	.word	0x0000fb6c

0000ece0 <_fstat_r>:
    ece0:	e1a0c001 	mov	ip, r1
    ece4:	e3a03000 	mov	r3, #0
    ece8:	e92d4070 	push	{r4, r5, r6, lr}
    ecec:	e59f402c 	ldr	r4, [pc, #44]	; ed20 <_fstat_r+0x40>
    ecf0:	e1a05000 	mov	r5, r0
    ecf4:	e1a01002 	mov	r1, r2
    ecf8:	e1a0000c 	mov	r0, ip
    ecfc:	e5843000 	str	r3, [r4]
    ed00:	eb0000fe 	bl	f100 <_fstat>
    ed04:	e3700001 	cmn	r0, #1
    ed08:	1a000002 	bne	ed18 <_fstat_r+0x38>
    ed0c:	e5943000 	ldr	r3, [r4]
    ed10:	e3530000 	cmp	r3, #0
    ed14:	15853000 	strne	r3, [r5]
    ed18:	e8bd4070 	pop	{r4, r5, r6, lr}
    ed1c:	e12fff1e 	bx	lr
    ed20:	00010598 	.word	0x00010598

0000ed24 <_isatty_r>:
    ed24:	e3a03000 	mov	r3, #0
    ed28:	e92d4070 	push	{r4, r5, r6, lr}
    ed2c:	e59f4028 	ldr	r4, [pc, #40]	; ed5c <_isatty_r+0x38>
    ed30:	e1a05000 	mov	r5, r0
    ed34:	e1a00001 	mov	r0, r1
    ed38:	e5843000 	str	r3, [r4]
    ed3c:	eb0000fb 	bl	f130 <_isatty>
    ed40:	e3700001 	cmn	r0, #1
    ed44:	1a000002 	bne	ed54 <_isatty_r+0x30>
    ed48:	e5943000 	ldr	r3, [r4]
    ed4c:	e3530000 	cmp	r3, #0
    ed50:	15853000 	strne	r3, [r5]
    ed54:	e8bd4070 	pop	{r4, r5, r6, lr}
    ed58:	e12fff1e 	bx	lr
    ed5c:	00010598 	.word	0x00010598

0000ed60 <_lseek_r>:
    ed60:	e92d4070 	push	{r4, r5, r6, lr}
    ed64:	e1a0e001 	mov	lr, r1
    ed68:	e3a0c000 	mov	ip, #0
    ed6c:	e59f4030 	ldr	r4, [pc, #48]	; eda4 <_lseek_r+0x44>
    ed70:	e1a01002 	mov	r1, r2
    ed74:	e1a05000 	mov	r5, r0
    ed78:	e1a02003 	mov	r2, r3
    ed7c:	e1a0000e 	mov	r0, lr
    ed80:	e584c000 	str	ip, [r4]
    ed84:	eb0000f5 	bl	f160 <_lseek>
    ed88:	e3700001 	cmn	r0, #1
    ed8c:	1a000002 	bne	ed9c <_lseek_r+0x3c>
    ed90:	e5943000 	ldr	r3, [r4]
    ed94:	e3530000 	cmp	r3, #0
    ed98:	15853000 	strne	r3, [r5]
    ed9c:	e8bd4070 	pop	{r4, r5, r6, lr}
    eda0:	e12fff1e 	bx	lr
    eda4:	00010598 	.word	0x00010598

0000eda8 <_read_r>:
    eda8:	e92d4070 	push	{r4, r5, r6, lr}
    edac:	e1a0e001 	mov	lr, r1
    edb0:	e3a0c000 	mov	ip, #0
    edb4:	e59f4030 	ldr	r4, [pc, #48]	; edec <_read_r+0x44>
    edb8:	e1a01002 	mov	r1, r2
    edbc:	e1a05000 	mov	r5, r0
    edc0:	e1a02003 	mov	r2, r3
    edc4:	e1a0000e 	mov	r0, lr
    edc8:	e584c000 	str	ip, [r4]
    edcc:	eb0000e9 	bl	f178 <_read>
    edd0:	e3700001 	cmn	r0, #1
    edd4:	1a000002 	bne	ede4 <_read_r+0x3c>
    edd8:	e5943000 	ldr	r3, [r4]
    eddc:	e3530000 	cmp	r3, #0
    ede0:	15853000 	strne	r3, [r5]
    ede4:	e8bd4070 	pop	{r4, r5, r6, lr}
    ede8:	e12fff1e 	bx	lr
    edec:	00010598 	.word	0x00010598

0000edf0 <cleanup_glue>:
    edf0:	e92d4070 	push	{r4, r5, r6, lr}
    edf4:	e1a04001 	mov	r4, r1
    edf8:	e5911000 	ldr	r1, [r1]
    edfc:	e3510000 	cmp	r1, #0
    ee00:	e1a05000 	mov	r5, r0
    ee04:	1bfffff9 	blne	edf0 <cleanup_glue>
    ee08:	e1a01004 	mov	r1, r4
    ee0c:	e1a00005 	mov	r0, r5
    ee10:	ebfff681 	bl	c81c <_free_r>
    ee14:	e8bd4070 	pop	{r4, r5, r6, lr}
    ee18:	e12fff1e 	bx	lr

0000ee1c <_reclaim_reent>:
    ee1c:	e59f30e8 	ldr	r3, [pc, #232]	; ef0c <_reclaim_reent+0xf0>
    ee20:	e5933000 	ldr	r3, [r3]
    ee24:	e1530000 	cmp	r3, r0
    ee28:	012fff1e 	bxeq	lr
    ee2c:	e590304c 	ldr	r3, [r0, #76]	; 0x4c
    ee30:	e3530000 	cmp	r3, #0
    ee34:	e92d4070 	push	{r4, r5, r6, lr}
    ee38:	e1a05000 	mov	r5, r0
    ee3c:	0a00000f 	beq	ee80 <_reclaim_reent+0x64>
    ee40:	e3a06000 	mov	r6, #0
    ee44:	e7931006 	ldr	r1, [r3, r6]
    ee48:	e3510000 	cmp	r1, #0
    ee4c:	0a000005 	beq	ee68 <_reclaim_reent+0x4c>
    ee50:	e5914000 	ldr	r4, [r1]
    ee54:	e1a00005 	mov	r0, r5
    ee58:	ebfff66f 	bl	c81c <_free_r>
    ee5c:	e2541000 	subs	r1, r4, #0
    ee60:	1afffffa 	bne	ee50 <_reclaim_reent+0x34>
    ee64:	e595304c 	ldr	r3, [r5, #76]	; 0x4c
    ee68:	e2866004 	add	r6, r6, #4
    ee6c:	e3560080 	cmp	r6, #128	; 0x80
    ee70:	1afffff3 	bne	ee44 <_reclaim_reent+0x28>
    ee74:	e1a01003 	mov	r1, r3
    ee78:	e1a00005 	mov	r0, r5
    ee7c:	ebfff666 	bl	c81c <_free_r>
    ee80:	e5951040 	ldr	r1, [r5, #64]	; 0x40
    ee84:	e3510000 	cmp	r1, #0
    ee88:	11a00005 	movne	r0, r5
    ee8c:	1bfff662 	blne	c81c <_free_r>
    ee90:	e5951148 	ldr	r1, [r5, #328]	; 0x148
    ee94:	e3510000 	cmp	r1, #0
    ee98:	0a000008 	beq	eec0 <_reclaim_reent+0xa4>
    ee9c:	e2856f53 	add	r6, r5, #332	; 0x14c
    eea0:	e1510006 	cmp	r1, r6
    eea4:	0a000005 	beq	eec0 <_reclaim_reent+0xa4>
    eea8:	e5914000 	ldr	r4, [r1]
    eeac:	e1a00005 	mov	r0, r5
    eeb0:	ebfff659 	bl	c81c <_free_r>
    eeb4:	e1560004 	cmp	r6, r4
    eeb8:	e1a01004 	mov	r1, r4
    eebc:	1afffff9 	bne	eea8 <_reclaim_reent+0x8c>
    eec0:	e5951054 	ldr	r1, [r5, #84]	; 0x54
    eec4:	e3510000 	cmp	r1, #0
    eec8:	11a00005 	movne	r0, r5
    eecc:	1bfff652 	blne	c81c <_free_r>
    eed0:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    eed4:	e3530000 	cmp	r3, #0
    eed8:	1a000001 	bne	eee4 <_reclaim_reent+0xc8>
    eedc:	e8bd4070 	pop	{r4, r5, r6, lr}
    eee0:	e12fff1e 	bx	lr
    eee4:	e595303c 	ldr	r3, [r5, #60]	; 0x3c
    eee8:	e1a00005 	mov	r0, r5
    eeec:	e1a0e00f 	mov	lr, pc
    eef0:	e12fff13 	bx	r3
    eef4:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
    eef8:	e3510000 	cmp	r1, #0
    eefc:	0afffff6 	beq	eedc <_reclaim_reent+0xc0>
    ef00:	e1a00005 	mov	r0, r5
    ef04:	e8bd4070 	pop	{r4, r5, r6, lr}
    ef08:	eaffffb8 	b	edf0 <cleanup_glue>
    ef0c:	0000fb6c 	.word	0x0000fb6c

0000ef10 <__aeabi_uldivmod>:
    ef10:	e3530000 	cmp	r3, #0
    ef14:	03520000 	cmpeq	r2, #0
    ef18:	1a000004 	bne	ef30 <__aeabi_uldivmod+0x20>
    ef1c:	e3510000 	cmp	r1, #0
    ef20:	03500000 	cmpeq	r0, #0
    ef24:	13e01000 	mvnne	r1, #0
    ef28:	13e00000 	mvnne	r0, #0
    ef2c:	eaffecf8 	b	a314 <__aeabi_idiv0>
    ef30:	e24dd008 	sub	sp, sp, #8
    ef34:	e92d6000 	push	{sp, lr}
    ef38:	eb000003 	bl	ef4c <__udivmoddi4>
    ef3c:	e59de004 	ldr	lr, [sp, #4]
    ef40:	e28dd008 	add	sp, sp, #8
    ef44:	e8bd000c 	pop	{r2, r3}
    ef48:	e12fff1e 	bx	lr

0000ef4c <__udivmoddi4>:
    ef4c:	e1510003 	cmp	r1, r3
    ef50:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ef54:	01500002 	cmpeq	r0, r2
    ef58:	e1a04000 	mov	r4, r0
    ef5c:	e1a05001 	mov	r5, r1
    ef60:	e59da028 	ldr	sl, [sp, #40]	; 0x28
    ef64:	33a00000 	movcc	r0, #0
    ef68:	33a01000 	movcc	r1, #0
    ef6c:	3a00003d 	bcc	f068 <__udivmoddi4+0x11c>
    ef70:	e1a00002 	mov	r0, r2
    ef74:	e1a01003 	mov	r1, r3
    ef78:	e1a08002 	mov	r8, r2
    ef7c:	e1a09003 	mov	r9, r3
    ef80:	eb00003c 	bl	f078 <__clzdi2>
    ef84:	e1a01005 	mov	r1, r5
    ef88:	e1a0b000 	mov	fp, r0
    ef8c:	e1a00004 	mov	r0, r4
    ef90:	eb000038 	bl	f078 <__clzdi2>
    ef94:	e04bb000 	sub	fp, fp, r0
    ef98:	e24b2020 	sub	r2, fp, #32
    ef9c:	e1a07b19 	lsl	r7, r9, fp
    efa0:	e1877218 	orr	r7, r7, r8, lsl r2
    efa4:	e26bc020 	rsb	ip, fp, #32
    efa8:	e1877c38 	orr	r7, r7, r8, lsr ip
    efac:	e1550007 	cmp	r5, r7
    efb0:	e1a06b18 	lsl	r6, r8, fp
    efb4:	01540006 	cmpeq	r4, r6
    efb8:	33a00000 	movcc	r0, #0
    efbc:	33a01000 	movcc	r1, #0
    efc0:	3a000005 	bcc	efdc <__udivmoddi4+0x90>
    efc4:	e3a0e001 	mov	lr, #1
    efc8:	e0544006 	subs	r4, r4, r6
    efcc:	e1a0121e 	lsl	r1, lr, r2
    efd0:	e1811c3e 	orr	r1, r1, lr, lsr ip
    efd4:	e0c55007 	sbc	r5, r5, r7
    efd8:	e1a00b1e 	lsl	r0, lr, fp
    efdc:	e35b0000 	cmp	fp, #0
    efe0:	0a000020 	beq	f068 <__udivmoddi4+0x11c>
    efe4:	e1b070a7 	lsrs	r7, r7, #1
    efe8:	e1a06066 	rrx	r6, r6
    efec:	e1a0e00b 	mov	lr, fp
    eff0:	ea000007 	b	f014 <__udivmoddi4+0xc8>
    eff4:	e0544006 	subs	r4, r4, r6
    eff8:	e0c55007 	sbc	r5, r5, r7
    effc:	e0944004 	adds	r4, r4, r4
    f000:	e0a55005 	adc	r5, r5, r5
    f004:	e2944001 	adds	r4, r4, #1
    f008:	e2a55000 	adc	r5, r5, #0
    f00c:	e25ee001 	subs	lr, lr, #1
    f010:	0a000006 	beq	f030 <__udivmoddi4+0xe4>
    f014:	e1550007 	cmp	r5, r7
    f018:	01540006 	cmpeq	r4, r6
    f01c:	2afffff4 	bcs	eff4 <__udivmoddi4+0xa8>
    f020:	e0944004 	adds	r4, r4, r4
    f024:	e0a55005 	adc	r5, r5, r5
    f028:	e25ee001 	subs	lr, lr, #1
    f02c:	1afffff8 	bne	f014 <__udivmoddi4+0xc8>
    f030:	e1a0eb34 	lsr	lr, r4, fp
    f034:	e18eec15 	orr	lr, lr, r5, lsl ip
    f038:	e18ee235 	orr	lr, lr, r5, lsr r2
    f03c:	e0906004 	adds	r6, r0, r4
    f040:	e1a0400e 	mov	r4, lr
    f044:	e0a17005 	adc	r7, r1, r5
    f048:	e1a01b35 	lsr	r1, r5, fp
    f04c:	e1a05001 	mov	r5, r1
    f050:	e1a01b11 	lsl	r1, r1, fp
    f054:	e181121e 	orr	r1, r1, lr, lsl r2
    f058:	e1a00b1e 	lsl	r0, lr, fp
    f05c:	e1811c3e 	orr	r1, r1, lr, lsr ip
    f060:	e0560000 	subs	r0, r6, r0
    f064:	e0c71001 	sbc	r1, r7, r1
    f068:	e35a0000 	cmp	sl, #0
    f06c:	188a0030 	stmne	sl, {r4, r5}
    f070:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    f074:	e12fff1e 	bx	lr

0000f078 <__clzdi2>:
    f078:	e92d4010 	push	{r4, lr}
    f07c:	e3510000 	cmp	r1, #0
    f080:	1a000002 	bne	f090 <__clzdi2+0x18>
    f084:	eb000005 	bl	f0a0 <__clzsi2>
    f088:	e2800020 	add	r0, r0, #32
    f08c:	ea000001 	b	f098 <__clzdi2+0x20>
    f090:	e1a00001 	mov	r0, r1
    f094:	eb000001 	bl	f0a0 <__clzsi2>
    f098:	e8bd4010 	pop	{r4, lr}
    f09c:	e12fff1e 	bx	lr

0000f0a0 <__clzsi2>:
    f0a0:	e3a0101c 	mov	r1, #28
    f0a4:	e3500801 	cmp	r0, #65536	; 0x10000
    f0a8:	21a00820 	lsrcs	r0, r0, #16
    f0ac:	22411010 	subcs	r1, r1, #16
    f0b0:	e3500c01 	cmp	r0, #256	; 0x100
    f0b4:	21a00420 	lsrcs	r0, r0, #8
    f0b8:	22411008 	subcs	r1, r1, #8
    f0bc:	e3500010 	cmp	r0, #16
    f0c0:	21a00220 	lsrcs	r0, r0, #4
    f0c4:	22411004 	subcs	r1, r1, #4
    f0c8:	e28f2008 	add	r2, pc, #8
    f0cc:	e7d20000 	ldrb	r0, [r2, r0]
    f0d0:	e0800001 	add	r0, r0, r1
    f0d4:	e12fff1e 	bx	lr
    f0d8:	02020304 	.word	0x02020304
    f0dc:	01010101 	.word	0x01010101
	...

0000f0e8 <_close>:
    f0e8:	e3a02058 	mov	r2, #88	; 0x58
    f0ec:	e59f3008 	ldr	r3, [pc, #8]	; f0fc <_close+0x14>
    f0f0:	e3e00000 	mvn	r0, #0
    f0f4:	e5832000 	str	r2, [r3]
    f0f8:	e12fff1e 	bx	lr
    f0fc:	00010598 	.word	0x00010598

0000f100 <_fstat>:
    f100:	e3a02058 	mov	r2, #88	; 0x58
    f104:	e59f3008 	ldr	r3, [pc, #8]	; f114 <_fstat+0x14>
    f108:	e3e00000 	mvn	r0, #0
    f10c:	e5832000 	str	r2, [r3]
    f110:	e12fff1e 	bx	lr
    f114:	00010598 	.word	0x00010598

0000f118 <_getpid>:
    f118:	e3a02058 	mov	r2, #88	; 0x58
    f11c:	e59f3008 	ldr	r3, [pc, #8]	; f12c <_getpid+0x14>
    f120:	e3e00000 	mvn	r0, #0
    f124:	e5832000 	str	r2, [r3]
    f128:	e12fff1e 	bx	lr
    f12c:	00010598 	.word	0x00010598

0000f130 <_isatty>:
    f130:	e3a02058 	mov	r2, #88	; 0x58
    f134:	e59f3008 	ldr	r3, [pc, #8]	; f144 <_isatty+0x14>
    f138:	e3a00000 	mov	r0, #0
    f13c:	e5832000 	str	r2, [r3]
    f140:	e12fff1e 	bx	lr
    f144:	00010598 	.word	0x00010598

0000f148 <_kill>:
    f148:	e3a02058 	mov	r2, #88	; 0x58
    f14c:	e59f3008 	ldr	r3, [pc, #8]	; f15c <_kill+0x14>
    f150:	e3e00000 	mvn	r0, #0
    f154:	e5832000 	str	r2, [r3]
    f158:	e12fff1e 	bx	lr
    f15c:	00010598 	.word	0x00010598

0000f160 <_lseek>:
    f160:	e3a02058 	mov	r2, #88	; 0x58
    f164:	e59f3008 	ldr	r3, [pc, #8]	; f174 <_lseek+0x14>
    f168:	e3e00000 	mvn	r0, #0
    f16c:	e5832000 	str	r2, [r3]
    f170:	e12fff1e 	bx	lr
    f174:	00010598 	.word	0x00010598

0000f178 <_read>:
    f178:	e3a02058 	mov	r2, #88	; 0x58
    f17c:	e59f3008 	ldr	r3, [pc, #8]	; f18c <_read+0x14>
    f180:	e3e00000 	mvn	r0, #0
    f184:	e5832000 	str	r2, [r3]
    f188:	e12fff1e 	bx	lr
    f18c:	00010598 	.word	0x00010598

0000f190 <_sbrk>:
    f190:	e59f201c 	ldr	r2, [pc, #28]	; f1b4 <_sbrk+0x24>
    f194:	e5923000 	ldr	r3, [r2]
    f198:	e59f1018 	ldr	r1, [pc, #24]	; f1b8 <_sbrk+0x28>
    f19c:	e3530000 	cmp	r3, #0
    f1a0:	01a03001 	moveq	r3, r1
    f1a4:	e0830000 	add	r0, r3, r0
    f1a8:	e5820000 	str	r0, [r2]
    f1ac:	e1a00003 	mov	r0, r3
    f1b0:	e12fff1e 	bx	lr
    f1b4:	00010570 	.word	0x00010570
    f1b8:	0001059c 	.word	0x0001059c

0000f1bc <_write>:
    f1bc:	e3a02058 	mov	r2, #88	; 0x58
    f1c0:	e59f3008 	ldr	r3, [pc, #8]	; f1d0 <_write+0x14>
    f1c4:	e3e00000 	mvn	r0, #0
    f1c8:	e5832000 	str	r2, [r3]
    f1cc:	e12fff1e 	bx	lr
    f1d0:	00010598 	.word	0x00010598

0000f1d4 <_exit>:
    f1d4:	eafffffe 	b	f1d4 <_exit>

Disassembly of section .fini:

0000f1d8 <_fini>:
    f1d8:	e1a0c00d 	mov	ip, sp
    f1dc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
    f1e0:	e24cb004 	sub	fp, ip, #4
    f1e4:	e24bd028 	sub	sp, fp, #40	; 0x28
    f1e8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
    f1ec:	e12fff1e 	bx	lr
