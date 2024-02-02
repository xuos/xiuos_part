
fs_server:     file format elf32-littlearm


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
    804c:	00013f14 	.word	0x00013f14
    8050:	00000000 	.word	0x00000000
    8054:	00013140 	.word	0x00013140

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
    80c4:	00013140 	.word	0x00013140
    80c8:	00013f18 	.word	0x00013f18
    80cc:	0001314c 	.word	0x0001314c
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
    8164:	eb00163c 	bl	da5c <memset>
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
    81b4:	eb001571 	bl	d780 <__libc_init_array>
    81b8:	e1b00004 	movs	r0, r4
    81bc:	e1b01005 	movs	r1, r5
    81c0:	eb0004eb 	bl	9574 <main>
    81c4:	eb0013cd 	bl	d100 <exit>
    81c8:	00080000 	.word	0x00080000
	...
    81d8:	00013f14 	.word	0x00013f14
    81dc:	0003c1a8 	.word	0x0003c1a8
	...

000081e8 <get_session_cwd>:

#define MAX_SUPPORT_SESSION 1024
static struct CwdPair session_cwd[MAX_SUPPORT_SESSION];

static struct CwdPair* get_session_cwd(void)
{
    81e8:	e92d4810 	push	{r4, fp, lr}
    81ec:	e28db008 	add	fp, sp, #8
    81f0:	e24dd00c 	sub	sp, sp, #12
    int free_idx = -1;
    81f4:	e3e03000 	mvn	r3, #0
    81f8:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < MAX_SUPPORT_SESSION; i++) {
    81fc:	e3a03000 	mov	r3, #0
    8200:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8204:	ea00001b 	b	8278 <get_session_cwd+0x90>
        // found session cwd
        if (session_cwd[i].session_id == cur_session_id()) {
    8208:	e3033f30 	movw	r3, #16176	; 0x3f30
    820c:	e3403001 	movt	r3, #1
    8210:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8214:	e7934182 	ldr	r4, [r3, r2, lsl #3]
    8218:	eb0010ba 	bl	c508 <cur_session_id>
    821c:	e1a03000 	mov	r3, r0
    8220:	e1540003 	cmp	r4, r3
    8224:	1a000005 	bne	8240 <get_session_cwd+0x58>
            return &session_cwd[i];
    8228:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    822c:	e1a02183 	lsl	r2, r3, #3
    8230:	e3033f30 	movw	r3, #16176	; 0x3f30
    8234:	e3403001 	movt	r3, #1
    8238:	e0823003 	add	r3, r2, r3
    823c:	ea00002c 	b	82f4 <get_session_cwd+0x10c>
        }
        if (free_idx == -1 && session_cwd[i].session_id == 0) {
    8240:	e51b3010 	ldr	r3, [fp, #-16]
    8244:	e3730001 	cmn	r3, #1
    8248:	1a000007 	bne	826c <get_session_cwd+0x84>
    824c:	e3033f30 	movw	r3, #16176	; 0x3f30
    8250:	e3403001 	movt	r3, #1
    8254:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    8258:	e7933182 	ldr	r3, [r3, r2, lsl #3]
    825c:	e3530000 	cmp	r3, #0
    8260:	1a000001 	bne	826c <get_session_cwd+0x84>
            free_idx = i;
    8264:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8268:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < MAX_SUPPORT_SESSION; i++) {
    826c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8270:	e2833001 	add	r3, r3, #1
    8274:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8278:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    827c:	e3530b01 	cmp	r3, #1024	; 0x400
    8280:	baffffe0 	blt	8208 <get_session_cwd+0x20>
        }
    }
    // new a cwd pair for session
    if (free_idx == -1) {
    8284:	e51b3010 	ldr	r3, [fp, #-16]
    8288:	e3730001 	cmn	r3, #1
    828c:	1a000004 	bne	82a4 <get_session_cwd+0xbc>
        printf("Connect Session reaches max value.\n");
    8290:	e3020774 	movw	r0, #10100	; 0x2774
    8294:	e3400001 	movt	r0, #1
    8298:	eb000eb8 	bl	bd80 <printf>
        return NULL;
    829c:	e3a03000 	mov	r3, #0
    82a0:	ea000013 	b	82f4 <get_session_cwd+0x10c>
    }
    session_cwd[free_idx].session_id = cur_session_id();
    82a4:	eb001097 	bl	c508 <cur_session_id>
    82a8:	e1a01000 	mov	r1, r0
    82ac:	e3033f30 	movw	r3, #16176	; 0x3f30
    82b0:	e3403001 	movt	r3, #1
    82b4:	e51b2010 	ldr	r2, [fp, #-16]
    82b8:	e7831182 	str	r1, [r3, r2, lsl #3]
    session_cwd[free_idx].Inode = InodeGet(ROOT_INUM);
    82bc:	e3a00001 	mov	r0, #1
    82c0:	eb000a26 	bl	ab60 <InodeGet>
    82c4:	e1a01000 	mov	r1, r0
    82c8:	e3032f30 	movw	r2, #16176	; 0x3f30
    82cc:	e3402001 	movt	r2, #1
    82d0:	e51b3010 	ldr	r3, [fp, #-16]
    82d4:	e1a03183 	lsl	r3, r3, #3
    82d8:	e0823003 	add	r3, r2, r3
    82dc:	e5831004 	str	r1, [r3, #4]
    return &session_cwd[free_idx];
    82e0:	e51b3010 	ldr	r3, [fp, #-16]
    82e4:	e1a02183 	lsl	r2, r3, #3
    82e8:	e3033f30 	movw	r3, #16176	; 0x3f30
    82ec:	e3403001 	movt	r3, #1
    82f0:	e0823003 	add	r3, r2, r3
}
    82f4:	e1a00003 	mov	r0, r3
    82f8:	e24bd008 	sub	sp, fp, #8
    82fc:	e8bd8810 	pop	{r4, fp, pc}

00008300 <ipc_do_serve_Ipc_ls>:

int IPC_DO_SERVE_FUNC(Ipc_ls)(char* path)
{
    8300:	e92d4800 	push	{fp, lr}
    8304:	e28db004 	add	fp, sp, #4
    8308:	e24dd028 	sub	sp, sp, #40	; 0x28
    830c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    struct Inode *dp, *ip;
    if (*path == '/') {
    8310:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8314:	e5d33000 	ldrb	r3, [r3]
    8318:	e353002f 	cmp	r3, #47	; 0x2f
    831c:	1a000003 	bne	8330 <ipc_do_serve_Ipc_ls+0x30>
        dp = InodeGet(ROOT_INUM);
    8320:	e3a00001 	mov	r0, #1
    8324:	eb000a0d 	bl	ab60 <InodeGet>
    8328:	e50b0008 	str	r0, [fp, #-8]
    832c:	ea00000c 	b	8364 <ipc_do_serve_Ipc_ls+0x64>
    } else {
        struct CwdPair* cwd = get_session_cwd();
    8330:	ebffffac 	bl	81e8 <get_session_cwd>
    8334:	e50b0010 	str	r0, [fp, #-16]
        if (!cwd) {
    8338:	e51b3010 	ldr	r3, [fp, #-16]
    833c:	e3530000 	cmp	r3, #0
    8340:	1a000004 	bne	8358 <ipc_do_serve_Ipc_ls+0x58>
            printf("ls:find current work dir failed\n");
    8344:	e3020798 	movw	r0, #10136	; 0x2798
    8348:	e3400001 	movt	r0, #1
    834c:	eb000e8b 	bl	bd80 <printf>
            return -1;
    8350:	e3e03000 	mvn	r3, #0
    8354:	ea00003b 	b	8448 <ipc_do_serve_Ipc_ls+0x148>
        }
        dp = cwd->Inode;
    8358:	e51b3010 	ldr	r3, [fp, #-16]
    835c:	e5933004 	ldr	r3, [r3, #4]
    8360:	e50b3008 	str	r3, [fp, #-8]
    }

    if (!(ip = InodeSeek(dp, path))) {
    8364:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    8368:	e51b0008 	ldr	r0, [fp, #-8]
    836c:	eb000c61 	bl	b4f8 <InodeSeek>
    8370:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    8374:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8378:	e3530000 	cmp	r3, #0
    837c:	1a000004 	bne	8394 <ipc_do_serve_Ipc_ls+0x94>
        printf("ls:find target Inode failed\n");
    8380:	e30207bc 	movw	r0, #10172	; 0x27bc
    8384:	e3400001 	movt	r0, #1
    8388:	eb000e7c 	bl	bd80 <printf>
        return -1;
    838c:	e3e03000 	mvn	r3, #0
    8390:	ea00002c 	b	8448 <ipc_do_serve_Ipc_ls+0x148>
    }
    if (ip->type != T_DIR) {
    8394:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8398:	e1d330f4 	ldrsh	r3, [r3, #4]
    839c:	e3530001 	cmp	r3, #1
    83a0:	0a000004 	beq	83b8 <ipc_do_serve_Ipc_ls+0xb8>
        printf("ls:not a dir\n");
    83a4:	e30207dc 	movw	r0, #10204	; 0x27dc
    83a8:	e3400001 	movt	r0, #1
    83ac:	eb000e73 	bl	bd80 <printf>
        return -1;
    83b0:	e3e03000 	mvn	r3, #0
    83b4:	ea000023 	b	8448 <ipc_do_serve_Ipc_ls+0x148>
    }

    uint32_t off;
    struct DirectEntry de;
    for (off = 0; off < ip->size; off += sizeof(de)) {
    83b8:	e3a03000 	mov	r3, #0
    83bc:	e50b300c 	str	r3, [fp, #-12]
    83c0:	ea00001a 	b	8430 <ipc_do_serve_Ipc_ls+0x130>
        if (InodeRead(ip, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    83c4:	e51b200c 	ldr	r2, [fp, #-12]
    83c8:	e24b1024 	sub	r1, fp, #36	; 0x24
    83cc:	e3a03010 	mov	r3, #16
    83d0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    83d4:	eb000c6a 	bl	b584 <InodeRead>
    83d8:	e1a03000 	mov	r3, r0
    83dc:	e3530010 	cmp	r3, #16
    83e0:	0a000004 	beq	83f8 <ipc_do_serve_Ipc_ls+0xf8>
            printf("ls:read dir entry failed\n");
    83e4:	e30207ec 	movw	r0, #10220	; 0x27ec
    83e8:	e3400001 	movt	r0, #1
    83ec:	eb000e63 	bl	bd80 <printf>
            return -1;
    83f0:	e3e03000 	mvn	r3, #0
    83f4:	ea000013 	b	8448 <ipc_do_serve_Ipc_ls+0x148>
        }
        if (de.inum == 0) {
    83f8:	e15b32b4 	ldrh	r3, [fp, #-36]	; 0xffffffdc
    83fc:	e3530000 	cmp	r3, #0
    8400:	0a000006 	beq	8420 <ipc_do_serve_Ipc_ls+0x120>
            continue;
        }
        printf("%s\n", de.name);
    8404:	e24b3024 	sub	r3, fp, #36	; 0x24
    8408:	e2833002 	add	r3, r3, #2
    840c:	e1a01003 	mov	r1, r3
    8410:	e3020808 	movw	r0, #10248	; 0x2808
    8414:	e3400001 	movt	r0, #1
    8418:	eb000e58 	bl	bd80 <printf>
    841c:	ea000000 	b	8424 <ipc_do_serve_Ipc_ls+0x124>
            continue;
    8420:	e320f000 	nop	{0}
    for (off = 0; off < ip->size; off += sizeof(de)) {
    8424:	e51b300c 	ldr	r3, [fp, #-12]
    8428:	e2833010 	add	r3, r3, #16
    842c:	e50b300c 	str	r3, [fp, #-12]
    8430:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8434:	e5932008 	ldr	r2, [r3, #8]
    8438:	e51b300c 	ldr	r3, [fp, #-12]
    843c:	e1520003 	cmp	r2, r3
    8440:	8affffdf 	bhi	83c4 <ipc_do_serve_Ipc_ls+0xc4>
    }

    return 0;
    8444:	e3a03000 	mov	r3, #0
}
    8448:	e1a00003 	mov	r0, r3
    844c:	e24bd004 	sub	sp, fp, #4
    8450:	e8bd8800 	pop	{fp, pc}

00008454 <ipc_do_serve_Ipc_cd>:

int IPC_DO_SERVE_FUNC(Ipc_cd)(char* path)
{
    8454:	e92d4800 	push	{fp, lr}
    8458:	e28db004 	add	fp, sp, #4
    845c:	e24dd018 	sub	sp, sp, #24
    8460:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    struct CwdPair* cwd;
    struct Inode *dp, *ip;

    cwd = get_session_cwd();
    8464:	ebffff5f 	bl	81e8 <get_session_cwd>
    8468:	e50b000c 	str	r0, [fp, #-12]
    if (!cwd) {
    846c:	e51b300c 	ldr	r3, [fp, #-12]
    8470:	e3530000 	cmp	r3, #0
    8474:	1a000004 	bne	848c <ipc_do_serve_Ipc_cd+0x38>
        printf("cd:find current work dir failed\n");
    8478:	e302080c 	movw	r0, #10252	; 0x280c
    847c:	e3400001 	movt	r0, #1
    8480:	eb000e3e 	bl	bd80 <printf>
        return -1;
    8484:	e3e03000 	mvn	r3, #0
    8488:	ea000023 	b	851c <ipc_do_serve_Ipc_cd+0xc8>
    }

    if (*path == '/') {
    848c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8490:	e5d33000 	ldrb	r3, [r3]
    8494:	e353002f 	cmp	r3, #47	; 0x2f
    8498:	1a000003 	bne	84ac <ipc_do_serve_Ipc_cd+0x58>
        dp = InodeGet(ROOT_INUM);
    849c:	e3a00001 	mov	r0, #1
    84a0:	eb0009ae 	bl	ab60 <InodeGet>
    84a4:	e50b0008 	str	r0, [fp, #-8]
    84a8:	ea000002 	b	84b8 <ipc_do_serve_Ipc_cd+0x64>
    } else {
        dp = cwd->Inode;
    84ac:	e51b300c 	ldr	r3, [fp, #-12]
    84b0:	e5933004 	ldr	r3, [r3, #4]
    84b4:	e50b3008 	str	r3, [fp, #-8]
    }

    if (!(ip = InodeSeek(dp, path))) {
    84b8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    84bc:	e51b0008 	ldr	r0, [fp, #-8]
    84c0:	eb000c0c 	bl	b4f8 <InodeSeek>
    84c4:	e50b0010 	str	r0, [fp, #-16]
    84c8:	e51b3010 	ldr	r3, [fp, #-16]
    84cc:	e3530000 	cmp	r3, #0
    84d0:	1a000004 	bne	84e8 <ipc_do_serve_Ipc_cd+0x94>
        /// @todo Is need to create the Inode when the dir is node existed?
        printf("cd:find target Inode failed\n");
    84d4:	e3020830 	movw	r0, #10288	; 0x2830
    84d8:	e3400001 	movt	r0, #1
    84dc:	eb000e27 	bl	bd80 <printf>
        return -1;
    84e0:	e3e03000 	mvn	r3, #0
    84e4:	ea00000c 	b	851c <ipc_do_serve_Ipc_cd+0xc8>
    }

    if (ip->type != T_DIR) {
    84e8:	e51b3010 	ldr	r3, [fp, #-16]
    84ec:	e1d330f4 	ldrsh	r3, [r3, #4]
    84f0:	e3530001 	cmp	r3, #1
    84f4:	0a000004 	beq	850c <ipc_do_serve_Ipc_cd+0xb8>
        printf("cd:not a dir\n");
    84f8:	e3020850 	movw	r0, #10320	; 0x2850
    84fc:	e3400001 	movt	r0, #1
    8500:	eb000e1e 	bl	bd80 <printf>
        return -1;
    8504:	e3e03000 	mvn	r3, #0
    8508:	ea000003 	b	851c <ipc_do_serve_Ipc_cd+0xc8>
    }

    cwd->Inode = ip;
    850c:	e51b300c 	ldr	r3, [fp, #-12]
    8510:	e51b2010 	ldr	r2, [fp, #-16]
    8514:	e5832004 	str	r2, [r3, #4]

    return 0;
    8518:	e3a03000 	mov	r3, #0
}
    851c:	e1a00003 	mov	r0, r3
    8520:	e24bd004 	sub	sp, fp, #4
    8524:	e8bd8800 	pop	{fp, pc}

00008528 <ipc_do_serve_Ipc_mkdir>:

int IPC_DO_SERVE_FUNC(Ipc_mkdir)(char* path)
{
    8528:	e92d4800 	push	{fp, lr}
    852c:	e28db004 	add	fp, sp, #4
    8530:	e24dd030 	sub	sp, sp, #48	; 0x30
    8534:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    // printf("Create a new directory: %s\n", path);
    struct Inode *dp, *ip;
    if (*path == '/') {
    8538:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    853c:	e5d33000 	ldrb	r3, [r3]
    8540:	e353002f 	cmp	r3, #47	; 0x2f
    8544:	1a000003 	bne	8558 <ipc_do_serve_Ipc_mkdir+0x30>
        dp = InodeGet(ROOT_INUM);
    8548:	e3a00001 	mov	r0, #1
    854c:	eb000983 	bl	ab60 <InodeGet>
    8550:	e50b0008 	str	r0, [fp, #-8]
    8554:	ea00000c 	b	858c <ipc_do_serve_Ipc_mkdir+0x64>
    } else {
        struct CwdPair* cwd = get_session_cwd();
    8558:	ebffff22 	bl	81e8 <get_session_cwd>
    855c:	e50b000c 	str	r0, [fp, #-12]
        if (!cwd) {
    8560:	e51b300c 	ldr	r3, [fp, #-12]
    8564:	e3530000 	cmp	r3, #0
    8568:	1a000004 	bne	8580 <ipc_do_serve_Ipc_mkdir+0x58>
            printf("find current work dir failed\n");
    856c:	e3020860 	movw	r0, #10336	; 0x2860
    8570:	e3400001 	movt	r0, #1
    8574:	eb000e01 	bl	bd80 <printf>
            return -1;
    8578:	e3e03000 	mvn	r3, #0
    857c:	ea000033 	b	8650 <ipc_do_serve_Ipc_mkdir+0x128>
        }
        dp = cwd->Inode;
    8580:	e51b300c 	ldr	r3, [fp, #-12]
    8584:	e5933004 	ldr	r3, [r3, #4]
    8588:	e50b3008 	str	r3, [fp, #-8]
    }

    if ((ip = InodeSeek(dp, path)) != NULL) {
    858c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    8590:	e51b0008 	ldr	r0, [fp, #-8]
    8594:	eb000bd7 	bl	b4f8 <InodeSeek>
    8598:	e50b0010 	str	r0, [fp, #-16]
    859c:	e51b3010 	ldr	r3, [fp, #-16]
    85a0:	e3530000 	cmp	r3, #0
    85a4:	0a000004 	beq	85bc <ipc_do_serve_Ipc_mkdir+0x94>
        /// @todo Is need to return target Inode?
        printf("target Inode existed\n");
    85a8:	e3020880 	movw	r0, #10368	; 0x2880
    85ac:	e3400001 	movt	r0, #1
    85b0:	eb000df2 	bl	bd80 <printf>
        return -1;
    85b4:	e3e03000 	mvn	r3, #0
    85b8:	ea000024 	b	8650 <ipc_do_serve_Ipc_mkdir+0x128>
    }

    char name[DIR_NAME_SIZE] = { 0 };
    85bc:	e24b3020 	sub	r3, fp, #32
    85c0:	e3a02000 	mov	r2, #0
    85c4:	e5832000 	str	r2, [r3]
    85c8:	e5832004 	str	r2, [r3, #4]
    85cc:	e5832008 	str	r2, [r3, #8]
    85d0:	e1c320bc 	strh	r2, [r3, #12]
    if (!(ip = InodeParentSeek(dp, path, name))) {
    85d4:	e24b3020 	sub	r3, fp, #32
    85d8:	e1a02003 	mov	r2, r3
    85dc:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    85e0:	e51b0008 	ldr	r0, [fp, #-8]
    85e4:	eb000bd7 	bl	b548 <InodeParentSeek>
    85e8:	e50b0010 	str	r0, [fp, #-16]
    85ec:	e51b3010 	ldr	r3, [fp, #-16]
    85f0:	e3530000 	cmp	r3, #0
    85f4:	1a000004 	bne	860c <ipc_do_serve_Ipc_mkdir+0xe4>
        /// @todo Is need to return target Inode?
        printf("target parent Inode is not existed\n");
    85f8:	e3020898 	movw	r0, #10392	; 0x2898
    85fc:	e3400001 	movt	r0, #1
    8600:	eb000dde 	bl	bd80 <printf>
        return -1;
    8604:	e3e03000 	mvn	r3, #0
    8608:	ea000010 	b	8650 <ipc_do_serve_Ipc_mkdir+0x128>
    }

    if (InodeCreate(ip, name, T_DIR, 0, 0) == 0) {
    860c:	e24b1020 	sub	r1, fp, #32
    8610:	e3a03000 	mov	r3, #0
    8614:	e58d3000 	str	r3, [sp]
    8618:	e3a03000 	mov	r3, #0
    861c:	e3a02001 	mov	r2, #1
    8620:	e51b0010 	ldr	r0, [fp, #-16]
    8624:	eb000a40 	bl	af2c <InodeCreate>
    8628:	e1a03000 	mov	r3, r0
    862c:	e3530000 	cmp	r3, #0
    8630:	1a000005 	bne	864c <ipc_do_serve_Ipc_mkdir+0x124>
        printf("create target Inode %s failed\n", path);
    8634:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    8638:	e30208bc 	movw	r0, #10428	; 0x28bc
    863c:	e3400001 	movt	r0, #1
    8640:	eb000dce 	bl	bd80 <printf>
        return -1;
    8644:	e3e03000 	mvn	r3, #0
    8648:	ea000000 	b	8650 <ipc_do_serve_Ipc_mkdir+0x128>
    }

    return 0;
    864c:	e3a03000 	mov	r3, #0
}
    8650:	e1a00003 	mov	r0, r3
    8654:	e24bd004 	sub	sp, fp, #4
    8658:	e8bd8800 	pop	{fp, pc}

0000865c <ipc_do_serve_Ipc_delete>:

int IPC_DO_SERVE_FUNC(Ipc_delete)(char* path)
{
    865c:	e92d4800 	push	{fp, lr}
    8660:	e28db004 	add	fp, sp, #4
    8664:	e24dd028 	sub	sp, sp, #40	; 0x28
    8668:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    struct Inode *dp, *ip;
    if (*path == '/') {
    866c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8670:	e5d33000 	ldrb	r3, [r3]
    8674:	e353002f 	cmp	r3, #47	; 0x2f
    8678:	1a000003 	bne	868c <ipc_do_serve_Ipc_delete+0x30>
        dp = InodeGet(ROOT_INUM);
    867c:	e3a00001 	mov	r0, #1
    8680:	eb000936 	bl	ab60 <InodeGet>
    8684:	e50b0008 	str	r0, [fp, #-8]
    8688:	ea00000c 	b	86c0 <ipc_do_serve_Ipc_delete+0x64>
    } else {
        struct CwdPair* cwd = get_session_cwd();
    868c:	ebfffed5 	bl	81e8 <get_session_cwd>
    8690:	e50b000c 	str	r0, [fp, #-12]
        if (!cwd) {
    8694:	e51b300c 	ldr	r3, [fp, #-12]
    8698:	e3530000 	cmp	r3, #0
    869c:	1a000004 	bne	86b4 <ipc_do_serve_Ipc_delete+0x58>
            printf("delete:find current work dir failed\n");
    86a0:	e30208dc 	movw	r0, #10460	; 0x28dc
    86a4:	e3400001 	movt	r0, #1
    86a8:	eb000db4 	bl	bd80 <printf>
            return -1;
    86ac:	e3e03000 	mvn	r3, #0
    86b0:	ea000023 	b	8744 <ipc_do_serve_Ipc_delete+0xe8>
        }
        dp = cwd->Inode;
    86b4:	e51b300c 	ldr	r3, [fp, #-12]
    86b8:	e5933004 	ldr	r3, [r3, #4]
    86bc:	e50b3008 	str	r3, [fp, #-8]
    }

    char name[DIR_NAME_SIZE] = { 0 };
    86c0:	e24b3020 	sub	r3, fp, #32
    86c4:	e3a02000 	mov	r2, #0
    86c8:	e5832000 	str	r2, [r3]
    86cc:	e5832004 	str	r2, [r3, #4]
    86d0:	e5832008 	str	r2, [r3, #8]
    86d4:	e1c320bc 	strh	r2, [r3, #12]
    if (!(ip = InodeParentSeek(dp, path, name))) {
    86d8:	e24b3020 	sub	r3, fp, #32
    86dc:	e1a02003 	mov	r2, r3
    86e0:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    86e4:	e51b0008 	ldr	r0, [fp, #-8]
    86e8:	eb000b96 	bl	b548 <InodeParentSeek>
    86ec:	e50b0010 	str	r0, [fp, #-16]
    86f0:	e51b3010 	ldr	r3, [fp, #-16]
    86f4:	e3530000 	cmp	r3, #0
    86f8:	1a000004 	bne	8710 <ipc_do_serve_Ipc_delete+0xb4>
        printf("delete:target file parent not existed\n");
    86fc:	e3020904 	movw	r0, #10500	; 0x2904
    8700:	e3400001 	movt	r0, #1
    8704:	eb000d9d 	bl	bd80 <printf>
        return -1;
    8708:	e3e03000 	mvn	r3, #0
    870c:	ea00000c 	b	8744 <ipc_do_serve_Ipc_delete+0xe8>
    }

    if (InodeDelete(ip, name) < 0) {
    8710:	e24b3020 	sub	r3, fp, #32
    8714:	e1a01003 	mov	r1, r3
    8718:	e51b0010 	ldr	r0, [fp, #-16]
    871c:	eb0009cf 	bl	ae60 <InodeDelete>
    8720:	e1a03000 	mov	r3, r0
    8724:	e3530000 	cmp	r3, #0
    8728:	aa000004 	bge	8740 <ipc_do_serve_Ipc_delete+0xe4>
        printf("delete:target file not existed\n");
    872c:	e302092c 	movw	r0, #10540	; 0x292c
    8730:	e3400001 	movt	r0, #1
    8734:	eb000d91 	bl	bd80 <printf>
        return -1;
    8738:	e3e03000 	mvn	r3, #0
    873c:	ea000000 	b	8744 <ipc_do_serve_Ipc_delete+0xe8>
    }

    return 0;
    8740:	e3a03000 	mov	r3, #0
}
    8744:	e1a00003 	mov	r0, r3
    8748:	e24bd004 	sub	sp, fp, #4
    874c:	e8bd8800 	pop	{fp, pc}

00008750 <ipc_do_serve_Ipc_cat>:

/// @todo Support malloc for user
int IPC_DO_SERVE_FUNC(Ipc_cat)(char* path)
{
    8750:	e92d4800 	push	{fp, lr}
    8754:	e28db004 	add	fp, sp, #4
    8758:	e24dd018 	sub	sp, sp, #24
    875c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    static char buffer[BLOCK_SIZE + 1] = { 0 };
    buffer[BLOCK_SIZE] = '\0';
    8760:	e3053f30 	movw	r3, #24368	; 0x5f30
    8764:	e3403001 	movt	r3, #1
    8768:	e3a02000 	mov	r2, #0
    876c:	e5c32200 	strb	r2, [r3, #512]	; 0x200

    struct Inode *dp, *ip;
    if (*path == '/') {
    8770:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8774:	e5d33000 	ldrb	r3, [r3]
    8778:	e353002f 	cmp	r3, #47	; 0x2f
    877c:	1a000003 	bne	8790 <ipc_do_serve_Ipc_cat+0x40>
        dp = InodeGet(ROOT_INUM);
    8780:	e3a00001 	mov	r0, #1
    8784:	eb0008f5 	bl	ab60 <InodeGet>
    8788:	e50b0008 	str	r0, [fp, #-8]
    878c:	ea00000c 	b	87c4 <ipc_do_serve_Ipc_cat+0x74>
    } else {
        struct CwdPair* cwd = get_session_cwd();
    8790:	ebfffe94 	bl	81e8 <get_session_cwd>
    8794:	e50b0010 	str	r0, [fp, #-16]
        if (!cwd) {
    8798:	e51b3010 	ldr	r3, [fp, #-16]
    879c:	e3530000 	cmp	r3, #0
    87a0:	1a000004 	bne	87b8 <ipc_do_serve_Ipc_cat+0x68>
            printf("delete:find current work dir failed\n");
    87a4:	e30208dc 	movw	r0, #10460	; 0x28dc
    87a8:	e3400001 	movt	r0, #1
    87ac:	eb000d73 	bl	bd80 <printf>
            return -1;
    87b0:	e3e03000 	mvn	r3, #0
    87b4:	ea000036 	b	8894 <ipc_do_serve_Ipc_cat+0x144>
        }
        dp = cwd->Inode;
    87b8:	e51b3010 	ldr	r3, [fp, #-16]
    87bc:	e5933004 	ldr	r3, [r3, #4]
    87c0:	e50b3008 	str	r3, [fp, #-8]
    }

    if (!(ip = InodeSeek(dp, path))) {
    87c4:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    87c8:	e51b0008 	ldr	r0, [fp, #-8]
    87cc:	eb000b49 	bl	b4f8 <InodeSeek>
    87d0:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    87d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87d8:	e3530000 	cmp	r3, #0
    87dc:	1a000004 	bne	87f4 <ipc_do_serve_Ipc_cat+0xa4>
        printf("delete:target file not existed\n");
    87e0:	e302092c 	movw	r0, #10540	; 0x292c
    87e4:	e3400001 	movt	r0, #1
    87e8:	eb000d64 	bl	bd80 <printf>
        return -1;
    87ec:	e3e03000 	mvn	r3, #0
    87f0:	ea000027 	b	8894 <ipc_do_serve_Ipc_cat+0x144>
    }

    if (ip->type != T_FILE) {
    87f4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    87f8:	e1d330f4 	ldrsh	r3, [r3, #4]
    87fc:	e3530002 	cmp	r3, #2
    8800:	0a000005 	beq	881c <ipc_do_serve_Ipc_cat+0xcc>
        printf("cat: %s Is not a file\n", path);
    8804:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8808:	e302094c 	movw	r0, #10572	; 0x294c
    880c:	e3400001 	movt	r0, #1
    8810:	eb000d5a 	bl	bd80 <printf>
        return -1;
    8814:	e3e03000 	mvn	r3, #0
    8818:	ea00001d 	b	8894 <ipc_do_serve_Ipc_cat+0x144>
    }

    uint32_t off;
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
    881c:	e3a03000 	mov	r3, #0
    8820:	e50b300c 	str	r3, [fp, #-12]
    8824:	ea000014 	b	887c <ipc_do_serve_Ipc_cat+0x12c>
        if (InodeRead(ip, buffer, off, BLOCK_SIZE) < 0) {
    8828:	e51b200c 	ldr	r2, [fp, #-12]
    882c:	e3a03c02 	mov	r3, #512	; 0x200
    8830:	e3051f30 	movw	r1, #24368	; 0x5f30
    8834:	e3401001 	movt	r1, #1
    8838:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    883c:	eb000b50 	bl	b584 <InodeRead>
    8840:	e1a03000 	mov	r3, r0
    8844:	e3530000 	cmp	r3, #0
    8848:	aa000003 	bge	885c <ipc_do_serve_Ipc_cat+0x10c>
            printf("cat: read file data failed\n");
    884c:	e3020964 	movw	r0, #10596	; 0x2964
    8850:	e3400001 	movt	r0, #1
    8854:	eb000d49 	bl	bd80 <printf>
            break;
    8858:	ea00000c 	b	8890 <ipc_do_serve_Ipc_cat+0x140>
        }
        printf("%s", buffer);
    885c:	e3051f30 	movw	r1, #24368	; 0x5f30
    8860:	e3401001 	movt	r1, #1
    8864:	e3020980 	movw	r0, #10624	; 0x2980
    8868:	e3400001 	movt	r0, #1
    886c:	eb000d43 	bl	bd80 <printf>
    for (off = 0; off < ip->size; off += BLOCK_SIZE) {
    8870:	e51b300c 	ldr	r3, [fp, #-12]
    8874:	e2833c02 	add	r3, r3, #512	; 0x200
    8878:	e50b300c 	str	r3, [fp, #-12]
    887c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8880:	e5932008 	ldr	r2, [r3, #8]
    8884:	e51b300c 	ldr	r3, [fp, #-12]
    8888:	e1520003 	cmp	r2, r3
    888c:	8affffe5 	bhi	8828 <ipc_do_serve_Ipc_cat+0xd8>
    }

    return 0;
    8890:	e3a03000 	mov	r3, #0
}
    8894:	e1a00003 	mov	r0, r3
    8898:	e24bd004 	sub	sp, fp, #4
    889c:	e8bd8800 	pop	{fp, pc}

000088a0 <ipc_do_serve_Ipc_open>:

int IPC_DO_SERVE_FUNC(Ipc_open)(char* path)
{
    88a0:	e92d4810 	push	{r4, fp, lr}
    88a4:	e28db008 	add	fp, sp, #8
    88a8:	e24dd024 	sub	sp, sp, #36	; 0x24
    88ac:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    // printf("Ipc_open: %s\n", path);
    int fd;
    struct FileDescriptor* fdp;
    fd = AllocFileDescriptor();
    88b0:	eb000c5f 	bl	ba34 <AllocFileDescriptor>
    88b4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    if (fd < 0) {
    88b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    88bc:	e3530000 	cmp	r3, #0
    88c0:	aa000004 	bge	88d8 <ipc_do_serve_Ipc_open+0x38>
        printf("open: alloc a new fd failed\n");
    88c4:	e3020984 	movw	r0, #10628	; 0x2984
    88c8:	e3400001 	movt	r0, #1
    88cc:	eb000d2b 	bl	bd80 <printf>
        return -1;
    88d0:	e3e03000 	mvn	r3, #0
    88d4:	ea000039 	b	89c0 <ipc_do_serve_Ipc_open+0x120>
    }
    fdp = GetFileDescriptor(fd);
    88d8:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    88dc:	eb000c22 	bl	b96c <GetFileDescriptor>
    88e0:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8

    struct Inode *dp, *ip;
    if (*path == '/') {
    88e4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    88e8:	e5d33000 	ldrb	r3, [r3]
    88ec:	e353002f 	cmp	r3, #47	; 0x2f
    88f0:	1a000003 	bne	8904 <ipc_do_serve_Ipc_open+0x64>
        dp = InodeGet(ROOT_INUM);
    88f4:	e3a00001 	mov	r0, #1
    88f8:	eb000898 	bl	ab60 <InodeGet>
    88fc:	e50b0010 	str	r0, [fp, #-16]
    8900:	ea00000c 	b	8938 <ipc_do_serve_Ipc_open+0x98>
    } else {
        struct CwdPair* cwd = get_session_cwd();
    8904:	ebfffe37 	bl	81e8 <get_session_cwd>
    8908:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
        if (!cwd) {
    890c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8910:	e3530000 	cmp	r3, #0
    8914:	1a000004 	bne	892c <ipc_do_serve_Ipc_open+0x8c>
            printf("ls:find current work dir failed\n");
    8918:	e3020798 	movw	r0, #10136	; 0x2798
    891c:	e3400001 	movt	r0, #1
    8920:	eb000d16 	bl	bd80 <printf>
            return -1;
    8924:	e3e03000 	mvn	r3, #0
    8928:	ea000024 	b	89c0 <ipc_do_serve_Ipc_open+0x120>
        }
        dp = cwd->Inode;
    892c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8930:	e5933004 	ldr	r3, [r3, #4]
    8934:	e50b3010 	str	r3, [fp, #-16]
    }
    if ((ip = InodeSeek(dp, path)) == NULL) {
    8938:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    893c:	e51b0010 	ldr	r0, [fp, #-16]
    8940:	eb000aec 	bl	b4f8 <InodeSeek>
    8944:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    8948:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    894c:	e3530000 	cmp	r3, #0
    8950:	1a000005 	bne	896c <ipc_do_serve_Ipc_open+0xcc>
        printf("open: find target Inode failed, path is %s\n", path);
    8954:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    8958:	e30209a4 	movw	r0, #10660	; 0x29a4
    895c:	e3400001 	movt	r0, #1
    8960:	eb000d06 	bl	bd80 <printf>
        return -1;
    8964:	e3e03000 	mvn	r3, #0
    8968:	ea000014 	b	89c0 <ipc_do_serve_Ipc_open+0x120>
    }

    /// @todo record absolute path
    strncpy(fdp->path, path, strlen(path) + 1);
    896c:	e51b4018 	ldr	r4, [fp, #-24]	; 0xffffffe8
    8970:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    8974:	eb001506 	bl	dd94 <strlen>
    8978:	e1a03000 	mov	r3, r0
    897c:	e2833001 	add	r3, r3, #1
    8980:	e1a02003 	mov	r2, r3
    8984:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
    8988:	e1a00004 	mov	r0, r4
    898c:	eb00155c 	bl	df04 <strncpy>
    ip->nlink++;
    8990:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8994:	e1d330f6 	ldrsh	r3, [r3, #6]
    8998:	e6ff3073 	uxth	r3, r3
    899c:	e2833001 	add	r3, r3, #1
    89a0:	e6ff3073 	uxth	r3, r3
    89a4:	e6bf2073 	sxth	r2, r3
    89a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    89ac:	e1c320b6 	strh	r2, [r3, #6]
    fdp->data = ip;
    89b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    89b4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    89b8:	e5832080 	str	r2, [r3, #128]	; 0x80

    return fd;
    89bc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
    89c0:	e1a00003 	mov	r0, r3
    89c4:	e24bd008 	sub	sp, fp, #8
    89c8:	e8bd8810 	pop	{r4, fp, pc}

000089cc <ipc_do_serve_Ipc_close>:

int IPC_DO_SERVE_FUNC(Ipc_close)(int* fd)
{
    89cc:	e92d4800 	push	{fp, lr}
    89d0:	e28db004 	add	fp, sp, #4
    89d4:	e24dd010 	sub	sp, sp, #16
    89d8:	e50b0010 	str	r0, [fp, #-16]
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
    89dc:	e51b3010 	ldr	r3, [fp, #-16]
    89e0:	e5933000 	ldr	r3, [r3]
    89e4:	e1a00003 	mov	r0, r3
    89e8:	eb000bdf 	bl	b96c <GetFileDescriptor>
    89ec:	e50b0008 	str	r0, [fp, #-8]
    if (!fdp) {
    89f0:	e51b3008 	ldr	r3, [fp, #-8]
    89f4:	e3530000 	cmp	r3, #0
    89f8:	1a000004 	bne	8a10 <ipc_do_serve_Ipc_close+0x44>
        printf("read: fd invalid\n");
    89fc:	e30209d0 	movw	r0, #10704	; 0x29d0
    8a00:	e3400001 	movt	r0, #1
    8a04:	eb000cdd 	bl	bd80 <printf>
        return -1;
    8a08:	e3e03000 	mvn	r3, #0
    8a0c:	ea00000f 	b	8a50 <ipc_do_serve_Ipc_close+0x84>
    }

    struct Inode* ip = fdp->data;
    8a10:	e51b3008 	ldr	r3, [fp, #-8]
    8a14:	e5933080 	ldr	r3, [r3, #128]	; 0x80
    8a18:	e50b300c 	str	r3, [fp, #-12]
    ip->nlink--;
    8a1c:	e51b300c 	ldr	r3, [fp, #-12]
    8a20:	e1d330f6 	ldrsh	r3, [r3, #6]
    8a24:	e6ff3073 	uxth	r3, r3
    8a28:	e2433001 	sub	r3, r3, #1
    8a2c:	e6ff3073 	uxth	r3, r3
    8a30:	e6bf2073 	sxth	r2, r3
    8a34:	e51b300c 	ldr	r3, [fp, #-12]
    8a38:	e1c320b6 	strh	r2, [r3, #6]

    FreeFileDescriptor(*fd);
    8a3c:	e51b3010 	ldr	r3, [fp, #-16]
    8a40:	e5933000 	ldr	r3, [r3]
    8a44:	e1a00003 	mov	r0, r3
    8a48:	eb000bdf 	bl	b9cc <FreeFileDescriptor>
    return 0;
    8a4c:	e3a03000 	mov	r3, #0
}
    8a50:	e1a00003 	mov	r0, r3
    8a54:	e24bd004 	sub	sp, fp, #4
    8a58:	e8bd8800 	pop	{fp, pc}

00008a5c <ipc_do_serve_Ipc_read>:

int IPC_DO_SERVE_FUNC(Ipc_read)(int* fd, char* dst, int* offset, int* len)
{
    8a5c:	e92d4800 	push	{fp, lr}
    8a60:	e28db004 	add	fp, sp, #4
    8a64:	e24dd020 	sub	sp, sp, #32
    8a68:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8a6c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8a70:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8a74:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    // printf("Ipc_read, fd is %d, dst: %x, offset: %d, len: %d\n", *fd, dst, *offset, *len);
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
    8a78:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8a7c:	e5933000 	ldr	r3, [r3]
    8a80:	e1a00003 	mov	r0, r3
    8a84:	eb000bb8 	bl	b96c <GetFileDescriptor>
    8a88:	e50b0008 	str	r0, [fp, #-8]
    if (!fdp) {
    8a8c:	e51b3008 	ldr	r3, [fp, #-8]
    8a90:	e3530000 	cmp	r3, #0
    8a94:	1a000004 	bne	8aac <ipc_do_serve_Ipc_read+0x50>
        printf("read: fd invalid\n");
    8a98:	e30209d0 	movw	r0, #10704	; 0x29d0
    8a9c:	e3400001 	movt	r0, #1
    8aa0:	eb000cb6 	bl	bd80 <printf>
        return -1;
    8aa4:	e3e03000 	mvn	r3, #0
    8aa8:	ea000017 	b	8b0c <ipc_do_serve_Ipc_read+0xb0>
    }

    struct Inode* ip = fdp->data;
    8aac:	e51b3008 	ldr	r3, [fp, #-8]
    8ab0:	e5933080 	ldr	r3, [r3, #128]	; 0x80
    8ab4:	e50b300c 	str	r3, [fp, #-12]
    if (ip->type != T_FILE) {
    8ab8:	e51b300c 	ldr	r3, [fp, #-12]
    8abc:	e1d330f4 	ldrsh	r3, [r3, #4]
    8ac0:	e3530002 	cmp	r3, #2
    8ac4:	0a000006 	beq	8ae4 <ipc_do_serve_Ipc_read+0x88>
        printf("read: %s Is not a file\n", fdp->path);
    8ac8:	e51b3008 	ldr	r3, [fp, #-8]
    8acc:	e1a01003 	mov	r1, r3
    8ad0:	e30209e4 	movw	r0, #10724	; 0x29e4
    8ad4:	e3400001 	movt	r0, #1
    8ad8:	eb000ca8 	bl	bd80 <printf>
        return -1;
    8adc:	e3e03000 	mvn	r3, #0
    8ae0:	ea000009 	b	8b0c <ipc_do_serve_Ipc_read+0xb0>
    }

    int cur_read_len = InodeRead(ip, dst, *offset, *len);
    8ae4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8ae8:	e5932000 	ldr	r2, [r3]
    8aec:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8af0:	e5933000 	ldr	r3, [r3]
    8af4:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    8af8:	e51b000c 	ldr	r0, [fp, #-12]
    8afc:	eb000aa0 	bl	b584 <InodeRead>
    8b00:	e50b0010 	str	r0, [fp, #-16]

    return *len;
    8b04:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8b08:	e5933000 	ldr	r3, [r3]
}
    8b0c:	e1a00003 	mov	r0, r3
    8b10:	e24bd004 	sub	sp, fp, #4
    8b14:	e8bd8800 	pop	{fp, pc}

00008b18 <ipc_do_serve_Ipc_write>:

int IPC_DO_SERVE_FUNC(Ipc_write)(int* fd, char* src, int* offset, int* len)
{
    8b18:	e92d4800 	push	{fp, lr}
    8b1c:	e28db004 	add	fp, sp, #4
    8b20:	e24dd020 	sub	sp, sp, #32
    8b24:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    8b28:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    8b2c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    8b30:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    // printf("Ipc_write, fd is %d\n", *fd);
    struct FileDescriptor* fdp = GetFileDescriptor(*fd);
    8b34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    8b38:	e5933000 	ldr	r3, [r3]
    8b3c:	e1a00003 	mov	r0, r3
    8b40:	eb000b89 	bl	b96c <GetFileDescriptor>
    8b44:	e50b0008 	str	r0, [fp, #-8]
    if (!fdp) {
    8b48:	e51b3008 	ldr	r3, [fp, #-8]
    8b4c:	e3530000 	cmp	r3, #0
    8b50:	1a000004 	bne	8b68 <ipc_do_serve_Ipc_write+0x50>
        printf("read: fd invalid\n");
    8b54:	e30209d0 	movw	r0, #10704	; 0x29d0
    8b58:	e3400001 	movt	r0, #1
    8b5c:	eb000c87 	bl	bd80 <printf>
        return -1;
    8b60:	e3e03000 	mvn	r3, #0
    8b64:	ea000017 	b	8bc8 <ipc_do_serve_Ipc_write+0xb0>
    }

    struct Inode* ip = fdp->data;
    8b68:	e51b3008 	ldr	r3, [fp, #-8]
    8b6c:	e5933080 	ldr	r3, [r3, #128]	; 0x80
    8b70:	e50b300c 	str	r3, [fp, #-12]
    if (ip->type != T_FILE) {
    8b74:	e51b300c 	ldr	r3, [fp, #-12]
    8b78:	e1d330f4 	ldrsh	r3, [r3, #4]
    8b7c:	e3530002 	cmp	r3, #2
    8b80:	0a000006 	beq	8ba0 <ipc_do_serve_Ipc_write+0x88>
        printf("read: %s Is not a file\n", fdp->path);
    8b84:	e51b3008 	ldr	r3, [fp, #-8]
    8b88:	e1a01003 	mov	r1, r3
    8b8c:	e30209e4 	movw	r0, #10724	; 0x29e4
    8b90:	e3400001 	movt	r0, #1
    8b94:	eb000c79 	bl	bd80 <printf>
        return -1;
    8b98:	e3e03000 	mvn	r3, #0
    8b9c:	ea000009 	b	8bc8 <ipc_do_serve_Ipc_write+0xb0>
    }

    int cur_write_len = InodeWrite(ip, src, *offset, *len);
    8ba0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    8ba4:	e5933000 	ldr	r3, [r3]
    8ba8:	e1a02003 	mov	r2, r3
    8bac:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    8bb0:	e5933000 	ldr	r3, [r3]
    8bb4:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    8bb8:	e51b000c 	ldr	r0, [fp, #-12]
    8bbc:	eb000ad0 	bl	b704 <InodeWrite>
    8bc0:	e50b0010 	str	r0, [fp, #-16]

    return cur_write_len;
    8bc4:	e51b3010 	ldr	r3, [fp, #-16]
}
    8bc8:	e1a00003 	mov	r0, r3
    8bcc:	e24bd004 	sub	sp, fp, #4
    8bd0:	e8bd8800 	pop	{fp, pc}

00008bd4 <ipc_serve_Ipc_ls>:

IPC_SERVER_INTERFACE(Ipc_ls, 1);
    8bd4:	e92d4800 	push	{fp, lr}
    8bd8:	e28db004 	add	fp, sp, #4
    8bdc:	e24dd028 	sub	sp, sp, #40	; 0x28
    8be0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8be4:	e3a03000 	mov	r3, #0
    8be8:	e50b3008 	str	r3, [fp, #-8]
    8bec:	ea000014 	b	8c44 <ipc_serve_Ipc_ls+0x70>
    8bf0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8bf4:	e50b300c 	str	r3, [fp, #-12]
    8bf8:	e51b3008 	ldr	r3, [fp, #-8]
    8bfc:	e50b3010 	str	r3, [fp, #-16]
/// @param msg
/// @param arg_num start with 0 for first arg
/// @return
__attribute__((__always_inline__)) static inline void* ipc_msg_get_nth_arg_buf(struct IpcMsg* msg, int arg_num)
{
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    8c00:	e51b3010 	ldr	r3, [fp, #-16]
    8c04:	e2833003 	add	r3, r3, #3
    8c08:	e1a03103 	lsl	r3, r3, #2
    8c0c:	e51b200c 	ldr	r2, [fp, #-12]
    8c10:	e0823003 	add	r3, r2, r3
    8c14:	e1d330b0 	ldrh	r3, [r3]
    8c18:	e1a02003 	mov	r2, r3
    8c1c:	e51b300c 	ldr	r3, [fp, #-12]
    8c20:	e0832002 	add	r2, r3, r2
    8c24:	e51b3008 	ldr	r3, [fp, #-8]
    8c28:	e1a03103 	lsl	r3, r3, #2
    8c2c:	e24b1004 	sub	r1, fp, #4
    8c30:	e0813003 	add	r3, r1, r3
    8c34:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    8c38:	e51b3008 	ldr	r3, [fp, #-8]
    8c3c:	e2833001 	add	r3, r3, #1
    8c40:	e50b3008 	str	r3, [fp, #-8]
    8c44:	e51b3008 	ldr	r3, [fp, #-8]
    8c48:	e3530000 	cmp	r3, #0
    8c4c:	daffffe7 	ble	8bf0 <ipc_serve_Ipc_ls+0x1c>
    8c50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8c54:	e1a00003 	mov	r0, r3
    8c58:	ebfffda8 	bl	8300 <ipc_do_serve_Ipc_ls>
    8c5c:	e1a03000 	mov	r3, r0
    8c60:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8c64:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8c68:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8c6c:	e24b3020 	sub	r3, fp, #32
    8c70:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
/// @brief set return val of ipc call after serve, used by server
/// @param msg
/// @param ret_val
__attribute__((__always_inline__)) static inline void ipc_msg_set_return(struct IpcMsg* msg, int32_t* ret_val)
{
    assert(msg->header.valid == 1);
    8c74:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8c78:	e5d33000 	ldrb	r3, [r3]
    8c7c:	e2033001 	and	r3, r3, #1
    8c80:	e6ef3073 	uxtb	r3, r3
    8c84:	e3530000 	cmp	r3, #0
    8c88:	1a000007 	bne	8cac <ipc_serve_Ipc_ls+0xd8>
    8c8c:	e30239fc 	movw	r3, #10748	; 0x29fc
    8c90:	e3403001 	movt	r3, #1
    8c94:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    8c98:	e3402001 	movt	r2, #1
    8c9c:	e3a0107e 	mov	r1, #126	; 0x7e
    8ca0:	e3020a14 	movw	r0, #10772	; 0x2a14
    8ca4:	e3400001 	movt	r0, #1
    8ca8:	eb001280 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    8cac:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8cb0:	e2833008 	add	r3, r3, #8
    8cb4:	e3a02004 	mov	r2, #4
    8cb8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8cbc:	e1a00003 	mov	r0, r3
    8cc0:	eb0012ce 	bl	d800 <memcpy>
    8cc4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8cc8:	e5d23000 	ldrb	r3, [r2]
    8ccc:	e3833002 	orr	r3, r3, #2
    8cd0:	e5c23000 	strb	r3, [r2]
    8cd4:	e3a03000 	mov	r3, #0
    8cd8:	e1a00003 	mov	r0, r3
    8cdc:	e24bd004 	sub	sp, fp, #4
    8ce0:	e8bd8800 	pop	{fp, pc}

00008ce4 <ipc_serve_Ipc_cd>:
IPC_SERVER_INTERFACE(Ipc_cd, 1);
    8ce4:	e92d4800 	push	{fp, lr}
    8ce8:	e28db004 	add	fp, sp, #4
    8cec:	e24dd028 	sub	sp, sp, #40	; 0x28
    8cf0:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8cf4:	e3a03000 	mov	r3, #0
    8cf8:	e50b3008 	str	r3, [fp, #-8]
    8cfc:	ea000014 	b	8d54 <ipc_serve_Ipc_cd+0x70>
    8d00:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8d04:	e50b300c 	str	r3, [fp, #-12]
    8d08:	e51b3008 	ldr	r3, [fp, #-8]
    8d0c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    8d10:	e51b3010 	ldr	r3, [fp, #-16]
    8d14:	e2833003 	add	r3, r3, #3
    8d18:	e1a03103 	lsl	r3, r3, #2
    8d1c:	e51b200c 	ldr	r2, [fp, #-12]
    8d20:	e0823003 	add	r3, r2, r3
    8d24:	e1d330b0 	ldrh	r3, [r3]
    8d28:	e1a02003 	mov	r2, r3
    8d2c:	e51b300c 	ldr	r3, [fp, #-12]
    8d30:	e0832002 	add	r2, r3, r2
    8d34:	e51b3008 	ldr	r3, [fp, #-8]
    8d38:	e1a03103 	lsl	r3, r3, #2
    8d3c:	e24b1004 	sub	r1, fp, #4
    8d40:	e0813003 	add	r3, r1, r3
    8d44:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    8d48:	e51b3008 	ldr	r3, [fp, #-8]
    8d4c:	e2833001 	add	r3, r3, #1
    8d50:	e50b3008 	str	r3, [fp, #-8]
    8d54:	e51b3008 	ldr	r3, [fp, #-8]
    8d58:	e3530000 	cmp	r3, #0
    8d5c:	daffffe7 	ble	8d00 <ipc_serve_Ipc_cd+0x1c>
    8d60:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8d64:	e1a00003 	mov	r0, r3
    8d68:	ebfffdb9 	bl	8454 <ipc_do_serve_Ipc_cd>
    8d6c:	e1a03000 	mov	r3, r0
    8d70:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8d74:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8d78:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8d7c:	e24b3020 	sub	r3, fp, #32
    8d80:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    8d84:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8d88:	e5d33000 	ldrb	r3, [r3]
    8d8c:	e2033001 	and	r3, r3, #1
    8d90:	e6ef3073 	uxtb	r3, r3
    8d94:	e3530000 	cmp	r3, #0
    8d98:	1a000007 	bne	8dbc <ipc_serve_Ipc_cd+0xd8>
    8d9c:	e30239fc 	movw	r3, #10748	; 0x29fc
    8da0:	e3403001 	movt	r3, #1
    8da4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    8da8:	e3402001 	movt	r2, #1
    8dac:	e3a0107e 	mov	r1, #126	; 0x7e
    8db0:	e3020a14 	movw	r0, #10772	; 0x2a14
    8db4:	e3400001 	movt	r0, #1
    8db8:	eb00123c 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    8dbc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8dc0:	e2833008 	add	r3, r3, #8
    8dc4:	e3a02004 	mov	r2, #4
    8dc8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8dcc:	e1a00003 	mov	r0, r3
    8dd0:	eb00128a 	bl	d800 <memcpy>
    8dd4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8dd8:	e5d23000 	ldrb	r3, [r2]
    8ddc:	e3833002 	orr	r3, r3, #2
    8de0:	e5c23000 	strb	r3, [r2]
    8de4:	e3a03000 	mov	r3, #0
    8de8:	e1a00003 	mov	r0, r3
    8dec:	e24bd004 	sub	sp, fp, #4
    8df0:	e8bd8800 	pop	{fp, pc}

00008df4 <ipc_serve_Ipc_mkdir>:
IPC_SERVER_INTERFACE(Ipc_mkdir, 1);
    8df4:	e92d4800 	push	{fp, lr}
    8df8:	e28db004 	add	fp, sp, #4
    8dfc:	e24dd028 	sub	sp, sp, #40	; 0x28
    8e00:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8e04:	e3a03000 	mov	r3, #0
    8e08:	e50b3008 	str	r3, [fp, #-8]
    8e0c:	ea000014 	b	8e64 <ipc_serve_Ipc_mkdir+0x70>
    8e10:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8e14:	e50b300c 	str	r3, [fp, #-12]
    8e18:	e51b3008 	ldr	r3, [fp, #-8]
    8e1c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    8e20:	e51b3010 	ldr	r3, [fp, #-16]
    8e24:	e2833003 	add	r3, r3, #3
    8e28:	e1a03103 	lsl	r3, r3, #2
    8e2c:	e51b200c 	ldr	r2, [fp, #-12]
    8e30:	e0823003 	add	r3, r2, r3
    8e34:	e1d330b0 	ldrh	r3, [r3]
    8e38:	e1a02003 	mov	r2, r3
    8e3c:	e51b300c 	ldr	r3, [fp, #-12]
    8e40:	e0832002 	add	r2, r3, r2
    8e44:	e51b3008 	ldr	r3, [fp, #-8]
    8e48:	e1a03103 	lsl	r3, r3, #2
    8e4c:	e24b1004 	sub	r1, fp, #4
    8e50:	e0813003 	add	r3, r1, r3
    8e54:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    8e58:	e51b3008 	ldr	r3, [fp, #-8]
    8e5c:	e2833001 	add	r3, r3, #1
    8e60:	e50b3008 	str	r3, [fp, #-8]
    8e64:	e51b3008 	ldr	r3, [fp, #-8]
    8e68:	e3530000 	cmp	r3, #0
    8e6c:	daffffe7 	ble	8e10 <ipc_serve_Ipc_mkdir+0x1c>
    8e70:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8e74:	e1a00003 	mov	r0, r3
    8e78:	ebfffdaa 	bl	8528 <ipc_do_serve_Ipc_mkdir>
    8e7c:	e1a03000 	mov	r3, r0
    8e80:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8e84:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8e88:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8e8c:	e24b3020 	sub	r3, fp, #32
    8e90:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    8e94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8e98:	e5d33000 	ldrb	r3, [r3]
    8e9c:	e2033001 	and	r3, r3, #1
    8ea0:	e6ef3073 	uxtb	r3, r3
    8ea4:	e3530000 	cmp	r3, #0
    8ea8:	1a000007 	bne	8ecc <ipc_serve_Ipc_mkdir+0xd8>
    8eac:	e30239fc 	movw	r3, #10748	; 0x29fc
    8eb0:	e3403001 	movt	r3, #1
    8eb4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    8eb8:	e3402001 	movt	r2, #1
    8ebc:	e3a0107e 	mov	r1, #126	; 0x7e
    8ec0:	e3020a14 	movw	r0, #10772	; 0x2a14
    8ec4:	e3400001 	movt	r0, #1
    8ec8:	eb0011f8 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    8ecc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8ed0:	e2833008 	add	r3, r3, #8
    8ed4:	e3a02004 	mov	r2, #4
    8ed8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8edc:	e1a00003 	mov	r0, r3
    8ee0:	eb001246 	bl	d800 <memcpy>
    8ee4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8ee8:	e5d23000 	ldrb	r3, [r2]
    8eec:	e3833002 	orr	r3, r3, #2
    8ef0:	e5c23000 	strb	r3, [r2]
    8ef4:	e3a03000 	mov	r3, #0
    8ef8:	e1a00003 	mov	r0, r3
    8efc:	e24bd004 	sub	sp, fp, #4
    8f00:	e8bd8800 	pop	{fp, pc}

00008f04 <ipc_serve_Ipc_delete>:
IPC_SERVER_INTERFACE(Ipc_delete, 1);
    8f04:	e92d4800 	push	{fp, lr}
    8f08:	e28db004 	add	fp, sp, #4
    8f0c:	e24dd028 	sub	sp, sp, #40	; 0x28
    8f10:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    8f14:	e3a03000 	mov	r3, #0
    8f18:	e50b3008 	str	r3, [fp, #-8]
    8f1c:	ea000014 	b	8f74 <ipc_serve_Ipc_delete+0x70>
    8f20:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8f24:	e50b300c 	str	r3, [fp, #-12]
    8f28:	e51b3008 	ldr	r3, [fp, #-8]
    8f2c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    8f30:	e51b3010 	ldr	r3, [fp, #-16]
    8f34:	e2833003 	add	r3, r3, #3
    8f38:	e1a03103 	lsl	r3, r3, #2
    8f3c:	e51b200c 	ldr	r2, [fp, #-12]
    8f40:	e0823003 	add	r3, r2, r3
    8f44:	e1d330b0 	ldrh	r3, [r3]
    8f48:	e1a02003 	mov	r2, r3
    8f4c:	e51b300c 	ldr	r3, [fp, #-12]
    8f50:	e0832002 	add	r2, r3, r2
    8f54:	e51b3008 	ldr	r3, [fp, #-8]
    8f58:	e1a03103 	lsl	r3, r3, #2
    8f5c:	e24b1004 	sub	r1, fp, #4
    8f60:	e0813003 	add	r3, r1, r3
    8f64:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    8f68:	e51b3008 	ldr	r3, [fp, #-8]
    8f6c:	e2833001 	add	r3, r3, #1
    8f70:	e50b3008 	str	r3, [fp, #-8]
    8f74:	e51b3008 	ldr	r3, [fp, #-8]
    8f78:	e3530000 	cmp	r3, #0
    8f7c:	daffffe7 	ble	8f20 <ipc_serve_Ipc_delete+0x1c>
    8f80:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    8f84:	e1a00003 	mov	r0, r3
    8f88:	ebfffdb3 	bl	865c <ipc_do_serve_Ipc_delete>
    8f8c:	e1a03000 	mov	r3, r0
    8f90:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    8f94:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    8f98:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    8f9c:	e24b3020 	sub	r3, fp, #32
    8fa0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    8fa4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8fa8:	e5d33000 	ldrb	r3, [r3]
    8fac:	e2033001 	and	r3, r3, #1
    8fb0:	e6ef3073 	uxtb	r3, r3
    8fb4:	e3530000 	cmp	r3, #0
    8fb8:	1a000007 	bne	8fdc <ipc_serve_Ipc_delete+0xd8>
    8fbc:	e30239fc 	movw	r3, #10748	; 0x29fc
    8fc0:	e3403001 	movt	r3, #1
    8fc4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    8fc8:	e3402001 	movt	r2, #1
    8fcc:	e3a0107e 	mov	r1, #126	; 0x7e
    8fd0:	e3020a14 	movw	r0, #10772	; 0x2a14
    8fd4:	e3400001 	movt	r0, #1
    8fd8:	eb0011b4 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    8fdc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    8fe0:	e2833008 	add	r3, r3, #8
    8fe4:	e3a02004 	mov	r2, #4
    8fe8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    8fec:	e1a00003 	mov	r0, r3
    8ff0:	eb001202 	bl	d800 <memcpy>
    8ff4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    8ff8:	e5d23000 	ldrb	r3, [r2]
    8ffc:	e3833002 	orr	r3, r3, #2
    9000:	e5c23000 	strb	r3, [r2]
    9004:	e3a03000 	mov	r3, #0
    9008:	e1a00003 	mov	r0, r3
    900c:	e24bd004 	sub	sp, fp, #4
    9010:	e8bd8800 	pop	{fp, pc}

00009014 <ipc_serve_Ipc_cat>:
IPC_SERVER_INTERFACE(Ipc_cat, 1);
    9014:	e92d4800 	push	{fp, lr}
    9018:	e28db004 	add	fp, sp, #4
    901c:	e24dd028 	sub	sp, sp, #40	; 0x28
    9020:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    9024:	e3a03000 	mov	r3, #0
    9028:	e50b3008 	str	r3, [fp, #-8]
    902c:	ea000014 	b	9084 <ipc_serve_Ipc_cat+0x70>
    9030:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9034:	e50b300c 	str	r3, [fp, #-12]
    9038:	e51b3008 	ldr	r3, [fp, #-8]
    903c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9040:	e51b3010 	ldr	r3, [fp, #-16]
    9044:	e2833003 	add	r3, r3, #3
    9048:	e1a03103 	lsl	r3, r3, #2
    904c:	e51b200c 	ldr	r2, [fp, #-12]
    9050:	e0823003 	add	r3, r2, r3
    9054:	e1d330b0 	ldrh	r3, [r3]
    9058:	e1a02003 	mov	r2, r3
    905c:	e51b300c 	ldr	r3, [fp, #-12]
    9060:	e0832002 	add	r2, r3, r2
    9064:	e51b3008 	ldr	r3, [fp, #-8]
    9068:	e1a03103 	lsl	r3, r3, #2
    906c:	e24b1004 	sub	r1, fp, #4
    9070:	e0813003 	add	r3, r1, r3
    9074:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    9078:	e51b3008 	ldr	r3, [fp, #-8]
    907c:	e2833001 	add	r3, r3, #1
    9080:	e50b3008 	str	r3, [fp, #-8]
    9084:	e51b3008 	ldr	r3, [fp, #-8]
    9088:	e3530000 	cmp	r3, #0
    908c:	daffffe7 	ble	9030 <ipc_serve_Ipc_cat+0x1c>
    9090:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    9094:	e1a00003 	mov	r0, r3
    9098:	ebfffdac 	bl	8750 <ipc_do_serve_Ipc_cat>
    909c:	e1a03000 	mov	r3, r0
    90a0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    90a4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    90a8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    90ac:	e24b3020 	sub	r3, fp, #32
    90b0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    90b4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    90b8:	e5d33000 	ldrb	r3, [r3]
    90bc:	e2033001 	and	r3, r3, #1
    90c0:	e6ef3073 	uxtb	r3, r3
    90c4:	e3530000 	cmp	r3, #0
    90c8:	1a000007 	bne	90ec <ipc_serve_Ipc_cat+0xd8>
    90cc:	e30239fc 	movw	r3, #10748	; 0x29fc
    90d0:	e3403001 	movt	r3, #1
    90d4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    90d8:	e3402001 	movt	r2, #1
    90dc:	e3a0107e 	mov	r1, #126	; 0x7e
    90e0:	e3020a14 	movw	r0, #10772	; 0x2a14
    90e4:	e3400001 	movt	r0, #1
    90e8:	eb001170 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    90ec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    90f0:	e2833008 	add	r3, r3, #8
    90f4:	e3a02004 	mov	r2, #4
    90f8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    90fc:	e1a00003 	mov	r0, r3
    9100:	eb0011be 	bl	d800 <memcpy>
    9104:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9108:	e5d23000 	ldrb	r3, [r2]
    910c:	e3833002 	orr	r3, r3, #2
    9110:	e5c23000 	strb	r3, [r2]
    9114:	e3a03000 	mov	r3, #0
    9118:	e1a00003 	mov	r0, r3
    911c:	e24bd004 	sub	sp, fp, #4
    9120:	e8bd8800 	pop	{fp, pc}

00009124 <ipc_serve_Ipc_open>:

IPC_SERVER_INTERFACE(Ipc_open, 1);
    9124:	e92d4800 	push	{fp, lr}
    9128:	e28db004 	add	fp, sp, #4
    912c:	e24dd028 	sub	sp, sp, #40	; 0x28
    9130:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    9134:	e3a03000 	mov	r3, #0
    9138:	e50b3008 	str	r3, [fp, #-8]
    913c:	ea000014 	b	9194 <ipc_serve_Ipc_open+0x70>
    9140:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9144:	e50b300c 	str	r3, [fp, #-12]
    9148:	e51b3008 	ldr	r3, [fp, #-8]
    914c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9150:	e51b3010 	ldr	r3, [fp, #-16]
    9154:	e2833003 	add	r3, r3, #3
    9158:	e1a03103 	lsl	r3, r3, #2
    915c:	e51b200c 	ldr	r2, [fp, #-12]
    9160:	e0823003 	add	r3, r2, r3
    9164:	e1d330b0 	ldrh	r3, [r3]
    9168:	e1a02003 	mov	r2, r3
    916c:	e51b300c 	ldr	r3, [fp, #-12]
    9170:	e0832002 	add	r2, r3, r2
    9174:	e51b3008 	ldr	r3, [fp, #-8]
    9178:	e1a03103 	lsl	r3, r3, #2
    917c:	e24b1004 	sub	r1, fp, #4
    9180:	e0813003 	add	r3, r1, r3
    9184:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    9188:	e51b3008 	ldr	r3, [fp, #-8]
    918c:	e2833001 	add	r3, r3, #1
    9190:	e50b3008 	str	r3, [fp, #-8]
    9194:	e51b3008 	ldr	r3, [fp, #-8]
    9198:	e3530000 	cmp	r3, #0
    919c:	daffffe7 	ble	9140 <ipc_serve_Ipc_open+0x1c>
    91a0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    91a4:	e1a00003 	mov	r0, r3
    91a8:	ebfffdbc 	bl	88a0 <ipc_do_serve_Ipc_open>
    91ac:	e1a03000 	mov	r3, r0
    91b0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    91b4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    91b8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    91bc:	e24b3020 	sub	r3, fp, #32
    91c0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    91c4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    91c8:	e5d33000 	ldrb	r3, [r3]
    91cc:	e2033001 	and	r3, r3, #1
    91d0:	e6ef3073 	uxtb	r3, r3
    91d4:	e3530000 	cmp	r3, #0
    91d8:	1a000007 	bne	91fc <ipc_serve_Ipc_open+0xd8>
    91dc:	e30239fc 	movw	r3, #10748	; 0x29fc
    91e0:	e3403001 	movt	r3, #1
    91e4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    91e8:	e3402001 	movt	r2, #1
    91ec:	e3a0107e 	mov	r1, #126	; 0x7e
    91f0:	e3020a14 	movw	r0, #10772	; 0x2a14
    91f4:	e3400001 	movt	r0, #1
    91f8:	eb00112c 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    91fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9200:	e2833008 	add	r3, r3, #8
    9204:	e3a02004 	mov	r2, #4
    9208:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    920c:	e1a00003 	mov	r0, r3
    9210:	eb00117a 	bl	d800 <memcpy>
    9214:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9218:	e5d23000 	ldrb	r3, [r2]
    921c:	e3833002 	orr	r3, r3, #2
    9220:	e5c23000 	strb	r3, [r2]
    9224:	e3a03000 	mov	r3, #0
    9228:	e1a00003 	mov	r0, r3
    922c:	e24bd004 	sub	sp, fp, #4
    9230:	e8bd8800 	pop	{fp, pc}

00009234 <ipc_serve_Ipc_close>:
IPC_SERVER_INTERFACE(Ipc_close, 1);
    9234:	e92d4800 	push	{fp, lr}
    9238:	e28db004 	add	fp, sp, #4
    923c:	e24dd028 	sub	sp, sp, #40	; 0x28
    9240:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    9244:	e3a03000 	mov	r3, #0
    9248:	e50b3008 	str	r3, [fp, #-8]
    924c:	ea000014 	b	92a4 <ipc_serve_Ipc_close+0x70>
    9250:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9254:	e50b300c 	str	r3, [fp, #-12]
    9258:	e51b3008 	ldr	r3, [fp, #-8]
    925c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9260:	e51b3010 	ldr	r3, [fp, #-16]
    9264:	e2833003 	add	r3, r3, #3
    9268:	e1a03103 	lsl	r3, r3, #2
    926c:	e51b200c 	ldr	r2, [fp, #-12]
    9270:	e0823003 	add	r3, r2, r3
    9274:	e1d330b0 	ldrh	r3, [r3]
    9278:	e1a02003 	mov	r2, r3
    927c:	e51b300c 	ldr	r3, [fp, #-12]
    9280:	e0832002 	add	r2, r3, r2
    9284:	e51b3008 	ldr	r3, [fp, #-8]
    9288:	e1a03103 	lsl	r3, r3, #2
    928c:	e24b1004 	sub	r1, fp, #4
    9290:	e0813003 	add	r3, r1, r3
    9294:	e5032018 	str	r2, [r3, #-24]	; 0xffffffe8
    9298:	e51b3008 	ldr	r3, [fp, #-8]
    929c:	e2833001 	add	r3, r3, #1
    92a0:	e50b3008 	str	r3, [fp, #-8]
    92a4:	e51b3008 	ldr	r3, [fp, #-8]
    92a8:	e3530000 	cmp	r3, #0
    92ac:	daffffe7 	ble	9250 <ipc_serve_Ipc_close+0x1c>
    92b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    92b4:	e1a00003 	mov	r0, r3
    92b8:	ebfffdc3 	bl	89cc <ipc_do_serve_Ipc_close>
    92bc:	e1a03000 	mov	r3, r0
    92c0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    92c4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    92c8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    92cc:	e24b3020 	sub	r3, fp, #32
    92d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    92d4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    92d8:	e5d33000 	ldrb	r3, [r3]
    92dc:	e2033001 	and	r3, r3, #1
    92e0:	e6ef3073 	uxtb	r3, r3
    92e4:	e3530000 	cmp	r3, #0
    92e8:	1a000007 	bne	930c <ipc_serve_Ipc_close+0xd8>
    92ec:	e30239fc 	movw	r3, #10748	; 0x29fc
    92f0:	e3403001 	movt	r3, #1
    92f4:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    92f8:	e3402001 	movt	r2, #1
    92fc:	e3a0107e 	mov	r1, #126	; 0x7e
    9300:	e3020a14 	movw	r0, #10772	; 0x2a14
    9304:	e3400001 	movt	r0, #1
    9308:	eb0010e8 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    930c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9310:	e2833008 	add	r3, r3, #8
    9314:	e3a02004 	mov	r2, #4
    9318:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    931c:	e1a00003 	mov	r0, r3
    9320:	eb001136 	bl	d800 <memcpy>
    9324:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    9328:	e5d23000 	ldrb	r3, [r2]
    932c:	e3833002 	orr	r3, r3, #2
    9330:	e5c23000 	strb	r3, [r2]
    9334:	e3a03000 	mov	r3, #0
    9338:	e1a00003 	mov	r0, r3
    933c:	e24bd004 	sub	sp, fp, #4
    9340:	e8bd8800 	pop	{fp, pc}

00009344 <ipc_serve_Ipc_read>:
IPC_SERVER_INTERFACE(Ipc_read, 4);
    9344:	e92d4800 	push	{fp, lr}
    9348:	e28db004 	add	fp, sp, #4
    934c:	e24dd030 	sub	sp, sp, #48	; 0x30
    9350:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    9354:	e3a03000 	mov	r3, #0
    9358:	e50b3008 	str	r3, [fp, #-8]
    935c:	ea000014 	b	93b4 <ipc_serve_Ipc_read+0x70>
    9360:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    9364:	e50b300c 	str	r3, [fp, #-12]
    9368:	e51b3008 	ldr	r3, [fp, #-8]
    936c:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9370:	e51b3010 	ldr	r3, [fp, #-16]
    9374:	e2833003 	add	r3, r3, #3
    9378:	e1a03103 	lsl	r3, r3, #2
    937c:	e51b200c 	ldr	r2, [fp, #-12]
    9380:	e0823003 	add	r3, r2, r3
    9384:	e1d330b0 	ldrh	r3, [r3]
    9388:	e1a02003 	mov	r2, r3
    938c:	e51b300c 	ldr	r3, [fp, #-12]
    9390:	e0832002 	add	r2, r3, r2
    9394:	e51b3008 	ldr	r3, [fp, #-8]
    9398:	e1a03103 	lsl	r3, r3, #2
    939c:	e24b1004 	sub	r1, fp, #4
    93a0:	e0813003 	add	r3, r1, r3
    93a4:	e5032024 	str	r2, [r3, #-36]	; 0xffffffdc
    93a8:	e51b3008 	ldr	r3, [fp, #-8]
    93ac:	e2833001 	add	r3, r3, #1
    93b0:	e50b3008 	str	r3, [fp, #-8]
    93b4:	e51b3008 	ldr	r3, [fp, #-8]
    93b8:	e3530003 	cmp	r3, #3
    93bc:	daffffe7 	ble	9360 <ipc_serve_Ipc_read+0x1c>
    93c0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    93c4:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    93c8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    93cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    93d0:	ebfffda1 	bl	8a5c <ipc_do_serve_Ipc_read>
    93d4:	e1a03000 	mov	r3, r0
    93d8:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    93dc:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    93e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    93e4:	e24b302c 	sub	r3, fp, #44	; 0x2c
    93e8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    93ec:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    93f0:	e5d33000 	ldrb	r3, [r3]
    93f4:	e2033001 	and	r3, r3, #1
    93f8:	e6ef3073 	uxtb	r3, r3
    93fc:	e3530000 	cmp	r3, #0
    9400:	1a000007 	bne	9424 <ipc_serve_Ipc_read+0xe0>
    9404:	e30239fc 	movw	r3, #10748	; 0x29fc
    9408:	e3403001 	movt	r3, #1
    940c:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    9410:	e3402001 	movt	r2, #1
    9414:	e3a0107e 	mov	r1, #126	; 0x7e
    9418:	e3020a14 	movw	r0, #10772	; 0x2a14
    941c:	e3400001 	movt	r0, #1
    9420:	eb0010a2 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    9424:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9428:	e2833008 	add	r3, r3, #8
    942c:	e3a02004 	mov	r2, #4
    9430:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    9434:	e1a00003 	mov	r0, r3
    9438:	eb0010f0 	bl	d800 <memcpy>
    943c:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9440:	e5d23000 	ldrb	r3, [r2]
    9444:	e3833002 	orr	r3, r3, #2
    9448:	e5c23000 	strb	r3, [r2]
    944c:	e3a03000 	mov	r3, #0
    9450:	e1a00003 	mov	r0, r3
    9454:	e24bd004 	sub	sp, fp, #4
    9458:	e8bd8800 	pop	{fp, pc}

0000945c <ipc_serve_Ipc_write>:
IPC_SERVER_INTERFACE(Ipc_write, 4);
    945c:	e92d4800 	push	{fp, lr}
    9460:	e28db004 	add	fp, sp, #4
    9464:	e24dd030 	sub	sp, sp, #48	; 0x30
    9468:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    946c:	e3a03000 	mov	r3, #0
    9470:	e50b3008 	str	r3, [fp, #-8]
    9474:	ea000014 	b	94cc <ipc_serve_Ipc_write+0x70>
    9478:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    947c:	e50b300c 	str	r3, [fp, #-12]
    9480:	e51b3008 	ldr	r3, [fp, #-8]
    9484:	e50b3010 	str	r3, [fp, #-16]
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    9488:	e51b3010 	ldr	r3, [fp, #-16]
    948c:	e2833003 	add	r3, r3, #3
    9490:	e1a03103 	lsl	r3, r3, #2
    9494:	e51b200c 	ldr	r2, [fp, #-12]
    9498:	e0823003 	add	r3, r2, r3
    949c:	e1d330b0 	ldrh	r3, [r3]
    94a0:	e1a02003 	mov	r2, r3
    94a4:	e51b300c 	ldr	r3, [fp, #-12]
    94a8:	e0832002 	add	r2, r3, r2
    94ac:	e51b3008 	ldr	r3, [fp, #-8]
    94b0:	e1a03103 	lsl	r3, r3, #2
    94b4:	e24b1004 	sub	r1, fp, #4
    94b8:	e0813003 	add	r3, r1, r3
    94bc:	e5032024 	str	r2, [r3, #-36]	; 0xffffffdc
    94c0:	e51b3008 	ldr	r3, [fp, #-8]
    94c4:	e2833001 	add	r3, r3, #1
    94c8:	e50b3008 	str	r3, [fp, #-8]
    94cc:	e51b3008 	ldr	r3, [fp, #-8]
    94d0:	e3530003 	cmp	r3, #3
    94d4:	daffffe7 	ble	9478 <ipc_serve_Ipc_write+0x1c>
    94d8:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    94dc:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    94e0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    94e4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    94e8:	ebfffd8a 	bl	8b18 <ipc_do_serve_Ipc_write>
    94ec:	e1a03000 	mov	r3, r0
    94f0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    94f4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    94f8:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    94fc:	e24b302c 	sub	r3, fp, #44	; 0x2c
    9500:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    assert(msg->header.valid == 1);
    9504:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9508:	e5d33000 	ldrb	r3, [r3]
    950c:	e2033001 	and	r3, r3, #1
    9510:	e6ef3073 	uxtb	r3, r3
    9514:	e3530000 	cmp	r3, #0
    9518:	1a000007 	bne	953c <ipc_serve_Ipc_write+0xe0>
    951c:	e30239fc 	movw	r3, #10748	; 0x29fc
    9520:	e3403001 	movt	r3, #1
    9524:	e3022aa0 	movw	r2, #10912	; 0x2aa0
    9528:	e3402001 	movt	r2, #1
    952c:	e3a0107e 	mov	r1, #126	; 0x7e
    9530:	e3020a14 	movw	r0, #10772	; 0x2a14
    9534:	e3400001 	movt	r0, #1
    9538:	eb00105c 	bl	d6b0 <__assert_func>
    memcpy(&msg->header.ret_val, ret_val, sizeof(msg->header.ret_val));
    953c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9540:	e2833008 	add	r3, r3, #8
    9544:	e3a02004 	mov	r2, #4
    9548:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
    954c:	e1a00003 	mov	r0, r3
    9550:	eb0010aa 	bl	d800 <memcpy>
    9554:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    9558:	e5d23000 	ldrb	r3, [r2]
    955c:	e3833002 	orr	r3, r3, #2
    9560:	e5c23000 	strb	r3, [r2]
    9564:	e3a03000 	mov	r3, #0
    9568:	e1a00003 	mov	r0, r3
    956c:	e24bd004 	sub	sp, fp, #4
    9570:	e8bd8800 	pop	{fp, pc}

00009574 <main>:
    Ipc_close,
    Ipc_read,
    Ipc_write);

int main(int argc, char* argv[])
{
    9574:	e92d4800 	push	{fp, lr}
    9578:	e28db004 	add	fp, sp, #4
    957c:	e24dd018 	sub	sp, sp, #24
    9580:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    9584:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    sys_state_info info;
    get_memblock_info(&info);
    9588:	e24b3010 	sub	r3, fp, #16
    958c:	e1a00003 	mov	r0, r3
    9590:	eb000f36 	bl	d270 <get_memblock_info>

    int len = info.memblock_info.memblock_end - info.memblock_info.memblock_start;
    9594:	e51b200c 	ldr	r2, [fp, #-12]
    9598:	e51b3010 	ldr	r3, [fp, #-16]
    959c:	e0423003 	sub	r3, r2, r3
    95a0:	e50b3008 	str	r3, [fp, #-8]
    mmap(FS_IMG_ADDR, info.memblock_info.memblock_start, len, false);
    95a4:	e51b1010 	ldr	r1, [fp, #-16]
    95a8:	e3a03000 	mov	r3, #0
    95ac:	e51b2008 	ldr	r2, [fp, #-8]
    95b0:	e3a00206 	mov	r0, #1610612736	; 0x60000000
    95b4:	eb000f83 	bl	d3c8 <mmap>

    MemFsInit((uintptr_t)FS_IMG_ADDR, (uint32_t)len);
    95b8:	e51b3008 	ldr	r3, [fp, #-8]
    95bc:	e1a01003 	mov	r1, r3
    95c0:	e3a00206 	mov	r0, #1610612736	; 0x60000000
    95c4:	eb000545 	bl	aae0 <MemFsInit>

    if (register_server("MemFS") < 0) {
    95c8:	e3020a64 	movw	r0, #10852	; 0x2a64
    95cc:	e3400001 	movt	r0, #1
    95d0:	eb000ee6 	bl	d170 <register_server>
    95d4:	e1a03000 	mov	r3, r0
    95d8:	e3530000 	cmp	r3, #0
    95dc:	aa000005 	bge	95f8 <main+0x84>
        printf("register server name: %s failed.\n", "SimpleServer");
    95e0:	e3021a6c 	movw	r1, #10860	; 0x2a6c
    95e4:	e3401001 	movt	r1, #1
    95e8:	e3020a7c 	movw	r0, #10876	; 0x2a7c
    95ec:	e3400001 	movt	r0, #1
    95f0:	eb0009e2 	bl	bd80 <printf>
        exit();
    95f4:	eb000ec1 	bl	d100 <exit>
    }
    ipc_server_loop(&IpcFsServer);
    95f8:	e3030154 	movw	r0, #12628	; 0x3154
    95fc:	e3400001 	movt	r0, #1
    9600:	eb000bd3 	bl	c554 <ipc_server_loop>

    // never reached
    exit();
    9604:	eb000ebd 	bl	d100 <exit>
    9608:	e3a03000 	mov	r3, #0
}
    960c:	e1a00003 	mov	r0, r3
    9610:	e24bd004 	sub	sp, fp, #4
    9614:	e8bd8800 	pop	{fp, pc}

00009618 <ipc_call_copy_args_Ipc_ls>:
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */
#include "libfs_to_client.h"

IPC_INTERFACE(Ipc_ls, 1, path, strlen(path) + 1);
    9618:	e92d4800 	push	{fp, lr}
    961c:	e28db004 	add	fp, sp, #4
    9620:	e24dd048 	sub	sp, sp, #72	; 0x48
    9624:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    9628:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    962c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9630:	e3530000 	cmp	r3, #0
    9634:	1a000001 	bne	9640 <ipc_call_copy_args_Ipc_ls+0x28>
    9638:	e3e03000 	mvn	r3, #0
    963c:	ea00006d 	b	97f8 <ipc_call_copy_args_Ipc_ls+0x1e0>
    9640:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9644:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9648:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    964c:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9650:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9654:	eb0011ce 	bl	dd94 <strlen>
    9658:	e1a03000 	mov	r3, r0
    965c:	e2833001 	add	r3, r3, #1
    9660:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9664:	e24b3044 	sub	r3, fp, #68	; 0x44
    9668:	e1a02003 	mov	r2, r3
    966c:	e3a01001 	mov	r1, #1
    9670:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    9674:	eb000a4c 	bl	bfac <new_ipc_msg>
    9678:	e1a03000 	mov	r3, r0
    967c:	e50b3008 	str	r3, [fp, #-8]
    9680:	e51b3008 	ldr	r3, [fp, #-8]
    9684:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    9688:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    968c:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9690:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9694:	eb0011be 	bl	dd94 <strlen>
    9698:	e1a03000 	mov	r3, r0
    969c:	e2833001 	add	r3, r3, #1
    96a0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    96a4:	e3a01000 	mov	r1, #0
    96a8:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    96ac:	eb000aab 	bl	c160 <ipc_msg_set_nth_arg>
    96b0:	e3a03001 	mov	r3, #1
    96b4:	e50b300c 	str	r3, [fp, #-12]
    96b8:	e51b3008 	ldr	r3, [fp, #-8]
    96bc:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    96c0:	e3a03001 	mov	r3, #1
    96c4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
/// @param msg
/// @param opcode
/// @return
__attribute__((__always_inline__)) static inline bool ipc_msg_set_opcode(struct IpcMsg* msg, int opcode)
{
    if (opcode < 0 || opcode > UINT8_MAX) {
    96c8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    96cc:	e3530000 	cmp	r3, #0
    96d0:	ba000002 	blt	96e0 <ipc_call_copy_args_Ipc_ls+0xc8>
    96d4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    96d8:	e35300ff 	cmp	r3, #255	; 0xff
    96dc:	da000001 	ble	96e8 <ipc_call_copy_args_Ipc_ls+0xd0>
        return false;
    96e0:	e3a03000 	mov	r3, #0
    96e4:	ea000004 	b	96fc <ipc_call_copy_args_Ipc_ls+0xe4>
    }
    msg->header.opcode = opcode;
    96e8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    96ec:	e6ef2073 	uxtb	r2, r3
    96f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    96f4:	e5c32001 	strb	r2, [r3, #1]
    return true;
    96f8:	e3a03001 	mov	r3, #1
    96fc:	e50b300c 	str	r3, [fp, #-12]
    9700:	e51b0008 	ldr	r0, [fp, #-8]
    9704:	eb000b1d 	bl	c380 <ipc_msg_send_wait>
    9708:	e51b3008 	ldr	r3, [fp, #-8]
    970c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9710:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9714:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9718:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    971c:	eb00119c 	bl	dd94 <strlen>
    9720:	e1a03000 	mov	r3, r0
    9724:	e2833001 	add	r3, r3, #1
    9728:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    972c:	e3a01000 	mov	r1, #0
    9730:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9734:	eb000ad1 	bl	c280 <ipc_msg_get_nth_arg>
    9738:	e3a03001 	mov	r3, #1
    973c:	e50b300c 	str	r3, [fp, #-12]
    9740:	e3a03000 	mov	r3, #0
    9744:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9748:	e51b3008 	ldr	r3, [fp, #-8]
    974c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9750:	e24b3040 	sub	r3, fp, #64	; 0x40
    9754:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9758:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    975c:	e5d33000 	ldrb	r3, [r3]
    9760:	e2033002 	and	r3, r3, #2
    9764:	e6ef3073 	uxtb	r3, r3
    9768:	e3530000 	cmp	r3, #0
    976c:	1a000007 	bne	9790 <ipc_call_copy_args_Ipc_ls+0x178>
    9770:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    9774:	e3403001 	movt	r3, #1
    9778:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    977c:	e3402001 	movt	r2, #1
    9780:	e3a01074 	mov	r1, #116	; 0x74
    9784:	e3020acc 	movw	r0, #10956	; 0x2acc
    9788:	e3400001 	movt	r0, #1
    978c:	eb000fc7 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9790:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9794:	e2833008 	add	r3, r3, #8
    9798:	e3a02004 	mov	r2, #4
    979c:	e1a01003 	mov	r1, r3
    97a0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    97a4:	eb001015 	bl	d800 <memcpy>
    97a8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    97ac:	e50b3010 	str	r3, [fp, #-16]
/// @brief delete first msg in session
/// @param session
/// @return
__attribute__((__always_inline__)) static inline bool ipc_session_forward(struct Session* session)
{
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    97b0:	e51b3010 	ldr	r3, [fp, #-16]
    97b4:	e5933010 	ldr	r3, [r3, #16]
    97b8:	e51b2010 	ldr	r2, [fp, #-16]
    97bc:	e5922008 	ldr	r2, [r2, #8]
    97c0:	e0833002 	add	r3, r3, r2
    97c4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    97c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    97cc:	e5d33000 	ldrb	r3, [r3]
    97d0:	e2033004 	and	r3, r3, #4
    97d4:	e6ef3073 	uxtb	r3, r3
    97d8:	e3530000 	cmp	r3, #0
    97dc:	0a000004 	beq	97f4 <ipc_call_copy_args_Ipc_ls+0x1dc>
        return false;
    }
    return session_free_buf(session, msg->header.len);
    97e0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    97e4:	e1d330b2 	ldrh	r3, [r3, #2]
    97e8:	e1a01003 	mov	r1, r3
    97ec:	e51b0010 	ldr	r0, [fp, #-16]
    97f0:	eb000cdc 	bl	cb68 <session_free_buf>
    97f4:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    97f8:	e1a00003 	mov	r0, r3
    97fc:	e24bd004 	sub	sp, fp, #4
    9800:	e8bd8800 	pop	{fp, pc}

00009804 <ls>:
int ls(struct Session* session, char* path)
{
    9804:	e92d4800 	push	{fp, lr}
    9808:	e28db004 	add	fp, sp, #4
    980c:	e24dd008 	sub	sp, sp, #8
    9810:	e50b0008 	str	r0, [fp, #-8]
    9814:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_ls)(session, path);
    9818:	e51b100c 	ldr	r1, [fp, #-12]
    981c:	e51b0008 	ldr	r0, [fp, #-8]
    9820:	ebffff7c 	bl	9618 <ipc_call_copy_args_Ipc_ls>
    9824:	e1a03000 	mov	r3, r0
}
    9828:	e1a00003 	mov	r0, r3
    982c:	e24bd004 	sub	sp, fp, #4
    9830:	e8bd8800 	pop	{fp, pc}

00009834 <ipc_call_copy_args_Ipc_cd>:

IPC_INTERFACE(Ipc_cd, 1, path, strlen(path) + 1);
    9834:	e92d4800 	push	{fp, lr}
    9838:	e28db004 	add	fp, sp, #4
    983c:	e24dd048 	sub	sp, sp, #72	; 0x48
    9840:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    9844:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    9848:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    984c:	e3530000 	cmp	r3, #0
    9850:	1a000001 	bne	985c <ipc_call_copy_args_Ipc_cd+0x28>
    9854:	e3e03000 	mvn	r3, #0
    9858:	ea00006d 	b	9a14 <ipc_call_copy_args_Ipc_cd+0x1e0>
    985c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9860:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9864:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9868:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    986c:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9870:	eb001147 	bl	dd94 <strlen>
    9874:	e1a03000 	mov	r3, r0
    9878:	e2833001 	add	r3, r3, #1
    987c:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9880:	e24b3044 	sub	r3, fp, #68	; 0x44
    9884:	e1a02003 	mov	r2, r3
    9888:	e3a01001 	mov	r1, #1
    988c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    9890:	eb0009c5 	bl	bfac <new_ipc_msg>
    9894:	e1a03000 	mov	r3, r0
    9898:	e50b3008 	str	r3, [fp, #-8]
    989c:	e51b3008 	ldr	r3, [fp, #-8]
    98a0:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    98a4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    98a8:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    98ac:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    98b0:	eb001137 	bl	dd94 <strlen>
    98b4:	e1a03000 	mov	r3, r0
    98b8:	e2833001 	add	r3, r3, #1
    98bc:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    98c0:	e3a01000 	mov	r1, #0
    98c4:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    98c8:	eb000a24 	bl	c160 <ipc_msg_set_nth_arg>
    98cc:	e3a03001 	mov	r3, #1
    98d0:	e50b300c 	str	r3, [fp, #-12]
    98d4:	e51b3008 	ldr	r3, [fp, #-8]
    98d8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    98dc:	e3a03002 	mov	r3, #2
    98e0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    98e4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    98e8:	e3530000 	cmp	r3, #0
    98ec:	ba000002 	blt	98fc <ipc_call_copy_args_Ipc_cd+0xc8>
    98f0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    98f4:	e35300ff 	cmp	r3, #255	; 0xff
    98f8:	da000001 	ble	9904 <ipc_call_copy_args_Ipc_cd+0xd0>
        return false;
    98fc:	e3a03000 	mov	r3, #0
    9900:	ea000004 	b	9918 <ipc_call_copy_args_Ipc_cd+0xe4>
    msg->header.opcode = opcode;
    9904:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9908:	e6ef2073 	uxtb	r2, r3
    990c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9910:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9914:	e3a03001 	mov	r3, #1
    9918:	e50b300c 	str	r3, [fp, #-12]
    991c:	e51b0008 	ldr	r0, [fp, #-8]
    9920:	eb000a96 	bl	c380 <ipc_msg_send_wait>
    9924:	e51b3008 	ldr	r3, [fp, #-8]
    9928:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    992c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9930:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9934:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    9938:	eb001115 	bl	dd94 <strlen>
    993c:	e1a03000 	mov	r3, r0
    9940:	e2833001 	add	r3, r3, #1
    9944:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9948:	e3a01000 	mov	r1, #0
    994c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9950:	eb000a4a 	bl	c280 <ipc_msg_get_nth_arg>
    9954:	e3a03001 	mov	r3, #1
    9958:	e50b300c 	str	r3, [fp, #-12]
    995c:	e3a03000 	mov	r3, #0
    9960:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9964:	e51b3008 	ldr	r3, [fp, #-8]
    9968:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    996c:	e24b3040 	sub	r3, fp, #64	; 0x40
    9970:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9974:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9978:	e5d33000 	ldrb	r3, [r3]
    997c:	e2033002 	and	r3, r3, #2
    9980:	e6ef3073 	uxtb	r3, r3
    9984:	e3530000 	cmp	r3, #0
    9988:	1a000007 	bne	99ac <ipc_call_copy_args_Ipc_cd+0x178>
    998c:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    9990:	e3403001 	movt	r3, #1
    9994:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    9998:	e3402001 	movt	r2, #1
    999c:	e3a01074 	mov	r1, #116	; 0x74
    99a0:	e3020acc 	movw	r0, #10956	; 0x2acc
    99a4:	e3400001 	movt	r0, #1
    99a8:	eb000f40 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    99ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    99b0:	e2833008 	add	r3, r3, #8
    99b4:	e3a02004 	mov	r2, #4
    99b8:	e1a01003 	mov	r1, r3
    99bc:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    99c0:	eb000f8e 	bl	d800 <memcpy>
    99c4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    99c8:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    99cc:	e51b3010 	ldr	r3, [fp, #-16]
    99d0:	e5933010 	ldr	r3, [r3, #16]
    99d4:	e51b2010 	ldr	r2, [fp, #-16]
    99d8:	e5922008 	ldr	r2, [r2, #8]
    99dc:	e0833002 	add	r3, r3, r2
    99e0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    99e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    99e8:	e5d33000 	ldrb	r3, [r3]
    99ec:	e2033004 	and	r3, r3, #4
    99f0:	e6ef3073 	uxtb	r3, r3
    99f4:	e3530000 	cmp	r3, #0
    99f8:	0a000004 	beq	9a10 <ipc_call_copy_args_Ipc_cd+0x1dc>
    return session_free_buf(session, msg->header.len);
    99fc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9a00:	e1d330b2 	ldrh	r3, [r3, #2]
    9a04:	e1a01003 	mov	r1, r3
    9a08:	e51b0010 	ldr	r0, [fp, #-16]
    9a0c:	eb000c55 	bl	cb68 <session_free_buf>
    9a10:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    9a14:	e1a00003 	mov	r0, r3
    9a18:	e24bd004 	sub	sp, fp, #4
    9a1c:	e8bd8800 	pop	{fp, pc}

00009a20 <cd>:
int cd(struct Session* session, char* path)
{
    9a20:	e92d4800 	push	{fp, lr}
    9a24:	e28db004 	add	fp, sp, #4
    9a28:	e24dd008 	sub	sp, sp, #8
    9a2c:	e50b0008 	str	r0, [fp, #-8]
    9a30:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cd)(session, path);
    9a34:	e51b100c 	ldr	r1, [fp, #-12]
    9a38:	e51b0008 	ldr	r0, [fp, #-8]
    9a3c:	ebffff7c 	bl	9834 <ipc_call_copy_args_Ipc_cd>
    9a40:	e1a03000 	mov	r3, r0
}
    9a44:	e1a00003 	mov	r0, r3
    9a48:	e24bd004 	sub	sp, fp, #4
    9a4c:	e8bd8800 	pop	{fp, pc}

00009a50 <ipc_call_copy_args_Ipc_mkdir>:

IPC_INTERFACE(Ipc_mkdir, 1, path, strlen(path) + 1);
    9a50:	e92d4800 	push	{fp, lr}
    9a54:	e28db004 	add	fp, sp, #4
    9a58:	e24dd048 	sub	sp, sp, #72	; 0x48
    9a5c:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    9a60:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    9a64:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9a68:	e3530000 	cmp	r3, #0
    9a6c:	1a000001 	bne	9a78 <ipc_call_copy_args_Ipc_mkdir+0x28>
    9a70:	e3e03000 	mvn	r3, #0
    9a74:	ea00006d 	b	9c30 <ipc_call_copy_args_Ipc_mkdir+0x1e0>
    9a78:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9a7c:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9a80:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9a84:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9a88:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9a8c:	eb0010c0 	bl	dd94 <strlen>
    9a90:	e1a03000 	mov	r3, r0
    9a94:	e2833001 	add	r3, r3, #1
    9a98:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9a9c:	e24b3044 	sub	r3, fp, #68	; 0x44
    9aa0:	e1a02003 	mov	r2, r3
    9aa4:	e3a01001 	mov	r1, #1
    9aa8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    9aac:	eb00093e 	bl	bfac <new_ipc_msg>
    9ab0:	e1a03000 	mov	r3, r0
    9ab4:	e50b3008 	str	r3, [fp, #-8]
    9ab8:	e51b3008 	ldr	r3, [fp, #-8]
    9abc:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    9ac0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9ac4:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9ac8:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9acc:	eb0010b0 	bl	dd94 <strlen>
    9ad0:	e1a03000 	mov	r3, r0
    9ad4:	e2833001 	add	r3, r3, #1
    9ad8:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    9adc:	e3a01000 	mov	r1, #0
    9ae0:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    9ae4:	eb00099d 	bl	c160 <ipc_msg_set_nth_arg>
    9ae8:	e3a03001 	mov	r3, #1
    9aec:	e50b300c 	str	r3, [fp, #-12]
    9af0:	e51b3008 	ldr	r3, [fp, #-8]
    9af4:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9af8:	e3a03003 	mov	r3, #3
    9afc:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    9b00:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9b04:	e3530000 	cmp	r3, #0
    9b08:	ba000002 	blt	9b18 <ipc_call_copy_args_Ipc_mkdir+0xc8>
    9b0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9b10:	e35300ff 	cmp	r3, #255	; 0xff
    9b14:	da000001 	ble	9b20 <ipc_call_copy_args_Ipc_mkdir+0xd0>
        return false;
    9b18:	e3a03000 	mov	r3, #0
    9b1c:	ea000004 	b	9b34 <ipc_call_copy_args_Ipc_mkdir+0xe4>
    msg->header.opcode = opcode;
    9b20:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9b24:	e6ef2073 	uxtb	r2, r3
    9b28:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9b2c:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9b30:	e3a03001 	mov	r3, #1
    9b34:	e50b300c 	str	r3, [fp, #-12]
    9b38:	e51b0008 	ldr	r0, [fp, #-8]
    9b3c:	eb000a0f 	bl	c380 <ipc_msg_send_wait>
    9b40:	e51b3008 	ldr	r3, [fp, #-8]
    9b44:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9b48:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9b4c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9b50:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    9b54:	eb00108e 	bl	dd94 <strlen>
    9b58:	e1a03000 	mov	r3, r0
    9b5c:	e2833001 	add	r3, r3, #1
    9b60:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9b64:	e3a01000 	mov	r1, #0
    9b68:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9b6c:	eb0009c3 	bl	c280 <ipc_msg_get_nth_arg>
    9b70:	e3a03001 	mov	r3, #1
    9b74:	e50b300c 	str	r3, [fp, #-12]
    9b78:	e3a03000 	mov	r3, #0
    9b7c:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9b80:	e51b3008 	ldr	r3, [fp, #-8]
    9b84:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9b88:	e24b3040 	sub	r3, fp, #64	; 0x40
    9b8c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9b90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9b94:	e5d33000 	ldrb	r3, [r3]
    9b98:	e2033002 	and	r3, r3, #2
    9b9c:	e6ef3073 	uxtb	r3, r3
    9ba0:	e3530000 	cmp	r3, #0
    9ba4:	1a000007 	bne	9bc8 <ipc_call_copy_args_Ipc_mkdir+0x178>
    9ba8:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    9bac:	e3403001 	movt	r3, #1
    9bb0:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    9bb4:	e3402001 	movt	r2, #1
    9bb8:	e3a01074 	mov	r1, #116	; 0x74
    9bbc:	e3020acc 	movw	r0, #10956	; 0x2acc
    9bc0:	e3400001 	movt	r0, #1
    9bc4:	eb000eb9 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9bc8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9bcc:	e2833008 	add	r3, r3, #8
    9bd0:	e3a02004 	mov	r2, #4
    9bd4:	e1a01003 	mov	r1, r3
    9bd8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9bdc:	eb000f07 	bl	d800 <memcpy>
    9be0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9be4:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9be8:	e51b3010 	ldr	r3, [fp, #-16]
    9bec:	e5933010 	ldr	r3, [r3, #16]
    9bf0:	e51b2010 	ldr	r2, [fp, #-16]
    9bf4:	e5922008 	ldr	r2, [r2, #8]
    9bf8:	e0833002 	add	r3, r3, r2
    9bfc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    9c00:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9c04:	e5d33000 	ldrb	r3, [r3]
    9c08:	e2033004 	and	r3, r3, #4
    9c0c:	e6ef3073 	uxtb	r3, r3
    9c10:	e3530000 	cmp	r3, #0
    9c14:	0a000004 	beq	9c2c <ipc_call_copy_args_Ipc_mkdir+0x1dc>
    return session_free_buf(session, msg->header.len);
    9c18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9c1c:	e1d330b2 	ldrh	r3, [r3, #2]
    9c20:	e1a01003 	mov	r1, r3
    9c24:	e51b0010 	ldr	r0, [fp, #-16]
    9c28:	eb000bce 	bl	cb68 <session_free_buf>
    9c2c:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    9c30:	e1a00003 	mov	r0, r3
    9c34:	e24bd004 	sub	sp, fp, #4
    9c38:	e8bd8800 	pop	{fp, pc}

00009c3c <mkdir>:
int mkdir(struct Session* session, char* path)
{
    9c3c:	e92d4800 	push	{fp, lr}
    9c40:	e28db004 	add	fp, sp, #4
    9c44:	e24dd008 	sub	sp, sp, #8
    9c48:	e50b0008 	str	r0, [fp, #-8]
    9c4c:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_mkdir)(session, path);
    9c50:	e51b100c 	ldr	r1, [fp, #-12]
    9c54:	e51b0008 	ldr	r0, [fp, #-8]
    9c58:	ebffff7c 	bl	9a50 <ipc_call_copy_args_Ipc_mkdir>
    9c5c:	e1a03000 	mov	r3, r0
}
    9c60:	e1a00003 	mov	r0, r3
    9c64:	e24bd004 	sub	sp, fp, #4
    9c68:	e8bd8800 	pop	{fp, pc}

00009c6c <ipc_call_copy_args_Ipc_delete>:

IPC_INTERFACE(Ipc_delete, 1, path, strlen(path) + 1);
    9c6c:	e92d4800 	push	{fp, lr}
    9c70:	e28db004 	add	fp, sp, #4
    9c74:	e24dd048 	sub	sp, sp, #72	; 0x48
    9c78:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    9c7c:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    9c80:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9c84:	e3530000 	cmp	r3, #0
    9c88:	1a000001 	bne	9c94 <ipc_call_copy_args_Ipc_delete+0x28>
    9c8c:	e3e03000 	mvn	r3, #0
    9c90:	ea00006d 	b	9e4c <ipc_call_copy_args_Ipc_delete+0x1e0>
    9c94:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9c98:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9c9c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9ca0:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9ca4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9ca8:	eb001039 	bl	dd94 <strlen>
    9cac:	e1a03000 	mov	r3, r0
    9cb0:	e2833001 	add	r3, r3, #1
    9cb4:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9cb8:	e24b3044 	sub	r3, fp, #68	; 0x44
    9cbc:	e1a02003 	mov	r2, r3
    9cc0:	e3a01001 	mov	r1, #1
    9cc4:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    9cc8:	eb0008b7 	bl	bfac <new_ipc_msg>
    9ccc:	e1a03000 	mov	r3, r0
    9cd0:	e50b3008 	str	r3, [fp, #-8]
    9cd4:	e51b3008 	ldr	r3, [fp, #-8]
    9cd8:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    9cdc:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9ce0:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9ce4:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9ce8:	eb001029 	bl	dd94 <strlen>
    9cec:	e1a03000 	mov	r3, r0
    9cf0:	e2833001 	add	r3, r3, #1
    9cf4:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    9cf8:	e3a01000 	mov	r1, #0
    9cfc:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    9d00:	eb000916 	bl	c160 <ipc_msg_set_nth_arg>
    9d04:	e3a03001 	mov	r3, #1
    9d08:	e50b300c 	str	r3, [fp, #-12]
    9d0c:	e51b3008 	ldr	r3, [fp, #-8]
    9d10:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9d14:	e3a03004 	mov	r3, #4
    9d18:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    9d1c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9d20:	e3530000 	cmp	r3, #0
    9d24:	ba000002 	blt	9d34 <ipc_call_copy_args_Ipc_delete+0xc8>
    9d28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9d2c:	e35300ff 	cmp	r3, #255	; 0xff
    9d30:	da000001 	ble	9d3c <ipc_call_copy_args_Ipc_delete+0xd0>
        return false;
    9d34:	e3a03000 	mov	r3, #0
    9d38:	ea000004 	b	9d50 <ipc_call_copy_args_Ipc_delete+0xe4>
    msg->header.opcode = opcode;
    9d3c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9d40:	e6ef2073 	uxtb	r2, r3
    9d44:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9d48:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9d4c:	e3a03001 	mov	r3, #1
    9d50:	e50b300c 	str	r3, [fp, #-12]
    9d54:	e51b0008 	ldr	r0, [fp, #-8]
    9d58:	eb000988 	bl	c380 <ipc_msg_send_wait>
    9d5c:	e51b3008 	ldr	r3, [fp, #-8]
    9d60:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9d64:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9d68:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9d6c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    9d70:	eb001007 	bl	dd94 <strlen>
    9d74:	e1a03000 	mov	r3, r0
    9d78:	e2833001 	add	r3, r3, #1
    9d7c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9d80:	e3a01000 	mov	r1, #0
    9d84:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9d88:	eb00093c 	bl	c280 <ipc_msg_get_nth_arg>
    9d8c:	e3a03001 	mov	r3, #1
    9d90:	e50b300c 	str	r3, [fp, #-12]
    9d94:	e3a03000 	mov	r3, #0
    9d98:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9d9c:	e51b3008 	ldr	r3, [fp, #-8]
    9da0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9da4:	e24b3040 	sub	r3, fp, #64	; 0x40
    9da8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9dac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9db0:	e5d33000 	ldrb	r3, [r3]
    9db4:	e2033002 	and	r3, r3, #2
    9db8:	e6ef3073 	uxtb	r3, r3
    9dbc:	e3530000 	cmp	r3, #0
    9dc0:	1a000007 	bne	9de4 <ipc_call_copy_args_Ipc_delete+0x178>
    9dc4:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    9dc8:	e3403001 	movt	r3, #1
    9dcc:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    9dd0:	e3402001 	movt	r2, #1
    9dd4:	e3a01074 	mov	r1, #116	; 0x74
    9dd8:	e3020acc 	movw	r0, #10956	; 0x2acc
    9ddc:	e3400001 	movt	r0, #1
    9de0:	eb000e32 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    9de4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9de8:	e2833008 	add	r3, r3, #8
    9dec:	e3a02004 	mov	r2, #4
    9df0:	e1a01003 	mov	r1, r3
    9df4:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    9df8:	eb000e80 	bl	d800 <memcpy>
    9dfc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9e00:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    9e04:	e51b3010 	ldr	r3, [fp, #-16]
    9e08:	e5933010 	ldr	r3, [r3, #16]
    9e0c:	e51b2010 	ldr	r2, [fp, #-16]
    9e10:	e5922008 	ldr	r2, [r2, #8]
    9e14:	e0833002 	add	r3, r3, r2
    9e18:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    9e1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9e20:	e5d33000 	ldrb	r3, [r3]
    9e24:	e2033004 	and	r3, r3, #4
    9e28:	e6ef3073 	uxtb	r3, r3
    9e2c:	e3530000 	cmp	r3, #0
    9e30:	0a000004 	beq	9e48 <ipc_call_copy_args_Ipc_delete+0x1dc>
    return session_free_buf(session, msg->header.len);
    9e34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    9e38:	e1d330b2 	ldrh	r3, [r3, #2]
    9e3c:	e1a01003 	mov	r1, r3
    9e40:	e51b0010 	ldr	r0, [fp, #-16]
    9e44:	eb000b47 	bl	cb68 <session_free_buf>
    9e48:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    9e4c:	e1a00003 	mov	r0, r3
    9e50:	e24bd004 	sub	sp, fp, #4
    9e54:	e8bd8800 	pop	{fp, pc}

00009e58 <rm>:
int rm(struct Session* session, char* path)
{
    9e58:	e92d4800 	push	{fp, lr}
    9e5c:	e28db004 	add	fp, sp, #4
    9e60:	e24dd008 	sub	sp, sp, #8
    9e64:	e50b0008 	str	r0, [fp, #-8]
    9e68:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_delete)(session, path);
    9e6c:	e51b100c 	ldr	r1, [fp, #-12]
    9e70:	e51b0008 	ldr	r0, [fp, #-8]
    9e74:	ebffff7c 	bl	9c6c <ipc_call_copy_args_Ipc_delete>
    9e78:	e1a03000 	mov	r3, r0
}
    9e7c:	e1a00003 	mov	r0, r3
    9e80:	e24bd004 	sub	sp, fp, #4
    9e84:	e8bd8800 	pop	{fp, pc}

00009e88 <ipc_call_copy_args_Ipc_cat>:

IPC_INTERFACE(Ipc_cat, 1, path, strlen(path) + 1);
    9e88:	e92d4800 	push	{fp, lr}
    9e8c:	e28db004 	add	fp, sp, #4
    9e90:	e24dd048 	sub	sp, sp, #72	; 0x48
    9e94:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    9e98:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    9e9c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9ea0:	e3530000 	cmp	r3, #0
    9ea4:	1a000001 	bne	9eb0 <ipc_call_copy_args_Ipc_cat+0x28>
    9ea8:	e3e03000 	mvn	r3, #0
    9eac:	ea00006d 	b	a068 <ipc_call_copy_args_Ipc_cat+0x1e0>
    9eb0:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    9eb4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    9eb8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9ebc:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    9ec0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    9ec4:	eb000fb2 	bl	dd94 <strlen>
    9ec8:	e1a03000 	mov	r3, r0
    9ecc:	e2833001 	add	r3, r3, #1
    9ed0:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    9ed4:	e24b3044 	sub	r3, fp, #68	; 0x44
    9ed8:	e1a02003 	mov	r2, r3
    9edc:	e3a01001 	mov	r1, #1
    9ee0:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    9ee4:	eb000830 	bl	bfac <new_ipc_msg>
    9ee8:	e1a03000 	mov	r3, r0
    9eec:	e50b3008 	str	r3, [fp, #-8]
    9ef0:	e51b3008 	ldr	r3, [fp, #-8]
    9ef4:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    9ef8:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9efc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    9f00:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    9f04:	eb000fa2 	bl	dd94 <strlen>
    9f08:	e1a03000 	mov	r3, r0
    9f0c:	e2833001 	add	r3, r3, #1
    9f10:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    9f14:	e3a01000 	mov	r1, #0
    9f18:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    9f1c:	eb00088f 	bl	c160 <ipc_msg_set_nth_arg>
    9f20:	e3a03001 	mov	r3, #1
    9f24:	e50b300c 	str	r3, [fp, #-12]
    9f28:	e51b3008 	ldr	r3, [fp, #-8]
    9f2c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    9f30:	e3a03005 	mov	r3, #5
    9f34:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    9f38:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9f3c:	e3530000 	cmp	r3, #0
    9f40:	ba000002 	blt	9f50 <ipc_call_copy_args_Ipc_cat+0xc8>
    9f44:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9f48:	e35300ff 	cmp	r3, #255	; 0xff
    9f4c:	da000001 	ble	9f58 <ipc_call_copy_args_Ipc_cat+0xd0>
        return false;
    9f50:	e3a03000 	mov	r3, #0
    9f54:	ea000004 	b	9f6c <ipc_call_copy_args_Ipc_cat+0xe4>
    msg->header.opcode = opcode;
    9f58:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    9f5c:	e6ef2073 	uxtb	r2, r3
    9f60:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    9f64:	e5c32001 	strb	r2, [r3, #1]
    return true;
    9f68:	e3a03001 	mov	r3, #1
    9f6c:	e50b300c 	str	r3, [fp, #-12]
    9f70:	e51b0008 	ldr	r0, [fp, #-8]
    9f74:	eb000901 	bl	c380 <ipc_msg_send_wait>
    9f78:	e51b3008 	ldr	r3, [fp, #-8]
    9f7c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    9f80:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    9f84:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    9f88:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    9f8c:	eb000f80 	bl	dd94 <strlen>
    9f90:	e1a03000 	mov	r3, r0
    9f94:	e2833001 	add	r3, r3, #1
    9f98:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    9f9c:	e3a01000 	mov	r1, #0
    9fa0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    9fa4:	eb0008b5 	bl	c280 <ipc_msg_get_nth_arg>
    9fa8:	e3a03001 	mov	r3, #1
    9fac:	e50b300c 	str	r3, [fp, #-12]
    9fb0:	e3a03000 	mov	r3, #0
    9fb4:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    9fb8:	e51b3008 	ldr	r3, [fp, #-8]
    9fbc:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    9fc0:	e24b3040 	sub	r3, fp, #64	; 0x40
    9fc4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    9fc8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    9fcc:	e5d33000 	ldrb	r3, [r3]
    9fd0:	e2033002 	and	r3, r3, #2
    9fd4:	e6ef3073 	uxtb	r3, r3
    9fd8:	e3530000 	cmp	r3, #0
    9fdc:	1a000007 	bne	a000 <ipc_call_copy_args_Ipc_cat+0x178>
    9fe0:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    9fe4:	e3403001 	movt	r3, #1
    9fe8:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    9fec:	e3402001 	movt	r2, #1
    9ff0:	e3a01074 	mov	r1, #116	; 0x74
    9ff4:	e3020acc 	movw	r0, #10956	; 0x2acc
    9ff8:	e3400001 	movt	r0, #1
    9ffc:	eb000dab 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a000:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a004:	e2833008 	add	r3, r3, #8
    a008:	e3a02004 	mov	r2, #4
    a00c:	e1a01003 	mov	r1, r3
    a010:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a014:	eb000df9 	bl	d800 <memcpy>
    a018:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a01c:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a020:	e51b3010 	ldr	r3, [fp, #-16]
    a024:	e5933010 	ldr	r3, [r3, #16]
    a028:	e51b2010 	ldr	r2, [fp, #-16]
    a02c:	e5922008 	ldr	r2, [r2, #8]
    a030:	e0833002 	add	r3, r3, r2
    a034:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a038:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a03c:	e5d33000 	ldrb	r3, [r3]
    a040:	e2033004 	and	r3, r3, #4
    a044:	e6ef3073 	uxtb	r3, r3
    a048:	e3530000 	cmp	r3, #0
    a04c:	0a000004 	beq	a064 <ipc_call_copy_args_Ipc_cat+0x1dc>
    return session_free_buf(session, msg->header.len);
    a050:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a054:	e1d330b2 	ldrh	r3, [r3, #2]
    a058:	e1a01003 	mov	r1, r3
    a05c:	e51b0010 	ldr	r0, [fp, #-16]
    a060:	eb000ac0 	bl	cb68 <session_free_buf>
    a064:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a068:	e1a00003 	mov	r0, r3
    a06c:	e24bd004 	sub	sp, fp, #4
    a070:	e8bd8800 	pop	{fp, pc}

0000a074 <cat>:
int cat(struct Session* session, char* path)
{
    a074:	e92d4800 	push	{fp, lr}
    a078:	e28db004 	add	fp, sp, #4
    a07c:	e24dd008 	sub	sp, sp, #8
    a080:	e50b0008 	str	r0, [fp, #-8]
    a084:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_cat)(session, path);
    a088:	e51b100c 	ldr	r1, [fp, #-12]
    a08c:	e51b0008 	ldr	r0, [fp, #-8]
    a090:	ebffff7c 	bl	9e88 <ipc_call_copy_args_Ipc_cat>
    a094:	e1a03000 	mov	r3, r0
}
    a098:	e1a00003 	mov	r0, r3
    a09c:	e24bd004 	sub	sp, fp, #4
    a0a0:	e8bd8800 	pop	{fp, pc}

0000a0a4 <ipc_call_copy_args_Ipc_open>:

IPC_INTERFACE(Ipc_open, 1, path, strlen(path) + 1);
    a0a4:	e92d4800 	push	{fp, lr}
    a0a8:	e28db004 	add	fp, sp, #4
    a0ac:	e24dd048 	sub	sp, sp, #72	; 0x48
    a0b0:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a0b4:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a0b8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a0bc:	e3530000 	cmp	r3, #0
    a0c0:	1a000001 	bne	a0cc <ipc_call_copy_args_Ipc_open+0x28>
    a0c4:	e3e03000 	mvn	r3, #0
    a0c8:	ea00006d 	b	a284 <ipc_call_copy_args_Ipc_open+0x1e0>
    a0cc:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a0d0:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a0d4:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a0d8:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a0dc:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a0e0:	eb000f2b 	bl	dd94 <strlen>
    a0e4:	e1a03000 	mov	r3, r0
    a0e8:	e2833001 	add	r3, r3, #1
    a0ec:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a0f0:	e24b3044 	sub	r3, fp, #68	; 0x44
    a0f4:	e1a02003 	mov	r2, r3
    a0f8:	e3a01001 	mov	r1, #1
    a0fc:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a100:	eb0007a9 	bl	bfac <new_ipc_msg>
    a104:	e1a03000 	mov	r3, r0
    a108:	e50b3008 	str	r3, [fp, #-8]
    a10c:	e51b3008 	ldr	r3, [fp, #-8]
    a110:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a114:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a118:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a11c:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    a120:	eb000f1b 	bl	dd94 <strlen>
    a124:	e1a03000 	mov	r3, r0
    a128:	e2833001 	add	r3, r3, #1
    a12c:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a130:	e3a01000 	mov	r1, #0
    a134:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a138:	eb000808 	bl	c160 <ipc_msg_set_nth_arg>
    a13c:	e3a03001 	mov	r3, #1
    a140:	e50b300c 	str	r3, [fp, #-12]
    a144:	e51b3008 	ldr	r3, [fp, #-8]
    a148:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a14c:	e3a03006 	mov	r3, #6
    a150:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a154:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a158:	e3530000 	cmp	r3, #0
    a15c:	ba000002 	blt	a16c <ipc_call_copy_args_Ipc_open+0xc8>
    a160:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a164:	e35300ff 	cmp	r3, #255	; 0xff
    a168:	da000001 	ble	a174 <ipc_call_copy_args_Ipc_open+0xd0>
        return false;
    a16c:	e3a03000 	mov	r3, #0
    a170:	ea000004 	b	a188 <ipc_call_copy_args_Ipc_open+0xe4>
    msg->header.opcode = opcode;
    a174:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a178:	e6ef2073 	uxtb	r2, r3
    a17c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a180:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a184:	e3a03001 	mov	r3, #1
    a188:	e50b300c 	str	r3, [fp, #-12]
    a18c:	e51b0008 	ldr	r0, [fp, #-8]
    a190:	eb00087a 	bl	c380 <ipc_msg_send_wait>
    a194:	e51b3008 	ldr	r3, [fp, #-8]
    a198:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a19c:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a1a0:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a1a4:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    a1a8:	eb000ef9 	bl	dd94 <strlen>
    a1ac:	e1a03000 	mov	r3, r0
    a1b0:	e2833001 	add	r3, r3, #1
    a1b4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a1b8:	e3a01000 	mov	r1, #0
    a1bc:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a1c0:	eb00082e 	bl	c280 <ipc_msg_get_nth_arg>
    a1c4:	e3a03001 	mov	r3, #1
    a1c8:	e50b300c 	str	r3, [fp, #-12]
    a1cc:	e3a03000 	mov	r3, #0
    a1d0:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a1d4:	e51b3008 	ldr	r3, [fp, #-8]
    a1d8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a1dc:	e24b3040 	sub	r3, fp, #64	; 0x40
    a1e0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a1e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a1e8:	e5d33000 	ldrb	r3, [r3]
    a1ec:	e2033002 	and	r3, r3, #2
    a1f0:	e6ef3073 	uxtb	r3, r3
    a1f4:	e3530000 	cmp	r3, #0
    a1f8:	1a000007 	bne	a21c <ipc_call_copy_args_Ipc_open+0x178>
    a1fc:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    a200:	e3403001 	movt	r3, #1
    a204:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    a208:	e3402001 	movt	r2, #1
    a20c:	e3a01074 	mov	r1, #116	; 0x74
    a210:	e3020acc 	movw	r0, #10956	; 0x2acc
    a214:	e3400001 	movt	r0, #1
    a218:	eb000d24 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a21c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a220:	e2833008 	add	r3, r3, #8
    a224:	e3a02004 	mov	r2, #4
    a228:	e1a01003 	mov	r1, r3
    a22c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a230:	eb000d72 	bl	d800 <memcpy>
    a234:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a238:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a23c:	e51b3010 	ldr	r3, [fp, #-16]
    a240:	e5933010 	ldr	r3, [r3, #16]
    a244:	e51b2010 	ldr	r2, [fp, #-16]
    a248:	e5922008 	ldr	r2, [r2, #8]
    a24c:	e0833002 	add	r3, r3, r2
    a250:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a254:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a258:	e5d33000 	ldrb	r3, [r3]
    a25c:	e2033004 	and	r3, r3, #4
    a260:	e6ef3073 	uxtb	r3, r3
    a264:	e3530000 	cmp	r3, #0
    a268:	0a000004 	beq	a280 <ipc_call_copy_args_Ipc_open+0x1dc>
    return session_free_buf(session, msg->header.len);
    a26c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a270:	e1d330b2 	ldrh	r3, [r3, #2]
    a274:	e1a01003 	mov	r1, r3
    a278:	e51b0010 	ldr	r0, [fp, #-16]
    a27c:	eb000a39 	bl	cb68 <session_free_buf>
    a280:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a284:	e1a00003 	mov	r0, r3
    a288:	e24bd004 	sub	sp, fp, #4
    a28c:	e8bd8800 	pop	{fp, pc}

0000a290 <open>:
int open(struct Session* session, char* path)
{
    a290:	e92d4800 	push	{fp, lr}
    a294:	e28db004 	add	fp, sp, #4
    a298:	e24dd008 	sub	sp, sp, #8
    a29c:	e50b0008 	str	r0, [fp, #-8]
    a2a0:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_open)(session, path);
    a2a4:	e51b100c 	ldr	r1, [fp, #-12]
    a2a8:	e51b0008 	ldr	r0, [fp, #-8]
    a2ac:	ebffff7c 	bl	a0a4 <ipc_call_copy_args_Ipc_open>
    a2b0:	e1a03000 	mov	r3, r0
}
    a2b4:	e1a00003 	mov	r0, r3
    a2b8:	e24bd004 	sub	sp, fp, #4
    a2bc:	e8bd8800 	pop	{fp, pc}

0000a2c0 <ipc_call_copy_args_Ipc_close>:

IPC_INTERFACE(Ipc_close, 1, fd, sizeof(int));
    a2c0:	e92d4800 	push	{fp, lr}
    a2c4:	e28db004 	add	fp, sp, #4
    a2c8:	e24dd048 	sub	sp, sp, #72	; 0x48
    a2cc:	e50b0048 	str	r0, [fp, #-72]	; 0xffffffb8
    a2d0:	e50b104c 	str	r1, [fp, #-76]	; 0xffffffb4
    a2d4:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a2d8:	e3530000 	cmp	r3, #0
    a2dc:	1a000001 	bne	a2e8 <ipc_call_copy_args_Ipc_close+0x28>
    a2e0:	e3e03000 	mvn	r3, #0
    a2e4:	ea000064 	b	a47c <ipc_call_copy_args_Ipc_close+0x1bc>
    a2e8:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a2ec:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    a2f0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a2f4:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a2f8:	e3a03004 	mov	r3, #4
    a2fc:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a300:	e24b3044 	sub	r3, fp, #68	; 0x44
    a304:	e1a02003 	mov	r2, r3
    a308:	e3a01001 	mov	r1, #1
    a30c:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    a310:	eb000725 	bl	bfac <new_ipc_msg>
    a314:	e1a03000 	mov	r3, r0
    a318:	e50b3008 	str	r3, [fp, #-8]
    a31c:	e51b3008 	ldr	r3, [fp, #-8]
    a320:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a324:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a328:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a32c:	e3a03004 	mov	r3, #4
    a330:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    a334:	e3a01000 	mov	r1, #0
    a338:	e51b0030 	ldr	r0, [fp, #-48]	; 0xffffffd0
    a33c:	eb000787 	bl	c160 <ipc_msg_set_nth_arg>
    a340:	e3a03001 	mov	r3, #1
    a344:	e50b300c 	str	r3, [fp, #-12]
    a348:	e51b3008 	ldr	r3, [fp, #-8]
    a34c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a350:	e3a03007 	mov	r3, #7
    a354:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    if (opcode < 0 || opcode > UINT8_MAX) {
    a358:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a35c:	e3530000 	cmp	r3, #0
    a360:	ba000002 	blt	a370 <ipc_call_copy_args_Ipc_close+0xb0>
    a364:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a368:	e35300ff 	cmp	r3, #255	; 0xff
    a36c:	da000001 	ble	a378 <ipc_call_copy_args_Ipc_close+0xb8>
        return false;
    a370:	e3a03000 	mov	r3, #0
    a374:	ea000004 	b	a38c <ipc_call_copy_args_Ipc_close+0xcc>
    msg->header.opcode = opcode;
    a378:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    a37c:	e6ef2073 	uxtb	r2, r3
    a380:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    a384:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a388:	e3a03001 	mov	r3, #1
    a38c:	e50b300c 	str	r3, [fp, #-12]
    a390:	e51b0008 	ldr	r0, [fp, #-8]
    a394:	eb0007f9 	bl	c380 <ipc_msg_send_wait>
    a398:	e51b3008 	ldr	r3, [fp, #-8]
    a39c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a3a0:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a3a4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a3a8:	e3a03004 	mov	r3, #4
    a3ac:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a3b0:	e3a01000 	mov	r1, #0
    a3b4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a3b8:	eb0007b0 	bl	c280 <ipc_msg_get_nth_arg>
    a3bc:	e3a03001 	mov	r3, #1
    a3c0:	e50b300c 	str	r3, [fp, #-12]
    a3c4:	e3a03000 	mov	r3, #0
    a3c8:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a3cc:	e51b3008 	ldr	r3, [fp, #-8]
    a3d0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a3d4:	e24b3040 	sub	r3, fp, #64	; 0x40
    a3d8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a3dc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a3e0:	e5d33000 	ldrb	r3, [r3]
    a3e4:	e2033002 	and	r3, r3, #2
    a3e8:	e6ef3073 	uxtb	r3, r3
    a3ec:	e3530000 	cmp	r3, #0
    a3f0:	1a000007 	bne	a414 <ipc_call_copy_args_Ipc_close+0x154>
    a3f4:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    a3f8:	e3403001 	movt	r3, #1
    a3fc:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    a400:	e3402001 	movt	r2, #1
    a404:	e3a01074 	mov	r1, #116	; 0x74
    a408:	e3020acc 	movw	r0, #10956	; 0x2acc
    a40c:	e3400001 	movt	r0, #1
    a410:	eb000ca6 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a414:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a418:	e2833008 	add	r3, r3, #8
    a41c:	e3a02004 	mov	r2, #4
    a420:	e1a01003 	mov	r1, r3
    a424:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a428:	eb000cf4 	bl	d800 <memcpy>
    a42c:	e51b3048 	ldr	r3, [fp, #-72]	; 0xffffffb8
    a430:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a434:	e51b3010 	ldr	r3, [fp, #-16]
    a438:	e5933010 	ldr	r3, [r3, #16]
    a43c:	e51b2010 	ldr	r2, [fp, #-16]
    a440:	e5922008 	ldr	r2, [r2, #8]
    a444:	e0833002 	add	r3, r3, r2
    a448:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a44c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a450:	e5d33000 	ldrb	r3, [r3]
    a454:	e2033004 	and	r3, r3, #4
    a458:	e6ef3073 	uxtb	r3, r3
    a45c:	e3530000 	cmp	r3, #0
    a460:	0a000004 	beq	a478 <ipc_call_copy_args_Ipc_close+0x1b8>
    return session_free_buf(session, msg->header.len);
    a464:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a468:	e1d330b2 	ldrh	r3, [r3, #2]
    a46c:	e1a01003 	mov	r1, r3
    a470:	e51b0010 	ldr	r0, [fp, #-16]
    a474:	eb0009bb 	bl	cb68 <session_free_buf>
    a478:	e51b3040 	ldr	r3, [fp, #-64]	; 0xffffffc0
    a47c:	e1a00003 	mov	r0, r3
    a480:	e24bd004 	sub	sp, fp, #4
    a484:	e8bd8800 	pop	{fp, pc}

0000a488 <close>:
int close(struct Session* session, int fd)
{
    a488:	e92d4800 	push	{fp, lr}
    a48c:	e28db004 	add	fp, sp, #4
    a490:	e24dd008 	sub	sp, sp, #8
    a494:	e50b0008 	str	r0, [fp, #-8]
    a498:	e50b100c 	str	r1, [fp, #-12]
    return IPC_CALL(Ipc_close)(session, &fd);
    a49c:	e24b300c 	sub	r3, fp, #12
    a4a0:	e1a01003 	mov	r1, r3
    a4a4:	e51b0008 	ldr	r0, [fp, #-8]
    a4a8:	ebffff84 	bl	a2c0 <ipc_call_copy_args_Ipc_close>
    a4ac:	e1a03000 	mov	r3, r0
}
    a4b0:	e1a00003 	mov	r0, r3
    a4b4:	e24bd004 	sub	sp, fp, #4
    a4b8:	e8bd8800 	pop	{fp, pc}

0000a4bc <ipc_call_copy_args_Ipc_read>:

IPC_INTERFACE(Ipc_read, 4, fd, dst, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    a4bc:	e92d4800 	push	{fp, lr}
    a4c0:	e28db004 	add	fp, sp, #4
    a4c4:	e24dd080 	sub	sp, sp, #128	; 0x80
    a4c8:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    a4cc:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    a4d0:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    a4d4:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    a4d8:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    a4dc:	e3530000 	cmp	r3, #0
    a4e0:	1a000001 	bne	a4ec <ipc_call_copy_args_Ipc_read+0x30>
    a4e4:	e3e03000 	mvn	r3, #0
    a4e8:	ea00009d 	b	a764 <ipc_call_copy_args_Ipc_read+0x2a8>
    a4ec:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    a4f0:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    a4f4:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a4f8:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    a4fc:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a500:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    a504:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a508:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    a50c:	e59b3004 	ldr	r3, [fp, #4]
    a510:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    a514:	e3a03004 	mov	r3, #4
    a518:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    a51c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    a520:	e5933000 	ldr	r3, [r3]
    a524:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    a528:	e3a03004 	mov	r3, #4
    a52c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    a530:	e3a03004 	mov	r3, #4
    a534:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    a538:	e24b3074 	sub	r3, fp, #116	; 0x74
    a53c:	e1a02003 	mov	r2, r3
    a540:	e3a01004 	mov	r1, #4
    a544:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    a548:	eb000697 	bl	bfac <new_ipc_msg>
    a54c:	e1a03000 	mov	r3, r0
    a550:	e50b3008 	str	r3, [fp, #-8]
    a554:	e51b3008 	ldr	r3, [fp, #-8]
    a558:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a55c:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a560:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a564:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a568:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a56c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a570:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    a574:	e59b3004 	ldr	r3, [fp, #4]
    a578:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    a57c:	e3a03004 	mov	r3, #4
    a580:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    a584:	e3a01000 	mov	r1, #0
    a588:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a58c:	eb0006f3 	bl	c160 <ipc_msg_set_nth_arg>
    a590:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a594:	e5933000 	ldr	r3, [r3]
    a598:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    a59c:	e3a01001 	mov	r1, #1
    a5a0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a5a4:	eb0006ed 	bl	c160 <ipc_msg_set_nth_arg>
    a5a8:	e3a03004 	mov	r3, #4
    a5ac:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    a5b0:	e3a01002 	mov	r1, #2
    a5b4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a5b8:	eb0006e8 	bl	c160 <ipc_msg_set_nth_arg>
    a5bc:	e3a03004 	mov	r3, #4
    a5c0:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    a5c4:	e3a01003 	mov	r1, #3
    a5c8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a5cc:	eb0006e3 	bl	c160 <ipc_msg_set_nth_arg>
    a5d0:	e3a03001 	mov	r3, #1
    a5d4:	e50b300c 	str	r3, [fp, #-12]
    a5d8:	e51b3008 	ldr	r3, [fp, #-8]
    a5dc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a5e0:	e3a03008 	mov	r3, #8
    a5e4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    a5e8:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a5ec:	e3530000 	cmp	r3, #0
    a5f0:	ba000002 	blt	a600 <ipc_call_copy_args_Ipc_read+0x144>
    a5f4:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a5f8:	e35300ff 	cmp	r3, #255	; 0xff
    a5fc:	da000001 	ble	a608 <ipc_call_copy_args_Ipc_read+0x14c>
        return false;
    a600:	e3a03000 	mov	r3, #0
    a604:	ea000004 	b	a61c <ipc_call_copy_args_Ipc_read+0x160>
    msg->header.opcode = opcode;
    a608:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a60c:	e6ef2073 	uxtb	r2, r3
    a610:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a614:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a618:	e3a03001 	mov	r3, #1
    a61c:	e50b300c 	str	r3, [fp, #-12]
    a620:	e51b0008 	ldr	r0, [fp, #-8]
    a624:	eb000755 	bl	c380 <ipc_msg_send_wait>
    a628:	e51b3008 	ldr	r3, [fp, #-8]
    a62c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a630:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a634:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a638:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a63c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a640:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a644:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    a648:	e59b3004 	ldr	r3, [fp, #4]
    a64c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a650:	e3a03004 	mov	r3, #4
    a654:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a658:	e3a01000 	mov	r1, #0
    a65c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a660:	eb000706 	bl	c280 <ipc_msg_get_nth_arg>
    a664:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a668:	e5933000 	ldr	r3, [r3]
    a66c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a670:	e3a01001 	mov	r1, #1
    a674:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a678:	eb000700 	bl	c280 <ipc_msg_get_nth_arg>
    a67c:	e3a03004 	mov	r3, #4
    a680:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    a684:	e3a01002 	mov	r1, #2
    a688:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a68c:	eb0006fb 	bl	c280 <ipc_msg_get_nth_arg>
    a690:	e3a03004 	mov	r3, #4
    a694:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    a698:	e3a01003 	mov	r1, #3
    a69c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a6a0:	eb0006f6 	bl	c280 <ipc_msg_get_nth_arg>
    a6a4:	e3a03001 	mov	r3, #1
    a6a8:	e50b300c 	str	r3, [fp, #-12]
    a6ac:	e3a03000 	mov	r3, #0
    a6b0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    a6b4:	e51b3008 	ldr	r3, [fp, #-8]
    a6b8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a6bc:	e24b3064 	sub	r3, fp, #100	; 0x64
    a6c0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a6c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a6c8:	e5d33000 	ldrb	r3, [r3]
    a6cc:	e2033002 	and	r3, r3, #2
    a6d0:	e6ef3073 	uxtb	r3, r3
    a6d4:	e3530000 	cmp	r3, #0
    a6d8:	1a000007 	bne	a6fc <ipc_call_copy_args_Ipc_read+0x240>
    a6dc:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    a6e0:	e3403001 	movt	r3, #1
    a6e4:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    a6e8:	e3402001 	movt	r2, #1
    a6ec:	e3a01074 	mov	r1, #116	; 0x74
    a6f0:	e3020acc 	movw	r0, #10956	; 0x2acc
    a6f4:	e3400001 	movt	r0, #1
    a6f8:	eb000bec 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a6fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a700:	e2833008 	add	r3, r3, #8
    a704:	e3a02004 	mov	r2, #4
    a708:	e1a01003 	mov	r1, r3
    a70c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    a710:	eb000c3a 	bl	d800 <memcpy>
    a714:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    a718:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    a71c:	e51b3010 	ldr	r3, [fp, #-16]
    a720:	e5933010 	ldr	r3, [r3, #16]
    a724:	e51b2010 	ldr	r2, [fp, #-16]
    a728:	e5922008 	ldr	r2, [r2, #8]
    a72c:	e0833002 	add	r3, r3, r2
    a730:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    a734:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a738:	e5d33000 	ldrb	r3, [r3]
    a73c:	e2033004 	and	r3, r3, #4
    a740:	e6ef3073 	uxtb	r3, r3
    a744:	e3530000 	cmp	r3, #0
    a748:	0a000004 	beq	a760 <ipc_call_copy_args_Ipc_read+0x2a4>
    return session_free_buf(session, msg->header.len);
    a74c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    a750:	e1d330b2 	ldrh	r3, [r3, #2]
    a754:	e1a01003 	mov	r1, r3
    a758:	e51b0010 	ldr	r0, [fp, #-16]
    a75c:	eb000901 	bl	cb68 <session_free_buf>
    a760:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    a764:	e1a00003 	mov	r0, r3
    a768:	e24bd004 	sub	sp, fp, #4
    a76c:	e8bd8800 	pop	{fp, pc}

0000a770 <read>:
int read(struct Session* session, int fd, char* dst, int offset, int len)
{
    a770:	e92d4800 	push	{fp, lr}
    a774:	e28db004 	add	fp, sp, #4
    a778:	e24dd018 	sub	sp, sp, #24
    a77c:	e50b0008 	str	r0, [fp, #-8]
    a780:	e50b100c 	str	r1, [fp, #-12]
    a784:	e50b2010 	str	r2, [fp, #-16]
    a788:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_read)(session, &fd, dst, &offset, &len);
    a78c:	e24b2014 	sub	r2, fp, #20
    a790:	e24b100c 	sub	r1, fp, #12
    a794:	e28b3004 	add	r3, fp, #4
    a798:	e58d3000 	str	r3, [sp]
    a79c:	e1a03002 	mov	r3, r2
    a7a0:	e51b2010 	ldr	r2, [fp, #-16]
    a7a4:	e51b0008 	ldr	r0, [fp, #-8]
    a7a8:	ebffff43 	bl	a4bc <ipc_call_copy_args_Ipc_read>
    a7ac:	e1a03000 	mov	r3, r0
}
    a7b0:	e1a00003 	mov	r0, r3
    a7b4:	e24bd004 	sub	sp, fp, #4
    a7b8:	e8bd8800 	pop	{fp, pc}

0000a7bc <ipc_call_copy_args_Ipc_write>:

IPC_INTERFACE(Ipc_write, 4, fd, src, offset, len, sizeof(int), *(int*)len, sizeof(int), sizeof(int));
    a7bc:	e92d4800 	push	{fp, lr}
    a7c0:	e28db004 	add	fp, sp, #4
    a7c4:	e24dd080 	sub	sp, sp, #128	; 0x80
    a7c8:	e50b0078 	str	r0, [fp, #-120]	; 0xffffff88
    a7cc:	e50b107c 	str	r1, [fp, #-124]	; 0xffffff84
    a7d0:	e50b2080 	str	r2, [fp, #-128]	; 0xffffff80
    a7d4:	e50b3084 	str	r3, [fp, #-132]	; 0xffffff7c
    a7d8:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    a7dc:	e3530000 	cmp	r3, #0
    a7e0:	1a000001 	bne	a7ec <ipc_call_copy_args_Ipc_write+0x30>
    a7e4:	e3e03000 	mvn	r3, #0
    a7e8:	ea00009d 	b	aa64 <ipc_call_copy_args_Ipc_write+0x2a8>
    a7ec:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    a7f0:	e50b3050 	str	r3, [fp, #-80]	; 0xffffffb0
    a7f4:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a7f8:	e50b3054 	str	r3, [fp, #-84]	; 0xffffffac
    a7fc:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a800:	e50b3058 	str	r3, [fp, #-88]	; 0xffffffa8
    a804:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a808:	e50b305c 	str	r3, [fp, #-92]	; 0xffffffa4
    a80c:	e59b3004 	ldr	r3, [fp, #4]
    a810:	e50b3060 	str	r3, [fp, #-96]	; 0xffffffa0
    a814:	e3a03004 	mov	r3, #4
    a818:	e50b3074 	str	r3, [fp, #-116]	; 0xffffff8c
    a81c:	e51b3060 	ldr	r3, [fp, #-96]	; 0xffffffa0
    a820:	e5933000 	ldr	r3, [r3]
    a824:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
    a828:	e3a03004 	mov	r3, #4
    a82c:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
    a830:	e3a03004 	mov	r3, #4
    a834:	e50b3068 	str	r3, [fp, #-104]	; 0xffffff98
    a838:	e24b3074 	sub	r3, fp, #116	; 0x74
    a83c:	e1a02003 	mov	r2, r3
    a840:	e3a01004 	mov	r1, #4
    a844:	e51b0050 	ldr	r0, [fp, #-80]	; 0xffffffb0
    a848:	eb0005d7 	bl	bfac <new_ipc_msg>
    a84c:	e1a03000 	mov	r3, r0
    a850:	e50b3008 	str	r3, [fp, #-8]
    a854:	e51b3008 	ldr	r3, [fp, #-8]
    a858:	e50b303c 	str	r3, [fp, #-60]	; 0xffffffc4
    a85c:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a860:	e50b3040 	str	r3, [fp, #-64]	; 0xffffffc0
    a864:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a868:	e50b3044 	str	r3, [fp, #-68]	; 0xffffffbc
    a86c:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a870:	e50b3048 	str	r3, [fp, #-72]	; 0xffffffb8
    a874:	e59b3004 	ldr	r3, [fp, #4]
    a878:	e50b304c 	str	r3, [fp, #-76]	; 0xffffffb4
    a87c:	e3a03004 	mov	r3, #4
    a880:	e51b2040 	ldr	r2, [fp, #-64]	; 0xffffffc0
    a884:	e3a01000 	mov	r1, #0
    a888:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a88c:	eb000633 	bl	c160 <ipc_msg_set_nth_arg>
    a890:	e51b304c 	ldr	r3, [fp, #-76]	; 0xffffffb4
    a894:	e5933000 	ldr	r3, [r3]
    a898:	e51b2044 	ldr	r2, [fp, #-68]	; 0xffffffbc
    a89c:	e3a01001 	mov	r1, #1
    a8a0:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a8a4:	eb00062d 	bl	c160 <ipc_msg_set_nth_arg>
    a8a8:	e3a03004 	mov	r3, #4
    a8ac:	e51b2048 	ldr	r2, [fp, #-72]	; 0xffffffb8
    a8b0:	e3a01002 	mov	r1, #2
    a8b4:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a8b8:	eb000628 	bl	c160 <ipc_msg_set_nth_arg>
    a8bc:	e3a03004 	mov	r3, #4
    a8c0:	e51b204c 	ldr	r2, [fp, #-76]	; 0xffffffb4
    a8c4:	e3a01003 	mov	r1, #3
    a8c8:	e51b003c 	ldr	r0, [fp, #-60]	; 0xffffffc4
    a8cc:	eb000623 	bl	c160 <ipc_msg_set_nth_arg>
    a8d0:	e3a03001 	mov	r3, #1
    a8d4:	e50b300c 	str	r3, [fp, #-12]
    a8d8:	e51b3008 	ldr	r3, [fp, #-8]
    a8dc:	e50b3034 	str	r3, [fp, #-52]	; 0xffffffcc
    a8e0:	e3a03009 	mov	r3, #9
    a8e4:	e50b3038 	str	r3, [fp, #-56]	; 0xffffffc8
    if (opcode < 0 || opcode > UINT8_MAX) {
    a8e8:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a8ec:	e3530000 	cmp	r3, #0
    a8f0:	ba000002 	blt	a900 <ipc_call_copy_args_Ipc_write+0x144>
    a8f4:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a8f8:	e35300ff 	cmp	r3, #255	; 0xff
    a8fc:	da000001 	ble	a908 <ipc_call_copy_args_Ipc_write+0x14c>
        return false;
    a900:	e3a03000 	mov	r3, #0
    a904:	ea000004 	b	a91c <ipc_call_copy_args_Ipc_write+0x160>
    msg->header.opcode = opcode;
    a908:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    a90c:	e6ef2073 	uxtb	r2, r3
    a910:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    a914:	e5c32001 	strb	r2, [r3, #1]
    return true;
    a918:	e3a03001 	mov	r3, #1
    a91c:	e50b300c 	str	r3, [fp, #-12]
    a920:	e51b0008 	ldr	r0, [fp, #-8]
    a924:	eb000695 	bl	c380 <ipc_msg_send_wait>
    a928:	e51b3008 	ldr	r3, [fp, #-8]
    a92c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    a930:	e51b307c 	ldr	r3, [fp, #-124]	; 0xffffff84
    a934:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    a938:	e51b3080 	ldr	r3, [fp, #-128]	; 0xffffff80
    a93c:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    a940:	e51b3084 	ldr	r3, [fp, #-132]	; 0xffffff7c
    a944:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    a948:	e59b3004 	ldr	r3, [fp, #4]
    a94c:	e50b3030 	str	r3, [fp, #-48]	; 0xffffffd0
    a950:	e3a03004 	mov	r3, #4
    a954:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    a958:	e3a01000 	mov	r1, #0
    a95c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a960:	eb000646 	bl	c280 <ipc_msg_get_nth_arg>
    a964:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    a968:	e5933000 	ldr	r3, [r3]
    a96c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
    a970:	e3a01001 	mov	r1, #1
    a974:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a978:	eb000640 	bl	c280 <ipc_msg_get_nth_arg>
    a97c:	e3a03004 	mov	r3, #4
    a980:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
    a984:	e3a01002 	mov	r1, #2
    a988:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a98c:	eb00063b 	bl	c280 <ipc_msg_get_nth_arg>
    a990:	e3a03004 	mov	r3, #4
    a994:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    a998:	e3a01003 	mov	r1, #3
    a99c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    a9a0:	eb000636 	bl	c280 <ipc_msg_get_nth_arg>
    a9a4:	e3a03001 	mov	r3, #1
    a9a8:	e50b300c 	str	r3, [fp, #-12]
    a9ac:	e3a03000 	mov	r3, #0
    a9b0:	e50b3064 	str	r3, [fp, #-100]	; 0xffffff9c
    a9b4:	e51b3008 	ldr	r3, [fp, #-8]
    a9b8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    a9bc:	e24b3064 	sub	r3, fp, #100	; 0x64
    a9c0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    assert(msg->header.done == 1);
    a9c4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    a9c8:	e5d33000 	ldrb	r3, [r3]
    a9cc:	e2033002 	and	r3, r3, #2
    a9d0:	e6ef3073 	uxtb	r3, r3
    a9d4:	e3530000 	cmp	r3, #0
    a9d8:	1a000007 	bne	a9fc <ipc_call_copy_args_Ipc_write+0x240>
    a9dc:	e3023ab4 	movw	r3, #10932	; 0x2ab4
    a9e0:	e3403001 	movt	r3, #1
    a9e4:	e3022b1c 	movw	r2, #11036	; 0x2b1c
    a9e8:	e3402001 	movt	r2, #1
    a9ec:	e3a01074 	mov	r1, #116	; 0x74
    a9f0:	e3020acc 	movw	r0, #10956	; 0x2acc
    a9f4:	e3400001 	movt	r0, #1
    a9f8:	eb000b2c 	bl	d6b0 <__assert_func>
    memcpy(ret_val, &msg->header.ret_val, sizeof(msg->header.ret_val));
    a9fc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    aa00:	e2833008 	add	r3, r3, #8
    aa04:	e3a02004 	mov	r2, #4
    aa08:	e1a01003 	mov	r1, r3
    aa0c:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    aa10:	eb000b7a 	bl	d800 <memcpy>
    aa14:	e51b3078 	ldr	r3, [fp, #-120]	; 0xffffff88
    aa18:	e50b3010 	str	r3, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    aa1c:	e51b3010 	ldr	r3, [fp, #-16]
    aa20:	e5933010 	ldr	r3, [r3, #16]
    aa24:	e51b2010 	ldr	r2, [fp, #-16]
    aa28:	e5922008 	ldr	r2, [r2, #8]
    aa2c:	e0833002 	add	r3, r3, r2
    aa30:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (msg->header.init != 1) {
    aa34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aa38:	e5d33000 	ldrb	r3, [r3]
    aa3c:	e2033004 	and	r3, r3, #4
    aa40:	e6ef3073 	uxtb	r3, r3
    aa44:	e3530000 	cmp	r3, #0
    aa48:	0a000004 	beq	aa60 <ipc_call_copy_args_Ipc_write+0x2a4>
    return session_free_buf(session, msg->header.len);
    aa4c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    aa50:	e1d330b2 	ldrh	r3, [r3, #2]
    aa54:	e1a01003 	mov	r1, r3
    aa58:	e51b0010 	ldr	r0, [fp, #-16]
    aa5c:	eb000841 	bl	cb68 <session_free_buf>
    aa60:	e51b3064 	ldr	r3, [fp, #-100]	; 0xffffff9c
    aa64:	e1a00003 	mov	r0, r3
    aa68:	e24bd004 	sub	sp, fp, #4
    aa6c:	e8bd8800 	pop	{fp, pc}

0000aa70 <write>:
int write(struct Session* session, int fd, char* src, int offset, int len)
{
    aa70:	e92d4800 	push	{fp, lr}
    aa74:	e28db004 	add	fp, sp, #4
    aa78:	e24dd018 	sub	sp, sp, #24
    aa7c:	e50b0008 	str	r0, [fp, #-8]
    aa80:	e50b100c 	str	r1, [fp, #-12]
    aa84:	e50b2010 	str	r2, [fp, #-16]
    aa88:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return IPC_CALL(Ipc_write)(session, &fd, src, &offset, &len);
    aa8c:	e24b2014 	sub	r2, fp, #20
    aa90:	e24b100c 	sub	r1, fp, #12
    aa94:	e28b3004 	add	r3, fp, #4
    aa98:	e58d3000 	str	r3, [sp]
    aa9c:	e1a03002 	mov	r3, r2
    aaa0:	e51b2010 	ldr	r2, [fp, #-16]
    aaa4:	e51b0008 	ldr	r0, [fp, #-8]
    aaa8:	ebffff43 	bl	a7bc <ipc_call_copy_args_Ipc_write>
    aaac:	e1a03000 	mov	r3, r0
    aab0:	e1a00003 	mov	r0, r3
    aab4:	e24bd004 	sub	sp, fp, #4
    aab8:	e8bd8800 	pop	{fp, pc}

0000aabc <Error>:
#include "block_io.h"
#include "fs.h"
#include "libserial.h"

static void Error(char* s)
{
    aabc:	e92d4800 	push	{fp, lr}
    aac0:	e28db004 	add	fp, sp, #4
    aac4:	e24dd008 	sub	sp, sp, #8
    aac8:	e50b0008 	str	r0, [fp, #-8]
    printf("Error: %s\n", s);
    aacc:	e51b1008 	ldr	r1, [fp, #-8]
    aad0:	e3020b30 	movw	r0, #11056	; 0x2b30
    aad4:	e3400001 	movt	r0, #1
    aad8:	eb0004a8 	bl	bd80 <printf>
    for (;;)
    aadc:	eafffffe 	b	aadc <Error+0x20>

0000aae0 <MemFsInit>:

struct MemFsRange MemFsRange;

/// @brief Using syscall to get fs.img real location in the memory
void MemFsInit(uintptr_t _binary_fs_img_start, uint32_t fs_img_len)
{
    aae0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    aae4:	e28db000 	add	fp, sp, #0
    aae8:	e24dd00c 	sub	sp, sp, #12
    aaec:	e50b0008 	str	r0, [fp, #-8]
    aaf0:	e50b100c 	str	r1, [fp, #-12]
    MemFsRange.memfs_start = _binary_fs_img_start;
    aaf4:	e30c3178 	movw	r3, #49528	; 0xc178
    aaf8:	e3403003 	movt	r3, #3
    aafc:	e51b2008 	ldr	r2, [fp, #-8]
    ab00:	e5832000 	str	r2, [r3]
    MemFsRange.memfs_nr_blocks = fs_img_len / BLOCK_SIZE;
    ab04:	e51b300c 	ldr	r3, [fp, #-12]
    ab08:	e1a024a3 	lsr	r2, r3, #9
    ab0c:	e30c3178 	movw	r3, #49528	; 0xc178
    ab10:	e3403003 	movt	r3, #3
    ab14:	e5832004 	str	r2, [r3, #4]
}
    ab18:	e320f000 	nop	{0}
    ab1c:	e28bd000 	add	sp, fp, #0
    ab20:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    ab24:	e12fff1e 	bx	lr

0000ab28 <ReadSuperBlock>:

/// @brief Read the super block.
void ReadSuperBlock(struct SuperBlock* sb)
{
    ab28:	e92d4800 	push	{fp, lr}
    ab2c:	e28db004 	add	fp, sp, #4
    ab30:	e24dd010 	sub	sp, sp, #16
    ab34:	e50b0010 	str	r0, [fp, #-16]
    uint8_t* data = BlockRead(ROOT_INUM);
    ab38:	e3a00001 	mov	r0, #1
    ab3c:	eb000862 	bl	cccc <BlockRead>
    ab40:	e50b0008 	str	r0, [fp, #-8]
    memmove(sb, data, sizeof(*sb));
    ab44:	e3a0200c 	mov	r2, #12
    ab48:	e51b1008 	ldr	r1, [fp, #-8]
    ab4c:	e51b0010 	ldr	r0, [fp, #-16]
    ab50:	eb000b6f 	bl	d914 <memmove>
}
    ab54:	e320f000 	nop	{0}
    ab58:	e24bd004 	sub	sp, fp, #4
    ab5c:	e8bd8800 	pop	{fp, pc}

0000ab60 <InodeGet>:

/// @brief Get a existed Inode by inum
struct Inode* InodeGet(uint32_t inum)
{
    ab60:	e92d4800 	push	{fp, lr}
    ab64:	e28db004 	add	fp, sp, #4
    ab68:	e24dd010 	sub	sp, sp, #16
    ab6c:	e50b0010 	str	r0, [fp, #-16]
    struct Inode* ip;
    uint8_t* data = BlockRead(BLOCK_INDEX(inum));
    ab70:	e51b3010 	ldr	r3, [fp, #-16]
    ab74:	e1a031a3 	lsr	r3, r3, #3
    ab78:	e2833002 	add	r3, r3, #2
    ab7c:	e1a00003 	mov	r0, r3
    ab80:	eb000851 	bl	cccc <BlockRead>
    ab84:	e50b0008 	str	r0, [fp, #-8]
    ip = (struct Inode*)data + INODE_INDEX(inum);
    ab88:	e51b3010 	ldr	r3, [fp, #-16]
    ab8c:	e2033007 	and	r3, r3, #7
    ab90:	e1a03303 	lsl	r3, r3, #6
    ab94:	e51b2008 	ldr	r2, [fp, #-8]
    ab98:	e0823003 	add	r3, r2, r3
    ab9c:	e50b300c 	str	r3, [fp, #-12]
    return ip;
    aba0:	e51b300c 	ldr	r3, [fp, #-12]
}
    aba4:	e1a00003 	mov	r0, r3
    aba8:	e24bd004 	sub	sp, fp, #4
    abac:	e8bd8800 	pop	{fp, pc}

0000abb0 <InodeAlloc>:

/// @brief Alloc a new Inode using type
static struct Inode* InodeAlloc(short type)
{
    abb0:	e92d4800 	push	{fp, lr}
    abb4:	e28db004 	add	fp, sp, #4
    abb8:	e24dd020 	sub	sp, sp, #32
    abbc:	e1a03000 	mov	r3, r0
    abc0:	e14b31be 	strh	r3, [fp, #-30]	; 0xffffffe2
    int inum;
    struct Inode* ip;
    struct SuperBlock sb;

    ReadSuperBlock(&sb);
    abc4:	e24b301c 	sub	r3, fp, #28
    abc8:	e1a00003 	mov	r0, r3
    abcc:	ebffffd5 	bl	ab28 <ReadSuperBlock>
    for (inum = 1; inum < sb.ninodes; inum++) {
    abd0:	e3a03001 	mov	r3, #1
    abd4:	e50b3008 	str	r3, [fp, #-8]
    abd8:	ea000024 	b	ac70 <InodeAlloc+0xc0>
        uint8_t* data = BlockRead(BLOCK_INDEX(inum));
    abdc:	e51b3008 	ldr	r3, [fp, #-8]
    abe0:	e1a031a3 	lsr	r3, r3, #3
    abe4:	e2833002 	add	r3, r3, #2
    abe8:	e1a00003 	mov	r0, r3
    abec:	eb000836 	bl	cccc <BlockRead>
    abf0:	e50b000c 	str	r0, [fp, #-12]
        ip = (struct Inode*)data + INODE_INDEX(inum);
    abf4:	e51b3008 	ldr	r3, [fp, #-8]
    abf8:	e2033007 	and	r3, r3, #7
    abfc:	e1a03303 	lsl	r3, r3, #6
    ac00:	e51b200c 	ldr	r2, [fp, #-12]
    ac04:	e0823003 	add	r3, r2, r3
    ac08:	e50b3010 	str	r3, [fp, #-16]
        if (ip->type == 0) {
    ac0c:	e51b3010 	ldr	r3, [fp, #-16]
    ac10:	e1d330f4 	ldrsh	r3, [r3, #4]
    ac14:	e3530000 	cmp	r3, #0
    ac18:	1a000011 	bne	ac64 <InodeAlloc+0xb4>
            memset(ip, 0, sizeof(*ip));
    ac1c:	e3a02040 	mov	r2, #64	; 0x40
    ac20:	e3a01000 	mov	r1, #0
    ac24:	e51b0010 	ldr	r0, [fp, #-16]
    ac28:	eb000b8b 	bl	da5c <memset>
            ip->inum = inum;
    ac2c:	e51b2008 	ldr	r2, [fp, #-8]
    ac30:	e51b3010 	ldr	r3, [fp, #-16]
    ac34:	e5832000 	str	r2, [r3]
            ip->type = type;
    ac38:	e51b3010 	ldr	r3, [fp, #-16]
    ac3c:	e15b21be 	ldrh	r2, [fp, #-30]	; 0xffffffe2
    ac40:	e1c320b4 	strh	r2, [r3, #4]
            ip->nlink = 1;
    ac44:	e51b3010 	ldr	r3, [fp, #-16]
    ac48:	e3a02001 	mov	r2, #1
    ac4c:	e1c320b6 	strh	r2, [r3, #6]
            ip->size = 0;
    ac50:	e51b3010 	ldr	r3, [fp, #-16]
    ac54:	e3a02000 	mov	r2, #0
    ac58:	e5832008 	str	r2, [r3, #8]
            return ip;
    ac5c:	e51b3010 	ldr	r3, [fp, #-16]
    ac60:	ea00000a 	b	ac90 <InodeAlloc+0xe0>
    for (inum = 1; inum < sb.ninodes; inum++) {
    ac64:	e51b3008 	ldr	r3, [fp, #-8]
    ac68:	e2833001 	add	r3, r3, #1
    ac6c:	e50b3008 	str	r3, [fp, #-8]
    ac70:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    ac74:	e51b3008 	ldr	r3, [fp, #-8]
    ac78:	e1520003 	cmp	r2, r3
    ac7c:	8affffd6 	bhi	abdc <InodeAlloc+0x2c>
        }
    }

    Error("InodeAlloc: no inodes");
    ac80:	e3020b3c 	movw	r0, #11068	; 0x2b3c
    ac84:	e3400001 	movt	r0, #1
    ac88:	ebffff8b 	bl	aabc <Error>
    return NULL;
    ac8c:	e3a03000 	mov	r3, #0
}
    ac90:	e1a00003 	mov	r0, r3
    ac94:	e24bd004 	sub	sp, fp, #4
    ac98:	e8bd8800 	pop	{fp, pc}

0000ac9c <InodeFree>:

/// @brief Free the existed Inode
static int InodeFree(struct Inode* ip)
{
    ac9c:	e92d4800 	push	{fp, lr}
    aca0:	e28db004 	add	fp, sp, #4
    aca4:	e24dd010 	sub	sp, sp, #16
    aca8:	e50b0010 	str	r0, [fp, #-16]
    uint8_t* data = BlockRead(BLOCK_INDEX(ip->inum));
    acac:	e51b3010 	ldr	r3, [fp, #-16]
    acb0:	e5933000 	ldr	r3, [r3]
    acb4:	e1a031a3 	lsr	r3, r3, #3
    acb8:	e2833002 	add	r3, r3, #2
    acbc:	e1a00003 	mov	r0, r3
    acc0:	eb000801 	bl	cccc <BlockRead>
    acc4:	e50b0008 	str	r0, [fp, #-8]
    struct Inode* dip = (struct Inode*)data + INODE_INDEX(ip->inum);
    acc8:	e51b3010 	ldr	r3, [fp, #-16]
    accc:	e5933000 	ldr	r3, [r3]
    acd0:	e2033007 	and	r3, r3, #7
    acd4:	e1a03303 	lsl	r3, r3, #6
    acd8:	e51b2008 	ldr	r2, [fp, #-8]
    acdc:	e0823003 	add	r3, r2, r3
    ace0:	e50b300c 	str	r3, [fp, #-12]
    dip->type = 0;
    ace4:	e51b300c 	ldr	r3, [fp, #-12]
    ace8:	e3a02000 	mov	r2, #0
    acec:	e1c320b4 	strh	r2, [r3, #4]

    return 0;
    acf0:	e3a03000 	mov	r3, #0
}
    acf4:	e1a00003 	mov	r0, r3
    acf8:	e24bd004 	sub	sp, fp, #4
    acfc:	e8bd8800 	pop	{fp, pc}

0000ad00 <InodeFreeRecursive>:

/// @brief Delete the dir and all files or dirs under the dir.
static int InodeFreeRecursive(struct Inode* dp)
{
    ad00:	e92d4800 	push	{fp, lr}
    ad04:	e28db004 	add	fp, sp, #4
    ad08:	e24dd020 	sub	sp, sp, #32
    ad0c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    uint32_t off;
    struct Inode* ip;
    struct DirectEntry de;

    for (off = 0; off < dp->size; off += sizeof(de)) {
    ad10:	e3a03000 	mov	r3, #0
    ad14:	e50b3008 	str	r3, [fp, #-8]
    ad18:	ea000047 	b	ae3c <InodeFreeRecursive+0x13c>
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    ad1c:	e51b2008 	ldr	r2, [fp, #-8]
    ad20:	e24b101c 	sub	r1, fp, #28
    ad24:	e3a03010 	mov	r3, #16
    ad28:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    ad2c:	eb000214 	bl	b584 <InodeRead>
    ad30:	e1a03000 	mov	r3, r0
    ad34:	e3530010 	cmp	r3, #16
    ad38:	0a000002 	beq	ad48 <InodeFreeRecursive+0x48>
            Error("inode_delete_dir failed: read directory entry failed");
    ad3c:	e3020b54 	movw	r0, #11092	; 0x2b54
    ad40:	e3400001 	movt	r0, #1
    ad44:	ebffff5c 	bl	aabc <Error>
        }

        // unlink dir
        if (de.inum == 0 || strcmp(de.name, "..") == 0 || strcmp(de.name, ".") == 0) {
    ad48:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
    ad4c:	e3530000 	cmp	r3, #0
    ad50:	0a000035 	beq	ae2c <InodeFreeRecursive+0x12c>
    ad54:	e24b301c 	sub	r3, fp, #28
    ad58:	e2833002 	add	r3, r3, #2
    ad5c:	e3021b8c 	movw	r1, #11148	; 0x2b8c
    ad60:	e3401001 	movt	r1, #1
    ad64:	e1a00003 	mov	r0, r3
    ad68:	eb000b80 	bl	db70 <strcmp>
    ad6c:	e1a03000 	mov	r3, r0
    ad70:	e3530000 	cmp	r3, #0
    ad74:	0a00002c 	beq	ae2c <InodeFreeRecursive+0x12c>
    ad78:	e24b301c 	sub	r3, fp, #28
    ad7c:	e2833002 	add	r3, r3, #2
    ad80:	e3021b90 	movw	r1, #11152	; 0x2b90
    ad84:	e3401001 	movt	r1, #1
    ad88:	e1a00003 	mov	r0, r3
    ad8c:	eb000b77 	bl	db70 <strcmp>
    ad90:	e1a03000 	mov	r3, r0
    ad94:	e3530000 	cmp	r3, #0
    ad98:	0a000023 	beq	ae2c <InodeFreeRecursive+0x12c>
            continue;
        }

        ip = InodeGet(de.inum);
    ad9c:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
    ada0:	e1a00003 	mov	r0, r3
    ada4:	ebffff6d 	bl	ab60 <InodeGet>
    ada8:	e50b000c 	str	r0, [fp, #-12]
        if (ip->type == T_DIR) {
    adac:	e51b300c 	ldr	r3, [fp, #-12]
    adb0:	e1d330f4 	ldrsh	r3, [r3, #4]
    adb4:	e3530001 	cmp	r3, #1
    adb8:	1a000006 	bne	add8 <InodeFreeRecursive+0xd8>
            if (InodeFreeRecursive(ip) < 0) {
    adbc:	e51b000c 	ldr	r0, [fp, #-12]
    adc0:	ebffffce 	bl	ad00 <InodeFreeRecursive>
    adc4:	e1a03000 	mov	r3, r0
    adc8:	e3530000 	cmp	r3, #0
    adcc:	aa000007 	bge	adf0 <InodeFreeRecursive+0xf0>
                return -1;
    add0:	e3e03000 	mvn	r3, #0
    add4:	ea00001e 	b	ae54 <InodeFreeRecursive+0x154>
            }
        } else if (ip->type == T_FILE) {
    add8:	e51b300c 	ldr	r3, [fp, #-12]
    addc:	e1d330f4 	ldrsh	r3, [r3, #4]
    ade0:	e3530002 	cmp	r3, #2
    ade4:	1a000001 	bne	adf0 <InodeFreeRecursive+0xf0>
            InodeFree(ip);
    ade8:	e51b000c 	ldr	r0, [fp, #-12]
    adec:	ebffffaa 	bl	ac9c <InodeFree>
        }

        // delete the dir entry
        de.inum = 0;
    adf0:	e3a03000 	mov	r3, #0
    adf4:	e14b31bc 	strh	r3, [fp, #-28]	; 0xffffffe4
        if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    adf8:	e24b101c 	sub	r1, fp, #28
    adfc:	e3a03010 	mov	r3, #16
    ae00:	e51b2008 	ldr	r2, [fp, #-8]
    ae04:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    ae08:	eb00023d 	bl	b704 <InodeWrite>
    ae0c:	e1a03000 	mov	r3, r0
    ae10:	e3530010 	cmp	r3, #16
    ae14:	0a000005 	beq	ae30 <InodeFreeRecursive+0x130>
            printf("InodeDelete failed: clear directory entry failed");
    ae18:	e3020b94 	movw	r0, #11156	; 0x2b94
    ae1c:	e3400001 	movt	r0, #1
    ae20:	eb0003d6 	bl	bd80 <printf>
            return -1;
    ae24:	e3e03000 	mvn	r3, #0
    ae28:	ea000009 	b	ae54 <InodeFreeRecursive+0x154>
            continue;
    ae2c:	e320f000 	nop	{0}
    for (off = 0; off < dp->size; off += sizeof(de)) {
    ae30:	e51b3008 	ldr	r3, [fp, #-8]
    ae34:	e2833010 	add	r3, r3, #16
    ae38:	e50b3008 	str	r3, [fp, #-8]
    ae3c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    ae40:	e5932008 	ldr	r2, [r3, #8]
    ae44:	e51b3008 	ldr	r3, [fp, #-8]
    ae48:	e1520003 	cmp	r2, r3
    ae4c:	8affffb2 	bhi	ad1c <InodeFreeRecursive+0x1c>
        }
    }
    return 0;
    ae50:	e3a03000 	mov	r3, #0
}
    ae54:	e1a00003 	mov	r0, r3
    ae58:	e24bd004 	sub	sp, fp, #4
    ae5c:	e8bd8800 	pop	{fp, pc}

0000ae60 <InodeDelete>:

/// @brief Delete a file Inode or a dir Inode
int InodeDelete(struct Inode* dp, char* name)
{
    ae60:	e92d4800 	push	{fp, lr}
    ae64:	e28db004 	add	fp, sp, #4
    ae68:	e24dd020 	sub	sp, sp, #32
    ae6c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    ae70:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uint32_t off;
    struct Inode* ip;
    struct DirectEntry de;

    if ((ip = DirInodeLookup(dp, name, &off)) == 0) {
    ae74:	e24b300c 	sub	r3, fp, #12
    ae78:	e1a02003 	mov	r2, r3
    ae7c:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    ae80:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    ae84:	eb0000de 	bl	b204 <DirInodeLookup>
    ae88:	e50b0008 	str	r0, [fp, #-8]
    ae8c:	e51b3008 	ldr	r3, [fp, #-8]
    ae90:	e3530000 	cmp	r3, #0
    ae94:	1a000004 	bne	aeac <InodeDelete+0x4c>
        Error("Inode delete failed, file not exsit");
    ae98:	e3020bc8 	movw	r0, #11208	; 0x2bc8
    ae9c:	e3400001 	movt	r0, #1
    aea0:	ebffff05 	bl	aabc <Error>
        return -1;
    aea4:	e3e03000 	mvn	r3, #0
    aea8:	ea00001c 	b	af20 <InodeDelete+0xc0>
    }

    InodeFree(ip);
    aeac:	e51b0008 	ldr	r0, [fp, #-8]
    aeb0:	ebffff79 	bl	ac9c <InodeFree>
    if (ip->type == T_DIR) {
    aeb4:	e51b3008 	ldr	r3, [fp, #-8]
    aeb8:	e1d330f4 	ldrsh	r3, [r3, #4]
    aebc:	e3530001 	cmp	r3, #1
    aec0:	1a000006 	bne	aee0 <InodeDelete+0x80>
        // recursive free alloced Inode
        if (InodeFreeRecursive(ip) < 0) {
    aec4:	e51b0008 	ldr	r0, [fp, #-8]
    aec8:	ebffff8c 	bl	ad00 <InodeFreeRecursive>
    aecc:	e1a03000 	mov	r3, r0
    aed0:	e3530000 	cmp	r3, #0
    aed4:	aa000001 	bge	aee0 <InodeDelete+0x80>
            return -1;
    aed8:	e3e03000 	mvn	r3, #0
    aedc:	ea00000f 	b	af20 <InodeDelete+0xc0>
        }
    }

    // delete the dir entry
    de.inum = 0;
    aee0:	e3a03000 	mov	r3, #0
    aee4:	e14b31bc 	strh	r3, [fp, #-28]	; 0xffffffe4
    if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    aee8:	e51b200c 	ldr	r2, [fp, #-12]
    aeec:	e24b101c 	sub	r1, fp, #28
    aef0:	e3a03010 	mov	r3, #16
    aef4:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    aef8:	eb000201 	bl	b704 <InodeWrite>
    aefc:	e1a03000 	mov	r3, r0
    af00:	e3530010 	cmp	r3, #16
    af04:	0a000004 	beq	af1c <InodeDelete+0xbc>
        printf("InodeDelete failed: clear directory entry failed");
    af08:	e3020b94 	movw	r0, #11156	; 0x2b94
    af0c:	e3400001 	movt	r0, #1
    af10:	eb00039a 	bl	bd80 <printf>
        return -1;
    af14:	e3e03000 	mvn	r3, #0
    af18:	ea000000 	b	af20 <InodeDelete+0xc0>
    }
    return 0;
    af1c:	e3a03000 	mov	r3, #0
}
    af20:	e1a00003 	mov	r0, r3
    af24:	e24bd004 	sub	sp, fp, #4
    af28:	e8bd8800 	pop	{fp, pc}

0000af2c <InodeCreate>:

/// @brief Create a new Inode under the parent Inode
struct Inode* InodeCreate(struct Inode* dp, char* name, short type, short major, short minor)
{
    af2c:	e92d4800 	push	{fp, lr}
    af30:	e28db004 	add	fp, sp, #4
    af34:	e24dd018 	sub	sp, sp, #24
    af38:	e50b0010 	str	r0, [fp, #-16]
    af3c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    af40:	e14b21b6 	strh	r2, [fp, #-22]	; 0xffffffea
    af44:	e14b31b8 	strh	r3, [fp, #-24]	; 0xffffffe8
    uint32_t off;
    struct Inode* ip;

    if ((ip = DirInodeLookup(dp, name, &off)) != 0) {
    af48:	e24b300c 	sub	r3, fp, #12
    af4c:	e1a02003 	mov	r2, r3
    af50:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    af54:	e51b0010 	ldr	r0, [fp, #-16]
    af58:	eb0000a9 	bl	b204 <DirInodeLookup>
    af5c:	e50b0008 	str	r0, [fp, #-8]
    af60:	e51b3008 	ldr	r3, [fp, #-8]
    af64:	e3530000 	cmp	r3, #0
    af68:	0a00000a 	beq	af98 <InodeCreate+0x6c>
        if (type == T_FILE && ip->type == T_FILE) {
    af6c:	e15b31f6 	ldrsh	r3, [fp, #-22]	; 0xffffffea
    af70:	e3530002 	cmp	r3, #2
    af74:	1a000005 	bne	af90 <InodeCreate+0x64>
    af78:	e51b3008 	ldr	r3, [fp, #-8]
    af7c:	e1d330f4 	ldrsh	r3, [r3, #4]
    af80:	e3530002 	cmp	r3, #2
    af84:	1a000001 	bne	af90 <InodeCreate+0x64>
            return ip;
    af88:	e51b3008 	ldr	r3, [fp, #-8]
    af8c:	ea00003a 	b	b07c <InodeCreate+0x150>
        }
        return 0;
    af90:	e3a03000 	mov	r3, #0
    af94:	ea000038 	b	b07c <InodeCreate+0x150>
    }

    if ((ip = InodeAlloc(type)) == 0) {
    af98:	e15b31f6 	ldrsh	r3, [fp, #-22]	; 0xffffffea
    af9c:	e1a00003 	mov	r0, r3
    afa0:	ebffff02 	bl	abb0 <InodeAlloc>
    afa4:	e50b0008 	str	r0, [fp, #-8]
    afa8:	e51b3008 	ldr	r3, [fp, #-8]
    afac:	e3530000 	cmp	r3, #0
    afb0:	1a000002 	bne	afc0 <InodeCreate+0x94>
        Error("InodeCreate: create Inode failed\n");
    afb4:	e3020bec 	movw	r0, #11244	; 0x2bec
    afb8:	e3400001 	movt	r0, #1
    afbc:	ebfffebe 	bl	aabc <Error>
    }

    if (type == T_DIR) {
    afc0:	e15b31f6 	ldrsh	r3, [fp, #-22]	; 0xffffffea
    afc4:	e3530001 	cmp	r3, #1
    afc8:	1a00001e 	bne	b048 <InodeCreate+0x11c>
        dp->nlink++;
    afcc:	e51b3010 	ldr	r3, [fp, #-16]
    afd0:	e1d330f6 	ldrsh	r3, [r3, #6]
    afd4:	e6ff3073 	uxth	r3, r3
    afd8:	e2833001 	add	r3, r3, #1
    afdc:	e6ff3073 	uxth	r3, r3
    afe0:	e6bf2073 	sxth	r2, r3
    afe4:	e51b3010 	ldr	r3, [fp, #-16]
    afe8:	e1c320b6 	strh	r2, [r3, #6]
        if (DirInodeAddEntry(ip, ".", ip->inum) < 0 || DirInodeAddEntry(ip, "..", dp->inum) < 0) {
    afec:	e51b3008 	ldr	r3, [fp, #-8]
    aff0:	e5933000 	ldr	r3, [r3]
    aff4:	e1a02003 	mov	r2, r3
    aff8:	e3021b90 	movw	r1, #11152	; 0x2b90
    affc:	e3401001 	movt	r1, #1
    b000:	e51b0008 	ldr	r0, [fp, #-8]
    b004:	eb0000be 	bl	b304 <DirInodeAddEntry>
    b008:	e1a03000 	mov	r3, r0
    b00c:	e3530000 	cmp	r3, #0
    b010:	ba000009 	blt	b03c <InodeCreate+0x110>
    b014:	e51b3010 	ldr	r3, [fp, #-16]
    b018:	e5933000 	ldr	r3, [r3]
    b01c:	e1a02003 	mov	r2, r3
    b020:	e3021b8c 	movw	r1, #11148	; 0x2b8c
    b024:	e3401001 	movt	r1, #1
    b028:	e51b0008 	ldr	r0, [fp, #-8]
    b02c:	eb0000b4 	bl	b304 <DirInodeAddEntry>
    b030:	e1a03000 	mov	r3, r0
    b034:	e3530000 	cmp	r3, #0
    b038:	aa000002 	bge	b048 <InodeCreate+0x11c>
            Error("InodeCreate: create dots");
    b03c:	e3020c10 	movw	r0, #11280	; 0x2c10
    b040:	e3400001 	movt	r0, #1
    b044:	ebfffe9c 	bl	aabc <Error>
        }
    }

    if (DirInodeAddEntry(dp, name, ip->inum) < 0) {
    b048:	e51b3008 	ldr	r3, [fp, #-8]
    b04c:	e5933000 	ldr	r3, [r3]
    b050:	e1a02003 	mov	r2, r3
    b054:	e51b1014 	ldr	r1, [fp, #-20]	; 0xffffffec
    b058:	e51b0010 	ldr	r0, [fp, #-16]
    b05c:	eb0000a8 	bl	b304 <DirInodeAddEntry>
    b060:	e1a03000 	mov	r3, r0
    b064:	e3530000 	cmp	r3, #0
    b068:	aa000002 	bge	b078 <InodeCreate+0x14c>
        Error("InodeCreate: DirInodeAddEntry failed");
    b06c:	e3020c2c 	movw	r0, #11308	; 0x2c2c
    b070:	e3400001 	movt	r0, #1
    b074:	ebfffe90 	bl	aabc <Error>
    }

    return ip;
    b078:	e51b3008 	ldr	r3, [fp, #-8]
}
    b07c:	e1a00003 	mov	r0, r3
    b080:	e24bd004 	sub	sp, fp, #4
    b084:	e8bd8800 	pop	{fp, pc}

0000b088 <InodeBlockMapping>:

/// @brief Mapping the direct block addrs or indirect block addrs of the Inode using the block_num
static uint32_t InodeBlockMapping(struct Inode* ip, uint32_t block_num)
{
    b088:	e92d4810 	push	{r4, fp, lr}
    b08c:	e28db008 	add	fp, sp, #8
    b090:	e24dd01c 	sub	sp, sp, #28
    b094:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    b098:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    uint32_t addr;
    // block is in range of direct mapping
    if (block_num < NR_DIRECT_BLOCKS) {
    b09c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b0a0:	e3530004 	cmp	r3, #4
    b0a4:	8a000014 	bhi	b0fc <InodeBlockMapping+0x74>
        if ((addr = ip->addrs[block_num]) == 0) {
    b0a8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b0ac:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b0b0:	e2833002 	add	r3, r3, #2
    b0b4:	e1a03103 	lsl	r3, r3, #2
    b0b8:	e0823003 	add	r3, r2, r3
    b0bc:	e5933004 	ldr	r3, [r3, #4]
    b0c0:	e50b3010 	str	r3, [fp, #-16]
    b0c4:	e51b3010 	ldr	r3, [fp, #-16]
    b0c8:	e3530000 	cmp	r3, #0
    b0cc:	1a000008 	bne	b0f4 <InodeBlockMapping+0x6c>
            ip->addrs[block_num] = addr = BlockAlloc();
    b0d0:	eb00071c 	bl	cd48 <BlockAlloc>
    b0d4:	e50b0010 	str	r0, [fp, #-16]
    b0d8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b0dc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b0e0:	e2833002 	add	r3, r3, #2
    b0e4:	e1a03103 	lsl	r3, r3, #2
    b0e8:	e0823003 	add	r3, r2, r3
    b0ec:	e51b2010 	ldr	r2, [fp, #-16]
    b0f0:	e5832004 	str	r2, [r3, #4]
        }
        return addr;
    b0f4:	e51b3010 	ldr	r3, [fp, #-16]
    b0f8:	ea00003e 	b	b1f8 <InodeBlockMapping+0x170>
    }

    // alloc a new indirect indexing block
    block_num -= NR_DIRECT_BLOCKS;
    b0fc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b100:	e2433005 	sub	r3, r3, #5
    b104:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    int indirect_block_id = block_num / MAX_INDIRECT_BLOCKS;
    b108:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b10c:	e1a033a3 	lsr	r3, r3, #7
    b110:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (indirect_block_id < NR_INDIRECT_BLOCKS) {
    b114:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b118:	e3530007 	cmp	r3, #7
    b11c:	ca000027 	bgt	b1c0 <InodeBlockMapping+0x138>
        if ((addr = ip->addrs[NR_DIRECT_BLOCKS + indirect_block_id]) == 0) {
    b120:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b124:	e2833005 	add	r3, r3, #5
    b128:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b12c:	e2833002 	add	r3, r3, #2
    b130:	e1a03103 	lsl	r3, r3, #2
    b134:	e0823003 	add	r3, r2, r3
    b138:	e5933004 	ldr	r3, [r3, #4]
    b13c:	e50b3010 	str	r3, [fp, #-16]
    b140:	e51b3010 	ldr	r3, [fp, #-16]
    b144:	e3530000 	cmp	r3, #0
    b148:	1a000009 	bne	b174 <InodeBlockMapping+0xec>
            ip->addrs[NR_DIRECT_BLOCKS + indirect_block_id] = addr = BlockAlloc();
    b14c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b150:	e2834005 	add	r4, r3, #5
    b154:	eb0006fb 	bl	cd48 <BlockAlloc>
    b158:	e50b0010 	str	r0, [fp, #-16]
    b15c:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b160:	e2843002 	add	r3, r4, #2
    b164:	e1a03103 	lsl	r3, r3, #2
    b168:	e0823003 	add	r3, r2, r3
    b16c:	e51b2010 	ldr	r2, [fp, #-16]
    b170:	e5832004 	str	r2, [r3, #4]
        }
        block_num -= indirect_block_id * MAX_INDIRECT_BLOCKS;
    b174:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b178:	e1a03383 	lsl	r3, r3, #7
    b17c:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    b180:	e0423003 	sub	r3, r2, r3
    b184:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
        Error("InodeBlockMapping: out of range");
        return 0;
    }

    // alloc a new indirect block
    uint32_t* indirect_block = (uint32_t*)BlockRead(addr);
    b188:	e51b3010 	ldr	r3, [fp, #-16]
    b18c:	e1a00003 	mov	r0, r3
    b190:	eb0006cd 	bl	cccc <BlockRead>
    b194:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    if ((addr = indirect_block[block_num]) == 0) {
    b198:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b19c:	e1a03103 	lsl	r3, r3, #2
    b1a0:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b1a4:	e0823003 	add	r3, r2, r3
    b1a8:	e5933000 	ldr	r3, [r3]
    b1ac:	e50b3010 	str	r3, [fp, #-16]
    b1b0:	e51b3010 	ldr	r3, [fp, #-16]
    b1b4:	e3530000 	cmp	r3, #0
    b1b8:	1a00000d 	bne	b1f4 <InodeBlockMapping+0x16c>
    b1bc:	ea000004 	b	b1d4 <InodeBlockMapping+0x14c>
        Error("InodeBlockMapping: out of range");
    b1c0:	e3020c54 	movw	r0, #11348	; 0x2c54
    b1c4:	e3400001 	movt	r0, #1
    b1c8:	ebfffe3b 	bl	aabc <Error>
        return 0;
    b1cc:	e3a03000 	mov	r3, #0
    b1d0:	ea000008 	b	b1f8 <InodeBlockMapping+0x170>
        indirect_block[block_num] = addr = BlockAlloc();
    b1d4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b1d8:	e1a03103 	lsl	r3, r3, #2
    b1dc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    b1e0:	e0824003 	add	r4, r2, r3
    b1e4:	eb0006d7 	bl	cd48 <BlockAlloc>
    b1e8:	e50b0010 	str	r0, [fp, #-16]
    b1ec:	e51b3010 	ldr	r3, [fp, #-16]
    b1f0:	e5843000 	str	r3, [r4]
    }

    return addr;
    b1f4:	e51b3010 	ldr	r3, [fp, #-16]
}
    b1f8:	e1a00003 	mov	r0, r3
    b1fc:	e24bd008 	sub	sp, fp, #8
    b200:	e8bd8810 	pop	{r4, fp, pc}

0000b204 <DirInodeLookup>:

/// @brief Look up the directory Inode for searching the target Inode
static struct Inode* DirInodeLookup(struct Inode* dp, char* name, uint32_t* poff)
{
    b204:	e92d4800 	push	{fp, lr}
    b208:	e28db004 	add	fp, sp, #4
    b20c:	e24dd028 	sub	sp, sp, #40	; 0x28
    b210:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    b214:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    b218:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    uint32_t off, inum;
    struct DirectEntry de;

    if (dp->type != T_DIR) {
    b21c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b220:	e1d330f4 	ldrsh	r3, [r3, #4]
    b224:	e3530001 	cmp	r3, #1
    b228:	0a000002 	beq	b238 <DirInodeLookup+0x34>
        Error("DirInodeLookup not DIR");
    b22c:	e3020c74 	movw	r0, #11380	; 0x2c74
    b230:	e3400001 	movt	r0, #1
    b234:	ebfffe20 	bl	aabc <Error>
    }

    for (off = 0; off < dp->size; off += sizeof(de)) {
    b238:	e3a03000 	mov	r3, #0
    b23c:	e50b3008 	str	r3, [fp, #-8]
    b240:	ea000026 	b	b2e0 <DirInodeLookup+0xdc>
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    b244:	e51b2008 	ldr	r2, [fp, #-8]
    b248:	e24b101c 	sub	r1, fp, #28
    b24c:	e3a03010 	mov	r3, #16
    b250:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b254:	eb0000ca 	bl	b584 <InodeRead>
    b258:	e1a03000 	mov	r3, r0
    b25c:	e3530010 	cmp	r3, #16
    b260:	0a000002 	beq	b270 <DirInodeLookup+0x6c>
            Error("DirInodeAddEntry read");
    b264:	e3020c8c 	movw	r0, #11404	; 0x2c8c
    b268:	e3400001 	movt	r0, #1
    b26c:	ebfffe12 	bl	aabc <Error>
        }

        if (de.inum == 0) {
    b270:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
    b274:	e3530000 	cmp	r3, #0
    b278:	0a000014 	beq	b2d0 <DirInodeLookup+0xcc>
            continue;
        }

        if (strncmp((const char*)name, (const char*)de.name, DIR_NAME_SIZE) == 0) {
    b27c:	e24b301c 	sub	r3, fp, #28
    b280:	e2833002 	add	r3, r3, #2
    b284:	e3a0200e 	mov	r2, #14
    b288:	e1a01003 	mov	r1, r3
    b28c:	e51b0024 	ldr	r0, [fp, #-36]	; 0xffffffdc
    b290:	eb000ad7 	bl	ddf4 <strncmp>
    b294:	e1a03000 	mov	r3, r0
    b298:	e3530000 	cmp	r3, #0
    b29c:	1a00000c 	bne	b2d4 <DirInodeLookup+0xd0>
            if (poff) {
    b2a0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    b2a4:	e3530000 	cmp	r3, #0
    b2a8:	0a000002 	beq	b2b8 <DirInodeLookup+0xb4>
                *poff = off;
    b2ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    b2b0:	e51b2008 	ldr	r2, [fp, #-8]
    b2b4:	e5832000 	str	r2, [r3]
            }
            inum = de.inum;
    b2b8:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
    b2bc:	e50b300c 	str	r3, [fp, #-12]
            return InodeGet(inum);
    b2c0:	e51b000c 	ldr	r0, [fp, #-12]
    b2c4:	ebfffe25 	bl	ab60 <InodeGet>
    b2c8:	e1a03000 	mov	r3, r0
    b2cc:	ea000009 	b	b2f8 <DirInodeLookup+0xf4>
            continue;
    b2d0:	e320f000 	nop	{0}
    for (off = 0; off < dp->size; off += sizeof(de)) {
    b2d4:	e51b3008 	ldr	r3, [fp, #-8]
    b2d8:	e2833010 	add	r3, r3, #16
    b2dc:	e50b3008 	str	r3, [fp, #-8]
    b2e0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b2e4:	e5932008 	ldr	r2, [r3, #8]
    b2e8:	e51b3008 	ldr	r3, [fp, #-8]
    b2ec:	e1520003 	cmp	r2, r3
    b2f0:	8affffd3 	bhi	b244 <DirInodeLookup+0x40>
        }
    }

    return 0;
    b2f4:	e3a03000 	mov	r3, #0
}
    b2f8:	e1a00003 	mov	r0, r3
    b2fc:	e24bd004 	sub	sp, fp, #4
    b300:	e8bd8800 	pop	{fp, pc}

0000b304 <DirInodeAddEntry>:

/// @brief Add a new directory entry for dir Inode
static int DirInodeAddEntry(struct Inode* dp, char* name, uint32_t inum)
{
    b304:	e92d4800 	push	{fp, lr}
    b308:	e28db004 	add	fp, sp, #4
    b30c:	e24dd028 	sub	sp, sp, #40	; 0x28
    b310:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    b314:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    b318:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    int off;
    struct DirectEntry de;
    struct Inode* ip;

    // Check that direct entry is existed.
    if ((ip = DirInodeLookup(dp, name, 0)) != 0) {
    b31c:	e3a02000 	mov	r2, #0
    b320:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    b324:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b328:	ebffffb5 	bl	b204 <DirInodeLookup>
    b32c:	e50b000c 	str	r0, [fp, #-12]
    b330:	e51b300c 	ldr	r3, [fp, #-12]
    b334:	e3530000 	cmp	r3, #0
    b338:	0a000001 	beq	b344 <DirInodeAddEntry+0x40>
        return -1;
    b33c:	e3e03000 	mvn	r3, #0
    b340:	ea00002f 	b	b404 <DirInodeAddEntry+0x100>
    }

    // Look for an empty dir entry.
    for (off = 0; off < dp->size; off += sizeof(de)) {
    b344:	e3a03000 	mov	r3, #0
    b348:	e50b3008 	str	r3, [fp, #-8]
    b34c:	ea000010 	b	b394 <DirInodeAddEntry+0x90>
        if (InodeRead(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    b350:	e24b101c 	sub	r1, fp, #28
    b354:	e3a03010 	mov	r3, #16
    b358:	e51b2008 	ldr	r2, [fp, #-8]
    b35c:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b360:	eb000087 	bl	b584 <InodeRead>
    b364:	e1a03000 	mov	r3, r0
    b368:	e3530010 	cmp	r3, #16
    b36c:	0a000002 	beq	b37c <DirInodeAddEntry+0x78>
            Error("DirInodeAddEntry: read failed");
    b370:	e3020ca4 	movw	r0, #11428	; 0x2ca4
    b374:	e3400001 	movt	r0, #1
    b378:	ebfffdcf 	bl	aabc <Error>
        }

        if (de.inum == 0) {
    b37c:	e15b31bc 	ldrh	r3, [fp, #-28]	; 0xffffffe4
    b380:	e3530000 	cmp	r3, #0
    b384:	0a000008 	beq	b3ac <DirInodeAddEntry+0xa8>
    for (off = 0; off < dp->size; off += sizeof(de)) {
    b388:	e51b3008 	ldr	r3, [fp, #-8]
    b38c:	e2833010 	add	r3, r3, #16
    b390:	e50b3008 	str	r3, [fp, #-8]
    b394:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b398:	e5932008 	ldr	r2, [r3, #8]
    b39c:	e51b3008 	ldr	r3, [fp, #-8]
    b3a0:	e1520003 	cmp	r2, r3
    b3a4:	8affffe9 	bhi	b350 <DirInodeAddEntry+0x4c>
    b3a8:	ea000000 	b	b3b0 <DirInodeAddEntry+0xac>
            break;
    b3ac:	e320f000 	nop	{0}
        }
    }

    // build a new direct entry.
    strncpy(de.name, name, DIR_NAME_SIZE);
    b3b0:	e24b301c 	sub	r3, fp, #28
    b3b4:	e2833002 	add	r3, r3, #2
    b3b8:	e3a0200e 	mov	r2, #14
    b3bc:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    b3c0:	e1a00003 	mov	r0, r3
    b3c4:	eb000ace 	bl	df04 <strncpy>
    de.inum = inum;
    b3c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    b3cc:	e6ff3073 	uxth	r3, r3
    b3d0:	e14b31bc 	strh	r3, [fp, #-28]	; 0xffffffe4
    if (InodeWrite(dp, (char*)&de, off, sizeof(de)) != sizeof(de)) {
    b3d4:	e51b2008 	ldr	r2, [fp, #-8]
    b3d8:	e24b101c 	sub	r1, fp, #28
    b3dc:	e3a03010 	mov	r3, #16
    b3e0:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    b3e4:	eb0000c6 	bl	b704 <InodeWrite>
    b3e8:	e1a03000 	mov	r3, r0
    b3ec:	e3530010 	cmp	r3, #16
    b3f0:	0a000002 	beq	b400 <DirInodeAddEntry+0xfc>
        Error("DirInodeAddEntry: write failed");
    b3f4:	e3020cc4 	movw	r0, #11460	; 0x2cc4
    b3f8:	e3400001 	movt	r0, #1
    b3fc:	ebfffdae 	bl	aabc <Error>
    }

    return 0;
    b400:	e3a03000 	mov	r3, #0
}
    b404:	e1a00003 	mov	r0, r3
    b408:	e24bd004 	sub	sp, fp, #4
    b40c:	e8bd8800 	pop	{fp, pc}

0000b410 <Seek>:

static struct Inode* Seek(struct Inode* ip, char* path, int nameiparent, char* name)
{
    b410:	e92d4800 	push	{fp, lr}
    b414:	e28db004 	add	fp, sp, #4
    b418:	e24dd018 	sub	sp, sp, #24
    b41c:	e50b0010 	str	r0, [fp, #-16]
    b420:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    b424:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
    b428:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    if (ip->size == 0) {
    b42c:	e51b3010 	ldr	r3, [fp, #-16]
    b430:	e5933008 	ldr	r3, [r3, #8]
    b434:	e3530000 	cmp	r3, #0
    b438:	1a00001e 	bne	b4b8 <Seek+0xa8>
        Error("Inode is not sync\n");
    b43c:	e3020ce4 	movw	r0, #11492	; 0x2ce4
    b440:	e3400001 	movt	r0, #1
    b444:	ebfffd9c 	bl	aabc <Error>
    }

    struct Inode* next;
    while ((path = PathElementExtract(path, name)) != 0) {
    b448:	ea00001a 	b	b4b8 <Seek+0xa8>
        if (ip->type != T_DIR) {
    b44c:	e51b3010 	ldr	r3, [fp, #-16]
    b450:	e1d330f4 	ldrsh	r3, [r3, #4]
    b454:	e3530001 	cmp	r3, #1
    b458:	0a000001 	beq	b464 <Seek+0x54>
            return NULL;
    b45c:	e3a03000 	mov	r3, #0
    b460:	ea000021 	b	b4ec <Seek+0xdc>
        }
        if (nameiparent && *path == '\0') {
    b464:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b468:	e3530000 	cmp	r3, #0
    b46c:	0a000005 	beq	b488 <Seek+0x78>
    b470:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b474:	e5d33000 	ldrb	r3, [r3]
    b478:	e3530000 	cmp	r3, #0
    b47c:	1a000001 	bne	b488 <Seek+0x78>
            return ip;
    b480:	e51b3010 	ldr	r3, [fp, #-16]
    b484:	ea000018 	b	b4ec <Seek+0xdc>
        }
        if ((next = DirInodeLookup(ip, name, 0)) == 0) {
    b488:	e3a02000 	mov	r2, #0
    b48c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    b490:	e51b0010 	ldr	r0, [fp, #-16]
    b494:	ebffff5a 	bl	b204 <DirInodeLookup>
    b498:	e50b0008 	str	r0, [fp, #-8]
    b49c:	e51b3008 	ldr	r3, [fp, #-8]
    b4a0:	e3530000 	cmp	r3, #0
    b4a4:	1a000001 	bne	b4b0 <Seek+0xa0>
            return NULL;
    b4a8:	e3a03000 	mov	r3, #0
    b4ac:	ea00000e 	b	b4ec <Seek+0xdc>
        }
        ip = next;
    b4b0:	e51b3008 	ldr	r3, [fp, #-8]
    b4b4:	e50b3010 	str	r3, [fp, #-16]
    while ((path = PathElementExtract(path, name)) != 0) {
    b4b8:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    b4bc:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    b4c0:	eb0000e9 	bl	b86c <PathElementExtract>
    b4c4:	e50b0014 	str	r0, [fp, #-20]	; 0xffffffec
    b4c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    b4cc:	e3530000 	cmp	r3, #0
    b4d0:	1affffdd 	bne	b44c <Seek+0x3c>
    }

    if (nameiparent) {
    b4d4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b4d8:	e3530000 	cmp	r3, #0
    b4dc:	0a000001 	beq	b4e8 <Seek+0xd8>
        return NULL;
    b4e0:	e3a03000 	mov	r3, #0
    b4e4:	ea000000 	b	b4ec <Seek+0xdc>
    }
    return ip;
    b4e8:	e51b3010 	ldr	r3, [fp, #-16]
}
    b4ec:	e1a00003 	mov	r0, r3
    b4f0:	e24bd004 	sub	sp, fp, #4
    b4f4:	e8bd8800 	pop	{fp, pc}

0000b4f8 <InodeSeek>:

/// @brief Find target Inode from source Inode
struct Inode* InodeSeek(struct Inode* source, char* path)
{
    b4f8:	e92d4800 	push	{fp, lr}
    b4fc:	e28db004 	add	fp, sp, #4
    b500:	e24dd018 	sub	sp, sp, #24
    b504:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    b508:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    char name[DIR_NAME_SIZE] = { 0 };
    b50c:	e24b3014 	sub	r3, fp, #20
    b510:	e3a02000 	mov	r2, #0
    b514:	e5832000 	str	r2, [r3]
    b518:	e5832004 	str	r2, [r3, #4]
    b51c:	e5832008 	str	r2, [r3, #8]
    b520:	e1c320bc 	strh	r2, [r3, #12]
    return Seek(source, path, 0, name);
    b524:	e24b3014 	sub	r3, fp, #20
    b528:	e3a02000 	mov	r2, #0
    b52c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    b530:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b534:	ebffffb5 	bl	b410 <Seek>
    b538:	e1a03000 	mov	r3, r0
}
    b53c:	e1a00003 	mov	r0, r3
    b540:	e24bd004 	sub	sp, fp, #4
    b544:	e8bd8800 	pop	{fp, pc}

0000b548 <InodeParentSeek>:

/// @brief Find target parent Inode from source Inode
struct Inode* InodeParentSeek(struct Inode* source, char* path, char* name)
{
    b548:	e92d4800 	push	{fp, lr}
    b54c:	e28db004 	add	fp, sp, #4
    b550:	e24dd010 	sub	sp, sp, #16
    b554:	e50b0008 	str	r0, [fp, #-8]
    b558:	e50b100c 	str	r1, [fp, #-12]
    b55c:	e50b2010 	str	r2, [fp, #-16]
    return Seek(source, path, 1, name);
    b560:	e51b3010 	ldr	r3, [fp, #-16]
    b564:	e3a02001 	mov	r2, #1
    b568:	e51b100c 	ldr	r1, [fp, #-12]
    b56c:	e51b0008 	ldr	r0, [fp, #-8]
    b570:	ebffffa6 	bl	b410 <Seek>
    b574:	e1a03000 	mov	r3, r0
}
    b578:	e1a00003 	mov	r0, r3
    b57c:	e24bd004 	sub	sp, fp, #4
    b580:	e8bd8800 	pop	{fp, pc}

0000b584 <InodeRead>:

/// @brief Read data from the Inode to the dst buffer.
int InodeRead(struct Inode* ip, char* dst, int off, int n)
{
    b584:	e92d4800 	push	{fp, lr}
    b588:	e28db004 	add	fp, sp, #4
    b58c:	e24dd020 	sub	sp, sp, #32
    b590:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    b594:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    b598:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    b59c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uint32_t tot, m;

    if (off > ip->size || off + n < off) {
    b5a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b5a4:	e5932008 	ldr	r2, [r3, #8]
    b5a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b5ac:	e1520003 	cmp	r2, r3
    b5b0:	3a000005 	bcc	b5cc <InodeRead+0x48>
    b5b4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b5b8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b5bc:	e0822003 	add	r2, r2, r3
    b5c0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b5c4:	e1520003 	cmp	r2, r3
    b5c8:	aa000001 	bge	b5d4 <InodeRead+0x50>
        return -1;
    b5cc:	e3e03000 	mvn	r3, #0
    b5d0:	ea000048 	b	b6f8 <InodeRead+0x174>
    }

    if (off + n > ip->size) {
    b5d4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b5d8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b5dc:	e0823003 	add	r3, r2, r3
    b5e0:	e1a02003 	mov	r2, r3
    b5e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b5e8:	e5933008 	ldr	r3, [r3, #8]
    b5ec:	e1520003 	cmp	r2, r3
    b5f0:	9a000004 	bls	b608 <InodeRead+0x84>
        n = ip->size - off;
    b5f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b5f8:	e5932008 	ldr	r2, [r3, #8]
    b5fc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b600:	e0423003 	sub	r3, r2, r3
    b604:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    }

    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
    b608:	e3a03000 	mov	r3, #0
    b60c:	e50b3008 	str	r3, [fp, #-8]
    b610:	ea000033 	b	b6e4 <InodeRead+0x160>
        uint8_t* data = BlockRead(InodeBlockMapping(ip, off / BLOCK_SIZE));
    b614:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b618:	e2832f7f 	add	r2, r3, #508	; 0x1fc
    b61c:	e2822003 	add	r2, r2, #3
    b620:	e3530000 	cmp	r3, #0
    b624:	b1a03002 	movlt	r3, r2
    b628:	a1a03003 	movge	r3, r3
    b62c:	e1a034c3 	asr	r3, r3, #9
    b630:	e1a01003 	mov	r1, r3
    b634:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b638:	ebfffe92 	bl	b088 <InodeBlockMapping>
    b63c:	e1a03000 	mov	r3, r0
    b640:	e1a00003 	mov	r0, r3
    b644:	eb0005a0 	bl	cccc <BlockRead>
    b648:	e50b000c 	str	r0, [fp, #-12]
        m = min(n - tot, BLOCK_SIZE - off % BLOCK_SIZE);
    b64c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b650:	e2732000 	rsbs	r2, r3, #0
    b654:	e7e83053 	ubfx	r3, r3, #0, #9
    b658:	e7e82052 	ubfx	r2, r2, #0, #9
    b65c:	52623000 	rsbpl	r3, r2, #0
    b660:	e2633c02 	rsb	r3, r3, #512	; 0x200
    b664:	e1a02003 	mov	r2, r3
    b668:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    b66c:	e51b3008 	ldr	r3, [fp, #-8]
    b670:	e0413003 	sub	r3, r1, r3
    b674:	e1520003 	cmp	r2, r3
    b678:	31a03002 	movcc	r3, r2
    b67c:	21a03003 	movcs	r3, r3
    b680:	e50b3010 	str	r3, [fp, #-16]
        memmove(dst, data + off % BLOCK_SIZE, m);
    b684:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b688:	e2732000 	rsbs	r2, r3, #0
    b68c:	e7e83053 	ubfx	r3, r3, #0, #9
    b690:	e7e82052 	ubfx	r2, r2, #0, #9
    b694:	52623000 	rsbpl	r3, r2, #0
    b698:	e1a02003 	mov	r2, r3
    b69c:	e51b300c 	ldr	r3, [fp, #-12]
    b6a0:	e0833002 	add	r3, r3, r2
    b6a4:	e51b2010 	ldr	r2, [fp, #-16]
    b6a8:	e1a01003 	mov	r1, r3
    b6ac:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
    b6b0:	eb000897 	bl	d914 <memmove>
    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
    b6b4:	e51b2008 	ldr	r2, [fp, #-8]
    b6b8:	e51b3010 	ldr	r3, [fp, #-16]
    b6bc:	e0823003 	add	r3, r2, r3
    b6c0:	e50b3008 	str	r3, [fp, #-8]
    b6c4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b6c8:	e51b3010 	ldr	r3, [fp, #-16]
    b6cc:	e0823003 	add	r3, r2, r3
    b6d0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    b6d4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    b6d8:	e51b3010 	ldr	r3, [fp, #-16]
    b6dc:	e0823003 	add	r3, r2, r3
    b6e0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    b6e4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b6e8:	e51b2008 	ldr	r2, [fp, #-8]
    b6ec:	e1520003 	cmp	r2, r3
    b6f0:	3affffc7 	bcc	b614 <InodeRead+0x90>
    }

    return n;
    b6f4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
}
    b6f8:	e1a00003 	mov	r0, r3
    b6fc:	e24bd004 	sub	sp, fp, #4
    b700:	e8bd8800 	pop	{fp, pc}

0000b704 <InodeWrite>:

/// @brief Write data from src buffer to the Inode, then increase the Inode size if neccessary.
int InodeWrite(struct Inode* ip, char* src, uint32_t off, uint32_t n)
{
    b704:	e92d4800 	push	{fp, lr}
    b708:	e28db004 	add	fp, sp, #4
    b70c:	e24dd020 	sub	sp, sp, #32
    b710:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    b714:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    b718:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    b71c:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    uint32_t tot, m;

    if (off > ip->size || off + n < off) {
    b720:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b724:	e5932008 	ldr	r2, [r3, #8]
    b728:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b72c:	e1520003 	cmp	r2, r3
    b730:	3a000005 	bcc	b74c <InodeWrite+0x48>
    b734:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b738:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b73c:	e0822003 	add	r2, r2, r3
    b740:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b744:	e1520003 	cmp	r2, r3
    b748:	2a000001 	bcs	b754 <InodeWrite+0x50>
        return -1;
    b74c:	e3e03000 	mvn	r3, #0
    b750:	ea000042 	b	b860 <InodeWrite+0x15c>
    }

    if (off + n > MAX_FILE_SIZE * BLOCK_SIZE) {
    b754:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b758:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b75c:	e0822003 	add	r2, r2, r3
    b760:	e3a03c0a 	mov	r3, #2560	; 0xa00
    b764:	e3403008 	movt	r3, #8
    b768:	e1520003 	cmp	r2, r3
    b76c:	9a000001 	bls	b778 <InodeWrite+0x74>
        return -1;
    b770:	e3e03000 	mvn	r3, #0
    b774:	ea000039 	b	b860 <InodeWrite+0x15c>
    }

    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    b778:	e3a03000 	mov	r3, #0
    b77c:	e50b3008 	str	r3, [fp, #-8]
    b780:	ea000026 	b	b820 <InodeWrite+0x11c>
        uint8_t* data = BlockRead(InodeBlockMapping(ip, off / BLOCK_SIZE));
    b784:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b788:	e1a034a3 	lsr	r3, r3, #9
    b78c:	e1a01003 	mov	r1, r3
    b790:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    b794:	ebfffe3b 	bl	b088 <InodeBlockMapping>
    b798:	e1a03000 	mov	r3, r0
    b79c:	e1a00003 	mov	r0, r3
    b7a0:	eb000549 	bl	cccc <BlockRead>
    b7a4:	e50b000c 	str	r0, [fp, #-12]
        m = min(n - tot, BLOCK_SIZE - off % BLOCK_SIZE);
    b7a8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b7ac:	e7e83053 	ubfx	r3, r3, #0, #9
    b7b0:	e2632c02 	rsb	r2, r3, #512	; 0x200
    b7b4:	e51b1024 	ldr	r1, [fp, #-36]	; 0xffffffdc
    b7b8:	e51b3008 	ldr	r3, [fp, #-8]
    b7bc:	e0413003 	sub	r3, r1, r3
    b7c0:	e1520003 	cmp	r2, r3
    b7c4:	31a03002 	movcc	r3, r2
    b7c8:	21a03003 	movcs	r3, r3
    b7cc:	e50b3010 	str	r3, [fp, #-16]
        memmove(data + off % BLOCK_SIZE, src, m);
    b7d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b7d4:	e7e83053 	ubfx	r3, r3, #0, #9
    b7d8:	e51b200c 	ldr	r2, [fp, #-12]
    b7dc:	e0823003 	add	r3, r2, r3
    b7e0:	e51b2010 	ldr	r2, [fp, #-16]
    b7e4:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
    b7e8:	e1a00003 	mov	r0, r3
    b7ec:	eb000848 	bl	d914 <memmove>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    b7f0:	e51b2008 	ldr	r2, [fp, #-8]
    b7f4:	e51b3010 	ldr	r3, [fp, #-16]
    b7f8:	e0823003 	add	r3, r2, r3
    b7fc:	e50b3008 	str	r3, [fp, #-8]
    b800:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b804:	e51b3010 	ldr	r3, [fp, #-16]
    b808:	e0823003 	add	r3, r2, r3
    b80c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    b810:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    b814:	e51b3010 	ldr	r3, [fp, #-16]
    b818:	e0823003 	add	r3, r2, r3
    b81c:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    b820:	e51b2008 	ldr	r2, [fp, #-8]
    b824:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b828:	e1520003 	cmp	r2, r3
    b82c:	3affffd4 	bcc	b784 <InodeWrite+0x80>
    }

    if (n > 0 && off > ip->size) {
    b830:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    b834:	e3530000 	cmp	r3, #0
    b838:	0a000007 	beq	b85c <InodeWrite+0x158>
    b83c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b840:	e5932008 	ldr	r2, [r3, #8]
    b844:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    b848:	e1520003 	cmp	r2, r3
    b84c:	2a000002 	bcs	b85c <InodeWrite+0x158>
        ip->size = off;
    b850:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    b854:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    b858:	e5832008 	str	r2, [r3, #8]
    }

    return n;
    b85c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
}
    b860:	e1a00003 	mov	r0, r3
    b864:	e24bd004 	sub	sp, fp, #4
    b868:	e8bd8800 	pop	{fp, pc}

0000b86c <PathElementExtract>:

// Paths process
static char* PathElementExtract(char* path, char* name)
{
    b86c:	e92d4800 	push	{fp, lr}
    b870:	e28db004 	add	fp, sp, #4
    b874:	e24dd010 	sub	sp, sp, #16
    b878:	e50b0010 	str	r0, [fp, #-16]
    b87c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
    // Skip leading slashes
    while (*path == '/')
    b880:	ea000002 	b	b890 <PathElementExtract+0x24>
        path++;
    b884:	e51b3010 	ldr	r3, [fp, #-16]
    b888:	e2833001 	add	r3, r3, #1
    b88c:	e50b3010 	str	r3, [fp, #-16]
    while (*path == '/')
    b890:	e51b3010 	ldr	r3, [fp, #-16]
    b894:	e5d33000 	ldrb	r3, [r3]
    b898:	e353002f 	cmp	r3, #47	; 0x2f
    b89c:	0afffff8 	beq	b884 <PathElementExtract+0x18>

    // Check for end of path
    if (*path == 0)
    b8a0:	e51b3010 	ldr	r3, [fp, #-16]
    b8a4:	e5d33000 	ldrb	r3, [r3]
    b8a8:	e3530000 	cmp	r3, #0
    b8ac:	1a000001 	bne	b8b8 <PathElementExtract+0x4c>
        return NULL;
    b8b0:	e3a03000 	mov	r3, #0
    b8b4:	ea000029 	b	b960 <PathElementExtract+0xf4>

    // Extract element
    char* start = path;
    b8b8:	e51b3010 	ldr	r3, [fp, #-16]
    b8bc:	e50b300c 	str	r3, [fp, #-12]
    while (*path != '/' && *path != 0)
    b8c0:	ea000002 	b	b8d0 <PathElementExtract+0x64>
        path++;
    b8c4:	e51b3010 	ldr	r3, [fp, #-16]
    b8c8:	e2833001 	add	r3, r3, #1
    b8cc:	e50b3010 	str	r3, [fp, #-16]
    while (*path != '/' && *path != 0)
    b8d0:	e51b3010 	ldr	r3, [fp, #-16]
    b8d4:	e5d33000 	ldrb	r3, [r3]
    b8d8:	e353002f 	cmp	r3, #47	; 0x2f
    b8dc:	0a000003 	beq	b8f0 <PathElementExtract+0x84>
    b8e0:	e51b3010 	ldr	r3, [fp, #-16]
    b8e4:	e5d33000 	ldrb	r3, [r3]
    b8e8:	e3530000 	cmp	r3, #0
    b8ec:	1afffff4 	bne	b8c4 <PathElementExtract+0x58>

    // Calculate length and copy to 'name'
    int len = path - start;
    b8f0:	e51b2010 	ldr	r2, [fp, #-16]
    b8f4:	e51b300c 	ldr	r3, [fp, #-12]
    b8f8:	e0423003 	sub	r3, r2, r3
    b8fc:	e50b3008 	str	r3, [fp, #-8]
    if (len >= DIR_NAME_SIZE)
    b900:	e51b3008 	ldr	r3, [fp, #-8]
    b904:	e353000d 	cmp	r3, #13
    b908:	da000001 	ble	b914 <PathElementExtract+0xa8>
        len = DIR_NAME_SIZE - 1;
    b90c:	e3a0300d 	mov	r3, #13
    b910:	e50b3008 	str	r3, [fp, #-8]
    strncpy(name, start, len);
    b914:	e51b3008 	ldr	r3, [fp, #-8]
    b918:	e1a02003 	mov	r2, r3
    b91c:	e51b100c 	ldr	r1, [fp, #-12]
    b920:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    b924:	eb000976 	bl	df04 <strncpy>
    name[len] = 0;
    b928:	e51b3008 	ldr	r3, [fp, #-8]
    b92c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    b930:	e0823003 	add	r3, r2, r3
    b934:	e3a02000 	mov	r2, #0
    b938:	e5c32000 	strb	r2, [r3]

    // Skip trailing slashes
    while (*path == '/')
    b93c:	ea000002 	b	b94c <PathElementExtract+0xe0>
        path++;
    b940:	e51b3010 	ldr	r3, [fp, #-16]
    b944:	e2833001 	add	r3, r3, #1
    b948:	e50b3010 	str	r3, [fp, #-16]
    while (*path == '/')
    b94c:	e51b3010 	ldr	r3, [fp, #-16]
    b950:	e5d33000 	ldrb	r3, [r3]
    b954:	e353002f 	cmp	r3, #47	; 0x2f
    b958:	0afffff8 	beq	b940 <PathElementExtract+0xd4>

    return path;
    b95c:	e51b3010 	ldr	r3, [fp, #-16]
}
    b960:	e1a00003 	mov	r0, r3
    b964:	e24bd004 	sub	sp, fp, #4
    b968:	e8bd8800 	pop	{fp, pc}

0000b96c <GetFileDescriptor>:

struct FileDescriptor* GetFileDescriptor(int fd)
{
    b96c:	e92d4800 	push	{fp, lr}
    b970:	e28db004 	add	fp, sp, #4
    b974:	e24dd008 	sub	sp, sp, #8
    b978:	e50b0008 	str	r0, [fp, #-8]
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
    b97c:	e51b3008 	ldr	r3, [fp, #-8]
    b980:	e3530000 	cmp	r3, #0
    b984:	ba000002 	blt	b994 <GetFileDescriptor+0x28>
    b988:	e51b3008 	ldr	r3, [fp, #-8]
    b98c:	e3530b01 	cmp	r3, #1024	; 0x400
    b990:	da000004 	ble	b9a8 <GetFileDescriptor+0x3c>
        printf("fd invlid.\n");
    b994:	e3020cf8 	movw	r0, #11512	; 0x2cf8
    b998:	e3400001 	movt	r0, #1
    b99c:	eb0000f7 	bl	bd80 <printf>
        return NULL;
    b9a0:	e3a03000 	mov	r3, #0
    b9a4:	ea000005 	b	b9c0 <GetFileDescriptor+0x54>
    }
    return &fd_table[fd];
    b9a8:	e51b3008 	ldr	r3, [fp, #-8]
    b9ac:	e3a02098 	mov	r2, #152	; 0x98
    b9b0:	e0020392 	mul	r2, r2, r3
    b9b4:	e3063134 	movw	r3, #24884	; 0x6134
    b9b8:	e3403001 	movt	r3, #1
    b9bc:	e0823003 	add	r3, r2, r3
}
    b9c0:	e1a00003 	mov	r0, r3
    b9c4:	e24bd004 	sub	sp, fp, #4
    b9c8:	e8bd8800 	pop	{fp, pc}

0000b9cc <FreeFileDescriptor>:

void FreeFileDescriptor(int fd)
{
    b9cc:	e92d4800 	push	{fp, lr}
    b9d0:	e28db004 	add	fp, sp, #4
    b9d4:	e24dd008 	sub	sp, sp, #8
    b9d8:	e50b0008 	str	r0, [fp, #-8]
    if (fd < 0 || fd > MAX_SUPPORT_FD) {
    b9dc:	e51b3008 	ldr	r3, [fp, #-8]
    b9e0:	e3530000 	cmp	r3, #0
    b9e4:	ba000002 	blt	b9f4 <FreeFileDescriptor+0x28>
    b9e8:	e51b3008 	ldr	r3, [fp, #-8]
    b9ec:	e3530b01 	cmp	r3, #1024	; 0x400
    b9f0:	da000003 	ble	ba04 <FreeFileDescriptor+0x38>
        printf("fd invlid.\n");
    b9f4:	e3020cf8 	movw	r0, #11512	; 0x2cf8
    b9f8:	e3400001 	movt	r0, #1
    b9fc:	eb0000df 	bl	bd80 <printf>
        return;
    ba00:	ea000009 	b	ba2c <FreeFileDescriptor+0x60>
    }
    fd_table[fd].data = 0;
    ba04:	e3063134 	movw	r3, #24884	; 0x6134
    ba08:	e3403001 	movt	r3, #1
    ba0c:	e51b2008 	ldr	r2, [fp, #-8]
    ba10:	e3a01098 	mov	r1, #152	; 0x98
    ba14:	e0020291 	mul	r2, r1, r2
    ba18:	e0833002 	add	r3, r3, r2
    ba1c:	e2833080 	add	r3, r3, #128	; 0x80
    ba20:	e3a02000 	mov	r2, #0
    ba24:	e5832000 	str	r2, [r3]
    return;
    ba28:	e320f000 	nop	{0}
}
    ba2c:	e24bd004 	sub	sp, fp, #4
    ba30:	e8bd8800 	pop	{fp, pc}

0000ba34 <AllocFileDescriptor>:

int AllocFileDescriptor(void)
{
    ba34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ba38:	e28db000 	add	fp, sp, #0
    ba3c:	e24dd00c 	sub	sp, sp, #12
    int free_idx = -1;
    ba40:	e3e03000 	mvn	r3, #0
    ba44:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < MAX_SUPPORT_FD; i++) {
    ba48:	e3a03000 	mov	r3, #0
    ba4c:	e50b300c 	str	r3, [fp, #-12]
    ba50:	ea000011 	b	ba9c <AllocFileDescriptor+0x68>
        // found free fd
        if (free_idx == -1 && fd_table[i].data == 0) {
    ba54:	e51b3008 	ldr	r3, [fp, #-8]
    ba58:	e3730001 	cmn	r3, #1
    ba5c:	1a00000b 	bne	ba90 <AllocFileDescriptor+0x5c>
    ba60:	e3063134 	movw	r3, #24884	; 0x6134
    ba64:	e3403001 	movt	r3, #1
    ba68:	e51b200c 	ldr	r2, [fp, #-12]
    ba6c:	e3a01098 	mov	r1, #152	; 0x98
    ba70:	e0020291 	mul	r2, r1, r2
    ba74:	e0833002 	add	r3, r3, r2
    ba78:	e2833080 	add	r3, r3, #128	; 0x80
    ba7c:	e5933000 	ldr	r3, [r3]
    ba80:	e3530000 	cmp	r3, #0
    ba84:	1a000001 	bne	ba90 <AllocFileDescriptor+0x5c>
            free_idx = i;
    ba88:	e51b300c 	ldr	r3, [fp, #-12]
    ba8c:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < MAX_SUPPORT_FD; i++) {
    ba90:	e51b300c 	ldr	r3, [fp, #-12]
    ba94:	e2833001 	add	r3, r3, #1
    ba98:	e50b300c 	str	r3, [fp, #-12]
    ba9c:	e51b300c 	ldr	r3, [fp, #-12]
    baa0:	e3530b01 	cmp	r3, #1024	; 0x400
    baa4:	baffffea 	blt	ba54 <AllocFileDescriptor+0x20>
        }
    }
    if (free_idx == -1) {
    baa8:	e51b3008 	ldr	r3, [fp, #-8]
    baac:	e3730001 	cmn	r3, #1
    bab0:	1a000001 	bne	babc <AllocFileDescriptor+0x88>
        return -1;
    bab4:	e3e03000 	mvn	r3, #0
    bab8:	ea000000 	b	bac0 <AllocFileDescriptor+0x8c>
    }
    return free_idx;
    babc:	e51b3008 	ldr	r3, [fp, #-8]
}
    bac0:	e1a00003 	mov	r0, r3
    bac4:	e28bd000 	add	sp, fp, #0
    bac8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    bacc:	e12fff1e 	bx	lr

0000bad0 <init_uart_mmio>:

#define USER_UART_BASE 0x6FFFF000
// #define USER_UART_BASE 0x621e8000

static bool init_uart_mmio()
{
    bad0:	e92d4800 	push	{fp, lr}
    bad4:	e28db004 	add	fp, sp, #4
    static int mapped = 0;
    if (mapped == 0) {
    bad8:	e30c3134 	movw	r3, #49460	; 0xc134
    badc:	e3403003 	movt	r3, #3
    bae0:	e5933000 	ldr	r3, [r3]
    bae4:	e3530000 	cmp	r3, #0
    bae8:	1a00000f 	bne	bb2c <init_uart_mmio+0x5c>
        if (-1 == mmap(USER_UART_BASE, 0x021e8000, 4096, true)) {
    baec:	e3a03001 	mov	r3, #1
    baf0:	e3a02a01 	mov	r2, #4096	; 0x1000
    baf4:	e3a01902 	mov	r1, #32768	; 0x8000
    baf8:	e340121e 	movt	r1, #542	; 0x21e
    bafc:	e3a00a0f 	mov	r0, #61440	; 0xf000
    bb00:	e3460fff 	movt	r0, #28671	; 0x6fff
    bb04:	eb00062f 	bl	d3c8 <mmap>
    bb08:	e1a03000 	mov	r3, r0
    bb0c:	e3730001 	cmn	r3, #1
    bb10:	1a000001 	bne	bb1c <init_uart_mmio+0x4c>
            return false;
    bb14:	e3a03000 	mov	r3, #0
    bb18:	ea000004 	b	bb30 <init_uart_mmio+0x60>
        }
        mapped = 1;
    bb1c:	e30c3134 	movw	r3, #49460	; 0xc134
    bb20:	e3403003 	movt	r3, #3
    bb24:	e3a02001 	mov	r2, #1
    bb28:	e5832000 	str	r2, [r3]
    }
    return true;
    bb2c:	e3a03001 	mov	r3, #1
}
    bb30:	e1a00003 	mov	r0, r3
    bb34:	e8bd8800 	pop	{fp, pc}

0000bb38 <putc>:

static void putc(char c)
{
    bb38:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    bb3c:	e28db000 	add	fp, sp, #0
    bb40:	e24dd00c 	sub	sp, sp, #12
    bb44:	e1a03000 	mov	r3, r0
    bb48:	e54b3005 	strb	r3, [fp, #-5]
    while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    bb4c:	e320f000 	nop	{0}
    bb50:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    bb54:	e3463fff 	movt	r3, #28671	; 0x6fff
    bb58:	e5933000 	ldr	r3, [r3]
    bb5c:	e7e03253 	ubfx	r3, r3, #4, #1
    bb60:	e6ef3073 	uxtb	r3, r3
    bb64:	e3530000 	cmp	r3, #0
    bb68:	1afffff8 	bne	bb50 <putc+0x18>
        ;

    if (c == '\n') {
    bb6c:	e55b3005 	ldrb	r3, [fp, #-5]
    bb70:	e353000a 	cmp	r3, #10
    bb74:	1a00000b 	bne	bba8 <putc+0x70>
        ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = ('\r'));
    bb78:	e30f3040 	movw	r3, #61504	; 0xf040
    bb7c:	e3463fff 	movt	r3, #28671	; 0x6fff
    bb80:	e3a0200d 	mov	r2, #13
    bb84:	e5832000 	str	r2, [r3]
        while ((*(volatile hw_uart_uts_t*)(USER_UART_BASE + 0xb4)).B.TXFULL)
    bb88:	e320f000 	nop	{0}
    bb8c:	e30f30b4 	movw	r3, #61620	; 0xf0b4
    bb90:	e3463fff 	movt	r3, #28671	; 0x6fff
    bb94:	e5933000 	ldr	r3, [r3]
    bb98:	e7e03253 	ubfx	r3, r3, #4, #1
    bb9c:	e6ef3073 	uxtb	r3, r3
    bba0:	e3530000 	cmp	r3, #0
    bba4:	1afffff8 	bne	bb8c <putc+0x54>
            ;
    }
    ((*(volatile hw_uart_utxd_t*)(USER_UART_BASE + 0x40)).U = (c));
    bba8:	e30f3040 	movw	r3, #61504	; 0xf040
    bbac:	e3463fff 	movt	r3, #28671	; 0x6fff
    bbb0:	e55b2005 	ldrb	r2, [fp, #-5]
    bbb4:	e5832000 	str	r2, [r3]
}
    bbb8:	e320f000 	nop	{0}
    bbbc:	e28bd000 	add	sp, fp, #0
    bbc0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    bbc4:	e12fff1e 	bx	lr

0000bbc8 <getc>:

char getc(void)
{
    bbc8:	e92d4800 	push	{fp, lr}
    bbcc:	e28db004 	add	fp, sp, #4
    bbd0:	e24dd008 	sub	sp, sp, #8
    if (!init_uart_mmio()) {
    bbd4:	ebffffbd 	bl	bad0 <init_uart_mmio>
    bbd8:	e1a03000 	mov	r3, r0
    bbdc:	e2233001 	eor	r3, r3, #1
    bbe0:	e6ef3073 	uxtb	r3, r3
    bbe4:	e3530000 	cmp	r3, #0
    bbe8:	0a000001 	beq	bbf4 <getc+0x2c>
        return 0xFF;
    bbec:	e3a030ff 	mov	r3, #255	; 0xff
    bbf0:	ea000014 	b	bc48 <getc+0x80>
    }
    uint32_t read_data;

    /* If Rx FIFO has no data ready */
    if (!(*(volatile hw_uart_usr2_t*)(USER_UART_BASE + 0x98)).B.RDR) {
    bbf4:	e30f3098 	movw	r3, #61592	; 0xf098
    bbf8:	e3463fff 	movt	r3, #28671	; 0x6fff
    bbfc:	e5933000 	ldr	r3, [r3]
    bc00:	e7e03053 	ubfx	r3, r3, #0, #1
    bc04:	e6ef3073 	uxtb	r3, r3
    bc08:	e3530000 	cmp	r3, #0
    bc0c:	1a000001 	bne	bc18 <getc+0x50>
        return 0xFF;
    bc10:	e3a030ff 	mov	r3, #255	; 0xff
    bc14:	ea00000b 	b	bc48 <getc+0x80>
    }

    read_data = ((*(volatile hw_uart_urxd_t*)(USER_UART_BASE + 0x0)).U);
    bc18:	e3a03a0f 	mov	r3, #61440	; 0xf000
    bc1c:	e3463fff 	movt	r3, #28671	; 0x6fff
    bc20:	e5933000 	ldr	r3, [r3]
    bc24:	e50b3008 	str	r3, [fp, #-8]

    /* If error are detected */
    if (read_data & 0x7C00)
    bc28:	e51b3008 	ldr	r3, [fp, #-8]
    bc2c:	e2033b1f 	and	r3, r3, #31744	; 0x7c00
    bc30:	e3530000 	cmp	r3, #0
    bc34:	0a000001 	beq	bc40 <getc+0x78>
        return 0xFF;
    bc38:	e3a030ff 	mov	r3, #255	; 0xff
    bc3c:	ea000001 	b	bc48 <getc+0x80>

    return (char)read_data;
    bc40:	e51b3008 	ldr	r3, [fp, #-8]
    bc44:	e6ef3073 	uxtb	r3, r3
}
    bc48:	e1a00003 	mov	r0, r3
    bc4c:	e24bd004 	sub	sp, fp, #4
    bc50:	e8bd8800 	pop	{fp, pc}

0000bc54 <printint>:

static void printint(int xx, int base, int sgn)
{
    bc54:	e92d4810 	push	{r4, fp, lr}
    bc58:	e28db008 	add	fp, sp, #8
    bc5c:	e24dd034 	sub	sp, sp, #52	; 0x34
    bc60:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    bc64:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    bc68:	e50b2038 	str	r2, [fp, #-56]	; 0xffffffc8
    static char digits[] = "0123456789ABCDEF";
    char buf[16];
    int i, neg;
    uint32_t x;

    neg = 0;
    bc6c:	e3a03000 	mov	r3, #0
    bc70:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    if (sgn && xx < 0) {
    bc74:	e51b3038 	ldr	r3, [fp, #-56]	; 0xffffffc8
    bc78:	e3530000 	cmp	r3, #0
    bc7c:	0a000008 	beq	bca4 <printint+0x50>
    bc80:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    bc84:	e3530000 	cmp	r3, #0
    bc88:	aa000005 	bge	bca4 <printint+0x50>
        neg = 1;
    bc8c:	e3a03001 	mov	r3, #1
    bc90:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
        x = -xx;
    bc94:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    bc98:	e2633000 	rsb	r3, r3, #0
    bc9c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    bca0:	ea000001 	b	bcac <printint+0x58>
    } else {
        x = xx;
    bca4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    bca8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    }

    i = 0;
    bcac:	e3a03000 	mov	r3, #0
    bcb0:	e50b3010 	str	r3, [fp, #-16]
    do {
        buf[i++] = digits[x % base];
    bcb4:	e51b4010 	ldr	r4, [fp, #-16]
    bcb8:	e2843001 	add	r3, r4, #1
    bcbc:	e50b3010 	str	r3, [fp, #-16]
    bcc0:	e51b2034 	ldr	r2, [fp, #-52]	; 0xffffffcc
    bcc4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bcc8:	e1a01002 	mov	r1, r2
    bccc:	e1a00003 	mov	r0, r3
    bcd0:	eb00061b 	bl	d544 <__aeabi_uidivmod>
    bcd4:	e1a03001 	mov	r3, r1
    bcd8:	e1a02003 	mov	r2, r3
    bcdc:	e3033554 	movw	r3, #13652	; 0x3554
    bce0:	e3403001 	movt	r3, #1
    bce4:	e7d32002 	ldrb	r2, [r3, r2]
    bce8:	e24b300c 	sub	r3, fp, #12
    bcec:	e0833004 	add	r3, r3, r4
    bcf0:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4
    } while ((x /= base) != 0);
    bcf4:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    bcf8:	e1a01003 	mov	r1, r3
    bcfc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    bd00:	eb0005d2 	bl	d450 <__udivsi3>
    bd04:	e1a03000 	mov	r3, r0
    bd08:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    bd0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bd10:	e3530000 	cmp	r3, #0
    bd14:	1affffe6 	bne	bcb4 <printint+0x60>
    if (neg)
    bd18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    bd1c:	e3530000 	cmp	r3, #0
    bd20:	0a00000d 	beq	bd5c <printint+0x108>
        buf[i++] = '-';
    bd24:	e51b3010 	ldr	r3, [fp, #-16]
    bd28:	e2832001 	add	r2, r3, #1
    bd2c:	e50b2010 	str	r2, [fp, #-16]
    bd30:	e24b200c 	sub	r2, fp, #12
    bd34:	e0823003 	add	r3, r2, r3
    bd38:	e3a0202d 	mov	r2, #45	; 0x2d
    bd3c:	e543201c 	strb	r2, [r3, #-28]	; 0xffffffe4

    while (--i >= 0)
    bd40:	ea000005 	b	bd5c <printint+0x108>
        putc(buf[i]);
    bd44:	e24b2028 	sub	r2, fp, #40	; 0x28
    bd48:	e51b3010 	ldr	r3, [fp, #-16]
    bd4c:	e0823003 	add	r3, r2, r3
    bd50:	e5d33000 	ldrb	r3, [r3]
    bd54:	e1a00003 	mov	r0, r3
    bd58:	ebffff76 	bl	bb38 <putc>
    while (--i >= 0)
    bd5c:	e51b3010 	ldr	r3, [fp, #-16]
    bd60:	e2433001 	sub	r3, r3, #1
    bd64:	e50b3010 	str	r3, [fp, #-16]
    bd68:	e51b3010 	ldr	r3, [fp, #-16]
    bd6c:	e3530000 	cmp	r3, #0
    bd70:	aafffff3 	bge	bd44 <printint+0xf0>
}
    bd74:	e320f000 	nop	{0}
    bd78:	e24bd008 	sub	sp, fp, #8
    bd7c:	e8bd8810 	pop	{r4, fp, pc}

0000bd80 <printf>:

// Print to usart. Only understands %d, %x, %p, %s.
void printf(char* fmt, ...)
{
    bd80:	e92d000f 	push	{r0, r1, r2, r3}
    bd84:	e92d4800 	push	{fp, lr}
    bd88:	e28db004 	add	fp, sp, #4
    bd8c:	e24dd018 	sub	sp, sp, #24
    if (!init_uart_mmio()) {
    bd90:	ebffff4e 	bl	bad0 <init_uart_mmio>
    bd94:	e1a03000 	mov	r3, r0
    bd98:	e2233001 	eor	r3, r3, #1
    bd9c:	e6ef3073 	uxtb	r3, r3
    bda0:	e3530000 	cmp	r3, #0
    bda4:	1a00007b 	bne	bf98 <printf+0x218>
    }
    char* s;
    int c, i, state;
    uint32_t* ap;

    state = 0;
    bda8:	e3a03000 	mov	r3, #0
    bdac:	e50b3010 	str	r3, [fp, #-16]
    ap = (uint32_t*)(void*)&fmt + 1;
    bdb0:	e28b3008 	add	r3, fp, #8
    bdb4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    for (i = 0; fmt[i]; i++) {
    bdb8:	e3a03000 	mov	r3, #0
    bdbc:	e50b300c 	str	r3, [fp, #-12]
    bdc0:	ea00006d 	b	bf7c <printf+0x1fc>
        c = fmt[i] & 0xff;
    bdc4:	e59b2004 	ldr	r2, [fp, #4]
    bdc8:	e51b300c 	ldr	r3, [fp, #-12]
    bdcc:	e0823003 	add	r3, r2, r3
    bdd0:	e5d33000 	ldrb	r3, [r3]
    bdd4:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
        if (state == 0) {
    bdd8:	e51b3010 	ldr	r3, [fp, #-16]
    bddc:	e3530000 	cmp	r3, #0
    bde0:	1a00000a 	bne	be10 <printf+0x90>
            if (c == '%') {
    bde4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bde8:	e3530025 	cmp	r3, #37	; 0x25
    bdec:	1a000002 	bne	bdfc <printf+0x7c>
                state = '%';
    bdf0:	e3a03025 	mov	r3, #37	; 0x25
    bdf4:	e50b3010 	str	r3, [fp, #-16]
    bdf8:	ea00005c 	b	bf70 <printf+0x1f0>
            } else {
                putc(c);
    bdfc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be00:	e6ef3073 	uxtb	r3, r3
    be04:	e1a00003 	mov	r0, r3
    be08:	ebffff4a 	bl	bb38 <putc>
    be0c:	ea000057 	b	bf70 <printf+0x1f0>
            }
        } else if (state == '%') {
    be10:	e51b3010 	ldr	r3, [fp, #-16]
    be14:	e3530025 	cmp	r3, #37	; 0x25
    be18:	1a000054 	bne	bf70 <printf+0x1f0>
            if (c == 'd') {
    be1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be20:	e3530064 	cmp	r3, #100	; 0x64
    be24:	1a000009 	bne	be50 <printf+0xd0>
                printint(*ap, 10, 1);
    be28:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    be2c:	e5933000 	ldr	r3, [r3]
    be30:	e3a02001 	mov	r2, #1
    be34:	e3a0100a 	mov	r1, #10
    be38:	e1a00003 	mov	r0, r3
    be3c:	ebffff84 	bl	bc54 <printint>
                ap++;
    be40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    be44:	e2833004 	add	r3, r3, #4
    be48:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    be4c:	ea000045 	b	bf68 <printf+0x1e8>
            } else if (c == 'x' || c == 'p') {
    be50:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be54:	e3530078 	cmp	r3, #120	; 0x78
    be58:	0a000002 	beq	be68 <printf+0xe8>
    be5c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be60:	e3530070 	cmp	r3, #112	; 0x70
    be64:	1a000009 	bne	be90 <printf+0x110>
                printint(*ap, 16, 0);
    be68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    be6c:	e5933000 	ldr	r3, [r3]
    be70:	e3a02000 	mov	r2, #0
    be74:	e3a01010 	mov	r1, #16
    be78:	e1a00003 	mov	r0, r3
    be7c:	ebffff74 	bl	bc54 <printint>
                ap++;
    be80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    be84:	e2833004 	add	r3, r3, #4
    be88:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    be8c:	ea000035 	b	bf68 <printf+0x1e8>
            } else if (c == 's') {
    be90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    be94:	e3530073 	cmp	r3, #115	; 0x73
    be98:	1a000018 	bne	bf00 <printf+0x180>
                s = (char*)*ap;
    be9c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    bea0:	e5933000 	ldr	r3, [r3]
    bea4:	e50b3008 	str	r3, [fp, #-8]
                ap++;
    bea8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    beac:	e2833004 	add	r3, r3, #4
    beb0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
                if (s == 0)
    beb4:	e51b3008 	ldr	r3, [fp, #-8]
    beb8:	e3530000 	cmp	r3, #0
    bebc:	1a00000a 	bne	beec <printf+0x16c>
                    s = "(null)";
    bec0:	e3023d04 	movw	r3, #11524	; 0x2d04
    bec4:	e3403001 	movt	r3, #1
    bec8:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    becc:	ea000006 	b	beec <printf+0x16c>
                    putc(*s);
    bed0:	e51b3008 	ldr	r3, [fp, #-8]
    bed4:	e5d33000 	ldrb	r3, [r3]
    bed8:	e1a00003 	mov	r0, r3
    bedc:	ebffff15 	bl	bb38 <putc>
                    s++;
    bee0:	e51b3008 	ldr	r3, [fp, #-8]
    bee4:	e2833001 	add	r3, r3, #1
    bee8:	e50b3008 	str	r3, [fp, #-8]
                while (*s != 0) {
    beec:	e51b3008 	ldr	r3, [fp, #-8]
    bef0:	e5d33000 	ldrb	r3, [r3]
    bef4:	e3530000 	cmp	r3, #0
    bef8:	1afffff4 	bne	bed0 <printf+0x150>
    befc:	ea000019 	b	bf68 <printf+0x1e8>
                }
            } else if (c == 'c') {
    bf00:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bf04:	e3530063 	cmp	r3, #99	; 0x63
    bf08:	1a000008 	bne	bf30 <printf+0x1b0>
                putc(*ap);
    bf0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    bf10:	e5933000 	ldr	r3, [r3]
    bf14:	e6ef3073 	uxtb	r3, r3
    bf18:	e1a00003 	mov	r0, r3
    bf1c:	ebffff05 	bl	bb38 <putc>
                ap++;
    bf20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    bf24:	e2833004 	add	r3, r3, #4
    bf28:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    bf2c:	ea00000d 	b	bf68 <printf+0x1e8>
            } else if (c == '%') {
    bf30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bf34:	e3530025 	cmp	r3, #37	; 0x25
    bf38:	1a000004 	bne	bf50 <printf+0x1d0>
                putc(c);
    bf3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bf40:	e6ef3073 	uxtb	r3, r3
    bf44:	e1a00003 	mov	r0, r3
    bf48:	ebfffefa 	bl	bb38 <putc>
    bf4c:	ea000005 	b	bf68 <printf+0x1e8>
            } else {
                // Unknown % sequence.  Print it to draw attention.
                putc('%');
    bf50:	e3a00025 	mov	r0, #37	; 0x25
    bf54:	ebfffef7 	bl	bb38 <putc>
                putc(c);
    bf58:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    bf5c:	e6ef3073 	uxtb	r3, r3
    bf60:	e1a00003 	mov	r0, r3
    bf64:	ebfffef3 	bl	bb38 <putc>
            }
            state = 0;
    bf68:	e3a03000 	mov	r3, #0
    bf6c:	e50b3010 	str	r3, [fp, #-16]
    for (i = 0; fmt[i]; i++) {
    bf70:	e51b300c 	ldr	r3, [fp, #-12]
    bf74:	e2833001 	add	r3, r3, #1
    bf78:	e50b300c 	str	r3, [fp, #-12]
    bf7c:	e59b2004 	ldr	r2, [fp, #4]
    bf80:	e51b300c 	ldr	r3, [fp, #-12]
    bf84:	e0823003 	add	r3, r2, r3
    bf88:	e5d33000 	ldrb	r3, [r3]
    bf8c:	e3530000 	cmp	r3, #0
    bf90:	1affff8b 	bne	bdc4 <printf+0x44>
    bf94:	ea000000 	b	bf9c <printf+0x21c>
        return;
    bf98:	e320f000 	nop	{0}
        }
    }
    bf9c:	e24bd004 	sub	sp, fp, #4
    bfa0:	e8bd4800 	pop	{fp, lr}
    bfa4:	e28dd010 	add	sp, sp, #16
    bfa8:	e12fff1e 	bx	lr

0000bfac <new_ipc_msg>:
/// @warning this file doesnt support multi threads

/// ipc part

struct IpcMsg* new_ipc_msg(struct Session* session, const int argc, const int* arg_size)
{
    bfac:	e92d4800 	push	{fp, lr}
    bfb0:	e28db004 	add	fp, sp, #4
    bfb4:	e24dd030 	sub	sp, sp, #48	; 0x30
    bfb8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
    bfbc:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
    bfc0:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    int len = IPC_ARG_INFO_BASE_OFFSET;
    bfc4:	e3a0300c 	mov	r3, #12
    bfc8:	e50b3008 	str	r3, [fp, #-8]

    int arg_info_offset = len; // start of arg info
    bfcc:	e51b3008 	ldr	r3, [fp, #-8]
    bfd0:	e50b300c 	str	r3, [fp, #-12]
    len += argc * sizeof(struct IpcArgInfo);
    bfd4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    bfd8:	e1a02103 	lsl	r2, r3, #2
    bfdc:	e51b3008 	ldr	r3, [fp, #-8]
    bfe0:	e0823003 	add	r3, r2, r3
    bfe4:	e50b3008 	str	r3, [fp, #-8]

    int arg_buf_offset = len; // start of arg buffer
    bfe8:	e51b3008 	ldr	r3, [fp, #-8]
    bfec:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    bff0:	e3a03000 	mov	r3, #0
    bff4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    bff8:	ea00000a 	b	c028 <new_ipc_msg+0x7c>
        len += arg_size[i];
    bffc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c000:	e1a03103 	lsl	r3, r3, #2
    c004:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    c008:	e0823003 	add	r3, r2, r3
    c00c:	e5933000 	ldr	r3, [r3]
    c010:	e51b2008 	ldr	r2, [fp, #-8]
    c014:	e0823003 	add	r3, r2, r3
    c018:	e50b3008 	str	r3, [fp, #-8]
    for (int i = 0; i < argc; i++) {
    c01c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c020:	e2833001 	add	r3, r3, #1
    c024:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    c028:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    c02c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c030:	e1520003 	cmp	r2, r3
    c034:	bafffff0 	blt	bffc <new_ipc_msg+0x50>
    }
    struct IpcMsg* buf = session_alloc_buf(session, len);
    c038:	e51b1008 	ldr	r1, [fp, #-8]
    c03c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
    c040:	eb00026d 	bl	c9fc <session_alloc_buf>
    c044:	e50b001c 	str	r0, [fp, #-28]	; 0xffffffe4
    if (buf == NULL) {
    c048:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c04c:	e3530000 	cmp	r3, #0
    c050:	1a000001 	bne	c05c <new_ipc_msg+0xb0>
        return NULL;
    c054:	e3a03000 	mov	r3, #0
    c058:	ea00003d 	b	c154 <new_ipc_msg+0x1a8>
    }
    buf->header.len = len;
    c05c:	e51b3008 	ldr	r3, [fp, #-8]
    c060:	e6ff2073 	uxth	r2, r3
    c064:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c068:	e1c320b2 	strh	r2, [r3, #2]
    buf->header.done = 0;
    c06c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c070:	e5d23000 	ldrb	r3, [r2]
    c074:	e7c1309f 	bfc	r3, #1, #1
    c078:	e5c23000 	strb	r3, [r2]
    buf->header.valid = 0;
    c07c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c080:	e5d23000 	ldrb	r3, [r2]
    c084:	e7c0301f 	bfc	r3, #0, #1
    c088:	e5c23000 	strb	r3, [r2]

    for (int i = 0; i < argc; i++) {
    c08c:	e3a03000 	mov	r3, #0
    c090:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c094:	ea00001d 	b	c110 <new_ipc_msg+0x164>
        struct IpcArgInfo* arg_info = (struct IpcArgInfo*)((char*)buf + arg_info_offset);
    c098:	e51b300c 	ldr	r3, [fp, #-12]
    c09c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c0a0:	e0823003 	add	r3, r2, r3
    c0a4:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
        arg_info->len = arg_size[i];
    c0a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c0ac:	e1a03103 	lsl	r3, r3, #2
    c0b0:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    c0b4:	e0823003 	add	r3, r2, r3
    c0b8:	e5933000 	ldr	r3, [r3]
    c0bc:	e6ff2073 	uxth	r2, r3
    c0c0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    c0c4:	e1c320b2 	strh	r2, [r3, #2]
        arg_info->offset = arg_buf_offset;
    c0c8:	e51b3010 	ldr	r3, [fp, #-16]
    c0cc:	e6ff2073 	uxth	r2, r3
    c0d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    c0d4:	e1c320b0 	strh	r2, [r3]

        // update arg_info_offset and arg_buf_offset
        arg_info_offset += sizeof(struct IpcArgInfo);
    c0d8:	e51b300c 	ldr	r3, [fp, #-12]
    c0dc:	e2833004 	add	r3, r3, #4
    c0e0:	e50b300c 	str	r3, [fp, #-12]
        arg_buf_offset += arg_size[i];
    c0e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c0e8:	e1a03103 	lsl	r3, r3, #2
    c0ec:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    c0f0:	e0823003 	add	r3, r2, r3
    c0f4:	e5933000 	ldr	r3, [r3]
    c0f8:	e51b2010 	ldr	r2, [fp, #-16]
    c0fc:	e0823003 	add	r3, r2, r3
    c100:	e50b3010 	str	r3, [fp, #-16]
    for (int i = 0; i < argc; i++) {
    c104:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c108:	e2833001 	add	r3, r3, #1
    c10c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    c110:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c114:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c118:	e1520003 	cmp	r2, r3
    c11c:	baffffdd 	blt	c098 <new_ipc_msg+0xec>
    }
    buf->header.nr_args = argc;
    c120:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c124:	e6ef3073 	uxtb	r3, r3
    c128:	e203300f 	and	r3, r3, #15
    c12c:	e6ef1073 	uxtb	r1, r3
    c130:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c134:	e5d23000 	ldrb	r3, [r2]
    c138:	e7c73211 	bfi	r3, r1, #4, #4
    c13c:	e5c23000 	strb	r3, [r2]
    buf->header.init = 1;
    c140:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c144:	e5d23000 	ldrb	r3, [r2]
    c148:	e3833004 	orr	r3, r3, #4
    c14c:	e5c23000 	strb	r3, [r2]
    return buf;
    c150:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
}
    c154:	e1a00003 	mov	r0, r3
    c158:	e24bd004 	sub	sp, fp, #4
    c15c:	e8bd8800 	pop	{fp, pc}

0000c160 <ipc_msg_set_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_set_nth_arg(struct IpcMsg* msg, const int arg_num, const void* const data, const int len)
{
    c160:	e92d4800 	push	{fp, lr}
    c164:	e28db004 	add	fp, sp, #4
    c168:	e24dd020 	sub	sp, sp, #32
    c16c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c170:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c174:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    c178:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    c17c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c180:	e5d33000 	ldrb	r3, [r3]
    c184:	e7e33253 	ubfx	r3, r3, #4, #4
    c188:	e6ef3073 	uxtb	r3, r3
    c18c:	e1a02003 	mov	r2, r3
    c190:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c194:	e1520003 	cmp	r2, r3
    c198:	ca00000b 	bgt	c1cc <ipc_msg_set_nth_arg+0x6c>
        printf("[%s] IPC: arg_num out of msg range, arg_num: %d, nr_args: %d\n", __func__, arg_num, msg->header.nr_args);
    c19c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c1a0:	e5d33000 	ldrb	r3, [r3]
    c1a4:	e7e33253 	ubfx	r3, r3, #4, #4
    c1a8:	e6ef3073 	uxtb	r3, r3
    c1ac:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
    c1b0:	e3021e74 	movw	r1, #11892	; 0x2e74
    c1b4:	e3401001 	movt	r1, #1
    c1b8:	e3020d0c 	movw	r0, #11532	; 0x2d0c
    c1bc:	e3400001 	movt	r0, #1
    c1c0:	ebfffeee 	bl	bd80 <printf>
        return false;
    c1c4:	e3a03000 	mov	r3, #0
    c1c8:	ea000029 	b	c274 <ipc_msg_set_nth_arg+0x114>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    c1cc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c1d0:	e2833003 	add	r3, r3, #3
    c1d4:	e1a03103 	lsl	r3, r3, #2
    c1d8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c1dc:	e0823003 	add	r3, r2, r3
    c1e0:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    c1e4:	e51b3008 	ldr	r3, [fp, #-8]
    c1e8:	e1d330b2 	ldrh	r3, [r3, #2]
    c1ec:	e1a02003 	mov	r2, r3
    c1f0:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c1f4:	e1520003 	cmp	r2, r3
    c1f8:	aa000009 	bge	c224 <ipc_msg_set_nth_arg+0xc4>
        printf("[%s] IPC: size of arg out of buffer range, given len: %d, len %d\n", __func__, len, nth_arg_info->len);
    c1fc:	e51b3008 	ldr	r3, [fp, #-8]
    c200:	e1d330b2 	ldrh	r3, [r3, #2]
    c204:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    c208:	e3021e74 	movw	r1, #11892	; 0x2e74
    c20c:	e3401001 	movt	r1, #1
    c210:	e3020d4c 	movw	r0, #11596	; 0x2d4c
    c214:	e3400001 	movt	r0, #1
    c218:	ebfffed8 	bl	bd80 <printf>
        return false;
    c21c:	e3a03000 	mov	r3, #0
    c220:	ea000013 	b	c274 <ipc_msg_set_nth_arg+0x114>
    c224:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c228:	e50b3010 	str	r3, [fp, #-16]
    c22c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c230:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return (void*)((char*)msg + IPCMSG_ARG_INFO(msg, arg_num)->offset);
    c234:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c238:	e2833003 	add	r3, r3, #3
    c23c:	e1a03103 	lsl	r3, r3, #2
    c240:	e51b2010 	ldr	r2, [fp, #-16]
    c244:	e0823003 	add	r3, r2, r3
    c248:	e1d330b0 	ldrh	r3, [r3]
    c24c:	e1a02003 	mov	r2, r3
    c250:	e51b3010 	ldr	r3, [fp, #-16]
    c254:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    c258:	e50b300c 	str	r3, [fp, #-12]
    memmove(buf, data, len);
    c25c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c260:	e1a02003 	mov	r2, r3
    c264:	e51b1020 	ldr	r1, [fp, #-32]	; 0xffffffe0
    c268:	e51b000c 	ldr	r0, [fp, #-12]
    c26c:	eb0005a8 	bl	d914 <memmove>
    return true;
    c270:	e3a03001 	mov	r3, #1
}
    c274:	e1a00003 	mov	r0, r3
    c278:	e24bd004 	sub	sp, fp, #4
    c27c:	e8bd8800 	pop	{fp, pc}

0000c280 <ipc_msg_get_nth_arg>:
/// @param arg_num start with 0 for first arg
/// @param data
/// @param len data buffer len
/// @return
bool ipc_msg_get_nth_arg(struct IpcMsg* msg, const int arg_num, void* data, const int len)
{
    c280:	e92d4800 	push	{fp, lr}
    c284:	e28db004 	add	fp, sp, #4
    c288:	e24dd020 	sub	sp, sp, #32
    c28c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    c290:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    c294:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    c298:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    if (arg_num >= msg->header.nr_args) {
    c29c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c2a0:	e5d33000 	ldrb	r3, [r3]
    c2a4:	e7e33253 	ubfx	r3, r3, #4, #4
    c2a8:	e6ef3073 	uxtb	r3, r3
    c2ac:	e1a02003 	mov	r2, r3
    c2b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c2b4:	e1520003 	cmp	r2, r3
    c2b8:	ca000006 	bgt	c2d8 <ipc_msg_get_nth_arg+0x58>
        printf("[%s] IPC: arg_num out of msg range", __func__);
    c2bc:	e3021e88 	movw	r1, #11912	; 0x2e88
    c2c0:	e3401001 	movt	r1, #1
    c2c4:	e3020d90 	movw	r0, #11664	; 0x2d90
    c2c8:	e3400001 	movt	r0, #1
    c2cc:	ebfffeab 	bl	bd80 <printf>
        return false;
    c2d0:	e3a03000 	mov	r3, #0
    c2d4:	ea000026 	b	c374 <ipc_msg_get_nth_arg+0xf4>
    }
    struct IpcArgInfo* nth_arg_info = IPCMSG_ARG_INFO(msg, arg_num);
    c2d8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c2dc:	e2833003 	add	r3, r3, #3
    c2e0:	e1a03103 	lsl	r3, r3, #2
    c2e4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
    c2e8:	e0823003 	add	r3, r2, r3
    c2ec:	e50b3008 	str	r3, [fp, #-8]
    if (len > nth_arg_info->len) {
    c2f0:	e51b3008 	ldr	r3, [fp, #-8]
    c2f4:	e1d330b2 	ldrh	r3, [r3, #2]
    c2f8:	e1a02003 	mov	r2, r3
    c2fc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c300:	e1520003 	cmp	r2, r3
    c304:	aa000006 	bge	c324 <ipc_msg_get_nth_arg+0xa4>
        printf("[%s] IPC: size of arg out of buffer range", __func__);
    c308:	e3021e88 	movw	r1, #11912	; 0x2e88
    c30c:	e3401001 	movt	r1, #1
    c310:	e3020db4 	movw	r0, #11700	; 0x2db4
    c314:	e3400001 	movt	r0, #1
    c318:	ebfffe98 	bl	bd80 <printf>
        return false;
    c31c:	e3a03000 	mov	r3, #0
    c320:	ea000013 	b	c374 <ipc_msg_get_nth_arg+0xf4>
    c324:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c328:	e50b3010 	str	r3, [fp, #-16]
    c32c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c330:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    c334:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c338:	e2833003 	add	r3, r3, #3
    c33c:	e1a03103 	lsl	r3, r3, #2
    c340:	e51b2010 	ldr	r2, [fp, #-16]
    c344:	e0823003 	add	r3, r2, r3
    c348:	e1d330b0 	ldrh	r3, [r3]
    c34c:	e1a02003 	mov	r2, r3
    c350:	e51b3010 	ldr	r3, [fp, #-16]
    c354:	e0833002 	add	r3, r3, r2
    }
    void* buf = ipc_msg_get_nth_arg_buf(msg, arg_num);
    c358:	e50b300c 	str	r3, [fp, #-12]
    memmove(data, buf, len);
    c35c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c360:	e1a02003 	mov	r2, r3
    c364:	e51b100c 	ldr	r1, [fp, #-12]
    c368:	e51b0020 	ldr	r0, [fp, #-32]	; 0xffffffe0
    c36c:	eb000568 	bl	d914 <memmove>
    return true;
    c370:	e3a03001 	mov	r3, #1
}
    c374:	e1a00003 	mov	r0, r3
    c378:	e24bd004 	sub	sp, fp, #4
    c37c:	e8bd8800 	pop	{fp, pc}

0000c380 <ipc_msg_send_wait>:

void ipc_msg_send_wait(struct IpcMsg* msg)
{
    c380:	e92d4800 	push	{fp, lr}
    c384:	e28db004 	add	fp, sp, #4
    c388:	e24dd008 	sub	sp, sp, #8
    c38c:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    c390:	e51b2008 	ldr	r2, [fp, #-8]
    c394:	e30d3cba 	movw	r3, #56506	; 0xdcba
    c398:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    c39c:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    c3a0:	e51b2008 	ldr	r2, [fp, #-8]
    c3a4:	e5d23000 	ldrb	r3, [r2]
    c3a8:	e3833001 	orr	r3, r3, #1
    c3ac:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    c3b0:	e51b2008 	ldr	r2, [fp, #-8]
    c3b4:	e5d23000 	ldrb	r3, [r2]
    c3b8:	e7c1309f 	bfc	r3, #1, #1
    c3bc:	e5c23000 	strb	r3, [r2]
    while (msg->header.done == 0) {
    c3c0:	ea000000 	b	c3c8 <ipc_msg_send_wait+0x48>
        /// @todo syscall yield with prio decrease
        yield();
    c3c4:	eb00035b 	bl	d138 <yield>
    while (msg->header.done == 0) {
    c3c8:	e51b3008 	ldr	r3, [fp, #-8]
    c3cc:	e5d33000 	ldrb	r3, [r3]
    c3d0:	e2033002 	and	r3, r3, #2
    c3d4:	e6ef3073 	uxtb	r3, r3
    c3d8:	e3530000 	cmp	r3, #0
    c3dc:	0afffff8 	beq	c3c4 <ipc_msg_send_wait+0x44>
    }
    assert(msg->header.done == 1);
    c3e0:	e51b3008 	ldr	r3, [fp, #-8]
    c3e4:	e5d33000 	ldrb	r3, [r3]
    c3e8:	e2033002 	and	r3, r3, #2
    c3ec:	e6ef3073 	uxtb	r3, r3
    c3f0:	e3530000 	cmp	r3, #0
    c3f4:	1a000007 	bne	c418 <ipc_msg_send_wait+0x98>
    c3f8:	e3023de0 	movw	r3, #11744	; 0x2de0
    c3fc:	e3403001 	movt	r3, #1
    c400:	e3022e9c 	movw	r2, #11932	; 0x2e9c
    c404:	e3402001 	movt	r2, #1
    c408:	e3a0107e 	mov	r1, #126	; 0x7e
    c40c:	e3020df8 	movw	r0, #11768	; 0x2df8
    c410:	e3400001 	movt	r0, #1
    c414:	eb0004a5 	bl	d6b0 <__assert_func>
}
    c418:	e320f000 	nop	{0}
    c41c:	e24bd004 	sub	sp, fp, #4
    c420:	e8bd8800 	pop	{fp, pc}

0000c424 <ipc_msg_send_nowait>:

void ipc_msg_send_nowait(struct IpcMsg* msg)
{
    c424:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c428:	e28db000 	add	fp, sp, #0
    c42c:	e24dd00c 	sub	sp, sp, #12
    c430:	e50b0008 	str	r0, [fp, #-8]
    msg->header.magic = IPC_MSG_MAGIC;
    c434:	e51b2008 	ldr	r2, [fp, #-8]
    c438:	e30d3cba 	movw	r3, #56506	; 0xdcba
    c43c:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    c440:	e5823004 	str	r3, [r2, #4]
    msg->header.valid = 1;
    c444:	e51b2008 	ldr	r2, [fp, #-8]
    c448:	e5d23000 	ldrb	r3, [r2]
    c44c:	e3833001 	orr	r3, r3, #1
    c450:	e5c23000 	strb	r3, [r2]
    msg->header.done = 0;
    c454:	e51b2008 	ldr	r2, [fp, #-8]
    c458:	e5d23000 	ldrb	r3, [r2]
    c45c:	e7c1309f 	bfc	r3, #1, #1
    c460:	e5c23000 	strb	r3, [r2]
}
    c464:	e320f000 	nop	{0}
    c468:	e28bd000 	add	sp, fp, #0
    c46c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c470:	e12fff1e 	bx	lr

0000c474 <ipc_session_wait>:

int ipc_session_wait(struct Session* session)
{
    c474:	e92d4800 	push	{fp, lr}
    c478:	e28db004 	add	fp, sp, #4
    c47c:	e24dd010 	sub	sp, sp, #16
    c480:	e50b0010 	str	r0, [fp, #-16]
    struct IpcMsg* msg = IPCSESSION_MSG(session);
    c484:	e51b3010 	ldr	r3, [fp, #-16]
    c488:	e5933010 	ldr	r3, [r3, #16]
    c48c:	e51b2010 	ldr	r2, [fp, #-16]
    c490:	e5922008 	ldr	r2, [r2, #8]
    c494:	e0833002 	add	r3, r3, r2
    c498:	e50b3008 	str	r3, [fp, #-8]
    while (msg->header.done == 0) {
    c49c:	ea000000 	b	c4a4 <ipc_session_wait+0x30>
        /// @todo syscall yield with prio decrease
        yield();
    c4a0:	eb000324 	bl	d138 <yield>
    while (msg->header.done == 0) {
    c4a4:	e51b3008 	ldr	r3, [fp, #-8]
    c4a8:	e5d33000 	ldrb	r3, [r3]
    c4ac:	e2033002 	and	r3, r3, #2
    c4b0:	e6ef3073 	uxtb	r3, r3
    c4b4:	e3530000 	cmp	r3, #0
    c4b8:	0afffff8 	beq	c4a0 <ipc_session_wait+0x2c>
    }
    assert(msg->header.done == 1);
    c4bc:	e51b3008 	ldr	r3, [fp, #-8]
    c4c0:	e5d33000 	ldrb	r3, [r3]
    c4c4:	e2033002 	and	r3, r3, #2
    c4c8:	e6ef3073 	uxtb	r3, r3
    c4cc:	e3530000 	cmp	r3, #0
    c4d0:	1a000007 	bne	c4f4 <ipc_session_wait+0x80>
    c4d4:	e3023de0 	movw	r3, #11744	; 0x2de0
    c4d8:	e3403001 	movt	r3, #1
    c4dc:	e3022eb0 	movw	r2, #11952	; 0x2eb0
    c4e0:	e3402001 	movt	r2, #1
    c4e4:	e3a0108f 	mov	r1, #143	; 0x8f
    c4e8:	e3020df8 	movw	r0, #11768	; 0x2df8
    c4ec:	e3400001 	movt	r0, #1
    c4f0:	eb00046e 	bl	d6b0 <__assert_func>
    return msg->header.ret_val;
    c4f4:	e51b3008 	ldr	r3, [fp, #-8]
    c4f8:	e5933008 	ldr	r3, [r3, #8]
}
    c4fc:	e1a00003 	mov	r0, r3
    c500:	e24bd004 	sub	sp, fp, #4
    c504:	e8bd8800 	pop	{fp, pc}

0000c508 <cur_session_id>:

static int cur_sess_id = -1;
int cur_session_id(void)
{
    c508:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c50c:	e28db000 	add	fp, sp, #0
    return cur_sess_id;
    c510:	e3033568 	movw	r3, #13672	; 0x3568
    c514:	e3403001 	movt	r3, #1
    c518:	e5933000 	ldr	r3, [r3]
}
    c51c:	e1a00003 	mov	r0, r3
    c520:	e28bd000 	add	sp, fp, #0
    c524:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c528:	e12fff1e 	bx	lr

0000c52c <delay_session>:

static bool session_delayed = false;
void delay_session(void)
{
    c52c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    c530:	e28db000 	add	fp, sp, #0
    session_delayed = true;
    c534:	e30c3138 	movw	r3, #49464	; 0xc138
    c538:	e3403003 	movt	r3, #3
    c53c:	e3a02001 	mov	r2, #1
    c540:	e5c32000 	strb	r2, [r3]
}
    c544:	e320f000 	nop	{0}
    c548:	e28bd000 	add	sp, fp, #0
    c54c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    c550:	e12fff1e 	bx	lr

0000c554 <ipc_server_loop>:

void ipc_server_loop(struct IpcNode* ipc_node)
{
    c554:	e92d4810 	push	{r4, fp, lr}
    c558:	e28db008 	add	fp, sp, #8
    c55c:	e24ddf5d 	sub	sp, sp, #372	; 0x174
    c560:	e50b0178 	str	r0, [fp, #-376]	; 0xfffffe88
        /* if connect sessions are greater than NR_MAX_SESSION,
            a full round will require multiple polls.
            Eg.(3 polls to with 6 sessions and NR_MAX_SESSION = 4):
                [0, 1, 2, 3], [4, 5, 0, 1], [2, 3, 4, 5]
        */
        poll_session(session_list, NR_MAX_SESSION);
    c564:	e24b3e17 	sub	r3, fp, #368	; 0x170
    c568:	e3a01010 	mov	r1, #16
    c56c:	e1a00003 	mov	r0, r3
    c570:	eb00031f 	bl	d1f4 <poll_session>
        /* handle each session */
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    c574:	e3a03000 	mov	r3, #0
    c578:	e50b3010 	str	r3, [fp, #-16]
    c57c:	ea000102 	b	c98c <ipc_server_loop+0x438>
            if (session_list[i].buf == NULL) {
    c580:	e51b2010 	ldr	r2, [fp, #-16]
    c584:	e1a03002 	mov	r3, r2
    c588:	e1a03103 	lsl	r3, r3, #2
    c58c:	e0833002 	add	r3, r3, r2
    c590:	e1a03103 	lsl	r3, r3, #2
    c594:	e24b200c 	sub	r2, fp, #12
    c598:	e0823003 	add	r3, r2, r3
    c59c:	e2433f55 	sub	r3, r3, #340	; 0x154
    c5a0:	e5933000 	ldr	r3, [r3]
    c5a4:	e3530000 	cmp	r3, #0
    c5a8:	1a000001 	bne	c5b4 <ipc_server_loop+0x60>
                yield();
    c5ac:	eb0002e1 	bl	d138 <yield>
                break;
    c5b0:	ea0000f8 	b	c998 <ipc_server_loop+0x444>
            }
            cur_sess_id = session_list[i].id;
    c5b4:	e51b2010 	ldr	r2, [fp, #-16]
    c5b8:	e1a03002 	mov	r3, r2
    c5bc:	e1a03103 	lsl	r3, r3, #2
    c5c0:	e0833002 	add	r3, r3, r2
    c5c4:	e1a03103 	lsl	r3, r3, #2
    c5c8:	e24b200c 	sub	r2, fp, #12
    c5cc:	e0823003 	add	r3, r2, r3
    c5d0:	e2433f59 	sub	r3, r3, #356	; 0x164
    c5d4:	e5932000 	ldr	r2, [r3]
    c5d8:	e3033568 	movw	r3, #13672	; 0x3568
    c5dc:	e3403001 	movt	r3, #1
    c5e0:	e5832000 	str	r2, [r3]
            struct IpcMsg* msg = IPCSESSION_MSG(&session_list[i]);
    c5e4:	e51b2010 	ldr	r2, [fp, #-16]
    c5e8:	e1a03002 	mov	r3, r2
    c5ec:	e1a03103 	lsl	r3, r3, #2
    c5f0:	e0833002 	add	r3, r3, r2
    c5f4:	e1a03103 	lsl	r3, r3, #2
    c5f8:	e24b200c 	sub	r2, fp, #12
    c5fc:	e0823003 	add	r3, r2, r3
    c600:	e2433f55 	sub	r3, r3, #340	; 0x154
    c604:	e5931000 	ldr	r1, [r3]
    c608:	e51b2010 	ldr	r2, [fp, #-16]
    c60c:	e1a03002 	mov	r3, r2
    c610:	e1a03103 	lsl	r3, r3, #2
    c614:	e0833002 	add	r3, r3, r2
    c618:	e1a03103 	lsl	r3, r3, #2
    c61c:	e24b200c 	sub	r2, fp, #12
    c620:	e0823003 	add	r3, r2, r3
    c624:	e2433f57 	sub	r3, r3, #348	; 0x15c
    c628:	e5933000 	ldr	r3, [r3]
    c62c:	e0813003 	add	r3, r1, r3
    c630:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            /* handle every message in current session
                a session could be delay in case one of its message(current message) needs to wait for an interrupt message's arrival
                interfaces[opcode] should explicitly call delay_session() and return to delay this session
            */
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    c634:	ea0000b9 	b	c920 <ipc_server_loop+0x3cc>
                // printf("session %d [%d, %d]\n", session_list[i].id, session_list[i].head, session_list[i].tail);
                if (session_used_size(&session_list[i]) == 0 && session_forward_tail(&session_list[i], msg->header.len) < 0) {
    c638:	e24b1e17 	sub	r1, fp, #368	; 0x170
    c63c:	e51b2010 	ldr	r2, [fp, #-16]
    c640:	e1a03002 	mov	r3, r2
    c644:	e1a03103 	lsl	r3, r3, #2
    c648:	e0833002 	add	r3, r3, r2
    c64c:	e1a03103 	lsl	r3, r3, #2
    c650:	e0813003 	add	r3, r1, r3
    c654:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    void* buf;
};

__attribute__((__always_inline__)) static inline int session_used_size(struct Session* session)
{
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    c658:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c65c:	e593200c 	ldr	r2, [r3, #12]
    c660:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c664:	e5933004 	ldr	r3, [r3, #4]
    c668:	e0822003 	add	r2, r2, r3
    c66c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c670:	e5933008 	ldr	r3, [r3, #8]
    c674:	e0422003 	sub	r2, r2, r3
    c678:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    c67c:	e5933004 	ldr	r3, [r3, #4]
    c680:	e1a01003 	mov	r1, r3
    c684:	e1a00002 	mov	r0, r2
    c688:	eb0003ff 	bl	d68c <__aeabi_idivmod>
    c68c:	e1a03001 	mov	r3, r1
    c690:	e3530000 	cmp	r3, #0
    c694:	1a000038 	bne	c77c <ipc_server_loop+0x228>
    c698:	e24b1e17 	sub	r1, fp, #368	; 0x170
    c69c:	e51b2010 	ldr	r2, [fp, #-16]
    c6a0:	e1a03002 	mov	r3, r2
    c6a4:	e1a03103 	lsl	r3, r3, #2
    c6a8:	e0833002 	add	r3, r3, r2
    c6ac:	e1a03103 	lsl	r3, r3, #2
    c6b0:	e0813003 	add	r3, r1, r3
    c6b4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    c6b8:	e1d220b2 	ldrh	r2, [r2, #2]
    c6bc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    c6c0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    c6c4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c6c8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
}

__attribute__((__always_inline__)) static inline int session_remain_capacity(struct Session* session)
{
    return session->capacity - session_used_size(session);
    c6cc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c6d0:	e5934004 	ldr	r4, [r3, #4]
    c6d4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    c6d8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    c6dc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    c6e0:	e593200c 	ldr	r2, [r3, #12]
    c6e4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    c6e8:	e5933004 	ldr	r3, [r3, #4]
    c6ec:	e0822003 	add	r2, r2, r3
    c6f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    c6f4:	e5933008 	ldr	r3, [r3, #8]
    c6f8:	e0422003 	sub	r2, r2, r3
    c6fc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    c700:	e5933004 	ldr	r3, [r3, #4]
    c704:	e1a01003 	mov	r1, r3
    c708:	e1a00002 	mov	r0, r2
    c70c:	eb0003de 	bl	d68c <__aeabi_idivmod>
    c710:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    c714:	e0443003 	sub	r3, r4, r3
    return session->head;
}

__attribute__((__always_inline__)) static inline int session_forward_tail(struct Session* session, int len)
{
    if (len > session_remain_capacity(session)) {
    c718:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    c71c:	e1520003 	cmp	r2, r3
    c720:	da000004 	ble	c738 <ipc_server_loop+0x1e4>
        printf("forward tail with too much size\n");
    c724:	e3020e04 	movw	r0, #11780	; 0x2e04
    c728:	e3400001 	movt	r0, #1
    c72c:	ebfffd93 	bl	bd80 <printf>
        return -1;
    c730:	e3e03000 	mvn	r3, #0
    c734:	ea00000e 	b	c774 <ipc_server_loop+0x220>
    }
    session->tail = (session->tail + len) % session->capacity;
    c738:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c73c:	e593200c 	ldr	r2, [r3, #12]
    c740:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    c744:	e0822003 	add	r2, r2, r3
    c748:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c74c:	e5933004 	ldr	r3, [r3, #4]
    c750:	e1a01003 	mov	r1, r3
    c754:	e1a00002 	mov	r0, r2
    c758:	eb0003cb 	bl	d68c <__aeabi_idivmod>
    c75c:	e1a03001 	mov	r3, r1
    c760:	e1a02003 	mov	r2, r3
    c764:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c768:	e583200c 	str	r2, [r3, #12]
    return session->tail;
    c76c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    c770:	e593300c 	ldr	r3, [r3, #12]
    c774:	e3530000 	cmp	r3, #0
    c778:	ba00007b 	blt	c96c <ipc_server_loop+0x418>
                    break;
                }
                if (ipc_node->interfaces[msg->header.opcode]) {
    c77c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c780:	e5d33001 	ldrb	r3, [r3, #1]
    c784:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    c788:	e1a03103 	lsl	r3, r3, #2
    c78c:	e0823003 	add	r3, r2, r3
    c790:	e5933004 	ldr	r3, [r3, #4]
    c794:	e3530000 	cmp	r3, #0
    c798:	0a000011 	beq	c7e4 <ipc_server_loop+0x290>
                    ipc_node->interfaces[msg->header.opcode](msg);
    c79c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7a0:	e5d33001 	ldrb	r3, [r3, #1]
    c7a4:	e51b2178 	ldr	r2, [fp, #-376]	; 0xfffffe88
    c7a8:	e1a03103 	lsl	r3, r3, #2
    c7ac:	e0823003 	add	r3, r2, r3
    c7b0:	e5933004 	ldr	r3, [r3, #4]
    c7b4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
    c7b8:	e12fff33 	blx	r3
                    // check if this session is delayed by op handler, all messages after the delayed message in current session is blocked.
                    if (session_delayed) {
    c7bc:	e30c3138 	movw	r3, #49464	; 0xc138
    c7c0:	e3403003 	movt	r3, #3
    c7c4:	e5d33000 	ldrb	r3, [r3]
    c7c8:	e3530000 	cmp	r3, #0
    c7cc:	0a00000f 	beq	c810 <ipc_server_loop+0x2bc>
                        session_delayed = false;
    c7d0:	e30c3138 	movw	r3, #49464	; 0xc138
    c7d4:	e3403003 	movt	r3, #3
    c7d8:	e3a02000 	mov	r2, #0
    c7dc:	e5c32000 	strb	r2, [r3]
                        break;
    c7e0:	ea000062 	b	c970 <ipc_server_loop+0x41c>
                    }
                } else {
                    printf("Unsupport opcode(%d) for server: %s\n", msg->header.opcode, ipc_node->name);
    c7e4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c7e8:	e5d33001 	ldrb	r3, [r3, #1]
    c7ec:	e1a01003 	mov	r1, r3
    c7f0:	e51b3178 	ldr	r3, [fp, #-376]	; 0xfffffe88
    c7f4:	e5933000 	ldr	r3, [r3]
    c7f8:	e1a02003 	mov	r2, r3
    c7fc:	e3020e28 	movw	r0, #11816	; 0x2e28
    c800:	e3400001 	movt	r0, #1
    c804:	ebfffd5d 	bl	bd80 <printf>
                }
                // finish this message in server's perspective
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    c808:	ea000000 	b	c810 <ipc_server_loop+0x2bc>
                    yield();
    c80c:	eb000249 	bl	d138 <yield>
                while (session_forward_head(&session_list[i], msg->header.len) < 0) {
    c810:	e24b1e17 	sub	r1, fp, #368	; 0x170
    c814:	e51b2010 	ldr	r2, [fp, #-16]
    c818:	e1a03002 	mov	r3, r2
    c81c:	e1a03103 	lsl	r3, r3, #2
    c820:	e0833002 	add	r3, r3, r2
    c824:	e1a03103 	lsl	r3, r3, #2
    c828:	e0813003 	add	r3, r1, r3
    c82c:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    c830:	e1d220b2 	ldrh	r2, [r2, #2]
    c834:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    c838:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
    if (((session->head + len) % session->capacity) > session->tail) {
    c83c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c840:	e5932008 	ldr	r2, [r3, #8]
    c844:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    c848:	e0822003 	add	r2, r2, r3
    c84c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c850:	e5933004 	ldr	r3, [r3, #4]
    c854:	e1a01003 	mov	r1, r3
    c858:	e1a00002 	mov	r0, r2
    c85c:	eb00038a 	bl	d68c <__aeabi_idivmod>
    c860:	e1a03001 	mov	r3, r1
    c864:	e1a02003 	mov	r2, r3
    c868:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c86c:	e593300c 	ldr	r3, [r3, #12]
    c870:	e1520003 	cmp	r2, r3
    c874:	da000004 	ble	c88c <ipc_server_loop+0x338>
        printf("forward head with too much size\n");
    c878:	e3020e50 	movw	r0, #11856	; 0x2e50
    c87c:	e3400001 	movt	r0, #1
    c880:	ebfffd3e 	bl	bd80 <printf>
        return -1;
    c884:	e3e03000 	mvn	r3, #0
    c888:	ea00000e 	b	c8c8 <ipc_server_loop+0x374>
    session->head = (session->head + len) % session->capacity;
    c88c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c890:	e5932008 	ldr	r2, [r3, #8]
    c894:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    c898:	e0822003 	add	r2, r2, r3
    c89c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c8a0:	e5933004 	ldr	r3, [r3, #4]
    c8a4:	e1a01003 	mov	r1, r3
    c8a8:	e1a00002 	mov	r0, r2
    c8ac:	eb000376 	bl	d68c <__aeabi_idivmod>
    c8b0:	e1a03001 	mov	r3, r1
    c8b4:	e1a02003 	mov	r2, r3
    c8b8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c8bc:	e5832008 	str	r2, [r3, #8]
    return session->head;
    c8c0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    c8c4:	e5933008 	ldr	r3, [r3, #8]
    c8c8:	e3530000 	cmp	r3, #0
    c8cc:	baffffce 	blt	c80c <ipc_server_loop+0x2b8>
                }
                msg = IPCSESSION_MSG(&session_list[i]);
    c8d0:	e51b2010 	ldr	r2, [fp, #-16]
    c8d4:	e1a03002 	mov	r3, r2
    c8d8:	e1a03103 	lsl	r3, r3, #2
    c8dc:	e0833002 	add	r3, r3, r2
    c8e0:	e1a03103 	lsl	r3, r3, #2
    c8e4:	e24b200c 	sub	r2, fp, #12
    c8e8:	e0823003 	add	r3, r2, r3
    c8ec:	e2433f55 	sub	r3, r3, #340	; 0x154
    c8f0:	e5931000 	ldr	r1, [r3]
    c8f4:	e51b2010 	ldr	r2, [fp, #-16]
    c8f8:	e1a03002 	mov	r3, r2
    c8fc:	e1a03103 	lsl	r3, r3, #2
    c900:	e0833002 	add	r3, r3, r2
    c904:	e1a03103 	lsl	r3, r3, #2
    c908:	e24b200c 	sub	r2, fp, #12
    c90c:	e0823003 	add	r3, r2, r3
    c910:	e2433f57 	sub	r3, r3, #348	; 0x15c
    c914:	e5933000 	ldr	r3, [r3]
    c918:	e0813003 	add	r3, r1, r3
    c91c:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
            while (msg->header.magic == IPC_MSG_MAGIC && msg->header.valid == 1 && msg->header.done != 1) {
    c920:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c924:	e5932004 	ldr	r2, [r3, #4]
    c928:	e30d3cba 	movw	r3, #56506	; 0xdcba
    c92c:	e34a3bcd 	movt	r3, #43981	; 0xabcd
    c930:	e1520003 	cmp	r2, r3
    c934:	1a00000d 	bne	c970 <ipc_server_loop+0x41c>
    c938:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c93c:	e5d33000 	ldrb	r3, [r3]
    c940:	e2033001 	and	r3, r3, #1
    c944:	e6ef3073 	uxtb	r3, r3
    c948:	e3530000 	cmp	r3, #0
    c94c:	0a000007 	beq	c970 <ipc_server_loop+0x41c>
    c950:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    c954:	e5d33000 	ldrb	r3, [r3]
    c958:	e2033002 	and	r3, r3, #2
    c95c:	e6ef3073 	uxtb	r3, r3
    c960:	e3530000 	cmp	r3, #0
    c964:	0affff33 	beq	c638 <ipc_server_loop+0xe4>
    c968:	ea000000 	b	c970 <ipc_server_loop+0x41c>
                    break;
    c96c:	e320f000 	nop	{0}
            }
            // stop handle this session
            cur_sess_id = -1;
    c970:	e3033568 	movw	r3, #13672	; 0x3568
    c974:	e3403001 	movt	r3, #1
    c978:	e3e02000 	mvn	r2, #0
    c97c:	e5832000 	str	r2, [r3]
        for (int i = 0; i < NR_MAX_SESSION; i++) {
    c980:	e51b3010 	ldr	r3, [fp, #-16]
    c984:	e2833001 	add	r3, r3, #1
    c988:	e50b3010 	str	r3, [fp, #-16]
    c98c:	e51b3010 	ldr	r3, [fp, #-16]
    c990:	e353000f 	cmp	r3, #15
    c994:	dafffef9 	ble	c580 <ipc_server_loop+0x2c>
        poll_session(session_list, NR_MAX_SESSION);
    c998:	eafffef1 	b	c564 <ipc_server_loop+0x10>

0000c99c <connect_session>:

#include "session.h"
#include "usyscall.h"

int connect_session(struct Session* _session, char* _path, int _capacity)
{
    c99c:	e92d4800 	push	{fp, lr}
    c9a0:	e28db004 	add	fp, sp, #4
    c9a4:	e24dd010 	sub	sp, sp, #16
    c9a8:	e50b0008 	str	r0, [fp, #-8]
    c9ac:	e50b100c 	str	r1, [fp, #-12]
    c9b0:	e50b2010 	str	r2, [fp, #-16]
    return session(_path, _capacity, _session);
    c9b4:	e51b2008 	ldr	r2, [fp, #-8]
    c9b8:	e51b1010 	ldr	r1, [fp, #-16]
    c9bc:	e51b000c 	ldr	r0, [fp, #-12]
    c9c0:	eb0001f9 	bl	d1ac <session>
    c9c4:	e1a03000 	mov	r3, r0
}
    c9c8:	e1a00003 	mov	r0, r3
    c9cc:	e24bd004 	sub	sp, fp, #4
    c9d0:	e8bd8800 	pop	{fp, pc}

0000c9d4 <free_session>:

int free_session(struct Session* session)
{
    c9d4:	e92d4800 	push	{fp, lr}
    c9d8:	e28db004 	add	fp, sp, #4
    c9dc:	e24dd008 	sub	sp, sp, #8
    c9e0:	e50b0008 	str	r0, [fp, #-8]
    return close_session(session);
    c9e4:	e51b0008 	ldr	r0, [fp, #-8]
    c9e8:	eb000211 	bl	d234 <close_session>
    c9ec:	e1a03000 	mov	r3, r0
}
    c9f0:	e1a00003 	mov	r0, r3
    c9f4:	e24bd004 	sub	sp, fp, #4
    c9f8:	e8bd8800 	pop	{fp, pc}

0000c9fc <session_alloc_buf>:

// ipc_msg alloc_buffer(ipc_session)

void* session_alloc_buf(struct Session* session, int len)
{
    c9fc:	e92d4810 	push	{r4, fp, lr}
    ca00:	e28db008 	add	fp, sp, #8
    ca04:	e24dd02c 	sub	sp, sp, #44	; 0x2c
    ca08:	e50b0030 	str	r0, [fp, #-48]	; 0xffffffd0
    ca0c:	e50b1034 	str	r1, [fp, #-52]	; 0xffffffcc
    ca10:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    ca14:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
    return session->capacity - session_used_size(session);
    ca18:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ca1c:	e5934004 	ldr	r4, [r3, #4]
    ca20:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ca24:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    ca28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ca2c:	e593200c 	ldr	r2, [r3, #12]
    ca30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ca34:	e5933004 	ldr	r3, [r3, #4]
    ca38:	e0822003 	add	r2, r2, r3
    ca3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ca40:	e5933008 	ldr	r3, [r3, #8]
    ca44:	e0422003 	sub	r2, r2, r3
    ca48:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    ca4c:	e5933004 	ldr	r3, [r3, #4]
    ca50:	e1a01003 	mov	r1, r3
    ca54:	e1a00002 	mov	r0, r2
    ca58:	eb00030b 	bl	d68c <__aeabi_idivmod>
    ca5c:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    ca60:	e0442003 	sub	r2, r4, r3
    if (len > session_remain_capacity(session)) {
    ca64:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    ca68:	e1520003 	cmp	r2, r3
    ca6c:	aa000001 	bge	ca78 <session_alloc_buf+0x7c>
        return NULL;
    ca70:	e3a03000 	mov	r3, #0
    ca74:	ea000038 	b	cb5c <session_alloc_buf+0x160>
    }
    void* buf = session->buf + session->tail;
    ca78:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    ca7c:	e5933010 	ldr	r3, [r3, #16]
    ca80:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
    ca84:	e592200c 	ldr	r2, [r2, #12]
    ca88:	e0833002 	add	r3, r3, r2
    ca8c:	e50b3010 	str	r3, [fp, #-16]
    // we mapped double size of page, so it's ok to write buffer directly
    memset(buf, 0, len);
    ca90:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    ca94:	e1a02003 	mov	r2, r3
    ca98:	e3a01000 	mov	r1, #0
    ca9c:	e51b0010 	ldr	r0, [fp, #-16]
    caa0:	eb0003ed 	bl	da5c <memset>
    caa4:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
    caa8:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
    caac:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
    cab0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
    cab4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cab8:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    cabc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    cac0:	e5934004 	ldr	r4, [r3, #4]
    cac4:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
    cac8:	e50b3028 	str	r3, [fp, #-40]	; 0xffffffd8
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    cacc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    cad0:	e593200c 	ldr	r2, [r3, #12]
    cad4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    cad8:	e5933004 	ldr	r3, [r3, #4]
    cadc:	e0822003 	add	r2, r2, r3
    cae0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    cae4:	e5933008 	ldr	r3, [r3, #8]
    cae8:	e0422003 	sub	r2, r2, r3
    caec:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
    caf0:	e5933004 	ldr	r3, [r3, #4]
    caf4:	e1a01003 	mov	r1, r3
    caf8:	e1a00002 	mov	r0, r2
    cafc:	eb0002e2 	bl	d68c <__aeabi_idivmod>
    cb00:	e1a03001 	mov	r3, r1
    return session->capacity - session_used_size(session);
    cb04:	e0443003 	sub	r3, r4, r3
    if (len > session_remain_capacity(session)) {
    cb08:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    cb0c:	e1520003 	cmp	r2, r3
    cb10:	da000003 	ble	cb24 <session_alloc_buf+0x128>
        printf("forward tail with too much size\n");
    cb14:	e3020ec4 	movw	r0, #11972	; 0x2ec4
    cb18:	e3400001 	movt	r0, #1
    cb1c:	ebfffc97 	bl	bd80 <printf>
    cb20:	ea00000c 	b	cb58 <session_alloc_buf+0x15c>
    session->tail = (session->tail + len) % session->capacity;
    cb24:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cb28:	e593200c 	ldr	r2, [r3, #12]
    cb2c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    cb30:	e0822003 	add	r2, r2, r3
    cb34:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cb38:	e5933004 	ldr	r3, [r3, #4]
    cb3c:	e1a01003 	mov	r1, r3
    cb40:	e1a00002 	mov	r0, r2
    cb44:	eb0002d0 	bl	d68c <__aeabi_idivmod>
    cb48:	e1a03001 	mov	r3, r1
    cb4c:	e1a02003 	mov	r2, r3
    cb50:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cb54:	e583200c 	str	r2, [r3, #12]
    session_forward_tail(session, len);
    return buf;
    cb58:	e51b3010 	ldr	r3, [fp, #-16]
}
    cb5c:	e1a00003 	mov	r0, r3
    cb60:	e24bd008 	sub	sp, fp, #8
    cb64:	e8bd8810 	pop	{r4, fp, pc}

0000cb68 <session_free_buf>:

bool session_free_buf(struct Session* session, int len)
{
    cb68:	e92d4800 	push	{fp, lr}
    cb6c:	e28db004 	add	fp, sp, #4
    cb70:	e24dd018 	sub	sp, sp, #24
    cb74:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    cb78:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    cb7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cb80:	e50b3008 	str	r3, [fp, #-8]
    return ((session->tail + session->capacity) - session->head) % session->capacity;
    cb84:	e51b3008 	ldr	r3, [fp, #-8]
    cb88:	e593200c 	ldr	r2, [r3, #12]
    cb8c:	e51b3008 	ldr	r3, [fp, #-8]
    cb90:	e5933004 	ldr	r3, [r3, #4]
    cb94:	e0822003 	add	r2, r2, r3
    cb98:	e51b3008 	ldr	r3, [fp, #-8]
    cb9c:	e5933008 	ldr	r3, [r3, #8]
    cba0:	e0422003 	sub	r2, r2, r3
    cba4:	e51b3008 	ldr	r3, [fp, #-8]
    cba8:	e5933004 	ldr	r3, [r3, #4]
    cbac:	e1a01003 	mov	r1, r3
    cbb0:	e1a00002 	mov	r0, r2
    cbb4:	eb0002b4 	bl	d68c <__aeabi_idivmod>
    cbb8:	e1a03001 	mov	r3, r1
    cbbc:	e1a02003 	mov	r2, r3
    if (len > session_used_size(session)) {
    cbc0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cbc4:	e1520003 	cmp	r2, r3
    cbc8:	aa000001 	bge	cbd4 <session_free_buf+0x6c>
        return false;
    cbcc:	e3a03000 	mov	r3, #0
    cbd0:	ea000031 	b	cc9c <session_free_buf+0x134>
    cbd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cbd8:	e50b300c 	str	r3, [fp, #-12]
    cbdc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    cbe0:	e50b3010 	str	r3, [fp, #-16]
    if (((session->head + len) % session->capacity) > session->tail) {
    cbe4:	e51b300c 	ldr	r3, [fp, #-12]
    cbe8:	e5932008 	ldr	r2, [r3, #8]
    cbec:	e51b3010 	ldr	r3, [fp, #-16]
    cbf0:	e0822003 	add	r2, r2, r3
    cbf4:	e51b300c 	ldr	r3, [fp, #-12]
    cbf8:	e5933004 	ldr	r3, [r3, #4]
    cbfc:	e1a01003 	mov	r1, r3
    cc00:	e1a00002 	mov	r0, r2
    cc04:	eb0002a0 	bl	d68c <__aeabi_idivmod>
    cc08:	e1a03001 	mov	r3, r1
    cc0c:	e1a02003 	mov	r2, r3
    cc10:	e51b300c 	ldr	r3, [fp, #-12]
    cc14:	e593300c 	ldr	r3, [r3, #12]
    cc18:	e1520003 	cmp	r2, r3
    cc1c:	da000004 	ble	cc34 <session_free_buf+0xcc>
        printf("forward head with too much size\n");
    cc20:	e3020ee8 	movw	r0, #12008	; 0x2ee8
    cc24:	e3400001 	movt	r0, #1
    cc28:	ebfffc54 	bl	bd80 <printf>
        return -1;
    cc2c:	e3e03000 	mvn	r3, #0
    cc30:	ea00000e 	b	cc70 <session_free_buf+0x108>
    session->head = (session->head + len) % session->capacity;
    cc34:	e51b300c 	ldr	r3, [fp, #-12]
    cc38:	e5932008 	ldr	r2, [r3, #8]
    cc3c:	e51b3010 	ldr	r3, [fp, #-16]
    cc40:	e0822003 	add	r2, r2, r3
    cc44:	e51b300c 	ldr	r3, [fp, #-12]
    cc48:	e5933004 	ldr	r3, [r3, #4]
    cc4c:	e1a01003 	mov	r1, r3
    cc50:	e1a00002 	mov	r0, r2
    cc54:	eb00028c 	bl	d68c <__aeabi_idivmod>
    cc58:	e1a03001 	mov	r3, r1
    cc5c:	e1a02003 	mov	r2, r3
    cc60:	e51b300c 	ldr	r3, [fp, #-12]
    cc64:	e5832008 	str	r2, [r3, #8]
    return session->head;
    cc68:	e51b300c 	ldr	r3, [fp, #-12]
    cc6c:	e5933008 	ldr	r3, [r3, #8]
    }
    assert(session_forward_head(session, len) != 1);
    cc70:	e3530001 	cmp	r3, #1
    cc74:	1a000007 	bne	cc98 <session_free_buf+0x130>
    cc78:	e3023f0c 	movw	r3, #12044	; 0x2f0c
    cc7c:	e3403001 	movt	r3, #1
    cc80:	e3022f40 	movw	r2, #12096	; 0x2f40
    cc84:	e3402001 	movt	r2, #1
    cc88:	e3a01040 	mov	r1, #64	; 0x40
    cc8c:	e3020f34 	movw	r0, #12084	; 0x2f34
    cc90:	e3400001 	movt	r0, #1
    cc94:	eb000285 	bl	d6b0 <__assert_func>
    return true;
    cc98:	e3a03001 	mov	r3, #1
}
    cc9c:	e1a00003 	mov	r0, r3
    cca0:	e24bd004 	sub	sp, fp, #4
    cca4:	e8bd8800 	pop	{fp, pc}

0000cca8 <Error>:
#include "libserial.h"
#include "fs.h"
#include "list.h"

static void Error(char* s)
{
    cca8:	e92d4800 	push	{fp, lr}
    ccac:	e28db004 	add	fp, sp, #4
    ccb0:	e24dd008 	sub	sp, sp, #8
    ccb4:	e50b0008 	str	r0, [fp, #-8]
    printf("Error: %s\n", s);
    ccb8:	e51b1008 	ldr	r1, [fp, #-8]
    ccbc:	e3020f54 	movw	r0, #12116	; 0x2f54
    ccc0:	e3400001 	movt	r0, #1
    ccc4:	ebfffc2d 	bl	bd80 <printf>
    for (;;)
    ccc8:	eafffffe 	b	ccc8 <Error+0x20>

0000cccc <BlockRead>:
        ;
}

// Locate the data block using block_num
uint8_t* BlockRead(int block_num)
{
    cccc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    ccd0:	e28db000 	add	fp, sp, #0
    ccd4:	e24dd014 	sub	sp, sp, #20
    ccd8:	e50b0010 	str	r0, [fp, #-16]
    uint8_t* data = (uint8_t*)MemFsRange.memfs_start + block_num * BLOCK_SIZE;
    ccdc:	e51b3010 	ldr	r3, [fp, #-16]
    cce0:	e1a03483 	lsl	r3, r3, #9
    cce4:	e1a02003 	mov	r2, r3
    cce8:	e30c3178 	movw	r3, #49528	; 0xc178
    ccec:	e3403003 	movt	r3, #3
    ccf0:	e5933000 	ldr	r3, [r3]
    ccf4:	e0823003 	add	r3, r2, r3
    ccf8:	e50b3008 	str	r3, [fp, #-8]
    return data;
    ccfc:	e51b3008 	ldr	r3, [fp, #-8]
}
    cd00:	e1a00003 	mov	r0, r3
    cd04:	e28bd000 	add	sp, fp, #0
    cd08:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    cd0c:	e12fff1e 	bx	lr

0000cd10 <BlockClear>:

// Zero a block.
static void BlockClear(int block_num)
{
    cd10:	e92d4800 	push	{fp, lr}
    cd14:	e28db004 	add	fp, sp, #4
    cd18:	e24dd010 	sub	sp, sp, #16
    cd1c:	e50b0010 	str	r0, [fp, #-16]
    uint8_t* data = BlockRead(block_num);
    cd20:	e51b0010 	ldr	r0, [fp, #-16]
    cd24:	ebffffe8 	bl	cccc <BlockRead>
    cd28:	e50b0008 	str	r0, [fp, #-8]
    memset(data, 0, BLOCK_SIZE);
    cd2c:	e3a02c02 	mov	r2, #512	; 0x200
    cd30:	e3a01000 	mov	r1, #0
    cd34:	e51b0008 	ldr	r0, [fp, #-8]
    cd38:	eb000347 	bl	da5c <memset>
}
    cd3c:	e320f000 	nop	{0}
    cd40:	e24bd004 	sub	sp, fp, #4
    cd44:	e8bd8800 	pop	{fp, pc}

0000cd48 <BlockAlloc>:

// Allocate a zeroed disk block.
uint32_t BlockAlloc()
{
    cd48:	e92d4800 	push	{fp, lr}
    cd4c:	e28db004 	add	fp, sp, #4
    cd50:	e24dd020 	sub	sp, sp, #32
    int bit_index, block_index, bit_mark;

    struct SuperBlock sb;

    ReadSuperBlock(&sb);
    cd54:	e24b3020 	sub	r3, fp, #32
    cd58:	e1a00003 	mov	r0, r3
    cd5c:	ebfff771 	bl	ab28 <ReadSuperBlock>

    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    cd60:	e3a03000 	mov	r3, #0
    cd64:	e50b3008 	str	r3, [fp, #-8]
    cd68:	ea000055 	b	cec4 <BlockAlloc+0x17c>

        uint8_t* data = BlockRead(BLOCK_BIT_INDEX(bit_index, sb.ninodes));
    cd6c:	e51b3008 	ldr	r3, [fp, #-8]
    cd70:	e2832eff 	add	r2, r3, #4080	; 0xff0
    cd74:	e282200f 	add	r2, r2, #15
    cd78:	e3530000 	cmp	r3, #0
    cd7c:	b1a03002 	movlt	r3, r2
    cd80:	a1a03003 	movge	r3, r3
    cd84:	e1a03643 	asr	r3, r3, #12
    cd88:	e1a02003 	mov	r2, r3
    cd8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    cd90:	e1a031a3 	lsr	r3, r3, #3
    cd94:	e0823003 	add	r3, r2, r3
    cd98:	e2833003 	add	r3, r3, #3
    cd9c:	e1a00003 	mov	r0, r3
    cda0:	ebffffc9 	bl	cccc <BlockRead>
    cda4:	e50b0010 	str	r0, [fp, #-16]

        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    cda8:	e3a03000 	mov	r3, #0
    cdac:	e50b300c 	str	r3, [fp, #-12]
    cdb0:	ea000036 	b	ce90 <BlockAlloc+0x148>
            bit_mark = 1 << (block_index % 8);
    cdb4:	e51b300c 	ldr	r3, [fp, #-12]
    cdb8:	e2732000 	rsbs	r2, r3, #0
    cdbc:	e2033007 	and	r3, r3, #7
    cdc0:	e2022007 	and	r2, r2, #7
    cdc4:	52623000 	rsbpl	r3, r2, #0
    cdc8:	e3a02001 	mov	r2, #1
    cdcc:	e1a03312 	lsl	r3, r2, r3
    cdd0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec

            if ((data[block_index / 8] & bit_mark) == 0) {
    cdd4:	e51b300c 	ldr	r3, [fp, #-12]
    cdd8:	e2832007 	add	r2, r3, #7
    cddc:	e3530000 	cmp	r3, #0
    cde0:	b1a03002 	movlt	r3, r2
    cde4:	a1a03003 	movge	r3, r3
    cde8:	e1a031c3 	asr	r3, r3, #3
    cdec:	e1a02003 	mov	r2, r3
    cdf0:	e51b3010 	ldr	r3, [fp, #-16]
    cdf4:	e0833002 	add	r3, r3, r2
    cdf8:	e5d33000 	ldrb	r3, [r3]
    cdfc:	e1a02003 	mov	r2, r3
    ce00:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    ce04:	e0033002 	and	r3, r3, r2
    ce08:	e3530000 	cmp	r3, #0
    ce0c:	1a00001c 	bne	ce84 <BlockAlloc+0x13c>
                data[block_index / 8] |= bit_mark;
    ce10:	e51b300c 	ldr	r3, [fp, #-12]
    ce14:	e2832007 	add	r2, r3, #7
    ce18:	e3530000 	cmp	r3, #0
    ce1c:	b1a03002 	movlt	r3, r2
    ce20:	a1a03003 	movge	r3, r3
    ce24:	e1a031c3 	asr	r3, r3, #3
    ce28:	e1a01003 	mov	r1, r3
    ce2c:	e1a02001 	mov	r2, r1
    ce30:	e51b3010 	ldr	r3, [fp, #-16]
    ce34:	e0833002 	add	r3, r3, r2
    ce38:	e51b2010 	ldr	r2, [fp, #-16]
    ce3c:	e0822001 	add	r2, r2, r1
    ce40:	e5d22000 	ldrb	r2, [r2]
    ce44:	e6af1072 	sxtb	r1, r2
    ce48:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
    ce4c:	e6af2072 	sxtb	r2, r2
    ce50:	e1812002 	orr	r2, r1, r2
    ce54:	e6af2072 	sxtb	r2, r2
    ce58:	e6ef2072 	uxtb	r2, r2
    ce5c:	e5c32000 	strb	r2, [r3]

                BlockClear(bit_index + block_index);
    ce60:	e51b2008 	ldr	r2, [fp, #-8]
    ce64:	e51b300c 	ldr	r3, [fp, #-12]
    ce68:	e0823003 	add	r3, r2, r3
    ce6c:	e1a00003 	mov	r0, r3
    ce70:	ebffffa6 	bl	cd10 <BlockClear>
                return bit_index + block_index;
    ce74:	e51b2008 	ldr	r2, [fp, #-8]
    ce78:	e51b300c 	ldr	r3, [fp, #-12]
    ce7c:	e0823003 	add	r3, r2, r3
    ce80:	ea000017 	b	cee4 <BlockAlloc+0x19c>
        for (block_index = 0; block_index < BITMAP_SIZE && bit_index + block_index < sb.size; block_index++) {
    ce84:	e51b300c 	ldr	r3, [fp, #-12]
    ce88:	e2833001 	add	r3, r3, #1
    ce8c:	e50b300c 	str	r3, [fp, #-12]
    ce90:	e51b300c 	ldr	r3, [fp, #-12]
    ce94:	e3530a01 	cmp	r3, #4096	; 0x1000
    ce98:	aa000006 	bge	ceb8 <BlockAlloc+0x170>
    ce9c:	e51b2008 	ldr	r2, [fp, #-8]
    cea0:	e51b300c 	ldr	r3, [fp, #-12]
    cea4:	e0823003 	add	r3, r2, r3
    cea8:	e1a02003 	mov	r2, r3
    ceac:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    ceb0:	e1520003 	cmp	r2, r3
    ceb4:	3affffbe 	bcc	cdb4 <BlockAlloc+0x6c>
    for (bit_index = 0; bit_index < sb.size; bit_index += BITMAP_SIZE) {
    ceb8:	e51b3008 	ldr	r3, [fp, #-8]
    cebc:	e2833a01 	add	r3, r3, #4096	; 0x1000
    cec0:	e50b3008 	str	r3, [fp, #-8]
    cec4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
    cec8:	e51b3008 	ldr	r3, [fp, #-8]
    cecc:	e1520003 	cmp	r2, r3
    ced0:	8affffa5 	bhi	cd6c <BlockAlloc+0x24>
            }
        }
    }

    Error("BlockAlloc: out of blocks");
    ced4:	e3020f60 	movw	r0, #12128	; 0x2f60
    ced8:	e3400001 	movt	r0, #1
    cedc:	ebffff71 	bl	cca8 <Error>
    return 0;
    cee0:	e3a03000 	mov	r3, #0
}
    cee4:	e1a00003 	mov	r0, r3
    cee8:	e24bd004 	sub	sp, fp, #4
    ceec:	e8bd8800 	pop	{fp, pc}

0000cef0 <BlockFree>:

// Free a disk block.
void BlockFree(int block_num)
{
    cef0:	e92d4800 	push	{fp, lr}
    cef4:	e28db004 	add	fp, sp, #4
    cef8:	e24dd020 	sub	sp, sp, #32
    cefc:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    struct SuperBlock sb;
    int block_index, bit_mark;

    ReadSuperBlock(&sb);
    cf00:	e24b301c 	sub	r3, fp, #28
    cf04:	e1a00003 	mov	r0, r3
    cf08:	ebfff706 	bl	ab28 <ReadSuperBlock>

    uint8_t* data = BlockRead(BLOCK_BIT_INDEX(block_num, sb.ninodes));
    cf0c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    cf10:	e2832eff 	add	r2, r3, #4080	; 0xff0
    cf14:	e282200f 	add	r2, r2, #15
    cf18:	e3530000 	cmp	r3, #0
    cf1c:	b1a03002 	movlt	r3, r2
    cf20:	a1a03003 	movge	r3, r3
    cf24:	e1a03643 	asr	r3, r3, #12
    cf28:	e1a02003 	mov	r2, r3
    cf2c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
    cf30:	e1a031a3 	lsr	r3, r3, #3
    cf34:	e0823003 	add	r3, r2, r3
    cf38:	e2833003 	add	r3, r3, #3
    cf3c:	e1a00003 	mov	r0, r3
    cf40:	ebffff61 	bl	cccc <BlockRead>
    cf44:	e50b0008 	str	r0, [fp, #-8]

    block_index = block_num % BITMAP_SIZE;
    cf48:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    cf4c:	e2732000 	rsbs	r2, r3, #0
    cf50:	e7eb3053 	ubfx	r3, r3, #0, #12
    cf54:	e7eb2052 	ubfx	r2, r2, #0, #12
    cf58:	52623000 	rsbpl	r3, r2, #0
    cf5c:	e50b300c 	str	r3, [fp, #-12]
    bit_mark = 1 << (block_index % 8);
    cf60:	e51b300c 	ldr	r3, [fp, #-12]
    cf64:	e2732000 	rsbs	r2, r3, #0
    cf68:	e2033007 	and	r3, r3, #7
    cf6c:	e2022007 	and	r2, r2, #7
    cf70:	52623000 	rsbpl	r3, r2, #0
    cf74:	e3a02001 	mov	r2, #1
    cf78:	e1a03312 	lsl	r3, r2, r3
    cf7c:	e50b3010 	str	r3, [fp, #-16]

    if ((data[block_index / 8] & bit_mark) == 0) {
    cf80:	e51b300c 	ldr	r3, [fp, #-12]
    cf84:	e2832007 	add	r2, r3, #7
    cf88:	e3530000 	cmp	r3, #0
    cf8c:	b1a03002 	movlt	r3, r2
    cf90:	a1a03003 	movge	r3, r3
    cf94:	e1a031c3 	asr	r3, r3, #3
    cf98:	e1a02003 	mov	r2, r3
    cf9c:	e51b3008 	ldr	r3, [fp, #-8]
    cfa0:	e0833002 	add	r3, r3, r2
    cfa4:	e5d33000 	ldrb	r3, [r3]
    cfa8:	e1a02003 	mov	r2, r3
    cfac:	e51b3010 	ldr	r3, [fp, #-16]
    cfb0:	e0033002 	and	r3, r3, r2
    cfb4:	e3530000 	cmp	r3, #0
    cfb8:	1a000002 	bne	cfc8 <BlockFree+0xd8>
        Error("freeing free block");
    cfbc:	e3020f7c 	movw	r0, #12156	; 0x2f7c
    cfc0:	e3400001 	movt	r0, #1
    cfc4:	ebffff37 	bl	cca8 <Error>
    }

    data[block_index / 8] &= ~bit_mark;
    cfc8:	e51b300c 	ldr	r3, [fp, #-12]
    cfcc:	e2832007 	add	r2, r3, #7
    cfd0:	e3530000 	cmp	r3, #0
    cfd4:	b1a03002 	movlt	r3, r2
    cfd8:	a1a03003 	movge	r3, r3
    cfdc:	e1a031c3 	asr	r3, r3, #3
    cfe0:	e1a01003 	mov	r1, r3
    cfe4:	e1a02001 	mov	r2, r1
    cfe8:	e51b3008 	ldr	r3, [fp, #-8]
    cfec:	e0833002 	add	r3, r3, r2
    cff0:	e51b2008 	ldr	r2, [fp, #-8]
    cff4:	e0822001 	add	r2, r2, r1
    cff8:	e5d22000 	ldrb	r2, [r2]
    cffc:	e6af1072 	sxtb	r1, r2
    d000:	e51b2010 	ldr	r2, [fp, #-16]
    d004:	e6af2072 	sxtb	r2, r2
    d008:	e1e02002 	mvn	r2, r2
    d00c:	e6af2072 	sxtb	r2, r2
    d010:	e0022001 	and	r2, r2, r1
    d014:	e6af2072 	sxtb	r2, r2
    d018:	e6ef2072 	uxtb	r2, r2
    d01c:	e5c32000 	strb	r2, [r3]
}
    d020:	e320f000 	nop	{0}
    d024:	e24bd004 	sub	sp, fp, #4
    d028:	e8bd8800 	pop	{fp, pc}

0000d02c <syscall>:
 */
#include "usyscall.h"

static int
syscall(int sys_num, intptr_t a1, intptr_t a2, intptr_t a3, intptr_t a4)
{
    d02c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
    d030:	e28db014 	add	fp, sp, #20
    d034:	e24dd018 	sub	sp, sp, #24
    d038:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
    d03c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
    d040:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
    d044:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
    int ret = -1;
    d048:	e3e03000 	mvn	r3, #0
    d04c:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8

    __asm__ volatile(
    d050:	e51bc020 	ldr	ip, [fp, #-32]	; 0xffffffe0
    d054:	e51be024 	ldr	lr, [fp, #-36]	; 0xffffffdc
    d058:	e51b5028 	ldr	r5, [fp, #-40]	; 0xffffffd8
    d05c:	e51b602c 	ldr	r6, [fp, #-44]	; 0xffffffd4
    d060:	e59b7004 	ldr	r7, [fp, #4]
    d064:	e1a0000c 	mov	r0, ip
    d068:	e1a0100e 	mov	r1, lr
    d06c:	e1a02005 	mov	r2, r5
    d070:	e1a03006 	mov	r3, r6
    d074:	e1a04007 	mov	r4, r7
    d078:	ef000000 	svc	0x00000000
    d07c:	f57ff04f 	dsb	sy
    d080:	f57ff06f 	isb	sy
    d084:	e1a0c000 	mov	ip, r0
    d088:	e50bc018 	str	ip, [fp, #-24]	; 0xffffffe8
        mov %0, r0"
        : "=r"(ret)
        : "r"(sys_num), "r"(a1), "r"(a2), "r"(a3), "r"(a4)
        : "memory", "r0", "r1", "r2", "r3", "r4");

    return ret;
    d08c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
    d090:	e1a00003 	mov	r0, r3
    d094:	e24bd014 	sub	sp, fp, #20
    d098:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

0000d09c <spawn>:

int spawn(struct Session* session, int fd, ipc_read_fn ipc_read, char* name, char** argv)
{
    d09c:	e92d4800 	push	{fp, lr}
    d0a0:	e28db004 	add	fp, sp, #4
    d0a4:	e24dd028 	sub	sp, sp, #40	; 0x28
    d0a8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
    d0ac:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
    d0b0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
    d0b4:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
    struct KernReadTool read_tool = {
    d0b8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
    d0bc:	e50b3010 	str	r3, [fp, #-16]
    d0c0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
    d0c4:	e50b300c 	str	r3, [fp, #-12]
    d0c8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
    d0cc:	e50b3008 	str	r3, [fp, #-8]
        .session = session,
        .fd = fd,
        .ipc_read = ipc_read,
    };
    return syscall(SYSCALL_SPAWN, (intptr_t)&read_tool, (intptr_t)name, (intptr_t)argv, 0);
    d0d0:	e24b1010 	sub	r1, fp, #16
    d0d4:	e51b2024 	ldr	r2, [fp, #-36]	; 0xffffffdc
    d0d8:	e59b0004 	ldr	r0, [fp, #4]
    d0dc:	e3a03000 	mov	r3, #0
    d0e0:	e58d3000 	str	r3, [sp]
    d0e4:	e1a03000 	mov	r3, r0
    d0e8:	e3a00001 	mov	r0, #1
    d0ec:	ebffffce 	bl	d02c <syscall>
    d0f0:	e1a03000 	mov	r3, r0
}
    d0f4:	e1a00003 	mov	r0, r3
    d0f8:	e24bd004 	sub	sp, fp, #4
    d0fc:	e8bd8800 	pop	{fp, pc}

0000d100 <exit>:

int exit()
{
    d100:	e92d4800 	push	{fp, lr}
    d104:	e28db004 	add	fp, sp, #4
    d108:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_EXIT, 0, 0, 0, 0);
    d10c:	e3a03000 	mov	r3, #0
    d110:	e58d3000 	str	r3, [sp]
    d114:	e3a03000 	mov	r3, #0
    d118:	e3a02000 	mov	r2, #0
    d11c:	e3a01000 	mov	r1, #0
    d120:	e3a00002 	mov	r0, #2
    d124:	ebffffc0 	bl	d02c <syscall>
    d128:	e1a03000 	mov	r3, r0
}
    d12c:	e1a00003 	mov	r0, r3
    d130:	e24bd004 	sub	sp, fp, #4
    d134:	e8bd8800 	pop	{fp, pc}

0000d138 <yield>:

int yield()
{
    d138:	e92d4800 	push	{fp, lr}
    d13c:	e28db004 	add	fp, sp, #4
    d140:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_YIELD, 0, 0, 0, 0);
    d144:	e3a03000 	mov	r3, #0
    d148:	e58d3000 	str	r3, [sp]
    d14c:	e3a03000 	mov	r3, #0
    d150:	e3a02000 	mov	r2, #0
    d154:	e3a01000 	mov	r1, #0
    d158:	e3a00003 	mov	r0, #3
    d15c:	ebffffb2 	bl	d02c <syscall>
    d160:	e1a03000 	mov	r3, r0
}
    d164:	e1a00003 	mov	r0, r3
    d168:	e24bd004 	sub	sp, fp, #4
    d16c:	e8bd8800 	pop	{fp, pc}

0000d170 <register_server>:

int register_server(char* name)
{
    d170:	e92d4800 	push	{fp, lr}
    d174:	e28db004 	add	fp, sp, #4
    d178:	e24dd010 	sub	sp, sp, #16
    d17c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SERVER, (intptr_t)name, 0, 0, 0);
    d180:	e51b1008 	ldr	r1, [fp, #-8]
    d184:	e3a03000 	mov	r3, #0
    d188:	e58d3000 	str	r3, [sp]
    d18c:	e3a03000 	mov	r3, #0
    d190:	e3a02000 	mov	r2, #0
    d194:	e3a00005 	mov	r0, #5
    d198:	ebffffa3 	bl	d02c <syscall>
    d19c:	e1a03000 	mov	r3, r0
}
    d1a0:	e1a00003 	mov	r0, r3
    d1a4:	e24bd004 	sub	sp, fp, #4
    d1a8:	e8bd8800 	pop	{fp, pc}

0000d1ac <session>:

int session(char* path, int capacity, struct Session* user_session)
{
    d1ac:	e92d4800 	push	{fp, lr}
    d1b0:	e28db004 	add	fp, sp, #4
    d1b4:	e24dd018 	sub	sp, sp, #24
    d1b8:	e50b0008 	str	r0, [fp, #-8]
    d1bc:	e50b100c 	str	r1, [fp, #-12]
    d1c0:	e50b2010 	str	r2, [fp, #-16]
    return syscall(SYSCALL_SESSION, (intptr_t)path, (intptr_t)capacity, (intptr_t)user_session, 0);
    d1c4:	e51b1008 	ldr	r1, [fp, #-8]
    d1c8:	e51b2010 	ldr	r2, [fp, #-16]
    d1cc:	e3a03000 	mov	r3, #0
    d1d0:	e58d3000 	str	r3, [sp]
    d1d4:	e1a03002 	mov	r3, r2
    d1d8:	e51b200c 	ldr	r2, [fp, #-12]
    d1dc:	e3a00006 	mov	r0, #6
    d1e0:	ebffff91 	bl	d02c <syscall>
    d1e4:	e1a03000 	mov	r3, r0
}
    d1e8:	e1a00003 	mov	r0, r3
    d1ec:	e24bd004 	sub	sp, fp, #4
    d1f0:	e8bd8800 	pop	{fp, pc}

0000d1f4 <poll_session>:

int poll_session(struct Session* userland_session_arr, int arr_capacity)
{
    d1f4:	e92d4800 	push	{fp, lr}
    d1f8:	e28db004 	add	fp, sp, #4
    d1fc:	e24dd010 	sub	sp, sp, #16
    d200:	e50b0008 	str	r0, [fp, #-8]
    d204:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_POLL_SESSION, (intptr_t)userland_session_arr, (intptr_t)arr_capacity, 0, 0);
    d208:	e51b1008 	ldr	r1, [fp, #-8]
    d20c:	e3a03000 	mov	r3, #0
    d210:	e58d3000 	str	r3, [sp]
    d214:	e3a03000 	mov	r3, #0
    d218:	e51b200c 	ldr	r2, [fp, #-12]
    d21c:	e3a00007 	mov	r0, #7
    d220:	ebffff81 	bl	d02c <syscall>
    d224:	e1a03000 	mov	r3, r0
}
    d228:	e1a00003 	mov	r0, r3
    d22c:	e24bd004 	sub	sp, fp, #4
    d230:	e8bd8800 	pop	{fp, pc}

0000d234 <close_session>:

int close_session(struct Session* session)
{
    d234:	e92d4800 	push	{fp, lr}
    d238:	e28db004 	add	fp, sp, #4
    d23c:	e24dd010 	sub	sp, sp, #16
    d240:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_CLOSE_SESSION, (intptr_t)session, 0, 0, 0);
    d244:	e51b1008 	ldr	r1, [fp, #-8]
    d248:	e3a03000 	mov	r3, #0
    d24c:	e58d3000 	str	r3, [sp]
    d250:	e3a03000 	mov	r3, #0
    d254:	e3a02000 	mov	r2, #0
    d258:	e3a00008 	mov	r0, #8
    d25c:	ebffff72 	bl	d02c <syscall>
    d260:	e1a03000 	mov	r3, r0
}
    d264:	e1a00003 	mov	r0, r3
    d268:	e24bd004 	sub	sp, fp, #4
    d26c:	e8bd8800 	pop	{fp, pc}

0000d270 <get_memblock_info>:

int get_memblock_info(sys_state_info* info)
{
    d270:	e92d4800 	push	{fp, lr}
    d274:	e28db004 	add	fp, sp, #4
    d278:	e24dd010 	sub	sp, sp, #16
    d27c:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_MEMBLOCK_INFO, (intptr_t)info, 0, 0);
    d280:	e51b2008 	ldr	r2, [fp, #-8]
    d284:	e3a03000 	mov	r3, #0
    d288:	e58d3000 	str	r3, [sp]
    d28c:	e3a03000 	mov	r3, #0
    d290:	e3a01003 	mov	r1, #3
    d294:	e3a0000a 	mov	r0, #10
    d298:	ebffff63 	bl	d02c <syscall>
    d29c:	e1a03000 	mov	r3, r0
}
    d2a0:	e1a00003 	mov	r0, r3
    d2a4:	e24bd004 	sub	sp, fp, #4
    d2a8:	e8bd8800 	pop	{fp, pc}

0000d2ac <set_priority>:

int set_priority(sys_state_info* info)
{
    d2ac:	e92d4800 	push	{fp, lr}
    d2b0:	e28db004 	add	fp, sp, #4
    d2b4:	e24dd010 	sub	sp, sp, #16
    d2b8:	e50b0008 	str	r0, [fp, #-8]
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SET_TASK_PRIORITY, (intptr_t)info, 0, 0);
    d2bc:	e51b2008 	ldr	r2, [fp, #-8]
    d2c0:	e3a03000 	mov	r3, #0
    d2c4:	e58d3000 	str	r3, [sp]
    d2c8:	e3a03000 	mov	r3, #0
    d2cc:	e3a01001 	mov	r1, #1
    d2d0:	e3a0000a 	mov	r0, #10
    d2d4:	ebffff54 	bl	d02c <syscall>
    d2d8:	e1a03000 	mov	r3, r0
}
    d2dc:	e1a00003 	mov	r0, r3
    d2e0:	e24bd004 	sub	sp, fp, #4
    d2e4:	e8bd8800 	pop	{fp, pc}

0000d2e8 <task_heap_base>:

int task_heap_base()
{
    d2e8:	e92d4800 	push	{fp, lr}
    d2ec:	e28db004 	add	fp, sp, #4
    d2f0:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_GET_HEAP_BASE, 0, 0, 0);
    d2f4:	e3a03000 	mov	r3, #0
    d2f8:	e58d3000 	str	r3, [sp]
    d2fc:	e3a03000 	mov	r3, #0
    d300:	e3a02000 	mov	r2, #0
    d304:	e3a01002 	mov	r1, #2
    d308:	e3a0000a 	mov	r0, #10
    d30c:	ebffff46 	bl	d02c <syscall>
    d310:	e1a03000 	mov	r3, r0
}
    d314:	e1a00003 	mov	r0, r3
    d318:	e24bd004 	sub	sp, fp, #4
    d31c:	e8bd8800 	pop	{fp, pc}

0000d320 <show_task>:

int show_task()
{
    d320:	e92d4800 	push	{fp, lr}
    d324:	e28db004 	add	fp, sp, #4
    d328:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_TASKS, 0, 0, 0);
    d32c:	e3a03000 	mov	r3, #0
    d330:	e58d3000 	str	r3, [sp]
    d334:	e3a03000 	mov	r3, #0
    d338:	e3a02000 	mov	r2, #0
    d33c:	e3a01004 	mov	r1, #4
    d340:	e3a0000a 	mov	r0, #10
    d344:	ebffff38 	bl	d02c <syscall>
    d348:	e1a03000 	mov	r3, r0
}
    d34c:	e1a00003 	mov	r0, r3
    d350:	e24bd004 	sub	sp, fp, #4
    d354:	e8bd8800 	pop	{fp, pc}

0000d358 <show_mem>:

int show_mem()
{
    d358:	e92d4800 	push	{fp, lr}
    d35c:	e28db004 	add	fp, sp, #4
    d360:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_MEM_INFO, 0, 0, 0);
    d364:	e3a03000 	mov	r3, #0
    d368:	e58d3000 	str	r3, [sp]
    d36c:	e3a03000 	mov	r3, #0
    d370:	e3a02000 	mov	r2, #0
    d374:	e3a01005 	mov	r1, #5
    d378:	e3a0000a 	mov	r0, #10
    d37c:	ebffff2a 	bl	d02c <syscall>
    d380:	e1a03000 	mov	r3, r0
}
    d384:	e1a00003 	mov	r0, r3
    d388:	e24bd004 	sub	sp, fp, #4
    d38c:	e8bd8800 	pop	{fp, pc}

0000d390 <show_cpu>:

int show_cpu()
{
    d390:	e92d4800 	push	{fp, lr}
    d394:	e28db004 	add	fp, sp, #4
    d398:	e24dd008 	sub	sp, sp, #8
    return syscall(SYSCALL_SYS_STATE, SYS_STATE_SHOW_CPU_INFO, 0, 0, 0);
    d39c:	e3a03000 	mov	r3, #0
    d3a0:	e58d3000 	str	r3, [sp]
    d3a4:	e3a03000 	mov	r3, #0
    d3a8:	e3a02000 	mov	r2, #0
    d3ac:	e3a01006 	mov	r1, #6
    d3b0:	e3a0000a 	mov	r0, #10
    d3b4:	ebffff1c 	bl	d02c <syscall>
    d3b8:	e1a03000 	mov	r3, r0
}
    d3bc:	e1a00003 	mov	r0, r3
    d3c0:	e24bd004 	sub	sp, fp, #4
    d3c4:	e8bd8800 	pop	{fp, pc}

0000d3c8 <mmap>:

int mmap(uintptr_t vaddr, uintptr_t paddr, int len, bool is_dev)
{
    d3c8:	e92d4800 	push	{fp, lr}
    d3cc:	e28db004 	add	fp, sp, #4
    d3d0:	e24dd018 	sub	sp, sp, #24
    d3d4:	e50b0008 	str	r0, [fp, #-8]
    d3d8:	e50b100c 	str	r1, [fp, #-12]
    d3dc:	e50b2010 	str	r2, [fp, #-16]
    d3e0:	e54b3011 	strb	r3, [fp, #-17]	; 0xffffffef
    return syscall(SYSCALL_MMAP, vaddr, paddr, (intptr_t)len, (intptr_t)is_dev);
    d3e4:	e51b1008 	ldr	r1, [fp, #-8]
    d3e8:	e51b200c 	ldr	r2, [fp, #-12]
    d3ec:	e55b3011 	ldrb	r3, [fp, #-17]	; 0xffffffef
    d3f0:	e58d3000 	str	r3, [sp]
    d3f4:	e51b3010 	ldr	r3, [fp, #-16]
    d3f8:	e3a00004 	mov	r0, #4
    d3fc:	ebffff0a 	bl	d02c <syscall>
    d400:	e1a03000 	mov	r3, r0
}
    d404:	e1a00003 	mov	r0, r3
    d408:	e24bd004 	sub	sp, fp, #4
    d40c:	e8bd8800 	pop	{fp, pc}

0000d410 <register_irq>:

int register_irq(int irq, int opcode)
{
    d410:	e92d4800 	push	{fp, lr}
    d414:	e28db004 	add	fp, sp, #4
    d418:	e24dd010 	sub	sp, sp, #16
    d41c:	e50b0008 	str	r0, [fp, #-8]
    d420:	e50b100c 	str	r1, [fp, #-12]
    return syscall(SYSCALL_REGISTER_IRQ, (intptr_t)irq, (intptr_t)opcode, 0, 0);
    d424:	e3a03000 	mov	r3, #0
    d428:	e58d3000 	str	r3, [sp]
    d42c:	e3a03000 	mov	r3, #0
    d430:	e51b200c 	ldr	r2, [fp, #-12]
    d434:	e51b1008 	ldr	r1, [fp, #-8]
    d438:	e3a0000b 	mov	r0, #11
    d43c:	ebfffefa 	bl	d02c <syscall>
    d440:	e1a03000 	mov	r3, r0
    d444:	e1a00003 	mov	r0, r3
    d448:	e24bd004 	sub	sp, fp, #4
    d44c:	e8bd8800 	pop	{fp, pc}

0000d450 <__udivsi3>:
    d450:	e2512001 	subs	r2, r1, #1
    d454:	012fff1e 	bxeq	lr
    d458:	3a000036 	bcc	d538 <__udivsi3+0xe8>
    d45c:	e1500001 	cmp	r0, r1
    d460:	9a000022 	bls	d4f0 <__udivsi3+0xa0>
    d464:	e1110002 	tst	r1, r2
    d468:	0a000023 	beq	d4fc <__udivsi3+0xac>
    d46c:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    d470:	01a01181 	lsleq	r1, r1, #3
    d474:	03a03008 	moveq	r3, #8
    d478:	13a03001 	movne	r3, #1
    d47c:	e3510201 	cmp	r1, #268435456	; 0x10000000
    d480:	31510000 	cmpcc	r1, r0
    d484:	31a01201 	lslcc	r1, r1, #4
    d488:	31a03203 	lslcc	r3, r3, #4
    d48c:	3afffffa 	bcc	d47c <__udivsi3+0x2c>
    d490:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    d494:	31510000 	cmpcc	r1, r0
    d498:	31a01081 	lslcc	r1, r1, #1
    d49c:	31a03083 	lslcc	r3, r3, #1
    d4a0:	3afffffa 	bcc	d490 <__udivsi3+0x40>
    d4a4:	e3a02000 	mov	r2, #0
    d4a8:	e1500001 	cmp	r0, r1
    d4ac:	20400001 	subcs	r0, r0, r1
    d4b0:	21822003 	orrcs	r2, r2, r3
    d4b4:	e15000a1 	cmp	r0, r1, lsr #1
    d4b8:	204000a1 	subcs	r0, r0, r1, lsr #1
    d4bc:	218220a3 	orrcs	r2, r2, r3, lsr #1
    d4c0:	e1500121 	cmp	r0, r1, lsr #2
    d4c4:	20400121 	subcs	r0, r0, r1, lsr #2
    d4c8:	21822123 	orrcs	r2, r2, r3, lsr #2
    d4cc:	e15001a1 	cmp	r0, r1, lsr #3
    d4d0:	204001a1 	subcs	r0, r0, r1, lsr #3
    d4d4:	218221a3 	orrcs	r2, r2, r3, lsr #3
    d4d8:	e3500000 	cmp	r0, #0
    d4dc:	11b03223 	lsrsne	r3, r3, #4
    d4e0:	11a01221 	lsrne	r1, r1, #4
    d4e4:	1affffef 	bne	d4a8 <__udivsi3+0x58>
    d4e8:	e1a00002 	mov	r0, r2
    d4ec:	e12fff1e 	bx	lr
    d4f0:	03a00001 	moveq	r0, #1
    d4f4:	13a00000 	movne	r0, #0
    d4f8:	e12fff1e 	bx	lr
    d4fc:	e3510801 	cmp	r1, #65536	; 0x10000
    d500:	21a01821 	lsrcs	r1, r1, #16
    d504:	23a02010 	movcs	r2, #16
    d508:	33a02000 	movcc	r2, #0
    d50c:	e3510c01 	cmp	r1, #256	; 0x100
    d510:	21a01421 	lsrcs	r1, r1, #8
    d514:	22822008 	addcs	r2, r2, #8
    d518:	e3510010 	cmp	r1, #16
    d51c:	21a01221 	lsrcs	r1, r1, #4
    d520:	22822004 	addcs	r2, r2, #4
    d524:	e3510004 	cmp	r1, #4
    d528:	82822003 	addhi	r2, r2, #3
    d52c:	908220a1 	addls	r2, r2, r1, lsr #1
    d530:	e1a00230 	lsr	r0, r0, r2
    d534:	e12fff1e 	bx	lr
    d538:	e3500000 	cmp	r0, #0
    d53c:	13e00000 	mvnne	r0, #0
    d540:	ea000059 	b	d6ac <__aeabi_idiv0>

0000d544 <__aeabi_uidivmod>:
    d544:	e3510000 	cmp	r1, #0
    d548:	0afffffa 	beq	d538 <__udivsi3+0xe8>
    d54c:	e92d4003 	push	{r0, r1, lr}
    d550:	ebffffbe 	bl	d450 <__udivsi3>
    d554:	e8bd4006 	pop	{r1, r2, lr}
    d558:	e0030092 	mul	r3, r2, r0
    d55c:	e0411003 	sub	r1, r1, r3
    d560:	e12fff1e 	bx	lr

0000d564 <__divsi3>:
    d564:	e3510000 	cmp	r1, #0
    d568:	0a000043 	beq	d67c <.divsi3_skip_div0_test+0x110>

0000d56c <.divsi3_skip_div0_test>:
    d56c:	e020c001 	eor	ip, r0, r1
    d570:	42611000 	rsbmi	r1, r1, #0
    d574:	e2512001 	subs	r2, r1, #1
    d578:	0a000027 	beq	d61c <.divsi3_skip_div0_test+0xb0>
    d57c:	e1b03000 	movs	r3, r0
    d580:	42603000 	rsbmi	r3, r0, #0
    d584:	e1530001 	cmp	r3, r1
    d588:	9a000026 	bls	d628 <.divsi3_skip_div0_test+0xbc>
    d58c:	e1110002 	tst	r1, r2
    d590:	0a000028 	beq	d638 <.divsi3_skip_div0_test+0xcc>
    d594:	e311020e 	tst	r1, #-536870912	; 0xe0000000
    d598:	01a01181 	lsleq	r1, r1, #3
    d59c:	03a02008 	moveq	r2, #8
    d5a0:	13a02001 	movne	r2, #1
    d5a4:	e3510201 	cmp	r1, #268435456	; 0x10000000
    d5a8:	31510003 	cmpcc	r1, r3
    d5ac:	31a01201 	lslcc	r1, r1, #4
    d5b0:	31a02202 	lslcc	r2, r2, #4
    d5b4:	3afffffa 	bcc	d5a4 <.divsi3_skip_div0_test+0x38>
    d5b8:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
    d5bc:	31510003 	cmpcc	r1, r3
    d5c0:	31a01081 	lslcc	r1, r1, #1
    d5c4:	31a02082 	lslcc	r2, r2, #1
    d5c8:	3afffffa 	bcc	d5b8 <.divsi3_skip_div0_test+0x4c>
    d5cc:	e3a00000 	mov	r0, #0
    d5d0:	e1530001 	cmp	r3, r1
    d5d4:	20433001 	subcs	r3, r3, r1
    d5d8:	21800002 	orrcs	r0, r0, r2
    d5dc:	e15300a1 	cmp	r3, r1, lsr #1
    d5e0:	204330a1 	subcs	r3, r3, r1, lsr #1
    d5e4:	218000a2 	orrcs	r0, r0, r2, lsr #1
    d5e8:	e1530121 	cmp	r3, r1, lsr #2
    d5ec:	20433121 	subcs	r3, r3, r1, lsr #2
    d5f0:	21800122 	orrcs	r0, r0, r2, lsr #2
    d5f4:	e15301a1 	cmp	r3, r1, lsr #3
    d5f8:	204331a1 	subcs	r3, r3, r1, lsr #3
    d5fc:	218001a2 	orrcs	r0, r0, r2, lsr #3
    d600:	e3530000 	cmp	r3, #0
    d604:	11b02222 	lsrsne	r2, r2, #4
    d608:	11a01221 	lsrne	r1, r1, #4
    d60c:	1affffef 	bne	d5d0 <.divsi3_skip_div0_test+0x64>
    d610:	e35c0000 	cmp	ip, #0
    d614:	42600000 	rsbmi	r0, r0, #0
    d618:	e12fff1e 	bx	lr
    d61c:	e13c0000 	teq	ip, r0
    d620:	42600000 	rsbmi	r0, r0, #0
    d624:	e12fff1e 	bx	lr
    d628:	33a00000 	movcc	r0, #0
    d62c:	01a00fcc 	asreq	r0, ip, #31
    d630:	03800001 	orreq	r0, r0, #1
    d634:	e12fff1e 	bx	lr
    d638:	e3510801 	cmp	r1, #65536	; 0x10000
    d63c:	21a01821 	lsrcs	r1, r1, #16
    d640:	23a02010 	movcs	r2, #16
    d644:	33a02000 	movcc	r2, #0
    d648:	e3510c01 	cmp	r1, #256	; 0x100
    d64c:	21a01421 	lsrcs	r1, r1, #8
    d650:	22822008 	addcs	r2, r2, #8
    d654:	e3510010 	cmp	r1, #16
    d658:	21a01221 	lsrcs	r1, r1, #4
    d65c:	22822004 	addcs	r2, r2, #4
    d660:	e3510004 	cmp	r1, #4
    d664:	82822003 	addhi	r2, r2, #3
    d668:	908220a1 	addls	r2, r2, r1, lsr #1
    d66c:	e35c0000 	cmp	ip, #0
    d670:	e1a00233 	lsr	r0, r3, r2
    d674:	42600000 	rsbmi	r0, r0, #0
    d678:	e12fff1e 	bx	lr
    d67c:	e3500000 	cmp	r0, #0
    d680:	c3e00102 	mvngt	r0, #-2147483648	; 0x80000000
    d684:	b3a00102 	movlt	r0, #-2147483648	; 0x80000000
    d688:	ea000007 	b	d6ac <__aeabi_idiv0>

0000d68c <__aeabi_idivmod>:
    d68c:	e3510000 	cmp	r1, #0
    d690:	0afffff9 	beq	d67c <.divsi3_skip_div0_test+0x110>
    d694:	e92d4003 	push	{r0, r1, lr}
    d698:	ebffffb3 	bl	d56c <.divsi3_skip_div0_test>
    d69c:	e8bd4006 	pop	{r1, r2, lr}
    d6a0:	e0030092 	mul	r3, r2, r0
    d6a4:	e0411003 	sub	r1, r1, r3
    d6a8:	e12fff1e 	bx	lr

0000d6ac <__aeabi_idiv0>:
    d6ac:	e12fff1e 	bx	lr

0000d6b0 <__assert_func>:
    d6b0:	e59fc038 	ldr	ip, [pc, #56]	; d6f0 <__assert_func+0x40>
    d6b4:	e59c4000 	ldr	r4, [ip]
    d6b8:	e252c000 	subs	ip, r2, #0
    d6bc:	e1a02003 	mov	r2, r3
    d6c0:	059f302c 	ldreq	r3, [pc, #44]	; d6f4 <__assert_func+0x44>
    d6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    d6c8:	01a0c003 	moveq	ip, r3
    d6cc:	e1a0e000 	mov	lr, r0
    d6d0:	159f3020 	ldrne	r3, [pc, #32]	; d6f8 <__assert_func+0x48>
    d6d4:	e24dd014 	sub	sp, sp, #20
    d6d8:	e594000c 	ldr	r0, [r4, #12]
    d6dc:	e88d100a 	stm	sp, {r1, r3, ip}
    d6e0:	e1a0300e 	mov	r3, lr
    d6e4:	e59f1010 	ldr	r1, [pc, #16]	; d6fc <__assert_func+0x4c>
    d6e8:	eb000014 	bl	d740 <fiprintf>
    d6ec:	eb0007c2 	bl	f5fc <abort>
    d6f0:	0001356c 	.word	0x0001356c
    d6f4:	00012f9c 	.word	0x00012f9c
    d6f8:	00012f90 	.word	0x00012f90
    d6fc:	00012fa0 	.word	0x00012fa0

0000d700 <__assert>:
    d700:	e1a03002 	mov	r3, r2
    d704:	e92d4010 	push	{r4, lr}
    d708:	e3a02000 	mov	r2, #0
    d70c:	ebffffe7 	bl	d6b0 <__assert_func>

0000d710 <_fiprintf_r>:
    d710:	e92d000c 	push	{r2, r3}
    d714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    d718:	e24dd00c 	sub	sp, sp, #12
    d71c:	e28dc014 	add	ip, sp, #20
    d720:	e1a0300c 	mov	r3, ip
    d724:	e59d2010 	ldr	r2, [sp, #16]
    d728:	e58dc004 	str	ip, [sp, #4]
    d72c:	eb00025d 	bl	e0a8 <_vfiprintf_r>
    d730:	e28dd00c 	add	sp, sp, #12
    d734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    d738:	e28dd008 	add	sp, sp, #8
    d73c:	e12fff1e 	bx	lr

0000d740 <fiprintf>:
    d740:	e92d000e 	push	{r1, r2, r3}
    d744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    d748:	e59f202c 	ldr	r2, [pc, #44]	; d77c <fiprintf+0x3c>
    d74c:	e24dd008 	sub	sp, sp, #8
    d750:	e28dc010 	add	ip, sp, #16
    d754:	e1a01000 	mov	r1, r0
    d758:	e1a0300c 	mov	r3, ip
    d75c:	e5920000 	ldr	r0, [r2]
    d760:	e59d200c 	ldr	r2, [sp, #12]
    d764:	e58dc004 	str	ip, [sp, #4]
    d768:	eb00024e 	bl	e0a8 <_vfiprintf_r>
    d76c:	e28dd008 	add	sp, sp, #8
    d770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    d774:	e28dd00c 	add	sp, sp, #12
    d778:	e12fff1e 	bx	lr
    d77c:	0001356c 	.word	0x0001356c

0000d780 <__libc_init_array>:
    d780:	e92d4070 	push	{r4, r5, r6, lr}
    d784:	e59f6064 	ldr	r6, [pc, #100]	; d7f0 <__libc_init_array+0x70>
    d788:	e59f5064 	ldr	r5, [pc, #100]	; d7f4 <__libc_init_array+0x74>
    d78c:	e0466005 	sub	r6, r6, r5
    d790:	e1b06146 	asrs	r6, r6, #2
    d794:	13a04000 	movne	r4, #0
    d798:	0a000005 	beq	d7b4 <__libc_init_array+0x34>
    d79c:	e2844001 	add	r4, r4, #1
    d7a0:	e4953004 	ldr	r3, [r5], #4
    d7a4:	e1a0e00f 	mov	lr, pc
    d7a8:	e12fff13 	bx	r3
    d7ac:	e1560004 	cmp	r6, r4
    d7b0:	1afffff9 	bne	d79c <__libc_init_array+0x1c>
    d7b4:	e59f603c 	ldr	r6, [pc, #60]	; d7f8 <__libc_init_array+0x78>
    d7b8:	e59f503c 	ldr	r5, [pc, #60]	; d7fc <__libc_init_array+0x7c>
    d7bc:	e0466005 	sub	r6, r6, r5
    d7c0:	ebffea0e 	bl	8000 <_init>
    d7c4:	e1b06146 	asrs	r6, r6, #2
    d7c8:	13a04000 	movne	r4, #0
    d7cc:	0a000005 	beq	d7e8 <__libc_init_array+0x68>
    d7d0:	e2844001 	add	r4, r4, #1
    d7d4:	e4953004 	ldr	r3, [r5], #4
    d7d8:	e1a0e00f 	mov	lr, pc
    d7dc:	e12fff13 	bx	r3
    d7e0:	e1560004 	cmp	r6, r4
    d7e4:	1afffff9 	bne	d7d0 <__libc_init_array+0x50>
    d7e8:	e8bd4070 	pop	{r4, r5, r6, lr}
    d7ec:	e12fff1e 	bx	lr
    d7f0:	00013144 	.word	0x00013144
    d7f4:	00013144 	.word	0x00013144
    d7f8:	00013148 	.word	0x00013148
    d7fc:	00013144 	.word	0x00013144

0000d800 <memcpy>:
    d800:	e352000f 	cmp	r2, #15
    d804:	8a000009 	bhi	d830 <memcpy+0x30>
    d808:	e3520000 	cmp	r2, #0
    d80c:	e1a03000 	mov	r3, r0
    d810:	0a00003c 	beq	d908 <memcpy+0x108>
    d814:	e2433001 	sub	r3, r3, #1
    d818:	e0812002 	add	r2, r1, r2
    d81c:	e4d1c001 	ldrb	ip, [r1], #1
    d820:	e1510002 	cmp	r1, r2
    d824:	e5e3c001 	strb	ip, [r3, #1]!
    d828:	1afffffb 	bne	d81c <memcpy+0x1c>
    d82c:	e12fff1e 	bx	lr
    d830:	e1813000 	orr	r3, r1, r0
    d834:	e3130003 	tst	r3, #3
    d838:	1a000030 	bne	d900 <memcpy+0x100>
    d83c:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    d840:	e1a0e002 	mov	lr, r2
    d844:	e280c010 	add	ip, r0, #16
    d848:	e2813010 	add	r3, r1, #16
    d84c:	e5137010 	ldr	r7, [r3, #-16]
    d850:	e513600c 	ldr	r6, [r3, #-12]
    d854:	e5135008 	ldr	r5, [r3, #-8]
    d858:	e5134004 	ldr	r4, [r3, #-4]
    d85c:	e24ee010 	sub	lr, lr, #16
    d860:	e35e000f 	cmp	lr, #15
    d864:	e50c7010 	str	r7, [ip, #-16]
    d868:	e50c600c 	str	r6, [ip, #-12]
    d86c:	e50c5008 	str	r5, [ip, #-8]
    d870:	e50c4004 	str	r4, [ip, #-4]
    d874:	e2833010 	add	r3, r3, #16
    d878:	e28cc010 	add	ip, ip, #16
    d87c:	8afffff2 	bhi	d84c <memcpy+0x4c>
    d880:	e2423010 	sub	r3, r2, #16
    d884:	e3c3300f 	bic	r3, r3, #15
    d888:	e202600f 	and	r6, r2, #15
    d88c:	e2833010 	add	r3, r3, #16
    d890:	e3560003 	cmp	r6, #3
    d894:	e0811003 	add	r1, r1, r3
    d898:	e0803003 	add	r3, r0, r3
    d89c:	9a00001a 	bls	d90c <memcpy+0x10c>
    d8a0:	e1a04001 	mov	r4, r1
    d8a4:	e1a0c006 	mov	ip, r6
    d8a8:	e243e004 	sub	lr, r3, #4
    d8ac:	e24cc004 	sub	ip, ip, #4
    d8b0:	e4945004 	ldr	r5, [r4], #4
    d8b4:	e35c0003 	cmp	ip, #3
    d8b8:	e5ae5004 	str	r5, [lr, #4]!
    d8bc:	8afffffa 	bhi	d8ac <memcpy+0xac>
    d8c0:	e246c004 	sub	ip, r6, #4
    d8c4:	e3ccc003 	bic	ip, ip, #3
    d8c8:	e28cc004 	add	ip, ip, #4
    d8cc:	e081100c 	add	r1, r1, ip
    d8d0:	e083300c 	add	r3, r3, ip
    d8d4:	e2022003 	and	r2, r2, #3
    d8d8:	e3520000 	cmp	r2, #0
    d8dc:	12433001 	subne	r3, r3, #1
    d8e0:	10812002 	addne	r2, r1, r2
    d8e4:	0a000003 	beq	d8f8 <memcpy+0xf8>
    d8e8:	e4d1c001 	ldrb	ip, [r1], #1
    d8ec:	e1510002 	cmp	r1, r2
    d8f0:	e5e3c001 	strb	ip, [r3, #1]!
    d8f4:	1afffffb 	bne	d8e8 <memcpy+0xe8>
    d8f8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    d8fc:	e12fff1e 	bx	lr
    d900:	e1a03000 	mov	r3, r0
    d904:	eaffffc2 	b	d814 <memcpy+0x14>
    d908:	e12fff1e 	bx	lr
    d90c:	e1a02006 	mov	r2, r6
    d910:	eafffff0 	b	d8d8 <memcpy+0xd8>

0000d914 <memmove>:
    d914:	e1500001 	cmp	r0, r1
    d918:	9a00000a 	bls	d948 <memmove+0x34>
    d91c:	e0813002 	add	r3, r1, r2
    d920:	e1500003 	cmp	r0, r3
    d924:	2a000007 	bcs	d948 <memmove+0x34>
    d928:	e3520000 	cmp	r2, #0
    d92c:	e0802002 	add	r2, r0, r2
    d930:	012fff1e 	bxeq	lr
    d934:	e573c001 	ldrb	ip, [r3, #-1]!
    d938:	e1510003 	cmp	r1, r3
    d93c:	e562c001 	strb	ip, [r2, #-1]!
    d940:	1afffffb 	bne	d934 <memmove+0x20>
    d944:	e12fff1e 	bx	lr
    d948:	e352000f 	cmp	r2, #15
    d94c:	8a000009 	bhi	d978 <memmove+0x64>
    d950:	e3520000 	cmp	r2, #0
    d954:	e1a03000 	mov	r3, r0
    d958:	0a00003c 	beq	da50 <memmove+0x13c>
    d95c:	e2433001 	sub	r3, r3, #1
    d960:	e0812002 	add	r2, r1, r2
    d964:	e4d1c001 	ldrb	ip, [r1], #1
    d968:	e1520001 	cmp	r2, r1
    d96c:	e5e3c001 	strb	ip, [r3, #1]!
    d970:	1afffffb 	bne	d964 <memmove+0x50>
    d974:	e12fff1e 	bx	lr
    d978:	e1813000 	orr	r3, r1, r0
    d97c:	e3130003 	tst	r3, #3
    d980:	1a000030 	bne	da48 <memmove+0x134>
    d984:	e92d4070 	push	{r4, r5, r6, lr}
    d988:	e1a0e002 	mov	lr, r2
    d98c:	e280c010 	add	ip, r0, #16
    d990:	e2813010 	add	r3, r1, #16
    d994:	e5134010 	ldr	r4, [r3, #-16]
    d998:	e50c4010 	str	r4, [ip, #-16]
    d99c:	e513400c 	ldr	r4, [r3, #-12]
    d9a0:	e50c400c 	str	r4, [ip, #-12]
    d9a4:	e5134008 	ldr	r4, [r3, #-8]
    d9a8:	e50c4008 	str	r4, [ip, #-8]
    d9ac:	e24ee010 	sub	lr, lr, #16
    d9b0:	e5134004 	ldr	r4, [r3, #-4]
    d9b4:	e35e000f 	cmp	lr, #15
    d9b8:	e50c4004 	str	r4, [ip, #-4]
    d9bc:	e2833010 	add	r3, r3, #16
    d9c0:	e28cc010 	add	ip, ip, #16
    d9c4:	8afffff2 	bhi	d994 <memmove+0x80>
    d9c8:	e2423010 	sub	r3, r2, #16
    d9cc:	e3c3300f 	bic	r3, r3, #15
    d9d0:	e202600f 	and	r6, r2, #15
    d9d4:	e2833010 	add	r3, r3, #16
    d9d8:	e3560003 	cmp	r6, #3
    d9dc:	e0811003 	add	r1, r1, r3
    d9e0:	e0803003 	add	r3, r0, r3
    d9e4:	9a00001a 	bls	da54 <memmove+0x140>
    d9e8:	e1a04001 	mov	r4, r1
    d9ec:	e1a0c006 	mov	ip, r6
    d9f0:	e243e004 	sub	lr, r3, #4
    d9f4:	e24cc004 	sub	ip, ip, #4
    d9f8:	e4945004 	ldr	r5, [r4], #4
    d9fc:	e35c0003 	cmp	ip, #3
    da00:	e5ae5004 	str	r5, [lr, #4]!
    da04:	8afffffa 	bhi	d9f4 <memmove+0xe0>
    da08:	e246c004 	sub	ip, r6, #4
    da0c:	e3ccc003 	bic	ip, ip, #3
    da10:	e28cc004 	add	ip, ip, #4
    da14:	e081100c 	add	r1, r1, ip
    da18:	e083300c 	add	r3, r3, ip
    da1c:	e2022003 	and	r2, r2, #3
    da20:	e3520000 	cmp	r2, #0
    da24:	12433001 	subne	r3, r3, #1
    da28:	10812002 	addne	r2, r1, r2
    da2c:	0a000003 	beq	da40 <memmove+0x12c>
    da30:	e4d1c001 	ldrb	ip, [r1], #1
    da34:	e1520001 	cmp	r2, r1
    da38:	e5e3c001 	strb	ip, [r3, #1]!
    da3c:	1afffffb 	bne	da30 <memmove+0x11c>
    da40:	e8bd4070 	pop	{r4, r5, r6, lr}
    da44:	e12fff1e 	bx	lr
    da48:	e1a03000 	mov	r3, r0
    da4c:	eaffffc2 	b	d95c <memmove+0x48>
    da50:	e12fff1e 	bx	lr
    da54:	e1a02006 	mov	r2, r6
    da58:	eafffff0 	b	da20 <memmove+0x10c>

0000da5c <memset>:
    da5c:	e3100003 	tst	r0, #3
    da60:	0a000040 	beq	db68 <memset+0x10c>
    da64:	e3520000 	cmp	r2, #0
    da68:	e2422001 	sub	r2, r2, #1
    da6c:	012fff1e 	bxeq	lr
    da70:	e201c0ff 	and	ip, r1, #255	; 0xff
    da74:	e1a03000 	mov	r3, r0
    da78:	ea000002 	b	da88 <memset+0x2c>
    da7c:	e2422001 	sub	r2, r2, #1
    da80:	e3720001 	cmn	r2, #1
    da84:	012fff1e 	bxeq	lr
    da88:	e4c3c001 	strb	ip, [r3], #1
    da8c:	e3130003 	tst	r3, #3
    da90:	1afffff9 	bne	da7c <memset+0x20>
    da94:	e3520003 	cmp	r2, #3
    da98:	9a00002a 	bls	db48 <memset+0xec>
    da9c:	e92d4010 	push	{r4, lr}
    daa0:	e201e0ff 	and	lr, r1, #255	; 0xff
    daa4:	e18ee40e 	orr	lr, lr, lr, lsl #8
    daa8:	e352000f 	cmp	r2, #15
    daac:	e18ee80e 	orr	lr, lr, lr, lsl #16
    dab0:	9a000010 	bls	daf8 <memset+0x9c>
    dab4:	e1a04002 	mov	r4, r2
    dab8:	e283c010 	add	ip, r3, #16
    dabc:	e2444010 	sub	r4, r4, #16
    dac0:	e354000f 	cmp	r4, #15
    dac4:	e50ce010 	str	lr, [ip, #-16]
    dac8:	e50ce00c 	str	lr, [ip, #-12]
    dacc:	e50ce008 	str	lr, [ip, #-8]
    dad0:	e50ce004 	str	lr, [ip, #-4]
    dad4:	e28cc010 	add	ip, ip, #16
    dad8:	8afffff7 	bhi	dabc <memset+0x60>
    dadc:	e242c010 	sub	ip, r2, #16
    dae0:	e3ccc00f 	bic	ip, ip, #15
    dae4:	e202200f 	and	r2, r2, #15
    dae8:	e28cc010 	add	ip, ip, #16
    daec:	e3520003 	cmp	r2, #3
    daf0:	e083300c 	add	r3, r3, ip
    daf4:	9a00000a 	bls	db24 <memset+0xc8>
    daf8:	e1a04003 	mov	r4, r3
    dafc:	e1a0c002 	mov	ip, r2
    db00:	e24cc004 	sub	ip, ip, #4
    db04:	e35c0003 	cmp	ip, #3
    db08:	e484e004 	str	lr, [r4], #4
    db0c:	8afffffb 	bhi	db00 <memset+0xa4>
    db10:	e242c004 	sub	ip, r2, #4
    db14:	e3ccc003 	bic	ip, ip, #3
    db18:	e28cc004 	add	ip, ip, #4
    db1c:	e083300c 	add	r3, r3, ip
    db20:	e2022003 	and	r2, r2, #3
    db24:	e3520000 	cmp	r2, #0
    db28:	0a000004 	beq	db40 <memset+0xe4>
    db2c:	e20110ff 	and	r1, r1, #255	; 0xff
    db30:	e0832002 	add	r2, r3, r2
    db34:	e4c31001 	strb	r1, [r3], #1
    db38:	e1520003 	cmp	r2, r3
    db3c:	1afffffc 	bne	db34 <memset+0xd8>
    db40:	e8bd4010 	pop	{r4, lr}
    db44:	e12fff1e 	bx	lr
    db48:	e3520000 	cmp	r2, #0
    db4c:	012fff1e 	bxeq	lr
    db50:	e20110ff 	and	r1, r1, #255	; 0xff
    db54:	e0832002 	add	r2, r3, r2
    db58:	e4c31001 	strb	r1, [r3], #1
    db5c:	e1520003 	cmp	r2, r3
    db60:	1afffffc 	bne	db58 <memset+0xfc>
    db64:	e12fff1e 	bx	lr
    db68:	e1a03000 	mov	r3, r0
    db6c:	eaffffc8 	b	da94 <memset+0x38>

0000db70 <strcmp>:
    db70:	e020c001 	eor	ip, r0, r1
    db74:	e31c0003 	tst	ip, #3
    db78:	1a000021 	bne	dc04 <strcmp+0x94>
    db7c:	e210c003 	ands	ip, r0, #3
    db80:	e3c00003 	bic	r0, r0, #3
    db84:	e3c11003 	bic	r1, r1, #3
    db88:	e4902004 	ldr	r2, [r0], #4
    db8c:	04913004 	ldreq	r3, [r1], #4
    db90:	0a000006 	beq	dbb0 <strcmp+0x40>
    db94:	e22cc003 	eor	ip, ip, #3
    db98:	e3e034ff 	mvn	r3, #-16777216	; 0xff000000
    db9c:	e1a0c18c 	lsl	ip, ip, #3
    dba0:	e1a0cc33 	lsr	ip, r3, ip
    dba4:	e4913004 	ldr	r3, [r1], #4
    dba8:	e182200c 	orr	r2, r2, ip
    dbac:	e183300c 	orr	r3, r3, ip
    dbb0:	e52d4004 	push	{r4}		; (str r4, [sp, #-4]!)
    dbb4:	e3a04001 	mov	r4, #1
    dbb8:	e1844404 	orr	r4, r4, r4, lsl #8
    dbbc:	e1844804 	orr	r4, r4, r4, lsl #16
    dbc0:	e042c004 	sub	ip, r2, r4
    dbc4:	e1520003 	cmp	r2, r3
    dbc8:	01ccc002 	biceq	ip, ip, r2
    dbcc:	011c0384 	tsteq	ip, r4, lsl #7
    dbd0:	04902004 	ldreq	r2, [r0], #4
    dbd4:	04913004 	ldreq	r3, [r1], #4
    dbd8:	0afffff8 	beq	dbc0 <strcmp+0x50>
    dbdc:	e1a00c02 	lsl	r0, r2, #24
    dbe0:	e1a02422 	lsr	r2, r2, #8
    dbe4:	e3500001 	cmp	r0, #1
    dbe8:	21500c03 	cmpcs	r0, r3, lsl #24
    dbec:	01a03423 	lsreq	r3, r3, #8
    dbf0:	0afffff9 	beq	dbdc <strcmp+0x6c>
    dbf4:	e20330ff 	and	r3, r3, #255	; 0xff
    dbf8:	e0630c20 	rsb	r0, r3, r0, lsr #24
    dbfc:	e49d4004 	pop	{r4}		; (ldr r4, [sp], #4)
    dc00:	e12fff1e 	bx	lr
    dc04:	e3100003 	tst	r0, #3
    dc08:	0a000006 	beq	dc28 <strcmp+0xb8>
    dc0c:	e4d02001 	ldrb	r2, [r0], #1
    dc10:	e4d13001 	ldrb	r3, [r1], #1
    dc14:	e3520001 	cmp	r2, #1
    dc18:	21520003 	cmpcs	r2, r3
    dc1c:	0afffff8 	beq	dc04 <strcmp+0x94>
    dc20:	e0420003 	sub	r0, r2, r3
    dc24:	e12fff1e 	bx	lr
    dc28:	e92d0030 	push	{r4, r5}
    dc2c:	e3a04001 	mov	r4, #1
    dc30:	e1844404 	orr	r4, r4, r4, lsl #8
    dc34:	e1844804 	orr	r4, r4, r4, lsl #16
    dc38:	e4902004 	ldr	r2, [r0], #4
    dc3c:	e2015003 	and	r5, r1, #3
    dc40:	e3c11003 	bic	r1, r1, #3
    dc44:	e4913004 	ldr	r3, [r1], #4
    dc48:	e3550002 	cmp	r5, #2
    dc4c:	0a000017 	beq	dcb0 <strcmp+0x140>
    dc50:	8a00002d 	bhi	dd0c <strcmp+0x19c>
    dc54:	e3c254ff 	bic	r5, r2, #-16777216	; 0xff000000
    dc58:	e1550423 	cmp	r5, r3, lsr #8
    dc5c:	e042c004 	sub	ip, r2, r4
    dc60:	e1ccc002 	bic	ip, ip, r2
    dc64:	1a000007 	bne	dc88 <strcmp+0x118>
    dc68:	e01cc384 	ands	ip, ip, r4, lsl #7
    dc6c:	04913004 	ldreq	r3, [r1], #4
    dc70:	1a000006 	bne	dc90 <strcmp+0x120>
    dc74:	e0255002 	eor	r5, r5, r2
    dc78:	e1550c03 	cmp	r5, r3, lsl #24
    dc7c:	1a000008 	bne	dca4 <strcmp+0x134>
    dc80:	e4902004 	ldr	r2, [r0], #4
    dc84:	eafffff2 	b	dc54 <strcmp+0xe4>
    dc88:	e1a03423 	lsr	r3, r3, #8
    dc8c:	ea000036 	b	dd6c <strcmp+0x1fc>
    dc90:	e3dcc4ff 	bics	ip, ip, #-16777216	; 0xff000000
    dc94:	1a000031 	bne	dd60 <strcmp+0x1f0>
    dc98:	e5d13000 	ldrb	r3, [r1]
    dc9c:	e1a05c22 	lsr	r5, r2, #24
    dca0:	ea000031 	b	dd6c <strcmp+0x1fc>
    dca4:	e1a05c22 	lsr	r5, r2, #24
    dca8:	e20330ff 	and	r3, r3, #255	; 0xff
    dcac:	ea00002e 	b	dd6c <strcmp+0x1fc>
    dcb0:	e1a05802 	lsl	r5, r2, #16
    dcb4:	e042c004 	sub	ip, r2, r4
    dcb8:	e1a05825 	lsr	r5, r5, #16
    dcbc:	e1ccc002 	bic	ip, ip, r2
    dcc0:	e1550823 	cmp	r5, r3, lsr #16
    dcc4:	1a00000e 	bne	dd04 <strcmp+0x194>
    dcc8:	e01cc384 	ands	ip, ip, r4, lsl #7
    dccc:	04913004 	ldreq	r3, [r1], #4
    dcd0:	1a000004 	bne	dce8 <strcmp+0x178>
    dcd4:	e0255002 	eor	r5, r5, r2
    dcd8:	e1550803 	cmp	r5, r3, lsl #16
    dcdc:	1a000006 	bne	dcfc <strcmp+0x18c>
    dce0:	e4902004 	ldr	r2, [r0], #4
    dce4:	eafffff1 	b	dcb0 <strcmp+0x140>
    dce8:	e1b0c80c 	lsls	ip, ip, #16
    dcec:	1a00001b 	bne	dd60 <strcmp+0x1f0>
    dcf0:	e1d130b0 	ldrh	r3, [r1]
    dcf4:	e1a05822 	lsr	r5, r2, #16
    dcf8:	ea00001b 	b	dd6c <strcmp+0x1fc>
    dcfc:	e1a03803 	lsl	r3, r3, #16
    dd00:	e1a05822 	lsr	r5, r2, #16
    dd04:	e1a03823 	lsr	r3, r3, #16
    dd08:	ea000017 	b	dd6c <strcmp+0x1fc>
    dd0c:	e20250ff 	and	r5, r2, #255	; 0xff
    dd10:	e1550c23 	cmp	r5, r3, lsr #24
    dd14:	e042c004 	sub	ip, r2, r4
    dd18:	e1ccc002 	bic	ip, ip, r2
    dd1c:	1a000007 	bne	dd40 <strcmp+0x1d0>
    dd20:	e01cc384 	ands	ip, ip, r4, lsl #7
    dd24:	04913004 	ldreq	r3, [r1], #4
    dd28:	1a000006 	bne	dd48 <strcmp+0x1d8>
    dd2c:	e0255002 	eor	r5, r5, r2
    dd30:	e1550403 	cmp	r5, r3, lsl #8
    dd34:	1a000006 	bne	dd54 <strcmp+0x1e4>
    dd38:	e4902004 	ldr	r2, [r0], #4
    dd3c:	eafffff2 	b	dd0c <strcmp+0x19c>
    dd40:	e1a03c23 	lsr	r3, r3, #24
    dd44:	ea000008 	b	dd6c <strcmp+0x1fc>
    dd48:	e31200ff 	tst	r2, #255	; 0xff
    dd4c:	0a000003 	beq	dd60 <strcmp+0x1f0>
    dd50:	e4913004 	ldr	r3, [r1], #4
    dd54:	e1a05422 	lsr	r5, r2, #8
    dd58:	e3c334ff 	bic	r3, r3, #-16777216	; 0xff000000
    dd5c:	ea000002 	b	dd6c <strcmp+0x1fc>
    dd60:	e3a00000 	mov	r0, #0
    dd64:	e8bd0030 	pop	{r4, r5}
    dd68:	e12fff1e 	bx	lr
    dd6c:	e20520ff 	and	r2, r5, #255	; 0xff
    dd70:	e20300ff 	and	r0, r3, #255	; 0xff
    dd74:	e3500001 	cmp	r0, #1
    dd78:	21500002 	cmpcs	r0, r2
    dd7c:	01a05425 	lsreq	r5, r5, #8
    dd80:	01a03423 	lsreq	r3, r3, #8
    dd84:	0afffff8 	beq	dd6c <strcmp+0x1fc>
    dd88:	e0420000 	sub	r0, r2, r0
    dd8c:	e8bd0030 	pop	{r4, r5}
    dd90:	e12fff1e 	bx	lr

0000dd94 <strlen>:
    dd94:	e3c01003 	bic	r1, r0, #3
    dd98:	e2100003 	ands	r0, r0, #3
    dd9c:	e2600000 	rsb	r0, r0, #0
    dda0:	e4913004 	ldr	r3, [r1], #4
    dda4:	e280c004 	add	ip, r0, #4
    dda8:	e1a0c18c 	lsl	ip, ip, #3
    ddac:	e3e02000 	mvn	r2, #0
    ddb0:	11833c32 	orrne	r3, r3, r2, lsr ip
    ddb4:	e3a0c001 	mov	ip, #1
    ddb8:	e18cc40c 	orr	ip, ip, ip, lsl #8
    ddbc:	e18cc80c 	orr	ip, ip, ip, lsl #16
    ddc0:	e043200c 	sub	r2, r3, ip
    ddc4:	e1c22003 	bic	r2, r2, r3
    ddc8:	e012238c 	ands	r2, r2, ip, lsl #7
    ddcc:	04913004 	ldreq	r3, [r1], #4
    ddd0:	02800004 	addeq	r0, r0, #4
    ddd4:	0afffff9 	beq	ddc0 <strlen+0x2c>
    ddd8:	e31300ff 	tst	r3, #255	; 0xff
    dddc:	12800001 	addne	r0, r0, #1
    dde0:	13130cff 	tstne	r3, #65280	; 0xff00
    dde4:	12800001 	addne	r0, r0, #1
    dde8:	131308ff 	tstne	r3, #16711680	; 0xff0000
    ddec:	12800001 	addne	r0, r0, #1
    ddf0:	e12fff1e 	bx	lr

0000ddf4 <strncmp>:
    ddf4:	e3520000 	cmp	r2, #0
    ddf8:	0a000037 	beq	dedc <strncmp+0xe8>
    ddfc:	e1803001 	orr	r3, r0, r1
    de00:	e2133003 	ands	r3, r3, #3
    de04:	e92d40f0 	push	{r4, r5, r6, r7, lr}
    de08:	1a00001f 	bne	de8c <strncmp+0x98>
    de0c:	e3520003 	cmp	r2, #3
    de10:	9a00001d 	bls	de8c <strncmp+0x98>
    de14:	e590c000 	ldr	ip, [r0]
    de18:	e591e000 	ldr	lr, [r1]
    de1c:	e15c000e 	cmp	ip, lr
    de20:	1a000019 	bne	de8c <strncmp+0x98>
    de24:	e2522004 	subs	r2, r2, #4
    de28:	0a00002d 	beq	dee4 <strncmp+0xf0>
    de2c:	e59f50c8 	ldr	r5, [pc, #200]	; defc <strncmp+0x108>
    de30:	e59f60c8 	ldr	r6, [pc, #200]	; df00 <strncmp+0x10c>
    de34:	e08ce005 	add	lr, ip, r5
    de38:	e1cec00c 	bic	ip, lr, ip
    de3c:	e11c0006 	tst	ip, r6
    de40:	02800004 	addeq	r0, r0, #4
    de44:	02811004 	addeq	r1, r1, #4
    de48:	0a00000b 	beq	de7c <strncmp+0x88>
    de4c:	ea000024 	b	dee4 <strncmp+0xf0>
    de50:	e4903004 	ldr	r3, [r0], #4
    de54:	e5914000 	ldr	r4, [r1]
    de58:	e083c005 	add	ip, r3, r5
    de5c:	e1530004 	cmp	r3, r4
    de60:	e1ccc003 	bic	ip, ip, r3
    de64:	e2811004 	add	r1, r1, #4
    de68:	1a000020 	bne	def0 <strncmp+0xfc>
    de6c:	e2522004 	subs	r2, r2, #4
    de70:	0a00001b 	beq	dee4 <strncmp+0xf0>
    de74:	e11c0006 	tst	ip, r6
    de78:	1a000019 	bne	dee4 <strncmp+0xf0>
    de7c:	e3520003 	cmp	r2, #3
    de80:	e1a07000 	mov	r7, r0
    de84:	e1a0e001 	mov	lr, r1
    de88:	8afffff0 	bhi	de50 <strncmp+0x5c>
    de8c:	e5d03000 	ldrb	r3, [r0]
    de90:	e5d1c000 	ldrb	ip, [r1]
    de94:	e15c0003 	cmp	ip, r3
    de98:	e2422001 	sub	r2, r2, #1
    de9c:	1a00000b 	bne	ded0 <strncmp+0xdc>
    dea0:	e3520000 	cmp	r2, #0
    dea4:	135c0000 	cmpne	ip, #0
    dea8:	1a000003 	bne	debc <strncmp+0xc8>
    deac:	ea00000c 	b	dee4 <strncmp+0xf0>
    deb0:	e3520000 	cmp	r2, #0
    deb4:	13530000 	cmpne	r3, #0
    deb8:	0a000009 	beq	dee4 <strncmp+0xf0>
    debc:	e5f03001 	ldrb	r3, [r0, #1]!
    dec0:	e5f1c001 	ldrb	ip, [r1, #1]!
    dec4:	e153000c 	cmp	r3, ip
    dec8:	e2422001 	sub	r2, r2, #1
    decc:	0afffff7 	beq	deb0 <strncmp+0xbc>
    ded0:	e043000c 	sub	r0, r3, ip
    ded4:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    ded8:	e12fff1e 	bx	lr
    dedc:	e1a00002 	mov	r0, r2
    dee0:	e12fff1e 	bx	lr
    dee4:	e3a00000 	mov	r0, #0
    dee8:	e8bd40f0 	pop	{r4, r5, r6, r7, lr}
    deec:	e12fff1e 	bx	lr
    def0:	e1a0100e 	mov	r1, lr
    def4:	e1a00007 	mov	r0, r7
    def8:	eaffffe3 	b	de8c <strncmp+0x98>
    defc:	fefefeff 	.word	0xfefefeff
    df00:	80808080 	.word	0x80808080

0000df04 <strncpy>:
    df04:	e1803001 	orr	r3, r0, r1
    df08:	e3130003 	tst	r3, #3
    df0c:	03a03001 	moveq	r3, #1
    df10:	13a03000 	movne	r3, #0
    df14:	e3520003 	cmp	r2, #3
    df18:	93a03000 	movls	r3, #0
    df1c:	82033001 	andhi	r3, r3, #1
    df20:	e3530000 	cmp	r3, #0
    df24:	e92d4070 	push	{r4, r5, r6, lr}
    df28:	e1a03000 	mov	r3, r0
    df2c:	0a00000b 	beq	df60 <strncpy+0x5c>
    df30:	e59f50a0 	ldr	r5, [pc, #160]	; dfd8 <strncpy+0xd4>
    df34:	e59f40a0 	ldr	r4, [pc, #160]	; dfdc <strncpy+0xd8>
    df38:	e1a06001 	mov	r6, r1
    df3c:	e491e004 	ldr	lr, [r1], #4
    df40:	e08ec005 	add	ip, lr, r5
    df44:	e1ccc00e 	bic	ip, ip, lr
    df48:	e11c0004 	tst	ip, r4
    df4c:	1a00001f 	bne	dfd0 <strncpy+0xcc>
    df50:	e2422004 	sub	r2, r2, #4
    df54:	e3520003 	cmp	r2, #3
    df58:	e483e004 	str	lr, [r3], #4
    df5c:	8afffff5 	bhi	df38 <strncpy+0x34>
    df60:	e3520000 	cmp	r2, #0
    df64:	0a00000e 	beq	dfa4 <strncpy+0xa0>
    df68:	e5d1c000 	ldrb	ip, [r1]
    df6c:	e35c0000 	cmp	ip, #0
    df70:	e5c3c000 	strb	ip, [r3]
    df74:	e2422001 	sub	r2, r2, #1
    df78:	e2833001 	add	r3, r3, #1
    df7c:	e2811001 	add	r1, r1, #1
    df80:	1a000005 	bne	df9c <strncpy+0x98>
    df84:	ea000008 	b	dfac <strncpy+0xa8>
    df88:	e4d1c001 	ldrb	ip, [r1], #1
    df8c:	e35c0000 	cmp	ip, #0
    df90:	e2422001 	sub	r2, r2, #1
    df94:	e4c3c001 	strb	ip, [r3], #1
    df98:	0a000003 	beq	dfac <strncpy+0xa8>
    df9c:	e3520000 	cmp	r2, #0
    dfa0:	1afffff8 	bne	df88 <strncpy+0x84>
    dfa4:	e8bd4070 	pop	{r4, r5, r6, lr}
    dfa8:	e12fff1e 	bx	lr
    dfac:	e3520000 	cmp	r2, #0
    dfb0:	13a01000 	movne	r1, #0
    dfb4:	10832002 	addne	r2, r3, r2
    dfb8:	0afffff9 	beq	dfa4 <strncpy+0xa0>
    dfbc:	e4c31001 	strb	r1, [r3], #1
    dfc0:	e1520003 	cmp	r2, r3
    dfc4:	1afffffc 	bne	dfbc <strncpy+0xb8>
    dfc8:	e8bd4070 	pop	{r4, r5, r6, lr}
    dfcc:	e12fff1e 	bx	lr
    dfd0:	e1a01006 	mov	r1, r6
    dfd4:	eaffffe3 	b	df68 <strncpy+0x64>
    dfd8:	fefefeff 	.word	0xfefefeff
    dfdc:	80808080 	.word	0x80808080

0000dfe0 <__sprint_r.part.0>:
    dfe0:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    dfe4:	e5913064 	ldr	r3, [r1, #100]	; 0x64
    dfe8:	e3130a02 	tst	r3, #8192	; 0x2000
    dfec:	e1a0b002 	mov	fp, r2
    dff0:	0a000024 	beq	e088 <__sprint_r.part.0+0xa8>
    dff4:	e5923008 	ldr	r3, [r2, #8]
    dff8:	e5929000 	ldr	r9, [r2]
    dffc:	e3530000 	cmp	r3, #0
    e000:	11a06001 	movne	r6, r1
    e004:	11a07000 	movne	r7, r0
    e008:	12899008 	addne	r9, r9, #8
    e00c:	0a00001b 	beq	e080 <__sprint_r.part.0+0xa0>
    e010:	e519a004 	ldr	sl, [r9, #-4]
    e014:	e5195008 	ldr	r5, [r9, #-8]
    e018:	e1b0812a 	lsrs	r8, sl, #2
    e01c:	13a04000 	movne	r4, #0
    e020:	12455004 	subne	r5, r5, #4
    e024:	1a000002 	bne	e034 <__sprint_r.part.0+0x54>
    e028:	ea00000e 	b	e068 <__sprint_r.part.0+0x88>
    e02c:	e1580004 	cmp	r8, r4
    e030:	0a00000b 	beq	e064 <__sprint_r.part.0+0x84>
    e034:	e1a02006 	mov	r2, r6
    e038:	e5b51004 	ldr	r1, [r5, #4]!
    e03c:	e1a00007 	mov	r0, r7
    e040:	eb000777 	bl	fe24 <_fputwc_r>
    e044:	e3700001 	cmn	r0, #1
    e048:	e2844001 	add	r4, r4, #1
    e04c:	1afffff6 	bne	e02c <__sprint_r.part.0+0x4c>
    e050:	e3a03000 	mov	r3, #0
    e054:	e58b3008 	str	r3, [fp, #8]
    e058:	e58b3004 	str	r3, [fp, #4]
    e05c:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e060:	e12fff1e 	bx	lr
    e064:	e59b3008 	ldr	r3, [fp, #8]
    e068:	e3caa003 	bic	sl, sl, #3
    e06c:	e043300a 	sub	r3, r3, sl
    e070:	e3530000 	cmp	r3, #0
    e074:	e58b3008 	str	r3, [fp, #8]
    e078:	e2899008 	add	r9, r9, #8
    e07c:	1affffe3 	bne	e010 <__sprint_r.part.0+0x30>
    e080:	e3a00000 	mov	r0, #0
    e084:	eafffff1 	b	e050 <__sprint_r.part.0+0x70>
    e088:	eb00089d 	bl	10304 <__sfvwrite_r>
    e08c:	eaffffef 	b	e050 <__sprint_r.part.0+0x70>

0000e090 <__sprint_r>:
    e090:	e5923008 	ldr	r3, [r2, #8]
    e094:	e3530000 	cmp	r3, #0
    e098:	1affffd0 	bne	dfe0 <__sprint_r.part.0>
    e09c:	e5823004 	str	r3, [r2, #4]
    e0a0:	e1a00003 	mov	r0, r3
    e0a4:	e12fff1e 	bx	lr

0000e0a8 <_vfiprintf_r>:
    e0a8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e0ac:	e1a05003 	mov	r5, r3
    e0b0:	e24dd0b4 	sub	sp, sp, #180	; 0xb4
    e0b4:	e2503000 	subs	r3, r0, #0
    e0b8:	e58d3014 	str	r3, [sp, #20]
    e0bc:	e1a0a001 	mov	sl, r1
    e0c0:	e1a09002 	mov	r9, r2
    e0c4:	e58d5018 	str	r5, [sp, #24]
    e0c8:	0a000002 	beq	e0d8 <_vfiprintf_r+0x30>
    e0cc:	e5933038 	ldr	r3, [r3, #56]	; 0x38
    e0d0:	e3530000 	cmp	r3, #0
    e0d4:	0a0000cf 	beq	e418 <_vfiprintf_r+0x370>
    e0d8:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    e0dc:	e3130001 	tst	r3, #1
    e0e0:	e1da30fc 	ldrsh	r3, [sl, #12]
    e0e4:	e1a01803 	lsl	r1, r3, #16
    e0e8:	1a0000a7 	bne	e38c <_vfiprintf_r+0x2e4>
    e0ec:	e3110402 	tst	r1, #33554432	; 0x2000000
    e0f0:	e1a01821 	lsr	r1, r1, #16
    e0f4:	0a0000a0 	beq	e37c <_vfiprintf_r+0x2d4>
    e0f8:	e3110a02 	tst	r1, #8192	; 0x2000
    e0fc:	1a000006 	bne	e11c <_vfiprintf_r+0x74>
    e100:	e59a2064 	ldr	r2, [sl, #100]	; 0x64
    e104:	e3833a02 	orr	r3, r3, #8192	; 0x2000
    e108:	e3c22a02 	bic	r2, r2, #8192	; 0x2000
    e10c:	e1ca30bc 	strh	r3, [sl, #12]
    e110:	e58a2064 	str	r2, [sl, #100]	; 0x64
    e114:	e1a03803 	lsl	r3, r3, #16
    e118:	e1a01823 	lsr	r1, r3, #16
    e11c:	e3110008 	tst	r1, #8
    e120:	0a0000a0 	beq	e3a8 <_vfiprintf_r+0x300>
    e124:	e59a3010 	ldr	r3, [sl, #16]
    e128:	e3530000 	cmp	r3, #0
    e12c:	0a00009d 	beq	e3a8 <_vfiprintf_r+0x300>
    e130:	e201301a 	and	r3, r1, #26
    e134:	e353000a 	cmp	r3, #10
    e138:	0a0000a3 	beq	e3cc <_vfiprintf_r+0x324>
    e13c:	e3a03000 	mov	r3, #0
    e140:	e28d8070 	add	r8, sp, #112	; 0x70
    e144:	e1a0b008 	mov	fp, r8
    e148:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    e14c:	e58d3008 	str	r3, [sp, #8]
    e150:	e58d3044 	str	r3, [sp, #68]	; 0x44
    e154:	e58d3040 	str	r3, [sp, #64]	; 0x40
    e158:	e58d803c 	str	r8, [sp, #60]	; 0x3c
    e15c:	e58da00c 	str	sl, [sp, #12]
    e160:	e5d93000 	ldrb	r3, [r9]
    e164:	e3530000 	cmp	r3, #0
    e168:	13530025 	cmpne	r3, #37	; 0x25
    e16c:	e1a04009 	mov	r4, r9
    e170:	0a000013 	beq	e1c4 <_vfiprintf_r+0x11c>
    e174:	e5f43001 	ldrb	r3, [r4, #1]!
    e178:	e3530000 	cmp	r3, #0
    e17c:	13530025 	cmpne	r3, #37	; 0x25
    e180:	1afffffb 	bne	e174 <_vfiprintf_r+0xcc>
    e184:	e0545009 	subs	r5, r4, r9
    e188:	0a00000d 	beq	e1c4 <_vfiprintf_r+0x11c>
    e18c:	e59d3040 	ldr	r3, [sp, #64]	; 0x40
    e190:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    e194:	e2833001 	add	r3, r3, #1
    e198:	e3530007 	cmp	r3, #7
    e19c:	e0852002 	add	r2, r5, r2
    e1a0:	e58b9000 	str	r9, [fp]
    e1a4:	e58b5004 	str	r5, [fp, #4]
    e1a8:	e58d3040 	str	r3, [sp, #64]	; 0x40
    e1ac:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e1b0:	d28bb008 	addle	fp, fp, #8
    e1b4:	ca000076 	bgt	e394 <_vfiprintf_r+0x2ec>
    e1b8:	e59d3008 	ldr	r3, [sp, #8]
    e1bc:	e0833005 	add	r3, r3, r5
    e1c0:	e58d3008 	str	r3, [sp, #8]
    e1c4:	e5d43000 	ldrb	r3, [r4]
    e1c8:	e3530000 	cmp	r3, #0
    e1cc:	0a00042f 	beq	f290 <_vfiprintf_r+0x11e8>
    e1d0:	e3a01000 	mov	r1, #0
    e1d4:	e3a03000 	mov	r3, #0
    e1d8:	e3e0a000 	mvn	sl, #0
    e1dc:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    e1e0:	e2849001 	add	r9, r4, #1
    e1e4:	e5d43001 	ldrb	r3, [r4, #1]
    e1e8:	e1a0c001 	mov	ip, r1
    e1ec:	e1a00001 	mov	r0, r1
    e1f0:	e1a05001 	mov	r5, r1
    e1f4:	e1a0700a 	mov	r7, sl
    e1f8:	e3a0e001 	mov	lr, #1
    e1fc:	e3a0402b 	mov	r4, #43	; 0x2b
    e200:	e3a06020 	mov	r6, #32
    e204:	e2899001 	add	r9, r9, #1
    e208:	e2432020 	sub	r2, r3, #32
    e20c:	e3520058 	cmp	r2, #88	; 0x58
    e210:	979ff102 	ldrls	pc, [pc, r2, lsl #2]
    e214:	ea000220 	b	ea9c <_vfiprintf_r+0x9f4>
    e218:	0000ea88 	.word	0x0000ea88
    e21c:	0000ea9c 	.word	0x0000ea9c
    e220:	0000ea9c 	.word	0x0000ea9c
    e224:	0000ea64 	.word	0x0000ea64
    e228:	0000ea9c 	.word	0x0000ea9c
    e22c:	0000ea9c 	.word	0x0000ea9c
    e230:	0000ea9c 	.word	0x0000ea9c
    e234:	0000ea9c 	.word	0x0000ea9c
    e238:	0000ea9c 	.word	0x0000ea9c
    e23c:	0000ea9c 	.word	0x0000ea9c
    e240:	0000e420 	.word	0x0000e420
    e244:	0000e870 	.word	0x0000e870
    e248:	0000ea9c 	.word	0x0000ea9c
    e24c:	0000e43c 	.word	0x0000e43c
    e250:	0000e808 	.word	0x0000e808
    e254:	0000ea9c 	.word	0x0000ea9c
    e258:	0000e880 	.word	0x0000e880
    e25c:	0000e88c 	.word	0x0000e88c
    e260:	0000e88c 	.word	0x0000e88c
    e264:	0000e88c 	.word	0x0000e88c
    e268:	0000e88c 	.word	0x0000e88c
    e26c:	0000e88c 	.word	0x0000e88c
    e270:	0000e88c 	.word	0x0000e88c
    e274:	0000e88c 	.word	0x0000e88c
    e278:	0000e88c 	.word	0x0000e88c
    e27c:	0000e88c 	.word	0x0000e88c
    e280:	0000ea9c 	.word	0x0000ea9c
    e284:	0000ea9c 	.word	0x0000ea9c
    e288:	0000ea9c 	.word	0x0000ea9c
    e28c:	0000ea9c 	.word	0x0000ea9c
    e290:	0000ea9c 	.word	0x0000ea9c
    e294:	0000ea9c 	.word	0x0000ea9c
    e298:	0000ea9c 	.word	0x0000ea9c
    e29c:	0000ea9c 	.word	0x0000ea9c
    e2a0:	0000ea9c 	.word	0x0000ea9c
    e2a4:	0000ea9c 	.word	0x0000ea9c
    e2a8:	0000e8b0 	.word	0x0000e8b0
    e2ac:	0000ea9c 	.word	0x0000ea9c
    e2b0:	0000ea9c 	.word	0x0000ea9c
    e2b4:	0000ea9c 	.word	0x0000ea9c
    e2b8:	0000ea9c 	.word	0x0000ea9c
    e2bc:	0000ea9c 	.word	0x0000ea9c
    e2c0:	0000ea9c 	.word	0x0000ea9c
    e2c4:	0000ea9c 	.word	0x0000ea9c
    e2c8:	0000ea9c 	.word	0x0000ea9c
    e2cc:	0000ea9c 	.word	0x0000ea9c
    e2d0:	0000ea9c 	.word	0x0000ea9c
    e2d4:	0000e744 	.word	0x0000e744
    e2d8:	0000ea9c 	.word	0x0000ea9c
    e2dc:	0000ea9c 	.word	0x0000ea9c
    e2e0:	0000ea9c 	.word	0x0000ea9c
    e2e4:	0000ea9c 	.word	0x0000ea9c
    e2e8:	0000ea9c 	.word	0x0000ea9c
    e2ec:	0000e750 	.word	0x0000e750
    e2f0:	0000ea9c 	.word	0x0000ea9c
    e2f4:	0000ea9c 	.word	0x0000ea9c
    e2f8:	0000e9b4 	.word	0x0000e9b4
    e2fc:	0000ea9c 	.word	0x0000ea9c
    e300:	0000ea9c 	.word	0x0000ea9c
    e304:	0000ea9c 	.word	0x0000ea9c
    e308:	0000ea9c 	.word	0x0000ea9c
    e30c:	0000ea9c 	.word	0x0000ea9c
    e310:	0000ea9c 	.word	0x0000ea9c
    e314:	0000ea9c 	.word	0x0000ea9c
    e318:	0000ea9c 	.word	0x0000ea9c
    e31c:	0000ea9c 	.word	0x0000ea9c
    e320:	0000ea9c 	.word	0x0000ea9c
    e324:	0000ea28 	.word	0x0000ea28
    e328:	0000e9a4 	.word	0x0000e9a4
    e32c:	0000ea9c 	.word	0x0000ea9c
    e330:	0000ea9c 	.word	0x0000ea9c
    e334:	0000ea9c 	.word	0x0000ea9c
    e338:	0000e848 	.word	0x0000e848
    e33c:	0000e9a4 	.word	0x0000e9a4
    e340:	0000ea9c 	.word	0x0000ea9c
    e344:	0000ea9c 	.word	0x0000ea9c
    e348:	0000e854 	.word	0x0000e854
    e34c:	0000ea9c 	.word	0x0000ea9c
    e350:	0000e968 	.word	0x0000e968
    e354:	0000e708 	.word	0x0000e708
    e358:	0000e75c 	.word	0x0000e75c
    e35c:	0000e798 	.word	0x0000e798
    e360:	0000ea9c 	.word	0x0000ea9c
    e364:	0000e7a4 	.word	0x0000e7a4
    e368:	0000ea9c 	.word	0x0000ea9c
    e36c:	0000e448 	.word	0x0000e448
    e370:	0000ea9c 	.word	0x0000ea9c
    e374:	0000ea9c 	.word	0x0000ea9c
    e378:	0000ea70 	.word	0x0000ea70
    e37c:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    e380:	eb000995 	bl	109dc <__retarget_lock_acquire_recursive>
    e384:	e1da30fc 	ldrsh	r3, [sl, #12]
    e388:	e1a01803 	lsl	r1, r3, #16
    e38c:	e1a01821 	lsr	r1, r1, #16
    e390:	eaffff58 	b	e0f8 <_vfiprintf_r+0x50>
    e394:	e3520000 	cmp	r2, #0
    e398:	1a000314 	bne	eff0 <_vfiprintf_r+0xf48>
    e39c:	e58d2040 	str	r2, [sp, #64]	; 0x40
    e3a0:	e1a0b008 	mov	fp, r8
    e3a4:	eaffff83 	b	e1b8 <_vfiprintf_r+0x110>
    e3a8:	e1a0100a 	mov	r1, sl
    e3ac:	e59d0014 	ldr	r0, [sp, #20]
    e3b0:	eb000438 	bl	f498 <__swsetup_r>
    e3b4:	e3500000 	cmp	r0, #0
    e3b8:	1a0002f6 	bne	ef98 <_vfiprintf_r+0xef0>
    e3bc:	e1da10bc 	ldrh	r1, [sl, #12]
    e3c0:	e201301a 	and	r3, r1, #26
    e3c4:	e353000a 	cmp	r3, #10
    e3c8:	1affff5b 	bne	e13c <_vfiprintf_r+0x94>
    e3cc:	e1da30fe 	ldrsh	r3, [sl, #14]
    e3d0:	e3530000 	cmp	r3, #0
    e3d4:	baffff58 	blt	e13c <_vfiprintf_r+0x94>
    e3d8:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    e3dc:	e3130001 	tst	r3, #1
    e3e0:	1a000002 	bne	e3f0 <_vfiprintf_r+0x348>
    e3e4:	e3110c02 	tst	r1, #512	; 0x200
    e3e8:	059a0058 	ldreq	r0, [sl, #88]	; 0x58
    e3ec:	0b000980 	bleq	109f4 <__retarget_lock_release_recursive>
    e3f0:	e1a03005 	mov	r3, r5
    e3f4:	e1a02009 	mov	r2, r9
    e3f8:	e1a0100a 	mov	r1, sl
    e3fc:	e59d0014 	ldr	r0, [sp, #20]
    e400:	eb0003f0 	bl	f3c8 <__sbprintf>
    e404:	e58d0008 	str	r0, [sp, #8]
    e408:	e59d0008 	ldr	r0, [sp, #8]
    e40c:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    e410:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    e414:	e12fff1e 	bx	lr
    e418:	eb0005a0 	bl	faa0 <__sinit>
    e41c:	eaffff2d 	b	e0d8 <_vfiprintf_r+0x30>
    e420:	e59d3018 	ldr	r3, [sp, #24]
    e424:	e5930000 	ldr	r0, [r3]
    e428:	e2833004 	add	r3, r3, #4
    e42c:	e3500000 	cmp	r0, #0
    e430:	e58d3018 	str	r3, [sp, #24]
    e434:	aa000001 	bge	e440 <_vfiprintf_r+0x398>
    e438:	e2600000 	rsb	r0, r0, #0
    e43c:	e3855004 	orr	r5, r5, #4
    e440:	e5d93000 	ldrb	r3, [r9]
    e444:	eaffff6e 	b	e204 <_vfiprintf_r+0x15c>
    e448:	e58d001c 	str	r0, [sp, #28]
    e44c:	e3150020 	tst	r5, #32
    e450:	1a00032b 	bne	f104 <_vfiprintf_r+0x105c>
    e454:	e59d2018 	ldr	r2, [sp, #24]
    e458:	e3150010 	tst	r5, #16
    e45c:	e1a03002 	mov	r3, r2
    e460:	1a0002f0 	bne	f028 <_vfiprintf_r+0xf80>
    e464:	e3150040 	tst	r5, #64	; 0x40
    e468:	0a0002ee 	beq	f028 <_vfiprintf_r+0xf80>
    e46c:	e3a03001 	mov	r3, #1
    e470:	e3a07000 	mov	r7, #0
    e474:	e1d260b0 	ldrh	r6, [r2]
    e478:	e2822004 	add	r2, r2, #4
    e47c:	e58d2018 	str	r2, [sp, #24]
    e480:	e3a02000 	mov	r2, #0
    e484:	e3a04000 	mov	r4, #0
    e488:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    e48c:	e37a0001 	cmn	sl, #1
    e490:	0a00011e 	beq	e910 <_vfiprintf_r+0x868>
    e494:	e1862007 	orr	r2, r6, r7
    e498:	e3520000 	cmp	r2, #0
    e49c:	035a0000 	cmpeq	sl, #0
    e4a0:	e3c52080 	bic	r2, r5, #128	; 0x80
    e4a4:	e58d2004 	str	r2, [sp, #4]
    e4a8:	1a000298 	bne	ef10 <_vfiprintf_r+0xe68>
    e4ac:	e3530000 	cmp	r3, #0
    e4b0:	1a000292 	bne	ef00 <_vfiprintf_r+0xe58>
    e4b4:	e2153001 	ands	r3, r5, #1
    e4b8:	e58d3010 	str	r3, [sp, #16]
    e4bc:	058d8024 	streq	r8, [sp, #36]	; 0x24
    e4c0:	13a03030 	movne	r3, #48	; 0x30
    e4c4:	128d20b0 	addne	r2, sp, #176	; 0xb0
    e4c8:	15623041 	strbne	r3, [r2, #-65]!	; 0xffffffbf
    e4cc:	158d2024 	strne	r2, [sp, #36]	; 0x24
    e4d0:	e59d3010 	ldr	r3, [sp, #16]
    e4d4:	e15a0003 	cmp	sl, r3
    e4d8:	a1a0700a 	movge	r7, sl
    e4dc:	b1a07003 	movlt	r7, r3
    e4e0:	e3540000 	cmp	r4, #0
    e4e4:	12877001 	addne	r7, r7, #1
    e4e8:	e59d3004 	ldr	r3, [sp, #4]
    e4ec:	e2133002 	ands	r3, r3, #2
    e4f0:	e58d3020 	str	r3, [sp, #32]
    e4f4:	e59d3004 	ldr	r3, [sp, #4]
    e4f8:	12877002 	addne	r7, r7, #2
    e4fc:	e2136084 	ands	r6, r3, #132	; 0x84
    e500:	1a00018d 	bne	eb3c <_vfiprintf_r+0xa94>
    e504:	e59d301c 	ldr	r3, [sp, #28]
    e508:	e0434007 	sub	r4, r3, r7
    e50c:	e3540000 	cmp	r4, #0
    e510:	da000189 	ble	eb3c <_vfiprintf_r+0xa94>
    e514:	e3540010 	cmp	r4, #16
    e518:	da000378 	ble	f300 <_vfiprintf_r+0x1258>
    e51c:	e1a0e00b 	mov	lr, fp
    e520:	e3a05010 	mov	r5, #16
    e524:	e1a0b007 	mov	fp, r7
    e528:	e3a03001 	mov	r3, #1
    e52c:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    e530:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    e534:	e59d7014 	ldr	r7, [sp, #20]
    e538:	ea000005 	b	e554 <_vfiprintf_r+0x4ac>
    e53c:	e28c1002 	add	r1, ip, #2
    e540:	e1a0c000 	mov	ip, r0
    e544:	e28ee008 	add	lr, lr, #8
    e548:	e2444010 	sub	r4, r4, #16
    e54c:	e3540010 	cmp	r4, #16
    e550:	da00000f 	ble	e594 <_vfiprintf_r+0x4ec>
    e554:	e28c0001 	add	r0, ip, #1
    e558:	e59f1e38 	ldr	r1, [pc, #3640]	; f398 <_vfiprintf_r+0x12f0>
    e55c:	e2822010 	add	r2, r2, #16
    e560:	e3500007 	cmp	r0, #7
    e564:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e568:	e88e0022 	stm	lr, {r1, r5}
    e56c:	e58d0040 	str	r0, [sp, #64]	; 0x40
    e570:	dafffff1 	ble	e53c <_vfiprintf_r+0x494>
    e574:	e3520000 	cmp	r2, #0
    e578:	1a00015b 	bne	eaec <_vfiprintf_r+0xa44>
    e57c:	e2444010 	sub	r4, r4, #16
    e580:	e3540010 	cmp	r4, #16
    e584:	e1a0c006 	mov	ip, r6
    e588:	e1a01003 	mov	r1, r3
    e58c:	e1a0e008 	mov	lr, r8
    e590:	caffffef 	bgt	e554 <_vfiprintf_r+0x4ac>
    e594:	e1a0700b 	mov	r7, fp
    e598:	e1a0b00e 	mov	fp, lr
    e59c:	e59f3df4 	ldr	r3, [pc, #3572]	; f398 <_vfiprintf_r+0x12f0>
    e5a0:	e3510007 	cmp	r1, #7
    e5a4:	e0842002 	add	r2, r4, r2
    e5a8:	e88b0018 	stm	fp, {r3, r4}
    e5ac:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e5b0:	e58d1040 	str	r1, [sp, #64]	; 0x40
    e5b4:	d28bb008 	addle	fp, fp, #8
    e5b8:	d2810001 	addle	r0, r1, #1
    e5bc:	da000161 	ble	eb48 <_vfiprintf_r+0xaa0>
    e5c0:	e3520000 	cmp	r2, #0
    e5c4:	1a000155 	bne	eb20 <_vfiprintf_r+0xa78>
    e5c8:	e5dd1037 	ldrb	r1, [sp, #55]	; 0x37
    e5cc:	e3510000 	cmp	r1, #0
    e5d0:	0a0002fb 	beq	f1c4 <_vfiprintf_r+0x111c>
    e5d4:	e3a02001 	mov	r2, #1
    e5d8:	e1a0b008 	mov	fp, r8
    e5dc:	e1a00002 	mov	r0, r2
    e5e0:	e28d1037 	add	r1, sp, #55	; 0x37
    e5e4:	e58d2074 	str	r2, [sp, #116]	; 0x74
    e5e8:	e58d1070 	str	r1, [sp, #112]	; 0x70
    e5ec:	e1a01000 	mov	r1, r0
    e5f0:	e28bb008 	add	fp, fp, #8
    e5f4:	e2800001 	add	r0, r0, #1
    e5f8:	e59d3020 	ldr	r3, [sp, #32]
    e5fc:	e3530000 	cmp	r3, #0
    e600:	0a00016a 	beq	ebb0 <_vfiprintf_r+0xb08>
    e604:	e3a01002 	mov	r1, #2
    e608:	e28d3038 	add	r3, sp, #56	; 0x38
    e60c:	e0822001 	add	r2, r2, r1
    e610:	e3500007 	cmp	r0, #7
    e614:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e618:	e58d0040 	str	r0, [sp, #64]	; 0x40
    e61c:	e58b1004 	str	r1, [fp, #4]
    e620:	e58b3000 	str	r3, [fp]
    e624:	da00015e 	ble	eba4 <_vfiprintf_r+0xafc>
    e628:	e3520000 	cmp	r2, #0
    e62c:	1a000292 	bne	f07c <_vfiprintf_r+0xfd4>
    e630:	e3560080 	cmp	r6, #128	; 0x80
    e634:	e3a00001 	mov	r0, #1
    e638:	e3a01000 	mov	r1, #0
    e63c:	e1a0b008 	mov	fp, r8
    e640:	1a00015c 	bne	ebb8 <_vfiprintf_r+0xb10>
    e644:	e59d301c 	ldr	r3, [sp, #28]
    e648:	e0434007 	sub	r4, r3, r7
    e64c:	e3540000 	cmp	r4, #0
    e650:	da000158 	ble	ebb8 <_vfiprintf_r+0xb10>
    e654:	e3540010 	cmp	r4, #16
    e658:	da00033b 	ble	f34c <_vfiprintf_r+0x12a4>
    e65c:	e1a0e00b 	mov	lr, fp
    e660:	e3a05010 	mov	r5, #16
    e664:	e1a0b007 	mov	fp, r7
    e668:	e3a06001 	mov	r6, #1
    e66c:	e1a07004 	mov	r7, r4
    e670:	e59d4014 	ldr	r4, [sp, #20]
    e674:	ea000005 	b	e690 <_vfiprintf_r+0x5e8>
    e678:	e281c002 	add	ip, r1, #2
    e67c:	e1a01000 	mov	r1, r0
    e680:	e28ee008 	add	lr, lr, #8
    e684:	e2477010 	sub	r7, r7, #16
    e688:	e3570010 	cmp	r7, #16
    e68c:	da00000f 	ble	e6d0 <_vfiprintf_r+0x628>
    e690:	e2810001 	add	r0, r1, #1
    e694:	e59f3d00 	ldr	r3, [pc, #3328]	; f39c <_vfiprintf_r+0x12f4>
    e698:	e2822010 	add	r2, r2, #16
    e69c:	e3500007 	cmp	r0, #7
    e6a0:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e6a4:	e88e0028 	stm	lr, {r3, r5}
    e6a8:	e58d0040 	str	r0, [sp, #64]	; 0x40
    e6ac:	dafffff1 	ble	e678 <_vfiprintf_r+0x5d0>
    e6b0:	e3520000 	cmp	r2, #0
    e6b4:	1a000206 	bne	eed4 <_vfiprintf_r+0xe2c>
    e6b8:	e2477010 	sub	r7, r7, #16
    e6bc:	e3570010 	cmp	r7, #16
    e6c0:	e1a0c006 	mov	ip, r6
    e6c4:	e3a01000 	mov	r1, #0
    e6c8:	e1a0e008 	mov	lr, r8
    e6cc:	caffffef 	bgt	e690 <_vfiprintf_r+0x5e8>
    e6d0:	e1a04007 	mov	r4, r7
    e6d4:	e1a0700b 	mov	r7, fp
    e6d8:	e1a0b00e 	mov	fp, lr
    e6dc:	e59f3cb8 	ldr	r3, [pc, #3256]	; f39c <_vfiprintf_r+0x12f4>
    e6e0:	e0822004 	add	r2, r2, r4
    e6e4:	e35c0007 	cmp	ip, #7
    e6e8:	e58d2044 	str	r2, [sp, #68]	; 0x44
    e6ec:	e88b0018 	stm	fp, {r3, r4}
    e6f0:	e58dc040 	str	ip, [sp, #64]	; 0x40
    e6f4:	ca00026b 	bgt	f0a8 <_vfiprintf_r+0x1000>
    e6f8:	e28bb008 	add	fp, fp, #8
    e6fc:	e28c0001 	add	r0, ip, #1
    e700:	e1a0100c 	mov	r1, ip
    e704:	ea00012b 	b	ebb8 <_vfiprintf_r+0xb10>
    e708:	e58d001c 	str	r0, [sp, #28]
    e70c:	e3150020 	tst	r5, #32
    e710:	1a000283 	bne	f124 <_vfiprintf_r+0x107c>
    e714:	e59d2018 	ldr	r2, [sp, #24]
    e718:	e3150010 	tst	r5, #16
    e71c:	e1a03002 	mov	r3, r2
    e720:	1a00023a 	bne	f010 <_vfiprintf_r+0xf68>
    e724:	e3150040 	tst	r5, #64	; 0x40
    e728:	0a000238 	beq	f010 <_vfiprintf_r+0xf68>
    e72c:	e1d260b0 	ldrh	r6, [r2]
    e730:	e2822004 	add	r2, r2, #4
    e734:	e3a03000 	mov	r3, #0
    e738:	e58d2018 	str	r2, [sp, #24]
    e73c:	e3a07000 	mov	r7, #0
    e740:	eaffff4e 	b	e480 <_vfiprintf_r+0x3d8>
    e744:	e58d001c 	str	r0, [sp, #28]
    e748:	e3855010 	orr	r5, r5, #16
    e74c:	eaffffee 	b	e70c <_vfiprintf_r+0x664>
    e750:	e58d001c 	str	r0, [sp, #28]
    e754:	e3855010 	orr	r5, r5, #16
    e758:	eaffff3b 	b	e44c <_vfiprintf_r+0x3a4>
    e75c:	e3a03078 	mov	r3, #120	; 0x78
    e760:	e3a02030 	mov	r2, #48	; 0x30
    e764:	e59d1018 	ldr	r1, [sp, #24]
    e768:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    e76c:	e2813004 	add	r3, r1, #4
    e770:	e58d3018 	str	r3, [sp, #24]
    e774:	e59f3c24 	ldr	r3, [pc, #3108]	; f3a0 <_vfiprintf_r+0x12f8>
    e778:	e58d001c 	str	r0, [sp, #28]
    e77c:	e58d302c 	str	r3, [sp, #44]	; 0x2c
    e780:	e5916000 	ldr	r6, [r1]
    e784:	e3855002 	orr	r5, r5, #2
    e788:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    e78c:	e3a07000 	mov	r7, #0
    e790:	e3a03002 	mov	r3, #2
    e794:	eaffff39 	b	e480 <_vfiprintf_r+0x3d8>
    e798:	e3855020 	orr	r5, r5, #32
    e79c:	e5d93000 	ldrb	r3, [r9]
    e7a0:	eafffe97 	b	e204 <_vfiprintf_r+0x15c>
    e7a4:	e59d3018 	ldr	r3, [sp, #24]
    e7a8:	e5932000 	ldr	r2, [r3]
    e7ac:	e58d2024 	str	r2, [sp, #36]	; 0x24
    e7b0:	e3520000 	cmp	r2, #0
    e7b4:	e3a02000 	mov	r2, #0
    e7b8:	e58d001c 	str	r0, [sp, #28]
    e7bc:	e5cd2037 	strb	r2, [sp, #55]	; 0x37
    e7c0:	e2834004 	add	r4, r3, #4
    e7c4:	0a0002d1 	beq	f310 <_vfiprintf_r+0x1268>
    e7c8:	e37a0001 	cmn	sl, #1
    e7cc:	0a0002b8 	beq	f2b4 <_vfiprintf_r+0x120c>
    e7d0:	e59d6024 	ldr	r6, [sp, #36]	; 0x24
    e7d4:	e1a0200a 	mov	r2, sl
    e7d8:	e3a01000 	mov	r1, #0
    e7dc:	e1a00006 	mov	r0, r6
    e7e0:	eb000aef 	bl	113a4 <memchr>
    e7e4:	e3500000 	cmp	r0, #0
    e7e8:	0a0002d1 	beq	f334 <_vfiprintf_r+0x128c>
    e7ec:	e0403006 	sub	r3, r0, r6
    e7f0:	e58d4018 	str	r4, [sp, #24]
    e7f4:	e58d3010 	str	r3, [sp, #16]
    e7f8:	e58d5004 	str	r5, [sp, #4]
    e7fc:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    e800:	e3a0a000 	mov	sl, #0
    e804:	eaffff31 	b	e4d0 <_vfiprintf_r+0x428>
    e808:	e5d93000 	ldrb	r3, [r9]
    e80c:	e353002a 	cmp	r3, #42	; 0x2a
    e810:	e289a001 	add	sl, r9, #1
    e814:	0a0002d5 	beq	f370 <_vfiprintf_r+0x12c8>
    e818:	e2432030 	sub	r2, r3, #48	; 0x30
    e81c:	e3520009 	cmp	r2, #9
    e820:	e1a0900a 	mov	r9, sl
    e824:	e3a0a000 	mov	sl, #0
    e828:	8afffe76 	bhi	e208 <_vfiprintf_r+0x160>
    e82c:	e4d93001 	ldrb	r3, [r9], #1
    e830:	e08aa10a 	add	sl, sl, sl, lsl #2
    e834:	e082a08a 	add	sl, r2, sl, lsl #1
    e838:	e2432030 	sub	r2, r3, #48	; 0x30
    e83c:	e3520009 	cmp	r2, #9
    e840:	9afffff9 	bls	e82c <_vfiprintf_r+0x784>
    e844:	eafffe6f 	b	e208 <_vfiprintf_r+0x160>
    e848:	e3855040 	orr	r5, r5, #64	; 0x40
    e84c:	e5d93000 	ldrb	r3, [r9]
    e850:	eafffe6b 	b	e204 <_vfiprintf_r+0x15c>
    e854:	e5d93000 	ldrb	r3, [r9]
    e858:	e353006c 	cmp	r3, #108	; 0x6c
    e85c:	05d93001 	ldrbeq	r3, [r9, #1]
    e860:	03855020 	orreq	r5, r5, #32
    e864:	02899001 	addeq	r9, r9, #1
    e868:	13855010 	orrne	r5, r5, #16
    e86c:	eafffe64 	b	e204 <_vfiprintf_r+0x15c>
    e870:	e5d93000 	ldrb	r3, [r9]
    e874:	e1a0100e 	mov	r1, lr
    e878:	e1a0c004 	mov	ip, r4
    e87c:	eafffe60 	b	e204 <_vfiprintf_r+0x15c>
    e880:	e3855080 	orr	r5, r5, #128	; 0x80
    e884:	e5d93000 	ldrb	r3, [r9]
    e888:	eafffe5d 	b	e204 <_vfiprintf_r+0x15c>
    e88c:	e3a00000 	mov	r0, #0
    e890:	e2432030 	sub	r2, r3, #48	; 0x30
    e894:	e4d93001 	ldrb	r3, [r9], #1
    e898:	e0800100 	add	r0, r0, r0, lsl #2
    e89c:	e0820080 	add	r0, r2, r0, lsl #1
    e8a0:	e2432030 	sub	r2, r3, #48	; 0x30
    e8a4:	e3520009 	cmp	r2, #9
    e8a8:	9afffff9 	bls	e894 <_vfiprintf_r+0x7ec>
    e8ac:	eafffe55 	b	e208 <_vfiprintf_r+0x160>
    e8b0:	e3510000 	cmp	r1, #0
    e8b4:	e58d001c 	str	r0, [sp, #28]
    e8b8:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    e8bc:	e3855010 	orr	r5, r5, #16
    e8c0:	e3150020 	tst	r5, #32
    e8c4:	1a0001ff 	bne	f0c8 <_vfiprintf_r+0x1020>
    e8c8:	e3150010 	tst	r5, #16
    e8cc:	1a00025a 	bne	f23c <_vfiprintf_r+0x1194>
    e8d0:	e3150040 	tst	r5, #64	; 0x40
    e8d4:	0a000241 	beq	f1e0 <_vfiprintf_r+0x1138>
    e8d8:	e59d3018 	ldr	r3, [sp, #24]
    e8dc:	e1d360f0 	ldrsh	r6, [r3]
    e8e0:	e2833004 	add	r3, r3, #4
    e8e4:	e1a07fc6 	asr	r7, r6, #31
    e8e8:	e58d3018 	str	r3, [sp, #24]
    e8ec:	e1a02006 	mov	r2, r6
    e8f0:	e1a03007 	mov	r3, r7
    e8f4:	e3520000 	cmp	r2, #0
    e8f8:	e2d33000 	sbcs	r3, r3, #0
    e8fc:	ba000229 	blt	f1a8 <_vfiprintf_r+0x1100>
    e900:	e37a0001 	cmn	sl, #1
    e904:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    e908:	e3a03001 	mov	r3, #1
    e90c:	1afffee0 	bne	e494 <_vfiprintf_r+0x3ec>
    e910:	e3530001 	cmp	r3, #1
    e914:	0a000180 	beq	ef1c <_vfiprintf_r+0xe74>
    e918:	e3530002 	cmp	r3, #2
    e91c:	11a01008 	movne	r1, r8
    e920:	1a000153 	bne	ee74 <_vfiprintf_r+0xdcc>
    e924:	e1a02008 	mov	r2, r8
    e928:	e59dc02c 	ldr	ip, [sp, #44]	; 0x2c
    e92c:	e1a03226 	lsr	r3, r6, #4
    e930:	e1833e07 	orr	r3, r3, r7, lsl #28
    e934:	e1a00227 	lsr	r0, r7, #4
    e938:	e206100f 	and	r1, r6, #15
    e93c:	e1a07000 	mov	r7, r0
    e940:	e1a06003 	mov	r6, r3
    e944:	e7dc3001 	ldrb	r3, [ip, r1]
    e948:	e1961007 	orrs	r1, r6, r7
    e94c:	e5623001 	strb	r3, [r2, #-1]!
    e950:	1afffff5 	bne	e92c <_vfiprintf_r+0x884>
    e954:	e0483002 	sub	r3, r8, r2
    e958:	e58d2024 	str	r2, [sp, #36]	; 0x24
    e95c:	e58d5004 	str	r5, [sp, #4]
    e960:	e58d3010 	str	r3, [sp, #16]
    e964:	eafffed9 	b	e4d0 <_vfiprintf_r+0x428>
    e968:	e3510000 	cmp	r1, #0
    e96c:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    e970:	e3150020 	tst	r5, #32
    e974:	1a00023d 	bne	f270 <_vfiprintf_r+0x11c8>
    e978:	e3150010 	tst	r5, #16
    e97c:	1a000053 	bne	ead0 <_vfiprintf_r+0xa28>
    e980:	e3150040 	tst	r5, #64	; 0x40
    e984:	0a000051 	beq	ead0 <_vfiprintf_r+0xa28>
    e988:	e59d2018 	ldr	r2, [sp, #24]
    e98c:	e5923000 	ldr	r3, [r2]
    e990:	e2822004 	add	r2, r2, #4
    e994:	e58d2018 	str	r2, [sp, #24]
    e998:	e1dd20b8 	ldrh	r2, [sp, #8]
    e99c:	e1c320b0 	strh	r2, [r3]
    e9a0:	eafffdee 	b	e160 <_vfiprintf_r+0xb8>
    e9a4:	e3510000 	cmp	r1, #0
    e9a8:	e58d001c 	str	r0, [sp, #28]
    e9ac:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    e9b0:	eaffffc2 	b	e8c0 <_vfiprintf_r+0x818>
    e9b4:	e59f29e8 	ldr	r2, [pc, #2536]	; f3a4 <_vfiprintf_r+0x12fc>
    e9b8:	e3510000 	cmp	r1, #0
    e9bc:	e58d001c 	str	r0, [sp, #28]
    e9c0:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    e9c4:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    e9c8:	e3150020 	tst	r5, #32
    e9cc:	e59d2018 	ldr	r2, [sp, #24]
    e9d0:	1a0001c5 	bne	f0ec <_vfiprintf_r+0x1044>
    e9d4:	e3150010 	tst	r5, #16
    e9d8:	1a00021a 	bne	f248 <_vfiprintf_r+0x11a0>
    e9dc:	e3150040 	tst	r5, #64	; 0x40
    e9e0:	13a07000 	movne	r7, #0
    e9e4:	03a07000 	moveq	r7, #0
    e9e8:	11d260b0 	ldrhne	r6, [r2]
    e9ec:	05926000 	ldreq	r6, [r2]
    e9f0:	12822004 	addne	r2, r2, #4
    e9f4:	02822004 	addeq	r2, r2, #4
    e9f8:	158d2018 	strne	r2, [sp, #24]
    e9fc:	058d2018 	streq	r2, [sp, #24]
    ea00:	e3150001 	tst	r5, #1
    ea04:	0a00016e 	beq	efc4 <_vfiprintf_r+0xf1c>
    ea08:	e1962007 	orrs	r2, r6, r7
    ea0c:	0a00016c 	beq	efc4 <_vfiprintf_r+0xf1c>
    ea10:	e3a02030 	mov	r2, #48	; 0x30
    ea14:	e5cd3039 	strb	r3, [sp, #57]	; 0x39
    ea18:	e3855002 	orr	r5, r5, #2
    ea1c:	e5cd2038 	strb	r2, [sp, #56]	; 0x38
    ea20:	e3a03002 	mov	r3, #2
    ea24:	eafffe95 	b	e480 <_vfiprintf_r+0x3d8>
    ea28:	e3a07001 	mov	r7, #1
    ea2c:	e3a01000 	mov	r1, #0
    ea30:	e59d2018 	ldr	r2, [sp, #24]
    ea34:	e5923000 	ldr	r3, [r2]
    ea38:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    ea3c:	e2823004 	add	r3, r2, #4
    ea40:	e58d3018 	str	r3, [sp, #24]
    ea44:	e28d3048 	add	r3, sp, #72	; 0x48
    ea48:	e58d001c 	str	r0, [sp, #28]
    ea4c:	e5cd1037 	strb	r1, [sp, #55]	; 0x37
    ea50:	e58d7010 	str	r7, [sp, #16]
    ea54:	e58d3024 	str	r3, [sp, #36]	; 0x24
    ea58:	e58d5004 	str	r5, [sp, #4]
    ea5c:	e3a0a000 	mov	sl, #0
    ea60:	eafffea0 	b	e4e8 <_vfiprintf_r+0x440>
    ea64:	e3855001 	orr	r5, r5, #1
    ea68:	e5d93000 	ldrb	r3, [r9]
    ea6c:	eafffde4 	b	e204 <_vfiprintf_r+0x15c>
    ea70:	e59f2928 	ldr	r2, [pc, #2344]	; f3a0 <_vfiprintf_r+0x12f8>
    ea74:	e3510000 	cmp	r1, #0
    ea78:	e58d001c 	str	r0, [sp, #28]
    ea7c:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    ea80:	e58d202c 	str	r2, [sp, #44]	; 0x2c
    ea84:	eaffffcf 	b	e9c8 <_vfiprintf_r+0x920>
    ea88:	e35c0000 	cmp	ip, #0
    ea8c:	e5d93000 	ldrb	r3, [r9]
    ea90:	01a0100e 	moveq	r1, lr
    ea94:	01a0c006 	moveq	ip, r6
    ea98:	eafffdd9 	b	e204 <_vfiprintf_r+0x15c>
    ea9c:	e3510000 	cmp	r1, #0
    eaa0:	15cdc037 	strbne	ip, [sp, #55]	; 0x37
    eaa4:	e3530000 	cmp	r3, #0
    eaa8:	e58d001c 	str	r0, [sp, #28]
    eaac:	0a0001f7 	beq	f290 <_vfiprintf_r+0x11e8>
    eab0:	e5cd3048 	strb	r3, [sp, #72]	; 0x48
    eab4:	e3a03000 	mov	r3, #0
    eab8:	e3a07001 	mov	r7, #1
    eabc:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    eac0:	e28d3048 	add	r3, sp, #72	; 0x48
    eac4:	e58d7010 	str	r7, [sp, #16]
    eac8:	e58d3024 	str	r3, [sp, #36]	; 0x24
    eacc:	eaffffe1 	b	ea58 <_vfiprintf_r+0x9b0>
    ead0:	e59d2018 	ldr	r2, [sp, #24]
    ead4:	e5923000 	ldr	r3, [r2]
    ead8:	e2822004 	add	r2, r2, #4
    eadc:	e58d2018 	str	r2, [sp, #24]
    eae0:	e59d2008 	ldr	r2, [sp, #8]
    eae4:	e5832000 	str	r2, [r3]
    eae8:	eafffd9c 	b	e160 <_vfiprintf_r+0xb8>
    eaec:	e28d203c 	add	r2, sp, #60	; 0x3c
    eaf0:	e59d100c 	ldr	r1, [sp, #12]
    eaf4:	e1a00007 	mov	r0, r7
    eaf8:	e58d3028 	str	r3, [sp, #40]	; 0x28
    eafc:	ebfffd37 	bl	dfe0 <__sprint_r.part.0>
    eb00:	e3500000 	cmp	r0, #0
    eb04:	1a000114 	bne	ef5c <_vfiprintf_r+0xeb4>
    eb08:	e59dc040 	ldr	ip, [sp, #64]	; 0x40
    eb0c:	e1a0e008 	mov	lr, r8
    eb10:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    eb14:	e28c1001 	add	r1, ip, #1
    eb18:	e59d3028 	ldr	r3, [sp, #40]	; 0x28
    eb1c:	eafffe89 	b	e548 <_vfiprintf_r+0x4a0>
    eb20:	e28d203c 	add	r2, sp, #60	; 0x3c
    eb24:	e59d100c 	ldr	r1, [sp, #12]
    eb28:	e59d0014 	ldr	r0, [sp, #20]
    eb2c:	ebfffd2b 	bl	dfe0 <__sprint_r.part.0>
    eb30:	e3500000 	cmp	r0, #0
    eb34:	1a000108 	bne	ef5c <_vfiprintf_r+0xeb4>
    eb38:	e1a0b008 	mov	fp, r8
    eb3c:	e28d1040 	add	r1, sp, #64	; 0x40
    eb40:	e8910006 	ldm	r1, {r1, r2}
    eb44:	e2810001 	add	r0, r1, #1
    eb48:	e5ddc037 	ldrb	ip, [sp, #55]	; 0x37
    eb4c:	e35c0000 	cmp	ip, #0
    eb50:	0afffea8 	beq	e5f8 <_vfiprintf_r+0x550>
    eb54:	e3a01001 	mov	r1, #1
    eb58:	e28dc037 	add	ip, sp, #55	; 0x37
    eb5c:	e0822001 	add	r2, r2, r1
    eb60:	e3500007 	cmp	r0, #7
    eb64:	e58d2044 	str	r2, [sp, #68]	; 0x44
    eb68:	e58d0040 	str	r0, [sp, #64]	; 0x40
    eb6c:	e58b1004 	str	r1, [fp, #4]
    eb70:	e58bc000 	str	ip, [fp]
    eb74:	dafffe9c 	ble	e5ec <_vfiprintf_r+0x544>
    eb78:	e3520000 	cmp	r2, #0
    eb7c:	1a000133 	bne	f050 <_vfiprintf_r+0xfa8>
    eb80:	e59d3020 	ldr	r3, [sp, #32]
    eb84:	e3530000 	cmp	r3, #0
    eb88:	0afffea8 	beq	e630 <_vfiprintf_r+0x588>
    eb8c:	e3a02002 	mov	r2, #2
    eb90:	e1a00001 	mov	r0, r1
    eb94:	e1a0b008 	mov	fp, r8
    eb98:	e28d3038 	add	r3, sp, #56	; 0x38
    eb9c:	e58d2074 	str	r2, [sp, #116]	; 0x74
    eba0:	e58d3070 	str	r3, [sp, #112]	; 0x70
    eba4:	e1a01000 	mov	r1, r0
    eba8:	e28bb008 	add	fp, fp, #8
    ebac:	e2800001 	add	r0, r0, #1
    ebb0:	e3560080 	cmp	r6, #128	; 0x80
    ebb4:	0afffea2 	beq	e644 <_vfiprintf_r+0x59c>
    ebb8:	e59d3010 	ldr	r3, [sp, #16]
    ebbc:	e04aa003 	sub	sl, sl, r3
    ebc0:	e35a0000 	cmp	sl, #0
    ebc4:	da000057 	ble	ed28 <_vfiprintf_r+0xc80>
    ebc8:	e35a0010 	cmp	sl, #16
    ebcc:	da000019 	ble	ec38 <_vfiprintf_r+0xb90>
    ebd0:	e3a04010 	mov	r4, #16
    ebd4:	e59d5014 	ldr	r5, [sp, #20]
    ebd8:	e59d600c 	ldr	r6, [sp, #12]
    ebdc:	ea000005 	b	ebf8 <_vfiprintf_r+0xb50>
    ebe0:	e2810002 	add	r0, r1, #2
    ebe4:	e1a01003 	mov	r1, r3
    ebe8:	e28bb008 	add	fp, fp, #8
    ebec:	e24aa010 	sub	sl, sl, #16
    ebf0:	e35a0010 	cmp	sl, #16
    ebf4:	da00000f 	ble	ec38 <_vfiprintf_r+0xb90>
    ebf8:	e2813001 	add	r3, r1, #1
    ebfc:	e59f0798 	ldr	r0, [pc, #1944]	; f39c <_vfiprintf_r+0x12f4>
    ec00:	e2822010 	add	r2, r2, #16
    ec04:	e3530007 	cmp	r3, #7
    ec08:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ec0c:	e88b0011 	stm	fp, {r0, r4}
    ec10:	e58d3040 	str	r3, [sp, #64]	; 0x40
    ec14:	dafffff1 	ble	ebe0 <_vfiprintf_r+0xb38>
    ec18:	e3520000 	cmp	r2, #0
    ec1c:	1a00002c 	bne	ecd4 <_vfiprintf_r+0xc2c>
    ec20:	e24aa010 	sub	sl, sl, #16
    ec24:	e35a0010 	cmp	sl, #16
    ec28:	e3a00001 	mov	r0, #1
    ec2c:	e3a01000 	mov	r1, #0
    ec30:	e1a0b008 	mov	fp, r8
    ec34:	caffffef 	bgt	ebf8 <_vfiprintf_r+0xb50>
    ec38:	e59f375c 	ldr	r3, [pc, #1884]	; f39c <_vfiprintf_r+0x12f4>
    ec3c:	e3500007 	cmp	r0, #7
    ec40:	e082200a 	add	r2, r2, sl
    ec44:	e88b0408 	stm	fp, {r3, sl}
    ec48:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ec4c:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ec50:	d28bb008 	addle	fp, fp, #8
    ec54:	d2800001 	addle	r0, r0, #1
    ec58:	da000032 	ble	ed28 <_vfiprintf_r+0xc80>
    ec5c:	e3520000 	cmp	r2, #0
    ec60:	1a000026 	bne	ed00 <_vfiprintf_r+0xc58>
    ec64:	e3a03001 	mov	r3, #1
    ec68:	e1a0b008 	mov	fp, r8
    ec6c:	e59d2010 	ldr	r2, [sp, #16]
    ec70:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    ec74:	e58d2074 	str	r2, [sp, #116]	; 0x74
    ec78:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ec7c:	e58d1070 	str	r1, [sp, #112]	; 0x70
    ec80:	e58d3040 	str	r3, [sp, #64]	; 0x40
    ec84:	e28bb008 	add	fp, fp, #8
    ec88:	e59d3004 	ldr	r3, [sp, #4]
    ec8c:	e3130004 	tst	r3, #4
    ec90:	0a000003 	beq	eca4 <_vfiprintf_r+0xbfc>
    ec94:	e59d301c 	ldr	r3, [sp, #28]
    ec98:	e0434007 	sub	r4, r3, r7
    ec9c:	e3540000 	cmp	r4, #0
    eca0:	ca000033 	bgt	ed74 <_vfiprintf_r+0xccc>
    eca4:	e59d3008 	ldr	r3, [sp, #8]
    eca8:	e59d101c 	ldr	r1, [sp, #28]
    ecac:	e1510007 	cmp	r1, r7
    ecb0:	a0833001 	addge	r3, r3, r1
    ecb4:	b0833007 	addlt	r3, r3, r7
    ecb8:	e3520000 	cmp	r2, #0
    ecbc:	e58d3008 	str	r3, [sp, #8]
    ecc0:	1a00009f 	bne	ef44 <_vfiprintf_r+0xe9c>
    ecc4:	e3a03000 	mov	r3, #0
    ecc8:	e1a0b008 	mov	fp, r8
    eccc:	e58d3040 	str	r3, [sp, #64]	; 0x40
    ecd0:	eafffd22 	b	e160 <_vfiprintf_r+0xb8>
    ecd4:	e28d203c 	add	r2, sp, #60	; 0x3c
    ecd8:	e1a01006 	mov	r1, r6
    ecdc:	e1a00005 	mov	r0, r5
    ece0:	ebfffcbe 	bl	dfe0 <__sprint_r.part.0>
    ece4:	e3500000 	cmp	r0, #0
    ece8:	1a0000f4 	bne	f0c0 <_vfiprintf_r+0x1018>
    ecec:	e28d1040 	add	r1, sp, #64	; 0x40
    ecf0:	e8910006 	ldm	r1, {r1, r2}
    ecf4:	e1a0b008 	mov	fp, r8
    ecf8:	e2810001 	add	r0, r1, #1
    ecfc:	eaffffba 	b	ebec <_vfiprintf_r+0xb44>
    ed00:	e28d203c 	add	r2, sp, #60	; 0x3c
    ed04:	e59d100c 	ldr	r1, [sp, #12]
    ed08:	e59d0014 	ldr	r0, [sp, #20]
    ed0c:	ebfffcb3 	bl	dfe0 <__sprint_r.part.0>
    ed10:	e3500000 	cmp	r0, #0
    ed14:	1a000090 	bne	ef5c <_vfiprintf_r+0xeb4>
    ed18:	e1a0b008 	mov	fp, r8
    ed1c:	e28d0040 	add	r0, sp, #64	; 0x40
    ed20:	e8900005 	ldm	r0, {r0, r2}
    ed24:	e2800001 	add	r0, r0, #1
    ed28:	e59d3010 	ldr	r3, [sp, #16]
    ed2c:	e59d1024 	ldr	r1, [sp, #36]	; 0x24
    ed30:	e0832002 	add	r2, r3, r2
    ed34:	e3500007 	cmp	r0, #7
    ed38:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ed3c:	e88b000a 	stm	fp, {r1, r3}
    ed40:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ed44:	daffffce 	ble	ec84 <_vfiprintf_r+0xbdc>
    ed48:	e3520000 	cmp	r2, #0
    ed4c:	1a00009e 	bne	efcc <_vfiprintf_r+0xf24>
    ed50:	e59d3004 	ldr	r3, [sp, #4]
    ed54:	e3130004 	tst	r3, #4
    ed58:	e58d2040 	str	r2, [sp, #64]	; 0x40
    ed5c:	0a000031 	beq	ee28 <_vfiprintf_r+0xd80>
    ed60:	e59d301c 	ldr	r3, [sp, #28]
    ed64:	e0434007 	sub	r4, r3, r7
    ed68:	e3540000 	cmp	r4, #0
    ed6c:	c1a0b008 	movgt	fp, r8
    ed70:	da00002c 	ble	ee28 <_vfiprintf_r+0xd80>
    ed74:	e3540010 	cmp	r4, #16
    ed78:	d59d0040 	ldrle	r0, [sp, #64]	; 0x40
    ed7c:	d2800001 	addle	r0, r0, #1
    ed80:	da00001f 	ble	ee04 <_vfiprintf_r+0xd5c>
    ed84:	e1a0c00b 	mov	ip, fp
    ed88:	e3a05010 	mov	r5, #16
    ed8c:	e1a0b004 	mov	fp, r4
    ed90:	e3a06001 	mov	r6, #1
    ed94:	e59d1040 	ldr	r1, [sp, #64]	; 0x40
    ed98:	e59da014 	ldr	sl, [sp, #20]
    ed9c:	e59d400c 	ldr	r4, [sp, #12]
    eda0:	ea000005 	b	edbc <_vfiprintf_r+0xd14>
    eda4:	e2810002 	add	r0, r1, #2
    eda8:	e1a01003 	mov	r1, r3
    edac:	e28cc008 	add	ip, ip, #8
    edb0:	e24bb010 	sub	fp, fp, #16
    edb4:	e35b0010 	cmp	fp, #16
    edb8:	da00000f 	ble	edfc <_vfiprintf_r+0xd54>
    edbc:	e2813001 	add	r3, r1, #1
    edc0:	e59f05d0 	ldr	r0, [pc, #1488]	; f398 <_vfiprintf_r+0x12f0>
    edc4:	e2822010 	add	r2, r2, #16
    edc8:	e3530007 	cmp	r3, #7
    edcc:	e58d2044 	str	r2, [sp, #68]	; 0x44
    edd0:	e88c0021 	stm	ip, {r0, r5}
    edd4:	e58d3040 	str	r3, [sp, #64]	; 0x40
    edd8:	dafffff1 	ble	eda4 <_vfiprintf_r+0xcfc>
    eddc:	e3520000 	cmp	r2, #0
    ede0:	1a000017 	bne	ee44 <_vfiprintf_r+0xd9c>
    ede4:	e24bb010 	sub	fp, fp, #16
    ede8:	e35b0010 	cmp	fp, #16
    edec:	e1a00006 	mov	r0, r6
    edf0:	e3a01000 	mov	r1, #0
    edf4:	e1a0c008 	mov	ip, r8
    edf8:	caffffef 	bgt	edbc <_vfiprintf_r+0xd14>
    edfc:	e1a0400b 	mov	r4, fp
    ee00:	e1a0b00c 	mov	fp, ip
    ee04:	e59f358c 	ldr	r3, [pc, #1420]	; f398 <_vfiprintf_r+0x12f0>
    ee08:	e0822004 	add	r2, r2, r4
    ee0c:	e3500007 	cmp	r0, #7
    ee10:	e58d2044 	str	r2, [sp, #68]	; 0x44
    ee14:	e88b0018 	stm	fp, {r3, r4}
    ee18:	e58d0040 	str	r0, [sp, #64]	; 0x40
    ee1c:	daffffa0 	ble	eca4 <_vfiprintf_r+0xbfc>
    ee20:	e3520000 	cmp	r2, #0
    ee24:	1a0000f5 	bne	f200 <_vfiprintf_r+0x1158>
    ee28:	e59d3008 	ldr	r3, [sp, #8]
    ee2c:	e59d201c 	ldr	r2, [sp, #28]
    ee30:	e1520007 	cmp	r2, r7
    ee34:	a0833002 	addge	r3, r3, r2
    ee38:	b0833007 	addlt	r3, r3, r7
    ee3c:	e58d3008 	str	r3, [sp, #8]
    ee40:	eaffff9f 	b	ecc4 <_vfiprintf_r+0xc1c>
    ee44:	e28d203c 	add	r2, sp, #60	; 0x3c
    ee48:	e1a01004 	mov	r1, r4
    ee4c:	e1a0000a 	mov	r0, sl
    ee50:	ebfffc62 	bl	dfe0 <__sprint_r.part.0>
    ee54:	e3500000 	cmp	r0, #0
    ee58:	1a000113 	bne	f2ac <_vfiprintf_r+0x1204>
    ee5c:	e28d1040 	add	r1, sp, #64	; 0x40
    ee60:	e8910006 	ldm	r1, {r1, r2}
    ee64:	e1a0c008 	mov	ip, r8
    ee68:	e2810001 	add	r0, r1, #1
    ee6c:	eaffffcf 	b	edb0 <_vfiprintf_r+0xd08>
    ee70:	e1a01002 	mov	r1, r2
    ee74:	e1a021a6 	lsr	r2, r6, #3
    ee78:	e1822e87 	orr	r2, r2, r7, lsl #29
    ee7c:	e1a001a7 	lsr	r0, r7, #3
    ee80:	e2063007 	and	r3, r6, #7
    ee84:	e1a07000 	mov	r7, r0
    ee88:	e1a06002 	mov	r6, r2
    ee8c:	e2833030 	add	r3, r3, #48	; 0x30
    ee90:	e1962007 	orrs	r2, r6, r7
    ee94:	e5413001 	strb	r3, [r1, #-1]
    ee98:	e2412001 	sub	r2, r1, #1
    ee9c:	1afffff3 	bne	ee70 <_vfiprintf_r+0xdc8>
    eea0:	e3530030 	cmp	r3, #48	; 0x30
    eea4:	03a03000 	moveq	r3, #0
    eea8:	12053001 	andne	r3, r5, #1
    eeac:	e3530000 	cmp	r3, #0
    eeb0:	0a0000e9 	beq	f25c <_vfiprintf_r+0x11b4>
    eeb4:	e3a03030 	mov	r3, #48	; 0x30
    eeb8:	e2411002 	sub	r1, r1, #2
    eebc:	e58d1024 	str	r1, [sp, #36]	; 0x24
    eec0:	e0481001 	sub	r1, r8, r1
    eec4:	e58d5004 	str	r5, [sp, #4]
    eec8:	e58d1010 	str	r1, [sp, #16]
    eecc:	e5423001 	strb	r3, [r2, #-1]
    eed0:	eafffd7e 	b	e4d0 <_vfiprintf_r+0x428>
    eed4:	e28d203c 	add	r2, sp, #60	; 0x3c
    eed8:	e59d100c 	ldr	r1, [sp, #12]
    eedc:	e1a00004 	mov	r0, r4
    eee0:	ebfffc3e 	bl	dfe0 <__sprint_r.part.0>
    eee4:	e3500000 	cmp	r0, #0
    eee8:	1a00001b 	bne	ef5c <_vfiprintf_r+0xeb4>
    eeec:	e28d1040 	add	r1, sp, #64	; 0x40
    eef0:	e8910006 	ldm	r1, {r1, r2}
    eef4:	e1a0e008 	mov	lr, r8
    eef8:	e281c001 	add	ip, r1, #1
    eefc:	eafffde0 	b	e684 <_vfiprintf_r+0x5dc>
    ef00:	e3a03000 	mov	r3, #0
    ef04:	e58d8024 	str	r8, [sp, #36]	; 0x24
    ef08:	e58d3010 	str	r3, [sp, #16]
    ef0c:	eafffd6f 	b	e4d0 <_vfiprintf_r+0x428>
    ef10:	e3530001 	cmp	r3, #1
    ef14:	e1a05002 	mov	r5, r2
    ef18:	1afffe7e 	bne	e918 <_vfiprintf_r+0x870>
    ef1c:	e3570000 	cmp	r7, #0
    ef20:	03560009 	cmpeq	r6, #9
    ef24:	8a000086 	bhi	f144 <_vfiprintf_r+0x109c>
    ef28:	e28d20b0 	add	r2, sp, #176	; 0xb0
    ef2c:	e2866030 	add	r6, r6, #48	; 0x30
    ef30:	e5626041 	strb	r6, [r2, #-65]!	; 0xffffffbf
    ef34:	e58d5004 	str	r5, [sp, #4]
    ef38:	e58d3010 	str	r3, [sp, #16]
    ef3c:	e58d2024 	str	r2, [sp, #36]	; 0x24
    ef40:	eafffd62 	b	e4d0 <_vfiprintf_r+0x428>
    ef44:	e28d203c 	add	r2, sp, #60	; 0x3c
    ef48:	e59d100c 	ldr	r1, [sp, #12]
    ef4c:	e59d0014 	ldr	r0, [sp, #20]
    ef50:	ebfffc22 	bl	dfe0 <__sprint_r.part.0>
    ef54:	e3500000 	cmp	r0, #0
    ef58:	0affff59 	beq	ecc4 <_vfiprintf_r+0xc1c>
    ef5c:	e59da00c 	ldr	sl, [sp, #12]
    ef60:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    ef64:	e3130001 	tst	r3, #1
    ef68:	e1da30bc 	ldrh	r3, [sl, #12]
    ef6c:	1a000001 	bne	ef78 <_vfiprintf_r+0xed0>
    ef70:	e3130c02 	tst	r3, #512	; 0x200
    ef74:	0a000031 	beq	f040 <_vfiprintf_r+0xf98>
    ef78:	e3130040 	tst	r3, #64	; 0x40
    ef7c:	0afffd21 	beq	e408 <_vfiprintf_r+0x360>
    ef80:	e3e03000 	mvn	r3, #0
    ef84:	e58d3008 	str	r3, [sp, #8]
    ef88:	e59d0008 	ldr	r0, [sp, #8]
    ef8c:	e28dd0b4 	add	sp, sp, #180	; 0xb4
    ef90:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ef94:	e12fff1e 	bx	lr
    ef98:	e59a3064 	ldr	r3, [sl, #100]	; 0x64
    ef9c:	e3130001 	tst	r3, #1
    efa0:	1afffff6 	bne	ef80 <_vfiprintf_r+0xed8>
    efa4:	e1da30bc 	ldrh	r3, [sl, #12]
    efa8:	e3130c02 	tst	r3, #512	; 0x200
    efac:	1afffff3 	bne	ef80 <_vfiprintf_r+0xed8>
    efb0:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    efb4:	eb00068e 	bl	109f4 <__retarget_lock_release_recursive>
    efb8:	e3e03000 	mvn	r3, #0
    efbc:	e58d3008 	str	r3, [sp, #8]
    efc0:	eafffd10 	b	e408 <_vfiprintf_r+0x360>
    efc4:	e3a03002 	mov	r3, #2
    efc8:	eafffd2c 	b	e480 <_vfiprintf_r+0x3d8>
    efcc:	e28d203c 	add	r2, sp, #60	; 0x3c
    efd0:	e59d100c 	ldr	r1, [sp, #12]
    efd4:	e59d0014 	ldr	r0, [sp, #20]
    efd8:	ebfffc00 	bl	dfe0 <__sprint_r.part.0>
    efdc:	e3500000 	cmp	r0, #0
    efe0:	1affffdd 	bne	ef5c <_vfiprintf_r+0xeb4>
    efe4:	e1a0b008 	mov	fp, r8
    efe8:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    efec:	eaffff25 	b	ec88 <_vfiprintf_r+0xbe0>
    eff0:	e28d203c 	add	r2, sp, #60	; 0x3c
    eff4:	e59d100c 	ldr	r1, [sp, #12]
    eff8:	e59d0014 	ldr	r0, [sp, #20]
    effc:	ebfffbf7 	bl	dfe0 <__sprint_r.part.0>
    f000:	e3500000 	cmp	r0, #0
    f004:	1affffd4 	bne	ef5c <_vfiprintf_r+0xeb4>
    f008:	e1a0b008 	mov	fp, r8
    f00c:	eafffc69 	b	e1b8 <_vfiprintf_r+0x110>
    f010:	e2822004 	add	r2, r2, #4
    f014:	e5936000 	ldr	r6, [r3]
    f018:	e3a07000 	mov	r7, #0
    f01c:	e3a03000 	mov	r3, #0
    f020:	e58d2018 	str	r2, [sp, #24]
    f024:	eafffd15 	b	e480 <_vfiprintf_r+0x3d8>
    f028:	e2822004 	add	r2, r2, #4
    f02c:	e5936000 	ldr	r6, [r3]
    f030:	e3a07000 	mov	r7, #0
    f034:	e3a03001 	mov	r3, #1
    f038:	e58d2018 	str	r2, [sp, #24]
    f03c:	eafffd0f 	b	e480 <_vfiprintf_r+0x3d8>
    f040:	e59a0058 	ldr	r0, [sl, #88]	; 0x58
    f044:	eb00066a 	bl	109f4 <__retarget_lock_release_recursive>
    f048:	e1da30bc 	ldrh	r3, [sl, #12]
    f04c:	eaffffc9 	b	ef78 <_vfiprintf_r+0xed0>
    f050:	e28d203c 	add	r2, sp, #60	; 0x3c
    f054:	e59d100c 	ldr	r1, [sp, #12]
    f058:	e59d0014 	ldr	r0, [sp, #20]
    f05c:	ebfffbdf 	bl	dfe0 <__sprint_r.part.0>
    f060:	e3500000 	cmp	r0, #0
    f064:	1affffbc 	bne	ef5c <_vfiprintf_r+0xeb4>
    f068:	e28d1040 	add	r1, sp, #64	; 0x40
    f06c:	e8910006 	ldm	r1, {r1, r2}
    f070:	e1a0b008 	mov	fp, r8
    f074:	e2810001 	add	r0, r1, #1
    f078:	eafffd5e 	b	e5f8 <_vfiprintf_r+0x550>
    f07c:	e28d203c 	add	r2, sp, #60	; 0x3c
    f080:	e59d100c 	ldr	r1, [sp, #12]
    f084:	e59d0014 	ldr	r0, [sp, #20]
    f088:	ebfffbd4 	bl	dfe0 <__sprint_r.part.0>
    f08c:	e3500000 	cmp	r0, #0
    f090:	1affffb1 	bne	ef5c <_vfiprintf_r+0xeb4>
    f094:	e28d1040 	add	r1, sp, #64	; 0x40
    f098:	e8910006 	ldm	r1, {r1, r2}
    f09c:	e1a0b008 	mov	fp, r8
    f0a0:	e2810001 	add	r0, r1, #1
    f0a4:	eafffec1 	b	ebb0 <_vfiprintf_r+0xb08>
    f0a8:	e3520000 	cmp	r2, #0
    f0ac:	1a000088 	bne	f2d4 <_vfiprintf_r+0x122c>
    f0b0:	e3a00001 	mov	r0, #1
    f0b4:	e3a01000 	mov	r1, #0
    f0b8:	e1a0b008 	mov	fp, r8
    f0bc:	eafffebd 	b	ebb8 <_vfiprintf_r+0xb10>
    f0c0:	e1a0a006 	mov	sl, r6
    f0c4:	eaffffa5 	b	ef60 <_vfiprintf_r+0xeb8>
    f0c8:	e59d3018 	ldr	r3, [sp, #24]
    f0cc:	e2833007 	add	r3, r3, #7
    f0d0:	e3c31007 	bic	r1, r3, #7
    f0d4:	e891000c 	ldm	r1, {r2, r3}
    f0d8:	e2811008 	add	r1, r1, #8
    f0dc:	e58d1018 	str	r1, [sp, #24]
    f0e0:	e1a06002 	mov	r6, r2
    f0e4:	e1a07003 	mov	r7, r3
    f0e8:	eafffe01 	b	e8f4 <_vfiprintf_r+0x84c>
    f0ec:	e2822007 	add	r2, r2, #7
    f0f0:	e3c22007 	bic	r2, r2, #7
    f0f4:	e2821008 	add	r1, r2, #8
    f0f8:	e58d1018 	str	r1, [sp, #24]
    f0fc:	e89200c0 	ldm	r2, {r6, r7}
    f100:	eafffe3e 	b	ea00 <_vfiprintf_r+0x958>
    f104:	e59d3018 	ldr	r3, [sp, #24]
    f108:	e2833007 	add	r3, r3, #7
    f10c:	e3c33007 	bic	r3, r3, #7
    f110:	e2832008 	add	r2, r3, #8
    f114:	e89300c0 	ldm	r3, {r6, r7}
    f118:	e58d2018 	str	r2, [sp, #24]
    f11c:	e3a03001 	mov	r3, #1
    f120:	eafffcd6 	b	e480 <_vfiprintf_r+0x3d8>
    f124:	e59d3018 	ldr	r3, [sp, #24]
    f128:	e2833007 	add	r3, r3, #7
    f12c:	e3c33007 	bic	r3, r3, #7
    f130:	e2832008 	add	r2, r3, #8
    f134:	e89300c0 	ldm	r3, {r6, r7}
    f138:	e58d2018 	str	r2, [sp, #24]
    f13c:	e3a03000 	mov	r3, #0
    f140:	eafffcce 	b	e480 <_vfiprintf_r+0x3d8>
    f144:	e58d4004 	str	r4, [sp, #4]
    f148:	e1a04008 	mov	r4, r8
    f14c:	e1a00006 	mov	r0, r6
    f150:	e1a01007 	mov	r1, r7
    f154:	e3a0200a 	mov	r2, #10
    f158:	e3a03000 	mov	r3, #0
    f15c:	eb000ccc 	bl	12494 <__aeabi_uldivmod>
    f160:	e2822030 	add	r2, r2, #48	; 0x30
    f164:	e5642001 	strb	r2, [r4, #-1]!
    f168:	e1a00006 	mov	r0, r6
    f16c:	e1a01007 	mov	r1, r7
    f170:	e3a03000 	mov	r3, #0
    f174:	e3a0200a 	mov	r2, #10
    f178:	eb000cc5 	bl	12494 <__aeabi_uldivmod>
    f17c:	e1a06000 	mov	r6, r0
    f180:	e1a07001 	mov	r7, r1
    f184:	e1963007 	orrs	r3, r6, r7
    f188:	1affffef 	bne	f14c <_vfiprintf_r+0x10a4>
    f18c:	e1a03004 	mov	r3, r4
    f190:	e0483003 	sub	r3, r8, r3
    f194:	e58d4024 	str	r4, [sp, #36]	; 0x24
    f198:	e58d3010 	str	r3, [sp, #16]
    f19c:	e59d4004 	ldr	r4, [sp, #4]
    f1a0:	e58d5004 	str	r5, [sp, #4]
    f1a4:	eafffcc9 	b	e4d0 <_vfiprintf_r+0x428>
    f1a8:	e3a0302d 	mov	r3, #45	; 0x2d
    f1ac:	e2766000 	rsbs	r6, r6, #0
    f1b0:	e5cd3037 	strb	r3, [sp, #55]	; 0x37
    f1b4:	e1a04003 	mov	r4, r3
    f1b8:	e2e77000 	rsc	r7, r7, #0
    f1bc:	e3a03001 	mov	r3, #1
    f1c0:	eafffcb1 	b	e48c <_vfiprintf_r+0x3e4>
    f1c4:	e59d3020 	ldr	r3, [sp, #32]
    f1c8:	e3530000 	cmp	r3, #0
    f1cc:	1a000013 	bne	f220 <_vfiprintf_r+0x1178>
    f1d0:	e3a01000 	mov	r1, #0
    f1d4:	e3a00001 	mov	r0, #1
    f1d8:	e1a0b008 	mov	fp, r8
    f1dc:	eafffe75 	b	ebb8 <_vfiprintf_r+0xb10>
    f1e0:	e59d1018 	ldr	r1, [sp, #24]
    f1e4:	e5916000 	ldr	r6, [r1]
    f1e8:	e2811004 	add	r1, r1, #4
    f1ec:	e1a07fc6 	asr	r7, r6, #31
    f1f0:	e1a02006 	mov	r2, r6
    f1f4:	e1a03007 	mov	r3, r7
    f1f8:	e58d1018 	str	r1, [sp, #24]
    f1fc:	eafffdbc 	b	e8f4 <_vfiprintf_r+0x84c>
    f200:	e28d203c 	add	r2, sp, #60	; 0x3c
    f204:	e59d100c 	ldr	r1, [sp, #12]
    f208:	e59d0014 	ldr	r0, [sp, #20]
    f20c:	ebfffb73 	bl	dfe0 <__sprint_r.part.0>
    f210:	e3500000 	cmp	r0, #0
    f214:	1affff50 	bne	ef5c <_vfiprintf_r+0xeb4>
    f218:	e59d2044 	ldr	r2, [sp, #68]	; 0x44
    f21c:	eafffea0 	b	eca4 <_vfiprintf_r+0xbfc>
    f220:	e3a02002 	mov	r2, #2
    f224:	e28d3038 	add	r3, sp, #56	; 0x38
    f228:	e58d2074 	str	r2, [sp, #116]	; 0x74
    f22c:	e58d3070 	str	r3, [sp, #112]	; 0x70
    f230:	e3a00001 	mov	r0, #1
    f234:	e1a0b008 	mov	fp, r8
    f238:	eafffe59 	b	eba4 <_vfiprintf_r+0xafc>
    f23c:	e59d3018 	ldr	r3, [sp, #24]
    f240:	e5936000 	ldr	r6, [r3]
    f244:	eafffda5 	b	e8e0 <_vfiprintf_r+0x838>
    f248:	e5926000 	ldr	r6, [r2]
    f24c:	e2822004 	add	r2, r2, #4
    f250:	e58d2018 	str	r2, [sp, #24]
    f254:	e3a07000 	mov	r7, #0
    f258:	eafffde8 	b	ea00 <_vfiprintf_r+0x958>
    f25c:	e0483002 	sub	r3, r8, r2
    f260:	e58d5004 	str	r5, [sp, #4]
    f264:	e58d3010 	str	r3, [sp, #16]
    f268:	e58d2024 	str	r2, [sp, #36]	; 0x24
    f26c:	eafffc97 	b	e4d0 <_vfiprintf_r+0x428>
    f270:	e59d3018 	ldr	r3, [sp, #24]
    f274:	e59d2008 	ldr	r2, [sp, #8]
    f278:	e5931000 	ldr	r1, [r3]
    f27c:	e2833004 	add	r3, r3, #4
    f280:	e58d3018 	str	r3, [sp, #24]
    f284:	e1a03fc2 	asr	r3, r2, #31
    f288:	e881000c 	stm	r1, {r2, r3}
    f28c:	eafffbb3 	b	e160 <_vfiprintf_r+0xb8>
    f290:	e59d3044 	ldr	r3, [sp, #68]	; 0x44
    f294:	e3530000 	cmp	r3, #0
    f298:	e59da00c 	ldr	sl, [sp, #12]
    f29c:	1a00002c 	bne	f354 <_vfiprintf_r+0x12ac>
    f2a0:	e3a03000 	mov	r3, #0
    f2a4:	e58d3040 	str	r3, [sp, #64]	; 0x40
    f2a8:	eaffff2c 	b	ef60 <_vfiprintf_r+0xeb8>
    f2ac:	e1a0a004 	mov	sl, r4
    f2b0:	eaffff2a 	b	ef60 <_vfiprintf_r+0xeb8>
    f2b4:	e59d0024 	ldr	r0, [sp, #36]	; 0x24
    f2b8:	e58d4018 	str	r4, [sp, #24]
    f2bc:	e58d5004 	str	r5, [sp, #4]
    f2c0:	ebfffab3 	bl	dd94 <strlen>
    f2c4:	e3a0a000 	mov	sl, #0
    f2c8:	e58d0010 	str	r0, [sp, #16]
    f2cc:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    f2d0:	eafffc7e 	b	e4d0 <_vfiprintf_r+0x428>
    f2d4:	e28d203c 	add	r2, sp, #60	; 0x3c
    f2d8:	e59d100c 	ldr	r1, [sp, #12]
    f2dc:	e59d0014 	ldr	r0, [sp, #20]
    f2e0:	ebfffb3e 	bl	dfe0 <__sprint_r.part.0>
    f2e4:	e3500000 	cmp	r0, #0
    f2e8:	1affff1b 	bne	ef5c <_vfiprintf_r+0xeb4>
    f2ec:	e28d1040 	add	r1, sp, #64	; 0x40
    f2f0:	e8910006 	ldm	r1, {r1, r2}
    f2f4:	e1a0b008 	mov	fp, r8
    f2f8:	e2810001 	add	r0, r1, #1
    f2fc:	eafffe2d 	b	ebb8 <_vfiprintf_r+0xb10>
    f300:	e28d1040 	add	r1, sp, #64	; 0x40
    f304:	e8910006 	ldm	r1, {r1, r2}
    f308:	e2811001 	add	r1, r1, #1
    f30c:	eafffca2 	b	e59c <_vfiprintf_r+0x4f4>
    f310:	e35a0006 	cmp	sl, #6
    f314:	31a0300a 	movcc	r3, sl
    f318:	23a03006 	movcs	r3, #6
    f31c:	e58d3010 	str	r3, [sp, #16]
    f320:	e1a07003 	mov	r7, r3
    f324:	e59f307c 	ldr	r3, [pc, #124]	; f3a8 <_vfiprintf_r+0x1300>
    f328:	e58d4018 	str	r4, [sp, #24]
    f32c:	e58d3024 	str	r3, [sp, #36]	; 0x24
    f330:	eafffdc8 	b	ea58 <_vfiprintf_r+0x9b0>
    f334:	e58da010 	str	sl, [sp, #16]
    f338:	e58d4018 	str	r4, [sp, #24]
    f33c:	e58d5004 	str	r5, [sp, #4]
    f340:	e3a0a000 	mov	sl, #0
    f344:	e5dd4037 	ldrb	r4, [sp, #55]	; 0x37
    f348:	eafffc60 	b	e4d0 <_vfiprintf_r+0x428>
    f34c:	e1a0c000 	mov	ip, r0
    f350:	eafffce1 	b	e6dc <_vfiprintf_r+0x634>
    f354:	e59d0014 	ldr	r0, [sp, #20]
    f358:	e28d203c 	add	r2, sp, #60	; 0x3c
    f35c:	e1a0100a 	mov	r1, sl
    f360:	ebfffb1e 	bl	dfe0 <__sprint_r.part.0>
    f364:	e3500000 	cmp	r0, #0
    f368:	0affffcc 	beq	f2a0 <_vfiprintf_r+0x11f8>
    f36c:	eafffefb 	b	ef60 <_vfiprintf_r+0xeb8>
    f370:	e59d2018 	ldr	r2, [sp, #24]
    f374:	e58da004 	str	sl, [sp, #4]
    f378:	e592a000 	ldr	sl, [r2]
    f37c:	e2822004 	add	r2, r2, #4
    f380:	e15a0007 	cmp	sl, r7
    f384:	e5d93001 	ldrb	r3, [r9, #1]
    f388:	b1a0a007 	movlt	sl, r7
    f38c:	e59d9004 	ldr	r9, [sp, #4]
    f390:	e58d2018 	str	r2, [sp, #24]
    f394:	eafffb9a 	b	e204 <_vfiprintf_r+0x15c>
    f398:	00013004 	.word	0x00013004
    f39c:	00013014 	.word	0x00013014
    f3a0:	00012fe8 	.word	0x00012fe8
    f3a4:	00012fd4 	.word	0x00012fd4
    f3a8:	00012ffc 	.word	0x00012ffc

0000f3ac <vfiprintf>:
    f3ac:	e59fc010 	ldr	ip, [pc, #16]	; f3c4 <vfiprintf+0x18>
    f3b0:	e1a03002 	mov	r3, r2
    f3b4:	e1a02001 	mov	r2, r1
    f3b8:	e1a01000 	mov	r1, r0
    f3bc:	e59c0000 	ldr	r0, [ip]
    f3c0:	eafffb38 	b	e0a8 <_vfiprintf_r>
    f3c4:	0001356c 	.word	0x0001356c

0000f3c8 <__sbprintf>:
    f3c8:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f3cc:	e1a04001 	mov	r4, r1
    f3d0:	e3a0cb01 	mov	ip, #1024	; 0x400
    f3d4:	e3a0e000 	mov	lr, #0
    f3d8:	e1a06002 	mov	r6, r2
    f3dc:	e1a07000 	mov	r7, r0
    f3e0:	e1a08003 	mov	r8, r3
    f3e4:	e24dde46 	sub	sp, sp, #1120	; 0x460
    f3e8:	e1d430be 	ldrh	r3, [r4, #14]
    f3ec:	e24dd008 	sub	sp, sp, #8
    f3f0:	e1d110bc 	ldrh	r1, [r1, #12]
    f3f4:	e1cd30be 	strh	r3, [sp, #14]
    f3f8:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    f3fc:	e594201c 	ldr	r2, [r4, #28]
    f400:	e3c11002 	bic	r1, r1, #2
    f404:	e58d3064 	str	r3, [sp, #100]	; 0x64
    f408:	e5943024 	ldr	r3, [r4, #36]	; 0x24
    f40c:	e1cd10bc 	strh	r1, [sp, #12]
    f410:	e28d0058 	add	r0, sp, #88	; 0x58
    f414:	e28d1068 	add	r1, sp, #104	; 0x68
    f418:	e58dc008 	str	ip, [sp, #8]
    f41c:	e58dc014 	str	ip, [sp, #20]
    f420:	e58d201c 	str	r2, [sp, #28]
    f424:	e58d3024 	str	r3, [sp, #36]	; 0x24
    f428:	e58de018 	str	lr, [sp, #24]
    f42c:	e58d1000 	str	r1, [sp]
    f430:	e58d1010 	str	r1, [sp, #16]
    f434:	eb000564 	bl	109cc <__retarget_lock_init_recursive>
    f438:	e1a02006 	mov	r2, r6
    f43c:	e1a03008 	mov	r3, r8
    f440:	e1a0100d 	mov	r1, sp
    f444:	e1a00007 	mov	r0, r7
    f448:	ebfffb16 	bl	e0a8 <_vfiprintf_r>
    f44c:	e2506000 	subs	r6, r0, #0
    f450:	ba000004 	blt	f468 <__sbprintf+0xa0>
    f454:	e1a0100d 	mov	r1, sp
    f458:	e1a00007 	mov	r0, r7
    f45c:	eb0000fa 	bl	f84c <_fflush_r>
    f460:	e3500000 	cmp	r0, #0
    f464:	13e06000 	mvnne	r6, #0
    f468:	e1dd30bc 	ldrh	r3, [sp, #12]
    f46c:	e3130040 	tst	r3, #64	; 0x40
    f470:	11d430bc 	ldrhne	r3, [r4, #12]
    f474:	13833040 	orrne	r3, r3, #64	; 0x40
    f478:	e59d0058 	ldr	r0, [sp, #88]	; 0x58
    f47c:	11c430bc 	strhne	r3, [r4, #12]
    f480:	eb000553 	bl	109d4 <__retarget_lock_close_recursive>
    f484:	e1a00006 	mov	r0, r6
    f488:	e28dde46 	add	sp, sp, #1120	; 0x460
    f48c:	e28dd008 	add	sp, sp, #8
    f490:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f494:	e12fff1e 	bx	lr

0000f498 <__swsetup_r>:
    f498:	e59f3158 	ldr	r3, [pc, #344]	; f5f8 <__swsetup_r+0x160>
    f49c:	e5933000 	ldr	r3, [r3]
    f4a0:	e3530000 	cmp	r3, #0
    f4a4:	e92d4070 	push	{r4, r5, r6, lr}
    f4a8:	e1a05000 	mov	r5, r0
    f4ac:	e1a04001 	mov	r4, r1
    f4b0:	0a000002 	beq	f4c0 <__swsetup_r+0x28>
    f4b4:	e5932038 	ldr	r2, [r3, #56]	; 0x38
    f4b8:	e3520000 	cmp	r2, #0
    f4bc:	0a000034 	beq	f594 <__swsetup_r+0xfc>
    f4c0:	e1d420fc 	ldrsh	r2, [r4, #12]
    f4c4:	e1a03802 	lsl	r3, r2, #16
    f4c8:	e3130702 	tst	r3, #524288	; 0x80000
    f4cc:	e1a03823 	lsr	r3, r3, #16
    f4d0:	0a00000c 	beq	f508 <__swsetup_r+0x70>
    f4d4:	e5940010 	ldr	r0, [r4, #16]
    f4d8:	e3500000 	cmp	r0, #0
    f4dc:	0a000014 	beq	f534 <__swsetup_r+0x9c>
    f4e0:	e2132001 	ands	r2, r3, #1
    f4e4:	1a00001b 	bne	f558 <__swsetup_r+0xc0>
    f4e8:	e3130002 	tst	r3, #2
    f4ec:	05942014 	ldreq	r2, [r4, #20]
    f4f0:	e3500000 	cmp	r0, #0
    f4f4:	e5842008 	str	r2, [r4, #8]
    f4f8:	13a00000 	movne	r0, #0
    f4fc:	0a00001d 	beq	f578 <__swsetup_r+0xe0>
    f500:	e8bd4070 	pop	{r4, r5, r6, lr}
    f504:	e12fff1e 	bx	lr
    f508:	e3130010 	tst	r3, #16
    f50c:	0a000033 	beq	f5e0 <__swsetup_r+0x148>
    f510:	e3130004 	tst	r3, #4
    f514:	1a000021 	bne	f5a0 <__swsetup_r+0x108>
    f518:	e5940010 	ldr	r0, [r4, #16]
    f51c:	e3822008 	orr	r2, r2, #8
    f520:	e1c420bc 	strh	r2, [r4, #12]
    f524:	e3500000 	cmp	r0, #0
    f528:	e1a02802 	lsl	r2, r2, #16
    f52c:	e1a03822 	lsr	r3, r2, #16
    f530:	1affffea 	bne	f4e0 <__swsetup_r+0x48>
    f534:	e2032d0a 	and	r2, r3, #640	; 0x280
    f538:	e3520c02 	cmp	r2, #512	; 0x200
    f53c:	0affffe7 	beq	f4e0 <__swsetup_r+0x48>
    f540:	e1a00005 	mov	r0, r5
    f544:	e1a01004 	mov	r1, r4
    f548:	eb000552 	bl	10a98 <__smakebuf_r>
    f54c:	e1d430bc 	ldrh	r3, [r4, #12]
    f550:	e5940010 	ldr	r0, [r4, #16]
    f554:	eaffffe1 	b	f4e0 <__swsetup_r+0x48>
    f558:	e3a02000 	mov	r2, #0
    f55c:	e5943014 	ldr	r3, [r4, #20]
    f560:	e3500000 	cmp	r0, #0
    f564:	e2633000 	rsb	r3, r3, #0
    f568:	e5843018 	str	r3, [r4, #24]
    f56c:	e5842008 	str	r2, [r4, #8]
    f570:	13a00000 	movne	r0, #0
    f574:	1affffe1 	bne	f500 <__swsetup_r+0x68>
    f578:	e1d430fc 	ldrsh	r3, [r4, #12]
    f57c:	e3130080 	tst	r3, #128	; 0x80
    f580:	13833040 	orrne	r3, r3, #64	; 0x40
    f584:	11c430bc 	strhne	r3, [r4, #12]
    f588:	13e00000 	mvnne	r0, #0
    f58c:	e8bd4070 	pop	{r4, r5, r6, lr}
    f590:	e12fff1e 	bx	lr
    f594:	e1a00003 	mov	r0, r3
    f598:	eb000140 	bl	faa0 <__sinit>
    f59c:	eaffffc7 	b	f4c0 <__swsetup_r+0x28>
    f5a0:	e5941030 	ldr	r1, [r4, #48]	; 0x30
    f5a4:	e3510000 	cmp	r1, #0
    f5a8:	0a000007 	beq	f5cc <__swsetup_r+0x134>
    f5ac:	e2843040 	add	r3, r4, #64	; 0x40
    f5b0:	e1510003 	cmp	r1, r3
    f5b4:	0a000002 	beq	f5c4 <__swsetup_r+0x12c>
    f5b8:	e1a00005 	mov	r0, r5
    f5bc:	eb000298 	bl	10024 <_free_r>
    f5c0:	e1d420fc 	ldrsh	r2, [r4, #12]
    f5c4:	e3a03000 	mov	r3, #0
    f5c8:	e5843030 	str	r3, [r4, #48]	; 0x30
    f5cc:	e3a03000 	mov	r3, #0
    f5d0:	e5940010 	ldr	r0, [r4, #16]
    f5d4:	e3c22024 	bic	r2, r2, #36	; 0x24
    f5d8:	e8840009 	stm	r4, {r0, r3}
    f5dc:	eaffffce 	b	f51c <__swsetup_r+0x84>
    f5e0:	e3a03009 	mov	r3, #9
    f5e4:	e3822040 	orr	r2, r2, #64	; 0x40
    f5e8:	e5853000 	str	r3, [r5]
    f5ec:	e3e00000 	mvn	r0, #0
    f5f0:	e1c420bc 	strh	r2, [r4, #12]
    f5f4:	eaffffc1 	b	f500 <__swsetup_r+0x68>
    f5f8:	0001356c 	.word	0x0001356c

0000f5fc <abort>:
    f5fc:	e92d4010 	push	{r4, lr}
    f600:	e3a00006 	mov	r0, #6
    f604:	eb00097f 	bl	11c08 <raise>
    f608:	e3a00001 	mov	r0, #1
    f60c:	eb000c51 	bl	12758 <_exit>

0000f610 <__sflush_r>:
    f610:	e1d130fc 	ldrsh	r3, [r1, #12]
    f614:	e1a02803 	lsl	r2, r3, #16
    f618:	e3120702 	tst	r2, #524288	; 0x80000
    f61c:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    f620:	e1a05001 	mov	r5, r1
    f624:	e1a08000 	mov	r8, r0
    f628:	1a000034 	bne	f700 <__sflush_r+0xf0>
    f62c:	e5912004 	ldr	r2, [r1, #4]
    f630:	e3833b02 	orr	r3, r3, #2048	; 0x800
    f634:	e3520000 	cmp	r2, #0
    f638:	e1c130bc 	strh	r3, [r1, #12]
    f63c:	da000050 	ble	f784 <__sflush_r+0x174>
    f640:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    f644:	e3540000 	cmp	r4, #0
    f648:	0a000050 	beq	f790 <__sflush_r+0x180>
    f64c:	e3a02000 	mov	r2, #0
    f650:	e1a03803 	lsl	r3, r3, #16
    f654:	e2030201 	and	r0, r3, #268435456	; 0x10000000
    f658:	e1b07820 	lsrs	r7, r0, #16
    f65c:	e5986000 	ldr	r6, [r8]
    f660:	e1a03823 	lsr	r3, r3, #16
    f664:	e5882000 	str	r2, [r8]
    f668:	0a00005e 	beq	f7e8 <__sflush_r+0x1d8>
    f66c:	e5952050 	ldr	r2, [r5, #80]	; 0x50
    f670:	e3130004 	tst	r3, #4
    f674:	0a000005 	beq	f690 <__sflush_r+0x80>
    f678:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    f67c:	e5953004 	ldr	r3, [r5, #4]
    f680:	e3510000 	cmp	r1, #0
    f684:	e0422003 	sub	r2, r2, r3
    f688:	1595303c 	ldrne	r3, [r5, #60]	; 0x3c
    f68c:	10422003 	subne	r2, r2, r3
    f690:	e3a03000 	mov	r3, #0
    f694:	e595101c 	ldr	r1, [r5, #28]
    f698:	e1a00008 	mov	r0, r8
    f69c:	e1a0e00f 	mov	lr, pc
    f6a0:	e12fff14 	bx	r4
    f6a4:	e3700001 	cmn	r0, #1
    f6a8:	0a00003b 	beq	f79c <__sflush_r+0x18c>
    f6ac:	e3a01000 	mov	r1, #0
    f6b0:	e1d530fc 	ldrsh	r3, [r5, #12]
    f6b4:	e5952010 	ldr	r2, [r5, #16]
    f6b8:	e3c33b02 	bic	r3, r3, #2048	; 0x800
    f6bc:	e3130a01 	tst	r3, #4096	; 0x1000
    f6c0:	e1c530bc 	strh	r3, [r5, #12]
    f6c4:	e5851004 	str	r1, [r5, #4]
    f6c8:	e5852000 	str	r2, [r5]
    f6cc:	1a000043 	bne	f7e0 <__sflush_r+0x1d0>
    f6d0:	e5951030 	ldr	r1, [r5, #48]	; 0x30
    f6d4:	e3510000 	cmp	r1, #0
    f6d8:	e5886000 	str	r6, [r8]
    f6dc:	0a00002b 	beq	f790 <__sflush_r+0x180>
    f6e0:	e2853040 	add	r3, r5, #64	; 0x40
    f6e4:	e1510003 	cmp	r1, r3
    f6e8:	11a00008 	movne	r0, r8
    f6ec:	1b00024c 	blne	10024 <_free_r>
    f6f0:	e3a00000 	mov	r0, #0
    f6f4:	e5850030 	str	r0, [r5, #48]	; 0x30
    f6f8:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f6fc:	e12fff1e 	bx	lr
    f700:	e5916010 	ldr	r6, [r1, #16]
    f704:	e3560000 	cmp	r6, #0
    f708:	0a000020 	beq	f790 <__sflush_r+0x180>
    f70c:	e1a02822 	lsr	r2, r2, #16
    f710:	e3120003 	tst	r2, #3
    f714:	13a03000 	movne	r3, #0
    f718:	e5914000 	ldr	r4, [r1]
    f71c:	05913014 	ldreq	r3, [r1, #20]
    f720:	e0444006 	sub	r4, r4, r6
    f724:	e3540000 	cmp	r4, #0
    f728:	e5816000 	str	r6, [r1]
    f72c:	e5813008 	str	r3, [r1, #8]
    f730:	ca000003 	bgt	f744 <__sflush_r+0x134>
    f734:	ea000015 	b	f790 <__sflush_r+0x180>
    f738:	e3540000 	cmp	r4, #0
    f73c:	e0866000 	add	r6, r6, r0
    f740:	da000012 	ble	f790 <__sflush_r+0x180>
    f744:	e1a03004 	mov	r3, r4
    f748:	e5957024 	ldr	r7, [r5, #36]	; 0x24
    f74c:	e1a02006 	mov	r2, r6
    f750:	e595101c 	ldr	r1, [r5, #28]
    f754:	e1a00008 	mov	r0, r8
    f758:	e1a0e00f 	mov	lr, pc
    f75c:	e12fff17 	bx	r7
    f760:	e3500000 	cmp	r0, #0
    f764:	e0444000 	sub	r4, r4, r0
    f768:	cafffff2 	bgt	f738 <__sflush_r+0x128>
    f76c:	e3e00000 	mvn	r0, #0
    f770:	e1d530bc 	ldrh	r3, [r5, #12]
    f774:	e3833040 	orr	r3, r3, #64	; 0x40
    f778:	e1c530bc 	strh	r3, [r5, #12]
    f77c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f780:	e12fff1e 	bx	lr
    f784:	e591203c 	ldr	r2, [r1, #60]	; 0x3c
    f788:	e3520000 	cmp	r2, #0
    f78c:	caffffab 	bgt	f640 <__sflush_r+0x30>
    f790:	e3a00000 	mov	r0, #0
    f794:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    f798:	e12fff1e 	bx	lr
    f79c:	e5981000 	ldr	r1, [r8]
    f7a0:	e351001d 	cmp	r1, #29
    f7a4:	8afffff0 	bhi	f76c <__sflush_r+0x15c>
    f7a8:	e59f3098 	ldr	r3, [pc, #152]	; f848 <__sflush_r+0x238>
    f7ac:	e1e03133 	mvn	r3, r3, lsr r1
    f7b0:	e2133001 	ands	r3, r3, #1
    f7b4:	1affffec 	bne	f76c <__sflush_r+0x15c>
    f7b8:	e1d520fc 	ldrsh	r2, [r5, #12]
    f7bc:	e595c010 	ldr	ip, [r5, #16]
    f7c0:	e3c22b02 	bic	r2, r2, #2048	; 0x800
    f7c4:	e3120a01 	tst	r2, #4096	; 0x1000
    f7c8:	e5853004 	str	r3, [r5, #4]
    f7cc:	e1c520bc 	strh	r2, [r5, #12]
    f7d0:	e585c000 	str	ip, [r5]
    f7d4:	0affffbd 	beq	f6d0 <__sflush_r+0xc0>
    f7d8:	e3510000 	cmp	r1, #0
    f7dc:	1affffbb 	bne	f6d0 <__sflush_r+0xc0>
    f7e0:	e5850050 	str	r0, [r5, #80]	; 0x50
    f7e4:	eaffffb9 	b	f6d0 <__sflush_r+0xc0>
    f7e8:	e1a02007 	mov	r2, r7
    f7ec:	e3a03001 	mov	r3, #1
    f7f0:	e595101c 	ldr	r1, [r5, #28]
    f7f4:	e1a00008 	mov	r0, r8
    f7f8:	e1a0e00f 	mov	lr, pc
    f7fc:	e12fff14 	bx	r4
    f800:	e3700001 	cmn	r0, #1
    f804:	e1a02000 	mov	r2, r0
    f808:	0a000002 	beq	f818 <__sflush_r+0x208>
    f80c:	e1d530bc 	ldrh	r3, [r5, #12]
    f810:	e5954028 	ldr	r4, [r5, #40]	; 0x28
    f814:	eaffff95 	b	f670 <__sflush_r+0x60>
    f818:	e5983000 	ldr	r3, [r8]
    f81c:	e3530000 	cmp	r3, #0
    f820:	0afffff9 	beq	f80c <__sflush_r+0x1fc>
    f824:	e3530016 	cmp	r3, #22
    f828:	1353001d 	cmpne	r3, #29
    f82c:	11d530bc 	ldrhne	r3, [r5, #12]
    f830:	13833040 	orrne	r3, r3, #64	; 0x40
    f834:	05886000 	streq	r6, [r8]
    f838:	01a00007 	moveq	r0, r7
    f83c:	11a00002 	movne	r0, r2
    f840:	11c530bc 	strhne	r3, [r5, #12]
    f844:	eaffffcc 	b	f77c <__sflush_r+0x16c>
    f848:	20400001 	.word	0x20400001

0000f84c <_fflush_r>:
    f84c:	e92d4070 	push	{r4, r5, r6, lr}
    f850:	e2504000 	subs	r4, r0, #0
    f854:	e1a05001 	mov	r5, r1
    f858:	0a000002 	beq	f868 <_fflush_r+0x1c>
    f85c:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    f860:	e3530000 	cmp	r3, #0
    f864:	0a000015 	beq	f8c0 <_fflush_r+0x74>
    f868:	e1d500fc 	ldrsh	r0, [r5, #12]
    f86c:	e3500000 	cmp	r0, #0
    f870:	01a04000 	moveq	r4, r0
    f874:	0a00000e 	beq	f8b4 <_fflush_r+0x68>
    f878:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    f87c:	e3130001 	tst	r3, #1
    f880:	1a000001 	bne	f88c <_fflush_r+0x40>
    f884:	e3100c02 	tst	r0, #512	; 0x200
    f888:	0a000013 	beq	f8dc <_fflush_r+0x90>
    f88c:	e1a00004 	mov	r0, r4
    f890:	e1a01005 	mov	r1, r5
    f894:	ebffff5d 	bl	f610 <__sflush_r>
    f898:	e5953064 	ldr	r3, [r5, #100]	; 0x64
    f89c:	e3130001 	tst	r3, #1
    f8a0:	e1a04000 	mov	r4, r0
    f8a4:	1a000002 	bne	f8b4 <_fflush_r+0x68>
    f8a8:	e1d530bc 	ldrh	r3, [r5, #12]
    f8ac:	e3130c02 	tst	r3, #512	; 0x200
    f8b0:	0a000004 	beq	f8c8 <_fflush_r+0x7c>
    f8b4:	e1a00004 	mov	r0, r4
    f8b8:	e8bd4070 	pop	{r4, r5, r6, lr}
    f8bc:	e12fff1e 	bx	lr
    f8c0:	eb000076 	bl	faa0 <__sinit>
    f8c4:	eaffffe7 	b	f868 <_fflush_r+0x1c>
    f8c8:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    f8cc:	eb000448 	bl	109f4 <__retarget_lock_release_recursive>
    f8d0:	e1a00004 	mov	r0, r4
    f8d4:	e8bd4070 	pop	{r4, r5, r6, lr}
    f8d8:	e12fff1e 	bx	lr
    f8dc:	e5950058 	ldr	r0, [r5, #88]	; 0x58
    f8e0:	eb00043d 	bl	109dc <__retarget_lock_acquire_recursive>
    f8e4:	eaffffe8 	b	f88c <_fflush_r+0x40>

0000f8e8 <fflush>:
    f8e8:	e2501000 	subs	r1, r0, #0
    f8ec:	159f3020 	ldrne	r3, [pc, #32]	; f914 <fflush+0x2c>
    f8f0:	15930000 	ldrne	r0, [r3]
    f8f4:	1affffd4 	bne	f84c <_fflush_r>
    f8f8:	e92d4010 	push	{r4, lr}
    f8fc:	e59f3014 	ldr	r3, [pc, #20]	; f918 <fflush+0x30>
    f900:	e59f1014 	ldr	r1, [pc, #20]	; f91c <fflush+0x34>
    f904:	e5930000 	ldr	r0, [r3]
    f908:	eb0003d5 	bl	10864 <_fwalk_reent>
    f90c:	e8bd4010 	pop	{r4, lr}
    f910:	e12fff1e 	bx	lr
    f914:	0001356c 	.word	0x0001356c
    f918:	00012fd0 	.word	0x00012fd0
    f91c:	0000f84c 	.word	0x0000f84c

0000f920 <_cleanup_r>:
    f920:	e92d4010 	push	{r4, lr}
    f924:	e59f1008 	ldr	r1, [pc, #8]	; f934 <_cleanup_r+0x14>
    f928:	eb0003cd 	bl	10864 <_fwalk_reent>
    f92c:	e8bd4010 	pop	{r4, lr}
    f930:	e12fff1e 	bx	lr
    f934:	000120f0 	.word	0x000120f0

0000f938 <std.isra.0>:
    f938:	e3a03000 	mov	r3, #0
    f93c:	e92d4010 	push	{r4, lr}
    f940:	e1a04000 	mov	r4, r0
    f944:	e1c010bc 	strh	r1, [r0, #12]
    f948:	e1c020be 	strh	r2, [r0, #14]
    f94c:	e5803000 	str	r3, [r0]
    f950:	e5803004 	str	r3, [r0, #4]
    f954:	e5803008 	str	r3, [r0, #8]
    f958:	e5803064 	str	r3, [r0, #100]	; 0x64
    f95c:	e5803010 	str	r3, [r0, #16]
    f960:	e5803014 	str	r3, [r0, #20]
    f964:	e5803018 	str	r3, [r0, #24]
    f968:	e1a01003 	mov	r1, r3
    f96c:	e3a02008 	mov	r2, #8
    f970:	e280005c 	add	r0, r0, #92	; 0x5c
    f974:	ebfff838 	bl	da5c <memset>
    f978:	e59f002c 	ldr	r0, [pc, #44]	; f9ac <std.isra.0+0x74>
    f97c:	e59f102c 	ldr	r1, [pc, #44]	; f9b0 <std.isra.0+0x78>
    f980:	e59f202c 	ldr	r2, [pc, #44]	; f9b4 <std.isra.0+0x7c>
    f984:	e59f302c 	ldr	r3, [pc, #44]	; f9b8 <std.isra.0+0x80>
    f988:	e5840020 	str	r0, [r4, #32]
    f98c:	e584401c 	str	r4, [r4, #28]
    f990:	e5841024 	str	r1, [r4, #36]	; 0x24
    f994:	e5842028 	str	r2, [r4, #40]	; 0x28
    f998:	e584302c 	str	r3, [r4, #44]	; 0x2c
    f99c:	e2840058 	add	r0, r4, #88	; 0x58
    f9a0:	eb000409 	bl	109cc <__retarget_lock_init_recursive>
    f9a4:	e8bd4010 	pop	{r4, lr}
    f9a8:	e12fff1e 	bx	lr
    f9ac:	00011cc0 	.word	0x00011cc0
    f9b0:	00011cfc 	.word	0x00011cfc
    f9b4:	00011d54 	.word	0x00011d54
    f9b8:	00011d84 	.word	0x00011d84

0000f9bc <__fp_lock>:
    f9bc:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    f9c0:	e3130001 	tst	r3, #1
    f9c4:	1a000002 	bne	f9d4 <__fp_lock+0x18>
    f9c8:	e1d030bc 	ldrh	r3, [r0, #12]
    f9cc:	e3130c02 	tst	r3, #512	; 0x200
    f9d0:	0a000001 	beq	f9dc <__fp_lock+0x20>
    f9d4:	e3a00000 	mov	r0, #0
    f9d8:	e12fff1e 	bx	lr
    f9dc:	e92d4010 	push	{r4, lr}
    f9e0:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    f9e4:	eb0003fc 	bl	109dc <__retarget_lock_acquire_recursive>
    f9e8:	e3a00000 	mov	r0, #0
    f9ec:	e8bd4010 	pop	{r4, lr}
    f9f0:	e12fff1e 	bx	lr

0000f9f4 <__fp_unlock>:
    f9f4:	e5903064 	ldr	r3, [r0, #100]	; 0x64
    f9f8:	e3130001 	tst	r3, #1
    f9fc:	1a000002 	bne	fa0c <__fp_unlock+0x18>
    fa00:	e1d030bc 	ldrh	r3, [r0, #12]
    fa04:	e3130c02 	tst	r3, #512	; 0x200
    fa08:	0a000001 	beq	fa14 <__fp_unlock+0x20>
    fa0c:	e3a00000 	mov	r0, #0
    fa10:	e12fff1e 	bx	lr
    fa14:	e92d4010 	push	{r4, lr}
    fa18:	e5900058 	ldr	r0, [r0, #88]	; 0x58
    fa1c:	eb0003f4 	bl	109f4 <__retarget_lock_release_recursive>
    fa20:	e3a00000 	mov	r0, #0
    fa24:	e8bd4010 	pop	{r4, lr}
    fa28:	e12fff1e 	bx	lr

0000fa2c <__sfmoreglue>:
    fa2c:	e2412001 	sub	r2, r1, #1
    fa30:	e92d4070 	push	{r4, r5, r6, lr}
    fa34:	e0824082 	add	r4, r2, r2, lsl #1
    fa38:	e0822104 	add	r2, r2, r4, lsl #2
    fa3c:	e1a04182 	lsl	r4, r2, #3
    fa40:	e1a06001 	mov	r6, r1
    fa44:	e2841074 	add	r1, r4, #116	; 0x74
    fa48:	eb000452 	bl	10b98 <_malloc_r>
    fa4c:	e2505000 	subs	r5, r0, #0
    fa50:	0a000006 	beq	fa70 <__sfmoreglue+0x44>
    fa54:	e3a01000 	mov	r1, #0
    fa58:	e285000c 	add	r0, r5, #12
    fa5c:	e5856004 	str	r6, [r5, #4]
    fa60:	e2842068 	add	r2, r4, #104	; 0x68
    fa64:	e5851000 	str	r1, [r5]
    fa68:	e5850008 	str	r0, [r5, #8]
    fa6c:	ebfff7fa 	bl	da5c <memset>
    fa70:	e1a00005 	mov	r0, r5
    fa74:	e8bd4070 	pop	{r4, r5, r6, lr}
    fa78:	e12fff1e 	bx	lr

0000fa7c <_cleanup>:
    fa7c:	e92d4010 	push	{r4, lr}
    fa80:	e59f3010 	ldr	r3, [pc, #16]	; fa98 <_cleanup+0x1c>
    fa84:	e59f1010 	ldr	r1, [pc, #16]	; fa9c <_cleanup+0x20>
    fa88:	e5930000 	ldr	r0, [r3]
    fa8c:	eb000374 	bl	10864 <_fwalk_reent>
    fa90:	e8bd4010 	pop	{r4, lr}
    fa94:	e12fff1e 	bx	lr
    fa98:	00012fd0 	.word	0x00012fd0
    fa9c:	000120f0 	.word	0x000120f0

0000faa0 <__sinit>:
    faa0:	e92d4010 	push	{r4, lr}
    faa4:	e1a04000 	mov	r4, r0
    faa8:	e59f007c 	ldr	r0, [pc, #124]	; fb2c <__sinit+0x8c>
    faac:	eb0003ca 	bl	109dc <__retarget_lock_acquire_recursive>
    fab0:	e5942038 	ldr	r2, [r4, #56]	; 0x38
    fab4:	e3520000 	cmp	r2, #0
    fab8:	1a000017 	bne	fb1c <__sinit+0x7c>
    fabc:	e3a00003 	mov	r0, #3
    fac0:	e59f1068 	ldr	r1, [pc, #104]	; fb30 <__sinit+0x90>
    fac4:	e2843fbb 	add	r3, r4, #748	; 0x2ec
    fac8:	e58432e8 	str	r3, [r4, #744]	; 0x2e8
    facc:	e58422e0 	str	r2, [r4, #736]	; 0x2e0
    fad0:	e58402e4 	str	r0, [r4, #740]	; 0x2e4
    fad4:	e584103c 	str	r1, [r4, #60]	; 0x3c
    fad8:	e5940004 	ldr	r0, [r4, #4]
    fadc:	e3a01004 	mov	r1, #4
    fae0:	ebffff94 	bl	f938 <std.isra.0>
    fae4:	e5940008 	ldr	r0, [r4, #8]
    fae8:	e3a02001 	mov	r2, #1
    faec:	e3a01009 	mov	r1, #9
    faf0:	ebffff90 	bl	f938 <std.isra.0>
    faf4:	e594000c 	ldr	r0, [r4, #12]
    faf8:	e3a02002 	mov	r2, #2
    fafc:	e3a01012 	mov	r1, #18
    fb00:	ebffff8c 	bl	f938 <std.isra.0>
    fb04:	e3a03001 	mov	r3, #1
    fb08:	e59f001c 	ldr	r0, [pc, #28]	; fb2c <__sinit+0x8c>
    fb0c:	e5843038 	str	r3, [r4, #56]	; 0x38
    fb10:	eb0003b7 	bl	109f4 <__retarget_lock_release_recursive>
    fb14:	e8bd4010 	pop	{r4, lr}
    fb18:	e12fff1e 	bx	lr
    fb1c:	e59f0008 	ldr	r0, [pc, #8]	; fb2c <__sinit+0x8c>
    fb20:	eb0003b3 	bl	109f4 <__retarget_lock_release_recursive>
    fb24:	e8bd4010 	pop	{r4, lr}
    fb28:	e12fff1e 	bx	lr
    fb2c:	0003c18c 	.word	0x0003c18c
    fb30:	0000f920 	.word	0x0000f920

0000fb34 <__sfp>:
    fb34:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    fb38:	e1a06000 	mov	r6, r0
    fb3c:	e59f0108 	ldr	r0, [pc, #264]	; fc4c <__sfp+0x118>
    fb40:	eb0003a5 	bl	109dc <__retarget_lock_acquire_recursive>
    fb44:	e59f3104 	ldr	r3, [pc, #260]	; fc50 <__sfp+0x11c>
    fb48:	e5935000 	ldr	r5, [r3]
    fb4c:	e5953038 	ldr	r3, [r5, #56]	; 0x38
    fb50:	e3530000 	cmp	r3, #0
    fb54:	0a00002d 	beq	fc10 <__sfp+0xdc>
    fb58:	e3a07004 	mov	r7, #4
    fb5c:	e2855e2e 	add	r5, r5, #736	; 0x2e0
    fb60:	e5953004 	ldr	r3, [r5, #4]
    fb64:	e2533001 	subs	r3, r3, #1
    fb68:	e5954008 	ldr	r4, [r5, #8]
    fb6c:	5a000004 	bpl	fb84 <__sfp+0x50>
    fb70:	ea000021 	b	fbfc <__sfp+0xc8>
    fb74:	e2433001 	sub	r3, r3, #1
    fb78:	e3730001 	cmn	r3, #1
    fb7c:	e2844068 	add	r4, r4, #104	; 0x68
    fb80:	0a00001d 	beq	fbfc <__sfp+0xc8>
    fb84:	e1d420fc 	ldrsh	r2, [r4, #12]
    fb88:	e3520000 	cmp	r2, #0
    fb8c:	1afffff8 	bne	fb74 <__sfp+0x40>
    fb90:	e3a05000 	mov	r5, #0
    fb94:	e3e02000 	mvn	r2, #0
    fb98:	e3a03001 	mov	r3, #1
    fb9c:	e1c420be 	strh	r2, [r4, #14]
    fba0:	e1c430bc 	strh	r3, [r4, #12]
    fba4:	e2840058 	add	r0, r4, #88	; 0x58
    fba8:	e5845064 	str	r5, [r4, #100]	; 0x64
    fbac:	eb000386 	bl	109cc <__retarget_lock_init_recursive>
    fbb0:	e59f0094 	ldr	r0, [pc, #148]	; fc4c <__sfp+0x118>
    fbb4:	eb00038e 	bl	109f4 <__retarget_lock_release_recursive>
    fbb8:	e5845000 	str	r5, [r4]
    fbbc:	e5845008 	str	r5, [r4, #8]
    fbc0:	e5845004 	str	r5, [r4, #4]
    fbc4:	e5845010 	str	r5, [r4, #16]
    fbc8:	e5845014 	str	r5, [r4, #20]
    fbcc:	e5845018 	str	r5, [r4, #24]
    fbd0:	e1a01005 	mov	r1, r5
    fbd4:	e3a02008 	mov	r2, #8
    fbd8:	e284005c 	add	r0, r4, #92	; 0x5c
    fbdc:	ebfff79e 	bl	da5c <memset>
    fbe0:	e5845030 	str	r5, [r4, #48]	; 0x30
    fbe4:	e5845034 	str	r5, [r4, #52]	; 0x34
    fbe8:	e5845044 	str	r5, [r4, #68]	; 0x44
    fbec:	e5845048 	str	r5, [r4, #72]	; 0x48
    fbf0:	e1a00004 	mov	r0, r4
    fbf4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    fbf8:	e12fff1e 	bx	lr
    fbfc:	e5954000 	ldr	r4, [r5]
    fc00:	e3540000 	cmp	r4, #0
    fc04:	0a000004 	beq	fc1c <__sfp+0xe8>
    fc08:	e1a05004 	mov	r5, r4
    fc0c:	eaffffd3 	b	fb60 <__sfp+0x2c>
    fc10:	e1a00005 	mov	r0, r5
    fc14:	ebffffa1 	bl	faa0 <__sinit>
    fc18:	eaffffce 	b	fb58 <__sfp+0x24>
    fc1c:	e1a01007 	mov	r1, r7
    fc20:	e1a00006 	mov	r0, r6
    fc24:	ebffff80 	bl	fa2c <__sfmoreglue>
    fc28:	e3500000 	cmp	r0, #0
    fc2c:	e1a04000 	mov	r4, r0
    fc30:	e5850000 	str	r0, [r5]
    fc34:	1afffff3 	bne	fc08 <__sfp+0xd4>
    fc38:	e59f000c 	ldr	r0, [pc, #12]	; fc4c <__sfp+0x118>
    fc3c:	eb00036c 	bl	109f4 <__retarget_lock_release_recursive>
    fc40:	e3a0300c 	mov	r3, #12
    fc44:	e5863000 	str	r3, [r6]
    fc48:	eaffffe8 	b	fbf0 <__sfp+0xbc>
    fc4c:	0003c1a0 	.word	0x0003c1a0
    fc50:	00012fd0 	.word	0x00012fd0

0000fc54 <__sfp_lock_acquire>:
    fc54:	e92d4010 	push	{r4, lr}
    fc58:	e59f0008 	ldr	r0, [pc, #8]	; fc68 <__sfp_lock_acquire+0x14>
    fc5c:	eb00035e 	bl	109dc <__retarget_lock_acquire_recursive>
    fc60:	e8bd4010 	pop	{r4, lr}
    fc64:	e12fff1e 	bx	lr
    fc68:	0003c1a0 	.word	0x0003c1a0

0000fc6c <__sfp_lock_release>:
    fc6c:	e92d4010 	push	{r4, lr}
    fc70:	e59f0008 	ldr	r0, [pc, #8]	; fc80 <__sfp_lock_release+0x14>
    fc74:	eb00035e 	bl	109f4 <__retarget_lock_release_recursive>
    fc78:	e8bd4010 	pop	{r4, lr}
    fc7c:	e12fff1e 	bx	lr
    fc80:	0003c1a0 	.word	0x0003c1a0

0000fc84 <__sinit_lock_acquire>:
    fc84:	e92d4010 	push	{r4, lr}
    fc88:	e59f0008 	ldr	r0, [pc, #8]	; fc98 <__sinit_lock_acquire+0x14>
    fc8c:	eb000352 	bl	109dc <__retarget_lock_acquire_recursive>
    fc90:	e8bd4010 	pop	{r4, lr}
    fc94:	e12fff1e 	bx	lr
    fc98:	0003c18c 	.word	0x0003c18c

0000fc9c <__sinit_lock_release>:
    fc9c:	e92d4010 	push	{r4, lr}
    fca0:	e59f0008 	ldr	r0, [pc, #8]	; fcb0 <__sinit_lock_release+0x14>
    fca4:	eb000352 	bl	109f4 <__retarget_lock_release_recursive>
    fca8:	e8bd4010 	pop	{r4, lr}
    fcac:	e12fff1e 	bx	lr
    fcb0:	0003c18c 	.word	0x0003c18c

0000fcb4 <__fp_lock_all>:
    fcb4:	e92d4010 	push	{r4, lr}
    fcb8:	e59f0018 	ldr	r0, [pc, #24]	; fcd8 <__fp_lock_all+0x24>
    fcbc:	eb000346 	bl	109dc <__retarget_lock_acquire_recursive>
    fcc0:	e59f3014 	ldr	r3, [pc, #20]	; fcdc <__fp_lock_all+0x28>
    fcc4:	e59f1014 	ldr	r1, [pc, #20]	; fce0 <__fp_lock_all+0x2c>
    fcc8:	e5930000 	ldr	r0, [r3]
    fccc:	eb0002c3 	bl	107e0 <_fwalk>
    fcd0:	e8bd4010 	pop	{r4, lr}
    fcd4:	e12fff1e 	bx	lr
    fcd8:	0003c1a0 	.word	0x0003c1a0
    fcdc:	0001356c 	.word	0x0001356c
    fce0:	0000f9bc 	.word	0x0000f9bc

0000fce4 <__fp_unlock_all>:
    fce4:	e92d4010 	push	{r4, lr}
    fce8:	e59f3018 	ldr	r3, [pc, #24]	; fd08 <__fp_unlock_all+0x24>
    fcec:	e59f1018 	ldr	r1, [pc, #24]	; fd0c <__fp_unlock_all+0x28>
    fcf0:	e5930000 	ldr	r0, [r3]
    fcf4:	eb0002b9 	bl	107e0 <_fwalk>
    fcf8:	e59f0010 	ldr	r0, [pc, #16]	; fd10 <__fp_unlock_all+0x2c>
    fcfc:	eb00033c 	bl	109f4 <__retarget_lock_release_recursive>
    fd00:	e8bd4010 	pop	{r4, lr}
    fd04:	e12fff1e 	bx	lr
    fd08:	0001356c 	.word	0x0001356c
    fd0c:	0000f9f4 	.word	0x0000f9f4
    fd10:	0003c1a0 	.word	0x0003c1a0

0000fd14 <__fputwc>:
    fd14:	e92d43f0 	push	{r4, r5, r6, r7, r8, r9, lr}
    fd18:	e24dd00c 	sub	sp, sp, #12
    fd1c:	e1a08000 	mov	r8, r0
    fd20:	e1a07001 	mov	r7, r1
    fd24:	e1a04002 	mov	r4, r2
    fd28:	eb00030a 	bl	10958 <__locale_mb_cur_max>
    fd2c:	e3500001 	cmp	r0, #1
    fd30:	0a000030 	beq	fdf8 <__fputwc+0xe4>
    fd34:	e284305c 	add	r3, r4, #92	; 0x5c
    fd38:	e1a02007 	mov	r2, r7
    fd3c:	e28d1004 	add	r1, sp, #4
    fd40:	e1a00008 	mov	r0, r8
    fd44:	eb000866 	bl	11ee4 <_wcrtomb_r>
    fd48:	e3700001 	cmn	r0, #1
    fd4c:	e1a06000 	mov	r6, r0
    fd50:	0a000022 	beq	fde0 <__fputwc+0xcc>
    fd54:	e3500000 	cmp	r0, #0
    fd58:	15dd1004 	ldrbne	r1, [sp, #4]
    fd5c:	0a00002c 	beq	fe14 <__fputwc+0x100>
    fd60:	e3a05000 	mov	r5, #0
    fd64:	e28d9004 	add	r9, sp, #4
    fd68:	ea000007 	b	fd8c <__fputwc+0x78>
    fd6c:	e5943000 	ldr	r3, [r4]
    fd70:	e2832001 	add	r2, r3, #1
    fd74:	e5842000 	str	r2, [r4]
    fd78:	e5c31000 	strb	r1, [r3]
    fd7c:	e2855001 	add	r5, r5, #1
    fd80:	e1560005 	cmp	r6, r5
    fd84:	9a000022 	bls	fe14 <__fputwc+0x100>
    fd88:	e7d51009 	ldrb	r1, [r5, r9]
    fd8c:	e5943008 	ldr	r3, [r4, #8]
    fd90:	e2433001 	sub	r3, r3, #1
    fd94:	e3530000 	cmp	r3, #0
    fd98:	e5843008 	str	r3, [r4, #8]
    fd9c:	aafffff2 	bge	fd6c <__fputwc+0x58>
    fda0:	e5942018 	ldr	r2, [r4, #24]
    fda4:	e1530002 	cmp	r3, r2
    fda8:	b3a03000 	movlt	r3, #0
    fdac:	a3a03001 	movge	r3, #1
    fdb0:	e351000a 	cmp	r1, #10
    fdb4:	03a03000 	moveq	r3, #0
    fdb8:	e3530000 	cmp	r3, #0
    fdbc:	1affffea 	bne	fd6c <__fputwc+0x58>
    fdc0:	e1a02004 	mov	r2, r4
    fdc4:	e1a00008 	mov	r0, r8
    fdc8:	eb0007f2 	bl	11d98 <__swbuf_r>
    fdcc:	e3700001 	cmn	r0, #1
    fdd0:	1affffe9 	bne	fd7c <__fputwc+0x68>
    fdd4:	e28dd00c 	add	sp, sp, #12
    fdd8:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    fddc:	e12fff1e 	bx	lr
    fde0:	e1d430bc 	ldrh	r3, [r4, #12]
    fde4:	e3833040 	orr	r3, r3, #64	; 0x40
    fde8:	e1c430bc 	strh	r3, [r4, #12]
    fdec:	e28dd00c 	add	sp, sp, #12
    fdf0:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    fdf4:	e12fff1e 	bx	lr
    fdf8:	e2473001 	sub	r3, r7, #1
    fdfc:	e35300fe 	cmp	r3, #254	; 0xfe
    fe00:	8affffcb 	bhi	fd34 <__fputwc+0x20>
    fe04:	e20710ff 	and	r1, r7, #255	; 0xff
    fe08:	e1a06000 	mov	r6, r0
    fe0c:	e5cd1004 	strb	r1, [sp, #4]
    fe10:	eaffffd2 	b	fd60 <__fputwc+0x4c>
    fe14:	e1a00007 	mov	r0, r7
    fe18:	e28dd00c 	add	sp, sp, #12
    fe1c:	e8bd43f0 	pop	{r4, r5, r6, r7, r8, r9, lr}
    fe20:	e12fff1e 	bx	lr

0000fe24 <_fputwc_r>:
    fe24:	e92d4030 	push	{r4, r5, lr}
    fe28:	e5923064 	ldr	r3, [r2, #100]	; 0x64
    fe2c:	e1a04002 	mov	r4, r2
    fe30:	e1d220fc 	ldrsh	r2, [r2, #12]
    fe34:	e3130001 	tst	r3, #1
    fe38:	e1a03802 	lsl	r3, r2, #16
    fe3c:	e24dd00c 	sub	sp, sp, #12
    fe40:	e1a05000 	mov	r5, r0
    fe44:	11a03823 	lsrne	r3, r3, #16
    fe48:	1a000002 	bne	fe58 <_fputwc_r+0x34>
    fe4c:	e3130402 	tst	r3, #33554432	; 0x2000000
    fe50:	e1a03823 	lsr	r3, r3, #16
    fe54:	0a000019 	beq	fec0 <_fputwc_r+0x9c>
    fe58:	e3130a02 	tst	r3, #8192	; 0x2000
    fe5c:	05943064 	ldreq	r3, [r4, #100]	; 0x64
    fe60:	03822a02 	orreq	r2, r2, #8192	; 0x2000
    fe64:	03833a02 	orreq	r3, r3, #8192	; 0x2000
    fe68:	01c420bc 	strheq	r2, [r4, #12]
    fe6c:	05843064 	streq	r3, [r4, #100]	; 0x64
    fe70:	e1a00005 	mov	r0, r5
    fe74:	e1a02004 	mov	r2, r4
    fe78:	ebffffa5 	bl	fd14 <__fputwc>
    fe7c:	e5943064 	ldr	r3, [r4, #100]	; 0x64
    fe80:	e3130001 	tst	r3, #1
    fe84:	e1a05000 	mov	r5, r0
    fe88:	1a000002 	bne	fe98 <_fputwc_r+0x74>
    fe8c:	e1d430bc 	ldrh	r3, [r4, #12]
    fe90:	e3130c02 	tst	r3, #512	; 0x200
    fe94:	0a000003 	beq	fea8 <_fputwc_r+0x84>
    fe98:	e1a00005 	mov	r0, r5
    fe9c:	e28dd00c 	add	sp, sp, #12
    fea0:	e8bd4030 	pop	{r4, r5, lr}
    fea4:	e12fff1e 	bx	lr
    fea8:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    feac:	eb0002d0 	bl	109f4 <__retarget_lock_release_recursive>
    feb0:	e1a00005 	mov	r0, r5
    feb4:	e28dd00c 	add	sp, sp, #12
    feb8:	e8bd4030 	pop	{r4, r5, lr}
    febc:	e12fff1e 	bx	lr
    fec0:	e5940058 	ldr	r0, [r4, #88]	; 0x58
    fec4:	e58d1004 	str	r1, [sp, #4]
    fec8:	eb0002c3 	bl	109dc <__retarget_lock_acquire_recursive>
    fecc:	e1d420fc 	ldrsh	r2, [r4, #12]
    fed0:	e1a03802 	lsl	r3, r2, #16
    fed4:	e1a03823 	lsr	r3, r3, #16
    fed8:	e59d1004 	ldr	r1, [sp, #4]
    fedc:	eaffffdd 	b	fe58 <_fputwc_r+0x34>

0000fee0 <fputwc>:
    fee0:	e59f3038 	ldr	r3, [pc, #56]	; ff20 <fputwc+0x40>
    fee4:	e92d4070 	push	{r4, r5, r6, lr}
    fee8:	e5934000 	ldr	r4, [r3]
    feec:	e3540000 	cmp	r4, #0
    fef0:	e1a05000 	mov	r5, r0
    fef4:	e1a06001 	mov	r6, r1
    fef8:	0a000003 	beq	ff0c <fputwc+0x2c>
    fefc:	e5943038 	ldr	r3, [r4, #56]	; 0x38
    ff00:	e3530000 	cmp	r3, #0
    ff04:	01a00004 	moveq	r0, r4
    ff08:	0bfffee4 	bleq	faa0 <__sinit>
    ff0c:	e1a02006 	mov	r2, r6
    ff10:	e1a01005 	mov	r1, r5
    ff14:	e1a00004 	mov	r0, r4
    ff18:	e8bd4070 	pop	{r4, r5, r6, lr}
    ff1c:	eaffffc0 	b	fe24 <_fputwc_r>
    ff20:	0001356c 	.word	0x0001356c

0000ff24 <_malloc_trim_r>:
    ff24:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
    ff28:	e1a04001 	mov	r4, r1
    ff2c:	e59f70e4 	ldr	r7, [pc, #228]	; 10018 <_malloc_trim_r+0xf4>
    ff30:	e1a06000 	mov	r6, r0
    ff34:	eb00055e 	bl	114b4 <__malloc_lock>
    ff38:	e5973008 	ldr	r3, [r7, #8]
    ff3c:	e5935004 	ldr	r5, [r3, #4]
    ff40:	e2641efe 	rsb	r1, r4, #4064	; 0xfe0
    ff44:	e281100f 	add	r1, r1, #15
    ff48:	e3c55003 	bic	r5, r5, #3
    ff4c:	e0814005 	add	r4, r1, r5
    ff50:	e1a04624 	lsr	r4, r4, #12
    ff54:	e2444001 	sub	r4, r4, #1
    ff58:	e1a04604 	lsl	r4, r4, #12
    ff5c:	e3540a01 	cmp	r4, #4096	; 0x1000
    ff60:	ba000006 	blt	ff80 <_malloc_trim_r+0x5c>
    ff64:	e3a01000 	mov	r1, #0
    ff68:	e1a00006 	mov	r0, r6
    ff6c:	eb000691 	bl	119b8 <_sbrk_r>
    ff70:	e5973008 	ldr	r3, [r7, #8]
    ff74:	e0833005 	add	r3, r3, r5
    ff78:	e1500003 	cmp	r0, r3
    ff7c:	0a000004 	beq	ff94 <_malloc_trim_r+0x70>
    ff80:	e1a00006 	mov	r0, r6
    ff84:	eb000550 	bl	114cc <__malloc_unlock>
    ff88:	e3a00000 	mov	r0, #0
    ff8c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    ff90:	e12fff1e 	bx	lr
    ff94:	e2641000 	rsb	r1, r4, #0
    ff98:	e1a00006 	mov	r0, r6
    ff9c:	eb000685 	bl	119b8 <_sbrk_r>
    ffa0:	e3700001 	cmn	r0, #1
    ffa4:	0a00000c 	beq	ffdc <_malloc_trim_r+0xb8>
    ffa8:	e59f206c 	ldr	r2, [pc, #108]	; 1001c <_malloc_trim_r+0xf8>
    ffac:	e5971008 	ldr	r1, [r7, #8]
    ffb0:	e5923000 	ldr	r3, [r2]
    ffb4:	e0455004 	sub	r5, r5, r4
    ffb8:	e3855001 	orr	r5, r5, #1
    ffbc:	e1a00006 	mov	r0, r6
    ffc0:	e0434004 	sub	r4, r3, r4
    ffc4:	e5815004 	str	r5, [r1, #4]
    ffc8:	e5824000 	str	r4, [r2]
    ffcc:	eb00053e 	bl	114cc <__malloc_unlock>
    ffd0:	e3a00001 	mov	r0, #1
    ffd4:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
    ffd8:	e12fff1e 	bx	lr
    ffdc:	e3a01000 	mov	r1, #0
    ffe0:	e1a00006 	mov	r0, r6
    ffe4:	eb000673 	bl	119b8 <_sbrk_r>
    ffe8:	e5972008 	ldr	r2, [r7, #8]
    ffec:	e0403002 	sub	r3, r0, r2
    fff0:	e353000f 	cmp	r3, #15
    fff4:	daffffe1 	ble	ff80 <_malloc_trim_r+0x5c>
    fff8:	e59f1020 	ldr	r1, [pc, #32]	; 10020 <_malloc_trim_r+0xfc>
    fffc:	e591c000 	ldr	ip, [r1]
   10000:	e59f1014 	ldr	r1, [pc, #20]	; 1001c <_malloc_trim_r+0xf8>
   10004:	e3833001 	orr	r3, r3, #1
   10008:	e040000c 	sub	r0, r0, ip
   1000c:	e5823004 	str	r3, [r2, #4]
   10010:	e5810000 	str	r0, [r1]
   10014:	eaffffd9 	b	ff80 <_malloc_trim_r+0x5c>
   10018:	00013b04 	.word	0x00013b04
   1001c:	0003c140 	.word	0x0003c140
   10020:	00013f0c 	.word	0x00013f0c

00010024 <_free_r>:
   10024:	e92d4070 	push	{r4, r5, r6, lr}
   10028:	e2514000 	subs	r4, r1, #0
   1002c:	0a000031 	beq	100f8 <_free_r+0xd4>
   10030:	e1a05000 	mov	r5, r0
   10034:	eb00051e 	bl	114b4 <__malloc_lock>
   10038:	e5141004 	ldr	r1, [r4, #-4]
   1003c:	e59fe2ac 	ldr	lr, [pc, #684]	; 102f0 <_free_r+0x2cc>
   10040:	e3c13001 	bic	r3, r1, #1
   10044:	e244c008 	sub	ip, r4, #8
   10048:	e08c0003 	add	r0, ip, r3
   1004c:	e59e6008 	ldr	r6, [lr, #8]
   10050:	e5902004 	ldr	r2, [r0, #4]
   10054:	e1500006 	cmp	r0, r6
   10058:	e3c22003 	bic	r2, r2, #3
   1005c:	0a00004e 	beq	1019c <_free_r+0x178>
   10060:	e3110001 	tst	r1, #1
   10064:	e5802004 	str	r2, [r0, #4]
   10068:	1a000009 	bne	10094 <_free_r+0x70>
   1006c:	e5144008 	ldr	r4, [r4, #-8]
   10070:	e04cc004 	sub	ip, ip, r4
   10074:	e59c1008 	ldr	r1, [ip, #8]
   10078:	e28e6008 	add	r6, lr, #8
   1007c:	e1510006 	cmp	r1, r6
   10080:	e0833004 	add	r3, r3, r4
   10084:	0a00005c 	beq	101fc <_free_r+0x1d8>
   10088:	e59c400c 	ldr	r4, [ip, #12]
   1008c:	e581400c 	str	r4, [r1, #12]
   10090:	e5841008 	str	r1, [r4, #8]
   10094:	e0801002 	add	r1, r0, r2
   10098:	e5911004 	ldr	r1, [r1, #4]
   1009c:	e3110001 	tst	r1, #1
   100a0:	13832001 	orrne	r2, r3, #1
   100a4:	158c2004 	strne	r2, [ip, #4]
   100a8:	178c3003 	strne	r3, [ip, r3]
   100ac:	0a00002c 	beq	10164 <_free_r+0x140>
   100b0:	e3530c02 	cmp	r3, #512	; 0x200
   100b4:	2a000011 	bcs	10100 <_free_r+0xdc>
   100b8:	e3a04001 	mov	r4, #1
   100bc:	e59e0004 	ldr	r0, [lr, #4]
   100c0:	e1a031a3 	lsr	r3, r3, #3
   100c4:	e0832004 	add	r2, r3, r4
   100c8:	e1a03143 	asr	r3, r3, #2
   100cc:	e1803314 	orr	r3, r0, r4, lsl r3
   100d0:	e08e1182 	add	r1, lr, r2, lsl #3
   100d4:	e79e0182 	ldr	r0, [lr, r2, lsl #3]
   100d8:	e2411008 	sub	r1, r1, #8
   100dc:	e58e3004 	str	r3, [lr, #4]
   100e0:	e58c100c 	str	r1, [ip, #12]
   100e4:	e58c0008 	str	r0, [ip, #8]
   100e8:	e78ec182 	str	ip, [lr, r2, lsl #3]
   100ec:	e580c00c 	str	ip, [r0, #12]
   100f0:	e1a00005 	mov	r0, r5
   100f4:	eb0004f4 	bl	114cc <__malloc_unlock>
   100f8:	e8bd4070 	pop	{r4, r5, r6, lr}
   100fc:	e12fff1e 	bx	lr
   10100:	e1a024a3 	lsr	r2, r3, #9
   10104:	e3520004 	cmp	r2, #4
   10108:	8a000048 	bhi	10230 <_free_r+0x20c>
   1010c:	e1a02323 	lsr	r2, r3, #6
   10110:	e2824039 	add	r4, r2, #57	; 0x39
   10114:	e1a04184 	lsl	r4, r4, #3
   10118:	e2821038 	add	r1, r2, #56	; 0x38
   1011c:	e08e0004 	add	r0, lr, r4
   10120:	e79e2004 	ldr	r2, [lr, r4]
   10124:	e2400008 	sub	r0, r0, #8
   10128:	e1500002 	cmp	r0, r2
   1012c:	0a000045 	beq	10248 <_free_r+0x224>
   10130:	e5921004 	ldr	r1, [r2, #4]
   10134:	e3c11003 	bic	r1, r1, #3
   10138:	e1530001 	cmp	r3, r1
   1013c:	2a00002c 	bcs	101f4 <_free_r+0x1d0>
   10140:	e5922008 	ldr	r2, [r2, #8]
   10144:	e1500002 	cmp	r0, r2
   10148:	1afffff8 	bne	10130 <_free_r+0x10c>
   1014c:	e590300c 	ldr	r3, [r0, #12]
   10150:	e58c300c 	str	r3, [ip, #12]
   10154:	e58c0008 	str	r0, [ip, #8]
   10158:	e583c008 	str	ip, [r3, #8]
   1015c:	e580c00c 	str	ip, [r0, #12]
   10160:	eaffffe2 	b	100f0 <_free_r+0xcc>
   10164:	e5901008 	ldr	r1, [r0, #8]
   10168:	e59f4184 	ldr	r4, [pc, #388]	; 102f4 <_free_r+0x2d0>
   1016c:	e1510004 	cmp	r1, r4
   10170:	e0833002 	add	r3, r3, r2
   10174:	0a00003a 	beq	10264 <_free_r+0x240>
   10178:	e590000c 	ldr	r0, [r0, #12]
   1017c:	e3832001 	orr	r2, r3, #1
   10180:	e3530c02 	cmp	r3, #512	; 0x200
   10184:	e581000c 	str	r0, [r1, #12]
   10188:	e5801008 	str	r1, [r0, #8]
   1018c:	e58c2004 	str	r2, [ip, #4]
   10190:	e78c3003 	str	r3, [ip, r3]
   10194:	2affffd9 	bcs	10100 <_free_r+0xdc>
   10198:	eaffffc6 	b	100b8 <_free_r+0x94>
   1019c:	e3110001 	tst	r1, #1
   101a0:	e0833002 	add	r3, r3, r2
   101a4:	1a000006 	bne	101c4 <_free_r+0x1a0>
   101a8:	e5142008 	ldr	r2, [r4, #-8]
   101ac:	e04cc002 	sub	ip, ip, r2
   101b0:	e28c0008 	add	r0, ip, #8
   101b4:	e8900003 	ldm	r0, {r0, r1}
   101b8:	e580100c 	str	r1, [r0, #12]
   101bc:	e5810008 	str	r0, [r1, #8]
   101c0:	e0833002 	add	r3, r3, r2
   101c4:	e59f212c 	ldr	r2, [pc, #300]	; 102f8 <_free_r+0x2d4>
   101c8:	e5921000 	ldr	r1, [r2]
   101cc:	e3832001 	orr	r2, r3, #1
   101d0:	e1530001 	cmp	r3, r1
   101d4:	e58c2004 	str	r2, [ip, #4]
   101d8:	e58ec008 	str	ip, [lr, #8]
   101dc:	3affffc3 	bcc	100f0 <_free_r+0xcc>
   101e0:	e59f3114 	ldr	r3, [pc, #276]	; 102fc <_free_r+0x2d8>
   101e4:	e1a00005 	mov	r0, r5
   101e8:	e5931000 	ldr	r1, [r3]
   101ec:	ebffff4c 	bl	ff24 <_malloc_trim_r>
   101f0:	eaffffbe 	b	100f0 <_free_r+0xcc>
   101f4:	e1a00002 	mov	r0, r2
   101f8:	eaffffd3 	b	1014c <_free_r+0x128>
   101fc:	e0801002 	add	r1, r0, r2
   10200:	e5911004 	ldr	r1, [r1, #4]
   10204:	e3110001 	tst	r1, #1
   10208:	1a000034 	bne	102e0 <_free_r+0x2bc>
   1020c:	e2801008 	add	r1, r0, #8
   10210:	e0823003 	add	r3, r2, r3
   10214:	e8910006 	ldm	r1, {r1, r2}
   10218:	e3830001 	orr	r0, r3, #1
   1021c:	e581200c 	str	r2, [r1, #12]
   10220:	e5821008 	str	r1, [r2, #8]
   10224:	e58c0004 	str	r0, [ip, #4]
   10228:	e78c3003 	str	r3, [ip, r3]
   1022c:	eaffffaf 	b	100f0 <_free_r+0xcc>
   10230:	e3520014 	cmp	r2, #20
   10234:	8a000012 	bhi	10284 <_free_r+0x260>
   10238:	e282405c 	add	r4, r2, #92	; 0x5c
   1023c:	e1a04184 	lsl	r4, r4, #3
   10240:	e282105b 	add	r1, r2, #91	; 0x5b
   10244:	eaffffb4 	b	1011c <_free_r+0xf8>
   10248:	e3a04001 	mov	r4, #1
   1024c:	e59e3004 	ldr	r3, [lr, #4]
   10250:	e1a02141 	asr	r2, r1, #2
   10254:	e1832214 	orr	r2, r3, r4, lsl r2
   10258:	e58e2004 	str	r2, [lr, #4]
   1025c:	e1a03000 	mov	r3, r0
   10260:	eaffffba 	b	10150 <_free_r+0x12c>
   10264:	e3832001 	orr	r2, r3, #1
   10268:	e58ec014 	str	ip, [lr, #20]
   1026c:	e58ec010 	str	ip, [lr, #16]
   10270:	e58c100c 	str	r1, [ip, #12]
   10274:	e58c1008 	str	r1, [ip, #8]
   10278:	e58c2004 	str	r2, [ip, #4]
   1027c:	e78c3003 	str	r3, [ip, r3]
   10280:	eaffff9a 	b	100f0 <_free_r+0xcc>
   10284:	e3520054 	cmp	r2, #84	; 0x54
   10288:	8a000004 	bhi	102a0 <_free_r+0x27c>
   1028c:	e1a02623 	lsr	r2, r3, #12
   10290:	e282406f 	add	r4, r2, #111	; 0x6f
   10294:	e1a04184 	lsl	r4, r4, #3
   10298:	e282106e 	add	r1, r2, #110	; 0x6e
   1029c:	eaffff9e 	b	1011c <_free_r+0xf8>
   102a0:	e3520f55 	cmp	r2, #340	; 0x154
   102a4:	8a000004 	bhi	102bc <_free_r+0x298>
   102a8:	e1a027a3 	lsr	r2, r3, #15
   102ac:	e2824078 	add	r4, r2, #120	; 0x78
   102b0:	e1a04184 	lsl	r4, r4, #3
   102b4:	e2821077 	add	r1, r2, #119	; 0x77
   102b8:	eaffff97 	b	1011c <_free_r+0xf8>
   102bc:	e59f103c 	ldr	r1, [pc, #60]	; 10300 <_free_r+0x2dc>
   102c0:	e1520001 	cmp	r2, r1
   102c4:	91a02923 	lsrls	r2, r3, #18
   102c8:	9282407d 	addls	r4, r2, #125	; 0x7d
   102cc:	91a04184 	lslls	r4, r4, #3
   102d0:	9282107c 	addls	r1, r2, #124	; 0x7c
   102d4:	83a04ffe 	movhi	r4, #1016	; 0x3f8
   102d8:	83a0107e 	movhi	r1, #126	; 0x7e
   102dc:	eaffff8e 	b	1011c <_free_r+0xf8>
   102e0:	e3832001 	orr	r2, r3, #1
   102e4:	e58c2004 	str	r2, [ip, #4]
   102e8:	e5803000 	str	r3, [r0]
   102ec:	eaffff7f 	b	100f0 <_free_r+0xcc>
   102f0:	00013b04 	.word	0x00013b04
   102f4:	00013b0c 	.word	0x00013b0c
   102f8:	00013f10 	.word	0x00013f10
   102fc:	0003c170 	.word	0x0003c170
   10300:	00000554 	.word	0x00000554

00010304 <__sfvwrite_r>:
   10304:	e5923008 	ldr	r3, [r2, #8]
   10308:	e3530000 	cmp	r3, #0
   1030c:	0a0000cb 	beq	10640 <__sfvwrite_r+0x33c>
   10310:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10314:	e1d130fc 	ldrsh	r3, [r1, #12]
   10318:	e1a03803 	lsl	r3, r3, #16
   1031c:	e3130702 	tst	r3, #524288	; 0x80000
   10320:	e24dd00c 	sub	sp, sp, #12
   10324:	e1a04001 	mov	r4, r1
   10328:	e1a0b000 	mov	fp, r0
   1032c:	e1a06002 	mov	r6, r2
   10330:	e1a0a823 	lsr	sl, r3, #16
   10334:	0a000020 	beq	103bc <__sfvwrite_r+0xb8>
   10338:	e5912010 	ldr	r2, [r1, #16]
   1033c:	e3520000 	cmp	r2, #0
   10340:	0a00001d 	beq	103bc <__sfvwrite_r+0xb8>
   10344:	e21a9002 	ands	r9, sl, #2
   10348:	e5965000 	ldr	r5, [r6]
   1034c:	0a000025 	beq	103e8 <__sfvwrite_r+0xe4>
   10350:	e3a08000 	mov	r8, #0
   10354:	e1a07008 	mov	r7, r8
   10358:	e59f947c 	ldr	r9, [pc, #1148]	; 107dc <__sfvwrite_r+0x4d8>
   1035c:	e3570000 	cmp	r7, #0
   10360:	0a00004a 	beq	10490 <__sfvwrite_r+0x18c>
   10364:	e1570009 	cmp	r7, r9
   10368:	31a03007 	movcc	r3, r7
   1036c:	21a03009 	movcs	r3, r9
   10370:	e594a024 	ldr	sl, [r4, #36]	; 0x24
   10374:	e1a02008 	mov	r2, r8
   10378:	e594101c 	ldr	r1, [r4, #28]
   1037c:	e1a0000b 	mov	r0, fp
   10380:	e1a0e00f 	mov	lr, pc
   10384:	e12fff1a 	bx	sl
   10388:	e3500000 	cmp	r0, #0
   1038c:	da000089 	ble	105b8 <__sfvwrite_r+0x2b4>
   10390:	e5963008 	ldr	r3, [r6, #8]
   10394:	e0433000 	sub	r3, r3, r0
   10398:	e3530000 	cmp	r3, #0
   1039c:	e0888000 	add	r8, r8, r0
   103a0:	e0477000 	sub	r7, r7, r0
   103a4:	e5863008 	str	r3, [r6, #8]
   103a8:	1affffeb 	bne	1035c <__sfvwrite_r+0x58>
   103ac:	e3a00000 	mov	r0, #0
   103b0:	e28dd00c 	add	sp, sp, #12
   103b4:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   103b8:	e12fff1e 	bx	lr
   103bc:	e1a01004 	mov	r1, r4
   103c0:	e1a0000b 	mov	r0, fp
   103c4:	ebfffc33 	bl	f498 <__swsetup_r>
   103c8:	e3500000 	cmp	r0, #0
   103cc:	1a0000fc 	bne	107c4 <__sfvwrite_r+0x4c0>
   103d0:	e1d430fc 	ldrsh	r3, [r4, #12]
   103d4:	e1a03803 	lsl	r3, r3, #16
   103d8:	e1a0a823 	lsr	sl, r3, #16
   103dc:	e21a9002 	ands	r9, sl, #2
   103e0:	e5965000 	ldr	r5, [r6]
   103e4:	1affffd9 	bne	10350 <__sfvwrite_r+0x4c>
   103e8:	e21aa001 	ands	sl, sl, #1
   103ec:	01a0900a 	moveq	r9, sl
   103f0:	1a000094 	bne	10648 <__sfvwrite_r+0x344>
   103f4:	e3590000 	cmp	r9, #0
   103f8:	0a000020 	beq	10480 <__sfvwrite_r+0x17c>
   103fc:	e3130402 	tst	r3, #33554432	; 0x2000000
   10400:	e5947008 	ldr	r7, [r4, #8]
   10404:	e1a03823 	lsr	r3, r3, #16
   10408:	0a000024 	beq	104a0 <__sfvwrite_r+0x19c>
   1040c:	e1590007 	cmp	r9, r7
   10410:	e1a08007 	mov	r8, r7
   10414:	3a000037 	bcc	104f8 <__sfvwrite_r+0x1f4>
   10418:	e3130d12 	tst	r3, #1152	; 0x480
   1041c:	1a00003a 	bne	1050c <__sfvwrite_r+0x208>
   10420:	e1a03009 	mov	r3, r9
   10424:	e5940000 	ldr	r0, [r4]
   10428:	e1a02008 	mov	r2, r8
   1042c:	e1a0100a 	mov	r1, sl
   10430:	e58d3004 	str	r3, [sp, #4]
   10434:	ebfff536 	bl	d914 <memmove>
   10438:	e5941008 	ldr	r1, [r4, #8]
   1043c:	e5942000 	ldr	r2, [r4]
   10440:	e0417007 	sub	r7, r1, r7
   10444:	e0828008 	add	r8, r2, r8
   10448:	e5847008 	str	r7, [r4, #8]
   1044c:	e5848000 	str	r8, [r4]
   10450:	e59d3004 	ldr	r3, [sp, #4]
   10454:	e5962008 	ldr	r2, [r6, #8]
   10458:	e0422003 	sub	r2, r2, r3
   1045c:	e3520000 	cmp	r2, #0
   10460:	e08aa003 	add	sl, sl, r3
   10464:	e0499003 	sub	r9, r9, r3
   10468:	e5862008 	str	r2, [r6, #8]
   1046c:	0affffce 	beq	103ac <__sfvwrite_r+0xa8>
   10470:	e1d430fc 	ldrsh	r3, [r4, #12]
   10474:	e3590000 	cmp	r9, #0
   10478:	e1a03803 	lsl	r3, r3, #16
   1047c:	1affffde 	bne	103fc <__sfvwrite_r+0xf8>
   10480:	e595a000 	ldr	sl, [r5]
   10484:	e5959004 	ldr	r9, [r5, #4]
   10488:	e2855008 	add	r5, r5, #8
   1048c:	eaffffd8 	b	103f4 <__sfvwrite_r+0xf0>
   10490:	e5958000 	ldr	r8, [r5]
   10494:	e5957004 	ldr	r7, [r5, #4]
   10498:	e2855008 	add	r5, r5, #8
   1049c:	eaffffae 	b	1035c <__sfvwrite_r+0x58>
   104a0:	e5940000 	ldr	r0, [r4]
   104a4:	e5943010 	ldr	r3, [r4, #16]
   104a8:	e1500003 	cmp	r0, r3
   104ac:	8a000002 	bhi	104bc <__sfvwrite_r+0x1b8>
   104b0:	e5948014 	ldr	r8, [r4, #20]
   104b4:	e1590008 	cmp	r9, r8
   104b8:	2a000045 	bcs	105d4 <__sfvwrite_r+0x2d0>
   104bc:	e1570009 	cmp	r7, r9
   104c0:	21a07009 	movcs	r7, r9
   104c4:	e1a0100a 	mov	r1, sl
   104c8:	e1a02007 	mov	r2, r7
   104cc:	ebfff510 	bl	d914 <memmove>
   104d0:	e5942008 	ldr	r2, [r4, #8]
   104d4:	e5943000 	ldr	r3, [r4]
   104d8:	e0422007 	sub	r2, r2, r7
   104dc:	e0833007 	add	r3, r3, r7
   104e0:	e3520000 	cmp	r2, #0
   104e4:	e5842008 	str	r2, [r4, #8]
   104e8:	e5843000 	str	r3, [r4]
   104ec:	0a00002c 	beq	105a4 <__sfvwrite_r+0x2a0>
   104f0:	e1a03007 	mov	r3, r7
   104f4:	eaffffd6 	b	10454 <__sfvwrite_r+0x150>
   104f8:	e1a07009 	mov	r7, r9
   104fc:	e1a03009 	mov	r3, r9
   10500:	e1a08009 	mov	r8, r9
   10504:	e5940000 	ldr	r0, [r4]
   10508:	eaffffc6 	b	10428 <__sfvwrite_r+0x124>
   1050c:	e5941010 	ldr	r1, [r4, #16]
   10510:	e5948000 	ldr	r8, [r4]
   10514:	e5942014 	ldr	r2, [r4, #20]
   10518:	e0488001 	sub	r8, r8, r1
   1051c:	e0822082 	add	r2, r2, r2, lsl #1
   10520:	e2887001 	add	r7, r8, #1
   10524:	e0822fa2 	add	r2, r2, r2, lsr #31
   10528:	e0877009 	add	r7, r7, r9
   1052c:	e1a020c2 	asr	r2, r2, #1
   10530:	e1570002 	cmp	r7, r2
   10534:	91a07002 	movls	r7, r2
   10538:	81a02007 	movhi	r2, r7
   1053c:	e3130b01 	tst	r3, #1024	; 0x400
   10540:	0a000032 	beq	10610 <__sfvwrite_r+0x30c>
   10544:	e1a01002 	mov	r1, r2
   10548:	e1a0000b 	mov	r0, fp
   1054c:	eb000191 	bl	10b98 <_malloc_r>
   10550:	e2503000 	subs	r3, r0, #0
   10554:	0a00009c 	beq	107cc <__sfvwrite_r+0x4c8>
   10558:	e1a02008 	mov	r2, r8
   1055c:	e5941010 	ldr	r1, [r4, #16]
   10560:	e58d3004 	str	r3, [sp, #4]
   10564:	ebfff4a5 	bl	d800 <memcpy>
   10568:	e1d420bc 	ldrh	r2, [r4, #12]
   1056c:	e3c22d12 	bic	r2, r2, #1152	; 0x480
   10570:	e3822080 	orr	r2, r2, #128	; 0x80
   10574:	e1c420bc 	strh	r2, [r4, #12]
   10578:	e59d3004 	ldr	r3, [sp, #4]
   1057c:	e0830008 	add	r0, r3, r8
   10580:	e0478008 	sub	r8, r7, r8
   10584:	e5843010 	str	r3, [r4, #16]
   10588:	e5848008 	str	r8, [r4, #8]
   1058c:	e5847014 	str	r7, [r4, #20]
   10590:	e5840000 	str	r0, [r4]
   10594:	e1a07009 	mov	r7, r9
   10598:	e1a03009 	mov	r3, r9
   1059c:	e1a08009 	mov	r8, r9
   105a0:	eaffffa0 	b	10428 <__sfvwrite_r+0x124>
   105a4:	e1a01004 	mov	r1, r4
   105a8:	e1a0000b 	mov	r0, fp
   105ac:	ebfffca6 	bl	f84c <_fflush_r>
   105b0:	e3500000 	cmp	r0, #0
   105b4:	0affffcd 	beq	104f0 <__sfvwrite_r+0x1ec>
   105b8:	e1d430fc 	ldrsh	r3, [r4, #12]
   105bc:	e3e00000 	mvn	r0, #0
   105c0:	e3833040 	orr	r3, r3, #64	; 0x40
   105c4:	e1c430bc 	strh	r3, [r4, #12]
   105c8:	e28dd00c 	add	sp, sp, #12
   105cc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   105d0:	e12fff1e 	bx	lr
   105d4:	e3790106 	cmn	r9, #-2147483647	; 0x80000001
   105d8:	31a00009 	movcc	r0, r9
   105dc:	23e00102 	mvncs	r0, #-2147483648	; 0x80000000
   105e0:	e1a01008 	mov	r1, r8
   105e4:	ebfff3de 	bl	d564 <__divsi3>
   105e8:	e5947024 	ldr	r7, [r4, #36]	; 0x24
   105ec:	e0030098 	mul	r3, r8, r0
   105f0:	e1a0200a 	mov	r2, sl
   105f4:	e594101c 	ldr	r1, [r4, #28]
   105f8:	e1a0000b 	mov	r0, fp
   105fc:	e1a0e00f 	mov	lr, pc
   10600:	e12fff17 	bx	r7
   10604:	e2503000 	subs	r3, r0, #0
   10608:	caffff91 	bgt	10454 <__sfvwrite_r+0x150>
   1060c:	eaffffe9 	b	105b8 <__sfvwrite_r+0x2b4>
   10610:	e1a0000b 	mov	r0, fp
   10614:	eb0003b2 	bl	114e4 <_realloc_r>
   10618:	e2503000 	subs	r3, r0, #0
   1061c:	1affffd6 	bne	1057c <__sfvwrite_r+0x278>
   10620:	e5941010 	ldr	r1, [r4, #16]
   10624:	e1a0000b 	mov	r0, fp
   10628:	ebfffe7d 	bl	10024 <_free_r>
   1062c:	e3a0200c 	mov	r2, #12
   10630:	e1d430fc 	ldrsh	r3, [r4, #12]
   10634:	e58b2000 	str	r2, [fp]
   10638:	e3c33080 	bic	r3, r3, #128	; 0x80
   1063c:	eaffffde 	b	105bc <__sfvwrite_r+0x2b8>
   10640:	e3a00000 	mov	r0, #0
   10644:	e12fff1e 	bx	lr
   10648:	e1a00009 	mov	r0, r9
   1064c:	e1a0a009 	mov	sl, r9
   10650:	e1a08009 	mov	r8, r9
   10654:	ea000026 	b	106f4 <__sfvwrite_r+0x3f0>
   10658:	e3500000 	cmp	r0, #0
   1065c:	0a00002d 	beq	10718 <__sfvwrite_r+0x414>
   10660:	e1590008 	cmp	r9, r8
   10664:	31a01009 	movcc	r1, r9
   10668:	21a01008 	movcs	r1, r8
   1066c:	e5942010 	ldr	r2, [r4, #16]
   10670:	e594c014 	ldr	ip, [r4, #20]
   10674:	e5943008 	ldr	r3, [r4, #8]
   10678:	e5940000 	ldr	r0, [r4]
   1067c:	e08c3003 	add	r3, ip, r3
   10680:	e1500002 	cmp	r0, r2
   10684:	93a02000 	movls	r2, #0
   10688:	83a02001 	movhi	r2, #1
   1068c:	e1510003 	cmp	r1, r3
   10690:	d3a02000 	movle	r2, #0
   10694:	e3520000 	cmp	r2, #0
   10698:	e1a07001 	mov	r7, r1
   1069c:	1a000038 	bne	10784 <__sfvwrite_r+0x480>
   106a0:	e151000c 	cmp	r1, ip
   106a4:	ba000024 	blt	1073c <__sfvwrite_r+0x438>
   106a8:	e5947024 	ldr	r7, [r4, #36]	; 0x24
   106ac:	e1a0300c 	mov	r3, ip
   106b0:	e1a0200a 	mov	r2, sl
   106b4:	e594101c 	ldr	r1, [r4, #28]
   106b8:	e1a0000b 	mov	r0, fp
   106bc:	e1a0e00f 	mov	lr, pc
   106c0:	e12fff17 	bx	r7
   106c4:	e2507000 	subs	r7, r0, #0
   106c8:	daffffba 	ble	105b8 <__sfvwrite_r+0x2b4>
   106cc:	e0599007 	subs	r9, r9, r7
   106d0:	13a00001 	movne	r0, #1
   106d4:	0a000024 	beq	1076c <__sfvwrite_r+0x468>
   106d8:	e5963008 	ldr	r3, [r6, #8]
   106dc:	e0433007 	sub	r3, r3, r7
   106e0:	e3530000 	cmp	r3, #0
   106e4:	e08aa007 	add	sl, sl, r7
   106e8:	e0488007 	sub	r8, r8, r7
   106ec:	e5863008 	str	r3, [r6, #8]
   106f0:	0affff2d 	beq	103ac <__sfvwrite_r+0xa8>
   106f4:	e3580000 	cmp	r8, #0
   106f8:	1affffd6 	bne	10658 <__sfvwrite_r+0x354>
   106fc:	e2853008 	add	r3, r5, #8
   10700:	e5138004 	ldr	r8, [r3, #-4]
   10704:	e3580000 	cmp	r8, #0
   10708:	e1a05003 	mov	r5, r3
   1070c:	e513a008 	ldr	sl, [r3, #-8]
   10710:	e2833008 	add	r3, r3, #8
   10714:	0afffff9 	beq	10700 <__sfvwrite_r+0x3fc>
   10718:	e1a02008 	mov	r2, r8
   1071c:	e3a0100a 	mov	r1, #10
   10720:	e1a0000a 	mov	r0, sl
   10724:	eb00031e 	bl	113a4 <memchr>
   10728:	e3500000 	cmp	r0, #0
   1072c:	12800001 	addne	r0, r0, #1
   10730:	1040900a 	subne	r9, r0, sl
   10734:	02889001 	addeq	r9, r8, #1
   10738:	eaffffc8 	b	10660 <__sfvwrite_r+0x35c>
   1073c:	e1a02001 	mov	r2, r1
   10740:	e1a0100a 	mov	r1, sl
   10744:	ebfff472 	bl	d914 <memmove>
   10748:	e5942008 	ldr	r2, [r4, #8]
   1074c:	e5943000 	ldr	r3, [r4]
   10750:	e0422007 	sub	r2, r2, r7
   10754:	e0833007 	add	r3, r3, r7
   10758:	e0599007 	subs	r9, r9, r7
   1075c:	e5842008 	str	r2, [r4, #8]
   10760:	e5843000 	str	r3, [r4]
   10764:	13a00001 	movne	r0, #1
   10768:	1affffda 	bne	106d8 <__sfvwrite_r+0x3d4>
   1076c:	e1a01004 	mov	r1, r4
   10770:	e1a0000b 	mov	r0, fp
   10774:	ebfffc34 	bl	f84c <_fflush_r>
   10778:	e3500000 	cmp	r0, #0
   1077c:	0affffd5 	beq	106d8 <__sfvwrite_r+0x3d4>
   10780:	eaffff8c 	b	105b8 <__sfvwrite_r+0x2b4>
   10784:	e1a02003 	mov	r2, r3
   10788:	e1a0100a 	mov	r1, sl
   1078c:	e58d3004 	str	r3, [sp, #4]
   10790:	ebfff45f 	bl	d914 <memmove>
   10794:	e5942000 	ldr	r2, [r4]
   10798:	e59d3004 	ldr	r3, [sp, #4]
   1079c:	e0822003 	add	r2, r2, r3
   107a0:	e5842000 	str	r2, [r4]
   107a4:	e1a01004 	mov	r1, r4
   107a8:	e1a0000b 	mov	r0, fp
   107ac:	ebfffc26 	bl	f84c <_fflush_r>
   107b0:	e3500000 	cmp	r0, #0
   107b4:	e59d3004 	ldr	r3, [sp, #4]
   107b8:	1affff7e 	bne	105b8 <__sfvwrite_r+0x2b4>
   107bc:	e1a07003 	mov	r7, r3
   107c0:	eaffffc1 	b	106cc <__sfvwrite_r+0x3c8>
   107c4:	e3e00000 	mvn	r0, #0
   107c8:	eafffef8 	b	103b0 <__sfvwrite_r+0xac>
   107cc:	e3a0200c 	mov	r2, #12
   107d0:	e1d430fc 	ldrsh	r3, [r4, #12]
   107d4:	e58b2000 	str	r2, [fp]
   107d8:	eaffff77 	b	105bc <__sfvwrite_r+0x2b8>
   107dc:	7ffffc00 	.word	0x7ffffc00

000107e0 <_fwalk>:
   107e0:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   107e4:	e2907e2e 	adds	r7, r0, #736	; 0x2e0
   107e8:	0a000019 	beq	10854 <_fwalk+0x74>
   107ec:	e1a08001 	mov	r8, r1
   107f0:	e3a06000 	mov	r6, #0
   107f4:	e5975004 	ldr	r5, [r7, #4]
   107f8:	e2555001 	subs	r5, r5, #1
   107fc:	e5974008 	ldr	r4, [r7, #8]
   10800:	4a00000d 	bmi	1083c <_fwalk+0x5c>
   10804:	e1d430bc 	ldrh	r3, [r4, #12]
   10808:	e3530001 	cmp	r3, #1
   1080c:	e2455001 	sub	r5, r5, #1
   10810:	9a000006 	bls	10830 <_fwalk+0x50>
   10814:	e1d430fe 	ldrsh	r3, [r4, #14]
   10818:	e3730001 	cmn	r3, #1
   1081c:	0a000003 	beq	10830 <_fwalk+0x50>
   10820:	e1a00004 	mov	r0, r4
   10824:	e1a0e00f 	mov	lr, pc
   10828:	e12fff18 	bx	r8
   1082c:	e1866000 	orr	r6, r6, r0
   10830:	e3750001 	cmn	r5, #1
   10834:	e2844068 	add	r4, r4, #104	; 0x68
   10838:	1afffff1 	bne	10804 <_fwalk+0x24>
   1083c:	e5977000 	ldr	r7, [r7]
   10840:	e3570000 	cmp	r7, #0
   10844:	1affffea 	bne	107f4 <_fwalk+0x14>
   10848:	e1a00006 	mov	r0, r6
   1084c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   10850:	e12fff1e 	bx	lr
   10854:	e1a06007 	mov	r6, r7
   10858:	e1a00006 	mov	r0, r6
   1085c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   10860:	e12fff1e 	bx	lr

00010864 <_fwalk_reent>:
   10864:	e92d47f0 	push	{r4, r5, r6, r7, r8, r9, sl, lr}
   10868:	e2906e2e 	adds	r6, r0, #736	; 0x2e0
   1086c:	0a00001b 	beq	108e0 <_fwalk_reent+0x7c>
   10870:	e1a08001 	mov	r8, r1
   10874:	e1a07000 	mov	r7, r0
   10878:	e3a09000 	mov	r9, #0
   1087c:	e5965004 	ldr	r5, [r6, #4]
   10880:	e2555001 	subs	r5, r5, #1
   10884:	e5964008 	ldr	r4, [r6, #8]
   10888:	4a00000e 	bmi	108c8 <_fwalk_reent+0x64>
   1088c:	e1d430bc 	ldrh	r3, [r4, #12]
   10890:	e3530001 	cmp	r3, #1
   10894:	e2455001 	sub	r5, r5, #1
   10898:	9a000007 	bls	108bc <_fwalk_reent+0x58>
   1089c:	e1d430fe 	ldrsh	r3, [r4, #14]
   108a0:	e3730001 	cmn	r3, #1
   108a4:	0a000004 	beq	108bc <_fwalk_reent+0x58>
   108a8:	e1a01004 	mov	r1, r4
   108ac:	e1a00007 	mov	r0, r7
   108b0:	e1a0e00f 	mov	lr, pc
   108b4:	e12fff18 	bx	r8
   108b8:	e1899000 	orr	r9, r9, r0
   108bc:	e3750001 	cmn	r5, #1
   108c0:	e2844068 	add	r4, r4, #104	; 0x68
   108c4:	1afffff0 	bne	1088c <_fwalk_reent+0x28>
   108c8:	e5966000 	ldr	r6, [r6]
   108cc:	e3560000 	cmp	r6, #0
   108d0:	1affffe9 	bne	1087c <_fwalk_reent+0x18>
   108d4:	e1a00009 	mov	r0, r9
   108d8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
   108dc:	e12fff1e 	bx	lr
   108e0:	e1a09006 	mov	r9, r6
   108e4:	e1a00009 	mov	r0, r9
   108e8:	e8bd47f0 	pop	{r4, r5, r6, r7, r8, r9, sl, lr}
   108ec:	e12fff1e 	bx	lr

000108f0 <_setlocale_r>:
   108f0:	e92d4010 	push	{r4, lr}
   108f4:	e2524000 	subs	r4, r2, #0
   108f8:	0a000004 	beq	10910 <_setlocale_r+0x20>
   108fc:	e59f1048 	ldr	r1, [pc, #72]	; 1094c <_setlocale_r+0x5c>
   10900:	e1a00004 	mov	r0, r4
   10904:	ebfff499 	bl	db70 <strcmp>
   10908:	e3500000 	cmp	r0, #0
   1090c:	1a000002 	bne	1091c <_setlocale_r+0x2c>
   10910:	e59f0038 	ldr	r0, [pc, #56]	; 10950 <_setlocale_r+0x60>
   10914:	e8bd4010 	pop	{r4, lr}
   10918:	e12fff1e 	bx	lr
   1091c:	e59f102c 	ldr	r1, [pc, #44]	; 10950 <_setlocale_r+0x60>
   10920:	e1a00004 	mov	r0, r4
   10924:	ebfff491 	bl	db70 <strcmp>
   10928:	e3500000 	cmp	r0, #0
   1092c:	0afffff7 	beq	10910 <_setlocale_r+0x20>
   10930:	e1a00004 	mov	r0, r4
   10934:	e59f1018 	ldr	r1, [pc, #24]	; 10954 <_setlocale_r+0x64>
   10938:	ebfff48c 	bl	db70 <strcmp>
   1093c:	e3500000 	cmp	r0, #0
   10940:	0afffff2 	beq	10910 <_setlocale_r+0x20>
   10944:	e3a00000 	mov	r0, #0
   10948:	eafffff1 	b	10914 <_setlocale_r+0x24>
   1094c:	00013028 	.word	0x00013028
   10950:	00013024 	.word	0x00013024
   10954:	00012f9c 	.word	0x00012f9c

00010958 <__locale_mb_cur_max>:
   10958:	e59f3018 	ldr	r3, [pc, #24]	; 10978 <__locale_mb_cur_max+0x20>
   1095c:	e5933000 	ldr	r3, [r3]
   10960:	e5933034 	ldr	r3, [r3, #52]	; 0x34
   10964:	e59f2010 	ldr	r2, [pc, #16]	; 1097c <__locale_mb_cur_max+0x24>
   10968:	e3530000 	cmp	r3, #0
   1096c:	01a03002 	moveq	r3, r2
   10970:	e5d30128 	ldrb	r0, [r3, #296]	; 0x128
   10974:	e12fff1e 	bx	lr
   10978:	0001356c 	.word	0x0001356c
   1097c:	00013998 	.word	0x00013998

00010980 <__locale_ctype_ptr_l>:
   10980:	e59000ec 	ldr	r0, [r0, #236]	; 0xec
   10984:	e12fff1e 	bx	lr

00010988 <__locale_ctype_ptr>:
   10988:	e59f3018 	ldr	r3, [pc, #24]	; 109a8 <__locale_ctype_ptr+0x20>
   1098c:	e5933000 	ldr	r3, [r3]
   10990:	e5933034 	ldr	r3, [r3, #52]	; 0x34
   10994:	e59f2010 	ldr	r2, [pc, #16]	; 109ac <__locale_ctype_ptr+0x24>
   10998:	e3530000 	cmp	r3, #0
   1099c:	01a03002 	moveq	r3, r2
   109a0:	e59300ec 	ldr	r0, [r3, #236]	; 0xec
   109a4:	e12fff1e 	bx	lr
   109a8:	0001356c 	.word	0x0001356c
   109ac:	00013998 	.word	0x00013998

000109b0 <setlocale>:
   109b0:	e59f300c 	ldr	r3, [pc, #12]	; 109c4 <setlocale+0x14>
   109b4:	e1a02001 	mov	r2, r1
   109b8:	e1a01000 	mov	r1, r0
   109bc:	e5930000 	ldr	r0, [r3]
   109c0:	eaffffca 	b	108f0 <_setlocale_r>
   109c4:	0001356c 	.word	0x0001356c

000109c8 <__retarget_lock_init>:
   109c8:	e12fff1e 	bx	lr

000109cc <__retarget_lock_init_recursive>:
   109cc:	e12fff1e 	bx	lr

000109d0 <__retarget_lock_close>:
   109d0:	e12fff1e 	bx	lr

000109d4 <__retarget_lock_close_recursive>:
   109d4:	e12fff1e 	bx	lr

000109d8 <__retarget_lock_acquire>:
   109d8:	e12fff1e 	bx	lr

000109dc <__retarget_lock_acquire_recursive>:
   109dc:	e12fff1e 	bx	lr

000109e0 <__retarget_lock_try_acquire>:
   109e0:	e3a00001 	mov	r0, #1
   109e4:	e12fff1e 	bx	lr

000109e8 <__retarget_lock_try_acquire_recursive>:
   109e8:	e3a00001 	mov	r0, #1
   109ec:	e12fff1e 	bx	lr

000109f0 <__retarget_lock_release>:
   109f0:	e12fff1e 	bx	lr

000109f4 <__retarget_lock_release_recursive>:
   109f4:	e12fff1e 	bx	lr

000109f8 <__swhatbuf_r>:
   109f8:	e92d4070 	push	{r4, r5, r6, lr}
   109fc:	e1a04001 	mov	r4, r1
   10a00:	e1d110fe 	ldrsh	r1, [r1, #14]
   10a04:	e3510000 	cmp	r1, #0
   10a08:	e24dd040 	sub	sp, sp, #64	; 0x40
   10a0c:	e1a05002 	mov	r5, r2
   10a10:	e1a06003 	mov	r6, r3
   10a14:	ba00000f 	blt	10a58 <__swhatbuf_r+0x60>
   10a18:	e28d2004 	add	r2, sp, #4
   10a1c:	eb000610 	bl	12264 <_fstat_r>
   10a20:	e3500000 	cmp	r0, #0
   10a24:	ba00000b 	blt	10a58 <__swhatbuf_r+0x60>
   10a28:	e59d2008 	ldr	r2, [sp, #8]
   10a2c:	e2022a0f 	and	r2, r2, #61440	; 0xf000
   10a30:	e2423a02 	sub	r3, r2, #8192	; 0x2000
   10a34:	e2732000 	rsbs	r2, r3, #0
   10a38:	e0a22003 	adc	r2, r2, r3
   10a3c:	e3a00b02 	mov	r0, #2048	; 0x800
   10a40:	e3a03b01 	mov	r3, #1024	; 0x400
   10a44:	e5862000 	str	r2, [r6]
   10a48:	e5853000 	str	r3, [r5]
   10a4c:	e28dd040 	add	sp, sp, #64	; 0x40
   10a50:	e8bd4070 	pop	{r4, r5, r6, lr}
   10a54:	e12fff1e 	bx	lr
   10a58:	e3a03000 	mov	r3, #0
   10a5c:	e1d420bc 	ldrh	r2, [r4, #12]
   10a60:	e2120080 	ands	r0, r2, #128	; 0x80
   10a64:	e5863000 	str	r3, [r6]
   10a68:	0a000005 	beq	10a84 <__swhatbuf_r+0x8c>
   10a6c:	e3a02040 	mov	r2, #64	; 0x40
   10a70:	e1a00003 	mov	r0, r3
   10a74:	e5852000 	str	r2, [r5]
   10a78:	e28dd040 	add	sp, sp, #64	; 0x40
   10a7c:	e8bd4070 	pop	{r4, r5, r6, lr}
   10a80:	e12fff1e 	bx	lr
   10a84:	e3a03b01 	mov	r3, #1024	; 0x400
   10a88:	e5853000 	str	r3, [r5]
   10a8c:	e28dd040 	add	sp, sp, #64	; 0x40
   10a90:	e8bd4070 	pop	{r4, r5, r6, lr}
   10a94:	e12fff1e 	bx	lr

00010a98 <__smakebuf_r>:
   10a98:	e92d4070 	push	{r4, r5, r6, lr}
   10a9c:	e1d120bc 	ldrh	r2, [r1, #12]
   10aa0:	e3120002 	tst	r2, #2
   10aa4:	e24dd008 	sub	sp, sp, #8
   10aa8:	e1a04001 	mov	r4, r1
   10aac:	0a000007 	beq	10ad0 <__smakebuf_r+0x38>
   10ab0:	e3a01001 	mov	r1, #1
   10ab4:	e2842043 	add	r2, r4, #67	; 0x43
   10ab8:	e5841014 	str	r1, [r4, #20]
   10abc:	e5842000 	str	r2, [r4]
   10ac0:	e5842010 	str	r2, [r4, #16]
   10ac4:	e28dd008 	add	sp, sp, #8
   10ac8:	e8bd4070 	pop	{r4, r5, r6, lr}
   10acc:	e12fff1e 	bx	lr
   10ad0:	e28d3004 	add	r3, sp, #4
   10ad4:	e1a0200d 	mov	r2, sp
   10ad8:	e1a06000 	mov	r6, r0
   10adc:	ebffffc5 	bl	109f8 <__swhatbuf_r>
   10ae0:	e59d1000 	ldr	r1, [sp]
   10ae4:	e1a05000 	mov	r5, r0
   10ae8:	e1a00006 	mov	r0, r6
   10aec:	eb000029 	bl	10b98 <_malloc_r>
   10af0:	e3500000 	cmp	r0, #0
   10af4:	e1d430fc 	ldrsh	r3, [r4, #12]
   10af8:	0a00001a 	beq	10b68 <__smakebuf_r+0xd0>
   10afc:	e59dc004 	ldr	ip, [sp, #4]
   10b00:	e59f108c 	ldr	r1, [pc, #140]	; 10b94 <__smakebuf_r+0xfc>
   10b04:	e59d2000 	ldr	r2, [sp]
   10b08:	e3833080 	orr	r3, r3, #128	; 0x80
   10b0c:	e35c0000 	cmp	ip, #0
   10b10:	e586103c 	str	r1, [r6, #60]	; 0x3c
   10b14:	e1c430bc 	strh	r3, [r4, #12]
   10b18:	e5840000 	str	r0, [r4]
   10b1c:	e5840010 	str	r0, [r4, #16]
   10b20:	e5842014 	str	r2, [r4, #20]
   10b24:	1a000004 	bne	10b3c <__smakebuf_r+0xa4>
   10b28:	e1833005 	orr	r3, r3, r5
   10b2c:	e1c430bc 	strh	r3, [r4, #12]
   10b30:	e28dd008 	add	sp, sp, #8
   10b34:	e8bd4070 	pop	{r4, r5, r6, lr}
   10b38:	e12fff1e 	bx	lr
   10b3c:	e1a00006 	mov	r0, r6
   10b40:	e1d410fe 	ldrsh	r1, [r4, #14]
   10b44:	eb0005d7 	bl	122a8 <_isatty_r>
   10b48:	e3500000 	cmp	r0, #0
   10b4c:	11d430bc 	ldrhne	r3, [r4, #12]
   10b50:	13c33003 	bicne	r3, r3, #3
   10b54:	13833001 	orrne	r3, r3, #1
   10b58:	11a03803 	lslne	r3, r3, #16
   10b5c:	01d430fc 	ldrsheq	r3, [r4, #12]
   10b60:	11a03843 	asrne	r3, r3, #16
   10b64:	eaffffef 	b	10b28 <__smakebuf_r+0x90>
   10b68:	e3130c02 	tst	r3, #512	; 0x200
   10b6c:	1affffd4 	bne	10ac4 <__smakebuf_r+0x2c>
   10b70:	e3a01001 	mov	r1, #1
   10b74:	e3c33003 	bic	r3, r3, #3
   10b78:	e2842043 	add	r2, r4, #67	; 0x43
   10b7c:	e3833002 	orr	r3, r3, #2
   10b80:	e1c430bc 	strh	r3, [r4, #12]
   10b84:	e5841014 	str	r1, [r4, #20]
   10b88:	e5842000 	str	r2, [r4]
   10b8c:	e5842010 	str	r2, [r4, #16]
   10b90:	eaffffcb 	b	10ac4 <__smakebuf_r+0x2c>
   10b94:	0000f920 	.word	0x0000f920

00010b98 <_malloc_r>:
   10b98:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10b9c:	e281600b 	add	r6, r1, #11
   10ba0:	e3560016 	cmp	r6, #22
   10ba4:	e24dd00c 	sub	sp, sp, #12
   10ba8:	e1a05000 	mov	r5, r0
   10bac:	9a000072 	bls	10d7c <_malloc_r+0x1e4>
   10bb0:	e3c66007 	bic	r6, r6, #7
   10bb4:	e1510006 	cmp	r1, r6
   10bb8:	93a01000 	movls	r1, #0
   10bbc:	83a01001 	movhi	r1, #1
   10bc0:	e1913fa6 	orrs	r3, r1, r6, lsr #31
   10bc4:	1a000089 	bne	10df0 <_malloc_r+0x258>
   10bc8:	eb000239 	bl	114b4 <__malloc_lock>
   10bcc:	e3560f7e 	cmp	r6, #504	; 0x1f8
   10bd0:	3a0001c8 	bcc	112f8 <_malloc_r+0x760>
   10bd4:	e1b034a6 	lsrs	r3, r6, #9
   10bd8:	0a00008b 	beq	10e0c <_malloc_r+0x274>
   10bdc:	e3530004 	cmp	r3, #4
   10be0:	8a0000d6 	bhi	10f40 <_malloc_r+0x3a8>
   10be4:	e1a03326 	lsr	r3, r6, #6
   10be8:	e2830039 	add	r0, r3, #57	; 0x39
   10bec:	e283c038 	add	ip, r3, #56	; 0x38
   10bf0:	e1a01180 	lsl	r1, r0, #3
   10bf4:	e59f7708 	ldr	r7, [pc, #1800]	; 11304 <_malloc_r+0x76c>
   10bf8:	e0871001 	add	r1, r7, r1
   10bfc:	e5914004 	ldr	r4, [r1, #4]
   10c00:	e2411008 	sub	r1, r1, #8
   10c04:	e1510004 	cmp	r1, r4
   10c08:	1a000005 	bne	10c24 <_malloc_r+0x8c>
   10c0c:	ea00000a 	b	10c3c <_malloc_r+0xa4>
   10c10:	e3520000 	cmp	r2, #0
   10c14:	aa000066 	bge	10db4 <_malloc_r+0x21c>
   10c18:	e594400c 	ldr	r4, [r4, #12]
   10c1c:	e1510004 	cmp	r1, r4
   10c20:	0a000005 	beq	10c3c <_malloc_r+0xa4>
   10c24:	e5943004 	ldr	r3, [r4, #4]
   10c28:	e3c33003 	bic	r3, r3, #3
   10c2c:	e0432006 	sub	r2, r3, r6
   10c30:	e352000f 	cmp	r2, #15
   10c34:	dafffff5 	ble	10c10 <_malloc_r+0x78>
   10c38:	e1a0000c 	mov	r0, ip
   10c3c:	e5974010 	ldr	r4, [r7, #16]
   10c40:	e59fc6c0 	ldr	ip, [pc, #1728]	; 11308 <_malloc_r+0x770>
   10c44:	e154000c 	cmp	r4, ip
   10c48:	05973004 	ldreq	r3, [r7, #4]
   10c4c:	0a000018 	beq	10cb4 <_malloc_r+0x11c>
   10c50:	e5943004 	ldr	r3, [r4, #4]
   10c54:	e3c33003 	bic	r3, r3, #3
   10c58:	e0432006 	sub	r2, r3, r6
   10c5c:	e352000f 	cmp	r2, #15
   10c60:	ca0000da 	bgt	10fd0 <_malloc_r+0x438>
   10c64:	e3520000 	cmp	r2, #0
   10c68:	e587c014 	str	ip, [r7, #20]
   10c6c:	e587c010 	str	ip, [r7, #16]
   10c70:	aa000069 	bge	10e1c <_malloc_r+0x284>
   10c74:	e3530c02 	cmp	r3, #512	; 0x200
   10c78:	2a0000b9 	bcs	10f64 <_malloc_r+0x3cc>
   10c7c:	e3a08001 	mov	r8, #1
   10c80:	e5972004 	ldr	r2, [r7, #4]
   10c84:	e1a031a3 	lsr	r3, r3, #3
   10c88:	e0831008 	add	r1, r3, r8
   10c8c:	e1a03143 	asr	r3, r3, #2
   10c90:	e1823318 	orr	r3, r2, r8, lsl r3
   10c94:	e087e181 	add	lr, r7, r1, lsl #3
   10c98:	e7978181 	ldr	r8, [r7, r1, lsl #3]
   10c9c:	e24e2008 	sub	r2, lr, #8
   10ca0:	e584200c 	str	r2, [r4, #12]
   10ca4:	e5848008 	str	r8, [r4, #8]
   10ca8:	e5873004 	str	r3, [r7, #4]
   10cac:	e7874181 	str	r4, [r7, r1, lsl #3]
   10cb0:	e588400c 	str	r4, [r8, #12]
   10cb4:	e3a01001 	mov	r1, #1
   10cb8:	e1a02140 	asr	r2, r0, #2
   10cbc:	e1a0e211 	lsl	lr, r1, r2
   10cc0:	e15e0003 	cmp	lr, r3
   10cc4:	8a00005f 	bhi	10e48 <_malloc_r+0x2b0>
   10cc8:	e11e0003 	tst	lr, r3
   10ccc:	1a000008 	bne	10cf4 <_malloc_r+0x15c>
   10cd0:	e1a0e11e 	lsl	lr, lr, r1
   10cd4:	e3c00003 	bic	r0, r0, #3
   10cd8:	e11e0003 	tst	lr, r3
   10cdc:	e2800004 	add	r0, r0, #4
   10ce0:	1a000003 	bne	10cf4 <_malloc_r+0x15c>
   10ce4:	e1a0e08e 	lsl	lr, lr, #1
   10ce8:	e11e0003 	tst	lr, r3
   10cec:	e2800004 	add	r0, r0, #4
   10cf0:	0afffffb 	beq	10ce4 <_malloc_r+0x14c>
   10cf4:	e0879180 	add	r9, r7, r0, lsl #3
   10cf8:	e1a01009 	mov	r1, r9
   10cfc:	e1a04000 	mov	r4, r0
   10d00:	e591800c 	ldr	r8, [r1, #12]
   10d04:	e1510008 	cmp	r1, r8
   10d08:	1a000005 	bne	10d24 <_malloc_r+0x18c>
   10d0c:	ea0000bc 	b	11004 <_malloc_r+0x46c>
   10d10:	e3520000 	cmp	r2, #0
   10d14:	aa0000c4 	bge	1102c <_malloc_r+0x494>
   10d18:	e598800c 	ldr	r8, [r8, #12]
   10d1c:	e1510008 	cmp	r1, r8
   10d20:	0a0000b7 	beq	11004 <_malloc_r+0x46c>
   10d24:	e5983004 	ldr	r3, [r8, #4]
   10d28:	e3c33003 	bic	r3, r3, #3
   10d2c:	e0432006 	sub	r2, r3, r6
   10d30:	e352000f 	cmp	r2, #15
   10d34:	dafffff5 	ble	10d10 <_malloc_r+0x178>
   10d38:	e598100c 	ldr	r1, [r8, #12]
   10d3c:	e598e008 	ldr	lr, [r8, #8]
   10d40:	e3864001 	orr	r4, r6, #1
   10d44:	e5884004 	str	r4, [r8, #4]
   10d48:	e0886006 	add	r6, r8, r6
   10d4c:	e3824001 	orr	r4, r2, #1
   10d50:	e58e100c 	str	r1, [lr, #12]
   10d54:	e1a00005 	mov	r0, r5
   10d58:	e581e008 	str	lr, [r1, #8]
   10d5c:	e5876014 	str	r6, [r7, #20]
   10d60:	e5876010 	str	r6, [r7, #16]
   10d64:	e9861010 	stmib	r6, {r4, ip}
   10d68:	e586c00c 	str	ip, [r6, #12]
   10d6c:	e7882003 	str	r2, [r8, r3]
   10d70:	eb0001d5 	bl	114cc <__malloc_unlock>
   10d74:	e2884008 	add	r4, r8, #8
   10d78:	ea000018 	b	10de0 <_malloc_r+0x248>
   10d7c:	e3510010 	cmp	r1, #16
   10d80:	8a00001a 	bhi	10df0 <_malloc_r+0x258>
   10d84:	eb0001ca 	bl	114b4 <__malloc_lock>
   10d88:	e3a06010 	mov	r6, #16
   10d8c:	e3a03018 	mov	r3, #24
   10d90:	e3a00002 	mov	r0, #2
   10d94:	e59f7568 	ldr	r7, [pc, #1384]	; 11304 <_malloc_r+0x76c>
   10d98:	e0873003 	add	r3, r7, r3
   10d9c:	e5934004 	ldr	r4, [r3, #4]
   10da0:	e2432008 	sub	r2, r3, #8
   10da4:	e1540002 	cmp	r4, r2
   10da8:	0a00009a 	beq	11018 <_malloc_r+0x480>
   10dac:	e5943004 	ldr	r3, [r4, #4]
   10db0:	e3c33003 	bic	r3, r3, #3
   10db4:	e0843003 	add	r3, r4, r3
   10db8:	e5932004 	ldr	r2, [r3, #4]
   10dbc:	e594100c 	ldr	r1, [r4, #12]
   10dc0:	e594c008 	ldr	ip, [r4, #8]
   10dc4:	e3822001 	orr	r2, r2, #1
   10dc8:	e58c100c 	str	r1, [ip, #12]
   10dcc:	e1a00005 	mov	r0, r5
   10dd0:	e581c008 	str	ip, [r1, #8]
   10dd4:	e5832004 	str	r2, [r3, #4]
   10dd8:	eb0001bb 	bl	114cc <__malloc_unlock>
   10ddc:	e2844008 	add	r4, r4, #8
   10de0:	e1a00004 	mov	r0, r4
   10de4:	e28dd00c 	add	sp, sp, #12
   10de8:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10dec:	e12fff1e 	bx	lr
   10df0:	e3a04000 	mov	r4, #0
   10df4:	e3a0300c 	mov	r3, #12
   10df8:	e1a00004 	mov	r0, r4
   10dfc:	e5853000 	str	r3, [r5]
   10e00:	e28dd00c 	add	sp, sp, #12
   10e04:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10e08:	e12fff1e 	bx	lr
   10e0c:	e3a01c02 	mov	r1, #512	; 0x200
   10e10:	e3a00040 	mov	r0, #64	; 0x40
   10e14:	e3a0c03f 	mov	ip, #63	; 0x3f
   10e18:	eaffff75 	b	10bf4 <_malloc_r+0x5c>
   10e1c:	e0843003 	add	r3, r4, r3
   10e20:	e5932004 	ldr	r2, [r3, #4]
   10e24:	e3822001 	orr	r2, r2, #1
   10e28:	e1a00005 	mov	r0, r5
   10e2c:	e5832004 	str	r2, [r3, #4]
   10e30:	e2844008 	add	r4, r4, #8
   10e34:	eb0001a4 	bl	114cc <__malloc_unlock>
   10e38:	e1a00004 	mov	r0, r4
   10e3c:	e28dd00c 	add	sp, sp, #12
   10e40:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10e44:	e12fff1e 	bx	lr
   10e48:	e5974008 	ldr	r4, [r7, #8]
   10e4c:	e5943004 	ldr	r3, [r4, #4]
   10e50:	e3c39003 	bic	r9, r3, #3
   10e54:	e0493006 	sub	r3, r9, r6
   10e58:	e353000f 	cmp	r3, #15
   10e5c:	c3a02000 	movgt	r2, #0
   10e60:	d3a02001 	movle	r2, #1
   10e64:	e1590006 	cmp	r9, r6
   10e68:	33822001 	orrcc	r2, r2, #1
   10e6c:	e3520000 	cmp	r2, #0
   10e70:	0a000025 	beq	10f0c <_malloc_r+0x374>
   10e74:	e59fa490 	ldr	sl, [pc, #1168]	; 1130c <_malloc_r+0x774>
   10e78:	e59f2490 	ldr	r2, [pc, #1168]	; 11310 <_malloc_r+0x778>
   10e7c:	e59a3000 	ldr	r3, [sl]
   10e80:	e5922000 	ldr	r2, [r2]
   10e84:	e3730001 	cmn	r3, #1
   10e88:	e0862002 	add	r2, r6, r2
   10e8c:	12823a01 	addne	r3, r2, #4096	; 0x1000
   10e90:	1283300f 	addne	r3, r3, #15
   10e94:	13c32eff 	bicne	r2, r3, #4080	; 0xff0
   10e98:	02822010 	addeq	r2, r2, #16
   10e9c:	13c2200f 	bicne	r2, r2, #15
   10ea0:	e1a01002 	mov	r1, r2
   10ea4:	e1a00005 	mov	r0, r5
   10ea8:	e58d2004 	str	r2, [sp, #4]
   10eac:	eb0002c1 	bl	119b8 <_sbrk_r>
   10eb0:	e3700001 	cmn	r0, #1
   10eb4:	e1a0b000 	mov	fp, r0
   10eb8:	e59d2004 	ldr	r2, [sp, #4]
   10ebc:	0a000003 	beq	10ed0 <_malloc_r+0x338>
   10ec0:	e0843009 	add	r3, r4, r9
   10ec4:	e1540007 	cmp	r4, r7
   10ec8:	11530000 	cmpne	r3, r0
   10ecc:	9a000084 	bls	110e4 <_malloc_r+0x54c>
   10ed0:	e5974008 	ldr	r4, [r7, #8]
   10ed4:	e5943004 	ldr	r3, [r4, #4]
   10ed8:	e3c33003 	bic	r3, r3, #3
   10edc:	e1560003 	cmp	r6, r3
   10ee0:	93a02000 	movls	r2, #0
   10ee4:	83a02001 	movhi	r2, #1
   10ee8:	e0433006 	sub	r3, r3, r6
   10eec:	e353000f 	cmp	r3, #15
   10ef0:	d3822001 	orrle	r2, r2, #1
   10ef4:	e3520000 	cmp	r2, #0
   10ef8:	0a000003 	beq	10f0c <_malloc_r+0x374>
   10efc:	e1a00005 	mov	r0, r5
   10f00:	eb000171 	bl	114cc <__malloc_unlock>
   10f04:	e3a04000 	mov	r4, #0
   10f08:	eaffffb4 	b	10de0 <_malloc_r+0x248>
   10f0c:	e3862001 	orr	r2, r6, #1
   10f10:	e3833001 	orr	r3, r3, #1
   10f14:	e0846006 	add	r6, r4, r6
   10f18:	e5842004 	str	r2, [r4, #4]
   10f1c:	e1a00005 	mov	r0, r5
   10f20:	e5876008 	str	r6, [r7, #8]
   10f24:	e2844008 	add	r4, r4, #8
   10f28:	e5863004 	str	r3, [r6, #4]
   10f2c:	eb000166 	bl	114cc <__malloc_unlock>
   10f30:	e1a00004 	mov	r0, r4
   10f34:	e28dd00c 	add	sp, sp, #12
   10f38:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   10f3c:	e12fff1e 	bx	lr
   10f40:	e3530014 	cmp	r3, #20
   10f44:	9a000044 	bls	1105c <_malloc_r+0x4c4>
   10f48:	e3530054 	cmp	r3, #84	; 0x54
   10f4c:	8a0000a8 	bhi	111f4 <_malloc_r+0x65c>
   10f50:	e1a03626 	lsr	r3, r6, #12
   10f54:	e283006f 	add	r0, r3, #111	; 0x6f
   10f58:	e283c06e 	add	ip, r3, #110	; 0x6e
   10f5c:	e1a01180 	lsl	r1, r0, #3
   10f60:	eaffff23 	b	10bf4 <_malloc_r+0x5c>
   10f64:	e1a024a3 	lsr	r2, r3, #9
   10f68:	e3520004 	cmp	r2, #4
   10f6c:	9a00003e 	bls	1106c <_malloc_r+0x4d4>
   10f70:	e3520014 	cmp	r2, #20
   10f74:	8a0000b4 	bhi	1124c <_malloc_r+0x6b4>
   10f78:	e282805c 	add	r8, r2, #92	; 0x5c
   10f7c:	e1a08188 	lsl	r8, r8, #3
   10f80:	e282105b 	add	r1, r2, #91	; 0x5b
   10f84:	e087e008 	add	lr, r7, r8
   10f88:	e7972008 	ldr	r2, [r7, r8]
   10f8c:	e24ee008 	sub	lr, lr, #8
   10f90:	e15e0002 	cmp	lr, r2
   10f94:	0a00009d 	beq	11210 <_malloc_r+0x678>
   10f98:	e5921004 	ldr	r1, [r2, #4]
   10f9c:	e3c11003 	bic	r1, r1, #3
   10fa0:	e1530001 	cmp	r3, r1
   10fa4:	2a000090 	bcs	111ec <_malloc_r+0x654>
   10fa8:	e5922008 	ldr	r2, [r2, #8]
   10fac:	e15e0002 	cmp	lr, r2
   10fb0:	1afffff8 	bne	10f98 <_malloc_r+0x400>
   10fb4:	e59e200c 	ldr	r2, [lr, #12]
   10fb8:	e5973004 	ldr	r3, [r7, #4]
   10fbc:	e584200c 	str	r2, [r4, #12]
   10fc0:	e584e008 	str	lr, [r4, #8]
   10fc4:	e5824008 	str	r4, [r2, #8]
   10fc8:	e58e400c 	str	r4, [lr, #12]
   10fcc:	eaffff38 	b	10cb4 <_malloc_r+0x11c>
   10fd0:	e386e001 	orr	lr, r6, #1
   10fd4:	e3821001 	orr	r1, r2, #1
   10fd8:	e0846006 	add	r6, r4, r6
   10fdc:	e584e004 	str	lr, [r4, #4]
   10fe0:	e1a00005 	mov	r0, r5
   10fe4:	e5876014 	str	r6, [r7, #20]
   10fe8:	e5876010 	str	r6, [r7, #16]
   10fec:	e586c00c 	str	ip, [r6, #12]
   10ff0:	e9861002 	stmib	r6, {r1, ip}
   10ff4:	e7842003 	str	r2, [r4, r3]
   10ff8:	eb000133 	bl	114cc <__malloc_unlock>
   10ffc:	e2844008 	add	r4, r4, #8
   11000:	eaffff76 	b	10de0 <_malloc_r+0x248>
   11004:	e2844001 	add	r4, r4, #1
   11008:	e3140003 	tst	r4, #3
   1100c:	e2811008 	add	r1, r1, #8
   11010:	1affff3a 	bne	10d00 <_malloc_r+0x168>
   11014:	ea00001d 	b	11090 <_malloc_r+0x4f8>
   11018:	e593400c 	ldr	r4, [r3, #12]
   1101c:	e1530004 	cmp	r3, r4
   11020:	02800002 	addeq	r0, r0, #2
   11024:	0affff04 	beq	10c3c <_malloc_r+0xa4>
   11028:	eaffff5f 	b	10dac <_malloc_r+0x214>
   1102c:	e1a04008 	mov	r4, r8
   11030:	e0883003 	add	r3, r8, r3
   11034:	e5932004 	ldr	r2, [r3, #4]
   11038:	e598100c 	ldr	r1, [r8, #12]
   1103c:	e5b4c008 	ldr	ip, [r4, #8]!
   11040:	e3822001 	orr	r2, r2, #1
   11044:	e5832004 	str	r2, [r3, #4]
   11048:	e1a00005 	mov	r0, r5
   1104c:	e58c100c 	str	r1, [ip, #12]
   11050:	e581c008 	str	ip, [r1, #8]
   11054:	eb00011c 	bl	114cc <__malloc_unlock>
   11058:	eaffff60 	b	10de0 <_malloc_r+0x248>
   1105c:	e283005c 	add	r0, r3, #92	; 0x5c
   11060:	e283c05b 	add	ip, r3, #91	; 0x5b
   11064:	e1a01180 	lsl	r1, r0, #3
   11068:	eafffee1 	b	10bf4 <_malloc_r+0x5c>
   1106c:	e1a02323 	lsr	r2, r3, #6
   11070:	e2828039 	add	r8, r2, #57	; 0x39
   11074:	e1a08188 	lsl	r8, r8, #3
   11078:	e2821038 	add	r1, r2, #56	; 0x38
   1107c:	eaffffc0 	b	10f84 <_malloc_r+0x3ec>
   11080:	e4193008 	ldr	r3, [r9], #-8
   11084:	e1590003 	cmp	r9, r3
   11088:	e2400001 	sub	r0, r0, #1
   1108c:	1a000097 	bne	112f0 <_malloc_r+0x758>
   11090:	e3100003 	tst	r0, #3
   11094:	1afffff9 	bne	11080 <_malloc_r+0x4e8>
   11098:	e5973004 	ldr	r3, [r7, #4]
   1109c:	e1c3300e 	bic	r3, r3, lr
   110a0:	e5873004 	str	r3, [r7, #4]
   110a4:	e1b0e08e 	lsls	lr, lr, #1
   110a8:	13a02001 	movne	r2, #1
   110ac:	03a02000 	moveq	r2, #0
   110b0:	e15e0003 	cmp	lr, r3
   110b4:	83a02000 	movhi	r2, #0
   110b8:	92022001 	andls	r2, r2, #1
   110bc:	e3520000 	cmp	r2, #0
   110c0:	0affff60 	beq	10e48 <_malloc_r+0x2b0>
   110c4:	e11e0003 	tst	lr, r3
   110c8:	e1a00004 	mov	r0, r4
   110cc:	1affff08 	bne	10cf4 <_malloc_r+0x15c>
   110d0:	e1a0e08e 	lsl	lr, lr, #1
   110d4:	e11e0003 	tst	lr, r3
   110d8:	e2800004 	add	r0, r0, #4
   110dc:	0afffffb 	beq	110d0 <_malloc_r+0x538>
   110e0:	eaffff03 	b	10cf4 <_malloc_r+0x15c>
   110e4:	e59f8228 	ldr	r8, [pc, #552]	; 11314 <_malloc_r+0x77c>
   110e8:	e5981000 	ldr	r1, [r8]
   110ec:	e1530000 	cmp	r3, r0
   110f0:	e0821001 	add	r1, r2, r1
   110f4:	e5881000 	str	r1, [r8]
   110f8:	0a00005e 	beq	11278 <_malloc_r+0x6e0>
   110fc:	e59a0000 	ldr	r0, [sl]
   11100:	e3700001 	cmn	r0, #1
   11104:	104b3003 	subne	r3, fp, r3
   11108:	10831001 	addne	r1, r3, r1
   1110c:	058ab000 	streq	fp, [sl]
   11110:	15881000 	strne	r1, [r8]
   11114:	e21b1007 	ands	r1, fp, #7
   11118:	03a01a01 	moveq	r1, #4096	; 0x1000
   1111c:	12613008 	rsbne	r3, r1, #8
   11120:	108bb003 	addne	fp, fp, r3
   11124:	e08b2002 	add	r2, fp, r2
   11128:	12611a01 	rsbne	r1, r1, #4096	; 0x1000
   1112c:	e1a02a02 	lsl	r2, r2, #20
   11130:	12811008 	addne	r1, r1, #8
   11134:	e1a02a22 	lsr	r2, r2, #20
   11138:	e041a002 	sub	sl, r1, r2
   1113c:	e1a0100a 	mov	r1, sl
   11140:	e1a00005 	mov	r0, r5
   11144:	eb00021b 	bl	119b8 <_sbrk_r>
   11148:	e3700001 	cmn	r0, #1
   1114c:	03a0a000 	moveq	sl, #0
   11150:	03a03001 	moveq	r3, #1
   11154:	1040300b 	subne	r3, r0, fp
   11158:	e5981000 	ldr	r1, [r8]
   1115c:	1083300a 	addne	r3, r3, sl
   11160:	13833001 	orrne	r3, r3, #1
   11164:	e08a1001 	add	r1, sl, r1
   11168:	e1540007 	cmp	r4, r7
   1116c:	e587b008 	str	fp, [r7, #8]
   11170:	e5881000 	str	r1, [r8]
   11174:	e58b3004 	str	r3, [fp, #4]
   11178:	0a00000f 	beq	111bc <_malloc_r+0x624>
   1117c:	e359000f 	cmp	r9, #15
   11180:	93a03001 	movls	r3, #1
   11184:	958b3004 	strls	r3, [fp, #4]
   11188:	9affff5b 	bls	10efc <_malloc_r+0x364>
   1118c:	e3a00005 	mov	r0, #5
   11190:	e5942004 	ldr	r2, [r4, #4]
   11194:	e249300c 	sub	r3, r9, #12
   11198:	e3c33007 	bic	r3, r3, #7
   1119c:	e2022001 	and	r2, r2, #1
   111a0:	e1822003 	orr	r2, r2, r3
   111a4:	e353000f 	cmp	r3, #15
   111a8:	e0843003 	add	r3, r4, r3
   111ac:	e5842004 	str	r2, [r4, #4]
   111b0:	e5830004 	str	r0, [r3, #4]
   111b4:	e5830008 	str	r0, [r3, #8]
   111b8:	8a000037 	bhi	1129c <_malloc_r+0x704>
   111bc:	e59f3154 	ldr	r3, [pc, #340]	; 11318 <_malloc_r+0x780>
   111c0:	e5932000 	ldr	r2, [r3]
   111c4:	e1510002 	cmp	r1, r2
   111c8:	e59f214c 	ldr	r2, [pc, #332]	; 1131c <_malloc_r+0x784>
   111cc:	85831000 	strhi	r1, [r3]
   111d0:	e5974008 	ldr	r4, [r7, #8]
   111d4:	e5923000 	ldr	r3, [r2]
   111d8:	e1510003 	cmp	r1, r3
   111dc:	e5943004 	ldr	r3, [r4, #4]
   111e0:	85821000 	strhi	r1, [r2]
   111e4:	e3c33003 	bic	r3, r3, #3
   111e8:	eaffff3b 	b	10edc <_malloc_r+0x344>
   111ec:	e1a0e002 	mov	lr, r2
   111f0:	eaffff6f 	b	10fb4 <_malloc_r+0x41c>
   111f4:	e3530f55 	cmp	r3, #340	; 0x154
   111f8:	8a00000b 	bhi	1122c <_malloc_r+0x694>
   111fc:	e1a037a6 	lsr	r3, r6, #15
   11200:	e2830078 	add	r0, r3, #120	; 0x78
   11204:	e283c077 	add	ip, r3, #119	; 0x77
   11208:	e1a01180 	lsl	r1, r0, #3
   1120c:	eafffe78 	b	10bf4 <_malloc_r+0x5c>
   11210:	e3a08001 	mov	r8, #1
   11214:	e5973004 	ldr	r3, [r7, #4]
   11218:	e1a02141 	asr	r2, r1, #2
   1121c:	e1833218 	orr	r3, r3, r8, lsl r2
   11220:	e5873004 	str	r3, [r7, #4]
   11224:	e1a0200e 	mov	r2, lr
   11228:	eaffff63 	b	10fbc <_malloc_r+0x424>
   1122c:	e59f20ec 	ldr	r2, [pc, #236]	; 11320 <_malloc_r+0x788>
   11230:	e1530002 	cmp	r3, r2
   11234:	8a00000b 	bhi	11268 <_malloc_r+0x6d0>
   11238:	e1a03926 	lsr	r3, r6, #18
   1123c:	e283007d 	add	r0, r3, #125	; 0x7d
   11240:	e283c07c 	add	ip, r3, #124	; 0x7c
   11244:	e1a01180 	lsl	r1, r0, #3
   11248:	eafffe69 	b	10bf4 <_malloc_r+0x5c>
   1124c:	e3520054 	cmp	r2, #84	; 0x54
   11250:	8a000016 	bhi	112b0 <_malloc_r+0x718>
   11254:	e1a02623 	lsr	r2, r3, #12
   11258:	e282806f 	add	r8, r2, #111	; 0x6f
   1125c:	e1a08188 	lsl	r8, r8, #3
   11260:	e282106e 	add	r1, r2, #110	; 0x6e
   11264:	eaffff46 	b	10f84 <_malloc_r+0x3ec>
   11268:	e3a01ffe 	mov	r1, #1016	; 0x3f8
   1126c:	e3a0007f 	mov	r0, #127	; 0x7f
   11270:	e3a0c07e 	mov	ip, #126	; 0x7e
   11274:	eafffe5e 	b	10bf4 <_malloc_r+0x5c>
   11278:	e1a00a03 	lsl	r0, r3, #20
   1127c:	e1a00a20 	lsr	r0, r0, #20
   11280:	e3500000 	cmp	r0, #0
   11284:	1affff9c 	bne	110fc <_malloc_r+0x564>
   11288:	e0893002 	add	r3, r9, r2
   1128c:	e5972008 	ldr	r2, [r7, #8]
   11290:	e3833001 	orr	r3, r3, #1
   11294:	e5823004 	str	r3, [r2, #4]
   11298:	eaffffc7 	b	111bc <_malloc_r+0x624>
   1129c:	e2841008 	add	r1, r4, #8
   112a0:	e1a00005 	mov	r0, r5
   112a4:	ebfffb5e 	bl	10024 <_free_r>
   112a8:	e5981000 	ldr	r1, [r8]
   112ac:	eaffffc2 	b	111bc <_malloc_r+0x624>
   112b0:	e3520f55 	cmp	r2, #340	; 0x154
   112b4:	8a000004 	bhi	112cc <_malloc_r+0x734>
   112b8:	e1a027a3 	lsr	r2, r3, #15
   112bc:	e2828078 	add	r8, r2, #120	; 0x78
   112c0:	e1a08188 	lsl	r8, r8, #3
   112c4:	e2821077 	add	r1, r2, #119	; 0x77
   112c8:	eaffff2d 	b	10f84 <_malloc_r+0x3ec>
   112cc:	e59f104c 	ldr	r1, [pc, #76]	; 11320 <_malloc_r+0x788>
   112d0:	e1520001 	cmp	r2, r1
   112d4:	91a02923 	lsrls	r2, r3, #18
   112d8:	9282807d 	addls	r8, r2, #125	; 0x7d
   112dc:	91a08188 	lslls	r8, r8, #3
   112e0:	9282107c 	addls	r1, r2, #124	; 0x7c
   112e4:	83a08ffe 	movhi	r8, #1016	; 0x3f8
   112e8:	83a0107e 	movhi	r1, #126	; 0x7e
   112ec:	eaffff24 	b	10f84 <_malloc_r+0x3ec>
   112f0:	e5973004 	ldr	r3, [r7, #4]
   112f4:	eaffff6a 	b	110a4 <_malloc_r+0x50c>
   112f8:	e1a001a6 	lsr	r0, r6, #3
   112fc:	e2863008 	add	r3, r6, #8
   11300:	eafffea3 	b	10d94 <_malloc_r+0x1fc>
   11304:	00013b04 	.word	0x00013b04
   11308:	00013b0c 	.word	0x00013b0c
   1130c:	00013f0c 	.word	0x00013f0c
   11310:	0003c170 	.word	0x0003c170
   11314:	0003c140 	.word	0x0003c140
   11318:	0003c168 	.word	0x0003c168
   1131c:	0003c16c 	.word	0x0003c16c
   11320:	00000554 	.word	0x00000554

00011324 <_mbtowc_r>:
   11324:	e59fc024 	ldr	ip, [pc, #36]	; 11350 <_mbtowc_r+0x2c>
   11328:	e59cc000 	ldr	ip, [ip]
   1132c:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   11330:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   11334:	e59fe018 	ldr	lr, [pc, #24]	; 11354 <_mbtowc_r+0x30>
   11338:	e35c0000 	cmp	ip, #0
   1133c:	01a0c00e 	moveq	ip, lr
   11340:	e59ce0e4 	ldr	lr, [ip, #228]	; 0xe4
   11344:	e1a0c00e 	mov	ip, lr
   11348:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   1134c:	e12fff1c 	bx	ip
   11350:	0001356c 	.word	0x0001356c
   11354:	00013998 	.word	0x00013998

00011358 <__ascii_mbtowc>:
   11358:	e3510000 	cmp	r1, #0
   1135c:	e24dd008 	sub	sp, sp, #8
   11360:	028d1004 	addeq	r1, sp, #4
   11364:	e3520000 	cmp	r2, #0
   11368:	0a000008 	beq	11390 <__ascii_mbtowc+0x38>
   1136c:	e3530000 	cmp	r3, #0
   11370:	0a000009 	beq	1139c <__ascii_mbtowc+0x44>
   11374:	e5d23000 	ldrb	r3, [r2]
   11378:	e5813000 	str	r3, [r1]
   1137c:	e5d22000 	ldrb	r2, [r2]
   11380:	e2920000 	adds	r0, r2, #0
   11384:	13a00001 	movne	r0, #1
   11388:	e28dd008 	add	sp, sp, #8
   1138c:	e12fff1e 	bx	lr
   11390:	e1a00002 	mov	r0, r2
   11394:	e28dd008 	add	sp, sp, #8
   11398:	e12fff1e 	bx	lr
   1139c:	e3e00001 	mvn	r0, #1
   113a0:	eafffff8 	b	11388 <__ascii_mbtowc+0x30>

000113a4 <memchr>:
   113a4:	e3100003 	tst	r0, #3
   113a8:	e92d4070 	push	{r4, r5, r6, lr}
   113ac:	e201e0ff 	and	lr, r1, #255	; 0xff
   113b0:	0a000038 	beq	11498 <memchr+0xf4>
   113b4:	e3520000 	cmp	r2, #0
   113b8:	e242c001 	sub	ip, r2, #1
   113bc:	0a00001e 	beq	1143c <memchr+0x98>
   113c0:	e5d03000 	ldrb	r3, [r0]
   113c4:	e153000e 	cmp	r3, lr
   113c8:	0a00001c 	beq	11440 <memchr+0x9c>
   113cc:	e2803001 	add	r3, r0, #1
   113d0:	ea000005 	b	113ec <memchr+0x48>
   113d4:	e25cc001 	subs	ip, ip, #1
   113d8:	3a000017 	bcc	1143c <memchr+0x98>
   113dc:	e5d02000 	ldrb	r2, [r0]
   113e0:	e152000e 	cmp	r2, lr
   113e4:	e2833001 	add	r3, r3, #1
   113e8:	0a000014 	beq	11440 <memchr+0x9c>
   113ec:	e3130003 	tst	r3, #3
   113f0:	e1a00003 	mov	r0, r3
   113f4:	1afffff6 	bne	113d4 <memchr+0x30>
   113f8:	e35c0003 	cmp	ip, #3
   113fc:	8a000011 	bhi	11448 <memchr+0xa4>
   11400:	e35c0000 	cmp	ip, #0
   11404:	0a000025 	beq	114a0 <memchr+0xfc>
   11408:	e5d03000 	ldrb	r3, [r0]
   1140c:	e153000e 	cmp	r3, lr
   11410:	0a00000a 	beq	11440 <memchr+0x9c>
   11414:	e080c00c 	add	ip, r0, ip
   11418:	e2803001 	add	r3, r0, #1
   1141c:	ea000003 	b	11430 <memchr+0x8c>
   11420:	e5d02000 	ldrb	r2, [r0]
   11424:	e152000e 	cmp	r2, lr
   11428:	e2833001 	add	r3, r3, #1
   1142c:	0a000003 	beq	11440 <memchr+0x9c>
   11430:	e15c0003 	cmp	ip, r3
   11434:	e1a00003 	mov	r0, r3
   11438:	1afffff8 	bne	11420 <memchr+0x7c>
   1143c:	e3a00000 	mov	r0, #0
   11440:	e8bd4070 	pop	{r4, r5, r6, lr}
   11444:	e12fff1e 	bx	lr
   11448:	e59f4058 	ldr	r4, [pc, #88]	; 114a8 <memchr+0x104>
   1144c:	e0044401 	and	r4, r4, r1, lsl #8
   11450:	e184400e 	orr	r4, r4, lr
   11454:	e59f6050 	ldr	r6, [pc, #80]	; 114ac <memchr+0x108>
   11458:	e59f5050 	ldr	r5, [pc, #80]	; 114b0 <memchr+0x10c>
   1145c:	e1844804 	orr	r4, r4, r4, lsl #16
   11460:	e5903000 	ldr	r3, [r0]
   11464:	e0233004 	eor	r3, r3, r4
   11468:	e0832006 	add	r2, r3, r6
   1146c:	e1c23003 	bic	r3, r2, r3
   11470:	e1130005 	tst	r3, r5
   11474:	e1a01000 	mov	r1, r0
   11478:	e2800004 	add	r0, r0, #4
   1147c:	1a000003 	bne	11490 <memchr+0xec>
   11480:	e24cc004 	sub	ip, ip, #4
   11484:	e35c0003 	cmp	ip, #3
   11488:	8afffff4 	bhi	11460 <memchr+0xbc>
   1148c:	eaffffdb 	b	11400 <memchr+0x5c>
   11490:	e1a00001 	mov	r0, r1
   11494:	eaffffdb 	b	11408 <memchr+0x64>
   11498:	e1a0c002 	mov	ip, r2
   1149c:	eaffffd5 	b	113f8 <memchr+0x54>
   114a0:	e1a0000c 	mov	r0, ip
   114a4:	eaffffe5 	b	11440 <memchr+0x9c>
   114a8:	0000ffff 	.word	0x0000ffff
   114ac:	fefefeff 	.word	0xfefefeff
   114b0:	80808080 	.word	0x80808080

000114b4 <__malloc_lock>:
   114b4:	e92d4010 	push	{r4, lr}
   114b8:	e59f0008 	ldr	r0, [pc, #8]	; 114c8 <__malloc_lock+0x14>
   114bc:	ebfffd46 	bl	109dc <__retarget_lock_acquire_recursive>
   114c0:	e8bd4010 	pop	{r4, lr}
   114c4:	e12fff1e 	bx	lr
   114c8:	0003c190 	.word	0x0003c190

000114cc <__malloc_unlock>:
   114cc:	e92d4010 	push	{r4, lr}
   114d0:	e59f0008 	ldr	r0, [pc, #8]	; 114e0 <__malloc_unlock+0x14>
   114d4:	ebfffd46 	bl	109f4 <__retarget_lock_release_recursive>
   114d8:	e8bd4010 	pop	{r4, lr}
   114dc:	e12fff1e 	bx	lr
   114e0:	0003c190 	.word	0x0003c190

000114e4 <_realloc_r>:
   114e4:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   114e8:	e2517000 	subs	r7, r1, #0
   114ec:	e24dd00c 	sub	sp, sp, #12
   114f0:	e1a09002 	mov	r9, r2
   114f4:	0a00007f 	beq	116f8 <_realloc_r+0x214>
   114f8:	e289400b 	add	r4, r9, #11
   114fc:	e1a08000 	mov	r8, r0
   11500:	ebffffeb 	bl	114b4 <__malloc_lock>
   11504:	e3540016 	cmp	r4, #22
   11508:	93a02010 	movls	r2, #16
   1150c:	93a03000 	movls	r3, #0
   11510:	91a04002 	movls	r4, r2
   11514:	83c44007 	bichi	r4, r4, #7
   11518:	81a03fa4 	lsrhi	r3, r4, #31
   1151c:	81a02004 	movhi	r2, r4
   11520:	e1540009 	cmp	r4, r9
   11524:	33833001 	orrcc	r3, r3, #1
   11528:	e3530000 	cmp	r3, #0
   1152c:	13a0300c 	movne	r3, #12
   11530:	e5171004 	ldr	r1, [r7, #-4]
   11534:	e2475008 	sub	r5, r7, #8
   11538:	e3c16003 	bic	r6, r1, #3
   1153c:	13a09000 	movne	r9, #0
   11540:	15883000 	strne	r3, [r8]
   11544:	1a00000f 	bne	11588 <_realloc_r+0xa4>
   11548:	e1560002 	cmp	r6, r2
   1154c:	ba000011 	blt	11598 <_realloc_r+0xb4>
   11550:	e1a09007 	mov	r9, r7
   11554:	e0463004 	sub	r3, r6, r4
   11558:	e353000f 	cmp	r3, #15
   1155c:	8a000056 	bhi	116bc <_realloc_r+0x1d8>
   11560:	e5953004 	ldr	r3, [r5, #4]
   11564:	e2033001 	and	r3, r3, #1
   11568:	e1833006 	orr	r3, r3, r6
   1156c:	e5853004 	str	r3, [r5, #4]
   11570:	e0855006 	add	r5, r5, r6
   11574:	e5953004 	ldr	r3, [r5, #4]
   11578:	e3833001 	orr	r3, r3, #1
   1157c:	e5853004 	str	r3, [r5, #4]
   11580:	e1a00008 	mov	r0, r8
   11584:	ebffffd0 	bl	114cc <__malloc_unlock>
   11588:	e1a00009 	mov	r0, r9
   1158c:	e28dd00c 	add	sp, sp, #12
   11590:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   11594:	e12fff1e 	bx	lr
   11598:	e59fb414 	ldr	fp, [pc, #1044]	; 119b4 <_realloc_r+0x4d0>
   1159c:	e59b3008 	ldr	r3, [fp, #8]
   115a0:	e085c006 	add	ip, r5, r6
   115a4:	e15c0003 	cmp	ip, r3
   115a8:	0a0000a5 	beq	11844 <_realloc_r+0x360>
   115ac:	e59c0004 	ldr	r0, [ip, #4]
   115b0:	e3c03001 	bic	r3, r0, #1
   115b4:	e08c3003 	add	r3, ip, r3
   115b8:	e5933004 	ldr	r3, [r3, #4]
   115bc:	e3130001 	tst	r3, #1
   115c0:	0a000032 	beq	11690 <_realloc_r+0x1ac>
   115c4:	e3110001 	tst	r1, #1
   115c8:	0a000088 	beq	117f0 <_realloc_r+0x30c>
   115cc:	e1a01009 	mov	r1, r9
   115d0:	e1a00008 	mov	r0, r8
   115d4:	ebfffd6f 	bl	10b98 <_malloc_r>
   115d8:	e2509000 	subs	r9, r0, #0
   115dc:	0affffe7 	beq	11580 <_realloc_r+0x9c>
   115e0:	e5173004 	ldr	r3, [r7, #-4]
   115e4:	e3c33001 	bic	r3, r3, #1
   115e8:	e0853003 	add	r3, r5, r3
   115ec:	e2492008 	sub	r2, r9, #8
   115f0:	e1520003 	cmp	r2, r3
   115f4:	0a0000e3 	beq	11988 <_realloc_r+0x4a4>
   115f8:	e2462004 	sub	r2, r6, #4
   115fc:	e3520024 	cmp	r2, #36	; 0x24
   11600:	8a0000dd 	bhi	1197c <_realloc_r+0x498>
   11604:	e3520013 	cmp	r2, #19
   11608:	91a03009 	movls	r3, r9
   1160c:	91a02007 	movls	r2, r7
   11610:	9a000014 	bls	11668 <_realloc_r+0x184>
   11614:	e5973000 	ldr	r3, [r7]
   11618:	e5893000 	str	r3, [r9]
   1161c:	e5973004 	ldr	r3, [r7, #4]
   11620:	e352001b 	cmp	r2, #27
   11624:	e5893004 	str	r3, [r9, #4]
   11628:	92872008 	addls	r2, r7, #8
   1162c:	92893008 	addls	r3, r9, #8
   11630:	9a00000c 	bls	11668 <_realloc_r+0x184>
   11634:	e5973008 	ldr	r3, [r7, #8]
   11638:	e5893008 	str	r3, [r9, #8]
   1163c:	e597300c 	ldr	r3, [r7, #12]
   11640:	e589300c 	str	r3, [r9, #12]
   11644:	e3520024 	cmp	r2, #36	; 0x24
   11648:	05973010 	ldreq	r3, [r7, #16]
   1164c:	05893010 	streq	r3, [r9, #16]
   11650:	05972014 	ldreq	r2, [r7, #20]
   11654:	12893010 	addne	r3, r9, #16
   11658:	05892014 	streq	r2, [r9, #20]
   1165c:	12872010 	addne	r2, r7, #16
   11660:	02893018 	addeq	r3, r9, #24
   11664:	02872018 	addeq	r2, r7, #24
   11668:	e5921000 	ldr	r1, [r2]
   1166c:	e5831000 	str	r1, [r3]
   11670:	e5921004 	ldr	r1, [r2, #4]
   11674:	e5831004 	str	r1, [r3, #4]
   11678:	e5922008 	ldr	r2, [r2, #8]
   1167c:	e5832008 	str	r2, [r3, #8]
   11680:	e1a01007 	mov	r1, r7
   11684:	e1a00008 	mov	r0, r8
   11688:	ebfffa65 	bl	10024 <_free_r>
   1168c:	eaffffbb 	b	11580 <_realloc_r+0x9c>
   11690:	e3c00003 	bic	r0, r0, #3
   11694:	e0863000 	add	r3, r6, r0
   11698:	e1530002 	cmp	r3, r2
   1169c:	ba00001c 	blt	11714 <_realloc_r+0x230>
   116a0:	e28c1008 	add	r1, ip, #8
   116a4:	e8910006 	ldm	r1, {r1, r2}
   116a8:	e1a09007 	mov	r9, r7
   116ac:	e581200c 	str	r2, [r1, #12]
   116b0:	e1a06003 	mov	r6, r3
   116b4:	e5821008 	str	r1, [r2, #8]
   116b8:	eaffffa5 	b	11554 <_realloc_r+0x70>
   116bc:	e5952004 	ldr	r2, [r5, #4]
   116c0:	e2022001 	and	r2, r2, #1
   116c4:	e0851004 	add	r1, r5, r4
   116c8:	e3833001 	orr	r3, r3, #1
   116cc:	e1822004 	orr	r2, r2, r4
   116d0:	e5852004 	str	r2, [r5, #4]
   116d4:	e5813004 	str	r3, [r1, #4]
   116d8:	e0855006 	add	r5, r5, r6
   116dc:	e5953004 	ldr	r3, [r5, #4]
   116e0:	e3833001 	orr	r3, r3, #1
   116e4:	e2811008 	add	r1, r1, #8
   116e8:	e5853004 	str	r3, [r5, #4]
   116ec:	e1a00008 	mov	r0, r8
   116f0:	ebfffa4b 	bl	10024 <_free_r>
   116f4:	eaffffa1 	b	11580 <_realloc_r+0x9c>
   116f8:	e1a01002 	mov	r1, r2
   116fc:	ebfffd25 	bl	10b98 <_malloc_r>
   11700:	e1a09000 	mov	r9, r0
   11704:	e1a00009 	mov	r0, r9
   11708:	e28dd00c 	add	sp, sp, #12
   1170c:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   11710:	e12fff1e 	bx	lr
   11714:	e3110001 	tst	r1, #1
   11718:	1affffab 	bne	115cc <_realloc_r+0xe8>
   1171c:	e517a008 	ldr	sl, [r7, #-8]
   11720:	e045a00a 	sub	sl, r5, sl
   11724:	e59a1004 	ldr	r1, [sl, #4]
   11728:	e3c11003 	bic	r1, r1, #3
   1172c:	e0810000 	add	r0, r1, r0
   11730:	e0803006 	add	r3, r0, r6
   11734:	e1530002 	cmp	r3, r2
   11738:	ba000030 	blt	11800 <_realloc_r+0x31c>
   1173c:	e1a0900a 	mov	r9, sl
   11740:	e28c1008 	add	r1, ip, #8
   11744:	e8910006 	ldm	r1, {r1, r2}
   11748:	e581200c 	str	r2, [r1, #12]
   1174c:	e5821008 	str	r1, [r2, #8]
   11750:	e59a100c 	ldr	r1, [sl, #12]
   11754:	e5b90008 	ldr	r0, [r9, #8]!
   11758:	e2462004 	sub	r2, r6, #4
   1175c:	e3520024 	cmp	r2, #36	; 0x24
   11760:	e580100c 	str	r1, [r0, #12]
   11764:	e5810008 	str	r0, [r1, #8]
   11768:	8a00002f 	bhi	1182c <_realloc_r+0x348>
   1176c:	e3520013 	cmp	r2, #19
   11770:	91a02009 	movls	r2, r9
   11774:	9a000014 	bls	117cc <_realloc_r+0x2e8>
   11778:	e5971000 	ldr	r1, [r7]
   1177c:	e58a1008 	str	r1, [sl, #8]
   11780:	e5971004 	ldr	r1, [r7, #4]
   11784:	e352001b 	cmp	r2, #27
   11788:	e58a100c 	str	r1, [sl, #12]
   1178c:	92877008 	addls	r7, r7, #8
   11790:	928a2010 	addls	r2, sl, #16
   11794:	9a00000c 	bls	117cc <_realloc_r+0x2e8>
   11798:	e5971008 	ldr	r1, [r7, #8]
   1179c:	e58a1010 	str	r1, [sl, #16]
   117a0:	e597100c 	ldr	r1, [r7, #12]
   117a4:	e58a1014 	str	r1, [sl, #20]
   117a8:	e3520024 	cmp	r2, #36	; 0x24
   117ac:	05972010 	ldreq	r2, [r7, #16]
   117b0:	058a2018 	streq	r2, [sl, #24]
   117b4:	05972014 	ldreq	r2, [r7, #20]
   117b8:	12877010 	addne	r7, r7, #16
   117bc:	058a201c 	streq	r2, [sl, #28]
   117c0:	128a2018 	addne	r2, sl, #24
   117c4:	02877018 	addeq	r7, r7, #24
   117c8:	028a2020 	addeq	r2, sl, #32
   117cc:	e5971000 	ldr	r1, [r7]
   117d0:	e5821000 	str	r1, [r2]
   117d4:	e5971004 	ldr	r1, [r7, #4]
   117d8:	e5821004 	str	r1, [r2, #4]
   117dc:	e5971008 	ldr	r1, [r7, #8]
   117e0:	e1a06003 	mov	r6, r3
   117e4:	e1a0500a 	mov	r5, sl
   117e8:	e5821008 	str	r1, [r2, #8]
   117ec:	eaffff58 	b	11554 <_realloc_r+0x70>
   117f0:	e517a008 	ldr	sl, [r7, #-8]
   117f4:	e045a00a 	sub	sl, r5, sl
   117f8:	e59a1004 	ldr	r1, [sl, #4]
   117fc:	e3c11003 	bic	r1, r1, #3
   11800:	e0863001 	add	r3, r6, r1
   11804:	e1530002 	cmp	r3, r2
   11808:	baffff6f 	blt	115cc <_realloc_r+0xe8>
   1180c:	e1a0900a 	mov	r9, sl
   11810:	e59a100c 	ldr	r1, [sl, #12]
   11814:	e5b90008 	ldr	r0, [r9, #8]!
   11818:	e2462004 	sub	r2, r6, #4
   1181c:	e3520024 	cmp	r2, #36	; 0x24
   11820:	e580100c 	str	r1, [r0, #12]
   11824:	e5810008 	str	r0, [r1, #8]
   11828:	9affffcf 	bls	1176c <_realloc_r+0x288>
   1182c:	e1a01007 	mov	r1, r7
   11830:	e1a00009 	mov	r0, r9
   11834:	e1a06003 	mov	r6, r3
   11838:	e1a0500a 	mov	r5, sl
   1183c:	ebfff034 	bl	d914 <memmove>
   11840:	eaffff43 	b	11554 <_realloc_r+0x70>
   11844:	e59c3004 	ldr	r3, [ip, #4]
   11848:	e3c33003 	bic	r3, r3, #3
   1184c:	e0833006 	add	r3, r3, r6
   11850:	e2840010 	add	r0, r4, #16
   11854:	e1530000 	cmp	r3, r0
   11858:	aa00003a 	bge	11948 <_realloc_r+0x464>
   1185c:	e3110001 	tst	r1, #1
   11860:	1affff59 	bne	115cc <_realloc_r+0xe8>
   11864:	e517a008 	ldr	sl, [r7, #-8]
   11868:	e045a00a 	sub	sl, r5, sl
   1186c:	e59a1004 	ldr	r1, [sl, #4]
   11870:	e3c11003 	bic	r1, r1, #3
   11874:	e0813003 	add	r3, r1, r3
   11878:	e1500003 	cmp	r0, r3
   1187c:	caffffdf 	bgt	11800 <_realloc_r+0x31c>
   11880:	e1a0900a 	mov	r9, sl
   11884:	e59a100c 	ldr	r1, [sl, #12]
   11888:	e5b90008 	ldr	r0, [r9, #8]!
   1188c:	e2462004 	sub	r2, r6, #4
   11890:	e3520024 	cmp	r2, #36	; 0x24
   11894:	e580100c 	str	r1, [r0, #12]
   11898:	e5810008 	str	r0, [r1, #8]
   1189c:	8a00003e 	bhi	1199c <_realloc_r+0x4b8>
   118a0:	e3520013 	cmp	r2, #19
   118a4:	91a02009 	movls	r2, r9
   118a8:	9a000014 	bls	11900 <_realloc_r+0x41c>
   118ac:	e5971000 	ldr	r1, [r7]
   118b0:	e58a1008 	str	r1, [sl, #8]
   118b4:	e5971004 	ldr	r1, [r7, #4]
   118b8:	e352001b 	cmp	r2, #27
   118bc:	e58a100c 	str	r1, [sl, #12]
   118c0:	92877008 	addls	r7, r7, #8
   118c4:	928a2010 	addls	r2, sl, #16
   118c8:	9a00000c 	bls	11900 <_realloc_r+0x41c>
   118cc:	e5971008 	ldr	r1, [r7, #8]
   118d0:	e58a1010 	str	r1, [sl, #16]
   118d4:	e597100c 	ldr	r1, [r7, #12]
   118d8:	e58a1014 	str	r1, [sl, #20]
   118dc:	e3520024 	cmp	r2, #36	; 0x24
   118e0:	05972010 	ldreq	r2, [r7, #16]
   118e4:	058a2018 	streq	r2, [sl, #24]
   118e8:	05972014 	ldreq	r2, [r7, #20]
   118ec:	12877010 	addne	r7, r7, #16
   118f0:	058a201c 	streq	r2, [sl, #28]
   118f4:	128a2018 	addne	r2, sl, #24
   118f8:	02877018 	addeq	r7, r7, #24
   118fc:	028a2020 	addeq	r2, sl, #32
   11900:	e5971000 	ldr	r1, [r7]
   11904:	e5821000 	str	r1, [r2]
   11908:	e5971004 	ldr	r1, [r7, #4]
   1190c:	e5821004 	str	r1, [r2, #4]
   11910:	e5971008 	ldr	r1, [r7, #8]
   11914:	e5821008 	str	r1, [r2, #8]
   11918:	e0433004 	sub	r3, r3, r4
   1191c:	e08a2004 	add	r2, sl, r4
   11920:	e3833001 	orr	r3, r3, #1
   11924:	e58b2008 	str	r2, [fp, #8]
   11928:	e5823004 	str	r3, [r2, #4]
   1192c:	e59a3004 	ldr	r3, [sl, #4]
   11930:	e2033001 	and	r3, r3, #1
   11934:	e1834004 	orr	r4, r3, r4
   11938:	e1a00008 	mov	r0, r8
   1193c:	e58a4004 	str	r4, [sl, #4]
   11940:	ebfffee1 	bl	114cc <__malloc_unlock>
   11944:	eaffff0f 	b	11588 <_realloc_r+0xa4>
   11948:	e0433004 	sub	r3, r3, r4
   1194c:	e0855004 	add	r5, r5, r4
   11950:	e3833001 	orr	r3, r3, #1
   11954:	e58b5008 	str	r5, [fp, #8]
   11958:	e5853004 	str	r3, [r5, #4]
   1195c:	e5173004 	ldr	r3, [r7, #-4]
   11960:	e2033001 	and	r3, r3, #1
   11964:	e1834004 	orr	r4, r3, r4
   11968:	e1a00008 	mov	r0, r8
   1196c:	e5074004 	str	r4, [r7, #-4]
   11970:	ebfffed5 	bl	114cc <__malloc_unlock>
   11974:	e1a09007 	mov	r9, r7
   11978:	eaffff02 	b	11588 <_realloc_r+0xa4>
   1197c:	e1a01007 	mov	r1, r7
   11980:	ebffefe3 	bl	d914 <memmove>
   11984:	eaffff3d 	b	11680 <_realloc_r+0x19c>
   11988:	e5193004 	ldr	r3, [r9, #-4]
   1198c:	e3c33003 	bic	r3, r3, #3
   11990:	e0866003 	add	r6, r6, r3
   11994:	e1a09007 	mov	r9, r7
   11998:	eafffeed 	b	11554 <_realloc_r+0x70>
   1199c:	e1a01007 	mov	r1, r7
   119a0:	e1a00009 	mov	r0, r9
   119a4:	e58d3004 	str	r3, [sp, #4]
   119a8:	ebffefd9 	bl	d914 <memmove>
   119ac:	e59d3004 	ldr	r3, [sp, #4]
   119b0:	eaffffd8 	b	11918 <_realloc_r+0x434>
   119b4:	00013b04 	.word	0x00013b04

000119b8 <_sbrk_r>:
   119b8:	e3a03000 	mov	r3, #0
   119bc:	e92d4070 	push	{r4, r5, r6, lr}
   119c0:	e59f4030 	ldr	r4, [pc, #48]	; 119f8 <_sbrk_r+0x40>
   119c4:	e1a05000 	mov	r5, r0
   119c8:	e1a00001 	mov	r0, r1
   119cc:	e5843000 	str	r3, [r4]
   119d0:	eb00034f 	bl	12714 <_sbrk>
   119d4:	e3700001 	cmn	r0, #1
   119d8:	0a000001 	beq	119e4 <_sbrk_r+0x2c>
   119dc:	e8bd4070 	pop	{r4, r5, r6, lr}
   119e0:	e12fff1e 	bx	lr
   119e4:	e5943000 	ldr	r3, [r4]
   119e8:	e3530000 	cmp	r3, #0
   119ec:	15853000 	strne	r3, [r5]
   119f0:	e8bd4070 	pop	{r4, r5, r6, lr}
   119f4:	e12fff1e 	bx	lr
   119f8:	0003c1a4 	.word	0x0003c1a4

000119fc <_init_signal_r.part.0>:
   119fc:	e92d4010 	push	{r4, lr}
   11a00:	e3a01080 	mov	r1, #128	; 0x80
   11a04:	e1a04000 	mov	r4, r0
   11a08:	ebfffc62 	bl	10b98 <_malloc_r>
   11a0c:	e3500000 	cmp	r0, #0
   11a10:	e58402dc 	str	r0, [r4, #732]	; 0x2dc
   11a14:	0a000008 	beq	11a3c <_init_signal_r.part.0+0x40>
   11a18:	e3a02000 	mov	r2, #0
   11a1c:	e2403004 	sub	r3, r0, #4
   11a20:	e280007c 	add	r0, r0, #124	; 0x7c
   11a24:	e5a32004 	str	r2, [r3, #4]!
   11a28:	e1530000 	cmp	r3, r0
   11a2c:	1afffffc 	bne	11a24 <_init_signal_r.part.0+0x28>
   11a30:	e3a00000 	mov	r0, #0
   11a34:	e8bd4010 	pop	{r4, lr}
   11a38:	e12fff1e 	bx	lr
   11a3c:	e3e00000 	mvn	r0, #0
   11a40:	eafffffb 	b	11a34 <_init_signal_r.part.0+0x38>

00011a44 <_init_signal_r>:
   11a44:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   11a48:	e3530000 	cmp	r3, #0
   11a4c:	0a000001 	beq	11a58 <_init_signal_r+0x14>
   11a50:	e3a00000 	mov	r0, #0
   11a54:	e12fff1e 	bx	lr
   11a58:	eaffffe7 	b	119fc <_init_signal_r.part.0>

00011a5c <_signal_r>:
   11a5c:	e351001f 	cmp	r1, #31
   11a60:	e1a03000 	mov	r3, r0
   11a64:	8a000005 	bhi	11a80 <_signal_r+0x24>
   11a68:	e590c2dc 	ldr	ip, [r0, #732]	; 0x2dc
   11a6c:	e35c0000 	cmp	ip, #0
   11a70:	0a000006 	beq	11a90 <_signal_r+0x34>
   11a74:	e79c0101 	ldr	r0, [ip, r1, lsl #2]
   11a78:	e78c2101 	str	r2, [ip, r1, lsl #2]
   11a7c:	e12fff1e 	bx	lr
   11a80:	e3a02016 	mov	r2, #22
   11a84:	e3e00000 	mvn	r0, #0
   11a88:	e5832000 	str	r2, [r3]
   11a8c:	e12fff1e 	bx	lr
   11a90:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   11a94:	e24dd014 	sub	sp, sp, #20
   11a98:	e98d000e 	stmib	sp, {r1, r2, r3}
   11a9c:	ebffffd6 	bl	119fc <_init_signal_r.part.0>
   11aa0:	e3500000 	cmp	r0, #0
   11aa4:	13e00000 	mvnne	r0, #0
   11aa8:	059d300c 	ldreq	r3, [sp, #12]
   11aac:	099d0006 	ldmibeq	sp, {r1, r2}
   11ab0:	0593c2dc 	ldreq	ip, [r3, #732]	; 0x2dc
   11ab4:	079c0101 	ldreq	r0, [ip, r1, lsl #2]
   11ab8:	078c2101 	streq	r2, [ip, r1, lsl #2]
   11abc:	e28dd014 	add	sp, sp, #20
   11ac0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   11ac4:	e12fff1e 	bx	lr

00011ac8 <_raise_r>:
   11ac8:	e351001f 	cmp	r1, #31
   11acc:	e92d4020 	push	{r5, lr}
   11ad0:	83a03016 	movhi	r3, #22
   11ad4:	e1a05000 	mov	r5, r0
   11ad8:	e24dd008 	sub	sp, sp, #8
   11adc:	83e00000 	mvnhi	r0, #0
   11ae0:	85853000 	strhi	r3, [r5]
   11ae4:	8a000012 	bhi	11b34 <_raise_r+0x6c>
   11ae8:	e59522dc 	ldr	r2, [r5, #732]	; 0x2dc
   11aec:	e3520000 	cmp	r2, #0
   11af0:	0a000014 	beq	11b48 <_raise_r+0x80>
   11af4:	e7923101 	ldr	r3, [r2, r1, lsl #2]
   11af8:	e3530000 	cmp	r3, #0
   11afc:	0a000011 	beq	11b48 <_raise_r+0x80>
   11b00:	e3530001 	cmp	r3, #1
   11b04:	0a00000d 	beq	11b40 <_raise_r+0x78>
   11b08:	e3730001 	cmn	r3, #1
   11b0c:	03a03016 	moveq	r3, #22
   11b10:	03a00001 	moveq	r0, #1
   11b14:	05853000 	streq	r3, [r5]
   11b18:	0a000005 	beq	11b34 <_raise_r+0x6c>
   11b1c:	e3a05000 	mov	r5, #0
   11b20:	e1a00001 	mov	r0, r1
   11b24:	e7825101 	str	r5, [r2, r1, lsl #2]
   11b28:	e1a0e00f 	mov	lr, pc
   11b2c:	e12fff13 	bx	r3
   11b30:	e1a00005 	mov	r0, r5
   11b34:	e28dd008 	add	sp, sp, #8
   11b38:	e8bd4020 	pop	{r5, lr}
   11b3c:	e12fff1e 	bx	lr
   11b40:	e3a00000 	mov	r0, #0
   11b44:	eafffffa 	b	11b34 <_raise_r+0x6c>
   11b48:	e1a00005 	mov	r0, r5
   11b4c:	e58d1004 	str	r1, [sp, #4]
   11b50:	eb000056 	bl	11cb0 <_getpid_r>
   11b54:	e59d1004 	ldr	r1, [sp, #4]
   11b58:	e1a02001 	mov	r2, r1
   11b5c:	e1a01000 	mov	r1, r0
   11b60:	e1a00005 	mov	r0, r5
   11b64:	eb000040 	bl	11c6c <_kill_r>
   11b68:	eafffff1 	b	11b34 <_raise_r+0x6c>

00011b6c <__sigtramp_r>:
   11b6c:	e351001f 	cmp	r1, #31
   11b70:	8a000022 	bhi	11c00 <__sigtramp_r+0x94>
   11b74:	e92d4020 	push	{r5, lr}
   11b78:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   11b7c:	e3530000 	cmp	r3, #0
   11b80:	e24dd008 	sub	sp, sp, #8
   11b84:	e1a05000 	mov	r5, r0
   11b88:	0a000014 	beq	11be0 <__sigtramp_r+0x74>
   11b8c:	e7932101 	ldr	r2, [r3, r1, lsl #2]
   11b90:	e3520000 	cmp	r2, #0
   11b94:	e0833101 	add	r3, r3, r1, lsl #2
   11b98:	0a00000e 	beq	11bd8 <__sigtramp_r+0x6c>
   11b9c:	e3720001 	cmn	r2, #1
   11ba0:	03a00002 	moveq	r0, #2
   11ba4:	0a000008 	beq	11bcc <__sigtramp_r+0x60>
   11ba8:	e3520001 	cmp	r2, #1
   11bac:	03a00003 	moveq	r0, #3
   11bb0:	0a000005 	beq	11bcc <__sigtramp_r+0x60>
   11bb4:	e3a05000 	mov	r5, #0
   11bb8:	e1a00001 	mov	r0, r1
   11bbc:	e5835000 	str	r5, [r3]
   11bc0:	e1a0e00f 	mov	lr, pc
   11bc4:	e12fff12 	bx	r2
   11bc8:	e1a00005 	mov	r0, r5
   11bcc:	e28dd008 	add	sp, sp, #8
   11bd0:	e8bd4020 	pop	{r5, lr}
   11bd4:	e12fff1e 	bx	lr
   11bd8:	e3a00001 	mov	r0, #1
   11bdc:	eafffffa 	b	11bcc <__sigtramp_r+0x60>
   11be0:	e58d1004 	str	r1, [sp, #4]
   11be4:	ebffff84 	bl	119fc <_init_signal_r.part.0>
   11be8:	e3500000 	cmp	r0, #0
   11bec:	059532dc 	ldreq	r3, [r5, #732]	; 0x2dc
   11bf0:	059d1004 	ldreq	r1, [sp, #4]
   11bf4:	0affffe4 	beq	11b8c <__sigtramp_r+0x20>
   11bf8:	e3e00000 	mvn	r0, #0
   11bfc:	eafffff2 	b	11bcc <__sigtramp_r+0x60>
   11c00:	e3e00000 	mvn	r0, #0
   11c04:	e12fff1e 	bx	lr

00011c08 <raise>:
   11c08:	e59f3008 	ldr	r3, [pc, #8]	; 11c18 <raise+0x10>
   11c0c:	e1a01000 	mov	r1, r0
   11c10:	e5930000 	ldr	r0, [r3]
   11c14:	eaffffab 	b	11ac8 <_raise_r>
   11c18:	0001356c 	.word	0x0001356c

00011c1c <signal>:
   11c1c:	e59f300c 	ldr	r3, [pc, #12]	; 11c30 <signal+0x14>
   11c20:	e1a02001 	mov	r2, r1
   11c24:	e1a01000 	mov	r1, r0
   11c28:	e5930000 	ldr	r0, [r3]
   11c2c:	eaffff8a 	b	11a5c <_signal_r>
   11c30:	0001356c 	.word	0x0001356c

00011c34 <_init_signal>:
   11c34:	e59f3018 	ldr	r3, [pc, #24]	; 11c54 <_init_signal+0x20>
   11c38:	e5930000 	ldr	r0, [r3]
   11c3c:	e59032dc 	ldr	r3, [r0, #732]	; 0x2dc
   11c40:	e3530000 	cmp	r3, #0
   11c44:	0a000001 	beq	11c50 <_init_signal+0x1c>
   11c48:	e3a00000 	mov	r0, #0
   11c4c:	e12fff1e 	bx	lr
   11c50:	eaffff69 	b	119fc <_init_signal_r.part.0>
   11c54:	0001356c 	.word	0x0001356c

00011c58 <__sigtramp>:
   11c58:	e59f3008 	ldr	r3, [pc, #8]	; 11c68 <__sigtramp+0x10>
   11c5c:	e1a01000 	mov	r1, r0
   11c60:	e5930000 	ldr	r0, [r3]
   11c64:	eaffffc0 	b	11b6c <__sigtramp_r>
   11c68:	0001356c 	.word	0x0001356c

00011c6c <_kill_r>:
   11c6c:	e1a0c001 	mov	ip, r1
   11c70:	e3a03000 	mov	r3, #0
   11c74:	e92d4070 	push	{r4, r5, r6, lr}
   11c78:	e59f402c 	ldr	r4, [pc, #44]	; 11cac <_kill_r+0x40>
   11c7c:	e1a05000 	mov	r5, r0
   11c80:	e1a01002 	mov	r1, r2
   11c84:	e1a0000c 	mov	r0, ip
   11c88:	e5843000 	str	r3, [r4]
   11c8c:	eb00028e 	bl	126cc <_kill>
   11c90:	e3700001 	cmn	r0, #1
   11c94:	1a000002 	bne	11ca4 <_kill_r+0x38>
   11c98:	e5943000 	ldr	r3, [r4]
   11c9c:	e3530000 	cmp	r3, #0
   11ca0:	15853000 	strne	r3, [r5]
   11ca4:	e8bd4070 	pop	{r4, r5, r6, lr}
   11ca8:	e12fff1e 	bx	lr
   11cac:	0003c1a4 	.word	0x0003c1a4

00011cb0 <_getpid_r>:
   11cb0:	e92d4010 	push	{r4, lr}
   11cb4:	eb000278 	bl	1269c <_getpid>
   11cb8:	e8bd4010 	pop	{r4, lr}
   11cbc:	e12fff1e 	bx	lr

00011cc0 <__sread>:
   11cc0:	e92d4010 	push	{r4, lr}
   11cc4:	e1a04001 	mov	r4, r1
   11cc8:	e1d110fe 	ldrsh	r1, [r1, #14]
   11ccc:	eb000196 	bl	1232c <_read_r>
   11cd0:	e3500000 	cmp	r0, #0
   11cd4:	a5943050 	ldrge	r3, [r4, #80]	; 0x50
   11cd8:	b1d430bc 	ldrhlt	r3, [r4, #12]
   11cdc:	a0833000 	addge	r3, r3, r0
   11ce0:	b3c33a01 	biclt	r3, r3, #4096	; 0x1000
   11ce4:	a5843050 	strge	r3, [r4, #80]	; 0x50
   11ce8:	b1c430bc 	strhlt	r3, [r4, #12]
   11cec:	e8bd4010 	pop	{r4, lr}
   11cf0:	e12fff1e 	bx	lr

00011cf4 <__seofread>:
   11cf4:	e3a00000 	mov	r0, #0
   11cf8:	e12fff1e 	bx	lr

00011cfc <__swrite>:
   11cfc:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   11d00:	e1a04001 	mov	r4, r1
   11d04:	e1d110fc 	ldrsh	r1, [r1, #12]
   11d08:	e3110c01 	tst	r1, #256	; 0x100
   11d0c:	e1a06002 	mov	r6, r2
   11d10:	e1a07003 	mov	r7, r3
   11d14:	e1a05000 	mov	r5, r0
   11d18:	0a000004 	beq	11d30 <__swrite+0x34>
   11d1c:	e1d410fe 	ldrsh	r1, [r4, #14]
   11d20:	e3a03002 	mov	r3, #2
   11d24:	e3a02000 	mov	r2, #0
   11d28:	eb00016d 	bl	122e4 <_lseek_r>
   11d2c:	e1d410fc 	ldrsh	r1, [r4, #12]
   11d30:	e3c11a01 	bic	r1, r1, #4096	; 0x1000
   11d34:	e1c410bc 	strh	r1, [r4, #12]
   11d38:	e1a03007 	mov	r3, r7
   11d3c:	e1a02006 	mov	r2, r6
   11d40:	e1d410fe 	ldrsh	r1, [r4, #14]
   11d44:	e1a00005 	mov	r0, r5
   11d48:	eb0000c7 	bl	1206c <_write_r>
   11d4c:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11d50:	e12fff1e 	bx	lr

00011d54 <__sseek>:
   11d54:	e92d4010 	push	{r4, lr}
   11d58:	e1a04001 	mov	r4, r1
   11d5c:	e1d110fe 	ldrsh	r1, [r1, #14]
   11d60:	eb00015f 	bl	122e4 <_lseek_r>
   11d64:	e1d430bc 	ldrh	r3, [r4, #12]
   11d68:	e3700001 	cmn	r0, #1
   11d6c:	03c33a01 	biceq	r3, r3, #4096	; 0x1000
   11d70:	13833a01 	orrne	r3, r3, #4096	; 0x1000
   11d74:	15840050 	strne	r0, [r4, #80]	; 0x50
   11d78:	e1c430bc 	strh	r3, [r4, #12]
   11d7c:	e8bd4010 	pop	{r4, lr}
   11d80:	e12fff1e 	bx	lr

00011d84 <__sclose>:
   11d84:	e92d4010 	push	{r4, lr}
   11d88:	e1d110fe 	ldrsh	r1, [r1, #14]
   11d8c:	eb0000c8 	bl	120b4 <_close_r>
   11d90:	e8bd4010 	pop	{r4, lr}
   11d94:	e12fff1e 	bx	lr

00011d98 <__swbuf_r>:
   11d98:	e92d41f0 	push	{r4, r5, r6, r7, r8, lr}
   11d9c:	e2506000 	subs	r6, r0, #0
   11da0:	e1a05001 	mov	r5, r1
   11da4:	e1a04002 	mov	r4, r2
   11da8:	0a000002 	beq	11db8 <__swbuf_r+0x20>
   11dac:	e5963038 	ldr	r3, [r6, #56]	; 0x38
   11db0:	e3530000 	cmp	r3, #0
   11db4:	0a000042 	beq	11ec4 <__swbuf_r+0x12c>
   11db8:	e1d410fc 	ldrsh	r1, [r4, #12]
   11dbc:	e5940018 	ldr	r0, [r4, #24]
   11dc0:	e1a03801 	lsl	r3, r1, #16
   11dc4:	e3130702 	tst	r3, #524288	; 0x80000
   11dc8:	e1a02823 	lsr	r2, r3, #16
   11dcc:	e5840008 	str	r0, [r4, #8]
   11dd0:	0a000022 	beq	11e60 <__swbuf_r+0xc8>
   11dd4:	e5943010 	ldr	r3, [r4, #16]
   11dd8:	e3530000 	cmp	r3, #0
   11ddc:	0a00001f 	beq	11e60 <__swbuf_r+0xc8>
   11de0:	e3120a02 	tst	r2, #8192	; 0x2000
   11de4:	05942064 	ldreq	r2, [r4, #100]	; 0x64
   11de8:	03c22a02 	biceq	r2, r2, #8192	; 0x2000
   11dec:	03811a02 	orreq	r1, r1, #8192	; 0x2000
   11df0:	05842064 	streq	r2, [r4, #100]	; 0x64
   11df4:	e5942000 	ldr	r2, [r4]
   11df8:	01c410bc 	strheq	r1, [r4, #12]
   11dfc:	e5941014 	ldr	r1, [r4, #20]
   11e00:	e0423003 	sub	r3, r2, r3
   11e04:	e20550ff 	and	r5, r5, #255	; 0xff
   11e08:	e1530001 	cmp	r3, r1
   11e0c:	e1a07005 	mov	r7, r5
   11e10:	b2833001 	addlt	r3, r3, #1
   11e14:	aa000022 	bge	11ea4 <__swbuf_r+0x10c>
   11e18:	e5941008 	ldr	r1, [r4, #8]
   11e1c:	e2820001 	add	r0, r2, #1
   11e20:	e2411001 	sub	r1, r1, #1
   11e24:	e5841008 	str	r1, [r4, #8]
   11e28:	e5840000 	str	r0, [r4]
   11e2c:	e5c25000 	strb	r5, [r2]
   11e30:	e5942014 	ldr	r2, [r4, #20]
   11e34:	e1520003 	cmp	r2, r3
   11e38:	0a000012 	beq	11e88 <__swbuf_r+0xf0>
   11e3c:	e1d430bc 	ldrh	r3, [r4, #12]
   11e40:	e355000a 	cmp	r5, #10
   11e44:	13a05000 	movne	r5, #0
   11e48:	02035001 	andeq	r5, r3, #1
   11e4c:	e3550000 	cmp	r5, #0
   11e50:	1a00000c 	bne	11e88 <__swbuf_r+0xf0>
   11e54:	e1a00007 	mov	r0, r7
   11e58:	e8bd41f0 	pop	{r4, r5, r6, r7, r8, lr}
   11e5c:	e12fff1e 	bx	lr
   11e60:	e1a01004 	mov	r1, r4
   11e64:	e1a00006 	mov	r0, r6
   11e68:	ebfff58a 	bl	f498 <__swsetup_r>
   11e6c:	e3500000 	cmp	r0, #0
   11e70:	1a000009 	bne	11e9c <__swbuf_r+0x104>
   11e74:	e1d410fc 	ldrsh	r1, [r4, #12]
   11e78:	e1a02801 	lsl	r2, r1, #16
   11e7c:	e5943010 	ldr	r3, [r4, #16]
   11e80:	e1a02822 	lsr	r2, r2, #16
   11e84:	eaffffd5 	b	11de0 <__swbuf_r+0x48>
   11e88:	e1a01004 	mov	r1, r4
   11e8c:	e1a00006 	mov	r0, r6
   11e90:	ebfff66d 	bl	f84c <_fflush_r>
   11e94:	e3500000 	cmp	r0, #0
   11e98:	0affffed 	beq	11e54 <__swbuf_r+0xbc>
   11e9c:	e3e07000 	mvn	r7, #0
   11ea0:	eaffffeb 	b	11e54 <__swbuf_r+0xbc>
   11ea4:	e1a01004 	mov	r1, r4
   11ea8:	e1a00006 	mov	r0, r6
   11eac:	ebfff666 	bl	f84c <_fflush_r>
   11eb0:	e3500000 	cmp	r0, #0
   11eb4:	1afffff8 	bne	11e9c <__swbuf_r+0x104>
   11eb8:	e3a03001 	mov	r3, #1
   11ebc:	e5942000 	ldr	r2, [r4]
   11ec0:	eaffffd4 	b	11e18 <__swbuf_r+0x80>
   11ec4:	ebfff6f5 	bl	faa0 <__sinit>
   11ec8:	eaffffba 	b	11db8 <__swbuf_r+0x20>

00011ecc <__swbuf>:
   11ecc:	e59f300c 	ldr	r3, [pc, #12]	; 11ee0 <__swbuf+0x14>
   11ed0:	e1a02001 	mov	r2, r1
   11ed4:	e1a01000 	mov	r1, r0
   11ed8:	e5930000 	ldr	r0, [r3]
   11edc:	eaffffad 	b	11d98 <__swbuf_r>
   11ee0:	0001356c 	.word	0x0001356c

00011ee4 <_wcrtomb_r>:
   11ee4:	e92d4070 	push	{r4, r5, r6, lr}
   11ee8:	e251c000 	subs	ip, r1, #0
   11eec:	e24dd010 	sub	sp, sp, #16
   11ef0:	e1a05000 	mov	r5, r0
   11ef4:	e1a06003 	mov	r6, r3
   11ef8:	0a000010 	beq	11f40 <_wcrtomb_r+0x5c>
   11efc:	e59fc06c 	ldr	ip, [pc, #108]	; 11f70 <_wcrtomb_r+0x8c>
   11f00:	e59cc000 	ldr	ip, [ip]
   11f04:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   11f08:	e59fe064 	ldr	lr, [pc, #100]	; 11f74 <_wcrtomb_r+0x90>
   11f0c:	e35c0000 	cmp	ip, #0
   11f10:	01a0c00e 	moveq	ip, lr
   11f14:	e59c40e0 	ldr	r4, [ip, #224]	; 0xe0
   11f18:	e1a0e00f 	mov	lr, pc
   11f1c:	e12fff14 	bx	r4
   11f20:	e3700001 	cmn	r0, #1
   11f24:	03a02000 	moveq	r2, #0
   11f28:	03a0308a 	moveq	r3, #138	; 0x8a
   11f2c:	05862000 	streq	r2, [r6]
   11f30:	05853000 	streq	r3, [r5]
   11f34:	e28dd010 	add	sp, sp, #16
   11f38:	e8bd4070 	pop	{r4, r5, r6, lr}
   11f3c:	e12fff1e 	bx	lr
   11f40:	e59f2028 	ldr	r2, [pc, #40]	; 11f70 <_wcrtomb_r+0x8c>
   11f44:	e5921000 	ldr	r1, [r2]
   11f48:	e5911034 	ldr	r1, [r1, #52]	; 0x34
   11f4c:	e59f2020 	ldr	r2, [pc, #32]	; 11f74 <_wcrtomb_r+0x90>
   11f50:	e3510000 	cmp	r1, #0
   11f54:	01a01002 	moveq	r1, r2
   11f58:	e1a0200c 	mov	r2, ip
   11f5c:	e59140e0 	ldr	r4, [r1, #224]	; 0xe0
   11f60:	e28d1004 	add	r1, sp, #4
   11f64:	e1a0e00f 	mov	lr, pc
   11f68:	e12fff14 	bx	r4
   11f6c:	eaffffeb 	b	11f20 <_wcrtomb_r+0x3c>
   11f70:	0001356c 	.word	0x0001356c
   11f74:	00013998 	.word	0x00013998

00011f78 <wcrtomb>:
   11f78:	e92d4070 	push	{r4, r5, r6, lr}
   11f7c:	e59f3084 	ldr	r3, [pc, #132]	; 12008 <wcrtomb+0x90>
   11f80:	e5934000 	ldr	r4, [r3]
   11f84:	e3500000 	cmp	r0, #0
   11f88:	e1a05002 	mov	r5, r2
   11f8c:	e24dd010 	sub	sp, sp, #16
   11f90:	e5943034 	ldr	r3, [r4, #52]	; 0x34
   11f94:	e59f2070 	ldr	r2, [pc, #112]	; 1200c <wcrtomb+0x94>
   11f98:	0a000010 	beq	11fe0 <wcrtomb+0x68>
   11f9c:	e3530000 	cmp	r3, #0
   11fa0:	01a03002 	moveq	r3, r2
   11fa4:	e1a02001 	mov	r2, r1
   11fa8:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   11fac:	e1a01000 	mov	r1, r0
   11fb0:	e1a03005 	mov	r3, r5
   11fb4:	e1a00004 	mov	r0, r4
   11fb8:	e1a0e00f 	mov	lr, pc
   11fbc:	e12fff16 	bx	r6
   11fc0:	e3700001 	cmn	r0, #1
   11fc4:	03a02000 	moveq	r2, #0
   11fc8:	03a0308a 	moveq	r3, #138	; 0x8a
   11fcc:	05852000 	streq	r2, [r5]
   11fd0:	05843000 	streq	r3, [r4]
   11fd4:	e28dd010 	add	sp, sp, #16
   11fd8:	e8bd4070 	pop	{r4, r5, r6, lr}
   11fdc:	e12fff1e 	bx	lr
   11fe0:	e3530000 	cmp	r3, #0
   11fe4:	01a03002 	moveq	r3, r2
   11fe8:	e28d1004 	add	r1, sp, #4
   11fec:	e1a02000 	mov	r2, r0
   11ff0:	e59360e0 	ldr	r6, [r3, #224]	; 0xe0
   11ff4:	e1a00004 	mov	r0, r4
   11ff8:	e1a03005 	mov	r3, r5
   11ffc:	e1a0e00f 	mov	lr, pc
   12000:	e12fff16 	bx	r6
   12004:	eaffffed 	b	11fc0 <wcrtomb+0x48>
   12008:	0001356c 	.word	0x0001356c
   1200c:	00013998 	.word	0x00013998

00012010 <_wctomb_r>:
   12010:	e59fc024 	ldr	ip, [pc, #36]	; 1203c <_wctomb_r+0x2c>
   12014:	e59cc000 	ldr	ip, [ip]
   12018:	e59cc034 	ldr	ip, [ip, #52]	; 0x34
   1201c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
   12020:	e59fe018 	ldr	lr, [pc, #24]	; 12040 <_wctomb_r+0x30>
   12024:	e35c0000 	cmp	ip, #0
   12028:	01a0c00e 	moveq	ip, lr
   1202c:	e59ce0e0 	ldr	lr, [ip, #224]	; 0xe0
   12030:	e1a0c00e 	mov	ip, lr
   12034:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
   12038:	e12fff1c 	bx	ip
   1203c:	0001356c 	.word	0x0001356c
   12040:	00013998 	.word	0x00013998

00012044 <__ascii_wctomb>:
   12044:	e3510000 	cmp	r1, #0
   12048:	0a000005 	beq	12064 <__ascii_wctomb+0x20>
   1204c:	e35200ff 	cmp	r2, #255	; 0xff
   12050:	83a0308a 	movhi	r3, #138	; 0x8a
   12054:	95c12000 	strbls	r2, [r1]
   12058:	83e01000 	mvnhi	r1, #0
   1205c:	93a01001 	movls	r1, #1
   12060:	85803000 	strhi	r3, [r0]
   12064:	e1a00001 	mov	r0, r1
   12068:	e12fff1e 	bx	lr

0001206c <_write_r>:
   1206c:	e92d4070 	push	{r4, r5, r6, lr}
   12070:	e1a0e001 	mov	lr, r1
   12074:	e3a0c000 	mov	ip, #0
   12078:	e59f4030 	ldr	r4, [pc, #48]	; 120b0 <_write_r+0x44>
   1207c:	e1a01002 	mov	r1, r2
   12080:	e1a05000 	mov	r5, r0
   12084:	e1a02003 	mov	r2, r3
   12088:	e1a0000e 	mov	r0, lr
   1208c:	e584c000 	str	ip, [r4]
   12090:	eb0001aa 	bl	12740 <_write>
   12094:	e3700001 	cmn	r0, #1
   12098:	1a000002 	bne	120a8 <_write_r+0x3c>
   1209c:	e5943000 	ldr	r3, [r4]
   120a0:	e3530000 	cmp	r3, #0
   120a4:	15853000 	strne	r3, [r5]
   120a8:	e8bd4070 	pop	{r4, r5, r6, lr}
   120ac:	e12fff1e 	bx	lr
   120b0:	0003c1a4 	.word	0x0003c1a4

000120b4 <_close_r>:
   120b4:	e3a03000 	mov	r3, #0
   120b8:	e92d4070 	push	{r4, r5, r6, lr}
   120bc:	e59f4028 	ldr	r4, [pc, #40]	; 120ec <_close_r+0x38>
   120c0:	e1a05000 	mov	r5, r0
   120c4:	e1a00001 	mov	r0, r1
   120c8:	e5843000 	str	r3, [r4]
   120cc:	eb000166 	bl	1266c <_close>
   120d0:	e3700001 	cmn	r0, #1
   120d4:	1a000002 	bne	120e4 <_close_r+0x30>
   120d8:	e5943000 	ldr	r3, [r4]
   120dc:	e3530000 	cmp	r3, #0
   120e0:	15853000 	strne	r3, [r5]
   120e4:	e8bd4070 	pop	{r4, r5, r6, lr}
   120e8:	e12fff1e 	bx	lr
   120ec:	0003c1a4 	.word	0x0003c1a4

000120f0 <_fclose_r>:
   120f0:	e92d4070 	push	{r4, r5, r6, lr}
   120f4:	e2514000 	subs	r4, r1, #0
   120f8:	0a00000b 	beq	1212c <_fclose_r+0x3c>
   120fc:	e3500000 	cmp	r0, #0
   12100:	e1a06000 	mov	r6, r0
   12104:	0a000002 	beq	12114 <_fclose_r+0x24>
   12108:	e5903038 	ldr	r3, [r0, #56]	; 0x38
   1210c:	e3530000 	cmp	r3, #0
   12110:	0a000038 	beq	121f8 <_fclose_r+0x108>
   12114:	e5943064 	ldr	r3, [r4, #100]	; 0x64
   12118:	e3130001 	tst	r3, #1
   1211c:	0a000006 	beq	1213c <_fclose_r+0x4c>
   12120:	e1d430fc 	ldrsh	r3, [r4, #12]
   12124:	e3530000 	cmp	r3, #0
   12128:	1a000006 	bne	12148 <_fclose_r+0x58>
   1212c:	e3a05000 	mov	r5, #0
   12130:	e1a00005 	mov	r0, r5
   12134:	e8bd4070 	pop	{r4, r5, r6, lr}
   12138:	e12fff1e 	bx	lr
   1213c:	e1d430bc 	ldrh	r3, [r4, #12]
   12140:	e3130c02 	tst	r3, #512	; 0x200
   12144:	0a000034 	beq	1221c <_fclose_r+0x12c>
   12148:	e1a01004 	mov	r1, r4
   1214c:	e1a00006 	mov	r0, r6
   12150:	ebfff52e 	bl	f610 <__sflush_r>
   12154:	e594302c 	ldr	r3, [r4, #44]	; 0x2c
   12158:	e3530000 	cmp	r3, #0
   1215c:	e1a05000 	mov	r5, r0
   12160:	0a000005 	beq	1217c <_fclose_r+0x8c>
   12164:	e594101c 	ldr	r1, [r4, #28]
   12168:	e1a00006 	mov	r0, r6
   1216c:	e1a0e00f 	mov	lr, pc
   12170:	e12fff13 	bx	r3
   12174:	e3500000 	cmp	r0, #0
   12178:	b3e05000 	mvnlt	r5, #0
   1217c:	e1d430bc 	ldrh	r3, [r4, #12]
   12180:	e3130080 	tst	r3, #128	; 0x80
   12184:	1a00001d 	bne	12200 <_fclose_r+0x110>
   12188:	e5941030 	ldr	r1, [r4, #48]	; 0x30
   1218c:	e3510000 	cmp	r1, #0
   12190:	0a000005 	beq	121ac <_fclose_r+0xbc>
   12194:	e2843040 	add	r3, r4, #64	; 0x40
   12198:	e1510003 	cmp	r1, r3
   1219c:	11a00006 	movne	r0, r6
   121a0:	1bfff79f 	blne	10024 <_free_r>
   121a4:	e3a03000 	mov	r3, #0
   121a8:	e5843030 	str	r3, [r4, #48]	; 0x30
   121ac:	e5941044 	ldr	r1, [r4, #68]	; 0x44
   121b0:	e3510000 	cmp	r1, #0
   121b4:	0a000003 	beq	121c8 <_fclose_r+0xd8>
   121b8:	e1a00006 	mov	r0, r6
   121bc:	ebfff798 	bl	10024 <_free_r>
   121c0:	e3a03000 	mov	r3, #0
   121c4:	e5843044 	str	r3, [r4, #68]	; 0x44
   121c8:	ebfff6a1 	bl	fc54 <__sfp_lock_acquire>
   121cc:	e3a03000 	mov	r3, #0
   121d0:	e5942064 	ldr	r2, [r4, #100]	; 0x64
   121d4:	e3120001 	tst	r2, #1
   121d8:	e1c430bc 	strh	r3, [r4, #12]
   121dc:	0a00000b 	beq	12210 <_fclose_r+0x120>
   121e0:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   121e4:	ebfff9fa 	bl	109d4 <__retarget_lock_close_recursive>
   121e8:	ebfff69f 	bl	fc6c <__sfp_lock_release>
   121ec:	e1a00005 	mov	r0, r5
   121f0:	e8bd4070 	pop	{r4, r5, r6, lr}
   121f4:	e12fff1e 	bx	lr
   121f8:	ebfff628 	bl	faa0 <__sinit>
   121fc:	eaffffc4 	b	12114 <_fclose_r+0x24>
   12200:	e5941010 	ldr	r1, [r4, #16]
   12204:	e1a00006 	mov	r0, r6
   12208:	ebfff785 	bl	10024 <_free_r>
   1220c:	eaffffdd 	b	12188 <_fclose_r+0x98>
   12210:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   12214:	ebfff9f6 	bl	109f4 <__retarget_lock_release_recursive>
   12218:	eafffff0 	b	121e0 <_fclose_r+0xf0>
   1221c:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   12220:	ebfff9ed 	bl	109dc <__retarget_lock_acquire_recursive>
   12224:	e1d430fc 	ldrsh	r3, [r4, #12]
   12228:	e3530000 	cmp	r3, #0
   1222c:	1affffc5 	bne	12148 <_fclose_r+0x58>
   12230:	e5945064 	ldr	r5, [r4, #100]	; 0x64
   12234:	e2155001 	ands	r5, r5, #1
   12238:	1affffbb 	bne	1212c <_fclose_r+0x3c>
   1223c:	e5940058 	ldr	r0, [r4, #88]	; 0x58
   12240:	ebfff9eb 	bl	109f4 <__retarget_lock_release_recursive>
   12244:	e1a00005 	mov	r0, r5
   12248:	e8bd4070 	pop	{r4, r5, r6, lr}
   1224c:	e12fff1e 	bx	lr

00012250 <fclose>:
   12250:	e59f3008 	ldr	r3, [pc, #8]	; 12260 <fclose+0x10>
   12254:	e1a01000 	mov	r1, r0
   12258:	e5930000 	ldr	r0, [r3]
   1225c:	eaffffa3 	b	120f0 <_fclose_r>
   12260:	0001356c 	.word	0x0001356c

00012264 <_fstat_r>:
   12264:	e1a0c001 	mov	ip, r1
   12268:	e3a03000 	mov	r3, #0
   1226c:	e92d4070 	push	{r4, r5, r6, lr}
   12270:	e59f402c 	ldr	r4, [pc, #44]	; 122a4 <_fstat_r+0x40>
   12274:	e1a05000 	mov	r5, r0
   12278:	e1a01002 	mov	r1, r2
   1227c:	e1a0000c 	mov	r0, ip
   12280:	e5843000 	str	r3, [r4]
   12284:	eb0000fe 	bl	12684 <_fstat>
   12288:	e3700001 	cmn	r0, #1
   1228c:	1a000002 	bne	1229c <_fstat_r+0x38>
   12290:	e5943000 	ldr	r3, [r4]
   12294:	e3530000 	cmp	r3, #0
   12298:	15853000 	strne	r3, [r5]
   1229c:	e8bd4070 	pop	{r4, r5, r6, lr}
   122a0:	e12fff1e 	bx	lr
   122a4:	0003c1a4 	.word	0x0003c1a4

000122a8 <_isatty_r>:
   122a8:	e3a03000 	mov	r3, #0
   122ac:	e92d4070 	push	{r4, r5, r6, lr}
   122b0:	e59f4028 	ldr	r4, [pc, #40]	; 122e0 <_isatty_r+0x38>
   122b4:	e1a05000 	mov	r5, r0
   122b8:	e1a00001 	mov	r0, r1
   122bc:	e5843000 	str	r3, [r4]
   122c0:	eb0000fb 	bl	126b4 <_isatty>
   122c4:	e3700001 	cmn	r0, #1
   122c8:	1a000002 	bne	122d8 <_isatty_r+0x30>
   122cc:	e5943000 	ldr	r3, [r4]
   122d0:	e3530000 	cmp	r3, #0
   122d4:	15853000 	strne	r3, [r5]
   122d8:	e8bd4070 	pop	{r4, r5, r6, lr}
   122dc:	e12fff1e 	bx	lr
   122e0:	0003c1a4 	.word	0x0003c1a4

000122e4 <_lseek_r>:
   122e4:	e92d4070 	push	{r4, r5, r6, lr}
   122e8:	e1a0e001 	mov	lr, r1
   122ec:	e3a0c000 	mov	ip, #0
   122f0:	e59f4030 	ldr	r4, [pc, #48]	; 12328 <_lseek_r+0x44>
   122f4:	e1a01002 	mov	r1, r2
   122f8:	e1a05000 	mov	r5, r0
   122fc:	e1a02003 	mov	r2, r3
   12300:	e1a0000e 	mov	r0, lr
   12304:	e584c000 	str	ip, [r4]
   12308:	eb0000f5 	bl	126e4 <_lseek>
   1230c:	e3700001 	cmn	r0, #1
   12310:	1a000002 	bne	12320 <_lseek_r+0x3c>
   12314:	e5943000 	ldr	r3, [r4]
   12318:	e3530000 	cmp	r3, #0
   1231c:	15853000 	strne	r3, [r5]
   12320:	e8bd4070 	pop	{r4, r5, r6, lr}
   12324:	e12fff1e 	bx	lr
   12328:	0003c1a4 	.word	0x0003c1a4

0001232c <_read_r>:
   1232c:	e92d4070 	push	{r4, r5, r6, lr}
   12330:	e1a0e001 	mov	lr, r1
   12334:	e3a0c000 	mov	ip, #0
   12338:	e59f4030 	ldr	r4, [pc, #48]	; 12370 <_read_r+0x44>
   1233c:	e1a01002 	mov	r1, r2
   12340:	e1a05000 	mov	r5, r0
   12344:	e1a02003 	mov	r2, r3
   12348:	e1a0000e 	mov	r0, lr
   1234c:	e584c000 	str	ip, [r4]
   12350:	eb0000e9 	bl	126fc <_read>
   12354:	e3700001 	cmn	r0, #1
   12358:	1a000002 	bne	12368 <_read_r+0x3c>
   1235c:	e5943000 	ldr	r3, [r4]
   12360:	e3530000 	cmp	r3, #0
   12364:	15853000 	strne	r3, [r5]
   12368:	e8bd4070 	pop	{r4, r5, r6, lr}
   1236c:	e12fff1e 	bx	lr
   12370:	0003c1a4 	.word	0x0003c1a4

00012374 <cleanup_glue>:
   12374:	e92d4070 	push	{r4, r5, r6, lr}
   12378:	e1a04001 	mov	r4, r1
   1237c:	e5911000 	ldr	r1, [r1]
   12380:	e3510000 	cmp	r1, #0
   12384:	e1a05000 	mov	r5, r0
   12388:	1bfffff9 	blne	12374 <cleanup_glue>
   1238c:	e1a01004 	mov	r1, r4
   12390:	e1a00005 	mov	r0, r5
   12394:	ebfff722 	bl	10024 <_free_r>
   12398:	e8bd4070 	pop	{r4, r5, r6, lr}
   1239c:	e12fff1e 	bx	lr

000123a0 <_reclaim_reent>:
   123a0:	e59f30e8 	ldr	r3, [pc, #232]	; 12490 <_reclaim_reent+0xf0>
   123a4:	e5933000 	ldr	r3, [r3]
   123a8:	e1530000 	cmp	r3, r0
   123ac:	012fff1e 	bxeq	lr
   123b0:	e590304c 	ldr	r3, [r0, #76]	; 0x4c
   123b4:	e3530000 	cmp	r3, #0
   123b8:	e92d4070 	push	{r4, r5, r6, lr}
   123bc:	e1a05000 	mov	r5, r0
   123c0:	0a00000f 	beq	12404 <_reclaim_reent+0x64>
   123c4:	e3a06000 	mov	r6, #0
   123c8:	e7931006 	ldr	r1, [r3, r6]
   123cc:	e3510000 	cmp	r1, #0
   123d0:	0a000005 	beq	123ec <_reclaim_reent+0x4c>
   123d4:	e5914000 	ldr	r4, [r1]
   123d8:	e1a00005 	mov	r0, r5
   123dc:	ebfff710 	bl	10024 <_free_r>
   123e0:	e2541000 	subs	r1, r4, #0
   123e4:	1afffffa 	bne	123d4 <_reclaim_reent+0x34>
   123e8:	e595304c 	ldr	r3, [r5, #76]	; 0x4c
   123ec:	e2866004 	add	r6, r6, #4
   123f0:	e3560080 	cmp	r6, #128	; 0x80
   123f4:	1afffff3 	bne	123c8 <_reclaim_reent+0x28>
   123f8:	e1a01003 	mov	r1, r3
   123fc:	e1a00005 	mov	r0, r5
   12400:	ebfff707 	bl	10024 <_free_r>
   12404:	e5951040 	ldr	r1, [r5, #64]	; 0x40
   12408:	e3510000 	cmp	r1, #0
   1240c:	11a00005 	movne	r0, r5
   12410:	1bfff703 	blne	10024 <_free_r>
   12414:	e5951148 	ldr	r1, [r5, #328]	; 0x148
   12418:	e3510000 	cmp	r1, #0
   1241c:	0a000008 	beq	12444 <_reclaim_reent+0xa4>
   12420:	e2856f53 	add	r6, r5, #332	; 0x14c
   12424:	e1510006 	cmp	r1, r6
   12428:	0a000005 	beq	12444 <_reclaim_reent+0xa4>
   1242c:	e5914000 	ldr	r4, [r1]
   12430:	e1a00005 	mov	r0, r5
   12434:	ebfff6fa 	bl	10024 <_free_r>
   12438:	e1560004 	cmp	r6, r4
   1243c:	e1a01004 	mov	r1, r4
   12440:	1afffff9 	bne	1242c <_reclaim_reent+0x8c>
   12444:	e5951054 	ldr	r1, [r5, #84]	; 0x54
   12448:	e3510000 	cmp	r1, #0
   1244c:	11a00005 	movne	r0, r5
   12450:	1bfff6f3 	blne	10024 <_free_r>
   12454:	e5953038 	ldr	r3, [r5, #56]	; 0x38
   12458:	e3530000 	cmp	r3, #0
   1245c:	1a000001 	bne	12468 <_reclaim_reent+0xc8>
   12460:	e8bd4070 	pop	{r4, r5, r6, lr}
   12464:	e12fff1e 	bx	lr
   12468:	e595303c 	ldr	r3, [r5, #60]	; 0x3c
   1246c:	e1a00005 	mov	r0, r5
   12470:	e1a0e00f 	mov	lr, pc
   12474:	e12fff13 	bx	r3
   12478:	e59512e0 	ldr	r1, [r5, #736]	; 0x2e0
   1247c:	e3510000 	cmp	r1, #0
   12480:	0afffff6 	beq	12460 <_reclaim_reent+0xc0>
   12484:	e1a00005 	mov	r0, r5
   12488:	e8bd4070 	pop	{r4, r5, r6, lr}
   1248c:	eaffffb8 	b	12374 <cleanup_glue>
   12490:	0001356c 	.word	0x0001356c

00012494 <__aeabi_uldivmod>:
   12494:	e3530000 	cmp	r3, #0
   12498:	03520000 	cmpeq	r2, #0
   1249c:	1a000004 	bne	124b4 <__aeabi_uldivmod+0x20>
   124a0:	e3510000 	cmp	r1, #0
   124a4:	03500000 	cmpeq	r0, #0
   124a8:	13e01000 	mvnne	r1, #0
   124ac:	13e00000 	mvnne	r0, #0
   124b0:	eaffec7d 	b	d6ac <__aeabi_idiv0>
   124b4:	e24dd008 	sub	sp, sp, #8
   124b8:	e92d6000 	push	{sp, lr}
   124bc:	eb000003 	bl	124d0 <__udivmoddi4>
   124c0:	e59de004 	ldr	lr, [sp, #4]
   124c4:	e28dd008 	add	sp, sp, #8
   124c8:	e8bd000c 	pop	{r2, r3}
   124cc:	e12fff1e 	bx	lr

000124d0 <__udivmoddi4>:
   124d0:	e1510003 	cmp	r1, r3
   124d4:	e92d4ff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   124d8:	01500002 	cmpeq	r0, r2
   124dc:	e1a04000 	mov	r4, r0
   124e0:	e1a05001 	mov	r5, r1
   124e4:	e59da028 	ldr	sl, [sp, #40]	; 0x28
   124e8:	33a00000 	movcc	r0, #0
   124ec:	33a01000 	movcc	r1, #0
   124f0:	3a00003d 	bcc	125ec <__udivmoddi4+0x11c>
   124f4:	e1a00002 	mov	r0, r2
   124f8:	e1a01003 	mov	r1, r3
   124fc:	e1a08002 	mov	r8, r2
   12500:	e1a09003 	mov	r9, r3
   12504:	eb00003c 	bl	125fc <__clzdi2>
   12508:	e1a01005 	mov	r1, r5
   1250c:	e1a0b000 	mov	fp, r0
   12510:	e1a00004 	mov	r0, r4
   12514:	eb000038 	bl	125fc <__clzdi2>
   12518:	e04bb000 	sub	fp, fp, r0
   1251c:	e24b2020 	sub	r2, fp, #32
   12520:	e1a07b19 	lsl	r7, r9, fp
   12524:	e1877218 	orr	r7, r7, r8, lsl r2
   12528:	e26bc020 	rsb	ip, fp, #32
   1252c:	e1877c38 	orr	r7, r7, r8, lsr ip
   12530:	e1550007 	cmp	r5, r7
   12534:	e1a06b18 	lsl	r6, r8, fp
   12538:	01540006 	cmpeq	r4, r6
   1253c:	33a00000 	movcc	r0, #0
   12540:	33a01000 	movcc	r1, #0
   12544:	3a000005 	bcc	12560 <__udivmoddi4+0x90>
   12548:	e3a0e001 	mov	lr, #1
   1254c:	e0544006 	subs	r4, r4, r6
   12550:	e1a0121e 	lsl	r1, lr, r2
   12554:	e1811c3e 	orr	r1, r1, lr, lsr ip
   12558:	e0c55007 	sbc	r5, r5, r7
   1255c:	e1a00b1e 	lsl	r0, lr, fp
   12560:	e35b0000 	cmp	fp, #0
   12564:	0a000020 	beq	125ec <__udivmoddi4+0x11c>
   12568:	e1b070a7 	lsrs	r7, r7, #1
   1256c:	e1a06066 	rrx	r6, r6
   12570:	e1a0e00b 	mov	lr, fp
   12574:	ea000007 	b	12598 <__udivmoddi4+0xc8>
   12578:	e0544006 	subs	r4, r4, r6
   1257c:	e0c55007 	sbc	r5, r5, r7
   12580:	e0944004 	adds	r4, r4, r4
   12584:	e0a55005 	adc	r5, r5, r5
   12588:	e2944001 	adds	r4, r4, #1
   1258c:	e2a55000 	adc	r5, r5, #0
   12590:	e25ee001 	subs	lr, lr, #1
   12594:	0a000006 	beq	125b4 <__udivmoddi4+0xe4>
   12598:	e1550007 	cmp	r5, r7
   1259c:	01540006 	cmpeq	r4, r6
   125a0:	2afffff4 	bcs	12578 <__udivmoddi4+0xa8>
   125a4:	e0944004 	adds	r4, r4, r4
   125a8:	e0a55005 	adc	r5, r5, r5
   125ac:	e25ee001 	subs	lr, lr, #1
   125b0:	1afffff8 	bne	12598 <__udivmoddi4+0xc8>
   125b4:	e1a0eb34 	lsr	lr, r4, fp
   125b8:	e18eec15 	orr	lr, lr, r5, lsl ip
   125bc:	e18ee235 	orr	lr, lr, r5, lsr r2
   125c0:	e0906004 	adds	r6, r0, r4
   125c4:	e1a0400e 	mov	r4, lr
   125c8:	e0a17005 	adc	r7, r1, r5
   125cc:	e1a01b35 	lsr	r1, r5, fp
   125d0:	e1a05001 	mov	r5, r1
   125d4:	e1a01b11 	lsl	r1, r1, fp
   125d8:	e181121e 	orr	r1, r1, lr, lsl r2
   125dc:	e1a00b1e 	lsl	r0, lr, fp
   125e0:	e1811c3e 	orr	r1, r1, lr, lsr ip
   125e4:	e0560000 	subs	r0, r6, r0
   125e8:	e0c71001 	sbc	r1, r7, r1
   125ec:	e35a0000 	cmp	sl, #0
   125f0:	188a0030 	stmne	sl, {r4, r5}
   125f4:	e8bd4ff8 	pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
   125f8:	e12fff1e 	bx	lr

000125fc <__clzdi2>:
   125fc:	e92d4010 	push	{r4, lr}
   12600:	e3510000 	cmp	r1, #0
   12604:	1a000002 	bne	12614 <__clzdi2+0x18>
   12608:	eb000005 	bl	12624 <__clzsi2>
   1260c:	e2800020 	add	r0, r0, #32
   12610:	ea000001 	b	1261c <__clzdi2+0x20>
   12614:	e1a00001 	mov	r0, r1
   12618:	eb000001 	bl	12624 <__clzsi2>
   1261c:	e8bd4010 	pop	{r4, lr}
   12620:	e12fff1e 	bx	lr

00012624 <__clzsi2>:
   12624:	e3a0101c 	mov	r1, #28
   12628:	e3500801 	cmp	r0, #65536	; 0x10000
   1262c:	21a00820 	lsrcs	r0, r0, #16
   12630:	22411010 	subcs	r1, r1, #16
   12634:	e3500c01 	cmp	r0, #256	; 0x100
   12638:	21a00420 	lsrcs	r0, r0, #8
   1263c:	22411008 	subcs	r1, r1, #8
   12640:	e3500010 	cmp	r0, #16
   12644:	21a00220 	lsrcs	r0, r0, #4
   12648:	22411004 	subcs	r1, r1, #4
   1264c:	e28f2008 	add	r2, pc, #8
   12650:	e7d20000 	ldrb	r0, [r2, r0]
   12654:	e0800001 	add	r0, r0, r1
   12658:	e12fff1e 	bx	lr
   1265c:	02020304 	.word	0x02020304
   12660:	01010101 	.word	0x01010101
	...

0001266c <_close>:
   1266c:	e3a02058 	mov	r2, #88	; 0x58
   12670:	e59f3008 	ldr	r3, [pc, #8]	; 12680 <_close+0x14>
   12674:	e3e00000 	mvn	r0, #0
   12678:	e5832000 	str	r2, [r3]
   1267c:	e12fff1e 	bx	lr
   12680:	0003c1a4 	.word	0x0003c1a4

00012684 <_fstat>:
   12684:	e3a02058 	mov	r2, #88	; 0x58
   12688:	e59f3008 	ldr	r3, [pc, #8]	; 12698 <_fstat+0x14>
   1268c:	e3e00000 	mvn	r0, #0
   12690:	e5832000 	str	r2, [r3]
   12694:	e12fff1e 	bx	lr
   12698:	0003c1a4 	.word	0x0003c1a4

0001269c <_getpid>:
   1269c:	e3a02058 	mov	r2, #88	; 0x58
   126a0:	e59f3008 	ldr	r3, [pc, #8]	; 126b0 <_getpid+0x14>
   126a4:	e3e00000 	mvn	r0, #0
   126a8:	e5832000 	str	r2, [r3]
   126ac:	e12fff1e 	bx	lr
   126b0:	0003c1a4 	.word	0x0003c1a4

000126b4 <_isatty>:
   126b4:	e3a02058 	mov	r2, #88	; 0x58
   126b8:	e59f3008 	ldr	r3, [pc, #8]	; 126c8 <_isatty+0x14>
   126bc:	e3a00000 	mov	r0, #0
   126c0:	e5832000 	str	r2, [r3]
   126c4:	e12fff1e 	bx	lr
   126c8:	0003c1a4 	.word	0x0003c1a4

000126cc <_kill>:
   126cc:	e3a02058 	mov	r2, #88	; 0x58
   126d0:	e59f3008 	ldr	r3, [pc, #8]	; 126e0 <_kill+0x14>
   126d4:	e3e00000 	mvn	r0, #0
   126d8:	e5832000 	str	r2, [r3]
   126dc:	e12fff1e 	bx	lr
   126e0:	0003c1a4 	.word	0x0003c1a4

000126e4 <_lseek>:
   126e4:	e3a02058 	mov	r2, #88	; 0x58
   126e8:	e59f3008 	ldr	r3, [pc, #8]	; 126f8 <_lseek+0x14>
   126ec:	e3e00000 	mvn	r0, #0
   126f0:	e5832000 	str	r2, [r3]
   126f4:	e12fff1e 	bx	lr
   126f8:	0003c1a4 	.word	0x0003c1a4

000126fc <_read>:
   126fc:	e3a02058 	mov	r2, #88	; 0x58
   12700:	e59f3008 	ldr	r3, [pc, #8]	; 12710 <_read+0x14>
   12704:	e3e00000 	mvn	r0, #0
   12708:	e5832000 	str	r2, [r3]
   1270c:	e12fff1e 	bx	lr
   12710:	0003c1a4 	.word	0x0003c1a4

00012714 <_sbrk>:
   12714:	e59f201c 	ldr	r2, [pc, #28]	; 12738 <_sbrk+0x24>
   12718:	e5923000 	ldr	r3, [r2]
   1271c:	e59f1018 	ldr	r1, [pc, #24]	; 1273c <_sbrk+0x28>
   12720:	e3530000 	cmp	r3, #0
   12724:	01a03001 	moveq	r3, r1
   12728:	e0830000 	add	r0, r3, r0
   1272c:	e5820000 	str	r0, [r2]
   12730:	e1a00003 	mov	r0, r3
   12734:	e12fff1e 	bx	lr
   12738:	0003c174 	.word	0x0003c174
   1273c:	0003c1a8 	.word	0x0003c1a8

00012740 <_write>:
   12740:	e3a02058 	mov	r2, #88	; 0x58
   12744:	e59f3008 	ldr	r3, [pc, #8]	; 12754 <_write+0x14>
   12748:	e3e00000 	mvn	r0, #0
   1274c:	e5832000 	str	r2, [r3]
   12750:	e12fff1e 	bx	lr
   12754:	0003c1a4 	.word	0x0003c1a4

00012758 <_exit>:
   12758:	eafffffe 	b	12758 <_exit>

Disassembly of section .fini:

0001275c <_fini>:
   1275c:	e1a0c00d 	mov	ip, sp
   12760:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
   12764:	e24cb004 	sub	fp, ip, #4
   12768:	e24bd028 	sub	sp, fp, #40	; 0x28
   1276c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
   12770:	e12fff1e 	bx	lr
